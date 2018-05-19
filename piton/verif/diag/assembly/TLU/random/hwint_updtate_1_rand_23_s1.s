// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_23_s1.s
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
   random seed:	317119041
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

	setx 0xbadc4c49a790d16a, %g1, %g0
	setx 0x498c46ebf151ac4a, %g1, %g1
	setx 0xce5e7ee799646074, %g1, %g2
	setx 0xc34614dea202cd64, %g1, %g3
	setx 0xdddb5c0c94cc7791, %g1, %g4
	setx 0xf9dcade5c256524e, %g1, %g5
	setx 0x961fed359af10d70, %g1, %g6
	setx 0x57a655a02f1cb14d, %g1, %g7
	setx 0x2de70dcd255e7815, %g1, %r16
	setx 0x248a8a44774c26e1, %g1, %r17
	setx 0x7aca98730100fce9, %g1, %r18
	setx 0x3c362d3d742ddb96, %g1, %r19
	setx 0x6835f3bb97eecd88, %g1, %r20
	setx 0xc85f3d4f50bf0648, %g1, %r21
	setx 0x5aab24930d6e9f58, %g1, %r22
	setx 0x3f476b903983f9cd, %g1, %r23
	setx 0xbaca582f783c58f0, %g1, %r24
	setx 0x17959d295b520441, %g1, %r25
	setx 0x8f778ceb801b832b, %g1, %r26
	setx 0xac1f4d350a1a129a, %g1, %r27
	setx 0xa37b4b86e0a256ed, %g1, %r28
	setx 0x3dd4721fa82d85a3, %g1, %r29
	setx 0x3987c2b8e8371dfe, %g1, %r30
	setx 0xb1a90089d6e9d663, %g1, %r31
	save
	setx 0xe283be7cedc9e693, %g1, %r16
	setx 0x7d5da7093ec0b5ff, %g1, %r17
	setx 0x57c0312f6dab35be, %g1, %r18
	setx 0x922c3ece32a3fcf0, %g1, %r19
	setx 0x1532de96ed23caeb, %g1, %r20
	setx 0xc1421bdc77bb838c, %g1, %r21
	setx 0x73156b583ac97a33, %g1, %r22
	setx 0x870b244696053107, %g1, %r23
	setx 0x0d845177f5adc5a1, %g1, %r24
	setx 0xf51f97988801167f, %g1, %r25
	setx 0xbfe38b9dce6a89aa, %g1, %r26
	setx 0x7b4432c6b0c9aa39, %g1, %r27
	setx 0xd919da77212e296d, %g1, %r28
	setx 0xff3e953e928f2ab4, %g1, %r29
	setx 0x2d74f64b02433b2b, %g1, %r30
	setx 0x64ff6970863d50b8, %g1, %r31
	save
	setx 0x2de9c110c3171f88, %g1, %r16
	setx 0x5ee1a5fda82a6b17, %g1, %r17
	setx 0x4891380472557e3c, %g1, %r18
	setx 0x598b8a050c42c62f, %g1, %r19
	setx 0x05dc219368c8f8fe, %g1, %r20
	setx 0xc31eb6572235a073, %g1, %r21
	setx 0xbf0b9dfcc6fd530b, %g1, %r22
	setx 0x99362679c17b4a95, %g1, %r23
	setx 0x8ac74b6fb53b7eb8, %g1, %r24
	setx 0x919a65961cd11cab, %g1, %r25
	setx 0xf1afb801bf9c00f4, %g1, %r26
	setx 0x11ecb358e8b337f0, %g1, %r27
	setx 0x7f6a8424319458b2, %g1, %r28
	setx 0x88105633ac6da85e, %g1, %r29
	setx 0xe89a522dd793dca2, %g1, %r30
	setx 0x02dabca8c931ee29, %g1, %r31
	save
	setx 0x27615c102e937953, %g1, %r16
	setx 0xf2ebbbf711c1a9bb, %g1, %r17
	setx 0xe79ad40e3dcd9e86, %g1, %r18
	setx 0xd04de5d31d6ab1c2, %g1, %r19
	setx 0xe6a0dd5f418de41d, %g1, %r20
	setx 0x549c3b507a9070ed, %g1, %r21
	setx 0xa9548ba6607a7da0, %g1, %r22
	setx 0xab74bd4acb778780, %g1, %r23
	setx 0x66636ad138d8d138, %g1, %r24
	setx 0x19d3894af9665027, %g1, %r25
	setx 0xb48c44610f935ec7, %g1, %r26
	setx 0x3e3c9e42451fff9e, %g1, %r27
	setx 0x7e715a09a84fc25d, %g1, %r28
	setx 0x8ba3f23f43da20f6, %g1, %r29
	setx 0x251d9b1b3dc103ec, %g1, %r30
	setx 0x69f22b6a41d94474, %g1, %r31
	save
	setx 0x5557a7c9f66428ca, %g1, %r16
	setx 0x9fe136d69650d6a5, %g1, %r17
	setx 0xcefab6aba38e657c, %g1, %r18
	setx 0x9648c14bf29fea67, %g1, %r19
	setx 0xeab1c5af46b7887d, %g1, %r20
	setx 0x6f696c97c67f2322, %g1, %r21
	setx 0x55641c144ee5142a, %g1, %r22
	setx 0x72a5477144c938dd, %g1, %r23
	setx 0xa5bfe7b28b08c3a9, %g1, %r24
	setx 0x4283c6cb77219d12, %g1, %r25
	setx 0xa134cb1ec320bff2, %g1, %r26
	setx 0xcbbd92626fd3af93, %g1, %r27
	setx 0x45f2ec780a0e4dcc, %g1, %r28
	setx 0xd88e223b5fc2a4df, %g1, %r29
	setx 0xd55ab6e5da74fc1c, %g1, %r30
	setx 0xcd93a08c2ea8fa46, %g1, %r31
	save
	setx 0x763a1db6f6f678f1, %g1, %r16
	setx 0xa0a26bfb9d6c4044, %g1, %r17
	setx 0x8eb1d7e0abc31548, %g1, %r18
	setx 0x669ba32e4d28610c, %g1, %r19
	setx 0x9c9e6bd7781e9729, %g1, %r20
	setx 0xc1d4524fd1fde43a, %g1, %r21
	setx 0x4326ec5ad735a64e, %g1, %r22
	setx 0x12f7e99c2d927601, %g1, %r23
	setx 0x516ebe60c770b74d, %g1, %r24
	setx 0x1dda07801a3e6b79, %g1, %r25
	setx 0x5026c2fa613e31d5, %g1, %r26
	setx 0xf04b35640e8638d7, %g1, %r27
	setx 0x7a8970152a40a474, %g1, %r28
	setx 0xf7d8f4cb46af3600, %g1, %r29
	setx 0x0b90337630a788c6, %g1, %r30
	setx 0xdcb300037200cebe, %g1, %r31
	save
	setx 0x70f4025985a2df32, %g1, %r16
	setx 0xa8637075ba9a4fba, %g1, %r17
	setx 0x69be792d6e363236, %g1, %r18
	setx 0xa7d3f0d55320ddfc, %g1, %r19
	setx 0x456575eea056fc4f, %g1, %r20
	setx 0xce4a26275fd30bb8, %g1, %r21
	setx 0x75c5c64110d28e1f, %g1, %r22
	setx 0x91d9ce9bbfb484a4, %g1, %r23
	setx 0x65f081dbff63af0c, %g1, %r24
	setx 0x30442ad192b2c94b, %g1, %r25
	setx 0x9789f05a5a1a3157, %g1, %r26
	setx 0xf19235bc39c25b91, %g1, %r27
	setx 0x00d809f8f66bd583, %g1, %r28
	setx 0xbe928a611dcef3b3, %g1, %r29
	setx 0x0641694fd7fec66e, %g1, %r30
	setx 0x1e5c8206eab49048, %g1, %r31
	save
	setx 0x43048fafe89d632d, %g1, %r16
	setx 0xcc216c3c73454ac7, %g1, %r17
	setx 0x106e2497a076ca1b, %g1, %r18
	setx 0xcee07145d527bcac, %g1, %r19
	setx 0x57510e532b04d63a, %g1, %r20
	setx 0x8ace08f5e8a5be84, %g1, %r21
	setx 0xe6c4c07f2dc038ab, %g1, %r22
	setx 0x0074bec9b67e9f23, %g1, %r23
	setx 0x25845c70920a8245, %g1, %r24
	setx 0x31a23a6b8e9b6531, %g1, %r25
	setx 0xa4fb0e0ead4895ad, %g1, %r26
	setx 0x8d10bbee97a91865, %g1, %r27
	setx 0x245ed371879e544e, %g1, %r28
	setx 0xa83646d12bb408da, %g1, %r29
	setx 0x5b35f09f25897d85, %g1, %r30
	setx 0xee1d9d379f66d7ae, %g1, %r31
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
	.word 0xb3e44000  ! 1: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e4c000  ! 2: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e420b2  ! 3: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e48000  ! 4: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e40000  ! 8: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e5c000  ! 10: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e54000  ! 11: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_0:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 14: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbde5212a  ! 15: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_0:
	mov	0x22, %r14
	.word 0xfef38e60  ! 19: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_0:
	setx	0x1f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5e48000  ! 23: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_1:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 24: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7e5216a  ! 25: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_1:
	setx	0x1e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e44000  ! 29: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e54000  ! 30: SAVE_R	save	%r21, %r0, %r24
	.word 0xb0042139  ! 31: ADD_I	add 	%r16, 0x0139, %r24
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e5a181  ! 38: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde40000  ! 40: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe58000  ! 42: SAVE_R	save	%r22, %r0, %r31
	.word 0xbd510000  ! 44: RDPR_TICK	<illegal instruction>
	.word 0xb37cc400  ! 48: MOVR_R	movre	%r19, %r0, %r25
T0_asi_reg_wr_2:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 49: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 50: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_3:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 51: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_4:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 52: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbe358000  ! 58: SUBC_R	orn 	%r22, %r0, %r31
T0_asi_reg_wr_5:
	mov	0xd, %r14
	.word 0xf2f38e80  ! 59: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_2:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e4a099  ! 65: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_3:
	mov	0x1e, %r14
	.word 0xf4db8e80  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_4:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_6:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 69: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb83c4000  ! 71: XNOR_R	xnor 	%r17, %r0, %r28
T0_asi_reg_wr_7:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 72: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe4a112  ! 73: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_5:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 78: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbc948000  ! 81: ORcc_R	orcc 	%r18, %r0, %r30
T0_asi_reg_rd_6:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 82: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_2:
	setx	0x1e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 89: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_8:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 90: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e521e7  ! 92: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_4:
	setx	0x1e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_7:
	mov	0x31, %r14
	.word 0xf6db8e80  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfe561bf  ! 97: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e42047  ! 98: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4203b  ! 107: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4e12b  ! 111: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9195e197  ! 117: WRPR_PIL_I	wrpr	%r23, 0x0197, %pil
T0_asi_reg_wr_9:
	mov	0x15, %r14
	.word 0xfef38400  ! 118: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_10:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 120: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e46057  ! 121: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb2054000  ! 122: ADD_R	add 	%r21, %r0, %r25
T0_asi_reg_wr_11:
	mov	0x5, %r14
	.word 0xfcf38400  ! 123: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1e4a13b  ! 124: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_5:
	setx	0x1c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 128: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e44000  ! 130: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_12:
	mov	0x6, %r14
	.word 0xf4f38e80  ! 133: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_6:
	setx	0x1c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_7:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_8:
	setx	0x1f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_9:
	setx	0x1f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_13:
	mov	0x33, %r14
	.word 0xfaf38e80  ! 149: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_14:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1e44000  ! 156: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1e58000  ! 157: SAVE_R	save	%r22, %r0, %r24
	.word 0xbbe5a041  ! 159: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_15:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 165: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3e40000  ! 166: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde421e0  ! 167: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe54000  ! 173: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe4c000  ! 174: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_8:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 177: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb57dc400  ! 179: MOVR_R	movre	%r23, %r0, %r26
	.word 0xb1e5e075  ! 182: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe52107  ! 186: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_9:
	mov	0x0, %r14
	.word 0xf4db8400  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_16:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 190: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb83d217b  ! 191: XNOR_I	xnor 	%r20, 0x017b, %r28
cpu_intr_0_10:
	setx	0x1d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_17:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 196: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_11:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_12:
	setx	0x1e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_10:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfe58000  ! 205: SAVE_R	save	%r22, %r0, %r31
	.word 0xbf3d0000  ! 206: SRA_R	sra 	%r20, %r0, %r31
cpu_intr_0_13:
	setx	0x1c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe5c000  ! 213: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e4604e  ! 216: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_14:
	setx	0x1f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe50000  ! 227: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_15:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_11:
	mov	0xb, %r14
	.word 0xfadb8400  ! 230: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_18:
	mov	0x2c, %r14
	.word 0xf6f384a0  ! 232: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9e4e115  ! 233: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5a01d  ! 235: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e04b  ! 237: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb03d201b  ! 238: XNOR_I	xnor 	%r20, 0x001b, %r24
T0_asi_reg_wr_19:
	mov	0x30, %r14
	.word 0xf0f38400  ! 241: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 250: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e44000  ! 255: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e5e0f5  ! 259: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_20:
	mov	0x9, %r14
	.word 0xf0f38e80  ! 260: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb82cc000  ! 261: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xb1e4a124  ! 264: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_16:
	setx	0x1f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 268: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_13:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 272: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 273: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 277: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb43c61b7  ! 279: XNOR_I	xnor 	%r17, 0x01b7, %r26
T0_asi_reg_rd_15:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfe5217e  ! 284: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, c)
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_17:
	setx	0x1f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22c0000  ! 292: ANDN_R	andn 	%r16, %r0, %r25
T0_asi_reg_rd_16:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 293: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3e52179  ! 294: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_22:
	mov	0x18, %r14
	.word 0xfef38e40  ! 297: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_23:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 298: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_18:
	setx	0x1c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_17:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde44000  ! 308: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_18:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 310: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_24:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 312: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_25:
	mov	0x32, %r14
	.word 0xfcf38400  ! 314: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e48000  ! 321: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde4c000  ! 322: SAVE_R	save	%r19, %r0, %r30
	.word 0xbde5e0aa  ! 323: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e48000  ! 324: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e5c000  ! 325: SAVE_R	save	%r23, %r0, %r24
	.word 0xb33c9000  ! 326: SRAX_R	srax	%r18, %r0, %r25
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e40000  ! 338: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_26:
	mov	0x3, %r14
	.word 0xfef38e80  ! 340: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_19:
	mov	0x6, %r14
	.word 0xf0db8400  ! 343: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_27:
	mov	0xf, %r14
	.word 0xfef38e40  ! 345: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e5a102  ! 353: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb29ce022  ! 356: XORcc_I	xorcc 	%r19, 0x0022, %r25
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 358: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xba3d0000  ! 359: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xb5e54000  ! 362: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_20:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_19:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 368: SAVE_R	save	%r16, %r0, %r25
	.word 0xbabc8000  ! 369: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xb0b54000  ! 370: SUBCcc_R	orncc 	%r21, %r0, %r24
cpu_intr_0_20:
	setx	0x1e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521f1  ! 374: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_21:
	setx	0x1e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56157  ! 378: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_22:
	setx	0x1f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe58000  ! 387: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e4c000  ! 391: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e420b4  ! 394: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_21:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_23:
	setx	0x1d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_29:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 400: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_22:
	mov	0x1d, %r14
	.word 0xf2db8e80  ! 401: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb3e4e187  ! 402: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_24:
	setx	0x1d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561d3  ! 411: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde5c000  ! 424: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_23:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_wr_30:
	mov	0x1a, %r14
	.word 0xf8f38400  ! 429: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe4e10f  ! 431: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_25:
	setx	0x200325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0e6  ! 437: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_26:
	setx	0x23033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_31:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 446: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_24:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_27:
	setx	0x230017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_28:
	setx	0x23022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561da  ! 456: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_32:
	mov	0x37, %r14
	.word 0xfaf38e80  ! 460: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_29:
	setx	0x22000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_30:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_31:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_25:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbe350000  ! 471: ORN_R	orn 	%r20, %r0, %r31
cpu_intr_0_32:
	setx	0x22010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_26:
	mov	0xe, %r14
	.word 0xfcdb89e0  ! 477: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbc9d4000  ! 483: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xbfe5e1fe  ! 486: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe48000  ! 490: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e40000  ! 495: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5e58000  ! 496: SAVE_R	save	%r22, %r0, %r26
	.word 0xbde54000  ! 499: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde4c000  ! 501: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, d)
	.word 0xb72d4000  ! 504: SLL_R	sll 	%r21, %r0, %r27
T0_asi_reg_rd_27:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e40000  ! 507: SAVE_R	save	%r16, %r0, %r27
	.word 0xb7e40000  ! 508: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_33:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 510: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 516: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e4c000  ! 517: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_28:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 519: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_33:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c2195  ! 523: ANDN_I	andn 	%r16, 0x0195, %r31
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_30:
	mov	0x36, %r14
	.word 0xf6db89e0  ! 528: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_31:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_34:
	setx	0x20000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_32:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 543: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_33:
	mov	0x2c, %r14
	.word 0xf2db89e0  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e40000  ! 545: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xb1e5c000  ! 547: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde50000  ! 548: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde48000  ! 550: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_35:
	setx	0x230139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_36:
	setx	0x210333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x230308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb77d0400  ! 564: MOVR_R	movre	%r20, %r0, %r27
cpu_intr_0_39:
	setx	0x220233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d7001  ! 569: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xb9e46013  ! 570: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e5e07b  ! 574: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_35:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_34:
	mov	0xd, %r14
	.word 0xf0f38400  ! 579: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5e4a0eb  ! 580: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde40000  ! 582: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_40:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_41:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 589: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_36:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_35:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 591: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbcbc4000  ! 593: XNORcc_R	xnorcc 	%r17, %r0, %r30
cpu_intr_0_42:
	setx	0x230228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x20002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 599: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb52c0000  ! 617: SLL_R	sll 	%r16, %r0, %r26
T0_asi_reg_wr_36:
	mov	0x27, %r14
	.word 0xf0f38e80  ! 619: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e5e019  ! 625: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5207f  ! 626: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5213d  ! 630: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4a1ce  ! 632: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe5a0ab  ! 635: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e50000  ! 636: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_37:
	mov	0x9, %r14
	.word 0xf6f389e0  ! 639: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9e520cf  ! 641: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_45:
	setx	0x220337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 651: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_38:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 652: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_46:
	setx	0x220132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_47:
	setx	0x23002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x20, %r14
	.word 0xf2db89e0  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_39:
	mov	0x2c, %r14
	.word 0xfcf384a0  ! 660: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_38:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7e5a010  ! 668: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb8b4c000  ! 669: SUBCcc_R	orncc 	%r19, %r0, %r28
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 0)
	.word 0xbbe521cd  ! 675: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_48:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 680: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe5c000  ! 681: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e50000  ! 686: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_49:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52071  ! 690: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_40:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 691: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5e4a055  ! 697: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4a03b  ! 702: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe5c000  ! 706: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_50:
	setx	0x21012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_41:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 716: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_39:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb884c000  ! 719: ADDcc_R	addcc 	%r19, %r0, %r28
cpu_intr_0_51:
	setx	0x210225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x210331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_42:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 726: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 730: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_40:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde520fc  ! 735: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e56143  ! 736: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 738: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_53:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_54:
	setx	0x210335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 746: SAVE_R	save	%r19, %r0, %r31
	.word 0xbe1cc000  ! 747: XOR_R	xor 	%r19, %r0, %r31
	.word 0xb3e5c000  ! 749: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_55:
	setx	0x23010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_41:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e54000  ! 755: SAVE_R	save	%r21, %r0, %r26
	.word 0xbeb4a181  ! 756: ORNcc_I	orncc 	%r18, 0x0181, %r31
T0_asi_reg_wr_44:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 760: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e520c4  ! 762: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4a0a9  ! 768: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4c000  ! 769: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe4607a  ! 770: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_56:
	setx	0x20012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_45:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 775: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e5e1c1  ! 779: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5e0f2  ! 782: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_57:
	setx	0x200000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_46:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 786: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e4c000  ! 787: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe46032  ! 788: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb4940000  ! 790: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xbbe460a7  ! 798: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4c000  ! 799: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_58:
	setx	0x200218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421f0  ! 806: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_59:
	setx	0x210225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421ca  ! 811: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_43:
	mov	0x2c, %r14
	.word 0xfedb84a0  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe5a1df  ! 814: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_44:
	mov	0x19, %r14
	.word 0xfedb8e60  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_60:
	setx	0x21013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7dc400  ! 818: MOVR_R	movre	%r23, %r0, %r30
	.word 0xbde5a13c  ! 821: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe4605c  ! 827: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e40000  ! 829: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_61:
	setx	0x21002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52158  ! 832: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_45:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9e4c000  ! 838: SAVE_R	save	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc9ce1a2  ! 845: XORcc_I	xorcc 	%r19, 0x01a2, %r30
	.word 0xb7e52161  ! 846: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5218c  ! 847: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe44000  ! 849: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e44000  ! 850: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e58000  ! 853: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe44000  ! 854: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_47:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 856: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb884c000  ! 857: ADDcc_R	addcc 	%r19, %r0, %r28
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_46:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe42183  ! 861: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba8cc000  ! 863: ANDcc_R	andcc 	%r19, %r0, %r29
	.word 0xb7e5a0cc  ! 865: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e52068  ! 866: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e48000  ! 869: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e4a074  ! 871: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe520b0  ! 877: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_48:
	mov	0x22, %r14
	.word 0xf2f38e80  ! 878: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_49:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 880: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e4618b  ! 882: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1641800  ! 883: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_50:
	mov	0x2, %r14
	.word 0xfcf38400  ! 884: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e48000  ! 887: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_62:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c1000  ! 893: SRAX_R	srax	%r16, %r0, %r26
T0_asi_reg_rd_47:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_51:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 897: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde54000  ! 900: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_63:
	setx	0x25023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e104  ! 910: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_48:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde54000  ! 914: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_49:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e52126  ! 917: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe42085  ! 919: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_52:
	mov	0x7, %r14
	.word 0xfaf38400  ! 923: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe40000  ! 925: SAVE_R	save	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e50000  ! 936: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_53:
	mov	0x4, %r14
	.word 0xfef38e40  ! 937: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e50000  ! 940: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_54:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 941: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb49ce007  ! 942: XORcc_I	xorcc 	%r19, 0x0007, %r26
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_64:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5612c  ! 945: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xa1902002  ! 946: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb9e54000  ! 949: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_50:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 11)
	.word 0xb97dc400  ! 956: MOVR_R	movre	%r23, %r0, %r28
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e4c000  ! 963: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 29)
	.word 0xb5e40000  ! 970: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e521b7  ! 972: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_65:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 975: SAVE_R	save	%r20, %r0, %r28
	.word 0x819420d7  ! 976: WRPR_TPC_I	wrpr	%r16, 0x00d7, %tpc
T0_asi_reg_rd_51:
	mov	0x11, %r14
	.word 0xfadb8400  ! 977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde58000  ! 979: SAVE_R	save	%r22, %r0, %r30
	.word 0xb9e4e09c  ! 980: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5e1d5  ! 985: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb4a46188  ! 986: SUBcc_I	subcc 	%r17, 0x0188, %r26
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e58000  ! 989: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e520a4  ! 990: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_55:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 992: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_52:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 993: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_53:
	mov	0x37, %r14
	.word 0xf8db8400  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfe42044  ! 1002: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_66:
	setx	0x250311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d8000  ! 1008: XOR_R	xor 	%r22, %r0, %r25
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 2)
	.word 0xbfe521f6  ! 1013: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 1015: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_67:
	setx	0x24021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_68:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a019  ! 1020: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e04b  ! 1025: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, f)
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde40000  ! 1031: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_69:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 1034: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_54:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e4c000  ! 1038: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe50000  ! 1039: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_70:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_71:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e4c000  ! 1058: SAVE_R	save	%r19, %r0, %r26
	.word 0xbabc6058  ! 1059: XNORcc_I	xnorcc 	%r17, 0x0058, %r29
	.word 0xb5e42020  ! 1063: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe40000  ! 1066: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_55:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 13)
	.word 0xba34e18c  ! 1072: ORN_I	orn 	%r19, 0x018c, %r29
cpu_intr_0_72:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 27)
	.word 0xbbe48000  ! 1089: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_73:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 1095: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_56:
	mov	0x33, %r14
	.word 0xf0db8e80  ! 1096: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_rd_57:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e54000  ! 1101: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_57:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 1103: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e5e07d  ! 1105: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_58:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_74:
	setx	0x260036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_75:
	setx	0x240220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1df  ! 1118: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_76:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1120: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_77:
	setx	0x24003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28cc000  ! 1123: ANDcc_R	andcc 	%r19, %r0, %r25
T0_asi_reg_wr_58:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 1124: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfe4a1c2  ! 1125: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e48000  ! 1127: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde40000  ! 1128: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_59:
	mov	0x2a, %r14
	.word 0xfadb8e60  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_78:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_60:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1137: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e5a0a2  ! 1141: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_59:
	mov	0x1d, %r14
	.word 0xf6f38e60  ! 1142: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_61:
	mov	0x4, %r14
	.word 0xf6db8400  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_79:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_62:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 1149: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5a027  ! 1156: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_60:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 1161: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e4e123  ! 1171: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb01c8000  ! 1172: XOR_R	xor 	%r18, %r0, %r24
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e5613e  ! 1176: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e4c000  ! 1177: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e5e193  ! 1179: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde50000  ! 1182: SAVE_R	save	%r20, %r0, %r30
	.word 0xb1e5e04a  ! 1184: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe50000  ! 1190: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_63:
	mov	0x8, %r14
	.word 0xf6db84a0  ! 1193: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_61:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 1194: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_64:
	mov	0x9, %r14
	.word 0xf6db8400  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbac58000  ! 1196: ADDCcc_R	addccc 	%r22, %r0, %r29
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e4a1a1  ! 1201: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_62:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 1202: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbde5e113  ! 1203: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_65:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5e42158  ! 1205: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_80:
	setx	0x26001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_81:
	setx	0x270114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4605b  ! 1214: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_82:
	setx	0x24011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a18d  ! 1217: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_63:
	mov	0x7, %r14
	.word 0xf0f38e80  ! 1219: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e4e083  ! 1220: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e50000  ! 1221: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e5e162  ! 1224: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde50000  ! 1233: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 1234: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9e54000  ! 1239: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_83:
	setx	0x26011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e10f  ! 1243: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x81956196  ! 1244: WRPR_TPC_I	wrpr	%r21, 0x0196, %tpc
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e40000  ! 1253: SAVE_R	save	%r16, %r0, %r25
	.word 0xb1e4a0cc  ! 1254: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5e1bf  ! 1255: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e48000  ! 1257: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e40000  ! 1258: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_84:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a06f  ! 1267: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e58000  ! 1268: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_66:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb9e5a191  ! 1271: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_85:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_86:
	setx	0x24012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1276: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_88:
	setx	0x24032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56012  ! 1280: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_89:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x2f, %r14
	.word 0xf4db8e60  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_90:
	setx	0x24032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1286: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e42048  ! 1290: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e54000  ! 1293: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_91:
	setx	0x240027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4e10f  ! 1298: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_92:
	setx	0x25010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_68:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbe40000  ! 1305: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1308: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbde42014  ! 1311: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_93:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 1316: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e5c000  ! 1320: SAVE_R	save	%r23, %r0, %r25
	.word 0xb1e5a01a  ! 1322: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_94:
	setx	0x260136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0f0  ! 1327: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 38)
	.word 0xbc1561f4  ! 1332: OR_I	or 	%r21, 0x01f4, %r30
	.word 0xb6ad0000  ! 1334: ANDNcc_R	andncc 	%r20, %r0, %r27
	.word 0xbde4c000  ! 1337: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_66:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 1341: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3e58000  ! 1345: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_67:
	mov	0x8, %r14
	.word 0xfaf38400  ! 1347: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5e461a9  ! 1348: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_95:
	setx	0x250125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 7)
	.word 0xbb340000  ! 1357: SRL_R	srl 	%r16, %r0, %r29
	.word 0xb9e5a19b  ! 1359: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_96:
	setx	0x250214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e4e084  ! 1363: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_68:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 1366: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde46135  ! 1368: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_97:
	setx	0x2a0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_98:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_69:
	mov	0x20, %r14
	.word 0xfaf38400  ! 1377: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3e4616c  ! 1378: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_99:
	setx	0x28002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_100:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946085  ! 1388: WRPR_TNPC_I	wrpr	%r17, 0x0085, %tnpc
T0_asi_reg_rd_69:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 1393: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_70:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1397: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_101:
	setx	0x2b0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0da  ! 1403: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe50000  ! 1404: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_102:
	setx	0x290313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_103:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0c4000  ! 1413: AND_R	and 	%r17, %r0, %r29
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e44000  ! 1415: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_71:
	mov	0x30, %r14
	.word 0xf2f38400  ! 1416: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_72:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 1417: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_104:
	setx	0x280322, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_70:
	mov	0x27, %r14
	.word 0xf4db8400  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb23c4000  ! 1422: XNOR_R	xnor 	%r17, %r0, %r25
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_105:
	setx	0x2a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_71:
	mov	0x12, %r14
	.word 0xf2db84a0  ! 1427: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e5a131  ! 1433: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_73:
	mov	0x26, %r14
	.word 0xfaf384a0  ! 1435: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3e4e084  ! 1437: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf349000  ! 1438: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xb5e561c3  ! 1444: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e48000  ! 1445: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5e4c000  ! 1449: SAVE_R	save	%r19, %r0, %r26
	.word 0xb834e0f9  ! 1452: ORN_I	orn 	%r19, 0x00f9, %r28
	.word 0xb9e4e0e8  ! 1455: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5a150  ! 1456: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_106:
	setx	0x2a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0x8, %r14
	.word 0xfef384a0  ! 1458: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_107:
	setx	0x2b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 1462: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe56166  ! 1465: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4a079  ! 1470: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_75:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1472: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfe4619a  ! 1473: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4e15a  ! 1474: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe4e0b7  ! 1477: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe461de  ! 1484: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_108:
	setx	0x2b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e420e0  ! 1489: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_109:
	setx	0x2a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e136  ! 1495: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_73:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1e420f9  ! 1500: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb8bd20f3  ! 1505: XNORcc_I	xnorcc 	%r20, 0x00f3, %r28
	.word 0xbbe58000  ! 1507: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e4e011  ! 1510: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde420a8  ! 1511: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbcbc6192  ! 1513: XNORcc_I	xnorcc 	%r17, 0x0192, %r30
	.word 0xb1e44000  ! 1515: SAVE_R	save	%r17, %r0, %r24
	.word 0xb12dd000  ! 1516: SLLX_R	sllx	%r23, %r0, %r24
	.word 0xbca40000  ! 1517: SUBcc_R	subcc 	%r16, %r0, %r30
cpu_intr_0_110:
	setx	0x280215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5e5a023  ! 1523: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1525: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_77:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 1526: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_74:
	mov	0x12, %r14
	.word 0xf8db8e60  ! 1529: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_111:
	setx	0x2b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46133  ! 1533: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbd340000  ! 1538: SRL_R	srl 	%r16, %r0, %r30
cpu_intr_0_112:
	setx	0x2a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e5601d  ! 1541: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e58000  ! 1545: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e4a02c  ! 1550: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_75:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_rd_76:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_77:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 1566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_78:
	mov	0x1f, %r14
	.word 0xf8f38400  ! 1567: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb1e4e1c9  ! 1571: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5a1a8  ! 1573: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2)
	.word 0xba2d0000  ! 1580: ANDN_R	andn 	%r20, %r0, %r29
	.word 0xb7e50000  ! 1583: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e5e1ad  ! 1584: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_113:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_79:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 1587: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb7e4c000  ! 1589: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe520b7  ! 1590: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_80:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 1592: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb92de001  ! 1595: SLL_I	sll 	%r23, 0x0001, %r28
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_114:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1606: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde5e1af  ! 1609: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_115:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb356001  ! 1614: SRL_I	srl 	%r21, 0x0001, %r29
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_116:
	setx	0x2b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1619: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_81:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 1620: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e50000  ! 1621: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_82:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 1623: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb0a54000  ! 1625: SUBcc_R	subcc 	%r21, %r0, %r24
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde5e0c3  ! 1628: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e50000  ! 1633: SAVE_R	save	%r20, %r0, %r27
	.word 0xb63ca186  ! 1635: XNOR_I	xnor 	%r18, 0x0186, %r27
T0_asi_reg_rd_78:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 1636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_117:
	setx	0x280135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4208e  ! 1639: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe44000  ! 1643: SAVE_R	save	%r17, %r0, %r29
	.word 0xb5e46068  ! 1648: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e560f5  ! 1651: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_118:
	setx	0x2b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_79:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_80:
	mov	0x31, %r14
	.word 0xf2db84a0  ! 1661: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_119:
	setx	0x2a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_83:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 1667: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb97c4400  ! 1669: MOVR_R	movre	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_81:
	mov	0x2, %r14
	.word 0xf8db8400  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb8048000  ! 1676: ADD_R	add 	%r18, %r0, %r28
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 2)
	.word 0xb3e420f7  ! 1680: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc1d0000  ! 1682: XOR_R	xor 	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_120:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e4206e  ! 1688: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e40000  ! 1695: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e5a078  ! 1696: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_82:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 23)
	.word 0xbc2461bf  ! 1701: SUB_I	sub 	%r17, 0x01bf, %r30
	.word 0xb1345000  ! 1703: SRLX_R	srlx	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a44000  ! 1710: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xb5e5a141  ! 1714: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_121:
	setx	0x2b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_83:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 1716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_122:
	setx	0x280208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 1722: SAVE_R	save	%r19, %r0, %r26
	.word 0xba9d4000  ! 1723: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xb7e5e1eb  ! 1725: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb48ca145  ! 1726: ANDcc_I	andcc 	%r18, 0x0145, %r26
	.word 0xb9e421bd  ! 1727: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e5e0ec  ! 1734: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_84:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_123:
	setx	0x28013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1743: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_84:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 1746: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_85:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 1752: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe4c000  ! 1753: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde4a1da  ! 1755: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_124:
	setx	0x2b0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_125:
	setx	0x28013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_126:
	setx	0x2b0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0ca  ! 1770: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_85:
	mov	0x27, %r14
	.word 0xf0db8e60  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfe4e131  ! 1774: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd50c000  ! 1775: RDPR_TT	<illegal instruction>
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e4e0bb  ! 1778: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe58000  ! 1779: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_127:
	setx	0x280122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 1782: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe50000  ! 1783: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_86:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_128:
	setx	0x2b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 1787: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e4a0b8  ! 1791: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_87:
	mov	0x20, %r14
	.word 0xf4f389e0  ! 1795: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_129:
	setx	0x290324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde5e131  ! 1800: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_88:
	mov	0x35, %r14
	.word 0xf2f38400  ! 1805: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde560da  ! 1807: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_87:
	mov	0x28, %r14
	.word 0xf4db84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe50000  ! 1809: SAVE_R	save	%r20, %r0, %r29
	.word 0xb9e54000  ! 1811: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_89:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 1812: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3e4e0dd  ! 1813: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e560de  ! 1817: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e4c000  ! 1820: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_130:
	setx	0x2e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1823: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_90:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 1824: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbde44000  ! 1825: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_91:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1827: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, a)
	.word 0xb3e4219f  ! 1837: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_92:
	mov	0x2e, %r14
	.word 0xfcf389e0  ! 1839: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbbe5c000  ! 1842: SAVE_R	save	%r23, %r0, %r29
	.word 0xb805a0f5  ! 1843: ADD_I	add 	%r22, 0x00f5, %r28
	.word 0xbc35a059  ! 1844: SUBC_I	orn 	%r22, 0x0059, %r30
T0_asi_reg_wr_93:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1846: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1e40000  ! 1847: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_94:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 1849: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbe3d60dd  ! 1851: XNOR_I	xnor 	%r21, 0x00dd, %r31
	.word 0xbfe44000  ! 1852: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_95:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1854: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_88:
	mov	0x1e, %r14
	.word 0xf6db8e80  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e40000  ! 1867: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe48000  ! 1869: SAVE_R	save	%r18, %r0, %r31
	.word 0xbfe420f0  ! 1873: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_89:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb4b40000  ! 1880: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xb9e5a0c8  ! 1884: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe48000  ! 1885: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_132:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561bb  ! 1888: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a0d6  ! 1892: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e44000  ! 1893: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_96:
	mov	0x23, %r14
	.word 0xfcf38400  ! 1894: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_90:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_97:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 1897: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_98:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 1900: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e54000  ! 1901: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_99:
	mov	0x3, %r14
	.word 0xf4f38e60  ! 1903: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5e58000  ! 1904: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_133:
	setx	0x2d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe50000  ! 1911: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_91:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 1913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e40000  ! 1916: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_134:
	setx	0x2e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a064  ! 1919: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_92:
	mov	0x11, %r14
	.word 0xf2db8400  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_135:
	setx	0x2e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_100:
	mov	0x4, %r14
	.word 0xfef389e0  ! 1929: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e4a1bf  ! 1930: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_136:
	setx	0x2c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4207e  ! 1932: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e58000  ! 1937: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e4e0df  ! 1939: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_137:
	setx	0x2e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e090  ! 1944: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 1945: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbbe58000  ! 1950: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_102:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 1955: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb09d4000  ! 1956: XORcc_R	xorcc 	%r21, %r0, %r24
cpu_intr_0_138:
	setx	0x2e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ac4000  ! 1960: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0xb1e5a181  ! 1962: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e4616f  ! 1967: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5e188  ! 1970: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe54000  ! 1973: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_139:
	setx	0x2f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1982: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_103:
	mov	0x28, %r14
	.word 0xfef38e40  ! 1983: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_93:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_94:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 1989: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e58000  ! 1990: SAVE_R	save	%r22, %r0, %r28
	.word 0xb1e5e136  ! 1992: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde58000  ! 1994: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde48000  ! 1998: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 28)
	.word 0xb4a40000  ! 2006: SUBcc_R	subcc 	%r16, %r0, %r26
cpu_intr_0_140:
	setx	0x2e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561bf  ! 2009: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e50000  ! 2011: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e5e121  ! 2012: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5a0c8  ! 2014: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb42c6004  ! 2015: ANDN_I	andn 	%r17, 0x0004, %r26
	.word 0xbc3cc000  ! 2016: XNOR_R	xnor 	%r19, %r0, %r30
cpu_intr_0_141:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2025: SAVE_R	save	%r17, %r0, %r29
	.word 0xbfe5c000  ! 2026: SAVE_R	save	%r23, %r0, %r31
	.word 0xb3e560c5  ! 2028: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e0d0  ! 2029: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_142:
	setx	0x2d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_104:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 2038: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_143:
	setx	0x2c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461d2  ! 2043: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd7dc400  ! 2048: MOVR_R	movre	%r23, %r0, %r30
	.word 0xb7e4e1eb  ! 2053: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_144:
	setx	0x2d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a12c  ! 2059: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_105:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 2065: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb1343001  ! 2067: SRLX_I	srlx	%r16, 0x0001, %r24
T0_asi_reg_wr_106:
	mov	0x10, %r14
	.word 0xfcf389e0  ! 2068: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_145:
	setx	0x2e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 2073: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e4605e  ! 2078: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_147:
	setx	0x2d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2082: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde520f7  ! 2083: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_95:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb43ca1a0  ! 2087: XNOR_I	xnor 	%r18, 0x01a0, %r26
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_107:
	mov	0xd, %r14
	.word 0xf6f38e40  ! 2091: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_108:
	mov	0x1f, %r14
	.word 0xfaf384a0  ! 2093: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_109:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 2095: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e4e19e  ! 2099: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe58000  ! 2104: SAVE_R	save	%r22, %r0, %r29
	.word 0xbde40000  ! 2105: SAVE_R	save	%r16, %r0, %r30
	.word 0xb3e4607b  ! 2106: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_148:
	setx	0x2d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521e2  ! 2108: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_149:
	setx	0x2e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2112: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe5604b  ! 2115: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb835c000  ! 2117: SUBC_R	orn 	%r23, %r0, %r28
	.word 0xbd641800  ! 2118: MOVcc_R	<illegal instruction>
	.word 0xb5e5e142  ! 2120: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_96:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 2121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_97:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_110:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 2126: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e4c000  ! 2127: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_150:
	setx	0x2e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_151:
	setx	0x2d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e0c4  ! 2141: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e5a0f6  ! 2143: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4203d  ! 2145: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4a058  ! 2147: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e421ad  ! 2150: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e44000  ! 2152: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_111:
	mov	0x26, %r14
	.word 0xf2f38e60  ! 2154: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_112:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2156: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_98:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_113:
	mov	0x32, %r14
	.word 0xf8f38e60  ! 2165: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3518000  ! 2166: RDPR_PSTATE	<illegal instruction>
	.word 0xb0348000  ! 2169: ORN_R	orn 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5c000  ! 2173: SAVE_R	save	%r23, %r0, %r28
	.word 0xbbe5615e  ! 2176: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5e009  ! 2180: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_152:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2188: SAVE_R	save	%r19, %r0, %r27
	.word 0xbde5e07a  ! 2190: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_154:
	setx	0x2f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 2192: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_155:
	setx	0x2f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e143  ! 2196: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_156:
	setx	0x2c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a012  ! 2205: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_114:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 2206: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_115:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 2210: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e58000  ! 2221: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_157:
	setx	0x2c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_158:
	setx	0x2c0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 2232: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_116:
	mov	0x4, %r14
	.word 0xfef38e40  ! 2236: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e54000  ! 2239: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_160:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e021  ! 2241: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_161:
	setx	0x2f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde48000  ! 2245: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 2247: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_162:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_100:
	mov	0x14, %r14
	.word 0xf4db8400  ! 2259: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e420c3  ! 2261: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4a119  ! 2262: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_163:
	setx	0x2e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_118:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2267: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9e5c000  ! 2269: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e5219b  ! 2272: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe5c000  ! 2274: SAVE_R	save	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e50000  ! 2276: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_164:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_165:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe54000  ! 2285: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e42037  ! 2287: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e5e114  ! 2295: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_101:
	mov	0x2a, %r14
	.word 0xfadb8e80  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_119:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 2306: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde5c000  ! 2310: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_166:
	setx	0x32031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_102:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 2318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfe46046  ! 2320: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_103:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbe40000  ! 2324: SAVE_R	save	%r16, %r0, %r29
	.word 0xb3e560af  ! 2327: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5e1ad  ! 2330: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e420a2  ! 2331: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_104:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_105:
	mov	0x21, %r14
	.word 0xf4db8e60  ! 2333: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_167:
	setx	0x31021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2337: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_168:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0f3  ! 2343: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_120:
	mov	0x24, %r14
	.word 0xf0f389e0  ! 2347: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_169:
	setx	0x330324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 2349: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e5a1d4  ! 2350: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e5a15f  ! 2351: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe46028  ! 2352: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_121:
	mov	0x22, %r14
	.word 0xf4f38400  ! 2355: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1e50000  ! 2356: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e4e073  ! 2357: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_122:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2361: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbde560f7  ! 2363: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_107:
	mov	0x9, %r14
	.word 0xf0db8400  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2367: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde5a187  ! 2370: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_108:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_170:
	setx	0x300102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2381: SAVE_R	save	%r23, %r0, %r27
	.word 0xb7e4c000  ! 2382: SAVE_R	save	%r19, %r0, %r27
	.word 0xb0050000  ! 2384: ADD_R	add 	%r20, %r0, %r24
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e4e17b  ! 2386: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e4a1f5  ! 2390: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_111:
	mov	0xd, %r14
	.word 0xf0db8400  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_124:
	mov	0x14, %r14
	.word 0xfaf38400  ! 2396: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_171:
	setx	0x300136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_125:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 2398: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_112:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e48000  ! 2400: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe4e1c7  ! 2401: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_172:
	setx	0x310006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 2403: SAVE_R	save	%r19, %r0, %r28
	.word 0xbde54000  ! 2404: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_126:
	mov	0x31, %r14
	.word 0xf4f38e60  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e48000  ! 2414: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_113:
	mov	0x2f, %r14
	.word 0xfadb89e0  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_127:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 2427: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_114:
	mov	0xc, %r14
	.word 0xfedb8400  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_173:
	setx	0x310108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 2433: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_174:
	setx	0x300031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420c3  ! 2440: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_175:
	setx	0x31001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_129:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 2444: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2445: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e5e1ae  ! 2446: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_176:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1c2  ! 2450: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x81952031  ! 2451: WRPR_TPC_I	wrpr	%r20, 0x0031, %tpc
	.word 0xb37c4400  ! 2453: MOVR_R	movre	%r17, %r0, %r25
T0_asi_reg_rd_115:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 2454: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_177:
	setx	0x330123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_131:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 2458: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3e4e03a  ! 2459: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe5a062  ! 2463: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe5217e  ! 2465: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, f)
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe54000  ! 2470: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe48000  ! 2472: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e4c000  ! 2473: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e4e1f4  ! 2474: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_178:
	setx	0x300313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2482: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_179:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 2489: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_180:
	setx	0x300002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 2492: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_181:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_116:
	mov	0x3, %r14
	.word 0xf8db8e60  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e4c000  ! 2496: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e4c000  ! 2502: SAVE_R	save	%r19, %r0, %r24
	.word 0xb7e5a0f1  ! 2504: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_117:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_134:
	mov	0x11, %r14
	.word 0xf6f38400  ! 2509: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, f)
	.word 0xb9e461b6  ! 2511: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_182:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_135:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2514: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7540000  ! 2516: RDPR_GL	<illegal instruction>
	.word 0xbde52158  ! 2517: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde5e173  ! 2518: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4c000  ! 2526: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_118:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 2527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde4a131  ! 2530: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_183:
	setx	0x32032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x11, %r14
	.word 0xfcdb89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbde54000  ! 2536: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe5a1df  ! 2538: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e48000  ! 2540: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde5e0df  ! 2552: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb82c0000  ! 2553: ANDN_R	andn 	%r16, %r0, %r28
cpu_intr_0_184:
	setx	0x300205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_136:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 2557: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe5c000  ! 2559: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe4c000  ! 2561: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_137:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 2562: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e50000  ! 2563: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4c000  ! 2569: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_185:
	setx	0x300026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_121:
	mov	0x2f, %r14
	.word 0xfadb89e0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_138:
	mov	0x1a, %r14
	.word 0xf4f38e80  ! 2583: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e4c000  ! 2584: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_186:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe520cd  ! 2596: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e48000  ! 2599: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_187:
	setx	0x330004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34e1de  ! 2607: ORN_I	orn 	%r19, 0x01de, %r31
cpu_intr_0_188:
	setx	0x330328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2609: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e48000  ! 2610: SAVE_R	save	%r18, %r0, %r24
	.word 0xb00c20af  ! 2611: AND_I	and 	%r16, 0x00af, %r24
	.word 0xb5e5a044  ! 2613: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_189:
	setx	0x330222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_190:
	setx	0x310209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a151  ! 2622: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5219e  ! 2625: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e48000  ! 2626: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde5c000  ! 2630: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_139:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 2631: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e421cc  ! 2633: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_191:
	setx	0x330218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_192:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2639: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 16)
	.word 0xbde54000  ! 2644: SAVE_R	save	%r21, %r0, %r30
	.word 0xb6342115  ! 2645: SUBC_I	orn 	%r16, 0x0115, %r27
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e5c000  ! 2647: SAVE_R	save	%r23, %r0, %r27
	.word 0xb294e05d  ! 2651: ORcc_I	orcc 	%r19, 0x005d, %r25
	.word 0xb1e560e7  ! 2654: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_140:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 2657: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb6c521bc  ! 2658: ADDCcc_I	addccc 	%r20, 0x01bc, %r27
T0_asi_reg_rd_122:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e4c000  ! 2670: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e460c9  ! 2671: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_193:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2675: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe5a00a  ! 2676: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e46010  ! 2680: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e48000  ! 2681: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_194:
	setx	0x330127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb835211d  ! 2683: SUBC_I	orn 	%r20, 0x011d, %r28
T0_asi_reg_wr_141:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 2684: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe560c8  ! 2686: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e421a5  ! 2687: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe46120  ! 2688: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4e175  ! 2689: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_195:
	setx	0x32032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46185  ! 2694: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_123:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 2696: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_196:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e48000  ! 2708: SAVE_R	save	%r18, %r0, %r27
	.word 0xb235e12a  ! 2709: ORN_I	orn 	%r23, 0x012a, %r25
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_124:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_197:
	setx	0x320230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbfe461ab  ! 2715: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_198:
	setx	0x33002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e40000  ! 2718: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e52042  ! 2720: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb4b5a01d  ! 2724: ORNcc_I	orncc 	%r22, 0x001d, %r26
cpu_intr_0_199:
	setx	0x310111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_125:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_200:
	setx	0x33021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b42158  ! 2735: ORNcc_I	orncc 	%r16, 0x0158, %r25
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 36)
	.word 0xb13ca001  ! 2737: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xbebd618f  ! 2739: XNORcc_I	xnorcc 	%r21, 0x018f, %r31
	.word 0xbde50000  ! 2744: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e4a139  ! 2746: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_201:
	setx	0x350128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2749: SAVE_R	save	%r21, %r0, %r31
	.word 0xb685e1f5  ! 2751: ADDcc_I	addcc 	%r23, 0x01f5, %r27
cpu_intr_0_202:
	setx	0x370121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2753: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e52191  ! 2755: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e50000  ! 2757: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_142:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 2760: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e5e050  ! 2768: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe40000  ! 2769: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 0)
	.word 0xbac44000  ! 2777: ADDCcc_R	addccc 	%r17, %r0, %r29
cpu_intr_0_203:
	setx	0x340212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc440000  ! 2779: ADDC_R	addc 	%r16, %r0, %r30
cpu_intr_0_204:
	setx	0x36022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 22)
	.word 0xba0d4000  ! 2784: AND_R	and 	%r21, %r0, %r29
T0_asi_reg_rd_126:
	mov	0x1e, %r14
	.word 0xf0db8e60  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfe58000  ! 2787: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde4a18b  ! 2792: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e48000  ! 2793: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_205:
	setx	0x370328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe4a135  ! 2800: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_206:
	setx	0x360107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc4561df  ! 2803: ADDC_I	addc 	%r21, 0x01df, %r30
T0_asi_reg_rd_127:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb01d4000  ! 2806: XOR_R	xor 	%r21, %r0, %r24
cpu_intr_0_207:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5612e  ! 2809: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e58000  ! 2810: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_128:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 2813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_208:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_209:
	setx	0x36010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1d9  ! 2817: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_210:
	setx	0x340334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0ce  ! 2819: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xba1c8000  ! 2820: XOR_R	xor 	%r18, %r0, %r29
	.word 0xb3e58000  ! 2821: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde50000  ! 2822: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_211:
	setx	0x360224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x11, %r14
	.word 0xfef38400  ! 2825: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_144:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 2828: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_212:
	setx	0x360035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_213:
	setx	0x35002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 2831: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9e5a10b  ! 2837: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbcbd6075  ! 2838: XNORcc_I	xnorcc 	%r21, 0x0075, %r30
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_214:
	setx	0x360334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 2843: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e58000  ! 2845: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_215:
	setx	0x35013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a184  ! 2850: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_216:
	setx	0x36022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56025  ! 2855: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5e127  ! 2860: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_217:
	setx	0x370123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc04c000  ! 2867: ADD_R	add 	%r19, %r0, %r30
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_145:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2870: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_146:
	mov	0xc, %r14
	.word 0xf6f38400  ! 2871: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_130:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 2872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_131:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e561aa  ! 2879: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_218:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_219:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_220:
	setx	0x370222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1fa  ! 2893: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e460da  ! 2896: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_132:
	mov	0x3, %r14
	.word 0xf2db8e80  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_221:
	setx	0x36011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x360207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5204d  ! 2908: ORNcc_I	orncc 	%r20, 0x004d, %r26
T0_asi_reg_rd_133:
	mov	0x10, %r14
	.word 0xfadb8400  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0x9195a1d2  ! 2913: WRPR_PIL_I	wrpr	%r22, 0x01d2, %pil
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_223:
	setx	0x360309, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e44000  ! 2918: SAVE_R	save	%r17, %r0, %r26
	.word 0xbbe421fb  ! 2919: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_136:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 2922: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_147:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 2923: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_148:
	mov	0x27, %r14
	.word 0xf8f38e60  ! 2924: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde4215e  ! 2925: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_149:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2929: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_137:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 2932: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_224:
	setx	0x350032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e100  ! 2934: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_150:
	mov	0x1c, %r14
	.word 0xf4f38400  ! 2936: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_225:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_151:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 2939: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_138:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 2942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_226:
	setx	0x370132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x37003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e54000  ! 2946: SAVE_R	save	%r21, %r0, %r25
	.word 0xbde42022  ! 2947: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_152:
	mov	0xe, %r14
	.word 0xfaf38400  ! 2948: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbcace020  ! 2951: ANDNcc_I	andncc 	%r19, 0x0020, %r30
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe48000  ! 2958: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 2959: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 0)
	.word 0x81952017  ! 2967: WRPR_TPC_I	wrpr	%r20, 0x0017, %tpc
T0_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 21)
	.word 0x819561fb  ! 2974: WRPR_TPC_I	wrpr	%r21, 0x01fb, %tpc
	.word 0xbbe521e3  ! 2981: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_141:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e44000  ! 2983: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e4c000  ! 2989: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e48000  ! 2990: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe42141  ! 2991: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_142:
	mov	0x11, %r14
	.word 0xf0db84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 3005: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e56127  ! 3006: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_154:
	mov	0x30, %r14
	.word 0xf8f38e80  ! 3007: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb69da04e  ! 3011: XORcc_I	xorcc 	%r22, 0x004e, %r27
T0_asi_reg_wr_155:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 3013: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 12)
	.word 0xb60c4000  ! 3017: AND_R	and 	%r17, %r0, %r27
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe5c000  ! 3019: SAVE_R	save	%r23, %r0, %r29
	.word 0xb1e5c000  ! 3020: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_143:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e4a05a  ! 3026: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e06c  ! 3027: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_156:
	mov	0x13, %r14
	.word 0xfaf38400  ! 3028: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_228:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x360212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0c3  ! 3032: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8595618f  ! 3033: WRPR_TSTATE_I	wrpr	%r21, 0x018f, %tstate
	.word 0xbfe5e040  ! 3038: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e44000  ! 3040: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e48000  ! 3043: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_230:
	setx	0x340111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_144:
	mov	0x13, %r14
	.word 0xf8db89e0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbde5a1e7  ! 3047: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e44000  ! 3049: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_157:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 3051: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb08cc000  ! 3052: ANDcc_R	andcc 	%r19, %r0, %r24
	.word 0xbbe561d9  ! 3053: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_231:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a083  ! 3056: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe5c000  ! 3058: SAVE_R	save	%r23, %r0, %r29
	.word 0xb4958000  ! 3059: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xbfe4e1b3  ! 3060: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x899560d7  ! 3063: WRPR_TICK_I	wrpr	%r21, 0x00d7, %tick
	.word 0xb1e40000  ! 3066: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_232:
	setx	0x37022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 3077: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xb9641800  ! 3078: MOVcc_R	<illegal instruction>
cpu_intr_0_233:
	setx	0x340117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 37)
	.word 0xb23d8000  ! 3082: XNOR_R	xnor 	%r22, %r0, %r25
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, d)
	.word 0xbde50000  ! 3089: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_158:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 3091: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e5a0b2  ! 3094: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb0154000  ! 3095: OR_R	or 	%r21, %r0, %r24
	.word 0xb5343001  ! 3096: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb7e44000  ! 3097: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_234:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561a8  ! 3101: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_235:
	setx	0x34022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b48000  ! 3103: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xb5e42113  ! 3104: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e58000  ! 3106: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_145:
	mov	0x2a, %r14
	.word 0xf0db8e80  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e4c000  ! 3108: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_236:
	setx	0x35001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bda00f  ! 3117: XNORcc_I	xnorcc 	%r22, 0x000f, %r26
	.word 0xbe9c602d  ! 3119: XORcc_I	xorcc 	%r17, 0x002d, %r31
	.word 0xbbe561fb  ! 3122: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe50000  ! 3127: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe54000  ! 3128: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e4618c  ! 3129: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_159:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3130: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_146:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbbe44000  ! 3147: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_160:
	mov	0x8, %r14
	.word 0xf8f38400  ! 3149: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 20)
	.word 0xbc15a16c  ! 3151: OR_I	or 	%r22, 0x016c, %r30
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe4a08c  ! 3155: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8f902000  ! 3156: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T0_asi_reg_wr_161:
	mov	0x32, %r14
	.word 0xfaf38400  ! 3157: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb52d1000  ! 3158: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xb1e48000  ! 3159: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_147:
	mov	0xe, %r14
	.word 0xfedb84a0  ! 3161: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0x899460e2  ! 3164: WRPR_TICK_I	wrpr	%r17, 0x00e2, %tick
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e50000  ! 3168: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e58000  ! 3169: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe420c8  ! 3172: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_162:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 3173: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_163:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 3183: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_237:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_164:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 3189: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb035605e  ! 3190: ORN_I	orn 	%r21, 0x005e, %r24
	.word 0xbfe58000  ! 3191: SAVE_R	save	%r22, %r0, %r31
	.word 0xb9e40000  ! 3192: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e5c000  ! 3193: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e58000  ! 3194: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_238:
	setx	0x38001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3207: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_148:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 3210: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9e4e0c4  ! 3213: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e4e16d  ! 3216: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_149:
	mov	0x8, %r14
	.word 0xfedb8e80  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_165:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 3223: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1e48000  ! 3226: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e54000  ! 3228: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_150:
	mov	0x26, %r14
	.word 0xf0db8e60  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfe52166  ! 3231: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_166:
	mov	0x19, %r14
	.word 0xf8f384a0  ! 3232: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5e561ee  ! 3233: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe54000  ! 3238: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde42021  ! 3240: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_167:
	mov	0x6, %r14
	.word 0xfef384a0  ! 3245: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb2ade1b8  ! 3246: ANDNcc_I	andncc 	%r23, 0x01b8, %r25
	.word 0xb045c000  ! 3247: ADDC_R	addc 	%r23, %r0, %r24
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe56153  ! 3250: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe48000  ! 3251: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e46111  ! 3253: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e40000  ! 3254: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e5e1ac  ! 3257: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_239:
	setx	0x390322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3263: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_168:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 3266: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_240:
	setx	0x390133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_241:
	setx	0x390336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e421eb  ! 3273: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe54000  ! 3276: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_242:
	setx	0x390304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_243:
	setx	0x3a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42023  ! 3295: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e1bb  ! 3296: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_244:
	setx	0x39031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3309: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e46179  ! 3313: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_169:
	mov	0x2e, %r14
	.word 0xfaf384a0  ! 3314: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbde4a022  ! 3315: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe520a8  ! 3319: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e5a047  ! 3321: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4e0fe  ! 3326: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_170:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3328: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc9d4000  ! 3329: XORcc_R	xorcc 	%r21, %r0, %r30
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 33)
	.word 0xbc458000  ! 3332: ADDC_R	addc 	%r22, %r0, %r30
	.word 0xb5e4c000  ! 3334: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_171:
	mov	0x35, %r14
	.word 0xfef38400  ! 3336: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_152:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_245:
	setx	0x3a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e11d  ! 3340: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe48000  ! 3341: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e4c000  ! 3342: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde4210f  ! 3343: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e420f8  ! 3345: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb93c0000  ! 3348: SRA_R	sra 	%r16, %r0, %r28
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 3351: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_rd_154:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbde50000  ! 3355: SAVE_R	save	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e420e7  ! 3361: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_246:
	setx	0x3b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_172:
	mov	0x26, %r14
	.word 0xf2f389e0  ! 3364: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_247:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x38011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3374: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde5e0e2  ! 3375: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e54000  ! 3377: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe5e020  ! 3379: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4a0eb  ! 3380: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_250:
	setx	0x3b0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_251:
	setx	0x380020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3384: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3e40000  ! 3388: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_252:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb4b48000  ! 3395: ORNcc_R	orncc 	%r18, %r0, %r26
	.word 0xbe1420a5  ! 3396: OR_I	or 	%r16, 0x00a5, %r31
	.word 0xbde54000  ! 3399: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5353001  ! 3405: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xb1e54000  ! 3406: SAVE_R	save	%r21, %r0, %r24
	.word 0xb48cc000  ! 3412: ANDcc_R	andcc 	%r19, %r0, %r26
cpu_intr_0_253:
	setx	0x3b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 3421: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1508000  ! 3422: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_254:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 3430: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbaa461f9  ! 3432: SUBcc_I	subcc 	%r17, 0x01f9, %r29
	.word 0xb9e42111  ! 3433: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e4613a  ! 3436: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_156:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe52135  ! 3440: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_174:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 3441: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde5c000  ! 3442: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_255:
	setx	0x380324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_157:
	mov	0x16, %r14
	.word 0xf8db8e80  ! 3446: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_256:
	setx	0x390017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_158:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_159:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_257:
	setx	0x38003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3464: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e48000  ! 3465: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e420e5  ! 3466: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbb504000  ! 3467: RDPR_TNPC	<illegal instruction>
	.word 0xb3e46010  ! 3470: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_258:
	setx	0x380312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba950000  ! 3479: ORcc_R	orcc 	%r20, %r0, %r29
T0_asi_reg_rd_160:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_161:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e560ca  ! 3487: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5e0ca  ! 3490: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb8040000  ! 3497: ADD_R	add 	%r16, %r0, %r28
T0_asi_reg_wr_175:
	mov	0x5, %r14
	.word 0xfef389e0  ! 3498: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbde44000  ! 3506: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_162:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_wr_176:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 3510: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4c000  ! 3516: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_259:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x3a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_177:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 3521: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e5e082  ! 3522: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd2d0000  ! 3523: SLL_R	sll 	%r20, %r0, %r30
T0_asi_reg_wr_178:
	mov	0x34, %r14
	.word 0xf0f38400  ! 3531: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9e4612e  ! 3538: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbca50000  ! 3539: SUBcc_R	subcc 	%r20, %r0, %r30
	.word 0xb5e48000  ! 3540: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5e42113  ! 3541: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde52154  ! 3542: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_261:
	setx	0x380322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x38002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x3b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x390327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3556: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_163:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_265:
	setx	0x3a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_266:
	setx	0x1030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x3a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_269:
	setx	0x38013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_270:
	setx	0x3b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 3566: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_179:
	mov	0x7, %r14
	.word 0xfaf38400  ! 3570: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde4a093  ! 3575: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 3578: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_271:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e58000  ! 3583: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_272:
	setx	0x380011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde5607d  ! 3597: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_273:
	setx	0x390201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0b9  ! 3607: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_274:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x390029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421bb  ! 3617: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e44000  ! 3619: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe52111  ! 3620: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbaa50000  ! 3622: SUBcc_R	subcc 	%r20, %r0, %r29
cpu_intr_0_276:
	setx	0x3b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 3629: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_180:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 3633: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_165:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xba954000  ! 3638: ORcc_R	orcc 	%r21, %r0, %r29
T0_asi_reg_wr_181:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 3640: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e5604b  ! 3644: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe5e13d  ! 3650: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_182:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 3651: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_277:
	setx	0x390132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_183:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 3656: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe48000  ! 3658: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_166:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e4e0af  ! 3667: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_168:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9e40000  ! 3670: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e54000  ! 3676: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_278:
	setx	0x3d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e135  ! 3680: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_184:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 3684: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e4c000  ! 3686: SAVE_R	save	%r19, %r0, %r27
	.word 0xb6b5e0d3  ! 3688: ORNcc_I	orncc 	%r23, 0x00d3, %r27
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_185:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 3691: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb045e0e6  ! 3693: ADDC_I	addc 	%r23, 0x00e6, %r24
	.word 0xbbe50000  ! 3694: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde50000  ! 3698: SAVE_R	save	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_279:
	setx	0x3c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3702: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe521dd  ! 3703: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbc95e163  ! 3705: ORcc_I	orcc 	%r23, 0x0163, %r30
	.word 0xb1e460b7  ! 3707: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a1a7  ! 3708: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_186:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 3714: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_187:
	mov	0x11, %r14
	.word 0xf8f38e80  ! 3715: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb63d8000  ! 3717: XNOR_R	xnor 	%r22, %r0, %r27
T0_asi_reg_wr_188:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 3722: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde5a039  ! 3726: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4e11b  ! 3728: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde54000  ! 3732: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e421b9  ! 3740: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_169:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e4210b  ! 3746: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_189:
	mov	0xb, %r14
	.word 0xfaf38400  ! 3750: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_170:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_190:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 3757: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_171:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e5a01b  ! 3761: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_191:
	mov	0x8, %r14
	.word 0xf2f38400  ! 3762: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5e520d3  ! 3764: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_280:
	setx	0x3e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde58000  ! 3771: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_172:
	mov	0x16, %r14
	.word 0xfcdb84a0  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe58000  ! 3775: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e5e065  ! 3776: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb20c0000  ! 3778: AND_R	and 	%r16, %r0, %r25
T0_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3781: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3e44000  ! 3782: SAVE_R	save	%r17, %r0, %r25
	.word 0xbe852046  ! 3785: ADDcc_I	addcc 	%r20, 0x0046, %r31
	.word 0xbbe50000  ! 3786: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_173:
	mov	0x23, %r14
	.word 0xf2db8e60  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_281:
	setx	0x3e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1f8  ! 3795: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe50000  ! 3796: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e46068  ! 3798: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_282:
	setx	0x3c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 13)
	.word 0xbe8c2148  ! 3801: ANDcc_I	andcc 	%r16, 0x0148, %r31
	.word 0xb1e44000  ! 3803: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_283:
	setx	0x3d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a068  ! 3805: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4c000  ! 3807: SAVE_R	save	%r19, %r0, %r25
	.word 0xb5e58000  ! 3810: SAVE_R	save	%r22, %r0, %r26
	.word 0xb3e5a0cc  ! 3813: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e48000  ! 3814: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e50000  ! 3817: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_193:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 3819: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_174:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 3820: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1e4219f  ! 3822: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4c000  ! 3826: SAVE_R	save	%r19, %r0, %r27
	.word 0xb9e48000  ! 3827: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_284:
	setx	0x3c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_285:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3836: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_175:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_176:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 3838: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e5200b  ! 3839: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe50000  ! 3840: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_286:
	setx	0x3e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 3842: SAVE_R	save	%r20, %r0, %r24
	.word 0xb92cb001  ! 3843: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xb415c000  ! 3844: OR_R	or 	%r23, %r0, %r26
T0_asi_reg_rd_177:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_287:
	setx	0x3c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x4, %r14
	.word 0xfaf384a0  ! 3854: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_195:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 3855: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_288:
	setx	0x3e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 3858: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_178:
	mov	0x30, %r14
	.word 0xf2db84a0  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9e50000  ! 3860: SAVE_R	save	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a129  ! 3863: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e5a139  ! 3866: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5e105  ! 3867: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e5a178  ! 3869: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e44000  ! 3874: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_289:
	setx	0x3e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bde000  ! 3876: XNORcc_I	xnorcc 	%r23, 0x0000, %r28
T0_asi_reg_wr_196:
	mov	0x35, %r14
	.word 0xf8f38400  ! 3877: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_290:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80dc000  ! 3888: AND_R	and 	%r23, %r0, %r28
T0_asi_reg_wr_197:
	mov	0x2f, %r14
	.word 0xf4f38e60  ! 3889: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_198:
	mov	0x23, %r14
	.word 0xfef389e0  ! 3894: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbbe44000  ! 3897: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde48000  ! 3898: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e58000  ! 3899: SAVE_R	save	%r22, %r0, %r25
	.word 0xb1e4a06e  ! 3901: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_291:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a008  ! 3905: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb6c5e023  ! 3908: ADDCcc_I	addccc 	%r23, 0x0023, %r27
	.word 0xb7e461d9  ! 3914: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e460b7  ! 3918: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_199:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3921: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbbe50000  ! 3922: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_292:
	setx	0x3f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1b4  ! 3925: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5a06a  ! 3926: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb2c6001  ! 3927: SLL_I	sll 	%r17, 0x0001, %r29
	.word 0xbbe5a1ab  ! 3930: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9354000  ! 3932: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb9e54000  ! 3933: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e48000  ! 3934: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e460c6  ! 3935: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_293:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 3937: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe50000  ! 3940: SAVE_R	save	%r20, %r0, %r31
	.word 0xb635e12a  ! 3943: ORN_I	orn 	%r23, 0x012a, %r27
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_294:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 20)
	.word 0xbfe5c000  ! 3950: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe461b4  ! 3952: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e54000  ! 3954: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_200:
	mov	0x3, %r14
	.word 0xfaf384a0  ! 3955: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_295:
	setx	0x3e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_201:
	mov	0x29, %r14
	.word 0xf2f389e0  ! 3964: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1e4c000  ! 3965: SAVE_R	save	%r19, %r0, %r24
	.word 0x85946190  ! 3968: WRPR_TSTATE_I	wrpr	%r17, 0x0190, %tstate
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_296:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_297:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_298:
	setx	0x3d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_182:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe50000  ! 3982: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_202:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 3983: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9e4e009  ! 3985: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_300:
	setx	0x3f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_203:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 3992: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_204:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 3994: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_302:
	setx	0x3d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_183:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_205:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4004: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_303:
	setx	0x3c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe4c000  ! 4008: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_304:
	setx	0x3d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_206:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 4010: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbbe58000  ! 4011: SAVE_R	save	%r22, %r0, %r29
	.word 0xb17c8400  ! 4014: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbf480000  ! 4016: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5e5e027  ! 4017: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_184:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 4019: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_185:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_207:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 4031: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde40000  ! 4033: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_186:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 4034: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb93c5000  ! 4036: SRAX_R	srax	%r17, %r0, %r28
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_305:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4042: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe44000  ! 4046: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, d)
	.word 0xbde4a164  ! 4048: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_306:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4050: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_208:
	mov	0x23, %r14
	.word 0xf8f38e80  ! 4051: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_209:
	mov	0x5, %r14
	.word 0xf4f38400  ! 4052: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e40000  ! 4066: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5e066  ! 4068: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e42189  ! 4069: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_307:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e42073  ! 4073: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde42115  ! 4078: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_210:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 4081: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe5c000  ! 4083: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_308:
	setx	0x3f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_187:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_309:
	setx	0x3d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 4096: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_188:
	mov	0x20, %r14
	.word 0xfedb8e60  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbd3ce001  ! 4098: SRA_I	sra 	%r19, 0x0001, %r30
T0_asi_reg_rd_189:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 4099: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_310:
	setx	0x400204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4103: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_211:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 4112: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_311:
	setx	0x40021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4117: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_190:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3e5a117  ! 4123: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e58000  ! 4126: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e44000  ! 4129: SAVE_R	save	%r17, %r0, %r26
	.word 0xbde58000  ! 4135: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_212:
	mov	0x32, %r14
	.word 0xf0f38400  ! 4136: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e42047  ! 4140: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_191:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_312:
	setx	0x42030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_192:
	mov	0x23, %r14
	.word 0xf4db8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_193:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 4148: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e54000  ! 4150: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_213:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 4152: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb52d0000  ! 4155: SLL_R	sll 	%r20, %r0, %r26
	.word 0xbfe5c000  ! 4156: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_194:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e56033  ! 4161: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_195:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 4169: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_214:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4175: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_313:
	setx	0x43011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_215:
	mov	0xa, %r14
	.word 0xfef38400  ! 4187: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_196:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde4215e  ! 4194: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbe1c0000  ! 4195: XOR_R	xor 	%r16, %r0, %r31
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e50000  ! 4197: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e4a050  ! 4199: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_314:
	setx	0x410226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x410301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb37c0400  ! 4205: MOVR_R	movre	%r16, %r0, %r25
	.word 0xb5e421d9  ! 4212: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_316:
	setx	0x430231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_317:
	setx	0x400207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461cf  ! 4218: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_216:
	mov	0x2e, %r14
	.word 0xfcf38e60  ! 4221: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_318:
	setx	0x41000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 4233: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_197:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4234: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_319:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_198:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e54000  ! 4241: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e4c000  ! 4243: SAVE_R	save	%r19, %r0, %r27
	.word 0xbc25a108  ! 4244: SUB_I	sub 	%r22, 0x0108, %r30
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5a064  ! 4247: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_320:
	setx	0x420135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946000  ! 4250: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
T0_asi_reg_wr_217:
	mov	0x38, %r14
	.word 0xf0f38400  ! 4252: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfe5e14e  ! 4256: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56073  ! 4267: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e136  ! 4270: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_321:
	setx	0x400139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_322:
	setx	0x420034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46152  ! 4276: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3641800  ! 4277: MOVcc_R	<illegal instruction>
	.word 0xb2854000  ! 4279: ADDcc_R	addcc 	%r21, %r0, %r25
T0_asi_reg_wr_218:
	mov	0x28, %r14
	.word 0xfef38e60  ! 4280: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e40000  ! 4283: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_323:
	setx	0x400131, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_324:
	setx	0x400137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 4290: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbcb4a055  ! 4292: SUBCcc_I	orncc 	%r18, 0x0055, %r30
	.word 0xbde5c000  ! 4293: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_325:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560e8  ! 4300: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_200:
	mov	0x7, %r14
	.word 0xf8db8e60  ! 4301: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9e48000  ! 4302: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde420ce  ! 4304: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_219:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 4306: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe54000  ! 4307: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e50000  ! 4309: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e40000  ! 4312: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_201:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e4e0d1  ! 4318: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbf343001  ! 4319: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0x8d95a0e0  ! 4321: WRPR_PSTATE_I	wrpr	%r22, 0x00e0, %pstate
	.word 0xb9e5e0a4  ! 4323: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_326:
	setx	0x430212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x4, %r14
	.word 0xfadb8400  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1e40000  ! 4332: SAVE_R	save	%r16, %r0, %r24
	.word 0xb5e46002  ! 4333: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbea40000  ! 4334: SUBcc_R	subcc 	%r16, %r0, %r31
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5e0e6  ! 4341: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe42154  ! 4342: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_327:
	setx	0x43012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_328:
	setx	0x410130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 4347: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde5e1fa  ! 4348: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e44000  ! 4349: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_220:
	mov	0xc, %r14
	.word 0xf8f38e80  ! 4350: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_329:
	setx	0x42022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42051  ! 4355: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e54000  ! 4356: SAVE_R	save	%r21, %r0, %r27
	.word 0xbe9ca05a  ! 4359: XORcc_I	xorcc 	%r18, 0x005a, %r31
T0_asi_reg_wr_221:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 4362: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb08c4000  ! 4363: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xbfe461ab  ! 4364: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_203:
	mov	0x32, %r14
	.word 0xf6db89e0  ! 4365: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_222:
	mov	0xe, %r14
	.word 0xf4f384a0  ! 4367: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_223:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 4373: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_224:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4374: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde4e0b8  ! 4380: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_225:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4383: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 4384: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_330:
	setx	0x430108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4388: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe4c000  ! 4389: SAVE_R	save	%r19, %r0, %r31
	.word 0xbc240000  ! 4396: SUB_R	sub 	%r16, %r0, %r30
T0_asi_reg_wr_226:
	mov	0x18, %r14
	.word 0xf4f38400  ! 4398: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_204:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_331:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4a0d9  ! 4404: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_227:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 4408: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc0c215b  ! 4410: AND_I	and 	%r16, 0x015b, %r30
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe58000  ! 4416: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_228:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 4420: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5e4c000  ! 4421: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_229:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 4422: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e4a007  ! 4424: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_332:
	setx	0x41020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4429: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_205:
	mov	0x0, %r14
	.word 0xf8db84a0  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf7de401  ! 4440: MOVR_I	movre	%r23, 0x1, %r31
	.word 0xb7e4c000  ! 4441: SAVE_R	save	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe48000  ! 4448: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e5c000  ! 4452: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e50000  ! 4455: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e520f1  ! 4456: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e4a1ce  ! 4462: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4e11c  ! 4463: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xba8d8000  ! 4469: ANDcc_R	andcc 	%r22, %r0, %r29
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_230:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 4472: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfe58000  ! 4473: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e52012  ! 4474: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5a1ae  ! 4476: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xba3c4000  ! 4479: XNOR_R	xnor 	%r17, %r0, %r29
cpu_intr_0_333:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 4482: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb205e1da  ! 4484: ADD_I	add 	%r23, 0x01da, %r25
T0_asi_reg_wr_231:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 4485: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_232:
	mov	0x23, %r14
	.word 0xfef389e0  ! 4486: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_233:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 4487: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e5205a  ! 4489: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_334:
	setx	0x40020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_335:
	setx	0x41012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_336:
	setx	0x42030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 4512: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e40000  ! 4516: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_207:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe58000  ! 4525: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e46153  ! 4530: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4c000  ! 4531: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_337:
	setx	0x430102, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_234:
	mov	0x9, %r14
	.word 0xfcf38400  ! 4533: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_208:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe4c000  ! 4545: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_338:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 5)
	.word 0xb835c000  ! 4553: ORN_R	orn 	%r23, %r0, %r28
cpu_intr_0_339:
	setx	0x44003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56106  ! 4559: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e58000  ! 4561: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_340:
	setx	0x45002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_341:
	setx	0x440139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_342:
	setx	0x460118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_209:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde48000  ! 4571: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_343:
	setx	0x450006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_344:
	setx	0x46031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_345:
	setx	0x440303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e421b8  ! 4585: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_346:
	setx	0x440211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ade1c2  ! 4587: ANDNcc_I	andncc 	%r23, 0x01c2, %r27
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 15)
	.word 0xb93de001  ! 4590: SRA_I	sra 	%r23, 0x0001, %r28
T0_asi_reg_wr_235:
	mov	0x21, %r14
	.word 0xf6f384a0  ! 4597: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_347:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e13b  ! 4600: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e420e6  ! 4601: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_210:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_211:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_348:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 10)
	.word 0xb9e4217c  ! 4616: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 7)
	.word 0xb00d8000  ! 4623: AND_R	and 	%r22, %r0, %r24
T0_asi_reg_wr_236:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 4628: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7e560a4  ! 4630: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_212:
	mov	0x30, %r14
	.word 0xf0db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_349:
	setx	0x440120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x36, %r14
	.word 0xfadb8400  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbf2d3001  ! 4644: SLLX_I	sllx	%r20, 0x0001, %r31
cpu_intr_0_350:
	setx	0x440324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde4a153  ! 4650: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbe9de043  ! 4651: XORcc_I	xorcc 	%r23, 0x0043, %r31
T0_asi_reg_rd_214:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 4652: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1349000  ! 4653: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xb7e4e082  ! 4655: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_237:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 4657: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e5e012  ! 4658: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e50000  ! 4661: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde48000  ! 4662: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e4a115  ! 4666: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_238:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 4667: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_239:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 4668: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb32c3001  ! 4670: SLLX_I	sllx	%r16, 0x0001, %r25
cpu_intr_0_351:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4674: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_352:
	setx	0x470107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4677: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_240:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 4681: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_353:
	setx	0x44030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e109  ! 4685: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5a068  ! 4687: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe520db  ! 4688: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e46162  ! 4692: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_241:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 4700: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbbe5a1db  ! 4701: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe5c000  ! 4702: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde420ec  ! 4704: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb48d21b6  ! 4706: ANDcc_I	andcc 	%r20, 0x01b6, %r26
	.word 0xb4b50000  ! 4709: ORNcc_R	orncc 	%r20, %r0, %r26
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_354:
	setx	0x44000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 4713: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_0_355:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d4000  ! 4719: XORcc_R	xorcc 	%r21, %r0, %r29
T0_asi_reg_wr_242:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 4720: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3e50000  ! 4722: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e40000  ! 4723: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_243:
	mov	0x37, %r14
	.word 0xfcf384a0  ! 4728: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_244:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe4a0bb  ! 4731: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_245:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 4732: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0x8195a06e  ! 4733: WRPR_TPC_I	wrpr	%r22, 0x006e, %tpc
cpu_intr_0_356:
	setx	0x450137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x20300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e08c  ! 4752: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e54000  ! 4753: SAVE_R	save	%r21, %r0, %r27
	.word 0xb53c2001  ! 4754: SRA_I	sra 	%r16, 0x0001, %r26
T0_asi_reg_wr_246:
	mov	0xe, %r14
	.word 0xfef384a0  ! 4756: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9e52198  ! 4757: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 5)
	.word 0xa1902001  ! 4764: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb5e50000  ! 4767: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_247:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 4769: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e44000  ! 4772: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_358:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_215:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 4774: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3e54000  ! 4775: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_248:
	mov	0x17, %r14
	.word 0xf2f38e80  ! 4776: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfe4c000  ! 4779: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_249:
	mov	0x22, %r14
	.word 0xf8f384a0  ! 4781: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e58000  ! 4783: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e5c000  ! 4784: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_250:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4786: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5352001  ! 4787: SRL_I	srl 	%r20, 0x0001, %r26
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e48000  ! 4792: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_359:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81dc000  ! 4797: XOR_R	xor 	%r23, %r0, %r28
	.word 0xb5e4e042  ! 4798: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4e08d  ! 4799: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e58000  ! 4804: SAVE_R	save	%r22, %r0, %r25
	.word 0xbe354000  ! 4805: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xbbe4a1d0  ! 4809: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_251:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4811: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_216:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e460ee  ! 4819: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_360:
	setx	0x470110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_361:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42155  ! 4826: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xba440000  ! 4827: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xb5e4c000  ! 4828: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e44000  ! 4829: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_362:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 4832: MOVcc_R	<illegal instruction>
	.word 0xbd3c4000  ! 4836: SRA_R	sra 	%r17, %r0, %r30
	.word 0xb7e5c000  ! 4840: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_252:
	mov	0x36, %r14
	.word 0xf0f384a0  ! 4842: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e4e190  ! 4851: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4c54000  ! 4852: ADDCcc_R	addccc 	%r21, %r0, %r26
	.word 0xb335a001  ! 4855: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xb5e58000  ! 4856: SAVE_R	save	%r22, %r0, %r26
	.word 0xbde5c000  ! 4865: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e4c000  ! 4866: SAVE_R	save	%r19, %r0, %r25
	.word 0xb1e4a02b  ! 4867: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe40000  ! 4870: SAVE_R	save	%r16, %r0, %r29
	.word 0xba344000  ! 4875: ORN_R	orn 	%r17, %r0, %r29
	.word 0xbfe40000  ! 4877: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_253:
	mov	0x27, %r14
	.word 0xf2f38e80  ! 4878: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe856066  ! 4883: ADDcc_I	addcc 	%r21, 0x0066, %r31
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_254:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4886: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_363:
	setx	0x46020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e13c  ! 4890: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xa1902000  ! 4894: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T0_asi_reg_rd_217:
	mov	0x10, %r14
	.word 0xf2db8e60  ! 4898: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbe3d616e  ! 4900: XNOR_I	xnor 	%r21, 0x016e, %r31
	.word 0xb805c000  ! 4903: ADD_R	add 	%r23, %r0, %r28
T0_asi_reg_wr_255:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 4905: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9e52011  ! 4906: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_364:
	setx	0x47003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52087  ! 4916: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe54000  ! 4917: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_218:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 4918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e48000  ! 4919: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_219:
	mov	0x0, %r14
	.word 0xfedb84a0  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe5a1aa  ! 4921: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_365:
	setx	0x450325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d8000  ! 4929: XNOR_R	xnor 	%r22, %r0, %r28
cpu_intr_0_366:
	setx	0x450020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e130  ! 4936: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e4215c  ! 4940: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb4c5e02d  ! 4943: ADDCcc_I	addccc 	%r23, 0x002d, %r26
T0_asi_reg_rd_220:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbc840000  ! 4948: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xbfe5c000  ! 4952: SAVE_R	save	%r23, %r0, %r31
	.word 0xbde5c000  ! 4953: SAVE_R	save	%r23, %r0, %r30
	.word 0xbd2cf001  ! 4956: SLLX_I	sllx	%r19, 0x0001, %r30
	.word 0xb5e461d1  ! 4957: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_367:
	setx	0x440116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_256:
	mov	0x13, %r14
	.word 0xf0f38400  ! 4959: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1e54000  ! 4960: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_368:
	setx	0x46012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a09d  ! 4964: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5a088  ! 4967: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e50000  ! 4968: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_369:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56111  ! 4977: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e42181  ! 4981: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_370:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_413:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_413), 16, 16)) -> intp(0, 0, f)
	.word 0xbde4c000  ! 4989: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_371:
	setx	0x470023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_372:
	setx	0x440131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_373:
	setx	0x47022b, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xf0344000  ! 6: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfeb58020  ! 13: STHA_R	stha	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 14: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf43461d3  ! 18: STH_I	sth	%r26, [%r17 + 0x01d3]
T3_asi_reg_wr_0:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 19: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_0:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_1:
	mov	0x36, %r14
	.word 0xfef38e40  ! 24: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf224c000  ! 26: STW_R	stw	%r25, [%r19 + %r0]
cpu_intr_3_1:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc05a104  ! 31: ADD_I	add 	%r22, 0x0104, %r30
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_TO_TL0
	.word 0xfea4c020  ! 39: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xb1510000  ! 44: RDPR_TICK	rdpr	%tick, %r24
	.word 0xfe34a014  ! 47: STH_I	sth	%r31, [%r18 + 0x0014]
	.word 0xb57d0400  ! 48: MOVR_R	movre	%r20, %r0, %r26
T3_asi_reg_wr_2:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 49: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_3:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 51: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_4:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 52: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf834c000  ! 53: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf4ac4020  ! 54: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf8758000  ! 57: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xbe358000  ! 58: SUBC_R	orn 	%r22, %r0, %r31
T3_asi_reg_wr_5:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_2:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 18)
	.word 0xf0a5c020  ! 64: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_3:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_4:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_6:
	mov	0x25, %r14
	.word 0xf0f38400  ! 69: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 8)
	.word 0xb83cc000  ! 71: XNOR_R	xnor 	%r19, %r0, %r28
T3_asi_reg_wr_7:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 72: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819839d0  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
T3_asi_reg_rd_5:
	mov	0x5, %r14
	.word 0xf2db84a0  ! 78: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 1f)
	.word 0xbe948000  ! 81: ORcc_R	orcc 	%r18, %r0, %r31
T3_asi_reg_rd_6:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 82: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_2:
	setx	0x1d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_3:
	setx	0x1d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_8:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 90: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfca4c020  ! 91: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
cpu_intr_3_4:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4ad8020  ! 95: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf8350000  ! 96: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf2244000  ! 99: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf2ad4020  ! 100: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xf8ade156  ! 109: STBA_I	stba	%r28, [%r23 + 0x0156] %asi
	.word 0xf0ac0020  ! 110: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xf2a50020  ! 116: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0x919561df  ! 117: WRPR_PIL_I	wrpr	%r21, 0x01df, %pil
T3_asi_reg_wr_9:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 118: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfead0020  ! 119: STBA_R	stba	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_10:
	mov	0x24, %r14
	.word 0xfef38400  ! 120: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb4058000  ! 122: ADD_R	add 	%r22, %r0, %r26
T3_asi_reg_wr_11:
	mov	0x12, %r14
	.word 0xf2f38400  ! 123: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_5:
	setx	0x1c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 127: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf475a0b2  ! 129: STX_I	stx	%r26, [%r22 + 0x00b2]
	.word 0xf6adc020  ! 131: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_12:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 133: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_6:
	setx	0x1f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c6124  ! 137: STB_I	stb	%r27, [%r17 + 0x0124]
cpu_intr_3_7:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_8:
	setx	0x1f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4c020  ! 141: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_9:
	setx	0x1f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_13:
	mov	0x30, %r14
	.word 0xf8f38e60  ! 149: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4a560ea  ! 150: STWA_I	stwa	%r26, [%r21 + 0x00ea] %asi
T3_asi_reg_wr_14:
	mov	0x37, %r14
	.word 0xfaf38400  ! 151: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 32)
	.word 0xfead207e  ! 164: STBA_I	stba	%r31, [%r20 + 0x007e] %asi
T3_asi_reg_wr_15:
	mov	0xb, %r14
	.word 0xfaf384a0  ! 165: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfaf5a16d  ! 169: STXA_I	stxa	%r29, [%r22 + 0x016d] %asi
	.word 0xfeac0020  ! 171: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf4a4a16f  ! 172: STWA_I	stwa	%r26, [%r18 + 0x016f] %asi
	.word 0xf6f5a1ad  ! 176: STXA_I	stxa	%r27, [%r22 + 0x01ad] %asi
T3_asi_reg_rd_8:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 177: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb17c0400  ! 179: MOVR_R	movre	%r16, %r0, %r24
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_9:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfab50020  ! 189: STHA_R	stha	%r29, [%r20 + %r0] 0x01
T3_asi_reg_wr_16:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 190: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbe3da035  ! 191: XNOR_I	xnor 	%r22, 0x0035, %r31
cpu_intr_3_10:
	setx	0x1c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 196: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_11:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_12:
	setx	0x1f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 202: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_10:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbb3d8000  ! 206: SRA_R	sra 	%r22, %r0, %r29
	.word 0xfa25202a  ! 208: STW_I	stw	%r29, [%r20 + 0x002a]
cpu_intr_3_13:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 211: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 11)
	.word 0xfe24a153  ! 218: STW_I	stw	%r31, [%r18 + 0x0153]
cpu_intr_3_14:
	setx	0x1f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 220: STB_R	stb	%r27, [%r21 + %r0]
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 23)
	.word 0xfab54020  ! 222: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xfa35e0ec  ! 224: STH_I	sth	%r29, [%r23 + 0x00ec]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_15:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 230: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_18:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 232: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a4a  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	.word 0xb63d2062  ! 238: XNOR_I	xnor 	%r20, 0x0062, %r27
	.word 0xf835e149  ! 239: STH_I	sth	%r28, [%r23 + 0x0149]
	.word 0xf835a153  ! 240: STH_I	sth	%r28, [%r22 + 0x0153]
T3_asi_reg_wr_19:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 241: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf2748000  ! 247: STX_R	stx	%r25, [%r18 + %r0]
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_12:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 250: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8f5a188  ! 251: STXA_I	stxa	%r28, [%r22 + 0x0188] %asi
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 2)
	.word 0xfeb40020  ! 254: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xf0b4a16a  ! 256: STHA_I	stha	%r24, [%r18 + 0x016a] %asi
T3_asi_reg_wr_20:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 260: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb62dc000  ! 261: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xf224e157  ! 262: STW_I	stw	%r25, [%r19 + 0x0157]
cpu_intr_3_16:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf560a5  ! 267: STXA_I	stxa	%r29, [%r21 + 0x00a5] %asi
T3_asi_reg_rd_13:
	mov	0x2, %r14
	.word 0xfadb8e80  ! 272: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_14:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 273: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfaa44020  ! 274: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_21:
	mov	0x32, %r14
	.word 0xf8f389e0  ! 277: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb43ca167  ! 279: XNOR_I	xnor 	%r18, 0x0167, %r26
	.word 0xf4b48020  ! 280: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_15:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_17:
	setx	0x1f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22d4000  ! 292: ANDN_R	andn 	%r21, %r0, %r25
T3_asi_reg_rd_16:
	mov	0x34, %r14
	.word 0xfedb8e60  ! 293: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf835a0d9  ! 296: STH_I	sth	%r28, [%r22 + 0x00d9]
T3_asi_reg_wr_22:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 297: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_23:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 298: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_18:
	setx	0x1d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf0b421cb  ! 309: STHA_I	stha	%r24, [%r16 + 0x01cb] %asi
T3_asi_reg_rd_18:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a58  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
T3_asi_reg_wr_24:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 312: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_25:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 314: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf824a193  ! 315: STW_I	stw	%r28, [%r18 + 0x0193]
	.word 0xfc2cc000  ! 316: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf6758000  ! 317: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, f)
	.word 0xb33d1000  ! 326: SRAX_R	srax	%r20, %r0, %r25
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe244000  ! 334: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_wr_26:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 340: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_19:
	mov	0xa, %r14
	.word 0xf2db8400  ! 343: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_27:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 345: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b5a  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 36)
	.word 0xf4240000  ! 354: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbc9ce0ec  ! 356: XORcc_I	xorcc 	%r19, 0x00ec, %r30
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 358: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xba3d8000  ! 359: XNOR_R	xnor 	%r22, %r0, %r29
	.word 0xfc344000  ! 360: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfaade193  ! 361: STBA_I	stba	%r29, [%r23 + 0x0193] %asi
	.word 0xfa2de0e2  ! 363: STB_I	stb	%r29, [%r23 + 0x00e2]
T3_asi_reg_rd_20:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_19:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23420cf  ! 367: STH_I	sth	%r25, [%r16 + 0x00cf]
	.word 0xbebc0000  ! 369: XNORcc_R	xnorcc 	%r16, %r0, %r31
	.word 0xbab48000  ! 370: SUBCcc_R	orncc 	%r18, %r0, %r29
cpu_intr_3_20:
	setx	0x1e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_21:
	setx	0x1d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_22:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfef56030  ! 389: STXA_I	stxa	%r31, [%r21 + 0x0030] %asi
	.word 0xfaf5e0c7  ! 390: STXA_I	stxa	%r29, [%r23 + 0x00c7] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d4000  ! 393: STB_R	stb	%r31, [%r21 + %r0]
T3_asi_reg_rd_21:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf8b58020  ! 396: STHA_R	stha	%r28, [%r22 + %r0] 0x01
cpu_intr_3_23:
	setx	0x1c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da0f3  ! 399: STB_I	stb	%r30, [%r22 + 0x00f3]
T3_asi_reg_wr_29:
	mov	0x0, %r14
	.word 0xf4f38e80  ! 400: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_22:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 401: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2348000  ! 408: STH_R	sth	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_24:
	setx	0x1d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_23:
	mov	0x24, %r14
	.word 0xf2db8e60  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_30:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 429: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_25:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2de0fb  ! 438: STB_I	stb	%r29, [%r23 + 0x00fb]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_26:
	setx	0x230205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274c000  ! 443: STX_R	stx	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_31:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 446: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6348000  ! 447: STH_R	sth	%r27, [%r18 + %r0]
T3_asi_reg_rd_24:
	mov	0x29, %r14
	.word 0xf2db8e80  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_27:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_28:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac20f2  ! 457: STBA_I	stba	%r26, [%r16 + 0x00f2] %asi
T3_asi_reg_wr_32:
	mov	0x0, %r14
	.word 0xfaf38400  ! 460: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
cpu_intr_3_29:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5a1c3  ! 464: STXA_I	stxa	%r27, [%r22 + 0x01c3] %asi
cpu_intr_3_30:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_31:
	setx	0x230233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, a)
	.word 0xf4f5a0c7  ! 469: STXA_I	stxa	%r26, [%r22 + 0x00c7] %asi
T3_asi_reg_rd_25:
	mov	0xa, %r14
	.word 0xfadb8400  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb0350000  ! 471: ORN_R	orn 	%r20, %r0, %r24
cpu_intr_3_32:
	setx	0x23000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e1d8  ! 475: STH_I	sth	%r31, [%r19 + 0x01d8]
T3_asi_reg_rd_26:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 477: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfa24c000  ! 478: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfc254000  ! 479: STW_R	stw	%r30, [%r21 + %r0]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b1a  ! 480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xba9cc000  ! 483: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xf2a460c7  ! 485: STWA_I	stwa	%r25, [%r17 + 0x00c7] %asi
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819828c0  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	.word 0xfaa42044  ! 494: STWA_I	stwa	%r29, [%r16 + 0x0044] %asi
	.word 0xfaad4020  ! 498: STBA_R	stba	%r29, [%r21 + %r0] 0x01
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 2b)
	ta	T_CHANGE_TO_TL0
	.word 0xb52c0000  ! 504: SLL_R	sll 	%r16, %r0, %r26
T3_asi_reg_rd_27:
	mov	0x10, %r14
	.word 0xfadb84a0  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf8750000  ! 506: STX_R	stx	%r28, [%r20 + %r0]
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_33:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 510: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6f4a180  ! 515: STXA_I	stxa	%r27, [%r18 + 0x0180] %asi
T3_asi_reg_rd_28:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 519: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfeb4a155  ! 520: STHA_I	stha	%r31, [%r18 + 0x0155] %asi
cpu_intr_3_33:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82ce174  ! 523: ANDN_I	andn 	%r19, 0x0174, %r28
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa2c4000  ! 526: STB_R	stb	%r29, [%r17 + %r0]
T3_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_30:
	mov	0x1e, %r14
	.word 0xf0db8e80  ! 528: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf0a42155  ! 531: STWA_I	stwa	%r24, [%r16 + 0x0155] %asi
T3_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf0740000  ! 533: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 22)
	.word 0xf62de0fd  ! 535: STB_I	stb	%r27, [%r23 + 0x00fd]
cpu_intr_3_34:
	setx	0x22002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe748000  ! 537: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf23461c3  ! 538: STH_I	sth	%r25, [%r17 + 0x01c3]
	.word 0xf22d61fe  ! 539: STB_I	stb	%r25, [%r21 + 0x01fe]
	.word 0xf074e101  ! 541: STX_I	stx	%r24, [%r19 + 0x0101]
T3_asi_reg_rd_32:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 543: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_33:
	mov	0x0, %r14
	.word 0xfedb8400  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbb641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xf6a46019  ! 554: STWA_I	stwa	%r27, [%r17 + 0x0019] %asi
	.word 0xfeade14c  ! 556: STBA_I	stba	%r31, [%r23 + 0x014c] %asi
cpu_intr_3_35:
	setx	0x220102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_36:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_37:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a0e6  ! 561: STH_I	sth	%r30, [%r22 + 0x00e6]
cpu_intr_3_38:
	setx	0x220222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_34:
	mov	0xb, %r14
	.word 0xf2db89e0  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbf7d0400  ! 564: MOVR_R	movre	%r20, %r0, %r31
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198384a  ! 566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
cpu_intr_3_39:
	setx	0x200309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c3001  ! 569: SRAX_I	srax	%r16, 0x0001, %r29
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe750000  ! 572: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfcf460b5  ! 575: STXA_I	stxa	%r30, [%r17 + 0x00b5] %asi
T3_asi_reg_rd_35:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e00  ! 578: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
T3_asi_reg_wr_34:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 579: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_40:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b58020  ! 584: STHA_R	stha	%r25, [%r22 + %r0] 0x01
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_41:
	setx	0x200120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_35:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 591: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbebc0000  ! 593: XNORcc_R	xnorcc 	%r16, %r0, %r31
cpu_intr_3_42:
	setx	0x220034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x220210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeaca11d  ! 598: STBA_I	stba	%r31, [%r18 + 0x011d] %asi
	.word 0xf8a5c020  ! 600: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe2ca0aa  ! 605: STB_I	stb	%r31, [%r18 + 0x00aa]
	ta	T_CHANGE_TO_TL0
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 38)
	.word 0xfcb4c020  ! 609: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xf6a48020  ! 610: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf62cc000  ! 611: STB_R	stb	%r27, [%r19 + %r0]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa34216b  ! 616: STH_I	sth	%r29, [%r16 + 0x016b]
	.word 0xb92c4000  ! 617: SLL_R	sll 	%r17, %r0, %r28
T3_asi_reg_wr_36:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 619: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf6f4217a  ! 620: STXA_I	stxa	%r27, [%r16 + 0x017a] %asi
	.word 0xf0244000  ! 628: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf0a50020  ! 633: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 39)
	.word 0xf27460da  ! 637: STX_I	stx	%r25, [%r17 + 0x00da]
	.word 0xf835e1c3  ! 638: STH_I	sth	%r28, [%r23 + 0x01c3]
T3_asi_reg_wr_37:
	mov	0x1a, %r14
	.word 0xf2f389e0  ! 639: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xfa75c000  ! 642: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xfaa4e002  ! 644: STWA_I	stwa	%r29, [%r19 + 0x0002] %asi
	.word 0xfea421d5  ! 645: STWA_I	stwa	%r31, [%r16 + 0x01d5] %asi
cpu_intr_3_45:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ace1e3  ! 647: STBA_I	stba	%r25, [%r19 + 0x01e3] %asi
	.word 0xf4344000  ! 650: STH_R	sth	%r26, [%r17 + %r0]
T3_asi_reg_wr_38:
	mov	0xc, %r14
	.word 0xfef38e40  ! 652: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_46:
	setx	0x230009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_47:
	setx	0x220105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4a010  ! 657: STWA_I	stwa	%r31, [%r18 + 0x0010] %asi
T3_asi_reg_rd_37:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 660: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfca4a007  ! 662: STWA_I	stwa	%r30, [%r18 + 0x0007] %asi
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 3)
	.word 0xf2ac4020  ! 666: STBA_R	stba	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_38:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb8b58000  ! 669: SUBCcc_R	orncc 	%r22, %r0, %r28
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_3_48:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ada076  ! 683: STBA_I	stba	%r25, [%r22 + 0x0076] %asi
cpu_intr_3_49:
	setx	0x210033, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 691: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa354000  ! 692: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf8f5213c  ! 696: STXA_I	stxa	%r28, [%r20 + 0x013c] %asi
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a50  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 35)
	.word 0xf4ade020  ! 704: STBA_I	stba	%r26, [%r23 + 0x0020] %asi
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_50:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_41:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 716: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_39:
	mov	0x15, %r14
	.word 0xf2db8400  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbc85c000  ! 719: ADDcc_R	addcc 	%r23, %r0, %r30
cpu_intr_3_51:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x210227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfc2c0000  ! 724: STB_R	stb	%r30, [%r16 + %r0]
T3_asi_reg_wr_42:
	mov	0x11, %r14
	.word 0xfef38e60  ! 726: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfef4e026  ! 728: STXA_I	stxa	%r31, [%r19 + 0x0026] %asi
	.word 0xfa25c000  ! 729: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xfab5c020  ! 731: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xf425e058  ! 732: STW_I	stw	%r26, [%r23 + 0x0058]
T3_asi_reg_rd_40:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_43:
	mov	0x2b, %r14
	.word 0xf6f38400  ! 738: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2ade18f  ! 741: STBA_I	stba	%r25, [%r23 + 0x018f] %asi
	.word 0xf6ace143  ! 742: STBA_I	stba	%r27, [%r19 + 0x0143] %asi
	.word 0xfe3461f4  ! 743: STH_I	sth	%r31, [%r17 + 0x01f4]
cpu_intr_3_53:
	setx	0x200016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_54:
	setx	0x200039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d0000  ! 747: XOR_R	xor 	%r20, %r0, %r24
	.word 0xfaa5a09e  ! 748: STWA_I	stwa	%r29, [%r22 + 0x009e] %asi
	.word 0xf8ad60ce  ! 750: STBA_I	stba	%r28, [%r21 + 0x00ce] %asi
cpu_intr_3_55:
	setx	0x20023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_41:
	mov	0x1f, %r14
	.word 0xf6db84a0  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb0b4a1f3  ! 756: ORNcc_I	orncc 	%r18, 0x01f3, %r24
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a58  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
	.word 0xf8256142  ! 759: STW_I	stw	%r28, [%r21 + 0x0142]
T3_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 760: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfca4e1f3  ! 761: STWA_I	stwa	%r30, [%r19 + 0x01f3] %asi
	.word 0xf8ace133  ! 763: STBA_I	stba	%r28, [%r19 + 0x0133] %asi
	.word 0xf2ac216e  ! 767: STBA_I	stba	%r25, [%r16 + 0x016e] %asi
	.word 0xf234a1ee  ! 771: STH_I	sth	%r25, [%r18 + 0x01ee]
cpu_intr_3_56:
	setx	0x21023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_45:
	mov	0x28, %r14
	.word 0xfaf389e0  ! 775: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf8250000  ! 776: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf42c6101  ! 780: STB_I	stb	%r26, [%r17 + 0x0101]
cpu_intr_3_57:
	setx	0x210000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_46:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 786: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982952  ! 789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0xb694c000  ! 790: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xfc746154  ! 793: STX_I	stx	%r30, [%r17 + 0x0154]
	.word 0xfeada1e3  ! 794: STBA_I	stba	%r31, [%r22 + 0x01e3] %asi
	.word 0xfe34c000  ! 795: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf8354000  ! 797: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_58:
	setx	0x23001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d21c8  ! 802: STB_I	stb	%r27, [%r20 + 0x01c8]
	.word 0xfc240000  ! 804: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfc2de1c8  ! 805: STB_I	stb	%r30, [%r23 + 0x01c8]
cpu_intr_3_59:
	setx	0x220122, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_60:
	setx	0x200022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d0400  ! 818: MOVR_R	movre	%r20, %r0, %r27
	.word 0xf6a5c020  ! 819: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf8b5217f  ! 822: STHA_I	stha	%r28, [%r20 + 0x017f] %asi
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf824612f  ! 828: STW_I	stw	%r28, [%r17 + 0x012f]
cpu_intr_3_61:
	setx	0x220028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025c000  ! 834: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf4a4c020  ! 835: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xf225a099  ! 836: STW_I	stw	%r25, [%r22 + 0x0099]
T3_asi_reg_rd_45:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf22c4000  ! 839: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb89d60f3  ! 845: XORcc_I	xorcc 	%r21, 0x00f3, %r28
	.word 0xf02c0000  ! 852: STB_R	stb	%r24, [%r16 + %r0]
T3_asi_reg_wr_47:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 856: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb4858000  ! 857: ADDcc_R	addcc 	%r22, %r0, %r26
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8b50020  ! 859: STHA_R	stha	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xba8c4000  ! 863: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xf0b58020  ! 864: STHA_R	stha	%r24, [%r22 + %r0] 0x01
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 33)
	.word 0xf475204b  ! 868: STX_I	stx	%r26, [%r20 + 0x004b]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 12)
	.word 0xf0258000  ! 872: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_48:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 878: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_49:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 880: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2f561b1  ! 881: STXA_I	stxa	%r25, [%r21 + 0x01b1] %asi
	.word 0xb7641800  ! 883: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_50:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 884: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 27)
	.word 0xfaa46058  ! 890: STWA_I	stwa	%r29, [%r17 + 0x0058] %asi
cpu_intr_3_62:
	setx	0x200329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 892: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xbf3d9000  ! 893: SRAX_R	srax	%r22, %r0, %r31
T3_asi_reg_rd_47:
	mov	0x35, %r14
	.word 0xfedb8e60  ! 895: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_51:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 897: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfe7561dd  ! 898: STX_I	stx	%r31, [%r21 + 0x01dd]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_63:
	setx	0x270331, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 911: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc352118  ! 912: STH_I	sth	%r30, [%r20 + 0x0118]
T3_asi_reg_rd_49:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 916: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf6ad21bd  ! 918: STBA_I	stba	%r27, [%r20 + 0x01bd] %asi
	.word 0xfa24e089  ! 921: STW_I	stw	%r29, [%r19 + 0x0089]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_52:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 923: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 14)
	.word 0xf62d4000  ! 926: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf4248000  ! 927: STW_R	stw	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42420a5  ! 932: STW_I	stw	%r26, [%r16 + 0x00a5]
T3_asi_reg_wr_53:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 937: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 941: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xba9de060  ! 942: XORcc_I	xorcc 	%r23, 0x0060, %r29
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_64:
	setx	0x27022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 946: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_TO_TL0
	.word 0xf8f4a0c1  ! 951: STXA_I	stxa	%r28, [%r18 + 0x00c1] %asi
T3_asi_reg_rd_50:
	mov	0x27, %r14
	.word 0xf8db8e80  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe25a1f0  ! 953: STW_I	stw	%r31, [%r22 + 0x01f0]
	.word 0xfaac8020  ! 954: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbd7d4400  ! 956: MOVR_R	movre	%r21, %r0, %r30
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0ad8020  ! 962: STBA_R	stba	%r24, [%r22 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4f561fa  ! 966: STXA_I	stxa	%r26, [%r21 + 0x01fa] %asi
	.word 0xf235c000  ! 967: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfcad4020  ! 971: STBA_R	stba	%r30, [%r21 + %r0] 0x01
cpu_intr_3_65:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e151  ! 976: WRPR_TPC_I	wrpr	%r23, 0x0151, %tpc
T3_asi_reg_rd_51:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 977: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb6a42167  ! 986: SUBcc_I	subcc 	%r16, 0x0167, %r27
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 14)
	.word 0xf8b5e0f9  ! 991: STHA_I	stha	%r28, [%r23 + 0x00f9] %asi
T3_asi_reg_wr_55:
	mov	0x6, %r14
	.word 0xf2f38e80  ! 992: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_52:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc758000  ! 994: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfea44020  ! 995: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a50  ! 998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e52  ! 999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
T3_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa340000  ! 1001: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_66:
	setx	0x27012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a0ed  ! 1007: STX_I	stx	%r25, [%r22 + 0x00ed]
	.word 0xb01dc000  ! 1008: XOR_R	xor 	%r23, %r0, %r24
	.word 0xf8b54020  ! 1010: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_56:
	mov	0x36, %r14
	.word 0xf4f38e60  ! 1015: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_67:
	setx	0x260314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_68:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 1021: STH_R	sth	%r24, [%r18 + %r0]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfca5a1e2  ! 1029: STWA_I	stwa	%r30, [%r22 + 0x01e2] %asi
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_69:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe356057  ! 1033: STH_I	sth	%r31, [%r21 + 0x0057]
T3_asi_reg_rd_54:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_70:
	setx	0x30022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 1d)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c4a  ! 1050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4a, %hpstate
	.word 0xf824a13c  ! 1051: STW_I	stw	%r28, [%r18 + 0x013c]
cpu_intr_3_71:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6ad60bd  ! 1056: STBA_I	stba	%r27, [%r21 + 0x00bd] %asi
	.word 0xfcf4a064  ! 1057: STXA_I	stxa	%r30, [%r18 + 0x0064] %asi
	.word 0xb8bd602a  ! 1059: XNORcc_I	xnorcc 	%r21, 0x002a, %r28
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_55:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf4754000  ! 1068: STX_R	stx	%r26, [%r21 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 4)
	.word 0xf824609e  ! 1071: STW_I	stw	%r28, [%r17 + 0x009e]
	.word 0xb835a11a  ! 1072: ORN_I	orn 	%r22, 0x011a, %r28
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f9a  ! 1074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
cpu_intr_3_72:
	setx	0x270100, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829d0  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, e)
	.word 0xfef5e194  ! 1083: STXA_I	stxa	%r31, [%r23 + 0x0194] %asi
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982dc2  ! 1088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
	.word 0xf2ade099  ! 1090: STBA_I	stba	%r25, [%r23 + 0x0099] %asi
	.word 0xfaad8020  ! 1091: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xfa74a1c8  ! 1093: STX_I	stx	%r29, [%r18 + 0x01c8]
cpu_intr_3_73:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_56:
	mov	0x29, %r14
	.word 0xf4db8400  ! 1096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_57:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe34e0d0  ! 1102: STH_I	sth	%r31, [%r19 + 0x00d0]
T3_asi_reg_wr_57:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 1103: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 12)
	.word 0xf6340000  ! 1110: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf42d2192  ! 1111: STB_I	stb	%r26, [%r20 + 0x0192]
T3_asi_reg_rd_58:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_74:
	setx	0x250213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e1a8  ! 1115: STH_I	sth	%r26, [%r19 + 0x01a8]
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_75:
	setx	0x270212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_77:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d4000  ! 1123: ANDcc_R	andcc 	%r21, %r0, %r26
T3_asi_reg_wr_58:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 1124: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 3a)
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983842  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
	.word 0xfa348000  ! 1132: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_59:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfea4a05c  ! 1134: STWA_I	stwa	%r31, [%r18 + 0x005c] %asi
cpu_intr_3_78:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_60:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 1137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_59:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1142: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_61:
	mov	0x2e, %r14
	.word 0xf2db84a0  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc25c000  ! 1144: STW_R	stw	%r30, [%r23 + %r0]
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_79:
	setx	0x260322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 1148: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_62:
	mov	0x31, %r14
	.word 0xf2db8400  ! 1149: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfcac20b7  ! 1151: STBA_I	stba	%r30, [%r16 + 0x00b7] %asi
	.word 0xf6a561ea  ! 1152: STWA_I	stwa	%r27, [%r21 + 0x01ea] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf07420cb  ! 1159: STX_I	stx	%r24, [%r16 + 0x00cb]
	.word 0xf8252072  ! 1160: STW_I	stw	%r28, [%r20 + 0x0072]
T3_asi_reg_wr_60:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 1161: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, b)
	.word 0xfc744000  ! 1166: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 39)
	.word 0xb41d4000  ! 1172: XOR_R	xor 	%r21, %r0, %r26
	.word 0xf4ad61cd  ! 1173: STBA_I	stba	%r26, [%r21 + 0x01cd] %asi
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf424a1d1  ! 1178: STW_I	stw	%r26, [%r18 + 0x01d1]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, f)
	.word 0xfaad4020  ! 1188: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfeade1bd  ! 1192: STBA_I	stba	%r31, [%r23 + 0x01bd] %asi
T3_asi_reg_rd_63:
	mov	0x20, %r14
	.word 0xfedb8e80  ! 1193: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_61:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 1194: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_64:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb4c44000  ! 1196: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0xf6356118  ! 1197: STH_I	sth	%r27, [%r21 + 0x0118]
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_62:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 1202: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_65:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfe25a18b  ! 1207: STW_I	stw	%r31, [%r22 + 0x018b]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_80:
	setx	0x26000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_81:
	setx	0x270225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_82:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_63:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 1219: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf62d4000  ! 1226: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfeac60b7  ! 1229: STBA_I	stba	%r31, [%r17 + 0x00b7] %asi
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c90  ! 1231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c90, %hpstate
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 1234: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c0  ! 1241: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
cpu_intr_3_83:
	setx	0x250312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946053  ! 1244: WRPR_TPC_I	wrpr	%r17, 0x0053, %tpc
	ta	T_CHANGE_NONHPRIV
	.word 0xfab560c0  ! 1247: STHA_I	stha	%r29, [%r21 + 0x00c0] %asi
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_TO_TL0
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe2d8000  ! 1260: STB_R	stb	%r31, [%r22 + %r0]
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_84:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a461d5  ! 1265: STWA_I	stwa	%r26, [%r17 + 0x01d5] %asi
	.word 0xf8250000  ! 1266: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_rd_66:
	mov	0x14, %r14
	.word 0xf0db84a0  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_85:
	setx	0x26002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_86:
	setx	0x260331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x270113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 1277: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_88:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf67420ca  ! 1279: STX_I	stx	%r27, [%r16 + 0x00ca]
cpu_intr_3_89:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_90:
	setx	0x24002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaacc020  ! 1288: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf6748000  ! 1291: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf4b44020  ! 1292: STHA_R	stha	%r26, [%r17 + %r0] 0x01
cpu_intr_3_91:
	setx	0x250027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 1296: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_92:
	setx	0x260008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_68:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_65:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 1308: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_93:
	setx	0x27013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c8000  ! 1313: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf2b40020  ! 1314: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xf8ade079  ! 1315: STBA_I	stba	%r28, [%r23 + 0x0079] %asi
	.word 0xf8b460bd  ! 1318: STHA_I	stha	%r28, [%r17 + 0x00bd] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf42dc000  ! 1323: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf0744000  ! 1324: STX_R	stx	%r24, [%r17 + %r0]
cpu_intr_3_94:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb615a01b  ! 1332: OR_I	or 	%r22, 0x001b, %r27
	.word 0xb8ac4000  ! 1334: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xf0b50020  ! 1335: STHA_R	stha	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1341: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfea4c020  ! 1344: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_67:
	mov	0x17, %r14
	.word 0xf2f38e80  ! 1347: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_95:
	setx	0x250106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf8b4a038  ! 1355: STHA_I	stha	%r28, [%r18 + 0x0038] %asi
	.word 0xf4a44020  ! 1356: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xbf340000  ! 1357: SRL_R	srl 	%r16, %r0, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_3_96:
	setx	0x270133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf0b460a2  ! 1364: STHA_I	stha	%r24, [%r17 + 0x00a2] %asi
	.word 0xfa350000  ! 1365: STH_R	sth	%r29, [%r20 + %r0]
T3_asi_reg_wr_68:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 1366: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc244000  ! 1370: STW_R	stw	%r30, [%r17 + %r0]
cpu_intr_3_97:
	setx	0x29010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x280227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_69:
	mov	0x31, %r14
	.word 0xf8f389e0  ! 1377: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_99:
	setx	0x2a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8742050  ! 1385: STX_I	stx	%r28, [%r16 + 0x0050]
cpu_intr_3_100:
	setx	0x28023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a0b8  ! 1388: WRPR_TNPC_I	wrpr	%r18, 0x00b8, %tnpc
	.word 0xf2b5e11d  ! 1390: STHA_I	stha	%r25, [%r23 + 0x011d] %asi
T3_asi_reg_rd_69:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 1393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf62da16d  ! 1394: STB_I	stb	%r27, [%r22 + 0x016d]
	.word 0xf0ace164  ! 1395: STBA_I	stba	%r24, [%r19 + 0x0164] %asi
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_70:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 1397: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa25c000  ! 1398: STW_R	stw	%r29, [%r23 + %r0]
cpu_intr_3_101:
	setx	0x280213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d20a4  ! 1402: STB_I	stb	%r29, [%r20 + 0x00a4]
	.word 0xf025a1a3  ! 1405: STW_I	stw	%r24, [%r22 + 0x01a3]
	.word 0xf83520ca  ! 1406: STH_I	sth	%r28, [%r20 + 0x00ca]
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_102:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x290127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0cc000  ! 1413: AND_R	and 	%r19, %r0, %r30
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_71:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1416: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_72:
	mov	0x1e, %r14
	.word 0xf6f38e80  ! 1417: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_104:
	setx	0x2a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb03d0000  ! 1422: XNOR_R	xnor 	%r20, %r0, %r24
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_105:
	setx	0x2a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_71:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 1427: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfc35210b  ! 1430: STH_I	sth	%r30, [%r20 + 0x010b]
	.word 0xf8f5a0f6  ! 1431: STXA_I	stxa	%r28, [%r22 + 0x00f6] %asi
	.word 0xfe35c000  ! 1432: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf2b40020  ! 1434: STHA_R	stha	%r25, [%r16 + %r0] 0x01
T3_asi_reg_wr_73:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 1435: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7355000  ! 1438: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xf4740000  ! 1440: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xfeb42188  ! 1446: STHA_I	stha	%r31, [%r16 + 0x0188] %asi
T3_asi_reg_rd_72:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbe342051  ! 1452: ORN_I	orn 	%r16, 0x0051, %r31
cpu_intr_3_106:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1458: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_107:
	setx	0x2b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea421cb  ! 1469: STWA_I	stwa	%r31, [%r16 + 0x01cb] %asi
T3_asi_reg_wr_75:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 1472: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf0344000  ! 1475: STH_R	sth	%r24, [%r17 + %r0]
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_HPRIV
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_108:
	setx	0x280110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf4b5606f  ! 1497: STHA_I	stha	%r26, [%r21 + 0x006f] %asi
T3_asi_reg_rd_73:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf0f4a026  ! 1502: STXA_I	stxa	%r24, [%r18 + 0x0026] %asi
	.word 0xbabca1a6  ! 1505: XNORcc_I	xnorcc 	%r18, 0x01a6, %r29
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb2bca056  ! 1513: XNORcc_I	xnorcc 	%r18, 0x0056, %r25
	.word 0xb72cd000  ! 1516: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xb6a48000  ! 1517: SUBcc_R	subcc 	%r18, %r0, %r27
cpu_intr_3_110:
	setx	0x29022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_76:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 1525: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 1526: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf024e1f4  ! 1527: STW_I	stw	%r24, [%r19 + 0x01f4]
T3_asi_reg_rd_74:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 1529: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf82c0000  ! 1530: STB_R	stb	%r28, [%r16 + %r0]
cpu_intr_3_111:
	setx	0x28032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xb7344000  ! 1538: SRL_R	srl 	%r17, %r0, %r27
cpu_intr_3_112:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 33)
	.word 0xfeaca107  ! 1542: STBA_I	stba	%r31, [%r18 + 0x0107] %asi
	.word 0xf2754000  ! 1543: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf2a4c020  ! 1546: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xfe740000  ! 1549: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf8f4a0f1  ! 1552: STXA_I	stxa	%r28, [%r18 + 0x00f1] %asi
T3_asi_reg_rd_75:
	mov	0x4, %r14
	.word 0xf4db8400  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfca5e1b5  ! 1560: STWA_I	stwa	%r30, [%r23 + 0x01b5] %asi
	.word 0xf82dc000  ! 1561: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf434e0c9  ! 1562: STH_I	sth	%r26, [%r19 + 0x00c9]
	.word 0xf4258000  ! 1563: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf6b44020  ! 1565: STHA_R	stha	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_77:
	mov	0x34, %r14
	.word 0xf0db8400  ! 1566: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_78:
	mov	0x1, %r14
	.word 0xf2f38e60  ! 1567: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf8758000  ! 1570: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf2ac8020  ! 1575: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xfaa44020  ! 1576: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 1)
	.word 0xbe2d4000  ! 1580: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xf4acc020  ! 1581: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_113:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_79:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 1587: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa346029  ! 1591: STH_I	sth	%r29, [%r17 + 0x0029]
T3_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 1592: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbb2d6001  ! 1595: SLL_I	sll 	%r21, 0x0001, %r29
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_114:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a54020  ! 1605: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_115:
	setx	0x280300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535e001  ! 1614: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xf2b50020  ! 1615: STHA_R	stha	%r25, [%r20 + %r0] 0x01
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_116:
	setx	0x28022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_81:
	mov	0xb, %r14
	.word 0xf0f389e0  ! 1620: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_82:
	mov	0x35, %r14
	.word 0xf2f38e60  ! 1623: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb0a58000  ! 1625: SUBcc_R	subcc 	%r22, %r0, %r24
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4346014  ! 1627: STH_I	sth	%r26, [%r17 + 0x0014]
	.word 0xf4a520a2  ! 1630: STWA_I	stwa	%r26, [%r20 + 0x00a2] %asi
	.word 0xf0f52070  ! 1631: STXA_I	stxa	%r24, [%r20 + 0x0070] %asi
	.word 0xb83c21e5  ! 1635: XNOR_I	xnor 	%r16, 0x01e5, %r28
T3_asi_reg_rd_78:
	mov	0x7, %r14
	.word 0xf8db8e80  ! 1636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8a56194  ! 1637: STWA_I	stwa	%r28, [%r21 + 0x0194] %asi
cpu_intr_3_117:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 10)
	.word 0xf835c000  ! 1641: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfcb40020  ! 1642: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf0254000  ! 1646: STW_R	stw	%r24, [%r21 + %r0]
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 12)
	.word 0xfcac4020  ! 1654: STBA_R	stba	%r30, [%r17 + %r0] 0x01
cpu_intr_3_118:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_79:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe2d4000  ! 1659: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf2a4e15c  ! 1660: STWA_I	stwa	%r25, [%r19 + 0x015c] %asi
T3_asi_reg_rd_80:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 1661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_119:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 1667: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfead8020  ! 1668: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xb37cc400  ! 1669: MOVR_R	movre	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2f521ea  ! 1674: STXA_I	stxa	%r25, [%r20 + 0x01ea] %asi
T3_asi_reg_rd_81:
	mov	0x4, %r14
	.word 0xfadb8e60  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbc040000  ! 1676: ADD_R	add 	%r16, %r0, %r30
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf2a50020  ! 1681: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xbe1c8000  ! 1682: XOR_R	xor 	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_120:
	setx	0x2a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 2b)
	ta	T_CHANGE_TO_TL0
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_82:
	mov	0xf, %r14
	.word 0xfadb8e60  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 31)
	.word 0xf675a1a6  ! 1700: STX_I	stx	%r27, [%r22 + 0x01a6]
	.word 0xb425a15e  ! 1701: SUB_I	sub 	%r22, 0x015e, %r26
	.word 0xf2b50020  ! 1702: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xbd355000  ! 1703: SRLX_R	srlx	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b4e1a0  ! 1706: STHA_I	stha	%r24, [%r19 + 0x01a0] %asi
	.word 0xfab5213c  ! 1707: STHA_I	stha	%r29, [%r20 + 0x013c] %asi
	.word 0xf625e05a  ! 1708: STW_I	stw	%r27, [%r23 + 0x005a]
	.word 0xf2ac4020  ! 1709: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xb8a54000  ! 1710: SUBcc_R	subcc 	%r21, %r0, %r28
cpu_intr_3_121:
	setx	0x28003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_83:
	mov	0x1f, %r14
	.word 0xf4db8400  ! 1716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8a48020  ! 1718: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 24)
	.word 0xf22cc000  ! 1720: STB_R	stb	%r25, [%r19 + %r0]
cpu_intr_3_122:
	setx	0x28013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49d8000  ! 1723: XORcc_R	xorcc 	%r22, %r0, %r26
	.word 0xb48de16a  ! 1726: ANDcc_I	andcc 	%r23, 0x016a, %r26
	.word 0xfa2c6094  ! 1730: STB_I	stb	%r29, [%r17 + 0x0094]
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 13)
	.word 0xfaa58020  ! 1733: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xf674c000  ! 1736: STX_R	stx	%r27, [%r19 + %r0]
T3_asi_reg_rd_84:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe340000  ! 1741: STH_R	sth	%r31, [%r16 + %r0]
cpu_intr_3_123:
	setx	0x29021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_84:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 1746: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_85:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 1752: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfcf4609f  ! 1754: STXA_I	stxa	%r30, [%r17 + 0x009f] %asi
	.word 0xf4a52159  ! 1756: STWA_I	stwa	%r26, [%r20 + 0x0159] %asi
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f5a  ! 1758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
cpu_intr_3_124:
	setx	0x2a010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 13)
	.word 0xf2ac8020  ! 1764: STBA_R	stba	%r25, [%r18 + %r0] 0x01
cpu_intr_3_125:
	setx	0x2b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4a1a0  ! 1766: STWA_I	stwa	%r29, [%r18 + 0x01a0] %asi
	.word 0xf8b56122  ! 1768: STHA_I	stha	%r28, [%r21 + 0x0122] %asi
cpu_intr_3_126:
	setx	0x2b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_85:
	mov	0xe, %r14
	.word 0xf4db8e80  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfcf46161  ! 1772: STXA_I	stxa	%r30, [%r17 + 0x0161] %asi
	.word 0xb950c000  ! 1775: RDPR_TT	rdpr	%tt, %r28
	.word 0xf4a50020  ! 1776: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_127:
	setx	0x290321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_128:
	setx	0x2b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 1787: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0ad6198  ! 1792: STBA_I	stba	%r24, [%r21 + 0x0198] %asi
	.word 0xfc350000  ! 1793: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfe2c2068  ! 1794: STB_I	stb	%r31, [%r16 + 0x0068]
T3_asi_reg_wr_87:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 1795: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_129:
	setx	0x2b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_88:
	mov	0xf, %r14
	.word 0xf6f38400  ! 1805: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_87:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfc350000  ! 1810: STH_R	sth	%r30, [%r20 + %r0]
T3_asi_reg_wr_89:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1812: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4a40020  ! 1816: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf025e1ce  ! 1818: STW_I	stw	%r24, [%r23 + 0x01ce]
cpu_intr_3_130:
	setx	0x2e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x2e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_90:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 1824: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc758000  ! 1826: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_91:
	mov	0x37, %r14
	.word 0xf6f38400  ! 1827: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 22)
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b50  ! 1833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xf0a46176  ! 1834: STWA_I	stwa	%r24, [%r17 + 0x0176] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0ad0020  ! 1838: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_92:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 1839: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xba04a19f  ! 1843: ADD_I	add 	%r18, 0x019f, %r29
	.word 0xb435e0a9  ! 1844: SUBC_I	orn 	%r23, 0x00a9, %r26
	.word 0xf2248000  ! 1845: STW_R	stw	%r25, [%r18 + %r0]
T3_asi_reg_wr_93:
	mov	0x21, %r14
	.word 0xfef38e40  ! 1846: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_94:
	mov	0x17, %r14
	.word 0xf4f38400  ! 1849: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf2ad8020  ! 1850: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xb03d215a  ! 1851: XNOR_I	xnor 	%r20, 0x015a, %r24
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_95:
	mov	0x2f, %r14
	.word 0xf8f38e80  ! 1854: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfc242103  ! 1855: STW_I	stw	%r30, [%r16 + 0x0103]
	.word 0xf0258000  ! 1856: STW_R	stw	%r24, [%r22 + %r0]
T3_asi_reg_rd_88:
	mov	0x2b, %r14
	.word 0xf0db8e80  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf2354000  ! 1859: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf0752037  ! 1862: STX_I	stx	%r24, [%r20 + 0x0037]
	.word 0xfe744000  ! 1864: STX_R	stx	%r31, [%r17 + %r0]
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf8a4c020  ! 1870: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xf2f5a040  ! 1871: STXA_I	stxa	%r25, [%r22 + 0x0040] %asi
T3_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf8754000  ! 1877: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xbcb48000  ! 1880: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0xfef4e15a  ! 1883: STXA_I	stxa	%r31, [%r19 + 0x015a] %asi
cpu_intr_3_132:
	setx	0x2e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 1894: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 1896: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_97:
	mov	0x25, %r14
	.word 0xfaf384a0  ! 1897: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_98:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 1900: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_99:
	mov	0x19, %r14
	.word 0xf0f38400  ! 1903: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfead6101  ! 1905: STBA_I	stba	%r31, [%r21 + 0x0101] %asi
cpu_intr_3_133:
	setx	0x2f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02d200c  ! 1912: STB_I	stb	%r24, [%r20 + 0x000c]
T3_asi_reg_rd_91:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 1913: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_134:
	setx	0x2c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_92:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_135:
	setx	0x2c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_100:
	mov	0xa, %r14
	.word 0xf4f38e80  ! 1929: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_136:
	setx	0x2e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4611b  ! 1935: STHA_I	stha	%r29, [%r17 + 0x011b] %asi
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe248000  ! 1942: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_137:
	setx	0x2f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_101:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 1945: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf2750000  ! 1951: STX_R	stx	%r25, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_102:
	mov	0x30, %r14
	.word 0xfef389e0  ! 1955: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb49c8000  ! 1956: XORcc_R	xorcc 	%r18, %r0, %r26
cpu_intr_3_138:
	setx	0x2c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825609b  ! 1958: STW_I	stw	%r28, [%r21 + 0x009b]
	.word 0xb6acc000  ! 1960: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xfa25a1f2  ! 1964: STW_I	stw	%r29, [%r22 + 0x01f2]
	.word 0xf2adc020  ! 1965: STBA_R	stba	%r25, [%r23 + %r0] 0x01
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 28)
	.word 0xf4f42114  ! 1972: STXA_I	stxa	%r26, [%r16 + 0x0114] %asi
	.word 0xf0b46116  ! 1976: STHA_I	stha	%r24, [%r17 + 0x0116] %asi
	.word 0xfaa4e1d5  ! 1979: STWA_I	stwa	%r29, [%r19 + 0x01d5] %asi
cpu_intr_3_139:
	setx	0x2e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_103:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1983: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_93:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 32)
	.word 0xf02d4000  ! 1986: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_rd_94:
	mov	0xb, %r14
	.word 0xfedb8e40  ! 1989: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 31)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982890  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0890, %hpstate
	.word 0xf8358000  ! 2002: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf4742020  ! 2003: STX_I	stx	%r26, [%r16 + 0x0020]
	ta	T_CHANGE_TO_TL1
	.word 0xb6a58000  ! 2006: SUBcc_R	subcc 	%r22, %r0, %r27
cpu_intr_3_140:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb42ca079  ! 2015: ANDN_I	andn 	%r18, 0x0079, %r26
	.word 0xbc3d0000  ! 2016: XNOR_R	xnor 	%r20, %r0, %r30
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b00  ! 2021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b00, %hpstate
cpu_intr_3_141:
	setx	0x2f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 2023: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_142:
	setx	0x2c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_104:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 2038: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe758000  ! 2039: STX_R	stx	%r31, [%r22 + %r0]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_143:
	setx	0x2d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c61ea  ! 2042: STB_I	stb	%r29, [%r17 + 0x01ea]
	.word 0xf274e05c  ! 2044: STX_I	stx	%r25, [%r19 + 0x005c]
	.word 0xbd7cc400  ! 2048: MOVR_R	movre	%r19, %r0, %r30
	.word 0xf8b5a10b  ! 2049: STHA_I	stha	%r28, [%r22 + 0x010b] %asi
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
	.word 0xf8a40020  ! 2056: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
cpu_intr_3_144:
	setx	0x2d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa356110  ! 2060: STH_I	sth	%r29, [%r21 + 0x0110]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_105:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2065: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbf353001  ! 2067: SRLX_I	srlx	%r20, 0x0001, %r31
T3_asi_reg_wr_106:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 2068: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa354000  ! 2070: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_145:
	setx	0x2f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2acc020  ! 2075: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xf0f520e9  ! 2076: STXA_I	stxa	%r24, [%r20 + 0x00e9] %asi
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe34a19f  ! 2079: STH_I	sth	%r31, [%r18 + 0x019f]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_147:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_95:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe3da1a5  ! 2087: XNOR_I	xnor 	%r22, 0x01a5, %r31
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, a)
	.word 0xfa35a116  ! 2089: STH_I	sth	%r29, [%r22 + 0x0116]
T3_asi_reg_wr_107:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 2091: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_108:
	mov	0x15, %r14
	.word 0xf0f384a0  ! 2093: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_109:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 2095: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828ca  ! 2102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
cpu_intr_3_148:
	setx	0x2f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25a032  ! 2111: STW_I	stw	%r29, [%r22 + 0x0032]
	.word 0xf2a46138  ! 2113: STWA_I	stwa	%r25, [%r17 + 0x0138] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba358000  ! 2117: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xbf641800  ! 2118: MOVcc_R	<illegal instruction>
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f9a  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
T3_asi_reg_rd_96:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 2121: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_97:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2f5a1bc  ! 2124: STXA_I	stxa	%r25, [%r22 + 0x01bc] %asi
T3_asi_reg_wr_110:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 2126: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_150:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 10)
	.word 0xfaa50020  ! 2134: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a00  ! 2137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a00, %hpstate
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_151:
	setx	0x2d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 2142: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xfe25c000  ! 2148: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfc2421aa  ! 2149: STW_I	stw	%r30, [%r16 + 0x01aa]
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc75a0c9  ! 2153: STX_I	stx	%r30, [%r22 + 0x00c9]
T3_asi_reg_wr_111:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 2154: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_112:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 2156: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 30)
	.word 0xf4b50020  ! 2160: STHA_R	stha	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_113:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 2165: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbf518000  ! 2166: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfe742018  ! 2168: STX_I	stx	%r31, [%r16 + 0x0018]
	.word 0xb235c000  ! 2169: ORN_R	orn 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838d8  ! 2174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d8, %hpstate
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 24)
	.word 0xf2b48020  ! 2184: STHA_R	stha	%r25, [%r18 + %r0] 0x01
cpu_intr_3_152:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_154:
	setx	0x2d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_155:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_156:
	setx	0x2e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c4000  ! 2203: STB_R	stb	%r29, [%r17 + %r0]
T3_asi_reg_wr_114:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 2206: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf835a136  ! 2209: STH_I	sth	%r28, [%r22 + 0x0136]
T3_asi_reg_wr_115:
	mov	0x23, %r14
	.word 0xf0f38e60  ! 2210: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8ad8020  ! 2213: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xfe346006  ! 2214: STH_I	sth	%r31, [%r17 + 0x0006]
	.word 0xfa750000  ! 2216: STX_R	stx	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf2240000  ! 2223: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf0b5214a  ! 2224: STHA_I	stha	%r24, [%r20 + 0x014a] %asi
	.word 0xfe358000  ! 2225: STH_R	sth	%r31, [%r22 + %r0]
cpu_intr_3_157:
	setx	0x2f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_158:
	setx	0x2f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ce171  ! 2231: STB_I	stb	%r29, [%r19 + 0x0171]
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_116:
	mov	0x26, %r14
	.word 0xfaf38400  ! 2236: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf8f420ca  ! 2238: STXA_I	stxa	%r28, [%r16 + 0x00ca] %asi
cpu_intr_3_160:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_161:
	setx	0x2d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf874e10c  ! 2246: STX_I	stx	%r28, [%r19 + 0x010c]
T3_asi_reg_wr_117:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 2247: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf0354000  ! 2250: STH_R	sth	%r24, [%r21 + %r0]
cpu_intr_3_162:
	setx	0x2e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4e142  ! 2258: STWA_I	stwa	%r30, [%r19 + 0x0142] %asi
T3_asi_reg_rd_100:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 2259: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_163:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_118:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 2267: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfea54020  ! 2268: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, c)
	.word 0xf82d8000  ! 2271: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf675e1b7  ! 2273: STX_I	stx	%r27, [%r23 + 0x01b7]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_164:
	setx	0x2c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_165:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 25)
	.word 0xfa35e176  ! 2293: STH_I	sth	%r29, [%r23 + 0x0176]
	ta	T_CHANGE_TO_TL1
	.word 0xfe2c21c1  ! 2302: STB_I	stb	%r31, [%r16 + 0x01c1]
T3_asi_reg_rd_101:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_119:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 2306: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_166:
	setx	0x300038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 2315: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_102:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 2318: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfcb460b4  ! 2321: STHA_I	stha	%r30, [%r17 + 0x00b4] %asi
T3_asi_reg_rd_103:
	mov	0x2c, %r14
	.word 0xf8db89e0  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8adc020  ! 2325: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf8348000  ! 2326: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf42c201c  ! 2328: STB_I	stb	%r26, [%r16 + 0x001c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_104:
	mov	0x24, %r14
	.word 0xfcdb8400  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_105:
	mov	0x5, %r14
	.word 0xf6db8e80  ! 2333: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_167:
	setx	0x33000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfab50020  ! 2340: STHA_R	stha	%r29, [%r20 + %r0] 0x01
cpu_intr_3_168:
	setx	0x330006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x30, %r14
	.word 0xfef38400  ! 2347: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_169:
	setx	0x300306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_106:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_121:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 2355: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_122:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 2361: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf035c000  ! 2364: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_rd_107:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_123:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 2367: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_108:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_109:
	mov	0x8, %r14
	.word 0xf6db8e80  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfa2d60c6  ! 2375: STB_I	stb	%r29, [%r21 + 0x00c6]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_170:
	setx	0x320134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a58020  ! 2379: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xb0048000  ! 2384: ADD_R	add 	%r18, %r0, %r24
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 33)
	.word 0xfc25e087  ! 2388: STW_I	stw	%r30, [%r23 + 0x0087]
	.word 0xfc756015  ! 2389: STX_I	stx	%r30, [%r21 + 0x0015]
	.word 0xf6240000  ! 2392: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf0340000  ! 2393: STH_R	sth	%r24, [%r16 + %r0]
T3_asi_reg_rd_110:
	mov	0x8, %r14
	.word 0xf8db8e60  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_111:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_124:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 2396: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_171:
	setx	0x32023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_125:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 2398: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_112:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_172:
	setx	0x320236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 2409: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_126:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 2411: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 8)
	.word 0xfc244000  ! 2413: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_113:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_127:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2427: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_114:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_173:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_128:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 2433: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_174:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 2438: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xfe2c8000  ! 2441: STB_R	stb	%r31, [%r18 + %r0]
cpu_intr_3_175:
	setx	0x310301, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 2444: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_130:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 2445: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_176:
	setx	0x320135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946116  ! 2451: WRPR_TPC_I	wrpr	%r17, 0x0116, %tpc
	.word 0xfa2c6196  ! 2452: STB_I	stb	%r29, [%r17 + 0x0196]
	.word 0xb77c4400  ! 2453: MOVR_R	movre	%r17, %r0, %r27
T3_asi_reg_rd_115:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 2454: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_177:
	setx	0x330323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_131:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 2458: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2f46122  ! 2460: STXA_I	stxa	%r25, [%r17 + 0x0122] %asi
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, c)
	.word 0xfca50020  ! 2462: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, f)
	.word 0xfaa5c020  ! 2466: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf0ad6110  ! 2468: STBA_I	stba	%r24, [%r21 + 0x0110] %asi
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, a)
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_178:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac2142  ! 2478: STBA_I	stba	%r30, [%r16 + 0x0142] %asi
	.word 0xfa2d8000  ! 2483: STB_R	stb	%r29, [%r22 + %r0]
cpu_intr_3_179:
	setx	0x320316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 2487: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf8344000  ! 2488: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_132:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 2489: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_180:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2492: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_181:
	setx	0x33033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_116:
	mov	0x15, %r14
	.word 0xf6db8e80  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4244000  ! 2500: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf224c000  ! 2501: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf035209a  ! 2508: STH_I	sth	%r24, [%r20 + 0x009a]
T3_asi_reg_wr_134:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 2509: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_182:
	setx	0x31030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 2514: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5540000  ! 2516: RDPR_GL	rdpr	%-, %r26
	.word 0xf6f560f0  ! 2520: STXA_I	stxa	%r27, [%r21 + 0x00f0] %asi
	.word 0xfab54020  ! 2524: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_118:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 2527: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2350000  ! 2529: STH_R	sth	%r25, [%r20 + %r0]
cpu_intr_3_183:
	setx	0x30013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfab58020  ! 2535: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf42c6182  ! 2539: STB_I	stb	%r26, [%r17 + 0x0182]
	.word 0xfcb48020  ! 2541: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf4b48020  ! 2542: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf2ac4020  ! 2543: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xfaa5e0d1  ! 2544: STWA_I	stwa	%r29, [%r23 + 0x00d1] %asi
	.word 0xf0b54020  ! 2549: STHA_R	stha	%r24, [%r21 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 30)
	.word 0xb62c4000  ! 2553: ANDN_R	andn 	%r17, %r0, %r27
cpu_intr_3_184:
	setx	0x330005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc344000  ! 2556: STH_R	sth	%r30, [%r17 + %r0]
T3_asi_reg_wr_136:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 2557: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0b48020  ! 2558: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_wr_137:
	mov	0x1c, %r14
	.word 0xf6f38e80  ! 2562: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, d)
	.word 0xfaace00d  ! 2565: STBA_I	stba	%r29, [%r19 + 0x000d] %asi
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_185:
	setx	0x31012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_120:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf825c000  ! 2572: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf2ad219e  ! 2573: STBA_I	stba	%r25, [%r20 + 0x019e] %asi
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 0)
	.word 0xfc2d20f7  ! 2577: STB_I	stb	%r30, [%r20 + 0x00f7]
T3_asi_reg_rd_121:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf024e104  ! 2582: STW_I	stw	%r24, [%r19 + 0x0104]
T3_asi_reg_wr_138:
	mov	0xa, %r14
	.word 0xf0f38e60  ! 2583: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe248000  ! 2588: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_186:
	setx	0x310203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_187:
	setx	0x310321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034a18a  ! 2607: ORN_I	orn 	%r18, 0x018a, %r24
cpu_intr_3_188:
	setx	0x33022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de0e0  ! 2611: AND_I	and 	%r23, 0x00e0, %r26
cpu_intr_3_189:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4aca1bb  ! 2615: STBA_I	stba	%r26, [%r18 + 0x01bb] %asi
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, d)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_190:
	setx	0x330201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2631: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, f)
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_191:
	setx	0x310111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_192:
	setx	0x300318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe254000  ! 2643: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xba35a18c  ! 2645: SUBC_I	orn 	%r22, 0x018c, %r29
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_HPRIV
	.word 0xb0946065  ! 2651: ORcc_I	orcc 	%r17, 0x0065, %r24
	.word 0xfea54020  ! 2656: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
T3_asi_reg_wr_140:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 2657: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb0c521aa  ! 2658: ADDCcc_I	addccc 	%r20, 0x01aa, %r24
	.word 0xfa748000  ! 2662: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xfc3560f5  ! 2663: STH_I	sth	%r30, [%r21 + 0x00f5]
	.word 0xfa740000  ! 2665: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_rd_122:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe2cc000  ! 2668: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf6f421a4  ! 2672: STXA_I	stxa	%r27, [%r16 + 0x01a4] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_193:
	setx	0x31012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a030  ! 2677: STH_I	sth	%r31, [%r18 + 0x0030]
cpu_intr_3_194:
	setx	0x310205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba352014  ! 2683: SUBC_I	orn 	%r20, 0x0014, %r29
T3_asi_reg_wr_141:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 2684: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0ada1a3  ! 2685: STBA_I	stba	%r24, [%r22 + 0x01a3] %asi
cpu_intr_3_195:
	setx	0x310310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5a16d  ! 2693: STXA_I	stxa	%r25, [%r22 + 0x016d] %asi
T3_asi_reg_rd_123:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 2696: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf2b46118  ! 2697: STHA_I	stha	%r25, [%r17 + 0x0118] %asi
cpu_intr_3_196:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 14)
	.word 0xf674e0d6  ! 2707: STX_I	stx	%r27, [%r19 + 0x00d6]
	.word 0xb2346058  ! 2709: ORN_I	orn 	%r17, 0x0058, %r25
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_124:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_197:
	setx	0x330132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_198:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 22)
	.word 0xb8b42063  ! 2724: ORNcc_I	orncc 	%r16, 0x0063, %r28
	.word 0xf6258000  ! 2725: STW_R	stw	%r27, [%r22 + %r0]
cpu_intr_3_199:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a56025  ! 2728: STWA_I	stwa	%r26, [%r21 + 0x0025] %asi
T3_asi_reg_rd_125:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_200:
	setx	0x33013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b52174  ! 2735: ORNcc_I	orncc 	%r20, 0x0174, %r28
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, b)
	.word 0xb33da001  ! 2737: SRA_I	sra 	%r22, 0x0001, %r25
	.word 0xf6b52097  ! 2738: STHA_I	stha	%r27, [%r20 + 0x0097] %asi
	.word 0xbebde0c5  ! 2739: XNORcc_I	xnorcc 	%r23, 0x00c5, %r31
	.word 0xfa354000  ! 2741: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xfeb5a0de  ! 2742: STHA_I	stha	%r31, [%r22 + 0x00de] %asi
	.word 0xfca421d6  ! 2743: STWA_I	stwa	%r30, [%r16 + 0x01d6] %asi
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_201:
	setx	0x350129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88560a4  ! 2751: ADDcc_I	addcc 	%r21, 0x00a4, %r28
cpu_intr_3_202:
	setx	0x350127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf8754000  ! 2759: STX_R	stx	%r28, [%r21 + %r0]
T3_asi_reg_wr_142:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 2760: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 24)
	.word 0xf635c000  ! 2762: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0a58020  ! 2765: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	.word 0xfa342129  ! 2766: STH_I	sth	%r29, [%r16 + 0x0129]
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0742043  ! 2775: STX_I	stx	%r24, [%r16 + 0x0043]
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbcc44000  ! 2777: ADDCcc_R	addccc 	%r17, %r0, %r30
cpu_intr_3_203:
	setx	0x35033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2454000  ! 2779: ADDC_R	addc 	%r21, %r0, %r25
cpu_intr_3_204:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 30)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cd2  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd2, %hpstate
	.word 0xb60c0000  ! 2784: AND_R	and 	%r16, %r0, %r27
T3_asi_reg_rd_126:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_3_205:
	setx	0x350226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4e194  ! 2795: STWA_I	stwa	%r26, [%r19 + 0x0194] %asi
	.word 0xf6ac8020  ! 2796: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xfc754000  ! 2797: STX_R	stx	%r30, [%r21 + %r0]
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_206:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe456137  ! 2803: ADDC_I	addc 	%r21, 0x0137, %r31
T3_asi_reg_rd_127:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xba1c8000  ! 2806: XOR_R	xor 	%r18, %r0, %r29
cpu_intr_3_207:
	setx	0x35030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 2808: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf6358000  ! 2811: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf82dc000  ! 2812: STB_R	stb	%r28, [%r23 + %r0]
T3_asi_reg_rd_128:
	mov	0x3, %r14
	.word 0xf6db89e0  ! 2813: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf834c000  ! 2814: STH_R	sth	%r28, [%r19 + %r0]
cpu_intr_3_208:
	setx	0x35011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_209:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_210:
	setx	0x36011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d8000  ! 2820: XOR_R	xor 	%r22, %r0, %r27
	.word 0xf4a40020  ! 2823: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
cpu_intr_3_211:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x2d, %r14
	.word 0xf0f389e0  ! 2825: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf424c000  ! 2826: STW_R	stw	%r26, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2828: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_212:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_213:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 2835: STB_R	stb	%r26, [%r16 + %r0]
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb2bce12e  ! 2838: XNORcc_I	xnorcc 	%r19, 0x012e, %r25
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 30)
	.word 0xfca4c020  ! 2841: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
cpu_intr_3_214:
	setx	0x350028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x15, %r14
	.word 0xfedb8400  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_215:
	setx	0x350216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e10b  ! 2851: STHA_I	stha	%r27, [%r23 + 0x010b] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_216:
	setx	0x36022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfeb52170  ! 2859: STHA_I	stha	%r31, [%r20 + 0x0170] %asi
cpu_intr_3_217:
	setx	0x35022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 2863: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf434e0f0  ! 2864: STH_I	sth	%r26, [%r19 + 0x00f0]
	.word 0xfea5e174  ! 2865: STWA_I	stwa	%r31, [%r23 + 0x0174] %asi
	.word 0xba040000  ! 2867: ADD_R	add 	%r16, %r0, %r29
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 13)
	.word 0xf47561cf  ! 2869: STX_I	stx	%r26, [%r21 + 0x01cf]
T3_asi_reg_wr_145:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 2870: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_146:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 2871: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_130:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_TO_TL0
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_218:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_219:
	setx	0x34000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4a0e5  ! 2887: STXA_I	stxa	%r31, [%r18 + 0x00e5] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_220:
	setx	0x350123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_132:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_221:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_222:
	setx	0x350203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab460e9  ! 2908: ORNcc_I	orncc 	%r17, 0x00e9, %r29
	.word 0xfa744000  ! 2909: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_rd_133:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x9194a0be  ! 2913: WRPR_PIL_I	wrpr	%r18, 0x00be, %pil
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_223:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_135:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf6348000  ! 2920: STH_R	sth	%r27, [%r18 + %r0]
T3_asi_reg_rd_136:
	mov	0x8, %r14
	.word 0xf2db89e0  ! 2922: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_147:
	mov	0x1a, %r14
	.word 0xfef389e0  ! 2923: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_148:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 2924: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf82d0000  ! 2926: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xfc346108  ! 2928: STH_I	sth	%r30, [%r17 + 0x0108]
T3_asi_reg_wr_149:
	mov	0x11, %r14
	.word 0xfef389e0  ! 2929: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_137:
	mov	0x28, %r14
	.word 0xf0db89e0  ! 2932: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_224:
	setx	0x35001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_150:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 2936: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_225:
	setx	0x350103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_151:
	mov	0x13, %r14
	.word 0xf8f38400  ! 2939: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf6254000  ! 2941: STW_R	stw	%r27, [%r21 + %r0]
T3_asi_reg_rd_138:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 2942: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_226:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x340322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_139:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 2948: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf82de19f  ! 2949: STB_I	stb	%r28, [%r23 + 0x019f]
	.word 0xfa75e1ba  ! 2950: STX_I	stx	%r29, [%r23 + 0x01ba]
	.word 0xbead2015  ! 2951: ANDNcc_I	andncc 	%r20, 0x0015, %r31
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, c)
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e92  ! 2956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e92, %hpstate
	.word 0xfaade14c  ! 2957: STBA_I	stba	%r29, [%r23 + 0x014c] %asi
T3_asi_reg_wr_153:
	mov	0x19, %r14
	.word 0xf4f38400  ! 2959: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf82de015  ! 2961: STB_I	stb	%r28, [%r23 + 0x0015]
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa2de010  ! 2963: STB_I	stb	%r29, [%r23 + 0x0010]
	.word 0xf024c000  ! 2965: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 38)
	.word 0x8195a017  ! 2967: WRPR_TPC_I	wrpr	%r22, 0x0017, %tpc
	.word 0xf0354000  ! 2970: STH_R	sth	%r24, [%r21 + %r0]
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983940  ! 2971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1940, %hpstate
T3_asi_reg_rd_140:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 2a)
	.word 0x81942019  ! 2974: WRPR_TPC_I	wrpr	%r16, 0x0019, %tpc
	.word 0xf0b5c020  ! 2976: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf6aca14a  ! 2977: STBA_I	stba	%r27, [%r18 + 0x014a] %asi
	.word 0xf8240000  ! 2978: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfe2d20ab  ! 2980: STB_I	stb	%r31, [%r20 + 0x00ab]
T3_asi_reg_rd_141:
	mov	0x18, %r14
	.word 0xf2db89e0  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 25)
	.word 0xf0350000  ! 2996: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf6b4e1ac  ! 2999: STHA_I	stha	%r27, [%r19 + 0x01ac] %asi
	.word 0xfcb4c020  ! 3000: STHA_R	stha	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf8f4e16e  ! 3002: STXA_I	stxa	%r28, [%r19 + 0x016e] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_154:
	mov	0x0, %r14
	.word 0xfef38e60  ! 3007: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf8748000  ! 3008: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf2ad2149  ! 3009: STBA_I	stba	%r25, [%r20 + 0x0149] %asi
	.word 0xf0b521f6  ! 3010: STHA_I	stha	%r24, [%r20 + 0x01f6] %asi
	.word 0xb89da1a3  ! 3011: XORcc_I	xorcc 	%r22, 0x01a3, %r28
T3_asi_reg_wr_155:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 3013: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc346061  ! 3014: STH_I	sth	%r30, [%r17 + 0x0061]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 16)
	.word 0xb40c0000  ! 3017: AND_R	and 	%r16, %r0, %r26
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_143:
	mov	0x25, %r14
	.word 0xf6db89e0  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_156:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3028: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_228:
	setx	0x36030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_229:
	setx	0x350100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0x85946126  ! 3033: WRPR_TSTATE_I	wrpr	%r17, 0x0126, %tstate
	.word 0xf0f461da  ! 3035: STXA_I	stxa	%r24, [%r17 + 0x01da] %asi
	.word 0xf6a4a13b  ! 3036: STWA_I	stwa	%r27, [%r18 + 0x013b] %asi
	.word 0xf2ad6127  ! 3037: STBA_I	stba	%r25, [%r21 + 0x0127] %asi
	.word 0xfc25a0bb  ! 3042: STW_I	stw	%r30, [%r22 + 0x00bb]
cpu_intr_3_230:
	setx	0x34002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_144:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_wr_157:
	mov	0x36, %r14
	.word 0xf2f389e0  ! 3051: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbe8d0000  ! 3052: ANDcc_R	andcc 	%r20, %r0, %r31
cpu_intr_3_231:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5205c  ! 3055: STXA_I	stxa	%r25, [%r20 + 0x005c] %asi
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 3)
	.word 0xb0958000  ! 3059: ORcc_R	orcc 	%r22, %r0, %r24
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983dd2  ! 3061: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
	.word 0x89952024  ! 3063: WRPR_TICK_I	wrpr	%r20, 0x0024, %tick
	.word 0xfa2ca17a  ! 3064: STB_I	stb	%r29, [%r18 + 0x017a]
cpu_intr_3_232:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c0000  ! 3070: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf8b460d7  ! 3075: STHA_I	stha	%r28, [%r17 + 0x00d7] %asi
	.word 0xb2a4c000  ! 3077: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xb1641800  ! 3078: MOVcc_R	<illegal instruction>
cpu_intr_3_233:
	setx	0x360337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 11)
	.word 0xb83d4000  ! 3082: XNOR_R	xnor 	%r21, %r0, %r28
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfa25a01e  ! 3084: STW_I	stw	%r29, [%r22 + 0x001e]
	.word 0xf8350000  ! 3090: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 3091: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbe144000  ! 3095: OR_R	or 	%r17, %r0, %r31
	.word 0xb934f001  ! 3096: SRLX_I	srlx	%r19, 0x0001, %r28
cpu_intr_3_234:
	setx	0x370306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb44000  ! 3103: ORNcc_R	orncc 	%r17, %r0, %r30
T3_asi_reg_rd_145:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc2461bb  ! 3110: STW_I	stw	%r30, [%r17 + 0x01bb]
	.word 0xf2f461d5  ! 3112: STXA_I	stxa	%r25, [%r17 + 0x01d5] %asi
	.word 0xf0a5a112  ! 3113: STWA_I	stwa	%r24, [%r22 + 0x0112] %asi
cpu_intr_3_236:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2340000  ! 3116: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xbcbde0ac  ! 3117: XNORcc_I	xnorcc 	%r23, 0x00ac, %r30
	.word 0xb89c2085  ! 3119: XORcc_I	xorcc 	%r16, 0x0085, %r28
	.word 0xfeb58020  ! 3120: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xfcb40020  ! 3124: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xfc34207f  ! 3126: STH_I	sth	%r30, [%r16 + 0x007f]
T3_asi_reg_wr_159:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 3130: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf024e17f  ! 3135: STW_I	stw	%r24, [%r19 + 0x017f]
	.word 0xfca58020  ! 3136: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfa2c2064  ! 3138: STB_I	stb	%r29, [%r16 + 0x0064]
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 22)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ec0  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_146:
	mov	0x2b, %r14
	.word 0xfadb8400  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfa2c8000  ! 3148: STB_R	stb	%r29, [%r18 + %r0]
T3_asi_reg_wr_160:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 3149: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb6142041  ! 3151: OR_I	or 	%r16, 0x0041, %r27
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 38)
	.word 0x8f902000  ! 3156: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T3_asi_reg_wr_161:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3157: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb32c9000  ! 3158: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xfa34a128  ! 3160: STH_I	sth	%r29, [%r18 + 0x0128]
T3_asi_reg_rd_147:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 3161: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0x8994214f  ! 3164: WRPR_TICK_I	wrpr	%r16, 0x014f, %tick
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 26)
	.word 0xf0752100  ! 3166: STX_I	stx	%r24, [%r20 + 0x0100]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0b520d4  ! 3170: STHA_I	stha	%r24, [%r20 + 0x00d4] %asi
T3_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 3173: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfeb5e009  ! 3174: STHA_I	stha	%r31, [%r23 + 0x0009] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, b)
	.word 0xfca4e135  ! 3178: STWA_I	stwa	%r30, [%r19 + 0x0135] %asi
	.word 0xf6252066  ! 3179: STW_I	stw	%r27, [%r20 + 0x0066]
	.word 0xf22d0000  ! 3182: STB_R	stb	%r25, [%r20 + %r0]
T3_asi_reg_wr_163:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 3183: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_237:
	setx	0x36022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 3189: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbe35204c  ! 3190: ORN_I	orn 	%r20, 0x004c, %r31
	.word 0xf0254000  ! 3195: STW_R	stw	%r24, [%r21 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfcac61c0  ! 3199: STBA_I	stba	%r30, [%r17 + 0x01c0] %asi
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_238:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 3205: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf42ce042  ! 3208: STB_I	stb	%r26, [%r19 + 0x0042]
T3_asi_reg_rd_148:
	mov	0x0, %r14
	.word 0xfadb8400  ! 3210: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe34c000  ! 3211: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe34e1bf  ! 3218: STH_I	sth	%r31, [%r19 + 0x01bf]
T3_asi_reg_rd_149:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_165:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 3223: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf834a116  ! 3224: STH_I	sth	%r28, [%r18 + 0x0116]
T3_asi_reg_rd_150:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_166:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3232: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_167:
	mov	0x36, %r14
	.word 0xfcf384a0  ! 3245: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb8ac21c9  ! 3246: ANDNcc_I	andncc 	%r16, 0x01c9, %r28
	.word 0xbc440000  ! 3247: ADDC_R	addc 	%r16, %r0, %r30
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4a4203e  ! 3249: STWA_I	stwa	%r26, [%r16 + 0x003e] %asi
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, f)
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_239:
	setx	0x3a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_168:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 3266: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_240:
	setx	0x380107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, d)
	.word 0xf22560a3  ! 3270: STW_I	stw	%r25, [%r21 + 0x00a3]
cpu_intr_3_241:
	setx	0x3b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0ad0020  ! 3277: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xf62c0000  ! 3278: STB_R	stb	%r27, [%r16 + %r0]
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe258000  ! 3285: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf2342084  ! 3286: STH_I	sth	%r25, [%r16 + 0x0084]
	.word 0xfa35c000  ! 3287: STH_R	sth	%r29, [%r23 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_242:
	setx	0x380103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2560e0  ! 3291: STW_I	stw	%r31, [%r21 + 0x00e0]
	.word 0xf6750000  ! 3292: STX_R	stx	%r27, [%r20 + %r0]
cpu_intr_3_243:
	setx	0x3b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c82  ! 3294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	.word 0xf8ad2014  ! 3299: STBA_I	stba	%r28, [%r20 + 0x0014] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_244:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 3310: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4adc020  ! 3312: STBA_R	stba	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_169:
	mov	0x1e, %r14
	.word 0xfaf384a0  ! 3314: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_151:
	mov	0x2b, %r14
	.word 0xf4db84a0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_170:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3328: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb69c8000  ! 3329: XORcc_R	xorcc 	%r18, %r0, %r27
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfa7521a9  ! 3331: STX_I	stx	%r29, [%r20 + 0x01a9]
	.word 0xb6448000  ! 3332: ADDC_R	addc 	%r18, %r0, %r27
	.word 0xf475614b  ! 3333: STX_I	stx	%r26, [%r21 + 0x014b]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_171:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3336: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2758000  ! 3337: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_245:
	setx	0x390037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d4000  ! 3348: SRA_R	sra 	%r21, %r0, %r24
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_153:
	mov	0x11, %r14
	.word 0xf2db8e60  ! 3351: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_154:
	mov	0x16, %r14
	.word 0xfedb8400  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfe2d4000  ! 3354: STB_R	stb	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_246:
	setx	0x3a001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_172:
	mov	0x4, %r14
	.word 0xf2f38400  ! 3364: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02560ad  ! 3366: STW_I	stw	%r24, [%r21 + 0x00ad]
cpu_intr_3_247:
	setx	0x390337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c2141  ! 3369: STB_I	stb	%r24, [%r16 + 0x0141]
cpu_intr_3_248:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x380033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_250:
	setx	0x3b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_251:
	setx	0x38012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca56007  ! 3385: STWA_I	stwa	%r30, [%r21 + 0x0007] %asi
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_252:
	setx	0x3a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_155:
	mov	0x27, %r14
	.word 0xf8db8400  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfef5e067  ! 3394: STXA_I	stxa	%r31, [%r23 + 0x0067] %asi
	.word 0xb0b58000  ! 3395: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xb61560f4  ! 3396: OR_I	or 	%r21, 0x00f4, %r27
	.word 0xf6350000  ! 3398: STH_R	sth	%r27, [%r20 + %r0]
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 5)
	.word 0xf22ce0ed  ! 3403: STB_I	stb	%r25, [%r19 + 0x00ed]
	.word 0xfcac60de  ! 3404: STBA_I	stba	%r30, [%r17 + 0x00de] %asi
	.word 0xbd35b001  ! 3405: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xba8c0000  ! 3412: ANDcc_R	andcc 	%r16, %r0, %r29
	.word 0xf4a44020  ! 3414: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xf07561b3  ! 3416: STX_I	stx	%r24, [%r21 + 0x01b3]
	ta	T_CHANGE_TO_TL0
	.word 0xf635e107  ! 3418: STH_I	sth	%r27, [%r23 + 0x0107]
cpu_intr_3_253:
	setx	0x3a0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb5508000  ! 3422: RDPR_TSTATE	rdpr	%tstate, %r26
cpu_intr_3_254:
	setx	0x380317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_173:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3430: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a4a0f6  ! 3432: SUBcc_I	subcc 	%r18, 0x00f6, %r27
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 32)
	.word 0xfaad205e  ! 3438: STBA_I	stba	%r29, [%r20 + 0x005e] %asi
T3_asi_reg_rd_156:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_174:
	mov	0x8, %r14
	.word 0xf6f384a0  ! 3441: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_255:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_157:
	mov	0xe, %r14
	.word 0xfcdb89e0  ! 3446: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_256:
	setx	0x3b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474a031  ! 3450: STX_I	stx	%r26, [%r18 + 0x0031]
	.word 0xf4348000  ! 3452: STH_R	sth	%r26, [%r18 + %r0]
T3_asi_reg_rd_158:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_159:
	mov	0x9, %r14
	.word 0xfadb8e60  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf82c2041  ! 3456: STB_I	stb	%r28, [%r16 + 0x0041]
	.word 0xfe2c4000  ! 3458: STB_R	stb	%r31, [%r17 + %r0]
cpu_intr_3_257:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 3467: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfa2ca11d  ! 3468: STB_I	stb	%r29, [%r18 + 0x011d]
	.word 0xf6b561aa  ! 3471: STHA_I	stha	%r27, [%r21 + 0x01aa] %asi
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e42  ! 3474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
cpu_intr_3_258:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295c000  ! 3479: ORcc_R	orcc 	%r23, %r0, %r25
T3_asi_reg_rd_160:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0244000  ! 3481: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xfaa44020  ! 3483: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_rd_161:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf2b4a1ce  ! 3488: STHA_I	stha	%r25, [%r18 + 0x01ce] %asi
	.word 0xf2f42184  ! 3489: STXA_I	stxa	%r25, [%r16 + 0x0184] %asi
	.word 0xf2f52057  ! 3491: STXA_I	stxa	%r25, [%r20 + 0x0057] %asi
	.word 0xb0048000  ! 3497: ADD_R	add 	%r18, %r0, %r24
T3_asi_reg_wr_175:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 3498: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf6754000  ! 3499: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf2b4c020  ! 3501: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfca5e19b  ! 3508: STWA_I	stwa	%r30, [%r23 + 0x019b] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_176:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 3510: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf07421e3  ! 3514: STX_I	stx	%r24, [%r16 + 0x01e3]
	.word 0xfa2c8000  ! 3515: STB_R	stb	%r29, [%r18 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_259:
	setx	0x3a0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_260:
	setx	0x3a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_177:
	mov	0x31, %r14
	.word 0xf6f38400  ! 3521: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbb2c4000  ! 3523: SLL_R	sll 	%r17, %r0, %r29
T3_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 3531: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xf4ac8020  ! 3536: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xbca44000  ! 3539: SUBcc_R	subcc 	%r17, %r0, %r30
cpu_intr_3_261:
	setx	0x3a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 3548: STW_R	stw	%r30, [%r21 + %r0]
cpu_intr_3_264:
	setx	0x380323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b420b8  ! 3550: STHA_I	stha	%r24, [%r16 + 0x00b8] %asi
	.word 0xf43520e8  ! 3553: STH_I	sth	%r26, [%r20 + 0x00e8]
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b9a  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9a, %hpstate
T3_asi_reg_rd_163:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_265:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_266:
	setx	0x390238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_267:
	setx	0x3b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x3a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_270:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 3570: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_271:
	setx	0x380108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_272:
	setx	0x3b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d212d  ! 3586: STB_I	stb	%r24, [%r20 + 0x012d]
	.word 0xfa34a131  ! 3587: STH_I	sth	%r29, [%r18 + 0x0131]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf6b460cc  ! 3594: STHA_I	stha	%r27, [%r17 + 0x00cc] %asi
	.word 0xf8ad60e0  ! 3598: STBA_I	stba	%r28, [%r21 + 0x00e0] %asi
	.word 0xfa74c000  ! 3600: STX_R	stx	%r29, [%r19 + %r0]
cpu_intr_3_273:
	setx	0x390317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_274:
	setx	0x3a0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca420c8  ! 3614: STWA_I	stwa	%r30, [%r16 + 0x00c8] %asi
	.word 0xfe35a1a6  ! 3615: STH_I	sth	%r31, [%r22 + 0x01a6]
cpu_intr_3_275:
	setx	0x3b032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa342023  ! 3621: STH_I	sth	%r29, [%r16 + 0x0023]
	.word 0xb8a5c000  ! 3622: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xfc34a0c2  ! 3623: STH_I	sth	%r30, [%r18 + 0x00c2]
cpu_intr_3_276:
	setx	0x3a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5c020  ! 3628: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xf8a46182  ! 3630: STWA_I	stwa	%r28, [%r17 + 0x0182] %asi
T3_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 3633: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfca5e008  ! 3637: STWA_I	stwa	%r30, [%r23 + 0x0008] %asi
	.word 0xb0944000  ! 3638: ORcc_R	orcc 	%r17, %r0, %r24
T3_asi_reg_wr_181:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 3640: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, d)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, b)
	.word 0xf0ac0020  ! 3646: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xf42c202f  ! 3648: STB_I	stb	%r26, [%r16 + 0x002f]
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e00  ! 3649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e00, %hpstate
T3_asi_reg_wr_182:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 3651: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_277:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 3653: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xfaa40020  ! 3654: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xfcad0020  ! 3655: STBA_R	stba	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_183:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 3656: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 20)
	.word 0xfca40020  ! 3659: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_166:
	mov	0x1e, %r14
	.word 0xf2db8e60  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_167:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 3662: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf02de029  ! 3663: STB_I	stb	%r24, [%r23 + 0x0029]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983812  ! 3668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
T3_asi_reg_rd_168:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_278:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2352057  ! 3682: STH_I	sth	%r25, [%r20 + 0x0057]
T3_asi_reg_wr_184:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 3684: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb0b4e1e0  ! 3688: ORNcc_I	orncc 	%r19, 0x01e0, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_185:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 3691: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf07561d4  ! 3692: STX_I	stx	%r24, [%r21 + 0x01d4]
	.word 0xb44560a8  ! 3693: ADDC_I	addc 	%r21, 0x00a8, %r26
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 34)
	.word 0xf8ad8020  ! 3697: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_279:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694a11b  ! 3705: ORcc_I	orcc 	%r18, 0x011b, %r27
T3_asi_reg_wr_186:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3714: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_187:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3715: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf4f520f9  ! 3716: STXA_I	stxa	%r26, [%r20 + 0x00f9] %asi
	.word 0xbc3dc000  ! 3717: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xf62c0000  ! 3721: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_wr_188:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 3722: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfaf460c4  ! 3733: STXA_I	stxa	%r29, [%r17 + 0x00c4] %asi
	.word 0xfc35607f  ! 3734: STH_I	sth	%r30, [%r21 + 0x007f]
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 1)
	.word 0xf424c000  ! 3738: STW_R	stw	%r26, [%r19 + %r0]
T3_asi_reg_rd_169:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_189:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 3750: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8a54020  ! 3751: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982848  ! 3752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_170:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf874c000  ! 3755: STX_R	stx	%r28, [%r19 + %r0]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_190:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 3757: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_171:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_191:
	mov	0x31, %r14
	.word 0xf6f389e0  ! 3762: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf6b560ea  ! 3763: STHA_I	stha	%r27, [%r21 + 0x00ea] %asi
cpu_intr_3_280:
	setx	0x3f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5614a  ! 3766: STWA_I	stwa	%r24, [%r21 + 0x014a] %asi
	.word 0xf0a58020  ! 3767: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 16)
	.word 0xf4240000  ! 3772: STW_R	stw	%r26, [%r16 + %r0]
T3_asi_reg_rd_172:
	mov	0x1a, %r14
	.word 0xf0db8400  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe0d0000  ! 3778: AND_R	and 	%r20, %r0, %r31
T3_asi_reg_wr_192:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3781: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf875c000  ! 3783: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb285e15b  ! 3785: ADDcc_I	addcc 	%r23, 0x015b, %r25
T3_asi_reg_rd_173:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_281:
	setx	0x3d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_282:
	setx	0x3e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 39)
	.word 0xba8c214e  ! 3801: ANDcc_I	andcc 	%r16, 0x014e, %r29
cpu_intr_3_283:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e079  ! 3806: STW_I	stw	%r30, [%r23 + 0x0079]
	.word 0xfa2dc000  ! 3808: STB_R	stb	%r29, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf82d4000  ! 3818: STB_R	stb	%r28, [%r21 + %r0]
T3_asi_reg_wr_193:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 3819: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_174:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 3820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0a40020  ! 3823: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xfeb44020  ! 3829: STHA_R	stha	%r31, [%r17 + %r0] 0x01
cpu_intr_3_284:
	setx	0x3c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead8020  ! 3831: STBA_R	stba	%r31, [%r22 + %r0] 0x01
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 34)
	.word 0xf23460f2  ! 3834: STH_I	sth	%r25, [%r17 + 0x00f2]
cpu_intr_3_285:
	setx	0x3f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_175:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_176:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 3838: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_286:
	setx	0x3c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c7001  ! 3843: SLLX_I	sllx	%r17, 0x0001, %r25
	.word 0xbc150000  ! 3844: OR_R	or 	%r20, %r0, %r30
T3_asi_reg_rd_177:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc75e06b  ! 3847: STX_I	stx	%r30, [%r23 + 0x006b]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf0a521e0  ! 3850: STWA_I	stwa	%r24, [%r20 + 0x01e0] %asi
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_287:
	setx	0x3d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_194:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 3854: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_195:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 3855: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf4a5a0a9  ! 3856: STWA_I	stwa	%r26, [%r22 + 0x00a9] %asi
cpu_intr_3_288:
	setx	0x3d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_178:
	mov	0x36, %r14
	.word 0xfcdb8e60  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 15)
	.word 0xf6b421fd  ! 3868: STHA_I	stha	%r27, [%r16 + 0x01fd] %asi
cpu_intr_3_289:
	setx	0x3c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc61b0  ! 3876: XNORcc_I	xnorcc 	%r17, 0x01b0, %r27
T3_asi_reg_wr_196:
	mov	0x32, %r14
	.word 0xf4f38e60  ! 3877: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf224e14b  ! 3878: STW_I	stw	%r25, [%r19 + 0x014b]
	.word 0xf474c000  ! 3879: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf82c0000  ! 3881: STB_R	stb	%r28, [%r16 + %r0]
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 33)
	.word 0xf0a58020  ! 3883: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, e)
	.word 0xf675216e  ! 3886: STX_I	stx	%r27, [%r20 + 0x016e]
cpu_intr_3_290:
	setx	0x3c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d0000  ! 3888: AND_R	and 	%r20, %r0, %r30
T3_asi_reg_wr_197:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 3889: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe254000  ! 3891: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf8b4600b  ! 3892: STHA_I	stha	%r28, [%r17 + 0x000b] %asi
T3_asi_reg_wr_198:
	mov	0x15, %r14
	.word 0xfaf38e40  ! 3894: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_291:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6a521f4  ! 3906: STWA_I	stwa	%r27, [%r20 + 0x01f4] %asi
	.word 0xb8c5e093  ! 3908: ADDCcc_I	addccc 	%r23, 0x0093, %r28
	.word 0xfaac6187  ! 3909: STBA_I	stba	%r29, [%r17 + 0x0187] %asi
	.word 0xfc2d60be  ! 3916: STB_I	stb	%r30, [%r21 + 0x00be]
T3_asi_reg_rd_179:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_199:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 3921: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_292:
	setx	0x3f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12de001  ! 3927: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xb7340000  ! 3932: SRL_R	srl 	%r16, %r0, %r27
cpu_intr_3_293:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 3938: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xb434a114  ! 3943: ORN_I	orn 	%r18, 0x0114, %r26
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cc0  ! 3944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_294:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4a1ab  ! 3948: STWA_I	stwa	%r31, [%r18 + 0x01ab] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 4)
	.word 0xfca4c020  ! 3951: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_200:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 3955: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	.word 0xfab5c020  ! 3958: STHA_R	stha	%r29, [%r23 + %r0] 0x01
T3_asi_reg_rd_180:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_295:
	setx	0x3f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 3964: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6342125  ! 3966: STH_I	sth	%r27, [%r16 + 0x0125]
	.word 0xf22ca00e  ! 3967: STB_I	stb	%r25, [%r18 + 0x000e]
	.word 0x8594e1dd  ! 3968: WRPR_TSTATE_I	wrpr	%r19, 0x01dd, %tstate
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_296:
	setx	0x3c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe242140  ! 3973: STW_I	stw	%r31, [%r16 + 0x0140]
	.word 0xf8a40020  ! 3974: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf2a52015  ! 3975: STWA_I	stwa	%r25, [%r20 + 0x0015] %asi
T3_asi_reg_rd_181:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_297:
	setx	0x3f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_299:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_202:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 3983: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_300:
	setx	0x3c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 3990: STW_R	stw	%r24, [%r22 + %r0]
T3_asi_reg_wr_203:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3992: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4240000  ! 3993: STW_R	stw	%r26, [%r16 + %r0]
T3_asi_reg_wr_204:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 3994: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_302:
	setx	0x3c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4b561d4  ! 3997: STHA_I	stha	%r26, [%r21 + 0x01d4] %asi
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_183:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d40  ! 4002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_205:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 4004: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_303:
	setx	0x3f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d615b  ! 4006: STB_I	stb	%r29, [%r21 + 0x015b]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_304:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_206:
	mov	0x15, %r14
	.word 0xf8f384a0  ! 4010: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf435c000  ! 4013: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xb77d4400  ! 4014: MOVR_R	movre	%r21, %r0, %r27
	.word 0xbb480000  ! 4016: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198281a  ! 4018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081a, %hpstate
T3_asi_reg_rd_184:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 4019: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 34)
	.word 0xfcac21b6  ! 4021: STBA_I	stba	%r30, [%r16 + 0x01b6] %asi
	.word 0xfa254000  ! 4022: STW_R	stw	%r29, [%r21 + %r0]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe250000  ! 4024: STW_R	stw	%r31, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_185:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc740000  ! 4030: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_wr_207:
	mov	0x31, %r14
	.word 0xf6f38e80  ! 4031: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8acc020  ! 4032: STBA_R	stba	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_186:
	mov	0x1c, %r14
	.word 0xf6db84a0  ! 4034: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbd3d5000  ! 4036: SRAX_R	srax	%r21, %r0, %r30
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_305:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4e1ab  ! 4043: STHA_I	stha	%r30, [%r19 + 0x01ab] %asi
	.word 0xfa74c000  ! 4044: STX_R	stx	%r29, [%r19 + %r0]
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_306:
	setx	0x3f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0x27, %r14
	.word 0xf2f389e0  ! 4051: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_wr_209:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4052: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfaa48020  ! 4054: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, b)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 17)
	.word 0xf8adc020  ! 4061: STBA_R	stba	%r28, [%r23 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 22)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a42  ! 4067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a42, %hpstate
cpu_intr_3_307:
	setx	0x3e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 22)
	.word 0xf62ca023  ! 4072: STB_I	stb	%r27, [%r18 + 0x0023]
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cd0  ! 4075: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_210:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 4081: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_308:
	setx	0x3c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 3)
	.word 0xf435e098  ! 4092: STH_I	sth	%r26, [%r23 + 0x0098]
cpu_intr_3_309:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f561a8  ! 4095: STXA_I	stxa	%r25, [%r21 + 0x01a8] %asi
T3_asi_reg_rd_188:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbb3d2001  ! 4098: SRA_I	sra 	%r20, 0x0001, %r29
T3_asi_reg_rd_189:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_310:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d98  ! 4106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d88  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
	.word 0xfa2c8000  ! 4111: STB_R	stb	%r29, [%r18 + %r0]
T3_asi_reg_wr_211:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 4112: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_311:
	setx	0x430130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfc2c0000  ! 4120: STB_R	stb	%r30, [%r16 + %r0]
T3_asi_reg_rd_190:
	mov	0x10, %r14
	.word 0xf2db8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6f5e1a3  ! 4124: STXA_I	stxa	%r27, [%r23 + 0x01a3] %asi
	.word 0xf0a48020  ! 4128: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf02cc000  ! 4130: STB_R	stb	%r24, [%r19 + %r0]
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a52  ! 4134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a52, %hpstate
T3_asi_reg_wr_212:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4136: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0f421b3  ! 4137: STXA_I	stxa	%r24, [%r16 + 0x01b3] %asi
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_191:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_312:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 4146: STB_R	stb	%r30, [%r21 + %r0]
T3_asi_reg_rd_192:
	mov	0x7, %r14
	.word 0xfcdb8e80  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_193:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4148: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_213:
	mov	0x14, %r14
	.word 0xf4f384a0  ! 4152: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfea5e1ac  ! 4153: STWA_I	stwa	%r31, [%r23 + 0x01ac] %asi
	.word 0xbf2c0000  ! 4155: SLL_R	sll 	%r16, %r0, %r31
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_194:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0a44020  ! 4160: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xf0b54020  ! 4163: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xf6b56129  ! 4165: STHA_I	stha	%r27, [%r21 + 0x0129] %asi
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e5a  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
	.word 0xfe24a059  ! 4168: STW_I	stw	%r31, [%r18 + 0x0059]
T3_asi_reg_rd_195:
	mov	0xb, %r14
	.word 0xf8db89e0  ! 4169: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_214:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 4175: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf0a4a0cf  ! 4176: STWA_I	stwa	%r24, [%r18 + 0x00cf] %asi
cpu_intr_3_313:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad8020  ! 4180: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xf8b48020  ! 4181: STHA_R	stha	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_215:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 4187: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_196:
	mov	0x11, %r14
	.word 0xf6db89e0  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb21d4000  ! 4195: XOR_R	xor 	%r21, %r0, %r25
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_314:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_315:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 0)
	.word 0xbd7dc400  ! 4205: MOVR_R	movre	%r23, %r0, %r30
	.word 0xf82420fc  ! 4206: STW_I	stw	%r28, [%r16 + 0x00fc]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf0b48020  ! 4213: STHA_R	stha	%r24, [%r18 + %r0] 0x01
cpu_intr_3_316:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x10214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 4216: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf834615f  ! 4217: STH_I	sth	%r28, [%r17 + 0x015f]
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_216:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 4221: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_318:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c0000  ! 4225: STB_R	stb	%r30, [%r16 + %r0]
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983998  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1998, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xb5643801  ! 4233: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_197:
	mov	0x4, %r14
	.word 0xfcdb89e0  ! 4234: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_319:
	setx	0x41020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_198:
	mov	0x1c, %r14
	.word 0xf2db89e0  ! 4238: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfcb5e111  ! 4242: STHA_I	stha	%r30, [%r23 + 0x0111] %asi
	.word 0xbc252100  ! 4244: SUB_I	sub 	%r20, 0x0100, %r30
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 6)
	.word 0xfab4a0b3  ! 4248: STHA_I	stha	%r29, [%r18 + 0x00b3] %asi
cpu_intr_3_320:
	setx	0x420309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a0e0  ! 4250: WRPR_TT_I	wrpr	%r22, 0x00e0, %tt
T3_asi_reg_wr_217:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 4252: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf8248000  ! 4253: STW_R	stw	%r28, [%r18 + %r0]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982810  ! 4258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xf82460ea  ! 4260: STW_I	stw	%r28, [%r17 + 0x00ea]
	.word 0xf2a52182  ! 4262: STWA_I	stwa	%r25, [%r20 + 0x0182] %asi
	.word 0xf0a4e117  ! 4264: STWA_I	stwa	%r24, [%r19 + 0x0117] %asi
cpu_intr_3_321:
	setx	0x40031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 4274: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_322:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 4277: MOVcc_R	<illegal instruction>
	.word 0xbc85c000  ! 4279: ADDcc_R	addcc 	%r23, %r0, %r30
T3_asi_reg_wr_218:
	mov	0x18, %r14
	.word 0xf4f384a0  ! 4280: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfea40020  ! 4281: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_323:
	setx	0x40001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_324:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 19)
	.word 0xb0b520a7  ! 4292: SUBCcc_I	orncc 	%r20, 0x00a7, %r24
cpu_intr_3_325:
	setx	0x40012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34c000  ! 4298: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_rd_200:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 4301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf4250000  ! 4303: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_wr_219:
	mov	0x16, %r14
	.word 0xfef38e60  ! 4306: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 23)
	.word 0xfe342006  ! 4310: STH_I	sth	%r31, [%r16 + 0x0006]
T3_asi_reg_rd_201:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4340000  ! 4316: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xbf34f001  ! 4319: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0x8d9461b2  ! 4321: WRPR_PSTATE_I	wrpr	%r17, 0x01b2, %pstate
	.word 0xfc2d6013  ! 4322: STB_I	stb	%r30, [%r21 + 0x0013]
cpu_intr_3_326:
	setx	0x41002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5611b  ! 4328: STXA_I	stxa	%r29, [%r21 + 0x011b] %asi
T3_asi_reg_rd_202:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb8a4c000  ! 4334: SUBcc_R	subcc 	%r19, %r0, %r28
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ac4020  ! 4338: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf4ad2038  ! 4340: STBA_I	stba	%r26, [%r20 + 0x0038] %asi
cpu_intr_3_327:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_328:
	setx	0x420115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_220:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 4350: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_329:
	setx	0x410010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a52041  ! 4354: STWA_I	stwa	%r28, [%r20 + 0x0041] %asi
	.word 0xb49d61f4  ! 4359: XORcc_I	xorcc 	%r21, 0x01f4, %r26
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828c8  ! 4361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
T3_asi_reg_wr_221:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 4362: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbc8dc000  ! 4363: ANDcc_R	andcc 	%r23, %r0, %r30
T3_asi_reg_rd_203:
	mov	0x35, %r14
	.word 0xfedb8e80  ! 4365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_222:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 4367: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_223:
	mov	0x31, %r14
	.word 0xf8f384a0  ! 4373: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_224:
	mov	0x16, %r14
	.word 0xf6f38400  ! 4374: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d42  ! 4376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 13)
	.word 0xfcf42031  ! 4381: STXA_I	stxa	%r30, [%r16 + 0x0031] %asi
T3_asi_reg_wr_225:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 4383: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_330:
	setx	0x42003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235a00a  ! 4387: STH_I	sth	%r25, [%r22 + 0x000a]
	ta	T_CHANGE_HPRIV
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c40  ! 4393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
	.word 0xf8ade01f  ! 4395: STBA_I	stba	%r28, [%r23 + 0x001f] %asi
	.word 0xb6240000  ! 4396: SUB_R	sub 	%r16, %r0, %r27
T3_asi_reg_wr_226:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 4398: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_204:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_331:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 9)
	.word 0xf82d2054  ! 4403: STB_I	stb	%r28, [%r20 + 0x0054]
T3_asi_reg_wr_227:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 4408: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xba0ce03c  ! 4410: AND_I	and 	%r19, 0x003c, %r29
	.word 0xf0250000  ! 4411: STW_R	stw	%r24, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_228:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 4420: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_229:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 4422: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe750000  ! 4423: STX_R	stx	%r31, [%r20 + %r0]
cpu_intr_3_332:
	setx	0x43022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 4427: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_205:
	mov	0x1b, %r14
	.word 0xf2db89e0  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf2248000  ! 4435: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xfe354000  ! 4436: STH_R	sth	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ac8020  ! 4438: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf22cc000  ! 4439: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xb57da401  ! 4440: MOVR_I	movre	%r22, 0x1, %r26
	.word 0xf8ac8020  ! 4442: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2ad8020  ! 4445: STBA_R	stba	%r25, [%r22 + %r0] 0x01
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 34)
	.word 0xf435a164  ! 4459: STH_I	sth	%r26, [%r22 + 0x0164]
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfa75601b  ! 4466: STX_I	stx	%r29, [%r21 + 0x001b]
	ta	T_CHANGE_TO_TL1
	.word 0xb08cc000  ! 4469: ANDcc_R	andcc 	%r19, %r0, %r24
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 33)
	.word 0xf6ad8020  ! 4471: STBA_R	stba	%r27, [%r22 + %r0] 0x01
T3_asi_reg_wr_230:
	mov	0x13, %r14
	.word 0xfef38400  ! 4472: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8f4a07a  ! 4475: STXA_I	stxa	%r28, [%r18 + 0x007a] %asi
	.word 0xf8a4a19f  ! 4477: STWA_I	stwa	%r28, [%r18 + 0x019f] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xb83c4000  ! 4479: XNOR_R	xnor 	%r17, %r0, %r28
	.word 0xfaad0020  ! 4480: STBA_R	stba	%r29, [%r20 + %r0] 0x01
cpu_intr_3_333:
	setx	0x42020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 4482: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfeb42149  ! 4483: STHA_I	stha	%r31, [%r16 + 0x0149] %asi
	.word 0xb004a03c  ! 4484: ADD_I	add 	%r18, 0x003c, %r24
T3_asi_reg_wr_231:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4485: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_232:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 4486: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_233:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 4487: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf4a4211d  ! 4488: STWA_I	stwa	%r26, [%r16 + 0x011d] %asi
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfcf5610d  ! 4493: STXA_I	stxa	%r30, [%r21 + 0x010d] %asi
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_334:
	setx	0x42020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_335:
	setx	0x41022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_336:
	setx	0x42001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_207:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4f4e106  ! 4527: STXA_I	stxa	%r26, [%r19 + 0x0106] %asi
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, c)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_337:
	setx	0x43012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_234:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 4533: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6350000  ! 4534: STH_R	sth	%r27, [%r20 + %r0]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_208:
	mov	0x15, %r14
	.word 0xf2db89e0  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfcad8020  ! 4542: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xf2b4c020  ! 4543: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xfef5a098  ! 4544: STXA_I	stxa	%r31, [%r22 + 0x0098] %asi
	.word 0xf275605b  ! 4547: STX_I	stx	%r25, [%r21 + 0x005b]
cpu_intr_3_338:
	setx	0x41023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, f)
	.word 0xbc350000  ! 4553: ORN_R	orn 	%r20, %r0, %r30
cpu_intr_3_339:
	setx	0x47031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c4000  ! 4555: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf635c000  ! 4556: STH_R	sth	%r27, [%r23 + %r0]
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f0a  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xfaac8020  ! 4560: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xfc2da05d  ! 4562: STB_I	stb	%r30, [%r22 + 0x005d]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_340:
	setx	0x44003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_341:
	setx	0x460223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_342:
	setx	0x46021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_209:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_343:
	setx	0x47000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 4574: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_344:
	setx	0x450134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a1ab  ! 4580: STHA_I	stha	%r25, [%r18 + 0x01ab] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfaace04a  ! 4583: STBA_I	stba	%r29, [%r19 + 0x004a] %asi
cpu_intr_3_345:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x45000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac61a6  ! 4587: ANDNcc_I	andncc 	%r17, 0x01a6, %r26
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb53c6001  ! 4590: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xf6a58020  ! 4591: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xfcb420f9  ! 4594: STHA_I	stha	%r30, [%r16 + 0x00f9] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_235:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 4597: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_347:
	setx	0x45023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea46039  ! 4599: STWA_I	stwa	%r31, [%r17 + 0x0039] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_210:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_211:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_348:
	setx	0x440119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4a0df  ! 4609: STXA_I	stxa	%r28, [%r18 + 0x00df] %asi
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 3)
	.word 0xf6b461f5  ! 4621: STHA_I	stha	%r27, [%r17 + 0x01f5] %asi
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 39)
	.word 0xbe0d8000  ! 4623: AND_R	and 	%r22, %r0, %r31
	.word 0xfe24a1ea  ! 4625: STW_I	stw	%r31, [%r18 + 0x01ea]
	.word 0xf8b54020  ! 4627: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_wr_236:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 4628: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf22521a5  ! 4631: STW_I	stw	%r25, [%r20 + 0x01a5]
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf8ada160  ! 4636: STBA_I	stba	%r28, [%r22 + 0x0160] %asi
	.word 0xfead4020  ! 4639: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xf6342062  ! 4640: STH_I	sth	%r27, [%r16 + 0x0062]
cpu_intr_3_349:
	setx	0x470314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_213:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfab5609c  ! 4643: STHA_I	stha	%r29, [%r21 + 0x009c] %asi
	.word 0xb72c3001  ! 4644: SLLX_I	sllx	%r16, 0x0001, %r27
cpu_intr_3_350:
	setx	0x440017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 4647: STB_R	stb	%r30, [%r19 + %r0]
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb09d204c  ! 4651: XORcc_I	xorcc 	%r20, 0x004c, %r24
T3_asi_reg_rd_214:
	mov	0x4, %r14
	.word 0xf8db8e80  ! 4652: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbf345000  ! 4653: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xfc25c000  ! 4654: STW_R	stw	%r30, [%r23 + %r0]
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_237:
	mov	0x19, %r14
	.word 0xfcf38400  ! 4657: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_238:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 4667: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_239:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 4668: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc24c000  ! 4669: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xbd2cf001  ! 4670: SLLX_I	sllx	%r19, 0x0001, %r30
cpu_intr_3_351:
	setx	0x470305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x440335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34a0d6  ! 4678: STH_I	sth	%r30, [%r18 + 0x00d6]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_240:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 4681: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_353:
	setx	0x440116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea56127  ! 4689: STWA_I	stwa	%r31, [%r21 + 0x0127] %asi
	.word 0xf2a58020  ! 4693: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 8)
	.word 0xf4b54020  ! 4695: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xfca4c020  ! 4699: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_241:
	mov	0x2, %r14
	.word 0xfaf38400  ! 4700: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xba8ca1a0  ! 4706: ANDcc_I	andcc 	%r18, 0x01a0, %r29
	.word 0xf0a40020  ! 4708: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xbeb4c000  ! 4709: ORNcc_R	orncc 	%r19, %r0, %r31
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 33)
	.word 0xfa748000  ! 4711: STX_R	stx	%r29, [%r18 + %r0]
cpu_intr_3_354:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 4713: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_3_355:
	setx	0x470302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e18a  ! 4715: STH_I	sth	%r24, [%r19 + 0x018a]
	.word 0xfe2d8000  ! 4718: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xbc9cc000  ! 4719: XORcc_R	xorcc 	%r19, %r0, %r30
T3_asi_reg_wr_242:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4720: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe7560e8  ! 4721: STX_I	stx	%r31, [%r21 + 0x00e8]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_243:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4728: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_244:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_245:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 4732: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0x8195a0bc  ! 4733: WRPR_TPC_I	wrpr	%r22, 0x00bc, %tpc
cpu_intr_3_356:
	setx	0x470100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a460b3  ! 4744: STWA_I	stwa	%r24, [%r17 + 0x00b3] %asi
	.word 0xfeb4e048  ! 4747: STHA_I	stha	%r31, [%r19 + 0x0048] %asi
cpu_intr_3_357:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e1bd  ! 4749: STWA_I	stwa	%r25, [%r19 + 0x01bd] %asi
	.word 0xbf3c2001  ! 4754: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xf2b5a186  ! 4755: STHA_I	stha	%r25, [%r22 + 0x0186] %asi
T3_asi_reg_wr_246:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 4756: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfc342197  ! 4759: STH_I	sth	%r30, [%r16 + 0x0197]
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, a)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ad0  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad0, %hpstate
	.word 0xa1902001  ! 4764: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_wr_247:
	mov	0x2f, %r14
	.word 0xf6f38e60  ! 4769: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_358:
	setx	0x44013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_215:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4774: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_248:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 4776: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf6346064  ! 4778: STH_I	sth	%r27, [%r17 + 0x0064]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_249:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 4781: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2b50020  ! 4782: STHA_R	stha	%r25, [%r20 + %r0] 0x01
T3_asi_reg_wr_250:
	mov	0x1d, %r14
	.word 0xf8f384a0  ! 4786: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb935e001  ! 4787: SRL_I	srl 	%r23, 0x0001, %r28
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc2d8000  ! 4790: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf8248000  ! 4791: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf8ad8020  ! 4793: STBA_R	stba	%r28, [%r22 + %r0] 0x01
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_359:
	setx	0x460031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1dc000  ! 4797: XOR_R	xor 	%r23, %r0, %r31
	.word 0xf674a136  ! 4801: STX_I	stx	%r27, [%r18 + 0x0136]
	.word 0xf62c0000  ! 4802: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf2b4c020  ! 4803: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xbe344000  ! 4805: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xf035e09d  ! 4807: STH_I	sth	%r24, [%r23 + 0x009d]
	.word 0xfa24211c  ! 4808: STW_I	stw	%r29, [%r16 + 0x011c]
T3_asi_reg_wr_251:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 4811: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_216:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_360:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_361:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba454000  ! 4827: ADDC_R	addc 	%r21, %r0, %r29
cpu_intr_3_362:
	setx	0x460238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 4832: MOVcc_R	<illegal instruction>
	.word 0xf825a011  ! 4834: STW_I	stw	%r28, [%r22 + 0x0011]
	.word 0xbd3c8000  ! 4836: SRA_R	sra 	%r18, %r0, %r30
	.word 0xfa3560eb  ! 4838: STH_I	sth	%r29, [%r21 + 0x00eb]
	.word 0xf8ad21f9  ! 4841: STBA_I	stba	%r28, [%r20 + 0x01f9] %asi
T3_asi_reg_wr_252:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 4842: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL0
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6ace1ab  ! 4849: STBA_I	stba	%r27, [%r19 + 0x01ab] %asi
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 16)
	.word 0xbcc5c000  ! 4852: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xbf346001  ! 4855: SRL_I	srl 	%r17, 0x0001, %r31
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198290a  ! 4857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090a, %hpstate
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cd0  ! 4858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
	.word 0xf0b58020  ! 4861: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xf42560d9  ! 4862: STW_I	stw	%r26, [%r21 + 0x00d9]
	.word 0xbc35c000  ! 4875: ORN_R	orn 	%r23, %r0, %r30
	.word 0xfc24c000  ! 4876: STW_R	stw	%r30, [%r19 + %r0]
T3_asi_reg_wr_253:
	mov	0x1b, %r14
	.word 0xf4f389e0  ! 4878: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb284e0dc  ! 4883: ADDcc_I	addcc 	%r19, 0x00dc, %r25
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_254:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4886: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_363:
	setx	0x45030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xa1902001  ! 4894: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf6b40020  ! 4897: STHA_R	stha	%r27, [%r16 + %r0] 0x01
T3_asi_reg_rd_217:
	mov	0x1f, %r14
	.word 0xfcdb8e80  ! 4898: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb23d213b  ! 4900: XNOR_I	xnor 	%r20, 0x013b, %r25
	.word 0xfaacc020  ! 4901: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xba050000  ! 4903: ADD_R	add 	%r20, %r0, %r29
T3_asi_reg_wr_255:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 4905: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfef4e146  ! 4909: STXA_I	stxa	%r31, [%r19 + 0x0146] %asi
cpu_intr_3_364:
	setx	0x46021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_218:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_219:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfaacc020  ! 4922: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf0a4c020  ! 4927: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
cpu_intr_3_365:
	setx	0x440118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3dc000  ! 4929: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xf4756101  ! 4931: STX_I	stx	%r26, [%r21 + 0x0101]
	.word 0xf0b54020  ! 4933: STHA_R	stha	%r24, [%r21 + %r0] 0x01
cpu_intr_3_366:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb54020  ! 4935: STHA_R	stha	%r30, [%r21 + %r0] 0x01
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf4b5c020  ! 4938: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xb6c5a12e  ! 4943: ADDCcc_I	addccc 	%r22, 0x012e, %r27
	.word 0xf0acc020  ! 4944: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_220:
	mov	0x2b, %r14
	.word 0xfedb8e80  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 5)
	.word 0xb084c000  ! 4948: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xf8350000  ! 4950: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfc2d0000  ! 4951: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb32df001  ! 4956: SLLX_I	sllx	%r23, 0x0001, %r25
cpu_intr_3_367:
	setx	0x440308, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_256:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 4959: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_368:
	setx	0x45022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa52070  ! 4963: STWA_I	stwa	%r29, [%r20 + 0x0070] %asi
	.word 0xf67520ba  ! 4965: STX_I	stx	%r27, [%r20 + 0x00ba]
	.word 0xf4354000  ! 4966: STH_R	sth	%r26, [%r21 + %r0]
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 10)
	.word 0xfe342159  ! 4972: STH_I	sth	%r31, [%r16 + 0x0159]
cpu_intr_3_369:
	setx	0x44023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, 36)
	.word 0xf62d8000  ! 4980: STB_R	stb	%r27, [%r22 + %r0]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bc8  ! 4982: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc8, %hpstate
cpu_intr_3_370:
	setx	0x450131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_413), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_HPRIV
cpu_intr_3_371:
	setx	0x45000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_372:
	setx	0x450015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 4995: STW_R	stw	%r26, [%r18 + %r0]
cpu_intr_3_373:
	setx	0x46003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2561b3  ! 4998: STW_I	stw	%r30, [%r21 + 0x01b3]
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
	.word 0xfa55e163  ! 5: LDSH_I	ldsh	[%r23 + 0x0163], %r29
	.word 0xf28dc020  ! 12: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_0:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 14: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf85d4000  ! 16: LDX_R	ldx	[%r21 + %r0], %r28
T2_asi_reg_wr_0:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 19: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_0:
	setx	0x1c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_1:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 24: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_1:
	setx	0x1e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe056055  ! 31: ADD_I	add 	%r21, 0x0055, %r31
	.word 0xfcd4e1b4  ! 33: LDSHA_I	ldsha	[%r19, + 0x01b4] %asi, %r30
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf65561fd  ! 35: LDSH_I	ldsh	[%r21 + 0x01fd], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf604619e  ! 43: LDUW_I	lduw	[%r17 + 0x019e], %r27
	.word 0xb3510000  ! 44: RDPR_TICK	<illegal instruction>
	.word 0xf6c4e16e  ! 45: LDSWA_I	ldswa	[%r19, + 0x016e] %asi, %r27
	.word 0xfc850020  ! 46: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	.word 0xb77c0400  ! 48: MOVR_R	movre	%r16, %r0, %r27
T2_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 49: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_3:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 51: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_4:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 52: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4044000  ! 56: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xb2344000  ! 58: SUBC_R	orn 	%r17, %r0, %r25
T2_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_2:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0154000  ! 61: LDUH_R	lduh	[%r21 + %r0], %r24
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_3:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_4:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_6:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 69: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 15)
	.word 0xbe3c8000  ! 71: XNOR_R	xnor 	%r18, %r0, %r31
T2_asi_reg_wr_7:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 72: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4958020  ! 75: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
	.word 0xfc4c20c3  ! 76: LDSB_I	ldsb	[%r16 + 0x00c3], %r30
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b08  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
T2_asi_reg_rd_5:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 78: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 32)
	.word 0xf64c2018  ! 80: LDSB_I	ldsb	[%r16 + 0x0018], %r27
	.word 0xba94c000  ! 81: ORcc_R	orcc 	%r19, %r0, %r29
T2_asi_reg_rd_6:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 82: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_2:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad4a198  ! 84: LDSHA_I	ldsha	[%r18, + 0x0198] %asi, %r29
	.word 0xfc94e01f  ! 85: LDUHA_I	lduha	[%r19, + 0x001f] %asi, %r30
	.word 0xf4cdc020  ! 86: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
cpu_intr_2_3:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_8:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 90: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_4:
	setx	0x1d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_7:
	mov	0xf, %r14
	.word 0xfedb84a0  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfa15216e  ! 102: LDUH_I	lduh	[%r20 + 0x016e], %r29
	.word 0xfe854020  ! 103: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfa1520f6  ! 105: LDUH_I	lduh	[%r20 + 0x00f6], %r29
	.word 0xf08c0020  ! 108: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
	.word 0xf04d21f2  ! 114: LDSB_I	ldsb	[%r20 + 0x01f2], %r24
	.word 0x9194e103  ! 117: WRPR_PIL_I	wrpr	%r19, 0x0103, %pil
T2_asi_reg_wr_9:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 118: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_10:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 120: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb2048000  ! 122: ADD_R	add 	%r18, %r0, %r25
T2_asi_reg_wr_11:
	mov	0x15, %r14
	.word 0xf0f38e80  ! 123: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_5:
	setx	0x1e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 133: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_6:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_7:
	setx	0x1f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_8:
	setx	0x1f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454e132  ! 142: LDSH_I	ldsh	[%r19 + 0x0132], %r26
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_9:
	setx	0x1c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_13:
	mov	0x10, %r14
	.word 0xf2f38e60  ! 149: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_14:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 151: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf00c4000  ! 154: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xfc8ce038  ! 155: LDUBA_I	lduba	[%r19, + 0x0038] %asi, %r30
	.word 0xf24d8000  ! 158: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf84da1c1  ! 160: LDSB_I	ldsb	[%r22 + 0x01c1], %r28
	.word 0xf2042001  ! 161: LDUW_I	lduw	[%r16 + 0x0001], %r25
	.word 0xfc4da035  ! 162: LDSB_I	ldsb	[%r22 + 0x0035], %r30
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_15:
	mov	0x2f, %r14
	.word 0xf2f38e60  ! 165: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfa058000  ! 170: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfecde1d8  ! 175: LDSBA_I	ldsba	[%r23, + 0x01d8] %asi, %r31
T2_asi_reg_rd_8:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 177: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb77d4400  ! 179: MOVR_R	movre	%r21, %r0, %r27
	.word 0xfa0da0c1  ! 180: LDUB_I	ldub	[%r22 + 0x00c1], %r29
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_9:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_16:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 190: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbe3ce164  ! 191: XNOR_I	xnor 	%r19, 0x0164, %r31
cpu_intr_2_10:
	setx	0x1f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd8020  ! 193: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xfacda030  ! 194: LDSBA_I	ldsba	[%r22, + 0x0030] %asi, %r29
T2_asi_reg_wr_17:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 196: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_11:
	setx	0x1d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_12:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 200: LDUW_R	lduw	[%r18 + %r0], %r30
T2_asi_reg_rd_10:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbf3cc000  ! 206: SRA_R	sra 	%r19, %r0, %r31
cpu_intr_2_13:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 28)
	.word 0xf014a127  ! 214: LDUH_I	lduh	[%r18 + 0x0127], %r24
cpu_intr_2_14:
	setx	0x1d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf60dc000  ! 226: LDUB_R	ldub	[%r23 + %r0], %r27
cpu_intr_2_15:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_11:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 230: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf44521e6  ! 231: LDSW_I	ldsw	[%r20 + 0x01e6], %r26
T2_asi_reg_wr_18:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 232: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf4d5a18b  ! 234: LDSHA_I	ldsha	[%r22, + 0x018b] %asi, %r26
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b92  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	.word 0xb23d21e6  ! 238: XNOR_I	xnor 	%r20, 0x01e6, %r25
T2_asi_reg_wr_19:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 241: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf04561a7  ! 243: LDSW_I	ldsw	[%r21 + 0x01a7], %r24
	.word 0xf48d6105  ! 244: LDUBA_I	lduba	[%r21, + 0x0105] %asi, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfc844020  ! 246: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_12:
	mov	0x20, %r14
	.word 0xfedb89e0  ! 250: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 260: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb62c8000  ! 261: ANDN_R	andn 	%r18, %r0, %r27
cpu_intr_2_16:
	setx	0x1e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c58020  ! 266: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
	.word 0xf4d48020  ! 270: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xf6c50020  ! 271: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_13:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 272: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_14:
	mov	0x16, %r14
	.word 0xf8db8e60  ! 273: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf4c52035  ! 275: LDSWA_I	ldswa	[%r20, + 0x0035] %asi, %r26
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_21:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 277: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb83ce1b4  ! 279: XNOR_I	xnor 	%r19, 0x01b4, %r28
T2_asi_reg_rd_15:
	mov	0x5, %r14
	.word 0xf2db8e40  ! 282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf04d8000  ! 283: LDSB_R	ldsb	[%r22 + %r0], %r24
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfad4a1c5  ! 290: LDSHA_I	ldsha	[%r18, + 0x01c5] %asi, %r29
cpu_intr_2_17:
	setx	0x1d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22cc000  ! 292: ANDN_R	andn 	%r19, %r0, %r25
T2_asi_reg_rd_16:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 293: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_22:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 297: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_23:
	mov	0x15, %r14
	.word 0xfcf384a0  ! 298: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_18:
	setx	0x1c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c21bd  ! 303: LDUBA_I	lduba	[%r16, + 0x01bd] %asi, %r28
T2_asi_reg_rd_17:
	mov	0x1, %r14
	.word 0xf4db8e40  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8040000  ! 305: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf8456035  ! 306: LDSW_I	ldsw	[%r21 + 0x0035], %r28
T2_asi_reg_rd_18:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 310: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a02  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
T2_asi_reg_wr_24:
	mov	0x2f, %r14
	.word 0xfef38400  ! 312: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf4c58020  ! 313: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_25:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 314: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8c44020  ! 318: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xf68d4020  ! 319: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 30)
	.word 0xbd3dd000  ! 326: SRAX_R	srax	%r23, %r0, %r30
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, b)
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf294a10f  ! 330: LDUHA_I	lduha	[%r18, + 0x010f] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa85c020  ! 335: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xfe8d0020  ! 337: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	.word 0xfcdda0b3  ! 339: LDXA_I	ldxa	[%r22, + 0x00b3] %asi, %r30
T2_asi_reg_wr_26:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 340: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf855a051  ! 341: LDSH_I	ldsh	[%r22 + 0x0051], %r28
T2_asi_reg_rd_19:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 343: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf28dc020  ! 344: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_27:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 345: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983952  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1952, %hpstate
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf44d6147  ! 348: LDSB_I	ldsb	[%r21 + 0x0147], %r26
	.word 0xfcd460f9  ! 351: LDSHA_I	ldsha	[%r17, + 0x00f9] %asi, %r30
	.word 0xf8cde15b  ! 352: LDSBA_I	ldsba	[%r23, + 0x015b] %asi, %r28
	.word 0xb29d2146  ! 356: XORcc_I	xorcc 	%r20, 0x0146, %r25
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 358: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc3c0000  ! 359: XNOR_R	xnor 	%r16, %r0, %r30
T2_asi_reg_rd_20:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf294c020  ! 365: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
cpu_intr_2_19:
	setx	0x1d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bcc000  ! 369: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xbab48000  ! 370: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xf84d8000  ! 371: LDSB_R	ldsb	[%r22 + %r0], %r28
cpu_intr_2_20:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_21:
	setx	0x1d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa450000  ! 379: LDSW_R	ldsw	[%r20 + %r0], %r29
cpu_intr_2_22:
	setx	0x1f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 11)
	.word 0xfac4a0f4  ! 385: LDSWA_I	ldswa	[%r18, + 0x00f4] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_21:
	mov	0x27, %r14
	.word 0xfadb8400  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf05d0000  ! 397: LDX_R	ldx	[%r20 + %r0], %r24
cpu_intr_2_23:
	setx	0x1d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_29:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 400: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_22:
	mov	0x18, %r14
	.word 0xfcdb8e60  ! 401: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
cpu_intr_2_24:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, e)
	.word 0xf6c5c020  ! 415: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xf00ca0c0  ! 417: LDUB_I	ldub	[%r18 + 0x00c0], %r24
	.word 0xf0140000  ! 418: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfe144000  ! 419: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf644a17e  ! 420: LDSW_I	ldsw	[%r18 + 0x017e], %r27
	.word 0xf00421a5  ! 421: LDUW_I	lduw	[%r16 + 0x01a5], %r24
T2_asi_reg_rd_23:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcd5a0c5  ! 427: LDSHA_I	ldsha	[%r22, + 0x00c5] %asi, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_30:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 429: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_25:
	setx	0x230006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 35)
	.word 0xf6548000  ! 440: LDSH_R	ldsh	[%r18 + %r0], %r27
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_26:
	setx	0x230013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_31:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 446: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_27:
	setx	0x22022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_28:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4548000  ! 455: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf45d60a4  ! 459: LDX_I	ldx	[%r21 + 0x00a4], %r26
T2_asi_reg_wr_32:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 460: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xfa840020  ! 462: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_29:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_30:
	setx	0x200023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_31:
	setx	0x21021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_25:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb0340000  ! 471: ORN_R	orn 	%r16, %r0, %r24
cpu_intr_2_32:
	setx	0x230130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 477: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b0a  ! 480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0a, %hpstate
	.word 0xfa152111  ! 481: LDUH_I	lduh	[%r20 + 0x0111], %r29
	.word 0xfe140000  ! 482: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb29dc000  ! 483: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xfacc4020  ! 487: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983880  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1880, %hpstate
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_HPRIV
	.word 0xf4848020  ! 497: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_TO_TL0
	.word 0xbf2d0000  ! 504: SLL_R	sll 	%r20, %r0, %r31
T2_asi_reg_rd_27:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_33:
	mov	0x20, %r14
	.word 0xfef38e80  ! 510: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf845a1fa  ! 514: LDSW_I	ldsw	[%r22 + 0x01fa], %r28
T2_asi_reg_rd_28:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 519: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf8044000  ! 521: LDUW_R	lduw	[%r17 + %r0], %r28
cpu_intr_2_33:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2da177  ! 523: ANDN_I	andn 	%r22, 0x0177, %r30
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_29:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_30:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 528: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8cd600e  ! 529: LDSBA_I	ldsba	[%r21, + 0x000e] %asi, %r28
T2_asi_reg_rd_31:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_34:
	setx	0x230323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c421fd  ! 542: LDSWA_I	ldswa	[%r16, + 0x01fd] %asi, %r26
T2_asi_reg_rd_32:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_33:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbd641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xfcc460c2  ! 552: LDSWA_I	ldswa	[%r17, + 0x00c2] %asi, %r30
	.word 0xf4056128  ! 553: LDUW_I	lduw	[%r21 + 0x0128], %r26
cpu_intr_2_35:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2948020  ! 558: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
cpu_intr_2_36:
	setx	0x230114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_37:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_38:
	setx	0x220117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x13, %r14
	.word 0xf4db84a0  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb37d0400  ! 564: MOVR_R	movre	%r20, %r0, %r25
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982802  ! 566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
cpu_intr_2_39:
	setx	0x200130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73db001  ! 569: SRAX_I	srax	%r22, 0x0001, %r27
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf88c4020  ! 573: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_35:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, c)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f5a  ! 578: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
T2_asi_reg_wr_34:
	mov	0x17, %r14
	.word 0xfef38400  ! 579: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf24d20df  ! 581: LDSB_I	ldsb	[%r20 + 0x00df], %r25
cpu_intr_2_40:
	setx	0x20030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_41:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x12, %r14
	.word 0xf6db8400  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_35:
	mov	0x19, %r14
	.word 0xfaf384a0  ! 591: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf68dc020  ! 592: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	.word 0xb8bcc000  ! 593: XNORcc_R	xnorcc 	%r19, %r0, %r28
cpu_intr_2_42:
	setx	0x200101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x230124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd8020  ! 597: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 31)
	.word 0xf8940020  ! 602: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
	.word 0xfe4ce01e  ! 603: LDSB_I	ldsb	[%r19 + 0x001e], %r31
	.word 0xfe15618f  ! 604: LDUH_I	lduh	[%r21 + 0x018f], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf8956121  ! 607: LDUHA_I	lduha	[%r21, + 0x0121] %asi, %r28
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, c)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_NONHPRIV
	.word 0xfe542116  ! 615: LDSH_I	ldsh	[%r16 + 0x0116], %r31
	.word 0xb32c8000  ! 617: SLL_R	sll 	%r18, %r0, %r25
	.word 0xf45c21e7  ! 618: LDX_I	ldx	[%r16 + 0x01e7], %r26
T2_asi_reg_wr_36:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 619: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2d5e07f  ! 622: LDSHA_I	ldsha	[%r23, + 0x007f] %asi, %r25
	.word 0xf00c8000  ! 624: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xfad5e1fc  ! 631: LDSHA_I	ldsha	[%r23, + 0x01fc] %asi, %r29
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_37:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 639: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xfe94a18d  ! 643: LDUHA_I	lduha	[%r18, + 0x018d] %asi, %r31
cpu_intr_2_45:
	setx	0x220304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c8020  ! 648: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_38:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 652: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_46:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_47:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe946015  ! 656: LDUHA_I	lduha	[%r17, + 0x0015] %asi, %r31
T2_asi_reg_rd_37:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4940020  ! 659: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_39:
	mov	0x24, %r14
	.word 0xfef38e40  ! 660: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_38:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbeb50000  ! 669: SUBCcc_R	orncc 	%r20, %r0, %r31
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_48:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d6098  ! 682: LDUBA_I	lduba	[%r21, + 0x0098] %asi, %r31
	.word 0xf08ca077  ! 684: LDUBA_I	lduba	[%r18, + 0x0077] %asi, %r24
	.word 0xfe0461b3  ! 685: LDUW_I	lduw	[%r17 + 0x01b3], %r31
cpu_intr_2_49:
	setx	0x21031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5c020  ! 688: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_40:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 691: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf24ce07e  ! 695: LDSB_I	ldsb	[%r19 + 0x007e], %r25
	.word 0xfe148000  ! 699: LDUH_R	lduh	[%r18 + %r0], %r31
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c18  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xf4c50020  ! 701: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, b)
	.word 0xf404207e  ! 707: LDUW_I	lduw	[%r16 + 0x007e], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf84521ea  ! 710: LDSW_I	ldsw	[%r20 + 0x01ea], %r28
	.word 0xf2dc20af  ! 712: LDXA_I	ldxa	[%r16, + 0x00af] %asi, %r25
cpu_intr_2_50:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_41:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 716: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf40ca1b2  ! 717: LDUB_I	ldub	[%r18 + 0x01b2], %r26
T2_asi_reg_rd_39:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xba854000  ! 719: ADDcc_R	addcc 	%r21, %r0, %r29
cpu_intr_2_51:
	setx	0x230306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x21010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf855c000  ! 725: LDSH_R	ldsh	[%r23 + %r0], %r28
T2_asi_reg_wr_42:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 726: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_40:
	mov	0x14, %r14
	.word 0xfadb8400  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_43:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 738: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf6158000  ! 740: LDUH_R	lduh	[%r22 + %r0], %r27
cpu_intr_2_53:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_54:
	setx	0x200219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01dc000  ! 747: XOR_R	xor 	%r23, %r0, %r24
cpu_intr_2_55:
	setx	0x220325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5e0c9  ! 752: LDSHA_I	ldsha	[%r23, + 0x00c9] %asi, %r27
	.word 0xf85c0000  ! 753: LDX_R	ldx	[%r16 + %r0], %r28
T2_asi_reg_rd_41:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbeb5e124  ! 756: ORNcc_I	orncc 	%r23, 0x0124, %r31
	.word 0xf095213e  ! 757: LDUHA_I	lduha	[%r20, + 0x013e] %asi, %r24
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983902  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1902, %hpstate
T2_asi_reg_wr_44:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 760: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfacd6024  ! 765: LDSBA_I	ldsba	[%r21, + 0x0024] %asi, %r29
cpu_intr_2_56:
	setx	0x23003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d609d  ! 774: LDUBA_I	lduba	[%r21, + 0x009d] %asi, %r28
T2_asi_reg_wr_45:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 775: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_57:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d60b5  ! 784: LDSB_I	ldsb	[%r21 + 0x00b5], %r30
T2_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_46:
	mov	0x10, %r14
	.word 0xf6f38400  ! 786: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a9a  ! 789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9a, %hpstate
	.word 0xbe95c000  ! 790: ORcc_R	orcc 	%r23, %r0, %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_58:
	setx	0x23023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf884a0b8  ! 803: LDUWA_I	lduwa	[%r18, + 0x00b8] %asi, %r28
	.word 0xf4542118  ! 807: LDSH_I	ldsh	[%r16 + 0x0118], %r26
cpu_intr_2_59:
	setx	0x200009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05de1d1  ! 810: LDX_I	ldx	[%r23 + 0x01d1], %r24
T2_asi_reg_rd_43:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_44:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_60:
	setx	0x210208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17d8400  ! 818: MOVR_R	movre	%r22, %r0, %r24
	.word 0xf2cd4020  ! 824: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_61:
	setx	0x220216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_45:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2458000  ! 841: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xfe1420f9  ! 842: LDUH_I	lduh	[%r16 + 0x00f9], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc9c61ae  ! 845: XORcc_I	xorcc 	%r17, 0x01ae, %r30
	.word 0xfec4e064  ! 848: LDSWA_I	ldswa	[%r19, + 0x0064] %asi, %r31
	.word 0xfa8c61e0  ! 851: LDUBA_I	lduba	[%r17, + 0x01e0] %asi, %r29
	.word 0xf45d4000  ! 855: LDX_R	ldx	[%r21 + %r0], %r26
T2_asi_reg_wr_47:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 856: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbe854000  ! 857: ADDcc_R	addcc 	%r21, %r0, %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_46:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0050000  ! 862: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xbc8c4000  ! 863: ANDcc_R	andcc 	%r17, %r0, %r30
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2c5e118  ! 873: LDSWA_I	ldswa	[%r23, + 0x0118] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf89460a2  ! 875: LDUHA_I	lduha	[%r17, + 0x00a2] %asi, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_48:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 878: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_49:
	mov	0x8, %r14
	.word 0xf8f38400  ! 880: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3641800  ! 883: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_50:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 884: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, d)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa5c60de  ! 888: LDX_I	ldx	[%r17 + 0x00de], %r29
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_62:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73cd000  ! 893: SRAX_R	srax	%r19, %r0, %r27
	.word 0xfe044000  ! 894: LDUW_R	lduw	[%r17 + %r0], %r31
T2_asi_reg_rd_47:
	mov	0x0, %r14
	.word 0xf4db89e0  ! 895: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_51:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 897: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc540000  ! 901: LDSH_R	ldsh	[%r16 + %r0], %r30
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc144000  ! 906: LDUH_R	lduh	[%r17 + %r0], %r30
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_63:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8948020  ! 909: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
T2_asi_reg_rd_48:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 911: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe0c8000  ! 915: LDUB_R	ldub	[%r18 + %r0], %r31
T2_asi_reg_rd_49:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_52:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 923: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 30)
	.word 0xf814e0cb  ! 928: LDUH_I	lduh	[%r19 + 0x00cb], %r28
	.word 0xf6852090  ! 929: LDUWA_I	lduwa	[%r20, + 0x0090] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf20c0000  ! 931: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf68d0020  ! 933: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
T2_asi_reg_wr_53:
	mov	0x15, %r14
	.word 0xfef38e40  ! 937: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_54:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 941: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb09c2067  ! 942: XORcc_I	xorcc 	%r16, 0x0067, %r24
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_64:
	setx	0x25000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 946: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfa458000  ! 947: LDSW_R	ldsw	[%r22 + %r0], %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_50:
	mov	0x26, %r14
	.word 0xf6db8e60  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 5)
	.word 0xb37c0400  ! 956: MOVR_R	movre	%r16, %r0, %r25
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 15)
	.word 0xf084c020  ! 969: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
cpu_intr_2_65:
	setx	0x25002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c4000  ! 974: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0x8194a037  ! 976: WRPR_TPC_I	wrpr	%r18, 0x0037, %tpc
T2_asi_reg_rd_51:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, e)
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 14)
	.word 0xf454a16a  ! 983: LDSH_I	ldsh	[%r18 + 0x016a], %r26
	.word 0xfe854020  ! 984: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xb2a5e1a5  ! 986: SUBcc_I	subcc 	%r23, 0x01a5, %r25
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_55:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 992: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_52:
	mov	0x2d, %r14
	.word 0xfedb89e0  ! 993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 35)
	.word 0xf215e048  ! 997: LDUH_I	lduh	[%r23 + 0x0048], %r25
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982982  ! 998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b4a  ! 999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
T2_asi_reg_rd_53:
	mov	0x2e, %r14
	.word 0xf2db84a0  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf2cd0020  ! 1003: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xf604a1d7  ! 1005: LDUW_I	lduw	[%r18 + 0x01d7], %r27
cpu_intr_2_66:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d8000  ! 1008: XOR_R	xor 	%r22, %r0, %r31
	.word 0xf05421c5  ! 1009: LDSH_I	ldsh	[%r16 + 0x01c5], %r24
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa84216b  ! 1014: LDUWA_I	lduwa	[%r16, + 0x016b] %asi, %r29
T2_asi_reg_wr_56:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 1015: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_67:
	setx	0x240025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_68:
	setx	0x270123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfcd5e1fd  ! 1028: LDSHA_I	ldsha	[%r23, + 0x01fd] %asi, %r30
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_69:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_54:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfad5a0be  ! 1037: LDSHA_I	ldsha	[%r22, + 0x00be] %asi, %r29
	.word 0xfa4d4000  ! 1040: LDSB_R	ldsb	[%r21 + %r0], %r29
cpu_intr_2_70:
	setx	0x26010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0144000  ! 1043: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf0c461da  ! 1044: LDSWA_I	ldswa	[%r17, + 0x01da] %asi, %r24
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 35)
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b58  ! 1050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b58, %hpstate
cpu_intr_2_71:
	setx	0x24021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf094606c  ! 1055: LDUHA_I	lduha	[%r17, + 0x006c] %asi, %r24
	.word 0xb4bc2199  ! 1059: XNORcc_I	xnorcc 	%r16, 0x0199, %r26
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf84d0000  ! 1065: LDSB_R	ldsb	[%r20 + %r0], %r28
T2_asi_reg_rd_55:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf68d0020  ! 1069: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 39)
	.word 0xbc3421e2  ! 1072: ORN_I	orn 	%r16, 0x01e2, %r30
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f1a  ! 1074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
cpu_intr_2_72:
	setx	0x24012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c5a  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 18)
	.word 0xfad4e1ff  ! 1084: LDSHA_I	ldsha	[%r19, + 0x01ff] %asi, %r29
	.word 0xf0d54020  ! 1087: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982eca  ! 1088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	.word 0xf245a07f  ! 1092: LDSW_I	ldsw	[%r22 + 0x007f], %r25
cpu_intr_2_73:
	setx	0x250109, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_56:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1096: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_rd_57:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf8848020  ! 1098: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	.word 0xfecca134  ! 1100: LDSBA_I	ldsba	[%r18, + 0x0134] %asi, %r31
T2_asi_reg_wr_57:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1103: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 20)
	.word 0xf2dce07f  ! 1106: LDXA_I	ldxa	[%r19, + 0x007f] %asi, %r25
	.word 0xfecca070  ! 1107: LDSBA_I	ldsba	[%r18, + 0x0070] %asi, %r31
	.word 0xfadce015  ! 1108: LDXA_I	ldxa	[%r19, + 0x0015] %asi, %r29
	.word 0xf0cc61a7  ! 1112: LDSBA_I	ldsba	[%r17, + 0x01a7] %asi, %r24
T2_asi_reg_rd_58:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_74:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_75:
	setx	0x270003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x240333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_77:
	setx	0x250204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04615c  ! 1122: LDUW_I	lduw	[%r17 + 0x015c], %r31
	.word 0xb08d0000  ! 1123: ANDcc_R	andcc 	%r20, %r0, %r24
T2_asi_reg_wr_58:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 1124: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 19)
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d82  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
T2_asi_reg_rd_59:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_78:
	setx	0x270329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_60:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 1137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_59:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 1142: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_61:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_79:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_62:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 1149: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf05d61d3  ! 1153: LDX_I	ldx	[%r21 + 0x01d3], %r24
	.word 0xf2056181  ! 1154: LDUW_I	lduw	[%r21 + 0x0181], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc84e0dd  ! 1158: LDUWA_I	lduwa	[%r19, + 0x00dd] %asi, %r30
T2_asi_reg_wr_60:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 1161: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfadd215b  ! 1162: LDXA_I	ldxa	[%r20, + 0x015b] %asi, %r29
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4d4a061  ! 1165: LDSHA_I	ldsha	[%r18, + 0x0061] %asi, %r26
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbc1c4000  ! 1172: XOR_R	xor 	%r17, %r0, %r30
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 39)
	.word 0xf60d4000  ! 1175: LDUB_R	ldub	[%r21 + %r0], %r27
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 25)
	.word 0xfc95208b  ! 1181: LDUHA_I	lduha	[%r20, + 0x008b] %asi, %r30
	.word 0xf64de0cf  ! 1183: LDSB_I	ldsb	[%r23 + 0x00cf], %r27
	.word 0xf2c4c020  ! 1186: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xf0948020  ! 1191: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_63:
	mov	0x4, %r14
	.word 0xf2db8400  ! 1193: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1194: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_rd_64:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb8c4c000  ! 1196: ADDCcc_R	addccc 	%r19, %r0, %r28
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_62:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 1202: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_65:
	mov	0x2, %r14
	.word 0xf8db84a0  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_80:
	setx	0x24021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64da0e8  ! 1211: LDSB_I	ldsb	[%r22 + 0x00e8], %r27
cpu_intr_2_81:
	setx	0x24011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_82:
	setx	0x250010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_63:
	mov	0x5, %r14
	.word 0xfef38e40  ! 1219: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf255c000  ! 1223: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf85d0000  ! 1228: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xfcc4e1e2  ! 1230: LDSWA_I	ldswa	[%r19, + 0x01e2] %asi, %r30
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982940  ! 1231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_64:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 1234: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf815c000  ! 1235: LDUH_R	lduh	[%r23 + %r0], %r28
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982998  ! 1241: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
cpu_intr_2_83:
	setx	0x24020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819421a8  ! 1244: WRPR_TPC_I	wrpr	%r16, 0x01a8, %tpc
	ta	T_CHANGE_NONHPRIV
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_TO_TL0
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 7)
	.word 0xf80d8000  ! 1261: LDUB_R	ldub	[%r22 + %r0], %r28
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_84:
	setx	0x26002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8550000  ! 1264: LDSH_R	ldsh	[%r20 + %r0], %r28
T2_asi_reg_rd_66:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6140000  ! 1270: LDUH_R	lduh	[%r16 + %r0], %r27
cpu_intr_2_85:
	setx	0x250325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4e124  ! 1274: LDSWA_I	ldswa	[%r19, + 0x0124] %asi, %r27
cpu_intr_2_87:
	setx	0x260035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_88:
	setx	0x250028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_89:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_90:
	setx	0x25000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdd60cc  ! 1287: LDXA_I	ldxa	[%r21, + 0x00cc] %asi, %r30
	.word 0xf84d8000  ! 1289: LDSB_R	ldsb	[%r22 + %r0], %r28
cpu_intr_2_91:
	setx	0x270033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_92:
	setx	0x270034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x17, %r14
	.word 0xf8db8400  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf0444000  ! 1303: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf694a18b  ! 1304: LDUHA_I	lduha	[%r18, + 0x018b] %asi, %r27
T2_asi_reg_wr_65:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 1308: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8cc607e  ! 1309: LDSBA_I	ldsba	[%r17, + 0x007e] %asi, %r28
	.word 0xf0d54020  ! 1310: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
cpu_intr_2_93:
	setx	0x25033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_94:
	setx	0x260035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04ca009  ! 1328: LDSB_I	ldsb	[%r18 + 0x0009], %r24
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 34)
	.word 0xfcc44020  ! 1331: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xbe14a0bc  ! 1332: OR_I	or 	%r18, 0x00bc, %r31
	.word 0xbaacc000  ! 1334: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xfed4c020  ! 1336: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xf204c000  ! 1340: LDUW_R	lduw	[%r19 + %r0], %r25
T2_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 1341: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf815e18e  ! 1342: LDUH_I	lduh	[%r23 + 0x018e], %r28
	.word 0xfcdca051  ! 1343: LDXA_I	ldxa	[%r18, + 0x0051] %asi, %r30
	.word 0xf8dd6022  ! 1346: LDXA_I	ldxa	[%r21, + 0x0022] %asi, %r28
T2_asi_reg_wr_67:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 1347: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_95:
	setx	0x24010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, f)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 11)
	.word 0xbf344000  ! 1357: SRL_R	srl 	%r17, %r0, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_96:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_68:
	mov	0x23, %r14
	.word 0xfcf389e0  ! 1366: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa950020  ! 1369: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xfed5a199  ! 1371: LDSHA_I	ldsha	[%r22, + 0x0199] %asi, %r31
	.word 0xf65d0000  ! 1373: LDX_R	ldx	[%r20 + %r0], %r27
cpu_intr_2_97:
	setx	0x290327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x2b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa05c000  ! 1376: LDUW_R	lduw	[%r23 + %r0], %r29
T2_asi_reg_wr_69:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 1377: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf05c8000  ! 1381: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_99:
	setx	0x2b0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d4601a  ! 1386: LDSHA_I	ldsha	[%r17, + 0x001a] %asi, %r24
cpu_intr_2_100:
	setx	0x280122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83952191  ! 1388: WRPR_TNPC_I	wrpr	%r20, 0x0191, %tnpc
	.word 0xf65d4000  ! 1391: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 1393: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_70:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 1397: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_101:
	setx	0x280115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 24)
	.word 0xf24d0000  ! 1408: LDSB_R	ldsb	[%r20 + %r0], %r25
cpu_intr_2_102:
	setx	0x2a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_103:
	setx	0x2a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60d8000  ! 1413: AND_R	and 	%r22, %r0, %r27
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_71:
	mov	0x17, %r14
	.word 0xfef38e40  ! 1416: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_72:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 1417: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_104:
	setx	0x29001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0xa, %r14
	.word 0xfedb8400  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4cd2178  ! 1421: LDSBA_I	ldsba	[%r20, + 0x0178] %asi, %r26
	.word 0xb63d4000  ! 1422: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xf8d50020  ! 1423: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r28
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_105:
	setx	0x29010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64dc000  ! 1426: LDSB_R	ldsb	[%r23 + %r0], %r27
T2_asi_reg_rd_71:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 1427: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0958020  ! 1429: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
T2_asi_reg_wr_73:
	mov	0x7, %r14
	.word 0xfef38e60  ! 1435: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe442117  ! 1436: LDSW_I	ldsw	[%r16 + 0x0117], %r31
	.word 0xbd345000  ! 1438: SRLX_R	srlx	%r17, %r0, %r30
	.word 0xf89461ae  ! 1441: LDUHA_I	lduha	[%r17, + 0x01ae] %asi, %r28
	.word 0xf084a080  ! 1443: LDUWA_I	lduwa	[%r18, + 0x0080] %asi, %r24
	.word 0xf05d21d4  ! 1447: LDX_I	ldx	[%r20 + 0x01d4], %r24
T2_asi_reg_rd_72:
	mov	0x18, %r14
	.word 0xfadb84a0  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfc94a0a3  ! 1451: LDUHA_I	lduha	[%r18, + 0x00a3] %asi, %r30
	.word 0xb635a15f  ! 1452: ORN_I	orn 	%r22, 0x015f, %r27
	.word 0xfcc5e025  ! 1453: LDSWA_I	ldswa	[%r23, + 0x0025] %asi, %r30
	.word 0xf0cd8020  ! 1454: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
cpu_intr_2_106:
	setx	0x2b0124, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_74:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 1458: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_107:
	setx	0x29002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0552050  ! 1463: LDSH_I	ldsh	[%r20 + 0x0050], %r24
	.word 0xfec44020  ! 1466: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xfcd5e13c  ! 1467: LDSHA_I	ldsha	[%r23, + 0x013c] %asi, %r30
T2_asi_reg_wr_75:
	mov	0x10, %r14
	.word 0xf6f38400  ! 1472: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2cc8020  ! 1479: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf2cd0020  ! 1482: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xfa450000  ! 1483: LDSW_R	ldsw	[%r20 + %r0], %r29
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_108:
	setx	0x2a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x2a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6854020  ! 1496: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
	.word 0xf605a171  ! 1498: LDUW_I	lduw	[%r22 + 0x0171], %r27
T2_asi_reg_rd_73:
	mov	0x11, %r14
	.word 0xf8db8e60  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf04c61e5  ! 1501: LDSB_I	ldsb	[%r17 + 0x01e5], %r24
	.word 0xfe54c000  ! 1503: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf4c4a0b1  ! 1504: LDSWA_I	ldswa	[%r18, + 0x00b1] %asi, %r26
	.word 0xb2bda0c4  ! 1505: XNORcc_I	xnorcc 	%r22, 0x00c4, %r25
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf405e109  ! 1509: LDUW_I	lduw	[%r23 + 0x0109], %r26
	.word 0xb2bce081  ! 1513: XNORcc_I	xnorcc 	%r19, 0x0081, %r25
	.word 0xfe95c020  ! 1514: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xbd2c9000  ! 1516: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xb2a44000  ! 1517: SUBcc_R	subcc 	%r17, %r0, %r25
cpu_intr_2_110:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_76:
	mov	0xb, %r14
	.word 0xfef389e0  ! 1525: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_77:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 1526: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf415c000  ! 1528: LDUH_R	lduh	[%r23 + %r0], %r26
T2_asi_reg_rd_74:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 1529: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_111:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d58020  ! 1534: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xf805e02e  ! 1535: LDUW_I	lduw	[%r23 + 0x002e], %r28
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xb1348000  ! 1538: SRL_R	srl 	%r18, %r0, %r24
cpu_intr_2_112:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 28)
	.word 0xf05ca094  ! 1547: LDX_I	ldx	[%r18 + 0x0094], %r24
	.word 0xf855a025  ! 1548: LDSH_I	ldsh	[%r22 + 0x0025], %r28
	.word 0xf65d4000  ! 1551: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf2c44020  ! 1554: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
T2_asi_reg_rd_75:
	mov	0x32, %r14
	.word 0xf0db8400  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_76:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa4420ef  ! 1559: LDSW_I	ldsw	[%r16 + 0x00ef], %r29
	.word 0xfec5e111  ! 1564: LDSWA_I	ldswa	[%r23, + 0x0111] %asi, %r31
T2_asi_reg_rd_77:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_78:
	mov	0x24, %r14
	.word 0xfef389e0  ! 1567: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfa44a037  ! 1578: LDSW_I	ldsw	[%r18 + 0x0037], %r29
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 2f)
	.word 0xba2c4000  ! 1580: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xf08c61ba  ! 1582: LDUBA_I	lduba	[%r17, + 0x01ba] %asi, %r24
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_113:
	setx	0x290105, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_79:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1587: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfed50020  ! 1588: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
T2_asi_reg_wr_80:
	mov	0x37, %r14
	.word 0xfcf38400  ! 1592: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb72ca001  ! 1595: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xf4d5e188  ! 1596: LDSHA_I	ldsha	[%r23, + 0x0188] %asi, %r26
	.word 0xf81461f0  ! 1597: LDUH_I	lduh	[%r17 + 0x01f0], %r28
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_TO_TL1
	.word 0xf64dc000  ! 1601: LDSB_R	ldsb	[%r23 + %r0], %r27
cpu_intr_2_114:
	setx	0x2a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c4020  ! 1603: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
	.word 0xf25521b5  ! 1607: LDSH_I	ldsh	[%r20 + 0x01b5], %r25
	.word 0xfac4e1d0  ! 1608: LDSWA_I	ldswa	[%r19, + 0x01d0] %asi, %r29
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_115:
	setx	0x280311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34a001  ! 1614: SRL_I	srl 	%r18, 0x0001, %r29
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_116:
	setx	0x2b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1620: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8058000  ! 1622: LDUW_R	lduw	[%r22 + %r0], %r28
T2_asi_reg_wr_82:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 1623: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb8a44000  ! 1625: SUBcc_R	subcc 	%r17, %r0, %r28
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 0)
	.word 0xfe4dc000  ! 1629: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xfa0d0000  ! 1634: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xb83d20e2  ! 1635: XNOR_I	xnor 	%r20, 0x00e2, %r28
T2_asi_reg_rd_78:
	mov	0x4, %r14
	.word 0xf8db8e80  ! 1636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_117:
	setx	0x2a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 35)
	.word 0xf8c50020  ! 1645: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 3)
	.word 0xf844c000  ! 1652: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf2cc8020  ! 1653: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	.word 0xfa5d4000  ! 1655: LDX_R	ldx	[%r21 + %r0], %r29
cpu_intr_2_118:
	setx	0x2a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c0000  ! 1657: LDUB_R	ldub	[%r16 + %r0], %r31
T2_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_80:
	mov	0x4, %r14
	.word 0xf2db8400  ! 1661: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_119:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55e118  ! 1665: LDSH_I	ldsh	[%r23 + 0x0118], %r29
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_83:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 1667: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbb7d4400  ! 1669: MOVR_R	movre	%r21, %r0, %r29
	.word 0xfc0ce045  ! 1671: LDUB_I	ldub	[%r19 + 0x0045], %r30
	.word 0xf404a0f1  ! 1672: LDUW_I	lduw	[%r18 + 0x00f1], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_81:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb805c000  ! 1676: ADD_R	add 	%r23, %r0, %r28
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 19)
	.word 0xb01c4000  ! 1682: XOR_R	xor 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_120:
	setx	0x2b0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa55c000  ! 1690: LDSH_R	ldsh	[%r23 + %r0], %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_82:
	mov	0x28, %r14
	.word 0xf8db89e0  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 17)
	.word 0xbc252193  ! 1701: SUB_I	sub 	%r20, 0x0193, %r30
	.word 0xb535d000  ! 1703: SRLX_R	srlx	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa5c000  ! 1710: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xf45de169  ! 1711: LDX_I	ldx	[%r23 + 0x0169], %r26
	.word 0xf65ca0ae  ! 1712: LDX_I	ldx	[%r18 + 0x00ae], %r27
	.word 0xfa4c61f9  ! 1713: LDSB_I	ldsb	[%r17 + 0x01f9], %r29
cpu_intr_2_121:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_83:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 1716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf04da04c  ! 1717: LDSB_I	ldsb	[%r22 + 0x004c], %r24
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_122:
	setx	0x29011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9c0000  ! 1723: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xfe1461dd  ! 1724: LDUH_I	lduh	[%r17 + 0x01dd], %r31
	.word 0xb48c2106  ! 1726: ANDcc_I	andcc 	%r16, 0x0106, %r26
	.word 0xf2440000  ! 1728: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf205e14e  ! 1729: LDUW_I	lduw	[%r23 + 0x014e], %r25
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 32)
	.word 0xf4144000  ! 1732: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf05c4000  ! 1739: LDX_R	ldx	[%r17 + %r0], %r24
T2_asi_reg_rd_84:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_123:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c20ed  ! 1744: LDUB_I	ldub	[%r16 + 0x00ed], %r25
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_84:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 1746: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf24560d4  ! 1747: LDSW_I	ldsw	[%r21 + 0x00d4], %r25
	.word 0xfc554000  ! 1749: LDSH_R	ldsh	[%r21 + %r0], %r30
T2_asi_reg_wr_85:
	mov	0xa, %r14
	.word 0xf2f38e80  ! 1752: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983992  ! 1758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1992, %hpstate
cpu_intr_2_124:
	setx	0x290027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc50020  ! 1760: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2056014  ! 1763: LDUW_I	lduw	[%r21 + 0x0014], %r25
cpu_intr_2_125:
	setx	0x28011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_126:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_85:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf095211c  ! 1773: LDUHA_I	lduha	[%r20, + 0x011c] %asi, %r24
	.word 0xbb50c000  ! 1775: RDPR_TT	<illegal instruction>
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, e)
	.word 0xfe8d4020  ! 1780: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_127:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_128:
	setx	0x2b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 1787: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf4d4a18f  ! 1789: LDSHA_I	ldsha	[%r18, + 0x018f] %asi, %r26
	.word 0xfa94619e  ! 1790: LDUHA_I	lduha	[%r17, + 0x019e] %asi, %r29
T2_asi_reg_wr_87:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 1795: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf88c4020  ! 1797: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
cpu_intr_2_129:
	setx	0x2a0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, e)
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 0)
	.word 0xfc5c8000  ! 1804: LDX_R	ldx	[%r18 + %r0], %r30
T2_asi_reg_wr_88:
	mov	0x13, %r14
	.word 0xf4f384a0  ! 1805: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_87:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_89:
	mov	0x15, %r14
	.word 0xfcf38400  ! 1812: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_130:
	setx	0x2e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x2d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_90:
	mov	0x20, %r14
	.word 0xfcf38400  ! 1824: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_91:
	mov	0x4, %r14
	.word 0xf6f384a0  ! 1827: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfc5dc000  ! 1828: LDX_R	ldx	[%r23 + %r0], %r30
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, d)
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a82  ! 1833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a82, %hpstate
	.word 0xfc8c0020  ! 1835: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_92:
	mov	0x17, %r14
	.word 0xfaf389e0  ! 1839: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xba052169  ! 1843: ADD_I	add 	%r20, 0x0169, %r29
	.word 0xbc3460e7  ! 1844: SUBC_I	orn 	%r17, 0x00e7, %r30
T2_asi_reg_wr_93:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1846: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1849: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb63d6196  ! 1851: XNOR_I	xnor 	%r21, 0x0196, %r27
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_95:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 1854: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_88:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfeccc020  ! 1860: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xf4844020  ! 1861: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xfc4d0000  ! 1866: LDSB_R	ldsb	[%r20 + %r0], %r30
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6558000  ! 1874: LDSH_R	ldsh	[%r22 + %r0], %r27
T2_asi_reg_rd_89:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbeb50000  ! 1880: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xf48de037  ! 1886: LDUBA_I	lduba	[%r23, + 0x0037] %asi, %r26
cpu_intr_2_132:
	setx	0x2e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c44020  ! 1891: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_96:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 1894: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_90:
	mov	0x4, %r14
	.word 0xfcdb8400  ! 1896: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_97:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 1897: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_wr_98:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 1900: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa04e0e6  ! 1902: LDUW_I	lduw	[%r19 + 0x00e6], %r29
T2_asi_reg_wr_99:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1903: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_133:
	setx	0x2c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfacda13d  ! 1908: LDSBA_I	ldsba	[%r22, + 0x013d] %asi, %r29
	.word 0xfe540000  ! 1909: LDSH_R	ldsh	[%r16 + %r0], %r31
T2_asi_reg_rd_91:
	mov	0x2, %r14
	.word 0xf4db8400  ! 1913: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf00dc000  ! 1914: LDUB_R	ldub	[%r23 + %r0], %r24
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_134:
	setx	0x2c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d8000  ! 1920: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf6542192  ! 1921: LDSH_I	ldsh	[%r16 + 0x0192], %r27
	.word 0xf28d0020  ! 1922: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
T2_asi_reg_rd_92:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_135:
	setx	0x2c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc58020  ! 1925: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0cc4020  ! 1927: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	.word 0xfa04e1de  ! 1928: LDUW_I	lduw	[%r19 + 0x01de], %r29
T2_asi_reg_wr_100:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 1929: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_136:
	setx	0x2e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40421ec  ! 1933: LDUW_I	lduw	[%r16 + 0x01ec], %r26
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 24)
	.word 0xf4cca072  ! 1940: LDSBA_I	ldsba	[%r18, + 0x0072] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_137:
	setx	0x2f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_101:
	mov	0x11, %r14
	.word 0xfaf384a0  ! 1945: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf885611a  ! 1946: LDUWA_I	lduwa	[%r21, + 0x011a] %asi, %r28
	.word 0xfe840020  ! 1948: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xfc8d8020  ! 1949: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
	.word 0xf0d5e067  ! 1952: LDSHA_I	ldsha	[%r23, + 0x0067] %asi, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf6cc4020  ! 1954: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_102:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 1955: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xba9cc000  ! 1956: XORcc_R	xorcc 	%r19, %r0, %r29
cpu_intr_2_138:
	setx	0x2f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac8000  ! 1960: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xfc45e0d0  ! 1961: LDSW_I	ldsw	[%r23 + 0x00d0], %r30
	.word 0xf6054000  ! 1963: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf855c000  ! 1968: LDSH_R	ldsh	[%r23 + %r0], %r28
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 18)
	.word 0xf08ca00e  ! 1974: LDUBA_I	lduba	[%r18, + 0x000e] %asi, %r24
	.word 0xf00d20d0  ! 1975: LDUB_I	ldub	[%r20 + 0x00d0], %r24
	.word 0xf04c60d8  ! 1980: LDSB_I	ldsb	[%r17 + 0x00d8], %r24
cpu_intr_2_139:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 1983: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_93:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, f)
	.word 0xf60c6064  ! 1988: LDUB_I	ldub	[%r17 + 0x0064], %r27
T2_asi_reg_rd_94:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 1989: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2c58020  ! 1993: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 18)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c50  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c50, %hpstate
	.word 0xf0cd60a6  ! 2004: LDSBA_I	ldsba	[%r21, + 0x00a6] %asi, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xb0a54000  ! 2006: SUBcc_R	subcc 	%r21, %r0, %r24
cpu_intr_2_140:
	setx	0x2c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15a1ca  ! 2008: LDUH_I	lduh	[%r22 + 0x01ca], %r31
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf845a14e  ! 2013: LDSW_I	ldsw	[%r22 + 0x014e], %r28
	.word 0xb02ca08f  ! 2015: ANDN_I	andn 	%r18, 0x008f, %r24
	.word 0xb43c4000  ! 2016: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xfe55a11d  ! 2017: LDSH_I	ldsh	[%r22 + 0x011d], %r31
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f1a  ! 2021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
cpu_intr_2_141:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de009  ! 2030: LDX_I	ldx	[%r23 + 0x0009], %r27
	.word 0xf2d58020  ! 2031: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xfec48020  ! 2034: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_142:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_104:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 2038: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_143:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 2047: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xb97c0400  ! 2048: MOVR_R	movre	%r16, %r0, %r28
	.word 0xfa4561ee  ! 2050: LDSW_I	ldsw	[%r21 + 0x01ee], %r29
	.word 0xf2cca13e  ! 2052: LDSBA_I	ldsba	[%r18, + 0x013e] %asi, %r25
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_HPRIV
cpu_intr_2_144:
	setx	0x2c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5c020  ! 2058: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa1460ad  ! 2064: LDUH_I	lduh	[%r17 + 0x00ad], %r29
T2_asi_reg_wr_105:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 2065: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf805e14e  ! 2066: LDUW_I	lduw	[%r23 + 0x014e], %r28
	.word 0xb1353001  ! 2067: SRLX_I	srlx	%r20, 0x0001, %r24
T2_asi_reg_wr_106:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 2068: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_145:
	setx	0x2d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_146:
	setx	0x2e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_147:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8558000  ! 2084: LDSH_R	ldsh	[%r22 + %r0], %r28
T2_asi_reg_rd_95:
	mov	0x10, %r14
	.word 0xf4db8e60  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf814a092  ! 2086: LDUH_I	lduh	[%r18 + 0x0092], %r28
	.word 0xbc3da1b5  ! 2087: XNOR_I	xnor 	%r22, 0x01b5, %r30
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_107:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 2091: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6c48020  ! 2092: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_108:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 2093: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_109:
	mov	0x18, %r14
	.word 0xf4f38400  ! 2095: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfe05c000  ! 2096: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf6cc4020  ! 2098: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xfa94e029  ! 2100: LDUHA_I	lduha	[%r19, + 0x0029] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b82  ! 2102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
cpu_intr_2_148:
	setx	0x2f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d60a4  ! 2114: LDSB_I	ldsb	[%r21 + 0x00a4], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8358000  ! 2117: SUBC_R	orn 	%r22, %r0, %r28
	.word 0xb7641800  ! 2118: MOVcc_R	<illegal instruction>
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198394a  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
T2_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 2121: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf895605b  ! 2122: LDUHA_I	lduha	[%r21, + 0x005b] %asi, %r28
T2_asi_reg_rd_97:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf08d61ac  ! 2125: LDUBA_I	lduba	[%r21, + 0x01ac] %asi, %r24
T2_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 2126: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_150:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf88cc020  ! 2132: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
	.word 0xf48cc020  ! 2133: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
	.word 0xfe85616b  ! 2135: LDUWA_I	lduwa	[%r21, + 0x016b] %asi, %r31
	.word 0xfa0d8000  ! 2136: LDUB_R	ldub	[%r22 + %r0], %r29
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d10  ! 2137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
	.word 0xf854a118  ! 2138: LDSH_I	ldsh	[%r18 + 0x0118], %r28
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_151:
	setx	0x2e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204e0d2  ! 2144: LDUW_I	lduw	[%r19 + 0x00d2], %r25
	.word 0xf04d4000  ! 2146: LDSB_R	ldsb	[%r21 + %r0], %r24
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_111:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 2154: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2156: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 9)
	.word 0xf20ca07b  ! 2161: LDUB_I	ldub	[%r18 + 0x007b], %r25
T2_asi_reg_rd_98:
	mov	0x2f, %r14
	.word 0xf2db89e0  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf85ce136  ! 2164: LDX_I	ldx	[%r19 + 0x0136], %r28
T2_asi_reg_wr_113:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 2165: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbd518000  ! 2166: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb8348000  ! 2169: ORN_R	orn 	%r18, %r0, %r28
	.word 0xf614c000  ! 2170: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf2cda131  ! 2171: LDSBA_I	ldsba	[%r22, + 0x0131] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a12  ! 2174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a12, %hpstate
	.word 0xf245a161  ! 2175: LDSW_I	ldsw	[%r22 + 0x0161], %r25
	.word 0xf40da08a  ! 2181: LDUB_I	ldub	[%r22 + 0x008a], %r26
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_152:
	setx	0x2f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf884e163  ! 2187: LDUWA_I	lduwa	[%r19, + 0x0163] %asi, %r28
cpu_intr_2_154:
	setx	0x2d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_155:
	setx	0x2c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x10, %r14
	.word 0xf8db8400  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4440000  ! 2199: LDSW_R	ldsw	[%r16 + %r0], %r26
cpu_intr_2_156:
	setx	0x2f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d60f3  ! 2204: LDUBA_I	lduba	[%r21, + 0x00f3] %asi, %r31
T2_asi_reg_wr_114:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 2206: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_115:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 2210: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe5da1d2  ! 2215: LDX_I	ldx	[%r22 + 0x01d2], %r31
	ta	T_CHANGE_HPRIV
	.word 0xfa8d2040  ! 2222: LDUBA_I	lduba	[%r20, + 0x0040] %asi, %r29
cpu_intr_2_157:
	setx	0x2e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_158:
	setx	0x2d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_116:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 2236: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_160:
	setx	0x10121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_161:
	setx	0x2e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_117:
	mov	0xd, %r14
	.word 0xf8f38400  ! 2247: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc5c4000  ! 2249: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xfc45e115  ! 2251: LDSW_I	ldsw	[%r23 + 0x0115], %r30
cpu_intr_2_162:
	setx	0x2d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 2255: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf88d0020  ! 2256: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
	.word 0xfa5c0000  ! 2257: LDX_R	ldx	[%r16 + %r0], %r29
T2_asi_reg_rd_100:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 2259: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf8442168  ! 2260: LDSW_I	ldsw	[%r16 + 0x0168], %r28
cpu_intr_2_163:
	setx	0x2d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_118:
	mov	0x1e, %r14
	.word 0xf0f384a0  ! 2267: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfccdc020  ! 2278: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
	.word 0xf48521bf  ! 2279: LDUWA_I	lduwa	[%r20, + 0x01bf] %asi, %r26
cpu_intr_2_164:
	setx	0x3023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0850020  ! 2281: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	.word 0xf8c4e10d  ! 2282: LDSWA_I	ldswa	[%r19, + 0x010d] %asi, %r28
cpu_intr_2_165:
	setx	0x2c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 7)
	.word 0xf2cc20cf  ! 2286: LDSBA_I	ldsba	[%r16, + 0x00cf] %asi, %r25
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_TO_TL1
	.word 0xf254e14e  ! 2297: LDSH_I	ldsh	[%r19 + 0x014e], %r25
	.word 0xf6c40020  ! 2299: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
	.word 0xf8cd217e  ! 2301: LDSBA_I	ldsba	[%r20, + 0x017e] %asi, %r28
T2_asi_reg_rd_101:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf814c000  ! 2304: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf8c5e1e3  ! 2305: LDSWA_I	ldswa	[%r23, + 0x01e3] %asi, %r28
T2_asi_reg_wr_119:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 2306: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfa5c6128  ! 2307: LDX_I	ldx	[%r17 + 0x0128], %r29
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8cc4020  ! 2309: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 36)
	.word 0xf20c202e  ! 2312: LDUB_I	ldub	[%r16 + 0x002e], %r25
	.word 0xf4c560c0  ! 2313: LDSWA_I	ldswa	[%r21, + 0x00c0] %asi, %r26
cpu_intr_2_166:
	setx	0x330207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055a01e  ! 2316: LDSH_I	ldsh	[%r22 + 0x001e], %r24
T2_asi_reg_rd_102:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 2318: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2d44020  ! 2319: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	.word 0xfa44c000  ! 2322: LDSW_R	ldsw	[%r19 + %r0], %r29
T2_asi_reg_rd_103:
	mov	0xd, %r14
	.word 0xf0db8400  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_104:
	mov	0x36, %r14
	.word 0xf2db8400  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_105:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2333: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_167:
	setx	0x310307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dd602d  ! 2338: LDXA_I	ldxa	[%r21, + 0x002d] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf2848020  ! 2341: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
cpu_intr_2_168:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05de04d  ! 2344: LDX_I	ldx	[%r23 + 0x004d], %r24
T2_asi_reg_wr_120:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 2347: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_169:
	setx	0x300004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_106:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_121:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 2355: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0dc60b0  ! 2358: LDXA_I	ldxa	[%r17, + 0x00b0] %asi, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf245211b  ! 2360: LDSW_I	ldsw	[%r20 + 0x011b], %r25
T2_asi_reg_wr_122:
	mov	0x28, %r14
	.word 0xf4f38e60  ! 2361: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_107:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_123:
	mov	0x6, %r14
	.word 0xfcf38e60  ! 2367: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf8844020  ! 2369: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xf054c000  ! 2371: LDSH_R	ldsh	[%r19 + %r0], %r24
T2_asi_reg_rd_108:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_109:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf2148000  ! 2376: LDUH_R	lduh	[%r18 + %r0], %r25
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_170:
	setx	0x32032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15a06a  ! 2383: LDUH_I	lduh	[%r22 + 0x006a], %r31
	.word 0xb604c000  ! 2384: ADD_R	add 	%r19, %r0, %r27
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_110:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_111:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 2396: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_171:
	setx	0x310218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2398: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_172:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68ce136  ! 2405: LDUBA_I	lduba	[%r19, + 0x0136] %asi, %r27
	.word 0xfa8d0020  ! 2406: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_126:
	mov	0x26, %r14
	.word 0xfaf38e60  ! 2411: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfe4c61e2  ! 2415: LDSB_I	ldsb	[%r17 + 0x01e2], %r31
	ta	T_CHANGE_HPRIV
	.word 0xf88d8020  ! 2417: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_113:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf24d4000  ! 2419: LDSB_R	ldsb	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0xf60d0000  ! 2422: LDUB_R	ldub	[%r20 + %r0], %r27
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 14)
	.word 0xf84ca0c6  ! 2424: LDSB_I	ldsb	[%r18 + 0x00c6], %r28
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, f)
	.word 0xf45da1ca  ! 2426: LDX_I	ldx	[%r22 + 0x01ca], %r26
T2_asi_reg_wr_127:
	mov	0x1f, %r14
	.word 0xf4f38400  ! 2427: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_114:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_173:
	setx	0x330128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55a13c  ! 2431: LDSH_I	ldsh	[%r22 + 0x013c], %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_128:
	mov	0x1e, %r14
	.word 0xfef38400  ! 2433: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf28c61da  ! 2434: LDUBA_I	lduba	[%r17, + 0x01da] %asi, %r25
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_174:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295a1f5  ! 2442: LDUHA_I	lduha	[%r22, + 0x01f5] %asi, %r25
cpu_intr_2_175:
	setx	0x320015, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_129:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 2444: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2445: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_176:
	setx	0x320034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819460fd  ! 2451: WRPR_TPC_I	wrpr	%r17, 0x00fd, %tpc
	.word 0xbb7c0400  ! 2453: MOVR_R	movre	%r16, %r0, %r29
T2_asi_reg_rd_115:
	mov	0x18, %r14
	.word 0xf4db8e60  ! 2454: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_177:
	setx	0x310125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_131:
	mov	0x36, %r14
	.word 0xf8f38400  ! 2458: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf28c0020  ! 2471: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_178:
	setx	0x320336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac42153  ! 2477: LDSWA_I	ldswa	[%r16, + 0x0153] %asi, %r29
	.word 0xf8856122  ! 2481: LDUWA_I	lduwa	[%r21, + 0x0122] %asi, %r28
cpu_intr_2_179:
	setx	0x30031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c208e  ! 2485: LDUB_I	ldub	[%r16 + 0x008e], %r30
	.word 0xfc8dc020  ! 2486: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_132:
	mov	0x11, %r14
	.word 0xfef384a0  ! 2489: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_180:
	setx	0x300224, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 2492: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_181:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_116:
	mov	0xe, %r14
	.word 0xfedb8400  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf0854020  ! 2497: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	.word 0xf84c8000  ! 2498: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xfc85c020  ! 2499: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_117:
	mov	0x2b, %r14
	.word 0xf2db8400  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_134:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 2509: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_182:
	setx	0x33013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_135:
	mov	0x19, %r14
	.word 0xfaf389e0  ! 2514: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1540000  ! 2516: RDPR_GL	<illegal instruction>
	.word 0xf04c61af  ! 2519: LDSB_I	ldsb	[%r17 + 0x01af], %r24
	.word 0xfc4de044  ! 2523: LDSB_I	ldsb	[%r23 + 0x0044], %r30
	.word 0xfcdca060  ! 2525: LDXA_I	ldxa	[%r18, + 0x0060] %asi, %r30
T2_asi_reg_rd_118:
	mov	0x14, %r14
	.word 0xfedb8e60  ! 2527: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa84e1f8  ! 2531: LDUWA_I	lduwa	[%r19, + 0x01f8] %asi, %r29
cpu_intr_2_183:
	setx	0x310021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa146170  ! 2534: LDUH_I	lduh	[%r17 + 0x0170], %r29
	.word 0xf015e13a  ! 2546: LDUH_I	lduh	[%r23 + 0x013a], %r24
	.word 0xf45da086  ! 2548: LDX_I	ldx	[%r22 + 0x0086], %r26
	.word 0xf44d0000  ! 2550: LDSB_R	ldsb	[%r20 + %r0], %r26
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 15)
	.word 0xbe2d8000  ! 2553: ANDN_R	andn 	%r22, %r0, %r31
	.word 0xf405c000  ! 2554: LDUW_R	lduw	[%r23 + %r0], %r26
cpu_intr_2_184:
	setx	0x330020, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_136:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 2557: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_137:
	mov	0x37, %r14
	.word 0xf0f384a0  ! 2562: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc5da041  ! 2567: LDX_I	ldx	[%r22 + 0x0041], %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_185:
	setx	0x300229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_120:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfad5e091  ! 2575: LDSHA_I	ldsha	[%r23, + 0x0091] %asi, %r29
	.word 0xf05dc000  ! 2576: LDX_R	ldx	[%r23 + %r0], %r24
T2_asi_reg_rd_121:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6c58020  ! 2579: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	.word 0xf40c2171  ! 2580: LDUB_I	ldub	[%r16 + 0x0171], %r26
T2_asi_reg_wr_138:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 2583: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6554000  ! 2585: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xfa040000  ! 2586: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfa0d20d9  ! 2587: LDUB_I	ldub	[%r20 + 0x00d9], %r29
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_186:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8954020  ! 2592: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	.word 0xfc4521c7  ! 2593: LDSW_I	ldsw	[%r20 + 0x01c7], %r30
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_187:
	setx	0x33013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234e1d6  ! 2607: ORN_I	orn 	%r19, 0x01d6, %r25
cpu_intr_2_188:
	setx	0x330103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d21ca  ! 2611: AND_I	and 	%r20, 0x01ca, %r28
cpu_intr_2_189:
	setx	0x300039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c4000  ! 2616: LDX_R	ldx	[%r17 + %r0], %r26
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_190:
	setx	0x31003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2550000  ! 2621: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xfe0c0000  ! 2624: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xfe550000  ! 2627: LDSH_R	ldsh	[%r20 + %r0], %r31
T2_asi_reg_wr_139:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 2631: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8c4a079  ! 2632: LDSWA_I	ldswa	[%r18, + 0x0079] %asi, %r28
	.word 0xf84c612e  ! 2634: LDSB_I	ldsb	[%r17 + 0x012e], %r28
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_191:
	setx	0x320115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_192:
	setx	0x330129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 3a)
	.word 0xba35616f  ! 2645: SUBC_I	orn 	%r21, 0x016f, %r29
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
	.word 0xb2952118  ! 2651: ORcc_I	orcc 	%r20, 0x0118, %r25
	.word 0xf0550000  ! 2655: LDSH_R	ldsh	[%r20 + %r0], %r24
T2_asi_reg_wr_140:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 2657: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb2c4a0db  ! 2658: ADDCcc_I	addccc 	%r18, 0x00db, %r25
	.word 0xf44d611a  ! 2660: LDSB_I	ldsb	[%r21 + 0x011a], %r26
	.word 0xf8c52013  ! 2661: LDSWA_I	ldswa	[%r20, + 0x0013] %asi, %r28
T2_asi_reg_rd_122:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa8d8020  ! 2667: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_193:
	setx	0x30003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa948020  ! 2678: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
cpu_intr_2_194:
	setx	0x300137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc346152  ! 2683: SUBC_I	orn 	%r17, 0x0152, %r30
T2_asi_reg_wr_141:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 2684: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_195:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 2696: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6d4a17f  ! 2698: LDSHA_I	ldsha	[%r18, + 0x017f] %asi, %r27
	.word 0xf8958020  ! 2699: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
cpu_intr_2_196:
	setx	0x332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc844020  ! 2701: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
	.word 0xfe4c6090  ! 2702: LDSB_I	ldsb	[%r17 + 0x0090], %r31
	.word 0xf4cd619d  ! 2703: LDSBA_I	ldsba	[%r21, + 0x019d] %asi, %r26
	.word 0xf84c20f4  ! 2704: LDSB_I	ldsb	[%r16 + 0x00f4], %r28
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb835600d  ! 2709: ORN_I	orn 	%r21, 0x000d, %r28
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_124:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_197:
	setx	0x32033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_198:
	setx	0x320310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1)
	.word 0xfacd8020  ! 2723: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xb2b4e05b  ! 2724: ORNcc_I	orncc 	%r19, 0x005b, %r25
cpu_intr_2_199:
	setx	0x320124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05de1c2  ! 2727: LDX_I	ldx	[%r23 + 0x01c2], %r24
T2_asi_reg_rd_125:
	mov	0x2b, %r14
	.word 0xf0db8e40  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf655e0d5  ! 2731: LDSH_I	ldsh	[%r23 + 0x00d5], %r27
cpu_intr_2_200:
	setx	0x33012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04a0df  ! 2733: LDUW_I	lduw	[%r18 + 0x00df], %r29
	.word 0xf4d54020  ! 2734: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
	.word 0xbcb5e14f  ! 2735: ORNcc_I	orncc 	%r23, 0x014f, %r30
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 3)
	.word 0xb53da001  ! 2737: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb2bc204a  ! 2739: XNORcc_I	xnorcc 	%r16, 0x004a, %r25
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_201:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb485a106  ! 2751: ADDcc_I	addcc 	%r22, 0x0106, %r26
cpu_intr_2_202:
	setx	0x360324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4c020  ! 2754: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf6cc6098  ! 2758: LDSBA_I	ldsba	[%r17, + 0x0098] %asi, %r27
T2_asi_reg_wr_142:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 2760: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa8d8020  ! 2763: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0d5e16f  ! 2772: LDSHA_I	ldsha	[%r23, + 0x016f] %asi, %r24
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 5)
	.word 0xb2c50000  ! 2777: ADDCcc_R	addccc 	%r20, %r0, %r25
cpu_intr_2_203:
	setx	0x340332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2454000  ! 2779: ADDC_R	addc 	%r21, %r0, %r25
cpu_intr_2_204:
	setx	0x350039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 32)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982fd0  ! 2782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xf4d4a1cc  ! 2783: LDSHA_I	ldsha	[%r18, + 0x01cc] %asi, %r26
	.word 0xb20c8000  ! 2784: AND_R	and 	%r18, %r0, %r25
	.word 0xf4c420f4  ! 2785: LDSWA_I	ldswa	[%r16, + 0x00f4] %asi, %r26
T2_asi_reg_rd_126:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_205:
	setx	0x370031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_206:
	setx	0x360228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2850020  ! 2802: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	.word 0xbe4460ff  ! 2803: ADDC_I	addc 	%r17, 0x00ff, %r31
T2_asi_reg_rd_127:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb61cc000  ! 2806: XOR_R	xor 	%r19, %r0, %r27
cpu_intr_2_207:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 2813: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_208:
	setx	0x36030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_209:
	setx	0x340024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_210:
	setx	0x340109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81dc000  ! 2820: XOR_R	xor 	%r23, %r0, %r28
cpu_intr_2_211:
	setx	0x37001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x30, %r14
	.word 0xfaf389e0  ! 2825: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_144:
	mov	0xc, %r14
	.word 0xf4f389e0  ! 2828: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_212:
	setx	0x34030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_213:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ccc020  ! 2833: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	.word 0xfecc0020  ! 2834: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbabd6019  ! 2838: XNORcc_I	xnorcc 	%r21, 0x0019, %r29
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_214:
	setx	0x350326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8dc020  ! 2844: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
T2_asi_reg_rd_129:
	mov	0x33, %r14
	.word 0xfcdb89e0  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_215:
	setx	0x370008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c21b1  ! 2848: LDUB_I	ldub	[%r16 + 0x01b1], %r25
	.word 0xfc050000  ! 2849: LDUW_R	lduw	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_216:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf854a0a6  ! 2857: LDSH_I	ldsh	[%r18 + 0x00a6], %r28
	.word 0xf00c8000  ! 2858: LDUB_R	ldub	[%r18 + %r0], %r24
cpu_intr_2_217:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 2862: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xfc0d4000  ! 2866: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xbe040000  ! 2867: ADD_R	add 	%r16, %r0, %r31
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_145:
	mov	0x3, %r14
	.word 0xfef384a0  ! 2870: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_146:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2871: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_130:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_131:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 28)
	.word 0xf6dca07f  ! 2876: LDXA_I	ldxa	[%r18, + 0x007f] %asi, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_218:
	setx	0x34002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c48020  ! 2882: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xfc0c0000  ! 2883: LDUB_R	ldub	[%r16 + %r0], %r30
cpu_intr_2_219:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dd617f  ! 2885: LDXA_I	ldxa	[%r21, + 0x017f] %asi, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_220:
	setx	0x36031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8952161  ! 2892: LDUHA_I	lduha	[%r20, + 0x0161] %asi, %r28
	.word 0xfe4d0000  ! 2895: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf88d8020  ! 2897: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 24)
	.word 0xf8858020  ! 2900: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_132:
	mov	0x1e, %r14
	.word 0xfadb8400  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf28da007  ! 2902: LDUBA_I	lduba	[%r22, + 0x0007] %asi, %r25
	.word 0xfe4ce1e6  ! 2904: LDSB_I	ldsb	[%r19 + 0x01e6], %r31
cpu_intr_2_221:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_222:
	setx	0x34030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d0000  ! 2907: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xb4b5216a  ! 2908: ORNcc_I	orncc 	%r20, 0x016a, %r26
T2_asi_reg_rd_133:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0d4c020  ! 2912: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
	.word 0x91942178  ! 2913: WRPR_PIL_I	wrpr	%r16, 0x0178, %pil
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_223:
	setx	0x360131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_135:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_136:
	mov	0x31, %r14
	.word 0xf4db8e60  ! 2922: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_147:
	mov	0x5, %r14
	.word 0xf4f38e60  ! 2923: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_148:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2924: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_149:
	mov	0x14, %r14
	.word 0xfaf389e0  ! 2929: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_137:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 2932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_224:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d0000  ! 2935: LDX_R	ldx	[%r20 + %r0], %r28
T2_asi_reg_wr_150:
	mov	0x14, %r14
	.word 0xfaf38400  ! 2936: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_225:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54c000  ! 2938: LDSH_R	ldsh	[%r19 + %r0], %r29
T2_asi_reg_wr_151:
	mov	0xd, %r14
	.word 0xfef38400  ! 2939: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_138:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_226:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_227:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_139:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_152:
	mov	0x2c, %r14
	.word 0xf4f384a0  ! 2948: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbaac216a  ! 2951: ANDNcc_I	andncc 	%r16, 0x016a, %r29
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 24)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819839c8  ! 2956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c8, %hpstate
T2_asi_reg_wr_153:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 2959: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa8c8020  ! 2964: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 36)
	.word 0x81942165  ! 2967: WRPR_TPC_I	wrpr	%r16, 0x0165, %tpc
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e48  ! 2971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
T2_asi_reg_rd_140:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 26)
	.word 0x81956002  ! 2974: WRPR_TPC_I	wrpr	%r21, 0x0002, %tpc
	.word 0xf2cc0020  ! 2979: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_141:
	mov	0x2a, %r14
	.word 0xf8db8e80  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8450000  ! 2986: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 39)
	.word 0xf8858020  ! 2993: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xf08cc020  ! 2994: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
	.word 0xfa0d2079  ! 2998: LDUB_I	ldub	[%r20 + 0x0079], %r29
T2_asi_reg_rd_142:
	mov	0x6, %r14
	.word 0xfadb8e60  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_154:
	mov	0x1c, %r14
	.word 0xfcf38400  ! 3007: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc9c2078  ! 3011: XORcc_I	xorcc 	%r16, 0x0078, %r30
	.word 0xf254201b  ! 3012: LDSH_I	ldsh	[%r16 + 0x001b], %r25
T2_asi_reg_wr_155:
	mov	0x26, %r14
	.word 0xfef38e60  ! 3013: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 2)
	.word 0xb00d8000  ! 3017: AND_R	and 	%r22, %r0, %r24
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfac56160  ! 3023: LDSWA_I	ldswa	[%r21, + 0x0160] %asi, %r29
T2_asi_reg_rd_143:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_156:
	mov	0x12, %r14
	.word 0xf2f384a0  ! 3028: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_228:
	setx	0x35002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x350232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0x8595a064  ! 3033: WRPR_TSTATE_I	wrpr	%r22, 0x0064, %tstate
	.word 0xf6c4a1d1  ! 3034: LDSWA_I	ldswa	[%r18, + 0x01d1] %asi, %r27
cpu_intr_2_230:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_144:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0dd2003  ! 3048: LDXA_I	ldxa	[%r20, + 0x0003] %asi, %r24
	.word 0xf04c60f1  ! 3050: LDSB_I	ldsb	[%r17 + 0x00f1], %r24
T2_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 3051: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb88cc000  ! 3052: ANDcc_R	andcc 	%r19, %r0, %r28
cpu_intr_2_231:
	setx	0x370104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 35)
	.word 0xb6950000  ! 3059: ORcc_R	orcc 	%r20, %r0, %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f42  ! 3061: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
	.word 0xfa14c000  ! 3062: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0x89952015  ! 3063: WRPR_TICK_I	wrpr	%r20, 0x0015, %tick
	.word 0xf08d8020  ! 3065: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
cpu_intr_2_232:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0946136  ! 3072: LDUHA_I	lduha	[%r17, + 0x0136] %asi, %r24
	.word 0xbca54000  ! 3077: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb3641800  ! 3078: MOVcc_R	<illegal instruction>
cpu_intr_2_233:
	setx	0x350030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 28)
	.word 0xbe3c8000  ! 3082: XNOR_R	xnor 	%r18, %r0, %r31
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 25)
	.word 0xf24560a5  ! 3085: LDSW_I	ldsw	[%r21 + 0x00a5], %r25
	.word 0xfa5dc000  ! 3086: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xfe8c8020  ! 3087: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_158:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3091: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf295e010  ! 3092: LDUHA_I	lduha	[%r23, + 0x0010] %asi, %r25
	.word 0xb015c000  ! 3095: OR_R	or 	%r23, %r0, %r24
	.word 0xb3353001  ! 3096: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xfa94c020  ! 3099: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
cpu_intr_2_234:
	setx	0x350314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_235:
	setx	0x34013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b4c000  ! 3103: ORNcc_R	orncc 	%r19, %r0, %r24
T2_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_236:
	setx	0x350202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd61ab  ! 3117: XNORcc_I	xnorcc 	%r21, 0x01ab, %r27
	.word 0xbe9c6019  ! 3119: XORcc_I	xorcc 	%r17, 0x0019, %r31
	.word 0xf4cd2019  ! 3123: LDSBA_I	ldsba	[%r20, + 0x0019] %asi, %r26
T2_asi_reg_wr_159:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 3130: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf2d5e164  ! 3132: LDSHA_I	ldsha	[%r23, + 0x0164] %asi, %r25
	.word 0xfc85c020  ! 3133: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
	.word 0xf08cc020  ! 3134: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 33)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f4a  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_146:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4d560ed  ! 3143: LDSHA_I	ldsha	[%r21, + 0x00ed] %asi, %r26
	.word 0xf48c2191  ! 3145: LDUBA_I	lduba	[%r16, + 0x0191] %asi, %r26
T2_asi_reg_wr_160:
	mov	0x31, %r14
	.word 0xf6f38400  ! 3149: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 12)
	.word 0xb8146081  ! 3151: OR_I	or 	%r17, 0x0081, %r28
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 0)
	.word 0xf65d6054  ! 3153: LDX_I	ldx	[%r21 + 0x0054], %r27
	.word 0xf0448000  ! 3154: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0x8f902000  ! 3156: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T2_asi_reg_wr_161:
	mov	0x17, %r14
	.word 0xf0f389e0  ! 3157: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbf2c5000  ! 3158: SLLX_R	sllx	%r17, %r0, %r31
T2_asi_reg_rd_147:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 3161: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf64da15a  ! 3162: LDSB_I	ldsb	[%r22 + 0x015a], %r27
	.word 0x899520f4  ! 3164: WRPR_TICK_I	wrpr	%r20, 0x00f4, %tick
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf844c000  ! 3171: LDSW_R	ldsw	[%r19 + %r0], %r28
T2_asi_reg_wr_162:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 3173: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf25d60a6  ! 3175: LDX_I	ldx	[%r21 + 0x00a6], %r25
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 37)
	.word 0xf2d5612f  ! 3177: LDSHA_I	ldsha	[%r21, + 0x012f] %asi, %r25
	.word 0xfa0ce18f  ! 3181: LDUB_I	ldub	[%r19 + 0x018f], %r29
T2_asi_reg_wr_163:
	mov	0x28, %r14
	.word 0xf0f38e80  ! 3183: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_237:
	setx	0x36030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0xf, %r14
	.word 0xf4f38e80  ! 3189: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb435a04e  ! 3190: ORN_I	orn 	%r22, 0x004e, %r26
	.word 0xfc4ce121  ! 3196: LDSB_I	ldsb	[%r19 + 0x0121], %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 19)
	.word 0xfa040000  ! 3201: LDUW_R	lduw	[%r16 + %r0], %r29
cpu_intr_2_238:
	setx	0x3a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa042018  ! 3209: LDUW_I	lduw	[%r16 + 0x0018], %r29
T2_asi_reg_rd_148:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 3210: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf25d2052  ! 3212: LDX_I	ldx	[%r20 + 0x0052], %r25
	.word 0xf4c4a046  ! 3215: LDSWA_I	ldswa	[%r18, + 0x0046] %asi, %r26
	.word 0xf25521aa  ! 3219: LDSH_I	ldsh	[%r20 + 0x01aa], %r25
T2_asi_reg_rd_149:
	mov	0x1f, %r14
	.word 0xfadb84a0  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf694a0c2  ! 3221: LDUHA_I	lduha	[%r18, + 0x00c2] %asi, %r27
T2_asi_reg_wr_165:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 3223: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf85d4000  ! 3225: LDX_R	ldx	[%r21 + %r0], %r28
T2_asi_reg_rd_150:
	mov	0x35, %r14
	.word 0xfedb8e80  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_166:
	mov	0x33, %r14
	.word 0xf4f38400  ! 3232: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfe0c0000  ! 3235: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf2144000  ! 3239: LDUH_R	lduh	[%r17 + %r0], %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf8948020  ! 3244: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
T2_asi_reg_wr_167:
	mov	0x1c, %r14
	.word 0xf8f38400  ! 3245: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbcac60cd  ! 3246: ANDNcc_I	andncc 	%r17, 0x00cd, %r30
	.word 0xb8444000  ! 3247: ADDC_R	addc 	%r17, %r0, %r28
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 3)
	.word 0xfc04e0c6  ! 3255: LDUW_I	lduw	[%r19 + 0x00c6], %r30
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 20)
	.word 0xfad54020  ! 3258: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_239:
	setx	0x3b0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed54020  ! 3262: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
	.word 0xfe0c6135  ! 3264: LDUB_I	ldub	[%r17 + 0x0135], %r31
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_168:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 3266: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8cd8020  ! 3267: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
cpu_intr_2_240:
	setx	0x3a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_241:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c0000  ! 3274: LDSB_R	ldsb	[%r16 + %r0], %r27
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa05c000  ! 3280: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xf0cc8020  ! 3281: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
	.word 0xf04c20c0  ! 3282: LDSB_I	ldsb	[%r16 + 0x00c0], %r24
	.word 0xf20c0000  ! 3284: LDUB_R	ldub	[%r16 + %r0], %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_242:
	setx	0x380325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d9a  ! 3294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9a, %hpstate
	.word 0xfe95a055  ! 3297: LDUHA_I	lduha	[%r22, + 0x0055] %asi, %r31
	.word 0xfc154000  ! 3298: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf2552176  ! 3300: LDSH_I	ldsh	[%r20 + 0x0176], %r25
	.word 0xf6cd6193  ! 3301: LDSBA_I	ldsba	[%r21, + 0x0193] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 25)
	.word 0xfec5e058  ! 3304: LDSWA_I	ldswa	[%r23, + 0x0058] %asi, %r31
	.word 0xf2148000  ! 3305: LDUH_R	lduh	[%r18 + %r0], %r25
cpu_intr_2_244:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_169:
	mov	0x36, %r14
	.word 0xfef384a0  ! 3314: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_151:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 30)
	.word 0xfa540000  ! 3318: LDSH_R	ldsh	[%r16 + %r0], %r29
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa4c21f4  ! 3322: LDSB_I	ldsb	[%r16 + 0x01f4], %r29
	.word 0xf80d61fe  ! 3323: LDUB_I	ldub	[%r21 + 0x01fe], %r28
	.word 0xf494e00f  ! 3327: LDUHA_I	lduha	[%r19, + 0x000f] %asi, %r26
T2_asi_reg_wr_170:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 3328: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb09c0000  ! 3329: XORcc_R	xorcc 	%r16, %r0, %r24
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb2440000  ! 3332: ADDC_R	addc 	%r16, %r0, %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_171:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 3336: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_152:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_245:
	setx	0x3b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2858020  ! 3347: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xbd3d0000  ! 3348: SRA_R	sra 	%r20, %r0, %r30
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_153:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 3351: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf44c21d0  ! 3352: LDSB_I	ldsb	[%r16 + 0x01d0], %r26
T2_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf64d8000  ! 3356: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xf24ce1f5  ! 3358: LDSB_I	ldsb	[%r19 + 0x01f5], %r25
	.word 0xf8d58020  ! 3359: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_246:
	setx	0x38002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_172:
	mov	0x2a, %r14
	.word 0xf2f38400  ! 3364: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_247:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 3370: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xfcd54020  ! 3371: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
cpu_intr_2_248:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x38010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 3376: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf4550000  ! 3378: LDSH_R	ldsh	[%r20 + %r0], %r26
cpu_intr_2_250:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda0f1  ! 3382: LDSBA_I	ldsba	[%r22, + 0x00f1] %asi, %r31
cpu_intr_2_251:
	setx	0x38010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_252:
	setx	0x38011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x30, %r14
	.word 0xfedb89e0  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbcb50000  ! 3395: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xb615a035  ! 3396: OR_I	or 	%r22, 0x0035, %r27
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, d)
	.word 0xfa5c8000  ! 3402: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xbb35b001  ! 3405: SRLX_I	srlx	%r22, 0x0001, %r29
	.word 0xf68d2199  ! 3407: LDUBA_I	lduba	[%r20, + 0x0199] %asi, %r27
	.word 0xf40de156  ! 3409: LDUB_I	ldub	[%r23 + 0x0156], %r26
	.word 0xf2054000  ! 3411: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xb68cc000  ! 3412: ANDcc_R	andcc 	%r19, %r0, %r27
	.word 0xfe458000  ! 3413: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf6554000  ! 3415: LDSH_R	ldsh	[%r21 + %r0], %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_2_253:
	setx	0x3a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbd508000  ! 3422: RDPR_TSTATE	<illegal instruction>
	.word 0xfcd44020  ! 3423: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xfc04e139  ! 3424: LDUW_I	lduw	[%r19 + 0x0139], %r30
cpu_intr_2_254:
	setx	0x39010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf6d5616d  ! 3429: LDSHA_I	ldsha	[%r21, + 0x016d] %asi, %r27
T2_asi_reg_wr_173:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 3430: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a461c6  ! 3432: SUBcc_I	subcc 	%r17, 0x01c6, %r28
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_156:
	mov	0x33, %r14
	.word 0xfadb89e0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_174:
	mov	0xc, %r14
	.word 0xfef38e60  ! 3441: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_255:
	setx	0x39012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 3444: LDUW_R	lduw	[%r20 + %r0], %r26
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_157:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 3446: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe858020  ! 3447: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_256:
	setx	0x3b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_158:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_159:
	mov	0x30, %r14
	.word 0xf0db84a0  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf60c8000  ! 3457: LDUB_R	ldub	[%r18 + %r0], %r27
cpu_intr_2_257:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15c000  ! 3462: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xf85d8000  ! 3463: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb7504000  ! 3467: RDPR_TNPC	<illegal instruction>
	.word 0xf24c6148  ! 3469: LDSB_I	ldsb	[%r17 + 0x0148], %r25
	.word 0xfc150000  ! 3472: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfa542165  ! 3473: LDSH_I	ldsh	[%r16 + 0x0165], %r29
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983842  ! 3474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
cpu_intr_2_258:
	setx	0x39032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda140  ! 3478: LDXA_I	ldxa	[%r22, + 0x0140] %asi, %r29
	.word 0xb4944000  ! 3479: ORcc_R	orcc 	%r17, %r0, %r26
T2_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_161:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 30)
	.word 0xfac54020  ! 3486: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xfa942070  ! 3493: LDUHA_I	lduha	[%r16, + 0x0070] %asi, %r29
	.word 0xf45d617a  ! 3494: LDX_I	ldx	[%r21 + 0x017a], %r26
	.word 0xbe058000  ! 3497: ADD_R	add 	%r22, %r0, %r31
T2_asi_reg_wr_175:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 3498: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfc5cc000  ! 3500: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xf00ca010  ! 3502: LDUB_I	ldub	[%r18 + 0x0010], %r24
	ta	T_CHANGE_HPRIV
	.word 0xfa548000  ! 3504: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf88d6097  ! 3505: LDUBA_I	lduba	[%r21, + 0x0097] %asi, %r28
T2_asi_reg_rd_162:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_176:
	mov	0x2a, %r14
	.word 0xfaf384a0  ! 3510: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf44c0000  ! 3511: LDSB_R	ldsb	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfeccc020  ! 3518: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
cpu_intr_2_259:
	setx	0x390239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_260:
	setx	0x3b0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_177:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 3521: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb52d8000  ! 3523: SLL_R	sll 	%r22, %r0, %r26
	.word 0xfc1561d3  ! 3526: LDUH_I	lduh	[%r21 + 0x01d3], %r30
T2_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3531: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe8ce1aa  ! 3533: LDUBA_I	lduba	[%r19, + 0x01aa] %asi, %r31
	.word 0xf65ce103  ! 3534: LDX_I	ldx	[%r19 + 0x0103], %r27
	ta	T_CHANGE_HPRIV
	.word 0xf284a195  ! 3537: LDUWA_I	lduwa	[%r18, + 0x0195] %asi, %r25
	.word 0xbaa5c000  ! 3539: SUBcc_R	subcc 	%r23, %r0, %r29
cpu_intr_2_261:
	setx	0x3b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x3a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c4000  ! 3547: LDX_R	ldx	[%r17 + %r0], %r31
cpu_intr_2_264:
	setx	0x3b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d460e7  ! 3551: LDSHA_I	ldsha	[%r17, + 0x00e7] %asi, %r24
	.word 0xf20d4000  ! 3552: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xfa858020  ! 3554: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e12  ! 3555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
T2_asi_reg_rd_163:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_265:
	setx	0x38010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_266:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c60a4  ! 3560: LDX_I	ldx	[%r17 + 0x00a4], %r25
cpu_intr_2_267:
	setx	0x3b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04c000  ! 3563: LDUW_R	lduw	[%r19 + %r0], %r29
cpu_intr_2_269:
	setx	0x3b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_270:
	setx	0x3b0321, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_179:
	mov	0x2b, %r14
	.word 0xf4f38e60  ! 3570: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe544000  ! 3572: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf04520f2  ! 3574: LDSW_I	ldsw	[%r20 + 0x00f2], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_271:
	setx	0x3000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, d)
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 29)
	.word 0xf4544000  ! 3584: LDSH_R	ldsh	[%r17 + %r0], %r26
cpu_intr_2_272:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4958020  ! 3588: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 8)
	.word 0xf4548000  ! 3593: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfa54c000  ! 3601: LDSH_R	ldsh	[%r19 + %r0], %r29
cpu_intr_2_273:
	setx	0x38003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2142176  ! 3603: LDUH_I	lduh	[%r16 + 0x0176], %r25
	.word 0xfcc58020  ! 3604: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xf6150000  ! 3605: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xfccc0020  ! 3608: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, c)
	.word 0xf8cce09f  ! 3611: LDSBA_I	ldsba	[%r19, + 0x009f] %asi, %r28
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_274:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x390338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa40000  ! 3622: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xf2c5e1df  ! 3624: LDSWA_I	ldswa	[%r23, + 0x01df] %asi, %r25
	.word 0xfa8d0020  ! 3625: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
cpu_intr_2_276:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dd61b8  ! 3627: LDXA_I	ldxa	[%r21, + 0x01b8] %asi, %r27
	.word 0xf2558000  ! 3631: LDSH_R	ldsh	[%r22 + %r0], %r25
T2_asi_reg_wr_180:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 3633: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf60c2113  ! 3634: LDUB_I	ldub	[%r16 + 0x0113], %r27
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_165:
	mov	0x2d, %r14
	.word 0xf2db84a0  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb2948000  ! 3638: ORcc_R	orcc 	%r18, %r0, %r25
T2_asi_reg_wr_181:
	mov	0x1a, %r14
	.word 0xfaf38e80  ! 3640: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf04520e4  ! 3642: LDSW_I	ldsw	[%r20 + 0x00e4], %r24
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 23)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e82  ! 3649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e82, %hpstate
T2_asi_reg_wr_182:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 3651: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_277:
	setx	0x38000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0x2d, %r14
	.word 0xf2f38e80  ! 3656: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_166:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfa04c000  ! 3661: LDUW_R	lduw	[%r19 + %r0], %r29
T2_asi_reg_rd_167:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c98  ! 3668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c98, %hpstate
T2_asi_reg_rd_168:
	mov	0x27, %r14
	.word 0xfcdb8e80  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc44e026  ! 3671: LDSW_I	ldsw	[%r19 + 0x0026], %r30
	.word 0xf0458000  ! 3672: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf04c4000  ! 3673: LDSB_R	ldsb	[%r17 + %r0], %r24
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa548000  ! 3677: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf2dc61ba  ! 3678: LDXA_I	ldxa	[%r17, + 0x01ba] %asi, %r25
cpu_intr_2_278:
	setx	0x3e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6040000  ! 3681: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfcd4e119  ! 3683: LDSHA_I	ldsha	[%r19, + 0x0119] %asi, %r30
T2_asi_reg_wr_184:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 3684: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbcb4e0d4  ! 3688: ORNcc_I	orncc 	%r19, 0x00d4, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3691: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4442142  ! 3693: ADDC_I	addc 	%r16, 0x0142, %r26
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_279:
	setx	0x3f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf284e0c4  ! 3704: LDUWA_I	lduwa	[%r19, + 0x00c4] %asi, %r25
	.word 0xba94a0a0  ! 3705: ORcc_I	orcc 	%r18, 0x00a0, %r29
	.word 0xf8048000  ! 3710: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xfa0d0000  ! 3712: LDUB_R	ldub	[%r20 + %r0], %r29
T2_asi_reg_wr_186:
	mov	0x6, %r14
	.word 0xf0f38400  ! 3714: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_187:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 3715: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb63d4000  ! 3717: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xfc94c020  ! 3718: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
	.word 0xfecda137  ! 3719: LDSBA_I	ldsba	[%r22, + 0x0137] %asi, %r31
	.word 0xf295a119  ! 3720: LDUHA_I	lduha	[%r22, + 0x0119] %asi, %r25
T2_asi_reg_wr_188:
	mov	0x38, %r14
	.word 0xf4f389e0  ! 3722: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2d58020  ! 3723: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xf4dce0bc  ! 3724: LDXA_I	ldxa	[%r19, + 0x00bc] %asi, %r26
	.word 0xf4cd4020  ! 3729: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf48d4020  ! 3735: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xfccd4020  ! 3736: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf84ca166  ! 3739: LDSB_I	ldsb	[%r18 + 0x0166], %r28
	.word 0xf0944020  ! 3741: LDUHA_R	lduha	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_169:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf485e188  ! 3744: LDUWA_I	lduwa	[%r23, + 0x0188] %asi, %r26
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_189:
	mov	0x1a, %r14
	.word 0xf2f38e80  ! 3750: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c2  ! 3752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_170:
	mov	0x34, %r14
	.word 0xf0db8400  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_190:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3757: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_171:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa5d8000  ! 3759: LDX_R	ldx	[%r22 + %r0], %r29
T2_asi_reg_wr_191:
	mov	0x16, %r14
	.word 0xf0f38e80  ! 3762: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_280:
	setx	0x3c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 34)
	.word 0xf60461b3  ! 3770: LDUW_I	lduw	[%r17 + 0x01b3], %r27
T2_asi_reg_rd_172:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf44c4000  ! 3774: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xba0d4000  ! 3778: AND_R	and 	%r21, %r0, %r29
	.word 0xf6dd20c1  ! 3780: LDXA_I	ldxa	[%r20, + 0x00c1] %asi, %r27
T2_asi_reg_wr_192:
	mov	0x16, %r14
	.word 0xf8f38400  ! 3781: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf28ca1dd  ! 3784: LDUBA_I	lduba	[%r18, + 0x01dd] %asi, %r25
	.word 0xb28460c6  ! 3785: ADDcc_I	addcc 	%r17, 0x00c6, %r25
	.word 0xfc0d205b  ! 3787: LDUB_I	ldub	[%r20 + 0x005b], %r30
T2_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_281:
	setx	0x3d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_282:
	setx	0x3f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 7)
	.word 0xbc8ce0e8  ! 3801: ANDcc_I	andcc 	%r19, 0x00e8, %r30
	.word 0xfe0c2115  ! 3802: LDUB_I	ldub	[%r16 + 0x0115], %r31
cpu_intr_2_283:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd8020  ! 3809: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xfe84a1c7  ! 3812: LDUWA_I	lduwa	[%r18, + 0x01c7] %asi, %r31
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4942024  ! 3816: LDUHA_I	lduha	[%r16, + 0x0024] %asi, %r26
T2_asi_reg_wr_193:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 3819: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_174:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 3820: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0c54020  ! 3821: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xf2856145  ! 3824: LDUWA_I	lduwa	[%r21, + 0x0145] %asi, %r25
	.word 0xf05d0000  ! 3828: LDX_R	ldx	[%r20 + %r0], %r24
cpu_intr_2_284:
	setx	0x3f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_285:
	setx	0x3f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_175:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_176:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 3838: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_286:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92df001  ! 3843: SLLX_I	sllx	%r23, 0x0001, %r28
	.word 0xbc150000  ! 3844: OR_R	or 	%r20, %r0, %r30
T2_asi_reg_rd_177:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf80c2130  ! 3846: LDUB_I	ldub	[%r16 + 0x0130], %r28
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_287:
	setx	0x3c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x8, %r14
	.word 0xfef38400  ! 3854: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_195:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 3855: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_288:
	setx	0x3e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_178:
	mov	0x8, %r14
	.word 0xfadb84a0  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_289:
	setx	0x3e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd2015  ! 3876: XNORcc_I	xnorcc 	%r20, 0x0015, %r25
T2_asi_reg_wr_196:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 3877: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf84c4000  ! 3880: LDSB_R	ldsb	[%r17 + %r0], %r28
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_290:
	setx	0x3e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c4000  ! 3888: AND_R	and 	%r17, %r0, %r30
T2_asi_reg_wr_197:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 3889: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf4cc8020  ! 3893: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_198:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 3894: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfc5c4000  ! 3900: LDX_R	ldx	[%r17 + %r0], %r30
cpu_intr_2_291:
	setx	0x3f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa04c000  ! 3904: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0xfcdce0a2  ! 3907: LDXA_I	ldxa	[%r19, + 0x00a2] %asi, %r30
	.word 0xb8c521c0  ! 3908: ADDCcc_I	addccc 	%r20, 0x01c0, %r28
	.word 0xf0cd0020  ! 3910: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xfed48020  ! 3911: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
	.word 0xfc946190  ! 3912: LDUHA_I	lduha	[%r17, + 0x0190] %asi, %r30
T2_asi_reg_rd_179:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_199:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 3921: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_292:
	setx	0x3c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c60ca  ! 3924: LDUBA_I	lduba	[%r17, + 0x00ca] %asi, %r24
	.word 0xb12da001  ! 3927: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xfed5a132  ! 3928: LDSHA_I	ldsha	[%r22, + 0x0132] %asi, %r31
	.word 0xf4cd6116  ! 3929: LDSBA_I	ldsba	[%r21, + 0x0116] %asi, %r26
	.word 0xb5340000  ! 3932: SRL_R	srl 	%r16, %r0, %r26
cpu_intr_2_293:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa040000  ! 3941: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb63461ce  ! 3943: ORN_I	orn 	%r17, 0x01ce, %r27
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cd2  ! 3944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd2, %hpstate
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfecc8020  ! 3946: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
cpu_intr_2_294:
	setx	0x3e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 3955: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfcdda01c  ! 3956: LDXA_I	ldxa	[%r22, + 0x001c] %asi, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf25de0bb  ! 3959: LDX_I	ldx	[%r23 + 0x00bb], %r25
T2_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfccd4020  ! 3962: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
cpu_intr_2_295:
	setx	0x3f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_201:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3964: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0x8595e026  ! 3968: WRPR_TSTATE_I	wrpr	%r23, 0x0026, %tstate
	.word 0xf4156067  ! 3969: LDUH_I	lduh	[%r21 + 0x0067], %r26
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_296:
	setx	0x3f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_297:
	setx	0x3f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_299:
	setx	0x3e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_182:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_202:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 3983: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfac5a1ad  ! 3984: LDSWA_I	ldswa	[%r22, + 0x01ad] %asi, %r29
cpu_intr_2_300:
	setx	0x3c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_301:
	setx	0x3d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95212a  ! 3989: LDUHA_I	lduha	[%r20, + 0x012a] %asi, %r29
T2_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 3992: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_204:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 3994: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_302:
	setx	0x3f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 25)
	.word 0xf68dc020  ! 3999: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_183:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982942  ! 4002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_205:
	mov	0x13, %r14
	.word 0xf2f389e0  ! 4004: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_303:
	setx	0x3e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_304:
	setx	0x3e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_206:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 4010: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf605e1dc  ! 4012: LDUW_I	lduw	[%r23 + 0x01dc], %r27
	.word 0xbb7c8400  ! 4014: MOVR_R	movre	%r18, %r0, %r29
	.word 0xf84c0000  ! 4015: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb5480000  ! 4016: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d80  ! 4018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
T2_asi_reg_rd_184:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 4019: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_185:
	mov	0xf, %r14
	.word 0xf0db8400  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4031: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_186:
	mov	0x17, %r14
	.word 0xf2db89e0  ! 4034: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb13cd000  ! 4036: SRAX_R	srax	%r19, %r0, %r24
	.word 0xf894a0f9  ! 4039: LDUHA_I	lduha	[%r18, + 0x00f9] %asi, %r28
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_305:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_306:
	setx	0x3d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 4051: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_209:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 4052: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfc042052  ! 4053: LDUW_I	lduw	[%r16 + 0x0052], %r30
	.word 0xf2158000  ! 4055: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 12)
	.word 0xf2944020  ! 4064: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xfcc5e151  ! 4065: LDSWA_I	ldswa	[%r23, + 0x0151] %asi, %r30
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829d8  ! 4067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d8, %hpstate
cpu_intr_2_307:
	setx	0x3d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 4)
	.word 0xf604c000  ! 4074: LDUW_R	lduw	[%r19 + %r0], %r27
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983dda  ! 4075: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_210:
	mov	0x37, %r14
	.word 0xf0f38e60  ! 4081: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4cd21b0  ! 4084: LDSBA_I	ldsba	[%r20, + 0x01b0] %asi, %r26
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_308:
	setx	0x3e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_187:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0446154  ! 4090: LDSW_I	ldsw	[%r17 + 0x0154], %r24
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_309:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_188:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb73d6001  ! 4098: SRA_I	sra 	%r21, 0x0001, %r27
T2_asi_reg_rd_189:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 4099: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_310:
	setx	0x430209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5c603d  ! 4105: LDX_I	ldx	[%r17 + 0x003d], %r31
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fc2  ! 4106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
	.word 0xf8844020  ! 4107: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xf214c000  ! 4108: LDUH_R	lduh	[%r19 + %r0], %r25
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f8a  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
T2_asi_reg_wr_211:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 4112: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 18)
	.word 0xfcd5c020  ! 4115: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
cpu_intr_2_311:
	setx	0x410114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_190:
	mov	0x12, %r14
	.word 0xfedb8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf0050000  ! 4122: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf4cdc020  ! 4127: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	.word 0xfcc50020  ! 4132: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfc856188  ! 4133: LDUWA_I	lduwa	[%r21, + 0x0188] %asi, %r30
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982aca  ! 4134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
T2_asi_reg_wr_212:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 4136: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc4dc000  ! 4138: LDSB_R	ldsb	[%r23 + %r0], %r30
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 29)
	.word 0xf4946194  ! 4141: LDUHA_I	lduha	[%r17, + 0x0194] %asi, %r26
T2_asi_reg_rd_191:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_312:
	setx	0x400309, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_192:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 4148: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_213:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 4152: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf68d0020  ! 4154: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xbb2c4000  ! 4155: SLL_R	sll 	%r17, %r0, %r29
	.word 0xf615a0e6  ! 4157: LDUH_I	lduh	[%r22 + 0x00e6], %r27
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_194:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf6140000  ! 4164: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf2d4210b  ! 4166: LDSHA_I	ldsha	[%r16, + 0x010b] %asi, %r25
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982eda  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
T2_asi_reg_rd_195:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 4169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6c42128  ! 4171: LDSWA_I	ldswa	[%r16, + 0x0128] %asi, %r27
	.word 0xfa958020  ! 4172: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xfc4d6168  ! 4173: LDSB_I	ldsb	[%r21 + 0x0168], %r30
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_214:
	mov	0xf, %r14
	.word 0xf6f38e80  ! 4175: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8cc60f7  ! 4178: LDSBA_I	ldsba	[%r17, + 0x00f7] %asi, %r28
cpu_intr_2_313:
	setx	0x430112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005e124  ! 4182: LDUW_I	lduw	[%r23 + 0x0124], %r24
	.word 0xf4454000  ! 4184: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf2c4e14a  ! 4185: LDSWA_I	ldswa	[%r19, + 0x014a] %asi, %r25
T2_asi_reg_wr_215:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 4187: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_196:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfec50020  ! 4191: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 10)
	.word 0xbc1d0000  ! 4195: XOR_R	xor 	%r20, %r0, %r30
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 18)
	.word 0xf6048000  ! 4198: LDUW_R	lduw	[%r18 + %r0], %r27
cpu_intr_2_314:
	setx	0x420219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d0000  ! 4201: LDUB_R	ldub	[%r20 + %r0], %r26
cpu_intr_2_315:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 6)
	.word 0xbf7c4400  ! 4205: MOVR_R	movre	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf0d4c020  ! 4211: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
cpu_intr_2_316:
	setx	0x43032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_317:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_216:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_318:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf044c000  ! 4223: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xfe4cc000  ! 4226: LDSB_R	ldsb	[%r19 + %r0], %r31
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b80  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	.word 0xf2850020  ! 4231: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb3643801  ! 4233: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_197:
	mov	0x2f, %r14
	.word 0xf2db8e60  ! 4234: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4d561d0  ! 4235: LDSHA_I	ldsha	[%r21, + 0x01d0] %asi, %r26
	.word 0xfc854020  ! 4236: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
cpu_intr_2_319:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_198:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 4238: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe54601b  ! 4239: LDSH_I	ldsh	[%r17 + 0x001b], %r31
	.word 0xf00cc000  ! 4240: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xbe246160  ! 4244: SUB_I	sub 	%r17, 0x0160, %r31
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_320:
	setx	0x400338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a0fd  ! 4250: WRPR_TT_I	wrpr	%r22, 0x00fd, %tt
T2_asi_reg_wr_217:
	mov	0x4, %r14
	.word 0xfef389e0  ! 4252: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6d48020  ! 4254: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf2cd4020  ! 4255: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xfcccc020  ! 4257: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a0a  ! 4258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0xfe44217f  ! 4259: LDSW_I	ldsw	[%r16 + 0x017f], %r31
	.word 0xf214a1bb  ! 4263: LDUH_I	lduh	[%r18 + 0x01bb], %r25
	.word 0xfac4a019  ! 4265: LDSWA_I	ldswa	[%r18, + 0x0019] %asi, %r29
	.word 0xf455c000  ! 4266: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xf285c020  ! 4268: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
cpu_intr_2_321:
	setx	0x43011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084211c  ! 4273: LDUWA_I	lduwa	[%r16, + 0x011c] %asi, %r24
cpu_intr_2_322:
	setx	0x430237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 4277: MOVcc_R	<illegal instruction>
	.word 0xb2854000  ! 4279: ADDcc_R	addcc 	%r21, %r0, %r25
T2_asi_reg_wr_218:
	mov	0x28, %r14
	.word 0xf4f38e60  ! 4280: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_323:
	setx	0x40030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 4288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_324:
	setx	0x430315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 10)
	.word 0xb8b4a087  ! 4292: SUBCcc_I	orncc 	%r18, 0x0087, %r28
	.word 0xfa0c4000  ! 4294: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xfc5dc000  ! 4295: LDX_R	ldx	[%r23 + %r0], %r30
cpu_intr_2_325:
	setx	0x420226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95c020  ! 4297: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
T2_asi_reg_rd_200:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 4301: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_219:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4306: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc440000  ! 4311: LDSW_R	ldsw	[%r16 + %r0], %r30
T2_asi_reg_rd_201:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfac58020  ! 4315: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xb5353001  ! 4319: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xfecd0020  ! 4320: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0x8d956094  ! 4321: WRPR_PSTATE_I	wrpr	%r21, 0x0094, %pstate
	.word 0xf094214f  ! 4325: LDUHA_I	lduha	[%r16, + 0x014f] %asi, %r24
cpu_intr_2_326:
	setx	0x42031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845a090  ! 4327: LDSW_I	ldsw	[%r22 + 0x0090], %r28
	.word 0xf2cc2099  ! 4329: LDSBA_I	ldsba	[%r16, + 0x0099] %asi, %r25
T2_asi_reg_rd_202:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf44cc000  ! 4331: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xb4a4c000  ! 4334: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xf68560db  ! 4335: LDUWA_I	lduwa	[%r21, + 0x00db] %asi, %r27
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf00de19a  ! 4339: LDUB_I	ldub	[%r23 + 0x019a], %r24
	.word 0xf0554000  ! 4343: LDSH_R	ldsh	[%r21 + %r0], %r24
cpu_intr_2_327:
	setx	0x410321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495e185  ! 4345: LDUHA_I	lduha	[%r23, + 0x0185] %asi, %r26
cpu_intr_2_328:
	setx	0x30327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_220:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 4350: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_329:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc6084  ! 4353: LDSBA_I	ldsba	[%r17, + 0x0084] %asi, %r31
	.word 0xb09ca147  ! 4359: XORcc_I	xorcc 	%r18, 0x0147, %r24
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819839ca  ! 4361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
T2_asi_reg_wr_221:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 4362: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb48d0000  ! 4363: ANDcc_R	andcc 	%r20, %r0, %r26
T2_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 4365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf2c5c020  ! 4366: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_222:
	mov	0x0, %r14
	.word 0xfaf38e60  ! 4367: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf80c60ea  ! 4368: LDUB_I	ldub	[%r17 + 0x00ea], %r28
	.word 0xf4dc2066  ! 4370: LDXA_I	ldxa	[%r16, + 0x0066] %asi, %r26
	.word 0xf08460e0  ! 4372: LDUWA_I	lduwa	[%r17, + 0x00e0] %asi, %r24
T2_asi_reg_wr_223:
	mov	0x8, %r14
	.word 0xf4f38e80  ! 4373: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_224:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4374: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 19)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d82  ! 4376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, c)
	.word 0xf65d201b  ! 4379: LDX_I	ldx	[%r20 + 0x001b], %r27
	.word 0xf25c0000  ! 4382: LDX_R	ldx	[%r16 + %r0], %r25
T2_asi_reg_wr_225:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 4383: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_330:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054605e  ! 4390: LDSH_I	ldsh	[%r17 + 0x005e], %r24
	ta	T_CHANGE_HPRIV
	.word 0xf44c20e3  ! 4392: LDSB_I	ldsb	[%r16 + 0x00e3], %r26
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f1a  ! 4393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
	.word 0xf845c000  ! 4394: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xb824c000  ! 4396: SUB_R	sub 	%r19, %r0, %r28
	.word 0xfa140000  ! 4397: LDUH_R	lduh	[%r16 + %r0], %r29
T2_asi_reg_wr_226:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 4398: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_204:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf255604f  ! 4400: LDSH_I	ldsh	[%r21 + 0x004f], %r25
cpu_intr_2_331:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf6c4c020  ! 4405: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
	.word 0xfc1521ee  ! 4407: LDUH_I	lduh	[%r20 + 0x01ee], %r30
T2_asi_reg_wr_227:
	mov	0xf, %r14
	.word 0xf2f384a0  ! 4408: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbe0de1d3  ! 4410: AND_I	and 	%r23, 0x01d3, %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa940020  ! 4415: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 37)
	.word 0xf85460c1  ! 4418: LDSH_I	ldsh	[%r17 + 0x00c1], %r28
T2_asi_reg_wr_228:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 4420: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_wr_229:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 4422: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_332:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc20cb  ! 4428: LDSBA_I	ldsba	[%r16, + 0x00cb] %asi, %r31
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 4)
	.word 0xfccd0020  ! 4431: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
	.word 0xf45d2174  ! 4432: LDX_I	ldx	[%r20 + 0x0174], %r26
T2_asi_reg_rd_205:
	mov	0x33, %r14
	.word 0xf2db8e60  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0148000  ! 4434: LDUH_R	lduh	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb97d2401  ! 4440: MOVR_I	movre	%r20, 0x1, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf05420b3  ! 4446: LDSH_I	ldsh	[%r16 + 0x00b3], %r24
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 37)
	.word 0xf894c020  ! 4451: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 21)
	.word 0xfcc40020  ! 4460: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xfa0ca1f5  ! 4468: LDUB_I	ldub	[%r18 + 0x01f5], %r29
	.word 0xbc8d0000  ! 4469: ANDcc_R	andcc 	%r20, %r0, %r30
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_230:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 4472: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xb43d8000  ! 4479: XNOR_R	xnor 	%r22, %r0, %r26
cpu_intr_2_333:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x29, %r14
	.word 0xf6db8e60  ! 4482: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb40421a3  ! 4484: ADD_I	add 	%r16, 0x01a3, %r26
T2_asi_reg_wr_231:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 4485: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_232:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 4486: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_wr_233:
	mov	0xc, %r14
	.word 0xf0f38400  ! 4487: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfe05210d  ! 4490: LDUW_I	lduw	[%r20 + 0x010d], %r31
	.word 0xf05d60da  ! 4491: LDX_I	ldx	[%r21 + 0x00da], %r24
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_334:
	setx	0x430217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_335:
	setx	0x430218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d8000  ! 4500: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfc840020  ! 4501: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 17)
	.word 0xf8046057  ! 4506: LDUW_I	lduw	[%r17 + 0x0057], %r28
cpu_intr_2_336:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf4d5e0c5  ! 4509: LDSHA_I	ldsha	[%r23, + 0x00c5] %asi, %r26
	.word 0xfc440000  ! 4511: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf2c5a14e  ! 4513: LDSWA_I	ldswa	[%r22, + 0x014e] %asi, %r25
	.word 0xf25c0000  ! 4514: LDX_R	ldx	[%r16 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_207:
	mov	0x32, %r14
	.word 0xf4db84a0  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf2cde171  ! 4522: LDSBA_I	ldsba	[%r23, + 0x0171] %asi, %r25
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf6442176  ! 4526: LDSW_I	ldsw	[%r16 + 0x0176], %r27
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_337:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_234:
	mov	0x11, %r14
	.word 0xf0f384a0  ! 4533: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_208:
	mov	0x3, %r14
	.word 0xf8db8400  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfc95e103  ! 4541: LDUHA_I	lduha	[%r23, + 0x0103] %asi, %r30
cpu_intr_2_338:
	setx	0x420323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe45c000  ! 4550: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xb4350000  ! 4553: ORN_R	orn 	%r20, %r0, %r26
cpu_intr_2_339:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e1a  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1a, %hpstate
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfa8d20ad  ! 4565: LDUBA_I	lduba	[%r20, + 0x00ad] %asi, %r29
cpu_intr_2_340:
	setx	0x47023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c0020  ! 4567: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
cpu_intr_2_341:
	setx	0x460235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_342:
	setx	0x460022, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_209:
	mov	0x1, %r14
	.word 0xf4db8400  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_343:
	setx	0x45001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf655e100  ! 4573: LDSH_I	ldsh	[%r23 + 0x0100], %r27
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_344:
	setx	0x46012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_2_345:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x440134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeade099  ! 4587: ANDNcc_I	andncc 	%r23, 0x0099, %r31
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, c)
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, b)
	.word 0xb93da001  ! 4590: SRA_I	sra 	%r22, 0x0001, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfc148000  ! 4595: LDUH_R	lduh	[%r18 + %r0], %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_235:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 4597: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_347:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64520f9  ! 4602: LDSW_I	ldsw	[%r20 + 0x00f9], %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_210:
	mov	0x2e, %r14
	.word 0xfadb89e0  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_211:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_348:
	setx	0x44011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445c000  ! 4610: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf81561c7  ! 4612: LDUH_I	lduh	[%r21 + 0x01c7], %r28
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf0858020  ! 4614: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xfc5da0d8  ! 4615: LDX_I	ldx	[%r22 + 0x00d8], %r30
	.word 0xf88da01c  ! 4617: LDUBA_I	lduba	[%r22, + 0x001c] %asi, %r28
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbc0cc000  ! 4623: AND_R	and 	%r19, %r0, %r30
	.word 0xf2d4c020  ! 4626: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_236:
	mov	0x1d, %r14
	.word 0xfcf38e60  ! 4628: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfc5c8000  ! 4629: LDX_R	ldx	[%r18 + %r0], %r30
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, c)
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 28)
	.word 0xfacc0020  ! 4634: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_212:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf2154000  ! 4638: LDUH_R	lduh	[%r21 + %r0], %r25
cpu_intr_2_349:
	setx	0x46032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_213:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb72cf001  ! 4644: SLLX_I	sllx	%r19, 0x0001, %r27
cpu_intr_2_350:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, b)
	.word 0xba9c608e  ! 4651: XORcc_I	xorcc 	%r17, 0x008e, %r29
T2_asi_reg_rd_214:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 4652: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9345000  ! 4653: SRLX_R	srlx	%r17, %r0, %r28
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_237:
	mov	0x30, %r14
	.word 0xf4f38400  ! 4657: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 29)
	.word 0xf4dda0e4  ! 4664: LDXA_I	ldxa	[%r22, + 0x00e4] %asi, %r26
T2_asi_reg_wr_238:
	mov	0x4, %r14
	.word 0xf6f38e60  ! 4667: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_239:
	mov	0x5, %r14
	.word 0xf6f38400  ! 4668: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb52cf001  ! 4670: SLLX_I	sllx	%r19, 0x0001, %r26
cpu_intr_2_351:
	setx	0x46012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15a073  ! 4673: LDUH_I	lduh	[%r22 + 0x0073], %r29
cpu_intr_2_352:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_240:
	mov	0x28, %r14
	.word 0xf2f38e60  ! 4681: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 1)
	.word 0xf645e16a  ! 4683: LDSW_I	ldsw	[%r23 + 0x016a], %r27
cpu_intr_2_353:
	setx	0x46013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 4691: LDUB_R	ldub	[%r17 + %r0], %r27
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, d)
	.word 0xf655618e  ! 4696: LDSH_I	ldsh	[%r21 + 0x018e], %r27
T2_asi_reg_wr_241:
	mov	0x13, %r14
	.word 0xf6f38e80  ! 4700: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2546010  ! 4703: LDSH_I	ldsh	[%r17 + 0x0010], %r25
	.word 0xb88d61c5  ! 4706: ANDcc_I	andcc 	%r21, 0x01c5, %r28
	.word 0xbab58000  ! 4709: ORNcc_R	orncc 	%r22, %r0, %r29
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_354:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 4713: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_2_355:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29dc000  ! 4719: XORcc_R	xorcc 	%r23, %r0, %r25
T2_asi_reg_wr_242:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4720: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2dde1fd  ! 4724: LDXA_I	ldxa	[%r23, + 0x01fd] %asi, %r25
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_243:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 4728: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0c52097  ! 4729: LDSWA_I	ldswa	[%r20, + 0x0097] %asi, %r24
T2_asi_reg_wr_244:
	mov	0xc, %r14
	.word 0xf2f38400  ! 4730: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_245:
	mov	0x1a, %r14
	.word 0xfef389e0  ! 4732: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0x8194a000  ! 4733: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xf055e109  ! 4734: LDSH_I	ldsh	[%r23 + 0x0109], %r24
	.word 0xf644c000  ! 4736: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf00c0000  ! 4738: LDUB_R	ldub	[%r16 + %r0], %r24
cpu_intr_2_356:
	setx	0x47012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15e0be  ! 4743: LDUH_I	lduh	[%r23 + 0x00be], %r29
	.word 0xfcd5a183  ! 4745: LDSHA_I	ldsha	[%r22, + 0x0183] %asi, %r30
cpu_intr_2_357:
	setx	0x44002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d4020  ! 4750: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	.word 0xf48cc020  ! 4751: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
	.word 0xbb3de001  ! 4754: SRA_I	sra 	%r23, 0x0001, %r29
T2_asi_reg_wr_246:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 4756: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa5c0000  ! 4758: LDX_R	ldx	[%r16 + %r0], %r29
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc454000  ! 4761: LDSW_R	ldsw	[%r21 + %r0], %r30
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e02  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e02, %hpstate
	.word 0xfc940020  ! 4763: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xa1902001  ! 4764: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf29521f1  ! 4765: LDUHA_I	lduha	[%r20, + 0x01f1] %asi, %r25
	.word 0xf85c0000  ! 4768: LDX_R	ldx	[%r16 + %r0], %r28
T2_asi_reg_wr_247:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 4769: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, d)
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_358:
	setx	0x450238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_215:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 4774: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_248:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 4776: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfa0d4000  ! 4777: LDUB_R	ldub	[%r21 + %r0], %r29
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_249:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 4781: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_250:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 4786: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbd352001  ! 4787: SRL_I	srl 	%r20, 0x0001, %r30
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 7)
	.word 0xf815e03f  ! 4789: LDUH_I	lduh	[%r23 + 0x003f], %r28
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf0cda07e  ! 4795: LDSBA_I	ldsba	[%r22, + 0x007e] %asi, %r24
cpu_intr_2_359:
	setx	0x440317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61dc000  ! 4797: XOR_R	xor 	%r23, %r0, %r27
	.word 0xf285a043  ! 4800: LDUWA_I	lduwa	[%r22, + 0x0043] %asi, %r25
	.word 0xb235c000  ! 4805: SUBC_R	orn 	%r23, %r0, %r25
T2_asi_reg_wr_251:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 4811: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa544000  ! 4812: LDSH_R	ldsh	[%r17 + %r0], %r29
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_216:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf694a030  ! 4818: LDUHA_I	lduha	[%r18, + 0x0030] %asi, %r27
	.word 0xf40ca118  ! 4820: LDUB_I	ldub	[%r18 + 0x0118], %r26
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_360:
	setx	0x450217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_361:
	setx	0x450121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb245c000  ! 4827: ADDC_R	addc 	%r23, %r0, %r25
cpu_intr_2_362:
	setx	0x45032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 4832: MOVcc_R	<illegal instruction>
	.word 0xfecd60a6  ! 4833: LDSBA_I	ldsba	[%r21, + 0x00a6] %asi, %r31
	.word 0xfa154000  ! 4835: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xbb3cc000  ! 4836: SRA_R	sra 	%r19, %r0, %r29
	.word 0xfc958020  ! 4837: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xf8d4c020  ! 4839: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_252:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 4842: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_TO_TL0
	.word 0xf6d5c020  ! 4846: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xf44c4000  ! 4847: LDSB_R	ldsb	[%r17 + %r0], %r26
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 7)
	.word 0xb0c48000  ! 4852: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xf24c4000  ! 4853: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf2944020  ! 4854: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xb134e001  ! 4855: SRL_I	srl 	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b08  ! 4857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982990  ! 4858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0xf454600f  ! 4864: LDSH_I	ldsh	[%r17 + 0x000f], %r26
	.word 0xf00dc000  ! 4868: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xf2c58020  ! 4874: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
	.word 0xba340000  ! 4875: ORN_R	orn 	%r16, %r0, %r29
T2_asi_reg_wr_253:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 4878: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa848020  ! 4880: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	.word 0xf88d2184  ! 4881: LDUBA_I	lduba	[%r20, + 0x0184] %asi, %r28
	.word 0xfc854020  ! 4882: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
	.word 0xba842092  ! 4883: ADDcc_I	addcc 	%r16, 0x0092, %r29
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_254:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4886: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_363:
	setx	0x440315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88da11b  ! 4888: LDUBA_I	lduba	[%r22, + 0x011b] %asi, %r28
	ta	T_CHANGE_HPRIV
	.word 0xa1902002  ! 4894: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T2_asi_reg_rd_217:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 4898: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb63c6086  ! 4900: XNOR_I	xnor 	%r17, 0x0086, %r27
	.word 0xbc044000  ! 4903: ADD_R	add 	%r17, %r0, %r30
T2_asi_reg_wr_255:
	mov	0x0, %r14
	.word 0xf8f38400  ! 4905: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfad5a028  ! 4908: LDSHA_I	ldsha	[%r22, + 0x0028] %asi, %r29
	.word 0xf0dda13e  ! 4910: LDXA_I	ldxa	[%r22, + 0x013e] %asi, %r24
cpu_intr_2_364:
	setx	0x460337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf284200d  ! 4914: LDUWA_I	lduwa	[%r16, + 0x000d] %asi, %r25
T2_asi_reg_rd_218:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 4918: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_219:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfedda1f6  ! 4923: LDXA_I	ldxa	[%r22, + 0x01f6] %asi, %r31
	.word 0xfa94c020  ! 4925: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
cpu_intr_2_365:
	setx	0x46011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d8000  ! 4929: XNOR_R	xnor 	%r22, %r0, %r28
cpu_intr_2_366:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbcc52090  ! 4943: ADDCcc_I	addccc 	%r20, 0x0090, %r30
T2_asi_reg_rd_220:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, 27)
	.word 0xbe840000  ! 4948: ADDcc_R	addcc 	%r16, %r0, %r31
	.word 0xf04dc000  ! 4954: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf64dc000  ! 4955: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xb92c7001  ! 4956: SLLX_I	sllx	%r17, 0x0001, %r28
cpu_intr_2_367:
	setx	0x44003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_256:
	mov	0x20, %r14
	.word 0xfcf384a0  ! 4959: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_368:
	setx	0x44032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05e097  ! 4969: LDUW_I	lduw	[%r23 + 0x0097], %r30
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, 8)
	.word 0xf20ca0d6  ! 4971: LDUB_I	ldub	[%r18 + 0x00d6], %r25
cpu_intr_2_369:
	setx	0x450135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 4975: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf2dc2184  ! 4976: LDXA_I	ldxa	[%r16, + 0x0184] %asi, %r25
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b42  ! 4982: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
	.word 0xf0d521c7  ! 4983: LDSHA_I	ldsha	[%r20, + 0x01c7] %asi, %r24
	.word 0xfc446042  ! 4984: LDSW_I	ldsw	[%r17 + 0x0042], %r30
cpu_intr_2_370:
	setx	0x450031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_413:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_413), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe156163  ! 4990: LDUH_I	lduh	[%r21 + 0x0163], %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_371:
	setx	0x47033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe946024  ! 4993: LDUHA_I	lduha	[%r17, + 0x0024] %asi, %r31
cpu_intr_2_372:
	setx	0x440001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_373:
	setx	0x440122, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbba549c0  ! 7: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xbfa90820  ! 9: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_0:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 14: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5a90820  ! 17: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_0:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 19: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_0:
	setx	0x1c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbaac820  ! 22: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_1:
	mov	0x34, %r14
	.word 0xfef389e0  ! 24: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_1:
	setx	0x1d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb604a067  ! 31: ADD_I	add 	%r18, 0x0067, %r27
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a81420  ! 36: FMOVRNZ	dis not found

	.word 0xb1aa8820  ! 41: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5510000  ! 44: RDPR_TICK	<illegal instruction>
	.word 0xbf7d4400  ! 48: MOVR_R	movre	%r21, %r0, %r31
T1_asi_reg_wr_2:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 49: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_3:
	mov	0x2d, %r14
	.word 0xfaf389e0  ! 51: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_4:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 52: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbdab8820  ! 55: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbc344000  ! 58: SUBC_R	orn 	%r17, %r0, %r30
T1_asi_reg_wr_5:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_2:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_3:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_4:
	mov	0xf, %r14
	.word 0xf2db84a0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda4c940  ! 68: FMULd	fmuld	%f50, %f0, %f30
T1_asi_reg_wr_6:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 69: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 11)
	.word 0xba3cc000  ! 71: XNOR_R	xnor 	%r19, %r0, %r29
T1_asi_reg_wr_7:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 72: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb9a80820  ! 74: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_5:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 78: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbc948000  ! 81: ORcc_R	orcc 	%r18, %r0, %r30
T1_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 82: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_2:
	setx	0x1e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 87: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_3:
	setx	0x1f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_8:
	mov	0x1, %r14
	.word 0xfef389e0  ! 90: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_4:
	setx	0x1e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_7:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbfa00520  ! 101: FSQRTs	fsqrt	
	.word 0xbfa408e0  ! 106: FSUBq	dis not found

	.word 0xb1a58940  ! 112: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb5a81420  ! 113: FMOVRNZ	dis not found

	.word 0xbba80c20  ! 115: FMOVRLZ	dis not found

	.word 0x9195201a  ! 117: WRPR_PIL_I	wrpr	%r20, 0x001a, %pil
T1_asi_reg_wr_9:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 118: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_10:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 120: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb6058000  ! 122: ADD_R	add 	%r22, %r0, %r27
T1_asi_reg_wr_11:
	mov	0x26, %r14
	.word 0xf4f38e60  ! 123: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbab0820  ! 125: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_5:
	setx	0x1c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488e0  ! 132: FSUBq	dis not found

T1_asi_reg_wr_12:
	mov	0x33, %r14
	.word 0xfef38e40  ! 133: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_6:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_7:
	setx	0x1c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_8:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb5aa4820  ! 143: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80420  ! 144: FMOVRZ	dis not found

iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfaa0820  ! 146: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfa5c920  ! 147: FMULs	fmuls	%f23, %f0, %f31
cpu_intr_1_9:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_13:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 149: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_14:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 151: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a9c820  ! 152: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a489e0  ! 153: FDIVq	dis not found

iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_15:
	mov	0xf, %r14
	.word 0xfaf38e60  ! 165: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1aac820  ! 168: FMOVGE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_8:
	mov	0x35, %r14
	.word 0xf6db8e80  ! 177: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfa94820  ! 178: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb17d8400  ! 179: MOVR_R	movre	%r22, %r0, %r24
	.word 0xbda98820  ! 181: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa50940  ! 183: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbfa00040  ! 184: FMOVd	fmovd	%f0, %f62
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_9:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3a00520  ! 188: FSQRTs	fsqrt	
T1_asi_reg_wr_16:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 190: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc3d213a  ! 191: XNOR_I	xnor 	%r20, 0x013a, %r30
cpu_intr_1_10:
	setx	0x1f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 195: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_17:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 196: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_11:
	setx	0x1c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_12:
	setx	0x1e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 199: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbda81820  ! 201: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbdaac820  ! 203: FMOVGE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb33d0000  ! 206: SRA_R	sra 	%r20, %r0, %r25
	.word 0xb9a80420  ! 207: FMOVRZ	dis not found

cpu_intr_1_13:
	setx	0x1d030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 210: FMOVE	fmovs	%fcc1, %f0, %f25
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba58940  ! 215: FMULd	fmuld	%f22, %f0, %f60
	.word 0xbdaac820  ! 217: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_14:
	setx	0x1d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, a)
	.word 0xbba489a0  ! 223: FDIVs	fdivs	%f18, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_15:
	setx	0x1d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 230: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 232: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb63d6114  ! 238: XNOR_I	xnor 	%r21, 0x0114, %r27
T1_asi_reg_wr_19:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 241: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1a449e0  ! 242: FDIVq	dis not found

	.word 0xbda00540  ! 248: FSQRTd	fsqrt	
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_12:
	mov	0x15, %r14
	.word 0xf2db8e80  ! 250: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1a00560  ! 252: FSQRTq	fsqrt	
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a549e0  ! 257: FDIVq	dis not found

	.word 0xbda5c960  ! 258: FMULq	dis not found

T1_asi_reg_wr_20:
	mov	0x28, %r14
	.word 0xfef38400  ! 260: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb82cc000  ! 261: ANDN_R	andn 	%r19, %r0, %r28
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_16:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 269: FMOVRGEZ	dis not found

T1_asi_reg_rd_13:
	mov	0x21, %r14
	.word 0xf0db8400  ! 272: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_14:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 273: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_21:
	mov	0x1d, %r14
	.word 0xf0f38e80  ! 277: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfa589c0  ! 278: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb83da0ed  ! 279: XNOR_I	xnor 	%r22, 0x00ed, %r28
	.word 0xbfaa0820  ! 281: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_15:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a4c9c0  ! 286: FDIVd	fdivd	%f50, %f0, %f24
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_17:
	setx	0x1f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82d8000  ! 292: ANDN_R	andn 	%r22, %r0, %r28
T1_asi_reg_rd_16:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda88820  ! 295: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_22:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 297: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_23:
	mov	0xe, %r14
	.word 0xf2f38400  ! 298: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_18:
	setx	0x1e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_17:
	mov	0x2, %r14
	.word 0xf8db84a0  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb3a88820  ! 307: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_18:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_24:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 312: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_25:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 314: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb13c1000  ! 326: SRAX_R	srax	%r16, %r0, %r24
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1ab8820  ! 329: FMOVPOS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba5c960  ! 333: FMULq	dis not found

	.word 0xb1a4c9a0  ! 336: FDIVs	fdivs	%f19, %f0, %f24
T1_asi_reg_wr_26:
	mov	0x2f, %r14
	.word 0xf4f38e60  ! 340: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1a40820  ! 342: FADDs	fadds	%f16, %f0, %f24
T1_asi_reg_rd_19:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 343: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_27:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 345: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7a5c9a0  ! 349: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb7a448c0  ! 350: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbfaa0820  ! 355: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb09c6164  ! 356: XORcc_I	xorcc 	%r17, 0x0164, %r24
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_28:
	mov	0x9, %r14
	.word 0xf8f38400  ! 358: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xba3c0000  ! 359: XNOR_R	xnor 	%r16, %r0, %r29
T1_asi_reg_rd_20:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_19:
	setx	0x1d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc4000  ! 369: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xb4b54000  ! 370: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xb3a80420  ! 372: FMOVRZ	dis not found

cpu_intr_1_20:
	setx	0x1c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40920  ! 375: FMULs	fmuls	%f16, %f0, %f30
cpu_intr_1_21:
	setx	0x1d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588a0  ! 377: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xb5abc820  ! 380: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_22:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, f)
	.word 0xbdabc820  ! 383: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00520  ! 384: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_23:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0x19, %r14
	.word 0xfaf38e60  ! 400: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_22:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a54860  ! 403: FADDq	dis not found

iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbbaa8820  ! 407: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_24:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 412: FSQRTs	fsqrt	
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda58940  ! 414: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb1a80820  ! 416: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a54820  ! 422: FADDs	fadds	%f21, %f0, %f25
	.word 0xbda54960  ! 423: FMULq	dis not found

	.word 0xb7a44940  ! 425: FMULd	fmuld	%f48, %f0, %f58
T1_asi_reg_rd_23:
	mov	0x2d, %r14
	.word 0xf8db84a0  ! 426: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_30:
	mov	0x1f, %r14
	.word 0xfaf389e0  ! 429: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a94820  ! 430: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbda4c9e0  ! 432: FDIVq	dis not found

cpu_intr_1_25:
	setx	0x200032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58860  ! 434: FADDq	dis not found

	.word 0xb7a88820  ! 436: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_26:
	setx	0x210210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549a0  ! 444: FDIVs	fdivs	%f21, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_31:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 446: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_24:
	mov	0x21, %r14
	.word 0xf0db8400  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a588c0  ! 449: FSUBd	fsubd	%f22, %f0, %f58
cpu_intr_1_27:
	setx	0x20022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa90820  ! 453: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_28:
	setx	0x22002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 458: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_wr_32:
	mov	0x38, %r14
	.word 0xfef384a0  ! 460: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_29:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x22032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_31:
	setx	0x220031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a44820  ! 468: FADDs	fadds	%f17, %f0, %f27
T1_asi_reg_rd_25:
	mov	0x29, %r14
	.word 0xf2db8e80  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb0358000  ! 471: ORN_R	orn 	%r22, %r0, %r24
	.word 0xbfa00520  ! 472: FSQRTs	fsqrt	
cpu_intr_1_32:
	setx	0x200209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 474: FMOVRLZ	dis not found

	.word 0xb5a5c960  ! 476: FMULq	dis not found

T1_asi_reg_rd_26:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 477: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb09cc000  ! 483: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xb9a40960  ! 484: FMULq	dis not found

	.word 0xb1a84820  ! 489: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a81c20  ! 493: FMOVRGEZ	dis not found

iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 24)
	.word 0xbb2c4000  ! 504: SLL_R	sll 	%r17, %r0, %r29
T1_asi_reg_rd_27:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_33:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 510: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a94820  ! 511: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80420  ! 512: FMOVRZ	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba00560  ! 518: FSQRTq	fsqrt	
T1_asi_reg_rd_28:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 519: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_33:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ce1ae  ! 523: ANDN_I	andn 	%r19, 0x01ae, %r25
	.word 0xbfa58920  ! 524: FMULs	fmuls	%f22, %f0, %f31
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_29:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 528: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7a4c920  ! 530: FMULs	fmuls	%f19, %f0, %f27
T1_asi_reg_rd_31:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_34:
	setx	0x22031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 540: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_32:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 543: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_33:
	mov	0x2f, %r14
	.word 0xfcdb8e60  ! 544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xb3a81820  ! 549: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba409e0  ! 551: FDIVq	dis not found

	.word 0xb5aac820  ! 555: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_35:
	setx	0x21002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_37:
	setx	0x230227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x200006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbb7c8400  ! 564: MOVR_R	movre	%r18, %r0, %r29
	.word 0xb9a98820  ! 565: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_39:
	setx	0x21021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 568: FSQRTq	fsqrt	
	.word 0xbd3db001  ! 569: SRAX_I	srax	%r22, 0x0001, %r30
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_35:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_34:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 579: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_40:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549a0  ! 585: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb1a9c820  ! 586: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_41:
	setx	0x200208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_35:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 591: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb4bc8000  ! 593: XNORcc_R	xnorcc 	%r18, %r0, %r26
cpu_intr_1_42:
	setx	0x230213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, e)
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, f)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb32cc000  ! 617: SLL_R	sll 	%r19, %r0, %r25
T1_asi_reg_wr_36:
	mov	0x6, %r14
	.word 0xf2f389e0  ! 619: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9aa8820  ! 621: FMOVG	fmovs	%fcc1, %f0, %f28
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbda81c20  ! 627: FMOVRGEZ	dis not found

	.word 0xb5a80820  ! 629: FMOVN	fmovs	%fcc1, %f0, %f26
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_37:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 639: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_45:
	setx	0x20000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 649: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_38:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 652: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_46:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_47:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 660: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5a81c20  ! 661: FMOVRGEZ	dis not found

iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a00520  ! 664: FSQRTs	fsqrt	
	.word 0xbba4c940  ! 665: FMULd	fmuld	%f50, %f0, %f60
T1_asi_reg_rd_38:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbab50000  ! 669: SUBCcc_R	orncc 	%r20, %r0, %r29
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a4c8a0  ! 671: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb7a58940  ! 672: FMULd	fmuld	%f22, %f0, %f58
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 5)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb9a508a0  ! 678: FSUBs	fsubs	%f20, %f0, %f28
cpu_intr_1_48:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x220137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 689: FMOVRGEZ	dis not found

T1_asi_reg_wr_40:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 691: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9a5c840  ! 693: FADDd	faddd	%f54, %f0, %f28
	.word 0xb3a58860  ! 694: FADDq	dis not found

	.word 0xbfa5c840  ! 698: FADDd	faddd	%f54, %f0, %f62
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a50820  ! 709: FADDs	fadds	%f20, %f0, %f27
	.word 0xb3a44920  ! 711: FMULs	fmuls	%f17, %f0, %f25
cpu_intr_1_50:
	setx	0x220136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 714: FMOVGE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_41:
	mov	0xe, %r14
	.word 0xf4f384a0  ! 716: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_39:
	mov	0x17, %r14
	.word 0xfedb8e40  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe844000  ! 719: ADDcc_R	addcc 	%r17, %r0, %r31
cpu_intr_1_51:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50940  ! 721: FMULd	fmuld	%f20, %f0, %f24
cpu_intr_1_52:
	setx	0x21023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_42:
	mov	0x20, %r14
	.word 0xfef384a0  ! 726: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7aac820  ! 727: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_43:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 738: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9aa0820  ! 739: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_53:
	setx	0x20012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_54:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d0000  ! 747: XOR_R	xor 	%r20, %r0, %r29
cpu_intr_1_55:
	setx	0x210003, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_41:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb6b4a04c  ! 756: ORNcc_I	orncc 	%r18, 0x004c, %r27
T1_asi_reg_wr_44:
	mov	0x4, %r14
	.word 0xf6f38400  ! 760: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a00020  ! 764: FMOVs	fmovs	%f0, %f28
	.word 0xbfa81820  ! 766: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3a00560  ! 772: FSQRTq	fsqrt	
cpu_intr_1_56:
	setx	0x210103, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_45:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 775: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5a549c0  ! 777: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbba588a0  ! 778: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb9a00520  ! 781: FSQRTs	fsqrt	
cpu_intr_1_57:
	setx	0x230223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x10, %r14
	.word 0xfadb8e40  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_46:
	mov	0xf, %r14
	.word 0xfaf38400  ! 786: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbe954000  ! 790: ORcc_R	orcc 	%r21, %r0, %r31
	.word 0xb5a549a0  ! 791: FDIVs	fdivs	%f21, %f0, %f26
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb5a88820  ! 796: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_58:
	setx	0x230033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 808: FMOVRGEZ	dis not found

cpu_intr_1_59:
	setx	0x210139, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_43:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_44:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_60:
	setx	0x23030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7c0400  ! 818: MOVR_R	movre	%r16, %r0, %r29
	.word 0xbfa48860  ! 820: FADDq	dis not found

	.word 0xb9aac820  ! 823: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, e)
	.word 0xbda44820  ! 826: FADDs	fadds	%f17, %f0, %f30
cpu_intr_1_61:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 831: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a509e0  ! 833: FDIVq	dis not found

T1_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda5c9c0  ! 843: FDIVd	fdivd	%f54, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc9de160  ! 845: XORcc_I	xorcc 	%r23, 0x0160, %r30
T1_asi_reg_wr_47:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 856: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbe858000  ! 857: ADDcc_R	addcc 	%r22, %r0, %r31
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_46:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xba8d0000  ! 863: ANDcc_R	andcc 	%r20, %r0, %r29
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_48:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 878: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa4c8c0  ! 879: FSUBd	fsubd	%f50, %f0, %f62
T1_asi_reg_wr_49:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 880: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbd641800  ! 883: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_50:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 884: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_62:
	setx	0x21031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d1000  ! 893: SRAX_R	srax	%r20, %r0, %r31
T1_asi_reg_rd_47:
	mov	0x28, %r14
	.word 0xfedb8400  ! 895: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 897: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7a80c20  ! 899: FMOVRLZ	dis not found

iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a8c820  ! 903: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb9a54860  ! 904: FADDq	dis not found

	.word 0xb7a00520  ! 905: FSQRTs	fsqrt	
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_63:
	setx	0x25020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_48:
	mov	0x8, %r14
	.word 0xf4db8e60  ! 911: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a00540  ! 913: FSQRTd	fsqrt	
T1_asi_reg_rd_49:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbba88820  ! 920: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_52:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 923: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda5c9a0  ! 934: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb7aa4820  ! 935: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_53:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 937: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1aa0820  ! 938: FMOVA	fmovs	%fcc1, %f0, %f24
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_54:
	mov	0x31, %r14
	.word 0xf4f38e60  ! 941: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb89ca04d  ! 942: XORcc_I	xorcc 	%r18, 0x004d, %r28
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_64:
	setx	0x240201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 946: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbda81820  ! 948: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 31)
	.word 0xb77c8400  ! 956: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb9a448e0  ! 957: FSUBq	dis not found

iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 9)
	.word 0xb1a9c820  ! 959: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a00560  ! 961: FSQRTq	fsqrt	
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda00040  ! 968: FMOVd	fmovd	%f0, %f30
cpu_intr_1_65:
	setx	0x250200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e102  ! 976: WRPR_TPC_I	wrpr	%r23, 0x0102, %tpc
T1_asi_reg_rd_51:
	mov	0x3, %r14
	.word 0xf6db8400  ! 977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, b)
	.word 0xb2a4e19b  ! 986: SUBcc_I	subcc 	%r19, 0x019b, %r25
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_55:
	mov	0x35, %r14
	.word 0xfaf389e0  ! 992: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_52:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_53:
	mov	0x2f, %r14
	.word 0xf8db8e60  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5a4c940  ! 1004: FMULd	fmuld	%f50, %f0, %f26
cpu_intr_1_66:
	setx	0x250131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1cc000  ! 1008: XOR_R	xor 	%r19, %r0, %r29
	.word 0xb1a81c20  ! 1011: FMOVRGEZ	dis not found

iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_56:
	mov	0x37, %r14
	.word 0xf0f384a0  ! 1015: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5aa8820  ! 1016: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_67:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40940  ! 1018: FMULd	fmuld	%f16, %f0, %f30
cpu_intr_1_68:
	setx	0x250321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 1022: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00540  ! 1023: FSQRTd	fsqrt	
	.word 0xbfa00020  ! 1024: FMOVs	fmovs	%f0, %f31
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a4c9c0  ! 1027: FDIVd	fdivd	%f50, %f0, %f56
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_69:
	setx	0x270139, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_54:
	mov	0x2e, %r14
	.word 0xfadb89e0  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9a48820  ! 1036: FADDs	fadds	%f18, %f0, %f28
cpu_intr_1_70:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 1042: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa44960  ! 1045: FMULq	dis not found

iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfaa0820  ! 1047: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfaa0820  ! 1048: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_71:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbba84820  ! 1054: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbcbce087  ! 1059: XNORcc_I	xnorcc 	%r19, 0x0087, %r30
	.word 0xb7a00540  ! 1060: FSQRTd	fsqrt	
	.word 0xbba80820  ! 1061: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7ab4820  ! 1062: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_55:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 10)
	.word 0xba34a0c3  ! 1072: ORN_I	orn 	%r18, 0x00c3, %r29
	.word 0xb5a509a0  ! 1073: FDIVs	fdivs	%f20, %f0, %f26
cpu_intr_1_72:
	setx	0x25030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1076: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb9a9c820  ! 1077: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50920  ! 1079: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb7a90820  ! 1081: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1a80820  ! 1085: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb9a84820  ! 1086: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_73:
	setx	0x24001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x25, %r14
	.word 0xfedb8400  ! 1096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_rd_57:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbba50940  ! 1099: FMULd	fmuld	%f20, %f0, %f60
T1_asi_reg_wr_57:
	mov	0x37, %r14
	.word 0xf4f384a0  ! 1103: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa409e0  ! 1109: FDIVq	dis not found

T1_asi_reg_rd_58:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_74:
	setx	0x260225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_75:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x240020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d4000  ! 1123: ANDcc_R	andcc 	%r21, %r0, %r28
T1_asi_reg_wr_58:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 1124: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba449a0  ! 1126: FDIVs	fdivs	%f17, %f0, %f29
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a80420  ! 1131: FMOVRZ	dis not found

T1_asi_reg_rd_59:
	mov	0x1a, %r14
	.word 0xfedb8e60  ! 1133: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_78:
	setx	0x260023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 1136: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_60:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 1137: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a44860  ! 1138: FADDq	dis not found

	.word 0xbda81c20  ! 1139: FMOVRGEZ	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_59:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 1142: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7a00040  ! 1145: FMOVd	fmovd	%f0, %f58
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_79:
	setx	0x26013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0xe, %r14
	.word 0xfadb84a0  ! 1149: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1a94820  ! 1150: FMOVCS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00020  ! 1157: FMOVs	fmovs	%f0, %f27
T1_asi_reg_wr_60:
	mov	0x20, %r14
	.word 0xfcf389e0  ! 1161: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda48840  ! 1164: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a548a0  ! 1168: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb3a98820  ! 1169: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbfab8820  ! 1170: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbc1d0000  ! 1172: XOR_R	xor 	%r20, %r0, %r30
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9ab4820  ! 1185: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a5c940  ! 1187: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb7a48940  ! 1189: FMULd	fmuld	%f18, %f0, %f58
T1_asi_reg_rd_63:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 1193: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_61:
	mov	0xe, %r14
	.word 0xf4f38e80  ! 1194: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_64:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbac44000  ! 1196: ADDCcc_R	addccc 	%r17, %r0, %r29
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa00560  ! 1200: FSQRTq	fsqrt	
T1_asi_reg_wr_62:
	mov	0x6, %r14
	.word 0xf2f38400  ! 1202: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_65:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1a80820  ! 1206: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbba81820  ! 1208: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_80:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1213: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a549e0  ! 1215: FDIVq	dis not found

cpu_intr_1_82:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_63:
	mov	0x8, %r14
	.word 0xfef38400  ! 1219: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba588a0  ! 1222: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb5a448e0  ! 1225: FSUBq	dis not found

	.word 0xb1a509e0  ! 1227: FDIVq	dis not found

iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_64:
	mov	0x3, %r14
	.word 0xf8f389e0  ! 1234: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbba40860  ! 1236: FADDq	dis not found

	.word 0xb9a4c840  ! 1237: FADDd	faddd	%f50, %f0, %f28
	.word 0xbfa00540  ! 1238: FSQRTd	fsqrt	
	.word 0xb3a5c920  ! 1240: FMULs	fmuls	%f23, %f0, %f25
cpu_intr_1_83:
	setx	0x25023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946154  ! 1244: WRPR_TPC_I	wrpr	%r17, 0x0154, %tpc
	.word 0xb7a81c20  ! 1245: FMOVRGEZ	dis not found

iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb1a00040  ! 1249: FMOVd	fmovd	%f0, %f24
	.word 0xb1a80c20  ! 1250: FMOVRLZ	dis not found

	.word 0xb3a98820  ! 1252: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a80c20  ! 1259: FMOVRLZ	dis not found

iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_84:
	setx	0x25003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_85:
	setx	0x26030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x270307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x24032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_89:
	setx	0x270102, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x36, %r14
	.word 0xfedb84a0  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7a9c820  ! 1283: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_90:
	setx	0x240237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x24013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 1295: FMOVd	fmovd	%f0, %f30
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1a80820  ! 1299: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb9a8c820  ! 1300: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_92:
	setx	0x26003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_68:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a80820  ! 1306: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa8820  ! 1307: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_65:
	mov	0x1e, %r14
	.word 0xf2f389e0  ! 1308: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_93:
	setx	0x250112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 1317: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a40960  ! 1319: FMULq	dis not found

cpu_intr_1_94:
	setx	0x260015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 1326: FSQRTq	fsqrt	
	.word 0xb1a8c820  ! 1329: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb01521e0  ! 1332: OR_I	or 	%r20, 0x01e0, %r24
	.word 0xb3a4c940  ! 1333: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb6ad4000  ! 1334: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb3a508a0  ! 1338: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xbfa00560  ! 1339: FSQRTq	fsqrt	
T1_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 1341: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_67:
	mov	0x31, %r14
	.word 0xf2f38e80  ! 1347: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_95:
	setx	0x24030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589a0  ! 1350: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xbfa84820  ! 1351: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 34)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbf358000  ! 1357: SRL_R	srl 	%r22, %r0, %r31
cpu_intr_1_96:
	setx	0x26001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 20)
	.word 0xbbaa0820  ! 1362: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_68:
	mov	0xe, %r14
	.word 0xf4f38400  ! 1366: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9abc820  ! 1372: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_97:
	setx	0x290002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_98:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 1377: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a88820  ! 1379: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda80420  ! 1380: FMOVRZ	dis not found

	.word 0xb9a508c0  ! 1382: FSUBd	fsubd	%f20, %f0, %f28
cpu_intr_1_99:
	setx	0x280011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58940  ! 1384: FMULd	fmuld	%f22, %f0, %f56
cpu_intr_1_100:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e02a  ! 1388: WRPR_TNPC_I	wrpr	%r19, 0x002a, %tnpc
	.word 0xb5a48960  ! 1389: FMULq	dis not found

	.word 0xb7a81820  ! 1392: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_rd_69:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 1393: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_70:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 1397: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9a5c8e0  ! 1399: FSUBq	dis not found

cpu_intr_1_101:
	setx	0x29030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 1401: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_102:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48960  ! 1410: FMULq	dis not found

cpu_intr_1_103:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda44960  ! 1412: FMULq	dis not found

	.word 0xbe0d4000  ! 1413: AND_R	and 	%r21, %r0, %r31
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_71:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1416: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_72:
	mov	0x14, %r14
	.word 0xfef389e0  ! 1417: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_104:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1419: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_70:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb83d0000  ! 1422: XNOR_R	xnor 	%r20, %r0, %r28
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_105:
	setx	0x2a002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_71:
	mov	0x24, %r14
	.word 0xfedb8400  ! 1427: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbba84820  ! 1428: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_73:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 1435: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9351000  ! 1438: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xbba84820  ! 1439: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbba80420  ! 1442: FMOVRZ	dis not found

T1_asi_reg_rd_72:
	mov	0x22, %r14
	.word 0xf2db89e0  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9a48940  ! 1450: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb035e103  ! 1452: ORN_I	orn 	%r23, 0x0103, %r24
cpu_intr_1_106:
	setx	0x2b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_74:
	mov	0xa, %r14
	.word 0xfef384a0  ! 1458: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbba00520  ! 1459: FSQRTs	fsqrt	
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_107:
	setx	0x2b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44860  ! 1464: FADDq	dis not found

	.word 0xb9aac820  ! 1468: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a409e0  ! 1471: FDIVq	dis not found

T1_asi_reg_wr_75:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 1472: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7aa8820  ! 1478: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81420  ! 1481: FMOVRNZ	dis not found

	.word 0xb7a5c820  ! 1485: FADDs	fadds	%f23, %f0, %f27
	.word 0xbba409e0  ! 1486: FDIVq	dis not found

iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_108:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_109:
	setx	0x2a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9a0  ! 1493: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xb9a5c9e0  ! 1494: FDIVq	dis not found

T1_asi_reg_rd_73:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbcbd616f  ! 1505: XNORcc_I	xnorcc 	%r21, 0x016f, %r30
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa84820  ! 1512: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb8bda16b  ! 1513: XNORcc_I	xnorcc 	%r22, 0x016b, %r28
	.word 0xb32d9000  ! 1516: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xb8a5c000  ! 1517: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xbdaa4820  ! 1518: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_110:
	setx	0x280106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a98820  ! 1524: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1525: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_wr_77:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 1526: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_74:
	mov	0x29, %r14
	.word 0xfcdb8400  ! 1529: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_111:
	setx	0x280226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 1532: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5354000  ! 1538: SRL_R	srl 	%r21, %r0, %r26
cpu_intr_1_112:
	setx	0x2b0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 26)
	.word 0xbbabc820  ! 1544: FMOVVC	fmovs	%fcc1, %f0, %f29
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_75:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_76:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5aa0820  ! 1557: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 1558: FMOVRNZ	dis not found

T1_asi_reg_rd_77:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1566: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_78:
	mov	0x14, %r14
	.word 0xfef38e40  ! 1567: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbba00560  ! 1568: FSQRTq	fsqrt	
	.word 0xbda50920  ! 1569: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb9a589e0  ! 1572: FDIVq	dis not found

	.word 0xb7a50960  ! 1574: FMULq	dis not found

	.word 0xb5a00560  ! 1577: FSQRTq	fsqrt	
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 11)
	.word 0xb22d8000  ! 1580: ANDN_R	andn 	%r22, %r0, %r25
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_113:
	setx	0x290005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_79:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 1587: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_80:
	mov	0x37, %r14
	.word 0xfcf384a0  ! 1592: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7aa0820  ! 1593: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a94820  ! 1594: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb92d2001  ! 1595: SLL_I	sll 	%r20, 0x0001, %r28
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda4c920  ! 1600: FMULs	fmuls	%f19, %f0, %f30
cpu_intr_1_114:
	setx	0x280108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 1604: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9aac820  ! 1610: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5aa8820  ! 1612: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_115:
	setx	0x280334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335a001  ! 1614: SRL_I	srl 	%r22, 0x0001, %r25
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_116:
	setx	0x28001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1618: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_81:
	mov	0x33, %r14
	.word 0xfef38e40  ! 1620: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_82:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 1623: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a9c820  ! 1624: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb8a44000  ! 1625: SUBcc_R	subcc 	%r17, %r0, %r28
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 3e)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbe3c60c4  ! 1635: XNOR_I	xnor 	%r17, 0x00c4, %r31
T1_asi_reg_rd_78:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 1636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_117:
	setx	0x2a0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa80420  ! 1644: FMOVRZ	dis not found

	.word 0xb3a448e0  ! 1647: FSUBq	dis not found

iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 39)
	.word 0xb9a84820  ! 1650: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_118:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_79:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_80:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 1661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a00520  ! 1662: FSQRTs	fsqrt	
cpu_intr_1_119:
	setx	0x28031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 1664: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_83:
	mov	0x25, %r14
	.word 0xf6f38400  ! 1667: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb17dc400  ! 1669: MOVR_R	movre	%r23, %r0, %r24
	.word 0xbba4c9a0  ! 1670: FDIVs	fdivs	%f19, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_81:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb2040000  ! 1676: ADD_R	add 	%r16, %r0, %r25
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 10)
	.word 0xb3a488e0  ! 1678: FSUBq	dis not found

	.word 0xbda489e0  ! 1679: FDIVq	dis not found

	.word 0xb81d4000  ! 1682: XOR_R	xor 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_120:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 1686: FMOVd	fmovd	%f0, %f60
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a94820  ! 1689: FMOVCS	fmovs	%fcc1, %f0, %f27
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a488e0  ! 1693: FSUBq	dis not found

iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a80420  ! 1697: FMOVRZ	dis not found

T1_asi_reg_rd_82:
	mov	0x11, %r14
	.word 0xf0db89e0  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb42521ad  ! 1701: SUB_I	sub 	%r20, 0x01ad, %r26
	.word 0xb5341000  ! 1703: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xb9a81c20  ! 1704: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a54000  ! 1710: SUBcc_R	subcc 	%r21, %r0, %r24
cpu_intr_1_121:
	setx	0x2b022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_83:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_122:
	setx	0x280230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d0000  ! 1723: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xbc8ca161  ! 1726: ANDcc_I	andcc 	%r18, 0x0161, %r30
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a94820  ! 1735: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9abc820  ! 1737: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00020  ! 1738: FMOVs	fmovs	%f0, %f27
T1_asi_reg_rd_84:
	mov	0x30, %r14
	.word 0xfcdb8e60  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_123:
	setx	0x290025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_84:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 1746: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a449c0  ! 1748: FDIVd	fdivd	%f48, %f0, %f56
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfab8820  ! 1751: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_85:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 1752: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3a94820  ! 1757: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_124:
	setx	0x2b0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 1761: FSQRTd	fsqrt	
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_125:
	setx	0x2b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 1767: FMULs	fmuls	%f21, %f0, %f24
cpu_intr_1_126:
	setx	0x2b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_85:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbf50c000  ! 1775: RDPR_TT	<illegal instruction>
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_127:
	setx	0x280338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 1784: FSQRTd	fsqrt	
T1_asi_reg_rd_86:
	mov	0x37, %r14
	.word 0xf4db84a0  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_128:
	setx	0x29002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 1787: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_87:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 1795: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a00540  ! 1796: FSQRTd	fsqrt	
cpu_intr_1_129:
	setx	0x2a0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a00520  ! 1801: FSQRTs	fsqrt	
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a90820  ! 1803: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_88:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 1805: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_87:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1812: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a4c9c0  ! 1814: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb1a88820  ! 1815: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a5c860  ! 1819: FADDq	dis not found

cpu_intr_1_130:
	setx	0x2c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x2f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 1824: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_91:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 1827: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda5c9c0  ! 1832: FDIVd	fdivd	%f54, %f0, %f30
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_92:
	mov	0x19, %r14
	.word 0xf0f38400  ! 1839: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfa94820  ! 1840: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81420  ! 1841: FMOVRNZ	dis not found

	.word 0xbc0560d9  ! 1843: ADD_I	add 	%r21, 0x00d9, %r30
	.word 0xb235e18d  ! 1844: SUBC_I	orn 	%r23, 0x018d, %r25
T1_asi_reg_wr_93:
	mov	0x6, %r14
	.word 0xf0f38400  ! 1846: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbda00520  ! 1848: FSQRTs	fsqrt	
T1_asi_reg_wr_94:
	mov	0x2, %r14
	.word 0xfcf38e60  ! 1849: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbe3ce015  ! 1851: XNOR_I	xnor 	%r19, 0x0015, %r31
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_95:
	mov	0x2c, %r14
	.word 0xf2f384a0  ! 1854: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_88:
	mov	0xf, %r14
	.word 0xf4db8e60  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfa58920  ! 1863: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbdaa4820  ! 1865: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa00560  ! 1872: FSQRTq	fsqrt	
	.word 0xb3a40860  ! 1875: FADDq	dis not found

T1_asi_reg_rd_89:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda40860  ! 1878: FADDq	dis not found

	.word 0xbdaa0820  ! 1879: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb6b44000  ! 1880: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xbda58840  ! 1881: FADDd	faddd	%f22, %f0, %f30
	.word 0xbfab0820  ! 1882: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_132:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 1889: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00020  ! 1890: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_96:
	mov	0x28, %r14
	.word 0xf4f38400  ! 1894: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfaa4820  ! 1895: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 1897: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3a00520  ! 1898: FSQRTs	fsqrt	
	.word 0xbba8c820  ! 1899: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_98:
	mov	0x14, %r14
	.word 0xf8f389e0  ! 1900: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_99:
	mov	0xf, %r14
	.word 0xfef38e80  ! 1903: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_133:
	setx	0x2d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a548e0  ! 1910: FSUBq	dis not found

T1_asi_reg_rd_91:
	mov	0x22, %r14
	.word 0xf0db8e60  ! 1913: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a94820  ! 1917: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_134:
	setx	0x2e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_92:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 1923: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_135:
	setx	0x2d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_100:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 1929: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_136:
	setx	0x2f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 1934: FMOVRZ	dis not found

iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 9)
	.word 0xbda80820  ! 1938: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_137:
	setx	0x2c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_101:
	mov	0x15, %r14
	.word 0xfcf384a0  ! 1945: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbda80820  ! 1947: FMOVN	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_102:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 1955: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb49cc000  ! 1956: XORcc_R	xorcc 	%r19, %r0, %r26
cpu_intr_1_138:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 1959: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb2ad0000  ! 1960: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xb5a4c8e0  ! 1966: FSUBq	dis not found

	.word 0xbba58820  ! 1969: FADDs	fadds	%f22, %f0, %f29
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a58960  ! 1977: FMULq	dis not found

	.word 0xb1a4c920  ! 1978: FMULs	fmuls	%f19, %f0, %f24
cpu_intr_1_139:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0xc, %r14
	.word 0xfef38e80  ! 1983: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_93:
	mov	0x28, %r14
	.word 0xf4db8e60  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a509a0  ! 1987: FDIVs	fdivs	%f20, %f0, %f28
T1_asi_reg_rd_94:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 1989: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a00040  ! 1991: FMOVd	fmovd	%f0, %f58
	.word 0xb5a40860  ! 1995: FADDq	dis not found

	.word 0xb9a5c860  ! 1996: FADDq	dis not found

	.word 0xbda48960  ! 1997: FMULq	dis not found

iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 26)
	.word 0xb1a5c860  ! 2000: FADDq	dis not found

	.word 0xb6a4c000  ! 2006: SUBcc_R	subcc 	%r19, %r0, %r27
cpu_intr_1_140:
	setx	0x2e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 32)
	.word 0xba2ca198  ! 2015: ANDN_I	andn 	%r18, 0x0198, %r29
	.word 0xb23d4000  ! 2016: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xb7a8c820  ! 2018: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00540  ! 2019: FSQRTd	fsqrt	
	.word 0xbfa80820  ! 2020: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_141:
	setx	0x2e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 2024: FMOVRGEZ	dis not found

	.word 0xb7a5c9e0  ! 2027: FDIVq	dis not found

	.word 0xbfa00540  ! 2032: FSQRTd	fsqrt	
	.word 0xbda81420  ! 2033: FMOVRNZ	dis not found

cpu_intr_1_142:
	setx	0x2d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_104:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 2038: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_143:
	setx	0x2d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2045: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00520  ! 2046: FSQRTs	fsqrt	
	.word 0xb77d8400  ! 2048: MOVR_R	movre	%r22, %r0, %r27
	.word 0xbda9c820  ! 2051: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_144:
	setx	0x2c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408e0  ! 2061: FSUBq	dis not found

iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, e)
	.word 0xbda58840  ! 2063: FADDd	faddd	%f22, %f0, %f30
T1_asi_reg_wr_105:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 2065: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbb34f001  ! 2067: SRLX_I	srlx	%r19, 0x0001, %r29
T1_asi_reg_wr_106:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2068: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa44940  ! 2069: FMULd	fmuld	%f48, %f0, %f62
cpu_intr_1_145:
	setx	0x2d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x2f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 2074: FSQRTq	fsqrt	
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_147:
	setx	0x2d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_95:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb43da083  ! 2087: XNOR_I	xnor 	%r22, 0x0083, %r26
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a80820  ! 2090: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_107:
	mov	0xc, %r14
	.word 0xf4f38e60  ! 2091: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_108:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 2093: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_109:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 2095: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a448e0  ! 2097: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81c20  ! 2103: FMOVRGEZ	dis not found

cpu_intr_1_148:
	setx	0x2d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 2109: FMOVRGEZ	dis not found

cpu_intr_1_149:
	setx	0x2f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8348000  ! 2117: SUBC_R	orn 	%r18, %r0, %r28
	.word 0xb3641800  ! 2118: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_96:
	mov	0x30, %r14
	.word 0xfedb8400  ! 2121: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_rd_97:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_110:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 2126: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5a588c0  ! 2128: FSUBd	fsubd	%f22, %f0, %f26
cpu_intr_1_150:
	setx	0x2e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 2130: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_151:
	setx	0x2f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_111:
	mov	0x31, %r14
	.word 0xf0f38400  ! 2154: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7a4c9e0  ! 2155: FDIVq	dis not found

T1_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 2156: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1ab4820  ! 2157: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a50940  ! 2158: FMULd	fmuld	%f20, %f0, %f28
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba548a0  ! 2162: FSUBs	fsubs	%f21, %f0, %f29
T1_asi_reg_rd_98:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 2163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_113:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 2165: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbb518000  ! 2166: RDPR_PSTATE	<illegal instruction>
	.word 0xbda00040  ! 2167: FMOVd	fmovd	%f0, %f30
	.word 0xb4348000  ! 2169: ORN_R	orn 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00560  ! 2177: FSQRTq	fsqrt	
	.word 0xb1a00520  ! 2178: FSQRTs	fsqrt	
	.word 0xbfa54940  ! 2179: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb9a80c20  ! 2182: FMOVRLZ	dis not found

iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_152:
	setx	0x2e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 2189: FMOVs	fmovs	%f0, %f31
cpu_intr_1_154:
	setx	0x2f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 2193: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_155:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a00560  ! 2198: FSQRTq	fsqrt	
	.word 0xb7a00520  ! 2200: FSQRTs	fsqrt	
cpu_intr_1_156:
	setx	0x2f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 2202: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_114:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 2206: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a58860  ! 2207: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_115:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 2210: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda00560  ! 2217: FSQRTq	fsqrt	
	.word 0xb5a509e0  ! 2219: FDIVq	dis not found

	.word 0xb9abc820  ! 2220: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_157:
	setx	0x2f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_158:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449a0  ! 2230: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xb5a54960  ! 2233: FMULq	dis not found

iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba54940  ! 2235: FMULd	fmuld	%f52, %f0, %f60
T1_asi_reg_wr_116:
	mov	0x15, %r14
	.word 0xfaf384a0  ! 2236: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa00540  ! 2237: FSQRTd	fsqrt	
cpu_intr_1_160:
	setx	0x2d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_161:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_117:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 2247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba549a0  ! 2248: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xbbaa0820  ! 2252: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbbaac820  ! 2253: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_162:
	setx	0x2f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x11, %r14
	.word 0xf8db8e80  ! 2259: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5a81c20  ! 2263: FMOVRGEZ	dis not found

cpu_intr_1_163:
	setx	0x2d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c9e0  ! 2265: FDIVq	dis not found

iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2267: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a84820  ! 2277: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_164:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_165:
	setx	0x2f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 12)
	.word 0xbba509a0  ! 2288: FDIVs	fdivs	%f20, %f0, %f29
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 34)
	.word 0xb9a00040  ! 2290: FMOVd	fmovd	%f0, %f28
	.word 0xb9a80420  ! 2291: FMOVRZ	dis not found

	.word 0xbda80820  ! 2292: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbfa548c0  ! 2294: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xbda94820  ! 2298: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a90820  ! 2300: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_101:
	mov	0x0, %r14
	.word 0xf2db89e0  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_wr_119:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 2306: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, e)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_166:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 2317: FSQRTs	fsqrt	
T1_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 2318: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_103:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_105:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 2333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a00560  ! 2334: FSQRTq	fsqrt	
cpu_intr_1_167:
	setx	0x30030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 2336: FMOVRNZ	dis not found

cpu_intr_1_168:
	setx	0x320334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba449c0  ! 2345: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbfa00540  ! 2346: FSQRTd	fsqrt	
T1_asi_reg_wr_120:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 2347: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_169:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_106:
	mov	0x38, %r14
	.word 0xf8db89e0  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_121:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 2355: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_122:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 2361: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a50820  ! 2362: FADDs	fadds	%f20, %f0, %f25
	.word 0xbbab0820  ! 2365: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_107:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_123:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 2367: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_108:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_109:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_170:
	setx	0x320225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 2380: FMOVRLZ	dis not found

	.word 0xba044000  ! 2384: ADD_R	add 	%r17, %r0, %r29
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a00540  ! 2391: FSQRTd	fsqrt	
T1_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_111:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 2395: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2396: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_171:
	setx	0x31023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_125:
	mov	0x18, %r14
	.word 0xfef38e80  ! 2398: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_112:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_172:
	setx	0x330211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 2407: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb1a00540  ! 2408: FSQRTd	fsqrt	
	.word 0xb1aa4820  ! 2410: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_126:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 2411: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_113:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda00520  ! 2420: FSQRTs	fsqrt	
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_127:
	mov	0x17, %r14
	.word 0xfaf389e0  ! 2427: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_114:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9a80420  ! 2429: FMOVRZ	dis not found

cpu_intr_1_173:
	setx	0x31031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 2433: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfaa0820  ! 2436: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_174:
	setx	0x330222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 2439: FADDs	fadds	%f18, %f0, %f26
cpu_intr_1_175:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 2444: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2445: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_176:
	setx	0x330232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 2448: FSQRTs	fsqrt	
	.word 0xbba44960  ! 2449: FMULq	dis not found

	.word 0x8194a084  ! 2451: WRPR_TPC_I	wrpr	%r18, 0x0084, %tpc
	.word 0xb37d8400  ! 2453: MOVR_R	movre	%r22, %r0, %r25
T1_asi_reg_rd_115:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 2454: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_177:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48860  ! 2457: FADDq	dis not found

T1_asi_reg_wr_131:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 2458: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, a)
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_178:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48940  ! 2479: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbda00540  ! 2480: FSQRTd	fsqrt	
cpu_intr_1_179:
	setx	0x31010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0xe, %r14
	.word 0xf8f38e80  ! 2489: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_180:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 2491: FSQRTd	fsqrt	
T1_asi_reg_wr_133:
	mov	0xc, %r14
	.word 0xfcf38400  ! 2492: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_181:
	setx	0x31033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_116:
	mov	0x37, %r14
	.word 0xf4db8400  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7a00020  ! 2495: FMOVs	fmovs	%f0, %f27
	.word 0xb5a00040  ! 2503: FMOVd	fmovd	%f0, %f26
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a00020  ! 2506: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_117:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_134:
	mov	0x4, %r14
	.word 0xfef389e0  ! 2509: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_182:
	setx	0x320202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_135:
	mov	0x1b, %r14
	.word 0xfcf389e0  ! 2514: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a98820  ! 2515: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbd540000  ! 2516: RDPR_GL	<illegal instruction>
	.word 0xb5a00040  ! 2521: FMOVd	fmovd	%f0, %f26
	.word 0xb3a50920  ! 2522: FMULs	fmuls	%f20, %f0, %f25
T1_asi_reg_rd_118:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 2527: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5a54840  ! 2528: FADDd	faddd	%f52, %f0, %f26
cpu_intr_1_183:
	setx	0x320321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3a488e0  ! 2537: FSUBq	dis not found

	.word 0xb5a00560  ! 2545: FSQRTq	fsqrt	
	.word 0xbda00560  ! 2547: FSQRTq	fsqrt	
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 22)
	.word 0xba2dc000  ! 2553: ANDN_R	andn 	%r23, %r0, %r29
cpu_intr_1_184:
	setx	0x310301, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_136:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 2557: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfaac820  ! 2560: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_137:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2562: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_185:
	setx	0x300317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_120:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 2571: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_121:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3a5c940  ! 2581: FMULd	fmuld	%f54, %f0, %f56
T1_asi_reg_wr_138:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 2583: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_186:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a80820  ! 2594: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbda00020  ! 2595: FMOVs	fmovs	%f0, %f30
	.word 0xb7a589c0  ! 2597: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb1a81c20  ! 2598: FMOVRGEZ	dis not found

iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a81820  ! 2602: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_187:
	setx	0x310217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 2604: FSQRTs	fsqrt	
	.word 0xb7aa0820  ! 2605: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba48920  ! 2606: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb03521e3  ! 2607: ORN_I	orn 	%r20, 0x01e3, %r24
cpu_intr_1_188:
	setx	0x300028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80ce195  ! 2611: AND_I	and 	%r19, 0x0195, %r28
	.word 0xbfab0820  ! 2612: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_189:
	setx	0x31001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_190:
	setx	0x310012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 2623: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00020  ! 2628: FMOVs	fmovs	%f0, %f31
	.word 0xb9a9c820  ! 2629: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 2631: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_191:
	setx	0x33010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_192:
	setx	0x330012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba588a0  ! 2641: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb9a80820  ! 2642: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb834216e  ! 2645: SUBC_I	orn 	%r16, 0x016e, %r28
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a588a0  ! 2648: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb1a00540  ! 2650: FSQRTd	fsqrt	
	.word 0xba942187  ! 2651: ORcc_I	orcc 	%r16, 0x0187, %r29
	.word 0xbfa81420  ! 2652: FMOVRNZ	dis not found

	.word 0xb9a00040  ! 2653: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_140:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 2657: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb4c5212c  ! 2658: ADDCcc_I	addccc 	%r20, 0x012c, %r26
	.word 0xb1aa4820  ! 2659: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb5abc820  ! 2664: FMOVVC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_122:
	mov	0x2d, %r14
	.word 0xfcdb8e60  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbda00020  ! 2669: FMOVs	fmovs	%f0, %f30
cpu_intr_1_193:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 2679: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_194:
	setx	0x300113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35e0e8  ! 2683: SUBC_I	orn 	%r23, 0x00e8, %r30
T1_asi_reg_wr_141:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2684: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba00540  ! 2690: FSQRTd	fsqrt	
cpu_intr_1_195:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48920  ! 2692: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbdaa4820  ! 2695: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_123:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 2696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_196:
	setx	0x310221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a58820  ! 2706: FADDs	fadds	%f22, %f0, %f25
	.word 0xba342032  ! 2709: ORN_I	orn 	%r16, 0x0032, %r29
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_124:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_197:
	setx	0x300236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_198:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a50940  ! 2719: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbda94820  ! 2722: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbcb520f0  ! 2724: ORNcc_I	orncc 	%r20, 0x00f0, %r30
cpu_intr_1_199:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 2729: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_125:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_200:
	setx	0x320131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5a08d  ! 2735: ORNcc_I	orncc 	%r22, 0x008d, %r26
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb73d2001  ! 2737: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xb0bd21dd  ! 2739: XNORcc_I	xnorcc 	%r20, 0x01dd, %r24
	.word 0xbfa44960  ! 2740: FMULq	dis not found

iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_201:
	setx	0x36003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 2748: FADDs	fadds	%f21, %f0, %f28
	.word 0xb5a54820  ! 2750: FADDs	fadds	%f21, %f0, %f26
	.word 0xba84e1ff  ! 2751: ADDcc_I	addcc 	%r19, 0x01ff, %r29
cpu_intr_1_202:
	setx	0x37002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_142:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 2760: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a00540  ! 2767: FSQRTd	fsqrt	
	.word 0xb1a00040  ! 2770: FMOVd	fmovd	%f0, %f24
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7ab4820  ! 2773: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbcc44000  ! 2777: ADDCcc_R	addccc 	%r17, %r0, %r30
cpu_intr_1_203:
	setx	0x350122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45c000  ! 2779: ADDC_R	addc 	%r23, %r0, %r29
cpu_intr_1_204:
	setx	0x35012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb40cc000  ! 2784: AND_R	and 	%r19, %r0, %r26
T1_asi_reg_rd_126:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa509c0  ! 2788: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb7a00520  ! 2790: FSQRTs	fsqrt	
	.word 0xbda00540  ! 2791: FSQRTd	fsqrt	
cpu_intr_1_205:
	setx	0x360106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a00540  ! 2799: FSQRTd	fsqrt	
cpu_intr_1_206:
	setx	0x37030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb045a153  ! 2803: ADDC_I	addc 	%r22, 0x0153, %r24
T1_asi_reg_rd_127:
	mov	0x13, %r14
	.word 0xfcdb8e80  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a81820  ! 2805: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb61d4000  ! 2806: XOR_R	xor 	%r21, %r0, %r27
cpu_intr_1_207:
	setx	0x360114, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_128:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 2813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_208:
	setx	0x360131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x370130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_210:
	setx	0x34000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1dc000  ! 2820: XOR_R	xor 	%r23, %r0, %r30
cpu_intr_1_211:
	setx	0x34030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_143:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 2825: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_144:
	mov	0x2d, %r14
	.word 0xf4f38400  ! 2828: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_212:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_213:
	setx	0x360338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c940  ! 2832: FMULd	fmuld	%f50, %f0, %f60
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 14)
	.word 0xb4bca078  ! 2838: XNORcc_I	xnorcc 	%r18, 0x0078, %r26
	.word 0xb3a40820  ! 2839: FADDs	fadds	%f16, %f0, %f25
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_214:
	setx	0x370228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_215:
	setx	0x370103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 2853: FMOVRLZ	dis not found

cpu_intr_1_216:
	setx	0x360025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_217:
	setx	0x37033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0054000  ! 2867: ADD_R	add 	%r21, %r0, %r24
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_145:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 2870: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_146:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 2871: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_130:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 2872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_131:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a00540  ! 2875: FSQRTd	fsqrt	
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_218:
	setx	0x37030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_219:
	setx	0x350026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a408e0  ! 2886: FSUBq	dis not found

	.word 0xb7a449a0  ! 2888: FDIVs	fdivs	%f17, %f0, %f27
cpu_intr_1_220:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2891: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a94820  ! 2894: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba48820  ! 2898: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_132:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a81420  ! 2903: FMOVRNZ	dis not found

cpu_intr_1_221:
	setx	0x34021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_222:
	setx	0x37023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5a065  ! 2908: ORNcc_I	orncc 	%r22, 0x0065, %r26
	.word 0xb1a5c920  ! 2910: FMULs	fmuls	%f23, %f0, %f24
T1_asi_reg_rd_133:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0x919421e6  ! 2913: WRPR_PIL_I	wrpr	%r16, 0x01e6, %pil
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_223:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_135:
	mov	0x12, %r14
	.word 0xf6db89e0  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbfa488e0  ! 2921: FSUBq	dis not found

T1_asi_reg_rd_136:
	mov	0x5, %r14
	.word 0xf4db84a0  ! 2922: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_147:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 2923: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_148:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 2924: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba00040  ! 2927: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_149:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 2929: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a588c0  ! 2930: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_137:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 2932: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_224:
	setx	0x35013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_150:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2936: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_225:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_151:
	mov	0x2f, %r14
	.word 0xf6f38e80  ! 2939: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_138:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2942: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_226:
	setx	0x37021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_227:
	setx	0x340010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_139:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_152:
	mov	0x1a, %r14
	.word 0xfef38400  ! 2948: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb0ad61a4  ! 2951: ANDNcc_I	andncc 	%r21, 0x01a4, %r24
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7a80820  ! 2953: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a8c820  ! 2954: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbba48820  ! 2955: FADDs	fadds	%f18, %f0, %f29
T1_asi_reg_wr_153:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 2959: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbba84820  ! 2960: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 23)
	.word 0x8194600a  ! 2967: WRPR_TPC_I	wrpr	%r17, 0x000a, %tpc
	.word 0xbba5c960  ! 2968: FMULq	dis not found

	.word 0xbda50960  ! 2969: FMULq	dis not found

T1_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 33)
	.word 0x819420e7  ! 2974: WRPR_TPC_I	wrpr	%r16, 0x00e7, %tpc
	.word 0xb3a448a0  ! 2975: FSUBs	fsubs	%f17, %f0, %f25
T1_asi_reg_rd_141:
	mov	0x1f, %r14
	.word 0xfcdb84a0  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7a50820  ! 2984: FADDs	fadds	%f20, %f0, %f27
	.word 0xb3ab8820  ! 2985: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda00560  ! 2995: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 2997: FSQRTs	fsqrt	
T1_asi_reg_rd_142:
	mov	0x13, %r14
	.word 0xfedb8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5a5c920  ! 3003: FMULs	fmuls	%f23, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_154:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3007: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbc9ca04d  ! 3011: XORcc_I	xorcc 	%r18, 0x004d, %r30
T1_asi_reg_wr_155:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 3013: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a589e0  ! 3016: FDIVq	dis not found

	.word 0xb40dc000  ! 3017: AND_R	and 	%r23, %r0, %r26
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a8c820  ! 3021: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb1a588e0  ! 3022: FSUBq	dis not found

T1_asi_reg_rd_143:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1a54840  ! 3025: FADDd	faddd	%f52, %f0, %f24
T1_asi_reg_wr_156:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3028: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_228:
	setx	0x340311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x36013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a00c  ! 3033: WRPR_TSTATE_I	wrpr	%r18, 0x000c, %tstate
	.word 0xb3a5c940  ! 3039: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb1a448e0  ! 3041: FSUBq	dis not found

	.word 0xb3a54840  ! 3044: FADDd	faddd	%f52, %f0, %f56
cpu_intr_1_230:
	setx	0x340230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_144:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_157:
	mov	0x26, %r14
	.word 0xf2f38400  ! 3051: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb88d8000  ! 3052: ANDcc_R	andcc 	%r22, %r0, %r28
cpu_intr_1_231:
	setx	0x340224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 4)
	.word 0xb0950000  ! 3059: ORcc_R	orcc 	%r20, %r0, %r24
	.word 0x8994617e  ! 3063: WRPR_TICK_I	wrpr	%r17, 0x017e, %tick
cpu_intr_1_232:
	setx	0x350125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 3068: FMOVRLZ	dis not found

	.word 0xbda00560  ! 3071: FSQRTq	fsqrt	
	.word 0xb5a508c0  ! 3073: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb5a40840  ! 3074: FADDd	faddd	%f16, %f0, %f26
	.word 0xb9a8c820  ! 3076: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb2a4c000  ! 3077: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xbb641800  ! 3078: MOVcc_R	<illegal instruction>
	.word 0xb5a9c820  ! 3079: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_233:
	setx	0x360233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 19)
	.word 0xbc3d0000  ! 3082: XNOR_R	xnor 	%r20, %r0, %r30
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a589a0  ! 3088: FDIVs	fdivs	%f22, %f0, %f28
T1_asi_reg_wr_158:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 3091: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbba84820  ! 3093: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb8140000  ! 3095: OR_R	or 	%r16, %r0, %r28
	.word 0xbb35f001  ! 3096: SRLX_I	srlx	%r23, 0x0001, %r29
	.word 0xb9a54960  ! 3098: FMULq	dis not found

cpu_intr_1_234:
	setx	0x350323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_235:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 3103: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xb1abc820  ! 3105: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_145:
	mov	0x13, %r14
	.word 0xf0db8400  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9a5c960  ! 3109: FMULq	dis not found

	.word 0xbbab4820  ! 3111: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_236:
	setx	0x360325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9e0  ! 3115: FDIVq	dis not found

	.word 0xb2bc2193  ! 3117: XNORcc_I	xnorcc 	%r16, 0x0193, %r25
	.word 0xbda81c20  ! 3118: FMOVRGEZ	dis not found

	.word 0xb49c60be  ! 3119: XORcc_I	xorcc 	%r17, 0x00be, %r26
	.word 0xb3a94820  ! 3121: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00540  ! 3125: FSQRTd	fsqrt	
T1_asi_reg_wr_159:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 3130: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3a50840  ! 3131: FADDd	faddd	%f20, %f0, %f56
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_146:
	mov	0x8, %r14
	.word 0xfadb84a0  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1aa8820  ! 3144: FMOVG	fmovs	%fcc1, %f0, %f24
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_160:
	mov	0x2, %r14
	.word 0xfef38400  ! 3149: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb81420e9  ! 3151: OR_I	or 	%r16, 0x00e9, %r28
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 19)
	.word 0x8f902000  ! 3156: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T1_asi_reg_wr_161:
	mov	0x13, %r14
	.word 0xfef38e40  ! 3157: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb12cd000  ! 3158: SLLX_R	sllx	%r19, %r0, %r24
T1_asi_reg_rd_147:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 3161: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbba48840  ! 3163: FADDd	faddd	%f18, %f0, %f60
	.word 0x899460cc  ! 3164: WRPR_TICK_I	wrpr	%r17, 0x00cc, %tick
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 3173: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9aa8820  ! 3180: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_163:
	mov	0x2e, %r14
	.word 0xf6f384a0  ! 3183: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a58820  ! 3185: FADDs	fadds	%f22, %f0, %f25
	.word 0xb5ab4820  ! 3186: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_237:
	setx	0x370119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 3188: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 3189: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb034a15f  ! 3190: ORN_I	orn 	%r18, 0x015f, %r24
	.word 0xb1a98820  ! 3197: FMOVNEG	fmovs	%fcc1, %f0, %f24
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1aa0820  ! 3202: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1a50820  ! 3203: FADDs	fadds	%f20, %f0, %f24
cpu_intr_1_238:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489a0  ! 3206: FDIVs	fdivs	%f18, %f0, %f25
T1_asi_reg_rd_148:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 3210: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1a00040  ! 3214: FMOVd	fmovd	%f0, %f24
	.word 0xb5a90820  ! 3217: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_149:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a409e0  ! 3222: FDIVq	dis not found

T1_asi_reg_wr_165:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3223: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a00540  ! 3227: FSQRTd	fsqrt	
	.word 0xbda48940  ! 3229: FMULd	fmuld	%f18, %f0, %f30
T1_asi_reg_rd_150:
	mov	0x2d, %r14
	.word 0xfcdb89e0  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_166:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 3232: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfa4c840  ! 3234: FADDd	faddd	%f50, %f0, %f62
	.word 0xb5a98820  ! 3236: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81820  ! 3237: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfab8820  ! 3242: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 3243: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_167:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 3245: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0ad2056  ! 3246: ANDNcc_I	andncc 	%r20, 0x0056, %r24
	.word 0xbe448000  ! 3247: ADDC_R	addc 	%r18, %r0, %r31
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba50940  ! 3260: FMULd	fmuld	%f20, %f0, %f60
cpu_intr_1_239:
	setx	0x3a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 3266: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_240:
	setx	0x380319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_241:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 3272: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7ab0820  ! 3283: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_242:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 3290: FSQRTs	fsqrt	
cpu_intr_1_243:
	setx	0x38002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a8c820  ! 3306: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_244:
	setx	0x3a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549c0  ! 3308: FDIVd	fdivd	%f52, %f0, %f58
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_169:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3314: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_151:
	mov	0x7, %r14
	.word 0xf2db8e60  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa448a0  ! 3324: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xbbaa0820  ! 3325: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_170:
	mov	0x2b, %r14
	.word 0xfaf384a0  ! 3328: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb89cc000  ! 3329: XORcc_R	xorcc 	%r19, %r0, %r28
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 5)
	.word 0xb0448000  ! 3332: ADDC_R	addc 	%r18, %r0, %r24
T1_asi_reg_wr_171:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3336: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_152:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_245:
	setx	0x390239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 3344: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbba5c8c0  ! 3346: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb73dc000  ! 3348: SRA_R	sra 	%r23, %r0, %r27
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_153:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 3351: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_154:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbda00560  ! 3357: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00540  ! 3362: FSQRTd	fsqrt	
cpu_intr_1_246:
	setx	0x38020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_172:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 3364: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_247:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3368: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_248:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_249:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x390229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_251:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 3386: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_252:
	setx	0x3b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44920  ! 3390: FMULs	fmuls	%f17, %f0, %f27
T1_asi_reg_rd_155:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb1a508e0  ! 3393: FSUBq	dis not found

	.word 0xbcb4c000  ! 3395: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xb615e131  ! 3396: OR_I	or 	%r23, 0x0131, %r27
	.word 0xb3a00560  ! 3397: FSQRTq	fsqrt	
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 27)
	.word 0xb335f001  ! 3405: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xb5a5c940  ! 3408: FMULd	fmuld	%f54, %f0, %f26
	.word 0xbfab0820  ! 3410: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb48c4000  ! 3412: ANDcc_R	andcc 	%r17, %r0, %r26
cpu_intr_1_253:
	setx	0x390206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 3422: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a8c820  ! 3425: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_254:
	setx	0x3a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_173:
	mov	0x2, %r14
	.word 0xfaf389e0  ! 3430: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbca5612d  ! 3432: SUBcc_I	subcc 	%r21, 0x012d, %r30
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, e)
	.word 0xb9a00560  ! 3435: FSQRTq	fsqrt	
	.word 0xbda448c0  ! 3437: FSUBd	fsubd	%f48, %f0, %f30
T1_asi_reg_rd_156:
	mov	0x6, %r14
	.word 0xf0db8400  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_174:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 3441: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_255:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_157:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3446: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_256:
	setx	0x380203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 3451: FMOVRNZ	dis not found

T1_asi_reg_rd_158:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfa00540  ! 3454: FSQRTd	fsqrt	
T1_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_257:
	setx	0x390239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 3460: FDIVq	dis not found

	.word 0xb1a94820  ! 3461: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1504000  ! 3467: RDPR_TNPC	<illegal instruction>
	.word 0xb3a94820  ! 3475: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_258:
	setx	0x3b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50940  ! 3477: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb2950000  ! 3479: ORcc_R	orcc 	%r20, %r0, %r25
T1_asi_reg_rd_160:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7a84820  ! 3482: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_161:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7abc820  ! 3492: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa4820  ! 3495: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa448c0  ! 3496: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xbc054000  ! 3497: ADD_R	add 	%r21, %r0, %r30
T1_asi_reg_wr_175:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 3498: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_162:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_176:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 3510: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbba00040  ! 3512: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_259:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_260:
	setx	0x3a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_177:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 3521: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbf2d8000  ! 3523: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb7a80420  ! 3524: FMOVRZ	dis not found

	.word 0xb9a00020  ! 3525: FMOVs	fmovs	%f0, %f28
	.word 0xb1a50820  ! 3527: FADDs	fadds	%f20, %f0, %f24
	.word 0xbba4c960  ! 3528: FMULq	dis not found

	.word 0xbba80820  ! 3529: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab4820  ! 3530: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_178:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 3531: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbda449c0  ! 3532: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb2a40000  ! 3539: SUBcc_R	subcc 	%r16, %r0, %r25
cpu_intr_1_261:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x38010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 3545: FMOVRNZ	dis not found

cpu_intr_1_263:
	setx	0x38033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_264:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_265:
	setx	0x3b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_266:
	setx	0x38001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_267:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x3b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_269:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_270:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 3566: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa00540  ! 3567: FSQRTd	fsqrt	
	.word 0xb9a98820  ! 3568: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 3570: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a5c8a0  ! 3573: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb1a80820  ! 3576: FMOVN	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_271:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_272:
	setx	0x3a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 10)
	.word 0xbdaac820  ! 3590: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c940  ! 3591: FMULd	fmuld	%f50, %f0, %f26
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7a509c0  ! 3595: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb3a00040  ! 3596: FMOVd	fmovd	%f0, %f56
	.word 0xb5a80820  ! 3599: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_273:
	setx	0x3b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3606: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a4c840  ! 3609: FADDd	faddd	%f50, %f0, %f28
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_274:
	setx	0x380129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40840  ! 3618: FADDd	faddd	%f16, %f0, %f24
	.word 0xbea40000  ! 3622: SUBcc_R	subcc 	%r16, %r0, %r31
cpu_intr_1_276:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48820  ! 3632: FADDs	fadds	%f18, %f0, %f25
T1_asi_reg_wr_180:
	mov	0x28, %r14
	.word 0xf6f389e0  ! 3633: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_165:
	mov	0x2d, %r14
	.word 0xfcdb8e60  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb8950000  ! 3638: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xbda4c960  ! 3639: FMULq	dis not found

T1_asi_reg_wr_181:
	mov	0x12, %r14
	.word 0xfaf38e80  ! 3640: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a50940  ! 3643: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 31)
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_182:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3651: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_277:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_183:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 3656: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_166:
	mov	0x2c, %r14
	.word 0xf2db8e80  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 3662: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5a94820  ! 3664: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb9aa8820  ! 3665: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a4c8a0  ! 3666: FSUBs	fsubs	%f19, %f0, %f27
T1_asi_reg_rd_168:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfa81420  ! 3674: FMOVRNZ	dis not found

iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_278:
	setx	0x3d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 3684: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9a408c0  ! 3685: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbfa5c8a0  ! 3687: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xbcb4a168  ! 3688: ORNcc_I	orncc 	%r18, 0x0168, %r30
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 3691: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb444a0e8  ! 3693: ADDC_I	addc 	%r18, 0x00e8, %r26
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a4c960  ! 3696: FMULq	dis not found

	.word 0xb5a44920  ! 3699: FMULs	fmuls	%f17, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_279:
	setx	0x3e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295e12d  ! 3705: ORcc_I	orcc 	%r23, 0x012d, %r25
	.word 0xb1a00520  ! 3706: FSQRTs	fsqrt	
	.word 0xb9a9c820  ! 3709: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbda81c20  ! 3711: FMOVRGEZ	dis not found

	.word 0xb5a448a0  ! 3713: FSUBs	fsubs	%f17, %f0, %f26
T1_asi_reg_wr_186:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 3714: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_187:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 3715: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb23c8000  ! 3717: XNOR_R	xnor 	%r18, %r0, %r25
T1_asi_reg_wr_188:
	mov	0x1c, %r14
	.word 0xfef38400  ! 3722: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbdabc820  ! 3725: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda449e0  ! 3727: FDIVq	dis not found

iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 16)
	.word 0xbbabc820  ! 3731: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a5c960  ! 3742: FMULq	dis not found

T1_asi_reg_rd_169:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7a58860  ! 3745: FADDq	dis not found

	.word 0xb7a80420  ! 3747: FMOVRZ	dis not found

	.word 0xb3a5c9a0  ! 3748: FDIVs	fdivs	%f23, %f0, %f25
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_189:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3750: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_190:
	mov	0x17, %r14
	.word 0xfef384a0  ! 3757: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_171:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1a9c820  ! 3760: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_191:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3762: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_280:
	setx	0x3e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588a0  ! 3768: FSUBs	fsubs	%f22, %f0, %f29
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_172:
	mov	0x37, %r14
	.word 0xf0db8e40  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a81420  ! 3777: FMOVRNZ	dis not found

	.word 0xb40cc000  ! 3778: AND_R	and 	%r19, %r0, %r26
	.word 0xb7a00560  ! 3779: FSQRTq	fsqrt	
T1_asi_reg_wr_192:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 3781: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0842042  ! 3785: ADDcc_I	addcc 	%r16, 0x0042, %r24
T1_asi_reg_rd_173:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00020  ! 3790: FMOVs	fmovs	%f0, %f29
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba81420  ! 3792: FMOVRNZ	dis not found

	.word 0xb1abc820  ! 3793: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_281:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x3c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 1)
	.word 0xb28c60d0  ! 3801: ANDcc_I	andcc 	%r17, 0x00d0, %r25
cpu_intr_1_283:
	setx	0x3e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_193:
	mov	0x4, %r14
	.word 0xfaf38400  ! 3819: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_174:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 3820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a00540  ! 3825: FSQRTd	fsqrt	
cpu_intr_1_284:
	setx	0x3e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa548c0  ! 3833: FSUBd	fsubd	%f52, %f0, %f62
cpu_intr_1_285:
	setx	0x3f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_175:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_176:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 3838: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_286:
	setx	0x3f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cb001  ! 3843: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xb6140000  ! 3844: OR_R	or 	%r16, %r0, %r27
T1_asi_reg_rd_177:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9a84820  ! 3848: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a5c840  ! 3851: FADDd	faddd	%f54, %f0, %f26
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_287:
	setx	0x3e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_194:
	mov	0x1a, %r14
	.word 0xf8f38e60  ! 3854: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_195:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 3855: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_288:
	setx	0x3d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_178:
	mov	0x34, %r14
	.word 0xf4db8e60  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a00520  ! 3861: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfab0820  ! 3864: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba94820  ! 3870: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a44860  ! 3871: FADDq	dis not found

	.word 0xbba58840  ! 3872: FADDd	faddd	%f22, %f0, %f60
	.word 0xb5aa4820  ! 3873: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_289:
	setx	0x3d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd21f1  ! 3876: XNORcc_I	xnorcc 	%r20, 0x01f1, %r26
T1_asi_reg_wr_196:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 3877: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbda44920  ! 3885: FMULs	fmuls	%f17, %f0, %f30
cpu_intr_1_290:
	setx	0x3e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40dc000  ! 3888: AND_R	and 	%r23, %r0, %r26
T1_asi_reg_wr_197:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 3889: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba00520  ! 3890: FSQRTs	fsqrt	
T1_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf8f384a0  ! 3894: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5a00040  ! 3895: FMOVd	fmovd	%f0, %f26
	.word 0xb5ab4820  ! 3896: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_291:
	setx	0x3c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e12b  ! 3908: ADDCcc_I	addccc 	%r23, 0x012b, %r28
	.word 0xbdaac820  ! 3913: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7aa8820  ! 3915: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a58940  ! 3917: FMULd	fmuld	%f22, %f0, %f28
T1_asi_reg_rd_179:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a549e0  ! 3920: FDIVq	dis not found

T1_asi_reg_wr_199:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 3921: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_292:
	setx	0x3f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c6001  ! 3927: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xbbaac820  ! 3931: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbf354000  ! 3932: SRL_R	srl 	%r21, %r0, %r31
cpu_intr_1_293:
	setx	0x3d0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 3939: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48860  ! 3942: FADDq	dis not found

	.word 0xbc35e159  ! 3943: ORN_I	orn 	%r23, 0x0159, %r30
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_294:
	setx	0x3c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 8)
	.word 0xbba00560  ! 3953: FSQRTq	fsqrt	
T1_asi_reg_wr_200:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 3955: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_180:
	mov	0x1, %r14
	.word 0xf4db8400  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a98820  ! 3961: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_295:
	setx	0x3f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x23, %r14
	.word 0xf2f38400  ! 3964: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0x859521f1  ! 3968: WRPR_TSTATE_I	wrpr	%r20, 0x01f1, %tstate
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a489e0  ! 3971: FDIVq	dis not found

cpu_intr_1_296:
	setx	0x3c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbba589c0  ! 3977: FDIVd	fdivd	%f22, %f0, %f60
cpu_intr_1_297:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_299:
	setx	0x3d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_182:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_202:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 3983: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa80820  ! 3986: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_300:
	setx	0x3d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a408a0  ! 3991: FSUBs	fsubs	%f16, %f0, %f27
T1_asi_reg_wr_203:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 3992: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_204:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 3994: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_302:
	setx	0x3c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_183:
	mov	0x14, %r14
	.word 0xf8db8400  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5a48860  ! 4001: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_205:
	mov	0x12, %r14
	.word 0xf8f384a0  ! 4004: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_303:
	setx	0x3c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_304:
	setx	0x3e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_206:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4010: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbb7d4400  ! 4014: MOVR_R	movre	%r21, %r0, %r29
	.word 0xbf480000  ! 4016: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
T1_asi_reg_rd_184:
	mov	0x28, %r14
	.word 0xf0db8400  ! 4019: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 29)
	.word 0xb7a549c0  ! 4025: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb1ab0820  ! 4026: FMOVGU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_185:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_207:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 4031: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_186:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 4034: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbda5c8e0  ! 4035: FSUBq	dis not found

	.word 0xbb3c5000  ! 4036: SRAX_R	srax	%r17, %r0, %r29
	.word 0xb1a80820  ! 4037: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb9a84820  ! 4038: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_305:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408a0  ! 4045: FSUBs	fsubs	%f16, %f0, %f30
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_306:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 4051: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_209:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 4052: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3aa8820  ! 4057: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, b)
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_307:
	setx	0x3d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3ab8820  ! 4077: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 4079: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3a448a0  ! 4080: FSUBs	fsubs	%f17, %f0, %f25
T1_asi_reg_wr_210:
	mov	0x25, %r14
	.word 0xfef38e40  ! 4081: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a44940  ! 4082: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb7a5c920  ! 4085: FMULs	fmuls	%f23, %f0, %f27
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_308:
	setx	0x3f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_187:
	mov	0x37, %r14
	.word 0xf4db89e0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_309:
	setx	0x3c0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 4094: FSQRTd	fsqrt	
T1_asi_reg_rd_188:
	mov	0x27, %r14
	.word 0xfedb84a0  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb33de001  ! 4098: SRA_I	sra 	%r23, 0x0001, %r25
T1_asi_reg_rd_189:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 4099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a80820  ! 4100: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_310:
	setx	0x430025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 4102: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9abc820  ! 4109: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_211:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 4112: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 2)
	.word 0xbdabc820  ! 4114: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_311:
	setx	0x42011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a80c20  ! 4119: FMOVRLZ	dis not found

T1_asi_reg_rd_190:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a44860  ! 4125: FADDq	dis not found

	.word 0xb9a58860  ! 4131: FADDq	dis not found

T1_asi_reg_wr_212:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4136: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_191:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_312:
	setx	0x410302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_192:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_193:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 4148: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1a94820  ! 4151: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_213:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 4152: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb12cc000  ! 4155: SLL_R	sll 	%r19, %r0, %r24
T1_asi_reg_rd_194:
	mov	0x11, %r14
	.word 0xfadb8400  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda4c9c0  ! 4162: FDIVd	fdivd	%f50, %f0, %f30
T1_asi_reg_rd_195:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 4169: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_214:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4175: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbdaa4820  ! 4177: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_313:
	setx	0x430326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 4183: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbba00520  ! 4186: FSQRTs	fsqrt	
T1_asi_reg_wr_215:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4187: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_196:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a80c20  ! 4189: FMOVRLZ	dis not found

	.word 0xb9a548a0  ! 4190: FSUBs	fsubs	%f21, %f0, %f28
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbfa80420  ! 4193: FMOVRZ	dis not found

	.word 0xba1d8000  ! 4195: XOR_R	xor 	%r22, %r0, %r29
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_314:
	setx	0x430210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x410129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 4203: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb97d0400  ! 4205: MOVR_R	movre	%r20, %r0, %r28
	.word 0xb5a00520  ! 4208: FSQRTs	fsqrt	
	.word 0xb3aa4820  ! 4209: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_316:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_317:
	setx	0x43030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 5)
	.word 0xbba488a0  ! 4220: FSUBs	fsubs	%f18, %f0, %f29
T1_asi_reg_wr_216:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_318:
	setx	0x400235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c960  ! 4224: FMULq	dis not found

	.word 0xb7a40860  ! 4227: FADDq	dis not found

	.word 0xbfa5c8a0  ! 4228: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb7a508e0  ! 4229: FSUBq	dis not found

	.word 0xb9643801  ! 4233: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_197:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 4234: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_319:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_198:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 4238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb225a0ad  ! 4244: SUB_I	sub 	%r22, 0x00ad, %r25
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_320:
	setx	0x420225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a04e  ! 4250: WRPR_TT_I	wrpr	%r18, 0x004e, %tt
	.word 0xb7a50940  ! 4251: FMULd	fmuld	%f20, %f0, %f58
T1_asi_reg_wr_217:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 4252: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfa40860  ! 4261: FADDq	dis not found

	.word 0xb9a9c820  ! 4269: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a98820  ! 4271: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_321:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_322:
	setx	0x430035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 4277: MOVcc_R	<illegal instruction>
	.word 0xb5a80c20  ! 4278: FMOVRLZ	dis not found

	.word 0xb4844000  ! 4279: ADDcc_R	addcc 	%r17, %r0, %r26
T1_asi_reg_wr_218:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 4280: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_323:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 4287: FMOVRGEZ	dis not found

T1_asi_reg_rd_199:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_324:
	setx	0x41023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbab4e18e  ! 4292: SUBCcc_I	orncc 	%r19, 0x018e, %r29
cpu_intr_1_325:
	setx	0x12a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 4299: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 4301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7a00520  ! 4305: FSQRTs	fsqrt	
T1_asi_reg_wr_219:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 4306: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1abc820  ! 4313: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_201:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9aa0820  ! 4317: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb7343001  ! 4319: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x8d95a00c  ! 4321: WRPR_PSTATE_I	wrpr	%r22, 0x000c, %pstate
	.word 0xb5a80820  ! 4324: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_326:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x32, %r14
	.word 0xf4db84a0  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb6a4c000  ! 4334: SUBcc_R	subcc 	%r19, %r0, %r27
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_327:
	setx	0x400336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x41012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_220:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 4350: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_329:
	setx	0x430127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548e0  ! 4357: FSUBq	dis not found

	.word 0xbdab8820  ! 4358: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb29d6104  ! 4359: XORcc_I	xorcc 	%r21, 0x0104, %r25
	.word 0xb9a80420  ! 4360: FMOVRZ	dis not found

T1_asi_reg_wr_221:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 4362: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbe8c8000  ! 4363: ANDcc_R	andcc 	%r18, %r0, %r31
T1_asi_reg_rd_203:
	mov	0x11, %r14
	.word 0xf8db8e80  ! 4365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_222:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 4367: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5a00020  ! 4369: FMOVs	fmovs	%f0, %f26
	.word 0xb9a90820  ! 4371: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_223:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 4373: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_224:
	mov	0x2a, %r14
	.word 0xfef38e60  ! 4374: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a9c820  ! 4377: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_225:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 4383: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_330:
	setx	0x430229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba240000  ! 4396: SUB_R	sub 	%r16, %r0, %r29
T1_asi_reg_wr_226:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 4398: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_204:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_331:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba80820  ! 4406: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_227:
	mov	0x1, %r14
	.word 0xf6f38e60  ! 4408: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbba84820  ! 4409: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb00d609b  ! 4410: AND_I	and 	%r21, 0x009b, %r24
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a5c960  ! 4414: FMULq	dis not found

iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a409a0  ! 4419: FDIVs	fdivs	%f16, %f0, %f27
T1_asi_reg_wr_228:
	mov	0x8, %r14
	.word 0xfef38e80  ! 4420: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_229:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 4422: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1a548c0  ! 4425: FSUBd	fsubd	%f52, %f0, %f24
cpu_intr_1_332:
	setx	0x400109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_205:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb97c2401  ! 4440: MOVR_I	movre	%r16, 0x1, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a81820  ! 4444: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba81820  ! 4449: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1a80c20  ! 4450: FMOVRLZ	dis not found

iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a408e0  ! 4454: FSUBq	dis not found

	.word 0xbfa8c820  ! 4457: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5a408e0  ! 4458: FSUBq	dis not found

	.word 0xb7a588c0  ! 4464: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbc8d4000  ! 4469: ANDcc_R	andcc 	%r21, %r0, %r30
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_230:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 4472: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb83cc000  ! 4479: XNOR_R	xnor 	%r19, %r0, %r28
cpu_intr_1_333:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 4482: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb20461a3  ! 4484: ADD_I	add 	%r17, 0x01a3, %r25
T1_asi_reg_wr_231:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 4485: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_232:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 4486: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_233:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 4487: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa5c860  ! 4495: FADDq	dis not found

cpu_intr_1_334:
	setx	0x41000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_335:
	setx	0x430322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 4499: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c940  ! 4502: FMULd	fmuld	%f50, %f0, %f28
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a4c920  ! 4504: FMULs	fmuls	%f19, %f0, %f27
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_336:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4510: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa5c920  ! 4515: FMULs	fmuls	%f23, %f0, %f31
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 0)
	.word 0xb1a409e0  ! 4519: FDIVq	dis not found

T1_asi_reg_rd_207:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfaa0820  ! 4523: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_337:
	setx	0x420112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_234:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 4533: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a84820  ! 4536: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00540  ! 4537: FSQRTd	fsqrt	
T1_asi_reg_rd_208:
	mov	0xa, %r14
	.word 0xfedb8400  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa409c0  ! 4539: FDIVd	fdivd	%f16, %f0, %f62
	.word 0xb5a54820  ! 4540: FADDs	fadds	%f21, %f0, %f26
	.word 0xb7a81c20  ! 4546: FMOVRGEZ	dis not found

cpu_intr_1_338:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a81420  ! 4551: FMOVRNZ	dis not found

	.word 0xb1a408e0  ! 4552: FSUBq	dis not found

	.word 0xb6348000  ! 4553: ORN_R	orn 	%r18, %r0, %r27
cpu_intr_1_339:
	setx	0x450306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 4558: FMOVRZ	dis not found

iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 21)
	.word 0xbfaac820  ! 4564: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_340:
	setx	0x440326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_341:
	setx	0x440115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_342:
	setx	0x3032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_209:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_343:
	setx	0x470136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5a4c820  ! 4576: FADDs	fadds	%f19, %f0, %f26
	.word 0xb3a5c8c0  ! 4577: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb3a5c820  ! 4578: FADDs	fadds	%f23, %f0, %f25
cpu_intr_1_344:
	setx	0x460125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_345:
	setx	0x450030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac21d4  ! 4587: ANDNcc_I	andncc 	%r16, 0x01d4, %r26
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 9)
	.word 0xbb3ce001  ! 4590: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xb3ab0820  ! 4592: FMOVGU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_235:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 4597: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_347:
	setx	0x450202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 4603: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_210:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_211:
	mov	0x28, %r14
	.word 0xf4db8e80  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbfa44860  ! 4607: FADDq	dis not found

cpu_intr_1_348:
	setx	0x470130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48860  ! 4611: FADDq	dis not found

iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a90820  ! 4618: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80420  ! 4619: FMOVRZ	dis not found

	.word 0xb5a00560  ! 4620: FSQRTq	fsqrt	
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 11)
	.word 0xb20dc000  ! 4623: AND_R	and 	%r23, %r0, %r25
	.word 0xbba80c20  ! 4624: FMOVRLZ	dis not found

T1_asi_reg_wr_236:
	mov	0x1d, %r14
	.word 0xf4f384a0  ! 4628: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, f)
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_212:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1a81c20  ! 4637: FMOVRGEZ	dis not found

cpu_intr_1_349:
	setx	0x47013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_213:
	mov	0x28, %r14
	.word 0xfcdb84a0  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb92cf001  ! 4644: SLLX_I	sllx	%r19, 0x0001, %r28
	.word 0xbbab4820  ! 4645: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_350:
	setx	0x440030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a588c0  ! 4648: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb69c2003  ! 4651: XORcc_I	xorcc 	%r16, 0x0003, %r27
T1_asi_reg_rd_214:
	mov	0x30, %r14
	.word 0xf6db8400  ! 4652: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3351000  ! 4653: SRLX_R	srlx	%r20, %r0, %r25
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_237:
	mov	0xa, %r14
	.word 0xf8f38e60  ! 4657: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfa00560  ! 4659: FSQRTq	fsqrt	
	.word 0xb7ab0820  ! 4660: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 26)
	.word 0xbbabc820  ! 4665: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_238:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 4667: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_239:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 4668: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb72df001  ! 4670: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xbba409a0  ! 4671: FDIVs	fdivs	%f16, %f0, %f29
cpu_intr_1_351:
	setx	0x44001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_352:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40820  ! 4676: FADDs	fadds	%f16, %f0, %f27
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_240:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 4681: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_353:
	setx	0x47020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4686: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80420  ! 4690: FMOVRZ	dis not found

iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda80820  ! 4697: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00520  ! 4698: FSQRTs	fsqrt	
T1_asi_reg_wr_241:
	mov	0xb, %r14
	.word 0xfcf384a0  ! 4700: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a588a0  ! 4705: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb68d607a  ! 4706: ANDcc_I	andcc 	%r21, 0x007a, %r27
	.word 0xb1a54820  ! 4707: FADDs	fadds	%f21, %f0, %f24
	.word 0xb6b44000  ! 4709: ORNcc_R	orncc 	%r17, %r0, %r27
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_354:
	setx	0x460124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902001  ! 4713: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_1_355:
	setx	0x440223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488c0  ! 4716: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xb5a48960  ! 4717: FMULq	dis not found

	.word 0xb89d4000  ! 4719: XORcc_R	xorcc 	%r21, %r0, %r28
T1_asi_reg_wr_242:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 4720: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbdab0820  ! 4725: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa81420  ! 4726: FMOVRNZ	dis not found

iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_243:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 4728: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_244:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4730: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_245:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 4732: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0x819561fc  ! 4733: WRPR_TPC_I	wrpr	%r21, 0x01fc, %tpc
	.word 0xb1a449a0  ! 4735: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb5a9c820  ! 4737: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00040  ! 4739: FMOVd	fmovd	%f0, %f28
	.word 0xb9a40920  ! 4740: FMULs	fmuls	%f16, %f0, %f28
cpu_intr_1_356:
	setx	0x45020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4742: FMOVL	fmovs	%fcc1, %f0, %f31
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_357:
	setx	0x44022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73de001  ! 4754: SRA_I	sra 	%r23, 0x0001, %r27
T1_asi_reg_wr_246:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 4756: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 2a)
	.word 0xa1902002  ! 4764: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xbdab8820  ! 4766: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_247:
	mov	0x29, %r14
	.word 0xf0f389e0  ! 4769: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_358:
	setx	0x450300, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_215:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 4774: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_248:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 4776: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_249:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 4781: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9a4c820  ! 4785: FADDs	fadds	%f19, %f0, %f28
T1_asi_reg_wr_250:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4786: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb534e001  ! 4787: SRL_I	srl 	%r19, 0x0001, %r26
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_359:
	setx	0x47032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d0000  ! 4797: XOR_R	xor 	%r20, %r0, %r24
	.word 0xb434c000  ! 4805: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xb7a40960  ! 4806: FMULq	dis not found

	.word 0xb5a00040  ! 4810: FMOVd	fmovd	%f0, %f26
T1_asi_reg_wr_251:
	mov	0x28, %r14
	.word 0xfef38e40  ! 4811: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a81420  ! 4814: FMOVRNZ	dis not found

iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa489e0  ! 4816: FDIVq	dis not found

T1_asi_reg_rd_216:
	mov	0xf, %r14
	.word 0xf4db89e0  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a8c820  ! 4822: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_360:
	setx	0x450339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_361:
	setx	0x450136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe45c000  ! 4827: ADDC_R	addc 	%r23, %r0, %r31
cpu_intr_1_362:
	setx	0x45011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 4831: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1641800  ! 4832: MOVcc_R	<illegal instruction>
	.word 0xb33dc000  ! 4836: SRA_R	sra 	%r23, %r0, %r25
T1_asi_reg_wr_252:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 4842: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 38)
	.word 0xb6c4c000  ! 4852: ADDCcc_R	addccc 	%r19, %r0, %r27
	.word 0xbf342001  ! 4855: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0xbda88820  ! 4859: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a488e0  ! 4860: FSUBq	dis not found

	.word 0xb5a80420  ! 4863: FMOVRZ	dis not found

	.word 0xbda408c0  ! 4869: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbda00560  ! 4871: FSQRTq	fsqrt	
	.word 0xbba80820  ! 4872: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbda80820  ! 4873: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb034c000  ! 4875: ORN_R	orn 	%r19, %r0, %r24
T1_asi_reg_wr_253:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 4878: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7aa0820  ! 4879: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb084a1fd  ! 4883: ADDcc_I	addcc 	%r18, 0x01fd, %r24
	.word 0xb3a40840  ! 4884: FADDd	faddd	%f16, %f0, %f56
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_254:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 4886: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_363:
	setx	0x450304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa408e0  ! 4889: FSUBq	dis not found

	.word 0xbba81820  ! 4892: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1a449e0  ! 4893: FDIVq	dis not found

	.word 0xa1902001  ! 4894: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb7aa0820  ! 4895: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80820  ! 4896: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_217:
	mov	0x15, %r14
	.word 0xfadb84a0  ! 4898: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a48840  ! 4899: FADDd	faddd	%f18, %f0, %f26
	.word 0xb43d6085  ! 4900: XNOR_I	xnor 	%r21, 0x0085, %r26
	.word 0xb5a548c0  ! 4902: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb805c000  ! 4903: ADD_R	add 	%r23, %r0, %r28
	.word 0xb5a94820  ! 4904: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_255:
	mov	0x13, %r14
	.word 0xfaf38400  ! 4905: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9aa4820  ! 4907: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_364:
	setx	0x46032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb7a408a0  ! 4913: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbfa589c0  ! 4915: FDIVd	fdivd	%f22, %f0, %f62
T1_asi_reg_rd_218:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 4918: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_219:
	mov	0x3, %r14
	.word 0xfcdb8400  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7a549a0  ! 4924: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xbfa80820  ! 4926: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_365:
	setx	0x44000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83dc000  ! 4929: XNOR_R	xnor 	%r23, %r0, %r28
	.word 0xb7a489a0  ! 4930: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xbda9c820  ! 4932: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_366:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5aa0820  ! 4939: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a4c9c0  ! 4941: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb5a5c8c0  ! 4942: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb4c4218b  ! 4943: ADDCcc_I	addccc 	%r16, 0x018b, %r26
T1_asi_reg_rd_220:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbdab4820  ! 4946: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 16)
	.word 0xb285c000  ! 4948: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xb1a81c20  ! 4949: FMOVRGEZ	dis not found

	.word 0xb72cb001  ! 4956: SLLX_I	sllx	%r18, 0x0001, %r27
cpu_intr_1_367:
	setx	0x440307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_256:
	mov	0x13, %r14
	.word 0xfcf384a0  ! 4959: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_368:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_369:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 4974: FSQRTs	fsqrt	
	.word 0xbba54860  ! 4978: FADDq	dis not found

iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, a)
	.word 0xb9a00520  ! 4985: FSQRTs	fsqrt	
cpu_intr_1_370:
	setx	0x450210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4987: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_413:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_413), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_371:
	setx	0x44013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_372:
	setx	0x450018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589a0  ! 4996: FDIVs	fdivs	%f22, %f0, %f26
cpu_intr_1_373:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR

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

	.xword	0x9c8e5702da593cd7
	.xword	0x9b6a6adfe4f06949
	.xword	0xc1e178c2f11f8c2e
	.xword	0x2bbce2c7c5a1f941
	.xword	0x44a87ed1d0acc98d
	.xword	0x1fe2f5e6c6cd37b3
	.xword	0x0215cafea7b41d2f
	.xword	0xce2dd67959236d9f
	.xword	0xf87601dea0928ba6
	.xword	0xdc47d3b5b503754c
	.xword	0x6b3030c4a2be571b
	.xword	0x647f88f9eebb083b
	.xword	0x0f5245ae2056b0b5
	.xword	0x66ccd460276c9686
	.xword	0x92fedbae2a7451c8
	.xword	0x3c8e2246099024d7
	.xword	0x20c232c5fd2a9f3c
	.xword	0x8cd22e582f2a5e57
	.xword	0x43045e8fc349fe38
	.xword	0xb84977dc46732f0b
	.xword	0x35a3ff3928373c7f
	.xword	0xa7efb99b6c2a1710
	.xword	0x8523a80c7ece572c
	.xword	0x2fb75174422d8ff1
	.xword	0x332ca24b16df7502
	.xword	0xc71095f1d362462d
	.xword	0x2ffbe9cb58b49f96
	.xword	0x9899389bd2b1ca0d
	.xword	0x89ebbc2de463be16
	.xword	0xabcd5b627c5a7716
	.xword	0x491cd031fc0cca25
	.xword	0xb37f0ffd04f1b38a
	.xword	0xc45368c062d99757
	.xword	0x8db5608710c5beab
	.xword	0x4618930656d71816
	.xword	0x9856160616c045ca
	.xword	0xdec5415de87c441d
	.xword	0xce35291276e7076e
	.xword	0x8e641ed00399f1c5
	.xword	0x0d4d1f768f821eca
	.xword	0xbb9752733282c1fb
	.xword	0x923ca9cc6148a1f6
	.xword	0x5e1e51b152145785
	.xword	0xad1e6b6a628369c6
	.xword	0x2ac4ee5e010ed332
	.xword	0x8b416c23dfd989b4
	.xword	0xbf3036d970c1fc9f
	.xword	0x2d2ec7554463fda8
	.xword	0x82ff1dac60bb0365
	.xword	0xd7533eecb67b9bce
	.xword	0xfc6da006656df988
	.xword	0xbe715f758e4d5e0e
	.xword	0x564db63e032b10b3
	.xword	0x3ba01b9521ee98a1
	.xword	0xd2efc0e0e8684547
	.xword	0x84c69740e06b8f60
	.xword	0xc6a7f66643896b35
	.xword	0xbfb9ad4d412445e8
	.xword	0xe6ec972e9c05dc73
	.xword	0x49102a1418ff1f3c
	.xword	0xb8a2e30d68f35e73
	.xword	0xad4991fcf5cd0649
	.xword	0xc1f02c3d8c8c2fca
	.xword	0x142feb25a0088a7c
	.xword	0x37cc4fe1df4948a8
	.xword	0x9035951ab90215b1
	.xword	0xea7d9b70ec8c8ea1
	.xword	0xd4f3532c777a9bed
	.xword	0xae9aa25fd53c5665
	.xword	0xf80632f636efc19e
	.xword	0x369d8be2c6599d91
	.xword	0x6772e8c9f12b1309
	.xword	0xcd2c79ebe69cb7bc
	.xword	0x2cfe9b1227e630bc
	.xword	0xdd61a036ff7f27e2
	.xword	0x10672d0e34d248af
	.xword	0xd62bde66844d2581
	.xword	0x7143855bb7cc3662
	.xword	0xe50e7c68ff196d8b
	.xword	0xe8731973c15f5d32
	.xword	0xaa6483c937b1affe
	.xword	0xa3f1ac61e09f065c
	.xword	0xfaa9a15527a22304
	.xword	0x7d1d4ace77eca5d9
	.xword	0xcdc4f89628830885
	.xword	0xe965809fb6991b4f
	.xword	0x082693f6fef6f79b
	.xword	0x34f46cbde96fb466
	.xword	0xe2a5a958a37756f2
	.xword	0xccbcfce58bb9d313
	.xword	0x4cd0cb45a6e5068c
	.xword	0x22a12146578ad911
	.xword	0x53d58ab40a347260
	.xword	0x8f25604a4d7377d3
	.xword	0xd2370456d2e460ce
	.xword	0xa09656bdb024b5af
	.xword	0xfbd33f074385e941
	.xword	0xc20724ee59acf44c
	.xword	0xca68bf4129d53330
	.xword	0x74029761813365a4
	.xword	0x818d04267fb07e79
	.xword	0x65d7633b208a3a82
	.xword	0xa0db358d5f69cb2a
	.xword	0x4404cb0395bd2465
	.xword	0xd3b2781a1921acbc
	.xword	0x6d0efacb43f07f4a
	.xword	0xf2ef775efc9bc4ee
	.xword	0x2d9fc3cd94e43b67
	.xword	0x75f25809a817ddec
	.xword	0xe363ba440c99905b
	.xword	0x76deda0d494d8072
	.xword	0x1da566e7779af426
	.xword	0x7d37dbe9442dd7ad
	.xword	0x540c15592b32bd36
	.xword	0x1ca3b128c485b033
	.xword	0xc4d81707a180d533
	.xword	0xc1e233cfb7cec1a4
	.xword	0xcfb93b9907f2e543
	.xword	0x8cf1f5171de92ad7
	.xword	0x3a34befd30fb5056
	.xword	0xe4bafd26966adfa8
	.xword	0x5c500a3dc8ff995d
	.xword	0xd243c5f72755c8bd
	.xword	0xef1eb5231be92b0f
	.xword	0x6a0def6feba75d7c
	.xword	0x6d918e6ebdc270df
	.xword	0x25597e96e62e8eaa
	.xword	0xf6d094032b15f35b
	.xword	0xec9dba4aecc79a7a
	.xword	0x8dfd6232872ed74b
	.xword	0xdbd968c0f0cbfa00
	.xword	0x0dbfbdc4f4c2aa1a
	.xword	0x7f707a65d39d709e
	.xword	0x0ff84827de939eb2
	.xword	0xe7e46d1d2c553f6e
	.xword	0xdc4684b3cd342013
	.xword	0x793e0ee1c1af30ca
	.xword	0xc995050472521950
	.xword	0xa1252851d3b56265
	.xword	0xb4d3bb64bf944d19
	.xword	0x7e9eeca4e61e47bc
	.xword	0x37a653232c2a1564
	.xword	0x79b66598495824e3
	.xword	0x084eb95ffda8adae
	.xword	0xf00e09d2a89eb010
	.xword	0xbdb1915e3ebee384
	.xword	0x6df500301d26e013
	.xword	0xe7360765c309a0ff
	.xword	0x6c8626dd79c63326
	.xword	0xb0484ca462d7c3da
	.xword	0x2e3cb29559b993ec
	.xword	0x829253955e3a23e5
	.xword	0xc98775dfb56b58b4
	.xword	0x425803c90229c54c
	.xword	0xb2ae5a25249a705e
	.xword	0x96e1667033a15bb8
	.xword	0x53bf846c11f7a646
	.xword	0x0642201a7e89c872
	.xword	0x4ff2a9d766204b13
	.xword	0x6f67ad37a43b42dc
	.xword	0xf613988a10a6c067
	.xword	0x1e1f5a89fa3225e1
	.xword	0xd2b14aa95132fecf
	.xword	0x2a71ab4fbfd5bb42
	.xword	0x4a478410bd9fa2d3
	.xword	0x2ab58a8bed0bcad8
	.xword	0x70fc733c0994c725
	.xword	0x4320ac5fbfdd6ebc
	.xword	0xf0e99ceb21886162
	.xword	0x1b438355197a176c
	.xword	0x2b008586cbd75e22
	.xword	0x8f26b39f549073a1
	.xword	0x7341ca9f5740e661
	.xword	0x99796048978d44c0
	.xword	0xed157a46154a3924
	.xword	0x9e471355aa10ac2b
	.xword	0x9818be0d850842cf
	.xword	0x3d880eba3d1f84ea
	.xword	0xab9563acd82b12dc
	.xword	0xb24802ff455cf019
	.xword	0xa1e19706bd311493
	.xword	0xed55d9499565deef
	.xword	0x462d418dcd847e22
	.xword	0xcb5cf5b44647c014
	.xword	0xe3bbbfb883981e59
	.xword	0x827eca8567444d11
	.xword	0xc450c6ab859d504b
	.xword	0x76f9c3abd1ea5fe8
	.xword	0x3f62c7bcfdfdd844
	.xword	0xc9461064d25f8cd5
	.xword	0xc79b9e707c56a235
	.xword	0xb02adab842067f78
	.xword	0xff1869f089f54671
	.xword	0x54ad98d849c0a1b9
	.xword	0x8c0d2ef198da5cd0
	.xword	0xff2bff2125bfdbb8
	.xword	0xd28f85c8ef86d703
	.xword	0x518b43c6b30f03ba
	.xword	0x23c8fb4a27d8a223
	.xword	0x996a4154fe83df8e
	.xword	0xb942d985c68fa7d8
	.xword	0x764cca76e0f2204d
	.xword	0xfadd4bf395e44e31
	.xword	0xef3a5b2598e40a2e
	.xword	0x585b1508c13827ff
	.xword	0x922e67626a39a710
	.xword	0x08236021aaa23746
	.xword	0x5c720205973213ca
	.xword	0xd01398794f4ecf9c
	.xword	0xae0472fef291c4e3
	.xword	0x2ba7494c052f593b
	.xword	0xa844a473a47cf35c
	.xword	0x8b10414e9f5e59fa
	.xword	0x77ff9f0e70792f2a
	.xword	0xaeaf111f2134ae9a
	.xword	0xb3d1f487f0314721
	.xword	0xc37e6d33ee0909e0
	.xword	0x03fa7e809e1ab421
	.xword	0xfa28812ab116424d
	.xword	0xa2eb8e83e2e59df0
	.xword	0x85feae3a8d0aaad7
	.xword	0xe5fbe9bc254b43e5
	.xword	0x4b5eddab3413be86
	.xword	0x679089d7a6eb2a73
	.xword	0xf0f6577cb072fb31
	.xword	0xcb0a65314985089b
	.xword	0x53369fadff77e404
	.xword	0x59d5b9c09727584f
	.xword	0x4a7ddb0c14c35d09
	.xword	0xe3a5adb99c33b159
	.xword	0x4374cfd6b5a6e901
	.xword	0x7b081b90f85ccfb9
	.xword	0x1cf75ddef847ed32
	.xword	0xae88a55c2e318d49
	.xword	0x6d09cc0c5cd52cbc
	.xword	0xf51f0c8d95a5ab44
	.xword	0x3cae5526cfa94a4c
	.xword	0x81a01767b1bfef96
	.xword	0xaadf63f37e582759
	.xword	0x861e5659000ca2ff
	.xword	0x8f09730ce23e5c7b
	.xword	0x1ecd265b56f024d0
	.xword	0x7e11ad68072270fc
	.xword	0x8ea1c64048b7930c
	.xword	0x0a3e90280edf78df
	.xword	0x15d496329815a6d6
	.xword	0x3a5b20dc308db31f
	.xword	0x60a6e8d4a72879c3
	.xword	0x20354d6f427df8a5
	.xword	0xa37d8f1b817b92ac
	.xword	0xe16e659e7bf80b32
	.xword	0x279ae78c19acde72
	.xword	0x3fc99192334db035
	.xword	0xbf9f5bd02abec26d
	.xword	0xfde3a961ead15d2f
	.xword	0x5b4d8eae37e3cc2d
	.align 0x2000
	.data
data_start_1:

	.xword	0x7a34cce577fce805
	.xword	0xfdd392ff0817fff6
	.xword	0x79da9dd599137f6b
	.xword	0x1a0ac0a4b3fa7ba1
	.xword	0xf504e7b9282106a4
	.xword	0x361d2eb9f3fba64a
	.xword	0xe7ee2371490e8d57
	.xword	0xc637daf00f5c5301
	.xword	0xa74a5594bb9934c6
	.xword	0xe890bab8d17bc6e4
	.xword	0x3519186501a54097
	.xword	0x64fa00d83a67372e
	.xword	0x26a8bdec87281424
	.xword	0x1aaccf296f8c9bd8
	.xword	0x56e83dbebfd64752
	.xword	0x3ff836dd5610340a
	.xword	0x914dc71fad6a9679
	.xword	0x23a9568457e89908
	.xword	0x58dd98fca57466e3
	.xword	0x85be14f6dab40dc5
	.xword	0xb1e608c286ef715d
	.xword	0xfe461be6ae646f73
	.xword	0xb037a08f9720fa2c
	.xword	0x3383eed41cc1b4f5
	.xword	0x40fa490743f9c974
	.xword	0x425aa4431121e864
	.xword	0x293cfa55c8350de9
	.xword	0x5caa6d3ac61af4cf
	.xword	0x14bc968beaa2db26
	.xword	0xf1d412578716c0ca
	.xword	0x6a3ed231bd84c468
	.xword	0xe86d3a3cb651d6d8
	.xword	0x52341aff2b34e1db
	.xword	0x7800735bf86d8e12
	.xword	0x967e0b77469141c4
	.xword	0x657996c9fadc7e29
	.xword	0x9c5b007620173a17
	.xword	0x43a30c580a2008d5
	.xword	0x8e7a7209f0aebe78
	.xword	0xa8db28935d3dc56f
	.xword	0xb4ab2434deceaee5
	.xword	0x78d8d932b5568692
	.xword	0x3b05e17ac96cc8e5
	.xword	0xe02646f17d77a0c0
	.xword	0x4d04bb29ab015b30
	.xword	0xf29cdee1aaa21064
	.xword	0xa49f743c273daa5a
	.xword	0xd3cd1f2216fe4b8d
	.xword	0xda785cad3003c639
	.xword	0x3da22adacf3752b8
	.xword	0x6084ba208aca7b7c
	.xword	0xe7351128e3797f80
	.xword	0xf3341d22205d40f5
	.xword	0xf24ae8fe844fca95
	.xword	0xd65aeff6e4b36311
	.xword	0x6642413607335597
	.xword	0x292b71bf4c7ee4d8
	.xword	0x7b79e6cdb3a13793
	.xword	0xe417c32e55e91a2c
	.xword	0x15ed16da84e0cd58
	.xword	0xa2bd3c7ea5828d94
	.xword	0x13835ab8e39c2d03
	.xword	0xb0e5d62da5bcb782
	.xword	0xf9678ef2688f9261
	.xword	0x4ba6daa4bee0ff62
	.xword	0x2136efd285f3f5ab
	.xword	0x9ce54f7e983d260d
	.xword	0xb3ad9532eb31ef2a
	.xword	0x31ab60083ea14ba7
	.xword	0xb6e271c0022c8f43
	.xword	0x857bb0fffc2a3a2d
	.xword	0x63347997e0d54c4a
	.xword	0x517381b265ad434e
	.xword	0x0d321286f4d4ef43
	.xword	0x576243c50bdf7d9d
	.xword	0xb9b312a136925055
	.xword	0x843e76f7b40e8fba
	.xword	0xc1fe6f8fb2373ec2
	.xword	0x9e69d31cf150783e
	.xword	0x11fdeea6e03ccb35
	.xword	0x5647e5547e59d272
	.xword	0x11b7749bc65b4dab
	.xword	0xa1a14baa8972c147
	.xword	0x629116f07b4e3b77
	.xword	0xcc4ceba0bda869fd
	.xword	0xddbeb91278b2094c
	.xword	0x2cfa7d67ba7b0be1
	.xword	0xa6f83c6ae940e48f
	.xword	0x3e86c086133efb22
	.xword	0x5953f8f4225865d9
	.xword	0x2b579ffe3e7639e2
	.xword	0x531d2775ae7232ff
	.xword	0x516ae4beb71087ad
	.xword	0x1fedf780f3821e9e
	.xword	0x73fc323520c5f41d
	.xword	0xd0789ab1948b7f79
	.xword	0x7e98aa2f231e78f8
	.xword	0xea6f8ba8481dc6dd
	.xword	0x6335384251b9d2f7
	.xword	0x7f1022ff96f40976
	.xword	0x8f004f8f3fb562cb
	.xword	0x3e69b12d796c5e57
	.xword	0xb56535c30b8f4a32
	.xword	0xda3852501b90c567
	.xword	0x202ab184a69249d6
	.xword	0x9943272b4761ed28
	.xword	0xefab24e56b9c6e72
	.xword	0xfa69c1c147f4d0d2
	.xword	0x1033702127ef70b7
	.xword	0x50fbd5ad431408af
	.xword	0x7bd47feac530ea6e
	.xword	0xfd06faffd35c90da
	.xword	0xe2780bf898e176c2
	.xword	0xe75655fe0e344c8e
	.xword	0xe94530c17947234d
	.xword	0x691cfdcfe37480c0
	.xword	0xbda92e72175785f0
	.xword	0xa7fbce520a53cc8e
	.xword	0xe078a2a5f09cc7c7
	.xword	0x240db2b7b4952d1f
	.xword	0xdc51e99629863ed5
	.xword	0x0878554bde540b39
	.xword	0x27d4d3a2e3364858
	.xword	0x5cab036baf5329c5
	.xword	0xbfc538dfff8605ac
	.xword	0xb98d5f547c9f0313
	.xword	0x7569b65165636815
	.xword	0x15248007de07e2f6
	.xword	0xd4c1923f5d4e4a67
	.xword	0x73587734749e093c
	.xword	0x3fecdae8664453c8
	.xword	0xdc0bca56bac6cf11
	.xword	0x3be0882825cf167f
	.xword	0x28a97333ab40a20b
	.xword	0xaf1e2d29546ec097
	.xword	0xb946f69405db15d4
	.xword	0x8905c743b8a424ac
	.xword	0x819fea3c5b3ab781
	.xword	0xaa0f39f36a9cbf7b
	.xword	0x5fda77f020f94ca0
	.xword	0x757e38636496bf21
	.xword	0xe7f2d80f6964e5b6
	.xword	0x518512d688f7cf70
	.xword	0xe984304d99ec0b25
	.xword	0x6180f89c4b697dcc
	.xword	0xdeeab68842df00da
	.xword	0xf8302a5a30f76fa7
	.xword	0x59dbbdf783ac8bdc
	.xword	0x5a3e7080b1194137
	.xword	0xeb480b21b8b36ab5
	.xword	0xce696b9e6a7c83b5
	.xword	0x49e8d1b753e16996
	.xword	0x944826e29ad08972
	.xword	0x63c8df2e80c37cef
	.xword	0xe9e57b03b4724b07
	.xword	0xba72609c8562cbbc
	.xword	0x49b00d5fdf68b806
	.xword	0x1b494c4ea2f66281
	.xword	0xbc1f4c2257c7f1f2
	.xword	0xa7b420d7f68d1481
	.xword	0x5885d4a4923d917a
	.xword	0xb2cd707ce4f837fb
	.xword	0x6832e2a2f4eecc72
	.xword	0x1f94ab0cd7335895
	.xword	0x29500050da758a84
	.xword	0xf0e5308fc481b254
	.xword	0xa44769096f460241
	.xword	0x5d03ab19d3cfaf45
	.xword	0x73af685850c4ef19
	.xword	0xf84e3640f00e9c09
	.xword	0xf5a93e53c9ebf0a1
	.xword	0xc311d263e7bdb869
	.xword	0x5c844dc1242e5e53
	.xword	0xf1a10655b255c7d2
	.xword	0xadc79e245a89dd4b
	.xword	0x9ca23a899ce03815
	.xword	0xe01850626a0c821c
	.xword	0x30ec3c094830e17e
	.xword	0x96b2a2b97488dd58
	.xword	0xdd9ce4724b3cdab4
	.xword	0x800d3b1d918114fc
	.xword	0xfa542087851a6d59
	.xword	0x1c2227bce37ea9b3
	.xword	0x24776a8982b94ea0
	.xword	0xf27cc9bf5738bd03
	.xword	0xbc82ab224321ac91
	.xword	0xfb3f554fa51e1770
	.xword	0xf31762ddca894304
	.xword	0xcfd5f7c7c5c11434
	.xword	0xb2ba1bdf15ad5887
	.xword	0x9fd0fe509c9b81e4
	.xword	0x45903cb00a44aebb
	.xword	0x1415461e7b816aef
	.xword	0x944da71acffc899d
	.xword	0x1ddeadeb8d145d18
	.xword	0x8aa5fd424dbd672b
	.xword	0xd1d6ff72ecc011eb
	.xword	0x9347c4bc5b6bdeb7
	.xword	0xf22ed035f1025e4a
	.xword	0x6636ebe5aff4be92
	.xword	0x652ffd6e0d47c93e
	.xword	0x06102b9caca3656c
	.xword	0x8df76742dc679efc
	.xword	0xc3e760cea113c159
	.xword	0x0e817fdf2a20e968
	.xword	0x1dbae0010712626b
	.xword	0x7d62db2c03909a4e
	.xword	0xf5c0df65b5dbdf9b
	.xword	0xd617d5efc79b1490
	.xword	0x008598ab5adecf54
	.xword	0x45e1bdb42e66e7a7
	.xword	0xea5ee34cf71bdf37
	.xword	0x9a914289b5588144
	.xword	0x5204f2f7e7bd0094
	.xword	0x28fb0c4659322413
	.xword	0x2cac2e1276c84ae4
	.xword	0xbc808e4a9de25a10
	.xword	0x3e8fe676c8bb867f
	.xword	0xc35dd5271cc63e45
	.xword	0x3efdedb05f2461b5
	.xword	0xe7f6f0d7f275766b
	.xword	0x9bde1940473a4252
	.xword	0xbcd7cb458872adb3
	.xword	0x1730835f94fc973c
	.xword	0x8ce8263b7ff12721
	.xword	0xcac9af361f9792e4
	.xword	0xba153383c90e0dc6
	.xword	0xf08e8674c7fc8a6c
	.xword	0x52ffa8a4420175b3
	.xword	0x830659b40af00848
	.xword	0xe9b228be8f017f1b
	.xword	0xdaa1000a27664d6c
	.xword	0x1a923c37ea61cd04
	.xword	0xe37a07302888ee39
	.xword	0xd59ea99ab98c5440
	.xword	0xdae748417f69f37b
	.xword	0x5e8775508a63d963
	.xword	0xe352e1e2041308cd
	.xword	0x19b5995d9092d08e
	.xword	0x34543935ec2e3448
	.xword	0x220ad3489d3a7dbe
	.xword	0x131c5ae95b0c8c13
	.xword	0x7059ac627f1cde1b
	.xword	0x96abfa4aa250a884
	.xword	0x1ab6c579366552ff
	.xword	0xe96c2bd55dd6413a
	.xword	0x65dd378ff04e031f
	.xword	0x2f910c9e6ba5d0c2
	.xword	0x0b39bfa902362921
	.xword	0x27ab66c9444411e1
	.xword	0x8a1a24cc27f3716a
	.xword	0xc832e373416120bc
	.xword	0xc49923d261702ef1
	.xword	0x3209915f16a7b881
	.xword	0x0b72889f0cc43e85
	.xword	0x131c11f978f5433c
	.align 0x4000
	.data
data_start_2:

	.xword	0x5fffab7337e8959f
	.xword	0xa31ec725eb0cdb65
	.xword	0x2019ce43ef2f61c5
	.xword	0xe70497c245d22062
	.xword	0xf1b5648659303625
	.xword	0xeed21cd05d9ac785
	.xword	0x425067a3a94e581f
	.xword	0x4c67ef494f818f02
	.xword	0x70b904f670cc1aa4
	.xword	0xfcd0e60d0fa26f7f
	.xword	0xaea374ff608d8ace
	.xword	0x9ee786165f9264d4
	.xword	0x866e34771b5100a1
	.xword	0x7b2d47dd0d12820c
	.xword	0x0446ef67936f2e0f
	.xword	0xfb4ae3e3285eb1cc
	.xword	0x12dfbc6f332cfd3b
	.xword	0x71df17d56d3ea417
	.xword	0x5dd790cced484d11
	.xword	0xe86a71a393324e2f
	.xword	0x164df9674956dadf
	.xword	0x1e4abc55e92a36bd
	.xword	0xe5baab1d1d3ef803
	.xword	0x101e19a6507552e0
	.xword	0xb42a21b1def9c446
	.xword	0xe9bc1917832e49c2
	.xword	0x9f955a618e92c873
	.xword	0x604ab1732288a3b0
	.xword	0x65a5d721fec82cee
	.xword	0x0f220b492fa92cdc
	.xword	0xb05c93db547f2a58
	.xword	0xb5755ba80d2940b9
	.xword	0x8419e13a21b77a2d
	.xword	0x83a39264a7cb7edd
	.xword	0x538a4f5dc3bd6703
	.xword	0xdb1ef098fd8d8921
	.xword	0xa13420160a772f56
	.xword	0x0c28530c0e61c75c
	.xword	0x8a1ebc2b9664a892
	.xword	0x67854a772296ba45
	.xword	0x0f728721b9a277bd
	.xword	0x57a40f1577233fd4
	.xword	0xcc0372e39ce7af94
	.xword	0xf39437e516d34d69
	.xword	0x3aeb6ff69c4532c4
	.xword	0x2b44d1c849d31767
	.xword	0xa843e3b2ca269169
	.xword	0xf6bbe55d45e506cd
	.xword	0xc92f58be7336df1a
	.xword	0x1440cd202594499a
	.xword	0xd2104dfdbc435a77
	.xword	0x29dbe4599b7abe1f
	.xword	0xdda3ee30d661bd67
	.xword	0xd5759d74ce5a2386
	.xword	0x0433e5e5a338dc9f
	.xword	0x66aa469719b42adf
	.xword	0xffe635f7afc18ae4
	.xword	0x2be238088b7d2994
	.xword	0x5264558cf3955bf3
	.xword	0xf124bf39f83cc890
	.xword	0x6488d38c44661d62
	.xword	0x527f0f7d42b360c5
	.xword	0xa5adab6f93de4827
	.xword	0x03f138b0edf49f5b
	.xword	0xf2ef5c5565bf9dc6
	.xword	0xfca9cc37fdff193e
	.xword	0x0995835139540d91
	.xword	0x1e8d79dcd3045280
	.xword	0xd5c25e4adcc89bb4
	.xword	0xcaa24d63f82b49b2
	.xword	0x2475611855e0fb07
	.xword	0xcf5beb2286f209de
	.xword	0x81c7faf04afba645
	.xword	0x8b5ae155e37dde83
	.xword	0xcf26e2e03900006e
	.xword	0x678fbe2852d9ee30
	.xword	0x52a687f4825ca50e
	.xword	0xa0b8974d57463265
	.xword	0xc4635776d94828d9
	.xword	0xa6962c403b9f3bb7
	.xword	0x506d034a70b8b404
	.xword	0x68d5e618433f632a
	.xword	0xf548797acedf30e9
	.xword	0x7ce20699a227ab8e
	.xword	0x8bd1a6410542723b
	.xword	0x2cf5c9a127606544
	.xword	0x23e3a3ec447dc7ab
	.xword	0xa976ea97f9060e59
	.xword	0x6af016e12d7a95fe
	.xword	0xc9af1b84b5f5b8ac
	.xword	0xebef6dc28626bba1
	.xword	0xf3b239bc3d263fcc
	.xword	0xe4d1d53b76b20827
	.xword	0x9f5fba74c87b05d3
	.xword	0x88d7804779a65d1e
	.xword	0xdff087f54756bd5c
	.xword	0x3884cdf00f6e7023
	.xword	0x5fd36642a7a94239
	.xword	0xa65fe852bb2af4ca
	.xword	0x2f4a4436cd3699af
	.xword	0xd7d96b59e6f4c488
	.xword	0x22e9db1f9ada894f
	.xword	0x2407930412b9a3dc
	.xword	0xa8d5768f01fa6a30
	.xword	0x1ac60bab27e5d8a6
	.xword	0x3825f96560bccc6f
	.xword	0x4659435b2dd4dc69
	.xword	0x7113af220d0b4d50
	.xword	0x5a1a991268e4b83f
	.xword	0x28336e02df2235d2
	.xword	0xa086b058d81963e0
	.xword	0x47c29efbc5c5c001
	.xword	0x15a6f8c09bc3f109
	.xword	0x655c7c7ffa8dfa21
	.xword	0xcaaed8348812b9d6
	.xword	0x7a5bc71bc8c256e0
	.xword	0x4441bcdcf4dbb005
	.xword	0x7c48c6c02ef07eab
	.xword	0xc928f4b79d3d7ae1
	.xword	0xdec6a987f1bddbd0
	.xword	0xf3429ef5bc95d7b9
	.xword	0xe4235dca9146d943
	.xword	0x0f7cec5ec74179f1
	.xword	0x467b3b5ee7477052
	.xword	0x8b07b69f50505573
	.xword	0xdeba5137a1ff0d70
	.xword	0x43cd7c81a51306aa
	.xword	0x86d9f93e759e3fda
	.xword	0x337baf6991e0a494
	.xword	0xb29364e4dcc564af
	.xword	0xd45c803b11341f01
	.xword	0x5484c8f27ed7bb7d
	.xword	0xa5fe1a86f8c30fe2
	.xword	0x744554934a439d06
	.xword	0xf32e40d61cc2e227
	.xword	0x79d401c38b2c41cd
	.xword	0x0452698e83ac704c
	.xword	0xee5f656ce89eb2b2
	.xword	0xfc29a1db80e867ce
	.xword	0x2de349e1eeeca7df
	.xword	0x292424d7c475bced
	.xword	0xd24e2400b18f6c1e
	.xword	0x8359a38c6ed762af
	.xword	0xe8c99b722b9c8f0a
	.xword	0x5d67113562be83fe
	.xword	0x681218b66e643229
	.xword	0x60cf6378f4001d9e
	.xword	0xfe32ed1b4499db27
	.xword	0x9194d67577414484
	.xword	0x822e25a0ad4f6b53
	.xword	0x28cfafd17a08827c
	.xword	0xa497671edc692b77
	.xword	0x953a71e1d9cf2887
	.xword	0xe710ea20a3e8f7a3
	.xword	0x1961ef086d6247e8
	.xword	0x7c4a993768ec1212
	.xword	0x42f46cd565837771
	.xword	0x42d846a5e7d3e5e2
	.xword	0x989331f18cf89999
	.xword	0x1b12bd778a54d3f4
	.xword	0x48fcd2c1d017b51f
	.xword	0x8f2ed859b09e1bbe
	.xword	0xa1a94bff16075926
	.xword	0xe97a327c6152cea2
	.xword	0x54e3669cad103cc0
	.xword	0xa79f8a72be7a5a73
	.xword	0x769d588951ee0619
	.xword	0xcec29c28b14f6361
	.xword	0x247168f3b5f92548
	.xword	0xeadbb44aeafd6ae0
	.xword	0xb2161f10cdc7f781
	.xword	0x8a39dd9695f4c713
	.xword	0xbe6719baf55081f2
	.xword	0x5aa31aaf9c88349f
	.xword	0xd2ff9647a99d0d10
	.xword	0xdfd679b8d16c9830
	.xword	0xd76437ee8aefc8ae
	.xword	0xb50f8dec342a916c
	.xword	0xac03588943b49c43
	.xword	0x52b239b2392b1201
	.xword	0x2d67abca5753290d
	.xword	0xf0b5b9e63a9ff375
	.xword	0x1c019e8d0464f7ed
	.xword	0x3be63eb7a94e9f44
	.xword	0xd74e1d573ea4e960
	.xword	0xd70c20c736cc15cb
	.xword	0x1a744ac2520da0de
	.xword	0x0904ab24bd432e40
	.xword	0xea739e3b9adb4974
	.xword	0xb12e09d67dd3aa34
	.xword	0xf2c29758fc6659d8
	.xword	0x6874dfc02c0456c2
	.xword	0xdccb0840bce75018
	.xword	0x7b448c5dba366057
	.xword	0xe55677c4284514a9
	.xword	0xecc7c9329f07ef8c
	.xword	0xe1c0bfdcb1c70501
	.xword	0x4eb3dae4e69c7d6e
	.xword	0x08b5a8a1f94f49ee
	.xword	0x6026c04ce0fb4fe1
	.xword	0x6cb5271d9c74d61f
	.xword	0x5def3d4ef0ecb85b
	.xword	0x64cdef255fab3fd6
	.xword	0xfae6a24c627df7cf
	.xword	0x0a64792faa88c9dc
	.xword	0xd16f4df4b1c82aa2
	.xword	0x92cc23b0f46eb3aa
	.xword	0xd5e6b7041ffac4bf
	.xword	0x5de57cef0baba033
	.xword	0x087cabb90f4c99b4
	.xword	0xd5bdebdc41cb012b
	.xword	0x3f317807aacc8220
	.xword	0xcd04a89c0c412af8
	.xword	0xec60e96c4c8ee979
	.xword	0x8501740c571f684a
	.xword	0x0af398e25f663dce
	.xword	0xe9ae576cde8293cc
	.xword	0x1d8745ee5e79c866
	.xword	0x1ea407197f790589
	.xword	0x5fd5d9cd4bc4a990
	.xword	0x435df802729931ca
	.xword	0x61542b463af17515
	.xword	0xda82cd2214cfdfa9
	.xword	0xdf2e3610df4dc97c
	.xword	0x4f2838c19bc58725
	.xword	0x72b34cd00760e2d0
	.xword	0xc6cd0b0ecfa688b5
	.xword	0x74cf9bad3510175e
	.xword	0x84a20dfaadb2013c
	.xword	0x8af79e696f2811c6
	.xword	0x9e93127877364d61
	.xword	0xb2a68fecc6905666
	.xword	0x3144c265c25aab2a
	.xword	0x043f74e465f02a50
	.xword	0x60201e6a2642df19
	.xword	0x689dae1b2827d087
	.xword	0x4a84dae5a17ed188
	.xword	0xd1a86383b125631d
	.xword	0x526c77d3e7d925b6
	.xword	0xe49680684554c41f
	.xword	0x92937791ba515296
	.xword	0x7d71ff3127571d21
	.xword	0x2e81df66509b62b2
	.xword	0x89e8bc78ddb90423
	.xword	0x2f49c82c7d54f213
	.xword	0xa26c3e09e4ffb24a
	.xword	0x215a34b51b867c0b
	.xword	0xaee77cb639e4dbdb
	.xword	0xb1e44f11fb6556ec
	.xword	0x0488d523bd33841f
	.xword	0x76c4545f1b1ef90f
	.xword	0x5b6d2c52aec016b2
	.xword	0x72dde287575f4f2f
	.xword	0xd669761dbf8ae351
	.xword	0xa7d2be6cce4f1cc3
	.xword	0x10f2f12ab5356480
	.align 0x8000
	.data
data_start_3:

	.xword	0x3d897071eb2d49bb
	.xword	0xd0ff41d82f1998fe
	.xword	0x0a9e1933154ee62a
	.xword	0x84ad0b285c9ba694
	.xword	0x64b04a38fd19c94c
	.xword	0xd4005e5c88cb40a8
	.xword	0x345a77d255d06b38
	.xword	0x1dd658fcff7b25c4
	.xword	0xee464b633221fb8d
	.xword	0x9608cde832fabf43
	.xword	0xac8a4fa5770afb86
	.xword	0x04aa3c8980bb2428
	.xword	0xb1527b990bf67596
	.xword	0x3637a7b8aa85b448
	.xword	0x1a151cd0e00c93f3
	.xword	0x9f0ff147fa42b0b4
	.xword	0x04d012587a9105e4
	.xword	0x574b887e15f1ba13
	.xword	0xb816b3d773b394ce
	.xword	0xc000886979056843
	.xword	0xa32858d14d0993ad
	.xword	0x54644ab11894a0bf
	.xword	0x2a79fd54c86e4789
	.xword	0x04aee4a6dd745d4f
	.xword	0x60ab1469c6fbb947
	.xword	0x2367b2f16369653c
	.xword	0x37f2c5c0cb4c739a
	.xword	0xe31ea2ffbe6f755f
	.xword	0xc187a3d837b07db1
	.xword	0x56a3540a4d7187e2
	.xword	0x2894bb4f94dddb65
	.xword	0x7b4b7932a1acb0b8
	.xword	0xd2499a69aa9a364c
	.xword	0xb9b53bbd3a502cc9
	.xword	0x948b1d9b6cecf61f
	.xword	0x3231bb60ff232ea8
	.xword	0x96e34d232a40e07f
	.xword	0xc6e6c9e3fb077094
	.xword	0xb3e7746726415cd0
	.xword	0xc626e240abc8c6fc
	.xword	0xdb5b3d5b01064143
	.xword	0x014ff036ba82d3d1
	.xword	0x1f78087f0ed3f2f2
	.xword	0x9f77c0b9ec4b1eeb
	.xword	0xef9ba2fa5c5cf2f8
	.xword	0x8e2c1fae3250402a
	.xword	0x2c95891a0319f27b
	.xword	0xbd4dfef0447b15e9
	.xword	0xf257798b5aaac061
	.xword	0x6cfe8813327354a2
	.xword	0x8a7ea87d5c31553e
	.xword	0xcad935911d629911
	.xword	0x81d7a8545774ba06
	.xword	0x6e576cb872d7ceea
	.xword	0x259f7a331a4abe26
	.xword	0x0c5bdfbf4b745a67
	.xword	0xdc59c8d284f805f5
	.xword	0xa671bde7393606f4
	.xword	0x9c4ffde933352046
	.xword	0x60d37d56b0ca3534
	.xword	0xa0b9baac2944b7ac
	.xword	0x2c08cb64949c2e22
	.xword	0x8b84e45ea1c76795
	.xword	0x66076bca0ea0f921
	.xword	0xddd2312b9e78215b
	.xword	0x211b50e9fa7dcbf2
	.xword	0x3e2962bc8600e675
	.xword	0x9ba28087a25ee648
	.xword	0xa12c6f7ccc63c577
	.xword	0xf89d4dcb664538ad
	.xword	0x4d421d052c1c81ee
	.xword	0x53f1da3a2eceeda6
	.xword	0x0f9ed93a13f4b2d4
	.xword	0xda4c57a6f04aeabf
	.xword	0xfe83868c44f7c2d0
	.xword	0x6712deb11a484825
	.xword	0x621c0f77b274e5ab
	.xword	0x26031bfcd80eb1c1
	.xword	0x38e9eeedf21f2294
	.xword	0x73a063cf8f3aa6fb
	.xword	0x67218b4d451f8480
	.xword	0xbade908577e6b3c3
	.xword	0xf48312f37c006c78
	.xword	0x900da680c5032a42
	.xword	0xabee5fffde8d90a9
	.xword	0xedb6f6eec1ef3d81
	.xword	0x3894d9e28f4e516f
	.xword	0xafb5a006de3df37b
	.xword	0xf4fad8c066320092
	.xword	0x981514b1c488bdaf
	.xword	0x0457a13836c4f696
	.xword	0x7ae6881eaba2fdd4
	.xword	0xff1998451c773f0b
	.xword	0xbb9a0f11f7616abd
	.xword	0x68ab2c042e1b857a
	.xword	0x9c36255fce4bcc9a
	.xword	0xf9dd4ac7565cd176
	.xword	0x8c57a261f21de646
	.xword	0xe87d3040927c82a8
	.xword	0x4af5d87af9cd85e0
	.xword	0xe3ec770741477e57
	.xword	0x22eaac4032d4c017
	.xword	0xdcaa67da9d8787e8
	.xword	0xa4d56e987f5e7ed1
	.xword	0xa981eb9c3f9a8085
	.xword	0xb6de45dba8cbdf22
	.xword	0x1b917a3a0e2c962f
	.xword	0x312fa9675953f8dd
	.xword	0x4d52342b78cedd95
	.xword	0x37fbcb55ede45894
	.xword	0xfc1177fea0eee77c
	.xword	0x9cbd3535094efc7d
	.xword	0x8f19392ab7d743d5
	.xword	0xe4906e7850fa8f00
	.xword	0x65482585fb87d220
	.xword	0x12dd6fcfe9dab9d0
	.xword	0xccc391000deb56fa
	.xword	0xc28b410ac6843a6a
	.xword	0x5d1c155f9b4cc4ca
	.xword	0x53604b624d946a52
	.xword	0xf9e1a07dca2378d1
	.xword	0x4f93a2c5a8c07893
	.xword	0xaf523e4e75108e6d
	.xword	0xea11785e59d49dd7
	.xword	0xee242bc4e07a425a
	.xword	0x044561ea1b02f375
	.xword	0xade60b6bc8a84b46
	.xword	0x3029545adc6dd1af
	.xword	0xf917c46e16dd1551
	.xword	0xcc26088c1a1fd803
	.xword	0xf2d2ccbe1f055fe9
	.xword	0xfb1e0e904cb6ee1b
	.xword	0x2e7d3994794f429f
	.xword	0x98bed254ab5abe32
	.xword	0xb4da1e364b3d7819
	.xword	0x95e366f0b737605c
	.xword	0x8684f291721e2e9b
	.xword	0x834cbb9a38975c0f
	.xword	0x6e7dd8b3ca1adedb
	.xword	0x1a3b5039d157130e
	.xword	0xbe0e84e83e743f37
	.xword	0x39d0938269df13f5
	.xword	0x668dbea56fbc2d05
	.xword	0x2f583f52c00c7f95
	.xword	0x1cca6c3df4c4ae89
	.xword	0xa764a7ff56ee9e16
	.xword	0x1f4a5275115316d7
	.xword	0xdbddfc2d19ab984b
	.xword	0x2a04743e98c0aebf
	.xword	0x328eceb8d131999d
	.xword	0x520751d99cb50fd1
	.xword	0xb88a9addb4bd9747
	.xword	0x4e344c6074a09eff
	.xword	0x66075b8e84e8a0a9
	.xword	0x3963653f4584610e
	.xword	0xe4ce3857ecc44cb6
	.xword	0xf16dda53484ee911
	.xword	0x4627f79b1d0ee0c2
	.xword	0x50a8a33d5412e013
	.xword	0x5b393643f16f3571
	.xword	0x5f11ab0c6ef57d53
	.xword	0x26a8787c60145249
	.xword	0xabe053214bedd0b4
	.xword	0x782febc7058d3754
	.xword	0xbcc74d6139dd4b7d
	.xword	0x35fe4011b6fc2777
	.xword	0xe1796efcbc7cdb5c
	.xword	0xdd9c3bd55cecb435
	.xword	0xe50c4a7e7d7e687c
	.xword	0x7a87b43330b06f30
	.xword	0x9669c5e7dca84827
	.xword	0x581064de29b99afb
	.xword	0xa1bd5e1eb35895b7
	.xword	0xe3edaa966cbc1c73
	.xword	0xc7dcd58e30ee110d
	.xword	0xc7c20da55c3361f0
	.xword	0xfa7a4048751e189a
	.xword	0x82a30a9cb68766e1
	.xword	0xe4f628edaf57281e
	.xword	0xf9bfa4c8cc68ed13
	.xword	0xe2b23e0c76eae584
	.xword	0x64b21b2bf1dfec59
	.xword	0x78e5aab0571d7810
	.xword	0x08916ea2ed9b9874
	.xword	0x9898b1df3380ad81
	.xword	0xc82a03ca17d2814f
	.xword	0xd400108e503011c3
	.xword	0x27963de5a004efc2
	.xword	0xa7414e8ddba6ce04
	.xword	0x1feee955daea1b6c
	.xword	0x51970433f5e7a253
	.xword	0x6d0f976fbac2cefa
	.xword	0x53df2bef42ca5ea9
	.xword	0xc4fa12ce40e54ebd
	.xword	0x3aa9bdce576d0ec3
	.xword	0xc337deab7e73e119
	.xword	0xef93d45f11f96175
	.xword	0xaedb6253822ba704
	.xword	0x95519a16396c0be0
	.xword	0x9f28f4f40f94ce51
	.xword	0xa2dc29c020733747
	.xword	0x8c8dff216d383c04
	.xword	0xa4d411c1840ebff5
	.xword	0xf8d5410a0248dd36
	.xword	0x92f44099419ecb27
	.xword	0x55485a955df388b6
	.xword	0xe4f83d126e73e64c
	.xword	0x9b7d9c9ce71fb9da
	.xword	0x61fcfc382c8dab6a
	.xword	0x981741a740ebc7cc
	.xword	0x748ff9cfa16807c2
	.xword	0xa1b44a8f6272803c
	.xword	0x00a8c3c501e04068
	.xword	0x31fb47068473b53b
	.xword	0xf6533942cc227576
	.xword	0x9516e83d66d852c4
	.xword	0xac10548e8b8f1031
	.xword	0xf8bfd45cda92c749
	.xword	0xd12d62182fc7d9b8
	.xword	0x7b0659df95ec5b75
	.xword	0xb59ffdf085949166
	.xword	0xf6040e9d3c863530
	.xword	0xb5f58d5d5a7ccaf5
	.xword	0xd0b8d47be66e32c3
	.xword	0xb8664fdf47f7081a
	.xword	0x6c89612283342d4d
	.xword	0x2085b16c2c33a54b
	.xword	0xe7a274a417dcd3c8
	.xword	0x86968e2a066987e2
	.xword	0x20e88902289baeca
	.xword	0x8791b549048c83bd
	.xword	0x94bf42f47a80d446
	.xword	0xd27e4eb440c48716
	.xword	0xd3f5fc9ded638a6c
	.xword	0x03adcc76cd8be713
	.xword	0x1a9d34c4bcd5abe5
	.xword	0x216a0b6de93921a6
	.xword	0xbd3eca22cbd1064f
	.xword	0x9a38f07d391cb228
	.xword	0xf33171f28f2bfeb7
	.xword	0x76ead1383e86bedc
	.xword	0x1721ea0dd514e2bc
	.xword	0xb6ea1eeba7f6eb25
	.xword	0x4fe224d9e472f9f9
	.xword	0xe64acb5fda62a2df
	.xword	0x2ed68f947dd09730
	.xword	0x0cc6210211c14df7
	.xword	0x765a0a85a0012254
	.xword	0x0e9aaaab3f79d102
	.xword	0x647c1dc5440849b2
	.xword	0x1d21a8721149bc27
	.xword	0xbfb3ad384949afdd
	.xword	0x69089b0c6683e8a2
	.xword	0x3c46493476ddc390
	.xword	0x851804efc2291a28
	.xword	0x21a4eaa2f2e28d72
	.align 0x10000
	.data
data_start_4:

	.xword	0x747da93561957982
	.xword	0x9be95e25a74b7fa7
	.xword	0x2a47bd63e3a276f2
	.xword	0x7567bef8623727c8
	.xword	0xf8a3b2640b07888e
	.xword	0x14ced558a120f513
	.xword	0x422b811ce2b3506b
	.xword	0x89cc157a6d61db63
	.xword	0x677d45dfedcb436d
	.xword	0x9ab6b249c2ae859b
	.xword	0x5f1707049e2135e3
	.xword	0x8601cd407f5bfd3c
	.xword	0xe21be458efccd1ec
	.xword	0x196b84bc873d516e
	.xword	0xfdf75ff47cfb53dd
	.xword	0xa5da4223793524a5
	.xword	0x9549439c5162dbf6
	.xword	0x9ccb9323397a52e6
	.xword	0xf36559a04a1d58d9
	.xword	0xbd1e979ae0859b55
	.xword	0xa1c2dd7c67c28ebd
	.xword	0xe9deb820b01b8f87
	.xword	0xcb21eaa8fb3d2eaf
	.xword	0x6c34663695e26062
	.xword	0xb8b7b8021ee7eef7
	.xword	0xf02032a619592971
	.xword	0x7559f7351284596a
	.xword	0x22f5b0a3e83ec924
	.xword	0x49fea244eeb43e42
	.xword	0xf64e2d81c06f40e7
	.xword	0xa3fda23aee072100
	.xword	0x57839a7348a96bb7
	.xword	0x1fac27538ea18f65
	.xword	0xc1da47fadc28037d
	.xword	0xc85ccafc28cbfb8c
	.xword	0x0f92cc780d729671
	.xword	0x45d02d440e758547
	.xword	0x373575f6452645ad
	.xword	0x47924bbabd65658f
	.xword	0x7f7eae331a179603
	.xword	0x984f7dd4fac66402
	.xword	0x44a981272e24d168
	.xword	0xa530dd88277ced9f
	.xword	0x844335d95c6ca3c2
	.xword	0xaee34349bc46b6b5
	.xword	0x79a5a1b9b8505733
	.xword	0x67c31a0ff79bb6ee
	.xword	0xb0fa31b14fb0fc0a
	.xword	0x09d07bdc5a54725d
	.xword	0xc94214d422a11c7c
	.xword	0x6a49b59245cd3223
	.xword	0x750df8db7b3b0a81
	.xword	0x19dd27aa283ff64c
	.xword	0x674355d30be3adc3
	.xword	0x94b805c3874008ee
	.xword	0x56c7b9f5a1929064
	.xword	0x1580d80fb06a68ca
	.xword	0xfbd35bebaaab5d61
	.xword	0xbada0e2a09da6006
	.xword	0xfd2888aadd2ad7c8
	.xword	0x3682f595e506d8b5
	.xword	0xc234bb20d658cafa
	.xword	0x4baa38401a339bb7
	.xword	0x2f82235eafbd090b
	.xword	0x9cd66261ca6dbcb5
	.xword	0xc90aa0a8669bdc07
	.xword	0xe939c2af8a948ccf
	.xword	0xacd02415eaee3b63
	.xword	0x703cb774dae8fd1a
	.xword	0x7f4ded7fe6b995b0
	.xword	0x3ab293f0fa631a86
	.xword	0xd8a5899282a62594
	.xword	0x48e6b3c647fc3908
	.xword	0x50af15a3b1b91ecc
	.xword	0x453443667cff7eca
	.xword	0x1660f488c799e835
	.xword	0xaaf6e71355848b12
	.xword	0x59f80f55388aaf77
	.xword	0xd706e7f03c2eb54f
	.xword	0xad41f0b716238caa
	.xword	0x83b4bc2526ceb1fd
	.xword	0x5b6abc5ed0486990
	.xword	0xe44161abc1837280
	.xword	0x29acb7f3701ef80d
	.xword	0x532f0e3f0141935f
	.xword	0x7c2acdd533f1c62e
	.xword	0xcb958717675604e6
	.xword	0x74719545cca69315
	.xword	0x7cb84df3eeb3fb36
	.xword	0x754aca6b8d401b38
	.xword	0xc08fef1567dc4a7a
	.xword	0x56ee2994b932a5d3
	.xword	0x890a74bd106cdbc6
	.xword	0xdec1a76844c1835d
	.xword	0x8998f5b22bacf2ab
	.xword	0x4a3db669dd0d9c31
	.xword	0x707bfae49fa41a08
	.xword	0xd5b93f1f36d8012b
	.xword	0x8c4e2b8de0b901e3
	.xword	0xf20c7b1f20db4ab9
	.xword	0x68f841b69d7d1bd5
	.xword	0x2b842d9183656832
	.xword	0xd86226a89ddde347
	.xword	0x03ab48d12f1115c7
	.xword	0xbeba423ea429714f
	.xword	0xa814ba5cdbe67598
	.xword	0x2308528a7bb867a6
	.xword	0x5cc97e23389cc9a6
	.xword	0xe89d3b65e99c02ed
	.xword	0x91238e5f583bc686
	.xword	0x7c0bc875b80abf9a
	.xword	0x773f71cafd3368a5
	.xword	0x61f7e497bd4a4f2b
	.xword	0x93ff0128cef01051
	.xword	0x06816f9058ceba41
	.xword	0x45cc8fc3b14bd09a
	.xword	0x5382c89c3db3ad1c
	.xword	0xa87d9515e362e135
	.xword	0x79893ef6b6be9f8a
	.xword	0xb11f610ab8dbf5ec
	.xword	0xe07b65434c922b3f
	.xword	0xb39e6d6c0b5d180e
	.xword	0xefaff5ef0ec1eb3f
	.xword	0x5b012db19dc602d9
	.xword	0x12ebf1ae8bc79466
	.xword	0x77e900cdd1addd53
	.xword	0xcca3a7867f59af4c
	.xword	0x2f2990c7032ae6f9
	.xword	0x6ffbb1cee89155b3
	.xword	0x8c8a4b17125f356c
	.xword	0x44f40ef00710532a
	.xword	0xec053f951ad8b143
	.xword	0xbf51e769eda764b7
	.xword	0x4280de2ec2562d93
	.xword	0x7102c304fad4d1b4
	.xword	0x1ac99ef278ebb967
	.xword	0x3b578cbdefb632d7
	.xword	0x4355baad9951748f
	.xword	0x2db27949fbd45389
	.xword	0x05e769b808ef8888
	.xword	0xd11e6ae42d9d0e78
	.xword	0x5cc8231f7cdc3b54
	.xword	0x33b4dff60afa3e30
	.xword	0x5b0fc7eaff19fd28
	.xword	0x53ac34199691a776
	.xword	0x343a7eda790328dc
	.xword	0x7a8779ee4e8f8b2b
	.xword	0x754b682177fab405
	.xword	0x948061c7fee27bfe
	.xword	0xf6c79e2cd7069c00
	.xword	0x37945442bf11f6a9
	.xword	0x4215f114b166c57b
	.xword	0x4133ca01f04dcc5f
	.xword	0x602bd0e3f7f300dd
	.xword	0xbe0b584c72d871e5
	.xword	0xec8c9bd0adc0fe23
	.xword	0x392843049a3d99ef
	.xword	0x219854b268471080
	.xword	0x6e119aa358e6c9ec
	.xword	0xb09918bec141cfaa
	.xword	0xc0bf77f3dde5338d
	.xword	0xc7575da03965c114
	.xword	0xa99eb65645394552
	.xword	0xa45534d14b476d71
	.xword	0x930e686a538d7104
	.xword	0x5d80f49f218d1e4d
	.xword	0x32eaeaaa345343ad
	.xword	0x0236c059cfacc7a5
	.xword	0x3a4f7f8b456aa4b6
	.xword	0xb1186e2129d1d33b
	.xword	0x6cd1bb7683321ed8
	.xword	0x3da685768795c056
	.xword	0xc6576f6b6a0b4d59
	.xword	0x2f3d8284a27a8951
	.xword	0xbb0202e540fbafee
	.xword	0xef90017191b6ec7d
	.xword	0x0e1711b0c9b269ce
	.xword	0x8be9a0bb8a6eee50
	.xword	0xcc02f0e9f2af818f
	.xword	0xe966a53626a112c4
	.xword	0xbc05c1bbe760960c
	.xword	0x63e8a8790b9116c6
	.xword	0x30300c119b5dac19
	.xword	0xf5717ea49dab52ec
	.xword	0x4324c56c7cd8c2ef
	.xword	0x587ac35681414019
	.xword	0xc6035b393924ef08
	.xword	0xf764b2990e0482ef
	.xword	0xf7c97f6b44e01483
	.xword	0x843868f3bd43fa8d
	.xword	0x1eed5b5612119051
	.xword	0x362dab18618e598a
	.xword	0x1d8c9bfe55f1e63c
	.xword	0x250aea0299b44237
	.xword	0x4aaa9493480e70d8
	.xword	0x7cccc442b0a1085c
	.xword	0xd787355d975807d4
	.xword	0xb28c01fadfd4d4fd
	.xword	0x2366a1de91838990
	.xword	0x8501dbdef7a63da0
	.xword	0x15b1a40d73f8e7ef
	.xword	0x4fa6dbcdc85b72dc
	.xword	0xdf7e77e5d76786f2
	.xword	0x69201c4c1fdb8dc3
	.xword	0x5ff0a52b75cbf414
	.xword	0xc6e8bd10dff00c5b
	.xword	0x35a60069569ed3ab
	.xword	0x0fa7c59577879f52
	.xword	0xa68ca9494e76483f
	.xword	0x869970a68dbbfd63
	.xword	0x79f71158dd2c3daf
	.xword	0xea5566003ab763e9
	.xword	0xd900242d857f21c7
	.xword	0xd4264299010bc59b
	.xword	0xe46392637874ce30
	.xword	0x516b9a48bfe43348
	.xword	0x03d0841e14f94489
	.xword	0x37789f2557df6434
	.xword	0xac77e4808109d4fc
	.xword	0x113bcf5c9f606b1b
	.xword	0x1ef398f84ce5e24c
	.xword	0xb056913559b1d21f
	.xword	0xa387a892bd195be6
	.xword	0xf83c0b52a5add8d2
	.xword	0x93fe3c2641a36c3d
	.xword	0x0ed1b59906ce57a0
	.xword	0xe4789adb4a898189
	.xword	0xd0cc8c9e7aad04e4
	.xword	0x484707db892234d0
	.xword	0x937e56645ca78490
	.xword	0x0c9b0f2c012113fc
	.xword	0xe7067f7a2db21466
	.xword	0xbea8cbcf1ff3fe84
	.xword	0xdae124dd05c4f7e4
	.xword	0x24186d4f7634b6a9
	.xword	0x5333bfd9aa210c00
	.xword	0x42ed8084c3520ef6
	.xword	0x1f5a8986c1cea949
	.xword	0xa1874e7e2e59d32d
	.xword	0x9b1fc616bf94ae2e
	.xword	0x465f6effc7ef1c43
	.xword	0xe0e626a4933028c8
	.xword	0xcd64c00bf34b24fc
	.xword	0xad0553195a45c414
	.xword	0xbf857f2a42ab1663
	.xword	0x39b81ff3c96894db
	.xword	0x9c39820f8feba7db
	.xword	0xdeeb74937f81c699
	.xword	0xcf2479c1b236dbd0
	.xword	0x7d0e215980abf210
	.xword	0x7cc7135fc93d6703
	.xword	0x851d8523fcca8dd7
	.xword	0xb1b91f3568627640
	.xword	0x6b1b4203c18b7cf6
	.xword	0x781723405d7f9efd
	.xword	0x0837bfc23e39b243
	.align 0x20000
	.data
data_start_5:

	.xword	0x73985ed8871da189
	.xword	0xc6c4a5a69d452481
	.xword	0x4e556295a5bd5e9c
	.xword	0x2d9153708ccad61b
	.xword	0x7fac28bc2f128b4b
	.xword	0x53c42a2edc1b9911
	.xword	0x0175b493e976811b
	.xword	0x5feb0c4a3304a709
	.xword	0x1dc7629d6a2a4403
	.xword	0xe3e92a9329943cc0
	.xword	0xcf16e0939739e784
	.xword	0xfea2587f5ea30c46
	.xword	0xd74f8ba326c4c223
	.xword	0x63aa347a37df773c
	.xword	0xafbca806a189fccc
	.xword	0xebf505941287f308
	.xword	0x7a499d72314b5fb4
	.xword	0xc1dfc5b31caa8e65
	.xword	0xb7f84fcd4fa5aa09
	.xword	0xc8f90937036a34dd
	.xword	0x98781aefba03f9c5
	.xword	0x157307032e314d28
	.xword	0xb747f5f7e9177532
	.xword	0x4eb2272cb8b98192
	.xword	0xea91884f14839b1e
	.xword	0xd85026fca70310a2
	.xword	0x17282e0107d99d0d
	.xword	0x5bf45fb40af5edb0
	.xword	0x1c65e9cb008911e0
	.xword	0x91f8d38bbdab0047
	.xword	0xeff66890e22da7fd
	.xword	0x3ac11c88ea4402c4
	.xword	0xc5a7bba3a5e311a4
	.xword	0x7c9c313d2cefde9f
	.xword	0x2fcea71d6b9baed1
	.xword	0xab402ed83f241648
	.xword	0xd32cfbd4e01ddd90
	.xword	0xbca78f9905610fef
	.xword	0x5444ac4024934b4c
	.xword	0xf2f38a21ab22b8db
	.xword	0xb79cfb21eaa6c46a
	.xword	0x1fc71e4c9e832286
	.xword	0x13b8f1f24ecd0d79
	.xword	0xf11126d1e6f19896
	.xword	0xc489209387de2c18
	.xword	0xc0b149bafe3eb66a
	.xword	0x3f81b410b5d53994
	.xword	0x7c722aec28e6e83c
	.xword	0x58df55d7c516efd7
	.xword	0xf716ff355783bf54
	.xword	0x0aca2cab42a4a6c8
	.xword	0x70600093020aee2c
	.xword	0xecd01f3a44b2fe47
	.xword	0x2a46d9387b5967f8
	.xword	0x86192cfd397e473a
	.xword	0x54192b9f2081ebb7
	.xword	0xd4f945c4378f8a07
	.xword	0x267d0908b9782332
	.xword	0x322c8706849d322c
	.xword	0x544f29b617ddeefc
	.xword	0xdb1f226c6ebd5a3a
	.xword	0x1b528a7a4a86dcf2
	.xword	0xcdff6f10719af3a5
	.xword	0xe568d09d0e6df408
	.xword	0xf17df9b3b9c856ff
	.xword	0x1569b83d37dc6776
	.xword	0x66297e634b3a79b0
	.xword	0xd840c3f483bc5e56
	.xword	0x3916a95c67d8588b
	.xword	0x2661e00269764b9a
	.xword	0x00989e357eb79b3d
	.xword	0xed0a6a7ce5ac404c
	.xword	0xede5c42b7ef68388
	.xword	0xe1abbcef6f7513f6
	.xword	0x5014ead1832d96a7
	.xword	0x57855caa70813bb7
	.xword	0x03fa3bc7756ec575
	.xword	0x8c306bee57478f96
	.xword	0x6d321f2ffd23206b
	.xword	0x0e0bb1620147cf68
	.xword	0xf81eb71a28c875f1
	.xword	0x4c80c0c5536a91f1
	.xword	0xe2ed0707a8726f00
	.xword	0xdbe988c8f019591c
	.xword	0xc7598453fdc8072d
	.xword	0xd4b1da3eff0ec251
	.xword	0x0438c01b23688bd5
	.xword	0x38aa1630933c8a28
	.xword	0xbbd7ab309cae2e56
	.xword	0xb3e523602e27ef62
	.xword	0xcac9885f4828d56d
	.xword	0xd7841e88c4f3e449
	.xword	0xeede71f52198a4d8
	.xword	0xfa61c5fc5a3f0771
	.xword	0x41b7a616c2a758bc
	.xword	0xa5d460f2ff607b50
	.xword	0x3ba1ae707badf86f
	.xword	0x02f9da4719bf8ec3
	.xword	0xfb64332088ae2cda
	.xword	0x9a0fc8a739e5faab
	.xword	0xa27e32428f5b73b6
	.xword	0x31d28024e58f3f4a
	.xword	0x70eb401c6b4883c6
	.xword	0x38b7e0bf08280dce
	.xword	0x468dc26c6d57d6be
	.xword	0x5631e2e84ce92526
	.xword	0xdea0472b6c9fbb80
	.xword	0xa961100b86194c84
	.xword	0x982b28a63d3beaff
	.xword	0x7abb70cf109d76c5
	.xword	0x6a3b9f268bdc88ba
	.xword	0x5c6e4dd03751152a
	.xword	0x64880a27a3508f23
	.xword	0x24abfe7d7ab8a6e7
	.xword	0x91aca10bc11f95c9
	.xword	0x2249078ed69ff12d
	.xword	0x5a228fd0a043f5c1
	.xword	0x8cac8cbb0a171b26
	.xword	0x5fdfd9d4e62a3dd1
	.xword	0xe77d384d481aabd9
	.xword	0xc28881ad8284e610
	.xword	0xac4e14dbcd712826
	.xword	0x5dfb8a421461ed75
	.xword	0xd0949df2e3e07040
	.xword	0xa3275d11b40bf5fd
	.xword	0xfb06438dc8685994
	.xword	0xfd2fedf92587b1aa
	.xword	0x82014991d7cc0e23
	.xword	0x3555525a72693d18
	.xword	0x62e0ae84a86df7f4
	.xword	0x599ea763e3f50dc6
	.xword	0x1c9c73c6efa2bd24
	.xword	0xcfac7492cb1ee2ba
	.xword	0x01c8ae286f147a56
	.xword	0x0c4e5438a5fd1f1c
	.xword	0x3968023278bc1767
	.xword	0x73b618c897b952a3
	.xword	0xaee61f22895a43d9
	.xword	0xd6cae5c32400ac37
	.xword	0xb0384d72976b022b
	.xword	0xe907d72ab70a570a
	.xword	0x38eb9ea27d883323
	.xword	0x73ac74fb965e64d6
	.xword	0xf6003d778469ea6d
	.xword	0x22a38136146a50d6
	.xword	0x607f5ea21bb30352
	.xword	0x0fef85482ae049b9
	.xword	0x27f760669f8b7dc3
	.xword	0x2606ad421d5c184d
	.xword	0xe92f2b05d6473c4f
	.xword	0x1eeb0d8f9d03c06a
	.xword	0x8bee854a584ef124
	.xword	0x8fd458c81e555ae9
	.xword	0x353c721ab7183169
	.xword	0x796bbf8cbb464615
	.xword	0x6e70e5a3f097040b
	.xword	0x367aef1bcaa33b94
	.xword	0x59947150de2b6582
	.xword	0xff4b449ff934ca81
	.xword	0xb0d83b255093a736
	.xword	0x1b8d9fda64ff10a8
	.xword	0xf4246189b25c3276
	.xword	0xcaa5295ebf4b680d
	.xword	0x0c0ef5e090c815a0
	.xword	0x035e1e024cf6b0f8
	.xword	0x10b2a70148ec9567
	.xword	0xe901ee4395a6f36e
	.xword	0x42c3293f3a007810
	.xword	0x25a9cbce4dd44944
	.xword	0xb239ecb4220fc96d
	.xword	0xfc702383a7377e5a
	.xword	0xbdcef450fff89ca5
	.xword	0x128a7ac56e664c94
	.xword	0xcd9d67a8b230e752
	.xword	0x5aa2249a576704b5
	.xword	0x7728e6cdc8853d5e
	.xword	0x76a4f04a2cfac64f
	.xword	0x1bf719d6b83d8b85
	.xword	0xf0713c0d70f12b41
	.xword	0xe577de4205c94deb
	.xword	0xac2812792224b8b5
	.xword	0x13eaa4fc5c6d4ee7
	.xword	0x2d2e468ec574bf7b
	.xword	0xd6c68207b4929e78
	.xword	0x2c9958f425a9f7ef
	.xword	0xdd1c6595634ae3cc
	.xword	0x0b3efd587808fd1f
	.xword	0x9524e45ef99f90b3
	.xword	0xa0203bb7ccc98330
	.xword	0xbe5bccefc88127bb
	.xword	0x97aa276513148860
	.xword	0xd914963ad96c40c9
	.xword	0x2d2ea2e06fcf7234
	.xword	0x9ab26ccef0d05a7a
	.xword	0xbee8b703a6f5b35b
	.xword	0xc4e1c8a705f06794
	.xword	0x613b7d65f3f66d1f
	.xword	0x6d96042fe8cb6db0
	.xword	0xb90fbd3fa17e522a
	.xword	0x7827979b08cdfe3a
	.xword	0x73937d9ba9affb9b
	.xword	0x9077f79d5347cc9f
	.xword	0xdf08127dcd859450
	.xword	0xb37d7ac7dcc6c1e7
	.xword	0x75d480fcf06d653c
	.xword	0x713e39dede54b427
	.xword	0x881ae7ba576c8fbc
	.xword	0x37936a51803ef934
	.xword	0xb5aa3a3ecf113e52
	.xword	0x9a1a9735acd0f43e
	.xword	0xbf3ca8e79aad534d
	.xword	0x82529cada6036904
	.xword	0x4b16a2631b835fef
	.xword	0xe793169be9576eda
	.xword	0x2a433ce713f2f1cc
	.xword	0x2069208d3ef03684
	.xword	0x1fb4832d6a34c667
	.xword	0x23b1cba556a59619
	.xword	0x21459d0d4dec628e
	.xword	0xc208513505530043
	.xword	0xf04bc60316ef5177
	.xword	0xde6e72a8005a254e
	.xword	0xf6c88dc7efe4ba89
	.xword	0x5c93b9fd87a49231
	.xword	0x6d5269b18c69d775
	.xword	0x6df71fa6a7ad8aca
	.xword	0x88c46819e9f1ae6f
	.xword	0x7701ced11d40b5ab
	.xword	0x17040b3a25c2b861
	.xword	0x2718b23ab7b61088
	.xword	0x4accd8a1a3f39f3a
	.xword	0x4dfc7a496a855157
	.xword	0x63ffc70bb9d48f23
	.xword	0x1ab52fafc7121eb5
	.xword	0xeba959237bf89f4d
	.xword	0x0d87614b6d3fb955
	.xword	0x64e0ecd2c14b2f17
	.xword	0xc06bc81b4ba1f3a4
	.xword	0x9df254149e3bd601
	.xword	0xb4ccddaa324909b8
	.xword	0xca0e9f55586c838b
	.xword	0xb902f6b4253ac93e
	.xword	0x562fe928dca52037
	.xword	0xa64842221a0a7618
	.xword	0xd785b7da68f68b2c
	.xword	0x6fc5f9dc3581af65
	.xword	0x9a7822101ac5d9e9
	.xword	0x7b824a4c7671890d
	.xword	0xe5f41acb5d12db0d
	.xword	0x033c1acb5c8d2b21
	.xword	0xe8589ac22bc24593
	.xword	0xc8b2420ea6c46474
	.xword	0x97625c8c1f273829
	.xword	0x740ba29c98ac3f81
	.xword	0xbc89f2ecd0521c0b
	.xword	0xc5e8c1e4262747f3
	.align 0x40000
	.data
data_start_6:

	.xword	0xa5f63a02bf145467
	.xword	0x0c2b5dc1c2729bb6
	.xword	0x0e56c4fe53dd58d2
	.xword	0x71c87290841da43b
	.xword	0x48ecb3645ed65010
	.xword	0x11c99c1c2b003ef6
	.xword	0xfacfb25dc71ba4b5
	.xword	0x92cdc4fa0167e03f
	.xword	0x13d77d3e580805e6
	.xword	0x45cc283567e2f0a8
	.xword	0x41043062e07f8b00
	.xword	0x73905ec000ca5fb8
	.xword	0x0793fe115d168d13
	.xword	0x1eaac87eb05d2b2a
	.xword	0x9f30b9e15507117c
	.xword	0xd98f601406f33d6f
	.xword	0x59d8eba05ffe7f93
	.xword	0x8803e236b3d08c95
	.xword	0x65ecd1c0d3353e3a
	.xword	0xda0e35433db21b95
	.xword	0xe05189e7619d6f33
	.xword	0x6c08ef50da7caca7
	.xword	0x87cce312277c8777
	.xword	0x05f420f19680a3d9
	.xword	0xe49864a0acde3cf4
	.xword	0x255905302a8a0517
	.xword	0xdb3d370904b7f838
	.xword	0x421bf15e5d2cb910
	.xword	0x4adeaeb7ef8fe681
	.xword	0xdb48a5e7098338d9
	.xword	0x98756966d8a10a3a
	.xword	0x24cc881630a85dee
	.xword	0x4b41689f64629bdd
	.xword	0x54ac1808c842c6ef
	.xword	0x736ebf6cc7cc7649
	.xword	0x28b29dd3902867f0
	.xword	0x21776469fdc833a8
	.xword	0x9b644e1c81e88937
	.xword	0x16a58347905c4f69
	.xword	0xd7be779274cfbafb
	.xword	0xcbd44da8d8b0e7f0
	.xword	0x46d91f5fa8ab6cde
	.xword	0xe52ea4903b1cfb0f
	.xword	0xbfb24b4418062ee6
	.xword	0xa9b3da13b7162463
	.xword	0x10914dd97334f83c
	.xword	0xaa41395e4169802c
	.xword	0x0bcd4f733fb3af13
	.xword	0xee4e9c69b48fd560
	.xword	0x384f55bdb3b0f652
	.xword	0x83468a3ffd8624b5
	.xword	0x0cc5484229f7d69f
	.xword	0xcee60078ddefa108
	.xword	0x1e50a2613e739104
	.xword	0x1d2eff711dec9572
	.xword	0xedb427631f3e9bc9
	.xword	0xfe83344a7d6a743a
	.xword	0x1e776b7e52576f65
	.xword	0xc3ecc4abb4598942
	.xword	0xd355ee313ce080a4
	.xword	0x176012f4c331a3b4
	.xword	0x1b86f90729d1671b
	.xword	0x56ed8017c9ea14bc
	.xword	0x9e624a048012120d
	.xword	0x6e4392d378600be5
	.xword	0x8d5a26146d5a2c08
	.xword	0x3615434e75ce92d8
	.xword	0xf2d3ff89389e7865
	.xword	0x6551c60955968358
	.xword	0x2d60099f55f1fad6
	.xword	0xf7d716197006d01f
	.xword	0xc564e2d4d94d3ade
	.xword	0xcf820925a73a3f6e
	.xword	0xda2d9224f6935a85
	.xword	0x87e75043ab3803a1
	.xword	0x980930c374dc6df4
	.xword	0xd7badea57db294fa
	.xword	0xe48217ae33a27ddb
	.xword	0x9fc0900ce06cd0eb
	.xword	0x7697c3123c476fd1
	.xword	0xd9fe4d0d641b526a
	.xword	0xa458bb3994ce2cc3
	.xword	0x0a6a6699adbfe100
	.xword	0xe18f2e9bbd32420b
	.xword	0xefc5916d6539a077
	.xword	0xf17dbcdffb04888d
	.xword	0xcf4c29eed478e640
	.xword	0x0ab834e13c8ef30e
	.xword	0x89d3c06db818399f
	.xword	0x3891ce9044c80c11
	.xword	0x9d9006e8be046dfa
	.xword	0x67e041117071c34c
	.xword	0x4b371bba3be78ca9
	.xword	0x55b586491c3515b4
	.xword	0x0aa90bb8f98a69c5
	.xword	0xcc764e004baea3e0
	.xword	0xcdc5aed83a8a295b
	.xword	0x839c33135243bcf8
	.xword	0x007b2d859d689766
	.xword	0x5ea12e8058cafc75
	.xword	0x46edb3f827c1006b
	.xword	0xf2707e4f33317db4
	.xword	0x263bc8bbfd4c2a3b
	.xword	0x79661c3333985736
	.xword	0x1852046f89d6cbf5
	.xword	0x324e39604074b37e
	.xword	0xc5253abad59280a4
	.xword	0x807b33c928f7c89f
	.xword	0x10f820081681000a
	.xword	0x8552c370164ca23d
	.xword	0x8905f208da05c2f3
	.xword	0xe5c8231be54a2722
	.xword	0xbf857f27711a66cf
	.xword	0xf30a2698974e2261
	.xword	0x6b410c9e0421c219
	.xword	0xee47433f29fd847b
	.xword	0x8b62f74e11af851e
	.xword	0xbabf9504bcb671a2
	.xword	0x7d859a621354d5bf
	.xword	0xc383c6f07d9136a2
	.xword	0xdf0632349dcc16e9
	.xword	0x34092476bdc3ab30
	.xword	0x906f6c9913dd1d6a
	.xword	0x8978a80008a67c60
	.xword	0x16d5d55835e6e532
	.xword	0xe999f73cb24058a7
	.xword	0xe109458cf8c8450e
	.xword	0xfc8551f6d8ea0dc8
	.xword	0x900b93115370fa1f
	.xword	0x680305741624052f
	.xword	0x89b4303484f67797
	.xword	0x163fdf4f6b33e537
	.xword	0x9203f5374014a7b1
	.xword	0xb787fcab4cfb6efc
	.xword	0x535ac9e1051d330f
	.xword	0xe544a3018f9fb59c
	.xword	0xc1c9ef1410d43c0b
	.xword	0x5792a9f44e77b7e5
	.xword	0x574914cc86bfc6e6
	.xword	0xae7946e9c5496aff
	.xword	0xf5a4f631b6306fcd
	.xword	0x9ee34c637ad24596
	.xword	0xb25d073c822f3731
	.xword	0xdd9e0a5f38c6d4af
	.xword	0x88fbc007c965af8f
	.xword	0x1025134bf4022f52
	.xword	0x84463f4a19f06ccd
	.xword	0x34cb9e3819976968
	.xword	0x46c81c858bd2d31e
	.xword	0xa9268da3fde6f1d9
	.xword	0x459737b2347cba41
	.xword	0x952f2c22afda1769
	.xword	0x19efc4f730c9e7ce
	.xword	0x6700047c1b6065e4
	.xword	0x8bb550212f6df51c
	.xword	0xffeddd3082b2f243
	.xword	0x012380bd8c02af70
	.xword	0x1e3e5e3bd61d2502
	.xword	0x17a4dba3fda347f5
	.xword	0x1b5065dc0467f439
	.xword	0xe016c922b1714fc6
	.xword	0xbea680a948c4d3b0
	.xword	0xcd47d077760944f1
	.xword	0x2566360a3c92f256
	.xword	0x0bf6c8cc741261ad
	.xword	0x50a14fec65ce197c
	.xword	0xe4eeb13cf970bbcb
	.xword	0x93e1b6e175befbaf
	.xword	0xdcd03060f2ba99a5
	.xword	0x77ffbdefccd9cdca
	.xword	0x13aec0493c356c7d
	.xword	0x8ae177236236bb26
	.xword	0x704ab89ecad3b383
	.xword	0x9748c766240397a3
	.xword	0x9dcc2325b0a46f67
	.xword	0x1e6147439dd59e9f
	.xword	0x241cf71d17a8b323
	.xword	0x46fa2a8ce63261ec
	.xword	0x9d6eb1f5d0234dfb
	.xword	0x53c0ef079a2eed35
	.xword	0x7f3068b4dfb11f51
	.xword	0xd03aa27fd6f9fe35
	.xword	0x0d1174fab882bd1a
	.xword	0x33fcb84bb851e61e
	.xword	0xe94bcf3f705585e4
	.xword	0xa689d423d8df0863
	.xword	0xc36bf91ec690b894
	.xword	0xbcb6348454648d05
	.xword	0x668963afc91b9798
	.xword	0x67e19d23a9286648
	.xword	0x80806eeaf3a04a53
	.xword	0xb3f299d3ea6e2019
	.xword	0xe7a4345dca587810
	.xword	0x5e647f478a4ef4da
	.xword	0xabfbd7531310dc5b
	.xword	0xb4b9621746c6f89a
	.xword	0x1ce192f945f06393
	.xword	0x12828bba40d77ed5
	.xword	0x65f0ae698f544966
	.xword	0x8c2958fe2c2a2b73
	.xword	0x54be62ebdd927c4f
	.xword	0xce36d16c61bc7824
	.xword	0xe949489149aa1687
	.xword	0x31d0483c599015b5
	.xword	0x8e46e4a56d15a1bc
	.xword	0xfe0d1e1510e47eb5
	.xword	0xb22bed542b5ee094
	.xword	0x9119cca7281070fb
	.xword	0xbc2bdb618e67ec1a
	.xword	0x170ced7e8f798527
	.xword	0x3afe95c7266fdfe2
	.xword	0x71c099058cc4887f
	.xword	0x2d568c5c7fd924d8
	.xword	0x1b75587674e61e9d
	.xword	0xa5615349c7b16b38
	.xword	0x502fa650e9ce9840
	.xword	0xdb91a2fdc7f77ed9
	.xword	0x0a43878f55872ecd
	.xword	0x6707b02c6e8f7557
	.xword	0x439437619256924e
	.xword	0x367a06ec63182f8e
	.xword	0x4a0e2f2fd3b22ec3
	.xword	0x2379d8018fc9383c
	.xword	0x4824b08097ae9198
	.xword	0x10d6deca6b2f74f4
	.xword	0x9fd647bb11530e5b
	.xword	0x16e9664f9d3be687
	.xword	0xda26b01b24c9af08
	.xword	0x6e1587af0c966ac6
	.xword	0x1f251641df0b6564
	.xword	0x74c245b500462b24
	.xword	0xb217e86b5c4419e9
	.xword	0xc7bc483261de4da0
	.xword	0x74e42313101ef925
	.xword	0xe1788016f4879cf2
	.xword	0xf4d2e381fa200d76
	.xword	0x46ec52a49c538806
	.xword	0xa6016ae9348e3e05
	.xword	0x9fa5216cd23bfdae
	.xword	0x4305a08fa088efb9
	.xword	0xb772a47166b62a55
	.xword	0xf8ddda2e9101b382
	.xword	0x271a3ded4d30df10
	.xword	0xe489c45c6e665bb8
	.xword	0x878f2e658485363d
	.xword	0xc1a6902bd0cb2efe
	.xword	0x3474747e463826a0
	.xword	0x05c43f182e9e411a
	.xword	0x9a111f4a54605d9d
	.xword	0x18709a5b5627ef4e
	.xword	0x715136c645629463
	.xword	0x2b5c7ef9e7c23f76
	.xword	0x6c5408529770258f
	.xword	0x8d08d2f24fe5e2c5
	.xword	0xd27e9386d46e1042
	.xword	0x57c9fabce09f65dc
	.align 0x80000
	.data
data_start_7:

	.xword	0x247d2484e968717f
	.xword	0xf5f2ed17c98d5d28
	.xword	0x0647937be4671c93
	.xword	0x7d7fbbb2ad20e55a
	.xword	0xd729dd75211bb233
	.xword	0xd00a22487f9aec15
	.xword	0xb09dd80e5b4a9e65
	.xword	0x10b6aa77d3433462
	.xword	0x870d50149f878738
	.xword	0xb945e5b2f9004848
	.xword	0x81927c2defc4e877
	.xword	0x2f27fd7e872af4d7
	.xword	0xf2eb428eb4441ef9
	.xword	0x6d2bbbbb05787a7a
	.xword	0xcab8d2eefc2e889a
	.xword	0x9a58a9ccd1362a4b
	.xword	0xe5a5a1e641645471
	.xword	0x627e9940cf5d2a99
	.xword	0xd46cf4aa34ec42b1
	.xword	0xd2d7e9cb1607a91c
	.xword	0x04bf63c5ed5d3764
	.xword	0x02753f3f02aa383c
	.xword	0x969a75badae92bb8
	.xword	0xa1b62fd68ef33fde
	.xword	0x990444f486e25194
	.xword	0xccfc2f52b746e451
	.xword	0x8055246f523bf317
	.xword	0x272bf49f6ed3d92f
	.xword	0xd8c6e6a61d68d285
	.xword	0xbd7f00b7dabd0ff9
	.xword	0x7ddeddf8e59a82b9
	.xword	0x3c349713ffdd6b5e
	.xword	0xf898e1ad6d6fd86e
	.xword	0xdcf9ac022f0eb4d4
	.xword	0x80b393b183830cf3
	.xword	0x331f345888a7008a
	.xword	0x357edde59f37e761
	.xword	0x0831da2d6ddeb4fe
	.xword	0x40530c2205ac99e1
	.xword	0x1c20a8c09a70deba
	.xword	0xc567ff1186ff587a
	.xword	0x2815d4d93cf67689
	.xword	0xa22e572a8cfc9cec
	.xword	0x27768c6e9bd9e127
	.xword	0x900fb1129dd28514
	.xword	0x1318658a43bb187e
	.xword	0x3ca6cfc412bd374a
	.xword	0x2218c889e7b27670
	.xword	0x13a8b71e310ec20f
	.xword	0xfb44ad128b803dfe
	.xword	0x1538a3cbc8520fd6
	.xword	0x55735cd3e92f0e50
	.xword	0x929dc46b9b4f5c82
	.xword	0x8bb4bd5a01b3a15f
	.xword	0x9a8b2720756f944b
	.xword	0xa18e72a87cdc0a6d
	.xword	0xd62ab23d545b1f86
	.xword	0xd0012d09a759bda9
	.xword	0xe73e813e78c0ab2e
	.xword	0x9c9206ba3974158d
	.xword	0x4d70648caf222c15
	.xword	0x43680101e79d3a2e
	.xword	0xf7cf4ada62304c5f
	.xword	0x0d4c85d86c0f931f
	.xword	0x579c236252abd33c
	.xword	0x3c4179d355d6c55e
	.xword	0xce901728a1a24195
	.xword	0x51e6207f291e741d
	.xword	0xf0b02f703220a165
	.xword	0xa9552f955f2ea780
	.xword	0xb869304234741ccd
	.xword	0xd28af0cb1d0098aa
	.xword	0xaa9545fd8b649fd1
	.xword	0x2e64f24596ff2602
	.xword	0xc188f518600b846a
	.xword	0x2d009ee13a566066
	.xword	0x9dafecd980cf405d
	.xword	0xfb20a614c1901667
	.xword	0xb95ad68ba03da68d
	.xword	0x5cad6d53d1a150c8
	.xword	0x3941b82b53ed2bec
	.xword	0x817615c7403108af
	.xword	0x48f809de9f1cfbab
	.xword	0xf0b9b7577aafb64e
	.xword	0x6a96d50d72a0e613
	.xword	0x9f69504f453bc6e5
	.xword	0x5f0a7e0c9416c0ce
	.xword	0x47f96da9ff089cac
	.xword	0x2d8469e6249e5fc5
	.xword	0x748f9ab95ad15b38
	.xword	0x3a8adf48475b3e73
	.xword	0xbce3bdca299768e4
	.xword	0x781256ece6939053
	.xword	0x85cb1b73127a0f62
	.xword	0x9761f885be76f421
	.xword	0xdbec9c6de2219718
	.xword	0x7eee9ee9c2f7f283
	.xword	0x7ada365286dd17ea
	.xword	0x2f90c97c366811e9
	.xword	0x85deab12ef5e3e11
	.xword	0x075eeab80a882f53
	.xword	0x5c099b28c619b321
	.xword	0xa987446641a5efe6
	.xword	0x4dd8a0be017f676c
	.xword	0x9fbb1aa10561756b
	.xword	0xcd2e62a98f13be99
	.xword	0x4147487ac5b5004f
	.xword	0xa09ce589e778d04e
	.xword	0xfc8f07174f2a8516
	.xword	0x87f3331c41f4675b
	.xword	0x2ce42b63af946f60
	.xword	0x43c6de140d1bdb37
	.xword	0x1f64ca994d38bae4
	.xword	0x4da3add376a1ce05
	.xword	0x7bc24e19dfbdce86
	.xword	0xb88a273fa49897b6
	.xword	0x56ca41e7be4c7b42
	.xword	0x8d3d5a007ecb0399
	.xword	0x7f54bb2a98c54150
	.xword	0xc19d93fd34dfa653
	.xword	0x11a3d2555d0632f5
	.xword	0x8e844723d2164498
	.xword	0x41e7100f519ac62f
	.xword	0x60955b9157d95f60
	.xword	0x960b7c4d8f77d961
	.xword	0xccdda852abd70774
	.xword	0x79ec05bd5ff60dfc
	.xword	0xf9f2a2359ea1ec87
	.xword	0xbc4470cbfa8fe9e6
	.xword	0x35c879cf51acbb4b
	.xword	0x43730ef3b394c48a
	.xword	0xc4a6f39ca1406519
	.xword	0x1d26bbb98e07bc47
	.xword	0xcb14b8536dd4dc95
	.xword	0xd0e521643cb965e4
	.xword	0x8d189daf2285e653
	.xword	0xb8cb33f9ce443a31
	.xword	0x538ba51c2c9cec6c
	.xword	0x4d5d4b015e512ad0
	.xword	0x4d0a4585b0d3c105
	.xword	0xa4e0d4c4b484136f
	.xword	0x83a05a8bb9b86657
	.xword	0xe8b56c80869e6a94
	.xword	0xfe53ebe46b79f070
	.xword	0xcf6099c7f9604326
	.xword	0xa09372454e18a2bf
	.xword	0xa0d809412a88abf3
	.xword	0x5602e571fb1d7813
	.xword	0x971b17c708679508
	.xword	0x835c4d81ab1def71
	.xword	0xb08f42ba30d6b369
	.xword	0x99660f4e5346794f
	.xword	0x2b2ebb6758c82e98
	.xword	0x7b35823f5ff6504d
	.xword	0xf0a9fc69c0c52ff8
	.xword	0x0227d5d6ae295e19
	.xword	0x9de292edeccca88b
	.xword	0xb9b98748e57fdd90
	.xword	0xbba61f60ca896c2a
	.xword	0x65028c1de176fbdb
	.xword	0x41ffa2b374475de7
	.xword	0x9828cf7656cab6ce
	.xword	0x8c5926e6625dc0ad
	.xword	0x37f7f7481265bf47
	.xword	0xb392e16de5adb65a
	.xword	0x9deb093d7e876f62
	.xword	0xeeb4c497de0ff3eb
	.xword	0x704d470f064753c3
	.xword	0x0262d1f7b1be54b4
	.xword	0x464046facf48fb2e
	.xword	0x248b13a77a7ee942
	.xword	0x098073e9374657a8
	.xword	0x1a8633e8f00d55ac
	.xword	0x95fed83f80796b8b
	.xword	0x6d82933655b2d567
	.xword	0xee458b724b43867f
	.xword	0x5cd7c29626359913
	.xword	0x5fc8b22d6ef6b9da
	.xword	0xf092e85957153e50
	.xword	0x72551bcf0a39d8f4
	.xword	0xb24c81e253791124
	.xword	0xcb6c3557ee617027
	.xword	0xe66a4791fedad1a7
	.xword	0xe4e12f05f59a97d6
	.xword	0x898240baae8e4172
	.xword	0xe9d6eaf7dbf8103f
	.xword	0x9e1862940c14ef1d
	.xword	0xa920dca6af1c13fd
	.xword	0x6f28057c2f5bab86
	.xword	0x52667f94920c2820
	.xword	0x8418c0ae59a41f47
	.xword	0xa0ea2c58dda5ebfb
	.xword	0xf9636f44e1721efd
	.xword	0x9b07dce6431bd5ec
	.xword	0x7f7263b8837d21a4
	.xword	0xdf6cd98274638b5a
	.xword	0x32ff77d0608d96e1
	.xword	0xcf1a84b70860aab9
	.xword	0xc205530e5bb3ecf0
	.xword	0xa853816d7231ef5d
	.xword	0x856c83c47ade495c
	.xword	0x30f717ea828ececc
	.xword	0x09e1cbad9934fdb6
	.xword	0x29b44d153a231b1d
	.xword	0x344eb18930399a7c
	.xword	0x6673be144782acf6
	.xword	0xdae12f587ce11c56
	.xword	0x261e322cf00394a4
	.xword	0x0a05fb08e7696abf
	.xword	0x904648076aa241a9
	.xword	0xab0a5073c79155b6
	.xword	0x92b55d4f234a3b8f
	.xword	0x85abcf27e4e6e0a5
	.xword	0xe5c604e5fafc7eca
	.xword	0x288e4292c22b44b8
	.xword	0xd63508f0b7ada941
	.xword	0x8d18831dae378599
	.xword	0x067b0b3027328caf
	.xword	0xecb175439ec10d3d
	.xword	0x3b92101abfc007a7
	.xword	0xf68f413d38169ed3
	.xword	0xadbdd7474462cef4
	.xword	0x88b3372ed3a0c9e7
	.xword	0xc8390b1ffd6d747d
	.xword	0xefeaed2c26bdf983
	.xword	0x35803817cc5bc6c1
	.xword	0x640d38b6d02abfab
	.xword	0x97a8b62dd63ac17c
	.xword	0xd15af5ec07aae56c
	.xword	0xab29638035fe4487
	.xword	0xae81b43db393c5ce
	.xword	0xe7726bfe4e7f0f46
	.xword	0x5b51d38d43ba5e76
	.xword	0xcf264654a0505f9e
	.xword	0x68b7541d594e175c
	.xword	0xb0d6649865387364
	.xword	0x0ac4315c0ce48f5d
	.xword	0x3cc2c0ba5ebeb92e
	.xword	0x6eaef232fe61bdc1
	.xword	0xb0c12c5802740d22
	.xword	0x1c8def3a10c9e326
	.xword	0x2f30d00ca7f24363
	.xword	0x9ed1cbc1368a53ff
	.xword	0xc643570a4b745340
	.xword	0x822fce1dc6cbae63
	.xword	0xebed4be6abddec23
	.xword	0xdc6a4ab23b658714
	.xword	0x144d351f2fd585e1
	.xword	0x35fc211db662642a
	.xword	0x5179fb3100ebd091
	.xword	0x75005f2cffd2f024
	.xword	0xbba51d1564e44d6a
	.xword	0xd35a71de7d800a33
	.xword	0x8d8b8eec9e186177
	.xword	0x658d5310106c1c69
	.xword	0x2034f45e8f2aeaaf



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
