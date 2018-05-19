// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_42.s
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
   random seed:	909393944
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

	setx 0x9a3fc7bb1abd3e3a, %g1, %g0
	setx 0x76d642042afb176a, %g1, %g1
	setx 0xcb9f34f5ae7a3df4, %g1, %g2
	setx 0x5f563592e88c7107, %g1, %g3
	setx 0x9112e403f4b2a285, %g1, %g4
	setx 0x592e36a20facb999, %g1, %g5
	setx 0x9ce43a1cb327c96d, %g1, %g6
	setx 0xdffd6c057e036844, %g1, %g7
	setx 0xb9f00b88f7084dd7, %g1, %r16
	setx 0xa9fec9445b4fc5ea, %g1, %r17
	setx 0xf13f44c85e85fa6e, %g1, %r18
	setx 0x1c58c5aaf137941a, %g1, %r19
	setx 0xf41f9a378c5a48f8, %g1, %r20
	setx 0xccedb1e19bee65f8, %g1, %r21
	setx 0xd276f4cabf39f9c3, %g1, %r22
	setx 0xff614ed86a1ea46a, %g1, %r23
	setx 0x1c7690529c5806c6, %g1, %r24
	setx 0xbf1f307311a4de06, %g1, %r25
	setx 0x9aee688a6aa2c306, %g1, %r26
	setx 0xa5517d7f359348d0, %g1, %r27
	setx 0xd2197950f74a30f9, %g1, %r28
	setx 0x95951e8c78f83f66, %g1, %r29
	setx 0x20b6ebad4e355fc4, %g1, %r30
	setx 0x8ccfcc6da69f30b1, %g1, %r31
	save
	setx 0xdc2ca804dc705fea, %g1, %r16
	setx 0xe228e56d900dd85f, %g1, %r17
	setx 0xcdb65ab0ce55e64a, %g1, %r18
	setx 0x370ab171ee4d8513, %g1, %r19
	setx 0x763ba8cfa88e18ff, %g1, %r20
	setx 0x9b69d771404566b9, %g1, %r21
	setx 0xf8813834c464d857, %g1, %r22
	setx 0x4d90e1904d23c305, %g1, %r23
	setx 0x3faaee40fe265071, %g1, %r24
	setx 0x3ff091506c1cf40e, %g1, %r25
	setx 0x8e515134f50dd755, %g1, %r26
	setx 0x34852a3ecca6f7a6, %g1, %r27
	setx 0xf34eb26edc2694d0, %g1, %r28
	setx 0xa2a817f8cc90181a, %g1, %r29
	setx 0xe90ca51a81aab080, %g1, %r30
	setx 0x086d5fa8b75e1677, %g1, %r31
	save
	setx 0x9d80daccada983da, %g1, %r16
	setx 0x57b1e3d553256b1a, %g1, %r17
	setx 0x77d4d2ab80d2b18f, %g1, %r18
	setx 0x2faa856bdb55d68b, %g1, %r19
	setx 0x6a0551f6a1018f8b, %g1, %r20
	setx 0x4f19bd5bb4b3e419, %g1, %r21
	setx 0x2056fe3067037061, %g1, %r22
	setx 0x986f0dd021ffbd27, %g1, %r23
	setx 0x8a49454d8af90d44, %g1, %r24
	setx 0x23e4f571772291a5, %g1, %r25
	setx 0x3edd3ac7ac655067, %g1, %r26
	setx 0xb2f9d47fbb3aa29f, %g1, %r27
	setx 0x00181658907463c4, %g1, %r28
	setx 0xaf039cf09455f4ea, %g1, %r29
	setx 0x56a64e64957a2997, %g1, %r30
	setx 0x4cce49029891f7b0, %g1, %r31
	save
	setx 0x4fcaafa10068fd90, %g1, %r16
	setx 0x0092ed8d48f4f7c7, %g1, %r17
	setx 0x79167474bd5eb54a, %g1, %r18
	setx 0x66e6eaac522c41bd, %g1, %r19
	setx 0x97b40012d93cdd51, %g1, %r20
	setx 0x4d59b3eaa79dd06e, %g1, %r21
	setx 0xf405a57ea2ab8512, %g1, %r22
	setx 0x7da20aa01e18ce6d, %g1, %r23
	setx 0xf17980ce03f4da15, %g1, %r24
	setx 0x459ffb4edf608927, %g1, %r25
	setx 0x14209580de67f46e, %g1, %r26
	setx 0xb275e26bbac9a6f7, %g1, %r27
	setx 0x58e92436d0b9bb75, %g1, %r28
	setx 0x29df421a98708ad0, %g1, %r29
	setx 0x22a52b2ca2a5f422, %g1, %r30
	setx 0x5362d00d1ac70e84, %g1, %r31
	save
	setx 0xfefd6bf046300cf4, %g1, %r16
	setx 0xb45090433ff9cd5e, %g1, %r17
	setx 0xbe3e8224d6af55bd, %g1, %r18
	setx 0x7f06d42d9524db2f, %g1, %r19
	setx 0xc091322e1432ee4f, %g1, %r20
	setx 0x6432e118a41cf16a, %g1, %r21
	setx 0xa77724a56420b7e2, %g1, %r22
	setx 0x191a6c32f14e00b1, %g1, %r23
	setx 0x1d5d4447257e1a17, %g1, %r24
	setx 0x7197329d6204b88d, %g1, %r25
	setx 0x9d16d7b3cdf26dd9, %g1, %r26
	setx 0x46f0cd68974bdb86, %g1, %r27
	setx 0x8505fac7a646f79b, %g1, %r28
	setx 0x8d49d1aebdac549b, %g1, %r29
	setx 0x9cec212128c181d8, %g1, %r30
	setx 0x54dd84ea1c3b5fb1, %g1, %r31
	save
	setx 0xaad592c230e6cf3f, %g1, %r16
	setx 0xa1e88c3feb79f81b, %g1, %r17
	setx 0x6baaa85e667ac4a1, %g1, %r18
	setx 0x14578cbc48a4acb7, %g1, %r19
	setx 0x9054baf51dd74887, %g1, %r20
	setx 0x5170bad34913edfd, %g1, %r21
	setx 0x8f8a7586ae7e86c8, %g1, %r22
	setx 0xd52e07257e3fe75a, %g1, %r23
	setx 0x637560bc48a22c76, %g1, %r24
	setx 0x87a221f9a070925a, %g1, %r25
	setx 0xe3d34ed681d51111, %g1, %r26
	setx 0x257214035c6079da, %g1, %r27
	setx 0x252c0186c66210c4, %g1, %r28
	setx 0x1843fbbf67a58dae, %g1, %r29
	setx 0x6ec20400c43d7cc2, %g1, %r30
	setx 0xa67b90a7c5477d3a, %g1, %r31
	save
	setx 0xf36688d6d29c9432, %g1, %r16
	setx 0x254ad670769d90a9, %g1, %r17
	setx 0x106567b791cffa0e, %g1, %r18
	setx 0x2fa444f34b0c9e22, %g1, %r19
	setx 0xfc83f1c1626d36d6, %g1, %r20
	setx 0x8c78de2750a981ed, %g1, %r21
	setx 0xd2527d84b24932a5, %g1, %r22
	setx 0xd799167a209f6372, %g1, %r23
	setx 0x0cbc314c59de3b8b, %g1, %r24
	setx 0xe82899af1ffc3b40, %g1, %r25
	setx 0x9b9e4166dc0d7ff2, %g1, %r26
	setx 0x8d9a8cd927fd0fca, %g1, %r27
	setx 0x2cc376a2fd374af2, %g1, %r28
	setx 0xb2a507cb4b0374a0, %g1, %r29
	setx 0x6d4a68e00e79252d, %g1, %r30
	setx 0xc0eed43e255dc44a, %g1, %r31
	save
	setx 0xb7e16666dfc484c4, %g1, %r16
	setx 0xda13b02284b4f916, %g1, %r17
	setx 0xa9223b2dd99dd252, %g1, %r18
	setx 0x238b157b2871aad6, %g1, %r19
	setx 0x8ab3b0f0a8ed437c, %g1, %r20
	setx 0x607ed59f3a7a67e7, %g1, %r21
	setx 0xd91e0bd3f4af5d19, %g1, %r22
	setx 0x1cc213800c11f851, %g1, %r23
	setx 0x876e42be459cde30, %g1, %r24
	setx 0x372299fb3f44312d, %g1, %r25
	setx 0xc30628bdd53f6e4e, %g1, %r26
	setx 0x471f67ec4cb6f578, %g1, %r27
	setx 0xae98ba767275d80b, %g1, %r28
	setx 0xc6a6f6106dcbee01, %g1, %r29
	setx 0xe607b4996b3f9145, %g1, %r30
	setx 0x12e8acf9615ba17d, %g1, %r31
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
	.word 0xb5e4e147  ! 3: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4a08a  ! 4: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5a08c  ! 7: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_7, %g1, %r18
	.word 0xbe0d210b  ! 11: AND_I	and 	%r20, 0x010b, %r31
	.word 0xbb504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0xb9520000  ! 23: RDPR_PIL	<illegal instruction>
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 32: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5a03a  ! 33: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8994605c  ! 34: WRPR_TICK_I	wrpr	%r17, 0x005c, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf510000  ! 36: RDPR_TICK	<illegal instruction>
	.word 0xb4844000  ! 41: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xb5e5e045  ! 46: SAVE_I	save	%r23, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 47: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e0f4  ! 53: WRPR_TSTATE_I	wrpr	%r19, 0x00f4, %tstate
	.word 0xbb34a001  ! 54: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xbc8d8000  ! 57: ANDcc_R	andcc 	%r22, %r0, %r30
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bde076  ! 64: XNORcc_I	xnorcc 	%r23, 0x0076, %r26
	setx	data_start_6, %g1, %r19
	.word 0xb7e4e0c9  ! 66: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9521c2  ! 72: WRPR_PSTATE_I	wrpr	%r20, 0x01c2, %pstate
	mov	2, %r12
	.word 0xa1930000  ! 76: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e5e004  ! 80: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbf518000  ! 81: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5e1b0  ! 88: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4a0e8  ! 90: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 92: RDPR_TPC	<illegal instruction>
	.word 0xb37d2401  ! 93: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xbfe4e1ae  ! 94: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde520fc  ! 97: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde46002  ! 99: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7510000  ! 100: RDPR_TICK	<illegal instruction>
	.word 0xbfe46153  ! 102: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e135  ! 106: SAVE_I	save	%r19, 0x0001, %r29
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 112: RDPR_PSTATE	<illegal instruction>
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	setx	0x675897a400009c05, %g1, %r10
	.word 0x839a8000  ! 123: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb40d61f5  ! 127: AND_I	and 	%r21, 0x01f5, %r26
	.word 0xb3480000  ! 132: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3e5a0fe  ! 134: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe421cd  ! 138: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5e19c  ! 139: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb014a062  ! 142: OR_I	or 	%r18, 0x0062, %r24
	.word 0xb5e5213a  ! 144: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4e0cc  ! 146: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e42142  ! 148: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4e1b1  ! 149: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbcbd21cf  ! 150: XNORcc_I	xnorcc 	%r20, 0x01cf, %r30
	.word 0x87956111  ! 155: WRPR_TT_I	wrpr	%r21, 0x0111, %tt
	.word 0xb2c421d5  ! 159: ADDCcc_I	addccc 	%r16, 0x01d5, %r25
	.word 0xbc05e025  ! 160: ADD_I	add 	%r23, 0x0025, %r30
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf0245f4700008a10, %g1, %r10
	.word 0x839a8000  ! 163: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0f3  ! 174: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e560c5  ! 178: SAVE_I	save	%r21, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 179: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5a1d4  ! 183: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xba2c8000  ! 186: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xbd641800  ! 187: MOVcc_R	<illegal instruction>
	.word 0xb1e5a1cc  ! 188: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4e16d  ! 189: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5a110  ! 190: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_7, %g1, %r19
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1b3  ! 200: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4e139  ! 201: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbf50c000  ! 203: RDPR_TT	<illegal instruction>
	.word 0xbc35e00a  ! 205: ORN_I	orn 	%r23, 0x000a, %r30
	.word 0xb5508000  ! 208: RDPR_TSTATE	<illegal instruction>
	.word 0xb68420c6  ! 213: ADDcc_I	addcc 	%r16, 0x00c6, %r27
	.word 0xb151c000  ! 214: RDPR_TL	<illegal instruction>
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5213b  ! 222: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5a1ed  ! 226: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	setx	0xcfd32ab70000ce9e, %g1, %r10
	.word 0x839a8000  ! 229: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe520d8  ! 230: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x83952129  ! 233: WRPR_TNPC_I	wrpr	%r20, 0x0129, %tnpc
	.word 0xb93dd000  ! 241: SRAX_R	srax	%r23, %r0, %r28
	.word 0x8d95a151  ! 243: WRPR_PSTATE_I	wrpr	%r22, 0x0151, %pstate
	.word 0x9194600a  ! 245: WRPR_PIL_I	wrpr	%r17, 0x000a, %pil
	.word 0xb7e4e07a  ! 249: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e42017  ! 255: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e56186  ! 260: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e56067  ! 262: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb28d60ed  ! 263: ANDcc_I	andcc 	%r21, 0x00ed, %r25
	setx	0xe0be611900005fd0, %g1, %r10
	.word 0x819a8000  ! 268: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5a07b  ! 270: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8d9421d9  ! 271: WRPR_PSTATE_I	wrpr	%r16, 0x01d9, %pstate
	setx	data_start_7, %g1, %r19
	.word 0xbec54000  ! 274: ADDCcc_R	addccc 	%r21, %r0, %r31
	setx	data_start_7, %g1, %r18
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 283: RDPR_PSTATE	<illegal instruction>
	.word 0xbd508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xb5518000  ! 288: RDPR_PSTATE	<illegal instruction>
	.word 0xb52cd000  ! 295: SLLX_R	sllx	%r19, %r0, %r26
	.word 0xb9e560b2  ! 296: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xb3540000  ! 301: RDPR_GL	<illegal instruction>
	.word 0xb1e5213e  ! 305: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4a0e5  ! 306: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e460c9  ! 308: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd3dd000  ! 309: SRAX_R	srax	%r23, %r0, %r30
	.word 0xb2b5613d  ! 311: ORNcc_I	orncc 	%r21, 0x013d, %r25
	.word 0xbde5a107  ! 314: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 318: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd500000  ! 320: RDPR_TPC	<illegal instruction>
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a169  ! 326: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb0942170  ! 327: ORcc_I	orcc 	%r16, 0x0170, %r24
	.word 0xb7e4a1e1  ! 328: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb37d2401  ! 333: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xbde4e150  ! 337: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb951c000  ! 342: RDPR_TL	<illegal instruction>
	.word 0xbbe52070  ! 343: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4e064  ! 346: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x5f8a1a900000a8cd, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e460ed  ! 355: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e56066  ! 356: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe4e0a7  ! 359: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf500000  ! 365: RDPR_TPC	<illegal instruction>
	.word 0xbec4e0aa  ! 366: ADDCcc_I	addccc 	%r19, 0x00aa, %r31
	.word 0xb3e5e178  ! 367: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e4210b  ! 373: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde421ab  ! 377: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e46176  ! 380: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e52021  ! 381: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe5602b  ! 385: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x43e0086700009a19, %g1, %r10
	.word 0x839a8000  ! 387: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e52007  ! 389: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde4a117  ! 390: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbec48000  ! 392: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xbbe520d1  ! 393: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb0944000  ! 395: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xbbe4e155  ! 396: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5a0b4  ! 399: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8795a0bc  ! 400: WRPR_TT_I	wrpr	%r22, 0x00bc, %tt
	.word 0xb5518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xb9500000  ! 404: RDPR_TPC	<illegal instruction>
	.word 0xb3e46138  ! 409: SAVE_I	save	%r17, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 415: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e4e173  ! 417: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_6, %g1, %r19
	.word 0xbde4a15a  ! 423: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde421bb  ! 426: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe521f8  ! 431: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8595e0fe  ! 433: WRPR_TSTATE_I	wrpr	%r23, 0x00fe, %tstate
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 439: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 441: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420de  ! 449: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbf480000  ! 450: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xb5e4600e  ! 454: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde56080  ! 457: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7643801  ! 459: MOVcc_I	<illegal instruction>
	.word 0xb13da001  ! 460: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0x919420e9  ! 461: WRPR_PIL_I	wrpr	%r16, 0x00e9, %pil
	.word 0xb7e5a1e3  ! 466: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5a12e  ! 468: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1a2  ! 472: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9348000  ! 473: SRL_R	srl 	%r18, %r0, %r28
	mov	1, %r12
	.word 0xa1930000  ! 476: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5e0a8  ! 481: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbb504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e040  ! 485: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d94608b  ! 487: WRPR_PSTATE_I	wrpr	%r17, 0x008b, %pstate
	.word 0x8394206f  ! 488: WRPR_TNPC_I	wrpr	%r16, 0x006f, %tnpc
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 495: RDPR_TICK	<illegal instruction>
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1aa  ! 497: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e520c1  ! 501: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5e020  ! 502: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb350c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0xb9e5e1ff  ! 504: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5217d  ! 506: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e4a168  ! 507: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8195a05b  ! 508: WRPR_TPC_I	wrpr	%r22, 0x005b, %tpc
	.word 0xbfe46045  ! 509: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe56192  ! 510: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde420e9  ! 517: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4e194  ! 521: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8995e138  ! 522: WRPR_TICK_I	wrpr	%r23, 0x0138, %tick
	.word 0xbde4608d  ! 523: SAVE_I	save	%r17, 0x0001, %r30
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1dc  ! 528: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e1c9  ! 532: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e521d8  ! 541: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x851b0d9200003f5d, %g1, %r10
	.word 0x839a8000  ! 544: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e421c4  ! 546: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb295c000  ! 548: ORcc_R	orcc 	%r23, %r0, %r25
	.word 0xb5e4a1e0  ! 550: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0b44000  ! 551: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb7e460fc  ! 552: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5a138  ! 555: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e156  ! 564: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe420b3  ! 566: SAVE_I	save	%r16, 0x0001, %r29
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e520cc  ! 568: SAVE_I	save	%r20, 0x0001, %r24
	mov	2, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e5605d  ! 574: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8395a014  ! 579: WRPR_TNPC_I	wrpr	%r22, 0x0014, %tnpc
	.word 0xb9e4a00d  ! 581: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4e07d  ! 583: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb4c4e098  ! 585: ADDCcc_I	addccc 	%r19, 0x0098, %r26
	setx	data_start_4, %g1, %r16
	.word 0xbb51c000  ! 590: RDPR_TL	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d4000  ! 598: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xb1504000  ! 599: RDPR_TNPC	<illegal instruction>
	.word 0xbfe521ca  ! 602: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xba0de003  ! 605: AND_I	and 	%r23, 0x0003, %r29
	.word 0xbb504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4e029  ! 610: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3500000  ! 612: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795e0ac  ! 619: WRPR_TT_I	wrpr	%r23, 0x00ac, %tt
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c4000  ! 632: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xbe8c8000  ! 636: ANDcc_R	andcc 	%r18, %r0, %r31
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5e1d7  ! 639: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xb1e4e058  ! 645: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5a113  ! 646: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe561d0  ! 647: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe56073  ! 649: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4a060  ! 653: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x2d83bd5600002f1d, %g1, %r10
	.word 0x839a8000  ! 655: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a084  ! 659: WRPR_PIL_I	wrpr	%r22, 0x0084, %pil
	.word 0xb3e4a15a  ! 667: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8395e1c9  ! 670: WRPR_TNPC_I	wrpr	%r23, 0x01c9, %tnpc
	.word 0x8995a19b  ! 675: WRPR_TICK_I	wrpr	%r22, 0x019b, %tick
	.word 0xb3e46002  ! 676: SAVE_I	save	%r17, 0x0001, %r25
	setx	0xeac4815900002c00, %g1, %r10
	.word 0x839a8000  ! 678: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2246068  ! 679: SUB_I	sub 	%r17, 0x0068, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4617e  ! 685: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e52104  ! 687: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5e0c1  ! 688: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5211d  ! 692: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46072  ! 699: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5a1a1  ! 700: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd540000  ! 701: RDPR_GL	<illegal instruction>
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 707: RDPR_PSTATE	<illegal instruction>
	setx	0xd198e0a500006a48, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe56059  ! 710: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5a053  ! 713: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe521b3  ! 715: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5a0bf  ! 716: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x85952008  ! 717: WRPR_TSTATE_I	wrpr	%r20, 0x0008, %tstate
	setx	0xfa9abdd900007c91, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde5e078  ! 720: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e46114  ! 723: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5a132  ! 726: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7510000  ! 727: RDPR_TICK	<illegal instruction>
	.word 0xb3e4e046  ! 728: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xba840000  ! 737: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xb3e521c6  ! 738: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb643801  ! 741: MOVcc_I	<illegal instruction>
	.word 0xb9e421bf  ! 744: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5a17f  ! 746: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5209a  ! 748: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe560c4  ! 750: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe520b5  ! 751: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534e001  ! 754: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0x8594e183  ! 756: WRPR_TSTATE_I	wrpr	%r19, 0x0183, %tstate
	.word 0xbe8421ff  ! 757: ADDcc_I	addcc 	%r16, 0x01ff, %r31
	.word 0xb9510000  ! 760: RDPR_TICK	<illegal instruction>
	.word 0xbde520e0  ! 762: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5e1af  ! 763: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5612a  ! 765: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e521bd  ! 766: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e5a0fb  ! 770: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe5e1e2  ! 772: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e52190  ! 778: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92dc000  ! 781: SLL_R	sll 	%r23, %r0, %r28
	.word 0xb5e4a069  ! 784: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e4e115  ! 785: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb33c6001  ! 787: SRA_I	sra 	%r17, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 790: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 797: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xbfe5606f  ! 807: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8394604a  ! 809: WRPR_TNPC_I	wrpr	%r17, 0x004a, %tnpc
	.word 0xb5e5605a  ! 810: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_7, %g1, %r16
	.word 0xbbe521ff  ! 815: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5e012  ! 816: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5214e  ! 818: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a04d  ! 827: WRPR_PSTATE_I	wrpr	%r18, 0x004d, %pstate
	.word 0xb5e421ac  ! 828: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5a043  ! 833: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8794e18d  ! 843: WRPR_TT_I	wrpr	%r19, 0x018d, %tt
	.word 0xb4c5e080  ! 845: ADDCcc_I	addccc 	%r23, 0x0080, %r26
	.word 0xbde5e0f1  ! 851: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbea4a005  ! 856: SUBcc_I	subcc 	%r18, 0x0005, %r31
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e161  ! 866: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4200f  ! 868: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e52020  ! 870: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x6d5f6d5e00003ac4, %g1, %r10
	.word 0x839a8000  ! 874: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x7126fbcf0000fede, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xfebb831900001b11, %g1, %r10
	.word 0x839a8000  ! 887: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e521d4  ! 889: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d95a12a  ! 893: WRPR_PSTATE_I	wrpr	%r22, 0x012a, %pstate
	.word 0xb1e4e147  ! 901: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5e14d  ! 902: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4a00a  ! 904: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561c2  ! 909: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7504000  ! 910: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a0c5  ! 919: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e14d  ! 921: WRPR_PIL_I	wrpr	%r19, 0x014d, %pil
	.word 0xbb508000  ! 922: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e42028  ! 923: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbab44000  ! 924: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xb5500000  ! 927: RDPR_TPC	<illegal instruction>
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1b3  ! 930: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb551c000  ! 933: RDPR_TL	<illegal instruction>
	.word 0xbbe56057  ! 934: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9510000  ! 935: RDPR_TICK	<illegal instruction>
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 941: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a0ba  ! 942: SAVE_I	save	%r22, 0x0001, %r25
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460e3  ! 946: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e46131  ! 947: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x9187de0200005902, %g1, %r10
	.word 0x839a8000  ! 951: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba0c2060  ! 953: AND_I	and 	%r16, 0x0060, %r29
	.word 0xb5e4a007  ! 957: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461f1  ! 966: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e461d1  ! 972: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0x85942194  ! 981: WRPR_TSTATE_I	wrpr	%r16, 0x0194, %tstate
	.word 0xb5e5619c  ! 982: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4e1d7  ! 983: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb0a4c000  ! 985: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xb3e46063  ! 986: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a19f  ! 990: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e4e04d  ! 992: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd51c000  ! 993: RDPR_TL	<illegal instruction>
	.word 0xbfe4e1aa  ! 995: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a123  ! 997: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1518000  ! 998: RDPR_PSTATE	<illegal instruction>
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
	.word 0xf63da057  ! 1: STD_I	std	%r27, [%r22 + 0x0057]
	.word 0xf53d0000  ! 2: STDF_R	std	%f26, [%r0, %r20]
	setx	data_start_2, %g1, %r21
	.word 0xf8254000  ! 9: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xbc0da0c7  ! 11: AND_I	and 	%r22, 0x00c7, %r30
	.word 0xf624c000  ! 12: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf53c4000  ! 17: STDF_R	std	%f26, [%r0, %r17]
	.word 0xbb504000  ! 18: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfd3d8000  ! 19: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf73cc000  ! 21: STDF_R	std	%f27, [%r0, %r19]
	.word 0xb5520000  ! 23: RDPR_PIL	<illegal instruction>
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6744000  ! 26: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf234e0d4  ! 27: STH_I	sth	%r25, [%r19 + 0x00d4]
	.word 0xfc754000  ! 29: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf034a068  ! 30: STH_I	sth	%r24, [%r18 + 0x0068]
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 32: RDPR_TSTATE	<illegal instruction>
	.word 0x89952040  ! 34: WRPR_TICK_I	wrpr	%r20, 0x0040, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd510000  ! 36: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf034c000  ! 37: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf6250000  ! 39: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xbc858000  ! 41: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xf0748000  ! 44: STX_R	stx	%r24, [%r18 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 47: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a0c2  ! 53: WRPR_TSTATE_I	wrpr	%r18, 0x00c2, %tstate
	.word 0xbd34a001  ! 54: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xfa35a1d1  ! 56: STH_I	sth	%r29, [%r22 + 0x01d1]
	.word 0xba8c8000  ! 57: ANDcc_R	andcc 	%r18, %r0, %r29
	.word 0xf474e1f5  ! 60: STX_I	stx	%r26, [%r19 + 0x01f5]
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bce191  ! 64: XNORcc_I	xnorcc 	%r19, 0x0191, %r26
	setx	data_start_3, %g1, %r17
	.word 0xf63d4000  ! 67: STD_R	std	%r27, [%r21 + %r0]
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d942121  ! 72: WRPR_PSTATE_I	wrpr	%r16, 0x0121, %pstate
	.word 0xfc2c0000  ! 73: STB_R	stb	%r30, [%r16 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 76: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc35a174  ! 79: STH_I	sth	%r30, [%r22 + 0x0174]
	.word 0xbd518000  ! 81: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf33c4000  ! 84: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf2346030  ! 85: STH_I	sth	%r25, [%r17 + 0x0030]
	.word 0xf33cc000  ! 89: STDF_R	std	%f25, [%r0, %r19]
	.word 0xb7504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 92: RDPR_TPC	<illegal instruction>
	.word 0xb97c6401  ! 93: MOVR_I	movre	%r17, 0x1, %r28
	.word 0xf73d8000  ! 98: STDF_R	std	%f27, [%r0, %r22]
	.word 0xbf510000  ! 100: RDPR_TICK	<illegal instruction>
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 112: RDPR_PSTATE	<illegal instruction>
	.word 0xf13d8000  ! 114: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf82da0d8  ! 115: STB_I	stb	%r28, [%r22 + 0x00d8]
	.word 0xfc3d4000  ! 118: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf03c8000  ! 119: STD_R	std	%r24, [%r18 + %r0]
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	setx	0x8caee4b80000d819, %g1, %r10
	.word 0x839a8000  ! 123: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba0c218c  ! 127: AND_I	and 	%r16, 0x018c, %r29
	.word 0xf2744000  ! 129: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb9480000  ! 132: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf025a138  ! 133: STW_I	stw	%r24, [%r22 + 0x0138]
	.word 0xfe25606f  ! 140: STW_I	stw	%r31, [%r21 + 0x006f]
	.word 0xb61561a5  ! 142: OR_I	or 	%r21, 0x01a5, %r27
	.word 0xfc3d4000  ! 143: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf074e1fe  ! 147: STX_I	stx	%r24, [%r19 + 0x01fe]
	.word 0xbebc6113  ! 150: XNORcc_I	xnorcc 	%r17, 0x0113, %r31
	.word 0xf8248000  ! 152: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x8794e156  ! 155: WRPR_TT_I	wrpr	%r19, 0x0156, %tt
	.word 0xbac560cb  ! 159: ADDCcc_I	addccc 	%r21, 0x00cb, %r29
	.word 0xb004a0c7  ! 160: ADD_I	add 	%r18, 0x00c7, %r24
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3c20f4  ! 162: STD_I	std	%r30, [%r16 + 0x00f4]
	setx	0xdbe796b60000eb16, %g1, %r10
	.word 0x839a8000  ! 163: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe3ca060  ! 166: STD_I	std	%r31, [%r18 + 0x0060]
	.word 0xf224a009  ! 169: STW_I	stw	%r25, [%r18 + 0x0009]
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 172: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf13dc000  ! 173: STDF_R	std	%f24, [%r0, %r23]
	.word 0xfc2520e7  ! 176: STW_I	stw	%r30, [%r20 + 0x00e7]
	mov	1, %r12
	.word 0x8f930000  ! 179: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf43561d8  ! 180: STH_I	sth	%r26, [%r21 + 0x01d8]
	.word 0xf33c8000  ! 184: STDF_R	std	%f25, [%r0, %r18]
	.word 0xb02c8000  ! 186: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xbd641800  ! 187: MOVcc_R	<illegal instruction>
	.word 0xf434a0cd  ! 191: STH_I	sth	%r26, [%r18 + 0x00cd]
	setx	data_start_0, %g1, %r18
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a1bf  ! 197: STH_I	sth	%r30, [%r22 + 0x01bf]
	.word 0xfc240000  ! 198: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xb750c000  ! 203: RDPR_TT	rdpr	%tt, %r27
	.word 0xf024a0ab  ! 204: STW_I	stw	%r24, [%r18 + 0x00ab]
	.word 0xbe35e0e0  ! 205: ORN_I	orn 	%r23, 0x00e0, %r31
	.word 0xf624207e  ! 206: STW_I	stw	%r27, [%r16 + 0x007e]
	.word 0xbd508000  ! 208: RDPR_TSTATE	<illegal instruction>
	.word 0xf82c60bd  ! 209: STB_I	stb	%r28, [%r17 + 0x00bd]
	.word 0xb2856008  ! 213: ADDcc_I	addcc 	%r21, 0x0008, %r25
	.word 0xb551c000  ! 214: RDPR_TL	<illegal instruction>
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63c8000  ! 219: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf22d8000  ! 221: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf234e109  ! 225: STH_I	sth	%r25, [%r19 + 0x0109]
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	setx	0x5d102c50000fe03, %g1, %r10
	.word 0x839a8000  ! 229: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc254000  ! 231: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf675200b  ! 232: STX_I	stx	%r27, [%r20 + 0x000b]
	.word 0x8395a0a9  ! 233: WRPR_TNPC_I	wrpr	%r22, 0x00a9, %tnpc
	.word 0xfa2c2006  ! 234: STB_I	stb	%r29, [%r16 + 0x0006]
	.word 0xfa2c6105  ! 235: STB_I	stb	%r29, [%r17 + 0x0105]
	.word 0xfa258000  ! 236: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf83520a8  ! 239: STH_I	sth	%r28, [%r20 + 0x00a8]
	.word 0xf83dc000  ! 240: STD_R	std	%r28, [%r23 + %r0]
	.word 0xb53c9000  ! 241: SRAX_R	srax	%r18, %r0, %r26
	.word 0x8d9460e4  ! 243: WRPR_PSTATE_I	wrpr	%r17, 0x00e4, %pstate
	.word 0xf0350000  ! 244: STH_R	sth	%r24, [%r20 + %r0]
	.word 0x9194e005  ! 245: WRPR_PIL_I	wrpr	%r19, 0x0005, %pil
	.word 0xf33ce159  ! 248: STDF_I	std	%f25, [0x0159, %r19]
	.word 0xf8340000  ! 250: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf83c21d6  ! 254: STD_I	std	%r28, [%r16 + 0x01d6]
	.word 0xf074a1fb  ! 259: STX_I	stx	%r24, [%r18 + 0x01fb]
	.word 0xbc8ce181  ! 263: ANDcc_I	andcc 	%r19, 0x0181, %r30
	.word 0xfe2560d2  ! 264: STW_I	stw	%r31, [%r21 + 0x00d2]
	setx	0x9c3e7dbf00009816, %g1, %r10
	.word 0x819a8000  ! 268: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa25e1c3  ! 269: STW_I	stw	%r29, [%r23 + 0x01c3]
	.word 0x8d95a1ac  ! 271: WRPR_PSTATE_I	wrpr	%r22, 0x01ac, %pstate
	setx	data_start_5, %g1, %r20
	.word 0xbcc48000  ! 274: ADDCcc_R	addccc 	%r18, %r0, %r30
	setx	data_start_7, %g1, %r17
	.word 0xfa2ca0ed  ! 276: STB_I	stb	%r29, [%r18 + 0x00ed]
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63c0000  ! 281: STD_R	std	%r27, [%r16 + %r0]
	.word 0xbb518000  ! 283: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xb3508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xff3c0000  ! 287: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb9518000  ! 288: RDPR_PSTATE	<illegal instruction>
	.word 0xbb2d5000  ! 295: SLLX_R	sllx	%r21, %r0, %r29
	.word 0xbd540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xf53c20f7  ! 298: STDF_I	std	%f26, [0x00f7, %r16]
	.word 0xfc35c000  ! 300: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xbb540000  ! 301: RDPR_GL	<illegal instruction>
	.word 0xb33d5000  ! 309: SRAX_R	srax	%r21, %r0, %r25
	.word 0xb2b4a11b  ! 311: ORNcc_I	orncc 	%r18, 0x011b, %r25
	.word 0xf0254000  ! 312: STW_R	stw	%r24, [%r21 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 318: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe354000  ! 319: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xb9500000  ! 320: RDPR_TPC	rdpr	%tpc, %r28
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a04e  ! 325: STW_I	stw	%r31, [%r18 + 0x004e]
	.word 0xbc94a1ef  ! 327: ORcc_I	orcc 	%r18, 0x01ef, %r30
	.word 0xb37ce401  ! 333: MOVR_I	movre	%r19, 0x1, %r25
	.word 0xf02d4000  ! 335: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf8740000  ! 339: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf035c000  ! 340: STH_R	sth	%r24, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb151c000  ! 342: RDPR_TL	<illegal instruction>
	.word 0xfa356031  ! 348: STH_I	sth	%r29, [%r21 + 0x0031]
	setx	0x64f1e4bf00009c41, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc3da123  ! 351: STD_I	std	%r30, [%r22 + 0x0123]
	.word 0xf825a17e  ! 352: STW_I	stw	%r28, [%r22 + 0x017e]
	.word 0xf23de1be  ! 353: STD_I	std	%r25, [%r23 + 0x01be]
	.word 0xf2254000  ! 354: STW_R	stw	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd500000  ! 365: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb4c5203e  ! 366: ADDCcc_I	addccc 	%r20, 0x003e, %r26
	.word 0xfa254000  ! 369: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf23da11e  ! 374: STD_I	std	%r25, [%r22 + 0x011e]
	.word 0xf73d0000  ! 375: STDF_R	std	%f27, [%r0, %r20]
	.word 0xfc3dc000  ! 376: STD_R	std	%r30, [%r23 + %r0]
	.word 0xff3dc000  ! 378: STDF_R	std	%f31, [%r0, %r23]
	.word 0xfa7561d8  ! 379: STX_I	stx	%r29, [%r21 + 0x01d8]
	.word 0xf024c000  ! 386: STW_R	stw	%r24, [%r19 + %r0]
	setx	0x213e07ab00000f40, %g1, %r10
	.word 0x839a8000  ! 387: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4c50000  ! 392: ADDCcc_R	addccc 	%r20, %r0, %r26
	.word 0xf43c20ad  ! 394: STD_I	std	%r26, [%r16 + 0x00ad]
	.word 0xba940000  ! 395: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0x8795212b  ! 400: WRPR_TT_I	wrpr	%r20, 0x012b, %tt
	.word 0xb7518000  ! 402: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfc3de196  ! 403: STD_I	std	%r30, [%r23 + 0x0196]
	.word 0xbf500000  ! 404: RDPR_TPC	<illegal instruction>
	.word 0xfe3c8000  ! 412: STD_R	std	%r31, [%r18 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 415: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r16
	.word 0xf634c000  ! 419: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf02c214c  ! 420: STB_I	stb	%r24, [%r16 + 0x014c]
	.word 0xfc3d2001  ! 425: STD_I	std	%r30, [%r20 + 0x0001]
	.word 0xfc748000  ! 427: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf83d4000  ! 429: STD_R	std	%r28, [%r21 + %r0]
	.word 0x85952165  ! 433: WRPR_TSTATE_I	wrpr	%r20, 0x0165, %tstate
	.word 0xf2256079  ! 436: STW_I	stw	%r25, [%r21 + 0x0079]
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 439: RDPR_TT	rdpr	%tt, %r27
	mov	2, %r12
	.word 0x8f930000  ! 441: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0256115  ! 444: STW_I	stw	%r24, [%r21 + 0x0115]
	.word 0xf47461b7  ! 446: STX_I	stx	%r26, [%r17 + 0x01b7]
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 450: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbb500000  ! 453: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xfa3ca06b  ! 458: STD_I	std	%r29, [%r18 + 0x006b]
	.word 0xbb643801  ! 459: MOVcc_I	<illegal instruction>
	.word 0xbd3c2001  ! 460: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0x9195e061  ! 461: WRPR_PIL_I	wrpr	%r23, 0x0061, %pil
	.word 0xf825e0f9  ! 463: STW_I	stw	%r28, [%r23 + 0x00f9]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe252123  ! 471: STW_I	stw	%r31, [%r20 + 0x0123]
	.word 0xbd354000  ! 473: SRL_R	srl 	%r21, %r0, %r30
	.word 0xf42c8000  ! 474: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfc340000  ! 475: STH_R	sth	%r30, [%r16 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 476: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6740000  ! 479: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfe3de1e6  ! 482: STD_I	std	%r31, [%r23 + 0x01e6]
	.word 0xb5504000  ! 484: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf4758000  ! 486: STX_R	stx	%r26, [%r22 + %r0]
	.word 0x8d9461a6  ! 487: WRPR_PSTATE_I	wrpr	%r17, 0x01a6, %pstate
	.word 0x8395a115  ! 488: WRPR_TNPC_I	wrpr	%r22, 0x0115, %tnpc
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53c8000  ! 490: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfc256041  ! 491: STW_I	stw	%r30, [%r21 + 0x0041]
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 495: RDPR_TICK	rdpr	%tick, %r25
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03da150  ! 499: STD_I	std	%r24, [%r22 + 0x0150]
	.word 0xb950c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0x8195611b  ! 508: WRPR_TPC_I	wrpr	%r21, 0x011b, %tpc
	.word 0xfc74211e  ! 519: STX_I	stx	%r30, [%r16 + 0x011e]
	.word 0x8994a120  ! 522: WRPR_TICK_I	wrpr	%r18, 0x0120, %tick
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474e166  ! 530: STX_I	stx	%r26, [%r19 + 0x0166]
	.word 0xf275e147  ! 534: STX_I	stx	%r25, [%r23 + 0x0147]
	.word 0xfd3c4000  ! 535: STDF_R	std	%f30, [%r0, %r17]
	.word 0xf73d60a5  ! 536: STDF_I	std	%f27, [0x00a5, %r21]
	setx	0xaf65e9a600004cd2, %g1, %r10
	.word 0x839a8000  ! 544: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf02c8000  ! 545: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xb095c000  ! 548: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xbcb40000  ! 551: ORNcc_R	orncc 	%r16, %r0, %r30
	.word 0xfc3c4000  ! 556: STD_R	std	%r30, [%r17 + %r0]
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87420df  ! 561: STX_I	stx	%r28, [%r16 + 0x00df]
	.word 0xf02da00b  ! 562: STB_I	stb	%r24, [%r22 + 0x000b]
	.word 0xf62de14b  ! 563: STB_I	stb	%r27, [%r23 + 0x014b]
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75a177  ! 570: STX_I	stx	%r31, [%r22 + 0x0177]
	mov	0, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf93cc000  ! 572: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfe74c000  ! 575: STX_R	stx	%r31, [%r19 + %r0]
	.word 0x8394e1e2  ! 579: WRPR_TNPC_I	wrpr	%r19, 0x01e2, %tnpc
	.word 0xf22d8000  ! 580: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xbec4e072  ! 585: ADDCcc_I	addccc 	%r19, 0x0072, %r31
	setx	data_start_0, %g1, %r20
	.word 0xfe356089  ! 588: STH_I	sth	%r31, [%r21 + 0x0089]
	.word 0xbd51c000  ! 590: RDPR_TL	rdpr	%tl, %r30
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53c605d  ! 593: STDF_I	std	%f26, [0x005d, %r17]
	.word 0xf83c61e1  ! 595: STD_I	std	%r28, [%r17 + 0x01e1]
	.word 0xf02c4000  ! 596: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf63ce049  ! 597: STD_I	std	%r27, [%r19 + 0x0049]
	.word 0xb49d4000  ! 598: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xbf504000  ! 599: RDPR_TNPC	<illegal instruction>
	.word 0xf634a0ec  ! 600: STH_I	sth	%r27, [%r18 + 0x00ec]
	.word 0xfa250000  ! 601: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfa25e1d3  ! 603: STW_I	stw	%r29, [%r23 + 0x01d3]
	.word 0xb40c600a  ! 605: AND_I	and 	%r17, 0x000a, %r26
	.word 0xfc74e157  ! 606: STX_I	stx	%r30, [%r19 + 0x0157]
	.word 0xb3504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xfe744000  ! 611: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb5500000  ! 612: RDPR_TPC	<illegal instruction>
	.word 0xf834204f  ! 613: STH_I	sth	%r28, [%r16 + 0x004f]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf225e0da  ! 617: STW_I	stw	%r25, [%r23 + 0x00da]
	.word 0xf83c6130  ! 618: STD_I	std	%r28, [%r17 + 0x0130]
	.word 0x87942139  ! 619: WRPR_TT_I	wrpr	%r16, 0x0139, %tt
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43dc000  ! 628: STD_R	std	%r26, [%r23 + %r0]
	.word 0xf33c60f3  ! 630: STDF_I	std	%f25, [0x00f3, %r17]
	.word 0xbe9dc000  ! 632: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xf43c8000  ! 633: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf73d8000  ! 634: STDF_R	std	%f27, [%r0, %r22]
	.word 0xfa24e05e  ! 635: STW_I	stw	%r29, [%r19 + 0x005e]
	.word 0xb48cc000  ! 636: ANDcc_R	andcc 	%r19, %r0, %r26
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434a01a  ! 641: STH_I	sth	%r26, [%r18 + 0x001a]
	setx	data_start_3, %g1, %r16
	.word 0xfe2c201a  ! 650: STB_I	stb	%r31, [%r16 + 0x001a]
	.word 0xf22ca0a8  ! 651: STB_I	stb	%r25, [%r18 + 0x00a8]
	.word 0xfb3de189  ! 652: STDF_I	std	%f29, [0x0189, %r23]
	setx	0xe88f87ea0000bb16, %g1, %r10
	.word 0x839a8000  ! 655: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e181  ! 659: WRPR_PIL_I	wrpr	%r23, 0x0181, %pil
	.word 0xfa354000  ! 661: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf474c000  ! 663: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xff3c61e7  ! 664: STDF_I	std	%f31, [0x01e7, %r17]
	.word 0xf63cc000  ! 666: STD_R	std	%r27, [%r19 + %r0]
	.word 0x8394618f  ! 670: WRPR_TNPC_I	wrpr	%r17, 0x018f, %tnpc
	.word 0x8995e0a3  ! 675: WRPR_TICK_I	wrpr	%r23, 0x00a3, %tick
	setx	0x27d5bb000008db, %g1, %r10
	.word 0x839a8000  ! 678: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb424e1aa  ! 679: SUB_I	sub 	%r19, 0x01aa, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3d2128  ! 684: STD_I	std	%r29, [%r20 + 0x0128]
	.word 0xf0750000  ! 686: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf23d8000  ! 689: STD_R	std	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc2ce165  ! 691: STB_I	stb	%r30, [%r19 + 0x0165]
	.word 0xf635a018  ! 694: STH_I	sth	%r27, [%r22 + 0x0018]
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 697: STB_R	stb	%r31, [%r23 + %r0]
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 701: RDPR_GL	rdpr	%-, %r24
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 707: RDPR_PSTATE	<illegal instruction>
	setx	0xfe3e9126000098d0, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x85952031  ! 717: WRPR_TSTATE_I	wrpr	%r20, 0x0031, %tstate
	setx	0x1932194f0000698c, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3510000  ! 727: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf074c000  ! 733: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xba858000  ! 737: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xf275e19c  ! 740: STX_I	stx	%r25, [%r23 + 0x019c]
	.word 0xb7643801  ! 741: MOVcc_I	<illegal instruction>
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb352001  ! 754: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xf6750000  ! 755: STX_R	stx	%r27, [%r20 + %r0]
	.word 0x8595a106  ! 756: WRPR_TSTATE_I	wrpr	%r22, 0x0106, %tstate
	.word 0xb684613c  ! 757: ADDcc_I	addcc 	%r17, 0x013c, %r27
	.word 0xf63c0000  ! 759: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb3510000  ! 760: RDPR_TICK	rdpr	%tick, %r25
	.word 0xfb3d4000  ! 774: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfc346196  ! 779: STH_I	sth	%r30, [%r17 + 0x0196]
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c0000  ! 781: SLL_R	sll 	%r16, %r0, %r27
	.word 0xfc2461ca  ! 783: STW_I	stw	%r30, [%r17 + 0x01ca]
	.word 0xf8348000  ! 786: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xb73c2001  ! 787: SRA_I	sra 	%r16, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 790: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc25610c  ! 791: STW_I	stw	%r30, [%r21 + 0x010c]
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235c000  ! 793: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf8348000  ! 794: STH_R	sth	%r28, [%r18 + %r0]
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 797: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9540000  ! 800: RDPR_GL	rdpr	%-, %r28
	.word 0xf474a14b  ! 803: STX_I	stx	%r26, [%r18 + 0x014b]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8395e0a2  ! 809: WRPR_TNPC_I	wrpr	%r23, 0x00a2, %tnpc
	setx	data_start_2, %g1, %r21
	.word 0xf874a1ca  ! 814: STX_I	stx	%r28, [%r18 + 0x01ca]
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075a044  ! 821: STX_I	stx	%r24, [%r22 + 0x0044]
	.word 0xfa24c000  ! 822: STW_R	stw	%r29, [%r19 + %r0]
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74c000  ! 825: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xf8358000  ! 826: STH_R	sth	%r28, [%r22 + %r0]
	.word 0x8d95e118  ! 827: WRPR_PSTATE_I	wrpr	%r23, 0x0118, %pstate
	.word 0xf675a123  ! 829: STX_I	stx	%r27, [%r22 + 0x0123]
	.word 0xfd3d4000  ! 830: STDF_R	std	%f30, [%r0, %r21]
	.word 0xfa246145  ! 831: STW_I	stw	%r29, [%r17 + 0x0145]
	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x879420b8  ! 843: WRPR_TT_I	wrpr	%r16, 0x00b8, %tt
	.word 0xb0c5e0a1  ! 845: ADDCcc_I	addccc 	%r23, 0x00a1, %r24
	.word 0xf43cc000  ! 848: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb6a46195  ! 856: SUBcc_I	subcc 	%r17, 0x0195, %r27
	.word 0xfa34e072  ! 860: STH_I	sth	%r29, [%r19 + 0x0072]
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 873: STB_R	stb	%r26, [%r16 + %r0]
	setx	0x8b9ca95e0000ea82, %g1, %r10
	.word 0x839a8000  ! 874: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6750000  ! 875: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xfa3d6185  ! 876: STD_I	std	%r29, [%r21 + 0x0185]
	setx	0x8b86bcce00006b8d, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa74c000  ! 880: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfa3ca199  ! 884: STD_I	std	%r29, [%r18 + 0x0199]
	.word 0xf43521bc  ! 886: STH_I	sth	%r26, [%r20 + 0x01bc]
	setx	0xa57aaad000007b52, %g1, %r10
	.word 0x839a8000  ! 887: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfb3c8000  ! 891: STDF_R	std	%f29, [%r0, %r18]
	.word 0x8d94a0e6  ! 893: WRPR_PSTATE_I	wrpr	%r18, 0x00e6, %pstate
	.word 0xf83d0000  ! 896: STD_R	std	%r28, [%r20 + %r0]
	.word 0xfc754000  ! 897: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf82c4000  ! 907: STB_R	stb	%r28, [%r17 + %r0]
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 910: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf6252036  ! 911: STW_I	stw	%r27, [%r20 + 0x0036]
	.word 0xf03dc000  ! 913: STD_R	std	%r24, [%r23 + %r0]
	.word 0xfd3d8000  ! 916: STDF_R	std	%f30, [%r0, %r22]
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e0fa  ! 921: WRPR_PIL_I	wrpr	%r19, 0x00fa, %pil
	.word 0xbd508000  ! 922: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb2b40000  ! 924: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xf82d0000  ! 925: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb1500000  ! 927: RDPR_TPC	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 933: RDPR_TL	<illegal instruction>
	.word 0xbb510000  ! 935: RDPR_TICK	<illegal instruction>
	.word 0xf93de09e  ! 937: STDF_I	std	%f28, [0x009e, %r23]
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 941: RDPR_TSTATE	<illegal instruction>
	.word 0xf2744000  ! 944: STX_R	stx	%r25, [%r17 + %r0]
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa7420a5  ! 949: STX_I	stx	%r29, [%r16 + 0x00a5]
	.word 0xfb3cc000  ! 950: STDF_R	std	%f29, [%r0, %r19]
	setx	0xb32d37fb00001dcf, %g1, %r10
	.word 0x839a8000  ! 951: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2344000  ! 952: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xba0c219e  ! 953: AND_I	and 	%r16, 0x019e, %r29
	.word 0xf425e078  ! 954: STW_I	stw	%r26, [%r23 + 0x0078]
	.word 0xf4740000  ! 955: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf475a1bf  ! 956: STX_I	stx	%r26, [%r22 + 0x01bf]
	.word 0xfa2c2086  ! 960: STB_I	stb	%r29, [%r16 + 0x0086]
	.word 0xf13d2056  ! 964: STDF_I	std	%f24, [0x0056, %r20]
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d216a  ! 974: STB_I	stb	%r26, [%r20 + 0x016a]
	.word 0xb5504000  ! 977: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xff3d8000  ! 979: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf02c4000  ! 980: STB_R	stb	%r24, [%r17 + %r0]
	.word 0x85952005  ! 981: WRPR_TSTATE_I	wrpr	%r20, 0x0005, %tstate
	.word 0xb6a4c000  ! 985: SUBcc_R	subcc 	%r19, %r0, %r27
	.word 0xfe250000  ! 988: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xff3ce191  ! 989: STDF_I	std	%f31, [0x0191, %r19]
	.word 0xf53c60ba  ! 991: STDF_I	std	%f26, [0x00ba, %r17]
	.word 0xb351c000  ! 993: RDPR_TL	rdpr	%tl, %r25
	.word 0xfc2c0000  ! 994: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xbd518000  ! 998: RDPR_PSTATE	<illegal instruction>
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
	.word 0xf4548000  ! 6: LDSH_R	ldsh	[%r18 + %r0], %r26
	setx	data_start_2, %g1, %r17
	.word 0xf60cc000  ! 10: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xba0c2016  ! 11: AND_I	and 	%r16, 0x0016, %r29
	.word 0xf8044000  ! 14: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf40c8000  ! 16: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xbd504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0xb3520000  ! 23: RDPR_PIL	<illegal instruction>
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d208d  ! 28: LDX_I	ldx	[%r20 + 0x008d], %r28
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 32: RDPR_TSTATE	<illegal instruction>
	.word 0x8994e04f  ! 34: WRPR_TICK_I	wrpr	%r19, 0x004f, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf510000  ! 36: RDPR_TICK	<illegal instruction>
	.word 0xf21da1de  ! 38: LDD_I	ldd	[%r22 + 0x01de], %r25
	.word 0xb6854000  ! 41: ADDcc_R	addcc 	%r21, %r0, %r27
	.word 0xf20c21d6  ! 43: LDUB_I	ldub	[%r16 + 0x01d6], %r25
	mov	2, %r12
	.word 0x8f930000  ! 47: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf055e0f5  ! 48: LDSH_I	ldsh	[%r23 + 0x00f5], %r24
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a085  ! 53: WRPR_TSTATE_I	wrpr	%r22, 0x0085, %tstate
	.word 0xbb352001  ! 54: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xfa050000  ! 55: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xb88d4000  ! 57: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xf40dc000  ! 58: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf20dc000  ! 61: LDUB_R	ldub	[%r23 + %r0], %r25
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0da0f3  ! 63: LDUB_I	ldub	[%r22 + 0x00f3], %r31
	.word 0xb6bc2011  ! 64: XNORcc_I	xnorcc 	%r16, 0x0011, %r27
	setx	data_start_5, %g1, %r18
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8050000  ! 70: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xfd1d20ad  ! 71: LDDF_I	ldd	[%r20, 0x00ad], %f30
	.word 0x8d95a1c4  ! 72: WRPR_PSTATE_I	wrpr	%r22, 0x01c4, %pstate
	.word 0xfa5ce16f  ! 74: LDX_I	ldx	[%r19 + 0x016f], %r29
	mov	0, %r12
	.word 0xa1930000  ! 76: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0044000  ! 78: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xbd518000  ! 81: RDPR_PSTATE	<illegal instruction>
	.word 0xfe05c000  ! 86: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xfd1de1c4  ! 87: LDDF_I	ldd	[%r23, 0x01c4], %f30
	.word 0xb7504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 92: RDPR_TPC	<illegal instruction>
	.word 0xb77c6401  ! 93: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xbd510000  ! 100: RDPR_TICK	<illegal instruction>
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1d4000  ! 108: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xfc15a00a  ! 109: LDUH_I	lduh	[%r22 + 0x000a], %r30
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 112: RDPR_PSTATE	<illegal instruction>
	.word 0xfb1d4000  ! 116: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf844c000  ! 117: LDSW_R	ldsw	[%r19 + %r0], %r28
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	setx	0xe426205200004cc8, %g1, %r10
	.word 0x839a8000  ! 123: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf71dc000  ! 125: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xfc0d8000  ! 126: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb20ca1f9  ! 127: AND_I	and 	%r18, 0x01f9, %r25
	.word 0xfb1dc000  ! 128: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xfc05c000  ! 130: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xbf480000  ! 132: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa4c4000  ! 135: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf11de189  ! 141: LDDF_I	ldd	[%r23, 0x0189], %f24
	.word 0xb4152184  ! 142: OR_I	or 	%r20, 0x0184, %r26
	.word 0xb2bde0b2  ! 150: XNORcc_I	xnorcc 	%r23, 0x00b2, %r25
	.word 0xf4450000  ! 151: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf60c20a9  ! 153: LDUB_I	ldub	[%r16 + 0x00a9], %r27
	.word 0x8795e07c  ! 155: WRPR_TT_I	wrpr	%r23, 0x007c, %tt
	.word 0xf31c0000  ! 156: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf05ce143  ! 157: LDX_I	ldx	[%r19 + 0x0143], %r24
	.word 0xb8c5601c  ! 159: ADDCcc_I	addccc 	%r21, 0x001c, %r28
	.word 0xbc04a1d9  ! 160: ADD_I	add 	%r18, 0x01d9, %r30
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	setx	0xa9f9381300008b11, %g1, %r10
	.word 0x839a8000  ! 163: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf0540000  ! 167: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xfe454000  ! 168: LDSW_R	ldsw	[%r21 + %r0], %r31
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe054000  ! 171: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xfe5c2033  ! 175: LDX_I	ldx	[%r16 + 0x0033], %r31
	mov	2, %r12
	.word 0x8f930000  ! 179: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc5c8000  ! 185: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xb02cc000  ! 186: ANDN_R	andn 	%r19, %r0, %r24
	.word 0xb1641800  ! 187: MOVcc_R	<illegal instruction>
	.word 0xfa14e184  ! 192: LDUH_I	lduh	[%r19 + 0x0184], %r29
	setx	data_start_1, %g1, %r21
	.word 0xf44c4000  ! 195: LDSB_R	ldsb	[%r17 + %r0], %r26
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d2072  ! 199: LDX_I	ldx	[%r20 + 0x0072], %r31
	.word 0xb950c000  ! 203: RDPR_TT	<illegal instruction>
	.word 0xba35603e  ! 205: ORN_I	orn 	%r21, 0x003e, %r29
	.word 0xb1508000  ! 208: RDPR_TSTATE	<illegal instruction>
	.word 0xf04da199  ! 212: LDSB_I	ldsb	[%r22 + 0x0199], %r24
	.word 0xb0852184  ! 213: ADDcc_I	addcc 	%r20, 0x0184, %r24
	.word 0xbf51c000  ! 214: RDPR_TL	<illegal instruction>
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d20ad  ! 216: LDUB_I	ldub	[%r20 + 0x00ad], %r24
	.word 0xf80c8000  ! 223: LDUB_R	ldub	[%r18 + %r0], %r28
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91c0000  ! 228: LDDF_R	ldd	[%r16, %r0], %f28
	setx	0x832665b700000c15, %g1, %r10
	.word 0x839a8000  ! 229: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394a027  ! 233: WRPR_TNPC_I	wrpr	%r18, 0x0027, %tnpc
	.word 0xf31c8000  ! 237: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xf91d6021  ! 238: LDDF_I	ldd	[%r21, 0x0021], %f28
	.word 0xb13d1000  ! 241: SRAX_R	srax	%r20, %r0, %r24
	.word 0xfb1d61b2  ! 242: LDDF_I	ldd	[%r21, 0x01b2], %f29
	.word 0x8d942080  ! 243: WRPR_PSTATE_I	wrpr	%r16, 0x0080, %pstate
	.word 0x91956199  ! 245: WRPR_PIL_I	wrpr	%r21, 0x0199, %pil
	.word 0xff1c8000  ! 246: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xfc15a0f1  ! 252: LDUH_I	lduh	[%r22 + 0x00f1], %r30
	.word 0xf81d8000  ! 253: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf055e19d  ! 256: LDSH_I	ldsh	[%r23 + 0x019d], %r24
	.word 0xf8454000  ! 257: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf04461c9  ! 258: LDSW_I	ldsw	[%r17 + 0x01c9], %r24
	.word 0xf51d0000  ! 261: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xb48d61e0  ! 263: ANDcc_I	andcc 	%r21, 0x01e0, %r26
	.word 0xf0148000  ! 265: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfe058000  ! 266: LDUW_R	lduw	[%r22 + %r0], %r31
	setx	0x980d11900003a10, %g1, %r10
	.word 0x819a8000  ! 268: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95a1fd  ! 271: WRPR_PSTATE_I	wrpr	%r22, 0x01fd, %pstate
	setx	data_start_3, %g1, %r21
	.word 0xbac5c000  ! 274: ADDCcc_R	addccc 	%r23, %r0, %r29
	setx	data_start_1, %g1, %r21
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55615c  ! 278: LDSH_I	ldsh	[%r21 + 0x015c], %r31
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 283: RDPR_PSTATE	<illegal instruction>
	.word 0xfc1d208b  ! 284: LDD_I	ldd	[%r20 + 0x008b], %r30
	.word 0xf404c000  ! 285: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb7508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xb5518000  ! 288: RDPR_PSTATE	<illegal instruction>
	.word 0xfa144000  ! 292: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xbd2c9000  ! 295: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xb9540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xf40ce05b  ! 299: LDUB_I	ldub	[%r19 + 0x005b], %r26
	.word 0xb5540000  ! 301: RDPR_GL	<illegal instruction>
	.word 0xf65d0000  ! 302: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xfc044000  ! 307: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xb53d5000  ! 309: SRAX_R	srax	%r21, %r0, %r26
	.word 0xb4b5e171  ! 311: ORNcc_I	orncc 	%r23, 0x0171, %r26
	.word 0xf405a185  ! 315: LDUW_I	lduw	[%r22 + 0x0185], %r26
	.word 0xf85dc000  ! 316: LDX_R	ldx	[%r23 + %r0], %r28
	mov	1, %r12
	.word 0xa1930000  ! 318: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd500000  ! 320: RDPR_TPC	<illegal instruction>
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41ca13a  ! 323: LDD_I	ldd	[%r18 + 0x013a], %r26
	.word 0xf04d20f8  ! 324: LDSB_I	ldsb	[%r20 + 0x00f8], %r24
	.word 0xbe95e1ff  ! 327: ORcc_I	orcc 	%r23, 0x01ff, %r31
	.word 0xf654e0a0  ! 329: LDSH_I	ldsh	[%r19 + 0x00a0], %r27
	.word 0xfe0da0ef  ! 331: LDUB_I	ldub	[%r22 + 0x00ef], %r31
	.word 0xfe4d60e6  ! 332: LDSB_I	ldsb	[%r21 + 0x00e6], %r31
	.word 0xb37da401  ! 333: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xf45de0bc  ! 336: LDX_I	ldx	[%r23 + 0x00bc], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb151c000  ! 342: RDPR_TL	<illegal instruction>
	.word 0xfa4ca169  ! 344: LDSB_I	ldsb	[%r18 + 0x0169], %r29
	.word 0xfe044000  ! 345: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf05cc000  ! 347: LDX_R	ldx	[%r19 + %r0], %r24
	setx	0x18c2d30d0000bed1, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4544000  ! 350: LDSH_R	ldsh	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf01420a8  ! 362: LDUH_I	lduh	[%r16 + 0x00a8], %r24
	.word 0xfc548000  ! 363: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xb5500000  ! 365: RDPR_TPC	<illegal instruction>
	.word 0xbec4a1db  ! 366: ADDCcc_I	addccc 	%r18, 0x01db, %r31
	.word 0xfe048000  ! 368: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf81c8000  ! 372: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf91da0a9  ! 382: LDDF_I	ldd	[%r22, 0x00a9], %f28
	.word 0xf45c2150  ! 383: LDX_I	ldx	[%r16 + 0x0150], %r26
	setx	0xe338306b00009bd4, %g1, %r10
	.word 0x839a8000  ! 387: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf81dc000  ! 388: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xfa4461bb  ! 391: LDSW_I	ldsw	[%r17 + 0x01bb], %r29
	.word 0xb0c40000  ! 392: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xb6948000  ! 395: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xf614a077  ! 397: LDUH_I	lduh	[%r18 + 0x0077], %r27
	.word 0x8794a1b0  ! 400: WRPR_TT_I	wrpr	%r18, 0x01b0, %tt
	.word 0xf2550000  ! 401: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xbb518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xb5500000  ! 404: RDPR_TPC	<illegal instruction>
	.word 0xfe1da14b  ! 406: LDD_I	ldd	[%r22 + 0x014b], %r31
	.word 0xfc4da0f2  ! 410: LDSB_I	ldsb	[%r22 + 0x00f2], %r30
	.word 0xf40ca137  ! 413: LDUB_I	ldub	[%r18 + 0x0137], %r26
	.word 0xf4548000  ! 414: LDSH_R	ldsh	[%r18 + %r0], %r26
	mov	1, %r12
	.word 0xa1930000  ! 415: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf204a061  ! 416: LDUW_I	lduw	[%r18 + 0x0061], %r25
	setx	data_start_5, %g1, %r19
	.word 0xf00c4000  ! 428: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0x85942167  ! 433: WRPR_TSTATE_I	wrpr	%r16, 0x0167, %tstate
	.word 0xf8548000  ! 434: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf25c4000  ! 435: LDX_R	ldx	[%r17 + %r0], %r25
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 439: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 441: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 450: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xbf643801  ! 459: MOVcc_I	<illegal instruction>
	.word 0xb13d6001  ! 460: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0x9194e046  ! 461: WRPR_PIL_I	wrpr	%r19, 0x0046, %pil
	.word 0xf8058000  ! 462: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xf41c4000  ! 464: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xf21ce11b  ! 467: LDD_I	ldd	[%r19 + 0x011b], %r25
	.word 0xfa55e154  ! 469: LDSH_I	ldsh	[%r23 + 0x0154], %r29
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5350000  ! 473: SRL_R	srl 	%r20, %r0, %r26
	mov	0, %r12
	.word 0xa1930000  ! 476: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa054000  ! 478: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xb5504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a12b  ! 487: WRPR_PSTATE_I	wrpr	%r18, 0x012b, %pstate
	.word 0x8394e077  ! 488: WRPR_TNPC_I	wrpr	%r19, 0x0077, %tnpc
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c2130  ! 493: LDSB_I	ldsb	[%r16 + 0x0130], %r26
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 495: RDPR_TICK	<illegal instruction>
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0148000  ! 498: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xb550c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0x8195a15a  ! 508: WRPR_TPC_I	wrpr	%r22, 0x015a, %tpc
	.word 0xf84da14c  ! 512: LDSB_I	ldsb	[%r22 + 0x014c], %r28
	.word 0xfa044000  ! 513: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf254c000  ! 516: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0x8994a0c2  ! 522: WRPR_TICK_I	wrpr	%r18, 0x00c2, %tick
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa454000  ! 526: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf455a0ca  ! 527: LDSH_I	ldsh	[%r22 + 0x00ca], %r26
	.word 0xf415e0ea  ! 529: LDUH_I	lduh	[%r23 + 0x00ea], %r26
	.word 0xfe548000  ! 533: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xfe1cc000  ! 538: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf80d0000  ! 540: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfa14e066  ! 543: LDUH_I	lduh	[%r19 + 0x0066], %r29
	setx	0x380c334200005d91, %g1, %r10
	.word 0x839a8000  ! 544: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb695c000  ! 548: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xf004601a  ! 549: LDUW_I	lduw	[%r17 + 0x001a], %r24
	.word 0xb6b44000  ! 551: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xf2154000  ! 554: LDUH_R	lduh	[%r21 + %r0], %r25
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d0000  ! 565: LDSB_R	ldsb	[%r20 + %r0], %r25
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ce0eb  ! 569: LDX_I	ldx	[%r19 + 0x00eb], %r24
	mov	0, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe1da0cd  ! 573: LDD_I	ldd	[%r22 + 0x00cd], %r31
	.word 0xf11da0c1  ! 577: LDDF_I	ldd	[%r22, 0x00c1], %f24
	.word 0x83956114  ! 579: WRPR_TNPC_I	wrpr	%r21, 0x0114, %tnpc
	.word 0xfe04c000  ! 582: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xb4c421b5  ! 585: ADDCcc_I	addccc 	%r16, 0x01b5, %r26
	setx	data_start_2, %g1, %r16
	.word 0xf64c213b  ! 587: LDSB_I	ldsb	[%r16 + 0x013b], %r27
	.word 0xbf51c000  ! 590: RDPR_TL	<illegal instruction>
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 598: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb3504000  ! 599: RDPR_TNPC	<illegal instruction>
	.word 0xfc4de04d  ! 604: LDSB_I	ldsb	[%r23 + 0x004d], %r30
	.word 0xba0ca1d5  ! 605: AND_I	and 	%r18, 0x01d5, %r29
	.word 0xbf504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xfa05e00f  ! 609: LDUW_I	lduw	[%r23 + 0x000f], %r29
	.word 0xb7500000  ! 612: RDPR_TPC	<illegal instruction>
	.word 0xf11da1d2  ! 615: LDDF_I	ldd	[%r22, 0x01d2], %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795a1b3  ! 619: WRPR_TT_I	wrpr	%r22, 0x01b3, %tt
	.word 0xf01d0000  ! 620: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xfa14a1ef  ! 622: LDUH_I	lduh	[%r18 + 0x01ef], %r29
	.word 0xfe044000  ! 623: LDUW_R	lduw	[%r17 + %r0], %r31
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d0000  ! 631: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xbc9d4000  ! 632: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xb48c0000  ! 636: ANDcc_R	andcc 	%r16, %r0, %r26
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xf205a0da  ! 648: LDUW_I	lduw	[%r22 + 0x00da], %r25
	setx	0x5ff5d99b00004f9a, %g1, %r10
	.word 0x839a8000  ! 655: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa544000  ! 657: LDSH_R	ldsh	[%r17 + %r0], %r29
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e131  ! 659: WRPR_PIL_I	wrpr	%r23, 0x0131, %pil
	.word 0xfd1d8000  ! 662: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfc0c0000  ! 665: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf804a1ca  ! 668: LDUW_I	lduw	[%r18 + 0x01ca], %r28
	.word 0xfc1c0000  ! 669: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0x8395e01e  ! 670: WRPR_TNPC_I	wrpr	%r23, 0x001e, %tnpc
	.word 0xf40c6168  ! 671: LDUB_I	ldub	[%r17 + 0x0168], %r26
	.word 0xf6448000  ! 672: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf64c8000  ! 674: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0x89952074  ! 675: WRPR_TICK_I	wrpr	%r20, 0x0074, %tick
	setx	0x7aab0e0d0000490d, %g1, %r10
	.word 0x839a8000  ! 678: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc24a11f  ! 679: SUB_I	sub 	%r18, 0x011f, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1d61dc  ! 682: LDD_I	ldd	[%r21 + 0x01dc], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf214e195  ! 693: LDUH_I	lduh	[%r19 + 0x0195], %r25
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1d201b  ! 696: LDDF_I	ldd	[%r20, 0x001b], %f29
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 701: RDPR_GL	<illegal instruction>
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5cc000  ! 703: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfb1d4000  ! 704: LDDF_R	ldd	[%r21, %r0], %f29
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 707: RDPR_PSTATE	<illegal instruction>
	setx	0x82f777140000a948, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc0420d4  ! 711: LDUW_I	lduw	[%r16 + 0x00d4], %r30
	.word 0xf20da0eb  ! 714: LDUB_I	ldub	[%r22 + 0x00eb], %r25
	.word 0x8594600d  ! 717: WRPR_TSTATE_I	wrpr	%r17, 0x000d, %tstate
	setx	0x4dc97f6e0000ef1f, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7510000  ! 727: RDPR_TICK	<illegal instruction>
	.word 0xf41da1bd  ! 729: LDD_I	ldd	[%r22 + 0x01bd], %r26
	.word 0xf85d60c3  ! 730: LDX_I	ldx	[%r21 + 0x00c3], %r28
	.word 0xf4546167  ! 734: LDSH_I	ldsh	[%r17 + 0x0167], %r26
	.word 0xf0558000  ! 736: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb2858000  ! 737: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xb9643801  ! 741: MOVcc_I	<illegal instruction>
	.word 0xfb1c4000  ! 742: LDDF_R	ldd	[%r17, %r0], %f29
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35a001  ! 754: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0x8594604d  ! 756: WRPR_TSTATE_I	wrpr	%r17, 0x004d, %tstate
	.word 0xba856098  ! 757: ADDcc_I	addcc 	%r21, 0x0098, %r29
	.word 0xf41d0000  ! 758: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xbb510000  ! 760: RDPR_TICK	<illegal instruction>
	.word 0xf654c000  ! 761: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xfd1da02a  ! 768: LDDF_I	ldd	[%r22, 0x002a], %f30
	.word 0xf8154000  ! 771: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xf91ca010  ! 773: LDDF_I	ldd	[%r18, 0x0010], %f28
	.word 0xf655207e  ! 775: LDSH_I	ldsh	[%r20 + 0x007e], %r27
	.word 0xf4444000  ! 777: LDSW_R	ldsw	[%r17 + %r0], %r26
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c8000  ! 781: SLL_R	sll 	%r18, %r0, %r24
	.word 0xb73ce001  ! 787: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xf20d2137  ! 788: LDUB_I	ldub	[%r20 + 0x0137], %r25
	mov	1, %r12
	.word 0x8f930000  ! 790: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa546151  ! 796: LDSH_I	ldsh	[%r17 + 0x0151], %r29
	mov	0, %r12
	.word 0x8f930000  ! 797: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa450000  ! 798: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf214a108  ! 799: LDUH_I	lduh	[%r18 + 0x0108], %r25
	.word 0xb9540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xfc4d4000  ! 805: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf31da1f7  ! 806: LDDF_I	ldd	[%r22, 0x01f7], %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x839421d2  ! 809: WRPR_TNPC_I	wrpr	%r16, 0x01d2, %tnpc
	setx	data_start_5, %g1, %r17
	.word 0xf40ce0e7  ! 812: LDUB_I	ldub	[%r19 + 0x00e7], %r26
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4448000  ! 820: LDSW_R	ldsw	[%r18 + %r0], %r26
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95e12c  ! 827: WRPR_PSTATE_I	wrpr	%r23, 0x012c, %pstate
	.word 0xfc458000  ! 835: LDSW_R	ldsw	[%r22 + %r0], %r30
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20ca1a9  ! 838: LDUB_I	ldub	[%r18 + 0x01a9], %r25
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8794a156  ! 843: WRPR_TT_I	wrpr	%r18, 0x0156, %tt
	.word 0xfa1dc000  ! 844: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xb8c5e1b7  ! 845: ADDCcc_I	addccc 	%r23, 0x01b7, %r28
	.word 0xf014a1f3  ! 846: LDUH_I	lduh	[%r18 + 0x01f3], %r24
	.word 0xfc0d602b  ! 847: LDUB_I	ldub	[%r21 + 0x002b], %r30
	.word 0xf014609b  ! 849: LDUH_I	lduh	[%r17 + 0x009b], %r24
	.word 0xfe454000  ! 853: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xb4a561bb  ! 856: SUBcc_I	subcc 	%r21, 0x01bb, %r26
	.word 0xfc054000  ! 857: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf05d4000  ! 858: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf6548000  ! 861: LDSH_R	ldsh	[%r18 + %r0], %r27
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe544000  ! 867: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf614616c  ! 869: LDUH_I	lduh	[%r17 + 0x016c], %r27
	.word 0xfe456184  ! 871: LDSW_I	ldsw	[%r21 + 0x0184], %r31
	setx	0xe062afdb0000ea48, %g1, %r10
	.word 0x839a8000  ! 874: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x82c22c3e00007ad1, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf815e173  ! 882: LDUH_I	lduh	[%r23 + 0x0173], %r28
	.word 0xf044214c  ! 883: LDSW_I	ldsw	[%r16 + 0x014c], %r24
	.word 0xf51d8000  ! 885: LDDF_R	ldd	[%r22, %r0], %f26
	setx	0x299923ca0000095d, %g1, %r10
	.word 0x839a8000  ! 887: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8148000  ! 890: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfa44c000  ! 892: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0x8d9461f4  ! 893: WRPR_PSTATE_I	wrpr	%r17, 0x01f4, %pstate
	.word 0xf65d4000  ! 895: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf005a02e  ! 900: LDUW_I	lduw	[%r22 + 0x002e], %r24
	.word 0xfe456149  ! 906: LDSW_I	ldsw	[%r21 + 0x0149], %r31
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 910: RDPR_TNPC	<illegal instruction>
	.word 0xfe44e04c  ! 912: LDSW_I	ldsw	[%r19 + 0x004c], %r31
	.word 0xfc4d8000  ! 914: LDSB_R	ldsb	[%r22 + %r0], %r30
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e1f3  ! 921: WRPR_PIL_I	wrpr	%r23, 0x01f3, %pil
	.word 0xb7508000  ! 922: RDPR_TSTATE	<illegal instruction>
	.word 0xb0b5c000  ! 924: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xf645e0d4  ! 926: LDSW_I	ldsw	[%r23 + 0x00d4], %r27
	.word 0xbb500000  ! 927: RDPR_TPC	<illegal instruction>
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d0000  ! 929: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xfa1d0000  ! 931: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xfc04200f  ! 932: LDUW_I	lduw	[%r16 + 0x000f], %r30
	.word 0xb551c000  ! 933: RDPR_TL	<illegal instruction>
	.word 0xbb510000  ! 935: RDPR_TICK	<illegal instruction>
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 941: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1ce0a4  ! 943: LDD_I	ldd	[%r19 + 0x00a4], %r31
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d61b4  ! 948: LDUB_I	ldub	[%r21 + 0x01b4], %r28
	setx	0xbe71b29b00004b89, %g1, %r10
	.word 0x839a8000  ! 951: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe0de158  ! 953: AND_I	and 	%r23, 0x0158, %r31
	.word 0xfa0d0000  ! 959: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xf2048000  ! 962: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfa4cc000  ! 963: LDSB_R	ldsb	[%r19 + %r0], %r29
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51d0000  ! 967: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xf44d614b  ! 970: LDSB_I	ldsb	[%r21 + 0x014b], %r26
	.word 0xfa1561ef  ! 973: LDUH_I	lduh	[%r21 + 0x01ef], %r29
	.word 0xf91da0d5  ! 975: LDDF_I	ldd	[%r22, 0x00d5], %f28
	.word 0xbd504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xf80ca0f7  ! 978: LDUB_I	ldub	[%r18 + 0x00f7], %r28
	.word 0x859521f1  ! 981: WRPR_TSTATE_I	wrpr	%r20, 0x01f1, %tstate
	.word 0xb8a48000  ! 985: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xbb51c000  ! 993: RDPR_TL	<illegal instruction>
	.word 0xb1518000  ! 998: RDPR_PSTATE	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbbaa0820  ! 5: FMOVA	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r21
	.word 0xba0d6070  ! 11: AND_I	and 	%r21, 0x0070, %r29
	.word 0xb1a00560  ! 13: FSQRTq	fsqrt	
	.word 0xbda408c0  ! 15: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb9504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0xb7a4c920  ! 20: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb5abc820  ! 22: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbd520000  ! 23: RDPR_PIL	<illegal instruction>
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a509a0  ! 25: FDIVs	fdivs	%f20, %f0, %f24
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 32: RDPR_TSTATE	<illegal instruction>
	.word 0x8995215e  ! 34: WRPR_TICK_I	wrpr	%r20, 0x015e, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 36: RDPR_TICK	<illegal instruction>
	.word 0xbba80820  ! 40: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xba844000  ! 41: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xb9a589e0  ! 42: FDIVq	dis not found

	.word 0xb3a00540  ! 45: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 47: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 50: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c9e0  ! 51: FDIVq	dis not found

	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a01a  ! 53: WRPR_TSTATE_I	wrpr	%r22, 0x001a, %tstate
	.word 0xb934a001  ! 54: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xbe8d4000  ! 57: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xbda00520  ! 59: FSQRTs	fsqrt	
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbc208c  ! 64: XNORcc_I	xnorcc 	%r16, 0x008c, %r30
	setx	data_start_4, %g1, %r18
	.word 0xb9a408a0  ! 68: FSUBs	fsubs	%f16, %f0, %f28
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9420f9  ! 72: WRPR_PSTATE_I	wrpr	%r16, 0x00f9, %pstate
	.word 0xb5a8c820  ! 75: FMOVL	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0xa1930000  ! 76: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfa489c0  ! 77: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xbf518000  ! 81: RDPR_PSTATE	<illegal instruction>
	.word 0xbba4c9c0  ! 82: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb9a84820  ! 83: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 92: RDPR_TPC	<illegal instruction>
	.word 0xb37c2401  ! 93: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xb3abc820  ! 95: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a8c820  ! 96: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5510000  ! 100: RDPR_TICK	<illegal instruction>
	.word 0xbfa4c9e0  ! 101: FDIVq	dis not found

	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 104: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab8820  ! 105: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a81420  ! 107: FMOVRNZ	dis not found

	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 111: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7518000  ! 112: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a00020  ! 113: FMOVs	fmovs	%f0, %f26
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 121: FMOVs	fmovs	%f0, %f29
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	setx	0x2c7d115800002b93, %g1, %r10
	.word 0x839a8000  ! 123: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba488c0  ! 124: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbe0c2187  ! 127: AND_I	and 	%r16, 0x0187, %r31
	.word 0xb7a48860  ! 131: FADDq	dis not found

	.word 0xbb480000  ! 132: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3a5c9e0  ! 136: FDIVq	dis not found

	.word 0xb5aa4820  ! 137: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb415a19c  ! 142: OR_I	or 	%r22, 0x019c, %r26
	.word 0xb7a81820  ! 145: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbcbda1ef  ! 150: XNORcc_I	xnorcc 	%r22, 0x01ef, %r30
	.word 0xb7a80c20  ! 154: FMOVRLZ	dis not found

	.word 0x879461aa  ! 155: WRPR_TT_I	wrpr	%r17, 0x01aa, %tt
	.word 0xb3a54920  ! 158: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb0c56014  ! 159: ADDCcc_I	addccc 	%r21, 0x0014, %r24
	.word 0xbc05e1c8  ! 160: ADD_I	add 	%r23, 0x01c8, %r30
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	setx	0x3ce0b8860000ed06, %g1, %r10
	.word 0x839a8000  ! 163: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a40860  ! 164: FADDq	dis not found

	.word 0xb1a589c0  ! 165: FDIVd	fdivd	%f22, %f0, %f24
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 177: FMOVCC	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 179: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a88820  ! 181: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbba88820  ! 182: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbc2c8000  ! 186: ANDN_R	andn 	%r18, %r0, %r30
	.word 0xb9641800  ! 187: MOVcc_R	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xb7a44940  ! 194: FMULd	fmuld	%f48, %f0, %f58
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 202: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb150c000  ! 203: RDPR_TT	<illegal instruction>
	.word 0xbc34a1e3  ! 205: ORN_I	orn 	%r18, 0x01e3, %r30
	.word 0xb9aa4820  ! 207: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5508000  ! 208: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a00520  ! 210: FSQRTs	fsqrt	
	.word 0xbda00540  ! 211: FSQRTd	fsqrt	
	.word 0xb285e182  ! 213: ADDcc_I	addcc 	%r23, 0x0182, %r25
	.word 0xbf51c000  ! 214: RDPR_TL	<illegal instruction>
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 217: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb5aac820  ! 218: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba00520  ! 220: FSQRTs	fsqrt	
	.word 0xb7aa8820  ! 224: FMOVG	fmovs	%fcc1, %f0, %f27
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	setx	0x180a7cf00005c58, %g1, %r10
	.word 0x839a8000  ! 229: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394e166  ! 233: WRPR_TNPC_I	wrpr	%r19, 0x0166, %tnpc
	.word 0xbb3c5000  ! 241: SRAX_R	srax	%r17, %r0, %r29
	.word 0x8d95619f  ! 243: WRPR_PSTATE_I	wrpr	%r21, 0x019f, %pstate
	.word 0x91942072  ! 245: WRPR_PIL_I	wrpr	%r16, 0x0072, %pil
	.word 0xbba54860  ! 247: FADDq	dis not found

	.word 0xb5aa0820  ! 251: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb48d21be  ! 263: ANDcc_I	andcc 	%r20, 0x01be, %r26
	.word 0xb1a5c9e0  ! 267: FDIVq	dis not found

	setx	0x43ba120700008d95, %g1, %r10
	.word 0x819a8000  ! 268: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d946173  ! 271: WRPR_PSTATE_I	wrpr	%r17, 0x0173, %pstate
	setx	data_start_7, %g1, %r21
	.word 0xb7a588a0  ! 273: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb6c5c000  ! 274: ADDCcc_R	addccc 	%r23, %r0, %r27
	setx	data_start_3, %g1, %r19
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 280: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c960  ! 282: FMULq	dis not found

	.word 0xbf518000  ! 283: RDPR_PSTATE	<illegal instruction>
	.word 0xb5508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xb5518000  ! 288: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a44860  ! 289: FADDq	dis not found

	.word 0xb9a58860  ! 290: FADDq	dis not found

	.word 0xb3ab8820  ! 291: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3aa4820  ! 293: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbbabc820  ! 294: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbd2c5000  ! 295: SLLX_R	sllx	%r17, %r0, %r30
	.word 0xb7540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xbb540000  ! 301: RDPR_GL	<illegal instruction>
	.word 0xb1a40820  ! 303: FADDs	fadds	%f16, %f0, %f24
	.word 0xb5a00520  ! 304: FSQRTs	fsqrt	
	.word 0xb93cd000  ! 309: SRAX_R	srax	%r19, %r0, %r28
	.word 0xb5a80820  ! 310: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbab5a0bd  ! 311: ORNcc_I	orncc 	%r22, 0x00bd, %r29
	.word 0xbfa81c20  ! 313: FMOVRGEZ	dis not found

	.word 0xbbab8820  ! 317: FMOVPOS	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0xa1930000  ! 318: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5500000  ! 320: RDPR_TPC	<illegal instruction>
	.word 0xb5a40820  ! 321: FADDs	fadds	%f16, %f0, %f26
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba95618b  ! 327: ORcc_I	orcc 	%r21, 0x018b, %r29
	.word 0xb3a58820  ! 330: FADDs	fadds	%f22, %f0, %f25
	.word 0xbd7d2401  ! 333: MOVR_I	movre	%r20, 0x1, %r30
	.word 0xb3a00020  ! 334: FMOVs	fmovs	%f0, %f25
	.word 0xb5ab0820  ! 338: FMOVGU	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 342: RDPR_TL	<illegal instruction>
	setx	0xa2d085600000ce56, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a5c8a0  ! 358: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb3a9c820  ! 360: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c9c0  ! 361: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xb3a4c940  ! 364: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb3500000  ! 365: RDPR_TPC	<illegal instruction>
	.word 0xbec4e15a  ! 366: ADDCcc_I	addccc 	%r19, 0x015a, %r31
	.word 0xbda00520  ! 370: FSQRTs	fsqrt	
	.word 0xb9a00560  ! 371: FSQRTq	fsqrt	
	.word 0xbba81420  ! 384: FMOVRNZ	dis not found

	setx	0xe288c92200002858, %g1, %r10
	.word 0x839a8000  ! 387: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6c50000  ! 392: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xba958000  ! 395: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xb9a80c20  ! 398: FMOVRLZ	dis not found

	.word 0x8794e05a  ! 400: WRPR_TT_I	wrpr	%r19, 0x005a, %tt
	.word 0xb1518000  ! 402: RDPR_PSTATE	<illegal instruction>
	.word 0xb3500000  ! 404: RDPR_TPC	<illegal instruction>
	.word 0xb5aac820  ! 405: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a50860  ! 407: FADDq	dis not found

	.word 0xb7a81420  ! 408: FMOVRNZ	dis not found

	.word 0xbba48860  ! 411: FADDq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 415: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_2, %g1, %r16
	.word 0xb5a80c20  ! 421: FMOVRLZ	dis not found

	.word 0xbfa8c820  ! 422: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1a9c820  ! 424: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa0820  ! 430: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00020  ! 432: FMOVs	fmovs	%f0, %f28
	.word 0x8594e16e  ! 433: WRPR_TSTATE_I	wrpr	%r19, 0x016e, %tstate
	.word 0xbda00520  ! 437: FSQRTs	fsqrt	
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 439: RDPR_TT	<illegal instruction>
	.word 0xb9a9c820  ! 440: FMOVVS	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0x8f930000  ! 441: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba88820  ! 442: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80820  ! 443: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba00020  ! 445: FMOVs	fmovs	%f0, %f29
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 448: FSQRTs	fsqrt	
	.word 0xbf480000  ! 450: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9a489a0  ! 451: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbdabc820  ! 452: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbf500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xb7a509a0  ! 455: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xbda5c8e0  ! 456: FSUBq	dis not found

	.word 0xbd643801  ! 459: MOVcc_I	<illegal instruction>
	.word 0xb13ce001  ! 460: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0x91956102  ! 461: WRPR_PIL_I	wrpr	%r21, 0x0102, %pil
	.word 0xbba489c0  ! 465: FDIVd	fdivd	%f18, %f0, %f60
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb935c000  ! 473: SRL_R	srl 	%r23, %r0, %r28
	mov	2, %r12
	.word 0xa1930000  ! 476: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a48920  ! 480: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb5a5c940  ! 483: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb3504000  ! 484: RDPR_TNPC	<illegal instruction>
	.word 0x8d942081  ! 487: WRPR_PSTATE_I	wrpr	%r16, 0x0081, %pstate
	.word 0x8394e1ad  ! 488: WRPR_TNPC_I	wrpr	%r19, 0x01ad, %tnpc
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 492: FMOVA	fmovs	%fcc1, %f0, %f28
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 495: RDPR_TICK	<illegal instruction>
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 500: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbf50c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0xbda90820  ! 505: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0x8194619d  ! 508: WRPR_TPC_I	wrpr	%r17, 0x019d, %tpc
	.word 0xbfa548a0  ! 511: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xbba80420  ! 514: FMOVRZ	dis not found

	.word 0xbfa40960  ! 515: FMULq	dis not found

	.word 0xb9a00020  ! 518: FMOVs	fmovs	%f0, %f28
	.word 0xb7a84820  ! 520: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0x8994a12a  ! 522: WRPR_TICK_I	wrpr	%r18, 0x012a, %tick
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 525: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81c20  ! 531: FMOVRGEZ	dis not found

	.word 0xb3a00540  ! 537: FSQRTd	fsqrt	
	.word 0xbba00560  ! 539: FSQRTq	fsqrt	
	.word 0xb7ab4820  ! 542: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	0x10567fd600001ed3, %g1, %r10
	.word 0x839a8000  ! 544: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a8c820  ! 547: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbc954000  ! 548: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xbab48000  ! 551: ORNcc_R	orncc 	%r18, %r0, %r29
	.word 0xb7a00540  ! 553: FSQRTd	fsqrt	
	.word 0xbdaa0820  ! 557: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbda80420  ! 558: FMOVRZ	dis not found

	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c860  ! 560: FADDq	dis not found

	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a81420  ! 576: FMOVRNZ	dis not found

	.word 0xbfa50920  ! 578: FMULs	fmuls	%f20, %f0, %f31
	.word 0x8395614c  ! 579: WRPR_TNPC_I	wrpr	%r21, 0x014c, %tnpc
	.word 0xb3a80420  ! 584: FMOVRZ	dis not found

	.word 0xb4c4613f  ! 585: ADDCcc_I	addccc 	%r17, 0x013f, %r26
	setx	data_start_2, %g1, %r17
	.word 0xb3aa0820  ! 589: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb351c000  ! 590: RDPR_TL	<illegal instruction>
	.word 0xbdab4820  ! 591: FMOVCC	fmovs	%fcc1, %f0, %f30
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 594: FMOVRGEZ	dis not found

	.word 0xb69c0000  ! 598: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xbd504000  ! 599: RDPR_TNPC	<illegal instruction>
	.word 0xbe0d60d2  ! 605: AND_I	and 	%r21, 0x00d2, %r31
	.word 0xbd504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xb3a588c0  ! 608: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xbb500000  ! 612: RDPR_TPC	<illegal instruction>
	.word 0xb9a80820  ! 614: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795605d  ! 619: WRPR_TT_I	wrpr	%r21, 0x005d, %tt
	.word 0xb9a81420  ! 621: FMOVRNZ	dis not found

	.word 0xb1a449e0  ! 624: FDIVq	dis not found

	.word 0xbfa50940  ! 625: FMULd	fmuld	%f20, %f0, %f62
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a488c0  ! 627: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb7a58920  ! 629: FMULs	fmuls	%f22, %f0, %f27
	.word 0xba9d4000  ! 632: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xb48d8000  ! 636: ANDcc_R	andcc 	%r22, %r0, %r26
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 638: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 642: FSQRTq	fsqrt	
	setx	data_start_2, %g1, %r23
	.word 0xb1a80420  ! 644: FMOVRZ	dis not found

	.word 0xbda80420  ! 654: FMOVRZ	dis not found

	setx	0xa72cf52400009e10, %g1, %r10
	.word 0x839a8000  ! 655: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda48920  ! 656: FMULs	fmuls	%f18, %f0, %f30
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e1c6  ! 659: WRPR_PIL_I	wrpr	%r19, 0x01c6, %pil
	.word 0xb1ab0820  ! 660: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0x8395612b  ! 670: WRPR_TNPC_I	wrpr	%r21, 0x012b, %tnpc
	.word 0xb1a81420  ! 673: FMOVRNZ	dis not found

	.word 0x8995215a  ! 675: WRPR_TICK_I	wrpr	%r20, 0x015a, %tick
	.word 0xb3a448c0  ! 677: FSUBd	fsubd	%f48, %f0, %f56
	setx	0xfa9ed45100007c9a, %g1, %r10
	.word 0x839a8000  ! 678: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb824a180  ! 679: SUB_I	sub 	%r18, 0x0180, %r28
	.word 0xb3aa0820  ! 680: FMOVA	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a80c20  ! 683: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 701: RDPR_GL	<illegal instruction>
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c820  ! 706: FADDs	fadds	%f19, %f0, %f27
	.word 0xb7518000  ! 707: RDPR_PSTATE	<illegal instruction>
	setx	0xce1196fb00000eda, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a548e0  ! 709: FSUBq	dis not found

	.word 0xbda81820  ! 712: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8595a142  ! 717: WRPR_TSTATE_I	wrpr	%r22, 0x0142, %tstate
	.word 0xbda4c8e0  ! 718: FSUBq	dis not found

	setx	0x581b6d7400002a04, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7abc820  ! 721: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda00560  ! 722: FSQRTq	fsqrt	
	.word 0xb1a588c0  ! 724: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb3a489e0  ! 725: FDIVq	dis not found

	.word 0xb5510000  ! 727: RDPR_TICK	<illegal instruction>
	.word 0xb9a81820  ! 731: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5ab8820  ! 732: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a448a0  ! 735: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xbc858000  ! 737: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xb1a94820  ! 739: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3643801  ! 741: MOVcc_I	<illegal instruction>
	.word 0xb9a4c8c0  ! 743: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb1a00560  ! 745: FSQRTq	fsqrt	
	.word 0xbfa88820  ! 747: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c860  ! 749: FADDq	dis not found

	.word 0xb1a449a0  ! 752: FDIVs	fdivs	%f17, %f0, %f24
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34a001  ! 754: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0x8594e070  ! 756: WRPR_TSTATE_I	wrpr	%r19, 0x0070, %tstate
	.word 0xb085219c  ! 757: ADDcc_I	addcc 	%r20, 0x019c, %r24
	.word 0xb1510000  ! 760: RDPR_TICK	<illegal instruction>
	.word 0xb9a54940  ! 764: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb9a00540  ! 767: FSQRTd	fsqrt	
	.word 0xb5a58960  ! 769: FMULq	dis not found

	.word 0xb7ab0820  ! 776: FMOVGU	fmovs	%fcc1, %f0, %f27
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c8000  ! 781: SLL_R	sll 	%r18, %r0, %r27
	.word 0xbda408a0  ! 782: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb93ca001  ! 787: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xb5a98820  ! 789: FMOVNEG	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 790: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 797: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7540000  ! 800: RDPR_GL	<illegal instruction>
	.word 0xbfa94820  ! 801: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00040  ! 802: FMOVd	fmovd	%f0, %f26
	.word 0xb1a00520  ! 804: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x83946049  ! 809: WRPR_TNPC_I	wrpr	%r17, 0x0049, %tnpc
	setx	data_start_3, %g1, %r20
	.word 0xb9a50820  ! 813: FADDs	fadds	%f20, %f0, %f28
	.word 0xb5a00020  ! 817: FMOVs	fmovs	%f0, %f26
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 824: FMOVRZ	dis not found

	.word 0x8d952136  ! 827: WRPR_PSTATE_I	wrpr	%r20, 0x0136, %pstate
	.word 0xbba98820  ! 832: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a408c0  ! 834: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb1a5c920  ! 836: FMULs	fmuls	%f23, %f0, %f24
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 840: FSQRTq	fsqrt	
	.word 0xb5a4c8a0  ! 841: FSUBs	fsubs	%f19, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x879460bb  ! 843: WRPR_TT_I	wrpr	%r17, 0x00bb, %tt
	.word 0xb6c4607e  ! 845: ADDCcc_I	addccc 	%r17, 0x007e, %r27
	.word 0xbda5c940  ! 850: FMULd	fmuld	%f54, %f0, %f30
	.word 0xb9a408c0  ! 852: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbba00040  ! 854: FMOVd	fmovd	%f0, %f60
	.word 0xb5a80c20  ! 855: FMOVRLZ	dis not found

	.word 0xb4a5a1c9  ! 856: SUBcc_I	subcc 	%r22, 0x01c9, %r26
	.word 0xbdab8820  ! 859: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00040  ! 862: FMOVd	fmovd	%f0, %f24
	.word 0xb3a40840  ! 863: FADDd	faddd	%f16, %f0, %f56
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 865: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbba40840  ! 872: FADDd	faddd	%f16, %f0, %f60
	setx	0xa4718d6a00007c41, %g1, %r10
	.word 0x839a8000  ! 874: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9ab4820  ! 877: FMOVCC	fmovs	%fcc1, %f0, %f28
	setx	0xbb9d4d5d0000de04, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a48840  ! 879: FADDd	faddd	%f18, %f0, %f28
	.word 0xb1a84820  ! 881: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0x71170a20000d892, %g1, %r10
	.word 0x839a8000  ! 887: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a4c8a0  ! 888: FSUBs	fsubs	%f19, %f0, %f24
	.word 0x8d956091  ! 893: WRPR_PSTATE_I	wrpr	%r21, 0x0091, %pstate
	.word 0xbda4c960  ! 894: FMULq	dis not found

	.word 0xb5a4c860  ! 898: FADDq	dis not found

	.word 0xbfa00520  ! 899: FSQRTs	fsqrt	
	.word 0xb1a80c20  ! 903: FMOVRLZ	dis not found

	.word 0xb3a80420  ! 905: FMOVRZ	dis not found

	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 910: RDPR_TNPC	<illegal instruction>
	.word 0xb5a40960  ! 915: FMULq	dis not found

	.word 0xbfa588a0  ! 917: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb3a509c0  ! 918: FDIVd	fdivd	%f20, %f0, %f56
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e111  ! 921: WRPR_PIL_I	wrpr	%r19, 0x0111, %pil
	.word 0xb5508000  ! 922: RDPR_TSTATE	<illegal instruction>
	.word 0xbcb40000  ! 924: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xb7500000  ! 927: RDPR_TPC	<illegal instruction>
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 933: RDPR_TL	<illegal instruction>
	.word 0xb9510000  ! 935: RDPR_TICK	<illegal instruction>
	.word 0xb5ab8820  ! 936: FMOVPOS	fmovs	%fcc1, %f0, %f26
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 939: FSQRTs	fsqrt	
	.word 0xb9a94820  ! 940: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbf508000  ! 941: RDPR_TSTATE	<illegal instruction>
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	setx	0x8b90abb200002cd9, %g1, %r10
	.word 0x839a8000  ! 951: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb00ca101  ! 953: AND_I	and 	%r18, 0x0101, %r24
	.word 0xb3a409a0  ! 958: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xbda00020  ! 961: FMOVs	fmovs	%f0, %f30
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 968: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a84820  ! 969: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a80820  ! 971: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbfaa4820  ! 976: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbf504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0x8595e008  ! 981: WRPR_TSTATE_I	wrpr	%r23, 0x0008, %tstate
	.word 0xb5a8c820  ! 984: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb2a48000  ! 985: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xbfa81820  ! 987: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb551c000  ! 993: RDPR_TL	<illegal instruction>
	.word 0xb5a80820  ! 996: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1518000  ! 998: RDPR_PSTATE	<illegal instruction>

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

	.xword	0x2d965dd5c4090f3a
	.xword	0xd3693b93981b306d
	.xword	0xeee0f676563ee376
	.xword	0x6502c57824bdd03b
	.xword	0xe37ded810e0dcaac
	.xword	0x0d95fb706cf81ad8
	.xword	0xcf005656a51a3ebe
	.xword	0x47409fcad623b55c
	.xword	0xb2fe75de82ad58cd
	.xword	0xa0bd52d2246fbfac
	.xword	0x65df5aa9986a11f6
	.xword	0x5d5586b97f999398
	.xword	0xdc65e6e49562a8c3
	.xword	0x70a4abf10475deef
	.xword	0x90ce88b7b4269cfd
	.xword	0x0a9c953ea5217d33
	.xword	0xe6ba551a25d41236
	.xword	0xb30d0b0506b68af0
	.xword	0x22968346ced64502
	.xword	0xd6fc7d5bc0ac33a6
	.xword	0x1ccd0881aa210a92
	.xword	0xe4f2ea47dfc3cdb4
	.xword	0xc526cabc87f074e2
	.xword	0x82b1af1fb7be5476
	.xword	0x1e84766df5dd7051
	.xword	0x3a1e05a36aee55c9
	.xword	0xed1d9a9cd7867a53
	.xword	0x7b37b52937b6aff2
	.xword	0x9476eca777a5311d
	.xword	0x45788f6e2d4cae05
	.xword	0x2871ed9599eafc5b
	.xword	0xb8393b7f92b98844
	.xword	0x339e405baff56aeb
	.xword	0x19e3d393ee483406
	.xword	0x1d6c89cc3e645120
	.xword	0xb5225fd8146ed662
	.xword	0x5ad77cf805935daf
	.xword	0x0811f1bf18933974
	.xword	0xd7bfa2acef2cdc00
	.xword	0x7d60035f30a2273c
	.xword	0xcf0ba1d70c34a45a
	.xword	0xaaf0787cf5a3e63b
	.xword	0x3516482850531cec
	.xword	0x226d11b374868df8
	.xword	0x6e9f979a4829eac4
	.xword	0x28caf5b64b712417
	.xword	0x91cc19a487fdf422
	.xword	0x3d76008507e70a3f
	.xword	0x7197de422b618bac
	.xword	0x6f6f04ab61bf396a
	.xword	0xce86f9b901df70be
	.xword	0x07cbf3a9648fb5f9
	.xword	0x02ec04d5bf0a22b0
	.xword	0xa13e019457a523eb
	.xword	0x1d71dbcca6b76df9
	.xword	0x8af42cff7961e7f3
	.xword	0xfdc55bcb58a5504a
	.xword	0xc0b061f59a643c78
	.xword	0x16a5373181112871
	.xword	0xfd5087799c3e98cd
	.xword	0xfbe6a66dd327428f
	.xword	0x03cde46ee68919f4
	.xword	0x3ff2166f203e770e
	.xword	0x6e3ab613b811fbda
	.xword	0x59dcbb263bb90d8a
	.xword	0x283f5c0dadc4be12
	.xword	0x5d2a4331f1dcd66f
	.xword	0x18fc62331ef19d28
	.xword	0xab15a8133142fd42
	.xword	0x3ac35cd2221f8b01
	.xword	0xba310bc2828739bb
	.xword	0x77dd464fd68df423
	.xword	0x51f56398bd972dea
	.xword	0x6fe2ab4ce9ac2aa3
	.xword	0x37fef944a51dc7cf
	.xword	0x2b44c3d4f9a2f415
	.xword	0xc43d6b683bc66541
	.xword	0x56eb8fd3b656854c
	.xword	0x4aab9d4245899770
	.xword	0xa8353ccc93c93da6
	.xword	0x22f9274794da7609
	.xword	0xf7b727c8538e5f96
	.xword	0x68adff3649199e99
	.xword	0x6ae3c02fccf40a41
	.xword	0xfae5333275a4cd87
	.xword	0x21431ecf0c2acfcf
	.xword	0x05612628a3674ea5
	.xword	0x39a751aae43632de
	.xword	0x4e53468b13e5e2f6
	.xword	0xe4fb26160ff6baf7
	.xword	0xe5624886b367d972
	.xword	0x48ebf6cbc3846b17
	.xword	0xe4259090bad8939e
	.xword	0x299c4687e418117f
	.xword	0xd595f806eaf4a940
	.xword	0xe6774c3e024f8313
	.xword	0x1dfd69915308c9dd
	.xword	0xed5df340a3f155b6
	.xword	0x7eaa7fe5bad7ed2d
	.xword	0x97b17c9b7194da7d
	.xword	0x42b0583dffd7c3f3
	.xword	0x1e213f3c65b8c0b6
	.xword	0x0b9988c5bf14d0f5
	.xword	0xd22e6180c9118e6a
	.xword	0x679f1a3035e0e2a7
	.xword	0x199de4033f0b5b92
	.xword	0x5652692e1128466d
	.xword	0xe62c1879dc66a9fd
	.xword	0xe6ad47035283ff9f
	.xword	0x8ceb5d0a5da2297b
	.xword	0x6472f4cfbc01f9b5
	.xword	0x15adfc180a16b548
	.xword	0x1a18abd2d33cafff
	.xword	0x4391aaabb18e8a63
	.xword	0x68d55ff2d5e125d5
	.xword	0x2650902878c2be56
	.xword	0xb7f84e3e2fe5b7d7
	.xword	0x7eac951027488778
	.xword	0x9098fd10cd9ebb93
	.xword	0x7dd4c267ba2ed795
	.xword	0x1369fc00151a8e04
	.xword	0xdd103e873a4e29cc
	.xword	0x3835ca91718be37a
	.xword	0x3d2b7bb5ae0c22a4
	.xword	0x6de79a8fee7ed230
	.xword	0xa761ef4a1727ae53
	.xword	0x2159e0f3c9ac3f08
	.xword	0x8bc09fba43bca189
	.xword	0xf046563d4b3016a8
	.xword	0xf43d079aa7b2c465
	.xword	0x4487fc21978073a4
	.xword	0xb8af710304c910c8
	.xword	0x881fe243e6eac7a1
	.xword	0x702834d590fb6865
	.xword	0x6fc4e9d845d9f03e
	.xword	0xb51d16fa84fcf26c
	.xword	0x59819db0738908e5
	.xword	0x54072cb459bb594c
	.xword	0x6ccf7966b53ca013
	.xword	0xcd49f95da27b35a4
	.xword	0xb3a76c8cbcc2bae7
	.xword	0x98cbbc1fe278e297
	.xword	0xd470b4381f5257d4
	.xword	0xc611fa0e89a93622
	.xword	0x312c2fdf378c0877
	.xword	0x19a9d7a9d3094689
	.xword	0xdc967aef71396301
	.xword	0xe28906c229980de0
	.xword	0xa9f432cf7141b935
	.xword	0x18962c19f69f6e66
	.xword	0x2690f3a303f1d3c8
	.xword	0x2ba0e24918f38b75
	.xword	0x27076849ec918d12
	.xword	0xd58af7018a1e8440
	.xword	0x7da6e435a6de6bde
	.xword	0xf02878a42c1dc4ec
	.xword	0xa3155e1b3e28e875
	.xword	0xe5a1d3c07480212d
	.xword	0xea75454d054d8183
	.xword	0xd4e585d5cafd0cf3
	.xword	0x44fa8f6ba75cc5e2
	.xword	0x5a2d6829ea3cdf56
	.xword	0x30a1711fac676c74
	.xword	0x878b590c9bb035bf
	.xword	0xd4b195d6f25874fd
	.xword	0xee9f3e5a4a36e1ed
	.xword	0xf5d6b59cbaf66ec5
	.xword	0x541116aba001135a
	.xword	0x0973ec58328edc31
	.xword	0x8d7d3a42ba1bece5
	.xword	0xed57c41b4f69fe40
	.xword	0x86f34ae3eb92778f
	.xword	0x76106f49159d7155
	.xword	0xa6d1438b8145b32f
	.xword	0x972445b5a7d08c3a
	.xword	0x62c596802c47f9f8
	.xword	0xc8050b131e26b906
	.xword	0xe1c310dd48cfc380
	.xword	0x9704b65f7284b23b
	.xword	0x654167af1867f04f
	.xword	0x3baa1eb5d3ff67b0
	.xword	0x861fd90ff3f9dfff
	.xword	0x6398adb4504e0add
	.xword	0x7ec781d633c07a06
	.xword	0x8a83bc0e6f8ea109
	.xword	0x8f33556fd67cc0e7
	.xword	0xfa2563b5a5bf8398
	.xword	0xd1a86166a829568e
	.xword	0xf102c290206c93f7
	.xword	0xfced4f54ff3fa5db
	.xword	0xf136265df8307ff6
	.xword	0x5d244302f6c8f3b3
	.xword	0x63fced1e1dee58ef
	.xword	0xb2040d18866c92ee
	.xword	0x60a39b21a010fa36
	.xword	0x5e45ebca7c962855
	.xword	0x613e2a8ea72d6156
	.xword	0x595ae0a0dc3bc0ac
	.xword	0x112fb4d2250dfc10
	.xword	0xd68ee1cce15bd077
	.xword	0x3a7f48018b7d6f29
	.xword	0x14527ca243aabf32
	.xword	0x3620512ffb2b24b0
	.xword	0x1335e8b1503b08be
	.xword	0x3465a583cff161b7
	.xword	0x2e8ea1f58c25aaa4
	.xword	0x7ce8c8bb94fda3fc
	.xword	0x96c67b3034d96614
	.xword	0x291c580bb1be637d
	.xword	0x1a6e396b3d96a7d6
	.xword	0xfa43e43bab848254
	.xword	0x6ec3e1310cb09253
	.xword	0xc7f41c066a832986
	.xword	0x7aaf6e7af093e82f
	.xword	0xf9437182f6276d60
	.xword	0x2679e5ed446e91df
	.xword	0x99eecb0ce937c5fb
	.xword	0x87ffecb52af01f4f
	.xword	0x1a6459ce3699de6e
	.xword	0xa432177be4dcec17
	.xword	0xe428afd8a60c27bb
	.xword	0x643c43f7017a744a
	.xword	0x5df550c80a7edc7b
	.xword	0x60d47561994a8b31
	.xword	0xfe4e816c6ca1c231
	.xword	0x7ed8d317f0765934
	.xword	0x5a9ab6245e4c63e3
	.xword	0xb89075dd7bfcc862
	.xword	0x7e6ad78995ef310b
	.xword	0x8e7b0782b0ff97c8
	.xword	0x28099828565b8811
	.xword	0xed3c5c1145ad1c08
	.xword	0x31e769b4c88dec53
	.xword	0xbccd99369d156ed6
	.xword	0x0d91660590bb16c5
	.xword	0xfe24aff687bf4bef
	.xword	0x16d786482d5a8538
	.xword	0x988cdb7174c6016f
	.xword	0x70d33ef06876f3ed
	.xword	0xfe1b52761e32c3cd
	.xword	0x619209ca48a9ccaf
	.xword	0xe4b7f5dc544c0bb2
	.xword	0xe38ca111fe706755
	.xword	0x26e014bab0458d8f
	.xword	0x795d0f235b014a86
	.xword	0x6472dfe2b3bc3533
	.xword	0x049b30d9fce19fdc
	.xword	0x42de0f9d2ab73d0e
	.xword	0x54ba28c1dfa196bc
	.xword	0x5bb33ee01b5ec0ad
	.xword	0x717663908d97f0d5
	.xword	0x58d3cfb6c6b8f178
	.xword	0xdd9eea87e0fdc2c2
	.xword	0xb1f63b02ba1b6988
	.xword	0xacafd72033ea57ba
	.xword	0x23d2bd4187bad704
	.align 0x2000
	.data
data_start_1:

	.xword	0x1afcad87a5942bcc
	.xword	0xbf0583148c572184
	.xword	0x7a5e493639715b6f
	.xword	0xba83bab630449ffe
	.xword	0x447d3b7ea1d7ac7a
	.xword	0xda8a954e1a79a612
	.xword	0xa1a9fa349792dbad
	.xword	0xf84934092b844e1d
	.xword	0x52cb8357e633c1ac
	.xword	0xdd01ca19cf28bb76
	.xword	0x2fd8bd36a80c26a5
	.xword	0xcb46be6d2d5c9101
	.xword	0xb3f2fb96a462c2a4
	.xword	0xd78528d0638179f1
	.xword	0xac80ade4c24700f4
	.xword	0xcac47c34bdb2c348
	.xword	0x10329b3b0a2ac903
	.xword	0x5a5ac61339888f4b
	.xword	0xac09b7387e4f5674
	.xword	0x0d49965dde3d7eb7
	.xword	0xf32467c83cf7679f
	.xword	0x53c150a39f83884b
	.xword	0xf8390771560e981f
	.xword	0x14eec0205ad355f1
	.xword	0x5bb3825d7002b600
	.xword	0x13feac7c78cf222c
	.xword	0x118ee4098c4572ec
	.xword	0x3348993641a265d3
	.xword	0x93253536618c5705
	.xword	0xd35849a6173a1a9f
	.xword	0x06323682deb0f220
	.xword	0xc94b38c622d005fc
	.xword	0x3c7ded50bc67e95a
	.xword	0x81b7c5d3f189df11
	.xword	0x1f2bd79c3e0a601d
	.xword	0x12415d864ee06d8a
	.xword	0xccfeb92bc04a7ec3
	.xword	0xfaaa69920babea94
	.xword	0xbf85f5d3d24a1d1f
	.xword	0xbeffad15a96ffe76
	.xword	0x37aa6cb1ddbfb6a4
	.xword	0xb04fab7dc2f1a8f8
	.xword	0x792f4139bae11d87
	.xword	0x04961574cb0cf212
	.xword	0x84c06e12bd28c80d
	.xword	0x6a3a6cfdb816abf0
	.xword	0x1b81e4840e6a9102
	.xword	0x437864fb41862cf1
	.xword	0x4e7f1296c765174f
	.xword	0xbfda33615a635f9e
	.xword	0x91672bbae3527eaa
	.xword	0xb8a0e006d8ceea9c
	.xword	0x0ba6e099d6de8845
	.xword	0x50fb0f3928fc64d6
	.xword	0x389f24fcb81bdbc3
	.xword	0x2f852366bde227f2
	.xword	0xb8d234d534250824
	.xword	0x397fbd65452c9e4e
	.xword	0xd042f04e03c6402f
	.xword	0x9fa990bffca777a7
	.xword	0x1d2387d77cf4a288
	.xword	0x4c2220dba9f224df
	.xword	0x645c53d3d3ff0847
	.xword	0x394f3d0d2042fa17
	.xword	0x2bb301a65fbbdfec
	.xword	0x98b091015288b0c9
	.xword	0xcf1943d2eb093c13
	.xword	0x08ff4e0f69e4ca4c
	.xword	0x97a7dff2e5577aad
	.xword	0xc1eaeec56dc628c3
	.xword	0xbf0a2d993ab3bcb7
	.xword	0x48db2bbe8c569571
	.xword	0x01277dbe3ae493bb
	.xword	0x2fba30705935be48
	.xword	0xb0d19695c4b41c70
	.xword	0xa2f0aaea1cc885fc
	.xword	0xe58559088e152f2e
	.xword	0x20c6b8e6c91ed0a4
	.xword	0x7855782c155c25f9
	.xword	0x5e306ac5675dc438
	.xword	0x11c2a32322ddcd4b
	.xword	0x513ffbe48d89181a
	.xword	0xaf570d9cda7e9c58
	.xword	0xf1fc91960fce44fa
	.xword	0x10be3dc5029117dc
	.xword	0x6aa4c22a04db9dbf
	.xword	0x824851a18e753cc8
	.xword	0xf5220b9568630aa2
	.xword	0xee65ab5f529a47d0
	.xword	0x354516da140a2727
	.xword	0xa63fbfb61fb03762
	.xword	0x04a21dc63145e714
	.xword	0x8e302f6955befd8e
	.xword	0xb5096907c12e9e0b
	.xword	0x91cbd811bf942831
	.xword	0x61c41af3fb00c161
	.xword	0x1bb6b77e5113d828
	.xword	0xd3dbeef6d44a90fb
	.xword	0xb88f75add54438ad
	.xword	0x88b2c014d14613bb
	.xword	0xf906c5792acdbb96
	.xword	0x3016251f6b5148f9
	.xword	0x99033c3fbc6acdb8
	.xword	0x3d26627715e512be
	.xword	0x464eeafca1a1196b
	.xword	0xf2a4771ddc1c5c2d
	.xword	0xae5f27309620365d
	.xword	0x2615e2bd80b666d7
	.xword	0xc009fcdc07e5ef2c
	.xword	0x6eeb4086f1b4a184
	.xword	0xbb125ea49bfc5d03
	.xword	0xf43d223f7f974ccf
	.xword	0xa50a50bb5424b0d8
	.xword	0x103afab5c972311d
	.xword	0x39d7f1806a7cc3ff
	.xword	0x5dd06c3401058d2c
	.xword	0xa438dd3ac8bfa80d
	.xword	0xdc679caed4988f8d
	.xword	0x7b9c1aad1e2e2eb0
	.xword	0x07e5f8022c7cd82c
	.xword	0x3a9ebfc14c19dcc5
	.xword	0x90b69939fb713604
	.xword	0x4a32343dab8102f8
	.xword	0x33ada3c2c6d7ccf1
	.xword	0xc80b4e260be97365
	.xword	0x74a439788cd4c6c7
	.xword	0xa4ebf9f209762268
	.xword	0x061c21a7b8f94104
	.xword	0x183d46a18470f829
	.xword	0x0cfb80f6c5328af2
	.xword	0xbe54e3a7f19d6513
	.xword	0x4ba82c494f1aac89
	.xword	0xdd3e790116f4b1d2
	.xword	0x5e9e22666d1e8e7e
	.xword	0x1a3c7c6b065ed989
	.xword	0x0862ec286dca32f7
	.xword	0xc7fcefb515c8133a
	.xword	0xccbda45df8a21fe6
	.xword	0x58d5928ec6c66529
	.xword	0xb46828eeaf57efaa
	.xword	0xc128803b29ca138e
	.xword	0x22a1f85a60ba0a50
	.xword	0x601cf9d913c11d30
	.xword	0x78950136c451c8a4
	.xword	0x89d5580e22d2c898
	.xword	0x335991daad4cc44b
	.xword	0x4be694c3e3d852a5
	.xword	0x7de85afa21daee7e
	.xword	0x7c56194a1f3071b3
	.xword	0x6ad5c3c7f43d964e
	.xword	0x9ae22525c2647e31
	.xword	0x172581deb000330f
	.xword	0xa971c36eb0db39a9
	.xword	0xf5dc6fdef8a957a0
	.xword	0xb73d6c52b9504f6b
	.xword	0x28a67552fabb5a90
	.xword	0x97145457c083b413
	.xword	0x46b0c9a7e01e0109
	.xword	0xb68e60e2959979db
	.xword	0x29dbfb6157a767fc
	.xword	0x9bd1d6dd60da0e19
	.xword	0x18bef7b5878366ba
	.xword	0xb8f2b16986f4297d
	.xword	0x703f42ef8ea2b0b5
	.xword	0xc1b691024b3e8010
	.xword	0x2838b7cf020e5650
	.xword	0xa136b76c0a6085a3
	.xword	0xdebcc5ab427d1042
	.xword	0xaa0aeeeb6708dadb
	.xword	0xb2fce13a6b7f043f
	.xword	0x7d0ee08182bdb50a
	.xword	0x9be224c0b165c9c1
	.xword	0x73bd0c22ee0b5f56
	.xword	0x03fd4f598d991908
	.xword	0xb81a379991429ab2
	.xword	0xa811376e11b644db
	.xword	0x6a7e06e3d7b398a2
	.xword	0x100f8f631f75736e
	.xword	0x9e2dcc193efa6e92
	.xword	0x92a9b5cd32e8d8cf
	.xword	0xf8562126f7a5b22c
	.xword	0x35948b2b2d577aef
	.xword	0x8257bcf0fb8e2eba
	.xword	0x454a2600aac45a99
	.xword	0x4bb018e6b40e3b44
	.xword	0x651d2cead6c00be9
	.xword	0x0570c06d561e4200
	.xword	0x4f84f1e83bea9638
	.xword	0xacc6d110d48d69df
	.xword	0x47ed3d73ecd3db1f
	.xword	0x5c17d1afd3b26063
	.xword	0xc1bd4f1baeb78d0c
	.xword	0xd71ed09ec876b6db
	.xword	0x603a88dd8ec19c46
	.xword	0xd3d7a684902e039f
	.xword	0xf126ea2a008a72d3
	.xword	0x0a5dbd9fb569d00d
	.xword	0xbb9dccfede5b36c6
	.xword	0x5e51495aab5e53ed
	.xword	0xaee353802297adb9
	.xword	0x0c5c1f43e3b93a46
	.xword	0x8dc31b309e72614d
	.xword	0xe2483e7ba30d96a4
	.xword	0x6240dab3ba12e442
	.xword	0x7de904311811b3a9
	.xword	0xc730b9d2aaff58f7
	.xword	0x20f58574bebe3d58
	.xword	0xe5d82e9bc132dbcd
	.xword	0x80f869d3e765f0ad
	.xword	0x04d97b9101bb1e08
	.xword	0xc4bb9476cae53904
	.xword	0xb8f5b31ed4c284a0
	.xword	0xcb83aa327cdcb4c5
	.xword	0x2cb88887c575c61b
	.xword	0x37b075c6271dc9f5
	.xword	0xf33199eba6b5e899
	.xword	0xf4a40b71852c22e4
	.xword	0xc7167ccee6c8ccb2
	.xword	0xccbe87d22257f96d
	.xword	0x2af379b4669e4e37
	.xword	0x11d33598f3da923d
	.xword	0x96d7861d541dd892
	.xword	0x4b3836a030ec7474
	.xword	0xd3b509f85d5ac3ad
	.xword	0x0c332caff6abd6bb
	.xword	0x5e414245aa11ad08
	.xword	0x983af8ba2d46eb6f
	.xword	0x5ec80dbed61658b9
	.xword	0x301ccba7de9ab3ba
	.xword	0xbb192dadb93eddcb
	.xword	0x0150b3a554e3d79d
	.xword	0x9c4f11b14bfb05a7
	.xword	0xe72956aefacbe002
	.xword	0xe966deef13bf62da
	.xword	0x7ef968a23ed58c05
	.xword	0x1784ec26984cca30
	.xword	0x1c22f4d7c502f5ef
	.xword	0xe87b968a745dd69f
	.xword	0xca20d256a2f6466b
	.xword	0x60697661326eb494
	.xword	0xb37f3a9759778373
	.xword	0x7fe2646adc1d5a14
	.xword	0xa1f0f201dbba8757
	.xword	0xee7b7baa2c03a826
	.xword	0x39ec662679fafbe9
	.xword	0xc3a0d3dc7c028bbf
	.xword	0x1680a03250620889
	.xword	0x84becc0dc298c8e0
	.xword	0x837a4a142cd16ab2
	.xword	0x01f0a2f00c52ff9d
	.xword	0xd4d07c82dd976260
	.xword	0xb81ceb4a811cdf94
	.xword	0xeb26c53a1db98f18
	.xword	0xd0322ee19cb73dd9
	.xword	0x66cb5b62280957f7
	.xword	0x96e3f2c23d7aea7d
	.align 0x4000
	.data
data_start_2:

	.xword	0x455baa0735d40cbf
	.xword	0x58e00199ef51360d
	.xword	0xeb865a852c401907
	.xword	0x0868b15331b9dc7a
	.xword	0xa676218e24854e22
	.xword	0x38d79c30fa850a5a
	.xword	0x3b1764bfbcd6e1dd
	.xword	0x0e32a73dcab7efb1
	.xword	0xe6e9707d9148a96e
	.xword	0xa57d007cf95c27ee
	.xword	0x67dbf3c0e5c6c9be
	.xword	0x12151561ddfa4416
	.xword	0x75e9dbcca620ab80
	.xword	0x6f7bfc846ce91630
	.xword	0x7f8e5b47c1c4d916
	.xword	0xabde9c80f3b5e823
	.xword	0xabce7c6be060c10e
	.xword	0xff0cf5a3ba31f4ae
	.xword	0x9ae733823fe1fe71
	.xword	0xc102de7ef53f625b
	.xword	0xe7489e01ff12f32e
	.xword	0x15f100ad67c99ef7
	.xword	0x8da165fa54cfdc99
	.xword	0x46feba69d57b8837
	.xword	0xf670cca267feb174
	.xword	0xe9aa0f7a7df65b63
	.xword	0x956fde72e78ed1ba
	.xword	0x1d220a1bea5f11e3
	.xword	0x26972f1335331248
	.xword	0x5c80756d64681551
	.xword	0x13500d6d540af172
	.xword	0xcd51e70aea21fa29
	.xword	0x96c2826142b2c0bd
	.xword	0x196105509f7a3517
	.xword	0x2658ef6eab12a001
	.xword	0xe31d7340e908f2d3
	.xword	0x5b6e36290608fb51
	.xword	0x5c3e5ca8e56a826e
	.xword	0x29f4fe63ca7f2422
	.xword	0x58751ee5abe62f2b
	.xword	0x7e435b4ced4038b2
	.xword	0x064569d99f189db2
	.xword	0xbcb52bbd4f5078a5
	.xword	0x38067a0afb8c00c1
	.xword	0xe2cd9ffda8bccb7d
	.xword	0xe7e79b615b204e05
	.xword	0xd0b5e7705453064a
	.xword	0xce3f568def60e9f4
	.xword	0x0c87f105848a6924
	.xword	0xce0e4a3fc21782a0
	.xword	0x6f68b6fed892789a
	.xword	0x27d68b2ffa35b258
	.xword	0x7c572cf542137e61
	.xword	0xda4a8a4cddacc4a9
	.xword	0x001cbb418286da72
	.xword	0xa25414b9352b8e1c
	.xword	0x076673b07c78c3ad
	.xword	0x324816a781acbc8f
	.xword	0xf7b1aa599f7b3cc7
	.xword	0x9623d3d16069c140
	.xword	0x0d4367b26a24762f
	.xword	0xbb2a8a8c538ca162
	.xword	0x6742e8090f38bb9c
	.xword	0xa52feb1ad2e5e18b
	.xword	0x0604ba368dbe00a9
	.xword	0xceceb20fcfb70eb4
	.xword	0x118f62d8ff5d083f
	.xword	0x06a957a0aeaddc25
	.xword	0x048b985a065fa72d
	.xword	0xde7b402e5e89e4e3
	.xword	0x99d05291f8ed03b3
	.xword	0xf9d2c4b7eae9cdd0
	.xword	0xf3add56d795b5896
	.xword	0x7a4dc84e1770cf31
	.xword	0x9cb8284b3c74ea7f
	.xword	0xceaf4c38d251738f
	.xword	0x492517f78aa014d6
	.xword	0x01b3bb365d62ba7b
	.xword	0x9e2daa9363338b53
	.xword	0x014380212391063d
	.xword	0x8a02767755670ae7
	.xword	0xb41938ed392149b4
	.xword	0x997d7fb462c096b2
	.xword	0x6aed8f117218fe4f
	.xword	0xbb442b4d5b147fcd
	.xword	0x77c076a4bff882ba
	.xword	0xbc437d8544319cbe
	.xword	0x41670e3d189228bf
	.xword	0x9222fca1f6ced303
	.xword	0x2c01c509982845c3
	.xword	0x5dbed9a72a6bee6c
	.xword	0x530c4582522a64d7
	.xword	0x2a2e82238967629b
	.xword	0xe2f48afb6dc88062
	.xword	0x1a29d151d21892cf
	.xword	0x6a0a2bf9cf2d3bb2
	.xword	0x296569f04024f1f4
	.xword	0x2f6933cfcb43ec6b
	.xword	0x6d32a5599f5f4aff
	.xword	0x63f056b693839ece
	.xword	0xef294744b0c6214c
	.xword	0xf91712489fbd5276
	.xword	0x24e85ddd91eedc66
	.xword	0xbaabe26dd576df6a
	.xword	0xae5a32e6f0a666c7
	.xword	0x41c3765ecbd1ae29
	.xword	0x4278d95b24fc69ae
	.xword	0xbef4516eeb0e5171
	.xword	0x0b61b977ab181e71
	.xword	0x5e4714d1ac6f7227
	.xword	0xf785b17c722d0933
	.xword	0xbb58d4ea1bf0b859
	.xword	0x48b82519a94634ad
	.xword	0x27714697147580dd
	.xword	0x09f4b24af148f1d8
	.xword	0x40ef82c591498991
	.xword	0x56f4908219ec1809
	.xword	0x0a491c8ffeef3000
	.xword	0x5812275cf07619c5
	.xword	0xa9166ac1aff6dcf4
	.xword	0x762901570c561b31
	.xword	0x8a61fc188e88d081
	.xword	0x127338a78fc618e5
	.xword	0xbb18c05617a9b30f
	.xword	0x9a3365573c50c31c
	.xword	0xa00d79df08fe7bdd
	.xword	0xdce949858f1f32f5
	.xword	0xf05520ce6c8a4305
	.xword	0x736e49c23aaaf13a
	.xword	0xe7cf38999662a77f
	.xword	0x6c3950088620a9d2
	.xword	0x81104fb620312355
	.xword	0x2deb1e019f74d96a
	.xword	0x65674e787e2dd87a
	.xword	0x2e2c0aae8aebf22d
	.xword	0x6752c92a9804d23c
	.xword	0x5f2716cc5663cd23
	.xword	0x074543edd78bf69b
	.xword	0x262f190609183bca
	.xword	0x7ebedb00e2811b36
	.xword	0x7a03a1022e109021
	.xword	0xa86c32d32abaf0f6
	.xword	0xa12fb7becc263d0c
	.xword	0xe0258fab829ac008
	.xword	0x1c67dcc8a369162e
	.xword	0x2b65b6ae9e29bdc7
	.xword	0xc45a22e84e372880
	.xword	0x4cbfbc2f6ac51354
	.xword	0x384c3669d61813f9
	.xword	0x56d3ae658a5328a4
	.xword	0x9fe3f4285333c71b
	.xword	0x282f90266e34f745
	.xword	0x37c26df241e1b45d
	.xword	0x2b19243b90268272
	.xword	0x51a0aac3e655f7e5
	.xword	0x204db9af028c0d4c
	.xword	0x2276fc3919ac4bc9
	.xword	0x0ce74d10e57be74a
	.xword	0x15d139e03d91d9c9
	.xword	0x05b83dba59f3c4e8
	.xword	0x9a66f480117f182b
	.xword	0xf0ef71f4de4b515c
	.xword	0x2a6628d8afb4d772
	.xword	0xc05c3fe8fe253bd4
	.xword	0x4bbc0230919a940e
	.xword	0x9b68ec9e7dbc086a
	.xword	0x5ba84bb978329d83
	.xword	0x0d478dc3129e0e61
	.xword	0xdd5f44f48923291a
	.xword	0xfb36a9286f280ce2
	.xword	0x7cf6e79a2d93a292
	.xword	0x192028fe2d422111
	.xword	0xbe07058b7f6757f7
	.xword	0x79f1f8c26b2164b2
	.xword	0x31c1f7cd960e9bf8
	.xword	0x89c412b15baed0fd
	.xword	0x51fa6d632dc370ac
	.xword	0xe971aa05d9f47682
	.xword	0xe981fdbe0f4e95dc
	.xword	0x9c282ab68b329d33
	.xword	0x87ebff02b3015a99
	.xword	0xe6983180b3d78b70
	.xword	0xb87e9d199436ba75
	.xword	0x6015cbc9c6ccfe90
	.xword	0x51017a1ab5d1ae42
	.xword	0xfa3d8ab6a0c670d0
	.xword	0x6dbe406dba9faea9
	.xword	0xe885b5b296aaed66
	.xword	0x98d5dd79b009f570
	.xword	0xf47930d3d53ddd0f
	.xword	0xc2ad2e1ec826d3f3
	.xword	0x7a754a79e02f804a
	.xword	0xedc78a5f6cbb42e3
	.xword	0x26fe5281968008d6
	.xword	0x1aa653e6900c1239
	.xword	0x45dfc90d056dd248
	.xword	0xb56692ef655434a9
	.xword	0x74dea61cc0150974
	.xword	0x471126bf189f3b3a
	.xword	0x4c55efd8abd5638f
	.xword	0xd0511e1f7d5e77c0
	.xword	0x5e4900f9f9a64254
	.xword	0xb24f417073ab3575
	.xword	0x73831f279c4aa7e3
	.xword	0xfd22a03d489beaeb
	.xword	0x680bb62402c10400
	.xword	0xea4bc7fab4f7eee2
	.xword	0xceed04c35ca39254
	.xword	0x711fd6947cf3ef4f
	.xword	0x00ced1631ac55f9d
	.xword	0x50bf219dd5942726
	.xword	0x7f8de5aec4298458
	.xword	0x63684f1e55e118b8
	.xword	0xee450b5d42925f88
	.xword	0x905679b7843ae351
	.xword	0xf458f916972d2d94
	.xword	0xf8ef11df5a8d58ee
	.xword	0x3de24d67328d1091
	.xword	0x15471803dc7f2e4c
	.xword	0x0bc20c7a3d79bbbc
	.xword	0x6361aacc4f4cd288
	.xword	0x3ecb12ac61202c89
	.xword	0x1bf40b68c5cafb8a
	.xword	0x757757a6982b345c
	.xword	0x9fc91c64a77021cd
	.xword	0x2edbae147d220d83
	.xword	0xde540fc5df05d087
	.xword	0x05142cb933fa6d1f
	.xword	0xa3df4a40266ea220
	.xword	0x1bb916366a14fbb6
	.xword	0x52ddd9b97333e84c
	.xword	0xb06a01da899db5db
	.xword	0x54266a2a78e4e625
	.xword	0x6e81ba5f962de9f0
	.xword	0x79bb0a3523d16eb9
	.xword	0x6d928c2f8240b54c
	.xword	0x1b1990e0f1f523a1
	.xword	0x70291d5822ef3302
	.xword	0xd1b64f84907d6794
	.xword	0x4ffd6b6f4878ca35
	.xword	0xdbe54fe1856bd1dc
	.xword	0x4b7cf1faf19f0910
	.xword	0x42e80ab0eb31f04c
	.xword	0x6937bb86f3e49674
	.xword	0x9747e66c8c1a16b1
	.xword	0x8418570e2784b66a
	.xword	0x2c8aa79434d84e18
	.xword	0x67a66e5db95fa8f7
	.xword	0x5cb6b851b7e270ad
	.xword	0xbe97f4b653342d4f
	.xword	0xdaec6e65837a5242
	.xword	0x2fbb6910f43afb2d
	.xword	0x726326b47d53c298
	.xword	0x81990ccc4427e1ee
	.xword	0xa00ee2d710696dfc
	.xword	0x004ac47efe64dc88
	.align 0x8000
	.data
data_start_3:

	.xword	0x6d1886fca35e272d
	.xword	0xb87eee8431e70adb
	.xword	0xf3cf27256204a43a
	.xword	0xe48693d36449dd2c
	.xword	0x0f82414a8f3a5837
	.xword	0xd901afd3f5a457a5
	.xword	0x90244bff15d72978
	.xword	0x004a6e7cba896324
	.xword	0xa61b50ae110efdf6
	.xword	0x5029b25147892d2a
	.xword	0xa2c9d09ef1c1cdcb
	.xword	0x52e8b6a06d18ae30
	.xword	0x56fde379062c5e28
	.xword	0xbcf2a16ff67200a1
	.xword	0xc89f2b26335d81f5
	.xword	0x51b02c15a749684c
	.xword	0xcda335ec3cb19977
	.xword	0x283bceae901f9fe2
	.xword	0x3a7a0d0a7ff3f856
	.xword	0x37143dca4e7872ee
	.xword	0xf300347e539a54d8
	.xword	0xe2b40a44d20143c7
	.xword	0x4550c8ca1591b680
	.xword	0x36f78b699cf5a18c
	.xword	0x55fc7209972748e7
	.xword	0xb1e940435367be9e
	.xword	0xe00b7c73185d4b1a
	.xword	0x19d4b6f93c462439
	.xword	0x4b454b97fa53b2cd
	.xword	0x476c7ed2dd4adc6c
	.xword	0x6dd1e109c08a1c72
	.xword	0x8a28827501fb8ac1
	.xword	0x3073e6f26347f2f5
	.xword	0x750dc7a173fd4cb5
	.xword	0xd06d1c9d2c0d6467
	.xword	0x033e96b1c65c15b5
	.xword	0x2d84798be51f2660
	.xword	0xe638e522cb5d562b
	.xword	0xff95a118af2e24c8
	.xword	0x59bec3b74959cd66
	.xword	0x083cdc6bf3814531
	.xword	0xf366b2c9a346fc1a
	.xword	0x1ac25afa0f08b039
	.xword	0x3643df0362051411
	.xword	0x2373770216ce6553
	.xword	0x55136d18990e5a08
	.xword	0x9f64a4958c8f4291
	.xword	0x510310877f6bb7a2
	.xword	0x230d5ac5c11049fc
	.xword	0x34cfe451ceffe5a0
	.xword	0xbaadc85abd705296
	.xword	0xc6367bd14fa1d5e1
	.xword	0x7969d723d4ce43f4
	.xword	0xba08eda0997464ef
	.xword	0xff613556386780a9
	.xword	0xb3d500ac264d09ff
	.xword	0x07e10f19014a01d7
	.xword	0x942c4f70405faafa
	.xword	0xed1601ec2fe6997a
	.xword	0x90e92b5f6acdbc0c
	.xword	0xb02aff903df930a4
	.xword	0xcf2624d0c4eed57b
	.xword	0xc0ee2cd54c7ec30b
	.xword	0x6a0bb286ed26c9c8
	.xword	0xf9f0f793d655acc4
	.xword	0x9969aefb11e96050
	.xword	0x873de70f10ea35b8
	.xword	0x44292554e9c7350f
	.xword	0xcf6df51215f88eed
	.xword	0x16bcc0457cc5c7ce
	.xword	0x44c00ffd0498f43e
	.xword	0xe5d843bdc5fe56dd
	.xword	0xcfd40c7193fcb2c2
	.xword	0xead4fb68bd110af1
	.xword	0x021efe936701a70a
	.xword	0xdd193e17bf9689f0
	.xword	0x63e4accb0a9b25cf
	.xword	0xe28f7a66113cb6a6
	.xword	0xaa59e0ffc9c2a774
	.xword	0x43fb946c4b71bd4f
	.xword	0x8f46910db6aaf6ff
	.xword	0xed220305778870a7
	.xword	0xcb3132251268e6d8
	.xword	0x1818dc18b40f7a33
	.xword	0x690f4e8395bded26
	.xword	0xc461f6e38a418f16
	.xword	0x299d8cdffa586df4
	.xword	0xbefe664d1809ee54
	.xword	0xfefd717e2b7e315a
	.xword	0x96e72805e8e886db
	.xword	0xba99e3e54a37ca82
	.xword	0x4c79a074b3e75c46
	.xword	0x3542bd020cbfbffe
	.xword	0xf5fb52aef3a0ac6a
	.xword	0x49060e465dc96f8b
	.xword	0x88c6a3b10e94ebe7
	.xword	0x185b45a51de5769a
	.xword	0x7fedf97bb3d48515
	.xword	0x13902a32354057e5
	.xword	0x80047e263200b3ad
	.xword	0x4c9c1c1070c012e6
	.xword	0x884c82186f772240
	.xword	0x62a4f20b1a2c5331
	.xword	0xb8601756decdfcef
	.xword	0xd2d186539b867074
	.xword	0x57eac46f43471884
	.xword	0x235d7fee34cc3111
	.xword	0xbb6617eed96e39d5
	.xword	0x02311b78e78317bc
	.xword	0x6ec03a7610dccd45
	.xword	0x78378f462d263a56
	.xword	0x59522b6a3a005ec0
	.xword	0x6707a3091fa18752
	.xword	0x6baee916831af1b8
	.xword	0x2610297f23ee824f
	.xword	0x440224d2e1a143e9
	.xword	0x6aad1a3f4e5ec5ad
	.xword	0xb9c3d6bb85ea5faa
	.xword	0xd53b3037596a4efb
	.xword	0x4fc8744167bc5969
	.xword	0x4a9a124d130817cb
	.xword	0x3faea472e8f366a2
	.xword	0xd37031ac3932eb64
	.xword	0x4ab5027c835ba3e2
	.xword	0x0bfaf3fe3abbee5a
	.xword	0xa50cc42fbbee015c
	.xword	0x4db8e903cdd00810
	.xword	0xa33f93bd9c6442fe
	.xword	0xf0f5d03256bda7ba
	.xword	0x8168269b25c8e12d
	.xword	0xbd94bd074e68f4a0
	.xword	0x31fe1d21ea2aeea0
	.xword	0x35d24b34f247b23d
	.xword	0x6bda357b28d4f8ce
	.xword	0xcdbe6cf08f52499a
	.xword	0x9fac5c9e2588e113
	.xword	0xff7b83b5071777c2
	.xword	0x59d0d7de72ce724e
	.xword	0x0dc8856207c4c95c
	.xword	0xa340eaaeb6ec1250
	.xword	0xbb0c4ef7cda324f0
	.xword	0xce0f557ba4ff872f
	.xword	0xe8d5e0e77e71eee7
	.xword	0x388287ea00319333
	.xword	0xef827ba016aadf44
	.xword	0x1991b53d1a5b9ade
	.xword	0xd6d036558a8d2e88
	.xword	0x46dac34dea70cba1
	.xword	0xa69ddafbf5451fa1
	.xword	0x0d894ef283588873
	.xword	0xf46cf3b8d387588a
	.xword	0x531efdeee9b31537
	.xword	0x61efcd654cb73e21
	.xword	0xacf5a3368630f51a
	.xword	0x448bd5bae4669b8b
	.xword	0xed2a10280ea1af8a
	.xword	0xfa58e465ef8af3a8
	.xword	0xe12ea1f558740de0
	.xword	0xc3cfb017a545ad79
	.xword	0xbd5558db6de61b3c
	.xword	0x9fd65fc2711c2cd5
	.xword	0xcc553c5455416d60
	.xword	0x1ecc2d3ad02f89ad
	.xword	0x8416c16203595b53
	.xword	0x04842954fa397858
	.xword	0x2a789de5fb988e0c
	.xword	0xff0e2f250556f102
	.xword	0xffeb58b25f37c37c
	.xword	0x90e82f359825125f
	.xword	0x89dfec60a2d4de07
	.xword	0x3908f50f9d39a2b9
	.xword	0xa8eac6df9db6d43c
	.xword	0x6e6c87bf2524d257
	.xword	0xff7dabee1d9cbca4
	.xword	0x9d07d2eb99e4becd
	.xword	0x691a7fe970fd2881
	.xword	0x000246fbdacd69f4
	.xword	0x7fb08c64c419fb8a
	.xword	0xe1e6e758088b7c08
	.xword	0xde050c227c5fbb7c
	.xword	0x13f205c562794861
	.xword	0x035c876eaa4e889a
	.xword	0x8f8beec8411b8b16
	.xword	0xae9d2f623e821656
	.xword	0xc2242604a30a4faa
	.xword	0x366948e7ea2910e6
	.xword	0xe29cc21ed0204e1c
	.xword	0xcd8e097a07329ba1
	.xword	0x8a90f958be097f8a
	.xword	0x0ad87d119186dbb6
	.xword	0x57c7653077161b69
	.xword	0xc8d98bd2cd2bb07c
	.xword	0xbf988ca20aea2abc
	.xword	0xca36fa1e53ee895c
	.xword	0x97e1d4dfd9e06917
	.xword	0xe697515a2ef16db0
	.xword	0xed21c5f749cbebff
	.xword	0x1d32045bd7b00639
	.xword	0xc30817cab8db99a6
	.xword	0xd723a436bb9b4d0a
	.xword	0x95c8fe6d7734d827
	.xword	0xc6391b960ad25d63
	.xword	0xe77033b5ec48d65f
	.xword	0xd826a37201a6e244
	.xword	0x365dc4103ab490b8
	.xword	0x422c2ff3d4441050
	.xword	0x5e671b66624890d1
	.xword	0x1bd2b281d206739c
	.xword	0x3d41dc4bfd7e04db
	.xword	0x7e9b4576c4aab228
	.xword	0xb3fb77ed4263d094
	.xword	0x0e0032c38bb38e8e
	.xword	0xf236fa16a23e443e
	.xword	0xdb6db200fdf73fc2
	.xword	0x6cd371dbff27965c
	.xword	0xa1c79673a2430c2e
	.xword	0xaa18f9dde7b59dfd
	.xword	0xba8fc1e65bf6de25
	.xword	0x3e199d83adad320a
	.xword	0xa729fd155d3b8ea2
	.xword	0xb0db6a8441c0c5ca
	.xword	0x8a55dfd52ebf5350
	.xword	0x19c93db22e855ce9
	.xword	0xef76a381836fa3bc
	.xword	0xca5f5017fc33f273
	.xword	0x16ecd190767b9cff
	.xword	0x6ebc00a6de5b53c9
	.xword	0x4ba2456021590cad
	.xword	0xddec9cd37cf3b093
	.xword	0x4c8536da2efa09ee
	.xword	0xae26676ef7c4f0f5
	.xword	0x39f250e3a308c2ca
	.xword	0x17092355173d8e2a
	.xword	0xa2a81fd80b8c272e
	.xword	0x2ca1ef428cb706b2
	.xword	0x1f5c3428d4ba4f3f
	.xword	0xf39124f2cce2ac6a
	.xword	0x9059a1bd2162bfd8
	.xword	0x25a1f5b3b8cce98b
	.xword	0x44b2195e172ffffd
	.xword	0x56bcb4a00b115e83
	.xword	0xb778c10992dc5d45
	.xword	0x354ed9546151431a
	.xword	0x6ec9bea4d1bc2d41
	.xword	0xcba676df69b290fa
	.xword	0xc975eba56637afc1
	.xword	0xc66e5e02b0e751ad
	.xword	0x1ecb730574334e13
	.xword	0xf99896f9b5b273f9
	.xword	0x9cf7036f5efdc544
	.xword	0xdf906dabdb1a03ee
	.xword	0x15f49f3a42f049b1
	.xword	0xc864c9d133b5ae4a
	.xword	0xc1f02b6836d7b024
	.xword	0x394f1b820a2c5cc2
	.xword	0x6003daff92dca4ac
	.align 0x10000
	.data
data_start_4:

	.xword	0x936172d0174cae6e
	.xword	0x4cc7cd052eff4217
	.xword	0xafbb572cc6707340
	.xword	0x0d654ebd20330956
	.xword	0x1f7f8ed4cbf0f5c9
	.xword	0x10506ced577b0d19
	.xword	0xb8fdf473e0233313
	.xword	0x43164121a562e75e
	.xword	0x2bae6ef5dcc7f828
	.xword	0xe974b35d63442f91
	.xword	0x63b3f452bac03c54
	.xword	0x00a0d99808493d32
	.xword	0x022fc03880a01d90
	.xword	0x37ee0579311d64aa
	.xword	0x8a5c3b9604950375
	.xword	0x68ae85c219c51743
	.xword	0x36c6d0e7074898c7
	.xword	0x8959180c7b50f134
	.xword	0x40cc105b25d9b66b
	.xword	0x2986b14be6b0c72a
	.xword	0x56f886866021efb4
	.xword	0x8dc30924dd3c12af
	.xword	0x500af5381d70cec1
	.xword	0x8674c0fa2d2fb6a1
	.xword	0xae8c8b9a5f2522b3
	.xword	0x40a7024b926a35ad
	.xword	0x7d45425de95619bd
	.xword	0xb0bcd528f10fabd2
	.xword	0x91935286e4a0b2f8
	.xword	0xbe25fb2ec6df6780
	.xword	0xda518e494ef5c6ab
	.xword	0x7d02e5d061f36363
	.xword	0x919ef8585a3102ee
	.xword	0x5ee70ba2e22ddf47
	.xword	0x6f9297f86d62d1d0
	.xword	0x8544b2ac3468c70a
	.xword	0xa4e17c2476ee921c
	.xword	0xea4175cc36f103de
	.xword	0xbdcacd20819779d1
	.xword	0xf7b99d552875c026
	.xword	0x300cc06d81e58205
	.xword	0x447eb2346056165a
	.xword	0x20aa0c592e041854
	.xword	0x499237a4a8d4520d
	.xword	0x3adf8f81b8e74915
	.xword	0x0432f6981ac5cc43
	.xword	0x7410b96d83a14bf0
	.xword	0x1c84061b81c651fd
	.xword	0x9c9fd36fa5317c9b
	.xword	0x252b46624ee643dd
	.xword	0x4fd984b556d566fd
	.xword	0x1da287d71456fa5e
	.xword	0xb15dc9d1b213243e
	.xword	0x664bae9b686e636a
	.xword	0xec8b2e48a0ee5f55
	.xword	0xdc04b7d38abeacaa
	.xword	0x0e060ef5760f3a8f
	.xword	0x384a10adffb56c5b
	.xword	0x36b0cd251969b960
	.xword	0x94644b6e5b5ee581
	.xword	0xc6802b7713945b47
	.xword	0x89bd7f3f3516762a
	.xword	0xf305e3a5bd879885
	.xword	0xf140f00e4d54eee9
	.xword	0x34b11b1f82f2151d
	.xword	0x3f27a36af7196886
	.xword	0x688bf72fb1364a8a
	.xword	0x7cc9259808e39907
	.xword	0xd40634469f686fcc
	.xword	0x82a7f98ef3077e12
	.xword	0x4605a59bab012874
	.xword	0x7125270086822d1e
	.xword	0xe01e8f3565aa90a9
	.xword	0xa7d288fc0ebcfb48
	.xword	0x2962941131b67fa3
	.xword	0x27262db3af4c7aa9
	.xword	0x185b04529bcb761c
	.xword	0x8039a77158aa5fe8
	.xword	0x764dc76c3a96433c
	.xword	0x35d14c037d8e9995
	.xword	0xe1b9f57f5fac1bfe
	.xword	0xe13676e39d6fdf17
	.xword	0x80dc1875a99bf3aa
	.xword	0xa4e22304518ef687
	.xword	0x895be7620f3e3d92
	.xword	0x6912159ba67e5d19
	.xword	0x36b81065215cbc75
	.xword	0x73b73feb65032135
	.xword	0xa1e3b1d82afb6128
	.xword	0x3468f6b49c41c123
	.xword	0x7766e08b46b965fe
	.xword	0x56776b7aea4e8f1c
	.xword	0x39be2f5337f80c93
	.xword	0x804cbdaa731c80ce
	.xword	0xc275cf77544f8583
	.xword	0xa7ac7ab3d38c9484
	.xword	0xa07147eda6fa815a
	.xword	0xe8e325c678626469
	.xword	0x5aa0d3503fc05177
	.xword	0x295b8456a3bcb4a1
	.xword	0x514e0f7fc6f65ed9
	.xword	0xd307bbc06e423c2e
	.xword	0x1a3e67af1f6f007f
	.xword	0x1f5c43bddbdc02bf
	.xword	0x75e72d9e2615cc75
	.xword	0xa26b10bf5ee4e3ca
	.xword	0x24f23c70c10c3e93
	.xword	0xbf20e203d95e6573
	.xword	0xa9ec47a40d8b693c
	.xword	0x199a44321ab96a08
	.xword	0x5a3f20bd45989fab
	.xword	0x551489d820fc9b84
	.xword	0x43aa210b2d8fc094
	.xword	0xdd13227e84bcfe42
	.xword	0xe3563091aab01243
	.xword	0xc71086dba3fd5840
	.xword	0x7364418d1368c14f
	.xword	0x369f47aecda7356f
	.xword	0xd1a55a6768a3822b
	.xword	0x981233fc7a2dd345
	.xword	0xdc5b3ee1ea2e397c
	.xword	0x584b26aabff78717
	.xword	0xadf0290f6d18d25d
	.xword	0xb88d1909c54918e9
	.xword	0xdd653104cf387a38
	.xword	0xa211992cde1191e5
	.xword	0x7f190a86de1e6856
	.xword	0x24e9969a51fed018
	.xword	0x339f2663b0134c44
	.xword	0x5321eb6c8d6337e5
	.xword	0x374ba26d3f42fd14
	.xword	0x83400fa9d593fc32
	.xword	0x77249da87f41ef5c
	.xword	0x3167e38a9e737b3a
	.xword	0x1eb5f3854bd7fdae
	.xword	0x086b45ce02dd6125
	.xword	0x156f5f88a050187f
	.xword	0xc76af122f44699a7
	.xword	0x7ac7063c542e84fb
	.xword	0x49de41001f644119
	.xword	0xd7dc48aacd8f8169
	.xword	0x94256186d986a9f6
	.xword	0x1cf0bd3ba1e363f4
	.xword	0xbf75db322af58804
	.xword	0xd11923817922fec1
	.xword	0x5c483c8dac109ce7
	.xword	0x4d42b7c927574738
	.xword	0x14c38ff8869818b9
	.xword	0x13b974ebb19d5925
	.xword	0x24b07878bec21b2a
	.xword	0x9330d21fda05c237
	.xword	0xd94cc321bb9635b2
	.xword	0xaadc440afac4c11a
	.xword	0x854c1324c4e265f4
	.xword	0xf7dab8b9f8c552fc
	.xword	0x87fd0677e2fc2ff8
	.xword	0x88b9a2b945725878
	.xword	0xc776694cc4abf778
	.xword	0x4a0694dc4ff50b46
	.xword	0xc994674fb9b09087
	.xword	0xe5a68470c4aadce4
	.xword	0x7539e00c773876de
	.xword	0xfcef39903a9011a7
	.xword	0x3b213f8ac9636c95
	.xword	0xc56f4f6aab0d8284
	.xword	0x521741b07d8ef9bb
	.xword	0xec1b0235433d6190
	.xword	0x61b534e99d40b3f1
	.xword	0xd874790c00acf486
	.xword	0xe4227aba14a909e6
	.xword	0xae79eae2aa2ca7ee
	.xword	0xdc6c184e2419b3b3
	.xword	0xacf076e96629619c
	.xword	0x45200a17527e0710
	.xword	0xd5a2b00c6f171829
	.xword	0x7678b0bda3ddb6c0
	.xword	0xd05dd136d5447308
	.xword	0xaf144b7a2d292365
	.xword	0x0cbbaea8a4fb50f7
	.xword	0x6c8b47b8a302b7d2
	.xword	0x656afb65852dc6d6
	.xword	0x2f0acfd7f126e967
	.xword	0x01c854d1e12f2e9c
	.xword	0x35ebe23e171e58c5
	.xword	0xefcc875d89d8da3d
	.xword	0xae6c8dba620e0923
	.xword	0x885a7070c9cda0a4
	.xword	0x470b3664ec5cfb39
	.xword	0xfdf0a6d5e2b9589d
	.xword	0xb8f9af7efff17582
	.xword	0x3e8d3545941148c6
	.xword	0x60bd15a1243e7724
	.xword	0x529bf62f2d9ca659
	.xword	0x0233d967450009cc
	.xword	0xb57fce1723622bc5
	.xword	0x0062f0ab55de1503
	.xword	0x57ba2cb385c8b1fc
	.xword	0x5a9f06dd32478357
	.xword	0x412788daa3d752ab
	.xword	0xa069c1c0f55c4c27
	.xword	0x4b5fc1941e5825fd
	.xword	0x83001e3edb3e02bd
	.xword	0x43fa06326650dee8
	.xword	0x761fc53f9dae06b9
	.xword	0xda72fc041b1e9490
	.xword	0xc0e71d9b4d5a5f7d
	.xword	0x47bddadd95a83eab
	.xword	0xf2ffaa05f4913d97
	.xword	0xad9f445aa780b427
	.xword	0xea01632c392a6ded
	.xword	0xd964ce7e290c4821
	.xword	0xc94de906f0dd7966
	.xword	0x45e73765995dd700
	.xword	0x801a70cf8bbc617d
	.xword	0xeb39e439f2915734
	.xword	0x893640e4fa148d81
	.xword	0x10f11dd2106a9b67
	.xword	0x66d069d2a17310b3
	.xword	0x7ec3ef014d360d68
	.xword	0x20b55a5594ca9df9
	.xword	0x1503463615f155dd
	.xword	0x84fcead49af6838c
	.xword	0xa15f6ba60dda974b
	.xword	0x666ef891014efa77
	.xword	0xef9c4de4440ecdc8
	.xword	0xa99b2251de00b393
	.xword	0x19856f6f2541ceaf
	.xword	0x830b71d5fbedb9bf
	.xword	0xda75cb9b5df4a086
	.xword	0x99719dae078aa960
	.xword	0xf554b0a2a8d644a7
	.xword	0x1d441d36dc26c197
	.xword	0x2c86fc0cd7a24548
	.xword	0x25c6f0d6b7732de2
	.xword	0x3b7b7bbe14ea4b85
	.xword	0x4eb9d2d7d0e4f107
	.xword	0xfdd3a7ec6d1900d6
	.xword	0xae5fb42f294a2dd1
	.xword	0x0cb0d6941f8d5b6f
	.xword	0x6b397d38576461bb
	.xword	0x4cac4eb45fa37975
	.xword	0x63ab03b2d07bca83
	.xword	0x2f6419b9d801f271
	.xword	0x1762328e19546519
	.xword	0xac6fcdac44e390b0
	.xword	0x3a717b8672e69faa
	.xword	0x0e67e87cd3ca2795
	.xword	0xd99b772ccec8daa1
	.xword	0x9130dfdfbfddf5d0
	.xword	0xbf8d2f46c8300e19
	.xword	0xd9d8b648004be49a
	.xword	0x05cda7044069fdf8
	.xword	0x42bfe5945175a444
	.xword	0x833f373591f2700d
	.xword	0x8ecf4e8e7bf585fb
	.xword	0xc0d319fefaa4413a
	.align 0x20000
	.data
data_start_5:

	.xword	0xce952470c5e5aa14
	.xword	0x845f825a457f9616
	.xword	0x1d9526605a0cce1d
	.xword	0xc6114de38708381a
	.xword	0x5cf74f45fc810d15
	.xword	0x71e455d9a4a374d1
	.xword	0xf4fef95c7b2d44f7
	.xword	0x17b2316c4d826bb3
	.xword	0x13191dc1306dfc2d
	.xword	0x38e8637fb90e6152
	.xword	0x8c040ebd78aa0d06
	.xword	0x5413fb505a65bd98
	.xword	0xf4785c7bb138f501
	.xword	0x7a77ee4822d7a8c7
	.xword	0x87a0e1bed1d97041
	.xword	0x0fbbcc14b996515a
	.xword	0xb07e30ecb9e69d62
	.xword	0x0b6353c1292db306
	.xword	0x22a23a541c5206da
	.xword	0x0269d415db3485f6
	.xword	0x0b51ca0062fa5019
	.xword	0xccaf25537b442d36
	.xword	0x5e15b5b46a99f26f
	.xword	0xf1b419a2487ac2a8
	.xword	0x9e557c240feca6f2
	.xword	0x2ca304c4ef2efb3e
	.xword	0xbc0b0c246a830fd0
	.xword	0x76b9fea8774aa668
	.xword	0xec4a58d807bc1209
	.xword	0x008c69e74e1d3feb
	.xword	0x16769ec8e590a41f
	.xword	0x8b17b9df4fafd4fb
	.xword	0xb5b87f3be35f0a79
	.xword	0x6615491918401e92
	.xword	0xad5b4e0b278e777a
	.xword	0x8ea0094c4b69c030
	.xword	0x8c4e0c8f2c56a078
	.xword	0xb68b3a73d39515a4
	.xword	0xf838b30299c6d1a0
	.xword	0x8e4a47e0d5fed58c
	.xword	0x7a60103d0cf8a18a
	.xword	0xd660eed7638c6ffc
	.xword	0x13398052d1967448
	.xword	0xe73b0aa48bdf867f
	.xword	0x315d27e6efb1cfb0
	.xword	0x17da9f21225e5bc5
	.xword	0x7e6c3917f4a95c8c
	.xword	0x1eda5b20bd01c03d
	.xword	0xcedeb700e9e0305d
	.xword	0x31e5ed49df136928
	.xword	0xcf8c08e52cfe9677
	.xword	0x2c783cd34cf63165
	.xword	0x1873359b99442eed
	.xword	0xb7cc822427a498a7
	.xword	0x4b8bac838f0a4614
	.xword	0x7e8ccc2561bdeaad
	.xword	0x69df7a7ef1ae9226
	.xword	0x7dabfe6c1aa1c14e
	.xword	0x739caf9257050ea8
	.xword	0x94d032944189ce99
	.xword	0x4a729ee80a2c865a
	.xword	0xb926e55cb7f0514a
	.xword	0x2402729d173a39d8
	.xword	0xb573ef76ff7b4ec5
	.xword	0xcd09c182c02cdf0b
	.xword	0xcce26bb2fb55e552
	.xword	0x063cd2b5bbfd9ae5
	.xword	0xedc91eaa3d6d226a
	.xword	0x9431244f652b7503
	.xword	0x2daba432e0086096
	.xword	0xcba869c2df6b3418
	.xword	0xeea1d501927ff52a
	.xword	0xaaf95268890fa39c
	.xword	0x2a1f7d607de2d117
	.xword	0xdfea5595bef55b26
	.xword	0x1772e7cfac26c72f
	.xword	0x1d7e568a9dc4f268
	.xword	0x1f179d3975d927ff
	.xword	0xec3bb4a5ea37d004
	.xword	0x27f5dc5a774e2492
	.xword	0x55de33cb6d5afa82
	.xword	0xc3ac8a8cf7f18bdf
	.xword	0xb8b53273716d4563
	.xword	0xbccb3cc46dadd964
	.xword	0x33addc02d4baceb1
	.xword	0xd5eb8d8dd8097a2a
	.xword	0x1020dbefbd7e497a
	.xword	0x07d60314859e34c6
	.xword	0x13fcfe6ce0d0fcfd
	.xword	0xe240a8989b302eed
	.xword	0xccf2be7fa6834034
	.xword	0x985516ae65a61047
	.xword	0x9d48dbac9ddf7552
	.xword	0x7b0b74b2f8d154d8
	.xword	0x51162bc737204404
	.xword	0xcc6e9c57a7a32248
	.xword	0xb942cbab9e5f41a9
	.xword	0x4ada17c5b91d2d7b
	.xword	0x9df0089abcf6958e
	.xword	0x5a29cf47f07a9e27
	.xword	0x6c0820323c46304a
	.xword	0x86f040b43fb0e9ff
	.xword	0x12a31ae5c14dc81f
	.xword	0x79887197f53faca2
	.xword	0x9b5d67fc5f999edd
	.xword	0x41ed6c84aa1dd6c1
	.xword	0xf51a846c4202513e
	.xword	0x148848b4478510cf
	.xword	0x09925c7b6d0ceafd
	.xword	0xaa4f9c49dbe18130
	.xword	0x1af52f2a87f2ac92
	.xword	0xdc2186750cc7c281
	.xword	0xcfb7f61732f5b853
	.xword	0x2a76dc37bf5cd273
	.xword	0xdca984cf504c7092
	.xword	0xf184296ff296df2a
	.xword	0x5e66fcc1fef68aa0
	.xword	0x84ff9e23767a8e0f
	.xword	0xad54075ecce6ebd4
	.xword	0xece539b5355f4af7
	.xword	0x43e6cfecde1709fa
	.xword	0xf9413f757c7a1ce2
	.xword	0xd3064b4348c0f7ec
	.xword	0x79dc74762d38f910
	.xword	0x71c96fcb065e4c22
	.xword	0xafcb5fd507652ed0
	.xword	0x4835232b61fe5811
	.xword	0x90862638c7c8865d
	.xword	0x42545bb744232857
	.xword	0x942bb9b8afcbf3a7
	.xword	0x8406ba2c191e3a08
	.xword	0x381a506c4ad6fe76
	.xword	0xc63e7a63c4ae1247
	.xword	0xa6cd8d6cf61eeb15
	.xword	0x511cb4b845543538
	.xword	0xa1b615e1a138cddf
	.xword	0x848ced8dd6bd3b46
	.xword	0x66daa5d0ea0c32fb
	.xword	0x20491adafe996d38
	.xword	0x561426a0f17a38c2
	.xword	0xbaf058d952f92786
	.xword	0xebe1a876ec3f511a
	.xword	0xe03a2a09068cce19
	.xword	0x1ab62e62e31836a9
	.xword	0xf59cce13de447807
	.xword	0x6ae0c5eceee96bdd
	.xword	0xe7a4d4c502abd9e3
	.xword	0xdaac4980f84ca05f
	.xword	0x2f000decd7451d74
	.xword	0xeac431197c95f3a4
	.xword	0x756eaa2abd60c20e
	.xword	0x80f06ba0a3f4a44b
	.xword	0x5970bd957d5860b1
	.xword	0xddff18982070490d
	.xword	0x10a9990128211d43
	.xword	0xd6fc6751fa6515e6
	.xword	0xa0b10ae9c702e320
	.xword	0x6eaf252e64889a70
	.xword	0x5b68872d7b6600be
	.xword	0x14bebf31b25171dd
	.xword	0x3ae81b7b20fc1f90
	.xword	0x0fcb2cb95506fc2b
	.xword	0xa8c942125008dda4
	.xword	0xeb8b25443d580ec3
	.xword	0x1d18b2f4f7b24355
	.xword	0x9e7ca4bacc05ca53
	.xword	0x254cca18eea4c5ed
	.xword	0x143e38c1fbec0637
	.xword	0x7ad3b4d53ba2658b
	.xword	0xc9b5513befe417f3
	.xword	0x48c7c89cadc07b20
	.xword	0x3228b41b2a54e7c4
	.xword	0x7e52b60bc56fffb7
	.xword	0x33752c9c0a444d58
	.xword	0x7ea749bf38188157
	.xword	0x9ffeb957def477c6
	.xword	0x475b3cf5bef9222d
	.xword	0x6b43897d1877d574
	.xword	0x62a0c012b2d9151c
	.xword	0xeef376d0b608bb05
	.xword	0x187bbbd0aac268e6
	.xword	0x87b3c8a5156af46d
	.xword	0x4c9d620327f9ac4a
	.xword	0x05061a15bad32122
	.xword	0x4b862f45ad344f66
	.xword	0x5a5938d15d9469c5
	.xword	0xdc0f651b1a74227f
	.xword	0xa30aa7769f80999e
	.xword	0xaed50e185328b346
	.xword	0xd0ca5690ba58d4b6
	.xword	0x7757ab516c907255
	.xword	0x06ed6e1e0f69f8e7
	.xword	0x7a3ae2be9d129346
	.xword	0xeef9a97d3cbc2d2c
	.xword	0xf34205da162d9a41
	.xword	0x9917f64eb2681761
	.xword	0xbd17a55656de854c
	.xword	0x8b9bf64acb36160b
	.xword	0x7a2b6f87f1b88cb9
	.xword	0x51632f58ec46ba36
	.xword	0x87a976a2e358d7f1
	.xword	0xeb0c07a4c10d4bc9
	.xword	0xe69feae1be85d649
	.xword	0x2d568f122365c14c
	.xword	0x62527613b60230dd
	.xword	0xbd011a25dfa221c7
	.xword	0x8961a5f58aabb6bb
	.xword	0x8d2b01f031d2179c
	.xword	0x30030ad545daf19f
	.xword	0x72576a30ddbd6778
	.xword	0x4a95540849dac7fe
	.xword	0x6a413405dc933820
	.xword	0x60176e5fdb5557c8
	.xword	0x516687a50bfc079b
	.xword	0x7be9831cc30f2dca
	.xword	0xd274eff636209cd7
	.xword	0xd5b8d621a5bd60ac
	.xword	0x87f181e47aaa6f42
	.xword	0xbdbb1d05be29fd6f
	.xword	0x92486f2983f8af83
	.xword	0x9bd094c9e8fa1d7c
	.xword	0x414641afc7cbb021
	.xword	0xc81af9f2b87ab4de
	.xword	0x4f33d08a169e42f6
	.xword	0x7fef7ca231f301c9
	.xword	0xe6ba93c12e2dba06
	.xword	0x5e8992295644c602
	.xword	0xac701b838cb72306
	.xword	0x34e7ee30298c560c
	.xword	0xb4ab8009556029c0
	.xword	0x13c959470470a12d
	.xword	0xd485b27a3118a6d5
	.xword	0x855a2136e3cfd385
	.xword	0x7c87df5b1792f17c
	.xword	0x3ea92e40aa468672
	.xword	0x40187e4acbdfd689
	.xword	0xc6187019799656f5
	.xword	0x3e4116924854b4f4
	.xword	0xf6c87f1351841139
	.xword	0x95f5d0c51167c305
	.xword	0x427c689d195f5516
	.xword	0x45f804009a448705
	.xword	0x2cb0c2b14214b13e
	.xword	0x0ed6abb4f7fd9eb1
	.xword	0x1b1c7dd8445c89bd
	.xword	0x247c128f56defea6
	.xword	0xdde80bce6b5d8052
	.xword	0x2568f85256ac6cf8
	.xword	0x028b283ae0097863
	.xword	0x554e4b6a90bb2587
	.xword	0x071a33e4210c6f0d
	.xword	0xf82bdab2a9df33ac
	.xword	0xf2881200dbeaa40a
	.xword	0x121983e46a4b1a99
	.xword	0x00460bd2e6848ad0
	.xword	0x5765dca5babd5a78
	.align 0x40000
	.data
data_start_6:

	.xword	0xeddf18663e3a53a9
	.xword	0xd2521acdae969112
	.xword	0x9886af7706bdf0aa
	.xword	0x87a1ce1172fbd3cd
	.xword	0xc106689fde64dcf0
	.xword	0x3e099d218be948fe
	.xword	0x066b2136c73b7437
	.xword	0xffe894922c013e07
	.xword	0x466463a237fce21d
	.xword	0x1f83538cb76af66e
	.xword	0x2133ca3ae50c2b0f
	.xword	0x48e6b27b384ae0a9
	.xword	0xe9513837bb58b317
	.xword	0x23ef464fde182b7f
	.xword	0xdfdeaeb004b8d62b
	.xword	0xb748d9ba5269fdf6
	.xword	0x10df4bdfaec8143c
	.xword	0x14dcc73dd9ffa24d
	.xword	0xfaafbabf5aa5ea8b
	.xword	0x10e91b242cdf3847
	.xword	0x7e53cef7f84431b4
	.xword	0x051b813bb2155a67
	.xword	0xafa71afbcf631f51
	.xword	0xae9c25fcc5104a80
	.xword	0x6547d84ae6ec03c8
	.xword	0x90f102ba7bb1bd2a
	.xword	0x208455766be35758
	.xword	0xbe8d25f55d61c4e3
	.xword	0xf4d613e07f473886
	.xword	0x6ca75e4485ca70e9
	.xword	0xb94e0cf827a9dd65
	.xword	0x92e947d4214c04cd
	.xword	0xb4bc0203401e6bda
	.xword	0xf115671bcd35b251
	.xword	0xe6b202f72d1eef9c
	.xword	0xe3abc78b698ff2de
	.xword	0xe9aa74cc138180fc
	.xword	0x89457fef2e4ef660
	.xword	0x9905ae316abad457
	.xword	0x9764ec2552d741f2
	.xword	0x0f24605a3912d342
	.xword	0x6c94b38bcb903844
	.xword	0x0a98821b76c21da5
	.xword	0x1f1413de1d39eba2
	.xword	0xb0bbf38037a696e4
	.xword	0xb35ce0f87394a3c8
	.xword	0xa2a46a7cf8c58615
	.xword	0xc3cd17444108ccff
	.xword	0xe6651ef7de28751d
	.xword	0xdbc2a1719d09e2d7
	.xword	0x8f521555136fb733
	.xword	0x6a639def32199ad5
	.xword	0xe020933793b622fc
	.xword	0xa94262cca21f8aa2
	.xword	0x0b92a3314d6f44b2
	.xword	0x7b5fb540e2fb757e
	.xword	0x461ef5c955200b43
	.xword	0xf0655a39f6deb539
	.xword	0x37fe42bd4c9b2a8e
	.xword	0xa295ce121aa7023e
	.xword	0xcffada09d2d50d9e
	.xword	0x866a42ebd7b8803f
	.xword	0x281c8503e32f2a40
	.xword	0x80dac114e7a8afb2
	.xword	0xecbd3380fb3ed455
	.xword	0x1f163ee151fcc949
	.xword	0x8cb2a9b7c61e3e8d
	.xword	0xef4cccd3616fdf10
	.xword	0x676246ce7a65a466
	.xword	0x00b314f4560b78cb
	.xword	0x7b33f719f31a6077
	.xword	0x0af97f79c2c3f137
	.xword	0xae1b7f9829554622
	.xword	0x8c8f97dd31ea591d
	.xword	0xaa7645ba155f11d2
	.xword	0xbf65a29a6f63ba35
	.xword	0x7b9507c32f3b3e20
	.xword	0x51ae2a455d6d7504
	.xword	0x9c20dd7ce6468c5f
	.xword	0x75331762cd69279d
	.xword	0xb1c83fbfac04bbcb
	.xword	0x5474d3d3ec4a5510
	.xword	0x84c509bd97f16f92
	.xword	0x896cc1249360dd5a
	.xword	0xcba10b70d1a43b00
	.xword	0xa230a2f650c91a96
	.xword	0x30f527b320154f0d
	.xword	0xef6291a969627cd0
	.xword	0xa3b500c3eb08e0f3
	.xword	0xae23b26ee9dfc028
	.xword	0xad1c4bd41ad21db7
	.xword	0xb340c023cdb9fab3
	.xword	0xcad94d6dd4894297
	.xword	0x2fe925790f781d4f
	.xword	0xd28d5c60a3ab33f5
	.xword	0xec424a48cf24fc3d
	.xword	0x7e32c4a380734981
	.xword	0xadb18b8d190be758
	.xword	0x517c1c4dc0efed02
	.xword	0x7a6df6f663f7317a
	.xword	0x7f67fc29d72e83b0
	.xword	0xeef234f4f251b782
	.xword	0x61bd430de7e2ea85
	.xword	0xe56a05e87ed6d5e9
	.xword	0x9431f3bab0dddd4f
	.xword	0xa643cdd89bb1582e
	.xword	0x518b0f71e484f5fa
	.xword	0xc0a788d14ee00833
	.xword	0x1108d5e186ac1efe
	.xword	0x9d57a91f48103035
	.xword	0x842c75806d9a06b4
	.xword	0x5e2968997181836d
	.xword	0x10fe9833fa3b6361
	.xword	0xb1aa8ab06685d394
	.xword	0xe871862d78d72c11
	.xword	0x060032dac4de259a
	.xword	0x5df04bb5aa44fd4f
	.xword	0x14f50efa50f61bdd
	.xword	0x2769fe0a34dbfccb
	.xword	0x5a3878444c01391f
	.xword	0x404bad067527a8be
	.xword	0x41a1061dc4c77816
	.xword	0xd378bf1317d14001
	.xword	0x29dde5dc7bf3ca3e
	.xword	0x65a0087cb1eed8c5
	.xword	0x490b08c293ab9518
	.xword	0x71bf2506b12263c8
	.xword	0x8f991306903a313c
	.xword	0xa9465eb74dd9f5fb
	.xword	0xcce8afd0d4796025
	.xword	0x95f071663d536703
	.xword	0x81c8be0d67036818
	.xword	0xa9ff6b6ae7a84997
	.xword	0x753a1b055a44a376
	.xword	0x5b7bfa764cf258ab
	.xword	0x1eeb4c64fc3d22c6
	.xword	0xe5da6d6664a0ba1a
	.xword	0xa5622e8c0501cd62
	.xword	0xeb8d85846f92d756
	.xword	0xdb398bfc72948a4b
	.xword	0x845573d8af6e4cc1
	.xword	0xec919fec894e4498
	.xword	0xf64496aab944f031
	.xword	0x442770f5a95a0b57
	.xword	0xf3fdb4d5ca9b5e98
	.xword	0x32a09f43255cb6e9
	.xword	0x7a1a696271da36d4
	.xword	0x8172d80227cb215e
	.xword	0xb359a6753e71f4a0
	.xword	0x6df1444aec2b2427
	.xword	0x1ca56cb168fdeb82
	.xword	0xf1ca5076364c2f3e
	.xword	0x8fac0a651a49418d
	.xword	0xd026c30976ddf644
	.xword	0x227c058f788c466e
	.xword	0x161cf4c7fb82be02
	.xword	0x1ebc5edb69414134
	.xword	0x9facd6e919ee3f50
	.xword	0xb83d931cc43900cb
	.xword	0xaa6a48a04e8abcaf
	.xword	0xc06c6ccdf4fad5f3
	.xword	0xb39392f9b792cdd6
	.xword	0x5834c817a55192c9
	.xword	0xcbcd0d6214dcdb64
	.xword	0x8bb61125f5b321bb
	.xword	0x836f7cfdc9d7ded6
	.xword	0x3417229a63701965
	.xword	0x5d3375bde385f09b
	.xword	0x95e3bac062c44803
	.xword	0xebd61acc3717c0aa
	.xword	0x94bdc8cd8bc9494b
	.xword	0x6d70470448841120
	.xword	0x986066dd28ff93d0
	.xword	0xd32bd3919c6f98d9
	.xword	0xbae8e16443b5d924
	.xword	0x939faea3c88f161b
	.xword	0x10e494f0c4c1f5fa
	.xword	0x4dbd4fed41738260
	.xword	0xb608510952fe4991
	.xword	0x78503ff633e38a07
	.xword	0x318934d4f6d68898
	.xword	0xaa31b4ae7c97bb12
	.xword	0x062e39af1ebc5433
	.xword	0xda042300d2dbb7a3
	.xword	0xea7d6487a17011a3
	.xword	0x3dc0f420d2119867
	.xword	0xd7e9267b3ca86f4b
	.xword	0xbf559aa9e1d1a01e
	.xword	0xcd133dafe2245cd3
	.xword	0xec2d863cc4a874be
	.xword	0x8af0bd6b59eca439
	.xword	0x7fae16f49f3d1e37
	.xword	0x7930e0b67cb54a54
	.xword	0xa52cf5c8a05ecd50
	.xword	0xea3104510bb2dfe8
	.xword	0x45e72bb07945bf25
	.xword	0xbd6d8f6b14959f2d
	.xword	0x4e0d6b09a27b7ec4
	.xword	0x8ffc366f5fad3e6d
	.xword	0x1bc6b4300809a996
	.xword	0xe3eeb2a64798ba06
	.xword	0xe9b7967f89f57d6b
	.xword	0xb129c1b03149993b
	.xword	0x4f8d6bd65bcbde71
	.xword	0xee01bfffc04efed7
	.xword	0x68cfa3b67d94effd
	.xword	0xaac758cbcab52af2
	.xword	0x44573fff901b7502
	.xword	0x995c73ddbae4c7b4
	.xword	0x08d1c94ac3ddd9e4
	.xword	0x205ac574b0ee1cbb
	.xword	0xa6646bb3cae7a02e
	.xword	0x951f96cbbbd53598
	.xword	0x54f8c8caf3f847e1
	.xword	0x1e5e2c6b40951966
	.xword	0x465d48548d6b893e
	.xword	0xda54297cc8e9bfd0
	.xword	0xe1c230a5a1c3d009
	.xword	0x7e32e5968b21eac3
	.xword	0xf400a683315e4121
	.xword	0x411c4a91d4bd9f72
	.xword	0x614e5d407ac8619c
	.xword	0x0ff58f95ae164af0
	.xword	0x0b95de8649541f05
	.xword	0x848d4106d48f49ac
	.xword	0x6b0c32bf8d37ed01
	.xword	0x6425d710f878fe84
	.xword	0x2792eced1b9f09ec
	.xword	0xde4fb84a7736b8d9
	.xword	0x6af78ceac2c3aa70
	.xword	0x40b17bb3b39d2c9f
	.xword	0xc14afaa8e634e64d
	.xword	0x32746f0a8bfe85a3
	.xword	0xae5cffcdc60a99f1
	.xword	0xe58c2a7a1440c45d
	.xword	0x0ebb9e817774e43d
	.xword	0x226948569dce7651
	.xword	0xc250d609494971fb
	.xword	0x28571a9b63312657
	.xword	0x02fe34f8f95ca396
	.xword	0x98c91b8a1ffc7620
	.xword	0x128d110f0c18b50e
	.xword	0x28354bb9da9c6557
	.xword	0x0e9510d00e5a3ab3
	.xword	0xe83aa8b91382d5c5
	.xword	0x02573f21002c4c16
	.xword	0x8311ac65dfd604ce
	.xword	0x350ed34886dbfbec
	.xword	0x5afd409eac3142f6
	.xword	0xeae1186120f7179b
	.xword	0xc723280c9724a03d
	.xword	0xbeb23c9ab046e638
	.xword	0x5b4c9f1124b2815e
	.xword	0xb8b6429a609de6f7
	.xword	0xcace1e8dcf30dcb8
	.xword	0x16fd1608568136a2
	.align 0x80000
	.data
data_start_7:

	.xword	0xfdbb428805c308c7
	.xword	0xa757698fbb026160
	.xword	0xe1d5df00e77af84e
	.xword	0x44f1c68a19f9d14e
	.xword	0xe264b72f3bd45778
	.xword	0x194017bcffb7bb6d
	.xword	0xb62b9c1b1e3817ce
	.xword	0xbd10d5d300b781d7
	.xword	0x48d45f564ecb5c89
	.xword	0xd7fc0131af48faa2
	.xword	0x9d94a1af5d3599a5
	.xword	0x7828ce2923c8af50
	.xword	0xc3029c35802db918
	.xword	0x01b8ca5e45d589a9
	.xword	0x1bc09b718007b399
	.xword	0xf2578dd278dc32d7
	.xword	0xc14bf612d21d5323
	.xword	0x68f02fc755fc2d03
	.xword	0x25f0bbc259b8338f
	.xword	0xd121af6e2abaf5cb
	.xword	0x891e606ae9ac5dbb
	.xword	0xe071fc41fed498fb
	.xword	0xab5e4947faa5ae39
	.xword	0x2226d990b73acae4
	.xword	0x3b3b3a7c5a1376ce
	.xword	0x11d864dbe7110c42
	.xword	0x2870aa06c43e4f99
	.xword	0x1542aae102034f80
	.xword	0xc868deb9a257a03f
	.xword	0x1080d40f9e111b86
	.xword	0xe1fcbc2c9ef51f94
	.xword	0x5613fe8b712b8d80
	.xword	0xa39de69ee6e4cb9f
	.xword	0x20ad91d57c24caab
	.xword	0xaa99d7075ebfd762
	.xword	0x4086430dba4fc1ef
	.xword	0x360eb35b819b7bdc
	.xword	0x73bb9c2891779b63
	.xword	0x9ca675743b77ba09
	.xword	0x82537568a5215033
	.xword	0x8e6d9c7d902d2c63
	.xword	0x8113f48fe1102b58
	.xword	0xd3327813bec2e0af
	.xword	0x936a1c70d1cdb616
	.xword	0x1d930b80e402cc12
	.xword	0x9eeacb6096cfb7fd
	.xword	0x7c68430cdc1477e4
	.xword	0x0c6924e15d1b38f5
	.xword	0xd67e76713a11ae22
	.xword	0xbacc3e289a5c7eaa
	.xword	0x12a9540b1723c2db
	.xword	0xed009734d44c6871
	.xword	0xa9eb6fd2250260d3
	.xword	0x92b09d213f6772b6
	.xword	0x846a67cdfe307fcd
	.xword	0x4523279b1b6df30a
	.xword	0x26483d34cd7878ea
	.xword	0x497ae6e696e472a1
	.xword	0x88e79c2620ae684c
	.xword	0x5105ec9688bd7122
	.xword	0x5901b6c84a4844e0
	.xword	0x451f44e7aafd0071
	.xword	0x2956917621e1b3ca
	.xword	0x5a2d63f5f42f1fc5
	.xword	0x066829c519fd5034
	.xword	0x96f86682e804eda9
	.xword	0x24128e118a0e2639
	.xword	0x6fdc23af8d11cfa1
	.xword	0x141d22989c825fa8
	.xword	0x904d73abbdf03614
	.xword	0x7a197700258c1f07
	.xword	0x83c8dfb0641c1e9e
	.xword	0xf622f60b5921ab96
	.xword	0xb31e7e06b5a5e4d8
	.xword	0x61eaac415f410a19
	.xword	0x4e9ebb4f53dcd850
	.xword	0x2af6d69e1bbd7820
	.xword	0x5db1f584bc0f7d06
	.xword	0x962ad9667b15ad95
	.xword	0x2e5daf0576cfa061
	.xword	0x96869b52757d3ae6
	.xword	0xa18b1c72069ef7bd
	.xword	0xaeeaedc628e27e63
	.xword	0x7fa155bf39822923
	.xword	0x913c1d4a30dbd336
	.xword	0x1e573f38ef67aed4
	.xword	0x6b00f008dfaa7d0f
	.xword	0xfc14b480bfb374a6
	.xword	0x72f7585b6334f70b
	.xword	0x659f6daa6dc758cb
	.xword	0xf7a195164194d750
	.xword	0xa63d9d352349c68f
	.xword	0x56fed1b4f7bf7d4c
	.xword	0xeb418fd0a8313908
	.xword	0xd977942ca16832f6
	.xword	0xf99cda8bff9d311f
	.xword	0x4e03b3ebad5b82f6
	.xword	0xce4c2b9d0d318e41
	.xword	0x81a16dcb03ec4630
	.xword	0x9ef421f5e9d49bb1
	.xword	0xe0e1fe63f7555af4
	.xword	0x6608804928210ae7
	.xword	0xe175e17a32728f1c
	.xword	0x3c469e579c72d1ca
	.xword	0xb08227dad5001b6b
	.xword	0x31c99bdc8ba722e1
	.xword	0x1c82e064da88bfd6
	.xword	0xce809e5b79b187e8
	.xword	0xe7fb7b6a962872e5
	.xword	0x41076e600d93c569
	.xword	0x76b251ec437d497e
	.xword	0x5ec47f5c2a5ac0a4
	.xword	0xcc3e995b8d551e3c
	.xword	0x36f699e53107796d
	.xword	0xbc07ba265d13b0ed
	.xword	0x27c9955209c9a8bc
	.xword	0xe9289f0e64c5f15c
	.xword	0xef373cad40840a42
	.xword	0xf01e9252999f9d4b
	.xword	0x1fbd36f7740c2c87
	.xword	0x1117ee048fe1cd56
	.xword	0x797a376ba53b1258
	.xword	0xcba37e712e762346
	.xword	0xfcab2f66a17f4a9d
	.xword	0xb9e4352a7fe5c8f4
	.xword	0xf6c33cf2f6bb53f3
	.xword	0x740347f1a30079e5
	.xword	0xb2a5e1d2449e2c18
	.xword	0x25de2aa0277ee10d
	.xword	0x6b19025b98b66a9c
	.xword	0xb384007a0a183a00
	.xword	0xdd2e2dbb80329714
	.xword	0x0f487350d9422e33
	.xword	0x3faf7ba2b23cefe2
	.xword	0x8d72841010888995
	.xword	0xe46adae885dd0707
	.xword	0xb86b7e2d2b65eebc
	.xword	0x88a6236caf763106
	.xword	0x97ca252f310390c6
	.xword	0xe2b96ce832b8ac4d
	.xword	0x08fd1c42d2610129
	.xword	0x6d6349ca32460b35
	.xword	0xa152c76662bfa2be
	.xword	0x15aed4538fe810da
	.xword	0xd7a5ff6d738fe8e7
	.xword	0x9576d2d191124247
	.xword	0xcd95f86477f3c60d
	.xword	0xcacdf03bcbfdaeae
	.xword	0xffecb34c0cbd7479
	.xword	0x10fec48707e24e01
	.xword	0xdece65d9d4cb82be
	.xword	0x06c51aacd105431c
	.xword	0x76cd53288826a337
	.xword	0xdd70a52201b16506
	.xword	0x9f49247563e4a1c7
	.xword	0x5edd4a4ca4a4de3b
	.xword	0x8839719bcaff206a
	.xword	0x3e35e145acc5c8ac
	.xword	0xaad049eae0a608fa
	.xword	0x5053f9297416b858
	.xword	0xa9f1c1e266984d83
	.xword	0x07abf29e29009825
	.xword	0xf657b5058a567bce
	.xword	0x6b033a976e5e625e
	.xword	0xac68b3166f5fd7ae
	.xword	0xbf770f675af1ef2c
	.xword	0x1796a8898576d907
	.xword	0x118529b4f932a2f0
	.xword	0xbfe7604f6c5dc124
	.xword	0xf1f5a28a4f88615d
	.xword	0x37e9d6eff1fca7a4
	.xword	0x218dc3a77a142696
	.xword	0x50146177c5d6738c
	.xword	0xc7dc883d2ca084c2
	.xword	0x7c8ebc055c125a17
	.xword	0xa7afc62a3a893ab8
	.xword	0x1cb56c7d38871d7f
	.xword	0xad9a505a11f000c3
	.xword	0xb508f49a2c82d73f
	.xword	0x19fc08bdb9bad7f1
	.xword	0x0a21c7615bd78d1e
	.xword	0x85fc6208a537fbc8
	.xword	0xd8a33366dd0f745f
	.xword	0x0a79d703db2505ba
	.xword	0xc822b61625502cb9
	.xword	0x7d8fd18fdef061dc
	.xword	0xe3cfa0fdb26f41a6
	.xword	0x1f7546d5c897d4bf
	.xword	0x9835638a41ec80ba
	.xword	0x9bd3e5b3c191c675
	.xword	0xc6d25a027f0ab7e8
	.xword	0x96f64ed19957bcd6
	.xword	0x1f5b2c4422e17661
	.xword	0x0922d73c091c9bc9
	.xword	0xb7b2794fadab1def
	.xword	0xa8f4b7fa0a5bc7da
	.xword	0xe6ed081592bb7efc
	.xword	0x415601ace08d3a7b
	.xword	0xac0a017927f68d14
	.xword	0x6842784ce41ba1e3
	.xword	0x64c3f87908ecf201
	.xword	0x32fc3247023efb8f
	.xword	0x8b39365cf1c580c1
	.xword	0x82dc903a6259c81b
	.xword	0x2bf1c7580851a20d
	.xword	0x4bad1e651701b5e3
	.xword	0x9a9d2abf32651f2d
	.xword	0xbdd4f3ecc74f2260
	.xword	0x0630ff5541e511f4
	.xword	0xdd2aded5f94ca593
	.xword	0xf76b966dc55e3400
	.xword	0xbb5c5e2ee525d6b4
	.xword	0x1cbf97d461445cc2
	.xword	0x9a58ab5a9d7b4018
	.xword	0x7e05de24d6ea4bcd
	.xword	0xd47514e583ee5829
	.xword	0x01f33e6cb962b617
	.xword	0xe3fb2bf519e5eb0d
	.xword	0x5217c57fc4d055e1
	.xword	0x332e338ef63f3b60
	.xword	0xcb7a842c57963f36
	.xword	0x752e785ddb246579
	.xword	0x2ef897e87583bfc6
	.xword	0xa51e198abf0c08bb
	.xword	0x2aa565c96cae223c
	.xword	0x1166142ef1195aa5
	.xword	0x3ad8dc2d4fc91e2a
	.xword	0xc65c247c39a03650
	.xword	0xfb45f82e728cfb0a
	.xword	0x04a4764349265cb0
	.xword	0x65ad912626821ff7
	.xword	0x0e55f19654d8f481
	.xword	0x420d5b0b5547e60b
	.xword	0x3f7f7d591039df33
	.xword	0x0cfa6f51bcae3197
	.xword	0xe516c72f094951d5
	.xword	0x39df27ab84818f57
	.xword	0xa2a6253f11b7d702
	.xword	0x4852ac54e9b05ddc
	.xword	0x7e6aa700502df21a
	.xword	0x17605f36019f27e3
	.xword	0x10aec97a64374ee0
	.xword	0xf0927c28ee76ae0f
	.xword	0xb0e66a2a3596e9dc
	.xword	0x421f3a38ff2a6c0a
	.xword	0x079dcc76e16f684c
	.xword	0xfc439cb7c1feefe5
	.xword	0xc1b902c9d63d5932
	.xword	0x6c1b98a241e7fc96
	.xword	0x9cc761f0e91adc0d
	.xword	0x35e6b39f867879d8
	.xword	0x29bf17c6f8ebb409
	.xword	0x4a7b873739e549e2
	.xword	0x77ca77fb4ae02232
	.xword	0xfc3388131ae65d12
	.xword	0x7fe6ba7f973d82c5



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
