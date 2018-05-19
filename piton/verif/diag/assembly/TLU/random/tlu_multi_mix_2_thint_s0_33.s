// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_33.s
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
   random seed:	215722317
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

	setx 0xd556d4d6b88f145a, %g1, %g0
	setx 0x8c805ccca7df07b0, %g1, %g1
	setx 0x25e931aca1920228, %g1, %g2
	setx 0xdb4ff7aecdabb4a0, %g1, %g3
	setx 0x929c32e61db69c89, %g1, %g4
	setx 0x30bf658fb8100018, %g1, %g5
	setx 0xc6a0131ff62d4a59, %g1, %g6
	setx 0xd92d64ffd108a60e, %g1, %g7
	setx 0x6eb2e4197c3de055, %g1, %r16
	setx 0xd61fa8b519f13ba0, %g1, %r17
	setx 0x15f997357f7b7d75, %g1, %r18
	setx 0xd40b0e0797630ae1, %g1, %r19
	setx 0x2436075666b53782, %g1, %r20
	setx 0x3354af0778b46220, %g1, %r21
	setx 0xc77b91a51d680217, %g1, %r22
	setx 0x8de3e4392b422c5e, %g1, %r23
	setx 0x192bda0fc9fb6466, %g1, %r24
	setx 0x35a5aab470872ba5, %g1, %r25
	setx 0x7c35c3e0bb0017dd, %g1, %r26
	setx 0x986b68319b1886b7, %g1, %r27
	setx 0xc2fdbb63d5eac0b9, %g1, %r28
	setx 0xc2bf554cba895924, %g1, %r29
	setx 0x39d7e688f9ea765e, %g1, %r30
	setx 0x15594b0afe04a441, %g1, %r31
	save
	setx 0xd6f1ba4f601cfd89, %g1, %r16
	setx 0x773c72ac00533afc, %g1, %r17
	setx 0x0afd4f50361aa1a5, %g1, %r18
	setx 0x8b05529231940b55, %g1, %r19
	setx 0xfc6ba9a524cc3b76, %g1, %r20
	setx 0x408e04708c03ee5a, %g1, %r21
	setx 0x369c72e81428cac4, %g1, %r22
	setx 0xfead59fd893cb9b0, %g1, %r23
	setx 0xac0e94e5d53705f4, %g1, %r24
	setx 0x6d07ae784e3fd475, %g1, %r25
	setx 0x778fc3fe81c43ac1, %g1, %r26
	setx 0x90d17d361fecafb5, %g1, %r27
	setx 0x5a628056c6e516d0, %g1, %r28
	setx 0xe15d343cb7deda88, %g1, %r29
	setx 0x98b6ac206f5348a9, %g1, %r30
	setx 0x57ed35f98433731b, %g1, %r31
	save
	setx 0x2d73a95fd92cfb8a, %g1, %r16
	setx 0x7364d97e1c9b0976, %g1, %r17
	setx 0x422a37dac00451ca, %g1, %r18
	setx 0xc0e5dff816b83140, %g1, %r19
	setx 0x006d7e7398065739, %g1, %r20
	setx 0xc0758b8dbdd7182a, %g1, %r21
	setx 0x57e891025d1a5c2c, %g1, %r22
	setx 0x62b0e41ed589c8ff, %g1, %r23
	setx 0xeef703515c9dedef, %g1, %r24
	setx 0x844d6ec6373f6fc3, %g1, %r25
	setx 0x822bf476a7caef93, %g1, %r26
	setx 0x1e918e78bff315d8, %g1, %r27
	setx 0xc313be9cf866d284, %g1, %r28
	setx 0x95b978d22d7eadf6, %g1, %r29
	setx 0x229cb4de486eb705, %g1, %r30
	setx 0x1228ca7475f86b02, %g1, %r31
	save
	setx 0xf9820e9e1caf038e, %g1, %r16
	setx 0xd07362808192d52b, %g1, %r17
	setx 0x3e581fe6599129e7, %g1, %r18
	setx 0xf32dbf496b08fdbc, %g1, %r19
	setx 0x9a3cfb0b3bfcaeef, %g1, %r20
	setx 0xcdf4babc3e0cc2b1, %g1, %r21
	setx 0x84345b803965e7c3, %g1, %r22
	setx 0x802c31c39f8f838a, %g1, %r23
	setx 0x9f7075b18913b835, %g1, %r24
	setx 0x8c0bb0106ca115c5, %g1, %r25
	setx 0xdc09eacb0d5d92b6, %g1, %r26
	setx 0x32025b18a2eb8292, %g1, %r27
	setx 0x4e5689f19b9f6d3d, %g1, %r28
	setx 0x07b3b53c127b3f30, %g1, %r29
	setx 0x4845846d859e39c4, %g1, %r30
	setx 0xc3a5e78896f84adc, %g1, %r31
	save
	setx 0xc8a573caf9dcdf55, %g1, %r16
	setx 0x6a43e399f6ba3b67, %g1, %r17
	setx 0x63820e10bbbfa9e3, %g1, %r18
	setx 0x0114311466dca86b, %g1, %r19
	setx 0x9922ac6b7d9989bc, %g1, %r20
	setx 0x79099487272fae0a, %g1, %r21
	setx 0xa2f137114a4bd658, %g1, %r22
	setx 0x907fb95d10ec0bba, %g1, %r23
	setx 0xcb22e8c0f7d9307a, %g1, %r24
	setx 0xf374fc22bb057b64, %g1, %r25
	setx 0x7e36704e4d4d2cdd, %g1, %r26
	setx 0x69c48d78b691a833, %g1, %r27
	setx 0x08feab4b4f867cee, %g1, %r28
	setx 0x085a2ad2985a619e, %g1, %r29
	setx 0x8c35b65742e1b2ef, %g1, %r30
	setx 0x76b585f7128b28b0, %g1, %r31
	save
	setx 0x59064050a7be7bc3, %g1, %r16
	setx 0xdd2a4d15b1a4b786, %g1, %r17
	setx 0x29dbd15f8c7cfb18, %g1, %r18
	setx 0xb3b592963dd7eaf6, %g1, %r19
	setx 0xaaa7390161bbbcd2, %g1, %r20
	setx 0x652adc13452b0ed4, %g1, %r21
	setx 0x6cec4f35a666aaec, %g1, %r22
	setx 0x8b649d0ab249a89d, %g1, %r23
	setx 0xfbdd8e60b6f5ea90, %g1, %r24
	setx 0x9122ec6326303349, %g1, %r25
	setx 0xcc4117f4fa7de763, %g1, %r26
	setx 0x8a2b15f395d182ea, %g1, %r27
	setx 0x7a8708332710c74c, %g1, %r28
	setx 0xde1609e33ffee610, %g1, %r29
	setx 0xd88cebbdd73a0bd6, %g1, %r30
	setx 0x367630c44144a7b6, %g1, %r31
	save
	setx 0xc82ed0b3b91f3cec, %g1, %r16
	setx 0x98c8e749e0800f97, %g1, %r17
	setx 0x058b725002fd4c01, %g1, %r18
	setx 0xb7df6ecb3e6bd5bd, %g1, %r19
	setx 0xe38ec3d6bef654ab, %g1, %r20
	setx 0x60f601ca486edb94, %g1, %r21
	setx 0x8341257b49b51842, %g1, %r22
	setx 0x71a7d01eabd95a26, %g1, %r23
	setx 0xb68b61dd2d81e1c1, %g1, %r24
	setx 0x6cb47d9c6d17e8fa, %g1, %r25
	setx 0xbe37bca5b2c9febb, %g1, %r26
	setx 0x57aada436c4e6393, %g1, %r27
	setx 0xb4a31a2fa0531edf, %g1, %r28
	setx 0x53d4f2ea5d526788, %g1, %r29
	setx 0x3284938fbad67ed5, %g1, %r30
	setx 0x49729c1280dd260b, %g1, %r31
	save
	setx 0xee094e68bbd0b9f3, %g1, %r16
	setx 0xe4f7dd3caa2ec4f8, %g1, %r17
	setx 0xffdadbaa34b01697, %g1, %r18
	setx 0xb8c2b156a7131a23, %g1, %r19
	setx 0x3854639fc2348f7f, %g1, %r20
	setx 0xd4b9d2e3a23053e7, %g1, %r21
	setx 0x58abafa52f27082c, %g1, %r22
	setx 0x8f03fb6ecbf05ee5, %g1, %r23
	setx 0x41dae03cf02f8a8f, %g1, %r24
	setx 0x024dc115711f177e, %g1, %r25
	setx 0xa90d1e979e53df92, %g1, %r26
	setx 0x8054b4b0927ba2a0, %g1, %r27
	setx 0x982c5b58f99b431b, %g1, %r28
	setx 0x08b19838f86b6afb, %g1, %r29
	setx 0x7dfbb32562c98679, %g1, %r30
	setx 0x74c70e8fcabf1b5e, %g1, %r31
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
	.word 0xbde4a074  ! 4: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_1, %g1, %r21
	.word 0xbb504000  ! 12: RDPR_TNPC	<illegal instruction>
	.word 0x8994216f  ! 14: WRPR_TICK_I	wrpr	%r16, 0x016f, %tick
	.word 0xbfe4e106  ! 16: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e5a13c  ! 19: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde56086  ! 20: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a184  ! 22: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5214d  ! 23: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd51c000  ! 24: RDPR_TL	<illegal instruction>
	.word 0x8394211a  ! 25: WRPR_TNPC_I	wrpr	%r16, 0x011a, %tnpc
	.word 0xb3e460dc  ! 28: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb518000  ! 33: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4607d  ! 37: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x2ca6f55800001ac5, %g1, %r10
	.word 0x819a8000  ! 39: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe5a1dc  ! 41: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4603b  ! 42: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb3d0000  ! 43: SRA_R	sra 	%r20, %r0, %r29
	.word 0xbfe4a1fb  ! 44: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560fb  ! 48: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4611c  ! 49: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0b3  ! 52: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e521f6  ! 57: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe56105  ! 58: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a126  ! 59: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5540000  ! 60: RDPR_GL	<illegal instruction>
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 66: SUBC_R	orn 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad21e8  ! 75: ANDNcc_I	andncc 	%r20, 0x01e8, %r30
	.word 0x8d95e036  ! 78: WRPR_PSTATE_I	wrpr	%r23, 0x0036, %pstate
	.word 0xb1e4209f  ! 81: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e42188  ! 82: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e46195  ! 83: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4e1c1  ! 88: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5616d  ! 90: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5a09c  ! 91: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbd2c4000  ! 92: SLL_R	sll 	%r17, %r0, %r30
	.word 0xb9e4a1bd  ! 93: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e42088  ! 95: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb0058000  ! 103: ADD_R	add 	%r22, %r0, %r24
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4202e  ! 108: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde52174  ! 112: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8595a111  ! 113: WRPR_TSTATE_I	wrpr	%r22, 0x0111, %tstate
	.word 0xb9508000  ! 114: RDPR_TSTATE	<illegal instruction>
	setx	0xcc7c763f0000be91, %g1, %r10
	.word 0x839a8000  ! 116: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0f3  ! 123: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e561e6  ! 132: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5a1cf  ! 134: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919521f0  ! 140: WRPR_PIL_I	wrpr	%r20, 0x01f0, %pil
	.word 0x8194205e  ! 144: WRPR_TPC_I	wrpr	%r16, 0x005e, %tpc
	setx	data_start_3, %g1, %r20
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a19c  ! 152: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd540000  ! 153: RDPR_GL	<illegal instruction>
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5208a  ! 155: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e461d7  ! 156: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe4a18d  ! 158: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xb7e42147  ! 164: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x3af32ac00002885, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0c9  ! 177: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8594a0f0  ! 179: WRPR_TSTATE_I	wrpr	%r18, 0x00f0, %tstate
	.word 0xb551c000  ! 182: RDPR_TL	<illegal instruction>
	.word 0xb8bc8000  ! 183: XNORcc_R	xnorcc 	%r18, %r0, %r28
	.word 0xb3540000  ! 185: RDPR_GL	<illegal instruction>
	.word 0xb5e4e1f3  ! 189: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e561ab  ! 190: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x83942115  ! 191: WRPR_TNPC_I	wrpr	%r16, 0x0115, %tnpc
	.word 0xbde4211f  ! 196: SAVE_I	save	%r16, 0x0001, %r30
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 212: RDPR_TT	<illegal instruction>
	.word 0x9195a14d  ! 213: WRPR_PIL_I	wrpr	%r22, 0x014d, %pil
	.word 0xbb2de001  ! 215: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0xb8ac0000  ! 216: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xb3540000  ! 224: RDPR_GL	<illegal instruction>
	.word 0xb1e4213b  ! 227: SAVE_I	save	%r16, 0x0001, %r24
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0fe  ! 240: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_3, %g1, %r19
	.word 0xb1643801  ! 244: MOVcc_I	<illegal instruction>
	.word 0xb1508000  ! 247: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4202d  ! 248: SAVE_I	save	%r16, 0x0001, %r29
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1ef  ! 254: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5480000  ! 255: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb32d5000  ! 256: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xbbe5603a  ! 258: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xba3c0000  ! 260: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xb7e4a0ab  ! 262: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4a0f4  ! 264: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e123  ! 269: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8595a1f7  ! 270: WRPR_TSTATE_I	wrpr	%r22, 0x01f7, %tstate
	setx	data_start_3, %g1, %r17
	mov	2, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1504000  ! 283: RDPR_TNPC	<illegal instruction>
	.word 0xb7e56039  ! 285: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0x8f930000  ! 294: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x859521ec  ! 295: WRPR_TSTATE_I	wrpr	%r20, 0x01ec, %tstate
	.word 0x8594e0d8  ! 301: WRPR_TSTATE_I	wrpr	%r19, 0x00d8, %tstate
	.word 0xb7e52186  ! 302: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe56006  ! 303: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5e0e5  ! 304: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_5, %g1, %r21
	.word 0xb9504000  ! 313: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e0fe  ! 315: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1518000  ! 316: RDPR_PSTATE	<illegal instruction>
	setx	0x7e23bb7e0000fa45, %g1, %r10
	.word 0x819a8000  ! 319: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb6a5a0e0  ! 320: SUBcc_I	subcc 	%r22, 0x00e0, %r27
	.word 0xbfe42027  ! 323: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5e035  ! 324: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e4216c  ! 327: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5e10e  ! 330: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e460ec  ! 331: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5a1e0  ! 332: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9194e0b5  ! 333: WRPR_PIL_I	wrpr	%r19, 0x00b5, %pil
	.word 0xbfe5a17f  ! 337: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde42011  ! 339: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb51c000  ! 342: RDPR_TL	<illegal instruction>
	.word 0xb9e52171  ! 343: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb41d8000  ! 344: XOR_R	xor 	%r22, %r0, %r26
	.word 0xb1e561ab  ! 346: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe52150  ! 348: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5a17d  ! 349: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe46113  ! 354: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbeb4a17b  ! 356: SUBCcc_I	orncc 	%r18, 0x017b, %r31
	.word 0xb7e5e14d  ! 359: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4a1e4  ! 360: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x819521f6  ! 361: WRPR_TPC_I	wrpr	%r20, 0x01f6, %tpc
	.word 0xbde5e014  ! 362: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e461d7  ! 363: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde460f6  ! 366: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd518000  ! 369: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e560f5  ! 371: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8d9421bf  ! 372: WRPR_PSTATE_I	wrpr	%r16, 0x01bf, %pstate
	.word 0xb4140000  ! 373: OR_R	or 	%r16, %r0, %r26
	.word 0xb5500000  ! 375: RDPR_TPC	<illegal instruction>
	.word 0xb3e4a0d4  ! 376: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb534b001  ! 377: SRLX_I	srlx	%r18, 0x0001, %r26
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 382: RDPR_GL	<illegal instruction>
	.word 0xb1e5e054  ! 385: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd500000  ! 386: RDPR_TPC	<illegal instruction>
	.word 0xb92c9000  ! 391: SLLX_R	sllx	%r18, %r0, %r28
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1cf  ! 398: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a03c  ! 399: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb12d0000  ! 400: SLL_R	sll 	%r20, %r0, %r24
	.word 0xbfe5a0e3  ! 403: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e117  ! 408: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5e00e  ! 412: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x81952014  ! 415: WRPR_TPC_I	wrpr	%r20, 0x0014, %tpc
	.word 0xb3e561d9  ! 417: SAVE_I	save	%r21, 0x0001, %r25
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	setx	0x573e0b0e0000e8cf, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e4a056  ! 430: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb41c6174  ! 432: XOR_I	xor 	%r17, 0x0174, %r26
	.word 0xb9e5e0ce  ! 435: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbf510000  ! 437: RDPR_TICK	<illegal instruction>
	.word 0xb3e42152  ! 444: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x899560c8  ! 445: WRPR_TICK_I	wrpr	%r21, 0x00c8, %tick
	.word 0xbbe4e14f  ! 446: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e460ca  ! 447: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e56071  ! 450: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe52194  ! 451: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46037  ! 455: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe521d7  ! 457: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9e5a063  ! 465: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde42089  ! 470: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4617b  ! 471: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e421f9  ! 476: SAVE_I	save	%r16, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 477: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe42029  ! 481: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x89956191  ! 485: WRPR_TICK_I	wrpr	%r21, 0x0191, %tick
	.word 0xbfe461f2  ! 488: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe420a2  ! 490: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_7, %g1, %r21
	.word 0xb7e46049  ! 493: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4211d  ! 494: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9540000  ! 495: RDPR_GL	<illegal instruction>
	.word 0xb7e4e0b0  ! 497: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e52041  ! 503: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4e032  ! 505: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5214e  ! 506: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5a12c  ! 508: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb500000  ! 511: RDPR_TPC	<illegal instruction>
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9342001  ! 517: SRL_I	srl 	%r16, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5210f  ! 526: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb92c5000  ! 528: SLLX_R	sllx	%r17, %r0, %r28
	setx	0xef330cdf000098c0, %g1, %r10
	.word 0x839a8000  ! 532: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0a50000  ! 536: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0xbbe521b3  ! 538: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d952150  ! 539: WRPR_PSTATE_I	wrpr	%r20, 0x0150, %pstate
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395205c  ! 543: WRPR_TNPC_I	wrpr	%r20, 0x005c, %tnpc
	.word 0xb7e5617a  ! 544: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56156  ! 548: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde56132  ! 549: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1510000  ! 554: RDPR_TICK	<illegal instruction>
	.word 0xb3e460ce  ! 557: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e460e5  ! 558: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4e194  ! 559: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb094e0a4  ! 561: ORcc_I	orcc 	%r19, 0x00a4, %r24
	.word 0xb5e56038  ! 562: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe52054  ! 563: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5e1ab  ! 565: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe421b0  ! 568: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5a0bd  ! 571: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5215e  ! 573: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8394a047  ! 574: WRPR_TNPC_I	wrpr	%r18, 0x0047, %tnpc
	.word 0xbbe5619c  ! 577: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42047  ! 579: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb33c6001  ! 581: SRA_I	sra 	%r17, 0x0001, %r25
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a167  ! 586: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe460da  ! 587: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4e033  ! 588: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5212a  ! 589: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a17d  ! 592: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520e5  ! 596: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e1dc  ! 599: SAVE_I	save	%r23, 0x0001, %r25
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 602: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e073  ! 605: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x89942106  ! 608: WRPR_TICK_I	wrpr	%r16, 0x0106, %tick
	.word 0xbbe4e0dc  ! 609: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbab58000  ! 610: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xba05c000  ! 611: ADD_R	add 	%r23, %r0, %r29
	setx	data_start_3, %g1, %r18
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819520ea  ! 614: WRPR_TPC_I	wrpr	%r20, 0x00ea, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e52139  ! 619: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7518000  ! 620: RDPR_PSTATE	<illegal instruction>
	setx	0xf0b18330000d91c, %g1, %r10
	.word 0x839a8000  ! 621: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1b0  ! 631: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4e0f3  ! 632: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a05a  ! 636: WRPR_TICK_I	wrpr	%r22, 0x005a, %tick
	mov	2, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb2bcc000  ! 639: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xb9e42114  ! 640: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x899560c2  ! 642: WRPR_TICK_I	wrpr	%r21, 0x00c2, %tick
	.word 0x8394a0c4  ! 649: WRPR_TNPC_I	wrpr	%r18, 0x00c4, %tnpc
	.word 0xbc2cc000  ! 655: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xb1520000  ! 657: RDPR_PIL	<illegal instruction>
	.word 0xbb500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xbe0dc000  ! 661: AND_R	and 	%r23, %r0, %r31
	.word 0xb3e4e166  ! 662: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_4, %g1, %r20
	setx	data_start_1, %g1, %r20
	.word 0xb5e561d9  ! 671: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8d94a174  ! 672: WRPR_PSTATE_I	wrpr	%r18, 0x0174, %pstate
	setx	data_start_3, %g1, %r18
	.word 0xbfe42007  ! 674: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe461cc  ! 676: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e420db  ! 677: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4a02b  ! 678: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7510000  ! 679: RDPR_TICK	<illegal instruction>
	.word 0xbde5e050  ! 680: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe4e137  ! 686: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x819520e3  ! 688: WRPR_TPC_I	wrpr	%r20, 0x00e3, %tpc
	.word 0x839560ca  ! 691: WRPR_TNPC_I	wrpr	%r21, 0x00ca, %tnpc
	.word 0xb1e52010  ! 696: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde56012  ! 697: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a153  ! 705: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe461aa  ! 707: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9508000  ! 710: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e421fb  ! 712: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd2c6001  ! 715: SLL_I	sll 	%r17, 0x0001, %r30
	.word 0xbde4a123  ! 717: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8194e062  ! 720: WRPR_TPC_I	wrpr	%r19, 0x0062, %tpc
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5600a  ! 728: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xba14e0a1  ! 732: OR_I	or 	%r19, 0x00a1, %r29
	.word 0xbde5a02e  ! 735: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0db  ! 739: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e42165  ! 740: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 743: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7e421a2  ! 744: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4601e  ! 745: SAVE_I	save	%r17, 0x0001, %r25
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561f5  ! 749: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e46036  ! 751: SAVE_I	save	%r17, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde5e0bc  ! 759: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5480000  ! 761: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbd480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1ea  ! 764: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e5a0a3  ! 766: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe460bf  ! 767: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e52180  ! 768: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e46062  ! 771: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe42034  ! 773: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5203d  ! 776: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8194e0f2  ! 778: WRPR_TPC_I	wrpr	%r19, 0x00f2, %tpc
	setx	data_start_0, %g1, %r21
	.word 0xb1e4a0a1  ! 781: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461e9  ! 784: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_5, %g1, %r19
	.word 0xbfe56087  ! 789: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x919560f2  ! 792: WRPR_PIL_I	wrpr	%r21, 0x00f2, %pil
	.word 0xbe940000  ! 794: ORcc_R	orcc 	%r16, %r0, %r31
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	mov	0, %r12
	.word 0xa1930000  ! 805: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e4a1b6  ! 806: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb0b54000  ! 807: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xb3e4a1b1  ! 808: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4e162  ! 811: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4a0ae  ! 813: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5e1ae  ! 814: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4616c  ! 817: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a055  ! 819: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e4a165  ! 824: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e044  ! 830: SAVE_I	save	%r19, 0x0001, %r30
	setx	0xcf25f2280000ccc6, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e420c8  ! 834: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4e024  ! 835: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5a0a3  ! 836: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e460fb  ! 840: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4e115  ! 841: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_3, %g1, %r23
	.word 0x839561b0  ! 849: WRPR_TNPC_I	wrpr	%r21, 0x01b0, %tnpc
	.word 0xb5e5a14a  ! 852: SAVE_I	save	%r22, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 853: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a121  ! 857: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3540000  ! 858: RDPR_GL	<illegal instruction>
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520db  ! 864: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb351c000  ! 865: RDPR_TL	<illegal instruction>
	.word 0xb7e5a07b  ! 867: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946082  ! 869: WRPR_TNPC_I	wrpr	%r17, 0x0082, %tnpc
	.word 0xb5e4a06a  ! 870: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5a019  ! 875: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e420d7  ! 878: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5a008  ! 879: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd51c000  ! 880: RDPR_TL	<illegal instruction>
	.word 0xbfe5e07d  ! 882: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb8ac8000  ! 886: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0x9194e15b  ! 889: WRPR_PIL_I	wrpr	%r19, 0x015b, %pil
	.word 0xb4444000  ! 892: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xbfe42172  ! 894: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe5a115  ! 895: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7510000  ! 897: RDPR_TICK	<illegal instruction>
	.word 0xb7e42149  ! 898: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb951c000  ! 899: RDPR_TL	<illegal instruction>
	.word 0xb1e56154  ! 900: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a0c0  ! 902: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879520f1  ! 909: WRPR_TT_I	wrpr	%r20, 0x00f1, %tt
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 914: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb480000  ! 917: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899521e3  ! 923: WRPR_TICK_I	wrpr	%r20, 0x01e3, %tick
	.word 0xb9e5a00e  ! 924: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7508000  ! 926: RDPR_TSTATE	<illegal instruction>
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a12c  ! 938: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e00b  ! 940: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0bc  ! 947: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a006  ! 952: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e4e1bd  ! 953: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x9194609b  ! 954: WRPR_PIL_I	wrpr	%r17, 0x009b, %pil
	.word 0xb80da084  ! 957: AND_I	and 	%r22, 0x0084, %r28
	.word 0xb3e5e1b4  ! 961: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a093  ! 963: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_7, %g1, %r23
	.word 0xb9e4e14c  ! 968: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5e1ce  ! 970: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1d7  ! 977: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	setx	0x333e4240000980f, %g1, %r10
	.word 0x839a8000  ! 983: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81956100  ! 985: WRPR_TPC_I	wrpr	%r21, 0x0100, %tpc
	.word 0xbfe4e119  ! 986: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4e1b4  ! 987: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde520d5  ! 989: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8195619e  ! 990: WRPR_TPC_I	wrpr	%r21, 0x019e, %tpc
	.word 0xbd540000  ! 992: RDPR_GL	<illegal instruction>
	.word 0xbb504000  ! 995: RDPR_TNPC	<illegal instruction>
	setx	data_start_6, %g1, %r21
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
	.word 0xf875e053  ! 6: STX_I	stx	%r28, [%r23 + 0x0053]
	.word 0xfc34a1b4  ! 9: STH_I	sth	%r30, [%r18 + 0x01b4]
	setx	data_start_5, %g1, %r22
	.word 0xb3504000  ! 12: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8994e085  ! 14: WRPR_TICK_I	wrpr	%r19, 0x0085, %tick
	.word 0xf22cc000  ! 15: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf43ce19b  ! 17: STD_I	std	%r26, [%r19 + 0x019b]
	.word 0xfc2d0000  ! 18: STB_R	stb	%r30, [%r20 + %r0]
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 24: RDPR_TL	rdpr	%tl, %r26
	.word 0x8395614b  ! 25: WRPR_TNPC_I	wrpr	%r21, 0x014b, %tnpc
	.word 0xf4348000  ! 27: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb1518000  ! 33: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf62dc000  ! 36: STB_R	stb	%r27, [%r23 + %r0]
	setx	0x4dc41f2c00003d8d, %g1, %r10
	.word 0x819a8000  ! 39: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf3d4000  ! 43: SRA_R	sra 	%r21, %r0, %r31
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d4000  ! 46: STDF_R	std	%f31, [%r0, %r21]
	.word 0xf0258000  ! 47: STW_R	stw	%r24, [%r22 + %r0]
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 56: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xb7540000  ! 60: RDPR_GL	rdpr	%-, %r27
	.word 0xfd3d6044  ! 63: STDF_I	std	%f30, [0x0044, %r21]
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 66: SUBC_R	orn 	%r19, %r0, %r24
	.word 0xf6350000  ! 68: STH_R	sth	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd3ca0ff  ! 73: STDF_I	std	%f30, [0x00ff, %r18]
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad61dd  ! 75: ANDNcc_I	andncc 	%r21, 0x01dd, %r29
	.word 0xfe2c600c  ! 77: STB_I	stb	%r31, [%r17 + 0x000c]
	.word 0x8d94e00e  ! 78: WRPR_PSTATE_I	wrpr	%r19, 0x000e, %pstate
	.word 0xfd3c8000  ! 84: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf475c000  ! 86: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf625208b  ! 87: STW_I	stw	%r27, [%r20 + 0x008b]
	.word 0xb72c4000  ! 92: SLL_R	sll 	%r17, %r0, %r27
	.word 0xf02d4000  ! 94: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf4740000  ! 96: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb4044000  ! 103: ADD_R	add 	%r17, %r0, %r26
	.word 0xf33c60f2  ! 104: STDF_I	std	%f25, [0x00f2, %r17]
	.word 0xf13c4000  ! 105: STDF_R	std	%f24, [%r0, %r17]
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859421c2  ! 113: WRPR_TSTATE_I	wrpr	%r16, 0x01c2, %tstate
	.word 0xb3508000  ! 114: RDPR_TSTATE	rdpr	%tstate, %r25
	setx	0xf0aedc8200009d93, %g1, %r10
	.word 0x839a8000  ! 116: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d6010  ! 122: STDF_I	std	%f31, [0x0010, %r21]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33d210a  ! 137: STDF_I	std	%f25, [0x010a, %r20]
	.word 0xfa3c0000  ! 139: STD_R	std	%r29, [%r16 + %r0]
	.word 0x9194a003  ! 140: WRPR_PIL_I	wrpr	%r18, 0x0003, %pil
	.word 0x8195e114  ! 144: WRPR_TPC_I	wrpr	%r23, 0x0114, %tpc
	setx	data_start_2, %g1, %r23
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ca17c  ! 150: STB_I	stb	%r26, [%r18 + 0x017c]
	.word 0xb3540000  ! 153: RDPR_GL	rdpr	%-, %r25
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c61e7  ! 160: STB_I	stb	%r28, [%r17 + 0x01e7]
	.word 0xbd540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xf42de139  ! 165: STB_I	stb	%r26, [%r23 + 0x0139]
	setx	0xeeedde5400007946, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d20e9  ! 172: STD_I	std	%r24, [%r20 + 0x00e9]
	.word 0xf73cc000  ! 176: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf424a162  ! 178: STW_I	stw	%r26, [%r18 + 0x0162]
	.word 0x8594205d  ! 179: WRPR_TSTATE_I	wrpr	%r16, 0x005d, %tstate
	.word 0xf73dc000  ! 180: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfa344000  ! 181: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb551c000  ! 182: RDPR_TL	rdpr	%tl, %r26
	.word 0xb8bdc000  ! 183: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xf2254000  ! 184: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb1540000  ! 185: RDPR_GL	<illegal instruction>
	.word 0x839420f4  ! 191: WRPR_TNPC_I	wrpr	%r16, 0x00f4, %tnpc
	.word 0xfc2cc000  ! 197: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf53d8000  ! 198: STDF_R	std	%f26, [%r0, %r22]
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d613a  ! 208: STB_I	stb	%r31, [%r21 + 0x013a]
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 212: RDPR_TT	rdpr	%tt, %r31
	.word 0x9195a015  ! 213: WRPR_PIL_I	wrpr	%r22, 0x0015, %pil
	.word 0xf435616d  ! 214: STH_I	sth	%r26, [%r21 + 0x016d]
	.word 0xb92c2001  ! 215: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xbcad4000  ! 216: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xf275e0b9  ! 218: STX_I	stx	%r25, [%r23 + 0x00b9]
	.word 0xf8340000  ! 220: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfa344000  ! 221: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf82c8000  ! 223: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xb5540000  ! 224: RDPR_GL	rdpr	%-, %r26
	.word 0xfe35200a  ! 225: STH_I	sth	%r31, [%r20 + 0x000a]
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074c000  ! 233: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfe240000  ! 234: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfb3cc000  ! 235: STDF_R	std	%f29, [%r0, %r19]
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r19
	.word 0xb5643801  ! 244: MOVcc_I	<illegal instruction>
	.word 0xb5508000  ! 247: RDPR_TSTATE	<illegal instruction>
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8744000  ! 253: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb9480000  ! 255: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb72c5000  ! 256: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xf73d2053  ! 257: STDF_I	std	%f27, [0x0053, %r20]
	.word 0xb83c8000  ! 260: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xfc254000  ! 266: STW_R	stw	%r30, [%r21 + %r0]
	.word 0x8595a1a2  ! 270: WRPR_TSTATE_I	wrpr	%r22, 0x01a2, %tstate
	.word 0xf4746054  ! 271: STX_I	stx	%r26, [%r17 + 0x0054]
	.word 0xf13d6018  ! 272: STDF_I	std	%f24, [0x0018, %r21]
	setx	data_start_3, %g1, %r22
	.word 0xfc2c6150  ! 275: STB_I	stb	%r30, [%r17 + 0x0150]
	.word 0xf93c61a6  ! 278: STDF_I	std	%f28, [0x01a6, %r17]
	mov	0, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03d0000  ! 282: STD_R	std	%r24, [%r20 + %r0]
	.word 0xbd504000  ! 283: RDPR_TNPC	rdpr	%tnpc, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe35e1aa  ! 293: STH_I	sth	%r31, [%r23 + 0x01aa]
	mov	0, %r12
	.word 0x8f930000  ! 294: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594e077  ! 295: WRPR_TSTATE_I	wrpr	%r19, 0x0077, %tstate
	.word 0x8594205e  ! 301: WRPR_TSTATE_I	wrpr	%r16, 0x005e, %tstate
	.word 0xbb480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf63d0000  ! 310: STD_R	std	%r27, [%r20 + %r0]
	setx	data_start_7, %g1, %r20
	.word 0xbb504000  ! 313: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 316: RDPR_PSTATE	<illegal instruction>
	.word 0xfc250000  ! 317: STW_R	stw	%r30, [%r20 + %r0]
	setx	0x76180b9d00001f94, %g1, %r10
	.word 0x819a8000  ! 319: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb6a4a073  ! 320: SUBcc_I	subcc 	%r18, 0x0073, %r27
	.word 0xfc74e0d7  ! 329: STX_I	stx	%r30, [%r19 + 0x00d7]
	.word 0x9194200a  ! 333: WRPR_PIL_I	wrpr	%r16, 0x000a, %pil
	.word 0xf33de178  ! 336: STDF_I	std	%f25, [0x0178, %r23]
	.word 0xfa248000  ! 338: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf53d0000  ! 341: STDF_R	std	%f26, [%r0, %r20]
	.word 0xbf51c000  ! 342: RDPR_TL	rdpr	%tl, %r31
	.word 0xb81c4000  ! 344: XOR_R	xor 	%r17, %r0, %r28
	.word 0xfa75619e  ! 345: STX_I	stx	%r29, [%r21 + 0x019e]
	.word 0xf83d0000  ! 351: STD_R	std	%r28, [%r20 + %r0]
	.word 0xf224a12d  ! 353: STW_I	stw	%r25, [%r18 + 0x012d]
	.word 0xb0b560dc  ! 356: SUBCcc_I	orncc 	%r21, 0x00dc, %r24
	.word 0xf83ce05a  ! 357: STD_I	std	%r28, [%r19 + 0x005a]
	.word 0x819560e1  ! 361: WRPR_TPC_I	wrpr	%r21, 0x00e1, %tpc
	.word 0xf02c2059  ! 368: STB_I	stb	%r24, [%r16 + 0x0059]
	.word 0xbf518000  ! 369: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0x8d95600b  ! 372: WRPR_PSTATE_I	wrpr	%r21, 0x000b, %pstate
	.word 0xb0150000  ! 373: OR_R	or 	%r20, %r0, %r24
	.word 0xb7500000  ! 375: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xbf35f001  ! 377: SRLX_I	srlx	%r23, 0x0001, %r31
	.word 0xf8350000  ! 378: STH_R	sth	%r28, [%r20 + %r0]
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 382: RDPR_GL	<illegal instruction>
	.word 0xf53c4000  ! 383: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf4248000  ! 384: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb9500000  ! 386: RDPR_TPC	<illegal instruction>
	.word 0xf675e14a  ! 388: STX_I	stx	%r27, [%r23 + 0x014a]
	.word 0xf82d0000  ! 389: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xfa34a028  ! 390: STH_I	sth	%r29, [%r18 + 0x0028]
	.word 0xbd2c9000  ! 391: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xf13d0000  ! 394: STDF_R	std	%f24, [%r0, %r20]
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8758000  ! 396: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xb92cc000  ! 400: SLL_R	sll 	%r19, %r0, %r28
	.word 0xfc3d0000  ! 404: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfe3d2105  ! 414: STD_I	std	%r31, [%r20 + 0x0105]
	.word 0x8194e1a9  ! 415: WRPR_TPC_I	wrpr	%r19, 0x01a9, %tpc
	.word 0xf474e086  ! 416: STX_I	stx	%r26, [%r19 + 0x0086]
	.word 0xf53cc000  ! 418: STDF_R	std	%f26, [%r0, %r19]
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe250000  ! 422: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf6258000  ! 424: STW_R	stw	%r27, [%r22 + %r0]
	setx	0x1fcd602e0000eacf, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba1d61ed  ! 432: XOR_I	xor 	%r21, 0x01ed, %r29
	.word 0xf73c0000  ! 433: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb7510000  ! 437: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf03d4000  ! 440: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf53da151  ! 441: STDF_I	std	%f26, [0x0151, %r22]
	.word 0xf234a17d  ! 443: STH_I	sth	%r25, [%r18 + 0x017d]
	.word 0x89956052  ! 445: WRPR_TICK_I	wrpr	%r21, 0x0052, %tick
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 453: STB_R	stb	%r27, [%r22 + %r0]
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824a1bf  ! 461: STW_I	stw	%r28, [%r18 + 0x01bf]
	.word 0xbd480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf8254000  ! 469: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfe250000  ! 472: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xff3dc000  ! 474: STDF_R	std	%f31, [%r0, %r23]
	mov	0, %r12
	.word 0xa1930000  ! 477: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf635e096  ! 479: STH_I	sth	%r27, [%r23 + 0x0096]
	.word 0x8994a031  ! 485: WRPR_TICK_I	wrpr	%r18, 0x0031, %tick
	.word 0xfe3d8000  ! 486: STD_R	std	%r31, [%r22 + %r0]
	.word 0xb5508000  ! 489: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	data_start_1, %g1, %r23
	.word 0xb9540000  ! 495: RDPR_GL	<illegal instruction>
	.word 0xf23c4000  ! 499: STD_R	std	%r25, [%r17 + %r0]
	.word 0xfd3d4000  ! 500: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf22d604e  ! 502: STB_I	stb	%r25, [%r21 + 0x004e]
	.word 0xf625a1d1  ! 504: STW_I	stw	%r27, [%r22 + 0x01d1]
	.word 0xf22de0dd  ! 510: STB_I	stb	%r25, [%r23 + 0x00dd]
	.word 0xb3500000  ! 511: RDPR_TPC	<illegal instruction>
	.word 0xf024614a  ! 512: STW_I	stw	%r24, [%r17 + 0x014a]
	.word 0xf03c2057  ! 513: STD_I	std	%r24, [%r16 + 0x0057]
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735e001  ! 517: SRL_I	srl 	%r23, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43dc000  ! 523: STD_R	std	%r26, [%r23 + %r0]
	.word 0xf13d0000  ! 527: STDF_R	std	%f24, [%r0, %r20]
	.word 0xb92c1000  ! 528: SLLX_R	sllx	%r16, %r0, %r28
	setx	0xa25649f400003f47, %g1, %r10
	.word 0x839a8000  ! 532: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2352064  ! 533: STH_I	sth	%r25, [%r20 + 0x0064]
	.word 0xb0a44000  ! 536: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0x8d94e1a5  ! 539: WRPR_PSTATE_I	wrpr	%r19, 0x01a5, %pstate
	.word 0xfa248000  ! 541: STW_R	stw	%r29, [%r18 + %r0]
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a1fb  ! 543: WRPR_TNPC_I	wrpr	%r22, 0x01fb, %tnpc
	.word 0xf42dc000  ! 545: STB_R	stb	%r26, [%r23 + %r0]
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3d4000  ! 550: STD_R	std	%r29, [%r21 + %r0]
	.word 0xfe2dc000  ! 552: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xbb510000  ! 554: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfc358000  ! 556: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xbe956019  ! 561: ORcc_I	orcc 	%r21, 0x0019, %r31
	.word 0xb9508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xfa3c0000  ! 572: STD_R	std	%r29, [%r16 + %r0]
	.word 0x8395a0af  ! 574: WRPR_TNPC_I	wrpr	%r22, 0x00af, %tnpc
	.word 0xf024e02f  ! 576: STW_I	stw	%r24, [%r19 + 0x002f]
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c2001  ! 581: SRA_I	sra 	%r16, 0x0001, %r26
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 593: STB_R	stb	%r28, [%r19 + %r0]
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3d2186  ! 598: STDF_I	std	%f29, [0x0186, %r20]
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 602: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf43cc000  ! 603: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf62d4000  ! 604: STB_R	stb	%r27, [%r21 + %r0]
	.word 0x89946130  ! 608: WRPR_TICK_I	wrpr	%r17, 0x0130, %tick
	.word 0xb2b40000  ! 610: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xb605c000  ! 611: ADD_R	add 	%r23, %r0, %r27
	setx	data_start_0, %g1, %r18
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e17e  ! 614: WRPR_TPC_I	wrpr	%r23, 0x017e, %tpc
	mov	0, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5518000  ! 620: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	0x9476f9dd00007a09, %g1, %r10
	.word 0x839a8000  ! 621: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf234c000  ! 624: STH_R	sth	%r25, [%r19 + %r0]
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3d4000  ! 630: STD_R	std	%r31, [%r21 + %r0]
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82da17f  ! 635: STB_I	stb	%r28, [%r22 + 0x017f]
	.word 0x8995a115  ! 636: WRPR_TICK_I	wrpr	%r22, 0x0115, %tick
	mov	2, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0bc8000  ! 639: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xfe3ca06a  ! 641: STD_I	std	%r31, [%r18 + 0x006a]
	.word 0x8994216a  ! 642: WRPR_TICK_I	wrpr	%r16, 0x016a, %tick
	.word 0xfc358000  ! 644: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfe754000  ! 647: STX_R	stx	%r31, [%r21 + %r0]
	.word 0x8394e046  ! 649: WRPR_TNPC_I	wrpr	%r19, 0x0046, %tnpc
	.word 0xfe74a0ed  ! 650: STX_I	stx	%r31, [%r18 + 0x00ed]
	.word 0xfa34c000  ! 653: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xb02c0000  ! 655: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xbb520000  ! 657: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb3500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xf6742151  ! 660: STX_I	stx	%r27, [%r16 + 0x0151]
	.word 0xbc0d4000  ! 661: AND_R	and 	%r21, %r0, %r30
	.word 0xf82c4000  ! 665: STB_R	stb	%r28, [%r17 + %r0]
	setx	data_start_6, %g1, %r19
	setx	data_start_2, %g1, %r18
	.word 0xf03c20e8  ! 669: STD_I	std	%r24, [%r16 + 0x00e8]
	.word 0x8d94617b  ! 672: WRPR_PSTATE_I	wrpr	%r17, 0x017b, %pstate
	setx	data_start_4, %g1, %r19
	.word 0xbb510000  ! 679: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf23da072  ! 681: STD_I	std	%r25, [%r22 + 0x0072]
	.word 0xf8744000  ! 683: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf13c2131  ! 685: STDF_I	std	%f24, [0x0131, %r16]
	.word 0x8194208d  ! 688: WRPR_TPC_I	wrpr	%r16, 0x008d, %tpc
	.word 0x8394618d  ! 691: WRPR_TNPC_I	wrpr	%r17, 0x018d, %tnpc
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc358000  ! 706: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf23c8000  ! 709: STD_R	std	%r25, [%r18 + %r0]
	.word 0xbd508000  ! 710: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfa3460a1  ! 713: STH_I	sth	%r29, [%r17 + 0x00a1]
	.word 0xf425a0a6  ! 714: STW_I	stw	%r26, [%r22 + 0x00a6]
	.word 0xb92da001  ! 715: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0x81956066  ! 720: WRPR_TPC_I	wrpr	%r21, 0x0066, %tpc
	.word 0xf4348000  ! 721: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf0754000  ! 723: STX_R	stx	%r24, [%r21 + %r0]
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb215a026  ! 732: OR_I	or 	%r22, 0x0026, %r25
	.word 0xfa74a122  ! 733: STX_I	stx	%r29, [%r18 + 0x0122]
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3da0f1  ! 741: STD_I	std	%r29, [%r22 + 0x00f1]
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 743: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa258000  ! 753: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf93c4000  ! 754: STDF_R	std	%f28, [%r0, %r17]
	mov	2, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd480000  ! 761: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d0000  ! 777: STDF_R	std	%f31, [%r0, %r20]
	.word 0x8194a0bd  ! 778: WRPR_TPC_I	wrpr	%r18, 0x00bd, %tpc
	setx	data_start_3, %g1, %r16
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	.word 0xf8750000  ! 787: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x9194e12a  ! 792: WRPR_PIL_I	wrpr	%r19, 0x012a, %pil
	.word 0xf73ce041  ! 793: STDF_I	std	%f27, [0x0041, %r19]
	.word 0xb0940000  ! 794: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xf03da183  ! 795: STD_I	std	%r24, [%r22 + 0x0183]
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	.word 0xfd3de06d  ! 799: STDF_I	std	%f30, [0x006d, %r23]
	.word 0xf33d8000  ! 800: STDF_R	std	%f25, [%r0, %r22]
	.word 0xf73d4000  ! 802: STDF_R	std	%f27, [%r0, %r21]
	mov	2, %r12
	.word 0xa1930000  ! 805: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb2b5c000  ! 807: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xf425c000  ! 812: STW_R	stw	%r26, [%r23 + %r0]
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53c0000  ! 823: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf03c60e6  ! 826: STD_I	std	%r24, [%r17 + 0x00e6]
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3ca04e  ! 829: STDF_I	std	%f29, [0x004e, %r18]
	setx	0x20805d5100008bc8, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc74a1d4  ! 832: STX_I	stx	%r30, [%r18 + 0x01d4]
	.word 0xf8752003  ! 837: STX_I	stx	%r28, [%r20 + 0x0003]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf93d8000  ! 842: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf33d8000  ! 843: STDF_R	std	%f25, [%r0, %r22]
	setx	data_start_7, %g1, %r21
	.word 0x8395a13f  ! 849: WRPR_TNPC_I	wrpr	%r22, 0x013f, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 853: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfb3de16d  ! 854: STDF_I	std	%f29, [0x016d, %r23]
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8244000  ! 856: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xbd540000  ! 858: RDPR_GL	rdpr	%-, %r30
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 865: RDPR_TL	<illegal instruction>
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83942047  ! 869: WRPR_TNPC_I	wrpr	%r16, 0x0047, %tnpc
	.word 0xf8246167  ! 871: STW_I	stw	%r28, [%r17 + 0x0167]
	.word 0xfc748000  ! 874: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf82c217b  ! 877: STB_I	stb	%r28, [%r16 + 0x017b]
	.word 0xb951c000  ! 880: RDPR_TL	rdpr	%tl, %r28
	.word 0xf42c0000  ! 883: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xbaad4000  ! 886: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0x9194211a  ! 889: WRPR_PIL_I	wrpr	%r16, 0x011a, %pil
	.word 0xb2448000  ! 892: ADDC_R	addc 	%r18, %r0, %r25
	.word 0xfc3c4000  ! 893: STD_R	std	%r30, [%r17 + %r0]
	.word 0xb3510000  ! 897: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb151c000  ! 899: RDPR_TL	<illegal instruction>
	.word 0xfe2d6139  ! 901: STB_I	stb	%r31, [%r21 + 0x0139]
	.word 0xf82da0cc  ! 904: STB_I	stb	%r28, [%r22 + 0x00cc]
	.word 0xfb3c2011  ! 905: STDF_I	std	%f29, [0x0011, %r16]
	.word 0xfe24c000  ! 906: STW_R	stw	%r31, [%r19 + %r0]
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82461c0  ! 908: STW_I	stw	%r28, [%r17 + 0x01c0]
	.word 0x87956118  ! 909: WRPR_TT_I	wrpr	%r21, 0x0118, %tt
	.word 0xf62de1ea  ! 910: STB_I	stb	%r27, [%r23 + 0x01ea]
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3d4000  ! 913: STD_R	std	%r29, [%r21 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 914: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1480000  ! 917: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899520b8  ! 923: WRPR_TICK_I	wrpr	%r20, 0x00b8, %tick
	.word 0xf02d603d  ! 925: STB_I	stb	%r24, [%r21 + 0x003d]
	.word 0xbd508000  ! 926: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe356180  ! 931: STH_I	sth	%r31, [%r21 + 0x0180]
	.word 0xf0356077  ! 934: STH_I	sth	%r24, [%r21 + 0x0077]
	.word 0xf23da1ae  ! 935: STD_I	std	%r25, [%r22 + 0x01ae]
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35a002  ! 937: STH_I	sth	%r31, [%r22 + 0x0002]
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a0d6  ! 946: STW_I	stw	%r30, [%r18 + 0x00d6]
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c6056  ! 951: STB_I	stb	%r26, [%r17 + 0x0056]
	.word 0x91942183  ! 954: WRPR_PIL_I	wrpr	%r16, 0x0183, %pil
	.word 0xf82d4000  ! 955: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xb60d60b9  ! 957: AND_I	and 	%r21, 0x00b9, %r27
	.word 0xf834e1dd  ! 958: STH_I	sth	%r28, [%r19 + 0x01dd]
	.word 0xfc24201c  ! 960: STW_I	stw	%r30, [%r16 + 0x001c]
	.word 0xf8346093  ! 965: STH_I	sth	%r28, [%r17 + 0x0093]
	setx	data_start_1, %g1, %r23
	.word 0xff3dc000  ! 973: STDF_R	std	%f31, [%r0, %r23]
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13da0d9  ! 976: STDF_I	std	%f24, [0x00d9, %r22]
	.word 0xf42c8000  ! 978: STB_R	stb	%r26, [%r18 + %r0]
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	setx	0xa6726f260000c981, %g1, %r10
	.word 0x839a8000  ! 983: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195e095  ! 985: WRPR_TPC_I	wrpr	%r23, 0x0095, %tpc
	.word 0x8194e1cf  ! 990: WRPR_TPC_I	wrpr	%r19, 0x01cf, %tpc
	.word 0xf53ca0bf  ! 991: STDF_I	std	%f26, [0x00bf, %r18]
	.word 0xb1540000  ! 992: RDPR_GL	rdpr	%-, %r24
	.word 0xf93de1af  ! 993: STDF_I	std	%f28, [0x01af, %r23]
	.word 0xbb504000  ! 995: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r19
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
	.word 0xf44cc000  ! 1: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xfb1c4000  ! 2: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf205e0bb  ! 3: LDUW_I	lduw	[%r23 + 0x00bb], %r25
	.word 0xf20d4000  ! 10: LDUB_R	ldub	[%r21 + %r0], %r25
	setx	data_start_3, %g1, %r16
	.word 0xb9504000  ! 12: RDPR_TNPC	<illegal instruction>
	.word 0xf81c4000  ! 13: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0x8994e0e7  ! 14: WRPR_TICK_I	wrpr	%r19, 0x00e7, %tick
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 24: RDPR_TL	<illegal instruction>
	.word 0x8394e040  ! 25: WRPR_TNPC_I	wrpr	%r19, 0x0040, %tnpc
	.word 0xf20c2056  ! 30: LDUB_I	ldub	[%r16 + 0x0056], %r25
	.word 0xf415a1f2  ! 31: LDUH_I	lduh	[%r22 + 0x01f2], %r26
	.word 0xb7518000  ! 33: RDPR_PSTATE	<illegal instruction>
	.word 0xf04d6126  ! 38: LDSB_I	ldsb	[%r21 + 0x0126], %r24
	setx	0xca7dd72a00008e42, %g1, %r10
	.word 0x819a8000  ! 39: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf3c4000  ! 43: SRA_R	sra 	%r17, %r0, %r31
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4558000  ! 51: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xf45d606f  ! 53: LDX_I	ldx	[%r21 + 0x006f], %r26
	.word 0xb3540000  ! 60: RDPR_GL	<illegal instruction>
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035c000  ! 66: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xf85d4000  ! 67: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf21ce132  ! 69: LDD_I	ldd	[%r19 + 0x0132], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2458000  ! 72: LDSW_R	ldsw	[%r22 + %r0], %r25
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4aca01d  ! 75: ANDNcc_I	andncc 	%r18, 0x001d, %r26
	.word 0xfe55e1ea  ! 76: LDSH_I	ldsh	[%r23 + 0x01ea], %r31
	.word 0x8d95a1a2  ! 78: WRPR_PSTATE_I	wrpr	%r22, 0x01a2, %pstate
	.word 0xfa45e115  ! 79: LDSW_I	ldsw	[%r23 + 0x0115], %r29
	.word 0xf8146054  ! 80: LDUH_I	lduh	[%r17 + 0x0054], %r28
	.word 0xfe4c0000  ! 85: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xb12c4000  ! 92: SLL_R	sll 	%r17, %r0, %r24
	.word 0xf615c000  ! 97: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf204c000  ! 98: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf20ca0d6  ! 99: LDUB_I	ldub	[%r18 + 0x00d6], %r25
	.word 0xb0040000  ! 103: ADD_R	add 	%r16, %r0, %r24
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe45a02f  ! 109: LDSW_I	ldsw	[%r22 + 0x002f], %r31
	.word 0xfa5d212f  ! 111: LDX_I	ldx	[%r20 + 0x012f], %r29
	.word 0x8595600c  ! 113: WRPR_TSTATE_I	wrpr	%r21, 0x000c, %tstate
	.word 0xbd508000  ! 114: RDPR_TSTATE	<illegal instruction>
	.word 0xf055e044  ! 115: LDSH_I	ldsh	[%r23 + 0x0044], %r24
	setx	0x26bd4d3b00009f53, %g1, %r10
	.word 0x839a8000  ! 116: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc144000  ! 124: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf00de058  ! 125: LDUB_I	ldub	[%r23 + 0x0058], %r24
	.word 0xf41da109  ! 127: LDD_I	ldd	[%r22 + 0x0109], %r26
	.word 0xfe440000  ! 129: LDSW_R	ldsw	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4c4000  ! 133: LDSB_R	ldsb	[%r17 + %r0], %r29
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61c4000  ! 136: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0x9195a161  ! 140: WRPR_PIL_I	wrpr	%r22, 0x0161, %pil
	.word 0xf84d8000  ! 141: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf04d0000  ! 143: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0x8194210c  ! 144: WRPR_TPC_I	wrpr	%r16, 0x010c, %tpc
	setx	data_start_5, %g1, %r22
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c2119  ! 148: LDUB_I	ldub	[%r16 + 0x0119], %r31
	.word 0xfc55c000  ! 149: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf645c000  ! 151: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb3540000  ! 153: RDPR_GL	<illegal instruction>
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85da16a  ! 159: LDX_I	ldx	[%r22 + 0x016a], %r28
	.word 0xb1540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xf644a11a  ! 162: LDSW_I	ldsw	[%r18 + 0x011a], %r27
	.word 0xf60da11d  ! 163: LDUB_I	ldub	[%r22 + 0x011d], %r27
	.word 0xfe45a1b6  ! 166: LDSW_I	ldsw	[%r22 + 0x01b6], %r31
	setx	0xf2172cb30000ff87, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa5c619a  ! 169: LDX_I	ldx	[%r17 + 0x019a], %r29
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe548000  ! 173: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xfb1c20f2  ! 174: LDDF_I	ldd	[%r16, 0x00f2], %f29
	.word 0x8594215e  ! 179: WRPR_TSTATE_I	wrpr	%r16, 0x015e, %tstate
	.word 0xbf51c000  ! 182: RDPR_TL	<illegal instruction>
	.word 0xb2bdc000  ! 183: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xb1540000  ! 185: RDPR_GL	<illegal instruction>
	.word 0xfc4d4000  ! 187: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf45c6055  ! 188: LDX_I	ldx	[%r17 + 0x0055], %r26
	.word 0x839561c3  ! 191: WRPR_TNPC_I	wrpr	%r21, 0x01c3, %tnpc
	.word 0xf81c8000  ! 192: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf8150000  ! 194: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfe4c6100  ! 199: LDSB_I	ldsb	[%r17 + 0x0100], %r31
	.word 0xf2450000  ! 202: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfa04e1a6  ! 203: LDUW_I	lduw	[%r19 + 0x01a6], %r29
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65cc000  ! 210: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xb150c000  ! 212: RDPR_TT	rdpr	%tt, %r24
	.word 0x9194204c  ! 213: WRPR_PIL_I	wrpr	%r16, 0x004c, %pil
	.word 0xb92de001  ! 215: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0xb8ac0000  ! 216: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xf854c000  ! 217: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf25d8000  ! 219: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf81dc000  ! 222: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xb3540000  ! 224: RDPR_GL	<illegal instruction>
	.word 0xfe5d8000  ! 229: LDX_R	ldx	[%r22 + %r0], %r31
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1c605f  ! 231: LDDF_I	ldd	[%r17, 0x005f], %f29
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c4000  ! 237: LDX_R	ldx	[%r17 + %r0], %r24
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654c000  ! 241: LDSH_R	ldsh	[%r19 + %r0], %r27
	setx	data_start_4, %g1, %r18
	.word 0xbb643801  ! 244: MOVcc_I	<illegal instruction>
	.word 0xb3508000  ! 247: RDPR_TSTATE	<illegal instruction>
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 255: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbd2d9000  ! 256: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xf0150000  ! 259: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xba3c4000  ! 260: XNOR_R	xnor 	%r17, %r0, %r29
	.word 0xf05d2026  ! 265: LDX_I	ldx	[%r20 + 0x0026], %r24
	.word 0xf21521d3  ! 267: LDUH_I	lduh	[%r20 + 0x01d3], %r25
	.word 0xf40ce153  ! 268: LDUB_I	ldub	[%r19 + 0x0153], %r26
	.word 0x859521a1  ! 270: WRPR_TSTATE_I	wrpr	%r20, 0x01a1, %tstate
	.word 0xfd1ca0fe  ! 273: LDDF_I	ldd	[%r18, 0x00fe], %f30
	setx	data_start_3, %g1, %r18
	.word 0xfa45a159  ! 277: LDSW_I	ldsw	[%r22 + 0x0159], %r29
	mov	1, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1504000  ! 283: RDPR_TNPC	<illegal instruction>
	.word 0xf91c2079  ! 287: LDDF_I	ldd	[%r16, 0x0079], %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa45e121  ! 291: LDSW_I	ldsw	[%r23 + 0x0121], %r29
	mov	0, %r12
	.word 0x8f930000  ! 294: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85942137  ! 295: WRPR_TSTATE_I	wrpr	%r16, 0x0137, %tstate
	.word 0xfe148000  ! 296: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf2150000  ! 297: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfa4c4000  ! 298: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf65dc000  ! 300: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0x8594a0dc  ! 301: WRPR_TSTATE_I	wrpr	%r18, 0x00dc, %tstate
	.word 0xf84c4000  ! 306: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf404c000  ! 307: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xbf480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc14214e  ! 309: LDUH_I	lduh	[%r16 + 0x014e], %r30
	.word 0xfe1c4000  ! 311: LDD_R	ldd	[%r17 + %r0], %r31
	setx	data_start_2, %g1, %r16
	.word 0xb5504000  ! 313: RDPR_TNPC	<illegal instruction>
	.word 0xb9518000  ! 316: RDPR_PSTATE	<illegal instruction>
	.word 0xfe0c60a3  ! 318: LDUB_I	ldub	[%r17 + 0x00a3], %r31
	setx	0x2158997d0000cad8, %g1, %r10
	.word 0x819a8000  ! 319: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb8a4a170  ! 320: SUBcc_I	subcc 	%r18, 0x0170, %r28
	.word 0xf24d6168  ! 322: LDSB_I	ldsb	[%r21 + 0x0168], %r25
	.word 0xf64d0000  ! 325: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xf41c6029  ! 326: LDD_I	ldd	[%r17 + 0x0029], %r26
	.word 0x9195a0d9  ! 333: WRPR_PIL_I	wrpr	%r22, 0x00d9, %pil
	.word 0xbd51c000  ! 342: RDPR_TL	rdpr	%tl, %r30
	.word 0xb01d4000  ! 344: XOR_R	xor 	%r21, %r0, %r24
	.word 0xf24d0000  ! 355: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xbeb4e1b3  ! 356: SUBCcc_I	orncc 	%r19, 0x01b3, %r31
	.word 0xf81d21a6  ! 358: LDD_I	ldd	[%r20 + 0x01a6], %r28
	.word 0x819421eb  ! 361: WRPR_TPC_I	wrpr	%r16, 0x01eb, %tpc
	.word 0xf24d4000  ! 365: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf44c0000  ! 367: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xb9518000  ! 369: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0x8d9460d8  ! 372: WRPR_PSTATE_I	wrpr	%r17, 0x00d8, %pstate
	.word 0xb8150000  ! 373: OR_R	or 	%r20, %r0, %r28
	.word 0xbb500000  ! 375: RDPR_TPC	<illegal instruction>
	.word 0xbd343001  ! 377: SRLX_I	srlx	%r16, 0x0001, %r30
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 382: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 386: RDPR_TPC	<illegal instruction>
	.word 0xf8540000  ! 387: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xb92c5000  ! 391: SLLX_R	sllx	%r17, %r0, %r28
	.word 0xf4050000  ! 392: LDUW_R	lduw	[%r20 + %r0], %r26
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d0000  ! 400: SLL_R	sll 	%r20, %r0, %r26
	.word 0xfb1d8000  ! 401: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xfa54c000  ! 407: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xf4044000  ! 410: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0x8195a0d9  ! 415: WRPR_TPC_I	wrpr	%r22, 0x00d9, %tpc
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24dc000  ! 420: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xfa0c8000  ! 425: LDUB_R	ldub	[%r18 + %r0], %r29
	setx	0xd27e104800005b0d, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4544000  ! 429: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb01da052  ! 432: XOR_I	xor 	%r22, 0x0052, %r24
	.word 0xb9510000  ! 437: RDPR_TICK	<illegal instruction>
	.word 0xf055e18b  ! 438: LDSH_I	ldsh	[%r23 + 0x018b], %r24
	.word 0x8995e00f  ! 445: WRPR_TICK_I	wrpr	%r23, 0x000f, %tick
	.word 0xf2044000  ! 448: LDUW_R	lduw	[%r17 + %r0], %r25
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc542121  ! 462: LDSH_I	ldsh	[%r16 + 0x0121], %r30
	.word 0xf4440000  ! 463: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xb1480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf854c000  ! 466: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf05d0000  ! 467: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf6440000  ! 468: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xf6458000  ! 473: LDSW_R	ldsw	[%r22 + %r0], %r27
	mov	2, %r12
	.word 0xa1930000  ! 477: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf20de135  ! 480: LDUB_I	ldub	[%r23 + 0x0135], %r25
	.word 0x899460da  ! 485: WRPR_TICK_I	wrpr	%r17, 0x00da, %tick
	.word 0xb3508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0xfe55a0d0  ! 491: LDSH_I	ldsh	[%r22 + 0x00d0], %r31
	setx	data_start_4, %g1, %r18
	.word 0xb1540000  ! 495: RDPR_GL	<illegal instruction>
	.word 0xf445a061  ! 496: LDSW_I	ldsw	[%r22 + 0x0061], %r26
	.word 0xf51c61e1  ! 501: LDDF_I	ldd	[%r17, 0x01e1], %f26
	.word 0xf20521fa  ! 509: LDUW_I	lduw	[%r20 + 0x01fa], %r25
	.word 0xb9500000  ! 511: RDPR_TPC	<illegal instruction>
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1d0000  ! 515: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xf0040000  ! 516: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xbd34e001  ! 517: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xf81d8000  ! 518: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf04c8000  ! 520: LDSB_R	ldsb	[%r18 + %r0], %r24
	mov	2, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1ca191  ! 525: LDDF_I	ldd	[%r18, 0x0191], %f30
	.word 0xbd2d1000  ! 528: SLLX_R	sllx	%r20, %r0, %r30
	.word 0xf65d8000  ! 529: LDX_R	ldx	[%r22 + %r0], %r27
	setx	0x9fc695860000ae46, %g1, %r10
	.word 0x839a8000  ! 532: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf24d2026  ! 535: LDSB_I	ldsb	[%r20 + 0x0026], %r25
	.word 0xb0a50000  ! 536: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0x8d95e0d1  ! 539: WRPR_PSTATE_I	wrpr	%r23, 0x00d1, %pstate
	.word 0xf615e0f5  ! 540: LDUH_I	lduh	[%r23 + 0x00f5], %r27
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83956092  ! 543: WRPR_TNPC_I	wrpr	%r21, 0x0092, %tnpc
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 554: RDPR_TICK	<illegal instruction>
	.word 0xbe95e1ce  ! 561: ORcc_I	orcc 	%r23, 0x01ce, %r31
	.word 0xf00da044  ! 564: LDUB_I	ldub	[%r22 + 0x0044], %r24
	.word 0xb5508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xf91dc000  ! 569: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf00d8000  ! 570: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0x8394a198  ! 574: WRPR_TNPC_I	wrpr	%r18, 0x0198, %tnpc
	.word 0xfa1c8000  ! 575: LDD_R	ldd	[%r18 + %r0], %r29
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21de1f5  ! 580: LDD_I	ldd	[%r23 + 0x01f5], %r25
	.word 0xb93ca001  ! 581: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xf11cc000  ! 582: LDDF_R	ldd	[%r19, %r0], %f24
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6050000  ! 590: LDUW_R	lduw	[%r20 + %r0], %r27
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c8000  ! 595: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xf20c21ea  ! 600: LDUB_I	ldub	[%r16 + 0x01ea], %r25
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 602: RDPR_PSTATE	<illegal instruction>
	.word 0xfd1d4000  ! 606: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf81ca1c7  ! 607: LDD_I	ldd	[%r18 + 0x01c7], %r28
	.word 0x8995e0d1  ! 608: WRPR_TICK_I	wrpr	%r23, 0x00d1, %tick
	.word 0xb2b40000  ! 610: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xb405c000  ! 611: ADD_R	add 	%r23, %r0, %r26
	setx	data_start_4, %g1, %r17
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194e12a  ! 614: WRPR_TPC_I	wrpr	%r19, 0x012a, %tpc
	.word 0xf91da18a  ! 616: LDDF_I	ldd	[%r22, 0x018a], %f28
	mov	1, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2440000  ! 618: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xb7518000  ! 620: RDPR_PSTATE	<illegal instruction>
	setx	0x93adac6000001883, %g1, %r10
	.word 0x839a8000  ! 621: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf61d8000  ! 622: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xf8150000  ! 623: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfa4c4000  ! 625: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf2454000  ! 626: LDSW_R	ldsw	[%r21 + %r0], %r25
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c8000  ! 633: LDUB_R	ldub	[%r18 + %r0], %r30
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995e016  ! 636: WRPR_TICK_I	wrpr	%r23, 0x0016, %tick
	.word 0xf644a00f  ! 637: LDSW_I	ldsw	[%r18 + 0x000f], %r27
	mov	2, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbabdc000  ! 639: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0x8994e030  ! 642: WRPR_TICK_I	wrpr	%r19, 0x0030, %tick
	.word 0xfe5dc000  ! 643: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf4556023  ! 645: LDSH_I	ldsh	[%r21 + 0x0023], %r26
	.word 0xfc4c8000  ! 648: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0x8395e094  ! 649: WRPR_TNPC_I	wrpr	%r23, 0x0094, %tnpc
	.word 0xfe1c6137  ! 654: LDD_I	ldd	[%r17 + 0x0137], %r31
	.word 0xba2d0000  ! 655: ANDN_R	andn 	%r20, %r0, %r29
	.word 0xf0044000  ! 656: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xbf520000  ! 657: RDPR_PIL	<illegal instruction>
	.word 0xb3500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb20dc000  ! 661: AND_R	and 	%r23, %r0, %r25
	.word 0xfa55c000  ! 663: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf8550000  ! 664: LDSH_R	ldsh	[%r20 + %r0], %r28
	setx	data_start_1, %g1, %r23
	.word 0xfa4cc000  ! 667: LDSB_R	ldsb	[%r19 + %r0], %r29
	setx	data_start_3, %g1, %r17
	.word 0x8d94e10b  ! 672: WRPR_PSTATE_I	wrpr	%r19, 0x010b, %pstate
	setx	data_start_4, %g1, %r18
	.word 0xf644c000  ! 675: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xb3510000  ! 679: RDPR_TICK	<illegal instruction>
	.word 0xf01cc000  ! 682: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf51d608b  ! 687: LDDF_I	ldd	[%r21, 0x008b], %f26
	.word 0x8194e040  ! 688: WRPR_TPC_I	wrpr	%r19, 0x0040, %tpc
	.word 0xf254202c  ! 689: LDSH_I	ldsh	[%r16 + 0x002c], %r25
	.word 0xfa146095  ! 690: LDUH_I	lduh	[%r17 + 0x0095], %r29
	.word 0x8395e159  ! 691: WRPR_TNPC_I	wrpr	%r23, 0x0159, %tnpc
	.word 0xf00d617a  ! 692: LDUB_I	ldub	[%r21 + 0x017a], %r24
	.word 0xf51de031  ! 693: LDDF_I	ldd	[%r23, 0x0031], %f26
	.word 0xfd1c0000  ! 694: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xf85d614a  ! 695: LDX_I	ldx	[%r21 + 0x014a], %r28
	.word 0xfc558000  ! 700: LDSH_R	ldsh	[%r22 + %r0], %r30
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 710: RDPR_TSTATE	<illegal instruction>
	.word 0xb52de001  ! 715: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xf60420bc  ! 718: LDUW_I	lduw	[%r16 + 0x00bc], %r27
	.word 0x8195e0c1  ! 720: WRPR_TPC_I	wrpr	%r23, 0x00c1, %tpc
	.word 0xf6040000  ! 722: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf84c2112  ! 724: LDSB_I	ldsb	[%r16 + 0x0112], %r28
	.word 0xfc152113  ! 725: LDUH_I	lduh	[%r20 + 0x0113], %r30
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 727: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xb615e013  ! 732: OR_I	or 	%r23, 0x0013, %r27
	.word 0xf41c8000  ! 734: LDD_R	ldd	[%r18 + %r0], %r26
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 743: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf41d8000  ! 746: LDD_R	ldd	[%r22 + %r0], %r26
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d60a9  ! 750: LDSB_I	ldsb	[%r21 + 0x00a9], %r28
	.word 0xf81ce102  ! 756: LDD_I	ldd	[%r19 + 0x0102], %r28
	.word 0xfe04c000  ! 757: LDUW_R	lduw	[%r19 + %r0], %r31
	mov	0, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3480000  ! 761: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41d6079  ! 770: LDD_I	ldd	[%r21 + 0x0079], %r26
	.word 0xf644e1da  ! 772: LDSW_I	ldsw	[%r19 + 0x01da], %r27
	.word 0xf815a1bf  ! 774: LDUH_I	lduh	[%r22 + 0x01bf], %r28
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e096  ! 778: WRPR_TPC_I	wrpr	%r23, 0x0096, %tpc
	setx	data_start_5, %g1, %r18
	.word 0xfa050000  ! 780: LDUW_R	lduw	[%r20 + %r0], %r29
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d2199  ! 783: LDSB_I	ldsb	[%r20 + 0x0199], %r24
	setx	data_start_5, %g1, %r19
	.word 0xf80d4000  ! 788: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0x9195e059  ! 792: WRPR_PIL_I	wrpr	%r23, 0x0059, %pil
	.word 0xbe94c000  ! 794: ORcc_R	orcc 	%r19, %r0, %r31
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	.word 0xf20ce0fa  ! 798: LDUB_I	ldub	[%r19 + 0x00fa], %r25
	.word 0xf00ce15c  ! 803: LDUB_I	ldub	[%r19 + 0x015c], %r24
	.word 0xf85520a7  ! 804: LDSH_I	ldsh	[%r20 + 0x00a7], %r28
	mov	2, %r12
	.word 0xa1930000  ! 805: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbcb50000  ! 807: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xfa4d4000  ! 809: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf20420d9  ! 810: LDUW_I	lduw	[%r16 + 0x00d9], %r25
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ca1b3  ! 816: LDUB_I	ldub	[%r18 + 0x01b3], %r27
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	setx	0x80c3f8ae00003b5f, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf215e1a7  ! 833: LDUH_I	lduh	[%r23 + 0x01a7], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf21520cd  ! 844: LDUH_I	lduh	[%r20 + 0x00cd], %r25
	.word 0xfe1ce054  ! 845: LDD_I	ldd	[%r19 + 0x0054], %r31
	setx	data_start_1, %g1, %r20
	.word 0xfe1de1b3  ! 848: LDD_I	ldd	[%r23 + 0x01b3], %r31
	.word 0x83942136  ! 849: WRPR_TNPC_I	wrpr	%r16, 0x0136, %tnpc
	.word 0xf655a18d  ! 850: LDSH_I	ldsh	[%r22 + 0x018d], %r27
	mov	1, %r12
	.word 0x8f930000  ! 853: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 858: RDPR_GL	<illegal instruction>
	.word 0xfa14a0a9  ! 861: LDUH_I	lduh	[%r18 + 0x00a9], %r29
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 865: RDPR_TL	<illegal instruction>
	.word 0xfc458000  ! 866: LDSW_R	ldsw	[%r22 + %r0], %r30
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a04e  ! 869: WRPR_TNPC_I	wrpr	%r22, 0x004e, %tnpc
	.word 0xf844c000  ! 872: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xfe0d6100  ! 876: LDUB_I	ldub	[%r21 + 0x0100], %r31
	.word 0xb151c000  ! 880: RDPR_TL	<illegal instruction>
	.word 0xfc4cc000  ! 884: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfc14c000  ! 885: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xbaad8000  ! 886: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0xf24d0000  ! 887: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0x91946191  ! 889: WRPR_PIL_I	wrpr	%r17, 0x0191, %pil
	.word 0xfc058000  ! 890: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfc54e11a  ! 891: LDSH_I	ldsh	[%r19 + 0x011a], %r30
	.word 0xb8444000  ! 892: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xfb1c8000  ! 896: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xb1510000  ! 897: RDPR_TICK	<illegal instruction>
	.word 0xb351c000  ! 899: RDPR_TL	<illegal instruction>
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e046  ! 909: WRPR_TT_I	wrpr	%r19, 0x0046, %tt
	.word 0xf31ce116  ! 911: LDDF_I	ldd	[%r19, 0x0116], %f25
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 914: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf51c4000  ! 915: LDDF_R	ldd	[%r17, %r0], %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd480000  ! 917: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc1d0000  ! 918: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xfa458000  ! 921: LDSW_R	ldsw	[%r22 + %r0], %r29
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994210f  ! 923: WRPR_TICK_I	wrpr	%r16, 0x010f, %tick
	.word 0xb1508000  ! 926: RDPR_TSTATE	<illegal instruction>
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0de10b  ! 930: LDUB_I	ldub	[%r23 + 0x010b], %r31
	.word 0xfc05a08b  ! 932: LDUW_I	lduw	[%r22 + 0x008b], %r30
	.word 0xf844c000  ! 933: LDSW_R	ldsw	[%r19 + %r0], %r28
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1ce086  ! 939: LDD_I	ldd	[%r19 + 0x0086], %r31
	.word 0xfc4d0000  ! 941: LDSB_R	ldsb	[%r20 + %r0], %r30
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1d208d  ! 943: LDD_I	ldd	[%r20 + 0x008d], %r29
	.word 0xf015a06b  ! 945: LDUH_I	lduh	[%r22 + 0x006b], %r24
	.word 0xfc5c8000  ! 949: LDX_R	ldx	[%r18 + %r0], %r30
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a029  ! 954: WRPR_PIL_I	wrpr	%r22, 0x0029, %pil
	.word 0xf65c8000  ! 956: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xb60da1e0  ! 957: AND_I	and 	%r22, 0x01e0, %r27
	.word 0xf64d4000  ! 964: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfe5c4000  ! 966: LDX_R	ldx	[%r17 + %r0], %r31
	setx	data_start_4, %g1, %r21
	.word 0xf8058000  ! 972: LDUW_R	lduw	[%r22 + %r0], %r28
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca0b4  ! 981: LDX_I	ldx	[%r18 + 0x00b4], %r27
	setx	0x351628ed0000ec5b, %g1, %r10
	.word 0x839a8000  ! 983: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf84dc000  ! 984: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0x8195a1a8  ! 985: WRPR_TPC_I	wrpr	%r22, 0x01a8, %tpc
	.word 0x8194a04a  ! 990: WRPR_TPC_I	wrpr	%r18, 0x004a, %tpc
	.word 0xbd540000  ! 992: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 995: RDPR_TNPC	<illegal instruction>
	.word 0xf25c4000  ! 996: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xfa0ce046  ! 997: LDUB_I	ldub	[%r19 + 0x0046], %r29
	.word 0xfe5da004  ! 998: LDX_I	ldx	[%r22 + 0x0004], %r31
	setx	data_start_0, %g1, %r21
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5a80820  ! 5: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c9c0  ! 7: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xbda00520  ! 8: FSQRTs	fsqrt	
	setx	data_start_3, %g1, %r19
	.word 0xbd504000  ! 12: RDPR_TNPC	<illegal instruction>
	.word 0x8995e1a4  ! 14: WRPR_TICK_I	wrpr	%r23, 0x01a4, %tick
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 24: RDPR_TL	<illegal instruction>
	.word 0x83942039  ! 25: WRPR_TNPC_I	wrpr	%r16, 0x0039, %tnpc
	.word 0xb7a44860  ! 26: FADDq	dis not found

	.word 0xb7a80820  ! 29: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbbaa0820  ! 32: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7518000  ! 33: RDPR_PSTATE	<illegal instruction>
	.word 0xb1aa4820  ! 34: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00540  ! 35: FSQRTd	fsqrt	
	setx	0x2e47b24e0000af9d, %g1, %r10
	.word 0x819a8000  ! 39: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a00040  ! 40: FMOVd	fmovd	%f0, %f58
	.word 0xb33d8000  ! 43: SRA_R	sra 	%r22, %r0, %r25
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 54: FMOVRNZ	dis not found

	.word 0xb1ab4820  ! 55: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbd540000  ! 60: RDPR_GL	<illegal instruction>
	.word 0xb3a94820  ! 61: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a88820  ! 62: FMOVLE	fmovs	%fcc1, %f0, %f28
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448a0  ! 65: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xba358000  ! 66: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xbda8c820  ! 70: FMOVL	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ac6042  ! 75: ANDNcc_I	andncc 	%r17, 0x0042, %r28
	.word 0x8d94603d  ! 78: WRPR_PSTATE_I	wrpr	%r17, 0x003d, %pstate
	.word 0xb5a48960  ! 89: FMULq	dis not found

	.word 0xb72dc000  ! 92: SLL_R	sll 	%r23, %r0, %r27
	.word 0xbba84820  ! 100: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00040  ! 101: FMOVd	fmovd	%f0, %f58
	.word 0xb1a588a0  ! 102: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb6040000  ! 103: ADD_R	add 	%r16, %r0, %r27
	.word 0xb9a00540  ! 106: FSQRTd	fsqrt	
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 110: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0x8595a19c  ! 113: WRPR_TSTATE_I	wrpr	%r22, 0x019c, %tstate
	.word 0xb9508000  ! 114: RDPR_TSTATE	<illegal instruction>
	setx	0x5b0c7dde00009c05, %g1, %r10
	.word 0x839a8000  ! 116: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a00560  ! 117: FSQRTq	fsqrt	
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 119: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbbaac820  ! 120: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81420  ! 121: FMOVRNZ	dis not found

	.word 0xb9a94820  ! 126: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80c20  ! 128: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a84820  ! 131: FMOVE	fmovs	%fcc1, %f0, %f28
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 138: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0x9194a0c7  ! 140: WRPR_PIL_I	wrpr	%r18, 0x00c7, %pil
	.word 0xb3a00020  ! 142: FMOVs	fmovs	%f0, %f25
	.word 0x81946059  ! 144: WRPR_TPC_I	wrpr	%r17, 0x0059, %tpc
	setx	data_start_0, %g1, %r17
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 153: RDPR_GL	<illegal instruction>
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c820  ! 157: FADDs	fadds	%f23, %f0, %f27
	.word 0xb3540000  ! 161: RDPR_GL	<illegal instruction>
	setx	0x5667dd5800006f4c, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a80820  ! 168: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7a84820  ! 170: FMOVE	fmovs	%fcc1, %f0, %f27
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 175: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x85942179  ! 179: WRPR_TSTATE_I	wrpr	%r16, 0x0179, %tstate
	.word 0xb751c000  ! 182: RDPR_TL	<illegal instruction>
	.word 0xbabd4000  ! 183: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xb9540000  ! 185: RDPR_GL	<illegal instruction>
	.word 0xbba80c20  ! 186: FMOVRLZ	dis not found

	.word 0x839460cf  ! 191: WRPR_TNPC_I	wrpr	%r17, 0x00cf, %tnpc
	.word 0xb5a81c20  ! 193: FMOVRGEZ	dis not found

	.word 0xb1a4c8e0  ! 195: FSUBq	dis not found

	.word 0xb1a9c820  ! 200: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a80820  ! 201: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00020  ! 204: FMOVs	fmovs	%f0, %f25
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40840  ! 206: FADDd	faddd	%f16, %f0, %f58
	.word 0xbbabc820  ! 207: FMOVVC	fmovs	%fcc1, %f0, %f29
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409e0  ! 211: FDIVq	dis not found

	.word 0xbd50c000  ! 212: RDPR_TT	<illegal instruction>
	.word 0x9195e15c  ! 213: WRPR_PIL_I	wrpr	%r23, 0x015c, %pil
	.word 0xb72c6001  ! 215: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xb4ad0000  ! 216: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xbf540000  ! 224: RDPR_GL	<illegal instruction>
	.word 0xbfa00020  ! 226: FMOVs	fmovs	%f0, %f31
	.word 0xb3a00040  ! 228: FMOVd	fmovd	%f0, %f56
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 236: FMOVRZ	dis not found

	.word 0xb1a81420  ! 238: FMOVRNZ	dis not found

	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 242: FMOVRLZ	dis not found

	setx	data_start_6, %g1, %r21
	.word 0xb5643801  ! 244: MOVcc_I	<illegal instruction>
	.word 0xb5a548c0  ! 245: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xbba80c20  ! 246: FMOVRLZ	dis not found

	.word 0xbf508000  ! 247: RDPR_TSTATE	<illegal instruction>
	.word 0xbda4c820  ! 249: FADDs	fadds	%f19, %f0, %f30
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c960  ! 251: FMULq	dis not found

	.word 0xb7ab0820  ! 252: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbf480000  ! 255: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb52d1000  ! 256: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xb63d0000  ! 260: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0xbba80820  ! 261: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a9c820  ! 263: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8595a01f  ! 270: WRPR_TSTATE_I	wrpr	%r22, 0x001f, %tstate
	setx	data_start_3, %g1, %r22
	.word 0xbba00560  ! 276: FSQRTq	fsqrt	
	.word 0xb3a98820  ! 279: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a40920  ! 280: FMULs	fmuls	%f16, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb504000  ! 283: RDPR_TNPC	<illegal instruction>
	.word 0xbfa58860  ! 284: FADDq	dis not found

	.word 0xbdaa0820  ! 286: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfab0820  ! 288: FMOVGU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81420  ! 290: FMOVRNZ	dis not found

	.word 0xb5a50840  ! 292: FADDd	faddd	%f20, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 294: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85956100  ! 295: WRPR_TSTATE_I	wrpr	%r21, 0x0100, %tstate
	.word 0xbba8c820  ! 299: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0x8595e0fd  ! 301: WRPR_TSTATE_I	wrpr	%r23, 0x00fd, %tstate
	.word 0xb5a48960  ! 305: FMULq	dis not found

	.word 0xb1480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_3, %g1, %r16
	.word 0xb3504000  ! 313: RDPR_TNPC	<illegal instruction>
	.word 0xb5a5c9a0  ! 314: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb3518000  ! 316: RDPR_PSTATE	<illegal instruction>
	setx	0x28ec744c0000a8d3, %g1, %r10
	.word 0x819a8000  ! 319: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb4a5a0bf  ! 320: SUBcc_I	subcc 	%r22, 0x00bf, %r26
	.word 0xb1a40840  ! 321: FADDd	faddd	%f16, %f0, %f24
	.word 0xbda5c960  ! 328: FMULq	dis not found

	.word 0x9195a0ef  ! 333: WRPR_PIL_I	wrpr	%r22, 0x00ef, %pil
	.word 0xb5a88820  ! 334: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00040  ! 335: FMOVd	fmovd	%f0, %f28
	.word 0xbfa80820  ! 340: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbf51c000  ! 342: RDPR_TL	<illegal instruction>
	.word 0xbc1dc000  ! 344: XOR_R	xor 	%r23, %r0, %r30
	.word 0xbfa4c920  ! 347: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbba5c8c0  ! 350: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb9aac820  ! 352: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbeb4a1c2  ! 356: SUBCcc_I	orncc 	%r18, 0x01c2, %r31
	.word 0x8195a013  ! 361: WRPR_TPC_I	wrpr	%r22, 0x0013, %tpc
	.word 0xbfa88820  ! 364: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7518000  ! 369: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a44920  ! 370: FMULs	fmuls	%f17, %f0, %f26
	.word 0x8d94e0b1  ! 372: WRPR_PSTATE_I	wrpr	%r19, 0x00b1, %pstate
	.word 0xb2144000  ! 373: OR_R	or 	%r17, %r0, %r25
	.word 0xbba88820  ! 374: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb7500000  ! 375: RDPR_TPC	<illegal instruction>
	.word 0xb7343001  ! 377: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb1a488e0  ! 379: FSUBq	dis not found

	.word 0xb9a00540  ! 380: FSQRTd	fsqrt	
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 382: RDPR_GL	<illegal instruction>
	.word 0xb7500000  ! 386: RDPR_TPC	<illegal instruction>
	.word 0xbf2dd000  ! 391: SLLX_R	sllx	%r23, %r0, %r31
	.word 0xbfab4820  ! 393: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa409a0  ! 397: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb92d4000  ! 400: SLL_R	sll 	%r21, %r0, %r28
	.word 0xbfab0820  ! 402: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbda5c920  ! 405: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb7a00040  ! 406: FMOVd	fmovd	%f0, %f58
	.word 0xb5a589e0  ! 409: FDIVq	dis not found

	.word 0xb7aa8820  ! 411: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb7a50940  ! 413: FMULd	fmuld	%f20, %f0, %f58
	.word 0x8194607a  ! 415: WRPR_TPC_I	wrpr	%r17, 0x007a, %tpc
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 421: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbda00560  ! 423: FSQRTq	fsqrt	
	.word 0xb7a00040  ! 426: FMOVd	fmovd	%f0, %f58
	setx	0x4bdc9aa200005ad7, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a40840  ! 428: FADDd	faddd	%f16, %f0, %f58
	.word 0xbda88820  ! 431: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbc1d60bd  ! 432: XOR_I	xor 	%r21, 0x00bd, %r30
	.word 0xbba9c820  ! 434: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa8820  ! 436: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb9510000  ! 437: RDPR_TICK	<illegal instruction>
	.word 0xbba4c8c0  ! 439: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb3a50920  ! 442: FMULs	fmuls	%f20, %f0, %f25
	.word 0x8995a102  ! 445: WRPR_TICK_I	wrpr	%r22, 0x0102, %tick
	.word 0xb3a81420  ! 449: FMOVRNZ	dis not found

	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 456: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00520  ! 458: FSQRTs	fsqrt	
	.word 0xbba48920  ! 459: FMULs	fmuls	%f18, %f0, %f29
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbba94820  ! 475: FMOVCS	fmovs	%fcc1, %f0, %f29
	mov	0, %r12
	.word 0xa1930000  ! 477: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a408c0  ! 478: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbfa8c820  ! 482: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbba98820  ! 483: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00560  ! 484: FSQRTq	fsqrt	
	.word 0x8995e0a0  ! 485: WRPR_TICK_I	wrpr	%r23, 0x00a0, %tick
	.word 0xbfa589e0  ! 487: FDIVq	dis not found

	.word 0xbd508000  ! 489: RDPR_TSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r23
	.word 0xbf540000  ! 495: RDPR_GL	<illegal instruction>
	.word 0xb1a80820  ! 498: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00540  ! 507: FSQRTd	fsqrt	
	.word 0xbf500000  ! 511: RDPR_TPC	<illegal instruction>
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf352001  ! 517: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xbdaa4820  ! 519: FMOVNE	fmovs	%fcc1, %f0, %f30
	mov	0, %r12
	.word 0x8f930000  ! 521: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 524: FSQRTq	fsqrt	
	.word 0xb32cd000  ! 528: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xb5a94820  ! 530: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbdabc820  ! 531: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x30aff28700008cd9, %g1, %r10
	.word 0x839a8000  ! 532: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3aa0820  ! 534: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb8a4c000  ! 536: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xb7a8c820  ! 537: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x8d95a08b  ! 539: WRPR_PSTATE_I	wrpr	%r22, 0x008b, %pstate
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a131  ! 543: WRPR_TNPC_I	wrpr	%r18, 0x0131, %tnpc
	.word 0xb1a40820  ! 546: FADDs	fadds	%f16, %f0, %f24
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 551: FSQRTs	fsqrt	
	.word 0xb3a81820  ! 553: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbd510000  ! 554: RDPR_TICK	<illegal instruction>
	.word 0xb1a00520  ! 555: FSQRTs	fsqrt	
	.word 0xb1a54840  ! 560: FADDd	faddd	%f52, %f0, %f24
	.word 0xb495215e  ! 561: ORcc_I	orcc 	%r20, 0x015e, %r26
	.word 0xb7508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xb9ab8820  ! 567: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0x8394a19b  ! 574: WRPR_TNPC_I	wrpr	%r18, 0x019b, %tnpc
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d2001  ! 581: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xb1a488e0  ! 583: FSUBq	dis not found

	.word 0xb5a5c9c0  ! 584: FDIVd	fdivd	%f54, %f0, %f26
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 591: FMOVRNZ	dis not found

	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 597: FMOVL	fmovs	%fcc1, %f0, %f26
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 602: RDPR_PSTATE	<illegal instruction>
	.word 0x8994e09c  ! 608: WRPR_TICK_I	wrpr	%r19, 0x009c, %tick
	.word 0xbeb40000  ! 610: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xbc054000  ! 611: ADD_R	add 	%r21, %r0, %r30
	setx	data_start_3, %g1, %r20
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194e162  ! 614: WRPR_TPC_I	wrpr	%r19, 0x0162, %tpc
	.word 0xbfa509a0  ! 615: FDIVs	fdivs	%f20, %f0, %f31
	mov	1, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1518000  ! 620: RDPR_PSTATE	<illegal instruction>
	setx	0x84c788d40000c89b, %g1, %r10
	.word 0x839a8000  ! 621: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c940  ! 628: FMULd	fmuld	%f54, %f0, %f28
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89952078  ! 636: WRPR_TICK_I	wrpr	%r20, 0x0078, %tick
	mov	2, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbabc0000  ! 639: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0x8995a15a  ! 642: WRPR_TICK_I	wrpr	%r22, 0x015a, %tick
	.word 0xb9ab8820  ! 646: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0x83942191  ! 649: WRPR_TNPC_I	wrpr	%r16, 0x0191, %tnpc
	.word 0xb5a54840  ! 651: FADDd	faddd	%f52, %f0, %f26
	.word 0xbda5c8c0  ! 652: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xbe2c8000  ! 655: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xb1520000  ! 657: RDPR_PIL	<illegal instruction>
	.word 0xb3a98820  ! 658: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbd500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb80d4000  ! 661: AND_R	and 	%r21, %r0, %r28
	setx	data_start_5, %g1, %r18
	setx	data_start_1, %g1, %r16
	.word 0xb3a00020  ! 670: FMOVs	fmovs	%f0, %f25
	.word 0x8d94e11f  ! 672: WRPR_PSTATE_I	wrpr	%r19, 0x011f, %pstate
	setx	data_start_5, %g1, %r18
	.word 0xb5510000  ! 679: RDPR_TICK	<illegal instruction>
	.word 0xb1a489e0  ! 684: FDIVq	dis not found

	.word 0x819461b0  ! 688: WRPR_TPC_I	wrpr	%r17, 0x01b0, %tpc
	.word 0x839460d3  ! 691: WRPR_TNPC_I	wrpr	%r17, 0x00d3, %tnpc
	.word 0xbda84820  ! 698: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbbab4820  ! 699: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a54840  ! 701: FADDd	faddd	%f52, %f0, %f28
	.word 0xbfa50960  ! 702: FMULq	dis not found

	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589e0  ! 704: FDIVq	dis not found

	.word 0xb3a00020  ! 708: FMOVs	fmovs	%f0, %f25
	.word 0xbd508000  ! 710: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00040  ! 711: FMOVd	fmovd	%f0, %f30
	.word 0xb12da001  ! 715: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xbba80c20  ! 716: FMOVRLZ	dis not found

	.word 0xbba58820  ! 719: FADDs	fadds	%f22, %f0, %f29
	.word 0x819460c2  ! 720: WRPR_TPC_I	wrpr	%r17, 0x00c2, %tpc
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 729: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb9ab8820  ! 730: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a5c8e0  ! 731: FSUBq	dis not found

	.word 0xb61421d3  ! 732: OR_I	or 	%r16, 0x01d3, %r27
	.word 0xb9a81420  ! 736: FMOVRNZ	dis not found

	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 738: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 743: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa80820  ! 747: FMOVN	fmovs	%fcc1, %f0, %f31
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 752: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a50840  ! 755: FADDd	faddd	%f20, %f0, %f58
	mov	2, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a50820  ! 760: FADDs	fadds	%f20, %f0, %f27
	.word 0xb9480000  ! 761: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58920  ! 765: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb3a40860  ! 769: FADDq	dis not found

	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a146  ! 778: WRPR_TPC_I	wrpr	%r18, 0x0146, %tpc
	setx	data_start_1, %g1, %r22
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	.word 0xbdabc820  ! 786: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a9c820  ! 790: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80820  ! 791: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x91956179  ! 792: WRPR_PIL_I	wrpr	%r21, 0x0179, %pil
	.word 0xbc94c000  ! 794: ORcc_R	orcc 	%r19, %r0, %r30
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	.word 0xbbab4820  ! 801: FMOVCC	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0xa1930000  ! 805: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4b44000  ! 807: ORNcc_R	orncc 	%r17, %r0, %r26
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 818: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba8c820  ! 820: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda00540  ! 821: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 822: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00560  ! 825: FSQRTq	fsqrt	
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 828: FMOVRNZ	dis not found

	setx	0xb0de890e0000ccc8, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00520  ! 839: FSQRTs	fsqrt	
	setx	data_start_3, %g1, %r19
	.word 0xb7a84820  ! 847: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0x8395e0f6  ! 849: WRPR_TNPC_I	wrpr	%r23, 0x00f6, %tnpc
	.word 0xb3a80820  ! 851: FMOVN	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f930000  ! 853: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 858: RDPR_GL	<illegal instruction>
	.word 0xbfa4c940  ! 859: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb7a4c860  ! 860: FADDq	dis not found

	.word 0xbfaac820  ! 862: FMOVGE	fmovs	%fcc1, %f0, %f31
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 865: RDPR_TL	<illegal instruction>
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e15b  ! 869: WRPR_TNPC_I	wrpr	%r19, 0x015b, %tnpc
	.word 0xb3a489a0  ! 873: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb951c000  ! 880: RDPR_TL	<illegal instruction>
	.word 0xb9a488a0  ! 881: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb4acc000  ! 886: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xbda88820  ! 888: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0x9194a034  ! 889: WRPR_PIL_I	wrpr	%r18, 0x0034, %pil
	.word 0xb244c000  ! 892: ADDC_R	addc 	%r19, %r0, %r25
	.word 0xbd510000  ! 897: RDPR_TICK	<illegal instruction>
	.word 0xb151c000  ! 899: RDPR_TL	<illegal instruction>
	.word 0xbda48960  ! 903: FMULq	dis not found

	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e138  ! 909: WRPR_TT_I	wrpr	%r19, 0x0138, %tt
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 914: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5480000  ! 917: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfa80c20  ! 919: FMOVRLZ	dis not found

	.word 0xb9a8c820  ! 920: FMOVL	fmovs	%fcc1, %f0, %f28
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994614c  ! 923: WRPR_TICK_I	wrpr	%r17, 0x014c, %tick
	.word 0xbd508000  ! 926: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a48820  ! 927: FADDs	fadds	%f18, %f0, %f24
	.word 0xbda9c820  ! 928: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 944: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c8c0  ! 948: FSUBd	fsubd	%f50, %f0, %f26
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a19e  ! 954: WRPR_PIL_I	wrpr	%r22, 0x019e, %pil
	.word 0xb60ca112  ! 957: AND_I	and 	%r18, 0x0112, %r27
	.word 0xbbab8820  ! 959: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba00560  ! 962: FSQRTq	fsqrt	
	setx	data_start_0, %g1, %r18
	.word 0xb7a509e0  ! 969: FDIVq	dis not found

	.word 0xb7a489a0  ! 971: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb1ab0820  ! 974: FMOVGU	fmovs	%fcc1, %f0, %f24
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 982: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x6b41f2d20000ad88, %g1, %r10
	.word 0x839a8000  ! 983: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195a1d8  ! 985: WRPR_TPC_I	wrpr	%r22, 0x01d8, %tpc
	.word 0xbba488e0  ! 988: FSUBq	dis not found

	.word 0x8195a09b  ! 990: WRPR_TPC_I	wrpr	%r22, 0x009b, %tpc
	.word 0xb3540000  ! 992: RDPR_GL	<illegal instruction>
	.word 0xb7a94820  ! 994: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9504000  ! 995: RDPR_TNPC	<illegal instruction>
	setx	data_start_1, %g1, %r18

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

	.xword	0x8e96545dbefef5df
	.xword	0x5489187166b81828
	.xword	0x854554a1d1c42bcc
	.xword	0xada98a9ec89331a7
	.xword	0x7909e95b04f54c94
	.xword	0xe8c22ea625fa5160
	.xword	0x2712c8744dc364ae
	.xword	0xf1f65e17d9487898
	.xword	0x92abcfb16ba0f3d2
	.xword	0x81108b08a0b1df28
	.xword	0xc3518ce42872d48d
	.xword	0x6bbbec0adaff4f1d
	.xword	0x9d8844561479b529
	.xword	0xdc742b458e8e6827
	.xword	0x1e1f6d6e879e895d
	.xword	0xfd27c81e88cc9a1f
	.xword	0x8817af21b3c2d27c
	.xword	0xbcdb7c41119e236c
	.xword	0xd34171dc35c8f99a
	.xword	0x9dcac40026ecf774
	.xword	0x2dc5ddd00ed3b8e3
	.xword	0xf4b9d81302a61eb9
	.xword	0x1670070fa437d490
	.xword	0xf8fac9364939824f
	.xword	0xb328f6439a87d6ff
	.xword	0xe7736669324f3da8
	.xword	0xf8e471c57c4864e9
	.xword	0x67c2c5dfff89e6ca
	.xword	0x9c10cbac6bb49b9e
	.xword	0xfc7be6f3ca9bd298
	.xword	0xfa3300df49a2328d
	.xword	0x6750a2b87b9bc185
	.xword	0xd5f4c852fba50d5e
	.xword	0xe984df3ad3c537a3
	.xword	0xa8d7a61cee4dfee2
	.xword	0xd525867edd55d5ed
	.xword	0xdd9b61dc96c186ee
	.xword	0xad32426b8e274290
	.xword	0x55c574e784ed8cdc
	.xword	0xed900383782adbd0
	.xword	0x30aa22e9fb4b6c6b
	.xword	0x01ad2f6ae7c0cafc
	.xword	0x47a16260b2fe0c4a
	.xword	0xbd69df381d68731f
	.xword	0x9332da01499a038c
	.xword	0x4e294d573a7ea7db
	.xword	0x94bfbc89562fe24d
	.xword	0x2bcbfb27ef764d9a
	.xword	0x51eb936110b70c2c
	.xword	0xf9b7c6881de539cc
	.xword	0x532351e894a7e3f3
	.xword	0xa9a58f42e9cf3e0a
	.xword	0x3603758e981c685c
	.xword	0x53e56367ff5aadf6
	.xword	0xb4f0a476c1ac0f92
	.xword	0xc700b31db75ea488
	.xword	0xa86e91710459ba52
	.xword	0x701b0746260c7d49
	.xword	0xd59a7a4f1a2dfdec
	.xword	0xc1cf0ff90fa4451a
	.xword	0xa23abdbc02521081
	.xword	0xd75e2585846b111a
	.xword	0x3745c3312ac0aed4
	.xword	0xe9288d64b8ab0114
	.xword	0x3c379df0bacc3bc8
	.xword	0xd6aa92148b1f05b3
	.xword	0xe7f79c7255f9066c
	.xword	0x775f877551a71c65
	.xword	0xfe7560f2fc5cc198
	.xword	0xd4af4f396f9b7b6f
	.xword	0xaf375cf0f36d0682
	.xword	0x95d0609aafa0fb3f
	.xword	0x1eb7e65445a96811
	.xword	0x249e39b8b30b25ff
	.xword	0x43fa52582bba6593
	.xword	0x7fd6b5ea2acc1ec3
	.xword	0x1e7e8a020499ff84
	.xword	0xfe21da00e07f3be5
	.xword	0xeeec17e011b92f60
	.xword	0x06778aa00f1e7f02
	.xword	0xe3ef03e40359241f
	.xword	0x1d4f82328720e4ec
	.xword	0x1eb23410a69679b4
	.xword	0xeb945d0edf79b13a
	.xword	0x2bc0e83b207be0f1
	.xword	0x37ccb635f9aa2189
	.xword	0xcc602a3dcd537415
	.xword	0xf037125f6aea8a85
	.xword	0x7753a1feef1c125a
	.xword	0x07169331e86b566d
	.xword	0x6f8cb8f2514a5a0c
	.xword	0xa964d66950979f90
	.xword	0xa8b69c3b68638be2
	.xword	0xf15acd616c5fa95c
	.xword	0xcaca0defff00d2dd
	.xword	0x4099a74773ccd0f9
	.xword	0xa933ab38575c3a30
	.xword	0xab4376f958bc5c15
	.xword	0x69ac02e32ac137cd
	.xword	0x83cb459fc2b944b4
	.xword	0x247f02158e2bfd65
	.xword	0x48155c9c14968268
	.xword	0x884805a749734aee
	.xword	0x5425f0fecf07ab12
	.xword	0x774b6beb7063622d
	.xword	0xeb0ab77b15435cea
	.xword	0x82c1e0fa0be232ad
	.xword	0x1b415ef8e832df14
	.xword	0xf10cdeeee330686e
	.xword	0xa11397989540d74c
	.xword	0x6f845b659fc04468
	.xword	0x956f7057c1170d84
	.xword	0xc4c47d20fa8454dc
	.xword	0x24b0589c806df654
	.xword	0x5c3d42e0f49e86fc
	.xword	0x369c588b2b97771c
	.xword	0x41476744679061c2
	.xword	0x3c4a5edc0f0cb072
	.xword	0x9f98508aa1b87135
	.xword	0x4ec24580260c60ce
	.xword	0xfdd60023a007d18f
	.xword	0x9dc82331ee8ebb4c
	.xword	0x2f6b177a460c2fba
	.xword	0x2ced3470817af3bd
	.xword	0xf48d36eb413424d1
	.xword	0x23cfcfb5992a8598
	.xword	0x122a05171d0aa8b7
	.xword	0xd7563eae0371dd57
	.xword	0xcfc94a36d0aa5b6f
	.xword	0x58a98a6a0f518d2d
	.xword	0xc3824d32a55936ea
	.xword	0x2dee6208877467ea
	.xword	0xec3986f9b246e89e
	.xword	0x7f322f9e2f90e045
	.xword	0x1a92d40b91101e52
	.xword	0x60a97f72b58a9611
	.xword	0x9e66a6b6e0bf6075
	.xword	0xf63bb8103806a295
	.xword	0xaff57d48aff2a30b
	.xword	0xbc8b3cf397bb2b47
	.xword	0xcfd6513c290ac445
	.xword	0xa18d53ac6c87f5b3
	.xword	0x6fbaac7f823d6112
	.xword	0xaa1e476affc4b138
	.xword	0x53d33c0abb127091
	.xword	0xa1a58da784ec3dd8
	.xword	0xfef84f6da3914451
	.xword	0x6339dda68af67a31
	.xword	0x1636507644b73bb6
	.xword	0xc7bf6f1d179207a0
	.xword	0x9605f23985fb8813
	.xword	0x7bff1374ed5ac389
	.xword	0x047d65d71b641e0d
	.xword	0x99ae7e081e063aa6
	.xword	0x72e3f679575645df
	.xword	0xb97398b58183781f
	.xword	0x5a2ecce14f71dafd
	.xword	0x35d60e85e4ac291e
	.xword	0x64d83d07b4a0412b
	.xword	0xac87cd1bae98c1f7
	.xword	0x449b661e2450a025
	.xword	0x594807143de11135
	.xword	0x2f82c844295dfbeb
	.xword	0x988cb3e30bf9e9e2
	.xword	0x03a522f1c32edc58
	.xword	0xba8a8571ce5cebbf
	.xword	0xd86aeb1a53eececf
	.xword	0xba711c5d33c51e1a
	.xword	0x8f28a18b313f5957
	.xword	0x210d2a6d7c0d4012
	.xword	0xfb1fbcfe810d007b
	.xword	0x497b591da8d4e621
	.xword	0x5f32fd269e7e26a2
	.xword	0x83a97fedd864842e
	.xword	0xbc8e31b4b786f80c
	.xword	0x1dc125a7d76d5e4d
	.xword	0xadc754a6f8295937
	.xword	0x15196c773dd05449
	.xword	0x45869b6f80469e74
	.xword	0xff0b5463e1b7aeb2
	.xword	0xd9823ffb590effd6
	.xword	0xa0e86a5d2493d722
	.xword	0xcdb764bf392302eb
	.xword	0xc55639fae5970448
	.xword	0xbbfcfee3cc9fee22
	.xword	0x1a14d73a616a9155
	.xword	0x9e097b766248fc3a
	.xword	0x19995f84aa936dbc
	.xword	0x22713d2af28f80a7
	.xword	0xe2af9bfe6c4ec730
	.xword	0x0e808860e49bd136
	.xword	0x0160b541717a0db7
	.xword	0xf976377c5e04a18e
	.xword	0xf80b6bca84f0629f
	.xword	0xb81052eb8089cd5a
	.xword	0x55205671dc8f37bc
	.xword	0x52487507ca4067ff
	.xword	0x0229098181a30580
	.xword	0x8480a441164c745e
	.xword	0x0d16c2eb686ff20b
	.xword	0xab06e6e3eabffc36
	.xword	0x3e1f120990a3b78d
	.xword	0x11eb0b4641755799
	.xword	0x48064618c501f92c
	.xword	0x0b4eaad536d98179
	.xword	0x1ab618797fc7d0b9
	.xword	0xd79797f9c317abe0
	.xword	0xaa3f32d3fb6d269e
	.xword	0xd2a67a29074a641d
	.xword	0xed1f7ca3eefbdf58
	.xword	0x2a47a91cf2112c5b
	.xword	0x59c7c2eeea1e16d8
	.xword	0x24f3c675991b1538
	.xword	0x3a73ed886cf2b583
	.xword	0x77c56d8a305a8d8a
	.xword	0xfae63e02ef0ecad1
	.xword	0x405d2fe2d4ed8fea
	.xword	0x6ab4643038e6440b
	.xword	0xb15615c991cefab0
	.xword	0x474e0ee92682268e
	.xword	0x681c810ddc8f92c4
	.xword	0x5b1ffaa7ab5170af
	.xword	0x3cd6f4a20ca9aded
	.xword	0xe8ccf18e35ad45bf
	.xword	0xeeea075480fb4da0
	.xword	0xe7c7326670c77b12
	.xword	0xd586308402c2d365
	.xword	0xc3d3d3a796bbe1a0
	.xword	0x978fbcee17107184
	.xword	0xae8892882b660826
	.xword	0xae6d3210e386a4f6
	.xword	0x18d8039d148fb5e6
	.xword	0xe57ea22d18b1d731
	.xword	0x27fa1a4a3b365dd6
	.xword	0xf299bc372a482efa
	.xword	0xab19fa4514bb0a7f
	.xword	0x44fc305d94b768d3
	.xword	0x8096d38e3390d13a
	.xword	0x74071f23bc73c381
	.xword	0x3ff196fffcbbca6a
	.xword	0x7af5500cd3d7c73e
	.xword	0x5f0864f289d6c325
	.xword	0x9239f098773a43bc
	.xword	0x23137279515c5165
	.xword	0x87402b44affa0bcd
	.xword	0xd253ef2239d02bdd
	.xword	0x5e424f1b64b4e816
	.xword	0x40aa00c34c1a54a1
	.xword	0x4c09dac365fcba4b
	.xword	0xcdaa121e1fa4992c
	.xword	0x732290dec2e3b85c
	.xword	0xe32bc2bf7c9a99c1
	.xword	0x899e0e6199299b8d
	.xword	0x6b8087676b9bdc00
	.xword	0xfcf9289ee48c0566
	.xword	0x2a94d360853e2cf0
	.align 0x2000
	.data
data_start_1:

	.xword	0x11ba6d8a5ef51c88
	.xword	0x5c51a0e6fc6e9ad2
	.xword	0x1ea396652eab6382
	.xword	0xf9d291af3f529b45
	.xword	0x891972a885c3bb7c
	.xword	0x6fa0a626062dd558
	.xword	0x6983b5f26e1ddaae
	.xword	0x620829c533e85832
	.xword	0xead4675464d8d5b1
	.xword	0x0f2a2623e859f2a3
	.xword	0x611330ca9fbc5ba9
	.xword	0xfa79ef6c54668267
	.xword	0xbc9b7f709a73fad7
	.xword	0xc5636cc586b8d659
	.xword	0x0e2cd5a0c621344e
	.xword	0xc2a08efd8ba709c1
	.xword	0x10458b1b1511ef8c
	.xword	0x748fa8ffb3d62e37
	.xword	0x756fbebf472a5c6a
	.xword	0xfbe95d97c3bb452a
	.xword	0xf41e5caa8d7c0a06
	.xword	0xfc779899c37f367c
	.xword	0xb20a38d4a02d5ab5
	.xword	0xc16dbcd16d7e3378
	.xword	0x43d5cff474d2318c
	.xword	0xdddc656931d18444
	.xword	0xf1dd775216f1da72
	.xword	0x8d83f2603cea6c1f
	.xword	0xb09a23c23d323a37
	.xword	0xe57e8ab57eb13265
	.xword	0x4b6be5e394415ac0
	.xword	0x567e045571741935
	.xword	0xe52e79d0cb87ec91
	.xword	0x961e66bb1bf4d839
	.xword	0x20680aac5f3c076e
	.xword	0xbaef67a846ca1fcf
	.xword	0xc60c329f25d0653a
	.xword	0xad97a42ea866d0e6
	.xword	0x6fef9824a97eb06f
	.xword	0x8fb1b8e6034b9104
	.xword	0xe5e2c5b7a8cda655
	.xword	0x768e16619b90b54e
	.xword	0x60c243c4f2f7ea8d
	.xword	0x66f2d5a56bec62a6
	.xword	0xdc90b5f465879e2a
	.xword	0x57981e4366edbcc7
	.xword	0xaa9d6b3f420c4d4c
	.xword	0x333fdcbb2fd05f77
	.xword	0xed4b85e4509af833
	.xword	0xc1c8dbbcdc2baff4
	.xword	0x11ca3efcef4af6ac
	.xword	0x6273b406498867a8
	.xword	0xa0758ead167b4793
	.xword	0x11c66ed8effe17cd
	.xword	0x5f62c54c8fdbe729
	.xword	0xf5158ded64a324dd
	.xword	0x2302bfaae5e519a6
	.xword	0x8b0dbdfe652b60d5
	.xword	0x300064d7a4d5cd06
	.xword	0x7b7c498dea3c1efc
	.xword	0xf3d53c87e9aa9c79
	.xword	0x86584ec7d18e591f
	.xword	0x69b182559227e76e
	.xword	0xabb3d40658150c4c
	.xword	0x9afe2f672fdb8e68
	.xword	0x50ce12185bf99d5e
	.xword	0xfa7d4b133e51dc9d
	.xword	0x8433bed3ea9d77cc
	.xword	0x7cdcb472bc3f3c93
	.xword	0x8d0ff4f2484c7686
	.xword	0x460772373bf47629
	.xword	0x93ba87cd85815755
	.xword	0xd96941e0140e0017
	.xword	0xbc9660806c18c389
	.xword	0xec71007970f79230
	.xword	0x19f3054b2075130e
	.xword	0xd255f3918bc6861b
	.xword	0xd3cce5c2cc0181a5
	.xword	0x9b32eab724c77e96
	.xword	0xc4411b22a2b5bc29
	.xword	0xe522ccf639538a9a
	.xword	0xa70b444f22cec329
	.xword	0xbb4a6a89bc554f0d
	.xword	0xa19b0aacdd7d8efa
	.xword	0x0c4e4a311056c119
	.xword	0xc84538789fc05e2b
	.xword	0xac35bc7d08c1ca84
	.xword	0xc677f6a9dc96dd0e
	.xword	0xa5d2630a323e3d15
	.xword	0x6a7c7a39f69953c9
	.xword	0x2f79d93fa833680b
	.xword	0xe29005ea300b765a
	.xword	0xb26dcbbedc182446
	.xword	0x382e50b2715c3716
	.xword	0xa058705ee55657f8
	.xword	0xc88aa546d245fb77
	.xword	0x5a5b0a4c33b7093f
	.xword	0x912422293e389ccb
	.xword	0xd55c8448e99bcd37
	.xword	0xb664d3e65744a1bf
	.xword	0xf678ea8293cc8fe5
	.xword	0x1916e5375da3bb49
	.xword	0xfdef8b0f90c3afd3
	.xword	0x2d0f18aeebd11676
	.xword	0x62be8a03b0c9ff4a
	.xword	0x87a72e168cb3ec00
	.xword	0xc6fea1fe4ca292da
	.xword	0x156c5d468aa0e226
	.xword	0x196a9a2d7732ac73
	.xword	0x0f9c3235205f1f9d
	.xword	0x4939d69a2920b65d
	.xword	0x4c9f2822d2852bfa
	.xword	0x3acd42501a5f2fca
	.xword	0x4c1fe31efcdbcb1b
	.xword	0xa358f08f369abaf7
	.xword	0x952cee59cd74c663
	.xword	0x70240e8eff9d69ca
	.xword	0x3f0689fa90d67d75
	.xword	0xa10d932004c1a466
	.xword	0x3b56cd6afb0e1ab0
	.xword	0xddbfc764d8bfc018
	.xword	0xb360d83879eff1b1
	.xword	0x40ff666f748b1735
	.xword	0xe283595b30671793
	.xword	0x2d9d62f9ece29fc4
	.xword	0x048e75c03041d527
	.xword	0xf581530c4280a70d
	.xword	0xdbe3d5e8027d73bb
	.xword	0xa9993b32800d10bd
	.xword	0x86acba59bd6981b0
	.xword	0xb57ba67e632be4f5
	.xword	0x07dc9eb888eb51c7
	.xword	0x01c6b2044c4bbc15
	.xword	0x8b62530c8c150655
	.xword	0x4730a513ce539fbc
	.xword	0x4d64762cae9353ef
	.xword	0x3629572c80bce4c0
	.xword	0xc3e6caaaa17ddddf
	.xword	0x7403f1582e1196f2
	.xword	0xdd900e21f3d2424c
	.xword	0xd686d08bb389f9b8
	.xword	0x39e17484dc2d5c17
	.xword	0xa7d1fb9986f7337d
	.xword	0xbdf09b50314b3da5
	.xword	0xdd707a8570e3d710
	.xword	0x56355ae4002dd272
	.xword	0x763149107f4dec5f
	.xword	0xa7ff10670ea0f3da
	.xword	0x0c8bd92021a00567
	.xword	0x25fe618e5fa89d18
	.xword	0x7a6b441ab52a2201
	.xword	0x023c7f275934544f
	.xword	0xd16b6f0e4e490864
	.xword	0xc9b81395c222efe3
	.xword	0x5e047aebd903607f
	.xword	0xd9d71393ba4e1177
	.xword	0x154ca472fe9ada9f
	.xword	0x8afa0a16e2bc19ed
	.xword	0x45d0362660b415cd
	.xword	0x14ab94c82a8a7bd5
	.xword	0x02b201683dd20e02
	.xword	0x1e02580a6c3b989a
	.xword	0xa234442410d963d5
	.xword	0x4dc4b5f7c28a4705
	.xword	0x7e5d9fcf0838c61d
	.xword	0xdcddce23281c02fa
	.xword	0x3531f6e8bd54e056
	.xword	0xbe127bbb51934f7d
	.xword	0x39c5238b7e7a4966
	.xword	0x03e2519d8a0e6660
	.xword	0x10955dbd882e3f18
	.xword	0x47193acef8ae3422
	.xword	0x4b64adbb9413fe2d
	.xword	0x38499917f16020d6
	.xword	0x2a6348a55076ad3e
	.xword	0x32a56766890d20a1
	.xword	0xe024391f86af4a2d
	.xword	0x942f3fde5dbde4e1
	.xword	0xcb88f53965b8219c
	.xword	0x62ca0a02f0486062
	.xword	0x79ae980e16cffb47
	.xword	0xf5cc66dadefb2dc7
	.xword	0xa450bc19b1a497e9
	.xword	0x41d920bb9d11f08e
	.xword	0x60116a90dd96b26d
	.xword	0xc9fe952994eb4bb3
	.xword	0xcbe1218174b89c0d
	.xword	0x12d98cca91579037
	.xword	0x8ca1fdeb20375caf
	.xword	0x1a2e995dab5f5c32
	.xword	0x7e28d2b704b5c575
	.xword	0x50591b235e890620
	.xword	0xc32a7974c87e195d
	.xword	0xb1ae1041474ec0c2
	.xword	0xc79668e909c4eff1
	.xword	0x812aa3a897f1e421
	.xword	0xebc8258bf525af6d
	.xword	0xb59e4125dce85004
	.xword	0x16e6945c73469c59
	.xword	0x444b3bd04c871b4a
	.xword	0x9b10a9c6295e3773
	.xword	0xd31c27358e2a788b
	.xword	0xd7af96f63511e8dd
	.xword	0xa1dfb2039147ba5b
	.xword	0xcd41869f17ec9ca5
	.xword	0xd574e73480853a27
	.xword	0x6a538bbd760c241a
	.xword	0x76ecfb8bc31354d4
	.xword	0x950a378c1d4e0f06
	.xword	0xcc08138a65cb6621
	.xword	0x56d75f313ca82b75
	.xword	0x50d3702440c83032
	.xword	0x7c93459267cd6cd0
	.xword	0x7f5111aeeb52f64d
	.xword	0x2aca5f97b98d1b85
	.xword	0x08c6143869277625
	.xword	0x8c3cf81e79cc3e95
	.xword	0x3754ee8774e7357e
	.xword	0xc5ead22ddda529ef
	.xword	0xf21bf5db665bedd4
	.xword	0x8e5f98344303fbb5
	.xword	0x25b95107aaaf233d
	.xword	0x1695df00f59e28a7
	.xword	0x0939033fef198c00
	.xword	0xa6a200f201501837
	.xword	0xd1bcd38b6440861e
	.xword	0x2107019f3c525ef8
	.xword	0x04bc6205083fa769
	.xword	0xada65f19ca1fd26f
	.xword	0xeeae0742d0413ab2
	.xword	0xfe34ba67dad17c26
	.xword	0x2803f4822c9502e7
	.xword	0xf92e189f483b2eea
	.xword	0x3e849eae2ea60099
	.xword	0x84cb9a317c13a4e5
	.xword	0xd46010556a92c18d
	.xword	0x6a8d422e344daa0f
	.xword	0x9a87632e2f7f356d
	.xword	0xa0648952bf295c33
	.xword	0xfa106a312b930c18
	.xword	0x91a349a2a99067b8
	.xword	0xec2dd9efe373d66e
	.xword	0xc2abe93a4340f989
	.xword	0xdcb7d7e3ae79fa33
	.xword	0xdc301a4b8b059fd8
	.xword	0xe7a206d78849c599
	.xword	0x8dfe1cf2b24158a3
	.xword	0x3d2d0ef56b9d4ba4
	.xword	0x10606786a89f4995
	.xword	0x45a23e5600fea8bf
	.xword	0x7328eeb4de7f19a9
	.xword	0xc3f737044a0d5815
	.xword	0x6cdca58b8db2d618
	.xword	0x81abe14babacbff8
	.xword	0xacf7d5595cbdbdf4
	.xword	0x1dd57063da0ca5f9
	.align 0x4000
	.data
data_start_2:

	.xword	0x8ba96415b0689827
	.xword	0x325cf06cbca42a00
	.xword	0x2ea9020a619bd332
	.xword	0x8c832de413ed63f2
	.xword	0xb3ce64038fcd9248
	.xword	0x977014b328856740
	.xword	0xda1c9a34ed763215
	.xword	0xd76f47da19409d40
	.xword	0xdf60537386afeff0
	.xword	0x8bca20a021d22e1d
	.xword	0xb300d57ae4b42f7d
	.xword	0x3a53466f404bf7c3
	.xword	0x3ccb671ac6c83788
	.xword	0xa4e6b6e6e1bbfc81
	.xword	0xdfdc3ed3a182c072
	.xword	0x0d4a0abbc49e5774
	.xword	0x9b97b0b3976d7f53
	.xword	0x1cdee56727882228
	.xword	0xfda432b2be627072
	.xword	0x5722920bb3923909
	.xword	0xd691f5c795620bfa
	.xword	0x4a348cf4ba0cc0c8
	.xword	0x04c83998e554b3f8
	.xword	0x3a0d32fb4b97827d
	.xword	0xfb1ce77b84ad5667
	.xword	0x4437e54095048690
	.xword	0xa03dd15ccc1084bb
	.xword	0x9463f66737b11f4e
	.xword	0xfcba6726169355da
	.xword	0x2b1c2ddc60b731c9
	.xword	0xbe7b7419f6a82585
	.xword	0x63b70e7d1149e413
	.xword	0x9db4cce1f3e24fcc
	.xword	0x267db093ed286668
	.xword	0xdc3f7cf24333dab6
	.xword	0xc4aee358ed20b3b8
	.xword	0x69b5c3f70ef5b9db
	.xword	0x6c3f839e8963c669
	.xword	0x6cefc1ae26b00aa2
	.xword	0x98e979b19875ef95
	.xword	0x98b1342e1d866ce3
	.xword	0xb3369c2ac1f5fb8b
	.xword	0x65ca751bcbd25e72
	.xword	0x8e7120cf05b661cf
	.xword	0xcc3572ff322026ad
	.xword	0x39368ad5d3e1835e
	.xword	0x377839897d2d500a
	.xword	0xd9999e926ded1ce0
	.xword	0xe01caafbc07d38f6
	.xword	0x727223ffaa8a64ca
	.xword	0x0de83def0884165d
	.xword	0x21ba89a605d043c5
	.xword	0xeca98cb638c5a0cc
	.xword	0x2e46319a0f6a10d7
	.xword	0x90625e00369b3ed4
	.xword	0x81e9d0873c0363df
	.xword	0x5c56ab2841b40d99
	.xword	0xf99d461809b05436
	.xword	0x6723bea716fa4b49
	.xword	0x0807673d260511bd
	.xword	0x4adabaf05c421229
	.xword	0x3be5ced69a4f3775
	.xword	0xbd34feee748914bd
	.xword	0x3dce7e16677ba221
	.xword	0x3056f7ab0e8f5b90
	.xword	0x60263c83e6e777be
	.xword	0xa91a6b40150328e4
	.xword	0xd2dededb52505a87
	.xword	0xb29d124243736d53
	.xword	0x93e5b95c0310df92
	.xword	0x4a597520327d36e0
	.xword	0xb01604ab16b702f3
	.xword	0x7955f0e9a6d823a9
	.xword	0x04fbd5698fe62d8b
	.xword	0xa5b1b24934754b2d
	.xword	0x84cac8e5cb6cdbfd
	.xword	0x0429996ce143c94b
	.xword	0x395092ce0b7ed38f
	.xword	0xd98224fe0c716043
	.xword	0x6a2d05981bb6c84c
	.xword	0x43165bf8b744d53a
	.xword	0xb9c5360aa960c61f
	.xword	0x7ea3c02c1811b447
	.xword	0x5ba247dca41d32a1
	.xword	0x343ae658d6b25a59
	.xword	0x14fedeaff318fef7
	.xword	0x529cc600c03a7834
	.xword	0x38c96ca6853befda
	.xword	0x384e078471c476cd
	.xword	0x6727bfee088d9769
	.xword	0x7f5b806d1e7ed8af
	.xword	0xee160f1426d63204
	.xword	0x307510e0f4eb936a
	.xword	0x005be43f4baaa870
	.xword	0xc6820c8be1fb5b18
	.xword	0x2f17a62cf1975092
	.xword	0x68079e980793ec3e
	.xword	0x4d943f1efed00910
	.xword	0x16979cc75be10af7
	.xword	0xee2229d7c9f9ad4c
	.xword	0xf10955a55e56a4cc
	.xword	0xc72b59ef82258c66
	.xword	0x14aecaa2a5436bd4
	.xword	0xdbbb587cc686fa96
	.xword	0x78a5f2adc255f5ba
	.xword	0x5d16a78062a681bd
	.xword	0x968d7a84baf514bc
	.xword	0xe51631680a11e83b
	.xword	0xf17f72227752d0ff
	.xword	0x95494e6c6ad45b8f
	.xword	0x2b4e06aceb9bf79a
	.xword	0x559eaa9ae1171307
	.xword	0x2d89c97b08135770
	.xword	0x7b72b12fdb7a12fc
	.xword	0x29e1f94a2bf12c27
	.xword	0x0cba31eba897a2a4
	.xword	0x7e1e389e3a5c2ebe
	.xword	0xf985a9d73d03d3f9
	.xword	0x971fc42798775918
	.xword	0xf56664ae4853e2d7
	.xword	0xf327d2a42e55370b
	.xword	0xc83a71a03bb8a21b
	.xword	0x63da0abe5e72f57d
	.xword	0x5e8816c76f430015
	.xword	0x3d832f79a00a0844
	.xword	0x4236ef7b68e5d3ea
	.xword	0x69ee54fc8339db53
	.xword	0xcead170e353136fc
	.xword	0xe7497cd450431bb2
	.xword	0x688ca33af2e466a6
	.xword	0x8bdb30c0eac16d68
	.xword	0xbc0b786361afa1af
	.xword	0x270c15eac93e3d81
	.xword	0x5f4846421f2a166a
	.xword	0x50f22cf1b2a34e52
	.xword	0x17f87e9cef0a2bbe
	.xword	0x68ddfac841a6c97e
	.xword	0xa8e7fd70ee9573e8
	.xword	0x517ebfa3f057e89b
	.xword	0xbe26baaf1fa9ba60
	.xword	0x9539b4c35c5cc63c
	.xword	0x19c1183127694552
	.xword	0xb9492fb487754313
	.xword	0xa6e1ac7452a635fd
	.xword	0x8bf6a7a82125bc13
	.xword	0x7e1dafeef84f9c27
	.xword	0xd263cb281bb59d18
	.xword	0xff49cc78b79eea0f
	.xword	0x6148a6ca301b826c
	.xword	0x53aaaed7f209b277
	.xword	0xb721de89aa4857d7
	.xword	0x27719ad49bf18d7e
	.xword	0x8570351f8d8e267c
	.xword	0xe28bfbba606d28cc
	.xword	0x55abc30108d99768
	.xword	0xa410559ed686a7fa
	.xword	0x52ed2cef4effbd18
	.xword	0xf505a171fe4c210c
	.xword	0x4b77d99f7acde67b
	.xword	0xf2a082a22d83cc8a
	.xword	0x2583ca7d8661445e
	.xword	0x6b2fcbc430541171
	.xword	0x6aadd12add861660
	.xword	0x8f5f24fdb7545185
	.xword	0xab6f7b6f4c55d365
	.xword	0xf0d8ede18d4ccd26
	.xword	0x53b9c22574b7d571
	.xword	0xe340a7500b0943b8
	.xword	0xe32aa6a568605d39
	.xword	0xb6eb3d67bc0abde2
	.xword	0xf7141333f4e23f8f
	.xword	0x2b5a9ce596762c7c
	.xword	0xee3e999a41bf0642
	.xword	0x13c6e79be524827d
	.xword	0xdf255cc9b6fd9987
	.xword	0xdf6526c519af3fb4
	.xword	0xa8deaabfd5a57786
	.xword	0xc5771906ec9beabc
	.xword	0x7d34d7994047e148
	.xword	0xd1555d99e21ad326
	.xword	0xb71ec3259b5ae658
	.xword	0xf90308bba46e9bb6
	.xword	0x9214204374fad5a0
	.xword	0x03ab64c7273f3e66
	.xword	0x4d74316308b6bc79
	.xword	0x461cb42f36aa2570
	.xword	0x765ec5ec57718733
	.xword	0x70935f600d991964
	.xword	0x8f8b8896fe0a9474
	.xword	0x1b8a030799591663
	.xword	0x41a95e8266414220
	.xword	0x3df4efc4b8348060
	.xword	0xa69b32a9fe8f64d2
	.xword	0x2837a59d29864150
	.xword	0x831ef931c3cabdb7
	.xword	0xf6c90fcc6ae72ea3
	.xword	0xabaef0cfe963fa3c
	.xword	0x9991f5bf3338a196
	.xword	0xac0f4cb77844cf5a
	.xword	0xee7516a1d77b34a4
	.xword	0x64adaf1586d381ea
	.xword	0x7c5315aaab15c84b
	.xword	0x21bb0f8f68c94c4a
	.xword	0x13a9367ba43e77db
	.xword	0x4a2fd840bc2e43ce
	.xword	0xac446543cec739da
	.xword	0x559136656669878b
	.xword	0x36d1f4c7c425223a
	.xword	0xb66f7a4ee8bbb3d2
	.xword	0xd7d4a2c531e95160
	.xword	0xfe9827294140f765
	.xword	0xfc894a3ebbbe48fb
	.xword	0xe8e50ed542f86269
	.xword	0x1381ab0b21292a7d
	.xword	0x70daf68eae4c0a76
	.xword	0x1911edc75a0700ed
	.xword	0x2985c43729548567
	.xword	0xc368ada5162cc55f
	.xword	0xb5931e439788e411
	.xword	0xad3a593a66afe578
	.xword	0x9ece4239d83aa445
	.xword	0x1a79342665bab8c0
	.xword	0x2b58cb4c424503a4
	.xword	0xc420f4dddf7f7de8
	.xword	0x35609579a673a400
	.xword	0xcef2231c0863aedc
	.xword	0xc6cb6404b61183fe
	.xword	0xb4b7f1cc2b48f541
	.xword	0xa4c581116c99b679
	.xword	0x88d00bd66b9df8bf
	.xword	0x58fc915950d3a0f9
	.xword	0xdf7f551807abfeaf
	.xword	0x9952180447e14c81
	.xword	0xab247729ae502d16
	.xword	0xae7ebf8124d1973f
	.xword	0x99cdb62fd859aab2
	.xword	0x51dc30118bb2c5d8
	.xword	0x424043d2b79a9528
	.xword	0x0b062a51eba22c87
	.xword	0x931a7e553427dbff
	.xword	0x09acccc7edd0e794
	.xword	0xf5c5537ddaa988f6
	.xword	0x23bb9487df4d4ec1
	.xword	0x0d6b1f1ff94923b4
	.xword	0xd6b8fe3f2bc4a1d5
	.xword	0x533be4bb1b2106d6
	.xword	0xffda26d09d6b795a
	.xword	0x48b51fc8ceef86a2
	.xword	0xcec84b3f39848616
	.xword	0x89efa84768a7d80e
	.xword	0x0a4d52d2ad3cb62c
	.xword	0x327d7b08ef43f0e2
	.xword	0x4dfaebb7b90a5c56
	.xword	0xcfc89f4dfe34b5af
	.xword	0x9d52cd743bdae933
	.xword	0x91ae48e4a12d9c2e
	.align 0x8000
	.data
data_start_3:

	.xword	0xc66f6ba0959319a5
	.xword	0xf229f42b04042711
	.xword	0xfe52269484353d06
	.xword	0x474fe75499360a37
	.xword	0x0e6f5c5a08a24519
	.xword	0xe1d59a420c941da6
	.xword	0x96b5ab9e11fb4ab6
	.xword	0xa8f072337483519d
	.xword	0xd3b95a24266bda4e
	.xword	0xf07a1d5a2706068c
	.xword	0x45c5f99fff286b0f
	.xword	0xb729da5700251482
	.xword	0xe3a8b2a0f062b336
	.xword	0xdcd98a4a0b90d738
	.xword	0x30d0e46c35eff2f9
	.xword	0x3b53f6ee3d4a8a88
	.xword	0x4d11120822955748
	.xword	0x9a23db04633e2a98
	.xword	0x68afccefd59d3fc4
	.xword	0x0cc6a40b31946e75
	.xword	0x7a08901b1097b7d7
	.xword	0x4e276ef52180991a
	.xword	0x1f7775dbd1642a4f
	.xword	0x65b45160be7935cb
	.xword	0xfe87e0eb82c302de
	.xword	0x560e6638008b8afc
	.xword	0xef9d293c5e8010da
	.xword	0x7a6c5c4b64341938
	.xword	0xfebd20c36c9e3a5d
	.xword	0xdbc2cf85a66e3a3b
	.xword	0xb3fc1032597da1b8
	.xword	0xc05d46860296f91d
	.xword	0x7db2ef2806f7576c
	.xword	0x51500d246062d2ef
	.xword	0x8d8321c1f946be16
	.xword	0xe7c88ba8b895a4f2
	.xword	0x990517480183f391
	.xword	0x5d37cf949f850a15
	.xword	0xa01cc3ff6a7da3cc
	.xword	0x2b8d83a3932d8539
	.xword	0xeb19c3e10233e355
	.xword	0x2d13137f9f5e2669
	.xword	0x104795ce6b31e32d
	.xword	0x0136c7ab4dce5c51
	.xword	0xbb2b904884ba04ce
	.xword	0x6921b46715f6d18d
	.xword	0x016185d0352bd9bf
	.xword	0x628725d839e73318
	.xword	0xb99b1e83f1e24c87
	.xword	0xbed0de4bb0fb2466
	.xword	0x8f921cfa873046dc
	.xword	0xc57f7ee22e3b170a
	.xword	0x03094b4a3361a607
	.xword	0x0838b8ebf2a50b55
	.xword	0xc4154858235f9c47
	.xword	0x9aae875eeb9591ca
	.xword	0x8633e11742795e7e
	.xword	0x3d43098beabb75fd
	.xword	0x565fc17a674cf834
	.xword	0x736ab2aa6fb54421
	.xword	0x3d199dc7a0fc9c36
	.xword	0xfe6ec9ee2bdc5727
	.xword	0x5c9a2745a61f0bf6
	.xword	0xa4b869ba44ad0a02
	.xword	0x4c17d73476165247
	.xword	0xc8918eacc988ca2e
	.xword	0xd4151210aeac0751
	.xword	0xce43e18811f407f9
	.xword	0xa68bb24d2334a41b
	.xword	0xe90121c8413ae731
	.xword	0xa1654f426d72d90e
	.xword	0xd9e139c56faef1a4
	.xword	0xcd018fc77121f545
	.xword	0x3e3aa8d5e5b9e47d
	.xword	0x0dfd0ab116af4081
	.xword	0x78aa6c370937ff53
	.xword	0x1e8b12efedad9216
	.xword	0xf523ef5dd3f35b0f
	.xword	0xae2b4396f8ee922d
	.xword	0xa42452d83b2ede9f
	.xword	0xace21cceb444e8e9
	.xword	0x7eea571544d5f55e
	.xword	0x7e6ad4ea836efacd
	.xword	0xe164f679b85dca69
	.xword	0x2c4e6c70cd55430e
	.xword	0x9f9e0c22229ee1f1
	.xword	0x3f2e4f9c38109084
	.xword	0xe81f875c4889f609
	.xword	0x41ea6f8261d9f316
	.xword	0xc98aad7665a8b92a
	.xword	0xa29292883d128278
	.xword	0x1701ca3c214bbc5b
	.xword	0x065c9f58b6b473d5
	.xword	0x3aacab8e2f9e3e35
	.xword	0x297dbfa871dcbfda
	.xword	0x4147579c6ead3d0f
	.xword	0xe47f00db42e6f91a
	.xword	0x233cb0326281b532
	.xword	0x4132e5711d2eeafc
	.xword	0x42d7dcbe9d3987b6
	.xword	0x26b825c535819cb7
	.xword	0x9aaa091324bd1731
	.xword	0xa0f72dfd7f57a500
	.xword	0x480a664eb52efea9
	.xword	0xae677c30161d87c2
	.xword	0xa063a8919729b294
	.xword	0x5ebad366be694478
	.xword	0x66bfb4bc60de4f07
	.xword	0x45998e6a1b3f536a
	.xword	0x027daf4dc3fa67da
	.xword	0x3a75101c79b7acbf
	.xword	0x9880c8a11d053725
	.xword	0x9fe67b306cc86165
	.xword	0xa776e588821aa03f
	.xword	0xea4483cdc0da14dc
	.xword	0x89996bb9770cd838
	.xword	0x401aa759dac65dbd
	.xword	0x954c3f545a0aa1b3
	.xword	0x4522d4acb7cb3a38
	.xword	0xf873d76168adebee
	.xword	0x30b279571d18264c
	.xword	0x59d8449fc204e68b
	.xword	0x086beb2e9bfe5dce
	.xword	0x78632bb21bf469d8
	.xword	0x814963cfd815f71c
	.xword	0x9510b9441527b1b7
	.xword	0x2d7607538a867935
	.xword	0x339c9bebd13e393c
	.xword	0x57a7d28048126538
	.xword	0x94cf441384341ba8
	.xword	0x3035689587edfbeb
	.xword	0x85ed91bdddba62b6
	.xword	0xc7d446d998f5ae27
	.xword	0x4d1b5c217adc8a2c
	.xword	0x57f03bc95f63e757
	.xword	0xb72c8b9f31be789f
	.xword	0x858dfe73b824ce40
	.xword	0xfe905949c450819c
	.xword	0xafb996814fe70705
	.xword	0xc3d815004d2012f1
	.xword	0x39222a618a30b8f6
	.xword	0x9642e227be3aec36
	.xword	0x6f79296f838ee041
	.xword	0xf1994fe4b9681a61
	.xword	0x3e4ed132abc106cf
	.xword	0xeb0164fd2967aa37
	.xword	0xf2719ab35f9f2617
	.xword	0xec37b328a3966986
	.xword	0x905f775232679a60
	.xword	0x4e9f8987a5a94c19
	.xword	0xb65a5fd35edf1413
	.xword	0x22412b58b65424e8
	.xword	0x9b6cb4b90d94fc92
	.xword	0x363a5701949f85d6
	.xword	0xe678f44e78066912
	.xword	0x189d5d05e44e23d7
	.xword	0x858cf273a64c4ca4
	.xword	0xe9e79ef9b0c9e8d1
	.xword	0xc5e34f5daeaaacfb
	.xword	0x70d5b7a62986ce35
	.xword	0x66cbdeae3011b238
	.xword	0x0117e4414ae7128b
	.xword	0x821a4bcc1a49f93d
	.xword	0x5f02cc826d70a128
	.xword	0x761ee2925cf60806
	.xword	0xfa46aad57d83a117
	.xword	0xe1b4c06bb50b5cd1
	.xword	0x4863e27f2fef26fe
	.xword	0x649baadeba01c687
	.xword	0x528ef0b61b6bcd09
	.xword	0x2cbd6a91e0293c01
	.xword	0x32e69c9c9b977b33
	.xword	0x9718b639f0469c90
	.xword	0x35269ea42d687f06
	.xword	0x41788ee1117583ec
	.xword	0xdd697b90229619e8
	.xword	0x87c491f3dbd50210
	.xword	0xeb367d12fe019060
	.xword	0xd8bf44e47e2e8436
	.xword	0x3777f2d3286dce5f
	.xword	0x9e7f7cb7e6a360a9
	.xword	0x2bb4d1f6c64e5523
	.xword	0xb8c0ff7748dfae9d
	.xword	0xf29d192361169973
	.xword	0x9068b05103189ca5
	.xword	0x5423645398cc296e
	.xword	0xa04721f52457560d
	.xword	0x55cf3a85a7a189be
	.xword	0xd70f2e49d2bcf1c9
	.xword	0x2d7f7d9834c04c30
	.xword	0xf144efa7f59f09a0
	.xword	0x2b5443f9ae98234f
	.xword	0x40d117d35d95d098
	.xword	0x170dcde290879ac9
	.xword	0xdf8f22d6f934e0b1
	.xword	0xd81bff5b9715972d
	.xword	0xbc7482d84f86da9d
	.xword	0x8c084e0fccfc0ee9
	.xword	0xc9544416495c0388
	.xword	0xe442236bbd006b31
	.xword	0xd4a8d32203c00de7
	.xword	0x742a17926980ee78
	.xword	0xda61317fba18f353
	.xword	0x17c9cbbc49980326
	.xword	0x326190edc3a35738
	.xword	0x886112977ba07089
	.xword	0xc19749f9e65ea3b4
	.xword	0x6474131e8100d5d4
	.xword	0x7d32709d13e37b57
	.xword	0x7165082f040906aa
	.xword	0xeeb5b5a337b58593
	.xword	0x8640949f3f087dbf
	.xword	0x65a263d1494e4a3a
	.xword	0x809af918ac8143d3
	.xword	0xc47cc3ebe39495ce
	.xword	0x6192215a7ff8ed4a
	.xword	0xd18162bde5c1c502
	.xword	0xbcae8b494029cf24
	.xword	0x0824a024bef19814
	.xword	0xa7e669417c1a2aa6
	.xword	0x27407dd08f2420d9
	.xword	0xf2888ffb82e06797
	.xword	0x4d55ec910a9d6bce
	.xword	0x1ee2ec0bbe75b81a
	.xword	0x60b8c1846c60c5a9
	.xword	0x36b41b380025f3a7
	.xword	0xcf2a92424293bdb9
	.xword	0x2049fbecf2d3f80a
	.xword	0x59b37d5aa1c5e9b2
	.xword	0x91c20ba893908bee
	.xword	0x361538844eada21b
	.xword	0x20a711a5fc12cb88
	.xword	0x94c8d66302e87b4c
	.xword	0xedaf71827058e508
	.xword	0x6d632debe39741b2
	.xword	0xdf275e3fd221aecd
	.xword	0xf63af3c62f3cb2f6
	.xword	0x65952d90a99f3910
	.xword	0x54cc6359055159d6
	.xword	0x1feaba35539dbe77
	.xword	0x6b81524208947279
	.xword	0x09f2941144a18a6c
	.xword	0xd5dff98db7948f06
	.xword	0x9c71b0535d9c5fc1
	.xword	0x35cbfb94c711a941
	.xword	0xc9efa5b1de244690
	.xword	0xa7a20bd2ad6af5ea
	.xword	0x81eca6ce645000e7
	.xword	0x176f089feff69cc6
	.xword	0x60e06edb8c4f7468
	.xword	0x8ccac4be89274640
	.xword	0x990742596c15420b
	.xword	0x28bf4b9b3817e5f3
	.xword	0x329837949d7ee5b6
	.xword	0x71921ab8873e9e94
	.xword	0xd0aeeaeb958b7cbf
	.align 0x10000
	.data
data_start_4:

	.xword	0xd3e18c70cfb02812
	.xword	0xb799c8d474b835a5
	.xword	0x08213b2276b7673e
	.xword	0xb3871d34c03f73a1
	.xword	0x3ac389016aaa1309
	.xword	0x584dd1e0d2c764a6
	.xword	0xb96a6ef7851dc3cd
	.xword	0x7e24b1560ef553aa
	.xword	0x54031fb6e4fdf6b9
	.xword	0xd176aa654d2f05ac
	.xword	0x8393c04158e29a23
	.xword	0x539665237263e2e5
	.xword	0xdd813e524344b5bb
	.xword	0x88c1df2a01719398
	.xword	0x3e796b28a16d2deb
	.xword	0x8e0d5db45f8d83a1
	.xword	0x40bada49e140c213
	.xword	0xb0095f9ddda913ca
	.xword	0x7bf92937905fa115
	.xword	0xfff82528b31d3b3b
	.xword	0xf92809d236bbe984
	.xword	0x7a71fcebe8186342
	.xword	0x35368b0a9fe31717
	.xword	0x14a4df3240615982
	.xword	0x34f5fe5d49f85f35
	.xword	0x8342a7a7e40c6c8d
	.xword	0x7bbc871da2a8a140
	.xword	0x3bda7c62fc1f3465
	.xword	0xe2945de21c4f84df
	.xword	0x4a53ed3467d341e7
	.xword	0x27686ca94ee83d43
	.xword	0xfc24603961789284
	.xword	0xd5ef3ea6a8f7d5f7
	.xword	0x8f83a7c23e897a91
	.xword	0xd7b02608b6742359
	.xword	0x662f26fce3e8d755
	.xword	0x496b446da70df69c
	.xword	0x4f970ad9e5e68511
	.xword	0x67d0026c0ba4bd2e
	.xword	0x7358337d94d8ee1a
	.xword	0x5be1f9928aced989
	.xword	0x1b87f872cf50ad28
	.xword	0xe945ec3cc9f3aecc
	.xword	0x14d0652c7f5cf7e0
	.xword	0xbe69113ce0a113e3
	.xword	0xe9bbd0f38313095a
	.xword	0x503b42c8662e9998
	.xword	0x58db9990b1685d6e
	.xword	0x9c00da719b0a960d
	.xword	0xc0f0747f005b7b91
	.xword	0x817a391afce584a1
	.xword	0xf8adecff164e7847
	.xword	0x7fc5e8fd82674749
	.xword	0x4c84e333bec165ef
	.xword	0x5a2785e114518381
	.xword	0x21614d3a2ce764b0
	.xword	0x4b7940def9619333
	.xword	0xb0a3255f28c1d7f1
	.xword	0xfa05372f999bf438
	.xword	0xe2136781c6f5ea52
	.xword	0xdedb1c0abbcd556a
	.xword	0xadded0ff38212554
	.xword	0x04991405a4b0e348
	.xword	0xa30de233f0466e56
	.xword	0x026109c233b15309
	.xword	0xbd69b885ac81212b
	.xword	0xfb05b467b2088f5c
	.xword	0xa00379a2594a50c7
	.xword	0x80789c1005ddff82
	.xword	0x1b3581ed8e37e58d
	.xword	0xdc87a543447da6f9
	.xword	0x91ec9bb3518e9f32
	.xword	0x2524e669ae867b97
	.xword	0x1a52a15d69cda072
	.xword	0x17fdf0b77c1e979b
	.xword	0x21e4aeca66c9b9f5
	.xword	0x35b88e496871b43a
	.xword	0x9c1327ada0648ede
	.xword	0x93f6f6778136eb2c
	.xword	0x2be52ff8f6737bf4
	.xword	0x11d406b1f0bd601b
	.xword	0xf11f4a82504babd5
	.xword	0xccb22fcfc4ea1d5a
	.xword	0xad2db042668fe9a8
	.xword	0xb83eb3383b5834da
	.xword	0x7883c422447680f5
	.xword	0x21babdac5c65d729
	.xword	0x188c9f7cc026154a
	.xword	0x289c25c15cb5daaa
	.xword	0x3755446e679a5e0d
	.xword	0x811ce5eb55d6e640
	.xword	0xbe5e9a4a1d7b3262
	.xword	0xf95798561c7913ad
	.xword	0x48c06597ae692a94
	.xword	0x88ba4d8990205a73
	.xword	0x7cb8c49cba53fa46
	.xword	0xe593b63c6d474ee2
	.xword	0xc679ee5e383d6ae8
	.xword	0xd681d612d9a8cea8
	.xword	0x8e254b97bbc260a9
	.xword	0x835f4e4e6cb1b855
	.xword	0xf91e0e8a1caba1d7
	.xword	0xfdf5afab0ce05ac0
	.xword	0x620f995a9bee11da
	.xword	0xb13824043b75f617
	.xword	0x92f31fe7e6525e65
	.xword	0x698120ae17dd2e83
	.xword	0x0f459ab57f341c97
	.xword	0xda401d07391271d1
	.xword	0xb445d3c51310b003
	.xword	0xb60a181c435a60bf
	.xword	0x34bbdab76eeec96b
	.xword	0x3513dea8166e6784
	.xword	0x6532046a848013f9
	.xword	0xbbe2282b7d6c6c71
	.xword	0x413a8881afea4bef
	.xword	0xfa88e761e809eafd
	.xword	0x0aaa0f8f49809979
	.xword	0x24086fcdc52ca13d
	.xword	0x9c224881e2689b42
	.xword	0x0a8254a6034db051
	.xword	0xfa35459dda431808
	.xword	0xbe2abcb3b4eda3c3
	.xword	0x8c13d99c32952f21
	.xword	0x7ac644f68b9d4bac
	.xword	0x64e7547c2e72ca00
	.xword	0xe6d5cf2e60a6a847
	.xword	0x51098790cca05647
	.xword	0x7e9c89e070184f0a
	.xword	0xabd3dc920baaa297
	.xword	0x17f0ccf44af6d36f
	.xword	0x9f3aa45fddb9f9f8
	.xword	0x20c04e0576733517
	.xword	0xc8d0cb4e8faf664f
	.xword	0xa5073820847a556d
	.xword	0xbbb5b92f87f8562e
	.xword	0x450d1b3c4fbb3fa4
	.xword	0x29e9d3c273bc3a16
	.xword	0xe7b156b7141dce20
	.xword	0x014a0da1a16e255f
	.xword	0x74cc4586670c6f22
	.xword	0xe71a9a9619da67f0
	.xword	0x383c3e98e9b9e78f
	.xword	0xf55f8361e558ee8a
	.xword	0x6a9a1ab002667d46
	.xword	0xc0fb71fea19524d0
	.xword	0x79db896bffc837a4
	.xword	0x7588a9980fb532ee
	.xword	0x0335b245aa36ac64
	.xword	0x6ff13d9f35fa4030
	.xword	0x412c68192ddc8f10
	.xword	0x8a0f90368133eec4
	.xword	0x43df414b99983b8b
	.xword	0xa966253f0be7b7c8
	.xword	0x830e246d625a03ba
	.xword	0x8602e8d25d21ea8a
	.xword	0x4b3badf15fa9ef95
	.xword	0xb626f5294d7e936a
	.xword	0x4b9b79a5c239febc
	.xword	0xdffbcd6f7cdb58e2
	.xword	0xde7f644cd221c93b
	.xword	0x1f1084982d82b8b6
	.xword	0x7d651f716b591257
	.xword	0x239a58e4cd36c575
	.xword	0x559d3360e1df8bb9
	.xword	0x27d775dca1d441b7
	.xword	0x2745cebdba96747f
	.xword	0x48c2ca149a68edbc
	.xword	0x8f727e51bf6d7a7f
	.xword	0xfaaf2ecf2e144ee1
	.xword	0xfa8a33efddce3a61
	.xword	0x297543b1693174c4
	.xword	0x9ac343f990ff956b
	.xword	0x7b9c8e28f36ab5fe
	.xword	0x3ad935408d6a4229
	.xword	0x2b914604aa8275b5
	.xword	0x899c031ce727fbba
	.xword	0xe05943ef18ae2506
	.xword	0xd06cd01cb823046e
	.xword	0x96dae896b19700f4
	.xword	0xd309b3586468ad6b
	.xword	0x33131247e1a922a0
	.xword	0x450b0e5069a843d2
	.xword	0xb39a06c056785360
	.xword	0x6759b5a8d5c78a56
	.xword	0xe8ea90e45d848862
	.xword	0xaa6aae54f3927d19
	.xword	0x6e064171c593206b
	.xword	0x8f18c1e04bd198ed
	.xword	0x32a13f7cb41d0077
	.xword	0xa840f4c594d0e010
	.xword	0xf40ae020d6c019e4
	.xword	0x184c7ba4fbcb3515
	.xword	0xd8db1bb638cb00e4
	.xword	0x22d697529d6dabe9
	.xword	0xb2fc7709963d9e04
	.xword	0x83026f47b9fb15e6
	.xword	0x8dc00738a6020209
	.xword	0x92485a325783bf94
	.xword	0xf8836ac9e03411ff
	.xword	0x9ffed16f3e17c821
	.xword	0xfb10ff9e48fdd399
	.xword	0x3d1d280c1c7e09b9
	.xword	0x56ec46338caa3e13
	.xword	0x77f98a93a3d4cc8b
	.xword	0x01c2a8983ceb9501
	.xword	0x3c909b3f86b71e89
	.xword	0x59ae160f0e785a1a
	.xword	0xfb2fa94372903b00
	.xword	0xb2c44d9458e9e47e
	.xword	0x78058be180bae21c
	.xword	0xc226332b76018c9e
	.xword	0x8594cfba43ee1255
	.xword	0x774b0830ab725616
	.xword	0x132e2bbb37c1520d
	.xword	0x693d763f2b63bbe5
	.xword	0xd8678931816cec67
	.xword	0x5b62c0db1fe811f9
	.xword	0x5ba8a5a58b7d430e
	.xword	0x06f70edb2e85a949
	.xword	0x6939c67627a07488
	.xword	0xda9a64f2fc9a7777
	.xword	0x51b9d9ea442af9e7
	.xword	0xe13fa45d7ba20a3a
	.xword	0x9f00ff058982a0ba
	.xword	0xb3081ec63fa8b0b7
	.xword	0x875d46b8dd26fafa
	.xword	0xc250dada77ad8fc9
	.xword	0x926723494976f9da
	.xword	0x45cc1381fdc472b1
	.xword	0x0ab1c10def78645a
	.xword	0x4cd194dddddabaa2
	.xword	0x94560bf3559d2a8c
	.xword	0x8922c53399fc8394
	.xword	0x26690d6546acce88
	.xword	0x97bab89927a22a34
	.xword	0x9f7b3e40c26e21cd
	.xword	0xa79f9f34e7c78188
	.xword	0x6b4b142a752cbaa8
	.xword	0xe632b27a89a628db
	.xword	0x52f86cd5f1351533
	.xword	0x3e31822efe1ceb2e
	.xword	0x809eefb0144283b9
	.xword	0xfa68ad946fd454f3
	.xword	0x2c7d43d653509352
	.xword	0x67736aeae898468c
	.xword	0x777fb330e0862e45
	.xword	0xf20dacb1a1e3eb77
	.xword	0x175b0fc6c3e10f29
	.xword	0x517a31a209bb864c
	.xword	0x95b0db3672bdee62
	.xword	0x7d9d156b443e794e
	.xword	0x12a8b6c4eae4d07f
	.xword	0x647b0b0704aeb565
	.xword	0x4f91b7864ef513ce
	.xword	0x332ecdb8a7c6404a
	.align 0x20000
	.data
data_start_5:

	.xword	0x43d10434930153be
	.xword	0x5775c77112cbe161
	.xword	0x824ed1d843e8db2f
	.xword	0x69bac71badfcecca
	.xword	0x80eee3789ec7d6d6
	.xword	0x7c6d431743ed2b78
	.xword	0x331fb55c35571279
	.xword	0xf41aeb520f69d59c
	.xword	0xae3d7f95b2b3e38d
	.xword	0x8c891e75b1852b13
	.xword	0x8a7c7a142b13af4a
	.xword	0xed43f5c35d77ecab
	.xword	0x425b4283a535fd95
	.xword	0x77642ac09b1c8cfd
	.xword	0xa830a9cac239a05b
	.xword	0xb73849b3583f2f1f
	.xword	0x88d5cf80d9b48260
	.xword	0x6f4c1d30f4f818f9
	.xword	0x90280f899303686d
	.xword	0x8ab35166c0ba67fb
	.xword	0xd9344f5b525d6ba8
	.xword	0xb9df1e3547ddafa6
	.xword	0x425f3ae9782e56b2
	.xword	0x94a9436387dd20d0
	.xword	0xcafca89a76f3f014
	.xword	0xe8f011acf5f9ff02
	.xword	0xc667513ba0e64d4e
	.xword	0x8d40c15444cb6711
	.xword	0xbec46638096ed548
	.xword	0x7228c495d6add35a
	.xword	0x1c1580f334463131
	.xword	0x68664a7e8d184bee
	.xword	0x27399a4d2f96a7a4
	.xword	0xc6a6bb07a784cffe
	.xword	0xb7ec0e0ee29ad096
	.xword	0xfacc41005742800e
	.xword	0xbc9a2276ecbbc1f8
	.xword	0xe483ae3112801825
	.xword	0x9b5a7575ad91a0fc
	.xword	0x33e0ed60e7d11a40
	.xword	0x99e362faa9a5b86f
	.xword	0xc231fa46f1abd6dd
	.xword	0x1de37283fa0f9cf0
	.xword	0x5bfd9ed5a7b865a4
	.xword	0x684132a40b65c90c
	.xword	0xd520800af0dd56f3
	.xword	0x15958ea93460e865
	.xword	0xf6faf1def7dc0ad7
	.xword	0x880dbdf4b319e79a
	.xword	0x5681a8a9261d8898
	.xword	0xa66ae0c56cd6092c
	.xword	0x7dff7a219fac6a61
	.xword	0x067dba6c8c4ac03f
	.xword	0x39a4e6b10330cef6
	.xword	0x9f9971c4713c3b08
	.xword	0x91a53e49ecf82f13
	.xword	0x00c5ff68d6deb0e5
	.xword	0xb9ec68b88106cf3a
	.xword	0x4030b66f89914f1d
	.xword	0x215a0ecacee54c70
	.xword	0x925c3e23acd983dc
	.xword	0xf6a39b66c2b80adf
	.xword	0x56e208cb0f92d66d
	.xword	0xf557237768e5da3e
	.xword	0xda14caf6324bdc1a
	.xword	0xe8b6185afc3e552b
	.xword	0xc0a113d343827738
	.xword	0x2286291b176f2139
	.xword	0x2aa763fefb3efa32
	.xword	0x90dae20fcfa05e5f
	.xword	0x44f9e28833ace661
	.xword	0xff3a6c319ba20389
	.xword	0xc96b5fa5ef422358
	.xword	0x87e243cda9418785
	.xword	0x8752e72a150846f9
	.xword	0xda909050343f185a
	.xword	0x1dc889e33257dec4
	.xword	0x53f69ea73e9ab061
	.xword	0x340289cb553b9cc8
	.xword	0x24b14045c171e2a5
	.xword	0x62684c92061b50dc
	.xword	0x2b78b9e25a7e31c3
	.xword	0x3fccd00b7a43dcf2
	.xword	0x1e4a65b193efe412
	.xword	0x5e163060d957b658
	.xword	0x54f07a025092c1cc
	.xword	0x572defed1cf6fd38
	.xword	0x0c9604d00471a267
	.xword	0x947f5956a15a7e8a
	.xword	0xae5499a9119213af
	.xword	0xe864637b05a3a317
	.xword	0x750de3b8e5f64b6d
	.xword	0x24bb8b0c86b22bdc
	.xword	0x5d4fee06bf524dd0
	.xword	0xc1081c323a5f5a58
	.xword	0xccb24bbb8373a6ce
	.xword	0xeb516864633e427f
	.xword	0xf6e833015ddb3afd
	.xword	0x09bb07231dc5c877
	.xword	0xe28f3e9794fc33c2
	.xword	0xb1c50a428b3c33b3
	.xword	0xab23fcb9617b3f66
	.xword	0x1ff9a9df1229f2ed
	.xword	0x6e795624ca21a5fd
	.xword	0xc30e8aeb11665808
	.xword	0x763f3ec24676cc93
	.xword	0xe2d148bd1bbd18b5
	.xword	0xcf83304768e5e970
	.xword	0x9164d91ed95cbd6d
	.xword	0x0186a0edc649f0cb
	.xword	0x1e3ae335a98ee5a4
	.xword	0x00d197c268be1a0a
	.xword	0x7d8bdd893d24855c
	.xword	0x786634e720f9b93b
	.xword	0xd31b793486463e9f
	.xword	0x67298f06ac7d740a
	.xword	0xe741b6dd814124ce
	.xword	0x1451a80370e4ae9e
	.xword	0x5cf4d3a81b374c8b
	.xword	0x9e205feb8b340dfa
	.xword	0xdaf1d89da6e75845
	.xword	0x3e6bf4edbba547f9
	.xword	0x8fdf8cf6a3f16eb7
	.xword	0x7e9b5ecbcd4e67ba
	.xword	0x951816330157b861
	.xword	0x0a0b697b108b8162
	.xword	0xd336d3c61dd2cc3c
	.xword	0x3eb0ae6353d88415
	.xword	0x2e61eaf022e774c8
	.xword	0xb305590ef1959445
	.xword	0x858c4b2d403cd38e
	.xword	0x694d9ba1ec43b381
	.xword	0x98cb431d7b78412f
	.xword	0xc39607cd15cc21f8
	.xword	0x173875eea7a16a7c
	.xword	0x35ca8b4e818435a9
	.xword	0x49630ef6a3f1a8c8
	.xword	0x2077cd3c64dc9d00
	.xword	0xde902679d5992b10
	.xword	0x6069b5da93ae32b3
	.xword	0x810c2623ee422ff0
	.xword	0x2911fca129def6eb
	.xword	0xd7d83f45d970921f
	.xword	0xc17a602616fc1082
	.xword	0xb0fdc5e1afa3925a
	.xword	0xc26ac6e0311d5d74
	.xword	0xd4c9b25504d1738b
	.xword	0xdb95548e29464ce3
	.xword	0xff3ad54f22536a89
	.xword	0xd1f9aa68b6cd7835
	.xword	0x4352d092f51366fa
	.xword	0x1091d79b5c885d1b
	.xword	0x68303e3fb7849497
	.xword	0xe5d9295c4bac7239
	.xword	0x4efc32bf01b36df0
	.xword	0xb511ce0a35598ef2
	.xword	0x68a4ab0e29c99899
	.xword	0xaeeed4e0a8a7e783
	.xword	0x836e3fb568cce8b7
	.xword	0x83cc92dbfaa7e3b5
	.xword	0x6f7493d4e12998f4
	.xword	0x5e294a915c4936cd
	.xword	0xfd2a6ef12a7cdf5c
	.xword	0x30ac5cc2945c6aab
	.xword	0xf89702cb48ac950f
	.xword	0x701b625cd408dc64
	.xword	0x33a50d8387ec2a39
	.xword	0x2b1313cd93e17f8f
	.xword	0xd75a54f6c190d11c
	.xword	0xa5a891bf095168c7
	.xword	0x2e46ebe2dc79aed7
	.xword	0xa7b9a8fe092d8db8
	.xword	0x3155441ba61bcb0f
	.xword	0x0b24687d8a1b0622
	.xword	0x21c6bded1336a7d4
	.xword	0xdd73fec92bc9ac4e
	.xword	0x162f287ffce454e7
	.xword	0x5b4f6012e2a57ed0
	.xword	0xed913e591cc9f89e
	.xword	0x6e5718a045e87b45
	.xword	0xc9be47672a1ad26a
	.xword	0xfe6440be1d49da7c
	.xword	0x97cdba3a30cb0b35
	.xword	0xef800fbe3e44c75b
	.xword	0xf5139e4791ef1e60
	.xword	0x3383e67b4efcde84
	.xword	0x86212d9139916a73
	.xword	0x2a7236b0ec219062
	.xword	0x88918817cd417a80
	.xword	0x95e5d9217e368c7e
	.xword	0x8352d4d770830a9c
	.xword	0x4e2c2e8fab7ee12c
	.xword	0xa815d7cc30f5c9ff
	.xword	0x3375630bbbbd01e1
	.xword	0x0ec98d9b4f851b42
	.xword	0xeacaf7faa48a3d71
	.xword	0xb5b5c8148f170ac7
	.xword	0xfc9aad2035aa7f7b
	.xword	0xcf8db809859849a1
	.xword	0x049b29a05f88c314
	.xword	0x2addf3deabcb4f33
	.xword	0xd54e1e4b49d00660
	.xword	0x70d5e5f376c1a1cd
	.xword	0x51e917097b8e26ce
	.xword	0x28449e344a6b620e
	.xword	0x0a248ba96e1c9f06
	.xword	0xfe7f91ae16fe9e4a
	.xword	0xca431dbff7a69ef2
	.xword	0xf85afd84405d4844
	.xword	0xc43a3b23602d76c3
	.xword	0x7f2eb6971d9e90a6
	.xword	0xfca23f1b57bdbd01
	.xword	0x4d92f6ab0d7e9bbf
	.xword	0xdbf63c5cea4c6127
	.xword	0x63e39e05dc9a90b0
	.xword	0x99b113ce29d4d897
	.xword	0xac1ec81ab42f640f
	.xword	0xf067f089d3cbc1d1
	.xword	0x30919f28a0de7ffe
	.xword	0x127df219f7a2f047
	.xword	0x8baeba794738ce8f
	.xword	0x487758ed6bf5aa43
	.xword	0x2eb4a04ca4846547
	.xword	0x165685bb83b6764e
	.xword	0xa627a3ca52447908
	.xword	0x1057a1f14fe1a386
	.xword	0xd512be9dca89d9c4
	.xword	0x91720750adc24b5b
	.xword	0xfb91a3f497115c96
	.xword	0x6195afc31fe58db2
	.xword	0xb0b0dd23f6de0564
	.xword	0x8bbaa7c18abdf84f
	.xword	0xe3abbdb0ee9cfe1c
	.xword	0x0eb9637080ee665b
	.xword	0x26b570defca3e311
	.xword	0x7d7e81e7e53ec605
	.xword	0x1e209ecfd43bfb8a
	.xword	0x0d5c6326b9f43ebe
	.xword	0xbbb8bee067401a36
	.xword	0x346e9bcc5bd2e75b
	.xword	0x9f9129afc71b2b1c
	.xword	0x7cce152e22d852c3
	.xword	0x41597bf5907bae75
	.xword	0xb6cd7dfb23fa55ff
	.xword	0xa2a0a229c1b648e5
	.xword	0xd53d040ff033b832
	.xword	0x7e05b6f3979ae01c
	.xword	0x1fbafc3bebfec768
	.xword	0x1f61bfb2ac8a87fe
	.xword	0xfa0db0342a084ea6
	.xword	0xaa04c8f2d1caded4
	.xword	0xbcad4fbdc7fa6979
	.xword	0xbc4a82a9606ad7c4
	.xword	0x50d2e315113fbb75
	.xword	0x5ebcd2987723942d
	.xword	0xb36ca7a405f3dc56
	.align 0x40000
	.data
data_start_6:

	.xword	0x62d583bf456f1c98
	.xword	0xbfd497ddfd699955
	.xword	0xd89b94891462a3b1
	.xword	0x79bb3cb412fc78c6
	.xword	0x928baf6c9d3a1f07
	.xword	0x85f6ab90e9847241
	.xword	0x6d87d192674bde64
	.xword	0x164f2c8aaa956618
	.xword	0x601ecd4c35936070
	.xword	0xa14af6d88eeac811
	.xword	0xa5277e4d1919cf45
	.xword	0xe9ec618ce4853009
	.xword	0x0e4ef9ebe944b087
	.xword	0xdd0fc75b456ae5e1
	.xword	0x2d21ab823f9ae30e
	.xword	0xfe5799564f44193d
	.xword	0xf9d8379cf3f30010
	.xword	0xbba85f89a3b6ecc0
	.xword	0x13c36b3bf8febfbd
	.xword	0x64dc9556700d61c4
	.xword	0xe570ae4a07ad7b10
	.xword	0x2550d8b514867ec1
	.xword	0x81032c81d95b3fca
	.xword	0xe57c3e32532a8f50
	.xword	0x118f932beadefd6b
	.xword	0x5a977dec81fe9d45
	.xword	0xc8c1863fea07f6a9
	.xword	0xd485d6710a06606e
	.xword	0x0fa16bb2459df208
	.xword	0xc3ed1c78061b596d
	.xword	0x93e67e18aaafebec
	.xword	0x7963062e44ce5d4a
	.xword	0x21eba93f5df6a579
	.xword	0x53cb1d64c309391e
	.xword	0x38d0d134477f423f
	.xword	0xc2d8cb0816e35167
	.xword	0x69914a4ea9110013
	.xword	0xd6bdd3babd58e392
	.xword	0x70ef80c63f3d3afb
	.xword	0x0cd9645ec26870a4
	.xword	0xc7dcc14235f0d9e4
	.xword	0xa95dcf8e61ddf317
	.xword	0xfc6fa5e406186a97
	.xword	0xbccaa22456620557
	.xword	0xa553439b8fdb47b8
	.xword	0x13beb8dff770e3f8
	.xword	0x72ebd2faac9f1ae8
	.xword	0xf39f6180612f6421
	.xword	0xccbce865691a7131
	.xword	0x487d2c9b84b3bed0
	.xword	0x37ada167fb73a739
	.xword	0xed5d26b0f27e0905
	.xword	0x01e4b900342da207
	.xword	0x1b57d58f5b03d091
	.xword	0x7b3ebe8a92574c89
	.xword	0xf848c1cf1088fda9
	.xword	0x122c8840d8ac2a09
	.xword	0x6880ded9aef71565
	.xword	0x0ef6a9f3b205a5e8
	.xword	0x2c58ddc32877ff95
	.xword	0x61cb749e673a259b
	.xword	0xadd5484b6136faa9
	.xword	0x59cf0cf377031598
	.xword	0x30e0571c5cda61c8
	.xword	0xc7726abd702dabc2
	.xword	0xca1dfce78ce64fac
	.xword	0x60732d443c67c747
	.xword	0x856c5cb6560873e6
	.xword	0xaff43de6ed72f1a4
	.xword	0xbac64ea693898121
	.xword	0x9c45b0a1078d5c08
	.xword	0xa7622b57f01d4076
	.xword	0xb796b3086c70f30a
	.xword	0x8949ff02ccb7901e
	.xword	0x347dca80d926c836
	.xword	0x55a9b4965f511de7
	.xword	0x08b24190e4af16f8
	.xword	0x0f0262347469862f
	.xword	0x854d330ccd35e40f
	.xword	0xe483d04eaf0d90c8
	.xword	0x0566fc1fd0cba18b
	.xword	0x0fafb82cbd009fe1
	.xword	0x20c4510dbc9fe052
	.xword	0xe07627a12665d90b
	.xword	0x00087298c9a63324
	.xword	0x803553f21281a445
	.xword	0xd34f9c510b98a83a
	.xword	0x3dc32e70a5c97370
	.xword	0x2dc28fe802c30573
	.xword	0x6b55238b05ed5d28
	.xword	0xb0d145d09aa5e003
	.xword	0xc113d2be3aabfe07
	.xword	0xcd5aee3b3ab2a1fe
	.xword	0x88f392d7c2e34b8d
	.xword	0xe1616d712fec1f15
	.xword	0xea3be587a23e01cb
	.xword	0x40befbba424a7240
	.xword	0xbb6c4b45cabeaaab
	.xword	0xec300f98cee153c6
	.xword	0x75ee0c6a09268aab
	.xword	0x4aa49607eb8f93b9
	.xword	0x93c9c8bfeed77642
	.xword	0x2bb78f24aed923a6
	.xword	0xf8bf0f8400637bf3
	.xword	0x1c882dc5dfbad2fd
	.xword	0x58183a3aa0d0baa1
	.xword	0xd989cea3e1a2673b
	.xword	0x196ba0440adcc637
	.xword	0xd65e78c3e4548089
	.xword	0x13c4540d27804348
	.xword	0xe88431a6cb7ba5b9
	.xword	0xa973233838ce9d64
	.xword	0xbfe60639493af401
	.xword	0x8bfde19d914d67d6
	.xword	0x99a336112af6addb
	.xword	0x5511689fcb854b20
	.xword	0xc60e12d88a3405bb
	.xword	0x53f5f9d5019bec98
	.xword	0xf58c9b60c295b800
	.xword	0x2c9c8fa4f84e8e05
	.xword	0x9bd02c68c6e5e2e2
	.xword	0xe35a5c150122b85b
	.xword	0x5dca6e80c97620db
	.xword	0x3c5f6bb41cf50ab4
	.xword	0x2cc379b0e2a7fc88
	.xword	0xa4d2876e9bb30f10
	.xword	0x34bd8a1255e1bc33
	.xword	0xa840e4f4859d681d
	.xword	0x30c68691c20b8b9a
	.xword	0x0f7d4f93460dcbb9
	.xword	0xe1440857a00bf8f3
	.xword	0x861fc3155938aa9b
	.xword	0x3bea6b3e89f94db9
	.xword	0x9b914ae7d1ae37ae
	.xword	0x096d6101ce33c821
	.xword	0xbf73c74cfd7bf59d
	.xword	0xcd696b3c592338e9
	.xword	0x0b1b7c41f13deb37
	.xword	0x34afb02c427e8429
	.xword	0x9b6e48da38ffef8a
	.xword	0x6c2fab03d5ce0c4c
	.xword	0xeadf0ac2b226e30a
	.xword	0x91bfb82a78f6605d
	.xword	0xc3bc60220b44a2fd
	.xword	0x14bc1e045d333c49
	.xword	0x5a18d38662472419
	.xword	0x9ed5b6fa0e45fab0
	.xword	0x62411f5a906d4f02
	.xword	0x2f579e4912e688d6
	.xword	0xe57aa5e0051adc48
	.xword	0x300a4fad23b0803e
	.xword	0xfd102f744374f59c
	.xword	0x8fb81b1d2ce1c1ee
	.xword	0xa9f50a250b62e121
	.xword	0x20e0eebd97414631
	.xword	0x423f7b7ffb07e5d8
	.xword	0x03d88e31394f2904
	.xword	0x3bdfc80d692c350e
	.xword	0xf715361b2327af4a
	.xword	0x8237024c62ba246b
	.xword	0xc4625c8f61ba2dae
	.xword	0x29634f39a9a654bf
	.xword	0x01c91d8966cf14ea
	.xword	0x1ed7737ea0255645
	.xword	0x1262223b6b2f9819
	.xword	0x0aafc5d588d66205
	.xword	0xbf05d138f6be644d
	.xword	0x97f3c3c5796cb9ce
	.xword	0x65c94da447727350
	.xword	0x0cf9a8b90bf60f92
	.xword	0x3f69096b87e76dbb
	.xword	0x2e35d1714782e18c
	.xword	0x3f9c9665317a8b39
	.xword	0xaed595856dd89cfb
	.xword	0x9d1c4d21d99a1e08
	.xword	0xf677593b2ff9a992
	.xword	0x019e490d12c82010
	.xword	0xe25aeb0776480e39
	.xword	0xde38165b2dc29519
	.xword	0x5f01e33b380b9eb9
	.xword	0x14ea5a16110f73e3
	.xword	0xf4fda7ced8b6e78a
	.xword	0xbcb7ffb19f0fcbe3
	.xword	0x938bdbfafbbd92cd
	.xword	0x550ff600718b602b
	.xword	0xda0f347216f98edd
	.xword	0x39a45a7312df6bf3
	.xword	0xbbd31351d701a75f
	.xword	0xa1bf13d925722b3d
	.xword	0xa6d63222a2f6998e
	.xword	0xea2a548cc89c7657
	.xword	0x04f839da18d65de8
	.xword	0x2754511b9c552636
	.xword	0x4e504afa79892b77
	.xword	0x3fa2ad27b68c810a
	.xword	0x10b81d45f4bfc963
	.xword	0x8efc5ad5279b49cb
	.xword	0x8d007a33314f0831
	.xword	0xc0813aabeaf5f4aa
	.xword	0x28f5de7374ccb95c
	.xword	0x658ae3db9d4bc088
	.xword	0x9d16b8adf057db1d
	.xword	0x894b50ce05c96502
	.xword	0xcd8c75017c547460
	.xword	0xa16ba605e6147890
	.xword	0x22d1464ee8d59fc7
	.xword	0xffe8fa54805ba521
	.xword	0x2b5006bb8ce0236d
	.xword	0xab23536100a0145d
	.xword	0x21aee306dd0672f0
	.xword	0x1827f3779f73999c
	.xword	0x97a9174748965e5f
	.xword	0xc4d2c4ce79f56d8f
	.xword	0x3d3f8e6b1027538e
	.xword	0x33393bb5813fc439
	.xword	0x6cd78415ac533bca
	.xword	0x9d6efc19a676985a
	.xword	0x68374789e196167b
	.xword	0x71532ee65041ffa2
	.xword	0xe84d44adeab98f53
	.xword	0xb05517e0e9856fed
	.xword	0x18fce5ba6f129e91
	.xword	0x87a8b1c9e88528cc
	.xword	0x41a897a2b22622b7
	.xword	0xf79f8c5c5f85cb92
	.xword	0x2ca2db93e25a6f22
	.xword	0x24436ed486e3c934
	.xword	0x8b01bdedfd880f5b
	.xword	0x8f53cbc667323b61
	.xword	0xe5e690285ae9a6d2
	.xword	0x4a71fcfa7eec3f7d
	.xword	0x84592623b86dfa97
	.xword	0xcf122ab3de1e986f
	.xword	0x67e87e2296802dcb
	.xword	0xd250afc794004e5f
	.xword	0xc19658b1bf956251
	.xword	0x98753b4b53d6deeb
	.xword	0x9ddaa1d916298141
	.xword	0x57b09eb46d4ff7b0
	.xword	0x33ae9daf3f99d619
	.xword	0xbddf5c5ddfd8e52c
	.xword	0xb5cde7b2161ed595
	.xword	0x74de1824b138f1f3
	.xword	0xbc46079b72719d33
	.xword	0x66c94304550dcd03
	.xword	0xdd22cf5357c63aee
	.xword	0x5f70e4de38078841
	.xword	0xaf0e90f5f48c2e0d
	.xword	0x2fc470fa36c8c4a6
	.xword	0xfe354f5530cc5e81
	.xword	0x2cc33220a7acc135
	.xword	0x1f906d5009533224
	.xword	0x194d4b13a6f947b3
	.xword	0xbb435510083fa1af
	.xword	0xf14542a257d24041
	.xword	0x3b6d8fd7680a0335
	.align 0x80000
	.data
data_start_7:

	.xword	0x7fbeb8304d82fb58
	.xword	0xa60bbcb533ed31e4
	.xword	0xf519c37454cf9c92
	.xword	0xdf8bf361c2ac0dfa
	.xword	0x30f6b184cdb99b57
	.xword	0x55390c201de96720
	.xword	0x73fb86d48359566e
	.xword	0xde5b99ae935cf0f1
	.xword	0x5d54eb4c76654142
	.xword	0xbda6f9a60eb2f343
	.xword	0x790cfbe989100cc4
	.xword	0x90d5b4eea0e33232
	.xword	0x038774c5ef5b18ad
	.xword	0xa8e4e97746d4d864
	.xword	0x2fa403a152a64c46
	.xword	0x026fedbf2e20d93f
	.xword	0xb9676034ed8fc55d
	.xword	0x5e96a55447cec3be
	.xword	0xeb46ed51271de56b
	.xword	0x92a7c12105aff1e7
	.xword	0x9a619672f5789f2d
	.xword	0xba7397fdd8e320bc
	.xword	0x80d152f0b603c9a9
	.xword	0xabcbb60673874590
	.xword	0x6470d1a73794d3a3
	.xword	0x90a6dae4ca40b7ee
	.xword	0xae8ca99ef75478c4
	.xword	0x752ae8f36e0e8a1f
	.xword	0x82b4dc7ebb9e5891
	.xword	0x569862c7dd752d70
	.xword	0x4c1d9d6b9b402bb1
	.xword	0x8fbbbd49ce4095c3
	.xword	0xe3d504cd90dcf287
	.xword	0x070fecdd1432d95f
	.xword	0xb63d39b7db074707
	.xword	0x057276470dcaed18
	.xword	0x84eb319d7c7a0a4e
	.xword	0xd40ae38da083d35b
	.xword	0x47ed2464949368c4
	.xword	0xb05db5a376d98b5e
	.xword	0x90a241e86f98e87e
	.xword	0x835225c57e519fd5
	.xword	0x6ce9b936813e5c2e
	.xword	0x9dcae29237b321eb
	.xword	0x69d9d74dc4c85269
	.xword	0xef496f5c37cd0244
	.xword	0x2f323e905c2db8a6
	.xword	0x60ec7ae9eeda3394
	.xword	0x06a332bd74a2ce8c
	.xword	0xa46a5a0654b42463
	.xword	0xd2cb957af8fe874b
	.xword	0x8d8d756601877dd2
	.xword	0x7638bd1359ab3a1a
	.xword	0x33131efd86b1d9ad
	.xword	0x363d37504eb7bfde
	.xword	0x4bc1c38e888618d0
	.xword	0xd67d96854da2db74
	.xword	0xaa11d2c20c5280ee
	.xword	0x1fb14fd7b8470cac
	.xword	0x2404413c2c6c9bde
	.xword	0x8c5a043b0285837f
	.xword	0x2a4f76659f11807f
	.xword	0xe45700df2b57ea11
	.xword	0xbe6a606c31942701
	.xword	0x522b56dba3309b21
	.xword	0xe9deb0328825dab7
	.xword	0x2cdeecf65f8d3813
	.xword	0x5829bbbd6cf2eb17
	.xword	0xdaef9fd10dbb24dd
	.xword	0x4b3a81dc6a7d47ef
	.xword	0x33a21b3b0c47dded
	.xword	0x99d07f5cef35af34
	.xword	0xc58236d418e6c7c3
	.xword	0x63326ef1f6c6c0a8
	.xword	0x00aef9a69ba54c77
	.xword	0xf5e3a496f55b8be6
	.xword	0x0a61f3e98e847971
	.xword	0x0a31e489423bf6cc
	.xword	0x7c74d764c3968e13
	.xword	0xf43ccf4fe1d0003d
	.xword	0xdca8f90c8a0c700b
	.xword	0x90e422caefaa1585
	.xword	0xc353f8acacd7110f
	.xword	0x5cd650901e9ebf94
	.xword	0x41844a05f024bd7f
	.xword	0x9e4f2b591a49d121
	.xword	0xe50e692737972ce9
	.xword	0xdc6816449009fe30
	.xword	0xef43a22404cc219d
	.xword	0xc9370fff449ca276
	.xword	0x8ece727bcaf26367
	.xword	0xd4be8a6484ad2382
	.xword	0x7d7aad46319f9c4d
	.xword	0x0b81406ad1544a66
	.xword	0xcc2026397b349ffa
	.xword	0x62c3d92011e70831
	.xword	0x0745fb860c582633
	.xword	0x0c75b94a29143ed8
	.xword	0xd94b63499373469b
	.xword	0xa323bacc8a8ff352
	.xword	0x28a1f2af9a1337ff
	.xword	0x8b6722c0919ffd04
	.xword	0x3f490247ab05bd9f
	.xword	0xa22d46d05b6e2a36
	.xword	0x2c19156b25129f81
	.xword	0x28f905a1e98070d4
	.xword	0x7fe8a358a8b9014b
	.xword	0x655c6e8ac81b2a96
	.xword	0xe879df9f0a036793
	.xword	0xa25c51b47d5c9c23
	.xword	0x7b6a37e84e144bad
	.xword	0xf8ed6fb8c0c90af8
	.xword	0xce0b19972bb38991
	.xword	0xea7b9aad14943362
	.xword	0xd6eebe15a021d4b5
	.xword	0x824b85819bad824f
	.xword	0xe8992f81fb7e7cc3
	.xword	0x1676a9da265a1f42
	.xword	0x008acddd8329b20d
	.xword	0x145b0d0ee3e31996
	.xword	0xff2fcdde63278d67
	.xword	0x020acae3e8d46df1
	.xword	0xfb974764fd5a3e02
	.xword	0xe8af9c76ba6c5424
	.xword	0x9a446b62c928ae69
	.xword	0x4c12e04cd6dccd68
	.xword	0xb205a27b42185c76
	.xword	0x9c7fe40add7a3e01
	.xword	0xcc619c51c965ddfa
	.xword	0xc4b6338906d524a0
	.xword	0xf63d543b46701f3a
	.xword	0xfd0394f923150ac0
	.xword	0xc0685dbe904dc35a
	.xword	0xb7bb62de54053aba
	.xword	0xe9d4a6ee22df1898
	.xword	0x75b65a3cfec37dc7
	.xword	0x64bf9d4a91026285
	.xword	0x3e5857dd2e73c8e1
	.xword	0x74662faea68ed234
	.xword	0x8472af18bb8ec7fc
	.xword	0x961175aaf3064caf
	.xword	0xd3e80e1af2bc7b5d
	.xword	0x6b26e01d7293d811
	.xword	0xa49185310e76c55f
	.xword	0x22560290442faaaa
	.xword	0xd063304d5140e3ae
	.xword	0x5e3608be410cb485
	.xword	0x7339c00327a52157
	.xword	0x9716e62d606cf4f2
	.xword	0xecee0dca2020e763
	.xword	0x019f716a6603d5c7
	.xword	0x1b0a5b251b5bd6e5
	.xword	0xdbcefce1a2322f29
	.xword	0x6880dfe6c35b7cba
	.xword	0x269bb376dd8d3547
	.xword	0x5ddec531ee3eeadb
	.xword	0xe1e9347248d91d36
	.xword	0x626948f7a009aee9
	.xword	0x4885ef7274ba9597
	.xword	0x06408af5c6690d35
	.xword	0xf8810a1f79d13410
	.xword	0xc0e993cc938329dc
	.xword	0x865b8dc869a34243
	.xword	0x7587b463bd4fcf32
	.xword	0x7daf1fe3902a777d
	.xword	0xbaae954d90007784
	.xword	0x8bd5c492dda415b0
	.xword	0x2a5a8c7d631873a3
	.xword	0xb97aa83030b21263
	.xword	0x3072da7ee7ea5b44
	.xword	0x492eafd4a2aaa673
	.xword	0x1d582251134cb742
	.xword	0x49c3d60f51410459
	.xword	0x135de9ac9dd7096e
	.xword	0x72866d7832be95bd
	.xword	0xceb2dc797533ba0d
	.xword	0xce6a771217fffd38
	.xword	0x82165006a99e076f
	.xword	0x4ab11d52b06ee345
	.xword	0x46d8cb1516efd62e
	.xword	0xc3fefb111c1d1c61
	.xword	0x34b44f580346ea19
	.xword	0x79c09ef5208aa803
	.xword	0xca2db06f2bd733dd
	.xword	0x613de4d759328d8c
	.xword	0x49b9fa9a9fb650f6
	.xword	0x3c3051104d45c566
	.xword	0xc0b5d357bb02a3d8
	.xword	0x8516e8d468da1912
	.xword	0xefe6fb6245966227
	.xword	0x2900de83280ba008
	.xword	0xc078597f359ec690
	.xword	0x481dbd316ec51525
	.xword	0xe13f273d9673fe57
	.xword	0xa4672a02a71cdcf8
	.xword	0x76448dc8c5edec35
	.xword	0x41f74b11b2e08da3
	.xword	0x3008f4728f11f69a
	.xword	0xd31fb33605029a93
	.xword	0x93e9a0327a21b536
	.xword	0x82d6fb7cf33dbf7c
	.xword	0x7c0558e5909c0607
	.xword	0xd2bab1b3ff4aa3fe
	.xword	0x4d63eb121c637606
	.xword	0x588318391ae88f3e
	.xword	0x227458d708158e22
	.xword	0xbc498aae5f23f180
	.xword	0xe6d16c105b2db704
	.xword	0xb0e04e29c77d04b0
	.xword	0xf9116281e895fb40
	.xword	0x94c5b6f4272c2926
	.xword	0x8afd4ac8ec8b3500
	.xword	0x16cffd9a8b93ace5
	.xword	0x81353fdd7265bbfb
	.xword	0x29633c9c8c9153f8
	.xword	0xc3add60a7d2fb215
	.xword	0xa7de2d709d3e526f
	.xword	0x6a18d41ac7439b44
	.xword	0x993db66eb213abaf
	.xword	0x1a82f947ccf34aa4
	.xword	0xe90d7282e0f63fe0
	.xword	0xf4adcbe259ac4036
	.xword	0x5c1013fce0814c4f
	.xword	0xde183b0d5cb0939c
	.xword	0xc1c7e49d2b7687ef
	.xword	0x1a7628aafd03acc2
	.xword	0xf48684994adb3c4f
	.xword	0x9d586cc43fb19b39
	.xword	0xff3ddadaac22afb9
	.xword	0xdf17c826be71d021
	.xword	0x1e3ad581dbbc28e2
	.xword	0x90e51b6b55e5b376
	.xword	0x25d0e712684d009d
	.xword	0xd2b2f8a6e2d0134f
	.xword	0x773875c2688a0c14
	.xword	0x51aab1d40adb6f05
	.xword	0xe76ff2818ce5d20d
	.xword	0x83db5bcb9a93a7e1
	.xword	0x6486ef60f98c68ea
	.xword	0x857251f279302f83
	.xword	0x4b565f3f2b19260e
	.xword	0x239beb0112950dab
	.xword	0x647420dc76ea246d
	.xword	0x7232a5951d1a9aef
	.xword	0x5590975308a4952a
	.xword	0x0aa6e7def94c4152
	.xword	0x65857373f9993deb
	.xword	0x97493cda426d3dd0
	.xword	0x6b7a1fc2179c7762
	.xword	0x940218d592663537
	.xword	0xd458c154cef4efdb
	.xword	0x64f4295d819a5008
	.xword	0xa18dba51245ac061
	.xword	0xd5fc99a291411ee6
	.xword	0xf124c7c8a2c4b863
	.xword	0xdd2a5790604d7620



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "10'brr 00rr rrrr");
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
!!# 	  IJ_generate ("diag.j", 163, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 167, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 171, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 175, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 179, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 183, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 187, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 202, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 208, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 212, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
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
!!# 	  IJ_printf ("diag.j", 225, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 229, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
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
!!#           IJ_printf ("diag.j", 283, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 287, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 294, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 295, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 296, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 297, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 311, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 312, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 313, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 314, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 315, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINTR %rvar  Rv_low_wt
!!#         {
!!#           IJ_printf ("diag.j", 321, th_all, "\tmov\t0x%rx, %%o0\n", Rv_intr_vect);
!!#           IJ_printf ("diag.j", 322, th_all, "\tta\tT_SEND_THRD_INTR\n");
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
