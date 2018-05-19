// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_18_s1.s
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
   random seed:	959382281
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

	setx 0x559564ddc0f0e9f2, %g1, %g0
	setx 0x53b1b0df494eed76, %g1, %g1
	setx 0x7be9da9f55a3a1ec, %g1, %g2
	setx 0x091412d6fc2519c8, %g1, %g3
	setx 0xedc17ba89240a741, %g1, %g4
	setx 0x9b65def9482e57fa, %g1, %g5
	setx 0x43f7b1bdea14f4a8, %g1, %g6
	setx 0x6a6173809fefc841, %g1, %g7
	setx 0xc7517809888c4ce1, %g1, %r16
	setx 0x1547ac4000d2d7c1, %g1, %r17
	setx 0x680223cff2b9d3e1, %g1, %r18
	setx 0xa4ba44dd05c578d2, %g1, %r19
	setx 0xbebbdd5b6a7923e4, %g1, %r20
	setx 0xb3eac703661eeaec, %g1, %r21
	setx 0xf5fae0c77fc5f318, %g1, %r22
	setx 0x59c4f92c4a0ef601, %g1, %r23
	setx 0x58f0906b598805fc, %g1, %r24
	setx 0xd8630651d81869c5, %g1, %r25
	setx 0x0fa56373bc5da573, %g1, %r26
	setx 0x7af70465820aaa1e, %g1, %r27
	setx 0xc6871aa6ced6769d, %g1, %r28
	setx 0x20a2a52f87f30f0b, %g1, %r29
	setx 0xa55dc72cb80adece, %g1, %r30
	setx 0xacf6a229e7893877, %g1, %r31
	save
	setx 0xa444f70cce3cb093, %g1, %r16
	setx 0xe02964a98b69ff43, %g1, %r17
	setx 0xee6b2e9be47d1da6, %g1, %r18
	setx 0xded39b4e8651b350, %g1, %r19
	setx 0xd95b0e8e439df61b, %g1, %r20
	setx 0xac0c1588f409b47c, %g1, %r21
	setx 0xa2f622987fa0b3b3, %g1, %r22
	setx 0x3e068752b14c06cf, %g1, %r23
	setx 0xe12392cb5f5a04ed, %g1, %r24
	setx 0xca3c89f0950016b3, %g1, %r25
	setx 0x81460d8d13a0a006, %g1, %r26
	setx 0x4cdcaf6e416b9a55, %g1, %r27
	setx 0xf006138b148573d5, %g1, %r28
	setx 0xd5fdd87ae63dc31c, %g1, %r29
	setx 0x2a08e80390956c6b, %g1, %r30
	setx 0x6d7d2cfc6efd392c, %g1, %r31
	save
	setx 0xf82a40e491186854, %g1, %r16
	setx 0xb7a65b49ebf6b6cf, %g1, %r17
	setx 0x2a4c88e015718d48, %g1, %r18
	setx 0x7e6a2781853ea003, %g1, %r19
	setx 0x848a1003bb5f0272, %g1, %r20
	setx 0xb37f283b3d462d9f, %g1, %r21
	setx 0x0540a8684642fb5b, %g1, %r22
	setx 0x11300105e4ba6f71, %g1, %r23
	setx 0xa0321dab00e06824, %g1, %r24
	setx 0x15dcd9722276ef83, %g1, %r25
	setx 0x6678450d1f399888, %g1, %r26
	setx 0x6cee76d44c4a5d60, %g1, %r27
	setx 0x052799c80343962e, %g1, %r28
	setx 0x01be865bae3af246, %g1, %r29
	setx 0x249c8c9d2f2526ba, %g1, %r30
	setx 0xfa9f1e2c6a2877ad, %g1, %r31
	save
	setx 0x2c35ebe4244b4cb3, %g1, %r16
	setx 0xfcf52fd3dec84577, %g1, %r17
	setx 0xa02668aa19495a96, %g1, %r18
	setx 0xfee291bfa8e7fd7e, %g1, %r19
	setx 0xdd1e5bef1603994d, %g1, %r20
	setx 0x1adf6d701c8438a9, %g1, %r21
	setx 0x57b7e21e6cb99100, %g1, %r22
	setx 0xf7d0e2f6717c3190, %g1, %r23
	setx 0xba4942859ae663b8, %g1, %r24
	setx 0xfb1e100a0b41867b, %g1, %r25
	setx 0x9ddc0899d2954bf7, %g1, %r26
	setx 0x91a4d0b2a6f14202, %g1, %r27
	setx 0x961e4d3d02b1d0dd, %g1, %r28
	setx 0x42f197338b7b0ce2, %g1, %r29
	setx 0xc28a2107219f3768, %g1, %r30
	setx 0xa6c294725fc0d1f8, %g1, %r31
	save
	setx 0xcb3b557d1e5ad96e, %g1, %r16
	setx 0x821275d2122162b5, %g1, %r17
	setx 0xed75bf672641db70, %g1, %r18
	setx 0x6a6358ef7201b5b3, %g1, %r19
	setx 0x9bd165dfcb27b459, %g1, %r20
	setx 0x5766ba43a454c8be, %g1, %r21
	setx 0xdeaba528f6463daa, %g1, %r22
	setx 0x229422cd4e77e2d1, %g1, %r23
	setx 0x0cb917e27f3a5959, %g1, %r24
	setx 0xa4cf930f782f3452, %g1, %r25
	setx 0xbc9bf9c2f8297d2e, %g1, %r26
	setx 0x9e025c263da876cb, %g1, %r27
	setx 0xc152953c08e443d0, %g1, %r28
	setx 0x13157bcf0c0ab7ff, %g1, %r29
	setx 0x43bd0c8db8e1f56c, %g1, %r30
	setx 0xa67ed168f224696a, %g1, %r31
	save
	setx 0x2332966a9fad2869, %g1, %r16
	setx 0x99fbd0b75bf16d68, %g1, %r17
	setx 0x162ee840d172ac44, %g1, %r18
	setx 0xa9f21b2ecbe82eec, %g1, %r19
	setx 0x7b43fcfb3eec8e35, %g1, %r20
	setx 0x5fe107fb509864fa, %g1, %r21
	setx 0x9289ca2e219348d2, %g1, %r22
	setx 0xafe4d8dcde0aa0f1, %g1, %r23
	setx 0x78b15d288ab2caad, %g1, %r24
	setx 0x2715fc9cee91d8bd, %g1, %r25
	setx 0xea848986dc1a3d9d, %g1, %r26
	setx 0x0181bdf0455200ab, %g1, %r27
	setx 0xce357f85750b0330, %g1, %r28
	setx 0x792c2b2fa06867e4, %g1, %r29
	setx 0xcad6319e9a7ae3f6, %g1, %r30
	setx 0x9008bb8b51de7e1a, %g1, %r31
	save
	setx 0x978a8fa98402eea2, %g1, %r16
	setx 0x07657e2122341ec2, %g1, %r17
	setx 0x31496585a48dddd6, %g1, %r18
	setx 0x26de50d98b78d7e8, %g1, %r19
	setx 0x9a8c38a2aed978ff, %g1, %r20
	setx 0xefc5f2d368195d7c, %g1, %r21
	setx 0x3954c839df03ac53, %g1, %r22
	setx 0xd4737a0b30f3479c, %g1, %r23
	setx 0xd7fe9163cd1d807c, %g1, %r24
	setx 0x5879cf8d0c59749b, %g1, %r25
	setx 0x5a26570a8a1d8cbf, %g1, %r26
	setx 0xe6fefdc49c634ff5, %g1, %r27
	setx 0xd90930480cb963f7, %g1, %r28
	setx 0xfb2097899b997a4b, %g1, %r29
	setx 0xae7ad3b3ac3ebfca, %g1, %r30
	setx 0x352a7e1e2cad0828, %g1, %r31
	save
	setx 0x525a363f350fa44d, %g1, %r16
	setx 0x223b3cf0c390deef, %g1, %r17
	setx 0xb18accc3aee6c4c3, %g1, %r18
	setx 0xf3c2a249acba8460, %g1, %r19
	setx 0x6cc62a9baf018dfe, %g1, %r20
	setx 0xa0b658d169da5038, %g1, %r21
	setx 0x83e8d0678606605f, %g1, %r22
	setx 0x8535b74dcc91435f, %g1, %r23
	setx 0x2f0f334c17a20585, %g1, %r24
	setx 0x3eb88aff02e903f9, %g1, %r25
	setx 0x71533a9e6481be05, %g1, %r26
	setx 0xd48d767efa0751f9, %g1, %r27
	setx 0xff49c7593187072e, %g1, %r28
	setx 0x0a91dae1ca9a979e, %g1, %r29
	setx 0xa6220d774b545bd9, %g1, %r30
	setx 0xf1d9e07f5aed4b46, %g1, %r31
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
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_0:
	setx	0x180308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5212a  ! 5: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_1:
	setx	0x1a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1cc  ! 9: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_0:
	mov	0x23, %r14
	.word 0xfadb89e0  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_1:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 11: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 16)
	.word 0xbde4c000  ! 16: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_2:
	setx	0x1d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_0:
	mov	0x35, %r14
	.word 0xfaf38400  ! 21: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_1:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 23: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 37)
	.word 0xbabca057  ! 32: XNORcc_I	xnorcc 	%r18, 0x0057, %r29
T0_asi_reg_rd_2:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5e48000  ! 34: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde48000  ! 35: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_3:
	setx	0x1d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_4:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe5200a  ! 46: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_2:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 48: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe44000  ! 50: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe5c000  ! 51: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe4a15a  ! 54: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_4:
	setx	0x1d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_3:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 62: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_5:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4606e  ! 69: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc25a1ec  ! 76: SUB_I	sub 	%r22, 0x01ec, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_6:
	setx	0x1d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_7:
	setx	0x1d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 19)
	.word 0xba34a049  ! 92: SUBC_I	orn 	%r18, 0x0049, %r29
T0_asi_reg_rd_5:
	mov	0x30, %r14
	.word 0xf0db8e80  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e48000  ! 97: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_8:
	setx	0x1e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 102: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_9:
	setx	0x1c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 105: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_10:
	setx	0x1c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 109: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_11:
	setx	0x1d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e521a0  ! 115: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_12:
	setx	0x1c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 122: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e50000  ! 126: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_6:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e44000  ! 131: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e5e1a5  ! 132: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_7:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_8:
	mov	0x28, %r14
	.word 0xfcdb8e40  ! 135: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_14:
	setx	0x1c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_9:
	mov	0x7, %r14
	.word 0xfcdb8e80  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_15:
	setx	0x1e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 147: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe5a05a  ! 150: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e44000  ! 151: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e5a0fe  ! 154: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_10:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 157: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e4e1c9  ! 158: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde54000  ! 162: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_11:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e5a083  ! 167: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_12:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_16:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_4:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 174: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb8258000  ! 175: SUB_R	sub 	%r22, %r0, %r28
T0_asi_reg_wr_5:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 180: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_13:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 181: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb205a127  ! 182: ADD_I	add 	%r22, 0x0127, %r25
	.word 0xb1e50000  ! 183: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_17:
	setx	0x1e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_14:
	mov	0x22, %r14
	.word 0xf8db8e80  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_18:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_15:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_19:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56020  ! 200: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4c000  ! 202: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb8bc6004  ! 206: XNORcc_I	xnorcc 	%r17, 0x0004, %r28
T0_asi_reg_wr_6:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 207: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xba14a141  ! 211: OR_I	or 	%r18, 0x0141, %r29
	.word 0xb9e5a024  ! 212: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 214: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe521e9  ! 216: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb4b4e025  ! 218: SUBCcc_I	orncc 	%r19, 0x0025, %r26
	.word 0xb9e5a121  ! 219: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb8b50000  ! 220: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xb43cc000  ! 222: XNOR_R	xnor 	%r19, %r0, %r26
cpu_intr_0_20:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_21:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 227: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e46178  ! 228: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e44000  ! 229: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e560b2  ! 232: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe4208b  ! 234: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_22:
	setx	0x1d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60c2166  ! 241: AND_I	and 	%r16, 0x0166, %r27
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_8:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 243: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde5610c  ! 244: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4219e  ! 246: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, c)
	.word 0xba3ca1bd  ! 255: XNOR_I	xnor 	%r18, 0x01bd, %r29
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, b)
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e46185  ! 263: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_23:
	setx	0x1d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x1f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1c7  ! 267: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e54000  ! 271: SAVE_R	save	%r21, %r0, %r24
	.word 0xb6a50000  ! 273: SUBcc_R	subcc 	%r20, %r0, %r27
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_25:
	setx	0x1e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 283: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3e5e121  ! 284: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_26:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e110  ! 286: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_27:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a113  ! 291: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a0af  ! 292: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e54000  ! 295: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_28:
	setx	0x1f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 302: SAVE_R	save	%r21, %r0, %r25
	.word 0xb5e48000  ! 303: SAVE_R	save	%r18, %r0, %r26
	.word 0xbbe460f7  ! 304: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_29:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 308: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_30:
	setx	0x1e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_17:
	mov	0x10, %r14
	.word 0xf6db8e80  ! 322: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_18:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 325: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7e4e188  ! 328: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_31:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_10:
	mov	0x1b, %r14
	.word 0xf6f38e60  ! 338: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e52003  ! 339: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_32:
	setx	0x1f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 344: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_11:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 353: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_12:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 354: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e4e1a7  ! 355: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_33:
	setx	0x1e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_13:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 358: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 18)
	.word 0xbcc4e047  ! 363: ADDCcc_I	addccc 	%r19, 0x0047, %r30
	.word 0xba3461b1  ! 365: ORN_I	orn 	%r17, 0x01b1, %r29
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_19:
	mov	0x2c, %r14
	.word 0xfcdb8400  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfe521b1  ! 370: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_20:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e5c000  ! 373: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe48000  ! 374: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_21:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 378: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_22:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbc35e16b  ! 383: ORN_I	orn 	%r23, 0x016b, %r30
	.word 0xb5e54000  ! 386: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_14:
	mov	0x37, %r14
	.word 0xfef38e80  ! 387: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5e5e18f  ! 388: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_34:
	setx	0x1d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 394: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e5a1b3  ! 395: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe521d6  ! 397: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_15:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 398: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_23:
	mov	0x2f, %r14
	.word 0xfcdb8e80  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbf2d7001  ! 406: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xbbe5a015  ! 408: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e42192  ! 410: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_16:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 413: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_36:
	setx	0x1d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 415: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e54000  ! 416: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_37:
	setx	0x1c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x1f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a00d  ! 425: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_24:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3e54000  ! 428: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_17:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 430: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_39:
	setx	0x1d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c5000  ! 432: SRAX_R	srax	%r17, %r0, %r30
	.word 0xb08dc000  ! 434: ANDcc_R	andcc 	%r23, %r0, %r24
T0_asi_reg_rd_25:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe54000  ! 441: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 14)
	.word 0xb97ca401  ! 443: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xb0a520d1  ! 447: SUBcc_I	subcc 	%r20, 0x00d1, %r24
T0_asi_reg_rd_26:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 450: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfe421e7  ! 451: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_27:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 452: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe58000  ! 453: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 459: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_28:
	mov	0x12, %r14
	.word 0xfedb8e80  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3e58000  ! 462: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_29:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e40000  ! 464: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 10)
	.word 0xbcb54000  ! 471: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xb3e42110  ! 472: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_30:
	mov	0x32, %r14
	.word 0xfadb8e80  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1e50000  ! 475: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde54000  ! 476: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_40:
	setx	0x21010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_19:
	mov	0x13, %r14
	.word 0xf0f38400  ! 490: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde50000  ! 491: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_41:
	setx	0x200301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 503: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e44000  ! 505: SAVE_R	save	%r17, %r0, %r25
	.word 0xbbe40000  ! 510: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e44000  ! 512: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_42:
	setx	0x230035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 516: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e58000  ! 517: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_43:
	setx	0x220032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 522: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_44:
	setx	0x210127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e05e  ! 527: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5e082  ! 528: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_45:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560bf  ! 533: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe40000  ! 534: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe54000  ! 536: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e5e1d1  ! 537: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb52d6001  ! 538: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xb1e40000  ! 539: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_46:
	setx	0x200010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_47:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_31:
	mov	0x1a, %r14
	.word 0xfcdb8400  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1e4e061  ! 545: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e1ce  ! 546: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3504000  ! 550: RDPR_TNPC	<illegal instruction>
cpu_intr_0_48:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_32:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e58000  ! 557: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e48000  ! 561: SAVE_R	save	%r18, %r0, %r24
	.word 0xba854000  ! 563: ADDcc_R	addcc 	%r21, %r0, %r29
	.word 0xbfe5e133  ! 564: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e520dd  ! 573: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e46139  ! 574: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_33:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfe5a13c  ! 577: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e54000  ! 579: SAVE_R	save	%r21, %r0, %r28
	.word 0xb52de001  ! 581: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xbde42114  ! 582: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_20:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 583: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb7e4c000  ! 584: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_34:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_49:
	setx	0x230326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 591: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e5614c  ! 592: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e58000  ! 593: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_50:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 596: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe4e0d7  ! 597: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbcc5613c  ! 598: ADDCcc_I	addccc 	%r21, 0x013c, %r30
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_35:
	mov	0xf, %r14
	.word 0xf6db84a0  ! 610: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb28ca0cb  ! 612: ANDcc_I	andcc 	%r18, 0x00cb, %r25
	.word 0xb5e58000  ! 613: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_51:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 623: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e58000  ! 624: SAVE_R	save	%r22, %r0, %r25
	.word 0xba0d2055  ! 626: AND_I	and 	%r20, 0x0055, %r29
	.word 0xb20da025  ! 627: AND_I	and 	%r22, 0x0025, %r25
	.word 0xbfe40000  ! 629: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e50000  ! 632: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde5618c  ! 634: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e461fd  ! 636: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_21:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 641: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_52:
	setx	0x230026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 646: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_36:
	mov	0x22, %r14
	.word 0xf0db8400  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_37:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_38:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_rd_39:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 660: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe0de000  ! 662: AND_I	and 	%r23, 0x0000, %r31
cpu_intr_0_53:
	setx	0x220327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf35e001  ! 668: SRL_I	srl 	%r23, 0x0001, %r31
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_54:
	setx	0x23023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e4e144  ! 679: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_55:
	setx	0x200234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 681: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe5c000  ! 684: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_40:
	mov	0x4, %r14
	.word 0xf0db8e60  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_41:
	mov	0x1d, %r14
	.word 0xf2db89e0  ! 686: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_56:
	setx	0x23011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_57:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e053  ! 692: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e5c000  ! 694: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_22:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 697: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_58:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0e8  ! 704: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_59:
	setx	0x23011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902001  ! 710: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb5e50000  ! 715: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e520ce  ! 716: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e4205f  ! 718: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e5a0ff  ! 721: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_60:
	setx	0x22012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_42:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e52136  ! 730: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb93d9000  ! 732: SRAX_R	srax	%r22, %r0, %r28
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e5209d  ! 745: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe52084  ! 746: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_23:
	mov	0xd, %r14
	.word 0xfaf38400  ! 747: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7e5c000  ! 750: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 753: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e54000  ! 756: SAVE_R	save	%r21, %r0, %r25
	.word 0xb53d9000  ! 759: SRAX_R	srax	%r22, %r0, %r26
	.word 0xb5e4614c  ! 761: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbd2cd000  ! 762: SLLX_R	sllx	%r19, %r0, %r30
cpu_intr_0_61:
	setx	0x220001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 770: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe48000  ! 771: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde4c000  ! 772: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_44:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_45:
	mov	0x34, %r14
	.word 0xf8db8e60  ! 777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5643801  ! 778: MOVcc_I	<illegal instruction>
cpu_intr_0_62:
	setx	0x22000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 784: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e48000  ! 785: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e40000  ! 786: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e46029  ! 787: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde44000  ! 789: SAVE_R	save	%r17, %r0, %r30
	.word 0xb3e5e1dd  ! 791: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_63:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x20020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 798: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_65:
	setx	0x210319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e186  ! 802: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5c000  ! 804: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e5c000  ! 810: SAVE_R	save	%r23, %r0, %r28
	.word 0xba1d8000  ! 811: XOR_R	xor 	%r22, %r0, %r29
T0_asi_reg_rd_46:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde4e1eb  ! 815: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e58000  ! 819: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe44000  ! 821: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_47:
	mov	0x2b, %r14
	.word 0xf8db8e80  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbde420c8  ! 823: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb695e047  ! 824: ORcc_I	orcc 	%r23, 0x0047, %r27
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_48:
	mov	0x1c, %r14
	.word 0xfedb8400  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_66:
	setx	0x21030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 831: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e460b7  ! 835: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_67:
	setx	0x21000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 839: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe52118  ! 841: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe50000  ! 843: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_49:
	mov	0x33, %r14
	.word 0xf0db84a0  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_68:
	setx	0x210211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09ce1e6  ! 847: XORcc_I	xorcc 	%r19, 0x01e6, %r24
cpu_intr_0_69:
	setx	0x230137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_70:
	setx	0x23023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_71:
	setx	0x220131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 853: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_26:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 855: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_72:
	setx	0x210124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e421ed  ! 857: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbc0460c3  ! 863: ADD_I	add 	%r17, 0x00c3, %r30
	.word 0xbde4e0b9  ! 865: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_73:
	setx	0x23001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 873: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_74:
	setx	0x230001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a4c000  ! 881: SUBcc_R	subcc 	%r19, %r0, %r28
T0_asi_reg_rd_50:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_51:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6b54000  ! 888: ORNcc_R	orncc 	%r21, %r0, %r27
cpu_intr_0_75:
	setx	0x210239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_76:
	setx	0x210234, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5e120  ! 903: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_77:
	setx	0x210134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_52:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 908: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_53:
	mov	0x33, %r14
	.word 0xf0db8e60  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb0344000  ! 910: SUBC_R	orn 	%r17, %r0, %r24
T0_asi_reg_wr_28:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 911: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_29:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 913: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e48000  ! 916: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_30:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 917: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbcac0000  ! 922: ANDNcc_R	andncc 	%r16, %r0, %r30
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_78:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d604f  ! 928: XOR_I	xor 	%r21, 0x004f, %r31
T0_asi_reg_rd_54:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 929: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 2)
	.word 0xbe94c000  ! 933: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xb1e5c000  ! 935: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e54000  ! 937: SAVE_R	save	%r21, %r0, %r28
	.word 0xbbe4e16b  ! 938: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_31:
	mov	0x37, %r14
	.word 0xfef389e0  ! 940: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 12)
	.word 0xbfe560ad  ! 946: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe50000  ! 947: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe5a178  ! 948: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e5c000  ! 950: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 951: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbb500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xb7e4a1e7  ! 953: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e42163  ! 958: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_55:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_79:
	setx	0x250132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 21)
	.word 0xb83dc000  ! 974: XNOR_R	xnor 	%r23, %r0, %r28
cpu_intr_0_80:
	setx	0x270210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_81:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56143  ! 980: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e48000  ! 984: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_82:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 987: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_33:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 988: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 19)
	.word 0xbc0c8000  ! 990: AND_R	and 	%r18, %r0, %r30
cpu_intr_0_83:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 994: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_84:
	setx	0x250108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_56:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e4a1cd  ! 1000: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde40000  ! 1001: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe58000  ! 1003: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e58000  ! 1004: SAVE_R	save	%r22, %r0, %r28
	.word 0xb5e5204c  ! 1005: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb4ad0000  ! 1006: ANDNcc_R	andncc 	%r20, %r0, %r26
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_85:
	setx	0x27000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a014  ! 1009: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4a0cf  ! 1015: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e52195  ! 1019: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 8)
	.word 0x819560c1  ! 1021: WRPR_TPC_I	wrpr	%r21, 0x00c1, %tpc
cpu_intr_0_86:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4a1b0  ! 1028: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e48000  ! 1029: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_57:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbe50000  ! 1033: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde54000  ! 1036: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4c000  ! 1037: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e46043  ! 1041: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb37d0400  ! 1048: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb0c4a0f0  ! 1049: ADDCcc_I	addccc 	%r18, 0x00f0, %r24
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_58:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 1054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb835a021  ! 1055: ORN_I	orn 	%r22, 0x0021, %r28
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe5e02b  ! 1057: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_87:
	setx	0x25031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe5a091  ! 1060: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1063: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe4a16d  ! 1064: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe48000  ! 1065: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_88:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 1068: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e4c000  ! 1071: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_89:
	setx	0x270035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x2b, %r14
	.word 0xf4f389e0  ! 1078: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb6c56123  ! 1079: ADDCcc_I	addccc 	%r21, 0x0123, %r27
	.word 0xb9e5614c  ! 1082: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e48000  ! 1083: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e56179  ! 1084: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_90:
	setx	0x270019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_91:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e110  ! 1089: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5a1bf  ! 1090: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_92:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 1092: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_59:
	mov	0x6, %r14
	.word 0xfedb8400  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_93:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e4e19a  ! 1113: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5e018  ! 1114: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e56029  ! 1117: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e42197  ! 1118: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe40000  ! 1121: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_60:
	mov	0xa, %r14
	.word 0xfedb8400  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5e4a174  ! 1127: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e130  ! 1130: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e54000  ! 1131: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_61:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e58000  ! 1134: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde5200f  ! 1136: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_94:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52df001  ! 1142: SLLX_I	sllx	%r23, 0x0001, %r26
T0_asi_reg_wr_36:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 1143: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e4c000  ! 1145: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe40000  ! 1146: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_95:
	setx	0x240329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_96:
	setx	0x250011, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 1153: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, f)
	.word 0xb9e4e042  ! 1159: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_97:
	setx	0x240101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe54000  ! 1167: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde40000  ! 1172: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5c000  ! 1178: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_62:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e48000  ! 1181: SAVE_R	save	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_98:
	setx	0x270334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_99:
	setx	0x250024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_100:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb359000  ! 1192: SRLX_R	srlx	%r22, %r0, %r29
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_63:
	mov	0x16, %r14
	.word 0xf6db89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe56157  ! 1197: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_64:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_65:
	mov	0x33, %r14
	.word 0xf6db89e0  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_38:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1203: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_66:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb8248000  ! 1214: SUB_R	sub 	%r18, %r0, %r28
T0_asi_reg_rd_67:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7e5e09d  ! 1216: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_68:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 1219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e5e037  ! 1222: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_101:
	setx	0x26012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 1224: MOVcc_I	<illegal instruction>
cpu_intr_0_102:
	setx	0x25020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x3, %r14
	.word 0xf8db89e0  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_70:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde4a170  ! 1230: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1231: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_103:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_40:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 1237: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_71:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e5a095  ! 1239: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf500000  ! 1240: RDPR_TPC	<illegal instruction>
cpu_intr_0_104:
	setx	0x25010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 1244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_105:
	setx	0x250114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420f0  ! 1247: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e461c3  ! 1252: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e46134  ! 1257: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, c)
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e4c000  ! 1270: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e5e076  ! 1272: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_73:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_74:
	mov	0x37, %r14
	.word 0xfadb89e0  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_41:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 1278: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_75:
	mov	0x32, %r14
	.word 0xf0db8e80  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbbe4a090  ! 1285: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 1286: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_106:
	setx	0x260012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0c5  ! 1292: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5e18b  ! 1294: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5a0d3  ! 1295: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_107:
	setx	0x260300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c9000  ! 1303: SLLX_R	sllx	%r18, %r0, %r25
T0_asi_reg_rd_77:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_78:
	mov	0x11, %r14
	.word 0xf6db89e0  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbde48000  ! 1308: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe58000  ! 1309: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_43:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 1311: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e42109  ! 1313: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5c000  ! 1315: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e58000  ! 1316: SAVE_R	save	%r22, %r0, %r26
	.word 0xb3e4c000  ! 1318: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_44:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 1328: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e461ef  ! 1329: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_108:
	setx	0x270027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 1338: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_79:
	mov	0x24, %r14
	.word 0xf6db89e0  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_109:
	setx	0x240323, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_45:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 1344: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb8b50000  ! 1346: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xb3e4218f  ! 1348: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbaad4000  ! 1354: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xb7e4c000  ! 1355: SAVE_R	save	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe48000  ! 1360: SAVE_R	save	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_110:
	setx	0x24021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1370: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe50000  ! 1374: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 1376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb825a1ba  ! 1377: SUB_I	sub 	%r22, 0x01ba, %r28
	.word 0xb3e50000  ! 1379: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_46:
	mov	0x37, %r14
	.word 0xf4f38400  ! 1381: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_81:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb20c0000  ! 1385: AND_R	and 	%r16, %r0, %r25
T0_asi_reg_rd_82:
	mov	0x15, %r14
	.word 0xf0db8400  ! 1388: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_111:
	setx	0x1032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_112:
	setx	0x2b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_83:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_47:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1407: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_113:
	setx	0x2a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1421: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_114:
	setx	0x28022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 1424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e4c000  ! 1425: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_85:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_86:
	mov	0x2c, %r14
	.word 0xfcdb89e0  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7e58000  ! 1434: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe48000  ! 1436: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_48:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 1438: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e4e1a3  ! 1441: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_49:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 1445: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde5a1c7  ! 1447: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e40000  ! 1453: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe4c000  ! 1455: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e4a015  ! 1460: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_87:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe4e097  ! 1467: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_50:
	mov	0x2c, %r14
	.word 0xf6f389e0  ! 1469: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_88:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_115:
	setx	0x290137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_116:
	setx	0x2b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_117:
	setx	0x2b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a176  ! 1483: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_89:
	mov	0x2f, %r14
	.word 0xf6db8e60  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_51:
	mov	0x23, %r14
	.word 0xfef389e0  ! 1488: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e54000  ! 1491: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_118:
	setx	0x2b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e4c000  ! 1499: SAVE_R	save	%r19, %r0, %r27
	.word 0xb9e46093  ! 1505: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e54000  ! 1506: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe5a1bb  ! 1511: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_90:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_119:
	setx	0x280321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_52:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 1518: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_91:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_92:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7540000  ! 1525: RDPR_GL	<illegal instruction>
cpu_intr_0_120:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a106  ! 1531: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_121:
	setx	0x29022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_122:
	setx	0x290113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e58000  ! 1537: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_93:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_123:
	setx	0x29013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7e42133  ! 1550: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e52139  ! 1553: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe52142  ! 1554: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_53:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 1560: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 1561: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e58000  ! 1568: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e560e4  ! 1570: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_95:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_124:
	setx	0x2b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42197  ! 1577: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_125:
	setx	0x29000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 1584: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_96:
	mov	0xf, %r14
	.word 0xf0db8400  ! 1587: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9e5a085  ! 1588: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4c000  ! 1590: SAVE_R	save	%r19, %r0, %r31
	.word 0xb02c6134  ! 1591: ANDN_I	andn 	%r17, 0x0134, %r24
	.word 0xb28cc000  ! 1594: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xb7e58000  ! 1595: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e5a06f  ! 1598: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_126:
	setx	0x28032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_97:
	mov	0xa, %r14
	.word 0xf0db8e80  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfe5215d  ! 1604: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5e1a5  ! 1605: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde521e6  ! 1606: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb40da03b  ! 1607: AND_I	and 	%r22, 0x003b, %r26
	.word 0xb5e4c000  ! 1608: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_127:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_128:
	setx	0x2b0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_98:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 1616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde50000  ! 1617: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_54:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 1622: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_55:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 1626: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_129:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_99:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_100:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbb7c0400  ! 1639: MOVR_R	movre	%r16, %r0, %r29
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e44000  ! 1651: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_130:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1659: SAVE_R	save	%r17, %r0, %r26
	.word 0xbbe44000  ! 1663: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe5e130  ! 1669: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb72d2001  ! 1671: SLL_I	sll 	%r20, 0x0001, %r27
	.word 0xb37de401  ! 1675: MOVR_I	movre	%r23, 0x1, %r25
cpu_intr_0_131:
	setx	0x290237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_56:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 1677: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_101:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1480000  ! 1681: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
cpu_intr_0_132:
	setx	0x2a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1683: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_133:
	setx	0x290118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1686: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e4e0bb  ! 1689: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb6bc0000  ! 1693: XNORcc_R	xnorcc 	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb3e5a1a6  ! 1702: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e44000  ! 1705: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbe342030  ! 1707: SUBC_I	orn 	%r16, 0x0030, %r31
cpu_intr_0_134:
	setx	0x280012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1709: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_135:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 1715: SAVE_R	save	%r19, %r0, %r29
	.word 0xbde50000  ! 1716: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_103:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 1719: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_104:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3e4e1d1  ! 1725: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_57:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 1727: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_58:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 1732: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_105:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e56118  ! 1736: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_106:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e42097  ! 1744: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb0b56108  ! 1748: SUBCcc_I	orncc 	%r21, 0x0108, %r24
	.word 0xb9e48000  ! 1749: SAVE_R	save	%r18, %r0, %r28
	.word 0xbfe44000  ! 1751: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e56116  ! 1752: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e56185  ! 1753: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_136:
	setx	0x2a0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe58000  ! 1757: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_137:
	setx	0x2a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x17, %r14
	.word 0xf8f38e60  ! 1759: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde40000  ! 1760: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe44000  ! 1761: SAVE_R	save	%r17, %r0, %r29
	.word 0xb3e460a6  ! 1762: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbd2db001  ! 1764: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xb9e40000  ! 1766: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e44000  ! 1769: SAVE_R	save	%r17, %r0, %r28
	.word 0xb02c8000  ! 1770: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xb9e4a033  ! 1774: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4c000  ! 1776: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_60:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 1777: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde58000  ! 1781: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_138:
	setx	0x2a000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 1784: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb93c6001  ! 1787: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xbbe44000  ! 1788: SAVE_R	save	%r17, %r0, %r29
	.word 0x8595602c  ! 1792: WRPR_TSTATE_I	wrpr	%r21, 0x002c, %tstate
	.word 0xbde42153  ! 1794: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4e193  ! 1795: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_139:
	setx	0x20316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_140:
	setx	0x2b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_141:
	setx	0x28003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42093  ! 1811: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_62:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 1816: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7e46084  ! 1820: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_63:
	mov	0x20, %r14
	.word 0xfef389e0  ! 1822: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbbe44000  ! 1828: SAVE_R	save	%r17, %r0, %r29
	.word 0xb00d0000  ! 1829: AND_R	and 	%r20, %r0, %r24
	.word 0xbc85207a  ! 1831: ADDcc_I	addcc 	%r20, 0x007a, %r30
	.word 0xbbe54000  ! 1832: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_108:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbab58000  ! 1844: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xb7e50000  ! 1845: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_142:
	setx	0x2c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1857: SAVE_R	save	%r19, %r0, %r30
	.word 0xbd2c4000  ! 1859: SLL_R	sll 	%r17, %r0, %r30
T0_asi_reg_rd_109:
	mov	0x23, %r14
	.word 0xfedb84a0  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_143:
	setx	0x2f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e58000  ! 1864: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e4e1b0  ! 1865: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e54000  ! 1866: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e44000  ! 1868: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e54000  ! 1874: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_144:
	setx	0x2e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe040000  ! 1877: ADD_R	add 	%r16, %r0, %r31
cpu_intr_0_145:
	setx	0x2e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde54000  ! 1885: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e5c000  ! 1888: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe4617e  ! 1889: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb2b58000  ! 1890: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xb1e44000  ! 1891: SAVE_R	save	%r17, %r0, %r24
	.word 0xb3641800  ! 1893: MOVcc_R	<illegal instruction>
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 1897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e5a09f  ! 1898: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_111:
	mov	0x24, %r14
	.word 0xf6db8e40  ! 1900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e520b1  ! 1902: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 21)
	.word 0xbde58000  ! 1910: SAVE_R	save	%r22, %r0, %r30
	.word 0xb92c4000  ! 1911: SLL_R	sll 	%r17, %r0, %r28
T0_asi_reg_wr_64:
	mov	0x19, %r14
	.word 0xfaf38400  ! 1912: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_147:
	setx	0x2e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_148:
	setx	0x2c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_112:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_149:
	setx	0x2d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1921: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde48000  ! 1926: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_150:
	setx	0x2c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_114:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 1932: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 1937: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe521f7  ! 1939: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_115:
	mov	0x4, %r14
	.word 0xf4db8e60  ! 1940: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_66:
	mov	0x1e, %r14
	.word 0xf6f389e0  ! 1941: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3e54000  ! 1942: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_67:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1943: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e40000  ! 1945: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_151:
	setx	0x2e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_152:
	setx	0x2c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_116:
	mov	0x2b, %r14
	.word 0xfedb84a0  ! 1953: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbbe46011  ! 1954: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e48000  ! 1955: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e54000  ! 1956: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1520000  ! 1958: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_68:
	mov	0x2b, %r14
	.word 0xfaf38400  ! 1961: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_69:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 1962: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbb50c000  ! 1963: RDPR_TT	<illegal instruction>
	.word 0xbcb4a190  ! 1966: SUBCcc_I	orncc 	%r18, 0x0190, %r30
	.word 0xb5e44000  ! 1970: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e4a066  ! 1972: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 37)
	.word 0xb4b58000  ! 1983: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xb2a5c000  ! 1984: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0xb3e5a193  ! 1985: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e46162  ! 1990: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde54000  ! 1992: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_154:
	setx	0x2d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1995: SAVE_R	save	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5c000  ! 1997: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e48000  ! 2000: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_117:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_70:
	mov	0x38, %r14
	.word 0xf8f38400  ! 2002: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_155:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe461fc  ! 2010: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4c000  ! 2013: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e50000  ! 2015: SAVE_R	save	%r20, %r0, %r26
	.word 0xb1e44000  ! 2017: SAVE_R	save	%r17, %r0, %r24
	.word 0xb3e461e3  ! 2018: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e54000  ! 2019: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3500000  ! 2025: RDPR_TPC	<illegal instruction>
cpu_intr_0_156:
	setx	0x2c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 2030: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, e)
	.word 0xb7e5e1bd  ! 2035: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5e167  ! 2036: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e46139  ! 2041: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5c000  ! 2044: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde5e139  ! 2045: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_71:
	mov	0x19, %r14
	.word 0xfaf38e60  ! 2046: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_157:
	setx	0x2e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_158:
	setx	0x2f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52052  ! 2053: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e50000  ! 2054: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_118:
	mov	0x35, %r14
	.word 0xf4db8e60  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfe44000  ! 2060: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde4a192  ! 2065: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e4c000  ! 2070: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe54000  ! 2071: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_159:
	setx	0x2e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_72:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 2074: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_119:
	mov	0xe, %r14
	.word 0xfadb8e60  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_160:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x29, %r14
	.word 0xf6db8400  ! 2081: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_161:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0ab  ! 2088: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb084c000  ! 2092: ADDcc_R	addcc 	%r19, %r0, %r24
T0_asi_reg_wr_73:
	mov	0x33, %r14
	.word 0xfef38e80  ! 2094: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_121:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_122:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e40000  ! 2105: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e4e148  ! 2112: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_123:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe460ce  ! 2115: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe44000  ! 2125: SAVE_R	save	%r17, %r0, %r29
	.word 0xbfe44000  ! 2126: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_124:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e461ef  ! 2135: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e40000  ! 2136: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_74:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 2138: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9e4a0dd  ! 2140: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_162:
	setx	0x2e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c8000  ! 2143: XOR_R	xor 	%r18, %r0, %r30
	.word 0xbfe50000  ! 2144: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_75:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 2145: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_163:
	setx	0x2c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_164:
	setx	0x2f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_76:
	mov	0x33, %r14
	.word 0xf8f384a0  ! 2151: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5641800  ! 2154: MOVcc_R	<illegal instruction>
	.word 0xbfe5e0af  ! 2156: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_125:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 2157: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_77:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 2161: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_165:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5c000  ! 2166: SAVE_R	save	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_166:
	setx	0x2c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521b9  ! 2171: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_127:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_167:
	setx	0x2c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 2176: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e40000  ! 2178: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_168:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a07f  ! 2181: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, f)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_169:
	setx	0x2f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_78:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2195: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_128:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2196: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_129:
	mov	0x6, %r14
	.word 0xfcdb84a0  ! 2200: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe42144  ! 2203: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_130:
	mov	0x23, %r14
	.word 0xfadb8e60  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_131:
	mov	0x2f, %r14
	.word 0xf2db8e60  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_170:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e07a  ! 2215: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_132:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde5c000  ! 2221: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e44000  ! 2223: SAVE_R	save	%r17, %r0, %r24
	.word 0xbe348000  ! 2224: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb7e56121  ! 2225: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_79:
	mov	0x22, %r14
	.word 0xf0f389e0  ! 2226: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbfe5e03c  ! 2227: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_171:
	setx	0x2e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, c)
	.word 0xbde5214b  ! 2243: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e4e1c2  ! 2247: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e520fc  ! 2249: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_133:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e4e0f7  ! 2263: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e48000  ! 2269: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_172:
	setx	0x2e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a4c000  ! 2273: SUBcc_R	subcc 	%r19, %r0, %r28
T0_asi_reg_wr_80:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 2275: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e4e1a7  ! 2277: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_173:
	setx	0x2f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_135:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 2282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfe521fe  ! 2284: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe46080  ! 2287: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e461a6  ! 2290: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4a09b  ! 2294: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb13dd000  ! 2295: SRAX_R	srax	%r23, %r0, %r24
	.word 0xbde521e2  ! 2296: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_174:
	setx	0x31023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2299: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_81:
	mov	0x17, %r14
	.word 0xfaf389e0  ! 2302: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_175:
	setx	0x300139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_176:
	setx	0x31030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bc4000  ! 2306: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xb3e56143  ! 2309: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_177:
	setx	0x320122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x300134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x29, %r14
	.word 0xf4db8400  ! 2317: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbe2ce0d6  ! 2319: ANDN_I	andn 	%r19, 0x00d6, %r31
T0_asi_reg_rd_138:
	mov	0x1d, %r14
	.word 0xfadb8e60  ! 2320: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe5e107  ! 2322: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5c000  ! 2324: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 30)
	.word 0xb4342098  ! 2326: ORN_I	orn 	%r16, 0x0098, %r26
	.word 0xb5e48000  ! 2329: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, a)
	.word 0xb01ca071  ! 2331: XOR_I	xor 	%r18, 0x0071, %r24
cpu_intr_0_180:
	setx	0x330116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_181:
	setx	0x33022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2335: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe5e0e9  ! 2337: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_82:
	mov	0x1e, %r14
	.word 0xf6f389e0  ! 2338: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e54000  ! 2342: SAVE_R	save	%r21, %r0, %r24
	.word 0xb21ca0fa  ! 2343: XOR_I	xor 	%r18, 0x00fa, %r25
	.word 0xb7e44000  ! 2344: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_83:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 2346: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_84:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 2348: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_139:
	mov	0x33, %r14
	.word 0xfedb8400  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 16)
	.word 0xbde5a0ed  ! 2353: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5c000  ! 2357: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_140:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5e4a096  ! 2363: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_182:
	setx	0x320101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_141:
	mov	0x29, %r14
	.word 0xf2db84a0  ! 2369: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_183:
	setx	0x32012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde54000  ! 2381: SAVE_R	save	%r21, %r0, %r30
	.word 0xb8142159  ! 2383: OR_I	or 	%r16, 0x0159, %r28
	.word 0xb49dc000  ! 2388: XORcc_R	xorcc 	%r23, %r0, %r26
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_142:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5641800  ! 2396: MOVcc_R	<illegal instruction>
	.word 0xb0b50000  ! 2398: SUBCcc_R	orncc 	%r20, %r0, %r24
cpu_intr_0_184:
	setx	0x320220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x30021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2413: SAVE_R	save	%r21, %r0, %r31
	.word 0xb83d2000  ! 2414: XNOR_I	xnor 	%r20, 0x0000, %r28
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe5c000  ! 2419: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_186:
	setx	0x320019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_187:
	setx	0x300213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_143:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7e5c000  ! 2424: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe4217e  ! 2425: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde52151  ! 2426: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 2428: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb3e4a0b8  ! 2429: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4c000  ! 2430: SAVE_R	save	%r19, %r0, %r26
	.word 0xb40461ad  ! 2432: ADD_I	add 	%r17, 0x01ad, %r26
	.word 0xbbe4e0b3  ! 2435: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_144:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_86:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 2442: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_188:
	setx	0x32022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_145:
	mov	0x36, %r14
	.word 0xf2db8400  ! 2447: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_146:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 2448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7e4a095  ! 2449: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_87:
	mov	0x2e, %r14
	.word 0xfaf38e80  ! 2450: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e521d8  ! 2454: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_147:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 2455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_189:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2459: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe5207f  ! 2461: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_88:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 2462: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbe044000  ! 2465: ADD_R	add 	%r17, %r0, %r31
	.word 0xb3e58000  ! 2466: SAVE_R	save	%r22, %r0, %r25
	.word 0xb1e48000  ! 2467: SAVE_R	save	%r18, %r0, %r24
	.word 0xb6058000  ! 2470: ADD_R	add 	%r22, %r0, %r27
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_148:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e4e0c7  ! 2480: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_89:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 2483: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_wr_90:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 2484: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_190:
	setx	0x330120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe1c4000  ! 2489: XOR_R	xor 	%r17, %r0, %r31
	.word 0xbfe52018  ! 2491: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e52092  ! 2504: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e40000  ! 2509: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e44000  ! 2512: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_91:
	mov	0x21, %r14
	.word 0xf0f389e0  ! 2518: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_149:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde4e107  ! 2525: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e48000  ! 2526: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe40000  ! 2527: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_150:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_92:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 2535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_93:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 2538: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb92ca001  ! 2542: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xb1e58000  ! 2544: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_191:
	setx	0x31000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 2547: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbe48000  ! 2550: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_152:
	mov	0x13, %r14
	.word 0xfcdb8e80  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 2554: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_192:
	setx	0x330218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0ce118  ! 2559: AND_I	and 	%r19, 0x0118, %r30
T0_asi_reg_wr_95:
	mov	0x27, %r14
	.word 0xfcf38400  ! 2561: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_153:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 2562: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbe4a05e  ! 2566: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe50000  ! 2568: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbac54000  ! 2573: ADDCcc_R	addccc 	%r21, %r0, %r29
	.word 0xb7e5216e  ! 2574: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 3)
	.word 0xb62d6106  ! 2586: ANDN_I	andn 	%r21, 0x0106, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde42163  ! 2588: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e58000  ! 2593: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_96:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 2594: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e461a8  ! 2595: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e56052  ! 2599: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 7)
	.word 0xbcc4217e  ! 2607: ADDCcc_I	addccc 	%r16, 0x017e, %r30
	.word 0xb3e40000  ! 2610: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_193:
	setx	0x30002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0ee  ! 2615: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_194:
	setx	0x32023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2618: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_195:
	setx	0x32010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x320321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x1e, %r14
	.word 0xf4db89e0  ! 2622: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_197:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2632: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_198:
	setx	0x300214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe520ca  ! 2637: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde58000  ! 2641: SAVE_R	save	%r22, %r0, %r30
	.word 0xb9e4a164  ! 2643: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_199:
	setx	0x330238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 2646: SAVE_R	save	%r22, %r0, %r28
	.word 0xb32c1000  ! 2647: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xbbe58000  ! 2651: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_200:
	setx	0x300201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2654: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_156:
	mov	0x4, %r14
	.word 0xf6db8400  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_97:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 2658: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 2659: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_201:
	setx	0x30000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46070  ! 2664: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_202:
	setx	0x330335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2666: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_157:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e40000  ! 2670: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_158:
	mov	0x1e, %r14
	.word 0xf6db89e0  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb04421d1  ! 2673: ADDC_I	addc 	%r16, 0x01d1, %r24
	.word 0xb8c44000  ! 2674: ADDCcc_R	addccc 	%r17, %r0, %r28
T0_asi_reg_rd_159:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 2676: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_203:
	setx	0x310314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 2689: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1e5c000  ! 2695: SAVE_R	save	%r23, %r0, %r24
	.word 0xbe254000  ! 2698: SUB_R	sub 	%r21, %r0, %r31
	.word 0xb0940000  ! 2700: ORcc_R	orcc 	%r16, %r0, %r24
cpu_intr_0_204:
	setx	0x11e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2706: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_205:
	setx	0x33031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_98:
	mov	0x26, %r14
	.word 0xfaf384a0  ! 2710: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e561cf  ! 2719: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_99:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 2722: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e5203a  ! 2723: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbc358000  ! 2724: SUBC_R	orn 	%r22, %r0, %r30
cpu_intr_0_206:
	setx	0x310307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2726: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb634e154  ! 2729: ORN_I	orn 	%r19, 0x0154, %r27
cpu_intr_0_207:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e520c9  ! 2735: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbcc520c9  ! 2737: ADDCcc_I	addccc 	%r20, 0x00c9, %r30
T0_asi_reg_rd_161:
	mov	0xe, %r14
	.word 0xf2db8400  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_208:
	setx	0x360339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x1b, %r14
	.word 0xf2db8e60  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_209:
	setx	0x340111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2746: SAVE_R	save	%r20, %r0, %r31
	.word 0xb734b001  ! 2747: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xb3e4c000  ! 2748: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_100:
	mov	0x7, %r14
	.word 0xfcf38e60  ! 2751: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_101:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 2752: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_210:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_102:
	mov	0x38, %r14
	.word 0xfef38e40  ! 2758: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_211:
	setx	0x340034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c20a5  ! 2764: XNOR_I	xnor 	%r16, 0x00a5, %r25
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_163:
	mov	0x16, %r14
	.word 0xfadb89e0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_212:
	setx	0x37010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_213:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c58000  ! 2774: ADDCcc_R	addccc 	%r22, %r0, %r28
cpu_intr_0_214:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e4c000  ! 2784: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_215:
	setx	0x350013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2787: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e4e184  ! 2788: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_216:
	setx	0x35000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e13b  ! 2799: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_217:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bca0f7  ! 2802: XNORcc_I	xnorcc 	%r18, 0x00f7, %r25
T0_asi_reg_wr_103:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 2803: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_104:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 2804: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe58000  ! 2806: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe54000  ! 2810: SAVE_R	save	%r21, %r0, %r29
	.word 0xb28c61f2  ! 2811: ANDcc_I	andcc 	%r17, 0x01f2, %r25
	.word 0xb5e40000  ! 2814: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_218:
	setx	0x35002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c0000  ! 2818: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xb6ada1d7  ! 2819: ANDNcc_I	andncc 	%r22, 0x01d7, %r27
cpu_intr_0_219:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2827: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_220:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2834: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e4c000  ! 2836: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_164:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_106:
	mov	0x35, %r14
	.word 0xf2f384a0  ! 2841: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_107:
	mov	0xa, %r14
	.word 0xf8f38400  ! 2843: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_165:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe4c000  ! 2850: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e50000  ! 2852: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_108:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 2855: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 3)
	.word 0xbc348000  ! 2857: ORN_R	orn 	%r18, %r0, %r30
	.word 0xbfe54000  ! 2859: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_221:
	setx	0x36030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 2861: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_222:
	setx	0x350227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2863: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_223:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2875: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_110:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2880: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e44000  ! 2883: SAVE_R	save	%r17, %r0, %r24
	.word 0xb5e56139  ! 2884: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe54000  ! 2886: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e560dd  ! 2887: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_224:
	setx	0x340210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_111:
	mov	0x6, %r14
	.word 0xfef38400  ! 2902: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3e520bd  ! 2908: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_112:
	mov	0x1e, %r14
	.word 0xf4f389e0  ! 2911: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, e)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 1)
	.word 0xb32cf001  ! 2920: SLLX_I	sllx	%r19, 0x0001, %r25
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_113:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbbe5e1b1  ! 2923: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 22)
	.word 0xbe058000  ! 2925: ADD_R	add 	%r22, %r0, %r31
	.word 0xb7e58000  ! 2927: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_166:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 2928: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_114:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 2934: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe4a01c  ! 2937: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 14)
	.word 0xbde5c000  ! 2943: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_226:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 2948: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e46020  ! 2950: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4a022  ! 2951: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_227:
	setx	0x360119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e44000  ! 2955: SAVE_R	save	%r17, %r0, %r26
	.word 0xbde58000  ! 2956: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e44000  ! 2958: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe5c000  ! 2959: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_228:
	setx	0x35013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_230:
	setx	0x34000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d0000  ! 2966: ANDN_R	andn 	%r20, %r0, %r24
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_167:
	mov	0x26, %r14
	.word 0xf6db84a0  ! 2971: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_231:
	setx	0x360237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_115:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 2987: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e420b7  ! 2989: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_169:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe48000  ! 2992: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe5c000  ! 2993: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 2998: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_117:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 2999: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_118:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 3001: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbf356001  ! 3002: SRL_I	srl 	%r21, 0x0001, %r31
cpu_intr_0_232:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0be  ! 3011: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbc2ce180  ! 3013: ANDN_I	andn 	%r19, 0x0180, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4202f  ! 3017: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_233:
	setx	0x35033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c1000  ! 3020: SLLX_R	sllx	%r16, %r0, %r28
cpu_intr_0_234:
	setx	0x37000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 3023: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_170:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 3026: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_171:
	mov	0x20, %r14
	.word 0xfadb89e0  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e4e1a6  ! 3031: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e40000  ! 3039: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e48000  ! 3040: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_235:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_173:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0x8d95207b  ! 3047: WRPR_PSTATE_I	wrpr	%r20, 0x007b, %pstate
T0_asi_reg_rd_174:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb8b4e1a4  ! 3049: SUBCcc_I	orncc 	%r19, 0x01a4, %r28
T0_asi_reg_rd_175:
	mov	0x17, %r14
	.word 0xf0db8400  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4205e  ! 3055: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe4e042  ! 3057: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4e1a1  ! 3060: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_236:
	setx	0x35020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3064: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_237:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56083  ! 3067: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_176:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 3068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5200b  ! 3072: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e48000  ! 3073: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e58000  ! 3075: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_238:
	setx	0x340020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_177:
	mov	0x7, %r14
	.word 0xf0db8400  ! 3081: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_178:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 3087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e5c000  ! 3088: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e44000  ! 3091: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_119:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 3093: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xba0dc000  ! 3095: AND_R	and 	%r23, %r0, %r29
	.word 0xb7e4c000  ! 3096: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3e5e0f1  ! 3101: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_180:
	mov	0x2f, %r14
	.word 0xf4db89e0  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 0)
	.word 0xb8bd4000  ! 3112: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xbde54000  ! 3117: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde5e097  ! 3118: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_239:
	setx	0x35012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_120:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 3125: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_240:
	setx	0x340301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_121:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 3134: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9e48000  ! 3135: SAVE_R	save	%r18, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe4c000  ! 3140: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e50000  ! 3142: SAVE_R	save	%r20, %r0, %r28
	.word 0xbe158000  ! 3143: OR_R	or 	%r22, %r0, %r31
T0_asi_reg_rd_181:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_122:
	mov	0x4, %r14
	.word 0xfef389e0  ! 3152: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_242:
	setx	0x350013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_243:
	setx	0x36012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e46072  ! 3156: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_244:
	setx	0x360013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8d0000  ! 3163: ANDcc_R	andcc 	%r20, %r0, %r31
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e4e108  ! 3172: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_245:
	setx	0x370127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_246:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_123:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3177: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_124:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 3178: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_247:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x340224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 3185: SAVE_R	save	%r17, %r0, %r25
	.word 0xb00d2190  ! 3186: AND_I	and 	%r20, 0x0190, %r24
	.word 0xb1e58000  ! 3192: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 3193: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5e5a172  ! 3196: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe58000  ! 3200: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe50000  ! 3202: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e4e0c2  ! 3210: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_126:
	mov	0x16, %r14
	.word 0xfcf38e80  ! 3211: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3e50000  ! 3215: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_249:
	setx	0x3b021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461f5  ! 3218: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_250:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 3220: RDPR_TNPC	<illegal instruction>
cpu_intr_0_251:
	setx	0x3a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1b8  ! 3224: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_252:
	setx	0x3a0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3228: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_127:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 3231: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbc34a1dc  ! 3232: SUBC_I	orn 	%r18, 0x01dc, %r30
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e461b5  ! 3235: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_253:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x4, %r14
	.word 0xfaf384a0  ! 3237: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_254:
	setx	0x39021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe42196  ! 3243: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e50000  ! 3245: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe58000  ! 3250: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e58000  ! 3251: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe50000  ! 3252: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe5604e  ! 3253: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e460b0  ! 3255: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e54000  ! 3257: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_255:
	setx	0x390200, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_129:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 3259: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb9e44000  ! 3260: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_256:
	setx	0x380330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3262: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_130:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 3263: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_257:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_131:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 3274: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbe5a0a0  ! 3275: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4a075  ! 3278: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_258:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 3280: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_182:
	mov	0x24, %r14
	.word 0xfcdb89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb40dc000  ! 3284: AND_R	and 	%r23, %r0, %r26
	.word 0xbfe50000  ! 3286: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_133:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 3288: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_259:
	setx	0x3a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_134:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 3290: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e461ce  ! 3293: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_135:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 3298: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e521ed  ! 3301: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_260:
	setx	0x380202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 3304: MOVcc_R	<illegal instruction>
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 6)
	.word 0xb444e109  ! 3308: ADDC_I	addc 	%r19, 0x0109, %r26
	.word 0xb5e4c000  ! 3309: SAVE_R	save	%r19, %r0, %r26
	.word 0xb93cc000  ! 3312: SRA_R	sra 	%r19, %r0, %r28
T0_asi_reg_rd_183:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbec5a09c  ! 3315: ADDCcc_I	addccc 	%r22, 0x009c, %r31
T0_asi_reg_wr_136:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 3317: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 3318: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e40000  ! 3319: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_261:
	setx	0x38032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4211e  ! 3323: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde58000  ! 3326: SAVE_R	save	%r22, %r0, %r30
	.word 0xbe15e1ff  ! 3327: OR_I	or 	%r23, 0x01ff, %r31
	.word 0xb3e54000  ! 3328: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_262:
	setx	0x39010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_263:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1a0  ! 3336: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_137:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 3337: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e50000  ! 3339: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_184:
	mov	0x23, %r14
	.word 0xf6db8400  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_185:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 3349: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e5e0f4  ! 3350: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_138:
	mov	0xf, %r14
	.word 0xfef38e40  ! 3352: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe44000  ! 3356: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_139:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 3362: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7e50000  ! 3365: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde5c000  ! 3366: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_264:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 3374: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e4a167  ! 3388: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb53d0000  ! 3392: SRA_R	sra 	%r20, %r0, %r26
	.word 0xb3e50000  ! 3405: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_187:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e44000  ! 3411: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_140:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 3415: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb28ce07d  ! 3416: ANDcc_I	andcc 	%r19, 0x007d, %r25
T0_asi_reg_rd_188:
	mov	0x6, %r14
	.word 0xf8db8e60  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb644e08d  ! 3423: ADDC_I	addc 	%r19, 0x008d, %r27
	.word 0xb3e5c000  ! 3424: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_266:
	setx	0x38011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 3432: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 3434: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5e48000  ! 3436: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe5a18d  ! 3438: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_189:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbcc48000  ! 3440: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xbbe4a0d7  ! 3441: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_142:
	mov	0x25, %r14
	.word 0xf0f38e40  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e5a04d  ! 3445: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_143:
	mov	0xf, %r14
	.word 0xf0f38400  ! 3452: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe5c000  ! 3455: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_190:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 3463: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e4a08b  ! 3464: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_191:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 3465: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbebd609f  ! 3467: XNORcc_I	xnorcc 	%r21, 0x009f, %r31
	.word 0xb9e58000  ! 3471: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe50000  ! 3476: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, b)
	.word 0xb234202b  ! 3478: SUBC_I	orn 	%r16, 0x002b, %r25
T0_asi_reg_rd_192:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e50000  ! 3490: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe44000  ! 3492: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe420f0  ! 3493: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e5e13a  ! 3495: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb500000  ! 3498: RDPR_TPC	<illegal instruction>
T0_asi_reg_rd_193:
	mov	0x11, %r14
	.word 0xfadb8e80  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e5e038  ! 3505: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_194:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_267:
	setx	0x3b0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_144:
	mov	0xc, %r14
	.word 0xf4f384a0  ! 3512: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 3513: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e44000  ! 3518: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_268:
	setx	0x1032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521cd  ! 3521: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb884a1f5  ! 3522: ADDcc_I	addcc 	%r18, 0x01f5, %r28
T0_asi_reg_rd_196:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 3524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5c000  ! 3531: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe50000  ! 3536: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_269:
	setx	0x38011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a0eb  ! 3543: WRPR_TSTATE_I	wrpr	%r18, 0x00eb, %tstate
T0_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 3544: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_270:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe44000  ! 3550: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_271:
	setx	0x3a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 4)
	.word 0xbc8c6043  ! 3559: ANDcc_I	andcc 	%r17, 0x0043, %r30
	.word 0xb5e5a06c  ! 3560: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6a421fb  ! 3561: SUBcc_I	subcc 	%r16, 0x01fb, %r27
	.word 0xb7e420ba  ! 3562: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe48000  ! 3565: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_198:
	mov	0xa, %r14
	.word 0xf6db84a0  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1e560e0  ! 3568: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_272:
	setx	0x3a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3575: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe5c000  ! 3579: SAVE_R	save	%r23, %r0, %r31
	.word 0xb615c000  ! 3581: OR_R	or 	%r23, %r0, %r27
T0_asi_reg_rd_199:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3e48000  ! 3585: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe48000  ! 3586: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e56109  ! 3588: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_145:
	mov	0xf, %r14
	.word 0xfef38e40  ! 3589: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb6350000  ! 3590: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb7e5e02f  ! 3591: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e40000  ! 3593: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_200:
	mov	0x34, %r14
	.word 0xf4db89e0  ! 3594: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xba9d8000  ! 3595: XORcc_R	xorcc 	%r22, %r0, %r29
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_273:
	setx	0x380111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_146:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3605: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_147:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 3607: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0x8f902001  ! 3608: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbde520ea  ! 3609: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf3d5000  ! 3611: SRAX_R	srax	%r21, %r0, %r31
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb32cf001  ! 3617: SLLX_I	sllx	%r19, 0x0001, %r25
T0_asi_reg_rd_201:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb004c000  ! 3619: ADD_R	add 	%r19, %r0, %r24
	.word 0xbfe561d3  ! 3620: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_274:
	setx	0x38013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521ec  ! 3624: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5a009  ! 3626: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_275:
	setx	0x3a033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 3629: SAVE_R	save	%r19, %r0, %r29
	.word 0xbd351000  ! 3630: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xbde54000  ! 3631: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_276:
	setx	0x3f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424611f  ! 3633: SUB_I	sub 	%r17, 0x011f, %r26
	.word 0xbbe56077  ! 3635: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_202:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e421cb  ! 3640: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3642: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_277:
	setx	0x3e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0042012  ! 3644: ADD_I	add 	%r16, 0x0012, %r24
	.word 0xbbe44000  ! 3649: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe5e1bc  ! 3660: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb045602d  ! 3662: ADDC_I	addc 	%r21, 0x002d, %r24
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e56193  ! 3666: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe50000  ! 3669: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_278:
	setx	0x3c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3671: SAVE_R	save	%r20, %r0, %r26
	.word 0xbfe4a1bd  ! 3672: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe58000  ! 3675: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_203:
	mov	0x2e, %r14
	.word 0xf6db8400  ! 3679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e5c000  ! 3680: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_279:
	setx	0x3c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1c6  ! 3689: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbaad609c  ! 3690: ANDNcc_I	andncc 	%r21, 0x009c, %r29
T0_asi_reg_rd_204:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_149:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 3693: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe4a11e  ! 3698: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_150:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 3701: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e50000  ! 3703: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_205:
	mov	0x38, %r14
	.word 0xfedb8e80  ! 3704: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, e)
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_151:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 3715: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 37)
	.word 0xbbe54000  ! 3717: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4212e  ! 3718: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5a1c2  ! 3720: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e40000  ! 3721: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_206:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e40000  ! 3726: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde44000  ! 3730: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_207:
	mov	0x10, %r14
	.word 0xf4db89e0  ! 3732: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_281:
	setx	0x3d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3738: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_208:
	mov	0xb, %r14
	.word 0xf0db8e60  ! 3739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_209:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_210:
	mov	0x11, %r14
	.word 0xf2db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_211:
	mov	0x20, %r14
	.word 0xf6db8400  ! 3745: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e44000  ! 3746: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_282:
	setx	0x3f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_283:
	setx	0x3e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3761: SAVE_R	save	%r21, %r0, %r27
	.word 0xbe3c0000  ! 3764: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xb7e4a134  ! 3765: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 33)
	.word 0xbf34b001  ! 3768: SRLX_I	srlx	%r18, 0x0001, %r31
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe520ac  ! 3771: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e54000  ! 3772: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e5a19f  ! 3780: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb73d0000  ! 3781: SRA_R	sra 	%r20, %r0, %r27
cpu_intr_0_284:
	setx	0x3e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0ac  ! 3784: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb344000  ! 3786: SRL_R	srl 	%r17, %r0, %r29
T0_asi_reg_rd_212:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_285:
	setx	0x3c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_152:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 3793: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbde58000  ! 3796: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e56049  ! 3798: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e48000  ! 3799: SAVE_R	save	%r18, %r0, %r27
	.word 0xb3e44000  ! 3805: SAVE_R	save	%r17, %r0, %r25
	.word 0xbb51c000  ! 3808: RDPR_TL	<illegal instruction>
	.word 0xb9e56133  ! 3809: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf2d8000  ! 3813: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb5e44000  ! 3814: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe44000  ! 3819: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 3824: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfe56098  ! 3826: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_154:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 3827: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e4c000  ! 3831: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e4e022  ! 3832: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe561ca  ! 3836: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e421a5  ! 3837: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf7ce401  ! 3838: MOVR_I	movre	%r19, 0x1, %r31
	.word 0xb3e4c000  ! 3839: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde4604b  ! 3840: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_286:
	setx	0x3d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e50000  ! 3847: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e54000  ! 3848: SAVE_R	save	%r21, %r0, %r24
	.word 0xba9c8000  ! 3849: XORcc_R	xorcc 	%r18, %r0, %r29
T0_asi_reg_rd_214:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xba95a13e  ! 3853: ORcc_I	orcc 	%r22, 0x013e, %r29
	.word 0xbde5c000  ! 3855: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e4611c  ! 3856: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_215:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_287:
	setx	0x3c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b54000  ! 3867: SUBCcc_R	orncc 	%r21, %r0, %r25
T0_asi_reg_rd_216:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde46168  ! 3875: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_155:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3877: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_288:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c6001  ! 3888: SRA_I	sra 	%r17, 0x0001, %r30
cpu_intr_0_289:
	setx	0x3c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_290:
	setx	0x3f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e055  ! 3895: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_291:
	setx	0x3f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3901: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e44000  ! 3903: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_217:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e54000  ! 3911: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_156:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 3913: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe5a18e  ! 3914: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbc9c0000  ! 3918: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb5e4c000  ! 3924: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_292:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4e0a5  ! 3926: ADDCcc_I	addccc 	%r19, 0x00a5, %r29
	.word 0xbde58000  ! 3927: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_293:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c5000  ! 3930: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xbbe4211f  ! 3931: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_157:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3934: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_218:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 3938: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e44000  ! 3940: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e48000  ! 3941: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_294:
	setx	0x3c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3946: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e46026  ! 3947: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5c000  ! 3949: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_295:
	setx	0x3e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_158:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 3953: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_159:
	mov	0x19, %r14
	.word 0xfaf38e80  ! 3958: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_219:
	mov	0x8, %r14
	.word 0xfcdb8e60  ! 3961: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e50000  ! 3963: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_296:
	setx	0x3d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e4a0e6  ! 3971: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5c000  ! 3972: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_297:
	setx	0x3c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_298:
	setx	0x3f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_220:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde48000  ! 3984: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e40000  ! 3989: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_300:
	setx	0x3c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 3992: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_221:
	mov	0x9, %r14
	.word 0xf0db8400  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_302:
	setx	0x3d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_222:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb03da191  ! 4008: XNOR_I	xnor 	%r22, 0x0191, %r24
	.word 0x8194e05d  ! 4009: WRPR_TPC_I	wrpr	%r19, 0x005d, %tpc
T0_asi_reg_rd_223:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_161:
	mov	0x1a, %r14
	.word 0xfef38400  ! 4013: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb89d4000  ! 4015: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xbfe5e1c2  ! 4019: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_303:
	setx	0x3c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_224:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe56087  ! 4031: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5a0df  ! 4033: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5c000  ! 4035: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_304:
	setx	0x3f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_305:
	setx	0x3f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_306:
	setx	0x3d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4046: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe461b2  ! 4049: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_307:
	setx	0x3d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_162:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4051: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e4601b  ! 4052: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5a058  ! 4053: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_163:
	mov	0x21, %r14
	.word 0xfef38e40  ! 4054: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_164:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 4055: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_308:
	setx	0x3d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03cc000  ! 4057: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0xb1e50000  ! 4060: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_225:
	mov	0x14, %r14
	.word 0xf8db8e80  ! 4063: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbde5a1b6  ! 4064: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e44000  ! 4070: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe44000  ! 4072: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe5c000  ! 4073: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_226:
	mov	0x38, %r14
	.word 0xfedb8400  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1e4a13b  ! 4076: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 3a)
	.word 0xba956046  ! 4083: ORcc_I	orcc 	%r21, 0x0046, %r29
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_165:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 4086: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e40000  ! 4087: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_309:
	setx	0x3e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_310:
	setx	0x3c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1d0  ! 4092: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_311:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85956195  ! 4096: WRPR_TSTATE_I	wrpr	%r21, 0x0195, %tstate
T0_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 4097: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_167:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 4099: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 4100: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe44000  ! 4102: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e5e1a7  ! 4106: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e01e  ! 4107: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_227:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5e4e1ab  ! 4114: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_312:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe5e06c  ! 4124: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e54000  ! 4125: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_313:
	setx	0x430207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x42011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c61a3  ! 4131: ANDcc_I	andcc 	%r17, 0x01a3, %r31
	.word 0xb1e460d4  ! 4133: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_315:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4142: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde44000  ! 4144: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_168:
	mov	0x11, %r14
	.word 0xf8f38400  ! 4146: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_228:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_316:
	setx	0x43033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a088  ! 4149: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e4e030  ! 4156: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_317:
	setx	0x40033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3cb001  ! 4159: SRAX_I	srax	%r18, 0x0001, %r31
cpu_intr_0_318:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_169:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 4164: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_229:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e44000  ! 4169: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_319:
	setx	0x420322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_320:
	setx	0x430126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb4ad616a  ! 4180: ANDNcc_I	andncc 	%r21, 0x016a, %r26
	.word 0xb5e461e5  ! 4184: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_170:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 4185: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e5207c  ! 4188: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde421e5  ! 4191: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e56095  ! 4192: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_171:
	mov	0x23, %r14
	.word 0xf4f38400  ! 4197: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e4213b  ! 4199: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_172:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 4207: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_321:
	setx	0x43001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4211: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_230:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 4220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb814a09e  ! 4223: OR_I	or 	%r18, 0x009e, %r28
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_231:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e46175  ! 4226: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, e)
	.word 0xb535f001  ! 4230: SRLX_I	srlx	%r23, 0x0001, %r26
cpu_intr_0_322:
	setx	0x41031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d4000  ! 4232: XORcc_R	xorcc 	%r21, %r0, %r31
	.word 0xbde5a17c  ! 4233: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5208e  ! 4237: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_323:
	setx	0x43001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_324:
	setx	0x42032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_232:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbb3d3001  ! 4245: SRAX_I	srax	%r20, 0x0001, %r29
T0_asi_reg_wr_173:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 4250: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e56027  ! 4251: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e4a0c2  ! 4254: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_233:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb89c2102  ! 4257: XORcc_I	xorcc 	%r16, 0x0102, %r28
cpu_intr_0_325:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4263: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 4269: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_326:
	setx	0x400021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_327:
	setx	0x410035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5616e  ! 4278: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e56164  ! 4279: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e44000  ! 4283: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_328:
	setx	0x42000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x430030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e58000  ! 4287: SAVE_R	save	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e1fb  ! 4291: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4c000  ! 4292: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e58000  ! 4294: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e4600d  ! 4295: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, a)
	.word 0xbde5a1b0  ! 4297: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe44000  ! 4298: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_234:
	mov	0x12, %r14
	.word 0xfedb84a0  ! 4302: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_175:
	mov	0x35, %r14
	.word 0xf8f384a0  ! 4303: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e5a196  ! 4304: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 4312: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_235:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_177:
	mov	0x36, %r14
	.word 0xfef389e0  ! 4320: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_236:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 4323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e44000  ! 4328: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4609a  ! 4329: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4c000  ! 4333: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe44000  ! 4334: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe4e010  ! 4335: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8594618e  ! 4338: WRPR_TSTATE_I	wrpr	%r17, 0x018e, %tstate
	.word 0x8f902001  ! 4340: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbde58000  ! 4342: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_237:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_238:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e5c000  ! 4352: SAVE_R	save	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5c000  ! 4355: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_330:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42025  ! 4358: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde40000  ! 4360: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe46006  ! 4361: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe48000  ! 4364: SAVE_R	save	%r18, %r0, %r29
	.word 0xb7e50000  ! 4365: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1643801  ! 4367: MOVcc_I	<illegal instruction>
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe5c000  ! 4369: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e5a0f4  ! 4376: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb69d0000  ! 4377: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xb1e5e118  ! 4380: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_239:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 4387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_178:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 4388: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_331:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_332:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5602f  ! 4401: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_333:
	setx	0x43032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 4403: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3508000  ! 4404: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4a043  ! 4405: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_334:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 4409: SAVE_R	save	%r19, %r0, %r31
	.word 0xbd520000  ! 4413: RDPR_PIL	<illegal instruction>
	.word 0xb5e54000  ! 4415: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe58000  ! 4419: SAVE_R	save	%r22, %r0, %r29
	.word 0xbd7cc400  ! 4422: MOVR_R	movre	%r19, %r0, %r30
T0_asi_reg_wr_179:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 4423: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e58000  ! 4427: SAVE_R	save	%r22, %r0, %r26
	.word 0xb2c420b0  ! 4438: ADDCcc_I	addccc 	%r16, 0x00b0, %r25
	.word 0xbbe56196  ! 4440: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_335:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x5, %r14
	.word 0xfef38e60  ! 4445: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 37)
	.word 0xbcbc21cc  ! 4452: XNORcc_I	xnorcc 	%r16, 0x01cc, %r30
	.word 0xbf518000  ! 4453: RDPR_PSTATE	<illegal instruction>
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe4a0b0  ! 4456: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e4a1dc  ! 4458: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_336:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a071  ! 4460: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbca40000  ! 4461: SUBcc_R	subcc 	%r16, %r0, %r30
T0_asi_reg_rd_240:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 4462: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_337:
	setx	0x40033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_181:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 4467: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 4470: SAVE_R	save	%r20, %r0, %r26
	.word 0xb53dc000  ! 4472: SRA_R	sra 	%r23, %r0, %r26
T0_asi_reg_wr_182:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 4473: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb6050000  ! 4474: ADD_R	add 	%r20, %r0, %r27
	.word 0xbd7de401  ! 4479: MOVR_I	movre	%r23, 0x1, %r30
cpu_intr_0_338:
	setx	0x42012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x40001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a193  ! 4486: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_340:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_341:
	setx	0x430014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_342:
	setx	0x43033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4500: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 4506: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3e40000  ! 4507: SAVE_R	save	%r16, %r0, %r25
	.word 0xbc356056  ! 4508: SUBC_I	orn 	%r21, 0x0056, %r30
cpu_intr_0_343:
	setx	0x410039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4511: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe50000  ! 4513: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_344:
	setx	0x42021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_345:
	setx	0x40031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d3001  ! 4519: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xb1e560a2  ! 4521: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_241:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde54000  ! 4524: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_184:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 4526: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9e52021  ! 4527: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_242:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbb3d9000  ! 4538: SRAX_R	srax	%r22, %r0, %r29
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe56119  ! 4543: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde460a4  ! 4545: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_185:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 4547: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_186:
	mov	0x7, %r14
	.word 0xf8f38400  ! 4553: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_243:
	mov	0x31, %r14
	.word 0xf4db8e80  ! 4559: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb734b001  ! 4560: SRLX_I	srlx	%r18, 0x0001, %r27
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_346:
	setx	0x470026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_244:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e561c2  ! 4571: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e54000  ! 4572: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_187:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 4574: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_245:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e58000  ! 4579: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_347:
	setx	0x47020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_246:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_348:
	setx	0x470121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x470238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x46032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 4596: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e5a1a7  ! 4614: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_188:
	mov	0xe, %r14
	.word 0xf2f389e0  ! 4615: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_189:
	mov	0x20, %r14
	.word 0xf6f38400  ! 4617: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_351:
	setx	0x450032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_352:
	setx	0x440137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_190:
	mov	0x22, %r14
	.word 0xfef384a0  ! 4626: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5e54000  ! 4627: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e4c000  ! 4629: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe52053  ! 4632: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_247:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 4644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_353:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, d)
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_354:
	setx	0x440228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4655: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e421b0  ! 4656: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5201f  ! 4658: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e44000  ! 4659: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1e5e150  ! 4662: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_355:
	setx	0x45031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_356:
	setx	0x44021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4676: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e54000  ! 4680: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_248:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb6944000  ! 4682: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb9e40000  ! 4685: SAVE_R	save	%r16, %r0, %r28
	.word 0xbde5e0d8  ! 4687: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4e169  ! 4688: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5c000  ! 4689: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e48000  ! 4690: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe560a6  ! 4691: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e46050  ! 4693: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_249:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 4700: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb08d0000  ! 4702: ANDcc_R	andcc 	%r20, %r0, %r24
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_357:
	setx	0x440222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52114  ! 4709: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5e137  ! 4710: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_250:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e561e4  ! 4712: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbaa42074  ! 4714: SUBcc_I	subcc 	%r16, 0x0074, %r29
T0_asi_reg_wr_192:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 4716: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_251:
	mov	0x1e, %r14
	.word 0xfedb8400  ! 4719: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe4a1f4  ! 4720: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_252:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe5e1cb  ! 4730: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe40000  ! 4732: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e52029  ! 4734: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5a0a6  ! 4735: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde44000  ! 4736: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_193:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4740: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e4a173  ! 4746: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4754: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_253:
	mov	0x1c, %r14
	.word 0xfcdb89e0  ! 4756: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_358:
	setx	0x470301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 4758: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5643801  ! 4764: MOVcc_I	<illegal instruction>
cpu_intr_0_359:
	setx	0x450218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4770: SAVE_R	save	%r18, %r0, %r28
	.word 0xb13c0000  ! 4774: SRA_R	sra 	%r16, %r0, %r24
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, a)
	.word 0xb5e56177  ! 4782: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5e08e  ! 4784: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4a0a5  ! 4785: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_360:
	setx	0x440003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_361:
	setx	0x440331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde560b5  ! 4789: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e42000  ! 4791: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_195:
	mov	0x34, %r14
	.word 0xfaf389e0  ! 4797: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbb3da001  ! 4803: SRA_I	sra 	%r22, 0x0001, %r29
cpu_intr_0_362:
	setx	0x47000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a000  ! 4807: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb2b48000  ! 4809: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xbab50000  ! 4810: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xbde44000  ! 4813: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e5c000  ! 4814: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 2d)
	.word 0xba3ce1a2  ! 4817: XNOR_I	xnor 	%r19, 0x01a2, %r29
cpu_intr_0_363:
	setx	0x450329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_364:
	setx	0x44031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec46074  ! 4824: ADDCcc_I	addccc 	%r17, 0x0074, %r31
	.word 0xb7e5605a  ! 4826: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_365:
	setx	0x217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e50000  ! 4833: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe4a0cc  ! 4839: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe48000  ! 4843: SAVE_R	save	%r18, %r0, %r29
	.word 0xba450000  ! 4844: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xb0b58000  ! 4845: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xbde5e13d  ! 4847: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7508000  ! 4848: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4e0d6  ! 4850: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb22da199  ! 4855: ANDN_I	andn 	%r22, 0x0199, %r25
	.word 0xb72cb001  ! 4856: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xbde50000  ! 4858: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e560e2  ! 4859: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e54000  ! 4860: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_254:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4863: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_366:
	setx	0x45030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46057  ! 4867: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_367:
	setx	0x46000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_196:
	mov	0x19, %r14
	.word 0xf2f389e0  ! 4873: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 1)
	.word 0xb40c4000  ! 4876: AND_R	and 	%r17, %r0, %r26
	.word 0xb9e46106  ! 4880: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe420f7  ! 4883: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbeb40000  ! 4885: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xb72c2001  ! 4888: SLL_I	sll 	%r16, 0x0001, %r27
T0_asi_reg_wr_197:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 4892: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_368:
	setx	0x440221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e009  ! 4894: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_255:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9e44000  ! 4897: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e4e0eb  ! 4899: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x9194e07b  ! 4900: WRPR_PIL_I	wrpr	%r19, 0x007b, %pil
	.word 0xbde58000  ! 4903: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e4a135  ! 4904: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_369:
	setx	0x450326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_370:
	setx	0x46020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4917: SAVE_R	save	%r17, %r0, %r24
	.word 0xb5e44000  ! 4920: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_198:
	mov	0xd, %r14
	.word 0xf6f389e0  ! 4927: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbde4e089  ! 4929: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4c000  ! 4933: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_371:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1c0  ! 4936: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e54000  ! 4939: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e42183  ! 4941: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbe3d8000  ! 4942: XNOR_R	xnor 	%r22, %r0, %r31
	.word 0xb09460f8  ! 4945: ORcc_I	orcc 	%r17, 0x00f8, %r24
T0_asi_reg_wr_199:
	mov	0x0, %r14
	.word 0xf2f389e0  ! 4946: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e4c000  ! 4950: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_200:
	mov	0x18, %r14
	.word 0xf4f38e80  ! 4952: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_201:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 4954: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe52169  ! 4955: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5c000  ! 4957: SAVE_R	save	%r23, %r0, %r29
	.word 0xb1e5610b  ! 4958: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_256:
	mov	0x2d, %r14
	.word 0xf6db89e0  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_372:
	setx	0x47000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e123  ! 4962: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_202:
	mov	0x36, %r14
	.word 0xf8f389e0  ! 4963: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbca4209a  ! 4965: SUBcc_I	subcc 	%r16, 0x009a, %r30
T0_asi_reg_wr_203:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 4966: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_257:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e42030  ! 4968: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_373:
	setx	0x440306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3cd000  ! 4973: SRAX_R	srax	%r19, %r0, %r31
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e52012  ! 4979: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb214c000  ! 4980: OR_R	or 	%r19, %r0, %r25
	.word 0xbfe520e3  ! 4982: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e58000  ! 4985: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_204:
	mov	0x13, %r14
	.word 0xf8f384a0  ! 4986: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_374:
	setx	0x460037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1ef  ! 4991: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_375:
	setx	0x44022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4993: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe44000  ! 4994: SAVE_R	save	%r17, %r0, %r31
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
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 30)
	.word 0xfcad8020  ! 3: STBA_R	stba	%r30, [%r22 + %r0] 0x01
cpu_intr_3_0:
	setx	0x180215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x1a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02de0af  ! 7: STB_I	stb	%r24, [%r23 + 0x00af]
T3_asi_reg_rd_0:
	mov	0x36, %r14
	.word 0xf6db8e60  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_1:
	mov	0x20, %r14
	.word 0xf4db84a0  ! 11: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8f4a045  ! 12: STXA_I	stxa	%r28, [%r18 + 0x0045] %asi
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ed0  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed0, %hpstate
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_2:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_0:
	mov	0x36, %r14
	.word 0xf2f38400  ! 21: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_wr_1:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 23: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 35)
	.word 0xf02d4000  ! 27: STB_R	stb	%r24, [%r21 + %r0]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, b)
	.word 0xf2340000  ! 30: STH_R	sth	%r25, [%r16 + %r0]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, c)
	.word 0xb8bda042  ! 32: XNORcc_I	xnorcc 	%r22, 0x0042, %r28
T3_asi_reg_rd_2:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_3:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2b5a05f  ! 39: STHA_I	stha	%r25, [%r22 + 0x005f] %asi
T3_asi_reg_rd_4:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e8a  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
T3_asi_reg_wr_2:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 48: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa74e103  ! 52: STX_I	stx	%r29, [%r19 + 0x0103]
	.word 0xfe2d8000  ! 55: STB_R	stb	%r31, [%r22 + %r0]
cpu_intr_3_4:
	setx	0x1e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_3:
	mov	0x27, %r14
	.word 0xfef38e40  ! 62: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf82ca058  ! 64: STB_I	stb	%r28, [%r18 + 0x0058]
	.word 0xfaf5e131  ! 65: STXA_I	stxa	%r29, [%r23 + 0x0131] %asi
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_5:
	setx	0x1e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba252096  ! 76: SUB_I	sub 	%r20, 0x0096, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_6:
	setx	0x1d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb56093  ! 82: STHA_I	stha	%r30, [%r21 + 0x0093] %asi
cpu_intr_3_7:
	setx	0x1e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5a13c  ! 89: STHA_I	stha	%r26, [%r22 + 0x013c] %asi
	.word 0xf0b40020  ! 90: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 37)
	.word 0xba34a1be  ! 92: SUBC_I	orn 	%r18, 0x01be, %r29
	.word 0xf4b58020  ! 93: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf634e099  ! 94: STH_I	sth	%r27, [%r19 + 0x0099]
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a52  ! 95: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
T3_asi_reg_rd_5:
	mov	0x17, %r14
	.word 0xfcdb89e0  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_8:
	setx	0x1c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b88  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
	.word 0xfc2cc000  ! 101: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xfeb48020  ! 103: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_9:
	setx	0x1f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_10:
	setx	0x1c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_11:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 32)
	.word 0xf22cc000  ! 114: STB_R	stb	%r25, [%r19 + %r0]
cpu_intr_3_12:
	setx	0x1d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0adc020  ! 119: STBA_R	stba	%r24, [%r23 + %r0] 0x01
cpu_intr_3_13:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4e022  ! 127: STWA_I	stwa	%r26, [%r19 + 0x0022] %asi
T3_asi_reg_rd_6:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfeac0020  ! 130: STBA_R	stba	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_7:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_8:
	mov	0x7, %r14
	.word 0xfedb84a0  ! 135: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf82c4000  ! 136: STB_R	stb	%r28, [%r17 + %r0]
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_14:
	setx	0x1c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434a16d  ! 142: STH_I	sth	%r26, [%r18 + 0x016d]
T3_asi_reg_rd_9:
	mov	0xe, %r14
	.word 0xf6db8400  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfab48020  ! 145: STHA_R	stha	%r29, [%r18 + %r0] 0x01
cpu_intr_3_15:
	setx	0x10312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b52178  ! 149: STHA_I	stha	%r25, [%r20 + 0x0178] %asi
	.word 0xfef4a12a  ! 152: STXA_I	stxa	%r31, [%r18 + 0x012a] %asi
	.word 0xf2b54020  ! 153: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_10:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 157: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf434c000  ! 160: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf424e0b1  ! 161: STW_I	stw	%r26, [%r19 + 0x00b1]
	.word 0xfab40020  ! 163: STHA_R	stha	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_12:
	mov	0x1c, %r14
	.word 0xf6db8e60  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_16:
	setx	0x1c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_4:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 174: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc254000  ! 175: SUB_R	sub 	%r21, %r0, %r30
T3_asi_reg_wr_5:
	mov	0xf, %r14
	.word 0xf0f38400  ! 180: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_13:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 181: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb40460f5  ! 182: ADD_I	add 	%r17, 0x00f5, %r26
	.word 0xf6350000  ! 184: STH_R	sth	%r27, [%r20 + %r0]
cpu_intr_3_17:
	setx	0x1e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_14:
	mov	0x13, %r14
	.word 0xf4db84a0  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_18:
	setx	0x1c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_15:
	mov	0x8, %r14
	.word 0xfcdb8e40  ! 197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_19:
	setx	0x1c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 11)
	.word 0xbebd6167  ! 206: XNORcc_I	xnorcc 	%r21, 0x0167, %r31
T3_asi_reg_wr_6:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 207: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8b421fe  ! 208: STHA_I	stha	%r28, [%r16 + 0x01fe] %asi
	.word 0xb615a1a0  ! 211: OR_I	or 	%r22, 0x01a0, %r27
T3_asi_reg_wr_7:
	mov	0x30, %r14
	.word 0xfef38e40  ! 214: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 29)
	.word 0xbcb52096  ! 218: SUBCcc_I	orncc 	%r20, 0x0096, %r30
	.word 0xb8b4c000  ! 220: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0xf4740000  ! 221: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb43d8000  ! 222: XNOR_R	xnor 	%r22, %r0, %r26
cpu_intr_3_20:
	setx	0x1f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_21:
	setx	0x1f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8ad4020  ! 235: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_22:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d61bd  ! 241: AND_I	and 	%r21, 0x01bd, %r29
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_8:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 243: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, c)
	.word 0xf0f5a053  ! 250: STXA_I	stxa	%r24, [%r22 + 0x0053] %asi
	ta	T_CHANGE_HPRIV
	.word 0xbe3d211b  ! 255: XNOR_I	xnor 	%r20, 0x011b, %r31
	.word 0xf42ca1ef  ! 256: STB_I	stb	%r26, [%r18 + 0x01ef]
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa35c000  ! 260: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 5)
	.word 0xfc74a1c0  ! 264: STX_I	stx	%r30, [%r18 + 0x01c0]
cpu_intr_3_23:
	setx	0x1f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_24:
	setx	0x1e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c4000  ! 268: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf42da157  ! 272: STB_I	stb	%r26, [%r22 + 0x0157]
	.word 0xb6a54000  ! 273: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xfab5e03f  ! 274: STHA_I	stha	%r29, [%r23 + 0x003f] %asi
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0ac2124  ! 279: STBA_I	stba	%r24, [%r16 + 0x0124] %asi
	.word 0xfeb50020  ! 280: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_25:
	setx	0x1f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_9:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 283: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_26:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe75e0cf  ! 289: STX_I	stx	%r31, [%r23 + 0x00cf]
cpu_intr_3_27:
	setx	0x1d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_28:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_29:
	setx	0x1e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 309: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xf42d8000  ! 310: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_30:
	setx	0x1d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_16:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2ad21c5  ! 313: STBA_I	stba	%r25, [%r20 + 0x01c5] %asi
	.word 0xf47421b0  ! 319: STX_I	stx	%r26, [%r16 + 0x01b0]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_17:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 322: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe2d8000  ! 324: STB_R	stb	%r31, [%r22 + %r0]
T3_asi_reg_rd_18:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe340000  ! 327: STH_R	sth	%r31, [%r16 + %r0]
cpu_intr_3_31:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035c000  ! 331: STH_R	sth	%r24, [%r23 + %r0]
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 16)
	.word 0xfe7520ed  ! 334: STX_I	stx	%r31, [%r20 + 0x00ed]
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_10:
	mov	0xf, %r14
	.word 0xfaf38400  ! 338: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_32:
	setx	0x1f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 348: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf4f56065  ! 349: STXA_I	stxa	%r26, [%r21 + 0x0065] %asi
	.word 0xfe75e067  ! 350: STX_I	stx	%r31, [%r23 + 0x0067]
T3_asi_reg_wr_11:
	mov	0x35, %r14
	.word 0xfef38400  ! 353: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 354: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_33:
	setx	0x1e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e050  ! 357: STW_I	stw	%r29, [%r19 + 0x0050]
T3_asi_reg_wr_13:
	mov	0x1f, %r14
	.word 0xf2f389e0  ! 358: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb0c4a103  ! 363: ADDCcc_I	addccc 	%r18, 0x0103, %r24
	.word 0xf6248000  ! 364: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xb835a120  ! 365: ORN_I	orn 	%r22, 0x0120, %r28
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_19:
	mov	0x32, %r14
	.word 0xfedb8400  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_20:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8f4a1bb  ! 372: STXA_I	stxa	%r28, [%r18 + 0x01bb] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_21:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_22:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb035e06f  ! 383: ORN_I	orn 	%r23, 0x006f, %r24
T3_asi_reg_wr_14:
	mov	0x28, %r14
	.word 0xf6f38400  ! 387: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_34:
	setx	0x1f0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x1e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a09b  ! 396: STXA_I	stxa	%r31, [%r22 + 0x009b] %asi
T3_asi_reg_wr_15:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 398: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa2c0000  ! 401: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf2a5e10f  ! 402: STWA_I	stwa	%r25, [%r23 + 0x010f] %asi
T3_asi_reg_rd_23:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0f52144  ! 405: STXA_I	stxa	%r24, [%r20 + 0x0144] %asi
	.word 0xb92d3001  ! 406: SLLX_I	sllx	%r20, 0x0001, %r28
	.word 0xf8a54020  ! 409: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	.word 0xfc25c000  ! 411: STW_R	stw	%r30, [%r23 + %r0]
T3_asi_reg_wr_16:
	mov	0x36, %r14
	.word 0xf8f38400  ! 413: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_36:
	setx	0x1c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024205d  ! 417: STW_I	stw	%r24, [%r16 + 0x005d]
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c48  ! 420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
cpu_intr_3_37:
	setx	0x1f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_38:
	setx	0x1d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 424: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_24:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfef4a1d9  ! 429: STXA_I	stxa	%r31, [%r18 + 0x01d9] %asi
T3_asi_reg_wr_17:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 430: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_39:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d5000  ! 432: SRAX_R	srax	%r21, %r0, %r30
	.word 0xf8ac4020  ! 433: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xbe8d0000  ! 434: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xf0b50020  ! 435: STHA_R	stha	%r24, [%r20 + %r0] 0x01
T3_asi_reg_rd_25:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2b54020  ! 439: STHA_R	stha	%r25, [%r21 + %r0] 0x01
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 6)
	.word 0xbb7c6401  ! 443: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xf875c000  ! 446: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbca4e184  ! 447: SUBcc_I	subcc 	%r19, 0x0184, %r30
	.word 0xfe34c000  ! 449: STH_R	sth	%r31, [%r19 + %r0]
T3_asi_reg_rd_26:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 450: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_27:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 452: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf8f4e1da  ! 455: STXA_I	stxa	%r28, [%r19 + 0x01da] %asi
T3_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 459: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_28:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_29:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf62521ad  ! 466: STW_I	stw	%r27, [%r20 + 0x01ad]
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb0b54000  ! 471: ORNcc_R	orncc 	%r21, %r0, %r24
T3_asi_reg_rd_30:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_TO_TL1
	.word 0xf825615e  ! 479: STW_I	stw	%r28, [%r21 + 0x015e]
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 4)
	.word 0xf234c000  ! 481: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfa748000  ! 483: STX_R	stx	%r29, [%r18 + %r0]
cpu_intr_3_40:
	setx	0x210235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab44020  ! 485: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xfa2d21d2  ! 486: STB_I	stb	%r29, [%r20 + 0x01d2]
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_19:
	mov	0xd, %r14
	.word 0xf0f38e80  ! 490: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf2b44020  ! 494: STHA_R	stha	%r25, [%r17 + %r0] 0x01
cpu_intr_3_41:
	setx	0x23033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d209f  ! 502: STB_I	stb	%r31, [%r20 + 0x009f]
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfcadc020  ! 506: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf4740000  ! 507: STX_R	stx	%r26, [%r16 + %r0]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_42:
	setx	0x21002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x200238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 521: STX_R	stx	%r29, [%r21 + %r0]
cpu_intr_3_44:
	setx	0x20033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_45:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb12c6001  ! 538: SLL_I	sll 	%r17, 0x0001, %r24
cpu_intr_3_46:
	setx	0x20022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_47:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_31:
	mov	0xb, %r14
	.word 0xfedb84a0  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf6aca0f1  ! 548: STBA_I	stba	%r27, [%r18 + 0x00f1] %asi
	.word 0xb3504000  ! 550: RDPR_TNPC	rdpr	%tnpc, %r25
cpu_intr_3_48:
	setx	0x200126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_32:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf0b5208a  ! 562: STHA_I	stha	%r24, [%r20 + 0x008a] %asi
	.word 0xba850000  ! 563: ADDcc_R	addcc 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8a40020  ! 566: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xfab52042  ! 568: STHA_I	stha	%r29, [%r20 + 0x0042] %asi
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_33:
	mov	0x32, %r14
	.word 0xf6db89e0  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 29)
	.word 0xb52d6001  ! 581: SLL_I	sll 	%r21, 0x0001, %r26
T3_asi_reg_wr_20:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 583: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_34:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_49:
	setx	0x230318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824a164  ! 589: STW_I	stw	%r28, [%r18 + 0x0164]
	.word 0xfab420ae  ! 590: STHA_I	stha	%r29, [%r16 + 0x00ae] %asi
cpu_intr_3_50:
	setx	0x200109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5e13d  ! 598: ADDCcc_I	addccc 	%r23, 0x013d, %r25
	.word 0xf62c4000  ! 601: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 0)
	.word 0xf82c0000  ! 609: STB_R	stb	%r28, [%r16 + %r0]
T3_asi_reg_rd_35:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 610: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6acc020  ! 611: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xbc8d2106  ! 612: ANDcc_I	andcc 	%r20, 0x0106, %r30
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_51:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 620: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfe7461a8  ! 622: STX_I	stx	%r31, [%r17 + 0x01a8]
	.word 0xbe0d20af  ! 626: AND_I	and 	%r20, 0x00af, %r31
	.word 0xb80c60c5  ! 627: AND_I	and 	%r17, 0x00c5, %r28
	.word 0xfef5e061  ! 631: STXA_I	stxa	%r31, [%r23 + 0x0061] %asi
	.word 0xf6a4e08a  ! 637: STWA_I	stwa	%r27, [%r19 + 0x008a] %asi
	.word 0xf2a4e0c2  ! 639: STWA_I	stwa	%r25, [%r19 + 0x00c2] %asi
	.word 0xf4242160  ! 640: STW_I	stw	%r26, [%r16 + 0x0160]
T3_asi_reg_wr_21:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 641: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf6b4a189  ! 643: STHA_I	stha	%r27, [%r18 + 0x0189] %asi
cpu_intr_3_52:
	setx	0x21020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf224c000  ! 650: STW_R	stw	%r25, [%r19 + %r0]
T3_asi_reg_rd_37:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf824e044  ! 658: STW_I	stw	%r28, [%r19 + 0x0044]
T3_asi_reg_rd_38:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_39:
	mov	0x37, %r14
	.word 0xfadb84a0  ! 660: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfeac0020  ! 661: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xb80ca139  ! 662: AND_I	and 	%r18, 0x0139, %r28
	.word 0xf83560a5  ! 663: STH_I	sth	%r28, [%r21 + 0x00a5]
cpu_intr_3_53:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9346001  ! 668: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_54:
	setx	0x210106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 673: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 34)
	.word 0xf824e114  ! 678: STW_I	stw	%r28, [%r19 + 0x0114]
cpu_intr_3_55:
	setx	0x200013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe346104  ! 683: STH_I	sth	%r31, [%r17 + 0x0104]
T3_asi_reg_rd_40:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_41:
	mov	0x23, %r14
	.word 0xfcdb8e80  ! 686: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_56:
	setx	0x21021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_57:
	setx	0x230130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_22:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 697: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf6740000  ! 699: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfead4020  ! 700: STBA_R	stba	%r31, [%r21 + %r0] 0x01
cpu_intr_3_58:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22561dd  ! 705: STW_I	stw	%r25, [%r21 + 0x01dd]
cpu_intr_3_59:
	setx	0x200304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ce093  ! 708: STB_I	stb	%r29, [%r19 + 0x0093]
	.word 0xf0a40020  ! 709: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0x8f902000  ! 710: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xfaa4a123  ! 711: STWA_I	stwa	%r29, [%r18 + 0x0123] %asi
	.word 0xfc250000  ! 713: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf2b58020  ! 714: STHA_R	stha	%r25, [%r22 + %r0] 0x01
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0b5c020  ! 722: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf0a42079  ! 723: STWA_I	stwa	%r24, [%r16 + 0x0079] %asi
cpu_intr_3_60:
	setx	0x20000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfaf4a0fd  ! 728: STXA_I	stxa	%r29, [%r18 + 0x00fd] %asi
	.word 0xf634e057  ! 731: STH_I	sth	%r27, [%r19 + 0x0057]
	.word 0xbd3d9000  ! 732: SRAX_R	srax	%r22, %r0, %r30
	.word 0xfca40020  ! 734: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf6a5a08f  ! 740: STWA_I	stwa	%r27, [%r22 + 0x008f] %asi
	.word 0xfe2ce0a9  ! 742: STB_I	stb	%r31, [%r19 + 0x00a9]
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_23:
	mov	0x5, %r14
	.word 0xfef38e60  ! 747: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfcada12e  ! 748: STBA_I	stba	%r30, [%r22 + 0x012e] %asi
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dd2  ! 752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
T3_asi_reg_rd_43:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 753: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8250000  ! 755: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb93cd000  ! 759: SRAX_R	srax	%r19, %r0, %r28
	.word 0xf22de014  ! 760: STB_I	stb	%r25, [%r23 + 0x0014]
	.word 0xbd2c1000  ! 762: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xf4f4e0fa  ! 765: STXA_I	stxa	%r26, [%r19 + 0x00fa] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_61:
	setx	0x200200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_24:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 770: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfef5616a  ! 773: STXA_I	stxa	%r31, [%r21 + 0x016a] %asi
T3_asi_reg_rd_44:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_45:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7643801  ! 778: MOVcc_I	<illegal instruction>
cpu_intr_3_62:
	setx	0x230021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b420ae  ! 782: STHA_I	stha	%r28, [%r16 + 0x00ae] %asi
	.word 0xf4acc020  ! 783: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xfa752003  ! 790: STX_I	stx	%r29, [%r20 + 0x0003]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_63:
	setx	0x200130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_64:
	setx	0x210110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 797: STH_R	sth	%r24, [%r17 + %r0]
T3_asi_reg_wr_25:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 798: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2ac20dd  ! 800: STBA_I	stba	%r25, [%r16 + 0x00dd] %asi
cpu_intr_3_65:
	setx	0x200224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 806: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf6350000  ! 809: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb01c0000  ! 811: XOR_R	xor 	%r16, %r0, %r24
	.word 0xf6ac4020  ! 812: STBA_R	stba	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_46:
	mov	0x2e, %r14
	.word 0xf8db89e0  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfc75a192  ! 814: STX_I	stx	%r30, [%r22 + 0x0192]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_47:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbc952046  ! 824: ORcc_I	orcc 	%r20, 0x0046, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_66:
	setx	0x210212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c8000  ! 832: STB_R	stb	%r27, [%r18 + %r0]
cpu_intr_3_67:
	setx	0x21001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 838: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf6b4c020  ! 840: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xf6a46175  ! 844: STWA_I	stwa	%r27, [%r17 + 0x0175] %asi
T3_asi_reg_rd_49:
	mov	0x36, %r14
	.word 0xf8db84a0  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_68:
	setx	0x22010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29ca00f  ! 847: XORcc_I	xorcc 	%r18, 0x000f, %r25
cpu_intr_3_69:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_70:
	setx	0x200006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x20011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_26:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 855: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_72:
	setx	0x210228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 34)
	.word 0xba0561a5  ! 863: ADD_I	add 	%r21, 0x01a5, %r29
	.word 0xf4ad209e  ! 868: STBA_I	stba	%r26, [%r20 + 0x009e] %asi
	.word 0xf62c0000  ! 870: STB_R	stb	%r27, [%r16 + %r0]
cpu_intr_3_73:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 873: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_74:
	setx	0x230024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa58020  ! 878: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xb4a54000  ! 881: SUBcc_R	subcc 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_50:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbab58000  ! 888: ORNcc_R	orncc 	%r22, %r0, %r29
cpu_intr_3_75:
	setx	0x230139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_77:
	setx	0x200038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_52:
	mov	0x2, %r14
	.word 0xf6db8e80  ! 908: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_rd_53:
	mov	0x9, %r14
	.word 0xf6db8400  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe348000  ! 910: SUBC_R	orn 	%r18, %r0, %r31
T3_asi_reg_wr_28:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 911: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2acc020  ! 912: STBA_R	stba	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_29:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 913: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf63460b1  ! 915: STH_I	sth	%r27, [%r17 + 0x00b1]
T3_asi_reg_wr_30:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 917: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xb6ac4000  ! 922: ANDNcc_R	andncc 	%r17, %r0, %r27
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_78:
	setx	0x260214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21ca007  ! 928: XOR_I	xor 	%r18, 0x0007, %r25
T3_asi_reg_rd_54:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 929: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 18)
	.word 0xb8954000  ! 933: ORcc_R	orcc 	%r21, %r0, %r28
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_31:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 940: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfea40020  ! 943: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_32:
	mov	0x18, %r14
	.word 0xf2f389e0  ! 951: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5500000  ! 952: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf62d4000  ! 954: STB_R	stb	%r27, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_55:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 22)
	.word 0xf8342021  ! 967: STH_I	sth	%r28, [%r16 + 0x0021]
cpu_intr_3_79:
	setx	0x260325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 18)
	.word 0xf0aca1a7  ! 973: STBA_I	stba	%r24, [%r18 + 0x01a7] %asi
	.word 0xbe3d8000  ! 974: XNOR_R	xnor 	%r22, %r0, %r31
cpu_intr_3_80:
	setx	0x27032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_81:
	setx	0x240115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4a0fc  ! 978: STHA_I	stha	%r26, [%r18 + 0x00fc] %asi
cpu_intr_3_82:
	setx	0x240113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0x33, %r14
	.word 0xfcf38e60  ! 988: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 26)
	.word 0xba0c8000  ! 990: AND_R	and 	%r18, %r0, %r29
	.word 0xfead0020  ! 991: STBA_R	stba	%r31, [%r20 + %r0] 0x01
cpu_intr_3_83:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x26000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_56:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8adc020  ! 998: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf2ac8020  ! 1002: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xbeac8000  ! 1006: ANDNcc_R	andncc 	%r18, %r0, %r31
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_85:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf0a58020  ! 1017: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	.word 0xf8b56197  ! 1018: STHA_I	stha	%r28, [%r21 + 0x0197] %asi
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 10)
	.word 0x8195a12f  ! 1021: WRPR_TPC_I	wrpr	%r22, 0x012f, %tpc
cpu_intr_3_86:
	setx	0x240014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_57:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 28)
	.word 0xfcf4e019  ! 1042: STXA_I	stxa	%r30, [%r19 + 0x0019] %asi
	.word 0xf434600e  ! 1045: STH_I	sth	%r26, [%r17 + 0x000e]
	.word 0xb37d0400  ! 1048: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb8c5a014  ! 1049: ADDCcc_I	addccc 	%r22, 0x0014, %r28
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_TO_TL0
	.word 0xf4ace079  ! 1052: STBA_I	stba	%r26, [%r19 + 0x0079] %asi
T3_asi_reg_rd_58:
	mov	0x1, %r14
	.word 0xf4db8e40  ! 1054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe35a071  ! 1055: ORN_I	orn 	%r22, 0x0071, %r31
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_87:
	setx	0x25003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_34:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 1063: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8f560de  ! 1066: STXA_I	stxa	%r28, [%r21 + 0x00de] %asi
cpu_intr_3_88:
	setx	0x240326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a0e4  ! 1069: STXA_I	stxa	%r31, [%r22 + 0x00e4] %asi
cpu_intr_3_89:
	setx	0x260109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c8000  ! 1074: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfa250000  ! 1075: STW_R	stw	%r29, [%r20 + %r0]
T3_asi_reg_wr_35:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 1078: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb8c56002  ! 1079: ADDCcc_I	addccc 	%r21, 0x0002, %r28
	.word 0xfe240000  ! 1080: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_90:
	setx	0x270226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_91:
	setx	0x250130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x270004, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc258000  ! 1095: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_59:
	mov	0x37, %r14
	.word 0xf2db8e60  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf02d4000  ! 1101: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf6b5211f  ! 1105: STHA_I	stha	%r27, [%r20 + 0x011f] %asi
cpu_intr_3_93:
	setx	0x270318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 33)
	.word 0xf4aca1fd  ! 1108: STBA_I	stba	%r26, [%r18 + 0x01fd] %asi
	.word 0xf0ad0020  ! 1110: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xf6256117  ! 1112: STW_I	stw	%r27, [%r21 + 0x0117]
	.word 0xfeada18b  ! 1116: STBA_I	stba	%r31, [%r22 + 0x018b] %asi
	.word 0xfc258000  ! 1119: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xfa252130  ! 1120: STW_I	stw	%r29, [%r20 + 0x0130]
T3_asi_reg_rd_60:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf6a5c020  ! 1126: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf224c000  ! 1128: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_61:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e12  ! 1135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
cpu_intr_3_94:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d7001  ! 1142: SLLX_I	sllx	%r21, 0x0001, %r27
T3_asi_reg_wr_36:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 1143: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8ad8020  ! 1144: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf8b40020  ! 1147: STHA_R	stha	%r28, [%r16 + %r0] 0x01
cpu_intr_3_95:
	setx	0x270314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b54020  ! 1151: STHA_R	stha	%r25, [%r21 + %r0] 0x01
cpu_intr_3_96:
	setx	0x260134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x14, %r14
	.word 0xf8f38e60  ! 1153: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 24)
	.word 0xfeade183  ! 1155: STBA_I	stba	%r31, [%r23 + 0x0183] %asi
	.word 0xfaad200b  ! 1156: STBA_I	stba	%r29, [%r20 + 0x000b] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, a)
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_97:
	setx	0x260222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b46081  ! 1163: STHA_I	stha	%r27, [%r17 + 0x0081] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf62d0000  ! 1166: STB_R	stb	%r27, [%r20 + %r0]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe250000  ! 1174: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_62:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_98:
	setx	0x26020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_99:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_100:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf35d000  ! 1192: SRLX_R	srlx	%r23, %r0, %r31
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_63:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf8348000  ! 1198: STH_R	sth	%r28, [%r18 + %r0]
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cc8  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc8, %hpstate
T3_asi_reg_rd_64:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_65:
	mov	0x10, %r14
	.word 0xfadb8400  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_38:
	mov	0x3, %r14
	.word 0xfef384a0  ! 1203: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4a561f0  ! 1206: STWA_I	stwa	%r26, [%r21 + 0x01f0] %asi
T3_asi_reg_rd_66:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf4252000  ! 1208: STW_I	stw	%r26, [%r20 + 0x0000]
	.word 0xf835a152  ! 1209: STH_I	sth	%r28, [%r22 + 0x0152]
	.word 0xfe2da1e4  ! 1211: STB_I	stb	%r31, [%r22 + 0x01e4]
	.word 0xfe346105  ! 1213: STH_I	sth	%r31, [%r17 + 0x0105]
	.word 0xb0254000  ! 1214: SUB_R	sub 	%r21, %r0, %r24
T3_asi_reg_rd_67:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_rd_68:
	mov	0x18, %r14
	.word 0xfedb89e0  ! 1219: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_101:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 1224: MOVcc_I	<illegal instruction>
cpu_intr_3_102:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_69:
	mov	0xb, %r14
	.word 0xfedb8e80  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_70:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_39:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 1231: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_103:
	setx	0x250009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_40:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 1237: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_71:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbd500000  ! 1240: RDPR_TPC	rdpr	%tpc, %r30
cpu_intr_3_104:
	setx	0x25022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983cc8  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
T3_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 1244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_105:
	setx	0x24000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 21)
	.word 0xfcad0020  ! 1250: STBA_R	stba	%r30, [%r20 + %r0] 0x01
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2a561cc  ! 1253: STWA_I	stwa	%r25, [%r21 + 0x01cc] %asi
	.word 0xfcb58020  ! 1254: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983882  ! 1256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
	.word 0xf62c20e6  ! 1258: STB_I	stb	%r27, [%r16 + 0x00e6]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 19)
	.word 0xf6b48020  ! 1267: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xf8a4e054  ! 1269: STWA_I	stwa	%r28, [%r19 + 0x0054] %asi
T3_asi_reg_rd_73:
	mov	0x17, %r14
	.word 0xf8db8400  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_74:
	mov	0x1d, %r14
	.word 0xf8db84a0  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_41:
	mov	0x24, %r14
	.word 0xfef384a0  ! 1278: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_75:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_42:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 1286: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe248000  ! 1289: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_106:
	setx	0x240231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75a03e  ! 1291: STX_I	stx	%r30, [%r22 + 0x003e]
T3_asi_reg_rd_76:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 1296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcadc020  ! 1299: STBA_R	stba	%r30, [%r23 + %r0] 0x01
cpu_intr_3_107:
	setx	0x250038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d1000  ! 1303: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xf4ad0020  ! 1304: STBA_R	stba	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_77:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_78:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfeacc020  ! 1310: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_43:
	mov	0x13, %r14
	.word 0xf0f389e0  ! 1311: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8b56084  ! 1314: STHA_I	stha	%r28, [%r21 + 0x0084] %asi
	.word 0xf4a4e02c  ! 1319: STWA_I	stwa	%r26, [%r19 + 0x002c] %asi
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 32)
	.word 0xfa240000  ! 1322: STW_R	stw	%r29, [%r16 + %r0]
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_44:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 1328: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_108:
	setx	0x260237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3420ed  ! 1334: STH_I	sth	%r31, [%r16 + 0x00ed]
T3_asi_reg_rd_79:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_109:
	setx	0x250127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5c020  ! 1343: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_45:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 1344: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcb4e1ed  ! 1345: STHA_I	stha	%r30, [%r19 + 0x01ed] %asi
	.word 0xbcb54000  ! 1346: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xfc2de142  ! 1351: STB_I	stb	%r30, [%r23 + 0x0142]
	.word 0xb0acc000  ! 1354: ANDNcc_R	andncc 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ac8020  ! 1359: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_110:
	setx	0x27020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea521bf  ! 1375: STWA_I	stwa	%r31, [%r20 + 0x01bf] %asi
T3_asi_reg_rd_80:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 1376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb425a1e2  ! 1377: SUB_I	sub 	%r22, 0x01e2, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_46:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 1381: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_81:
	mov	0xd, %r14
	.word 0xf2db8400  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfc24e184  ! 1384: STW_I	stw	%r30, [%r19 + 0x0184]
	.word 0xb00cc000  ! 1385: AND_R	and 	%r19, %r0, %r24
T3_asi_reg_rd_82:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 1388: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf2aca1f6  ! 1392: STBA_I	stba	%r25, [%r18 + 0x01f6] %asi
	.word 0xf8b44020  ! 1394: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e0a  ! 1395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
cpu_intr_3_111:
	setx	0x28030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x28001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a521ba  ! 1398: STWA_I	stwa	%r25, [%r20 + 0x01ba] %asi
	.word 0xf63521a8  ! 1399: STH_I	sth	%r27, [%r20 + 0x01a8]
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_83:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8250000  ! 1404: STW_R	stw	%r28, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf625c000  ! 1406: STW_R	stw	%r27, [%r23 + %r0]
T3_asi_reg_wr_47:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 1407: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf635e0e9  ! 1408: STH_I	sth	%r27, [%r23 + 0x00e9]
	.word 0xf6346029  ! 1409: STH_I	sth	%r27, [%r17 + 0x0029]
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 3)
	.word 0xf2a4a170  ! 1418: STWA_I	stwa	%r25, [%r18 + 0x0170] %asi
cpu_intr_3_113:
	setx	0x2b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_114:
	setx	0x280201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_84:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 1424: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_85:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe7521fa  ! 1431: STX_I	stx	%r31, [%r20 + 0x01fa]
T3_asi_reg_rd_86:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe2ce04c  ! 1433: STB_I	stb	%r31, [%r19 + 0x004c]
T3_asi_reg_wr_48:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 1438: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfef4e166  ! 1439: STXA_I	stxa	%r31, [%r19 + 0x0166] %asi
	.word 0xf4348000  ! 1440: STH_R	sth	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8b520fb  ! 1443: STHA_I	stha	%r28, [%r20 + 0x00fb] %asi
T3_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1445: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xfa24e075  ! 1452: STW_I	stw	%r29, [%r19 + 0x0075]
	.word 0xfa348000  ! 1454: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2252126  ! 1457: STW_I	stw	%r25, [%r20 + 0x0126]
	.word 0xfea54020  ! 1458: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	.word 0xf0a5e183  ! 1459: STWA_I	stwa	%r24, [%r23 + 0x0183] %asi
	.word 0xfaa5c020  ! 1462: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
T3_asi_reg_rd_87:
	mov	0x37, %r14
	.word 0xf2db8e80  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf87461da  ! 1466: STX_I	stx	%r28, [%r17 + 0x01da]
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_50:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 1469: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_88:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2ac6167  ! 1471: STBA_I	stba	%r25, [%r17 + 0x0167] %asi
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_115:
	setx	0x28021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x280333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b46173  ! 1478: STHA_I	stha	%r27, [%r17 + 0x0173] %asi
	.word 0xf8a5c020  ! 1479: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
cpu_intr_3_117:
	setx	0x2a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074c000  ! 1482: STX_R	stx	%r24, [%r19 + %r0]
T3_asi_reg_rd_89:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_51:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1488: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfa752033  ! 1492: STX_I	stx	%r29, [%r20 + 0x0033]
cpu_intr_3_118:
	setx	0x290109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2344000  ! 1495: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xfc34e174  ! 1496: STH_I	sth	%r30, [%r19 + 0x0174]
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 5)
	.word 0xf435a0f4  ! 1500: STH_I	sth	%r26, [%r22 + 0x00f4]
	ta	T_CHANGE_TO_TL1
	.word 0xf835c000  ! 1507: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfc35e053  ! 1512: STH_I	sth	%r30, [%r23 + 0x0053]
T3_asi_reg_rd_90:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8b42053  ! 1514: STHA_I	stha	%r28, [%r16 + 0x0053] %asi
	.word 0xfa2c0000  ! 1516: STB_R	stb	%r29, [%r16 + %r0]
cpu_intr_3_119:
	setx	0x290013, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_52:
	mov	0x11, %r14
	.word 0xf4f38400  ! 1518: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf434a0ac  ! 1519: STH_I	sth	%r26, [%r18 + 0x00ac]
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_91:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_92:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9540000  ! 1525: RDPR_GL	rdpr	%-, %r28
cpu_intr_3_120:
	setx	0x2b000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d08  ! 1528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d08, %hpstate
	.word 0xf4742191  ! 1529: STX_I	stx	%r26, [%r16 + 0x0191]
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198295a  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
cpu_intr_3_121:
	setx	0x2b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_122:
	setx	0x290010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34209d  ! 1535: STH_I	sth	%r31, [%r16 + 0x009d]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 16)
	.word 0xfef560c1  ! 1538: STXA_I	stxa	%r31, [%r21 + 0x00c1] %asi
	.word 0xf2250000  ! 1539: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_rd_93:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf6b46082  ! 1541: STHA_I	stha	%r27, [%r17 + 0x0082] %asi
	.word 0xf42c8000  ! 1542: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_123:
	setx	0x2b021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe34a090  ! 1547: STH_I	sth	%r31, [%r18 + 0x0090]
	.word 0xf87461d6  ! 1549: STX_I	stx	%r28, [%r17 + 0x01d6]
	.word 0xf4aca094  ! 1555: STBA_I	stba	%r26, [%r18 + 0x0094] %asi
	.word 0xfaad2141  ! 1556: STBA_I	stba	%r29, [%r20 + 0x0141] %asi
	.word 0xf4b4e11f  ! 1557: STHA_I	stha	%r26, [%r19 + 0x011f] %asi
	.word 0xf63561c6  ! 1559: STH_I	sth	%r27, [%r21 + 0x01c6]
T3_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 1560: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfeb58020  ! 1566: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf2ac4020  ! 1567: STBA_R	stba	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_95:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d88  ! 1573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xfe3420da  ! 1575: STH_I	sth	%r31, [%r16 + 0x00da]
cpu_intr_3_124:
	setx	0x2a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_125:
	setx	0x2a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 1580: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf4b4a184  ! 1583: STHA_I	stha	%r26, [%r18 + 0x0184] %asi
	.word 0xfcb5a135  ! 1585: STHA_I	stha	%r30, [%r22 + 0x0135] %asi
T3_asi_reg_rd_96:
	mov	0x31, %r14
	.word 0xf2db84a0  ! 1587: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc3520ff  ! 1589: STH_I	sth	%r30, [%r20 + 0x00ff]
	.word 0xb82ce1ee  ! 1591: ANDN_I	andn 	%r19, 0x01ee, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfcad60ed  ! 1593: STBA_I	stba	%r30, [%r21 + 0x00ed] %asi
	.word 0xb88cc000  ! 1594: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xf82c6092  ! 1596: STB_I	stb	%r28, [%r17 + 0x0092]
	.word 0xf8aca085  ! 1597: STBA_I	stba	%r28, [%r18 + 0x0085] %asi
cpu_intr_3_126:
	setx	0x28030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead60af  ! 1601: STBA_I	stba	%r31, [%r21 + 0x00af] %asi
T3_asi_reg_rd_97:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb80de0bd  ! 1607: AND_I	and 	%r23, 0x00bd, %r28
cpu_intr_3_127:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3421a8  ! 1610: STH_I	sth	%r29, [%r16 + 0x01a8]
cpu_intr_3_128:
	setx	0x280036, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_98:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1616: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfcac8020  ! 1618: STBA_R	stba	%r30, [%r18 + %r0] 0x01
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_54:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf82561c6  ! 1623: STW_I	stw	%r28, [%r21 + 0x01c6]
T3_asi_reg_wr_55:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 1626: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4254000  ! 1627: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfe3560fb  ! 1628: STH_I	sth	%r31, [%r21 + 0x00fb]
	.word 0xf62d218a  ! 1629: STB_I	stb	%r27, [%r20 + 0x018a]
cpu_intr_3_129:
	setx	0x2a0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 14)
	.word 0xf025c000  ! 1636: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_rd_100:
	mov	0x1, %r14
	.word 0xfadb8e80  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb17cc400  ! 1639: MOVR_R	movre	%r19, %r0, %r24
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 19)
	.word 0xfe34a07d  ! 1648: STH_I	sth	%r31, [%r18 + 0x007d]
cpu_intr_3_130:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62421e8  ! 1656: STW_I	stw	%r27, [%r16 + 0x01e8]
	.word 0xf6742042  ! 1660: STX_I	stx	%r27, [%r16 + 0x0042]
	ta	T_CHANGE_HPRIV
	.word 0xf025602c  ! 1665: STW_I	stw	%r24, [%r21 + 0x002c]
	.word 0xfc25e0c5  ! 1666: STW_I	stw	%r30, [%r23 + 0x00c5]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 39)
	.word 0xb92d2001  ! 1671: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xb17ce401  ! 1675: MOVR_I	movre	%r19, 0x1, %r24
cpu_intr_3_131:
	setx	0x2a0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 1677: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_101:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1480000  ! 1681: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
cpu_intr_3_132:
	setx	0x290126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75a0aa  ! 1684: STX_I	stx	%r29, [%r22 + 0x00aa]
cpu_intr_3_133:
	setx	0x280321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3)
	.word 0xf02c0000  ! 1691: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xbebcc000  ! 1693: XNORcc_R	xnorcc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_102:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, a)
	.word 0xb2346184  ! 1707: SUBC_I	orn 	%r17, 0x0184, %r25
cpu_intr_3_134:
	setx	0x29010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_135:
	setx	0x290236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 1712: STW_R	stw	%r30, [%r22 + %r0]
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d50  ! 1713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
T3_asi_reg_rd_103:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 1719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfab54020  ! 1721: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xfa34a11d  ! 1722: STH_I	sth	%r29, [%r18 + 0x011d]
T3_asi_reg_wr_57:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 1727: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa2d0000  ! 1728: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc2c6153  ! 1730: STB_I	stb	%r30, [%r17 + 0x0153]
	.word 0xfcad4020  ! 1731: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_58:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 1732: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_105:
	mov	0x25, %r14
	.word 0xf4db84a0  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6244000  ! 1734: STW_R	stw	%r27, [%r17 + %r0]
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_106:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, c)
	.word 0xbeb5e13d  ! 1748: SUBCcc_I	orncc 	%r23, 0x013d, %r31
cpu_intr_3_136:
	setx	0x28033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_137:
	setx	0x290218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 1759: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 30)
	.word 0xb32d7001  ! 1764: SLLX_I	sllx	%r21, 0x0001, %r25
	.word 0xfa35612e  ! 1765: STH_I	sth	%r29, [%r21 + 0x012e]
	.word 0xb82dc000  ! 1770: ANDN_R	andn 	%r23, %r0, %r28
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c98  ! 1771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c98, %hpstate
	.word 0xfc2c4000  ! 1772: STB_R	stb	%r30, [%r17 + %r0]
T3_asi_reg_wr_60:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 1777: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_138:
	setx	0x2b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1784: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb93da001  ! 1787: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xf8248000  ! 1789: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf8250000  ! 1790: STW_R	stw	%r28, [%r20 + %r0]
	.word 0x85946017  ! 1792: WRPR_TSTATE_I	wrpr	%r17, 0x0017, %tstate
	.word 0xf8a48020  ! 1793: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xf6a58020  ! 1796: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
cpu_intr_3_139:
	setx	0x2a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_140:
	setx	0x290026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe742050  ! 1807: STX_I	stx	%r31, [%r16 + 0x0050]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_141:
	setx	0x2b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_62:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 1816: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf225a18d  ! 1818: STW_I	stw	%r25, [%r22 + 0x018d]
T3_asi_reg_rd_107:
	mov	0x25, %r14
	.word 0xfadb8e80  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_63:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 1822: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xf075a1ff  ! 1826: STX_I	stx	%r24, [%r22 + 0x01ff]
	.word 0xb40d4000  ! 1829: AND_R	and 	%r21, %r0, %r26
	.word 0xbe852070  ! 1831: ADDcc_I	addcc 	%r20, 0x0070, %r31
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_108:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfeb50020  ! 1838: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xf635c000  ! 1840: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf82c8000  ! 1842: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf2344000  ! 1843: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xbeb5c000  ! 1844: ORNcc_R	orncc 	%r23, %r0, %r31
cpu_intr_3_142:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 1847: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf635e0bc  ! 1848: STH_I	sth	%r27, [%r23 + 0x00bc]
	.word 0xfe258000  ! 1850: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xfcade1aa  ! 1851: STBA_I	stba	%r30, [%r23 + 0x01aa] %asi
	.word 0xf42d4000  ! 1855: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb12d8000  ! 1859: SLL_R	sll 	%r22, %r0, %r24
T3_asi_reg_rd_109:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2a560f1  ! 1861: STWA_I	stwa	%r25, [%r21 + 0x00f1] %asi
cpu_intr_3_143:
	setx	0x2f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaa40020  ! 1870: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xfc75e1aa  ! 1871: STX_I	stx	%r30, [%r23 + 0x01aa]
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf2b48020  ! 1873: STHA_R	stha	%r25, [%r18 + %r0] 0x01
cpu_intr_3_144:
	setx	0x2e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba040000  ! 1877: ADD_R	add 	%r16, %r0, %r29
cpu_intr_3_145:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 1881: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_146:
	setx	0x2c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, b)
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf4a4c020  ! 1887: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xb6b50000  ! 1890: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xbd641800  ! 1893: MOVcc_R	<illegal instruction>
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 1897: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 1900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 20)
	.word 0xf674e158  ! 1905: STX_I	stx	%r27, [%r19 + 0x0158]
	.word 0xf225c000  ! 1906: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 9)
	.word 0xb72d8000  ! 1911: SLL_R	sll 	%r22, %r0, %r27
T3_asi_reg_wr_64:
	mov	0x1, %r14
	.word 0xf2f384a0  ! 1912: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_147:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b58020  ! 1914: STHA_R	stha	%r28, [%r22 + %r0] 0x01
cpu_intr_3_148:
	setx	0x2d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_112:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 1917: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_149:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0xc, %r14
	.word 0xfedb84a0  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf435211b  ! 1924: STH_I	sth	%r26, [%r20 + 0x011b]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_150:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_114:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 1932: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_65:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 1937: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_115:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 1940: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 1941: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_67:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1943: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfca5e1b5  ! 1944: STWA_I	stwa	%r30, [%r23 + 0x01b5] %asi
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf435c000  ! 1947: STH_R	sth	%r26, [%r23 + %r0]
cpu_intr_3_151:
	setx	0x2e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_152:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_116:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 1953: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbb520000  ! 1958: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf0aca14d  ! 1959: STBA_I	stba	%r24, [%r18 + 0x014d] %asi
T3_asi_reg_wr_68:
	mov	0xc, %r14
	.word 0xfaf384a0  ! 1961: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_69:
	mov	0x11, %r14
	.word 0xfef38e60  ! 1962: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb950c000  ! 1963: RDPR_TT	<illegal instruction>
	.word 0xfca58020  ! 1964: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	.word 0xb4b56051  ! 1966: SUBCcc_I	orncc 	%r21, 0x0051, %r26
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb6b40000  ! 1983: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb6a4c000  ! 1984: SUBcc_R	subcc 	%r19, %r0, %r27
	.word 0xf0248000  ! 1986: STW_R	stw	%r24, [%r18 + %r0]
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad2  ! 1987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
	.word 0xfe35a0f2  ! 1988: STH_I	sth	%r31, [%r22 + 0x00f2]
cpu_intr_3_154:
	setx	0x2f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad0020  ! 1994: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb461a2  ! 1998: STHA_I	stha	%r31, [%r17 + 0x01a2] %asi
T3_asi_reg_rd_117:
	mov	0x1a, %r14
	.word 0xf2db8e60  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_70:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 2002: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_155:
	setx	0x2e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc248000  ! 2012: STW_R	stw	%r30, [%r18 + %r0]
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4a44020  ! 2020: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6a4a16d  ! 2023: STWA_I	stwa	%r27, [%r18 + 0x016d] %asi
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 1c)
	.word 0xbf500000  ! 2025: RDPR_TPC	rdpr	%tpc, %r31
cpu_intr_3_156:
	setx	0x2c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca0c8  ! 2029: STB_I	stb	%r30, [%r18 + 0x00c8]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2b4a0dd  ! 2033: STHA_I	stha	%r25, [%r18 + 0x00dd] %asi
	.word 0xf4f4601e  ! 2037: STXA_I	stxa	%r26, [%r17 + 0x001e] %asi
	.word 0xf4ad4020  ! 2038: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, c)
	.word 0xf4254000  ! 2040: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf2a4a18e  ! 2043: STWA_I	stwa	%r25, [%r18 + 0x018e] %asi
T3_asi_reg_wr_71:
	mov	0x26, %r14
	.word 0xf8f38400  ! 2046: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_157:
	setx	0x2c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b44020  ! 2050: STHA_R	stha	%r24, [%r17 + %r0] 0x01
cpu_intr_3_158:
	setx	0x2e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_118:
	mov	0xc, %r14
	.word 0xf0db8e40  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfef521e6  ! 2062: STXA_I	stxa	%r31, [%r20 + 0x01e6] %asi
	ta	T_CHANGE_HPRIV
	.word 0xfe246079  ! 2066: STW_I	stw	%r31, [%r17 + 0x0079]
	.word 0xf8b58020  ! 2067: STHA_R	stha	%r28, [%r22 + %r0] 0x01
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 32)
	.word 0xf8344000  ! 2069: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf8b521ea  ! 2072: STHA_I	stha	%r28, [%r20 + 0x01ea] %asi
cpu_intr_3_159:
	setx	0x2f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_72:
	mov	0x29, %r14
	.word 0xf2f384a0  ! 2074: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_119:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf835a12e  ! 2078: STH_I	sth	%r28, [%r22 + 0x012e]
cpu_intr_3_160:
	setx	0x2c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_120:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 2081: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
cpu_intr_3_161:
	setx	0x2f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 2087: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf22d4000  ! 2090: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xbe858000  ! 2092: ADDcc_R	addcc 	%r22, %r0, %r31
T3_asi_reg_wr_73:
	mov	0x1a, %r14
	.word 0xfcf384a0  ! 2094: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf4b5a1bb  ! 2095: STHA_I	stha	%r26, [%r22 + 0x01bb] %asi
T3_asi_reg_rd_121:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf475211b  ! 2097: STX_I	stx	%r26, [%r20 + 0x011b]
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2d2184  ! 2103: STB_I	stb	%r29, [%r20 + 0x0184]
T3_asi_reg_rd_122:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfaacc020  ! 2106: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf6b4212e  ! 2110: STHA_I	stha	%r27, [%r16 + 0x012e] %asi
	.word 0xfaa4a0c7  ! 2111: STWA_I	stwa	%r29, [%r18 + 0x00c7] %asi
T3_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_NONHPRIV
	.word 0xf0354000  ! 2127: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_rd_124:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe350000  ! 2130: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf2a50020  ! 2131: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf035a10b  ! 2133: STH_I	sth	%r24, [%r22 + 0x010b]
	.word 0xf82ca03b  ! 2137: STB_I	stb	%r28, [%r18 + 0x003b]
T3_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 2138: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_162:
	setx	0x2d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c8000  ! 2143: XOR_R	xor 	%r18, %r0, %r29
T3_asi_reg_wr_75:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 2145: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_163:
	setx	0x2e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_164:
	setx	0x2d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 2150: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_76:
	mov	0x31, %r14
	.word 0xf8f38e60  ! 2151: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9641800  ! 2154: MOVcc_R	<illegal instruction>
	.word 0xf4a54020  ! 2155: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_125:
	mov	0xd, %r14
	.word 0xfcdb8e80  ! 2157: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0ad0020  ! 2159: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_77:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 2161: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_165:
	setx	0x2e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_126:
	mov	0x0, %r14
	.word 0xf8db8400  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe346191  ! 2168: STH_I	sth	%r31, [%r17 + 0x0191]
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_166:
	setx	0x2c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4a053  ! 2172: STWA_I	stwa	%r27, [%r18 + 0x0053] %asi
T3_asi_reg_rd_127:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_167:
	setx	0x2d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_168:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe250000  ! 2185: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_169:
	setx	0x2e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8344000  ! 2192: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf6258000  ! 2193: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_78:
	mov	0x32, %r14
	.word 0xfaf38400  ! 2195: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_128:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_129:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_130:
	mov	0x2a, %r14
	.word 0xf8db89e0  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_131:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc250000  ! 2206: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfc75e15e  ! 2208: STX_I	stx	%r30, [%r23 + 0x015e]
cpu_intr_3_170:
	setx	0x2c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6b50020  ! 2219: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c42  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c42, %hpstate
	.word 0xb634c000  ! 2224: ORN_R	orn 	%r19, %r0, %r27
T3_asi_reg_wr_79:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 2226: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_171:
	setx	0x2c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad21a3  ! 2234: STBA_I	stba	%r24, [%r20 + 0x01a3] %asi
	.word 0xf0a4a0d6  ! 2235: STWA_I	stwa	%r24, [%r18 + 0x00d6] %asi
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8a56129  ! 2237: STWA_I	stwa	%r28, [%r21 + 0x0129] %asi
	.word 0xfcf5607f  ! 2245: STXA_I	stxa	%r30, [%r21 + 0x007f] %asi
	.word 0xf2ade1f4  ! 2255: STBA_I	stba	%r25, [%r23 + 0x01f4] %asi
	.word 0xf42ce1c2  ! 2258: STB_I	stb	%r26, [%r19 + 0x01c2]
	.word 0xf625a0d1  ! 2259: STW_I	stw	%r27, [%r22 + 0x00d1]
T3_asi_reg_rd_133:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f4a  ! 2261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xf635a138  ! 2262: STH_I	sth	%r27, [%r22 + 0x0138]
	.word 0xfaf4a1f9  ! 2265: STXA_I	stxa	%r29, [%r18 + 0x01f9] %asi
	.word 0xf8ad0020  ! 2266: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2267: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf4b46053  ! 2270: STHA_I	stha	%r26, [%r17 + 0x0053] %asi
cpu_intr_3_172:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea48000  ! 2273: SUBcc_R	subcc 	%r18, %r0, %r31
T3_asi_reg_wr_80:
	mov	0x28, %r14
	.word 0xf8f384a0  ! 2275: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2b54020  ! 2276: STHA_R	stha	%r25, [%r21 + %r0] 0x01
cpu_intr_3_173:
	setx	0x2f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 2281: STH_R	sth	%r31, [%r17 + %r0]
T3_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2282: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_136:
	mov	0x10, %r14
	.word 0xf2db89e0  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 11)
	.word 0xfc34e162  ! 2289: STH_I	sth	%r30, [%r19 + 0x0162]
	.word 0xfcf4203a  ! 2293: STXA_I	stxa	%r30, [%r16 + 0x003a] %asi
	.word 0xb53dd000  ! 2295: SRAX_R	srax	%r23, %r0, %r26
cpu_intr_3_174:
	setx	0x300126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_81:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 2302: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_175:
	setx	0x330002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_176:
	setx	0x310138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad4020  ! 2305: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xbebc0000  ! 2306: XNORcc_R	xnorcc 	%r16, %r0, %r31
	.word 0xf8f4614d  ! 2310: STXA_I	stxa	%r28, [%r17 + 0x014d] %asi
cpu_intr_3_177:
	setx	0x310332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75a1f3  ! 2313: STX_I	stx	%r30, [%r22 + 0x01f3]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_178:
	setx	0x31002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x32013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 2317: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbe2ce15a  ! 2319: ANDN_I	andn 	%r19, 0x015a, %r31
T3_asi_reg_rd_138:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 2320: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf235a004  ! 2321: STH_I	sth	%r25, [%r22 + 0x0004]
	ta	T_CHANGE_TO_TL1
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb235a1fd  ! 2326: ORN_I	orn 	%r22, 0x01fd, %r25
	.word 0xfa25211d  ! 2328: STW_I	stw	%r29, [%r20 + 0x011d]
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 29)
	.word 0xbc1c20b8  ! 2331: XOR_I	xor 	%r16, 0x00b8, %r30
cpu_intr_3_180:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5c020  ! 2333: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
cpu_intr_3_181:
	setx	0x300024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4a009  ! 2336: STWA_I	stwa	%r29, [%r18 + 0x0009] %asi
T3_asi_reg_wr_82:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 2338: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb41d20fa  ! 2343: XOR_I	xor 	%r20, 0x00fa, %r26
T3_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2346: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_84:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 2348: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_139:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf6758000  ! 2351: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, c)
	.word 0xf634610b  ! 2360: STH_I	sth	%r27, [%r17 + 0x010b]
T3_asi_reg_rd_140:
	mov	0x32, %r14
	.word 0xf6db8400  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2a4e03d  ! 2362: STWA_I	stwa	%r25, [%r19 + 0x003d] %asi
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc2dc000  ! 2367: STB_R	stb	%r30, [%r23 + %r0]
cpu_intr_3_182:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_141:
	mov	0x1c, %r14
	.word 0xf6db8e80  ! 2369: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a40020  ! 2371: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xfc25e093  ! 2372: STW_I	stw	%r30, [%r23 + 0x0093]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_183:
	setx	0x31032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6f56144  ! 2379: STXA_I	stxa	%r27, [%r21 + 0x0144] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb014e172  ! 2383: OR_I	or 	%r19, 0x0172, %r24
	.word 0xfc34a05f  ! 2384: STH_I	sth	%r30, [%r18 + 0x005f]
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819839c0  ! 2385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c0, %hpstate
	.word 0xf4ad607b  ! 2386: STBA_I	stba	%r26, [%r21 + 0x007b] %asi
	.word 0xb49c0000  ! 2388: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xf4248000  ! 2390: STW_R	stw	%r26, [%r18 + %r0]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbf641800  ! 2396: MOVcc_R	<illegal instruction>
	.word 0xbab58000  ! 2398: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xf4340000  ! 2400: STH_R	sth	%r26, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf6b44020  ! 2404: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf6348000  ! 2406: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_184:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_185:
	setx	0x310119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224a16e  ! 2412: STW_I	stw	%r25, [%r18 + 0x016e]
	.word 0xb23ce06d  ! 2414: XNOR_I	xnor 	%r19, 0x006d, %r25
	.word 0xf224e06d  ! 2415: STW_I	stw	%r25, [%r19 + 0x006d]
	.word 0xfcb40020  ! 2416: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf425612f  ! 2417: STW_I	stw	%r26, [%r21 + 0x012f]
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_186:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_187:
	setx	0x330127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_143:
	mov	0x12, %r14
	.word 0xfadb8e80  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_85:
	mov	0x36, %r14
	.word 0xf6f389e0  ! 2428: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf62ca16a  ! 2431: STB_I	stb	%r27, [%r18 + 0x016a]
	.word 0xbe04608c  ! 2432: ADD_I	add 	%r17, 0x008c, %r31
	.word 0xf0ac6113  ! 2433: STBA_I	stba	%r24, [%r17 + 0x0113] %asi
	.word 0xfa24e19b  ! 2434: STW_I	stw	%r29, [%r19 + 0x019b]
T3_asi_reg_rd_144:
	mov	0x5, %r14
	.word 0xf0db89e0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfaac8020  ! 2437: STBA_R	stba	%r29, [%r18 + %r0] 0x01
T3_asi_reg_wr_86:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 2442: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_188:
	setx	0x330035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_146:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 2448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_87:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 2450: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_147:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 2455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfcac61b8  ! 2456: STBA_I	stba	%r30, [%r17 + 0x01b8] %asi
cpu_intr_3_189:
	setx	0x300005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x22, %r14
	.word 0xf0f384a0  ! 2462: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf0a40020  ! 2463: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xb8054000  ! 2465: ADD_R	add 	%r21, %r0, %r28
	.word 0xba05c000  ! 2470: ADD_R	add 	%r23, %r0, %r29
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, a)
	.word 0xf0742141  ! 2473: STX_I	stx	%r24, [%r16 + 0x0141]
T3_asi_reg_rd_148:
	mov	0x14, %r14
	.word 0xf2db8400  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf8ade1a2  ! 2475: STBA_I	stba	%r28, [%r23 + 0x01a2] %asi
	.word 0xfc34a0c6  ! 2478: STH_I	sth	%r30, [%r18 + 0x00c6]
	.word 0xf03421e3  ! 2479: STH_I	sth	%r24, [%r16 + 0x01e3]
T3_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 2483: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_90:
	mov	0x21, %r14
	.word 0xfef384a0  ! 2484: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_190:
	setx	0x33020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba1d8000  ! 2489: XOR_R	xor 	%r22, %r0, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf4ace0e2  ! 2496: STBA_I	stba	%r26, [%r19 + 0x00e2] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf4b44020  ! 2498: STHA_R	stha	%r26, [%r17 + %r0] 0x01
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_TO_TL1
	.word 0xfab48020  ! 2510: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xfcb40020  ! 2515: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_91:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 2518: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf62c4000  ! 2520: STB_R	stb	%r27, [%r17 + %r0]
T3_asi_reg_rd_149:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, a)
	.word 0xf435a1a7  ! 2528: STH_I	sth	%r26, [%r22 + 0x01a7]
	.word 0xfea48020  ! 2530: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 2535: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf6ac8020  ! 2536: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_93:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2538: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf82c4000  ! 2539: STB_R	stb	%r28, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4a4a007  ! 2541: STWA_I	stwa	%r26, [%r18 + 0x0007] %asi
	.word 0xb52c2001  ! 2542: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xf4250000  ! 2543: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf2754000  ! 2545: STX_R	stx	%r25, [%r21 + %r0]
cpu_intr_3_191:
	setx	0x33001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_151:
	mov	0x23, %r14
	.word 0xf0db8400  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_152:
	mov	0x25, %r14
	.word 0xfadb8400  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_94:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 2554: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_192:
	setx	0x300233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 2556: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf0ad4020  ! 2557: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf22ce0a5  ! 2558: STB_I	stb	%r25, [%r19 + 0x00a5]
	.word 0xbe0c20df  ! 2559: AND_I	and 	%r16, 0x00df, %r31
T3_asi_reg_wr_95:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 2561: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_153:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 2562: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf8754000  ! 2564: STX_R	stx	%r28, [%r21 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_154:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb8c40000  ! 2573: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xfeb4613e  ! 2576: STHA_I	stha	%r31, [%r17 + 0x013e] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, e)
	.word 0xf62d0000  ! 2585: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb02da0e7  ! 2586: ANDN_I	andn 	%r22, 0x00e7, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_96:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 2594: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfc258000  ! 2596: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 4)
	.word 0xfa256083  ! 2604: STW_I	stw	%r29, [%r21 + 0x0083]
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 17)
	.word 0xb6c561a1  ! 2607: ADDCcc_I	addccc 	%r21, 0x01a1, %r27
	.word 0xfcad61db  ! 2608: STBA_I	stba	%r30, [%r21 + 0x01db] %asi
cpu_intr_3_193:
	setx	0x32033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x320325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_195:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 2621: STX_R	stx	%r27, [%r23 + %r0]
T3_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 2622: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfeb48020  ! 2623: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf2740000  ! 2627: STX_R	stx	%r25, [%r16 + %r0]
cpu_intr_3_197:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b44020  ! 2631: STHA_R	stha	%r26, [%r17 + %r0] 0x01
cpu_intr_3_198:
	setx	0x320010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_199:
	setx	0x30022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 2647: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xf6ac61c9  ! 2649: STBA_I	stba	%r27, [%r17 + 0x01c9] %asi
cpu_intr_3_200:
	setx	0x300223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_156:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_97:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 2658: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4344000  ! 2660: STH_R	sth	%r26, [%r17 + %r0]
cpu_intr_3_201:
	setx	0x300322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02460ad  ! 2663: STW_I	stw	%r24, [%r17 + 0x00ad]
cpu_intr_3_202:
	setx	0x31022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_157:
	mov	0x1d, %r14
	.word 0xf0db8400  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_158:
	mov	0x1d, %r14
	.word 0xf6db8e60  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xbc45a048  ! 2673: ADDC_I	addc 	%r22, 0x0048, %r30
	.word 0xb8c50000  ! 2674: ADDCcc_R	addccc 	%r20, %r0, %r28
T3_asi_reg_rd_159:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 2676: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe344000  ! 2677: STH_R	sth	%r31, [%r17 + %r0]
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_203:
	setx	0x330122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5212f  ! 2691: STHA_I	stha	%r26, [%r20 + 0x012f] %asi
T3_asi_reg_rd_160:
	mov	0x10, %r14
	.word 0xf6db8e60  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xbc250000  ! 2698: SUB_R	sub 	%r20, %r0, %r30
	.word 0xbc954000  ! 2700: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xfe748000  ! 2702: STX_R	stx	%r31, [%r18 + %r0]
cpu_intr_3_204:
	setx	0x330202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 2705: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_205:
	setx	0x300223, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf0750000  ! 2709: STX_R	stx	%r24, [%r20 + %r0]
T3_asi_reg_wr_98:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2710: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf024c000  ! 2711: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf4a4c020  ! 2712: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe2ce14c  ! 2714: STB_I	stb	%r31, [%r19 + 0x014c]
	.word 0xf434e11e  ! 2715: STH_I	sth	%r26, [%r19 + 0x011e]
	.word 0xfcad0020  ! 2716: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xfc754000  ! 2717: STX_R	stx	%r30, [%r21 + %r0]
T3_asi_reg_wr_99:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 2722: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb4358000  ! 2724: SUBC_R	orn 	%r22, %r0, %r26
cpu_intr_3_206:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 1a)
	.word 0xbc34217f  ! 2729: ORN_I	orn 	%r16, 0x017f, %r30
cpu_intr_3_207:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 2731: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xfc2d2150  ! 2733: STB_I	stb	%r30, [%r20 + 0x0150]
	.word 0xb0c56031  ! 2737: ADDCcc_I	addccc 	%r21, 0x0031, %r24
T3_asi_reg_rd_161:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf82d0000  ! 2741: STB_R	stb	%r28, [%r20 + %r0]
cpu_intr_3_208:
	setx	0x360130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf4246171  ! 2744: STW_I	stw	%r26, [%r17 + 0x0171]
cpu_intr_3_209:
	setx	0x350117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5357001  ! 2747: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xf824a1f8  ! 2750: STW_I	stw	%r28, [%r18 + 0x01f8]
T3_asi_reg_wr_100:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 2751: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_101:
	mov	0x7, %r14
	.word 0xf8f389e0  ! 2752: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b58  ! 2753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b58, %hpstate
	.word 0xf0250000  ! 2754: STW_R	stw	%r24, [%r20 + %r0]
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_210:
	setx	0x37032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_102:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2758: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_211:
	setx	0x340130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c6186  ! 2764: XNOR_I	xnor 	%r17, 0x0186, %r30
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_163:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf2a5e092  ! 2768: STWA_I	stwa	%r25, [%r23 + 0x0092] %asi
cpu_intr_3_212:
	setx	0x36012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_213:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c58000  ! 2774: ADDCcc_R	addccc 	%r22, %r0, %r24
cpu_intr_3_214:
	setx	0x340026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 2777: STW_R	stw	%r25, [%r16 + %r0]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, f)
	.word 0xf825a160  ! 2783: STW_I	stw	%r28, [%r22 + 0x0160]
cpu_intr_3_215:
	setx	0x36021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c200e  ! 2791: STB_I	stb	%r30, [%r16 + 0x000e]
cpu_intr_3_216:
	setx	0x35021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d61b0  ! 2795: STB_I	stb	%r26, [%r21 + 0x01b0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_217:
	setx	0x36000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd20a2  ! 2802: XNORcc_I	xnorcc 	%r20, 0x00a2, %r25
T3_asi_reg_wr_103:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2803: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 2804: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	.word 0xfe748000  ! 2808: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xbe8da095  ! 2811: ANDcc_I	andcc 	%r22, 0x0095, %r31
	.word 0xfe74e05a  ! 2812: STX_I	stx	%r31, [%r19 + 0x005a]
	.word 0xfe2c8000  ! 2813: STB_R	stb	%r31, [%r18 + %r0]
cpu_intr_3_218:
	setx	0x370012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c8000  ! 2818: ANDcc_R	andcc 	%r18, %r0, %r29
	.word 0xbead214f  ! 2819: ANDNcc_I	andncc 	%r20, 0x014f, %r31
cpu_intr_3_219:
	setx	0x370110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf5a1a6  ! 2822: STXA_I	stxa	%r30, [%r22 + 0x01a6] %asi
	.word 0xfc348000  ! 2823: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf2b4606c  ! 2826: STHA_I	stha	%r25, [%r17 + 0x006c] %asi
	.word 0xfa750000  ! 2831: STX_R	stx	%r29, [%r20 + %r0]
cpu_intr_3_220:
	setx	0x360308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ace0af  ! 2833: STBA_I	stba	%r28, [%r19 + 0x00af] %asi
T3_asi_reg_wr_105:
	mov	0x2, %r14
	.word 0xfef38e60  ! 2834: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf2acc020  ! 2837: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xf2a4604c  ! 2838: STWA_I	stwa	%r25, [%r17 + 0x004c] %asi
T3_asi_reg_rd_164:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_106:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2841: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_107:
	mov	0x12, %r14
	.word 0xf0f38e60  ! 2843: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_165:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc75e010  ! 2846: STX_I	stx	%r30, [%r23 + 0x0010]
	.word 0xf0a58020  ! 2847: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, d)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_108:
	mov	0x7, %r14
	.word 0xf4f38e60  ! 2855: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb834c000  ! 2857: ORN_R	orn 	%r19, %r0, %r28
cpu_intr_3_221:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_109:
	mov	0x13, %r14
	.word 0xfcf38e80  ! 2861: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_222:
	setx	0x360239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_223:
	setx	0x370323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4a13a  ! 2867: STWA_I	stwa	%r27, [%r18 + 0x013a] %asi
	.word 0xfcb5c020  ! 2871: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf025c000  ! 2872: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf075c000  ! 2873: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf4346094  ! 2874: STH_I	sth	%r26, [%r17 + 0x0094]
	.word 0xb7480000  ! 2875: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2521d6  ! 2878: STW_I	stw	%r31, [%r20 + 0x01d6]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_110:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2880: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4b4c020  ! 2882: STHA_R	stha	%r26, [%r19 + %r0] 0x01
cpu_intr_3_224:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_225:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe746103  ! 2897: STX_I	stx	%r31, [%r17 + 0x0103]
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_111:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 2902: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_112:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 2911: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xf2a44020  ! 2913: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_TO_TL1
	.word 0xf87561af  ! 2918: STX_I	stx	%r28, [%r21 + 0x01af]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, c)
	.word 0xbf2db001  ! 2920: SLLX_I	sllx	%r22, 0x0001, %r31
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_113:
	mov	0x13, %r14
	.word 0xfef389e0  ! 2922: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 27)
	.word 0xbe048000  ! 2925: ADD_R	add 	%r18, %r0, %r31
T3_asi_reg_rd_166:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 2928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfc248000  ! 2931: STW_R	stw	%r30, [%r18 + %r0]
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_114:
	mov	0x1c, %r14
	.word 0xfaf384a0  ! 2934: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf6248000  ! 2935: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf02c4000  ! 2936: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfc74217d  ! 2941: STX_I	stx	%r30, [%r16 + 0x017d]
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_226:
	setx	0x350217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a05a  ! 2945: STH_I	sth	%r30, [%r22 + 0x005a]
	.word 0xf825a060  ! 2946: STW_I	stw	%r28, [%r22 + 0x0060]
cpu_intr_3_227:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, b)
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 12)
	.word 0xf2b44020  ! 2960: STHA_R	stha	%r25, [%r17 + %r0] 0x01
cpu_intr_3_228:
	setx	0x36012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_229:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_230:
	setx	0x360005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2cc000  ! 2966: ANDN_R	andn 	%r19, %r0, %r30
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 26)
	.word 0xf2254000  ! 2969: STW_R	stw	%r25, [%r21 + %r0]
T3_asi_reg_rd_167:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 2971: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_231:
	setx	0x37032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfab58020  ! 2975: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf0ad0020  ! 2977: STBA_R	stba	%r24, [%r20 + %r0] 0x01
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 36)
	.word 0xf0a5a1bb  ! 2980: STWA_I	stwa	%r24, [%r22 + 0x01bb] %asi
	.word 0xf2358000  ! 2981: STH_R	sth	%r25, [%r22 + %r0]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_115:
	mov	0x2d, %r14
	.word 0xf2f384a0  ! 2987: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_169:
	mov	0x2f, %r14
	.word 0xf6db8e80  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4740000  ! 2995: STX_R	stx	%r26, [%r16 + %r0]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983912  ! 2996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1912, %hpstate
T3_asi_reg_wr_116:
	mov	0x0, %r14
	.word 0xfef384a0  ! 2998: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_117:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 2999: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_118:
	mov	0x3, %r14
	.word 0xfcf389e0  ! 3001: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbf34e001  ! 3002: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xfe250000  ! 3005: STW_R	stw	%r31, [%r20 + %r0]
cpu_intr_3_232:
	setx	0x36012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c210d  ! 3013: ANDN_I	andn 	%r16, 0x010d, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2c6134  ! 3015: STB_I	stb	%r29, [%r17 + 0x0134]
cpu_intr_3_233:
	setx	0x36002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e1d0  ! 3019: STWA_I	stwa	%r30, [%r23 + 0x01d0] %asi
	.word 0xb12c5000  ! 3020: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xf425e033  ! 3021: STW_I	stw	%r26, [%r23 + 0x0033]
cpu_intr_3_234:
	setx	0x36030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 26)
	.word 0xf0a50020  ! 3025: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
T3_asi_reg_rd_170:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 3026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_171:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf224c000  ! 3037: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_235:
	setx	0x34022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_172:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_173:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0x8d9521ea  ! 3047: WRPR_PSTATE_I	wrpr	%r20, 0x01ea, %pstate
T3_asi_reg_rd_174:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbcb4604e  ! 3049: SUBCcc_I	orncc 	%r17, 0x004e, %r30
	.word 0xf425e07f  ! 3050: STW_I	stw	%r26, [%r23 + 0x007f]
	.word 0xf275a133  ! 3051: STX_I	stx	%r25, [%r22 + 0x0133]
T3_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b48020  ! 3062: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_236:
	setx	0x370223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 3064: RDPR_TSTATE	rdpr	%tstate, %r30
cpu_intr_3_237:
	setx	0x35001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x16, %r14
	.word 0xfcdb8e80  ! 3068: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa750000  ! 3074: STX_R	stx	%r29, [%r20 + %r0]
cpu_intr_3_238:
	setx	0x360138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_177:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 3081: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, f)
	.word 0xfc7561c5  ! 3085: STX_I	stx	%r30, [%r21 + 0x01c5]
T3_asi_reg_rd_178:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc2d20c9  ! 3089: STB_I	stb	%r30, [%r20 + 0x00c9]
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_119:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3093: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0acc020  ! 3094: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xbc0dc000  ! 3095: AND_R	and 	%r23, %r0, %r30
T3_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_180:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 34)
	.word 0xf82d8000  ! 3109: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf235a0a8  ! 3110: STH_I	sth	%r25, [%r22 + 0x00a8]
	.word 0xb4bc4000  ! 3112: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xf2a4a14d  ! 3113: STWA_I	stwa	%r25, [%r18 + 0x014d] %asi
	.word 0xfaf42184  ! 3115: STXA_I	stxa	%r29, [%r16 + 0x0184] %asi
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 7)
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e02  ! 3122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e02, %hpstate
	.word 0xfe2c6073  ! 3123: STB_I	stb	%r31, [%r17 + 0x0073]
cpu_intr_3_239:
	setx	0x37002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x10, %r14
	.word 0xf4f38400  ! 3125: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
cpu_intr_3_240:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_241:
	setx	0x34031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5a1b7  ! 3133: STXA_I	stxa	%r26, [%r22 + 0x01b7] %asi
T3_asi_reg_wr_121:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3134: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc252101  ! 3141: STW_I	stw	%r30, [%r20 + 0x0101]
	.word 0xbc150000  ! 3143: OR_R	or 	%r20, %r0, %r30
	.word 0xf234e15d  ! 3145: STH_I	sth	%r25, [%r19 + 0x015d]
	.word 0xf8358000  ! 3146: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf234e182  ! 3147: STH_I	sth	%r25, [%r19 + 0x0182]
	.word 0xfe2c4000  ! 3148: STB_R	stb	%r31, [%r17 + %r0]
T3_asi_reg_rd_181:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_122:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 3152: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_242:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa342120  ! 3157: STH_I	sth	%r29, [%r16 + 0x0120]
cpu_intr_3_244:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 3162: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xb28c8000  ! 3163: ANDcc_R	andcc 	%r18, %r0, %r25
	.word 0xf42d4000  ! 3164: STB_R	stb	%r26, [%r21 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 28)
	.word 0xfe34e07e  ! 3168: STH_I	sth	%r31, [%r19 + 0x007e]
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f9a  ! 3169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_245:
	setx	0x36031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_246:
	setx	0x36032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_123:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3177: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_124:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3178: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_247:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa354000  ! 3181: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_248:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60d21d3  ! 3186: AND_I	and 	%r20, 0x01d3, %r27
	.word 0xf4ade123  ! 3187: STBA_I	stba	%r26, [%r23 + 0x0123] %asi
	.word 0xfe34c000  ! 3188: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf4354000  ! 3189: STH_R	sth	%r26, [%r21 + %r0]
T3_asi_reg_wr_125:
	mov	0x34, %r14
	.word 0xfef38e80  ! 3193: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf274c000  ! 3194: STX_R	stx	%r25, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf4ade0ed  ! 3199: STBA_I	stba	%r26, [%r23 + 0x00ed] %asi
	.word 0xfc25e062  ! 3201: STW_I	stw	%r30, [%r23 + 0x0062]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa340000  ! 3208: STH_R	sth	%r29, [%r16 + %r0]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_126:
	mov	0x17, %r14
	.word 0xfaf38400  ! 3211: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf42ce10c  ! 3216: STB_I	stb	%r26, [%r19 + 0x010c]
cpu_intr_3_249:
	setx	0x39003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_250:
	setx	0x3a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 3220: RDPR_TNPC	rdpr	%tnpc, %r29
cpu_intr_3_251:
	setx	0x38010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_252:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0f5601a  ! 3230: STXA_I	stxa	%r24, [%r21 + 0x001a] %asi
T3_asi_reg_wr_127:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 3231: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb435615d  ! 3232: SUBC_I	orn 	%r21, 0x015d, %r26
	.word 0xf634e131  ! 3233: STH_I	sth	%r27, [%r19 + 0x0131]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_253:
	setx	0x39023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_128:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 3237: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf225e0d9  ! 3239: STW_I	stw	%r25, [%r23 + 0x00d9]
cpu_intr_3_254:
	setx	0x3b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc754000  ! 3244: STX_R	stx	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_255:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_129:
	mov	0x2d, %r14
	.word 0xf4f38400  ! 3259: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_256:
	setx	0x390126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_130:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 3263: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0f5e038  ! 3269: STXA_I	stxa	%r24, [%r23 + 0x0038] %asi
cpu_intr_3_257:
	setx	0x3a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_131:
	mov	0x17, %r14
	.word 0xfef38e60  ! 3274: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_258:
	setx	0x3b0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_132:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 3280: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf0a58020  ! 3282: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_rd_182:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb00d8000  ! 3284: AND_R	and 	%r22, %r0, %r24
	.word 0xfea5e187  ! 3287: STWA_I	stwa	%r31, [%r23 + 0x0187] %asi
T3_asi_reg_wr_133:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 3288: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_259:
	setx	0x3a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_134:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 3290: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ac2  ! 3291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac2, %hpstate
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819839c0  ! 3294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c0, %hpstate
T3_asi_reg_wr_135:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 3298: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8ace126  ! 3300: STBA_I	stba	%r28, [%r19 + 0x0126] %asi
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_260:
	setx	0x3b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 3304: MOVcc_R	<illegal instruction>
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 31)
	.word 0xb244e15b  ! 3308: ADDC_I	addc 	%r19, 0x015b, %r25
	.word 0xf82c0000  ! 3310: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xbd3d8000  ! 3312: SRA_R	sra 	%r22, %r0, %r30
T3_asi_reg_rd_183:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb8c4a091  ! 3315: ADDCcc_I	addccc 	%r18, 0x0091, %r28
	.word 0xf0250000  ! 3316: STW_R	stw	%r24, [%r20 + %r0]
T3_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3317: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf42c6199  ! 3320: STB_I	stb	%r26, [%r17 + 0x0199]
	.word 0xfc34e016  ! 3321: STH_I	sth	%r30, [%r19 + 0x0016]
cpu_intr_3_261:
	setx	0x380130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 3324: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xba14210d  ! 3327: OR_I	or 	%r16, 0x010d, %r29
cpu_intr_3_262:
	setx	0x380109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_263:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 3337: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 12)
	.word 0xf6f460e7  ! 3341: STXA_I	stxa	%r27, [%r17 + 0x00e7] %asi
T3_asi_reg_rd_184:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 27)
	.word 0xfca54020  ! 3345: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xfa2cc000  ! 3346: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_185:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 3349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf67460cc  ! 3351: STX_I	stx	%r27, [%r17 + 0x00cc]
T3_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 3352: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfcade109  ! 3353: STBA_I	stba	%r30, [%r23 + 0x0109] %asi
	.word 0xf275e0a2  ! 3354: STX_I	stx	%r25, [%r23 + 0x00a2]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, c)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_139:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 3362: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_264:
	setx	0x3a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_265:
	setx	0x3a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 3376: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf6344000  ! 3377: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf6254000  ! 3378: STW_R	stw	%r27, [%r21 + %r0]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 1b)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982998  ! 3381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf8354000  ! 3383: STH_R	sth	%r28, [%r21 + %r0]
T3_asi_reg_rd_186:
	mov	0xf, %r14
	.word 0xf0db8e60  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb53dc000  ! 3392: SRA_R	sra 	%r23, %r0, %r26
	.word 0xf62c4000  ! 3394: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xfea40020  ! 3395: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xf8a4619d  ! 3396: STWA_I	stwa	%r28, [%r17 + 0x019d] %asi
	.word 0xfeac4020  ! 3397: STBA_R	stba	%r31, [%r17 + %r0] 0x01
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e98  ! 3400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xfca58020  ! 3408: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
T3_asi_reg_rd_187:
	mov	0x25, %r14
	.word 0xfadb84a0  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8b42069  ! 3413: STHA_I	stha	%r28, [%r16 + 0x0069] %asi
T3_asi_reg_wr_140:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 3415: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb48da199  ! 3416: ANDcc_I	andcc 	%r22, 0x0199, %r26
T3_asi_reg_rd_188:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xba456099  ! 3423: ADDC_I	addc 	%r21, 0x0099, %r29
	.word 0xf2f42087  ! 3425: STXA_I	stxa	%r25, [%r16 + 0x0087] %asi
	.word 0xf474a198  ! 3429: STX_I	stx	%r26, [%r18 + 0x0198]
cpu_intr_3_266:
	setx	0x39020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_141:
	mov	0x8, %r14
	.word 0xfcf389e0  ! 3434: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf834a1c0  ! 3435: STH_I	sth	%r28, [%r18 + 0x01c0]
	.word 0xf0750000  ! 3437: STX_R	stx	%r24, [%r20 + %r0]
T3_asi_reg_rd_189:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb0c4c000  ! 3440: ADDCcc_R	addccc 	%r19, %r0, %r24
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_142:
	mov	0x21, %r14
	.word 0xf0f38400  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf8756186  ! 3444: STX_I	stx	%r28, [%r21 + 0x0186]
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 14)
	.word 0xf4ac619d  ! 3451: STBA_I	stba	%r26, [%r17 + 0x019d] %asi
T3_asi_reg_wr_143:
	mov	0x19, %r14
	.word 0xfcf38400  ! 3452: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6344000  ! 3456: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfa34e152  ! 3458: STH_I	sth	%r29, [%r19 + 0x0152]
	.word 0xf62c4000  ! 3459: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf6ad4020  ! 3460: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xfe7420be  ! 3462: STX_I	stx	%r31, [%r16 + 0x00be]
T3_asi_reg_rd_190:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 3463: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_191:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 3465: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb2bc6027  ! 3467: XNORcc_I	xnorcc 	%r17, 0x0027, %r25
	.word 0xf8a5c020  ! 3469: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 10)
	.word 0xb4356076  ! 3478: SUBC_I	orn 	%r21, 0x0076, %r26
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829d0  ! 3479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
T3_asi_reg_rd_192:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf4b48020  ! 3481: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xfc2c8000  ! 3483: STB_R	stb	%r30, [%r18 + %r0]
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 33)
	.word 0xfc35e1d6  ! 3485: STH_I	sth	%r30, [%r23 + 0x01d6]
	.word 0xf6b4c020  ! 3489: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xbf500000  ! 3498: RDPR_TPC	rdpr	%tpc, %r31
T3_asi_reg_rd_193:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_194:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfeb4c020  ! 3507: STHA_R	stha	%r31, [%r19 + %r0] 0x01
cpu_intr_3_267:
	setx	0x3a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_195:
	mov	0x7, %r14
	.word 0xfcdb8e60  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_144:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 3512: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa250000  ! 3514: STW_R	stw	%r29, [%r20 + %r0]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf6258000  ! 3516: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_268:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28520cf  ! 3522: ADDcc_I	addcc 	%r20, 0x00cf, %r25
	.word 0xf02c2147  ! 3523: STB_I	stb	%r24, [%r16 + 0x0147]
T3_asi_reg_rd_196:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 3524: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfab58020  ! 3525: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b42123  ! 3528: STHA_I	stha	%r27, [%r16 + 0x0123] %asi
	.word 0xfaac8020  ! 3533: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf025a090  ! 3534: STW_I	stw	%r24, [%r22 + 0x0090]
	.word 0xfab56093  ! 3537: STHA_I	stha	%r29, [%r21 + 0x0093] %asi
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 24)
	.word 0xfc2d8000  ! 3539: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf0352058  ! 3541: STH_I	sth	%r24, [%r20 + 0x0058]
cpu_intr_3_269:
	setx	0x380025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e16c  ! 3543: WRPR_TSTATE_I	wrpr	%r19, 0x016c, %tstate
T3_asi_reg_rd_197:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 3544: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_270:
	setx	0x390320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc256166  ! 3547: STW_I	stw	%r30, [%r21 + 0x0166]
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 12)
	.word 0xf0a5c020  ! 3551: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_271:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a070  ! 3555: STH_I	sth	%r30, [%r22 + 0x0070]
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 2)
	.word 0xb28d210f  ! 3559: ANDcc_I	andcc 	%r20, 0x010f, %r25
	.word 0xb4a4e060  ! 3561: SUBcc_I	subcc 	%r19, 0x0060, %r26
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983880  ! 3563: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1880, %hpstate
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_198:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf62de161  ! 3569: STB_I	stb	%r27, [%r23 + 0x0161]
	.word 0xf82c0000  ! 3570: STB_R	stb	%r28, [%r16 + %r0]
cpu_intr_3_272:
	setx	0x380228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 3574: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf225e021  ! 3576: STW_I	stw	%r25, [%r23 + 0x0021]
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819838c0  ! 3577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c0, %hpstate
	.word 0xfc74614c  ! 3580: STX_I	stx	%r30, [%r17 + 0x014c]
	.word 0xba14c000  ! 3581: OR_R	or 	%r19, %r0, %r29
T3_asi_reg_rd_199:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf4ad618b  ! 3584: STBA_I	stba	%r26, [%r21 + 0x018b] %asi
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_145:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 3589: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbc340000  ! 3590: ORN_R	orn 	%r16, %r0, %r30
T3_asi_reg_rd_200:
	mov	0x31, %r14
	.word 0xf4db84a0  ! 3594: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xba9dc000  ! 3595: XORcc_R	xorcc 	%r23, %r0, %r29
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_273:
	setx	0x3a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_146:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 3605: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_147:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 3607: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0x8f902000  ! 3608: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xfeac20c0  ! 3610: STBA_I	stba	%r31, [%r16 + 0x00c0] %asi
	.word 0xbb3d5000  ! 3611: SRAX_R	srax	%r21, %r0, %r29
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 15)
	.word 0xb92c7001  ! 3617: SLLX_I	sllx	%r17, 0x0001, %r28
T3_asi_reg_rd_201:
	mov	0x1, %r14
	.word 0xf6db89e0  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbc054000  ! 3619: ADD_R	add 	%r21, %r0, %r30
cpu_intr_3_274:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a46083  ! 3625: STWA_I	stwa	%r25, [%r17 + 0x0083] %asi
cpu_intr_3_275:
	setx	0x3b032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf345000  ! 3630: SRLX_R	srlx	%r17, %r0, %r31
cpu_intr_3_276:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb425a0b4  ! 3633: SUB_I	sub 	%r22, 0x00b4, %r26
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_202:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfab5a0a9  ! 3637: STHA_I	stha	%r29, [%r22 + 0x00a9] %asi
	.word 0xf02c0000  ! 3638: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf4acc020  ! 3639: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_148:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 3642: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_277:
	setx	0x3d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb805a116  ! 3644: ADD_I	add 	%r22, 0x0116, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfea50020  ! 3647: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	.word 0xf02de159  ! 3648: STB_I	stb	%r24, [%r23 + 0x0159]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf424e173  ! 3655: STW_I	stw	%r26, [%r19 + 0x0173]
	.word 0xf835c000  ! 3656: STH_R	sth	%r28, [%r23 + %r0]
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4a58020  ! 3658: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xb845e047  ! 3662: ADDC_I	addc 	%r23, 0x0047, %r28
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf62da0e0  ! 3667: STB_I	stb	%r27, [%r22 + 0x00e0]
cpu_intr_3_278:
	setx	0x3f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f46072  ! 3673: STXA_I	stxa	%r26, [%r17 + 0x0072] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 3679: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfc2d60a7  ! 3682: STB_I	stb	%r30, [%r21 + 0x00a7]
cpu_intr_3_279:
	setx	0x3f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5e05d  ! 3686: STHA_I	stha	%r31, [%r23 + 0x005d] %asi
	.word 0xf6f46096  ! 3687: STXA_I	stxa	%r27, [%r17 + 0x0096] %asi
cpu_intr_3_280:
	setx	0x3e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcac603a  ! 3690: ANDNcc_I	andncc 	%r17, 0x003a, %r30
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_204:
	mov	0x1f, %r14
	.word 0xfedb8e60  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_149:
	mov	0x12, %r14
	.word 0xf0f384a0  ! 3693: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf625e0f6  ! 3697: STW_I	stw	%r27, [%r23 + 0x00f6]
	.word 0xfc34e07e  ! 3699: STH_I	sth	%r30, [%r19 + 0x007e]
T3_asi_reg_wr_150:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 3701: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_205:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 3704: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 2)
	.word 0xf4f561fc  ! 3707: STXA_I	stxa	%r26, [%r21 + 0x01fc] %asi
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, e)
	.word 0xf8ad4020  ! 3714: STBA_R	stba	%r28, [%r21 + %r0] 0x01
T3_asi_reg_wr_151:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 3715: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_206:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, f)
	.word 0xf0ade1b8  ! 3728: STBA_I	stba	%r24, [%r23 + 0x01b8] %asi
	.word 0xfe354000  ! 3731: STH_R	sth	%r31, [%r21 + %r0]
T3_asi_reg_rd_207:
	mov	0x17, %r14
	.word 0xfedb8e60  ! 3732: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_281:
	setx	0x3c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5e1b5  ! 3736: STXA_I	stxa	%r28, [%r23 + 0x01b5] %asi
T3_asi_reg_rd_208:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 3739: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_209:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0b40020  ! 3742: STHA_R	stha	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_210:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_rd_211:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 3745: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_282:
	setx	0x3f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 5)
	.word 0xfa2d8000  ! 3754: STB_R	stb	%r29, [%r22 + %r0]
cpu_intr_3_283:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a54020  ! 3762: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xba3c4000  ! 3764: XNOR_R	xnor 	%r17, %r0, %r29
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 37)
	.word 0xbd347001  ! 3768: SRLX_I	srlx	%r17, 0x0001, %r30
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 36)
	.word 0xbf3d8000  ! 3781: SRA_R	sra 	%r22, %r0, %r31
cpu_intr_3_284:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb348000  ! 3786: SRL_R	srl 	%r18, %r0, %r29
T3_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_285:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 3789: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfaacc020  ! 3791: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf6ace1d5  ! 3792: STBA_I	stba	%r27, [%r19 + 0x01d5] %asi
T3_asi_reg_wr_152:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 3793: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xfc744000  ! 3797: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xfeb520f3  ! 3801: STHA_I	stha	%r31, [%r20 + 0x00f3] %asi
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982952  ! 3806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0xfab4c020  ! 3807: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xb951c000  ! 3808: RDPR_TL	rdpr	%tl, %r28
	.word 0xf8f5e1cf  ! 3810: STXA_I	stxa	%r28, [%r23 + 0x01cf] %asi
	.word 0xf22561c1  ! 3811: STW_I	stw	%r25, [%r21 + 0x01c1]
	.word 0xbd2c4000  ! 3813: SLL_R	sll 	%r17, %r0, %r30
	.word 0xf6b4c020  ! 3818: STHA_R	stha	%r27, [%r19 + %r0] 0x01
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_153:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 3824: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf0a5c020  ! 3825: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
T3_asi_reg_wr_154:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 3827: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_213:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 30)
	.word 0xf02c0000  ! 3835: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb97ca401  ! 3838: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xf4754000  ! 3841: STX_R	stx	%r26, [%r21 + %r0]
cpu_intr_3_286:
	setx	0x3e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_TO_TL0
	.word 0xfcb44020  ! 3846: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xbc9dc000  ! 3849: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xf0748000  ! 3850: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_rd_214:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb495e10f  ! 3853: ORcc_I	orcc 	%r23, 0x010f, %r26
	.word 0xf2a44020  ! 3857: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_215:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfeb50020  ! 3864: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_287:
	setx	0x3e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4c000  ! 3867: SUBCcc_R	orncc 	%r19, %r0, %r25
T3_asi_reg_rd_216:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6b521ee  ! 3873: STHA_I	stha	%r27, [%r20 + 0x01ee] %asi
T3_asi_reg_wr_155:
	mov	0x20, %r14
	.word 0xf8f38400  ! 3877: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfaade144  ! 3878: STBA_I	stba	%r29, [%r23 + 0x0144] %asi
	.word 0xf2b420b9  ! 3881: STHA_I	stha	%r25, [%r16 + 0x00b9] %asi
cpu_intr_3_288:
	setx	0x3d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc252076  ! 3885: STW_I	stw	%r30, [%r20 + 0x0076]
	.word 0xfe34e0d0  ! 3886: STH_I	sth	%r31, [%r19 + 0x00d0]
	.word 0xbd3d6001  ! 3888: SRA_I	sra 	%r21, 0x0001, %r30
cpu_intr_3_289:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x3e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819838ca  ! 3897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18ca, %hpstate
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_291:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0350000  ! 3902: STH_R	sth	%r24, [%r20 + %r0]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 2c)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198288a  ! 3905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088a, %hpstate
T3_asi_reg_rd_217:
	mov	0x1b, %r14
	.word 0xf4db8e80  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 3913: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf0a5c020  ! 3915: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xba9d8000  ! 3918: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xf0250000  ! 3919: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf67560fc  ! 3920: STX_I	stx	%r27, [%r21 + 0x00fc]
	.word 0xf874a05a  ! 3921: STX_I	stx	%r28, [%r18 + 0x005a]
cpu_intr_3_292:
	setx	0x3c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5a156  ! 3926: ADDCcc_I	addccc 	%r22, 0x0156, %r31
cpu_intr_3_293:
	setx	0x3c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cd000  ! 3930: SLLX_R	sllx	%r19, %r0, %r28
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3934: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2248000  ! 3935: STW_R	stw	%r25, [%r18 + %r0]
T3_asi_reg_rd_218:
	mov	0x5, %r14
	.word 0xf2db8e40  ! 3938: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_294:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b40020  ! 3943: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xf8f421d6  ! 3948: STXA_I	stxa	%r28, [%r16 + 0x01d6] %asi
cpu_intr_3_295:
	setx	0x3c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5e013  ! 3952: STHA_I	stha	%r24, [%r23 + 0x0013] %asi
T3_asi_reg_wr_158:
	mov	0xb, %r14
	.word 0xf8f38e60  ! 3953: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe35608a  ! 3957: STH_I	sth	%r31, [%r21 + 0x008a]
T3_asi_reg_wr_159:
	mov	0x24, %r14
	.word 0xf6f38400  ! 3958: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_219:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 3961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_296:
	setx	0x3d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ade05a  ! 3967: STBA_I	stba	%r25, [%r23 + 0x005a] %asi
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf2758000  ! 3970: STX_R	stx	%r25, [%r22 + %r0]
cpu_intr_3_297:
	setx	0x3f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_299:
	setx	0x3d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_220:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfeb5c020  ! 3981: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2a4c020  ! 3986: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_300:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x1a, %r14
	.word 0xf8f384a0  ! 3992: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_221:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf8758000  ! 3996: STX_R	stx	%r28, [%r22 + %r0]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_302:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf874a172  ! 4000: STX_I	stx	%r28, [%r18 + 0x0172]
	.word 0xf0ad4020  ! 4001: STBA_R	stba	%r24, [%r21 + %r0] 0x01
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 14)
	.word 0xf8354000  ! 4006: STH_R	sth	%r28, [%r21 + %r0]
T3_asi_reg_rd_222:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb03da050  ! 4008: XNOR_I	xnor 	%r22, 0x0050, %r24
	.word 0x8194a02b  ! 4009: WRPR_TPC_I	wrpr	%r18, 0x002b, %tpc
	.word 0xf4a50020  ! 4011: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_223:
	mov	0x6, %r14
	.word 0xf0db8400  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_161:
	mov	0x29, %r14
	.word 0xfef38e80  ! 4013: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf635611d  ! 4014: STH_I	sth	%r27, [%r21 + 0x011d]
	.word 0xba9d0000  ! 4015: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xf2b58020  ! 4018: STHA_R	stha	%r25, [%r22 + %r0] 0x01
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, c)
	.word 0xfeb4a0f4  ! 4024: STHA_I	stha	%r31, [%r18 + 0x00f4] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_303:
	setx	0x3f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_224:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 25)
	.word 0xfc35e128  ! 4032: STH_I	sth	%r30, [%r23 + 0x0128]
cpu_intr_3_304:
	setx	0x3f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 4037: STHA_R	stha	%r31, [%r16 + %r0] 0x01
cpu_intr_3_305:
	setx	0x3f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfea4a096  ! 4043: STWA_I	stwa	%r31, [%r18 + 0x0096] %asi
cpu_intr_3_306:
	setx	0x3c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2461e9  ! 4047: STW_I	stw	%r29, [%r17 + 0x01e9]
cpu_intr_3_307:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_162:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 4051: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_163:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 4054: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_164:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 4055: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_308:
	setx	0x3f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3c4000  ! 4057: XNOR_R	xnor 	%r17, %r0, %r31
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_225:
	mov	0x1c, %r14
	.word 0xf4db84a0  ! 4063: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_226:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6b42133  ! 4077: STHA_I	stha	%r27, [%r16 + 0x0133] %asi
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbc95609d  ! 4083: ORcc_I	orcc 	%r21, 0x009d, %r30
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_165:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4086: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa358000  ! 4088: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_309:
	setx	0x3f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_310:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_311:
	setx	0x3c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e09d  ! 4096: WRPR_TSTATE_I	wrpr	%r19, 0x009d, %tstate
T3_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 4097: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc248000  ! 4098: STW_R	stw	%r30, [%r18 + %r0]
T3_asi_reg_wr_167:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 4099: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf4a44020  ! 4101: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xf275c000  ! 4104: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfa25c000  ! 4105: STW_R	stw	%r29, [%r23 + %r0]
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 1)
	.word 0xfea40020  ! 4110: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_227:
	mov	0x15, %r14
	.word 0xfcdb84a0  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfa24619e  ! 4115: STW_I	stw	%r29, [%r17 + 0x019e]
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_312:
	setx	0x400133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_313:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x40010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48de0b6  ! 4131: ANDcc_I	andcc 	%r23, 0x00b6, %r26
	.word 0xf035c000  ! 4132: STH_R	sth	%r24, [%r23 + %r0]
cpu_intr_3_315:
	setx	0x420303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 4146: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_228:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_316:
	setx	0x400309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d21b4  ! 4150: STB_I	stb	%r26, [%r20 + 0x01b4]
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe35c000  ! 4155: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_317:
	setx	0x420125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c7001  ! 4159: SRAX_I	srax	%r17, 0x0001, %r29
	.word 0xf6ac2048  ! 4161: STBA_I	stba	%r27, [%r16 + 0x0048] %asi
cpu_intr_3_318:
	setx	0x42000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 4164: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8f52194  ! 4165: STXA_I	stxa	%r28, [%r20 + 0x0194] %asi
	.word 0xfcb5a0d6  ! 4166: STHA_I	stha	%r30, [%r22 + 0x00d6] %asi
T3_asi_reg_rd_229:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_319:
	setx	0x420307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_320:
	setx	0x40012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 21)
	.word 0xb6ade119  ! 4180: ANDNcc_I	andncc 	%r23, 0x0119, %r27
	ta	T_CHANGE_HPRIV
	.word 0xf625e1e9  ! 4182: STW_I	stw	%r27, [%r23 + 0x01e9]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_170:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 4185: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 1a)
	ta	T_CHANGE_TO_TL0
	.word 0xfa35e096  ! 4194: STH_I	sth	%r29, [%r23 + 0x0096]
T3_asi_reg_wr_171:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 4197: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa75e093  ! 4198: STX_I	stx	%r29, [%r23 + 0x0093]
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, a)
	.word 0xf6ac4020  ! 4201: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xfeac8020  ! 4206: STBA_R	stba	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_172:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 4207: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_321:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ace0e0  ! 4210: STBA_I	stba	%r24, [%r19 + 0x00e0] %asi
	.word 0xf2354000  ! 4213: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf82ce0ad  ! 4217: STB_I	stb	%r28, [%r19 + 0x00ad]
T3_asi_reg_rd_230:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 4220: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb615a0ea  ! 4223: OR_I	or 	%r22, 0x00ea, %r27
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_231:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb7343001  ! 4230: SRLX_I	srlx	%r16, 0x0001, %r27
cpu_intr_3_322:
	setx	0x430033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89cc000  ! 4232: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xfcf5a072  ! 4234: STXA_I	stxa	%r30, [%r22 + 0x0072] %asi
cpu_intr_3_323:
	setx	0x420313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_324:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 29)
	.word 0xf4b52087  ! 4243: STHA_I	stha	%r26, [%r20 + 0x0087] %asi
T3_asi_reg_rd_232:
	mov	0x30, %r14
	.word 0xf8db8e60  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbb3d3001  ! 4245: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xf4f560c0  ! 4246: STXA_I	stxa	%r26, [%r21 + 0x00c0] %asi
	.word 0xf434a124  ! 4247: STH_I	sth	%r26, [%r18 + 0x0124]
	.word 0xf8742014  ! 4249: STX_I	stx	%r28, [%r16 + 0x0014]
T3_asi_reg_wr_173:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4250: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_233:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb29d21b2  ! 4257: XORcc_I	xorcc 	%r20, 0x01b2, %r25
cpu_intr_3_325:
	setx	0x42001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 4262: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf02461d1  ! 4264: STW_I	stw	%r24, [%r17 + 0x01d1]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_174:
	mov	0x8, %r14
	.word 0xfef38e40  ! 4269: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_326:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_327:
	setx	0x40020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d4000  ! 4281: STB_R	stb	%r28, [%r21 + %r0]
cpu_intr_3_328:
	setx	0x41020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x420325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa24e183  ! 4293: STW_I	stw	%r29, [%r19 + 0x0183]
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_234:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 4302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_175:
	mov	0x1, %r14
	.word 0xfef38e40  ! 4303: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcb58020  ! 4305: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xf6a421d2  ! 4306: STWA_I	stwa	%r27, [%r16 + 0x01d2] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_176:
	mov	0x33, %r14
	.word 0xf8f38e80  ! 4312: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa354000  ! 4313: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_rd_235:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_177:
	mov	0x35, %r14
	.word 0xf2f389e0  ! 4320: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf2340000  ! 4322: STH_R	sth	%r25, [%r16 + %r0]
T3_asi_reg_rd_236:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 4323: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa2da065  ! 4324: STB_I	stb	%r29, [%r22 + 0x0065]
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf8a5e0f7  ! 4332: STWA_I	stwa	%r28, [%r23 + 0x00f7] %asi
	.word 0x85942089  ! 4338: WRPR_TSTATE_I	wrpr	%r16, 0x0089, %tstate
	.word 0x8f902000  ! 4340: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf8a4a101  ! 4344: STWA_I	stwa	%r28, [%r18 + 0x0101] %asi
T3_asi_reg_rd_237:
	mov	0xb, %r14
	.word 0xf8db89e0  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0a58020  ! 4346: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_238:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_330:
	setx	0x420218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 2)
	.word 0xbd643801  ! 4367: MOVcc_I	<illegal instruction>
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8750000  ! 4373: STX_R	stx	%r28, [%r20 + %r0]
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 9)
	.word 0xb69d4000  ! 4377: XORcc_R	xorcc 	%r21, %r0, %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f0a  ! 4378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xfab40020  ! 4381: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xf6a421a7  ! 4386: STWA_I	stwa	%r27, [%r16 + 0x01a7] %asi
T3_asi_reg_rd_239:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 4387: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_178:
	mov	0x8, %r14
	.word 0xf2f38e60  ! 4388: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfaa52003  ! 4390: STWA_I	stwa	%r29, [%r20 + 0x0003] %asi
cpu_intr_3_331:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_332:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_333:
	setx	0x41013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 4404: RDPR_TSTATE	rdpr	%tstate, %r30
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_334:
	setx	0x40022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034a1f6  ! 4412: STH_I	sth	%r24, [%r18 + 0x01f6]
	.word 0xb3520000  ! 4413: RDPR_PIL	<illegal instruction>
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf634c000  ! 4421: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xbb7d8400  ! 4422: MOVR_R	movre	%r22, %r0, %r29
T3_asi_reg_wr_179:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 4423: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0a5e027  ! 4424: STWA_I	stwa	%r24, [%r23 + 0x0027] %asi
	ta	T_CHANGE_HPRIV
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983940  ! 4426: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1940, %hpstate
	.word 0xf0b560e8  ! 4431: STHA_I	stha	%r24, [%r21 + 0x00e8] %asi
	.word 0xfeac2150  ! 4436: STBA_I	stba	%r31, [%r16 + 0x0150] %asi
	.word 0xb2c420d1  ! 4438: ADDCcc_I	addccc 	%r16, 0x00d1, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_335:
	setx	0x43013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_180:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4445: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf4ad8020  ! 4446: STBA_R	stba	%r26, [%r22 + %r0] 0x01
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4b48020  ! 4451: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xb2bd21ef  ! 4452: XNORcc_I	xnorcc 	%r20, 0x01ef, %r25
	.word 0xb5518000  ! 4453: RDPR_PSTATE	rdpr	%pstate, %r26
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_336:
	setx	0x430031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a4c000  ! 4461: SUBcc_R	subcc 	%r19, %r0, %r26
T3_asi_reg_rd_240:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 4462: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_337:
	setx	0x41000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_181:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 4467: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6b5a028  ! 4468: STHA_I	stha	%r27, [%r22 + 0x0028] %asi
	.word 0xfaf4a05a  ! 4469: STXA_I	stxa	%r29, [%r18 + 0x005a] %asi
	.word 0xb53cc000  ! 4472: SRA_R	sra 	%r19, %r0, %r26
T3_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4473: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb2054000  ! 4474: ADD_R	add 	%r21, %r0, %r25
	.word 0xfe74c000  ! 4478: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb97ca401  ! 4479: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xf4340000  ! 4482: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf8b44020  ! 4483: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_338:
	setx	0x400335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x430137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x41030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_341:
	setx	0x410030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_342:
	setx	0x41020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5a0ae  ! 4496: STWA_I	stwa	%r31, [%r22 + 0x00ae] %asi
	.word 0xfe2de02b  ! 4497: STB_I	stb	%r31, [%r23 + 0x002b]
	.word 0xf434c000  ! 4501: STH_R	sth	%r26, [%r19 + %r0]
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829c0  ! 4503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	.word 0xf6a58020  ! 4504: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 4506: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbe35a173  ! 4508: SUBC_I	orn 	%r22, 0x0173, %r31
cpu_intr_3_343:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_344:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac603c  ! 4517: STBA_I	stba	%r31, [%r17 + 0x003c] %asi
cpu_intr_3_345:
	setx	0x42021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c3001  ! 4519: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xf0a420e8  ! 4520: STWA_I	stwa	%r24, [%r16 + 0x00e8] %asi
T3_asi_reg_rd_241:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0ac4020  ! 4523: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfab4c020  ! 4525: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_wr_184:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 4526: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfef4e0aa  ! 4530: STXA_I	stxa	%r31, [%r19 + 0x00aa] %asi
T3_asi_reg_rd_242:
	mov	0x18, %r14
	.word 0xf4db8e60  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf6744000  ! 4537: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xb53d9000  ! 4538: SRAX_R	srax	%r22, %r0, %r26
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, a)
	.word 0xf2758000  ! 4540: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf675e11e  ! 4542: STX_I	stx	%r27, [%r23 + 0x011e]
	.word 0xf0254000  ! 4546: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4547: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe74c000  ! 4549: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf2a420d5  ! 4552: STWA_I	stwa	%r25, [%r16 + 0x00d5] %asi
T3_asi_reg_wr_186:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 4553: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2a5e0ca  ! 4557: STWA_I	stwa	%r25, [%r23 + 0x00ca] %asi
	.word 0xf22ca140  ! 4558: STB_I	stb	%r25, [%r18 + 0x0140]
T3_asi_reg_rd_243:
	mov	0x9, %r14
	.word 0xf2db84a0  ! 4559: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbd34f001  ! 4560: SRLX_I	srlx	%r19, 0x0001, %r30
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 8)
	.word 0xf224c000  ! 4564: STW_R	stw	%r25, [%r19 + %r0]
cpu_intr_3_346:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e142  ! 4569: STHA_I	stha	%r28, [%r23 + 0x0142] %asi
T3_asi_reg_rd_244:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4f520b7  ! 4573: STXA_I	stxa	%r26, [%r20 + 0x00b7] %asi
T3_asi_reg_wr_187:
	mov	0x35, %r14
	.word 0xf6f38e60  ! 4574: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_245:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_347:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 4581: STW_R	stw	%r31, [%r22 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_246:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_348:
	setx	0x450315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 4589: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf6a4a0cf  ! 4590: STWA_I	stwa	%r27, [%r18 + 0x00cf] %asi
cpu_intr_3_349:
	setx	0x45000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x440230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b58020  ! 4599: STHA_R	stha	%r28, [%r22 + %r0] 0x01
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 25)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982fc8  ! 4605: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc8, %hpstate
	.word 0xf8b5c020  ! 4606: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe258000  ! 4612: STW_R	stw	%r31, [%r22 + %r0]
T3_asi_reg_wr_188:
	mov	0x2c, %r14
	.word 0xf4f38e80  ! 4615: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a80  ! 4616: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
T3_asi_reg_wr_189:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 4617: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_351:
	setx	0x460022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 4619: STH_R	sth	%r27, [%r19 + %r0]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, c)
	.word 0xf2ace174  ! 4623: STBA_I	stba	%r25, [%r19 + 0x0174] %asi
cpu_intr_3_352:
	setx	0x470203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74a1ea  ! 4625: STX_I	stx	%r30, [%r18 + 0x01ea]
T3_asi_reg_wr_190:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 4626: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf62d4000  ! 4630: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf4a40020  ! 4635: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 31)
	.word 0xf875e090  ! 4639: STX_I	stx	%r28, [%r23 + 0x0090]
	.word 0xf2a5c020  ! 4641: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_247:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 4644: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_353:
	setx	0x470331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfc2d4000  ! 4647: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf874c000  ! 4650: STX_R	stx	%r28, [%r19 + %r0]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 34)
	.word 0xf2248000  ! 4653: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_354:
	setx	0x460239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f421d8  ! 4664: STXA_I	stxa	%r27, [%r16 + 0x01d8] %asi
	.word 0xf62460f6  ! 4666: STW_I	stw	%r27, [%r17 + 0x00f6]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xf4a44020  ! 4669: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
cpu_intr_3_355:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_356:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 4675: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf4a44020  ! 4677: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xfa2460da  ! 4679: STW_I	stw	%r29, [%r17 + 0x00da]
T3_asi_reg_rd_248:
	mov	0x19, %r14
	.word 0xf2db8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb4948000  ! 4682: ORcc_R	orcc 	%r18, %r0, %r26
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d0a  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
	.word 0xf62561ab  ! 4696: STW_I	stw	%r27, [%r21 + 0x01ab]
T3_asi_reg_rd_249:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf824212a  ! 4698: STW_I	stw	%r28, [%r16 + 0x012a]
T3_asi_reg_wr_191:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 4700: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb88cc000  ! 4702: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xf0ac2022  ! 4704: STBA_I	stba	%r24, [%r16 + 0x0022] %asi
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_357:
	setx	0x46002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_250:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb6a4e030  ! 4714: SUBcc_I	subcc 	%r19, 0x0030, %r27
T3_asi_reg_wr_192:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 4716: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_251:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 4719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_252:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 36)
	.word 0xfeb4a00a  ! 4728: STHA_I	stha	%r31, [%r18 + 0x000a] %asi
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 35)
	.word 0xfcb40020  ! 4737: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf82d61fb  ! 4738: STB_I	stb	%r28, [%r21 + 0x01fb]
T3_asi_reg_wr_193:
	mov	0x16, %r14
	.word 0xf4f38e80  ! 4740: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf224609d  ! 4752: STW_I	stw	%r25, [%r17 + 0x009d]
T3_asi_reg_wr_194:
	mov	0x12, %r14
	.word 0xf6f38400  ! 4754: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_253:
	mov	0x33, %r14
	.word 0xf8db8e80  ! 4756: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_358:
	setx	0x450025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4e0d0  ! 4759: STWA_I	stwa	%r28, [%r19 + 0x00d0] %asi
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 38)
	.word 0xf0f5612a  ! 4763: STXA_I	stxa	%r24, [%r21 + 0x012a] %asi
	.word 0xb3643801  ! 4764: MOVcc_I	<illegal instruction>
	.word 0xf8740000  ! 4765: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfcf46198  ! 4767: STXA_I	stxa	%r30, [%r17 + 0x0198] %asi
cpu_intr_3_359:
	setx	0x45013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d4000  ! 4774: SRA_R	sra 	%r21, %r0, %r30
	.word 0xfc74e1eb  ! 4776: STX_I	stx	%r30, [%r19 + 0x01eb]
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, d)
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 35)
	.word 0xfea58020  ! 4779: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf8ad61c7  ! 4783: STBA_I	stba	%r28, [%r21 + 0x01c7] %asi
cpu_intr_3_360:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 37)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c88  ! 4795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
T3_asi_reg_wr_195:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 4797: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf035204b  ! 4802: STH_I	sth	%r24, [%r20 + 0x004b]
	.word 0xbd3d6001  ! 4803: SRA_I	sra 	%r21, 0x0001, %r30
cpu_intr_3_362:
	setx	0x47023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63461e8  ! 4808: STH_I	sth	%r27, [%r17 + 0x01e8]
	.word 0xb4b54000  ! 4809: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xb4b58000  ! 4810: ORNcc_R	orncc 	%r22, %r0, %r26
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, a)
	.word 0xba3c6107  ! 4817: XNOR_I	xnor 	%r17, 0x0107, %r29
cpu_intr_3_363:
	setx	0x450221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075619e  ! 4820: STX_I	stx	%r24, [%r21 + 0x019e]
cpu_intr_3_364:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c42073  ! 4824: ADDCcc_I	addccc 	%r16, 0x0073, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf8a4c020  ! 4828: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_365:
	setx	0x460118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_TO_TL1
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 28)
	.word 0xfef5a107  ! 4836: STXA_I	stxa	%r31, [%r22 + 0x0107] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xb6458000  ! 4844: ADDC_R	addc 	%r22, %r0, %r27
	.word 0xbcb4c000  ! 4845: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xbb508000  ! 4848: RDPR_TSTATE	rdpr	%tstate, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfa74c000  ! 4851: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xbe2c61df  ! 4855: ANDN_I	andn 	%r17, 0x01df, %r31
	.word 0xbd2d7001  ! 4856: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0xfaa5a119  ! 4861: STWA_I	stwa	%r29, [%r22 + 0x0119] %asi
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_254:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 4863: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfe2c8000  ! 4865: STB_R	stb	%r31, [%r18 + %r0]
cpu_intr_3_366:
	setx	0x47013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_367:
	setx	0x27, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 4869: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf62ca18c  ! 4871: STB_I	stb	%r27, [%r18 + 0x018c]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_196:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 4873: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4350000  ! 4875: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xba0d0000  ! 4876: AND_R	and 	%r20, %r0, %r29
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198394a  ! 4879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, d)
	.word 0xbeb4c000  ! 4885: ORNcc_R	orncc 	%r19, %r0, %r31
	.word 0xf2a4e003  ! 4887: STWA_I	stwa	%r25, [%r19 + 0x0003] %asi
	.word 0xb32da001  ! 4888: SLL_I	sll 	%r22, 0x0001, %r25
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xfe244000  ! 4891: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_wr_197:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 4892: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_368:
	setx	0x47032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_255:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6ad61ba  ! 4896: STBA_I	stba	%r27, [%r21 + 0x01ba] %asi
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 19)
	.word 0x9194a1ce  ! 4900: WRPR_PIL_I	wrpr	%r18, 0x01ce, %pil
	.word 0xfaa5604f  ! 4901: STWA_I	stwa	%r29, [%r21 + 0x004f] %asi
	.word 0xf4b4616d  ! 4902: STHA_I	stha	%r26, [%r17 + 0x016d] %asi
cpu_intr_3_369:
	setx	0x440317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb44020  ! 4910: STHA_R	stha	%r31, [%r17 + %r0] 0x01
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_370:
	setx	0x45032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b521ee  ! 4916: STHA_I	stha	%r28, [%r20 + 0x01ee] %asi
	.word 0xf02d4000  ! 4919: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf6f561b4  ! 4922: STXA_I	stxa	%r27, [%r21 + 0x01b4] %asi
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa2c4000  ! 4925: STB_R	stb	%r29, [%r17 + %r0]
T3_asi_reg_wr_198:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 4927: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf6a50020  ! 4930: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983842  ! 4931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
cpu_intr_3_371:
	setx	0x450300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5e121  ! 4935: STHA_I	stha	%r29, [%r23 + 0x0121] %asi
	.word 0xfa354000  ! 4940: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb83d8000  ! 4942: XNOR_R	xnor 	%r22, %r0, %r28
	.word 0xf0254000  ! 4944: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb69421c5  ! 4945: ORcc_I	orcc 	%r16, 0x01c5, %r27
T3_asi_reg_wr_199:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 4946: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b50  ! 4948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 32)
	.word 0xfa34c000  ! 4951: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_wr_200:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 4952: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2358000  ! 4953: STH_R	sth	%r25, [%r22 + %r0]
T3_asi_reg_wr_201:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 4954: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_256:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_372:
	setx	0x440219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_202:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 4963: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbea56105  ! 4965: SUBcc_I	subcc 	%r21, 0x0105, %r31
T3_asi_reg_wr_203:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4966: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_257:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_373:
	setx	0x440039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c8000  ! 4970: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf0344000  ! 4972: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xbb3cd000  ! 4973: SRAX_R	srax	%r19, %r0, %r29
	.word 0xfc34218c  ! 4974: STH_I	sth	%r30, [%r16 + 0x018c]
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc350000  ! 4978: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xba154000  ! 4980: OR_R	or 	%r21, %r0, %r29
	.word 0xfa244000  ! 4984: STW_R	stw	%r29, [%r17 + %r0]
T3_asi_reg_wr_204:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 4986: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfcac4020  ! 4988: STBA_R	stba	%r30, [%r17 + %r0] 0x01
cpu_intr_3_374:
	setx	0x46033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_375:
	setx	0x46023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 4995: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
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
	.word 0xfa554000  ! 1: LDSH_R	ldsh	[%r21 + %r0], %r29
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_0:
	setx	0x18012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_1:
	setx	0x1b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_0:
	mov	0x19, %r14
	.word 0xf0db8400  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_1:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 11: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 18)
	.word 0xf255c000  ! 14: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf4dd61d4  ! 15: LDXA_I	ldxa	[%r21, + 0x01d4] %asi, %r26
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982cd2  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd2, %hpstate
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_2:
	setx	0x1f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_0:
	mov	0x33, %r14
	.word 0xf0f384a0  ! 21: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8844020  ! 22: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_1:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 23: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 34)
	.word 0xf0d521b0  ! 25: LDSHA_I	ldsha	[%r20, + 0x01b0] %asi, %r24
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 23)
	.word 0xfa048000  ! 29: LDUW_R	lduw	[%r18 + %r0], %r29
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 39)
	.word 0xbcbce172  ! 32: XNORcc_I	xnorcc 	%r19, 0x0172, %r30
T2_asi_reg_rd_2:
	mov	0x12, %r14
	.word 0xf0db8e60  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_3:
	setx	0x1f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05213a  ! 37: LDUW_I	lduw	[%r20 + 0x013a], %r30
T2_asi_reg_rd_3:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6042056  ! 41: LDUW_I	lduw	[%r16 + 0x0056], %r27
T2_asi_reg_rd_4:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc94c020  ! 43: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
	.word 0xf68d4020  ! 44: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198294a  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
T2_asi_reg_wr_2:
	mov	0x38, %r14
	.word 0xf6f389e0  ! 48: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_4:
	setx	0x1d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 62: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, a)
	.word 0xf0048000  ! 67: LDUW_R	lduw	[%r18 + %r0], %r24
cpu_intr_2_5:
	setx	0x1d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dde173  ! 70: LDXA_I	ldxa	[%r23, + 0x0173] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb02520d4  ! 76: SUB_I	sub 	%r20, 0x00d4, %r24
	.word 0xf60da170  ! 77: LDUB_I	ldub	[%r22 + 0x0170], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_6:
	setx	0x1e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c0020  ! 83: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
	.word 0xfa950020  ! 85: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
cpu_intr_2_7:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dce0f4  ! 87: LDXA_I	ldxa	[%r19, + 0x00f4] %asi, %r26
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 1e)
	.word 0xba35a0da  ! 92: SUBC_I	orn 	%r22, 0x00da, %r29
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a88  ! 95: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a88, %hpstate
T2_asi_reg_rd_5:
	mov	0xe, %r14
	.word 0xf8db89e0  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_8:
	setx	0x1d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad0  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
	.word 0xfe5d215f  ! 100: LDX_I	ldx	[%r20 + 0x015f], %r31
cpu_intr_2_9:
	setx	0x1d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_10:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe040000  ! 107: LDUW_R	lduw	[%r16 + %r0], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_11:
	setx	0x1f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf09421fa  ! 112: LDUHA_I	lduha	[%r16, + 0x01fa] %asi, %r24
	.word 0xf8958020  ! 116: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
cpu_intr_2_12:
	setx	0x1f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc154000  ! 123: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf65ca0ac  ! 125: LDX_I	ldx	[%r18 + 0x00ac], %r27
	.word 0xfa948020  ! 128: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_6:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 129: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_7:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf4dd61a3  ! 134: LDXA_I	ldxa	[%r21, + 0x01a3] %asi, %r26
T2_asi_reg_rd_8:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 135: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 1)
	.word 0xf24d8000  ! 138: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf204c000  ! 139: LDUW_R	lduw	[%r19 + %r0], %r25
cpu_intr_2_14:
	setx	0x1d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c0020  ! 141: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_9:
	mov	0x24, %r14
	.word 0xf6db8e40  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_15:
	setx	0x1f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_10:
	mov	0x2c, %r14
	.word 0xf2db89e0  ! 157: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_11:
	mov	0x16, %r14
	.word 0xf8db8400  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf05c0000  ! 166: LDX_R	ldx	[%r16 + %r0], %r24
T2_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_16:
	setx	0x1e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d4000  ! 172: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfa54a12b  ! 173: LDSH_I	ldsh	[%r18 + 0x012b], %r29
T2_asi_reg_wr_4:
	mov	0x2e, %r14
	.word 0xf2f384a0  ! 174: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb0240000  ! 175: SUB_R	sub 	%r16, %r0, %r24
	.word 0xf25d0000  ! 178: LDX_R	ldx	[%r20 + %r0], %r25
T2_asi_reg_wr_5:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 180: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_13:
	mov	0x12, %r14
	.word 0xf2db89e0  ! 181: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xba05a131  ! 182: ADD_I	add 	%r22, 0x0131, %r29
	.word 0xf4440000  ! 185: LDSW_R	ldsw	[%r16 + %r0], %r26
cpu_intr_2_17:
	setx	0x1c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe958020  ! 187: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf4146055  ! 191: LDUH_I	lduh	[%r17 + 0x0055], %r26
	.word 0xf454a15e  ! 192: LDSH_I	ldsh	[%r18 + 0x015e], %r26
T2_asi_reg_rd_14:
	mov	0x37, %r14
	.word 0xfadb89e0  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_18:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_15:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_19:
	setx	0x1e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 36)
	.word 0xb8bd2143  ! 206: XNORcc_I	xnorcc 	%r20, 0x0143, %r28
T2_asi_reg_wr_6:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 207: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfe054000  ! 209: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf4dca16c  ! 210: LDXA_I	ldxa	[%r18, + 0x016c] %asi, %r26
	.word 0xbc156106  ! 211: OR_I	or 	%r21, 0x0106, %r30
	.word 0xf28d4020  ! 213: LDUBA_R	lduba	[%r21, %r0] 0x01, %r25
T2_asi_reg_wr_7:
	mov	0x1f, %r14
	.word 0xfaf389e0  ! 214: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 37)
	.word 0xf84cc000  ! 217: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xbeb42187  ! 218: SUBCcc_I	orncc 	%r16, 0x0187, %r31
	.word 0xb8b44000  ! 220: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xbc3cc000  ! 222: XNOR_R	xnor 	%r19, %r0, %r30
cpu_intr_2_20:
	setx	0x1e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_21:
	setx	0x1c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d0020  ! 225: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_22:
	setx	0x1d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c4c020  ! 239: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xb20ca0d7  ! 241: AND_I	and 	%r18, 0x00d7, %r25
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_8:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 243: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 11)
	.word 0xf04ce099  ! 249: LDSB_I	ldsb	[%r19 + 0x0099], %r24
	ta	T_CHANGE_HPRIV
	.word 0xf80c4000  ! 252: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xf645c000  ! 254: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb83ce1cb  ! 255: XNOR_I	xnor 	%r19, 0x01cb, %r28
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_23:
	setx	0x1d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_24:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d0020  ! 269: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
	.word 0xf6cd0020  ! 270: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
	.word 0xbca58000  ! 273: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xfe152039  ! 275: LDUH_I	lduh	[%r20 + 0x0039], %r31
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_25:
	setx	0x1c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_9:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 283: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_26:
	setx	0x1e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_27:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de049  ! 293: LDUBA_I	lduba	[%r23, + 0x0049] %asi, %r28
	.word 0xfa0de076  ! 294: LDUB_I	ldub	[%r23 + 0x0076], %r29
	ta	T_CHANGE_HPRIV
	.word 0xfedc2182  ! 299: LDXA_I	ldxa	[%r16, + 0x0182] %asi, %r31
cpu_intr_2_28:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1f031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005a0fe  ! 307: LDUW_I	lduw	[%r22 + 0x00fe], %r24
cpu_intr_2_30:
	setx	0x1d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_16:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe85e13c  ! 315: LDUWA_I	lduwa	[%r23, + 0x013c] %asi, %r31
	.word 0xfe044000  ! 316: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf28c8020  ! 317: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 322: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_18:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_31:
	setx	0x1c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 338: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa158000  ! 342: LDUH_R	lduh	[%r22 + %r0], %r29
cpu_intr_2_32:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d44020  ! 347: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 353: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_12:
	mov	0x17, %r14
	.word 0xfaf38e80  ! 354: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_33:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_13:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 358: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc8d21db  ! 359: LDUBA_I	lduba	[%r20, + 0x01db] %asi, %r30
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb8c5607d  ! 363: ADDCcc_I	addccc 	%r21, 0x007d, %r28
	.word 0xba34e101  ! 365: ORN_I	orn 	%r19, 0x0101, %r29
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_19:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe95a06e  ! 369: LDUHA_I	lduha	[%r22, + 0x006e] %asi, %r31
T2_asi_reg_rd_20:
	mov	0x0, %r14
	.word 0xf2db8e60  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf615c000  ! 376: LDUH_R	lduh	[%r23 + %r0], %r27
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_21:
	mov	0x13, %r14
	.word 0xf8db8400  ! 378: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf255a18d  ! 380: LDSH_I	ldsh	[%r22 + 0x018d], %r25
	.word 0xfc5ca097  ! 381: LDX_I	ldx	[%r18 + 0x0097], %r30
T2_asi_reg_rd_22:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb03560e2  ! 383: ORN_I	orn 	%r21, 0x00e2, %r24
	.word 0xfe158000  ! 385: LDUH_R	lduh	[%r22 + %r0], %r31
T2_asi_reg_wr_14:
	mov	0x30, %r14
	.word 0xf2f384a0  ! 387: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_34:
	setx	0x1e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x1f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8548000  ! 391: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf24ce127  ! 392: LDSB_I	ldsb	[%r19 + 0x0127], %r25
	.word 0xf40c4000  ! 393: LDUB_R	ldub	[%r17 + %r0], %r26
T2_asi_reg_wr_15:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 398: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2154000  ! 403: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_rd_23:
	mov	0x19, %r14
	.word 0xfedb84a0  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbf2df001  ! 406: SLLX_I	sllx	%r23, 0x0001, %r31
T2_asi_reg_wr_16:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 413: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_36:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 418: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ad0  ! 420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
cpu_intr_2_37:
	setx	0x1c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ccc020  ! 422: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
cpu_intr_2_38:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_24:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_17:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 430: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_39:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d1000  ! 432: SRAX_R	srax	%r20, %r0, %r26
	.word 0xb08c8000  ! 434: ANDcc_R	andcc 	%r18, %r0, %r24
T2_asi_reg_rd_25:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4dce1b9  ! 437: LDXA_I	ldxa	[%r19, + 0x01b9] %asi, %r26
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb97de401  ! 443: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xf2852104  ! 444: LDUWA_I	lduwa	[%r20, + 0x0104] %asi, %r25
	.word 0xf8948020  ! 445: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xbca560c6  ! 447: SUBcc_I	subcc 	%r21, 0x00c6, %r30
T2_asi_reg_rd_26:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 450: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_27:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 452: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf25d8000  ! 454: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xfc0421c9  ! 458: LDUW_I	lduw	[%r16 + 0x01c9], %r30
T2_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 459: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_28:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf804c000  ! 465: LDUW_R	lduw	[%r19 + %r0], %r28
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 15)
	.word 0xf2550000  ! 468: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf8cda196  ! 470: LDSBA_I	ldsba	[%r22, + 0x0196] %asi, %r28
	.word 0xb0b48000  ! 471: ORNcc_R	orncc 	%r18, %r0, %r24
T2_asi_reg_rd_30:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL1
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc8d60e9  ! 482: LDUBA_I	lduba	[%r21, + 0x00e9] %asi, %r30
cpu_intr_2_40:
	setx	0x22002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa856085  ! 488: LDUWA_I	lduwa	[%r21, + 0x0085] %asi, %r29
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_19:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 490: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf65d4000  ! 492: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf00cc000  ! 493: LDUB_R	ldub	[%r19 + %r0], %r24
cpu_intr_2_41:
	setx	0x22010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 497: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf64c0000  ! 498: LDSB_R	ldsb	[%r16 + %r0], %r27
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, e)
	.word 0xf6c44020  ! 511: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_42:
	setx	0x220219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x220232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015c000  ! 519: LDUH_R	lduh	[%r23 + %r0], %r24
cpu_intr_2_44:
	setx	0x210313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64561fb  ! 526: LDSW_I	ldsw	[%r21 + 0x01fb], %r27
	.word 0xfe558000  ! 529: LDSH_R	ldsh	[%r22 + %r0], %r31
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_45:
	setx	0x210116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d0000  ! 532: LDSB_R	ldsb	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0xbf2d6001  ! 538: SLL_I	sll 	%r21, 0x0001, %r31
cpu_intr_2_46:
	setx	0x23002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_47:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4ca0c3  ! 542: LDSB_I	ldsb	[%r18 + 0x00c3], %r30
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_31:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xbd504000  ! 550: RDPR_TNPC	<illegal instruction>
cpu_intr_2_48:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa044000  ! 553: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf485c020  ! 555: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_32:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf60c0000  ! 559: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xf44ca159  ! 560: LDSB_I	ldsb	[%r18 + 0x0159], %r26
	.word 0xb0854000  ! 563: ADDcc_R	addcc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf444c000  ! 569: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfc8d8020  ! 570: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
	.word 0xf055c000  ! 571: LDSH_R	ldsh	[%r23 + %r0], %r24
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_33:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf404e0aa  ! 576: LDUW_I	lduw	[%r19 + 0x00aa], %r26
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbf2ca001  ! 581: SLL_I	sll 	%r18, 0x0001, %r31
T2_asi_reg_wr_20:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 583: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc45e048  ! 585: LDSW_I	ldsw	[%r23 + 0x0048], %r30
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_34:
	mov	0xc, %r14
	.word 0xfedb8400  ! 587: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_49:
	setx	0x210316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_50:
	setx	0x1012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc9560e2  ! 595: LDUHA_I	lduha	[%r21, + 0x00e2] %asi, %r30
	.word 0xb8c4e077  ! 598: ADDCcc_I	addccc 	%r19, 0x0077, %r28
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, b)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_35:
	mov	0x0, %r14
	.word 0xf4db89e0  ! 610: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb08de077  ! 612: ANDcc_I	andcc 	%r23, 0x0077, %r24
	.word 0xf8c4e0a6  ! 614: LDSWA_I	ldswa	[%r19, + 0x00a6] %asi, %r28
	.word 0xf68ca049  ! 615: LDUBA_I	lduba	[%r18, + 0x0049] %asi, %r27
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 38)
	.word 0xfa15c000  ! 618: LDUH_R	lduh	[%r23 + %r0], %r29
cpu_intr_2_51:
	setx	0x200107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c60d2  ! 626: AND_I	and 	%r17, 0x00d2, %r30
	.word 0xb40d616e  ! 627: AND_I	and 	%r21, 0x016e, %r26
	.word 0xf28d0020  ! 630: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
	.word 0xf0d421db  ! 633: LDSHA_I	ldsha	[%r16, + 0x01db] %asi, %r24
	.word 0xfa4dc000  ! 638: LDSB_R	ldsb	[%r23 + %r0], %r29
T2_asi_reg_wr_21:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 641: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0dd61d3  ! 642: LDXA_I	ldxa	[%r21, + 0x01d3] %asi, %r24
cpu_intr_2_52:
	setx	0x200309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8040000  ! 647: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf0ccc020  ! 648: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_36:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_37:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf005c000  ! 652: LDUW_R	lduw	[%r23 + %r0], %r24
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc0d4000  ! 656: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf655a175  ! 657: LDSH_I	ldsh	[%r22 + 0x0175], %r27
T2_asi_reg_rd_38:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_39:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xba0de0bc  ! 662: AND_I	and 	%r23, 0x00bc, %r29
cpu_intr_2_53:
	setx	0x22021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe444000  ! 665: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf4156033  ! 666: LDUH_I	lduh	[%r21 + 0x0033], %r26
	.word 0xbf34a001  ! 668: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0xfa4d8000  ! 669: LDSB_R	ldsb	[%r22 + %r0], %r29
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_54:
	setx	0x200227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004c000  ! 674: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf0cd619a  ! 675: LDSBA_I	ldsba	[%r21, + 0x019a] %asi, %r24
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_55:
	setx	0x230237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28de067  ! 682: LDUBA_I	lduba	[%r23, + 0x0067] %asi, %r25
T2_asi_reg_rd_40:
	mov	0x19, %r14
	.word 0xfcdb89e0  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_41:
	mov	0x29, %r14
	.word 0xf2db8400  ! 686: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_56:
	setx	0x200334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_57:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe040000  ! 696: LDUW_R	lduw	[%r16 + %r0], %r31
T2_asi_reg_wr_22:
	mov	0x10, %r14
	.word 0xfcf38400  ! 697: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xf4058000  ! 701: LDUW_R	lduw	[%r22 + %r0], %r26
cpu_intr_2_58:
	setx	0x20011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x210331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 707: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0x8f902000  ! 710: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, b)
	.word 0xf894612d  ! 719: LDUHA_I	lduha	[%r17, + 0x012d] %asi, %r28
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_60:
	setx	0x22013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_42:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbb3cd000  ! 732: SRAX_R	srax	%r19, %r0, %r29
	.word 0xf2cca196  ! 733: LDSBA_I	ldsba	[%r18, + 0x0196] %asi, %r25
	.word 0xfc8c6068  ! 737: LDUBA_I	lduba	[%r17, + 0x0068] %asi, %r30
	.word 0xf28c8020  ! 738: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
	.word 0xfe0ca07d  ! 739: LDUB_I	ldub	[%r18 + 0x007d], %r31
	.word 0xf64421b9  ! 741: LDSW_I	ldsw	[%r16 + 0x01b9], %r27
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_23:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 747: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e00  ! 752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
T2_asi_reg_rd_43:
	mov	0x4, %r14
	.word 0xf8db8e40  ! 753: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf45ce1cf  ! 754: LDX_I	ldx	[%r19 + 0x01cf], %r26
	.word 0xf65ce012  ! 757: LDX_I	ldx	[%r19 + 0x0012], %r27
	.word 0xfe046011  ! 758: LDUW_I	lduw	[%r17 + 0x0011], %r31
	.word 0xb13c5000  ! 759: SRAX_R	srax	%r17, %r0, %r24
	.word 0xbd2c5000  ! 762: SLLX_R	sllx	%r17, %r0, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfa5de1c1  ! 767: LDX_I	ldx	[%r23 + 0x01c1], %r29
cpu_intr_2_61:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_24:
	mov	0x1b, %r14
	.word 0xfcf38e60  ! 770: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf655e156  ! 774: LDSH_I	ldsh	[%r23 + 0x0156], %r27
T2_asi_reg_rd_44:
	mov	0x7, %r14
	.word 0xf8db89e0  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf2144000  ! 776: LDUH_R	lduh	[%r17 + %r0], %r25
T2_asi_reg_rd_45:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbb643801  ! 778: MOVcc_I	<illegal instruction>
	.word 0xf69561db  ! 779: LDUHA_I	lduha	[%r21, + 0x01db] %asi, %r27
cpu_intr_2_62:
	setx	0x220218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404a0c5  ! 788: LDUW_I	lduw	[%r18 + 0x00c5], %r26
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_63:
	setx	0x200118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_64:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x10, %r14
	.word 0xfef384a0  ! 798: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_65:
	setx	0x20003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd4020  ! 803: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
	.word 0xf415215d  ! 808: LDUH_I	lduh	[%r20 + 0x015d], %r26
	.word 0xb61d8000  ! 811: XOR_R	xor 	%r22, %r0, %r27
T2_asi_reg_rd_46:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf40c61cd  ! 816: LDUB_I	ldub	[%r17 + 0x01cd], %r26
	.word 0xfe8d4020  ! 817: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_47:
	mov	0x27, %r14
	.word 0xfcdb8400  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbc95e184  ! 824: ORcc_I	orcc 	%r23, 0x0184, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_48:
	mov	0x11, %r14
	.word 0xf0db8e80  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_66:
	setx	0x210027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24da1b1  ! 830: LDSB_I	ldsb	[%r22 + 0x01b1], %r25
cpu_intr_2_67:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda0da  ! 842: LDSBA_I	ldsba	[%r22, + 0x00da] %asi, %r31
T2_asi_reg_rd_49:
	mov	0x28, %r14
	.word 0xf6db89e0  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_68:
	setx	0x20012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69ca1f1  ! 847: XORcc_I	xorcc 	%r18, 0x01f1, %r27
cpu_intr_2_69:
	setx	0x21000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_70:
	setx	0x200120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x220134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_26:
	mov	0x1e, %r14
	.word 0xfaf38e80  ! 855: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_72:
	setx	0x22011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0850020  ! 859: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 9)
	.word 0xb805a087  ! 863: ADD_I	add 	%r22, 0x0087, %r28
	.word 0xfe458000  ! 864: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xfc4d8000  ! 869: LDSB_R	ldsb	[%r22 + %r0], %r30
cpu_intr_2_73:
	setx	0x23021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 873: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_74:
	setx	0x230119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d603c  ! 877: LDUBA_I	lduba	[%r21, + 0x003c] %asi, %r25
	.word 0xfa0cc000  ! 880: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xb0a5c000  ! 881: SUBcc_R	subcc 	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfc5cc000  ! 885: LDX_R	ldx	[%r19 + %r0], %r30
T2_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_51:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb6b48000  ! 888: ORNcc_R	orncc 	%r18, %r0, %r27
cpu_intr_2_75:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c8020  ! 890: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
cpu_intr_2_76:
	setx	0x20021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe544000  ! 894: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfc0d6192  ! 895: LDUB_I	ldub	[%r21 + 0x0192], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf44460ed  ! 898: LDSW_I	ldsw	[%r17 + 0x00ed], %r26
	.word 0xfa0d2164  ! 899: LDUB_I	ldub	[%r20 + 0x0164], %r29
	.word 0xf0448000  ! 900: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xfe5ce1cf  ! 901: LDX_I	ldx	[%r19 + 0x01cf], %r31
cpu_intr_2_77:
	setx	0x230119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 1)
	.word 0xfe544000  ! 907: LDSH_R	ldsh	[%r17 + %r0], %r31
T2_asi_reg_rd_52:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 908: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_53:
	mov	0xc, %r14
	.word 0xf4db84a0  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbe358000  ! 910: SUBC_R	orn 	%r22, %r0, %r31
T2_asi_reg_wr_28:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 911: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_29:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 913: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf68d4020  ! 914: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_30:
	mov	0x24, %r14
	.word 0xf4f389e0  ! 917: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xf0548000  ! 921: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb6ad0000  ! 922: ANDNcc_R	andncc 	%r20, %r0, %r27
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf68461a9  ! 924: LDUWA_I	lduwa	[%r17, + 0x01a9] %asi, %r27
	.word 0xf815a163  ! 925: LDUH_I	lduh	[%r22 + 0x0163], %r28
cpu_intr_2_78:
	setx	0x25002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 927: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xba1c20c2  ! 928: XOR_I	xor 	%r16, 0x00c2, %r29
T2_asi_reg_rd_54:
	mov	0xc, %r14
	.word 0xf4db8e60  ! 929: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0c56071  ! 930: LDSWA_I	ldswa	[%r21, + 0x0071] %asi, %r24
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 12)
	.word 0xf0cca1fc  ! 932: LDSBA_I	ldsba	[%r18, + 0x01fc] %asi, %r24
	.word 0xb2954000  ! 933: ORcc_R	orcc 	%r21, %r0, %r25
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_31:
	mov	0x37, %r14
	.word 0xf4f38e60  ! 940: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 8)
	.word 0xf48dc020  ! 945: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_32:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 951: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbd500000  ! 952: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1
	.word 0xf0c4a02c  ! 959: LDSWA_I	ldswa	[%r18, + 0x002c] %asi, %r24
T2_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_79:
	setx	0x270333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 21)
	.word 0xbe3dc000  ! 974: XNOR_R	xnor 	%r23, %r0, %r31
cpu_intr_2_80:
	setx	0x260234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_81:
	setx	0x26010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 979: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfac561d6  ! 981: LDSWA_I	ldswa	[%r21, + 0x01d6] %asi, %r29
	.word 0xfa5c0000  ! 985: LDX_R	ldx	[%r16 + %r0], %r29
cpu_intr_2_82:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0xe, %r14
	.word 0xfef38e60  ! 988: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 18)
	.word 0xb40c4000  ! 990: AND_R	and 	%r17, %r0, %r26
	.word 0xf815e058  ! 992: LDUH_I	lduh	[%r23 + 0x0058], %r28
cpu_intr_2_83:
	setx	0x240127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_56:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe0d0000  ! 997: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xbcad0000  ! 1006: ANDNcc_R	andncc 	%r20, %r0, %r30
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_85:
	setx	0x250138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf25cc000  ! 1013: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xfc54c000  ! 1016: LDSH_R	ldsh	[%r19 + %r0], %r30
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 27)
	.word 0x81956198  ! 1021: WRPR_TPC_I	wrpr	%r21, 0x0198, %tpc
cpu_intr_2_86:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf85dc000  ! 1025: LDX_R	ldx	[%r23 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_57:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6d4a16b  ! 1032: LDSHA_I	ldsha	[%r18, + 0x016b] %asi, %r27
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8d48020  ! 1035: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf88d8020  ! 1040: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
	.word 0xf655e02a  ! 1043: LDSH_I	ldsh	[%r23 + 0x002a], %r27
	.word 0xfec58020  ! 1046: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xbb7cc400  ! 1048: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb8c46177  ! 1049: ADDCcc_I	addccc 	%r17, 0x0177, %r28
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_58:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 1054: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xba35e1fe  ! 1055: ORN_I	orn 	%r23, 0x01fe, %r29
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_87:
	setx	0x27021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf65c4000  ! 1062: LDX_R	ldx	[%r17 + %r0], %r27
T2_asi_reg_wr_34:
	mov	0x15, %r14
	.word 0xfaf384a0  ! 1063: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_88:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed50020  ! 1070: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
cpu_intr_2_89:
	setx	0x25022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d46061  ! 1073: LDSHA_I	ldsha	[%r17, + 0x0061] %asi, %r28
	.word 0xfc1560b3  ! 1077: LDUH_I	lduh	[%r21 + 0x00b3], %r30
T2_asi_reg_wr_35:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 1078: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb0c42149  ! 1079: ADDCcc_I	addccc 	%r16, 0x0149, %r24
	.word 0xf054c000  ! 1081: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xf6cd60d6  ! 1085: LDSBA_I	ldsba	[%r21, + 0x00d6] %asi, %r27
cpu_intr_2_90:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_91:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2540000  ! 1088: LDSH_R	ldsh	[%r16 + %r0], %r25
cpu_intr_2_92:
	setx	0x270315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, c)
	.word 0xfa4de1c9  ! 1097: LDSB_I	ldsb	[%r23 + 0x01c9], %r29
T2_asi_reg_rd_59:
	mov	0x20, %r14
	.word 0xf0db8e80  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf4c4a103  ! 1103: LDSWA_I	ldswa	[%r18, + 0x0103] %asi, %r26
cpu_intr_2_93:
	setx	0x27030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf695a1f5  ! 1109: LDUHA_I	lduha	[%r22, + 0x01f5] %asi, %r27
T2_asi_reg_rd_60:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf64c8000  ! 1123: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf4c44020  ! 1124: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
	.word 0xf894c020  ! 1125: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xfe4421cd  ! 1129: LDSW_I	ldsw	[%r16 + 0x01cd], %r31
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_61:
	mov	0x23, %r14
	.word 0xf6db8400  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983842  ! 1135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
cpu_intr_2_94:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5ca15b  ! 1140: LDX_I	ldx	[%r18 + 0x015b], %r29
	.word 0xb72c3001  ! 1142: SLLX_I	sllx	%r16, 0x0001, %r27
T2_asi_reg_wr_36:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 1143: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_95:
	setx	0x26030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa040000  ! 1149: LDUW_R	lduw	[%r16 + %r0], %r29
cpu_intr_2_96:
	setx	0x260036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 1153: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_97:
	setx	0x240224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0ce04f  ! 1162: LDUB_I	ldub	[%r19 + 0x004f], %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 27)
	.word 0xf85ca0a2  ! 1170: LDX_I	ldx	[%r18 + 0x00a2], %r28
	.word 0xf48ce138  ! 1171: LDUBA_I	lduba	[%r19, + 0x0138] %asi, %r26
	.word 0xfad4c020  ! 1173: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, f)
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_62:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf254c000  ! 1182: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf0954020  ! 1183: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_98:
	setx	0x24010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_99:
	setx	0x26033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 1188: LDUW_R	lduw	[%r23 + %r0], %r25
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 20)
	.word 0xf0c44020  ! 1190: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
cpu_intr_2_100:
	setx	0x25032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7345000  ! 1192: SRLX_R	srlx	%r17, %r0, %r27
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 27)
	.word 0xf0dd20cd  ! 1194: LDXA_I	ldxa	[%r20, + 0x00cd] %asi, %r24
T2_asi_reg_rd_63:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf2cd8020  ! 1196: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ada  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ada, %hpstate
T2_asi_reg_rd_64:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_65:
	mov	0x1e, %r14
	.word 0xfedb84a0  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_38:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 1203: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf24d8000  ! 1204: LDSB_R	ldsb	[%r22 + %r0], %r25
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_66:
	mov	0x5, %r14
	.word 0xfcdb8e80  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa4d21b6  ! 1212: LDSB_I	ldsb	[%r20 + 0x01b6], %r29
	.word 0xb4244000  ! 1214: SUB_R	sub 	%r17, %r0, %r26
T2_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf2d5e0aa  ! 1217: LDSHA_I	ldsha	[%r23, + 0x00aa] %asi, %r25
	.word 0xf05cc000  ! 1218: LDX_R	ldx	[%r19 + %r0], %r24
T2_asi_reg_rd_68:
	mov	0x19, %r14
	.word 0xf2db8400  ! 1219: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf8dd21b6  ! 1220: LDXA_I	ldxa	[%r20, + 0x01b6] %asi, %r28
cpu_intr_2_101:
	setx	0x24010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 1224: MOVcc_I	<illegal instruction>
cpu_intr_2_102:
	setx	0x240109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24da045  ! 1227: LDSB_I	ldsb	[%r22 + 0x0045], %r25
T2_asi_reg_rd_69:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_70:
	mov	0x17, %r14
	.word 0xfedb89e0  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 1231: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_103:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 17)
	.word 0xf4540000  ! 1235: LDSH_R	ldsh	[%r16 + %r0], %r26
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_40:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 1237: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_71:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbf500000  ! 1240: RDPR_TPC	<illegal instruction>
cpu_intr_2_104:
	setx	0x240120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0158000  ! 1242: LDUH_R	lduh	[%r22 + %r0], %r24
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982cc2  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
T2_asi_reg_rd_72:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 1244: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa5dc000  ! 1245: LDX_R	ldx	[%r23 + %r0], %r29
cpu_intr_2_105:
	setx	0x240304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3c)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c02  ! 1256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c02, %hpstate
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 0)
	.word 0xfc5c6122  ! 1261: LDX_I	ldx	[%r17 + 0x0122], %r30
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfc55c000  ! 1263: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xfa04a0ef  ! 1264: LDUW_I	lduw	[%r18 + 0x00ef], %r29
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, e)
	.word 0xfcd4214f  ! 1268: LDSHA_I	ldsha	[%r16, + 0x014f] %asi, %r30
	.word 0xfe95e08b  ! 1273: LDUHA_I	lduha	[%r23, + 0x008b] %asi, %r31
T2_asi_reg_rd_73:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_74:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfed5201b  ! 1277: LDSHA_I	ldsha	[%r20, + 0x001b] %asi, %r31
T2_asi_reg_wr_41:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 1278: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4cc8020  ! 1281: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
	.word 0xf204a054  ! 1283: LDUW_I	lduw	[%r18 + 0x0054], %r25
T2_asi_reg_rd_75:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_42:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1286: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_106:
	setx	0x27033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_76:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 1296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_107:
	setx	0x260220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c5000  ! 1303: SLLX_R	sllx	%r17, %r0, %r29
T2_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_78:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_43:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 1311: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf28c0020  ! 1312: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 31)
	.word 0xf695c020  ! 1321: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	.word 0xfe5d0000  ! 1323: LDX_R	ldx	[%r20 + %r0], %r31
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 4)
	.word 0xf815c000  ! 1327: LDUH_R	lduh	[%r23 + %r0], %r28
T2_asi_reg_wr_44:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1328: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6c5e1a7  ! 1330: LDSWA_I	ldswa	[%r23, + 0x01a7] %asi, %r27
	.word 0xf48c0020  ! 1331: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
cpu_intr_2_108:
	setx	0x25021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c60c3  ! 1335: LDUB_I	ldub	[%r17 + 0x00c3], %r31
	.word 0xf054c000  ! 1336: LDSH_R	ldsh	[%r19 + %r0], %r24
T2_asi_reg_rd_79:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_109:
	setx	0x240022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0050000  ! 1342: LDUW_R	lduw	[%r20 + %r0], %r24
T2_asi_reg_wr_45:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 1344: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbcb54000  ! 1346: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xf8dc211f  ! 1347: LDXA_I	ldxa	[%r16, + 0x011f] %asi, %r28
	.word 0xbead8000  ! 1354: ANDNcc_R	andncc 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfacd0020  ! 1357: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcc4e0f6  ! 1363: LDSWA_I	ldswa	[%r19, + 0x00f6] %asi, %r30
	.word 0xfc05c000  ! 1366: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xfe85c020  ! 1367: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
cpu_intr_2_110:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf094c020  ! 1372: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	.word 0xf00c0000  ! 1373: LDUB_R	ldub	[%r16 + %r0], %r24
T2_asi_reg_rd_80:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 1376: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb8256112  ! 1377: SUB_I	sub 	%r21, 0x0112, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_46:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 1381: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8544000  ! 1382: LDSH_R	ldsh	[%r17 + %r0], %r28
T2_asi_reg_rd_81:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb40c8000  ! 1385: AND_R	and 	%r18, %r0, %r26
	.word 0xf48da083  ! 1387: LDUBA_I	lduba	[%r22, + 0x0083] %asi, %r26
T2_asi_reg_rd_82:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc5c60b3  ! 1390: LDX_I	ldx	[%r17 + 0x00b3], %r30
	.word 0xfc8c8020  ! 1391: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982ac2  ! 1395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
cpu_intr_2_111:
	setx	0x2b0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_47:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 1407: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8c521ad  ! 1410: LDSWA_I	ldswa	[%r20, + 0x01ad] %asi, %r28
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf49461fd  ! 1414: LDUHA_I	lduha	[%r17, + 0x01fd] %asi, %r26
	.word 0xf4cd604a  ! 1415: LDSBA_I	ldsba	[%r21, + 0x004a] %asi, %r26
	.word 0xfe456110  ! 1416: LDSW_I	ldsw	[%r21 + 0x0110], %r31
	.word 0xf2044000  ! 1417: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xfc858020  ! 1419: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
cpu_intr_2_113:
	setx	0x280207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_114:
	setx	0x290334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_84:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 1424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_85:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_86:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf284e12f  ! 1435: LDUWA_I	lduwa	[%r19, + 0x012f] %asi, %r25
T2_asi_reg_wr_48:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 1438: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_49:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 1445: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ccc020  ! 1448: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
	.word 0xf80da1d2  ! 1450: LDUB_I	ldub	[%r22 + 0x01d2], %r28
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_87:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc0c2084  ! 1465: LDUB_I	ldub	[%r16 + 0x0084], %r30
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_50:
	mov	0xb, %r14
	.word 0xfaf38400  ! 1469: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_88:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf88c0020  ! 1472: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
	.word 0xfc8c4020  ! 1473: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_115:
	setx	0x2a0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 1476: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
cpu_intr_2_116:
	setx	0x2a013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6840020  ! 1480: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
cpu_intr_2_117:
	setx	0x2b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_89:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 37)
	.word 0xfecd606d  ! 1486: LDSBA_I	ldsba	[%r21, + 0x006d] %asi, %r31
	.word 0xf60d2095  ! 1487: LDUB_I	ldub	[%r20 + 0x0095], %r27
T2_asi_reg_wr_51:
	mov	0xe, %r14
	.word 0xfef38e60  ! 1488: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4c460fe  ! 1489: LDSWA_I	ldswa	[%r17, + 0x00fe] %asi, %r26
	.word 0xf6444000  ! 1490: LDSW_R	ldsw	[%r17 + %r0], %r27
cpu_intr_2_118:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8c50020  ! 1498: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf204a152  ! 1502: LDUW_I	lduw	[%r18 + 0x0152], %r25
	.word 0xfcd420df  ! 1503: LDSHA_I	ldsha	[%r16, + 0x00df] %asi, %r30
	.word 0xf084c020  ! 1504: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xf85dc000  ! 1509: LDX_R	ldx	[%r23 + %r0], %r28
T2_asi_reg_rd_90:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_119:
	setx	0x28033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 1518: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_91:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_92:
	mov	0x32, %r14
	.word 0xf2db84a0  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3540000  ! 1525: RDPR_GL	<illegal instruction>
cpu_intr_2_120:
	setx	0x2b032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982888  ! 1528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0888, %hpstate
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983890  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1890, %hpstate
cpu_intr_2_121:
	setx	0x2b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_122:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_93:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_123:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15a0cf  ! 1545: LDUH_I	lduh	[%r22 + 0x00cf], %r31
T2_asi_reg_rd_94:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc95c020  ! 1558: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_53:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1560: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf085a173  ! 1562: LDUWA_I	lduwa	[%r22, + 0x0173] %asi, %r24
	.word 0xf64ce169  ! 1563: LDSB_I	ldsb	[%r19 + 0x0169], %r27
	.word 0xfe95616a  ! 1565: LDUHA_I	lduha	[%r21, + 0x016a] %asi, %r31
	.word 0xf205217a  ! 1569: LDUW_I	lduw	[%r20 + 0x017a], %r25
T2_asi_reg_rd_95:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc45a1dc  ! 1572: LDSW_I	ldsw	[%r22 + 0x01dc], %r30
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b80  ! 1573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	ta	T_CHANGE_HPRIV
cpu_intr_2_124:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_125:
	setx	0x28030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cda18f  ! 1582: LDSBA_I	ldsba	[%r22, + 0x018f] %asi, %r28
	.word 0xf685c020  ! 1586: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_96:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb02da0a5  ! 1591: ANDN_I	andn 	%r22, 0x00a5, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb88c0000  ! 1594: ANDcc_R	andcc 	%r16, %r0, %r28
cpu_intr_2_126:
	setx	0x2a033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5ca0cc  ! 1600: LDX_I	ldx	[%r18 + 0x00cc], %r30
T2_asi_reg_rd_97:
	mov	0x24, %r14
	.word 0xfcdb8e60  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb80c21da  ! 1607: AND_I	and 	%r16, 0x01da, %r28
cpu_intr_2_127:
	setx	0x290123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55a15c  ! 1611: LDSH_I	ldsh	[%r22 + 0x015c], %r31
	.word 0xfc45e081  ! 1612: LDSW_I	ldsw	[%r23 + 0x0081], %r30
cpu_intr_2_128:
	setx	0x29001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_98:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf4dda157  ! 1620: LDXA_I	ldxa	[%r22, + 0x0157] %asi, %r26
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 1622: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf695216a  ! 1624: LDUHA_I	lduha	[%r20, + 0x016a] %asi, %r27
T2_asi_reg_wr_55:
	mov	0x11, %r14
	.word 0xf0f384a0  ! 1626: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_129:
	setx	0x2b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x0, %r14
	.word 0xf4db89e0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfadde12b  ! 1632: LDXA_I	ldxa	[%r23, + 0x012b] %asi, %r29
	.word 0xfe8da025  ! 1633: LDUBA_I	lduba	[%r22, + 0x0025] %asi, %r31
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_100:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0cd4020  ! 1638: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xbd7d8400  ! 1639: MOVR_R	movre	%r22, %r0, %r30
	.word 0xf88c203d  ! 1641: LDUBA_I	lduba	[%r16, + 0x003d] %asi, %r28
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe44c000  ! 1645: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf68c619f  ! 1647: LDUBA_I	lduba	[%r17, + 0x019f] %asi, %r27
	.word 0xfc4ca1b9  ! 1649: LDSB_I	ldsb	[%r18 + 0x01b9], %r30
	.word 0xfa8c8020  ! 1650: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
cpu_intr_2_130:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d48020  ! 1653: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
	.word 0xf255a0a2  ! 1661: LDSH_I	ldsh	[%r22 + 0x00a2], %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 28)
	.word 0xf4458000  ! 1668: LDSW_R	ldsw	[%r22 + %r0], %r26
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 17)
	.word 0xb52de001  ! 1671: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xf60da101  ! 1673: LDUB_I	ldub	[%r22 + 0x0101], %r27
	.word 0xbb7d6401  ! 1675: MOVR_I	movre	%r21, 0x1, %r29
cpu_intr_2_131:
	setx	0x2a0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_56:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 1677: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_101:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf255a1a0  ! 1680: LDSH_I	ldsh	[%r22 + 0x01a0], %r25
	.word 0xb5480000  ! 1681: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
cpu_intr_2_132:
	setx	0x29022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_133:
	setx	0x2b0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 13)
	.word 0xb4bd4000  ! 1693: XNORcc_R	xnorcc 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf685c020  ! 1697: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xf2048000  ! 1698: LDUW_R	lduw	[%r18 + %r0], %r25
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_102:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbe34e154  ! 1707: SUBC_I	orn 	%r19, 0x0154, %r31
cpu_intr_2_134:
	setx	0x280339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_135:
	setx	0x2b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ed2  ! 1713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
	.word 0xf2dd203a  ! 1714: LDXA_I	ldxa	[%r20, + 0x003a] %asi, %r25
	.word 0xf4ccc020  ! 1717: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
T2_asi_reg_rd_103:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 1719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_104:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf48d602c  ! 1726: LDUBA_I	lduba	[%r21, + 0x002c] %asi, %r26
T2_asi_reg_wr_57:
	mov	0x18, %r14
	.word 0xf0f38400  ! 1727: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf8d5213d  ! 1729: LDSHA_I	ldsha	[%r20, + 0x013d] %asi, %r28
T2_asi_reg_wr_58:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 1732: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xf0d54020  ! 1738: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_106:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2c4c020  ! 1740: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xf4c56165  ! 1741: LDSWA_I	ldswa	[%r21, + 0x0165] %asi, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, b)
	.word 0xb8b5e19f  ! 1748: SUBCcc_I	orncc 	%r23, 0x019f, %r28
cpu_intr_2_136:
	setx	0x29020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_137:
	setx	0x2a0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 1759: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbb2db001  ! 1764: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xf2cda054  ! 1768: LDSBA_I	ldsba	[%r22, + 0x0054] %asi, %r25
	.word 0xb62d0000  ! 1770: ANDN_R	andn 	%r20, %r0, %r27
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982952  ! 1771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0xf615606e  ! 1775: LDUH_I	lduh	[%r21 + 0x006e], %r27
T2_asi_reg_wr_60:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 1777: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_138:
	setx	0x29020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1784: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 10)
	.word 0xb53da001  ! 1787: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xf2844020  ! 1791: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
	.word 0x859521ad  ! 1792: WRPR_TSTATE_I	wrpr	%r20, 0x01ad, %tstate
	.word 0xf40de0b1  ! 1797: LDUB_I	ldub	[%r23 + 0x00b1], %r26
	.word 0xfadd600c  ! 1798: LDXA_I	ldxa	[%r21, + 0x000c] %asi, %r29
	.word 0xf80dc000  ! 1799: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_139:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c8000  ! 1802: LDX_R	ldx	[%r18 + %r0], %r29
cpu_intr_2_140:
	setx	0x290112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44c000  ! 1806: LDSW_R	ldsw	[%r19 + %r0], %r31
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_141:
	setx	0x290239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894e111  ! 1813: LDUHA_I	lduha	[%r19, + 0x0111] %asi, %r28
	.word 0xfed5a14f  ! 1814: LDSHA_I	ldsha	[%r22, + 0x014f] %asi, %r31
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_62:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 1816: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf654a1cf  ! 1817: LDSH_I	ldsh	[%r18 + 0x01cf], %r27
	.word 0xf65d4000  ! 1819: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_rd_107:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_63:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 1822: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf00d4000  ! 1825: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf8154000  ! 1827: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xb40d8000  ! 1829: AND_R	and 	%r22, %r0, %r26
	.word 0xf2056190  ! 1830: LDUW_I	lduw	[%r21 + 0x0190], %r25
	.word 0xbe85201d  ! 1831: ADDcc_I	addcc 	%r20, 0x001d, %r31
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfa55603c  ! 1834: LDSH_I	ldsh	[%r21 + 0x003c], %r29
T2_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf88c4020  ! 1836: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	.word 0xf0d58020  ! 1839: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xbcb40000  ! 1844: ORNcc_R	orncc 	%r16, %r0, %r30
cpu_intr_2_142:
	setx	0x2c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c44020  ! 1853: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf4ccc020  ! 1854: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	.word 0xf004a067  ! 1858: LDUW_I	lduw	[%r18 + 0x0067], %r24
	.word 0xbb2d8000  ! 1859: SLL_R	sll 	%r22, %r0, %r29
T2_asi_reg_rd_109:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_143:
	setx	0x2e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, d)
	.word 0xfc858020  ! 1869: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_144:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe554000  ! 1876: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb6040000  ! 1877: ADD_R	add 	%r16, %r0, %r27
cpu_intr_2_145:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c20fd  ! 1882: LDUBA_I	lduba	[%r16, + 0x00fd] %asi, %r31
cpu_intr_2_146:
	setx	0x2f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 30)
	.word 0xb0b40000  ! 1890: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xf084610d  ! 1892: LDUWA_I	lduwa	[%r17, + 0x010d] %asi, %r24
	.word 0xb5641800  ! 1893: MOVcc_R	<illegal instruction>
	.word 0xfa84c020  ! 1894: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
	.word 0xf60d8000  ! 1895: LDUB_R	ldub	[%r22 + %r0], %r27
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_110:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 1)
	.word 0xf88d8020  ! 1903: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf8054000  ! 1908: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xb12dc000  ! 1911: SLL_R	sll 	%r23, %r0, %r24
T2_asi_reg_wr_64:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 1912: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_147:
	setx	0x2f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_148:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_112:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1917: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf4dd6074  ! 1918: LDXA_I	ldxa	[%r21, + 0x0074] %asi, %r26
cpu_intr_2_149:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4619d  ! 1920: LDSWA_I	ldswa	[%r17, + 0x019d] %asi, %r26
T2_asi_reg_rd_113:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_150:
	setx	0x2d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c4000  ! 1930: LDSB_R	ldsb	[%r17 + %r0], %r30
T2_asi_reg_rd_114:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 1932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf20c20da  ! 1933: LDUB_I	ldub	[%r16 + 0x00da], %r25
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 9)
	.word 0xf40ce0c9  ! 1935: LDUB_I	ldub	[%r19 + 0x00c9], %r26
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_65:
	mov	0xb, %r14
	.word 0xfcf38e80  ! 1937: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf815a122  ! 1938: LDUH_I	lduh	[%r22 + 0x0122], %r28
T2_asi_reg_rd_115:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 1940: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_66:
	mov	0x1e, %r14
	.word 0xf6f38e40  ! 1941: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_67:
	mov	0xc, %r14
	.word 0xf8f38400  ! 1943: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_151:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_152:
	setx	0x2d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_116:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 1953: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa858020  ! 1957: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	.word 0xb5520000  ! 1958: RDPR_PIL	<illegal instruction>
	.word 0xf2c42174  ! 1960: LDSWA_I	ldswa	[%r16, + 0x0174] %asi, %r25
T2_asi_reg_wr_68:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1961: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_69:
	mov	0x6, %r14
	.word 0xfaf38e60  ! 1962: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbf50c000  ! 1963: RDPR_TT	<illegal instruction>
	.word 0xbab561d4  ! 1966: SUBCcc_I	orncc 	%r21, 0x01d4, %r29
	.word 0xfad50020  ! 1967: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
	.word 0xfcc421c4  ! 1968: LDSWA_I	ldswa	[%r16, + 0x01c4] %asi, %r30
	.word 0xf2d5c020  ! 1969: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	.word 0xfacc2059  ! 1973: LDSBA_I	ldsba	[%r16, + 0x0059] %asi, %r29
	.word 0xf495c020  ! 1974: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xf8c4c020  ! 1975: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xf08d0020  ! 1976: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xf645e027  ! 1977: LDSW_I	ldsw	[%r23 + 0x0027], %r27
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 39)
	.word 0xb0b5c000  ! 1983: ORNcc_R	orncc 	%r23, %r0, %r24
	.word 0xb0a5c000  ! 1984: SUBcc_R	subcc 	%r23, %r0, %r24
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f42  ! 1987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
	.word 0xfc9560f0  ! 1989: LDUHA_I	lduha	[%r21, + 0x00f0] %asi, %r30
cpu_intr_2_154:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6c48020  ! 1999: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_70:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 2002: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfad4a1e5  ! 2004: LDSHA_I	ldsha	[%r18, + 0x01e5] %asi, %r29
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_155:
	setx	0x2d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf6554000  ! 2011: LDSH_R	ldsh	[%r21 + %r0], %r27
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfec48020  ! 2016: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, b)
	.word 0xf8c5217b  ! 2022: LDSWA_I	ldswa	[%r20, + 0x017b] %asi, %r28
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 22)
	.word 0xbf500000  ! 2025: RDPR_TPC	rdpr	%tpc, %r31
cpu_intr_2_156:
	setx	0x2c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8048000  ! 2028: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xfc446029  ! 2031: LDSW_I	ldsw	[%r17 + 0x0029], %r30
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, d)
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_71:
	mov	0x34, %r14
	.word 0xf4f38e60  ! 2046: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_157:
	setx	0x2d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495a147  ! 2049: LDUHA_I	lduha	[%r22, + 0x0147] %asi, %r26
cpu_intr_2_158:
	setx	0x2c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc4020  ! 2055: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_118:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf8d54020  ! 2058: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
	.word 0xf4140000  ! 2059: LDUH_R	lduh	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_159:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_72:
	mov	0xc, %r14
	.word 0xf4f389e0  ! 2074: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_119:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfadca1aa  ! 2076: LDXA_I	ldxa	[%r18, + 0x01aa] %asi, %r29
cpu_intr_2_160:
	setx	0x2c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_120:
	mov	0x36, %r14
	.word 0xf8db8400  ! 2081: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf0450000  ! 2082: LDSW_R	ldsw	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
cpu_intr_2_161:
	setx	0x2f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c8000  ! 2086: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xb8858000  ! 2092: ADDcc_R	addcc 	%r22, %r0, %r28
T2_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 2094: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_121:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe8461a5  ! 2098: LDUWA_I	lduwa	[%r17, + 0x01a5] %asi, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_122:
	mov	0x20, %r14
	.word 0xf0db84a0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf65ce00c  ! 2107: LDX_I	ldx	[%r19 + 0x000c], %r27
	.word 0xfa144000  ! 2109: LDUH_R	lduh	[%r17 + %r0], %r29
T2_asi_reg_rd_123:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 16)
	.word 0xf6dda12b  ! 2117: LDXA_I	ldxa	[%r22, + 0x012b] %asi, %r27
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 7)
	.word 0xf094c020  ! 2121: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfa15c000  ! 2128: LDUH_R	lduh	[%r23 + %r0], %r29
T2_asi_reg_rd_124:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa8560dd  ! 2134: LDUWA_I	lduwa	[%r21, + 0x00dd] %asi, %r29
T2_asi_reg_wr_74:
	mov	0xc, %r14
	.word 0xf6f38e60  ! 2138: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_162:
	setx	0x2e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd5a131  ! 2142: LDSHA_I	ldsha	[%r22, + 0x0131] %asi, %r30
	.word 0xb01c0000  ! 2143: XOR_R	xor 	%r16, %r0, %r24
T2_asi_reg_wr_75:
	mov	0xc, %r14
	.word 0xf8f38e80  ! 2145: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_163:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_164:
	setx	0x2c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0850020  ! 2149: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
T2_asi_reg_wr_76:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 2151: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1641800  ! 2154: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_125:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 2157: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_77:
	mov	0x1c, %r14
	.word 0xf0f38400  ! 2161: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_165:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_126:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1420e2  ! 2165: LDUH_I	lduh	[%r16 + 0x00e2], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_166:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_127:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_167:
	setx	0x2e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe8d4020  ! 2179: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_168:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe0dc000  ! 2183: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xfa5c0000  ! 2184: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf6558000  ! 2186: LDSH_R	ldsh	[%r22 + %r0], %r27
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_169:
	setx	0x2c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_78:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2195: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_128:
	mov	0xd, %r14
	.word 0xfedb84a0  ! 2196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5c6001  ! 2198: LDX_I	ldx	[%r17 + 0x0001], %r29
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_129:
	mov	0x15, %r14
	.word 0xfcdb8400  ! 2200: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_130:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_131:
	mov	0x27, %r14
	.word 0xfedb8e80  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf415a1b0  ! 2210: LDUH_I	lduh	[%r22 + 0x01b0], %r26
cpu_intr_2_170:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 7)
	.word 0xf454c000  ! 2218: LDSH_R	ldsh	[%r19 + %r0], %r26
T2_asi_reg_rd_132:
	mov	0x29, %r14
	.word 0xf0db8e80  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b5a  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xba358000  ! 2224: ORN_R	orn 	%r22, %r0, %r29
T2_asi_reg_wr_79:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 2226: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_171:
	setx	0x2e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2948020  ! 2233: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0cc0020  ! 2238: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xf8d5e0f3  ! 2241: LDSHA_I	ldsha	[%r23, + 0x00f3] %asi, %r28
	.word 0xfed5c020  ! 2248: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xf85c4000  ! 2253: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf68d4020  ! 2254: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
	.word 0xfc04e141  ! 2257: LDUW_I	lduw	[%r19 + 0x0141], %r30
T2_asi_reg_rd_133:
	mov	0x37, %r14
	.word 0xf4db84a0  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819838c8  ! 2261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c8, %hpstate
	.word 0xf0dca1d2  ! 2264: LDXA_I	ldxa	[%r18, + 0x01d2] %asi, %r24
T2_asi_reg_rd_134:
	mov	0x25, %r14
	.word 0xf0db8400  ! 2267: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf05d4000  ! 2268: LDX_R	ldx	[%r21 + %r0], %r24
cpu_intr_2_172:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dd2150  ! 2272: LDXA_I	ldxa	[%r20, + 0x0150] %asi, %r26
	.word 0xb6a5c000  ! 2273: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0xfec420c5  ! 2274: LDSWA_I	ldswa	[%r16, + 0x00c5] %asi, %r31
T2_asi_reg_wr_80:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 2275: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8cd4020  ! 2278: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xf61421d4  ! 2279: LDUH_I	lduh	[%r16 + 0x01d4], %r27
cpu_intr_2_173:
	setx	0x2f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_135:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 2282: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_136:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, e)
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb73cd000  ! 2295: SRAX_R	srax	%r19, %r0, %r27
cpu_intr_2_174:
	setx	0x310330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04616c  ! 2300: LDUW_I	lduw	[%r17 + 0x016c], %r29
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_81:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 2302: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_175:
	setx	0x30002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_176:
	setx	0x300117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc8000  ! 2306: XNORcc_R	xnorcc 	%r18, %r0, %r28
	.word 0xfa558000  ! 2307: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xfa440000  ! 2308: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf04ce08c  ! 2311: LDSB_I	ldsb	[%r19 + 0x008c], %r24
cpu_intr_2_177:
	setx	0x310238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_178:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_179:
	setx	0x32023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x33, %r14
	.word 0xfedb89e0  ! 2317: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb02c2108  ! 2319: ANDN_I	andn 	%r16, 0x0108, %r24
T2_asi_reg_rd_138:
	mov	0x6, %r14
	.word 0xf0db84a0  ! 2320: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 20)
	.word 0xb035e195  ! 2326: ORN_I	orn 	%r23, 0x0195, %r24
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 23)
	.word 0xbc1da0e0  ! 2331: XOR_I	xor 	%r22, 0x00e0, %r30
cpu_intr_2_180:
	setx	0x30001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_181:
	setx	0x33000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_82:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 2338: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, b)
	.word 0xf2cca16a  ! 2340: LDSBA_I	ldsba	[%r18, + 0x016a] %asi, %r25
	.word 0xfc154000  ! 2341: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xbe1ca119  ! 2343: XOR_I	xor 	%r18, 0x0119, %r31
	.word 0xf4048000  ! 2345: LDUW_R	lduw	[%r18 + %r0], %r26
T2_asi_reg_wr_83:
	mov	0x4, %r14
	.word 0xfef38e80  ! 2346: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfcc48020  ! 2347: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2348: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe048000  ! 2350: LDUW_R	lduw	[%r18 + %r0], %r31
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf05ce100  ! 2356: LDX_I	ldx	[%r19 + 0x0100], %r24
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_140:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfec48020  ! 2365: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
cpu_intr_2_182:
	setx	0x310026, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_141:
	mov	0x23, %r14
	.word 0xf6db8e60  ! 2369: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf885a13a  ! 2374: LDUWA_I	lduwa	[%r22, + 0x013a] %asi, %r28
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_183:
	setx	0x31013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6150000  ! 2382: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xb81521c4  ! 2383: OR_I	or 	%r20, 0x01c4, %r28
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d92  ! 2385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d92, %hpstate
	.word 0xbc9c4000  ! 2388: XORcc_R	xorcc 	%r17, %r0, %r30
	.word 0xf6946191  ! 2389: LDUHA_I	lduha	[%r17, + 0x0191] %asi, %r27
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 13)
	.word 0xf2d520d0  ! 2394: LDSHA_I	ldsha	[%r20, + 0x00d0] %asi, %r25
T2_asi_reg_rd_142:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbb641800  ! 2396: MOVcc_R	<illegal instruction>
	.word 0xbeb5c000  ! 2398: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0xfe5c0000  ! 2399: LDX_R	ldx	[%r16 + %r0], %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfa4d8000  ! 2407: LDSB_R	ldsb	[%r22 + %r0], %r29
cpu_intr_2_184:
	setx	0x310329, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_185:
	setx	0x30030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63ce012  ! 2414: XNOR_I	xnor 	%r19, 0x0012, %r27
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_186:
	setx	0x32032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_187:
	setx	0x320128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_143:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_85:
	mov	0x4, %r14
	.word 0xfef38e40  ! 2428: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb20461b6  ! 2432: ADD_I	add 	%r17, 0x01b6, %r25
T2_asi_reg_rd_144:
	mov	0xc, %r14
	.word 0xf8db84a0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe05a0fd  ! 2438: LDUW_I	lduw	[%r22 + 0x00fd], %r31
	.word 0xfccc2131  ! 2439: LDSBA_I	ldsba	[%r16, + 0x0131] %asi, %r30
	.word 0xfe5dc000  ! 2440: LDX_R	ldx	[%r23 + %r0], %r31
T2_asi_reg_wr_86:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 2442: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc84e094  ! 2444: LDUWA_I	lduwa	[%r19, + 0x0094] %asi, %r30
cpu_intr_2_188:
	setx	0x320011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05c000  ! 2446: LDUW_R	lduw	[%r23 + %r0], %r31
T2_asi_reg_rd_145:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 2447: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_rd_146:
	mov	0x38, %r14
	.word 0xf8db8400  ! 2448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_87:
	mov	0x1a, %r14
	.word 0xfcf389e0  ! 2450: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf84d21c0  ! 2451: LDSB_I	ldsb	[%r20 + 0x01c0], %r28
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, c)
	.word 0xfadca0fc  ! 2453: LDXA_I	ldxa	[%r18, + 0x00fc] %asi, %r29
T2_asi_reg_rd_147:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 2455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc940020  ! 2457: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
cpu_intr_2_189:
	setx	0x320121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d4000  ! 2460: LDSB_R	ldsb	[%r21 + %r0], %r30
T2_asi_reg_wr_88:
	mov	0x8, %r14
	.word 0xf4f38400  ! 2462: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf80461e0  ! 2464: LDUW_I	lduw	[%r17 + 0x01e0], %r28
	.word 0xb6048000  ! 2465: ADD_R	add 	%r18, %r0, %r27
	.word 0xb6050000  ! 2470: ADD_R	add 	%r20, %r0, %r27
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0dde080  ! 2472: LDXA_I	ldxa	[%r23, + 0x0080] %asi, %r24
T2_asi_reg_rd_148:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf25dc000  ! 2482: LDX_R	ldx	[%r23 + %r0], %r25
T2_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 2483: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 2484: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc4dc000  ! 2485: LDSB_R	ldsb	[%r23 + %r0], %r30
cpu_intr_2_190:
	setx	0x30013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc1c4000  ! 2489: XOR_R	xor 	%r17, %r0, %r30
	.word 0xf6cc4020  ! 2490: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, f)
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1b)
	ta	T_CHANGE_TO_TL0
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 26)
	.word 0xfe4461a0  ! 2501: LDSW_I	ldsw	[%r17 + 0x01a0], %r31
	.word 0xf24c6089  ! 2502: LDSB_I	ldsb	[%r17 + 0x0089], %r25
	.word 0xfe5c2133  ! 2503: LDX_I	ldx	[%r16 + 0x0133], %r31
	.word 0xfa8560c7  ! 2505: LDUWA_I	lduwa	[%r21, + 0x00c7] %asi, %r29
	.word 0xf00da1a8  ! 2506: LDUB_I	ldub	[%r22 + 0x01a8], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf6d4e1fe  ! 2508: LDSHA_I	ldsha	[%r19, + 0x01fe] %asi, %r27
	.word 0xf8dde1fd  ! 2511: LDXA_I	ldxa	[%r23, + 0x01fd] %asi, %r28
	.word 0xf2848020  ! 2513: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xf2d560f4  ! 2516: LDSHA_I	ldsha	[%r21, + 0x00f4] %asi, %r25
T2_asi_reg_wr_91:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 2518: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa054000  ! 2521: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_rd_149:
	mov	0x20, %r14
	.word 0xf4db8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc550000  ! 2531: LDSH_R	ldsh	[%r20 + %r0], %r30
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_150:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_92:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 2535: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2538: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf2c6001  ! 2542: SLL_I	sll 	%r17, 0x0001, %r31
cpu_intr_2_191:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_151:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_152:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_94:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 2554: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_192:
	setx	0x31033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d2098  ! 2559: AND_I	and 	%r20, 0x0098, %r30
	.word 0xf45c6075  ! 2560: LDX_I	ldx	[%r17 + 0x0075], %r26
T2_asi_reg_wr_95:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 2561: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2562: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf20c4000  ! 2567: LDUB_R	ldub	[%r17 + %r0], %r25
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_154:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb0c58000  ! 2573: ADDCcc_R	addccc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 27)
	.word 0xf28dc020  ! 2580: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb62d20f5  ! 2586: ANDN_I	andn 	%r20, 0x00f5, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_96:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 2594: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf08d8020  ! 2597: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
	.word 0xf8540000  ! 2600: LDSH_R	ldsh	[%r16 + %r0], %r28
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe442189  ! 2603: LDSW_I	ldsw	[%r16 + 0x0189], %r31
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, d)
	.word 0xb4c4a118  ! 2607: ADDCcc_I	addccc 	%r18, 0x0118, %r26
cpu_intr_2_193:
	setx	0x300138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cca0c4  ! 2614: LDSBA_I	ldsba	[%r18, + 0x00c4] %asi, %r27
cpu_intr_2_194:
	setx	0x31000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d8000  ! 2617: LDUB_R	ldub	[%r22 + %r0], %r28
cpu_intr_2_195:
	setx	0x330200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_196:
	setx	0x300126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 2622: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xfcd5a145  ! 2628: LDSHA_I	ldsha	[%r22, + 0x0145] %asi, %r30
cpu_intr_2_197:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0952037  ! 2635: LDUHA_I	lduha	[%r20, + 0x0037] %asi, %r24
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa8c6166  ! 2640: LDUBA_I	lduba	[%r17, + 0x0166] %asi, %r29
	.word 0xfa54c000  ! 2642: LDSH_R	ldsh	[%r19 + %r0], %r29
cpu_intr_2_199:
	setx	0x32012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d1000  ! 2647: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xf6146196  ! 2650: LDUH_I	lduh	[%r17 + 0x0196], %r27
cpu_intr_2_200:
	setx	0x320004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf2942137  ! 2656: LDUHA_I	lduha	[%r16, + 0x0137] %asi, %r25
T2_asi_reg_rd_156:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_97:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2658: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_201:
	setx	0x330101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x30003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0858020  ! 2667: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_157:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_158:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xba45616e  ! 2673: ADDC_I	addc 	%r21, 0x016e, %r29
	.word 0xb4c54000  ! 2674: ADDCcc_R	addccc 	%r21, %r0, %r26
T2_asi_reg_rd_159:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 2676: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfcc52010  ! 2679: LDSWA_I	ldswa	[%r20, + 0x0010] %asi, %r30
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6950020  ! 2682: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
	.word 0xf68cc020  ! 2686: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xf8c40020  ! 2687: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
cpu_intr_2_203:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec48020  ! 2690: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0xf24da06a  ! 2692: LDSB_I	ldsb	[%r22 + 0x006a], %r25
T2_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfa44c000  ! 2697: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xbe240000  ! 2698: SUB_R	sub 	%r16, %r0, %r31
	.word 0xb0954000  ! 2700: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xfe4c0000  ! 2701: LDSB_R	ldsb	[%r16 + %r0], %r31
cpu_intr_2_204:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_205:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_98:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2710: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 21)
	.word 0xf88c6127  ! 2718: LDUBA_I	lduba	[%r17, + 0x0127] %asi, %r28
	.word 0xf2444000  ! 2721: LDSW_R	ldsw	[%r17 + %r0], %r25
T2_asi_reg_wr_99:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 2722: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb0348000  ! 2724: SUBC_R	orn 	%r18, %r0, %r24
cpu_intr_2_206:
	setx	0x300221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60cc000  ! 2727: LDUB_R	ldub	[%r19 + %r0], %r27
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 38)
	.word 0xbc3521d9  ! 2729: ORN_I	orn 	%r20, 0x01d9, %r30
cpu_intr_2_207:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14206b  ! 2734: LDUH_I	lduh	[%r16 + 0x006b], %r31
	.word 0xf28ce1c3  ! 2736: LDUBA_I	lduba	[%r19, + 0x01c3] %asi, %r25
	.word 0xb8c461eb  ! 2737: ADDCcc_I	addccc 	%r17, 0x01eb, %r28
	.word 0xf094a005  ! 2739: LDUHA_I	lduha	[%r18, + 0x0005] %asi, %r24
T2_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_208:
	setx	0x350237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_162:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_209:
	setx	0x35012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334b001  ! 2747: SRLX_I	srlx	%r18, 0x0001, %r25
T2_asi_reg_wr_100:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 2751: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_101:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 2752: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982810  ! 2753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_210:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c20d2  ! 2757: LDUB_I	ldub	[%r16 + 0x00d2], %r27
T2_asi_reg_wr_102:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 2758: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf005c000  ! 2759: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf0c50020  ! 2760: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	.word 0xf895e079  ! 2761: LDUHA_I	lduha	[%r23, + 0x0079] %asi, %r28
cpu_intr_2_211:
	setx	0x370006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d20b0  ! 2764: XNOR_I	xnor 	%r20, 0x00b0, %r26
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_163:
	mov	0xe, %r14
	.word 0xf4db84a0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4cc8020  ! 2767: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
cpu_intr_2_212:
	setx	0x340100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, c)
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_213:
	setx	0x360316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dc609f  ! 2773: LDXA_I	ldxa	[%r17, + 0x009f] %asi, %r26
	.word 0xb6c58000  ! 2774: ADDCcc_R	addccc 	%r22, %r0, %r27
cpu_intr_2_214:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_215:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004c000  ! 2786: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf28cc020  ! 2789: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
cpu_intr_2_216:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_217:
	setx	0x350208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bc21d6  ! 2802: XNORcc_I	xnorcc 	%r16, 0x01d6, %r26
T2_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2803: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_104:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 2804: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	.word 0xb28d20e5  ! 2811: ANDcc_I	andcc 	%r20, 0x00e5, %r25
cpu_intr_2_218:
	setx	0x340128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa148000  ! 2816: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xba8dc000  ! 2818: ANDcc_R	andcc 	%r23, %r0, %r29
	.word 0xb8ad6051  ! 2819: ANDNcc_I	andncc 	%r21, 0x0051, %r28
cpu_intr_2_219:
	setx	0x37032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_220:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_105:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 2834: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_106:
	mov	0x2f, %r14
	.word 0xfef38400  ! 2841: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_107:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 2843: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8d40020  ! 2844: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
T2_asi_reg_rd_165:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfc158000  ! 2848: LDUH_R	lduh	[%r22 + %r0], %r30
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf205e03f  ! 2851: LDUW_I	lduw	[%r23 + 0x003f], %r25
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_108:
	mov	0x2, %r14
	.word 0xf4f38400  ! 2855: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 3f)
	.word 0xbc35c000  ! 2857: ORN_R	orn 	%r23, %r0, %r30
cpu_intr_2_221:
	setx	0x350307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_109:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 2861: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_222:
	setx	0x37020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d0000  ! 2864: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xf205605a  ! 2865: LDUW_I	lduw	[%r21 + 0x005a], %r25
cpu_intr_2_223:
	setx	0x37010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d50020  ! 2869: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
	.word 0xb1480000  ! 2875: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf615a181  ! 2877: LDUH_I	lduh	[%r22 + 0x0181], %r27
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_110:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 2880: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf615e1fd  ! 2885: LDUH_I	lduh	[%r23 + 0x01fd], %r27
cpu_intr_2_224:
	setx	0x360030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04520fd  ! 2891: LDSW_I	ldsw	[%r20 + 0x00fd], %r24
cpu_intr_2_225:
	setx	0x370137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdc6157  ! 2893: LDXA_I	ldxa	[%r17, + 0x0157] %asi, %r30
	.word 0xfcd48020  ! 2896: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf8d421b7  ! 2900: LDSHA_I	ldsha	[%r16, + 0x01b7] %asi, %r28
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_111:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 2902: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe550000  ! 2906: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf2058000  ! 2910: LDUW_R	lduw	[%r22 + %r0], %r25
T2_asi_reg_wr_112:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 2911: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_TO_TL1
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, d)
	.word 0xbb2d3001  ! 2920: SLLX_I	sllx	%r20, 0x0001, %r29
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_113:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2922: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb8048000  ! 2925: ADD_R	add 	%r18, %r0, %r28
	.word 0xf494a07b  ! 2926: LDUHA_I	lduha	[%r18, + 0x007b] %asi, %r26
T2_asi_reg_rd_166:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 2928: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf00cc000  ! 2933: LDUB_R	ldub	[%r19 + %r0], %r24
T2_asi_reg_wr_114:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2934: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf08c0020  ! 2940: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_226:
	setx	0x34020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc61a5  ! 2947: LDSBA_I	ldsba	[%r17, + 0x01a5] %asi, %r29
	.word 0xf4048000  ! 2952: LDUW_R	lduw	[%r18 + %r0], %r26
cpu_intr_2_227:
	setx	0x350239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_228:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_230:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedc6102  ! 2964: LDXA_I	ldxa	[%r17, + 0x0102] %asi, %r31
	.word 0xbc2c8000  ! 2966: ANDN_R	andn 	%r18, %r0, %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_167:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 2971: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_231:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28de032  ! 2973: LDUBA_I	lduba	[%r23, + 0x0032] %asi, %r25
T2_asi_reg_rd_168:
	mov	0xd, %r14
	.word 0xf2db89e0  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa5d8000  ! 2976: LDX_R	ldx	[%r22 + %r0], %r29
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 26)
	.word 0xf00cc000  ! 2979: LDUB_R	ldub	[%r19 + %r0], %r24
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 13)
	.word 0xfc4c4000  ! 2984: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xfa14e073  ! 2985: LDUH_I	lduh	[%r19 + 0x0073], %r29
T2_asi_reg_wr_115:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 2987: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_169:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf6150000  ! 2994: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982bd0  ! 2996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
T2_asi_reg_wr_116:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 2998: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_117:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 2999: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_118:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 3001: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbf34e001  ! 3002: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xfc05213b  ! 3003: LDUW_I	lduw	[%r20 + 0x013b], %r30
	.word 0xfed44020  ! 3007: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
cpu_intr_2_232:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c6063  ! 3013: ANDN_I	andn 	%r17, 0x0063, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_233:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cd000  ! 3020: SLLX_R	sllx	%r19, %r0, %r28
cpu_intr_2_234:
	setx	0x350301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_170:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 3026: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_171:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe4d0000  ! 3028: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf295a13c  ! 3029: LDUHA_I	lduha	[%r22, + 0x013c] %asi, %r25
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 24)
	.word 0xf215c000  ! 3032: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf0c48020  ! 3034: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	.word 0xf24c2028  ! 3038: LDSB_I	ldsb	[%r16 + 0x0028], %r25
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_235:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_172:
	mov	0x23, %r14
	.word 0xf6db8400  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_173:
	mov	0x1e, %r14
	.word 0xf2db84a0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0x8d95a1cf  ! 3047: WRPR_PSTATE_I	wrpr	%r22, 0x01cf, %pstate
T2_asi_reg_rd_174:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb4b5e112  ! 3049: SUBCcc_I	orncc 	%r23, 0x0112, %r26
T2_asi_reg_rd_175:
	mov	0x35, %r14
	.word 0xfedb8400  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf084c020  ! 3058: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xf40ce023  ! 3061: LDUB_I	ldub	[%r19 + 0x0023], %r26
cpu_intr_2_236:
	setx	0x350015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 3064: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_237:
	setx	0x37003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294e0e5  ! 3066: LDUHA_I	lduha	[%r19, + 0x00e5] %asi, %r25
T2_asi_reg_rd_176:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 3068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8cd61f6  ! 3070: LDSBA_I	ldsba	[%r21, + 0x01f6] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc94e1b7  ! 3076: LDUHA_I	lduha	[%r19, + 0x01b7] %asi, %r30
cpu_intr_2_238:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_177:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3081: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, b)
	.word 0xfad4a1b6  ! 3083: LDSHA_I	ldsha	[%r18, + 0x01b6] %asi, %r29
	.word 0xf6952153  ! 3084: LDUHA_I	lduha	[%r20, + 0x0153] %asi, %r27
T2_asi_reg_rd_178:
	mov	0x2e, %r14
	.word 0xf8db84a0  ! 3087: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfcd54020  ! 3090: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_119:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3093: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbc0d0000  ! 3095: AND_R	and 	%r20, %r0, %r30
	.word 0xf88ca1be  ! 3097: LDUBA_I	lduba	[%r18, + 0x01be] %asi, %r28
T2_asi_reg_rd_179:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf28c20b9  ! 3099: LDUBA_I	lduba	[%r16, + 0x00b9] %asi, %r25
	.word 0xf6cca0e3  ! 3100: LDSBA_I	ldsba	[%r18, + 0x00e3] %asi, %r27
	.word 0xf295c020  ! 3102: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_180:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6056158  ! 3104: LDUW_I	lduw	[%r21 + 0x0158], %r27
	.word 0xfa4da00a  ! 3105: LDSB_I	ldsb	[%r22 + 0x000a], %r29
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe45c000  ! 3108: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf485c020  ! 3111: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
	.word 0xb2bdc000  ! 3112: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xf0558000  ! 3114: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfc846098  ! 3116: LDUWA_I	lduwa	[%r17, + 0x0098] %asi, %r30
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 26)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f82  ! 3122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
cpu_intr_2_239:
	setx	0x370202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3125: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_2_240:
	setx	0x37013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_241:
	setx	0x370223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 3131: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf6c40020  ! 3132: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
T2_asi_reg_wr_121:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 3134: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 39)
	.word 0xba140000  ! 3143: OR_R	or 	%r16, %r0, %r29
	.word 0xf6454000  ! 3144: LDSW_R	ldsw	[%r21 + %r0], %r27
T2_asi_reg_rd_181:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc8ca095  ! 3151: LDUBA_I	lduba	[%r18, + 0x0095] %asi, %r30
T2_asi_reg_wr_122:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 3152: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_242:
	setx	0x340338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x360028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_244:
	setx	0x34020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8520dc  ! 3161: LDUWA_I	lduwa	[%r20, + 0x00dc] %asi, %r29
	.word 0xb88c4000  ! 3163: ANDcc_R	andcc 	%r17, %r0, %r28
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf8cde0ff  ! 3167: LDSBA_I	ldsba	[%r23, + 0x00ff] %asi, %r28
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982dc0  ! 3169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	.word 0xf04cc000  ! 3171: LDSB_R	ldsb	[%r19 + %r0], %r24
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_245:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_246:
	setx	0x35011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_123:
	mov	0x36, %r14
	.word 0xfef38400  ! 3177: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_124:
	mov	0x34, %r14
	.word 0xfef38400  ! 3178: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_247:
	setx	0x370205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04a033  ! 3182: LDUW_I	lduw	[%r18 + 0x0033], %r31
cpu_intr_2_248:
	setx	0x10028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80de18b  ! 3186: AND_I	and 	%r23, 0x018b, %r28
	.word 0xf0840020  ! 3190: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
	.word 0xfa958020  ! 3191: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_125:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 3193: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8c5216d  ! 3195: LDSWA_I	ldswa	[%r20, + 0x016d] %asi, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 16)
	.word 0xf2042082  ! 3204: LDUW_I	lduw	[%r16 + 0x0082], %r25
	.word 0xfc4c8000  ! 3205: LDSB_R	ldsb	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf885614b  ! 3207: LDUWA_I	lduwa	[%r21, + 0x014b] %asi, %r28
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_126:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 3211: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf68de14d  ! 3213: LDUBA_I	lduba	[%r23, + 0x014d] %asi, %r27
	.word 0xf05d0000  ! 3214: LDX_R	ldx	[%r20 + %r0], %r24
cpu_intr_2_249:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_250:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 3220: RDPR_TNPC	<illegal instruction>
	.word 0xfa0cc000  ! 3222: LDUB_R	ldub	[%r19 + %r0], %r29
cpu_intr_2_251:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe456160  ! 3225: LDSW_I	ldsw	[%r21 + 0x0160], %r31
cpu_intr_2_252:
	setx	0x3a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_127:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 3231: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb434e1c6  ! 3232: SUBC_I	orn 	%r19, 0x01c6, %r26
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_253:
	setx	0x3b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_128:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 3237: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf05c8000  ! 3238: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_254:
	setx	0x38021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe84e053  ! 3247: LDUWA_I	lduwa	[%r19, + 0x0053] %asi, %r31
	.word 0xfa0d61df  ! 3249: LDUB_I	ldub	[%r21 + 0x01df], %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_255:
	setx	0x3a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_129:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3259: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_256:
	setx	0x390210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_130:
	mov	0x23, %r14
	.word 0xfef38e60  ! 3263: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf0c4c020  ! 3268: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
	.word 0xf685a168  ! 3270: LDUWA_I	lduwa	[%r22, + 0x0168] %asi, %r27
	.word 0xf8d44020  ! 3272: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
cpu_intr_2_257:
	setx	0x3a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_131:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 3274: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf24cc000  ! 3276: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xfcd5e004  ! 3277: LDSHA_I	ldsha	[%r23, + 0x0004] %asi, %r30
cpu_intr_2_258:
	setx	0x390221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3280: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf285a141  ! 3281: LDUWA_I	lduwa	[%r22, + 0x0141] %asi, %r25
T2_asi_reg_rd_182:
	mov	0x18, %r14
	.word 0xfedb84a0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb80d8000  ! 3284: AND_R	and 	%r22, %r0, %r28
T2_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 3288: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_259:
	setx	0x3b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_134:
	mov	0x24, %r14
	.word 0xf8f38400  ! 3290: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b12  ! 3291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b12, %hpstate
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982fda  ! 3294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fda, %hpstate
	.word 0xfecd4020  ! 3296: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_135:
	mov	0x13, %r14
	.word 0xf4f384a0  ! 3298: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf81521a2  ! 3299: LDUH_I	lduh	[%r20 + 0x01a2], %r28
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_260:
	setx	0x3b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 3304: MOVcc_R	<illegal instruction>
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe452018  ! 3306: LDSW_I	ldsw	[%r20 + 0x0018], %r31
	.word 0xba45611a  ! 3308: ADDC_I	addc 	%r21, 0x011a, %r29
	.word 0xf28d604c  ! 3311: LDUBA_I	lduba	[%r21, + 0x004c] %asi, %r25
	.word 0xbf3d4000  ! 3312: SRA_R	sra 	%r21, %r0, %r31
	.word 0xf4140000  ! 3313: LDUH_R	lduh	[%r16 + %r0], %r26
T2_asi_reg_rd_183:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6c5a010  ! 3315: ADDCcc_I	addccc 	%r22, 0x0010, %r27
T2_asi_reg_wr_136:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 3317: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_261:
	setx	0x3b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01561a0  ! 3325: LDUH_I	lduh	[%r21 + 0x01a0], %r24
	.word 0xb815a04f  ! 3327: OR_I	or 	%r22, 0x004f, %r28
cpu_intr_2_262:
	setx	0x3b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 36)
	.word 0xf6448000  ! 3332: LDSW_R	ldsw	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_263:
	setx	0x3b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 3337: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_184:
	mov	0x2c, %r14
	.word 0xfadb8e80  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_185:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 3349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_138:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 3352: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6550000  ! 3358: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf2056183  ! 3359: LDUW_I	lduw	[%r21 + 0x0183], %r25
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, b)
	.word 0xfe4da15e  ! 3361: LDSB_I	ldsb	[%r22 + 0x015e], %r31
T2_asi_reg_wr_139:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 3362: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc4d8000  ! 3363: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xf615a1f3  ! 3364: LDUH_I	lduh	[%r22 + 0x01f3], %r27
	.word 0xfa8d8020  ! 3367: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
cpu_intr_2_264:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_265:
	setx	0x3b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054c000  ! 3372: LDSH_R	ldsh	[%r19 + %r0], %r24
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d88  ! 3381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf0c5e07f  ! 3384: LDSWA_I	ldswa	[%r23, + 0x007f] %asi, %r24
	.word 0xf884a137  ! 3386: LDUWA_I	lduwa	[%r18, + 0x0137] %asi, %r28
	.word 0xfc5dc000  ! 3387: LDX_R	ldx	[%r23 + %r0], %r30
T2_asi_reg_rd_186:
	mov	0x17, %r14
	.word 0xfcdb84a0  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf415a020  ! 3391: LDUH_I	lduh	[%r22 + 0x0020], %r26
	.word 0xb13c8000  ! 3392: SRA_R	sra 	%r18, %r0, %r24
	.word 0xf694c020  ! 3398: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c0a  ! 3400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0a, %hpstate
	.word 0xfa05e0c5  ! 3407: LDUW_I	lduw	[%r23 + 0x00c5], %r29
T2_asi_reg_rd_187:
	mov	0x7, %r14
	.word 0xf4db8e80  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 37)
	.word 0xfc55c000  ! 3414: LDSH_R	ldsh	[%r23 + %r0], %r30
T2_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xf8f38e40  ! 3415: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb88d2051  ! 3416: ANDcc_I	andcc 	%r20, 0x0051, %r28
	.word 0xf60d8000  ! 3417: LDUB_R	ldub	[%r22 + %r0], %r27
T2_asi_reg_rd_188:
	mov	0x2c, %r14
	.word 0xfcdb8400  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2dc2009  ! 3420: LDXA_I	ldxa	[%r16, + 0x0009] %asi, %r25
	.word 0xfcc521cf  ! 3422: LDSWA_I	ldswa	[%r20, + 0x01cf] %asi, %r30
	.word 0xba44e02c  ! 3423: ADDC_I	addc 	%r19, 0x002c, %r29
	.word 0xf2cd8020  ! 3426: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	.word 0xfe8d61e2  ! 3427: LDUBA_I	lduba	[%r21, + 0x01e2] %asi, %r31
	.word 0xf404c000  ! 3428: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfec40020  ! 3430: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
cpu_intr_2_266:
	setx	0x3a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d0020  ! 3433: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
T2_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 3434: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_189:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb8c5c000  ! 3440: ADDCcc_R	addccc 	%r23, %r0, %r28
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_142:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfecc20ca  ! 3446: LDSBA_I	ldsba	[%r16, + 0x00ca] %asi, %r31
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 9)
	.word 0xfc4c8000  ! 3448: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf0c561f7  ! 3449: LDSWA_I	ldswa	[%r21, + 0x01f7] %asi, %r24
T2_asi_reg_wr_143:
	mov	0x0, %r14
	.word 0xfcf38400  ! 3452: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 12)
	.word 0xf45d6114  ! 3454: LDX_I	ldx	[%r21 + 0x0114], %r26
	.word 0xfed54020  ! 3457: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_190:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_191:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3465: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb4bd61cb  ! 3467: XNORcc_I	xnorcc 	%r21, 0x01cb, %r26
	.word 0xfe04c000  ! 3468: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xfec521d1  ! 3473: LDSWA_I	ldswa	[%r20, + 0x01d1] %asi, %r31
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 10)
	.word 0xb834214a  ! 3478: SUBC_I	orn 	%r16, 0x014a, %r28
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e48  ! 3479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e48, %hpstate
T2_asi_reg_rd_192:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf24c4000  ! 3487: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfac44020  ! 3491: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xf2452121  ! 3494: LDSW_I	ldsw	[%r20 + 0x0121], %r25
	.word 0xfc4cc000  ! 3497: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xb7500000  ! 3498: RDPR_TPC	rdpr	%tpc, %r27
T2_asi_reg_rd_193:
	mov	0x24, %r14
	.word 0xf0db8400  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf6dc20af  ! 3501: LDXA_I	ldxa	[%r16, + 0x00af] %asi, %r27
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_194:
	mov	0x14, %r14
	.word 0xf0db8e60  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf68da06f  ! 3508: LDUBA_I	lduba	[%r22, + 0x006f] %asi, %r27
cpu_intr_2_267:
	setx	0x380035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_144:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 3512: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_268:
	setx	0x3b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4846104  ! 3522: ADDcc_I	addcc 	%r17, 0x0104, %r26
T2_asi_reg_rd_196:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 3524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfccc0020  ! 3527: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xfe4d0000  ! 3529: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf08d8020  ! 3530: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 33)
	.word 0xf2042049  ! 3540: LDUW_I	lduw	[%r16 + 0x0049], %r25
cpu_intr_2_269:
	setx	0x3b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a1fc  ! 3543: WRPR_TSTATE_I	wrpr	%r22, 0x01fc, %tstate
T2_asi_reg_rd_197:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 3544: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_270:
	setx	0x3b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf41521bc  ! 3549: LDUH_I	lduh	[%r20 + 0x01bc], %r26
cpu_intr_2_271:
	setx	0x38011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa85c020  ! 3556: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 36)
	.word 0xbe8ca00a  ! 3559: ANDcc_I	andcc 	%r18, 0x000a, %r31
	.word 0xbaa42020  ! 3561: SUBcc_I	subcc 	%r16, 0x0020, %r29
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c48  ! 3563: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfacd4020  ! 3571: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
cpu_intr_2_272:
	setx	0x3a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ec2  ! 3577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec2, %hpstate
	.word 0xf24ca1e7  ! 3578: LDSB_I	ldsb	[%r18 + 0x01e7], %r25
	.word 0xba144000  ! 3581: OR_R	or 	%r17, %r0, %r29
T2_asi_reg_rd_199:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa446076  ! 3583: LDSW_I	ldsw	[%r17 + 0x0076], %r29
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_145:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3589: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbe35c000  ! 3590: ORN_R	orn 	%r23, %r0, %r31
T2_asi_reg_rd_200:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 3594: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbe9dc000  ! 3595: XORcc_R	xorcc 	%r23, %r0, %r31
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_273:
	setx	0x39030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd8020  ! 3602: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_146:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 3605: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe04c000  ! 3606: LDUW_R	lduw	[%r19 + %r0], %r31
T2_asi_reg_wr_147:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 3607: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0x8f902000  ! 3608: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb73c5000  ! 3611: SRAX_R	srax	%r17, %r0, %r27
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 20)
	.word 0xfcc4200a  ! 3616: LDSWA_I	ldswa	[%r16, + 0x000a] %asi, %r30
	.word 0xbf2d7001  ! 3617: SLLX_I	sllx	%r21, 0x0001, %r31
T2_asi_reg_rd_201:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb4058000  ! 3619: ADD_R	add 	%r22, %r0, %r26
cpu_intr_2_274:
	setx	0x380112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x38011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 3630: SRLX_R	srlx	%r16, %r0, %r26
cpu_intr_2_276:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb624a0b1  ! 3633: SUB_I	sub 	%r18, 0x00b1, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_202:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_148:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 3642: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_277:
	setx	0x3e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe046199  ! 3644: ADD_I	add 	%r17, 0x0199, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 6)
	.word 0xfe94e1a8  ! 3653: LDUHA_I	lduha	[%r19, + 0x01a8] %asi, %r31
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_HPRIV
	.word 0xb845610c  ! 3662: ADDC_I	addc 	%r21, 0x010c, %r28
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 16)
	.word 0xf88ce0a0  ! 3665: LDUBA_I	lduba	[%r19, + 0x00a0] %asi, %r28
cpu_intr_2_278:
	setx	0x3c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf89561dd  ! 3676: LDUHA_I	lduha	[%r21, + 0x01dd] %asi, %r28
	.word 0xfccc0020  ! 3677: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xf60d21cf  ! 3678: LDUB_I	ldub	[%r20 + 0x01cf], %r27
T2_asi_reg_rd_203:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 3679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_279:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_280:
	setx	0x3c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ac6068  ! 3690: ANDNcc_I	andncc 	%r17, 0x0068, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_204:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_149:
	mov	0x1c, %r14
	.word 0xf2f38e40  ! 3693: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8c4c020  ! 3695: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_150:
	mov	0x28, %r14
	.word 0xf6f38e60  ! 3701: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_205:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 3704: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, e)
	.word 0xf00c4000  ! 3706: LDUB_R	ldub	[%r17 + %r0], %r24
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_151:
	mov	0x13, %r14
	.word 0xf8f38e80  ! 3715: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf65560f4  ! 3719: LDSH_I	ldsh	[%r21 + 0x00f4], %r27
T2_asi_reg_rd_206:
	mov	0x7, %r14
	.word 0xf4db8e60  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfc85202d  ! 3723: LDUWA_I	lduwa	[%r20, + 0x002d] %asi, %r30
	.word 0xfa0d0000  ! 3724: LDUB_R	ldub	[%r20 + %r0], %r29
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2154000  ! 3727: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_rd_207:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_281:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1461f1  ! 3735: LDUH_I	lduh	[%r17 + 0x01f1], %r31
	.word 0xf6c58020  ! 3737: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
T2_asi_reg_rd_208:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 3739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe548000  ! 3740: LDSH_R	ldsh	[%r18 + %r0], %r31
T2_asi_reg_rd_209:
	mov	0x2e, %r14
	.word 0xf4db89e0  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_210:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_211:
	mov	0xc, %r14
	.word 0xfadb84a0  ! 3745: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 39)
	.word 0xfc5d4000  ! 3750: LDX_R	ldx	[%r21 + %r0], %r30
cpu_intr_2_282:
	setx	0x3c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf2c46091  ! 3756: LDSWA_I	ldswa	[%r17, + 0x0091] %asi, %r25
cpu_intr_2_283:
	setx	0x3f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d4000  ! 3764: XNOR_R	xnor 	%r21, %r0, %r25
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, b)
	.word 0xb534b001  ! 3768: SRLX_I	srlx	%r18, 0x0001, %r26
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf2858020  ! 3776: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xfe150000  ! 3777: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf60da013  ! 3778: LDUB_I	ldub	[%r22 + 0x0013], %r27
	.word 0xfe5ce11f  ! 3779: LDX_I	ldx	[%r19 + 0x011f], %r31
	.word 0xbb3c0000  ! 3781: SRA_R	sra 	%r16, %r0, %r29
cpu_intr_2_284:
	setx	0x3d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9344000  ! 3786: SRL_R	srl 	%r17, %r0, %r28
T2_asi_reg_rd_212:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_285:
	setx	0x3e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 3793: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xfa05a1fc  ! 3803: LDUW_I	lduw	[%r22 + 0x01fc], %r29
	.word 0xf8c5a191  ! 3804: LDSWA_I	ldswa	[%r22, + 0x0191] %asi, %r28
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a80  ! 3806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
	.word 0xb751c000  ! 3808: RDPR_TL	<illegal instruction>
	.word 0xf44d0000  ! 3812: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xbd2d4000  ! 3813: SLL_R	sll 	%r21, %r0, %r30
	.word 0xfe04c000  ! 3816: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xfad521a6  ! 3817: LDSHA_I	ldsha	[%r20, + 0x01a6] %asi, %r29
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_153:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 3824: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_154:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 3827: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_213:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 30)
	.word 0xbf7da401  ! 3838: MOVR_I	movre	%r22, 0x1, %r31
cpu_intr_2_286:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_TO_TL0
	.word 0xb49d0000  ! 3849: XORcc_R	xorcc 	%r20, %r0, %r26
T2_asi_reg_rd_214:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8150000  ! 3852: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xbe94a0f2  ! 3853: ORcc_I	orcc 	%r18, 0x00f2, %r31
	.word 0xfccda0c8  ! 3858: LDSBA_I	ldsba	[%r22, + 0x00c8] %asi, %r30
	.word 0xfe55e0d0  ! 3859: LDSH_I	ldsh	[%r23 + 0x00d0], %r31
	.word 0xf85de0bf  ! 3860: LDX_I	ldx	[%r23 + 0x00bf], %r28
T2_asi_reg_rd_215:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf68c600c  ! 3862: LDUBA_I	lduba	[%r17, + 0x000c] %asi, %r27
cpu_intr_2_287:
	setx	0x3e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab58000  ! 3867: SUBCcc_R	orncc 	%r22, %r0, %r29
T2_asi_reg_rd_216:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 3877: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf295e10d  ! 3879: LDUHA_I	lduha	[%r23, + 0x010d] %asi, %r25
	.word 0xf40c60c8  ! 3883: LDUB_I	ldub	[%r17 + 0x00c8], %r26
cpu_intr_2_288:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6544000  ! 3887: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb13c6001  ! 3888: SRA_I	sra 	%r17, 0x0001, %r24
cpu_intr_2_289:
	setx	0x3f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc6159  ! 3890: LDSBA_I	ldsba	[%r17, + 0x0159] %asi, %r29
	.word 0xfa144000  ! 3892: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_290:
	setx	0x3f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8ce142  ! 3894: LDUBA_I	lduba	[%r19, + 0x0142] %asi, %r29
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982942  ! 3897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
	.word 0xf0840020  ! 3898: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_291:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c10  ! 3905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
T2_asi_reg_rd_217:
	mov	0x24, %r14
	.word 0xfadb84a0  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4052087  ! 3908: LDUW_I	lduw	[%r20 + 0x0087], %r26
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3913: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb89d0000  ! 3918: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xfa84e168  ! 3922: LDUWA_I	lduwa	[%r19, + 0x0168] %asi, %r29
cpu_intr_2_292:
	setx	0x3f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c5a199  ! 3926: ADDCcc_I	addccc 	%r22, 0x0199, %r24
	.word 0xfc4da1f7  ! 3928: LDSB_I	ldsb	[%r22 + 0x01f7], %r30
cpu_intr_2_293:
	setx	0x3c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c5000  ! 3930: SLLX_R	sllx	%r17, %r0, %r29
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 3934: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfad54020  ! 3936: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
T2_asi_reg_rd_218:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 3938: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf48c21bd  ! 3939: LDUBA_I	lduba	[%r16, + 0x01bd] %asi, %r26
cpu_intr_2_294:
	setx	0x3f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc54e102  ! 3945: LDSH_I	ldsh	[%r19 + 0x0102], %r30
cpu_intr_2_295:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 3953: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfad50020  ! 3956: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_159:
	mov	0x21, %r14
	.word 0xf4f38400  ! 3958: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf014607b  ! 3960: LDUH_I	lduh	[%r17 + 0x007b], %r24
T2_asi_reg_rd_219:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 3961: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf48c0020  ! 3964: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
cpu_intr_2_296:
	setx	0x3f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55a198  ! 3966: LDSH_I	ldsh	[%r22 + 0x0198], %r29
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_297:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_299:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_220:
	mov	0x15, %r14
	.word 0xfedb89e0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf85ce179  ! 3982: LDX_I	ldx	[%r19 + 0x0179], %r28
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 30)
	.word 0xfecd0020  ! 3987: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_300:
	setx	0x3f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_301:
	setx	0x3c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 3992: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_221:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe45208b  ! 3994: LDSW_I	ldsw	[%r20 + 0x008b], %r31
	.word 0xfa05c000  ! 3995: LDUW_R	lduw	[%r23 + %r0], %r29
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_302:
	setx	0x3e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, c)
	.word 0xf654e03e  ! 4005: LDSH_I	ldsh	[%r19 + 0x003e], %r27
T2_asi_reg_rd_222:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb23c60e7  ! 4008: XNOR_I	xnor 	%r17, 0x00e7, %r25
	.word 0x8194e05c  ! 4009: WRPR_TPC_I	wrpr	%r19, 0x005c, %tpc
	.word 0xf2d52088  ! 4010: LDSHA_I	ldsha	[%r20, + 0x0088] %asi, %r25
T2_asi_reg_rd_223:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_161:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 4013: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb69c8000  ! 4015: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xf814c000  ! 4017: LDUH_R	lduh	[%r19 + %r0], %r28
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 9)
	.word 0xf4050000  ! 4023: LDUW_R	lduw	[%r20 + %r0], %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_303:
	setx	0x3e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_224:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 5)
	.word 0xf84c6113  ! 4034: LDSB_I	ldsb	[%r17 + 0x0113], %r28
cpu_intr_2_304:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de160  ! 4039: LDUBA_I	lduba	[%r23, + 0x0160] %asi, %r28
	.word 0xfc040000  ! 4040: LDUW_R	lduw	[%r16 + %r0], %r30
cpu_intr_2_305:
	setx	0x3f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_306:
	setx	0x3d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_307:
	setx	0x3d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_162:
	mov	0x11, %r14
	.word 0xf2f389e0  ! 4051: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_163:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 4054: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_164:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 4055: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_308:
	setx	0x3c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d8000  ! 4057: XNOR_R	xnor 	%r22, %r0, %r28
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, e)
	.word 0xf814e174  ! 4062: LDUH_I	lduh	[%r19 + 0x0174], %r28
T2_asi_reg_rd_225:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4063: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8cc4020  ! 4065: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf08c4020  ! 4071: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
	.word 0xf00dc000  ! 4074: LDUB_R	ldub	[%r23 + %r0], %r24
T2_asi_reg_rd_226:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 30)
	.word 0xfed54020  ! 4081: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
	.word 0xb095609e  ! 4083: ORcc_I	orcc 	%r21, 0x009e, %r24
	.word 0xfe4520f8  ! 4084: LDSW_I	ldsw	[%r20 + 0x00f8], %r31
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_165:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 4086: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_309:
	setx	0x3c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_310:
	setx	0x3f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_311:
	setx	0x3c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cd60c3  ! 4094: LDSBA_I	ldsba	[%r21, + 0x00c3] %asi, %r25
	.word 0x8595e136  ! 4096: WRPR_TSTATE_I	wrpr	%r23, 0x0136, %tstate
T2_asi_reg_wr_166:
	mov	0x28, %r14
	.word 0xfef38400  ! 4097: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_167:
	mov	0x29, %r14
	.word 0xfef38e80  ! 4099: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf0d44020  ! 4103: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 14)
	.word 0xf8842086  ! 4109: LDUWA_I	lduwa	[%r16, + 0x0086] %asi, %r28
T2_asi_reg_rd_227:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf85c4000  ! 4112: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf0cd2117  ! 4113: LDSBA_I	ldsba	[%r20, + 0x0117] %asi, %r24
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf615a126  ! 4117: LDUH_I	lduh	[%r22 + 0x0126], %r27
	.word 0xfa940020  ! 4118: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
cpu_intr_2_312:
	setx	0x430127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5a145  ! 4120: LDSWA_I	ldswa	[%r22, + 0x0145] %asi, %r31
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 24)
	.word 0xfcd52138  ! 4122: LDSHA_I	ldsha	[%r20, + 0x0138] %asi, %r30
cpu_intr_2_313:
	setx	0x420006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x430112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe056077  ! 4129: LDUW_I	lduw	[%r21 + 0x0077], %r31
	.word 0xfc056048  ! 4130: LDUW_I	lduw	[%r21 + 0x0048], %r30
	.word 0xba8ca055  ! 4131: ANDcc_I	andcc 	%r18, 0x0055, %r29
	.word 0xfe95c020  ! 4135: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xf0d521f3  ! 4136: LDSHA_I	ldsha	[%r20, + 0x01f3] %asi, %r24
	.word 0xf2940020  ! 4138: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_315:
	setx	0x43010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5a0d7  ! 4140: LDSHA_I	ldsha	[%r22, + 0x00d7] %asi, %r24
	.word 0xf44da075  ! 4141: LDSB_I	ldsb	[%r22 + 0x0075], %r26
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_168:
	mov	0x0, %r14
	.word 0xf0f384a0  ! 4146: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_228:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_316:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0cc000  ! 4151: LDUB_R	ldub	[%r19 + %r0], %r31
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa5d0000  ! 4157: LDX_R	ldx	[%r20 + %r0], %r29
cpu_intr_2_317:
	setx	0x430024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c7001  ! 4159: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xfe84c020  ! 4162: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
cpu_intr_2_318:
	setx	0x400332, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 4164: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_229:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_319:
	setx	0x41001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_320:
	setx	0x41000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5421a3  ! 4172: LDSH_I	ldsh	[%r16 + 0x01a3], %r30
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 4)
	.word 0xf80de1bc  ! 4174: LDUB_I	ldub	[%r23 + 0x01bc], %r28
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 31)
	.word 0xf8954020  ! 4177: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	.word 0xfe0de129  ! 4178: LDUB_I	ldub	[%r23 + 0x0129], %r31
	.word 0xbaada19f  ! 4180: ANDNcc_I	andncc 	%r22, 0x019f, %r29
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_170:
	mov	0x31, %r14
	.word 0xf0f38e80  ! 4185: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL0
	.word 0xfc058000  ! 4196: LDUW_R	lduw	[%r22 + %r0], %r30
T2_asi_reg_wr_171:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 4197: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, c)
	.word 0xfa0c0000  ! 4202: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xfa154000  ! 4203: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf60c20e9  ! 4204: LDUB_I	ldub	[%r16 + 0x00e9], %r27
T2_asi_reg_wr_172:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 4207: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_321:
	setx	0x410101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68dc020  ! 4209: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	.word 0xfc040000  ! 4215: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xfadca1ca  ! 4216: LDXA_I	ldxa	[%r18, + 0x01ca] %asi, %r29
	.word 0xf84c0000  ! 4218: LDSB_R	ldsb	[%r16 + %r0], %r28
T2_asi_reg_rd_230:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 4220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa05617a  ! 4221: LDUW_I	lduw	[%r21 + 0x017a], %r29
	.word 0xb414217d  ! 4223: OR_I	or 	%r16, 0x017d, %r26
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_231:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb9347001  ! 4230: SRLX_I	srlx	%r17, 0x0001, %r28
cpu_intr_2_322:
	setx	0x420022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c0000  ! 4232: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xf4d4201f  ! 4236: LDSHA_I	ldsha	[%r16, + 0x001f] %asi, %r26
cpu_intr_2_323:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_324:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5203c  ! 4241: LDSWA_I	ldswa	[%r20, + 0x003c] %asi, %r31
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_232:
	mov	0x18, %r14
	.word 0xfcdb8e40  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb33d7001  ! 4245: SRAX_I	srax	%r21, 0x0001, %r25
	.word 0xfe8c0020  ! 4248: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
T2_asi_reg_wr_173:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 4250: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf24d8000  ! 4253: LDSB_R	ldsb	[%r22 + %r0], %r25
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_233:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe9ce1a3  ! 4257: XORcc_I	xorcc 	%r19, 0x01a3, %r31
cpu_intr_2_325:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6956035  ! 4259: LDUHA_I	lduha	[%r21, + 0x0035] %asi, %r27
	.word 0xfe4c8000  ! 4261: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf444e065  ! 4265: LDSW_I	ldsw	[%r19 + 0x0065], %r26
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_174:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 4269: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_326:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84a1a1  ! 4274: LDUWA_I	lduwa	[%r18, + 0x01a1] %asi, %r30
cpu_intr_2_327:
	setx	0x42011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48de18f  ! 4280: LDUBA_I	lduba	[%r23, + 0x018f] %asi, %r26
cpu_intr_2_328:
	setx	0x410318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x41023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 25)
	.word 0xf2d54020  ! 4299: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
T2_asi_reg_rd_234:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 4302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_175:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 4303: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf4548000  ! 4310: LDSH_R	ldsh	[%r18 + %r0], %r26
T2_asi_reg_wr_176:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4312: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf28460a3  ! 4315: LDUWA_I	lduwa	[%r17, + 0x00a3] %asi, %r25
T2_asi_reg_rd_235:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa956156  ! 4317: LDUHA_I	lduha	[%r21, + 0x0156] %asi, %r29
	.word 0xfacd0020  ! 4319: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 4320: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfe0c0000  ! 4321: LDUB_R	ldub	[%r16 + %r0], %r31
T2_asi_reg_rd_236:
	mov	0x25, %r14
	.word 0xf4db8e60  ! 4323: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, b)
	.word 0xf4144000  ! 4327: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf2940020  ! 4336: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xf8944020  ! 4337: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0x8594e1fd  ! 4338: WRPR_TSTATE_I	wrpr	%r19, 0x01fd, %tstate
	.word 0x8f902002  ! 4340: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xf6440000  ! 4341: LDSW_R	ldsw	[%r16 + %r0], %r27
T2_asi_reg_rd_237:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_238:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf24dc000  ! 4353: LDSB_R	ldsb	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_330:
	setx	0x420202, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb7643801  ! 4367: MOVcc_I	<illegal instruction>
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf44c61e0  ! 4371: LDSB_I	ldsb	[%r17 + 0x01e0], %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 0)
	.word 0xbe9c0000  ! 4377: XORcc_R	xorcc 	%r16, %r0, %r31
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198390a  ! 4378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190a, %hpstate
	.word 0xfc840020  ! 4379: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	.word 0xfed46077  ! 4383: LDSHA_I	ldsha	[%r17, + 0x0077] %asi, %r31
	.word 0xf4cd6052  ! 4384: LDSBA_I	ldsba	[%r21, + 0x0052] %asi, %r26
	.word 0xf4852005  ! 4385: LDUWA_I	lduwa	[%r20, + 0x0005] %asi, %r26
T2_asi_reg_rd_239:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 4387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_178:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 4388: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 11)
	.word 0xfc8ca15d  ! 4392: LDUBA_I	lduba	[%r18, + 0x015d] %asi, %r30
	.word 0xf65d606d  ! 4393: LDX_I	ldx	[%r21 + 0x006d], %r27
cpu_intr_2_331:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 35)
	.word 0xf8c5a1ab  ! 4397: LDSWA_I	ldswa	[%r22, + 0x01ab] %asi, %r28
	.word 0xf8146022  ! 4398: LDUH_I	lduh	[%r17 + 0x0022], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_332:
	setx	0x420339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_333:
	setx	0x43030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 4404: RDPR_TSTATE	<illegal instruction>
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_334:
	setx	0x430012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2948020  ! 4411: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
	.word 0xb9520000  ! 4413: RDPR_PIL	<illegal instruction>
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb77d0400  ! 4422: MOVR_R	movre	%r20, %r0, %r27
T2_asi_reg_wr_179:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 4423: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ad2  ! 4426: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
	.word 0xf0c5a10d  ! 4433: LDSWA_I	ldswa	[%r22, + 0x010d] %asi, %r24
	.word 0xf28c4020  ! 4434: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xb4c5a0be  ! 4438: ADDCcc_I	addccc 	%r22, 0x00be, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfe4cc000  ! 4443: LDSB_R	ldsb	[%r19 + %r0], %r31
cpu_intr_2_335:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_180:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 4445: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 24)
	.word 0xf245604a  ! 4450: LDSW_I	ldsw	[%r21 + 0x004a], %r25
	.word 0xb6bd60a0  ! 4452: XNORcc_I	xnorcc 	%r21, 0x00a0, %r27
	.word 0xb5518000  ! 4453: RDPR_PSTATE	<illegal instruction>
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_336:
	setx	0x43002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a58000  ! 4461: SUBcc_R	subcc 	%r22, %r0, %r25
T2_asi_reg_rd_240:
	mov	0x2a, %r14
	.word 0xf2db8400  ! 4462: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_337:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695c020  ! 4465: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_181:
	mov	0x2, %r14
	.word 0xfaf38400  ! 4467: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb33c0000  ! 4472: SRA_R	sra 	%r16, %r0, %r25
T2_asi_reg_wr_182:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 4473: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb8044000  ! 4474: ADD_R	add 	%r17, %r0, %r28
	.word 0xfccd8020  ! 4475: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
	.word 0xbd7c6401  ! 4479: MOVR_I	movre	%r17, 0x1, %r30
	.word 0xfc4d2118  ! 4481: LDSB_I	ldsb	[%r20 + 0x0118], %r30
cpu_intr_2_338:
	setx	0x400119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x430318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_341:
	setx	0x430215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c6010  ! 4489: LDSB_I	ldsb	[%r17 + 0x0010], %r30
	.word 0xfe8c4020  ! 4490: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf2cce1c0  ! 4492: LDSBA_I	ldsba	[%r19, + 0x01c0] %asi, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_342:
	setx	0x410017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5a117  ! 4502: LDSWA_I	ldswa	[%r22, + 0x0117] %asi, %r25
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c82  ! 4503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_183:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 4506: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc34a121  ! 4508: SUBC_I	orn 	%r18, 0x0121, %r30
cpu_intr_2_343:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0ce02d  ! 4510: LDUB_I	ldub	[%r19 + 0x002d], %r31
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe8c6032  ! 4514: LDUBA_I	lduba	[%r17, + 0x0032] %asi, %r31
	.word 0xf40d4000  ! 4515: LDUB_R	ldub	[%r21 + %r0], %r26
cpu_intr_2_344:
	setx	0x420333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_345:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d7001  ! 4519: SLLX_I	sllx	%r21, 0x0001, %r26
T2_asi_reg_rd_241:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_184:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 4526: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2d40020  ! 4528: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
	.word 0xfa0c8000  ! 4529: LDUB_R	ldub	[%r18 + %r0], %r29
T2_asi_reg_rd_242:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa140000  ! 4532: LDUH_R	lduh	[%r16 + %r0], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfe854020  ! 4534: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xf6cdc020  ! 4535: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xfc0da0ae  ! 4536: LDUB_I	ldub	[%r22 + 0x00ae], %r30
	.word 0xbd3d1000  ! 4538: SRAX_R	srax	%r20, %r0, %r30
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 33)
	.word 0xfecd4020  ! 4544: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_185:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 4547: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_186:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 4553: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_243:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 4559: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5357001  ! 4560: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xf6448000  ! 4561: LDSW_R	ldsw	[%r18 + %r0], %r27
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf4052117  ! 4563: LDUW_I	lduw	[%r20 + 0x0117], %r26
cpu_intr_2_346:
	setx	0x23d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c8020  ! 4567: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_244:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_187:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 4574: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_245:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 32)
	.word 0xf494216b  ! 4578: LDUHA_I	lduha	[%r16, + 0x016b] %asi, %r26
cpu_intr_2_347:
	setx	0x460107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844214f  ! 4582: LDSW_I	ldsw	[%r16 + 0x014f], %r28
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_246:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa0d61c0  ! 4586: LDUB_I	ldub	[%r21 + 0x01c0], %r29
	.word 0xfa45c000  ! 4587: LDSW_R	ldsw	[%r23 + %r0], %r29
cpu_intr_2_348:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_349:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x440303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c8000  ! 4597: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf255e1f7  ! 4600: LDSH_I	ldsh	[%r23 + 0x01f7], %r25
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 6)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d90  ! 4605: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
	.word 0xf60c0000  ! 4607: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xf64d4000  ! 4608: LDSB_R	ldsb	[%r21 + %r0], %r27
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_188:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 4615: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f82  ! 4616: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
T2_asi_reg_wr_189:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 4617: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_351:
	setx	0x460122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4454000  ! 4620: LDSW_R	ldsw	[%r21 + %r0], %r26
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_352:
	setx	0x460133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_190:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 4626: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe8c0020  ! 4631: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
	.word 0xf28c0020  ! 4634: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfe15e091  ! 4637: LDUH_I	lduh	[%r23 + 0x0091], %r31
	.word 0xfcd48020  ! 4638: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 20)
	.word 0xf04c60dc  ! 4643: LDSB_I	ldsb	[%r17 + 0x00dc], %r24
T2_asi_reg_rd_247:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 4644: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_353:
	setx	0x450119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, b)
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_354:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad5c020  ! 4660: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
	.word 0xf645e0f3  ! 4661: LDSW_I	ldsw	[%r23 + 0x00f3], %r27
	.word 0xf414e089  ! 4663: LDUH_I	lduh	[%r19 + 0x0089], %r26
	.word 0xf285a103  ! 4665: LDUWA_I	lduwa	[%r22, + 0x0103] %asi, %r25
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
cpu_intr_2_355:
	setx	0x45030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_356:
	setx	0x470025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15c000  ! 4673: LDUH_R	lduh	[%r23 + %r0], %r29
T2_asi_reg_rd_248:
	mov	0x1b, %r14
	.word 0xf4db84a0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb4950000  ! 4682: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xfac4a0e0  ! 4683: LDSWA_I	ldswa	[%r18, + 0x00e0] %asi, %r29
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b8a  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
	.word 0xfecce19d  ! 4694: LDSBA_I	ldsba	[%r19, + 0x019d] %asi, %r31
	.word 0xfc55e011  ! 4695: LDSH_I	ldsh	[%r23 + 0x0011], %r30
T2_asi_reg_rd_249:
	mov	0x1b, %r14
	.word 0xfcdb8e80  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf8158000  ! 4699: LDUH_R	lduh	[%r22 + %r0], %r28
T2_asi_reg_wr_191:
	mov	0x11, %r14
	.word 0xf0f384a0  ! 4700: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xba8c4000  ! 4702: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xf294c020  ! 4703: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0d560db  ! 4707: LDSHA_I	ldsha	[%r21, + 0x00db] %asi, %r24
cpu_intr_2_357:
	setx	0x460233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_250:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbea4a138  ! 4714: SUBcc_I	subcc 	%r18, 0x0138, %r31
T2_asi_reg_wr_192:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 4716: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_251:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 4719: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_252:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf08cc020  ! 4723: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfadda047  ! 4726: LDXA_I	ldxa	[%r22, + 0x0047] %asi, %r29
	.word 0xfad4a047  ! 4729: LDSHA_I	ldsha	[%r18, + 0x0047] %asi, %r29
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 30)
	.word 0xfc94e1ae  ! 4739: LDUHA_I	lduha	[%r19, + 0x01ae] %asi, %r30
T2_asi_reg_wr_193:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 4740: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4d420d5  ! 4743: LDSHA_I	ldsha	[%r16, + 0x00d5] %asi, %r26
	.word 0xfe050000  ! 4744: LDUW_R	lduw	[%r20 + %r0], %r31
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 21)
	.word 0xf61520f2  ! 4747: LDUH_I	lduh	[%r20 + 0x00f2], %r27
	.word 0xf68c60b1  ! 4748: LDUBA_I	lduba	[%r17, + 0x00b1] %asi, %r27
	.word 0xf0548000  ! 4749: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf4d520c0  ! 4750: LDSHA_I	ldsha	[%r20, + 0x00c0] %asi, %r26
T2_asi_reg_wr_194:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 4754: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_253:
	mov	0xa, %r14
	.word 0xf8db84a0  ! 4756: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_358:
	setx	0x440236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 12)
	.word 0xf6146148  ! 4761: LDUH_I	lduh	[%r17 + 0x0148], %r27
	.word 0xb7643801  ! 4764: MOVcc_I	<illegal instruction>
	.word 0xfa958020  ! 4768: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
cpu_intr_2_359:
	setx	0x460212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc154000  ! 4772: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf68d8020  ! 4773: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	.word 0xb93d0000  ! 4774: SRA_R	sra 	%r20, %r0, %r28
	.word 0xf414604c  ! 4775: LDUH_I	lduh	[%r17 + 0x004c], %r26
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa4ca060  ! 4780: LDSB_I	ldsb	[%r18 + 0x0060], %r29
	.word 0xf84c2185  ! 4781: LDSB_I	ldsb	[%r16 + 0x0185], %r28
cpu_intr_2_360:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c202a  ! 4787: LDX_I	ldx	[%r16 + 0x002a], %r28
cpu_intr_2_361:
	setx	0x46012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d60ea  ! 4790: LDSB_I	ldsb	[%r21 + 0x00ea], %r31
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0142134  ! 4794: LDUH_I	lduh	[%r16 + 0x0134], %r24
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b52  ! 4795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0xf6456171  ! 4796: LDSW_I	ldsw	[%r21 + 0x0171], %r27
T2_asi_reg_wr_195:
	mov	0x14, %r14
	.word 0xfef384a0  ! 4797: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8c48020  ! 4798: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
	.word 0xf45ce1be  ! 4800: LDX_I	ldx	[%r19 + 0x01be], %r26
	.word 0xb33ce001  ! 4803: SRA_I	sra 	%r19, 0x0001, %r25
cpu_intr_2_362:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60420ec  ! 4805: LDUW_I	lduw	[%r16 + 0x00ec], %r27
	.word 0xf4d42082  ! 4806: LDSHA_I	ldsha	[%r16, + 0x0082] %asi, %r26
	.word 0xb8b5c000  ! 4809: SUBCcc_R	orncc 	%r23, %r0, %r28
	.word 0xbcb58000  ! 4810: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xf45c202d  ! 4811: LDX_I	ldx	[%r16 + 0x002d], %r26
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbc3de119  ! 4817: XNOR_I	xnor 	%r23, 0x0119, %r30
	.word 0xf685c020  ! 4818: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
cpu_intr_2_363:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_364:
	setx	0x440332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 4822: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf655606f  ! 4823: LDSH_I	ldsh	[%r21 + 0x006f], %r27
	.word 0xb2c461cb  ! 4824: ADDCcc_I	addccc 	%r17, 0x01cb, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_365:
	setx	0x470110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2852063  ! 4831: LDUWA_I	lduwa	[%r20, + 0x0063] %asi, %r25
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_TO_TL1
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 23)
	.word 0xf2d44020  ! 4837: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfa8d0020  ! 4840: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	.word 0xf8cc611c  ! 4842: LDSBA_I	ldsba	[%r17, + 0x011c] %asi, %r28
	.word 0xbe44c000  ! 4844: ADDC_R	addc 	%r19, %r0, %r31
	.word 0xb2b4c000  ! 4845: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xb9508000  ! 4848: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xf00d8000  ! 4853: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xb82d6135  ! 4855: ANDN_I	andn 	%r21, 0x0135, %r28
	.word 0xb72cf001  ! 4856: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xfc4520dd  ! 4857: LDSW_I	ldsw	[%r20 + 0x00dd], %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_254:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 4863: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf854a173  ! 4864: LDSH_I	ldsh	[%r18 + 0x0173], %r28
cpu_intr_2_366:
	setx	0x440302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_367:
	setx	0x470212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4544000  ! 4870: LDSH_R	ldsh	[%r17 + %r0], %r26
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_196:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4873: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 25)
	.word 0xba0d4000  ! 4876: AND_R	and 	%r21, %r0, %r29
	.word 0xf4cde19c  ! 4877: LDSBA_I	ldsba	[%r23, + 0x019c] %asi, %r26
	.word 0xfa140000  ! 4878: LDUH_R	lduh	[%r16 + %r0], %r29
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a82  ! 4879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 3b)
	.word 0xbab58000  ! 4885: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xbb2da001  ! 4888: SLL_I	sll 	%r22, 0x0001, %r29
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_197:
	mov	0x13, %r14
	.word 0xf0f384a0  ! 4892: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_368:
	setx	0x460117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_255:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 2c)
	.word 0x9195e083  ! 4900: WRPR_PIL_I	wrpr	%r23, 0x0083, %pil
cpu_intr_2_369:
	setx	0x46031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf855c000  ! 4913: LDSH_R	ldsh	[%r23 + %r0], %r28
cpu_intr_2_370:
	setx	0x450308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88ce0d7  ! 4915: LDUBA_I	lduba	[%r19, + 0x00d7] %asi, %r28
	.word 0xfac50020  ! 4921: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_198:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 4927: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bc2  ! 4931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc2, %hpstate
	.word 0xf0cd8020  ! 4932: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
cpu_intr_2_371:
	setx	0x47031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3d8000  ! 4942: XNOR_R	xnor 	%r22, %r0, %r31
	.word 0xb49561f3  ! 4945: ORcc_I	orcc 	%r21, 0x01f3, %r26
T2_asi_reg_wr_199:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 4946: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6440000  ! 4947: LDSW_R	ldsw	[%r16 + %r0], %r27
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e98  ! 4948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_200:
	mov	0xd, %r14
	.word 0xfef384a0  ! 4952: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_201:
	mov	0x5, %r14
	.word 0xf6f38e60  ! 4954: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_256:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_372:
	setx	0x460138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_202:
	mov	0x12, %r14
	.word 0xf2f38400  ! 4963: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfccc0020  ! 4964: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xbca421ed  ! 4965: SUBcc_I	subcc 	%r16, 0x01ed, %r30
T2_asi_reg_wr_203:
	mov	0x36, %r14
	.word 0xf2f38400  ! 4966: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_257:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_373:
	setx	0x440120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 4973: SRAX_R	srax	%r16, %r0, %r30
	.word 0xfa45e0e1  ! 4975: LDSW_I	ldsw	[%r23 + 0x00e1], %r29
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfec460de  ! 4977: LDSWA_I	ldswa	[%r17, + 0x00de] %asi, %r31
	.word 0xba154000  ! 4980: OR_R	or 	%r21, %r0, %r29
	.word 0xfcc5a018  ! 4983: LDSWA_I	ldswa	[%r22, + 0x0018] %asi, %r30
T2_asi_reg_wr_204:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 4986: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_374:
	setx	0x450036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_375:
	setx	0x450333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc0020  ! 4996: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xf44d6044  ! 4998: LDSB_I	ldsb	[%r21 + 0x0044], %r26
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_0:
	setx	0x18023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_1:
	setx	0x1a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40820  ! 8: FADDs	fadds	%f16, %f0, %f31
T1_asi_reg_rd_0:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_1:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 11: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_2:
	setx	0x1e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_0:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 21: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_1:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 23: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 29)
	.word 0xb7a00040  ! 26: FMOVd	fmovd	%f0, %f58
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 9)
	.word 0xbcbda1b1  ! 32: XNORcc_I	xnorcc 	%r22, 0x01b1, %r30
T1_asi_reg_rd_2:
	mov	0x2a, %r14
	.word 0xf2db89e0  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_3:
	setx	0x1f030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0x20, %r14
	.word 0xf0db8e60  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5a81820  ! 40: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_rd_4:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a44920  ! 47: FMULs	fmuls	%f17, %f0, %f26
T1_asi_reg_wr_2:
	mov	0x17, %r14
	.word 0xf4f38e80  ! 48: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3a50920  ! 49: FMULs	fmuls	%f20, %f0, %f25
	.word 0xbda448c0  ! 53: FSUBd	fsubd	%f48, %f0, %f30
cpu_intr_1_4:
	setx	0x1d030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa4820  ! 57: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9aac820  ! 60: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_3:
	mov	0x1a, %r14
	.word 0xf0f38e80  ! 62: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbba80820  ! 63: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_5:
	setx	0x1e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 71: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 72: FMOVRNZ	dis not found

	.word 0xbfa548c0  ! 73: FSUBd	fsubd	%f52, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9ab4820  ! 75: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xba25e185  ! 76: SUB_I	sub 	%r23, 0x0185, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a54840  ! 79: FADDd	faddd	%f52, %f0, %f58
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_6:
	setx	0x1f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 84: FMOVs	fmovs	%f0, %f25
cpu_intr_1_7:
	setx	0x1e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 88: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 13)
	.word 0xb235619d  ! 92: SUBC_I	orn 	%r21, 0x019d, %r25
T1_asi_reg_rd_5:
	mov	0xb, %r14
	.word 0xf8db8400  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_8:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_10:
	setx	0x1d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_11:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a8c820  ! 113: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa8820  ! 117: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_12:
	setx	0x1e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 121: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb9a408e0  ! 124: FSUBq	dis not found

T1_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_7:
	mov	0x15, %r14
	.word 0xf4db8e80  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_8:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 135: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_14:
	setx	0x1f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_9:
	mov	0x38, %r14
	.word 0xf4db8400  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9a408e0  ! 144: FSUBq	dis not found

cpu_intr_1_15:
	setx	0x1f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44960  ! 148: FMULq	dis not found

	.word 0xb5a48820  ! 155: FADDs	fadds	%f18, %f0, %f26
T1_asi_reg_rd_10:
	mov	0x12, %r14
	.word 0xfcdb84a0  ! 157: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb1a9c820  ! 159: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_11:
	mov	0x13, %r14
	.word 0xf4db84a0  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1a508c0  ! 165: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbba40960  ! 168: FMULq	dis not found

T1_asi_reg_rd_12:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9aa8820  ! 170: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_16:
	setx	0x1f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_4:
	mov	0x21, %r14
	.word 0xfcf38400  ! 174: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb225c000  ! 175: SUB_R	sub 	%r23, %r0, %r25
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb7a80820  ! 177: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 179: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_5:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 180: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_13:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 181: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb2056087  ! 182: ADD_I	add 	%r21, 0x0087, %r25
cpu_intr_1_17:
	setx	0x1f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa00560  ! 190: FSQRTq	fsqrt	
T1_asi_reg_rd_14:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7a80820  ! 194: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_18:
	setx	0x1c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_15:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_19:
	setx	0x1d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a44820  ! 204: FADDs	fadds	%f17, %f0, %f27
	.word 0xb9aa0820  ! 205: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbabda1f4  ! 206: XNORcc_I	xnorcc 	%r22, 0x01f4, %r29
T1_asi_reg_wr_6:
	mov	0xf, %r14
	.word 0xf6f38e60  ! 207: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbc15a136  ! 211: OR_I	or 	%r22, 0x0136, %r30
T1_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 214: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 12)
	.word 0xbcb4e09e  ! 218: SUBCcc_I	orncc 	%r19, 0x009e, %r30
	.word 0xb2b40000  ! 220: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xbc3dc000  ! 222: XNOR_R	xnor 	%r23, %r0, %r30
cpu_intr_1_20:
	setx	0x1c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_21:
	setx	0x1e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 230: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80c20  ! 231: FMOVRLZ	dis not found

	.word 0xbda80c20  ! 233: FMOVRLZ	dis not found

	.word 0xb3a4c840  ! 236: FADDd	faddd	%f50, %f0, %f56
	.word 0xb1a80820  ! 237: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_22:
	setx	0x1c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 240: FSQRTs	fsqrt	
	.word 0xb20c60e5  ! 241: AND_I	and 	%r17, 0x00e5, %r25
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_8:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 243: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa448c0  ! 253: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb63d61bc  ! 255: XNOR_I	xnor 	%r21, 0x01bc, %r27
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, b)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_23:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_24:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 273: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xb7a58920  ! 276: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb3a90820  ! 277: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_25:
	setx	0x1d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_9:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 283: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_26:
	setx	0x1f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 287: FSQRTd	fsqrt	
cpu_intr_1_27:
	setx	0x1e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 297: FMOVRLZ	dis not found

	.word 0xbba00540  ! 298: FSQRTd	fsqrt	
	.word 0xb3a9c820  ! 300: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_28:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549c0  ! 305: FDIVd	fdivd	%f52, %f0, %f30
cpu_intr_1_29:
	setx	0x1f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_16:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1a409a0  ! 314: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb7a589c0  ! 318: FDIVd	fdivd	%f22, %f0, %f58
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa00020  ! 321: FMOVs	fmovs	%f0, %f31
T1_asi_reg_rd_17:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 322: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda48860  ! 323: FADDq	dis not found

T1_asi_reg_rd_18:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 325: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5a448e0  ! 326: FSUBq	dis not found

	.word 0xb9a409a0  ! 329: FDIVs	fdivs	%f16, %f0, %f28
cpu_intr_1_31:
	setx	0x1c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9c0  ! 332: FDIVd	fdivd	%f50, %f0, %f30
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a00560  ! 336: FSQRTq	fsqrt	
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_10:
	mov	0x26, %r14
	.word 0xf0f38e60  ! 338: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a00540  ! 340: FSQRTd	fsqrt	
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_32:
	setx	0x1d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548e0  ! 345: FSUBq	dis not found

	.word 0xb3a80c20  ! 346: FMOVRLZ	dis not found

	.word 0xbfa8c820  ! 351: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80420  ! 352: FMOVRZ	dis not found

T1_asi_reg_wr_11:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 353: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_12:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 354: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_33:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_13:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 358: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbba5c860  ! 360: FADDq	dis not found

iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1aac820  ! 362: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbac460bf  ! 363: ADDCcc_I	addccc 	%r17, 0x00bf, %r29
	.word 0xb834a152  ! 365: ORN_I	orn 	%r18, 0x0152, %r28
	.word 0xb3a8c820  ! 366: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_19:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_20:
	mov	0x14, %r14
	.word 0xf0db84a0  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_21:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a5c9a0  ! 379: FDIVs	fdivs	%f23, %f0, %f26
T1_asi_reg_rd_22:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb434a080  ! 383: ORN_I	orn 	%r18, 0x0080, %r26
	.word 0xb5a8c820  ! 384: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_14:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 387: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_34:
	setx	0x1d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x1e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_15:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 398: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9a9c820  ! 399: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a5c8e0  ! 400: FSUBq	dis not found

T1_asi_reg_rd_23:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbd2c3001  ! 406: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xb1a44860  ! 407: FADDq	dis not found

	.word 0xb9a80420  ! 412: FMOVRZ	dis not found

T1_asi_reg_wr_16:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 413: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_36:
	setx	0x1f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 419: FADDs	fadds	%f22, %f0, %f25
cpu_intr_1_37:
	setx	0x1f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x1f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_24:
	mov	0xe, %r14
	.word 0xfadb89e0  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a80820  ! 427: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_17:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 430: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_39:
	setx	0x1d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c1000  ! 432: SRAX_R	srax	%r16, %r0, %r29
	.word 0xb88dc000  ! 434: ANDcc_R	andcc 	%r23, %r0, %r28
T1_asi_reg_rd_25:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3a4c840  ! 438: FADDd	faddd	%f50, %f0, %f56
	.word 0xbba81420  ! 440: FMOVRNZ	dis not found

iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbb7c2401  ! 443: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xbaa56157  ! 447: SUBcc_I	subcc 	%r21, 0x0157, %r29
	.word 0xb1ab4820  ! 448: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_26:
	mov	0x8, %r14
	.word 0xf2db8e80  ! 450: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_27:
	mov	0x2f, %r14
	.word 0xf0db8400  ! 452: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9aac820  ! 456: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbba90820  ! 457: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_18:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 459: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a588e0  ! 460: FSUBq	dis not found

T1_asi_reg_rd_28:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_29:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 3)
	.word 0xbdaa8820  ! 469: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb6b5c000  ! 471: ORNcc_R	orncc 	%r23, %r0, %r27
T1_asi_reg_rd_30:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb7a00540  ! 474: FSQRTd	fsqrt	
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_40:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_19:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 490: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1aac820  ! 495: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_41:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 499: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a94820  ! 500: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa8c820  ! 501: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a40820  ! 508: FADDs	fadds	%f16, %f0, %f28
	.word 0xbfa98820  ! 509: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_42:
	setx	0x22010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 515: FSUBq	dis not found

cpu_intr_1_43:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 520: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbba90820  ! 523: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_44:
	setx	0x200103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 525: FSQRTd	fsqrt	
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_45:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2da001  ! 538: SLL_I	sll 	%r22, 0x0001, %r31
cpu_intr_1_46:
	setx	0x200206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_47:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_31:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbaa4820  ! 549: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1504000  ! 550: RDPR_TNPC	<illegal instruction>
cpu_intr_1_48:
	setx	0x210300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 552: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a84820  ! 554: FMOVE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_32:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb6854000  ! 563: ADDcc_R	addcc 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a98820  ! 567: FMOVNEG	fmovs	%fcc1, %f0, %f28
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_33:
	mov	0x1e, %r14
	.word 0xf8db89e0  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 25)
	.word 0xb3a88820  ! 580: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb32c6001  ! 581: SLL_I	sll 	%r17, 0x0001, %r25
T1_asi_reg_wr_20:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 583: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_34:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 587: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_49:
	setx	0x22020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_50:
	setx	0x200331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec560f6  ! 598: ADDCcc_I	addccc 	%r21, 0x00f6, %r31
	.word 0xbba9c820  ! 599: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81820  ! 600: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a4c8a0  ! 603: FSUBs	fsubs	%f19, %f0, %f27
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfaa4820  ! 606: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_35:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 610: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb48d6051  ! 612: ANDcc_I	andcc 	%r21, 0x0051, %r26
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda81420  ! 617: FMOVRNZ	dis not found

cpu_intr_1_51:
	setx	0x20023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 621: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda58940  ! 625: FMULd	fmuld	%f22, %f0, %f30
	.word 0xbc0c615c  ! 626: AND_I	and 	%r17, 0x015c, %r30
	.word 0xba0d611b  ! 627: AND_I	and 	%r21, 0x011b, %r29
	.word 0xbba54920  ! 628: FMULs	fmuls	%f21, %f0, %f29
	.word 0xbbab0820  ! 635: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_21:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 641: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba80820  ! 644: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_52:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_37:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a54960  ! 653: FMULq	dis not found

	.word 0xbdab8820  ! 654: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_38:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_39:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xba0ca107  ! 662: AND_I	and 	%r18, 0x0107, %r29
cpu_intr_1_53:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a589a0  ! 667: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xbb356001  ! 668: SRL_I	srl 	%r21, 0x0001, %r29
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_54:
	setx	0x220310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 672: FDIVd	fdivd	%f50, %f0, %f58
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_55:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x3, %r14
	.word 0xf8db8e60  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_41:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 686: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_56:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_57:
	setx	0x220231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48840  ! 691: FADDd	faddd	%f18, %f0, %f60
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a44820  ! 695: FADDs	fadds	%f17, %f0, %f24
T1_asi_reg_wr_22:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 697: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3a00520  ! 702: FSQRTs	fsqrt	
cpu_intr_1_58:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x230000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 710: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb7a00520  ! 712: FSQRTs	fsqrt	
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a40840  ! 724: FADDd	faddd	%f16, %f0, %f28
cpu_intr_1_60:
	setx	0x200331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x29, %r14
	.word 0xfedb8400  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa5c960  ! 727: FMULq	dis not found

	.word 0xb9a48920  ! 729: FMULs	fmuls	%f18, %f0, %f28
	.word 0xb33c5000  ! 732: SRAX_R	srax	%r17, %r0, %r25
	.word 0xb5aa8820  ! 735: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80420  ! 736: FMOVRZ	dis not found

iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, f)
	.word 0xbda00540  ! 744: FSQRTd	fsqrt	
T1_asi_reg_wr_23:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 747: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9aa0820  ! 749: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a509e0  ! 751: FDIVq	dis not found

T1_asi_reg_rd_43:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 753: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb33c5000  ! 759: SRAX_R	srax	%r17, %r0, %r25
	.word 0xb92cd000  ! 762: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xbda509e0  ! 763: FDIVq	dis not found

	.word 0xbfa4c860  ! 764: FADDq	dis not found

cpu_intr_1_61:
	setx	0x220227, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 770: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_44:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_45:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1643801  ! 778: MOVcc_I	<illegal instruction>
	.word 0xb5a00020  ! 780: FMOVs	fmovs	%f0, %f26
cpu_intr_1_62:
	setx	0x200110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 792: FMOVRNZ	dis not found

iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbbaa0820  ! 794: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_63:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_64:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0x18, %r14
	.word 0xfef38e60  ! 798: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5a448a0  ! 799: FSUBs	fsubs	%f17, %f0, %f26
cpu_intr_1_65:
	setx	0x200303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 805: FMOVd	fmovd	%f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb21d4000  ! 811: XOR_R	xor 	%r21, %r0, %r25
T1_asi_reg_rd_46:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a58960  ! 818: FMULq	dis not found

T1_asi_reg_rd_47:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb094e1d3  ! 824: ORcc_I	orcc 	%r19, 0x01d3, %r24
	.word 0xb1a90820  ! 825: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_48:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_66:
	setx	0x1030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 833: FMOVRZ	dis not found

	.word 0xbdab4820  ! 834: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_67:
	setx	0x200117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa448e0  ! 837: FSUBq	dis not found

T1_asi_reg_rd_49:
	mov	0x2e, %r14
	.word 0xf8db8400  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_68:
	setx	0x20001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29d2101  ! 847: XORcc_I	xorcc 	%r20, 0x0101, %r25
cpu_intr_1_69:
	setx	0x23010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_70:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_71:
	setx	0x210200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 855: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_72:
	setx	0x20020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 858: FSQRTd	fsqrt	
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a80820  ! 862: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb605a05e  ! 863: ADD_I	add 	%r22, 0x005e, %r27
	.word 0xb7a80c20  ! 866: FMOVRLZ	dis not found

	.word 0xb1a00540  ! 867: FSQRTd	fsqrt	
	.word 0xbda00520  ! 871: FSQRTs	fsqrt	
cpu_intr_1_73:
	setx	0x21032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 873: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a54960  ! 874: FMULq	dis not found

	.word 0xb7a81c20  ! 875: FMOVRGEZ	dis not found

cpu_intr_1_74:
	setx	0x220108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 879: FMOVs	fmovs	%f0, %f25
	.word 0xbea54000  ! 881: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xbfa00020  ! 884: FMOVs	fmovs	%f0, %f31
T1_asi_reg_rd_50:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_51:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbeb4c000  ! 888: ORNcc_R	orncc 	%r19, %r0, %r31
cpu_intr_1_75:
	setx	0x200205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x220112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3aa0820  ! 893: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81c20  ! 896: FMOVRGEZ	dis not found

	.word 0xb9a81820  ! 902: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb1a5c8c0  ! 904: FSUBd	fsubd	%f54, %f0, %f24
cpu_intr_1_77:
	setx	0x22022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_52:
	mov	0x9, %r14
	.word 0xf8db8400  ! 908: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_53:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb8358000  ! 910: SUBC_R	orn 	%r22, %r0, %r28
T1_asi_reg_wr_28:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 911: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_29:
	mov	0xa, %r14
	.word 0xfef38e60  ! 913: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_30:
	mov	0x37, %r14
	.word 0xf4f38e80  ! 917: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbdaa0820  ! 918: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c840  ! 919: FADDd	faddd	%f54, %f0, %f24
	.word 0xb8ad4000  ! 922: ANDNcc_R	andncc 	%r21, %r0, %r28
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_78:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41de1ed  ! 928: XOR_I	xor 	%r23, 0x01ed, %r26
T1_asi_reg_rd_54:
	mov	0x19, %r14
	.word 0xfcdb89e0  ! 929: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 27)
	.word 0xbe958000  ! 933: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xb9a4c820  ! 934: FADDs	fadds	%f19, %f0, %f28
	.word 0xbda80c20  ! 936: FMOVRLZ	dis not found

iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_31:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 940: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbda548e0  ! 941: FSUBq	dis not found

	.word 0xbfa80820  ! 942: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_32:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 951: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xbfa589e0  ! 955: FDIVq	dis not found

	.word 0xbba509c0  ! 957: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb3a5c9a0  ! 960: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbba9c820  ! 961: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_55:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9aa0820  ! 963: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00520  ! 964: FSQRTs	fsqrt	
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3aa0820  ! 968: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_79:
	setx	0x26031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 970: FMOVRGEZ	dis not found

iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5ab4820  ! 972: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb63c0000  ! 974: XNOR_R	xnor 	%r16, %r0, %r27
	.word 0xb3a00040  ! 975: FMOVd	fmovd	%f0, %f56
cpu_intr_1_80:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x24000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 982: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a90820  ! 983: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_82:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_33:
	mov	0xf, %r14
	.word 0xfcf384a0  ! 988: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 1a)
	.word 0xba0cc000  ! 990: AND_R	and 	%r19, %r0, %r29
cpu_intr_1_83:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_84:
	setx	0x270006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbeac8000  ! 1006: ANDNcc_R	andncc 	%r18, %r0, %r31
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_85:
	setx	0x240136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1011: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a8c820  ! 1012: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80420  ! 1014: FMOVRZ	dis not found

iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, f)
	.word 0x81956057  ! 1021: WRPR_TPC_I	wrpr	%r21, 0x0057, %tpc
cpu_intr_1_86:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 1)
	.word 0xbda589a0  ! 1030: FDIVs	fdivs	%f22, %f0, %f30
T1_asi_reg_rd_57:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a488c0  ! 1038: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb7aa4820  ! 1039: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a88820  ! 1044: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa81c20  ! 1047: FMOVRGEZ	dis not found

	.word 0xb77c8400  ! 1048: MOVR_R	movre	%r18, %r0, %r27
	.word 0xbcc52155  ! 1049: ADDCcc_I	addccc 	%r20, 0x0155, %r30
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_58:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 1054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xba35a162  ! 1055: ORN_I	orn 	%r22, 0x0162, %r29
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_87:
	setx	0x240334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, d)
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 1063: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_88:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_89:
	setx	0x24003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 1076: FSQRTs	fsqrt	
T1_asi_reg_wr_35:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 1078: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb8c560a3  ! 1079: ADDCcc_I	addccc 	%r21, 0x00a3, %r28
cpu_intr_1_90:
	setx	0x26030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x240330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x24001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 1094: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 19)
	.word 0xb3a88820  ! 1098: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_59:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a488c0  ! 1100: FSUBd	fsubd	%f18, %f0, %f26
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb7a40960  ! 1104: FMULq	dis not found

cpu_intr_1_93:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a94820  ! 1111: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbba90820  ! 1115: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_60:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_61:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a54840  ! 1137: FADDd	faddd	%f52, %f0, %f26
	.word 0xb7a4c840  ! 1138: FADDd	faddd	%f50, %f0, %f58
cpu_intr_1_94:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50860  ! 1141: FADDq	dis not found

	.word 0xb32cb001  ! 1142: SLLX_I	sllx	%r18, 0x0001, %r25
T1_asi_reg_wr_36:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 1143: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_95:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44820  ! 1150: FADDs	fadds	%f17, %f0, %f27
cpu_intr_1_96:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x16, %r14
	.word 0xfef38e40  ! 1153: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_97:
	setx	0x250336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 1161: FMOVRLZ	dis not found

iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda00040  ! 1169: FMOVd	fmovd	%f0, %f30
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, c)
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba5c920  ! 1179: FMULs	fmuls	%f23, %f0, %f29
T1_asi_reg_rd_62:
	mov	0xf, %r14
	.word 0xf2db8e80  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_98:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x270100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44920  ! 1187: FMULs	fmuls	%f17, %f0, %f25
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_100:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd349000  ! 1192: SRLX_R	srlx	%r18, %r0, %r30
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_63:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a00520  ! 1200: FSQRTs	fsqrt	
T1_asi_reg_rd_64:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_65:
	mov	0x20, %r14
	.word 0xf2db8400  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_38:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 1203: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_66:
	mov	0x2b, %r14
	.word 0xfadb8e60  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbda94820  ! 1210: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xba244000  ! 1214: SUB_R	sub 	%r17, %r0, %r29
T1_asi_reg_rd_67:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_68:
	mov	0x1, %r14
	.word 0xf8db8e80  ! 1219: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbaa0820  ! 1221: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_101:
	setx	0x240135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1224: MOVcc_I	<illegal instruction>
cpu_intr_1_102:
	setx	0x270238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 1226: FSQRTq	fsqrt	
T1_asi_reg_rd_69:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_39:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 1231: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_103:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54960  ! 1233: FMULq	dis not found

iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_40:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 1237: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_71:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7500000  ! 1240: RDPR_TPC	<illegal instruction>
cpu_intr_1_104:
	setx	0x25000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 1244: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_105:
	setx	0x240301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb5a9c820  ! 1249: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5aa8820  ! 1255: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, c)
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfaa0820  ! 1266: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa0820  ! 1271: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_73:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbba98820  ! 1275: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_74:
	mov	0x31, %r14
	.word 0xfedb8e60  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_41:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1278: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbdabc820  ! 1279: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbbab4820  ! 1280: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a8c820  ! 1282: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_75:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_42:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 1286: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda00520  ! 1287: FSQRTs	fsqrt	
	.word 0xb7a48960  ! 1288: FMULq	dis not found

cpu_intr_1_106:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 1293: FSQRTq	fsqrt	
T1_asi_reg_rd_76:
	mov	0x2c, %r14
	.word 0xfedb84a0  ! 1296: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbba5c920  ! 1297: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb7a409c0  ! 1298: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb9a90820  ! 1300: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_107:
	setx	0x260112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58960  ! 1302: FMULq	dis not found

	.word 0xbd2dd000  ! 1303: SLLX_R	sllx	%r23, %r0, %r30
T1_asi_reg_rd_77:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_78:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa00020  ! 1307: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_43:
	mov	0x27, %r14
	.word 0xf2f38400  ! 1311: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5ab8820  ! 1317: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, e)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb1a00040  ! 1325: FMOVd	fmovd	%f0, %f24
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_44:
	mov	0x2f, %r14
	.word 0xf4f389e0  ! 1328: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_108:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 1333: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa549e0  ! 1337: FDIVq	dis not found

T1_asi_reg_rd_79:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfa90820  ! 1340: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_109:
	setx	0x270317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_45:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 1344: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb2b48000  ! 1346: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xb9a00540  ! 1349: FSQRTd	fsqrt	
	.word 0xb9a81820  ! 1350: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbfa58920  ! 1352: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbba40920  ! 1353: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb6acc000  ! 1354: ANDNcc_R	andncc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a58920  ! 1358: FMULs	fmuls	%f22, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a54960  ! 1362: FMULq	dis not found

	.word 0xb9a548c0  ! 1364: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xbda48940  ! 1365: FMULd	fmuld	%f18, %f0, %f30
cpu_intr_1_110:
	setx	0x260324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 1369: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a448e0  ! 1371: FSUBq	dis not found

T1_asi_reg_rd_80:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 1376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbe2520cb  ! 1377: SUB_I	sub 	%r20, 0x00cb, %r31
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_46:
	mov	0xa, %r14
	.word 0xf2f38e60  ! 1381: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_81:
	mov	0x15, %r14
	.word 0xf6db8400  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb40cc000  ! 1385: AND_R	and 	%r19, %r0, %r26
	.word 0xb3aa4820  ! 1386: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_82:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9a448c0  ! 1389: FSUBd	fsubd	%f48, %f0, %f28
	.word 0xbfa90820  ! 1393: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_111:
	setx	0x29030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_112:
	setx	0x290315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_83:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa81c20  ! 1403: FMOVRGEZ	dis not found

T1_asi_reg_wr_47:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 1407: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, b)
	.word 0xb1a44820  ! 1412: FADDs	fadds	%f17, %f0, %f24
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_113:
	setx	0x2b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8c0  ! 1422: FSUBd	fsubd	%f54, %f0, %f56
cpu_intr_1_114:
	setx	0x290215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_84:
	mov	0x25, %r14
	.word 0xf6db8e80  ! 1424: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbda00560  ! 1426: FSQRTq	fsqrt	
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_85:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_86:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a80820  ! 1437: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_48:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 1438: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a5c820  ! 1444: FADDs	fadds	%f23, %f0, %f25
T1_asi_reg_wr_49:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 1445: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a80820  ! 1449: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbdaac820  ! 1451: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3a80820  ! 1461: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a88820  ! 1463: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_87:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_50:
	mov	0x1, %r14
	.word 0xf6f38e60  ! 1469: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_88:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_115:
	setx	0x28013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_116:
	setx	0x2b0321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x290129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_89:
	mov	0x2d, %r14
	.word 0xf4db8e60  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_51:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1488: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_118:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 3)
	.word 0xb3a84820  ! 1508: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a589c0  ! 1510: FDIVd	fdivd	%f22, %f0, %f26
T1_asi_reg_rd_90:
	mov	0x29, %r14
	.word 0xf4db8e80  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_119:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_52:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 1518: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba549e0  ! 1522: FDIVq	dis not found

T1_asi_reg_rd_91:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_92:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb540000  ! 1525: RDPR_GL	<illegal instruction>
cpu_intr_1_120:
	setx	0x2a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a449e0  ! 1527: FDIVq	dis not found

cpu_intr_1_121:
	setx	0x2a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_122:
	setx	0x280210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9a0  ! 1534: FDIVs	fdivs	%f19, %f0, %f30
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_93:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_123:
	setx	0x280014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb9a50920  ! 1548: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb3a548e0  ! 1551: FSUBq	dis not found

	.word 0xb5a81c20  ! 1552: FMOVRGEZ	dis not found

T1_asi_reg_wr_53:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 1560: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3aa0820  ! 1564: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_95:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_124:
	setx	0x28030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408a0  ! 1578: FSUBs	fsubs	%f16, %f0, %f24
cpu_intr_1_125:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9c0  ! 1581: FDIVd	fdivd	%f50, %f0, %f62
T1_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb42ce10c  ! 1591: ANDN_I	andn 	%r19, 0x010c, %r26
	.word 0xba8c0000  ! 1594: ANDcc_R	andcc 	%r16, %r0, %r29
cpu_intr_1_126:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9e0  ! 1602: FDIVq	dis not found

T1_asi_reg_rd_97:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb20d206c  ! 1607: AND_I	and 	%r20, 0x006c, %r25
cpu_intr_1_127:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 1613: FMOVRLZ	dis not found

cpu_intr_1_128:
	setx	0x2a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 1615: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_98:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 1616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_54:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a81820  ! 1625: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_55:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 1626: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_129:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda588a0  ! 1635: FSUBs	fsubs	%f22, %f0, %f30
T1_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb97c4400  ! 1639: MOVR_R	movre	%r17, %r0, %r28
	.word 0xb1ab8820  ! 1640: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa84820  ! 1643: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a40840  ! 1644: FADDd	faddd	%f16, %f0, %f24
	.word 0xb5a90820  ! 1646: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_130:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449e0  ! 1654: FDIVq	dis not found

	.word 0xb7a00020  ! 1655: FMOVs	fmovs	%f0, %f27
	.word 0xbba48840  ! 1657: FADDd	faddd	%f18, %f0, %f60
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb1a4c9c0  ! 1664: FDIVd	fdivd	%f50, %f0, %f24
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb32d6001  ! 1671: SLL_I	sll 	%r21, 0x0001, %r25
	.word 0xb3ab0820  ! 1672: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb5aa8820  ! 1674: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb77d6401  ! 1675: MOVR_I	movre	%r21, 0x1, %r27
cpu_intr_1_131:
	setx	0x29023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_56:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 1677: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9a549a0  ! 1678: FDIVs	fdivs	%f21, %f0, %f28
T1_asi_reg_rd_101:
	mov	0xf, %r14
	.word 0xfedb8400  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbf480000  ! 1681: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
cpu_intr_1_132:
	setx	0x280013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_133:
	setx	0x2b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a58920  ! 1690: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb1aa0820  ! 1692: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb0bd4000  ! 1693: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xbbaa8820  ! 1694: FMOVG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa54820  ! 1696: FADDs	fadds	%f21, %f0, %f31
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3a4c820  ! 1701: FADDs	fadds	%f19, %f0, %f25
T1_asi_reg_rd_102:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 26)
	.word 0xb034a194  ! 1707: SUBC_I	orn 	%r18, 0x0194, %r24
cpu_intr_1_134:
	setx	0x280204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 1710: FMOVd	fmovd	%f0, %f60
cpu_intr_1_135:
	setx	0x29013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 1718: FMOVRNZ	dis not found

T1_asi_reg_rd_103:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 1719: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_104:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbda00020  ! 1723: FMOVs	fmovs	%f0, %f30
	.word 0xb9abc820  ! 1724: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_57:
	mov	0x30, %r14
	.word 0xf8f38e80  ! 1727: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_58:
	mov	0x15, %r14
	.word 0xfaf38e60  ! 1732: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_105:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbba84820  ! 1743: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab4820  ! 1745: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfaa4820  ! 1747: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbab42189  ! 1748: SUBCcc_I	orncc 	%r16, 0x0189, %r29
	.word 0xb7aac820  ! 1750: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7abc820  ! 1754: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_136:
	setx	0x2a0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_137:
	setx	0x28000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_59:
	mov	0x23, %r14
	.word 0xfef38e40  ! 1759: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 25)
	.word 0xb32d7001  ! 1764: SLLX_I	sllx	%r21, 0x0001, %r25
	.word 0xbda98820  ! 1767: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb22d4000  ! 1770: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xbba589e0  ! 1773: FDIVq	dis not found

T1_asi_reg_wr_60:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 1777: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbba00560  ! 1778: FSQRTq	fsqrt	
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa84820  ! 1780: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa4820  ! 1782: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_138:
	setx	0x2b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x1d, %r14
	.word 0xfcf389e0  ! 1784: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a00040  ! 1785: FMOVd	fmovd	%f0, %f24
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb53ca001  ! 1787: SRA_I	sra 	%r18, 0x0001, %r26
	.word 0x859560fe  ! 1792: WRPR_TSTATE_I	wrpr	%r21, 0x00fe, %tstate
cpu_intr_1_139:
	setx	0x290009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448e0  ! 1801: FSUBq	dis not found

	.word 0xbba81820  ! 1803: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_140:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c960  ! 1805: FMULq	dis not found

	.word 0xb1a44960  ! 1808: FMULq	dis not found

iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_141:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 1812: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_62:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 1816: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_107:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_63:
	mov	0x19, %r14
	.word 0xfaf38400  ! 1822: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbaa4820  ! 1824: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbe0dc000  ! 1829: AND_R	and 	%r23, %r0, %r31
	.word 0xbc85e1d9  ! 1831: ADDcc_I	addcc 	%r23, 0x01d9, %r30
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_108:
	mov	0xe, %r14
	.word 0xf2db8e60  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba40940  ! 1837: FMULd	fmuld	%f16, %f0, %f60
	.word 0xb3a00520  ! 1841: FSQRTs	fsqrt	
	.word 0xb4b50000  ! 1844: ORNcc_R	orncc 	%r20, %r0, %r26
cpu_intr_1_142:
	setx	0x2d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 1849: FMOVs	fmovs	%f0, %f27
	.word 0xb7a4c9e0  ! 1852: FDIVq	dis not found

	.word 0xb1a81c20  ! 1856: FMOVRGEZ	dis not found

	.word 0xb12c8000  ! 1859: SLL_R	sll 	%r18, %r0, %r24
T1_asi_reg_rd_109:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_143:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a98820  ! 1867: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_144:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6044000  ! 1877: ADD_R	add 	%r17, %r0, %r27
	.word 0xb1ab4820  ! 1878: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_145:
	setx	0x2f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 1880: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_146:
	setx	0x2f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 11)
	.word 0xb2b40000  ! 1890: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xbb641800  ! 1893: MOVcc_R	<illegal instruction>
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_110:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 1897: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_111:
	mov	0x13, %r14
	.word 0xf4db8400  ! 1900: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda84820  ! 1904: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a5c820  ! 1909: FADDs	fadds	%f23, %f0, %f28
	.word 0xbb2dc000  ! 1911: SLL_R	sll 	%r23, %r0, %r29
T1_asi_reg_wr_64:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 1912: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_147:
	setx	0x2f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448e0  ! 1915: FSUBq	dis not found

cpu_intr_1_148:
	setx	0x2f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_112:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 1917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_149:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 1922: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_113:
	mov	0x26, %r14
	.word 0xf6db8e60  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_150:
	setx	0x2f0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c940  ! 1928: FMULd	fmuld	%f50, %f0, %f60
	.word 0xb1abc820  ! 1929: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa4820  ! 1931: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_114:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 1932: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_65:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 1937: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_115:
	mov	0x12, %r14
	.word 0xfedb8e80  ! 1940: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_66:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1941: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_67:
	mov	0x23, %r14
	.word 0xf2f38e80  ! 1943: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_151:
	setx	0x2e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_152:
	setx	0x2e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48920  ! 1951: FMULs	fmuls	%f18, %f0, %f24
cpu_intr_1_153:
	setx	0x2d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_116:
	mov	0xc, %r14
	.word 0xfedb8400  ! 1953: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbd520000  ! 1958: RDPR_PIL	<illegal instruction>
T1_asi_reg_wr_68:
	mov	0x9, %r14
	.word 0xfef38e80  ! 1961: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_69:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 1962: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbb50c000  ! 1963: RDPR_TT	<illegal instruction>
	.word 0xb1a54920  ! 1965: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb6b4a139  ! 1966: SUBCcc_I	orncc 	%r18, 0x0139, %r27
	.word 0xb3a00520  ! 1971: FSQRTs	fsqrt	
	.word 0xb3a588e0  ! 1978: FSUBq	dis not found

	.word 0xbfa549a0  ! 1979: FDIVs	fdivs	%f21, %f0, %f31
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3aa4820  ! 1981: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbab50000  ! 1983: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xb0a54000  ! 1984: SUBcc_R	subcc 	%r21, %r0, %r24
	.word 0xb7a50820  ! 1991: FADDs	fadds	%f20, %f0, %f27
cpu_intr_1_154:
	setx	0x2c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_117:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_70:
	mov	0x28, %r14
	.word 0xfaf384a0  ! 2002: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbba409c0  ! 2003: FDIVd	fdivd	%f16, %f0, %f60
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda4c820  ! 2006: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_155:
	setx	0x2c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa5c860  ! 2009: FADDq	dis not found

iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 16)
	.word 0xbb500000  ! 2025: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb7aac820  ! 2026: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_156:
	setx	0x2d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a94820  ! 2034: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5aa8820  ! 2042: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_71:
	mov	0x2a, %r14
	.word 0xf4f38e60  ! 2046: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_157:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2051: FMOVRZ	dis not found

cpu_intr_1_158:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_118:
	mov	0x32, %r14
	.word 0xf6db84a0  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a508c0  ! 2057: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb1a80420  ! 2061: FMOVRZ	dis not found

	.word 0xb9a00540  ! 2063: FSQRTd	fsqrt	
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_159:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0xb, %r14
	.word 0xfcf38e80  ! 2074: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7a489e0  ! 2077: FDIVq	dis not found

cpu_intr_1_160:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 2080: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 2081: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a90820  ! 2083: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_161:
	setx	0x2f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8c0  ! 2089: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb1a489c0  ! 2091: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb484c000  ! 2092: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xbda549a0  ! 2093: FDIVs	fdivs	%f21, %f0, %f30
T1_asi_reg_wr_73:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 2094: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_121:
	mov	0x24, %r14
	.word 0xf6db89e0  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbfa548c0  ! 2099: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb3a80420  ! 2101: FMOVRZ	dis not found

	.word 0xb5a4c8c0  ! 2102: FSUBd	fsubd	%f50, %f0, %f26
T1_asi_reg_rd_122:
	mov	0x21, %r14
	.word 0xf8db8400  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_123:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbba94820  ! 2114: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9a509c0  ! 2118: FDIVd	fdivd	%f20, %f0, %f28
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a00560  ! 2120: FSQRTq	fsqrt	
	.word 0xbfa00520  ! 2122: FSQRTs	fsqrt	
	.word 0xb5a00560  ! 2124: FSQRTq	fsqrt	
T1_asi_reg_rd_124:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 2138: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfa4c960  ! 2139: FMULq	dis not found

cpu_intr_1_162:
	setx	0x2e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21dc000  ! 2143: XOR_R	xor 	%r23, %r0, %r25
T1_asi_reg_wr_75:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 2145: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_163:
	setx	0x2e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_164:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2148: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_76:
	mov	0x1a, %r14
	.word 0xfcf389e0  ! 2151: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a90820  ! 2152: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb3a408a0  ! 2153: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbf641800  ! 2154: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_125:
	mov	0x2f, %r14
	.word 0xf2db8400  ! 2157: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a81420  ! 2160: FMOVRNZ	dis not found

T1_asi_reg_wr_77:
	mov	0x2a, %r14
	.word 0xfaf389e0  ! 2161: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_165:
	setx	0x2c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_126:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_166:
	setx	0x2c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_167:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 2175: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_168:
	setx	0x2e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a00520  ! 2188: FSQRTs	fsqrt	
	.word 0xb5a50820  ! 2189: FADDs	fadds	%f20, %f0, %f26
	.word 0xbbaac820  ! 2190: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_169:
	setx	0x2f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_78:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 2195: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_128:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 2196: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_129:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 2200: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbbab8820  ! 2202: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_130:
	mov	0x1a, %r14
	.word 0xfedb8e80  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_131:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa8c820  ! 2207: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a81c20  ! 2209: FMOVRGEZ	dis not found

	.word 0xb1ab0820  ! 2211: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbda58940  ! 2212: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb9a4c820  ! 2213: FADDs	fadds	%f19, %f0, %f28
cpu_intr_1_170:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a88820  ! 2217: FMOVLE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_132:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb8358000  ! 2224: ORN_R	orn 	%r22, %r0, %r28
T1_asi_reg_wr_79:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2226: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1a449c0  ! 2228: FDIVd	fdivd	%f48, %f0, %f24
	.word 0xbda00560  ! 2229: FSQRTq	fsqrt	
cpu_intr_1_171:
	setx	0x2c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50940  ! 2231: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbba80c20  ! 2232: FMOVRLZ	dis not found

iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a81c20  ! 2239: FMOVRGEZ	dis not found

	.word 0xbda00560  ! 2240: FSQRTq	fsqrt	
	.word 0xb7a4c8a0  ! 2242: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbda5c860  ! 2244: FADDq	dis not found

	.word 0xbda81420  ! 2246: FMOVRNZ	dis not found

	.word 0xb9a84820  ! 2250: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbba81820  ! 2251: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a00520  ! 2252: FSQRTs	fsqrt	
	.word 0xb7a80420  ! 2256: FMOVRZ	dis not found

T1_asi_reg_rd_133:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_134:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 2267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_172:
	setx	0x2c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 2273: SUBcc_R	subcc 	%r22, %r0, %r30
T1_asi_reg_wr_80:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 2275: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_173:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_135:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 2282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_136:
	mov	0x2b, %r14
	.word 0xf0db89e0  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, e)
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a588a0  ! 2288: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb9ab8820  ! 2291: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a48860  ! 2292: FADDq	dis not found

	.word 0xbb3c5000  ! 2295: SRAX_R	srax	%r17, %r0, %r29
	.word 0xb9a509a0  ! 2297: FDIVs	fdivs	%f20, %f0, %f28
cpu_intr_1_174:
	setx	0x330324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 2302: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_175:
	setx	0x33030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_176:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd4000  ! 2306: XNORcc_R	xnorcc 	%r21, %r0, %r29
cpu_intr_1_177:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x31023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x310138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 2317: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a448a0  ! 2318: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbc2d203f  ! 2319: ANDN_I	andn 	%r20, 0x003f, %r30
T1_asi_reg_rd_138:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 2320: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb2342115  ! 2326: ORN_I	orn 	%r16, 0x0115, %r25
	.word 0xbda00040  ! 2327: FMOVd	fmovd	%f0, %f30
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb81ce16a  ! 2331: XOR_I	xor 	%r19, 0x016a, %r28
cpu_intr_1_180:
	setx	0x30000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_181:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0x37, %r14
	.word 0xf6f38400  ! 2338: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbc1ce1a9  ! 2343: XOR_I	xor 	%r19, 0x01a9, %r30
T1_asi_reg_wr_83:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 2346: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 2348: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_139:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a80420  ! 2354: FMOVRZ	dis not found

	.word 0xbba00540  ! 2355: FSQRTd	fsqrt	
	.word 0xb3a80820  ! 2358: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_140:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, b)
	.word 0xb9aa8820  ! 2366: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_182:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xf8db89e0  ! 2369: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9a4c9e0  ! 2373: FDIVq	dis not found

iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa5c9a0  ! 2376: FDIVs	fdivs	%f23, %f0, %f31
cpu_intr_1_183:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb015a0cd  ! 2383: OR_I	or 	%r22, 0x00cd, %r24
	.word 0xb7a94820  ! 2387: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb29c0000  ! 2388: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0xbfab8820  ! 2391: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba409e0  ! 2393: FDIVq	dis not found

T1_asi_reg_rd_142:
	mov	0x38, %r14
	.word 0xfadb8400  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1641800  ! 2396: MOVcc_R	<illegal instruction>
	.word 0xb7a40940  ! 2397: FMULd	fmuld	%f16, %f0, %f58
	.word 0xbcb54000  ! 2398: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xbfa44860  ! 2402: FADDq	dis not found

	.word 0xb9a448a0  ! 2403: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb1abc820  ! 2405: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_184:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_185:
	setx	0x33030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44960  ! 2411: FMULq	dis not found

	.word 0xbc3ce1e8  ! 2414: XNOR_I	xnor 	%r19, 0x01e8, %r30
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 13)
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_186:
	setx	0x300307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_187:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_143:
	mov	0x5, %r14
	.word 0xfadb8400  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_85:
	mov	0x13, %r14
	.word 0xfef38e40  ! 2428: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb004a175  ! 2432: ADD_I	add 	%r18, 0x0175, %r24
T1_asi_reg_rd_144:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1a508c0  ! 2441: FSUBd	fsubd	%f20, %f0, %f24
T1_asi_reg_wr_86:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 2442: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5aa0820  ! 2443: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_188:
	setx	0x320109, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x37, %r14
	.word 0xfedb89e0  ! 2447: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_146:
	mov	0x26, %r14
	.word 0xfedb8400  ! 2448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_87:
	mov	0x2e, %r14
	.word 0xf2f389e0  ! 2450: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_147:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 2455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_189:
	setx	0x300307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 2462: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xba040000  ! 2465: ADD_R	add 	%r16, %r0, %r29
	.word 0xbba4c9e0  ! 2468: FDIVq	dis not found

	.word 0xb5a44840  ! 2469: FADDd	faddd	%f48, %f0, %f26
	.word 0xb805c000  ! 2470: ADD_R	add 	%r23, %r0, %r28
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_148:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3a00520  ! 2476: FSQRTs	fsqrt	
	.word 0xb7a489a0  ! 2477: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb3a5c8a0  ! 2481: FSUBs	fsubs	%f23, %f0, %f25
T1_asi_reg_wr_89:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 2483: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_90:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 2484: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_190:
	setx	0x320132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508c0  ! 2487: FSUBd	fsubd	%f20, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb21d4000  ! 2489: XOR_R	xor 	%r21, %r0, %r25
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3ab8820  ! 2494: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a5c820  ! 2500: FADDs	fadds	%f23, %f0, %f26
	.word 0xb3a48920  ! 2514: FMULs	fmuls	%f18, %f0, %f25
	.word 0xb3a81c20  ! 2517: FMOVRGEZ	dis not found

T1_asi_reg_wr_91:
	mov	0x13, %r14
	.word 0xfcf384a0  ! 2518: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a40840  ! 2519: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_rd_149:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a9c820  ! 2524: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa81c20  ! 2529: FMOVRGEZ	dis not found

iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_150:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3a88820  ! 2534: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_92:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 2535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_93:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 2538: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb2d2001  ! 2542: SLL_I	sll 	%r20, 0x0001, %r29
cpu_intr_1_191:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48920  ! 2548: FMULs	fmuls	%f18, %f0, %f24
T1_asi_reg_rd_151:
	mov	0x20, %r14
	.word 0xf4db8400  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_152:
	mov	0x26, %r14
	.word 0xf4db8e80  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3ab4820  ! 2553: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_94:
	mov	0x29, %r14
	.word 0xfef38e80  ! 2554: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_192:
	setx	0x33002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de1ca  ! 2559: AND_I	and 	%r23, 0x01ca, %r26
T1_asi_reg_wr_95:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2561: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_153:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 2562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a44840  ! 2563: FADDd	faddd	%f48, %f0, %f56
	.word 0xbfa00020  ! 2565: FMOVs	fmovs	%f0, %f31
	.word 0xb3a5c940  ! 2569: FMULd	fmuld	%f54, %f0, %f56
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_154:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1a5c920  ! 2572: FMULs	fmuls	%f23, %f0, %f24
	.word 0xb0c4c000  ! 2573: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb7a50840  ! 2575: FADDd	faddd	%f20, %f0, %f58
	.word 0xbfa00540  ! 2577: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa00040  ! 2581: FMOVd	fmovd	%f0, %f62
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba48840  ! 2583: FADDd	faddd	%f18, %f0, %f60
	.word 0xb3a449e0  ! 2584: FDIVq	dis not found

	.word 0xbc2c6001  ! 2586: ANDN_I	andn 	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7a81c20  ! 2590: FMOVRGEZ	dis not found

	.word 0xb7a4c940  ! 2591: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb7a4c8e0  ! 2592: FSUBq	dis not found

T1_asi_reg_wr_96:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 2594: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a00540  ! 2598: FSQRTd	fsqrt	
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a80820  ! 2602: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa50920  ! 2605: FMULs	fmuls	%f20, %f0, %f31
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 16)
	.word 0xb0c5e0b4  ! 2607: ADDCcc_I	addccc 	%r23, 0x00b4, %r24
	.word 0xb7a00560  ! 2609: FSQRTq	fsqrt	
	.word 0xbda00540  ! 2611: FSQRTd	fsqrt	
	.word 0xbfa5c9e0  ! 2612: FDIVq	dis not found

cpu_intr_1_193:
	setx	0x330325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_194:
	setx	0x300327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_195:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_196:
	setx	0x320305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 2622: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbba40920  ! 2624: FMULs	fmuls	%f16, %f0, %f29
	.word 0xbfa48940  ! 2626: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb5a00540  ! 2629: FSQRTd	fsqrt	
cpu_intr_1_197:
	setx	0x300121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x32010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 2634: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_199:
	setx	0x31001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588e0  ! 2645: FSUBq	dis not found

	.word 0xbd2cd000  ! 2647: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xbda409c0  ! 2648: FDIVd	fdivd	%f16, %f0, %f30
cpu_intr_1_200:
	setx	0x300124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa409e0  ! 2653: FDIVq	dis not found

iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_156:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2658: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9aac820  ! 2661: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_201:
	setx	0x33003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_157:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_158:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb64460fa  ! 2673: ADDC_I	addc 	%r17, 0x00fa, %r27
	.word 0xb2c54000  ! 2674: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xb1a4c9c0  ! 2675: FDIVd	fdivd	%f50, %f0, %f24
T1_asi_reg_rd_159:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 2676: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a40940  ! 2678: FMULd	fmuld	%f16, %f0, %f56
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1aa8820  ! 2683: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81c20  ! 2684: FMOVRGEZ	dis not found

	.word 0xbfa9c820  ! 2685: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_203:
	setx	0x30010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_160:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9a58820  ! 2696: FADDs	fadds	%f22, %f0, %f28
	.word 0xbe250000  ! 2698: SUB_R	sub 	%r20, %r0, %r31
	.word 0xb9a40940  ! 2699: FMULd	fmuld	%f16, %f0, %f28
	.word 0xbe958000  ! 2700: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xb5a00560  ! 2703: FSQRTq	fsqrt	
cpu_intr_1_204:
	setx	0x330006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_205:
	setx	0x320029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_98:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 2710: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9aa8820  ! 2720: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 2722: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb6358000  ! 2724: SUBC_R	orn 	%r22, %r0, %r27
cpu_intr_1_206:
	setx	0x32010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 8)
	.word 0xb035e05e  ! 2729: ORN_I	orn 	%r23, 0x005e, %r24
cpu_intr_1_207:
	setx	0x34033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409a0  ! 2732: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb2c5a0d2  ! 2737: ADDCcc_I	addccc 	%r22, 0x00d2, %r25
	.word 0xbfa8c820  ! 2738: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_161:
	mov	0x2c, %r14
	.word 0xf4db8400  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_208:
	setx	0x370320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_162:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_209:
	setx	0x360114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd343001  ! 2747: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb1a80c20  ! 2749: FMOVRLZ	dis not found

T1_asi_reg_wr_100:
	mov	0x19, %r14
	.word 0xfaf38e80  ! 2751: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_101:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 2752: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_210:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 2758: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbba80420  ! 2762: FMOVRZ	dis not found

cpu_intr_1_211:
	setx	0x36011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d6124  ! 2764: XNOR_I	xnor 	%r21, 0x0124, %r29
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_163:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_212:
	setx	0x360011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_213:
	setx	0x36001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc48000  ! 2774: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xbda94820  ! 2775: FMOVCS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_214:
	setx	0x34011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a589c0  ! 2779: FDIVd	fdivd	%f22, %f0, %f58
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a00540  ! 2781: FSQRTd	fsqrt	
	.word 0xbda81c20  ! 2782: FMOVRGEZ	dis not found

cpu_intr_1_215:
	setx	0x360316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 2790: FSUBs	fsubs	%f23, %f0, %f26
cpu_intr_1_216:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 2793: FSQRTd	fsqrt	
	.word 0xb1a00520  ! 2794: FSQRTs	fsqrt	
	.word 0xb3a00560  ! 2796: FSQRTq	fsqrt	
	.word 0xb5aa0820  ! 2798: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_217:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2801: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb0bd6164  ! 2802: XNORcc_I	xnorcc 	%r21, 0x0164, %r24
T1_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 2803: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_104:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 2804: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a80c20  ! 2809: FMOVRLZ	dis not found

	.word 0xb28da05c  ! 2811: ANDcc_I	andcc 	%r22, 0x005c, %r25
cpu_intr_1_218:
	setx	0x35003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 2817: FMOVs	fmovs	%f0, %f27
	.word 0xb28d8000  ! 2818: ANDcc_R	andcc 	%r22, %r0, %r25
	.word 0xb4ada050  ! 2819: ANDNcc_I	andncc 	%r22, 0x0050, %r26
	.word 0xbfa80420  ! 2820: FMOVRZ	dis not found

cpu_intr_1_219:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 2824: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a50840  ! 2825: FADDd	faddd	%f20, %f0, %f24
	.word 0xb5a00020  ! 2828: FMOVs	fmovs	%f0, %f26
	.word 0xbda4c9e0  ! 2829: FDIVq	dis not found

	.word 0xb9a44960  ! 2830: FMULq	dis not found

cpu_intr_1_220:
	setx	0x360008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_105:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 2834: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a5c8c0  ! 2835: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xbba5c820  ! 2839: FADDs	fadds	%f23, %f0, %f29
T1_asi_reg_rd_164:
	mov	0x2b, %r14
	.word 0xfadb8e80  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_106:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 2841: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a00520  ! 2842: FSQRTs	fsqrt	
T1_asi_reg_wr_107:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 2843: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_165:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a8c820  ! 2853: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_108:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 2855: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 17)
	.word 0xba340000  ! 2857: ORN_R	orn 	%r16, %r0, %r29
	.word 0xbba409a0  ! 2858: FDIVs	fdivs	%f16, %f0, %f29
cpu_intr_1_221:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_109:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 2861: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_222:
	setx	0x360323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_223:
	setx	0x36010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c8e0  ! 2868: FSUBq	dis not found

	.word 0xbba90820  ! 2870: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7480000  ! 2875: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 2880: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbda00520  ! 2881: FSQRTs	fsqrt	
	.word 0xb7a449e0  ! 2888: FDIVq	dis not found

cpu_intr_1_224:
	setx	0x36003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2890: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_225:
	setx	0x36023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409c0  ! 2894: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbfaa0820  ! 2895: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48820  ! 2898: FADDs	fadds	%f18, %f0, %f26
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_111:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 2902: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7a5c9e0  ! 2903: FDIVq	dis not found

	.word 0xbba00020  ! 2904: FMOVs	fmovs	%f0, %f29
	.word 0xb5a00040  ! 2905: FMOVd	fmovd	%f0, %f26
	.word 0xb3a4c9a0  ! 2907: FDIVs	fdivs	%f19, %f0, %f25
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_112:
	mov	0x15, %r14
	.word 0xf8f384a0  ! 2911: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a8c820  ! 2915: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda40920  ! 2917: FMULs	fmuls	%f16, %f0, %f30
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 8)
	.word 0xbb2d7001  ! 2920: SLLX_I	sllx	%r21, 0x0001, %r29
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_113:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 3)
	.word 0xba048000  ! 2925: ADD_R	add 	%r18, %r0, %r29
T1_asi_reg_rd_166:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 2928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1a408a0  ! 2929: FSUBs	fsubs	%f16, %f0, %f24
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_114:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 2934: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbba449c0  ! 2938: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb1a4c820  ! 2939: FADDs	fadds	%f19, %f0, %f24
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_226:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 2949: FMOVRZ	dis not found

cpu_intr_1_227:
	setx	0x340329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_228:
	setx	0x34000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x340024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_230:
	setx	0x36000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58840  ! 2965: FADDd	faddd	%f22, %f0, %f26
	.word 0xb42c8000  ! 2966: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xb3a00520  ! 2967: FSQRTs	fsqrt	
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a80820  ! 2970: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_167:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 2971: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_231:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda00560  ! 2982: FSQRTq	fsqrt	
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5ab0820  ! 2986: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_115:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2987: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbfaa0820  ! 2988: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_169:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda44860  ! 2997: FADDq	dis not found

T1_asi_reg_wr_116:
	mov	0x27, %r14
	.word 0xf4f38e80  ! 2998: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 2999: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1a9c820  ! 3000: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3001: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbd34a001  ! 3002: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xbfaa4820  ! 3004: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbdab8820  ! 3006: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a50940  ! 3008: FMULd	fmuld	%f20, %f0, %f56
cpu_intr_1_232:
	setx	0x370235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 3010: FSQRTq	fsqrt	
	.word 0xb9aac820  ! 3012: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb02da17b  ! 3013: ANDN_I	andn 	%r22, 0x017b, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a588e0  ! 3016: FSUBq	dis not found

cpu_intr_1_233:
	setx	0x37032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d1000  ! 3020: SLLX_R	sllx	%r20, %r0, %r26
cpu_intr_1_234:
	setx	0x370100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_170:
	mov	0x1b, %r14
	.word 0xf4db8e80  ! 3026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_171:
	mov	0x22, %r14
	.word 0xfcdb8e80  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda44960  ! 3033: FMULq	dis not found

	.word 0xb3a00020  ! 3035: FMOVs	fmovs	%f0, %f25
	.word 0xb3a00520  ! 3036: FSQRTs	fsqrt	
	.word 0xbfabc820  ! 3041: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_235:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_172:
	mov	0x17, %r14
	.word 0xfadb8400  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9a548e0  ! 3045: FSUBq	dis not found

T1_asi_reg_rd_173:
	mov	0x37, %r14
	.word 0xfedb8e60  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0x8d95a0c2  ! 3047: WRPR_PSTATE_I	wrpr	%r22, 0x00c2, %pstate
T1_asi_reg_rd_174:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb4b4e02e  ! 3049: SUBCcc_I	orncc 	%r19, 0x002e, %r26
T1_asi_reg_rd_175:
	mov	0x1e, %r14
	.word 0xfedb8e60  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aac820  ! 3059: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_236:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 3064: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_237:
	setx	0x370326, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_176:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 3068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7a448c0  ! 3069: FSUBd	fsubd	%f48, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_238:
	setx	0x340218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 3078: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_177:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 3081: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, c)
	.word 0xbdab0820  ! 3086: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_178:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 3087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_119:
	mov	0x25, %r14
	.word 0xfef389e0  ! 3093: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb80d8000  ! 3095: AND_R	and 	%r22, %r0, %r28
T1_asi_reg_rd_179:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5a409c0  ! 3106: FDIVd	fdivd	%f16, %f0, %f26
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 29)
	.word 0xbebd0000  ! 3112: XNORcc_R	xnorcc 	%r20, %r0, %r31
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a9c820  ! 3120: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbda589e0  ! 3121: FDIVq	dis not found

cpu_intr_1_239:
	setx	0x360225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_120:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 3125: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7a48820  ! 3126: FADDs	fadds	%f18, %f0, %f27
	.word 0xb9aa4820  ! 3127: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_240:
	setx	0x35023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x340009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 3134: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 3138: FMOVRNZ	dis not found

iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 19)
	.word 0xbc15c000  ! 3143: OR_R	or 	%r23, %r0, %r30
	.word 0xb9a81820  ! 3149: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_rd_181:
	mov	0x37, %r14
	.word 0xfcdb89e0  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 3152: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_242:
	setx	0x370032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_243:
	setx	0x360139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a9c820  ! 3158: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00520  ! 3159: FSQRTs	fsqrt	
cpu_intr_1_244:
	setx	0x360012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d8000  ! 3163: ANDcc_R	andcc 	%r22, %r0, %r24
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a449c0  ! 3170: FDIVd	fdivd	%f48, %f0, %f24
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_245:
	setx	0x340330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548e0  ! 3175: FSUBq	dis not found

cpu_intr_1_246:
	setx	0x34011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_123:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 3177: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_124:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 3178: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a84820  ! 3179: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_247:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_248:
	setx	0x350125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488a0  ! 3184: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb20de072  ! 3186: AND_I	and 	%r23, 0x0072, %r25
T1_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 3193: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7a80820  ! 3197: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_126:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 3211: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5a5c9c0  ! 3212: FDIVd	fdivd	%f54, %f0, %f26
cpu_intr_1_249:
	setx	0x3b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x3b0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 3220: RDPR_TNPC	<illegal instruction>
	.word 0xbbaac820  ! 3221: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_251:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_252:
	setx	0x3a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 3229: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_127:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3231: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb43561e4  ! 3232: SUBC_I	orn 	%r21, 0x01e4, %r26
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_253:
	setx	0x3a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 3237: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_254:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda88820  ! 3242: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80c20  ! 3246: FMOVRLZ	dis not found

	.word 0xb1ab0820  ! 3248: FMOVGU	fmovs	%fcc1, %f0, %f24
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_255:
	setx	0x3b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_129:
	mov	0x2b, %r14
	.word 0xfef38e80  ! 3259: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_256:
	setx	0x3b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 3263: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a9c820  ! 3264: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00020  ! 3265: FMOVs	fmovs	%f0, %f24
	.word 0xb9a00540  ! 3266: FSQRTd	fsqrt	
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3c)
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_257:
	setx	0x380001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_131:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 3274: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_258:
	setx	0x38021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 3280: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_182:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbc0c8000  ! 3284: AND_R	and 	%r18, %r0, %r30
	.word 0xb7a81820  ! 3285: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_133:
	mov	0x20, %r14
	.word 0xfef38400  ! 3288: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_259:
	setx	0x39012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_134:
	mov	0xe, %r14
	.word 0xf6f389e0  ! 3290: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbbabc820  ! 3292: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa81c20  ! 3295: FMOVRGEZ	dis not found

	.word 0xb3a00040  ! 3297: FMOVd	fmovd	%f0, %f56
T1_asi_reg_wr_135:
	mov	0x34, %r14
	.word 0xf8f389e0  ! 3298: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_260:
	setx	0x39031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 3304: MOVcc_R	<illegal instruction>
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a44920  ! 3307: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb045a0eb  ! 3308: ADDC_I	addc 	%r22, 0x00eb, %r24
	.word 0xb33d8000  ! 3312: SRA_R	sra 	%r22, %r0, %r25
T1_asi_reg_rd_183:
	mov	0x15, %r14
	.word 0xf0db89e0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbec52005  ! 3315: ADDCcc_I	addccc 	%r20, 0x0005, %r31
T1_asi_reg_wr_136:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 3317: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_261:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb415a179  ! 3327: OR_I	or 	%r22, 0x0179, %r26
	.word 0xbba5c8a0  ! 3329: FSUBs	fsubs	%f23, %f0, %f29
cpu_intr_1_262:
	setx	0x3b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_263:
	setx	0x3b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 3335: FMOVRGEZ	dis not found

T1_asi_reg_wr_137:
	mov	0x29, %r14
	.word 0xfef384a0  ! 3337: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbbaa0820  ! 3338: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a548a0  ! 3342: FSUBs	fsubs	%f21, %f0, %f27
T1_asi_reg_rd_184:
	mov	0x23, %r14
	.word 0xf0db89e0  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a8c820  ! 3347: FMOVL	fmovs	%fcc1, %f0, %f27
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_185:
	mov	0xa, %r14
	.word 0xf6db8400  ! 3349: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 3352: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfaac820  ! 3355: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 3362: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a4c9c0  ! 3368: FDIVd	fdivd	%f50, %f0, %f56
cpu_intr_1_264:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_265:
	setx	0x39022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58820  ! 3371: FADDs	fadds	%f22, %f0, %f28
	.word 0xbfa80420  ! 3373: FMOVRZ	dis not found

	.word 0xb9a549a0  ! 3375: FDIVs	fdivs	%f21, %f0, %f28
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1ab4820  ! 3380: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a40960  ! 3385: FMULq	dis not found

T1_asi_reg_rd_186:
	mov	0x11, %r14
	.word 0xf4db8400  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5a5c860  ! 3390: FADDq	dis not found

	.word 0xb53d4000  ! 3392: SRA_R	sra 	%r21, %r0, %r26
	.word 0xbbabc820  ! 3393: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa4820  ! 3399: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a4c860  ! 3401: FADDq	dis not found

	.word 0xb5a548e0  ! 3402: FSUBq	dis not found

	.word 0xb7a94820  ! 3403: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbda84820  ! 3404: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a58960  ! 3406: FMULq	dis not found

T1_asi_reg_rd_187:
	mov	0xd, %r14
	.word 0xfcdb8400  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_140:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 3415: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb28de0e8  ! 3416: ANDcc_I	andcc 	%r23, 0x00e8, %r25
	.word 0xb5a80c20  ! 3418: FMOVRLZ	dis not found

T1_asi_reg_rd_188:
	mov	0x18, %r14
	.word 0xf2db8e80  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb3a80c20  ! 3421: FMOVRLZ	dis not found

	.word 0xbe4521d9  ! 3423: ADDC_I	addc 	%r20, 0x01d9, %r31
cpu_intr_1_266:
	setx	0x39012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x2f, %r14
	.word 0xf8f38400  ! 3434: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_189:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb6c54000  ! 3440: ADDCcc_R	addccc 	%r21, %r0, %r27
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_142:
	mov	0x25, %r14
	.word 0xfef38e60  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a50940  ! 3450: FMULd	fmuld	%f20, %f0, %f26
T1_asi_reg_wr_143:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 3452: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 24)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_190:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 3463: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_191:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 3465: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7a50920  ! 3466: FMULs	fmuls	%f20, %f0, %f27
	.word 0xb6bda0d5  ! 3467: XNORcc_I	xnorcc 	%r22, 0x00d5, %r27
	.word 0xb3ab4820  ! 3470: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c8e0  ! 3472: FSUBq	dis not found

	.word 0xbfa80820  ! 3474: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81c20  ! 3475: FMOVRGEZ	dis not found

iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb4352029  ! 3478: SUBC_I	orn 	%r20, 0x0029, %r26
T1_asi_reg_rd_192:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7a94820  ! 3482: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5aa8820  ! 3486: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00020  ! 3488: FMOVs	fmovs	%f0, %f25
	.word 0xbda488a0  ! 3496: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xbb500000  ! 3498: RDPR_TPC	<illegal instruction>
T1_asi_reg_rd_193:
	mov	0xd, %r14
	.word 0xf2db8e80  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfa5c9a0  ! 3500: FDIVs	fdivs	%f23, %f0, %f31
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbfa44920  ! 3504: FMULs	fmuls	%f17, %f0, %f31
T1_asi_reg_rd_194:
	mov	0x15, %r14
	.word 0xf2db89e0  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_267:
	setx	0x39033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c820  ! 3510: FADDs	fadds	%f23, %f0, %f31
T1_asi_reg_rd_195:
	mov	0x14, %r14
	.word 0xf8db84a0  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_144:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 3512: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda80820  ! 3519: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_268:
	setx	0x3b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48420eb  ! 3522: ADDcc_I	addcc 	%r16, 0x00eb, %r26
T1_asi_reg_rd_196:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 3524: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00520  ! 3532: FSQRTs	fsqrt	
	.word 0xbda5c8c0  ! 3535: FSUBd	fsubd	%f54, %f0, %f30
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_269:
	setx	0x3b0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e13d  ! 3543: WRPR_TSTATE_I	wrpr	%r23, 0x013d, %tstate
T1_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 3544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_270:
	setx	0x3a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_271:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3553: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9a94820  ! 3554: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 1)
	.word 0xbe8de065  ! 3559: ANDcc_I	andcc 	%r23, 0x0065, %r31
	.word 0xb8a521ff  ! 3561: SUBcc_I	subcc 	%r20, 0x01ff, %r28
	.word 0xbda54920  ! 3564: FMULs	fmuls	%f21, %f0, %f30
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_272:
	setx	0x3a0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 3573: FMOVRZ	dis not found

	.word 0xba140000  ! 3581: OR_R	or 	%r16, %r0, %r29
T1_asi_reg_rd_199:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_145:
	mov	0x1c, %r14
	.word 0xf2f384a0  ! 3589: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbe354000  ! 3590: ORN_R	orn 	%r21, %r0, %r31
	.word 0xbfa509e0  ! 3592: FDIVq	dis not found

T1_asi_reg_rd_200:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 3594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xba9dc000  ! 3595: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xbda81c20  ! 3596: FMOVRGEZ	dis not found

iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba00520  ! 3598: FSQRTs	fsqrt	
	.word 0xbfa4c920  ! 3599: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbfa5c9e0  ! 3600: FDIVq	dis not found

cpu_intr_1_273:
	setx	0x20003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa00040  ! 3604: FMOVd	fmovd	%f0, %f62
T1_asi_reg_wr_146:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 3605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_147:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 3607: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x8f902002  ! 3608: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbb3dd000  ! 3611: SRAX_R	srax	%r23, %r0, %r29
	.word 0xb1a00520  ! 3612: FSQRTs	fsqrt	
	.word 0xbba449a0  ! 3613: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xbfaa4820  ! 3614: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 3)
	.word 0xbf2db001  ! 3617: SLLX_I	sllx	%r22, 0x0001, %r31
T1_asi_reg_rd_201:
	mov	0x29, %r14
	.word 0xf0db8e80  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb4058000  ! 3619: ADD_R	add 	%r22, %r0, %r26
cpu_intr_1_274:
	setx	0x390309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 3622: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00520  ! 3623: FSQRTs	fsqrt	
cpu_intr_1_275:
	setx	0x3b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 3628: FMOVRNZ	dis not found

	.word 0xb5355000  ! 3630: SRLX_R	srlx	%r21, %r0, %r26
cpu_intr_1_276:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24a1e3  ! 3633: SUB_I	sub 	%r18, 0x01e3, %r31
T1_asi_reg_rd_202:
	mov	0xf, %r14
	.word 0xf0db8400  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_148:
	mov	0xc, %r14
	.word 0xfef384a0  ! 3642: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_277:
	setx	0x3c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0056154  ! 3644: ADD_I	add 	%r21, 0x0154, %r24
	.word 0xb3a80820  ! 3646: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a90820  ! 3650: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a84820  ! 3652: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab4820  ! 3654: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a58860  ! 3661: FADDq	dis not found

	.word 0xba44a1ab  ! 3662: ADDC_I	addc 	%r18, 0x01ab, %r29
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbbabc820  ! 3664: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba549e0  ! 3668: FDIVq	dis not found

cpu_intr_1_278:
	setx	0x3e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_203:
	mov	0x29, %r14
	.word 0xf4db8e80  ! 3679: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbfa00520  ! 3683: FSQRTs	fsqrt	
	.word 0xbda81c20  ! 3684: FMOVRGEZ	dis not found

cpu_intr_1_279:
	setx	0x3e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x3d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad21f6  ! 3690: ANDNcc_I	andncc 	%r20, 0x01f6, %r29
T1_asi_reg_rd_204:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_149:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 3693: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a589a0  ! 3694: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xb3a88820  ! 3696: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a58860  ! 3700: FADDq	dis not found

T1_asi_reg_wr_150:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 3701: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_205:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 3704: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a90820  ! 3708: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba48820  ! 3710: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a5c840  ! 3712: FADDd	faddd	%f54, %f0, %f58
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_151:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 3715: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_206:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a88820  ! 3729: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_207:
	mov	0x1d, %r14
	.word 0xf0db8400  ! 3732: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_281:
	setx	0x3f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 3734: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_208:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 3739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_209:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_210:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb9a548a0  ! 3744: FSUBs	fsubs	%f21, %f0, %f28
T1_asi_reg_rd_211:
	mov	0x36, %r14
	.word 0xfcdb8e60  ! 3745: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3a50840  ! 3747: FADDd	faddd	%f20, %f0, %f56
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_282:
	setx	0x3c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a548c0  ! 3753: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbbaa0820  ! 3755: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00040  ! 3757: FMOVd	fmovd	%f0, %f28
	.word 0xb9aac820  ! 3758: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_283:
	setx	0x3d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 3760: FMOVs	fmovs	%f0, %f25
	.word 0xbfa40960  ! 3763: FMULq	dis not found

	.word 0xb23cc000  ! 3764: XNOR_R	xnor 	%r19, %r0, %r25
	.word 0xb9a98820  ! 3766: FMOVNEG	fmovs	%fcc1, %f0, %f28
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 11)
	.word 0xbb357001  ! 3768: SRLX_I	srlx	%r21, 0x0001, %r29
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba00020  ! 3773: FMOVs	fmovs	%f0, %f29
	.word 0xbda50820  ! 3774: FADDs	fadds	%f20, %f0, %f30
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 20)
	.word 0xb33d8000  ! 3781: SRA_R	sra 	%r22, %r0, %r25
	.word 0xb9abc820  ! 3782: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_284:
	setx	0x3e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 3785: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb1358000  ! 3786: SRL_R	srl 	%r22, %r0, %r24
T1_asi_reg_rd_212:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_285:
	setx	0x3f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_152:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 3793: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a00540  ! 3794: FSQRTd	fsqrt	
	.word 0xb3a81820  ! 3800: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb5a84820  ! 3802: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb551c000  ! 3808: RDPR_TL	<illegal instruction>
	.word 0xb72dc000  ! 3813: SLL_R	sll 	%r23, %r0, %r27
	.word 0xb7ab8820  ! 3815: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 23)
	.word 0xbdaac820  ! 3821: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbda80420  ! 3822: FMOVRZ	dis not found

iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_153:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 3824: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_154:
	mov	0x29, %r14
	.word 0xfef384a0  ! 3827: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3a588a0  ! 3828: FSUBs	fsubs	%f22, %f0, %f25
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_213:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a81c20  ! 3833: FMOVRGEZ	dis not found

iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 37)
	.word 0xbb7ce401  ! 3838: MOVR_I	movre	%r19, 0x1, %r29
cpu_intr_1_286:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40840  ! 3843: FADDd	faddd	%f16, %f0, %f62
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 2)
	.word 0xbc9cc000  ! 3849: XORcc_R	xorcc 	%r19, %r0, %r30
T1_asi_reg_rd_214:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbc9421da  ! 3853: ORcc_I	orcc 	%r16, 0x01da, %r30
	.word 0xbba81420  ! 3854: FMOVRNZ	dis not found

T1_asi_reg_rd_215:
	mov	0x1e, %r14
	.word 0xf4db8e80  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a81c20  ! 3863: FMOVRGEZ	dis not found

	.word 0xb1a4c960  ! 3865: FMULq	dis not found

cpu_intr_1_287:
	setx	0x3e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 3867: SUBCcc_R	orncc 	%r16, %r0, %r29
T1_asi_reg_rd_216:
	mov	0x1d, %r14
	.word 0xf2db8400  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a589c0  ! 3870: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb9a00560  ! 3871: FSQRTq	fsqrt	
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa58920  ! 3874: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbba00540  ! 3876: FSQRTd	fsqrt	
T1_asi_reg_wr_155:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 3877: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5a48840  ! 3880: FADDd	faddd	%f18, %f0, %f26
	.word 0xb5a94820  ! 3882: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_288:
	setx	0x3e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c6001  ! 3888: SRA_I	sra 	%r17, 0x0001, %r28
cpu_intr_1_289:
	setx	0x3c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3891: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_290:
	setx	0x3f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 3896: FDIVq	dis not found

cpu_intr_1_291:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, b)
	.word 0xb3a50920  ! 3906: FMULs	fmuls	%f20, %f0, %f25
T1_asi_reg_rd_217:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a98820  ! 3912: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_156:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 3913: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7aac820  ! 3916: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aac820  ! 3917: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xba9dc000  ! 3918: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb3a80820  ! 3923: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_292:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5e021  ! 3926: ADDCcc_I	addccc 	%r23, 0x0021, %r30
cpu_intr_1_293:
	setx	0x3f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 3930: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xbda4c920  ! 3932: FMULs	fmuls	%f19, %f0, %f30
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_157:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 3934: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa44920  ! 3937: FMULs	fmuls	%f17, %f0, %f31
T1_asi_reg_rd_218:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 3938: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_294:
	setx	0x3c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c860  ! 3944: FADDq	dis not found

cpu_intr_1_295:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 3951: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_158:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 3953: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba8c820  ! 3954: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda84820  ! 3955: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_159:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 3958: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_219:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 3961: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_296:
	setx	0x3d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_297:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50840  ! 3975: FADDd	faddd	%f20, %f0, %f58
	.word 0xb5ab8820  ! 3976: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a509e0  ! 3977: FDIVq	dis not found

cpu_intr_1_299:
	setx	0x3f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_220:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a88820  ! 3980: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda54820  ! 3985: FADDs	fadds	%f21, %f0, %f30
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_300:
	setx	0x3d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x3c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3992: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_221:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_302:
	setx	0x3f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa409e0  ! 4002: FDIVq	dis not found

	.word 0xb1a5c8a0  ! 4003: FSUBs	fsubs	%f23, %f0, %f24
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_222:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb23ce057  ! 4008: XNOR_I	xnor 	%r19, 0x0057, %r25
	.word 0x81956138  ! 4009: WRPR_TPC_I	wrpr	%r21, 0x0138, %tpc
T1_asi_reg_rd_223:
	mov	0x28, %r14
	.word 0xf0db84a0  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_161:
	mov	0x4, %r14
	.word 0xf8f38400  ! 4013: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb89d0000  ! 4015: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xb7a48840  ! 4016: FADDd	faddd	%f18, %f0, %f58
	.word 0xb5a81820  ! 4020: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9aa8820  ! 4022: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_303:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_224:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_304:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 4038: FSQRTd	fsqrt	
cpu_intr_1_305:
	setx	0x3e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_306:
	setx	0x3d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48820  ! 4048: FADDs	fadds	%f18, %f0, %f27
cpu_intr_1_307:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_162:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 4051: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_163:
	mov	0x38, %r14
	.word 0xf6f384a0  ! 4054: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_164:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 4055: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_308:
	setx	0x3f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3cc000  ! 4057: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xbfa9c820  ! 4058: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c940  ! 4059: FMULd	fmuld	%f50, %f0, %f60
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_225:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 4063: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, f)
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, c)
	.word 0xbda9c820  ! 4069: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_226:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5ab4820  ! 4078: FMOVCC	fmovs	%fcc1, %f0, %f26
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb1a8c820  ! 4080: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 4082: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xba9420ae  ! 4083: ORcc_I	orcc 	%r16, 0x00ae, %r29
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_165:
	mov	0x26, %r14
	.word 0xfef389e0  ! 4086: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_309:
	setx	0x3c0235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_310:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_311:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 4095: FSQRTd	fsqrt	
	.word 0x8595e0d0  ! 4096: WRPR_TSTATE_I	wrpr	%r23, 0x00d0, %tstate
T1_asi_reg_wr_166:
	mov	0x11, %r14
	.word 0xfaf389e0  ! 4097: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_167:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 4099: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_227:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_312:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda48920  ! 4123: FMULs	fmuls	%f18, %f0, %f30
cpu_intr_1_313:
	setx	0x40031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 4127: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_314:
	setx	0x420136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08de04b  ! 4131: ANDcc_I	andcc 	%r23, 0x004b, %r24
	.word 0xbba94820  ! 4134: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a5c840  ! 4137: FADDd	faddd	%f54, %f0, %f28
cpu_intr_1_315:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a00560  ! 4145: FSQRTq	fsqrt	
T1_asi_reg_wr_168:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4146: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_228:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_316:
	setx	0x430332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40940  ! 4152: FMULd	fmuld	%f16, %f0, %f62
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_317:
	setx	0x430028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d3001  ! 4159: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xb5a80c20  ! 4160: FMOVRLZ	dis not found

cpu_intr_1_318:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 4164: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a94820  ! 4167: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_229:
	mov	0x3, %r14
	.word 0xf4db8e60  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_319:
	setx	0x40033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_320:
	setx	0x40001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 10)
	.word 0xbdaa4820  ! 4175: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 34)
	.word 0xbbab8820  ! 4179: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbaac61fd  ! 4180: ANDNcc_I	andncc 	%r17, 0x01fd, %r29
T1_asi_reg_wr_170:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 4185: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a00020  ! 4187: FMOVs	fmovs	%f0, %f27
	.word 0xbda5c9c0  ! 4190: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xbda508a0  ! 4193: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb3a84820  ! 4195: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_171:
	mov	0x27, %r14
	.word 0xf6f38e60  ! 4197: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda80820  ! 4205: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 4207: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_321:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c960  ! 4212: FMULq	dis not found

	.word 0xbba50840  ! 4214: FADDd	faddd	%f20, %f0, %f60
	.word 0xbfa549c0  ! 4219: FDIVd	fdivd	%f52, %f0, %f62
T1_asi_reg_rd_230:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 4220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbda00540  ! 4222: FSQRTd	fsqrt	
	.word 0xb015a1bd  ! 4223: OR_I	or 	%r22, 0x01bd, %r24
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_231:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1a80820  ! 4228: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa48820  ! 4229: FADDs	fadds	%f18, %f0, %f31
	.word 0xbd357001  ! 4230: SRLX_I	srlx	%r21, 0x0001, %r30
cpu_intr_1_322:
	setx	0x420202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c4000  ! 4232: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xbda508e0  ! 4235: FSUBq	dis not found

	.word 0xbba00540  ! 4238: FSQRTd	fsqrt	
cpu_intr_1_323:
	setx	0x41012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_324:
	setx	0x410136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_232:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbd3c7001  ! 4245: SRAX_I	srax	%r17, 0x0001, %r30
T1_asi_reg_wr_173:
	mov	0x30, %r14
	.word 0xf8f38e60  ! 4250: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfa48820  ! 4252: FADDs	fadds	%f18, %f0, %f31
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_233:
	mov	0x31, %r14
	.word 0xf0db89e0  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbe9ce041  ! 4257: XORcc_I	xorcc 	%r19, 0x0041, %r31
cpu_intr_1_325:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 4260: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb9a00040  ! 4266: FMOVd	fmovd	%f0, %f28
	.word 0xb1a00540  ! 4267: FSQRTd	fsqrt	
T1_asi_reg_wr_174:
	mov	0x3, %r14
	.word 0xfef38e80  ! 4269: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbba80420  ! 4270: FMOVRZ	dis not found

	.word 0xb5aa0820  ! 4271: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbda54960  ! 4272: FMULq	dis not found

cpu_intr_1_326:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_327:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488a0  ! 4276: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb3a98820  ! 4277: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a548a0  ! 4282: FSUBs	fsubs	%f21, %f0, %f28
cpu_intr_1_328:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x400022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9aa0820  ! 4288: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9abc820  ! 4290: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfabc820  ! 4300: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a50860  ! 4301: FADDq	dis not found

T1_asi_reg_rd_234:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 4302: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_175:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 4303: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5a509a0  ! 4307: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb5a81820  ! 4308: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9a40860  ! 4311: FADDq	dis not found

T1_asi_reg_wr_176:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 4312: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbda00560  ! 4314: FSQRTq	fsqrt	
T1_asi_reg_rd_235:
	mov	0x13, %r14
	.word 0xfedb8e80  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a48840  ! 4318: FADDd	faddd	%f18, %f0, %f26
T1_asi_reg_wr_177:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 4320: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_236:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 4323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3a409e0  ! 4330: FDIVq	dis not found

	.word 0xb3a44860  ! 4331: FADDq	dis not found

	.word 0x85946022  ! 4338: WRPR_TSTATE_I	wrpr	%r17, 0x0022, %tstate
	.word 0xbda81820  ! 4339: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8f902001  ! 4340: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb9a80420  ! 4343: FMOVRZ	dis not found

T1_asi_reg_rd_237:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_238:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a488a0  ! 4350: FSUBs	fsubs	%f18, %f0, %f26
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_330:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 4357: FMOVGU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda58840  ! 4362: FADDd	faddd	%f22, %f0, %f30
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 20)
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb7643801  ! 4367: MOVcc_I	<illegal instruction>
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a5c9e0  ! 4370: FDIVq	dis not found

	.word 0xb5a94820  ! 4372: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 7)
	.word 0xb69dc000  ! 4377: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xb5aac820  ! 4382: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_239:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 4387: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_178:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 4388: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 27)
	.word 0xb9a00560  ! 4391: FSQRTq	fsqrt	
cpu_intr_1_331:
	setx	0x410110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_332:
	setx	0x43022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_333:
	setx	0x40023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 4404: RDPR_TSTATE	<illegal instruction>
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_334:
	setx	0x43013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c860  ! 4408: FADDq	dis not found

	.word 0xb3a81c20  ! 4410: FMOVRGEZ	dis not found

	.word 0xbb520000  ! 4413: RDPR_PIL	<illegal instruction>
	.word 0xbba00520  ! 4414: FSQRTs	fsqrt	
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb5a5c8e0  ! 4417: FSUBq	dis not found

iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba00520  ! 4420: FSQRTs	fsqrt	
	.word 0xb37dc400  ! 4422: MOVR_R	movre	%r23, %r0, %r25
T1_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4423: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda81c20  ! 4428: FMOVRGEZ	dis not found

	.word 0xb1a00540  ! 4429: FSQRTd	fsqrt	
	.word 0xb7a00040  ! 4430: FMOVd	fmovd	%f0, %f58
	.word 0xb3a549e0  ! 4432: FDIVq	dis not found

	.word 0xb3a00540  ! 4435: FSQRTd	fsqrt	
	.word 0xb3a488e0  ! 4437: FSUBq	dis not found

	.word 0xb8c5e157  ! 4438: ADDCcc_I	addccc 	%r23, 0x0157, %r28
	.word 0xbba84820  ! 4439: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a94820  ! 4442: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_335:
	setx	0x410101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_180:
	mov	0x13, %r14
	.word 0xf2f38400  ! 4445: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5a54840  ! 4447: FADDd	faddd	%f52, %f0, %f26
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 25)
	.word 0xbcbc6190  ! 4452: XNORcc_I	xnorcc 	%r17, 0x0190, %r30
	.word 0xb9518000  ! 4453: RDPR_PSTATE	<illegal instruction>
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda4c860  ! 4455: FADDq	dis not found

	.word 0xb7a4c8c0  ! 4457: FSUBd	fsubd	%f50, %f0, %f58
cpu_intr_1_336:
	setx	0x43003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea48000  ! 4461: SUBcc_R	subcc 	%r18, %r0, %r31
T1_asi_reg_rd_240:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 4462: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3a54940  ! 4463: FMULd	fmuld	%f52, %f0, %f56
cpu_intr_1_337:
	setx	0x430317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_181:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 4467: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb13d0000  ! 4472: SRA_R	sra 	%r20, %r0, %r24
T1_asi_reg_wr_182:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 4473: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb6050000  ! 4474: ADD_R	add 	%r20, %r0, %r27
	.word 0xbfa508c0  ! 4476: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb3ab8820  ! 4477: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb17da401  ! 4479: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xb9ab0820  ! 4480: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_338:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_341:
	setx	0x430206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c840  ! 4491: FADDd	faddd	%f54, %f0, %f24
	.word 0xb5a50940  ! 4493: FMULd	fmuld	%f20, %f0, %f26
cpu_intr_1_342:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 4498: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00520  ! 4499: FSQRTs	fsqrt	
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_183:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 4506: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb434203b  ! 4508: SUBC_I	orn 	%r16, 0x003b, %r26
cpu_intr_1_343:
	setx	0x42010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_344:
	setx	0x40033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_345:
	setx	0x420033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c7001  ! 4519: SLLX_I	sllx	%r17, 0x0001, %r31
T1_asi_reg_rd_241:
	mov	0x7, %r14
	.word 0xf2db89e0  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 4526: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_242:
	mov	0x24, %r14
	.word 0xf4db84a0  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb93d1000  ! 4538: SRAX_R	srax	%r20, %r0, %r28
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda88820  ! 4541: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 4547: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5a448a0  ! 4548: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xb9a8c820  ! 4550: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb7a58860  ! 4551: FADDq	dis not found

T1_asi_reg_wr_186:
	mov	0x34, %r14
	.word 0xfef38e40  ! 4553: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a509c0  ! 4554: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb5ab0820  ! 4555: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a44920  ! 4556: FMULs	fmuls	%f17, %f0, %f26
T1_asi_reg_rd_243:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 4559: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1347001  ! 4560: SRLX_I	srlx	%r17, 0x0001, %r24
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_346:
	setx	0x44010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409c0  ! 4566: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xb5ab0820  ! 4568: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_244:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_187:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 4574: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_245:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7a4c9a0  ! 4576: FDIVs	fdivs	%f19, %f0, %f27
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_347:
	setx	0x450017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a48920  ! 4584: FMULs	fmuls	%f18, %f0, %f25
T1_asi_reg_rd_246:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_348:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a489e0  ! 4591: FDIVq	dis not found

	.word 0xb3a90820  ! 4592: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb7abc820  ! 4593: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_349:
	setx	0x450314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x450130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4598: FMOVd	fmovd	%f0, %f24
	.word 0xbfa81420  ! 4601: FMOVRNZ	dis not found

iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a81c20  ! 4603: FMOVRGEZ	dis not found

	.word 0xbda489c0  ! 4604: FDIVd	fdivd	%f18, %f0, %f30
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a4c940  ! 4610: FMULd	fmuld	%f50, %f0, %f56
	.word 0xbfa94820  ! 4611: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a408a0  ! 4613: FSUBs	fsubs	%f16, %f0, %f28
T1_asi_reg_wr_188:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 4615: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_189:
	mov	0x30, %r14
	.word 0xfaf38e60  ! 4617: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_351:
	setx	0x44020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a5c8c0  ! 4622: FSUBd	fsubd	%f54, %f0, %f26
cpu_intr_1_352:
	setx	0x460315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_190:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 4626: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7a00560  ! 4628: FSQRTq	fsqrt	
	.word 0xb1a4c9a0  ! 4633: FDIVs	fdivs	%f19, %f0, %f24
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa50840  ! 4640: FADDd	faddd	%f20, %f0, %f62
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_247:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 4644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_353:
	setx	0x440202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbdab8820  ! 4648: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a98820  ! 4649: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81820  ! 4651: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_354:
	setx	0x440011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c920  ! 4657: FMULs	fmuls	%f19, %f0, %f30
cpu_intr_1_355:
	setx	0x440317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_356:
	setx	0x470102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 4672: FMOVRLZ	dis not found

	.word 0xb7a84820  ! 4674: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81420  ! 4678: FMOVRNZ	dis not found

T1_asi_reg_rd_248:
	mov	0x30, %r14
	.word 0xfcdb8e60  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbc940000  ! 4682: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xb3a58920  ! 4684: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb9a00040  ! 4692: FMOVd	fmovd	%f0, %f28
T1_asi_reg_rd_249:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_wr_191:
	mov	0x18, %r14
	.word 0xf6f38e60  ! 4700: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb08c4000  ! 4702: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xb7a508c0  ! 4705: FSUBd	fsubd	%f20, %f0, %f58
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_357:
	setx	0x46020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_250:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9a5c820  ! 4713: FADDs	fadds	%f23, %f0, %f28
	.word 0xb4a421f3  ! 4714: SUBcc_I	subcc 	%r16, 0x01f3, %r26
	.word 0xb3a00540  ! 4715: FSQRTd	fsqrt	
T1_asi_reg_wr_192:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 4716: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba88820  ! 4717: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_251:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 4719: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfabc820  ! 4721: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_252:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1a50860  ! 4724: FADDq	dis not found

iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1a489c0  ! 4727: FDIVd	fdivd	%f18, %f0, %f24
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a8c820  ! 4733: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_193:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 4740: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda4c8a0  ! 4741: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb1aa4820  ! 4742: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa5c9e0  ! 4751: FDIVq	dis not found

	.word 0xbdaa8820  ! 4753: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_194:
	mov	0x14, %r14
	.word 0xfef38e60  ! 4754: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_253:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 4756: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_358:
	setx	0x44030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a90820  ! 4762: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbf643801  ! 4764: MOVcc_I	<illegal instruction>
	.word 0xb1a448c0  ! 4766: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_359:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48920  ! 4771: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbb3c4000  ! 4774: SRA_R	sra 	%r17, %r0, %r29
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_360:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x440036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a98820  ! 4793: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_195:
	mov	0x5, %r14
	.word 0xf6f38400  ! 4797: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3a8c820  ! 4799: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7a84820  ! 4801: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb33ca001  ! 4803: SRA_I	sra 	%r18, 0x0001, %r25
cpu_intr_1_362:
	setx	0x44011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5c000  ! 4809: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xbeb48000  ! 4810: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xb5a80820  ! 4812: FMOVN	fmovs	%fcc1, %f0, %f26
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 7)
	.word 0xbe3de1df  ! 4817: XNOR_I	xnor 	%r23, 0x01df, %r31
cpu_intr_1_363:
	setx	0x440211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_364:
	setx	0x440316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc421a4  ! 4824: ADDCcc_I	addccc 	%r16, 0x01a4, %r30
	.word 0xb9a90820  ! 4827: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_365:
	setx	0x440114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba449e0  ! 4841: FDIVq	dis not found

	.word 0xb6454000  ! 4844: ADDC_R	addc 	%r21, %r0, %r27
	.word 0xbcb54000  ! 4845: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xbba00040  ! 4846: FMOVd	fmovd	%f0, %f60
	.word 0xb7508000  ! 4848: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a58960  ! 4852: FMULq	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb42c217f  ! 4855: ANDN_I	andn 	%r16, 0x017f, %r26
	.word 0xb12d7001  ! 4856: SLLX_I	sllx	%r21, 0x0001, %r24
T1_asi_reg_rd_254:
	mov	0x9, %r14
	.word 0xf2db8e60  ! 4863: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_366:
	setx	0x44023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_367:
	setx	0x440306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 4873: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbe0cc000  ! 4876: AND_R	and 	%r19, %r0, %r31
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a00520  ! 4882: FSQRTs	fsqrt	
	.word 0xb9ab8820  ! 4884: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb8b44000  ! 4885: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xb1a58840  ! 4886: FADDd	faddd	%f22, %f0, %f24
	.word 0xb72ca001  ! 4888: SLL_I	sll 	%r18, 0x0001, %r27
T1_asi_reg_wr_197:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 4892: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_368:
	setx	0x440307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_255:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 2a)
	.word 0x9195e1bd  ! 4900: WRPR_PIL_I	wrpr	%r23, 0x01bd, %pil
	.word 0xb7a94820  ! 4905: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_369:
	setx	0x450333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 4907: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbfaa8820  ! 4908: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbba489e0  ! 4909: FDIVq	dis not found

	.word 0xbda98820  ! 4911: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_370:
	setx	0x46022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589e0  ! 4918: FDIVq	dis not found

iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3aa4820  ! 4926: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_198:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 4927: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbba549c0  ! 4928: FDIVd	fdivd	%f52, %f0, %f60
cpu_intr_1_371:
	setx	0x47002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 4937: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a94820  ! 4938: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb83d4000  ! 4942: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xbba00560  ! 4943: FSQRTq	fsqrt	
	.word 0xb695a1e7  ! 4945: ORcc_I	orcc 	%r22, 0x01e7, %r27
T1_asi_reg_wr_199:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4946: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_200:
	mov	0x24, %r14
	.word 0xf2f38e60  ! 4952: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_201:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 4954: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1aa8820  ! 4956: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_256:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a8c820  ! 4960: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_372:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_202:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 4963: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb8a5e032  ! 4965: SUBcc_I	subcc 	%r23, 0x0032, %r28
T1_asi_reg_wr_203:
	mov	0x36, %r14
	.word 0xf0f38e60  ! 4966: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_257:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_373:
	setx	0x450120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a589c0  ! 4971: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbb3cd000  ! 4973: SRAX_R	srax	%r19, %r0, %r29
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 26)
	.word 0xb2154000  ! 4980: OR_R	or 	%r21, %r0, %r25
	.word 0xb3a44820  ! 4981: FADDs	fadds	%f17, %f0, %f25
T1_asi_reg_wr_204:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 4986: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a448a0  ! 4987: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb7a448e0  ! 4989: FSUBq	dis not found

cpu_intr_1_374:
	setx	0x45013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_375:
	setx	0x470319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58920  ! 4997: FMULs	fmuls	%f22, %f0, %f25

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

	.xword	0xe588a1062dd280bb
	.xword	0x8fb5cab035652ce4
	.xword	0x31dd794ba0bc18d0
	.xword	0x4b9408abce08fd15
	.xword	0x39e050bf06278f8b
	.xword	0xe7ff10fbda05dc63
	.xword	0x7cfdf9a55b21bbf1
	.xword	0x7efb4612ed9b1c7a
	.xword	0x055e7f974cc6d3bb
	.xword	0x10e373ef7f45f5dd
	.xword	0x2b8b5a5a2b591518
	.xword	0x20a0dc28a2a1664e
	.xword	0xc1717450b1aa8fb3
	.xword	0xff8924dc62e8bda8
	.xword	0x01a05d9065e65861
	.xword	0xa4935773dbe55867
	.xword	0x793fb677c57addd3
	.xword	0x37871d713dfb1b19
	.xword	0xb3497dbc5147590c
	.xword	0x172db5c9798e5c3f
	.xword	0x4c131d51dee8999f
	.xword	0x1e243be236c119eb
	.xword	0x706ff7eaa75dbd53
	.xword	0xa7c2eda2f136a55c
	.xword	0xea88a6555e268fcf
	.xword	0xc5a1a8f7cdc61c83
	.xword	0x7a179130fe868839
	.xword	0xd43a0b838344a1a4
	.xword	0xc2fc8fff6f167b04
	.xword	0x8a111091953e15c3
	.xword	0x4612eef8e6b7c741
	.xword	0x71dadbf59151f2d2
	.xword	0x51fc22ed3967da5c
	.xword	0x5cfc9da019a76069
	.xword	0x67598f2432bf50ad
	.xword	0xc7743338ffbce0b7
	.xword	0x3a2438b2d1acfd58
	.xword	0x9c48d3c6be203854
	.xword	0x5908289c61054d6e
	.xword	0x7c8597ce9f191b30
	.xword	0x4c91ff01433f006c
	.xword	0x521eb3e83bf1184c
	.xword	0x0c80ef9d9e4938cc
	.xword	0xfbd92da242e1eeef
	.xword	0xcffdd198c77b0890
	.xword	0xf5c12183c0e3577b
	.xword	0x863570e9614d9154
	.xword	0xbc9f382205ac286f
	.xword	0xfb50624c6b40a4d1
	.xword	0x2b8926717ff65868
	.xword	0x467a1f923a80fc44
	.xword	0xc7bb0fddc914e9ed
	.xword	0x592b8b00bb6b54fc
	.xword	0x45cf9be1302825dc
	.xword	0x66fa4d079833c2f9
	.xword	0xecd969a50300e462
	.xword	0x22809ae69889d6f6
	.xword	0xcaf57f01802fa4a0
	.xword	0x2f3053689679eb76
	.xword	0x7b5b92a3f8cbb5e1
	.xword	0x7276caa93d25c4d2
	.xword	0x1d28807450477ebe
	.xword	0x6686b234013c2a1a
	.xword	0xe2745899c4873395
	.xword	0x77817bd37b7032ec
	.xword	0x0322853551a4b36f
	.xword	0x4347dac98784d240
	.xword	0xee962e43a7b1a24e
	.xword	0xd598946467e426bf
	.xword	0x856214ae72ffcbd5
	.xword	0xee47d90e2c0d0b41
	.xword	0xc3512902d145d343
	.xword	0x1de67d029dcb77b3
	.xword	0xbd7e3d6b8f41db99
	.xword	0x49a06053ad27c84d
	.xword	0x2652b3470bcc1dd3
	.xword	0x29b1f3398a71ef97
	.xword	0x6d9b4aedad6f7285
	.xword	0xa8a1b2aa33b35e24
	.xword	0x3c93d37d4b2acd77
	.xword	0x5b74a33fb44630bb
	.xword	0xb98d551ca177679b
	.xword	0x743fd150c19ea3e5
	.xword	0x6d205821d4d8f84d
	.xword	0x1ffc8d9c1438d45b
	.xword	0x444e1716da76e274
	.xword	0x89cd46f4dbf7b42e
	.xword	0x0788a9e64d48c0f7
	.xword	0x5c6c370e6b79a249
	.xword	0xd37c998e20c1b8b9
	.xword	0xdf553665abd6d18a
	.xword	0x1fcaf5de873d9bbc
	.xword	0xf63d28c0937862e1
	.xword	0xa817f613639a0514
	.xword	0x2f8a4b87010a0b00
	.xword	0x3b289363d5ab26b6
	.xword	0x57ce6e9283b9158b
	.xword	0x88aae77485ea70f8
	.xword	0x3b305a6845633120
	.xword	0xa2abad09707b723c
	.xword	0x7de2193123d1d890
	.xword	0x716bd85eb24033da
	.xword	0xf148c639a9343caa
	.xword	0xd0f2917ee0cea18c
	.xword	0x06440a4d7822a6a1
	.xword	0x9b23a86d5be95e63
	.xword	0x2f6daa93b5c9ea44
	.xword	0x6e837b37c36294d8
	.xword	0xe77cfa33c5198984
	.xword	0xf8336942831c821c
	.xword	0xca25aa84f8b284c0
	.xword	0x1b0f1f9b43926e23
	.xword	0x6043148342db3a51
	.xword	0x2ff5d9cd72bfb999
	.xword	0x8378068652daf17b
	.xword	0x461493b01c81bb7b
	.xword	0x8f1231ab2fa4a608
	.xword	0x1d3902448b149fca
	.xword	0xb8c672f3394b729a
	.xword	0x3981711049d8dacd
	.xword	0xba0dfb672aefc61e
	.xword	0xa9ea7fbbb0b5aede
	.xword	0xa39cb298174e9a7b
	.xword	0x972b2524e2dcbff1
	.xword	0x28aa38118957175e
	.xword	0x3b57853aef814346
	.xword	0xce2c87b10e26da4d
	.xword	0xc565e9228aaa96d0
	.xword	0x836f71dd506f7dc4
	.xword	0xcc2918922e310684
	.xword	0xcfed102a0e0310a1
	.xword	0xe46a28756cea97e7
	.xword	0x290735c6fdbed9c7
	.xword	0xb4f333f7cf486759
	.xword	0x6feb83efdf5a369d
	.xword	0x1eb6c552818ca1ac
	.xword	0x5d6f7a4ad6cedd87
	.xword	0x5edc4bed3dff4073
	.xword	0x9c8bce8a440fe6f9
	.xword	0x93664f9db0b932ca
	.xword	0xc6f510fac28a481a
	.xword	0xbc538c4771c38bfb
	.xword	0x3760fc0a998586eb
	.xword	0xd4632925fdf5fdc6
	.xword	0xb9fdcd06ec44c71d
	.xword	0x3974734e4a0f52cb
	.xword	0x78f4a3c0786a1afd
	.xword	0x3b31cb6b4398ca0a
	.xword	0x0e071034750bf256
	.xword	0xabe55ca5f139410f
	.xword	0xbda44a66d7afece7
	.xword	0x6c2d7ac8a53b972d
	.xword	0x5df1835acdf9a1a3
	.xword	0x71c1ec37b3006873
	.xword	0x6e0a94290cb9627a
	.xword	0x3e913f27180be268
	.xword	0xaf4cd7b46239fcd4
	.xword	0xf8e4e6a540129121
	.xword	0x1d41b0d88cd2f95a
	.xword	0x4892cb5f30fe8541
	.xword	0xc9e9143cf3b80868
	.xword	0x4180173b946a4c51
	.xword	0x0e10929d3c909c57
	.xword	0xc9716faa843ff0b9
	.xword	0x3e46d5e83f5a8876
	.xword	0x73441bdc79d32006
	.xword	0x8f74b3b5078ee47e
	.xword	0x06d4106d4f57f883
	.xword	0x0b4345f1ebe52295
	.xword	0x08dd7f9d6646e436
	.xword	0x2402a1d6ea769d35
	.xword	0x71de62f5ecfdc1e4
	.xword	0xc85888c9326aed3a
	.xword	0x774be7e49fd51615
	.xword	0xf45fe37880b4efac
	.xword	0x2ab3be46876062ec
	.xword	0xe09a386357f4aef6
	.xword	0xc468eb09c9ec8d6e
	.xword	0xe7f742d601ff41ed
	.xword	0x24fbfa575472283e
	.xword	0x78417c6a86fc794a
	.xword	0xe78321be383f187b
	.xword	0xb1e604a074c9a660
	.xword	0x881a32c4d1ee00ba
	.xword	0xe2ea5da145a3f223
	.xword	0x1c0012e1ab187277
	.xword	0x84af3dabab5e9a4e
	.xword	0x5a6d3c3f44406b51
	.xword	0x40ee6af2dba2c63a
	.xword	0xa799dda66fff5736
	.xword	0x2e872053c7c2adbd
	.xword	0xeb91458cf06456ba
	.xword	0x899baacd9df6ef1e
	.xword	0xabe01a20804106c6
	.xword	0xa7f075476511cd87
	.xword	0xdfdc0d628d46062b
	.xword	0xfe8ac98b7fe068e1
	.xword	0x6478c9411e2907ed
	.xword	0x0f1d43b0789c7308
	.xword	0x4d50b72474440e54
	.xword	0xad9ac85cb10aac7c
	.xword	0x64a61cb9f021a11a
	.xword	0x9348959255e1e885
	.xword	0xca66a14210e2ea8a
	.xword	0xebddb135b7334a6b
	.xword	0x077b3a40a47f1760
	.xword	0x9f98276a30435c30
	.xword	0xc9beb5e638059709
	.xword	0x63800da37a648d03
	.xword	0xb291e664c6f17d6d
	.xword	0x0847c24b235c2dee
	.xword	0xc964930ead4c5c05
	.xword	0x285a6932afbef50d
	.xword	0x809ad08903caebd9
	.xword	0xc24e8d3a44b80fd1
	.xword	0xd3a36d3f2e496a92
	.xword	0xda5456fbd6c6d1b6
	.xword	0x83602228bc4d0f43
	.xword	0x34cee307f9ec5ef0
	.xword	0x231b3ddb0ca86c7e
	.xword	0xcfc6039e055283fa
	.xword	0xa33180105cc73756
	.xword	0x132cbf093ed6e61f
	.xword	0x43baefdd9f32d1dc
	.xword	0x8ef0cfab50247f35
	.xword	0x5d0f92b8c4e1e077
	.xword	0x9330316309c0678e
	.xword	0x668791226b9e719a
	.xword	0xd39957d3d3ed7530
	.xword	0xd57467829de63ada
	.xword	0xa5f7ca77f3667527
	.xword	0x63b01c4c938ace74
	.xword	0x5628092a72eab259
	.xword	0x4e3278ae1f9f812d
	.xword	0x5048a5d6c944f4e4
	.xword	0xc8d8142a43cfdb91
	.xword	0x726ce5072b9b7c1d
	.xword	0x3be6633654e91c91
	.xword	0x9c24e3045e7064be
	.xword	0xbfbbb605bfce07be
	.xword	0x8301d3696a4ce528
	.xword	0x2477c630c173fa32
	.xword	0xf399b1fcaf087618
	.xword	0x59579e43c031266f
	.xword	0x331a30d60f9d60f7
	.xword	0xf1c4d2a4835bca23
	.xword	0x20c4210cc0401ed3
	.xword	0x3fa3427fe842bae7
	.xword	0x46e4347b367f8bd4
	.xword	0xf7ed9aa24393b0d0
	.xword	0xc4f312c23f9f9dbe
	.xword	0xf64fd9a48e44ed5a
	.xword	0x00c76609ae15154f
	.xword	0xeafec75ceaf44a1d
	.xword	0x054d048053f70736
	.xword	0xfce1992af12bb6a3
	.align 0x2000
	.data
data_start_1:

	.xword	0xf243c8c4f00e19aa
	.xword	0x75a6de96efea5d5b
	.xword	0x6741369a194daad5
	.xword	0x3224f06f62e4db51
	.xword	0xaaa83d406ebe50c6
	.xword	0xdae8fa7b143cb7dc
	.xword	0xb81bf6710ed54d1e
	.xword	0x43e9a00f0cb6ee57
	.xword	0x8ab5487697352d7d
	.xword	0x7ba260c37ca051ee
	.xword	0x4ac022b09e1f2c3e
	.xword	0xb9add265b63c48d7
	.xword	0xcd3b71d8252574fc
	.xword	0x7770f21a982e86aa
	.xword	0x66832e480c098182
	.xword	0x1750a98aba98d6ab
	.xword	0xc7add53164685fde
	.xword	0x31979d45782070db
	.xword	0xbf522dd47d576b58
	.xword	0xddc1b6e44508822e
	.xword	0xea5c557732ec406a
	.xword	0x159df34f4b1b5105
	.xword	0xb69d7d5aaa39b0f5
	.xword	0xa81ab3b43e203ff7
	.xword	0x643d66a5182e7bad
	.xword	0x0e67f06fb07c1442
	.xword	0x1f46517ff252db95
	.xword	0x18cd8afe40f3b2af
	.xword	0x64012f44969df955
	.xword	0x17e355c1e482af70
	.xword	0xab9fd1390864fdb5
	.xword	0x597f31ef8852e6b6
	.xword	0xadacc1a44b9004ba
	.xword	0x49e0911430ee22b7
	.xword	0xf1b6bed1a2a1a3b5
	.xword	0x354f0b413fa9d3a0
	.xword	0xbf7ea1145c072efd
	.xword	0x841622c59a45a1e2
	.xword	0xcb82496dcbd842ff
	.xword	0x21c1c830a7d05849
	.xword	0x662d39f8aea8263a
	.xword	0xd796decfd12e30ea
	.xword	0x0d1b35d6d8fce216
	.xword	0xcfe5d79721dbc163
	.xword	0x6dbadd52b6b29aa8
	.xword	0x9e0e4550a7866553
	.xword	0x8c670585503e7e5f
	.xword	0x21f7a92d7329ee68
	.xword	0xa68aece6ebe6b831
	.xword	0x6bbfb5f74c87e931
	.xword	0x3c58f9f42b3e7f95
	.xword	0xa3c93ecee9ded5c1
	.xword	0xb701286e6f9078cd
	.xword	0xb2bd71d489ff1588
	.xword	0xe05273df4ab676ca
	.xword	0x9614045f0ae6c367
	.xword	0xf3e82c68a1efeb0e
	.xword	0x81f6cc86fe824445
	.xword	0xdf74eb4abfe59616
	.xword	0x740c78e2330871a9
	.xword	0xaa04f8ad3ed4c385
	.xword	0x52d8368cbeeac341
	.xword	0xdba558edbb0e3003
	.xword	0x4593cd8d8a846a73
	.xword	0x6189d19071b85781
	.xword	0xb398a03fe81bae4f
	.xword	0x87208671410751ad
	.xword	0x383397265e2f274c
	.xword	0x3fc77cf3e8387c62
	.xword	0x58dba6a93849ab9b
	.xword	0xae60b4fb30db502d
	.xword	0xc21e292c140c2b33
	.xword	0xbb2d4adb820c1517
	.xword	0x607a3b31c6aefaeb
	.xword	0x7731df811532fe93
	.xword	0x7405aea10a16060d
	.xword	0xbe88c5997f91dbf0
	.xword	0x90698ed2696a351f
	.xword	0x56cfc9e5b6b8d1ba
	.xword	0x6635266081dd1e4f
	.xword	0xdf885f14e6a0127e
	.xword	0x607fb66098a2ad1b
	.xword	0x65aaffa655259072
	.xword	0x037adf19a046d803
	.xword	0x03b8d97bd0de8d4d
	.xword	0x08362beb25d97de1
	.xword	0xb54883a095cc4b5e
	.xword	0xec3a69747168725f
	.xword	0x49971ed8dcc240cb
	.xword	0x0dba2c332439cbcd
	.xword	0x5fea79ceb0f6ff4a
	.xword	0xc0b724138f30b151
	.xword	0x05549a77f95cc810
	.xword	0x5fcd95695f2aa239
	.xword	0x9d0095f84168676d
	.xword	0x5f1e946eea89fd7e
	.xword	0x189121b634a7573e
	.xword	0xe3476c1d16172e7b
	.xword	0x3ff5c9bd6bd0ab51
	.xword	0x1b41e2cbd4c425aa
	.xword	0x4640d6b92f26b425
	.xword	0x3b2f763d22b12b91
	.xword	0xe59be0de502a170d
	.xword	0x181555e3340bd006
	.xword	0xd60b17a9b4970418
	.xword	0x8441a814b71c0a6a
	.xword	0x510dea1205594a94
	.xword	0x3b77bc0f330bc1f0
	.xword	0xbb8d9ee18077dfb0
	.xword	0x7edbbec2004c5ae4
	.xword	0x797facc4f98eb25f
	.xword	0xcd738a13fc14bd5e
	.xword	0xc8da29e21583a03f
	.xword	0x6ec4dfd4bd6ee203
	.xword	0x6bb34f780a3997fc
	.xword	0xfe8152da2978b559
	.xword	0x805cfbe2363ccd1f
	.xword	0x7751880198dcb2fe
	.xword	0xf77670183eddc168
	.xword	0x2f0c7dff362a4d44
	.xword	0x19c524a5b509a7cd
	.xword	0xe426f661886fc6fb
	.xword	0xc4542c1f4dc81ffc
	.xword	0x2e5b1098f0958669
	.xword	0x315c644dacf41ebb
	.xword	0xfd88199849438d79
	.xword	0x6a48ecc8a8ff6119
	.xword	0x4c9cc92db043cd5e
	.xword	0x7bb95a6b7bab71bd
	.xword	0x5d7b85ea1249466d
	.xword	0x395bc54232093de9
	.xword	0x5037f41cda03cd28
	.xword	0x7dbd0468663d954a
	.xword	0xd6116d0fb8d3089f
	.xword	0xf6ee143aac0ab86c
	.xword	0xc65e2fe00c80d0a2
	.xword	0xace4fda1324451b4
	.xword	0xe7c416f3a52f9582
	.xword	0x94bae6a5b159704c
	.xword	0x8bc8f0ccab446184
	.xword	0x4bccae1b9fcf9255
	.xword	0x2bd6d1c58d99f9bc
	.xword	0x47219ade92cefee1
	.xword	0x563863c95d223669
	.xword	0xc22a15081f1720a6
	.xword	0x018c86589dfe666c
	.xword	0x72066fc8986f6df5
	.xword	0x68bbd49624fc32f5
	.xword	0xf0f3a7edbd4ebe67
	.xword	0x8bff8b715b37e565
	.xword	0x054d0d506271925a
	.xword	0x84d17e14ff27c26a
	.xword	0x9ebde9c4307438d0
	.xword	0x93c422159252af5e
	.xword	0x8031478514f8b4f8
	.xword	0x8ca92195db42346e
	.xword	0xf02f13e796b0449f
	.xword	0x5971bce86388aaf6
	.xword	0xe48945e34f91cbe0
	.xword	0x3904000865956da5
	.xword	0xfc05d228c28744a9
	.xword	0xdae41278b5242df9
	.xword	0xc2bc81d775d255e4
	.xword	0xf49d14a257a5beab
	.xword	0x027557f5d9bce9a5
	.xword	0xd3ce8f2a7643b7de
	.xword	0xeebb66a3c6684152
	.xword	0xa3b687c92047a69b
	.xword	0x5e0dc9e2784987f1
	.xword	0x568d79cb25846147
	.xword	0x7a04edf736db8f5f
	.xword	0x7bebbb190d39af53
	.xword	0xa2044bfe765883b6
	.xword	0x7bdb07864439498e
	.xword	0xf619395fad5f3a03
	.xword	0xdc56f5ad1fc398ff
	.xword	0xccce53a97a79a9e0
	.xword	0xf2e6a3fe5753f779
	.xword	0x2d7b083e5e728cf8
	.xword	0x01efa702575dff90
	.xword	0xe5ad1101d609618a
	.xword	0x0e1fef364c9af2bf
	.xword	0x5eafc16f8c467473
	.xword	0x197c8e2f42499f1f
	.xword	0x6bf1070f416ee780
	.xword	0xbd439e6979a967aa
	.xword	0xc4293954f15f0845
	.xword	0x2032acede9c295f1
	.xword	0xde3781e735ef5394
	.xword	0xd29616760323ea3f
	.xword	0x79332e8dd2990ee9
	.xword	0x389b8862e4c8fb5b
	.xword	0x64aee8f33123dd61
	.xword	0x7de31871d50df106
	.xword	0x375598def1b222d9
	.xword	0xf8ed36e947e58593
	.xword	0xb0c0111905d90703
	.xword	0xa8d39efc6344169a
	.xword	0x616728d1c489a7d6
	.xword	0x6d27e157c17c1dad
	.xword	0xac6f59c2a5b98fa4
	.xword	0xb560180fa99aaf09
	.xword	0xf85d5933b0ba8a64
	.xword	0xf561d3b2febb483d
	.xword	0x750f9e57c759e690
	.xword	0x6831394697199ad8
	.xword	0x5d7165b8b13cf177
	.xword	0x7e9f7bdea9507086
	.xword	0x8dc35fd200a7692e
	.xword	0x63bc02ff8ebefb3d
	.xword	0x78b4393f9c863877
	.xword	0x3b02f0dafe41cedd
	.xword	0x6c3257528ac3ec5a
	.xword	0xfa78789258efc858
	.xword	0x9c186e8add145ff1
	.xword	0xce012489c26d4082
	.xword	0xde317b4455603006
	.xword	0x5e3c865c4a3ff7f3
	.xword	0xd059dfbe742b9047
	.xword	0x85374e2780386ebb
	.xword	0xc95175af64f32c8c
	.xword	0x670998c9b4be00b4
	.xword	0xe166026517c446db
	.xword	0x06ca4a6ceb9f50fa
	.xword	0x5b0b238dac5f6d56
	.xword	0x714311c4547cbbd7
	.xword	0xbd86c413c73a1707
	.xword	0x33ce3e9d4630f49a
	.xword	0x2a62b9d2013afd54
	.xword	0x0250d1279f4a4d92
	.xword	0x5d22ae18de8d7d18
	.xword	0x4952e1643729a39b
	.xword	0x606c10659c58982b
	.xword	0xed944befbb8830ed
	.xword	0xbccf31f3fdba44d0
	.xword	0x9bbd94832b716d44
	.xword	0x74218a002bce832f
	.xword	0x8b9fdb7cd75382f9
	.xword	0x09ceb5356223ddd4
	.xword	0x99d5e0e3ddb79163
	.xword	0x16e52e2c24c079cd
	.xword	0x1a9b4e5137bdd971
	.xword	0xc7d2c7661ff638a4
	.xword	0xa3720604ad6aebec
	.xword	0x5ad7bb69bc0b69ce
	.xword	0x6d4f3ac00f51d142
	.xword	0xff1ee942e018f561
	.xword	0xe9f8fc8b0f004723
	.xword	0xcb6b70e06cb7ca44
	.xword	0x81f9b0f77c2e3442
	.xword	0xf5faf7dd47587496
	.xword	0xe6670f39773e4ee8
	.xword	0x75c8371eacbed9f2
	.xword	0xae41926a2271c784
	.xword	0x0a84532fa808da76
	.xword	0x571ab567904a2909
	.align 0x4000
	.data
data_start_2:

	.xword	0x363974a46d2965d8
	.xword	0x8e57fdd61efae95a
	.xword	0x854098e13ec3a186
	.xword	0x7aa3c6bed9829822
	.xword	0xcd5ff7b5f508330e
	.xword	0x68f49a0ed026fb7f
	.xword	0x79bb143ba8aca29b
	.xword	0x6e9a0766202dbac1
	.xword	0x3faa913583356e4c
	.xword	0x862d59385fec5242
	.xword	0xbe720d60c7488aae
	.xword	0xa1967d9da7aba69c
	.xword	0xc86b3af1d0c1e001
	.xword	0x2eef5f294e2b13a0
	.xword	0x2a414ac9b13bfe9d
	.xword	0x2c330a896344844b
	.xword	0xba01725156d8cb90
	.xword	0xe1656df3d32bb9e1
	.xword	0x347fae56e393c146
	.xword	0xeb33f36be22766a6
	.xword	0x77e3582df2257b6d
	.xword	0x4b6182d07b856ff0
	.xword	0x73d642de4b321f14
	.xword	0x890ead305d21ed57
	.xword	0x1dd620f8a075ccaa
	.xword	0xc13c9020be01b996
	.xword	0x7e9aca85d73d840d
	.xword	0x1e42299762c0d6e3
	.xword	0x11e39c44c4e3bddc
	.xword	0xbc49b087ca6b8da3
	.xword	0x8b8f001563fbd054
	.xword	0xe6765a8c0a4eac13
	.xword	0x2e2e218010857d12
	.xword	0x1d8d78280ea7fdad
	.xword	0xd5db880fce57122c
	.xword	0x7bb146f83ad0ab90
	.xword	0xa2c831379a7a8363
	.xword	0x60f77a3722d4b65d
	.xword	0x7fdb8e71fcf6ee68
	.xword	0x3167fc68c9e36176
	.xword	0x52469743148846d3
	.xword	0xcae2baa3dd5feee8
	.xword	0x0e70f3330c589bfd
	.xword	0x990d654a4ffbe1f2
	.xword	0xe4a691861dce2d58
	.xword	0xbd3363d6cb466ccc
	.xword	0x4c5abd008e93dd18
	.xword	0xfdefc95c43f96ec8
	.xword	0x123f80d5ccd6b043
	.xword	0x14b8464412ebf636
	.xword	0xc5d08ce3c9bf92bd
	.xword	0x62c4e1dec576a1b1
	.xword	0xdee226235ac14ba9
	.xword	0xb066e7d80e90e200
	.xword	0x1d18a3849ae7b52c
	.xword	0x7bd8ecd339f68cbc
	.xword	0x22b95d67891f5264
	.xword	0x7682aacced31977b
	.xword	0x0c6125e45bdb6756
	.xword	0xbd6dc0f71e763f69
	.xword	0xf4c458648763b3ad
	.xword	0x0c060d306e9c7ed4
	.xword	0xc83a95c7ab4bf089
	.xword	0xb0de9781b06cb96f
	.xword	0xd7b29ecd662774b8
	.xword	0xed44476fd6fc9110
	.xword	0xc387878ecf6b4fc4
	.xword	0x8737589f4a3c976c
	.xword	0x503b22a81a8527ce
	.xword	0x91cbc6113a2f94e6
	.xword	0x79d4383c6c2dfd00
	.xword	0x942fb82a6913b1c1
	.xword	0x853151d051d130f3
	.xword	0x5f69b7375f034032
	.xword	0x9434a3dc4824d31e
	.xword	0xe919291b25b4be62
	.xword	0x0a71eb542fdf5d9f
	.xword	0x5d588c2454c47c6e
	.xword	0xa8413e5122c097b7
	.xword	0xdf7cc06468b4ba18
	.xword	0x3efa96a35bf17249
	.xword	0xa66cfb4703fe61d8
	.xword	0x0f77602500a949a0
	.xword	0xaba96cba94c5f498
	.xword	0x929e09501d737e01
	.xword	0x9386773260abf7a6
	.xword	0xc2dc2bfffb26e124
	.xword	0xdeacc643e121af45
	.xword	0x73f2e394b63e4a79
	.xword	0xee84b2135a494d98
	.xword	0x6d9ef8d2059a6534
	.xword	0x04af0a4322bf0e85
	.xword	0x053dcaaaf7707bae
	.xword	0x0abc62bdf55d504d
	.xword	0x3b0a0e2dfb8655c8
	.xword	0xd49da182add34c66
	.xword	0x9730b518f04f3d3c
	.xword	0xc127142d32e7f953
	.xword	0xbe7243fd1a9839a9
	.xword	0xb2c512a53ba611bf
	.xword	0x7ddcaedcdd9a3332
	.xword	0x599554db8867f9dc
	.xword	0x77f89a6dfd4cdcf2
	.xword	0xd28fc1d5fed27d3d
	.xword	0x26b1478a47003890
	.xword	0x94dbe161897b110e
	.xword	0x099bd5e952d27394
	.xword	0xafe74dcf5b9c618d
	.xword	0x62018cfab6c2c5e8
	.xword	0x4a8e1c702ba4fe2a
	.xword	0xbd715a4fab9082da
	.xword	0x38861d6238bc6756
	.xword	0xd03d6088b7e426b9
	.xword	0x39c057e9ba2992c2
	.xword	0x5e5948c88d55f5c8
	.xword	0x2b52d51f3abea9bc
	.xword	0x07fed1640fd53ce4
	.xword	0x94c045c34451a0bf
	.xword	0x511103673cef5468
	.xword	0x59af3be1f7a5a62b
	.xword	0x25879d3bfbf9c980
	.xword	0xe45f8f130a5a0d90
	.xword	0xeb6757b9dd371e08
	.xword	0x23fd549732fa35ec
	.xword	0x9d9f5428b4a3cc25
	.xword	0x08fc11c2e967df7a
	.xword	0xc1ff75623b59b695
	.xword	0x3461481b1584535b
	.xword	0x7a1e652077275d65
	.xword	0x8fd7909a8c8c492a
	.xword	0x564be2708e7adc2f
	.xword	0xc9e37698bf50a001
	.xword	0xc80c49752d029b0d
	.xword	0x5d2c535db1f0f1ea
	.xword	0xf13dc859b9a9d915
	.xword	0xe236568b457c0682
	.xword	0x66101af9d9b180bb
	.xword	0x9bf98c96f2444ce7
	.xword	0x910b437c0c2461b4
	.xword	0x5d499412b54ae216
	.xword	0xdbc097896c632f51
	.xword	0x85f3e2f1d3aa9a8a
	.xword	0xb5c35b303249b7bc
	.xword	0x415d9654d20063a1
	.xword	0x62a8e081fc2a1910
	.xword	0x9596f78c69963fca
	.xword	0x81b47e97f916fd6d
	.xword	0xebe970b9d946e656
	.xword	0x57d90c65215d7e18
	.xword	0xa32ce7ca470bc465
	.xword	0x1b9edf4a945227ac
	.xword	0x5da3a84391801055
	.xword	0x00a505774e201c39
	.xword	0x64e56be7b9ea8ab0
	.xword	0x7343e37eba18a86e
	.xword	0x42878427660a0d6a
	.xword	0x9cdafc237f103874
	.xword	0x50a6e830ffe35301
	.xword	0x1e9671ccf14e4bd7
	.xword	0xd283a30367395b5b
	.xword	0x09242260c6ada778
	.xword	0xc3e33e2eda411e0a
	.xword	0x6e40e79909df08e7
	.xword	0xbd9341ab63020bb0
	.xword	0x6aa561b77c318d1e
	.xword	0x9701dece255dfb08
	.xword	0xddb31e2e75acc475
	.xword	0x28a68625848cd2d7
	.xword	0xc00249dc6f2556cb
	.xword	0xc62334acbf8708e7
	.xword	0x51be586a7b5af9f9
	.xword	0x5827730712f288ce
	.xword	0x7148bb8a80728b21
	.xword	0x9b54800db6db68fd
	.xword	0x4e0259bf3e1d1081
	.xword	0x65ff309ee9373e1e
	.xword	0x96ed74bc18db9d75
	.xword	0xd4f7fc36949546cf
	.xword	0x0f20d96985bfc0d4
	.xword	0x1eda6d912cc741fa
	.xword	0xd9929b1b133a75dc
	.xword	0x8d489e64071d2965
	.xword	0xf49234f2774ccba8
	.xword	0x50976335d9fea1b7
	.xword	0xe2803a8a7d1c32c3
	.xword	0x444cd2533c9597f9
	.xword	0x3ee361ccab082949
	.xword	0xd9c745eb3ed90b30
	.xword	0x90eb45ad5052b015
	.xword	0xd2421d22bdc9c011
	.xword	0x8e384b64769d11fe
	.xword	0x2854b7b92bd946ed
	.xword	0xda9ceaa4b525d467
	.xword	0x390aa59b1978a39b
	.xword	0xd620bfcb66ee1130
	.xword	0xd34b4a366e82dafb
	.xword	0xa3030e406927a945
	.xword	0xf0cbead79f9ac559
	.xword	0x06b1646509624e7c
	.xword	0xd94dc38acc25cee7
	.xword	0x7cc36817478651a2
	.xword	0x37a6ececf9791775
	.xword	0xe43bda63d283661a
	.xword	0xcfa781305ebed71a
	.xword	0xf2e677d4abe8fc92
	.xword	0x9f0dec065a1bc9f6
	.xword	0xcafc581f7ff77a19
	.xword	0x591f5329bf0700be
	.xword	0x37b26e68ba673bfc
	.xword	0xf33a25e375e66eac
	.xword	0x293fd4c641c64df2
	.xword	0x5d3feeac1fc4f301
	.xword	0xbb040e35bb49ce02
	.xword	0x15c3b81db0b0573e
	.xword	0x730446e920b321f6
	.xword	0x97d1adfa97953400
	.xword	0x92e2bf509a26ce0f
	.xword	0xcea02421efcea04f
	.xword	0x5f6eb5333fa863e8
	.xword	0x31214c298c8730a2
	.xword	0xbecd4a30291ab161
	.xword	0x639be2e9d5d1d95b
	.xword	0x92ded8b3803671b0
	.xword	0xc4d8e4a9985104bd
	.xword	0x0aac099e7748a966
	.xword	0x6bd3139f4ed8eafe
	.xword	0x90676ec0ad945aa9
	.xword	0x40ff02b62d86ad57
	.xword	0x92afd61e45aef5bf
	.xword	0xad2e9658be52fb65
	.xword	0x36f045b33b8af563
	.xword	0xdd938795ae04bfdb
	.xword	0xb50f117d3d5cb400
	.xword	0x44c2c686402b3205
	.xword	0x06a1bc428b677a46
	.xword	0x00cef613e0d190c5
	.xword	0x78c490312df92543
	.xword	0xa94087e01920188d
	.xword	0x817bb98ecdf35fd7
	.xword	0x635b1d9279d6b34f
	.xword	0xf85b1c87d1d8d04f
	.xword	0x7a929629017d6dbb
	.xword	0xbf3e4da28d899906
	.xword	0xb95686abc0a16dbd
	.xword	0x3d249c72faf26bf6
	.xword	0x47969eee4f120315
	.xword	0xb77c2b01e6224d75
	.xword	0x0630ec0e1753a3ae
	.xword	0x8baba483d3ca9925
	.xword	0xc4b30040878c3ca3
	.xword	0xa322bf3bf0f0dcde
	.xword	0x2c8660bc9d7ba713
	.xword	0xeacee71b2fe5179f
	.xword	0xb0b1f42bf5293e98
	.xword	0x1d40316bd09b7bf5
	.xword	0x2d068d945c3aa6a5
	.align 0x8000
	.data
data_start_3:

	.xword	0x1056f2069e2e1220
	.xword	0x99d16379765d64a3
	.xword	0x398bf2862def4801
	.xword	0x5ceff5151bb8f973
	.xword	0xaa397a30f45d8a7e
	.xword	0x7a76acf780277cc0
	.xword	0xe6f75b92cbc74b4d
	.xword	0xb66d1ee65b584f93
	.xword	0xa0a5f76ab265f240
	.xword	0x453cbd88727c5f5b
	.xword	0xa360c5a7b2857ed4
	.xword	0xfa143639c47d0390
	.xword	0x09fd1459cc3a50cc
	.xword	0x141919e0e29d6f12
	.xword	0xe5eb56dcfb0bfed3
	.xword	0xd79aebe55883e646
	.xword	0xd5da08cf0f04efa2
	.xword	0x421085f2fc5fb8f2
	.xword	0x4533745359007f82
	.xword	0xad6a1ba01f61d70e
	.xword	0xbafe4dd448a5e705
	.xword	0xf74bcc9e53edc29b
	.xword	0x7c120158fa76cb20
	.xword	0x564f22ff49db5526
	.xword	0x0ed2d7adf85e5f49
	.xword	0x50bfc2910de9c59e
	.xword	0xa7ccd1a1a590fb0a
	.xword	0x138946fd9220f3f5
	.xword	0xa1198748dfe82f63
	.xword	0xd77ad690a0437410
	.xword	0xcaf046238268e65a
	.xword	0xc22b7fbe28bf019c
	.xword	0xc5dcd960c0ec3a77
	.xword	0xf98199089d0ba83d
	.xword	0xc71140640f1f4a51
	.xword	0xd04cc65008a8d149
	.xword	0xbf40b57eaf6378d0
	.xword	0x80f027309f6d387e
	.xword	0x8df4bb0b4f790e3e
	.xword	0xef5942c1b0b3ed33
	.xword	0xef83213818a74ffe
	.xword	0x104d9d552404c5cd
	.xword	0x85ddcfce80ce565d
	.xword	0x1c0457ae9fa0d330
	.xword	0x803ab165075ed656
	.xword	0xd612f3ef49bf99ea
	.xword	0x31f6fe13e68d9a30
	.xword	0x5907b65ed86627b9
	.xword	0x60c2a88f7b6f38ae
	.xword	0xb47226c832758951
	.xword	0x55da11e6a28f1e33
	.xword	0xc4a03a663ab156c5
	.xword	0xc004ba5be1d005d6
	.xword	0x75424cab63df4d2d
	.xword	0x95680e88942bb100
	.xword	0xdd70de3f8f6d62b7
	.xword	0x446c009441f9560a
	.xword	0x845a96c8d1663892
	.xword	0xf351343918d3be4f
	.xword	0x3d0e1bd2fdfe4592
	.xword	0x5bb8a99eb32e1cc2
	.xword	0xe096aa047eb557bf
	.xword	0x87328bd657772bab
	.xword	0x2ff14a21912529c6
	.xword	0x752de6245c3cd8a8
	.xword	0x67a1f4e69eb8ca84
	.xword	0x41e92dadf6905a59
	.xword	0xa380f1fd41c0c60e
	.xword	0x759c2ee464605642
	.xword	0xf0bf4e1551b72010
	.xword	0x1b3e5b7cd793aa33
	.xword	0x66196e5d511f8c15
	.xword	0xbec6c47614b0e61f
	.xword	0xa42c5a40399d56a0
	.xword	0xe8a78e92fb806f66
	.xword	0x4873d6051ef32c95
	.xword	0x14a562f20d509118
	.xword	0x613190d632c11d6f
	.xword	0xbfe3abac848329d8
	.xword	0x1226e285e2410e1f
	.xword	0x7de9ec577e0edd73
	.xword	0x854d0dc404149122
	.xword	0x353fb59139648212
	.xword	0x370fb4526ddfea62
	.xword	0x7edfb5038e63d78a
	.xword	0x676922e6e9099e9e
	.xword	0xe3ce159df2dda18a
	.xword	0xf5c6611621b00aef
	.xword	0x00a48cfbb977b8d1
	.xword	0xf63e1e53a48ba07f
	.xword	0x4917e03effc57311
	.xword	0x063dd9df0a724ff7
	.xword	0x2ff8a963da0e11ed
	.xword	0x591451ac07d23207
	.xword	0x28aa4b130bfb7e7a
	.xword	0xcb3280874e3aa77b
	.xword	0xcccf379214db5d62
	.xword	0x93ac305b6f7d8e9d
	.xword	0x5c5a9991b7db5fbb
	.xword	0xcc176e373488a0f4
	.xword	0x6db530484c775779
	.xword	0xc65ad3abac88c934
	.xword	0x24b37c7a913e6037
	.xword	0xe9970d9e8d6a995e
	.xword	0x2ce48ac8fbabd282
	.xword	0x30e4dee4058d3c55
	.xword	0x3c275c64192d4a51
	.xword	0x2fb786a45df8955d
	.xword	0xfe2827706b28fae5
	.xword	0x936a08155dab2775
	.xword	0x89fbb5c762f770f6
	.xword	0xe2c7a02e5aac19d3
	.xword	0xdf12002803e1c021
	.xword	0xfd8ec41e97a72137
	.xword	0x0b26b49cc9795056
	.xword	0xd3e339b335b61dfa
	.xword	0x77ce0a08a9c2d780
	.xword	0xd907d240aad34ca0
	.xword	0x5eb1a7f7a54a308b
	.xword	0x3a887322a70a56b8
	.xword	0x3520fbcf65f83b8f
	.xword	0x8c3f9b65301b90a3
	.xword	0xc1ed5ba39be9864b
	.xword	0xc7def6e1dcf7d9b5
	.xword	0x3c7d8963606d1480
	.xword	0x5b94d45bfa0dc29d
	.xword	0xcb329dd448184438
	.xword	0xc30499f21ef1b594
	.xword	0xc751060f07141e3b
	.xword	0xcabc34811aa1ce1a
	.xword	0xae816db6f163efbb
	.xword	0xcabbf951048a8403
	.xword	0xd2a2a618ab04ee3f
	.xword	0xfa8fc38894182ab6
	.xword	0x675aaead9611eb99
	.xword	0x1dc8ed4bf4d8f990
	.xword	0xe6022464f0697c6a
	.xword	0xbf7dad1763eaced8
	.xword	0x34768868ce6e48c2
	.xword	0xf3ca81c488839295
	.xword	0x2740f884ba9c5d21
	.xword	0xd97aed174216438a
	.xword	0x60a6f549163ef1e1
	.xword	0xb6f71fe69f132fa0
	.xword	0x5c7cd70b3c2f247c
	.xword	0x68820dc8290b7ca0
	.xword	0xcc12422601832a22
	.xword	0x34b64d23ca43f3ae
	.xword	0x1b0b2fd18cc9d3b5
	.xword	0xc07f65c968448a04
	.xword	0x44b41f0e24fdc2b5
	.xword	0x63021f8e5a08f649
	.xword	0x3ec774ddbd689dcf
	.xword	0xbc801632527792b7
	.xword	0x41e9705a07eefcf1
	.xword	0x8cbf4412e5e81e01
	.xword	0x660a71336a225fa2
	.xword	0xede9e8250258df0f
	.xword	0x23f5c89c35f56d6a
	.xword	0xc541a072327ae8d3
	.xword	0x13c53b085cd6208f
	.xword	0xff415320ab6d71b4
	.xword	0x05589bc223438a76
	.xword	0x8220feb5dae59e2f
	.xword	0x6ecf2291b4fd2b13
	.xword	0x4dee6b0f8ad58db2
	.xword	0x7fe4cfc2bf8d7b86
	.xword	0x9a67deed81870ebc
	.xword	0x8934c2743d0336cc
	.xword	0x013e84f718b20e12
	.xword	0x46e60bed2e46370a
	.xword	0x8f74cf0a820c363d
	.xword	0x560b7b8e356bce57
	.xword	0x6d77b868ab13a02b
	.xword	0x6cf61603b060f236
	.xword	0x9eba9720f5b7e57b
	.xword	0x2b8d3e3d3d730ff0
	.xword	0x5ccede63a888dbc1
	.xword	0xb20363a103e148aa
	.xword	0xa26faf6c6a0158a5
	.xword	0x8c03f363b3f24f0b
	.xword	0x9ed2ec94cc616927
	.xword	0x3e9ca0777e7eed4c
	.xword	0x84c1a43c1e64446c
	.xword	0x5489ffaa7577c433
	.xword	0x945a8011cc92e789
	.xword	0xb2cb2c918586be80
	.xword	0xc6a41fc34a3073be
	.xword	0x6ed93d47c5ca3845
	.xword	0x893feeda71e23572
	.xword	0xcb67bf832c630465
	.xword	0x755a8302611377dd
	.xword	0xf83a7c882f950bf9
	.xword	0x1ea84277dd5b1199
	.xword	0xb23742a139e9677b
	.xword	0xa3fbfcf6d354fcb7
	.xword	0x809cb9c222c12511
	.xword	0xdb2611b6484df1c1
	.xword	0x114afd0228a9ff0c
	.xword	0x53ee8470017388f0
	.xword	0xa96584dc14835a9b
	.xword	0x667bff0fdf846023
	.xword	0xf6697d3f9856c0fa
	.xword	0x98f292d404b0030c
	.xword	0x1f05fff9fa5e7ece
	.xword	0xe25d848da238d440
	.xword	0x51bb82066e4f5c10
	.xword	0xf6656c13be9fe2f7
	.xword	0x30711d4d9537e9c5
	.xword	0xefea192d5fe62d9e
	.xword	0xecc76e38c06a963a
	.xword	0x35943d48b0683428
	.xword	0xda11644981e4a1e4
	.xword	0x76e8f11d618ff5f6
	.xword	0x025d0ccc70fe2b75
	.xword	0x3c7d5c88bcab8dfc
	.xword	0x8b96030cc6665696
	.xword	0xe770161a218c81ac
	.xword	0x1bd901b2a2efbdbd
	.xword	0x5ba6724269cf07ea
	.xword	0xe00dde1223767586
	.xword	0x6b0337e5c4939e04
	.xword	0x8d897b5b86851a67
	.xword	0x84ce6b7d8b0e2361
	.xword	0xbb3434b71c1561dc
	.xword	0xf0b70f26dd06d330
	.xword	0x9a60f68dd1678ece
	.xword	0xd1ba6a42e55c610b
	.xword	0x3e71ad67c845c552
	.xword	0x6a8861419e02b321
	.xword	0x103c26a7a6003c24
	.xword	0xd41edb0106d5299e
	.xword	0xf6046497aae07b20
	.xword	0x98d1546f63a942eb
	.xword	0xe33c1f8266b9820f
	.xword	0x4547c65d5add24d5
	.xword	0x03269e2048b64db6
	.xword	0xbe99eba7bf53caba
	.xword	0xac84a8672194135a
	.xword	0xcaf38343dda15bc3
	.xword	0x1e0b5042eda018ce
	.xword	0x23d27bdfc9c0d5c0
	.xword	0x1c0034ad314fba29
	.xword	0x8d0e4a2d8e008c9c
	.xword	0x00347dbd279e6776
	.xword	0x2e0f2e1d5e7a1d46
	.xword	0x652785c24f71d106
	.xword	0xf41951bba5ad5579
	.xword	0xc90f323fa11c530b
	.xword	0x236b821b3437b2dc
	.xword	0x83406591df2ed5b8
	.xword	0x39fce32514347f97
	.xword	0x6eeb18978033152e
	.xword	0xe3984eff26d231cd
	.xword	0x524a22650d99e2d7
	.xword	0xe589dd72924d2d1c
	.align 0x10000
	.data
data_start_4:

	.xword	0x6ccbb20293ee2088
	.xword	0x1c4170151ccaa735
	.xword	0x57971cead506c174
	.xword	0x491db6e3c6cb7ad5
	.xword	0x5aab5dbd89838825
	.xword	0x0d8d4d7b218e5029
	.xword	0x4299585509699d5f
	.xword	0x56d06a188e98e52c
	.xword	0x1c6b1374b633b674
	.xword	0x252ac27de17564f5
	.xword	0x1ba0928fc3a89f70
	.xword	0xa1c25ce8cf1e1085
	.xword	0x17ed69a5f644b5d2
	.xword	0xc341e898839edafc
	.xword	0x70876f5064864d8d
	.xword	0xd524b927bb752dea
	.xword	0x0cc2100f14d79321
	.xword	0x47603cbbea6942fb
	.xword	0x153369430c07b5ac
	.xword	0x866757bdfcd9fa71
	.xword	0x625bebf04fe4adf7
	.xword	0x8c2958ae36b1a6f4
	.xword	0x7599c32942372d2f
	.xword	0xb86bf95e7653e82b
	.xword	0x0e92fd5360fd1268
	.xword	0x8446ba80ffbe5c2a
	.xword	0x7dab81b1ae8bf481
	.xword	0xc81d3e6cd00d688e
	.xword	0x61e3633490eeb7a4
	.xword	0xdd4180c94b11aa69
	.xword	0xe8949a1f19eb99a2
	.xword	0xf86a42674a73d94f
	.xword	0xbe21eb62a2edc971
	.xword	0xe4cb68f0c63ed5c3
	.xword	0xec40ccacbcacb1ad
	.xword	0x6f59525bf1056f43
	.xword	0xa10121c66b1f9849
	.xword	0x70d6b619eb1b7967
	.xword	0x4910f4cd5d0866ee
	.xword	0xb74b465f75acacb1
	.xword	0x14241a0d2b331c4f
	.xword	0x211b7e4d64c55f65
	.xword	0xed6ca500e1360035
	.xword	0x0d029f081783c9e9
	.xword	0x6ce6e4a1d0df5e91
	.xword	0x7470d72b69a8be3b
	.xword	0x93d643d8f76e3b31
	.xword	0xfc881fc19a018531
	.xword	0xb3a1c38ee500e8fb
	.xword	0xd62738979f579982
	.xword	0x9a10ab9207992ae0
	.xword	0x1fc4da5830d66799
	.xword	0x6b4516863454103c
	.xword	0x38488ba6fd2423b9
	.xword	0x70bc428850b738dc
	.xword	0xe55130568a454f91
	.xword	0x0d56afac0d9a2dce
	.xword	0xb9088ac8903bcf4f
	.xword	0xf1a6f393ef09526f
	.xword	0x71739d16a1242fd4
	.xword	0xe382d6b4da1204a5
	.xword	0xbff60f21fc6d53cc
	.xword	0xf425d2cd71ddb1d4
	.xword	0xa8ca057440e69a66
	.xword	0xf543b7011d51b09b
	.xword	0xd908e26a31784504
	.xword	0x5fcdf824fc06e5cc
	.xword	0xdf06213dd5df5364
	.xword	0x2770b9b35b2febf0
	.xword	0x32479476b790817d
	.xword	0x7a8eaab507fc5409
	.xword	0xfd6c7283f884bd95
	.xword	0xa11501b499936e4d
	.xword	0xffcd1a8220986d40
	.xword	0x24b2de1650b3269f
	.xword	0xfcc18f4db8a7c436
	.xword	0x4a827e96c6e7465a
	.xword	0x5c954d36491721cf
	.xword	0x7207775006714ff6
	.xword	0x9c76fdb7e9a7fec9
	.xword	0x6df90215fbdb8aca
	.xword	0xf084ed3ae06c5a06
	.xword	0x6521388b0bb962ab
	.xword	0x02da4034d5f27208
	.xword	0x833190674aa3b072
	.xword	0xfa0ad1289a74cd59
	.xword	0x78e6e2d88b31c971
	.xword	0xb533cff54c60e57c
	.xword	0x546e027937b00de7
	.xword	0xbca310dbadd75e6a
	.xword	0xda5a67fc85c3b0d8
	.xword	0x930acaef1081818c
	.xword	0x022a04242020f9de
	.xword	0x302645ba1cc00844
	.xword	0xdaccbd768b87d10b
	.xword	0x459a9b278d00c173
	.xword	0x750973159f97989f
	.xword	0xea4a8bba412d3168
	.xword	0xb008e40843290ef0
	.xword	0x20c7f8f0c32eab3e
	.xword	0xe817f92e335a5aee
	.xword	0xa507f58668a5d536
	.xword	0x7c20d91f98148342
	.xword	0x2b65dcae3f5c7a3d
	.xword	0xabe4e2d8830b152a
	.xword	0xcd2a07d6b25c4a95
	.xword	0x9f89cb272a89b35e
	.xword	0x2d1aca57dba3666a
	.xword	0x7a7106e329c8b1d9
	.xword	0x8f673a5122e4d979
	.xword	0x4cd114dfa7c93d80
	.xword	0x04eee6bb9c28a65e
	.xword	0xc6b06fc079fdcd8e
	.xword	0x54e431705f12499a
	.xword	0xaa03aa72a8e4a9a9
	.xword	0x5f9efd11b6abf732
	.xword	0x8d854a1d6004ee51
	.xword	0xb4a1c05209b64ea8
	.xword	0x6176a68e646696eb
	.xword	0xdfa3eaed0ceb3194
	.xword	0x61a2ff6905250283
	.xword	0x7faf6a814d60e916
	.xword	0x985c188bb24bf587
	.xword	0xbbffb46354477c2e
	.xword	0x2b23f84636790809
	.xword	0x0a65b4c7767d36fe
	.xword	0x729dd969f66b76a3
	.xword	0x6f996c36f62fbb2f
	.xword	0xb2155f7005c3d57d
	.xword	0x8a9175f20a275606
	.xword	0x0dab2767efea0563
	.xword	0x29c3cb1859d6b390
	.xword	0x439d708b2e3dd42d
	.xword	0xd92c79a9d60e7b5e
	.xword	0x53265da9a1762945
	.xword	0x38d90d70c13e7fae
	.xword	0xa3f5ce45556a550d
	.xword	0xc028fbf756248aea
	.xword	0x50c51b9179cf7e88
	.xword	0x224b391fa48a1e07
	.xword	0x11e98edb700d3d96
	.xword	0x9484a94a19cc779f
	.xword	0x481b72b05e0c1493
	.xword	0x48171113aa44fa00
	.xword	0xa73508b26dc20e4e
	.xword	0x1886080dc8fbd475
	.xword	0xbb9c52d3c4c0f8ab
	.xword	0x677a4bdee80b57c9
	.xword	0xca9826d608088d6b
	.xword	0x68d1a399f812af4d
	.xword	0x6ad35c200e3c36d2
	.xword	0xfa8ddb4b86655ebf
	.xword	0xf8fd466d669b51a6
	.xword	0xd877b7c8ffdcfcb4
	.xword	0xef526d47ab75df7f
	.xword	0x2ce8ddde468b2dfd
	.xword	0x9efa89e4926ef4b4
	.xword	0x4eb14836a5175961
	.xword	0x81a49c0189d6c354
	.xword	0x671228b6d73f1ca3
	.xword	0xb770721c2aa3ceaa
	.xword	0x9dd3edd17d254198
	.xword	0x6314cb0a539e79fc
	.xword	0xeffdba7b59bca332
	.xword	0x0bf9912f50427dee
	.xword	0x744400f198f332f8
	.xword	0x4a2b5e0716bbc496
	.xword	0x2259cfab67e70796
	.xword	0x458522fbe07c3457
	.xword	0x93421b124cef06da
	.xword	0x5472328ccd876ae9
	.xword	0x1131898abccd511b
	.xword	0x03cc4acc4fbb57c4
	.xword	0x1fde3c3041b35999
	.xword	0xd97e4dcc7b8c032a
	.xword	0xb4b442da98af1281
	.xword	0x8e5e819dcbfbb6f8
	.xword	0x147dd54ab82df9c1
	.xword	0x4ee5647f03c3ad80
	.xword	0xa10ea4ab4af2d99a
	.xword	0xb7c7fa1afb7b1bb3
	.xword	0xa06162550817f11e
	.xword	0xed17cc24cf52f6e1
	.xword	0xd3144b98337e4854
	.xword	0x4d6ce115856ebfa1
	.xword	0xc78d454725778042
	.xword	0x4b42bc2e4f151101
	.xword	0x27b7fa66a4f86268
	.xword	0x2163cc41a80216d5
	.xword	0x09ba47da96ecd8af
	.xword	0xc802dfc073b7c7b8
	.xword	0x84816a66783d0797
	.xword	0xe694442f39119bcb
	.xword	0x37c47a2ee841ed46
	.xword	0x7236a911f43e0d81
	.xword	0x438a97a7a220f497
	.xword	0x31529e858375c7f8
	.xword	0xd660f254c3223717
	.xword	0x9ee58bd3b6ab39dc
	.xword	0xa61f03dba25f5c97
	.xword	0x8fcfcc6d29819c93
	.xword	0xa07d844d3da5b09d
	.xword	0xb7ff8fea55a2155c
	.xword	0xdc231573f2080de9
	.xword	0xac92738bd497cb0d
	.xword	0x456c907f69c4da5a
	.xword	0xc40805d038da70b5
	.xword	0x6286aec2fcaf48f3
	.xword	0x77e2a5bae91f59a6
	.xword	0xc7060c5d2491b6fd
	.xword	0x192ea5da972066a6
	.xword	0xbf8a519a43dfb503
	.xword	0x868c274120fbe263
	.xword	0x793952973dbef0e4
	.xword	0xcc199cc15d1d2381
	.xword	0xa0cef431a1e25bff
	.xword	0xddaa935627a04742
	.xword	0x39f3a54891749471
	.xword	0xbc3fceb59a9e32f9
	.xword	0xd45838866ecac8ce
	.xword	0x8f5900600943b8f1
	.xword	0x02a21db7922a7d32
	.xword	0xe1fd79d2cdbd587c
	.xword	0xc420b34bf0dbf686
	.xword	0x3fc47361217b9ea3
	.xword	0x1e900e9a6da351e1
	.xword	0x1d7a33376fb474f6
	.xword	0x9f51ae80ac6c37be
	.xword	0x92a98bd191f19cc9
	.xword	0x4e6e478b96a2ec41
	.xword	0x0a8e7d10ceb1064e
	.xword	0x4e2360bae316e131
	.xword	0xd3a41a9ff314aab0
	.xword	0x42c62c370ba13d92
	.xword	0x569edb9390a32db8
	.xword	0xb48517dc69084258
	.xword	0xdbb7077f3fbb8eff
	.xword	0xb6d5b75774f322a1
	.xword	0xcd47fb139e3f45dd
	.xword	0x9527b351d6272494
	.xword	0x19cf28ec0ee4a856
	.xword	0xae0549ec4c533115
	.xword	0x38735b6cf3e0ad8e
	.xword	0xaf6491dc52fc06d8
	.xword	0x2a4a5a9cc3cf90ad
	.xword	0x349e6a562ebe626a
	.xword	0xbe2be2a43832b879
	.xword	0x450cd05bdb62cd3f
	.xword	0xc3d0c831e85a9e2e
	.xword	0x3d0996129239613b
	.xword	0x4c425544d4e4b76a
	.xword	0xfd6ed8a9eb7cd70a
	.xword	0x8768a41b0c034a3c
	.xword	0x02bdedf7f677e0b2
	.xword	0x02a68569b43b0165
	.xword	0x7a06cac1f0e23fbc
	.align 0x20000
	.data
data_start_5:

	.xword	0x6e393ec7db76b055
	.xword	0xc1ba6cd770e49b12
	.xword	0xa2b46f342e7d3e8e
	.xword	0x7406f9646797225f
	.xword	0xa432aea6e6cf4bd4
	.xword	0x61564179871b02c6
	.xword	0xa50405dc699bdcd2
	.xword	0xe459462ef1a3b967
	.xword	0x6825a4216fc8f0c7
	.xword	0x3b0f6098539c567d
	.xword	0x0b290e3dde3250d2
	.xword	0x35fed451bcd60bba
	.xword	0x253fd775ce2582d3
	.xword	0x0336243e19dbef31
	.xword	0x02e462876fdb762c
	.xword	0xaa355fd87273bd1b
	.xword	0xf84c10defa9cdc3c
	.xword	0xd586326d0ed74205
	.xword	0x09a9d94906e74fe6
	.xword	0xea5bd8ce7d577cd1
	.xword	0x7f3c7cc193919b7a
	.xword	0x956a957a7d80cac7
	.xword	0xc87407609c3df4f3
	.xword	0x40aa16038c1c788b
	.xword	0xbec8e5a8f4e6bc64
	.xword	0xe22d592828201e57
	.xword	0xbb7b97aaca6a6ec6
	.xword	0x51b6530d08a6fc41
	.xword	0xc054e7b85dfec8a6
	.xword	0xdba6ec176ee6e4d8
	.xword	0x0cd85315bc79be60
	.xword	0x61a33f6cef1a4e7c
	.xword	0xeeb4f8a7fb0df5cf
	.xword	0xb3c6953767fb1d22
	.xword	0x1d7b0e35e1425b33
	.xword	0x94bb05b184e433a7
	.xword	0xc3cb914a899b27d4
	.xword	0xcf5c5fdcea7cb8ac
	.xword	0x0711ca4bd6baa0fa
	.xword	0xf9ee65dc0b456dc0
	.xword	0x8ab0d42054736d8a
	.xword	0x852aec8846f10baf
	.xword	0x5f7594854d82234b
	.xword	0xc039bd40e5627d07
	.xword	0x6e33f384d3810a3a
	.xword	0x33b121a772e665e1
	.xword	0x4c9656e0c11861e6
	.xword	0xc8f9a49223838a9f
	.xword	0x26a9229bf5c5c446
	.xword	0x419d92004c2862af
	.xword	0xd741cc8fdfd3c592
	.xword	0x6f023fef4cae8a8c
	.xword	0x9184889a21cc6fbc
	.xword	0x9b265acf4c3aaab4
	.xword	0x64fb126bbe7b63a8
	.xword	0xde8fcc43686533c0
	.xword	0xabbb5e79943c20c2
	.xword	0x15779687ad1ba837
	.xword	0x49c0370be6ce8fd4
	.xword	0x37dce78c51408900
	.xword	0xfcb1c8ac965a11c1
	.xword	0xa8600f6556c5bf71
	.xword	0x2866fe248b559d85
	.xword	0x10d6e85cda88ad58
	.xword	0xfd532bcb47338501
	.xword	0x9c4e0dec0e06728d
	.xword	0x70c4f11fc5302833
	.xword	0xacc30e56b9f6e735
	.xword	0x820db61ae62d3af2
	.xword	0xb0138429ad2e7496
	.xword	0x6b382090d15876da
	.xword	0xa4a8c6e9e0349a5a
	.xword	0xdad2c3bcf95293f3
	.xword	0xc7347750b0600013
	.xword	0x0e8581189a0ce89b
	.xword	0xfcda1c18c4361e71
	.xword	0xf2d4adea838e963e
	.xword	0x52e4507845f91a60
	.xword	0x6dae40c850277f6a
	.xword	0x739a1f1504c7d37c
	.xword	0x39bbad18bc8c1e3d
	.xword	0x8fcea67274e59932
	.xword	0x71a44785a80d6fc5
	.xword	0x2ec6778dde5eb6f8
	.xword	0x53295556e2014207
	.xword	0x41dc2c17d9acbc62
	.xword	0xced8d798e9a716d4
	.xword	0xa0894d08bf6ad240
	.xword	0x6dc2e2aca5f1ed55
	.xword	0xd686d8d75b605cbe
	.xword	0x2b5187077ec76a94
	.xword	0x77f85b7724d04c27
	.xword	0x044010c985d6ab62
	.xword	0x43df1e28dce799da
	.xword	0x004064843b9c9ee5
	.xword	0x851b7ce70a09f4c3
	.xword	0x6dc6f7471d43f09a
	.xword	0xe23c5270f36baae9
	.xword	0xf934c6ca6ade39d7
	.xword	0x167b8279f49b6f80
	.xword	0x76fdfb27588d2605
	.xword	0xae2268cd8e5ec3ca
	.xword	0x8d2f7f8570dd0d45
	.xword	0x97d38da00bc56584
	.xword	0x66d93e47ee2892c9
	.xword	0x045fedf7fd8807dd
	.xword	0x94f33d217a7dd716
	.xword	0xcd426217e362f953
	.xword	0x492c7f0565bc5f10
	.xword	0xe5b42867edccbb9a
	.xword	0x0eee6a08759af6f2
	.xword	0xb0c2ff243de1ad24
	.xword	0x92178d76e07d7567
	.xword	0xbd63b3977aac508b
	.xword	0x2282ab20ebaeb094
	.xword	0x1d3177a470a5fe9a
	.xword	0xf0ccb0fc13de8a81
	.xword	0x4d91663c06d605a7
	.xword	0x8ffdc785d089a193
	.xword	0xf27f26bdf79c996f
	.xword	0x01a145855c114c5b
	.xword	0xeb6854add8911250
	.xword	0x241e05d00f515424
	.xword	0xe4c6b51235cedbc9
	.xword	0xa4a1461a7aa75044
	.xword	0xdd47fba24f1ca257
	.xword	0xa74b0db20994db39
	.xword	0x5c5fbc79f612b604
	.xword	0x731291f8146041e7
	.xword	0x1da68590333e7dcd
	.xword	0xc33a35476331f499
	.xword	0x381339b1e13ca347
	.xword	0xd1165d7c9075ebe1
	.xword	0xac1106cc997d4d4c
	.xword	0x15f802571339178e
	.xword	0x12f254fdf2a47fbf
	.xword	0x2f6373704d760911
	.xword	0x7bd88e2c96c0f634
	.xword	0x49ee83f319728943
	.xword	0xc360881875de3d2e
	.xword	0xf1f23463ac768a09
	.xword	0x6456d0b2b108c6da
	.xword	0x5ce2163a6a6de87f
	.xword	0xeb7d8f3deb758ced
	.xword	0xcf7c81eac06972f6
	.xword	0xe81480b0f198eded
	.xword	0x9214dc32d265004f
	.xword	0x7253f0044ab2e1bc
	.xword	0x93ec488c4e7b9ef4
	.xword	0x3366b7bf58efcda7
	.xword	0x8f74b2801a752db1
	.xword	0x1f3e54a4accdc1f8
	.xword	0xe95429d4d55ab0a3
	.xword	0xf188d4f73b462c71
	.xword	0x59aa97bc6bdf48c9
	.xword	0x30684756b217ee0d
	.xword	0xe12c03bb64e341a6
	.xword	0x4cddddf316dfc780
	.xword	0xd0a6097a6c671821
	.xword	0xdb82602c606e93e1
	.xword	0xb09ae220056d644b
	.xword	0x70106046b488e387
	.xword	0x65f1e99e822a0b43
	.xword	0xcc57c51160a654cb
	.xword	0x8dfe469c7530a82c
	.xword	0x1030ae0bb6c0dce7
	.xword	0x39a6870edc6cbab2
	.xword	0x0640fb10e67bc362
	.xword	0xfc81b1be043855ac
	.xword	0x358dbf6f2b455bd3
	.xword	0x23305a129ae51491
	.xword	0xf6189e99883e1da1
	.xword	0x049fc134e2d1504e
	.xword	0xa40947e8e369c7a8
	.xword	0x582469a658df69d5
	.xword	0x997cc3437ead34b6
	.xword	0x2b353aab4efd9f4e
	.xword	0x7591b6a56aa4a57e
	.xword	0x6ce157d6d0f0a1c2
	.xword	0xef3879ff07ffc807
	.xword	0x6cb36eec3d859df5
	.xword	0xe1138e7d79ae6fa2
	.xword	0xf7d99b81f3acac26
	.xword	0xeac9c628184c3a43
	.xword	0xbb6f99703dbc27b8
	.xword	0x301260adc66637f8
	.xword	0x5929ea7140a63c6f
	.xword	0x6e35a20583ac73f0
	.xword	0x4c314c2c6bbc4a54
	.xword	0x73df166a284b43db
	.xword	0xf40ea682211237b7
	.xword	0x5af9c30187f0a621
	.xword	0x671e3cb528e432b2
	.xword	0xa29a2714e1f044bb
	.xword	0xfa4c31a19bd70264
	.xword	0xc4e7a8703b928fca
	.xword	0x0119d284173b9482
	.xword	0x2d2de66744b6a717
	.xword	0x2d7067bb521785d5
	.xword	0xd4ae5da68e010b09
	.xword	0xc962f24b70493cdf
	.xword	0x0077002a105a632d
	.xword	0xb89150ce92091612
	.xword	0xe3faa1feada458dd
	.xword	0x5b54f996c4345ddf
	.xword	0x53aa34a2cbb4eded
	.xword	0x7e16615627b01fbe
	.xword	0x79578bf85b592db6
	.xword	0x59c022c0e2cded22
	.xword	0xeb1eed9b8f512aef
	.xword	0x4e15c5a90a3091c2
	.xword	0x8ae80e6a46416934
	.xword	0x02bb4a76a4d586c9
	.xword	0xa2eacd8341edb176
	.xword	0x20e1df1b71966880
	.xword	0x5476dcdd318bb430
	.xword	0xc1563a255a1fb9ab
	.xword	0xe000c6f927f4cefb
	.xword	0xe771fa0a1a99fc7b
	.xword	0xfc05a749bbfad2e1
	.xword	0x05b7d7e196831640
	.xword	0xe495cd2c7a2a501f
	.xword	0x6a60f4f68f8fcb7e
	.xword	0x3543fbb52fc04330
	.xword	0xc493d8600dabff1b
	.xword	0x132f29bd9ae7a062
	.xword	0xdf7458b84b460779
	.xword	0xf1d5a192e19d1471
	.xword	0x12f6f86fa619d061
	.xword	0x70537e9803e04a16
	.xword	0x85cdfbdc06cc1fab
	.xword	0x17f975ca0d342ab1
	.xword	0x26e08a04073194aa
	.xword	0x764c467aaded76e2
	.xword	0x09155ada23522c3f
	.xword	0x5a243948a9cb050e
	.xword	0x018640a36729345d
	.xword	0x3e606eff7b29ebc4
	.xword	0xdf6b721533253e5f
	.xword	0x4ddbed8fc09e76e0
	.xword	0x77a18017d6d7530c
	.xword	0x6486ba26faaafdfb
	.xword	0x937e187344dbe160
	.xword	0x111f1ba232e2728f
	.xword	0x9e5b27557fe640e8
	.xword	0x95093466f5e9e794
	.xword	0xc51b69fade4a2594
	.xword	0xedb91cc994fe1560
	.xword	0x94d4e4eb34e55de4
	.xword	0xe1de27a1b2dd6c7b
	.xword	0x1ede5ed368ceb8f6
	.xword	0x0aaf2fda0b3c2208
	.xword	0x24b1bb3859632f8b
	.xword	0x6007ae0991b222f2
	.xword	0x9856cfdd15a72214
	.xword	0x01a8d3ed1489afed
	.align 0x40000
	.data
data_start_6:

	.xword	0x13c5b3ef12b72f8d
	.xword	0x02113b308e44d59b
	.xword	0x5c26afc22d5b5ff0
	.xword	0x70d564c56a716d96
	.xword	0x4106fc66c7c679c2
	.xword	0x0fbba44451ef834a
	.xword	0x13d42092d7cd88e0
	.xword	0x7f51738dbb75dcda
	.xword	0xb47d7cd8b72820c6
	.xword	0x6102c748e333d72d
	.xword	0x3d47c17b9761bd29
	.xword	0x48a9bcf6d4b26a34
	.xword	0xb1d80a9011c438da
	.xword	0xb233fac4743f3780
	.xword	0x618d788530879de4
	.xword	0xad58d9662f7572ea
	.xword	0x9418440538edfecb
	.xword	0x89ef84288dd8a157
	.xword	0x5c3210de8c9a6583
	.xword	0x396013bd0958d6cb
	.xword	0x976d041edb81139d
	.xword	0x774810932229998b
	.xword	0x157a44e99512b63e
	.xword	0xedde026114d4a59a
	.xword	0x69cc33e7e1239043
	.xword	0xcdad1e812c647c3c
	.xword	0xc3414f3f884c94af
	.xword	0x2e693167cee0fb03
	.xword	0x7ce7b4d0cbe090a4
	.xword	0x5eb5447f2368f93e
	.xword	0xf94bfa08d4b8f706
	.xword	0x5c611c17218f9862
	.xword	0xad59ff2b59c07087
	.xword	0x00205164366aff96
	.xword	0x7eb5ac5b75f029a5
	.xword	0xf0b3dc747e6bf061
	.xword	0xed0e2ea507005da9
	.xword	0x3fdaa86016b05d8d
	.xword	0xad95b49e5d0e7244
	.xword	0xce91a79fbb2b1562
	.xword	0x2704c818d980a66d
	.xword	0x1260b13723c46290
	.xword	0x7bc45fa003eb0ef4
	.xword	0xf60f3c2e456afcf5
	.xword	0x84abf776f8d6c5d6
	.xword	0x4c78919ba93704d8
	.xword	0xa9fcfd8389643bb8
	.xword	0x46ae1ca005c7126f
	.xword	0xe749b0ff600e4934
	.xword	0xee06d44cf4b5c8d2
	.xword	0x33e6db8f651d3451
	.xword	0x23636174138129e2
	.xword	0x79dda6c812e9c6ae
	.xword	0xf5fae0b2f52156c3
	.xword	0x13de464a41ebabd1
	.xword	0x5da7c12102b5c0c0
	.xword	0xdae63e28f04b3110
	.xword	0xdd5760bb60b9ce7b
	.xword	0xa21bfde224927a6f
	.xword	0x679e01f404eeb0a6
	.xword	0x7ad8133078b7885c
	.xword	0x97383b4f8f27c584
	.xword	0x762f5845b731bb12
	.xword	0x1a48de064a4bc12a
	.xword	0x1e9ee11333335f5b
	.xword	0x1c5101fbcb1b3e90
	.xword	0x27b703a62f7db373
	.xword	0x151bb291f617a5f0
	.xword	0x0b6c7079f14e317d
	.xword	0x3d557bd984834a7b
	.xword	0xf249a5321c39263a
	.xword	0x4967c6d748adcdca
	.xword	0x556ae9a7458678ce
	.xword	0xf0780e856b35285f
	.xword	0x4f4f9bf4e5a174a5
	.xword	0xfe7ff0aa6a55bebc
	.xword	0x2cdac57f8af6e3c5
	.xword	0xea54eee3b625fc89
	.xword	0x99396fd500d1a0ee
	.xword	0xfe13da355b4352bd
	.xword	0x68a55d8d4795f3e1
	.xword	0x0bb3f3a7ac8aa772
	.xword	0xf2216cc4e4f6a0f9
	.xword	0x6bb8c0dd83c8699c
	.xword	0xb638265c6ec7e07f
	.xword	0xfa43945745667870
	.xword	0x4090055e9307c624
	.xword	0x0050207bedb19bfe
	.xword	0x4c360634dbd6a854
	.xword	0x80daa8ec652da08e
	.xword	0x58fa1a2d2763737e
	.xword	0xcb2eb1c188756856
	.xword	0xaeca00b58d26a623
	.xword	0x61267ee125c6674c
	.xword	0xf747eb35f0ed81b5
	.xword	0xdd6501bb7a2d34e6
	.xword	0xf40041a86ff95a2d
	.xword	0x72648dc9dfc96ee0
	.xword	0x332161f5905d66ca
	.xword	0x1c9ae04b27a9ade5
	.xword	0xca33114b719ad060
	.xword	0x103ce07bf59fc8b5
	.xword	0x5626ce8a4229ab4b
	.xword	0x73023c1e46d1c4dd
	.xword	0xdb9c5e4b92144dd2
	.xword	0x62e87fd4d02ae49f
	.xword	0x66711bbe68da9813
	.xword	0x1db6e8f921daed06
	.xword	0xce0015d71350e49f
	.xword	0xa0950b72bb1c908b
	.xword	0xe3ed7070fdd52ddf
	.xword	0x75287efcc11f99bb
	.xword	0xef0f45d81137d690
	.xword	0x4b5f6acfcc9b92e3
	.xword	0xfde582ae84ae19a2
	.xword	0x3a125b804bfc45a2
	.xword	0x92316b079e3d651d
	.xword	0x15b5c4db0f4c9137
	.xword	0x350b62ad7adaa4ba
	.xword	0x437fb3ae3e311fa0
	.xword	0x82be460943116153
	.xword	0xef9665ab128aa190
	.xword	0x0b9cea776ddc6ad0
	.xword	0x6a942d636e297474
	.xword	0xb0228e71f38b2942
	.xword	0x530e143408ad2731
	.xword	0x3addaa4b70301116
	.xword	0xbf6c4498a5deb8b2
	.xword	0x7b87f2ac13f1dc5c
	.xword	0x172e2f6563556385
	.xword	0xb3d980812eca8497
	.xword	0x66d58afa0ba147a3
	.xword	0x622fa766755cdeb4
	.xword	0x0ed361018df2083d
	.xword	0xa24552bfa8c1de55
	.xword	0x981ddcbd5c5a7e27
	.xword	0x5b724044d7e7fa78
	.xword	0x1b86ff1852331f14
	.xword	0xd8237f137db91687
	.xword	0xadae054118ed6c1c
	.xword	0x945a96732264d846
	.xword	0x0c60a0844e95afef
	.xword	0x53f08c5efc57c329
	.xword	0xaface37348ca75bb
	.xword	0x1918d5aa14465358
	.xword	0xa26221f7e7553e09
	.xword	0x9b1d1fcc3add1f25
	.xword	0x3a00a1ec135e836c
	.xword	0x55042befcf2b4828
	.xword	0x74bf0b24601fc499
	.xword	0x6b889b26d694a11b
	.xword	0x575d888dc4624dd9
	.xword	0x6cbae9e7f4d85124
	.xword	0x22cae924c63756c6
	.xword	0xb8b70e8cc7dc16ea
	.xword	0xd76a537e87c9825c
	.xword	0x5ab965919faa0a6e
	.xword	0x6228fe3267c5d4c0
	.xword	0x6200bba94ba97708
	.xword	0xd71156025e8610c7
	.xword	0xfecab19472fb5b98
	.xword	0x2cf1e110f413533b
	.xword	0x0a0c3fc7bf901b47
	.xword	0xdf81de14c65dede8
	.xword	0x432eabd982e6bf12
	.xword	0xc8a7608ddc30df52
	.xword	0x52e05a8829588083
	.xword	0x6ac84b1844ee961c
	.xword	0x58c049ddb2fd167d
	.xword	0x8bec9ad4aeb8fc28
	.xword	0x57506c228468c643
	.xword	0x8c58f05799efb0b3
	.xword	0x420d973afbac53c8
	.xword	0x004550066f22e177
	.xword	0x56212efd9f71bc1b
	.xword	0x2d09b629817e0367
	.xword	0xfb8de870407ba942
	.xword	0x5b746f669dc7a384
	.xword	0xb58b41d31337d80b
	.xword	0xf4999aafc53186a0
	.xword	0x407bf27d6643cbc9
	.xword	0x4bc467f685691de7
	.xword	0xfa6a100f73c46a0c
	.xword	0x21a0d4d411344ace
	.xword	0xe83f535b0badca7b
	.xword	0x6c6209d7c8b53afa
	.xword	0xd8bb2e7d3574105c
	.xword	0xb50e6a30bcf359ed
	.xword	0xce83b1fe5810e3f4
	.xword	0x1883ff5b3ac216b2
	.xword	0xb7bcce256d60aa31
	.xword	0xca4f1522397b881e
	.xword	0xc3c28e987adc5c02
	.xword	0xec7c3f15810eca60
	.xword	0xba4910fc2c45250f
	.xword	0x9e200f194f8a3677
	.xword	0xd36996a8f03bfb54
	.xword	0x371918ff59330a76
	.xword	0xc7cabf60fe9749d1
	.xword	0x7a1d59c2d0864f9f
	.xword	0x153a1fb9bee2f08c
	.xword	0xd92298f7bd87c64e
	.xword	0xc015b86052a439a8
	.xword	0x126cfc5bef62239b
	.xword	0xa1180856d9dc4441
	.xword	0x1e286b61267abf5b
	.xword	0x0826289aa91ed65c
	.xword	0x2a993e88eb0eb6f1
	.xword	0x7196ea676abe6087
	.xword	0x0b8bd56a4d6397a0
	.xword	0x6db79bf581227a48
	.xword	0x4ed77db75ae4ffd0
	.xword	0x168b41ca3e5604a5
	.xword	0x057db367f7ed6642
	.xword	0x1b0216c1ccf01649
	.xword	0xee350d016df91473
	.xword	0xa9821efb5a9002b6
	.xword	0x9ed38fe6a1f4323d
	.xword	0x2bc4a3f29c2166b3
	.xword	0x9579701fded35a6e
	.xword	0xea7112b6e047e22f
	.xword	0x36498651367b7bcc
	.xword	0x95e5fc54b1bcaea3
	.xword	0x6daa3fce377f7a32
	.xword	0x802b9d4cb096d697
	.xword	0x9bc81006ebe16ac2
	.xword	0x41725a07f996816d
	.xword	0x93ac21ee6242d650
	.xword	0xf5af5458e6454be5
	.xword	0x24acb57774d78ad5
	.xword	0xf7c9e3530ad5971c
	.xword	0xe1b4005f8ced08fd
	.xword	0x67f4dc5785591372
	.xword	0x1cd66059fbbcd16c
	.xword	0x5e9f93ccea897032
	.xword	0xd4c92e0784a14ca1
	.xword	0x2f31f9800cd7d2c8
	.xword	0xe6de5f139dd4c13e
	.xword	0x73f76ed5bcdea8ad
	.xword	0x4f80a2aaa20bff03
	.xword	0x9c02a153427e3471
	.xword	0x286009d5df7b916b
	.xword	0xd4602a8220fef703
	.xword	0xc9e537f9f431cf9d
	.xword	0x4ea1a8a33f7ea4d9
	.xword	0x7640a16ff6f35fdb
	.xword	0x7c13992e176803fe
	.xword	0x22a25a6d54451d60
	.xword	0x7391110c0951c887
	.xword	0x70404b86290e8cc0
	.xword	0xb3ed6e55dffd3932
	.xword	0xf19520e5de844095
	.xword	0x741c4679a801c00c
	.xword	0x277d1d2aeb21840f
	.xword	0xfbeb90801db3cb6c
	.xword	0xa91c67905a41ad39
	.align 0x80000
	.data
data_start_7:

	.xword	0xd4a6f61b2cf7b3f4
	.xword	0xdf30a390a63c3d5d
	.xword	0x7877da667a5c40f0
	.xword	0x884b34f17aff8ba7
	.xword	0x983ae701aaf64567
	.xword	0x6ace5efa82b89b05
	.xword	0x428c2cc0cf71fa78
	.xword	0x53c44025d267d851
	.xword	0xca0ac3f66b084358
	.xword	0xd9707609c10ee220
	.xword	0x0365f534a8c06907
	.xword	0x3a9988734fad2dfb
	.xword	0x7ec7a62b58687f1f
	.xword	0xae585b71ef03eec4
	.xword	0x99d25486ba49e376
	.xword	0x62674b6d64d3eac8
	.xword	0x4ede232ec8faf650
	.xword	0xc166b1435c7cff17
	.xword	0x04035cbb51fc0e05
	.xword	0xfe8b0f3be23476cd
	.xword	0x5893f8fb791dbde4
	.xword	0x731246574a4c03f7
	.xword	0x75f64b50c31acf7f
	.xword	0x827d4de361aaab9c
	.xword	0x31a169c5130a0016
	.xword	0x709f8651d7528b31
	.xword	0x04404b79cebb0552
	.xword	0x3737fdc62dc67316
	.xword	0xb0e9a20a3d27780c
	.xword	0x56c93224f4b05647
	.xword	0x7f824a7f98f56f3b
	.xword	0x0b021e240348ef6a
	.xword	0x74df99912856209f
	.xword	0x79b0d65caf255479
	.xword	0x9ef966ace9d3917d
	.xword	0xcaefc7cf350e8d7d
	.xword	0xbb0b23898f202023
	.xword	0x77fa7590396a6159
	.xword	0x7a33e79a288a8279
	.xword	0x63655d035917a2e4
	.xword	0x888bba1e7171c869
	.xword	0x21b50e3fb0860033
	.xword	0xfde484156369784f
	.xword	0xc4a9ebf2cab60af9
	.xword	0xae8eeeaffdf83fbd
	.xword	0x70fd9113100b5053
	.xword	0xcbf06a407b431cc6
	.xword	0xdf04420b1429598a
	.xword	0xd826f899ee0354b7
	.xword	0x20f167a09cdddc78
	.xword	0x4530010df110fc2c
	.xword	0xce1a71005cd87f34
	.xword	0x8bf5c0a7a41b0d54
	.xword	0x8b47acd627856c67
	.xword	0xa9a6946b22f17621
	.xword	0xab9c13c654f7d086
	.xword	0xfb0e9683f4e789c6
	.xword	0xc04654d088288398
	.xword	0xbaa48ae1f54f6db4
	.xword	0x0b9d54746b124c20
	.xword	0x2ce5b440979391d4
	.xword	0xc4fb4255e0e9c0d6
	.xword	0x057bf2fdcc91f5ef
	.xword	0x7ba9c18f6adb63c9
	.xword	0xf3dfb106c2583d7f
	.xword	0x9690b4821185bf5f
	.xword	0x3c3caf83c228619d
	.xword	0xee2df7e0c469f8ec
	.xword	0xa174a558a973ce56
	.xword	0x51cd3b48ddb414d6
	.xword	0xa96b1c33fd069966
	.xword	0x277c6737ebb7645b
	.xword	0x985d1ff0a9ce3c8a
	.xword	0x18a852ded1690d51
	.xword	0x5b5abc389f5a3354
	.xword	0x0550cf8cc904c04c
	.xword	0x1516621965491245
	.xword	0x61742d9065902c75
	.xword	0xe18c152912cfb15c
	.xword	0xeee86df2f827c077
	.xword	0xa42ad51edec56e9d
	.xword	0x2676fa62004d2842
	.xword	0x685f91f59a8e00f6
	.xword	0xe86c1cb68fefdf73
	.xword	0xe9022ec184b16b00
	.xword	0x5e3f02c1279f949e
	.xword	0x0bc359f26f529a58
	.xword	0x30fe60d85522db33
	.xword	0xeedf5634fad219fc
	.xword	0xe93f1d2da04da6f6
	.xword	0x214e49e6dd957e2e
	.xword	0x1b5c031cb86c39de
	.xword	0x10fef872c101ff35
	.xword	0xb86d3009a6a3685b
	.xword	0x92a024b607b39e4f
	.xword	0xc5bfd7ef206f0f26
	.xword	0xb40a06b27316e0dc
	.xword	0x54ab8b9f232360d4
	.xword	0xb7587849cdf46e56
	.xword	0xe61e84aa84b87e99
	.xword	0xdb82a64c5d6b718c
	.xword	0x05156d8b4d58f2bb
	.xword	0x31fce64c74105961
	.xword	0xf13293c32924aab0
	.xword	0xf633ebfae5b3431a
	.xword	0xdd743213c2fd6491
	.xword	0x3ed3103da43027d4
	.xword	0xd2c897e5b78d64db
	.xword	0x8027a6a2994837b3
	.xword	0x4238d51c5f748789
	.xword	0x36eec99ce4b65828
	.xword	0x2de88227717d5fa3
	.xword	0x3285890b2ed7d374
	.xword	0xedca67e19ea81306
	.xword	0xdc55b966e5dfed68
	.xword	0xc84f0e9ac38431c1
	.xword	0xac6d22cbe6a7d8d9
	.xword	0x3550a3558a0e4893
	.xword	0xaf2ce97d7137aac1
	.xword	0x08c5d55538f90904
	.xword	0xcea0f490f34f6d5c
	.xword	0x4ae268c0147fca23
	.xword	0x9bf1a3a41bd760b4
	.xword	0xfbf6cf385b4b0cfe
	.xword	0xe1e6a78eb200c9b8
	.xword	0xa606428c2e3b6101
	.xword	0xbcc71c955f080277
	.xword	0x59a84f0f78b25d0b
	.xword	0x8695430bc7aa7ae4
	.xword	0x07d16291719b8ba5
	.xword	0x988364e15d6a3f76
	.xword	0xde77e3716e94b95b
	.xword	0xc20af7864c893f67
	.xword	0x5da92aa209a8477e
	.xword	0xf37a01a0efc6dc21
	.xword	0xaf50f483c868b933
	.xword	0xd0012c2acb28086a
	.xword	0x34e84735bc15d1b7
	.xword	0x2a73b5f20d9e4904
	.xword	0x9ac0121175f2e3c2
	.xword	0x635d2c069d967fc5
	.xword	0xcb119ca65b097aff
	.xword	0xe7f9d4d1e54c9050
	.xword	0x749e28d811f8b91e
	.xword	0x0399f9bf53b3fd6b
	.xword	0xe9c69c0ce49405d7
	.xword	0xb8bea41269e41ad4
	.xword	0x77d2b6b618f08e3c
	.xword	0x4b0a7994a728abe3
	.xword	0x60cb8eb705c1e191
	.xword	0xcd4459eac0e5dddb
	.xword	0x0648a57247e2d766
	.xword	0x25568524d7bc1c48
	.xword	0xfca6c9b6ee661e53
	.xword	0x1ccfdd9b974dceae
	.xword	0x7bc2338ff8aa9576
	.xword	0xa79ec39927fd63bf
	.xword	0xea3424be76e3c113
	.xword	0xed25fe71f34b0e3e
	.xword	0x29f662bef41029ca
	.xword	0xa1d2753183e3ee6d
	.xword	0x4e40a5a1d27e5060
	.xword	0xc34f0a563b398fa7
	.xword	0x748f560f436dae59
	.xword	0x08c67e87ee610190
	.xword	0xf6f3b850988422dc
	.xword	0x0fd6f6fab4a27c96
	.xword	0xaec5c4d508910c86
	.xword	0x422a3d61e713aaf4
	.xword	0x54f2ef0105afa47a
	.xword	0x4f226f286d766f08
	.xword	0x0ccbf0719020fcb7
	.xword	0x4f25eb96d681293d
	.xword	0x98461a012f2260eb
	.xword	0xb2c6d19eb41262cb
	.xword	0xafd7d5a2d063f5c5
	.xword	0x771316dac9ffd723
	.xword	0x9d6c39d14a738557
	.xword	0x51301fd35d670dcb
	.xword	0x1679f91d3c0bb0d6
	.xword	0xf914ca80c1a80f20
	.xword	0x3ac5a1e473f97bfc
	.xword	0x8c7ac5ab35163dbd
	.xword	0x3bad93fb6247579e
	.xword	0xb04f206e870fc06c
	.xword	0x01530aeb1fa3b08c
	.xword	0x73269149fd04c25d
	.xword	0xb669f866f8487f2c
	.xword	0xc4fd9e482bfe6bcc
	.xword	0x11fb8e55ce4097e8
	.xword	0xce896004053fb9e4
	.xword	0xda3c4caf72a181df
	.xword	0x4adc0e78260d889a
	.xword	0xd094d56f130e7310
	.xword	0x1d9125d6b4bef34b
	.xword	0xc01929bd325b0ae9
	.xword	0x149d7a10c14a9c02
	.xword	0xd25ee4871b593034
	.xword	0x9e124ec21251617d
	.xword	0x9146c2d92f6987f1
	.xword	0x19ac82997c3072d0
	.xword	0xff63db8bdaf45e62
	.xword	0x066a258d5b19fd06
	.xword	0xbd3b790e6f4b4daa
	.xword	0x4e5806c061e09d59
	.xword	0x937f806fda588aea
	.xword	0x744aab3148dc05bb
	.xword	0x330b0b5349089ce3
	.xword	0x94a6cb7a16d8d579
	.xword	0xc5e1e462ea867d10
	.xword	0x7d1bb73fd87b5ce3
	.xword	0x3aba823cad9b4a61
	.xword	0x47d3470be1089092
	.xword	0xf4d9c9d42745a574
	.xword	0xc1fed83decb6555b
	.xword	0xa020046261678fc3
	.xword	0xdac4dcba5333337b
	.xword	0x2040b37635158c3f
	.xword	0xccf2a4754646ac53
	.xword	0x8fe45a907fa7384b
	.xword	0xd1bcd5eb3b7f095e
	.xword	0x62f845e57b945c80
	.xword	0x2e287ed422ec3559
	.xword	0x0b1b67e76a500bde
	.xword	0xd3344f1004d38850
	.xword	0x77860899d75dda5c
	.xword	0x22dae370c72dbd82
	.xword	0x165e38a03784ca9f
	.xword	0x66548c2b441c87ea
	.xword	0xa7df7fa234644a2d
	.xword	0xc6e55237daeab572
	.xword	0xc9191e9e10f8b5e4
	.xword	0xdf37a0359aab1bd3
	.xword	0xafa24cf7cecd1454
	.xword	0x2f93185d30dc4553
	.xword	0x300cafd48efa3dc3
	.xword	0xf9b7e70f2bf671fa
	.xword	0x2378698567503572
	.xword	0xce03ec3098c83dd8
	.xword	0x2f8b2e10e39790f1
	.xword	0x1b97f3c92564d4c8
	.xword	0xd94509f3bef615dd
	.xword	0xa96de0eb88a2c976
	.xword	0xac1e0c2c3782c7c5
	.xword	0x0f307ef076dd637e
	.xword	0x227ade3a6a8da9fd
	.xword	0x9590654f777bfc8d
	.xword	0xdfab505b6ace5908
	.xword	0x44e21af3c7c6ddb8
	.xword	0x3c54c4943cab7a61
	.xword	0x5b4bc8ad9f6f01fa
	.xword	0x734459c1abaf6b78
	.xword	0x6daedd474cdb0fde
	.xword	0xaa615be0e2d27275
	.xword	0x0f3b352db3cf4a24
	.xword	0xc496809013bc0dd0



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
