// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_13_s2.s
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
   random seed:	495018364
   Jal tlu_multi_mix_2_thint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
        rdpr    %tpc, %g1; \
        rdpr    %tnpc, %g2; \
        rdpr    %tstate, %g3; \
        rdpr    %gl, %g4; \
        rdpr    %tl, %g5; \
        rdhpr   %htstate, %g6; \
        nop; \
        done

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0xf006760345dbf7e6, %g1, %g0
	setx 0x9cbf4b2c05315e54, %g1, %g1
	setx 0x781b83ae559a4470, %g1, %g2
	setx 0x9a4995a8f4baea08, %g1, %g3
	setx 0xc0750528a0b74834, %g1, %g4
	setx 0xe1d10d32bd8ea571, %g1, %g5
	setx 0x37cb097efb73aa1a, %g1, %g6
	setx 0x8fe157e9ca48070a, %g1, %g7
	setx 0xc75e7517ac290641, %g1, %r16
	setx 0x15a90b4f27c64be5, %g1, %r17
	setx 0x5048655a97a68b6d, %g1, %r18
	setx 0xdec2e3839b412243, %g1, %r19
	setx 0x4531026e01b572a7, %g1, %r20
	setx 0x283ac6c86e71f2dd, %g1, %r21
	setx 0xdb5eaefdf8673800, %g1, %r22
	setx 0x7e7ee15599fab513, %g1, %r23
	setx 0x79f16913a546bb17, %g1, %r24
	setx 0x7f4bf75de4a0f9b3, %g1, %r25
	setx 0x54efb7d2b4157fc4, %g1, %r26
	setx 0xe42d29e275b31b7a, %g1, %r27
	setx 0xcf5ad5e2cab9b3ef, %g1, %r28
	setx 0x21f0dc146bd7b1b8, %g1, %r29
	setx 0xaab2df7b4cd91f1e, %g1, %r30
	setx 0x3508a0bf6403c52d, %g1, %r31
	save
	setx 0x7466d69c46ca1bc4, %g1, %r16
	setx 0x66163c26c345e8b3, %g1, %r17
	setx 0xdf308bb014504e3f, %g1, %r18
	setx 0x4bd0dd9ccb3ff86a, %g1, %r19
	setx 0xeb5f3a1ce74d6ebc, %g1, %r20
	setx 0x606300bc70ed46b1, %g1, %r21
	setx 0x0ed9e3ca753002bf, %g1, %r22
	setx 0xa9dc864cd72841ff, %g1, %r23
	setx 0x2e37acd23ca7a5e4, %g1, %r24
	setx 0xcf2794af3e279773, %g1, %r25
	setx 0x857163329f873875, %g1, %r26
	setx 0x4e9a27221140b866, %g1, %r27
	setx 0xb7d62656a0802f4a, %g1, %r28
	setx 0x4c1c4b094ccd275a, %g1, %r29
	setx 0xad256f22960fdda8, %g1, %r30
	setx 0x845fea3b12153eb2, %g1, %r31
	save
	setx 0xd820246a66ba5d15, %g1, %r16
	setx 0xfdf925b91f88c2a9, %g1, %r17
	setx 0xc8981928abd69893, %g1, %r18
	setx 0x5988620e317987ea, %g1, %r19
	setx 0xfba43555f11bc5ba, %g1, %r20
	setx 0x6ccdc5ae35c5b525, %g1, %r21
	setx 0xf86fa265a105ee7d, %g1, %r22
	setx 0x7cc39b6b8f97cf8f, %g1, %r23
	setx 0x47ed1b8533a4d729, %g1, %r24
	setx 0xb5689e88f54c8a2a, %g1, %r25
	setx 0xcfae386156e49001, %g1, %r26
	setx 0x5b9530343a000c2d, %g1, %r27
	setx 0xad5df863e509d0a4, %g1, %r28
	setx 0x7869264ed9a78207, %g1, %r29
	setx 0xaafd06849874ee39, %g1, %r30
	setx 0x3e218df765f994cd, %g1, %r31
	save
	setx 0x3ee932f231fc5d8d, %g1, %r16
	setx 0x1ab9d1043d5befb9, %g1, %r17
	setx 0x8520088f0b7eb863, %g1, %r18
	setx 0xe7d703d3bfec01e9, %g1, %r19
	setx 0x837aabc8ebddae6e, %g1, %r20
	setx 0xb92c4e6917736136, %g1, %r21
	setx 0x2412eacc652a9fc8, %g1, %r22
	setx 0x994bddc17af1ab10, %g1, %r23
	setx 0xf5a3e3cea5362bd9, %g1, %r24
	setx 0xd785914378ee8c7a, %g1, %r25
	setx 0x3318feea5b938144, %g1, %r26
	setx 0x63017b858cd11bd6, %g1, %r27
	setx 0x495756fa76ffafbc, %g1, %r28
	setx 0xdaea16d504f0e1a0, %g1, %r29
	setx 0x5b2c5344b2126cba, %g1, %r30
	setx 0x8148dc242d657061, %g1, %r31
	save
	setx 0x8999022b8d9b13ca, %g1, %r16
	setx 0x952f41134e38249e, %g1, %r17
	setx 0xed543e9b1fdff37a, %g1, %r18
	setx 0xf04a2ccd62d5a239, %g1, %r19
	setx 0x7b4756f05f06ac89, %g1, %r20
	setx 0x2a4f9d009d3ab4f8, %g1, %r21
	setx 0x8be5d4561a6bb723, %g1, %r22
	setx 0xfd1674e97ca368f2, %g1, %r23
	setx 0x7fb75bbc9cf6cde6, %g1, %r24
	setx 0x0504be810e2cbd3e, %g1, %r25
	setx 0xdf891af086a760b6, %g1, %r26
	setx 0xabe3a4812f664440, %g1, %r27
	setx 0x2285f78ccb1e9777, %g1, %r28
	setx 0x4a2269f8d290fd1e, %g1, %r29
	setx 0x49b66e2ee46c2710, %g1, %r30
	setx 0x8c142120b9837214, %g1, %r31
	save
	setx 0xce2a3131ca2dc616, %g1, %r16
	setx 0xd7155f37ff6e4a30, %g1, %r17
	setx 0x8fc5aab2f58c5678, %g1, %r18
	setx 0x304c702f1bdd0ac7, %g1, %r19
	setx 0x5a837c313cba976b, %g1, %r20
	setx 0x485b763849156941, %g1, %r21
	setx 0x9019dfcc60636d7c, %g1, %r22
	setx 0x56cedaa33383afb7, %g1, %r23
	setx 0xe2f991db32738074, %g1, %r24
	setx 0xad5777bc48720038, %g1, %r25
	setx 0xce3cc73e11a8d1eb, %g1, %r26
	setx 0xa5a7365040f49c89, %g1, %r27
	setx 0x40a1e2734c600e3f, %g1, %r28
	setx 0xc0fa9551a81e4d67, %g1, %r29
	setx 0x301a43d47ec57aa0, %g1, %r30
	setx 0x46801ed56ad45cfe, %g1, %r31
	save
	setx 0x6adde49eb35c196c, %g1, %r16
	setx 0x8cd5d30b2874f375, %g1, %r17
	setx 0x67ae8e8546bcee04, %g1, %r18
	setx 0xe7b5d0a0026eaea2, %g1, %r19
	setx 0x7a827ea3312a2c6a, %g1, %r20
	setx 0x0293ec08c89e425f, %g1, %r21
	setx 0x041b9be396c95652, %g1, %r22
	setx 0x9791cf1f403b4dcf, %g1, %r23
	setx 0xe9c1f5b94161298d, %g1, %r24
	setx 0x02e403f2e7307e4c, %g1, %r25
	setx 0xf6cda0f8670f6a7e, %g1, %r26
	setx 0x1073fc4723c6d13a, %g1, %r27
	setx 0xac978bda2304c81b, %g1, %r28
	setx 0x3322659d085b52eb, %g1, %r29
	setx 0xa088507c007276fe, %g1, %r30
	setx 0x1688644e3c57d83e, %g1, %r31
	save
	setx 0x221965abfa013d62, %g1, %r16
	setx 0xf7de03066d8f5c2b, %g1, %r17
	setx 0x0ef2a0b4e20dc054, %g1, %r18
	setx 0x4a5fb422a1b823de, %g1, %r19
	setx 0x2f521afad1d64a8a, %g1, %r20
	setx 0x55cbfeee47b1c857, %g1, %r21
	setx 0xa7f7c8881b0b31a9, %g1, %r22
	setx 0x3bf8007687b1afa4, %g1, %r23
	setx 0x456e514aee1b564c, %g1, %r24
	setx 0xf0d1d6405a1cc62e, %g1, %r25
	setx 0xe120885f06b400a2, %g1, %r26
	setx 0x872216498ee09a54, %g1, %r27
	setx 0xb9e4957ab4e837a2, %g1, %r28
	setx 0x038622284d51cc04, %g1, %r29
	setx 0x0bfc42cabb2ae942, %g1, %r30
	setx 0x42c01b0b8b9b77c9, %g1, %r31
	ta	T_CHANGE_HPRIV
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
	.word 0xb6bc6019  ! 1: XNORcc_I	xnorcc 	%r17, 0x0019, %r27
	.word 0xb5e5a040  ! 3: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8394e00f  ! 4: WRPR_TNPC_I	wrpr	%r19, 0x000f, %tnpc
	.word 0xbde520e8  ! 5: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e52129  ! 6: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e4e04b  ! 10: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbc340000  ! 11: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xb3e4a09a  ! 13: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbf480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfe5e075  ! 15: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x879461dd  ! 20: WRPR_TT_I	wrpr	%r17, 0x01dd, %tt
	.word 0xb5e5e16c  ! 22: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_7, %g1, %r17
	.word 0xbbe561e8  ! 30: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a155  ! 33: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4203b  ! 36: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbcbd0000  ! 38: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xb7e521f2  ! 39: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe520bf  ! 42: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d946143  ! 45: WRPR_PSTATE_I	wrpr	%r17, 0x0143, %pstate
	.word 0xb9e521d6  ! 48: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e46107  ! 50: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x9195e193  ! 53: WRPR_PIL_I	wrpr	%r23, 0x0193, %pil
	.word 0xbde520cd  ! 54: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x819520c0  ! 57: WRPR_TPC_I	wrpr	%r20, 0x00c0, %tpc
	.word 0xbf51c000  ! 62: RDPR_TL	<illegal instruction>
	.word 0xbbe4a0d9  ! 67: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb52c4000  ! 68: SLL_R	sll 	%r17, %r0, %r26
	.word 0x9195e09b  ! 69: WRPR_PIL_I	wrpr	%r23, 0x009b, %pil
	.word 0x8d94e1b1  ! 71: WRPR_PSTATE_I	wrpr	%r19, 0x01b1, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xb3540000  ! 74: RDPR_GL	<illegal instruction>
	.word 0xb7e5e142  ! 75: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e4a0fc  ! 79: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4a037  ! 82: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9500000  ! 86: RDPR_TPC	<illegal instruction>
	.word 0xb7e5a049  ! 87: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4a161  ! 89: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0x89956081  ! 92: WRPR_TICK_I	wrpr	%r21, 0x0081, %tick
	.word 0x8d9420ea  ! 93: WRPR_PSTATE_I	wrpr	%r16, 0x00ea, %pstate
	.word 0xbd480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	2, %r12
	.word 0x8f932000  ! 95: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba3ca196  ! 99: XNOR_I	xnor 	%r18, 0x0196, %r29
	.word 0xb7518000  ! 101: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5a0c9  ! 104: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5e187  ! 105: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e42168  ! 108: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e52008  ! 110: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4a1b7  ! 112: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e46077  ! 114: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a15f  ! 116: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb43c0000  ! 118: XNOR_R	xnor 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xbf520000  ! 122: RDPR_PIL	<illegal instruction>
	.word 0xbfe5e0ba  ! 124: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e055  ! 131: SAVE_I	save	%r23, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 134: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r18
	.word 0xbf641800  ! 137: MOVcc_R	<illegal instruction>
	.word 0xb1e421dc  ! 141: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5e14d  ! 143: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5e052  ! 149: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e46033  ! 150: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e05a  ! 158: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4a02e  ! 162: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5e08d  ! 163: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4a026  ! 165: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba140000  ! 171: OR_R	or 	%r16, %r0, %r29
	.word 0xb5e421de  ! 174: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_5, %g1, %r23
	.word 0xbbe4213c  ! 176: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a063  ! 180: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4e0b0  ! 184: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a032  ! 189: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5a1a3  ! 190: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4211e  ! 191: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0xbde420ff  ! 194: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xba1c0000  ! 198: XOR_R	xor 	%r16, %r0, %r29
	.word 0x8795a1a4  ! 199: WRPR_TT_I	wrpr	%r22, 0x01a4, %tt
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43c4000  ! 202: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xb5e52066  ! 203: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5a180  ! 204: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e46104  ! 208: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb735d000  ! 209: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xb3520000  ! 210: RDPR_PIL	<illegal instruction>
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a12c  ! 212: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbf540000  ! 214: RDPR_GL	<illegal instruction>
	.word 0x859461aa  ! 215: WRPR_TSTATE_I	wrpr	%r17, 0x01aa, %tstate
	.word 0xbfe520fe  ! 216: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde520c5  ! 221: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7500000  ! 223: RDPR_TPC	<illegal instruction>
	.word 0x8995a15d  ! 225: WRPR_TICK_I	wrpr	%r22, 0x015d, %tick
	.word 0xb9e5e081  ! 227: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe46117  ! 229: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e420cd  ! 233: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8994e1d4  ! 239: WRPR_TICK_I	wrpr	%r19, 0x01d4, %tick
	.word 0xb5643801  ! 242: MOVcc_I	<illegal instruction>
	.word 0xb9e4a0ce  ! 245: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_5, %g1, %r17
	.word 0xbde5a1bc  ! 253: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5e1da  ! 254: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4e094  ! 259: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5e176  ! 260: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8195e1f3  ! 261: WRPR_TPC_I	wrpr	%r23, 0x01f3, %tpc
	setx	data_start_0, %g1, %r16
	.word 0xb32c4000  ! 263: SLL_R	sll 	%r17, %r0, %r25
	.word 0xbfe521cd  ! 269: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4a132  ! 270: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3480000  ! 273: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9e56139  ! 274: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a012  ! 279: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e5e0b5  ! 282: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5a164  ! 283: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb2250000  ! 288: SUB_R	sub 	%r20, %r0, %r25
	.word 0xbbe52090  ! 291: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x899560a0  ! 294: WRPR_TICK_I	wrpr	%r21, 0x00a0, %tick
	.word 0xbd51c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xbde5a0ac  ! 297: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983e4b  ! 298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4b, %hpstate
	.word 0xb5e460bb  ! 299: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4608b  ! 300: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb97d6401  ! 304: MOVR_I	movre	%r21, 0x1, %r28
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a170  ! 306: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e42013  ! 307: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x859521b2  ! 312: WRPR_TSTATE_I	wrpr	%r20, 0x01b2, %tstate
	.word 0xbfe4e004  ! 313: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4219a  ! 314: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0x87942104  ! 321: WRPR_TT_I	wrpr	%r16, 0x0104, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e52021  ! 334: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5e11d  ! 335: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8995e089  ! 336: WRPR_TICK_I	wrpr	%r23, 0x0089, %tick
	.word 0x85956017  ! 338: WRPR_TSTATE_I	wrpr	%r21, 0x0017, %tstate
	.word 0xbde5e0b6  ! 340: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_2, %g1, %r16
	.word 0xbbe5a170  ! 345: SAVE_I	save	%r22, 0x0001, %r29
	setx	data_start_1, %g1, %r19
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xb7e4203f  ! 356: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf520000  ! 359: RDPR_PIL	<illegal instruction>
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a055  ! 361: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb0b44000  ! 363: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xb3e4a1d8  ! 366: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb1518000  ! 370: RDPR_PSTATE	<illegal instruction>
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e56112  ! 375: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5a0fa  ! 376: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5602d  ! 377: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	.word 0xb5e5a089  ! 382: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbd641800  ! 383: MOVcc_R	<illegal instruction>
	.word 0xbbe56180  ! 384: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461a9  ! 392: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a101  ! 393: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 397: RDPR_GL	<illegal instruction>
	.word 0xb9e5e1fa  ! 400: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_3, %g1, %r20
	.word 0xb7500000  ! 409: RDPR_TPC	<illegal instruction>
	.word 0xbbe4e06e  ! 410: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe560f2  ! 416: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e521eb  ! 417: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56171  ! 419: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e52066  ! 423: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e520c8  ! 425: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x819521c6  ! 428: WRPR_TPC_I	wrpr	%r20, 0x01c6, %tpc
	setx	data_start_1, %g1, %r18
	.word 0xbde42173  ! 432: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4a0c4  ! 433: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf510000  ! 435: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a1cc  ! 440: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb60561e9  ! 444: ADD_I	add 	%r21, 0x01e9, %r27
	mov	0, %r14
	.word 0xa193a000  ! 446: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x9194e0fb  ! 449: WRPR_PIL_I	wrpr	%r19, 0x00fb, %pil
	.word 0xb3e5a130  ! 451: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982f49  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f49, %hpstate
	.word 0xbc34610c  ! 456: ORN_I	orn 	%r17, 0x010c, %r30
	.word 0xb5510000  ! 457: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a110  ! 460: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a177  ! 465: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8794e0c8  ! 473: WRPR_TT_I	wrpr	%r19, 0x00c8, %tt
	.word 0xbbe52125  ! 475: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e521e6  ! 479: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde46096  ! 480: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4e0d3  ! 481: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb750c000  ! 485: RDPR_TT	<illegal instruction>
	.word 0x8995a0cc  ! 486: WRPR_TICK_I	wrpr	%r22, 0x00cc, %tick
	.word 0xbe044000  ! 492: ADD_R	add 	%r17, %r0, %r31
	.word 0xbfe5a185  ! 494: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbe35c000  ! 497: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xba0ca1ec  ! 501: AND_I	and 	%r18, 0x01ec, %r29
	.word 0xb7504000  ! 504: RDPR_TNPC	<illegal instruction>
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb804e17f  ! 508: ADD_I	add 	%r19, 0x017f, %r28
	.word 0xb5e4607a  ! 509: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe461f2  ! 510: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbd51c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xb3e52166  ! 514: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5e089  ! 516: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5e072  ! 517: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3480000  ! 518: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3e46198  ! 520: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2340000  ! 522: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xbde4a00d  ! 528: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe56165  ! 531: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb81461eb  ! 535: OR_I	or 	%r17, 0x01eb, %r28
	.word 0xb7e4a0ca  ! 537: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e560dd  ! 538: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5e199  ! 540: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5e07f  ! 542: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb68cc000  ! 543: ANDcc_R	andcc 	%r19, %r0, %r27
	.word 0xb3e4a16d  ! 544: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4614b  ! 546: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e56063  ! 548: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe46068  ! 550: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe46128  ! 551: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4e187  ! 553: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5a1b3  ! 556: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4e054  ! 558: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x9195a116  ! 559: WRPR_PIL_I	wrpr	%r22, 0x0116, %pil
	.word 0xbfe5a0d6  ! 566: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbf50c000  ! 569: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c5b  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5b, %hpstate
	.word 0xb8358000  ! 572: SUBC_R	orn 	%r22, %r0, %r28
	.word 0xb7e4a098  ! 574: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd50c000  ! 576: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f5b  ! 577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0xb1e4a0db  ! 578: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5e04a  ! 580: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_7, %g1, %r16
	.word 0x8595a135  ! 583: WRPR_TSTATE_I	wrpr	%r22, 0x0135, %tstate
	.word 0xb1e4e085  ! 586: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xbfe521ab  ! 593: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb2b4c000  ! 594: SUBCcc_R	orncc 	%r19, %r0, %r25
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4603c  ! 607: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2352083  ! 609: ORN_I	orn 	%r20, 0x0083, %r25
	setx	0x30319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 615: RDPR_TPC	<illegal instruction>
	.word 0xb1e4202c  ! 620: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1dd  ! 623: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e421a8  ! 624: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4a066  ! 625: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbe248000  ! 629: SUB_R	sub 	%r18, %r0, %r31
	.word 0xb1e520b0  ! 631: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5a13e  ! 638: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a06b  ! 643: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e521cd  ! 644: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e521a7  ! 645: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe461c4  ! 646: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x879460a2  ! 648: WRPR_TT_I	wrpr	%r17, 0x00a2, %tt
	mov	1, %r14
	.word 0xa193a000  ! 649: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0x8d94e149  ! 656: WRPR_PSTATE_I	wrpr	%r19, 0x0149, %pstate
	.word 0xb3e4a0c2  ! 659: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982fc3  ! 660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e93  ! 663: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0xb7e4608c  ! 664: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde5203b  ! 665: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e5a03f  ! 669: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5a1c5  ! 670: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4e01f  ! 671: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1a5  ! 677: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2a48000  ! 682: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xbd510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xb7e4606b  ! 684: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a023  ! 687: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5611f  ! 691: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52150  ! 693: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794609b  ! 697: WRPR_TT_I	wrpr	%r17, 0x009b, %tt
	.word 0xb5e42116  ! 699: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e521cf  ! 700: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbf500000  ! 703: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198385b  ! 705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185b, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xbf504000  ! 722: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4e16b  ! 723: SAVE_I	save	%r19, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 725: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95e18e  ! 726: WRPR_PSTATE_I	wrpr	%r23, 0x018e, %pstate
	.word 0xb7e52172  ! 727: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde561a8  ! 731: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8795e031  ! 734: WRPR_TT_I	wrpr	%r23, 0x0031, %tt
	.word 0xb9e5e1b0  ! 735: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a132  ! 737: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1c7  ! 741: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a0ba  ! 753: WRPR_TSTATE_I	wrpr	%r22, 0x00ba, %tstate
	.word 0xb7e460ed  ! 754: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1508000  ! 755: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e42026  ! 756: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a066  ! 763: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 766: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4e09b  ! 769: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe520c2  ! 772: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5a10d  ! 775: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e561e5  ! 779: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e461f0  ! 780: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4e091  ! 782: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e460bd  ! 783: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x819421c9  ! 784: WRPR_TPC_I	wrpr	%r16, 0x01c9, %tpc
	.word 0xb8454000  ! 786: ADDC_R	addc 	%r21, %r0, %r28
	.word 0xb5e5a1d1  ! 791: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb32c1000  ! 793: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xb9e5e111  ! 796: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb8848000  ! 798: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xb28d4000  ! 802: ANDcc_R	andcc 	%r21, %r0, %r25
	setx	data_start_0, %g1, %r21
	.word 0xb7e4e1b7  ! 806: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0ce  ! 809: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x1011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 816: RDPR_TL	<illegal instruction>
	.word 0xb7e4e0e2  ! 823: SAVE_I	save	%r19, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 826: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8d95218a  ! 830: WRPR_PSTATE_I	wrpr	%r20, 0x018a, %pstate
	.word 0xb1e5a18a  ! 832: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8795a15b  ! 833: WRPR_TT_I	wrpr	%r22, 0x015b, %tt
	.word 0xbfe4a149  ! 840: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5a1af  ! 841: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3520000  ! 843: RDPR_PIL	<illegal instruction>
	.word 0xb9e521d6  ! 844: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52199  ! 848: SAVE_I	save	%r20, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 851: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4a153  ! 852: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e461c6  ! 853: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6848000  ! 854: ADDcc_R	addcc 	%r18, %r0, %r27
	setx	data_start_2, %g1, %r18
	.word 0xbbe5a084  ! 861: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e1c0  ! 864: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde461f6  ! 865: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4a139  ! 866: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5e196  ! 874: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbb480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb21c60d9  ! 881: XOR_I	xor 	%r17, 0x00d9, %r25
	.word 0xb1e461d9  ! 884: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8394600a  ! 886: WRPR_TNPC_I	wrpr	%r17, 0x000a, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5e0e1  ! 892: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe4a175  ! 893: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd508000  ! 894: RDPR_TSTATE	<illegal instruction>
	.word 0xb9510000  ! 896: RDPR_TICK	<illegal instruction>
	.word 0xb7e460cf  ! 897: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xb3e4e14d  ! 903: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb895c000  ! 905: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xb2354000  ! 907: SUBC_R	orn 	%r21, %r0, %r25
	mov	1, %r14
	.word 0xa193a000  ! 908: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5a08b  ! 909: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a1de  ! 911: WRPR_PSTATE_I	wrpr	%r18, 0x01de, %pstate
	.word 0x839420be  ! 912: WRPR_TNPC_I	wrpr	%r16, 0x00be, %tnpc
	.word 0x89942173  ! 916: WRPR_TICK_I	wrpr	%r16, 0x0173, %tick
	.word 0xbfe421b3  ! 917: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_3, %g1, %r18
	.word 0xb5e461fb  ! 924: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb351c000  ! 925: RDPR_TL	<illegal instruction>
	.word 0x87956069  ! 928: WRPR_TT_I	wrpr	%r21, 0x0069, %tt
	.word 0xbde42129  ! 930: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a063  ! 931: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4e192  ! 933: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb434c000  ! 934: ORN_R	orn 	%r19, %r0, %r26
	.word 0xb150c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xbbe4e1c7  ! 941: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbcbd8000  ! 942: XNORcc_R	xnorcc 	%r22, %r0, %r30
	.word 0xbbe420ea  ! 949: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5a10c  ! 952: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_4, %g1, %r22
	.word 0xb0b54000  ! 958: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xbe8d0000  ! 959: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xbde56037  ! 961: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e460ec  ! 970: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e5a17d  ! 971: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5e03c  ! 972: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe4201e  ! 974: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb03521e1  ! 975: SUBC_I	orn 	%r20, 0x01e1, %r24
	.word 0xb1e5203d  ! 980: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e420fb  ! 981: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4a017  ! 982: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbab40000  ! 983: SUBCcc_R	orncc 	%r16, %r0, %r29
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1fe  ! 988: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5a0e8  ! 996: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5500000  ! 1004: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 1005: RDPR_TSTATE	<illegal instruction>
	.word 0xb645c000  ! 1006: ADDC_R	addc 	%r23, %r0, %r27
	.word 0xb1e5a078  ! 1010: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xba248000  ! 1012: SUB_R	sub 	%r18, %r0, %r29
	.word 0xb8b4a0a3  ! 1013: SUBCcc_I	orncc 	%r18, 0x00a3, %r28
	.word 0xbf518000  ! 1016: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e18d  ! 1018: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde420f6  ! 1019: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd34d000  ! 1021: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xb9e521ac  ! 1025: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0d20ac  ! 1037: AND_I	and 	%r20, 0x00ac, %r31
	.word 0xbbe4e0e5  ! 1038: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb7d6401  ! 1040: MOVR_I	movre	%r21, 0x1, %r29
	.word 0xba24601d  ! 1044: SUB_I	sub 	%r17, 0x001d, %r29
	.word 0xbde4614a  ! 1045: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8195a147  ! 1050: WRPR_TPC_I	wrpr	%r22, 0x0147, %tpc
	.word 0x8194a09f  ! 1051: WRPR_TPC_I	wrpr	%r18, 0x009f, %tpc
	.word 0xb551c000  ! 1052: RDPR_TL	<illegal instruction>
	.word 0xb434219b  ! 1062: ORN_I	orn 	%r16, 0x019b, %r26
	.word 0xb5e4e081  ! 1065: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8994a0bf  ! 1068: WRPR_TICK_I	wrpr	%r18, 0x00bf, %tick
	.word 0xbde4a0ad  ! 1070: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4605d  ! 1073: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e461b2  ! 1074: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e5208c  ! 1075: SAVE_I	save	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f9b  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9b, %hpstate
	.word 0xb7e4e102  ! 1081: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e461fe  ! 1090: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a0e1  ! 1093: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4e1ae  ! 1094: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e421b7  ! 1095: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e421d5  ! 1096: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 1103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xbde4a114  ! 1106: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf50c000  ! 1107: RDPR_TT	<illegal instruction>
	.word 0xb1e56144  ! 1108: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e420cb  ! 1110: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4a090  ! 1111: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe420f0  ! 1115: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5a0d1  ! 1116: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb6b40000  ! 1123: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb09d4000  ! 1125: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xb5e4a087  ! 1130: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5212d  ! 1131: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8795e0d0  ! 1136: WRPR_TT_I	wrpr	%r23, 0x00d0, %tt
	.word 0xb7e4e1f8  ! 1137: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xbbe420fb  ! 1142: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56051  ! 1151: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9500000  ! 1154: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 1155: RDPR_TT	<illegal instruction>
	.word 0xb92d3001  ! 1156: SLLX_I	sllx	%r20, 0x0001, %r28
	.word 0xb3e5a17c  ! 1157: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9518000  ! 1160: RDPR_PSTATE	<illegal instruction>
	.word 0xb32d6001  ! 1162: SLL_I	sll 	%r21, 0x0001, %r25
	.word 0xb3e5a131  ! 1164: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe521db  ! 1165: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x9194a1fc  ! 1168: WRPR_PIL_I	wrpr	%r18, 0x01fc, %pil
	setx	data_start_2, %g1, %r23
	.word 0xb48d0000  ! 1171: ANDcc_R	andcc 	%r20, %r0, %r26
	.word 0xb48d20c1  ! 1173: ANDcc_I	andcc 	%r20, 0x00c1, %r26
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e00a  ! 1176: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb6a5a1e9  ! 1177: SUBcc_I	subcc 	%r22, 0x01e9, %r27
	.word 0xbde4e1bf  ! 1178: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e52162  ! 1179: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_5, %g1, %r20
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a151  ! 1187: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8594e080  ! 1190: WRPR_TSTATE_I	wrpr	%r19, 0x0080, %tstate
	setx	0x2012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1c5  ! 1192: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5a136  ! 1196: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 1199: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7641800  ! 1200: MOVcc_R	<illegal instruction>
	.word 0xb1e5212c  ! 1202: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 1211: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e18c  ! 1213: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819560a0  ! 1216: WRPR_TPC_I	wrpr	%r21, 0x00a0, %tpc
	.word 0xb5500000  ! 1217: RDPR_TPC	<illegal instruction>
	.word 0xb5e421bc  ! 1221: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4e1fd  ! 1223: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb950c000  ! 1226: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 1229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcac8000  ! 1230: ANDNcc_R	andncc 	%r18, %r0, %r30
	.word 0xb5e52175  ! 1238: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a1a1  ! 1239: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb951c000  ! 1240: RDPR_TL	<illegal instruction>
	.word 0xb3540000  ! 1241: RDPR_GL	<illegal instruction>
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983991  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1991, %hpstate
	.word 0xbfe560d3  ! 1254: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x81946156  ! 1262: WRPR_TPC_I	wrpr	%r17, 0x0156, %tpc
	.word 0xb9e561f1  ! 1266: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4e065  ! 1273: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_4, %g1, %r21
	.word 0xbf508000  ! 1278: RDPR_TSTATE	<illegal instruction>
	.word 0x8995611c  ! 1280: WRPR_TICK_I	wrpr	%r21, 0x011c, %tick
	.word 0xbb51c000  ! 1282: RDPR_TL	<illegal instruction>
	.word 0xb9504000  ! 1283: RDPR_TNPC	<illegal instruction>
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e421df  ! 1287: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e56126  ! 1288: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e421bb  ! 1290: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e520fe  ! 1296: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9480000  ! 1297: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbac5604d  ! 1300: ADDCcc_I	addccc 	%r21, 0x004d, %r29
	.word 0xb9e56114  ! 1304: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_1, %g1, %r22
	.word 0xbbe5a190  ! 1309: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4a179  ! 1310: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5e09e  ! 1313: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5e0e0  ! 1315: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb51c000  ! 1321: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198399b  ! 1324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199b, %hpstate
	.word 0xbde5212c  ! 1325: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5e0e5  ! 1326: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e56158  ! 1329: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5e1c3  ! 1336: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3643801  ! 1338: MOVcc_I	<illegal instruction>
	.word 0xbfe5e0a8  ! 1341: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x3002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1f1  ! 1350: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe421a0  ! 1351: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2ca0c1  ! 1362: ANDN_I	andn 	%r18, 0x00c1, %r29
	.word 0xb7e461c9  ! 1363: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e46099  ! 1364: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e421ea  ! 1365: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5e08c  ! 1366: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e52073  ! 1370: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e521c7  ! 1372: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5e029  ! 1375: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde42010  ! 1376: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x81946101  ! 1378: WRPR_TPC_I	wrpr	%r17, 0x0101, %tpc
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a031  ! 1380: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5a103  ! 1381: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe520eb  ! 1385: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e061  ! 1395: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983991  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1991, %hpstate
	setx	data_start_7, %g1, %r22
	.word 0xb1e4209c  ! 1403: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbebc61b0  ! 1410: XNORcc_I	xnorcc 	%r17, 0x01b0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb61ca084  ! 1414: XOR_I	xor 	%r18, 0x0084, %r27
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb350c000  ! 1422: RDPR_TT	<illegal instruction>
	.word 0xb1e5a05e  ! 1424: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe4e014  ! 1427: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe52030  ! 1428: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e181  ! 1429: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_2, %g1, %r19
	.word 0xbde4e08c  ! 1431: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e5619b  ! 1432: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e520eb  ! 1435: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a0a0  ! 1441: WRPR_TNPC_I	wrpr	%r18, 0x00a0, %tnpc
	.word 0xb7e460b5  ! 1444: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8194a112  ! 1445: WRPR_TPC_I	wrpr	%r18, 0x0112, %tpc
	.word 0xb1500000  ! 1446: RDPR_TPC	<illegal instruction>
	.word 0xb82460aa  ! 1447: SUB_I	sub 	%r17, 0x00aa, %r28
	.word 0xbf500000  ! 1451: RDPR_TPC	<illegal instruction>
	.word 0xb9e5e1b9  ! 1453: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4e0dd  ! 1459: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9518000  ! 1465: RDPR_PSTATE	<illegal instruction>
	.word 0xb9540000  ! 1466: RDPR_GL	<illegal instruction>
	.word 0xb9e4e112  ! 1467: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e46145  ! 1468: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb551c000  ! 1469: RDPR_TL	<illegal instruction>
	.word 0xb7e56088  ! 1471: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e11c  ! 1480: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 1484: RDPR_GL	<illegal instruction>
	.word 0xb7e4e0d3  ! 1485: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819520c8  ! 1489: WRPR_TPC_I	wrpr	%r20, 0x00c8, %tpc
	.word 0xbde5a02a  ! 1491: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbb508000  ! 1493: RDPR_TSTATE	<illegal instruction>
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899420da  ! 1498: WRPR_TICK_I	wrpr	%r16, 0x00da, %tick
	.word 0xbfe421e0  ! 1499: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe4e131  ! 1501: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e56055  ! 1504: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe42025  ! 1506: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe561d1  ! 1507: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4216b  ! 1508: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8795201f  ! 1509: WRPR_TT_I	wrpr	%r20, 0x001f, %tt
	.word 0xb9e4211b  ! 1512: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8795e095  ! 1516: WRPR_TT_I	wrpr	%r23, 0x0095, %tt
	.word 0xb9e42058  ! 1522: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe520da  ! 1524: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	.word 0xb5e4a0ec  ! 1532: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x85946128  ! 1534: WRPR_TSTATE_I	wrpr	%r17, 0x0128, %tstate
	setx	data_start_6, %g1, %r23
	.word 0xbde4a033  ! 1540: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb6bd614a  ! 1542: XNORcc_I	xnorcc 	%r21, 0x014a, %r27
	.word 0xb5520000  ! 1544: RDPR_PIL	<illegal instruction>
	.word 0xb9540000  ! 1545: RDPR_GL	<illegal instruction>
	.word 0xb08d60fd  ! 1548: ANDcc_I	andcc 	%r21, 0x00fd, %r24
	.word 0xb7518000  ! 1549: RDPR_PSTATE	<illegal instruction>
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 1551: RDPR_TT	<illegal instruction>
	.word 0xb1e4a001  ! 1553: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e56139  ! 1556: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xb1e46131  ! 1559: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xbde4e14d  ! 1563: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5e08c  ! 1566: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e520ba  ! 1570: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 1576: RDPR_GL	<illegal instruction>
	.word 0xb5e4a0ab  ! 1578: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb7c6401  ! 1579: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xb0a561ed  ! 1580: SUBcc_I	subcc 	%r21, 0x01ed, %r24
	.word 0xb7e46157  ! 1583: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e022  ! 1590: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e56084  ! 1591: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4e081  ! 1592: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb151c000  ! 1593: RDPR_TL	<illegal instruction>
	.word 0xb1e56014  ! 1595: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460e3  ! 1601: WRPR_PSTATE_I	wrpr	%r17, 0x00e3, %pstate
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe521c7  ! 1609: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a06c  ! 1613: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e52182  ! 1614: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e460ac  ! 1617: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 1622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xb7e52076  ! 1628: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbb510000  ! 1629: RDPR_TICK	<illegal instruction>
	.word 0xbde4a096  ! 1630: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbcb5e0ba  ! 1631: SUBCcc_I	orncc 	%r23, 0x00ba, %r30
	.word 0x8d95a068  ! 1634: WRPR_PSTATE_I	wrpr	%r22, 0x0068, %pstate
	setx	0x30312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xb1e5613f  ! 1639: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xb7e52122  ! 1644: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe5618b  ! 1648: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5a06f  ! 1651: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e560b1  ! 1652: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbd51c000  ! 1653: RDPR_TL	<illegal instruction>
	.word 0x8795a0df  ! 1654: WRPR_TT_I	wrpr	%r22, 0x00df, %tt
	setx	data_start_2, %g1, %r16
	.word 0xbde4a062  ! 1658: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5504000  ! 1660: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4a196  ! 1663: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3540000  ! 1664: RDPR_GL	<illegal instruction>
	.word 0xb5e5e07d  ! 1665: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4202c  ! 1667: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e46072  ! 1669: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4a174  ! 1670: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe46084  ! 1673: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0c5  ! 1681: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5e11a  ! 1682: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7520000  ! 1683: RDPR_PIL	<illegal instruction>
	.word 0xbf508000  ! 1684: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5a087  ! 1685: SAVE_I	save	%r22, 0x0001, %r24
	mov	0, %r12
	.word 0x8f932000  ! 1688: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195e1b6  ! 1689: WRPR_PIL_I	wrpr	%r23, 0x01b6, %pil
	.word 0xbfe5615d  ! 1691: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4207f  ! 1695: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb024604f  ! 1698: SUB_I	sub 	%r17, 0x004f, %r24
	.word 0xbab4a054  ! 1700: ORNcc_I	orncc 	%r18, 0x0054, %r29
	.word 0xb7e560e2  ! 1701: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe461bf  ! 1706: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_3, %g1, %r16
	.word 0xb3e460ac  ! 1715: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_3, %g1, %r16
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 1719: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f81  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f81, %hpstate
	.word 0xb52d6001  ! 1723: SLL_I	sll 	%r21, 0x0001, %r26
	setx	data_start_4, %g1, %r16
	.word 0x8d95606e  ! 1729: WRPR_PSTATE_I	wrpr	%r21, 0x006e, %pstate
	.word 0xb3e4e02c  ! 1730: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_0, %g1, %r16
	.word 0x8995a101  ! 1733: WRPR_TICK_I	wrpr	%r22, 0x0101, %tick
	.word 0xbd480000  ! 1735: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	data_start_2, %g1, %r20
	.word 0xbbe5a190  ! 1739: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5643801  ! 1741: MOVcc_I	<illegal instruction>
	.word 0xb60cc000  ! 1745: AND_R	and 	%r19, %r0, %r27
	.word 0x8195a07d  ! 1750: WRPR_TPC_I	wrpr	%r22, 0x007d, %tpc
	.word 0xb1e5a00e  ! 1755: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12c2001  ! 1761: SLL_I	sll 	%r16, 0x0001, %r24
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e190  ! 1765: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e461cb  ! 1766: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe521b4  ! 1767: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb6254000  ! 1769: SUB_R	sub 	%r21, %r0, %r27
	.word 0xb1e4202c  ! 1774: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e52193  ! 1775: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e52149  ! 1776: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e521f9  ! 1777: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0, %r12
	.word 0x8f932000  ! 1793: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r12
	.word 0x8f932000  ! 1795: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e5e1b2  ! 1798: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8795a1b9  ! 1801: WRPR_TT_I	wrpr	%r22, 0x01b9, %tt
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	setx	data_start_4, %g1, %r18
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e041  ! 1831: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe1521ae  ! 1832: OR_I	or 	%r20, 0x01ae, %r31
	.word 0xb7e4605c  ! 1835: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4a0a7  ! 1844: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8995a1bf  ! 1845: WRPR_TICK_I	wrpr	%r22, 0x01bf, %tick
	.word 0xb0c4a048  ! 1847: ADDCcc_I	addccc 	%r18, 0x0048, %r24
	.word 0xb1520000  ! 1849: RDPR_PIL	<illegal instruction>
	.word 0xb3e421b9  ! 1851: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xba244000  ! 1852: SUB_R	sub 	%r17, %r0, %r29
	.word 0xb9e421de  ! 1854: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e421f1  ! 1861: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5a15c  ! 1862: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbd3ce001  ! 1863: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xb9e4e011  ! 1867: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 1873: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983993  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1993, %hpstate
	.word 0xb7e46058  ! 1879: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e461f4  ! 1884: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e4e0e3  ! 1886: SAVE_I	save	%r19, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1892: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbab5e069  ! 1895: SUBCcc_I	orncc 	%r23, 0x0069, %r29
	.word 0xb7e4e13a  ! 1896: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e42121  ! 1900: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4600b  ! 1904: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5e19b  ! 1905: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe52197  ! 1906: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d95e1b2  ! 1908: WRPR_PSTATE_I	wrpr	%r23, 0x01b2, %pstate
	.word 0xbb504000  ! 1909: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e0c7  ! 1915: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5a077  ! 1918: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983d41  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d41, %hpstate
	.word 0xb7e5a171  ! 1929: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4a040  ! 1931: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe460f4  ! 1932: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e4213f  ! 1933: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_2, %g1, %r19
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91956180  ! 1945: WRPR_PIL_I	wrpr	%r21, 0x0180, %pil
	.word 0xbde421ed  ! 1946: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5a1ce  ! 1948: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e460f2  ! 1949: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_6, %g1, %r23
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1d2  ! 1956: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1963: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95e16c  ! 1964: WRPR_PSTATE_I	wrpr	%r23, 0x016c, %pstate
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb934a001  ! 1971: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xbfe42071  ! 1974: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5e164  ! 1976: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8795a172  ! 1977: WRPR_TT_I	wrpr	%r22, 0x0172, %tt
	.word 0xbbe5207e  ! 1983: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e4209e  ! 1985: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5e0b5  ! 1992: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8d946048  ! 1993: WRPR_PSTATE_I	wrpr	%r17, 0x0048, %pstate
	.word 0xb1e4a045  ! 2000: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8395a12b  ! 2003: WRPR_TNPC_I	wrpr	%r22, 0x012b, %tnpc
	.word 0xbfe5e005  ! 2005: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e521dd  ! 2009: SAVE_I	save	%r20, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 2010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5610f  ! 2012: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5610f  ! 2015: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbea4c000  ! 2016: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xbde521c7  ! 2018: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 2024: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc944000  ! 2029: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xbde4a0f8  ! 2034: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe421a5  ! 2042: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe5e0f6  ! 2048: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb234e088  ! 2050: SUBC_I	orn 	%r19, 0x0088, %r25
	.word 0xbfe4a13e  ! 2052: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b51  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b51, %hpstate
	.word 0x839461ae  ! 2057: WRPR_TNPC_I	wrpr	%r17, 0x01ae, %tnpc
	.word 0xb9e52146  ! 2058: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_0, %g1, %r22
	.word 0xbbe5a13e  ! 2060: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e4e104  ! 2062: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c1b  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1b, %hpstate
	.word 0x839560d3  ! 2067: WRPR_TNPC_I	wrpr	%r21, 0x00d3, %tnpc
	.word 0xbbe56129  ! 2069: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbc3d0000  ! 2071: XNOR_R	xnor 	%r20, %r0, %r30
	.word 0xbfe4a1b9  ! 2073: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e561b2  ! 2075: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e460b8  ! 2080: SAVE_I	save	%r17, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 2081: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983f89  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f89, %hpstate
	.word 0x8595a1b6  ! 2093: WRPR_TSTATE_I	wrpr	%r22, 0x01b6, %tstate
	.word 0x81956024  ! 2097: WRPR_TPC_I	wrpr	%r21, 0x0024, %tpc
	.word 0xb9e420cd  ! 2098: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5e067  ! 2101: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4e097  ! 2102: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4a080  ! 2105: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x81946118  ! 2108: WRPR_TPC_I	wrpr	%r17, 0x0118, %tpc
	.word 0xbbe561ea  ! 2110: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb02d214a  ! 2112: ANDN_I	andn 	%r20, 0x014a, %r24
	.word 0xb1e4a0ec  ! 2113: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5a1fe  ! 2114: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0bde1fc  ! 2117: XNORcc_I	xnorcc 	%r23, 0x01fc, %r24
	.word 0xbf3ce001  ! 2129: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xb72d3001  ! 2130: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xbbe4a13b  ! 2132: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e560ff  ! 2133: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb69d0000  ! 2137: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xb5e56176  ! 2138: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8395209c  ! 2148: WRPR_TNPC_I	wrpr	%r20, 0x009c, %tnpc
	.word 0xb3e5e040  ! 2151: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5500000  ! 2154: RDPR_TPC	<illegal instruction>
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1c8  ! 2160: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4e19f  ! 2162: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5a1cf  ! 2163: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_0, %g1, %r18
	.word 0xb7480000  ! 2168: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d956092  ! 2170: WRPR_PSTATE_I	wrpr	%r21, 0x0092, %pstate
	.word 0xb5e42148  ! 2172: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb92df001  ! 2173: SLLX_I	sllx	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb504000  ! 2177: RDPR_TNPC	<illegal instruction>
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xbbe5a0ce  ! 2183: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd520000  ! 2184: RDPR_PIL	<illegal instruction>
	.word 0xbbe5614e  ! 2187: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4a1f8  ! 2189: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8595612a  ! 2191: WRPR_TSTATE_I	wrpr	%r21, 0x012a, %tstate
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a035  ! 2195: SAVE_I	save	%r18, 0x0001, %r27
	setx	data_start_2, %g1, %r22
	.word 0xb3e420f5  ! 2200: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5602e  ! 2201: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5e02e  ! 2202: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e081  ! 2204: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde46069  ! 2205: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e56096  ! 2208: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb504000  ! 2209: RDPR_TNPC	<illegal instruction>
	.word 0xb1e561b9  ! 2210: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e561af  ! 2211: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4e03a  ! 2213: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe46080  ! 2215: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4206b  ! 2217: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a0aa  ! 2218: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb4bc207d  ! 2219: XNORcc_I	xnorcc 	%r16, 0x007d, %r26
	.word 0xbbe4a06b  ! 2222: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7504000  ! 2223: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5a000  ! 2224: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8994a0a9  ! 2227: WRPR_TICK_I	wrpr	%r18, 0x00a9, %tick
	.word 0xb1e42163  ! 2233: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5a1b5  ! 2234: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1540000  ! 2236: RDPR_GL	<illegal instruction>
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a04e  ! 2245: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4211c  ! 2247: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3540000  ! 2248: RDPR_GL	<illegal instruction>
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0x8994608c  ! 2254: WRPR_TICK_I	wrpr	%r17, 0x008c, %tick
	.word 0xb5e4e1f0  ! 2257: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5212d  ! 2267: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e42137  ! 2270: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3480000  ! 2272: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2275: RDPR_TPC	<illegal instruction>
	.word 0xb7e52131  ! 2280: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8994e003  ! 2282: WRPR_TICK_I	wrpr	%r19, 0x0003, %tick
	.word 0xb5e4e177  ! 2287: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8395a033  ! 2290: WRPR_TNPC_I	wrpr	%r22, 0x0033, %tnpc
	setx	data_start_0, %g1, %r22
	.word 0xbbe5a1ef  ! 2295: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8d95e13b  ! 2299: WRPR_PSTATE_I	wrpr	%r23, 0x013b, %pstate
	.word 0xb9e5e0a0  ! 2300: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5618e  ! 2301: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 2308: RDPR_TICK	<illegal instruction>
	.word 0xb1643801  ! 2309: MOVcc_I	<illegal instruction>
	.word 0x8795a16d  ! 2312: WRPR_TT_I	wrpr	%r22, 0x016d, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	.word 0xbde4e101  ! 2314: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e5e192  ! 2317: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb61c4000  ! 2318: XOR_R	xor 	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b09  ! 2319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b09, %hpstate
	.word 0xb3e42179  ! 2322: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3520000  ! 2326: RDPR_PIL	<illegal instruction>
	.word 0xb151c000  ! 2328: RDPR_TL	<illegal instruction>
	.word 0xb1e4614f  ! 2331: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r22
	.word 0xb3e4e137  ! 2338: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e56010  ! 2341: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a099  ! 2350: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3504000  ! 2352: RDPR_TNPC	<illegal instruction>
	.word 0xbf51c000  ! 2357: RDPR_TL	<illegal instruction>
	.word 0xb9e4a18d  ! 2369: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb6350000  ! 2372: ORN_R	orn 	%r20, %r0, %r27
	.word 0x8994a0f7  ! 2375: WRPR_TICK_I	wrpr	%r18, 0x00f7, %tick
	.word 0xbbe4e188  ! 2376: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4219b  ! 2380: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4e167  ! 2383: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8194217b  ! 2386: WRPR_TPC_I	wrpr	%r16, 0x017b, %tpc
	.word 0xbfe4e0de  ! 2391: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd500000  ! 2394: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb3e5618e  ! 2395: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e42037  ! 2396: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e46020  ! 2399: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a1da  ! 2408: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e46068  ! 2411: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982bc1  ! 2413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc1, %hpstate
	.word 0x9194619b  ! 2415: WRPR_PIL_I	wrpr	%r17, 0x019b, %pil
	setx	data_start_3, %g1, %r16
	.word 0x89956174  ! 2418: WRPR_TICK_I	wrpr	%r21, 0x0174, %tick
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46008  ! 2426: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e52132  ! 2431: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69de16e  ! 2433: XORcc_I	xorcc 	%r23, 0x016e, %r27
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb4a0d9  ! 2437: SUBCcc_I	orncc 	%r18, 0x00d9, %r31
	.word 0xb5e5e052  ! 2438: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8394e014  ! 2440: WRPR_TNPC_I	wrpr	%r19, 0x0014, %tnpc
	.word 0xb7518000  ! 2441: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4219a  ! 2442: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x83956189  ! 2445: WRPR_TNPC_I	wrpr	%r21, 0x0189, %tnpc
	.word 0xb5508000  ! 2447: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 2454: RDPR_TPC	<illegal instruction>
	.word 0x89942134  ! 2457: WRPR_TICK_I	wrpr	%r16, 0x0134, %tick
	.word 0xb1e5e168  ! 2458: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 2461: RDPR_TPC	<illegal instruction>
	.word 0xb9e52121  ! 2463: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4e1f4  ! 2468: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4058000  ! 2469: ADD_R	add 	%r22, %r0, %r26
	.word 0xb150c000  ! 2480: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r22
	.word 0x8994a064  ! 2486: WRPR_TICK_I	wrpr	%r18, 0x0064, %tick
	.word 0x9194a0fd  ! 2492: WRPR_PIL_I	wrpr	%r18, 0x00fd, %pil
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba458000  ! 2501: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xb1e4a042  ! 2504: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe56168  ! 2507: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e56172  ! 2514: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e52060  ! 2516: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x87952141  ! 2519: WRPR_TT_I	wrpr	%r20, 0x0141, %tt
	setx	0x20020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 2522: RDPR_TT	<illegal instruction>
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52073  ! 2530: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_1, %g1, %r18
	.word 0x8195602b  ! 2533: WRPR_TPC_I	wrpr	%r21, 0x002b, %tpc
	.word 0xbbe4a197  ! 2535: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4a128  ! 2536: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb20ce18c  ! 2539: AND_I	and 	%r19, 0x018c, %r25
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595617f  ! 2547: WRPR_TSTATE_I	wrpr	%r21, 0x017f, %tstate
	.word 0xb8b58000  ! 2548: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xbde46107  ! 2549: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a112  ! 2551: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbeac609e  ! 2552: ANDNcc_I	andncc 	%r17, 0x009e, %r31
	.word 0xb1e52074  ! 2553: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe4a139  ! 2554: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e420e5  ! 2555: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde461aa  ! 2556: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 2558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 2564: RDPR_TNPC	<illegal instruction>
	.word 0xb1e461e4  ! 2565: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5a129  ! 2566: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb6bc4000  ! 2567: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0x8995e001  ! 2568: WRPR_TICK_I	wrpr	%r23, 0x0001, %tick
	.word 0xbcb4a05a  ! 2569: ORNcc_I	orncc 	%r18, 0x005a, %r30
	.word 0xbde4a0b8  ! 2571: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x81942161  ! 2578: WRPR_TPC_I	wrpr	%r16, 0x0161, %tpc
	.word 0xb9e4e0ee  ! 2580: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf7d0400  ! 2582: MOVR_R	movre	%r20, %r0, %r31
	mov	1, %r14
	.word 0xa193a000  ! 2586: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1ce  ! 2589: SAVE_I	save	%r18, 0x0001, %r25
	mov	1, %r14
	.word 0xa193a000  ! 2596: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbaa5c000  ! 2603: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb1e461af  ! 2605: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb0c58000  ! 2606: ADDCcc_R	addccc 	%r22, %r0, %r24
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2615: RDPR_TPC	<illegal instruction>
	.word 0xb5e52131  ! 2616: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 2619: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1480000  ! 2620: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3e5e1bd  ! 2621: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5a0d5  ! 2623: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9195a146  ! 2624: WRPR_PIL_I	wrpr	%r22, 0x0146, %pil
	setx	data_start_1, %g1, %r21
	.word 0xb8158000  ! 2628: OR_R	or 	%r22, %r0, %r28
	.word 0xb1e4616d  ! 2631: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e56022  ! 2634: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4e17b  ! 2640: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e5a0e6  ! 2641: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe1d21cf  ! 2644: XOR_I	xor 	%r20, 0x01cf, %r31
	.word 0xbfe5a05a  ! 2645: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a1eb  ! 2652: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4e0dc  ! 2657: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5510000  ! 2658: RDPR_TICK	<illegal instruction>
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2c8000  ! 2661: SLL_R	sll 	%r18, %r0, %r29
	.word 0xb9510000  ! 2668: RDPR_TICK	rdpr	%tick, %r28
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52164  ! 2673: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1540000  ! 2674: RDPR_GL	<illegal instruction>
	.word 0xbf520000  ! 2678: RDPR_PIL	<illegal instruction>
	.word 0xb28d4000  ! 2679: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xb1e46129  ! 2681: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e4210b  ! 2682: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3520000  ! 2683: RDPR_PIL	<illegal instruction>
	.word 0xb1e5e02b  ! 2686: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9500000  ! 2690: RDPR_TPC	<illegal instruction>
	.word 0xb7e5205d  ! 2691: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde42162  ! 2694: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5e026  ! 2695: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_1, %g1, %r18
	.word 0xbde4a0e1  ! 2700: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8794e012  ! 2701: WRPR_TT_I	wrpr	%r19, 0x0012, %tt
	.word 0xb3e5202a  ! 2703: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e42170  ! 2705: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0a3  ! 2710: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a0be  ! 2719: WRPR_TT_I	wrpr	%r18, 0x00be, %tt
	.word 0x8194a08f  ! 2720: WRPR_TPC_I	wrpr	%r18, 0x008f, %tpc
	.word 0xbbe42034  ! 2721: SAVE_I	save	%r16, 0x0001, %r29
	mov	0, %r14
	.word 0xa193a000  ! 2723: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x819838db  ! 2728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18db, %hpstate
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e56035  ! 2740: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85956191  ! 2747: WRPR_TSTATE_I	wrpr	%r21, 0x0191, %tstate
	.word 0xbb518000  ! 2753: RDPR_PSTATE	<illegal instruction>
	.word 0xb150c000  ! 2758: RDPR_TT	<illegal instruction>
	.word 0xb635e093  ! 2760: SUBC_I	orn 	%r23, 0x0093, %r27
	.word 0xb7510000  ! 2762: RDPR_TICK	<illegal instruction>
	.word 0xbde5e19e  ! 2763: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8394a039  ! 2764: WRPR_TNPC_I	wrpr	%r18, 0x0039, %tnpc
	.word 0xbfe5219d  ! 2765: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4a16f  ! 2767: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3480000  ! 2770: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3e42001  ! 2773: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb92da001  ! 2775: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0xbde461e1  ! 2779: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4603b  ! 2780: SAVE_I	save	%r17, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 2784: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde46096  ! 2788: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e561af  ! 2789: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x8198384b  ! 2790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184b, %hpstate
	.word 0xb9e5e1fb  ! 2791: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9518000  ! 2794: RDPR_PSTATE	<illegal instruction>
	.word 0xbe146103  ! 2796: OR_I	or 	%r17, 0x0103, %r31
	mov	2, %r12
	.word 0x8f932000  ! 2802: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e4e1db  ! 2805: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e42033  ! 2807: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x91942011  ! 2808: WRPR_PIL_I	wrpr	%r16, 0x0011, %pil
	.word 0xbbe4e05e  ! 2811: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5a110  ! 2812: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x919421d0  ! 2813: WRPR_PIL_I	wrpr	%r16, 0x01d0, %pil
	.word 0xbd51c000  ! 2815: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xbde4e14d  ! 2819: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a028  ! 2832: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40ce050  ! 2842: AND_I	and 	%r19, 0x0050, %r26
	setx	0x30211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8da0de  ! 2844: ANDcc_I	andcc 	%r22, 0x00de, %r29
	.word 0xbde4a18d  ! 2846: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb1e460c8  ! 2849: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_1, %g1, %r19
	.word 0xbfe5a0a3  ! 2854: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e0e7  ! 2856: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x8198398b  ! 2864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
	.word 0xb3e4a093  ! 2867: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e5e15f  ! 2868: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_0, %g1, %r17
	.word 0xb7e5603a  ! 2871: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4200d  ! 2873: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_5, %g1, %r19
	.word 0xb3e5e1e4  ! 2876: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e521f8  ! 2880: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 2892: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8c5c000  ! 2893: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xb9e5a004  ! 2895: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd540000  ! 2903: RDPR_GL	<illegal instruction>
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a139  ! 2906: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e56145  ! 2911: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7349000  ! 2912: SRLX_R	srlx	%r18, %r0, %r27
	.word 0xb3e4203e  ! 2915: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde46154  ! 2916: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe42087  ! 2917: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e42150  ! 2922: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x89956135  ! 2924: WRPR_TICK_I	wrpr	%r21, 0x0135, %tick
	.word 0xbde460f0  ! 2925: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb52cc000  ! 2926: SLL_R	sll 	%r19, %r0, %r26
	.word 0xb3540000  ! 2929: RDPR_GL	<illegal instruction>
	.word 0xb7e56175  ! 2931: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb4c54000  ! 2932: ADDCcc_R	addccc 	%r21, %r0, %r26
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0ab  ! 2935: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe560fa  ! 2938: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1540000  ! 2939: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e46014  ! 2945: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x9194e19c  ! 2946: WRPR_PIL_I	wrpr	%r19, 0x019c, %pil
	.word 0xb7480000  ! 2950: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e00b  ! 2959: WRPR_TT_I	wrpr	%r23, 0x000b, %tt
	.word 0xbfe4a0c5  ! 2960: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1ad  ! 2963: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbd500000  ! 2964: RDPR_TPC	<illegal instruction>
	.word 0xb7e5a10d  ! 2965: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb350c000  ! 2966: RDPR_TT	<illegal instruction>
	.word 0xbe0d60a3  ! 2968: AND_I	and 	%r21, 0x00a3, %r31
	.word 0xb7e5a055  ! 2972: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde460f5  ! 2973: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9643801  ! 2974: MOVcc_I	<illegal instruction>
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9351000  ! 2976: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xbb7ce401  ! 2977: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xb5e42123  ! 2981: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x879460dc  ! 2982: WRPR_TT_I	wrpr	%r17, 0x00dc, %tt
	.word 0xb5500000  ! 2983: RDPR_TPC	<illegal instruction>
	.word 0xbde5e112  ! 2984: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe521b5  ! 2987: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe52018  ! 2990: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e56136  ! 2991: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e461a8  ! 2992: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e032  ! 3001: WRPR_TNPC_I	wrpr	%r19, 0x0032, %tnpc
	.word 0xbde46156  ! 3003: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde46159  ! 3007: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5e0d7  ! 3012: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4a12a  ! 3013: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e00a  ! 3015: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbd518000  ! 3017: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e1f4  ! 3018: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1500000  ! 3019: RDPR_TPC	<illegal instruction>
	.word 0xb1e5a0e9  ! 3029: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e56068  ! 3035: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb6158000  ! 3036: OR_R	or 	%r22, %r0, %r27
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3041: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e560f6  ! 3042: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 3043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0xb751c000  ! 3046: RDPR_TL	<illegal instruction>
	.word 0xb1e4607e  ! 3047: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x89956077  ! 3049: WRPR_TICK_I	wrpr	%r21, 0x0077, %tick
	setx	data_start_0, %g1, %r17
	.word 0x879520a3  ! 3052: WRPR_TT_I	wrpr	%r20, 0x00a3, %tt
	.word 0xbfe4e083  ! 3053: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e42159  ! 3054: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a104  ! 3055: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46071  ! 3057: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb4a421d5  ! 3059: SUBcc_I	subcc 	%r16, 0x01d5, %r26
	.word 0xb1e4e01a  ! 3060: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb500000  ! 3061: RDPR_TPC	<illegal instruction>
	.word 0xb4c5c000  ! 3062: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xbd518000  ! 3063: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 3066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xbf51c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xb5e5e0e7  ! 3068: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb72d3001  ! 3070: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xbbe42020  ! 3074: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8594e113  ! 3079: WRPR_TSTATE_I	wrpr	%r19, 0x0113, %tstate
	.word 0xbde461e9  ! 3080: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf500000  ! 3081: RDPR_TPC	<illegal instruction>
	.word 0x89946131  ! 3085: WRPR_TICK_I	wrpr	%r17, 0x0131, %tick
	.word 0x8994a0ff  ! 3095: WRPR_TICK_I	wrpr	%r18, 0x00ff, %tick
	.word 0x8794a122  ! 3096: WRPR_TT_I	wrpr	%r18, 0x0122, %tt
	setx	data_start_5, %g1, %r19
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e521a3  ! 3102: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4a073  ! 3105: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e183  ! 3111: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4a191  ! 3116: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4a163  ! 3118: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4e1f1  ! 3119: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde421be  ! 3121: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd51c000  ! 3125: RDPR_TL	<illegal instruction>
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995601b  ! 3129: WRPR_TICK_I	wrpr	%r21, 0x001b, %tick
	.word 0xbd3db001  ! 3130: SRAX_I	srax	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983983  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1983, %hpstate
	.word 0xbbe5a055  ! 3133: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3138: RDPR_GL	<illegal instruction>
	.word 0xbfe5e058  ! 3140: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e42002  ! 3141: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5a154  ! 3143: SAVE_I	save	%r22, 0x0001, %r30
	mov	2, %r12
	.word 0x8f932000  ! 3145: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcbc0000  ! 3152: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xbcb560b3  ! 3154: SUBCcc_I	orncc 	%r21, 0x00b3, %r30
	.word 0xb7e4e095  ! 3158: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba0d2061  ! 3159: AND_I	and 	%r20, 0x0061, %r29
	.word 0xbd520000  ! 3171: RDPR_PIL	<illegal instruction>
	.word 0xb3e461ec  ! 3172: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8194a026  ! 3176: WRPR_TPC_I	wrpr	%r18, 0x0026, %tpc
	.word 0x8d9521da  ! 3178: WRPR_PSTATE_I	wrpr	%r20, 0x01da, %pstate
	.word 0x839461c0  ! 3179: WRPR_TNPC_I	wrpr	%r17, 0x01c0, %tnpc
	.word 0xb1510000  ! 3181: RDPR_TICK	<illegal instruction>
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3184: RDPR_GL	<illegal instruction>
	.word 0xb1e4a1cb  ! 3185: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983fd3  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd3, %hpstate
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4207c  ! 3200: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4a160  ! 3202: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe56140  ! 3203: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbd508000  ! 3206: RDPR_TSTATE	<illegal instruction>
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3211: RDPR_PSTATE	<illegal instruction>
	.word 0xbde520d3  ! 3218: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3224: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e52199  ! 3228: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e56037  ! 3229: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e19d  ! 3239: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 3247: RDPR_GL	<illegal instruction>
	.word 0xb9e56142  ! 3250: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf540000  ! 3252: RDPR_GL	<illegal instruction>
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 3261: RDPR_PSTATE	<illegal instruction>
	.word 0xbde56087  ! 3263: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde561e0  ! 3265: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8394201e  ! 3266: WRPR_TNPC_I	wrpr	%r16, 0x001e, %tnpc
	.word 0xbde4e06a  ! 3269: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e4e18c  ! 3271: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9480000  ! 3275: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5500000  ! 3277: RDPR_TPC	<illegal instruction>
	.word 0x91952072  ! 3278: WRPR_PIL_I	wrpr	%r20, 0x0072, %pil
	setx	data_start_3, %g1, %r21
	.word 0xb3e5e090  ! 3284: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e13  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e13, %hpstate
	.word 0x8594a127  ! 3286: WRPR_TSTATE_I	wrpr	%r18, 0x0127, %tstate
	.word 0xb7e5a01a  ! 3287: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e0ca  ! 3291: WRPR_TNPC_I	wrpr	%r23, 0x00ca, %tnpc
	.word 0xbb508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xbd510000  ! 3296: RDPR_TICK	<illegal instruction>
	.word 0xb1e5205a  ! 3299: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbe34c000  ! 3302: ORN_R	orn 	%r19, %r0, %r31
	.word 0xb9e5e185  ! 3305: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x91942088  ! 3306: WRPR_PIL_I	wrpr	%r16, 0x0088, %pil
	.word 0xb5e4e1b6  ! 3308: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a137  ! 3313: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983dd1  ! 3314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd1, %hpstate
	.word 0xb3500000  ! 3315: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 3319: RDPR_TT	<illegal instruction>
	.word 0xb9e4e1ff  ! 3320: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e420a6  ! 3321: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb50c000  ! 3325: RDPR_TT	<illegal instruction>
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xb1e5e0de  ! 3342: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7508000  ! 3343: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a067  ! 3345: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a1d1  ! 3347: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbb518000  ! 3352: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e086  ! 3355: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1518000  ! 3356: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e46041  ! 3359: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb8050000  ! 3360: ADD_R	add 	%r20, %r0, %r28
	.word 0xbde5a1e3  ! 3362: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e016  ! 3365: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe561b9  ! 3367: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5a035  ! 3374: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3480000  ! 3376: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde5e098  ! 3379: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5a14d  ! 3380: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e052  ! 3385: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e561a7  ! 3388: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1fd  ! 3393: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd35d000  ! 3394: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xb9540000  ! 3395: RDPR_GL	<illegal instruction>
	.word 0xbde4208d  ! 3399: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e165  ! 3403: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde460a7  ! 3405: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 3407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde56126  ! 3409: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e420fe  ! 3410: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8394616f  ! 3411: WRPR_TNPC_I	wrpr	%r17, 0x016f, %tnpc
	.word 0xb3e561a4  ! 3413: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982909  ! 3415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0909, %hpstate
	.word 0xb5e421a5  ! 3416: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3518000  ! 3420: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e106  ! 3425: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba458000  ! 3428: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xbde521b8  ! 3430: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x9194a067  ! 3434: WRPR_PIL_I	wrpr	%r18, 0x0067, %pil
	.word 0x8594e195  ! 3435: WRPR_TSTATE_I	wrpr	%r19, 0x0195, %tstate
	.word 0xb5480000  ! 3442: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbcad8000  ! 3443: ANDNcc_R	andncc 	%r22, %r0, %r30
	.word 0xbde421c5  ! 3445: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5a064  ! 3447: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5e1c8  ! 3450: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d95e11a  ! 3458: WRPR_PSTATE_I	wrpr	%r23, 0x011a, %pstate
	.word 0xbbe4e12a  ! 3460: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8594a08b  ! 3462: WRPR_TSTATE_I	wrpr	%r18, 0x008b, %tstate
	.word 0xb2bd4000  ! 3465: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xbe142023  ! 3467: OR_I	or 	%r16, 0x0023, %r31
	setx	0x137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5214e  ! 3470: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4e0c7  ! 3471: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7540000  ! 3472: RDPR_GL	<illegal instruction>
	.word 0xb7e460fc  ! 3474: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe52088  ! 3475: SAVE_I	save	%r20, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 3479: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e5e13a  ! 3482: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5480000  ! 3487: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7e5a1b9  ! 3489: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb69c0000  ! 3496: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xb7e560d9  ! 3497: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a194  ! 3499: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 3506: RDPR_PSTATE	<illegal instruction>
	.word 0x81946161  ! 3507: WRPR_TPC_I	wrpr	%r17, 0x0161, %tpc
	.word 0xbde4a13b  ! 3509: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_5, %g1, %r18
	.word 0x87946059  ! 3512: WRPR_TT_I	wrpr	%r17, 0x0059, %tt
	.word 0xbfe420d7  ! 3513: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb3da001  ! 3516: SRA_I	sra 	%r22, 0x0001, %r29
	.word 0x8594a1f9  ! 3517: WRPR_TSTATE_I	wrpr	%r18, 0x01f9, %tstate
	.word 0xb3e52090  ! 3519: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e5a0a1  ! 3520: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4a06a  ! 3522: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e11a  ! 3526: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e42077  ! 3527: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e460f1  ! 3528: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4a016  ! 3533: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e46066  ! 3537: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1510000  ! 3539: RDPR_TICK	<illegal instruction>
	.word 0xb1e4612d  ! 3540: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42039  ! 3551: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb6154000  ! 3553: OR_R	or 	%r21, %r0, %r27
	.word 0xb53c6001  ! 3557: SRA_I	sra 	%r17, 0x0001, %r26
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952154  ! 3565: WRPR_PIL_I	wrpr	%r20, 0x0154, %pil
	.word 0x8d94e0fb  ! 3566: WRPR_PSTATE_I	wrpr	%r19, 0x00fb, %pstate
	.word 0x899461e9  ! 3567: WRPR_TICK_I	wrpr	%r17, 0x01e9, %tick
	.word 0xbbe5a0e2  ! 3570: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e56021  ! 3571: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde4a0d8  ! 3573: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e560b2  ! 3575: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e42035  ! 3579: SAVE_I	save	%r16, 0x0001, %r25
	mov	2, %r12
	.word 0x8f932000  ! 3580: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e5207f  ! 3582: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5219a  ! 3583: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc1de168  ! 3587: XOR_I	xor 	%r23, 0x0168, %r30
	.word 0xb7504000  ! 3588: RDPR_TNPC	<illegal instruction>
	.word 0xbbe460c5  ! 3590: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e42044  ! 3593: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xba2c2042  ! 3595: ANDN_I	andn 	%r16, 0x0042, %r29
	.word 0xbb347001  ! 3598: SRLX_I	srlx	%r17, 0x0001, %r29
	.word 0xb1e42157  ! 3599: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbe2c0000  ! 3601: ANDN_R	andn 	%r16, %r0, %r31
	.word 0xb7e4a163  ! 3602: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5e038  ! 3604: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e5e148  ! 3607: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5a0b6  ! 3608: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde421c8  ! 3611: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4213d  ! 3614: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e560e0  ! 3615: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5e1a6  ! 3617: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4a0ca  ! 3621: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e56158  ! 3629: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e46195  ! 3632: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e46033  ! 3634: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3504000  ! 3635: RDPR_TNPC	<illegal instruction>
	.word 0xb60561b2  ! 3636: ADD_I	add 	%r21, 0x01b2, %r27
	.word 0xb9e5a136  ! 3639: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4208c  ! 3640: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb2448000  ! 3641: ADDC_R	addc 	%r18, %r0, %r25
	setx	data_start_6, %g1, %r18
	setx	data_start_2, %g1, %r16
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e179  ! 3649: WRPR_PIL_I	wrpr	%r19, 0x0179, %pil
	.word 0xbbe56141  ! 3651: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbe9d60aa  ! 3653: XORcc_I	xorcc 	%r21, 0x00aa, %r31
	.word 0xbf500000  ! 3654: RDPR_TPC	<illegal instruction>
	.word 0xb23da1f7  ! 3657: XNOR_I	xnor 	%r22, 0x01f7, %r25
	.word 0xbfe5a03b  ! 3660: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1518000  ! 3661: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e52108  ! 3662: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5610e  ! 3665: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5a165  ! 3667: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8594e062  ! 3675: WRPR_TSTATE_I	wrpr	%r19, 0x0062, %tstate
	.word 0xb3e4e0b3  ! 3677: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbabcc000  ! 3678: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xb43460c2  ! 3679: ORN_I	orn 	%r17, 0x00c2, %r26
	.word 0xb1510000  ! 3681: RDPR_TICK	<illegal instruction>
	.word 0xb0458000  ! 3684: ADDC_R	addc 	%r22, %r0, %r24
	.word 0xb5e4e13d  ! 3685: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 3687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	.word 0xb1e5616e  ! 3689: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1510000  ! 3690: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 3692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	setx	data_start_3, %g1, %r17
	.word 0xb29cc000  ! 3695: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb7e46129  ! 3696: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e460f5  ! 3697: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d95e180  ! 3699: WRPR_PSTATE_I	wrpr	%r23, 0x0180, %pstate
	.word 0xbbe56006  ! 3700: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8195e116  ! 3702: WRPR_TPC_I	wrpr	%r23, 0x0116, %tpc
	.word 0xb1e4219d  ! 3703: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1508000  ! 3708: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 3710: RDPR_TSTATE	<illegal instruction>
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a1fc  ! 3714: WRPR_PIL_I	wrpr	%r18, 0x01fc, %pil
	.word 0xb7e5a10c  ! 3715: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5510000  ! 3716: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a10c  ! 3718: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e560bc  ! 3720: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe42163  ! 3722: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3727: RDPR_TICK	<illegal instruction>
	.word 0xb1e5a174  ! 3729: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd643801  ! 3733: MOVcc_I	<illegal instruction>
	.word 0xb3e521ad  ! 3736: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e5607f  ! 3737: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5a0f3  ! 3739: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5508000  ! 3741: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5216d  ! 3742: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e5e122  ! 3743: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e4e1df  ! 3746: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba254000  ! 3747: SUB_R	sub 	%r21, %r0, %r29
	.word 0xb7e5a139  ! 3749: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a18b  ! 3754: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd2d4000  ! 3755: SLL_R	sll 	%r21, %r0, %r30
	.word 0xb6b54000  ! 3757: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xb5520000  ! 3758: RDPR_PIL	<illegal instruction>
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5211c  ! 3763: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e521d3  ! 3764: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5a078  ! 3770: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8594a1ed  ! 3776: WRPR_TSTATE_I	wrpr	%r18, 0x01ed, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	.word 0xbde46124  ! 3779: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e4a1e0  ! 3781: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5a09b  ! 3784: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9518000  ! 3787: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe52198  ! 3789: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e4e12b  ! 3790: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5e104  ! 3791: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e560e4  ! 3794: SAVE_I	save	%r21, 0x0001, %r24
	mov	1, %r14
	.word 0xa193a000  ! 3795: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe5e105  ! 3796: SAVE_I	save	%r23, 0x0001, %r31
	mov	2, %r14
	.word 0xa193a000  ! 3799: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a0cd  ! 3804: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5205b  ! 3809: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a077  ! 3814: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb551c000  ! 3815: RDPR_TL	<illegal instruction>
	.word 0xbbe52120  ! 3818: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5480000  ! 3822: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb1e5a025  ! 3824: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198280b  ! 3826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
	.word 0xb1e5e09d  ! 3828: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4e045  ! 3829: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5e005  ! 3830: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd508000  ! 3833: RDPR_TSTATE	<illegal instruction>
	.word 0xb335d000  ! 3834: SRLX_R	srlx	%r23, %r0, %r25
	.word 0xbb520000  ! 3837: RDPR_PIL	<illegal instruction>
	.word 0xbb2dc000  ! 3839: SLL_R	sll 	%r23, %r0, %r29
	.word 0xb6b5e1e3  ! 3845: ORNcc_I	orncc 	%r23, 0x01e3, %r27
	setx	data_start_1, %g1, %r21
	.word 0xbb7d2401  ! 3849: MOVR_I	movre	%r20, 0x1, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982849  ! 3851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0849, %hpstate
	.word 0xb3e4215c  ! 3853: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e08c  ! 3855: WRPR_PSTATE_I	wrpr	%r19, 0x008c, %pstate
	.word 0xbd51c000  ! 3857: RDPR_TL	<illegal instruction>
	.word 0x9195e055  ! 3858: WRPR_PIL_I	wrpr	%r23, 0x0055, %pil
	.word 0xb9e4a0b2  ! 3860: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5a0b1  ! 3861: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe421fe  ! 3868: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb351c000  ! 3869: RDPR_TL	<illegal instruction>
	.word 0xb2bcc000  ! 3870: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xb3e5a1d5  ! 3871: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4e0ae  ! 3872: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e460fc  ! 3873: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 3877: RDPR_PIL	<illegal instruction>
	.word 0xbde5a00a  ! 3878: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e52067  ! 3881: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56009  ! 3885: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5a085  ! 3886: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe4a102  ! 3887: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e5e08c  ! 3889: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd349000  ! 3890: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xb63d8000  ! 3891: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xb7e5a189  ! 3893: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e56168  ! 3896: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e4a146  ! 3897: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5217f  ! 3898: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde4a06b  ! 3899: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4a183  ! 3900: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5e0ae  ! 3905: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e5603f  ! 3906: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb22c8000  ! 3909: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xb77d8400  ! 3922: MOVR_R	movre	%r22, %r0, %r27
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ed1  ! 3929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed1, %hpstate
	.word 0xb934a001  ! 3930: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xb3520000  ! 3932: RDPR_PIL	<illegal instruction>
	.word 0xbf51c000  ! 3934: RDPR_TL	<illegal instruction>
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4348000  ! 3943: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xbfe4e16b  ! 3946: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbabdc000  ! 3947: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0xbbe560f0  ! 3950: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5a1f2  ! 3951: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4a04d  ! 3952: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xba2dc000  ! 3959: ANDN_R	andn 	%r23, %r0, %r29
	.word 0x8d95e095  ! 3960: WRPR_PSTATE_I	wrpr	%r23, 0x0095, %pstate
	.word 0xb3e5e171  ! 3963: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d956067  ! 3965: WRPR_PSTATE_I	wrpr	%r21, 0x0067, %pstate
	.word 0xb9e52006  ! 3966: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7504000  ! 3967: RDPR_TNPC	<illegal instruction>
	.word 0xb1e560cb  ! 3968: SAVE_I	save	%r21, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 3969: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd51c000  ! 3970: RDPR_TL	<illegal instruction>
	.word 0xb3e5e091  ! 3971: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e420da  ! 3974: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xba9c8000  ! 3976: XORcc_R	xorcc 	%r18, %r0, %r29
	.word 0xb1e5e13c  ! 3977: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb2c5000  ! 3980: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xb7510000  ! 3981: RDPR_TICK	<illegal instruction>
	.word 0xb5e421cf  ! 3982: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a185  ! 3984: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7510000  ! 3988: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a12b  ! 3989: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8195e01d  ! 3990: WRPR_TPC_I	wrpr	%r23, 0x001d, %tpc
	.word 0xb1e4a0da  ! 3993: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde56121  ! 3995: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4212a  ! 3998: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e560fe  ! 4000: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde46165  ! 4001: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a0a2  ! 4002: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561aa  ! 4006: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe461bd  ! 4007: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42168  ! 4009: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 4011: RDPR_TNPC	<illegal instruction>
	.word 0xbb51c000  ! 4013: RDPR_TL	<illegal instruction>
	.word 0xbbe460d8  ! 4015: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbd540000  ! 4016: RDPR_GL	<illegal instruction>
	.word 0xb7e56032  ! 4019: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4a020  ! 4024: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5a074  ! 4025: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5540000  ! 4027: RDPR_GL	<illegal instruction>
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe421fe  ! 4035: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde4e1b9  ! 4038: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e5a16d  ! 4043: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a162  ! 4047: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde42002  ! 4050: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4a03f  ! 4052: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4e093  ! 4053: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1da  ! 4057: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x81946172  ! 4060: WRPR_TPC_I	wrpr	%r17, 0x0172, %tpc
	.word 0xb734a001  ! 4068: SRL_I	srl 	%r18, 0x0001, %r27
	.word 0xb935c000  ! 4069: SRL_R	srl 	%r23, %r0, %r28
	.word 0xb7e5a055  ! 4071: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e42043  ! 4072: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb350c000  ! 4082: RDPR_TT	<illegal instruction>
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42010  ! 4090: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5504000  ! 4091: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4e078  ! 4096: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e420a2  ! 4100: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb8b46089  ! 4104: SUBCcc_I	orncc 	%r17, 0x0089, %r28
	.word 0xb9e4a0ac  ! 4109: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd540000  ! 4112: RDPR_GL	<illegal instruction>
	.word 0xb72c0000  ! 4114: SLL_R	sll 	%r16, %r0, %r27
	.word 0xb7e4e11c  ! 4117: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5e09f  ! 4119: SAVE_I	save	%r23, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 4127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe52144  ! 4128: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb934e001  ! 4134: SRL_I	srl 	%r19, 0x0001, %r28
	.word 0xb5e52012  ! 4137: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb81c0000  ! 4138: XOR_R	xor 	%r16, %r0, %r28
	.word 0xbbe460d0  ! 4142: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb72ca001  ! 4144: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xb9e5610e  ! 4152: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf50c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xb9e46060  ! 4154: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4a089  ! 4155: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4a0bc  ! 4158: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1540000  ! 4159: RDPR_GL	<illegal instruction>
	.word 0x8594a13e  ! 4161: WRPR_TSTATE_I	wrpr	%r18, 0x013e, %tstate
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46143  ! 4165: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde42100  ! 4166: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9354000  ! 4168: SRL_R	srl 	%r21, %r0, %r28
	.word 0xbfe5e045  ! 4170: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb50c000  ! 4171: RDPR_TT	<illegal instruction>
	.word 0x8194e0d8  ! 4172: WRPR_TPC_I	wrpr	%r19, 0x00d8, %tpc
	setx	data_start_3, %g1, %r16
	.word 0xb9480000  ! 4180: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8994a1de  ! 4184: WRPR_TICK_I	wrpr	%r18, 0x01de, %tick
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e034  ! 4186: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbc1de1ce  ! 4191: XOR_I	xor 	%r23, 0x01ce, %r30
	.word 0xbde42180  ! 4192: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e56166  ! 4197: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8394a1fa  ! 4198: WRPR_TNPC_I	wrpr	%r18, 0x01fa, %tnpc
	.word 0xb3e5209e  ! 4200: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbc9dc000  ! 4202: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xbbe5215f  ! 4204: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e4e0f7  ! 4205: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4e1d0  ! 4206: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4a069  ! 4208: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe421fb  ! 4216: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbb500000  ! 4219: RDPR_TPC	<illegal instruction>
	.word 0xb1345000  ! 4220: SRLX_R	srlx	%r17, %r0, %r24
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 4226: RDPR_TPC	<illegal instruction>
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xb7e4609b  ! 4235: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd500000  ! 4236: RDPR_TPC	<illegal instruction>
	.word 0xb9e520f0  ! 4237: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbd34f001  ! 4238: SRLX_I	srlx	%r19, 0x0001, %r30
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e521c8  ! 4240: SAVE_I	save	%r20, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 4243: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3508000  ! 4245: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4606c  ! 4246: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8d9520e6  ! 4251: WRPR_PSTATE_I	wrpr	%r20, 0x00e6, %pstate
	mov	0, %r12
	.word 0x8f932000  ! 4253: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcbd205e  ! 4254: XNORcc_I	xnorcc 	%r20, 0x005e, %r30
	.word 0xb6a4c000  ! 4255: SUBcc_R	subcc 	%r19, %r0, %r27
	.word 0xbb518000  ! 4256: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r18
	.word 0xbde56112  ! 4259: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb13d9000  ! 4263: SRAX_R	srax	%r22, %r0, %r24
	.word 0xb52c2001  ! 4270: SLL_I	sll 	%r16, 0x0001, %r26
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461bc  ! 4276: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5a048  ! 4277: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5e003  ! 4281: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4288: RDPR_PIL	<illegal instruction>
	.word 0xb3e5a0d3  ! 4289: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9510000  ! 4292: RDPR_TICK	<illegal instruction>
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46063  ! 4298: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e561f1  ! 4300: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8194603e  ! 4303: WRPR_TPC_I	wrpr	%r17, 0x003e, %tpc
	.word 0xb1e5a0aa  ! 4304: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5a157  ! 4308: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e420ac  ! 4309: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e07a  ! 4314: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5e03c  ! 4322: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4a0c3  ! 4323: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe46040  ! 4324: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1353001  ! 4328: SRLX_I	srlx	%r20, 0x0001, %r24
	.word 0xb5e4e1d4  ! 4330: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e421c0  ! 4333: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e560cc  ! 4334: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5a1e4  ! 4336: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a1bc  ! 4340: WRPR_TNPC_I	wrpr	%r18, 0x01bc, %tnpc
	.word 0xb3520000  ! 4341: RDPR_PIL	<illegal instruction>
	.word 0xb1e5604a  ! 4342: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4204b  ! 4344: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe46176  ! 4345: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8194a079  ! 4346: WRPR_TPC_I	wrpr	%r18, 0x0079, %tpc
	.word 0xb7e4602b  ! 4348: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8994e1ca  ! 4349: WRPR_TICK_I	wrpr	%r19, 0x01ca, %tick
	.word 0xb950c000  ! 4352: RDPR_TT	<illegal instruction>
	.word 0x819521c4  ! 4354: WRPR_TPC_I	wrpr	%r20, 0x01c4, %tpc
	.word 0xb1e421af  ! 4357: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe521bb  ! 4360: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_0, %g1, %r23
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 4366: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9e4e0a6  ! 4371: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e5e001  ! 4372: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e46104  ! 4373: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5e01a  ! 4374: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4e1e1  ! 4380: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ad3  ! 4384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad3, %hpstate
	.word 0xb2b52066  ! 4385: SUBCcc_I	orncc 	%r20, 0x0066, %r25
	.word 0xb0848000  ! 4386: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xb83d4000  ! 4390: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0x919461f3  ! 4392: WRPR_PIL_I	wrpr	%r17, 0x01f3, %pil
	.word 0x9194a144  ! 4394: WRPR_PIL_I	wrpr	%r18, 0x0144, %pil
	.word 0xb5e4a0fb  ! 4396: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb43cc000  ! 4397: XNOR_R	xnor 	%r19, %r0, %r26
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ac2126  ! 4399: ANDNcc_I	andncc 	%r16, 0x0126, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 4405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	.word 0xbde5e148  ! 4408: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe4a103  ! 4410: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4201c  ! 4411: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4e11b  ! 4413: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4a076  ! 4414: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_1, %g1, %r23
	setx	data_start_6, %g1, %r17
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794619a  ! 4428: WRPR_TT_I	wrpr	%r17, 0x019a, %tt
	.word 0xb805a087  ! 4429: ADD_I	add 	%r22, 0x0087, %r28
	.word 0xb1e461fc  ! 4431: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d9420cd  ! 4432: WRPR_PSTATE_I	wrpr	%r16, 0x00cd, %pstate
	.word 0xba45619b  ! 4436: ADDC_I	addc 	%r21, 0x019b, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 4441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	setx	0x30f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521ea  ! 4444: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde56037  ! 4445: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4a0dc  ! 4447: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8995a12b  ! 4449: WRPR_TICK_I	wrpr	%r22, 0x012b, %tick
	.word 0xb0b520e0  ! 4451: SUBCcc_I	orncc 	%r20, 0x00e0, %r24
	.word 0x9195a1e4  ! 4453: WRPR_PIL_I	wrpr	%r22, 0x01e4, %pil
	.word 0xb9e5201b  ! 4455: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4605f  ! 4458: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4206f  ! 4459: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4a07a  ! 4461: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e46131  ! 4462: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbabcc000  ! 4463: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xbbe561e1  ! 4468: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb751c000  ! 4470: RDPR_TL	<illegal instruction>
	.word 0xbbe4a0f4  ! 4474: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5a1ff  ! 4475: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e42015  ! 4476: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e5a182  ! 4477: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e071  ! 4484: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde5e1f7  ! 4491: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e42023  ! 4492: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8395205a  ! 4495: WRPR_TNPC_I	wrpr	%r20, 0x005a, %tnpc
	.word 0xb3e4a0fc  ! 4498: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbe150000  ! 4501: OR_R	or 	%r20, %r0, %r31
	.word 0xb7e5a1ba  ! 4504: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb01520d2  ! 4505: OR_I	or 	%r20, 0x00d2, %r24
	.word 0xb1540000  ! 4506: RDPR_GL	<illegal instruction>
	.word 0xb3e4a123  ! 4507: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e00f  ! 4510: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4513: RDPR_TT	<illegal instruction>
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63560c7  ! 4518: SUBC_I	orn 	%r21, 0x00c7, %r27
	.word 0xbf3db001  ! 4520: SRAX_I	srax	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983841  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1841, %hpstate
	.word 0x8195e0ee  ! 4522: WRPR_TPC_I	wrpr	%r23, 0x00ee, %tpc
	.word 0xb3e4a1eb  ! 4532: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e5202b  ! 4533: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4216d  ! 4534: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e46102  ! 4535: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb005a091  ! 4536: ADD_I	add 	%r22, 0x0091, %r24
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e12e  ! 4541: WRPR_TICK_I	wrpr	%r23, 0x012e, %tick
	.word 0xb1520000  ! 4542: RDPR_PIL	<illegal instruction>
	.word 0x8594e01c  ! 4546: WRPR_TSTATE_I	wrpr	%r19, 0x001c, %tstate
	.word 0xbde5a0b0  ! 4548: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e461c8  ! 4549: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5e015  ! 4552: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4e0cb  ! 4554: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4e144  ! 4556: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc2d2018  ! 4559: ANDN_I	andn 	%r20, 0x0018, %r30
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e07b  ! 4563: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983fc1  ! 4564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc1, %hpstate
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819561d2  ! 4577: WRPR_TPC_I	wrpr	%r21, 0x01d2, %tpc
	.word 0xb1641800  ! 4581: MOVcc_R	<illegal instruction>
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879561ce  ! 4584: WRPR_TT_I	wrpr	%r21, 0x01ce, %tt
	.word 0xb3e420dd  ! 4587: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde56117  ! 4588: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e560a2  ! 4589: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc846017  ! 4590: ADDcc_I	addcc 	%r17, 0x0017, %r30
	.word 0xb3e4a15c  ! 4592: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_5, %g1, %r16
	.word 0xbb518000  ! 4595: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e4a0f5  ! 4596: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd500000  ! 4600: RDPR_TPC	<illegal instruction>
	.word 0xb0ad8000  ! 4604: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xbfe46114  ! 4606: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb50c000  ! 4611: RDPR_TT	rdpr	%tt, %r29
	mov	0, %r14
	.word 0xa193a000  ! 4612: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5215b  ! 4613: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb8444000  ! 4614: ADDC_R	addc 	%r17, %r0, %r28
	mov	0, %r12
	.word 0x8f932000  ! 4615: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982ed1  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	.word 0xb3e5e062  ! 4620: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_6, %g1, %r16
	.word 0xbfe5a15c  ! 4623: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe561a9  ! 4626: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e4e188  ! 4629: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983e91  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e91, %hpstate
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a143  ! 4638: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e52132  ! 4640: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe561ba  ! 4642: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r12
	.word 0x8f932000  ! 4645: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 4648: RDPR_TICK	<illegal instruction>
	.word 0xb9e4a135  ! 4653: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde520f0  ! 4655: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4a1b3  ! 4656: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4a06b  ! 4661: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4615e  ! 4662: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e039  ! 4665: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4e0ba  ! 4668: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9520000  ! 4672: RDPR_PIL	<illegal instruction>
	.word 0xb0256076  ! 4675: SUB_I	sub 	%r21, 0x0076, %r24
	.word 0xb7e5a10c  ! 4680: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a0b6  ! 4682: WRPR_TNPC_I	wrpr	%r18, 0x00b6, %tnpc
	.word 0xbde4a124  ! 4685: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5a116  ! 4686: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbb504000  ! 4689: RDPR_TNPC	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4694: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e520ee  ! 4695: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a189  ! 4697: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1510000  ! 4698: RDPR_TICK	<illegal instruction>
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1f3  ! 4701: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde521c2  ! 4704: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4a064  ! 4706: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e42098  ! 4707: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8594a11b  ! 4710: WRPR_TSTATE_I	wrpr	%r18, 0x011b, %tstate
	.word 0xbbe4203c  ! 4712: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3540000  ! 4713: RDPR_GL	<illegal instruction>
	.word 0xb9e5a021  ! 4714: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8594a140  ! 4717: WRPR_TSTATE_I	wrpr	%r18, 0x0140, %tstate
	.word 0xbde46084  ! 4718: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560b6  ! 4723: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb235c000  ! 4724: SUBC_R	orn 	%r23, %r0, %r25
	setx	data_start_6, %g1, %r18
	.word 0xbcad4000  ! 4726: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0x8195e111  ! 4728: WRPR_TPC_I	wrpr	%r23, 0x0111, %tpc
	.word 0xb32ca001  ! 4729: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0xbbe5617d  ! 4734: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e42041  ! 4744: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xba0ca093  ! 4748: AND_I	and 	%r18, 0x0093, %r29
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xb3518000  ! 4754: RDPR_PSTATE	<illegal instruction>
	.word 0x8d95e1ea  ! 4755: WRPR_PSTATE_I	wrpr	%r23, 0x01ea, %pstate
	.word 0xb9e52011  ! 4757: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e461af  ! 4759: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde42035  ! 4761: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e1d4  ! 4767: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb60da0f7  ! 4768: AND_I	and 	%r22, 0x00f7, %r27
	.word 0xb5e52157  ! 4770: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0xbcac21bc  ! 4778: ANDNcc_I	andncc 	%r16, 0x01bc, %r30
	.word 0xb7e5a1db  ! 4779: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4e05c  ! 4783: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a1d8  ! 4787: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4150000  ! 4793: OR_R	or 	%r20, %r0, %r26
	.word 0xb5510000  ! 4795: RDPR_TICK	<illegal instruction>
	.word 0xb7e5e1cb  ! 4796: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c9000  ! 4800: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xb1540000  ! 4805: RDPR_GL	<illegal instruction>
	.word 0xbd504000  ! 4806: RDPR_TNPC	<illegal instruction>
	.word 0xbc1c8000  ! 4808: XOR_R	xor 	%r18, %r0, %r30
	.word 0xb7518000  ! 4810: RDPR_PSTATE	<illegal instruction>
	.word 0x899560c0  ! 4813: WRPR_TICK_I	wrpr	%r21, 0x00c0, %tick
	.word 0xb1e4e1e2  ! 4814: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e46079  ! 4815: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e46068  ! 4818: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5e0f6  ! 4819: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e461bf  ! 4821: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e561a6  ! 4824: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 4827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xb5e4a1f8  ! 4833: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4a07d  ! 4835: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7510000  ! 4839: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e06e  ! 4843: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3480000  ! 4844: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x91942063  ! 4845: WRPR_PIL_I	wrpr	%r16, 0x0063, %pil
	.word 0xb9e4a169  ! 4848: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb150c000  ! 4850: RDPR_TT	<illegal instruction>
	.word 0xbde561e6  ! 4853: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e147  ! 4859: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde56192  ! 4863: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0f0  ! 4867: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd480000  ! 4868: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbde56076  ! 4873: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a15b  ! 4875: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xb1e4e12f  ! 4879: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x819828c3  ! 4884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c3, %hpstate
	.word 0xbbe521f5  ! 4888: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e561bb  ! 4889: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4e0c4  ! 4892: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1540000  ! 4893: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 4898: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	.word 0xbabde080  ! 4899: XNORcc_I	xnorcc 	%r23, 0x0080, %r29
	.word 0xb83ca129  ! 4903: XNOR_I	xnor 	%r18, 0x0129, %r28
	.word 0xbde4e08f  ! 4905: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8794e06b  ! 4906: WRPR_TT_I	wrpr	%r19, 0x006b, %tt
	.word 0x8594219d  ! 4911: WRPR_TSTATE_I	wrpr	%r16, 0x019d, %tstate
	.word 0xb7e520fb  ! 4923: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4a0c1  ! 4926: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e421da  ! 4928: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4216c  ! 4932: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe4e016  ! 4937: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e4a082  ! 4938: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe4a174  ! 4939: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73d7001  ! 4945: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0xbde56139  ! 4947: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb49561c5  ! 4951: ORcc_I	orcc 	%r21, 0x01c5, %r26
	.word 0xb5e4a143  ! 4954: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e52186  ! 4955: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5480000  ! 4957: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e561b2  ! 4960: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8994e02b  ! 4965: WRPR_TICK_I	wrpr	%r19, 0x002b, %tick
	.word 0xb9e5a15f  ! 4966: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e420c3  ! 4967: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e46039  ! 4976: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7480000  ! 4977: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e520d4  ! 4981: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e460c5  ! 4982: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe461c5  ! 4984: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e52080  ! 4985: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf480000  ! 4987: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb2b5a0bf  ! 4990: SUBCcc_I	orncc 	%r22, 0x00bf, %r25
	.word 0xb5500000  ! 4993: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 4994: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 4995: RDPR_TSTATE	<illegal instruction>
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
	.word 0xb2bca0af  ! 1: XNORcc_I	xnorcc 	%r18, 0x00af, %r25
	.word 0xf43d0000  ! 2: STD_R	std	%r26, [%r20 + %r0]
	.word 0x839560ec  ! 4: WRPR_TNPC_I	wrpr	%r21, 0x00ec, %tnpc
	.word 0xfc2521e7  ! 7: STW_I	stw	%r30, [%r20 + 0x01e7]
	.word 0xb8340000  ! 11: SUBC_R	orn 	%r16, %r0, %r28
	.word 0xf73da0ba  ! 12: STDF_I	std	%f27, [0x00ba, %r22]
	.word 0xb5480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfe25c000  ! 17: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfa2c0000  ! 19: STB_R	stb	%r29, [%r16 + %r0]
	.word 0x8794a091  ! 20: WRPR_TT_I	wrpr	%r18, 0x0091, %tt
	.word 0xfe244000  ! 21: STW_R	stw	%r31, [%r17 + %r0]
	setx	data_start_0, %g1, %r19
	.word 0xf4746171  ! 26: STX_I	stx	%r26, [%r17 + 0x0171]
	.word 0xfc24a014  ! 31: STW_I	stw	%r30, [%r18 + 0x0014]
	.word 0xfe3d210f  ! 32: STD_I	std	%r31, [%r20 + 0x010f]
	.word 0xf83cc000  ! 34: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf43c6100  ! 35: STD_I	std	%r26, [%r17 + 0x0100]
	.word 0xb2bd8000  ! 38: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xfe344000  ! 40: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf13c60df  ! 41: STDF_I	std	%f24, [0x00df, %r17]
	.word 0xf62da1f9  ! 44: STB_I	stb	%r27, [%r22 + 0x01f9]
	.word 0x8d95a1be  ! 45: WRPR_PSTATE_I	wrpr	%r22, 0x01be, %pstate
	.word 0xf075c000  ! 47: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf62c61bd  ! 49: STB_I	stb	%r27, [%r17 + 0x01bd]
	.word 0x919420d8  ! 53: WRPR_PIL_I	wrpr	%r16, 0x00d8, %pil
	.word 0x8194a1d9  ! 57: WRPR_TPC_I	wrpr	%r18, 0x01d9, %tpc
	.word 0xff3c2170  ! 59: STDF_I	std	%f31, [0x0170, %r16]
	.word 0xfa25207d  ! 60: STW_I	stw	%r29, [%r20 + 0x007d]
	.word 0xb551c000  ! 62: RDPR_TL	rdpr	%tl, %r26
	.word 0xfc3d8000  ! 64: STD_R	std	%r30, [%r22 + %r0]
	.word 0xf02c20e5  ! 66: STB_I	stb	%r24, [%r16 + 0x00e5]
	.word 0xbb2d0000  ! 68: SLL_R	sll 	%r20, %r0, %r29
	.word 0x91942137  ! 69: WRPR_PIL_I	wrpr	%r16, 0x0137, %pil
	.word 0x8d94a045  ! 71: WRPR_PSTATE_I	wrpr	%r18, 0x0045, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	.word 0xbb540000  ! 74: RDPR_GL	rdpr	%-, %r29
	.word 0xfb3dc000  ! 80: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfa34e1bc  ! 84: STH_I	sth	%r29, [%r19 + 0x01bc]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5500000  ! 86: RDPR_TPC	<illegal instruction>
	.word 0xfa2d0000  ! 90: STB_R	stb	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	.word 0x8995a181  ! 92: WRPR_TICK_I	wrpr	%r22, 0x0181, %tick
	.word 0x8d94e05a  ! 93: WRPR_PSTATE_I	wrpr	%r19, 0x005a, %pstate
	.word 0xb9480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	2, %r12
	.word 0x8f932000  ! 95: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc2d212f  ! 96: STB_I	stb	%r30, [%r20 + 0x012f]
	.word 0xb43d2001  ! 99: XNOR_I	xnor 	%r20, 0x0001, %r26
	.word 0xfa2c6076  ! 100: STB_I	stb	%r29, [%r17 + 0x0076]
	.word 0xb9518000  ! 101: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf13da015  ! 106: STDF_I	std	%f24, [0x0015, %r22]
	.word 0xfa3420e4  ! 111: STH_I	sth	%r29, [%r16 + 0x00e4]
	.word 0xf22c0000  ! 113: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb23dc000  ! 118: XNOR_R	xnor 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x819829d1  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0xf63c6080  ! 120: STD_I	std	%r27, [%r17 + 0x0080]
	.word 0xb9520000  ! 122: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfa74c000  ! 127: STX_R	stx	%r29, [%r19 + %r0]
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d0000  ! 130: STDF_R	std	%f27, [%r0, %r20]
	.word 0xfe2d604f  ! 132: STB_I	stb	%r31, [%r21 + 0x004f]
	mov	1, %r14
	.word 0xa193a000  ! 134: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r18
	.word 0xfa244000  ! 136: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xb5641800  ! 137: MOVcc_R	<illegal instruction>
	.word 0xfc240000  ! 151: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfe256000  ! 153: STW_I	stw	%r31, [%r21 + 0x0000]
	ta	T_CHANGE_HPRIV
	.word 0x81983983  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1983, %hpstate
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d4000  ! 156: STDF_R	std	%f28, [%r0, %r21]
	.word 0xfd3da1cf  ! 166: STDF_I	std	%f30, [0x01cf, %r22]
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874e14c  ! 169: STX_I	stx	%r28, [%r19 + 0x014c]
	.word 0xb4150000  ! 171: OR_R	or 	%r20, %r0, %r26
	.word 0xf6750000  ! 172: STX_R	stx	%r27, [%r20 + %r0]
	setx	data_start_4, %g1, %r21
	.word 0xf0758000  ! 177: STX_R	stx	%r24, [%r22 + %r0]
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 182: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf22de19a  ! 183: STB_I	stb	%r25, [%r23 + 0x019a]
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3cc000  ! 187: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf234c000  ! 188: STH_R	sth	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e51  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e51, %hpstate
	.word 0xbe1d4000  ! 198: XOR_R	xor 	%r21, %r0, %r31
	.word 0x87956070  ! 199: WRPR_TT_I	wrpr	%r21, 0x0070, %tt
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3c4000  ! 202: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb5349000  ! 209: SRLX_R	srlx	%r18, %r0, %r26
	.word 0xbd520000  ! 210: RDPR_PIL	rdpr	%pil, %r30
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c4000  ! 213: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xbf540000  ! 214: RDPR_GL	<illegal instruction>
	.word 0x8594a125  ! 215: WRPR_TSTATE_I	wrpr	%r18, 0x0125, %tstate
	.word 0xfc2460a7  ! 220: STW_I	stw	%r30, [%r17 + 0x00a7]
	.word 0xb1500000  ! 223: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8994208a  ! 225: WRPR_TICK_I	wrpr	%r16, 0x008a, %tick
	.word 0xb7508000  ! 230: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf634a1ec  ! 236: STH_I	sth	%r27, [%r18 + 0x01ec]
	.word 0x89956176  ! 239: WRPR_TICK_I	wrpr	%r21, 0x0176, %tick
	.word 0xb3643801  ! 242: MOVcc_I	<illegal instruction>
	.word 0xf6240000  ! 246: STW_R	stw	%r27, [%r16 + %r0]
	setx	data_start_2, %g1, %r23
	.word 0xf074e057  ! 250: STX_I	stx	%r24, [%r19 + 0x0057]
	.word 0xf43d0000  ! 251: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf024c000  ! 255: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfe3c4000  ! 256: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf235c000  ! 257: STH_R	sth	%r25, [%r23 + %r0]
	.word 0x819421b0  ! 261: WRPR_TPC_I	wrpr	%r16, 0x01b0, %tpc
	setx	data_start_1, %g1, %r17
	.word 0xb52c0000  ! 263: SLL_R	sll 	%r16, %r0, %r26
	.word 0xf03c0000  ! 268: STD_R	std	%r24, [%r16 + %r0]
	.word 0xb1480000  ! 273: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf4344000  ! 280: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf42c208d  ! 285: STB_I	stb	%r26, [%r16 + 0x008d]
	.word 0xfc350000  ! 286: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xbe25c000  ! 288: SUB_R	sub 	%r23, %r0, %r31
	.word 0x899561d4  ! 294: WRPR_TICK_I	wrpr	%r21, 0x01d4, %tick
	.word 0xb151c000  ! 295: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982841  ! 298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	.word 0xfe2d0000  ! 301: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xbf7d2401  ! 304: MOVR_I	movre	%r20, 0x1, %r31
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8594e178  ! 312: WRPR_TSTATE_I	wrpr	%r19, 0x0178, %tstate
	.word 0xf075610f  ! 315: STX_I	stx	%r24, [%r21 + 0x010f]
	.word 0xbb508000  ! 317: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xfe74c000  ! 320: STX_R	stx	%r31, [%r19 + %r0]
	.word 0x8794a101  ! 321: WRPR_TT_I	wrpr	%r18, 0x0101, %tt
	.word 0xf6342109  ! 324: STH_I	sth	%r27, [%r16 + 0x0109]
	.word 0xfe34c000  ! 328: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf87561a0  ! 329: STX_I	stx	%r28, [%r21 + 0x01a0]
	.word 0xf93ce1ab  ! 330: STDF_I	std	%f28, [0x01ab, %r19]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899421dc  ! 336: WRPR_TICK_I	wrpr	%r16, 0x01dc, %tick
	.word 0x85952199  ! 338: WRPR_TSTATE_I	wrpr	%r20, 0x0199, %tstate
	setx	data_start_2, %g1, %r21
	.word 0xf0254000  ! 343: STW_R	stw	%r24, [%r21 + %r0]
	setx	data_start_7, %g1, %r17
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 352: RDPR_TT	rdpr	%tt, %r27
	.word 0xfa3c2106  ! 354: STD_I	std	%r29, [%r16 + 0x0106]
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9520000  ! 359: RDPR_PIL	<illegal instruction>
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 363: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xfa2ce185  ! 368: STB_I	stb	%r29, [%r19 + 0x0185]
	.word 0xbd500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbb518000  ! 370: RDPR_PSTATE	<illegal instruction>
	.word 0xfe2d0000  ! 372: STB_R	stb	%r31, [%r20 + %r0]
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c8000  ! 374: STD_R	std	%r24, [%r18 + %r0]
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xbd641800  ! 383: MOVcc_R	<illegal instruction>
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa356169  ! 388: STH_I	sth	%r29, [%r21 + 0x0169]
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 397: RDPR_GL	<illegal instruction>
	setx	data_start_2, %g1, %r18
	.word 0xf13d8000  ! 403: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf47521b4  ! 408: STX_I	stx	%r26, [%r20 + 0x01b4]
	.word 0xbb500000  ! 409: RDPR_TPC	<illegal instruction>
	.word 0xf235c000  ! 412: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf42c8000  ! 413: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xff3d8000  ! 414: STDF_R	std	%f31, [%r0, %r22]
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 420: STB_R	stb	%r30, [%r20 + %r0]
	.word 0x81946188  ! 428: WRPR_TPC_I	wrpr	%r17, 0x0188, %tpc
	setx	data_start_6, %g1, %r19
	.word 0xf83d4000  ! 434: STD_R	std	%r28, [%r21 + %r0]
	.word 0xb5510000  ! 435: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb60420e9  ! 444: ADD_I	add 	%r16, 0x00e9, %r27
	.word 0xf824c000  ! 445: STW_R	stw	%r28, [%r19 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 446: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x91946092  ! 449: WRPR_PIL_I	wrpr	%r17, 0x0092, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982ad1  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad1, %hpstate
	.word 0xfa340000  ! 454: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb4356077  ! 456: ORN_I	orn 	%r21, 0x0077, %r26
	.word 0xbd510000  ! 457: RDPR_TICK	rdpr	%tick, %r30
	setx	0x30317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425a058  ! 464: STW_I	stw	%r26, [%r22 + 0x0058]
	.word 0xf025a141  ! 468: STW_I	stw	%r24, [%r22 + 0x0141]
	.word 0xf43d206c  ! 469: STD_I	std	%r26, [%r20 + 0x006c]
	.word 0x87946094  ! 473: WRPR_TT_I	wrpr	%r17, 0x0094, %tt
	.word 0xb3508000  ! 476: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xbf50c000  ! 485: RDPR_TT	<illegal instruction>
	.word 0x89942150  ! 486: WRPR_TICK_I	wrpr	%r16, 0x0150, %tick
	.word 0xfc2d213d  ! 488: STB_I	stb	%r30, [%r20 + 0x013d]
	.word 0xf13c8000  ! 491: STDF_R	std	%f24, [%r0, %r18]
	.word 0xb0050000  ! 492: ADD_R	add 	%r20, %r0, %r24
	.word 0xf474e16d  ! 493: STX_I	stx	%r26, [%r19 + 0x016d]
	.word 0xfb3d4000  ! 495: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb4340000  ! 497: SUBC_R	orn 	%r16, %r0, %r26
	.word 0xf33dc000  ! 499: STDF_R	std	%f25, [%r0, %r23]
	.word 0xb60d611a  ! 501: AND_I	and 	%r21, 0x011a, %r27
	.word 0xf635e012  ! 503: STH_I	sth	%r27, [%r23 + 0x0012]
	.word 0xb3504000  ! 504: RDPR_TNPC	rdpr	%tnpc, %r25
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d0000  ! 507: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xb60521d8  ! 508: ADD_I	add 	%r20, 0x01d8, %r27
	.word 0xb551c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xf2246038  ! 512: STW_I	stw	%r25, [%r17 + 0x0038]
	.word 0xbf480000  ! 518: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb2358000  ! 522: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xfa2dc000  ! 525: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfc25c000  ! 526: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb014e076  ! 535: OR_I	or 	%r19, 0x0076, %r24
	.word 0xf8752187  ! 536: STX_I	stx	%r28, [%r20 + 0x0187]
	.word 0xb08dc000  ! 543: ANDcc_R	andcc 	%r23, %r0, %r24
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83cc000  ! 547: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf0240000  ! 552: STW_R	stw	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf53dc000  ! 555: STDF_R	std	%f26, [%r0, %r23]
	.word 0x9194a046  ! 559: WRPR_PIL_I	wrpr	%r18, 0x0046, %pil
	.word 0xf02ca046  ! 562: STB_I	stb	%r24, [%r18 + 0x0046]
	.word 0xf13d6127  ! 567: STDF_I	std	%f24, [0x0127, %r21]
	.word 0xf8750000  ! 568: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xbf50c000  ! 569: RDPR_TT	rdpr	%tt, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d99  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
	.word 0xb4350000  ! 572: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xf034e162  ! 575: STH_I	sth	%r24, [%r19 + 0x0162]
	.word 0xb550c000  ! 576: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b49  ! 577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b49, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r20
	.word 0xf93da070  ! 582: STDF_I	std	%f28, [0x0070, %r22]
	.word 0x85946105  ! 583: WRPR_TSTATE_I	wrpr	%r17, 0x0105, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0xf23d6070  ! 589: STD_I	std	%r25, [%r21 + 0x0070]
	.word 0xbeb44000  ! 594: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xfe2c2112  ! 597: STB_I	stb	%r31, [%r16 + 0x0112]
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02de027  ! 601: STB_I	stb	%r24, [%r23 + 0x0027]
	.word 0xf33d611d  ! 605: STDF_I	std	%f25, [0x011d, %r21]
	.word 0xf024c000  ! 606: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xbe3520de  ! 609: ORN_I	orn 	%r20, 0x00de, %r31
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 615: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf2740000  ! 616: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf93c4000  ! 617: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf235e1b3  ! 621: STH_I	sth	%r25, [%r23 + 0x01b3]
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbe244000  ! 629: SUB_R	sub 	%r17, %r0, %r31
	.word 0xfb3cc000  ! 630: STDF_R	std	%f29, [%r0, %r19]
	.word 0xfa348000  ! 632: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf824c000  ! 633: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xff3d61ba  ! 636: STDF_I	std	%f31, [0x01ba, %r21]
	.word 0xfe3de1f2  ! 637: STD_I	std	%r31, [%r23 + 0x01f2]
	setx	0x20029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879521e0  ! 648: WRPR_TT_I	wrpr	%r20, 0x01e0, %tt
	mov	2, %r14
	.word 0xa193a000  ! 649: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0xfe2dc000  ! 654: STB_R	stb	%r31, [%r23 + %r0]
	.word 0x8d95a15b  ! 656: WRPR_PSTATE_I	wrpr	%r22, 0x015b, %pstate
	.word 0xfa3cc000  ! 658: STD_R	std	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983dd9  ! 660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd9, %hpstate
	.word 0xfc744000  ! 662: STX_R	stx	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982883  ! 663: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	.word 0xf42c0000  ! 666: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xfd3d0000  ! 668: STDF_R	std	%f30, [%r0, %r20]
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2a50000  ! 682: SUBcc_R	subcc 	%r20, %r0, %r25
	.word 0xbd510000  ! 683: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf03de121  ! 685: STD_I	std	%r24, [%r23 + 0x0121]
	.word 0xfe754000  ! 686: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf53cc000  ! 688: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf835605f  ! 689: STH_I	sth	%r28, [%r21 + 0x005f]
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a1aa  ! 697: WRPR_TT_I	wrpr	%r22, 0x01aa, %tt
	.word 0xb9500000  ! 703: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xf225a0b9  ! 704: STW_I	stw	%r25, [%r22 + 0x00b9]
	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf425e011  ! 716: STW_I	stw	%r26, [%r23 + 0x0011]
	.word 0xf024a05f  ! 717: STW_I	stw	%r24, [%r18 + 0x005f]
	.word 0xb3520000  ! 721: RDPR_PIL	rdpr	%pil, %r25
	.word 0xbd504000  ! 722: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 725: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d9461bb  ! 726: WRPR_PSTATE_I	wrpr	%r17, 0x01bb, %pstate
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 732: STW_R	stw	%r29, [%r23 + %r0]
	.word 0x87956187  ! 734: WRPR_TT_I	wrpr	%r21, 0x0187, %tt
	.word 0xf425212f  ! 736: STW_I	stw	%r26, [%r20 + 0x012f]
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42d4000  ! 748: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfd3c6138  ! 749: STDF_I	std	%f30, [0x0138, %r17]
	.word 0x8595e115  ! 753: WRPR_TSTATE_I	wrpr	%r23, 0x0115, %tstate
	.word 0xb7508000  ! 755: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf23c8000  ! 757: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf73d4000  ! 764: STDF_R	std	%f27, [%r0, %r21]
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 766: RDPR_TNPC	<illegal instruction>
	.word 0xf6754000  ! 768: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf63d0000  ! 774: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfa244000  ! 776: STW_R	stw	%r29, [%r17 + %r0]
	.word 0x8195e10c  ! 784: WRPR_TPC_I	wrpr	%r23, 0x010c, %tpc
	.word 0xf82c0000  ! 785: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb0440000  ! 786: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xf275200b  ! 788: STX_I	stx	%r25, [%r20 + 0x000b]
	.word 0xfc3d2137  ! 789: STD_I	std	%r30, [%r20 + 0x0137]
	.word 0xbf2dd000  ! 793: SLLX_R	sllx	%r23, %r0, %r31
	.word 0xf43d8000  ! 794: STD_R	std	%r26, [%r22 + %r0]
	.word 0xb284c000  ! 798: ADDcc_R	addcc 	%r19, %r0, %r25
	.word 0xf0750000  ! 799: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xb68c8000  ! 802: ANDcc_R	andcc 	%r18, %r0, %r27
	.word 0xfa358000  ! 803: STH_R	sth	%r29, [%r22 + %r0]
	setx	data_start_6, %g1, %r16
	.word 0xf6758000  ! 805: STX_R	stx	%r27, [%r22 + %r0]
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c21f2  ! 810: STD_I	std	%r24, [%r16 + 0x01f2]
	.word 0xfe75c000  ! 811: STX_R	stx	%r31, [%r23 + %r0]
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c6027  ! 815: STB_I	stb	%r30, [%r17 + 0x0027]
	.word 0xb951c000  ! 816: RDPR_TL	rdpr	%tl, %r28
	.word 0xf62c21b5  ! 825: STB_I	stb	%r27, [%r16 + 0x01b5]
	mov	2, %r14
	.word 0xa193a000  ! 826: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf42421b9  ! 828: STW_I	stw	%r26, [%r16 + 0x01b9]
	.word 0xfa358000  ! 829: STH_R	sth	%r29, [%r22 + %r0]
	.word 0x8d956185  ! 830: WRPR_PSTATE_I	wrpr	%r21, 0x0185, %pstate
	.word 0xfa350000  ! 831: STH_R	sth	%r29, [%r20 + %r0]
	.word 0x8795e016  ! 833: WRPR_TT_I	wrpr	%r23, 0x0016, %tt
	.word 0xf02da1df  ! 834: STB_I	stb	%r24, [%r22 + 0x01df]
	.word 0xf82d20bb  ! 835: STB_I	stb	%r28, [%r20 + 0x00bb]
	.word 0xf024a148  ! 837: STW_I	stw	%r24, [%r18 + 0x0148]
	.word 0xfe35c000  ! 838: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb9520000  ! 843: RDPR_PIL	rdpr	%pil, %r28
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 851: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba858000  ! 854: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xf235a047  ! 856: STH_I	sth	%r25, [%r22 + 0x0047]
	setx	data_start_5, %g1, %r16
	.word 0xfc3d0000  ! 870: STD_R	std	%r30, [%r20 + %r0]
	.word 0xbb480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d61df  ! 880: STDF_I	std	%f28, [0x01df, %r21]
	.word 0xba1ce059  ! 881: XOR_I	xor 	%r19, 0x0059, %r29
	.word 0xfe2d21fb  ! 885: STB_I	stb	%r31, [%r20 + 0x01fb]
	.word 0x8394e05f  ! 886: WRPR_TNPC_I	wrpr	%r19, 0x005f, %tnpc
	.word 0xfe74e123  ! 887: STX_I	stx	%r31, [%r19 + 0x0123]
	mov	2, %r14
	.word 0xa193a000  ! 891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9508000  ! 894: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xbd510000  ! 896: RDPR_TICK	<illegal instruction>
	.word 0xf13d20ca  ! 898: STDF_I	std	%f24, [0x00ca, %r20]
	.word 0xf6248000  ! 899: STW_R	stw	%r27, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983943  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1943, %hpstate
	.word 0xf024604a  ! 904: STW_I	stw	%r24, [%r17 + 0x004a]
	.word 0xb6958000  ! 905: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0xb2358000  ! 907: SUBC_R	orn 	%r22, %r0, %r25
	mov	1, %r14
	.word 0xa193a000  ! 908: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a062  ! 911: WRPR_PSTATE_I	wrpr	%r18, 0x0062, %pstate
	.word 0x8394e199  ! 912: WRPR_TNPC_I	wrpr	%r19, 0x0199, %tnpc
	.word 0xf635600e  ! 914: STH_I	sth	%r27, [%r21 + 0x000e]
	.word 0xf33de08f  ! 915: STDF_I	std	%f25, [0x008f, %r23]
	.word 0x8995610d  ! 916: WRPR_TICK_I	wrpr	%r21, 0x010d, %tick
	setx	data_start_0, %g1, %r21
	.word 0xbf51c000  ! 925: RDPR_TL	rdpr	%tl, %r31
	.word 0x8794a115  ! 928: WRPR_TT_I	wrpr	%r18, 0x0115, %tt
	.word 0xfa754000  ! 929: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb835c000  ! 934: ORN_R	orn 	%r23, %r0, %r28
	.word 0xbb50c000  ! 938: RDPR_TT	rdpr	%tt, %r29
	.word 0xb4bc4000  ! 942: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xfc3561ee  ! 946: STH_I	sth	%r30, [%r21 + 0x01ee]
	.word 0xf0746080  ! 947: STX_I	stx	%r24, [%r17 + 0x0080]
	.word 0xfc34c000  ! 951: STH_R	sth	%r30, [%r19 + %r0]
	setx	data_start_2, %g1, %r20
	.word 0xf82c202b  ! 955: STB_I	stb	%r28, [%r16 + 0x002b]
	.word 0xb6b40000  ! 958: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xba8c4000  ! 959: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xf0248000  ! 960: STW_R	stw	%r24, [%r18 + %r0]
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c60c9  ! 964: STD_I	std	%r24, [%r17 + 0x00c9]
	.word 0xf6256159  ! 973: STW_I	stw	%r27, [%r21 + 0x0159]
	.word 0xba3460c7  ! 975: SUBC_I	orn 	%r17, 0x00c7, %r29
	.word 0xb6b54000  ! 983: SUBCcc_R	orncc 	%r21, %r0, %r27
	setx	0x2020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c6102  ! 992: STD_I	std	%r27, [%r17 + 0x0102]
	.word 0xfe35c000  ! 993: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xfa2c605c  ! 994: STB_I	stb	%r29, [%r17 + 0x005c]
	.word 0xfa3c8000  ! 998: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf33d2160  ! 1000: STDF_I	std	%f25, [0x0160, %r20]
	.word 0xf82ce084  ! 1001: STB_I	stb	%r28, [%r19 + 0x0084]
	.word 0xf03c21d6  ! 1002: STD_I	std	%r24, [%r16 + 0x01d6]
	.word 0xb7500000  ! 1004: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 1005: RDPR_TSTATE	<illegal instruction>
	.word 0xb0450000  ! 1006: ADDC_R	addc 	%r20, %r0, %r24
	.word 0xba250000  ! 1012: SUB_R	sub 	%r20, %r0, %r29
	.word 0xb0b4e09f  ! 1013: SUBCcc_I	orncc 	%r19, 0x009f, %r24
	.word 0xf83de131  ! 1015: STD_I	std	%r28, [%r23 + 0x0131]
	.word 0xb3518000  ! 1016: RDPR_PSTATE	<illegal instruction>
	.word 0xb134d000  ! 1021: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xf22dc000  ! 1023: STB_R	stb	%r25, [%r23 + %r0]
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 1028: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf02c8000  ! 1029: STB_R	stb	%r24, [%r18 + %r0]
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 1033: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb20de187  ! 1037: AND_I	and 	%r23, 0x0187, %r25
	.word 0xbb7de401  ! 1040: MOVR_I	movre	%r23, 0x1, %r29
	.word 0xf475a1af  ! 1041: STX_I	stx	%r26, [%r22 + 0x01af]
	.word 0xf274a1fc  ! 1042: STX_I	stx	%r25, [%r18 + 0x01fc]
	.word 0xb2256029  ! 1044: SUB_I	sub 	%r21, 0x0029, %r25
	.word 0xf6344000  ! 1049: STH_R	sth	%r27, [%r17 + %r0]
	.word 0x8194211e  ! 1050: WRPR_TPC_I	wrpr	%r16, 0x011e, %tpc
	.word 0x8194a12c  ! 1051: WRPR_TPC_I	wrpr	%r18, 0x012c, %tpc
	.word 0xb951c000  ! 1052: RDPR_TL	rdpr	%tl, %r28
	.word 0xfc2c4000  ! 1053: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xfb3cc000  ! 1055: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf83520ea  ! 1057: STH_I	sth	%r28, [%r20 + 0x00ea]
	.word 0xb834e032  ! 1062: ORN_I	orn 	%r19, 0x0032, %r28
	.word 0xfc74c000  ! 1064: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf225c000  ! 1066: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfa748000  ! 1067: STX_R	stx	%r29, [%r18 + %r0]
	.word 0x899561ca  ! 1068: WRPR_TICK_I	wrpr	%r21, 0x01ca, %tick
	.word 0xf075e1b1  ! 1069: STX_I	stx	%r24, [%r23 + 0x01b1]
	.word 0xf6758000  ! 1071: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf93de103  ! 1072: STDF_I	std	%f28, [0x0103, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	.word 0xf0250000  ! 1080: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf82d4000  ! 1083: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfc346109  ! 1087: STH_I	sth	%r30, [%r17 + 0x0109]
	.word 0xf53da000  ! 1091: STDF_I	std	%f26, [0x0000, %r22]
	.word 0xff3d0000  ! 1098: STDF_R	std	%f31, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	.word 0x819829d9  ! 1103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0xf33ce0e9  ! 1104: STDF_I	std	%f25, [0x00e9, %r19]
	.word 0xf93d60e6  ! 1105: STDF_I	std	%f28, [0x00e6, %r21]
	.word 0xb950c000  ! 1107: RDPR_TT	rdpr	%tt, %r28
	.word 0xf42461a6  ! 1109: STW_I	stw	%r26, [%r17 + 0x01a6]
	.word 0xf0254000  ! 1112: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfa358000  ! 1114: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf474a158  ! 1121: STX_I	stx	%r26, [%r18 + 0x0158]
	.word 0xbeb50000  ! 1123: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xf62d0000  ! 1124: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xba9c0000  ! 1125: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xf4254000  ! 1128: STW_R	stw	%r26, [%r21 + %r0]
	.word 0x8795a0dd  ! 1136: WRPR_TT_I	wrpr	%r22, 0x00dd, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982811  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0811, %hpstate
	.word 0xf02d8000  ! 1145: STB_R	stb	%r24, [%r22 + %r0]
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42d8000  ! 1153: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xbd500000  ! 1154: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbb50c000  ! 1155: RDPR_TT	<illegal instruction>
	.word 0xb92c3001  ! 1156: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xf4348000  ! 1159: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb9518000  ! 1160: RDPR_PSTATE	<illegal instruction>
	.word 0xfa3c0000  ! 1161: STD_R	std	%r29, [%r16 + %r0]
	.word 0xb72d2001  ! 1162: SLL_I	sll 	%r20, 0x0001, %r27
	.word 0x9194e080  ! 1168: WRPR_PIL_I	wrpr	%r19, 0x0080, %pil
	setx	data_start_3, %g1, %r23
	.word 0xf83c0000  ! 1170: STD_R	std	%r28, [%r16 + %r0]
	.word 0xb28c4000  ! 1171: ANDcc_R	andcc 	%r17, %r0, %r25
	.word 0xf82d8000  ! 1172: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xbc8ca099  ! 1173: ANDcc_I	andcc 	%r18, 0x0099, %r30
	.word 0xf835c000  ! 1174: STH_R	sth	%r28, [%r23 + %r0]
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8a52080  ! 1177: SUBcc_I	subcc 	%r20, 0x0080, %r28
	.word 0xfa2d0000  ! 1180: STB_R	stb	%r29, [%r20 + %r0]
	setx	data_start_5, %g1, %r17
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3ce198  ! 1186: STDF_I	std	%f30, [0x0198, %r19]
	.word 0x8595a0f3  ! 1190: WRPR_TSTATE_I	wrpr	%r22, 0x00f3, %tstate
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63ca11b  ! 1195: STD_I	std	%r27, [%r18 + 0x011b]
	.word 0xfc3cc000  ! 1197: STD_R	std	%r30, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1199: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb641800  ! 1200: MOVcc_R	<illegal instruction>
	.word 0xfc75c000  ! 1201: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfa2d61b1  ! 1204: STB_I	stb	%r29, [%r21 + 0x01b1]
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 1206: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf53c0000  ! 1209: STDF_R	std	%f26, [%r0, %r16]
	.word 0xb7504000  ! 1211: RDPR_TNPC	rdpr	%tnpc, %r27
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e075  ! 1216: WRPR_TPC_I	wrpr	%r23, 0x0075, %tpc
	.word 0xbd500000  ! 1217: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbf50c000  ! 1226: RDPR_TT	<illegal instruction>
	.word 0xf024c000  ! 1228: STW_R	stw	%r24, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2adc000  ! 1230: ANDNcc_R	andncc 	%r23, %r0, %r25
	.word 0xfc2d0000  ! 1231: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfc35a032  ! 1233: STH_I	sth	%r30, [%r22 + 0x0032]
	.word 0xb551c000  ! 1240: RDPR_TL	rdpr	%tl, %r26
	.word 0xbb540000  ! 1241: RDPR_GL	<illegal instruction>
	.word 0xfe3561dc  ! 1243: STH_I	sth	%r31, [%r21 + 0x01dc]
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13da0e9  ! 1245: STDF_I	std	%f24, [0x00e9, %r22]
	.word 0xfe25e159  ! 1246: STW_I	stw	%r31, [%r23 + 0x0159]
	.word 0xf73c0000  ! 1247: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf22dc000  ! 1248: STB_R	stb	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f03  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f03, %hpstate
	.word 0xf73d8000  ! 1257: STDF_R	std	%f27, [%r0, %r22]
	.word 0x8194a0bf  ! 1262: WRPR_TPC_I	wrpr	%r18, 0x00bf, %tpc
	.word 0xf33c0000  ! 1264: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf43c8000  ! 1272: STD_R	std	%r26, [%r18 + %r0]
	.word 0xfa248000  ! 1274: STW_R	stw	%r29, [%r18 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xbb508000  ! 1278: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf02da17a  ! 1279: STB_I	stb	%r24, [%r22 + 0x017a]
	.word 0x8994a0b5  ! 1280: WRPR_TICK_I	wrpr	%r18, 0x00b5, %tick
	.word 0xf4240000  ! 1281: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbf51c000  ! 1282: RDPR_TL	rdpr	%tl, %r31
	.word 0xb5504000  ! 1283: RDPR_TNPC	<illegal instruction>
	.word 0xf634a114  ! 1284: STH_I	sth	%r27, [%r18 + 0x0114]
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 1289: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf4254000  ! 1292: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf33de1e1  ! 1293: STDF_I	std	%f25, [0x01e1, %r23]
	.word 0xf274a0b9  ! 1294: STX_I	stx	%r25, [%r18 + 0x00b9]
	.word 0xb5480000  ! 1297: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc350000  ! 1298: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xb0c5e154  ! 1300: ADDCcc_I	addccc 	%r23, 0x0154, %r24
	.word 0xf33c0000  ! 1301: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfa74c000  ! 1306: STX_R	stx	%r29, [%r19 + %r0]
	setx	data_start_7, %g1, %r17
	.word 0xfa258000  ! 1308: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf93dc000  ! 1317: STDF_R	std	%f28, [%r0, %r23]
	.word 0xff3d4000  ! 1319: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb751c000  ! 1321: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 1324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xfe248000  ! 1327: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf02d8000  ! 1328: STB_R	stb	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb643801  ! 1338: MOVcc_I	<illegal instruction>
	.word 0xf234e03e  ! 1342: STH_I	sth	%r25, [%r19 + 0x003e]
	.word 0xfe744000  ! 1347: STX_R	stx	%r31, [%r17 + %r0]
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe754000  ! 1353: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfe340000  ! 1357: STH_R	sth	%r31, [%r16 + %r0]
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d607c  ! 1360: STD_I	std	%r26, [%r21 + 0x007c]
	.word 0xf63c0000  ! 1361: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb42d2129  ! 1362: ANDN_I	andn 	%r20, 0x0129, %r26
	.word 0xfc3da101  ! 1367: STD_I	std	%r30, [%r22 + 0x0101]
	.word 0xfc3c4000  ! 1373: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf82dc000  ! 1377: STB_R	stb	%r28, [%r23 + %r0]
	.word 0x8195a12e  ! 1378: WRPR_TPC_I	wrpr	%r22, 0x012e, %tpc
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 1384: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf82cc000  ! 1387: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfc3ce05e  ! 1388: STD_I	std	%r30, [%r19 + 0x005e]
	.word 0xfb3c8000  ! 1391: STDF_R	std	%f29, [%r0, %r18]
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224a1d7  ! 1394: STW_I	stw	%r25, [%r18 + 0x01d7]
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	setx	data_start_1, %g1, %r17
	.word 0xfe246134  ! 1400: STW_I	stw	%r31, [%r17 + 0x0134]
	.word 0xf02ce0d1  ! 1401: STB_I	stb	%r24, [%r19 + 0x00d1]
	.word 0xbebc20df  ! 1410: XNORcc_I	xnorcc 	%r16, 0x00df, %r31
	.word 0xfc3520de  ! 1411: STH_I	sth	%r30, [%r20 + 0x00de]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb21da159  ! 1414: XOR_I	xor 	%r22, 0x0159, %r25
	.word 0xf33c61c5  ! 1416: STDF_I	std	%f25, [0x01c5, %r17]
	.word 0xf674a1d9  ! 1418: STX_I	stx	%r27, [%r18 + 0x01d9]
	.word 0xf62de0c5  ! 1419: STB_I	stb	%r27, [%r23 + 0x00c5]
	setx	0x20102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	.word 0xb550c000  ! 1422: RDPR_TT	rdpr	%tt, %r26
	.word 0xfa2dc000  ! 1423: STB_R	stb	%r29, [%r23 + %r0]
	setx	data_start_7, %g1, %r18
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839460c7  ! 1441: WRPR_TNPC_I	wrpr	%r17, 0x00c7, %tnpc
	.word 0x81952106  ! 1445: WRPR_TPC_I	wrpr	%r20, 0x0106, %tpc
	.word 0xbd500000  ! 1446: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbe246055  ! 1447: SUB_I	sub 	%r17, 0x0055, %r31
	.word 0xfe35e15c  ! 1448: STH_I	sth	%r31, [%r23 + 0x015c]
	.word 0xfc3c8000  ! 1449: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf63c61b3  ! 1450: STD_I	std	%r27, [%r17 + 0x01b3]
	.word 0xbf500000  ! 1451: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf82ca0b2  ! 1456: STB_I	stb	%r28, [%r18 + 0x00b2]
	.word 0xf2350000  ! 1458: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfc3c4000  ! 1461: STD_R	std	%r30, [%r17 + %r0]
	.word 0xb9518000  ! 1465: RDPR_PSTATE	<illegal instruction>
	.word 0xbb540000  ! 1466: RDPR_GL	<illegal instruction>
	.word 0xbf51c000  ! 1469: RDPR_TL	<illegal instruction>
	setx	0x10d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874e0a5  ! 1476: STX_I	stx	%r28, [%r19 + 0x00a5]
	.word 0xf93c60b0  ! 1479: STDF_I	std	%f28, [0x00b0, %r17]
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d0000  ! 1482: STDF_R	std	%f25, [%r0, %r20]
	.word 0xbf540000  ! 1484: RDPR_GL	<illegal instruction>
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a00a  ! 1489: WRPR_TPC_I	wrpr	%r22, 0x000a, %tpc
	.word 0xbd508000  ! 1493: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	0x3011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1e1  ! 1498: WRPR_TICK_I	wrpr	%r18, 0x01e1, %tick
	.word 0xf02c4000  ! 1505: STB_R	stb	%r24, [%r17 + %r0]
	.word 0x87952197  ! 1509: WRPR_TT_I	wrpr	%r20, 0x0197, %tt
	.word 0x8795a062  ! 1516: WRPR_TT_I	wrpr	%r22, 0x0062, %tt
	.word 0xfa75e1a9  ! 1518: STX_I	stx	%r29, [%r23 + 0x01a9]
	.word 0xfc25e08d  ! 1519: STW_I	stw	%r30, [%r23 + 0x008d]
	.word 0xfa2dc000  ! 1520: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf62d4000  ! 1521: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf43da0b8  ! 1525: STD_I	std	%r26, [%r22 + 0x00b8]
	.word 0xf33cc000  ! 1526: STDF_R	std	%f25, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81982d51  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	.word 0xf034a078  ! 1533: STH_I	sth	%r24, [%r18 + 0x0078]
	.word 0x8595a1e5  ! 1534: WRPR_TSTATE_I	wrpr	%r22, 0x01e5, %tstate
	setx	data_start_1, %g1, %r23
	.word 0xb6bda130  ! 1542: XNORcc_I	xnorcc 	%r22, 0x0130, %r27
	.word 0xb9520000  ! 1544: RDPR_PIL	rdpr	%pil, %r28
	.word 0xb7540000  ! 1545: RDPR_GL	<illegal instruction>
	.word 0xb48d2005  ! 1548: ANDcc_I	andcc 	%r20, 0x0005, %r26
	.word 0xbf518000  ! 1549: RDPR_PSTATE	<illegal instruction>
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 1551: RDPR_TT	<illegal instruction>
	.word 0xf83de05c  ! 1554: STD_I	std	%r28, [%r23 + 0x005c]
	ta	T_CHANGE_HPRIV
	.word 0x81982e0b  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0b, %hpstate
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a83  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a83, %hpstate
	.word 0xf0350000  ! 1567: STH_R	sth	%r24, [%r20 + %r0]
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1576: RDPR_GL	rdpr	%-, %r27
	.word 0xf42de1c9  ! 1577: STB_I	stb	%r26, [%r23 + 0x01c9]
	.word 0xbb7d2401  ! 1579: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xb0a5e1a3  ! 1580: SUBcc_I	subcc 	%r23, 0x01a3, %r24
	.word 0xfb3c6150  ! 1581: STDF_I	std	%f29, [0x0150, %r17]
	.word 0xf074c000  ! 1584: STX_R	stx	%r24, [%r19 + %r0]
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025c000  ! 1587: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf03c204c  ! 1589: STD_I	std	%r24, [%r16 + 0x004c]
	.word 0xb351c000  ! 1593: RDPR_TL	<illegal instruction>
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 1599: STW_R	stw	%r26, [%r19 + %r0]
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95602c  ! 1601: WRPR_PSTATE_I	wrpr	%r21, 0x002c, %pstate
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca0eb  ! 1606: STB_I	stb	%r30, [%r18 + 0x00eb]
	.word 0xf22c6189  ! 1610: STB_I	stb	%r25, [%r17 + 0x0189]
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22c6160  ! 1619: STB_I	stb	%r25, [%r17 + 0x0160]
	ta	T_CHANGE_HPRIV
	.word 0x81982a03  ! 1622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a03, %hpstate
	.word 0xf23d4000  ! 1623: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf225a146  ! 1625: STW_I	stw	%r25, [%r22 + 0x0146]
	.word 0xfa75a1fb  ! 1627: STX_I	stx	%r29, [%r22 + 0x01fb]
	.word 0xb1510000  ! 1629: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb6b4206d  ! 1631: SUBCcc_I	orncc 	%r16, 0x006d, %r27
	.word 0xfc7561b4  ! 1632: STX_I	stx	%r30, [%r21 + 0x01b4]
	.word 0xf025203e  ! 1633: STW_I	stw	%r24, [%r20 + 0x003e]
	.word 0x8d94e03a  ! 1634: WRPR_PSTATE_I	wrpr	%r19, 0x003a, %pstate
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a83  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a83, %hpstate
	.word 0xf4244000  ! 1641: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xb1510000  ! 1643: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf2346098  ! 1649: STH_I	sth	%r25, [%r17 + 0x0098]
	.word 0xb351c000  ! 1653: RDPR_TL	<illegal instruction>
	.word 0x8794606f  ! 1654: WRPR_TT_I	wrpr	%r17, 0x006f, %tt
	setx	data_start_2, %g1, %r17
	.word 0xfa7520ef  ! 1659: STX_I	stx	%r29, [%r20 + 0x00ef]
	.word 0xbd504000  ! 1660: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb9540000  ! 1664: RDPR_GL	<illegal instruction>
	.word 0xf22da12b  ! 1666: STB_I	stb	%r25, [%r22 + 0x012b]
	.word 0xf4750000  ! 1668: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xfe740000  ! 1675: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf4748000  ! 1676: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf034a199  ! 1677: STH_I	sth	%r24, [%r18 + 0x0199]
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 1683: RDPR_PIL	<illegal instruction>
	.word 0xbd508000  ! 1684: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1688: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x919520c4  ! 1689: WRPR_PIL_I	wrpr	%r20, 0x00c4, %pil
	.word 0xf73d0000  ! 1693: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf8344000  ! 1694: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb225a1c6  ! 1698: SUB_I	sub 	%r22, 0x01c6, %r25
	.word 0xbeb4e173  ! 1700: ORNcc_I	orncc 	%r19, 0x0173, %r31
	.word 0xfc344000  ! 1703: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfa24619c  ! 1705: STW_I	stw	%r29, [%r17 + 0x019c]
	setx	data_start_7, %g1, %r19
	.word 0xf33c0000  ! 1711: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf62c4000  ! 1712: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf93dc000  ! 1713: STDF_R	std	%f28, [%r0, %r23]
	setx	data_start_6, %g1, %r16
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1719: RDPR_GL	rdpr	%-, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983949  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1949, %hpstate
	.word 0xf8340000  ! 1721: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf0246166  ! 1722: STW_I	stw	%r24, [%r17 + 0x0166]
	.word 0xbf2c6001  ! 1723: SLL_I	sll 	%r17, 0x0001, %r31
	setx	data_start_5, %g1, %r22
	.word 0x8d95e188  ! 1729: WRPR_PSTATE_I	wrpr	%r23, 0x0188, %pstate
	setx	data_start_4, %g1, %r17
	.word 0x8995a1c7  ! 1733: WRPR_TICK_I	wrpr	%r22, 0x01c7, %tick
	.word 0xbf480000  ! 1735: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa3d0000  ! 1736: STD_R	std	%r29, [%r20 + %r0]
	.word 0xf825e1c8  ! 1737: STW_I	stw	%r28, [%r23 + 0x01c8]
	setx	data_start_5, %g1, %r20
	.word 0xbd643801  ! 1741: MOVcc_I	<illegal instruction>
	.word 0xf13c2117  ! 1742: STDF_I	std	%f24, [0x0117, %r16]
	.word 0xb60d0000  ! 1745: AND_R	and 	%r20, %r0, %r27
	.word 0xf235c000  ! 1747: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfe342090  ! 1748: STH_I	sth	%r31, [%r16 + 0x0090]
	.word 0x81952124  ! 1750: WRPR_TPC_I	wrpr	%r20, 0x0124, %tpc
	.word 0xfe354000  ! 1752: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf43c8000  ! 1753: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf13c2128  ! 1754: STDF_I	std	%f24, [0x0128, %r16]
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 1759: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xbb2c6001  ! 1761: SLL_I	sll 	%r17, 0x0001, %r29
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d2012  ! 1764: STB_I	stb	%r27, [%r20 + 0x0012]
	.word 0xb0258000  ! 1769: SUB_R	sub 	%r22, %r0, %r24
	.word 0xf22d61ab  ! 1773: STB_I	stb	%r25, [%r21 + 0x01ab]
	.word 0xfb3dc000  ! 1778: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf8746146  ! 1781: STX_I	stx	%r28, [%r17 + 0x0146]
	.word 0xfe34607f  ! 1786: STH_I	sth	%r31, [%r17 + 0x007f]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2758000  ! 1788: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf93d2140  ! 1789: STDF_I	std	%f28, [0x0140, %r20]
	mov	0, %r12
	.word 0x8f932000  ! 1793: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe3d60b9  ! 1794: STD_I	std	%r31, [%r21 + 0x00b9]
	mov	0, %r12
	.word 0x8f932000  ! 1795: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf624e069  ! 1797: STW_I	stw	%r27, [%r19 + 0x0069]
	.word 0xf4244000  ! 1799: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf4754000  ! 1800: STX_R	stx	%r26, [%r21 + %r0]
	.word 0x8795a143  ! 1801: WRPR_TT_I	wrpr	%r22, 0x0143, %tt
	.word 0xf73d2063  ! 1802: STDF_I	std	%f27, [0x0063, %r20]
	.word 0xf8758000  ! 1804: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfe744000  ! 1811: STX_R	stx	%r31, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c4b  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4b, %hpstate
	.word 0xfe3d8000  ! 1813: STD_R	std	%r31, [%r22 + %r0]
	setx	data_start_7, %g1, %r17
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d21ff  ! 1817: STD_I	std	%r26, [%r20 + 0x01ff]
	.word 0xf62d214e  ! 1818: STB_I	stb	%r27, [%r20 + 0x014e]
	.word 0xfe358000  ! 1819: STH_R	sth	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2744000  ! 1823: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf474e1a2  ! 1824: STX_I	stx	%r26, [%r19 + 0x01a2]
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf625c000  ! 1828: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf33d6190  ! 1830: STDF_I	std	%f25, [0x0190, %r21]
	.word 0xba14a07d  ! 1832: OR_I	or 	%r18, 0x007d, %r29
	.word 0xfd3c60bc  ! 1834: STDF_I	std	%f30, [0x00bc, %r17]
	.word 0xf034e050  ! 1838: STH_I	sth	%r24, [%r19 + 0x0050]
	.word 0xfe2dc000  ! 1839: STB_R	stb	%r31, [%r23 + %r0]
	.word 0x8995217c  ! 1845: WRPR_TICK_I	wrpr	%r20, 0x017c, %tick
	.word 0xb0c421ec  ! 1847: ADDCcc_I	addccc 	%r16, 0x01ec, %r24
	.word 0xf675e090  ! 1848: STX_I	stx	%r27, [%r23 + 0x0090]
	.word 0xbd520000  ! 1849: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb8258000  ! 1852: SUB_R	sub 	%r22, %r0, %r28
	.word 0xfe758000  ! 1855: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf33de143  ! 1856: STDF_I	std	%f25, [0x0143, %r23]
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33de001  ! 1863: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xfc254000  ! 1866: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xfa2c61cb  ! 1868: STB_I	stb	%r29, [%r17 + 0x01cb]
	.word 0xf63c8000  ! 1869: STD_R	std	%r27, [%r18 + %r0]
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 1873: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a91  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a91, %hpstate
	.word 0xfa35a184  ! 1882: STH_I	sth	%r29, [%r22 + 0x0184]
	.word 0xfe348000  ! 1883: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf13de1be  ! 1887: STDF_I	std	%f24, [0x01be, %r23]
	.word 0xff3c4000  ! 1889: STDF_R	std	%f31, [%r0, %r17]
	mov	1, %r14
	.word 0xa193a000  ! 1892: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8b420ea  ! 1895: SUBCcc_I	orncc 	%r16, 0x00ea, %r28
	.word 0xf824c000  ! 1901: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf63ce04b  ! 1903: STD_I	std	%r27, [%r19 + 0x004b]
	.word 0xf0356192  ! 1907: STH_I	sth	%r24, [%r21 + 0x0192]
	.word 0x8d956111  ! 1908: WRPR_PSTATE_I	wrpr	%r21, 0x0111, %pstate
	.word 0xb5504000  ! 1909: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf634a16a  ! 1911: STH_I	sth	%r27, [%r18 + 0x016a]
	.word 0xf63c4000  ! 1912: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf0340000  ! 1916: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xfa34e124  ! 1917: STH_I	sth	%r29, [%r19 + 0x0124]
	.word 0xf73da036  ! 1921: STDF_I	std	%f27, [0x0036, %r22]
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0xf13ce1c5  ! 1923: STDF_I	std	%f24, [0x01c5, %r19]
	.word 0xfd3dc000  ! 1925: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf4344000  ! 1927: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xfc750000  ! 1928: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf42c8000  ! 1934: STB_R	stb	%r26, [%r18 + %r0]
	setx	data_start_7, %g1, %r17
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 1938: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfc358000  ! 1939: STH_R	sth	%r30, [%r22 + %r0]
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe356181  ! 1944: STH_I	sth	%r31, [%r21 + 0x0181]
	.word 0x9194e14f  ! 1945: WRPR_PIL_I	wrpr	%r19, 0x014f, %pil
	.word 0xfa2dc000  ! 1947: STB_R	stb	%r29, [%r23 + %r0]
	setx	data_start_0, %g1, %r21
	setx	0x112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c4000  ! 1953: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xfd3c615b  ! 1954: STDF_I	std	%f30, [0x015b, %r17]
	.word 0xfd3ce089  ! 1955: STDF_I	std	%f30, [0x0089, %r19]
	.word 0xf835a015  ! 1957: STH_I	sth	%r28, [%r22 + 0x0015]
	.word 0xf225c000  ! 1959: STW_R	stw	%r25, [%r23 + %r0]
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1963: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d952100  ! 1964: WRPR_PSTATE_I	wrpr	%r20, 0x0100, %pstate
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7342001  ! 1971: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xfc340000  ! 1972: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf4740000  ! 1975: STX_R	stx	%r26, [%r16 + %r0]
	.word 0x8794e06c  ! 1977: WRPR_TT_I	wrpr	%r19, 0x006c, %tt
	.word 0xf82da02b  ! 1979: STB_I	stb	%r28, [%r22 + 0x002b]
	.word 0xf83c8000  ! 1980: STD_R	std	%r28, [%r18 + %r0]
	.word 0xfe75a04e  ! 1986: STX_I	stx	%r31, [%r22 + 0x004e]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe24e08e  ! 1989: STW_I	stw	%r31, [%r19 + 0x008e]
	.word 0x8d95618d  ! 1993: WRPR_PSTATE_I	wrpr	%r21, 0x018d, %pstate
	.word 0xf03c0000  ! 1996: STD_R	std	%r24, [%r16 + %r0]
	.word 0x8395a0e8  ! 2003: WRPR_TNPC_I	wrpr	%r22, 0x00e8, %tnpc
	.word 0xfa3c8000  ! 2004: STD_R	std	%r29, [%r18 + %r0]
	.word 0xfe2c4000  ! 2006: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfe254000  ! 2008: STW_R	stw	%r31, [%r21 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 2010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf42d0000  ! 2013: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xbaa48000  ! 2016: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0xf93ce1bd  ! 2017: STDF_I	std	%f28, [0x01bd, %r19]
	.word 0xfa3d0000  ! 2021: STD_R	std	%r29, [%r20 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 2024: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 2027: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xb4944000  ! 2029: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xf635e04a  ! 2032: STH_I	sth	%r27, [%r23 + 0x004a]
	.word 0xfa344000  ! 2033: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf42dc000  ! 2036: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf03de145  ! 2037: STD_I	std	%r24, [%r23 + 0x0145]
	.word 0xbe34617b  ! 2050: SUBC_I	orn 	%r17, 0x017b, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819839d3  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d3, %hpstate
	.word 0xf82c0000  ! 2056: STB_R	stb	%r28, [%r16 + %r0]
	.word 0x8395a1dc  ! 2057: WRPR_TNPC_I	wrpr	%r22, 0x01dc, %tnpc
	setx	data_start_1, %g1, %r16
	.word 0xf83c0000  ! 2061: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf82d2140  ! 2063: STB_I	stb	%r28, [%r20 + 0x0140]
	ta	T_CHANGE_HPRIV
	.word 0x81982c81  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
	.word 0x83946063  ! 2067: WRPR_TNPC_I	wrpr	%r17, 0x0063, %tnpc
	.word 0xb43cc000  ! 2071: XNOR_R	xnor 	%r19, %r0, %r26
	.word 0xf93da09e  ! 2074: STDF_I	std	%f28, [0x009e, %r22]
	mov	2, %r12
	.word 0x8f932000  ! 2081: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf634a15f  ! 2085: STH_I	sth	%r27, [%r18 + 0x015f]
	ta	T_CHANGE_HPRIV
	.word 0x81983fc1  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc1, %hpstate
	.word 0xfb3d0000  ! 2090: STDF_R	std	%f29, [%r0, %r20]
	.word 0xf42de056  ! 2092: STB_I	stb	%r26, [%r23 + 0x0056]
	.word 0x8594210b  ! 2093: WRPR_TSTATE_I	wrpr	%r16, 0x010b, %tstate
	.word 0x8195e130  ! 2097: WRPR_TPC_I	wrpr	%r23, 0x0130, %tpc
	.word 0xfe242075  ! 2103: STW_I	stw	%r31, [%r16 + 0x0075]
	.word 0xfa3461d2  ! 2107: STH_I	sth	%r29, [%r17 + 0x01d2]
	.word 0x8194207e  ! 2108: WRPR_TPC_I	wrpr	%r16, 0x007e, %tpc
	.word 0xf835e06f  ! 2109: STH_I	sth	%r28, [%r23 + 0x006f]
	.word 0xf03c8000  ! 2111: STD_R	std	%r24, [%r18 + %r0]
	.word 0xb02ca087  ! 2112: ANDN_I	andn 	%r18, 0x0087, %r24
	.word 0xbabce080  ! 2117: XNORcc_I	xnorcc 	%r19, 0x0080, %r29
	.word 0xf63de063  ! 2119: STD_I	std	%r27, [%r23 + 0x0063]
	.word 0xf235e0e8  ! 2121: STH_I	sth	%r25, [%r23 + 0x00e8]
	.word 0xf83de0eb  ! 2124: STD_I	std	%r28, [%r23 + 0x00eb]
	.word 0xfc2dc000  ! 2125: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfa35c000  ! 2128: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xbd3d6001  ! 2129: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xbb2db001  ! 2130: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb69d4000  ! 2137: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xfd3c20a1  ! 2144: STDF_I	std	%f30, [0x00a1, %r16]
	.word 0xfe3420d1  ! 2147: STH_I	sth	%r31, [%r16 + 0x00d1]
	.word 0x8394a000  ! 2148: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xf42ce034  ! 2152: STB_I	stb	%r26, [%r19 + 0x0034]
	.word 0xb1500000  ! 2154: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf73dc000  ! 2157: STDF_R	std	%f27, [%r0, %r23]
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf875e0d4  ! 2161: STX_I	stx	%r28, [%r23 + 0x00d4]
	.word 0xfc754000  ! 2164: STX_R	stx	%r30, [%r21 + %r0]
	setx	data_start_4, %g1, %r23
	.word 0xf874216d  ! 2166: STX_I	stx	%r28, [%r16 + 0x016d]
	.word 0xf02d2084  ! 2167: STB_I	stb	%r24, [%r20 + 0x0084]
	.word 0xb1480000  ! 2168: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8d95e12a  ! 2170: WRPR_PSTATE_I	wrpr	%r23, 0x012a, %pstate
	.word 0xfe74c000  ! 2171: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb12d7001  ! 2173: SLLX_I	sllx	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd504000  ! 2177: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c601b  ! 2180: STD_I	std	%r31, [%r17 + 0x001b]
	setx	data_start_4, %g1, %r23
	.word 0xbf520000  ! 2184: RDPR_PIL	<illegal instruction>
	.word 0xf035c000  ! 2186: STH_R	sth	%r24, [%r23 + %r0]
	.word 0x8595e15f  ! 2191: WRPR_TSTATE_I	wrpr	%r23, 0x015f, %tstate
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc74a015  ! 2196: STX_I	stx	%r30, [%r18 + 0x0015]
	setx	data_start_4, %g1, %r22
	.word 0xf434e08e  ! 2198: STH_I	sth	%r26, [%r19 + 0x008e]
	.word 0xfe254000  ! 2206: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfe748000  ! 2207: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb3504000  ! 2209: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfc2c4000  ! 2214: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xb2bc2127  ! 2219: XNORcc_I	xnorcc 	%r16, 0x0127, %r25
	.word 0xf8340000  ! 2220: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xb3504000  ! 2223: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xff3c2000  ! 2226: STDF_I	std	%f31, [0x0000, %r16]
	.word 0x8995a02d  ! 2227: WRPR_TICK_I	wrpr	%r22, 0x002d, %tick
	.word 0xf82d6177  ! 2230: STB_I	stb	%r28, [%r21 + 0x0177]
	.word 0xfa2420d6  ! 2232: STW_I	stw	%r29, [%r16 + 0x00d6]
	.word 0xb3540000  ! 2236: RDPR_GL	rdpr	%-, %r25
	.word 0xf63ca00c  ! 2239: STD_I	std	%r27, [%r18 + 0x000c]
	.word 0xfa254000  ! 2241: STW_R	stw	%r29, [%r21 + %r0]
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 2246: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbb540000  ! 2248: RDPR_GL	<illegal instruction>
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0x899560b4  ! 2254: WRPR_TICK_I	wrpr	%r21, 0x00b4, %tick
	.word 0xfe24a1ea  ! 2258: STW_I	stw	%r31, [%r18 + 0x01ea]
	.word 0xf82da034  ! 2259: STB_I	stb	%r28, [%r22 + 0x0034]
	.word 0xfc24e18a  ! 2262: STW_I	stw	%r30, [%r19 + 0x018a]
	.word 0xf73cc000  ! 2271: STDF_R	std	%f27, [%r0, %r19]
	.word 0xb1480000  ! 2272: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2275: RDPR_TPC	<illegal instruction>
	.word 0xfb3d8000  ! 2276: STDF_R	std	%f29, [%r0, %r22]
	.word 0x8995a09c  ! 2282: WRPR_TICK_I	wrpr	%r22, 0x009c, %tick
	.word 0xfe25c000  ! 2289: STW_R	stw	%r31, [%r23 + %r0]
	.word 0x8394e0cf  ! 2290: WRPR_TNPC_I	wrpr	%r19, 0x00cf, %tnpc
	.word 0xf83561de  ! 2292: STH_I	sth	%r28, [%r21 + 0x01de]
	.word 0xfc75a1f8  ! 2293: STX_I	stx	%r30, [%r22 + 0x01f8]
	setx	data_start_7, %g1, %r18
	.word 0xf22c4000  ! 2297: STB_R	stb	%r25, [%r17 + %r0]
	.word 0x8d9520e0  ! 2299: WRPR_PSTATE_I	wrpr	%r20, 0x00e0, %pstate
	.word 0xfd3d6175  ! 2302: STDF_I	std	%f30, [0x0175, %r21]
	.word 0xf8350000  ! 2305: STH_R	sth	%r28, [%r20 + %r0]
	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 2308: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb5643801  ! 2309: MOVcc_I	<illegal instruction>
	.word 0xf43c8000  ! 2311: STD_R	std	%r26, [%r18 + %r0]
	.word 0x879521ba  ! 2312: WRPR_TT_I	wrpr	%r20, 0x01ba, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xbc1c8000  ! 2318: XOR_R	xor 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 2319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xbb520000  ! 2326: RDPR_PIL	rdpr	%pil, %r29
	.word 0xbf51c000  ! 2328: RDPR_TL	<illegal instruction>
	.word 0xfc2c604b  ! 2332: STB_I	stb	%r30, [%r17 + 0x004b]
	.word 0xf634a133  ! 2333: STH_I	sth	%r27, [%r18 + 0x0133]
	.word 0xfa756068  ! 2334: STX_I	stx	%r29, [%r21 + 0x0068]
	.word 0xfa250000  ! 2335: STW_R	stw	%r29, [%r20 + %r0]
	setx	data_start_3, %g1, %r19
	.word 0xfd3c0000  ! 2342: STDF_R	std	%f30, [%r0, %r16]
	.word 0xfe3d2194  ! 2345: STD_I	std	%r31, [%r20 + 0x0194]
	.word 0xf33d0000  ! 2346: STDF_R	std	%f25, [%r0, %r20]
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 2352: RDPR_TNPC	<illegal instruction>
	.word 0xf075a064  ! 2353: STX_I	stx	%r24, [%r22 + 0x0064]
	.word 0xbb51c000  ! 2357: RDPR_TL	<illegal instruction>
	.word 0xf42461a8  ! 2359: STW_I	stw	%r26, [%r17 + 0x01a8]
	.word 0xb8350000  ! 2372: ORN_R	orn 	%r20, %r0, %r28
	.word 0x8995a1a9  ! 2375: WRPR_TICK_I	wrpr	%r22, 0x01a9, %tick
	.word 0xf635c000  ! 2377: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfe348000  ! 2379: STH_R	sth	%r31, [%r18 + %r0]
	.word 0x8195618d  ! 2386: WRPR_TPC_I	wrpr	%r21, 0x018d, %tpc
	.word 0xf624a018  ! 2392: STW_I	stw	%r27, [%r18 + 0x0018]
	.word 0xbd500000  ! 2394: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf13c8000  ! 2403: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf4352121  ! 2404: STH_I	sth	%r26, [%r20 + 0x0121]
	.word 0xfc34600e  ! 2406: STH_I	sth	%r30, [%r17 + 0x000e]
	.word 0xf835c000  ! 2409: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfc75c000  ! 2410: STX_R	stx	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e91  ! 2413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e91, %hpstate
	.word 0xf93d604d  ! 2414: STDF_I	std	%f28, [0x004d, %r21]
	.word 0x919520d0  ! 2415: WRPR_PIL_I	wrpr	%r20, 0x00d0, %pil
	setx	data_start_4, %g1, %r19
	.word 0x8994e1fa  ! 2418: WRPR_TICK_I	wrpr	%r19, 0x01fa, %tick
	.word 0xf03d61a7  ! 2421: STD_I	std	%r24, [%r21 + 0x01a7]
	.word 0xf83cc000  ! 2423: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf024200c  ! 2424: STW_I	stw	%r24, [%r16 + 0x000c]
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3ca10c  ! 2427: STDF_I	std	%f29, [0x010c, %r18]
	setx	0x219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49ce009  ! 2433: XORcc_I	xorcc 	%r19, 0x0009, %r26
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0b42146  ! 2437: SUBCcc_I	orncc 	%r16, 0x0146, %r24
	.word 0xfa250000  ! 2439: STW_R	stw	%r29, [%r20 + %r0]
	.word 0x8395a024  ! 2440: WRPR_TNPC_I	wrpr	%r22, 0x0024, %tnpc
	.word 0xbb518000  ! 2441: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf275c000  ! 2443: STX_R	stx	%r25, [%r23 + %r0]
	.word 0x839461e3  ! 2445: WRPR_TNPC_I	wrpr	%r17, 0x01e3, %tnpc
	.word 0xf274a1ac  ! 2446: STX_I	stx	%r25, [%r18 + 0x01ac]
	.word 0xb1508000  ! 2447: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfd3c6049  ! 2451: STDF_I	std	%f30, [0x0049, %r17]
	.word 0xf93d0000  ! 2453: STDF_R	std	%f28, [%r0, %r20]
	.word 0xbf500000  ! 2454: RDPR_TPC	<illegal instruction>
	.word 0xfc34a053  ! 2455: STH_I	sth	%r30, [%r18 + 0x0053]
	.word 0x8995e1e8  ! 2457: WRPR_TICK_I	wrpr	%r23, 0x01e8, %tick
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 2460: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xbd500000  ! 2461: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf675606e  ! 2464: STX_I	stx	%r27, [%r21 + 0x006e]
	.word 0xbe058000  ! 2469: ADD_R	add 	%r22, %r0, %r31
	.word 0xf8240000  ! 2471: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfa3ca18f  ! 2472: STD_I	std	%r29, [%r18 + 0x018f]
	.word 0xfa2ca0e6  ! 2479: STB_I	stb	%r29, [%r18 + 0x00e6]
	.word 0xbd50c000  ! 2480: RDPR_TT	<illegal instruction>
	.word 0xfc75c000  ! 2481: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfe74214e  ! 2483: STX_I	stx	%r31, [%r16 + 0x014e]
	setx	data_start_0, %g1, %r16
	.word 0x89946032  ! 2486: WRPR_TICK_I	wrpr	%r17, 0x0032, %tick
	.word 0xfd3cc000  ! 2487: STDF_R	std	%f30, [%r0, %r19]
	.word 0x9195a0e5  ! 2492: WRPR_PIL_I	wrpr	%r22, 0x00e5, %pil
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24202e  ! 2497: STW_I	stw	%r31, [%r16 + 0x002e]
	.word 0xbc458000  ! 2501: ADDC_R	addc 	%r22, %r0, %r30
	.word 0xfc74610a  ! 2508: STX_I	stx	%r30, [%r17 + 0x010a]
	.word 0x87956075  ! 2519: WRPR_TT_I	wrpr	%r21, 0x0075, %tt
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 2522: RDPR_TT	rdpr	%tt, %r24
	.word 0xf475a016  ! 2523: STX_I	stx	%r26, [%r22 + 0x0016]
	.word 0xf63ce15c  ! 2524: STD_I	std	%r27, [%r19 + 0x015c]
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	.word 0x819461fa  ! 2533: WRPR_TPC_I	wrpr	%r17, 0x01fa, %tpc
	.word 0xb20ca14d  ! 2539: AND_I	and 	%r18, 0x014d, %r25
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf074a1ad  ! 2543: STX_I	stx	%r24, [%r18 + 0x01ad]
	.word 0x859460f5  ! 2547: WRPR_TSTATE_I	wrpr	%r17, 0x00f5, %tstate
	.word 0xb2b58000  ! 2548: ORNcc_R	orncc 	%r22, %r0, %r25
	.word 0xf02d8000  ! 2550: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xb2ade033  ! 2552: ANDNcc_I	andncc 	%r23, 0x0033, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 2558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	.word 0xfe7561c5  ! 2560: STX_I	stx	%r31, [%r21 + 0x01c5]
	.word 0xfa25a144  ! 2561: STW_I	stw	%r29, [%r22 + 0x0144]
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 2564: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb2bc8000  ! 2567: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0x8994e00a  ! 2568: WRPR_TICK_I	wrpr	%r19, 0x000a, %tick
	.word 0xbeb5a0e4  ! 2569: ORNcc_I	orncc 	%r22, 0x00e4, %r31
	.word 0xf274c000  ! 2570: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xfc748000  ! 2572: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf8744000  ! 2577: STX_R	stx	%r28, [%r17 + %r0]
	.word 0x819420c9  ! 2578: WRPR_TPC_I	wrpr	%r16, 0x00c9, %tpc
	.word 0xf73ca04f  ! 2581: STDF_I	std	%f27, [0x004f, %r18]
	.word 0xb77d8400  ! 2582: MOVR_R	movre	%r22, %r0, %r27
	.word 0xf6242076  ! 2585: STW_I	stw	%r27, [%r16 + 0x0076]
	mov	1, %r14
	.word 0xa193a000  ! 2586: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 2596: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2248000  ! 2597: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf62de15a  ! 2602: STB_I	stb	%r27, [%r23 + 0x015a]
	.word 0xbca40000  ! 2603: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xbac50000  ! 2606: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xf074e176  ! 2607: STX_I	stx	%r24, [%r19 + 0x0176]
	.word 0xf0350000  ! 2610: STH_R	sth	%r24, [%r20 + %r0]
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 2615: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf274e1a1  ! 2617: STX_I	stx	%r25, [%r19 + 0x01a1]
	.word 0xf8758000  ! 2618: STX_R	stx	%r28, [%r22 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 2619: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3480000  ! 2620: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x9194211e  ! 2624: WRPR_PIL_I	wrpr	%r16, 0x011e, %pil
	setx	data_start_4, %g1, %r16
	.word 0xb814c000  ! 2628: OR_R	or 	%r19, %r0, %r28
	.word 0xfc3d60b9  ! 2629: STD_I	std	%r30, [%r21 + 0x00b9]
	.word 0xff3cc000  ! 2633: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf83d0000  ! 2639: STD_R	std	%r28, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb21d61e8  ! 2644: XOR_I	xor 	%r21, 0x01e8, %r25
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe748000  ! 2653: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf83c60db  ! 2655: STD_I	std	%r28, [%r17 + 0x00db]
	.word 0xbf510000  ! 2658: RDPR_TICK	rdpr	%tick, %r31
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32c0000  ! 2661: SLL_R	sll 	%r16, %r0, %r25
	.word 0xf03c0000  ! 2663: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf73de155  ! 2665: STDF_I	std	%f27, [0x0155, %r23]
	.word 0xb5510000  ! 2668: RDPR_TICK	<illegal instruction>
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2674: RDPR_GL	rdpr	%-, %r30
	.word 0xf6356127  ! 2677: STH_I	sth	%r27, [%r21 + 0x0127]
	.word 0xbd520000  ! 2678: RDPR_PIL	<illegal instruction>
	.word 0xba8d4000  ! 2679: ANDcc_R	andcc 	%r21, %r0, %r29
	.word 0xf03d8000  ! 2680: STD_R	std	%r24, [%r22 + %r0]
	.word 0xb1520000  ! 2683: RDPR_PIL	<illegal instruction>
	.word 0xfe2da12f  ! 2688: STB_I	stb	%r31, [%r22 + 0x012f]
	.word 0xfc2d4000  ! 2689: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xb5500000  ! 2690: RDPR_TPC	<illegal instruction>
	.word 0xf4354000  ! 2692: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfe3c60f9  ! 2693: STD_I	std	%r31, [%r17 + 0x00f9]
	.word 0xf62ca041  ! 2697: STB_I	stb	%r27, [%r18 + 0x0041]
	.word 0xfc750000  ! 2698: STX_R	stx	%r30, [%r20 + %r0]
	setx	data_start_0, %g1, %r17
	.word 0x87946170  ! 2701: WRPR_TT_I	wrpr	%r17, 0x0170, %tt
	.word 0xfc2ca066  ! 2707: STB_I	stb	%r30, [%r18 + 0x0066]
	setx	0x10003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73c6036  ! 2709: STDF_I	std	%f27, [0x0036, %r17]
	.word 0xf8356193  ! 2711: STH_I	sth	%r28, [%r21 + 0x0193]
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a021  ! 2719: WRPR_TT_I	wrpr	%r22, 0x0021, %tt
	.word 0x8194e09b  ! 2720: WRPR_TPC_I	wrpr	%r19, 0x009b, %tpc
	mov	1, %r14
	.word 0xa193a000  ! 2723: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc3460f5  ! 2725: STH_I	sth	%r30, [%r17 + 0x00f5]
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 2728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	.word 0xfc244000  ! 2729: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf53cc000  ! 2730: STDF_R	std	%f26, [%r0, %r19]
	.word 0xfa3c8000  ! 2732: STD_R	std	%r29, [%r18 + %r0]
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d4000  ! 2734: STD_R	std	%r29, [%r21 + %r0]
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23dc000  ! 2742: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfb3ce0e4  ! 2746: STDF_I	std	%f29, [0x00e4, %r19]
	.word 0x859421aa  ! 2747: WRPR_TSTATE_I	wrpr	%r16, 0x01aa, %tstate
	.word 0xfc25a1d6  ! 2748: STW_I	stw	%r30, [%r22 + 0x01d6]
	.word 0xf62d0000  ! 2751: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb1518000  ! 2753: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf074612e  ! 2754: STX_I	stx	%r24, [%r17 + 0x012e]
	.word 0xbf50c000  ! 2758: RDPR_TT	<illegal instruction>
	.word 0xb8346184  ! 2760: SUBC_I	orn 	%r17, 0x0184, %r28
	.word 0xfe2d6035  ! 2761: STB_I	stb	%r31, [%r21 + 0x0035]
	.word 0xbd510000  ! 2762: RDPR_TICK	<illegal instruction>
	.word 0x8395a1fa  ! 2764: WRPR_TNPC_I	wrpr	%r22, 0x01fa, %tnpc
	.word 0xb1480000  ! 2770: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb72da001  ! 2775: SLL_I	sll 	%r22, 0x0001, %r27
	.word 0xfc750000  ! 2777: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf63de1f0  ! 2778: STD_I	std	%r27, [%r23 + 0x01f0]
	mov	2, %r12
	.word 0x8f932000  ! 2784: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf43dc000  ! 2785: STD_R	std	%r26, [%r23 + %r0]
	.word 0xfd3d204f  ! 2786: STDF_I	std	%f30, [0x004f, %r20]
	.word 0xfe248000  ! 2787: STW_R	stw	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 2790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xfa2c0000  ! 2792: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf13cc000  ! 2793: STDF_R	std	%f24, [%r0, %r19]
	.word 0xbf518000  ! 2794: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xbe14a029  ! 2796: OR_I	or 	%r18, 0x0029, %r31
	.word 0xfa744000  ! 2801: STX_R	stx	%r29, [%r17 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2802: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195a18d  ! 2808: WRPR_PIL_I	wrpr	%r22, 0x018d, %pil
	.word 0x919520c3  ! 2813: WRPR_PIL_I	wrpr	%r20, 0x00c3, %pil
	.word 0xbf51c000  ! 2815: RDPR_TL	rdpr	%tl, %r31
	setx	data_start_6, %g1, %r18
	.word 0xf4744000  ! 2822: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfc2d61ef  ! 2824: STB_I	stb	%r30, [%r21 + 0x01ef]
	.word 0xf93c8000  ! 2827: STDF_R	std	%f28, [%r0, %r18]
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf035a1bc  ! 2840: STH_I	sth	%r24, [%r22 + 0x01bc]
	.word 0xbe0d20f6  ! 2842: AND_I	and 	%r20, 0x00f6, %r31
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88c21fd  ! 2844: ANDcc_I	andcc 	%r16, 0x01fd, %r28
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	.word 0x81982b53  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b53, %hpstate
	.word 0xfc248000  ! 2859: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf82c21f3  ! 2861: STB_I	stb	%r28, [%r16 + 0x01f3]
	ta	T_CHANGE_HPRIV
	.word 0x81983b59  ! 2864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b59, %hpstate
	setx	data_start_3, %g1, %r23
	setx	data_start_3, %g1, %r18
	.word 0xf424c000  ! 2877: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xfb3da0de  ! 2879: STDF_I	std	%f29, [0x00de, %r22]
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74a0d6  ! 2891: STX_I	stx	%r29, [%r18 + 0x00d6]
	mov	1, %r12
	.word 0x8f932000  ! 2892: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbec54000  ! 2893: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xfe35a16f  ! 2894: STH_I	sth	%r31, [%r22 + 0x016f]
	.word 0xf42ca125  ! 2896: STB_I	stb	%r26, [%r18 + 0x0125]
	.word 0xf23c2177  ! 2897: STD_I	std	%r25, [%r16 + 0x0177]
	.word 0xf33c0000  ! 2898: STDF_R	std	%f25, [%r0, %r16]
	.word 0xbd540000  ! 2903: RDPR_GL	rdpr	%-, %r30
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73cc000  ! 2907: STDF_R	std	%f27, [%r0, %r19]
	.word 0xfb3d4000  ! 2910: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb7359000  ! 2912: SRLX_R	srlx	%r22, %r0, %r27
	.word 0xfc3c8000  ! 2914: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf8240000  ! 2920: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfd3dc000  ! 2923: STDF_R	std	%f30, [%r0, %r23]
	.word 0x899521aa  ! 2924: WRPR_TICK_I	wrpr	%r20, 0x01aa, %tick
	.word 0xb52d4000  ! 2926: SLL_R	sll 	%r21, %r0, %r26
	.word 0xbb540000  ! 2929: RDPR_GL	rdpr	%-, %r29
	.word 0xf474e1f2  ! 2930: STX_I	stx	%r26, [%r19 + 0x01f2]
	.word 0xb6c48000  ! 2932: ADDCcc_R	addccc 	%r18, %r0, %r27
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93de114  ! 2934: STDF_I	std	%f28, [0x0114, %r23]
	.word 0xf63421be  ! 2937: STH_I	sth	%r27, [%r16 + 0x01be]
	.word 0xbf540000  ! 2939: RDPR_GL	<illegal instruction>
	.word 0xf0358000  ! 2940: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xfe35a1e4  ! 2943: STH_I	sth	%r31, [%r22 + 0x01e4]
	mov	1, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195a1f7  ! 2946: WRPR_PIL_I	wrpr	%r22, 0x01f7, %pil
	.word 0xf2352109  ! 2948: STH_I	sth	%r25, [%r20 + 0x0109]
	.word 0xbb480000  ! 2950: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74603d  ! 2957: STX_I	stx	%r29, [%r17 + 0x003d]
	.word 0x8795a18a  ! 2959: WRPR_TT_I	wrpr	%r22, 0x018a, %tt
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 2964: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbd50c000  ! 2966: RDPR_TT	<illegal instruction>
	.word 0xbc0ce041  ! 2968: AND_I	and 	%r19, 0x0041, %r30
	.word 0xbb643801  ! 2974: MOVcc_I	<illegal instruction>
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf359000  ! 2976: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xbf7de401  ! 2977: MOVR_I	movre	%r23, 0x1, %r31
	.word 0xfc742139  ! 2979: STX_I	stx	%r30, [%r16 + 0x0139]
	.word 0xf4258000  ! 2980: STW_R	stw	%r26, [%r22 + %r0]
	.word 0x8795e0c5  ! 2982: WRPR_TT_I	wrpr	%r23, 0x00c5, %tt
	.word 0xbf500000  ! 2983: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xfd3d8000  ! 2989: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf235a08a  ! 2995: STH_I	sth	%r25, [%r22 + 0x008a]
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03ca0a5  ! 2997: STD_I	std	%r24, [%r18 + 0x00a5]
	.word 0xf62c8000  ! 2998: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfc3ca05c  ! 2999: STD_I	std	%r30, [%r18 + 0x005c]
	.word 0xfa2ce130  ! 3000: STB_I	stb	%r29, [%r19 + 0x0130]
	.word 0x8395205b  ! 3001: WRPR_TNPC_I	wrpr	%r20, 0x005b, %tnpc
	.word 0xf03d8000  ! 3010: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf22d0000  ! 3011: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf33d610b  ! 3014: STDF_I	std	%f25, [0x010b, %r21]
	.word 0xf22cc000  ! 3016: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xb9518000  ! 3017: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb3500000  ! 3019: RDPR_TPC	<illegal instruction>
	.word 0xf875a0c8  ! 3023: STX_I	stx	%r28, [%r22 + 0x00c8]
	.word 0xfc7461c3  ! 3026: STX_I	stx	%r30, [%r17 + 0x01c3]
	.word 0xf82d8000  ! 3031: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfe758000  ! 3032: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf42de0da  ! 3033: STB_I	stb	%r26, [%r23 + 0x00da]
	.word 0xfc3dc000  ! 3034: STD_R	std	%r30, [%r23 + %r0]
	.word 0xbc154000  ! 3036: OR_R	or 	%r21, %r0, %r30
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8344000  ! 3040: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb3508000  ! 3041: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d91  ! 3043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
	.word 0xf33c21ce  ! 3044: STDF_I	std	%f25, [0x01ce, %r16]
	.word 0xbb51c000  ! 3046: RDPR_TL	rdpr	%tl, %r29
	.word 0x899460f1  ! 3049: WRPR_TICK_I	wrpr	%r17, 0x00f1, %tick
	setx	data_start_4, %g1, %r22
	.word 0x87956181  ! 3052: WRPR_TT_I	wrpr	%r21, 0x0181, %tt
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6a4a070  ! 3059: SUBcc_I	subcc 	%r18, 0x0070, %r27
	.word 0xbb500000  ! 3061: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbac48000  ! 3062: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xb3518000  ! 3063: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3c4000  ! 3064: STDF_R	std	%f30, [%r0, %r17]
	.word 0xf03cc000  ! 3065: STD_R	std	%r24, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e13  ! 3066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e13, %hpstate
	.word 0xb351c000  ! 3067: RDPR_TL	rdpr	%tl, %r25
	.word 0xbd2d3001  ! 3070: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xf83dc000  ! 3077: STD_R	std	%r28, [%r23 + %r0]
	.word 0x8594a073  ! 3079: WRPR_TSTATE_I	wrpr	%r18, 0x0073, %tstate
	.word 0xbf500000  ! 3081: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf13ce11a  ! 3084: STDF_I	std	%f24, [0x011a, %r19]
	.word 0x8995e037  ! 3085: WRPR_TICK_I	wrpr	%r23, 0x0037, %tick
	.word 0xfe358000  ! 3086: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf93ca13d  ! 3087: STDF_I	std	%f28, [0x013d, %r18]
	.word 0xf93d60bc  ! 3091: STDF_I	std	%f28, [0x00bc, %r21]
	.word 0xf6240000  ! 3092: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf0354000  ! 3094: STH_R	sth	%r24, [%r21 + %r0]
	.word 0x899560df  ! 3095: WRPR_TICK_I	wrpr	%r21, 0x00df, %tick
	.word 0x87946106  ! 3096: WRPR_TT_I	wrpr	%r17, 0x0106, %tt
	setx	data_start_0, %g1, %r20
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa354000  ! 3101: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf835a08b  ! 3103: STH_I	sth	%r28, [%r22 + 0x008b]
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 3109: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf4744000  ! 3122: STX_R	stx	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd51c000  ! 3125: RDPR_TL	rdpr	%tl, %r30
	.word 0xf33cc000  ! 3126: STDF_R	std	%f25, [%r0, %r19]
	setx	0x3030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899561d7  ! 3129: WRPR_TICK_I	wrpr	%r21, 0x01d7, %tick
	.word 0xb53c7001  ! 3130: SRAX_I	srax	%r17, 0x0001, %r26
	.word 0xf6750000  ! 3131: STX_R	stx	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982dcb  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcb, %hpstate
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 3138: RDPR_GL	rdpr	%-, %r31
	.word 0xf42d217f  ! 3139: STB_I	stb	%r26, [%r20 + 0x017f]
	mov	1, %r12
	.word 0x8f932000  ! 3145: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf634a159  ! 3148: STH_I	sth	%r27, [%r18 + 0x0159]
	.word 0xfe758000  ! 3149: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf6750000  ! 3150: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xb8bdc000  ! 3152: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xbcb5616f  ! 3154: SUBCcc_I	orncc 	%r21, 0x016f, %r30
	.word 0xb60ca0f4  ! 3159: AND_I	and 	%r18, 0x00f4, %r27
	.word 0xf025a1e6  ! 3166: STW_I	stw	%r24, [%r22 + 0x01e6]
	.word 0xfc75a0e6  ! 3170: STX_I	stx	%r30, [%r22 + 0x00e6]
	.word 0xb9520000  ! 3171: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf875201a  ! 3173: STX_I	stx	%r28, [%r20 + 0x001a]
	.word 0xf93ca0e7  ! 3174: STDF_I	std	%f28, [0x00e7, %r18]
	.word 0xf82cc000  ! 3175: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x819421d5  ! 3176: WRPR_TPC_I	wrpr	%r16, 0x01d5, %tpc
	.word 0x8d94e11b  ! 3178: WRPR_PSTATE_I	wrpr	%r19, 0x011b, %pstate
	.word 0x839421a9  ! 3179: WRPR_TNPC_I	wrpr	%r16, 0x01a9, %tnpc
	.word 0xff3d4000  ! 3180: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb7510000  ! 3181: RDPR_TICK	rdpr	%tick, %r27
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3184: RDPR_GL	<illegal instruction>
	.word 0xf8258000  ! 3186: STW_R	stw	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e91  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e91, %hpstate
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 3194: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfb3c619b  ! 3201: STDF_I	std	%f29, [0x019b, %r17]
	.word 0xfa2de07a  ! 3205: STB_I	stb	%r29, [%r23 + 0x007a]
	.word 0xbf508000  ! 3206: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfb3ce04d  ! 3208: STDF_I	std	%f29, [0x004d, %r19]
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 3211: RDPR_PSTATE	<illegal instruction>
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63de0f0  ! 3221: STD_I	std	%r27, [%r23 + 0x00f0]
	.word 0xfa3c8000  ! 3223: STD_R	std	%r29, [%r18 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 3224: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 3232: STX_R	stx	%r24, [%r22 + %r0]
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3dc000  ! 3235: STD_R	std	%r29, [%r23 + %r0]
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d6074  ! 3241: STDF_I	std	%f29, [0x0074, %r21]
	.word 0xf22c8000  ! 3243: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf83d61ac  ! 3244: STD_I	std	%r28, [%r21 + 0x01ac]
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf074e133  ! 3246: STX_I	stx	%r24, [%r19 + 0x0133]
	.word 0xbb540000  ! 3247: RDPR_GL	rdpr	%-, %r29
	.word 0xf625a06c  ! 3251: STW_I	stw	%r27, [%r22 + 0x006c]
	.word 0xb3540000  ! 3252: RDPR_GL	<illegal instruction>
	.word 0xfd3d603e  ! 3255: STDF_I	std	%f30, [0x003e, %r21]
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 3258: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfc34a021  ! 3260: STH_I	sth	%r30, [%r18 + 0x0021]
	.word 0xb1518000  ! 3261: RDPR_PSTATE	<illegal instruction>
	.word 0x8394600a  ! 3266: WRPR_TNPC_I	wrpr	%r17, 0x000a, %tnpc
	.word 0xf0344000  ! 3273: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf0344000  ! 3274: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xb5480000  ! 3275: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf6342159  ! 3276: STH_I	sth	%r27, [%r16 + 0x0159]
	.word 0xb5500000  ! 3277: RDPR_TPC	<illegal instruction>
	.word 0x91942094  ! 3278: WRPR_PIL_I	wrpr	%r16, 0x0094, %pil
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	.word 0x85952189  ! 3286: WRPR_TSTATE_I	wrpr	%r20, 0x0189, %tstate
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 3290: STH_R	sth	%r24, [%r21 + %r0]
	.word 0x8395e02f  ! 3291: WRPR_TNPC_I	wrpr	%r23, 0x002f, %tnpc
	.word 0xb9508000  ! 3292: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf6254000  ! 3293: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf474a1b4  ! 3294: STX_I	stx	%r26, [%r18 + 0x01b4]
	.word 0xf03c4000  ! 3295: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb5510000  ! 3296: RDPR_TICK	<illegal instruction>
	.word 0xb4350000  ! 3302: ORN_R	orn 	%r20, %r0, %r26
	.word 0xf03de1d8  ! 3303: STD_I	std	%r24, [%r23 + 0x01d8]
	.word 0x9195e09c  ! 3306: WRPR_PIL_I	wrpr	%r23, 0x009c, %pil
	.word 0xfc250000  ! 3307: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf4356044  ! 3310: STH_I	sth	%r26, [%r21 + 0x0044]
	setx	0x20115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983dd9  ! 3314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd9, %hpstate
	.word 0xbd500000  ! 3315: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf73d8000  ! 3318: STDF_R	std	%f27, [%r0, %r22]
	.word 0xb950c000  ! 3319: RDPR_TT	<illegal instruction>
	.word 0xf434c000  ! 3322: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb750c000  ! 3325: RDPR_TT	<illegal instruction>
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d8000  ! 3332: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf82cc000  ! 3334: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfe74a029  ! 3336: STX_I	stx	%r31, [%r18 + 0x0029]
	.word 0xf13cc000  ! 3338: STDF_R	std	%f24, [%r0, %r19]
	.word 0xbd50c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 3343: RDPR_TSTATE	<illegal instruction>
	.word 0xf6244000  ! 3344: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf82ca083  ! 3348: STB_I	stb	%r28, [%r18 + 0x0083]
	.word 0xf22ca056  ! 3350: STB_I	stb	%r25, [%r18 + 0x0056]
	.word 0xfc3de108  ! 3351: STD_I	std	%r30, [%r23 + 0x0108]
	.word 0xb7518000  ! 3352: RDPR_PSTATE	<illegal instruction>
	.word 0xbd518000  ! 3356: RDPR_PSTATE	<illegal instruction>
	.word 0xfc358000  ! 3357: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf474c000  ! 3358: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xb6044000  ! 3360: ADD_R	add 	%r17, %r0, %r27
	.word 0xf834c000  ! 3363: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf475e1b3  ! 3364: STX_I	stx	%r26, [%r23 + 0x01b3]
	.word 0xfa254000  ! 3366: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfe2420c1  ! 3368: STW_I	stw	%r31, [%r16 + 0x00c1]
	.word 0xf73ce032  ! 3373: STDF_I	std	%f27, [0x0032, %r19]
	.word 0xfe240000  ! 3375: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb7480000  ! 3376: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc2c216e  ! 3381: STB_I	stb	%r30, [%r16 + 0x016e]
	.word 0xf8258000  ! 3382: STW_R	stw	%r28, [%r22 + %r0]
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb534d000  ! 3394: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xb1540000  ! 3395: RDPR_GL	rdpr	%-, %r24
	.word 0xf63d8000  ! 3396: STD_R	std	%r27, [%r22 + %r0]
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3ca0a7  ! 3402: STDF_I	std	%f30, [0x00a7, %r18]
	.word 0xfb3c0000  ! 3406: STDF_R	std	%f29, [%r0, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 3407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a1dc  ! 3411: WRPR_TNPC_I	wrpr	%r22, 0x01dc, %tnpc
	.word 0xfc244000  ! 3414: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983c83  ! 3415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c83, %hpstate
	.word 0xfa75c000  ! 3418: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf13c60f9  ! 3419: STDF_I	std	%f24, [0x00f9, %r17]
	.word 0xbf518000  ! 3420: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf8254000  ! 3421: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfe2421d3  ! 3422: STW_I	stw	%r31, [%r16 + 0x01d3]
	.word 0xfa2c8000  ! 3423: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xba450000  ! 3428: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xf93c0000  ! 3431: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf82c0000  ! 3433: STB_R	stb	%r28, [%r16 + %r0]
	.word 0x91946040  ! 3434: WRPR_PIL_I	wrpr	%r17, 0x0040, %pil
	.word 0x8595206f  ! 3435: WRPR_TSTATE_I	wrpr	%r20, 0x006f, %tstate
	.word 0xfe758000  ! 3437: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf6748000  ! 3440: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xfe340000  ! 3441: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xbb480000  ! 3442: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb4ac4000  ! 3443: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xfb3d4000  ! 3444: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf63c2194  ! 3446: STD_I	std	%r27, [%r16 + 0x0194]
	.word 0xf0344000  ! 3455: STH_R	sth	%r24, [%r17 + %r0]
	.word 0x8d95a0e8  ! 3458: WRPR_PSTATE_I	wrpr	%r22, 0x00e8, %pstate
	.word 0xf02d8000  ! 3461: STB_R	stb	%r24, [%r22 + %r0]
	.word 0x859560d1  ! 3462: WRPR_TSTATE_I	wrpr	%r21, 0x00d1, %tstate
	.word 0xbabcc000  ! 3465: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xb214a160  ! 3467: OR_I	or 	%r18, 0x0160, %r25
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 3472: RDPR_GL	rdpr	%-, %r31
	.word 0xfc2d207c  ! 3473: STB_I	stb	%r30, [%r20 + 0x007c]
	.word 0xf6350000  ! 3476: STH_R	sth	%r27, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3479: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe3d616f  ! 3480: STD_I	std	%r31, [%r21 + 0x016f]
	.word 0xbb480000  ! 3487: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba9d8000  ! 3496: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xf02d2052  ! 3501: STB_I	stb	%r24, [%r20 + 0x0052]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3518000  ! 3506: RDPR_PSTATE	<illegal instruction>
	.word 0x8195a19a  ! 3507: WRPR_TPC_I	wrpr	%r22, 0x019a, %tpc
	setx	data_start_6, %g1, %r17
	.word 0x87956139  ! 3512: WRPR_TT_I	wrpr	%r21, 0x0139, %tt
	.word 0xf33dc000  ! 3514: STDF_R	std	%f25, [%r0, %r23]
	.word 0xfa744000  ! 3515: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xbd3c6001  ! 3516: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0x8594a1aa  ! 3517: WRPR_TSTATE_I	wrpr	%r18, 0x01aa, %tstate
	.word 0xf474a14e  ! 3518: STX_I	stx	%r26, [%r18 + 0x014e]
	.word 0xf03c4000  ! 3524: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf93c0000  ! 3529: STDF_R	std	%f28, [%r0, %r16]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf834a0d2  ! 3538: STH_I	sth	%r28, [%r18 + 0x00d2]
	.word 0xb5510000  ! 3539: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfa740000  ! 3542: STX_R	stx	%r29, [%r16 + %r0]
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb414c000  ! 3553: OR_R	or 	%r19, %r0, %r26
	.word 0xf23ce1ba  ! 3555: STD_I	std	%r25, [%r19 + 0x01ba]
	.word 0xfa3d4000  ! 3556: STD_R	std	%r29, [%r21 + %r0]
	.word 0xbd3c6001  ! 3557: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xfe754000  ! 3560: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf2344000  ! 3562: STH_R	sth	%r25, [%r17 + %r0]
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919560be  ! 3565: WRPR_PIL_I	wrpr	%r21, 0x00be, %pil
	.word 0x8d9460cb  ! 3566: WRPR_PSTATE_I	wrpr	%r17, 0x00cb, %pstate
	.word 0x8995a1bf  ! 3567: WRPR_TICK_I	wrpr	%r22, 0x01bf, %tick
	mov	1, %r12
	.word 0x8f932000  ! 3580: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 3586: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb81da0c2  ! 3587: XOR_I	xor 	%r22, 0x00c2, %r28
	.word 0xbd504000  ! 3588: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xba2c200d  ! 3595: ANDN_I	andn 	%r16, 0x000d, %r29
	.word 0xf82d0000  ! 3597: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb934b001  ! 3598: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xf23dc000  ! 3600: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb22c0000  ! 3601: ANDN_R	andn 	%r16, %r0, %r25
	.word 0xf42d4000  ! 3610: STB_R	stb	%r26, [%r21 + %r0]
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c8000  ! 3619: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf225c000  ! 3623: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf2252013  ! 3626: STW_I	stw	%r25, [%r20 + 0x0013]
	.word 0xfe25211d  ! 3631: STW_I	stw	%r31, [%r20 + 0x011d]
	.word 0xb5504000  ! 3635: RDPR_TNPC	<illegal instruction>
	.word 0xb204a061  ! 3636: ADD_I	add 	%r18, 0x0061, %r25
	.word 0xbc458000  ! 3641: ADDC_R	addc 	%r22, %r0, %r30
	setx	data_start_6, %g1, %r20
	.word 0xfc254000  ! 3645: STW_R	stw	%r30, [%r21 + %r0]
	setx	data_start_2, %g1, %r20
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e128  ! 3649: WRPR_PIL_I	wrpr	%r19, 0x0128, %pil
	.word 0xf53c2152  ! 3652: STDF_I	std	%f26, [0x0152, %r16]
	.word 0xb69c6110  ! 3653: XORcc_I	xorcc 	%r17, 0x0110, %r27
	.word 0xb9500000  ! 3654: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfe3ca1f2  ! 3656: STD_I	std	%r31, [%r18 + 0x01f2]
	.word 0xb23c20f1  ! 3657: XNOR_I	xnor 	%r16, 0x00f1, %r25
	.word 0xb3518000  ! 3661: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3d8000  ! 3666: STDF_R	std	%f30, [%r0, %r22]
	.word 0xfc3c4000  ! 3668: STD_R	std	%r30, [%r17 + %r0]
	.word 0xfc3ca195  ! 3670: STD_I	std	%r30, [%r18 + 0x0195]
	.word 0xf225e14b  ! 3673: STW_I	stw	%r25, [%r23 + 0x014b]
	.word 0x8594604c  ! 3675: WRPR_TSTATE_I	wrpr	%r17, 0x004c, %tstate
	.word 0xbcbc8000  ! 3678: XNORcc_R	xnorcc 	%r18, %r0, %r30
	.word 0xbc34204d  ! 3679: ORN_I	orn 	%r16, 0x004d, %r30
	.word 0xbd510000  ! 3681: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb6450000  ! 3684: ADDC_R	addc 	%r20, %r0, %r27
	.word 0xf0248000  ! 3686: STW_R	stw	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 3687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xff3c6099  ! 3688: STDF_I	std	%f31, [0x0099, %r17]
	.word 0xb5510000  ! 3690: RDPR_TICK	rdpr	%tick, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983c5b  ! 3692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5b, %hpstate
	setx	data_start_4, %g1, %r16
	.word 0xb69d4000  ! 3695: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0x8d9420e1  ! 3699: WRPR_PSTATE_I	wrpr	%r16, 0x00e1, %pstate
	.word 0xf434209f  ! 3701: STH_I	sth	%r26, [%r16 + 0x009f]
	.word 0x8194e063  ! 3702: WRPR_TPC_I	wrpr	%r19, 0x0063, %tpc
	.word 0xbb508000  ! 3708: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf33c204b  ! 3709: STDF_I	std	%f25, [0x004b, %r16]
	.word 0xbb508000  ! 3710: RDPR_TSTATE	<illegal instruction>
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 3713: STH_R	sth	%r26, [%r16 + %r0]
	.word 0x9194a1ef  ! 3714: WRPR_PIL_I	wrpr	%r18, 0x01ef, %pil
	.word 0xb1510000  ! 3716: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf225c000  ! 3717: STW_R	stw	%r25, [%r23 + %r0]
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d0000  ! 3723: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf33d8000  ! 3724: STDF_R	std	%f25, [%r0, %r22]
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3727: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfc2cc000  ! 3730: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb3643801  ! 3733: MOVcc_I	<illegal instruction>
	.word 0xfc740000  ! 3734: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xb3508000  ! 3741: RDPR_TSTATE	<illegal instruction>
	.word 0xff3c60c9  ! 3745: STDF_I	std	%f31, [0x00c9, %r17]
	.word 0xb6240000  ! 3747: SUB_R	sub 	%r16, %r0, %r27
	.word 0xf6350000  ! 3748: STH_R	sth	%r27, [%r20 + %r0]
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32dc000  ! 3755: SLL_R	sll 	%r23, %r0, %r25
	.word 0xfc35603b  ! 3756: STH_I	sth	%r30, [%r21 + 0x003b]
	.word 0xbeb4c000  ! 3757: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0xb1520000  ! 3758: RDPR_PIL	<illegal instruction>
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa758000  ! 3760: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfc25614d  ! 3768: STW_I	stw	%r30, [%r21 + 0x014d]
	.word 0xfe2ca01f  ! 3773: STB_I	stb	%r31, [%r18 + 0x001f]
	.word 0x85942035  ! 3776: WRPR_TSTATE_I	wrpr	%r16, 0x0035, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xf53d4000  ! 3782: STDF_R	std	%f26, [%r0, %r21]
	.word 0xbf518000  ! 3787: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfe254000  ! 3788: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf93c6086  ! 3792: STDF_I	std	%f28, [0x0086, %r17]
	mov	2, %r14
	.word 0xa193a000  ! 3795: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf33d2185  ! 3797: STDF_I	std	%f25, [0x0185, %r20]
	mov	0, %r14
	.word 0xa193a000  ! 3799: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf224e1b9  ! 3800: STW_I	stw	%r25, [%r19 + 0x01b9]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0350000  ! 3806: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb151c000  ! 3815: RDPR_TL	rdpr	%tl, %r24
	.word 0xfe3460f5  ! 3816: STH_I	sth	%r31, [%r17 + 0x00f5]
	.word 0xf624c000  ! 3820: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xb3480000  ! 3822: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfe248000  ! 3823: STW_R	stw	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 3826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	.word 0xfb3c2141  ! 3827: STDF_I	std	%f29, [0x0141, %r16]
	.word 0xb3508000  ! 3833: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb9351000  ! 3834: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xf8750000  ! 3835: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xb7520000  ! 3837: RDPR_PIL	<illegal instruction>
	.word 0xf025e1ae  ! 3838: STW_I	stw	%r24, [%r23 + 0x01ae]
	.word 0xbd2c0000  ! 3839: SLL_R	sll 	%r16, %r0, %r30
	.word 0xf62de0ef  ! 3844: STB_I	stb	%r27, [%r23 + 0x00ef]
	.word 0xb4b5a1bb  ! 3845: ORNcc_I	orncc 	%r22, 0x01bb, %r26
	setx	data_start_3, %g1, %r17
	.word 0xfd3c2022  ! 3847: STDF_I	std	%f30, [0x0022, %r16]
	.word 0xbb7da401  ! 3849: MOVR_I	movre	%r22, 0x1, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 3851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946140  ! 3855: WRPR_PSTATE_I	wrpr	%r17, 0x0140, %pstate
	.word 0xfc758000  ! 3856: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xbf51c000  ! 3857: RDPR_TL	rdpr	%tl, %r31
	.word 0x9194610a  ! 3858: WRPR_PIL_I	wrpr	%r17, 0x010a, %pil
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8744000  ! 3864: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xbf51c000  ! 3869: RDPR_TL	rdpr	%tl, %r31
	.word 0xb4bdc000  ! 3870: XNORcc_R	xnorcc 	%r23, %r0, %r26
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25a088  ! 3875: STW_I	stw	%r29, [%r22 + 0x0088]
	.word 0xb7520000  ! 3877: RDPR_PIL	<illegal instruction>
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 3888: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xbb34d000  ! 3890: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xb63d8000  ! 3891: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xf8240000  ! 3892: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfa340000  ! 3894: STH_R	sth	%r29, [%r16 + %r0]
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82d4000  ! 3909: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xf93dc000  ! 3915: STDF_R	std	%f28, [%r0, %r23]
	.word 0xfe24e00a  ! 3917: STW_I	stw	%r31, [%r19 + 0x000a]
	.word 0xbb7d8400  ! 3922: MOVR_R	movre	%r22, %r0, %r29
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d0000  ! 3924: STDF_R	std	%f25, [%r0, %r20]
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983fd3  ! 3929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd3, %hpstate
	.word 0xb5342001  ! 3930: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xb1520000  ! 3932: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfe254000  ! 3933: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xbf51c000  ! 3934: RDPR_TL	<illegal instruction>
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c2099  ! 3939: STD_I	std	%r25, [%r16 + 0x0099]
	.word 0xf4342025  ! 3942: STH_I	sth	%r26, [%r16 + 0x0025]
	.word 0xbc354000  ! 3943: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xb2bc4000  ! 3947: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xf875a0b3  ! 3948: STX_I	stx	%r28, [%r22 + 0x00b3]
	.word 0xf53dc000  ! 3949: STDF_R	std	%f26, [%r0, %r23]
	.word 0xf93d8000  ! 3953: STDF_R	std	%f28, [%r0, %r22]
	.word 0xfa75a02c  ! 3955: STX_I	stx	%r29, [%r22 + 0x002c]
	.word 0xf6350000  ! 3956: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb02d4000  ! 3959: ANDN_R	andn 	%r21, %r0, %r24
	.word 0x8d94e0cc  ! 3960: WRPR_PSTATE_I	wrpr	%r19, 0x00cc, %pstate
	.word 0xf42ca111  ! 3961: STB_I	stb	%r26, [%r18 + 0x0111]
	.word 0xf62c8000  ! 3964: STB_R	stb	%r27, [%r18 + %r0]
	.word 0x8d94601e  ! 3965: WRPR_PSTATE_I	wrpr	%r17, 0x001e, %pstate
	.word 0xb3504000  ! 3967: RDPR_TNPC	rdpr	%tnpc, %r25
	mov	1, %r12
	.word 0x8f932000  ! 3969: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb951c000  ! 3970: RDPR_TL	rdpr	%tl, %r28
	.word 0xf835a004  ! 3972: STH_I	sth	%r28, [%r22 + 0x0004]
	.word 0xfa3cc000  ! 3975: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbe9d8000  ! 3976: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xf43d604f  ! 3978: STD_I	std	%r26, [%r21 + 0x004f]
	.word 0xb72dd000  ! 3980: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xb1510000  ! 3981: RDPR_TICK	<illegal instruction>
	.word 0xf33c60e8  ! 3983: STDF_I	std	%f25, [0x00e8, %r17]
	.word 0xb7510000  ! 3988: RDPR_TICK	<illegal instruction>
	.word 0x8194a072  ! 3990: WRPR_TPC_I	wrpr	%r18, 0x0072, %tpc
	.word 0xfe2d8000  ! 4004: STB_R	stb	%r31, [%r22 + %r0]
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 4011: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb551c000  ! 4013: RDPR_TL	<illegal instruction>
	.word 0xbd540000  ! 4016: RDPR_GL	<illegal instruction>
	.word 0xfe25614d  ! 4017: STW_I	stw	%r31, [%r21 + 0x014d]
	.word 0xf43560ac  ! 4018: STH_I	sth	%r26, [%r21 + 0x00ac]
	.word 0xbf540000  ! 4027: RDPR_GL	<illegal instruction>
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe254000  ! 4031: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf874a12d  ! 4036: STX_I	stx	%r28, [%r18 + 0x012d]
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe7461db  ! 4046: STX_I	stx	%r31, [%r17 + 0x01db]
	.word 0xf42521a9  ! 4054: STW_I	stw	%r26, [%r20 + 0x01a9]
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62ce1ba  ! 4058: STB_I	stb	%r27, [%r19 + 0x01ba]
	.word 0x81952072  ! 4060: WRPR_TPC_I	wrpr	%r20, 0x0072, %tpc
	.word 0xf13dc000  ! 4061: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf73dc000  ! 4065: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf2740000  ! 4067: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb1352001  ! 4068: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xb9354000  ! 4069: SRL_R	srl 	%r21, %r0, %r28
	.word 0xf0748000  ! 4070: STX_R	stx	%r24, [%r18 + %r0]
	setx	data_start_1, %g1, %r20
	.word 0xfb3ca1f8  ! 4076: STDF_I	std	%f29, [0x01f8, %r18]
	.word 0xf02c8000  ! 4077: STB_R	stb	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb50c000  ! 4082: RDPR_TT	rdpr	%tt, %r29
	.word 0xf03d2061  ! 4084: STD_I	std	%r24, [%r20 + 0x0061]
	.word 0xf225c000  ! 4085: STW_R	stw	%r25, [%r23 + %r0]
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 4091: RDPR_TNPC	<illegal instruction>
	.word 0xf03d61cd  ! 4095: STD_I	std	%r24, [%r21 + 0x01cd]
	.word 0xb9480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfd3cc000  ! 4102: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf93d0000  ! 4103: STDF_R	std	%f28, [%r0, %r20]
	.word 0xb6b52062  ! 4104: SUBCcc_I	orncc 	%r20, 0x0062, %r27
	.word 0xfe348000  ! 4106: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf03c0000  ! 4111: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbd540000  ! 4112: RDPR_GL	<illegal instruction>
	.word 0xb72dc000  ! 4114: SLL_R	sll 	%r23, %r0, %r27
	.word 0xfa758000  ! 4116: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfa3ca06d  ! 4123: STD_I	std	%r29, [%r18 + 0x006d]
	.word 0xfe3de1a4  ! 4126: STD_I	std	%r31, [%r23 + 0x01a4]
	mov	0, %r12
	.word 0x8f932000  ! 4127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf63dc000  ! 4131: STD_R	std	%r27, [%r23 + %r0]
	.word 0xb9352001  ! 4134: SRL_I	srl 	%r20, 0x0001, %r28
	.word 0xb61c8000  ! 4138: XOR_R	xor 	%r18, %r0, %r27
	.word 0xfd3c4000  ! 4140: STDF_R	std	%f30, [%r0, %r17]
	.word 0xbd2da001  ! 4144: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xf73de1f5  ! 4145: STDF_I	std	%f27, [0x01f5, %r23]
	.word 0xb550c000  ! 4153: RDPR_TT	rdpr	%tt, %r26
	.word 0xb7540000  ! 4159: RDPR_GL	<illegal instruction>
	.word 0xfe74c000  ! 4160: STX_R	stx	%r31, [%r19 + %r0]
	.word 0x85946181  ! 4161: WRPR_TSTATE_I	wrpr	%r17, 0x0181, %tstate
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3560a9  ! 4164: STH_I	sth	%r29, [%r21 + 0x00a9]
	.word 0xbd348000  ! 4168: SRL_R	srl 	%r18, %r0, %r30
	.word 0xf425a00c  ! 4169: STW_I	stw	%r26, [%r22 + 0x000c]
	.word 0xb750c000  ! 4171: RDPR_TT	rdpr	%tt, %r27
	.word 0x8195a1de  ! 4172: WRPR_TPC_I	wrpr	%r22, 0x01de, %tpc
	setx	data_start_6, %g1, %r23
	.word 0xfc34a040  ! 4178: STH_I	sth	%r30, [%r18 + 0x0040]
	.word 0xbb480000  ! 4180: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa34a09e  ! 4182: STH_I	sth	%r29, [%r18 + 0x009e]
	.word 0x8995a010  ! 4184: WRPR_TICK_I	wrpr	%r22, 0x0010, %tick
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6344000  ! 4187: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xba1c61b0  ! 4191: XOR_I	xor 	%r17, 0x01b0, %r29
	.word 0xf4744000  ! 4193: STX_R	stx	%r26, [%r17 + %r0]
	.word 0x8395204e  ! 4198: WRPR_TNPC_I	wrpr	%r20, 0x004e, %tnpc
	.word 0xb09d8000  ! 4202: XORcc_R	xorcc 	%r22, %r0, %r24
	.word 0xfd3d20ac  ! 4203: STDF_I	std	%f30, [0x00ac, %r20]
	.word 0xf8346175  ! 4207: STH_I	sth	%r28, [%r17 + 0x0175]
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674a195  ! 4214: STX_I	stx	%r27, [%r18 + 0x0195]
	.word 0xf53d4000  ! 4215: STDF_R	std	%f26, [%r0, %r21]
	.word 0xfc2c6105  ! 4217: STB_I	stb	%r30, [%r17 + 0x0105]
	.word 0xf13c61e7  ! 4218: STDF_I	std	%f24, [0x01e7, %r17]
	.word 0xb7500000  ! 4219: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xbb359000  ! 4220: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xfe348000  ! 4222: STH_R	sth	%r31, [%r18 + %r0]
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4226: RDPR_TPC	<illegal instruction>
	.word 0xfe24c000  ! 4228: STW_R	stw	%r31, [%r19 + %r0]
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	.word 0xb1500000  ! 4236: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbb34f001  ! 4238: SRLX_I	srlx	%r19, 0x0001, %r29
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 4241: STB_R	stb	%r24, [%r19 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4243: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd508000  ! 4245: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfa3c2036  ! 4247: STD_I	std	%r29, [%r16 + 0x0036]
	.word 0x8d94e1b3  ! 4251: WRPR_PSTATE_I	wrpr	%r19, 0x01b3, %pstate
	.word 0xf6350000  ! 4252: STH_R	sth	%r27, [%r20 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 4253: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbabc204e  ! 4254: XNORcc_I	xnorcc 	%r16, 0x004e, %r29
	.word 0xb2a48000  ! 4255: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xb7518000  ! 4256: RDPR_PSTATE	rdpr	%pstate, %r27
	setx	data_start_6, %g1, %r19
	.word 0xfa3c4000  ! 4260: STD_R	std	%r29, [%r17 + %r0]
	.word 0xbb3cd000  ! 4263: SRAX_R	srax	%r19, %r0, %r29
	.word 0xf33c610a  ! 4268: STDF_I	std	%f25, [0x010a, %r17]
	.word 0xf235211d  ! 4269: STH_I	sth	%r25, [%r20 + 0x011d]
	.word 0xbb2c6001  ! 4270: SLL_I	sll 	%r17, 0x0001, %r29
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf67520f5  ! 4278: STX_I	stx	%r27, [%r20 + 0x00f5]
	.word 0xf43de111  ! 4280: STD_I	std	%r26, [%r23 + 0x0111]
	.word 0xfa756125  ! 4282: STX_I	stx	%r29, [%r21 + 0x0125]
	.word 0xf625e03d  ! 4283: STW_I	stw	%r27, [%r23 + 0x003d]
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235e0ad  ! 4286: STH_I	sth	%r25, [%r23 + 0x00ad]
	.word 0xb7520000  ! 4288: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf8250000  ! 4290: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfa2cc000  ! 4291: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb5510000  ! 4292: RDPR_TICK	<illegal instruction>
	.word 0xf22d6184  ! 4296: STB_I	stb	%r25, [%r21 + 0x0184]
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e19b  ! 4303: WRPR_TPC_I	wrpr	%r23, 0x019b, %tpc
	.word 0xfc350000  ! 4305: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf4754000  ! 4306: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfc7561d0  ! 4307: STX_I	stx	%r30, [%r21 + 0x01d0]
	.word 0xf82ce1b5  ! 4310: STB_I	stb	%r28, [%r19 + 0x01b5]
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 4317: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfc748000  ! 4318: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf834c000  ! 4319: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf23d606d  ! 4321: STD_I	std	%r25, [%r21 + 0x006d]
	.word 0xf635a1ab  ! 4325: STH_I	sth	%r27, [%r22 + 0x01ab]
	.word 0xbf353001  ! 4328: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xf33d2136  ! 4335: STDF_I	std	%f25, [0x0136, %r20]
	.word 0xf03c0000  ! 4337: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf22cc000  ! 4338: STB_R	stb	%r25, [%r19 + %r0]
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946037  ! 4340: WRPR_TNPC_I	wrpr	%r17, 0x0037, %tnpc
	.word 0xbd520000  ! 4341: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf625a0f5  ! 4343: STW_I	stw	%r27, [%r22 + 0x00f5]
	.word 0x81952136  ! 4346: WRPR_TPC_I	wrpr	%r20, 0x0136, %tpc
	.word 0x899421e1  ! 4349: WRPR_TICK_I	wrpr	%r16, 0x01e1, %tick
	.word 0xb550c000  ! 4352: RDPR_TT	rdpr	%tt, %r26
	.word 0xf8758000  ! 4353: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x81946141  ! 4354: WRPR_TPC_I	wrpr	%r17, 0x0141, %tpc
	.word 0xf624e1bf  ! 4356: STW_I	stw	%r27, [%r19 + 0x01bf]
	.word 0xf53da0c7  ! 4358: STDF_I	std	%f26, [0x00c7, %r22]
	.word 0xf874602c  ! 4359: STX_I	stx	%r28, [%r17 + 0x002c]
	setx	data_start_4, %g1, %r19
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 4366: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa350000  ! 4369: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfb3ca07b  ! 4381: STDF_I	std	%f29, [0x007b, %r18]
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 4384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xb0b4e0c4  ! 4385: SUBCcc_I	orncc 	%r19, 0x00c4, %r24
	.word 0xbe840000  ! 4386: ADDcc_R	addcc 	%r16, %r0, %r31
	.word 0xf8240000  ! 4387: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf23cc000  ! 4389: STD_R	std	%r25, [%r19 + %r0]
	.word 0xb03d4000  ! 4390: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0x9194a1e0  ! 4392: WRPR_PIL_I	wrpr	%r18, 0x01e0, %pil
	.word 0xf4344000  ! 4393: STH_R	sth	%r26, [%r17 + %r0]
	.word 0x91956060  ! 4394: WRPR_PIL_I	wrpr	%r21, 0x0060, %pil
	.word 0xb23dc000  ! 4397: XNOR_R	xnor 	%r23, %r0, %r25
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6ada000  ! 4399: ANDNcc_I	andncc 	%r22, 0x0000, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 4405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xfe3cc000  ! 4406: STD_R	std	%r31, [%r19 + %r0]
	.word 0xfa740000  ! 4415: STX_R	stx	%r29, [%r16 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0xf224a13f  ! 4420: STW_I	stw	%r25, [%r18 + 0x013f]
	setx	data_start_2, %g1, %r19
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42de0a5  ! 4423: STB_I	stb	%r26, [%r23 + 0x00a5]
	.word 0xf62ca158  ! 4424: STB_I	stb	%r27, [%r18 + 0x0158]
	.word 0xfe25207b  ! 4425: STW_I	stw	%r31, [%r20 + 0x007b]
	.word 0xf434e1c4  ! 4426: STH_I	sth	%r26, [%r19 + 0x01c4]
	.word 0xf6742074  ! 4427: STX_I	stx	%r27, [%r16 + 0x0074]
	.word 0x879421c0  ! 4428: WRPR_TT_I	wrpr	%r16, 0x01c0, %tt
	.word 0xbc042122  ! 4429: ADD_I	add 	%r16, 0x0122, %r30
	.word 0x8d9420c7  ! 4432: WRPR_PSTATE_I	wrpr	%r16, 0x00c7, %pstate
	.word 0xfe74a0b4  ! 4433: STX_I	stx	%r31, [%r18 + 0x00b4]
	.word 0xb24421d4  ! 4436: ADDC_I	addc 	%r16, 0x01d4, %r25
	.word 0xf8246102  ! 4437: STW_I	stw	%r28, [%r17 + 0x0102]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 4441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a010  ! 4449: WRPR_TICK_I	wrpr	%r22, 0x0010, %tick
	.word 0xf8750000  ! 4450: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xb0b4e126  ! 4451: SUBCcc_I	orncc 	%r19, 0x0126, %r24
	.word 0x9195a13b  ! 4453: WRPR_PIL_I	wrpr	%r22, 0x013b, %pil
	.word 0xf8250000  ! 4454: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb4bd4000  ! 4463: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xfe3c209c  ! 4466: STD_I	std	%r31, [%r16 + 0x009c]
	.word 0xbb51c000  ! 4470: RDPR_TL	rdpr	%tl, %r29
	.word 0xf425e01c  ! 4473: STW_I	stw	%r26, [%r23 + 0x001c]
	.word 0xfa2c4000  ! 4478: STB_R	stb	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf234c000  ! 4489: STH_R	sth	%r25, [%r19 + %r0]
	.word 0x839420e6  ! 4495: WRPR_TNPC_I	wrpr	%r16, 0x00e6, %tnpc
	.word 0xfb3d60ba  ! 4499: STDF_I	std	%f29, [0x00ba, %r21]
	.word 0xb4158000  ! 4501: OR_R	or 	%r22, %r0, %r26
	.word 0xfa3c8000  ! 4502: STD_R	std	%r29, [%r18 + %r0]
	.word 0xfa754000  ! 4503: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xbc14a022  ! 4505: OR_I	or 	%r18, 0x0022, %r30
	.word 0xb5540000  ! 4506: RDPR_GL	rdpr	%-, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d4000  ! 4511: STB_R	stb	%r31, [%r21 + %r0]
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4513: RDPR_TT	rdpr	%tt, %r25
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf225c000  ! 4517: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb435607c  ! 4518: SUBC_I	orn 	%r21, 0x007c, %r26
	.word 0xf23d61f0  ! 4519: STD_I	std	%r25, [%r21 + 0x01f0]
	.word 0xb93cf001  ! 4520: SRAX_I	srax	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0x8194a07d  ! 4522: WRPR_TPC_I	wrpr	%r18, 0x007d, %tpc
	.word 0xf43ca175  ! 4525: STD_I	std	%r26, [%r18 + 0x0175]
	.word 0xfb3de0f8  ! 4526: STDF_I	std	%f29, [0x00f8, %r23]
	.word 0xf624a0d9  ! 4527: STW_I	stw	%r27, [%r18 + 0x00d9]
	.word 0xf63d8000  ! 4531: STD_R	std	%r27, [%r22 + %r0]
	.word 0xb204a043  ! 4536: ADD_I	add 	%r18, 0x0043, %r25
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89946111  ! 4541: WRPR_TICK_I	wrpr	%r17, 0x0111, %tick
	.word 0xbd520000  ! 4542: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf4350000  ! 4544: STH_R	sth	%r26, [%r20 + %r0]
	.word 0x85956198  ! 4546: WRPR_TSTATE_I	wrpr	%r21, 0x0198, %tstate
	.word 0xf8350000  ! 4550: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf93d4000  ! 4553: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf675a13d  ! 4558: STX_I	stx	%r27, [%r22 + 0x013d]
	.word 0xb62de19d  ! 4559: ANDN_I	andn 	%r23, 0x019d, %r27
	.word 0xf42521e2  ! 4561: STW_I	stw	%r26, [%r20 + 0x01e2]
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 4564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 4569: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf02521ad  ! 4572: STW_I	stw	%r24, [%r20 + 0x01ad]
	.word 0x8194612d  ! 4577: WRPR_TPC_I	wrpr	%r17, 0x012d, %tpc
	.word 0xbd641800  ! 4581: MOVcc_R	<illegal instruction>
	.word 0xf82d4000  ! 4582: STB_R	stb	%r28, [%r21 + %r0]
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e1fb  ! 4584: WRPR_TT_I	wrpr	%r19, 0x01fb, %tt
	.word 0xf93c61ab  ! 4585: STDF_I	std	%f28, [0x01ab, %r17]
	.word 0xb484a085  ! 4590: ADDcc_I	addcc 	%r18, 0x0085, %r26
	setx	data_start_2, %g1, %r22
	.word 0xb1518000  ! 4595: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb9500000  ! 4600: RDPR_TPC	<illegal instruction>
	.word 0xf624e173  ! 4602: STW_I	stw	%r27, [%r19 + 0x0173]
	.word 0xf63dc000  ! 4603: STD_R	std	%r27, [%r23 + %r0]
	.word 0xb4ac0000  ! 4604: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xf0250000  ! 4605: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf43460cb  ! 4610: STH_I	sth	%r26, [%r17 + 0x00cb]
	.word 0xbd50c000  ! 4611: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 4612: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc450000  ! 4614: ADDC_R	addc 	%r20, %r0, %r30
	mov	2, %r12
	.word 0x8f932000  ! 4615: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x8198294b  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094b, %hpstate
	.word 0xfe254000  ! 4619: STW_R	stw	%r31, [%r21 + %r0]
	setx	data_start_1, %g1, %r23
	.word 0xfa25c000  ! 4625: STW_R	stw	%r29, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xfe354000  ! 4635: STH_R	sth	%r31, [%r21 + %r0]
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4645: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc2de085  ! 4646: STB_I	stb	%r30, [%r23 + 0x0085]
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 4648: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf42da192  ! 4658: STB_I	stb	%r26, [%r22 + 0x0192]
	.word 0xf22cc000  ! 4660: STB_R	stb	%r25, [%r19 + %r0]
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf474e09a  ! 4667: STX_I	stx	%r26, [%r19 + 0x009a]
	.word 0xbb520000  ! 4672: RDPR_PIL	<illegal instruction>
	.word 0xfb3ca113  ! 4673: STDF_I	std	%f29, [0x0113, %r18]
	.word 0xb824a0ff  ! 4675: SUB_I	sub 	%r18, 0x00ff, %r28
	.word 0xfa3d8000  ! 4677: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfe2c6041  ! 4678: STB_I	stb	%r31, [%r17 + 0x0041]
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a16f  ! 4682: WRPR_TNPC_I	wrpr	%r22, 0x016f, %tnpc
	.word 0xf62c21a7  ! 4683: STB_I	stb	%r27, [%r16 + 0x01a7]
	.word 0xfe25c000  ! 4688: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xb9504000  ! 4689: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf23c6019  ! 4691: STD_I	std	%r25, [%r17 + 0x0019]
	mov	1, %r14
	.word 0xa193a000  ! 4694: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb510000  ! 4698: RDPR_TICK	rdpr	%tick, %r29
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595600d  ! 4710: WRPR_TSTATE_I	wrpr	%r21, 0x000d, %tstate
	.word 0xb1540000  ! 4713: RDPR_GL	rdpr	%-, %r24
	.word 0x8594a072  ! 4717: WRPR_TSTATE_I	wrpr	%r18, 0x0072, %tstate
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 4721: STD_R	std	%r27, [%r20 + %r0]
	.word 0xbc344000  ! 4724: SUBC_R	orn 	%r17, %r0, %r30
	setx	data_start_2, %g1, %r21
	.word 0xb6ad8000  ! 4726: ANDNcc_R	andncc 	%r22, %r0, %r27
	.word 0x819521c6  ! 4728: WRPR_TPC_I	wrpr	%r20, 0x01c6, %tpc
	.word 0xbb2ca001  ! 4729: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xf225c000  ! 4733: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf2754000  ! 4739: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf625c000  ! 4740: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf63520e4  ! 4743: STH_I	sth	%r27, [%r20 + 0x00e4]
	.word 0xb60c2127  ! 4748: AND_I	and 	%r16, 0x0127, %r27
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 4752: STB_R	stb	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982adb  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adb, %hpstate
	.word 0xbb518000  ! 4754: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0x8d95a047  ! 4755: WRPR_PSTATE_I	wrpr	%r22, 0x0047, %pstate
	.word 0xfa75a191  ! 4756: STX_I	stx	%r29, [%r22 + 0x0191]
	.word 0xf8744000  ! 4758: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf8248000  ! 4762: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xfa24600a  ! 4764: STW_I	stw	%r29, [%r17 + 0x000a]
	.word 0xba0de0e3  ! 4768: AND_I	and 	%r23, 0x00e3, %r29
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 4775: STH_R	sth	%r28, [%r22 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0xb2ada08b  ! 4778: ANDNcc_I	andncc 	%r22, 0x008b, %r25
	.word 0xfc3c0000  ! 4781: STD_R	std	%r30, [%r16 + %r0]
	.word 0xf02d20e7  ! 4782: STB_I	stb	%r24, [%r20 + 0x00e7]
	.word 0xfa3d8000  ! 4786: STD_R	std	%r29, [%r22 + %r0]
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc148000  ! 4793: OR_R	or 	%r18, %r0, %r30
	.word 0xf83cc000  ! 4794: STD_R	std	%r28, [%r19 + %r0]
	.word 0xbb510000  ! 4795: RDPR_TICK	rdpr	%tick, %r29
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83dc000  ! 4798: STD_R	std	%r28, [%r23 + %r0]
	.word 0xbf2c1000  ! 4800: SLLX_R	sllx	%r16, %r0, %r31
	.word 0xf53d0000  ! 4801: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf33d4000  ! 4804: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb1540000  ! 4805: RDPR_GL	<illegal instruction>
	.word 0xb5504000  ! 4806: RDPR_TNPC	<illegal instruction>
	.word 0xb61d0000  ! 4808: XOR_R	xor 	%r20, %r0, %r27
	.word 0xbd518000  ! 4810: RDPR_PSTATE	<illegal instruction>
	.word 0xf8340000  ! 4811: STH_R	sth	%r28, [%r16 + %r0]
	.word 0x8994a18f  ! 4813: WRPR_TICK_I	wrpr	%r18, 0x018f, %tick
	.word 0xfe34a1ca  ! 4817: STH_I	sth	%r31, [%r18 + 0x01ca]
	.word 0xf835206d  ! 4822: STH_I	sth	%r28, [%r20 + 0x006d]
	.word 0xf93de049  ! 4823: STDF_I	std	%f28, [0x0049, %r23]
	.word 0xf33ca042  ! 4826: STDF_I	std	%f25, [0x0042, %r18]
	ta	T_CHANGE_HPRIV
	.word 0x81983ac1  ! 4827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac1, %hpstate
	.word 0xf874e175  ! 4831: STX_I	stx	%r28, [%r19 + 0x0175]
	.word 0xb5510000  ! 4839: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb7480000  ! 4844: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x919561e9  ! 4845: WRPR_PIL_I	wrpr	%r21, 0x01e9, %pil
	.word 0xf23dc000  ! 4847: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf23da11d  ! 4849: STD_I	std	%r25, [%r22 + 0x011d]
	.word 0xb350c000  ! 4850: RDPR_TT	rdpr	%tt, %r25
	.word 0xfe3cc000  ! 4855: STD_R	std	%r31, [%r19 + %r0]
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf234611f  ! 4860: STH_I	sth	%r25, [%r17 + 0x011f]
	.word 0xf2750000  ! 4861: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xff3dc000  ! 4865: STDF_R	std	%f31, [%r0, %r23]
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 4868: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf874204d  ! 4872: STX_I	stx	%r28, [%r16 + 0x004d]
	.word 0xf225c000  ! 4874: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb7540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xfa2d4000  ! 4878: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xfe7420bb  ! 4881: STX_I	stx	%r31, [%r16 + 0x00bb]
	.word 0xf43c4000  ! 4882: STD_R	std	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983cc9  ! 4884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc9, %hpstate
	.word 0xb7540000  ! 4893: RDPR_GL	rdpr	%-, %r27
	.word 0xf2244000  ! 4895: STW_R	stw	%r25, [%r17 + %r0]
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983e8b  ! 4898: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8b, %hpstate
	.word 0xb0bce0b8  ! 4899: XNORcc_I	xnorcc 	%r19, 0x00b8, %r24
	.word 0xf6240000  ! 4900: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf63c2184  ! 4901: STD_I	std	%r27, [%r16 + 0x0184]
	.word 0xfe2ce0b5  ! 4902: STB_I	stb	%r31, [%r19 + 0x00b5]
	.word 0xb23ce097  ! 4903: XNOR_I	xnor 	%r19, 0x0097, %r25
	.word 0x87956165  ! 4906: WRPR_TT_I	wrpr	%r21, 0x0165, %tt
	.word 0x85952047  ! 4911: WRPR_TSTATE_I	wrpr	%r20, 0x0047, %tstate
	.word 0xf625a1f7  ! 4912: STW_I	stw	%r27, [%r22 + 0x01f7]
	.word 0xf435a043  ! 4913: STH_I	sth	%r26, [%r22 + 0x0043]
	.word 0xfe350000  ! 4917: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf73d21bd  ! 4918: STDF_I	std	%f27, [0x01bd, %r20]
	.word 0xfc2d0000  ! 4919: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfc24a126  ! 4920: STW_I	stw	%r30, [%r18 + 0x0126]
	setx	0x20011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6248000  ! 4941: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf4758000  ! 4942: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf03dc000  ! 4943: STD_R	std	%r24, [%r23 + %r0]
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33d7001  ! 4945: SRAX_I	srax	%r21, 0x0001, %r25
	.word 0xf425206b  ! 4949: STW_I	stw	%r26, [%r20 + 0x006b]
	.word 0xb694a045  ! 4951: ORcc_I	orcc 	%r18, 0x0045, %r27
	.word 0xf53de078  ! 4952: STDF_I	std	%f26, [0x0078, %r23]
	.word 0xfd3c0000  ! 4956: STDF_R	std	%f30, [%r0, %r16]
	.word 0xb5480000  ! 4957: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf834a1a4  ! 4958: STH_I	sth	%r28, [%r18 + 0x01a4]
	.word 0xfe75c000  ! 4963: STX_R	stx	%r31, [%r23 + %r0]
	.word 0x899561a4  ! 4965: WRPR_TICK_I	wrpr	%r21, 0x01a4, %tick
	.word 0xf22d0000  ! 4968: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfc2ce0c6  ! 4969: STB_I	stb	%r30, [%r19 + 0x00c6]
	.word 0xf874c000  ! 4971: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xfc340000  ! 4975: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb7480000  ! 4977: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbb480000  ! 4987: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf4240000  ! 4988: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb4b5e0f9  ! 4990: SUBCcc_I	orncc 	%r23, 0x00f9, %r26
	.word 0xb1500000  ! 4993: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb9504000  ! 4994: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 4995: RDPR_TSTATE	<illegal instruction>
	.word 0xfd3d8000  ! 4996: STDF_R	std	%f30, [%r0, %r22]
	.word 0xfa2cc000  ! 4997: STB_R	stb	%r29, [%r19 + %r0]
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
	.word 0xb4bd6071  ! 1: XNORcc_I	xnorcc 	%r21, 0x0071, %r26
	.word 0x83946152  ! 4: WRPR_TNPC_I	wrpr	%r17, 0x0152, %tnpc
	.word 0xfc144000  ! 8: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf11c601c  ! 9: LDDF_I	ldd	[%r17, 0x001c], %f24
	.word 0xbe35c000  ! 11: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xbb480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8794e05d  ! 20: WRPR_TT_I	wrpr	%r19, 0x005d, %tt
	setx	data_start_5, %g1, %r21
	.word 0xf45ca098  ! 24: LDX_I	ldx	[%r18 + 0x0098], %r26
	.word 0xfe042190  ! 25: LDUW_I	lduw	[%r16 + 0x0190], %r31
	.word 0xf51c0000  ! 27: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf51dc000  ! 29: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xb2bd0000  ! 38: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0xfb1d8000  ! 43: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0x8d95a17a  ! 45: WRPR_PSTATE_I	wrpr	%r22, 0x017a, %pstate
	.word 0xfc0d21d5  ! 52: LDUB_I	ldub	[%r20 + 0x01d5], %r30
	.word 0x919560ec  ! 53: WRPR_PIL_I	wrpr	%r21, 0x00ec, %pil
	.word 0xfa5ce154  ! 55: LDX_I	ldx	[%r19 + 0x0154], %r29
	.word 0xfe140000  ! 56: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0x8195a114  ! 57: WRPR_TPC_I	wrpr	%r22, 0x0114, %tpc
	.word 0xfc15e168  ! 61: LDUH_I	lduh	[%r23 + 0x0168], %r30
	.word 0xb551c000  ! 62: RDPR_TL	<illegal instruction>
	.word 0xf0558000  ! 63: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xbd2d8000  ! 68: SLL_R	sll 	%r22, %r0, %r30
	.word 0x9194a057  ! 69: WRPR_PIL_I	wrpr	%r18, 0x0057, %pil
	.word 0xfc44a1e5  ! 70: LDSW_I	ldsw	[%r18 + 0x01e5], %r30
	.word 0x8d94e0d7  ! 71: WRPR_PSTATE_I	wrpr	%r19, 0x00d7, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0xb9540000  ! 74: RDPR_GL	<illegal instruction>
	.word 0xf20c0000  ! 76: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xfe4c2051  ! 83: LDSB_I	ldsb	[%r16 + 0x0051], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7500000  ! 86: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	.word 0x899461de  ! 92: WRPR_TICK_I	wrpr	%r17, 0x01de, %tick
	.word 0x8d94e0f4  ! 93: WRPR_PSTATE_I	wrpr	%r19, 0x00f4, %pstate
	.word 0xb3480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	2, %r12
	.word 0x8f932000  ! 95: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb63c2012  ! 99: XNOR_I	xnor 	%r16, 0x0012, %r27
	.word 0xb3518000  ! 101: RDPR_PSTATE	<illegal instruction>
	.word 0xf85cc000  ! 102: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf8448000  ! 107: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xb63cc000  ! 118: XNOR_R	xnor 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0xb5520000  ! 122: RDPR_PIL	<illegal instruction>
	.word 0xfa458000  ! 123: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf01c613a  ! 125: LDD_I	ldd	[%r17 + 0x013a], %r24
	.word 0xf6044000  ! 128: LDUW_R	lduw	[%r17 + %r0], %r27
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45561cf  ! 133: LDSH_I	ldsh	[%r21 + 0x01cf], %r26
	mov	2, %r14
	.word 0xa193a000  ! 134: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r17
	.word 0xb7641800  ! 137: MOVcc_R	<illegal instruction>
	.word 0xf04d610c  ! 140: LDSB_I	ldsb	[%r21 + 0x010c], %r24
	.word 0xf21c4000  ! 142: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xf45420e6  ! 144: LDSH_I	ldsh	[%r16 + 0x00e6], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 157: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf21d204e  ! 164: LDD_I	ldd	[%r20 + 0x004e], %r25
	.word 0xf80c4000  ! 167: LDUB_R	ldub	[%r17 + %r0], %r28
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d618d  ! 170: LDD_I	ldd	[%r21 + 0x018d], %r31
	.word 0xbc158000  ! 171: OR_R	or 	%r22, %r0, %r30
	.word 0xfe4c4000  ! 173: LDSB_R	ldsb	[%r17 + %r0], %r31
	setx	data_start_0, %g1, %r21
	setx	0x20010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d4000  ! 181: LDD_R	ldd	[%r21 + %r0], %r27
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xfc5de149  ! 196: LDX_I	ldx	[%r23 + 0x0149], %r30
	.word 0xf81ce196  ! 197: LDD_I	ldd	[%r19 + 0x0196], %r28
	.word 0xb01d8000  ! 198: XOR_R	xor 	%r22, %r0, %r24
	.word 0x8795a18c  ! 199: WRPR_TT_I	wrpr	%r22, 0x018c, %tt
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23dc000  ! 202: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfa4c0000  ! 205: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xbb34d000  ! 209: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xb3520000  ! 210: RDPR_PIL	<illegal instruction>
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 214: RDPR_GL	<illegal instruction>
	.word 0x8594e06b  ! 215: WRPR_TSTATE_I	wrpr	%r19, 0x006b, %tstate
	.word 0xfe5d8000  ! 218: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xf40d20a9  ! 219: LDUB_I	ldub	[%r20 + 0x00a9], %r26
	.word 0xbb500000  ! 223: RDPR_TPC	<illegal instruction>
	.word 0x8994a01d  ! 225: WRPR_TICK_I	wrpr	%r18, 0x001d, %tick
	.word 0xf245214d  ! 228: LDSW_I	ldsw	[%r20 + 0x014d], %r25
	.word 0xb3508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0xfa054000  ! 231: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xfe4d0000  ! 232: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf64c4000  ! 234: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0x8994a1f1  ! 239: WRPR_TICK_I	wrpr	%r18, 0x01f1, %tick
	.word 0xf6450000  ! 240: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xb3643801  ! 242: MOVcc_I	<illegal instruction>
	.word 0xf24ca0ab  ! 247: LDSB_I	ldsb	[%r18 + 0x00ab], %r25
	setx	data_start_2, %g1, %r16
	.word 0xf415a017  ! 249: LDUH_I	lduh	[%r22 + 0x0017], %r26
	.word 0xf11da102  ! 252: LDDF_I	ldd	[%r22, 0x0102], %f24
	.word 0xf25de049  ! 258: LDX_I	ldx	[%r23 + 0x0049], %r25
	.word 0x819420d3  ! 261: WRPR_TPC_I	wrpr	%r16, 0x00d3, %tpc
	setx	data_start_0, %g1, %r22
	.word 0xb72d4000  ! 263: SLL_R	sll 	%r21, %r0, %r27
	.word 0xf244e1b6  ! 264: LDSW_I	ldsw	[%r19 + 0x01b6], %r25
	.word 0xf21c21b2  ! 265: LDD_I	ldd	[%r16 + 0x01b2], %r25
	.word 0xf20d8000  ! 267: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf444c000  ! 271: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xb9480000  ! 273: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa1c0000  ! 276: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xf24de154  ! 277: LDSB_I	ldsb	[%r23 + 0x0154], %r25
	.word 0xf4048000  ! 278: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf65da1b1  ! 284: LDX_I	ldx	[%r22 + 0x01b1], %r27
	.word 0xba25c000  ! 288: SUB_R	sub 	%r23, %r0, %r29
	.word 0xfc4c6072  ! 290: LDSB_I	ldsb	[%r17 + 0x0072], %r30
	.word 0x8995e179  ! 294: WRPR_TICK_I	wrpr	%r23, 0x0179, %tick
	.word 0xb951c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xfa1d213f  ! 296: LDD_I	ldd	[%r20 + 0x013f], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xf6452135  ! 302: LDSW_I	ldsw	[%r20 + 0x0135], %r27
	.word 0xf05d0000  ! 303: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xb17d2401  ! 304: MOVR_I	movre	%r20, 0x1, %r24
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc1d0000  ! 309: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf41d2128  ! 310: LDD_I	ldd	[%r20 + 0x0128], %r26
	.word 0xf44c2134  ! 311: LDSB_I	ldsb	[%r16 + 0x0134], %r26
	.word 0x8595a1f8  ! 312: WRPR_TSTATE_I	wrpr	%r22, 0x01f8, %tstate
	.word 0xf91c606c  ! 316: LDDF_I	ldd	[%r17, 0x006c], %f28
	.word 0xb5508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0xf814609a  ! 318: LDUH_I	lduh	[%r17 + 0x009a], %r28
	.word 0xfe440000  ! 319: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0x8795a1c8  ! 321: WRPR_TT_I	wrpr	%r22, 0x01c8, %tt
	.word 0xf61da01f  ! 323: LDD_I	ldd	[%r22 + 0x001f], %r27
	.word 0xfc4c4000  ! 327: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xfa040000  ! 332: LDUW_R	lduw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899420fe  ! 336: WRPR_TICK_I	wrpr	%r16, 0x00fe, %tick
	.word 0x8594e132  ! 338: WRPR_TSTATE_I	wrpr	%r19, 0x0132, %tstate
	.word 0xfe44e131  ! 339: LDSW_I	ldsw	[%r19 + 0x0131], %r31
	setx	data_start_6, %g1, %r19
	.word 0xf04c60b6  ! 342: LDSB_I	ldsb	[%r17 + 0x00b6], %r24
	.word 0xf61c0000  ! 346: LDD_R	ldd	[%r16 + %r0], %r27
	setx	data_start_4, %g1, %r21
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xf805e155  ! 355: LDUW_I	lduw	[%r23 + 0x0155], %r28
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3520000  ! 359: RDPR_PIL	<illegal instruction>
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8b58000  ! 363: SUBCcc_R	orncc 	%r22, %r0, %r28
	.word 0xbd500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb9518000  ! 370: RDPR_PSTATE	<illegal instruction>
	.word 0xfa158000  ! 371: LDUH_R	lduh	[%r22 + %r0], %r29
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1521e6  ! 378: LDUH_I	lduh	[%r20 + 0x01e6], %r30
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	.word 0xfc1421b4  ! 381: LDUH_I	lduh	[%r16 + 0x01b4], %r30
	.word 0xb9641800  ! 383: MOVcc_R	<illegal instruction>
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015e0ab  ! 386: LDUH_I	lduh	[%r23 + 0x00ab], %r24
	.word 0xfa052081  ! 391: LDUW_I	lduw	[%r20 + 0x0081], %r29
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c217a  ! 395: LDD_I	ldd	[%r16 + 0x017a], %r24
	.word 0xf0442040  ! 396: LDSW_I	ldsw	[%r16 + 0x0040], %r24
	.word 0xb9540000  ! 397: RDPR_GL	<illegal instruction>
	.word 0xf31cc000  ! 399: LDDF_R	ldd	[%r19, %r0], %f25
	setx	data_start_5, %g1, %r17
	.word 0xb3500000  ! 409: RDPR_TPC	<illegal instruction>
	.word 0xf00de0ef  ! 415: LDUB_I	ldub	[%r23 + 0x00ef], %r24
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d605e  ! 424: LDUB_I	ldub	[%r21 + 0x005e], %r26
	.word 0xf81d4000  ! 427: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0x8194a175  ! 428: WRPR_TPC_I	wrpr	%r18, 0x0175, %tpc
	.word 0xfa142052  ! 429: LDUH_I	lduh	[%r16 + 0x0052], %r29
	setx	data_start_6, %g1, %r23
	.word 0xbb510000  ! 435: RDPR_TICK	<illegal instruction>
	.word 0xf24c61cb  ! 437: LDSB_I	ldsb	[%r17 + 0x01cb], %r25
	.word 0xfc050000  ! 438: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbc0421fe  ! 444: ADD_I	add 	%r16, 0x01fe, %r30
	mov	2, %r14
	.word 0xa193a000  ! 446: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0048000  ! 447: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xfc044000  ! 448: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0x9195a07a  ! 449: WRPR_PIL_I	wrpr	%r22, 0x007a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xf804e00c  ! 455: LDUW_I	lduw	[%r19 + 0x000c], %r28
	.word 0xb43420c6  ! 456: ORN_I	orn 	%r16, 0x00c6, %r26
	.word 0xbd510000  ! 457: RDPR_TICK	<illegal instruction>
	.word 0xf6554000  ! 458: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf0046122  ! 459: LDUW_I	lduw	[%r17 + 0x0122], %r24
	setx	0x20320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51d6117  ! 471: LDDF_I	ldd	[%r21, 0x0117], %f26
	.word 0x8795e00a  ! 473: WRPR_TT_I	wrpr	%r23, 0x000a, %tt
	.word 0xbd508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xfc4ca046  ! 477: LDSB_I	ldsb	[%r18 + 0x0046], %r30
	.word 0xfc5d0000  ! 483: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xb550c000  ! 485: RDPR_TT	<illegal instruction>
	.word 0x899420a5  ! 486: WRPR_TICK_I	wrpr	%r16, 0x00a5, %tick
	.word 0xf60de171  ! 489: LDUB_I	ldub	[%r23 + 0x0171], %r27
	.word 0xf65de02a  ! 490: LDX_I	ldx	[%r23 + 0x002a], %r27
	.word 0xb8044000  ! 492: ADD_R	add 	%r17, %r0, %r28
	.word 0xfd1d8000  ! 496: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xbe34c000  ! 497: SUBC_R	orn 	%r19, %r0, %r31
	.word 0xf645e0dc  ! 500: LDSW_I	ldsw	[%r23 + 0x00dc], %r27
	.word 0xbc0de1d8  ! 501: AND_I	and 	%r23, 0x01d8, %r30
	.word 0xf24de0a5  ! 502: LDSB_I	ldsb	[%r23 + 0x00a5], %r25
	.word 0xbd504000  ! 504: RDPR_TNPC	<illegal instruction>
	.word 0xf4158000  ! 505: LDUH_R	lduh	[%r22 + %r0], %r26
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60461b2  ! 508: ADD_I	add 	%r17, 0x01b2, %r27
	.word 0xb751c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xf45c6125  ! 513: LDX_I	ldx	[%r17 + 0x0125], %r26
	.word 0xb7480000  ! 518: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb0348000  ! 522: SUBC_R	orn 	%r18, %r0, %r24
	.word 0xf21c0000  ! 523: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xf64dc000  ! 529: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf61d8000  ! 530: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xfa0c8000  ! 532: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xfe550000  ! 533: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xb614a04b  ! 535: OR_I	or 	%r18, 0x004b, %r27
	.word 0xf00d0000  ! 539: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xb28c4000  ! 543: ANDcc_R	andcc 	%r17, %r0, %r25
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60c6039  ! 549: LDUB_I	ldub	[%r17 + 0x0039], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45ce0ea  ! 557: LDX_I	ldx	[%r19 + 0x00ea], %r26
	.word 0x919561b3  ! 559: WRPR_PIL_I	wrpr	%r21, 0x01b3, %pil
	.word 0xf81c0000  ! 560: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xfa4c4000  ! 561: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf44de141  ! 564: LDSB_I	ldsb	[%r23 + 0x0141], %r26
	.word 0xfe142149  ! 565: LDUH_I	lduh	[%r16 + 0x0149], %r31
	.word 0xb550c000  ! 569: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xb4358000  ! 572: SUBC_R	orn 	%r22, %r0, %r26
	.word 0xf64c4000  ! 573: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xb750c000  ! 576: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e93  ! 577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e93, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r23
	.word 0x8594a0a8  ! 583: WRPR_TSTATE_I	wrpr	%r18, 0x00a8, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x8198385b  ! 587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185b, %hpstate
	.word 0xf51c4000  ! 588: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfc540000  ! 591: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf64da058  ! 592: LDSB_I	ldsb	[%r22 + 0x0058], %r27
	.word 0xbab4c000  ! 594: SUBCcc_R	orncc 	%r19, %r0, %r29
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe042154  ! 599: LDUW_I	lduw	[%r16 + 0x0154], %r31
	.word 0xfc5c8000  ! 602: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xfe0da105  ! 603: LDUB_I	ldub	[%r22 + 0x0105], %r31
	.word 0xf455a187  ! 604: LDSH_I	ldsh	[%r22 + 0x0187], %r26
	.word 0xb235a0c9  ! 609: ORN_I	orn 	%r22, 0x00c9, %r25
	.word 0xfe45c000  ! 611: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf20c6108  ! 612: LDUB_I	ldub	[%r17 + 0x0108], %r25
	.word 0xf00420e4  ! 613: LDUW_I	lduw	[%r16 + 0x00e4], %r24
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 615: RDPR_TPC	<illegal instruction>
	.word 0xf85d4000  ! 619: LDX_R	ldx	[%r21 + %r0], %r28
	setx	0x3033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe4da05c  ! 627: LDSB_I	ldsb	[%r22 + 0x005c], %r31
	.word 0xf24da14c  ! 628: LDSB_I	ldsb	[%r22 + 0x014c], %r25
	.word 0xb0244000  ! 629: SUB_R	sub 	%r17, %r0, %r24
	.word 0xfa1da1eb  ! 635: LDD_I	ldd	[%r22 + 0x01eb], %r29
	.word 0xf00ca104  ! 639: LDUB_I	ldub	[%r18 + 0x0104], %r24
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879561d4  ! 648: WRPR_TT_I	wrpr	%r21, 0x01d4, %tt
	mov	1, %r14
	.word 0xa193a000  ! 649: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8144000  ! 650: LDUH_R	lduh	[%r17 + %r0], %r28
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xf045e01c  ! 655: LDSW_I	ldsw	[%r23 + 0x001c], %r24
	.word 0x8d952148  ! 656: WRPR_PSTATE_I	wrpr	%r20, 0x0148, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983953  ! 660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1953, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 663: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xfe55213a  ! 667: LDSH_I	ldsh	[%r20 + 0x013a], %r31
	.word 0xf25c2023  ! 672: LDX_I	ldx	[%r16 + 0x0023], %r25
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5c4000  ! 676: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xfe1ce14d  ! 681: LDD_I	ldd	[%r19 + 0x014d], %r31
	.word 0xbaa50000  ! 682: SUBcc_R	subcc 	%r20, %r0, %r29
	.word 0xbb510000  ! 683: RDPR_TICK	<illegal instruction>
	setx	0x30317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05d8000  ! 694: LDX_R	ldx	[%r22 + %r0], %r24
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794215e  ! 697: WRPR_TT_I	wrpr	%r16, 0x015e, %tt
	.word 0xb9500000  ! 703: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ddb  ! 705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddb, %hpstate
	.word 0xf01de0bd  ! 706: LDD_I	ldd	[%r23 + 0x00bd], %r24
	.word 0xf05da190  ! 707: LDX_I	ldx	[%r22 + 0x0190], %r24
	.word 0xf405e0b6  ! 709: LDUW_I	lduw	[%r23 + 0x00b6], %r26
	.word 0xf4458000  ! 711: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf815e1bf  ! 712: LDUH_I	lduh	[%r23 + 0x01bf], %r28
	.word 0xf01d611a  ! 713: LDD_I	ldd	[%r21 + 0x011a], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf255c000  ! 715: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xbd520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xbf504000  ! 722: RDPR_TNPC	<illegal instruction>
	.word 0xfe4da08e  ! 724: LDSB_I	ldsb	[%r22 + 0x008e], %r31
	mov	0, %r12
	.word 0x8f932000  ! 725: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d942130  ! 726: WRPR_PSTATE_I	wrpr	%r16, 0x0130, %pstate
	.word 0xf21560aa  ! 728: LDUH_I	lduh	[%r21 + 0x00aa], %r25
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204e133  ! 733: LDUW_I	lduw	[%r19 + 0x0133], %r25
	.word 0x879560c8  ! 734: WRPR_TT_I	wrpr	%r21, 0x00c8, %tt
	.word 0xf64c61a8  ! 738: LDSB_I	ldsb	[%r17 + 0x01a8], %r27
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 744: LDSB_R	ldsb	[%r18 + %r0], %r29
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2058000  ! 747: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfb1c6055  ! 751: LDDF_I	ldd	[%r17, 0x0055], %f29
	.word 0xf00c2006  ! 752: LDUB_I	ldub	[%r16 + 0x0006], %r24
	.word 0x8594e19c  ! 753: WRPR_TSTATE_I	wrpr	%r19, 0x019c, %tstate
	.word 0xb7508000  ! 755: RDPR_TSTATE	<illegal instruction>
	.word 0xf44ce1c7  ! 758: LDSB_I	ldsb	[%r19 + 0x01c7], %r26
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 766: RDPR_TNPC	<illegal instruction>
	.word 0xf60da1c2  ! 773: LDUB_I	ldub	[%r22 + 0x01c2], %r27
	.word 0xf24ca1fa  ! 777: LDSB_I	ldsb	[%r18 + 0x01fa], %r25
	.word 0xfe15c000  ! 778: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf44d4000  ! 781: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0x81952151  ! 784: WRPR_TPC_I	wrpr	%r20, 0x0151, %tpc
	.word 0xb0450000  ! 786: ADDC_R	addc 	%r20, %r0, %r24
	.word 0xb92c9000  ! 793: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xb484c000  ! 798: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xf2444000  ! 801: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xb28c4000  ! 802: ANDcc_R	andcc 	%r17, %r0, %r25
	setx	data_start_3, %g1, %r19
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa140000  ! 812: LDUH_R	lduh	[%r16 + %r0], %r29
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 816: RDPR_TL	<illegal instruction>
	.word 0xf414219c  ! 817: LDUH_I	lduh	[%r16 + 0x019c], %r26
	.word 0xf45d604f  ! 818: LDX_I	ldx	[%r21 + 0x004f], %r26
	.word 0xfe5ce0c6  ! 819: LDX_I	ldx	[%r19 + 0x00c6], %r31
	.word 0xf6140000  ! 820: LDUH_R	lduh	[%r16 + %r0], %r27
	mov	2, %r14
	.word 0xa193a000  ! 826: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d94e19e  ! 830: WRPR_PSTATE_I	wrpr	%r19, 0x019e, %pstate
	.word 0x87956154  ! 833: WRPR_TT_I	wrpr	%r21, 0x0154, %tt
	.word 0xb9520000  ! 843: RDPR_PIL	<illegal instruction>
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe55e0d5  ! 846: LDSH_I	ldsh	[%r23 + 0x00d5], %r31
	.word 0xfc042177  ! 849: LDUW_I	lduw	[%r16 + 0x0177], %r30
	.word 0xf6140000  ! 850: LDUH_R	lduh	[%r16 + %r0], %r27
	mov	0, %r12
	.word 0x8f932000  ! 851: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba848000  ! 854: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xfe5d61ef  ! 858: LDX_I	ldx	[%r21 + 0x01ef], %r31
	.word 0xf45c0000  ! 859: LDX_R	ldx	[%r16 + %r0], %r26
	setx	data_start_2, %g1, %r21
	.word 0xfe146110  ! 862: LDUH_I	lduh	[%r17 + 0x0110], %r31
	.word 0xfa152136  ! 869: LDUH_I	lduh	[%r20 + 0x0136], %r29
	.word 0xf31d204f  ! 872: LDDF_I	ldd	[%r20, 0x004f], %f25
	.word 0xb9480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1d0000  ! 879: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xb21da08f  ! 881: XOR_I	xor 	%r22, 0x008f, %r25
	.word 0x8395a163  ! 886: WRPR_TNPC_I	wrpr	%r22, 0x0163, %tnpc
	.word 0xfe4cc000  ! 888: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf11c0000  ! 889: LDDF_R	ldd	[%r16, %r0], %f24
	mov	1, %r14
	.word 0xa193a000  ! 891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5508000  ! 894: RDPR_TSTATE	<illegal instruction>
	.word 0xb5510000  ! 896: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	.word 0xf51d4000  ! 902: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xb8954000  ! 905: ORcc_R	orcc 	%r21, %r0, %r28
	.word 0xbe354000  ! 907: SUBC_R	orn 	%r21, %r0, %r31
	mov	0, %r14
	.word 0xa193a000  ! 908: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a1ad  ! 911: WRPR_PSTATE_I	wrpr	%r22, 0x01ad, %pstate
	.word 0x839460ab  ! 912: WRPR_TNPC_I	wrpr	%r17, 0x00ab, %tnpc
	.word 0x8995a1a8  ! 916: WRPR_TICK_I	wrpr	%r22, 0x01a8, %tick
	.word 0xf00c8000  ! 918: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xfe556091  ! 919: LDSH_I	ldsh	[%r21 + 0x0091], %r31
	.word 0xf05d8000  ! 920: LDX_R	ldx	[%r22 + %r0], %r24
	setx	data_start_2, %g1, %r19
	.word 0xf61c4000  ! 922: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xbb51c000  ! 925: RDPR_TL	rdpr	%tl, %r29
	.word 0xf0554000  ! 926: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0x87956063  ! 928: WRPR_TT_I	wrpr	%r21, 0x0063, %tt
	.word 0xf20d215e  ! 932: LDUB_I	ldub	[%r20 + 0x015e], %r25
	.word 0xb0358000  ! 934: ORN_R	orn 	%r22, %r0, %r24
	.word 0xfa5d60ec  ! 936: LDX_I	ldx	[%r21 + 0x00ec], %r29
	.word 0xb950c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xfa4ca1cf  ! 939: LDSB_I	ldsb	[%r18 + 0x01cf], %r29
	.word 0xfe54e1cf  ! 940: LDSH_I	ldsh	[%r19 + 0x01cf], %r31
	.word 0xb6bc8000  ! 942: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xf00da0ed  ! 948: LDUB_I	ldub	[%r22 + 0x00ed], %r24
	setx	data_start_5, %g1, %r21
	.word 0xbcb54000  ! 958: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xbc8c0000  ! 959: ANDcc_R	andcc 	%r16, %r0, %r30
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5de0b7  ! 966: LDX_I	ldx	[%r23 + 0x00b7], %r31
	.word 0xfc048000  ! 968: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfc0c8000  ! 969: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xb235a110  ! 975: SUBC_I	orn 	%r22, 0x0110, %r25
	.word 0xb2b4c000  ! 983: SUBCcc_R	orncc 	%r19, %r0, %r25
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d60bd  ! 985: LDDF_I	ldd	[%r21, 0x00bd], %f24
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8154000  ! 989: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xfe4d4000  ! 991: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf00d4000  ! 995: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf85c2141  ! 999: LDX_I	ldx	[%r16 + 0x0141], %r28
	.word 0xfe4c0000  ! 1003: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xbd500000  ! 1004: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 1005: RDPR_TSTATE	<illegal instruction>
	.word 0xb6448000  ! 1006: ADDC_R	addc 	%r18, %r0, %r27
	.word 0xfa15e139  ! 1007: LDUH_I	lduh	[%r23 + 0x0139], %r29
	.word 0xfc5d6079  ! 1008: LDX_I	ldx	[%r21 + 0x0079], %r30
	.word 0xfe558000  ! 1011: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xba248000  ! 1012: SUB_R	sub 	%r18, %r0, %r29
	.word 0xb4b520c6  ! 1013: SUBCcc_I	orncc 	%r20, 0x00c6, %r26
	.word 0xf8544000  ! 1014: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xbd518000  ! 1016: RDPR_PSTATE	<illegal instruction>
	.word 0xfa5d4000  ! 1017: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf4058000  ! 1020: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xb3345000  ! 1021: SRLX_R	srlx	%r17, %r0, %r25
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4558000  ! 1027: LDSH_R	ldsh	[%r22 + %r0], %r26
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c4000  ! 1034: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xfa5461e0  ! 1036: LDSH_I	ldsh	[%r17 + 0x01e0], %r29
	.word 0xbe0de163  ! 1037: AND_I	and 	%r23, 0x0163, %r31
	.word 0xf91c8000  ! 1039: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xbf7d2401  ! 1040: MOVR_I	movre	%r20, 0x1, %r31
	.word 0xb424e0a7  ! 1044: SUB_I	sub 	%r19, 0x00a7, %r26
	.word 0xfc14619e  ! 1048: LDUH_I	lduh	[%r17 + 0x019e], %r30
	.word 0x8194e100  ! 1050: WRPR_TPC_I	wrpr	%r19, 0x0100, %tpc
	.word 0x8195a0e2  ! 1051: WRPR_TPC_I	wrpr	%r22, 0x00e2, %tpc
	.word 0xb551c000  ! 1052: RDPR_TL	<illegal instruction>
	.word 0xbc35a0b8  ! 1062: ORN_I	orn 	%r22, 0x00b8, %r30
	.word 0x8994a19a  ! 1068: WRPR_TICK_I	wrpr	%r18, 0x019a, %tick
	.word 0xfa040000  ! 1076: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xf40cc000  ! 1077: LDUB_R	ldub	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xf81461cc  ! 1084: LDUH_I	lduh	[%r17 + 0x01cc], %r28
	.word 0xfe0dc000  ! 1086: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xfc1460a9  ! 1088: LDUH_I	lduh	[%r17 + 0x00a9], %r30
	.word 0xf21c0000  ! 1092: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xfa1d6062  ! 1100: LDD_I	ldd	[%r21 + 0x0062], %r29
	.word 0xfa158000  ! 1101: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf245219b  ! 1102: LDSW_I	ldsw	[%r20 + 0x019b], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 1103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xb150c000  ! 1107: RDPR_TT	<illegal instruction>
	.word 0xf804602a  ! 1117: LDUW_I	lduw	[%r17 + 0x002a], %r28
	.word 0xfa1520ae  ! 1120: LDUH_I	lduh	[%r20 + 0x00ae], %r29
	.word 0xfc544000  ! 1122: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb4b58000  ! 1123: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xbe9dc000  ! 1125: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xf0456118  ! 1126: LDSW_I	ldsw	[%r21 + 0x0118], %r24
	.word 0xf0044000  ! 1129: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xf44c213b  ! 1135: LDSB_I	ldsb	[%r16 + 0x013b], %r26
	.word 0x879461ff  ! 1136: WRPR_TT_I	wrpr	%r17, 0x01ff, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819838db  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18db, %hpstate
	.word 0xf805c000  ! 1144: LDUW_R	lduw	[%r23 + %r0], %r28
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf405a083  ! 1147: LDUW_I	lduw	[%r22 + 0x0083], %r26
	.word 0xf454213a  ! 1148: LDSH_I	ldsh	[%r16 + 0x013a], %r26
	.word 0xfa1ce1a6  ! 1149: LDD_I	ldd	[%r19 + 0x01a6], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9500000  ! 1154: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 1155: RDPR_TT	<illegal instruction>
	.word 0xb32db001  ! 1156: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xbf518000  ! 1160: RDPR_PSTATE	<illegal instruction>
	.word 0xb72ce001  ! 1162: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xfc4dc000  ! 1163: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfa04605f  ! 1166: LDUW_I	lduw	[%r17 + 0x005f], %r29
	.word 0x919521a0  ! 1168: WRPR_PIL_I	wrpr	%r20, 0x01a0, %pil
	setx	data_start_6, %g1, %r16
	.word 0xbc8d0000  ! 1171: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xb08ca152  ! 1173: ANDcc_I	andcc 	%r18, 0x0152, %r24
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6a4a055  ! 1177: SUBcc_I	subcc 	%r18, 0x0055, %r27
	setx	data_start_1, %g1, %r16
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595217b  ! 1190: WRPR_TSTATE_I	wrpr	%r20, 0x017b, %tstate
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5ce035  ! 1193: LDX_I	ldx	[%r19 + 0x0035], %r29
	.word 0xf65da078  ! 1194: LDX_I	ldx	[%r22 + 0x0078], %r27
	mov	0, %r12
	.word 0x8f932000  ! 1199: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7641800  ! 1200: MOVcc_R	<illegal instruction>
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1ce1b5  ! 1207: LDD_I	ldd	[%r19 + 0x01b5], %r31
	.word 0xf04cc000  ! 1210: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xbf504000  ! 1211: RDPR_TNPC	<illegal instruction>
	.word 0xf6044000  ! 1212: LDUW_R	lduw	[%r17 + %r0], %r27
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952055  ! 1216: WRPR_TPC_I	wrpr	%r20, 0x0055, %tpc
	.word 0xb7500000  ! 1217: RDPR_TPC	<illegal instruction>
	.word 0xf655e0b7  ! 1219: LDSH_I	ldsh	[%r23 + 0x00b7], %r27
	.word 0xf51c605d  ! 1220: LDDF_I	ldd	[%r17, 0x005d], %f26
	.word 0xf24c2155  ! 1225: LDSB_I	ldsb	[%r16 + 0x0155], %r25
	.word 0xb950c000  ! 1226: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0adc000  ! 1230: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xf65dc000  ! 1232: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf44c0000  ! 1235: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xfc1c0000  ! 1237: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xbd51c000  ! 1240: RDPR_TL	<illegal instruction>
	.word 0xb5540000  ! 1241: RDPR_GL	<illegal instruction>
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31c4000  ! 1250: LDDF_R	ldd	[%r17, %r0], %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	.word 0xf045a1c9  ! 1253: LDSW_I	ldsw	[%r22 + 0x01c9], %r24
	.word 0xfc150000  ! 1259: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfa0461a2  ! 1260: LDUW_I	lduw	[%r17 + 0x01a2], %r29
	.word 0xfe45e070  ! 1261: LDSW_I	ldsw	[%r23 + 0x0070], %r31
	.word 0x819561ad  ! 1262: WRPR_TPC_I	wrpr	%r21, 0x01ad, %tpc
	.word 0xfc4d4000  ! 1263: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf8148000  ! 1267: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf404c000  ! 1269: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf41c0000  ! 1270: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xfc14e0f7  ! 1271: LDUH_I	lduh	[%r19 + 0x00f7], %r30
	.word 0xf80de143  ! 1276: LDUB_I	ldub	[%r23 + 0x0143], %r28
	setx	data_start_3, %g1, %r19
	.word 0xbd508000  ! 1278: RDPR_TSTATE	<illegal instruction>
	.word 0x89956121  ! 1280: WRPR_TICK_I	wrpr	%r21, 0x0121, %tick
	.word 0xb951c000  ! 1282: RDPR_TL	rdpr	%tl, %r28
	.word 0xbf504000  ! 1283: RDPR_TNPC	<illegal instruction>
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 1286: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfa0d217c  ! 1291: LDUB_I	ldub	[%r20 + 0x017c], %r29
	.word 0xb9480000  ! 1297: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb0c460d1  ! 1300: ADDCcc_I	addccc 	%r17, 0x00d1, %r24
	.word 0xf4458000  ! 1302: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf25d4000  ! 1303: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf25cc000  ! 1305: LDX_R	ldx	[%r19 + %r0], %r25
	setx	data_start_2, %g1, %r22
	.word 0xf80d8000  ! 1311: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf215206e  ! 1312: LDUH_I	lduh	[%r20 + 0x006e], %r25
	.word 0xfe44e00d  ! 1314: LDSW_I	ldsw	[%r19 + 0x000d], %r31
	.word 0xf84d6002  ! 1316: LDSB_I	ldsb	[%r21 + 0x0002], %r28
	.word 0xf6148000  ! 1320: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xb751c000  ! 1321: RDPR_TL	<illegal instruction>
	.word 0xf2142036  ! 1322: LDUH_I	lduh	[%r16 + 0x0036], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 1324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0xf20c4000  ! 1331: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xf31d4000  ! 1333: LDDF_R	ldd	[%r21, %r0], %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb643801  ! 1338: MOVcc_I	<illegal instruction>
	.word 0xfa144000  ! 1340: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf055a023  ! 1345: LDSH_I	ldsh	[%r22 + 0x0023], %r24
	.word 0xf31d0000  ! 1346: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xfb1da07c  ! 1348: LDDF_I	ldd	[%r22, 0x007c], %f29
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf215615f  ! 1352: LDUH_I	lduh	[%r21 + 0x015f], %r25
	.word 0xf014212b  ! 1354: LDUH_I	lduh	[%r16 + 0x012b], %r24
	.word 0xf2458000  ! 1355: LDSW_R	ldsw	[%r22 + %r0], %r25
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2ce128  ! 1362: ANDN_I	andn 	%r19, 0x0128, %r29
	.word 0xfe5dc000  ! 1368: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xfb1da1c5  ! 1369: LDDF_I	ldd	[%r22, 0x01c5], %f29
	.word 0xf91cc000  ! 1374: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0x8194e124  ! 1378: WRPR_TPC_I	wrpr	%r19, 0x0124, %tpc
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c2083  ! 1383: LDUB_I	ldub	[%r16 + 0x0083], %r26
	.word 0xf05d4000  ! 1386: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf0448000  ! 1392: LDSW_R	ldsw	[%r18 + %r0], %r24
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf844c000  ! 1396: LDSW_R	ldsw	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983e93  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e93, %hpstate
	setx	data_start_1, %g1, %r16
	.word 0xf24c20df  ! 1402: LDSB_I	ldsb	[%r16 + 0x00df], %r25
	.word 0xfe458000  ! 1404: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf605a021  ! 1405: LDUW_I	lduw	[%r22 + 0x0021], %r27
	.word 0xfa458000  ! 1406: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf004e075  ! 1407: LDUW_I	lduw	[%r19 + 0x0075], %r24
	.word 0xf05c0000  ! 1409: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xbcbde0eb  ! 1410: XNORcc_I	xnorcc 	%r23, 0x00eb, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa154000  ! 1413: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb61d214a  ! 1414: XOR_I	xor 	%r20, 0x014a, %r27
	.word 0xf40c0000  ! 1415: LDUB_R	ldub	[%r16 + %r0], %r26
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb750c000  ! 1422: RDPR_TT	<illegal instruction>
	.word 0xfc054000  ! 1425: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf41c60dd  ! 1426: LDD_I	ldd	[%r17 + 0x00dd], %r26
	setx	data_start_0, %g1, %r19
	.word 0xf814e0b9  ! 1433: LDUH_I	lduh	[%r19 + 0x00b9], %r28
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8450000  ! 1436: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfd1ce13e  ! 1437: LDDF_I	ldd	[%r19, 0x013e], %f30
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c210f  ! 1439: LDSB_I	ldsb	[%r16 + 0x010f], %r26
	.word 0xff1d21a6  ! 1440: LDDF_I	ldd	[%r20, 0x01a6], %f31
	.word 0x839461c2  ! 1441: WRPR_TNPC_I	wrpr	%r17, 0x01c2, %tnpc
	.word 0xf25ce066  ! 1443: LDX_I	ldx	[%r19 + 0x0066], %r25
	.word 0x8194a12e  ! 1445: WRPR_TPC_I	wrpr	%r18, 0x012e, %tpc
	.word 0xb3500000  ! 1446: RDPR_TPC	<illegal instruction>
	.word 0xba24204e  ! 1447: SUB_I	sub 	%r16, 0x004e, %r29
	.word 0xb5500000  ! 1451: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf40c4000  ! 1452: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf45cc000  ! 1454: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf40d8000  ! 1455: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfa5da1c4  ! 1457: LDX_I	ldx	[%r22 + 0x01c4], %r29
	.word 0xfa1c20be  ! 1460: LDD_I	ldd	[%r16 + 0x00be], %r29
	.word 0xf655e133  ! 1464: LDSH_I	ldsh	[%r23 + 0x0133], %r27
	.word 0xbb518000  ! 1465: RDPR_PSTATE	<illegal instruction>
	.word 0xbb540000  ! 1466: RDPR_GL	<illegal instruction>
	.word 0xb751c000  ! 1469: RDPR_TL	<illegal instruction>
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf814a09c  ! 1475: LDUH_I	lduh	[%r18 + 0x009c], %r28
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 1484: RDPR_GL	<illegal instruction>
	.word 0xf41561d3  ! 1486: LDUH_I	lduh	[%r21 + 0x01d3], %r26
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe45a05a  ! 1488: LDSW_I	ldsw	[%r22 + 0x005a], %r31
	.word 0x819421ab  ! 1489: WRPR_TPC_I	wrpr	%r16, 0x01ab, %tpc
	.word 0xf01d2022  ! 1490: LDD_I	ldd	[%r20 + 0x0022], %r24
	.word 0xfc55c000  ! 1492: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xb5508000  ! 1493: RDPR_TSTATE	<illegal instruction>
	.word 0xf45d4000  ! 1494: LDX_R	ldx	[%r21 + %r0], %r26
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994614c  ! 1498: WRPR_TICK_I	wrpr	%r17, 0x014c, %tick
	.word 0xf405a166  ! 1502: LDUW_I	lduw	[%r22 + 0x0166], %r26
	.word 0x8795216c  ! 1509: WRPR_TT_I	wrpr	%r20, 0x016c, %tt
	.word 0xfa1d8000  ! 1511: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xf405c000  ! 1513: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf8052072  ! 1515: LDUW_I	lduw	[%r20 + 0x0072], %r28
	.word 0x87946088  ! 1516: WRPR_TT_I	wrpr	%r17, 0x0088, %tt
	.word 0xf25d8000  ! 1517: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xfa0dc000  ! 1528: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xfe5cc000  ! 1529: LDX_R	ldx	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xfe4da099  ! 1531: LDSB_I	ldsb	[%r22 + 0x0099], %r31
	.word 0x8595e172  ! 1534: WRPR_TSTATE_I	wrpr	%r23, 0x0172, %tstate
	setx	data_start_3, %g1, %r16
	.word 0xfe1d0000  ! 1537: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xf11da1eb  ! 1541: LDDF_I	ldd	[%r22, 0x01eb], %f24
	.word 0xbebca169  ! 1542: XNORcc_I	xnorcc 	%r18, 0x0169, %r31
	.word 0xf81c8000  ! 1543: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xb3520000  ! 1544: RDPR_PIL	<illegal instruction>
	.word 0xb7540000  ! 1545: RDPR_GL	<illegal instruction>
	.word 0xf0158000  ! 1547: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xbc8de0a1  ! 1548: ANDcc_I	andcc 	%r23, 0x00a1, %r30
	.word 0xbd518000  ! 1549: RDPR_PSTATE	<illegal instruction>
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1551: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a9b  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9b, %hpstate
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xfa5d8000  ! 1562: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xfd1d8000  ! 1569: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfb1d2080  ! 1571: LDDF_I	ldd	[%r20, 0x0080], %f29
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 1576: RDPR_GL	<illegal instruction>
	.word 0xb97ca401  ! 1579: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xbea42078  ! 1580: SUBcc_I	subcc 	%r16, 0x0078, %r31
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1c8000  ! 1588: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xb351c000  ! 1593: RDPR_TL	<illegal instruction>
	.word 0xf11c8000  ! 1594: LDDF_R	ldd	[%r18, %r0], %f24
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04da148  ! 1597: LDSB_I	ldsb	[%r22 + 0x0148], %r24
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94618c  ! 1601: WRPR_PSTATE_I	wrpr	%r17, 0x018c, %pstate
	.word 0xfe4461d4  ! 1602: LDSW_I	ldsw	[%r17 + 0x01d4], %r31
	.word 0xfa44c000  ! 1603: LDSW_R	ldsw	[%r19 + %r0], %r29
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d0000  ! 1612: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf205e1ab  ! 1616: LDUW_I	lduw	[%r23 + 0x01ab], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4450000  ! 1620: LDSW_R	ldsw	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 1622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0xfc0460f7  ! 1624: LDUW_I	lduw	[%r17 + 0x00f7], %r30
	.word 0xfe54e124  ! 1626: LDSH_I	ldsh	[%r19 + 0x0124], %r31
	.word 0xbb510000  ! 1629: RDPR_TICK	<illegal instruction>
	.word 0xb2b4216a  ! 1631: SUBCcc_I	orncc 	%r16, 0x016a, %r25
	.word 0x8d95a09d  ! 1634: WRPR_PSTATE_I	wrpr	%r22, 0x009d, %pstate
	.word 0xfa140000  ! 1635: LDUH_R	lduh	[%r16 + %r0], %r29
	setx	0x30022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0xfe5d60c6  ! 1638: LDX_I	ldx	[%r21 + 0x00c6], %r31
	.word 0xb5510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xf80460c7  ! 1645: LDUW_I	lduw	[%r17 + 0x00c7], %r28
	.word 0xf45c8000  ! 1650: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb151c000  ! 1653: RDPR_TL	<illegal instruction>
	.word 0x879421da  ! 1654: WRPR_TT_I	wrpr	%r16, 0x01da, %tt
	.word 0xf205e051  ! 1655: LDUW_I	lduw	[%r23 + 0x0051], %r25
	setx	data_start_0, %g1, %r20
	.word 0xb1504000  ! 1660: RDPR_TNPC	<illegal instruction>
	.word 0xb3540000  ! 1664: RDPR_GL	<illegal instruction>
	.word 0xf4458000  ! 1672: LDSW_R	ldsw	[%r22 + %r0], %r26
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 1683: RDPR_PIL	<illegal instruction>
	.word 0xb5508000  ! 1684: RDPR_TSTATE	<illegal instruction>
	.word 0xff1c0000  ! 1686: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf2558000  ! 1687: LDSH_R	ldsh	[%r22 + %r0], %r25
	mov	1, %r12
	.word 0x8f932000  ! 1688: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9194e0c3  ! 1689: WRPR_PIL_I	wrpr	%r19, 0x00c3, %pil
	.word 0xf04de132  ! 1690: LDSB_I	ldsb	[%r23 + 0x0132], %r24
	.word 0xf80460fe  ! 1692: LDUW_I	lduw	[%r17 + 0x00fe], %r28
	.word 0xfe448000  ! 1696: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfa04205d  ! 1697: LDUW_I	lduw	[%r16 + 0x005d], %r29
	.word 0xb625e009  ! 1698: SUB_I	sub 	%r23, 0x0009, %r27
	.word 0xbeb521ae  ! 1700: ORNcc_I	orncc 	%r20, 0x01ae, %r31
	setx	data_start_6, %g1, %r22
	.word 0xfa0ce01a  ! 1710: LDUB_I	ldub	[%r19 + 0x001a], %r29
	.word 0xf05dc000  ! 1714: LDX_R	ldx	[%r23 + %r0], %r24
	setx	data_start_6, %g1, %r20
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 1719: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b8b  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	.word 0xb32da001  ! 1723: SLL_I	sll 	%r22, 0x0001, %r25
	setx	data_start_0, %g1, %r16
	.word 0xf2050000  ! 1727: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xf31c8000  ! 1728: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0x8d94a120  ! 1729: WRPR_PSTATE_I	wrpr	%r18, 0x0120, %pstate
	.word 0xf415616e  ! 1731: LDUH_I	lduh	[%r21 + 0x016e], %r26
	setx	data_start_6, %g1, %r21
	.word 0x89952150  ! 1733: WRPR_TICK_I	wrpr	%r20, 0x0150, %tick
	.word 0xb1480000  ! 1735: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_5, %g1, %r23
	.word 0xf11de102  ! 1740: LDDF_I	ldd	[%r23, 0x0102], %f24
	.word 0xb3643801  ! 1741: MOVcc_I	<illegal instruction>
	.word 0xbc0d0000  ! 1745: AND_R	and 	%r20, %r0, %r30
	.word 0xfa150000  ! 1749: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0x8195a105  ! 1750: WRPR_TPC_I	wrpr	%r22, 0x0105, %tpc
	.word 0xf84d8000  ! 1751: LDSB_R	ldsb	[%r22 + %r0], %r28
	setx	0x135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2de001  ! 1761: SLL_I	sll 	%r23, 0x0001, %r31
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4154000  ! 1763: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xf31dc000  ! 1768: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xb2258000  ! 1769: SUB_R	sub 	%r22, %r0, %r25
	.word 0xf24d0000  ! 1770: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xfb1ce040  ! 1771: LDDF_I	ldd	[%r19, 0x0040], %f29
	.word 0xf8152094  ! 1772: LDUH_I	lduh	[%r20 + 0x0094], %r28
	.word 0xfe156190  ! 1779: LDUH_I	lduh	[%r21 + 0x0190], %r31
	.word 0xfa058000  ! 1784: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfa0c8000  ! 1785: LDUB_R	ldub	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf41d0000  ! 1790: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xf4454000  ! 1791: LDSW_R	ldsw	[%r21 + %r0], %r26
	mov	2, %r12
	.word 0x8f932000  ! 1793: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r12
	.word 0x8f932000  ! 1795: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795e10e  ! 1801: WRPR_TT_I	wrpr	%r23, 0x010e, %tt
	.word 0xf6058000  ! 1805: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf04ca053  ! 1806: LDSB_I	ldsb	[%r18 + 0x0053], %r24
	.word 0xf61d4000  ! 1807: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfa1d0000  ! 1808: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xfe4dc000  ! 1810: LDSB_R	ldsb	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983e1b  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1b, %hpstate
	setx	data_start_6, %g1, %r19
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf81c0000  ! 1825: LDD_R	ldd	[%r16 + %r0], %r28
	setx	0x10, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb015600a  ! 1832: OR_I	or 	%r21, 0x000a, %r24
	.word 0xf404e068  ! 1836: LDUW_I	lduw	[%r19 + 0x0068], %r26
	.word 0xf805e1c1  ! 1837: LDUW_I	lduw	[%r23 + 0x01c1], %r28
	.word 0xfe54c000  ! 1841: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf2544000  ! 1843: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0x89942119  ! 1845: WRPR_TICK_I	wrpr	%r16, 0x0119, %tick
	.word 0xbac4e112  ! 1847: ADDCcc_I	addccc 	%r19, 0x0112, %r29
	.word 0xb1520000  ! 1849: RDPR_PIL	<illegal instruction>
	.word 0xf01ce053  ! 1850: LDD_I	ldd	[%r19 + 0x0053], %r24
	.word 0xb2250000  ! 1852: SUB_R	sub 	%r20, %r0, %r25
	.word 0xf044202b  ! 1853: LDSW_I	ldsw	[%r16 + 0x002b], %r24
	.word 0xf45ce061  ! 1858: LDX_I	ldx	[%r19 + 0x0061], %r26
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc54c000  ! 1860: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xb73d6001  ! 1863: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xf4456084  ! 1864: LDSW_I	ldsw	[%r21 + 0x0084], %r26
	.word 0xf205215e  ! 1870: LDUW_I	lduw	[%r20 + 0x015e], %r25
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44d8000  ! 1872: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xbb500000  ! 1873: RDPR_TPC	<illegal instruction>
	.word 0xfe55e000  ! 1874: LDSH_I	ldsh	[%r23 + 0x0000], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0xfe04a050  ! 1881: LDUW_I	lduw	[%r18 + 0x0050], %r31
	.word 0xf215a0f2  ! 1885: LDUH_I	lduh	[%r22 + 0x00f2], %r25
	.word 0xfc4c61c5  ! 1888: LDSB_I	ldsb	[%r17 + 0x01c5], %r30
	mov	0, %r14
	.word 0xa193a000  ! 1892: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8b46191  ! 1895: SUBCcc_I	orncc 	%r17, 0x0191, %r28
	.word 0xf25ca1e9  ! 1897: LDX_I	ldx	[%r18 + 0x01e9], %r25
	.word 0xfe5c21b5  ! 1899: LDX_I	ldx	[%r16 + 0x01b5], %r31
	.word 0xf415c000  ! 1902: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0x8d956048  ! 1908: WRPR_PSTATE_I	wrpr	%r21, 0x0048, %pstate
	.word 0xbf504000  ! 1909: RDPR_TNPC	<illegal instruction>
	.word 0xf444c000  ! 1910: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf4454000  ! 1913: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xfa0cc000  ! 1920: LDUB_R	ldub	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	.word 0xf61da06b  ! 1926: LDD_I	ldd	[%r22 + 0x006b], %r27
	setx	data_start_4, %g1, %r19
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1dc000  ! 1940: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a08b  ! 1945: WRPR_PIL_I	wrpr	%r18, 0x008b, %pil
	setx	data_start_1, %g1, %r21
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204e113  ! 1958: LDUW_I	lduw	[%r19 + 0x0113], %r25
	.word 0xfe5ce1a3  ! 1960: LDX_I	ldx	[%r19 + 0x01a3], %r31
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1963: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95a036  ! 1964: WRPR_PSTATE_I	wrpr	%r22, 0x0036, %pstate
	.word 0xf6148000  ! 1965: LDUH_R	lduh	[%r18 + %r0], %r27
	setx	0x30139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c619c  ! 1969: LDSB_I	ldsb	[%r17 + 0x019c], %r29
	.word 0xf20d4000  ! 1970: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xbf35e001  ! 1971: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xf244a1cc  ! 1973: LDSW_I	ldsw	[%r18 + 0x01cc], %r25
	.word 0x8795e16b  ! 1977: WRPR_TT_I	wrpr	%r23, 0x016b, %tt
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf014c000  ! 1991: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0x8d95a02e  ! 1993: WRPR_PSTATE_I	wrpr	%r22, 0x002e, %pstate
	.word 0xfc14a019  ! 1995: LDUH_I	lduh	[%r18 + 0x0019], %r30
	.word 0xf655e0f8  ! 1997: LDSH_I	ldsh	[%r23 + 0x00f8], %r27
	.word 0xf854a126  ! 2001: LDSH_I	ldsh	[%r18 + 0x0126], %r28
	.word 0xf4450000  ! 2002: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0x839520bc  ! 2003: WRPR_TNPC_I	wrpr	%r20, 0x00bc, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 2010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf45da027  ! 2011: LDX_I	ldx	[%r22 + 0x0027], %r26
	.word 0xbaa4c000  ! 2016: SUBcc_R	subcc 	%r19, %r0, %r29
	.word 0xfc4d2190  ! 2022: LDSB_I	ldsb	[%r20 + 0x0190], %r30
	.word 0xf604c000  ! 2023: LDUW_R	lduw	[%r19 + %r0], %r27
	mov	1, %r14
	.word 0xa193a000  ! 2024: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8948000  ! 2029: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xfe05c000  ! 2035: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf45d0000  ! 2038: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf25da1c2  ! 2039: LDX_I	ldx	[%r22 + 0x01c2], %r25
	.word 0xf205a12d  ! 2041: LDUW_I	lduw	[%r22 + 0x012d], %r25
	.word 0xf0142151  ! 2043: LDUH_I	lduh	[%r16 + 0x0151], %r24
	.word 0xf8150000  ! 2044: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf605e1d1  ! 2046: LDUW_I	lduw	[%r23 + 0x01d1], %r27
	.word 0xb634e15e  ! 2050: SUBC_I	orn 	%r19, 0x015e, %r27
	.word 0xf40c4000  ! 2053: LDUB_R	ldub	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	.word 0x839561d6  ! 2057: WRPR_TNPC_I	wrpr	%r21, 0x01d6, %tnpc
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0xfc0d4000  ! 2066: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0x8395a100  ! 2067: WRPR_TNPC_I	wrpr	%r22, 0x0100, %tnpc
	.word 0xba3d0000  ! 2071: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xf60dc000  ! 2072: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xfc4de0c3  ! 2077: LDSB_I	ldsb	[%r23 + 0x00c3], %r30
	mov	2, %r12
	.word 0x8f932000  ! 2081: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf71ca0e5  ! 2082: LDDF_I	ldd	[%r18, 0x00e5], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	.word 0xf91c0000  ! 2091: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0x8594a070  ! 2093: WRPR_TSTATE_I	wrpr	%r18, 0x0070, %tstate
	.word 0x8194a02e  ! 2097: WRPR_TPC_I	wrpr	%r18, 0x002e, %tpc
	.word 0xf044212a  ! 2100: LDSW_I	ldsw	[%r16 + 0x012a], %r24
	.word 0x8194e1cf  ! 2108: WRPR_TPC_I	wrpr	%r19, 0x01cf, %tpc
	.word 0xb22da199  ! 2112: ANDN_I	andn 	%r22, 0x0199, %r25
	.word 0xb2bda0a4  ! 2117: XNORcc_I	xnorcc 	%r22, 0x00a4, %r25
	.word 0xf31ce162  ! 2118: LDDF_I	ldd	[%r19, 0x0162], %f25
	.word 0xfe54614b  ! 2120: LDSH_I	ldsh	[%r17 + 0x014b], %r31
	.word 0xfc1d8000  ! 2127: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xbb3c2001  ! 2129: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xbd2cb001  ! 2130: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xf04d0000  ! 2131: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf41de1a0  ! 2134: LDD_I	ldd	[%r23 + 0x01a0], %r26
	.word 0xf61d2031  ! 2135: LDD_I	ldd	[%r20 + 0x0031], %r27
	.word 0xf6048000  ! 2136: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb69d4000  ! 2137: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xfa55609d  ! 2140: LDSH_I	ldsh	[%r21 + 0x009d], %r29
	.word 0xf20d0000  ! 2142: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0x8394a120  ! 2148: WRPR_TNPC_I	wrpr	%r18, 0x0120, %tnpc
	.word 0xf6546182  ! 2149: LDSH_I	ldsh	[%r17 + 0x0182], %r27
	.word 0xb9500000  ! 2154: RDPR_TPC	<illegal instruction>
	.word 0xfc0dc000  ! 2155: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf45560a0  ! 2158: LDSH_I	ldsh	[%r21 + 0x00a0], %r26
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	.word 0xb7480000  ! 2168: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d9520ec  ! 2170: WRPR_PSTATE_I	wrpr	%r20, 0x00ec, %pstate
	.word 0xb12c7001  ! 2173: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xf60c4000  ! 2175: LDUB_R	ldub	[%r17 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3504000  ! 2177: RDPR_TNPC	<illegal instruction>
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	.word 0xf81560f1  ! 2182: LDUH_I	lduh	[%r21 + 0x00f1], %r28
	.word 0xbd520000  ! 2184: RDPR_PIL	<illegal instruction>
	.word 0xf00cc000  ! 2190: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0x85952056  ! 2191: WRPR_TSTATE_I	wrpr	%r20, 0x0056, %tstate
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xfa15c000  ! 2199: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xb1504000  ! 2209: RDPR_TNPC	<illegal instruction>
	.word 0xfe448000  ! 2216: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xbcbd6032  ! 2219: XNORcc_I	xnorcc 	%r21, 0x0032, %r30
	.word 0xf005e1b5  ! 2221: LDUW_I	lduw	[%r23 + 0x01b5], %r24
	.word 0xb5504000  ! 2223: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899561de  ! 2227: WRPR_TICK_I	wrpr	%r21, 0x01de, %tick
	.word 0xf64d8000  ! 2228: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xfe550000  ! 2231: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf24d6059  ! 2235: LDSB_I	ldsb	[%r21 + 0x0059], %r25
	.word 0xb7540000  ! 2236: RDPR_GL	<illegal instruction>
	.word 0xf80da1dc  ! 2238: LDUB_I	ldub	[%r22 + 0x01dc], %r28
	.word 0xf6152051  ! 2240: LDUH_I	lduh	[%r20 + 0x0051], %r27
	.word 0xf91d4000  ! 2242: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xf05c8000  ! 2243: LDX_R	ldx	[%r18 + %r0], %r24
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 2248: RDPR_GL	<illegal instruction>
	.word 0xfe54a00a  ! 2249: LDSH_I	ldsh	[%r18 + 0x000a], %r31
	setx	0x227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0x8994609d  ! 2254: WRPR_TICK_I	wrpr	%r17, 0x009d, %tick
	.word 0xfc5de059  ! 2255: LDX_I	ldx	[%r23 + 0x0059], %r30
	.word 0xf25dc000  ! 2260: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xfa444000  ! 2261: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfa15a1b4  ! 2263: LDUH_I	lduh	[%r22 + 0x01b4], %r29
	.word 0xfc0421d6  ! 2269: LDUW_I	lduw	[%r16 + 0x01d6], %r30
	.word 0xb1480000  ! 2272: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf04cc000  ! 2273: LDSB_R	ldsb	[%r19 + %r0], %r24
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2275: RDPR_TPC	<illegal instruction>
	.word 0xfb1d21e4  ! 2281: LDDF_I	ldd	[%r20, 0x01e4], %f29
	.word 0x899460da  ! 2282: WRPR_TICK_I	wrpr	%r17, 0x00da, %tick
	.word 0xfc158000  ! 2283: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfc0d21ad  ! 2284: LDUB_I	ldub	[%r20 + 0x01ad], %r30
	.word 0xfa4d4000  ! 2288: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0x8395a080  ! 2290: WRPR_TNPC_I	wrpr	%r22, 0x0080, %tnpc
	setx	data_start_5, %g1, %r22
	.word 0x8d95617f  ! 2299: WRPR_PSTATE_I	wrpr	%r21, 0x017f, %pstate
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 2308: RDPR_TICK	<illegal instruction>
	.word 0xb7643801  ! 2309: MOVcc_I	<illegal instruction>
	.word 0x8795e026  ! 2312: WRPR_TT_I	wrpr	%r23, 0x0026, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	.word 0xf204a1d0  ! 2315: LDUW_I	lduw	[%r18 + 0x01d0], %r25
	.word 0xfc0c8000  ! 2316: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xb61d8000  ! 2318: XOR_R	xor 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 2319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0xfa0c4000  ! 2325: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xb7520000  ! 2326: RDPR_PIL	<illegal instruction>
	.word 0xf00c4000  ! 2327: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xb551c000  ! 2328: RDPR_TL	<illegal instruction>
	.word 0xfe1c4000  ! 2329: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf0548000  ! 2330: LDSH_R	ldsh	[%r18 + %r0], %r24
	setx	data_start_5, %g1, %r20
	.word 0xff1d4000  ! 2339: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xfc554000  ! 2340: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf0154000  ! 2347: LDUH_R	lduh	[%r21 + %r0], %r24
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2352: RDPR_TNPC	<illegal instruction>
	.word 0xf205c000  ! 2355: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xbd51c000  ! 2357: RDPR_TL	<illegal instruction>
	.word 0xf4046156  ! 2358: LDUW_I	lduw	[%r17 + 0x0156], %r26
	.word 0xfa144000  ! 2362: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf31d21e6  ! 2363: LDDF_I	ldd	[%r20, 0x01e6], %f25
	.word 0xf0158000  ! 2364: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf24d605c  ! 2367: LDSB_I	ldsb	[%r21 + 0x005c], %r25
	.word 0xfe44a1dd  ! 2368: LDSW_I	ldsw	[%r18 + 0x01dd], %r31
	.word 0xb834c000  ! 2372: ORN_R	orn 	%r19, %r0, %r28
	.word 0x899460a8  ! 2375: WRPR_TICK_I	wrpr	%r17, 0x00a8, %tick
	.word 0xf24d8000  ! 2381: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf454a0c9  ! 2382: LDSH_I	ldsh	[%r18 + 0x00c9], %r26
	.word 0x8195a0e5  ! 2386: WRPR_TPC_I	wrpr	%r22, 0x00e5, %tpc
	.word 0xf2552186  ! 2387: LDSH_I	ldsh	[%r20 + 0x0186], %r25
	.word 0xf614c000  ! 2388: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf91d4000  ! 2389: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xf91d0000  ! 2390: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xfa0461b8  ! 2393: LDUW_I	lduw	[%r17 + 0x01b8], %r29
	.word 0xbf500000  ! 2394: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf055e158  ! 2398: LDSH_I	ldsh	[%r23 + 0x0158], %r24
	.word 0xf64ce135  ! 2401: LDSB_I	ldsb	[%r19 + 0x0135], %r27
	.word 0xf80da066  ! 2402: LDUB_I	ldub	[%r22 + 0x0066], %r28
	.word 0xf2558000  ! 2407: LDSH_R	ldsh	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 2413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0x91946170  ! 2415: WRPR_PIL_I	wrpr	%r17, 0x0170, %pil
	setx	data_start_4, %g1, %r22
	.word 0x8995a14a  ! 2418: WRPR_TICK_I	wrpr	%r22, 0x014a, %tick
	.word 0xfd1d8000  ! 2419: LDDF_R	ldd	[%r22, %r0], %f30
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01560f0  ! 2429: LDUH_I	lduh	[%r21 + 0x00f0], %r24
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb89c21e6  ! 2433: XORcc_I	xorcc 	%r16, 0x01e6, %r28
	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1da0c7  ! 2435: LDDF_I	ldd	[%r22, 0x00c7], %f30
	.word 0xb0b56155  ! 2437: SUBCcc_I	orncc 	%r21, 0x0155, %r24
	.word 0x8395a023  ! 2440: WRPR_TNPC_I	wrpr	%r22, 0x0023, %tnpc
	.word 0xbf518000  ! 2441: RDPR_PSTATE	<illegal instruction>
	.word 0x8394611f  ! 2445: WRPR_TNPC_I	wrpr	%r17, 0x011f, %tnpc
	.word 0xbf508000  ! 2447: RDPR_TSTATE	<illegal instruction>
	.word 0xfe15606b  ! 2448: LDUH_I	lduh	[%r21 + 0x006b], %r31
	.word 0xf25cc000  ! 2449: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf80d0000  ! 2450: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfe546162  ! 2452: LDSH_I	ldsh	[%r17 + 0x0162], %r31
	.word 0xb3500000  ! 2454: RDPR_TPC	<illegal instruction>
	.word 0x8995a08c  ! 2457: WRPR_TICK_I	wrpr	%r22, 0x008c, %tick
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2461: RDPR_TPC	<illegal instruction>
	.word 0xf11d4000  ! 2462: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf60cc000  ! 2466: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xff1d0000  ! 2467: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xbe054000  ! 2469: ADD_R	add 	%r21, %r0, %r31
	.word 0xf91de09d  ! 2475: LDDF_I	ldd	[%r23, 0x009d], %f28
	.word 0xfc04216a  ! 2477: LDUW_I	lduw	[%r16 + 0x016a], %r30
	.word 0xfc5cc000  ! 2478: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xb150c000  ! 2480: RDPR_TT	<illegal instruction>
	.word 0xfa1ca04a  ! 2482: LDD_I	ldd	[%r18 + 0x004a], %r29
	.word 0xf41d4000  ! 2484: LDD_R	ldd	[%r21 + %r0], %r26
	setx	data_start_2, %g1, %r22
	.word 0x8995a024  ! 2486: WRPR_TICK_I	wrpr	%r22, 0x0024, %tick
	.word 0xfa04c000  ! 2488: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0xf05ca077  ! 2489: LDX_I	ldx	[%r18 + 0x0077], %r24
	.word 0xf644e09e  ! 2491: LDSW_I	ldsw	[%r19 + 0x009e], %r27
	.word 0x9195e1dd  ! 2492: WRPR_PIL_I	wrpr	%r23, 0x01dd, %pil
	.word 0xf2454000  ! 2493: LDSW_R	ldsw	[%r21 + %r0], %r25
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf445a120  ! 2498: LDSW_I	ldsw	[%r22 + 0x0120], %r26
	.word 0xf91c8000  ! 2500: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xbc44c000  ! 2501: ADDC_R	addc 	%r19, %r0, %r30
	.word 0xf65da17a  ! 2502: LDX_I	ldx	[%r22 + 0x017a], %r27
	.word 0xf8454000  ! 2505: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xfc4460f1  ! 2509: LDSW_I	ldsw	[%r17 + 0x00f1], %r30
	.word 0xfc4de157  ! 2510: LDSB_I	ldsb	[%r23 + 0x0157], %r30
	.word 0xf20de19c  ! 2511: LDUB_I	ldub	[%r23 + 0x019c], %r25
	.word 0xfb1cc000  ! 2517: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0x8795e1fc  ! 2519: WRPR_TT_I	wrpr	%r23, 0x01fc, %tt
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 2522: RDPR_TT	<illegal instruction>
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	.word 0x8195e1de  ! 2533: WRPR_TPC_I	wrpr	%r23, 0x01de, %tpc
	.word 0xba0d217b  ! 2539: AND_I	and 	%r20, 0x017b, %r29
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24d213a  ! 2541: LDSB_I	ldsb	[%r20 + 0x013a], %r25
	.word 0xf255a011  ! 2542: LDSH_I	ldsh	[%r22 + 0x0011], %r25
	.word 0xfa05e0c1  ! 2544: LDUW_I	lduw	[%r23 + 0x00c1], %r29
	.word 0xf44c8000  ! 2545: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0x8594e019  ! 2547: WRPR_TSTATE_I	wrpr	%r19, 0x0019, %tstate
	.word 0xb0b40000  ! 2548: ORNcc_R	orncc 	%r16, %r0, %r24
	.word 0xb8aca0b7  ! 2552: ANDNcc_I	andncc 	%r18, 0x00b7, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982c51  ! 2558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0xf40d21a6  ! 2559: LDUB_I	ldub	[%r20 + 0x01a6], %r26
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24d8000  ! 2563: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xb5504000  ! 2564: RDPR_TNPC	<illegal instruction>
	.word 0xbebc4000  ! 2567: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0x8995a0cc  ! 2568: WRPR_TICK_I	wrpr	%r22, 0x00cc, %tick
	.word 0xbab4e1ac  ! 2569: ORNcc_I	orncc 	%r19, 0x01ac, %r29
	.word 0xfa55602f  ! 2575: LDSH_I	ldsh	[%r21 + 0x002f], %r29
	.word 0x8195a169  ! 2578: WRPR_TPC_I	wrpr	%r22, 0x0169, %tpc
	.word 0xf45d0000  ! 2579: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xbd7c8400  ! 2582: MOVR_R	movre	%r18, %r0, %r30
	.word 0xf91d8000  ! 2583: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf6046060  ! 2584: LDUW_I	lduw	[%r17 + 0x0060], %r27
	mov	0, %r14
	.word 0xa193a000  ! 2586: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31de0a6  ! 2588: LDDF_I	ldd	[%r23, 0x00a6], %f25
	.word 0xfe152033  ! 2590: LDUH_I	lduh	[%r20 + 0x0033], %r31
	.word 0xfa15a009  ! 2593: LDUH_I	lduh	[%r22 + 0x0009], %r29
	.word 0xf414c000  ! 2595: LDUH_R	lduh	[%r19 + %r0], %r26
	mov	0, %r14
	.word 0xa193a000  ! 2596: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4a50000  ! 2603: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xb8c4c000  ! 2606: ADDCcc_R	addccc 	%r19, %r0, %r28
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 2612: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf25461e1  ! 2613: LDSH_I	ldsh	[%r17 + 0x01e1], %r25
	.word 0xf445a1ea  ! 2614: LDSW_I	ldsw	[%r22 + 0x01ea], %r26
	.word 0xb9500000  ! 2615: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2619: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf480000  ! 2620: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x9195a17c  ! 2624: WRPR_PIL_I	wrpr	%r22, 0x017c, %pil
	.word 0xf71c6029  ! 2626: LDDF_I	ldd	[%r17, 0x0029], %f27
	setx	data_start_1, %g1, %r18
	.word 0xbe15c000  ! 2628: OR_R	or 	%r23, %r0, %r31
	.word 0xf845219a  ! 2638: LDSW_I	ldsw	[%r20 + 0x019a], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf41c60c5  ! 2643: LDD_I	ldd	[%r17 + 0x00c5], %r26
	.word 0xbc1d6086  ! 2644: XOR_I	xor 	%r21, 0x0086, %r30
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4c0000  ! 2648: LDSB_R	ldsb	[%r16 + %r0], %r31
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc54c000  ! 2651: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf45dc000  ! 2656: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xb1510000  ! 2658: RDPR_TICK	rdpr	%tick, %r24
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32d0000  ! 2661: SLL_R	sll 	%r20, %r0, %r25
	.word 0xfc54e14d  ! 2664: LDSH_I	ldsh	[%r19 + 0x014d], %r30
	.word 0xbd510000  ! 2668: RDPR_TICK	<illegal instruction>
	.word 0xf8048000  ! 2671: LDUW_R	lduw	[%r18 + %r0], %r28
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 2674: RDPR_GL	<illegal instruction>
	.word 0xfa4de038  ! 2676: LDSB_I	ldsb	[%r23 + 0x0038], %r29
	.word 0xbf520000  ! 2678: RDPR_PIL	<illegal instruction>
	.word 0xbc8cc000  ! 2679: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0xbf520000  ! 2683: RDPR_PIL	<illegal instruction>
	.word 0xb1500000  ! 2690: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0x8795a16f  ! 2701: WRPR_TT_I	wrpr	%r22, 0x016f, %tt
	.word 0xf21c60d5  ! 2706: LDD_I	ldd	[%r17 + 0x00d5], %r25
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe444000  ! 2714: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf604200d  ! 2715: LDUW_I	lduw	[%r16 + 0x000d], %r27
	.word 0xf254a191  ! 2716: LDSH_I	ldsh	[%r18 + 0x0191], %r25
	.word 0xf20da0e8  ! 2717: LDUB_I	ldub	[%r22 + 0x00e8], %r25
	.word 0xf8040000  ! 2718: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0x8795207f  ! 2719: WRPR_TT_I	wrpr	%r20, 0x007f, %tt
	.word 0x81946155  ! 2720: WRPR_TPC_I	wrpr	%r17, 0x0155, %tpc
	mov	0, %r14
	.word 0xa193a000  ! 2723: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa0c8000  ! 2724: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf85c0000  ! 2727: LDX_R	ldx	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 2728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	.word 0xf80de0da  ! 2731: LDUB_I	ldub	[%r23 + 0x00da], %r28
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84da05f  ! 2736: LDSB_I	ldsb	[%r22 + 0x005f], %r28
	.word 0xf24420d3  ! 2738: LDSW_I	ldsw	[%r16 + 0x00d3], %r25
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 2745: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0x85946116  ! 2747: WRPR_TSTATE_I	wrpr	%r17, 0x0116, %tstate
	.word 0xf24c8000  ! 2749: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xf6556151  ! 2750: LDSH_I	ldsh	[%r21 + 0x0151], %r27
	.word 0xbf518000  ! 2753: RDPR_PSTATE	<illegal instruction>
	.word 0xf6554000  ! 2756: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xfc14a125  ! 2757: LDUH_I	lduh	[%r18 + 0x0125], %r30
	.word 0xb950c000  ! 2758: RDPR_TT	<illegal instruction>
	.word 0xf804c000  ! 2759: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xbc35a1f7  ! 2760: SUBC_I	orn 	%r22, 0x01f7, %r30
	.word 0xb1510000  ! 2762: RDPR_TICK	<illegal instruction>
	.word 0x83942050  ! 2764: WRPR_TNPC_I	wrpr	%r16, 0x0050, %tnpc
	.word 0xf444610d  ! 2766: LDSW_I	ldsw	[%r17 + 0x010d], %r26
	.word 0xfe05e10e  ! 2768: LDUW_I	lduw	[%r23 + 0x010e], %r31
	.word 0xb1480000  ! 2770: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf2450000  ! 2772: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xb32de001  ! 2775: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xf05ce03a  ! 2783: LDX_I	ldx	[%r19 + 0x003a], %r24
	mov	2, %r12
	.word 0x8f932000  ! 2784: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x8198384b  ! 2790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184b, %hpstate
	.word 0xb3518000  ! 2794: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf85c4000  ! 2795: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xb4152000  ! 2796: OR_I	or 	%r20, 0x0000, %r26
	.word 0xfe052022  ! 2797: LDUW_I	lduw	[%r20 + 0x0022], %r31
	.word 0xfa150000  ! 2798: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf84cc000  ! 2799: LDSB_R	ldsb	[%r19 + %r0], %r28
	mov	2, %r12
	.word 0x8f932000  ! 2802: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8456178  ! 2804: LDSW_I	ldsw	[%r21 + 0x0178], %r28
	.word 0x91956121  ! 2808: WRPR_PIL_I	wrpr	%r21, 0x0121, %pil
	.word 0x9194e1b3  ! 2813: WRPR_PIL_I	wrpr	%r19, 0x01b3, %pil
	.word 0xb151c000  ! 2815: RDPR_TL	rdpr	%tl, %r24
	.word 0xf4456084  ! 2816: LDSW_I	ldsw	[%r21 + 0x0084], %r26
	setx	data_start_3, %g1, %r19
	.word 0xfa544000  ! 2820: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfe14606b  ! 2821: LDUH_I	lduh	[%r17 + 0x006b], %r31
	.word 0xfb1c21ba  ! 2825: LDDF_I	ldd	[%r16, 0x01ba], %f29
	.word 0xf8046125  ! 2826: LDUW_I	lduw	[%r17 + 0x0125], %r28
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0520e0  ! 2829: LDUW_I	lduw	[%r20 + 0x00e0], %r31
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40ca039  ! 2835: LDUB_I	ldub	[%r18 + 0x0039], %r26
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa15e042  ! 2839: LDUH_I	lduh	[%r23 + 0x0042], %r29
	.word 0xf20c8000  ! 2841: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xb80de06f  ! 2842: AND_I	and 	%r23, 0x006f, %r28
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8d20bd  ! 2844: ANDcc_I	andcc 	%r20, 0x00bd, %r29
	.word 0xf60c216b  ! 2845: LDUB_I	ldub	[%r16 + 0x016b], %r27
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r16
	.word 0xfa1d0000  ! 2855: LDD_R	ldd	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b9b  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9b, %hpstate
	.word 0xf65520f4  ! 2858: LDSH_I	ldsh	[%r20 + 0x00f4], %r27
	.word 0xfc4da057  ! 2862: LDSB_I	ldsb	[%r22 + 0x0057], %r30
	.word 0xf805a1a7  ! 2863: LDUW_I	lduw	[%r22 + 0x01a7], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 2864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	.word 0xfe0d60f8  ! 2865: LDUB_I	ldub	[%r21 + 0x00f8], %r31
	.word 0xf6050000  ! 2869: LDUW_R	lduw	[%r20 + %r0], %r27
	setx	data_start_2, %g1, %r19
	.word 0xfc5d4000  ! 2872: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xf04d8000  ! 2874: LDSB_R	ldsb	[%r22 + %r0], %r24
	setx	data_start_5, %g1, %r20
	.word 0xfc146178  ! 2881: LDUH_I	lduh	[%r17 + 0x0178], %r30
	.word 0xfa5dc000  ! 2882: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xfa1421c4  ! 2883: LDUH_I	lduh	[%r16 + 0x01c4], %r29
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf404e187  ! 2885: LDUW_I	lduw	[%r19 + 0x0187], %r26
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11de09c  ! 2888: LDDF_I	ldd	[%r23, 0x009c], %f24
	.word 0xfa5c0000  ! 2890: LDX_R	ldx	[%r16 + %r0], %r29
	mov	1, %r12
	.word 0x8f932000  ! 2892: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcc5c000  ! 2893: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xfe55203c  ! 2899: LDSH_I	ldsh	[%r20 + 0x003c], %r31
	.word 0xfa5d4000  ! 2901: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf0040000  ! 2902: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xb1540000  ! 2903: RDPR_GL	<illegal instruction>
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65cc000  ! 2905: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xff1c21ff  ! 2908: LDDF_I	ldd	[%r16, 0x01ff], %f31
	.word 0xb1359000  ! 2912: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf04cc000  ! 2918: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf2454000  ! 2921: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0x8995606c  ! 2924: WRPR_TICK_I	wrpr	%r21, 0x006c, %tick
	.word 0xbb2c4000  ! 2926: SLL_R	sll 	%r17, %r0, %r29
	.word 0xf64dc000  ! 2928: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xb1540000  ! 2929: RDPR_GL	<illegal instruction>
	.word 0xbcc58000  ! 2932: ADDCcc_R	addccc 	%r22, %r0, %r30
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855e01d  ! 2936: LDSH_I	ldsh	[%r23 + 0x001d], %r28
	.word 0xb3540000  ! 2939: RDPR_GL	<illegal instruction>
	.word 0xfe44a0bb  ! 2941: LDSW_I	ldsw	[%r18 + 0x00bb], %r31
	mov	1, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9194a0c8  ! 2946: WRPR_PIL_I	wrpr	%r18, 0x00c8, %pil
	.word 0xfa448000  ! 2947: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xbd480000  ! 2950: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfe14211b  ! 2951: LDUH_I	lduh	[%r16 + 0x011b], %r31
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845a155  ! 2954: LDSW_I	ldsw	[%r22 + 0x0155], %r28
	.word 0x8794e11f  ! 2959: WRPR_TT_I	wrpr	%r19, 0x011f, %tt
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01521b9  ! 2962: LDUH_I	lduh	[%r20 + 0x01b9], %r24
	.word 0xbd500000  ! 2964: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 2966: RDPR_TT	<illegal instruction>
	.word 0xb80ca1e9  ! 2968: AND_I	and 	%r18, 0x01e9, %r28
	.word 0xfa5ca101  ! 2971: LDX_I	ldx	[%r18 + 0x0101], %r29
	.word 0xb1643801  ! 2974: MOVcc_I	<illegal instruction>
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1349000  ! 2976: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xbd7d2401  ! 2977: MOVR_I	movre	%r20, 0x1, %r30
	.word 0x8795a08b  ! 2982: WRPR_TT_I	wrpr	%r22, 0x008b, %tt
	.word 0xb3500000  ! 2983: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xfa4ce116  ! 2985: LDSB_I	ldsb	[%r19 + 0x0116], %r29
	.word 0xf85dc000  ! 2988: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf81d0000  ! 2993: LDD_R	ldd	[%r20 + %r0], %r28
	setx	0x1000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395209a  ! 3001: WRPR_TNPC_I	wrpr	%r20, 0x009a, %tnpc
	.word 0xfa54a105  ! 3004: LDSH_I	ldsh	[%r18 + 0x0105], %r29
	.word 0xf64dc000  ! 3005: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf71d0000  ! 3008: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xbb518000  ! 3017: RDPR_PSTATE	<illegal instruction>
	.word 0xb7500000  ! 3019: RDPR_TPC	<illegal instruction>
	.word 0xf24de145  ! 3021: LDSB_I	ldsb	[%r23 + 0x0145], %r25
	.word 0xfa0d20b9  ! 3024: LDUB_I	ldub	[%r20 + 0x00b9], %r29
	.word 0xf61dc000  ! 3030: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xb4158000  ! 3036: OR_R	or 	%r22, %r0, %r26
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3041: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a0b  ! 3043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0xf31c61ff  ! 3045: LDDF_I	ldd	[%r17, 0x01ff], %f25
	.word 0xb751c000  ! 3046: RDPR_TL	<illegal instruction>
	.word 0xfe150000  ! 3048: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0x89942071  ! 3049: WRPR_TICK_I	wrpr	%r16, 0x0071, %tick
	setx	data_start_5, %g1, %r18
	.word 0xfe5c4000  ! 3051: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0x8794a02f  ! 3052: WRPR_TT_I	wrpr	%r18, 0x002f, %tt
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca4e14a  ! 3059: SUBcc_I	subcc 	%r19, 0x014a, %r30
	.word 0xbd500000  ! 3061: RDPR_TPC	<illegal instruction>
	.word 0xb2c58000  ! 3062: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xbd518000  ! 3063: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 3066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0xb351c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xf0448000  ! 3069: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xb12db001  ! 3070: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0xf44da08c  ! 3071: LDSB_I	ldsb	[%r22 + 0x008c], %r26
	.word 0xfe4420c0  ! 3076: LDSW_I	ldsw	[%r16 + 0x00c0], %r31
	.word 0x859461cf  ! 3079: WRPR_TSTATE_I	wrpr	%r17, 0x01cf, %tstate
	.word 0xb1500000  ! 3081: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfa4ca1ed  ! 3083: LDSB_I	ldsb	[%r18 + 0x01ed], %r29
	.word 0x899520a0  ! 3085: WRPR_TICK_I	wrpr	%r20, 0x00a0, %tick
	.word 0xf41ca17c  ! 3089: LDD_I	ldd	[%r18 + 0x017c], %r26
	.word 0xf005c000  ! 3090: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0x8995e075  ! 3095: WRPR_TICK_I	wrpr	%r23, 0x0075, %tick
	.word 0x8795616d  ! 3096: WRPR_TT_I	wrpr	%r21, 0x016d, %tt
	.word 0xfe4d6027  ! 3097: LDSB_I	ldsb	[%r21 + 0x0027], %r31
	setx	data_start_7, %g1, %r16
	.word 0xf0554000  ! 3099: LDSH_R	ldsh	[%r21 + %r0], %r24
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71cc000  ! 3104: LDDF_R	ldd	[%r19, %r0], %f27
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa54c000  ! 3107: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xfd1d4000  ! 3112: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf05cc000  ! 3114: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xfe0c8000  ! 3120: LDUB_R	ldub	[%r18 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 3125: RDPR_TL	<illegal instruction>
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e057  ! 3129: WRPR_TICK_I	wrpr	%r23, 0x0057, %tick
	.word 0xb93cf001  ! 3130: SRAX_I	srax	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982a8b  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51da1e7  ! 3137: LDDF_I	ldd	[%r22, 0x01e7], %f26
	.word 0xb5540000  ! 3138: RDPR_GL	rdpr	%-, %r26
	.word 0xf61461e5  ! 3142: LDUH_I	lduh	[%r17 + 0x01e5], %r27
	.word 0xf41d6169  ! 3144: LDD_I	ldd	[%r21 + 0x0169], %r26
	mov	2, %r12
	.word 0x8f932000  ! 3145: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc5521aa  ! 3147: LDSH_I	ldsh	[%r20 + 0x01aa], %r30
	.word 0xbabd0000  ! 3152: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xf61d6137  ! 3153: LDD_I	ldd	[%r21 + 0x0137], %r27
	.word 0xbeb5a128  ! 3154: SUBCcc_I	orncc 	%r22, 0x0128, %r31
	.word 0xfc5dc000  ! 3156: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf25c21a5  ! 3157: LDX_I	ldx	[%r16 + 0x01a5], %r25
	.word 0xb60c20c2  ! 3159: AND_I	and 	%r16, 0x00c2, %r27
	.word 0xf91da17a  ! 3160: LDDF_I	ldd	[%r22, 0x017a], %f28
	.word 0xfe5d4000  ! 3163: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf20d8000  ! 3165: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf65c0000  ! 3167: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf0440000  ! 3168: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf645e1ac  ! 3169: LDSW_I	ldsw	[%r23 + 0x01ac], %r27
	.word 0xbb520000  ! 3171: RDPR_PIL	<illegal instruction>
	.word 0x8194e0fa  ! 3176: WRPR_TPC_I	wrpr	%r19, 0x00fa, %tpc
	.word 0xfe144000  ! 3177: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0x8d95e053  ! 3178: WRPR_PSTATE_I	wrpr	%r23, 0x0053, %pstate
	.word 0x8395e112  ! 3179: WRPR_TNPC_I	wrpr	%r23, 0x0112, %tnpc
	.word 0xb5510000  ! 3181: RDPR_TICK	<illegal instruction>
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c2105  ! 3183: LDX_I	ldx	[%r16 + 0x0105], %r30
	.word 0xb7540000  ! 3184: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0xfa1d8000  ! 3190: LDD_R	ldd	[%r22 + %r0], %r29
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c8000  ! 3197: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xf31c4000  ! 3199: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xbf508000  ! 3206: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf805e08e  ! 3207: LDUW_I	lduw	[%r23 + 0x008e], %r28
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20521ac  ! 3210: LDUW_I	lduw	[%r20 + 0x01ac], %r25
	.word 0xb1518000  ! 3211: RDPR_PSTATE	<illegal instruction>
	.word 0xf40da01f  ! 3212: LDUB_I	ldub	[%r22 + 0x001f], %r26
	.word 0xf205e094  ! 3214: LDUW_I	lduw	[%r23 + 0x0094], %r25
	.word 0xf81ce145  ! 3215: LDD_I	ldd	[%r19 + 0x0145], %r28
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d0000  ! 3220: LDUB_R	ldub	[%r20 + %r0], %r29
	mov	1, %r14
	.word 0xa193a000  ! 3224: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf414c000  ! 3226: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xf01de03d  ! 3227: LDD_I	ldd	[%r23 + 0x003d], %r24
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc45e086  ! 3236: LDSW_I	ldsw	[%r23 + 0x0086], %r30
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41cc000  ! 3238: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xf00da134  ! 3240: LDUB_I	ldub	[%r22 + 0x0134], %r24
	.word 0xfa15e1ff  ! 3242: LDUH_I	lduh	[%r23 + 0x01ff], %r29
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 3247: RDPR_GL	<illegal instruction>
	.word 0xf4148000  ! 3249: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xb5540000  ! 3252: RDPR_GL	<illegal instruction>
	.word 0xf6150000  ! 3254: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4c619c  ! 3257: LDSB_I	ldsb	[%r17 + 0x019c], %r30
	.word 0xfe5c0000  ! 3259: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xb3518000  ! 3261: RDPR_PSTATE	<illegal instruction>
	.word 0xf31d60d7  ! 3264: LDDF_I	ldd	[%r21, 0x00d7], %f25
	.word 0x8394602b  ! 3266: WRPR_TNPC_I	wrpr	%r17, 0x002b, %tnpc
	.word 0xf655212b  ! 3267: LDSH_I	ldsh	[%r20 + 0x012b], %r27
	.word 0xb1480000  ! 3275: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbb500000  ! 3277: RDPR_TPC	<illegal instruction>
	.word 0x91956094  ! 3278: WRPR_PIL_I	wrpr	%r21, 0x0094, %pil
	.word 0xf6140000  ! 3279: LDUH_R	lduh	[%r16 + %r0], %r27
	setx	data_start_5, %g1, %r23
	.word 0xf214c000  ! 3281: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf40d0000  ! 3283: LDUB_R	ldub	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0x8595a1dc  ! 3286: WRPR_TSTATE_I	wrpr	%r22, 0x01dc, %tstate
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6044000  ! 3289: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0x8394a11a  ! 3291: WRPR_TNPC_I	wrpr	%r18, 0x011a, %tnpc
	.word 0xbd508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xbb510000  ! 3296: RDPR_TICK	<illegal instruction>
	.word 0xfc540000  ! 3298: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfe450000  ! 3300: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xb4340000  ! 3302: ORN_R	orn 	%r16, %r0, %r26
	.word 0x9195e1f6  ! 3306: WRPR_PIL_I	wrpr	%r23, 0x01f6, %pil
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 3314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xb5500000  ! 3315: RDPR_TPC	<illegal instruction>
	.word 0xf40461cd  ! 3316: LDUW_I	lduw	[%r17 + 0x01cd], %r26
	.word 0xbd50c000  ! 3319: RDPR_TT	<illegal instruction>
	.word 0xfa4ce1d6  ! 3323: LDSB_I	ldsb	[%r19 + 0x01d6], %r29
	.word 0xb950c000  ! 3325: RDPR_TT	<illegal instruction>
	.word 0xf71d6139  ! 3326: LDDF_I	ldd	[%r21, 0x0139], %f27
	.word 0xf01c8000  ! 3327: LDD_R	ldd	[%r18 + %r0], %r24
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc558000  ! 3333: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xfe14a139  ! 3340: LDUH_I	lduh	[%r18 + 0x0139], %r31
	.word 0xb150c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 3343: RDPR_TSTATE	<illegal instruction>
	.word 0xbf518000  ! 3352: RDPR_PSTATE	<illegal instruction>
	.word 0xf51d4000  ! 3353: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xbf518000  ! 3356: RDPR_PSTATE	<illegal instruction>
	.word 0xb4058000  ! 3360: ADD_R	add 	%r22, %r0, %r26
	.word 0xfa1d0000  ! 3369: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xbd480000  ! 3376: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf80d4000  ! 3377: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xfa04200c  ! 3378: LDUW_I	lduw	[%r16 + 0x000c], %r29
	.word 0xf05d6173  ! 3386: LDX_I	ldx	[%r21 + 0x0173], %r24
	setx	0x227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1ca164  ! 3390: LDDF_I	ldd	[%r18, 0x0164], %f29
	.word 0xfc544000  ! 3391: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb5341000  ! 3394: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xb5540000  ! 3395: RDPR_GL	<illegal instruction>
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 3407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a0ce  ! 3411: WRPR_TNPC_I	wrpr	%r18, 0x00ce, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 3415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xb3518000  ! 3420: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf45da157  ! 3426: LDX_I	ldx	[%r22 + 0x0157], %r26
	.word 0xb6444000  ! 3428: ADDC_R	addc 	%r17, %r0, %r27
	.word 0xf21d4000  ! 3429: LDD_R	ldd	[%r21 + %r0], %r25
	.word 0xf4154000  ! 3432: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0x919421be  ! 3434: WRPR_PIL_I	wrpr	%r16, 0x01be, %pil
	.word 0x85946099  ! 3435: WRPR_TSTATE_I	wrpr	%r17, 0x0099, %tstate
	.word 0xfa148000  ! 3436: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf91ce060  ! 3438: LDDF_I	ldd	[%r19, 0x0060], %f28
	.word 0xbf480000  ! 3442: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb0ac4000  ! 3443: ANDNcc_R	andncc 	%r17, %r0, %r24
	.word 0xf31da11b  ! 3452: LDDF_I	ldd	[%r22, 0x011b], %f25
	.word 0x8d9521b1  ! 3458: WRPR_PSTATE_I	wrpr	%r20, 0x01b1, %pstate
	.word 0xfc550000  ! 3459: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0x8595e17c  ! 3462: WRPR_TSTATE_I	wrpr	%r23, 0x017c, %tstate
	.word 0xfe0d2157  ! 3464: LDUB_I	ldub	[%r20 + 0x0157], %r31
	.word 0xb8bd8000  ! 3465: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xfe14e010  ! 3466: LDUH_I	lduh	[%r19 + 0x0010], %r31
	.word 0xb61521e6  ! 3467: OR_I	or 	%r20, 0x01e6, %r27
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 3472: RDPR_GL	rdpr	%-, %r30
	.word 0xf61c8000  ! 3477: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xf655c000  ! 3478: LDSH_R	ldsh	[%r23 + %r0], %r27
	mov	1, %r12
	.word 0x8f932000  ! 3479: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf45c21cf  ! 3483: LDX_I	ldx	[%r16 + 0x01cf], %r26
	.word 0xbb480000  ! 3487: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe1561c3  ! 3490: LDUH_I	lduh	[%r21 + 0x01c3], %r31
	.word 0xfa054000  ! 3495: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xb89c0000  ! 3496: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xf64d6150  ! 3498: LDSB_I	ldsb	[%r21 + 0x0150], %r27
	.word 0xf91da1ea  ! 3503: LDDF_I	ldd	[%r22, 0x01ea], %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3518000  ! 3506: RDPR_PSTATE	<illegal instruction>
	.word 0x8194a043  ! 3507: WRPR_TPC_I	wrpr	%r18, 0x0043, %tpc
	.word 0xf6544000  ! 3508: LDSH_R	ldsh	[%r17 + %r0], %r27
	setx	data_start_5, %g1, %r17
	.word 0xf44d0000  ! 3511: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0x8795e03c  ! 3512: WRPR_TT_I	wrpr	%r23, 0x003c, %tt
	.word 0xb93d2001  ! 3516: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0x859521f9  ! 3517: WRPR_TSTATE_I	wrpr	%r20, 0x01f9, %tstate
	.word 0xf004c000  ! 3521: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xfa5c0000  ! 3523: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfa4d60d4  ! 3525: LDSB_I	ldsb	[%r21 + 0x00d4], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe55a0f7  ! 3531: LDSH_I	ldsh	[%r22 + 0x00f7], %r31
	.word 0xf84d600b  ! 3532: LDSB_I	ldsb	[%r21 + 0x000b], %r28
	.word 0xfe0d8000  ! 3536: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xb7510000  ! 3539: RDPR_TICK	<illegal instruction>
	.word 0xf44cc000  ! 3541: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf00c8000  ! 3543: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf41d4000  ! 3544: LDD_R	ldd	[%r21 + %r0], %r26
	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5de0c1  ! 3546: LDX_I	ldx	[%r23 + 0x00c1], %r31
	.word 0xfe0de00e  ! 3548: LDUB_I	ldub	[%r23 + 0x000e], %r31
	.word 0xf04dc000  ! 3549: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf04561de  ! 3552: LDSW_I	ldsw	[%r21 + 0x01de], %r24
	.word 0xb8158000  ! 3553: OR_R	or 	%r22, %r0, %r28
	.word 0xbb3ce001  ! 3557: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xf24ce04a  ! 3558: LDSB_I	ldsb	[%r19 + 0x004a], %r25
	.word 0xfe1da199  ! 3559: LDD_I	ldd	[%r22 + 0x0199], %r31
	.word 0xfd1ca120  ! 3561: LDDF_I	ldd	[%r18, 0x0120], %f30
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a093  ! 3565: WRPR_PIL_I	wrpr	%r18, 0x0093, %pil
	.word 0x8d95e065  ! 3566: WRPR_PSTATE_I	wrpr	%r23, 0x0065, %pstate
	.word 0x89942173  ! 3567: WRPR_TICK_I	wrpr	%r16, 0x0173, %tick
	.word 0xf615215e  ! 3576: LDUH_I	lduh	[%r20 + 0x015e], %r27
	mov	1, %r12
	.word 0x8f932000  ! 3580: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc1de156  ! 3587: XOR_I	xor 	%r23, 0x0156, %r30
	.word 0xb9504000  ! 3588: RDPR_TNPC	<illegal instruction>
	.word 0xf0142073  ! 3591: LDUH_I	lduh	[%r16 + 0x0073], %r24
	.word 0xfb1c8000  ! 3592: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf11c4000  ! 3594: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xbe2c217e  ! 3595: ANDN_I	andn 	%r16, 0x017e, %r31
	.word 0xfc44e051  ! 3596: LDSW_I	ldsw	[%r19 + 0x0051], %r30
	.word 0xbf34b001  ! 3598: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xb02d4000  ! 3601: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xf60d4000  ! 3609: LDUB_R	ldub	[%r21 + %r0], %r27
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1cc000  ! 3616: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xf4148000  ! 3618: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfc540000  ! 3622: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfe54c000  ! 3624: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf84c0000  ! 3625: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb5504000  ! 3635: RDPR_TNPC	<illegal instruction>
	.word 0xbc05e143  ! 3636: ADD_I	add 	%r23, 0x0143, %r30
	.word 0xfc4d4000  ! 3637: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xba454000  ! 3641: ADDC_R	addc 	%r21, %r0, %r29
	.word 0xf844e16c  ! 3642: LDSW_I	ldsw	[%r19 + 0x016c], %r28
	setx	data_start_1, %g1, %r19
	.word 0xfa15e180  ! 3644: LDUH_I	lduh	[%r23 + 0x0180], %r29
	setx	data_start_3, %g1, %r16
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194617b  ! 3649: WRPR_PIL_I	wrpr	%r17, 0x017b, %pil
	.word 0xf4140000  ! 3650: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xbe9d20f6  ! 3653: XORcc_I	xorcc 	%r20, 0x00f6, %r31
	.word 0xb9500000  ! 3654: RDPR_TPC	<illegal instruction>
	.word 0xb43d6012  ! 3657: XNOR_I	xnor 	%r21, 0x0012, %r26
	.word 0xff1da1d7  ! 3658: LDDF_I	ldd	[%r22, 0x01d7], %f31
	.word 0xbb518000  ! 3661: RDPR_PSTATE	<illegal instruction>
	.word 0xfc456133  ! 3663: LDSW_I	ldsw	[%r21 + 0x0133], %r30
	.word 0xf04c4000  ! 3669: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf84c4000  ! 3674: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0x8595a1ee  ! 3675: WRPR_TSTATE_I	wrpr	%r22, 0x01ee, %tstate
	.word 0xf41d0000  ! 3676: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xb0bd0000  ! 3678: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xb63460d7  ! 3679: ORN_I	orn 	%r17, 0x00d7, %r27
	.word 0xfa45c000  ! 3680: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb7510000  ! 3681: RDPR_TICK	<illegal instruction>
	.word 0xf605a17d  ! 3683: LDUW_I	lduw	[%r22 + 0x017d], %r27
	.word 0xb444c000  ! 3684: ADDC_R	addc 	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b03  ! 3687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b03, %hpstate
	.word 0xb1510000  ! 3690: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982903  ! 3692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0903, %hpstate
	setx	data_start_5, %g1, %r19
	.word 0xb49c0000  ! 3695: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xf0158000  ! 3698: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0x8d95e1fe  ! 3699: WRPR_PSTATE_I	wrpr	%r23, 0x01fe, %pstate
	.word 0x819521dc  ! 3702: WRPR_TPC_I	wrpr	%r20, 0x01dc, %tpc
	.word 0xf21d0000  ! 3705: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xfb1cc000  ! 3706: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xfb1cc000  ! 3707: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xbd508000  ! 3708: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 3710: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf205e0d2  ! 3711: LDUW_I	lduw	[%r23 + 0x00d2], %r25
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952016  ! 3714: WRPR_PIL_I	wrpr	%r20, 0x0016, %pil
	.word 0xb7510000  ! 3716: RDPR_TICK	<illegal instruction>
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0c0000  ! 3721: LDUB_R	ldub	[%r16 + %r0], %r31
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 3727: RDPR_TICK	<illegal instruction>
	.word 0xfa0ce196  ! 3731: LDUB_I	ldub	[%r19 + 0x0196], %r29
	.word 0xfe1560e6  ! 3732: LDUH_I	lduh	[%r21 + 0x00e6], %r31
	.word 0xb1643801  ! 3733: MOVcc_I	<illegal instruction>
	.word 0xfd1d200a  ! 3735: LDDF_I	ldd	[%r20, 0x000a], %f30
	.word 0xb9508000  ! 3741: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb6244000  ! 3747: SUB_R	sub 	%r17, %r0, %r27
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51c8000  ! 3751: LDDF_R	ldd	[%r18, %r0], %f26
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2c4000  ! 3755: SLL_R	sll 	%r17, %r0, %r30
	.word 0xbab50000  ! 3757: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xb3520000  ! 3758: RDPR_PIL	<illegal instruction>
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1da10d  ! 3761: LDD_I	ldd	[%r22 + 0x010d], %r31
	.word 0xf445e1d8  ! 3762: LDSW_I	ldsw	[%r23 + 0x01d8], %r26
	.word 0xff1c0000  ! 3767: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf8554000  ! 3771: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfc05a0f4  ! 3772: LDUW_I	lduw	[%r22 + 0x00f4], %r30
	.word 0xfa15a071  ! 3775: LDUH_I	lduh	[%r22 + 0x0071], %r29
	.word 0x8595a067  ! 3776: WRPR_TSTATE_I	wrpr	%r22, 0x0067, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xf245e021  ! 3780: LDSW_I	ldsw	[%r23 + 0x0021], %r25
	.word 0xfc0d0000  ! 3786: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xbd518000  ! 3787: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfe15a0bf  ! 3793: LDUH_I	lduh	[%r22 + 0x00bf], %r31
	mov	2, %r14
	.word 0xa193a000  ! 3795: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc0d0000  ! 3798: LDUB_R	ldub	[%r20 + %r0], %r30
	mov	2, %r14
	.word 0xa193a000  ! 3799: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc1c8000  ! 3801: LDD_R	ldd	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd1c0000  ! 3808: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xf21cc000  ! 3813: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xb951c000  ! 3815: RDPR_TL	<illegal instruction>
	.word 0xf6458000  ! 3819: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xb3480000  ! 3822: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d5b  ! 3826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5b, %hpstate
	.word 0xf41c0000  ! 3831: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf8058000  ! 3832: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xbf508000  ! 3833: RDPR_TSTATE	<illegal instruction>
	.word 0xb9341000  ! 3834: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xbb520000  ! 3837: RDPR_PIL	<illegal instruction>
	.word 0xbf2c8000  ! 3839: SLL_R	sll 	%r18, %r0, %r31
	.word 0xfb1d4000  ! 3840: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf40d6190  ! 3841: LDUB_I	ldub	[%r21 + 0x0190], %r26
	.word 0xf20d8000  ! 3842: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xfa548000  ! 3843: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xbab4e1f8  ! 3845: ORNcc_I	orncc 	%r19, 0x01f8, %r29
	setx	data_start_7, %g1, %r22
	.word 0xb97d6401  ! 3849: MOVR_I	movre	%r21, 0x1, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 3851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xf0448000  ! 3852: LDSW_R	ldsw	[%r18 + %r0], %r24
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e163  ! 3855: WRPR_PSTATE_I	wrpr	%r19, 0x0163, %pstate
	.word 0xb751c000  ! 3857: RDPR_TL	rdpr	%tl, %r27
	.word 0x919561c8  ! 3858: WRPR_PIL_I	wrpr	%r21, 0x01c8, %pil
	.word 0xfe14a0e0  ! 3859: LDUH_I	lduh	[%r18 + 0x00e0], %r31
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d4000  ! 3865: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xfe0c8000  ! 3867: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xbf51c000  ! 3869: RDPR_TL	rdpr	%tl, %r31
	.word 0xb8bc0000  ! 3870: XNORcc_R	xnorcc 	%r16, %r0, %r28
	setx	0x20103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 3876: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xb5520000  ! 3877: RDPR_PIL	<illegal instruction>
	.word 0xf45c8000  ! 3879: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf8158000  ! 3882: LDUH_R	lduh	[%r22 + %r0], %r28
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb35d000  ! 3890: SRLX_R	srlx	%r23, %r0, %r29
	.word 0xb83cc000  ! 3891: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xf05de045  ! 3895: LDX_I	ldx	[%r23 + 0x0045], %r24
	.word 0xfc4d605f  ! 3901: LDSB_I	ldsb	[%r21 + 0x005f], %r30
	.word 0xfe5d8000  ! 3907: LDX_R	ldx	[%r22 + %r0], %r31
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82c8000  ! 3909: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xf65c611a  ! 3910: LDX_I	ldx	[%r17 + 0x011a], %r27
	.word 0xfa14e069  ! 3912: LDUH_I	lduh	[%r19 + 0x0069], %r29
	.word 0xf4450000  ! 3913: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf40cc000  ! 3914: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xf4544000  ! 3916: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfe5d4000  ! 3919: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xff1d60d4  ! 3921: LDDF_I	ldd	[%r21, 0x00d4], %f31
	.word 0xb17cc400  ! 3922: MOVR_R	movre	%r19, %r0, %r24
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4cc000  ! 3925: LDSB_R	ldsb	[%r19 + %r0], %r29
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c8000  ! 3927: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xfa140000  ! 3928: LDUH_R	lduh	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 3929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	.word 0xb3352001  ! 3930: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xfe5ce1b5  ! 3931: LDX_I	ldx	[%r19 + 0x01b5], %r31
	.word 0xbf520000  ! 3932: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 3934: RDPR_TL	<illegal instruction>
	.word 0xfe042108  ! 3935: LDUW_I	lduw	[%r16 + 0x0108], %r31
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 3937: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf24d0000  ! 3940: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xb634c000  ! 3943: SUBC_R	orn 	%r19, %r0, %r27
	.word 0xfc0420f3  ! 3944: LDUW_I	lduw	[%r16 + 0x00f3], %r30
	.word 0xb0bc0000  ! 3947: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xbc2cc000  ! 3959: ANDN_R	andn 	%r19, %r0, %r30
	.word 0x8d94e1ea  ! 3960: WRPR_PSTATE_I	wrpr	%r19, 0x01ea, %pstate
	.word 0xfa5421c1  ! 3962: LDSH_I	ldsh	[%r16 + 0x01c1], %r29
	.word 0x8d94e1f6  ! 3965: WRPR_PSTATE_I	wrpr	%r19, 0x01f6, %pstate
	.word 0xb9504000  ! 3967: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3969: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb351c000  ! 3970: RDPR_TL	<illegal instruction>
	.word 0xbc9d0000  ! 3976: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0xb32dd000  ! 3980: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xbf510000  ! 3981: RDPR_TICK	<illegal instruction>
	.word 0xbd510000  ! 3988: RDPR_TICK	<illegal instruction>
	.word 0x8194e070  ! 3990: WRPR_TPC_I	wrpr	%r19, 0x0070, %tpc
	.word 0xf614e030  ! 3992: LDUH_I	lduh	[%r19 + 0x0030], %r27
	.word 0xf01c0000  ! 3994: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf4458000  ! 3996: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf844617c  ! 3997: LDSW_I	ldsw	[%r17 + 0x017c], %r28
	.word 0xfd1de1fb  ! 4003: LDDF_I	ldd	[%r23, 0x01fb], %f30
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 4011: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf11d4000  ! 4012: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xbf51c000  ! 4013: RDPR_TL	<illegal instruction>
	.word 0xbf540000  ! 4016: RDPR_GL	<illegal instruction>
	.word 0xf64cc000  ! 4022: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfa1da05c  ! 4023: LDD_I	ldd	[%r22 + 0x005c], %r29
	.word 0xf4048000  ! 4026: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xb5540000  ! 4027: RDPR_GL	<illegal instruction>
	.word 0xf8554000  ! 4028: LDSH_R	ldsh	[%r21 + %r0], %r28
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf254c000  ! 4032: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfc55c000  ! 4033: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xfe140000  ! 4040: LDUH_R	lduh	[%r16 + %r0], %r31
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5cc000  ! 4045: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xff1c4000  ! 4051: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf04c0000  ! 4055: LDSB_R	ldsb	[%r16 + %r0], %r24
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c611d  ! 4059: LDX_I	ldx	[%r17 + 0x011d], %r31
	.word 0x8194e024  ! 4060: WRPR_TPC_I	wrpr	%r19, 0x0024, %tpc
	.word 0xfc0c619b  ! 4062: LDUB_I	ldub	[%r17 + 0x019b], %r30
	.word 0xf91c6063  ! 4063: LDDF_I	ldd	[%r17, 0x0063], %f28
	.word 0xf51d0000  ! 4064: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xfc1d2019  ! 4066: LDD_I	ldd	[%r20 + 0x0019], %r30
	.word 0xb1356001  ! 4068: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xbb358000  ! 4069: SRL_R	srl 	%r22, %r0, %r29
	setx	data_start_3, %g1, %r18
	.word 0xf61d4000  ! 4075: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfe4c21e4  ! 4079: LDSB_I	ldsb	[%r16 + 0x01e4], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd50c000  ! 4082: RDPR_TT	<illegal instruction>
	.word 0xf04d4000  ! 4087: LDSB_R	ldsb	[%r21 + %r0], %r24
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 4091: RDPR_TNPC	<illegal instruction>
	.word 0xf65cc000  ! 4093: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf01d6185  ! 4094: LDD_I	ldd	[%r21 + 0x0185], %r24
	.word 0xf04cc000  ! 4097: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xfa4c4000  ! 4098: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xb5480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf51da180  ! 4101: LDDF_I	ldd	[%r22, 0x0180], %f26
	.word 0xb2b42074  ! 4104: SUBCcc_I	orncc 	%r16, 0x0074, %r25
	.word 0xf64cc000  ! 4105: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfa1de009  ! 4107: LDD_I	ldd	[%r23 + 0x0009], %r29
	.word 0xf24520ee  ! 4110: LDSW_I	ldsw	[%r20 + 0x00ee], %r25
	.word 0xbd540000  ! 4112: RDPR_GL	<illegal instruction>
	.word 0xb52dc000  ! 4114: SLL_R	sll 	%r23, %r0, %r26
	.word 0xf11d8000  ! 4115: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xff1d4000  ! 4118: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xfd1c6036  ! 4120: LDDF_I	ldd	[%r17, 0x0036], %f30
	.word 0xf2058000  ! 4121: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf614c000  ! 4122: LDUH_R	lduh	[%r19 + %r0], %r27
	mov	2, %r12
	.word 0x8f932000  ! 4127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf65d8000  ! 4133: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xbf35e001  ! 4134: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xf2548000  ! 4136: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xbe1c8000  ! 4138: XOR_R	xor 	%r18, %r0, %r31
	.word 0xb52da001  ! 4144: SLL_I	sll 	%r22, 0x0001, %r26
	.word 0xf91c0000  ! 4146: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xf4142138  ! 4147: LDUH_I	lduh	[%r16 + 0x0138], %r26
	.word 0xfc1c0000  ! 4151: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xb350c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xfe4c4000  ! 4156: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xb7540000  ! 4159: RDPR_GL	<illegal instruction>
	.word 0x859521b0  ! 4161: WRPR_TSTATE_I	wrpr	%r20, 0x01b0, %tstate
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d2001  ! 4167: LDUB_I	ldub	[%r20 + 0x0001], %r28
	.word 0xb1358000  ! 4168: SRL_R	srl 	%r22, %r0, %r24
	.word 0xbb50c000  ! 4171: RDPR_TT	<illegal instruction>
	.word 0x819461cc  ! 4172: WRPR_TPC_I	wrpr	%r17, 0x01cc, %tpc
	.word 0xf4548000  ! 4173: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf05dc000  ! 4174: LDX_R	ldx	[%r23 + %r0], %r24
	setx	data_start_0, %g1, %r16
	.word 0xf61c0000  ! 4176: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf205e1d8  ! 4179: LDUW_I	lduw	[%r23 + 0x01d8], %r25
	.word 0xbf480000  ! 4180: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8995201f  ! 4184: WRPR_TICK_I	wrpr	%r20, 0x001f, %tick
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5da013  ! 4188: LDX_I	ldx	[%r22 + 0x0013], %r29
	.word 0xfe148000  ! 4189: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xbc1ca09d  ! 4191: XOR_I	xor 	%r18, 0x009d, %r30
	.word 0x8395e030  ! 4198: WRPR_TNPC_I	wrpr	%r23, 0x0030, %tnpc
	.word 0xfa45213e  ! 4199: LDSW_I	ldsw	[%r20 + 0x013e], %r29
	.word 0xf65cc000  ! 4201: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xb49d0000  ! 4202: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xf65c4000  ! 4210: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf604a07d  ! 4211: LDUW_I	lduw	[%r18 + 0x007d], %r27
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4219: RDPR_TPC	<illegal instruction>
	.word 0xbd35d000  ! 4220: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xfe1d8000  ! 4221: LDD_R	ldd	[%r22 + %r0], %r31
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 4226: RDPR_TPC	<illegal instruction>
	.word 0xfe442058  ! 4227: LDSW_I	ldsw	[%r16 + 0x0058], %r31
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xf11d4000  ! 4233: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xb3500000  ! 4236: RDPR_TPC	<illegal instruction>
	.word 0xbd35b001  ! 4238: SRLX_I	srlx	%r22, 0x0001, %r30
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4243: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc5cc000  ! 4244: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xb5508000  ! 4245: RDPR_TSTATE	<illegal instruction>
	.word 0xf254c000  ! 4250: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0x8d94212c  ! 4251: WRPR_PSTATE_I	wrpr	%r16, 0x012c, %pstate
	mov	0, %r12
	.word 0x8f932000  ! 4253: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8bc60b9  ! 4254: XNORcc_I	xnorcc 	%r17, 0x00b9, %r28
	.word 0xbca40000  ! 4255: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xb1518000  ! 4256: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xfa0cc000  ! 4258: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf0452012  ! 4262: LDSW_I	ldsw	[%r20 + 0x0012], %r24
	.word 0xb53d9000  ! 4263: SRAX_R	srax	%r22, %r0, %r26
	.word 0xf84ca09e  ! 4264: LDSB_I	ldsb	[%r18 + 0x009e], %r28
	.word 0xb52ce001  ! 4270: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xf0552077  ! 4271: LDSH_I	ldsh	[%r20 + 0x0077], %r24
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80dc000  ! 4273: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf6440000  ! 4279: LDSW_R	ldsw	[%r16 + %r0], %r27
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8450000  ! 4285: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf01c8000  ! 4287: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xb7520000  ! 4288: RDPR_PIL	<illegal instruction>
	.word 0xbd510000  ! 4292: RDPR_TICK	<illegal instruction>
	.word 0xf0140000  ! 4295: LDUH_R	lduh	[%r16 + %r0], %r24
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1ca1e1  ! 4301: LDDF_I	ldd	[%r18, 0x01e1], %f31
	.word 0xf2440000  ! 4302: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0x8195e08a  ! 4303: WRPR_TPC_I	wrpr	%r23, 0x008a, %tpc
	.word 0xfe542034  ! 4311: LDSH_I	ldsh	[%r16 + 0x0034], %r31
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4c604e  ! 4313: LDSB_I	ldsb	[%r17 + 0x004e], %r31
	.word 0xfc4c200d  ! 4315: LDSB_I	ldsb	[%r16 + 0x000d], %r30
	.word 0xf91c0000  ! 4316: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xf40d0000  ! 4326: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb1343001  ! 4328: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xfe05c000  ! 4332: LDUW_R	lduw	[%r23 + %r0], %r31
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83942037  ! 4340: WRPR_TNPC_I	wrpr	%r16, 0x0037, %tnpc
	.word 0xb9520000  ! 4341: RDPR_PIL	<illegal instruction>
	.word 0x819460b2  ! 4346: WRPR_TPC_I	wrpr	%r17, 0x00b2, %tpc
	.word 0x89952018  ! 4349: WRPR_TICK_I	wrpr	%r20, 0x0018, %tick
	.word 0xf65cc000  ! 4350: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xfa1d8000  ! 4351: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xbd50c000  ! 4352: RDPR_TT	<illegal instruction>
	.word 0x8195a0b6  ! 4354: WRPR_TPC_I	wrpr	%r22, 0x00b6, %tpc
	setx	data_start_1, %g1, %r16
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20ce094  ! 4365: LDUB_I	ldub	[%r19 + 0x0094], %r25
	.word 0xb3480000  ! 4366: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf014e035  ! 4367: LDUH_I	lduh	[%r19 + 0x0035], %r24
	.word 0xf61da149  ! 4368: LDD_I	ldd	[%r22 + 0x0149], %r27
	.word 0xfe4ca158  ! 4370: LDSB_I	ldsb	[%r18 + 0x0158], %r31
	.word 0xf25c0000  ! 4377: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf80d4000  ! 4378: LDUB_R	ldub	[%r21 + %r0], %r28
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d4000  ! 4383: LDD_R	ldd	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x819839cb  ! 4384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19cb, %hpstate
	.word 0xb8b42054  ! 4385: SUBCcc_I	orncc 	%r16, 0x0054, %r28
	.word 0xb8850000  ! 4386: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xb03c0000  ! 4390: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0x9195e097  ! 4392: WRPR_PIL_I	wrpr	%r23, 0x0097, %pil
	.word 0x919561c0  ! 4394: WRPR_PIL_I	wrpr	%r21, 0x01c0, %pil
	.word 0xb83dc000  ! 4397: XNOR_R	xnor 	%r23, %r0, %r28
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ada17b  ! 4399: ANDNcc_I	andncc 	%r22, 0x017b, %r25
	.word 0xf014a11c  ! 4401: LDUH_I	lduh	[%r18 + 0x011c], %r24
	.word 0xfc0d4000  ! 4404: LDUB_R	ldub	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x819838cb  ! 4405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18cb, %hpstate
	.word 0xfa54601f  ! 4407: LDSH_I	ldsh	[%r17 + 0x001f], %r29
	.word 0xf40c0000  ! 4409: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfc4520aa  ! 4412: LDSW_I	ldsw	[%r20 + 0x00aa], %r30
	setx	data_start_2, %g1, %r17
	.word 0xfe14a15f  ! 4418: LDUH_I	lduh	[%r18 + 0x015f], %r31
	setx	data_start_4, %g1, %r16
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879420fe  ! 4428: WRPR_TT_I	wrpr	%r16, 0x00fe, %tt
	.word 0xb605a1a5  ! 4429: ADD_I	add 	%r22, 0x01a5, %r27
	.word 0xfc546104  ! 4430: LDSH_I	ldsh	[%r17 + 0x0104], %r30
	.word 0x8d956064  ! 4432: WRPR_PSTATE_I	wrpr	%r21, 0x0064, %pstate
	.word 0xfa5ca074  ! 4435: LDX_I	ldx	[%r18 + 0x0074], %r29
	.word 0xb844e1e4  ! 4436: ADDC_I	addc 	%r19, 0x01e4, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983d59  ! 4441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d59, %hpstate
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85421b7  ! 4448: LDSH_I	ldsh	[%r16 + 0x01b7], %r28
	.word 0x899460c4  ! 4449: WRPR_TICK_I	wrpr	%r17, 0x00c4, %tick
	.word 0xbab56076  ! 4451: SUBCcc_I	orncc 	%r21, 0x0076, %r29
	.word 0x9195e0eb  ! 4453: WRPR_PIL_I	wrpr	%r23, 0x00eb, %pil
	.word 0xfe5d8000  ! 4456: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xf245e0e9  ! 4460: LDSW_I	ldsw	[%r23 + 0x00e9], %r25
	.word 0xb2bcc000  ! 4463: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xf85cc000  ! 4464: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf405e177  ! 4465: LDUW_I	lduw	[%r23 + 0x0177], %r26
	.word 0xf4556029  ! 4467: LDSH_I	ldsh	[%r21 + 0x0029], %r26
	.word 0xfe044000  ! 4469: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xb951c000  ! 4470: RDPR_TL	<illegal instruction>
	.word 0xf64d21aa  ! 4472: LDSB_I	ldsb	[%r20 + 0x01aa], %r27
	.word 0xfe4c8000  ! 4479: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfe15a013  ! 4480: LDUH_I	lduh	[%r22 + 0x0013], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf71d4000  ! 4482: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xfe054000  ! 4485: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf61d4000  ! 4487: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfc54e115  ! 4488: LDSH_I	ldsh	[%r19 + 0x0115], %r30
	.word 0xfc1d0000  ! 4493: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0x8395606d  ! 4495: WRPR_TNPC_I	wrpr	%r21, 0x006d, %tnpc
	.word 0xf11de00e  ! 4497: LDDF_I	ldd	[%r23, 0x000e], %f24
	.word 0xf25d8000  ! 4500: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xbc150000  ! 4501: OR_R	or 	%r20, %r0, %r30
	.word 0xbc15e0d6  ! 4505: OR_I	or 	%r23, 0x00d6, %r30
	.word 0xbd540000  ! 4506: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4513: RDPR_TT	<illegal instruction>
	setx	0x2001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60dc000  ! 4516: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xb63460c2  ! 4518: SUBC_I	orn 	%r17, 0x00c2, %r27
	.word 0xb33db001  ! 4520: SRAX_I	srax	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0x81956156  ! 4522: WRPR_TPC_I	wrpr	%r21, 0x0156, %tpc
	.word 0xf85c4000  ! 4523: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xfa0c8000  ! 4528: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf2454000  ! 4530: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xb404e0a2  ! 4536: ADD_I	add 	%r19, 0x00a2, %r26
	.word 0xf255a188  ! 4537: LDSH_I	ldsh	[%r22 + 0x0188], %r25
	.word 0xfc0d8000  ! 4538: LDUB_R	ldub	[%r22 + %r0], %r30
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995211b  ! 4541: WRPR_TICK_I	wrpr	%r20, 0x011b, %tick
	.word 0xb1520000  ! 4542: RDPR_PIL	<illegal instruction>
	.word 0x859460d7  ! 4546: WRPR_TSTATE_I	wrpr	%r17, 0x00d7, %tstate
	.word 0xfe5d204c  ! 4547: LDX_I	ldx	[%r20 + 0x004c], %r31
	.word 0xf31de159  ! 4555: LDDF_I	ldd	[%r23, 0x0159], %f25
	.word 0xb02d2037  ! 4559: ANDN_I	andn 	%r20, 0x0037, %r24
	.word 0xfa15a1bc  ! 4560: LDUH_I	lduh	[%r22 + 0x01bc], %r29
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 4564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60d4000  ! 4567: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf25c8000  ! 4568: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf254a119  ! 4570: LDSH_I	ldsh	[%r18 + 0x0119], %r25
	.word 0xf844c000  ! 4571: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf4048000  ! 4573: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xfa550000  ! 4574: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf64c8000  ! 4575: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xfb1d8000  ! 4576: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0x8194a152  ! 4577: WRPR_TPC_I	wrpr	%r18, 0x0152, %tpc
	.word 0xfe0ca0d0  ! 4578: LDUB_I	ldub	[%r18 + 0x00d0], %r31
	.word 0xbd641800  ! 4581: MOVcc_R	<illegal instruction>
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a19b  ! 4584: WRPR_TT_I	wrpr	%r18, 0x019b, %tt
	.word 0xb2852037  ! 4590: ADDcc_I	addcc 	%r20, 0x0037, %r25
	.word 0xf24ce1c4  ! 4591: LDSB_I	ldsb	[%r19 + 0x01c4], %r25
	setx	data_start_7, %g1, %r22
	.word 0xf44da069  ! 4594: LDSB_I	ldsb	[%r22 + 0x0069], %r26
	.word 0xb7518000  ! 4595: RDPR_PSTATE	<illegal instruction>
	.word 0xf31da05c  ! 4597: LDDF_I	ldd	[%r22, 0x005c], %f25
	.word 0xbd500000  ! 4600: RDPR_TPC	<illegal instruction>
	.word 0xb4ac0000  ! 4604: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xf405e077  ! 4607: LDUW_I	lduw	[%r23 + 0x0077], %r26
	.word 0xbf50c000  ! 4611: RDPR_TT	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4612: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbe458000  ! 4614: ADDC_R	addc 	%r22, %r0, %r31
	mov	0, %r12
	.word 0x8f932000  ! 4615: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf60ce132  ! 4616: LDUB_I	ldub	[%r19 + 0x0132], %r27
	.word 0xf00d0000  ! 4617: LDUB_R	ldub	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983d81  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d81, %hpstate
	setx	data_start_7, %g1, %r21
	.word 0xf40c0000  ! 4624: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf01d8000  ! 4627: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf05c2037  ! 4632: LDX_I	ldx	[%r16 + 0x0037], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51c8000  ! 4637: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf24d21d1  ! 4639: LDSB_I	ldsb	[%r20 + 0x01d1], %r25
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4645: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 4648: RDPR_TICK	<illegal instruction>
	.word 0xf40c2151  ! 4649: LDUB_I	ldub	[%r16 + 0x0151], %r26
	.word 0xf91c61d0  ! 4650: LDDF_I	ldd	[%r17, 0x01d0], %f28
	.word 0xf20de025  ! 4651: LDUB_I	ldub	[%r23 + 0x0025], %r25
	.word 0xf00460fd  ! 4652: LDUW_I	lduw	[%r17 + 0x00fd], %r24
	.word 0xf24d0000  ! 4657: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xfa450000  ! 4659: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xfa45c000  ! 4663: LDSW_R	ldsw	[%r23 + %r0], %r29
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454a0ff  ! 4666: LDSH_I	ldsh	[%r18 + 0x00ff], %r26
	.word 0xf6054000  ! 4670: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xbb520000  ! 4672: RDPR_PIL	<illegal instruction>
	.word 0xb424a07f  ! 4675: SUB_I	sub 	%r18, 0x007f, %r26
	.word 0xf51ce0ef  ! 4676: LDDF_I	ldd	[%r19, 0x00ef], %f26
	setx	0x30109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e1d5  ! 4682: WRPR_TNPC_I	wrpr	%r19, 0x01d5, %tnpc
	.word 0xf0140000  ! 4687: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb9504000  ! 4689: RDPR_TNPC	<illegal instruction>
	.word 0xfa558000  ! 4690: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf61d8000  ! 4692: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xf605c000  ! 4693: LDUW_R	lduw	[%r23 + %r0], %r27
	mov	2, %r14
	.word 0xa193a000  ! 4694: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf85ce128  ! 4696: LDX_I	ldx	[%r19 + 0x0128], %r28
	.word 0xb5510000  ! 4698: RDPR_TICK	<illegal instruction>
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6156072  ! 4702: LDUH_I	lduh	[%r21 + 0x0072], %r27
	.word 0xfe04a16c  ! 4703: LDUW_I	lduw	[%r18 + 0x016c], %r31
	.word 0xfe058000  ! 4708: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0x859521e8  ! 4710: WRPR_TSTATE_I	wrpr	%r20, 0x01e8, %tstate
	.word 0xb5540000  ! 4713: RDPR_GL	<illegal instruction>
	.word 0xf84da06a  ! 4715: LDSB_I	ldsb	[%r22 + 0x006a], %r28
	.word 0x8594a040  ! 4717: WRPR_TSTATE_I	wrpr	%r18, 0x0040, %tstate
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba348000  ! 4724: SUBC_R	orn 	%r18, %r0, %r29
	setx	data_start_4, %g1, %r17
	.word 0xbcad4000  ! 4726: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0x8195e0e4  ! 4728: WRPR_TPC_I	wrpr	%r23, 0x00e4, %tpc
	.word 0xb12c6001  ! 4729: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xfa45a0ba  ! 4730: LDSW_I	ldsw	[%r22 + 0x00ba], %r29
	.word 0xf255a1fc  ! 4732: LDSH_I	ldsh	[%r22 + 0x01fc], %r25
	.word 0xf61d4000  ! 4737: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xf91c61c6  ! 4741: LDDF_I	ldd	[%r17, 0x01c6], %f28
	.word 0xfe4c4000  ! 4745: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xfa4c4000  ! 4747: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xb40de034  ! 4748: AND_I	and 	%r23, 0x0034, %r26
	.word 0xf51d8000  ! 4749: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf20da0a8  ! 4750: LDUB_I	ldub	[%r22 + 0x00a8], %r25
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0xb3518000  ! 4754: RDPR_PSTATE	<illegal instruction>
	.word 0x8d9421e2  ! 4755: WRPR_PSTATE_I	wrpr	%r16, 0x01e2, %pstate
	.word 0xf01c8000  ! 4765: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xb20c6120  ! 4768: AND_I	and 	%r17, 0x0120, %r25
	.word 0xf21c4000  ! 4769: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xf11da107  ! 4772: LDDF_I	ldd	[%r22, 0x0107], %f24
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb4ac20fd  ! 4778: ANDNcc_I	andncc 	%r16, 0x00fd, %r26
	.word 0xff1dc000  ! 4780: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xfc4dc000  ! 4784: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xf31c0000  ! 4785: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf45cc000  ! 4789: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf055a148  ! 4791: LDSH_I	ldsh	[%r22 + 0x0148], %r24
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2140000  ! 4793: OR_R	or 	%r16, %r0, %r25
	.word 0xbb510000  ! 4795: RDPR_TICK	<illegal instruction>
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2c1000  ! 4800: SLLX_R	sllx	%r16, %r0, %r31
	.word 0xfa0c212b  ! 4803: LDUB_I	ldub	[%r16 + 0x012b], %r29
	.word 0xb7540000  ! 4805: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 4806: RDPR_TNPC	<illegal instruction>
	.word 0xf80c4000  ! 4807: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xb81c0000  ! 4808: XOR_R	xor 	%r16, %r0, %r28
	.word 0xbb518000  ! 4810: RDPR_PSTATE	<illegal instruction>
	.word 0xf014e13c  ! 4812: LDUH_I	lduh	[%r19 + 0x013c], %r24
	.word 0x8995a0c7  ! 4813: WRPR_TICK_I	wrpr	%r22, 0x00c7, %tick
	.word 0xfc4da1c1  ! 4816: LDSB_I	ldsb	[%r22 + 0x01c1], %r30
	.word 0xfc15c000  ! 4820: LDUH_R	lduh	[%r23 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983f01  ! 4827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f01, %hpstate
	.word 0xfa448000  ! 4832: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xfe0d4000  ! 4836: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf0048000  ! 4837: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xb7510000  ! 4839: RDPR_TICK	<illegal instruction>
	.word 0xfa4ca139  ! 4840: LDSB_I	ldsb	[%r18 + 0x0139], %r29
	.word 0xf41420e9  ! 4841: LDUH_I	lduh	[%r16 + 0x00e9], %r26
	.word 0xf85c8000  ! 4842: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb3480000  ! 4844: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x91952089  ! 4845: WRPR_PIL_I	wrpr	%r20, 0x0089, %pil
	.word 0xfd1c8000  ! 4846: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xb150c000  ! 4850: RDPR_TT	<illegal instruction>
	.word 0xfa04618d  ! 4852: LDUW_I	lduw	[%r17 + 0x018d], %r29
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0c8000  ! 4857: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xfe15e18c  ! 4858: LDUH_I	lduh	[%r23 + 0x018c], %r31
	.word 0xf415e1b6  ! 4862: LDUH_I	lduh	[%r23 + 0x01b6], %r26
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 4868: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbf540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xf31d0000  ! 4877: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xfd1d4000  ! 4880: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf64dc000  ! 4883: LDSB_R	ldsb	[%r23 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983889  ! 4884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1889, %hpstate
	.word 0xf24c60d0  ! 4887: LDSB_I	ldsb	[%r17 + 0x00d0], %r25
	.word 0xf4442120  ! 4890: LDSW_I	ldsw	[%r16 + 0x0120], %r26
	.word 0xb3540000  ! 4893: RDPR_GL	<illegal instruction>
	.word 0xf25dc000  ! 4894: LDX_R	ldx	[%r23 + %r0], %r25
	setx	data_start_2, %g1, %r23
	.word 0xfe4ca157  ! 4897: LDSB_I	ldsb	[%r18 + 0x0157], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e91  ! 4898: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e91, %hpstate
	.word 0xb8bc219e  ! 4899: XNORcc_I	xnorcc 	%r16, 0x019e, %r28
	.word 0xb63da012  ! 4903: XNOR_I	xnor 	%r22, 0x0012, %r27
	.word 0xf604c000  ! 4904: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0x8794a034  ! 4906: WRPR_TT_I	wrpr	%r18, 0x0034, %tt
	.word 0xf84c2164  ! 4909: LDSB_I	ldsb	[%r16 + 0x0164], %r28
	.word 0xf44c61a1  ! 4910: LDSB_I	ldsb	[%r17 + 0x01a1], %r26
	.word 0x859560d9  ! 4911: WRPR_TSTATE_I	wrpr	%r21, 0x00d9, %tstate
	.word 0xf44c60cb  ! 4914: LDSB_I	ldsb	[%r17 + 0x00cb], %r26
	.word 0xfe4ca1ef  ! 4916: LDSB_I	ldsb	[%r18 + 0x01ef], %r31
	.word 0xfa546178  ! 4922: LDSH_I	ldsh	[%r17 + 0x0178], %r29
	.word 0xf215214c  ! 4924: LDUH_I	lduh	[%r20 + 0x014c], %r25
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84c0000  ! 4933: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xfa548000  ! 4935: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf005204f  ! 4940: LDUW_I	lduw	[%r20 + 0x004f], %r24
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3c7001  ! 4945: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xb2946041  ! 4951: ORcc_I	orcc 	%r17, 0x0041, %r25
	.word 0xbb480000  ! 4957: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe5c0000  ! 4964: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0x899560d8  ! 4965: WRPR_TICK_I	wrpr	%r21, 0x00d8, %tick
	.word 0xf91cc000  ! 4973: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xb1480000  ! 4977: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa0dc000  ! 4980: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xf04d0000  ! 4983: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xbd480000  ! 4987: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbab5e1d5  ! 4990: SUBCcc_I	orncc 	%r23, 0x01d5, %r29
	.word 0xf65c0000  ! 4991: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf60dc000  ! 4992: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xb9500000  ! 4993: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 4994: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 4995: RDPR_TSTATE	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbcbce1e7  ! 1: XNORcc_I	xnorcc 	%r19, 0x01e7, %r30
	.word 0x8394e166  ! 4: WRPR_TNPC_I	wrpr	%r19, 0x0166, %tnpc
	.word 0xb0354000  ! 11: SUBC_R	orn 	%r21, %r0, %r24
	.word 0xb5480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5a488c0  ! 16: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xb5abc820  ! 18: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x8795619e  ! 20: WRPR_TT_I	wrpr	%r21, 0x019e, %tt
	setx	data_start_6, %g1, %r21
	.word 0xbda80820  ! 28: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba00020  ! 37: FMOVs	fmovs	%f0, %f29
	.word 0xbabc0000  ! 38: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0x8d95a1e5  ! 45: WRPR_PSTATE_I	wrpr	%r22, 0x01e5, %pstate
	.word 0xb1a40960  ! 46: FMULq	dis not found

	.word 0xb5a80420  ! 51: FMOVRZ	dis not found

	.word 0x9194e1e0  ! 53: WRPR_PIL_I	wrpr	%r19, 0x01e0, %pil
	.word 0x8194209c  ! 57: WRPR_TPC_I	wrpr	%r16, 0x009c, %tpc
	.word 0xb5ab4820  ! 58: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb751c000  ! 62: RDPR_TL	<illegal instruction>
	.word 0xb9a48840  ! 65: FADDd	faddd	%f18, %f0, %f28
	.word 0xb52d0000  ! 68: SLL_R	sll 	%r20, %r0, %r26
	.word 0x9194e194  ! 69: WRPR_PIL_I	wrpr	%r19, 0x0194, %pil
	.word 0x8d9561ad  ! 71: WRPR_PSTATE_I	wrpr	%r21, 0x01ad, %pstate
	.word 0xb9a80820  ! 72: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xb3540000  ! 74: RDPR_GL	<illegal instruction>
	.word 0xb1a58840  ! 77: FADDd	faddd	%f22, %f0, %f24
	.word 0xb1a9c820  ! 78: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81820  ! 81: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9500000  ! 86: RDPR_TPC	<illegal instruction>
	.word 0xb3a81820  ! 88: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0x89946021  ! 92: WRPR_TICK_I	wrpr	%r17, 0x0021, %tick
	.word 0x8d95e102  ! 93: WRPR_PSTATE_I	wrpr	%r23, 0x0102, %pstate
	.word 0xbd480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	2, %r12
	.word 0x8f932000  ! 95: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda80820  ! 97: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba5c9a0  ! 98: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb83d6005  ! 99: XNOR_I	xnor 	%r21, 0x0005, %r28
	.word 0xbd518000  ! 101: RDPR_PSTATE	<illegal instruction>
	.word 0xb5aa8820  ! 103: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a98820  ! 109: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a588e0  ! 115: FSUBq	dis not found

	.word 0xb9a00540  ! 117: FSQRTd	fsqrt	
	.word 0xb83cc000  ! 118: XNOR_R	xnor 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982fc3  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0xbda80820  ! 121: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbd520000  ! 122: RDPR_PIL	<illegal instruction>
	.word 0xb5a00540  ! 126: FSQRTd	fsqrt	
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 134: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r18
	.word 0xbb641800  ! 137: MOVcc_R	<illegal instruction>
	.word 0xb9a00020  ! 138: FMOVs	fmovs	%f0, %f28
	.word 0xbda40920  ! 139: FMULs	fmuls	%f16, %f0, %f30
	.word 0xbbab8820  ! 145: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba549c0  ! 146: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb3aac820  ! 147: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a508c0  ! 148: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbda80820  ! 152: FMOVN	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x8198398b  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 159: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00540  ! 160: FSQRTd	fsqrt	
	.word 0xb1a54860  ! 161: FADDq	dis not found

	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc158000  ! 171: OR_R	or 	%r22, %r0, %r30
	setx	data_start_5, %g1, %r22
	.word 0xb1a40820  ! 178: FADDs	fadds	%f16, %f0, %f24
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 186: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5abc820  ! 192: FMOVVC	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xb7a81c20  ! 195: FMOVRGEZ	dis not found

	.word 0xb41c8000  ! 198: XOR_R	xor 	%r18, %r0, %r26
	.word 0x8794600e  ! 199: WRPR_TT_I	wrpr	%r17, 0x000e, %tt
	.word 0xb5a54940  ! 200: FMULd	fmuld	%f52, %f0, %f26
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23d0000  ! 202: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xbfa58960  ! 206: FMULq	dis not found

	.word 0xbba4c840  ! 207: FADDd	faddd	%f50, %f0, %f60
	.word 0xb535d000  ! 209: SRLX_R	srlx	%r23, %r0, %r26
	.word 0xb7520000  ! 210: RDPR_PIL	<illegal instruction>
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 214: RDPR_GL	<illegal instruction>
	.word 0x8594a1a8  ! 215: WRPR_TSTATE_I	wrpr	%r18, 0x01a8, %tstate
	.word 0xb5ab0820  ! 217: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a4c9c0  ! 222: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb1500000  ! 223: RDPR_TPC	<illegal instruction>
	.word 0xb7a00560  ! 224: FSQRTq	fsqrt	
	.word 0x8994a080  ! 225: WRPR_TICK_I	wrpr	%r18, 0x0080, %tick
	.word 0xb9abc820  ! 226: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbf508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00540  ! 235: FSQRTd	fsqrt	
	.word 0xb9ab8820  ! 237: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a81820  ! 238: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x89946051  ! 239: WRPR_TICK_I	wrpr	%r17, 0x0051, %tick
	.word 0xb7a98820  ! 241: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9643801  ! 242: MOVcc_I	<illegal instruction>
	.word 0xb9a4c9a0  ! 243: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xbba00560  ! 244: FSQRTq	fsqrt	
	setx	data_start_0, %g1, %r23
	.word 0x8194a1e8  ! 261: WRPR_TPC_I	wrpr	%r18, 0x01e8, %tpc
	setx	data_start_5, %g1, %r18
	.word 0xb12d8000  ! 263: SLL_R	sll 	%r22, %r0, %r24
	.word 0xb5aa8820  ! 266: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a509e0  ! 272: FDIVq	dis not found

	.word 0xbd480000  ! 273: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1a548c0  ! 275: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb1a94820  ! 281: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00560  ! 287: FSQRTq	fsqrt	
	.word 0xbe250000  ! 288: SUB_R	sub 	%r20, %r0, %r31
	.word 0xbdaa8820  ! 289: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb7a84820  ! 292: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aa8820  ! 293: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0x899421cc  ! 294: WRPR_TICK_I	wrpr	%r16, 0x01cc, %tick
	.word 0xb151c000  ! 295: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f51  ! 298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f51, %hpstate
	.word 0xb57de401  ! 304: MOVR_I	movre	%r23, 0x1, %r26
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8595e026  ! 312: WRPR_TSTATE_I	wrpr	%r23, 0x0026, %tstate
	.word 0xbf508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a1a8  ! 321: WRPR_TT_I	wrpr	%r22, 0x01a8, %tt
	.word 0xb5a5c8a0  ! 322: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb3a80c20  ! 325: FMOVRLZ	dis not found

	.word 0xb5a44860  ! 326: FADDq	dis not found

	.word 0xb1a90820  ! 331: FMOVLEU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899521fe  ! 336: WRPR_TICK_I	wrpr	%r20, 0x01fe, %tick
	.word 0xb9a8c820  ! 337: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8595e028  ! 338: WRPR_TSTATE_I	wrpr	%r23, 0x0028, %tstate
	setx	data_start_6, %g1, %r17
	.word 0xbfa58940  ! 344: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbba88820  ! 347: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00520  ! 348: FSQRTs	fsqrt	
	.word 0xb3a98820  ! 349: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	data_start_0, %g1, %r19
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xbba408a0  ! 353: FSUBs	fsubs	%f16, %f0, %f29
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3520000  ! 359: RDPR_PIL	<illegal instruction>
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 362: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb8b54000  ! 363: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xb7ab4820  ! 364: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa4820  ! 365: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00560  ! 367: FSQRTq	fsqrt	
	.word 0xb3500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb1518000  ! 370: RDPR_PSTATE	<illegal instruction>
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	.word 0xb9641800  ! 383: MOVcc_R	<illegal instruction>
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8c0  ! 387: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb7a00540  ! 389: FSQRTd	fsqrt	
	.word 0xbfa81420  ! 390: FMOVRNZ	dis not found

	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 397: RDPR_GL	<illegal instruction>
	.word 0xb5a00560  ! 398: FSQRTq	fsqrt	
	setx	data_start_6, %g1, %r16
	.word 0xb9a588a0  ! 402: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb9a50840  ! 404: FADDd	faddd	%f20, %f0, %f28
	.word 0xb9a549c0  ! 405: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xbba4c840  ! 406: FADDd	faddd	%f50, %f0, %f60
	.word 0xb5a00560  ! 407: FSQRTq	fsqrt	
	.word 0xb5500000  ! 409: RDPR_TPC	<illegal instruction>
	.word 0xb9a54860  ! 411: FADDq	dis not found

	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 421: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5aac820  ! 422: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c9e0  ! 426: FDIVq	dis not found

	.word 0x8195a065  ! 428: WRPR_TPC_I	wrpr	%r22, 0x0065, %tpc
	setx	data_start_7, %g1, %r19
	.word 0xbfa80c20  ! 431: FMOVRLZ	dis not found

	.word 0xb9510000  ! 435: RDPR_TICK	<illegal instruction>
	.word 0xb5abc820  ! 436: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbdabc820  ! 439: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa54960  ! 441: FMULq	dis not found

	.word 0xb5a80420  ! 442: FMOVRZ	dis not found

	.word 0xb7a448e0  ! 443: FSUBq	dis not found

	.word 0xba04e00a  ! 444: ADD_I	add 	%r19, 0x000a, %r29
	mov	2, %r14
	.word 0xa193a000  ! 446: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x9194a0f5  ! 449: WRPR_PIL_I	wrpr	%r18, 0x00f5, %pil
	.word 0xbba00540  ! 450: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982bcb  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcb, %hpstate
	.word 0xb7a80820  ! 453: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb835a0fd  ! 456: ORN_I	orn 	%r22, 0x00fd, %r28
	.word 0xbf510000  ! 457: RDPR_TICK	<illegal instruction>
	.word 0xbda81420  ! 461: FMOVRNZ	dis not found

	.word 0xb9a80420  ! 462: FMOVRZ	dis not found

	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 466: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00560  ! 467: FSQRTq	fsqrt	
	.word 0xb1a00040  ! 470: FMOVd	fmovd	%f0, %f24
	.word 0xb3a80420  ! 472: FMOVRZ	dis not found

	.word 0x8795a1d6  ! 473: WRPR_TT_I	wrpr	%r22, 0x01d6, %tt
	.word 0xb7a54860  ! 474: FADDq	dis not found

	.word 0xb7508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xbba58920  ! 478: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb3a48820  ! 482: FADDs	fadds	%f18, %f0, %f25
	.word 0xbfa5c840  ! 484: FADDd	faddd	%f54, %f0, %f62
	.word 0xbd50c000  ! 485: RDPR_TT	<illegal instruction>
	.word 0x89956052  ! 486: WRPR_TICK_I	wrpr	%r21, 0x0052, %tick
	.word 0xbda84820  ! 487: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbe048000  ! 492: ADD_R	add 	%r18, %r0, %r31
	.word 0xb0358000  ! 497: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xbfa48940  ! 498: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb00da0e6  ! 501: AND_I	and 	%r22, 0x00e6, %r24
	.word 0xb5504000  ! 504: RDPR_TNPC	<illegal instruction>
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb805a053  ! 508: ADD_I	add 	%r22, 0x0053, %r28
	.word 0xbd51c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xb1a5c9c0  ! 515: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbf480000  ! 518: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9a589a0  ! 519: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbda409e0  ! 521: FDIVq	dis not found

	.word 0xb235c000  ! 522: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xbfa81420  ! 524: FMOVRNZ	dis not found

	.word 0xb9a5c820  ! 527: FADDs	fadds	%f23, %f0, %f28
	.word 0xb3ab4820  ! 534: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb21461f7  ! 535: OR_I	or 	%r17, 0x01f7, %r25
	.word 0xbda489c0  ! 541: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xbe8d4000  ! 543: ANDcc_R	andcc 	%r21, %r0, %r31
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194a1c2  ! 559: WRPR_PIL_I	wrpr	%r18, 0x01c2, %pil
	.word 0xb9a00520  ! 563: FSQRTs	fsqrt	
	.word 0xbd50c000  ! 569: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xb5a48960  ! 571: FMULq	dis not found

	.word 0xba348000  ! 572: SUBC_R	orn 	%r18, %r0, %r29
	.word 0xbf50c000  ! 576: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198389b  ! 577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189b, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_0, %g1, %r20
	.word 0x85942099  ! 583: WRPR_TSTATE_I	wrpr	%r16, 0x0099, %tstate
	.word 0xbda00540  ! 584: FSQRTd	fsqrt	
	.word 0xb3a4c9a0  ! 585: FDIVs	fdivs	%f19, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982b59  ! 587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	.word 0xb3ab0820  ! 590: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb4b5c000  ! 594: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xb5a80820  ! 595: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a448e0  ! 596: FSUBq	dis not found

	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba58840  ! 600: FADDd	faddd	%f22, %f0, %f60
	.word 0xbda48820  ! 608: FADDs	fadds	%f18, %f0, %f30
	.word 0xb234212e  ! 609: ORN_I	orn 	%r16, 0x012e, %r25
	.word 0xbba00540  ! 610: FSQRTd	fsqrt	
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 615: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c9c0  ! 618: FDIVd	fdivd	%f50, %f0, %f62
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba25c000  ! 629: SUB_R	sub 	%r23, %r0, %r29
	.word 0xb1a00540  ! 634: FSQRTd	fsqrt	
	.word 0xb5a5c8c0  ! 640: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xbda44920  ! 641: FMULs	fmuls	%f17, %f0, %f30
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 647: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x8794e13a  ! 648: WRPR_TT_I	wrpr	%r19, 0x013a, %tt
	mov	0, %r14
	.word 0xa193a000  ! 649: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a90820  ! 651: FMOVLEU	fmovs	%fcc1, %f0, %f27
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	.word 0x8d9421a0  ! 656: WRPR_PSTATE_I	wrpr	%r16, 0x01a0, %pstate
	.word 0xbfa98820  ! 657: FMOVNEG	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0xbba00040  ! 661: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 663: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8c0  ! 674: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb7a81420  ! 675: FMOVRNZ	dis not found

	.word 0xb7a58840  ! 678: FADDd	faddd	%f22, %f0, %f58
	.word 0xb9a40820  ! 679: FADDs	fadds	%f16, %f0, %f28
	.word 0xb1a508a0  ! 680: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb8a58000  ! 682: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xb3510000  ! 683: RDPR_TICK	<illegal instruction>
	.word 0xb9a90820  ! 690: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 695: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879460f7  ! 697: WRPR_TT_I	wrpr	%r17, 0x00f7, %tt
	.word 0xb5a94820  ! 698: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80420  ! 701: FMOVRZ	dis not found

	.word 0xb5a81820  ! 702: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb500000  ! 703: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xb5a54960  ! 708: FMULq	dis not found

	.word 0xb3a00560  ! 710: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a54840  ! 718: FADDd	faddd	%f52, %f0, %f56
	.word 0xb5a81420  ! 719: FMOVRNZ	dis not found

	.word 0xb9a548e0  ! 720: FSUBq	dis not found

	.word 0xb3520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xbd504000  ! 722: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 725: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d94a1a1  ! 726: WRPR_PSTATE_I	wrpr	%r18, 0x01a1, %pstate
	.word 0xb9a409a0  ! 729: FDIVs	fdivs	%f16, %f0, %f28
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a111  ! 734: WRPR_TT_I	wrpr	%r22, 0x0111, %tt
	.word 0xbda5c820  ! 739: FADDs	fadds	%f23, %f0, %f30
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 742: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9aac820  ! 743: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a80c20  ! 745: FMOVRLZ	dis not found

	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba549a0  ! 750: FDIVs	fdivs	%f21, %f0, %f29
	.word 0x8595e0b6  ! 753: WRPR_TSTATE_I	wrpr	%r23, 0x00b6, %tstate
	.word 0xb5508000  ! 755: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a509c0  ! 759: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xbfa00040  ! 760: FMOVd	fmovd	%f0, %f62
	.word 0xbba58960  ! 761: FMULq	dis not found

	.word 0xb5a4c8e0  ! 762: FSUBq	dis not found

	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 766: RDPR_TNPC	<illegal instruction>
	.word 0xb1ab4820  ! 767: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a448a0  ! 770: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xb5a81820  ! 771: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x8194e10b  ! 784: WRPR_TPC_I	wrpr	%r19, 0x010b, %tpc
	.word 0xba440000  ! 786: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xb9a4c9c0  ! 787: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xb1a81c20  ! 790: FMOVRGEZ	dis not found

	.word 0xb5a8c820  ! 792: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbd2c1000  ! 793: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xb5a40920  ! 795: FMULs	fmuls	%f16, %f0, %f26
	.word 0xbfab4820  ! 797: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbe848000  ! 798: ADDcc_R	addcc 	%r18, %r0, %r31
	.word 0xb5aa4820  ! 800: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xba8c8000  ! 802: ANDcc_R	andcc 	%r18, %r0, %r29
	setx	data_start_5, %g1, %r22
	.word 0xb5a44960  ! 807: FMULq	dis not found

	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a509c0  ! 814: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb351c000  ! 816: RDPR_TL	<illegal instruction>
	.word 0xbfa81c20  ! 821: FMOVRGEZ	dis not found

	.word 0xb5a81c20  ! 822: FMOVRGEZ	dis not found

	.word 0xb5ab8820  ! 824: FMOVPOS	fmovs	%fcc1, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 826: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d94e033  ! 830: WRPR_PSTATE_I	wrpr	%r19, 0x0033, %pstate
	.word 0x8794a0ed  ! 833: WRPR_TT_I	wrpr	%r18, 0x00ed, %tt
	.word 0xbba508a0  ! 836: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbda40960  ! 839: FMULq	dis not found

	.word 0xbbaa4820  ! 842: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1520000  ! 843: RDPR_PIL	<illegal instruction>
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 847: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	mov	1, %r12
	.word 0x8f932000  ! 851: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc858000  ! 854: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xb9a80820  ! 855: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1a5c860  ! 857: FADDq	dis not found

	setx	data_start_4, %g1, %r20
	.word 0xb7a00560  ! 863: FSQRTq	fsqrt	
	.word 0xbba80820  ! 867: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48920  ! 868: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb5a88820  ! 871: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 873: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbd480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa449a0  ! 876: FDIVs	fdivs	%f17, %f0, %f31
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 878: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xba1ca020  ! 881: XOR_I	xor 	%r18, 0x0020, %r29
	.word 0xbfa54940  ! 882: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb1a4c9e0  ! 883: FDIVq	dis not found

	.word 0x8394e010  ! 886: WRPR_TNPC_I	wrpr	%r19, 0x0010, %tnpc
	.word 0xbba00540  ! 890: FSQRTd	fsqrt	
	mov	0, %r14
	.word 0xa193a000  ! 891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd508000  ! 894: RDPR_TSTATE	<illegal instruction>
	.word 0xb1aa0820  ! 895: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbf510000  ! 896: RDPR_TICK	<illegal instruction>
	.word 0xb1a81c20  ! 900: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982b11  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b11, %hpstate
	.word 0xba94c000  ! 905: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xb7a409c0  ! 906: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb0350000  ! 907: SUBC_R	orn 	%r20, %r0, %r24
	mov	0, %r14
	.word 0xa193a000  ! 908: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d956058  ! 911: WRPR_PSTATE_I	wrpr	%r21, 0x0058, %pstate
	.word 0x8395e038  ! 912: WRPR_TNPC_I	wrpr	%r23, 0x0038, %tnpc
	.word 0xbfa8c820  ! 913: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x89952002  ! 916: WRPR_TICK_I	wrpr	%r20, 0x0002, %tick
	setx	data_start_2, %g1, %r20
	.word 0xbba408e0  ! 923: FSUBq	dis not found

	.word 0xb551c000  ! 925: RDPR_TL	<illegal instruction>
	.word 0xb7a48860  ! 927: FADDq	dis not found

	.word 0x8795a1fd  ! 928: WRPR_TT_I	wrpr	%r22, 0x01fd, %tt
	.word 0xb234c000  ! 934: ORN_R	orn 	%r19, %r0, %r25
	.word 0xbfa488c0  ! 935: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbfa00540  ! 937: FSQRTd	fsqrt	
	.word 0xb350c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xb6bd4000  ! 942: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xbfa54820  ! 943: FADDs	fadds	%f21, %f0, %f31
	.word 0xb5aa8820  ! 944: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa94820  ! 945: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a408a0  ! 950: FSUBs	fsubs	%f16, %f0, %f25
	setx	data_start_5, %g1, %r16
	.word 0xbfaa0820  ! 954: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb3a88820  ! 956: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00560  ! 957: FSQRTq	fsqrt	
	.word 0xb8b48000  ! 958: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xb68dc000  ! 959: ANDcc_R	andcc 	%r23, %r0, %r27
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9a0  ! 963: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbfa5c860  ! 965: FADDq	dis not found

	.word 0xb1ab0820  ! 967: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb834e1ed  ! 975: SUBC_I	orn 	%r19, 0x01ed, %r28
	.word 0xbba58860  ! 976: FADDq	dis not found

	.word 0xbba80820  ! 977: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfa509c0  ! 978: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb3a589e0  ! 979: FDIVq	dis not found

	.word 0xb4b50000  ! 983: SUBCcc_R	orncc 	%r20, %r0, %r26
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 986: FMOVd	fmovd	%f0, %f60
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c940  ! 990: FMULd	fmuld	%f50, %f0, %f24
	.word 0xbfa509c0  ! 997: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbb500000  ! 1004: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 1005: RDPR_TSTATE	<illegal instruction>
	.word 0xb2454000  ! 1006: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xb5a408c0  ! 1009: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xbe250000  ! 1012: SUB_R	sub 	%r20, %r0, %r31
	.word 0xbcb42103  ! 1013: SUBCcc_I	orncc 	%r16, 0x0103, %r30
	.word 0xb9518000  ! 1016: RDPR_PSTATE	<illegal instruction>
	.word 0xbf349000  ! 1021: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xb7a80820  ! 1022: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb1a40940  ! 1024: FMULd	fmuld	%f16, %f0, %f24
	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba40860  ! 1031: FADDq	dis not found

	.word 0xb7a9c820  ! 1032: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a408a0  ! 1035: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xb80ca1b1  ! 1037: AND_I	and 	%r18, 0x01b1, %r28
	.word 0xb17d2401  ! 1040: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xb1a00520  ! 1043: FSQRTs	fsqrt	
	.word 0xb02560eb  ! 1044: SUB_I	sub 	%r21, 0x00eb, %r24
	.word 0xbda81420  ! 1046: FMOVRNZ	dis not found

	.word 0xb5a489a0  ! 1047: FDIVs	fdivs	%f18, %f0, %f26
	.word 0x81946033  ! 1050: WRPR_TPC_I	wrpr	%r17, 0x0033, %tpc
	.word 0x819420a3  ! 1051: WRPR_TPC_I	wrpr	%r16, 0x00a3, %tpc
	.word 0xbd51c000  ! 1052: RDPR_TL	<illegal instruction>
	.word 0xbba80c20  ! 1054: FMOVRLZ	dis not found

	.word 0xb9a9c820  ! 1056: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a40840  ! 1058: FADDd	faddd	%f16, %f0, %f24
	.word 0xb5a588e0  ! 1059: FSUBq	dis not found

	.word 0xb7a84820  ! 1060: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb5aac820  ! 1061: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb235201a  ! 1062: ORN_I	orn 	%r20, 0x001a, %r25
	.word 0xb5a4c9a0  ! 1063: FDIVs	fdivs	%f19, %f0, %f26
	.word 0x8995606a  ! 1068: WRPR_TICK_I	wrpr	%r21, 0x006a, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	.word 0xb5a548c0  ! 1079: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xbba4c960  ! 1082: FMULq	dis not found

	.word 0xbba50940  ! 1085: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb7a00520  ! 1089: FSQRTs	fsqrt	
	.word 0xb9aac820  ! 1097: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a81820  ! 1099: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982881  ! 1103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0881, %hpstate
	.word 0xb750c000  ! 1107: RDPR_TT	<illegal instruction>
	.word 0xbda508e0  ! 1113: FSUBq	dis not found

	.word 0xb3a00020  ! 1118: FMOVs	fmovs	%f0, %f25
	.word 0xb9a98820  ! 1119: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb2b50000  ! 1123: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xba9c4000  ! 1125: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xb3a44820  ! 1127: FADDs	fadds	%f17, %f0, %f25
	.word 0xbba00540  ! 1132: FSQRTd	fsqrt	
	.word 0xb5a4c8e0  ! 1133: FSUBq	dis not found

	.word 0xb3a408a0  ! 1134: FSUBs	fsubs	%f16, %f0, %f25
	.word 0x879421f4  ! 1136: WRPR_TT_I	wrpr	%r16, 0x01f4, %tt
	.word 0xb3a54920  ! 1138: FMULs	fmuls	%f21, %f0, %f25
	.word 0xbba80820  ! 1139: FMOVN	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982a51  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a51, %hpstate
	.word 0xb9aac820  ! 1141: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a449e0  ! 1143: FDIVq	dis not found

	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa448e0  ! 1152: FSUBq	dis not found

	.word 0xbf500000  ! 1154: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 1155: RDPR_TT	<illegal instruction>
	.word 0xb32db001  ! 1156: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xbbaa8820  ! 1158: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7518000  ! 1160: RDPR_PSTATE	<illegal instruction>
	.word 0xb32da001  ! 1162: SLL_I	sll 	%r22, 0x0001, %r25
	.word 0xb1a80c20  ! 1167: FMOVRLZ	dis not found

	.word 0x9195e069  ! 1168: WRPR_PIL_I	wrpr	%r23, 0x0069, %pil
	setx	data_start_2, %g1, %r18
	.word 0xbc8d4000  ! 1171: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xb68d217b  ! 1173: ANDcc_I	andcc 	%r20, 0x017b, %r27
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0a561e0  ! 1177: SUBcc_I	subcc 	%r21, 0x01e0, %r24
	setx	data_start_5, %g1, %r19
	.word 0xb5a40860  ! 1182: FADDq	dis not found

	.word 0xb5a58960  ! 1183: FMULq	dis not found

	.word 0xb7a80820  ! 1184: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 1188: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 1189: FSQRTd	fsqrt	
	.word 0x8595a1f6  ! 1190: WRPR_TSTATE_I	wrpr	%r22, 0x01f6, %tstate
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 1198: FMOVE	fmovs	%fcc1, %f0, %f24
	mov	1, %r12
	.word 0x8f932000  ! 1199: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9641800  ! 1200: MOVcc_R	<illegal instruction>
	.word 0xbbaa4820  ! 1203: FMOVNE	fmovs	%fcc1, %f0, %f29
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 1208: FSQRTd	fsqrt	
	.word 0xb5504000  ! 1211: RDPR_TNPC	<illegal instruction>
	setx	0x10309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a06c  ! 1216: WRPR_TPC_I	wrpr	%r18, 0x006c, %tpc
	.word 0xb1500000  ! 1217: RDPR_TPC	<illegal instruction>
	.word 0xb5a448a0  ! 1218: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xbbaac820  ! 1222: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda44840  ! 1224: FADDd	faddd	%f48, %f0, %f30
	.word 0xbd50c000  ! 1226: RDPR_TT	<illegal instruction>
	.word 0xb3a4c840  ! 1227: FADDd	faddd	%f50, %f0, %f56
	mov	2, %r12
	.word 0x8f932000  ! 1229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0ad0000  ! 1230: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb5ab4820  ! 1234: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbdab8820  ! 1236: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb951c000  ! 1240: RDPR_TL	<illegal instruction>
	.word 0xbf540000  ! 1241: RDPR_GL	<illegal instruction>
	.word 0xb7a80c20  ! 1242: FMOVRLZ	dis not found

	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48960  ! 1249: FMULq	dis not found

	.word 0xbba00540  ! 1251: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982c49  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0xb3a44860  ! 1255: FADDq	dis not found

	.word 0xb7a509c0  ! 1256: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xbfa58960  ! 1258: FMULq	dis not found

	.word 0x819561f6  ! 1262: WRPR_TPC_I	wrpr	%r21, 0x01f6, %tpc
	.word 0xbfab0820  ! 1265: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a94820  ! 1268: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbba84820  ! 1275: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	data_start_0, %g1, %r21
	.word 0xb7508000  ! 1278: RDPR_TSTATE	<illegal instruction>
	.word 0x8995e1fe  ! 1280: WRPR_TICK_I	wrpr	%r23, 0x01fe, %tick
	.word 0xb351c000  ! 1282: RDPR_TL	<illegal instruction>
	.word 0xb1504000  ! 1283: RDPR_TNPC	<illegal instruction>
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 1295: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7480000  ! 1297: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9a81c20  ! 1299: FMOVRGEZ	dis not found

	.word 0xbac52101  ! 1300: ADDCcc_I	addccc 	%r20, 0x0101, %r29
	setx	data_start_5, %g1, %r23
	.word 0xb7ab0820  ! 1318: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb151c000  ! 1321: RDPR_TL	<illegal instruction>
	.word 0xbfa408e0  ! 1323: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 1324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0xbbaa8820  ! 1330: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a40860  ! 1332: FADDq	dis not found

	.word 0xbda5c8a0  ! 1334: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb7a94820  ! 1335: FMOVCS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9643801  ! 1338: MOVcc_I	<illegal instruction>
	.word 0xb5a58940  ! 1339: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb5a409a0  ! 1343: FDIVs	fdivs	%f16, %f0, %f26
	.word 0xb3a5c9e0  ! 1344: FDIVq	dis not found

	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 1356: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab0820  ! 1358: FMOVGU	fmovs	%fcc1, %f0, %f25
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82ce014  ! 1362: ANDN_I	andn 	%r19, 0x0014, %r28
	.word 0xbba81820  ! 1371: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x8194e12c  ! 1378: WRPR_TPC_I	wrpr	%r19, 0x012c, %tpc
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 1382: FMOVs	fmovs	%f0, %f24
	.word 0xb5a4c840  ! 1389: FADDd	faddd	%f50, %f0, %f26
	.word 0xb1a80820  ! 1390: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 1397: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983a89  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a89, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xbba449e0  ! 1408: FDIVq	dis not found

	.word 0xbcbd21ab  ! 1410: XNORcc_I	xnorcc 	%r20, 0x01ab, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc1c21a6  ! 1414: XOR_I	xor 	%r16, 0x01a6, %r30
	.word 0xb7aa0820  ! 1417: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	.word 0xb550c000  ! 1422: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r23
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946006  ! 1441: WRPR_TNPC_I	wrpr	%r17, 0x0006, %tnpc
	.word 0xb1a488e0  ! 1442: FSUBq	dis not found

	.word 0x8195e058  ! 1445: WRPR_TPC_I	wrpr	%r23, 0x0058, %tpc
	.word 0xb9500000  ! 1446: RDPR_TPC	<illegal instruction>
	.word 0xb025e006  ! 1447: SUB_I	sub 	%r23, 0x0006, %r24
	.word 0xb7500000  ! 1451: RDPR_TPC	<illegal instruction>
	.word 0xb7a00040  ! 1462: FMOVd	fmovd	%f0, %f58
	.word 0xb3a4c820  ! 1463: FADDs	fadds	%f19, %f0, %f25
	.word 0xbd518000  ! 1465: RDPR_PSTATE	<illegal instruction>
	.word 0xb9540000  ! 1466: RDPR_GL	<illegal instruction>
	.word 0xbf51c000  ! 1469: RDPR_TL	<illegal instruction>
	.word 0xbfa58940  ! 1470: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb1a80c20  ! 1472: FMOVRLZ	dis not found

	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a48820  ! 1474: FADDs	fadds	%f18, %f0, %f24
	.word 0xb5a84820  ! 1477: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c8e0  ! 1478: FSUBq	dis not found

	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a44820  ! 1483: FADDs	fadds	%f17, %f0, %f28
	.word 0xbf540000  ! 1484: RDPR_GL	<illegal instruction>
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a0ad  ! 1489: WRPR_TPC_I	wrpr	%r22, 0x00ad, %tpc
	.word 0xb3508000  ! 1493: RDPR_TSTATE	<illegal instruction>
	setx	0x30109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 1496: FADDd	faddd	%f18, %f0, %f28
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994209c  ! 1498: WRPR_TICK_I	wrpr	%r16, 0x009c, %tick
	.word 0xbba8c820  ! 1500: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80820  ! 1503: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0x8795a00f  ! 1509: WRPR_TT_I	wrpr	%r22, 0x000f, %tt
	.word 0xbda5c840  ! 1510: FADDd	faddd	%f54, %f0, %f30
	.word 0xb9a40860  ! 1514: FADDq	dis not found

	.word 0x879520f6  ! 1516: WRPR_TT_I	wrpr	%r20, 0x00f6, %tt
	.word 0xb5a5c920  ! 1523: FMULs	fmuls	%f23, %f0, %f26
	.word 0xbda44860  ! 1527: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983dc1  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc1, %hpstate
	.word 0x85952134  ! 1534: WRPR_TSTATE_I	wrpr	%r20, 0x0134, %tstate
	.word 0xb7a58860  ! 1535: FADDq	dis not found

	setx	data_start_4, %g1, %r16
	.word 0xb7a90820  ! 1538: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a80c20  ! 1539: FMOVRLZ	dis not found

	.word 0xb4bd209e  ! 1542: XNORcc_I	xnorcc 	%r20, 0x009e, %r26
	.word 0xb5520000  ! 1544: RDPR_PIL	<illegal instruction>
	.word 0xb7540000  ! 1545: RDPR_GL	<illegal instruction>
	.word 0xb1a4c860  ! 1546: FADDq	dis not found

	.word 0xb08d2005  ! 1548: ANDcc_I	andcc 	%r20, 0x0005, %r24
	.word 0xb7518000  ! 1549: RDPR_PSTATE	<illegal instruction>
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1551: RDPR_TT	<illegal instruction>
	.word 0xbba81420  ! 1552: FMOVRNZ	dis not found

	.word 0xbfa94820  ! 1555: FMOVCS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982bc1  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc1, %hpstate
	.word 0xb3a00540  ! 1558: FSQRTd	fsqrt	
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0xb9a00520  ! 1564: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 1565: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 1568: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa4820  ! 1572: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1576: RDPR_GL	<illegal instruction>
	.word 0xb57d2401  ! 1579: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xb0a4e147  ! 1580: SUBcc_I	subcc 	%r19, 0x0147, %r24
	.word 0xb3aa4820  ! 1582: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 1586: FADDs	fadds	%f18, %f0, %f26
	.word 0xb551c000  ! 1593: RDPR_TL	<illegal instruction>
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 1598: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946026  ! 1601: WRPR_PSTATE_I	wrpr	%r17, 0x0026, %pstate
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48840  ! 1605: FADDd	faddd	%f18, %f0, %f62
	.word 0xb5a589e0  ! 1607: FDIVq	dis not found

	.word 0xb3a549c0  ! 1608: FDIVd	fdivd	%f52, %f0, %f56
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 1615: FMOVE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a80820  ! 1621: FMOVN	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 1622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xb9510000  ! 1629: RDPR_TICK	<illegal instruction>
	.word 0xbcb561b4  ! 1631: SUBCcc_I	orncc 	%r21, 0x01b4, %r30
	.word 0x8d9461c7  ! 1634: WRPR_PSTATE_I	wrpr	%r17, 0x01c7, %pstate
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xbfa489a0  ! 1640: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb7a4c9e0  ! 1642: FDIVq	dis not found

	.word 0xbb510000  ! 1643: RDPR_TICK	<illegal instruction>
	.word 0xb5a44840  ! 1646: FADDd	faddd	%f48, %f0, %f26
	.word 0xbda40840  ! 1647: FADDd	faddd	%f16, %f0, %f30
	.word 0xbd51c000  ! 1653: RDPR_TL	<illegal instruction>
	.word 0x8794a0f2  ! 1654: WRPR_TT_I	wrpr	%r18, 0x00f2, %tt
	.word 0xbfa548a0  ! 1656: FSUBs	fsubs	%f21, %f0, %f31
	setx	data_start_7, %g1, %r18
	.word 0xbf504000  ! 1660: RDPR_TNPC	<illegal instruction>
	.word 0xb3a58960  ! 1661: FMULq	dis not found

	.word 0xb9a81c20  ! 1662: FMOVRGEZ	dis not found

	.word 0xb9540000  ! 1664: RDPR_GL	<illegal instruction>
	.word 0xbda5c9a0  ! 1671: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb1a509e0  ! 1674: FDIVq	dis not found

	.word 0xbba489a0  ! 1678: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xbfa588e0  ! 1679: FSUBq	dis not found

	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 1683: RDPR_PIL	<illegal instruction>
	.word 0xbd508000  ! 1684: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1688: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9194a16f  ! 1689: WRPR_PIL_I	wrpr	%r18, 0x016f, %pil
	.word 0xb625e001  ! 1698: SUB_I	sub 	%r23, 0x0001, %r27
	.word 0xb5a90820  ! 1699: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb6b4a00d  ! 1700: ORNcc_I	orncc 	%r18, 0x000d, %r27
	.word 0xb1a80820  ! 1702: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbda80820  ! 1704: FMOVN	fmovs	%fcc1, %f0, %f30
	setx	data_start_5, %g1, %r18
	.word 0xb1aa8820  ! 1708: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa409e0  ! 1709: FDIVq	dis not found

	setx	data_start_1, %g1, %r16
	.word 0xb1a80820  ! 1717: FMOVN	fmovs	%fcc1, %f0, %f24
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 1719: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198295b  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	.word 0xbb2da001  ! 1723: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xbfa00520  ! 1724: FSQRTs	fsqrt	
	.word 0xbba5c9c0  ! 1725: FDIVd	fdivd	%f54, %f0, %f60
	setx	data_start_6, %g1, %r22
	.word 0x8d94e067  ! 1729: WRPR_PSTATE_I	wrpr	%r19, 0x0067, %pstate
	setx	data_start_1, %g1, %r20
	.word 0x89952064  ! 1733: WRPR_TICK_I	wrpr	%r20, 0x0064, %tick
	.word 0xb9a81c20  ! 1734: FMOVRGEZ	dis not found

	.word 0xb3480000  ! 1735: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_3, %g1, %r20
	.word 0xbf643801  ! 1741: MOVcc_I	<illegal instruction>
	.word 0xb7a9c820  ! 1743: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00540  ! 1744: FSQRTd	fsqrt	
	.word 0xb60d0000  ! 1745: AND_R	and 	%r20, %r0, %r27
	.word 0xbba50960  ! 1746: FMULq	dis not found

	.word 0x8194e1ae  ! 1750: WRPR_TPC_I	wrpr	%r19, 0x01ae, %tpc
	.word 0xb3a80820  ! 1756: FMOVN	fmovs	%fcc1, %f0, %f25
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 1758: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9a588e0  ! 1760: FSUBq	dis not found

	.word 0xb12d6001  ! 1761: SLL_I	sll 	%r21, 0x0001, %r24
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe250000  ! 1769: SUB_R	sub 	%r20, %r0, %r31
	.word 0xbba94820  ! 1780: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a5c9e0  ! 1782: FDIVq	dis not found

	.word 0xb9ab0820  ! 1783: FMOVGU	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda48820  ! 1792: FADDs	fadds	%f18, %f0, %f30
	mov	0, %r12
	.word 0x8f932000  ! 1793: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	2, %r12
	.word 0x8f932000  ! 1795: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda8c820  ! 1796: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0x8794e1fe  ! 1801: WRPR_TT_I	wrpr	%r19, 0x01fe, %tt
	.word 0xb5a50960  ! 1803: FMULq	dis not found

	.word 0xbfa48960  ! 1809: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198385b  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185b, %hpstate
	setx	data_start_6, %g1, %r20
	.word 0xb9a00520  ! 1815: FSQRTs	fsqrt	
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 1820: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00560  ! 1821: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbaac820  ! 1826: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a548e0  ! 1829: FSUBq	dis not found

	.word 0xb815a04e  ! 1832: OR_I	or 	%r22, 0x004e, %r28
	.word 0xbfa488a0  ! 1833: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb3a5c920  ! 1840: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbba40920  ! 1842: FMULs	fmuls	%f16, %f0, %f29
	.word 0x8994a1f3  ! 1845: WRPR_TICK_I	wrpr	%r18, 0x01f3, %tick
	.word 0xb9a00040  ! 1846: FMOVd	fmovd	%f0, %f28
	.word 0xbcc5e18a  ! 1847: ADDCcc_I	addccc 	%r23, 0x018a, %r30
	.word 0xb3520000  ! 1849: RDPR_PIL	<illegal instruction>
	.word 0xbe25c000  ! 1852: SUB_R	sub 	%r23, %r0, %r31
	.word 0xb7a94820  ! 1857: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93c2001  ! 1863: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xbfa548a0  ! 1865: FSUBs	fsubs	%f21, %f0, %f31
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 1873: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983853  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1853, %hpstate
	.word 0xb5abc820  ! 1876: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba40860  ! 1877: FADDq	dis not found

	.word 0xb7a58960  ! 1878: FMULq	dis not found

	.word 0xbba81c20  ! 1880: FMOVRGEZ	dis not found

	.word 0xb9a54940  ! 1890: FMULd	fmuld	%f52, %f0, %f28
	.word 0xbba5c840  ! 1891: FADDd	faddd	%f54, %f0, %f60
	mov	1, %r14
	.word 0xa193a000  ! 1892: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a81420  ! 1893: FMOVRNZ	dis not found

	.word 0xbfaac820  ! 1894: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb0b52132  ! 1895: SUBCcc_I	orncc 	%r20, 0x0132, %r24
	.word 0xb1a408a0  ! 1898: FSUBs	fsubs	%f16, %f0, %f24
	.word 0x8d956149  ! 1908: WRPR_PSTATE_I	wrpr	%r21, 0x0149, %pstate
	.word 0xb9504000  ! 1909: RDPR_TNPC	<illegal instruction>
	.word 0xbfa40920  ! 1914: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb5a509e0  ! 1919: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982853  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0853, %hpstate
	.word 0xbbaa0820  ! 1924: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7ab4820  ! 1930: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r18
	.word 0xb3a94820  ! 1936: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 1941: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 1943: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x9195611b  ! 1945: WRPR_PIL_I	wrpr	%r21, 0x011b, %pil
	setx	data_start_3, %g1, %r18
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9a0  ! 1952: FDIVs	fdivs	%f23, %f0, %f31
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1963: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d9520a5  ! 1964: WRPR_PSTATE_I	wrpr	%r20, 0x00a5, %pstate
	.word 0xbba408c0  ! 1966: FSUBd	fsubd	%f16, %f0, %f60
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb535a001  ! 1971: SRL_I	srl 	%r22, 0x0001, %r26
	.word 0x879421e4  ! 1977: WRPR_TT_I	wrpr	%r16, 0x01e4, %tt
	.word 0xbba509a0  ! 1978: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb1a00520  ! 1981: FSQRTs	fsqrt	
	.word 0xb3a80820  ! 1982: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c940  ! 1984: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb1a80420  ! 1987: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a80820  ! 1990: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0x8d942010  ! 1993: WRPR_PSTATE_I	wrpr	%r16, 0x0010, %pstate
	.word 0xb3abc820  ! 1994: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbba448c0  ! 1998: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbba81820  ! 1999: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x839461b0  ! 2003: WRPR_TNPC_I	wrpr	%r17, 0x01b0, %tnpc
	.word 0xb3a80420  ! 2007: FMOVRZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 2010: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a98820  ! 2014: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbea58000  ! 2016: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xb1a409e0  ! 2019: FDIVq	dis not found

	.word 0xb7a5c9c0  ! 2020: FDIVd	fdivd	%f54, %f0, %f58
	mov	2, %r14
	.word 0xa193a000  ! 2024: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a448e0  ! 2025: FSUBq	dis not found

	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a50840  ! 2028: FADDd	faddd	%f20, %f0, %f24
	.word 0xb295c000  ! 2029: ORcc_R	orcc 	%r23, %r0, %r25
	.word 0xb7ab0820  ! 2030: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a9c820  ! 2031: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7aa4820  ! 2040: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a4c840  ! 2045: FADDd	faddd	%f50, %f0, %f24
	.word 0xbdabc820  ! 2047: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00520  ! 2049: FSQRTs	fsqrt	
	.word 0xbe352145  ! 2050: SUBC_I	orn 	%r20, 0x0145, %r31
	.word 0xbfaa4820  ! 2051: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbdabc820  ! 2054: FMOVVC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0x8394e0ed  ! 2057: WRPR_TNPC_I	wrpr	%r19, 0x00ed, %tnpc
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982991  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	.word 0xb9a8c820  ! 2065: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8394a156  ! 2067: WRPR_TNPC_I	wrpr	%r18, 0x0156, %tnpc
	.word 0xbfa00540  ! 2068: FSQRTd	fsqrt	
	.word 0xb3a00560  ! 2070: FSQRTq	fsqrt	
	.word 0xbc3c8000  ! 2071: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xbfa94820  ! 2076: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00540  ! 2078: FSQRTd	fsqrt	
	.word 0xb5a00520  ! 2079: FSQRTs	fsqrt	
	mov	1, %r12
	.word 0x8f932000  ! 2081: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba48960  ! 2083: FMULq	dis not found

	.word 0xbba5c960  ! 2084: FMULq	dis not found

	.word 0xb1abc820  ! 2086: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80820  ! 2087: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81820  ! 2088: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0x8595a12b  ! 2093: WRPR_TSTATE_I	wrpr	%r22, 0x012b, %tstate
	.word 0xb1a00520  ! 2094: FSQRTs	fsqrt	
	.word 0xb7a48960  ! 2095: FMULq	dis not found

	.word 0xbda80c20  ! 2096: FMOVRLZ	dis not found

	.word 0x819421ec  ! 2097: WRPR_TPC_I	wrpr	%r16, 0x01ec, %tpc
	.word 0xb1aa8820  ! 2099: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa44960  ! 2104: FMULq	dis not found

	.word 0xbfa5c9c0  ! 2106: FDIVd	fdivd	%f54, %f0, %f62
	.word 0x8195a0c8  ! 2108: WRPR_TPC_I	wrpr	%r22, 0x00c8, %tpc
	.word 0xb42d218c  ! 2112: ANDN_I	andn 	%r20, 0x018c, %r26
	.word 0xb7a00540  ! 2115: FSQRTd	fsqrt	
	.word 0xbba00020  ! 2116: FMOVs	fmovs	%f0, %f29
	.word 0xb2bce060  ! 2117: XNORcc_I	xnorcc 	%r19, 0x0060, %r25
	.word 0xbfa94820  ! 2122: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a588e0  ! 2123: FSUBq	dis not found

	.word 0xb1aa0820  ! 2126: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb93c2001  ! 2129: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xbf2c7001  ! 2130: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb69d0000  ! 2137: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xbfaa0820  ! 2139: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb9a48820  ! 2141: FADDs	fadds	%f18, %f0, %f28
	.word 0xb1ab0820  ! 2143: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbba00520  ! 2145: FSQRTs	fsqrt	
	.word 0xbfabc820  ! 2146: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0x8395a1e3  ! 2148: WRPR_TNPC_I	wrpr	%r22, 0x01e3, %tnpc
	.word 0xb7a00540  ! 2150: FSQRTd	fsqrt	
	.word 0xbba4c9c0  ! 2153: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xbd500000  ! 2154: RDPR_TPC	<illegal instruction>
	.word 0xb3a94820  ! 2156: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xb7480000  ! 2168: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3a448c0  ! 2169: FSUBd	fsubd	%f48, %f0, %f56
	.word 0x8d94a14c  ! 2170: WRPR_PSTATE_I	wrpr	%r18, 0x014c, %pstate
	.word 0xbb2c7001  ! 2173: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xb5a81c20  ! 2174: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3504000  ! 2177: RDPR_TNPC	<illegal instruction>
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 2179: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	data_start_6, %g1, %r23
	.word 0xb3520000  ! 2184: RDPR_PIL	<illegal instruction>
	.word 0xb3a448c0  ! 2185: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xb5a81420  ! 2188: FMOVRNZ	dis not found

	.word 0x859420d0  ! 2191: WRPR_TSTATE_I	wrpr	%r16, 0x00d0, %tstate
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 2193: FMOVRZ	dis not found

	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xb3aa8820  ! 2203: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9504000  ! 2209: RDPR_TNPC	<illegal instruction>
	.word 0xb9a54820  ! 2212: FADDs	fadds	%f21, %f0, %f28
	.word 0xb6bda194  ! 2219: XNORcc_I	xnorcc 	%r22, 0x0194, %r27
	.word 0xbf504000  ! 2223: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899461b7  ! 2227: WRPR_TICK_I	wrpr	%r17, 0x01b7, %tick
	.word 0xb9a449c0  ! 2229: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xbb540000  ! 2236: RDPR_GL	<illegal instruction>
	.word 0xbba98820  ! 2237: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 2248: RDPR_GL	<illegal instruction>
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb5a5c960  ! 2252: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982a99  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a99, %hpstate
	.word 0x8994216b  ! 2254: WRPR_TICK_I	wrpr	%r16, 0x016b, %tick
	.word 0xbbaa4820  ! 2256: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab8820  ! 2264: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a98820  ! 2265: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a54960  ! 2266: FMULq	dis not found

	.word 0xb1a4c860  ! 2268: FADDq	dis not found

	.word 0xb1480000  ! 2272: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x10309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 2275: RDPR_TPC	<illegal instruction>
	.word 0xb7a9c820  ! 2277: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a50960  ! 2278: FMULq	dis not found

	.word 0xb1a588c0  ! 2279: FSUBd	fsubd	%f22, %f0, %f24
	.word 0x8995a0dc  ! 2282: WRPR_TICK_I	wrpr	%r22, 0x00dc, %tick
	.word 0xb9a80c20  ! 2285: FMOVRLZ	dis not found

	.word 0xbfaa8820  ! 2286: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8395a139  ! 2290: WRPR_TNPC_I	wrpr	%r22, 0x0139, %tnpc
	.word 0xbda58940  ! 2291: FMULd	fmuld	%f22, %f0, %f30
	setx	data_start_2, %g1, %r19
	.word 0xbfa54940  ! 2296: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb3a508e0  ! 2298: FSUBq	dis not found

	.word 0x8d94e00a  ! 2299: WRPR_PSTATE_I	wrpr	%r19, 0x000a, %pstate
	.word 0xb7a9c820  ! 2303: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbda80420  ! 2304: FMOVRZ	dis not found

	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 2308: RDPR_TICK	<illegal instruction>
	.word 0xb9643801  ! 2309: MOVcc_I	<illegal instruction>
	.word 0xb1a54840  ! 2310: FADDd	faddd	%f52, %f0, %f24
	.word 0x87956195  ! 2312: WRPR_TT_I	wrpr	%r21, 0x0195, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0xb61cc000  ! 2318: XOR_R	xor 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983fc1  ! 2319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc1, %hpstate
	.word 0xb1a40820  ! 2320: FADDs	fadds	%f16, %f0, %f24
	.word 0xb5ab8820  ! 2321: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81820  ! 2323: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbda48860  ! 2324: FADDq	dis not found

	.word 0xb7520000  ! 2326: RDPR_PIL	<illegal instruction>
	.word 0xb351c000  ! 2328: RDPR_TL	<illegal instruction>
	.word 0xb7a94820  ! 2336: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r22
	.word 0xb9a81420  ! 2343: FMOVRNZ	dis not found

	.word 0xbfaa4820  ! 2344: FMOVNE	fmovs	%fcc1, %f0, %f31
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a509e0  ! 2349: FDIVq	dis not found

	.word 0xb9ab8820  ! 2351: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7504000  ! 2352: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00020  ! 2354: FMOVs	fmovs	%f0, %f28
	.word 0xb7aa8820  ! 2356: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbf51c000  ! 2357: RDPR_TL	<illegal instruction>
	.word 0xb5a448e0  ! 2360: FSUBq	dis not found

	.word 0xb5a54820  ! 2361: FADDs	fadds	%f21, %f0, %f26
	.word 0xbba5c9e0  ! 2365: FDIVq	dis not found

	.word 0xbfa88820  ! 2366: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a81420  ! 2370: FMOVRNZ	dis not found

	.word 0xbba90820  ! 2371: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb8348000  ! 2372: ORN_R	orn 	%r18, %r0, %r28
	.word 0xbda48860  ! 2373: FADDq	dis not found

	.word 0xbfa80c20  ! 2374: FMOVRLZ	dis not found

	.word 0x8995a0c1  ! 2375: WRPR_TICK_I	wrpr	%r22, 0x00c1, %tick
	.word 0xb5a44860  ! 2378: FADDq	dis not found

	.word 0xbfaa8820  ! 2384: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a5c8a0  ! 2385: FSUBs	fsubs	%f23, %f0, %f27
	.word 0x81942031  ! 2386: WRPR_TPC_I	wrpr	%r16, 0x0031, %tpc
	.word 0xbf500000  ! 2394: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xbfa80c20  ! 2397: FMOVRLZ	dis not found

	.word 0xb9a81820  ! 2400: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbdaa4820  ! 2405: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbbaa0820  ! 2412: FMOVA	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81983cc9  ! 2413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc9, %hpstate
	.word 0x919460a2  ! 2415: WRPR_PIL_I	wrpr	%r17, 0x00a2, %pil
	setx	data_start_3, %g1, %r16
	.word 0xbba508c0  ! 2417: FSUBd	fsubd	%f20, %f0, %f60
	.word 0x8995a117  ! 2418: WRPR_TICK_I	wrpr	%r22, 0x0117, %tick
	.word 0xb1a54820  ! 2420: FADDs	fadds	%f21, %f0, %f24
	.word 0xb7a80820  ! 2422: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 2428: FMOVRGEZ	dis not found

	.word 0xbba90820  ! 2430: FMOVLEU	fmovs	%fcc1, %f0, %f29
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe9c21b8  ! 2433: XORcc_I	xorcc 	%r16, 0x01b8, %r31
	setx	0x20f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a58820  ! 2436: FADDs	fadds	%f22, %f0, %f24
	.word 0xb6b46088  ! 2437: SUBCcc_I	orncc 	%r17, 0x0088, %r27
	.word 0x83942025  ! 2440: WRPR_TNPC_I	wrpr	%r16, 0x0025, %tnpc
	.word 0xbd518000  ! 2441: RDPR_PSTATE	<illegal instruction>
	.word 0xbba00560  ! 2444: FSQRTq	fsqrt	
	.word 0x839521ce  ! 2445: WRPR_TNPC_I	wrpr	%r20, 0x01ce, %tnpc
	.word 0xb7508000  ! 2447: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 2454: RDPR_TPC	<illegal instruction>
	.word 0xb5a00540  ! 2456: FSQRTd	fsqrt	
	.word 0x8995e1a2  ! 2457: WRPR_TICK_I	wrpr	%r23, 0x01a2, %tick
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2461: RDPR_TPC	<illegal instruction>
	.word 0xb3a4c9c0  ! 2465: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb6054000  ! 2469: ADD_R	add 	%r21, %r0, %r27
	.word 0xb3aa4820  ! 2470: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfab4820  ! 2473: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbfabc820  ! 2474: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb9ab0820  ! 2476: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb950c000  ! 2480: RDPR_TT	<illegal instruction>
	setx	data_start_5, %g1, %r18
	.word 0x8995a0e1  ! 2486: WRPR_TICK_I	wrpr	%r22, 0x00e1, %tick
	.word 0xb5a80420  ! 2490: FMOVRZ	dis not found

	.word 0x9194217d  ! 2492: WRPR_PIL_I	wrpr	%r16, 0x017d, %pil
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 2495: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a5c920  ! 2496: FMULs	fmuls	%f23, %f0, %f24
	.word 0xb3a80820  ! 2499: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb4450000  ! 2501: ADDC_R	addc 	%r20, %r0, %r26
	.word 0xb1a4c940  ! 2503: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb1a508a0  ! 2506: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb3a40820  ! 2512: FADDs	fadds	%f16, %f0, %f25
	.word 0xb9a5c9a0  ! 2513: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb5a81420  ! 2515: FMOVRNZ	dis not found

	.word 0xb7a00040  ! 2518: FMOVd	fmovd	%f0, %f58
	.word 0x87956089  ! 2519: WRPR_TT_I	wrpr	%r21, 0x0089, %tt
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 2521: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbb50c000  ! 2522: RDPR_TT	<illegal instruction>
	.word 0xb1aa8820  ! 2525: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a4c960  ! 2526: FMULq	dis not found

	.word 0xbda408c0  ! 2527: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb9a508e0  ! 2528: FSUBq	dis not found

	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2531: FSQRTs	fsqrt	
	setx	data_start_6, %g1, %r16
	.word 0x81956058  ! 2533: WRPR_TPC_I	wrpr	%r21, 0x0058, %tpc
	.word 0xbba449a0  ! 2534: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb7a508e0  ! 2537: FSUBq	dis not found

	.word 0xb5ab4820  ! 2538: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb80d60ce  ! 2539: AND_I	and 	%r21, 0x00ce, %r28
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2546: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0x85946164  ! 2547: WRPR_TSTATE_I	wrpr	%r17, 0x0164, %tstate
	.word 0xb2b5c000  ! 2548: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xb4ac2038  ! 2552: ANDNcc_I	andncc 	%r16, 0x0038, %r26
	.word 0xbda88820  ! 2557: FMOVLE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982f99  ! 2558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2564: RDPR_TNPC	<illegal instruction>
	.word 0xbabc8000  ! 2567: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0x8995a12a  ! 2568: WRPR_TICK_I	wrpr	%r22, 0x012a, %tick
	.word 0xb2b56037  ! 2569: ORNcc_I	orncc 	%r21, 0x0037, %r25
	.word 0xb3a44820  ! 2573: FADDs	fadds	%f17, %f0, %f25
	.word 0xbfa408a0  ! 2574: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbda00020  ! 2576: FMOVs	fmovs	%f0, %f30
	.word 0x81956009  ! 2578: WRPR_TPC_I	wrpr	%r21, 0x0009, %tpc
	.word 0xbd7c0400  ! 2582: MOVR_R	movre	%r16, %r0, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2586: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2591: FMOVRZ	dis not found

	.word 0xb3a00540  ! 2592: FSQRTd	fsqrt	
	.word 0xbfa00520  ! 2594: FSQRTs	fsqrt	
	mov	0, %r14
	.word 0xa193a000  ! 2596: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa588a0  ! 2598: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb5a00020  ! 2599: FMOVs	fmovs	%f0, %f26
	.word 0xb1a81c20  ! 2600: FMOVRGEZ	dis not found

	.word 0xbba9c820  ! 2601: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbaa40000  ! 2603: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xb9a4c960  ! 2604: FMULq	dis not found

	.word 0xbac48000  ! 2606: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xb3a5c940  ! 2608: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbda508e0  ! 2609: FSUBq	dis not found

	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 2615: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2619: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd480000  ! 2620: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7a4c9a0  ! 2622: FDIVs	fdivs	%f19, %f0, %f27
	.word 0x9194a00d  ! 2624: WRPR_PIL_I	wrpr	%r18, 0x000d, %pil
	.word 0xb1a40920  ! 2625: FMULs	fmuls	%f16, %f0, %f24
	setx	data_start_6, %g1, %r23
	.word 0xba144000  ! 2628: OR_R	or 	%r17, %r0, %r29
	.word 0xbdab0820  ! 2630: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a9c820  ! 2632: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a589e0  ! 2635: FDIVq	dis not found

	.word 0xbbaac820  ! 2636: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda44940  ! 2637: FMULd	fmuld	%f48, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc1d6126  ! 2644: XOR_I	xor 	%r21, 0x0126, %r30
	.word 0xb1a81820  ! 2646: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa50820  ! 2650: FADDs	fadds	%f20, %f0, %f31
	.word 0xbba81420  ! 2654: FMOVRNZ	dis not found

	.word 0xbb510000  ! 2658: RDPR_TICK	<illegal instruction>
	.word 0xb5a40940  ! 2659: FMULd	fmuld	%f16, %f0, %f26
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d0000  ! 2661: SLL_R	sll 	%r20, %r0, %r31
	.word 0xb5a488a0  ! 2662: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb3a00560  ! 2666: FSQRTq	fsqrt	
	.word 0xb3a80c20  ! 2667: FMOVRLZ	dis not found

	.word 0xbf510000  ! 2668: RDPR_TICK	<illegal instruction>
	.word 0xb3a44940  ! 2669: FMULd	fmuld	%f48, %f0, %f56
	.word 0xbba4c960  ! 2670: FMULq	dis not found

	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 2674: RDPR_GL	<illegal instruction>
	.word 0xbda48860  ! 2675: FADDq	dis not found

	.word 0xbf520000  ! 2678: RDPR_PIL	<illegal instruction>
	.word 0xb88c8000  ! 2679: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xbf520000  ! 2683: RDPR_PIL	<illegal instruction>
	.word 0xb5a94820  ! 2684: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a5c860  ! 2685: FADDq	dis not found

	.word 0xb1a00040  ! 2687: FMOVd	fmovd	%f0, %f24
	.word 0xb5500000  ! 2690: RDPR_TPC	<illegal instruction>
	.word 0xb1a5c920  ! 2696: FMULs	fmuls	%f23, %f0, %f24
	setx	data_start_1, %g1, %r16
	.word 0x8794a0ee  ! 2701: WRPR_TT_I	wrpr	%r18, 0x00ee, %tt
	.word 0xbba00540  ! 2702: FSQRTd	fsqrt	
	.word 0xb7a94820  ! 2704: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba50840  ! 2713: FADDd	faddd	%f20, %f0, %f60
	.word 0x8795a1fe  ! 2719: WRPR_TT_I	wrpr	%r22, 0x01fe, %tt
	.word 0x8195619f  ! 2720: WRPR_TPC_I	wrpr	%r21, 0x019f, %tpc
	.word 0xbba88820  ! 2722: FMOVLE	fmovs	%fcc1, %f0, %f29
	mov	0, %r14
	.word 0xa193a000  ! 2723: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba448a0  ! 2726: FSUBs	fsubs	%f17, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 2728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 2735: FSQRTd	fsqrt	
	.word 0xb3a80c20  ! 2737: FMOVRLZ	dis not found

	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8a0  ! 2743: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xb5a00560  ! 2744: FSQRTq	fsqrt	
	.word 0x8595e0c4  ! 2747: WRPR_TSTATE_I	wrpr	%r23, 0x00c4, %tstate
	.word 0xbba81420  ! 2752: FMOVRNZ	dis not found

	.word 0xb1518000  ! 2753: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a00560  ! 2755: FSQRTq	fsqrt	
	.word 0xb350c000  ! 2758: RDPR_TT	<illegal instruction>
	.word 0xbe35201f  ! 2760: SUBC_I	orn 	%r20, 0x001f, %r31
	.word 0xb1510000  ! 2762: RDPR_TICK	<illegal instruction>
	.word 0x83942053  ! 2764: WRPR_TNPC_I	wrpr	%r16, 0x0053, %tnpc
	.word 0xbda81c20  ! 2769: FMOVRGEZ	dis not found

	.word 0xb5480000  ! 2770: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfa80820  ! 2771: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a94820  ! 2774: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbd2da001  ! 2775: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xb3a94820  ! 2776: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbda00560  ! 2781: FSQRTq	fsqrt	
	.word 0xbfa90820  ! 2782: FMOVLEU	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0x8f932000  ! 2784: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983c83  ! 2790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c83, %hpstate
	.word 0xb1518000  ! 2794: RDPR_PSTATE	<illegal instruction>
	.word 0xb2156019  ! 2796: OR_I	or 	%r21, 0x0019, %r25
	.word 0xbda00560  ! 2800: FSQRTq	fsqrt	
	mov	2, %r12
	.word 0x8f932000  ! 2802: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a58940  ! 2803: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb5a88820  ! 2806: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x919421dd  ! 2808: WRPR_PIL_I	wrpr	%r16, 0x01dd, %pil
	.word 0xb9a5c8e0  ! 2809: FSUBq	dis not found

	.word 0xbda58820  ! 2810: FADDs	fadds	%f22, %f0, %f30
	.word 0x9194218e  ! 2813: WRPR_PIL_I	wrpr	%r16, 0x018e, %pil
	.word 0xb3a44840  ! 2814: FADDd	faddd	%f48, %f0, %f56
	.word 0xbb51c000  ! 2815: RDPR_TL	<illegal instruction>
	.word 0xb1a00020  ! 2817: FMOVs	fmovs	%f0, %f24
	setx	data_start_3, %g1, %r19
	.word 0xb9a81c20  ! 2823: FMOVRGEZ	dis not found

	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8a0  ! 2830: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb3aa0820  ! 2831: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa8820  ! 2833: FMOVG	fmovs	%fcc1, %f0, %f29
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 2836: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb3a00560  ! 2837: FSQRTq	fsqrt	
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba0ca141  ! 2842: AND_I	and 	%r18, 0x0141, %r29
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8de028  ! 2844: ANDcc_I	andcc 	%r23, 0x0028, %r29
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	setx	data_start_0, %g1, %r20
	.word 0xb1aa8820  ! 2851: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa94820  ! 2852: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a8c820  ! 2853: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983c1b  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1b, %hpstate
	.word 0xbda588e0  ! 2860: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 2864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0xbda00540  ! 2866: FSQRTd	fsqrt	
	setx	data_start_5, %g1, %r19
	setx	data_start_0, %g1, %r21
	.word 0xbfa94820  ! 2878: FMOVCS	fmovs	%fcc1, %f0, %f31
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 2887: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00020  ! 2889: FMOVs	fmovs	%f0, %f26
	mov	0, %r12
	.word 0x8f932000  ! 2892: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcc5c000  ! 2893: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xb7a00540  ! 2900: FSQRTd	fsqrt	
	.word 0xbf540000  ! 2903: RDPR_GL	<illegal instruction>
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 2909: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbf355000  ! 2912: SRLX_R	srlx	%r21, %r0, %r31
	.word 0xbfa54920  ! 2913: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb3ab0820  ! 2919: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x89946155  ! 2924: WRPR_TICK_I	wrpr	%r17, 0x0155, %tick
	.word 0xbf2d4000  ! 2926: SLL_R	sll 	%r21, %r0, %r31
	.word 0xbda84820  ! 2927: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb5540000  ! 2929: RDPR_GL	<illegal instruction>
	.word 0xbcc40000  ! 2932: ADDCcc_R	addccc 	%r16, %r0, %r30
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2939: RDPR_GL	<illegal instruction>
	.word 0xb7a81820  ! 2942: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	mov	2, %r12
	.word 0x8f932000  ! 2944: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195e164  ! 2946: WRPR_PIL_I	wrpr	%r23, 0x0164, %pil
	.word 0xb1a4c920  ! 2949: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb9480000  ! 2950: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9a4c840  ! 2952: FADDd	faddd	%f50, %f0, %f28
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a449e0  ! 2955: FDIVq	dis not found

	.word 0xb5aa4820  ! 2956: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a84820  ! 2958: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8795a141  ! 2959: WRPR_TT_I	wrpr	%r22, 0x0141, %tt
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2964: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 2966: RDPR_TT	<illegal instruction>
	.word 0xb1a80420  ! 2967: FMOVRZ	dis not found

	.word 0xba0da0f6  ! 2968: AND_I	and 	%r22, 0x00f6, %r29
	.word 0xb5a5c9c0  ! 2969: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb5a00040  ! 2970: FMOVd	fmovd	%f0, %f26
	.word 0xb3643801  ! 2974: MOVcc_I	<illegal instruction>
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb935d000  ! 2976: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xbd7ca401  ! 2977: MOVR_I	movre	%r18, 0x1, %r30
	.word 0xbba44940  ! 2978: FMULd	fmuld	%f48, %f0, %f60
	.word 0x8794e1cb  ! 2982: WRPR_TT_I	wrpr	%r19, 0x01cb, %tt
	.word 0xb9500000  ! 2983: RDPR_TPC	<illegal instruction>
	.word 0xb5a8c820  ! 2986: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a588a0  ! 2994: FSUBs	fsubs	%f22, %f0, %f25
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a184  ! 3001: WRPR_TNPC_I	wrpr	%r18, 0x0184, %tnpc
	.word 0xbbaa0820  ! 3002: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9a48940  ! 3006: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb1a9c820  ! 3009: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9518000  ! 3017: RDPR_PSTATE	<illegal instruction>
	.word 0xb9500000  ! 3019: RDPR_TPC	<illegal instruction>
	.word 0xb7a80420  ! 3020: FMOVRZ	dis not found

	.word 0xbba94820  ! 3022: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00520  ! 3025: FSQRTs	fsqrt	
	.word 0xbba8c820  ! 3027: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa449c0  ! 3028: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xba144000  ! 3036: OR_R	or 	%r17, %r0, %r29
	.word 0xb5a409c0  ! 3037: FDIVd	fdivd	%f16, %f0, %f26
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 3039: FMOVRGEZ	dis not found

	.word 0xbd508000  ! 3041: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c9b  ! 3043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9b, %hpstate
	.word 0xbf51c000  ! 3046: RDPR_TL	<illegal instruction>
	.word 0x8995207f  ! 3049: WRPR_TICK_I	wrpr	%r20, 0x007f, %tick
	setx	data_start_4, %g1, %r18
	.word 0x8795603a  ! 3052: WRPR_TT_I	wrpr	%r21, 0x003a, %tt
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa589e0  ! 3058: FDIVq	dis not found

	.word 0xbea561fe  ! 3059: SUBcc_I	subcc 	%r21, 0x01fe, %r31
	.word 0xbb500000  ! 3061: RDPR_TPC	<illegal instruction>
	.word 0xb6c50000  ! 3062: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xb3518000  ! 3063: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 3066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xbb51c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xb72cf001  ! 3070: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xb1a449a0  ! 3072: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb9a80820  ! 3073: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81820  ! 3075: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba00520  ! 3078: FSQRTs	fsqrt	
	.word 0x8595e1d1  ! 3079: WRPR_TSTATE_I	wrpr	%r23, 0x01d1, %tstate
	.word 0xb5500000  ! 3081: RDPR_TPC	<illegal instruction>
	.word 0xb9a00560  ! 3082: FSQRTq	fsqrt	
	.word 0x8994210c  ! 3085: WRPR_TICK_I	wrpr	%r16, 0x010c, %tick
	.word 0xb3ab4820  ! 3088: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 3093: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x8995a193  ! 3095: WRPR_TICK_I	wrpr	%r22, 0x0193, %tick
	.word 0x879420f0  ! 3096: WRPR_TT_I	wrpr	%r16, 0x00f0, %tt
	setx	data_start_0, %g1, %r16
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 3108: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00520  ! 3110: FSQRTs	fsqrt	
	.word 0xbdaa0820  ! 3113: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a589a0  ! 3115: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xbfa94820  ! 3117: FMOVCS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9abc820  ! 3124: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb951c000  ! 3125: RDPR_TL	<illegal instruction>
	.word 0xb9a5c8a0  ! 3127: FSUBs	fsubs	%f23, %f0, %f28
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89946163  ! 3129: WRPR_TICK_I	wrpr	%r17, 0x0163, %tick
	.word 0xb73d7001  ! 3130: SRAX_I	srax	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xb7a48960  ! 3134: FMULq	dis not found

	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda549a0  ! 3136: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xbb540000  ! 3138: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3145: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda80420  ! 3146: FMOVRZ	dis not found

	.word 0xbfa00520  ! 3151: FSQRTs	fsqrt	
	.word 0xbabd0000  ! 3152: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xbab46138  ! 3154: SUBCcc_I	orncc 	%r17, 0x0138, %r29
	.word 0xb7a80c20  ! 3155: FMOVRLZ	dis not found

	.word 0xb60c215e  ! 3159: AND_I	and 	%r16, 0x015e, %r27
	.word 0xb7a00020  ! 3161: FMOVs	fmovs	%f0, %f27
	.word 0xbba44920  ! 3162: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbfa00520  ! 3164: FSQRTs	fsqrt	
	.word 0xb3520000  ! 3171: RDPR_PIL	<illegal instruction>
	.word 0x819520af  ! 3176: WRPR_TPC_I	wrpr	%r20, 0x00af, %tpc
	.word 0x8d94a03c  ! 3178: WRPR_PSTATE_I	wrpr	%r18, 0x003c, %pstate
	.word 0x8394e04e  ! 3179: WRPR_TNPC_I	wrpr	%r19, 0x004e, %tnpc
	.word 0xb3510000  ! 3181: RDPR_TICK	<illegal instruction>
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 3184: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0xb3a00540  ! 3188: FSQRTd	fsqrt	
	.word 0xbda48860  ! 3189: FADDq	dis not found

	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 3192: FSQRTs	fsqrt	
	.word 0xbba58860  ! 3193: FADDq	dis not found

	.word 0xb9a488a0  ! 3195: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb7a5c840  ! 3196: FADDd	faddd	%f54, %f0, %f58
	.word 0xb3a00520  ! 3198: FSQRTs	fsqrt	
	.word 0xb7a5c9a0  ! 3204: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbd508000  ! 3206: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 3211: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a00560  ! 3213: FSQRTq	fsqrt	
	.word 0xbfa58820  ! 3216: FADDs	fadds	%f22, %f0, %f31
	.word 0xb1a50860  ! 3217: FADDq	dis not found

	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3222: FMOVCC	fmovs	%fcc1, %f0, %f24
	mov	1, %r14
	.word 0xa193a000  ! 3224: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba80820  ! 3225: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 3231: FMULs	fmuls	%f21, %f0, %f31
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 3234: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 3247: RDPR_GL	<illegal instruction>
	.word 0xb1aa0820  ! 3248: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 3252: RDPR_GL	<illegal instruction>
	.word 0xb7a489a0  ! 3253: FDIVs	fdivs	%f18, %f0, %f27
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 3261: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a00040  ! 3262: FMOVd	fmovd	%f0, %f58
	.word 0x8394e01f  ! 3266: WRPR_TNPC_I	wrpr	%r19, 0x001f, %tnpc
	.word 0xbfa40960  ! 3268: FMULq	dis not found

	.word 0xb3a00520  ! 3270: FSQRTs	fsqrt	
	.word 0xbfa5c860  ! 3272: FADDq	dis not found

	.word 0xb9480000  ! 3275: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3500000  ! 3277: RDPR_TPC	<illegal instruction>
	.word 0x919520a3  ! 3278: WRPR_PIL_I	wrpr	%r20, 0x00a3, %pil
	setx	data_start_5, %g1, %r22
	.word 0xbba48840  ! 3282: FADDd	faddd	%f18, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81983f51  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f51, %hpstate
	.word 0x85946079  ! 3286: WRPR_TSTATE_I	wrpr	%r17, 0x0079, %tstate
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a017  ! 3291: WRPR_TNPC_I	wrpr	%r22, 0x0017, %tnpc
	.word 0xbf508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xb1510000  ! 3296: RDPR_TICK	<illegal instruction>
	.word 0xb5a00540  ! 3297: FSQRTd	fsqrt	
	.word 0xb7a00020  ! 3301: FMOVs	fmovs	%f0, %f27
	.word 0xb635c000  ! 3302: ORN_R	orn 	%r23, %r0, %r27
	.word 0xb7a80420  ! 3304: FMOVRZ	dis not found

	.word 0x9194a0cc  ! 3306: WRPR_PIL_I	wrpr	%r18, 0x00cc, %pil
	.word 0xb1a00520  ! 3309: FSQRTs	fsqrt	
	setx	0x20311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 3312: FMOVPOS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983e83  ! 3314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e83, %hpstate
	.word 0xbb500000  ! 3315: RDPR_TPC	<illegal instruction>
	.word 0xbfa88820  ! 3317: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbb50c000  ! 3319: RDPR_TT	<illegal instruction>
	.word 0xb1a80820  ! 3324: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb550c000  ! 3325: RDPR_TT	<illegal instruction>
	.word 0xbdabc820  ! 3328: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 3330: FMOVRZ	dis not found

	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a409a0  ! 3335: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xbbaa4820  ! 3337: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbba509a0  ! 3339: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb350c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 3343: RDPR_TSTATE	<illegal instruction>
	.word 0xbda80420  ! 3346: FMOVRZ	dis not found

	.word 0xbda48860  ! 3349: FADDq	dis not found

	.word 0xb7518000  ! 3352: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa00040  ! 3354: FMOVd	fmovd	%f0, %f62
	.word 0xb7518000  ! 3356: RDPR_PSTATE	<illegal instruction>
	.word 0xb404c000  ! 3360: ADD_R	add 	%r19, %r0, %r26
	.word 0xb7a80c20  ! 3361: FMOVRLZ	dis not found

	.word 0xb7aa0820  ! 3370: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a408e0  ! 3371: FSUBq	dis not found

	.word 0xb9a50860  ! 3372: FADDq	dis not found

	.word 0xb7480000  ! 3376: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a80420  ! 3383: FMOVRZ	dis not found

	.word 0xbba80820  ! 3384: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 3392: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb535d000  ! 3394: SRLX_R	srlx	%r23, %r0, %r26
	.word 0xb3540000  ! 3395: RDPR_GL	<illegal instruction>
	.word 0xb5a88820  ! 3397: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48960  ! 3398: FMULq	dis not found

	.word 0xbfa8c820  ! 3400: FMOVL	fmovs	%fcc1, %f0, %f31
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a409c0  ! 3404: FDIVd	fdivd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	.word 0x81982a03  ! 3407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a03, %hpstate
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e080  ! 3411: WRPR_TNPC_I	wrpr	%r19, 0x0080, %tnpc
	.word 0xb1a88820  ! 3412: FMOVLE	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983953  ! 3415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1953, %hpstate
	.word 0xb7a4c9a0  ! 3417: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb1518000  ! 3420: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a80420  ! 3424: FMOVRZ	dis not found

	.word 0xbda8c820  ! 3427: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbe454000  ! 3428: ADDC_R	addc 	%r21, %r0, %r31
	.word 0x9194e029  ! 3434: WRPR_PIL_I	wrpr	%r19, 0x0029, %pil
	.word 0x8594602d  ! 3435: WRPR_TSTATE_I	wrpr	%r17, 0x002d, %tstate
	.word 0xbda80820  ! 3439: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb1480000  ! 3442: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb2ad4000  ! 3443: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xbba00540  ! 3448: FSQRTd	fsqrt	
	.word 0xb9a4c840  ! 3449: FADDd	faddd	%f50, %f0, %f28
	.word 0xb7aa4820  ! 3451: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00520  ! 3453: FSQRTs	fsqrt	
	.word 0xb5a80820  ! 3454: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbda40960  ! 3456: FMULq	dis not found

	.word 0xb5a50860  ! 3457: FADDq	dis not found

	.word 0x8d95e0cf  ! 3458: WRPR_PSTATE_I	wrpr	%r23, 0x00cf, %pstate
	.word 0x85956085  ! 3462: WRPR_TSTATE_I	wrpr	%r21, 0x0085, %tstate
	.word 0xb5a449c0  ! 3463: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xbcbd0000  ! 3465: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xb615e063  ! 3467: OR_I	or 	%r23, 0x0063, %r27
	.word 0xbdaa8820  ! 3468: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3472: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3479: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda449e0  ! 3481: FDIVq	dis not found

	.word 0xbba549e0  ! 3484: FDIVq	dis not found

	.word 0xb1a409c0  ! 3485: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xbfa81420  ! 3486: FMOVRNZ	dis not found

	.word 0xb7480000  ! 3487: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1a90820  ! 3488: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a5c8c0  ! 3491: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb1a8c820  ! 3492: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5a90820  ! 3493: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c9c0  ! 3494: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xbe9cc000  ! 3496: XORcc_R	xorcc 	%r19, %r0, %r31
	.word 0xb9a508e0  ! 3500: FSUBq	dis not found

	.word 0xb9aac820  ! 3502: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aac820  ! 3505: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5518000  ! 3506: RDPR_PSTATE	<illegal instruction>
	.word 0x8195e19c  ! 3507: WRPR_TPC_I	wrpr	%r23, 0x019c, %tpc
	setx	data_start_1, %g1, %r23
	.word 0x8795e062  ! 3512: WRPR_TT_I	wrpr	%r23, 0x0062, %tt
	.word 0xb93d2001  ! 3516: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0x8594a000  ! 3517: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbab8820  ! 3534: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c9c0  ! 3535: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb1510000  ! 3539: RDPR_TICK	<illegal instruction>
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 3547: FMOVRLZ	dis not found

	.word 0xb1a00560  ! 3550: FSQRTq	fsqrt	
	.word 0xb8148000  ! 3553: OR_R	or 	%r18, %r0, %r28
	.word 0xb1a80820  ! 3554: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbb3ce001  ! 3557: SRA_I	sra 	%r19, 0x0001, %r29
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3564: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0x9195609a  ! 3565: WRPR_PIL_I	wrpr	%r21, 0x009a, %pil
	.word 0x8d952056  ! 3566: WRPR_PSTATE_I	wrpr	%r20, 0x0056, %pstate
	.word 0x8994e0f0  ! 3567: WRPR_TICK_I	wrpr	%r19, 0x00f0, %tick
	.word 0xb5a88820  ! 3568: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00560  ! 3569: FSQRTq	fsqrt	
	.word 0xbda8c820  ! 3572: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c9a0  ! 3574: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb1a589c0  ! 3577: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb7a489e0  ! 3578: FDIVq	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 3580: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba9c820  ! 3581: FMOVVS	fmovs	%fcc1, %f0, %f29
	setx	0x3013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb01ce048  ! 3587: XOR_I	xor 	%r19, 0x0048, %r24
	.word 0xb9504000  ! 3588: RDPR_TNPC	<illegal instruction>
	.word 0xbba80820  ! 3589: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb82de179  ! 3595: ANDN_I	andn 	%r23, 0x0179, %r28
	.word 0xb534b001  ! 3598: SRLX_I	srlx	%r18, 0x0001, %r26
	.word 0xb42c8000  ! 3601: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xb1a48840  ! 3603: FADDd	faddd	%f18, %f0, %f24
	.word 0xb5a4c9a0  ! 3605: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb1a40940  ! 3606: FMULd	fmuld	%f16, %f0, %f24
	.word 0xbda4c8a0  ! 3612: FSUBs	fsubs	%f19, %f0, %f30
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c960  ! 3620: FMULq	dis not found

	.word 0xb7a408a0  ! 3627: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xb3a5c920  ! 3628: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbba589c0  ! 3630: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbba9c820  ! 3633: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5504000  ! 3635: RDPR_TNPC	<illegal instruction>
	.word 0xbe04a08a  ! 3636: ADD_I	add 	%r18, 0x008a, %r31
	.word 0xb9ab4820  ! 3638: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xba448000  ! 3641: ADDC_R	addc 	%r18, %r0, %r29
	setx	data_start_5, %g1, %r23
	.word 0xbba489a0  ! 3646: FDIVs	fdivs	%f18, %f0, %f29
	setx	data_start_2, %g1, %r21
	setx	0x3031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946103  ! 3649: WRPR_PIL_I	wrpr	%r17, 0x0103, %pil
	.word 0xbe9d6176  ! 3653: XORcc_I	xorcc 	%r21, 0x0176, %r31
	.word 0xbf500000  ! 3654: RDPR_TPC	<illegal instruction>
	.word 0xbda4c840  ! 3655: FADDd	faddd	%f50, %f0, %f30
	.word 0xb63ca0ab  ! 3657: XNOR_I	xnor 	%r18, 0x00ab, %r27
	.word 0xb5aa8820  ! 3659: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbf518000  ! 3661: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa80820  ! 3664: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba81820  ! 3671: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb3a548e0  ! 3672: FSUBq	dis not found

	.word 0x8595a1b9  ! 3675: WRPR_TSTATE_I	wrpr	%r22, 0x01b9, %tstate
	.word 0xb6bd0000  ! 3678: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xb83420db  ! 3679: ORN_I	orn 	%r16, 0x00db, %r28
	.word 0xb5510000  ! 3681: RDPR_TICK	<illegal instruction>
	.word 0xb3a48860  ! 3682: FADDq	dis not found

	.word 0xbe444000  ! 3684: ADDC_R	addc 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f19  ! 3687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f19, %hpstate
	.word 0xb1510000  ! 3690: RDPR_TICK	<illegal instruction>
	.word 0xbda40940  ! 3691: FMULd	fmuld	%f16, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982fc3  ! 3692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0xbfa54940  ! 3693: FMULd	fmuld	%f52, %f0, %f62
	setx	data_start_5, %g1, %r18
	.word 0xbc9dc000  ! 3695: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0x8d94e17c  ! 3699: WRPR_PSTATE_I	wrpr	%r19, 0x017c, %pstate
	.word 0x8194217d  ! 3702: WRPR_TPC_I	wrpr	%r16, 0x017d, %tpc
	.word 0xb7ab0820  ! 3704: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9508000  ! 3708: RDPR_TSTATE	<illegal instruction>
	.word 0xbd508000  ! 3710: RDPR_TSTATE	<illegal instruction>
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195612d  ! 3714: WRPR_PIL_I	wrpr	%r21, 0x012d, %pil
	.word 0xbd510000  ! 3716: RDPR_TICK	<illegal instruction>
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 3726: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xbf510000  ! 3727: RDPR_TICK	<illegal instruction>
	.word 0xb7a408c0  ! 3728: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xbf643801  ! 3733: MOVcc_I	<illegal instruction>
	.word 0xb9a509c0  ! 3738: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xb3a81c20  ! 3740: FMOVRGEZ	dis not found

	.word 0xbb508000  ! 3741: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a508c0  ! 3744: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xbc248000  ! 3747: SUB_R	sub 	%r18, %r0, %r30
	setx	0x230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 3752: FMOVLE	fmovs	%fcc1, %f0, %f24
	setx	0x112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32d0000  ! 3755: SLL_R	sll 	%r20, %r0, %r25
	.word 0xb6b4c000  ! 3757: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xbb520000  ! 3758: RDPR_PIL	<illegal instruction>
	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 3765: FDIVq	dis not found

	.word 0xb5aac820  ! 3766: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a44840  ! 3769: FADDd	faddd	%f48, %f0, %f56
	.word 0xb3aa8820  ! 3774: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x8595a0a6  ! 3776: WRPR_TSTATE_I	wrpr	%r22, 0x00a6, %tstate
	.word 0xbba98820  ! 3777: FMOVNEG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81983999  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1999, %hpstate
	.word 0xb7a5c920  ! 3783: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb7a80c20  ! 3785: FMOVRLZ	dis not found

	.word 0xb9518000  ! 3787: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3795: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 3799: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a88820  ! 3802: FMOVLE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a94820  ! 3805: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a4c8c0  ! 3807: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xbfa00020  ! 3810: FMOVs	fmovs	%f0, %f31
	.word 0xbbab8820  ! 3811: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a50860  ! 3812: FADDq	dis not found

	.word 0xbd51c000  ! 3815: RDPR_TL	<illegal instruction>
	.word 0xbfaa0820  ! 3817: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa4820  ! 3821: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb7480000  ! 3822: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbfa81820  ! 3825: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982b93  ! 3826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0xb7508000  ! 3833: RDPR_TSTATE	<illegal instruction>
	.word 0xb9359000  ! 3834: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xbba44940  ! 3836: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb1520000  ! 3837: RDPR_PIL	<illegal instruction>
	.word 0xb72c0000  ! 3839: SLL_R	sll 	%r16, %r0, %r27
	.word 0xbab42083  ! 3845: ORNcc_I	orncc 	%r16, 0x0083, %r29
	setx	data_start_5, %g1, %r20
	.word 0xbfa94820  ! 3848: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb97da401  ! 3849: MOVR_I	movre	%r22, 0x1, %r28
	.word 0xbfa80820  ! 3850: FMOVN	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 3851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e051  ! 3855: WRPR_PSTATE_I	wrpr	%r19, 0x0051, %pstate
	.word 0xb951c000  ! 3857: RDPR_TL	<illegal instruction>
	.word 0x9194619a  ! 3858: WRPR_PIL_I	wrpr	%r17, 0x019a, %pil
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 3863: FMOVd	fmovd	%f0, %f62
	.word 0xb7a90820  ! 3866: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb551c000  ! 3869: RDPR_TL	rdpr	%tl, %r26
	.word 0xb2bdc000  ! 3870: XNORcc_R	xnorcc 	%r23, %r0, %r25
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 3877: RDPR_PIL	<illegal instruction>
	.word 0xb3ab0820  ! 3880: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba00540  ! 3883: FSQRTd	fsqrt	
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 3890: SRLX_R	srlx	%r19, %r0, %r27
	.word 0xb03d0000  ! 3891: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xbfa90820  ! 3902: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00040  ! 3903: FMOVd	fmovd	%f0, %f26
	.word 0xbbabc820  ! 3904: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02d0000  ! 3909: ANDN_R	andn 	%r20, %r0, %r24
	.word 0xbfa98820  ! 3911: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda98820  ! 3918: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba5c820  ! 3920: FADDs	fadds	%f23, %f0, %f29
	.word 0xb37c8400  ! 3922: MOVR_R	movre	%r18, %r0, %r25
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 3929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xb734a001  ! 3930: SRL_I	srl 	%r18, 0x0001, %r27
	.word 0xbd520000  ! 3932: RDPR_PIL	<illegal instruction>
	.word 0xb951c000  ! 3934: RDPR_TL	<illegal instruction>
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 3938: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a94820  ! 3941: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb0358000  ! 3943: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xbba00540  ! 3945: FSQRTd	fsqrt	
	.word 0xb2bdc000  ! 3947: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xb7a58840  ! 3954: FADDd	faddd	%f22, %f0, %f58
	.word 0xb5ab8820  ! 3957: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a9c820  ! 3958: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xba2c4000  ! 3959: ANDN_R	andn 	%r17, %r0, %r29
	.word 0x8d9561b1  ! 3960: WRPR_PSTATE_I	wrpr	%r21, 0x01b1, %pstate
	.word 0x8d94a1a2  ! 3965: WRPR_PSTATE_I	wrpr	%r18, 0x01a2, %pstate
	.word 0xb9504000  ! 3967: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3969: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb51c000  ! 3970: RDPR_TL	<illegal instruction>
	.word 0xb5a5c8a0  ! 3973: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xbe9d8000  ! 3976: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb3a40820  ! 3979: FADDs	fadds	%f16, %f0, %f25
	.word 0xb52d9000  ! 3980: SLLX_R	sllx	%r22, %r0, %r26
	.word 0xb3510000  ! 3981: RDPR_TICK	<illegal instruction>
	.word 0xbda9c820  ! 3985: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 3986: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb7a408a0  ! 3987: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbd510000  ! 3988: RDPR_TICK	<illegal instruction>
	.word 0x8194617a  ! 3990: WRPR_TPC_I	wrpr	%r17, 0x017a, %tpc
	.word 0xb5a80420  ! 3991: FMOVRZ	dis not found

	.word 0xbda00520  ! 3999: FSQRTs	fsqrt	
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 4011: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb551c000  ! 4013: RDPR_TL	<illegal instruction>
	.word 0xbbaa4820  ! 4014: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5540000  ! 4016: RDPR_GL	<illegal instruction>
	.word 0xbda5c9e0  ! 4020: FDIVq	dis not found

	.word 0xb7ab4820  ! 4021: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb7540000  ! 4027: RDPR_GL	<illegal instruction>
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4030: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80c20  ! 4034: FMOVRLZ	dis not found

	.word 0xbda88820  ! 4037: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1aac820  ! 4039: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a40960  ! 4041: FMULq	dis not found

	.word 0xbfa84820  ! 4042: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 4048: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 4049: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a123  ! 4060: WRPR_TPC_I	wrpr	%r18, 0x0123, %tpc
	.word 0xb335e001  ! 4068: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xb3340000  ! 4069: SRL_R	srl 	%r16, %r0, %r25
	.word 0xb9a40940  ! 4073: FMULd	fmuld	%f16, %f0, %f28
	setx	data_start_6, %g1, %r22
	.word 0xb5a9c820  ! 4078: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda00040  ! 4080: FMOVd	fmovd	%f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb550c000  ! 4082: RDPR_TT	<illegal instruction>
	.word 0xb9ab4820  ! 4083: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3abc820  ! 4086: FMOVVC	fmovs	%fcc1, %f0, %f25
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 4089: FMOVs	fmovs	%f0, %f31
	.word 0xbb504000  ! 4091: RDPR_TNPC	<illegal instruction>
	.word 0xbba8c820  ! 4092: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbeb5a0b7  ! 4104: SUBCcc_I	orncc 	%r22, 0x00b7, %r31
	.word 0xb9a8c820  ! 4108: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbf540000  ! 4112: RDPR_GL	<illegal instruction>
	.word 0xb5a448e0  ! 4113: FSUBq	dis not found

	.word 0xb52d8000  ! 4114: SLL_R	sll 	%r22, %r0, %r26
	.word 0xb9a40860  ! 4124: FADDq	dis not found

	.word 0xb9a44920  ! 4125: FMULs	fmuls	%f17, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 4127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a48960  ! 4129: FMULq	dis not found

	.word 0xb9aa4820  ! 4130: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a8c820  ! 4132: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbf35e001  ! 4134: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xbfa80820  ! 4135: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb81c0000  ! 4138: XOR_R	xor 	%r16, %r0, %r28
	.word 0xb3a00520  ! 4139: FSQRTs	fsqrt	
	.word 0xb5a44940  ! 4141: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb5aa4820  ! 4143: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbf2de001  ! 4144: SLL_I	sll 	%r23, 0x0001, %r31
	.word 0xbfaac820  ! 4148: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 4149: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81420  ! 4150: FMOVRNZ	dis not found

	.word 0xb750c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xb1a8c820  ! 4157: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 4159: RDPR_GL	<illegal instruction>
	.word 0x85956062  ! 4161: WRPR_TSTATE_I	wrpr	%r21, 0x0062, %tstate
	.word 0xb5a98820  ! 4162: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb335c000  ! 4168: SRL_R	srl 	%r23, %r0, %r25
	.word 0xbf50c000  ! 4171: RDPR_TT	<illegal instruction>
	.word 0x81952093  ! 4172: WRPR_TPC_I	wrpr	%r20, 0x0093, %tpc
	setx	data_start_6, %g1, %r20
	.word 0xb5a509c0  ! 4177: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xbb480000  ! 4180: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbbaa0820  ! 4181: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda84820  ! 4183: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0x8994e126  ! 4184: WRPR_TICK_I	wrpr	%r19, 0x0126, %tick
	setx	0x20020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4190: FSQRTq	fsqrt	
	.word 0xb61de184  ! 4191: XOR_I	xor 	%r23, 0x0184, %r27
	.word 0xbda40820  ! 4194: FADDs	fadds	%f16, %f0, %f30
	.word 0xbfab4820  ! 4195: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a40840  ! 4196: FADDd	faddd	%f16, %f0, %f24
	.word 0x8395604c  ! 4198: WRPR_TNPC_I	wrpr	%r21, 0x004c, %tnpc
	.word 0xb89d8000  ! 4202: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb9a00540  ! 4209: FSQRTd	fsqrt	
	.word 0xbba98820  ! 4212: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4219: RDPR_TPC	<illegal instruction>
	.word 0xbd359000  ! 4220: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xb5ab8820  ! 4223: FMOVPOS	fmovs	%fcc1, %f0, %f26
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a58960  ! 4225: FMULq	dis not found

	.word 0xbd500000  ! 4226: RDPR_TPC	<illegal instruction>
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81982b03  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b03, %hpstate
	.word 0xb5a549c0  ! 4232: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbba588a0  ! 4234: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xbf500000  ! 4236: RDPR_TPC	<illegal instruction>
	.word 0xb135b001  ! 4238: SRLX_I	srlx	%r22, 0x0001, %r24
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 4242: FMOVL	fmovs	%fcc1, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 4243: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb508000  ! 4245: RDPR_TSTATE	<illegal instruction>
	.word 0xb1ab4820  ! 4248: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa48940  ! 4249: FMULd	fmuld	%f18, %f0, %f62
	.word 0x8d9560b4  ! 4251: WRPR_PSTATE_I	wrpr	%r21, 0x00b4, %pstate
	mov	0, %r12
	.word 0x8f932000  ! 4253: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb0bc2117  ! 4254: XNORcc_I	xnorcc 	%r16, 0x0117, %r24
	.word 0xb6a40000  ! 4255: SUBcc_R	subcc 	%r16, %r0, %r27
	.word 0xb9518000  ! 4256: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xb9a80c20  ! 4261: FMOVRLZ	dis not found

	.word 0xb53d5000  ! 4263: SRAX_R	srax	%r21, %r0, %r26
	.word 0xbfa48860  ! 4265: FADDq	dis not found

	.word 0xb7a4c8a0  ! 4266: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb5aa8820  ! 4267: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb72ca001  ! 4270: SLL_I	sll 	%r18, 0x0001, %r27
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa549c0  ! 4274: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xbba508c0  ! 4275: FSUBd	fsubd	%f20, %f0, %f60
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 4288: RDPR_PIL	<illegal instruction>
	.word 0xbd510000  ! 4292: RDPR_TICK	<illegal instruction>
	.word 0xb7ab4820  ! 4293: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c960  ! 4294: FMULq	dis not found

	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 4299: FADDd	faddd	%f18, %f0, %f56
	.word 0x819520e5  ! 4303: WRPR_TPC_I	wrpr	%r20, 0x00e5, %tpc
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3aa4820  ! 4320: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c940  ! 4327: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb1343001  ! 4328: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xbfa00020  ! 4329: FMOVs	fmovs	%f0, %f31
	.word 0xb3a88820  ! 4331: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a107  ! 4340: WRPR_TNPC_I	wrpr	%r22, 0x0107, %tnpc
	.word 0xb5520000  ! 4341: RDPR_PIL	<illegal instruction>
	.word 0x8194e164  ! 4346: WRPR_TPC_I	wrpr	%r19, 0x0164, %tpc
	.word 0xb1a409e0  ! 4347: FDIVq	dis not found

	.word 0x8995a075  ! 4349: WRPR_TICK_I	wrpr	%r22, 0x0075, %tick
	.word 0xb350c000  ! 4352: RDPR_TT	<illegal instruction>
	.word 0x8195212e  ! 4354: WRPR_TPC_I	wrpr	%r20, 0x012e, %tpc
	.word 0xb9a80c20  ! 4355: FMOVRLZ	dis not found

	.word 0xb1a00520  ! 4361: FSQRTs	fsqrt	
	.word 0xb5a5c960  ! 4362: FMULq	dis not found

	setx	data_start_6, %g1, %r22
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 4366: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfa90820  ! 4375: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9ab4820  ! 4376: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3abc820  ! 4379: FMOVVC	fmovs	%fcc1, %f0, %f25
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982999  ! 4384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0xb0b4a141  ! 4385: SUBCcc_I	orncc 	%r18, 0x0141, %r24
	.word 0xbc850000  ! 4386: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xbda489e0  ! 4388: FDIVq	dis not found

	.word 0xbc3dc000  ! 4390: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb5a81820  ! 4391: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x9194211d  ! 4392: WRPR_PIL_I	wrpr	%r16, 0x011d, %pil
	.word 0x9195a067  ! 4394: WRPR_PIL_I	wrpr	%r22, 0x0067, %pil
	.word 0xb3aa0820  ! 4395: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb03d4000  ! 4397: XNOR_R	xnor 	%r21, %r0, %r24
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ac21d8  ! 4399: ANDNcc_I	andncc 	%r16, 0x01d8, %r28
	.word 0xb1aa0820  ! 4400: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb3a54920  ! 4402: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb7ab8820  ! 4403: FMOVPOS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 4405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	setx	data_start_2, %g1, %r23
	.word 0xb1a548e0  ! 4417: FSUBq	dis not found

	.word 0xb1a81820  ! 4419: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	data_start_5, %g1, %r16
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879460c8  ! 4428: WRPR_TT_I	wrpr	%r17, 0x00c8, %tt
	.word 0xbc04a1d1  ! 4429: ADD_I	add 	%r18, 0x01d1, %r30
	.word 0x8d9420b7  ! 4432: WRPR_PSTATE_I	wrpr	%r16, 0x00b7, %pstate
	.word 0xb7a509e0  ! 4434: FDIVq	dis not found

	.word 0xb645e1e3  ! 4436: ADDC_I	addc 	%r23, 0x01e3, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a81820  ! 4439: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa9c820  ! 4440: FMOVVS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 4441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	.word 0xb5a48920  ! 4442: FMULs	fmuls	%f18, %f0, %f26
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 4446: FMOVRLZ	dis not found

	.word 0x8994a01b  ! 4449: WRPR_TICK_I	wrpr	%r18, 0x001b, %tick
	.word 0xbcb4a140  ! 4451: SUBCcc_I	orncc 	%r18, 0x0140, %r30
	.word 0xb5a00540  ! 4452: FSQRTd	fsqrt	
	.word 0x919420ec  ! 4453: WRPR_PIL_I	wrpr	%r16, 0x00ec, %pil
	.word 0xbba40860  ! 4457: FADDq	dis not found

	.word 0xb0bc8000  ! 4463: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xb151c000  ! 4470: RDPR_TL	<illegal instruction>
	.word 0xbba81c20  ! 4471: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab0820  ! 4483: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbda94820  ! 4486: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a44820  ! 4490: FADDs	fadds	%f17, %f0, %f24
	.word 0xb3a509a0  ! 4494: FDIVs	fdivs	%f20, %f0, %f25
	.word 0x839460cd  ! 4495: WRPR_TNPC_I	wrpr	%r17, 0x00cd, %tnpc
	.word 0xb5a9c820  ! 4496: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb2144000  ! 4501: OR_R	or 	%r17, %r0, %r25
	.word 0xb014e199  ! 4505: OR_I	or 	%r19, 0x0199, %r24
	.word 0xb9540000  ! 4506: RDPR_GL	<illegal instruction>
	.word 0xb1a81820  ! 4508: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x2001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4513: RDPR_TT	<illegal instruction>
	setx	0x219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4515: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xba346149  ! 4518: SUBC_I	orn 	%r17, 0x0149, %r29
	.word 0xb93d3001  ! 4520: SRAX_I	srax	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983f01  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f01, %hpstate
	.word 0x81946029  ! 4522: WRPR_TPC_I	wrpr	%r17, 0x0029, %tpc
	.word 0xb9a48920  ! 4524: FMULs	fmuls	%f18, %f0, %f28
	.word 0xb1a409e0  ! 4529: FDIVq	dis not found

	.word 0xba05a079  ! 4536: ADD_I	add 	%r22, 0x0079, %r29
	.word 0xb7aac820  ! 4539: FMOVGE	fmovs	%fcc1, %f0, %f27
	setx	0x30031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899421ee  ! 4541: WRPR_TICK_I	wrpr	%r16, 0x01ee, %tick
	.word 0xb9520000  ! 4542: RDPR_PIL	<illegal instruction>
	.word 0xb3a00540  ! 4543: FSQRTd	fsqrt	
	.word 0xbdaa8820  ! 4545: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8595a11a  ! 4546: WRPR_TSTATE_I	wrpr	%r22, 0x011a, %tstate
	.word 0xb3a84820  ! 4551: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00020  ! 4557: FMOVs	fmovs	%f0, %f31
	.word 0xb62da0a1  ! 4559: ANDN_I	andn 	%r22, 0x00a1, %r27
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982811  ! 4564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0811, %hpstate
	.word 0xbfab8820  ! 4565: FMOVPOS	fmovs	%fcc1, %f0, %f31
	setx	0x20010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194601b  ! 4577: WRPR_TPC_I	wrpr	%r17, 0x001b, %tpc
	.word 0xbba98820  ! 4579: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a88820  ! 4580: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb9641800  ! 4581: MOVcc_R	<illegal instruction>
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a099  ! 4584: WRPR_TT_I	wrpr	%r22, 0x0099, %tt
	.word 0xb7a81420  ! 4586: FMOVRNZ	dis not found

	.word 0xbc85a108  ! 4590: ADDcc_I	addcc 	%r22, 0x0108, %r30
	setx	data_start_6, %g1, %r21
	.word 0xbf518000  ! 4595: RDPR_PSTATE	<illegal instruction>
	.word 0xbbaa8820  ! 4598: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a54860  ! 4599: FADDq	dis not found

	.word 0xb7500000  ! 4600: RDPR_TPC	<illegal instruction>
	.word 0xb7a00540  ! 4601: FSQRTd	fsqrt	
	.word 0xb4adc000  ! 4604: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xbba8c820  ! 4608: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda5c9c0  ! 4609: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb950c000  ! 4611: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 4612: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc454000  ! 4614: ADDC_R	addc 	%r21, %r0, %r30
	mov	2, %r12
	.word 0x8f932000  ! 4615: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982fc9  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc9, %hpstate
	.word 0xb7a84820  ! 4621: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	data_start_1, %g1, %r22
	.word 0xbfa81820  ! 4628: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb7abc820  ! 4630: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00040  ! 4631: FMOVd	fmovd	%f0, %f56
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xb1a54920  ! 4634: FMULs	fmuls	%f21, %f0, %f24
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a408e0  ! 4643: FSUBq	dis not found

	.word 0xbda00020  ! 4644: FMOVs	fmovs	%f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 4645: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 4648: RDPR_TICK	<illegal instruction>
	.word 0xb7a409a0  ! 4654: FDIVs	fdivs	%f16, %f0, %f27
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa588c0  ! 4669: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xbfa80420  ! 4671: FMOVRZ	dis not found

	.word 0xbd520000  ! 4672: RDPR_PIL	<illegal instruction>
	.word 0xbba50840  ! 4674: FADDd	faddd	%f20, %f0, %f60
	.word 0xb825e091  ! 4675: SUB_I	sub 	%r23, 0x0091, %r28
	.word 0xb9ab4820  ! 4679: FMOVCC	fmovs	%fcc1, %f0, %f28
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839560d8  ! 4682: WRPR_TNPC_I	wrpr	%r21, 0x00d8, %tnpc
	.word 0xb3a00040  ! 4684: FMOVd	fmovd	%f0, %f56
	.word 0xb9504000  ! 4689: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4694: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5510000  ! 4698: RDPR_TICK	<illegal instruction>
	.word 0xb7a00020  ! 4699: FMOVs	fmovs	%f0, %f27
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 4705: FSQRTd	fsqrt	
	.word 0xb3aa8820  ! 4709: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x8594a022  ! 4710: WRPR_TSTATE_I	wrpr	%r18, 0x0022, %tstate
	.word 0xbba588c0  ! 4711: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xbb540000  ! 4713: RDPR_GL	<illegal instruction>
	.word 0xb5a88820  ! 4716: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x8595606a  ! 4717: WRPR_TSTATE_I	wrpr	%r21, 0x006a, %tstate
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 4720: FSQRTd	fsqrt	
	.word 0xb9a509e0  ! 4722: FDIVq	dis not found

	.word 0xbe340000  ! 4724: SUBC_R	orn 	%r16, %r0, %r31
	setx	data_start_0, %g1, %r21
	.word 0xb8acc000  ! 4726: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xb9a00520  ! 4727: FSQRTs	fsqrt	
	.word 0x8194a1f4  ! 4728: WRPR_TPC_I	wrpr	%r18, 0x01f4, %tpc
	.word 0xbb2c2001  ! 4729: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb1a00020  ! 4731: FMOVs	fmovs	%f0, %f24
	.word 0xb7a48920  ! 4735: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb5a9c820  ! 4736: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a84820  ! 4738: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c8e0  ! 4742: FSUBq	dis not found

	.word 0xb9aa0820  ! 4746: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbc0c2039  ! 4748: AND_I	and 	%r16, 0x0039, %r30
	setx	0x3030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xbb518000  ! 4754: RDPR_PSTATE	<illegal instruction>
	.word 0x8d9561fb  ! 4755: WRPR_PSTATE_I	wrpr	%r21, 0x01fb, %pstate
	.word 0xbda00560  ! 4760: FSQRTq	fsqrt	
	.word 0xb7ab8820  ! 4763: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a9c820  ! 4766: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb80da1b8  ! 4768: AND_I	and 	%r22, 0x01b8, %r28
	.word 0xb5a00540  ! 4771: FSQRTd	fsqrt	
	.word 0xb9a4c920  ! 4773: FMULs	fmuls	%f19, %f0, %f28
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	.word 0xbfab8820  ! 4777: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb4ad60b6  ! 4778: ANDNcc_I	andncc 	%r21, 0x00b6, %r26
	.word 0xb1a589e0  ! 4788: FDIVq	dis not found

	.word 0xb7a48840  ! 4790: FADDd	faddd	%f18, %f0, %f58
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc15c000  ! 4793: OR_R	or 	%r23, %r0, %r30
	.word 0xb3510000  ! 4795: RDPR_TICK	<illegal instruction>
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 4799: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbd2dd000  ! 4800: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xbda448a0  ! 4802: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb3540000  ! 4805: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 4806: RDPR_TNPC	<illegal instruction>
	.word 0xb41c8000  ! 4808: XOR_R	xor 	%r18, %r0, %r26
	.word 0xbbab4820  ! 4809: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb1518000  ! 4810: RDPR_PSTATE	<illegal instruction>
	.word 0x899420b5  ! 4813: WRPR_TICK_I	wrpr	%r16, 0x00b5, %tick
	.word 0xbba9c820  ! 4825: FMOVVS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 4827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xbfa58820  ! 4828: FADDs	fadds	%f22, %f0, %f31
	.word 0xbfa94820  ! 4829: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbda00520  ! 4830: FSQRTs	fsqrt	
	.word 0xb9a50860  ! 4834: FADDq	dis not found

	.word 0xbba88820  ! 4838: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbb510000  ! 4839: RDPR_TICK	<illegal instruction>
	.word 0xb7480000  ! 4844: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x9194e17c  ! 4845: WRPR_PIL_I	wrpr	%r19, 0x017c, %pil
	.word 0xb350c000  ! 4850: RDPR_TT	<illegal instruction>
	.word 0xb1a4c920  ! 4851: FMULs	fmuls	%f19, %f0, %f24
	.word 0xbbaa0820  ! 4854: FMOVA	fmovs	%fcc1, %f0, %f29
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 4864: FMOVGE	fmovs	%fcc1, %f0, %f26
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 4868: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfa44960  ! 4869: FMULq	dis not found

	.word 0xb3a94820  ! 4870: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa80820  ! 4871: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb5540000  ! 4876: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e11  ! 4884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e11, %hpstate
	.word 0xbda4c820  ! 4885: FADDs	fadds	%f19, %f0, %f30
	.word 0xbba509e0  ! 4886: FDIVq	dis not found

	.word 0xb7a81420  ! 4891: FMOVRNZ	dis not found

	.word 0xb9540000  ! 4893: RDPR_GL	<illegal instruction>
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 4898: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0xbebce0a8  ! 4899: XNORcc_I	xnorcc 	%r19, 0x00a8, %r31
	.word 0xb63c21e0  ! 4903: XNOR_I	xnor 	%r16, 0x01e0, %r27
	.word 0x8794e10a  ! 4906: WRPR_TT_I	wrpr	%r19, 0x010a, %tt
	.word 0xb1a449c0  ! 4907: FDIVd	fdivd	%f48, %f0, %f24
	.word 0xb5a84820  ! 4908: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8595a0d3  ! 4911: WRPR_TSTATE_I	wrpr	%r22, 0x00d3, %tstate
	.word 0xb3a80820  ! 4915: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9a90820  ! 4921: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb1abc820  ! 4925: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a5c920  ! 4927: FMULs	fmuls	%f23, %f0, %f28
	.word 0xbba00540  ! 4929: FSQRTd	fsqrt	
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 4931: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbbab8820  ! 4934: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a90820  ! 4936: FMOVLEU	fmovs	%fcc1, %f0, %f24
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3df001  ! 4945: SRAX_I	srax	%r23, 0x0001, %r30
	.word 0xbba4c8c0  ! 4946: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb3a508a0  ! 4948: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb7a00020  ! 4950: FMOVs	fmovs	%f0, %f27
	.word 0xbc95602a  ! 4951: ORcc_I	orcc 	%r21, 0x002a, %r30
	.word 0xbba589a0  ! 4953: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb7480000  ! 4957: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba00040  ! 4959: FMOVd	fmovd	%f0, %f60
	.word 0xbda00560  ! 4961: FSQRTq	fsqrt	
	.word 0xbba408a0  ! 4962: FSUBs	fsubs	%f16, %f0, %f29
	.word 0x89956112  ! 4965: WRPR_TICK_I	wrpr	%r21, 0x0112, %tick
	.word 0xbfa5c860  ! 4970: FADDq	dis not found

	.word 0xb3a00540  ! 4972: FSQRTd	fsqrt	
	.word 0xb7a48840  ! 4974: FADDd	faddd	%f18, %f0, %f58
	.word 0xbd480000  ! 4977: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa508c0  ! 4978: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb9a509a0  ! 4979: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb3a00520  ! 4986: FSQRTs	fsqrt	
	.word 0xbb480000  ! 4987: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3a44960  ! 4989: FMULq	dis not found

	.word 0xb0b5e013  ! 4990: SUBCcc_I	orncc 	%r23, 0x0013, %r24
	.word 0xb1500000  ! 4993: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 4994: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 4995: RDPR_TSTATE	<illegal instruction>
	.word 0xb5aa8820  ! 4998: FMOVG	fmovs	%fcc1, %f0, %f26

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	ta	T_GOOD_TRAP
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0x9d65c30c2990f82b
	.xword	0xe6af0900687ee640
	.xword	0x39740b954aa181bb
	.xword	0x6364c13408c687f0
	.xword	0x918e0cd0a41d86f0
	.xword	0x68911004d064f0f6
	.xword	0xc4066e5a412af782
	.xword	0xffc57d2bed9abc0e
	.xword	0x630a5986971ff20e
	.xword	0x9b379fd780f06ec9
	.xword	0xee2c9c727c22219b
	.xword	0xd1820bcf51e96049
	.xword	0x827c680bf2d7c656
	.xword	0x931a6468c39b91ba
	.xword	0xbde0613892b055eb
	.xword	0xfb9603cb17ba6396
	.xword	0x03e9f8d1baa8c878
	.xword	0x6760d490146d08c6
	.xword	0x071bb885acc677d1
	.xword	0xa02bced1fbdc93f6
	.xword	0xe58654db0b6100d4
	.xword	0x4d686b2bdd790c33
	.xword	0xb8921ab5830bb8a2
	.xword	0x90962f6d96e96737
	.xword	0xa5d1e126bfd38b89
	.xword	0xce8538a8b149e0a0
	.xword	0xb3e00580c0afa9d3
	.xword	0x5bfcbb39b0e401cd
	.xword	0xcbfbb4537ca535db
	.xword	0x507101b62138e86e
	.xword	0x1d06e3b68464fbc6
	.xword	0xbcb4cac8ef948606
	.xword	0xb383d8bbb5be329d
	.xword	0xe59b681a31276c9f
	.xword	0x1315439a3e8c98d2
	.xword	0xfe84261c990b414c
	.xword	0x03df7c8b6e5d14f9
	.xword	0xc6acd198a03753c7
	.xword	0xf99a1845c8f52bc7
	.xword	0x6c7757f2039e2c37
	.xword	0x05742017a0bbdef2
	.xword	0x2f098666a970f89a
	.xword	0x88b2e7a38ad8099b
	.xword	0x9b6ee3ff33a52893
	.xword	0x42ca569b08cc4ebb
	.xword	0x9dea300b16e06299
	.xword	0xee078ee07925f5a4
	.xword	0x0c9824b84f0e5954
	.xword	0x925f7146fe314aad
	.xword	0x6af37813c8ea8ef7
	.xword	0xdf66a63226675635
	.xword	0xe0b5993dfab2c3c8
	.xword	0x08260d6ab801b954
	.xword	0xed2112a44dc62bf7
	.xword	0x14017a1aef3e0602
	.xword	0x9abefd1c7089b397
	.xword	0x0350a6d51e830ed5
	.xword	0xf59189fa830a5211
	.xword	0x0603696506e66f94
	.xword	0x02642e7bf67c1602
	.xword	0xc349a294ee05aa71
	.xword	0xcdfa90c1e7dcde26
	.xword	0x1f41369540c17dc5
	.xword	0x3a4cc35fc2abac60
	.xword	0x6304701db1e8699c
	.xword	0xdf493519caa2af34
	.xword	0x24a4d9f0937ee2b0
	.xword	0x82a1381f0a2f0ab6
	.xword	0x0cc5ea35c073452a
	.xword	0x45523196b5325986
	.xword	0x519d7b5d625f7bdb
	.xword	0x30bc1ce017f3d19d
	.xword	0xb2d2ce3e78a54592
	.xword	0xc2f708d3d9e3f45a
	.xword	0x5be814501cecf176
	.xword	0x0e705cce88292098
	.xword	0xc8fc1c45e24eb028
	.xword	0x6435b947c67f4c54
	.xword	0xc71faae062a56cf0
	.xword	0xa42b780ca6879a12
	.xword	0xd2ef996dc8b4b69e
	.xword	0x0e6d4675159342ba
	.xword	0x05126da38920fac5
	.xword	0x0724ea3f382b38dc
	.xword	0xdabb130dea711ed2
	.xword	0x9f94d66acb038af4
	.xword	0xf90bf94c30158e6c
	.xword	0xd24e6d071b298564
	.xword	0xd44402bcd33ff2e6
	.xword	0x71fffcafd07329fc
	.xword	0x605440f5b256f5c0
	.xword	0x09eede672022eb00
	.xword	0x0f421ccfef8b9582
	.xword	0xce81fb48f42d1a28
	.xword	0x573665f21fd83879
	.xword	0xdca61eb5e01c73c2
	.xword	0x8ca026b385c5dcc3
	.xword	0x8e96a5123fc1d404
	.xword	0x410c4c828e6ac7d1
	.xword	0x01c9461c0ff8ab4a
	.xword	0x167d6d77a2c86b9c
	.xword	0x83f5e8c6a66e107d
	.xword	0x6a960e29df5c3a7a
	.xword	0x975ba2c1392ce907
	.xword	0xf022d7d8a62230bc
	.xword	0x47472a1329886484
	.xword	0xe49e9d8045c27580
	.xword	0x192af3697bb49888
	.xword	0xd7264210c602f14e
	.xword	0xd6129be859543739
	.xword	0x82d61cd979aa9803
	.xword	0xddf69a970bc536fd
	.xword	0xe59fe8b27946fa98
	.xword	0xaa6d67e4065dcb67
	.xword	0xd5723fb05c6618f6
	.xword	0xd26ea674ec63f7f6
	.xword	0x7fadea6cfb4776ca
	.xword	0x75779157bea71ad2
	.xword	0x2b8d625e7b5e6e5d
	.xword	0x0cfc34488c39a08f
	.xword	0xc92139aaf2c2406a
	.xword	0x2162e6719b015522
	.xword	0xd4106d5c69ef2bb3
	.xword	0x6b0e6eb6693061cf
	.xword	0x5d2a582dfc7a5bc7
	.xword	0x4c4dbb14a6443d76
	.xword	0xe63aeb3a30082b33
	.xword	0x50b59fbec50c3995
	.xword	0x3cfcd6104ca42e1a
	.xword	0x16a62a2212690220
	.xword	0x55749b7e6f3fa8d4
	.xword	0x4101940287572d56
	.xword	0x903011d65b9161fc
	.xword	0xc8731b13f082ea32
	.xword	0x9d6a2d7eaaaf45c4
	.xword	0x2872394b16d13eb0
	.xword	0xf496798d242b0ee9
	.xword	0x029bed1e7c598d33
	.xword	0x08e0b3165666edad
	.xword	0x5bc1cf552842bf99
	.xword	0xc65c949162740cf8
	.xword	0x1d6ef44a816f972f
	.xword	0x333ad91b53b438da
	.xword	0xcfe0518fa22e2e65
	.xword	0xcc86f86665d3d7cc
	.xword	0xc640f75119f63b8b
	.xword	0x917c414b44644e52
	.xword	0xac963c0db481560b
	.xword	0x35d206b544836d7f
	.xword	0xd86bb2d44839a830
	.xword	0x0b2e779ee706984c
	.xword	0x0d17a4a166f82127
	.xword	0x8fcdb2b3262c63ee
	.xword	0xef6475801ebf3eec
	.xword	0x02d3ed24db7a9808
	.xword	0xca8b37ea073ccf4b
	.xword	0x8688516b6d46017d
	.xword	0x64a2febf525cb3bd
	.xword	0x6aa27a5ae443692e
	.xword	0xbacf4e8d067852de
	.xword	0x062544cf31bfaf62
	.xword	0x46b9b8a1ccdb4998
	.xword	0x2ded364de79cc7da
	.xword	0xddaa16bd218349fd
	.xword	0x9d55d690cfb182c3
	.xword	0x439cbc17f4428413
	.xword	0x573b9bae4e06c9d5
	.xword	0x6d4b97b697fb8285
	.xword	0x3af8805482f5de58
	.xword	0xfb38f8c765b443a1
	.xword	0xca8c3781302c6a82
	.xword	0x086e86da901e0f4b
	.xword	0x2896a875149d963f
	.xword	0x5ff39bab983c2f71
	.xword	0x8bd6f21a5e12a067
	.xword	0x36b07b0d90ae74f1
	.xword	0x13676b1db9e5c8b4
	.xword	0x745d712f1ff52ec9
	.xword	0x1b4402af8da62f6a
	.xword	0x9b13266c63e8970b
	.xword	0x52586e34076a458a
	.xword	0x6e34f0a1fbc4061c
	.xword	0x9fd30769308d5d8d
	.xword	0xe9ba0f3232b320d3
	.xword	0x177376a35a396b96
	.xword	0x33afcba812090c26
	.xword	0x9d7aa1f077d99f0f
	.xword	0x1cc0b9b7accc8bc6
	.xword	0x2a87c7dfd72f5cb8
	.xword	0x70844fb2ac899eb6
	.xword	0x1179284f25a0ff9c
	.xword	0x7f16f319611198a3
	.xword	0x5f46779ca18898b0
	.xword	0xef689aca764d334e
	.xword	0x013d693bfa1180fb
	.xword	0x7c3904d9b955d1b0
	.xword	0xb0f9532d2346f2e4
	.xword	0x61eb3065c44bbd89
	.xword	0x3969d59447d05620
	.xword	0x281e724d3cff9f8d
	.xword	0xc7e08fe29173375b
	.xword	0xbe4da8ac8c89875e
	.xword	0xc2f33f9bc80df2e8
	.xword	0xc5c94cd236b12040
	.xword	0xcc6021a745621b72
	.xword	0x8d7d9801dbffe85e
	.xword	0xeee9025c7e1a2c5c
	.xword	0xfe3ca89f7d6cb94c
	.xword	0xae4cb6a7a58ebf90
	.xword	0x86d468dafb0e258a
	.xword	0x1b2c7730385e38a5
	.xword	0xde1b953d036c5394
	.xword	0x1931081273bcf78b
	.xword	0x0765dc0227eb2c2a
	.xword	0x90c581513a9d6317
	.xword	0x4edc9d0a3fa6c305
	.xword	0xd0dde61ea14c55e9
	.xword	0xea5de65c074279df
	.xword	0xc5ce403a819cdf5b
	.xword	0x347b227968e89736
	.xword	0x218e0d0ea92192c7
	.xword	0x482628cc31f0e372
	.xword	0xca7e4d4a515523ae
	.xword	0x13d112fa25af282d
	.xword	0x4d1597615c2bcb54
	.xword	0x1132e0d6a7b9dfdd
	.xword	0x0332137b1099de70
	.xword	0xe6bc32bcc01f6532
	.xword	0x096ecd8738606f1b
	.xword	0xae32fcc4af314461
	.xword	0xed254cebd5e7cf3f
	.xword	0xf9330ce07876593d
	.xword	0xb74162cbd528b15c
	.xword	0x258f82b0d613bf81
	.xword	0x222c0b151aa11a9d
	.xword	0xf9a75c9fe58de22f
	.xword	0xe72c5a5645b8e79c
	.xword	0x5f6a522a4ee5e52a
	.xword	0x77db3ec0156d4940
	.xword	0xcb675970f3c6b0e9
	.xword	0x907014919b42a072
	.xword	0xc8968c696d4c0db8
	.xword	0x0fcfaa638050442c
	.xword	0x62055ff09bceecf7
	.xword	0x19049a93e55de74e
	.xword	0x18f243a5d22bd395
	.xword	0xf7fae9fcfd23c89d
	.xword	0x80212dd10541a3fb
	.xword	0x5b821ab60ef62e11
	.xword	0x1e52b57d104c0aab
	.xword	0xe40c113dfdbc2ab2
	.xword	0x375e50e847854d97
	.xword	0x6396ea8cbc571954
	.xword	0xaccdaa7ed6d3fa21
	.xword	0x855e5bde3026d023
	.xword	0xa20e393f46765f17
	.align 0x2000
	.data
data_start_1:

	.xword	0x8c2ebdc155cdec3a
	.xword	0x473b65ccec998053
	.xword	0xd31948046df04bcd
	.xword	0xaa314436223c4d67
	.xword	0xe972b8ab111bded2
	.xword	0x3485c075ddda6119
	.xword	0x6224b385a713535f
	.xword	0xfb873c15cbcbb991
	.xword	0x07ea3b3e6fe1b6cf
	.xword	0x6bdf33c3d0a7f6bc
	.xword	0x4630e94f495320ac
	.xword	0x7b32d22686369f4c
	.xword	0xe79bc9bed095b89e
	.xword	0x57a803c8c7e3be35
	.xword	0x88a4236519f7d3ff
	.xword	0xd31bafdd497dab7f
	.xword	0x59ee1e8fc178c687
	.xword	0xb97e212ebb7201a9
	.xword	0xc2bf393bf973c023
	.xword	0x98e576b43994dbc8
	.xword	0x03999f010aa315da
	.xword	0x3e7f5ad12ceac8e1
	.xword	0x0c7659af1a2b10d8
	.xword	0xbe9743180ddf3994
	.xword	0x47c5dea87afa1f8e
	.xword	0xd74934ca90e66d1d
	.xword	0x792b5878f779efbb
	.xword	0x8c0bb24f9d55baff
	.xword	0x2553e011eabddb55
	.xword	0xfc52b95ca369c4aa
	.xword	0x1cd5a08105488b8d
	.xword	0xe22c6c3a4b820814
	.xword	0xac5ccd3c1e7e9d5d
	.xword	0x77d594ff5794fd6e
	.xword	0xa23f650a4a03fed6
	.xword	0x2ea482582b1ed3d1
	.xword	0x040864fd39793d39
	.xword	0xffe109ca67c5923b
	.xword	0x01aaaf118586dfbb
	.xword	0x06a2b24dafcb5f13
	.xword	0x43da3181ce9c3bcc
	.xword	0x8aca21bc812bd76d
	.xword	0x058dc5f968098450
	.xword	0x05865daff37416e4
	.xword	0x16c6b1cce2f6d71b
	.xword	0x501df84fbafd700d
	.xword	0x5272a253842221f0
	.xword	0xaf2bc1f9d5aba05d
	.xword	0x9c985ecb3bdaf605
	.xword	0x47d34b7b35b0c669
	.xword	0x9a4c0b37d56279d2
	.xword	0xf586d6346965040e
	.xword	0x8e7af346a1d4752c
	.xword	0x5d3b6d24e854e29c
	.xword	0x84c91c53844410cd
	.xword	0xf9e23139264fb44b
	.xword	0xbacecd0587a6ad03
	.xword	0xbd4ee60d7c2028d9
	.xword	0xbbcee5be046b7696
	.xword	0x5c0e2ae85419dc49
	.xword	0x77b5d32201f4424b
	.xword	0xf0aa7b53ec4f7021
	.xword	0x604937b859e15e6b
	.xword	0xd9896f1c6d3c2d17
	.xword	0x6477c0341e03bace
	.xword	0xac00d9a35a004d9a
	.xword	0xdebc66e27afa8fbd
	.xword	0xc5aa87e718a037ea
	.xword	0xdedc174a3bdc6a05
	.xword	0xbedc3ce22c9aac5a
	.xword	0x11efce5760d4ac27
	.xword	0x29855dbb3d2c8df4
	.xword	0xe40d58ad43046db9
	.xword	0x0165362fb073d1a7
	.xword	0x56d85c40c37b91c9
	.xword	0x997337ba482e4efd
	.xword	0xe5f770ed4f6e1673
	.xword	0x95ec6a83a4dd6e3c
	.xword	0x8a1ec02ffb7d468c
	.xword	0x6a420fc5251a1d8a
	.xword	0x8f42edd0497666b1
	.xword	0x5670a3942ab484cf
	.xword	0xe0b66aac49b09665
	.xword	0xe113592f49250256
	.xword	0x04b651fd61cb700f
	.xword	0xc89c1d2941474967
	.xword	0x9d5fff0d1da469a8
	.xword	0x42850be16a2135cb
	.xword	0x8db1dfc45595f43c
	.xword	0xbb91a22d2963154f
	.xword	0xf0f499e28b976157
	.xword	0x93056022ca6d002e
	.xword	0x486b65e2f969c206
	.xword	0x5aa28129f6939139
	.xword	0xd0ccdd380e69548e
	.xword	0x3ca978434a719be7
	.xword	0x6bae472a22dcc3ec
	.xword	0xff421cdd7a9af159
	.xword	0xfc6d66347161e128
	.xword	0x6f7c8ccb14333d3e
	.xword	0xe30ae9b0d5ea650b
	.xword	0xc56b99ab54edb11e
	.xword	0xe62de879df346a99
	.xword	0x0ab418483714c2eb
	.xword	0x3215c52612cf69f9
	.xword	0x926f09f85d6b9c03
	.xword	0xd5cd1bd01cec1c1f
	.xword	0xbeb38839392bbe14
	.xword	0xf9b568c863725884
	.xword	0x6a9cd6890367910f
	.xword	0xe0d93388aff20bdb
	.xword	0x8d5428377fbaeca2
	.xword	0x3bdf28e10db13d2b
	.xword	0x5cb02d5865a54bf9
	.xword	0x12f01d30b0a9dcb8
	.xword	0x5b89cec465ec7f0f
	.xword	0x07446ba8996903c6
	.xword	0x44fa51cc473aa743
	.xword	0x54df914de6f3d6f9
	.xword	0xa7eac62557742767
	.xword	0xa6358cd5d0c9f71d
	.xword	0xc9cb031e38f16a0a
	.xword	0x14e207042a3e543c
	.xword	0x56a90b02fff078d4
	.xword	0x531366a6383a633c
	.xword	0x5b7d1ac4a0835348
	.xword	0x5bf184921ffb795f
	.xword	0x47e709164b467a21
	.xword	0x3643cd670f509f7b
	.xword	0x73576bcce18a7d36
	.xword	0x7911dca189184876
	.xword	0xfe04845097037902
	.xword	0xebba16221e44b839
	.xword	0xeaf2c94a2dba2cf7
	.xword	0xd022929c126692c4
	.xword	0x884dd3073ca61377
	.xword	0x9195e66ad8a8d3f5
	.xword	0x5880a9e83521c484
	.xword	0x9aec7301ba48fcd6
	.xword	0x3892e233913a7225
	.xword	0xe9f316f208f70d63
	.xword	0x6fb49bfff802cc14
	.xword	0xbd2e5636d4862598
	.xword	0xeb0dff34e80a7f7f
	.xword	0x75b9f61a0c079aa8
	.xword	0x9c4ca332bd1872bb
	.xword	0x25d17da12e86c0eb
	.xword	0x374cde23fd7afcf6
	.xword	0xb4539262287995cd
	.xword	0x0dec6fced87288d9
	.xword	0xfe03ebedec101798
	.xword	0xcbfd8017770074de
	.xword	0xfb2d36b64898df93
	.xword	0xdd2b96050aaed0d8
	.xword	0xb971652cc3cae0a0
	.xword	0x4585f684c5dee003
	.xword	0xf1ec08a860afd9f4
	.xword	0x6590e4fcdd188fb4
	.xword	0xe7132d1b644185a0
	.xword	0xf8b7528333e6ed4e
	.xword	0x5653c2149909eac7
	.xword	0x75e0fbd20c02c346
	.xword	0x8143ed699d3f2c16
	.xword	0xdd91e47e82d383bc
	.xword	0x4a6d3f9e692c44f8
	.xword	0xedf299e0dd41b4de
	.xword	0x90c06dea29b744fc
	.xword	0xddadca8be496503b
	.xword	0x3aae39c0c4af6ed0
	.xword	0xca6ec8783bedb24d
	.xword	0xd550ba1967f86c79
	.xword	0x2352e66910bedf1c
	.xword	0x7f52693240155867
	.xword	0xd262afe519dade83
	.xword	0x03fc795386c15807
	.xword	0x310e2d219ced5862
	.xword	0xb771ca6471a14548
	.xword	0x6b5de3759898f2b4
	.xword	0xd1d78ff2162aa771
	.xword	0x21484f1321c4edef
	.xword	0x4a33ddf60c934081
	.xword	0x7b695e492482fa75
	.xword	0x173293e10009b57e
	.xword	0x90216650b48e62fb
	.xword	0x730718f5c8781b5c
	.xword	0x01019e800cd254e1
	.xword	0xf4863e40ce9cb3f0
	.xword	0x3f175005090dc5b8
	.xword	0x763b237e333d28cf
	.xword	0xeaae2f6b20ec75f5
	.xword	0x966f884dab6a8b28
	.xword	0xb89b22f47019fdcd
	.xword	0x7336ddfebf32dc1f
	.xword	0xee66edc8d63049ee
	.xword	0x0014ab7819d16c87
	.xword	0x835fe3a05be50a5f
	.xword	0xaafdd3ff305511eb
	.xword	0x006b4a3235c0cac7
	.xword	0x0afa6240b3a41a6e
	.xword	0x0555e5befa411d30
	.xword	0x191d2548f4cf2498
	.xword	0xecc1e22562b476ed
	.xword	0xf45c95bfb231f9ce
	.xword	0x39b8b97aa5248ee2
	.xword	0x7618e6b9b852e2c5
	.xword	0xcec5201f0d0b10fa
	.xword	0x7cfe5aafe8621b22
	.xword	0x0745bbe419a51045
	.xword	0xe22eb85ed2bb1ebe
	.xword	0xeda4a5b015462d33
	.xword	0x300347bc72d73999
	.xword	0x1cdd851dd148b3be
	.xword	0x04f9bf9a2a009c29
	.xword	0xb2b5cbe13bbb28eb
	.xword	0xf7b536d9d6a2da81
	.xword	0x07ec614e21122b62
	.xword	0xea884e6147c0b42f
	.xword	0x9846cf3383c29aea
	.xword	0xe657d722341970ad
	.xword	0xf629b70793e6abdf
	.xword	0x3e972a7af10271a7
	.xword	0x5d32b845bcd87f68
	.xword	0x367aff5798f256df
	.xword	0x4bfad9c69d36d280
	.xword	0x766075599146946d
	.xword	0xf266c7f5943524da
	.xword	0x50bcdfe6ef3ab5c7
	.xword	0x948c2d1435112a76
	.xword	0xddb1171a3eb66743
	.xword	0xe856eef58e8ef284
	.xword	0x4aa356def723ec76
	.xword	0xed203ed9d8358cef
	.xword	0x176e2c3e19a9af9e
	.xword	0x10c776713a31b7ce
	.xword	0xc7c174ad7ef662b6
	.xword	0x8ad0decadb9c0d1d
	.xword	0x1b934921648fa3aa
	.xword	0xaa9a4c234f12f21e
	.xword	0x44ba27bc8e42ea27
	.xword	0x13c5526011c73656
	.xword	0xf1812825e1a723cd
	.xword	0xe06b726cc92564dd
	.xword	0x1bb51e8060bd9738
	.xword	0xfa50790419f0984c
	.xword	0xb4bc80c068fb2157
	.xword	0x49c698c1353e978c
	.xword	0x8e2f7e964e3a74bd
	.xword	0xd31f8657a03207c3
	.xword	0xd159db918c1634bd
	.xword	0xb52d3378ac63b2f9
	.xword	0x92d369b3beacecd9
	.xword	0x5892ccb3542388f0
	.xword	0xfe626db727db5930
	.xword	0x0233305c10e7e452
	.xword	0x646751ec53eb117f
	.xword	0xb9e36e7c60df4b8a
	.align 0x4000
	.data
data_start_2:

	.xword	0x1a6be6e47e928cc9
	.xword	0xcd087cbc45612f1d
	.xword	0x0142006474caa479
	.xword	0x6d91c29fead76f98
	.xword	0xc33d85cba91b7fa1
	.xword	0x990c8e7ce1da468f
	.xword	0xd5a50c054c8b6cb9
	.xword	0x831a8fadb749352c
	.xword	0xc54b18acab8c1f0a
	.xword	0x11c879af26334c4e
	.xword	0xde51f81739fefa2d
	.xword	0x0ad43fef27e47df4
	.xword	0xe57bd09d460ee414
	.xword	0xa4b3e416b2941354
	.xword	0x84dde8cf11590eee
	.xword	0x56f5d4c0f89dfeeb
	.xword	0xc23c6fd8dcc82c65
	.xword	0x4e4449363527f787
	.xword	0x61d54b3e6fa5c120
	.xword	0xecea9bd6fa026c8d
	.xword	0x4275aa33b3dd22b2
	.xword	0x4fbaf0bcac3c88eb
	.xword	0x369a3f211b0c6732
	.xword	0x95c4413e038b7df1
	.xword	0x8ab0ebcdfaffd427
	.xword	0xb4672bb7832f0866
	.xword	0x902bafd8a76a5b09
	.xword	0x1905ec8389316462
	.xword	0x29fe6ea42d3c3b84
	.xword	0x51a169da3a1db780
	.xword	0x23e2ca0771f8d49f
	.xword	0x8c38c412d66e4c6b
	.xword	0xee45cde640ed7c58
	.xword	0xf0408c8d5deaee56
	.xword	0x5f0964b8f003fffb
	.xword	0x9c057c27e9a10719
	.xword	0x0db8f33510ed1c2a
	.xword	0x8d31a9a9bab3450d
	.xword	0xb16fb7e2f4bc2f35
	.xword	0x652506f3cfbe9626
	.xword	0xbe0a2c4699c2e34a
	.xword	0x305da27549023da4
	.xword	0x45ba75d133a1634e
	.xword	0x5d14cd0d90eeacbd
	.xword	0xc27a2353d4066a83
	.xword	0x662319155419f999
	.xword	0x25dc9ca639ca4578
	.xword	0x9ba88c29d0284b18
	.xword	0xed58939e7ee58c77
	.xword	0x51fc028f4d52823f
	.xword	0x68bb14fc395c6c9e
	.xword	0xa96a3c330e2e5467
	.xword	0xaf321e7fe83b4a94
	.xword	0x505ee376c6b3691c
	.xword	0x23bb3517009aafaa
	.xword	0x33645ac9d53a5f83
	.xword	0xe4e8769f374e6c77
	.xword	0x0bb9f3fbaa28d241
	.xword	0xf2370861663b30c0
	.xword	0x9ae1c4e766f53272
	.xword	0xd6bade76074dae14
	.xword	0xa18df0ab3c761b30
	.xword	0x94a2958aa93acc18
	.xword	0x566af5aeb9a57624
	.xword	0xe39e6278b2dac338
	.xword	0x98eddaf8bf1145c8
	.xword	0x235be11c6d4ae5d1
	.xword	0xd6c7a8298f370131
	.xword	0x9b2b7fcc0c74e91d
	.xword	0x9531611bb5095bdd
	.xword	0xb618bb2ee952c56e
	.xword	0x599063d4e0482ec2
	.xword	0x4875c9a0295ebf80
	.xword	0x94e26df9f7a024bf
	.xword	0xfcbbbfc87309d0d2
	.xword	0xb10c3edf5d3f8c8b
	.xword	0x3b2d6508261f3210
	.xword	0x20e51866879f5c86
	.xword	0x2b5a2327494599c4
	.xword	0x37802713058d739b
	.xword	0x64708a781ccea042
	.xword	0xea4d79323e877d39
	.xword	0xc1732201088d833e
	.xword	0x95e8e246cefe0d11
	.xword	0xf093eeb5d20752f2
	.xword	0x229398003f89f325
	.xword	0xc2c5b89e64ae11ba
	.xword	0x32db1712242fd801
	.xword	0xd2cb02140ca15932
	.xword	0x03ba480c9b7069cd
	.xword	0x76abb3f29826eb8e
	.xword	0xac7f155bf267d6df
	.xword	0xf0d8691f8fb1e32b
	.xword	0xfc8ced2e359307fd
	.xword	0x39da5c0f4a86cf12
	.xword	0xb67726fd554abb6e
	.xword	0x5880b009fe9af5ce
	.xword	0x76ebd57d5838006d
	.xword	0x24924df182778cd4
	.xword	0xaa5ec25b8d92d1b8
	.xword	0x84ad6e653cd5a898
	.xword	0x8044fafbe6a77134
	.xword	0xabede3564da6eec4
	.xword	0xcdd3a4021743ff34
	.xword	0x0d777077ef3fc573
	.xword	0x9d3c68de03ecd296
	.xword	0x9cba282ff47fc957
	.xword	0x522eb5f75ef2cd9f
	.xword	0x7f2d1241a5f1bee5
	.xword	0x01fea839d9edd305
	.xword	0xfc6c5bca2e77a4a0
	.xword	0x0ce1754b4be40615
	.xword	0x899ddb7fbfe6798f
	.xword	0x9fa99609814b1ea9
	.xword	0xe3562a0efd8d9ea9
	.xword	0xe2975f8bb69a6dde
	.xword	0xddfa3d2894aaa4ed
	.xword	0x91cf66544f7bfab8
	.xword	0x99f2506fd276f204
	.xword	0x1fb0b097cd421f84
	.xword	0x734830c50f8529cf
	.xword	0xa7a9aff1d96634a0
	.xword	0x8236a3bdc3324ba1
	.xword	0x3c14b513404edd68
	.xword	0xdc1a11b8b36ef293
	.xword	0x72e5b3710b82faed
	.xword	0xbfc7d4fba3c48461
	.xword	0xe8ba4025b69a8c2e
	.xword	0x89db063ec184fe76
	.xword	0x10f603fc9fe46ce7
	.xword	0x35a9b8a204c7b745
	.xword	0x86359332616742bf
	.xword	0xe767de11aecf1c53
	.xword	0xfd425b81a4b85a03
	.xword	0xba05411b73322d0e
	.xword	0x4547909ff8f5889b
	.xword	0x1fa858c6da9a2998
	.xword	0x629cc671cde5ed5d
	.xword	0x3f2994763f410ff1
	.xword	0x17a06145d292191b
	.xword	0xb8d602bf4d890d23
	.xword	0x5889185739b223cd
	.xword	0xe5e9ff6f67012731
	.xword	0xbfc2851c63cedda6
	.xword	0xba71f9b52ebd2787
	.xword	0xd38c8bef38db9139
	.xword	0x86951b8a3bcb1f0a
	.xword	0x7830e96ef32e3b5e
	.xword	0x7077ec3b21ff7a22
	.xword	0x06f210ca50a52893
	.xword	0x735b727a13b11191
	.xword	0x55bd2482e0eee2ab
	.xword	0x44b8b178f2c67ee9
	.xword	0x7746276bea7e34fa
	.xword	0x17990e355f4147b6
	.xword	0x8ad6282bcfc35c67
	.xword	0xbe5f9b464c7535f6
	.xword	0xde6403ec56d9cd8c
	.xword	0x03eb8d4822ccd9dc
	.xword	0x80ea5c301bf10e93
	.xword	0x09fbb2755c918752
	.xword	0x5189fd6dd6b8f415
	.xword	0xee0b16552c7d9d2c
	.xword	0x6a8e4359bc094e52
	.xword	0x153a6a78a1233d92
	.xword	0x19565121409e2023
	.xword	0x20be24a6451953de
	.xword	0x5933869098bcfc5e
	.xword	0x8ede6297d2c37c6c
	.xword	0x6021970132f31868
	.xword	0xd40a6c795f39c4f5
	.xword	0x4d9b19badde9b23d
	.xword	0x693cad987e988fce
	.xword	0x2cb6b437e20bcc42
	.xword	0xe3e1447e07ecc1a3
	.xword	0xb18f630356f3d215
	.xword	0x2026a8a36ac240a6
	.xword	0x7e0bec134a66fe35
	.xword	0xb05e904ee5c8b505
	.xword	0xac77700f04598d80
	.xword	0xd35791f505baf80f
	.xword	0x0db9ef962b0df01b
	.xword	0xcfbe559a4c025bac
	.xword	0x734f0518db21ea49
	.xword	0x76b6c63788741e75
	.xword	0xe16e79036d90cb50
	.xword	0x661236e2e8091995
	.xword	0x545ebcad07dcf0c1
	.xword	0x058f35d8266090b3
	.xword	0x3a5209099fe58803
	.xword	0x9a221cd7f750dc0c
	.xword	0x068ea2d98af0df96
	.xword	0x38861827a008ab19
	.xword	0xbaee6054291e66dc
	.xword	0x907ab7f400a92e7b
	.xword	0xb1ad5b74a3b5c5a4
	.xword	0xa9906e460d1c15c6
	.xword	0x9d4fbc9fc8fc22a2
	.xword	0x47b867d629d64005
	.xword	0x235a691b7916290c
	.xword	0x6f09f89c46afb482
	.xword	0xe3ce0ab45856cd78
	.xword	0xb9ada08ffd5df6da
	.xword	0xe8b66a295b07ff0b
	.xword	0x8c3cfe22fab3be34
	.xword	0x5e986cc29408d9d4
	.xword	0xaccaee9c8c2fb0b1
	.xword	0x84827cfa1fb871fc
	.xword	0xf08abc8dc2207f6c
	.xword	0xeea133fdb41fb884
	.xword	0xaf6c10abef06caff
	.xword	0xa19b08af5e5730ca
	.xword	0xb6f4e48fa5622c0d
	.xword	0x82153d3cb9e7195b
	.xword	0xf693d2c4ce761a10
	.xword	0xdb7c553c7f6577a6
	.xword	0x4905500752a0f0b2
	.xword	0x4957d655e520f78e
	.xword	0x323ae99adc97d33a
	.xword	0xd5513131b1fd09d1
	.xword	0xcb4eb243187d7303
	.xword	0xdd21f2578e112e61
	.xword	0x494f2b25b2a4f9ee
	.xword	0x5a142faa2ccf91af
	.xword	0xaa0f2d1b6386b1c2
	.xword	0x125af7f937d22af6
	.xword	0x5d07f8073e882566
	.xword	0x363f2340fff826b6
	.xword	0x49ba4f9f58050fca
	.xword	0xc1d164e4cd61a883
	.xword	0x5d9b8b5cb0d0cd95
	.xword	0xc2aaf3e6b72cf324
	.xword	0x0c74abe843a25565
	.xword	0xe40533c1f699588d
	.xword	0xb004bfd1e9dff7c3
	.xword	0x8825769796cb1647
	.xword	0x87d4a81d6e6bceb4
	.xword	0x979783b370ef1ae8
	.xword	0x515a47348ad7ae48
	.xword	0xbe2e2c74137b06e8
	.xword	0x021317a872c59dd5
	.xword	0x3356f10a6e2cfb4b
	.xword	0x47aaf025429ff398
	.xword	0x4427fe57d2a2e58a
	.xword	0xf8a418d5e74802c4
	.xword	0xe284f13e169511cf
	.xword	0x5e4cbe414b4b7ae6
	.xword	0xf62d1b926f071881
	.xword	0xbfb4ab74c202d1d4
	.xword	0x25cbe1f576224923
	.xword	0xc0321080f94eec4e
	.xword	0xce0c9d34f465167b
	.xword	0x1ce9feb536a55097
	.xword	0x32a731d692d461db
	.xword	0x30f9c605a1915e9a
	.xword	0x033993adbbbc2668
	.align 0x8000
	.data
data_start_3:

	.xword	0x72786ef212b798cc
	.xword	0xd469534c49ff5e5d
	.xword	0xfd2fb0c16f3083ba
	.xword	0xdc5ca0a4fac5494d
	.xword	0x31b94f5946465f1b
	.xword	0x491e57db33f534bd
	.xword	0xe08b50534ab50bef
	.xword	0x42393a4ad3ae15d9
	.xword	0xa089522d2253d674
	.xword	0x241391e659b2b5c2
	.xword	0xa6f3b59bf3081045
	.xword	0xebda3e65d7089d84
	.xword	0xa4740e0d72479cb7
	.xword	0x5bac766a9d327bf7
	.xword	0x9e8161ab95ab1821
	.xword	0x79dd13ff09fcac62
	.xword	0x4dd02d5b8fa07e73
	.xword	0xecbbc28451b47bd2
	.xword	0x0045f7a01879ec90
	.xword	0xb301b14f3bfd2e26
	.xword	0x6287727c8b046d22
	.xword	0x4b36d31f551f3120
	.xword	0xcc08b97810220779
	.xword	0xfa7880acf819b478
	.xword	0x3db4e794e60fc529
	.xword	0x39660871dc6a16ce
	.xword	0x8e71185ab23789e9
	.xword	0x8fd8ec987d8803f2
	.xword	0xa8641eed74efa378
	.xword	0x5dcc56b8531bffac
	.xword	0x677bba0d9d0311eb
	.xword	0xb9ee71619c61d5e2
	.xword	0xd8a5a0f6d7b57326
	.xword	0x67e2b50d52dcdd03
	.xword	0x927dc098e5bdeeb9
	.xword	0x673d9809c437144c
	.xword	0x2a3a5d3311a35061
	.xword	0xd85fd8aeeabeb13c
	.xword	0x4d023223119cb43f
	.xword	0x0a4966fa92d38ba1
	.xword	0xd0074f0ed4385bea
	.xword	0xf1c08dcb7e24cc68
	.xword	0x1d4b5b57f07d9b33
	.xword	0xc1f54252b4dee343
	.xword	0xd770cf3565e8cdf3
	.xword	0x4aca715595788a9c
	.xword	0x2888bdaf239429bc
	.xword	0xf4420983da78e309
	.xword	0xbe3f5a4baa18c303
	.xword	0xe632299584a19327
	.xword	0xbd55e93bf752b2fc
	.xword	0x0a708eb28b1eadcf
	.xword	0xeb1b4c91b8f8532d
	.xword	0xdde6e19f62aef2aa
	.xword	0x9a8170aa66b1c600
	.xword	0x307af90df79f658c
	.xword	0xf93439c1a760853a
	.xword	0x0c75f13325b8f6eb
	.xword	0x95799a3a56a4e687
	.xword	0xeee6dfff692b48ff
	.xword	0x605fc93ad7e8f1a7
	.xword	0x77bbae82128432bb
	.xword	0xfb56fc5ecfcdf1ef
	.xword	0x4e358eb5314e03c9
	.xword	0x92cf198effcc6bb3
	.xword	0x53d6acf3a2df7c58
	.xword	0x231d089b95b47b7e
	.xword	0xcd68361b1fdab94a
	.xword	0x64ef7e4f54a9e754
	.xword	0x50b240190a565af0
	.xword	0x581034c399add6d3
	.xword	0xfb28c7de18d78d90
	.xword	0xb9a4c647a0b80c96
	.xword	0xae2b226c8c206ec3
	.xword	0x2a01444229b8508d
	.xword	0x1c9aa58fd0147333
	.xword	0xe1cb9233a2e206ef
	.xword	0x2521eb70fa97a19f
	.xword	0xe9a2807127fff57f
	.xword	0x43fd234dafb1d939
	.xword	0xb5527088cad5a348
	.xword	0xf302c72f21178160
	.xword	0x0bcfe4f043351c67
	.xword	0x30820e77eebe52e5
	.xword	0xfe74226647cddfd1
	.xword	0x21a803ae57fc40e4
	.xword	0x2d4a29c4e330a4cf
	.xword	0x78840025563c90e5
	.xword	0x768e07ccba89a97b
	.xword	0xe6dd4c5b5c0ce6a7
	.xword	0xce6321388d8145ed
	.xword	0xf66aabac93be2782
	.xword	0xcc3b94ed14e17e24
	.xword	0x0af9830378c7090d
	.xword	0x515588a96e3945c1
	.xword	0x14f1706ffbefca1a
	.xword	0x1555075486403e73
	.xword	0x397111527775eb20
	.xword	0xf803dcd3df3d4f46
	.xword	0x43f92d54e20df385
	.xword	0x70ecf114a560cc00
	.xword	0x0c67401b46df2f79
	.xword	0xfc791c4ea28b4622
	.xword	0x21f670cc17efce32
	.xword	0x1d42bbd3b2cc8f2c
	.xword	0x9c0b8a0f535ccd70
	.xword	0x83d77cf633ec2e6f
	.xword	0xadce93a61ce5e311
	.xword	0x9660f5fa6a20e2d5
	.xword	0x5624fd5fee4570d3
	.xword	0x9bc4ebd140333b65
	.xword	0x59937817dd4a24e4
	.xword	0xc1c400f52798d149
	.xword	0x3c9acb6f7ce981b5
	.xword	0x6a3887179671a115
	.xword	0x53054ab4da14a5e9
	.xword	0x852458c94eac5d22
	.xword	0xad355b95a5c8eec8
	.xword	0x45027d68a7572970
	.xword	0xdd2704d217f02cda
	.xword	0xe0ab2bd7a4a2bf4a
	.xword	0x897f0112c9405476
	.xword	0x6a43ff877cf7c25a
	.xword	0xf41f7336073525cf
	.xword	0x273c59db15cd8564
	.xword	0x78873c5fc11b7728
	.xword	0xf0588d1699646bfc
	.xword	0xadd575934da503f9
	.xword	0xf0f8c2124be8d3d3
	.xword	0x062a9a2f4bcc8e83
	.xword	0xf6a8ac37bd5dc38b
	.xword	0xc81e7fe5178f8f6c
	.xword	0xf5c415f1f165a5e1
	.xword	0xc7c694acf4882d81
	.xword	0x637cb8610425941f
	.xword	0x837946c047e88de2
	.xword	0xd915bb55038b29cd
	.xword	0x7732aee585b5d02c
	.xword	0x5bd1bae506c8427c
	.xword	0xbb9cb9d14f54f0b0
	.xword	0x972ab3f92fc5a9c3
	.xword	0xcc598ec037de0311
	.xword	0xda6af7f1d9c10c27
	.xword	0xdbfdf7906515b0bf
	.xword	0x32c8c9130181c315
	.xword	0x718f33715fab4ed5
	.xword	0x1004d02cb84bf9e0
	.xword	0xa68e4108560da6fb
	.xword	0xc2b047ac7e4e75be
	.xword	0xee8bbdadb14abfe7
	.xword	0xd063a79f008b255b
	.xword	0xfbafe0cc97ac3b70
	.xword	0x17f668d8b3ffd791
	.xword	0xf07ca0f5058f1a5f
	.xword	0x897af935aa472169
	.xword	0x3b4e18792401d6de
	.xword	0x6754f4caacdf853a
	.xword	0xaba76d63ea9ab835
	.xword	0x462fdf5d73877383
	.xword	0xd10981ce4dde1654
	.xword	0x7661bc4a8dbb0a16
	.xword	0xee83c4473ec5640e
	.xword	0xed85e1a54d7f3404
	.xword	0xf2534db0da89f13d
	.xword	0x1dc43dd1e4f10c47
	.xword	0xfb9454d2c268ed89
	.xword	0xb3b0097de8891178
	.xword	0xfdaee9c0522abada
	.xword	0x775e16da3eaad337
	.xword	0xcdd1a0ee217c3908
	.xword	0x09bcc0da2d45bef0
	.xword	0x3585cc97914bf1ed
	.xword	0x5b9a52b6bc4becba
	.xword	0x99d64bd39dc813d3
	.xword	0x704fc7938d140655
	.xword	0x7d2ebd9a4f840804
	.xword	0x652f84a6f58dac35
	.xword	0x42a2e574e0664319
	.xword	0x66d7489d9b0df86f
	.xword	0xc231a7bba2a6a20c
	.xword	0x3307d434e237dbcd
	.xword	0xa2c1afd7ce3d2956
	.xword	0x78d16b848221a68a
	.xword	0xa16b07bd7f0839cb
	.xword	0xe18738f3160ec748
	.xword	0x232abc863c8a72ab
	.xword	0xfd46f889dbd08f94
	.xword	0xa3c18684c7a839ad
	.xword	0x5063e900fd43e284
	.xword	0xc4daf25b04739b03
	.xword	0x2294cc8099828833
	.xword	0x26d9441f09ec104f
	.xword	0x43751c5a73374bbf
	.xword	0x95385f399fbf0f5b
	.xword	0xf94187633b78c7e0
	.xword	0x51d5b588575916bd
	.xword	0x32e355c933d18bd0
	.xword	0x0b6e06b65a3fcab1
	.xword	0x29e530b510c3bf14
	.xword	0x08cd4a553df53a08
	.xword	0xd1021421297c1aae
	.xword	0x8217cfc04f861e69
	.xword	0x5578622f12949d85
	.xword	0x1770ffa28f03f052
	.xword	0x0132a627c143b1c5
	.xword	0xc04a6a02890840e0
	.xword	0x30b573444d16f724
	.xword	0xfaf4c76042ca5bc9
	.xword	0x508b90354f1335c6
	.xword	0x1e0aa48a19b902ce
	.xword	0xeef520de844f0247
	.xword	0x1e10a5bc7ed225bd
	.xword	0x24cdc294eb1ac3e3
	.xword	0x5e17a6836c3e07eb
	.xword	0xf1dbcd71742d81d9
	.xword	0x6df7728a35f5e01e
	.xword	0x41551b94a8405959
	.xword	0xd21b40eb5febb1d3
	.xword	0x52162c2c1d4c739d
	.xword	0xfead94c639895dd5
	.xword	0xcb1070e146ebf334
	.xword	0xaa9465e9c5b7167d
	.xword	0x8daea3a8f64bf2b7
	.xword	0x1e8c04503fdce1d3
	.xword	0x1fbf75f9bfe2d866
	.xword	0x3324a6cc66096256
	.xword	0xc2b1a05b140482a8
	.xword	0x9b2d2eb8eaf473be
	.xword	0xfc7d9c3aedba7089
	.xword	0x3e42b471efd87fc5
	.xword	0xd2db43e12af00fb6
	.xword	0x2b382c6c9b9dcda1
	.xword	0x8eced2b2776b8951
	.xword	0x7b29b7de744a0480
	.xword	0x86dce833eadb6933
	.xword	0xd118b015bf49b0b9
	.xword	0x40d7f3ab6ae35527
	.xword	0xbdcaebe267b1c6a8
	.xword	0x41496c3c78a9f60a
	.xword	0xed70a2f115f51322
	.xword	0x8e685ec52d3b0bbd
	.xword	0xfb718ef23c3089b3
	.xword	0xca37201d45b26d01
	.xword	0xde92b332736c7c31
	.xword	0x47087d71754a7303
	.xword	0xc7d47e5b69eac39e
	.xword	0x117aaf138e313713
	.xword	0x81d08bb84a41e01f
	.xword	0x473fd93bd72b9543
	.xword	0x6faf5f653fbd14dd
	.xword	0xc9c6d86e86ef8549
	.xword	0xedf2b80ffdaf16ba
	.xword	0x56356342482af99d
	.xword	0x7a9f9fe582749b5c
	.xword	0x0cb00e476ed384c7
	.xword	0x38f32335b3827296
	.align 0x10000
	.data
data_start_4:

	.xword	0x2bb92dbfff4791d7
	.xword	0xbee454160f15d431
	.xword	0xc9612357d4726bc0
	.xword	0x458dbcc5a264be78
	.xword	0x757a353d26afe503
	.xword	0x270b823810ac1be4
	.xword	0x5dac787fea0a9f9d
	.xword	0x9f6a1e5b567056b1
	.xword	0xaa196ffd407baab1
	.xword	0x7aefb39b13b671d9
	.xword	0x7fb1defa3d219142
	.xword	0xaf90b26e5f004cf2
	.xword	0xa58fd6f831d8e336
	.xword	0x2d217826d7cb331f
	.xword	0x77336802a32dc7c2
	.xword	0x07a7a451efae86c2
	.xword	0x1d269dda265b0d68
	.xword	0xddd0405d36164d6b
	.xword	0x2381f6c471fab61d
	.xword	0x4b700bbef15453c1
	.xword	0xb1e7b2fecac92b99
	.xword	0xec15d9a661e36837
	.xword	0x4b5b2e4aff5c1033
	.xword	0x3575c25bd4eb3650
	.xword	0xdacd0ea13964f095
	.xword	0xd6aa4e3b5b978e06
	.xword	0x997aca2d15d77159
	.xword	0x35119fc6aa6e600d
	.xword	0x53dabda8e0fa4fe9
	.xword	0x3422af71d7baf72e
	.xword	0x02100f14f148e041
	.xword	0x028791cc3dd5dfd9
	.xword	0x47fa8b03a33989ee
	.xword	0xef9161e25f249d84
	.xword	0xe97f47609df569a7
	.xword	0x6daf3ee770194fac
	.xword	0xd808f752ebf12f11
	.xword	0x30dcb6e28ce10a22
	.xword	0x47dda2acecb06404
	.xword	0xb7723436327401ef
	.xword	0xd297e5692c56096e
	.xword	0x2df4533532fde522
	.xword	0x7af4dd7ceffe8fb1
	.xword	0xd7ea7b25e1ec0d66
	.xword	0xa446f9822bc3e1e4
	.xword	0x3f88538fa13ec009
	.xword	0xa73c5d47c14092b8
	.xword	0x83a641290201d0e3
	.xword	0xaa2fae6d53c1b87e
	.xword	0x4e6c16781353bf5d
	.xword	0x8e97fa6fcbf3c505
	.xword	0x57b34980f31ac245
	.xword	0xf45b1bcda62e5e02
	.xword	0x3a23125376a313ff
	.xword	0x3aff8cdc6d04d0c6
	.xword	0xb61b1e65cecc0793
	.xword	0x570d790d035b6b22
	.xword	0x9ff6507f2e4362a4
	.xword	0xbbe33b1890621de2
	.xword	0x5459cdf8d27106ab
	.xword	0x2646e03c6f0f3715
	.xword	0xb4109b778e61edbf
	.xword	0x5ab0040fdbd559e7
	.xword	0xb94f026156edbd53
	.xword	0x45358d7e7ff3f4e1
	.xword	0xbf8e41026d937512
	.xword	0x3b170761fe786b6b
	.xword	0x278135fd83e60d45
	.xword	0x3778a088526ff6ca
	.xword	0x1c8e622fa127db7d
	.xword	0x02859d677d62b934
	.xword	0x6adb13523f3aaa4e
	.xword	0x450de38e2e39c8b0
	.xword	0xb9b184be60acb83b
	.xword	0xc7c167184f3665fd
	.xword	0x1e3b7f50d957a933
	.xword	0x59c10341164488bd
	.xword	0x1992d787b3ea67f6
	.xword	0x7061cb65473fbd9d
	.xword	0xa33a7d8d0f55d811
	.xword	0xb5ff76219fe24fab
	.xword	0xb110dc4c895a5f51
	.xword	0x08ffa33cdf718c92
	.xword	0x14b56210d9df1335
	.xword	0x1623a6446fea7880
	.xword	0x1ea6f4b06f3bb0de
	.xword	0xdf5ab500e359ec76
	.xword	0x4916a41b67b0f1d5
	.xword	0x0d04ff2a00c0a0af
	.xword	0xafec3136b2fd187c
	.xword	0x9e6a90968fbcceae
	.xword	0x419e91d6eff0c3a7
	.xword	0xaf634f0694aca5ed
	.xword	0x77f44b6387f66dc4
	.xword	0x51075ba91edfda69
	.xword	0x94a9d7b25228686e
	.xword	0xeb1b8db4762d87e9
	.xword	0xbc3c9380a5f91292
	.xword	0x5bde43655091270b
	.xword	0xdbf4d16608d80f43
	.xword	0x144d07eb7bb85f87
	.xword	0xbc770606c49652a1
	.xword	0x1aa69707db840362
	.xword	0xd2e93cd3b89b8c03
	.xword	0xa6365cda194fb974
	.xword	0xa715a7df36b561bb
	.xword	0xc8563c47f81e6238
	.xword	0xe758e727dcd27872
	.xword	0x8ed8c24aa86f436c
	.xword	0x9e877754038e7014
	.xword	0x9050823ffc1bcb9c
	.xword	0xabe5e3d9aa25162a
	.xword	0x1db92baffef60385
	.xword	0xc9048b162a0fdeed
	.xword	0xe292cacf64c7035e
	.xword	0x390f003e126b5863
	.xword	0x47d276130af85b7d
	.xword	0x85ebbf09ce064d87
	.xword	0x56b74566f76caaa7
	.xword	0x3ad87fb3dd3cef40
	.xword	0x155acacae94b8afe
	.xword	0x567b9c12d86b1939
	.xword	0xb2b53a9e05f60330
	.xword	0xaab1436ffb0614f2
	.xword	0xfad6abb8c1fb881e
	.xword	0xdf0aade0d57d19bf
	.xword	0x8ab7b72ea94d22b6
	.xword	0xa7adb30c9f699aa5
	.xword	0x39c2b33adc266ef0
	.xword	0x68895135fa16bd9a
	.xword	0x55b988abb0af4f66
	.xword	0x332f7a7c118e6dfa
	.xword	0x16e4056c712874fe
	.xword	0x8eb089e06d073b2b
	.xword	0x1ef33f5420f1973c
	.xword	0x462c1fb1bd0effc6
	.xword	0xf9b0085e531e588d
	.xword	0x17055f566054f39c
	.xword	0x3308723aa9d5865b
	.xword	0xd701af4caf531222
	.xword	0x2f0eac81b51bc370
	.xword	0xcd2cd29b5aea2efd
	.xword	0xe5494697586adfd8
	.xword	0x291023bab8da1871
	.xword	0x2339451186dc47a0
	.xword	0xbcf7448f73c0f8c2
	.xword	0x2b9f03d0765e4452
	.xword	0xf1badc193a041fba
	.xword	0xfa77de369e4af0bc
	.xword	0x78b5ae365c86fe2e
	.xword	0xce147a375c4000e0
	.xword	0xf2ad95f4d0e5e7ce
	.xword	0x5da0931acc6c4b9f
	.xword	0x9b0256ba11f7b46b
	.xword	0x70157f3df6645c3d
	.xword	0xa0942aeafa828227
	.xword	0xadb45bf394d174df
	.xword	0xd939f00c56aba90b
	.xword	0xa2c3db64792a2e09
	.xword	0x76423c921d4032e2
	.xword	0x2eb82ebb5a6865d8
	.xword	0x616c6936bf603fac
	.xword	0xdc18683e5966742d
	.xword	0x7afb9e487b05f5da
	.xword	0x8f6f1f6bb7faa75a
	.xword	0x72ea8ccf1d3b03c8
	.xword	0x5914d77fb7006398
	.xword	0x5158ac646a7d511a
	.xword	0x9b428678793f3185
	.xword	0xfd465ab71832b245
	.xword	0x1f75b2de6de400e2
	.xword	0x0c58f8d54b03f875
	.xword	0x7d83c8d03d7bd957
	.xword	0x36997b48a0f99d01
	.xword	0xa6f5a8ea62477b30
	.xword	0xe204224dd080d327
	.xword	0x8b4b3ec73ac3768b
	.xword	0xfad266a3b3bc868b
	.xword	0x15d49edaa1d3ba9b
	.xword	0x3032dafecc7863d0
	.xword	0x3d9052fb7857dc7d
	.xword	0x0d65faab5abaae8a
	.xword	0xf48138304429c826
	.xword	0x9fbdc12b7854e04f
	.xword	0x3ff33de07eda0a47
	.xword	0x9e111da76440ff84
	.xword	0x3ce3b50dcabef364
	.xword	0xbc034f1f6647f237
	.xword	0xef21dc94d30827be
	.xword	0x45365be2082df554
	.xword	0x53af79591592c712
	.xword	0xbce657c6c1b4a17b
	.xword	0x3c7a45b66af538ed
	.xword	0xc528570bda001373
	.xword	0x1fbef9633649d6a0
	.xword	0xd634c235f1076965
	.xword	0x522516a18ea48437
	.xword	0x24f94a70d29319c6
	.xword	0xd24664605ccbab63
	.xword	0x17e62dbed0c43eed
	.xword	0x3f34b6f5ba0f57d5
	.xword	0x70122072188cbc47
	.xword	0x4ff18818e3ddade9
	.xword	0x91672e614d4c6fd7
	.xword	0x8273108b024bddf5
	.xword	0x60e84f84662d1eaa
	.xword	0xaeb1444457c8a976
	.xword	0xc577caf8363f71fb
	.xword	0x432473d4c9d2114c
	.xword	0xf3f44daf2b8c1ad3
	.xword	0x8f4bb9f1759796da
	.xword	0x7c962aac41f5ea1e
	.xword	0xde47e32bd8a3aa00
	.xword	0x282120b2cf0f5c98
	.xword	0xf1831a1fffea41a4
	.xword	0xe68aa1361eac042f
	.xword	0xfbea443c34b74527
	.xword	0x66412e55d30247c2
	.xword	0x82c348b92592313d
	.xword	0x49b8ce9189372952
	.xword	0x04b80185d2f087f0
	.xword	0xf6f4093d52ba4d94
	.xword	0x83afe6e5a2d422f5
	.xword	0x9d73519d75545df1
	.xword	0x4a272fabbfbe919c
	.xword	0xdbfb3b25a64f4aa0
	.xword	0xfbd40f5af4b83f27
	.xword	0x2a033b160957e615
	.xword	0x25905975f6c302bc
	.xword	0x948746be82b0341f
	.xword	0xcf8ca5ae5d5005d4
	.xword	0x3ffaab7caa543245
	.xword	0xe319c7ffc3995341
	.xword	0x31557e38c05fe44e
	.xword	0x2921ff69b1aaf63a
	.xword	0x574cba88409098a1
	.xword	0xf9abf8cb82cb2773
	.xword	0x05ce28903ef41a34
	.xword	0x53aadc7aa5703a76
	.xword	0x2ae7d9f8584c24b8
	.xword	0x2b9d3d65d0d441ab
	.xword	0xdff3fb6b2d7a8286
	.xword	0x53b7a0d0d7bbb494
	.xword	0xc24dc867d32eb0c4
	.xword	0xb098764e7c72970e
	.xword	0x0fdab402de30c4cd
	.xword	0xbe1547980c1a9979
	.xword	0x9fc95a83f5db3570
	.xword	0x6da58a702fe38de6
	.xword	0x5db02508b4a1c430
	.xword	0xbf739648fa02647c
	.xword	0x8a9251dbe4125a07
	.xword	0x03e72560ea01f5eb
	.xword	0x9f5d8dd75ce052cf
	.xword	0x546b9eac404bdf36
	.xword	0x93e3305f483bb0eb
	.align 0x20000
	.data
data_start_5:

	.xword	0xf16024c80aa16475
	.xword	0xaf528410b16c1436
	.xword	0x70fa7554d6226dbb
	.xword	0x692236a70d11e181
	.xword	0xa7bca75da0a58315
	.xword	0x19ed9b0c3eed59e8
	.xword	0x44c6cbf55d89abbf
	.xword	0xaf43aa7c7b1c8c8f
	.xword	0x4c7bf83222a9d7ac
	.xword	0xedebcb729510160c
	.xword	0xde1ccf990f8d083c
	.xword	0xa15a0555a43c60a2
	.xword	0x0d37a0af9041fd73
	.xword	0x0dd25f9eddd57c97
	.xword	0x7671ecdeefa1acbb
	.xword	0x3c493ebb0c90d718
	.xword	0xb3974d6f4ef37768
	.xword	0x1e6a877a4be07c01
	.xword	0x40c7458f97df3358
	.xword	0xc7da5f31c672d3f9
	.xword	0xd9cf38f1ad111124
	.xword	0x13043fc7795727f0
	.xword	0xbbf1aece7915aad8
	.xword	0xe011e60b93d731cb
	.xword	0x49c5a0ba877696df
	.xword	0x0fefbf25fdb89932
	.xword	0x5c42be21a15135b1
	.xword	0xb89f8f3d03bda12d
	.xword	0x304002f9310bc5ee
	.xword	0x65ad6c1287a196dd
	.xword	0x39743f5c3f323a78
	.xword	0x46971d61905695ae
	.xword	0x3fe46ef4ec01ed9b
	.xword	0x52ed6c384c3e1ae0
	.xword	0x26b97cb335a8cb00
	.xword	0x2993db2af1cc7d28
	.xword	0xb69216629179fd79
	.xword	0xd82e559e83517e0a
	.xword	0xa47cfbb149d2e69e
	.xword	0xcc25c7bc4aa90f37
	.xword	0x88f635061b0cc1a1
	.xword	0x89f3d46e96542d47
	.xword	0x0890390ae43cf7f6
	.xword	0x005d08dc76266f74
	.xword	0xffca3284a6f0b02b
	.xword	0x93d0b151d8d2c790
	.xword	0x55d3e4cf21413057
	.xword	0x39ac861b738c743f
	.xword	0xf079bbcbb78b9038
	.xword	0x1c33b1d61a5725e0
	.xword	0x47bc2f21dd070803
	.xword	0x8cdfd865f28b4426
	.xword	0x1d65c3a935f6ab5f
	.xword	0x53085ad4a2c36938
	.xword	0x0de4a22342f4fa47
	.xword	0x9ee6b58a631ced74
	.xword	0xb8ab5d6c9010ffd7
	.xword	0x018616088de963e1
	.xword	0xba7c6465a3efea07
	.xword	0x7f37a60b63381d1e
	.xword	0x4c5afcaf0968a88e
	.xword	0xd213dcd1f0549f99
	.xword	0xed01250f00244edb
	.xword	0x97ec105f9a3c6fcb
	.xword	0x6657c9151806c5cb
	.xword	0xcc9cde61bf01bf60
	.xword	0x67637b317d399647
	.xword	0x379ebf688d335417
	.xword	0x24fd2c75ab5355d6
	.xword	0xe7d1a4037005d360
	.xword	0x1b0d5f47e05f3b29
	.xword	0x1e9c20fc679c87ab
	.xword	0x16f4912e1fe8616e
	.xword	0xc9e039c2fa9783f0
	.xword	0x87eeb1a5b14a3792
	.xword	0xf3afb0aa03d744f2
	.xword	0x7ba2c2e5a3698c23
	.xword	0xa60f660d2aa37b53
	.xword	0x0b3ce39b6f154c58
	.xword	0x3f5234f1fe757a48
	.xword	0x84333116b75cfb3f
	.xword	0x4c76dbbb59affdf8
	.xword	0x3c14a1ed1eaa9072
	.xword	0xf063c1cbff8b13b9
	.xword	0x83603cebf56d8358
	.xword	0x90c2345c5df7ecf1
	.xword	0x48bca9f9eced4ae3
	.xword	0x6458069745b538d8
	.xword	0xcda3f8ae4407298d
	.xword	0xb4632bfe3e0fb8f5
	.xword	0x383cf6358701883c
	.xword	0xea3556ce52d03195
	.xword	0xf699f8907a85b0f3
	.xword	0x55c156b675c743bc
	.xword	0x69e0cd6c8a0e2af3
	.xword	0xbcc5050765b870d8
	.xword	0x6cb901be48dd6939
	.xword	0xc1f776001df88c2c
	.xword	0x9743df6ed05d84c7
	.xword	0x2f505dcc11f7d02f
	.xword	0x19d1f3f6be4087f7
	.xword	0x2b1c5c82599bcb40
	.xword	0x47983c8a0d593bbc
	.xword	0xb34765598f09c9e0
	.xword	0x19af4295054af370
	.xword	0xe0fef5f5658848f6
	.xword	0xe3c193b066ff8017
	.xword	0x5c01a2ff62a023fc
	.xword	0x6b221c3e92d77e08
	.xword	0x0c8aaca0bf203672
	.xword	0x288e5ff0c5bcc16d
	.xword	0x4f990be594c2705d
	.xword	0x4871f45ee161b6b2
	.xword	0xcc18fde66827a057
	.xword	0xf3f673ceb43d2bfb
	.xword	0xf6f5f785da225b22
	.xword	0x65818af6b1206f26
	.xword	0x02e3412645355e1c
	.xword	0x84629180a13ca855
	.xword	0x075dafbddfff563a
	.xword	0x4fab9ecc146178a0
	.xword	0x29394bea854c3657
	.xword	0x2cb3f5d3c90678eb
	.xword	0xb342f511cba7ab58
	.xword	0xeb04b08ec7273436
	.xword	0x949142956fdd1798
	.xword	0x4aee345e39c2b899
	.xword	0xdbc22ab86fe8404d
	.xword	0xd39ac0c394542327
	.xword	0xa25e475c8e24ca6d
	.xword	0x0312714fff5e9ded
	.xword	0x6c619d6e91dad2c2
	.xword	0xbcaed1880217df26
	.xword	0xc36ab8d87e3614cd
	.xword	0xfd5405f35dc0f263
	.xword	0x3cded6ef85de4c1d
	.xword	0xd1f97417c9617b87
	.xword	0x2d18f7e37ec9ccc3
	.xword	0x21903b9aca8dbe93
	.xword	0x9e64db3963eb8249
	.xword	0xd899e009cab7ca80
	.xword	0x527b29ba325802a4
	.xword	0x955e03b2210065ed
	.xword	0x42d4046f39a2d0d1
	.xword	0x3bc3de9bb883d1ef
	.xword	0x0193f9324c701c5f
	.xword	0xa2d56bfd8da1a6be
	.xword	0x779ed3050b775b69
	.xword	0x6764377ddc129f16
	.xword	0x629b4d05934846f6
	.xword	0x7a62e41bc9b3c710
	.xword	0x062648fd4e6e8b5c
	.xword	0xbf8061cd471f78e6
	.xword	0x55155931ddd834fd
	.xword	0xbe8b42d17f3041a4
	.xword	0xba951925d993b403
	.xword	0xe054969f1f136a75
	.xword	0x4073032c9e72f34c
	.xword	0xd39211359a74d2da
	.xword	0x34fc798d58088048
	.xword	0x5c9c78146db0027f
	.xword	0x15cde6beb1c32853
	.xword	0xee83ea193865347a
	.xword	0x014eef3ad9fa548d
	.xword	0x34cb0743ad80eeb2
	.xword	0x0f4bcc7233a8d3ac
	.xword	0x8ac18e436a070b86
	.xword	0x43f75f371b536275
	.xword	0x8c92667c9ffc37fb
	.xword	0x6e431561685d5a97
	.xword	0xf594e2781ddd0987
	.xword	0xe9ec62dd369f23ba
	.xword	0x96954e1361ea45cc
	.xword	0x4429da36fcbac03c
	.xword	0x32f23ffb74741cb2
	.xword	0x75368bc7e4a331e6
	.xword	0xa73bc0812b362852
	.xword	0x39ff27128d1efad6
	.xword	0xc0e387057be0f7ef
	.xword	0x732ca5369c35c458
	.xword	0x165c0db4e00d0af1
	.xword	0xe5e8f68d4c703277
	.xword	0x1c744f98e78e4657
	.xword	0x91af7382c88eaa71
	.xword	0x90fbc6443ecec15e
	.xword	0x5bde03adc3f28044
	.xword	0x81534cf342788780
	.xword	0xa14b8b78287f10c6
	.xword	0x8924ebd8f75a2ebf
	.xword	0x7b970713f510c125
	.xword	0xa7582b574317b4d9
	.xword	0x93e4c25d2e479124
	.xword	0xa66c08b7bdd96984
	.xword	0xa0e2c73d86d0033b
	.xword	0x1bf9a40b7b96acdb
	.xword	0x9200cff5ce375256
	.xword	0x3645a2869f459e0e
	.xword	0x123841fbfba371e7
	.xword	0xfec4b446404ef431
	.xword	0xc7a72482f970a639
	.xword	0x12d644b018d38e81
	.xword	0xdabee0af713940f4
	.xword	0xc33375fc79fc47e5
	.xword	0x366fa203e09a1174
	.xword	0x5f2dc3807b7c38e3
	.xword	0xca9d0a1308535783
	.xword	0xedb450b8d7f835cd
	.xword	0xf5f21d3da7933b0e
	.xword	0x21f64578374cdf72
	.xword	0xf1fc6c8a1cfebb31
	.xword	0x2e652345af874e50
	.xword	0xac4e31264bea496c
	.xword	0x6edc683b3c0af9af
	.xword	0xf937ea3ec892e499
	.xword	0x25b4d2a17200636f
	.xword	0x7ea3ba13062e8d1b
	.xword	0x0f36f86997954c4a
	.xword	0x4d8238c653003386
	.xword	0x89ad68089263940b
	.xword	0xec05b035a7da54ca
	.xword	0x6b631827b7bb9702
	.xword	0x77fe7ab9466707b8
	.xword	0x045ef9cc4b465775
	.xword	0x195527670027219f
	.xword	0xb015ad7fe5201449
	.xword	0x0a1f877d1811d78c
	.xword	0x00f12c1a5f68e831
	.xword	0xce4b079c1cec44f2
	.xword	0x2da56a3cb5c5a3ec
	.xword	0xc5181d6fb0d95c45
	.xword	0x21037429f2e2a0e3
	.xword	0x82e0178f67f0a516
	.xword	0xf75624df80efa864
	.xword	0x62dbf94d5af0655b
	.xword	0x68a00ba86dedc39d
	.xword	0x8fba647e99e3655e
	.xword	0x9c95d029dc71b6f5
	.xword	0x0a763f2615822f77
	.xword	0x9bde8eaf94eccb54
	.xword	0xcfb2f82ff59aaa24
	.xword	0x1699b95b5761f88c
	.xword	0x931e1d063701fef6
	.xword	0x52d25d2be5e319b0
	.xword	0x87461851f70bf1ca
	.xword	0x332b00abf2eda53f
	.xword	0xd1012eeb7bf91b16
	.xword	0x8a278fcaec134619
	.xword	0x0cbbd3dc5b2a395a
	.xword	0x0ba6ada29b1846f8
	.xword	0x2b201dc51cdaa79a
	.xword	0x45c78e1864b63591
	.xword	0xf9ea9789ee58d3ec
	.xword	0x78593a996a8ea51e
	.xword	0x16bb945d5119ddf0
	.xword	0xe710bc9670931d5b
	.xword	0xb052346114737b1c
	.align 0x40000
	.data
data_start_6:

	.xword	0xd244da2dc34db952
	.xword	0xa70434b1409e57af
	.xword	0x7d0826158b94c032
	.xword	0xbd5491d6fac4ea78
	.xword	0xb0a8d9183e53ca44
	.xword	0x659aa50ee9d5d93e
	.xword	0xe4f0f46ae67a54a0
	.xword	0x7d96b4797149171f
	.xword	0x37612b8e719aefec
	.xword	0x5610d61821de9972
	.xword	0x2d5b57606576a1ea
	.xword	0x46e4899a2e8c1b64
	.xword	0x649ed984552f7783
	.xword	0x5d05dc1ed70a60c9
	.xword	0x13598218b35fc002
	.xword	0xe6a6fc722bf7c6c9
	.xword	0xc34fc8c3dfe3b1e9
	.xword	0x06954da98fe5a77f
	.xword	0xa83ca71791df4ac3
	.xword	0x89b622fa95915c79
	.xword	0x8580f01c68ecb85f
	.xword	0x2c796d592eb6703e
	.xword	0xf54a2a7af62712a0
	.xword	0x8a6352bb10e718eb
	.xword	0x6d4429b86477e411
	.xword	0xac0ff7f54eb3ede6
	.xword	0xd7b720eecacd62b9
	.xword	0x0c3d8e9a4faeb6d9
	.xword	0x7bafe7b2267dab51
	.xword	0x4847b0a7eecf7edc
	.xword	0xbb72265bd8dc9c77
	.xword	0xf3b9f2b717a712e2
	.xword	0x6f1e91b52fa86076
	.xword	0x50472b791006cf11
	.xword	0xc2fda404dddb31cb
	.xword	0x8131207bcf7ced44
	.xword	0x08848f5ad5bbacaa
	.xword	0x35a4d90c82cc8742
	.xword	0x9d102739efd4792d
	.xword	0x77e0d3353669873d
	.xword	0xd75b1d5e14f5b660
	.xword	0xe6da61036b32ee77
	.xword	0xbbb870ce7ad741ab
	.xword	0xc575ee4f71aeff5c
	.xword	0x1734cd26bb9f0b8f
	.xword	0xa099f77ca8476532
	.xword	0x4994d8d4b4cef55f
	.xword	0x3d0767d225fdde6e
	.xword	0x1739801da82908f8
	.xword	0x7ce2c3edd2225b78
	.xword	0x32321bc82a83a67d
	.xword	0x859dd7753ac7950a
	.xword	0xfcd3fe358e5ab392
	.xword	0xa5826fb2dd2f5a09
	.xword	0x037c28a8c73447af
	.xword	0x18c2cf13d8f8d170
	.xword	0xe4c3d79bae66202a
	.xword	0xf96c6e3d1ec4aab2
	.xword	0x2d1a467e23410e24
	.xword	0x9013f9883e8a5fa4
	.xword	0x06d190f91eecfd73
	.xword	0x0daaf9c4713661e3
	.xword	0x55b06484968d1499
	.xword	0xc19ed3f32ecfb24d
	.xword	0xcf1d6c6d287719d0
	.xword	0x87c200e1568f8d1e
	.xword	0x4379ec742112098e
	.xword	0x8c470673d2539b82
	.xword	0xbdcfde568412b682
	.xword	0x83d17d3ec89ca2a6
	.xword	0x23ab31c33019031a
	.xword	0x112499aac5eac89d
	.xword	0xad60579288900195
	.xword	0x251bf900b1ae4332
	.xword	0x75e12d531ad0871f
	.xword	0xa322a5cdbccabb5e
	.xword	0x3ca948a258fa124b
	.xword	0x19d2b1cff688fe6f
	.xword	0x78cc49b69c89bd27
	.xword	0x192ae092b80f9b6a
	.xword	0xc02c0b984b4085fa
	.xword	0xb10cd7d110c07cad
	.xword	0x2f2f4500bf27e95d
	.xword	0xae6db1675f9e7cc8
	.xword	0xb88a37c899d2938b
	.xword	0x500d32ca40c6f241
	.xword	0x6ff22483087960a7
	.xword	0x5f4cf114551a8b7d
	.xword	0xbd7e291c9423e132
	.xword	0x1df69a8c851e9fe0
	.xword	0x353df2ce4b0dd8de
	.xword	0x1de1eb33500adb63
	.xword	0xc5b15e6674c72343
	.xword	0x53ebd8a86a4b8efa
	.xword	0x3fcc9c62689401fd
	.xword	0xa25e0b4d74e02e56
	.xword	0x816d86835069cd38
	.xword	0x63969d02e5b903a2
	.xword	0x179f7041bfef1cb0
	.xword	0xafeb323230a3677e
	.xword	0x620d88e4ea639985
	.xword	0x29a12cb8ba0a12ed
	.xword	0x3801d303b6f57745
	.xword	0x57d5c1b93f215922
	.xword	0x77ac242bebe1619d
	.xword	0x5b9c79dcb0be59cd
	.xword	0x4dddaee84e8af1d4
	.xword	0xb7465cb46a06b940
	.xword	0xb752ee9abea0dc9b
	.xword	0xef460f3b7122126f
	.xword	0x1cc891f7cc937bc9
	.xword	0x79df0a5b4e5e6e74
	.xword	0x24107a99ad9c2aea
	.xword	0x2e82ba56707c13b7
	.xword	0x567eded57ae0742b
	.xword	0xd50966af40e093c9
	.xword	0xd2aafe4b0db4519e
	.xword	0x91ec8e466897918b
	.xword	0x1be65e950b4d28fb
	.xword	0x046ee4301b84f3fa
	.xword	0xd7990748f2e5fffd
	.xword	0x2b8ce039f3ccfe8d
	.xword	0xd4c81182dc23daa1
	.xword	0x356d5f348dd37846
	.xword	0xb1ef32dcc91847f8
	.xword	0x3c51c5e6414e8b57
	.xword	0x0cd78cc3dc886891
	.xword	0xcb07029bfad370fd
	.xword	0x0199c61c617edcb5
	.xword	0x8cfb99bfa69b65ac
	.xword	0x36c653afc83a19d3
	.xword	0x96bb78c43787cde1
	.xword	0xcad6e4eab02e7139
	.xword	0xdc906a2f13ab49a2
	.xword	0x23f3b0359ba906da
	.xword	0x65fc94c46dbbaa53
	.xword	0x8c68206ddd2598ed
	.xword	0x01c914b285601617
	.xword	0xcd78ad9791a409f1
	.xword	0x31c2c9f16adce00b
	.xword	0xd147905f75dbb2a1
	.xword	0x09af236833cb88c6
	.xword	0x54300a5b7a152567
	.xword	0x18d1cd589269a1f1
	.xword	0x0190f218558c02b8
	.xword	0x133af76163c452ba
	.xword	0xa29cec2c28c50d1f
	.xword	0xa9663c3c51c0e120
	.xword	0xb68e602f28eba692
	.xword	0x20ba4baa1a2b276e
	.xword	0x0f61d949e841d891
	.xword	0x4d5fd45afb61b360
	.xword	0x2118f58f9dc5da8e
	.xword	0x55f1e0b68d0c2694
	.xword	0x8d222860a35197be
	.xword	0xd98338cf865c4908
	.xword	0xa5cd6ea598de7fd4
	.xword	0xe48eece7263cf22d
	.xword	0x9da10f42a9335817
	.xword	0xc283255c8666568d
	.xword	0xd7d507f5edfd271b
	.xword	0xdc006ff5683c3a85
	.xword	0x8a59c74b7c8747cb
	.xword	0x530aa2d348f23eb6
	.xword	0xe5c4dc6f23e6b798
	.xword	0x57aabfe413a0dd59
	.xword	0xb3dc00a3a7581230
	.xword	0x477c86c959239c5f
	.xword	0xd9390329c5912721
	.xword	0xa3d1a7aee7b8aabe
	.xword	0xac98e2f8510cb961
	.xword	0xa1768fc3c391cad8
	.xword	0x09408c88644ff7b2
	.xword	0x66aae37737fab85b
	.xword	0xc0e15a5263895b5b
	.xword	0x8ea7a76eb4f4cbb8
	.xword	0xd0c31d123ed6c9fb
	.xword	0x41d078b2a2592acb
	.xword	0x3c8a466954890426
	.xword	0xd36f9bb010aae707
	.xword	0xf17b5493ac95786d
	.xword	0x966e1354e3446ce0
	.xword	0x9fa0517706ab3fd5
	.xword	0xe92e9d6641538a48
	.xword	0xc21fde64dcbad3c6
	.xword	0x0b176bba45318356
	.xword	0x6376b2457b8f44d8
	.xword	0x472cb98ca398a514
	.xword	0x8999f1cdaaff4fa6
	.xword	0xac98b4b41e64ea2a
	.xword	0x0571f749512f32b8
	.xword	0x40d0506d9c8f11b7
	.xword	0xedc6dad2e99b2831
	.xword	0x62a77ab73a1a85bd
	.xword	0x134d021da5d92a8d
	.xword	0x3e166dd7f8d092d2
	.xword	0xf58f48dd5b9efbd5
	.xword	0x50e3db94d6e23655
	.xword	0xe22bbc39dc4b0c32
	.xword	0x090412aa083132dd
	.xword	0x6d26e72bfb7b6619
	.xword	0x91eb32b7092b38bb
	.xword	0xcab86aa3eefc4ee7
	.xword	0x3c55a7fde6fe9d5c
	.xword	0x34125f56d1699fe0
	.xword	0x9364eee2c9a372f8
	.xword	0xb42643df41c08513
	.xword	0x81ac63e209681528
	.xword	0x5dd94528b0e08495
	.xword	0xadd3c1eb7e53e1e5
	.xword	0x7075831d598001aa
	.xword	0xfccd3dc57928278c
	.xword	0xda2150a4dd404561
	.xword	0x63984d168f119659
	.xword	0x63605a63c099ad24
	.xword	0x569b6f221edc046e
	.xword	0xce4c92f42627fef3
	.xword	0xbbb50d6d731e9f3e
	.xword	0x3724f67d89f6d5b8
	.xword	0x06ca4629d4e405de
	.xword	0xb3a804959c9b87a4
	.xword	0xcf666345536ed207
	.xword	0x8ad588478aff7524
	.xword	0xdbc8c75d95ed6003
	.xword	0xbcb2b7e3173c8392
	.xword	0x604d4b3c7b225a19
	.xword	0xf449b98380c575df
	.xword	0x756b8a2deac681a6
	.xword	0xfbb2b902c953d2c4
	.xword	0x68b8a866d82241c4
	.xword	0x84f985c5d1b1f9bf
	.xword	0x5b713820dc1ec6fc
	.xword	0x71a5ab1b5d62d335
	.xword	0xfff164bfacdc7760
	.xword	0x376d3d7336273ef7
	.xword	0x1dbad23ed97e91e1
	.xword	0x8e60a588ddf0bc7a
	.xword	0xd2fde9c9599c9238
	.xword	0xc6db63bbcf57b6d8
	.xword	0xccfa9c75d86f082a
	.xword	0xd3165b43932e2fb8
	.xword	0x27869071fac06ba7
	.xword	0xe85c0f7e2bfa302f
	.xword	0xc563a265d4754723
	.xword	0xa5700363e6037fd1
	.xword	0x37be4cd3ab873380
	.xword	0x49f52b33fa708be0
	.xword	0x428106bfab8d2c2c
	.xword	0x662efa28a3efc97a
	.xword	0xc769defc06d5d30e
	.xword	0x0906f387344445f3
	.xword	0xf49e0a1b94026755
	.xword	0x1afcb64dde9b3e5d
	.xword	0x03ccd7dfb382f614
	.xword	0xec218de263d1bedd
	.xword	0x2b160f6fc7a527e6
	.align 0x80000
	.data
data_start_7:

	.xword	0x3757f64e8908023d
	.xword	0xc5fd735d5dd4b31b
	.xword	0xb49e8560ac83c27d
	.xword	0x57564f4377f7e1fa
	.xword	0xde0a80b8fb5a2258
	.xword	0xafc3aa2f786939a7
	.xword	0x15a8fe4180ee6fa8
	.xword	0x3dd49b7cdd447a88
	.xword	0x00a7df3ef33259db
	.xword	0xf715a4163b379422
	.xword	0x95f449882571c4cb
	.xword	0x84573a2152f2e575
	.xword	0xdb6332412250fc20
	.xword	0x1b93083a95b21a26
	.xword	0x559aaf2c6e7e07f7
	.xword	0x3e9d064e2fab44fc
	.xword	0x1ca7a5a28c52ed7a
	.xword	0x161a5f9222ad035d
	.xword	0x7953644b1e2aa48c
	.xword	0x8588fe74cc52e963
	.xword	0xad63aa650c015185
	.xword	0x47797b7bbc229f51
	.xword	0x8fd62a0b287bb152
	.xword	0x2a043d956cdfefa1
	.xword	0xd17f67e6961ab8e1
	.xword	0x19aaa51909b1a139
	.xword	0x9cb4775a5bbd5714
	.xword	0x469196ac4d9d8392
	.xword	0xbe1ee22b86f1f411
	.xword	0x1a83d8f7a9ee39c3
	.xword	0x707eb0af4c019524
	.xword	0x7aba173edbff9938
	.xword	0x96a89a2c6117c78d
	.xword	0xf96ee73a41b98eb2
	.xword	0x9f0aec644bfc35a8
	.xword	0xf91d10112dde6a70
	.xword	0x0f671a96ac4d5a7a
	.xword	0xca679fc3723cfb52
	.xword	0x5cc7bbbdcb8e65fe
	.xword	0x58a38ac9585d8bc4
	.xword	0x7214b961b60c3f91
	.xword	0x42ee57b284de63ec
	.xword	0xd1c8946cab585595
	.xword	0xcea3576124fe6e80
	.xword	0xf59b93d454ff5170
	.xword	0x3d1c28937c5ed404
	.xword	0x826fa034ad524bda
	.xword	0x2e8b0a9a18165955
	.xword	0xc58feffd4efa2230
	.xword	0xde2443fbb6537e10
	.xword	0x1a05c83468cc07de
	.xword	0x39e070aca7531ee2
	.xword	0xac968a84cbf734de
	.xword	0x8ff149f5bd940804
	.xword	0x9225eeb96db14f2d
	.xword	0x7272fd28bfcd6fc0
	.xword	0x23e99d96432a9ae3
	.xword	0xc541343b3c4f9114
	.xword	0xefdab291b02fc85c
	.xword	0x3cf73654c9da0696
	.xword	0x0c1dedd67cbf0ef6
	.xword	0x84dfb1f611b25907
	.xword	0xdd90897f4fb4e1a7
	.xword	0xfd1848a671f89013
	.xword	0xe07110e60478fed9
	.xword	0xebc10f518fc72024
	.xword	0x9c7136d7e29c3f1b
	.xword	0x38df04b4b706eef6
	.xword	0x9228682dada430e0
	.xword	0xf7b9246b10f5a5ca
	.xword	0xd79f86279f004031
	.xword	0xa342a417ef53f4b2
	.xword	0x32c48c663790a1bb
	.xword	0x1703a5ff8be98641
	.xword	0x347b9a32d7a47548
	.xword	0x4f0718df25deda31
	.xword	0x330c65a7a8181171
	.xword	0x519eaca1f8890d0a
	.xword	0x7f4cdd5fcbf089ca
	.xword	0xd430c8f159292945
	.xword	0x8c3f02669cf4171b
	.xword	0xcf3bb145f7ed62c6
	.xword	0xa484bc1adb389f24
	.xword	0x8c4abf4f5453cb03
	.xword	0x1d043ff4caf4ffc2
	.xword	0x7eb64b4fd366589c
	.xword	0x6a19423733b2bcee
	.xword	0xd502120fe011e59c
	.xword	0xcd44d5081de64f62
	.xword	0x2c01999c96f74288
	.xword	0xb0a5941fcf35c47b
	.xword	0x62536505a3a49299
	.xword	0x7d92f09f88872424
	.xword	0xab644453f27e9cf1
	.xword	0x448611318cb50d85
	.xword	0x7ff811c864dc6da1
	.xword	0xd08fbbe30ddef0a9
	.xword	0xf5803a8681f5ec32
	.xword	0xadb4c4deeec89f7b
	.xword	0x18ce1398a199db9f
	.xword	0xa709efc902ce030c
	.xword	0x1ebd638cf134c434
	.xword	0x1bb6be23f9998596
	.xword	0xfdc82a012012abf2
	.xword	0x5579e223365e9cbd
	.xword	0xb3ae1dc8f16877e5
	.xword	0x9df6ab42df59efb0
	.xword	0xd42aa4f3d3bc096e
	.xword	0x57533b05aaa721b6
	.xword	0xad7abb964f5c9d82
	.xword	0xa00f2aa8a54b210a
	.xword	0xd8902a27a63881ef
	.xword	0x27a3ca4cc00354ce
	.xword	0xbf5c12dd69480b5e
	.xword	0x0675a22bcb430efc
	.xword	0x4ef7b896667dbd4a
	.xword	0x66037817d62b0dec
	.xword	0x557269f35ef3b2a0
	.xword	0xb9f676c8364301a0
	.xword	0xd47ac0ca6104d2ea
	.xword	0xa2d9123d7d9e291b
	.xword	0xc6b3a9fa3710d907
	.xword	0x7b1a3cf3356295d7
	.xword	0xdc7399d0dd79d114
	.xword	0x593b3daac1b1a38f
	.xword	0xcfa899239acf5ef6
	.xword	0xfab2b03424e8c74c
	.xword	0x4fbe968d8387076b
	.xword	0xe02868ac789c9289
	.xword	0x59c0af753e849ae6
	.xword	0xaa8a8abc1a6f7586
	.xword	0xa5ee0fb7ecc505cc
	.xword	0x9cd9a46eb0d6a05c
	.xword	0xbb25216717511965
	.xword	0xc535dada80cdda1b
	.xword	0x0a85c3583c242818
	.xword	0x4ef7e43aa7cc4f0a
	.xword	0x26343b5877fe9654
	.xword	0x22d665ede5b9ce60
	.xword	0x23c1d86519d2155e
	.xword	0x8e25a9f871a4d7d6
	.xword	0x49d4c818f12a1656
	.xword	0xd9be63aca5d89e53
	.xword	0x3bbbbd65f2ab6cb7
	.xword	0x30cb45c2604c179c
	.xword	0x5217470506cc35f5
	.xword	0xd3fff786bacc413c
	.xword	0x67bdfac2f482a772
	.xword	0x84dcd99e79c75306
	.xword	0x3adbc16ae47b3d51
	.xword	0x07e0df8ba1bfb5dc
	.xword	0xfabb5ac51e121ba9
	.xword	0x0d3feb8cb1187e41
	.xword	0xcc76fe1ce09ed38b
	.xword	0x32420f0384abf448
	.xword	0x92d9d9f7a62782fe
	.xword	0x3b40e3496df88929
	.xword	0xfc910ac22bb51345
	.xword	0x50c4b298ac5ca9cb
	.xword	0x88e742cc3a1a9d95
	.xword	0xc849c8acba573d02
	.xword	0xed27e2bba742a801
	.xword	0x2f0ada8273228064
	.xword	0xea86f988db5c5cfd
	.xword	0x4911706fc96a9929
	.xword	0xf133f7bbfffd16b8
	.xword	0x99bab63c65f39b3e
	.xword	0xe17a89a1da3ac8a5
	.xword	0x7d2f47d9d382be6f
	.xword	0xd02e893008666564
	.xword	0xe5b1c6578818e32a
	.xword	0xe37a06a668705a4d
	.xword	0x639b7c5dfcfc0e38
	.xword	0xaca266d95e0a415c
	.xword	0x30ed1484361ef111
	.xword	0xacc8257a5acd6b9a
	.xword	0x2ed76872f9dcca44
	.xword	0x8c0b8b914abcd965
	.xword	0xc976b58f3717607d
	.xword	0xa985dc72d98cb56c
	.xword	0x026f94c3fcda7766
	.xword	0xb23bb63ec5ab239f
	.xword	0x94682f363e0e46a4
	.xword	0xab3b98c9bd49b124
	.xword	0x8391d34ba6fa0642
	.xword	0x9141c754294e3af1
	.xword	0xeafe991a3e9f4634
	.xword	0x1731a09c70b902b9
	.xword	0xaeba5298f7b8d3a0
	.xword	0xf235ac653cf46d90
	.xword	0xc59c324cdf3229dc
	.xword	0x3b566160de49c796
	.xword	0xeaef067b82e61ff9
	.xword	0x066db9ca18b6f7a4
	.xword	0x5f8221b16c549710
	.xword	0x886aad6e7cc7031a
	.xword	0xe43c66e483fa5a18
	.xword	0x2bba746fc594d1d1
	.xword	0xae9d17c3ff986d2f
	.xword	0x2569b97ca61db7f2
	.xword	0x7db733b0c95c7c15
	.xword	0xd291d6d6634c0dc1
	.xword	0x7038559de9211e41
	.xword	0x1166ec429038877f
	.xword	0x3ac259674b38858e
	.xword	0x8f7b6aee7421dfaf
	.xword	0xbd869a37a8bdb837
	.xword	0x39dfa11d6610e3a8
	.xword	0x275598a20e6143bc
	.xword	0x80948447ed0eac1f
	.xword	0x8893dd4d81fa05a8
	.xword	0xf965216d045f6e7b
	.xword	0x84ca54ad2514b1ae
	.xword	0x00cb9e264a7119ac
	.xword	0x53467d12d4a27655
	.xword	0x9df4270dccf00215
	.xword	0xe8ae5bf33a304e04
	.xword	0xa9a81b841b934c29
	.xword	0x01525bc6be01b26a
	.xword	0x7957db87b8e2d457
	.xword	0x74237b2acef59824
	.xword	0xe9be28717002cf43
	.xword	0xb90af4f5c27e50a5
	.xword	0xa09bcbcedc57e8c6
	.xword	0x38dc723d7d674805
	.xword	0x97c52ad459e47067
	.xword	0xb1a52a6e33b98784
	.xword	0xa47c865867665055
	.xword	0xee8e4a9882fded57
	.xword	0xbad5229293382b5b
	.xword	0xdaf85e20d5a6346b
	.xword	0x12370d93d47c1726
	.xword	0x0f27ca42e10cb691
	.xword	0x940a8fca1892817b
	.xword	0x5fe42b6f70ba69e3
	.xword	0x624679303e8f9506
	.xword	0xe5f2b2bb9068098f
	.xword	0xe27ed9c296c3f4b2
	.xword	0x1c3a7182ee76ea10
	.xword	0x445fa8fe285900d4
	.xword	0x5b50c8dccb310a5b
	.xword	0x4fd494ee8766e7a5
	.xword	0xee9f77e101661693
	.xword	0x7734b980b470dafc
	.xword	0xcdb27141d4fd03c2
	.xword	0x04a15fa69594fe1d
	.xword	0x256969300fae8b4a
	.xword	0x335b4008b07c5f99
	.xword	0xc51186452356ede3
	.xword	0x454142424acfbbeb
	.xword	0x8c0a6c0446ae8fe0
	.xword	0x4c09a6779fbf7704
	.xword	0x55df6662e90b7f51
	.xword	0xe9ae1fe087f34c68
	.xword	0x5532c7032e1435c1
	.xword	0xb98abab63129844e



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "18'brr 0000 00rr 00rr rrrr");
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
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 73, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r1");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 77, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 78, Rop_tl, Ft_Rs1, "{12}");
!!#   IJ_set_ropr_fld ("diag.j", 79, Rop_tl, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 80, Rop_tl, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_rvar ("diag.j", 81, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 82, Rop_gl, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_gl, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_gl, Ft_Simm13, "13'b0 0000 0000 0000");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 86, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 89, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 93, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 95, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 96, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 97, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 98, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 99, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 100, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 101, th_all, "\tldx\t[%%g7], %%fsr\n");
!!#   IJ_printf ("diag.j", 102, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 105,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 109, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 116,0xf);
!!#   IJ_th_start ("diag.j", 117,Seq_Start, NULL, 1);
!!#   IJ_printf ("diag.j", 118, th_all, "\tta\tT_GOOD_TRAP\n");
!!# 
!!#   IJ_printf ("diag.j", 120, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 121, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 123, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 124, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 126, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	  IJ_generate ("diag.j", 174, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 178, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 182, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 186, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 190, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 194, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 198, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 213, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 219, th_all, "\tta\tT_CHANGE_HPRIV\n");
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
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	{
!!# 	  IJ_printf ("diag.j", 232, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	{
!!# 	  IJ_printf ("diag.j", 236, th_all, "\tmov\t%rd, %%r14\n", Rv_gl_lvl);
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
!!#           IJ_printf ("diag.j", 290, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 291, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 292, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 293, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 294, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 299, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 300, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 301, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 302, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 303, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 304, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 318, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 319, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 320, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 321, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 322, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINTR %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_printf ("diag.j", 328, th_all, "\tsetx\t0x%rx, %%g1, %%o0\n", Rv_intr_vect);
!!# 	  IJ_printf ("diag.j", 329, th_all, "#ifdef PORTABLE_CORE\n");
!!# 	  IJ_printf ("diag.j", 330, th_all, "\tmov\tPORTABLE_CORE, %%g1\n");
!!# 	  IJ_printf ("diag.j", 331, th_all, "\tsllx\t%%g1, 10, %%g1\n");
!!# 	  IJ_printf ("diag.j", 332, th_all, "\tor\t%%o0, %%g1, %%o0\n");
!!# 	  IJ_printf ("diag.j", 333, th_all, "#endif\n");
!!# 	  IJ_printf ("diag.j", 334, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	}
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
