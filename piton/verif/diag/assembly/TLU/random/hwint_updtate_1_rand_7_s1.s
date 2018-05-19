// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_7_s1.s
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
   random seed:	440661417
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

	setx 0xe16cb64df39d6b12, %g1, %g0
	setx 0x2de24b6f05782266, %g1, %g1
	setx 0x1150a1ff6026274c, %g1, %g2
	setx 0x89c7a0b6d9775b18, %g1, %g3
	setx 0x3c082618cdb1b781, %g1, %g4
	setx 0x4f7167c9851af24a, %g1, %g5
	setx 0x06edabdde13dd088, %g1, %g6
	setx 0xf5f049000530f4d1, %g1, %g7
	setx 0x35411fd9e63bc8f1, %g1, %r16
	setx 0x448e18b05df59241, %g1, %r17
	setx 0x5c2f097f173efb41, %g1, %r18
	setx 0x5251be5d42691382, %g1, %r19
	setx 0x5b683fdb65636d34, %g1, %r20
	setx 0xb3c6bbb33fe9871c, %g1, %r21
	setx 0xa4a45a5721e4aa18, %g1, %r22
	setx 0xc9b644dcab34f271, %g1, %r23
	setx 0x1b64909b558dc36c, %g1, %r24
	setx 0xb0bc1c717aade5f5, %g1, %r25
	setx 0xef0f8253c18479d3, %g1, %r26
	setx 0x9edad62531e229ce, %g1, %r27
	setx 0x8fd71b2673126bdd, %g1, %r28
	setx 0x8d39256fbe102aeb, %g1, %r29
	setx 0x0c01561c0f07f58e, %g1, %r30
	setx 0x216ae6a99a7034e7, %g1, %r31
	save
	setx 0x2f7a354c2bf6ac93, %g1, %r16
	setx 0x8b1ca4293c92af93, %g1, %r17
	setx 0xd8e2c22bd379ebc6, %g1, %r18
	setx 0x03ea9d4e632483d0, %g1, %r19
	setx 0x3d726f6ead7582db, %g1, %r20
	setx 0x84e10218886c513c, %g1, %r21
	setx 0xda29fb98ec39e1b3, %g1, %r22
	setx 0x7b06082269d5716f, %g1, %r23
	setx 0xcbb520db2ac2527d, %g1, %r24
	setx 0xceb0be90fb71a003, %g1, %r25
	setx 0xbf00eccd1b1defb6, %g1, %r26
	setx 0x7b1d7b8e43c7bb05, %g1, %r27
	setx 0x8b868cfb3ade9bb5, %g1, %r28
	setx 0xebb5bf8a941b897c, %g1, %r29
	setx 0x1c625fe351ea0d6b, %g1, %r30
	setx 0xcdf3f18c29042abc, %g1, %r31
	save
	setx 0xd2c9b2f473c38ec4, %g1, %r16
	setx 0xf723f2b9f7105cef, %g1, %r17
	setx 0xc17e645037504db8, %g1, %r18
	setx 0xf700a151c7702d73, %g1, %r19
	setx 0xc65e0343d1e8ece2, %g1, %r20
	setx 0xe75c396b60adcfef, %g1, %r21
	setx 0xcb7251f87888f99b, %g1, %r22
	setx 0x5ee85315a250b0c1, %g1, %r23
	setx 0xeea0eefb2d2c3514, %g1, %r24
	setx 0xae1be5829b1771e3, %g1, %r25
	setx 0xd5f3859debb47df8, %g1, %r26
	setx 0x50fe18a4bc10a220, %g1, %r27
	setx 0xdd57587886bb51de, %g1, %r28
	setx 0x553d487b31b79de6, %g1, %r29
	setx 0xc02168dde3fccf1a, %g1, %r30
	setx 0x9ebad27c27797bfd, %g1, %r31
	save
	setx 0xd19587f4b4f54b33, %g1, %r16
	setx 0x19014c830cd39ea7, %g1, %r17
	setx 0x0facd77a9488d9d6, %g1, %r18
	setx 0xbaab0e8f0c9f74ce, %g1, %r19
	setx 0x6483a62f1f1f050d, %g1, %r20
	setx 0xa24fb3f07223a9d9, %g1, %r21
	setx 0xceb37c7e0d225a80, %g1, %r22
	setx 0x2d3ca3e6b9dbf0d0, %g1, %r23
	setx 0xa1ce10b50ab52fb8, %g1, %r24
	setx 0x630a610ae7f6adeb, %g1, %r25
	setx 0x121af2b978ff95b7, %g1, %r26
	setx 0xab56a9f21420e952, %g1, %r27
	setx 0xc30c9d8d0dba0cdd, %g1, %r28
	setx 0x775854c3c22777d2, %g1, %r29
	setx 0xc381429799183b58, %g1, %r30
	setx 0x95462c127bd20c28, %g1, %r31
	save
	setx 0xcf31f38dbafe6b3e, %g1, %r16
	setx 0x513587822fc7a275, %g1, %r17
	setx 0xc5a258971df2f9e0, %g1, %r18
	setx 0xae2c4abf430e2323, %g1, %r19
	setx 0xa10e081f10cbe2e9, %g1, %r20
	setx 0x4133f473a538614e, %g1, %r21
	setx 0xfab49f582f6e89aa, %g1, %r22
	setx 0xe8c3177d98e7ae21, %g1, %r23
	setx 0x22616c2259bb9119, %g1, %r24
	setx 0xc4ea705f9fb3c352, %g1, %r25
	setx 0x3fa708b2c3bfbbfe, %g1, %r26
	setx 0xa34732d62c6d32eb, %g1, %r27
	setx 0xe8bd61ccbd52a9e0, %g1, %r28
	setx 0x24ac0adf43fbea7f, %g1, %r29
	setx 0xa2bd2b6de6a0912c, %g1, %r30
	setx 0xb6d6cf386c2ef43a, %g1, %r31
	save
	setx 0x82a92c1abfe0e549, %g1, %r16
	setx 0x926557e7db8210b8, %g1, %r17
	setx 0xf08213c026a82a14, %g1, %r18
	setx 0xd325fd2e3642ae6c, %g1, %r19
	setx 0x6427b3ab9eec84a5, %g1, %r20
	setx 0x3ab5adeb89e47dfa, %g1, %r21
	setx 0x95627a3e9e70fee2, %g1, %r22
	setx 0xcacfc7dca7527631, %g1, %r23
	setx 0x188f62c8a1fb102d, %g1, %r24
	setx 0x89484aac9993d9cd, %g1, %r25
	setx 0x1c2f8ef60dffb33d, %g1, %r26
	setx 0x5dd8516084ebb71b, %g1, %r27
	setx 0x9a45cc454ce3a3e0, %g1, %r28
	setx 0x5a87275f954747b4, %g1, %r29
	setx 0x06ac4c7ed5c781b6, %g1, %r30
	setx 0x74f5096baaf3a54a, %g1, %r31
	save
	setx 0x2b3adfe9555fd5e2, %g1, %r16
	setx 0xf646b811b8fef522, %g1, %r17
	setx 0x70c2f565cf81b956, %g1, %r18
	setx 0xcf9dfe898f15c578, %g1, %r19
	setx 0x83c8ea52aa403fbf, %g1, %r20
	setx 0x41aac1c35d574e8c, %g1, %r21
	setx 0xa0c60a1919bc2de3, %g1, %r22
	setx 0x6e8efccbf00e02bc, %g1, %r23
	setx 0xa5f7a1039397013c, %g1, %r24
	setx 0x5598ea7d20c676db, %g1, %r25
	setx 0xf24ee0caa01cdbdf, %g1, %r26
	setx 0xa53f93e4b8cc8ba5, %g1, %r27
	setx 0xde9f0c087058df47, %g1, %r28
	setx 0xd5a1a3a91e64c3ab, %g1, %r29
	setx 0xff0b83c3d1c9b11a, %g1, %r30
	setx 0x593f16be2120eca8, %g1, %r31
	save
	setx 0x460504ffa7b513cd, %g1, %r16
	setx 0x72f21680e74e0bcf, %g1, %r17
	setx 0x274de153ee6346e3, %g1, %r18
	setx 0x5aa2f479489278f0, %g1, %r19
	setx 0xffba677b524790ae, %g1, %r20
	setx 0x983140618221d328, %g1, %r21
	setx 0x9b98e88710ccf92f, %g1, %r22
	setx 0x8b4de37dfcab960f, %g1, %r23
	setx 0xd1dbd89c4293fa85, %g1, %r24
	setx 0x11f7ce0f068b3759, %g1, %r25
	setx 0xa5caedde4c680525, %g1, %r26
	setx 0x4988cfbee5234689, %g1, %r27
	setx 0x478736b924e401ae, %g1, %r28
	setx 0x71ef2521ed9c2ece, %g1, %r29
	setx 0xd8b4c89751f56d49, %g1, %r30
	setx 0xbbb9dedfea37e8a6, %g1, %r31
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
	.word 0xbc944000  ! 5: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xb7e4a00a  ! 6: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_0:
	mov	0x1d, %r14
	.word 0xf6f38400  ! 10: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb2b50000  ! 11: ORNcc_R	orncc 	%r20, %r0, %r25
cpu_intr_0_0:
	setx	0x1e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5611d  ! 15: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5214c  ! 20: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_0:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_1:
	setx	0x1d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 26: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_2:
	setx	0x1d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 34: MOVcc_I	<illegal instruction>
	.word 0xbbe5a0c1  ! 35: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e460c7  ! 37: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb13c5000  ! 41: SRAX_R	srax	%r17, %r0, %r24
T0_asi_reg_wr_1:
	mov	0x25, %r14
	.word 0xfaf384a0  ! 46: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_3:
	setx	0x1f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_4:
	setx	0x1c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_5:
	setx	0x1d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 63: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1350000  ! 64: SRL_R	srl 	%r20, %r0, %r24
T0_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 65: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1e4c000  ! 67: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_6:
	setx	0x1d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_2:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_3:
	mov	0x18, %r14
	.word 0xf0f38400  ! 77: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5e5e196  ! 80: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe8c0000  ! 83: ANDcc_R	andcc 	%r16, %r0, %r31
cpu_intr_0_7:
	setx	0x1c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_4:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 85: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 89: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe56047  ! 91: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e420e0  ! 92: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe5616e  ! 96: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb4356103  ! 98: ORN_I	orn 	%r21, 0x0103, %r26
	.word 0xbfe48000  ! 99: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_4:
	mov	0x14, %r14
	.word 0xf4db8400  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e42004  ! 105: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_5:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_8:
	setx	0x1e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 116: ORcc_R	orcc 	%r19, %r0, %r24
cpu_intr_0_9:
	setx	0x1d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e44000  ! 126: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_5:
	mov	0x8, %r14
	.word 0xfef384a0  ! 127: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5520000  ! 130: RDPR_PIL	<illegal instruction>
cpu_intr_0_10:
	setx	0x1c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb025e1ec  ! 133: SUB_I	sub 	%r23, 0x01ec, %r24
cpu_intr_0_11:
	setx	0x1e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_6:
	mov	0x18, %r14
	.word 0xfcdb8e40  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe5e008  ! 140: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_7:
	mov	0x13, %r14
	.word 0xfedb89e0  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_8:
	mov	0x2d, %r14
	.word 0xfadb84a0  ! 144: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_9:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb551c000  ! 146: RDPR_TL	<illegal instruction>
cpu_intr_0_12:
	setx	0x1c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03560ce  ! 148: ORN_I	orn 	%r21, 0x00ce, %r24
cpu_intr_0_13:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 156: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbbe4a1fe  ! 158: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e421b0  ! 163: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb83c8000  ! 166: XNOR_R	xnor 	%r18, %r0, %r28
T0_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 168: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e5a18e  ! 169: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_11:
	mov	0x8, %r14
	.word 0xf2db89e0  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_7:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 172: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e50000  ! 174: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_15:
	setx	0x1f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_8:
	mov	0x15, %r14
	.word 0xfaf38400  ! 177: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_9:
	mov	0x16, %r14
	.word 0xf2f38400  ! 184: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1e5e003  ! 187: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbe34a144  ! 188: ORN_I	orn 	%r18, 0x0144, %r31
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 16)
	.word 0xbe05c000  ! 190: ADD_R	add 	%r23, %r0, %r31
	.word 0xbde5615c  ! 191: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e5c000  ! 195: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde5604e  ! 198: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_16:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_17:
	setx	0x1f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 206: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde48000  ! 207: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e4a190  ! 208: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_12:
	mov	0x32, %r14
	.word 0xfadb8e80  ! 209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_10:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 212: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5641800  ! 214: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_13:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_18:
	setx	0x1f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 220: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_19:
	setx	0x1e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e560df  ! 227: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e5a182  ! 230: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_20:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 232: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_21:
	setx	0x1d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 21)
	.word 0xbde5e033  ! 243: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5a12d  ! 244: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe520c9  ! 246: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_14:
	mov	0x12, %r14
	.word 0xf0db84a0  ! 247: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_22:
	setx	0x1c030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46103  ! 252: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_23:
	setx	0x1c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x5, %r14
	.word 0xf6f38e40  ! 256: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_24:
	setx	0x1e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_15:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_12:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe560b7  ! 267: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_25:
	setx	0x1d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 269: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e560db  ! 270: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_26:
	setx	0x1c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_13:
	mov	0x2f, %r14
	.word 0xfcf38e80  ! 279: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbbe42164  ! 283: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_14:
	mov	0x8, %r14
	.word 0xf6f38e60  ! 284: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb72d3001  ! 285: SLLX_I	sllx	%r20, 0x0001, %r27
cpu_intr_0_27:
	setx	0x1c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x1e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_15:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 293: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe5c000  ! 299: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_16:
	mov	0xc, %r14
	.word 0xf8f38400  ! 301: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5e50000  ! 304: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde42089  ! 308: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x9195211f  ! 310: WRPR_PIL_I	wrpr	%r20, 0x011f, %pil
T0_asi_reg_wr_17:
	mov	0x2d, %r14
	.word 0xfef38e80  ! 314: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_29:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_30:
	setx	0x1e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e58000  ! 319: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_31:
	setx	0x1e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_32:
	setx	0x1d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_33:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_17:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_34:
	setx	0x1c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 30)
	.word 0xbead0000  ! 343: ANDNcc_R	andncc 	%r20, %r0, %r31
T0_asi_reg_rd_18:
	mov	0x16, %r14
	.word 0xf0db89e0  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbbe48000  ! 347: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e40000  ! 353: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e5e094  ! 360: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_35:
	setx	0x1e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde561f0  ! 367: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_19:
	mov	0x2f, %r14
	.word 0xf2db8e80  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e4201b  ! 372: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_36:
	setx	0x1f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x1e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 375: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e4a09a  ! 376: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_38:
	setx	0x1d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_39:
	setx	0x1c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e54000  ! 384: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_20:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbbe561ee  ! 387: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe4a1a0  ! 393: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e56145  ! 394: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_18:
	mov	0x24, %r14
	.word 0xf6f389e0  ! 395: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_21:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7e50000  ! 401: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_22:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e54000  ! 409: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde4e00c  ! 410: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe50000  ! 414: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_23:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 423: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xba3c0000  ! 428: XNOR_R	xnor 	%r16, %r0, %r29
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_24:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 431: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3e4e11b  ! 432: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e54000  ! 434: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe48000  ! 436: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_25:
	mov	0x37, %r14
	.word 0xf8db84a0  ! 439: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb3e42069  ! 440: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf357001  ! 441: SRLX_I	srlx	%r21, 0x0001, %r31
T0_asi_reg_rd_26:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde460e5  ! 443: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e54000  ! 447: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e54000  ! 448: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe48000  ! 450: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e5a014  ! 451: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5a0e8  ! 452: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_19:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 453: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_27:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e521c9  ! 461: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_20:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 462: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbabce08c  ! 465: XNORcc_I	xnorcc 	%r19, 0x008c, %r29
	.word 0xb5e4e172  ! 466: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_21:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 469: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_28:
	mov	0xf, %r14
	.word 0xfcdb8e80  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb29d209f  ! 473: XORcc_I	xorcc 	%r20, 0x009f, %r25
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_40:
	setx	0x22000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_29:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 481: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_30:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e4c000  ! 490: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e5e127  ! 494: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e40000  ! 500: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9349000  ! 502: SRLX_R	srlx	%r18, %r0, %r28
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 504: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e44000  ! 506: SAVE_R	save	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_41:
	setx	0x220024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_23:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 511: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 512: SAVE_R	save	%r20, %r0, %r29
	.word 0xb1e40000  ! 515: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e520af  ! 527: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3d)
	.word 0x8795e1c9  ! 531: WRPR_TT_I	wrpr	%r23, 0x01c9, %tt
	.word 0xb6250000  ! 532: SUB_R	sub 	%r20, %r0, %r27
cpu_intr_0_42:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e5c000  ! 536: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_24:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 538: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb4c46058  ! 539: ADDCcc_I	addccc 	%r17, 0x0058, %r26
	.word 0xb0854000  ! 541: ADDcc_R	addcc 	%r21, %r0, %r24
T0_asi_reg_rd_31:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_43:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3d60dc  ! 545: XNOR_I	xnor 	%r21, 0x00dc, %r30
T0_asi_reg_wr_25:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 546: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb13c5000  ! 549: SRAX_R	srax	%r17, %r0, %r24
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_32:
	mov	0x15, %r14
	.word 0xf8db84a0  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_33:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_44:
	setx	0x220236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13cf001  ! 563: SRAX_I	srax	%r19, 0x0001, %r24
cpu_intr_0_45:
	setx	0x220032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 566: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_26:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 568: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba9cc000  ! 569: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xb1e50000  ! 573: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_46:
	setx	0x22000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 578: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e52018  ! 579: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb83c0000  ! 581: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xbde4e14c  ! 584: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe58000  ! 585: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5347001  ! 586: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xb1e54000  ! 590: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_35:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb634e0f7  ! 596: ORN_I	orn 	%r19, 0x00f7, %r27
	.word 0xb5e58000  ! 597: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_28:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 598: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_47:
	setx	0x21000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a14d  ! 603: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e44000  ! 606: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe54000  ! 608: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_29:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 609: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 610: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 23)
	.word 0xb29d619a  ! 614: XORcc_I	xorcc 	%r21, 0x019a, %r25
	.word 0xbde461bc  ! 616: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_48:
	setx	0x210315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x18, %r14
	.word 0xf6db8e60  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_30:
	mov	0x29, %r14
	.word 0xf4f38e60  ! 621: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_49:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8440000  ! 623: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xb7e4209d  ! 625: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe50000  ! 630: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde42132  ! 631: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_50:
	setx	0x220209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3e46082  ! 635: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e48000  ! 637: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e58000  ! 643: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_51:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 647: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, f)
	.word 0xb5e4c000  ! 653: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e50000  ! 654: SAVE_R	save	%r20, %r0, %r25
	.word 0xb2b4a192  ! 655: ORNcc_I	orncc 	%r18, 0x0192, %r25
	.word 0xbfe5c000  ! 660: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe58000  ! 661: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e44000  ! 663: SAVE_R	save	%r17, %r0, %r25
	.word 0xb32d3001  ! 664: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xbbe44000  ! 666: SAVE_R	save	%r17, %r0, %r29
	.word 0xbc1de1d8  ! 668: XOR_I	xor 	%r23, 0x01d8, %r30
	.word 0xb7e561be  ! 671: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e58000  ! 672: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e40000  ! 673: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e44000  ! 675: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e4a1e7  ! 676: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 7)
	.word 0xbde52152  ! 678: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_31:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 683: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe460f7  ! 684: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e48000  ! 686: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e4c000  ! 689: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_52:
	setx	0x210019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd343001  ! 693: SRLX_I	srlx	%r16, 0x0001, %r30
T0_asi_reg_wr_32:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 695: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e4616b  ! 697: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e5c000  ! 706: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_53:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e046  ! 708: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe54000  ! 709: SAVE_R	save	%r21, %r0, %r31
	.word 0xb295a04c  ! 710: ORcc_I	orcc 	%r22, 0x004c, %r25
	.word 0xb1e5607b  ! 713: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_54:
	setx	0x22030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421ab  ! 720: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5608f  ! 722: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5c000  ! 725: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e4207d  ! 727: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde50000  ! 736: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb8054000  ! 742: ADD_R	add 	%r21, %r0, %r28
cpu_intr_0_55:
	setx	0x210210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_56:
	setx	0x210336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_33:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 746: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7e40000  ! 749: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe56042  ! 752: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7358000  ! 753: SRL_R	srl 	%r22, %r0, %r27
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_57:
	setx	0x210227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 758: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4e02c  ! 763: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e40000  ! 765: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_34:
	mov	0x9, %r14
	.word 0xfef38400  ! 766: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e54000  ! 768: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_39:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 769: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7e4a0d2  ! 771: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e4a1b8  ! 776: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_58:
	setx	0x220126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4213b  ! 779: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_59:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8dc000  ! 785: ANDcc_R	andcc 	%r23, %r0, %r30
cpu_intr_0_60:
	setx	0x210226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_61:
	setx	0x210222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3340000  ! 791: SRL_R	srl 	%r16, %r0, %r25
T0_asi_reg_rd_40:
	mov	0x2b, %r14
	.word 0xf4db84a0  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_41:
	mov	0x2b, %r14
	.word 0xf0db8e40  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_62:
	setx	0x22023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97de401  ! 802: MOVR_I	movre	%r23, 0x1, %r28
cpu_intr_0_63:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e039  ! 804: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e52086  ! 808: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e4e001  ! 811: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_64:
	setx	0x220223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe48000  ! 818: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_42:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 820: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e54000  ! 822: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_35:
	mov	0xc, %r14
	.word 0xfaf38400  ! 824: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 831: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x899460b5  ! 833: WRPR_TICK_I	wrpr	%r17, 0x00b5, %tick
	.word 0xbb35a001  ! 835: SRL_I	srl 	%r22, 0x0001, %r29
T0_asi_reg_rd_43:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_44:
	mov	0x20, %r14
	.word 0xf2db84a0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_65:
	setx	0x200317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42152  ! 845: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_46:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_37:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_66:
	setx	0x210316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 864: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 2)
	.word 0xbd347001  ! 869: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xb1e40000  ! 870: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e46197  ! 872: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 39)
	.word 0xb134b001  ! 877: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xbf7c4400  ! 880: MOVR_R	movre	%r17, %r0, %r31
T0_asi_reg_wr_38:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 881: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 882: SAVE_R	save	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e461b5  ! 885: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_47:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_67:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, e)
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e58000  ! 901: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e48000  ! 903: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e40000  ! 905: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe5c000  ! 908: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 37)
	.word 0xb6c42147  ! 912: ADDCcc_I	addccc 	%r16, 0x0147, %r27
	.word 0xb7e44000  ! 913: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_68:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 919: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb6b58000  ! 920: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xbde5e023  ! 921: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e4c000  ! 924: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_69:
	setx	0x240331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5606b  ! 928: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e48000  ! 929: SAVE_R	save	%r18, %r0, %r28
	.word 0xb8b4614d  ! 932: ORNcc_I	orncc 	%r17, 0x014d, %r28
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_70:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_71:
	setx	0x26011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 943: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_40:
	mov	0x35, %r14
	.word 0xf2f384a0  ! 945: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_48:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 951: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbde5c000  ! 956: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_72:
	setx	0x270231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_73:
	setx	0x240314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a171  ! 968: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a1ef  ! 969: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbe440000  ! 972: ADDC_R	addc 	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb094a0fc  ! 980: ORcc_I	orcc 	%r18, 0x00fc, %r24
T0_asi_reg_rd_50:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_51:
	mov	0x38, %r14
	.word 0xfadb8e60  ! 988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e40000  ! 991: SAVE_R	save	%r16, %r0, %r26
	.word 0xb9e5c000  ! 992: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_74:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d2041  ! 994: XOR_I	xor 	%r20, 0x0041, %r30
	.word 0xb5357001  ! 998: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xbeac61aa  ! 1000: ANDNcc_I	andncc 	%r17, 0x01aa, %r31
cpu_intr_0_75:
	setx	0x24020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_76:
	setx	0x240313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_77:
	setx	0x250107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1009: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe5618f  ! 1011: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb6352029  ! 1017: ORN_I	orn 	%r20, 0x0029, %r27
	.word 0xb7e54000  ! 1018: SAVE_R	save	%r21, %r0, %r27
	.word 0xbd643801  ! 1021: MOVcc_I	<illegal instruction>
	.word 0xbde5a0f6  ! 1023: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5617c  ! 1025: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde461a8  ! 1027: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_78:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1030: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_79:
	setx	0x250327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5c000  ! 1035: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xb9e52150  ! 1036: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_80:
	setx	0x25032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe54000  ! 1043: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde44000  ! 1045: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e48000  ! 1048: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e48000  ! 1052: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_81:
	setx	0x250005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1057: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 29)
	.word 0xbb35c000  ! 1059: SRL_R	srl 	%r23, %r0, %r29
	.word 0xbb3d0000  ! 1060: SRA_R	sra 	%r20, %r0, %r29
cpu_intr_0_82:
	setx	0x270236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1073: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_41:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 1074: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe4c000  ! 1078: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_53:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_54:
	mov	0x2, %r14
	.word 0xf0db8e80  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 31)
	.word 0xb8c46001  ! 1093: ADDCcc_I	addccc 	%r17, 0x0001, %r28
	.word 0xb3e5e1ff  ! 1094: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_83:
	setx	0x240138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 1096: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_84:
	setx	0x260137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1101: SAVE_R	save	%r20, %r0, %r31
	.word 0xb2a4a122  ! 1102: SUBcc_I	subcc 	%r18, 0x0122, %r25
T0_asi_reg_wr_42:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 1103: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde5e1ae  ! 1105: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_85:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2344000  ! 1109: ORN_R	orn 	%r17, %r0, %r25
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_55:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_43:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 1116: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_56:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e48000  ! 1118: SAVE_R	save	%r18, %r0, %r25
	.word 0xb035a051  ! 1120: ORN_I	orn 	%r22, 0x0051, %r24
	.word 0xb5e48000  ! 1121: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_44:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 1124: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_86:
	setx	0x270206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e144  ! 1127: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbe45a03e  ! 1128: ADDC_I	addc 	%r22, 0x003e, %r31
cpu_intr_0_87:
	setx	0x25020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_57:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb824a03c  ! 1133: SUB_I	sub 	%r18, 0x003c, %r28
	.word 0xb3e48000  ! 1141: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e46170  ! 1142: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_58:
	mov	0x2, %r14
	.word 0xfedb84a0  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_88:
	setx	0x24011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b4c000  ! 1150: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb295e080  ! 1152: ORcc_I	orcc 	%r23, 0x0080, %r25
	.word 0xbbe420e3  ! 1153: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_59:
	mov	0x14, %r14
	.word 0xf2db8e60  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_89:
	setx	0x10324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde5a0ac  ! 1168: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb6a42168  ! 1169: SUBcc_I	subcc 	%r16, 0x0168, %r27
	.word 0xb3e5c000  ! 1170: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_90:
	setx	0x27020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_45:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 1176: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_60:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb61c2079  ! 1182: XOR_I	xor 	%r16, 0x0079, %r27
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_91:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1192: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_61:
	mov	0x34, %r14
	.word 0xfadb89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 6)
	.word 0xb2448000  ! 1199: ADDC_R	addc 	%r18, %r0, %r25
	.word 0xb9e5a13c  ! 1201: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe40000  ! 1203: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_92:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x35, %r14
	.word 0xfcf38400  ! 1208: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_93:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_94:
	setx	0x270122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 19)
	.word 0xbde5e155  ! 1217: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_95:
	setx	0x260230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62da116  ! 1221: ANDN_I	andn 	%r22, 0x0116, %r27
T0_asi_reg_rd_62:
	mov	0x1a, %r14
	.word 0xf6db8400  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_96:
	setx	0x24012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 1226: MOVcc_I	<illegal instruction>
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_63:
	mov	0x33, %r14
	.word 0xf6db89e0  ! 1230: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_47:
	mov	0x22, %r14
	.word 0xf0f389e0  ! 1231: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e4a082  ! 1235: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e5e15d  ! 1239: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5c000  ! 1240: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_48:
	mov	0x38, %r14
	.word 0xfef384a0  ! 1241: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_97:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e461e0  ! 1246: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_64:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 1248: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1e5e0c7  ! 1249: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_49:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 1250: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5e094  ! 1251: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4e108  ! 1252: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_65:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_66:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e5c000  ! 1257: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7e50000  ! 1259: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e4c000  ! 1260: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e44000  ! 1261: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e4e19f  ! 1268: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_98:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_99:
	setx	0x270126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e4e0f7  ! 1276: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_50:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 1277: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_100:
	setx	0x240100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_68:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_51:
	mov	0x19, %r14
	.word 0xf2f38e80  ! 1281: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5e09e  ! 1297: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e50000  ! 1298: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_101:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_102:
	setx	0x24032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_52:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 1311: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbde56039  ! 1313: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e4c000  ! 1317: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_103:
	setx	0x25002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e5605d  ! 1323: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde40000  ! 1324: SAVE_R	save	%r16, %r0, %r30
	.word 0xb415a129  ! 1325: OR_I	or 	%r22, 0x0129, %r26
	.word 0xbfe4a030  ! 1327: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 1328: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_104:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0e8  ! 1330: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_69:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb0b4a1d3  ! 1337: ORNcc_I	orncc 	%r18, 0x01d3, %r24
cpu_intr_0_105:
	setx	0x270020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1341: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe4c000  ! 1343: SAVE_R	save	%r19, %r0, %r31
	.word 0xbb3c5000  ! 1344: SRAX_R	srax	%r17, %r0, %r29
cpu_intr_0_106:
	setx	0x270204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_107:
	setx	0x240124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x270013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x260012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1350: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1352: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_110:
	setx	0x27021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_55:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1357: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e420b5  ! 1358: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_111:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_56:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 1372: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 1377: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb935f001  ! 1379: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0xbfe4e001  ! 1380: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_58:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 1382: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0x83942030  ! 1384: WRPR_TNPC_I	wrpr	%r16, 0x0030, %tnpc
	.word 0xb7e54000  ! 1388: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_70:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde58000  ! 1395: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde560e0  ! 1397: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 3)
	.word 0xb8c4601d  ! 1401: ADDCcc_I	addccc 	%r17, 0x001d, %r28
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e52155  ! 1406: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde44000  ! 1410: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_112:
	setx	0x2a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5611f  ! 1414: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4e0b1  ! 1416: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4a108  ! 1419: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_59:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 1423: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_113:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a13b  ! 1429: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_60:
	mov	0xc, %r14
	.word 0xfef384a0  ! 1430: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e5a121  ! 1433: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbe240000  ! 1434: SUB_R	sub 	%r16, %r0, %r31
cpu_intr_0_114:
	setx	0x280003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 1437: SAVE_R	save	%r23, %r0, %r25
	.word 0xbde40000  ! 1439: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe4e0d5  ! 1441: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbe24a054  ! 1445: SUB_I	sub 	%r18, 0x0054, %r31
cpu_intr_0_115:
	setx	0x2b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_116:
	setx	0x2a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c2002  ! 1448: XNOR_I	xnor 	%r16, 0x0002, %r29
T0_asi_reg_wr_61:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 1449: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbaace029  ! 1450: ANDNcc_I	andncc 	%r19, 0x0029, %r29
	.word 0xbde4a0ee  ! 1451: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_117:
	setx	0x2a012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460d3  ! 1456: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e58000  ! 1458: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_62:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 1459: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_118:
	setx	0x280310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a05f  ! 1462: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5200c  ! 1465: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_63:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 1467: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 1469: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9540000  ! 1473: RDPR_GL	<illegal instruction>
	.word 0xb7e4c000  ! 1477: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_119:
	setx	0x2a0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e58000  ! 1482: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_120:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_73:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbf3c4000  ! 1487: SRA_R	sra 	%r17, %r0, %r31
	.word 0xbde4a052  ! 1489: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_64:
	mov	0xd, %r14
	.word 0xf4f38e60  ! 1493: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfe48000  ! 1494: SAVE_R	save	%r18, %r0, %r31
	.word 0xba9cc000  ! 1496: XORcc_R	xorcc 	%r19, %r0, %r29
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe561f0  ! 1499: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_65:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 1501: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe40000  ! 1505: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e44000  ! 1507: SAVE_R	save	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_121:
	setx	0x280114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46076  ! 1510: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_122:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e54000  ! 1517: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e58000  ! 1525: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e5a0d6  ! 1527: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe421c0  ! 1529: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e46105  ! 1531: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_123:
	setx	0x2b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e561b5  ! 1535: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e460f7  ! 1536: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e50000  ! 1539: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde5a1f1  ! 1541: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_66:
	mov	0x25, %r14
	.word 0xfaf38400  ! 1545: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5347001  ! 1548: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xb3e4609c  ! 1550: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_67:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 1551: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_124:
	setx	0x280225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42068  ! 1556: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_125:
	setx	0x280112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_68:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 1561: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_126:
	setx	0x2a0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 1565: SRLX_R	srlx	%r19, %r0, %r27
cpu_intr_0_127:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56000  ! 1567: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e44000  ! 1570: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe48000  ! 1572: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_128:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_129:
	setx	0x280000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_74:
	mov	0x13, %r14
	.word 0xf2db8e60  ! 1583: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_69:
	mov	0x28, %r14
	.word 0xf4f38e80  ! 1584: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb094600e  ! 1585: ORcc_I	orcc 	%r17, 0x000e, %r24
	.word 0xb7e48000  ! 1586: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_130:
	setx	0x2a0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_70:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 1597: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbde50000  ! 1598: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_75:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 1600: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e4c000  ! 1609: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e4a13a  ! 1614: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e52030  ! 1619: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb0ad4000  ! 1620: ANDNcc_R	andncc 	%r21, %r0, %r24
T0_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 1623: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9e5c000  ! 1629: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e5a152  ! 1631: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_72:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1632: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_131:
	setx	0x2a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1636: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e4c000  ! 1639: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e5e115  ! 1640: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe54000  ! 1641: SAVE_R	save	%r21, %r0, %r31
	.word 0xb9e54000  ! 1642: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe50000  ! 1644: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_73:
	mov	0x38, %r14
	.word 0xf0f38400  ! 1645: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9e48000  ! 1647: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_74:
	mov	0x33, %r14
	.word 0xf0f384a0  ! 1648: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e421ce  ! 1649: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe50000  ! 1650: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_132:
	setx	0x2b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_76:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e5e176  ! 1657: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_75:
	mov	0x17, %r14
	.word 0xf8f38400  ! 1660: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbc152032  ! 1665: OR_I	or 	%r20, 0x0032, %r30
	.word 0xb0b50000  ! 1666: SUBCcc_R	orncc 	%r20, %r0, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e4a1ec  ! 1668: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_133:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6354000  ! 1675: ORN_R	orn 	%r21, %r0, %r27
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb52cb001  ! 1681: SLLX_I	sllx	%r18, 0x0001, %r26
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_134:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_135:
	setx	0x280134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e4212e  ! 1690: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_136:
	setx	0x2b0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbb341000  ! 1696: SRLX_R	srlx	%r16, %r0, %r29
T0_asi_reg_rd_78:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 1700: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_79:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 1701: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_137:
	setx	0x2a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8148000  ! 1708: OR_R	or 	%r18, %r0, %r28
	.word 0xbead4000  ! 1710: ANDNcc_R	andncc 	%r21, %r0, %r31
T0_asi_reg_rd_80:
	mov	0x2d, %r14
	.word 0xf0db8e80  ! 1712: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_138:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 1714: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_81:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_139:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 1717: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_76:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 1719: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbf643801  ! 1722: MOVcc_I	<illegal instruction>
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 4)
	.word 0xb135e001  ! 1724: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xb9e48000  ! 1726: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_140:
	setx	0x29001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 1734: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e4a08d  ! 1740: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5e0d1  ! 1741: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_82:
	mov	0xc, %r14
	.word 0xf6db89e0  ! 1743: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_77:
	mov	0x35, %r14
	.word 0xf4f389e0  ! 1746: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 13)
	.word 0xbe144000  ! 1750: OR_R	or 	%r17, %r0, %r31
	.word 0xbbe54000  ! 1751: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_141:
	setx	0x28031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_83:
	mov	0x36, %r14
	.word 0xf6db89e0  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9e44000  ! 1756: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_84:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 1758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 28)
	.word 0xb2a4e187  ! 1761: SUBcc_I	subcc 	%r19, 0x0187, %r25
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e44000  ! 1763: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e44000  ! 1769: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_85:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 1770: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe44000  ! 1772: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e48000  ! 1773: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e4c000  ! 1777: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e5a016  ! 1778: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_86:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 1781: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_87:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_88:
	mov	0x31, %r14
	.word 0xfcdb8e80  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbe84600d  ! 1787: ADDcc_I	addcc 	%r17, 0x000d, %r31
cpu_intr_0_142:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 1791: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e58000  ! 1797: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 25)
	.word 0xbb641800  ! 1803: MOVcc_R	<illegal instruction>
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_89:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_143:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46006  ! 1812: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_79:
	mov	0x2, %r14
	.word 0xf0f384a0  ! 1814: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 8)
	.word 0xbe040000  ! 1819: ADD_R	add 	%r16, %r0, %r31
	.word 0xb9e5e008  ! 1820: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4619f  ! 1821: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 1824: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_90:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe5c000  ! 1834: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1e54000  ! 1835: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_144:
	setx	0x2e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c4000  ! 1841: SLL_R	sll 	%r17, %r0, %r27
	.word 0xb5e5e024  ! 1842: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_145:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 1851: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 1855: SAVE_R	save	%r21, %r0, %r24
	.word 0xbab44000  ! 1857: ORNcc_R	orncc 	%r17, %r0, %r29
cpu_intr_0_146:
	setx	0x2e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_147:
	setx	0x2d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_91:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_82:
	mov	0x2f, %r14
	.word 0xf4f389e0  ! 1865: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_83:
	mov	0x24, %r14
	.word 0xf0f38400  ! 1866: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_92:
	mov	0x23, %r14
	.word 0xf2db8400  ! 1869: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_93:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_148:
	setx	0x2e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_149:
	setx	0x2f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 1877: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 31)
	.word 0xb8c58000  ! 1883: ADDCcc_R	addccc 	%r22, %r0, %r28
T0_asi_reg_wr_84:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 1885: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_150:
	setx	0x2c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461f4  ! 1890: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_151:
	setx	0x2d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_85:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 1896: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_86:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 1898: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbf3cf001  ! 1904: SRAX_I	srax	%r19, 0x0001, %r31
cpu_intr_0_152:
	setx	0x2e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x2f, %r14
	.word 0xf2db8400  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_154:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_95:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e48000  ! 1918: SAVE_R	save	%r18, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe40000  ! 1922: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde54000  ! 1923: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4c000  ! 1924: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_155:
	setx	0x2c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520bf  ! 1933: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e58000  ! 1939: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_87:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 1941: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_96:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe46100  ! 1945: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5c000  ! 1946: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_156:
	setx	0x2e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561a3  ! 1950: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde58000  ! 1952: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_157:
	setx	0x2c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_158:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1b0  ! 1959: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4c000  ! 1960: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_88:
	mov	0x0, %r14
	.word 0xfcf384a0  ! 1962: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe44000  ! 1963: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_97:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 1964: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb92d9000  ! 1967: SLLX_R	sllx	%r22, %r0, %r28
	.word 0xb5e4a0e0  ! 1968: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe54000  ! 1969: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_159:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_160:
	setx	0x2c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_98:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e58000  ! 1981: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde48000  ! 1983: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_89:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1989: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e5200f  ! 1992: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_90:
	mov	0x0, %r14
	.word 0xfcf389e0  ! 1993: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbbe4c000  ! 1994: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_161:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2000: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e560d4  ! 2002: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde4e075  ! 2004: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb4b58000  ! 2006: ORNcc_R	orncc 	%r22, %r0, %r26
cpu_intr_0_162:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4213b  ! 2010: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_99:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e54000  ! 2014: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde4a188  ! 2015: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5e12a  ! 2019: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3353001  ! 2023: SRLX_I	srlx	%r20, 0x0001, %r25
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_91:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 2025: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_100:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_92:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2028: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe4a000  ! 2029: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_93:
	mov	0x27, %r14
	.word 0xfaf389e0  ! 2030: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_101:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde58000  ! 2032: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_102:
	mov	0x13, %r14
	.word 0xfcdb8400  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_wr_94:
	mov	0x1, %r14
	.word 0xf6f38e60  ! 2034: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_163:
	setx	0x2d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e095  ! 2042: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_164:
	setx	0x2c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e5601f  ! 2049: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_104:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfe40000  ! 2052: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_165:
	setx	0x2f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_166:
	setx	0x2f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2059: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe48000  ! 2060: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe54000  ! 2063: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5e42111  ! 2068: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_167:
	setx	0x2f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_168:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46073  ! 2072: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 2075: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 36)
	.word 0xb77c4400  ! 2077: MOVR_R	movre	%r17, %r0, %r27
	.word 0xbfe421c9  ! 2084: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x899520cd  ! 2086: WRPR_TICK_I	wrpr	%r20, 0x00cd, %tick
cpu_intr_0_169:
	setx	0x2d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 2090: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e521b5  ! 2093: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_96:
	mov	0x1f, %r14
	.word 0xf6f38e80  ! 2095: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbd351000  ! 2098: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xb9e54000  ! 2103: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_170:
	setx	0x2e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2109: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e48000  ! 2110: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_171:
	setx	0x2d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46044  ! 2112: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_172:
	setx	0x2f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_173:
	setx	0x2c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 2116: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e420bf  ! 2117: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_105:
	mov	0x34, %r14
	.word 0xf4db89e0  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_174:
	setx	0x2f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 2)
	.word 0xb135e001  ! 2129: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xb5e48000  ! 2130: SAVE_R	save	%r18, %r0, %r26
	.word 0xb2a4a16f  ! 2131: SUBcc_I	subcc 	%r18, 0x016f, %r25
	.word 0xb7e48000  ! 2132: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_97:
	mov	0x2, %r14
	.word 0xfcf384a0  ! 2133: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_176:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2143: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_98:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 2147: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde4c000  ! 2148: SAVE_R	save	%r19, %r0, %r30
	.word 0xb29d4000  ! 2149: XORcc_R	xorcc 	%r21, %r0, %r25
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_177:
	setx	0x2d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_106:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9e4e06e  ! 2157: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_178:
	setx	0x2c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_179:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2163: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e40000  ! 2164: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e5e11c  ! 2165: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb4ad2178  ! 2166: ANDNcc_I	andncc 	%r20, 0x0178, %r26
	.word 0xb6b4a18f  ! 2168: ORNcc_I	orncc 	%r18, 0x018f, %r27
T0_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_108:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e54000  ! 2177: SAVE_R	save	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a1ad  ! 2180: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde58000  ! 2181: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_180:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 2191: SAVE_R	save	%r16, %r0, %r25
	.word 0xb8344000  ! 2192: ORN_R	orn 	%r17, %r0, %r28
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_181:
	setx	0x2e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15e046  ! 2202: OR_I	or 	%r23, 0x0046, %r31
cpu_intr_0_182:
	setx	0x2d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a06d  ! 2206: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_99:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 2219: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e56103  ! 2220: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e52079  ! 2222: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd7d8400  ! 2223: MOVR_R	movre	%r22, %r0, %r30
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e5c000  ! 2228: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_100:
	mov	0x27, %r14
	.word 0xf8f38400  ! 2229: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_183:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a004  ! 2234: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_101:
	mov	0x10, %r14
	.word 0xf6f38e60  ! 2237: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_102:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 2238: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbbe5a04f  ! 2240: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd50c000  ! 2241: RDPR_TT	<illegal instruction>
	.word 0xb5e5c000  ! 2242: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde4e0a1  ! 2245: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde48000  ! 2247: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e521c8  ! 2251: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb634a1dd  ! 2252: ORN_I	orn 	%r18, 0x01dd, %r27
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e48000  ! 2256: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 2260: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb00c6064  ! 2270: AND_I	and 	%r17, 0x0064, %r24
cpu_intr_0_184:
	setx	0x300008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x30020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4208d  ! 2275: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_186:
	setx	0x310335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3d606d  ! 2278: XNOR_I	xnor 	%r21, 0x006d, %r31
cpu_intr_0_187:
	setx	0x30002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_104:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 2283: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbabcc000  ! 2285: XNORcc_R	xnorcc 	%r19, %r0, %r29
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e5a14d  ! 2287: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_105:
	mov	0x33, %r14
	.word 0xf0f389e0  ! 2288: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 0)
	.word 0xb73d0000  ! 2293: SRA_R	sra 	%r20, %r0, %r27
T0_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_111:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbbe40000  ! 2301: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_188:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_112:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e5a1cb  ! 2307: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4c000  ! 2308: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e44000  ! 2310: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde520df  ! 2312: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_113:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e44000  ! 2316: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_189:
	setx	0x310221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2322: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_190:
	setx	0x33010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde5e127  ! 2332: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_106:
	mov	0x24, %r14
	.word 0xfef38e60  ! 2333: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbab54000  ! 2334: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xb3e40000  ! 2336: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_114:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 2337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7e560ce  ! 2339: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4a14c  ! 2342: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_115:
	mov	0xd, %r14
	.word 0xf6db84a0  ! 2347: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1e4c000  ! 2350: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_191:
	setx	0x320329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_116:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e5e0a9  ! 2357: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e4601b  ! 2364: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_192:
	setx	0x32032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 2367: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb005a1ad  ! 2370: ADD_I	add 	%r22, 0x01ad, %r24
	.word 0xb5e44000  ! 2375: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_108:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2376: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_117:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 2379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3e561d4  ! 2380: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_193:
	setx	0x330037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_194:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 2389: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_195:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395603e  ! 2394: WRPR_TNPC_I	wrpr	%r21, 0x003e, %tnpc
	.word 0xb7e40000  ! 2399: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_196:
	setx	0x330031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_109:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 2406: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 2409: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_118:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e58000  ! 2418: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_197:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e5e041  ! 2425: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4e1ec  ! 2426: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_198:
	setx	0x32030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe5c000  ! 2431: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e5216c  ! 2432: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, a)
	.word 0xb3e561ab  ! 2443: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4c000  ! 2444: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e5a1fe  ! 2447: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe520f7  ! 2448: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e000  ! 2450: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_199:
	setx	0x320128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_200:
	setx	0x300036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520f2  ! 2456: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e44000  ! 2457: SAVE_R	save	%r17, %r0, %r25
	.word 0xbe0d61ed  ! 2459: AND_I	and 	%r21, 0x01ed, %r31
	.word 0xbbe4618e  ! 2463: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_119:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 2468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_201:
	setx	0x310329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 2470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_202:
	setx	0x33012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_110:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 2473: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_111:
	mov	0x11, %r14
	.word 0xf0f38400  ! 2475: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_203:
	setx	0x300314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2480: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e4214e  ! 2482: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf508000  ! 2483: RDPR_TSTATE	<illegal instruction>
T0_asi_reg_rd_121:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe46022  ! 2486: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_112:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 2489: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xba1cc000  ! 2490: XOR_R	xor 	%r19, %r0, %r29
	.word 0xb7e58000  ! 2493: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 39)
	.word 0xbf342001  ! 2496: SRL_I	srl 	%r16, 0x0001, %r31
T0_asi_reg_wr_113:
	mov	0x17, %r14
	.word 0xfcf389e0  ! 2497: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_wr_114:
	mov	0x2c, %r14
	.word 0xf6f38e60  ! 2499: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_115:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 2500: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_116:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 2504: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5e5e164  ! 2510: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb8c460d1  ! 2513: ADDCcc_I	addccc 	%r17, 0x00d1, %r28
T0_asi_reg_wr_117:
	mov	0x2f, %r14
	.word 0xf8f38e60  ! 2517: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e56040  ! 2519: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5a00b  ! 2521: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_204:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_205:
	setx	0x300128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, f)
	.word 0xb1e421fe  ! 2534: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 13)
	.word 0xbfe54000  ! 2541: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_206:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, e)
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_118:
	mov	0xc, %r14
	.word 0xf6f38400  ! 2547: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb63d6019  ! 2549: XNOR_I	xnor 	%r21, 0x0019, %r27
	.word 0xb1e50000  ! 2551: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_207:
	setx	0x320220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb4958000  ! 2559: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xbfe44000  ! 2563: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde48000  ! 2565: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe561ec  ! 2571: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbcb54000  ! 2572: ORNcc_R	orncc 	%r21, %r0, %r30
T0_asi_reg_wr_119:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 2573: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde4a145  ! 2575: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde5e04a  ! 2577: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_122:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb37dc400  ! 2580: MOVR_R	movre	%r23, %r0, %r25
T0_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 2587: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7e40000  ! 2589: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe420fa  ! 2591: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_208:
	setx	0x33013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_120:
	mov	0x1d, %r14
	.word 0xf8f38400  ! 2599: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_124:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_209:
	setx	0x320331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_210:
	setx	0x33031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_211:
	setx	0x310321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 2615: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde56011  ! 2618: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_212:
	setx	0x12d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a082  ! 2622: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5c000  ! 2625: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_121:
	mov	0x3, %r14
	.word 0xfef38e40  ! 2626: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_125:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 2627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xba95a118  ! 2632: ORcc_I	orcc 	%r22, 0x0118, %r29
T0_asi_reg_wr_122:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 2633: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e5c000  ! 2634: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_213:
	setx	0x310116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_123:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 2641: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_126:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 2643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_124:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2646: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbde54000  ! 2648: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_215:
	setx	0x300303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 2652: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe4e0d3  ! 2653: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_127:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 2656: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e5e174  ! 2661: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e5a02a  ! 2663: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e56033  ! 2664: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe54000  ! 2666: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e58000  ! 2668: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_125:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 2670: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e420a0  ! 2672: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_216:
	setx	0x31011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2675: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe40000  ! 2676: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e44000  ! 2679: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_128:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 2682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_217:
	setx	0x300314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_129:
	mov	0x33, %r14
	.word 0xf8db84a0  ! 2684: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb53d0000  ! 2687: SRA_R	sra 	%r20, %r0, %r26
cpu_intr_0_218:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 2689: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_126:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 2691: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e44000  ! 2692: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe58000  ! 2693: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde44000  ! 2695: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe460f4  ! 2696: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e54000  ! 2700: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e44000  ! 2701: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_219:
	setx	0x32023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2709: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e4e1af  ! 2714: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4e0dd  ! 2715: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_130:
	mov	0x21, %r14
	.word 0xf4db8e80  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbf2d6001  ! 2717: SLL_I	sll 	%r21, 0x0001, %r31
T0_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 2718: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e5e0c2  ! 2720: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_131:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e42184  ! 2728: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_128:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 2729: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_220:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2735: SAVE_R	save	%r21, %r0, %r29
	.word 0xbc354000  ! 2736: SUBC_R	orn 	%r21, %r0, %r30
cpu_intr_0_221:
	setx	0x37020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e54000  ! 2743: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_222:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_129:
	mov	0x3, %r14
	.word 0xf4f38400  ! 2745: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfe4e0c0  ! 2747: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_130:
	mov	0x34, %r14
	.word 0xf6f38e60  ! 2750: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_132:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 2752: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_223:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 2755: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_133:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 2757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde4e170  ! 2758: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd2d3001  ! 2759: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xb32df001  ! 2760: SLLX_I	sllx	%r23, 0x0001, %r25
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_131:
	mov	0x15, %r14
	.word 0xf4f38400  ! 2765: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_132:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2767: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe4e0f4  ! 2768: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5612f  ! 2769: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb035a00f  ! 2770: SUBC_I	orn 	%r22, 0x000f, %r24
	.word 0xbde4e1ef  ! 2774: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5e069  ! 2775: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbbe54000  ! 2778: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde50000  ! 2781: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde44000  ! 2782: SAVE_R	save	%r17, %r0, %r30
	.word 0xb3e460da  ! 2784: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe48000  ! 2787: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe4c000  ! 2794: SAVE_R	save	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_133:
	mov	0x31, %r14
	.word 0xfef389e0  ! 2799: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_134:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 2800: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_134:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_135:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb4a4c000  ! 2808: SUBcc_R	subcc 	%r19, %r0, %r26
T0_asi_reg_wr_135:
	mov	0xb, %r14
	.word 0xfef38e80  ! 2809: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e52175  ! 2812: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe5a04d  ! 2813: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_224:
	setx	0x340234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x350302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e09a  ! 2819: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5a04b  ! 2821: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5c000  ! 2822: SAVE_R	save	%r23, %r0, %r29
	.word 0xbe9dc000  ! 2825: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xbde5e132  ! 2826: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e4e0ea  ! 2829: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5a0fc  ! 2831: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e5606d  ! 2832: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe44000  ! 2836: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_226:
	setx	0x360312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2840: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e5a186  ! 2841: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4c000  ! 2842: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_228:
	setx	0x35000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbb7d0400  ! 2848: MOVR_R	movre	%r20, %r0, %r29
T0_asi_reg_rd_136:
	mov	0x10, %r14
	.word 0xfedb8400  ! 2849: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb17c2401  ! 2851: MOVR_I	movre	%r16, 0x1, %r24
T0_asi_reg_rd_137:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 2853: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_138:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_229:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1dd  ! 2857: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe40000  ! 2860: SAVE_R	save	%r16, %r0, %r29
	.word 0xb7e44000  ! 2863: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_230:
	setx	0x37031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46092  ! 2865: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e44000  ! 2866: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e5c000  ! 2867: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_231:
	setx	0x370113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_232:
	setx	0x340310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb7e50000  ! 2878: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_233:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 2882: SUBC_R	orn 	%r21, %r0, %r28
	.word 0xb3e48000  ! 2883: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe54000  ! 2884: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e54000  ! 2885: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e50000  ! 2887: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_234:
	setx	0x370032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 2891: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_235:
	setx	0x350210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_236:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2898: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe40000  ! 2901: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde58000  ! 2902: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_136:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 2904: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9e4a1eb  ! 2905: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe50000  ! 2907: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde40000  ! 2908: SAVE_R	save	%r16, %r0, %r30
	.word 0xb085a104  ! 2909: ADDcc_I	addcc 	%r22, 0x0104, %r24
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 35)
	.word 0xbe8d4000  ! 2914: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xb9e44000  ! 2915: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_237:
	setx	0x36000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x35032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_239:
	setx	0x37033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_240:
	setx	0x36011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561e9  ! 2926: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbc340000  ! 2930: SUBC_R	orn 	%r16, %r0, %r30
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_137:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 2933: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3e46130  ! 2935: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5c000  ! 2936: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_241:
	setx	0x350130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x340009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e44000  ! 2942: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e5c000  ! 2952: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_243:
	setx	0x370205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2959: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_138:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 2962: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e5217e  ! 2963: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_244:
	setx	0x350308, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_140:
	mov	0x16, %r14
	.word 0xf4db89e0  ! 2977: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_245:
	setx	0x37012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_139:
	mov	0x38, %r14
	.word 0xf2f38400  ! 2982: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe4c000  ! 2986: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_141:
	mov	0x37, %r14
	.word 0xf2db84a0  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5e4c000  ! 2991: SAVE_R	save	%r19, %r0, %r26
	.word 0xb93df001  ! 2992: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xb3e54000  ! 2993: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_246:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 2)
	.word 0xbb2da001  ! 3002: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xb5e58000  ! 3003: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e4a189  ! 3005: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 3006: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbf347001  ! 3007: SRLX_I	srlx	%r17, 0x0001, %r31
T0_asi_reg_rd_143:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 3008: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_247:
	setx	0x340215, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_144:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0x8995214c  ! 3017: WRPR_TICK_I	wrpr	%r20, 0x014c, %tick
	.word 0xbd643801  ! 3020: MOVcc_I	<illegal instruction>
	.word 0xbfe58000  ! 3023: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e50000  ! 3024: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_248:
	setx	0x360025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 3030: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_249:
	setx	0x370033, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 3034: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb21c8000  ! 3035: XOR_R	xor 	%r18, %r0, %r25
	.word 0xbfe4219e  ! 3038: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_250:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_141:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 3042: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_251:
	setx	0x36010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 3046: SAVE_R	save	%r21, %r0, %r25
	.word 0xb9e461a7  ! 3050: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e5a14f  ! 3053: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e44000  ! 3055: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_142:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 3057: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe50000  ! 3061: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_143:
	mov	0x28, %r14
	.word 0xfef38400  ! 3063: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_252:
	setx	0x340225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 3065: SAVE_R	save	%r22, %r0, %r31
	.word 0xb1e5a09d  ! 3067: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_253:
	setx	0x36032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_254:
	setx	0x360133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e4e118  ! 3077: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5206f  ! 3080: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8195e131  ! 3082: WRPR_TPC_I	wrpr	%r23, 0x0131, %tpc
T0_asi_reg_wr_144:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 3086: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe5e0aa  ! 3097: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_145:
	mov	0x30, %r14
	.word 0xf0db8e60  ! 3100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_146:
	mov	0x10, %r14
	.word 0xfedb89e0  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_147:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe42048  ! 3104: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba2c61f2  ! 3106: ANDN_I	andn 	%r17, 0x01f2, %r29
T0_asi_reg_wr_145:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3108: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_255:
	setx	0x36030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_256:
	setx	0x340114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e56125  ! 3116: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e44000  ! 3118: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_146:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3120: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe4614d  ! 3123: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e5a0af  ! 3125: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e42136  ! 3126: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e40000  ! 3127: SAVE_R	save	%r16, %r0, %r26
	.word 0xbe8d0000  ! 3132: ANDcc_R	andcc 	%r20, %r0, %r31
cpu_intr_0_257:
	setx	0x340004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e098  ! 3134: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_147:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 3135: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 13)
	.word 0xb80d0000  ! 3138: AND_R	and 	%r20, %r0, %r28
cpu_intr_0_258:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x370110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_148:
	mov	0x5, %r14
	.word 0xf8db8e60  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_148:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 3153: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5e50000  ! 3156: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_149:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 3158: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_150:
	mov	0x16, %r14
	.word 0xf6f38400  ! 3159: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbd3c9000  ! 3160: SRAX_R	srax	%r18, %r0, %r30
cpu_intr_0_260:
	setx	0x36030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe40000  ! 3165: SAVE_R	save	%r16, %r0, %r31
	.word 0xb22de162  ! 3167: ANDN_I	andn 	%r23, 0x0162, %r25
	.word 0xb7e4a123  ! 3168: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e5a14b  ! 3171: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbe35c000  ! 3172: ORN_R	orn 	%r23, %r0, %r31
cpu_intr_0_261:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a03c  ! 3174: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_151:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 3175: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_262:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe5607a  ! 3182: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_263:
	setx	0x3b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_264:
	setx	0x38001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe350000  ! 3188: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xb5e50000  ! 3189: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_149:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 3193: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1e52190  ! 3194: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e50000  ! 3195: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e48000  ! 3196: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e5e1da  ! 3197: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e521c8  ! 3201: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_265:
	setx	0x380039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_152:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 3205: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e4a05e  ! 3208: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_150:
	mov	0x34, %r14
	.word 0xf8db8400  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_153:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3214: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_266:
	setx	0x3a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_154:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 3217: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7e50000  ! 3227: SAVE_R	save	%r20, %r0, %r27
	.word 0xbc8c8000  ! 3228: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xb9e48000  ! 3229: SAVE_R	save	%r18, %r0, %r28
	.word 0xb2bc8000  ! 3230: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xb43de111  ! 3231: XNOR_I	xnor 	%r23, 0x0111, %r26
	.word 0xb5e54000  ! 3232: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e5c000  ! 3235: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1510000  ! 3238: RDPR_TICK	<illegal instruction>
	.word 0xb3e5c000  ! 3241: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe48000  ! 3242: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_151:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 3245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_152:
	mov	0x1e, %r14
	.word 0xf8db84a0  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_153:
	mov	0x25, %r14
	.word 0xf6db8e60  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1e48000  ! 3257: SAVE_R	save	%r18, %r0, %r24
	.word 0xb7e421fe  ! 3258: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e58000  ! 3263: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e44000  ! 3265: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_155:
	mov	0x17, %r14
	.word 0xf2f38400  ! 3267: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_154:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe58000  ! 3271: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_155:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 3273: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_267:
	setx	0x3a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x380019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_269:
	setx	0x380112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0c5  ! 3280: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe58000  ! 3286: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_270:
	setx	0x3a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_156:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb37dc400  ! 3301: MOVR_R	movre	%r23, %r0, %r25
cpu_intr_0_271:
	setx	0x39002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, b)
	.word 0xb17c0400  ! 3304: MOVR_R	movre	%r16, %r0, %r24
	.word 0xb1e4e009  ! 3306: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb414c000  ! 3308: OR_R	or 	%r19, %r0, %r26
	.word 0xb9e5c000  ! 3310: SAVE_R	save	%r23, %r0, %r28
	.word 0xba84a09c  ! 3318: ADDcc_I	addcc 	%r18, 0x009c, %r29
	.word 0xb1e50000  ! 3322: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_272:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63cc000  ! 3326: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xbde50000  ! 3327: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_157:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 3328: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_156:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 3330: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_158:
	mov	0x30, %r14
	.word 0xf6db8e80  ! 3333: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbde40000  ! 3334: SAVE_R	save	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde44000  ! 3337: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e58000  ! 3339: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e56014  ! 3341: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e421fe  ! 3342: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_159:
	mov	0x30, %r14
	.word 0xf4db8e80  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_157:
	mov	0x1, %r14
	.word 0xfef38400  ! 3346: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbde560d0  ! 3347: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_273:
	setx	0x390122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x390233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x380115, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_160:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_276:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e421db  ! 3359: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_277:
	setx	0x390232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e02d  ! 3365: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_161:
	mov	0x2b, %r14
	.word 0xfadb8e80  ! 3366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 18)
	.word 0xb43d4000  ! 3369: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb5e54000  ! 3370: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e5e09a  ! 3371: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_278:
	setx	0x380008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_279:
	setx	0x3b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 3374: SAVE_R	save	%r18, %r0, %r24
	.word 0xbc84613e  ! 3375: ADDcc_I	addcc 	%r17, 0x013e, %r30
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe48000  ! 3382: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 3383: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_280:
	setx	0x39023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_281:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56155  ! 3387: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe56047  ! 3391: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e58000  ! 3392: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e52110  ! 3393: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_282:
	setx	0x39030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_163:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 3400: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_158:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 3402: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_159:
	mov	0x7, %r14
	.word 0xfaf38e80  ! 3404: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e4607a  ! 3406: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_160:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 3408: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7e44000  ! 3411: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_283:
	setx	0x3b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 3417: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_284:
	setx	0x38033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_285:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e4607b  ! 3427: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_286:
	setx	0x390006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, b)
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_287:
	setx	0x3a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52049  ! 3444: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e460d9  ! 3446: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_288:
	setx	0x380309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 3456: SAVE_R	save	%r17, %r0, %r25
	.word 0xb6bce015  ! 3457: XNORcc_I	xnorcc 	%r19, 0x0015, %r27
cpu_intr_0_289:
	setx	0x3b0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_290:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e420dd  ! 3463: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_291:
	setx	0x380010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_292:
	setx	0x3b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe50000  ! 3472: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e58000  ! 3481: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_161:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 3488: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_293:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde521be  ! 3492: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4e0c3  ! 3493: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e520e2  ! 3494: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbcad0000  ! 3495: ANDNcc_R	andncc 	%r20, %r0, %r30
	.word 0xb7e50000  ! 3497: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e54000  ! 3502: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e4216d  ! 3503: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_162:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 3505: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_294:
	setx	0x380107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d2187  ! 3510: XORcc_I	xorcc 	%r20, 0x0187, %r28
cpu_intr_0_295:
	setx	0x3b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e071  ! 3514: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb80d0000  ! 3515: AND_R	and 	%r20, %r0, %r28
T0_asi_reg_wr_163:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 3516: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7510000  ! 3517: RDPR_TICK	<illegal instruction>
T0_asi_reg_rd_165:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5614a  ! 3523: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_296:
	setx	0x380223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e561c3  ! 3527: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_297:
	setx	0x3b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1d6  ! 3531: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e54000  ! 3533: SAVE_R	save	%r21, %r0, %r26
	.word 0xb7e5a158  ! 3534: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_164:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 3536: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_298:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_165:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 3540: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_166:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 3542: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_166:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 3545: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbebcc000  ! 3546: XNORcc_R	xnorcc 	%r19, %r0, %r31
T0_asi_reg_rd_167:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_299:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x9, %r14
	.word 0xf4f38400  ! 3549: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_168:
	mov	0x1, %r14
	.word 0xfcdb8e80  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_300:
	setx	0x39023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_302:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4e16c  ! 3558: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_168:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 3559: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e40000  ! 3564: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_303:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3567: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e460aa  ! 3571: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe5a12f  ! 3573: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_304:
	setx	0x390313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a01d  ! 3576: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5611d  ! 3577: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e521c1  ! 3579: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_169:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 3580: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5e48000  ! 3584: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_170:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 3585: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 3587: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_305:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1c9  ! 3591: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e5c000  ! 3596: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe54000  ! 3598: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_169:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_306:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_307:
	setx	0x3b0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a166  ! 3606: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_308:
	setx	0x380012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_171:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 3612: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_309:
	setx	0x390300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3619: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_172:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 3620: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x9195a1d2  ! 3622: WRPR_PIL_I	wrpr	%r22, 0x01d2, %pil
cpu_intr_0_310:
	setx	0x3c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42128  ! 3627: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e4c000  ! 3629: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e5a1de  ! 3630: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_311:
	setx	0x3d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c8000  ! 3633: XNOR_R	xnor 	%r18, %r0, %r26
T0_asi_reg_rd_171:
	mov	0x2c, %r14
	.word 0xfedb8e80  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 28)
	.word 0xbb2d1000  ! 3640: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xb5e50000  ! 3641: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe54000  ! 3643: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbb643801  ! 3647: MOVcc_I	<illegal instruction>
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9345000  ! 3650: SRLX_R	srlx	%r17, %r0, %r28
T0_asi_reg_wr_173:
	mov	0x37, %r14
	.word 0xf4f38400  ! 3654: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 29)
	.word 0xb28da045  ! 3659: ANDcc_I	andcc 	%r22, 0x0045, %r25
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb52d4000  ! 3662: SLL_R	sll 	%r21, %r0, %r26
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_172:
	mov	0x5, %r14
	.word 0xf4db89e0  ! 3666: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_312:
	setx	0x3e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_313:
	setx	0x3c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e02e  ! 3675: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_314:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521ed  ! 3681: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5a0db  ! 3683: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbe35e0f9  ! 3684: ORN_I	orn 	%r23, 0x00f9, %r31
	.word 0xbfe42121  ! 3685: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e54000  ! 3687: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 15)
	.word 0xbc8c215b  ! 3689: ANDcc_I	andcc 	%r16, 0x015b, %r30
	.word 0xb6248000  ! 3690: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbde420d7  ! 3693: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_173:
	mov	0x37, %r14
	.word 0xfedb8e80  ! 3694: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_316:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e4e017  ! 3700: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_317:
	setx	0x3e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3706: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_318:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_319:
	setx	0x3e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x2a, %r14
	.word 0xfcf38e60  ! 3710: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_320:
	setx	0x3d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_174:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_175:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 3719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_175:
	mov	0x36, %r14
	.word 0xfef38e40  ! 3720: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_321:
	setx	0x3d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e063  ! 3729: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e520f1  ! 3737: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e4205a  ! 3738: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e44000  ! 3740: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde4c000  ! 3742: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_176:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_322:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_177:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4208c  ! 3761: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe46030  ! 3762: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_323:
	setx	0x3e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_324:
	setx	0x3c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_176:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 3776: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_325:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a089  ! 3781: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb77d4400  ! 3782: MOVR_R	movre	%r21, %r0, %r27
T0_asi_reg_wr_177:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 3785: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_326:
	setx	0x3f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3792: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_327:
	setx	0x3f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_328:
	setx	0x3f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 3800: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e420c9  ! 3801: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_178:
	mov	0x1b, %r14
	.word 0xfcdb8e80  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_329:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 3805: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3e5c000  ! 3806: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_330:
	setx	0x3f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42166  ! 3819: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_178:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 3827: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_331:
	setx	0x3c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3837: SAVE_R	save	%r17, %r0, %r31
	.word 0xbe34c000  ! 3839: ORN_R	orn 	%r19, %r0, %r31
cpu_intr_0_332:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 3851: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_179:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 3854: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe56074  ! 3856: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3860: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3e4e0b8  ! 3862: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e50000  ! 3864: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_181:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe4c000  ! 3877: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e4a1dd  ! 3878: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_333:
	setx	0x3e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, d)
	.word 0xbde58000  ! 3887: SAVE_R	save	%r22, %r0, %r30
	.word 0xbc350000  ! 3888: ORN_R	orn 	%r20, %r0, %r30
T0_asi_reg_rd_182:
	mov	0x33, %r14
	.word 0xf0db8e80  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb29c8000  ! 3892: XORcc_R	xorcc 	%r18, %r0, %r25
cpu_intr_0_334:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e46174  ! 3896: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe54000  ! 3900: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e42179  ! 3901: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe4c000  ! 3902: SAVE_R	save	%r19, %r0, %r29
	.word 0xb7e4211f  ! 3905: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_335:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 3908: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe42033  ! 3910: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e5a00d  ! 3915: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb824a0fc  ! 3917: SUB_I	sub 	%r18, 0x00fc, %r28
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_181:
	mov	0x1b, %r14
	.word 0xfef38e80  ! 3922: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbbe5c000  ! 3925: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_336:
	setx	0x3c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e54000  ! 3930: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_337:
	setx	0x3f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_338:
	setx	0x3f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 3936: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde54000  ! 3937: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe40000  ! 3938: SAVE_R	save	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5611b  ! 3940: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5213a  ! 3942: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_182:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 3944: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 3947: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_183:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe5206e  ! 3957: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde460cd  ! 3958: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e133  ! 3959: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_184:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe50000  ! 3969: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_340:
	setx	0x3c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0c4  ! 3974: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_183:
	mov	0x25, %r14
	.word 0xfef389e0  ! 3976: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb0c4a0fd  ! 3981: ADDCcc_I	addccc 	%r18, 0x00fd, %r24
	.word 0xb0a58000  ! 3984: SUBcc_R	subcc 	%r22, %r0, %r24
T0_asi_reg_rd_185:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7e420e5  ! 3989: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e561e1  ! 3990: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_341:
	setx	0x3e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 3992: SRLX_R	srlx	%r16, %r0, %r26
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e58000  ! 3998: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_184:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 3999: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb8b56127  ! 4003: ORNcc_I	orncc 	%r21, 0x0127, %r28
	.word 0xb9e54000  ! 4005: SAVE_R	save	%r21, %r0, %r28
	.word 0xb7e54000  ! 4006: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_342:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x3e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a0a4  ! 4023: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_344:
	setx	0x3c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4028: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_186:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_345:
	setx	0x3f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_186:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 4040: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_346:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4047: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde520a2  ! 4050: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e5a1d6  ! 4051: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_347:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_187:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4055: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe46190  ! 4057: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e5e098  ! 4059: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_187:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 4060: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_188:
	mov	0x17, %r14
	.word 0xfedb84a0  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_188:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 4069: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb1e44000  ! 4073: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_348:
	setx	0x3d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_349:
	setx	0x3c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x3d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d2401  ! 4081: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb33c8000  ! 4082: SRA_R	sra 	%r18, %r0, %r25
	.word 0xb5e48000  ! 4085: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe5c000  ! 4089: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_189:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 4092: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e5c000  ! 4093: SAVE_R	save	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_189:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 4095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_351:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334c000  ! 4099: SRL_R	srl 	%r19, %r0, %r25
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde50000  ! 4105: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde40000  ! 4109: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe460d7  ! 4113: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e42036  ! 4114: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbd508000  ! 4117: RDPR_TSTATE	<illegal instruction>
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb405a1cb  ! 4123: ADD_I	add 	%r22, 0x01cb, %r26
	.word 0xb1518000  ! 4124: RDPR_PSTATE	<illegal instruction>
	.word 0xbc3ce081  ! 4125: XNOR_I	xnor 	%r19, 0x0081, %r30
	.word 0xb2bd4000  ! 4126: XNORcc_R	xnorcc 	%r21, %r0, %r25
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb224c000  ! 4133: SUB_R	sub 	%r19, %r0, %r25
cpu_intr_0_352:
	setx	0x42001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_190:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 4135: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde4a154  ! 4137: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_191:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 4140: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_353:
	setx	0x420101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c7001  ! 4146: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0xb3e54000  ! 4148: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde52179  ! 4152: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4a192  ! 4157: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_190:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe58000  ! 4161: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, a)
	.word 0xb5e5a1a6  ! 4166: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe50000  ! 4169: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde4a18a  ! 4172: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e5a00d  ! 4181: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e44000  ! 4185: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_192:
	mov	0x19, %r14
	.word 0xf4f38e60  ! 4189: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_193:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 4191: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb73dd000  ! 4195: SRAX_R	srax	%r23, %r0, %r27
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e5604e  ! 4198: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde54000  ! 4201: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_354:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a052  ! 4203: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb72df001  ! 4204: SLLX_I	sllx	%r23, 0x0001, %r27
T0_asi_reg_rd_191:
	mov	0x15, %r14
	.word 0xfcdb84a0  ! 4205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_194:
	mov	0x2, %r14
	.word 0xfef38400  ! 4208: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_195:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 4210: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e5e0be  ! 4211: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_192:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde421b1  ! 4216: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5c000  ! 4219: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_355:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4222: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_193:
	mov	0x24, %r14
	.word 0xf8db8e80  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_356:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4230: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_357:
	setx	0x41021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x400008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45c000  ! 4236: ADDC_R	addc 	%r23, %r0, %r29
cpu_intr_0_359:
	setx	0x400238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5a160  ! 4239: ORNcc_I	orncc 	%r22, 0x0160, %r30
	.word 0xb9e48000  ! 4244: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_196:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 4246: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_360:
	setx	0x430026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5217c  ! 4248: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e055  ! 4250: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_361:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_362:
	setx	0x42003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_197:
	mov	0x1d, %r14
	.word 0xf2f389e0  ! 4260: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe4e164  ! 4265: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e52054  ! 4267: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_194:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_195:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_363:
	setx	0x430034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 4277: SAVE_R	save	%r17, %r0, %r30
	.word 0xb13c0000  ! 4280: SRA_R	sra 	%r16, %r0, %r24
	.word 0xb1e4c000  ! 4283: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_196:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_197:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1e4e132  ! 4287: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e40000  ! 4288: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_198:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 4289: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfe50000  ! 4291: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_364:
	setx	0x42011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca420f4  ! 4296: SUBcc_I	subcc 	%r16, 0x00f4, %r30
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e5e029  ! 4302: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_365:
	setx	0x43022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560fa  ! 4307: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, e)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_366:
	setx	0x420322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_367:
	setx	0x430212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_198:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 4327: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e5e0ef  ! 4329: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_368:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_369:
	setx	0x410101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4333: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_370:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7cc400  ! 4339: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb08dc000  ! 4341: ANDcc_R	andcc 	%r23, %r0, %r24
cpu_intr_0_371:
	setx	0x43031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_200:
	mov	0x33, %r14
	.word 0xf4db8400  ! 4346: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_199:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 4347: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4348: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_201:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4349: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1e56104  ! 4350: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_372:
	setx	0x420301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_373:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_201:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0x81952105  ! 4359: WRPR_TPC_I	wrpr	%r20, 0x0105, %tpc
	.word 0xb7e48000  ! 4360: SAVE_R	save	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe4a0f9  ! 4366: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_202:
	mov	0x30, %r14
	.word 0xfcdb89e0  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_374:
	setx	0x400323, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_202:
	mov	0x12, %r14
	.word 0xf4f38e80  ! 4377: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_375:
	setx	0x400313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_376:
	setx	0x43022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 4387: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_204:
	mov	0x32, %r14
	.word 0xfcdb8e60  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_204:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 4391: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7e58000  ! 4393: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_205:
	mov	0x12, %r14
	.word 0xfef38e40  ! 4402: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_205:
	mov	0x32, %r14
	.word 0xf2db84a0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_377:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_378:
	setx	0x41000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_379:
	setx	0x430128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_380:
	setx	0x410123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 3)
	.word 0xb80c0000  ! 4433: AND_R	and 	%r16, %r0, %r28
cpu_intr_0_381:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 4436: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e4c000  ! 4437: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, a)
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe44000  ! 4444: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_206:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 4445: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 4454: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe50000  ! 4459: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_382:
	setx	0x43030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42077  ! 4465: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb245c000  ! 4468: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xb08d615d  ! 4470: ANDcc_I	andcc 	%r21, 0x015d, %r24
cpu_intr_0_383:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77cc400  ! 4472: MOVR_R	movre	%r19, %r0, %r27
cpu_intr_0_384:
	setx	0x400313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_385:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_386:
	setx	0x400235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97c0400  ! 4484: MOVR_R	movre	%r16, %r0, %r28
	.word 0xbde560b3  ! 4486: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e4e05a  ! 4487: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4a5a0db  ! 4488: SUBcc_I	subcc 	%r22, 0x00db, %r26
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_207:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 4493: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_387:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_388:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 4500: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_389:
	setx	0x420220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_390:
	setx	0x42013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1cb  ! 4509: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_208:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e44000  ! 4520: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_207:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 4521: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_208:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 4523: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_209:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 4525: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e46093  ! 4529: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_209:
	mov	0x8, %r14
	.word 0xf4db8400  ! 4532: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e54000  ! 4533: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe4a078  ! 4534: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e4a07e  ! 4536: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4c000  ! 4538: SAVE_R	save	%r19, %r0, %r25
	.word 0xb5e4e011  ! 4540: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_210:
	mov	0x2d, %r14
	.word 0xf8f389e0  ! 4542: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_391:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_392:
	setx	0x42020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_211:
	mov	0x2, %r14
	.word 0xf8db8e60  ! 4551: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe40000  ! 4552: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_393:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe52183  ! 4555: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_212:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 4557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e56059  ! 4560: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_211:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 4564: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e4215f  ! 4566: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde40000  ! 4567: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_394:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4574: SAVE_R	save	%r22, %r0, %r31
	.word 0xb73c2001  ! 4577: SRA_I	sra 	%r16, 0x0001, %r27
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe54000  ! 4581: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde5c000  ! 4583: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_213:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 4587: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_395:
	setx	0x45002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7350000  ! 4597: SRL_R	srl 	%r20, %r0, %r27
	.word 0xb0bdc000  ! 4598: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xbfe560d9  ! 4600: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4c000  ! 4601: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e48000  ! 4607: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde4e19a  ! 4610: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_396:
	setx	0x450031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_397:
	setx	0x440111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_212:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 4618: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb48d60ce  ! 4619: ANDcc_I	andcc 	%r21, 0x00ce, %r26
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe54000  ! 4622: SAVE_R	save	%r21, %r0, %r31
	.word 0x87956199  ! 4623: WRPR_TT_I	wrpr	%r21, 0x0199, %tt
cpu_intr_0_398:
	setx	0x470108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5201f  ! 4625: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a0b2  ! 4627: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_214:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_215:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb4bcc000  ! 4634: XNORcc_R	xnorcc 	%r19, %r0, %r26
	.word 0xb6b5c000  ! 4635: SUBCcc_R	orncc 	%r23, %r0, %r27
cpu_intr_0_399:
	setx	0x450125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_216:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_400:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a027  ! 4641: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e461ed  ! 4642: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e4e04a  ! 4647: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4a00e  ! 4648: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4c000  ! 4649: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e46179  ! 4651: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_401:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_217:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_218:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 3a)
	.word 0x8f902001  ! 4666: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T0_asi_reg_rd_219:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb57d6401  ! 4669: MOVR_I	movre	%r21, 0x1, %r26
T0_asi_reg_rd_220:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_213:
	mov	0x21, %r14
	.word 0xfaf38e60  ! 4672: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_402:
	setx	0x470101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4675: SAVE_R	save	%r17, %r0, %r25
	.word 0xbbe5e125  ! 4679: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e42010  ! 4682: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbe0dc000  ! 4683: AND_R	and 	%r23, %r0, %r31
	.word 0x8d956004  ! 4684: WRPR_PSTATE_I	wrpr	%r21, 0x0004, %pstate
	.word 0xb5e421c1  ! 4685: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_403:
	setx	0x440304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 4696: SAVE_R	save	%r23, %r0, %r30
	.word 0xb0a5c000  ! 4699: SUBcc_R	subcc 	%r23, %r0, %r24
	.word 0xbb510000  ! 4700: RDPR_TICK	<illegal instruction>
	.word 0xb7e4c000  ! 4701: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e48000  ! 4703: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e50000  ! 4706: SAVE_R	save	%r20, %r0, %r26
	.word 0xb284619c  ! 4712: ADDcc_I	addcc 	%r17, 0x019c, %r25
	.word 0xbde44000  ! 4713: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e5a110  ! 4715: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e4a01a  ! 4717: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e5e0de  ! 4719: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e50000  ! 4720: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e54000  ! 4721: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_404:
	setx	0x47020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e461d6  ! 4735: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5616a  ! 4736: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e1e5  ! 4740: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb135e001  ! 4742: SRL_I	srl 	%r23, 0x0001, %r24
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe4609c  ! 4745: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_221:
	mov	0x37, %r14
	.word 0xfedb8e60  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e56094  ! 4753: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e40000  ! 4755: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe4a0c8  ! 4758: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e48000  ! 4759: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_222:
	mov	0x3, %r14
	.word 0xf0db8400  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_405:
	setx	0x460129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7357001  ! 4765: SRLX_I	srlx	%r21, 0x0001, %r27
T0_asi_reg_rd_223:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e46121  ! 4777: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde5a13c  ! 4782: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e520f5  ! 4783: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_406:
	setx	0x45010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe58000  ! 4793: SAVE_R	save	%r22, %r0, %r31
	.word 0xb93d1000  ! 4794: SRAX_R	srax	%r20, %r0, %r28
	.word 0xb7520000  ! 4795: RDPR_PIL	<illegal instruction>
	.word 0xb1e4601b  ! 4798: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4218f  ! 4799: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_214:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 4800: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbc8c61c7  ! 4802: ANDcc_I	andcc 	%r17, 0x01c7, %r30
T0_asi_reg_rd_224:
	mov	0x1c, %r14
	.word 0xf6db8e60  ! 4804: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde54000  ! 4806: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4e09e  ! 4808: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_407:
	setx	0x45010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4816: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_408:
	setx	0x440100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 4818: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_215:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4820: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_216:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 4823: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e5e09a  ! 4824: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_409:
	setx	0x46013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_410:
	setx	0x44023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4829: SAVE_R	save	%r23, %r0, %r31
	.word 0xb534a001  ! 4832: SRL_I	srl 	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e50000  ! 4836: SAVE_R	save	%r20, %r0, %r27
	.word 0xb72d4000  ! 4839: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbde4e15a  ! 4842: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_411:
	setx	0x460239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_217:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4847: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e58000  ! 4848: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e5e15e  ! 4849: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_412:
	setx	0x450230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3de175  ! 4856: XNOR_I	xnor 	%r23, 0x0175, %r30
	.word 0xbbe54000  ! 4861: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e54000  ! 4862: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe5a01e  ! 4863: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_218:
	mov	0x22, %r14
	.word 0xfef38e80  ! 4873: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbfe421f9  ! 4874: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_413:
	setx	0x47001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_414:
	setx	0x450127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4884: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_415:
	setx	0x440105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 4886: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e58000  ! 4890: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_416:
	setx	0x460301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_417:
	setx	0x450134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_219:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4898: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 4899: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_418:
	setx	0x460009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4902: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_419:
	setx	0x45030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4908: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e420c4  ! 4909: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe4a0d3  ! 4911: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_420:
	setx	0x440308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3da064  ! 4916: XNOR_I	xnor 	%r22, 0x0064, %r30
	.word 0xbde4e0df  ! 4918: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_220:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 4922: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_221:
	mov	0x38, %r14
	.word 0xfcf38400  ! 4930: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbead203c  ! 4932: ANDNcc_I	andncc 	%r20, 0x003c, %r31
T0_asi_reg_rd_225:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 4934: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e56189  ! 4936: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_226:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbbe56182  ! 4938: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e44000  ! 4940: SAVE_R	save	%r17, %r0, %r25
	.word 0xbe858000  ! 4942: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0xbde560e1  ! 4949: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e461e3  ! 4950: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde4c000  ! 4953: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e54000  ! 4955: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e4e1e8  ! 4957: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb33cc000  ! 4962: SRA_R	sra 	%r19, %r0, %r25
	.word 0xb3e40000  ! 4966: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_421:
	setx	0x46011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e06b  ! 4977: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4600c  ! 4981: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb93cd000  ! 4982: SRAX_R	srax	%r19, %r0, %r28
	.word 0xb5e460c7  ! 4984: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe44000  ! 4985: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_422:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46099  ! 4988: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe54000  ! 4991: SAVE_R	save	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e52178  ! 4994: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5c000  ! 4995: SAVE_R	save	%r23, %r0, %r28
	.word 0xbbe58000  ! 4996: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_423:
	setx	0x46001f, %g1, %o0
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
	.word 0xf075c000  ! 4: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xbe95c000  ! 5: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xfa3520fe  ! 9: STH_I	sth	%r29, [%r20 + 0x00fe]
T3_asi_reg_wr_0:
	mov	0x2a, %r14
	.word 0xf8f38e60  ! 10: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbcb48000  ! 11: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0xfc242021  ! 13: STW_I	stw	%r30, [%r16 + 0x0021]
cpu_intr_3_0:
	setx	0x1c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_0:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_1:
	setx	0x1f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8344000  ! 31: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf835e076  ! 32: STH_I	sth	%r28, [%r23 + 0x0076]
cpu_intr_3_2:
	setx	0x1d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 34: MOVcc_I	<illegal instruction>
	.word 0xfeac4020  ! 36: STBA_R	stba	%r31, [%r17 + %r0] 0x01
	.word 0xf4a48020  ! 38: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xfcacc020  ! 40: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xbf3d9000  ! 41: SRAX_R	srax	%r22, %r0, %r31
	.word 0xf2b58020  ! 44: STHA_R	stha	%r25, [%r22 + %r0] 0x01
T3_asi_reg_wr_1:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 46: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_3:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_4:
	setx	0x1c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 13)
	.word 0xf074e09f  ! 59: STX_I	stx	%r24, [%r19 + 0x009f]
cpu_intr_3_5:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb348000  ! 64: SRL_R	srl 	%r18, %r0, %r29
T3_asi_reg_wr_2:
	mov	0x20, %r14
	.word 0xf2f38400  ! 65: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_6:
	setx	0x1d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_2:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf0ade0eb  ! 71: STBA_I	stba	%r24, [%r23 + 0x00eb] %asi
	.word 0xf6a4e1ff  ! 72: STWA_I	stwa	%r27, [%r19 + 0x01ff] %asi
	.word 0xfe2c8000  ! 73: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfa358000  ! 75: STH_R	sth	%r29, [%r22 + %r0]
T3_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 77: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf43520bf  ! 81: STH_I	sth	%r26, [%r20 + 0x00bf]
	.word 0xfaad60ad  ! 82: STBA_I	stba	%r29, [%r21 + 0x00ad] %asi
	.word 0xb28c8000  ! 83: ANDcc_R	andcc 	%r18, %r0, %r25
cpu_intr_3_7:
	setx	0x1d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_4:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 85: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0b56180  ! 86: STHA_I	stha	%r24, [%r21 + 0x0180] %asi
T3_asi_reg_rd_3:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 89: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_HPRIV
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, e)
	.word 0xfe24a116  ! 97: STW_I	stw	%r31, [%r18 + 0x0116]
	.word 0xb634e1b9  ! 98: ORN_I	orn 	%r19, 0x01b9, %r27
T3_asi_reg_rd_4:
	mov	0x2a, %r14
	.word 0xf4db8e80  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfca44020  ! 101: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 39)
	.word 0xfea461f5  ! 107: STWA_I	stwa	%r31, [%r17 + 0x01f5] %asi
	.word 0xf6348000  ! 109: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf275a04d  ! 110: STX_I	stx	%r25, [%r22 + 0x004d]
T3_asi_reg_rd_5:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcb5c020  ! 112: STHA_R	stha	%r30, [%r23 + %r0] 0x01
cpu_intr_3_8:
	setx	0x1e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6754000  ! 115: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xb2944000  ! 116: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xf0a48020  ! 117: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf4a5a022  ! 119: STWA_I	stwa	%r26, [%r22 + 0x0022] %asi
cpu_intr_3_9:
	setx	0x1f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, c)
	.word 0xf6256179  ! 122: STW_I	stw	%r27, [%r21 + 0x0179]
T3_asi_reg_wr_5:
	mov	0x1, %r14
	.word 0xf2f38e60  ! 127: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf074c000  ! 129: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xbf520000  ! 130: RDPR_PIL	rdpr	%pil, %r31
cpu_intr_3_10:
	setx	0x1c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2560bb  ! 133: SUB_I	sub 	%r21, 0x00bb, %r31
cpu_intr_3_11:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 17)
	.word 0xf4340000  ! 136: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfab56001  ! 138: STHA_I	stha	%r29, [%r21 + 0x0001] %asi
T3_asi_reg_rd_6:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfa2da14d  ! 141: STB_I	stb	%r29, [%r22 + 0x014d]
T3_asi_reg_rd_7:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_rd_8:
	mov	0x30, %r14
	.word 0xfedb8e60  ! 144: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_9:
	mov	0x29, %r14
	.word 0xfedb84a0  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb51c000  ! 146: RDPR_TL	<illegal instruction>
cpu_intr_3_12:
	setx	0x1e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23560fb  ! 148: ORN_I	orn 	%r21, 0x00fb, %r25
cpu_intr_3_13:
	setx	0x1c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_10:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0754000  ! 164: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xbc3cc000  ! 166: XNOR_R	xnor 	%r19, %r0, %r30
T3_asi_reg_wr_6:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 168: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_11:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe240000  ! 171: STW_R	stw	%r31, [%r16 + %r0]
T3_asi_reg_wr_7:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 172: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfa2c0000  ! 173: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf624e101  ! 175: STW_I	stw	%r27, [%r19 + 0x0101]
cpu_intr_3_15:
	setx	0x1e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_8:
	mov	0xb, %r14
	.word 0xf6f38400  ! 177: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xfca44020  ! 182: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xfe740000  ! 183: STX_R	stx	%r31, [%r16 + %r0]
T3_asi_reg_wr_9:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 184: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xba35e1da  ! 188: ORN_I	orn 	%r23, 0x01da, %r29
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb8044000  ! 190: ADD_R	add 	%r17, %r0, %r28
	.word 0xf275e081  ! 192: STX_I	stx	%r25, [%r23 + 0x0081]
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_16:
	setx	0x1c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaadc020  ! 201: STBA_R	stba	%r29, [%r23 + %r0] 0x01
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4ad21ce  ! 203: STBA_I	stba	%r26, [%r20 + 0x01ce] %asi
cpu_intr_3_17:
	setx	0x1c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_12:
	mov	0x29, %r14
	.word 0xfedb8400  ! 209: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_10:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 212: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5641800  ! 214: MOVcc_R	<illegal instruction>
	.word 0xf2ad20fa  ! 216: STBA_I	stba	%r25, [%r20 + 0x00fa] %asi
	.word 0xf4a4614f  ! 217: STWA_I	stwa	%r26, [%r17 + 0x014f] %asi
T3_asi_reg_rd_13:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_18:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 33)
	.word 0xf424e1fa  ! 224: STW_I	stw	%r26, [%r19 + 0x01fa]
	.word 0xfaa5216e  ! 225: STWA_I	stwa	%r29, [%r20 + 0x016e] %asi
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_20:
	setx	0x1d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_21:
	setx	0x1d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 236: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf4f5e1c1  ! 238: STXA_I	stxa	%r26, [%r23 + 0x01c1] %asi
	.word 0xfe3521ec  ! 239: STH_I	sth	%r31, [%r20 + 0x01ec]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf8a44020  ! 245: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
T3_asi_reg_rd_14:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 247: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_22:
	setx	0x1f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ad0  ! 249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad0, %hpstate
	.word 0xf0256043  ! 250: STW_I	stw	%r24, [%r21 + 0x0043]
	.word 0xfaac0020  ! 251: STBA_R	stba	%r29, [%r16 + %r0] 0x01
cpu_intr_3_23:
	setx	0x1f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 256: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_24:
	setx	0x1f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_15:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_12:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 264: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf6244000  ! 265: STW_R	stw	%r27, [%r17 + %r0]
cpu_intr_3_25:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_26:
	setx	0x1f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc344000  ! 273: STH_R	sth	%r30, [%r17 + %r0]
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_16:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4a54020  ! 276: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xfa354000  ! 278: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_wr_13:
	mov	0x24, %r14
	.word 0xf2f384a0  ! 279: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_14:
	mov	0x27, %r14
	.word 0xf8f384a0  ! 284: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb52d3001  ! 285: SLLX_I	sllx	%r20, 0x0001, %r26
cpu_intr_3_27:
	setx	0x1c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac0020  ! 287: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xfe250000  ! 289: STW_R	stw	%r31, [%r20 + %r0]
cpu_intr_3_28:
	setx	0x1e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_15:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 293: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0254000  ! 296: STW_R	stw	%r24, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf6b5219c  ! 300: STHA_I	stha	%r27, [%r20 + 0x019c] %asi
T3_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 301: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfaac4020  ! 302: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf4f42124  ! 305: STXA_I	stxa	%r26, [%r16 + 0x0124] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0x919561d3  ! 310: WRPR_PIL_I	wrpr	%r21, 0x01d3, %pil
	.word 0xfcf46127  ! 311: STXA_I	stxa	%r30, [%r17 + 0x0127] %asi
T3_asi_reg_wr_17:
	mov	0x5, %r14
	.word 0xf2f389e0  ! 314: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_29:
	setx	0x1f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_30:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2ad8020  ! 323: STBA_R	stba	%r25, [%r22 + %r0] 0x01
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 17)
	.word 0xfa754000  ! 325: STX_R	stx	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6f4e05f  ! 327: STXA_I	stxa	%r27, [%r19 + 0x005f] %asi
cpu_intr_3_31:
	setx	0x1c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e12  ! 329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
cpu_intr_3_32:
	setx	0x1d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_33:
	setx	0x1d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_17:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_34:
	setx	0x1f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 23)
	.word 0xf6f520cb  ! 342: STXA_I	stxa	%r27, [%r20 + 0x00cb] %asi
	.word 0xb4ac0000  ! 343: ANDNcc_R	andncc 	%r16, %r0, %r26
T3_asi_reg_rd_18:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc7420d5  ! 348: STX_I	stx	%r30, [%r16 + 0x00d5]
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfcb5a0ec  ! 354: STHA_I	stha	%r30, [%r22 + 0x00ec] %asi
cpu_intr_3_35:
	setx	0x1d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_19:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_36:
	setx	0x1c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_37:
	setx	0x1f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_38:
	setx	0x1f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_39:
	setx	0x1d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 380: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf8a50020  ! 381: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf42c8000  ! 382: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_20:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfeb460e7  ! 390: STHA_I	stha	%r31, [%r17 + 0x00e7] %asi
	.word 0xfaa421c3  ! 391: STWA_I	stwa	%r29, [%r16 + 0x01c3] %asi
T3_asi_reg_wr_18:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 395: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_21:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_22:
	mov	0xa, %r14
	.word 0xf6db8e60  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf22c4000  ! 404: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 17)
	.word 0xf2f5a1d2  ! 416: STXA_I	stxa	%r25, [%r22 + 0x01d2] %asi
	.word 0xfc244000  ! 419: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf275a01c  ! 420: STX_I	stx	%r25, [%r22 + 0x001c]
T3_asi_reg_rd_23:
	mov	0x13, %r14
	.word 0xfcdb84a0  ! 423: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf6a521f1  ! 425: STWA_I	stwa	%r27, [%r20 + 0x01f1] %asi
	.word 0xf0f560e0  ! 426: STXA_I	stxa	%r24, [%r21 + 0x00e0] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xbc3d0000  ! 428: XNOR_R	xnor 	%r20, %r0, %r30
	.word 0xf4a4a107  ! 429: STWA_I	stwa	%r26, [%r18 + 0x0107] %asi
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_24:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_25:
	mov	0xa, %r14
	.word 0xf4db8400  ! 439: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3353001  ! 441: SRLX_I	srlx	%r20, 0x0001, %r25
T3_asi_reg_rd_26:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 18)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982952  ! 449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
T3_asi_reg_wr_19:
	mov	0x27, %r14
	.word 0xf6f38e80  ! 453: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_27:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6250000  ! 456: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf6a4c020  ! 459: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_20:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 462: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4bca057  ! 465: XNORcc_I	xnorcc 	%r18, 0x0057, %r26
	.word 0xf2b5e09b  ! 468: STHA_I	stha	%r25, [%r23 + 0x009b] %asi
T3_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 469: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_28:
	mov	0x2e, %r14
	.word 0xf4db8400  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 19)
	.word 0xb89c611f  ! 473: XORcc_I	xorcc 	%r17, 0x011f, %r28
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_40:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_29:
	mov	0xc, %r14
	.word 0xf4db8e80  ! 481: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_30:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfea5c020  ! 485: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0b5c020  ! 493: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xfe2c6039  ! 496: STB_I	stb	%r31, [%r17 + 0x0039]
	.word 0xf2356042  ! 497: STH_I	sth	%r25, [%r21 + 0x0042]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 20)
	.word 0xf62c204a  ! 499: STB_I	stb	%r27, [%r16 + 0x004a]
	.word 0xb3341000  ! 502: SRLX_R	srlx	%r16, %r0, %r25
T3_asi_reg_wr_22:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 504: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf2ad8020  ! 505: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_41:
	setx	0x20022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_23:
	mov	0x1e, %r14
	.word 0xf6f38e80  ! 511: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0358000  ! 516: STH_R	sth	%r24, [%r22 + %r0]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 18)
	.word 0xf4344000  ! 519: STH_R	sth	%r26, [%r17 + %r0]
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe2c0000  ! 523: STB_R	stb	%r31, [%r16 + %r0]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, c)
	.word 0xf2ad4020  ! 525: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xf2a46130  ! 526: STWA_I	stwa	%r25, [%r17 + 0x0130] %asi
	.word 0xfa74e17f  ! 528: STX_I	stx	%r29, [%r19 + 0x017f]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 3a)
	.word 0x8795e1bf  ! 531: WRPR_TT_I	wrpr	%r23, 0x01bf, %tt
	.word 0xbe25c000  ! 532: SUB_R	sub 	%r23, %r0, %r31
cpu_intr_3_42:
	setx	0x23011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 37)
	.word 0xf425e095  ! 537: STW_I	stw	%r26, [%r23 + 0x0095]
T3_asi_reg_wr_24:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 538: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbcc4a0b1  ! 539: ADDCcc_I	addccc 	%r18, 0x00b1, %r30
	.word 0xb8850000  ! 541: ADDcc_R	addcc 	%r20, %r0, %r28
T3_asi_reg_rd_31:
	mov	0x25, %r14
	.word 0xfadb8400  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_43:
	setx	0x200104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3de16f  ! 545: XNOR_I	xnor 	%r23, 0x016f, %r30
T3_asi_reg_wr_25:
	mov	0xe, %r14
	.word 0xf4f38e80  ! 546: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbd3dd000  ! 549: SRAX_R	srax	%r23, %r0, %r30
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_32:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf62dc000  ! 554: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_33:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198388a  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188a, %hpstate
	.word 0xf0f4e1e1  ! 560: STXA_I	stxa	%r24, [%r19 + 0x01e1] %asi
cpu_intr_3_44:
	setx	0x220120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93db001  ! 563: SRAX_I	srax	%r22, 0x0001, %r28
cpu_intr_3_45:
	setx	0x220016, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_34:
	mov	0xb, %r14
	.word 0xfcdb8e80  ! 566: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_26:
	mov	0x1c, %r14
	.word 0xf2f384a0  ! 568: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb49dc000  ! 569: XORcc_R	xorcc 	%r23, %r0, %r26
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfead4020  ! 575: STBA_R	stba	%r31, [%r21 + %r0] 0x01
cpu_intr_3_46:
	setx	0x230139, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x35, %r14
	.word 0xfef38400  ! 578: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe748000  ! 580: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xbc3dc000  ! 581: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb3353001  ! 586: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xf0b521a6  ! 587: STHA_I	stha	%r24, [%r20 + 0x01a6] %asi
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fd0  ! 588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_35:
	mov	0x8, %r14
	.word 0xf0db84a0  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xba3460d7  ! 596: ORN_I	orn 	%r17, 0x00d7, %r29
T3_asi_reg_wr_28:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 598: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_47:
	setx	0x200327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4c020  ! 602: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xfca460c2  ! 605: STWA_I	stwa	%r30, [%r17 + 0x00c2] %asi
T3_asi_reg_wr_29:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 609: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf8358000  ! 612: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb89ca0e9  ! 614: XORcc_I	xorcc 	%r18, 0x00e9, %r28
	.word 0xf6a4c020  ! 617: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
cpu_intr_3_48:
	setx	0x22002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_30:
	mov	0x28, %r14
	.word 0xf0f38400  ! 621: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_49:
	setx	0x23031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba454000  ! 623: ADDC_R	addc 	%r21, %r0, %r29
	.word 0xfcf46030  ! 624: STXA_I	stxa	%r30, [%r17 + 0x0030] %asi
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 1)
	.word 0xf4348000  ! 629: STH_R	sth	%r26, [%r18 + %r0]
cpu_intr_3_50:
	setx	0x22010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75a17f  ! 633: STX_I	stx	%r30, [%r22 + 0x017f]
T3_asi_reg_rd_37:
	mov	0x9, %r14
	.word 0xfedb84a0  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 5)
	.word 0xf4ac8020  ! 640: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xf0a5c020  ! 642: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_51:
	setx	0x230116, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a00  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a00, %hpstate
	.word 0xfe75c000  ! 648: STX_R	stx	%r31, [%r23 + %r0]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_TO_TL1
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbab4e12f  ! 655: ORNcc_I	orncc 	%r19, 0x012f, %r29
	.word 0xf67460da  ! 658: STX_I	stx	%r27, [%r17 + 0x00da]
	.word 0xfeb54020  ! 659: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xb72d7001  ! 664: SLLX_I	sllx	%r21, 0x0001, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xb81de1a9  ! 668: XOR_I	xor 	%r23, 0x01a9, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_38:
	mov	0x12, %r14
	.word 0xf6db8e80  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_31:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 683: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_52:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2da15a  ! 691: STB_I	stb	%r31, [%r22 + 0x015a]
	.word 0xb134b001  ! 693: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xfc75e089  ! 694: STX_I	stx	%r30, [%r23 + 0x0089]
T3_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 695: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf425211e  ! 699: STW_I	stw	%r26, [%r20 + 0x011e]
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 33)
	.word 0xfc748000  ! 702: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf874a088  ! 704: STX_I	stx	%r28, [%r18 + 0x0088]
cpu_intr_3_53:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6946149  ! 710: ORcc_I	orcc 	%r17, 0x0149, %r27
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_54:
	setx	0x230116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf4a5c020  ! 721: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_NONHPRIV
	.word 0xfc748000  ! 730: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf6ad6176  ! 734: STBA_I	stba	%r27, [%r21 + 0x0176] %asi
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 28)
	.word 0xf87520d1  ! 739: STX_I	stx	%r28, [%r20 + 0x00d1]
	ta	T_CHANGE_TO_TL1
	.word 0xbe050000  ! 742: ADD_R	add 	%r20, %r0, %r31
cpu_intr_3_55:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_56:
	setx	0x210118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0x19, %r14
	.word 0xf2f38e80  ! 746: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xb535c000  ! 753: SRL_R	srl 	%r23, %r0, %r26
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_57:
	setx	0x220119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a5e1c1  ! 760: STWA_I	stwa	%r28, [%r23 + 0x01c1] %asi
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_34:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 766: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_39:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 769: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	.word 0xfe358000  ! 773: STH_R	sth	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_58:
	setx	0x22022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 778: STX_R	stx	%r28, [%r19 + %r0]
cpu_intr_3_59:
	setx	0x230137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d8000  ! 781: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfef4215d  ! 782: STXA_I	stxa	%r31, [%r16 + 0x015d] %asi
	ta	T_CHANGE_HPRIV
	.word 0xba8c4000  ! 785: ANDcc_R	andcc 	%r17, %r0, %r29
cpu_intr_3_60:
	setx	0x22020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_61:
	setx	0x210031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534c000  ! 791: SRL_R	srl 	%r19, %r0, %r26
T3_asi_reg_rd_40:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_41:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_62:
	setx	0x21031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b54020  ! 801: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xb97ce401  ! 802: MOVR_I	movre	%r19, 0x1, %r28
cpu_intr_3_63:
	setx	0x23002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc24e085  ! 806: STW_I	stw	%r30, [%r19 + 0x0085]
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 21)
	.word 0xf6a54020  ! 809: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
cpu_intr_3_64:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ce18a  ! 814: STB_I	stb	%r25, [%r19 + 0x018a]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 38)
	.word 0xf6246064  ! 819: STW_I	stw	%r27, [%r17 + 0x0064]
T3_asi_reg_rd_42:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8756014  ! 821: STX_I	stx	%r28, [%r21 + 0x0014]
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_35:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 824: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8346116  ! 825: STH_I	sth	%r28, [%r17 + 0x0116]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_36:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 831: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf635e0dc  ! 832: STH_I	sth	%r27, [%r23 + 0x00dc]
	.word 0x899561af  ! 833: WRPR_TICK_I	wrpr	%r21, 0x01af, %tick
	.word 0xb5342001  ! 835: SRL_I	srl 	%r16, 0x0001, %r26
T3_asi_reg_rd_43:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_44:
	mov	0x16, %r14
	.word 0xfedb84a0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf42c4000  ! 840: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf874e01e  ! 842: STX_I	stx	%r28, [%r19 + 0x001e]
cpu_intr_3_65:
	setx	0x23010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b50020  ! 846: STHA_R	stha	%r26, [%r20 + %r0] 0x01
	.word 0xf6350000  ! 848: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf8a5a1db  ! 850: STWA_I	stwa	%r28, [%r22 + 0x01db] %asi
T3_asi_reg_rd_45:
	mov	0x16, %r14
	.word 0xf4db8e60  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfeb54020  ! 854: STHA_R	stha	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_46:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 855: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 20)
	.word 0xf275a14f  ! 858: STX_I	stx	%r25, [%r22 + 0x014f]
T3_asi_reg_wr_37:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 859: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_66:
	setx	0x22022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfc2cc000  ! 866: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf02521e8  ! 868: STW_I	stw	%r24, [%r20 + 0x01e8]
	.word 0xb7343001  ! 869: SRLX_I	srlx	%r16, 0x0001, %r27
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb9343001  ! 877: SRLX_I	srlx	%r16, 0x0001, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xb17c0400  ! 880: MOVR_R	movre	%r16, %r0, %r24
T3_asi_reg_wr_38:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 881: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_47:
	mov	0x8, %r14
	.word 0xfadb8400  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf475c000  ! 889: STX_R	stx	%r26, [%r23 + %r0]
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d98  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0xfc2d0000  ! 892: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf0748000  ! 895: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_67:
	setx	0x240128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc2dc000  ! 902: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfead4020  ! 904: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cc2  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, f)
	.word 0xf825c000  ! 910: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xb4c4a0e1  ! 912: ADDCcc_I	addccc 	%r18, 0x00e1, %r26
	.word 0xfe2ce11e  ! 914: STB_I	stb	%r31, [%r19 + 0x011e]
cpu_intr_3_68:
	setx	0x260027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f46008  ! 917: STXA_I	stxa	%r27, [%r17 + 0x0008] %asi
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_39:
	mov	0x1d, %r14
	.word 0xf0f389e0  ! 919: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbab40000  ! 920: ORNcc_R	orncc 	%r16, %r0, %r29
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_69:
	setx	0x260105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874e1f8  ! 927: STX_I	stx	%r28, [%r19 + 0x01f8]
	.word 0xfe2461d8  ! 930: STW_I	stw	%r31, [%r17 + 0x01d8]
	.word 0xbab5e154  ! 932: ORNcc_I	orncc 	%r23, 0x0154, %r29
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, e)
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_70:
	setx	0x270114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 938: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf2750000  ! 939: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf4a48020  ! 940: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xf874a122  ! 941: STX_I	stx	%r28, [%r18 + 0x0122]
	.word 0xf4b46022  ! 942: STHA_I	stha	%r26, [%r17 + 0x0022] %asi
T3_asi_reg_wr_40:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 945: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf82d4000  ! 949: STB_R	stb	%r28, [%r21 + %r0]
T3_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 951: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_49:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf62cc000  ! 958: STB_R	stb	%r27, [%r19 + %r0]
cpu_intr_3_72:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475e022  ! 963: STX_I	stx	%r26, [%r23 + 0x0022]
cpu_intr_3_73:
	setx	0x270039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 971: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb4448000  ! 972: ADDC_R	addc 	%r18, %r0, %r26
	.word 0xf2b4e14a  ! 975: STHA_I	stha	%r25, [%r19 + 0x014a] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa244000  ! 978: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xbe9421f1  ! 980: ORcc_I	orcc 	%r16, 0x01f1, %r31
T3_asi_reg_rd_50:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02ca1a4  ! 990: STB_I	stb	%r24, [%r18 + 0x01a4]
cpu_intr_3_74:
	setx	0x270028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01da095  ! 994: XOR_I	xor 	%r22, 0x0095, %r24
	.word 0xfe250000  ! 995: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf8248000  ! 996: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xb134f001  ! 998: SRLX_I	srlx	%r19, 0x0001, %r24
	.word 0xb2ac6034  ! 1000: ANDNcc_I	andncc 	%r17, 0x0034, %r25
cpu_intr_3_75:
	setx	0x260135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 1003: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_76:
	setx	0x250235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_77:
	setx	0x270136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc242034  ! 1008: STW_I	stw	%r30, [%r16 + 0x0034]
	.word 0xfa2d2172  ! 1010: STB_I	stb	%r29, [%r20 + 0x0172]
	.word 0xfe758000  ! 1015: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfc74613c  ! 1016: STX_I	stx	%r30, [%r17 + 0x013c]
	.word 0xb834a1b7  ! 1017: ORN_I	orn 	%r18, 0x01b7, %r28
	.word 0xf8a4a019  ! 1019: STWA_I	stwa	%r28, [%r18 + 0x0019] %asi
	.word 0xb3643801  ! 1021: MOVcc_I	<illegal instruction>
	.word 0xf2358000  ! 1024: STH_R	sth	%r25, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_78:
	setx	0x260013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea520e2  ! 1029: STWA_I	stwa	%r31, [%r20 + 0x00e2] %asi
cpu_intr_3_79:
	setx	0x270237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb8c54000  ! 1035: ADDCcc_R	addccc 	%r21, %r0, %r28
cpu_intr_3_80:
	setx	0x25003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 22)
	.word 0xf8a521eb  ! 1044: STWA_I	stwa	%r28, [%r20 + 0x01eb] %asi
	.word 0xf825a1fb  ! 1046: STW_I	stw	%r28, [%r22 + 0x01fb]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 20)
	.word 0xfa75e02b  ! 1051: STX_I	stx	%r29, [%r23 + 0x002b]
cpu_intr_3_81:
	setx	0x25030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8340000  ! 1055: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfc25e0dc  ! 1056: STW_I	stw	%r30, [%r23 + 0x00dc]
T3_asi_reg_rd_52:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 1057: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 33)
	.word 0xb535c000  ! 1059: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb13d4000  ! 1060: SRA_R	sra 	%r21, %r0, %r24
cpu_intr_3_82:
	setx	0x240114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74c000  ! 1067: STX_R	stx	%r29, [%r19 + %r0]
T3_asi_reg_wr_41:
	mov	0x36, %r14
	.word 0xf6f38400  ! 1074: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfeb4a0af  ! 1076: STHA_I	stha	%r31, [%r18 + 0x00af] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 5)
	.word 0xf025e04d  ! 1080: STW_I	stw	%r24, [%r23 + 0x004d]
T3_asi_reg_rd_53:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf2b560f4  ! 1082: STHA_I	stha	%r25, [%r21 + 0x00f4] %asi
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a4a164  ! 1085: STWA_I	stwa	%r24, [%r18 + 0x0164] %asi
T3_asi_reg_rd_54:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_TO_TL0
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb0c56140  ! 1093: ADDCcc_I	addccc 	%r21, 0x0140, %r24
cpu_intr_3_83:
	setx	0x24022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5a014  ! 1102: SUBcc_I	subcc 	%r22, 0x0014, %r30
T3_asi_reg_wr_42:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 1103: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf625e164  ! 1104: STW_I	stw	%r27, [%r23 + 0x0164]
cpu_intr_3_85:
	setx	0x270233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0350000  ! 1109: ORN_R	orn 	%r20, %r0, %r24
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_43:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1116: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_56:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb434219b  ! 1120: ORN_I	orn 	%r16, 0x019b, %r26
T3_asi_reg_wr_44:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 1124: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfa25e1a9  ! 1125: STW_I	stw	%r29, [%r23 + 0x01a9]
cpu_intr_3_86:
	setx	0x26001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb044a144  ! 1128: ADDC_I	addc 	%r18, 0x0144, %r24
	.word 0xfcace020  ! 1129: STBA_I	stba	%r30, [%r19 + 0x0020] %asi
cpu_intr_3_87:
	setx	0x270033, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_57:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb2252043  ! 1133: SUB_I	sub 	%r20, 0x0043, %r25
	.word 0xfaf4a1d8  ! 1134: STXA_I	stxa	%r29, [%r18 + 0x01d8] %asi
	.word 0xf2ad8020  ! 1135: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xf6352070  ! 1137: STH_I	sth	%r27, [%r20 + 0x0070]
	.word 0xfc342070  ! 1140: STH_I	sth	%r30, [%r16 + 0x0070]
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_58:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf825c000  ! 1147: STW_R	stw	%r28, [%r23 + %r0]
cpu_intr_3_88:
	setx	0x25012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab4c000  ! 1150: SUBCcc_R	orncc 	%r19, %r0, %r29
	.word 0xbe95e1a0  ! 1152: ORcc_I	orcc 	%r23, 0x01a0, %r31
T3_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf024e19f  ! 1156: STW_I	stw	%r24, [%r19 + 0x019f]
	.word 0xfe748000  ! 1157: STX_R	stx	%r31, [%r18 + %r0]
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_89:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e187  ! 1164: STX_I	stx	%r31, [%r19 + 0x0187]
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 3b)
	.word 0xbea42111  ! 1169: SUBcc_I	subcc 	%r16, 0x0111, %r31
cpu_intr_3_90:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaade03e  ! 1172: STBA_I	stba	%r29, [%r23 + 0x003e] %asi
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 27)
	.word 0xf22d8000  ! 1175: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_wr_45:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 1176: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2a5c020  ! 1177: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_60:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbc1ce183  ! 1182: XOR_I	xor 	%r19, 0x0183, %r30
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf474a1f8  ! 1186: STX_I	stx	%r26, [%r18 + 0x01f8]
cpu_intr_3_91:
	setx	0x26013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca46113  ! 1191: STWA_I	stwa	%r30, [%r17 + 0x0113] %asi
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f0a  ! 1193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_61:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcacc020  ! 1197: STBA_R	stba	%r30, [%r19 + %r0] 0x01
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 8)
	.word 0xb4458000  ! 1199: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xf62c20c1  ! 1202: STB_I	stb	%r27, [%r16 + 0x00c1]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_HPRIV
cpu_intr_3_92:
	setx	0x25000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a46170  ! 1207: STWA_I	stwa	%r25, [%r17 + 0x0170] %asi
T3_asi_reg_wr_46:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 1208: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 36)
	.word 0xfe244000  ! 1210: STW_R	stw	%r31, [%r17 + %r0]
cpu_intr_3_93:
	setx	0x25021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5c020  ! 1212: STHA_R	stha	%r30, [%r23 + %r0] 0x01
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_94:
	setx	0x250102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_95:
	setx	0x240224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2ca08c  ! 1221: ANDN_I	andn 	%r18, 0x008c, %r29
T3_asi_reg_rd_62:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_96:
	setx	0x24021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b48020  ! 1225: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xb7643801  ! 1226: MOVcc_I	<illegal instruction>
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_63:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 1230: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_47:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 1231: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_48:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 1241: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_97:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_64:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 1248: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_49:
	mov	0x1a, %r14
	.word 0xf4f38e60  ! 1250: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_65:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_66:
	mov	0x37, %r14
	.word 0xf0db8e80  ! 1256: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfaad60df  ! 1258: STBA_I	stba	%r29, [%r21 + 0x00df] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_98:
	setx	0x25030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_99:
	setx	0x260136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0x33, %r14
	.word 0xfedb8400  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bd2  ! 1275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd2, %hpstate
T3_asi_reg_wr_50:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 1277: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_100:
	setx	0x260338, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_68:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_51:
	mov	0x36, %r14
	.word 0xfcf389e0  ! 1281: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf8b58020  ! 1282: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xfeb4c020  ! 1283: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xfaac60bb  ! 1285: STBA_I	stba	%r29, [%r17 + 0x00bb] %asi
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_101:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c0000  ! 1301: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfeade0c6  ! 1304: STBA_I	stba	%r31, [%r23 + 0x00c6] %asi
cpu_intr_3_102:
	setx	0x260016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_52:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 1311: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ad2  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
cpu_intr_3_103:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4b4c020  ! 1321: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xf6ad205b  ! 1322: STBA_I	stba	%r27, [%r20 + 0x005b] %asi
	.word 0xb21520bc  ! 1325: OR_I	or 	%r20, 0x00bc, %r25
	.word 0xf834214d  ! 1326: STH_I	sth	%r28, [%r16 + 0x014d]
T3_asi_reg_wr_53:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 1328: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_104:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc354000  ! 1332: STH_R	sth	%r30, [%r21 + %r0]
T3_asi_reg_rd_69:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf82da146  ! 1335: STB_I	stb	%r28, [%r22 + 0x0146]
	.word 0xb6b4e002  ! 1337: ORNcc_I	orncc 	%r19, 0x0002, %r27
	.word 0xfcad20a3  ! 1339: STBA_I	stba	%r30, [%r20 + 0x00a3] %asi
cpu_intr_3_105:
	setx	0x270104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d1000  ! 1344: SRAX_R	srax	%r20, %r0, %r30
cpu_intr_3_106:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_107:
	setx	0x240323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x26011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 1352: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf82c4000  ! 1353: STB_R	stb	%r28, [%r17 + %r0]
cpu_intr_3_110:
	setx	0x25020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_55:
	mov	0x9, %r14
	.word 0xf0f38e80  ! 1357: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf82ca09c  ! 1363: STB_I	stb	%r28, [%r18 + 0x009c]
cpu_intr_3_111:
	setx	0x29012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a40020  ! 1367: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8358000  ! 1369: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf02ce0b7  ! 1370: STB_I	stb	%r24, [%r19 + 0x00b7]
	.word 0xf0b4c020  ! 1371: STHA_R	stha	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_56:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1372: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf03461ef  ! 1373: STH_I	sth	%r24, [%r17 + 0x01ef]
	ta	T_CHANGE_TO_TL0
	.word 0xfaa4604d  ! 1376: STWA_I	stwa	%r29, [%r17 + 0x004d] %asi
T3_asi_reg_wr_57:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 1377: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbf34f001  ! 1379: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0xf624210b  ! 1381: STW_I	stw	%r27, [%r16 + 0x010b]
T3_asi_reg_wr_58:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 1382: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x83952051  ! 1384: WRPR_TNPC_I	wrpr	%r20, 0x0051, %tnpc
	.word 0xf0adc020  ! 1389: STBA_R	stba	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_70:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, c)
	.word 0xb6c46194  ! 1401: ADDCcc_I	addccc 	%r17, 0x0194, %r27
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, f)
	.word 0xf42c8000  ! 1405: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_112:
	setx	0x2b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8740000  ! 1415: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfaa52186  ! 1420: STWA_I	stwa	%r29, [%r20 + 0x0186] %asi
	.word 0xf424c000  ! 1421: STW_R	stw	%r26, [%r19 + %r0]
T3_asi_reg_wr_59:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 1423: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2f56107  ! 1424: STXA_I	stxa	%r25, [%r21 + 0x0107] %asi
	.word 0xfaad0020  ! 1425: STBA_R	stba	%r29, [%r20 + %r0] 0x01
cpu_intr_3_113:
	setx	0x2b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d6146  ! 1428: STB_I	stb	%r30, [%r21 + 0x0146]
T3_asi_reg_wr_60:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 1430: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8748000  ! 1431: STX_R	stx	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8244000  ! 1434: SUB_R	sub 	%r17, %r0, %r28
cpu_intr_3_114:
	setx	0x2a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 1442: STB_R	stb	%r26, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xbe24e18f  ! 1445: SUB_I	sub 	%r19, 0x018f, %r31
cpu_intr_3_115:
	setx	0x280213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63de0a5  ! 1448: XNOR_I	xnor 	%r23, 0x00a5, %r27
T3_asi_reg_wr_61:
	mov	0x28, %r14
	.word 0xf0f38e80  ! 1449: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb2ada193  ! 1450: ANDNcc_I	andncc 	%r22, 0x0193, %r25
	.word 0xf2342059  ! 1452: STH_I	sth	%r25, [%r16 + 0x0059]
	.word 0xfe2c2143  ! 1453: STB_I	stb	%r31, [%r16 + 0x0143]
cpu_intr_3_117:
	setx	0x290005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c8000  ! 1457: STB_R	stb	%r27, [%r18 + %r0]
T3_asi_reg_wr_62:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 1459: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2a4614e  ! 1460: STWA_I	stwa	%r25, [%r17 + 0x014e] %asi
cpu_intr_3_118:
	setx	0x2b021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4600f  ! 1463: STWA_I	stwa	%r27, [%r17 + 0x000f] %asi
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983818  ! 1466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1818, %hpstate
T3_asi_reg_wr_63:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 1467: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_71:
	mov	0xb, %r14
	.word 0xf8db8e60  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf4f5a18b  ! 1471: STXA_I	stxa	%r26, [%r22 + 0x018b] %asi
	.word 0xbd540000  ! 1473: RDPR_GL	rdpr	%-, %r30
	.word 0xf6258000  ! 1474: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf6ad8020  ! 1475: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xfe2c8000  ! 1476: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfaacc020  ! 1478: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xfcac60c7  ! 1479: STBA_I	stba	%r30, [%r17 + 0x00c7] %asi
cpu_intr_3_119:
	setx	0x2b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_72:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_120:
	setx	0x280314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf6b4610e  ! 1485: STHA_I	stha	%r27, [%r17 + 0x010e] %asi
	.word 0xb13c4000  ! 1487: SRA_R	sra 	%r17, %r0, %r24
	.word 0xfa250000  ! 1488: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf8250000  ! 1490: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_wr_64:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 1493: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc9c8000  ! 1496: XORcc_R	xorcc 	%r18, %r0, %r30
	.word 0xf8a5e04a  ! 1497: STWA_I	stwa	%r28, [%r23 + 0x004a] %asi
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_65:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 1501: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 14)
	.word 0xfc34c000  ! 1503: STH_R	sth	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_121:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_122:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 10)
	.word 0xf2340000  ! 1521: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf025c000  ! 1524: STW_R	stw	%r24, [%r23 + %r0]
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 9)
	.word 0xf62ca064  ! 1530: STB_I	stb	%r27, [%r18 + 0x0064]
	.word 0xfaa4a08a  ! 1533: STWA_I	stwa	%r29, [%r18 + 0x008a] %asi
cpu_intr_3_123:
	setx	0x290027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225c000  ! 1538: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfea58020  ! 1544: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
T3_asi_reg_wr_66:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 1545: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc750000  ! 1546: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xbd357001  ! 1548: SRLX_I	srlx	%r21, 0x0001, %r30
	.word 0xfe74219a  ! 1549: STX_I	stx	%r31, [%r16 + 0x019a]
T3_asi_reg_wr_67:
	mov	0x1, %r14
	.word 0xf6f384a0  ! 1551: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_124:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_125:
	setx	0x290318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_68:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 1561: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_126:
	setx	0x29012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ada0db  ! 1563: STBA_I	stba	%r25, [%r22 + 0x00db] %asi
	.word 0xbf359000  ! 1565: SRLX_R	srlx	%r22, %r0, %r31
cpu_intr_3_127:
	setx	0x28002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e1b0  ! 1569: STWA_I	stwa	%r30, [%r23 + 0x01b0] %asi
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 11)
	.word 0xf42ce096  ! 1577: STB_I	stb	%r26, [%r19 + 0x0096]
	.word 0xf024e1c4  ! 1579: STW_I	stw	%r24, [%r19 + 0x01c4]
cpu_intr_3_128:
	setx	0x2b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ade009  ! 1581: STBA_I	stba	%r25, [%r23 + 0x0009] %asi
cpu_intr_3_129:
	setx	0x290203, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_74:
	mov	0x18, %r14
	.word 0xfadb89e0  ! 1583: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_69:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 1584: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xba9560d9  ! 1585: ORcc_I	orcc 	%r21, 0x00d9, %r29
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198380a  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, c)
	.word 0xf0ac61a5  ! 1590: STBA_I	stba	%r24, [%r17 + 0x01a5] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4744000  ! 1594: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfa25209f  ! 1595: STW_I	stw	%r29, [%r20 + 0x009f]
cpu_intr_3_130:
	setx	0x2b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_70:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 1597: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_75:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 1600: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf8ace109  ! 1601: STBA_I	stba	%r28, [%r19 + 0x0109] %asi
	.word 0xfa35e1cf  ! 1604: STH_I	sth	%r29, [%r23 + 0x01cf]
	.word 0xfa24a1b9  ! 1607: STW_I	stw	%r29, [%r18 + 0x01b9]
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe34a0d8  ! 1612: STH_I	sth	%r31, [%r18 + 0x00d8]
	.word 0xfeb5a0b5  ! 1613: STHA_I	stha	%r31, [%r22 + 0x00b5] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb4ac8000  ! 1620: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xf025c000  ! 1621: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_wr_71:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 1623: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf874a19c  ! 1628: STX_I	stx	%r28, [%r18 + 0x019c]
T3_asi_reg_wr_72:
	mov	0x16, %r14
	.word 0xfaf389e0  ! 1632: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_131:
	setx	0x2b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac2129  ! 1637: STBA_I	stba	%r29, [%r16 + 0x0129] %asi
T3_asi_reg_wr_73:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 1645: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1648: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_132:
	setx	0x290234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_76:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc7420a3  ! 1655: STX_I	stx	%r30, [%r16 + 0x00a3]
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 37)
	.word 0xf03560c5  ! 1658: STH_I	sth	%r24, [%r21 + 0x00c5]
	.word 0xfc750000  ! 1659: STX_R	stx	%r30, [%r20 + %r0]
T3_asi_reg_wr_75:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 1660: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xb415a143  ! 1665: OR_I	or 	%r22, 0x0143, %r26
	.word 0xb2b54000  ! 1666: SUBCcc_R	orncc 	%r21, %r0, %r25
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_133:
	setx	0x2a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 1675: ORN_R	orn 	%r19, %r0, %r24
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb32df001  ! 1681: SLLX_I	sllx	%r23, 0x0001, %r25
	.word 0xf235c000  ! 1682: STH_R	sth	%r25, [%r23 + %r0]
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_134:
	setx	0x280336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_135:
	setx	0x28022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 20)
	.word 0xfa25a068  ! 1688: STW_I	stw	%r29, [%r22 + 0x0068]
cpu_intr_3_136:
	setx	0x290206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb735d000  ! 1696: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xf22d4000  ! 1697: STB_R	stb	%r25, [%r21 + %r0]
T3_asi_reg_rd_78:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 1700: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_79:
	mov	0x10, %r14
	.word 0xfadb8400  ! 1701: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe2dc000  ! 1702: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xfc2d8000  ! 1703: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_137:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02da151  ! 1707: STB_I	stb	%r24, [%r22 + 0x0151]
	.word 0xb0144000  ! 1708: OR_R	or 	%r17, %r0, %r24
	.word 0xbcadc000  ! 1710: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xf075e1be  ! 1711: STX_I	stx	%r24, [%r23 + 0x01be]
T3_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 1712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_138:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_81:
	mov	0x7, %r14
	.word 0xf8db8e80  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_139:
	setx	0x2a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa252091  ! 1718: STW_I	stw	%r29, [%r20 + 0x0091]
T3_asi_reg_wr_76:
	mov	0x21, %r14
	.word 0xfef38e80  ! 1719: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5643801  ! 1722: MOVcc_I	<illegal instruction>
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb735a001  ! 1724: SRL_I	srl 	%r22, 0x0001, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfc25c000  ! 1730: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfc348000  ! 1731: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_140:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24a124  ! 1735: STW_I	stw	%r29, [%r18 + 0x0124]
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, d)
	.word 0xfc74e1b1  ! 1737: STX_I	stx	%r30, [%r19 + 0x01b1]
T3_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 1743: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_77:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 1746: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 29)
	.word 0xbc144000  ! 1750: OR_R	or 	%r17, %r0, %r30
	.word 0xf2b40020  ! 1752: STHA_R	stha	%r25, [%r16 + %r0] 0x01
cpu_intr_3_141:
	setx	0x2a0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_83:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 1758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf074a133  ! 1760: STX_I	stx	%r24, [%r18 + 0x0133]
	.word 0xbca46019  ! 1761: SUBcc_I	subcc 	%r17, 0x0019, %r30
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_85:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 1770: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, f)
	.word 0xf22d4000  ! 1779: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf8a5c020  ! 1780: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_86:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 1781: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_87:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_88:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb88461e4  ! 1787: ADDcc_I	addcc 	%r17, 0x01e4, %r28
cpu_intr_3_142:
	setx	0x2b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_78:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 1791: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf62420c8  ! 1795: STW_I	stw	%r27, [%r16 + 0x00c8]
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c48  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb9641800  ! 1803: MOVcc_R	<illegal instruction>
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6b4e0c8  ! 1806: STHA_I	stha	%r27, [%r19 + 0x00c8] %asi
	.word 0xf6b58020  ! 1807: STHA_R	stha	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_89:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_143:
	setx	0x2e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_79:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 1814: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4a5a0b2  ! 1818: STWA_I	stwa	%r26, [%r22 + 0x00b2] %asi
	.word 0xbc04c000  ! 1819: ADD_R	add 	%r19, %r0, %r30
	.word 0xf67520df  ! 1823: STX_I	stx	%r27, [%r20 + 0x00df]
T3_asi_reg_wr_80:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1824: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0252183  ! 1829: STW_I	stw	%r24, [%r20 + 0x0183]
T3_asi_reg_rd_90:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4a4a1f9  ! 1833: STWA_I	stwa	%r26, [%r18 + 0x01f9] %asi
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_144:
	setx	0x2e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b461fe  ! 1839: STHA_I	stha	%r25, [%r17 + 0x01fe] %asi
	.word 0xbb2d0000  ! 1841: SLL_R	sll 	%r20, %r0, %r29
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_145:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5a157  ! 1846: STXA_I	stxa	%r29, [%r22 + 0x0157] %asi
	.word 0xf0354000  ! 1848: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_wr_81:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 1851: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xf2a40020  ! 1853: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xbeb50000  ! 1857: ORNcc_R	orncc 	%r20, %r0, %r31
cpu_intr_3_146:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_147:
	setx	0x2f003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_91:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_82:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 1865: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_83:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 1866: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_92:
	mov	0x10, %r14
	.word 0xf4db8e80  ! 1869: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_93:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_148:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42da0f8  ! 1873: STB_I	stb	%r26, [%r22 + 0x00f8]
cpu_intr_3_149:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8754000  ! 1879: STX_R	stx	%r28, [%r21 + %r0]
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb6c50000  ! 1883: ADDCcc_R	addccc 	%r20, %r0, %r27
T3_asi_reg_wr_84:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 1885: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_150:
	setx	0x2c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_85:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1896: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfcac8020  ! 1897: STBA_R	stba	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_86:
	mov	0x1a, %r14
	.word 0xf4f389e0  ! 1898: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb13c3001  ! 1904: SRAX_I	srax	%r16, 0x0001, %r24
cpu_intr_3_152:
	setx	0x2f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c0000  ! 1906: STB_R	stb	%r25, [%r16 + %r0]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_153:
	setx	0x2d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_154:
	setx	0x2d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_95:
	mov	0x1, %r14
	.word 0xf8db8e60  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 28)
	.word 0xfe34c000  ! 1928: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa24e189  ! 1931: STW_I	stw	%r29, [%r19 + 0x0189]
cpu_intr_3_155:
	setx	0x2d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c02  ! 1934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
	.word 0xf675a1d8  ! 1940: STX_I	stx	%r27, [%r22 + 0x01d8]
T3_asi_reg_wr_87:
	mov	0x28, %r14
	.word 0xfef38e80  ! 1941: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf824a165  ! 1943: STW_I	stw	%r28, [%r18 + 0x0165]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_156:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_157:
	setx	0x2e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_158:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1962: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_97:
	mov	0x5, %r14
	.word 0xf2db84a0  ! 1964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf4b461a7  ! 1965: STHA_I	stha	%r26, [%r17 + 0x01a7] %asi
	.word 0xb12c1000  ! 1967: SLLX_R	sllx	%r16, %r0, %r24
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b80  ! 1970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b80, %hpstate
cpu_intr_3_159:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5e13b  ! 1972: STWA_I	stwa	%r29, [%r23 + 0x013b] %asi
	.word 0xfc752111  ! 1974: STX_I	stx	%r30, [%r20 + 0x0111]
cpu_intr_3_160:
	setx	0x2f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_98:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfc25c000  ! 1985: STW_R	stw	%r30, [%r23 + %r0]
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b80  ! 1986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	.word 0xf235c000  ! 1987: STH_R	sth	%r25, [%r23 + %r0]
T3_asi_reg_wr_89:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 1989: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_90:
	mov	0x1c, %r14
	.word 0xf4f384a0  ! 1993: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_161:
	setx	0x2c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982892  ! 1996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
	.word 0xf6a58020  ! 1997: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf8256007  ! 1999: STW_I	stw	%r28, [%r21 + 0x0007]
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, d)
	.word 0xb4b54000  ! 2006: ORNcc_R	orncc 	%r21, %r0, %r26
	.word 0xfef4606a  ! 2007: STXA_I	stxa	%r31, [%r17 + 0x006a] %asi
cpu_intr_3_162:
	setx	0x2f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfeb48020  ! 2016: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983802  ! 2020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xf8ade111  ! 2022: STBA_I	stba	%r28, [%r23 + 0x0111] %asi
	.word 0xb934f001  ! 2023: SRLX_I	srlx	%r19, 0x0001, %r28
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_91:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 2025: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_rd_100:
	mov	0x1f, %r14
	.word 0xfadb89e0  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_92:
	mov	0x1f, %r14
	.word 0xfcf384a0  ! 2028: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_93:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 2030: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_101:
	mov	0x36, %r14
	.word 0xf0db8400  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_94:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 2034: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_103:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_163:
	setx	0x2f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad6016  ! 2041: STBA_I	stba	%r26, [%r21 + 0x0016] %asi
cpu_intr_3_164:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 2e)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983890  ! 2050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1890, %hpstate
T3_asi_reg_rd_104:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf42d206d  ! 2054: STB_I	stb	%r26, [%r20 + 0x006d]
	.word 0xfea50020  ! 2055: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
cpu_intr_3_165:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_166:
	setx	0x2e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4c020  ! 2062: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfa74a1c0  ! 2064: STX_I	stx	%r29, [%r18 + 0x01c0]
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_167:
	setx	0x2f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_168:
	setx	0x2f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_95:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 2075: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 18)
	.word 0xb17d0400  ! 2077: MOVR_R	movre	%r20, %r0, %r24
	.word 0xfa75c000  ! 2078: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf0f5a182  ! 2083: STXA_I	stxa	%r24, [%r22 + 0x0182] %asi
	.word 0x89956023  ! 2086: WRPR_TICK_I	wrpr	%r21, 0x0023, %tick
	ta	T_CHANGE_HPRIV
cpu_intr_3_169:
	setx	0x2f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b9a  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
	.word 0xf2b4a0fe  ! 2094: STHA_I	stha	%r25, [%r18 + 0x00fe] %asi
T3_asi_reg_wr_96:
	mov	0x2c, %r14
	.word 0xfaf38e60  ! 2095: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5351000  ! 2098: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xfc3560c1  ! 2099: STH_I	sth	%r30, [%r21 + 0x00c1]
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_170:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x2f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_172:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_173:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa346083  ! 2121: STH_I	sth	%r29, [%r17 + 0x0083]
T3_asi_reg_rd_105:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_174:
	setx	0x2c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f8a  ! 2125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f8a, %hpstate
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 32)
	.word 0xbb342001  ! 2129: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xb4a4609e  ! 2131: SUBcc_I	subcc 	%r17, 0x009e, %r26
T3_asi_reg_wr_97:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 2133: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6340000  ! 2135: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf624e0f9  ! 2136: STW_I	stw	%r27, [%r19 + 0x00f9]
	.word 0xf475202b  ! 2137: STX_I	stx	%r26, [%r20 + 0x002b]
	.word 0xfe74a1fc  ! 2140: STX_I	stx	%r31, [%r18 + 0x01fc]
	.word 0xf02c602d  ! 2141: STB_I	stb	%r24, [%r17 + 0x002d]
cpu_intr_3_176:
	setx	0x2f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada1bf  ! 2146: STBA_I	stba	%r26, [%r22 + 0x01bf] %asi
T3_asi_reg_wr_98:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 2147: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc9c0000  ! 2149: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xf2a56086  ! 2150: STWA_I	stwa	%r25, [%r21 + 0x0086] %asi
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_177:
	setx	0x2d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6b4a07c  ! 2155: STHA_I	stha	%r27, [%r18 + 0x007c] %asi
T3_asi_reg_rd_106:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_178:
	setx	0x2d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_179:
	setx	0x2e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ada022  ! 2166: ANDNcc_I	andncc 	%r22, 0x0022, %r28
	.word 0xf0744000  ! 2167: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xbab420ea  ! 2168: ORNcc_I	orncc 	%r16, 0x00ea, %r29
	ta	T_CHANGE_TO_TL1
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198399a  ! 2170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199a, %hpstate
T3_asi_reg_rd_107:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_108:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 24)
	.word 0xf0f4a1eb  ! 2185: STXA_I	stxa	%r24, [%r18 + 0x01eb] %asi
cpu_intr_3_180:
	setx	0x2f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825e0ac  ! 2188: STW_I	stw	%r28, [%r23 + 0x00ac]
	.word 0xf02dc000  ! 2190: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb0344000  ! 2192: ORN_R	orn 	%r17, %r0, %r24
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_TO_TL1
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_181:
	setx	0x2d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15204a  ! 2202: OR_I	or 	%r20, 0x004a, %r31
cpu_intr_3_182:
	setx	0x2c020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0242052  ! 2204: STW_I	stw	%r24, [%r16 + 0x0052]
	.word 0xfa25a098  ! 2208: STW_I	stw	%r29, [%r22 + 0x0098]
	.word 0xf4744000  ! 2209: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf2256112  ! 2211: STW_I	stw	%r25, [%r21 + 0x0112]
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfaf561ad  ! 2213: STXA_I	stxa	%r29, [%r21 + 0x01ad] %asi
	.word 0xf62da099  ! 2215: STB_I	stb	%r27, [%r22 + 0x0099]
	.word 0xfc354000  ! 2217: STH_R	sth	%r30, [%r21 + %r0]
T3_asi_reg_wr_99:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2219: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb57cc400  ! 2223: MOVR_R	movre	%r19, %r0, %r26
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf0746153  ! 2225: STX_I	stx	%r24, [%r17 + 0x0153]
	.word 0xf6b4c020  ! 2226: STHA_R	stha	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_100:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2229: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf834e1c9  ! 2231: STH_I	sth	%r28, [%r19 + 0x01c9]
cpu_intr_3_183:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 2233: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf8746095  ! 2235: STX_I	stx	%r28, [%r17 + 0x0095]
T3_asi_reg_wr_101:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 2237: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_102:
	mov	0x2a, %r14
	.word 0xfaf389e0  ! 2238: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2ac4020  ! 2239: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xbd50c000  ! 2241: RDPR_TT	rdpr	%tt, %r30
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819828c8  ! 2246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
	.word 0xf2f5a0ca  ! 2248: STXA_I	stxa	%r25, [%r22 + 0x00ca] %asi
T3_asi_reg_rd_109:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb834e1a9  ! 2252: ORN_I	orn 	%r19, 0x01a9, %r28
	.word 0xfa35a15d  ! 2253: STH_I	sth	%r29, [%r22 + 0x015d]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 38)
	.word 0xfa25205c  ! 2259: STW_I	stw	%r29, [%r20 + 0x005c]
T3_asi_reg_wr_103:
	mov	0x5, %r14
	.word 0xf6f38400  ! 2260: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf82c20c3  ! 2261: STB_I	stb	%r28, [%r16 + 0x00c3]
	.word 0xf4f4a104  ! 2265: STXA_I	stxa	%r26, [%r18 + 0x0104] %asi
	.word 0xf2a4e097  ! 2266: STWA_I	stwa	%r25, [%r19 + 0x0097] %asi
	.word 0xfc7421cb  ! 2268: STX_I	stx	%r30, [%r16 + 0x01cb]
	.word 0xb00c2132  ! 2270: AND_I	and 	%r16, 0x0132, %r24
cpu_intr_3_184:
	setx	0x30033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_185:
	setx	0x310100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_186:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4c020  ! 2277: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	.word 0xbe3c6092  ! 2278: XNOR_I	xnor 	%r17, 0x0092, %r31
cpu_intr_3_187:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_104:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 2283: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb2bc0000  ! 2285: XNORcc_R	xnorcc 	%r16, %r0, %r25
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_105:
	mov	0xf, %r14
	.word 0xfef38400  ! 2288: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, e)
	.word 0xf8f42086  ! 2292: STXA_I	stxa	%r28, [%r16 + 0x0086] %asi
	.word 0xb13d8000  ! 2293: SRA_R	sra 	%r22, %r0, %r24
T3_asi_reg_rd_110:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf02d20e0  ! 2296: STB_I	stb	%r24, [%r20 + 0x00e0]
	.word 0xfc2cc000  ! 2298: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf625a198  ! 2299: STW_I	stw	%r27, [%r22 + 0x0198]
T3_asi_reg_rd_111:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_188:
	setx	0x32022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfead4020  ! 2304: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xf4b54020  ! 2305: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xfe24e077  ! 2313: STW_I	stw	%r31, [%r19 + 0x0077]
T3_asi_reg_rd_113:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0ac8020  ! 2315: STBA_R	stba	%r24, [%r18 + %r0] 0x01
cpu_intr_3_189:
	setx	0x32021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c204e  ! 2320: STB_I	stb	%r25, [%r16 + 0x004e]
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b82  ! 2321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
cpu_intr_3_190:
	setx	0x32032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e13b  ! 2325: STW_I	stw	%r29, [%r19 + 0x013b]
	.word 0xf4b48020  ! 2327: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf874c000  ! 2329: STX_R	stx	%r28, [%r19 + %r0]
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_106:
	mov	0x2b, %r14
	.word 0xfef38400  ! 2333: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb0b5c000  ! 2334: ORNcc_R	orncc 	%r23, %r0, %r24
T3_asi_reg_rd_114:
	mov	0x27, %r14
	.word 0xf0db8e60  ! 2337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf63561a5  ! 2338: STH_I	sth	%r27, [%r21 + 0x01a5]
	.word 0xfe35613f  ! 2341: STH_I	sth	%r31, [%r21 + 0x013f]
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0ac6018  ! 2345: STBA_I	stba	%r24, [%r17 + 0x0018] %asi
	.word 0xf8b58020  ! 2346: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_rd_115:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 2347: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_191:
	setx	0x300309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_116:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf2356197  ! 2359: STH_I	sth	%r25, [%r21 + 0x0197]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c58  ! 2361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c58, %hpstate
	.word 0xf42ca1ea  ! 2362: STB_I	stb	%r26, [%r18 + 0x01ea]
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_192:
	setx	0x320221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c20ed  ! 2366: STB_I	stb	%r29, [%r16 + 0x00ed]
T3_asi_reg_wr_107:
	mov	0x2d, %r14
	.word 0xf4f38e80  ! 2367: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb404a130  ! 2370: ADD_I	add 	%r18, 0x0130, %r26
	.word 0xf82d6172  ! 2372: STB_I	stb	%r28, [%r21 + 0x0172]
	.word 0xf2b5e0b8  ! 2374: STHA_I	stha	%r25, [%r23 + 0x00b8] %asi
T3_asi_reg_wr_108:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 2376: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0348000  ! 2377: STH_R	sth	%r24, [%r18 + %r0]
T3_asi_reg_rd_117:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 2379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf4ac0020  ! 2383: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_193:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x32033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_195:
	setx	0x330332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5e1b4  ! 2392: STHA_I	stha	%r31, [%r23 + 0x01b4] %asi
	.word 0x8394e1a0  ! 2394: WRPR_TNPC_I	wrpr	%r19, 0x01a0, %tnpc
	.word 0xfc350000  ! 2395: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfeb52115  ! 2396: STHA_I	stha	%r31, [%r20 + 0x0115] %asi
	.word 0xfc2de115  ! 2398: STB_I	stb	%r30, [%r23 + 0x0115]
	.word 0xf42de0db  ! 2402: STB_I	stb	%r26, [%r23 + 0x00db]
cpu_intr_3_196:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_109:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 2406: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfa348000  ! 2407: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf6b44020  ! 2410: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xfef4e0b3  ! 2413: STXA_I	stxa	%r31, [%r19 + 0x00b3] %asi
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_118:
	mov	0x27, %r14
	.word 0xfedb8e60  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d4a  ! 2419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
cpu_intr_3_197:
	setx	0x31011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8756047  ! 2422: STX_I	stx	%r28, [%r21 + 0x0047]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_198:
	setx	0x330338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 3)
	.word 0xfaa5e0ec  ! 2430: STWA_I	stwa	%r29, [%r23 + 0x00ec] %asi
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 29)
	.word 0xfab4a11c  ! 2435: STHA_I	stha	%r29, [%r18 + 0x011c] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_199:
	setx	0x300139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x300012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c613b  ! 2459: AND_I	and 	%r17, 0x013b, %r24
	.word 0xf4346194  ! 2464: STH_I	sth	%r26, [%r17 + 0x0194]
	.word 0xf42ca197  ! 2465: STB_I	stb	%r26, [%r18 + 0x0197]
	.word 0xf474c000  ! 2466: STX_R	stx	%r26, [%r19 + %r0]
T3_asi_reg_rd_119:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 2468: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_201:
	setx	0x300017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_120:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 2470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_202:
	setx	0x310012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_110:
	mov	0x30, %r14
	.word 0xfef38e80  ! 2473: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_111:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 2475: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_203:
	setx	0x320228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 2483: RDPR_TSTATE	rdpr	%tstate, %r25
T3_asi_reg_rd_121:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983bd8  ! 2488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd8, %hpstate
T3_asi_reg_wr_112:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 2489: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xba1d4000  ! 2490: XOR_R	xor 	%r21, %r0, %r29
	.word 0xf2adc020  ! 2494: STBA_R	stba	%r25, [%r23 + %r0] 0x01
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 10)
	.word 0xb935a001  ! 2496: SRL_I	srl 	%r22, 0x0001, %r28
T3_asi_reg_wr_113:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2497: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_114:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 2499: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_115:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 2500: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_116:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 2504: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf624a08d  ! 2509: STW_I	stw	%r27, [%r18 + 0x008d]
	.word 0xfa2c8000  ! 2512: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb8c4a1c6  ! 2513: ADDCcc_I	addccc 	%r18, 0x01c6, %r28
	.word 0xf2f42005  ! 2514: STXA_I	stxa	%r25, [%r16 + 0x0005] %asi
	.word 0xfc748000  ! 2515: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf8344000  ! 2516: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_117:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 2517: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_204:
	setx	0x300214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 2526: STHA_R	stha	%r30, [%r18 + %r0] 0x01
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_205:
	setx	0x30003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf83421fa  ! 2532: STH_I	sth	%r28, [%r16 + 0x01fa]
	.word 0xf6254000  ! 2533: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf4240000  ! 2535: STW_R	stw	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc34c000  ! 2538: STH_R	sth	%r30, [%r19 + %r0]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 19)
	.word 0xfca460cf  ! 2543: STWA_I	stwa	%r30, [%r17 + 0x00cf] %asi
cpu_intr_3_206:
	setx	0x300226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_118:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 2547: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb83c6019  ! 2549: XNOR_I	xnor 	%r17, 0x0019, %r28
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 1)
	.word 0xf2a50020  ! 2554: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
cpu_intr_3_207:
	setx	0x320325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 28)
	.word 0xfe2dc000  ! 2558: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xbc948000  ! 2559: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xf2348000  ! 2564: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xfe2561e7  ! 2567: STW_I	stw	%r31, [%r21 + 0x01e7]
	.word 0xf2a58020  ! 2568: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf8346169  ! 2569: STH_I	sth	%r28, [%r17 + 0x0169]
	.word 0xb2b40000  ! 2572: ORNcc_R	orncc 	%r16, %r0, %r25
T3_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 2573: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf8ad0020  ! 2574: STBA_R	stba	%r28, [%r20 + %r0] 0x01
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_122:
	mov	0x2b, %r14
	.word 0xf2db89e0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbd7d4400  ! 2580: MOVR_R	movre	%r21, %r0, %r30
	.word 0xfeade035  ! 2586: STBA_I	stba	%r31, [%r23 + 0x0035] %asi
T3_asi_reg_rd_123:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 2587: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfef4e0b7  ! 2590: STXA_I	stxa	%r31, [%r19 + 0x00b7] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_208:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 2599: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_124:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf835206c  ! 2602: STH_I	sth	%r28, [%r20 + 0x006c]
cpu_intr_3_209:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_210:
	setx	0x330320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_211:
	setx	0x310227, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d98  ! 2611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
	.word 0xfa75611d  ! 2612: STX_I	stx	%r29, [%r21 + 0x011d]
	.word 0xfa34a00d  ! 2613: STH_I	sth	%r29, [%r18 + 0x000d]
	.word 0xfa24c000  ! 2614: STW_R	stw	%r29, [%r19 + %r0]
cpu_intr_3_212:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2626: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_125:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 2627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf2342053  ! 2629: STH_I	sth	%r25, [%r16 + 0x0053]
	.word 0xbe9421d0  ! 2632: ORcc_I	orcc 	%r16, 0x01d0, %r31
T3_asi_reg_wr_122:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 2633: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_213:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d201e  ! 2636: STB_I	stb	%r28, [%r20 + 0x001e]
cpu_intr_3_214:
	setx	0x31022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_123:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2641: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_126:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 2643: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfaa44020  ! 2644: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xf4adc020  ! 2645: STBA_R	stba	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_124:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 2646: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_215:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5c020  ! 2651: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_127:
	mov	0x28, %r14
	.word 0xf4db8e80  ! 2656: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 15)
	.word 0xfc2ce104  ! 2660: STB_I	stb	%r30, [%r19 + 0x0104]
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf435a033  ! 2667: STH_I	sth	%r26, [%r22 + 0x0033]
T3_asi_reg_wr_125:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 2670: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819839d0  ! 2671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
cpu_intr_3_216:
	setx	0x330233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8adc020  ! 2674: STBA_R	stba	%r28, [%r23 + %r0] 0x01
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_128:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_217:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 2684: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbf3dc000  ! 2687: SRA_R	sra 	%r23, %r0, %r31
cpu_intr_3_218:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_126:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 2691: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfc354000  ! 2694: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, e)
	.word 0xf835c000  ! 2703: STH_R	sth	%r28, [%r23 + %r0]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_219:
	setx	0x320329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 2712: STB_R	stb	%r29, [%r23 + %r0]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_130:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb92c6001  ! 2717: SLL_I	sll 	%r17, 0x0001, %r28
T3_asi_reg_wr_127:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2718: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_128:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 2729: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf03461bc  ! 2732: STH_I	sth	%r24, [%r17 + 0x01bc]
	.word 0xf82da1bc  ! 2733: STB_I	stb	%r28, [%r22 + 0x01bc]
cpu_intr_3_220:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2340000  ! 2736: SUBC_R	orn 	%r16, %r0, %r25
cpu_intr_3_221:
	setx	0x350111, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f0a  ! 2738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xf2752005  ! 2740: STX_I	stx	%r25, [%r20 + 0x0005]
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_222:
	setx	0x370125, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_129:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 2745: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e12  ! 2748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
	.word 0xf2244000  ! 2749: STW_R	stw	%r25, [%r17 + %r0]
T3_asi_reg_wr_130:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 2750: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_132:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 2752: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_223:
	setx	0x35030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_133:
	mov	0x32, %r14
	.word 0xfedb8400  ! 2757: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbd2db001  ! 2759: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xb52df001  ! 2760: SLLX_I	sllx	%r23, 0x0001, %r26
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_131:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 2765: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_132:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2767: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbc34a0dc  ! 2770: SUBC_I	orn 	%r18, 0x00dc, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf0a5e0f5  ! 2773: STWA_I	stwa	%r24, [%r23 + 0x00f5] %asi
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfa348000  ! 2789: STH_R	sth	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcac60d7  ! 2797: STBA_I	stba	%r30, [%r17 + 0x00d7] %asi
	.word 0xf8ac8020  ! 2798: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_133:
	mov	0xb, %r14
	.word 0xf8f38e60  ! 2799: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_134:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2800: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfab460ae  ! 2802: STHA_I	stha	%r29, [%r17 + 0x00ae] %asi
T3_asi_reg_rd_134:
	mov	0x3, %r14
	.word 0xf8db8400  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_135:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb2a40000  ! 2808: SUBcc_R	subcc 	%r16, %r0, %r25
T3_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 2809: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfe344000  ! 2811: STH_R	sth	%r31, [%r17 + %r0]
cpu_intr_3_224:
	setx	0x360323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_225:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf62d6004  ! 2820: STB_I	stb	%r27, [%r21 + 0x0004]
	.word 0xfeacc020  ! 2823: STBA_R	stba	%r31, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xbc9dc000  ! 2825: XORcc_R	xorcc 	%r23, %r0, %r30
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 19)
	.word 0xfe34a190  ! 2830: STH_I	sth	%r31, [%r18 + 0x0190]
	.word 0xf6ad8020  ! 2833: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xf2b44020  ! 2834: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	.word 0xf8750000  ! 2835: STX_R	stx	%r28, [%r20 + %r0]
cpu_intr_3_226:
	setx	0x34002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x34011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_228:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 24)
	.word 0xbf7cc400  ! 2848: MOVR_R	movre	%r19, %r0, %r31
T3_asi_reg_rd_136:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 2849: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb77da401  ! 2851: MOVR_I	movre	%r22, 0x1, %r27
T3_asi_reg_rd_137:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 2853: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_rd_138:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 2854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_229:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f52110  ! 2856: STXA_I	stxa	%r24, [%r20 + 0x0110] %asi
	.word 0xf8b56153  ! 2858: STHA_I	stha	%r28, [%r21 + 0x0153] %asi
	.word 0xfa24e0ea  ! 2859: STW_I	stw	%r29, [%r19 + 0x00ea]
	.word 0xf0a5e1b9  ! 2862: STWA_I	stwa	%r24, [%r23 + 0x01b9] %asi
cpu_intr_3_230:
	setx	0x360321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_231:
	setx	0x360124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2460d4  ! 2872: STW_I	stw	%r31, [%r17 + 0x00d4]
cpu_intr_3_232:
	setx	0x37033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_233:
	setx	0x34010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 2882: SUBC_R	orn 	%r17, %r0, %r24
cpu_intr_3_234:
	setx	0x370226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 2889: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf675603e  ! 2890: STX_I	stx	%r27, [%r21 + 0x003e]
	.word 0xfe2da07c  ! 2892: STB_I	stb	%r31, [%r22 + 0x007c]
cpu_intr_3_235:
	setx	0x37021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_236:
	setx	0x360314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74a1ee  ! 2897: STX_I	stx	%r30, [%r18 + 0x01ee]
T3_asi_reg_wr_136:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 2904: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xba84a051  ! 2909: ADDcc_I	addcc 	%r18, 0x0051, %r29
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 8)
	.word 0xfeb4a005  ! 2912: STHA_I	stha	%r31, [%r18 + 0x0005] %asi
	.word 0xbc8c4000  ! 2914: ANDcc_R	andcc 	%r17, %r0, %r30
T3_asi_reg_rd_139:
	mov	0x5, %r14
	.word 0xfedb8400  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_237:
	setx	0x340325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x370236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c61d9  ! 2920: STB_I	stb	%r29, [%r17 + 0x01d9]
	.word 0xf07561e5  ! 2921: STX_I	stx	%r24, [%r21 + 0x01e5]
	.word 0xfc35e090  ! 2922: STH_I	sth	%r30, [%r23 + 0x0090]
cpu_intr_3_239:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 2924: STH_R	sth	%r28, [%r20 + %r0]
cpu_intr_3_240:
	setx	0x350217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ada0b0  ! 2927: STBA_I	stba	%r24, [%r22 + 0x00b0] %asi
	.word 0xf6b5c020  ! 2928: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf825a0a6  ! 2929: STW_I	stw	%r28, [%r22 + 0x00a6]
	.word 0xb4340000  ! 2930: SUBC_R	orn 	%r16, %r0, %r26
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_137:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 2933: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc348000  ! 2934: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_241:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_242:
	setx	0x34011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cca  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cca, %hpstate
	.word 0xf4740000  ! 2948: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xfcac6144  ! 2950: STBA_I	stba	%r30, [%r17 + 0x0144] %asi
	.word 0xf8258000  ! 2951: STW_R	stw	%r28, [%r22 + %r0]
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_243:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74a13d  ! 2958: STX_I	stx	%r29, [%r18 + 0x013d]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf6742185  ! 2961: STX_I	stx	%r27, [%r16 + 0x0185]
T3_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 2962: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf4a42126  ! 2965: STWA_I	stwa	%r26, [%r16 + 0x0126] %asi
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfa2521fb  ! 2969: STW_I	stw	%r29, [%r20 + 0x01fb]
cpu_intr_3_244:
	setx	0x10202, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_140:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_245:
	setx	0x350238, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819839ca  ! 2980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
T3_asi_reg_wr_139:
	mov	0x24, %r14
	.word 0xf8f38400  ! 2982: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_141:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb93c3001  ! 2992: SRAX_I	srax	%r16, 0x0001, %r28
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 17)
	.word 0xf635c000  ! 2997: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf4ac8020  ! 2998: STBA_R	stba	%r26, [%r18 + %r0] 0x01
cpu_intr_3_246:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 20)
	.word 0xb92ce001  ! 3002: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xf6ada0ed  ! 3004: STBA_I	stba	%r27, [%r22 + 0x00ed] %asi
T3_asi_reg_rd_142:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb135b001  ! 3007: SRLX_I	srlx	%r22, 0x0001, %r24
T3_asi_reg_rd_143:
	mov	0x17, %r14
	.word 0xf2db8400  ! 3008: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_247:
	setx	0x360201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 3014: STX_R	stx	%r24, [%r21 + %r0]
T3_asi_reg_rd_144:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0x8994e095  ! 3017: WRPR_TICK_I	wrpr	%r19, 0x0095, %tick
	.word 0xf02521dd  ! 3018: STW_I	stw	%r24, [%r20 + 0x01dd]
	.word 0xb9643801  ! 3020: MOVcc_I	<illegal instruction>
	.word 0xf274e125  ! 3021: STX_I	stx	%r25, [%r19 + 0x0125]
	.word 0xfc254000  ! 3022: STW_R	stw	%r30, [%r21 + %r0]
cpu_intr_3_248:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5a024  ! 3029: STXA_I	stxa	%r29, [%r22 + 0x0024] %asi
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_249:
	setx	0x340019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_140:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 3034: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbe1c0000  ! 3035: XOR_R	xor 	%r16, %r0, %r31
cpu_intr_3_250:
	setx	0x36030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_141:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3042: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_251:
	setx	0x37033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0acc020  ! 3047: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_142:
	mov	0x11, %r14
	.word 0xf2f38400  ! 3057: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf2348000  ! 3058: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf035a178  ! 3059: STH_I	sth	%r24, [%r22 + 0x0178]
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, d)
	.word 0xf22c4000  ! 3062: STB_R	stb	%r25, [%r17 + %r0]
T3_asi_reg_wr_143:
	mov	0x6, %r14
	.word 0xfef389e0  ! 3063: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_252:
	setx	0x360127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_253:
	setx	0x350102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_254:
	setx	0x34021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635e1cf  ! 3071: STH_I	sth	%r27, [%r23 + 0x01cf]
	.word 0xf2748000  ! 3073: STX_R	stx	%r25, [%r18 + %r0]
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_NONHPRIV
	.word 0x819560b3  ! 3082: WRPR_TPC_I	wrpr	%r21, 0x00b3, %tpc
	.word 0xfa74e059  ! 3083: STX_I	stx	%r29, [%r19 + 0x0059]
T3_asi_reg_wr_144:
	mov	0x32, %r14
	.word 0xfef38400  ! 3086: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc25a02e  ! 3091: STW_I	stw	%r30, [%r22 + 0x002e]
	.word 0xf074605c  ! 3093: STX_I	stx	%r24, [%r17 + 0x005c]
	.word 0xf6740000  ! 3096: STX_R	stx	%r27, [%r16 + %r0]
T3_asi_reg_rd_145:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_146:
	mov	0x24, %r14
	.word 0xf2db8400  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_147:
	mov	0x1d, %r14
	.word 0xfadb89e0  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfaac4020  ! 3105: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xb62d21e5  ! 3106: ANDN_I	andn 	%r20, 0x01e5, %r27
	.word 0xf8f5a0d8  ! 3107: STXA_I	stxa	%r28, [%r22 + 0x00d8] %asi
T3_asi_reg_wr_145:
	mov	0x36, %r14
	.word 0xfef38400  ! 3108: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf2ad2140  ! 3109: STBA_I	stba	%r25, [%r20 + 0x0140] %asi
cpu_intr_3_255:
	setx	0x36032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 3112: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
cpu_intr_3_256:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcaca163  ! 3114: STBA_I	stba	%r30, [%r18 + 0x0163] %asi
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3120: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a42  ! 3122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
	.word 0xf4a5e177  ! 3124: STWA_I	stwa	%r26, [%r23 + 0x0177] %asi
	.word 0xfaace1f2  ! 3130: STBA_I	stba	%r29, [%r19 + 0x01f2] %asi
	.word 0xb08d4000  ! 3132: ANDcc_R	andcc 	%r21, %r0, %r24
cpu_intr_3_257:
	setx	0x340010, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_147:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 3135: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb20c0000  ! 3138: AND_R	and 	%r16, %r0, %r25
	.word 0xfea4a16b  ! 3139: STWA_I	stwa	%r31, [%r18 + 0x016b] %asi
cpu_intr_3_258:
	setx	0x36000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 3141: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfe35c000  ! 3142: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_259:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfeb50020  ! 3148: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xf4242161  ! 3149: STW_I	stw	%r26, [%r16 + 0x0161]
T3_asi_reg_rd_148:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf02d8000  ! 3152: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_wr_148:
	mov	0x7, %r14
	.word 0xf4f38e80  ! 3153: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf82c0000  ! 3154: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfe340000  ! 3157: STH_R	sth	%r31, [%r16 + %r0]
T3_asi_reg_wr_149:
	mov	0x25, %r14
	.word 0xf8f38e60  ! 3158: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_150:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 3159: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb33d1000  ! 3160: SRAX_R	srax	%r20, %r0, %r25
	.word 0xf4b521de  ! 3162: STHA_I	stha	%r26, [%r20 + 0x01de] %asi
cpu_intr_3_260:
	setx	0x370103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 1b)
	.word 0xbc2de0ea  ! 3167: ANDN_I	andn 	%r23, 0x00ea, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 4)
	.word 0xb234c000  ! 3172: ORN_R	orn 	%r19, %r0, %r25
cpu_intr_3_261:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_151:
	mov	0xb, %r14
	.word 0xf8f38400  ! 3175: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_262:
	setx	0x3a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a13c  ! 3179: STX_I	stx	%r25, [%r22 + 0x013c]
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_263:
	setx	0x3a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf824e1b0  ! 3185: STW_I	stw	%r28, [%r19 + 0x01b0]
cpu_intr_3_264:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 3188: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xfe348000  ! 3190: STH_R	sth	%r31, [%r18 + %r0]
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 3f)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a00  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a00, %hpstate
T3_asi_reg_rd_149:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 3193: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_265:
	setx	0x3b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4c020  ! 3203: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_152:
	mov	0xb, %r14
	.word 0xfef38e40  ! 3205: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0f5e111  ! 3206: STXA_I	stxa	%r24, [%r23 + 0x0111] %asi
	.word 0xfc2d61ea  ! 3207: STB_I	stb	%r30, [%r21 + 0x01ea]
	.word 0xf4a5a0d3  ! 3209: STWA_I	stwa	%r26, [%r22 + 0x00d3] %asi
T3_asi_reg_rd_150:
	mov	0x2, %r14
	.word 0xfedb8e80  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfc74c000  ! 3212: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_153:
	mov	0x2e, %r14
	.word 0xfef38e80  ! 3214: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_266:
	setx	0x3a0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_154:
	mov	0xf, %r14
	.word 0xfcf389e0  ! 3217: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf62ce1aa  ! 3218: STB_I	stb	%r27, [%r19 + 0x01aa]
	.word 0xf02560d1  ! 3221: STW_I	stw	%r24, [%r21 + 0x00d1]
	.word 0xfcb4e1ab  ! 3224: STHA_I	stha	%r30, [%r19 + 0x01ab] %asi
	.word 0xf2a52172  ! 3226: STWA_I	stwa	%r25, [%r20 + 0x0172] %asi
	.word 0xb88cc000  ! 3228: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xb2bd8000  ! 3230: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xb23c21e6  ! 3231: XNOR_I	xnor 	%r16, 0x01e6, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfcac6023  ! 3236: STBA_I	stba	%r30, [%r17 + 0x0023] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 16)
	.word 0xb3510000  ! 3238: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf4ada1fd  ! 3239: STBA_I	stba	%r26, [%r22 + 0x01fd] %asi
	.word 0xf82d2171  ! 3244: STB_I	stb	%r28, [%r20 + 0x0171]
T3_asi_reg_rd_151:
	mov	0x38, %r14
	.word 0xf4db8e80  ! 3245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf234e14c  ! 3250: STH_I	sth	%r25, [%r19 + 0x014c]
T3_asi_reg_rd_152:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf22c8000  ! 3253: STB_R	stb	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2b4a099  ! 3261: STHA_I	stha	%r25, [%r18 + 0x0099] %asi
	.word 0xf074e148  ! 3262: STX_I	stx	%r24, [%r19 + 0x0148]
	.word 0xf8ad2126  ! 3266: STBA_I	stba	%r28, [%r20 + 0x0126] %asi
T3_asi_reg_wr_155:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 3267: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_154:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc34c000  ! 3269: STH_R	sth	%r30, [%r19 + %r0]
T3_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 3273: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_3_267:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c58  ! 3276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c58, %hpstate
cpu_intr_3_268:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x380219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa748000  ! 3279: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf8f561f6  ! 3282: STXA_I	stxa	%r28, [%r21 + 0x01f6] %asi
	.word 0xf2adc020  ! 3283: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfeada0b1  ! 3285: STBA_I	stba	%r31, [%r22 + 0x00b1] %asi
cpu_intr_3_270:
	setx	0x3a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_156:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 3)
	.word 0xfe2d4000  ! 3300: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xbf7d4400  ! 3301: MOVR_R	movre	%r21, %r0, %r31
cpu_intr_3_271:
	setx	0x390112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 16)
	.word 0xbf7dc400  ! 3304: MOVR_R	movre	%r23, %r0, %r31
	.word 0xfa34e095  ! 3305: STH_I	sth	%r29, [%r19 + 0x0095]
	.word 0xfaa54020  ! 3307: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xb414c000  ! 3308: OR_R	or 	%r19, %r0, %r26
	.word 0xf4f52096  ! 3309: STXA_I	stxa	%r26, [%r20 + 0x0096] %asi
	.word 0xf0b40020  ! 3313: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xfe35c000  ! 3317: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xbe84e194  ! 3318: ADDcc_I	addcc 	%r19, 0x0194, %r31
cpu_intr_3_272:
	setx	0x3b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835203c  ! 3325: STH_I	sth	%r28, [%r20 + 0x003c]
	.word 0xbc3d4000  ! 3326: XNOR_R	xnor 	%r21, %r0, %r30
T3_asi_reg_rd_157:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 3328: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_156:
	mov	0x28, %r14
	.word 0xfef384a0  ! 3330: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d88  ! 3331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_158:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 3333: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2356116  ! 3338: STH_I	sth	%r25, [%r21 + 0x0116]
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_159:
	mov	0x27, %r14
	.word 0xf8db84a0  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf02c2008  ! 3345: STB_I	stb	%r24, [%r16 + 0x0008]
T3_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 3346: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_273:
	setx	0x380221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_274:
	setx	0x390130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x3b0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_160:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_276:
	setx	0x3a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 3357: STB_R	stb	%r24, [%r19 + %r0]
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf0ace116  ! 3362: STBA_I	stba	%r24, [%r19 + 0x0116] %asi
	.word 0xfc2c61f9  ! 3363: STB_I	stb	%r30, [%r17 + 0x01f9]
cpu_intr_3_277:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_161:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 3366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 21)
	.word 0xb23d4000  ! 3369: XNOR_R	xnor 	%r21, %r0, %r25
cpu_intr_3_278:
	setx	0x3b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_279:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08460b8  ! 3375: ADDcc_I	addcc 	%r17, 0x00b8, %r24
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 32)
	.word 0xf62d0000  ! 3378: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf0240000  ! 3380: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_rd_162:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 3383: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_280:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 3385: STX_R	stx	%r28, [%r18 + %r0]
cpu_intr_3_281:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 3388: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, b)
	.word 0xfab40020  ! 3394: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_282:
	setx	0x39000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_163:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 3400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_158:
	mov	0x22, %r14
	.word 0xfcf38400  ! 3402: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf0f5a108  ! 3403: STXA_I	stxa	%r24, [%r22 + 0x0108] %asi
T3_asi_reg_wr_159:
	mov	0x1e, %r14
	.word 0xf4f38400  ! 3404: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 12)
	.word 0xfe7461b6  ! 3407: STX_I	stx	%r31, [%r17 + 0x01b6]
T3_asi_reg_wr_160:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3408: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc2cc000  ! 3410: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xfcad0020  ! 3412: STBA_R	stba	%r30, [%r20 + %r0] 0x01
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_283:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfe350000  ! 3419: STH_R	sth	%r31, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_284:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_285:
	setx	0x380037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_164:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 3429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6358000  ! 3430: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfc348000  ! 3431: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_286:
	setx	0x3b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfcac0020  ! 3435: STBA_R	stba	%r30, [%r16 + %r0] 0x01
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, a)
	.word 0xf2750000  ! 3439: STX_R	stx	%r25, [%r20 + %r0]
cpu_intr_3_287:
	setx	0x3a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225e178  ! 3448: STW_I	stw	%r25, [%r23 + 0x0178]
	.word 0xf02c610c  ! 3449: STB_I	stb	%r24, [%r17 + 0x010c]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_TO_TL0
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_288:
	setx	0x38022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabce026  ! 3457: XNORcc_I	xnorcc 	%r19, 0x0026, %r29
	.word 0xfc24611d  ! 3458: STW_I	stw	%r30, [%r17 + 0x011d]
cpu_intr_3_289:
	setx	0x390026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x390221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_291:
	setx	0x380007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_292:
	setx	0x3b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22cc000  ! 3467: STB_R	stb	%r25, [%r19 + %r0]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_TO_TL1
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 5)
	.word 0xfc2d0000  ! 3478: STB_R	stb	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf674a025  ! 3482: STX_I	stx	%r27, [%r18 + 0x0025]
	.word 0xfaf5e005  ! 3483: STXA_I	stxa	%r29, [%r23 + 0x0005] %asi
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf6a54020  ! 3487: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
T3_asi_reg_wr_161:
	mov	0x30, %r14
	.word 0xf4f384a0  ! 3488: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_293:
	setx	0x3b0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8342095  ! 3490: STH_I	sth	%r28, [%r16 + 0x0095]
	.word 0xfcb48020  ! 3491: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xbeac4000  ! 3495: ANDNcc_R	andncc 	%r17, %r0, %r31
	.word 0xf2348000  ! 3500: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf2ac8020  ! 3501: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xfaad0020  ! 3504: STBA_R	stba	%r29, [%r20 + %r0] 0x01
T3_asi_reg_wr_162:
	mov	0x25, %r14
	.word 0xfaf38400  ! 3505: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_294:
	setx	0x3b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c2183  ! 3510: XORcc_I	xorcc 	%r16, 0x0183, %r27
cpu_intr_3_295:
	setx	0x390304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24a1b5  ! 3513: STW_I	stw	%r29, [%r18 + 0x01b5]
	.word 0xb40c0000  ! 3515: AND_R	and 	%r16, %r0, %r26
T3_asi_reg_wr_163:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 3516: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5510000  ! 3517: RDPR_TICK	rdpr	%tick, %r26
T3_asi_reg_rd_165:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_296:
	setx	0x39033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_297:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 3536: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_298:
	setx	0x390221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a153  ! 3539: STWA_I	stwa	%r28, [%r18 + 0x0153] %asi
T3_asi_reg_wr_165:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 3540: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4f5a03d  ! 3541: STXA_I	stxa	%r26, [%r22 + 0x003d] %asi
T3_asi_reg_rd_166:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 3542: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_166:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3545: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbcbc4000  ! 3546: XNORcc_R	xnorcc 	%r17, %r0, %r30
T3_asi_reg_rd_167:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 3547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_299:
	setx	0x3b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_167:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 3549: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_168:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_300:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_302:
	setx	0x390315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_168:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 3559: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_303:
	setx	0x3b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3420f0  ! 3569: STH_I	sth	%r31, [%r16 + 0x00f0]
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_304:
	setx	0x39022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3580: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfab4e15b  ! 3583: STHA_I	stha	%r29, [%r19 + 0x015b] %asi
T3_asi_reg_wr_170:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 3585: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfc2d8000  ! 3586: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf835a050  ! 3589: STH_I	sth	%r28, [%r22 + 0x0050]
cpu_intr_3_305:
	setx	0x39022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c02  ! 3592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8b4e04b  ! 3595: STHA_I	stha	%r28, [%r19 + 0x004b] %asi
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 33)
	.word 0xf4f5a1c2  ! 3599: STXA_I	stxa	%r26, [%r22 + 0x01c2] %asi
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_169:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_306:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_170:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_307:
	setx	0x3b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_308:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, c)
	.word 0xfc3460ab  ! 3611: STH_I	sth	%r30, [%r17 + 0x00ab]
T3_asi_reg_wr_171:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 3612: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2f420e1  ! 3615: STXA_I	stxa	%r25, [%r16 + 0x00e1] %asi
cpu_intr_3_309:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad2075  ! 3618: STBA_I	stba	%r27, [%r20 + 0x0075] %asi
T3_asi_reg_wr_172:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 3620: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf635c000  ! 3621: STH_R	sth	%r27, [%r23 + %r0]
	.word 0x9195201f  ! 3622: WRPR_PIL_I	wrpr	%r20, 0x001f, %pil
cpu_intr_3_310:
	setx	0x3d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf67421c1  ! 3631: STX_I	stx	%r27, [%r16 + 0x01c1]
cpu_intr_3_311:
	setx	0x3d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d8000  ! 3633: XNOR_R	xnor 	%r22, %r0, %r28
T3_asi_reg_rd_171:
	mov	0x28, %r14
	.word 0xfedb8e80  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 19)
	.word 0xf835a1bc  ! 3636: STH_I	sth	%r28, [%r22 + 0x01bc]
	.word 0xf03460e0  ! 3639: STH_I	sth	%r24, [%r17 + 0x00e0]
	.word 0xb72c5000  ! 3640: SLLX_R	sllx	%r17, %r0, %r27
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 39)
	.word 0xb5643801  ! 3647: MOVcc_I	<illegal instruction>
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 6)
	.word 0xbd34d000  ! 3650: SRLX_R	srlx	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_173:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 3654: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, f)
	.word 0xf8a4c020  ! 3658: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xb28ce1ef  ! 3659: ANDcc_I	andcc 	%r19, 0x01ef, %r25
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 4)
	.word 0xb52c0000  ! 3662: SLL_R	sll 	%r16, %r0, %r26
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 13)
	.word 0xfef5a016  ! 3664: STXA_I	stxa	%r31, [%r22 + 0x0016] %asi
T3_asi_reg_rd_172:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 3666: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfcacc020  ! 3667: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf4254000  ! 3668: STW_R	stw	%r26, [%r21 + %r0]
cpu_intr_3_312:
	setx	0x3e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5e1db  ! 3671: STHA_I	stha	%r24, [%r23 + 0x01db] %asi
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_313:
	setx	0x3c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_315:
	setx	0x3d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6342095  ! 3684: ORN_I	orn 	%r16, 0x0095, %r27
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 38)
	.word 0xb48de0ef  ! 3689: ANDcc_I	andcc 	%r23, 0x00ef, %r26
	.word 0xb8254000  ! 3690: SUB_R	sub 	%r21, %r0, %r28
	.word 0xf02c4000  ! 3692: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 3694: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_316:
	setx	0x3c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad4020  ! 3697: STBA_R	stba	%r25, [%r21 + %r0] 0x01
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_317:
	setx	0x3d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_318:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_319:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3710: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf62d2172  ! 3711: STB_I	stb	%r27, [%r20 + 0x0172]
cpu_intr_3_320:
	setx	0x3f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 3713: STH_R	sth	%r30, [%r23 + %r0]
T3_asi_reg_rd_174:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfaac8020  ! 3716: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_175:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3720: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcac21ce  ! 3721: STBA_I	stba	%r30, [%r16 + 0x01ce] %asi
	.word 0xf8ad61d0  ! 3723: STBA_I	stba	%r28, [%r21 + 0x01d0] %asi
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf275a1b2  ! 3725: STX_I	stx	%r25, [%r22 + 0x01b2]
cpu_intr_3_321:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 7)
	.word 0xfeb4612f  ! 3732: STHA_I	stha	%r31, [%r17 + 0x012f] %asi
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 4)
	.word 0xfa2d4000  ! 3743: STB_R	stb	%r29, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_176:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_322:
	setx	0x3e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 35)
	.word 0xf4250000  ! 3753: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_rd_177:
	mov	0x19, %r14
	.word 0xfcdb8e60  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0a5c020  ! 3756: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8750000  ! 3763: STX_R	stx	%r28, [%r20 + %r0]
cpu_intr_3_323:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2258000  ! 3769: STW_R	stw	%r25, [%r22 + %r0]
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe2c8000  ! 3772: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf434c000  ! 3774: STH_R	sth	%r26, [%r19 + %r0]
cpu_intr_3_324:
	setx	0x3f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_176:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 3776: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_325:
	setx	0x3d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17cc400  ! 3782: MOVR_R	movre	%r19, %r0, %r24
	.word 0xfc758000  ! 3784: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_177:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 3785: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfef560ca  ! 3786: STXA_I	stxa	%r31, [%r21 + 0x00ca] %asi
cpu_intr_3_326:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d5a  ! 3789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e08  ! 3791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e08, %hpstate
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 12)
	.word 0xfcad21a2  ! 3795: STBA_I	stba	%r30, [%r20 + 0x01a2] %asi
cpu_intr_3_327:
	setx	0x3f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_328:
	setx	0x3e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_178:
	mov	0x12, %r14
	.word 0xf6db89e0  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_329:
	setx	0x3d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_179:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 3805: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6340000  ! 3809: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xfeb4c020  ! 3810: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xfca50020  ! 3811: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
cpu_intr_3_330:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 3816: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982998  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_178:
	mov	0x2f, %r14
	.word 0xfaf38e40  ! 3827: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2a5e05a  ! 3828: STWA_I	stwa	%r25, [%r23 + 0x005a] %asi
	.word 0xfe346038  ! 3829: STH_I	sth	%r31, [%r17 + 0x0038]
	.word 0xf6258000  ! 3830: STW_R	stw	%r27, [%r22 + %r0]
cpu_intr_3_331:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434c000  ! 3839: ORN_R	orn 	%r19, %r0, %r26
	.word 0xfeb4c020  ! 3841: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xfea52037  ! 3843: STWA_I	stwa	%r31, [%r20 + 0x0037] %asi
cpu_intr_3_332:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e10c  ! 3850: STHA_I	stha	%r28, [%r23 + 0x010c] %asi
	.word 0xf625607a  ! 3852: STW_I	stw	%r27, [%r21 + 0x007a]
T3_asi_reg_wr_179:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 3854: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_180:
	mov	0x2c, %r14
	.word 0xf8f38e80  ! 3860: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf075a025  ! 3872: STX_I	stx	%r24, [%r22 + 0x0025]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_333:
	setx	0x3e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024e1ee  ! 3880: STW_I	stw	%r24, [%r19 + 0x01ee]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 23)
	.word 0xfc24e16f  ! 3885: STW_I	stw	%r30, [%r19 + 0x016f]
	ta	T_CHANGE_TO_TL1
	.word 0xbe350000  ! 3888: ORN_R	orn 	%r20, %r0, %r31
	.word 0xf075c000  ! 3889: STX_R	stx	%r24, [%r23 + %r0]
T3_asi_reg_rd_182:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfea58020  ! 3891: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xb49c4000  ! 3892: XORcc_R	xorcc 	%r17, %r0, %r26
cpu_intr_3_334:
	setx	0x3f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e062  ! 3894: STH_I	sth	%r31, [%r19 + 0x0062]
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 0)
	.word 0xf4b4a0a5  ! 3897: STHA_I	stha	%r26, [%r18 + 0x00a5] %asi
	.word 0xfea5c020  ! 3898: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xfaad201b  ! 3899: STBA_I	stba	%r29, [%r20 + 0x001b] %asi
	.word 0xfc24c000  ! 3904: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_335:
	setx	0x3f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8258000  ! 3914: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xb024a1a4  ! 3917: SUB_I	sub 	%r18, 0x01a4, %r24
	.word 0xfaa48020  ! 3918: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3922: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
cpu_intr_3_336:
	setx	0x3c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_337:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_338:
	setx	0x3e0321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x3d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a066  ! 3935: STW_I	stw	%r31, [%r18 + 0x0066]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_182:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 3944: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf82d8000  ! 3945: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf63461bb  ! 3949: STH_I	sth	%r27, [%r17 + 0x01bb]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_183:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf6ad4020  ! 3956: STBA_R	stba	%r27, [%r21 + %r0] 0x01
T3_asi_reg_rd_184:
	mov	0x25, %r14
	.word 0xf6db89e0  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, c)
	.word 0xfcad4020  ! 3967: STBA_R	stba	%r30, [%r21 + %r0] 0x01
cpu_intr_3_340:
	setx	0x3c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfcac0020  ! 3975: STBA_R	stba	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_183:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 3976: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf2b5c020  ! 3977: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf034a048  ! 3978: STH_I	sth	%r24, [%r18 + 0x0048]
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 25)
	.word 0xb4c420b4  ! 3981: ADDCcc_I	addccc 	%r16, 0x00b4, %r26
	.word 0xf4a420fb  ! 3982: STWA_I	stwa	%r26, [%r16 + 0x00fb] %asi
	.word 0xb8a5c000  ! 3984: SUBcc_R	subcc 	%r23, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf2f56049  ! 3986: STXA_I	stxa	%r25, [%r21 + 0x0049] %asi
T3_asi_reg_rd_185:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_341:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf349000  ! 3992: SRLX_R	srlx	%r18, %r0, %r31
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_184:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 3999: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb0b4a18d  ! 4003: ORNcc_I	orncc 	%r18, 0x018d, %r24
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f80  ! 4004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f80, %hpstate
	.word 0xfaf5215b  ! 4007: STXA_I	stxa	%r29, [%r20 + 0x015b] %asi
	.word 0xfe3461c1  ! 4008: STH_I	sth	%r31, [%r17 + 0x01c1]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf02c209e  ! 4010: STB_I	stb	%r24, [%r16 + 0x009e]
	.word 0xf82d0000  ! 4012: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xfa244000  ! 4013: STW_R	stw	%r29, [%r17 + %r0]
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b02  ! 4014: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_342:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_344:
	setx	0x3d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_185:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 4028: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_186:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 9)
	.word 0xfcb460df  ! 4035: STHA_I	stha	%r30, [%r17 + 0x00df] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_345:
	setx	0x3d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_186:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 4040: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_346:
	setx	0x3f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024203a  ! 4046: STW_I	stw	%r24, [%r16 + 0x003a]
	.word 0xf42c4000  ! 4052: STB_R	stb	%r26, [%r17 + %r0]
cpu_intr_3_347:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_187:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 4055: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_187:
	mov	0x22, %r14
	.word 0xfadb89e0  ! 4060: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 30)
	.word 0xfab58020  ! 4063: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf0a50020  ! 4065: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xfa2c6144  ! 4066: STB_I	stb	%r29, [%r17 + 0x0144]
	.word 0xf6f42185  ! 4067: STXA_I	stxa	%r27, [%r16 + 0x0185] %asi
T3_asi_reg_rd_188:
	mov	0xe, %r14
	.word 0xfedb8e80  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4069: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, c)
	.word 0xf6a4c020  ! 4071: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
cpu_intr_3_348:
	setx	0x3e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad6086  ! 4075: STBA_I	stba	%r24, [%r21 + 0x0086] %asi
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_349:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x3e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d2401  ! 4081: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xb93d4000  ! 4082: SRA_R	sra 	%r21, %r0, %r28
	.word 0xfead6117  ! 4083: STBA_I	stba	%r31, [%r21 + 0x0117] %asi
	.word 0xf2ace073  ! 4086: STBA_I	stba	%r25, [%r19 + 0x0073] %asi
	.word 0xf02c61e4  ! 4087: STB_I	stb	%r24, [%r17 + 0x01e4]
T3_asi_reg_wr_189:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 4092: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_189:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 4095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_351:
	setx	0x410317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35c000  ! 4099: SRL_R	srl 	%r23, %r0, %r30
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0b4a113  ! 4106: STHA_I	stha	%r24, [%r18 + 0x0113] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb1508000  ! 4117: RDPR_TSTATE	rdpr	%tstate, %r24
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0240000  ! 4119: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf8a50020  ! 4120: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xba05a117  ! 4123: ADD_I	add 	%r22, 0x0117, %r29
	.word 0xb1518000  ! 4124: RDPR_PSTATE	<illegal instruction>
	.word 0xbe3ca06d  ! 4125: XNOR_I	xnor 	%r18, 0x006d, %r31
	.word 0xb0bd8000  ! 4126: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xfe2de081  ! 4127: STB_I	stb	%r31, [%r23 + 0x0081]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc242171  ! 4132: STW_I	stw	%r30, [%r16 + 0x0171]
	.word 0xb2250000  ! 4133: SUB_R	sub 	%r20, %r0, %r25
cpu_intr_3_352:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_190:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 4135: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4ad8020  ! 4136: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf2254000  ! 4138: STW_R	stw	%r25, [%r21 + %r0]
T3_asi_reg_wr_191:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 4140: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf4754000  ! 4142: STX_R	stx	%r26, [%r21 + %r0]
cpu_intr_3_353:
	setx	0x430232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 4144: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xb12c3001  ! 4146: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xfa752188  ! 4147: STX_I	stx	%r29, [%r20 + 0x0188]
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, b)
	.word 0xf82420d8  ! 4150: STW_I	stw	%r28, [%r16 + 0x00d8]
	.word 0xfe75c000  ! 4151: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfeb4e123  ! 4154: STHA_I	stha	%r31, [%r19 + 0x0123] %asi
	.word 0xf4acc020  ! 4155: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xf42520a0  ! 4156: STW_I	stw	%r26, [%r20 + 0x00a0]
	.word 0xf6254000  ! 4158: STW_R	stw	%r27, [%r21 + %r0]
T3_asi_reg_rd_190:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 5)
	.word 0xf22d4000  ! 4163: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xfc750000  ! 4164: STX_R	stx	%r30, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf2252003  ! 4170: STW_I	stw	%r25, [%r20 + 0x0003]
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 7)
	.word 0xf4ac2110  ! 4182: STBA_I	stba	%r26, [%r16 + 0x0110] %asi
	.word 0xfeb5e035  ! 4183: STHA_I	stha	%r31, [%r23 + 0x0035] %asi
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_192:
	mov	0x33, %r14
	.word 0xfaf38e80  ! 4189: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_wr_193:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 4191: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983fc2  ! 4192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
	.word 0xbf3cd000  ! 4195: SRAX_R	srax	%r19, %r0, %r31
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 2)
	.word 0xf235a1be  ! 4199: STH_I	sth	%r25, [%r22 + 0x01be]
	.word 0xf4a5a0a9  ! 4200: STWA_I	stwa	%r26, [%r22 + 0x00a9] %asi
cpu_intr_3_354:
	setx	0x43012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52cb001  ! 4204: SLLX_I	sllx	%r18, 0x0001, %r26
T3_asi_reg_rd_191:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 4205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf475a091  ! 4207: STX_I	stx	%r26, [%r22 + 0x0091]
T3_asi_reg_wr_194:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 4208: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_195:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 4210: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfca561b1  ! 4212: STWA_I	stwa	%r30, [%r21 + 0x01b1] %asi
T3_asi_reg_rd_192:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_355:
	setx	0x420215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_193:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_356:
	setx	0x430324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b561f7  ! 4231: STHA_I	stha	%r26, [%r21 + 0x01f7] %asi
	.word 0xf4b4a1c4  ! 4232: STHA_I	stha	%r26, [%r18 + 0x01c4] %asi
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_357:
	setx	0x43010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x22, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8444000  ! 4236: ADDC_R	addc 	%r17, %r0, %r28
cpu_intr_3_359:
	setx	0x400329, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb0b4e1e4  ! 4239: ORNcc_I	orncc 	%r19, 0x01e4, %r24
	.word 0xf0f5a1bf  ! 4241: STXA_I	stxa	%r24, [%r22 + 0x01bf] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfa34a00c  ! 4243: STH_I	sth	%r29, [%r18 + 0x000c]
T3_asi_reg_wr_196:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 4246: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_360:
	setx	0x420216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 4249: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf275a059  ! 4251: STX_I	stx	%r25, [%r22 + 0x0059]
cpu_intr_3_361:
	setx	0x410313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0246094  ! 4254: STW_I	stw	%r24, [%r17 + 0x0094]
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_362:
	setx	0x42031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6354000  ! 4259: STH_R	sth	%r27, [%r21 + %r0]
T3_asi_reg_wr_197:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 4260: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6350000  ! 4264: STH_R	sth	%r27, [%r20 + %r0]
T3_asi_reg_rd_194:
	mov	0x23, %r14
	.word 0xf0db84a0  ! 4268: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_363:
	setx	0x41000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93cc000  ! 4280: SRA_R	sra 	%r19, %r0, %r28
T3_asi_reg_rd_196:
	mov	0x2, %r14
	.word 0xf4db89e0  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_198:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 4289: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2b521ba  ! 4290: STHA_I	stha	%r25, [%r20 + 0x01ba] %asi
	.word 0xf0754000  ! 4293: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_364:
	setx	0x400004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5a147  ! 4296: SUBcc_I	subcc 	%r22, 0x0147, %r30
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 14)
	.word 0xf2f4a1b4  ! 4301: STXA_I	stxa	%r25, [%r18 + 0x01b4] %asi
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_365:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf8a48020  ! 4314: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 29)
	.word 0xfab5a049  ! 4316: STHA_I	stha	%r29, [%r22 + 0x0049] %asi
cpu_intr_3_366:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_367:
	setx	0x40023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 4327: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_368:
	setx	0x420012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_369:
	setx	0x430135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4e1ff  ! 4334: STHA_I	stha	%r27, [%r19 + 0x01ff] %asi
cpu_intr_3_370:
	setx	0x400015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6342065  ! 4337: STH_I	sth	%r27, [%r16 + 0x0065]
	.word 0xb77c8400  ! 4339: MOVR_R	movre	%r18, %r0, %r27
	.word 0xbc8d4000  ! 4341: ANDcc_R	andcc 	%r21, %r0, %r30
cpu_intr_3_371:
	setx	0x430235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_200:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 4346: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_199:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 4347: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_200:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 4348: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_201:
	mov	0x5, %r14
	.word 0xfaf38400  ! 4349: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_372:
	setx	0x400218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 2)
	.word 0xfeb48020  ! 4353: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_373:
	setx	0x41022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035c000  ! 4355: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_rd_201:
	mov	0x11, %r14
	.word 0xf4db8400  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfaa5e0d0  ! 4357: STWA_I	stwa	%r29, [%r23 + 0x00d0] %asi
	.word 0xf8a54020  ! 4358: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	.word 0x819520e6  ! 4359: WRPR_TPC_I	wrpr	%r20, 0x00e6, %tpc
	.word 0xfa346046  ! 4361: STH_I	sth	%r29, [%r17 + 0x0046]
	.word 0xf6a4e1c7  ! 4362: STWA_I	stwa	%r27, [%r19 + 0x01c7] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_202:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_374:
	setx	0x43031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e5a  ! 4376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
T3_asi_reg_wr_202:
	mov	0x2f, %r14
	.word 0xfef38400  ! 4377: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_375:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_376:
	setx	0x40033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a4a0bd  ! 4382: STWA_I	stwa	%r24, [%r18 + 0x00bd] %asi
T3_asi_reg_wr_203:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 4387: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf82c4000  ! 4389: STB_R	stb	%r28, [%r17 + %r0]
T3_asi_reg_rd_204:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_204:
	mov	0xb, %r14
	.word 0xfcf38e80  ! 4391: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf634209d  ! 4395: STH_I	sth	%r27, [%r16 + 0x009d]
	.word 0xf62d216e  ! 4397: STB_I	stb	%r27, [%r20 + 0x016e]
	.word 0xf6b5200e  ! 4398: STHA_I	stha	%r27, [%r20 + 0x000e] %asi
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983840  ! 4400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
	.word 0xf6744000  ! 4401: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_wr_205:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 4402: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfea4a195  ! 4403: STWA_I	stwa	%r31, [%r18 + 0x0195] %asi
T3_asi_reg_rd_205:
	mov	0x22, %r14
	.word 0xf0db8e60  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_377:
	setx	0x420026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 4410: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf4b42116  ! 4412: STHA_I	stha	%r26, [%r16 + 0x0116] %asi
	.word 0xf275a026  ! 4413: STX_I	stx	%r25, [%r22 + 0x0026]
cpu_intr_3_378:
	setx	0x42030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_379:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_TO_TL1
	.word 0xf6a44020  ! 4421: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xfe24a183  ! 4422: STW_I	stw	%r31, [%r18 + 0x0183]
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_380:
	setx	0x43021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 26)
	.word 0xb20c8000  ! 4433: AND_R	and 	%r18, %r0, %r25
cpu_intr_3_381:
	setx	0x410031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24c000  ! 4435: STW_R	stw	%r29, [%r19 + %r0]
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa2cc000  ! 4439: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6b5204a  ! 4442: STHA_I	stha	%r27, [%r20 + 0x004a] %asi
T3_asi_reg_wr_206:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4445: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf2340000  ! 4447: STH_R	sth	%r25, [%r16 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf02dc000  ! 4451: STB_R	stb	%r24, [%r23 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_382:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4a09a  ! 4462: STHA_I	stha	%r26, [%r18 + 0x009a] %asi
	.word 0xf8752195  ! 4464: STX_I	stx	%r28, [%r20 + 0x0195]
	.word 0xb444c000  ! 4468: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xb88da007  ! 4470: ANDcc_I	andcc 	%r22, 0x0007, %r28
cpu_intr_3_383:
	setx	0x410302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d0400  ! 4472: MOVR_R	movre	%r20, %r0, %r30
cpu_intr_3_384:
	setx	0x410015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead21eb  ! 4475: STBA_I	stba	%r31, [%r20 + 0x01eb] %asi
cpu_intr_3_385:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_386:
	setx	0x430129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 4482: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xbf7c4400  ! 4484: MOVR_R	movre	%r17, %r0, %r31
	.word 0xbea5e0f5  ! 4488: SUBcc_I	subcc 	%r23, 0x00f5, %r31
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_207:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 4493: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_387:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_388:
	setx	0x40000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 4503: STW_R	stw	%r26, [%r17 + %r0]
cpu_intr_3_389:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_390:
	setx	0x430323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4b5208f  ! 4513: STHA_I	stha	%r26, [%r20 + 0x008f] %asi
	.word 0xfc2d213f  ! 4515: STB_I	stb	%r30, [%r20 + 0x013f]
T3_asi_reg_rd_208:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6ac60ca  ! 4518: STBA_I	stba	%r27, [%r17 + 0x00ca] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_207:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 4521: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfca4a16d  ! 4522: STWA_I	stwa	%r30, [%r18 + 0x016d] %asi
T3_asi_reg_wr_208:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 4523: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_209:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 4525: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf62dc000  ! 4527: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_209:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 4532: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf6f46038  ! 4539: STXA_I	stxa	%r27, [%r17 + 0x0038] %asi
T3_asi_reg_wr_210:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 4542: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_391:
	setx	0x420006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_210:
	mov	0xe, %r14
	.word 0xfedb8e80  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_392:
	setx	0x410117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_211:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 4551: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_393:
	setx	0x470316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 5)
	.word 0xfaac20c2  ! 4556: STBA_I	stba	%r29, [%r16 + 0x00c2] %asi
T3_asi_reg_rd_212:
	mov	0xb, %r14
	.word 0xfadb8400  ! 4557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf8352157  ! 4558: STH_I	sth	%r28, [%r20 + 0x0157]
T3_asi_reg_wr_211:
	mov	0xd, %r14
	.word 0xfef38e40  ! 4564: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_394:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 4572: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xf8250000  ! 4575: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf434e1a6  ! 4576: STH_I	sth	%r26, [%r19 + 0x01a6]
	.word 0xbd3c6001  ! 4577: SRA_I	sra 	%r17, 0x0001, %r30
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_213:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 4587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_395:
	setx	0x460313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead6076  ! 4596: STBA_I	stba	%r31, [%r21 + 0x0076] %asi
	.word 0xbb358000  ! 4597: SRL_R	srl 	%r22, %r0, %r29
	.word 0xb0bd4000  ! 4598: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xfcb5a0ee  ! 4599: STHA_I	stha	%r30, [%r22 + 0x00ee] %asi
	.word 0xf2b56017  ! 4602: STHA_I	stha	%r25, [%r21 + 0x0017] %asi
	.word 0xfc248000  ! 4603: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf624a14f  ! 4604: STW_I	stw	%r27, [%r18 + 0x014f]
	.word 0xf0b4a161  ! 4605: STHA_I	stha	%r24, [%r18 + 0x0161] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf6750000  ! 4608: STX_R	stx	%r27, [%r20 + %r0]
cpu_intr_3_396:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 17)
	.word 0xf434c000  ! 4613: STH_R	sth	%r26, [%r19 + %r0]
cpu_intr_3_397:
	setx	0x46023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead8020  ! 4616: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xfc75a054  ! 4617: STX_I	stx	%r30, [%r22 + 0x0054]
T3_asi_reg_wr_212:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 4618: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xba8d209a  ! 4619: ANDcc_I	andcc 	%r20, 0x009a, %r29
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 18)
	.word 0x8794e15a  ! 4623: WRPR_TT_I	wrpr	%r19, 0x015a, %tt
cpu_intr_3_398:
	setx	0x460200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 4628: STB_R	stb	%r29, [%r23 + %r0]
T3_asi_reg_rd_214:
	mov	0xf, %r14
	.word 0xf6db89e0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfea5c020  ! 4630: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_rd_215:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb8bd0000  ! 4634: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0xb2b54000  ! 4635: SUBCcc_R	orncc 	%r21, %r0, %r25
cpu_intr_3_399:
	setx	0x46033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_216:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_400:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, b)
	.word 0xfab44020  ! 4645: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xfa34e1ff  ! 4652: STH_I	sth	%r29, [%r19 + 0x01ff]
	.word 0xfa258000  ! 4653: STW_R	stw	%r29, [%r22 + %r0]
cpu_intr_3_401:
	setx	0x45003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_217:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_218:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 2f)
	.word 0x8f902002  ! 4666: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xf6f4e094  ! 4667: STXA_I	stxa	%r27, [%r19 + 0x0094] %asi
T3_asi_reg_rd_219:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb57d2401  ! 4669: MOVR_I	movre	%r20, 0x1, %r26
T3_asi_reg_rd_220:
	mov	0xe, %r14
	.word 0xf6db84a0  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_213:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 4672: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_402:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62cc000  ! 4676: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfa35a172  ! 4677: STH_I	sth	%r29, [%r22 + 0x0172]
	.word 0xf2a5a1d2  ! 4681: STWA_I	stwa	%r25, [%r22 + 0x01d2] %asi
	.word 0xb00dc000  ! 4683: AND_R	and 	%r23, %r0, %r24
	.word 0x8d94e0fc  ! 4684: WRPR_PSTATE_I	wrpr	%r19, 0x00fc, %pstate
	.word 0xf2ad4020  ! 4686: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xf8750000  ! 4687: STX_R	stx	%r28, [%r20 + %r0]
cpu_intr_3_403:
	setx	0x47031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f82  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xfc758000  ! 4697: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xb4a40000  ! 4699: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xb9510000  ! 4700: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf22c0000  ! 4704: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfc35a1b1  ! 4707: STH_I	sth	%r30, [%r22 + 0x01b1]
	.word 0xf0a4218d  ! 4709: STWA_I	stwa	%r24, [%r16 + 0x018d] %asi
	.word 0xf42da1df  ! 4710: STB_I	stb	%r26, [%r22 + 0x01df]
	.word 0xbe856037  ! 4712: ADDcc_I	addcc 	%r21, 0x0037, %r31
	.word 0xf82c20f9  ! 4714: STB_I	stb	%r28, [%r16 + 0x00f9]
cpu_intr_3_404:
	setx	0x460115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf03560de  ! 4732: STH_I	sth	%r24, [%r21 + 0x00de]
	.word 0xf03460d7  ! 4734: STH_I	sth	%r24, [%r17 + 0x00d7]
	.word 0xb335a001  ! 4742: SRL_I	srl 	%r22, 0x0001, %r25
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0ade0c7  ! 4746: STBA_I	stba	%r24, [%r23 + 0x00c7] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_221:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_222:
	mov	0x1a, %r14
	.word 0xf8db89e0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_405:
	setx	0x460200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7357001  ! 4765: SRLX_I	srlx	%r21, 0x0001, %r27
T3_asi_reg_rd_223:
	mov	0x35, %r14
	.word 0xfadb84a0  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819838c8  ! 4771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c8, %hpstate
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf5a16d  ! 4774: STXA_I	stxa	%r30, [%r22 + 0x016d] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_406:
	setx	0x460127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa242013  ! 4785: STW_I	stw	%r29, [%r16 + 0x0013]
	.word 0xfa2c4000  ! 4786: STB_R	stb	%r29, [%r17 + %r0]
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 29)
	.word 0xf235a1ca  ! 4789: STH_I	sth	%r25, [%r22 + 0x01ca]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 35)
	.word 0xb13d9000  ! 4794: SRAX_R	srax	%r22, %r0, %r24
	.word 0xbb520000  ! 4795: RDPR_PIL	rdpr	%pil, %r29
T3_asi_reg_wr_214:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 4800: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb28d6162  ! 4802: ANDcc_I	andcc 	%r21, 0x0162, %r25
T3_asi_reg_rd_224:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 4804: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6f4a133  ! 4807: STXA_I	stxa	%r27, [%r18 + 0x0133] %asi
cpu_intr_3_407:
	setx	0x470213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_408:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_215:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4820: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_216:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 4823: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf434a144  ! 4825: STH_I	sth	%r26, [%r18 + 0x0144]
cpu_intr_3_409:
	setx	0x460224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d21ae  ! 4827: STB_I	stb	%r30, [%r20 + 0x01ae]
cpu_intr_3_410:
	setx	0x440225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd356001  ! 4832: SRL_I	srl 	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa75e195  ! 4837: STX_I	stx	%r29, [%r23 + 0x0195]
	.word 0xf2340000  ! 4838: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb12c8000  ! 4839: SLL_R	sll 	%r18, %r0, %r24
cpu_intr_3_411:
	setx	0x45033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b18  ! 4844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b18, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_217:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4847: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_412:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 4853: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xbe3d212a  ! 4856: XNOR_I	xnor 	%r20, 0x012a, %r31
	.word 0xf8344000  ! 4858: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xfea40020  ! 4867: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_218:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 4873: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_413:
	setx	0x46022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035a19a  ! 4878: STH_I	sth	%r24, [%r22 + 0x019a]
cpu_intr_3_414:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_415:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5e0de  ! 4887: STWA_I	stwa	%r29, [%r23 + 0x00de] %asi
	.word 0xfe2d0000  ! 4888: STB_R	stb	%r31, [%r20 + %r0]
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 11)
	.word 0xf83461f8  ! 4891: STH_I	sth	%r28, [%r17 + 0x01f8]
cpu_intr_3_416:
	setx	0x450024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a1c6  ! 4893: STXA_I	stxa	%r30, [%r18 + 0x01c6] %asi
	.word 0xfc7460a8  ! 4894: STX_I	stx	%r30, [%r17 + 0x00a8]
	.word 0xfeb4e1c3  ! 4895: STHA_I	stha	%r31, [%r19 + 0x01c3] %asi
cpu_intr_3_417:
	setx	0x460305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_219:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 4898: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0b48020  ! 4900: STHA_R	stha	%r24, [%r18 + %r0] 0x01
cpu_intr_3_418:
	setx	0x45033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_419:
	setx	0x44003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5a012  ! 4904: STWA_I	stwa	%r24, [%r22 + 0x0012] %asi
	.word 0xfa25e165  ! 4907: STW_I	stw	%r29, [%r23 + 0x0165]
	.word 0xf0742092  ! 4910: STX_I	stx	%r24, [%r16 + 0x0092]
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_420:
	setx	0x470310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d2158  ! 4916: XNOR_I	xnor 	%r20, 0x0158, %r27
	.word 0xf8b5a1fb  ! 4919: STHA_I	stha	%r28, [%r22 + 0x01fb] %asi
T3_asi_reg_wr_220:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 4922: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa34c000  ! 4924: STH_R	sth	%r29, [%r19 + %r0]
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 17)
	.word 0xfeb520b6  ! 4927: STHA_I	stha	%r31, [%r20 + 0x00b6] %asi
T3_asi_reg_wr_221:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 4930: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb2aca10e  ! 4932: ANDNcc_I	andncc 	%r18, 0x010e, %r25
	.word 0xf625c000  ! 4933: STW_R	stw	%r27, [%r23 + %r0]
T3_asi_reg_rd_225:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 4934: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_226:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 15)
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ad2  ! 4941: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
	.word 0xb484c000  ! 4942: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xf02d61f2  ! 4943: STB_I	stb	%r24, [%r21 + 0x01f2]
	.word 0xf634a0e4  ! 4944: STH_I	sth	%r27, [%r18 + 0x00e4]
	.word 0xf0358000  ! 4946: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf62cc000  ! 4947: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfef5a133  ! 4948: STXA_I	stxa	%r31, [%r22 + 0x0133] %asi
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 17)
	.word 0xfa35a1df  ! 4954: STH_I	sth	%r29, [%r22 + 0x01df]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b80  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b80, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb93c0000  ! 4962: SRA_R	sra 	%r16, %r0, %r28
	.word 0xf0a48020  ! 4964: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf4a5a11e  ! 4971: STWA_I	stwa	%r26, [%r22 + 0x011e] %asi
cpu_intr_3_421:
	setx	0x440309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63561df  ! 4979: STH_I	sth	%r27, [%r21 + 0x01df]
	.word 0xf4f4605e  ! 4980: STXA_I	stxa	%r26, [%r17 + 0x005e] %asi
	.word 0xb33c5000  ! 4982: SRAX_R	srax	%r17, %r0, %r25
cpu_intr_3_422:
	setx	0x440100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_423:
	setx	0x450319, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xfac54020  ! 1: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xf68c8020  ! 2: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xb8950000  ! 5: ORcc_R	orcc 	%r20, %r0, %r28
T2_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 10: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbcb44000  ! 11: ORNcc_R	orncc 	%r17, %r0, %r30
cpu_intr_2_0:
	setx	0x1d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc458000  ! 17: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfcd4c020  ! 18: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	.word 0xf455e1a0  ! 19: LDSH_I	ldsh	[%r23 + 0x01a0], %r26
T2_asi_reg_rd_0:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf08dc020  ! 23: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
cpu_intr_2_1:
	setx	0x1d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c50020  ! 25: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_NONHPRIV
	.word 0xf0c521aa  ! 30: LDSWA_I	ldswa	[%r20, + 0x01aa] %asi, %r24
cpu_intr_2_2:
	setx	0x1d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 34: MOVcc_I	<illegal instruction>
	.word 0xb73cd000  ! 41: SRAX_R	srax	%r19, %r0, %r27
	.word 0xf24c4000  ! 43: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfe05209c  ! 45: LDUW_I	lduw	[%r20 + 0x009c], %r31
T2_asi_reg_wr_1:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 46: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_3:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_4:
	setx	0x1c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x32, %r14
	.word 0xf4db84a0  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf85d8000  ! 58: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xfe44e1f2  ! 60: LDSW_I	ldsw	[%r19 + 0x01f2], %r31
	.word 0xfc0da114  ! 61: LDUB_I	ldub	[%r22 + 0x0114], %r30
cpu_intr_2_5:
	setx	0x1c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7358000  ! 64: SRL_R	srl 	%r22, %r0, %r27
T2_asi_reg_wr_2:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 65: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_6:
	setx	0x1d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf85da0ed  ! 70: LDX_I	ldx	[%r22 + 0x00ed], %r28
	.word 0xf8d54020  ! 76: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
T2_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 77: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc8c4000  ! 83: ANDcc_R	andcc 	%r17, %r0, %r30
cpu_intr_2_7:
	setx	0x1d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_4:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 85: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf684e121  ! 87: LDUWA_I	lduwa	[%r19, + 0x0121] %asi, %r27
	.word 0xf6d44020  ! 88: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 89: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0d4e155  ! 90: LDSHA_I	ldsha	[%r19, + 0x0155] %asi, %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, c)
	.word 0xb634a09f  ! 98: ORN_I	orn 	%r18, 0x009f, %r27
T2_asi_reg_rd_4:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_5:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_8:
	setx	0x1d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe940000  ! 116: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xf2d5a0ff  ! 118: LDSHA_I	ldsha	[%r22, + 0x00ff] %asi, %r25
cpu_intr_2_9:
	setx	0x1c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe840020  ! 123: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf0158000  ! 125: LDUH_R	lduh	[%r22 + %r0], %r24
T2_asi_reg_wr_5:
	mov	0x27, %r14
	.word 0xf6f389e0  ! 127: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbd520000  ! 130: RDPR_PIL	rdpr	%pil, %r30
cpu_intr_2_10:
	setx	0x1e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24e09f  ! 133: SUB_I	sub 	%r19, 0x009f, %r29
cpu_intr_2_11:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 36)
	.word 0xf214e089  ! 137: LDUH_I	lduh	[%r19 + 0x0089], %r25
T2_asi_reg_rd_6:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_7:
	mov	0x9, %r14
	.word 0xf4db89e0  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_8:
	mov	0x1c, %r14
	.word 0xf4db89e0  ! 144: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_9:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb551c000  ! 146: RDPR_TL	<illegal instruction>
cpu_intr_2_12:
	setx	0x1c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035e0d9  ! 148: ORN_I	orn 	%r23, 0x00d9, %r24
	.word 0xf00d202f  ! 149: LDUB_I	ldub	[%r20 + 0x002f], %r24
cpu_intr_2_13:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08da133  ! 152: LDUBA_I	lduba	[%r22, + 0x0133] %asi, %r24
	.word 0xf605e024  ! 153: LDUW_I	lduw	[%r23 + 0x0024], %r27
cpu_intr_2_14:
	setx	0x1d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48cc020  ! 155: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
T2_asi_reg_rd_10:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf45ca042  ! 157: LDX_I	ldx	[%r18 + 0x0042], %r26
	.word 0xfa8d0020  ! 159: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	.word 0xf88de075  ! 160: LDUBA_I	lduba	[%r23, + 0x0075] %asi, %r28
	.word 0xf214a19e  ! 165: LDUH_I	lduh	[%r18 + 0x019e], %r25
	.word 0xb83c8000  ! 166: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xf4d58020  ! 167: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 168: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_11:
	mov	0xc, %r14
	.word 0xfadb84a0  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_7:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 172: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_15:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_8:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 177: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf45ce1d7  ! 178: LDX_I	ldx	[%r19 + 0x01d7], %r26
	.word 0xf255611b  ! 179: LDSH_I	ldsh	[%r21 + 0x011b], %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_9:
	mov	0xd, %r14
	.word 0xf2f389e0  ! 184: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb435e17a  ! 188: ORN_I	orn 	%r23, 0x017a, %r26
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 11)
	.word 0xb6058000  ! 190: ADD_R	add 	%r22, %r0, %r27
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa0da142  ! 196: LDUB_I	ldub	[%r22 + 0x0142], %r29
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_16:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_17:
	setx	0x1f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6848020  ! 205: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_12:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 209: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 212: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf055610e  ! 213: LDSH_I	ldsh	[%r21 + 0x010e], %r24
	.word 0xb7641800  ! 214: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_13:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_18:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc5c6039  ! 226: LDX_I	ldx	[%r17 + 0x0039], %r30
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_20:
	setx	0x1f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654c000  ! 234: LDSH_R	ldsh	[%r19 + %r0], %r27
cpu_intr_2_21:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c46006  ! 237: LDSWA_I	ldswa	[%r17, + 0x0006] %asi, %r27
	.word 0xf64da10d  ! 240: LDSB_I	ldsb	[%r22 + 0x010d], %r27
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa548000  ! 242: LDSH_R	ldsh	[%r18 + %r0], %r29
T2_asi_reg_rd_14:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_22:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cda  ! 249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cda, %hpstate
cpu_intr_2_23:
	setx	0x20305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x34, %r14
	.word 0xf2f384a0  ! 256: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_24:
	setx	0x1e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_15:
	mov	0x11, %r14
	.word 0xfcdb84a0  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf6440000  ! 262: LDSW_R	ldsw	[%r16 + %r0], %r27
T2_asi_reg_wr_12:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_25:
	setx	0x1c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_26:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_16:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_13:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 279: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2dde099  ! 282: LDXA_I	ldxa	[%r23, + 0x0099] %asi, %r25
T2_asi_reg_wr_14:
	mov	0x5, %r14
	.word 0xfef38e80  ! 284: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb32cf001  ! 285: SLLX_I	sllx	%r19, 0x0001, %r25
cpu_intr_2_27:
	setx	0x1f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_15:
	mov	0x8, %r14
	.word 0xf0f38e80  ! 293: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf8c42106  ! 295: LDSWA_I	ldswa	[%r16, + 0x0106] %asi, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_16:
	mov	0x30, %r14
	.word 0xf6f384a0  ! 301: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf04c21cd  ! 303: LDSB_I	ldsb	[%r16 + 0x01cd], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfed560b4  ! 307: LDSHA_I	ldsha	[%r21, + 0x00b4] %asi, %r31
	.word 0x9194a1c0  ! 310: WRPR_PIL_I	wrpr	%r18, 0x01c0, %pil
	.word 0xf2d4e04d  ! 312: LDSHA_I	ldsha	[%r19, + 0x004d] %asi, %r25
	.word 0xf45d0000  ! 313: LDX_R	ldx	[%r20 + %r0], %r26
T2_asi_reg_wr_17:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 314: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_29:
	setx	0x1f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_30:
	setx	0x1f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa0cc000  ! 320: LDUB_R	ldub	[%r19 + %r0], %r29
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_HPRIV
cpu_intr_2_31:
	setx	0x1f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e90  ! 329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
cpu_intr_2_32:
	setx	0x1f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed4e07a  ! 332: LDSHA_I	ldsha	[%r19, + 0x007a] %asi, %r31
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8cda1f4  ! 336: LDSBA_I	ldsba	[%r22, + 0x01f4] %asi, %r28
cpu_intr_2_33:
	setx	0x1d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_17:
	mov	0x38, %r14
	.word 0xf0db8e60  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_34:
	setx	0x1d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 2f)
	.word 0xbcac8000  ! 343: ANDNcc_R	andncc 	%r18, %r0, %r30
T2_asi_reg_rd_18:
	mov	0xe, %r14
	.word 0xfcdb84a0  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfad561a0  ! 345: LDSHA_I	ldsha	[%r21, + 0x01a0] %asi, %r29
	.word 0xf4c44020  ! 346: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
	.word 0xfc950020  ! 349: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf6d48020  ! 355: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xfe04e1f9  ! 356: LDUW_I	lduw	[%r19 + 0x01f9], %r31
	.word 0xf45c600f  ! 361: LDX_I	ldx	[%r17 + 0x000f], %r26
cpu_intr_2_35:
	setx	0x1d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40cc000  ! 363: LDUB_R	ldub	[%r19 + %r0], %r26
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_19:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_36:
	setx	0x1c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_37:
	setx	0x1f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_38:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_39:
	setx	0x1c0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_20:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc0ca165  ! 392: LDUB_I	ldub	[%r18 + 0x0165], %r30
T2_asi_reg_wr_18:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 395: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfecc4020  ! 399: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_21:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_22:
	mov	0x15, %r14
	.word 0xf0db8400  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa55e068  ! 413: LDSH_I	ldsh	[%r23 + 0x0068], %r29
	.word 0xf6cca041  ! 417: LDSBA_I	ldsba	[%r18, + 0x0041] %asi, %r27
	.word 0xf45c6004  ! 418: LDX_I	ldx	[%r17 + 0x0004], %r26
T2_asi_reg_rd_23:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xb83c4000  ! 428: XNOR_R	xnor 	%r17, %r0, %r28
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_24:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 431: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf0c5e1c9  ! 435: LDSWA_I	ldswa	[%r23, + 0x01c9] %asi, %r24
T2_asi_reg_rd_25:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7357001  ! 441: SRLX_I	srlx	%r21, 0x0001, %r27
T2_asi_reg_rd_26:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfa458000  ! 444: LDSW_R	ldsw	[%r22 + %r0], %r29
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cc2  ! 449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
T2_asi_reg_wr_19:
	mov	0x1d, %r14
	.word 0xf0f384a0  ! 453: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_20:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 462: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf844c000  ! 463: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf8d50020  ! 464: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r28
	.word 0xbabda058  ! 465: XNORcc_I	xnorcc 	%r22, 0x0058, %r29
	.word 0xfe956084  ! 467: LDUHA_I	lduha	[%r21, + 0x0084] %asi, %r31
T2_asi_reg_wr_21:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 469: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_28:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 34)
	.word 0xb69c21f1  ! 473: XORcc_I	xorcc 	%r16, 0x01f1, %r27
	.word 0xf84ca117  ! 474: LDSB_I	ldsb	[%r18 + 0x0117], %r28
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc540000  ! 477: LDSH_R	ldsh	[%r16 + %r0], %r30
cpu_intr_2_40:
	setx	0x200207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6948020  ! 480: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_29:
	mov	0x1, %r14
	.word 0xf8db8e60  ! 481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_30:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, f)
	.word 0xf04c0000  ! 487: LDSB_R	ldsb	[%r16 + %r0], %r24
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf84c2011  ! 491: LDSB_I	ldsb	[%r16 + 0x0011], %r28
	.word 0xfe5c60f9  ! 495: LDX_I	ldx	[%r17 + 0x00f9], %r31
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb7349000  ! 502: SRLX_R	srlx	%r18, %r0, %r27
T2_asi_reg_wr_22:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 504: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6d5e057  ! 508: LDSHA_I	ldsha	[%r23, + 0x0057] %asi, %r27
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_41:
	setx	0x210205, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_23:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 511: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf40ce08d  ! 517: LDUB_I	ldub	[%r19 + 0x008d], %r26
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 25)
	.word 0x879520fa  ! 531: WRPR_TT_I	wrpr	%r20, 0x00fa, %tt
	.word 0xb025c000  ! 532: SUB_R	sub 	%r23, %r0, %r24
cpu_intr_2_42:
	setx	0x230333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc048000  ! 535: LDUW_R	lduw	[%r18 + %r0], %r30
T2_asi_reg_wr_24:
	mov	0xd, %r14
	.word 0xf8f384a0  ! 538: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0c52185  ! 539: ADDCcc_I	addccc 	%r20, 0x0185, %r24
	.word 0xb0854000  ! 541: ADDcc_R	addcc 	%r21, %r0, %r24
T2_asi_reg_rd_31:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf8844020  ! 543: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
cpu_intr_2_43:
	setx	0x210024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83da034  ! 545: XNOR_I	xnor 	%r22, 0x0034, %r28
T2_asi_reg_wr_25:
	mov	0x28, %r14
	.word 0xf4f38e60  ! 546: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfc154000  ! 548: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xb13d9000  ! 549: SRAX_R	srax	%r22, %r0, %r24
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_32:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_33:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c18  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xf8c4c020  ! 561: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
cpu_intr_2_44:
	setx	0x220117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c7001  ! 563: SRAX_I	srax	%r17, 0x0001, %r30
cpu_intr_2_45:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 566: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf64ce1c3  ! 567: LDSB_I	ldsb	[%r19 + 0x01c3], %r27
T2_asi_reg_wr_26:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 568: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb69d8000  ! 569: XORcc_R	xorcc 	%r22, %r0, %r27
	.word 0xf494c020  ! 570: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	.word 0xfe4c6068  ! 572: LDSB_I	ldsb	[%r17 + 0x0068], %r31
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_46:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 578: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb03d4000  ! 581: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xf2554000  ! 582: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf85d20df  ! 583: LDX_I	ldx	[%r20 + 0x00df], %r28
	.word 0xb7343001  ! 586: SRLX_I	srlx	%r16, 0x0001, %r27
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983982  ! 588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
	.word 0xfe9421dd  ! 589: LDUHA_I	lduha	[%r16, + 0x01dd] %asi, %r31
	.word 0xfcc56164  ! 592: LDSWA_I	ldswa	[%r21, + 0x0164] %asi, %r30
	.word 0xfad42117  ! 593: LDSHA_I	ldsha	[%r16, + 0x0117] %asi, %r29
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_35:
	mov	0x29, %r14
	.word 0xfedb8e40  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb8356050  ! 596: ORN_I	orn 	%r21, 0x0050, %r28
T2_asi_reg_wr_28:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 598: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8546076  ! 600: LDSH_I	ldsh	[%r17 + 0x0076], %r28
cpu_intr_2_47:
	setx	0x22020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed56185  ! 604: LDSHA_I	ldsha	[%r21, + 0x0185] %asi, %r31
T2_asi_reg_wr_29:
	mov	0x36, %r14
	.word 0xf0f38400  ! 609: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 26)
	.word 0xfa0ce03e  ! 613: LDUB_I	ldub	[%r19 + 0x003e], %r29
	.word 0xb09de097  ! 614: XORcc_I	xorcc 	%r23, 0x0097, %r24
	.word 0xf84521f4  ! 615: LDSW_I	ldsw	[%r20 + 0x01f4], %r28
	.word 0xf48d21cd  ! 618: LDUBA_I	lduba	[%r20, + 0x01cd] %asi, %r26
cpu_intr_2_48:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_30:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 621: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_49:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6450000  ! 623: ADDC_R	addc 	%r20, %r0, %r27
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_50:
	setx	0x200031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_HPRIV
cpu_intr_2_51:
	setx	0x22032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d40020  ! 645: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d0a  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_TO_TL1
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 24)
	.word 0xb8b46179  ! 655: ORNcc_I	orncc 	%r17, 0x0179, %r28
	.word 0xf24ca0f2  ! 657: LDSB_I	ldsb	[%r18 + 0x00f2], %r25
	.word 0xbd2df001  ! 664: SLLX_I	sllx	%r23, 0x0001, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbc1c21b0  ! 668: XOR_I	xor 	%r16, 0x01b0, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfa4c0000  ! 674: LDSB_R	ldsb	[%r16 + %r0], %r29
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_38:
	mov	0x11, %r14
	.word 0xf8db84a0  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 683: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfad48020  ! 685: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
	.word 0xf214e190  ! 687: LDUH_I	lduh	[%r19 + 0x0190], %r25
	.word 0xf2cdc020  ! 688: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
cpu_intr_2_52:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad520ef  ! 692: LDSHA_I	ldsha	[%r20, + 0x00ef] %asi, %r29
	.word 0xb9357001  ! 693: SRLX_I	srlx	%r21, 0x0001, %r28
T2_asi_reg_wr_32:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 695: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf44c4000  ! 696: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xfa14a1db  ! 698: LDUH_I	lduh	[%r18 + 0x01db], %r29
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_53:
	setx	0x220208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc94e025  ! 710: ORcc_I	orcc 	%r19, 0x0025, %r30
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 39)
	.word 0xf65da136  ! 717: LDX_I	ldx	[%r22 + 0x0136], %r27
cpu_intr_2_54:
	setx	0x200303, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_NONHPRIV
	.word 0xf0dce1ef  ! 728: LDXA_I	ldxa	[%r19, + 0x01ef] %asi, %r24
	.word 0xf8c54020  ! 735: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 4)
	.word 0xf0dd6017  ! 738: LDXA_I	ldxa	[%r21, + 0x0017] %asi, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xbe04c000  ! 742: ADD_R	add 	%r19, %r0, %r31
cpu_intr_2_55:
	setx	0x10211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_56:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 746: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xfc140000  ! 751: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xb3350000  ! 753: SRL_R	srl 	%r20, %r0, %r25
	.word 0xfe95c020  ! 754: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_57:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 22)
	.word 0xf604c000  ! 764: LDUW_R	lduw	[%r19 + %r0], %r27
T2_asi_reg_wr_34:
	mov	0x1f, %r14
	.word 0xf8f38e60  ! 766: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfcc44020  ! 767: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_39:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 769: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_58:
	setx	0x21032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf60c4000  ! 784: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xb08c8000  ! 785: ANDcc_R	andcc 	%r18, %r0, %r24
cpu_intr_2_60:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d8020  ! 787: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_61:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534c000  ! 791: SRL_R	srl 	%r19, %r0, %r26
T2_asi_reg_rd_40:
	mov	0x28, %r14
	.word 0xf8db8e60  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf6cc0020  ! 796: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_41:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_62:
	setx	0x220317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97da401  ! 802: MOVR_I	movre	%r22, 0x1, %r28
cpu_intr_2_63:
	setx	0x220020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 26)
	.word 0xf64560e8  ! 810: LDSW_I	ldsw	[%r21 + 0x00e8], %r27
cpu_intr_2_64:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85c020  ! 815: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_42:
	mov	0x3, %r14
	.word 0xf2db8e80  ! 820: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_35:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 824: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, a)
	.word 0xfedc617b  ! 827: LDXA_I	ldxa	[%r17, + 0x017b] %asi, %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_36:
	mov	0xb, %r14
	.word 0xfef38e40  ! 831: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0x8995e1d8  ! 833: WRPR_TICK_I	wrpr	%r23, 0x01d8, %tick
	.word 0xf2c420ba  ! 834: LDSWA_I	ldswa	[%r16, + 0x00ba] %asi, %r25
	.word 0xbf34a001  ! 835: SRL_I	srl 	%r18, 0x0001, %r31
T2_asi_reg_rd_43:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfa4d0000  ! 837: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfc45e0ac  ! 838: LDSW_I	ldsw	[%r23 + 0x00ac], %r30
T2_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_65:
	setx	0x21020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4c020  ! 851: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	.word 0xf00c6121  ! 852: LDUB_I	ldub	[%r17 + 0x0121], %r24
T2_asi_reg_rd_45:
	mov	0x30, %r14
	.word 0xf6db8e80  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_46:
	mov	0x1d, %r14
	.word 0xf6db8e80  ! 855: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_37:
	mov	0x1d, %r14
	.word 0xf2f38400  ! 859: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf05460d3  ! 860: LDSH_I	ldsh	[%r17 + 0x00d3], %r24
cpu_intr_2_66:
	setx	0x200210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 863: LDUW_R	lduw	[%r20 + %r0], %r26
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 28)
	.word 0xf84c4000  ! 867: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xb334f001  ! 869: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xf25461b2  ! 871: LDSH_I	ldsh	[%r17 + 0x01b2], %r25
	.word 0xfccdc020  ! 874: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 26)
	.word 0xfa840020  ! 876: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xb735b001  ! 877: SRLX_I	srlx	%r22, 0x0001, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xbb7cc400  ! 880: MOVR_R	movre	%r19, %r0, %r29
T2_asi_reg_wr_38:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 881: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0c4214f  ! 884: LDSWA_I	ldswa	[%r16, + 0x014f] %asi, %r24
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_47:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fca  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fca, %hpstate
	.word 0xfc0da003  ! 893: LDUB_I	ldub	[%r22 + 0x0003], %r30
	.word 0xfec4a04b  ! 894: LDSWA_I	ldswa	[%r18, + 0x004b] %asi, %r31
cpu_intr_2_67:
	setx	0x240032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 29)
	.word 0xf885c020  ! 898: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 25)
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b10  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b10, %hpstate
	.word 0xf88d4020  ! 907: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 6)
	.word 0xbec42130  ! 912: ADDCcc_I	addccc 	%r16, 0x0130, %r31
cpu_intr_2_68:
	setx	0x240030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 919: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbab54000  ! 920: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xfe0d214a  ! 922: LDUB_I	ldub	[%r20 + 0x014a], %r31
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_69:
	setx	0x25012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5a1f6  ! 932: ORNcc_I	orncc 	%r22, 0x01f6, %r31
	.word 0xfe8ca081  ! 933: LDUBA_I	lduba	[%r18, + 0x0081] %asi, %r31
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_70:
	setx	0x250228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dce103  ! 944: LDXA_I	ldxa	[%r19, + 0x0103] %asi, %r28
T2_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 945: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2cc0020  ! 946: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_48:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 951: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf60c8000  ! 952: LDUB_R	ldub	[%r18 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfe04e087  ! 955: LDUW_I	lduw	[%r19 + 0x0087], %r31
T2_asi_reg_rd_49:
	mov	0x23, %r14
	.word 0xf0db89e0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfec48020  ! 959: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
cpu_intr_2_72:
	setx	0x240323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_73:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf884c020  ! 966: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r28
	.word 0xfad54020  ! 967: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xbc454000  ! 972: ADDC_R	addc 	%r21, %r0, %r30
	.word 0xf25c0000  ! 974: LDX_R	ldx	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe854020  ! 979: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xbc95e115  ! 980: ORcc_I	orcc 	%r23, 0x0115, %r30
	.word 0xf6d48020  ! 981: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf014e003  ! 982: LDUH_I	lduh	[%r19 + 0x0003], %r24
	.word 0xfc95a072  ! 983: LDUHA_I	lduha	[%r22, + 0x0072] %asi, %r30
	.word 0xf0540000  ! 985: LDSH_R	ldsh	[%r16 + %r0], %r24
T2_asi_reg_rd_50:
	mov	0x1, %r14
	.word 0xf2db8400  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_51:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 988: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_74:
	setx	0x270007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1ca1ff  ! 994: XOR_I	xor 	%r18, 0x01ff, %r31
	.word 0xb7343001  ! 998: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb4ad6141  ! 1000: ANDNcc_I	andncc 	%r21, 0x0141, %r26
	.word 0xf6044000  ! 1001: LDUW_R	lduw	[%r17 + %r0], %r27
cpu_intr_2_75:
	setx	0x270130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5a0e8  ! 1004: LDSWA_I	ldswa	[%r22, + 0x00e8] %asi, %r31
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_76:
	setx	0x27023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_77:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de17c  ! 1012: LDX_I	ldx	[%r23 + 0x017c], %r31
	.word 0xf00ce099  ! 1013: LDUB_I	ldub	[%r19 + 0x0099], %r24
	.word 0xf4844020  ! 1014: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xb235a0f5  ! 1017: ORN_I	orn 	%r22, 0x00f5, %r25
	.word 0xb1643801  ! 1021: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL0
cpu_intr_2_78:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_79:
	setx	0x240339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c5a02e  ! 1033: LDSWA_I	ldswa	[%r22, + 0x002e] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xb4c4c000  ! 1035: ADDCcc_R	addccc 	%r19, %r0, %r26
cpu_intr_2_80:
	setx	0x240321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadc2033  ! 1041: LDXA_I	ldxa	[%r16, + 0x0033] %asi, %r29
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa540000  ! 1047: LDSH_R	ldsh	[%r16 + %r0], %r29
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfc958020  ! 1053: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
cpu_intr_2_81:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_52:
	mov	0x9, %r14
	.word 0xfadb8400  ! 1057: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 22)
	.word 0xb7340000  ! 1059: SRL_R	srl 	%r16, %r0, %r27
	.word 0xb13d8000  ! 1060: SRA_R	sra 	%r22, %r0, %r24
	.word 0xfcdda096  ! 1064: LDXA_I	ldxa	[%r22, + 0x0096] %asi, %r30
cpu_intr_2_82:
	setx	0x260105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 1069: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xf64d4000  ! 1070: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf60d61ff  ! 1071: LDUB_I	ldub	[%r21 + 0x01ff], %r27
T2_asi_reg_wr_41:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1074: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_53:
	mov	0x14, %r14
	.word 0xfadb84a0  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_54:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_TO_TL0
	.word 0xfe940020  ! 1091: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 26)
	.word 0xbcc4e0e6  ! 1093: ADDCcc_I	addccc 	%r19, 0x00e6, %r30
cpu_intr_2_83:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedde0fa  ! 1097: LDXA_I	ldxa	[%r23, + 0x00fa] %asi, %r31
cpu_intr_2_84:
	setx	0x240108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea4e0d2  ! 1102: SUBcc_I	subcc 	%r19, 0x00d2, %r31
T2_asi_reg_wr_42:
	mov	0x2d, %r14
	.word 0xfcf38e80  ! 1103: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8c4e1eb  ! 1106: LDSWA_I	ldswa	[%r19, + 0x01eb] %asi, %r28
	.word 0xf6040000  ! 1107: LDUW_R	lduw	[%r16 + %r0], %r27
cpu_intr_2_85:
	setx	0x270219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 1109: ORN_R	orn 	%r21, %r0, %r26
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, e)
	.word 0xf605a195  ! 1111: LDUW_I	lduw	[%r22 + 0x0195], %r27
	.word 0xf415e192  ! 1112: LDUH_I	lduh	[%r23 + 0x0192], %r26
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_43:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 1116: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_56:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbe35a01b  ! 1120: ORN_I	orn 	%r22, 0x001b, %r31
T2_asi_reg_wr_44:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 1124: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_86:
	setx	0x250302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba452026  ! 1128: ADDC_I	addc 	%r20, 0x0026, %r29
cpu_intr_2_87:
	setx	0x260135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_57:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbe24606c  ! 1133: SUB_I	sub 	%r17, 0x006c, %r31
	.word 0xfa84618b  ! 1136: LDUWA_I	lduwa	[%r17, + 0x018b] %asi, %r29
	.word 0xfa8da00d  ! 1138: LDUBA_I	lduba	[%r22, + 0x000d] %asi, %r29
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf2c5a06a  ! 1144: LDSWA_I	ldswa	[%r22, + 0x006a] %asi, %r25
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_58:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_88:
	setx	0x26012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b4c000  ! 1150: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xfe8d20f2  ! 1151: LDUBA_I	lduba	[%r20, + 0x00f2] %asi, %r31
	.word 0xb095a17d  ! 1152: ORcc_I	orcc 	%r22, 0x017d, %r24
	.word 0xfa454000  ! 1154: LDSW_R	ldsw	[%r21 + %r0], %r29
T2_asi_reg_rd_59:
	mov	0x22, %r14
	.word 0xf2db8400  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_89:
	setx	0x260016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48ca1fd  ! 1162: LDUBA_I	lduba	[%r18, + 0x01fd] %asi, %r26
	.word 0xf885e01f  ! 1163: LDUWA_I	lduwa	[%r23, + 0x001f] %asi, %r28
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 38)
	.word 0xb6a5615a  ! 1169: SUBcc_I	subcc 	%r21, 0x015a, %r27
cpu_intr_2_90:
	setx	0x270238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_45:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 1176: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_60:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe550000  ! 1181: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xba1de0e3  ! 1182: XOR_I	xor 	%r23, 0x00e3, %r29
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 13)
	.word 0xf8d48020  ! 1187: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
cpu_intr_2_91:
	setx	0x250010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8158000  ! 1189: LDUH_R	lduh	[%r22 + %r0], %r28
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f90  ! 1193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f90, %hpstate
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_61:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb2440000  ! 1199: ADDC_R	addc 	%r16, %r0, %r25
	.word 0xf60d8000  ! 1200: LDUB_R	ldub	[%r22 + %r0], %r27
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 3a)
	ta	T_CHANGE_HPRIV
cpu_intr_2_92:
	setx	0x26001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 1208: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_93:
	setx	0x240325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_94:
	setx	0x25013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_95:
	setx	0x260206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 1220: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xb82c2043  ! 1221: ANDN_I	andn 	%r16, 0x0043, %r28
T2_asi_reg_rd_62:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa540000  ! 1223: LDSH_R	ldsh	[%r16 + %r0], %r29
cpu_intr_2_96:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 1226: MOVcc_I	<illegal instruction>
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 15)
	.word 0xf694e184  ! 1229: LDUHA_I	lduha	[%r19, + 0x0184] %asi, %r27
T2_asi_reg_rd_63:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 1230: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_47:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1231: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe54a177  ! 1234: LDSH_I	ldsh	[%r18 + 0x0177], %r31
	.word 0xf645a0a2  ! 1236: LDSW_I	ldsw	[%r22 + 0x00a2], %r27
T2_asi_reg_wr_48:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 1241: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_97:
	setx	0x270312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_64:
	mov	0x1c, %r14
	.word 0xfedb8e80  ! 1248: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_49:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 1250: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_65:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfad54020  ! 1254: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xf0cc4020  ! 1255: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_66:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 1256: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfc154000  ! 1262: LDUH_R	lduh	[%r21 + %r0], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf65cc000  ! 1266: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xfe058000  ! 1267: LDUW_R	lduw	[%r22 + %r0], %r31
cpu_intr_2_98:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2040000  ! 1272: LDUW_R	lduw	[%r16 + %r0], %r25
cpu_intr_2_99:
	setx	0x270103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819828c8  ! 1275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
T2_asi_reg_wr_50:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 1277: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc952021  ! 1278: LDUHA_I	lduha	[%r20, + 0x0021] %asi, %r30
cpu_intr_2_100:
	setx	0x25010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x14, %r14
	.word 0xfadb8400  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_51:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 1281: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfed4a08b  ! 1284: LDSHA_I	ldsha	[%r18, + 0x008b] %asi, %r31
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, f)
	.word 0xf214e0d2  ! 1288: LDUH_I	lduh	[%r19 + 0x00d2], %r25
	.word 0xf645a0de  ! 1291: LDSW_I	ldsw	[%r22 + 0x00de], %r27
	.word 0xf24dc000  ! 1292: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf4440000  ! 1293: LDSW_R	ldsw	[%r16 + %r0], %r26
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_101:
	setx	0x24010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d4000  ! 1303: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf45dc000  ! 1305: LDX_R	ldx	[%r23 + %r0], %r26
cpu_intr_2_102:
	setx	0x250327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_52:
	mov	0x17, %r14
	.word 0xf4f38e60  ! 1311: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xfe95c020  ! 1314: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f4a  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
cpu_intr_2_103:
	setx	0x260208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 10)
	.word 0xb6142150  ! 1325: OR_I	or 	%r16, 0x0150, %r27
T2_asi_reg_wr_53:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 1328: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_104:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc0420c0  ! 1333: LDUW_I	lduw	[%r16 + 0x00c0], %r30
T2_asi_reg_rd_69:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8c5c020  ! 1336: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xb0b4a049  ! 1337: ORNcc_I	orncc 	%r18, 0x0049, %r24
cpu_intr_2_105:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55e0f3  ! 1342: LDSH_I	ldsh	[%r23 + 0x00f3], %r29
	.word 0xbf3d5000  ! 1344: SRAX_R	srax	%r21, %r0, %r31
cpu_intr_2_106:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_107:
	setx	0x250331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x250008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x260123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d0000  ! 1351: LDUB_R	ldub	[%r20 + %r0], %r28
T2_asi_reg_wr_54:
	mov	0xb, %r14
	.word 0xfaf38e80  ! 1352: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfc0c8000  ! 1354: LDUB_R	ldub	[%r18 + %r0], %r30
cpu_intr_2_110:
	setx	0x250127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_55:
	mov	0x26, %r14
	.word 0xf6f38e60  ! 1357: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc4c20ab  ! 1361: LDSB_I	ldsb	[%r16 + 0x00ab], %r30
	.word 0xf8458000  ! 1362: LDSW_R	ldsw	[%r22 + %r0], %r28
cpu_intr_2_111:
	setx	0x290023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_56:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 1372: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_57:
	mov	0x1f, %r14
	.word 0xf8f38e80  ! 1377: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb734f001  ! 1379: SRLX_I	srlx	%r19, 0x0001, %r27
T2_asi_reg_wr_58:
	mov	0x10, %r14
	.word 0xfcf38400  ! 1382: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0x83946006  ! 1384: WRPR_TNPC_I	wrpr	%r17, 0x0006, %tnpc
	.word 0xfe0d0000  ! 1386: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xfa8c8020  ! 1387: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf054c000  ! 1391: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xfe0561d5  ! 1392: LDUW_I	lduw	[%r21 + 0x01d5], %r31
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, e)
	.word 0xf694a196  ! 1400: LDUHA_I	lduha	[%r18, + 0x0196] %asi, %r27
	.word 0xb4c5e126  ! 1401: ADDCcc_I	addccc 	%r23, 0x0126, %r26
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe450000  ! 1409: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xf04d214e  ! 1412: LDSB_I	ldsb	[%r20 + 0x014e], %r24
cpu_intr_2_112:
	setx	0x2a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 1423: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_113:
	setx	0x2a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0140000  ! 1427: LDUH_R	lduh	[%r16 + %r0], %r24
T2_asi_reg_wr_60:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 1430: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0250000  ! 1434: SUB_R	sub 	%r20, %r0, %r24
cpu_intr_2_114:
	setx	0x2b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2d52089  ! 1444: LDSHA_I	ldsha	[%r20, + 0x0089] %asi, %r25
	.word 0xbc25e1c4  ! 1445: SUB_I	sub 	%r23, 0x01c4, %r30
cpu_intr_2_115:
	setx	0x2b0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_116:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83de125  ! 1448: XNOR_I	xnor 	%r23, 0x0125, %r28
T2_asi_reg_wr_61:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 1449: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb6ada1bf  ! 1450: ANDNcc_I	andncc 	%r22, 0x01bf, %r27
cpu_intr_2_117:
	setx	0x2a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_62:
	mov	0x2a, %r14
	.word 0xf2f38e80  ! 1459: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_118:
	setx	0x2a0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 1464: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198281a  ! 1466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081a, %hpstate
T2_asi_reg_wr_63:
	mov	0x18, %r14
	.word 0xf4f38e60  ! 1467: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4548000  ! 1468: LDSH_R	ldsh	[%r18 + %r0], %r26
T2_asi_reg_rd_71:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3540000  ! 1473: RDPR_GL	<illegal instruction>
cpu_intr_2_119:
	setx	0x290019, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x1e, %r14
	.word 0xf4db89e0  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_120:
	setx	0x280338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_73:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb93d0000  ! 1487: SRA_R	sra 	%r20, %r0, %r28
	.word 0xfa4d8000  ! 1491: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf0dc20de  ! 1492: LDXA_I	ldxa	[%r16, + 0x00de] %asi, %r24
T2_asi_reg_wr_64:
	mov	0x38, %r14
	.word 0xfef38e80  ! 1493: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb89c4000  ! 1496: XORcc_R	xorcc 	%r17, %r0, %r28
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_65:
	mov	0x4, %r14
	.word 0xf0f384a0  ! 1501: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 12)
	.word 0xf68ce0b4  ! 1506: LDUBA_I	lduba	[%r19, + 0x00b4] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_121:
	setx	0x29002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d206d  ! 1511: LDX_I	ldx	[%r20 + 0x006d], %r26
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_122:
	setx	0x280213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 10)
	.word 0xf0554000  ! 1516: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xf0d4c020  ! 1519: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
	.word 0xf2152188  ! 1523: LDUH_I	lduh	[%r20 + 0x0188], %r25
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc054000  ! 1532: LDUW_R	lduw	[%r21 + %r0], %r30
cpu_intr_2_123:
	setx	0x2b002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_66:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 1545: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe5ce1df  ! 1547: LDX_I	ldx	[%r19 + 0x01df], %r31
	.word 0xb9353001  ! 1548: SRLX_I	srlx	%r20, 0x0001, %r28
T2_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 1551: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfecc4020  ! 1552: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_124:
	setx	0x2a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4600a  ! 1555: LDSWA_I	ldswa	[%r17, + 0x000a] %asi, %r26
cpu_intr_2_125:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe158000  ! 1559: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf6954020  ! 1560: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_68:
	mov	0xa, %r14
	.word 0xfaf38400  ! 1561: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_126:
	setx	0x280037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735d000  ! 1565: SRLX_R	srlx	%r23, %r0, %r27
cpu_intr_2_127:
	setx	0x2a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa84a02a  ! 1575: LDUWA_I	lduwa	[%r18, + 0x002a] %asi, %r29
cpu_intr_2_128:
	setx	0x2a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x280014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_74:
	mov	0xe, %r14
	.word 0xf0db8e80  ! 1583: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_69:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 1584: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb495a06a  ! 1585: ORcc_I	orcc 	%r22, 0x006a, %r26
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d88  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_130:
	setx	0x28011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_70:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 1597: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc85a0ab  ! 1599: LDUWA_I	lduwa	[%r22, + 0x00ab] %asi, %r30
T2_asi_reg_rd_75:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 1600: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6d50020  ! 1602: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 28)
	.word 0xf05d213f  ! 1611: LDX_I	ldx	[%r20 + 0x013f], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 31)
	.word 0xb0ad0000  ! 1620: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xf8c40020  ! 1622: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_71:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 1623: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfadd614f  ! 1626: LDXA_I	ldxa	[%r21, + 0x014f] %asi, %r29
	.word 0xf64d0000  ! 1630: LDSB_R	ldsb	[%r20 + %r0], %r27
T2_asi_reg_wr_72:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 1632: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_131:
	setx	0x280100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc140000  ! 1638: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf60d4000  ! 1643: LDUB_R	ldub	[%r21 + %r0], %r27
T2_asi_reg_wr_73:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1645: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_74:
	mov	0x10, %r14
	.word 0xfef384a0  ! 1648: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8c54020  ! 1651: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
cpu_intr_2_132:
	setx	0x2a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_76:
	mov	0x26, %r14
	.word 0xfadb8400  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_75:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 1660: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0cc000  ! 1663: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xba142054  ! 1665: OR_I	or 	%r16, 0x0054, %r29
	.word 0xbab50000  ! 1666: SUBCcc_R	orncc 	%r20, %r0, %r29
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc4d604b  ! 1671: LDSB_I	ldsb	[%r21 + 0x004b], %r30
cpu_intr_2_133:
	setx	0x280121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294a035  ! 1673: LDUHA_I	lduha	[%r18, + 0x0035] %asi, %r25
	.word 0xf6850020  ! 1674: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
	.word 0xb6348000  ! 1675: ORN_R	orn 	%r18, %r0, %r27
	.word 0xf4d460be  ! 1676: LDSHA_I	ldsha	[%r17, + 0x00be] %asi, %r26
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2854020  ! 1679: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfe0ce0ac  ! 1680: LDUB_I	ldub	[%r19 + 0x00ac], %r31
	.word 0xbb2c7001  ! 1681: SLLX_I	sllx	%r17, 0x0001, %r29
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_134:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_135:
	setx	0x290310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_136:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0dc21c8  ! 1694: LDXA_I	ldxa	[%r16, + 0x01c8] %asi, %r24
	.word 0xbd355000  ! 1696: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xfa5c4000  ! 1698: LDX_R	ldx	[%r17 + %r0], %r29
T2_asi_reg_rd_78:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 1700: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_79:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 1701: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_137:
	setx	0x280324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0144000  ! 1708: OR_R	or 	%r17, %r0, %r24
	.word 0xf295a14d  ! 1709: LDUHA_I	lduha	[%r22, + 0x014d] %asi, %r25
	.word 0xb4ad0000  ! 1710: ANDNcc_R	andncc 	%r20, %r0, %r26
T2_asi_reg_rd_80:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 1712: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_138:
	setx	0x2a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_81:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_139:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_76:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 1719: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf8440000  ! 1721: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xbf643801  ! 1722: MOVcc_I	<illegal instruction>
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb535a001  ! 1724: SRL_I	srl 	%r22, 0x0001, %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_140:
	setx	0x29021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 32)
	.word 0xf4c4e05d  ! 1739: LDSWA_I	ldswa	[%r19, + 0x005d] %asi, %r26
	.word 0xf2d52072  ! 1742: LDSHA_I	ldsha	[%r20, + 0x0072] %asi, %r25
T2_asi_reg_rd_82:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 1743: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf2cd8020  ! 1745: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
T2_asi_reg_wr_77:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 1746: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 6)
	.word 0xf45c8000  ! 1749: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xbc14c000  ! 1750: OR_R	or 	%r19, %r0, %r30
cpu_intr_2_141:
	setx	0x290207, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_83:
	mov	0x0, %r14
	.word 0xfedb8400  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4cda046  ! 1755: LDSBA_I	ldsba	[%r22, + 0x0046] %asi, %r26
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_84:
	mov	0x16, %r14
	.word 0xf8db8e60  ! 1758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 13)
	.word 0xbca4e099  ! 1761: SUBcc_I	subcc 	%r19, 0x0099, %r30
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8dd20ff  ! 1766: LDXA_I	ldxa	[%r20, + 0x00ff] %asi, %r28
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_85:
	mov	0x14, %r14
	.word 0xfcdb8e80  ! 1770: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa14e002  ! 1774: LDUH_I	lduh	[%r19 + 0x0002], %r29
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_86:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1781: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_87:
	mov	0x15, %r14
	.word 0xfedb8400  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_88:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa4c218f  ! 1786: LDSB_I	ldsb	[%r16 + 0x018f], %r29
	.word 0xb28560dd  ! 1787: ADDcc_I	addcc 	%r21, 0x00dd, %r25
	.word 0xfa8d8020  ! 1788: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
cpu_intr_2_142:
	setx	0x2b0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 1790: LDSB_R	ldsb	[%r18 + %r0], %r29
T2_asi_reg_wr_78:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 1791: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfa95a1a5  ! 1792: LDUHA_I	lduha	[%r22, + 0x01a5] %asi, %r29
	.word 0xfa5ca0a6  ! 1793: LDX_I	ldx	[%r18 + 0x00a6], %r29
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b48  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b48, %hpstate
	.word 0xf8d46005  ! 1799: LDSHA_I	ldsha	[%r17, + 0x0005] %asi, %r28
	.word 0xfc0c61fd  ! 1800: LDUB_I	ldub	[%r17 + 0x01fd], %r30
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe558000  ! 1802: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xb9641800  ! 1803: MOVcc_R	<illegal instruction>
	.word 0xfa0d2117  ! 1804: LDUB_I	ldub	[%r20 + 0x0117], %r29
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8cc4020  ! 1809: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	.word 0xf6852126  ! 1810: LDUWA_I	lduwa	[%r20, + 0x0126] %asi, %r27
cpu_intr_2_143:
	setx	0x2d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_79:
	mov	0x33, %r14
	.word 0xf8f389e0  ! 1814: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8d50020  ! 1815: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r28
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, a)
	.word 0xf8858020  ! 1817: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xb004c000  ! 1819: ADD_R	add 	%r19, %r0, %r24
T2_asi_reg_wr_80:
	mov	0xe, %r14
	.word 0xf0f38e60  ! 1824: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf89561a3  ! 1825: LDUHA_I	lduha	[%r21, + 0x01a3] %asi, %r28
	.word 0xf2448000  ! 1826: LDSW_R	ldsw	[%r18 + %r0], %r25
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 16)
	.word 0xf684e06e  ! 1830: LDUWA_I	lduwa	[%r19, + 0x006e] %asi, %r27
	.word 0xfec44020  ! 1831: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_90:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf48d2070  ! 1836: LDUBA_I	lduba	[%r20, + 0x0070] %asi, %r26
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_144:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52dc000  ! 1841: SLL_R	sll 	%r23, %r0, %r26
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_145:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95e1ca  ! 1845: LDUHA_I	lduha	[%r23, + 0x01ca] %asi, %r30
	.word 0xf6958020  ! 1850: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_81:
	mov	0x2c, %r14
	.word 0xf6f38e60  ! 1851: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
	.word 0xfa45e0a9  ! 1856: LDSW_I	ldsw	[%r23 + 0x00a9], %r29
	.word 0xbeb50000  ! 1857: ORNcc_R	orncc 	%r20, %r0, %r31
cpu_intr_2_146:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_147:
	setx	0x2c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_91:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0dda010  ! 1863: LDXA_I	ldxa	[%r22, + 0x0010] %asi, %r24
	.word 0xf4452021  ! 1864: LDSW_I	ldsw	[%r20 + 0x0021], %r26
T2_asi_reg_wr_82:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 1865: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1866: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_92:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 1869: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_93:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_148:
	setx	0x2f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4140000  ! 1880: LDUH_R	lduh	[%r16 + %r0], %r26
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 28)
	.word 0xb2c58000  ! 1883: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xfacdc020  ! 1884: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_84:
	mov	0xa, %r14
	.word 0xfcf389e0  ! 1885: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_150:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c21de  ! 1889: LDUBA_I	lduba	[%r16, + 0x01de] %asi, %r30
cpu_intr_2_151:
	setx	0x2e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0140000  ! 1892: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf2850020  ! 1894: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	.word 0xfa044000  ! 1895: LDUW_R	lduw	[%r17 + %r0], %r29
T2_asi_reg_wr_85:
	mov	0x6, %r14
	.word 0xfef389e0  ! 1896: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_86:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 1898: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0440000  ! 1901: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xfed52178  ! 1902: LDSHA_I	ldsha	[%r20, + 0x0178] %asi, %r31
	.word 0xfac42082  ! 1903: LDSWA_I	ldswa	[%r16, + 0x0082] %asi, %r29
	.word 0xb93c7001  ! 1904: SRAX_I	srax	%r17, 0x0001, %r28
cpu_intr_2_152:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_153:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_94:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf444e0ad  ! 1910: LDSW_I	ldsw	[%r19 + 0x00ad], %r26
cpu_intr_2_154:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dde08e  ! 1913: LDXA_I	ldxa	[%r23, + 0x008e] %asi, %r27
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_95:
	mov	0x10, %r14
	.word 0xf4db89e0  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc85210f  ! 1917: LDUWA_I	lduwa	[%r20, + 0x010f] %asi, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 1)
	.word 0xf24ca18a  ! 1926: LDSB_I	ldsb	[%r18 + 0x018a], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_155:
	setx	0x2e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b02  ! 1934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
	.word 0xfa4da157  ! 1935: LDSB_I	ldsb	[%r22 + 0x0157], %r29
T2_asi_reg_wr_87:
	mov	0x7, %r14
	.word 0xf2f38e80  ! 1941: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_96:
	mov	0x27, %r14
	.word 0xfadb8400  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_156:
	setx	0x2f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8850020  ! 1954: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
cpu_intr_2_157:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00ca119  ! 1956: LDUB_I	ldub	[%r18 + 0x0119], %r24
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_158:
	setx	0x2f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 1962: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_97:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 1964: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf8c58020  ! 1966: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
	.word 0xb52d5000  ! 1967: SLLX_R	sllx	%r21, %r0, %r26
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983eca  ! 1970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eca, %hpstate
cpu_intr_2_159:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_160:
	setx	0x2c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_98:
	mov	0x34, %r14
	.word 0xf2db8e80  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf285e186  ! 1978: LDUWA_I	lduwa	[%r23, + 0x0186] %asi, %r25
	.word 0xf0952001  ! 1980: LDUHA_I	lduha	[%r20, + 0x0001] %asi, %r24
	.word 0xf8dc60f8  ! 1982: LDXA_I	ldxa	[%r17, + 0x00f8] %asi, %r28
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e12  ! 1986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
	.word 0xfa544000  ! 1988: LDSH_R	ldsh	[%r17 + %r0], %r29
T2_asi_reg_wr_89:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 1989: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe5de1a2  ! 1990: LDX_I	ldx	[%r23 + 0x01a2], %r31
	.word 0xf8840020  ! 1991: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_90:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 1993: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_161:
	setx	0x2c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d82  ! 1996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 35)
	.word 0xfecd4020  ! 2003: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xb8b48000  ! 2006: ORNcc_R	orncc 	%r18, %r0, %r28
cpu_intr_2_162:
	setx	0x2e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf604c000  ! 2012: LDUW_R	lduw	[%r19 + %r0], %r27
T2_asi_reg_rd_99:
	mov	0x4, %r14
	.word 0xf4db89e0  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfa840020  ! 2018: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cca  ! 2020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	.word 0xf8844020  ! 2021: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xb335b001  ! 2023: SRLX_I	srlx	%r22, 0x0001, %r25
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_91:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2025: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_100:
	mov	0x6, %r14
	.word 0xf2db8e80  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_92:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 2028: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_93:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 2030: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_101:
	mov	0x4, %r14
	.word 0xfedb89e0  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_102:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_94:
	mov	0x17, %r14
	.word 0xfcf38e60  ! 2034: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_103:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf44d4000  ! 2036: LDSB_R	ldsb	[%r21 + %r0], %r26
cpu_intr_2_163:
	setx	0x2d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe046021  ! 2038: LDUW_I	lduw	[%r17 + 0x0021], %r31
	.word 0xfa8c20ca  ! 2040: LDUBA_I	lduba	[%r16, + 0x00ca] %asi, %r29
cpu_intr_2_164:
	setx	0x2e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0de0b7  ! 2045: LDUB_I	ldub	[%r23 + 0x00b7], %r30
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 1e)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b42  ! 2050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b42, %hpstate
T2_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_2_165:
	setx	0x2e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_166:
	setx	0x2c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa844020  ! 2066: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
cpu_intr_2_167:
	setx	0x2d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac42015  ! 2070: LDSWA_I	ldswa	[%r16, + 0x0015] %asi, %r29
cpu_intr_2_168:
	setx	0x2f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_95:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2075: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 32)
	.word 0xb17c8400  ! 2077: MOVR_R	movre	%r18, %r0, %r24
	.word 0xf65d8000  ! 2079: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf08561c2  ! 2081: LDUWA_I	lduwa	[%r21, + 0x01c2] %asi, %r24
	.word 0xf4444000  ! 2082: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xf2442117  ! 2085: LDSW_I	ldsw	[%r16 + 0x0117], %r25
	.word 0x89952102  ! 2086: WRPR_TICK_I	wrpr	%r20, 0x0102, %tick
	ta	T_CHANGE_HPRIV
cpu_intr_2_169:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a5a  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5a, %hpstate
T2_asi_reg_wr_96:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 2095: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfadc60c7  ! 2096: LDXA_I	ldxa	[%r17, + 0x00c7] %asi, %r29
	.word 0xb7351000  ! 2098: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xf0040000  ! 2101: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf2544000  ! 2102: LDSH_R	ldsh	[%r17 + %r0], %r25
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 30)
	.word 0xf05d8000  ! 2106: LDX_R	ldx	[%r22 + %r0], %r24
cpu_intr_2_170:
	setx	0x2e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295e110  ! 2108: LDUHA_I	lduha	[%r23, + 0x0110] %asi, %r25
cpu_intr_2_171:
	setx	0x2e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x2c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_173:
	setx	0x2c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_174:
	setx	0x2e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x2d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982cca  ! 2125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfacc8020  ! 2127: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	.word 0xf6850020  ! 2128: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
	.word 0xbb352001  ! 2129: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xb6a421db  ! 2131: SUBcc_I	subcc 	%r16, 0x01db, %r27
T2_asi_reg_wr_97:
	mov	0x2a, %r14
	.word 0xf4f38e60  ! 2133: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa8c6053  ! 2138: LDUBA_I	lduba	[%r17, + 0x0053] %asi, %r29
	.word 0xfedde0f2  ! 2139: LDXA_I	ldxa	[%r23, + 0x00f2] %asi, %r31
cpu_intr_2_176:
	setx	0x2e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa544000  ! 2144: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfc5c6022  ! 2145: LDX_I	ldx	[%r17 + 0x0022], %r30
T2_asi_reg_wr_98:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2147: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb69d4000  ! 2149: XORcc_R	xorcc 	%r21, %r0, %r27
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_177:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_106:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_178:
	setx	0x2e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_179:
	setx	0x2f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d4e000  ! 2162: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r24
	.word 0xb0ac21f8  ! 2166: ANDNcc_I	andncc 	%r16, 0x01f8, %r24
	.word 0xbcb46176  ! 2168: ORNcc_I	orncc 	%r17, 0x0176, %r30
	ta	T_CHANGE_TO_TL1
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a9a  ! 2170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9a, %hpstate
	.word 0xf65cc000  ! 2171: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf8958020  ! 2172: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_107:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_108:
	mov	0x15, %r14
	.word 0xf2db8400  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfc958020  ! 2176: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xf40c4000  ! 2178: LDUB_R	ldub	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfccc8020  ! 2182: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xfa440000  ! 2183: LDSW_R	ldsw	[%r16 + %r0], %r29
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 28)
	.word 0xf0850020  ! 2186: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
cpu_intr_2_180:
	setx	0x2c000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba348000  ! 2192: ORN_R	orn 	%r18, %r0, %r29
	.word 0xf80dc000  ! 2193: LDUB_R	ldub	[%r23 + %r0], %r28
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 22)
	.word 0xf6d461d7  ! 2196: LDSHA_I	ldsha	[%r17, + 0x01d7] %asi, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4844020  ! 2200: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
cpu_intr_2_181:
	setx	0x2e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb615e11b  ! 2202: OR_I	or 	%r23, 0x011b, %r27
cpu_intr_2_182:
	setx	0x2f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5611c  ! 2205: LDSHA_I	ldsha	[%r21, + 0x011c] %asi, %r25
	.word 0xfa8c4020  ! 2207: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
	.word 0xf24d20ee  ! 2210: LDSB_I	ldsb	[%r20 + 0x00ee], %r25
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 25)
	.word 0xfcd40020  ! 2216: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
	.word 0xf2950020  ! 2218: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 2219: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbb7c8400  ! 2223: MOVR_R	movre	%r18, %r0, %r29
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 34)
	.word 0xf48521f8  ! 2227: LDUWA_I	lduwa	[%r20, + 0x01f8] %asi, %r26
T2_asi_reg_wr_100:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 2229: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_183:
	setx	0x2f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_101:
	mov	0x1c, %r14
	.word 0xf4f38e60  ! 2237: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_102:
	mov	0x1d, %r14
	.word 0xfef384a0  ! 2238: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb950c000  ! 2241: RDPR_TT	<illegal instruction>
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 15)
	.word 0xfac44020  ! 2244: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982eca  ! 2246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
T2_asi_reg_rd_109:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb83460f9  ! 2252: ORN_I	orn 	%r17, 0x00f9, %r28
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 34)
	.word 0xf205c000  ! 2255: LDUW_R	lduw	[%r23 + %r0], %r25
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 2260: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8146059  ! 2263: LDUH_I	lduh	[%r17 + 0x0059], %r28
	.word 0xf8dce059  ! 2267: LDXA_I	ldxa	[%r19, + 0x0059] %asi, %r28
	.word 0xbc0d20df  ! 2270: AND_I	and 	%r20, 0x00df, %r30
	.word 0xf054c000  ! 2271: LDSH_R	ldsh	[%r19 + %r0], %r24
cpu_intr_2_184:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_185:
	setx	0x31013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_186:
	setx	0x310125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03d61a6  ! 2278: XNOR_I	xnor 	%r21, 0x01a6, %r24
cpu_intr_2_187:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_104:
	mov	0xb, %r14
	.word 0xfef38e40  ! 2283: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0440000  ! 2284: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xbebd4000  ! 2285: XNORcc_R	xnorcc 	%r21, %r0, %r31
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_105:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 2288: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, c)
	.word 0xb13dc000  ! 2293: SRA_R	sra 	%r23, %r0, %r24
T2_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf08d0020  ! 2295: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xfc45c000  ! 2297: LDSW_R	ldsw	[%r23 + %r0], %r30
T2_asi_reg_rd_111:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_188:
	setx	0x330008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_112:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfad52118  ! 2306: LDSHA_I	ldsha	[%r20, + 0x0118] %asi, %r29
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_113:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_189:
	setx	0x310320, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e18  ! 2321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e18, %hpstate
cpu_intr_2_190:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dce02f  ! 2324: LDXA_I	ldxa	[%r19, + 0x002f] %asi, %r25
	.word 0xfe954020  ! 2326: LDUHA_R	lduha	[%r21, %r0] 0x01, %r31
	.word 0xfe8d4020  ! 2328: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_106:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 2333: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbeb48000  ! 2334: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xf484c020  ! 2335: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
T2_asi_reg_rd_114:
	mov	0x24, %r14
	.word 0xfedb84a0  ! 2337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf85d8000  ! 2343: LDX_R	ldx	[%r22 + %r0], %r28
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_115:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 2347: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_191:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_116:
	mov	0x9, %r14
	.word 0xfadb8e60  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0dce0d2  ! 2356: LDXA_I	ldxa	[%r19, + 0x00d2] %asi, %r24
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1a)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fd0  ! 2361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_192:
	setx	0x33033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_107:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 2367: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba04e08a  ! 2370: ADD_I	add 	%r19, 0x008a, %r29
	.word 0xf85ce0c2  ! 2371: LDX_I	ldx	[%r19 + 0x00c2], %r28
	.word 0xf4040000  ! 2373: LDUW_R	lduw	[%r16 + %r0], %r26
T2_asi_reg_wr_108:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 2376: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_117:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 2379: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf04d616a  ! 2381: LDSB_I	ldsb	[%r21 + 0x016a], %r24
cpu_intr_2_193:
	setx	0x320330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_194:
	setx	0x31010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5c020  ! 2387: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
cpu_intr_2_195:
	setx	0x320003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946012  ! 2394: WRPR_TNPC_I	wrpr	%r17, 0x0012, %tnpc
	.word 0xf0958020  ! 2400: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
cpu_intr_2_196:
	setx	0x330120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5e177  ! 2404: LDSWA_I	ldswa	[%r23, + 0x0177] %asi, %r31
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_109:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 2406: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf8cc8020  ! 2408: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_118:
	mov	0x31, %r14
	.word 0xfadb89e0  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 8)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cc8  ! 2419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc8, %hpstate
cpu_intr_2_197:
	setx	0x33003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 2421: LDSB_R	ldsb	[%r21 + %r0], %r24
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_198:
	setx	0x330121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644c000  ! 2428: LDSW_R	ldsw	[%r19 + %r0], %r27
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 38)
	.word 0xfac5e0f8  ! 2434: LDSWA_I	ldswa	[%r23, + 0x00f8] %asi, %r29
	.word 0xf21560ed  ! 2436: LDUH_I	lduh	[%r21 + 0x00ed], %r25
	.word 0xf4d420ee  ! 2437: LDSHA_I	ldsha	[%r16, + 0x00ee] %asi, %r26
	.word 0xfc4521a7  ! 2439: LDSW_I	ldsw	[%r20 + 0x01a7], %r30
	.word 0xfcc5c020  ! 2440: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_199:
	setx	0x30002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88cc020  ! 2454: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
cpu_intr_2_200:
	setx	0x310112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c209f  ! 2459: AND_I	and 	%r16, 0x009f, %r24
	.word 0xf805a015  ! 2460: LDUW_I	lduw	[%r22 + 0x0015], %r28
T2_asi_reg_rd_119:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2468: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_201:
	setx	0x310010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_120:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_202:
	setx	0x300315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_110:
	mov	0x8, %r14
	.word 0xf2f384a0  ! 2473: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf04c615d  ! 2474: LDSB_I	ldsb	[%r17 + 0x015d], %r24
T2_asi_reg_wr_111:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 2475: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_203:
	setx	0x30000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055e1ee  ! 2479: LDSH_I	ldsh	[%r23 + 0x01ee], %r24
	.word 0xb9508000  ! 2483: RDPR_TSTATE	<illegal instruction>
	.word 0xf6950020  ! 2484: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_121:
	mov	0x24, %r14
	.word 0xf6db8e60  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198395a  ! 2488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195a, %hpstate
T2_asi_reg_wr_112:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 2489: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbe1c4000  ! 2490: XOR_R	xor 	%r17, %r0, %r31
	.word 0xf6c4e0bb  ! 2491: LDSWA_I	ldswa	[%r19, + 0x00bb] %asi, %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 14)
	.word 0xb1342001  ! 2496: SRL_I	srl 	%r16, 0x0001, %r24
T2_asi_reg_wr_113:
	mov	0xc, %r14
	.word 0xfaf38400  ! 2497: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfa45614e  ! 2498: LDSW_I	ldsw	[%r21 + 0x014e], %r29
T2_asi_reg_wr_114:
	mov	0x13, %r14
	.word 0xf4f38400  ! 2499: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_115:
	mov	0x22, %r14
	.word 0xf8f389e0  ! 2500: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, a)
	.word 0xf04561e2  ! 2502: LDSW_I	ldsw	[%r21 + 0x01e2], %r24
	.word 0xfecd4020  ! 2503: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_116:
	mov	0x2c, %r14
	.word 0xf4f384a0  ! 2504: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc440000  ! 2506: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xfc4d0000  ! 2507: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xb4c420e8  ! 2513: ADDCcc_I	addccc 	%r16, 0x00e8, %r26
T2_asi_reg_wr_117:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 2517: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, d)
	.word 0xf68de16d  ! 2520: LDUBA_I	lduba	[%r23, + 0x016d] %asi, %r27
cpu_intr_2_204:
	setx	0x300221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_205:
	setx	0x300111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf68d0020  ! 2539: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_206:
	setx	0x33002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_118:
	mov	0x2a, %r14
	.word 0xfcf38e60  ! 2547: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf24c4000  ! 2548: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xba3da1b5  ! 2549: XNOR_I	xnor 	%r22, 0x01b5, %r29
	.word 0xf25d8000  ! 2550: LDX_R	ldx	[%r22 + %r0], %r25
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc0da1b1  ! 2555: LDUB_I	ldub	[%r22 + 0x01b1], %r30
cpu_intr_2_207:
	setx	0x320335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 30)
	.word 0xbc954000  ! 2559: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xfa15c000  ! 2561: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfe9460f8  ! 2566: LDUHA_I	lduha	[%r17, + 0x00f8] %asi, %r31
	.word 0xf6c4e158  ! 2570: LDSWA_I	ldswa	[%r19, + 0x0158] %asi, %r27
	.word 0xb8b54000  ! 2572: ORNcc_R	orncc 	%r21, %r0, %r28
T2_asi_reg_wr_119:
	mov	0x24, %r14
	.word 0xf6f38e60  ! 2573: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_122:
	mov	0x5, %r14
	.word 0xf8db8400  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb97c8400  ! 2580: MOVR_R	movre	%r18, %r0, %r28
	.word 0xf654e1ff  ! 2581: LDSH_I	ldsh	[%r19 + 0x01ff], %r27
	.word 0xfc4cc000  ! 2583: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xf25521cd  ! 2584: LDSH_I	ldsh	[%r20 + 0x01cd], %r25
	.word 0xfa8c8020  ! 2585: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_123:
	mov	0x19, %r14
	.word 0xf0db8e80  ! 2587: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 30)
	.word 0xf684a0db  ! 2594: LDUWA_I	lduwa	[%r18, + 0x00db] %asi, %r27
cpu_intr_2_208:
	setx	0x310302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x11, %r14
	.word 0xf0f38400  ! 2599: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_124:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_209:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254203c  ! 2605: LDSH_I	ldsh	[%r16 + 0x003c], %r25
cpu_intr_2_210:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_211:
	setx	0x310220, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982fd0  ! 2611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xfc5de16e  ! 2616: LDX_I	ldx	[%r23 + 0x016e], %r30
cpu_intr_2_212:
	setx	0x31023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84a1b8  ! 2621: LDUWA_I	lduwa	[%r18, + 0x01b8] %asi, %r30
T2_asi_reg_wr_121:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2626: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_125:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2627: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4154000  ! 2630: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xba946005  ! 2632: ORcc_I	orcc 	%r17, 0x0005, %r29
T2_asi_reg_wr_122:
	mov	0x1e, %r14
	.word 0xf8f38e60  ! 2633: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_213:
	setx	0x31010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0450000  ! 2638: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf24ce1f0  ! 2639: LDSB_I	ldsb	[%r19 + 0x01f0], %r25
cpu_intr_2_214:
	setx	0x33012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_123:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 2641: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_126:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 2643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_124:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 2646: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfacc0020  ! 2647: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
cpu_intr_2_215:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc4020  ! 2654: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 2656: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc1421a2  ! 2657: LDUH_I	lduh	[%r16 + 0x01a2], %r30
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 0)
	.word 0xf295202a  ! 2665: LDUHA_I	lduha	[%r20, + 0x002a] %asi, %r25
T2_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 2670: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cc8  ! 2671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
cpu_intr_2_216:
	setx	0x320101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf65c0000  ! 2680: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xfc944020  ! 2681: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_128:
	mov	0x26, %r14
	.word 0xfedb8400  ! 2682: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_217:
	setx	0x300337, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 2684: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb33d8000  ! 2687: SRA_R	sra 	%r22, %r0, %r25
cpu_intr_2_218:
	setx	0x33033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc056071  ! 2690: LDUW_I	lduw	[%r21 + 0x0071], %r30
T2_asi_reg_wr_126:
	mov	0x19, %r14
	.word 0xf0f38e60  ! 2691: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf6048000  ! 2697: LDUW_R	lduw	[%r18 + %r0], %r27
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 35)
	.word 0xfc940020  ! 2699: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xf2dc2149  ! 2702: LDXA_I	ldxa	[%r16, + 0x0149] %asi, %r25
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_219:
	setx	0x310222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc2011  ! 2710: LDXA_I	ldxa	[%r16, + 0x0011] %asi, %r25
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_130:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb32ca001  ! 2717: SLL_I	sll 	%r18, 0x0001, %r25
T2_asi_reg_wr_127:
	mov	0xc, %r14
	.word 0xfef384a0  ! 2718: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_131:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf40d21ad  ! 2723: LDUB_I	ldub	[%r20 + 0x01ad], %r26
	.word 0xf4cca0c4  ! 2724: LDSBA_I	ldsba	[%r18, + 0x00c4] %asi, %r26
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0844020  ! 2726: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
T2_asi_reg_wr_128:
	mov	0x1e, %r14
	.word 0xf0f384a0  ! 2729: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_220:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35c000  ! 2736: SUBC_R	orn 	%r23, %r0, %r31
cpu_intr_2_221:
	setx	0x37020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d00  ! 2738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
	.word 0xfc1520d8  ! 2741: LDUH_I	lduh	[%r20 + 0x00d8], %r30
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_222:
	setx	0x340038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_129:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2745: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4d44020  ! 2746: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c58  ! 2748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c58, %hpstate
T2_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 2750: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfac4205c  ! 2751: LDSWA_I	ldswa	[%r16, + 0x005c] %asi, %r29
T2_asi_reg_rd_132:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 2752: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_223:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa054000  ! 2754: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_rd_133:
	mov	0x7, %r14
	.word 0xf2db8e80  ! 2757: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbb2cf001  ! 2759: SLLX_I	sllx	%r19, 0x0001, %r29
	.word 0xb92c3001  ! 2760: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xf8944020  ! 2762: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xf00c0000  ! 2763: LDUB_R	ldub	[%r16 + %r0], %r24
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_131:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2765: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfe854020  ! 2766: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_132:
	mov	0x16, %r14
	.word 0xfaf38400  ! 2767: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbc34214c  ! 2770: SUBC_I	orn 	%r16, 0x014c, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf685c020  ! 2777: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf64ca176  ! 2783: LDSB_I	ldsb	[%r18 + 0x0176], %r27
	.word 0xfa15c000  ! 2785: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfa4d0000  ! 2786: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf2c4e13b  ! 2795: LDSWA_I	ldswa	[%r19, + 0x013b] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_133:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2799: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_134:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 2800: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_134:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfec58020  ! 2805: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_135:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbca5c000  ! 2808: SUBcc_R	subcc 	%r23, %r0, %r30
T2_asi_reg_wr_135:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2809: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc85c020  ! 2810: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
cpu_intr_2_224:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x37030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe54c000  ! 2817: LDSH_R	ldsh	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xb29d0000  ! 2825: XORcc_R	xorcc 	%r20, %r0, %r25
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfec54020  ! 2828: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
cpu_intr_2_226:
	setx	0x350233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dc20c7  ! 2838: LDXA_I	ldxa	[%r16, + 0x00c7] %asi, %r28
cpu_intr_2_227:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_228:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 9)
	.word 0xf0548000  ! 2847: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb57d0400  ! 2848: MOVR_R	movre	%r20, %r0, %r26
T2_asi_reg_rd_136:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 2849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc04e094  ! 2850: LDUW_I	lduw	[%r19 + 0x0094], %r30
	.word 0xb57d2401  ! 2851: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xfa050000  ! 2852: LDUW_R	lduw	[%r20 + %r0], %r29
T2_asi_reg_rd_137:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 2853: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_138:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 2854: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_229:
	setx	0x36033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_230:
	setx	0x350021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5de166  ! 2868: LDX_I	ldx	[%r23 + 0x0166], %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_231:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4c020  ! 2871: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
cpu_intr_2_232:
	setx	0x360035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed52173  ! 2874: LDSHA_I	ldsha	[%r20, + 0x0173] %asi, %r31
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa5cc000  ! 2877: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf60dc000  ! 2879: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xfccd8020  ! 2880: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
cpu_intr_2_233:
	setx	0x360105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34c000  ! 2882: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xfadd6058  ! 2886: LDXA_I	ldxa	[%r21, + 0x0058] %asi, %r29
cpu_intr_2_234:
	setx	0x340124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_235:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_236:
	setx	0x370315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8950020  ! 2896: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	.word 0xfa4dc000  ! 2903: LDSB_R	ldsb	[%r23 + %r0], %r29
T2_asi_reg_wr_136:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 2904: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2d42193  ! 2906: LDSHA_I	ldsha	[%r16, + 0x0193] %asi, %r25
	.word 0xb2842018  ! 2909: ADDcc_I	addcc 	%r16, 0x0018, %r25
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 34)
	.word 0xf84cc000  ! 2911: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf60d4000  ! 2913: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xbc8c0000  ! 2914: ANDcc_R	andcc 	%r16, %r0, %r30
T2_asi_reg_rd_139:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_237:
	setx	0x36020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x360136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4a197  ! 2919: LDSHA_I	ldsha	[%r18, + 0x0197] %asi, %r28
cpu_intr_2_239:
	setx	0x360004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 2930: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xfe5c8000  ! 2931: LDX_R	ldx	[%r18 + %r0], %r31
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 2933: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_241:
	setx	0x340030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_242:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0844020  ! 2940: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ed2  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	.word 0xf40560fd  ! 2949: LDUW_I	lduw	[%r21 + 0x00fd], %r26
	.word 0xf4158000  ! 2954: LDUH_R	lduh	[%r22 + %r0], %r26
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_243:
	setx	0x37012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_138:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 2962: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf84da043  ! 2964: LDSB_I	ldsb	[%r22 + 0x0043], %r28
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 34)
	.word 0xf455c000  ! 2968: LDSH_R	ldsh	[%r23 + %r0], %r26
cpu_intr_2_244:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe542000  ! 2971: LDSH_I	ldsh	[%r16 + 0x0000], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2c50020  ! 2976: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
T2_asi_reg_rd_140:
	mov	0xa, %r14
	.word 0xfedb84a0  ! 2977: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_245:
	setx	0x350101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4a188  ! 2979: LDSWA_I	ldswa	[%r18, + 0x0188] %asi, %r24
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f02  ! 2980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
	.word 0xfe0c2029  ! 2981: LDUB_I	ldub	[%r16 + 0x0029], %r31
T2_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 2982: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf255a0be  ! 2983: LDSH_I	ldsh	[%r22 + 0x00be], %r25
	.word 0xfccc8020  ! 2985: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
T2_asi_reg_rd_141:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe054000  ! 2988: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xbb3d7001  ! 2992: SRAX_I	srax	%r21, 0x0001, %r29
	.word 0xf00520d3  ! 2994: LDUW_I	lduw	[%r20 + 0x00d3], %r24
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_246:
	setx	0x36033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 37)
	.word 0xf204213e  ! 3001: LDUW_I	lduw	[%r16 + 0x013e], %r25
	.word 0xb52ce001  ! 3002: SLL_I	sll 	%r19, 0x0001, %r26
T2_asi_reg_rd_142:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 3006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7353001  ! 3007: SRLX_I	srlx	%r20, 0x0001, %r27
T2_asi_reg_rd_143:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 3008: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfed5c020  ! 3009: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
cpu_intr_2_247:
	setx	0x34013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8848020  ! 3012: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	.word 0xf48ca194  ! 3013: LDUBA_I	lduba	[%r18, + 0x0194] %asi, %r26
T2_asi_reg_rd_144:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0x8994e048  ! 3017: WRPR_TICK_I	wrpr	%r19, 0x0048, %tick
	.word 0xfa8d21dd  ! 3019: LDUBA_I	lduba	[%r20, + 0x01dd] %asi, %r29
	.word 0xbf643801  ! 3020: MOVcc_I	<illegal instruction>
	.word 0xf00ce093  ! 3025: LDUB_I	ldub	[%r19 + 0x0093], %r24
	.word 0xf44c8000  ! 3026: LDSB_R	ldsb	[%r18 + %r0], %r26
cpu_intr_2_248:
	setx	0x340129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c8000  ! 3028: LDX_R	ldx	[%r18 + %r0], %r27
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_249:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_140:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 3034: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb41d0000  ! 3035: XOR_R	xor 	%r20, %r0, %r26
	.word 0xf68561af  ! 3039: LDUWA_I	lduwa	[%r21, + 0x01af] %asi, %r27
cpu_intr_2_250:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0044000  ! 3041: LDUW_R	lduw	[%r17 + %r0], %r24
T2_asi_reg_wr_141:
	mov	0x2, %r14
	.word 0xf6f38e60  ! 3042: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_251:
	setx	0x37033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295a00e  ! 3044: LDUHA_I	lduha	[%r22, + 0x000e] %asi, %r25
	.word 0xf2d44020  ! 3049: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_142:
	mov	0x2, %r14
	.word 0xfef38e60  ! 3057: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_143:
	mov	0x1a, %r14
	.word 0xf8f38e80  ! 3063: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_252:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa950020  ! 3068: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
cpu_intr_2_253:
	setx	0x37013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_254:
	setx	0x340135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf8c5a18c  ! 3076: LDSWA_I	ldswa	[%r22, + 0x018c] %asi, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf48ce159  ! 3081: LDUBA_I	lduba	[%r19, + 0x0159] %asi, %r26
	.word 0x8195a05d  ! 3082: WRPR_TPC_I	wrpr	%r22, 0x005d, %tpc
	.word 0xf455e1c8  ! 3084: LDSH_I	ldsh	[%r23 + 0x01c8], %r26
	.word 0xf4140000  ! 3085: LDUH_R	lduh	[%r16 + %r0], %r26
T2_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 3086: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf8cca047  ! 3092: LDSBA_I	ldsba	[%r18, + 0x0047] %asi, %r28
	.word 0xf894a102  ! 3099: LDUHA_I	lduha	[%r18, + 0x0102] %asi, %r28
T2_asi_reg_rd_145:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 3100: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe0d8000  ! 3101: LDUB_R	ldub	[%r22 + %r0], %r31
T2_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_147:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbc2ce111  ! 3106: ANDN_I	andn 	%r19, 0x0111, %r30
T2_asi_reg_wr_145:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3108: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_255:
	setx	0x370018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604e19f  ! 3111: LDUW_I	lduw	[%r19 + 0x019f], %r27
cpu_intr_2_256:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_146:
	mov	0x4, %r14
	.word 0xf6f384a0  ! 3120: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf4c520fa  ! 3121: LDSWA_I	ldswa	[%r20, + 0x00fa] %asi, %r26
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983980  ! 3122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1980, %hpstate
	.word 0xfe5ca1ed  ! 3128: LDX_I	ldx	[%r18 + 0x01ed], %r31
	.word 0xf0d4e16b  ! 3129: LDSHA_I	ldsha	[%r19, + 0x016b] %asi, %r24
	.word 0xb28c4000  ! 3132: ANDcc_R	andcc 	%r17, %r0, %r25
cpu_intr_2_257:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 3135: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf094e106  ! 3136: LDUHA_I	lduha	[%r19, + 0x0106] %asi, %r24
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb00dc000  ! 3138: AND_R	and 	%r23, %r0, %r24
cpu_intr_2_258:
	setx	0x350308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe450000  ! 3147: LDSW_R	ldsw	[%r20 + %r0], %r31
T2_asi_reg_rd_148:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_148:
	mov	0x33, %r14
	.word 0xfef38e40  ! 3153: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_149:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 3158: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3159: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb93c1000  ! 3160: SRAX_R	srax	%r16, %r0, %r28
cpu_intr_2_260:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 23)
	.word 0xb82d618c  ! 3167: ANDN_I	andn 	%r21, 0x018c, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbc344000  ! 3172: ORN_R	orn 	%r17, %r0, %r30
cpu_intr_2_261:
	setx	0x20033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0xd, %r14
	.word 0xf4f38400  ! 3175: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfa0d2014  ! 3176: LDUB_I	ldub	[%r20 + 0x0014], %r29
cpu_intr_2_262:
	setx	0x380102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d44020  ! 3178: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa5d8000  ! 3181: LDX_R	ldx	[%r22 + %r0], %r29
cpu_intr_2_263:
	setx	0x39011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_264:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d0000  ! 3187: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xb835c000  ! 3188: SUBC_R	orn 	%r23, %r0, %r28
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 16)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e5a  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
T2_asi_reg_rd_149:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 3193: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe858020  ! 3200: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
cpu_intr_2_265:
	setx	0x380011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_152:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 3205: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_150:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_153:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 3214: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_266:
	setx	0x3a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_154:
	mov	0x21, %r14
	.word 0xf6f38400  ! 3217: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2cd0020  ! 3220: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xf2c521bb  ! 3223: LDSWA_I	ldswa	[%r20, + 0x01bb] %asi, %r25
	.word 0xfa952053  ! 3225: LDUHA_I	lduha	[%r20, + 0x0053] %asi, %r29
	.word 0xbe8d8000  ! 3228: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xbcbc4000  ! 3230: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xb63ce0be  ! 3231: XNOR_I	xnor 	%r19, 0x00be, %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 9)
	.word 0xb9510000  ! 3238: RDPR_TICK	<illegal instruction>
	.word 0xf0dd6089  ! 3243: LDXA_I	ldxa	[%r21, + 0x0089] %asi, %r24
T2_asi_reg_rd_151:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 3245: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf215c000  ! 3246: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf48d0020  ! 3247: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	.word 0xf4c5c020  ! 3248: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_152:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf04dc000  ! 3252: LDSB_R	ldsb	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_153:
	mov	0x0, %r14
	.word 0xf6db89e0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf0cce18d  ! 3264: LDSBA_I	ldsba	[%r19, + 0x018d] %asi, %r24
T2_asi_reg_wr_155:
	mov	0x6, %r14
	.word 0xf4f38e80  ! 3267: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2944020  ! 3272: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
T2_asi_reg_rd_155:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 3273: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_267:
	setx	0x380213, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b98  ! 3276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b98, %hpstate
cpu_intr_2_268:
	setx	0x390107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_269:
	setx	0x3b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4c020  ! 3281: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
	.word 0xfe8461c9  ! 3284: LDUWA_I	lduwa	[%r17, + 0x01c9] %asi, %r31
cpu_intr_2_270:
	setx	0x390032, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_156:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfc14e05b  ! 3291: LDUH_I	lduh	[%r19 + 0x005b], %r30
	.word 0xfe44e148  ! 3294: LDSW_I	ldsw	[%r19 + 0x0148], %r31
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc148000  ! 3296: LDUH_R	lduh	[%r18 + %r0], %r30
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfac44020  ! 3298: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbb7c4400  ! 3301: MOVR_R	movre	%r17, %r0, %r29
cpu_intr_2_271:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 2)
	.word 0xbf7d8400  ! 3304: MOVR_R	movre	%r22, %r0, %r31
	.word 0xba150000  ! 3308: OR_R	or 	%r20, %r0, %r29
	.word 0xfad5e00f  ! 3312: LDSHA_I	ldsha	[%r23, + 0x000f] %asi, %r29
	.word 0xb485214c  ! 3318: ADDcc_I	addcc 	%r20, 0x014c, %r26
	.word 0xfc14c000  ! 3319: LDUH_R	lduh	[%r19 + %r0], %r30
cpu_intr_2_272:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c0000  ! 3326: XNOR_R	xnor 	%r16, %r0, %r26
T2_asi_reg_rd_157:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 3328: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_156:
	mov	0x7, %r14
	.word 0xf2f38e60  ! 3330: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198395a  ! 3331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195a, %hpstate
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_158:
	mov	0x1b, %r14
	.word 0xfadb84a0  ! 3333: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d40020  ! 3336: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_159:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 3346: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_273:
	setx	0x39012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6044000  ! 3349: LDUW_R	lduw	[%r17 + %r0], %r27
cpu_intr_2_274:
	setx	0x3a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x380135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf215c000  ! 3353: LDUH_R	lduh	[%r23 + %r0], %r25
T2_asi_reg_rd_160:
	mov	0x1e, %r14
	.word 0xf4db8400  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_276:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_277:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_161:
	mov	0x2e, %r14
	.word 0xf0db8e80  ! 3366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 1)
	.word 0xb63c8000  ! 3369: XNOR_R	xnor 	%r18, %r0, %r27
cpu_intr_2_278:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x3b0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8460a5  ! 3375: ADDcc_I	addcc 	%r17, 0x00a5, %r30
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3383: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_280:
	setx	0x3a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x38020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 13)
	.word 0xf84d8000  ! 3395: LDSB_R	ldsb	[%r22 + %r0], %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_282:
	setx	0x3a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x18, %r14
	.word 0xf4db84a0  ! 3400: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf05d0000  ! 3401: LDX_R	ldx	[%r20 + %r0], %r24
T2_asi_reg_wr_158:
	mov	0x28, %r14
	.word 0xfef38e40  ! 3402: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_159:
	mov	0xe, %r14
	.word 0xfaf38e80  ! 3404: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_160:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 3408: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0448000  ! 3409: LDSW_R	ldsw	[%r18 + %r0], %r24
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_283:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44cc000  ! 3416: LDSB_R	ldsb	[%r19 + %r0], %r26
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
cpu_intr_2_284:
	setx	0x3b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_285:
	setx	0x380131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe45a1b1  ! 3423: LDSW_I	ldsw	[%r22 + 0x01b1], %r31
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 3429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_286:
	setx	0x380214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 10)
	.word 0xf80dc000  ! 3440: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf4dde11f  ! 3441: LDXA_I	ldxa	[%r23, + 0x011f] %asi, %r26
cpu_intr_2_287:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL0
	.word 0xf8440000  ! 3452: LDSW_R	ldsw	[%r16 + %r0], %r28
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_288:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c8000  ! 3455: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xb4bc2016  ! 3457: XNORcc_I	xnorcc 	%r16, 0x0016, %r26
cpu_intr_2_289:
	setx	0x390131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_290:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_291:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d8000  ! 3465: LDSB_R	ldsb	[%r22 + %r0], %r29
cpu_intr_2_292:
	setx	0x38010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44a10e  ! 3468: LDSW_I	ldsw	[%r18 + 0x010e], %r31
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf2c42011  ! 3471: LDSWA_I	ldswa	[%r16, + 0x0011] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf65d8000  ! 3475: LDX_R	ldx	[%r22 + %r0], %r27
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c5a025  ! 3485: LDSWA_I	ldswa	[%r22, + 0x0025] %asi, %r26
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_161:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 3488: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_293:
	setx	0x380300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad8000  ! 3495: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xfcd5e04a  ! 3498: LDSHA_I	ldsha	[%r23, + 0x004a] %asi, %r30
	.word 0xfad4a186  ! 3499: LDSHA_I	ldsha	[%r18, + 0x0186] %asi, %r29
T2_asi_reg_wr_162:
	mov	0x15, %r14
	.word 0xfef38e60  ! 3505: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_294:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe054000  ! 3508: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xb09ce135  ! 3510: XORcc_I	xorcc 	%r19, 0x0135, %r24
	.word 0xfa0cc000  ! 3511: LDUB_R	ldub	[%r19 + %r0], %r29
cpu_intr_2_295:
	setx	0x3b003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0d0000  ! 3515: AND_R	and 	%r20, %r0, %r31
T2_asi_reg_wr_163:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 3516: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7510000  ! 3517: RDPR_TICK	<illegal instruction>
T2_asi_reg_rd_165:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8c44020  ! 3521: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xfc954020  ! 3522: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
cpu_intr_2_296:
	setx	0x390227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_297:
	setx	0x3a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0x2c, %r14
	.word 0xf4f389e0  ! 3536: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfedc20ef  ! 3537: LDXA_I	ldxa	[%r16, + 0x00ef] %asi, %r31
cpu_intr_2_298:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_165:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 3540: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_166:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 3542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa950020  ! 3544: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_166:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 3545: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb0bd0000  ! 3546: XNORcc_R	xnorcc 	%r20, %r0, %r24
T2_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 3547: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_299:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_167:
	mov	0x2d, %r14
	.word 0xf4f38e60  ! 3549: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_300:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d0020  ! 3553: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
cpu_intr_2_301:
	setx	0x3b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_302:
	setx	0x3a033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_168:
	mov	0x1, %r14
	.word 0xfef38e60  ! 3559: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_303:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dda05c  ! 3566: LDXA_I	ldxa	[%r22, + 0x005c] %asi, %r26
	.word 0xf2d5c020  ! 3568: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_304:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5a05f  ! 3578: LDSWA_I	ldswa	[%r22, + 0x005f] %asi, %r30
T2_asi_reg_wr_169:
	mov	0x4, %r14
	.word 0xf2f38e40  ! 3580: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_170:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 3585: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_305:
	setx	0x390314, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f42  ! 3592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 25)
	.word 0xf20cc000  ! 3594: LDUB_R	ldub	[%r19 + %r0], %r25
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_169:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_306:
	setx	0x3a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_307:
	setx	0x390034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_308:
	setx	0x3b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81420de  ! 3608: LDUH_I	lduh	[%r16 + 0x00de], %r28
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_171:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3612: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0c4e1c7  ! 3613: LDSWA_I	ldswa	[%r19, + 0x01c7] %asi, %r24
	.word 0xf00d8000  ! 3616: LDUB_R	ldub	[%r22 + %r0], %r24
cpu_intr_2_309:
	setx	0x3b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 3620: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0x9195615c  ! 3622: WRPR_PIL_I	wrpr	%r21, 0x015c, %pil
	.word 0xf85d8000  ! 3624: LDX_R	ldx	[%r22 + %r0], %r28
cpu_intr_2_310:
	setx	0x3e0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac4e048  ! 3628: LDSWA_I	ldswa	[%r19, + 0x0048] %asi, %r29
cpu_intr_2_311:
	setx	0x3c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d0000  ! 3633: XNOR_R	xnor 	%r20, %r0, %r26
T2_asi_reg_rd_171:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6dc6057  ! 3638: LDXA_I	ldxa	[%r17, + 0x0057] %asi, %r27
	.word 0xbd2dd000  ! 3640: SLLX_R	sllx	%r23, %r0, %r30
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 16)
	.word 0xf68da08f  ! 3645: LDUBA_I	lduba	[%r22, + 0x008f] %asi, %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 16)
	.word 0xb1643801  ! 3647: MOVcc_I	<illegal instruction>
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 10)
	.word 0xbb34d000  ! 3650: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xf6548000  ! 3652: LDSH_R	ldsh	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_173:
	mov	0x35, %r14
	.word 0xfef384a0  ! 3654: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 37)
	.word 0xb08da0fb  ! 3659: ANDcc_I	andcc 	%r22, 0x00fb, %r24
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 11)
	.word 0xf05ce0f9  ! 3661: LDX_I	ldx	[%r19 + 0x00f9], %r24
	.word 0xb32d8000  ! 3662: SLL_R	sll 	%r22, %r0, %r25
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, a)
	.word 0xf25da156  ! 3665: LDX_I	ldx	[%r22 + 0x0156], %r25
T2_asi_reg_rd_172:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 3666: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf604c000  ! 3669: LDUW_R	lduw	[%r19 + %r0], %r27
cpu_intr_2_312:
	setx	0x3e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d4020  ! 3672: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_313:
	setx	0x3e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c60a8  ! 3677: LDUBA_I	lduba	[%r17, + 0x00a8] %asi, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf8c40020  ! 3679: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
cpu_intr_2_315:
	setx	0x3f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834216c  ! 3684: ORN_I	orn 	%r16, 0x016c, %r28
	.word 0xf2044000  ! 3686: LDUW_R	lduw	[%r17 + %r0], %r25
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 34)
	.word 0xb08da1c3  ! 3689: ANDcc_I	andcc 	%r22, 0x01c3, %r24
	.word 0xb8240000  ! 3690: SUB_R	sub 	%r16, %r0, %r28
T2_asi_reg_rd_173:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 3694: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa844020  ! 3695: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
cpu_intr_2_316:
	setx	0x3f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 19)
	.word 0xf25560ac  ! 3701: LDSH_I	ldsh	[%r21 + 0x00ac], %r25
	.word 0xf88c0020  ! 3702: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
cpu_intr_2_317:
	setx	0x3e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6dc6006  ! 3707: LDXA_I	ldxa	[%r17, + 0x0006] %asi, %r27
cpu_intr_2_318:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_319:
	setx	0x3c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0x2, %r14
	.word 0xf8f38400  ! 3710: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_320:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 3714: LDSB_R	ldsb	[%r16 + %r0], %r29
T2_asi_reg_rd_174:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 22)
	.word 0xf8158000  ! 3718: LDUH_R	lduh	[%r22 + %r0], %r28
T2_asi_reg_rd_175:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 3719: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_175:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 3720: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf4454000  ! 3722: LDSW_R	ldsw	[%r21 + %r0], %r26
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf015a002  ! 3726: LDUH_I	lduh	[%r22 + 0x0002], %r24
cpu_intr_2_321:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc856055  ! 3728: LDUWA_I	lduwa	[%r21, + 0x0055] %asi, %r30
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf65c61cb  ! 3734: LDX_I	ldx	[%r17 + 0x01cb], %r27
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL1
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_176:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_322:
	setx	0x3e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_177:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf2cd8020  ! 3757: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	.word 0xf2dda0e6  ! 3758: LDXA_I	ldxa	[%r22, + 0x00e6] %asi, %r25
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 10)
	.word 0xf64cc000  ! 3764: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfeccc020  ! 3766: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
cpu_intr_2_323:
	setx	0x3d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48da1b3  ! 3770: LDUBA_I	lduba	[%r22, + 0x01b3] %asi, %r26
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 30)
	.word 0xfe4de12f  ! 3773: LDSB_I	ldsb	[%r23 + 0x012f], %r31
cpu_intr_2_324:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_176:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 3776: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_325:
	setx	0x3c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0452094  ! 3778: LDSW_I	ldsw	[%r20 + 0x0094], %r24
	.word 0xf615a129  ! 3780: LDUH_I	lduh	[%r22 + 0x0129], %r27
	.word 0xb97d8400  ! 3782: MOVR_R	movre	%r22, %r0, %r28
	.word 0xfad4c020  ! 3783: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_177:
	mov	0xf, %r14
	.word 0xf6f38e60  ! 3785: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf84d4000  ! 3787: LDSB_R	ldsb	[%r21 + %r0], %r28
cpu_intr_2_326:
	setx	0x3e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cc0  ! 3789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982940  ! 3791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_327:
	setx	0x3c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4207b  ! 3797: LDSWA_I	ldswa	[%r16, + 0x007b] %asi, %r30
cpu_intr_2_328:
	setx	0x3c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_178:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_329:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd8020  ! 3804: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_179:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 3805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_330:
	setx	0x3c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc94a1c6  ! 3815: LDUHA_I	lduha	[%r18, + 0x01c6] %asi, %r30
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f52  ! 3821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f52, %hpstate
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, f)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, b)
	.word 0xf2c48020  ! 3825: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_178:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 3827: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfa450000  ! 3831: LDSW_R	ldsw	[%r20 + %r0], %r29
cpu_intr_2_331:
	setx	0x3f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d614d  ! 3834: LDUB_I	ldub	[%r21 + 0x014d], %r29
	.word 0xfe8d8020  ! 3835: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
	.word 0xb234c000  ! 3839: ORN_R	orn 	%r19, %r0, %r25
	.word 0xf28da096  ! 3842: LDUBA_I	lduba	[%r22, + 0x0096] %asi, %r25
	.word 0xf6d5c020  ! 3845: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xf8cc8020  ! 3847: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
cpu_intr_2_332:
	setx	0x1031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0048000  ! 3849: LDUW_R	lduw	[%r18 + %r0], %r24
T2_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 3854: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_180:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_180:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 3860: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf445c000  ! 3861: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xfa0d607b  ! 3863: LDUB_I	ldub	[%r21 + 0x007b], %r29
T2_asi_reg_rd_181:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf415c000  ! 3867: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfe55e158  ! 3869: LDSH_I	ldsh	[%r23 + 0x0158], %r31
	.word 0xfe4d4000  ! 3871: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf05dc000  ! 3875: LDX_R	ldx	[%r23 + %r0], %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_333:
	setx	0x3d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd50020  ! 3881: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc8ca043  ! 3883: LDUBA_I	lduba	[%r18, + 0x0043] %asi, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbe344000  ! 3888: ORN_R	orn 	%r17, %r0, %r31
T2_asi_reg_rd_182:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc9cc000  ! 3892: XORcc_R	xorcc 	%r19, %r0, %r30
cpu_intr_2_334:
	setx	0x3d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 4)
	.word 0xf6cc4020  ! 3903: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_335:
	setx	0x3c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa558000  ! 3909: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf254a13d  ! 3911: LDSH_I	ldsh	[%r18 + 0x013d], %r25
	.word 0xf845a1bd  ! 3913: LDSW_I	ldsw	[%r22 + 0x01bd], %r28
	.word 0xb625e1f4  ! 3917: SUB_I	sub 	%r23, 0x01f4, %r27
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_181:
	mov	0x29, %r14
	.word 0xf0f389e0  ! 3922: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xf28c4020  ! 3924: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xf6c44020  ! 3926: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
cpu_intr_2_336:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 13)
	.word 0xf44de0b1  ! 3929: LDSB_I	ldsb	[%r23 + 0x00b1], %r26
	.word 0xfacc207b  ! 3931: LDSBA_I	ldsba	[%r16, + 0x007b] %asi, %r29
cpu_intr_2_337:
	setx	0x3c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_338:
	setx	0x3f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_182:
	mov	0xc, %r14
	.word 0xf4f389e0  ! 3944: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_183:
	mov	0x38, %r14
	.word 0xf2db84a0  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa5c8000  ! 3952: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfc950020  ! 3953: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
	.word 0xfc0ce0a5  ! 3954: LDUB_I	ldub	[%r19 + 0x00a5], %r30
T2_asi_reg_rd_184:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8c4a008  ! 3961: LDSWA_I	ldswa	[%r18, + 0x0008] %asi, %r28
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 16)
	.word 0xf095e1a1  ! 3965: LDUHA_I	lduha	[%r23, + 0x01a1] %asi, %r24
	.word 0xfed4a08d  ! 3971: LDSHA_I	ldsha	[%r18, + 0x008d] %asi, %r31
cpu_intr_2_340:
	setx	0x3c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_183:
	mov	0x37, %r14
	.word 0xf2f38e80  ! 3976: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8cd6111  ! 3980: LDSBA_I	ldsba	[%r21, + 0x0111] %asi, %r28
	.word 0xb6c4e075  ! 3981: ADDCcc_I	addccc 	%r19, 0x0075, %r27
	.word 0xb0a58000  ! 3984: SUBcc_R	subcc 	%r22, %r0, %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_185:
	mov	0x28, %r14
	.word 0xfcdb89e0  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_341:
	setx	0x3f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9341000  ! 3992: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xf2040000  ! 3993: LDUW_R	lduw	[%r16 + %r0], %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 19)
	.word 0xf00ca036  ! 3996: LDUB_I	ldub	[%r18 + 0x0036], %r24
	.word 0xf4d460e7  ! 3997: LDSHA_I	ldsha	[%r17, + 0x00e7] %asi, %r26
T2_asi_reg_wr_184:
	mov	0x35, %r14
	.word 0xf2f384a0  ! 3999: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf80c612c  ! 4002: LDUB_I	ldub	[%r17 + 0x012c], %r28
	.word 0xb4b5e09e  ! 4003: ORNcc_I	orncc 	%r23, 0x009e, %r26
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ec2  ! 4004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec2, %hpstate
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 29)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b10  ! 4014: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b10, %hpstate
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, d)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_342:
	setx	0x3e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc56168  ! 4019: LDSWA_I	ldswa	[%r21, + 0x0168] %asi, %r30
cpu_intr_2_343:
	setx	0x3c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_344:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445a0f5  ! 4026: LDSW_I	ldsw	[%r22 + 0x00f5], %r26
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_185:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 4028: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfccde118  ! 4029: LDSBA_I	ldsba	[%r23, + 0x0118] %asi, %r30
T2_asi_reg_rd_186:
	mov	0x31, %r14
	.word 0xf6db89e0  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf6554000  ! 4031: LDSH_R	ldsh	[%r21 + %r0], %r27
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 21)
	.word 0xfec4a07c  ! 4033: LDSWA_I	ldswa	[%r18, + 0x007c] %asi, %r31
	.word 0xfe848020  ! 4034: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c4020  ! 4038: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
cpu_intr_2_345:
	setx	0x3c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_186:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 4040: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_346:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804a05d  ! 4048: LDUW_I	lduw	[%r18 + 0x005d], %r28
cpu_intr_2_347:
	setx	0x3c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf855c000  ! 4054: LDSH_R	ldsh	[%r23 + %r0], %r28
T2_asi_reg_wr_187:
	mov	0xb, %r14
	.word 0xfaf384a0  ! 4055: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_187:
	mov	0x1c, %r14
	.word 0xf6db84a0  ! 4060: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 21)
	.word 0xf2d5a075  ! 4064: LDSHA_I	ldsha	[%r22, + 0x0075] %asi, %r25
T2_asi_reg_rd_188:
	mov	0x17, %r14
	.word 0xfadb8e40  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_188:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 4069: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_348:
	setx	0x3c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c2166  ! 4076: LDUB_I	ldub	[%r16 + 0x0166], %r25
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_349:
	setx	0x3d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x3f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37c6401  ! 4081: MOVR_I	movre	%r17, 0x1, %r25
	.word 0xbf3c0000  ! 4082: SRA_R	sra 	%r16, %r0, %r31
	.word 0xf294e0f5  ! 4088: LDUHA_I	lduha	[%r19, + 0x00f5] %asi, %r25
	.word 0xfe4c21fc  ! 4090: LDSB_I	ldsb	[%r16 + 0x01fc], %r31
	.word 0xf6458000  ! 4091: LDSW_R	ldsw	[%r22 + %r0], %r27
T2_asi_reg_wr_189:
	mov	0xf, %r14
	.word 0xf0f38e80  ! 4092: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_189:
	mov	0x27, %r14
	.word 0xf8db89e0  ! 4095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_351:
	setx	0x42011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb340000  ! 4099: SRL_R	srl 	%r16, %r0, %r29
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, c)
	.word 0xfc4de1e0  ! 4102: LDSB_I	ldsb	[%r23 + 0x01e0], %r30
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 18)
	.word 0xf684e18e  ! 4112: LDUWA_I	lduwa	[%r19, + 0x018e] %asi, %r27
	.word 0xf645c000  ! 4115: LDSW_R	ldsw	[%r23 + %r0], %r27
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 39)
	.word 0xb7508000  ! 4117: RDPR_TSTATE	<illegal instruction>
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe54e109  ! 4121: LDSH_I	ldsh	[%r19 + 0x0109], %r31
	.word 0xf2840020  ! 4122: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xbe04210c  ! 4123: ADD_I	add 	%r16, 0x010c, %r31
	.word 0xb9518000  ! 4124: RDPR_PSTATE	<illegal instruction>
	.word 0xb63c6130  ! 4125: XNOR_I	xnor 	%r17, 0x0130, %r27
	.word 0xb6bd8000  ! 4126: XNORcc_R	xnorcc 	%r22, %r0, %r27
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa558000  ! 4131: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb6258000  ! 4133: SUB_R	sub 	%r22, %r0, %r27
cpu_intr_2_352:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_190:
	mov	0xe, %r14
	.word 0xfef384a0  ! 4135: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_191:
	mov	0xd, %r14
	.word 0xfef38400  ! 4140: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfecd0020  ! 4141: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
cpu_intr_2_353:
	setx	0x42021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5da0af  ! 4145: LDX_I	ldx	[%r22 + 0x00af], %r29
	.word 0xb52c7001  ! 4146: SLLX_I	sllx	%r17, 0x0001, %r26
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf48c0020  ! 4153: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_190:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_TO_TL0
	.word 0xfed5e143  ! 4167: LDSHA_I	ldsha	[%r23, + 0x0143] %asi, %r31
	.word 0xf2c4a1f1  ! 4168: LDSWA_I	ldswa	[%r18, + 0x01f1] %asi, %r25
	.word 0xf0444000  ! 4173: LDSW_R	ldsw	[%r17 + %r0], %r24
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 25)
	.word 0xfcc58020  ! 4175: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_192:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 4189: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfe448000  ! 4190: LDSW_R	ldsw	[%r18 + %r0], %r31
T2_asi_reg_wr_193:
	mov	0x31, %r14
	.word 0xfaf38400  ! 4191: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a0a  ! 4192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0xb93c1000  ! 4195: SRAX_R	srax	%r16, %r0, %r28
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa4461e9  ! 4197: LDSW_I	ldsw	[%r17 + 0x01e9], %r29
cpu_intr_2_354:
	setx	0x400036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cb001  ! 4204: SLLX_I	sllx	%r18, 0x0001, %r28
T2_asi_reg_rd_191:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 4205: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_194:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 4208: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_195:
	mov	0x21, %r14
	.word 0xfef389e0  ! 4210: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_192:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 22)
	.word 0xf29420be  ! 4220: LDUHA_I	lduha	[%r16, + 0x00be] %asi, %r25
cpu_intr_2_355:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 39)
	.word 0xfe8cc020  ! 4224: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
T2_asi_reg_rd_193:
	mov	0xf, %r14
	.word 0xf8db8400  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfc050000  ! 4227: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfc5ce0cf  ! 4228: LDX_I	ldx	[%r19 + 0x00cf], %r30
cpu_intr_2_356:
	setx	0x41011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_357:
	setx	0x41003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_358:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8448000  ! 4236: ADDC_R	addc 	%r18, %r0, %r28
cpu_intr_2_359:
	setx	0x430021, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b5e12d  ! 4239: ORNcc_I	orncc 	%r23, 0x012d, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf60c6071  ! 4245: LDUB_I	ldub	[%r17 + 0x0071], %r27
T2_asi_reg_wr_196:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4246: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_360:
	setx	0x400302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4de15b  ! 4252: LDSB_I	ldsb	[%r23 + 0x015b], %r29
cpu_intr_2_361:
	setx	0x41000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_362:
	setx	0x40021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_197:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 4260: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfcd5c020  ! 4261: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
	.word 0xfe044000  ! 4262: LDUW_R	lduw	[%r17 + %r0], %r31
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_194:
	mov	0x17, %r14
	.word 0xfedb8e60  ! 4268: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_195:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfa45a0b2  ! 4274: LDSW_I	ldsw	[%r22 + 0x00b2], %r29
	.word 0xf4c40020  ! 4275: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
cpu_intr_2_363:
	setx	0x410222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48461ea  ! 4278: LDUWA_I	lduwa	[%r17, + 0x01ea] %asi, %r26
	.word 0xb33d8000  ! 4280: SRA_R	sra 	%r22, %r0, %r25
T2_asi_reg_rd_196:
	mov	0x26, %r14
	.word 0xfedb8e80  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfc95603c  ! 4285: LDUHA_I	lduha	[%r21, + 0x003c] %asi, %r30
T2_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_198:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 4289: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6458000  ! 4292: LDSW_R	ldsw	[%r22 + %r0], %r27
cpu_intr_2_364:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a46192  ! 4296: SUBcc_I	subcc 	%r17, 0x0192, %r27
	.word 0xf2158000  ! 4297: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xf2d560d1  ! 4298: LDSHA_I	ldsha	[%r21, + 0x00d1] %asi, %r25
	.word 0xfe54c000  ! 4299: LDSH_R	ldsh	[%r19 + %r0], %r31
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_365:
	setx	0x430329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf68c0020  ! 4309: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
	.word 0xfe958020  ! 4312: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 25)
	.word 0xf2448000  ! 4317: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf2dda09c  ! 4318: LDXA_I	ldxa	[%r22, + 0x009c] %asi, %r25
	.word 0xf4d46132  ! 4321: LDSHA_I	ldsha	[%r17, + 0x0132] %asi, %r26
cpu_intr_2_366:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_367:
	setx	0x430321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_198:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 4327: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfecdc020  ! 4328: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
cpu_intr_2_368:
	setx	0x420011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_369:
	setx	0x400329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_370:
	setx	0x430102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d0000  ! 4338: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xb17c8400  ! 4339: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbe8d4000  ! 4341: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xf2cd212d  ! 4342: LDSBA_I	ldsba	[%r20, + 0x012d] %asi, %r25
	.word 0xf4842063  ! 4343: LDUWA_I	lduwa	[%r16, + 0x0063] %asi, %r26
cpu_intr_2_371:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x20, %r14
	.word 0xf0db8e60  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_200:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4346: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_199:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 4347: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_200:
	mov	0x3, %r14
	.word 0xfaf38e80  ! 4348: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_201:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 4349: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_372:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_373:
	setx	0x41010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_201:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x8194e101  ! 4359: WRPR_TPC_I	wrpr	%r19, 0x0101, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf65c8000  ! 4364: LDX_R	ldx	[%r18 + %r0], %r27
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2)
	.word 0xfa8420d9  ! 4369: LDUWA_I	lduwa	[%r16, + 0x00d9] %asi, %r29
	.word 0xfec4a09d  ! 4370: LDSWA_I	ldswa	[%r18, + 0x009d] %asi, %r31
T2_asi_reg_rd_202:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_374:
	setx	0x41013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_203:
	mov	0x29, %r14
	.word 0xf6db8e60  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828d2  ! 4376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
T2_asi_reg_wr_202:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 4377: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_375:
	setx	0x410225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_376:
	setx	0x400025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec48020  ! 4380: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf64d4000  ! 4383: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfc052032  ! 4385: LDUW_I	lduw	[%r20 + 0x0032], %r30
	.word 0xf405e165  ! 4386: LDUW_I	lduw	[%r23 + 0x0165], %r26
T2_asi_reg_wr_203:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 4387: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf015a049  ! 4388: LDUH_I	lduh	[%r22 + 0x0049], %r24
T2_asi_reg_rd_204:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_204:
	mov	0x38, %r14
	.word 0xf6f38e60  ! 4391: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6cd0020  ! 4394: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
	.word 0xf285216e  ! 4396: LDUWA_I	lduwa	[%r20, + 0x016e] %asi, %r25
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c80  ! 4400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c80, %hpstate
T2_asi_reg_wr_205:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 4402: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_205:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_2_377:
	setx	0x400226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44a01b  ! 4409: LDSW_I	ldsw	[%r18 + 0x001b], %r30
	.word 0xfcc54020  ! 4411: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
cpu_intr_2_378:
	setx	0x42022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c0000  ! 4415: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf05ce173  ! 4416: LDX_I	ldx	[%r19 + 0x0173], %r24
cpu_intr_2_379:
	setx	0x420200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 4)
	.word 0xf445610e  ! 4419: LDSW_I	ldsw	[%r21 + 0x010e], %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf64460bc  ! 4424: LDSW_I	ldsw	[%r17 + 0x00bc], %r27
	.word 0xf2c44020  ! 4425: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xf484c020  ! 4426: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_380:
	setx	0x43033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x16, %r14
	.word 0xfedb8e80  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf2c40020  ! 4432: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xb60c8000  ! 4433: AND_R	and 	%r18, %r0, %r27
cpu_intr_2_381:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 11)
	.word 0xf4144000  ! 4441: LDUH_R	lduh	[%r17 + %r0], %r26
T2_asi_reg_wr_206:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 4445: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa84c020  ! 4446: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
	.word 0xf0dd60fc  ! 4448: LDXA_I	ldxa	[%r21, + 0x00fc] %asi, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf20d8000  ! 4452: LDUB_R	ldub	[%r22 + %r0], %r25
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 39)
	.word 0xf4c460ad  ! 4456: LDSWA_I	ldswa	[%r17, + 0x00ad] %asi, %r26
	.word 0xfc0c61ec  ! 4457: LDUB_I	ldub	[%r17 + 0x01ec], %r30
cpu_intr_2_382:
	setx	0x41002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 4463: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xfc4c619f  ! 4467: LDSB_I	ldsb	[%r17 + 0x019f], %r30
	.word 0xb4444000  ! 4468: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xf4850020  ! 4469: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xb88d606c  ! 4470: ANDcc_I	andcc 	%r21, 0x006c, %r28
cpu_intr_2_383:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57d4400  ! 4472: MOVR_R	movre	%r21, %r0, %r26
cpu_intr_2_384:
	setx	0x420012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045c000  ! 4474: LDSW_R	ldsw	[%r23 + %r0], %r24
cpu_intr_2_385:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d4020  ! 4477: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
cpu_intr_2_386:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d8400  ! 4484: MOVR_R	movre	%r22, %r0, %r27
	.word 0xfccd8020  ! 4485: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
	.word 0xbaa4e18b  ! 4488: SUBcc_I	subcc 	%r19, 0x018b, %r29
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_207:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 4493: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_387:
	setx	0x430027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d202f  ! 4495: LDX_I	ldx	[%r20 + 0x002f], %r28
	.word 0xf2940020  ! 4496: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_388:
	setx	0x430111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c0000  ! 4499: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf8c40020  ! 4501: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xf654210a  ! 4502: LDSH_I	ldsh	[%r16 + 0x010a], %r27
cpu_intr_2_389:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_390:
	setx	0x400306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dd60d4  ! 4506: LDXA_I	ldxa	[%r21, + 0x00d4] %asi, %r24
	.word 0xfa8c4020  ! 4508: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 39)
	.word 0xfc0c8000  ! 4512: LDUB_R	ldub	[%r18 + %r0], %r30
T2_asi_reg_rd_208:
	mov	0x10, %r14
	.word 0xf0db89e0  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_207:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 4521: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_wr_208:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 4523: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfac521ac  ! 4524: LDSWA_I	ldswa	[%r20, + 0x01ac] %asi, %r29
T2_asi_reg_wr_209:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 4525: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6c4e0b7  ! 4530: LDSWA_I	ldswa	[%r19, + 0x00b7] %asi, %r27
	.word 0xf85ca0ba  ! 4531: LDX_I	ldx	[%r18 + 0x00ba], %r28
T2_asi_reg_rd_209:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 4532: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfe040000  ! 4541: LDUW_R	lduw	[%r16 + %r0], %r31
T2_asi_reg_wr_210:
	mov	0xf, %r14
	.word 0xf4f38400  ! 4542: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_391:
	setx	0x420333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c8000  ! 4546: LDX_R	ldx	[%r18 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_210:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_392:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d50020  ! 4550: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_211:
	mov	0x1e, %r14
	.word 0xf6db89e0  ! 4551: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_393:
	setx	0x460210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_212:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 4557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf84c21b4  ! 4561: LDSB_I	ldsb	[%r16 + 0x01b4], %r28
	.word 0xfacce1d4  ! 4563: LDSBA_I	ldsba	[%r19, + 0x01d4] %asi, %r29
T2_asi_reg_wr_211:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 4564: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_394:
	setx	0x46010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04a076  ! 4570: LDUW_I	lduw	[%r18 + 0x0076], %r30
	.word 0xf044a1e6  ! 4573: LDSW_I	ldsw	[%r18 + 0x01e6], %r24
	.word 0xbd3c6001  ! 4577: SRA_I	sra 	%r17, 0x0001, %r30
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 37)
	.word 0xf40c6010  ! 4579: LDUB_I	ldub	[%r17 + 0x0010], %r26
	.word 0xf80ce1d8  ! 4580: LDUB_I	ldub	[%r19 + 0x01d8], %r28
	.word 0xf4440000  ! 4582: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf415a141  ! 4584: LDUH_I	lduh	[%r22 + 0x0141], %r26
	.word 0xf40d4000  ! 4585: LDUB_R	ldub	[%r21 + %r0], %r26
T2_asi_reg_rd_213:
	mov	0x1b, %r14
	.word 0xf8db8400  ! 4587: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4948020  ! 4588: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
	.word 0xfa44e110  ! 4589: LDSW_I	ldsw	[%r19 + 0x0110], %r29
	.word 0xf6cc4020  ! 4593: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
cpu_intr_2_395:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 4595: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xb3358000  ! 4597: SRL_R	srl 	%r22, %r0, %r25
	.word 0xb4bd0000  ! 4598: XNORcc_R	xnorcc 	%r20, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8c21f4  ! 4609: LDUBA_I	lduba	[%r16, + 0x01f4] %asi, %r30
cpu_intr_2_396:
	setx	0x440027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa5c0000  ! 4614: LDX_R	ldx	[%r16 + %r0], %r29
cpu_intr_2_397:
	setx	0x450209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_212:
	mov	0x20, %r14
	.word 0xfef389e0  ! 4618: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe8d216f  ! 4619: ANDcc_I	andcc 	%r20, 0x016f, %r31
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 23)
	.word 0x8795216b  ! 4623: WRPR_TT_I	wrpr	%r20, 0x016b, %tt
cpu_intr_2_398:
	setx	0x440326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45a1c8  ! 4626: LDSW_I	ldsw	[%r22 + 0x01c8], %r29
T2_asi_reg_rd_214:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf685c020  ! 4632: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_215:
	mov	0x21, %r14
	.word 0xf0db8400  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbcbc4000  ! 4634: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xbab5c000  ! 4635: SUBCcc_R	orncc 	%r23, %r0, %r29
cpu_intr_2_399:
	setx	0x460106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 4637: LDSB_R	ldsb	[%r17 + %r0], %r26
T2_asi_reg_rd_216:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_400:
	setx	0x460321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe5d8000  ! 4643: LDX_R	ldx	[%r22 + %r0], %r31
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 15)
	.word 0xf60cc000  ! 4646: LDUB_R	ldub	[%r19 + %r0], %r27
cpu_intr_2_401:
	setx	0x46022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 4659: LDUB_R	ldub	[%r17 + %r0], %r26
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_217:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_218:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 25)
	.word 0x8f902000  ! 4666: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T2_asi_reg_rd_219:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb97d6401  ! 4669: MOVR_I	movre	%r21, 0x1, %r28
T2_asi_reg_rd_220:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa14614b  ! 4671: LDUH_I	lduh	[%r17 + 0x014b], %r29
T2_asi_reg_wr_213:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 4672: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_402:
	setx	0x45030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a13b  ! 4678: LDSW_I	ldsw	[%r18 + 0x013b], %r28
	.word 0xf08d0020  ! 4680: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xb20c4000  ! 4683: AND_R	and 	%r17, %r0, %r25
	.word 0x8d942050  ! 4684: WRPR_PSTATE_I	wrpr	%r16, 0x0050, %pstate
	.word 0xf05460f5  ! 4688: LDSH_I	ldsh	[%r17 + 0x00f5], %r24
	.word 0xf8d58020  ! 4690: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
	.word 0xfc8c0020  ! 4691: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
cpu_intr_2_403:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214c000  ! 4693: LDUH_R	lduh	[%r19 + %r0], %r25
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982bd2  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd2, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xf48ca0b9  ! 4698: LDUBA_I	lduba	[%r18, + 0x00b9] %asi, %r26
	.word 0xb2a48000  ! 4699: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xbd510000  ! 4700: RDPR_TICK	<illegal instruction>
	.word 0xf6452166  ! 4702: LDSW_I	ldsw	[%r20 + 0x0166], %r27
	.word 0xf245c000  ! 4705: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb0852165  ! 4712: ADDcc_I	addcc 	%r20, 0x0165, %r24
cpu_intr_2_404:
	setx	0x440308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, b)
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfad52132  ! 4731: LDSHA_I	ldsha	[%r20, + 0x0132] %asi, %r29
	.word 0xf6dde0e5  ! 4739: LDXA_I	ldxa	[%r23, + 0x00e5] %asi, %r27
	.word 0xb7352001  ! 4742: SRL_I	srl 	%r20, 0x0001, %r27
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 12)
	.word 0xf64dc000  ! 4744: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf65de15c  ! 4747: LDX_I	ldx	[%r23 + 0x015c], %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_221:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc14601e  ! 4752: LDUH_I	lduh	[%r17 + 0x001e], %r30
	ta	T_CHANGE_HPRIV
	.word 0xf845204b  ! 4761: LDSW_I	ldsw	[%r20 + 0x004b], %r28
T2_asi_reg_rd_222:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_405:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334f001  ! 4765: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xf054e14d  ! 4766: LDSH_I	ldsh	[%r19 + 0x014d], %r24
	.word 0xf2154000  ! 4767: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_rd_223:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a12  ! 4771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a12, %hpstate
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc846040  ! 4780: LDUWA_I	lduwa	[%r17, + 0x0040] %asi, %r30
cpu_intr_2_406:
	setx	0x460307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc544000  ! 4790: LDSH_R	ldsh	[%r17 + %r0], %r30
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 8)
	.word 0xb33d1000  ! 4794: SRAX_R	srax	%r20, %r0, %r25
	.word 0xb5520000  ! 4795: RDPR_PIL	<illegal instruction>
	.word 0xfa5da194  ! 4797: LDX_I	ldx	[%r22 + 0x0194], %r29
T2_asi_reg_wr_214:
	mov	0x36, %r14
	.word 0xf4f389e0  ! 4800: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb88c2129  ! 4802: ANDcc_I	andcc 	%r16, 0x0129, %r28
T2_asi_reg_rd_224:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 4804: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4ccc020  ! 4809: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
cpu_intr_2_407:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa84a09e  ! 4812: LDUWA_I	lduwa	[%r18, + 0x009e] %asi, %r29
cpu_intr_2_408:
	setx	0x46033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_215:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 4820: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_216:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4823: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_409:
	setx	0x460200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_410:
	setx	0x460125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c205d  ! 4830: LDUBA_I	lduba	[%r16, + 0x005d] %asi, %r27
	.word 0xbb34a001  ! 4832: SRL_I	srl 	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb92c8000  ! 4839: SLL_R	sll 	%r18, %r0, %r28
	.word 0xfec54020  ! 4840: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
cpu_intr_2_411:
	setx	0x44023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f10  ! 4844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f10, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_217:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 4847: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_412:
	setx	0x460035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccce14f  ! 4854: LDSBA_I	ldsba	[%r19, + 0x014f] %asi, %r30
	.word 0xbc3de06b  ! 4856: XNOR_I	xnor 	%r23, 0x006b, %r30
	.word 0xf24ca098  ! 4864: LDSB_I	ldsb	[%r18 + 0x0098], %r25
	.word 0xfccd8020  ! 4866: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc45e1c3  ! 4871: LDSW_I	ldsw	[%r23 + 0x01c3], %r30
T2_asi_reg_wr_218:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 4873: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_413:
	setx	0x45003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd4020  ! 4882: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
cpu_intr_2_414:
	setx	0x460133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_415:
	setx	0x470101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_416:
	setx	0x470014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_417:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_219:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 4898: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_418:
	setx	0x47033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_419:
	setx	0x460230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d618b  ! 4906: LDUBA_I	lduba	[%r21, + 0x018b] %asi, %r27
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_420:
	setx	0x47033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc0020  ! 4915: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
	.word 0xb43c20c8  ! 4916: XNOR_I	xnor 	%r16, 0x00c8, %r26
	.word 0xfc4d216a  ! 4917: LDSB_I	ldsb	[%r20 + 0x016a], %r30
	.word 0xf855a1ca  ! 4920: LDSH_I	ldsh	[%r22 + 0x01ca], %r28
T2_asi_reg_wr_220:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 4922: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfe448000  ! 4925: LDSW_R	ldsw	[%r18 + %r0], %r31
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe5420d4  ! 4929: LDSH_I	ldsh	[%r16 + 0x00d4], %r31
T2_asi_reg_wr_221:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 4930: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa8cc020  ! 4931: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xbeac6105  ! 4932: ANDNcc_I	andncc 	%r17, 0x0105, %r31
T2_asi_reg_rd_225:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 4934: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_226:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 25)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983eda  ! 4941: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eda, %hpstate
	.word 0xbc858000  ! 4942: ADDcc_R	addcc 	%r22, %r0, %r30
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfadde1f5  ! 4952: LDXA_I	ldxa	[%r23, + 0x01f5] %asi, %r29
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b40  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
	.word 0xfe8da1c0  ! 4959: LDUBA_I	lduba	[%r22, + 0x01c0] %asi, %r31
	.word 0xf4154000  ! 4960: LDUH_R	lduh	[%r21 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb33d4000  ! 4962: SRA_R	sra 	%r21, %r0, %r25
	.word 0xf654a11e  ! 4963: LDSH_I	ldsh	[%r18 + 0x011e], %r27
	.word 0xf2cc4020  ! 4965: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
	.word 0xfc8d4020  ! 4967: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
	.word 0xf8440000  ! 4968: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xf454c000  ! 4972: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xfc8ca1a4  ! 4973: LDUBA_I	lduba	[%r18, + 0x01a4] %asi, %r30
cpu_intr_2_421:
	setx	0x470220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe85a19d  ! 4978: LDUWA_I	lduwa	[%r22, + 0x019d] %asi, %r31
	.word 0xbd3dd000  ! 4982: SRAX_R	srax	%r23, %r0, %r30
	.word 0xf0c42173  ! 4983: LDSWA_I	ldswa	[%r16, + 0x0173] %asi, %r24
cpu_intr_2_422:
	setx	0x450325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c6095  ! 4989: LDSB_I	ldsb	[%r17 + 0x0095], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_423:
	setx	0x45023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a9c820  ! 3: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb4948000  ! 5: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xb1a94820  ! 7: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a5c8e0  ! 8: FSUBq	dis not found

T1_asi_reg_wr_0:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 10: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2b54000  ! 11: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xb3a00520  ! 12: FSQRTs	fsqrt	
cpu_intr_1_0:
	setx	0x1e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x2e, %r14
	.word 0xf4db8400  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7a489c0  ! 22: FDIVd	fdivd	%f18, %f0, %f58
cpu_intr_1_1:
	setx	0x1d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 27: FMOVs	fmovs	%f0, %f24
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_2:
	setx	0x1f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 34: MOVcc_I	<illegal instruction>
	.word 0xbba00540  ! 39: FSQRTd	fsqrt	
	.word 0xbf3dd000  ! 41: SRAX_R	srax	%r23, %r0, %r31
	.word 0xb9a80420  ! 42: FMOVRZ	dis not found

T1_asi_reg_wr_1:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 46: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a00020  ! 47: FMOVs	fmovs	%f0, %f27
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbdab0820  ! 49: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_3:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_4:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 53: FMOVRGEZ	dis not found

	.word 0xbfaa0820  ! 54: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_1:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1a58960  ! 56: FMULq	dis not found

iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_5:
	setx	0x1c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7358000  ! 64: SRL_R	srl 	%r22, %r0, %r27
T1_asi_reg_wr_2:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 65: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9a88820  ! 66: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_6:
	setx	0x1d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_2:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa80820  ! 74: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_3:
	mov	0x29, %r14
	.word 0xf6f384a0  ! 77: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbfa80420  ! 78: FMOVRZ	dis not found

	.word 0xbfa5c840  ! 79: FADDd	faddd	%f54, %f0, %f62
	.word 0xba8d4000  ! 83: ANDcc_R	andcc 	%r21, %r0, %r29
cpu_intr_1_7:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_4:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 85: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_3:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 89: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb9aac820  ! 93: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 20)
	.word 0xb435e0f8  ! 98: ORN_I	orn 	%r23, 0x00f8, %r26
T1_asi_reg_rd_4:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a80c20  ! 108: FMOVRLZ	dis not found

T1_asi_reg_rd_5:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_8:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb0944000  ! 116: ORcc_R	orcc 	%r17, %r0, %r24
cpu_intr_1_9:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a50840  ! 124: FADDd	faddd	%f20, %f0, %f26
T1_asi_reg_wr_5:
	mov	0x1a, %r14
	.word 0xf8f384a0  ! 127: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9aa4820  ! 128: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbf520000  ! 130: RDPR_PIL	<illegal instruction>
	.word 0xb1a80820  ! 131: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_10:
	setx	0x1e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb825a01a  ! 133: SUB_I	sub 	%r22, 0x001a, %r28
cpu_intr_1_11:
	setx	0x1e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_6:
	mov	0x31, %r14
	.word 0xf4db8400  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_7:
	mov	0x0, %r14
	.word 0xfadb8e80  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1a40960  ! 143: FMULq	dis not found

T1_asi_reg_rd_8:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 144: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_9:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb151c000  ! 146: RDPR_TL	<illegal instruction>
cpu_intr_1_12:
	setx	0x1c0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43561a5  ! 148: ORN_I	orn 	%r21, 0x01a5, %r26
	.word 0xb3a588e0  ! 150: FSUBq	dis not found

cpu_intr_1_13:
	setx	0x1c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_10:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 156: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a58860  ! 161: FADDq	dis not found

	.word 0xb1a408c0  ! 162: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb83c4000  ! 166: XNOR_R	xnor 	%r17, %r0, %r28
T1_asi_reg_wr_6:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 168: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_11:
	mov	0x34, %r14
	.word 0xf2db8400  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_7:
	mov	0x24, %r14
	.word 0xf2f38e80  ! 172: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_15:
	setx	0x1f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_8:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 177: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5a98820  ! 181: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_9:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 184: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a9c820  ! 185: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a88820  ! 186: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbc34615f  ! 188: ORN_I	orn 	%r17, 0x015f, %r30
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 3c)
	.word 0xba04c000  ! 190: ADD_R	add 	%r19, %r0, %r29
	.word 0xb9a00020  ! 193: FMOVs	fmovs	%f0, %f28
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_16:
	setx	0x1e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 200: FSQRTs	fsqrt	
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_17:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 209: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a80820  ! 210: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_10:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 212: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1641800  ! 214: MOVcc_R	<illegal instruction>
	.word 0xb5a588e0  ! 215: FSUBq	dis not found

T1_asi_reg_rd_13:
	mov	0x11, %r14
	.word 0xfcdb84a0  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_18:
	setx	0x1d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 221: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_19:
	setx	0x1e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3aa8820  ! 228: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_20:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 233: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_21:
	setx	0x1f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_14:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_22:
	setx	0x1f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 253: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbda448c0  ! 254: FSUBd	fsubd	%f48, %f0, %f30
cpu_intr_1_23:
	setx	0x1c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 256: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_24:
	setx	0x1c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 259: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_15:
	mov	0x3, %r14
	.word 0xf8db89e0  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb7a80820  ! 263: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_12:
	mov	0x35, %r14
	.word 0xfef38e40  ! 264: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa40840  ! 266: FADDd	faddd	%f16, %f0, %f62
cpu_intr_1_25:
	setx	0x1d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_26:
	setx	0x1f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_16:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_13:
	mov	0x3, %r14
	.word 0xf8f38e60  ! 279: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3a00040  ! 280: FMOVd	fmovd	%f0, %f56
	.word 0xb1a54940  ! 281: FMULd	fmuld	%f52, %f0, %f24
T1_asi_reg_wr_14:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 284: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb72cb001  ! 285: SLLX_I	sllx	%r18, 0x0001, %r27
cpu_intr_1_27:
	setx	0x1d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9a0  ! 288: FDIVs	fdivs	%f19, %f0, %f28
cpu_intr_1_28:
	setx	0x1d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_15:
	mov	0x1c, %r14
	.word 0xf2f384a0  ! 293: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a80820  ! 294: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81420  ! 297: FMOVRNZ	dis not found

T1_asi_reg_wr_16:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 301: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda81820  ! 309: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x9194213c  ! 310: WRPR_PIL_I	wrpr	%r16, 0x013c, %pil
T1_asi_reg_wr_17:
	mov	0x9, %r14
	.word 0xf0f38e40  ! 314: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9aac820  ! 315: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_29:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, c)
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 18)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_31:
	setx	0x1d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8c0  ! 330: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_32:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a00540  ! 334: FSQRTd	fsqrt	
cpu_intr_1_33:
	setx	0x1d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_17:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_34:
	setx	0x1d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbcad8000  ! 343: ANDNcc_R	andncc 	%r22, %r0, %r30
T1_asi_reg_rd_18:
	mov	0xf, %r14
	.word 0xfadb8400  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a40920  ! 352: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbbaa0820  ! 357: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa94820  ! 358: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab4820  ! 359: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_35:
	setx	0x1e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c860  ! 364: FADDq	dis not found

	.word 0xb3a00020  ! 365: FMOVs	fmovs	%f0, %f25
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_19:
	mov	0x31, %r14
	.word 0xfadb8400  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 31)
	.word 0xbbaa4820  ! 370: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_36:
	setx	0x1c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_37:
	setx	0x1f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x1f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_39:
	setx	0x1d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44960  ! 379: FMULq	dis not found

iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_20:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbba508a0  ! 388: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa00040  ! 389: FMOVd	fmovd	%f0, %f62
T1_asi_reg_wr_18:
	mov	0x11, %r14
	.word 0xf0f384a0  ! 395: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbdab4820  ! 396: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a88820  ! 397: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c960  ! 398: FMULq	dis not found

T1_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbaa4820  ! 403: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbba4c920  ! 405: FMULs	fmuls	%f19, %f0, %f29
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 33)
	.word 0xb1a589c0  ! 408: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb9a489c0  ! 411: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xbda81420  ! 412: FMOVRNZ	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbfa4c940  ! 421: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb3a40860  ! 422: FADDq	dis not found

T1_asi_reg_rd_23:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 423: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbdab0820  ! 424: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb23d0000  ! 428: XNOR_R	xnor 	%r20, %r0, %r25
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_24:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 431: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbda509a0  ! 437: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbfa80c20  ! 438: FMOVRLZ	dis not found

T1_asi_reg_rd_25:
	mov	0x22, %r14
	.word 0xf8db8400  ! 439: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbb34b001  ! 441: SRLX_I	srlx	%r18, 0x0001, %r29
T1_asi_reg_rd_26:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda80820  ! 445: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_19:
	mov	0x15, %r14
	.word 0xfef384a0  ! 453: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_27:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfaac820  ! 455: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba5c820  ! 457: FADDs	fadds	%f23, %f0, %f29
	.word 0xb7a80c20  ! 458: FMOVRLZ	dis not found

	.word 0xb5a81c20  ! 460: FMOVRGEZ	dis not found

T1_asi_reg_wr_20:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 462: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb2bd20d1  ! 465: XNORcc_I	xnorcc 	%r20, 0x00d1, %r25
T1_asi_reg_wr_21:
	mov	0x1d, %r14
	.word 0xfcf384a0  ! 469: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_28:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5a8c820  ! 471: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbe9de1af  ! 473: XORcc_I	xorcc 	%r23, 0x01af, %r31
	.word 0xb9a84820  ! 475: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a90820  ! 478: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_40:
	setx	0x200201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 481: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda549c0  ! 489: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xbfa81c20  ! 492: FMOVRGEZ	dis not found

iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbda81420  ! 501: FMOVRNZ	dis not found

	.word 0xb9345000  ! 502: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xb3a90820  ! 503: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_22:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 504: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_41:
	setx	0x20012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_23:
	mov	0x35, %r14
	.word 0xf4f38e60  ! 511: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb9a80c20  ! 513: FMOVRLZ	dis not found

	.word 0xb9a00040  ! 514: FMOVd	fmovd	%f0, %f28
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a8c820  ! 520: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a4c8e0  ! 522: FSUBq	dis not found

iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfa489a0  ! 530: FDIVs	fdivs	%f18, %f0, %f31
	.word 0x8794e00b  ! 531: WRPR_TT_I	wrpr	%r19, 0x000b, %tt
	.word 0xb4248000  ! 532: SUB_R	sub 	%r18, %r0, %r26
cpu_intr_1_42:
	setx	0x220033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_24:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 538: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb8c461ad  ! 539: ADDCcc_I	addccc 	%r17, 0x01ad, %r28
	.word 0xb7a80820  ! 540: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb884c000  ! 541: ADDcc_R	addcc 	%r19, %r0, %r28
T1_asi_reg_rd_31:
	mov	0x12, %r14
	.word 0xfcdb8e80  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_43:
	setx	0x200115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d2049  ! 545: XNOR_I	xnor 	%r20, 0x0049, %r26
T1_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 546: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfaa4820  ! 547: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb33d5000  ! 549: SRAX_R	srax	%r21, %r0, %r25
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a84820  ! 551: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_32:
	mov	0x38, %r14
	.word 0xfadb89e0  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_33:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbab4820  ! 558: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_44:
	setx	0x230009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73df001  ! 563: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xb5a00560  ! 564: FSQRTq	fsqrt	
cpu_intr_1_45:
	setx	0x23000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x2c, %r14
	.word 0xfedb84a0  ! 566: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_26:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 568: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb09dc000  ! 569: XORcc_R	xorcc 	%r23, %r0, %r24
	.word 0xb9a5c820  ! 571: FADDs	fadds	%f23, %f0, %f28
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_46:
	setx	0x200009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 577: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_27:
	mov	0x18, %r14
	.word 0xf4f38e60  ! 578: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xba3c0000  ! 581: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xb334f001  ! 586: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xbfa4c9c0  ! 591: FDIVd	fdivd	%f50, %f0, %f62
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_35:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb035a18f  ! 596: ORN_I	orn 	%r22, 0x018f, %r24
T1_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 598: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_47:
	setx	0x200320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c860  ! 607: FADDq	dis not found

T1_asi_reg_wr_29:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 609: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb29ca01b  ! 614: XORcc_I	xorcc 	%r18, 0x001b, %r25
cpu_intr_1_48:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_30:
	mov	0x14, %r14
	.word 0xfef38e60  ! 621: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_49:
	setx	0x21013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc454000  ! 623: ADDC_R	addc 	%r21, %r0, %r30
	.word 0xb7a58960  ! 626: FMULq	dis not found

iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a00520  ! 628: FSQRTs	fsqrt	
cpu_intr_1_50:
	setx	0x23021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9ab4820  ! 636: FMOVCC	fmovs	%fcc1, %f0, %f28
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_51:
	setx	0x210011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9aa4820  ! 651: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbcb560ff  ! 655: ORNcc_I	orncc 	%r21, 0x00ff, %r30
	.word 0xb1aac820  ! 656: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a81820  ! 662: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb72c7001  ! 664: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xb5a54920  ! 667: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb21c20f7  ! 668: XOR_I	xor 	%r16, 0x00f7, %r25
	.word 0xbdabc820  ! 669: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb1a9c820  ! 679: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_38:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5a5c8a0  ! 681: FSUBs	fsubs	%f23, %f0, %f26
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_31:
	mov	0x1f, %r14
	.word 0xf0f38e80  ! 683: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_52:
	setx	0x230306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3347001  ! 693: SRLX_I	srlx	%r17, 0x0001, %r25
T1_asi_reg_wr_32:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 695: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba5c920  ! 701: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb3aa8820  ! 703: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbfa9c820  ! 705: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_53:
	setx	0x230239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba95e1df  ! 710: ORcc_I	orcc 	%r23, 0x01df, %r29
	.word 0xb3a00520  ! 711: FSQRTs	fsqrt	
	.word 0xb5a5c9c0  ! 712: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb7a00520  ! 714: FSQRTs	fsqrt	
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_54:
	setx	0x20012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5a90820  ! 724: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbda00540  ! 729: FSQRTd	fsqrt	
	.word 0xb9aa0820  ! 731: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb7a84820  ! 732: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbda54860  ! 733: FADDq	dis not found

iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a4c840  ! 740: FADDd	faddd	%f50, %f0, %f58
	.word 0xb0058000  ! 742: ADD_R	add 	%r22, %r0, %r24
cpu_intr_1_55:
	setx	0x22012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548a0  ! 745: FSUBs	fsubs	%f21, %f0, %f27
T1_asi_reg_wr_33:
	mov	0x31, %r14
	.word 0xfaf38400  ! 746: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7a81c20  ! 747: FMOVRGEZ	dis not found

	.word 0xb3a00540  ! 748: FSQRTd	fsqrt	
	.word 0xbb358000  ! 753: SRL_R	srl 	%r22, %r0, %r29
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_57:
	setx	0x23031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba54820  ! 759: FADDs	fadds	%f21, %f0, %f29
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, f)
	.word 0xbfab8820  ! 762: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_34:
	mov	0x2f, %r14
	.word 0xfaf384a0  ! 766: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_39:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 769: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda00520  ! 770: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_58:
	setx	0x200216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x20012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68dc000  ! 785: ANDcc_R	andcc 	%r23, %r0, %r27
cpu_intr_1_60:
	setx	0x20021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, a)
	.word 0xbda81c20  ! 789: FMOVRGEZ	dis not found

cpu_intr_1_61:
	setx	0x220331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35c000  ! 791: SRL_R	srl 	%r23, %r0, %r30
	.word 0xb3a81820  ! 792: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_rd_40:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1a84820  ! 794: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81420  ! 795: FMOVRNZ	dis not found

	.word 0xbda508e0  ! 797: FSUBq	dis not found

T1_asi_reg_rd_41:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_62:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 800: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb77ca401  ! 802: MOVR_I	movre	%r18, 0x1, %r27
cpu_intr_1_63:
	setx	0x200113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a5c960  ! 812: FMULq	dis not found

cpu_intr_1_64:
	setx	0x220201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb7a80820  ! 817: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_42:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_35:
	mov	0x2d, %r14
	.word 0xfaf384a0  ! 824: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a54820  ! 828: FADDs	fadds	%f21, %f0, %f27
	.word 0xbfa4c9e0  ! 830: FDIVq	dis not found

T1_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 831: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0x8994218c  ! 833: WRPR_TICK_I	wrpr	%r16, 0x018c, %tick
	.word 0xb535a001  ! 835: SRL_I	srl 	%r22, 0x0001, %r26
T1_asi_reg_rd_43:
	mov	0x12, %r14
	.word 0xfedb8e80  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_44:
	mov	0x1d, %r14
	.word 0xf8db8e80  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1a00520  ! 841: FSQRTs	fsqrt	
	.word 0xb7a80820  ! 843: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_65:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8e0  ! 847: FSUBq	dis not found

	.word 0xbbabc820  ! 849: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_45:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_46:
	mov	0x22, %r14
	.word 0xfedb8e80  ! 855: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a44940  ! 857: FMULd	fmuld	%f48, %f0, %f28
T1_asi_reg_wr_37:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 859: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba00020  ! 861: FMOVs	fmovs	%f0, %f29
cpu_intr_1_66:
	setx	0x21021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 25)
	.word 0xb534f001  ! 869: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb9a58960  ! 873: FMULq	dis not found

iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, b)
	.word 0xb5353001  ! 877: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xb1a50820  ! 879: FADDs	fadds	%f20, %f0, %f24
	.word 0xbd7d4400  ! 880: MOVR_R	movre	%r21, %r0, %r30
T1_asi_reg_wr_38:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 881: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a88820  ! 887: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_47:
	mov	0x9, %r14
	.word 0xfadb8e60  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9a588a0  ! 891: FSUBs	fsubs	%f22, %f0, %f28
cpu_intr_1_67:
	setx	0x270311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbda80820  ! 899: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a80420  ! 911: FMOVRZ	dis not found

	.word 0xb8c560f4  ! 912: ADDCcc_I	addccc 	%r21, 0x00f4, %r28
cpu_intr_1_68:
	setx	0x270227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549a0  ! 916: FDIVs	fdivs	%f21, %f0, %f30
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 919: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb4b58000  ! 920: ORNcc_R	orncc 	%r22, %r0, %r26
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a80420  ! 925: FMOVRZ	dis not found

cpu_intr_1_69:
	setx	0x27003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c960  ! 931: FMULq	dis not found

	.word 0xbcb4a174  ! 932: ORNcc_I	orncc 	%r18, 0x0174, %r30
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_70:
	setx	0x260219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_71:
	setx	0x260201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_40:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 945: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbfa81c20  ! 947: FMOVRGEZ	dis not found

	.word 0xb5a50860  ! 948: FADDq	dis not found

	.word 0xbda50940  ! 950: FMULd	fmuld	%f20, %f0, %f30
T1_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 951: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba80420  ! 953: FMOVRZ	dis not found

T1_asi_reg_rd_49:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_72:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 961: FSQRTq	fsqrt	
	.word 0xb7aa4820  ! 962: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_73:
	setx	0x240113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40960  ! 965: FMULq	dis not found

	.word 0xb3a00540  ! 970: FSQRTd	fsqrt	
	.word 0xba450000  ! 972: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xb5a00520  ! 973: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb09461ab  ! 980: ORcc_I	orcc 	%r17, 0x01ab, %r24
	.word 0xb5aa0820  ! 984: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_51:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 988: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_74:
	setx	0x250027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d600e  ! 994: XOR_I	xor 	%r21, 0x000e, %r25
	.word 0xb1a00560  ! 997: FSQRTq	fsqrt	
	.word 0xb9357001  ! 998: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0xbda4c9e0  ! 999: FDIVq	dis not found

	.word 0xbeace1c0  ! 1000: ANDNcc_I	andncc 	%r19, 0x01c0, %r31
cpu_intr_1_75:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_76:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35a061  ! 1017: ORN_I	orn 	%r22, 0x0061, %r30
	.word 0xbfabc820  ! 1020: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7643801  ! 1021: MOVcc_I	<illegal instruction>
	.word 0xbfa80820  ! 1022: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_78:
	setx	0x24031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 1032: FMOVs	fmovs	%f0, %f24
	.word 0xb0c58000  ! 1035: ADDCcc_R	addccc 	%r22, %r0, %r24
cpu_intr_1_80:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54860  ! 1038: FADDq	dis not found

	.word 0xb9a549a0  ! 1039: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xbda50960  ! 1040: FMULq	dis not found

iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 3)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_81:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 1057: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 21)
	.word 0xb335c000  ! 1059: SRL_R	srl 	%r23, %r0, %r25
	.word 0xb93cc000  ! 1060: SRA_R	sra 	%r19, %r0, %r28
	.word 0xb1a00560  ! 1061: FSQRTq	fsqrt	
	.word 0xb9ab8820  ! 1062: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbda588e0  ! 1063: FSUBq	dis not found

	.word 0xb1abc820  ! 1065: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_82:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 1068: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a98820  ! 1072: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_41:
	mov	0x11, %r14
	.word 0xfcf38e60  ! 1074: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3a00560  ! 1075: FSQRTq	fsqrt	
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda5c920  ! 1079: FMULs	fmuls	%f23, %f0, %f30
T1_asi_reg_rd_53:
	mov	0x26, %r14
	.word 0xfadb8400  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a50820  ! 1086: FADDs	fadds	%f20, %f0, %f26
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_54:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 0)
	.word 0xbec4e0e9  ! 1093: ADDCcc_I	addccc 	%r19, 0x00e9, %r31
cpu_intr_1_83:
	setx	0x250018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54960  ! 1098: FMULq	dis not found

	.word 0xb1a40860  ! 1099: FADDq	dis not found

cpu_intr_1_84:
	setx	0x25002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a4e184  ! 1102: SUBcc_I	subcc 	%r19, 0x0184, %r25
T1_asi_reg_wr_42:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 1103: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_85:
	setx	0x25003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8348000  ! 1109: ORN_R	orn 	%r18, %r0, %r28
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5ab4820  ! 1113: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_55:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 1116: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_56:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a409a0  ! 1119: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb0346051  ! 1120: ORN_I	orn 	%r17, 0x0051, %r24
	.word 0xb3ab8820  ! 1122: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80420  ! 1123: FMOVRZ	dis not found

T1_asi_reg_wr_44:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1124: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_86:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc44200a  ! 1128: ADDC_I	addc 	%r16, 0x000a, %r30
	.word 0xb3a40840  ! 1130: FADDd	faddd	%f16, %f0, %f56
cpu_intr_1_87:
	setx	0x24011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_57:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb825a1fd  ! 1133: SUB_I	sub 	%r22, 0x01fd, %r28
	.word 0xb9ab0820  ! 1139: FMOVGU	fmovs	%fcc1, %f0, %f28
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_58:
	mov	0x0, %r14
	.word 0xfadb8400  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_88:
	setx	0x250011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 1149: FMOVRNZ	dis not found

	.word 0xbeb50000  ! 1150: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xb894a090  ! 1152: ORcc_I	orcc 	%r18, 0x0090, %r28
T1_asi_reg_rd_59:
	mov	0xe, %r14
	.word 0xf8db8e80  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, f)
	.word 0xbba44960  ! 1159: FMULq	dis not found

cpu_intr_1_89:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 1161: FSQRTd	fsqrt	
	.word 0xb5a9c820  ! 1165: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a84820  ! 1166: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 21)
	.word 0xb6a4e0b0  ! 1169: SUBcc_I	subcc 	%r19, 0x00b0, %r27
cpu_intr_1_90:
	setx	0x250017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50860  ! 1173: FADDq	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_45:
	mov	0x31, %r14
	.word 0xfcf389e0  ! 1176: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a4c9e0  ! 1178: FDIVq	dis not found

iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_60:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 1180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc1ca1f8  ! 1182: XOR_I	xor 	%r18, 0x01f8, %r30
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda54840  ! 1185: FADDd	faddd	%f52, %f0, %f30
cpu_intr_1_91:
	setx	0x260337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1190: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_61:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 17)
	.word 0xb8450000  ! 1199: ADDC_R	addc 	%r20, %r0, %r28
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_92:
	setx	0x26022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x15, %r14
	.word 0xfaf384a0  ! 1208: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_93:
	setx	0x25020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_94:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_95:
	setx	0x26033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48940  ! 1219: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb02de09d  ! 1221: ANDN_I	andn 	%r23, 0x009d, %r24
T1_asi_reg_rd_62:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_96:
	setx	0x250306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 1226: MOVcc_I	<illegal instruction>
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_63:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1230: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_47:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1231: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5a00520  ! 1232: FSQRTs	fsqrt	
	.word 0xb9ab0820  ! 1233: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbba00020  ! 1237: FMOVs	fmovs	%f0, %f29
	.word 0xb9a408e0  ! 1238: FSUBq	dis not found

T1_asi_reg_wr_48:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 1241: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a588e0  ! 1243: FSUBq	dis not found

cpu_intr_1_97:
	setx	0x25033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 1245: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_64:
	mov	0x19, %r14
	.word 0xfcdb8e60  ! 1248: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_49:
	mov	0x27, %r14
	.word 0xf8f38400  ! 1250: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_65:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_66:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 1256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda80420  ! 1263: FMOVRZ	dis not found

	.word 0xb3a409c0  ! 1265: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xbdab4820  ! 1269: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba4c8e0  ! 1270: FSUBq	dis not found

cpu_intr_1_98:
	setx	0x270102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x27021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_50:
	mov	0x22, %r14
	.word 0xfef384a0  ! 1277: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_100:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_68:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_51:
	mov	0x23, %r14
	.word 0xfcf38400  ! 1281: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbda9c820  ! 1286: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a5c840  ! 1289: FADDd	faddd	%f54, %f0, %f24
	.word 0xb5a80c20  ! 1290: FMOVRLZ	dis not found

iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda508a0  ! 1296: FSUBs	fsubs	%f20, %f0, %f30
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_101:
	setx	0x270021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c940  ! 1302: FMULd	fmuld	%f50, %f0, %f62
cpu_intr_1_102:
	setx	0x26012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 1307: FMULs	fmuls	%f21, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81820  ! 1309: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbfa81820  ! 1310: FMOVRGZ	fmovs	%fcc3, %f0, %f31
T1_asi_reg_wr_52:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 1311: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfaa0820  ! 1315: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_103:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2b)
	.word 0xba14a1dd  ! 1325: OR_I	or 	%r18, 0x01dd, %r29
T1_asi_reg_wr_53:
	mov	0x2c, %r14
	.word 0xfef38e40  ! 1328: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_104:
	setx	0x27021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb0b420ed  ! 1337: ORNcc_I	orncc 	%r16, 0x00ed, %r24
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_105:
	setx	0x27030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d9000  ! 1344: SRAX_R	srax	%r22, %r0, %r31
cpu_intr_1_106:
	setx	0x250136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 1346: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_107:
	setx	0x26032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x240100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x260307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 1352: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba4c960  ! 1355: FMULq	dis not found

cpu_intr_1_110:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 1357: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa00020  ! 1360: FMOVs	fmovs	%f0, %f31
cpu_intr_1_111:
	setx	0x29021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8a0  ! 1365: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbda00040  ! 1366: FMOVd	fmovd	%f0, %f30
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1372: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbbab0820  ! 1374: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_57:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 1377: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7a8c820  ! 1378: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7347001  ! 1379: SRLX_I	srlx	%r17, 0x0001, %r27
T1_asi_reg_wr_58:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1382: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5a81c20  ! 1383: FMOVRGEZ	dis not found

	.word 0x8394e108  ! 1384: WRPR_TNPC_I	wrpr	%r19, 0x0108, %tnpc
	.word 0xb3a408a0  ! 1385: FSUBs	fsubs	%f16, %f0, %f25
T1_asi_reg_rd_70:
	mov	0x22, %r14
	.word 0xf2db8400  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbbab0820  ! 1393: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80420  ! 1394: FMOVRZ	dis not found

	.word 0xb7a488c0  ! 1396: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb9a90820  ! 1398: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 13)
	.word 0xb6c46170  ! 1401: ADDCcc_I	addccc 	%r17, 0x0170, %r27
	.word 0xbbab8820  ! 1402: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba408c0  ! 1403: FSUBd	fsubd	%f16, %f0, %f60
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa94820  ! 1408: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a9c820  ! 1411: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_112:
	setx	0x2b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40920  ! 1417: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb5a90820  ! 1418: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c940  ! 1422: FMULd	fmuld	%f54, %f0, %f28
T1_asi_reg_wr_59:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1423: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_113:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 1430: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc244000  ! 1434: SUB_R	sub 	%r17, %r0, %r30
cpu_intr_1_114:
	setx	0x290319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 1436: FMOVRNZ	dis not found

	.word 0xb5a509a0  ! 1438: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb9a80420  ! 1440: FMOVRZ	dis not found

	.word 0xbe24e19d  ! 1445: SUB_I	sub 	%r19, 0x019d, %r31
cpu_intr_1_115:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_116:
	setx	0x29033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c201c  ! 1448: XNOR_I	xnor 	%r16, 0x001c, %r24
T1_asi_reg_wr_61:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 1449: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb6ac608e  ! 1450: ANDNcc_I	andncc 	%r17, 0x008e, %r27
	.word 0xb9a4c860  ! 1454: FADDq	dis not found

cpu_intr_1_117:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_62:
	mov	0x10, %r14
	.word 0xfef38e80  ! 1459: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_118:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 1467: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_71:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7aa8820  ! 1472: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3540000  ! 1473: RDPR_GL	<illegal instruction>
cpu_intr_1_119:
	setx	0x2a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_120:
	setx	0x29022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0xb, %r14
	.word 0xfedb8e80  ! 1484: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a00560  ! 1486: FSQRTq	fsqrt	
	.word 0xbf3d4000  ! 1487: SRA_R	sra 	%r21, %r0, %r31
T1_asi_reg_wr_64:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 1493: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3a81820  ! 1495: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb29d0000  ! 1496: XORcc_R	xorcc 	%r20, %r0, %r25
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda449e0  ! 1500: FDIVq	dis not found

T1_asi_reg_wr_65:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 1501: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 9)
	.word 0xb1a80820  ! 1504: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_121:
	setx	0x2a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a5c8c0  ! 1513: FSUBd	fsubd	%f54, %f0, %f28
cpu_intr_1_122:
	setx	0x2a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a409c0  ! 1518: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbba90820  ! 1520: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a50840  ! 1522: FADDd	faddd	%f20, %f0, %f24
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_123:
	setx	0x2a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 1537: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48840  ! 1540: FADDd	faddd	%f18, %f0, %f62
	.word 0xb1abc820  ! 1542: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbda00040  ! 1543: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_66:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 1545: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3343001  ! 1548: SRLX_I	srlx	%r16, 0x0001, %r25
T1_asi_reg_wr_67:
	mov	0x14, %r14
	.word 0xfef38e40  ! 1551: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_124:
	setx	0x2b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_125:
	setx	0x2b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_68:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1561: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_126:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 1564: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9351000  ! 1565: SRLX_R	srlx	%r20, %r0, %r28
cpu_intr_1_127:
	setx	0x280118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1568: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba00560  ! 1571: FSQRTq	fsqrt	
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, e)
	.word 0xbfaa8820  ! 1574: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00520  ! 1576: FSQRTs	fsqrt	
	.word 0xb1a90820  ! 1578: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_128:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_129:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_74:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 1583: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_69:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 1584: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb695210f  ! 1585: ORcc_I	orcc 	%r20, 0x010f, %r27
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00540  ! 1592: FSQRTd	fsqrt	
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_130:
	setx	0x2b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_70:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 1597: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_75:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 1600: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7a4c820  ! 1603: FADDs	fadds	%f19, %f0, %f27
	.word 0xbfa00540  ! 1605: FSQRTd	fsqrt	
	.word 0xbda549a0  ! 1606: FDIVs	fdivs	%f21, %f0, %f30
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a409c0  ! 1610: FDIVd	fdivd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a48960  ! 1617: FMULq	dis not found

	.word 0xb3a5c820  ! 1618: FADDs	fadds	%f23, %f0, %f25
	.word 0xb2adc000  ! 1620: ANDNcc_R	andncc 	%r23, %r0, %r25
T1_asi_reg_wr_71:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 1623: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa8c820  ! 1624: FMOVL	fmovs	%fcc1, %f0, %f31
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a9c820  ! 1627: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_72:
	mov	0x18, %r14
	.word 0xfaf38e80  ! 1632: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_131:
	setx	0x2b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54840  ! 1634: FADDd	faddd	%f52, %f0, %f30
	.word 0xb3a81420  ! 1635: FMOVRNZ	dis not found

T1_asi_reg_wr_73:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 1645: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa44940  ! 1646: FMULd	fmuld	%f48, %f0, %f62
T1_asi_reg_wr_74:
	mov	0x4, %r14
	.word 0xfcf384a0  ! 1648: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_132:
	setx	0x2b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_76:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_75:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 1660: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba40960  ! 1661: FMULq	dis not found

	.word 0xbfa88820  ! 1664: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xba1420a4  ! 1665: OR_I	or 	%r16, 0x00a4, %r29
	.word 0xb8b4c000  ! 1666: SUBCcc_R	orncc 	%r19, %r0, %r28
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 23)
	.word 0xb7a48860  ! 1670: FADDq	dis not found

cpu_intr_1_133:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4350000  ! 1675: ORN_R	orn 	%r20, %r0, %r26
	.word 0xb1a80820  ! 1677: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb12df001  ! 1681: SLLX_I	sllx	%r23, 0x0001, %r24
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_134:
	setx	0x2b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_135:
	setx	0x2b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 1686: FSQRTs	fsqrt	
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a80820  ! 1689: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_136:
	setx	0x28022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbaa8820  ! 1693: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbba54960  ! 1695: FMULq	dis not found

	.word 0xbb349000  ! 1696: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xb3a48840  ! 1699: FADDd	faddd	%f18, %f0, %f56
T1_asi_reg_rd_78:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1700: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_79:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 1701: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9a98820  ! 1704: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbba40860  ! 1705: FADDq	dis not found

cpu_intr_1_137:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614c000  ! 1708: OR_R	or 	%r19, %r0, %r27
	.word 0xb2acc000  ! 1710: ANDNcc_R	andncc 	%r19, %r0, %r25
T1_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 1712: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_138:
	setx	0x290115, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_81:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_139:
	setx	0x2b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_76:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 1719: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba48860  ! 1720: FADDq	dis not found

	.word 0xb9643801  ! 1722: MOVcc_I	<illegal instruction>
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 23)
	.word 0xb7346001  ! 1724: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0xb7a80820  ! 1725: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab0820  ! 1727: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbfaac820  ! 1729: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_140:
	setx	0x28030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 1733: FSQRTq	fsqrt	
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbda549e0  ! 1738: FDIVq	dis not found

T1_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 1743: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbda00040  ! 1744: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_77:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 1746: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7aac820  ! 1747: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 25)
	.word 0xbe158000  ! 1750: OR_R	or 	%r22, %r0, %r31
cpu_intr_1_141:
	setx	0x280007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_83:
	mov	0x2, %r14
	.word 0xfcdb8e40  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_84:
	mov	0x27, %r14
	.word 0xf8db84a0  ! 1758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 5)
	.word 0xb8a5a0ea  ! 1761: SUBcc_I	subcc 	%r22, 0x00ea, %r28
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa98820  ! 1764: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a8c820  ! 1767: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_85:
	mov	0x32, %r14
	.word 0xf0db84a0  ! 1770: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1a58860  ! 1776: FADDq	dis not found

T1_asi_reg_rd_86:
	mov	0xc, %r14
	.word 0xf6db8e80  ! 1781: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_87:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_88:
	mov	0x33, %r14
	.word 0xf2db8400  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbba94820  ! 1785: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb085a0cb  ! 1787: ADDcc_I	addcc 	%r22, 0x00cb, %r24
cpu_intr_1_142:
	setx	0x2a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x11, %r14
	.word 0xf0f389e0  ! 1791: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9a488a0  ! 1794: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xbdab8820  ! 1796: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbb641800  ! 1803: MOVcc_R	<illegal instruction>
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_89:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_143:
	setx	0x2c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_79:
	mov	0x15, %r14
	.word 0xfef38e40  ! 1814: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbe04c000  ! 1819: ADD_R	add 	%r19, %r0, %r31
	.word 0xb1ab4820  ! 1822: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1824: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_90:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_144:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588a0  ! 1840: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb72d4000  ! 1841: SLL_R	sll 	%r21, %r0, %r27
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_145:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 1847: FMOVs	fmovs	%f0, %f26
	.word 0xbbab0820  ! 1849: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_81:
	mov	0xe, %r14
	.word 0xf6f38400  ! 1851: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a00540  ! 1854: FSQRTd	fsqrt	
	.word 0xbeb5c000  ! 1857: ORNcc_R	orncc 	%r23, %r0, %r31
cpu_intr_1_146:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 1859: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_147:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_91:
	mov	0x3, %r14
	.word 0xfadb89e0  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_82:
	mov	0x16, %r14
	.word 0xfaf389e0  ! 1865: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_83:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 1866: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a40820  ! 1867: FADDs	fadds	%f16, %f0, %f24
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_92:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1869: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_93:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1a80820  ! 1871: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_148:
	setx	0x2d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_149:
	setx	0x2e013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48840  ! 1875: FADDd	faddd	%f18, %f0, %f60
	.word 0xb7a448c0  ! 1876: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbba4c9c0  ! 1878: FDIVd	fdivd	%f50, %f0, %f60
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 20)
	.word 0xb9a54840  ! 1882: FADDd	faddd	%f52, %f0, %f28
	.word 0xb0c50000  ! 1883: ADDCcc_R	addccc 	%r20, %r0, %r24
T1_asi_reg_wr_84:
	mov	0x17, %r14
	.word 0xf8f384a0  ! 1885: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_150:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54860  ! 1887: FADDq	dis not found

	.word 0xb7a80820  ! 1888: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_151:
	setx	0x2c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 1893: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_85:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 1896: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_86:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 1898: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7a50940  ! 1899: FMULd	fmuld	%f20, %f0, %f58
	.word 0xb7a00560  ! 1900: FSQRTq	fsqrt	
	.word 0xbf3d7001  ! 1904: SRAX_I	srax	%r21, 0x0001, %r31
cpu_intr_1_152:
	setx	0x2d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_154:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 1912: FMOVs	fmovs	%f0, %f28
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda81420  ! 1915: FMOVRNZ	dis not found

T1_asi_reg_rd_95:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbda48960  ! 1919: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a509c0  ! 1927: FDIVd	fdivd	%f20, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7abc820  ! 1930: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_155:
	setx	0x2e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 1936: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a449a0  ! 1937: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbda00560  ! 1938: FSQRTq	fsqrt	
T1_asi_reg_wr_87:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 1941: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_96:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 9)
	.word 0xbba00540  ! 1947: FSQRTd	fsqrt	
	.word 0xb9a4c820  ! 1948: FADDs	fadds	%f19, %f0, %f28
cpu_intr_1_156:
	setx	0x2f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 1953: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_157:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_158:
	setx	0x2c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 1961: FMOVs	fmovs	%f0, %f26
T1_asi_reg_wr_88:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1962: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_97:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 1964: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbf2dd000  ! 1967: SLLX_R	sllx	%r23, %r0, %r31
cpu_intr_1_159:
	setx	0x2c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 1973: FMOVRLZ	dis not found

cpu_intr_1_160:
	setx	0x2e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_98:
	mov	0x7, %r14
	.word 0xf0db8400  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9abc820  ! 1979: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81c20  ! 1984: FMOVRGEZ	dis not found

T1_asi_reg_wr_89:
	mov	0x27, %r14
	.word 0xf0f38400  ! 1989: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_90:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 1993: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_161:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 1998: FMOVL	fmovs	%fcc1, %f0, %f27
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba5c820  ! 2005: FADDs	fadds	%f23, %f0, %f29
	.word 0xbab5c000  ! 2006: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xb9a88820  ! 2008: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_162:
	setx	0x2f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_99:
	mov	0x21, %r14
	.word 0xfadb8400  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5a508e0  ! 2017: FSUBq	dis not found

	.word 0xbf343001  ! 2023: SRLX_I	srlx	%r16, 0x0001, %r31
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_91:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 2025: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbda4c8a0  ! 2026: FSUBs	fsubs	%f19, %f0, %f30
T1_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_92:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 2028: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_93:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 2030: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_102:
	mov	0x30, %r14
	.word 0xfadb8e40  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_94:
	mov	0x19, %r14
	.word 0xfef389e0  ! 2034: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_103:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_163:
	setx	0x2d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2039: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 2043: FSQRTs	fsqrt	
cpu_intr_1_164:
	setx	0x2c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a54840  ! 2047: FADDd	faddd	%f52, %f0, %f24
	.word 0xbdaa8820  ! 2048: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb9a80820  ! 2056: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_165:
	setx	0x2f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_166:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 2061: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a88820  ! 2067: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_167:
	setx	0x2d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_168:
	setx	0x2d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2073: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_95:
	mov	0x19, %r14
	.word 0xfaf38e60  ! 2075: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb37cc400  ! 2077: MOVR_R	movre	%r19, %r0, %r25
	.word 0xb5a88820  ! 2080: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x8994e189  ! 2086: WRPR_TICK_I	wrpr	%r19, 0x0189, %tick
cpu_intr_1_169:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 2091: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_96:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 2095: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a00520  ! 2097: FSQRTs	fsqrt	
	.word 0xbb341000  ! 2098: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xbda80820  ! 2100: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a00540  ! 2105: FSQRTd	fsqrt	
cpu_intr_1_170:
	setx	0x2f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_171:
	setx	0x2f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_172:
	setx	0x2c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_173:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 2115: FMOVRLZ	dis not found

	.word 0xb5a90820  ! 2118: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbba80c20  ! 2119: FMOVRLZ	dis not found

	.word 0xb1a40920  ! 2120: FMULs	fmuls	%f16, %f0, %f24
T1_asi_reg_rd_105:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_174:
	setx	0x2d030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 10)
	.word 0xb534e001  ! 2129: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xbca56022  ! 2131: SUBcc_I	subcc 	%r21, 0x0022, %r30
T1_asi_reg_wr_97:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 2133: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7a408c0  ! 2134: FSUBd	fsubd	%f16, %f0, %f58
cpu_intr_1_176:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_98:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 2147: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xba9c0000  ! 2149: XORcc_R	xorcc 	%r16, %r0, %r29
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_177:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_106:
	mov	0x0, %r14
	.word 0xf4db8400  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_178:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5a58860  ! 2160: FADDq	dis not found

cpu_intr_1_179:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbead6182  ! 2166: ANDNcc_I	andncc 	%r21, 0x0182, %r31
	.word 0xbcb4617d  ! 2168: ORNcc_I	orncc 	%r17, 0x017d, %r30
T1_asi_reg_rd_107:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 2173: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbda589e0  ! 2174: FDIVq	dis not found

T1_asi_reg_rd_108:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_180:
	setx	0x2f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 2189: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbc35c000  ! 2192: ORN_R	orn 	%r23, %r0, %r30
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7abc820  ! 2195: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_181:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614a1c5  ! 2202: OR_I	or 	%r18, 0x01c5, %r27
cpu_intr_1_182:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1ab8820  ! 2214: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 2219: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a80c20  ! 2221: FMOVRLZ	dis not found

	.word 0xb17c0400  ! 2223: MOVR_R	movre	%r16, %r0, %r24
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_100:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 2229: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7a488c0  ! 2230: FSUBd	fsubd	%f18, %f0, %f58
cpu_intr_1_183:
	setx	0x2c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44860  ! 2236: FADDq	dis not found

T1_asi_reg_wr_101:
	mov	0x22, %r14
	.word 0xfcf38e80  ! 2237: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_102:
	mov	0x33, %r14
	.word 0xf8f38e60  ! 2238: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbf50c000  ! 2241: RDPR_TT	<illegal instruction>
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbdaa4820  ! 2249: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_109:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb434a17b  ! 2252: ORN_I	orn 	%r18, 0x017b, %r26
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa409e0  ! 2258: FDIVq	dis not found

T1_asi_reg_wr_103:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2260: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3a40820  ! 2262: FADDs	fadds	%f16, %f0, %f25
	.word 0xb7ab4820  ! 2264: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80820  ! 2269: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbe0ce086  ! 2270: AND_I	and 	%r19, 0x0086, %r31
cpu_intr_1_184:
	setx	0x300310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_185:
	setx	0x300222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548c0  ! 2274: FSUBd	fsubd	%f52, %f0, %f58
cpu_intr_1_186:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c61b7  ! 2278: XNOR_I	xnor 	%r17, 0x01b7, %r30
cpu_intr_1_187:
	setx	0x320121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2280: FMOVRZ	dis not found

	.word 0xb7a488a0  ! 2281: FSUBs	fsubs	%f18, %f0, %f27
T1_asi_reg_wr_104:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2283: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbcbc8000  ! 2285: XNORcc_R	xnorcc 	%r18, %r0, %r30
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_105:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 2288: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, e)
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a81c20  ! 2291: FMOVRGEZ	dis not found

	.word 0xb53d0000  ! 2293: SRA_R	sra 	%r20, %r0, %r26
T1_asi_reg_rd_110:
	mov	0x35, %r14
	.word 0xf4db8400  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_111:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_188:
	setx	0x310039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_112:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfa48840  ! 2309: FADDd	faddd	%f18, %f0, %f62
T1_asi_reg_rd_113:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1ab8820  ! 2317: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a98820  ! 2318: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_189:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_190:
	setx	0x320130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfa00020  ! 2331: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_106:
	mov	0x29, %r14
	.word 0xfef38400  ! 2333: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb4b48000  ! 2334: ORNcc_R	orncc 	%r18, %r0, %r26
T1_asi_reg_rd_114:
	mov	0xc, %r14
	.word 0xf6db8400  ! 2337: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a00540  ! 2340: FSQRTd	fsqrt	
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_115:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda81420  ! 2348: FMOVRNZ	dis not found

	.word 0xb9a80420  ! 2349: FMOVRZ	dis not found

	.word 0xbfa58940  ! 2352: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbfa00560  ! 2353: FSQRTq	fsqrt	
cpu_intr_1_191:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_116:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfab8820  ! 2360: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_192:
	setx	0x31021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 2367: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3a81820  ! 2368: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb3a00040  ! 2369: FMOVd	fmovd	%f0, %f56
	.word 0xbe04218c  ! 2370: ADD_I	add 	%r16, 0x018c, %r31
T1_asi_reg_wr_108:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 2376: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5aa8820  ! 2378: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_117:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 2379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbaa0820  ! 2382: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_193:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 2385: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_194:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 2388: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7a84820  ! 2390: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_195:
	setx	0x310210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c960  ! 2393: FMULq	dis not found

	.word 0x83952073  ! 2394: WRPR_TNPC_I	wrpr	%r20, 0x0073, %tnpc
	.word 0xb7a58920  ! 2397: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbfa80820  ! 2401: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_196:
	setx	0x33030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_109:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 2406: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1aac820  ! 2411: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5abc820  ! 2412: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a489a0  ! 2415: FDIVs	fdivs	%f18, %f0, %f24
T1_asi_reg_rd_118:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_197:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 2423: FMOVRNZ	dis not found

iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_198:
	setx	0x32011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda589c0  ! 2438: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xb3a588a0  ! 2442: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb5a408a0  ! 2445: FSUBs	fsubs	%f16, %f0, %f26
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 17)
	.word 0xbbab8820  ! 2449: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_199:
	setx	0x330102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 2453: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_200:
	setx	0x310012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2458: FMOVRZ	dis not found

	.word 0xb00d61b3  ! 2459: AND_I	and 	%r21, 0x01b3, %r24
	.word 0xbfa8c820  ! 2461: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbba84820  ! 2462: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab8820  ! 2467: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_119:
	mov	0x11, %r14
	.word 0xfcdb84a0  ! 2468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_201:
	setx	0x31031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_120:
	mov	0x1a, %r14
	.word 0xf4db84a0  ! 2470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_202:
	setx	0x330003, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_110:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 2473: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_111:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 2475: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_203:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 2478: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 2481: FMOVRLZ	dis not found

	.word 0xb7508000  ! 2483: RDPR_TSTATE	<illegal instruction>
T1_asi_reg_rd_121:
	mov	0x29, %r14
	.word 0xf2db8400  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1a548c0  ! 2487: FSUBd	fsubd	%f52, %f0, %f24
T1_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 2489: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb41d8000  ! 2490: XOR_R	xor 	%r22, %r0, %r26
	.word 0xb9a5c9e0  ! 2492: FDIVq	dis not found

iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 28)
	.word 0xb734a001  ! 2496: SRL_I	srl 	%r18, 0x0001, %r27
T1_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 2497: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_wr_114:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 2499: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_115:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2500: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 2504: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1a588e0  ! 2505: FSUBq	dis not found

	.word 0xb7a40920  ! 2508: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb7a84820  ! 2511: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb0c5e1c9  ! 2513: ADDCcc_I	addccc 	%r23, 0x01c9, %r24
T1_asi_reg_wr_117:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 2517: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_204:
	setx	0x310116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 2523: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba48820  ! 2524: FADDs	fadds	%f18, %f0, %f29
	.word 0xb5aa0820  ! 2525: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_205:
	setx	0x320005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 2529: FMOVRNZ	dis not found

iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a54960  ! 2531: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 2537: FMOVRNZ	dis not found

iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba00560  ! 2542: FSQRTq	fsqrt	
cpu_intr_1_206:
	setx	0x310113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_118:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 2547: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb83c20d6  ! 2549: XNOR_I	xnor 	%r16, 0x00d6, %r28
	.word 0xbda00540  ! 2552: FSQRTd	fsqrt	
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_207:
	setx	0x33003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 30)
	.word 0xb6948000  ! 2559: ORcc_R	orcc 	%r18, %r0, %r27
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbfa00520  ! 2562: FSQRTs	fsqrt	
	.word 0xb8b4c000  ! 2572: ORNcc_R	orncc 	%r19, %r0, %r28
T1_asi_reg_wr_119:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 2573: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_122:
	mov	0x32, %r14
	.word 0xf6db84a0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a5c860  ! 2579: FADDq	dis not found

	.word 0xbb7c0400  ! 2580: MOVR_R	movre	%r16, %r0, %r29
	.word 0xbfa48820  ! 2582: FADDs	fadds	%f18, %f0, %f31
T1_asi_reg_rd_123:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 2587: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda44860  ! 2588: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a48960  ! 2595: FMULq	dis not found

cpu_intr_1_208:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 2597: FMOVRNZ	dis not found

	.word 0xbba44960  ! 2598: FMULq	dis not found

T1_asi_reg_wr_120:
	mov	0x20, %r14
	.word 0xf0f384a0  ! 2599: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_124:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbfa94820  ! 2601: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba00520  ! 2603: FSQRTs	fsqrt	
cpu_intr_1_209:
	setx	0x30002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_210:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 2607: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_211:
	setx	0x32013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 2609: FSUBq	dis not found

	.word 0xbfa50920  ! 2610: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb1a58920  ! 2617: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb5a84820  ! 2619: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_212:
	setx	0x330000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 2623: FMOVRGEZ	dis not found

	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_121:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 2626: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_125:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 2627: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5a8c820  ! 2628: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54920  ! 2631: FMULs	fmuls	%f21, %f0, %f24
	.word 0xba95217b  ! 2632: ORcc_I	orcc 	%r20, 0x017b, %r29
T1_asi_reg_wr_122:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 2633: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_213:
	setx	0x320023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 2637: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_214:
	setx	0x30013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_123:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 2641: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_126:
	mov	0x1b, %r14
	.word 0xf8db84a0  ! 2643: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_124:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 2646: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_215:
	setx	0x320335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 2650: FMOVN	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_127:
	mov	0x19, %r14
	.word 0xf0db84a0  ! 2656: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7a81420  ! 2658: FMOVRNZ	dis not found

iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba80c20  ! 2669: FMOVRLZ	dis not found

T1_asi_reg_wr_125:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 2670: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_216:
	setx	0x330239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549a0  ! 2677: FDIVs	fdivs	%f21, %f0, %f29
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_128:
	mov	0x34, %r14
	.word 0xfadb89e0  ! 2682: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_217:
	setx	0x300324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0x33, %r14
	.word 0xfadb8e60  ! 2684: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7a00560  ! 2685: FSQRTq	fsqrt	
	.word 0xbbab0820  ! 2686: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbf3dc000  ! 2687: SRA_R	sra 	%r23, %r0, %r31
cpu_intr_1_218:
	setx	0x330110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 2691: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a84820  ! 2705: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_219:
	setx	0x330300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a509c0  ! 2711: FDIVd	fdivd	%f20, %f0, %f26
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_130:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb92c6001  ! 2717: SLL_I	sll 	%r17, 0x0001, %r28
T1_asi_reg_wr_127:
	mov	0x16, %r14
	.word 0xfef38e40  ! 2718: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_131:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda449c0  ! 2722: FDIVd	fdivd	%f48, %f0, %f30
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a50940  ! 2727: FMULd	fmuld	%f20, %f0, %f26
T1_asi_reg_wr_128:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 2729: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9a40940  ! 2730: FMULd	fmuld	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_220:
	setx	0x36021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 2736: SUBC_R	orn 	%r22, %r0, %r27
cpu_intr_1_221:
	setx	0x340136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2739: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_222:
	setx	0x360204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_129:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 2745: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_130:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 2750: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_132:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 2752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_223:
	setx	0x370113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509a0  ! 2756: FDIVs	fdivs	%f20, %f0, %f30
T1_asi_reg_rd_133:
	mov	0xe, %r14
	.word 0xf4db8e80  ! 2757: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbb2cb001  ! 2759: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0xb12d7001  ! 2760: SLLX_I	sllx	%r21, 0x0001, %r24
	.word 0xb1a00020  ! 2761: FMOVs	fmovs	%f0, %f24
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_131:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 2765: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_132:
	mov	0x1, %r14
	.word 0xf8f38e60  ! 2767: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb634e0de  ! 2770: SUBC_I	orn 	%r19, 0x00de, %r27
	.word 0xbdab0820  ! 2772: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa54920  ! 2780: FMULs	fmuls	%f21, %f0, %f31
	.word 0xbba00520  ! 2788: FSQRTs	fsqrt	
	.word 0xbda81820  ! 2790: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3a58860  ! 2791: FADDq	dis not found

	.word 0xb3a81820  ! 2792: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba90820  ! 2793: FMOVLEU	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_133:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 2799: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_134:
	mov	0xd, %r14
	.word 0xfaf38400  ! 2800: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3ab0820  ! 2801: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3ab4820  ! 2803: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_134:
	mov	0x2, %r14
	.word 0xf8db8e60  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7a488e0  ! 2806: FSUBq	dis not found

T1_asi_reg_rd_135:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6a58000  ! 2808: SUBcc_R	subcc 	%r22, %r0, %r27
T1_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 2809: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_224:
	setx	0x20201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x37031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9a0  ! 2816: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb89d8000  ! 2825: XORcc_R	xorcc 	%r22, %r0, %r28
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_226:
	setx	0x360206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_227:
	setx	0x36003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_228:
	setx	0x35022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c960  ! 2844: FMULq	dis not found

	.word 0xbba489e0  ! 2845: FDIVq	dis not found

iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb17dc400  ! 2848: MOVR_R	movre	%r23, %r0, %r24
T1_asi_reg_rd_136:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 2849: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbd7d6401  ! 2851: MOVR_I	movre	%r21, 0x1, %r30
T1_asi_reg_rd_137:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 2853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_138:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 2854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_229:
	setx	0x340132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 2861: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_230:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_231:
	setx	0x340303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x340111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 2875: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_233:
	setx	0x360209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 2882: SUBC_R	orn 	%r21, %r0, %r26
cpu_intr_1_234:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_235:
	setx	0x35021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 2894: FSQRTq	fsqrt	
cpu_intr_1_236:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2899: FSQRTq	fsqrt	
	.word 0xbda00020  ! 2900: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_136:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 2904: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb88521c9  ! 2909: ADDcc_I	addcc 	%r20, 0x01c9, %r28
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbc8cc000  ! 2914: ANDcc_R	andcc 	%r19, %r0, %r30
T1_asi_reg_rd_139:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_237:
	setx	0x350029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x360009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_239:
	setx	0x340215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x370322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 2930: SUBC_R	orn 	%r19, %r0, %r24
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_137:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 2933: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7a81420  ! 2937: FMOVRNZ	dis not found

cpu_intr_1_241:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_242:
	setx	0x370005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a9c820  ! 2944: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba509c0  ! 2945: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb9a44840  ! 2947: FADDd	faddd	%f48, %f0, %f28
	.word 0xbba90820  ! 2953: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_243:
	setx	0x360229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9e0  ! 2957: FDIVq	dis not found

iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_138:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 2962: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_244:
	setx	0x34000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a4c9a0  ! 2973: FDIVs	fdivs	%f19, %f0, %f26
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a449c0  ! 2975: FDIVd	fdivd	%f48, %f0, %f24
T1_asi_reg_rd_140:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 2977: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_245:
	setx	0x340217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_139:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2982: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a80420  ! 2984: FMOVRZ	dis not found

T1_asi_reg_rd_141:
	mov	0x14, %r14
	.word 0xfedb8400  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3a80820  ! 2989: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7a44920  ! 2990: FMULs	fmuls	%f17, %f0, %f27
	.word 0xb93db001  ! 2992: SRAX_I	srax	%r22, 0x0001, %r28
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 10)
	.word 0xbda00520  ! 2996: FSQRTs	fsqrt	
cpu_intr_1_246:
	setx	0x34031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb52ca001  ! 3002: SLL_I	sll 	%r18, 0x0001, %r26
T1_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbd357001  ! 3007: SRLX_I	srlx	%r21, 0x0001, %r30
T1_asi_reg_rd_143:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 3008: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3a489a0  ! 3010: FDIVs	fdivs	%f18, %f0, %f25
cpu_intr_1_247:
	setx	0x350125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_144:
	mov	0x1, %r14
	.word 0xfadb8e60  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfab8820  ! 3016: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x8994e0a9  ! 3017: WRPR_TICK_I	wrpr	%r19, 0x00a9, %tick
	.word 0xbd643801  ! 3020: MOVcc_I	<illegal instruction>
cpu_intr_1_248:
	setx	0x340122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_249:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58820  ! 3033: FADDs	fadds	%f22, %f0, %f29
T1_asi_reg_wr_140:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 3034: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc1dc000  ! 3035: XOR_R	xor 	%r23, %r0, %r30
	.word 0xb1a40820  ! 3036: FADDs	fadds	%f16, %f0, %f24
	.word 0xbba80c20  ! 3037: FMOVRLZ	dis not found

cpu_intr_1_250:
	setx	0x35001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x29, %r14
	.word 0xf2f38400  ! 3042: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_251:
	setx	0x360338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 3045: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbda58820  ! 3048: FADDs	fadds	%f22, %f0, %f30
	.word 0xbfa408e0  ! 3051: FSUBq	dis not found

	.word 0xbfa84820  ! 3054: FMOVE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_142:
	mov	0x11, %r14
	.word 0xf6f38400  ! 3057: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_143:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 3063: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_252:
	setx	0x370307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3066: FMOVRZ	dis not found

cpu_intr_1_253:
	setx	0x370007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_254:
	setx	0x350032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 3072: FMOVRGEZ	dis not found

	.word 0xbfa00540  ! 3074: FSQRTd	fsqrt	
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba84820  ! 3079: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x8194e00d  ! 3082: WRPR_TPC_I	wrpr	%r19, 0x000d, %tpc
T1_asi_reg_wr_144:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3086: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5a509e0  ! 3088: FDIVq	dis not found

	.word 0xb1a88820  ! 3089: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9a509c0  ! 3094: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xb3a489c0  ! 3095: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xbfa90820  ! 3098: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_145:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3100: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_147:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb22ce143  ! 3106: ANDN_I	andn 	%r19, 0x0143, %r25
T1_asi_reg_wr_145:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 3108: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_255:
	setx	0x370210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_256:
	setx	0x34030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5aa8820  ! 3119: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_146:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3120: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda88820  ! 3131: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbe8cc000  ! 3132: ANDcc_R	andcc 	%r19, %r0, %r31
cpu_intr_1_257:
	setx	0x350218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3135: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, d)
	.word 0xb60cc000  ! 3138: AND_R	and 	%r19, %r0, %r27
cpu_intr_1_258:
	setx	0x340339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3143: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_259:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 3146: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_148:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a98820  ! 3151: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_148:
	mov	0x37, %r14
	.word 0xfef384a0  ! 3153: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbdab0820  ! 3155: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_149:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 3158: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_150:
	mov	0x28, %r14
	.word 0xfef38e60  ! 3159: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbb3dd000  ! 3160: SRAX_R	srax	%r23, %r0, %r29
	.word 0xbba84820  ! 3161: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_260:
	setx	0x350322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 35)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb82ce18a  ! 3167: ANDN_I	andn 	%r19, 0x018a, %r28
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 30)
	.word 0xbe354000  ! 3172: ORN_R	orn 	%r21, %r0, %r31
cpu_intr_1_261:
	setx	0x380034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_151:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 3175: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_262:
	setx	0x380236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_263:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_264:
	setx	0x3b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba340000  ! 3188: SUBC_R	orn 	%r16, %r0, %r29
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_149:
	mov	0xd, %r14
	.word 0xfedb8400  ! 3193: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa589a0  ! 3198: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xbba54840  ! 3199: FADDd	faddd	%f52, %f0, %f60
cpu_intr_1_265:
	setx	0x3b0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58840  ! 3204: FADDd	faddd	%f22, %f0, %f26
T1_asi_reg_wr_152:
	mov	0x7, %r14
	.word 0xf8f389e0  ! 3205: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_150:
	mov	0x2d, %r14
	.word 0xfcdb8e60  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_153:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 3214: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_266:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_154:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 3217: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a449a0  ! 3219: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xbfa548e0  ! 3222: FSUBq	dis not found

	.word 0xba8d8000  ! 3228: ANDcc_R	andcc 	%r22, %r0, %r29
	.word 0xbabd4000  ! 3230: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xbc3c610a  ! 3231: XNOR_I	xnor 	%r17, 0x010a, %r30
	.word 0xb3ab4820  ! 3234: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3510000  ! 3238: RDPR_TICK	<illegal instruction>
	.word 0xbba548a0  ! 3240: FSUBs	fsubs	%f21, %f0, %f29
T1_asi_reg_rd_151:
	mov	0x24, %r14
	.word 0xfedb8e80  ! 3245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7a80820  ! 3249: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_152:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_153:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbba80820  ! 3256: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb9a8c820  ! 3259: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_155:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 3267: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_154:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa58860  ! 3270: FADDq	dis not found

T1_asi_reg_rd_155:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 3273: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_267:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x38002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_269:
	setx	0x39031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 3287: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_270:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_156:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda00540  ! 3290: FSQRTd	fsqrt	
	.word 0xb7a5c860  ! 3292: FADDq	dis not found

	.word 0xb1a9c820  ! 3293: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 13)
	.word 0xb77c4400  ! 3301: MOVR_R	movre	%r17, %r0, %r27
cpu_intr_1_271:
	setx	0x3a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 0)
	.word 0xb17cc400  ! 3304: MOVR_R	movre	%r19, %r0, %r24
	.word 0xbc150000  ! 3308: OR_R	or 	%r20, %r0, %r30
	.word 0xb5a549e0  ! 3311: FDIVq	dis not found

	.word 0xb3a448a0  ! 3314: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb9aac820  ! 3315: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a54920  ! 3316: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb484a1e4  ! 3318: ADDcc_I	addcc 	%r18, 0x01e4, %r26
	.word 0xb9a509e0  ! 3320: FDIVq	dis not found

	.word 0xb9abc820  ! 3321: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81820  ! 3323: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_272:
	setx	0x380107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d4000  ! 3326: XNOR_R	xnor 	%r21, %r0, %r29
T1_asi_reg_rd_157:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 3328: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_156:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 3330: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_158:
	mov	0x2, %r14
	.word 0xfadb89e0  ! 3333: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba508a0  ! 3343: FSUBs	fsubs	%f20, %f0, %f29
T1_asi_reg_rd_159:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_157:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3346: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_273:
	setx	0x390125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_274:
	setx	0x39010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x380133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 3354: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_160:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_276:
	setx	0x380319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a44860  ! 3361: FADDq	dis not found

cpu_intr_1_277:
	setx	0x3a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_161:
	mov	0x1, %r14
	.word 0xf4db8400  ! 3366: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, d)
	.word 0xbda81420  ! 3368: FMOVRNZ	dis not found

	.word 0xba3c4000  ! 3369: XNOR_R	xnor 	%r17, %r0, %r29
cpu_intr_1_278:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_279:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8460c8  ! 3375: ADDcc_I	addcc 	%r17, 0x00c8, %r29
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a488e0  ! 3377: FSUBq	dis not found

	.word 0xb7ab8820  ! 3379: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba5c9c0  ! 3381: FDIVd	fdivd	%f54, %f0, %f60
T1_asi_reg_rd_162:
	mov	0x1b, %r14
	.word 0xfcdb84a0  ! 3383: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_280:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x39003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 3389: FMULs	fmuls	%f21, %f0, %f31
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a48840  ! 3396: FADDd	faddd	%f18, %f0, %f56
	.word 0xbfa44920  ! 3398: FMULs	fmuls	%f17, %f0, %f31
cpu_intr_1_282:
	setx	0x3b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 3400: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3402: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_159:
	mov	0x10, %r14
	.word 0xfcf389e0  ! 3404: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_160:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3408: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbda80820  ! 3413: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_283:
	setx	0x3b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_284:
	setx	0x380139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_285:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 3424: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda4c9c0  ! 3425: FDIVd	fdivd	%f50, %f0, %f30
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_164:
	mov	0x28, %r14
	.word 0xf0db8400  ! 3429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_286:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb7a58940  ! 3434: FMULd	fmuld	%f22, %f0, %f58
	.word 0xb3a00540  ! 3436: FSQRTd	fsqrt	
	.word 0xb3a588c0  ! 3437: FSUBd	fsubd	%f22, %f0, %f56
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a84820  ! 3442: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_287:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40920  ! 3445: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb9a81420  ! 3447: FMOVRNZ	dis not found

iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_288:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bca026  ! 3457: XNORcc_I	xnorcc 	%r18, 0x0026, %r24
cpu_intr_1_289:
	setx	0x39003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_290:
	setx	0x3b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 3461: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a40840  ! 3462: FADDd	faddd	%f16, %f0, %f58
cpu_intr_1_291:
	setx	0x3b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_292:
	setx	0x39002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a98820  ! 3473: FMOVNEG	fmovs	%fcc1, %f0, %f28
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a00520  ! 3477: FSQRTs	fsqrt	
	.word 0xb7a80820  ! 3479: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00540  ! 3484: FSQRTd	fsqrt	
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_161:
	mov	0x25, %r14
	.word 0xfef38e60  ! 3488: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_293:
	setx	0x3b0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad0000  ! 3495: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb5a84820  ! 3496: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_162:
	mov	0x33, %r14
	.word 0xfef384a0  ! 3505: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9a54840  ! 3506: FADDd	faddd	%f52, %f0, %f28
cpu_intr_1_294:
	setx	0x3b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 3509: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xba9c2157  ! 3510: XORcc_I	xorcc 	%r16, 0x0157, %r29
cpu_intr_1_295:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00d0000  ! 3515: AND_R	and 	%r20, %r0, %r24
T1_asi_reg_wr_163:
	mov	0x6, %r14
	.word 0xfef38e40  ! 3516: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd510000  ! 3517: RDPR_TICK	<illegal instruction>
T1_asi_reg_rd_165:
	mov	0xa, %r14
	.word 0xf8db84a0  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5aa8820  ! 3520: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48920  ! 3524: FMULs	fmuls	%f18, %f0, %f27
cpu_intr_1_296:
	setx	0x390303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40960  ! 3526: FMULq	dis not found

	.word 0xb3a88820  ! 3528: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_297:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 3530: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a44860  ! 3532: FADDq	dis not found

	.word 0xb3a408c0  ! 3535: FSUBd	fsubd	%f16, %f0, %f56
T1_asi_reg_wr_164:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 3536: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_298:
	setx	0x3b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_165:
	mov	0x4, %r14
	.word 0xf4f38e80  ! 3540: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_166:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 3542: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda4c920  ! 3543: FMULs	fmuls	%f19, %f0, %f30
T1_asi_reg_wr_166:
	mov	0x36, %r14
	.word 0xf6f38400  ! 3545: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb8bdc000  ! 3546: XNORcc_R	xnorcc 	%r23, %r0, %r28
T1_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_299:
	setx	0x390129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_167:
	mov	0x1d, %r14
	.word 0xfcf38e60  ! 3549: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_168:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9a58860  ! 3551: FADDq	dis not found

cpu_intr_1_300:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x39021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_302:
	setx	0x380100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 3559: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbfa589c0  ! 3560: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbdab4820  ! 3561: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbda54920  ! 3562: FMULs	fmuls	%f21, %f0, %f30
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_303:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda4c9a0  ! 3572: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbba44960  ! 3574: FMULq	dis not found

cpu_intr_1_304:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 3580: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbdaa4820  ! 3581: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7aa8820  ! 3582: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_170:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 3585: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a88820  ! 3588: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_305:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_169:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb5a80c20  ! 3602: FMOVRLZ	dis not found

cpu_intr_1_306:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_307:
	setx	0x390028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_308:
	setx	0x3b000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, c)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_171:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 3612: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfa509e0  ! 3614: FDIVq	dis not found

cpu_intr_1_309:
	setx	0x380020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3620: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x9194a142  ! 3622: WRPR_PIL_I	wrpr	%r18, 0x0142, %pil
	.word 0xbbaa8820  ! 3623: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_310:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 3626: FSQRTq	fsqrt	
cpu_intr_1_311:
	setx	0x3031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d8000  ! 3633: XNOR_R	xnor 	%r22, %r0, %r27
T1_asi_reg_rd_171:
	mov	0xe, %r14
	.word 0xf8db89e0  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9abc820  ! 3637: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb92d1000  ! 3640: SLLX_R	sllx	%r20, %r0, %r28
	.word 0xb1a80c20  ! 3642: FMOVRLZ	dis not found

iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3643801  ! 3647: MOVcc_I	<illegal instruction>
	.word 0xb9a00020  ! 3648: FMOVs	fmovs	%f0, %f28
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, c)
	.word 0xb9359000  ! 3650: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xb3a509a0  ! 3651: FDIVs	fdivs	%f20, %f0, %f25
T1_asi_reg_wr_173:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 3654: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a00020  ! 3657: FMOVs	fmovs	%f0, %f26
	.word 0xb08de0ca  ! 3659: ANDcc_I	andcc 	%r23, 0x00ca, %r24
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 17)
	.word 0xbf2c8000  ! 3662: SLL_R	sll 	%r18, %r0, %r31
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_172:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 3666: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_312:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_313:
	setx	0x3d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x3c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3682: FSQRTd	fsqrt	
	.word 0xbe352113  ! 3684: ORN_I	orn 	%r20, 0x0113, %r31
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 33)
	.word 0xbe8d60cc  ! 3689: ANDcc_I	andcc 	%r21, 0x00cc, %r31
	.word 0xb824c000  ! 3690: SUB_R	sub 	%r19, %r0, %r28
	.word 0xbfa00520  ! 3691: FSQRTs	fsqrt	
T1_asi_reg_rd_173:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 3694: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_316:
	setx	0x3c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3698: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_317:
	setx	0x3f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58840  ! 3705: FADDd	faddd	%f22, %f0, %f28
cpu_intr_1_318:
	setx	0x3e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_319:
	setx	0x3d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x7, %r14
	.word 0xf2f38e60  ! 3710: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_320:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_174:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_175:
	mov	0x2d, %r14
	.word 0xfadb8e80  ! 3719: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_175:
	mov	0x31, %r14
	.word 0xf6f38400  ! 3720: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_321:
	setx	0x3e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a449a0  ! 3731: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xbda54920  ! 3733: FMULs	fmuls	%f21, %f0, %f30
	.word 0xbda5c9a0  ! 3735: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb1ab8820  ! 3736: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a44860  ! 3739: FADDq	dis not found

iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a4c820  ! 3745: FADDs	fadds	%f19, %f0, %f24
	.word 0xbfa8c820  ! 3746: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a48920  ! 3747: FMULs	fmuls	%f18, %f0, %f27
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_176:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbab8820  ! 3750: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_322:
	setx	0x3c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa84820  ! 3754: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_177:
	mov	0x2b, %r14
	.word 0xfadb8e60  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbda00560  ! 3759: FSQRTq	fsqrt	
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a90820  ! 3765: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbda589a0  ! 3767: FDIVs	fdivs	%f22, %f0, %f30
cpu_intr_1_323:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_324:
	setx	0x3d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_176:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 3776: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_325:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 3779: FMOVd	fmovd	%f0, %f30
	.word 0xbf7c8400  ! 3782: MOVR_R	movre	%r18, %r0, %r31
T1_asi_reg_wr_177:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 3785: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_326:
	setx	0x3e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 3790: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 20)
	.word 0xbdab0820  ! 3794: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_327:
	setx	0x3c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x3d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_178:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_329:
	setx	0x3e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_179:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 3805: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a94820  ! 3808: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_330:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 3813: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a88820  ! 3814: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda94820  ! 3817: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a88820  ! 3818: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa84820  ! 3820: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, f)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, b)
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb1a00560  ! 3826: FSQRTq	fsqrt	
T1_asi_reg_wr_178:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 3827: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9a90820  ! 3832: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_331:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 3836: FMOVd	fmovd	%f0, %f26
	.word 0xb1a54940  ! 3838: FMULd	fmuld	%f52, %f0, %f24
	.word 0xb2358000  ! 3839: ORN_R	orn 	%r22, %r0, %r25
	.word 0xb7a80420  ! 3840: FMOVRZ	dis not found

	.word 0xbfa81c20  ! 3844: FMOVRGEZ	dis not found

	.word 0xb7a00020  ! 3846: FMOVs	fmovs	%f0, %f27
cpu_intr_1_332:
	setx	0x3d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488e0  ! 3853: FSUBq	dis not found

T1_asi_reg_wr_179:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 3854: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a9c820  ! 3858: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a409a0  ! 3859: FDIVs	fdivs	%f16, %f0, %f26
T1_asi_reg_wr_180:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 3860: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_181:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbaa4820  ! 3866: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbda81820  ! 3868: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5abc820  ! 3870: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a9c820  ! 3873: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a8c820  ! 3874: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_333:
	setx	0x3d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba4c920  ! 3884: FMULs	fmuls	%f19, %f0, %f29
	.word 0xba358000  ! 3888: ORN_R	orn 	%r22, %r0, %r29
T1_asi_reg_rd_182:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb09c0000  ! 3892: XORcc_R	xorcc 	%r16, %r0, %r24
cpu_intr_1_334:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_335:
	setx	0x3f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 3912: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb1a48960  ! 3916: FMULq	dis not found

	.word 0xbe24a1f1  ! 3917: SUB_I	sub 	%r18, 0x01f1, %r31
	.word 0xb1a81820  ! 3919: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a48960  ! 3920: FMULq	dis not found

iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_181:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 3922: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_336:
	setx	0x3c011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_337:
	setx	0x3c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_338:
	setx	0x3f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80820  ! 3941: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_182:
	mov	0x1a, %r14
	.word 0xf4f384a0  ! 3944: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3a9c820  ! 3946: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda80820  ! 3948: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_183:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3aa0820  ! 3955: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_184:
	mov	0x5, %r14
	.word 0xf0db89e0  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7a58940  ! 3962: FMULd	fmuld	%f22, %f0, %f58
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba44840  ! 3964: FADDd	faddd	%f48, %f0, %f60
	.word 0xb3a81c20  ! 3966: FMOVRGEZ	dis not found

	.word 0xb9a98820  ! 3968: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00560  ! 3970: FSQRTq	fsqrt	
cpu_intr_1_340:
	setx	0x3f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_183:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 3976: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb6c52065  ! 3981: ADDCcc_I	addccc 	%r20, 0x0065, %r27
	.word 0xbda4c960  ! 3983: FMULq	dis not found

	.word 0xbea58000  ! 3984: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xbfa489a0  ! 3987: FDIVs	fdivs	%f18, %f0, %f31
T1_asi_reg_rd_185:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_341:
	setx	0x10026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb345000  ! 3992: SRLX_R	srlx	%r17, %r0, %r29
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba00520  ! 3995: FSQRTs	fsqrt	
T1_asi_reg_wr_184:
	mov	0xe, %r14
	.word 0xf6f38400  ! 3999: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a588a0  ! 4000: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xbda509a0  ! 4001: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbab5607f  ! 4003: ORNcc_I	orncc 	%r21, 0x007f, %r29
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a54960  ! 4011: FMULq	dis not found

iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_342:
	setx	0x3d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x3e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 4021: FSQRTd	fsqrt	
	.word 0xb1aa8820  ! 4022: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_344:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488c0  ! 4025: FSUBd	fsubd	%f18, %f0, %f56
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 4028: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 26)
	.word 0xbda9c820  ! 4036: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_345:
	setx	0x3e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_186:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 4040: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1a88820  ! 4041: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00560  ! 4042: FSQRTq	fsqrt	
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 2e)
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_346:
	setx	0x3f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4049: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_347:
	setx	0x3f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_187:
	mov	0x21, %r14
	.word 0xf2f38400  ! 4055: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5aa0820  ! 4056: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80420  ! 4058: FMOVRZ	dis not found

T1_asi_reg_rd_187:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4060: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, c)
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_188:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_188:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 4069: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a4c8a0  ! 4072: FSUBs	fsubs	%f19, %f0, %f24
cpu_intr_1_348:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 4077: FMOVRNZ	dis not found

iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_349:
	setx	0x3c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x3c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d2401  ! 4081: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xb73d0000  ! 4082: SRA_R	sra 	%r20, %r0, %r27
	.word 0xb7a589c0  ! 4084: FDIVd	fdivd	%f22, %f0, %f58
T1_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 4092: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 4095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_351:
	setx	0x41021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 4097: FMOVRNZ	dis not found

	.word 0xbfa409a0  ! 4098: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb3354000  ! 4099: SRL_R	srl 	%r21, %r0, %r25
	.word 0xbba80820  ! 4100: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a489e0  ! 4103: FDIVq	dis not found

	.word 0xbba81c20  ! 4104: FMOVRGEZ	dis not found

iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9508000  ! 4117: RDPR_TSTATE	<illegal instruction>
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb8046041  ! 4123: ADD_I	add 	%r17, 0x0041, %r28
	.word 0xb1518000  ! 4124: RDPR_PSTATE	<illegal instruction>
	.word 0xb23ce1a2  ! 4125: XNOR_I	xnor 	%r19, 0x01a2, %r25
	.word 0xb4bc4000  ! 4126: XNORcc_R	xnorcc 	%r17, %r0, %r26
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba408a0  ! 4130: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xbc248000  ! 4133: SUB_R	sub 	%r18, %r0, %r30
cpu_intr_1_352:
	setx	0x430008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_190:
	mov	0x3, %r14
	.word 0xf6f38400  ! 4135: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5aa0820  ! 4139: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_191:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 4140: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_353:
	setx	0x430003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2db001  ! 4146: SLLX_I	sllx	%r22, 0x0001, %r30
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_190:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a588a0  ! 4171: FSUBs	fsubs	%f22, %f0, %f28
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa81420  ! 4176: FMOVRNZ	dis not found

	.word 0xb5aa8820  ! 4177: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba50960  ! 4178: FMULq	dis not found

	.word 0xb3abc820  ! 4179: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c960  ! 4180: FMULq	dis not found

	.word 0xb5a448e0  ! 4184: FSUBq	dis not found

	.word 0xbba00520  ! 4186: FSQRTs	fsqrt	
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba00520  ! 4188: FSQRTs	fsqrt	
T1_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 4189: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_193:
	mov	0x22, %r14
	.word 0xf4f38400  ! 4191: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb3a00540  ! 4193: FSQRTd	fsqrt	
	.word 0xb3a84820  ! 4194: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbb3dd000  ! 4195: SRAX_R	srax	%r23, %r0, %r29
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_354:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d3001  ! 4204: SLLX_I	sllx	%r20, 0x0001, %r26
T1_asi_reg_rd_191:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 4205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_194:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 4208: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9aa0820  ! 4209: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_195:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 4210: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_192:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba44960  ! 4215: FMULq	dis not found

	.word 0xb7a488e0  ! 4217: FSUBq	dis not found

	.word 0xb9a54960  ! 4218: FMULq	dis not found

cpu_intr_1_355:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_193:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 4225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5a00560  ! 4226: FSQRTq	fsqrt	
cpu_intr_1_356:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_357:
	setx	0x410326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_358:
	setx	0x410235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba458000  ! 4236: ADDC_R	addc 	%r22, %r0, %r29
cpu_intr_1_359:
	setx	0x42023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b521ef  ! 4239: ORNcc_I	orncc 	%r20, 0x01ef, %r24
	.word 0xbba40820  ! 4240: FADDs	fadds	%f16, %f0, %f29
T1_asi_reg_wr_196:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 4246: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_360:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x40000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_362:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 4258: FMOVRZ	dis not found

T1_asi_reg_wr_197:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 4260: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda8c820  ! 4266: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_194:
	mov	0x1d, %r14
	.word 0xf8db89e0  ! 4268: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbfa00560  ! 4269: FSQRTq	fsqrt	
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a98820  ! 4271: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_195:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbda5c920  ! 4273: FMULs	fmuls	%f23, %f0, %f30
cpu_intr_1_363:
	setx	0x420016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 4279: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb13dc000  ! 4280: SRA_R	sra 	%r23, %r0, %r24
	.word 0xbda8c820  ! 4281: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00540  ! 4282: FSQRTd	fsqrt	
T1_asi_reg_rd_196:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_197:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_198:
	mov	0xe, %r14
	.word 0xf2f389e0  ! 4289: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5a488c0  ! 4294: FSUBd	fsubd	%f18, %f0, %f26
cpu_intr_1_364:
	setx	0x42032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a521ec  ! 4296: SUBcc_I	subcc 	%r20, 0x01ec, %r26
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a00040  ! 4304: FMOVd	fmovd	%f0, %f24
	.word 0xbfa409a0  ! 4305: FDIVs	fdivs	%f16, %f0, %f31
cpu_intr_1_365:
	setx	0x41013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda88820  ! 4310: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbba4c840  ! 4311: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a5c8a0  ! 4313: FSUBs	fsubs	%f23, %f0, %f25
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7abc820  ! 4319: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab8820  ! 4320: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_366:
	setx	0x1012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_367:
	setx	0x410200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a508e0  ! 4325: FSUBq	dis not found

	.word 0xb1a80820  ! 4326: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_198:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 4327: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_368:
	setx	0x410310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 4331: FMOVRZ	dis not found

cpu_intr_1_369:
	setx	0x430013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 4335: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_370:
	setx	0x420324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97dc400  ! 4339: MOVR_R	movre	%r23, %r0, %r28
	.word 0xb7a508c0  ! 4340: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb68d8000  ! 4341: ANDcc_R	andcc 	%r22, %r0, %r27
cpu_intr_1_371:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_200:
	mov	0x31, %r14
	.word 0xf6db8400  ! 4346: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_199:
	mov	0x1e, %r14
	.word 0xf0f384a0  ! 4347: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_200:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 4348: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_201:
	mov	0x35, %r14
	.word 0xfef389e0  ! 4349: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_372:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_373:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_201:
	mov	0x5, %r14
	.word 0xfadb8e80  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0x8195e1d7  ! 4359: WRPR_TPC_I	wrpr	%r23, 0x01d7, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a00540  ! 4368: FSQRTd	fsqrt	
T1_asi_reg_rd_202:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbda00520  ! 4373: FSQRTs	fsqrt	
cpu_intr_1_374:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_203:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_202:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 4377: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_375:
	setx	0x430215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_376:
	setx	0x420337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4384: FSQRTd	fsqrt	
T1_asi_reg_wr_203:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 4387: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_204:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_204:
	mov	0x28, %r14
	.word 0xfcf38400  ! 4391: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5aac820  ! 4392: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c920  ! 4399: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_wr_205:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 4402: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_205:
	mov	0x2d, %r14
	.word 0xf6db89e0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7aa8820  ! 4405: FMOVG	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_377:
	setx	0x40030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_378:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_379:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, c)
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9a94820  ! 4427: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_380:
	setx	0x410132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 21)
	.word 0xb80cc000  ! 4433: AND_R	and 	%r19, %r0, %r28
cpu_intr_1_381:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3ab4820  ! 4443: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_206:
	mov	0x3, %r14
	.word 0xfef38400  ! 4445: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7ab4820  ! 4449: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 4453: FSQRTs	fsqrt	
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a98820  ! 4458: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbda448e0  ! 4460: FSUBq	dis not found

cpu_intr_1_382:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548c0  ! 4466: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb0458000  ! 4468: ADDC_R	addc 	%r22, %r0, %r24
	.word 0xb08da173  ! 4470: ANDcc_I	andcc 	%r22, 0x0173, %r24
cpu_intr_1_383:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c4400  ! 4472: MOVR_R	movre	%r17, %r0, %r24
cpu_intr_1_384:
	setx	0x40023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_385:
	setx	0x430032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_386:
	setx	0x40021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48960  ! 4479: FMULq	dis not found

	.word 0xbfa508e0  ! 4480: FSUBq	dis not found

	.word 0xbbab4820  ! 4481: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c9a0  ! 4483: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb57dc400  ! 4484: MOVR_R	movre	%r23, %r0, %r26
	.word 0xb4a5a1ee  ! 4488: SUBcc_I	subcc 	%r22, 0x01ee, %r26
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa80c20  ! 4490: FMOVRLZ	dis not found

	.word 0xb9a80820  ! 4491: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1a8c820  ! 4492: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_207:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 4493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_387:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_388:
	setx	0x420100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4498: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_389:
	setx	0x400133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_390:
	setx	0x42010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c9e0  ! 4507: FDIVq	dis not found

iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa00560  ! 4514: FSQRTq	fsqrt	
T1_asi_reg_rd_208:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbba98820  ! 4517: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_207:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 4521: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_208:
	mov	0xe, %r14
	.word 0xfaf389e0  ! 4523: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_209:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 4525: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_209:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 4532: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a549e0  ! 4535: FDIVq	dis not found

	.word 0xb3a81820  ! 4537: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_wr_210:
	mov	0x1f, %r14
	.word 0xf4f38400  ! 4542: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a00520  ! 4544: FSQRTs	fsqrt	
cpu_intr_1_391:
	setx	0x400022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_210:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_392:
	setx	0x430338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_211:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 4551: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_393:
	setx	0x46000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_212:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 4557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3a81420  ! 4559: FMOVRNZ	dis not found

	.word 0xb5a40840  ! 4562: FADDd	faddd	%f16, %f0, %f26
T1_asi_reg_wr_211:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 4564: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a58860  ! 4565: FADDq	dis not found

iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_394:
	setx	0x470005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8a0  ! 4571: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb73ce001  ! 4577: SRA_I	sra 	%r19, 0x0001, %r27
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a5c820  ! 4586: FADDs	fadds	%f23, %f0, %f25
T1_asi_reg_rd_213:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 4587: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfa4c9e0  ! 4590: FDIVq	dis not found

	.word 0xb7a489c0  ! 4591: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb7a40920  ! 4592: FMULs	fmuls	%f16, %f0, %f27
cpu_intr_1_395:
	setx	0x440012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd34c000  ! 4597: SRL_R	srl 	%r19, %r0, %r30
	.word 0xbcbcc000  ! 4598: XNORcc_R	xnorcc 	%r19, %r0, %r30
cpu_intr_1_396:
	setx	0x440118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_397:
	setx	0x450028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_212:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 4618: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb08c2186  ! 4619: ANDcc_I	andcc 	%r16, 0x0186, %r24
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a9c820  ! 4621: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x879520e6  ! 4623: WRPR_TT_I	wrpr	%r20, 0x00e6, %tt
cpu_intr_1_398:
	setx	0x47033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_214:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfa48860  ! 4631: FADDq	dis not found

T1_asi_reg_rd_215:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb0bc4000  ! 4634: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xbcb5c000  ! 4635: SUBCcc_R	orncc 	%r23, %r0, %r30
cpu_intr_1_399:
	setx	0x440230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_216:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_400:
	setx	0x470014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a00020  ! 4650: FMOVs	fmovs	%f0, %f24
	.word 0xb7aac820  ! 4654: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_401:
	setx	0x470021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 4656: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a9c820  ! 4657: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa4c960  ! 4658: FMULq	dis not found

iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_217:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_218:
	mov	0x1, %r14
	.word 0xfadb8400  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7aa0820  ! 4663: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1a508a0  ! 4664: FSUBs	fsubs	%f20, %f0, %f24
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 2e)
	.word 0x8f902001  ! 4666: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T1_asi_reg_rd_219:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb57ca401  ! 4669: MOVR_I	movre	%r18, 0x1, %r26
T1_asi_reg_rd_220:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_213:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 4672: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbbaa4820  ! 4673: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_402:
	setx	0x47031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c0000  ! 4683: AND_R	and 	%r16, %r0, %r30
	.word 0x8d94e11b  ! 4684: WRPR_PSTATE_I	wrpr	%r19, 0x011b, %pstate
	.word 0xb1aa8820  ! 4689: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_403:
	setx	0x460108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5c000  ! 4699: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xb7510000  ! 4700: RDPR_TICK	<illegal instruction>
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbba4c9e0  ! 4711: FDIVq	dis not found

	.word 0xbe85e0ff  ! 4712: ADDcc_I	addcc 	%r23, 0x00ff, %r31
	.word 0xbda54840  ! 4716: FADDd	faddd	%f52, %f0, %f30
	.word 0xbda488c0  ! 4718: FSUBd	fsubd	%f18, %f0, %f30
cpu_intr_1_404:
	setx	0x450310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4723: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb9abc820  ! 4724: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda48860  ! 4726: FADDq	dis not found

iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba00020  ! 4728: FMOVs	fmovs	%f0, %f29
	.word 0xb1abc820  ! 4729: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80820  ! 4730: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa4820  ! 4733: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a50840  ! 4737: FADDd	faddd	%f20, %f0, %f24
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb9a00520  ! 4741: FSQRTs	fsqrt	
	.word 0xb334e001  ! 4742: SRL_I	srl 	%r19, 0x0001, %r25
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa48940  ! 4750: FMULd	fmuld	%f18, %f0, %f62
T1_asi_reg_rd_221:
	mov	0x20, %r14
	.word 0xf4db89e0  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9a81c20  ! 4754: FMOVRGEZ	dis not found

	.word 0xb1a54960  ! 4756: FMULq	dis not found

	.word 0xb3ab4820  ! 4757: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_222:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_405:
	setx	0x460323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 4764: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5353001  ! 4765: SRLX_I	srlx	%r20, 0x0001, %r26
T1_asi_reg_rd_223:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a00520  ! 4769: FSQRTs	fsqrt	
	.word 0xb7a00560  ! 4770: FSQRTq	fsqrt	
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7abc820  ! 4775: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbba448e0  ! 4778: FSUBq	dis not found

iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 26)
	.word 0xb3a4c9c0  ! 4781: FDIVd	fdivd	%f50, %f0, %f56
cpu_intr_1_406:
	setx	0x450215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a449e0  ! 4787: FDIVq	dis not found

iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 10)
	.word 0xbdab8820  ! 4791: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 13)
	.word 0xbd3d1000  ! 4794: SRAX_R	srax	%r20, %r0, %r30
	.word 0xb9520000  ! 4795: RDPR_PIL	<illegal instruction>
	.word 0xb3a00520  ! 4796: FSQRTs	fsqrt	
T1_asi_reg_wr_214:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 4800: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba58960  ! 4801: FMULq	dis not found

	.word 0xba8d214a  ! 4802: ANDcc_I	andcc 	%r20, 0x014a, %r29
	.word 0xb3a00540  ! 4803: FSQRTd	fsqrt	
T1_asi_reg_rd_224:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 4804: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_407:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 4811: FSQRTq	fsqrt	
	.word 0xb9a44920  ! 4813: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb9aa8820  ! 4814: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbda40840  ! 4815: FADDd	faddd	%f16, %f0, %f30
cpu_intr_1_408:
	setx	0x470005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_215:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 4820: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a90820  ! 4821: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_216:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 4823: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_409:
	setx	0x460316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_410:
	setx	0x440302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 4831: FMOVRGEZ	dis not found

	.word 0xb335a001  ! 4832: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xb3a408c0  ! 4833: FSUBd	fsubd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba4c8c0  ! 4835: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbd2d4000  ! 4839: SLL_R	sll 	%r21, %r0, %r30
	.word 0xb7aa0820  ! 4841: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_411:
	setx	0x30331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_217:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 4847: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbaac820  ! 4850: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00520  ! 4851: FSQRTs	fsqrt	
cpu_intr_1_412:
	setx	0x46032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 4855: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xba3d2055  ! 4856: XNOR_I	xnor 	%r20, 0x0055, %r29
	.word 0xb5a94820  ! 4857: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a50920  ! 4859: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbfa80c20  ! 4860: FMOVRLZ	dis not found

	.word 0xb5ab0820  ! 4865: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a80820  ! 4869: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a9c820  ! 4872: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_218:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 4873: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba50960  ! 4875: FMULq	dis not found

	.word 0xb1abc820  ! 4876: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_413:
	setx	0x440037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409c0  ! 4879: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xb3a00020  ! 4880: FMOVs	fmovs	%f0, %f25
	.word 0xb1a5c8a0  ! 4881: FSUBs	fsubs	%f23, %f0, %f24
cpu_intr_1_414:
	setx	0x470217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_415:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_416:
	setx	0x470300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 4896: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_417:
	setx	0x47030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_219:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 4898: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_418:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_419:
	setx	0x45023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488a0  ! 4905: FSUBs	fsubs	%f18, %f0, %f29
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_420:
	setx	0x460223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63da027  ! 4916: XNOR_I	xnor 	%r22, 0x0027, %r27
	.word 0xb3a449a0  ! 4921: FDIVs	fdivs	%f17, %f0, %f25
T1_asi_reg_wr_220:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 4922: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb7a589c0  ! 4928: FDIVd	fdivd	%f22, %f0, %f58
T1_asi_reg_wr_221:
	mov	0x11, %r14
	.word 0xf6f384a0  ! 4930: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbeada14d  ! 4932: ANDNcc_I	andncc 	%r22, 0x014d, %r31
T1_asi_reg_rd_225:
	mov	0x34, %r14
	.word 0xf8db84a0  ! 4934: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a00560  ! 4935: FSQRTq	fsqrt	
T1_asi_reg_rd_226:
	mov	0x13, %r14
	.word 0xfadb8e80  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 28)
	.word 0xb2858000  ! 4942: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xbda509e0  ! 4945: FDIVq	dis not found

iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, b)
	.word 0xb7a548c0  ! 4958: FSUBd	fsubd	%f52, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb33d4000  ! 4962: SRA_R	sra 	%r21, %r0, %r25
	.word 0xb9a589e0  ! 4969: FDIVq	dis not found

	.word 0xb7a00560  ! 4970: FSQRTq	fsqrt	
	.word 0xb9a5c940  ! 4974: FMULd	fmuld	%f54, %f0, %f28
cpu_intr_1_421:
	setx	0x440030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50860  ! 4976: FADDq	dis not found

	.word 0xbf3cd000  ! 4982: SRAX_R	srax	%r19, %r0, %r31
	.word 0xb1a54840  ! 4986: FADDd	faddd	%f52, %f0, %f24
cpu_intr_1_422:
	setx	0x46023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 4990: FADDq	dis not found

	.word 0xb1a81c20  ! 4992: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a81420  ! 4997: FMOVRNZ	dis not found

cpu_intr_1_423:
	setx	0x47032e, %g1, %o0
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

	.xword	0xe63d4d36e942df0b
	.xword	0xeb80e4e2a8a8e23c
	.xword	0x0726e4a130ba8278
	.xword	0x050c7b9ecf388745
	.xword	0xf9d9ec75e5feae31
	.xword	0xf1a6a53caa55ce23
	.xword	0x60e7b67b387e531b
	.xword	0x1f1d8673c01fbf48
	.xword	0xef090cd303f5dea3
	.xword	0xba13957378f731ef
	.xword	0xe9054eae80daaa54
	.xword	0xa0bfe7ff8fb11b2a
	.xword	0x80d19748e26c7a34
	.xword	0xd3095e2fb1dd60e4
	.xword	0x57ff122dbe2ede50
	.xword	0x508bf2ee83b9bf14
	.xword	0x6be783909cf6128f
	.xword	0x4e7c31711f160ff7
	.xword	0x481605a200ca836b
	.xword	0x30d54f067576f116
	.xword	0xcd45ab8ba40a62aa
	.xword	0xdfeef4f3c41833ff
	.xword	0x2286d3735a241041
	.xword	0xa1d21a42c9404c5c
	.xword	0x62f13964b5366367
	.xword	0x2cde0f337daf6fd8
	.xword	0x3434352b311d950d
	.xword	0x3bd6a136b8de6df8
	.xword	0xba5550be0d714160
	.xword	0x756e2f9d9651039d
	.xword	0x4735af6ee6a56e9a
	.xword	0xb4d25791e701c483
	.xword	0xa1d38ee840177fb7
	.xword	0x8920579be8f7a695
	.xword	0x2415d0466c4c9f73
	.xword	0x9d2b500adc670fcc
	.xword	0x808a51f2fd586c9e
	.xword	0xbb40a511ae47ad86
	.xword	0x3a219345b7a8b953
	.xword	0x71facd542ea16830
	.xword	0x57cd7dddfec6dd13
	.xword	0xe6346ac9ef171912
	.xword	0xaa5ccdfe7523ae16
	.xword	0x0c1f4bb2e7a5bb9d
	.xword	0x28085258821439bc
	.xword	0x37bb607b4f2984b3
	.xword	0x248f2919a1a3b5b2
	.xword	0xc1474cc48b71d010
	.xword	0x312edc6f55d88f57
	.xword	0xb5fe688efbbf930c
	.xword	0x3dbaeaa542572cd3
	.xword	0x2afc3dea1ddaf6e3
	.xword	0xea57bf6422366bb8
	.xword	0x4fc71746004d80b6
	.xword	0x6b708fd4b645e178
	.xword	0x3b36d5caeafa0e3e
	.xword	0x114db5a3dac0c0e8
	.xword	0x96c4756df0cb3267
	.xword	0x62e50c238d067091
	.xword	0x7cd9be4c928d0c42
	.xword	0x78748cc99f8c5b8c
	.xword	0xad8d99eeef0ea056
	.xword	0xff6d7b1c802b72a7
	.xword	0x161260c875abe12c
	.xword	0xdacf2d8370321865
	.xword	0x740b5c3bf453cfdf
	.xword	0x66cf9804676a12f1
	.xword	0xbe2c4857d8b35300
	.xword	0x06d372043689ebb9
	.xword	0x6a41fd9fcb799a53
	.xword	0x11da9e62133f9cca
	.xword	0xbc0258408f7d27ca
	.xword	0x9228a0ab9eaec291
	.xword	0x37b3a496dcaa9243
	.xword	0x02ec3fef6dcbfb52
	.xword	0x28cbbeac714b651c
	.xword	0x42bb5289023f0264
	.xword	0xd1b34f3bacf2528c
	.xword	0xfb2d867a9326068c
	.xword	0x6a2c343eb8c6ac10
	.xword	0x489c34fa4d4edcde
	.xword	0x973846fd99207801
	.xword	0xbc7541dfd17a6861
	.xword	0xb94c42c5b7f25798
	.xword	0x69109640152d08b2
	.xword	0xb6371f26b581411b
	.xword	0xfcf3d23ba54a6df6
	.xword	0xc49eda38b56681dd
	.xword	0x9f80d3fa89ba1c41
	.xword	0xfefaced0e1d62447
	.xword	0x2cc11e9af6589ec7
	.xword	0xe0f6ced9779d19cc
	.xword	0x7d0728cc6a794e92
	.xword	0x8fe46394274f7614
	.xword	0x002ebacb12fb91be
	.xword	0x88cfba5d651cbf8e
	.xword	0xf918c7df05039eb7
	.xword	0x83ed2d4b2b6803ad
	.xword	0x4f361cbe3e2e67d8
	.xword	0x867aa0bb21c54e62
	.xword	0xbc1de15cd7281c0a
	.xword	0x1b3a37c7590da2b2
	.xword	0x2c90710d3bb06d2f
	.xword	0x5d7b7d1069d22332
	.xword	0xd268e615c96d47b0
	.xword	0x90acee00cbe96d9d
	.xword	0xa563a18ce3f07cee
	.xword	0x64d9dae1682ae5a1
	.xword	0x7c78bd67e26a9ea9
	.xword	0x8c077f5c1e8c6ea1
	.xword	0xc1a83a9da898f1a3
	.xword	0xd8cf4aa90179923f
	.xword	0x271532327ebf5c0d
	.xword	0x48b3bd290c64f860
	.xword	0xc4f002f2089f2ee9
	.xword	0x4e08c2cfa32bcbe8
	.xword	0xe1ea2c28dd2fbb79
	.xword	0x2b84eceef5db8455
	.xword	0x835e398a9bf495da
	.xword	0x97d361f429092635
	.xword	0x8668647ea783fbe3
	.xword	0x375e16719ab45abf
	.xword	0xb2b7fdf1e7484786
	.xword	0xceccf33be6051c9e
	.xword	0x3083dc9fc28c9306
	.xword	0xc43966a2dc211535
	.xword	0x25ec0f1aae3ca420
	.xword	0x92486fda35c641af
	.xword	0x3beaf5ae33a7aeb0
	.xword	0xfce7ee3d10dc5e94
	.xword	0x65411121235b2148
	.xword	0xc46a6b64a83684c8
	.xword	0x2736381d0b51321f
	.xword	0x815c073f61599b92
	.xword	0xec5f625763ed1afb
	.xword	0x55dea4ca7405232f
	.xword	0xe6e6fb1a1c47b9fa
	.xword	0xecc9be25cf79df0c
	.xword	0x6dc449d7e0235797
	.xword	0x055901707bbbb7c5
	.xword	0xb2fc87105c8f87a7
	.xword	0x108cab204e408e9a
	.xword	0xceaa9468ffa1c048
	.xword	0xca0152ff4e633b3b
	.xword	0x2515d3952bd2fde2
	.xword	0x9493e8d8c5648982
	.xword	0x6309d1a592c84cbb
	.xword	0x1f732e333bbd4027
	.xword	0x9912b9f6fecc7258
	.xword	0x1170cc3d30682285
	.xword	0xf25145c4d9c4fe0a
	.xword	0xf0c7cd28f48acee0
	.xword	0xbfec5969dfe1afa4
	.xword	0x0ec0defcb00297a8
	.xword	0x62172083acaa3cbc
	.xword	0xc34e285039d4a963
	.xword	0x4960791829a8b086
	.xword	0x2b4c0646af27b881
	.xword	0x247d4139cfd4435c
	.xword	0x0883d3787830cedd
	.xword	0xb8c39641e31000fe
	.xword	0x6f03105e312d19e9
	.xword	0x9923b2262bcaaa8c
	.xword	0x66ead693cc42ebe5
	.xword	0x6f08194d3ea491c9
	.xword	0xf18328157ac117f1
	.xword	0x4b43955c476d51e6
	.xword	0xe4210ef30778146a
	.xword	0xe6d8e23ab3036033
	.xword	0xd66e7015244b4710
	.xword	0xbfd4f8e341874b70
	.xword	0xf35046db3abac838
	.xword	0x3d53885ed80d2c9f
	.xword	0x2e6ab9eb5410271e
	.xword	0xfd7597647e5729ab
	.xword	0x3ad56ba462107afe
	.xword	0x92224a694184e21b
	.xword	0xd9ff1742df3639f3
	.xword	0x3c8e6ba684325bc7
	.xword	0x8b64361ab3b19299
	.xword	0x54bcd34f51ae225f
	.xword	0x34c893d4047b7f9b
	.xword	0xdc3bb6e5cde152f5
	.xword	0xde5ab7b804fb606a
	.xword	0x41262cadf64f738e
	.xword	0xfd502378803b27a3
	.xword	0x9402fcf77c1532dd
	.xword	0xb7248ebb57c8d395
	.xword	0x52e0ad1a24cb6247
	.xword	0x148113cfa0daac11
	.xword	0xc7e81b233308120e
	.xword	0xf6f4df7afc471509
	.xword	0x02ba6c1f67d92f6f
	.xword	0xb0628ea7b83a9d63
	.xword	0x09f1c44df10080ec
	.xword	0x44e06fb6cb124ba7
	.xword	0xf5fda7054fb14be0
	.xword	0x6b7e0c009d710770
	.xword	0xcc67549481de9278
	.xword	0xc89035090974e153
	.xword	0x6e2e4f23a4dc58fa
	.xword	0xf13469223d266f6c
	.xword	0xaea4932d95720b55
	.xword	0x27a51664ba3d4c6c
	.xword	0xad15cbca325b61e3
	.xword	0x6d927fb215f80249
	.xword	0x9b2da6b3d7b7ef13
	.xword	0x705edca9f2613140
	.xword	0xd64cd094155f02c2
	.xword	0xdcd5ebc278339491
	.xword	0x3357e0691c1d6eda
	.xword	0x1288e596095484fd
	.xword	0x1f7771fb4b9ac1c5
	.xword	0x8fc2637aaa84ed2a
	.xword	0x3d001fb9efea14a6
	.xword	0x1a002747d65d33cb
	.xword	0x80049be3d774e1bf
	.xword	0xe35d132c50e536f1
	.xword	0x0e8e166f042d108e
	.xword	0xcb5e541c18bb7ca5
	.xword	0xf0439c0a1f8a76a3
	.xword	0xd4c3f46089206348
	.xword	0x30ecac03599eb831
	.xword	0xb5ffbfe289165aa6
	.xword	0x41f95701731a4309
	.xword	0x46b0f7b59e74e3b2
	.xword	0x39368e03b529e0c7
	.xword	0xef403d7a3fa91a7e
	.xword	0xf2f6b0da71fda953
	.xword	0xcd427feba1231895
	.xword	0x41a7581617928b62
	.xword	0xb7cd679bdbd0a574
	.xword	0x15437c50ddfb1839
	.xword	0x9ea37750fed6bc7d
	.xword	0x03ed04727ca421f5
	.xword	0x9f0a90d6efa4e450
	.xword	0xe38ece74b769d3f5
	.xword	0x4212a855e7775220
	.xword	0x278b0249a3ed0f86
	.xword	0x6eb1eb47bb17c262
	.xword	0x5612070d3ad7753a
	.xword	0xcc0f196611136bc4
	.xword	0x7bd9bc49dad95600
	.xword	0xc788d7974ca26709
	.xword	0xf47d01db6637197b
	.xword	0x2f1281892022eb35
	.xword	0x404a174419c8132b
	.xword	0x582c2ad33ddc40da
	.xword	0xac1d36f91a48ab04
	.xword	0x4805ebd40acb496b
	.xword	0xcb9d854cf55f0801
	.xword	0xac7fd74735be0274
	.xword	0x61f7db0adf289ffd
	.xword	0x2d538cdfd0840198
	.xword	0x0ee9be170d92ad80
	.xword	0x61a1e96209a93ff8
	.align 0x2000
	.data
data_start_1:

	.xword	0x286dc264d2890cc3
	.xword	0xc225436daec204f9
	.xword	0xdb81d63a853d1ce3
	.xword	0x087c2e61b3d21baf
	.xword	0x9c32bf2038d5636a
	.xword	0x6851824c6f64c3ad
	.xword	0xdb84222c89e26986
	.xword	0xa13dcb8ebf9804e2
	.xword	0x53d417e0491c93aa
	.xword	0x43e1ac0ec25753b1
	.xword	0x3605d830ea4df406
	.xword	0xc669f942cf29cc2d
	.xword	0x4c9fce052fed2090
	.xword	0xbc2cd37356558fd3
	.xword	0x2fd3c34a1d44c779
	.xword	0x93d588d4e38ca99d
	.xword	0x37262e55bf5adc48
	.xword	0x7673305c64097888
	.xword	0x3723d4752e5a6649
	.xword	0xc4157226e65af348
	.xword	0xb294828d2523f9f7
	.xword	0x06c238877947aef3
	.xword	0xbb0dc17970e9d267
	.xword	0x9e06da59835363f4
	.xword	0xc630519dbb6f3619
	.xword	0x2bc2f2c5b53fb533
	.xword	0xa1d9d0d8b327a1bb
	.xword	0x945c7dfd316b774a
	.xword	0x5e827a198143f6c2
	.xword	0x7e458c8085cab8c5
	.xword	0x96f0cdb5a38996fa
	.xword	0x60563b3d00daf099
	.xword	0x253422cdeebd0098
	.xword	0x3ee79ce43ea2dd5b
	.xword	0xf8e77567b2b8b22b
	.xword	0xd6c3c616451b55b8
	.xword	0xc596e157e6481a9a
	.xword	0x5cf0ca8c22b3b908
	.xword	0xc8979b7944660666
	.xword	0xdba66ba9a6963b2a
	.xword	0x795b67ec9fd03d97
	.xword	0x13f29cba565e0d17
	.xword	0xe0eada5f8d3b6192
	.xword	0x775ca88229d74e2f
	.xword	0x5f94b3c989fbc8f5
	.xword	0xc94f23218c53cf22
	.xword	0xd6a11eb17db2330f
	.xword	0x69fb8e76763ed04f
	.xword	0x7146eb975401251c
	.xword	0x6323c6cda5014365
	.xword	0x4a714c030492e48d
	.xword	0x91ba9c9be874eb17
	.xword	0x6d8764f45e690244
	.xword	0x036d2bddb9f2b692
	.xword	0x6dfcddbdc409382c
	.xword	0x59c414bd83119dd8
	.xword	0x578978f0e75e95d7
	.xword	0x77242a650953733d
	.xword	0xc7051bbcefff9d91
	.xword	0x88b9e209903c16b9
	.xword	0x3cf66377bad87c16
	.xword	0xe3bdeb663ecdc9ec
	.xword	0x621b487c2e112086
	.xword	0xde36626d3400fd78
	.xword	0x88652f3528d0a1c7
	.xword	0x630feb4c5be380e7
	.xword	0x618e1b95abd8815a
	.xword	0x8029fe9091c148d0
	.xword	0x2692e127352a848a
	.xword	0xc9a40248c4608ab6
	.xword	0xa44a54f88e1b2960
	.xword	0xa557a3bf9af85336
	.xword	0x36fc6a94e1824deb
	.xword	0xf53b90f3caebd47c
	.xword	0x2c7ba6e0e325bb1c
	.xword	0xd250cb16d73f2eb9
	.xword	0x2d84f1a6cf7c415b
	.xword	0xe72d0e97b20b4be7
	.xword	0xfa2b1ff759f64e97
	.xword	0x3efcedd54f671734
	.xword	0x71b304a52f112ec0
	.xword	0x4a84a19eccfce5c1
	.xword	0xe2c7e8b219835f59
	.xword	0x75a5abb5767dcdd0
	.xword	0xcb18d0ddad5d4705
	.xword	0xa26a4b9782cde6de
	.xword	0x9fa30810ca3f0022
	.xword	0xb5a5a5a5364ff62d
	.xword	0x6285d52218dc4d4d
	.xword	0xbed5acad1b1efe60
	.xword	0xef076c3955e4a78f
	.xword	0xad696424a225ed9f
	.xword	0xfd0eee2a0fbb7763
	.xword	0xe23fad915d041131
	.xword	0xce7c5492f15c1059
	.xword	0xcc7c224fb0a1e95a
	.xword	0x985bbddf5aee7961
	.xword	0x5d9019f783f6fa83
	.xword	0xb67d33a17f8bfd7a
	.xword	0xbdc71a6905fbd1f8
	.xword	0x680bd48079e0a981
	.xword	0x9d3780f851ebeb36
	.xword	0x026ffc917a561318
	.xword	0x51b57611824aa6e5
	.xword	0x8c6cb7f6e7237494
	.xword	0x3c069ee6faa1c059
	.xword	0x39b60f391060ffec
	.xword	0x461e49612ac22003
	.xword	0xba92d16fcd20eaa6
	.xword	0x118f71a8cf9a7349
	.xword	0x8bc9bd333d68379b
	.xword	0x37f4bb08f78c141a
	.xword	0x7f9d4010b60ba835
	.xword	0xcb7e8537bcba31da
	.xword	0x9ecdb1f976bf7760
	.xword	0xcf8a73ec7ebdfbdf
	.xword	0x38a6bdeeeabf399d
	.xword	0xfd21f16fd66c5715
	.xword	0x7ca3955bcdf50710
	.xword	0x9a21facfc8d094fe
	.xword	0x74a41af44884f360
	.xword	0x1e5d2fd5a24af908
	.xword	0xc0d19d5bad53ff30
	.xword	0xea825c8b2dcf4005
	.xword	0xca4343a7e550d555
	.xword	0x2fa7b972164cd330
	.xword	0x82bacef3ab709e94
	.xword	0xccb1fa40a7e47b65
	.xword	0xd7e8572029b63b88
	.xword	0xe76a063f7688a8d0
	.xword	0xb4edcb29cac1c43b
	.xword	0xb99620cc6d849f07
	.xword	0xd42a967d1eb29b79
	.xword	0x313eaa73f4d8ee04
	.xword	0x1bfae83f539cac29
	.xword	0x3d247fbcf46059a1
	.xword	0x1f2723b6b04817f6
	.xword	0xee2817cf340ded96
	.xword	0x254b77ba05321b7a
	.xword	0x3009b7a1897418f9
	.xword	0x6376fc9ee0fb02d9
	.xword	0x9b3258e1e265da30
	.xword	0xe1af025de1f68850
	.xword	0x3b28018c97e57ff4
	.xword	0xa41e0868e0e415c0
	.xword	0x945c65d5bee2eca8
	.xword	0xb0190cd54222b3a1
	.xword	0xb802c7cea052ea1a
	.xword	0xbee3ad2744a199de
	.xword	0xc779ec550b3ac479
	.xword	0x2c7e13ecd87f6aa7
	.xword	0x24b98887149b6613
	.xword	0x59182b364c70a26e
	.xword	0xe4c27c2f4e6f869a
	.xword	0x90674568c9f1e726
	.xword	0x28376442f58130e1
	.xword	0xeb17bd3631169514
	.xword	0x4bbac20b457618e5
	.xword	0x4990f217c9dcc8e8
	.xword	0x2fea31adc53f44dd
	.xword	0x3f81f124ef9c4f61
	.xword	0xa45ba596b6f96322
	.xword	0x41729628e1acacb1
	.xword	0x8157505837b99708
	.xword	0xd5493b807dacea11
	.xword	0xea84a40f6c173249
	.xword	0x7f619dd6b869ee4c
	.xword	0xa52b251ec35ea733
	.xword	0x63d8f63d7b0eac61
	.xword	0x4c03be152677d7b6
	.xword	0x7227fe3be552a6d5
	.xword	0x6d16928bc2802d9a
	.xword	0x492098c179f1a585
	.xword	0x2e37381bef2a10db
	.xword	0x379bbe0985d473ec
	.xword	0x50fee8932f4c2388
	.xword	0x59f612c5ced91559
	.xword	0xc822ff4327076d4e
	.xword	0x95982dcc3bc8af4f
	.xword	0x27b795bbe1d47d9d
	.xword	0x524a9c692fe42429
	.xword	0xd1b9a5af8254f5c3
	.xword	0x8fc650d42962b3aa
	.xword	0x6717ab13a8b1a8b7
	.xword	0xb6167076b2bc2013
	.xword	0x50f734e11f1ac38b
	.xword	0x7b5a2ad2dabf62cd
	.xword	0x758cedcc7e37d256
	.xword	0xe460a3993849bb6e
	.xword	0xcbbed049a7ac6d8c
	.xword	0xafae8cd9e94bebdd
	.xword	0x902bdfd70d6aaca9
	.xword	0xc899242dcfe13cd8
	.xword	0x49eeb0c0b1937396
	.xword	0x23b7cb96f9c1da73
	.xword	0x2810909b15cdebcf
	.xword	0x3975595b62960983
	.xword	0xc909c66b804e2df1
	.xword	0xfe07c891ac9ea700
	.xword	0xa9b42ea8de00d302
	.xword	0x62f79ef5b7b3bc4e
	.xword	0x31175de4788dbd35
	.xword	0xf3eec3939adbe089
	.xword	0x1ba68bb0a2fbd241
	.xword	0x086e28e51822c84d
	.xword	0x7edbc1e24d511f40
	.xword	0xbbb68dd7228b0429
	.xword	0x98166376faf6d8a2
	.xword	0x828795fd6903ae5e
	.xword	0x6f0f17420bd5fd62
	.xword	0xf8961e182aadccbb
	.xword	0x3f2fe067b32af4c6
	.xword	0xfeca67190b235539
	.xword	0x8216ff1ccba6e7b8
	.xword	0xf43229deba989bbe
	.xword	0xce9634ac27b18b3a
	.xword	0x6654d306a2a03931
	.xword	0x4f4ffbe2a3696f60
	.xword	0x7646a9bcba69eda1
	.xword	0xce26e2659f45d3cf
	.xword	0xeaa425b793ce9536
	.xword	0xc1a6d8431935283f
	.xword	0xe19734629515813a
	.xword	0xf8cdb955e4e9f1e3
	.xword	0x37fe0e46e3173edc
	.xword	0xcbc27773279b6bd0
	.xword	0x2284da7122e5af06
	.xword	0x5c42d8689baf190e
	.xword	0x0501cbfb01880d4b
	.xword	0x81c555074d882542
	.xword	0xe5e79323b85bd69e
	.xword	0xb5de1b3cbaea1a96
	.xword	0x1026d914c8157afd
	.xword	0x6adeb8c809f0ae31
	.xword	0x8f00a6c798374ecf
	.xword	0x83a5c9ff47dfefb1
	.xword	0xcea72f16449e029b
	.xword	0xf9c03e150a2a8bfe
	.xword	0xdab573578adf4a79
	.xword	0x4710facec904f596
	.xword	0xa381a47c13232e14
	.xword	0x75a0719ad0b87d6b
	.xword	0x41092cae0b73c148
	.xword	0x85ae1352b88cbe45
	.xword	0xe15133374f900cea
	.xword	0xca242b81ce2f6a99
	.xword	0x9ddefe9fb5d69dd8
	.xword	0x48964319d687c9de
	.xword	0x91b467348c5c0915
	.xword	0xcf570c35e5fcc3d2
	.xword	0x8c0961e1bb4b5014
	.xword	0x29e666c880013036
	.xword	0x603bfe714d00eaac
	.xword	0x099a881d729a3b5a
	.xword	0xc38fb8264427f519
	.xword	0x26de1d657caa264b
	.align 0x4000
	.data
data_start_2:

	.xword	0x00361b01a7d18668
	.xword	0x46180012b46dbec1
	.xword	0x161155c90baec34b
	.xword	0x792f05caa3c5f392
	.xword	0x45a035fc8d5f9c5e
	.xword	0x8cdf6d39759e53e9
	.xword	0x986f3ae92593a86e
	.xword	0x8fa255b79fd8b6cf
	.xword	0xe0afc9878bc257d8
	.xword	0xeee98c487996170d
	.xword	0x0090296f10f85d5d
	.xword	0xd2454e44689a5350
	.xword	0xbad1aca39daf9a4e
	.xword	0x22976b93fef22467
	.xword	0x1a90eb3343b4617c
	.xword	0x90ef2d8d26200ee7
	.xword	0xa2e5b32f418eb347
	.xword	0x7fbdb35a0bf2e0ef
	.xword	0x2c9b3feee75e45cb
	.xword	0x22c60c0063606cb8
	.xword	0x69d842821e3011cb
	.xword	0xd7fb99e3116b6de2
	.xword	0x9a53170aad3f5055
	.xword	0x003b8debd9fc6aa3
	.xword	0xabd0f5235403b94d
	.xword	0x12f13f4666901648
	.xword	0xfa9508075f2c81f4
	.xword	0x42ee4d0ca27bcab9
	.xword	0x5efd44bcaea85dd8
	.xword	0xd5df8f87ad8e6f50
	.xword	0x960801390e2fdff4
	.xword	0xfef0cf18c8d6950f
	.xword	0x64dd6f1d84127bef
	.xword	0x0b8c3e91e7ae3327
	.xword	0xfb4bfa15672279c9
	.xword	0xf853fbc6df727f3e
	.xword	0xa132078a55ebe5f4
	.xword	0x1b5ab2c443abd9d0
	.xword	0x44c1b4b01bb06eb7
	.xword	0x4cb047fe3b815a32
	.xword	0x12721d20a8c47216
	.xword	0x9ee41993ffc018ee
	.xword	0xf9764c531563ddc4
	.xword	0x2d011659340a6186
	.xword	0xacc9b79a4a1cbd81
	.xword	0x74abfcdcf6bffcb4
	.xword	0x78ab27519d27db4c
	.xword	0xb102ac1a4c4126b7
	.xword	0xf652c58399c78b4d
	.xword	0x15e9210a9c63d350
	.xword	0x74e1eeb3f90e37c0
	.xword	0x4e060a62008b493f
	.xword	0xf374f0c6d209e825
	.xword	0x374c92a89c0817be
	.xword	0xd16f214cb43cb56b
	.xword	0xc1241d0cec235ef7
	.xword	0x1f2b316a6813b528
	.xword	0xba5b892237bdfe14
	.xword	0x6fbd57dc764c3e8b
	.xword	0xb296db427d118a91
	.xword	0xc58799789d3676cb
	.xword	0x760db4964cdf7b28
	.xword	0x1182ed471c34443b
	.xword	0xe2edfc7adc661e88
	.xword	0x42514da786e31023
	.xword	0xfa7a85860290f3b1
	.xword	0xabc100422e55b77e
	.xword	0xf2e25b399072702d
	.xword	0x3e669beaa7e86a59
	.xword	0xeff48fe1f85e18e9
	.xword	0xc23b74c9b45f6bfd
	.xword	0xce43ecf4ae7d22ef
	.xword	0x6a021d9f0bc785eb
	.xword	0x4dd28861f3becd02
	.xword	0xc87fba53b3a71386
	.xword	0x549d96743e21224a
	.xword	0x0553eab54bc1adea
	.xword	0x1477a7cd0f2556cb
	.xword	0x1a3aa182d326c289
	.xword	0xf19be2f577129637
	.xword	0x2a8798114814acc9
	.xword	0xc3bf3cacd9f82d2c
	.xword	0xc81843b42123715a
	.xword	0xad3d9cdd6894d231
	.xword	0xf28cd81e6f5cc294
	.xword	0xb4fa45c113cd4608
	.xword	0x99494bca1a67aaea
	.xword	0x4f0315c2e3fd9e57
	.xword	0x694add4158a7dda5
	.xword	0xdbf208ec77719c24
	.xword	0x710c021c8e7ce620
	.xword	0x69eed2ab85e2e871
	.xword	0x110538087d2f0a5f
	.xword	0x17dd07c406835560
	.xword	0x4c555e2437d9e37a
	.xword	0x27c09b12ba4061ff
	.xword	0xb5f782d5b999b954
	.xword	0x7559ca9c768efb53
	.xword	0x1c99fb2570e0ab30
	.xword	0x97ffeeb37684b390
	.xword	0x2672084a2cd53c98
	.xword	0xcc01a7363efe9510
	.xword	0x79dae2bcb5abb8e8
	.xword	0x23c67941ff74da7a
	.xword	0xed0a4ea318ae0bc7
	.xword	0x50aeb0611743ee0c
	.xword	0xf7ceb95fb96cf2ae
	.xword	0x45257b8021315690
	.xword	0x9bb6ac7812dd6f4b
	.xword	0x6c604c4292205048
	.xword	0x254393120d0f77dd
	.xword	0xf783c000c7353ad5
	.xword	0x2939f4107891a6c3
	.xword	0xdb0e629bbd9988df
	.xword	0x3da0688663e7d9b1
	.xword	0x2982edebb34e85dd
	.xword	0xeb6020cead02903c
	.xword	0xb69c4fa1e9977daa
	.xword	0xa2d4c75e65f26d84
	.xword	0x3e11846466b39b1e
	.xword	0x0b6ae2c51a9e801f
	.xword	0xa6b82a47f6d4709e
	.xword	0x2913ce36009dce6c
	.xword	0x4e2e492cc4c443f5
	.xword	0x721ce3a0a70073bb
	.xword	0x84b9c133ce1c4a9f
	.xword	0x9e333989d08f8e5d
	.xword	0xa125811d373b6a53
	.xword	0x319a770d55bea182
	.xword	0x0121f12049d4f76e
	.xword	0xa716913305771960
	.xword	0xf700f181b0991e44
	.xword	0x903c552e23e0059c
	.xword	0xb524bc4c4c5cc769
	.xword	0xb98e07c4aeb87592
	.xword	0x857a2170e8b7177b
	.xword	0xcebe5607daea3415
	.xword	0x36e465e0c2b83704
	.xword	0x7b9112f199cd5e70
	.xword	0x15eadf493a78fcbe
	.xword	0xe2bb7580190f2a26
	.xword	0xe68eaa9f68474846
	.xword	0xef622bb2b2981f92
	.xword	0x9a63b2a95c3e6f4a
	.xword	0x2e3f2f480b8eb441
	.xword	0xe9d7a52f2f5205a2
	.xword	0x40c658dae563f35b
	.xword	0x8d45e4c5ceb13161
	.xword	0xffaa8c37939d99a1
	.xword	0x0b9bee6509da5872
	.xword	0x9861ca281a4cd444
	.xword	0xf9cb45fdefdfe8ec
	.xword	0x72bdf4a6ba66f36d
	.xword	0xaa786b77d2602175
	.xword	0x13ea6d0653662893
	.xword	0xb4c6da0c9567feb5
	.xword	0x6f4d0f601e649b8a
	.xword	0x5d5d94886c491dc1
	.xword	0x9180aa69a01ecc23
	.xword	0x39340e8f262b5c37
	.xword	0x14c8dd2e6777b775
	.xword	0x9d6ca15650a0416c
	.xword	0xcd58fc23bed3e8d6
	.xword	0x672ab77b5a29cbcb
	.xword	0x1bf318d1f2e6cd51
	.xword	0x5096c43a339e378b
	.xword	0x107508b1d3a93631
	.xword	0x5de822eb3930d939
	.xword	0xd3bae956f753fb8d
	.xword	0x1608321cb59c7947
	.xword	0x1c806c8d65ada0f2
	.xword	0xfd4a12ded0a969e9
	.xword	0x66de41d9deb2f8db
	.xword	0xafc303f1cc400bd4
	.xword	0xdadf3f6901283fe6
	.xword	0x90ae60f5e0f69453
	.xword	0x49280c0b861b03c9
	.xword	0xcf8833657ea62755
	.xword	0x2599a96a80841114
	.xword	0xd3f5272ac21a8648
	.xword	0x058bb7b82841fc62
	.xword	0xdf610e58d66c4dd8
	.xword	0xf94e9e9359ff43e7
	.xword	0x0b3b14510d18f386
	.xword	0xd61856859068effd
	.xword	0xfb030bbc65ea5cb3
	.xword	0x61d7086c9a12f4f9
	.xword	0xcba16b88a8fe0118
	.xword	0x2f477d2de5e91426
	.xword	0x9f4afa01e97e4ad4
	.xword	0x01d17c1c86db2f26
	.xword	0x3c1dd64f13ea23ff
	.xword	0xec039f1e44734996
	.xword	0x8779dbd090f0b4e1
	.xword	0xb9986646d3cb483f
	.xword	0x3dabf96420cf20ea
	.xword	0x9ca6e499adfd381c
	.xword	0x9a4bb4b924a71a1c
	.xword	0x025b4f6266de7b0f
	.xword	0xe66f4cd9ed49b5d7
	.xword	0x3dfc3f2f212b9579
	.xword	0xee2b3516ef96fa74
	.xword	0x715c5e72d9b9a49f
	.xword	0xee674455c4d81ae5
	.xword	0x39cbd74f17764870
	.xword	0x9de808489d57cf5b
	.xword	0x7b81e090885948fb
	.xword	0xb4747637272feb5e
	.xword	0xaca3763802997fdd
	.xword	0x9d4cf81da5ce25cf
	.xword	0x0c360188d0d1651b
	.xword	0x2b77e78a05662280
	.xword	0x7fad4acd18e5a162
	.xword	0x9539fe500a75137a
	.xword	0x7bbc62a7e32082ff
	.xword	0x6988ae14b55555c7
	.xword	0x54a481e280435679
	.xword	0x07fc4c82da07809b
	.xword	0xfc9622d8d275d0e8
	.xword	0xbefeb047b8c6e9e5
	.xword	0x2cd5f5f5196be3b1
	.xword	0xc1b1d19cd6042089
	.xword	0x804c60bcd9ccbbb3
	.xword	0x7614cdfc14d9dff4
	.xword	0x103df29c7c6c72e7
	.xword	0xb82e24500a30db82
	.xword	0xa4fa6c5adb0b2055
	.xword	0x5a8584521e43f8f1
	.xword	0xb287ab5953e88e33
	.xword	0xa04a7b1f9dd23d19
	.xword	0x121384f92a92264a
	.xword	0x968aecfe0024b7d5
	.xword	0x31da5f9d24aaa844
	.xword	0x651cf0fc24037eea
	.xword	0x0577e2aa074e7c71
	.xword	0x598610621cd182e9
	.xword	0x51ef1f6e1eaf387f
	.xword	0x03f11d6244942ce7
	.xword	0xda46fde81e19fe98
	.xword	0x503dfd994adce73c
	.xword	0xbb2bc1a8ef58e746
	.xword	0x95ec5ca8087d66ce
	.xword	0xc28e9441d1af7a87
	.xword	0x547b6d335e229627
	.xword	0xd56b3ddea017bcec
	.xword	0xe5d945a7f3dd6524
	.xword	0xcd3b9609a77be846
	.xword	0x4b35d67c4f9f6a80
	.xword	0x1b23812dfc5469c2
	.xword	0x756a552808426e59
	.xword	0x177c679be22625b8
	.xword	0xe476f3ce680e2659
	.xword	0xd3abb8371bd31cc1
	.xword	0x43638adc263806ff
	.xword	0x63e8cbcfe5413545
	.xword	0x057dd7e5f2000e55
	.align 0x8000
	.data
data_start_3:

	.xword	0x30d198234e6a59d3
	.xword	0x39db34718b9b19d6
	.xword	0x05a931f91292fa4b
	.xword	0xdeb601bb27fc77be
	.xword	0x2c082bf24f0e3f2d
	.xword	0xc24262ffa146b877
	.xword	0xcd913a682555b640
	.xword	0x8bfb5fd9e1b6d19a
	.xword	0x0ff1d1953128f3eb
	.xword	0x4f7a4c3393f4ef51
	.xword	0xc2a58efc97ab5bec
	.xword	0x25e4a08bbec397b5
	.xword	0xf8cadd5accae545e
	.xword	0x006d56b783d5fede
	.xword	0x9f1628fd2ad14f0c
	.xword	0xeb9d87e409a1bf8a
	.xword	0x8ec60051447a4633
	.xword	0xd94481131fad7b9d
	.xword	0x27282b7ab38a3e7f
	.xword	0x01285a6cc69e9452
	.xword	0x747ffbf3bad77f26
	.xword	0xfabc4b487067c1b7
	.xword	0xe51de5d7bdfdf4e3
	.xword	0xfe90f477f0c37cd8
	.xword	0xa3ec2bc60b141ab5
	.xword	0x91eee3ee6e4b3be3
	.xword	0xbf57064d48db80e8
	.xword	0xc9934b2422c6558d
	.xword	0x144aa481e4acc602
	.xword	0xbbed645194c6d70d
	.xword	0xfbe6d168a034b3e7
	.xword	0x0e4cdea08f584e78
	.xword	0xfbea798993eecc9f
	.xword	0xf1a99dd12b1935fd
	.xword	0xe05da9b4b88e0dc6
	.xword	0x1cc2d5b2fcb7f363
	.xword	0x4f9d5dd52ffbe1e3
	.xword	0xacb038de9f5df27c
	.xword	0xfb52f22018fad058
	.xword	0x88d756ac7c134898
	.xword	0x83c58717d98770de
	.xword	0x5277a0cfd9ba55d5
	.xword	0x0104e18764e69bd6
	.xword	0xa1cb20ad0281898f
	.xword	0x923ae9d472411154
	.xword	0x82dcc543221b93a2
	.xword	0x9f6ad523b268154a
	.xword	0x707a6449fc8dfd63
	.xword	0xad2cd732e0de8ef6
	.xword	0x1c2bf82135d30891
	.xword	0x7990746fe8a613d4
	.xword	0x30254625d148d602
	.xword	0x4eeb8a9fddc25b5a
	.xword	0x856639964b7b030e
	.xword	0x4b33d4130256da5e
	.xword	0xcd1704e3db55ddce
	.xword	0x2ad3a5fbb7d5c75a
	.xword	0x321eaabfb39a8e13
	.xword	0x658b2ba0875c84a9
	.xword	0x86fdf81a9e5725a6
	.xword	0x6479ccf5278fd410
	.xword	0x9db4ad6616ad3971
	.xword	0x303e27fa6953d895
	.xword	0xc419c71ac500b862
	.xword	0x9323a69a5c303a83
	.xword	0x8499ebfcf385aca4
	.xword	0xa4835be2a0438362
	.xword	0x7d63826ff4203cd4
	.xword	0x46334f64d3f8e54a
	.xword	0x2e11828818c1a8b8
	.xword	0xc1a13a7619a8ced6
	.xword	0x147f2b0f80a640e6
	.xword	0xbe8c01bd6712f8a6
	.xword	0x9a2db2892849f855
	.xword	0x7587e25fbab75ff1
	.xword	0x280ace04f0907e75
	.xword	0x53111fbdeb646d12
	.xword	0x24847a0c51138c67
	.xword	0x0cc107c2f6bbd327
	.xword	0x72d151f6fc463383
	.xword	0xbeec8b9c03db22a5
	.xword	0x91509c54b6d08460
	.xword	0xf13a659b9bf0a86b
	.xword	0xc81ff46f7328e5df
	.xword	0x790f0adfb4e015c3
	.xword	0x1eb5eb4b3ece1c99
	.xword	0x111ba6abc2d98504
	.xword	0xfcd75c4367efc2fe
	.xword	0x718af520711e6a6a
	.xword	0x9a63c6a10a22c42f
	.xword	0xfe0a90004a02c854
	.xword	0x76941de9bc7c434c
	.xword	0x6a2cfd38de79796f
	.xword	0x4b9e1cf9ecf2fd60
	.xword	0x30743cfd42d793cd
	.xword	0x1797c359c9438029
	.xword	0x49f01c3c64f1ba7e
	.xword	0x348aac89c56950d9
	.xword	0x4122d9995963daf6
	.xword	0xb3065dd053dccc43
	.xword	0xe1313cd38cd1d349
	.xword	0x8e5ab24a3296b8ba
	.xword	0x950cd5e23c8b8896
	.xword	0x07031064a682ae1f
	.xword	0x132ff84ffdfd9486
	.xword	0xc8882d79ec4c064d
	.xword	0x72adf88814870b54
	.xword	0x697e503f17653e11
	.xword	0x44ed0c4cc02c0ab1
	.xword	0x1a71e7f71cae3fbd
	.xword	0x6a32496a29071a18
	.xword	0xe67d3282c53e353a
	.xword	0x59ba8cfcc2768ae9
	.xword	0x0f0b8ba16ad57787
	.xword	0xe5f779c99a783e6d
	.xword	0x44c6982838f49660
	.xword	0x14a832ddfa51e629
	.xword	0x0bb45537a4f2445e
	.xword	0xf0682b1fda41a349
	.xword	0xed3bebd2a8cf43bf
	.xword	0x14f5e1e269bf9851
	.xword	0x3aba01a3f899906f
	.xword	0x1584f871242260b7
	.xword	0x3b448f1e10e78247
	.xword	0x305282c8ccbd1bd6
	.xword	0xb2068212bc2508f6
	.xword	0xd335eb63a4bc5cfd
	.xword	0x6832d748cae599e6
	.xword	0xb60b4346e5b2a639
	.xword	0xe7b2a757509e85db
	.xword	0x1151e6d754bb3840
	.xword	0xbfea1370154691af
	.xword	0x318f6fcbb8c8633e
	.xword	0xcca80a1211da952c
	.xword	0xea4ff2c4150b870f
	.xword	0x3a88617bac91124a
	.xword	0xe53aadd1647dc081
	.xword	0x83a50e6744c7d048
	.xword	0x2502c96b3163290c
	.xword	0x87349d10b5dbe0e7
	.xword	0x97571e8b3a293fab
	.xword	0xdca979a1f8cdf563
	.xword	0x9b94d92a0b24f121
	.xword	0xd74cfdb91d0cbf21
	.xword	0x2ef39ba36f4cd75d
	.xword	0x4e0f2c883acd6977
	.xword	0x0b133b8a06518724
	.xword	0x9d164ada3a2e391c
	.xword	0x4d4f0de40e9f57d0
	.xword	0x8fc5ba6b3703afee
	.xword	0x8cc0016d16179226
	.xword	0xb51bdd2998a23374
	.xword	0x22e0ef7229562d01
	.xword	0x750868889c63da68
	.xword	0x6c33d8d786b8c286
	.xword	0x3f661b42507ce255
	.xword	0xf6aab50ce0fc702e
	.xword	0x3a39d066cd220a76
	.xword	0x7525ae47fef26183
	.xword	0xb8e469c5cfd3633a
	.xword	0xa902ebdd02ee96ca
	.xword	0xcb5ca99f0e306318
	.xword	0x3907e87abd7292dc
	.xword	0x6e80165b2e65fc89
	.xword	0x3df66a9f87d0aa47
	.xword	0x9d28d994360f5fa9
	.xword	0xf4331b7b9dd6c989
	.xword	0x92bff1749afbb77d
	.xword	0xd30ac9c789aa4cae
	.xword	0x1e8e50a57d30b71a
	.xword	0xbcf455ebf99806cf
	.xword	0x7475a15fae04c728
	.xword	0x4ef96dc1fb6ac725
	.xword	0x44366c49e889a2c9
	.xword	0x8f8d2488b7d38563
	.xword	0x51c1ed50be26bd23
	.xword	0x42752ff4af30236f
	.xword	0xbadd1725aa5e5a60
	.xword	0xb483edadf14df24d
	.xword	0x689ea195615ec81a
	.xword	0xcb5d772ae17318f0
	.xword	0x61682e80b5a1640b
	.xword	0x6098ad1d9b4ede38
	.xword	0xafc2132063acae0e
	.xword	0x2758f7d612e9cc94
	.xword	0xd52f8798397e7947
	.xword	0xcbb94d36a5cd1d4f
	.xword	0x3cdb9cd25b79a469
	.xword	0x772a0a4adb01b29b
	.xword	0xdc862f5d0411b3cc
	.xword	0xf787672721d8f61f
	.xword	0xa5d709285d0507e7
	.xword	0xf452c0c9b3c0ef0b
	.xword	0x3b40b0dd78f7bf76
	.xword	0x5df57ea9969484c2
	.xword	0x5cd8a0f7ec278f5e
	.xword	0xb1e249f191b5f16a
	.xword	0x1c7a06bb32911211
	.xword	0x949ea496b0644b0b
	.xword	0xb4c835055cde905e
	.xword	0x1d1af8e4d0f494e8
	.xword	0x86fe7c2c8ba73a2e
	.xword	0x398cf1923f3e46f4
	.xword	0xcc90937528db5184
	.xword	0xab86ef5ffa01ee4d
	.xword	0x57845b3c9e69ad12
	.xword	0x6a80a4831386fd6c
	.xword	0xd1ce782603630334
	.xword	0x6d28736fa4fbbd6a
	.xword	0x8f9b3e904fd309f4
	.xword	0x8c5c7451427c42a9
	.xword	0x49e29489656ec394
	.xword	0xb86bed01b27291e9
	.xword	0xef6f84099a70460f
	.xword	0x7a1b9e80d91bcedb
	.xword	0xb08cf7b9c6b47d3c
	.xword	0x60171a722edd75e7
	.xword	0xb6a71714b5ec839e
	.xword	0xecb72a47de99f20e
	.xword	0xff52051b3e0790f6
	.xword	0xefc74904c79b8969
	.xword	0xd1a80c50e72d66fd
	.xword	0xf90a1ac754a6e6e7
	.xword	0x1f72843bf8d89376
	.xword	0x6525f944fc29d596
	.xword	0x56a43fdae31addf8
	.xword	0xab512f2a490b761a
	.xword	0xb6d397818cd4b10f
	.xword	0xf822aa52f0efbf5a
	.xword	0x7d6a7bdfb6b22323
	.xword	0x02786e003e2a43e9
	.xword	0x01b1ceb181cb2255
	.xword	0x32b94f8da8a3ddc7
	.xword	0x0789eb9503891e05
	.xword	0x02a43c90a3b7e008
	.xword	0xbc7fbbd042444f3f
	.xword	0x8fe2aa21347011f4
	.xword	0xcc59526088c82d73
	.xword	0xa9c9bab0d30f7375
	.xword	0x6fa54702a23eafb9
	.xword	0xd4596e084657c3d7
	.xword	0x5157931cbbaf2339
	.xword	0xdc3706ebd9be1580
	.xword	0x839ad1a128df6e62
	.xword	0x118a6d46940b6bfa
	.xword	0x279c5fc7b980701a
	.xword	0x5f827adeda0751d0
	.xword	0x4f099cb6009fecf4
	.xword	0xc7236924b3ea02d7
	.xword	0x59fa75cdf2296b37
	.xword	0x1f8aeba9e22fd405
	.xword	0x99bb3f504f45d0d9
	.xword	0x4ab6eabb042a3685
	.xword	0x1a86a644d51f578c
	.xword	0x729eb2a97cd3fd57
	.xword	0xd4159bea5f8111ad
	.align 0x10000
	.data
data_start_4:

	.xword	0x403438a941d5be35
	.xword	0xc33f433bfada5792
	.xword	0x27b1823123fa8c96
	.xword	0xf2dda48b2f8d00a9
	.xword	0x31688801f087dd20
	.xword	0xd1702d88c3a36fe7
	.xword	0x2ffb89e6160c5cec
	.xword	0x1197b2abffcf125f
	.xword	0xe060ca72fb329276
	.xword	0x566e9323aed1faa3
	.xword	0xfbf37efec5a387e3
	.xword	0xe44fdffafe9e9a5b
	.xword	0xa6d6e66ace838c52
	.xword	0x0730dcdff12ed6c0
	.xword	0xbe11d83d0de93a1f
	.xword	0x613a8dafdc2b1923
	.xword	0x3b303d0b302b1780
	.xword	0xf60ac985f4eb3391
	.xword	0x72ee905b69c59ab1
	.xword	0x4e801c9ae1d835dc
	.xword	0x45be44469ef74f6f
	.xword	0xd51a73806d8393c6
	.xword	0x669612d478eb7b61
	.xword	0x10906ee6f4734c48
	.xword	0xad4c3f05a466a419
	.xword	0x0be64720845f0e37
	.xword	0xf6103234357b6553
	.xword	0x952cea193cf0979f
	.xword	0xbe93d267d6b8338b
	.xword	0x836eb5aa5532dd55
	.xword	0x49a3c83b986ee842
	.xword	0x3437defaef94fc09
	.xword	0x7c1f1d347122a4b5
	.xword	0x49dd51f2a3a80396
	.xword	0xc75597712eb14621
	.xword	0x165e9b86258116e4
	.xword	0x6a8a6e271e761d1a
	.xword	0xf087a3d6ad7129c3
	.xword	0x254f3956d8d2fb03
	.xword	0x70bc93a662ea3314
	.xword	0x168da7b3166178c0
	.xword	0xbbf3fca40cf99657
	.xword	0xbb54f5e0ee7627c7
	.xword	0xd58a4633e324bc44
	.xword	0xc84bff9dcdb6e740
	.xword	0xf4cd705550f6bc4f
	.xword	0x06de4c159f161c0e
	.xword	0xa0cf839a69aa162b
	.xword	0x67daca16f722f59c
	.xword	0x50582e2bf01af743
	.xword	0x4fc08370c3d6ad34
	.xword	0x09cba1935f156ecc
	.xword	0xb6b7c8db846e0345
	.xword	0x20fd838ffcb0e78b
	.xword	0xd098ef58a5d45aae
	.xword	0xd34246be96e88a25
	.xword	0x36ace430e0ebaaa3
	.xword	0xe7416f35bd731d79
	.xword	0xdeace5e1ed965132
	.xword	0x41d3a602caf00761
	.xword	0x52cb8cd74c11cd92
	.xword	0x65a6ce96e565fda5
	.xword	0xa6b7a023b921e3f9
	.xword	0x011e58c84df76117
	.xword	0xbc8686be7caf3583
	.xword	0xdfe6a2f99c54577c
	.xword	0x3836dfb54295adb8
	.xword	0x7076eb7b8774c9b3
	.xword	0x33b1677d3ebbaae9
	.xword	0x0066d5159d754e6a
	.xword	0xab1e7f390604d6c4
	.xword	0xfec96f3ff1b48055
	.xword	0xee28a45b77e5a543
	.xword	0x41ffa59c6371ed27
	.xword	0xb1934987f4ddebd7
	.xword	0x9c5de2f5f6f1128d
	.xword	0x751f195b4c9e4987
	.xword	0x2d5969930fa1f4d5
	.xword	0xbd9ea4c86a96bd47
	.xword	0x56274df74c612ae4
	.xword	0x69467334ee129811
	.xword	0x15005770ad00d020
	.xword	0x3e4dcf20b1a2fa18
	.xword	0xc6abffed05cd5c95
	.xword	0xfa2fe99f4b94d391
	.xword	0x1866edaabefec68c
	.xword	0x02e78afd3a5f4aed
	.xword	0x7321acc41dc793dd
	.xword	0x76b52855234969e5
	.xword	0x047a2912ffeaa10b
	.xword	0x69ce63cfffbbfe4a
	.xword	0x2a6fd6b2f7febe60
	.xword	0x20d71ac330e34d45
	.xword	0xdd22d80d69191ed2
	.xword	0x89f4b53ef5a1a413
	.xword	0xea9ccb23476aa9e4
	.xword	0x6bca9caa508fae03
	.xword	0x84698dd5f2d35a1e
	.xword	0x2b2c00ef3fb8bc7e
	.xword	0xc71af7f436e95f4a
	.xword	0xfdf0139ddd8f4aad
	.xword	0x095486ee57b40a98
	.xword	0xeefd7b887c0ba5b8
	.xword	0xdd331fba13a51278
	.xword	0xdbe10cebd6b3e568
	.xword	0xe921a9091288b3dd
	.xword	0x12c7eb17c8e9531a
	.xword	0x92bceadf264d2bac
	.xword	0x3896c0699e43adc6
	.xword	0xa8e7a6d398159545
	.xword	0xe98ba2e4718e1604
	.xword	0xef6e18af79166ad1
	.xword	0x828cff3b1a711878
	.xword	0x7a9dcac97ebcc8de
	.xword	0x5a73cecc1a4d0ee9
	.xword	0x0598cc673683d252
	.xword	0xb6c9e73f17c7e198
	.xword	0x8829a7f12a12abc4
	.xword	0xa99e7f70d4a28a37
	.xword	0xca9ddc2d4923d63b
	.xword	0x39deae40b497a73c
	.xword	0xb3c0fa6477511b73
	.xword	0x645fd39ba93ef8a8
	.xword	0xe29dd8c042d70250
	.xword	0x985cb2c709ecd3be
	.xword	0x0c0f6bf5e0da7653
	.xword	0x71eec0d915047e15
	.xword	0x3d4caf143c31dbe8
	.xword	0x1fca2dfcc7c7a2d2
	.xword	0x6aefe88e1c9850c7
	.xword	0xcc04e159f5166ba9
	.xword	0x30839721aef74545
	.xword	0x36fb771cbf9609da
	.xword	0x5e9dfbe9bd8ff108
	.xword	0x666f9fd974209d5d
	.xword	0x24f8c2792297ab44
	.xword	0xc9514c4f232c491c
	.xword	0xe4c432cf62115ecc
	.xword	0x02834e8311f5bad5
	.xword	0x45f8807a94358f61
	.xword	0x0f218f95aab3a3fd
	.xword	0xef0b8c75ddd143ed
	.xword	0x881aba4ba3c79ec6
	.xword	0x4c5a4c52699d729e
	.xword	0x1e47f603d435ceef
	.xword	0xb5052fe64269e8d5
	.xword	0xccd224691fb2f5b7
	.xword	0x676e91221adf9e90
	.xword	0xe20919de9bb6190e
	.xword	0x6ecb497e20eb3a11
	.xword	0x993eb42cabdee602
	.xword	0x6555a7700013a101
	.xword	0xbac5df8c4aeaac94
	.xword	0x8d2fe403eeb31a83
	.xword	0x2d1acb9435c44e25
	.xword	0x64edbc3ceefe1c68
	.xword	0x703c17965846de93
	.xword	0xb148da44f9fe2517
	.xword	0xae0db7bb378c7c3d
	.xword	0x50517228c0baedaa
	.xword	0xa2cbe031a59eccad
	.xword	0xb33fbadbb1e2b48f
	.xword	0x13c1b09a6e498d8f
	.xword	0xd1e6faac30a5ca18
	.xword	0x5361e88636b86cfb
	.xword	0x97e8de1642a5f258
	.xword	0x14ea6aa9becf4974
	.xword	0xa6af86c97c99d9c9
	.xword	0xe57e21621f0b11ef
	.xword	0x823a1f021c874d45
	.xword	0x1f3aeca01a5fbc2f
	.xword	0x272dcb03d6748558
	.xword	0xd9f2445c69df9823
	.xword	0x69cf2fcc86a7f419
	.xword	0x532959423dd14f75
	.xword	0x20174358303ffdcf
	.xword	0xa3fb647de597c8ce
	.xword	0xe3bf936eae3cf4b1
	.xword	0x93f6aab11505b210
	.xword	0x25dd6ce6af77b8f9
	.xword	0x2a5d278b0276af6f
	.xword	0x8b1bf57de5c7ca39
	.xword	0x214f0d3f9f97e252
	.xword	0xdbe85697cbf1973f
	.xword	0xfef34d9c27c5c832
	.xword	0xae8a223159ffdaed
	.xword	0x3229471b6b4fdf1e
	.xword	0x3fd721c47d993285
	.xword	0x382208f124add99e
	.xword	0xd5c557100ff1a155
	.xword	0xa5e4026d0069b6c5
	.xword	0x2c32c4a2f05802b5
	.xword	0x2b305beaffcbded9
	.xword	0x91a48d00b55e9093
	.xword	0xe37e33e55bf8e171
	.xword	0x6376f24aaef272a8
	.xword	0xf138fbc65db0c17c
	.xword	0xa062c07a92e8e938
	.xword	0x2f4071a61c9e2549
	.xword	0x6bb71b46358d6b1c
	.xword	0xc846f0e37afa0170
	.xword	0x99aff880034212da
	.xword	0xd32f12d4b255bc91
	.xword	0xcdb6a1cc262689f1
	.xword	0x1fc351a82df7d826
	.xword	0xcf850b1b22e4c05f
	.xword	0x2a605050706f95b7
	.xword	0x28f25f7b2d2d9865
	.xword	0x09028b4dd6489b4b
	.xword	0xe7f58710dab02fd0
	.xword	0x2fafa8eb3e81736e
	.xword	0xf7d71362c58f5276
	.xword	0x4aed43aa4f080e7a
	.xword	0xeea1badd52202377
	.xword	0x071ce7ccab57e924
	.xword	0x69ead9825528abfd
	.xword	0xe2408b2202cf1b09
	.xword	0xdff85b2e7a6810b8
	.xword	0xbce56622650a80c8
	.xword	0xaf63526423913184
	.xword	0x27bc040b7b12ac58
	.xword	0x3f6fc43bdcbd673e
	.xword	0xfb8d86b0c2bfb9c5
	.xword	0xb5a43819c587a783
	.xword	0x49abf370e907336d
	.xword	0x360a797574de62ce
	.xword	0xdb8013f70efacb73
	.xword	0x16b00aa2170bc008
	.xword	0xdbb2a455e011d37e
	.xword	0x90fd48cb84b90c1e
	.xword	0xb76d85fded05712e
	.xword	0x58b8ae34f6740787
	.xword	0x01f714aea0c27395
	.xword	0x33b84a295604275c
	.xword	0xf361668b6a942382
	.xword	0x68928a19169152a7
	.xword	0x88f5251d8619fea5
	.xword	0x20091a42990d3f78
	.xword	0x032d854b70b40b82
	.xword	0x6c92988e4cd6d2dd
	.xword	0x3f90b85222dce252
	.xword	0x5baea1042ef1da30
	.xword	0x5d09549f70ae21ff
	.xword	0xdd67aebac4999ad4
	.xword	0xaa7352979e88e3db
	.xword	0x19ae094e3ce1feb9
	.xword	0xf3a6c81701d6857d
	.xword	0xfba57dd75bca5d68
	.xword	0x7a20a3fc8fe030ee
	.xword	0xc645192b7c86995c
	.xword	0xbd39fdeced23d79d
	.xword	0x3ba91a3a5a456f68
	.xword	0x3847ad4060c36aea
	.xword	0xeef571061ff8f0a5
	.xword	0xdd5b669ab557fe1b
	.xword	0x0197372a82c6a491
	.align 0x20000
	.data
data_start_5:

	.xword	0x6024050737de29ec
	.xword	0x47aa56eae3439c04
	.xword	0xd3f09b07eabd053d
	.xword	0xf7f1e1f0f366ae31
	.xword	0x9f2ab073e1efde6a
	.xword	0x42e26e000486fe55
	.xword	0x6484dee150582f89
	.xword	0xf995c9e074c63734
	.xword	0x6f2083ef8413f207
	.xword	0x131bb2472c5da9db
	.xword	0xc632da052fd752de
	.xword	0x8c83a229f4c302e3
	.xword	0x6d1eb03e3cc27862
	.xword	0x8cd537f2735871a1
	.xword	0x54b2067d18e32fbb
	.xword	0xbae9c201018e6db4
	.xword	0xbd3baca4fd7746b8
	.xword	0x83e3e8df71f66a59
	.xword	0x05a5ec5b6867cf84
	.xword	0x896bfbc0afc59c16
	.xword	0x344fe2f33783f938
	.xword	0x7de4ba35d764becd
	.xword	0x3318d336bd2601cf
	.xword	0x8df6f627e64c2856
	.xword	0x6313e1ed66b27a3f
	.xword	0xb871cb201db4e7c9
	.xword	0xbd97f3c6a975d9b8
	.xword	0x938252e36d6e2a49
	.xword	0xcfb780642dd1b0a7
	.xword	0xa36ea22e2dcd7308
	.xword	0xcccd9e81d9500496
	.xword	0x04a9ef9861f937eb
	.xword	0xafab01c9a4278b66
	.xword	0x1da55ded7274aff0
	.xword	0xc2d2fb4375337176
	.xword	0xa70775c9a7742111
	.xword	0x532fce45bf582562
	.xword	0x551d1feeff3f0c13
	.xword	0x40352d0497b5f020
	.xword	0xa1fa81a0acdd3bf3
	.xword	0x7202e5bb712acfe0
	.xword	0xb08588b37ee35ebb
	.xword	0x3186bbb7521f79f8
	.xword	0xb43488a3264cd301
	.xword	0xd3796616518600e3
	.xword	0x1b33494b52ae8249
	.xword	0xde15a4b55286b96e
	.xword	0x9158046d6f6b7987
	.xword	0x914d88acb3bf792b
	.xword	0xd89b0e9edd26418b
	.xword	0x75492fc3be5cfb45
	.xword	0xc9ebbe5d845bc0f7
	.xword	0x432be927e4d463ff
	.xword	0x26b8dbe5628ca568
	.xword	0xb4370613e963bf42
	.xword	0x648498793047aeb1
	.xword	0x7d2194bbd3475afa
	.xword	0x8b6401ead9755976
	.xword	0xe3da5b3c63174df9
	.xword	0xf936d6a6f4f40322
	.xword	0xe80612b4d2e940c0
	.xword	0x7d1ba7c9ef7980c8
	.xword	0x169c2e64974cdbab
	.xword	0x95fdd6eca5a82b26
	.xword	0x0722c154dfc15a19
	.xword	0x3ee18d6eca0b8575
	.xword	0xb791bb04b41ca155
	.xword	0x315692a279d705ef
	.xword	0x02a75d2bc01b7332
	.xword	0x0500caef8506c440
	.xword	0xcaafbffb57adce4b
	.xword	0x9b02ffa85721df8f
	.xword	0x8ea00d02eed77016
	.xword	0x735322c3059055a5
	.xword	0xc5c807fb655712ff
	.xword	0xb70b83af0ea69978
	.xword	0x64de8983a2e68b73
	.xword	0x4d32901ac362db1d
	.xword	0x06d3b6d05c70c6a1
	.xword	0xfb918945d93036e2
	.xword	0xa55bb2e98d7282ef
	.xword	0xe7dc210d39b197a0
	.xword	0xffa78697ba58e655
	.xword	0xce60fa2635380ec2
	.xword	0x775190d9d80fdf98
	.xword	0x6fc3e197610f4852
	.xword	0x3281dd6a8886a3e3
	.xword	0x95c71aa56fcd32b5
	.xword	0x092c63fcce94ab85
	.xword	0x93c2dec61ac11685
	.xword	0xdf5dddc4dbb4a33d
	.xword	0x0bee0d8f8deeed1e
	.xword	0xa688510170928e73
	.xword	0xf299a61386a58abe
	.xword	0x9441712bc71ff816
	.xword	0xc95ef74d37669e45
	.xword	0x9dd4ed7ad68179e3
	.xword	0x50be65b6550b6ba6
	.xword	0x200b26285f4f284f
	.xword	0xca839c0ccdd91f78
	.xword	0xbd564ea58688f548
	.xword	0x610903aa66d1b737
	.xword	0x437707df72764eca
	.xword	0x2686a569ceaf299f
	.xword	0xaba7e232a8a78273
	.xword	0xdc02ff214ebaa280
	.xword	0xb2aa432a35a10cbc
	.xword	0x1f0cd2d2d2b4375a
	.xword	0x732acf5761e493cb
	.xword	0x2a603a32fa2802be
	.xword	0x28c563601fe47608
	.xword	0x80da3a619171b2e8
	.xword	0xc078ebade3075b5b
	.xword	0xcd07f1f77a818a31
	.xword	0x365f06117ea09874
	.xword	0x7ff43f6ffefd2c2f
	.xword	0x804101e3851651d8
	.xword	0x3d772b3e5fb02dc0
	.xword	0xa566f6939fb3ab5a
	.xword	0x1b5f2fc6e57ee8eb
	.xword	0xea8d19fb31ec9138
	.xword	0xaf304d9032a59758
	.xword	0xee65ea130c95fbb1
	.xword	0xb3ddaf1509459def
	.xword	0x6932bf195169785a
	.xword	0xea8c19c72a4fb634
	.xword	0xec6617af8679fac0
	.xword	0x5d753d35b4216467
	.xword	0xd2be4123dcc8e313
	.xword	0x60c60477c0263d62
	.xword	0x2a6d50e14d50af36
	.xword	0xec20f2a6a65fb3aa
	.xword	0xf94aed33682d2532
	.xword	0xffb037754d00be1a
	.xword	0x4d60dc79a3aeaa20
	.xword	0xe33a056ab820cca0
	.xword	0xba85fd798479acd5
	.xword	0x46c1e0e7be3cf4cc
	.xword	0x941a8a2e1fae7768
	.xword	0x4ab198d921ea7ce6
	.xword	0x251a170d02c389d0
	.xword	0x39c41118b796385d
	.xword	0x2e1b7993a5150b80
	.xword	0xc10eef48bbb25f10
	.xword	0xf13cc1acf049fdd0
	.xword	0x7bee97c41472d60a
	.xword	0x0b18fe09002a9eaa
	.xword	0xb94c32b41ad08991
	.xword	0x88496272f9675901
	.xword	0xe931abcdcbbae5f9
	.xword	0x65d7678d19498a49
	.xword	0xa1251adef96f6f7b
	.xword	0xfe93703a0cf0c853
	.xword	0x46a4e5f55c7000b6
	.xword	0xef5991578423a4ce
	.xword	0x39fe288aa380b13b
	.xword	0x2d82c4baa7b4c18f
	.xword	0x7000eca28f3f6abd
	.xword	0x0107bf7fb16dc5ba
	.xword	0x703d5fead623ed7a
	.xword	0xe060c9d32740c7d1
	.xword	0x58b60fae7487b353
	.xword	0x41c0f1c161325efe
	.xword	0x0aeb27098e79ac91
	.xword	0x14f0aaae63ab13bd
	.xword	0xc07618d0273ecffa
	.xword	0xcca83644c7936424
	.xword	0x882a9ae243fd0035
	.xword	0x716d42be199d8053
	.xword	0xc28c893a302b24a5
	.xword	0x652ee446c0f09355
	.xword	0xbac9079b0436c202
	.xword	0x066be8e3c36f309b
	.xword	0x53b43494c4b14b5b
	.xword	0xdc98fb662d367ae8
	.xword	0x37f39d9f68b3dbe6
	.xword	0x0ff5605860aa264a
	.xword	0x0b4483d9897ac013
	.xword	0x0ec8734a1bbe1efe
	.xword	0x303082e8be76709f
	.xword	0xaf3282c898e35650
	.xword	0x30461285e2f58423
	.xword	0xf82ad1d5836c4063
	.xword	0x0cc70e9922830d8b
	.xword	0xaee575c1df77a5dc
	.xword	0x057a406dd0e300fa
	.xword	0x753787426c232908
	.xword	0x61945558fa6f396d
	.xword	0x858029c86177111d
	.xword	0xb09ec9642fcec62b
	.xword	0xa24411048e5cf18a
	.xword	0x833d4c047134fff3
	.xword	0xeda26582dde08945
	.xword	0x23bdc337c57f1326
	.xword	0x561f03fd25773dd0
	.xword	0xbde6f187e8ad40c9
	.xword	0xbbb2f04638c7899f
	.xword	0x9c5794acc553a67b
	.xword	0x04867a522cf9bc4e
	.xword	0x63fbd95be73ea355
	.xword	0xa79fec09e151a2d6
	.xword	0x7e4bf48525c417ad
	.xword	0x6dc1c2555993c1a2
	.xword	0x9e68b1b1eb08ab5e
	.xword	0x7a5bab7fc4ce51c7
	.xword	0x80decdf063f03145
	.xword	0x2783953681b193a6
	.xword	0xdb6c13f9b66b572d
	.xword	0xe0efb8c804fa5f15
	.xword	0xefa142aa83f65edc
	.xword	0x885b7db3b1d6b65d
	.xword	0xee5101838f503572
	.xword	0xdf83f665f7adee0a
	.xword	0xea18192219b8b90a
	.xword	0x8a5e88ab2bda1b8a
	.xword	0x1289a81874318d13
	.xword	0xadc1ce72a4cc5800
	.xword	0x75c8c9a04ec1a503
	.xword	0x4d70596458ffa25e
	.xword	0x11e73da9b18cc767
	.xword	0x76b195a24154123f
	.xword	0x7d61b144fc3109d1
	.xword	0xff4feb6adc4ab19e
	.xword	0xce69b5e9dab1afd6
	.xword	0x490f4ced06e2f84a
	.xword	0x728c95adfcfbed70
	.xword	0x2d068cdb48ee5ccb
	.xword	0x642e22c933be8d32
	.xword	0xecc622f8078d1223
	.xword	0x08f0a82150b455ff
	.xword	0xd62f99f43e51a9ce
	.xword	0x27bb68f0a8c01e5f
	.xword	0xfbfdac4b1d7a15f8
	.xword	0x91b9653ebc4e27be
	.xword	0x4607d715be758c5a
	.xword	0xad0876e3b1add039
	.xword	0xc3602626ff105b1a
	.xword	0x672798d3b5593e7a
	.xword	0x890d72fad107aa6a
	.xword	0x035f67eea9159d31
	.xword	0x1a1a86ccee8ab143
	.xword	0x0b8845a162ed1522
	.xword	0xb473650125e32094
	.xword	0x725de121aecdb1ca
	.xword	0xb7229a69b73e83c5
	.xword	0x8d76d16bbe5b4913
	.xword	0x545249e903a5278d
	.xword	0x67f12200c6fc03db
	.xword	0x46484514c71f37bd
	.xword	0x0f9bdb83cfe108b8
	.xword	0x9583a064f73eac70
	.xword	0x5a141615ae36b50f
	.xword	0x63ea88b50a4d8c67
	.xword	0x249ba20f56731fe7
	.xword	0xd68a6cdfed6fe008
	.xword	0x8467b5ced50c2322
	.align 0x40000
	.data
data_start_6:

	.xword	0x5c32aeaeed2d998d
	.xword	0xf8b646b9355dbf68
	.xword	0xf81e57ffcc760c30
	.xword	0x4977b20239594e5e
	.xword	0xc1fb251b3262ee75
	.xword	0x63488cf14f168164
	.xword	0x8a529f413d72c932
	.xword	0x94ac102b1f765b14
	.xword	0xea3c04592534d46c
	.xword	0xdc095c6e1da85603
	.xword	0xc852f7ed0ac11254
	.xword	0x4830b242a8272539
	.xword	0x99e6f4e79d3f4488
	.xword	0xd2d0516c869a14c6
	.xword	0xde929e59f768fc38
	.xword	0x183aef0091c5b5a1
	.xword	0x6b65fd670852c8e9
	.xword	0x8d72ad72cd27d74f
	.xword	0x6b158c8085b0bff0
	.xword	0x224416683d159557
	.xword	0x140340bdb382e7a0
	.xword	0x7eeb7624931267cc
	.xword	0xde4acaf43e5467ea
	.xword	0x2f52d427606bb272
	.xword	0x976cdf9cc92b8ea0
	.xword	0xb8beb1006747cb3f
	.xword	0x23e4aaf6be2b5ea1
	.xword	0xc7563eba8fd4a58e
	.xword	0x387ba21c529b2411
	.xword	0x39ea168341041819
	.xword	0x7beb1dba988b816a
	.xword	0x054a1f66242fbfaa
	.xword	0x536a3b9e6655340d
	.xword	0x94f1ac8ba7480395
	.xword	0x9c554a850a911b70
	.xword	0xd7b5e98adeb253b0
	.xword	0xa161b3cc586613d8
	.xword	0x32cdeebf0cfc2b78
	.xword	0x3f10f1d2572e9897
	.xword	0x609a98048c07f003
	.xword	0x861ff19c6929ee83
	.xword	0x185eb6d5e821a1d7
	.xword	0xea02e2f9b4648d4f
	.xword	0x95eab52a6cc011b9
	.xword	0xe3f6f576fd216cac
	.xword	0xe1497a7faa1b0c7d
	.xword	0x8c4f24fcabdd560c
	.xword	0x2b03ac50f1e8cf03
	.xword	0xd1d5d75ef58fd325
	.xword	0x13799fa7e541882d
	.xword	0x70cf038c90e816af
	.xword	0x968d88e02dc2375b
	.xword	0x710873855b913c12
	.xword	0x96540b63fc1657df
	.xword	0x184b31e0f4330460
	.xword	0xbb433dd5fdc091d9
	.xword	0x559edf676028f7e4
	.xword	0x0c47038531ce3d33
	.xword	0x11baa7bb77fe8852
	.xword	0x533d230630324b85
	.xword	0xfd6ef563879e90c4
	.xword	0x8fcbe5958311f783
	.xword	0xb0ada59dea5b95f1
	.xword	0x5a9978545b0646c7
	.xword	0xa5bedd8e299bb8d1
	.xword	0xb40ef89af333396b
	.xword	0x30ecfc8a827861db
	.xword	0x1456dc755b5d625c
	.xword	0x72c13ed84548e3bc
	.xword	0x4d2dcd93f35fc8a2
	.xword	0x29785470d6735a0e
	.xword	0x1d743f0bbf9bd02e
	.xword	0x29a74960276ec2b3
	.xword	0xbc7a43247dd6516a
	.xword	0x116ce74ce2877b0f
	.xword	0x9063f0dd4a6ebc23
	.xword	0x97349847e8c0309b
	.xword	0x40d2fe9f176ac5ed
	.xword	0x3e49c55ee07c8e88
	.xword	0xb34193560a969d5f
	.xword	0x461961491cae3542
	.xword	0x75f8ff2e2ccf81e7
	.xword	0x642909fb8bcf9167
	.xword	0x26ab4826baa18365
	.xword	0xfacb97e168ab8b74
	.xword	0x4cfbd0507db1daaa
	.xword	0xdd3763415b889e2b
	.xword	0x047b0680bb4e07dc
	.xword	0x5df0417b8add914f
	.xword	0x6e1905a6a19d1197
	.xword	0x6dffcd6cf0d35508
	.xword	0xe136bca690cdff99
	.xword	0xe90e1aceeff80ff7
	.xword	0x79faa289cc875bc7
	.xword	0xfef946306031e92c
	.xword	0xf67f9962098d5dd2
	.xword	0xba381aeb27718ac0
	.xword	0xcceeb2802d4ef611
	.xword	0x3ac4a933c1ed163b
	.xword	0xa496edfb2ef696f6
	.xword	0x1232b3aec771cf9a
	.xword	0x3c8fc8619516d48d
	.xword	0xfb02520ab36e2087
	.xword	0xd28b786b7b3cef1d
	.xword	0xb31298bc45b5937c
	.xword	0xdd57f2251712579b
	.xword	0xf0b880f84464050c
	.xword	0x23011a29db24e872
	.xword	0xe49987876b17c0da
	.xword	0xbd5924e1688cb287
	.xword	0xf918e161df8cff7c
	.xword	0x98b471fad53d84a4
	.xword	0x5158d21542eb935a
	.xword	0x3f83fe745e24bceb
	.xword	0xd935287136f95341
	.xword	0x34a283dbd510f7ed
	.xword	0x7c77f58f25e00826
	.xword	0x6816452521ecb68c
	.xword	0x865dfbcc48dafc45
	.xword	0xd7ae3bf8bff237b0
	.xword	0xaf588f1ebde9f2c9
	.xword	0x78044a415c5bdc66
	.xword	0xf21e14c4a2a5b071
	.xword	0x90a4747e64090db4
	.xword	0xc027a665589de219
	.xword	0xe24a48d1c8852d0c
	.xword	0xb5614f9dc8c5c628
	.xword	0xe46be424d008c23e
	.xword	0xe5bbb95e2c6c6493
	.xword	0xc4228960ea611f1b
	.xword	0x9ee8f7273ef0cb8d
	.xword	0xb14d2306f5847fa6
	.xword	0x0ee599c0f66e7904
	.xword	0xf31316399c914e85
	.xword	0x4200ca5028104c81
	.xword	0xb4c3b2f91fee963e
	.xword	0x1fa8e97fde1e06cf
	.xword	0x6d9d5f719a623f59
	.xword	0x841e3ec341d7ad60
	.xword	0x736094e98228cdf9
	.xword	0x822f61f12664e52c
	.xword	0x0767a2b08ea3e4f3
	.xword	0xb330b382453bf2ff
	.xword	0x15eb90f0bbe3a532
	.xword	0x895e593d66368a58
	.xword	0xbba701f5f54a0f90
	.xword	0x6f4b1dcd60eb286c
	.xword	0x4429efea00690553
	.xword	0x1f7c036e164dd9ba
	.xword	0x4831ca3dcb5f0abf
	.xword	0xa650c0955bc29e55
	.xword	0xe361a8cd24bcfd6c
	.xword	0x601dc181d2f3ba86
	.xword	0xead0baa98ffd4d39
	.xword	0xcd1103db916a3eba
	.xword	0xd798c52cd0ece2e9
	.xword	0xd1a281caab69d56c
	.xword	0x770d93a7f36bf6ba
	.xword	0x2b4d38957b8ad034
	.xword	0x95b916a98f79fdf9
	.xword	0x101cd1b294191d1b
	.xword	0x5cdd16bf679ad9ec
	.xword	0x9a46d8f182b024ce
	.xword	0x1a5ee1a3f32db354
	.xword	0x374c3bc7c7827a15
	.xword	0x0db48628ba325f75
	.xword	0x64f30ba95701b8ce
	.xword	0x9d45fca2e2522c55
	.xword	0x397ca6c5712ab053
	.xword	0x8b0ae9708a94ecab
	.xword	0x6ea8c4f58a4aef74
	.xword	0x77226966f7c3f3f4
	.xword	0x06dafe9abe1cf69b
	.xword	0xf074278168dd788f
	.xword	0xe01cec96aab0d35c
	.xword	0x1cdd6df89d6c944a
	.xword	0x7f6d4be817b6dc30
	.xword	0xa59b76b33f3f6b5d
	.xword	0x5e6aaddad4ce5ea3
	.xword	0x67bcac73fdd273d3
	.xword	0x5845c84fd5313154
	.xword	0x85fcdb7378c68f44
	.xword	0xa2c58681821e69af
	.xword	0x4d38f7cb9f07e134
	.xword	0x65cc92223ae59018
	.xword	0x655b2b2e04ab7dde
	.xword	0xb305002b023c8c9d
	.xword	0x3fd90f94a9692d30
	.xword	0xaf89823c53051350
	.xword	0xb6a15a43ac5c3cb0
	.xword	0xd0bfe37b33eace94
	.xword	0xc1056de3456813ee
	.xword	0x2d749a9da43a5b43
	.xword	0xf888e720ee7e7e00
	.xword	0xad84eb87f26ac2c9
	.xword	0x6b6f4f729f2c5e9c
	.xword	0x53124bcd84fd38dc
	.xword	0xdd368bf371458efa
	.xword	0xbb2a10d21b9550fe
	.xword	0xbda7fbc7d3c95ba1
	.xword	0xbee219b43df52829
	.xword	0xec596008c87c15e2
	.xword	0x63a182a6a5366b6b
	.xword	0xbc893e07ff12670d
	.xword	0xbb0dd94c075ef867
	.xword	0xfc80ad851c1eed59
	.xword	0x94809e03287fecc6
	.xword	0x5e00f6d65900082c
	.xword	0x0a242e96c869a4b4
	.xword	0xcdd695097230b08c
	.xword	0x113e5eef1908fe51
	.xword	0x19ffd6619d65dee4
	.xword	0x51826367cc5ab3de
	.xword	0x04a084b2a6778596
	.xword	0xac34110470469a4c
	.xword	0x0b8625adc921e1fe
	.xword	0x80e81054796df1f8
	.xword	0x76e4846ebe9f4097
	.xword	0x96676a434e0ae227
	.xword	0xf91f8f144d3fa4cd
	.xword	0xb1d02c7af964269c
	.xword	0x52f01fead075238e
	.xword	0x2a44dd47505e4cb8
	.xword	0x3421e0abab24d264
	.xword	0x948dcba8671c1c04
	.xword	0x37fdcd6abd5e1c26
	.xword	0x131d7f330902bdb5
	.xword	0x1a764d985f14eb39
	.xword	0x781f043ed219e657
	.xword	0x9aa6140402811b8e
	.xword	0xf8142a3e8e297773
	.xword	0x141ecfa826f78480
	.xword	0xe27c24edd143bb03
	.xword	0xad135b2568ff01a5
	.xword	0x9dcfe72435ae1aff
	.xword	0x241b8406aa8f7115
	.xword	0x0b52eac6589508d5
	.xword	0xbfcd27fc9efc69b2
	.xword	0x29f6f1bd9d9aeb28
	.xword	0xa3e51160f65f41a4
	.xword	0x45d6f31429f2ceb3
	.xword	0x46de0c15f7f97621
	.xword	0xba416eb930df557f
	.xword	0x80e6f2d21a9d90bd
	.xword	0xdb6701d7b6b4428d
	.xword	0x16ca9ca0cb4e7eec
	.xword	0x90e40a598c9af6ba
	.xword	0x852ac494a1796836
	.xword	0x9a7f7a9fb758c659
	.xword	0xd68d22e88d8e74f0
	.xword	0x058fb556d1d5c98a
	.xword	0x6a536b325b767041
	.xword	0x52eb8a0699a4127b
	.xword	0xd1dabe8d710c6ab8
	.xword	0x458cce1b98eaa226
	.xword	0xb72a02b62b643673
	.align 0x80000
	.data
data_start_7:

	.xword	0x3d45d6d42c330482
	.xword	0x3116f84f9882f273
	.xword	0xd9f6e1d3f3c7a61e
	.xword	0x18c250bfcf8147db
	.xword	0x504993196f529171
	.xword	0x626d24a3f4d7cff4
	.xword	0x6bb76aed1c7d303a
	.xword	0xdea56751f579d78c
	.xword	0x2f0180d9c2503886
	.xword	0xf2ece4c795d0f8c8
	.xword	0x97a05a9a83210d88
	.xword	0xb882fa925d852a97
	.xword	0xb4db7ff9dc82e38e
	.xword	0xc8857d299e51c7be
	.xword	0x00821f932ff93041
	.xword	0x4b5f3df96af3d10a
	.xword	0x579d17e912a499fd
	.xword	0x48bf96f2b6e97ab1
	.xword	0xb32a58387827131f
	.xword	0xef62f0d1bde25a76
	.xword	0x2f830306f254f830
	.xword	0xc3a5f62545568d74
	.xword	0x48306d091b5d8b6c
	.xword	0x0ae798e60638d611
	.xword	0x09fe40ecd65c1f20
	.xword	0x35e17761029efc72
	.xword	0xf74744e25841092b
	.xword	0x2e13142af81e4a21
	.xword	0x4bcea300fbccfd84
	.xword	0xfdc7da3872e9f16e
	.xword	0x472dc32c2ea39954
	.xword	0xc5e784b1856737f8
	.xword	0x51a25b0142b0ef50
	.xword	0x80ebb581d7bef5dd
	.xword	0xf4c3b2b64b681f86
	.xword	0xd6502ba2002b24f1
	.xword	0xb2046b624dab0633
	.xword	0x93f6cf62c16f74ae
	.xword	0x6d75c06641544eef
	.xword	0xd11da290762df51a
	.xword	0xdb4ebd9aa76094a9
	.xword	0x530a3bacbbaa9734
	.xword	0x1c55f9bb03bf1229
	.xword	0x60fae16fd7aaaec6
	.xword	0xd1e24db7eabeb1b6
	.xword	0x55e20904b0b1f1e9
	.xword	0xadd4770c82a2195e
	.xword	0x6b6a93e7d408484d
	.xword	0x0bcd83c0fc258b2a
	.xword	0x00365c49a22043e5
	.xword	0xe5abe61e0ac80217
	.xword	0x14ee6501f2356cf6
	.xword	0x824d805d7a74814c
	.xword	0xc427770b4af2044f
	.xword	0x79d9321c64c46e75
	.xword	0xd3f8a19ae5b86248
	.xword	0xb78120625e889da9
	.xword	0xb8791a942435e0af
	.xword	0x7442aa7745ccfeaf
	.xword	0x1f68fc2c2d4d03c4
	.xword	0x01c9592694f5519f
	.xword	0x82c8d4b902bf0488
	.xword	0xafde7f7af6d2470f
	.xword	0x5191d32150866b43
	.xword	0xeca5301e04323ef8
	.xword	0x80b19a3e7ec7d4c8
	.xword	0xf979ada87f498d87
	.xword	0x852219b5a177380d
	.xword	0x30dadf183a6391b1
	.xword	0x821a2722a63b6e15
	.xword	0x65331c36d7d81bce
	.xword	0x07beeb84aebb9033
	.xword	0x8e17630bced92a0f
	.xword	0x91c5ab951c1ebe4c
	.xword	0x295adc63967f8e6a
	.xword	0x071e1da705e8914b
	.xword	0xb6ac1571c16f92be
	.xword	0x1f4003106ab7d94f
	.xword	0x4e93223cf9d434c7
	.xword	0x93bb30443d074d20
	.xword	0x9a9c838bf77c0ec7
	.xword	0x1bbd43cf3cecefd4
	.xword	0x775a3f0169b3c5c9
	.xword	0x3fa28110b655bd00
	.xword	0x1861fc02f2a7b21c
	.xword	0x4cedbf72369855a4
	.xword	0x59b755058bc6330e
	.xword	0x08785da211a194e1
	.xword	0xb2b6eb8de4c296d0
	.xword	0x1e1119126c582600
	.xword	0x6a3b07ebf284eafe
	.xword	0x54085f11b0b2b1c3
	.xword	0x0ffc212fa30590e2
	.xword	0x86a98bd38816f373
	.xword	0xa702f449ba33d145
	.xword	0x1533f3a4837a68b0
	.xword	0x55b17b2c18948fd5
	.xword	0xd792630ad680d3a4
	.xword	0x4cef2f676662ab5b
	.xword	0xc65177de411ee76c
	.xword	0x584fd7ed9925da87
	.xword	0x7c2dab1da206224f
	.xword	0x7bea9d3658c73ec7
	.xword	0xa20fe8cb17716393
	.xword	0xd7c8a359c5903b14
	.xword	0x88960109e3a93b06
	.xword	0x1c48c88b5ba32ced
	.xword	0xc09177de8b278169
	.xword	0x0e4f99f11fc8cb8f
	.xword	0x74d3d80326c5a8e2
	.xword	0x4b4ce24af5cd9328
	.xword	0xc1be36ecc05aaa85
	.xword	0x02bccf87cdcc54ca
	.xword	0xe4a27a2096a1a065
	.xword	0x2bad1d797e2ffac2
	.xword	0xee9bedaa17ee266b
	.xword	0xa4b781e288bb1cca
	.xword	0x76ae72a42d1ebdb8
	.xword	0xc563cd60749354f1
	.xword	0x4ad97b956aa2ebd8
	.xword	0x32579932923bebdb
	.xword	0x8574704a9e51b686
	.xword	0x4ed1c526973aed96
	.xword	0xb50deb63ba76229e
	.xword	0x79ce7228231d15bf
	.xword	0xc8ef773466fbe4eb
	.xword	0x70580a33b4ef9a69
	.xword	0xb70137dc2a57d6fc
	.xword	0xf3a8cecd723f9b8f
	.xword	0x1c04070d3be613f2
	.xword	0xfda2c9d5377ae6eb
	.xword	0x116eeb81609e8f1b
	.xword	0x0fe30d23b5827e76
	.xword	0x4816ad6cb62edb28
	.xword	0x4616ae81895b2350
	.xword	0xb330b809a06ed495
	.xword	0x301b6d92ec7de971
	.xword	0x1cf7814bc025d6cf
	.xword	0x36f972feb50220dd
	.xword	0x74ecd20fbd106adb
	.xword	0x1f844dd8d649aa94
	.xword	0x97646c7fd7a72c95
	.xword	0x3f48203a3d8166cf
	.xword	0xc5c534f16a21d476
	.xword	0xdfc8334d5a9dbd13
	.xword	0x87acfe4ed0a83431
	.xword	0x733c1ee63c837492
	.xword	0xeee8f9fccc781aeb
	.xword	0xdb9543477321bc5f
	.xword	0x2626da0af41c9120
	.xword	0xfc8ab5ba0c23ce18
	.xword	0xfd9c3d045d718243
	.xword	0x55d5739fa08ca4d7
	.xword	0xad07c208088099ca
	.xword	0x1803441f0d961ef9
	.xword	0xf73e5a47f26f6f84
	.xword	0xf32810d682473e08
	.xword	0x140a8a7aff84ee36
	.xword	0x24d26f9ac7496bbe
	.xword	0xfd3805ffbc64bee3
	.xword	0xc19d5cf774846b66
	.xword	0x33598966c747295f
	.xword	0xb765b46039397917
	.xword	0x58d63f9d6d25d82a
	.xword	0xfd63738f37628fb4
	.xword	0x1f908141eb3a5153
	.xword	0x6a40c2e162bb5111
	.xword	0x12408f6cd2bfa8e3
	.xword	0x1c53eef1a3e98e5e
	.xword	0xcbbf480b4e33f1da
	.xword	0x18c345d703f5ba3d
	.xword	0x6f657e89e6ed60e4
	.xword	0x2e1636d7835b4ec1
	.xword	0xe6fabad7bfa79f99
	.xword	0x4dd5a77a4ab9bd65
	.xword	0x6ee4bc4dcea1fa36
	.xword	0xe075e877767178e9
	.xword	0x0e28c346b93cbe6a
	.xword	0x0b4eea565c687f41
	.xword	0xf2ffb67f99703bfb
	.xword	0xab2df9829da4e9c5
	.xword	0x24d7306f42c68c75
	.xword	0x8aa057d3430e52aa
	.xword	0x2d663cabf0bff244
	.xword	0xf98c563e0736800b
	.xword	0xa0282b5ea8ed0f33
	.xword	0xdfafcb542b4d6933
	.xword	0x8905b9ad57fede8a
	.xword	0x1640cab42342e85c
	.xword	0xd413776bf72190f2
	.xword	0xb4a72d4e6d460aa4
	.xword	0x8f7b7ab98ff4b3c7
	.xword	0x9c0cc2b85af72c2d
	.xword	0x78c2b372664359fd
	.xword	0x1bd3bf15fab04031
	.xword	0x4f0e85da6b15b515
	.xword	0xceb25dbd7669c9f3
	.xword	0x7c24cb0d4ab38597
	.xword	0x6b631f6a801e979c
	.xword	0x0ea58390c4e6c6c1
	.xword	0xd266ff7545dd44fb
	.xword	0x3c1088e4f329e810
	.xword	0xb17107fe4675fb7f
	.xword	0xf0a559052dffc49c
	.xword	0x6bc5b4c2cd4c906d
	.xword	0x103f9a6a3fdf2b9d
	.xword	0x28b14bf7c95c0fa4
	.xword	0x38e55493d38234df
	.xword	0x05b8a62895b7dde7
	.xword	0xe9c17f464e13f448
	.xword	0x772c56b3ff0c9652
	.xword	0x033a910ba934c44a
	.xword	0x74520152fa690fe6
	.xword	0x0494bd58451c7820
	.xword	0x3bb1b6ef0ee17af3
	.xword	0x744a24da1cdca778
	.xword	0x8bcf2c4893867739
	.xword	0x22f75654e4ceec53
	.xword	0x3aae671a2efdac5f
	.xword	0xd9d1fd0b9699e663
	.xword	0x533c23b6ee472ae7
	.xword	0xe05d470b3f7f29ac
	.xword	0xd6e90bc11a6babfc
	.xword	0xeb3e2bc2a74a7eb9
	.xword	0xeb78b0b7bc3079bd
	.xword	0x8a5396ded1ef8ada
	.xword	0x40566bc259a3c1c4
	.xword	0xacf3d92aa1478a20
	.xword	0xde5e2fd527d1f5ae
	.xword	0x0c9f6952ad7e3537
	.xword	0x309d71ee7d30b78e
	.xword	0x19be96fb92129d13
	.xword	0xf5d4ca4791f026be
	.xword	0xf64529e93fd9e925
	.xword	0x8d528f2d04e61479
	.xword	0x0c2aa33c12a2d657
	.xword	0x1880c42dfc2db310
	.xword	0x421b1ca92a226df2
	.xword	0xa1ba28c187ae49c0
	.xword	0x953d8c9a546085e5
	.xword	0x751e5bfc3f41d219
	.xword	0x30dc112d66980cc7
	.xword	0xb733bef1ef352008
	.xword	0x0536d2baa6a9e7e8
	.xword	0xf38a9dd4064f0b30
	.xword	0x311ec0797a4825eb
	.xword	0xce597f8cf17c1586
	.xword	0xf51def381c24ba09
	.xword	0x2ed36bf38cd2c1b7
	.xword	0x1b9a4471cd28a95d
	.xword	0x613081a1b5a5e5ef
	.xword	0xd572fc2e9faeacc1
	.xword	0xc436890f5c1d50fc
	.xword	0xe43696592ebfea0a
	.xword	0x9bde81763bba9d8b
	.xword	0x5242130cdbcfddab



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
