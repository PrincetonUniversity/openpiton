// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_94_s2.s
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
   random seed:	666688225
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

	setx 0xab77acfb1f11bd1f, %g1, %g0
	setx 0x7b9197ecc26a4cba, %g1, %g1
	setx 0xaa5101d6d423c6f0, %g1, %g2
	setx 0x5555bb2c035c745e, %g1, %g3
	setx 0xb2a5f1366ca8e4cd, %g1, %g4
	setx 0x1bc3905b2ed6c78d, %g1, %g5
	setx 0xba304f09a21baeca, %g1, %g6
	setx 0xfa3041c2eb65dec6, %g1, %g7
	setx 0x6e0f8876eed92b74, %g1, %r16
	setx 0x58ef55acb5e7dc12, %g1, %r17
	setx 0x582e26a7da49c273, %g1, %r18
	setx 0x5c385e35b8eaca6c, %g1, %r19
	setx 0xf05779e8fc311afa, %g1, %r20
	setx 0x51030b363d97cf7d, %g1, %r21
	setx 0x142a2961f45d0d9b, %g1, %r22
	setx 0x6c024ada59f79519, %g1, %r23
	setx 0xffa429928b32e3a3, %g1, %r24
	setx 0xfabb40fe499bb19c, %g1, %r25
	setx 0x44b5606e4bfa5e84, %g1, %r26
	setx 0x0e83d91c02844646, %g1, %r27
	setx 0xa37dc94453125ffd, %g1, %r28
	setx 0x38f4e69eb28c436a, %g1, %r29
	setx 0x669f0f3000456504, %g1, %r30
	setx 0x0688558a4126a8f9, %g1, %r31
	save
	setx 0x5112552eb99b5e39, %g1, %r16
	setx 0x030f7a7b61da767a, %g1, %r17
	setx 0xc3aadc11e0567bc5, %g1, %r18
	setx 0x21af9c8602849c7d, %g1, %r19
	setx 0x2803f54680415fa5, %g1, %r20
	setx 0x1f1df52fe238b39e, %g1, %r21
	setx 0xb63208fd3ae65fd7, %g1, %r22
	setx 0x798c81760b832cbd, %g1, %r23
	setx 0x3c0952b51b77b2f4, %g1, %r24
	setx 0xc6d9b38c0b5c929e, %g1, %r25
	setx 0x5b001bbdc0c1d73d, %g1, %r26
	setx 0xc18078248ce30d8e, %g1, %r27
	setx 0x8820904f7d200fcc, %g1, %r28
	setx 0xbf5deed4fe0a5f7a, %g1, %r29
	setx 0x869558345cd96899, %g1, %r30
	setx 0xf8877b51066676eb, %g1, %r31
	save
	setx 0xfc1475de789369bb, %g1, %r16
	setx 0xf02d5950ca9005dd, %g1, %r17
	setx 0x5bf32addca16f8b0, %g1, %r18
	setx 0x75b50325f7eecf8a, %g1, %r19
	setx 0xa068ab61539acd90, %g1, %r20
	setx 0x8d700f49fe43b61e, %g1, %r21
	setx 0x02a5d6463afb18a8, %g1, %r22
	setx 0x1a1e5b58ee3a827e, %g1, %r23
	setx 0x509dbbf8cfa13ded, %g1, %r24
	setx 0xce0aa058f1a0ae87, %g1, %r25
	setx 0xd5f99ebd73bd763c, %g1, %r26
	setx 0x8c30ac6048ab52e8, %g1, %r27
	setx 0x50e7237166382b6b, %g1, %r28
	setx 0x8ba1108b0d2359ce, %g1, %r29
	setx 0x3d236d4aed747b55, %g1, %r30
	setx 0xe5ec052d41f30c10, %g1, %r31
	save
	setx 0xcd394b83dc234f94, %g1, %r16
	setx 0x42c7f4beb69fae50, %g1, %r17
	setx 0xd81692d3b866ed3e, %g1, %r18
	setx 0xe9d26e9398d9f990, %g1, %r19
	setx 0x7b9c980f74c4a35a, %g1, %r20
	setx 0x8871085e43e2d2a9, %g1, %r21
	setx 0x4cf9da7020adefda, %g1, %r22
	setx 0xf3b26b2b6eeeeec7, %g1, %r23
	setx 0x84d74acc89662c0b, %g1, %r24
	setx 0xc0dae833dfa3240a, %g1, %r25
	setx 0x41da32a71d8115cc, %g1, %r26
	setx 0xb4a99e31f32808b8, %g1, %r27
	setx 0x3a8d89cfb040a028, %g1, %r28
	setx 0x511136da3aabbfa4, %g1, %r29
	setx 0x807d34695a0e6e14, %g1, %r30
	setx 0xed0b774d5692766f, %g1, %r31
	save
	setx 0x16014494fe79570d, %g1, %r16
	setx 0xb4da322b33043d89, %g1, %r17
	setx 0xfb89cc084dc9629f, %g1, %r18
	setx 0x176e333851960fb0, %g1, %r19
	setx 0x2141953785ed6556, %g1, %r20
	setx 0x182ea0ac020054b4, %g1, %r21
	setx 0x4414761f1dd20439, %g1, %r22
	setx 0x5d3cf96ef5500684, %g1, %r23
	setx 0xe8fae9433c5e539f, %g1, %r24
	setx 0xc20436cbc5796ed7, %g1, %r25
	setx 0xcc02cd658dcb8753, %g1, %r26
	setx 0x22285ca8919e70e8, %g1, %r27
	setx 0x6a7e488b11184e57, %g1, %r28
	setx 0x3f478b640cfd434f, %g1, %r29
	setx 0x737c923085b84def, %g1, %r30
	setx 0x4d13e3e294ad5fde, %g1, %r31
	save
	setx 0xca3a7efe6b88ca0b, %g1, %r16
	setx 0x3d853b023f9524b5, %g1, %r17
	setx 0x405aa379fca868cb, %g1, %r18
	setx 0x95a774d3a8607147, %g1, %r19
	setx 0x018d296b094ea5f6, %g1, %r20
	setx 0x522f6e46c02d1355, %g1, %r21
	setx 0x349bac9264fbcfab, %g1, %r22
	setx 0x4a9a3e5d60a803c0, %g1, %r23
	setx 0x6167ef1d5244e140, %g1, %r24
	setx 0x415d9220791df660, %g1, %r25
	setx 0x23940640ef2e4d3b, %g1, %r26
	setx 0xcc6aed382e613783, %g1, %r27
	setx 0xe0da92973fcdbb2b, %g1, %r28
	setx 0xf352a907d9408920, %g1, %r29
	setx 0x464d7e2ea612d5c8, %g1, %r30
	setx 0x6273725d900d3293, %g1, %r31
	save
	setx 0xab204ae6b26854b8, %g1, %r16
	setx 0x4f0586dc4d8c7e7a, %g1, %r17
	setx 0x09f60f24f8e5dc69, %g1, %r18
	setx 0x61bda79a856eb4ff, %g1, %r19
	setx 0xd3b89be5f91cd522, %g1, %r20
	setx 0xfa78d6eccd4f9198, %g1, %r21
	setx 0x8b059bd7ff99f557, %g1, %r22
	setx 0xb9961d0dc3569e33, %g1, %r23
	setx 0xe5b979f26e3cffa5, %g1, %r24
	setx 0x1ca8b62a3c5f1edf, %g1, %r25
	setx 0xa63130ad05c60c4c, %g1, %r26
	setx 0xa33848699c4069ce, %g1, %r27
	setx 0x6d757212af9e6f71, %g1, %r28
	setx 0x34700c82333f690b, %g1, %r29
	setx 0x53e153b36fabe569, %g1, %r30
	setx 0x34b4f69c351bef38, %g1, %r31
	save
	setx 0xb921075f11e15404, %g1, %r16
	setx 0x3f65525cd5eb70e7, %g1, %r17
	setx 0x8ff04c16b0925407, %g1, %r18
	setx 0x7d04cfd12b55dbc6, %g1, %r19
	setx 0xbf541414a4cb9c34, %g1, %r20
	setx 0xe54af6181d39ec63, %g1, %r21
	setx 0x6c36bf8c8830b53f, %g1, %r22
	setx 0x14b4fa9950faf32b, %g1, %r23
	setx 0x024c0d3a56f5c27b, %g1, %r24
	setx 0xc4c56e9e12b07a3e, %g1, %r25
	setx 0x9dc770c103dc415f, %g1, %r26
	setx 0x4f18fbcdc2ef8767, %g1, %r27
	setx 0x0f7cbf899fb8271c, %g1, %r28
	setx 0x2a705d753cb4980c, %g1, %r29
	setx 0x00e17d4736292d36, %g1, %r30
	setx 0xb36896a4b43e5216, %g1, %r31
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
	.word 0xb3e520d8  ! 2: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e5e105  ! 4: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0e3  ! 8: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xba1d619a  ! 10: XOR_I	xor 	%r21, 0x019a, %r29
	.word 0xb7641800  ! 15: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xb5e5e190  ! 20: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb6250000  ! 21: SUB_R	sub 	%r20, %r0, %r27
	.word 0xb7e5a04f  ! 27: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb69d8000  ! 29: XORcc_R	xorcc 	%r22, %r0, %r27
	.word 0xbfe46165  ! 31: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_3, %g1, %r19
	.word 0xb7e52061  ! 34: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9504000  ! 36: RDPR_TNPC	<illegal instruction>
	.word 0xb951c000  ! 41: RDPR_TL	<illegal instruction>
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 47: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4e005  ! 50: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e46166  ! 54: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e521c7  ! 56: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f9b  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9b, %hpstate
	.word 0xb9e460da  ! 65: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	.word 0xbbe4a193  ! 76: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e02a  ! 77: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5210b  ! 78: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5e144  ! 80: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe4607b  ! 82: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e195  ! 88: WRPR_TNPC_I	wrpr	%r19, 0x0195, %tnpc
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e0da  ! 95: WRPR_TSTATE_I	wrpr	%r19, 0x00da, %tstate
	.word 0xbfe5a19e  ! 96: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe46022  ! 100: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4201d  ! 101: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3504000  ! 102: RDPR_TNPC	<illegal instruction>
	.word 0xb52c6001  ! 107: SLL_I	sll 	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xb72c2001  ! 113: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xb1e560e3  ! 117: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e4e087  ! 121: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xb9e5e0ad  ! 133: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb6b46177  ! 135: SUBCcc_I	orncc 	%r17, 0x0177, %r27
	.word 0xb9e5617a  ! 138: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a041  ! 139: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe52061  ! 143: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7480000  ! 144: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a0ca  ! 151: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xb63d21b6  ! 163: XNOR_I	xnor 	%r20, 0x01b6, %r27
	.word 0xb5508000  ! 164: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xb7e5610d  ! 167: SAVE_I	save	%r21, 0x0001, %r27
	mov	0, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a108  ! 173: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4e0ab  ! 178: SAVE_I	save	%r19, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 181: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde4e097  ! 184: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 188: RDPR_TICK	<illegal instruction>
	.word 0xbfe5a1fd  ! 192: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e461b1  ! 193: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_3, %g1, %r18
	.word 0xbd7ca401  ! 195: MOVR_I	movre	%r18, 0x1, %r30
	.word 0xb3e560da  ! 199: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8995a1c2  ! 201: WRPR_TICK_I	wrpr	%r22, 0x01c2, %tick
	.word 0xb5e560fc  ! 202: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8d95e179  ! 203: WRPR_PSTATE_I	wrpr	%r23, 0x0179, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x87946060  ! 206: WRPR_TT_I	wrpr	%r17, 0x0060, %tt
	.word 0xb7e5a0f6  ! 207: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e52194  ! 210: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e5204a  ! 211: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a0c5  ! 217: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e52050  ! 218: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5e180  ! 223: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5e14c  ! 224: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a011  ! 228: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbe1c603f  ! 229: XOR_I	xor 	%r17, 0x003f, %r31
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0xb5e56187  ! 233: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4a072  ! 234: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_7, %g1, %r22
	.word 0xbbe4e19d  ! 237: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a097  ! 239: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e421ba  ! 242: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e4a12b  ! 244: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb00c8000  ! 246: AND_R	and 	%r18, %r0, %r24
	.word 0xbb540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xb9e5e1a7  ! 251: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e560b6  ! 252: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1e2  ! 255: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5e15f  ! 257: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0xb5e5a100  ! 261: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983899  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1899, %hpstate
	setx	data_start_2, %g1, %r19
	.word 0xb9e5208e  ! 267: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x819829db  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09db, %hpstate
	.word 0xbfe421db  ! 271: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_2, %g1, %r18
	.word 0x81952083  ! 277: WRPR_TPC_I	wrpr	%r20, 0x0083, %tpc
	.word 0xb5e421c5  ! 279: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 282: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb20de198  ! 287: AND_I	and 	%r23, 0x0198, %r25
	.word 0xb5e5a11c  ! 290: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5e1b8  ! 297: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e4e167  ! 301: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4e134  ! 305: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a05e  ! 309: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5e112  ! 310: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xbb50c000  ! 316: RDPR_TT	<illegal instruction>
	.word 0xb1e5211c  ! 317: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d94a022  ! 325: WRPR_PSTATE_I	wrpr	%r18, 0x0022, %pstate
	.word 0x8995600d  ! 328: WRPR_TICK_I	wrpr	%r21, 0x000d, %tick
	.word 0xb3e4a1df  ! 330: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e46172  ! 332: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb33d2001  ! 338: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb9e46054  ! 342: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a0c4  ! 345: WRPR_TPC_I	wrpr	%r22, 0x00c4, %tpc
	.word 0xb3500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0xba04a0d8  ! 349: ADD_I	add 	%r18, 0x00d8, %r29
	.word 0xbde560bd  ! 354: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e42043  ! 355: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf2d7001  ! 357: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xbbe4e156  ! 360: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8d9521d7  ! 363: WRPR_PSTATE_I	wrpr	%r20, 0x01d7, %pstate
	.word 0x8995e1a7  ! 364: WRPR_TICK_I	wrpr	%r23, 0x01a7, %tick
	.word 0xb5e52128  ! 366: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x21e, %g1, %o0
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
	.word 0xbfe5a040  ! 377: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8994e125  ! 378: WRPR_TICK_I	wrpr	%r19, 0x0125, %tick
	.word 0xbfe4e1af  ! 380: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x919560d9  ! 383: WRPR_PIL_I	wrpr	%r21, 0x00d9, %pil
	.word 0xb7e5e051  ! 384: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e5e0a0  ! 387: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4a073  ! 389: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4a02f  ! 391: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe52192  ! 394: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8194a162  ! 395: WRPR_TPC_I	wrpr	%r18, 0x0162, %tpc
	.word 0xb5e4a0b0  ! 396: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e560e0  ! 399: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde52191  ! 400: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a18c  ! 406: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_1, %g1, %r21
	.word 0xb1e5e069  ! 410: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x879561c8  ! 411: WRPR_TT_I	wrpr	%r21, 0x01c8, %tt
	.word 0xb9e42025  ! 416: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e46076  ! 417: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbec58000  ! 418: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0xb7e42067  ! 426: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbb2cd000  ! 428: SLLX_R	sllx	%r19, %r0, %r29
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a12f  ! 433: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb2958000  ! 437: ORcc_R	orcc 	%r22, %r0, %r25
	.word 0xb1e4a097  ! 438: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x89956138  ! 439: WRPR_TICK_I	wrpr	%r21, 0x0138, %tick
	ta	T_CHANGE_HPRIV
	.word 0x8198288b  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088b, %hpstate
	.word 0xbbe4203a  ! 445: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5e1a7  ! 447: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a12a  ! 449: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb51c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xb3e4a022  ! 452: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e420e1  ! 453: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e52090  ! 454: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5603f  ! 457: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e521e5  ! 462: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb33c0000  ! 469: SRA_R	sra 	%r16, %r0, %r25
	.word 0x9195600f  ! 470: WRPR_PIL_I	wrpr	%r21, 0x000f, %pil
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 475: RDPR_TSTATE	<illegal instruction>
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a095  ! 483: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0x8394a08c  ! 486: WRPR_TNPC_I	wrpr	%r18, 0x008c, %tnpc
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561bd  ! 492: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe56151  ! 495: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e560de  ! 496: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf480000  ! 498: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	.word 0xbbe42105  ! 508: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c41  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c41, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde4e11f  ! 519: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1510000  ! 521: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xbbe4a135  ! 527: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe561a9  ! 531: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbc9c0000  ! 533: XORcc_R	xorcc 	%r16, %r0, %r30
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e037  ! 536: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0x8f932000  ! 541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e420b5  ! 546: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e421ef  ! 547: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e114  ! 549: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb0c4c000  ! 552: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb9e5a0a4  ! 555: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5504000  ! 559: RDPR_TNPC	<illegal instruction>
	.word 0xb12d1000  ! 566: SLLX_R	sllx	%r20, %r0, %r24
	.word 0x8394a128  ! 568: WRPR_TNPC_I	wrpr	%r18, 0x0128, %tnpc
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e461f4  ! 573: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb2b5a0e5  ! 577: SUBCcc_I	orncc 	%r22, 0x00e5, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	.word 0xbde56178  ! 586: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a09b  ! 587: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x839420ef  ! 590: WRPR_TNPC_I	wrpr	%r16, 0x00ef, %tnpc
	.word 0xb815a12d  ! 591: OR_I	or 	%r22, 0x012d, %r28
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e154  ! 595: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e561ad  ! 597: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 598: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5a17f  ! 600: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5510000  ! 601: RDPR_TICK	<illegal instruction>
	.word 0xba848000  ! 602: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0x8795e03b  ! 607: WRPR_TT_I	wrpr	%r23, 0x003b, %tt
	.word 0xb73d9000  ! 608: SRAX_R	srax	%r22, %r0, %r27
	setx	0x10014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e520a4  ! 610: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4e026  ! 611: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x89956116  ! 612: WRPR_TICK_I	wrpr	%r21, 0x0116, %tick
	.word 0xb9480000  ! 614: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e461d6  ! 615: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb20d4000  ! 616: AND_R	and 	%r21, %r0, %r25
	.word 0xb5e460c4  ! 618: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb9e4e0b5  ! 620: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd359000  ! 621: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xb9e46048  ! 622: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4a033  ! 626: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf51c000  ! 627: RDPR_TL	<illegal instruction>
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e520e9  ! 632: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xba35a1ef  ! 633: ORN_I	orn 	%r22, 0x01ef, %r29
	.word 0x8d94e19a  ! 635: WRPR_PSTATE_I	wrpr	%r19, 0x019a, %pstate
	.word 0xb3e421f3  ! 638: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5500000  ! 644: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a127  ! 648: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4e168  ! 649: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5608a  ! 653: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb29c615a  ! 663: XORcc_I	xorcc 	%r17, 0x015a, %r25
	.word 0x8995a067  ! 669: WRPR_TICK_I	wrpr	%r22, 0x0067, %tick
	.word 0xb7e5606f  ! 676: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_5, %g1, %r16
	.word 0xbfe5605b  ! 682: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb2942196  ! 683: ORcc_I	orcc 	%r16, 0x0196, %r25
	.word 0xbb7c0400  ! 686: MOVR_R	movre	%r16, %r0, %r29
	.word 0xbbe561e7  ! 690: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8d94e09f  ! 692: WRPR_PSTATE_I	wrpr	%r19, 0x009f, %pstate
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9461e2  ! 696: WRPR_PSTATE_I	wrpr	%r17, 0x01e2, %pstate
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a073  ! 699: WRPR_TT_I	wrpr	%r22, 0x0073, %tt
	.word 0xb9e420d7  ! 700: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e520ef  ! 701: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a07d  ! 702: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4604d  ! 704: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a083  ! 705: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5510000  ! 707: RDPR_TICK	<illegal instruction>
	.word 0xbbe460ef  ! 709: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e5a0f6  ! 711: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4e12c  ! 716: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0xb8bcc000  ! 721: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0x9195e123  ! 728: WRPR_PIL_I	wrpr	%r23, 0x0123, %pil
	.word 0xb5e561f3  ! 730: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbb50c000  ! 733: RDPR_TT	<illegal instruction>
	.word 0xb3e560d2  ! 734: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e4a1d8  ! 735: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 738: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9353001  ! 740: SRLX_I	srlx	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb634c000  ! 747: SUBC_R	orn 	%r19, %r0, %r27
	.word 0xb5504000  ! 750: RDPR_TNPC	<illegal instruction>
	.word 0xb1e42145  ! 751: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e039  ! 768: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e4a09c  ! 770: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a104  ! 775: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e1d0  ! 777: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8d95e1a6  ! 784: WRPR_PSTATE_I	wrpr	%r23, 0x01a6, %pstate
	.word 0xbbe4209d  ! 789: SAVE_I	save	%r16, 0x0001, %r29
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10322, %g1, %o0
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
	.word 0xba354000  ! 804: ORN_R	orn 	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20104, %g1, %o0
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
	setx	data_start_3, %g1, %r17
	.word 0xb9504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb1e420e9  ! 813: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e46021  ! 814: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0xb1e4e089  ! 824: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0ac  ! 832: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4209e  ! 836: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4a181  ! 837: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e421e2  ! 838: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4a03f  ! 839: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe421f6  ! 841: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4e0b9  ! 842: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb2048000  ! 843: ADD_R	add 	%r18, %r0, %r25
	.word 0xb7e52119  ! 848: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5605f  ! 850: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bc8000  ! 856: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xbf51c000  ! 862: RDPR_TL	<illegal instruction>
	.word 0xb7e5a00f  ! 863: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4e120  ! 864: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e56006  ! 865: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983cc9  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc9, %hpstate
	.word 0xb61c6005  ! 873: XOR_I	xor 	%r17, 0x0005, %r27
	.word 0xb9e4609d  ! 874: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe4615c  ! 875: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd540000  ! 878: RDPR_GL	<illegal instruction>
	.word 0x8d95e0c0  ! 879: WRPR_PSTATE_I	wrpr	%r23, 0x00c0, %pstate
	.word 0x899460ab  ! 880: WRPR_TICK_I	wrpr	%r17, 0x00ab, %tick
	.word 0xb751c000  ! 881: RDPR_TL	<illegal instruction>
	.word 0xb5e56043  ! 883: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x87942013  ! 887: WRPR_TT_I	wrpr	%r16, 0x0013, %tt
	mov	1, %r12
	.word 0x8f932000  ! 888: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5611b  ! 889: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe461d3  ! 893: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbe8ce0f9  ! 894: ANDcc_I	andcc 	%r19, 0x00f9, %r31
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0a3  ! 897: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4a1c5  ! 900: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbc9d0000  ! 901: XORcc_R	xorcc 	%r20, %r0, %r30
	mov	2, %r14
	.word 0xa193a000  ! 902: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe5a1db  ! 905: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd2c8000  ! 908: SLL_R	sll 	%r18, %r0, %r30
	.word 0xbc0d8000  ! 909: AND_R	and 	%r22, %r0, %r30
	.word 0xb3e4a1dd  ! 910: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e42155  ! 912: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d49  ! 914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d49, %hpstate
	.word 0xb1e4e127  ! 917: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8395604e  ! 918: WRPR_TNPC_I	wrpr	%r21, 0x004e, %tnpc
	.word 0xbd50c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xb82c61bd  ! 930: ANDN_I	andn 	%r17, 0x01bd, %r28
	.word 0xb1504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4a091  ! 933: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e520ea  ! 934: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe561f8  ! 935: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe42131  ! 936: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4e19c  ! 941: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5605c  ! 946: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_6, %g1, %r23
	.word 0x8994a098  ! 948: WRPR_TICK_I	wrpr	%r18, 0x0098, %tick
	.word 0xb9e4a17f  ! 949: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x1011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1b7  ! 955: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5a177  ! 956: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5614c  ! 959: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb518000  ! 960: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5e034  ! 961: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xbf520000  ! 967: RDPR_PIL	<illegal instruction>
	.word 0x8994e056  ! 968: WRPR_TICK_I	wrpr	%r19, 0x0056, %tick
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e46108  ! 984: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8795e0c8  ! 987: WRPR_TT_I	wrpr	%r23, 0x00c8, %tt
	.word 0xb7e4e1f8  ! 988: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x91946104  ! 991: WRPR_PIL_I	wrpr	%r17, 0x0104, %pil
	.word 0xb5e5a1d6  ! 992: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e5a17d  ! 993: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb53c6001  ! 994: SRA_I	sra 	%r17, 0x0001, %r26
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e521e5  ! 1001: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xbde4e1d5  ! 1004: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5540000  ! 1007: RDPR_GL	<illegal instruction>
	.word 0xb7e4a003  ! 1008: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb33d2001  ! 1009: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb41421da  ! 1011: OR_I	or 	%r16, 0x01da, %r26
	.word 0x8d9560dc  ! 1014: WRPR_PSTATE_I	wrpr	%r21, 0x00dc, %pstate
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1a8  ! 1021: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e521fa  ! 1027: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 1030: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e172  ! 1031: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e521a9  ! 1032: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe461dd  ! 1036: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd520000  ! 1037: RDPR_PIL	<illegal instruction>
	.word 0x8d95a1c4  ! 1038: WRPR_PSTATE_I	wrpr	%r22, 0x01c4, %pstate
	.word 0xbfe521c0  ! 1041: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0f7  ! 1051: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 1052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xb7e4a11d  ! 1053: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e91  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e91, %hpstate
	.word 0xb9e5a172  ! 1059: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbc344000  ! 1063: ORN_R	orn 	%r17, %r0, %r30
	.word 0xb9e46079  ! 1066: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5604a  ! 1068: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5480000  ! 1070: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb0c4c000  ! 1074: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0x8194a164  ! 1076: WRPR_TPC_I	wrpr	%r18, 0x0164, %tpc
	.word 0xb7e460b5  ! 1077: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_4, %g1, %r22
	.word 0xb9510000  ! 1080: RDPR_TICK	<illegal instruction>
	.word 0x9195619a  ! 1083: WRPR_PIL_I	wrpr	%r21, 0x019a, %pil
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1094: RDPR_PSTATE	<illegal instruction>
	.word 0xbde521e4  ! 1096: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983849  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1849, %hpstate
	.word 0xb3e4a05d  ! 1103: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e01c  ! 1111: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982ac9  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0xb1e4e1e8  ! 1117: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e42117  ! 1120: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e5a095  ! 1124: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5607d  ! 1125: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5e0be  ! 1129: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982edb  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	.word 0xb1e4e0e0  ! 1132: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb2448000  ! 1133: ADDC_R	addc 	%r18, %r0, %r25
	.word 0x8394e0f5  ! 1134: WRPR_TNPC_I	wrpr	%r19, 0x00f5, %tnpc
	.word 0xb3518000  ! 1140: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e0d0  ! 1144: SAVE_I	save	%r19, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 1149: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7508000  ! 1150: RDPR_TSTATE	<illegal instruction>
	.word 0xbde46137  ! 1159: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e46130  ! 1161: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5211b  ! 1162: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5613c  ! 1166: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb551c000  ! 1167: RDPR_TL	<illegal instruction>
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 1178: RDPR_TT	<illegal instruction>
	.word 0xbfe5e192  ! 1179: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56187  ! 1181: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5e160  ! 1183: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb72cd000  ! 1186: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xb950c000  ! 1188: RDPR_TT	<illegal instruction>
	.word 0xb5e4e1ee  ! 1189: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x85946110  ! 1190: WRPR_TSTATE_I	wrpr	%r17, 0x0110, %tstate
	.word 0xb5e521b7  ! 1192: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e561de  ! 1194: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9518000  ! 1197: RDPR_PSTATE	<illegal instruction>
	.word 0x8d952047  ! 1198: WRPR_PSTATE_I	wrpr	%r20, 0x0047, %pstate
	.word 0xbde421dc  ! 1199: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe150000  ! 1205: OR_R	or 	%r20, %r0, %r31
	.word 0xbfe5a009  ! 1207: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b59  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b59, %hpstate
	.word 0xbfe4a0c5  ! 1211: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e561cd  ! 1214: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5213e  ! 1215: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e56038  ! 1217: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb28de07d  ! 1219: ANDcc_I	andcc 	%r23, 0x007d, %r25
	.word 0xb1e56165  ! 1222: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9510000  ! 1224: RDPR_TICK	<illegal instruction>
	.word 0xb3e52010  ! 1227: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_3, %g1, %r17
	.word 0xb1e4a145  ! 1232: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e5e039  ! 1237: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e1f8  ! 1244: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7508000  ! 1246: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4e095  ! 1247: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7510000  ! 1249: RDPR_TICK	<illegal instruction>
	.word 0xbaa4c000  ! 1252: SUBcc_R	subcc 	%r19, %r0, %r29
	.word 0xbb540000  ! 1254: RDPR_GL	<illegal instruction>
	.word 0x85946076  ! 1255: WRPR_TSTATE_I	wrpr	%r17, 0x0076, %tstate
	.word 0xbde5e1d1  ! 1257: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x819461d8  ! 1259: WRPR_TPC_I	wrpr	%r17, 0x01d8, %tpc
	mov	1, %r14
	.word 0xa193a000  ! 1260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xba8ca1ed  ! 1261: ANDcc_I	andcc 	%r18, 0x01ed, %r29
	.word 0xb9510000  ! 1267: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e0da  ! 1268: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5a066  ! 1269: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5213d  ! 1270: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbc14c000  ! 1273: OR_R	or 	%r19, %r0, %r30
	.word 0x81942121  ! 1279: WRPR_TPC_I	wrpr	%r16, 0x0121, %tpc
	.word 0xb3e420ad  ! 1281: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e42196  ! 1288: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb244e09b  ! 1289: ADDC_I	addc 	%r19, 0x009b, %r25
	.word 0xbfe5a190  ! 1291: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe520c4  ! 1292: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb215a195  ! 1293: OR_I	or 	%r22, 0x0195, %r25
	.word 0xb1e42152  ! 1294: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 1296: RDPR_TPC	<illegal instruction>
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46163  ! 1305: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4e1a2  ! 1310: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e5606f  ! 1312: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9504000  ! 1313: RDPR_TNPC	<illegal instruction>
	.word 0xb9e46002  ! 1314: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8d94a0c6  ! 1316: WRPR_PSTATE_I	wrpr	%r18, 0x00c6, %pstate
	.word 0xb5e5a1a3  ! 1319: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 1325: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e42060  ! 1326: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb4044000  ! 1328: ADD_R	add 	%r17, %r0, %r26
	.word 0xb7e5a01c  ! 1331: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4608c  ! 1339: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e521bb  ! 1343: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4e020  ! 1344: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5615c  ! 1345: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5e01d  ! 1353: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd3d4000  ! 1358: SRA_R	sra 	%r21, %r0, %r30
	.word 0xbb540000  ! 1368: RDPR_GL	<illegal instruction>
	.word 0xbfe5608c  ! 1371: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 1372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	setx	0x20210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92de001  ! 1376: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0xb12ce001  ! 1377: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xbfe5a06c  ! 1379: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb72c1000  ! 1381: SLLX_R	sllx	%r16, %r0, %r27
	.word 0xbbe520f8  ! 1382: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4a19f  ! 1385: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb41d8000  ! 1386: XOR_R	xor 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5211d  ! 1398: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4e1d9  ! 1402: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1480000  ! 1404: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0, %r14
	.word 0xa193a000  ! 1405: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e560e9  ! 1408: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe4a14d  ! 1409: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe4e1ff  ! 1412: SAVE_I	save	%r19, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 1414: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf3df001  ! 1426: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xbde4a066  ! 1428: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1434: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e114  ! 1438: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5e0e7  ! 1440: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5e1e2  ! 1441: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbea5e1f5  ! 1442: SUBcc_I	subcc 	%r23, 0x01f5, %r31
	.word 0xb02c61cb  ! 1445: ANDN_I	andn 	%r17, 0x01cb, %r24
	.word 0xb5e420ac  ! 1446: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd50c000  ! 1447: RDPR_TT	<illegal instruction>
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e022  ! 1450: WRPR_TPC_I	wrpr	%r23, 0x0022, %tpc
	.word 0xb7345000  ! 1451: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xb3480000  ! 1452: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde4610b  ! 1454: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd518000  ! 1458: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe520d8  ! 1459: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe56132  ! 1460: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e461b4  ! 1461: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e4e0b5  ! 1467: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9480000  ! 1469: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbde521af  ! 1470: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe420f3  ! 1471: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5a0f7  ! 1472: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1a1  ! 1478: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e5e12d  ! 1480: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe42005  ! 1483: SAVE_I	save	%r16, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 1486: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8195e085  ! 1488: WRPR_TPC_I	wrpr	%r23, 0x0085, %tpc
	.word 0x89956070  ! 1490: WRPR_TICK_I	wrpr	%r21, 0x0070, %tick
	.word 0xbfe4a093  ! 1492: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe420ec  ! 1500: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe5a159  ! 1501: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e08a  ! 1502: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e0eb  ! 1505: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_0, %g1, %r22
	.word 0xbfe42038  ! 1507: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42080  ! 1509: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5a092  ! 1510: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8d946075  ! 1515: WRPR_PSTATE_I	wrpr	%r17, 0x0075, %pstate
	mov	1, %r12
	.word 0x8f932000  ! 1519: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb535c000  ! 1532: SRL_R	srl 	%r23, %r0, %r26
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983893  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1893, %hpstate
	.word 0xbde5e1ca  ! 1540: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4607b  ! 1541: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe520a4  ! 1544: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbeadc000  ! 1547: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xbb2d8000  ! 1549: SLL_R	sll 	%r22, %r0, %r29
	.word 0xb7e52105  ! 1550: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4a1be  ! 1551: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8594e115  ! 1553: WRPR_TSTATE_I	wrpr	%r19, 0x0115, %tstate
	.word 0xb9e521cb  ! 1555: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e421c0  ! 1556: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe461df  ! 1557: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbc2d4000  ! 1558: ANDN_R	andn 	%r21, %r0, %r30
	.word 0xb9e560bc  ! 1562: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e461ea  ! 1564: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb134a001  ! 1566: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xb3e5e147  ! 1568: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x819829db  ! 1569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09db, %hpstate
	.word 0xbcbde167  ! 1570: XNORcc_I	xnorcc 	%r23, 0x0167, %r30
	.word 0xbca5e024  ! 1571: SUBcc_I	subcc 	%r23, 0x0024, %r30
	setx	0x10119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899461b6  ! 1581: WRPR_TICK_I	wrpr	%r17, 0x01b6, %tick
	.word 0xbbe46115  ! 1582: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e0a9  ! 1592: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e560f6  ! 1593: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbd500000  ! 1596: RDPR_TPC	<illegal instruction>
	.word 0xb5e561bf  ! 1601: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe52108  ! 1603: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e42087  ! 1604: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1612: RDPR_PSTATE	<illegal instruction>
	.word 0xbd51c000  ! 1615: RDPR_TL	<illegal instruction>
	.word 0xbf500000  ! 1621: RDPR_TPC	<illegal instruction>
	.word 0x85952149  ! 1622: WRPR_TSTATE_I	wrpr	%r20, 0x0149, %tstate
	.word 0xb9e4a104  ! 1624: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1630: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbe8d4000  ! 1634: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xb5e46151  ! 1639: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x89956060  ! 1642: WRPR_TICK_I	wrpr	%r21, 0x0060, %tick
	.word 0xb3e5a13b  ! 1657: SAVE_I	save	%r22, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 1659: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5540000  ! 1660: RDPR_GL	<illegal instruction>
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1666: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 1670: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x859521c4  ! 1675: WRPR_TSTATE_I	wrpr	%r20, 0x01c4, %tstate
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4605f  ! 1678: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb61d0000  ! 1681: XOR_R	xor 	%r20, %r0, %r27
	.word 0xb7e46178  ! 1682: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde52024  ! 1684: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4a1a5  ! 1686: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd2d0000  ! 1688: SLL_R	sll 	%r20, %r0, %r30
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xb7e561cf  ! 1692: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb225c000  ! 1693: SUB_R	sub 	%r23, %r0, %r25
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1696: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e4a020  ! 1697: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb52c5000  ! 1699: SLLX_R	sllx	%r17, %r0, %r26
	.word 0x8d95a18c  ! 1701: WRPR_PSTATE_I	wrpr	%r22, 0x018c, %pstate
	.word 0xb1480000  ! 1704: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8d9460fe  ! 1708: WRPR_PSTATE_I	wrpr	%r17, 0x00fe, %pstate
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e031  ! 1714: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4e1ff  ! 1716: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb8b5e087  ! 1721: SUBCcc_I	orncc 	%r23, 0x0087, %r28
	.word 0xbde5e058  ! 1724: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde56011  ! 1728: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde4212e  ! 1730: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5e06e  ! 1735: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb4044000  ! 1737: ADD_R	add 	%r17, %r0, %r26
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 1748: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbe5a1ed  ! 1750: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e5a093  ! 1753: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb52d4000  ! 1754: SLL_R	sll 	%r21, %r0, %r26
	.word 0xbfe461ae  ! 1755: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb500000  ! 1756: RDPR_TPC	<illegal instruction>
	.word 0xbde5e10b  ! 1757: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd349000  ! 1759: SRLX_R	srlx	%r18, %r0, %r30
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e1b6  ! 1761: WRPR_TICK_I	wrpr	%r19, 0x01b6, %tick
	.word 0xb7e4202c  ! 1762: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5e1cb  ! 1766: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e420a2  ! 1770: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xb5e5e093  ! 1776: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2d8000  ! 1783: SLL_R	sll 	%r22, %r0, %r30
	.word 0x81946028  ! 1784: WRPR_TPC_I	wrpr	%r17, 0x0028, %tpc
	.word 0xb1e4a110  ! 1785: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5e128  ! 1787: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e420f8  ! 1788: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a189  ! 1789: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbf3d6001  ! 1790: SRA_I	sra 	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 1791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0xbde56140  ! 1794: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x83956044  ! 1795: WRPR_TNPC_I	wrpr	%r21, 0x0044, %tnpc
	.word 0xbfe4e050  ! 1798: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a112  ! 1799: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e56002  ! 1802: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x899461b1  ! 1803: WRPR_TICK_I	wrpr	%r17, 0x01b1, %tick
	.word 0xb7e5a16a  ! 1804: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5e12f  ! 1805: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9500000  ! 1806: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b43  ! 1808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	.word 0xbde5a103  ! 1810: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x81956160  ! 1812: WRPR_TPC_I	wrpr	%r21, 0x0160, %tpc
	.word 0xbde5a09f  ! 1814: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbca4e150  ! 1817: SUBcc_I	subcc 	%r19, 0x0150, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	setx	data_start_2, %g1, %r22
	.word 0x899460c9  ! 1826: WRPR_TICK_I	wrpr	%r17, 0x00c9, %tick
	.word 0xb415c000  ! 1828: OR_R	or 	%r23, %r0, %r26
	.word 0x89946063  ! 1829: WRPR_TICK_I	wrpr	%r17, 0x0063, %tick
	.word 0xbf504000  ! 1836: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e023  ! 1840: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e080  ! 1841: SAVE_I	save	%r19, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb51c000  ! 1846: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4e0f8  ! 1849: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4a014  ! 1852: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb6adc000  ! 1853: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xb7e5a031  ! 1854: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e5a18c  ! 1856: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe56149  ! 1858: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb351c000  ! 1860: RDPR_TL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1869: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4e086  ! 1871: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a0ae  ! 1874: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e56100  ! 1878: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc3d6180  ! 1880: XNOR_I	xnor 	%r21, 0x0180, %r30
	.word 0xb1e4e190  ! 1882: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe5e070  ! 1888: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e56107  ! 1890: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5e1b1  ! 1891: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9520000  ! 1893: RDPR_PIL	<illegal instruction>
	.word 0xb750c000  ! 1895: RDPR_TT	<illegal instruction>
	.word 0xb3e521c6  ! 1898: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5a1c1  ! 1899: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5e0d1  ! 1901: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5209b  ! 1902: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4a11d  ! 1903: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4a1f4  ! 1904: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe5e03d  ! 1908: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb540000  ! 1911: RDPR_GL	<illegal instruction>
	.word 0xbbe5619c  ! 1912: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb53c4000  ! 1913: SRA_R	sra 	%r17, %r0, %r26
	.word 0xb1e560f9  ! 1918: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 1920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xb5508000  ! 1921: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e56048  ! 1922: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7480000  ! 1925: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3e5a10a  ! 1926: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9480000  ! 1930: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbe4e0c4  ! 1931: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe4a07b  ! 1935: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5518000  ! 1939: RDPR_PSTATE	<illegal instruction>
	.word 0x879421f7  ! 1945: WRPR_TT_I	wrpr	%r16, 0x01f7, %tt
	.word 0xbbe461ac  ! 1946: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe4e1f0  ! 1947: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe4a0fb  ! 1948: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb6c40000  ! 1949: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xb5e46139  ! 1951: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e46119  ! 1957: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5a04a  ! 1961: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3508000  ! 1963: RDPR_TSTATE	<illegal instruction>
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba34a1e7  ! 1965: ORN_I	orn 	%r18, 0x01e7, %r29
	.word 0xbfe4a076  ! 1968: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x899561ba  ! 1984: WRPR_TICK_I	wrpr	%r21, 0x01ba, %tick
	.word 0xb5641800  ! 1987: MOVcc_R	<illegal instruction>
	.word 0xbec58000  ! 1988: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0xbbe52031  ! 1989: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x87946001  ! 1991: WRPR_TT_I	wrpr	%r17, 0x0001, %tt
	mov	2, %r14
	.word 0xa193a000  ! 1993: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe46039  ! 1996: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e461ef  ! 1997: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e5a1a5  ! 1999: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e42015  ! 2000: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb0ad60c0  ! 2002: ANDNcc_I	andncc 	%r21, 0x00c0, %r24
	.word 0x8d9520df  ! 2003: WRPR_PSTATE_I	wrpr	%r20, 0x00df, %pstate
	.word 0xbf3d8000  ! 2008: SRA_R	sra 	%r22, %r0, %r31
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe254000  ! 2012: SUB_R	sub 	%r21, %r0, %r31
	.word 0x87946194  ! 2013: WRPR_TT_I	wrpr	%r17, 0x0194, %tt
	.word 0xbde5e1cc  ! 2014: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde521a5  ! 2015: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe4e0a2  ! 2016: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e56128  ! 2020: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x87946138  ! 2021: WRPR_TT_I	wrpr	%r17, 0x0138, %tt
	.word 0x9195a08f  ! 2023: WRPR_PIL_I	wrpr	%r22, 0x008f, %pil
	.word 0xb5e5e14e  ! 2025: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe52068  ! 2027: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf50c000  ! 2031: RDPR_TT	<illegal instruction>
	.word 0xb5e4e01b  ! 2032: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xba458000  ! 2035: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xbbe5a13a  ! 2037: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb480000  ! 2040: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbbe46161  ! 2042: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e11f  ! 2051: WRPR_TPC_I	wrpr	%r19, 0x011f, %tpc
	.word 0xb5e420da  ! 2052: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe5603a  ! 2054: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde4e01c  ! 2061: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5e0a2  ! 2062: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e4e16a  ! 2064: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8395212b  ! 2065: WRPR_TNPC_I	wrpr	%r20, 0x012b, %tnpc
	.word 0xb20da101  ! 2066: AND_I	and 	%r22, 0x0101, %r25
	.word 0xbcc5c000  ! 2068: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0x859421d7  ! 2070: WRPR_TSTATE_I	wrpr	%r16, 0x01d7, %tstate
	.word 0x8595a02b  ! 2071: WRPR_TSTATE_I	wrpr	%r22, 0x002b, %tstate
	setx	data_start_2, %g1, %r17
	.word 0xbbe5a087  ! 2082: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e56115  ! 2088: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe4a151  ! 2090: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xbc2c4000  ! 2095: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xb950c000  ! 2098: RDPR_TT	<illegal instruction>
	.word 0xb7e5a0a1  ! 2101: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb17d4400  ! 2105: MOVR_R	movre	%r21, %r0, %r24
	.word 0xb5520000  ! 2106: RDPR_PIL	<illegal instruction>
	.word 0xb5e4e1ee  ! 2107: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe56149  ! 2110: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4e1a7  ! 2112: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbc94200c  ! 2113: ORcc_I	orcc 	%r16, 0x000c, %r30
	setx	0x121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0342107  ! 2116: SUBC_I	orn 	%r16, 0x0107, %r24
	.word 0xb3e42022  ! 2117: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e5a069  ! 2118: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x879520a9  ! 2123: WRPR_TT_I	wrpr	%r20, 0x00a9, %tt
	.word 0xb3e5e054  ! 2125: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb53c9000  ! 2131: SRAX_R	srax	%r18, %r0, %r26
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a178  ! 2137: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e520f3  ! 2141: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5a0c5  ! 2142: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e52003  ! 2144: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899560bc  ! 2152: WRPR_TICK_I	wrpr	%r21, 0x00bc, %tick
	.word 0xb73c7001  ! 2153: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0xb7e5e082  ! 2157: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe420be  ! 2159: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8995e176  ! 2160: WRPR_TICK_I	wrpr	%r23, 0x0176, %tick
	.word 0xb5540000  ! 2164: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe4a1c3  ! 2171: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e5a039  ! 2174: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e4e0fb  ! 2175: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe42186  ! 2176: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5510000  ! 2178: RDPR_TICK	<illegal instruction>
	.word 0xbfe4212d  ! 2179: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf500000  ! 2180: RDPR_TPC	<illegal instruction>
	.word 0x859461b9  ! 2185: WRPR_TSTATE_I	wrpr	%r17, 0x01b9, %tstate
	.word 0x8595a1ea  ! 2186: WRPR_TSTATE_I	wrpr	%r22, 0x01ea, %tstate
	.word 0xb3e4e039  ! 2189: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8d95e03a  ! 2192: WRPR_PSTATE_I	wrpr	%r23, 0x003a, %pstate
	.word 0xb52ce001  ! 2194: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0x8595a19a  ! 2195: WRPR_TSTATE_I	wrpr	%r22, 0x019a, %tstate
	.word 0xbfe52117  ! 2196: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4e0a7  ! 2197: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e460c3  ! 2199: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbc0d2192  ! 2203: AND_I	and 	%r20, 0x0192, %r30
	.word 0xbfe56047  ! 2204: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde561d5  ! 2205: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5614c  ! 2207: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0b0  ! 2210: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e56035  ! 2212: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5a0ee  ! 2213: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0a50000  ! 2215: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0xbb641800  ! 2221: MOVcc_R	<illegal instruction>
	.word 0xb551c000  ! 2223: RDPR_TL	<illegal instruction>
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaad8000  ! 2226: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0xb7355000  ! 2227: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xbde56180  ! 2230: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e52076  ! 2231: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e46141  ! 2237: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9504000  ! 2238: RDPR_TNPC	<illegal instruction>
	.word 0x89946172  ! 2241: WRPR_TICK_I	wrpr	%r17, 0x0172, %tick
	.word 0xbbe42114  ! 2244: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3508000  ! 2245: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe561af  ! 2248: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	.word 0x8994e1bb  ! 2254: WRPR_TICK_I	wrpr	%r19, 0x01bb, %tick
	.word 0xb1518000  ! 2257: RDPR_PSTATE	<illegal instruction>
	.word 0x8794a17c  ! 2259: WRPR_TT_I	wrpr	%r18, 0x017c, %tt
	mov	0, %r14
	.word 0xa193a000  ! 2260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5a054  ! 2261: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4e0ff  ! 2263: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb8440000  ! 2264: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xb1e52176  ! 2269: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 2275: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 2277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	.word 0xb4146050  ! 2282: OR_I	or 	%r17, 0x0050, %r26
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ad3  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad3, %hpstate
	.word 0xba44a017  ! 2292: ADDC_I	addc 	%r18, 0x0017, %r29
	setx	data_start_7, %g1, %r23
	.word 0xbde52119  ! 2294: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8794a1d3  ! 2299: WRPR_TT_I	wrpr	%r18, 0x01d3, %tt
	.word 0xbf355000  ! 2300: SRLX_R	srlx	%r21, %r0, %r31
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe560ad  ! 2304: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0xb3e5a030  ! 2307: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x899460d5  ! 2310: WRPR_TICK_I	wrpr	%r17, 0x00d5, %tick
	.word 0xbfe42126  ! 2312: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a087  ! 2317: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5a07c  ! 2324: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbd510000  ! 2332: RDPR_TICK	<illegal instruction>
	.word 0xb7e521bf  ! 2333: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x30001, %g1, %o0
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
	.word 0xb1520000  ! 2341: RDPR_PIL	<illegal instruction>
	.word 0xb7e42021  ! 2343: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb2050000  ! 2345: ADD_R	add 	%r20, %r0, %r25
	.word 0xb1e421f0  ! 2347: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e420c3  ! 2351: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe4e09e  ! 2354: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e52077  ! 2356: SAVE_I	save	%r20, 0x0001, %r24
	mov	0, %r12
	.word 0x8f932000  ! 2357: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e4a0a4  ! 2365: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	.word 0xb1e460dd  ! 2368: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5508000  ! 2369: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4a08d  ! 2370: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e4e1f9  ! 2371: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x89956106  ! 2373: WRPR_TICK_I	wrpr	%r21, 0x0106, %tick
	.word 0xb1e560c8  ! 2375: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb550c000  ! 2376: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f89  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f89, %hpstate
	.word 0xb3e5e12b  ! 2380: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983edb  ! 2381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edb, %hpstate
	.word 0xb9e5a1f0  ! 2384: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5a0e2  ! 2389: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb894c000  ! 2391: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0xb3e4e15c  ! 2392: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4a067  ! 2393: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5a1b0  ! 2395: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bda0fc  ! 2400: XNORcc_I	xnorcc 	%r22, 0x00fc, %r28
	.word 0x899561fb  ! 2404: WRPR_TICK_I	wrpr	%r21, 0x01fb, %tick
	.word 0xbd518000  ! 2407: RDPR_PSTATE	<illegal instruction>
	.word 0xb2b48000  ! 2409: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xb7e56127  ! 2410: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe4a1e4  ! 2412: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb805c000  ! 2413: ADD_R	add 	%r23, %r0, %r28
	.word 0xb4b50000  ! 2415: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xb350c000  ! 2420: RDPR_TT	<illegal instruction>
	.word 0xb3e5201f  ! 2421: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8194a1d4  ! 2422: WRPR_TPC_I	wrpr	%r18, 0x01d4, %tpc
	.word 0xb6bc8000  ! 2424: XNORcc_R	xnorcc 	%r18, %r0, %r27
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a0e3  ! 2428: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_2, %g1, %r20
	.word 0xbfe4e0cf  ! 2431: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb81dc000  ! 2435: XOR_R	xor 	%r23, %r0, %r28
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5608e  ! 2437: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 2441: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1520000  ! 2445: RDPR_PIL	<illegal instruction>
	.word 0x8d95e1f6  ! 2447: WRPR_PSTATE_I	wrpr	%r23, 0x01f6, %pstate
	.word 0xbbe5a1f0  ! 2453: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	.word 0xb9e46095  ! 2464: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd51c000  ! 2467: RDPR_TL	<illegal instruction>
	.word 0xbde5606f  ! 2468: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde421fd  ! 2473: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5a148  ! 2475: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0ee  ! 2482: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e561d5  ! 2485: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_4, %g1, %r19
	.word 0xb5e5a0fa  ! 2490: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb095213a  ! 2494: ORcc_I	orcc 	%r20, 0x013a, %r24
	.word 0xb7e5e102  ! 2499: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4606b  ! 2500: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4e1e1  ! 2501: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1540000  ! 2502: RDPR_GL	<illegal instruction>
	.word 0xb3e521e4  ! 2504: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe520e1  ! 2505: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe56106  ! 2506: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1508000  ! 2507: RDPR_TSTATE	<illegal instruction>
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e03b  ! 2510: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e56137  ! 2511: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb151c000  ! 2512: RDPR_TL	<illegal instruction>
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe52061  ! 2515: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf50c000  ! 2516: RDPR_TT	<illegal instruction>
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a10e  ! 2520: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9518000  ! 2523: RDPR_PSTATE	<illegal instruction>
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46096  ! 2531: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5e116  ! 2532: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_7, %g1, %r21
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 2539: RDPR_GL	<illegal instruction>
	.word 0xba34a067  ! 2546: SUBC_I	orn 	%r18, 0x0067, %r29
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5212e  ! 2552: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1540000  ! 2554: RDPR_GL	<illegal instruction>
	.word 0x8994e1b4  ! 2556: WRPR_TICK_I	wrpr	%r19, 0x01b4, %tick
	.word 0x919520b2  ! 2557: WRPR_PIL_I	wrpr	%r20, 0x00b2, %pil
	.word 0xbbe52007  ! 2559: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8794614b  ! 2560: WRPR_TT_I	wrpr	%r17, 0x014b, %tt
	setx	data_start_6, %g1, %r19
	setx	data_start_0, %g1, %r19
	.word 0xbde4a00e  ! 2570: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_6, %g1, %r21
	.word 0xbbe42031  ! 2577: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e461e8  ! 2584: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe521d3  ! 2586: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e104  ! 2587: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4a0a4  ! 2593: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e5e0ec  ! 2594: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e42181  ! 2598: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x85952087  ! 2599: WRPR_TSTATE_I	wrpr	%r20, 0x0087, %tstate
	.word 0xbbe5a003  ! 2601: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x9195a01b  ! 2602: WRPR_PIL_I	wrpr	%r22, 0x001b, %pil
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e560d3  ! 2611: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9480000  ! 2612: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e5e0cc  ! 2613: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0ff  ! 2615: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e42046  ! 2616: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e135  ! 2620: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a09c  ! 2626: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5e00e  ! 2627: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5606e  ! 2628: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5e122  ! 2629: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e5a098  ! 2630: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4a111  ! 2631: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e4e06d  ! 2633: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x859560f6  ! 2634: WRPR_TSTATE_I	wrpr	%r21, 0x00f6, %tstate
	.word 0xb1e4a16f  ! 2636: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe5a160  ! 2637: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x9195e17c  ! 2642: WRPR_PIL_I	wrpr	%r23, 0x017c, %pil
	.word 0xb7e4a1d0  ! 2643: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4a1c1  ! 2644: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe520f9  ! 2646: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbd508000  ! 2647: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 2651: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a0d9  ! 2655: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e4e17b  ! 2656: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5520000  ! 2657: RDPR_PIL	<illegal instruction>
	.word 0xbab5a0aa  ! 2659: SUBCcc_I	orncc 	%r22, 0x00aa, %r29
	.word 0x8595e012  ! 2660: WRPR_TSTATE_I	wrpr	%r23, 0x0012, %tstate
	.word 0xb5e42164  ! 2662: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde520d1  ! 2667: SAVE_I	save	%r20, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2668: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 2670: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde46096  ! 2671: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5a1fa  ! 2673: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb750c000  ! 2678: RDPR_TT	<illegal instruction>
	.word 0xb7e46111  ! 2682: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e461dd  ! 2684: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e198  ! 2689: WRPR_TT_I	wrpr	%r23, 0x0198, %tt
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 2697: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9e5a1e5  ! 2698: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb2358000  ! 2701: ORN_R	orn 	%r22, %r0, %r25
	.word 0xb5508000  ! 2703: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe42141  ! 2704: SAVE_I	save	%r16, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 2705: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1aa  ! 2708: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 2712: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x899420f2  ! 2713: WRPR_TICK_I	wrpr	%r16, 0x00f2, %tick
	.word 0xbf2c7001  ! 2716: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb7e42023  ! 2717: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e56040  ! 2718: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e56064  ! 2719: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859421c8  ! 2726: WRPR_TSTATE_I	wrpr	%r16, 0x01c8, %tstate
	.word 0xb7504000  ! 2728: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5a138  ! 2730: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb8a4c000  ! 2733: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xb3e560df  ! 2736: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde56058  ! 2737: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5e109  ! 2738: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe46094  ! 2739: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1504000  ! 2744: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5606a  ! 2745: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe561ea  ! 2751: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5a148  ! 2752: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7520000  ! 2754: RDPR_PIL	<illegal instruction>
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e10c  ! 2760: WRPR_PIL_I	wrpr	%r23, 0x010c, %pil
	.word 0xb5e56012  ! 2761: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf508000  ! 2763: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e420f3  ! 2764: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5e004  ! 2766: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e56147  ! 2767: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4e1df  ! 2769: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb4ac4000  ! 2771: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xbb480000  ! 2772: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7e420b3  ! 2773: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4a0b5  ! 2774: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_3, %g1, %r19
	.word 0xb1e5206d  ! 2781: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d9420e7  ! 2783: WRPR_PSTATE_I	wrpr	%r16, 0x00e7, %pstate
	.word 0xbbe4a1cf  ! 2792: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde42058  ! 2794: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e4e0e3  ! 2797: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe521f0  ! 2802: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_4, %g1, %r20
	.word 0xbbe561fb  ! 2808: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1508000  ! 2809: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e42011  ! 2813: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4e000  ! 2814: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e029  ! 2818: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5214d  ! 2821: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	.word 0xb1e56121  ! 2830: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3510000  ! 2831: RDPR_TICK	<illegal instruction>
	.word 0xb9e4e112  ! 2833: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e5e1b2  ! 2834: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8395609a  ! 2835: WRPR_TNPC_I	wrpr	%r21, 0x009a, %tnpc
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5218d  ! 2839: SAVE_I	save	%r20, 0x0001, %r26
	mov	0, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8195a020  ! 2843: WRPR_TPC_I	wrpr	%r22, 0x0020, %tpc
	.word 0xbd51c000  ! 2844: RDPR_TL	<illegal instruction>
	.word 0xb7518000  ! 2848: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4a166  ! 2850: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb510000  ! 2851: RDPR_TICK	<illegal instruction>
	.word 0xbd3cd000  ! 2853: SRAX_R	srax	%r19, %r0, %r30
	.word 0xb1e5e08f  ! 2858: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e56051  ! 2861: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e52125  ! 2862: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e561a1  ! 2863: SAVE_I	save	%r21, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 2874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5e02f  ! 2875: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e521a7  ! 2876: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb2b4205c  ! 2877: SUBCcc_I	orncc 	%r16, 0x005c, %r25
	.word 0xb5e461b5  ! 2878: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4e189  ! 2881: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde520fb  ! 2884: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4201d  ! 2885: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e5a00f  ! 2887: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5619a  ! 2888: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5211c  ! 2889: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb8456090  ! 2891: ADDC_I	addc 	%r21, 0x0090, %r28
	.word 0x83952116  ! 2893: WRPR_TNPC_I	wrpr	%r20, 0x0116, %tnpc
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56041  ! 2904: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e46192  ! 2908: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd51c000  ! 2910: RDPR_TL	<illegal instruction>
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2915: RDPR_PSTATE	<illegal instruction>
	.word 0xbf51c000  ! 2916: RDPR_TL	<illegal instruction>
	.word 0xbfe5e16d  ! 2918: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5e178  ! 2919: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xbfe4a10f  ! 2931: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x8198295b  ! 2933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	.word 0xb7e5e0e4  ! 2935: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe461e4  ! 2939: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde4619e  ! 2943: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8995e14e  ! 2944: WRPR_TICK_I	wrpr	%r23, 0x014e, %tick
	.word 0xb9e4a14a  ! 2952: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8994a13c  ! 2954: WRPR_TICK_I	wrpr	%r18, 0x013c, %tick
	.word 0xbbe42105  ! 2959: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4a1b1  ! 2961: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8194e045  ! 2962: WRPR_TPC_I	wrpr	%r19, 0x0045, %tpc
	.word 0xbbe5e1e4  ! 2963: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf520000  ! 2964: RDPR_PIL	<illegal instruction>
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 2967: RDPR_PIL	<illegal instruction>
	.word 0xb9e5a0d9  ! 2969: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5213a  ! 2976: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e5a092  ! 2977: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e4e155  ! 2979: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbb480000  ! 2980: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbfe5a19b  ! 2981: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e062  ! 2982: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb8250000  ! 2985: SUB_R	sub 	%r20, %r0, %r28
	.word 0xbde4a033  ! 2988: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7500000  ! 2991: RDPR_TPC	<illegal instruction>
	.word 0xb1e46136  ! 2993: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5e007  ! 2995: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8d9460e4  ! 2999: WRPR_PSTATE_I	wrpr	%r17, 0x00e4, %pstate
	.word 0xb1508000  ! 3000: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 3002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xbcb44000  ! 3004: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0x8795a0c7  ! 3009: WRPR_TT_I	wrpr	%r22, 0x00c7, %tt
	.word 0x8594e143  ! 3015: WRPR_TSTATE_I	wrpr	%r19, 0x0143, %tstate
	.word 0x8994a1e8  ! 3016: WRPR_TICK_I	wrpr	%r18, 0x01e8, %tick
	.word 0xb7e5a0c7  ! 3027: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 3029: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 3030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xbbe4602d  ! 3032: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8595606d  ! 3034: WRPR_TSTATE_I	wrpr	%r21, 0x006d, %tstate
	.word 0xbde4a09f  ! 3036: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf540000  ! 3037: RDPR_GL	<illegal instruction>
	.word 0xb3e4e1bb  ! 3039: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5e045  ! 3040: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a1be  ! 3043: WRPR_TSTATE_I	wrpr	%r22, 0x01be, %tstate
	.word 0xb9508000  ! 3048: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4613f  ! 3049: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a145  ! 3059: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5a18b  ! 3066: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5a04e  ! 3069: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde5e013  ! 3070: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4e18c  ! 3073: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8195e084  ! 3074: WRPR_TPC_I	wrpr	%r23, 0x0084, %tpc
	.word 0xbf504000  ! 3079: RDPR_TNPC	<illegal instruction>
	.word 0x87942074  ! 3083: WRPR_TT_I	wrpr	%r16, 0x0074, %tt
	.word 0xb1e5a0ed  ! 3085: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e460b1  ! 3087: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf51c000  ! 3088: RDPR_TL	<illegal instruction>
	.word 0xb0b54000  ! 3089: SUBCcc_R	orncc 	%r21, %r0, %r24
	.word 0xb5e4a1b6  ! 3090: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe461ac  ! 3099: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e4e0bf  ! 3107: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5a1a1  ! 3108: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95219e  ! 3113: WRPR_PSTATE_I	wrpr	%r20, 0x019e, %pstate
	.word 0xb1e5e12d  ! 3114: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 3116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0xb04521e9  ! 3121: ADDC_I	addc 	%r20, 0x01e9, %r24
	.word 0xb9518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xb4b4c000  ! 3131: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb5e4a06e  ! 3134: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbc0c4000  ! 3137: AND_R	and 	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983cc9  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc9, %hpstate
	.word 0xb9e4e111  ! 3141: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf643801  ! 3143: MOVcc_I	<illegal instruction>
	.word 0xb3e4a014  ! 3144: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e5e18e  ! 3148: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4a03c  ! 3150: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4a0fc  ! 3151: SAVE_I	save	%r18, 0x0001, %r26
	mov	2, %r12
	.word 0x8f932000  ! 3155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1520000  ! 3157: RDPR_PIL	<illegal instruction>
	.word 0xbbe5613d  ! 3159: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb500000  ! 3160: RDPR_TPC	<illegal instruction>
	.word 0xb1e56053  ! 3163: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8794e1f1  ! 3165: WRPR_TT_I	wrpr	%r19, 0x01f1, %tt
	.word 0xb434a157  ! 3168: ORN_I	orn 	%r18, 0x0157, %r26
	mov	0, %r14
	.word 0xa193a000  ! 3169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e5e0f3  ! 3174: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4617b  ! 3176: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb550c000  ! 3177: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 3178: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a071  ! 3181: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e46082  ! 3184: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a08f  ! 3187: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb29d4000  ! 3188: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xb3518000  ! 3190: RDPR_PSTATE	<illegal instruction>
	.word 0xbde520b6  ! 3191: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r12
	.word 0x8f932000  ! 3194: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6a4217e  ! 3195: SUBcc_I	subcc 	%r16, 0x017e, %r27
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaac4000  ! 3199: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xb3e5a0ff  ! 3204: SAVE_I	save	%r22, 0x0001, %r25
	setx	data_start_6, %g1, %r18
	.word 0xb7e520fa  ! 3208: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5e098  ! 3211: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb6b5a1f6  ! 3213: ORNcc_I	orncc 	%r22, 0x01f6, %r27
	.word 0xb1508000  ! 3214: RDPR_TSTATE	<illegal instruction>
	.word 0xb4ade091  ! 3215: ANDNcc_I	andncc 	%r23, 0x0091, %r26
	.word 0xb1e5e1b2  ! 3224: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e460c5  ! 3231: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb21c21b5  ! 3233: XOR_I	xor 	%r16, 0x01b5, %r25
	.word 0xbb3c0000  ! 3236: SRA_R	sra 	%r16, %r0, %r29
	.word 0x8795a0b5  ! 3238: WRPR_TT_I	wrpr	%r22, 0x00b5, %tt
	.word 0xb77c4400  ! 3239: MOVR_R	movre	%r17, %r0, %r27
	setx	data_start_5, %g1, %r17
	.word 0xbde46041  ! 3243: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5e12e  ! 3244: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x819829cb  ! 3249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cb, %hpstate
	.word 0xbde5a182  ! 3250: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_4, %g1, %r16
	.word 0xb5e561d4  ! 3255: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8994e115  ! 3260: WRPR_TICK_I	wrpr	%r19, 0x0115, %tick
	.word 0xb1504000  ! 3262: RDPR_TNPC	<illegal instruction>
	.word 0xb3518000  ! 3265: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe46154  ! 3266: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5a129  ! 3268: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4a026  ! 3270: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5e1e3  ! 3274: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 3275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	.word 0xbf643801  ! 3276: MOVcc_I	<illegal instruction>
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0a3  ! 3280: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5a023  ! 3282: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe421e8  ! 3283: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8794a037  ! 3284: WRPR_TT_I	wrpr	%r18, 0x0037, %tt
	.word 0xbbe4a09c  ! 3285: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e52167  ! 3293: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb60d4000  ! 3295: AND_R	and 	%r21, %r0, %r27
	.word 0xb9e421f3  ! 3298: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a1a3  ! 3300: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf51c000  ! 3301: RDPR_TL	<illegal instruction>
	.word 0xbc2c2027  ! 3304: ANDN_I	andn 	%r16, 0x0027, %r30
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3309: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4a1b3  ! 3310: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5a0fa  ! 3315: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e52078  ! 3325: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb6940000  ! 3326: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb77cc400  ! 3327: MOVR_R	movre	%r19, %r0, %r27
	.word 0xb5510000  ! 3328: RDPR_TICK	<illegal instruction>
	.word 0xb9504000  ! 3331: RDPR_TNPC	<illegal instruction>
	.word 0xb8458000  ! 3340: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xbd50c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xbbe4e03a  ! 3348: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5e06f  ! 3351: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4e1d7  ! 3358: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e4a0c8  ! 3359: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde56084  ! 3365: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3367: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e420b5  ! 3368: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5213a  ! 3381: SAVE_I	save	%r20, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 3382: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6b44000  ! 3383: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xb83c0000  ! 3392: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xb1504000  ! 3393: RDPR_TNPC	<illegal instruction>
	setx	data_start_7, %g1, %r22
	.word 0xb351c000  ! 3401: RDPR_TL	<illegal instruction>
	.word 0x8195a1cd  ! 3405: WRPR_TPC_I	wrpr	%r22, 0x01cd, %tpc
	.word 0xb8b40000  ! 3406: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0x8d94a0c6  ! 3409: WRPR_PSTATE_I	wrpr	%r18, 0x00c6, %pstate
	.word 0x9195a126  ! 3412: WRPR_PIL_I	wrpr	%r22, 0x0126, %pil
	.word 0xb1e5212b  ! 3413: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e1aa  ! 3418: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf540000  ! 3419: RDPR_GL	<illegal instruction>
	.word 0xbd540000  ! 3420: RDPR_GL	<illegal instruction>
	.word 0xb3500000  ! 3422: RDPR_TPC	<illegal instruction>
	.word 0x8d956121  ! 3426: WRPR_PSTATE_I	wrpr	%r21, 0x0121, %pstate
	.word 0xbde5a1d3  ! 3430: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 3439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	.word 0xb5e4a05b  ! 3440: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4204e  ! 3441: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x879421aa  ! 3442: WRPR_TT_I	wrpr	%r16, 0x01aa, %tt
	.word 0xb7e5e006  ! 3443: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e420fb  ! 3446: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb294601f  ! 3448: ORcc_I	orcc 	%r17, 0x001f, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0x8995e19e  ! 3454: WRPR_TICK_I	wrpr	%r23, 0x019e, %tick
	setx	data_start_3, %g1, %r22
	.word 0xb89461eb  ! 3462: ORcc_I	orcc 	%r17, 0x01eb, %r28
	.word 0xb1e560b7  ! 3463: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5a09e  ! 3464: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e006  ! 3468: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde46061  ! 3469: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e460f0  ! 3470: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_6, %g1, %r17
	.word 0xb5e46104  ! 3475: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d9560f3  ! 3476: WRPR_PSTATE_I	wrpr	%r21, 0x00f3, %pstate
	.word 0xb4350000  ! 3478: ORN_R	orn 	%r20, %r0, %r26
	.word 0xbde52066  ! 3484: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde461a5  ! 3488: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e46187  ! 3490: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421f7  ! 3494: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e520fa  ! 3495: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e1c6  ! 3496: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e460c7  ! 3497: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9520000  ! 3500: RDPR_PIL	<illegal instruction>
	.word 0xb0848000  ! 3501: ADDcc_R	addcc 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe420bc  ! 3508: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5203c  ! 3509: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3540000  ! 3510: RDPR_GL	<illegal instruction>
	.word 0xb5e4e189  ! 3520: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x9194e064  ! 3522: WRPR_PIL_I	wrpr	%r19, 0x0064, %pil
	.word 0xb9e4e1d5  ! 3524: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e561c6  ! 3526: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e421d6  ! 3527: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4a1c6  ! 3534: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5a175  ! 3535: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb484e129  ! 3536: ADDcc_I	addcc 	%r19, 0x0129, %r26
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 3541: RDPR_TPC	<illegal instruction>
	.word 0xbde521db  ! 3543: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7508000  ! 3544: RDPR_TSTATE	<illegal instruction>
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 3551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xbde5200f  ! 3552: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe560f6  ! 3555: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb540000  ! 3556: RDPR_GL	<illegal instruction>
	.word 0x8d95e0e9  ! 3560: WRPR_PSTATE_I	wrpr	%r23, 0x00e9, %pstate
	.word 0x8994a031  ! 3561: WRPR_TICK_I	wrpr	%r18, 0x0031, %tick
	.word 0xb9508000  ! 3563: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe5e0fe  ! 3565: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe52174  ! 3567: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4a050  ! 3568: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 3571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xb5e4e07d  ! 3576: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x859420f5  ! 3581: WRPR_TSTATE_I	wrpr	%r16, 0x00f5, %tstate
	.word 0xbde4617e  ! 3583: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7500000  ! 3585: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a036  ! 3587: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e52071  ! 3594: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde4a02f  ! 3595: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde46030  ! 3596: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 3599: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e4e058  ! 3604: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_2, %g1, %r21
	.word 0xbcbd0000  ! 3606: XNORcc_R	xnorcc 	%r20, %r0, %r30
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56070  ! 3613: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e122  ! 3615: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe461d2  ! 3617: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5204d  ! 3619: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf518000  ! 3621: RDPR_PSTATE	<illegal instruction>
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0c2  ! 3623: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb751c000  ! 3624: RDPR_TL	<illegal instruction>
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 3628: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe461fd  ! 3630: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e5a1d0  ! 3631: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb53d7001  ! 3639: SRAX_I	srax	%r21, 0x0001, %r26
	.word 0xb834a0ad  ! 3640: ORN_I	orn 	%r18, 0x00ad, %r28
	.word 0x8195610f  ! 3642: WRPR_TPC_I	wrpr	%r21, 0x010f, %tpc
	.word 0xb5643801  ! 3644: MOVcc_I	<illegal instruction>
	.word 0xbfe4e1d3  ! 3645: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a155  ! 3647: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe46040  ! 3652: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7540000  ! 3654: RDPR_GL	<illegal instruction>
	.word 0xbde4a0c6  ! 3656: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe5e088  ! 3661: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb8ad4000  ! 3663: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0x9195608c  ! 3666: WRPR_PIL_I	wrpr	%r21, 0x008c, %pil
	.word 0xb1e4a0b5  ! 3668: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d946176  ! 3669: WRPR_PSTATE_I	wrpr	%r17, 0x0176, %pstate
	.word 0xb9e4a0b2  ! 3671: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e46159  ! 3683: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d956028  ! 3684: WRPR_PSTATE_I	wrpr	%r21, 0x0028, %pstate
	.word 0x8995e0d3  ! 3687: WRPR_TICK_I	wrpr	%r23, 0x00d3, %tick
	.word 0xbfe42082  ! 3691: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e56137  ! 3693: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5e009  ! 3695: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5e185  ! 3697: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x81946070  ! 3699: WRPR_TPC_I	wrpr	%r17, 0x0070, %tpc
	.word 0xb9e5e01a  ! 3701: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5a0bb  ! 3704: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe461c4  ! 3710: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e4a1f5  ! 3713: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb643801  ! 3714: MOVcc_I	<illegal instruction>
	.word 0xbfe42045  ! 3715: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5a043  ! 3718: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e421e1  ! 3719: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb234c000  ! 3720: ORN_R	orn 	%r19, %r0, %r25
	.word 0xb1e5e071  ! 3721: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb751c000  ! 3722: RDPR_TL	<illegal instruction>
	.word 0xb0140000  ! 3723: OR_R	or 	%r16, %r0, %r24
	.word 0xbfe4e172  ! 3724: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4a17b  ! 3725: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e56049  ! 3726: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e52023  ! 3728: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982bc3  ! 3729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0xbfe4213a  ! 3732: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5e05e  ! 3735: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9508000  ! 3742: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a11e  ! 3743: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9510000  ! 3746: RDPR_TICK	<illegal instruction>
	.word 0xb434a14f  ! 3748: SUBC_I	orn 	%r18, 0x014f, %r26
	.word 0xbde420b9  ! 3752: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3480000  ! 3755: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5e520a5  ! 3758: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982913  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0913, %hpstate
	.word 0xb3500000  ! 3765: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a04c  ! 3767: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4e155  ! 3768: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe5e04a  ! 3771: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8195a1b4  ! 3772: WRPR_TPC_I	wrpr	%r22, 0x01b4, %tpc
	.word 0xbfe42150  ! 3775: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x859460a0  ! 3778: WRPR_TSTATE_I	wrpr	%r17, 0x00a0, %tstate
	.word 0xb5e521fb  ! 3781: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x819839c3  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c3, %hpstate
	.word 0xb9e56175  ! 3785: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbd508000  ! 3788: RDPR_TSTATE	<illegal instruction>
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3791: RDPR_TICK	<illegal instruction>
	.word 0xb3e52140  ! 3796: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7510000  ! 3799: RDPR_TICK	<illegal instruction>
	.word 0xb9e4616f  ! 3800: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5206d  ! 3804: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe520c4  ! 3805: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4e16d  ! 3806: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf540000  ! 3809: RDPR_GL	<illegal instruction>
	.word 0xb3e461a9  ! 3822: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e5a053  ! 3825: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5504000  ! 3826: RDPR_TNPC	<illegal instruction>
	.word 0xb13d0000  ! 3827: SRA_R	sra 	%r20, %r0, %r24
	.word 0xbfe5e088  ! 3829: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde520fe  ! 3830: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e5a0dd  ! 3831: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e46106  ! 3835: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e561ba  ! 3837: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf540000  ! 3839: RDPR_GL	<illegal instruction>
	.word 0xbb508000  ! 3844: RDPR_TSTATE	<illegal instruction>
	.word 0xbf3c0000  ! 3845: SRA_R	sra 	%r16, %r0, %r31
	.word 0xbd518000  ! 3847: RDPR_PSTATE	<illegal instruction>
	.word 0xbde560cd  ! 3852: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8994a1c4  ! 3853: WRPR_TICK_I	wrpr	%r18, 0x01c4, %tick
	.word 0xb3e42006  ! 3854: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_4, %g1, %r18
	.word 0xbf510000  ! 3860: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983809  ! 3863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1809, %hpstate
	.word 0xb7e4e1d7  ! 3864: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba34a0ac  ! 3869: ORN_I	orn 	%r18, 0x00ac, %r29
	.word 0xbbe5e09c  ! 3870: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5e13f  ! 3871: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5e19e  ! 3873: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbc0c8000  ! 3876: AND_R	and 	%r18, %r0, %r30
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946013  ! 3883: WRPR_TNPC_I	wrpr	%r17, 0x0013, %tnpc
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 3885: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a1fa  ! 3886: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5e0a1  ! 3894: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 3895: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5e091  ! 3896: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e52027  ! 3897: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e420b0  ! 3898: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7641800  ! 3899: MOVcc_R	<illegal instruction>
	.word 0xbde5e1ed  ! 3902: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5e0b1  ! 3903: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e4a0ef  ! 3904: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3504000  ! 3905: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5e126  ! 3906: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3347001  ! 3908: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xb9480000  ! 3909: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09c0000  ! 3915: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xbfe5a0c6  ! 3917: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb2ad619e  ! 3918: ANDNcc_I	andncc 	%r21, 0x019e, %r25
	setx	data_start_0, %g1, %r17
	mov	0, %r14
	.word 0xa193a000  ! 3920: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5a0f7  ! 3923: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e42186  ! 3924: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e010  ! 3926: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0eb  ! 3930: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5a0a6  ! 3932: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb2854000  ! 3935: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0x81956102  ! 3936: WRPR_TPC_I	wrpr	%r21, 0x0102, %tpc
	.word 0xbeace1ce  ! 3938: ANDNcc_I	andncc 	%r19, 0x01ce, %r31
	.word 0xb0140000  ! 3940: OR_R	or 	%r16, %r0, %r24
	.word 0xb7e4a0d2  ! 3944: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4a11e  ! 3945: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1d9  ! 3948: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6b461e4  ! 3955: ORNcc_I	orncc 	%r17, 0x01e4, %r27
	.word 0xbb510000  ! 3956: RDPR_TICK	<illegal instruction>
	.word 0xb5500000  ! 3959: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3962: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0844000  ! 3966: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0xb934f001  ! 3969: SRLX_I	srlx	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 3975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xb9e5a057  ! 3976: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e46064  ! 3980: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xba1c8000  ! 3981: XOR_R	xor 	%r18, %r0, %r29
	.word 0x8995213b  ! 3982: WRPR_TICK_I	wrpr	%r20, 0x013b, %tick
	.word 0xb1e460d9  ! 3987: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4a112  ! 3991: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe56083  ! 3996: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a05c  ! 4000: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7359000  ! 4007: SRLX_R	srlx	%r22, %r0, %r27
	.word 0xbde46194  ! 4009: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e521a8  ! 4012: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb550c000  ! 4017: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 4019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e56066  ! 4032: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4e115  ! 4034: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e42114  ! 4037: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd7d6401  ! 4040: MOVR_I	movre	%r21, 0x1, %r30
	.word 0xb534f001  ! 4041: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb9e4e032  ! 4043: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e56174  ! 4044: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5e121  ! 4047: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e015  ! 4049: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe56167  ! 4050: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd3c6001  ! 4052: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xb1e4e1c6  ! 4053: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc350000  ! 4054: ORN_R	orn 	%r20, %r0, %r30
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 4058: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52127  ! 4061: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5a12c  ! 4062: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5211f  ! 4063: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e520a5  ! 4064: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde56151  ! 4065: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8995a197  ! 4067: WRPR_TICK_I	wrpr	%r22, 0x0197, %tick
	.word 0xb5e42163  ! 4068: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb350c000  ! 4069: RDPR_TT	<illegal instruction>
	.word 0xb3e4a18d  ! 4070: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb8b40000  ! 4072: SUBCcc_R	orncc 	%r16, %r0, %r28
	.word 0xbbe5604b  ! 4074: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb72ce001  ! 4079: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xb1520000  ! 4081: RDPR_PIL	<illegal instruction>
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e128  ! 4098: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a0fa  ! 4101: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 4104: RDPR_GL	<illegal instruction>
	.word 0xb9e4e127  ! 4106: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4a144  ! 4107: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4207e  ! 4108: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x20115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0xb40ca01d  ! 4111: AND_I	and 	%r18, 0x001d, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c99  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c99, %hpstate
	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e071  ! 4117: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde42015  ! 4118: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e420b4  ! 4129: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_0, %g1, %r16
	.word 0xb9504000  ! 4131: RDPR_TNPC	<illegal instruction>
	.word 0xbbe52084  ! 4132: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x879560a7  ! 4143: WRPR_TT_I	wrpr	%r21, 0x00a7, %tt
	.word 0xbbe520ac  ! 4144: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4147: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe52099  ! 4148: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbe25c000  ! 4153: SUB_R	sub 	%r23, %r0, %r31
	.word 0xbbe4201b  ! 4154: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42104  ! 4155: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5e167  ! 4161: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e46063  ! 4165: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb69561d1  ! 4167: ORcc_I	orcc 	%r21, 0x01d1, %r27
	.word 0xbde4a178  ! 4170: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8194208f  ! 4177: WRPR_TPC_I	wrpr	%r16, 0x008f, %tpc
	.word 0x8194602f  ! 4178: WRPR_TPC_I	wrpr	%r17, 0x002f, %tpc
	.word 0xbeb5619c  ! 4194: ORNcc_I	orncc 	%r21, 0x019c, %r31
	.word 0xb3e4a0d6  ! 4200: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46171  ! 4203: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf2cb001  ! 4208: SLLX_I	sllx	%r18, 0x0001, %r31
	.word 0xb9e421ad  ! 4213: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e420ee  ! 4214: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8595a071  ! 4220: WRPR_TSTATE_I	wrpr	%r22, 0x0071, %tstate
	.word 0xbfe4e112  ! 4221: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb835a19e  ! 4222: ORN_I	orn 	%r22, 0x019e, %r28
	.word 0xb3e4a11e  ! 4225: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb17ca401  ! 4226: MOVR_I	movre	%r18, 0x1, %r24
	.word 0xb5e4a134  ! 4229: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7518000  ! 4233: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5a02d  ! 4236: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e013  ! 4238: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5518000  ! 4240: RDPR_PSTATE	<illegal instruction>
	.word 0x8595610d  ! 4242: WRPR_TSTATE_I	wrpr	%r21, 0x010d, %tstate
	.word 0xb4c42192  ! 4251: ADDCcc_I	addccc 	%r16, 0x0192, %r26
	.word 0xbc2d4000  ! 4255: ANDN_R	andn 	%r21, %r0, %r30
	setx	0x20f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e561ec  ! 4257: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e560bb  ! 4260: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf508000  ! 4262: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe52110  ! 4265: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5a1fb  ! 4268: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde520e2  ! 4270: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x83946067  ! 4271: WRPR_TNPC_I	wrpr	%r17, 0x0067, %tnpc
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a1d9  ! 4277: WRPR_TT_I	wrpr	%r22, 0x01d9, %tt
	.word 0xb7e421aa  ! 4279: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5a032  ! 4281: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 4286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xb9e5a0a7  ! 4287: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e4e1a4  ! 4289: SAVE_I	save	%r19, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 4291: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4298: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 4301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 4303: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf480000  ! 4305: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x9195e183  ! 4306: WRPR_PIL_I	wrpr	%r23, 0x0183, %pil
	.word 0xb9e56020  ! 4307: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xb225c000  ! 4314: SUB_R	sub 	%r23, %r0, %r25
	.word 0xb7e5615b  ! 4315: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5e1ed  ! 4317: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5a1e0  ! 4318: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde5a00d  ! 4321: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe4a000  ! 4322: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7510000  ! 4323: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4327: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe5206d  ! 4329: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5a100  ! 4331: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5206a  ! 4333: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e42009  ! 4334: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1500000  ! 4335: RDPR_TPC	<illegal instruction>
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe52047  ! 4338: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5202a  ! 4340: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r12
	.word 0x8f932000  ! 4344: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r21
	.word 0xb1e5e183  ! 4346: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e4a005  ! 4347: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbe15a1c4  ! 4352: OR_I	or 	%r22, 0x01c4, %r31
	.word 0x8995615f  ! 4353: WRPR_TICK_I	wrpr	%r21, 0x015f, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r22
	.word 0x8195e0f3  ! 4360: WRPR_TPC_I	wrpr	%r23, 0x00f3, %tpc
	.word 0xb9e5a186  ! 4361: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd343001  ! 4363: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb7504000  ! 4366: RDPR_TNPC	<illegal instruction>
	.word 0xbf51c000  ! 4371: RDPR_TL	<illegal instruction>
	.word 0xb9e4e05c  ! 4372: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e520c2  ! 4377: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5e19c  ! 4378: SAVE_I	save	%r23, 0x0001, %r24
	mov	1, %r14
	.word 0xa193a000  ! 4381: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb551c000  ! 4383: RDPR_TL	<illegal instruction>
	.word 0xbf3c0000  ! 4384: SRA_R	sra 	%r16, %r0, %r31
	.word 0xb5e4a065  ! 4385: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3510000  ! 4386: RDPR_TICK	<illegal instruction>
	.word 0xb9e5608e  ! 4388: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8394202d  ! 4389: WRPR_TNPC_I	wrpr	%r16, 0x002d, %tnpc
	.word 0xb425c000  ! 4390: SUB_R	sub 	%r23, %r0, %r26
	.word 0x8d9461f6  ! 4391: WRPR_PSTATE_I	wrpr	%r17, 0x01f6, %pstate
	.word 0xb3e5e1cd  ! 4393: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e46195  ! 4396: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42138  ! 4401: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb53d7001  ! 4402: SRAX_I	srax	%r21, 0x0001, %r26
	.word 0xb1356001  ! 4403: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xb5e5a113  ! 4405: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x91952161  ! 4406: WRPR_PIL_I	wrpr	%r20, 0x0161, %pil
	.word 0xb62c4000  ! 4407: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xb41560bd  ! 4408: OR_I	or 	%r21, 0x00bd, %r26
	.word 0xbc846167  ! 4410: ADDcc_I	addcc 	%r17, 0x0167, %r30
	.word 0xb824a0af  ! 4414: SUB_I	sub 	%r18, 0x00af, %r28
	.word 0xb37c6401  ! 4417: MOVR_I	movre	%r17, 0x1, %r25
	.word 0xb9e5e1c0  ! 4423: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5a14e  ! 4424: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982c53  ! 4427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c53, %hpstate
	.word 0xbbe5e043  ! 4430: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e520fb  ! 4433: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4e13b  ! 4434: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e46199  ! 4436: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52028  ! 4454: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb41d2008  ! 4456: XOR_I	xor 	%r20, 0x0008, %r26
	.word 0xb9e56015  ! 4459: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4206d  ! 4462: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5a047  ! 4464: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x81952152  ! 4466: WRPR_TPC_I	wrpr	%r20, 0x0152, %tpc
	.word 0xb3e5611b  ! 4467: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5e0ac  ! 4469: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5a014  ! 4471: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9540000  ! 4474: RDPR_GL	<illegal instruction>
	.word 0xb9e4608e  ! 4476: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5a022  ! 4477: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e10f  ! 4481: WRPR_TICK_I	wrpr	%r23, 0x010f, %tick
	.word 0xb4154000  ! 4485: OR_R	or 	%r21, %r0, %r26
	.word 0xbb510000  ! 4486: RDPR_TICK	<illegal instruction>
	.word 0xb044608e  ! 4487: ADDC_I	addc 	%r17, 0x008e, %r24
	.word 0xb951c000  ! 4489: RDPR_TL	<illegal instruction>
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe521b9  ! 4494: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4e06f  ! 4497: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 4502: XOR_R	xor 	%r19, %r0, %r26
	.word 0xb5e460b3  ! 4503: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6c4e04c  ! 4507: ADDCcc_I	addccc 	%r19, 0x004c, %r27
	.word 0xb9e4619e  ! 4508: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0a7  ! 4523: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5213c  ! 4525: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde42146  ! 4526: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9540000  ! 4527: RDPR_GL	<illegal instruction>
	.word 0xbfe5e0e0  ! 4537: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5a176  ! 4539: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8394614b  ! 4540: WRPR_TNPC_I	wrpr	%r17, 0x014b, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982d89  ! 4541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d89, %hpstate
	.word 0xbb508000  ! 4543: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4a05f  ! 4545: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9520000  ! 4547: RDPR_PIL	<illegal instruction>
	.word 0xb1e4e023  ! 4552: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e4a0aa  ! 4553: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe46062  ! 4554: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4e0f4  ! 4556: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 4561: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4e0f4  ! 4562: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde46185  ! 4564: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e421b8  ! 4567: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5a0e5  ! 4568: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9510000  ! 4573: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a161  ! 4574: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e007  ! 4576: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe34604d  ! 4583: SUBC_I	orn 	%r17, 0x004d, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e11f  ! 4593: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf508000  ! 4596: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 4599: RDPR_TSTATE	<illegal instruction>
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42007  ! 4603: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e421dc  ! 4605: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e520f2  ! 4608: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4e183  ! 4609: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8195a09e  ! 4611: WRPR_TPC_I	wrpr	%r22, 0x009e, %tpc
	.word 0xb7e4a1ec  ! 4615: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4e15b  ! 4616: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x20035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52120  ! 4618: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x21d, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982c81  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
	.word 0xbde561ad  ! 4639: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe5615e  ! 4648: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb0b561b2  ! 4655: ORNcc_I	orncc 	%r21, 0x01b2, %r24
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e420c0  ! 4657: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_7, %g1, %r23
	.word 0xb9508000  ! 4661: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe420a8  ! 4663: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb8a48000  ! 4664: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xb3500000  ! 4668: RDPR_TPC	<illegal instruction>
	.word 0xb5e4e0cd  ! 4669: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5a1d6  ! 4673: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_2, %g1, %r21
	.word 0xb32d1000  ! 4678: SLLX_R	sllx	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x8198295b  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	.word 0xb7e5204d  ! 4680: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e4a0b7  ! 4681: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d946048  ! 4684: WRPR_PSTATE_I	wrpr	%r17, 0x0048, %pstate
	.word 0xb1e42095  ! 4688: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x89956010  ! 4689: WRPR_TICK_I	wrpr	%r21, 0x0010, %tick
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8a4e11a  ! 4693: SUBcc_I	subcc 	%r19, 0x011a, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0x8794e091  ! 4695: WRPR_TT_I	wrpr	%r19, 0x0091, %tt
	.word 0xb7e4a036  ! 4696: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x81952017  ! 4698: WRPR_TPC_I	wrpr	%r20, 0x0017, %tpc
	.word 0xb635c000  ! 4700: ORN_R	orn 	%r23, %r0, %r27
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0e3  ! 4702: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5a043  ! 4706: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e52130  ! 4707: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a0ef  ! 4710: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5208a  ! 4714: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_6, %g1, %r20
	.word 0xb5e461e0  ! 4719: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e91  ! 4721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e91, %hpstate
	.word 0xb7e46194  ! 4722: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e42078  ! 4724: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a159  ! 4725: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5207a  ! 4728: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb6c5c000  ! 4734: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xb5e5e042  ! 4737: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd480000  ! 4738: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e420fe  ! 4748: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e420e1  ! 4749: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5202a  ! 4751: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5540000  ! 4753: RDPR_GL	<illegal instruction>
	.word 0x8995a1fb  ! 4754: WRPR_TICK_I	wrpr	%r22, 0x01fb, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf520000  ! 4761: RDPR_PIL	<illegal instruction>
	.word 0xb9e46030  ! 4765: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5207e  ! 4769: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf500000  ! 4771: RDPR_TPC	<illegal instruction>
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4613e  ! 4777: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbe9c8000  ! 4780: XORcc_R	xorcc 	%r18, %r0, %r31
	setx	data_start_6, %g1, %r21
	.word 0xb3540000  ! 4782: RDPR_GL	<illegal instruction>
	.word 0xb7504000  ! 4784: RDPR_TNPC	<illegal instruction>
	.word 0xb3510000  ! 4792: RDPR_TICK	<illegal instruction>
	.word 0xbab4c000  ! 4797: SUBCcc_R	orncc 	%r19, %r0, %r29
	.word 0xbf344000  ! 4799: SRL_R	srl 	%r17, %r0, %r31
	.word 0x91956152  ! 4804: WRPR_PIL_I	wrpr	%r21, 0x0152, %pil
	.word 0xbd510000  ! 4811: RDPR_TICK	<illegal instruction>
	setx	data_start_6, %g1, %r18
	setx	0x136, %g1, %o0
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
	.word 0xb5e4e1cf  ! 4825: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb0956058  ! 4826: ORcc_I	orcc 	%r21, 0x0058, %r24
	.word 0xbde56061  ! 4827: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb60c4000  ! 4829: AND_R	and 	%r17, %r0, %r27
	.word 0xbfe561b2  ! 4831: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e5601e  ! 4832: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde460ed  ! 4834: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb518000  ! 4841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d9461f2  ! 4849: WRPR_PSTATE_I	wrpr	%r17, 0x01f2, %pstate
	.word 0xbf3ca001  ! 4850: SRA_I	sra 	%r18, 0x0001, %r31
	.word 0xbb518000  ! 4853: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 4854: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e420c3  ! 4855: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde420d9  ! 4858: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4a02b  ! 4859: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983adb  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1adb, %hpstate
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1a9  ! 4863: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x899560f1  ! 4864: WRPR_TICK_I	wrpr	%r21, 0x00f1, %tick
	.word 0xb5e4a030  ! 4866: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe561d9  ! 4871: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1520000  ! 4872: RDPR_PIL	<illegal instruction>
	.word 0xb5e4a1b9  ! 4874: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e420de  ! 4875: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e42185  ! 4877: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	.word 0xb3e5208b  ! 4885: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd480000  ! 4886: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x11a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e520e2  ! 4890: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e461f8  ! 4892: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4a04c  ! 4893: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a182  ! 4898: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1db  ! 4905: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb510000  ! 4906: RDPR_TICK	<illegal instruction>
	.word 0x8194e171  ! 4907: WRPR_TPC_I	wrpr	%r19, 0x0171, %tpc
	.word 0xb3e5a0d2  ! 4908: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9195e0bc  ! 4911: WRPR_PIL_I	wrpr	%r23, 0x00bc, %pil
	.word 0xbfe5e15e  ! 4915: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 4916: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e42010  ! 4918: SAVE_I	save	%r16, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 4931: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 4932: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e561f4  ! 4935: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9540000  ! 4936: RDPR_GL	<illegal instruction>
	.word 0xbfe5600b  ! 4937: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 4954: RDPR_PIL	<illegal instruction>
	.word 0xbbe42189  ! 4955: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe95c000  ! 4957: ORcc_R	orcc 	%r23, %r0, %r31
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1351000  ! 4962: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xbb3db001  ! 4964: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xb4b4e040  ! 4965: ORNcc_I	orncc 	%r19, 0x0040, %r26
	.word 0xb1500000  ! 4968: RDPR_TPC	<illegal instruction>
	.word 0xb1e4a0ca  ! 4969: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3643801  ! 4973: MOVcc_I	<illegal instruction>
	.word 0xb5e52190  ! 4974: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952022  ! 4982: WRPR_TPC_I	wrpr	%r20, 0x0022, %tpc
	.word 0xbd520000  ! 4984: RDPR_PIL	<illegal instruction>
	.word 0xb77d0400  ! 4985: MOVR_R	movre	%r20, %r0, %r27
	.word 0xb5e4a001  ! 4989: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb351c000  ! 4991: RDPR_TL	<illegal instruction>
	.word 0xbbe4a01a  ! 4992: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe520bb  ! 4995: SAVE_I	save	%r20, 0x0001, %r31
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
	.word 0xfd3c4000  ! 5: STDF_R	std	%f30, [%r0, %r17]
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41d60a1  ! 10: XOR_I	xor 	%r21, 0x00a1, %r26
	.word 0xb3641800  ! 15: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c51  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c51, %hpstate
	.word 0xfe25e010  ! 19: STW_I	stw	%r31, [%r23 + 0x0010]
	.word 0xb2248000  ! 21: SUB_R	sub 	%r18, %r0, %r25
	.word 0xfa24e0a9  ! 24: STW_I	stw	%r29, [%r19 + 0x00a9]
	.word 0xb69dc000  ! 29: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xfa348000  ! 30: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf4254000  ! 32: STW_R	stw	%r26, [%r21 + %r0]
	setx	data_start_5, %g1, %r17
	.word 0xb9504000  ! 36: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfc3c4000  ! 38: STD_R	std	%r30, [%r17 + %r0]
	.word 0xfd3da148  ! 39: STDF_I	std	%f30, [0x0148, %r22]
	.word 0xb151c000  ! 41: RDPR_TL	<illegal instruction>
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4254000  ! 44: STW_R	stw	%r26, [%r21 + %r0]
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 47: RDPR_TNPC	<illegal instruction>
	.word 0xf23d0000  ! 48: STD_R	std	%r25, [%r20 + %r0]
	.word 0xf23cc000  ! 51: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf4358000  ! 55: STH_R	sth	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819839c9  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c9, %hpstate
	.word 0xf23d0000  ! 59: STD_R	std	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982d99  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
	.word 0xf624211f  ! 63: STW_I	stw	%r27, [%r16 + 0x011f]
	.word 0xf23c0000  ! 64: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf33d8000  ! 66: STDF_R	std	%f25, [%r0, %r22]
	.word 0xff3d2164  ! 68: STDF_I	std	%f31, [0x0164, %r20]
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	.word 0xf835e11f  ! 71: STH_I	sth	%r28, [%r23 + 0x011f]
	.word 0xfc258000  ! 73: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf225a10e  ! 83: STW_I	stw	%r25, [%r22 + 0x010e]
	.word 0xf23c0000  ! 84: STD_R	std	%r25, [%r16 + %r0]
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75c000  ! 87: STX_R	stx	%r31, [%r23 + %r0]
	.word 0x839561b1  ! 88: WRPR_TNPC_I	wrpr	%r21, 0x01b1, %tnpc
	.word 0xf8348000  ! 89: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfc3cc000  ! 91: STD_R	std	%r30, [%r19 + %r0]
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03d4000  ! 93: STD_R	std	%r24, [%r21 + %r0]
	.word 0xbb508000  ! 94: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8595219c  ! 95: WRPR_TSTATE_I	wrpr	%r20, 0x019c, %tstate
	.word 0xbb504000  ! 102: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf63460b8  ! 106: STH_I	sth	%r27, [%r17 + 0x00b8]
	.word 0xb52d2001  ! 107: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xf13c4000  ! 108: STDF_R	std	%f24, [%r0, %r17]
	ta	T_CHANGE_HPRIV
	.word 0x81982e0b  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0b, %hpstate
	.word 0xbd2c2001  ! 113: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xfc2d8000  ! 114: STB_R	stb	%r30, [%r22 + %r0]
	setx	0x10335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xf034a139  ! 131: STH_I	sth	%r24, [%r18 + 0x0139]
	.word 0xfe2da11e  ! 132: STB_I	stb	%r31, [%r22 + 0x011e]
	.word 0xf635c000  ! 134: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xb8b4e03e  ! 135: SUBCcc_I	orncc 	%r19, 0x003e, %r28
	.word 0xfb3d21b9  ! 141: STDF_I	std	%f29, [0x01b9, %r20]
	.word 0xf33d21c6  ! 142: STDF_I	std	%f25, [0x01c6, %r20]
	.word 0xb5480000  ! 144: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x30319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xf425200f  ! 154: STW_I	stw	%r26, [%r20 + 0x000f]
	ta	T_CHANGE_HPRIV
	.word 0x81982e89  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e89, %hpstate
	.word 0xf62d20eb  ! 158: STB_I	stb	%r27, [%r20 + 0x00eb]
	.word 0xf425608e  ! 160: STW_I	stw	%r26, [%r21 + 0x008e]
	.word 0xb83d20eb  ! 163: XNOR_I	xnor 	%r20, 0x00eb, %r28
	.word 0xbb508000  ! 164: RDPR_TSTATE	rdpr	%tstate, %r29
	setx	data_start_7, %g1, %r18
	mov	2, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa2ce1f2  ! 172: STB_I	stb	%r29, [%r19 + 0x01f2]
	.word 0xfa35615d  ! 177: STH_I	sth	%r29, [%r21 + 0x015d]
	mov	2, %r12
	.word 0x8f932000  ! 181: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe2c6041  ! 182: STB_I	stb	%r31, [%r17 + 0x0041]
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 188: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf53da11e  ! 189: STDF_I	std	%f26, [0x011e, %r22]
	.word 0xfd3cc000  ! 190: STDF_R	std	%f30, [%r0, %r19]
	setx	data_start_7, %g1, %r16
	.word 0xb57d2401  ! 195: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xf47460e9  ! 200: STX_I	stx	%r26, [%r17 + 0x00e9]
	.word 0x8994a1d6  ! 201: WRPR_TICK_I	wrpr	%r18, 0x01d6, %tick
	.word 0x8d9461cd  ! 203: WRPR_PSTATE_I	wrpr	%r17, 0x01cd, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf835a0b4  ! 205: STH_I	sth	%r28, [%r22 + 0x00b4]
	.word 0x8795e0b2  ! 206: WRPR_TT_I	wrpr	%r23, 0x00b2, %tt
	.word 0xf02520e6  ! 209: STW_I	stw	%r24, [%r20 + 0x00e6]
	.word 0xf22d8000  ! 213: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xbd504000  ! 214: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xfe3c4000  ! 216: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf835a010  ! 219: STH_I	sth	%r28, [%r22 + 0x0010]
	.word 0xf63d21f5  ! 222: STD_I	std	%r27, [%r20 + 0x01f5]
	.word 0xbc1ce0cb  ! 229: XOR_I	xor 	%r19, 0x00cb, %r30
	.word 0xfd3d8000  ! 230: STDF_R	std	%f30, [%r0, %r22]
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 232: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xb3510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xfe742172  ! 241: STX_I	stx	%r31, [%r16 + 0x0172]
	.word 0xba0d4000  ! 246: AND_R	and 	%r21, %r0, %r29
	.word 0xb3540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xf074c000  ! 248: STX_R	stx	%r24, [%r19 + %r0]
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d49  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d49, %hpstate
	.word 0xf03d600a  ! 259: STD_I	std	%r24, [%r21 + 0x000a]
	.word 0xfe2561e0  ! 260: STW_I	stw	%r31, [%r21 + 0x01e0]
	.word 0xfc2c8000  ! 262: STB_R	stb	%r30, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	setx	data_start_4, %g1, %r18
	.word 0xf82da01a  ! 266: STB_I	stb	%r28, [%r22 + 0x001a]
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	.word 0xff3cc000  ! 270: STDF_R	std	%f31, [%r0, %r19]
	setx	data_start_7, %g1, %r22
	.word 0xf43c61b5  ! 275: STD_I	std	%r26, [%r17 + 0x01b5]
	.word 0x81956149  ! 277: WRPR_TPC_I	wrpr	%r21, 0x0149, %tpc
	.word 0xfc35e1d2  ! 280: STH_I	sth	%r30, [%r23 + 0x01d2]
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 282: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe248000  ! 284: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xb20c204d  ! 287: AND_I	and 	%r16, 0x004d, %r25
	.word 0xfe344000  ! 288: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfc3c0000  ! 292: STD_R	std	%r30, [%r16 + %r0]
	.word 0xf234e080  ! 295: STH_I	sth	%r25, [%r19 + 0x0080]
	.word 0xf6744000  ! 296: STX_R	stx	%r27, [%r17 + %r0]
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2461e5  ! 311: STW_I	stw	%r31, [%r17 + 0x01e5]
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xf625c000  ! 314: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf93c8000  ! 315: STDF_R	std	%f28, [%r0, %r18]
	.word 0xb550c000  ! 316: RDPR_TT	rdpr	%tt, %r26
	.word 0xf22c21fc  ! 318: STB_I	stb	%r25, [%r16 + 0x01fc]
	.word 0x8d9560dd  ! 325: WRPR_PSTATE_I	wrpr	%r21, 0x00dd, %pstate
	.word 0x8994a0e5  ! 328: WRPR_TICK_I	wrpr	%r18, 0x00e5, %tick
	.word 0xf23d6103  ! 336: STD_I	std	%r25, [%r21 + 0x0103]
	.word 0xb53d6001  ! 338: SRA_I	sra 	%r21, 0x0001, %r26
	.word 0xfc2d4000  ! 340: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf2240000  ! 343: STW_R	stw	%r25, [%r16 + %r0]
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e003  ! 345: WRPR_TPC_I	wrpr	%r23, 0x0003, %tpc
	.word 0xf22d6175  ! 347: STB_I	stb	%r25, [%r21 + 0x0175]
	.word 0xb1500000  ! 348: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbe05212f  ! 349: ADD_I	add 	%r20, 0x012f, %r31
	.word 0xf434603e  ! 350: STH_I	sth	%r26, [%r17 + 0x003e]
	.word 0xf02560f4  ! 351: STW_I	stw	%r24, [%r21 + 0x00f4]
	.word 0xf63ca127  ! 353: STD_I	std	%r27, [%r18 + 0x0127]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb72d3001  ! 357: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xfb3c0000  ! 358: STDF_R	std	%f29, [%r0, %r16]
	.word 0x8d9460a9  ! 363: WRPR_PSTATE_I	wrpr	%r17, 0x00a9, %pstate
	.word 0x8994e05e  ! 364: WRPR_TICK_I	wrpr	%r19, 0x005e, %tick
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc350000  ! 369: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfe2ce118  ! 370: STB_I	stb	%r31, [%r19 + 0x0118]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf33d2047  ! 374: STDF_I	std	%f25, [0x0047, %r20]
	.word 0xf82521bf  ! 375: STW_I	stw	%r28, [%r20 + 0x01bf]
	.word 0xfa75e012  ! 376: STX_I	stx	%r29, [%r23 + 0x0012]
	.word 0x8995a17e  ! 378: WRPR_TICK_I	wrpr	%r22, 0x017e, %tick
	.word 0xf6750000  ! 379: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf73c4000  ! 381: STDF_R	std	%f27, [%r0, %r17]
	.word 0x9194a067  ! 383: WRPR_PIL_I	wrpr	%r18, 0x0067, %pil
	.word 0xfc3c612d  ! 393: STD_I	std	%r30, [%r17 + 0x012d]
	.word 0x8194e054  ! 395: WRPR_TPC_I	wrpr	%r19, 0x0054, %tpc
	setx	0x20030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d8000  ! 407: STB_R	stb	%r25, [%r22 + %r0]
	setx	data_start_4, %g1, %r16
	.word 0x8794213a  ! 411: WRPR_TT_I	wrpr	%r16, 0x013a, %tt
	.word 0xbac58000  ! 418: ADDCcc_R	addccc 	%r22, %r0, %r29
	.word 0xfd3d21cd  ! 421: STDF_I	std	%f30, [0x01cd, %r20]
	.word 0xf73d4000  ! 422: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf8244000  ! 425: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xfe35c000  ! 427: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb72d5000  ! 428: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xf4754000  ! 429: STX_R	stx	%r26, [%r21 + %r0]
	setx	0x3032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 437: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0x8995a0b1  ! 439: WRPR_TICK_I	wrpr	%r22, 0x00b1, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983dc9  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc9, %hpstate
	.word 0xf43dc000  ! 442: STD_R	std	%r26, [%r23 + %r0]
	.word 0xfa24a0d5  ! 446: STW_I	stw	%r29, [%r18 + 0x00d5]
	.word 0xbf51c000  ! 450: RDPR_TL	rdpr	%tl, %r31
	.word 0xfa2d0000  ! 455: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf53c21fd  ! 456: STDF_I	std	%f26, [0x01fd, %r16]
	.word 0xf0754000  ! 459: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfc350000  ! 463: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfe2ca117  ! 465: STB_I	stb	%r31, [%r18 + 0x0117]
	.word 0xbb3c8000  ! 469: SRA_R	sra 	%r18, %r0, %r29
	.word 0x919561d4  ! 470: WRPR_PIL_I	wrpr	%r21, 0x01d4, %pil
	.word 0xf93d0000  ! 472: STDF_R	std	%f28, [%r0, %r20]
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 475: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf23de1ee  ! 478: STD_I	std	%r25, [%r23 + 0x01ee]
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 480: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf0346007  ! 482: STH_I	sth	%r24, [%r17 + 0x0007]
	.word 0xf42d6023  ! 484: STB_I	stb	%r26, [%r21 + 0x0023]
	.word 0xbf518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0x8395a02f  ! 486: WRPR_TNPC_I	wrpr	%r22, 0x002f, %tnpc
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3de026  ! 488: STD_I	std	%r31, [%r23 + 0x0026]
	.word 0xb1480000  ! 498: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf2242124  ! 499: STW_I	stw	%r25, [%r16 + 0x0124]
	.word 0xf634e1d7  ! 501: STH_I	sth	%r27, [%r19 + 0x01d7]
	.word 0xfc250000  ! 502: STW_R	stw	%r30, [%r20 + %r0]
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02da05f  ! 505: STB_I	stb	%r24, [%r22 + 0x005f]
	setx	data_start_6, %g1, %r23
	.word 0xfe7461b5  ! 511: STX_I	stx	%r31, [%r17 + 0x01b5]
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf33c4000  ! 518: STDF_R	std	%f25, [%r0, %r17]
	.word 0xfe754000  ! 520: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xbb510000  ! 521: RDPR_TICK	rdpr	%tick, %r29
	setx	data_start_1, %g1, %r23
	.word 0xf03c6083  ! 523: STD_I	std	%r24, [%r17 + 0x0083]
	.word 0xf03da19a  ! 525: STD_I	std	%r24, [%r22 + 0x019a]
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09dc000  ! 533: XORcc_R	xorcc 	%r23, %r0, %r24
	.word 0xfc2de0fe  ! 534: STB_I	stb	%r30, [%r23 + 0x00fe]
	setx	0x2002e, %g1, %o0
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
	mov	2, %r12
	.word 0x8f932000  ! 541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf73ce0c7  ! 543: STDF_I	std	%f27, [0x00c7, %r19]
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834a157  ! 550: STH_I	sth	%r28, [%r18 + 0x0157]
	.word 0xf62d8000  ! 551: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xb4c40000  ! 552: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xf62c4000  ! 553: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf62de130  ! 556: STB_I	stb	%r27, [%r23 + 0x0130]
	.word 0xb9504000  ! 559: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbb2c5000  ! 566: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xfc740000  ! 567: STX_R	stx	%r30, [%r16 + %r0]
	.word 0x839520f4  ! 568: WRPR_TNPC_I	wrpr	%r20, 0x00f4, %tnpc
	setx	0x30039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d6065  ! 574: STB_I	stb	%r27, [%r21 + 0x0065]
	.word 0xfe75e0cd  ! 575: STX_I	stx	%r31, [%r23 + 0x00cd]
	.word 0xfc24e0c2  ! 576: STW_I	stw	%r30, [%r19 + 0x00c2]
	.word 0xb6b5612a  ! 577: SUBCcc_I	orncc 	%r21, 0x012a, %r27
	.word 0xf435c000  ! 578: STH_R	sth	%r26, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982941  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0941, %hpstate
	.word 0xfd3c611b  ! 580: STDF_I	std	%f30, [0x011b, %r17]
	.word 0xf73c61b4  ! 588: STDF_I	std	%f27, [0x01b4, %r17]
	.word 0x8394609a  ! 590: WRPR_TNPC_I	wrpr	%r17, 0x009a, %tnpc
	.word 0xb414a094  ! 591: OR_I	or 	%r18, 0x0094, %r26
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf87520ad  ! 596: STX_I	stx	%r28, [%r20 + 0x00ad]
	mov	0, %r14
	.word 0xa193a000  ! 598: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe2da0b0  ! 599: STB_I	stb	%r31, [%r22 + 0x00b0]
	.word 0xb7510000  ! 601: RDPR_TICK	rdpr	%tick, %r27
	.word 0xbc858000  ! 602: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0x8794e0b4  ! 607: WRPR_TT_I	wrpr	%r19, 0x00b4, %tt
	.word 0xb33c5000  ! 608: SRAX_R	srax	%r17, %r0, %r25
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a03e  ! 612: WRPR_TICK_I	wrpr	%r18, 0x003e, %tick
	.word 0xbb480000  ! 614: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb20d0000  ! 616: AND_R	and 	%r20, %r0, %r25
	.word 0xf675a134  ! 617: STX_I	stx	%r27, [%r22 + 0x0134]
	.word 0xb3504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb1349000  ! 621: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xf835e17e  ! 624: STH_I	sth	%r28, [%r23 + 0x017e]
	.word 0xfa752121  ! 625: STX_I	stx	%r29, [%r20 + 0x0121]
	.word 0xbf51c000  ! 627: RDPR_TL	<illegal instruction>
	.word 0xf024e1c5  ! 628: STW_I	stw	%r24, [%r19 + 0x01c5]
	.word 0xf13c0000  ! 630: STDF_R	std	%f24, [%r0, %r16]
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb83521dd  ! 633: ORN_I	orn 	%r20, 0x01dd, %r28
	.word 0xf2252013  ! 634: STW_I	stw	%r25, [%r20 + 0x0013]
	.word 0x8d956068  ! 635: WRPR_PSTATE_I	wrpr	%r21, 0x0068, %pstate
	.word 0xfa3520fc  ! 641: STH_I	sth	%r29, [%r20 + 0x00fc]
	.word 0xb1500000  ! 644: RDPR_TPC	rdpr	%tpc, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93ca00f  ! 656: STDF_I	std	%f28, [0x000f, %r18]
	.word 0xf42c2138  ! 657: STB_I	stb	%r26, [%r16 + 0x0138]
	.word 0xf23de171  ! 658: STD_I	std	%r25, [%r23 + 0x0171]
	.word 0xf23ce168  ! 660: STD_I	std	%r25, [%r19 + 0x0168]
	.word 0xb09ca00f  ! 663: XORcc_I	xorcc 	%r18, 0x000f, %r24
	.word 0xf8740000  ! 664: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf624e00a  ! 667: STW_I	stw	%r27, [%r19 + 0x000a]
	.word 0x899520c0  ! 669: WRPR_TICK_I	wrpr	%r20, 0x00c0, %tick
	.word 0xf33cc000  ! 670: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf4248000  ! 673: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf93c0000  ! 674: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf53c0000  ! 675: STDF_R	std	%f26, [%r0, %r16]
	setx	data_start_7, %g1, %r22
	.word 0xf82461db  ! 679: STW_I	stw	%r28, [%r17 + 0x01db]
	.word 0xbc95e041  ! 683: ORcc_I	orcc 	%r23, 0x0041, %r30
	.word 0xb57c4400  ! 686: MOVR_R	movre	%r17, %r0, %r26
	.word 0x8d94a086  ! 692: WRPR_PSTATE_I	wrpr	%r18, 0x0086, %pstate
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a05f  ! 696: WRPR_PSTATE_I	wrpr	%r22, 0x005f, %pstate
	.word 0xf53c605c  ! 697: STDF_I	std	%f26, [0x005c, %r17]
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a0b4  ! 699: WRPR_TT_I	wrpr	%r22, 0x00b4, %tt
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 707: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf234e111  ! 710: STH_I	sth	%r25, [%r19 + 0x0111]
	.word 0xf83ca068  ! 713: STD_I	std	%r28, [%r18 + 0x0068]
	.word 0xf8350000  ! 715: STH_R	sth	%r28, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	.word 0xb4bdc000  ! 721: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xf4350000  ! 722: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfe240000  ! 723: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfc252199  ! 724: STW_I	stw	%r30, [%r20 + 0x0199]
	.word 0x9194e0d4  ! 728: WRPR_PIL_I	wrpr	%r19, 0x00d4, %pil
	.word 0xf63d8000  ! 732: STD_R	std	%r27, [%r22 + %r0]
	.word 0xb750c000  ! 733: RDPR_TT	rdpr	%tt, %r27
	.word 0xfa3c20cd  ! 736: STD_I	std	%r29, [%r16 + 0x00cd]
	.word 0xf6746173  ! 737: STX_I	stx	%r27, [%r17 + 0x0173]
	mov	2, %r12
	.word 0x8f932000  ! 738: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd35b001  ! 740: SRLX_I	srlx	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe746073  ! 744: STX_I	stx	%r31, [%r17 + 0x0073]
	.word 0xf43de0f3  ! 745: STD_I	std	%r26, [%r23 + 0x00f3]
	.word 0xb435c000  ! 747: SUBC_R	orn 	%r23, %r0, %r26
	.word 0xb9504000  ! 750: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfe35c000  ! 754: STH_R	sth	%r31, [%r23 + %r0]
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24e0ac  ! 759: STW_I	stw	%r29, [%r19 + 0x00ac]
	.word 0xfe352106  ! 764: STH_I	sth	%r31, [%r20 + 0x0106]
	.word 0xf2354000  ! 765: STH_R	sth	%r25, [%r21 + %r0]
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c0000  ! 773: STDF_R	std	%f26, [%r0, %r16]
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22461d6  ! 776: STW_I	stw	%r25, [%r17 + 0x01d6]
	.word 0xfc348000  ! 780: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf4748000  ! 782: STX_R	stx	%r26, [%r18 + %r0]
	.word 0x8d94205c  ! 784: WRPR_PSTATE_I	wrpr	%r16, 0x005c, %pstate
	.word 0xf6750000  ! 790: STX_R	stx	%r27, [%r20 + %r0]
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 795: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfa248000  ! 796: STW_R	stw	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6350000  ! 804: ORN_R	orn 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfb3d4000  ! 806: STDF_R	std	%f29, [%r0, %r21]
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	.word 0xbf504000  ! 812: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 818: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf235c000  ! 819: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xb550c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0xf83d4000  ! 822: STD_R	std	%r28, [%r21 + %r0]
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3cc000  ! 840: STDF_R	std	%f30, [%r0, %r19]
	.word 0xbc048000  ! 843: ADD_R	add 	%r18, %r0, %r30
	.word 0xfa254000  ! 844: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf83cc000  ! 845: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfe2da131  ! 846: STB_I	stb	%r31, [%r22 + 0x0131]
	.word 0xf0354000  ! 847: STH_R	sth	%r24, [%r21 + %r0]
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 855: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb8bd0000  ! 856: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0xb751c000  ! 862: RDPR_TL	rdpr	%tl, %r27
	.word 0xfe2c6103  ! 867: STB_I	stb	%r31, [%r17 + 0x0103]
	ta	T_CHANGE_HPRIV
	.word 0x8198299b  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0xf23cc000  ! 871: STD_R	std	%r25, [%r19 + %r0]
	.word 0xba1d20c1  ! 873: XOR_I	xor 	%r20, 0x00c1, %r29
	.word 0xf02d0000  ! 877: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xbb540000  ! 878: RDPR_GL	rdpr	%-, %r29
	.word 0x8d95203b  ! 879: WRPR_PSTATE_I	wrpr	%r20, 0x003b, %pstate
	.word 0x8994a1a3  ! 880: WRPR_TICK_I	wrpr	%r18, 0x01a3, %tick
	.word 0xbb51c000  ! 881: RDPR_TL	rdpr	%tl, %r29
	.word 0x8794619d  ! 887: WRPR_TT_I	wrpr	%r17, 0x019d, %tt
	mov	2, %r12
	.word 0x8f932000  ! 888: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb28ca09a  ! 894: ANDcc_I	andcc 	%r18, 0x009a, %r25
	.word 0xf0744000  ! 895: STX_R	stx	%r24, [%r17 + %r0]
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13d8000  ! 898: STDF_R	std	%f24, [%r0, %r22]
	.word 0xb49c8000  ! 901: XORcc_R	xorcc 	%r18, %r0, %r26
	mov	2, %r14
	.word 0xa193a000  ! 902: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd2d4000  ! 908: SLL_R	sll 	%r21, %r0, %r30
	.word 0xb80d8000  ! 909: AND_R	and 	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42ce106  ! 913: STB_I	stb	%r26, [%r19 + 0x0106]
	ta	T_CHANGE_HPRIV
	.word 0x8198399b  ! 914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199b, %hpstate
	.word 0x8395a0cc  ! 918: WRPR_TNPC_I	wrpr	%r22, 0x00cc, %tnpc
	.word 0xf2358000  ! 921: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xff3c6010  ! 923: STDF_I	std	%f31, [0x0010, %r17]
	.word 0xf8246135  ! 925: STW_I	stw	%r28, [%r17 + 0x0135]
	.word 0xbd50c000  ! 926: RDPR_TT	rdpr	%tt, %r30
	.word 0xb82c202b  ! 930: ANDN_I	andn 	%r16, 0x002b, %r28
	.word 0xb1504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xfc2de1fa  ! 942: STB_I	stb	%r30, [%r23 + 0x01fa]
	.word 0xf635e011  ! 943: STH_I	sth	%r27, [%r23 + 0x0011]
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0x8994a0a4  ! 948: WRPR_TICK_I	wrpr	%r18, 0x00a4, %tick
	.word 0xf424204a  ! 950: STW_I	stw	%r26, [%r16 + 0x004a]
	.word 0xfa3de17b  ! 951: STD_I	std	%r29, [%r23 + 0x017b]
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 960: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf27461ba  ! 962: STX_I	stx	%r25, [%r17 + 0x01ba]
	.word 0xf13c2011  ! 963: STDF_I	std	%f24, [0x0011, %r16]
	.word 0xb9518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xb5520000  ! 967: RDPR_PIL	<illegal instruction>
	.word 0x8995e1d4  ! 968: WRPR_TICK_I	wrpr	%r23, 0x01d4, %tick
	.word 0xf63d606a  ! 969: STD_I	std	%r27, [%r21 + 0x006a]
	.word 0xfa3de06e  ! 972: STD_I	std	%r29, [%r23 + 0x006e]
	setx	data_start_4, %g1, %r20
	.word 0xf13cc000  ! 976: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfa354000  ! 978: STH_R	sth	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6354000  ! 980: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf03ca1f5  ! 983: STD_I	std	%r24, [%r18 + 0x01f5]
	.word 0xf6350000  ! 986: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x87946060  ! 987: WRPR_TT_I	wrpr	%r17, 0x0060, %tt
	.word 0xf47421db  ! 990: STX_I	stx	%r26, [%r16 + 0x01db]
	.word 0x919520f3  ! 991: WRPR_PIL_I	wrpr	%r20, 0x00f3, %pil
	.word 0xb13c6001  ! 994: SRA_I	sra 	%r17, 0x0001, %r24
	.word 0xfd3d8000  ! 995: STDF_R	std	%f30, [%r0, %r22]
	.word 0xfe24c000  ! 996: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf6758000  ! 997: STX_R	stx	%r27, [%r22 + %r0]
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3c0000  ! 1000: STDF_R	std	%f30, [%r0, %r16]
	.word 0xfa258000  ! 1002: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xb7510000  ! 1003: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf075a052  ! 1005: STX_I	stx	%r24, [%r22 + 0x0052]
	.word 0xb9540000  ! 1007: RDPR_GL	<illegal instruction>
	.word 0xb73c6001  ! 1009: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xb215200f  ! 1011: OR_I	or 	%r20, 0x000f, %r25
	.word 0xff3c4000  ! 1012: STDF_R	std	%f31, [%r0, %r17]
	.word 0xfa250000  ! 1013: STW_R	stw	%r29, [%r20 + %r0]
	.word 0x8d95e180  ! 1014: WRPR_PSTATE_I	wrpr	%r23, 0x0180, %pstate
	.word 0xf42ce199  ! 1015: STB_I	stb	%r26, [%r19 + 0x0199]
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63da030  ! 1020: STD_I	std	%r27, [%r22 + 0x0030]
	.word 0xf024e15c  ! 1023: STW_I	stw	%r24, [%r19 + 0x015c]
	.word 0xf274a01d  ! 1025: STX_I	stx	%r25, [%r18 + 0x001d]
	.word 0xf63c4000  ! 1026: STD_R	std	%r27, [%r17 + %r0]
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 1030: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xfa350000  ! 1034: STH_R	sth	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9520000  ! 1037: RDPR_PIL	<illegal instruction>
	.word 0x8d95e178  ! 1038: WRPR_PSTATE_I	wrpr	%r23, 0x0178, %pstate
	.word 0xf53d2047  ! 1039: STDF_I	std	%f26, [0x0047, %r20]
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc746094  ! 1047: STX_I	stx	%r30, [%r17 + 0x0094]
	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 1052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	.word 0xf0258000  ! 1055: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198299b  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0xf53c4000  ! 1057: STDF_R	std	%f26, [%r0, %r17]
	.word 0xfe2d0000  ! 1058: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf874c000  ! 1062: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xba354000  ! 1063: ORN_R	orn 	%r21, %r0, %r29
	.word 0xf93c4000  ! 1065: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb1480000  ! 1070: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf425a101  ! 1072: STW_I	stw	%r26, [%r22 + 0x0101]
	.word 0xb8c5c000  ! 1074: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0x8194e1ec  ! 1076: WRPR_TPC_I	wrpr	%r19, 0x01ec, %tpc
	setx	data_start_0, %g1, %r17
	.word 0xbf510000  ! 1080: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf075c000  ! 1082: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x9195e09d  ! 1083: WRPR_PIL_I	wrpr	%r23, 0x009d, %pil
	.word 0xf475e073  ! 1086: STX_I	stx	%r26, [%r23 + 0x0073]
	.word 0xf82de115  ! 1087: STB_I	stb	%r28, [%r23 + 0x0115]
	.word 0xf63c0000  ! 1088: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf42cc000  ! 1089: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfc74e1b7  ! 1091: STX_I	stx	%r30, [%r19 + 0x01b7]
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1094: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfc35e1f5  ! 1095: STH_I	sth	%r30, [%r23 + 0x01f5]
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ed3  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed3, %hpstate
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c8000  ! 1109: STD_R	std	%r27, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983951  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1951, %hpstate
	.word 0xfa2da1d4  ! 1113: STB_I	stb	%r29, [%r22 + 0x01d4]
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xfa3561a8  ! 1118: STH_I	sth	%r29, [%r21 + 0x01a8]
	.word 0xfc34e0f4  ! 1122: STH_I	sth	%r30, [%r19 + 0x00f4]
	.word 0xf53d8000  ! 1123: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfd3cc000  ! 1126: STDF_R	std	%f30, [%r0, %r19]
	.word 0xfa2ce1e9  ! 1127: STB_I	stb	%r29, [%r19 + 0x01e9]
	.word 0xf22d211b  ! 1128: STB_I	stb	%r25, [%r20 + 0x011b]
	ta	T_CHANGE_HPRIV
	.word 0x81983c5b  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5b, %hpstate
	.word 0xba44c000  ! 1133: ADDC_R	addc 	%r19, %r0, %r29
	.word 0x8394601f  ! 1134: WRPR_TNPC_I	wrpr	%r17, 0x001f, %tnpc
	.word 0xfc740000  ! 1135: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xfc3d0000  ! 1137: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf8344000  ! 1139: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb7518000  ! 1140: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfe744000  ! 1142: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf03de0dd  ! 1145: STD_I	std	%r24, [%r23 + 0x00dd]
	.word 0xfd3d61c8  ! 1146: STDF_I	std	%f30, [0x01c8, %r21]
	.word 0xfb3c0000  ! 1148: STDF_R	std	%f29, [%r0, %r16]
	mov	0, %r12
	.word 0x8f932000  ! 1149: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb508000  ! 1150: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xfc35e088  ! 1152: STH_I	sth	%r30, [%r23 + 0x0088]
	.word 0xfe2da043  ! 1158: STB_I	stb	%r31, [%r22 + 0x0043]
	.word 0xb151c000  ! 1167: RDPR_TL	<illegal instruction>
	.word 0xf834c000  ! 1168: STH_R	sth	%r28, [%r19 + %r0]
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03de065  ! 1173: STD_I	std	%r24, [%r23 + 0x0065]
	.word 0xb350c000  ! 1178: RDPR_TT	<illegal instruction>
	.word 0xfe3de1d4  ! 1182: STD_I	std	%r31, [%r23 + 0x01d4]
	.word 0xfe344000  ! 1184: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf6348000  ! 1185: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbb2c9000  ! 1186: SLLX_R	sllx	%r18, %r0, %r29
	.word 0xb550c000  ! 1188: RDPR_TT	<illegal instruction>
	.word 0x85952118  ! 1190: WRPR_TSTATE_I	wrpr	%r20, 0x0118, %tstate
	.word 0xbb518000  ! 1197: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0x8d94209a  ! 1198: WRPR_PSTATE_I	wrpr	%r16, 0x009a, %pstate
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0144000  ! 1205: OR_R	or 	%r17, %r0, %r24
	.word 0xf474619b  ! 1206: STX_I	stx	%r26, [%r17 + 0x019b]
	ta	T_CHANGE_HPRIV
	.word 0x81983ac9  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac9, %hpstate
	.word 0xf235618a  ! 1209: STH_I	sth	%r25, [%r21 + 0x018a]
	.word 0xf424e124  ! 1212: STW_I	stw	%r26, [%r19 + 0x0124]
	.word 0xfe3d0000  ! 1213: STD_R	std	%r31, [%r20 + %r0]
	.word 0xf624a19b  ! 1216: STW_I	stw	%r27, [%r18 + 0x019b]
	.word 0xb28c2012  ! 1219: ANDcc_I	andcc 	%r16, 0x0012, %r25
	.word 0xf62ca058  ! 1221: STB_I	stb	%r27, [%r18 + 0x0058]
	.word 0xf225217e  ! 1223: STW_I	stw	%r25, [%r20 + 0x017e]
	.word 0xbd510000  ! 1224: RDPR_TICK	rdpr	%tick, %r30
	setx	data_start_2, %g1, %r20
	.word 0xf23c2072  ! 1238: STD_I	std	%r25, [%r16 + 0x0072]
	.word 0xf425e13f  ! 1239: STW_I	stw	%r26, [%r23 + 0x013f]
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d2082  ! 1245: STB_I	stb	%r25, [%r20 + 0x0082]
	.word 0xb9508000  ! 1246: RDPR_TSTATE	<illegal instruction>
	.word 0xb3510000  ! 1249: RDPR_TICK	<illegal instruction>
	.word 0xb0a5c000  ! 1252: SUBcc_R	subcc 	%r23, %r0, %r24
	.word 0xfc246163  ! 1253: STW_I	stw	%r30, [%r17 + 0x0163]
	.word 0xb7540000  ! 1254: RDPR_GL	<illegal instruction>
	.word 0x8595e0c4  ! 1255: WRPR_TSTATE_I	wrpr	%r23, 0x00c4, %tstate
	.word 0xfe248000  ! 1256: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf62dc000  ! 1258: STB_R	stb	%r27, [%r23 + %r0]
	.word 0x8195a041  ! 1259: WRPR_TPC_I	wrpr	%r22, 0x0041, %tpc
	mov	0, %r14
	.word 0xa193a000  ! 1260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb08de051  ! 1261: ANDcc_I	andcc 	%r23, 0x0051, %r24
	.word 0xf634a0a4  ! 1265: STH_I	sth	%r27, [%r18 + 0x00a4]
	.word 0xfe2de1a2  ! 1266: STB_I	stb	%r31, [%r23 + 0x01a2]
	.word 0xb3510000  ! 1267: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf83ca1c6  ! 1272: STD_I	std	%r28, [%r18 + 0x01c6]
	.word 0xba144000  ! 1273: OR_R	or 	%r17, %r0, %r29
	.word 0xf6348000  ! 1274: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfa7420b6  ! 1275: STX_I	stx	%r29, [%r16 + 0x00b6]
	.word 0xfe348000  ! 1277: STH_R	sth	%r31, [%r18 + %r0]
	.word 0x8194607e  ! 1279: WRPR_TPC_I	wrpr	%r17, 0x007e, %tpc
	.word 0xfe3d8000  ! 1283: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf03ca15d  ! 1284: STD_I	std	%r24, [%r18 + 0x015d]
	.word 0xf025a09a  ! 1287: STW_I	stw	%r24, [%r22 + 0x009a]
	.word 0xb445e02b  ! 1289: ADDC_I	addc 	%r23, 0x002b, %r26
	.word 0xb815e0ee  ! 1293: OR_I	or 	%r23, 0x00ee, %r28
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1296: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfa3ce106  ! 1297: STD_I	std	%r29, [%r19 + 0x0106]
	.word 0xfc3dc000  ! 1300: STD_R	std	%r30, [%r23 + %r0]
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d2115  ! 1303: STDF_I	std	%f26, [0x0115, %r20]
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82d0000  ! 1306: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xbb504000  ! 1313: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfa256174  ! 1315: STW_I	stw	%r29, [%r21 + 0x0174]
	.word 0x8d9420b1  ! 1316: WRPR_PSTATE_I	wrpr	%r16, 0x00b1, %pstate
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1325: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xb4050000  ! 1328: ADD_R	add 	%r20, %r0, %r26
	.word 0xf4248000  ! 1329: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf43d0000  ! 1330: STD_R	std	%r26, [%r20 + %r0]
	.word 0xfc3521fd  ! 1332: STH_I	sth	%r30, [%r20 + 0x01fd]
	.word 0xf63460f2  ! 1340: STH_I	sth	%r27, [%r17 + 0x00f2]
	.word 0xfa2c4000  ! 1350: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf425e00e  ! 1356: STW_I	stw	%r26, [%r23 + 0x000e]
	.word 0xbf3cc000  ! 1358: SRA_R	sra 	%r19, %r0, %r31
	.word 0xfa25e00a  ! 1360: STW_I	stw	%r29, [%r23 + 0x000a]
	.word 0xfe2da1c7  ! 1364: STB_I	stb	%r31, [%r22 + 0x01c7]
	.word 0xfa3c4000  ! 1366: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf2350000  ! 1367: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb3540000  ! 1368: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 1372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32da001  ! 1376: SLL_I	sll 	%r22, 0x0001, %r25
	.word 0xbf2da001  ! 1377: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xfd3c6101  ! 1378: STDF_I	std	%f30, [0x0101, %r17]
	.word 0xb92cd000  ! 1381: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xfa2d0000  ! 1383: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb01d4000  ! 1386: XOR_R	xor 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983853  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1853, %hpstate
	.word 0xf83c4000  ! 1389: STD_R	std	%r28, [%r17 + %r0]
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d611e  ! 1395: STB_I	stb	%r25, [%r21 + 0x011e]
	.word 0xfc2ca114  ! 1396: STB_I	stb	%r30, [%r18 + 0x0114]
	.word 0xfe25207b  ! 1397: STW_I	stw	%r31, [%r20 + 0x007b]
	.word 0xf53c8000  ! 1400: STDF_R	std	%f26, [%r0, %r18]
	.word 0xb3480000  ! 1404: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	1, %r14
	.word 0xa193a000  ! 1405: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf02de1bc  ! 1410: STB_I	stb	%r24, [%r23 + 0x01bc]
	mov	0, %r14
	.word 0xa193a000  ! 1414: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa754000  ! 1417: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf03d4000  ! 1419: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf23ca056  ! 1425: STD_I	std	%r25, [%r18 + 0x0056]
	.word 0xb93db001  ! 1426: SRAX_I	srax	%r22, 0x0001, %r28
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1434: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb8a5e0db  ! 1442: SUBcc_I	subcc 	%r23, 0x00db, %r28
	.word 0xfc74602b  ! 1443: STX_I	stx	%r30, [%r17 + 0x002b]
	.word 0xb02c6195  ! 1445: ANDN_I	andn 	%r17, 0x0195, %r24
	.word 0xb950c000  ! 1447: RDPR_TT	<illegal instruction>
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81956065  ! 1450: WRPR_TPC_I	wrpr	%r21, 0x0065, %tpc
	.word 0xbf355000  ! 1451: SRLX_R	srlx	%r21, %r0, %r31
	.word 0xb7480000  ! 1452: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf03d8000  ! 1453: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf02ca15d  ! 1456: STB_I	stb	%r24, [%r18 + 0x015d]
	.word 0xb5518000  ! 1458: RDPR_PSTATE	<illegal instruction>
	.word 0xf425e0e5  ! 1462: STW_I	stw	%r26, [%r23 + 0x00e5]
	.word 0xf474c000  ! 1463: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfe75a0d4  ! 1464: STX_I	stx	%r31, [%r22 + 0x00d4]
	.word 0xf6754000  ! 1468: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xb5480000  ! 1469: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfe3ce18a  ! 1474: STD_I	std	%r31, [%r19 + 0x018a]
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d4000  ! 1481: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf8250000  ! 1484: STW_R	stw	%r28, [%r20 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 1486: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2d4000  ! 1487: STB_R	stb	%r29, [%r21 + %r0]
	.word 0x81946014  ! 1488: WRPR_TPC_I	wrpr	%r17, 0x0014, %tpc
	.word 0x899421ab  ! 1490: WRPR_TICK_I	wrpr	%r16, 0x01ab, %tick
	.word 0xf434a143  ! 1493: STH_I	sth	%r26, [%r18 + 0x0143]
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf835a126  ! 1497: STH_I	sth	%r28, [%r22 + 0x0126]
	.word 0xf02d200e  ! 1503: STB_I	stb	%r24, [%r20 + 0x000e]
	setx	data_start_6, %g1, %r23
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94212c  ! 1515: WRPR_PSTATE_I	wrpr	%r16, 0x012c, %pstate
	.word 0xfe25c000  ! 1516: STW_R	stw	%r31, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 1519: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe250000  ! 1521: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xff3ce0b8  ! 1526: STDF_I	std	%f31, [0x00b8, %r19]
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c21b9  ! 1528: STB_I	stb	%r24, [%r16 + 0x01b9]
	.word 0xf33c60f8  ! 1529: STDF_I	std	%f25, [0x00f8, %r17]
	.word 0xb9350000  ! 1532: SRL_R	srl 	%r20, %r0, %r28
	.word 0xfe3d8000  ! 1533: STD_R	std	%r31, [%r22 + %r0]
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c61b8  ! 1537: STB_I	stb	%r29, [%r17 + 0x01b8]
	ta	T_CHANGE_HPRIV
	.word 0x81982c9b  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9b, %hpstate
	.word 0xbead4000  ! 1547: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xf6752120  ! 1548: STX_I	stx	%r27, [%r20 + 0x0120]
	.word 0xbf2d0000  ! 1549: SLL_R	sll 	%r20, %r0, %r31
	.word 0x85956193  ! 1553: WRPR_TSTATE_I	wrpr	%r21, 0x0193, %tstate
	.word 0xb62d0000  ! 1558: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xf73d8000  ! 1560: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf93cc000  ! 1561: STDF_R	std	%f28, [%r0, %r19]
	.word 0xb7342001  ! 1566: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xf63de0bf  ! 1567: STD_I	std	%r27, [%r23 + 0x00bf]
	ta	T_CHANGE_HPRIV
	.word 0x81982f1b  ! 1569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1b, %hpstate
	.word 0xb4bce0eb  ! 1570: XNORcc_I	xnorcc 	%r19, 0x00eb, %r26
	.word 0xbaa5603c  ! 1571: SUBcc_I	subcc 	%r21, 0x003c, %r29
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4240000  ! 1578: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf2348000  ! 1579: STH_R	sth	%r25, [%r18 + %r0]
	.word 0x8994e01c  ! 1581: WRPR_TICK_I	wrpr	%r19, 0x001c, %tick
	.word 0xfa2461d6  ! 1589: STW_I	stw	%r29, [%r17 + 0x01d6]
	.word 0xfd3d20c1  ! 1594: STDF_I	std	%f30, [0x00c1, %r20]
	.word 0xf8340000  ! 1595: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xbf500000  ! 1596: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf23da126  ! 1598: STD_I	std	%r25, [%r22 + 0x0126]
	.word 0xf475215d  ! 1599: STX_I	stx	%r26, [%r20 + 0x015d]
	.word 0xfe75a167  ! 1606: STX_I	stx	%r31, [%r22 + 0x0167]
	.word 0xf93cc000  ! 1607: STDF_R	std	%f28, [%r0, %r19]
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 1612: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 1615: RDPR_TL	<illegal instruction>
	.word 0xf33de1f3  ! 1616: STDF_I	std	%f25, [0x01f3, %r23]
	.word 0xb7500000  ! 1621: RDPR_TPC	<illegal instruction>
	.word 0x85952058  ! 1622: WRPR_TSTATE_I	wrpr	%r20, 0x0058, %tstate
	.word 0xfe3c4000  ! 1625: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf8258000  ! 1628: STW_R	stw	%r28, [%r22 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 1630: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe2460bc  ! 1631: STW_I	stw	%r31, [%r17 + 0x00bc]
	.word 0xb88c4000  ! 1634: ANDcc_R	andcc 	%r17, %r0, %r28
	.word 0xf22d4000  ! 1637: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf43c0000  ! 1638: STD_R	std	%r26, [%r16 + %r0]
	.word 0xfb3d4000  ! 1641: STDF_R	std	%f29, [%r0, %r21]
	.word 0x899521b2  ! 1642: WRPR_TICK_I	wrpr	%r20, 0x01b2, %tick
	.word 0xf67460fa  ! 1643: STX_I	stx	%r27, [%r17 + 0x00fa]
	.word 0xf02dc000  ! 1644: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf6352179  ! 1645: STH_I	sth	%r27, [%r20 + 0x0179]
	.word 0xf73dc000  ! 1648: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfc254000  ! 1649: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf73de17b  ! 1652: STDF_I	std	%f27, [0x017b, %r23]
	.word 0xf62d0000  ! 1654: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf0746102  ! 1655: STX_I	stx	%r24, [%r17 + 0x0102]
	.word 0xf4250000  ! 1656: STW_R	stw	%r26, [%r20 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 1659: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd540000  ! 1660: RDPR_GL	rdpr	%-, %r30
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1666: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 1670: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf93c61a5  ! 1673: STDF_I	std	%f28, [0x01a5, %r17]
	.word 0x8594a184  ! 1675: WRPR_TSTATE_I	wrpr	%r18, 0x0184, %tstate
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3da18d  ! 1677: STDF_I	std	%f30, [0x018d, %r22]
	.word 0xfc2c601c  ! 1680: STB_I	stb	%r30, [%r17 + 0x001c]
	.word 0xb81d8000  ! 1681: XOR_R	xor 	%r22, %r0, %r28
	.word 0xf4350000  ! 1683: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xb92d0000  ! 1688: SLL_R	sll 	%r20, %r0, %r28
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	.word 0xb4258000  ! 1693: SUB_R	sub 	%r22, %r0, %r26
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3d0000  ! 1695: STDF_R	std	%f30, [%r0, %r20]
	mov	2, %r14
	.word 0xa193a000  ! 1696: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb2dd000  ! 1699: SLLX_R	sllx	%r23, %r0, %r29
	.word 0xf224a13f  ! 1700: STW_I	stw	%r25, [%r18 + 0x013f]
	.word 0x8d95e0a9  ! 1701: WRPR_PSTATE_I	wrpr	%r23, 0x00a9, %pstate
	.word 0xf0348000  ! 1702: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xbf480000  ! 1704: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf62c214e  ! 1707: STB_I	stb	%r27, [%r16 + 0x014e]
	.word 0x8d95a175  ! 1708: WRPR_PSTATE_I	wrpr	%r22, 0x0175, %pstate
	.word 0xf02c4000  ! 1711: STB_R	stb	%r24, [%r17 + %r0]
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf435616d  ! 1719: STH_I	sth	%r26, [%r21 + 0x016d]
	.word 0xf275a121  ! 1720: STX_I	stx	%r25, [%r22 + 0x0121]
	.word 0xbeb4a056  ! 1721: SUBCcc_I	orncc 	%r18, 0x0056, %r31
	.word 0xfe248000  ! 1736: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xb6058000  ! 1737: ADD_R	add 	%r22, %r0, %r27
	.word 0xf035a06e  ! 1742: STH_I	sth	%r24, [%r22 + 0x006e]
	.word 0xf62560ae  ! 1743: STW_I	stw	%r27, [%r21 + 0x00ae]
	.word 0xf4244000  ! 1744: STW_R	stw	%r26, [%r17 + %r0]
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 1748: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfe2c4000  ! 1752: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xbf2c4000  ! 1754: SLL_R	sll 	%r17, %r0, %r31
	.word 0xb9500000  ! 1756: RDPR_TPC	<illegal instruction>
	.word 0xbf349000  ! 1759: SRLX_R	srlx	%r18, %r0, %r31
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e073  ! 1761: WRPR_TICK_I	wrpr	%r23, 0x0073, %tick
	.word 0xf824c000  ! 1765: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfa74e143  ! 1767: STX_I	stx	%r29, [%r19 + 0x0143]
	.word 0xf22d0000  ! 1768: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf0254000  ! 1771: STW_R	stw	%r24, [%r21 + %r0]
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xfa3c0000  ! 1774: STD_R	std	%r29, [%r16 + %r0]
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32d4000  ! 1783: SLL_R	sll 	%r21, %r0, %r25
	.word 0x8195e135  ! 1784: WRPR_TPC_I	wrpr	%r23, 0x0135, %tpc
	.word 0xf0248000  ! 1786: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xb33ca001  ! 1790: SRA_I	sra 	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 1791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xfc340000  ! 1792: STH_R	sth	%r30, [%r16 + %r0]
	.word 0x839560b3  ! 1795: WRPR_TNPC_I	wrpr	%r21, 0x00b3, %tnpc
	.word 0xf435c000  ! 1796: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfc75a055  ! 1800: STX_I	stx	%r30, [%r22 + 0x0055]
	.word 0xfc750000  ! 1801: STX_R	stx	%r30, [%r20 + %r0]
	.word 0x89942092  ! 1803: WRPR_TICK_I	wrpr	%r16, 0x0092, %tick
	.word 0xb9500000  ! 1806: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfb3ca033  ! 1807: STDF_I	std	%f29, [0x0033, %r18]
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 1808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0x81942026  ! 1812: WRPR_TPC_I	wrpr	%r16, 0x0026, %tpc
	.word 0xf62c2040  ! 1813: STB_I	stb	%r27, [%r16 + 0x0040]
	.word 0xfc344000  ! 1816: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbaa5e081  ! 1817: SUBcc_I	subcc 	%r23, 0x0081, %r29
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xf93d4000  ! 1820: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf875a097  ! 1822: STX_I	stx	%r28, [%r22 + 0x0097]
	setx	data_start_5, %g1, %r22
	.word 0xfc3d8000  ! 1825: STD_R	std	%r30, [%r22 + %r0]
	.word 0x89956018  ! 1826: WRPR_TICK_I	wrpr	%r21, 0x0018, %tick
	.word 0xbe150000  ! 1828: OR_R	or 	%r20, %r0, %r31
	.word 0x899520ac  ! 1829: WRPR_TICK_I	wrpr	%r20, 0x00ac, %tick
	.word 0xfc2c0000  ! 1830: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfc2de0b3  ! 1834: STB_I	stb	%r30, [%r23 + 0x00b3]
	.word 0xfe2d4000  ! 1835: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xb5504000  ! 1836: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfd3cc000  ! 1838: STDF_R	std	%f30, [%r0, %r19]
	mov	0, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xff3c2055  ! 1845: STDF_I	std	%f31, [0x0055, %r16]
	.word 0xbf51c000  ! 1846: RDPR_TL	rdpr	%tl, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf23c0000  ! 1850: STD_R	std	%r25, [%r16 + %r0]
	.word 0xb6ac0000  ! 1853: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xf4756102  ! 1859: STX_I	stx	%r26, [%r21 + 0x0102]
	.word 0xbf51c000  ! 1860: RDPR_TL	<illegal instruction>
	.word 0xf93ca153  ! 1861: STDF_I	std	%f28, [0x0153, %r18]
	.word 0xf83c2083  ! 1864: STD_I	std	%r28, [%r16 + 0x0083]
	mov	1, %r14
	.word 0xa193a000  ! 1869: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03c8000  ! 1870: STD_R	std	%r24, [%r18 + %r0]
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 1875: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfa74a1a1  ! 1879: STX_I	stx	%r29, [%r18 + 0x01a1]
	.word 0xba3c6027  ! 1880: XNOR_I	xnor 	%r17, 0x0027, %r29
	.word 0xff3de19f  ! 1886: STDF_I	std	%f31, [0x019f, %r23]
	.word 0xf4248000  ! 1887: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf0342107  ! 1892: STH_I	sth	%r24, [%r16 + 0x0107]
	.word 0xbb520000  ! 1893: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf83520c8  ! 1894: STH_I	sth	%r28, [%r20 + 0x00c8]
	.word 0xb150c000  ! 1895: RDPR_TT	<illegal instruction>
	.word 0xfc3c6133  ! 1896: STD_I	std	%r30, [%r17 + 0x0133]
	.word 0xf425e065  ! 1900: STW_I	stw	%r26, [%r23 + 0x0065]
	.word 0xfe3d6158  ! 1906: STD_I	std	%r31, [%r21 + 0x0158]
	.word 0xf13c8000  ! 1910: STDF_R	std	%f24, [%r0, %r18]
	.word 0xbf540000  ! 1911: RDPR_GL	<illegal instruction>
	.word 0xb13dc000  ! 1913: SRA_R	sra 	%r23, %r0, %r24
	.word 0xf4358000  ! 1915: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfb3dc000  ! 1919: STDF_R	std	%f29, [%r0, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 1920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	.word 0xb7508000  ! 1921: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb1480000  ! 1925: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb5480000  ! 1930: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf474e05a  ! 1937: STX_I	stx	%r26, [%r19 + 0x005a]
	.word 0xfa3d8000  ! 1938: STD_R	std	%r29, [%r22 + %r0]
	.word 0xb9518000  ! 1939: RDPR_PSTATE	<illegal instruction>
	.word 0xf834c000  ! 1941: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfe2d209d  ! 1942: STB_I	stb	%r31, [%r20 + 0x009d]
	.word 0xf674e0ca  ! 1943: STX_I	stx	%r27, [%r19 + 0x00ca]
	.word 0x8795e134  ! 1945: WRPR_TT_I	wrpr	%r23, 0x0134, %tt
	.word 0xb0c5c000  ! 1949: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xf43ca083  ! 1953: STD_I	std	%r26, [%r18 + 0x0083]
	.word 0xf03c8000  ! 1955: STD_R	std	%r24, [%r18 + %r0]
	.word 0xf4240000  ! 1960: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb5508000  ! 1963: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	0x2033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc34a07b  ! 1965: ORN_I	orn 	%r18, 0x007b, %r30
	.word 0xf42520d0  ! 1966: STW_I	stw	%r26, [%r20 + 0x00d0]
	.word 0xf93c8000  ! 1967: STDF_R	std	%f28, [%r0, %r18]
	.word 0xfc242086  ! 1971: STW_I	stw	%r30, [%r16 + 0x0086]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf635a0a8  ! 1979: STH_I	sth	%r27, [%r22 + 0x00a8]
	.word 0xf42ca14b  ! 1981: STB_I	stb	%r26, [%r18 + 0x014b]
	.word 0x89946135  ! 1984: WRPR_TICK_I	wrpr	%r17, 0x0135, %tick
	.word 0xfe740000  ! 1986: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xb9641800  ! 1987: MOVcc_R	<illegal instruction>
	.word 0xb8c40000  ! 1988: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xf02cc000  ! 1990: STB_R	stb	%r24, [%r19 + %r0]
	.word 0x879561b9  ! 1991: WRPR_TT_I	wrpr	%r21, 0x01b9, %tt
	.word 0xf42cc000  ! 1992: STB_R	stb	%r26, [%r19 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 1993: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf624e1ca  ! 1995: STW_I	stw	%r27, [%r19 + 0x01ca]
	.word 0xbaad6047  ! 2002: ANDNcc_I	andncc 	%r21, 0x0047, %r29
	.word 0x8d9461ea  ! 2003: WRPR_PSTATE_I	wrpr	%r17, 0x01ea, %pstate
	.word 0xf875a00d  ! 2006: STX_I	stx	%r28, [%r22 + 0x000d]
	.word 0xfb3d4000  ! 2007: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb73dc000  ! 2008: SRA_R	sra 	%r23, %r0, %r27
	.word 0xfc3cc000  ! 2010: STD_R	std	%r30, [%r19 + %r0]
	setx	0x112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2240000  ! 2012: SUB_R	sub 	%r16, %r0, %r25
	.word 0x8794a154  ! 2013: WRPR_TT_I	wrpr	%r18, 0x0154, %tt
	.word 0xf2754000  ! 2017: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfb3c2070  ! 2018: STDF_I	std	%f29, [0x0070, %r16]
	.word 0x8795e0ea  ! 2021: WRPR_TT_I	wrpr	%r23, 0x00ea, %tt
	.word 0x9194a064  ! 2023: WRPR_PIL_I	wrpr	%r18, 0x0064, %pil
	.word 0xf62d8000  ! 2024: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfb3d2083  ! 2028: STDF_I	std	%f29, [0x0083, %r20]
	.word 0xf33ce0c8  ! 2029: STDF_I	std	%f25, [0x00c8, %r19]
	.word 0xb350c000  ! 2031: RDPR_TT	rdpr	%tt, %r25
	.word 0xbe444000  ! 2035: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xf874c000  ! 2038: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb7480000  ! 2040: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 2044: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf4754000  ! 2046: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfc248000  ! 2049: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x81956171  ! 2051: WRPR_TPC_I	wrpr	%r21, 0x0171, %tpc
	.word 0xf8746011  ! 2053: STX_I	stx	%r28, [%r17 + 0x0011]
	.word 0xf2248000  ! 2056: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xfe744000  ! 2063: STX_R	stx	%r31, [%r17 + %r0]
	.word 0x839561cb  ! 2065: WRPR_TNPC_I	wrpr	%r21, 0x01cb, %tnpc
	.word 0xb20c60e9  ! 2066: AND_I	and 	%r17, 0x00e9, %r25
	.word 0xfe2cc000  ! 2067: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xbac44000  ! 2068: ADDCcc_R	addccc 	%r17, %r0, %r29
	.word 0x8594207c  ! 2070: WRPR_TSTATE_I	wrpr	%r16, 0x007c, %tstate
	.word 0x8594606f  ! 2071: WRPR_TSTATE_I	wrpr	%r17, 0x006f, %tstate
	.word 0xfc25c000  ! 2077: STW_R	stw	%r30, [%r23 + %r0]
	setx	data_start_0, %g1, %r20
	.word 0xf73ce0ab  ! 2081: STDF_I	std	%f27, [0x00ab, %r19]
	.word 0xf034a116  ! 2083: STH_I	sth	%r24, [%r18 + 0x0116]
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c4000  ! 2087: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfe242046  ! 2089: STW_I	stw	%r31, [%r16 + 0x0046]
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	.word 0xb42cc000  ! 2095: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xb150c000  ! 2098: RDPR_TT	rdpr	%tt, %r24
	.word 0xf63cc000  ! 2103: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfc3520db  ! 2104: STH_I	sth	%r30, [%r20 + 0x00db]
	.word 0xb77d8400  ! 2105: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb9520000  ! 2106: RDPR_PIL	<illegal instruction>
	.word 0xf0250000  ! 2111: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xb295a10a  ! 2113: ORcc_I	orcc 	%r22, 0x010a, %r25
	.word 0xf93cc000  ! 2114: STDF_R	std	%f28, [%r0, %r19]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba34a1f0  ! 2116: SUBC_I	orn 	%r18, 0x01f0, %r29
	.word 0xfe24c000  ! 2120: STW_R	stw	%r31, [%r19 + %r0]
	.word 0x8795a1c5  ! 2123: WRPR_TT_I	wrpr	%r22, 0x01c5, %tt
	.word 0xf62c4000  ! 2127: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf82c4000  ! 2128: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf63d6026  ! 2129: STD_I	std	%r27, [%r21 + 0x0026]
	.word 0xbb3d9000  ! 2131: SRAX_R	srax	%r22, %r0, %r29
	.word 0xf275c000  ! 2132: STX_R	stx	%r25, [%r23 + %r0]
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf87460e8  ! 2135: STX_I	stx	%r28, [%r17 + 0x00e8]
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 2148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 2150: STX_R	stx	%r24, [%r22 + %r0]
	.word 0x8995606c  ! 2152: WRPR_TICK_I	wrpr	%r21, 0x006c, %tick
	.word 0xb13cf001  ! 2153: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xfb3de1d4  ! 2158: STDF_I	std	%f29, [0x01d4, %r23]
	.word 0x8995602e  ! 2160: WRPR_TICK_I	wrpr	%r21, 0x002e, %tick
	.word 0xfe350000  ! 2163: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xb5540000  ! 2164: RDPR_GL	rdpr	%-, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc3dc000  ! 2167: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf02ce1b4  ! 2170: STB_I	stb	%r24, [%r19 + 0x01b4]
	.word 0xbb510000  ! 2178: RDPR_TICK	<illegal instruction>
	.word 0xb5500000  ! 2180: RDPR_TPC	<illegal instruction>
	.word 0xfc2de187  ! 2182: STB_I	stb	%r30, [%r23 + 0x0187]
	.word 0x8595e1fe  ! 2185: WRPR_TSTATE_I	wrpr	%r23, 0x01fe, %tstate
	.word 0x85956075  ! 2186: WRPR_TSTATE_I	wrpr	%r21, 0x0075, %tstate
	.word 0xf6350000  ! 2188: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x8d94614a  ! 2192: WRPR_PSTATE_I	wrpr	%r17, 0x014a, %pstate
	.word 0xf024a031  ! 2193: STW_I	stw	%r24, [%r18 + 0x0031]
	.word 0xb12c6001  ! 2194: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0x8594a15d  ! 2195: WRPR_TSTATE_I	wrpr	%r18, 0x015d, %tstate
	.word 0xf33de088  ! 2198: STDF_I	std	%f25, [0x0088, %r23]
	.word 0xfe3cc000  ! 2200: STD_R	std	%r31, [%r19 + %r0]
	.word 0xf42ce015  ! 2202: STB_I	stb	%r26, [%r19 + 0x0015]
	.word 0xb20ca1ac  ! 2203: AND_I	and 	%r18, 0x01ac, %r25
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 2211: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf8744000  ! 2214: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb2a4c000  ! 2215: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xf03dc000  ! 2219: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf025611f  ! 2220: STW_I	stw	%r24, [%r21 + 0x011f]
	.word 0xbf641800  ! 2221: MOVcc_R	<illegal instruction>
	.word 0xb751c000  ! 2223: RDPR_TL	rdpr	%tl, %r27
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ad8000  ! 2226: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xb3359000  ! 2227: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xf22de1dc  ! 2229: STB_I	stb	%r25, [%r23 + 0x01dc]
	.word 0xf33cc000  ! 2232: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf42d604f  ! 2233: STB_I	stb	%r26, [%r21 + 0x004f]
	.word 0xfa25a173  ! 2235: STW_I	stw	%r29, [%r22 + 0x0173]
	.word 0xbf504000  ! 2238: RDPR_TNPC	<illegal instruction>
	.word 0xfa2c8000  ! 2239: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf82ca1cf  ! 2240: STB_I	stb	%r28, [%r18 + 0x01cf]
	.word 0x8995e1cb  ! 2241: WRPR_TICK_I	wrpr	%r23, 0x01cb, %tick
	.word 0xf03c0000  ! 2242: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbd508000  ! 2245: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf4758000  ! 2247: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfc2de119  ! 2249: STB_I	stb	%r30, [%r23 + 0x0119]
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0x8995a116  ! 2254: WRPR_TICK_I	wrpr	%r22, 0x0116, %tick
	.word 0xfa352025  ! 2255: STH_I	sth	%r29, [%r20 + 0x0025]
	.word 0xb3518000  ! 2257: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0x87952024  ! 2259: WRPR_TT_I	wrpr	%r20, 0x0024, %tt
	mov	0, %r14
	.word 0xa193a000  ! 2260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb245c000  ! 2264: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xf0348000  ! 2270: STH_R	sth	%r24, [%r18 + %r0]
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2275: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfd3c2194  ! 2276: STDF_I	std	%f30, [0x0194, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x819829d3  ! 2277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d3, %hpstate
	.word 0xf025608a  ! 2281: STW_I	stw	%r24, [%r21 + 0x008a]
	.word 0xba14a040  ! 2282: OR_I	or 	%r18, 0x0040, %r29
	.word 0xf074a10c  ! 2284: STX_I	stx	%r24, [%r18 + 0x010c]
	setx	0x1022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2461df  ! 2286: STW_I	stw	%r30, [%r17 + 0x01df]
	ta	T_CHANGE_HPRIV
	.word 0x81983843  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1843, %hpstate
	.word 0xf93c6140  ! 2290: STDF_I	std	%f28, [0x0140, %r17]
	.word 0xb04460e7  ! 2292: ADDC_I	addc 	%r17, 0x00e7, %r24
	setx	data_start_2, %g1, %r19
	.word 0xfc74c000  ! 2295: STX_R	stx	%r30, [%r19 + %r0]
	.word 0x87956179  ! 2299: WRPR_TT_I	wrpr	%r21, 0x0179, %tt
	.word 0xbd34d000  ! 2300: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xfa3c4000  ! 2301: STD_R	std	%r29, [%r17 + %r0]
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8995605f  ! 2310: WRPR_TICK_I	wrpr	%r21, 0x005f, %tick
	.word 0xf22d0000  ! 2313: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf8248000  ! 2316: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xfc3c6106  ! 2322: STD_I	std	%r30, [%r17 + 0x0106]
	.word 0xf53d4000  ! 2329: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf33de0bf  ! 2331: STDF_I	std	%f25, [0x00bf, %r23]
	.word 0xbf510000  ! 2332: RDPR_TICK	rdpr	%tick, %r31
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53ce180  ! 2337: STDF_I	std	%f26, [0x0180, %r19]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2de151  ! 2340: STB_I	stb	%r31, [%r23 + 0x0151]
	.word 0xb7520000  ! 2341: RDPR_PIL	<illegal instruction>
	.word 0xb404c000  ! 2345: ADD_R	add 	%r19, %r0, %r26
	.word 0xf62560c2  ! 2349: STW_I	stw	%r27, [%r21 + 0x00c2]
	.word 0xf33da0d9  ! 2350: STDF_I	std	%f25, [0x00d9, %r22]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0, %r12
	.word 0x8f932000  ! 2357: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe354000  ! 2359: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xff3c4000  ! 2363: STDF_R	std	%f31, [%r0, %r17]
	.word 0xfb3c617f  ! 2364: STDF_I	std	%f29, [0x017f, %r17]
	ta	T_CHANGE_HPRIV
	.word 0x819839db  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19db, %hpstate
	.word 0xfe3420f1  ! 2367: STH_I	sth	%r31, [%r16 + 0x00f1]
	.word 0xb5508000  ! 2369: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x89942102  ! 2373: WRPR_TICK_I	wrpr	%r16, 0x0102, %tick
	.word 0xbf50c000  ! 2376: RDPR_TT	rdpr	%tt, %r31
	.word 0xfc24609f  ! 2377: STW_I	stw	%r30, [%r17 + 0x009f]
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a49  ! 2381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a49, %hpstate
	.word 0xfc740000  ! 2383: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf6254000  ! 2386: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfb3c0000  ! 2387: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf6748000  ! 2388: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xb0944000  ! 2391: ORcc_R	orcc 	%r17, %r0, %r24
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3cc000  ! 2399: STD_R	std	%r30, [%r19 + %r0]
	.word 0xb2bda194  ! 2400: XNORcc_I	xnorcc 	%r22, 0x0194, %r25
	.word 0x8995218f  ! 2404: WRPR_TICK_I	wrpr	%r20, 0x018f, %tick
	.word 0xfe354000  ! 2405: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xb7518000  ! 2407: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf03cc000  ! 2408: STD_R	std	%r24, [%r19 + %r0]
	.word 0xb2b50000  ! 2409: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xfe2de10e  ! 2411: STB_I	stb	%r31, [%r23 + 0x010e]
	.word 0xb2058000  ! 2413: ADD_R	add 	%r22, %r0, %r25
	.word 0xb6b44000  ! 2415: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xfd3d20ec  ! 2416: STDF_I	std	%f30, [0x00ec, %r20]
	.word 0xf93dc000  ! 2417: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb750c000  ! 2420: RDPR_TT	<illegal instruction>
	.word 0x8195a136  ! 2422: WRPR_TPC_I	wrpr	%r22, 0x0136, %tpc
	.word 0xb6bdc000  ! 2424: XNORcc_R	xnorcc 	%r23, %r0, %r27
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 2427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r19
	.word 0xfe2ce0f3  ! 2432: STB_I	stb	%r31, [%r19 + 0x00f3]
	.word 0xf62c20f2  ! 2433: STB_I	stb	%r27, [%r16 + 0x00f2]
	.word 0xb21cc000  ! 2435: XOR_R	xor 	%r19, %r0, %r25
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2441: RDPR_PIL	rdpr	%pil, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf520000  ! 2445: RDPR_PIL	<illegal instruction>
	.word 0x8d9460c6  ! 2447: WRPR_PSTATE_I	wrpr	%r17, 0x00c6, %pstate
	.word 0xf73c4000  ! 2448: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf42ca03f  ! 2455: STB_I	stb	%r26, [%r18 + 0x003f]
	.word 0xfe3c2049  ! 2456: STD_I	std	%r31, [%r16 + 0x0049]
	.word 0xfe250000  ! 2458: STW_R	stw	%r31, [%r20 + %r0]
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 2460: STB_R	stb	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819839cb  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19cb, %hpstate
	.word 0xfa2561a3  ! 2466: STW_I	stw	%r29, [%r21 + 0x01a3]
	.word 0xbd51c000  ! 2467: RDPR_TL	rdpr	%tl, %r30
	.word 0xf22d8000  ! 2469: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf8350000  ! 2471: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfc246089  ! 2476: STW_I	stw	%r30, [%r17 + 0x0089]
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 2480: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf63da04f  ! 2481: STD_I	std	%r27, [%r22 + 0x004f]
	.word 0xfe240000  ! 2487: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf02d0000  ! 2488: STB_R	stb	%r24, [%r20 + %r0]
	setx	data_start_6, %g1, %r16
	.word 0xf6348000  ! 2493: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xba95200f  ! 2494: ORcc_I	orcc 	%r20, 0x000f, %r29
	.word 0xfe350000  ! 2495: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xbb540000  ! 2502: RDPR_GL	<illegal instruction>
	.word 0xf435a0a2  ! 2503: STH_I	sth	%r26, [%r22 + 0x00a2]
	.word 0xbd508000  ! 2507: RDPR_TSTATE	<illegal instruction>
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2512: RDPR_TL	<illegal instruction>
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 2516: RDPR_TT	<illegal instruction>
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 2521: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xb5518000  ! 2523: RDPR_PSTATE	<illegal instruction>
	.word 0xfa2521dd  ! 2524: STW_I	stw	%r29, [%r20 + 0x01dd]
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 2539: RDPR_GL	<illegal instruction>
	.word 0xfe3c4000  ! 2541: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf23d8000  ! 2544: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf425e1d2  ! 2545: STW_I	stw	%r26, [%r23 + 0x01d2]
	.word 0xb8346141  ! 2546: SUBC_I	orn 	%r17, 0x0141, %r28
	.word 0xfc2d0000  ! 2547: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf275a141  ! 2549: STX_I	stx	%r25, [%r22 + 0x0141]
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 2554: RDPR_GL	<illegal instruction>
	.word 0x8994209e  ! 2556: WRPR_TICK_I	wrpr	%r16, 0x009e, %tick
	.word 0x9194a02f  ! 2557: WRPR_PIL_I	wrpr	%r18, 0x002f, %pil
	.word 0x879420ca  ! 2560: WRPR_TT_I	wrpr	%r16, 0x00ca, %tt
	setx	data_start_4, %g1, %r18
	.word 0xf63cc000  ! 2564: STD_R	std	%r27, [%r19 + %r0]
	setx	data_start_4, %g1, %r16
	.word 0xfc2da1c0  ! 2567: STB_I	stb	%r30, [%r22 + 0x01c0]
	.word 0xfe2c61c5  ! 2569: STB_I	stb	%r31, [%r17 + 0x01c5]
	setx	data_start_3, %g1, %r17
	.word 0xf53d8000  ! 2572: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf02ce1ad  ! 2576: STB_I	stb	%r24, [%r19 + 0x01ad]
	.word 0xfc758000  ! 2578: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfb3c8000  ! 2579: STDF_R	std	%f29, [%r0, %r18]
	.word 0xfe7561d9  ! 2582: STX_I	stx	%r31, [%r21 + 0x01d9]
	.word 0xf62d6195  ! 2583: STB_I	stb	%r27, [%r21 + 0x0195]
	.word 0xfe24c000  ! 2588: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe3d0000  ! 2589: STD_R	std	%r31, [%r20 + %r0]
	.word 0xfc2c20d7  ! 2592: STB_I	stb	%r30, [%r16 + 0x00d7]
	setx	0x30226, %g1, %o0
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
	.word 0x8595e148  ! 2599: WRPR_TSTATE_I	wrpr	%r23, 0x0148, %tstate
	.word 0x9195e169  ! 2602: WRPR_PIL_I	wrpr	%r23, 0x0169, %pil
	.word 0xfc2dc000  ! 2603: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf6254000  ! 2604: STW_R	stw	%r27, [%r21 + %r0]
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 2612: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20230, %g1, %o0
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
	.word 0x85956059  ! 2634: WRPR_TSTATE_I	wrpr	%r21, 0x0059, %tstate
	.word 0xf13c4000  ! 2638: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf23c8000  ! 2639: STD_R	std	%r25, [%r18 + %r0]
	.word 0x919520d5  ! 2642: WRPR_PIL_I	wrpr	%r20, 0x00d5, %pil
	.word 0xbf508000  ! 2647: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf0348000  ! 2649: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb5504000  ! 2651: RDPR_TNPC	<illegal instruction>
	.word 0xfb3c4000  ! 2652: STDF_R	std	%f29, [%r0, %r17]
	.word 0xfa34e14d  ! 2654: STH_I	sth	%r29, [%r19 + 0x014d]
	.word 0xbb520000  ! 2657: RDPR_PIL	<illegal instruction>
	.word 0xf8348000  ! 2658: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xbab5a1f4  ! 2659: SUBCcc_I	orncc 	%r22, 0x01f4, %r29
	.word 0x8595e1e0  ! 2660: WRPR_TSTATE_I	wrpr	%r23, 0x01e0, %tstate
	.word 0xf83da15f  ! 2661: STD_I	std	%r28, [%r22 + 0x015f]
	mov	1, %r14
	.word 0xa193a000  ! 2668: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 2670: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe258000  ! 2674: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xb950c000  ! 2678: RDPR_TT	rdpr	%tt, %r28
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62de0ef  ! 2687: STB_I	stb	%r27, [%r23 + 0x00ef]
	.word 0x879560ef  ! 2689: WRPR_TT_I	wrpr	%r21, 0x00ef, %tt
	.word 0xfa75c000  ! 2692: STX_R	stx	%r29, [%r23 + %r0]
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 2697: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb4350000  ! 2701: ORN_R	orn 	%r20, %r0, %r26
	.word 0xb9508000  ! 2703: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2705: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c0000  ! 2709: STD_R	std	%r31, [%r16 + %r0]
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 2712: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x89946051  ! 2713: WRPR_TICK_I	wrpr	%r17, 0x0051, %tick
	.word 0xb32db001  ! 2716: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xf4246165  ! 2720: STW_I	stw	%r26, [%r17 + 0x0165]
	.word 0xf82d8000  ! 2723: STB_R	stb	%r28, [%r22 + %r0]
	setx	0x3002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594213d  ! 2726: WRPR_TSTATE_I	wrpr	%r16, 0x013d, %tstate
	.word 0xfe3de051  ! 2727: STD_I	std	%r31, [%r23 + 0x0051]
	.word 0xb3504000  ! 2728: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xbea58000  ! 2733: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xf0758000  ! 2735: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xbf504000  ! 2744: RDPR_TNPC	<illegal instruction>
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7520000  ! 2754: RDPR_PIL	<illegal instruction>
	.word 0xf47521bf  ! 2755: STX_I	stx	%r26, [%r20 + 0x01bf]
	.word 0xf93d4000  ! 2756: STDF_R	std	%f28, [%r0, %r21]
	.word 0xfc2ce083  ! 2757: STB_I	stb	%r30, [%r19 + 0x0083]
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c0000  ! 2759: STB_R	stb	%r31, [%r16 + %r0]
	.word 0x919520eb  ! 2760: WRPR_PIL_I	wrpr	%r20, 0x00eb, %pil
	.word 0xb5508000  ! 2763: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb2ad4000  ! 2771: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xb1480000  ! 2772: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_5, %g1, %r17
	.word 0xfe248000  ! 2779: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfd3d61d2  ! 2780: STDF_I	std	%f30, [0x01d2, %r21]
	.word 0x8d94a15f  ! 2783: WRPR_PSTATE_I	wrpr	%r18, 0x015f, %pstate
	.word 0xf27460f3  ! 2785: STX_I	stx	%r25, [%r17 + 0x00f3]
	.word 0xfe248000  ! 2789: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf53c6054  ! 2790: STDF_I	std	%f26, [0x0054, %r17]
	.word 0xf22ce111  ! 2799: STB_I	stb	%r25, [%r19 + 0x0111]
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r22
	.word 0xfe35c000  ! 2806: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xbf508000  ! 2809: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfc242097  ! 2810: STW_I	stw	%r30, [%r16 + 0x0097]
	.word 0xfc7421a7  ! 2812: STX_I	stx	%r30, [%r16 + 0x01a7]
	.word 0xfe3d4000  ! 2815: STD_R	std	%r31, [%r21 + %r0]
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3d4000  ! 2826: STDF_R	std	%f30, [%r0, %r21]
	.word 0xfc2de084  ! 2827: STB_I	stb	%r30, [%r23 + 0x0084]
	setx	data_start_6, %g1, %r21
	.word 0xf474c000  ! 2829: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xbb510000  ! 2831: RDPR_TICK	<illegal instruction>
	.word 0xf8758000  ! 2832: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x8395a066  ! 2835: WRPR_TNPC_I	wrpr	%r22, 0x0066, %tnpc
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c600b  ! 2840: STDF_I	std	%f24, [0x000b, %r17]
	mov	0, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8195a069  ! 2843: WRPR_TPC_I	wrpr	%r22, 0x0069, %tpc
	.word 0xb551c000  ! 2844: RDPR_TL	rdpr	%tl, %r26
	.word 0xfa75c000  ! 2847: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xbf518000  ! 2848: RDPR_PSTATE	<illegal instruction>
	.word 0xbd510000  ! 2851: RDPR_TICK	<illegal instruction>
	.word 0xfa758000  ! 2852: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xbd3c9000  ! 2853: SRAX_R	srax	%r18, %r0, %r30
	.word 0xf4752183  ! 2860: STX_I	stx	%r26, [%r20 + 0x0183]
	.word 0xfe2de0d6  ! 2864: STB_I	stb	%r31, [%r23 + 0x00d6]
	.word 0xf625c000  ! 2865: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xfa2c4000  ! 2872: STB_R	stb	%r29, [%r17 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 2874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb2b4e06e  ! 2877: SUBCcc_I	orncc 	%r19, 0x006e, %r25
	.word 0xff3cc000  ! 2880: STDF_R	std	%f31, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba4421fd  ! 2891: ADDC_I	addc 	%r16, 0x01fd, %r29
	.word 0x8394e002  ! 2893: WRPR_TNPC_I	wrpr	%r19, 0x0002, %tnpc
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d610f  ! 2900: STB_I	stb	%r27, [%r21 + 0x010f]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74e00d  ! 2903: STX_I	stx	%r29, [%r19 + 0x000d]
	.word 0xfe74c000  ! 2906: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf53d0000  ! 2907: STDF_R	std	%f26, [%r0, %r20]
	.word 0xbb51c000  ! 2910: RDPR_TL	rdpr	%tl, %r29
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 2915: RDPR_PSTATE	<illegal instruction>
	.word 0xbb51c000  ! 2916: RDPR_TL	<illegal instruction>
	.word 0xf435c000  ! 2923: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf8758000  ! 2925: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf824c000  ! 2927: STW_R	stw	%r28, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 2933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xf73dc000  ! 2934: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfa3c8000  ! 2940: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf4244000  ! 2941: STW_R	stw	%r26, [%r17 + %r0]
	.word 0x8994a143  ! 2944: WRPR_TICK_I	wrpr	%r18, 0x0143, %tick
	.word 0xf93ce186  ! 2947: STDF_I	std	%f28, [0x0186, %r19]
	.word 0xfa2c21aa  ! 2950: STB_I	stb	%r29, [%r16 + 0x01aa]
	.word 0xf63c4000  ! 2953: STD_R	std	%r27, [%r17 + %r0]
	.word 0x8994e0d9  ! 2954: WRPR_TICK_I	wrpr	%r19, 0x00d9, %tick
	.word 0xfc74c000  ! 2957: STX_R	stx	%r30, [%r19 + %r0]
	.word 0x8195213e  ! 2962: WRPR_TPC_I	wrpr	%r20, 0x013e, %tpc
	.word 0xbd520000  ! 2964: RDPR_PIL	rdpr	%pil, %r30
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 2967: RDPR_PIL	<illegal instruction>
	setx	0x30f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3da160  ! 2972: STD_I	std	%r31, [%r22 + 0x0160]
	.word 0xfa250000  ! 2973: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfa25a15b  ! 2974: STW_I	stw	%r29, [%r22 + 0x015b]
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d602b  ! 2978: STDF_I	std	%f27, [0x002b, %r21]
	.word 0xb1480000  ! 2980: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf0754000  ! 2983: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfa34213e  ! 2984: STH_I	sth	%r29, [%r16 + 0x013e]
	.word 0xb6244000  ! 2985: SUB_R	sub 	%r17, %r0, %r27
	.word 0xf8252181  ! 2987: STW_I	stw	%r28, [%r20 + 0x0181]
	.word 0xb9500000  ! 2991: RDPR_TPC	<illegal instruction>
	.word 0xf62c4000  ! 2997: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xfa2ca160  ! 2998: STB_I	stb	%r29, [%r18 + 0x0160]
	.word 0x8d942042  ! 2999: WRPR_PSTATE_I	wrpr	%r16, 0x0042, %pstate
	.word 0xb1508000  ! 3000: RDPR_TSTATE	rdpr	%tstate, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982a09  ! 3002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a09, %hpstate
	.word 0xbab54000  ! 3004: SUBCcc_R	orncc 	%r21, %r0, %r29
	.word 0xfd3ce0f1  ! 3007: STDF_I	std	%f30, [0x00f1, %r19]
	.word 0x8795e003  ! 3009: WRPR_TT_I	wrpr	%r23, 0x0003, %tt
	.word 0xf034e18c  ! 3010: STH_I	sth	%r24, [%r19 + 0x018c]
	.word 0xf73ca099  ! 3013: STDF_I	std	%f27, [0x0099, %r18]
	.word 0x8594e1ec  ! 3015: WRPR_TSTATE_I	wrpr	%r19, 0x01ec, %tstate
	.word 0x8994a049  ! 3016: WRPR_TICK_I	wrpr	%r18, 0x0049, %tick
	.word 0xfa3d8000  ! 3024: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf03c0000  ! 3028: STD_R	std	%r24, [%r16 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3029: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983f81  ! 3030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f81, %hpstate
	.word 0xf22cc000  ! 3031: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf4256152  ! 3033: STW_I	stw	%r26, [%r21 + 0x0152]
	.word 0x85942101  ! 3034: WRPR_TSTATE_I	wrpr	%r16, 0x0101, %tstate
	.word 0xb7540000  ! 3037: RDPR_GL	rdpr	%-, %r27
	.word 0xf4256034  ! 3041: STW_I	stw	%r26, [%r21 + 0x0034]
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859421fc  ! 3043: WRPR_TSTATE_I	wrpr	%r16, 0x01fc, %tstate
	.word 0xf63d2036  ! 3044: STD_I	std	%r27, [%r20 + 0x0036]
	.word 0xf53dc000  ! 3047: STDF_R	std	%f26, [%r0, %r23]
	.word 0xb9508000  ! 3048: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xfc2421bc  ! 3052: STW_I	stw	%r30, [%r16 + 0x01bc]
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d8000  ! 3054: STDF_R	std	%f27, [%r0, %r22]
	.word 0xfa742003  ! 3060: STX_I	stx	%r29, [%r16 + 0x0003]
	.word 0xf235a059  ! 3071: STH_I	sth	%r25, [%r22 + 0x0059]
	.word 0xf6246187  ! 3072: STW_I	stw	%r27, [%r17 + 0x0187]
	.word 0x819561c0  ! 3074: WRPR_TPC_I	wrpr	%r21, 0x01c0, %tpc
	.word 0xf23c61f3  ! 3075: STD_I	std	%r25, [%r17 + 0x01f3]
	.word 0xfc3d8000  ! 3077: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb3504000  ! 3079: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf025e1fa  ! 3081: STW_I	stw	%r24, [%r23 + 0x01fa]
	.word 0x8795e1aa  ! 3083: WRPR_TT_I	wrpr	%r23, 0x01aa, %tt
	.word 0xf43c4000  ! 3084: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb751c000  ! 3088: RDPR_TL	rdpr	%tl, %r27
	.word 0xbcb4c000  ! 3089: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xf33dc000  ! 3091: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf0250000  ! 3095: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf02cc000  ! 3100: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfc35a014  ! 3101: STH_I	sth	%r30, [%r22 + 0x0014]
	.word 0xfe74e0cc  ! 3104: STX_I	stx	%r31, [%r19 + 0x00cc]
	.word 0xfe754000  ! 3105: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfc744000  ! 3109: STX_R	stx	%r30, [%r17 + %r0]
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a010  ! 3113: WRPR_PSTATE_I	wrpr	%r18, 0x0010, %pstate
	.word 0xf835a154  ! 3115: STH_I	sth	%r28, [%r22 + 0x0154]
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 3116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0xfa250000  ! 3118: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb845e1c7  ! 3121: ADDC_I	addc 	%r23, 0x01c7, %r28
	.word 0xfc758000  ! 3123: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfc2c0000  ! 3126: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xbd518000  ! 3128: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xbcb5c000  ! 3131: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0xfa742012  ! 3136: STX_I	stx	%r29, [%r16 + 0x0012]
	.word 0xb60cc000  ! 3137: AND_R	and 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xb7643801  ! 3143: MOVcc_I	<illegal instruction>
	.word 0xfa3c4000  ! 3146: STD_R	std	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6354000  ! 3152: STH_R	sth	%r27, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 3155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf520000  ! 3157: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf62d2158  ! 3158: STB_I	stb	%r27, [%r20 + 0x0158]
	.word 0xb9500000  ! 3160: RDPR_TPC	<illegal instruction>
	.word 0xf73c8000  ! 3161: STDF_R	std	%f27, [%r0, %r18]
	.word 0x87956173  ! 3165: WRPR_TT_I	wrpr	%r21, 0x0173, %tt
	.word 0xfe754000  ! 3166: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xbe352057  ! 3168: ORN_I	orn 	%r20, 0x0057, %r31
	mov	2, %r14
	.word 0xa193a000  ! 3169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8240000  ! 3171: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfc350000  ! 3173: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf634c000  ! 3175: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xb350c000  ! 3177: RDPR_TT	rdpr	%tt, %r25
	.word 0xb1520000  ! 3178: RDPR_PIL	<illegal instruction>
	.word 0xfc354000  ! 3186: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb29c4000  ! 3188: XORcc_R	xorcc 	%r17, %r0, %r25
	.word 0xbd518000  ! 3190: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfa3da1ee  ! 3192: STD_I	std	%r29, [%r22 + 0x01ee]
	.word 0xfa258000  ! 3193: STW_R	stw	%r29, [%r22 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 3194: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbca52052  ! 3195: SUBcc_I	subcc 	%r20, 0x0052, %r30
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ad8000  ! 3199: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xf62d6007  ! 3200: STB_I	stb	%r27, [%r21 + 0x0007]
	.word 0xf4342137  ! 3205: STH_I	sth	%r26, [%r16 + 0x0137]
	setx	data_start_7, %g1, %r19
	.word 0xb5508000  ! 3210: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf43560ff  ! 3212: STH_I	sth	%r26, [%r21 + 0x00ff]
	.word 0xbeb4a1a8  ! 3213: ORNcc_I	orncc 	%r18, 0x01a8, %r31
	.word 0xb7508000  ! 3214: RDPR_TSTATE	<illegal instruction>
	.word 0xbcad6144  ! 3215: ANDNcc_I	andncc 	%r21, 0x0144, %r30
	.word 0xf835c000  ! 3222: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfa2dc000  ! 3223: STB_R	stb	%r29, [%r23 + %r0]
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 3228: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf825c000  ! 3229: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfa344000  ! 3232: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb21c20dc  ! 3233: XOR_I	xor 	%r16, 0x00dc, %r25
	.word 0xb73cc000  ! 3236: SRA_R	sra 	%r19, %r0, %r27
	.word 0x8795e19f  ! 3238: WRPR_TT_I	wrpr	%r23, 0x019f, %tt
	.word 0xb57c8400  ! 3239: MOVR_R	movre	%r18, %r0, %r26
	.word 0xfb3c219b  ! 3240: STDF_I	std	%f29, [0x019b, %r16]
	setx	data_start_0, %g1, %r22
	.word 0xf82d61e6  ! 3242: STB_I	stb	%r28, [%r21 + 0x01e6]
	.word 0xfc240000  ! 3246: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfd3c603a  ! 3247: STDF_I	std	%f30, [0x003a, %r17]
	ta	T_CHANGE_HPRIV
	.word 0x81982f03  ! 3249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f03, %hpstate
	setx	data_start_7, %g1, %r17
	.word 0xf63dc000  ! 3256: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf73c61b1  ! 3259: STDF_I	std	%f27, [0x01b1, %r17]
	.word 0x89952160  ! 3260: WRPR_TICK_I	wrpr	%r20, 0x0160, %tick
	.word 0xb5504000  ! 3262: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb3518000  ! 3265: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 3275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	.word 0xbd643801  ! 3276: MOVcc_I	<illegal instruction>
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a0d3  ! 3284: WRPR_TT_I	wrpr	%r18, 0x00d3, %tt
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf835e05a  ! 3290: STH_I	sth	%r28, [%r23 + 0x005a]
	.word 0xb40c0000  ! 3295: AND_R	and 	%r16, %r0, %r26
	.word 0xfc2ca18f  ! 3296: STB_I	stb	%r30, [%r18 + 0x018f]
	.word 0xbb51c000  ! 3301: RDPR_TL	rdpr	%tl, %r29
	.word 0xfe752043  ! 3303: STX_I	stx	%r31, [%r20 + 0x0043]
	.word 0xb62d2021  ! 3304: ANDN_I	andn 	%r20, 0x0021, %r27
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 3309: RDPR_PSTATE	<illegal instruction>
	.word 0xf43c21c5  ! 3314: STD_I	std	%r26, [%r16 + 0x01c5]
	.word 0xf075a014  ! 3316: STX_I	stx	%r24, [%r22 + 0x0014]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf93da19d  ! 3323: STDF_I	std	%f28, [0x019d, %r22]
	.word 0xfe3c8000  ! 3324: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb295c000  ! 3326: ORcc_R	orcc 	%r23, %r0, %r25
	.word 0xb97d4400  ! 3327: MOVR_R	movre	%r21, %r0, %r28
	.word 0xb1510000  ! 3328: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb5504000  ! 3331: RDPR_TNPC	<illegal instruction>
	.word 0xfa2d612b  ! 3333: STB_I	stb	%r29, [%r21 + 0x012b]
	.word 0xf0742067  ! 3334: STX_I	stx	%r24, [%r16 + 0x0067]
	.word 0xf234e000  ! 3338: STH_I	sth	%r25, [%r19 + 0x0000]
	.word 0xb2458000  ! 3340: ADDC_R	addc 	%r22, %r0, %r25
	.word 0xb150c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xfe2c218a  ! 3342: STB_I	stb	%r31, [%r16 + 0x018a]
	.word 0xf0348000  ! 3343: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf62d4000  ! 3355: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfa254000  ! 3361: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfe34e061  ! 3362: STH_I	sth	%r31, [%r19 + 0x0061]
	.word 0xf63d8000  ! 3363: STD_R	std	%r27, [%r22 + %r0]
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 3367: RDPR_TSTATE	<illegal instruction>
	.word 0xfb3d6159  ! 3370: STDF_I	std	%f29, [0x0159, %r21]
	.word 0xf42ce016  ! 3378: STB_I	stb	%r26, [%r19 + 0x0016]
	mov	1, %r14
	.word 0xa193a000  ! 3382: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4b58000  ! 3383: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xf42dc000  ! 3388: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf23d6173  ! 3390: STD_I	std	%r25, [%r21 + 0x0173]
	.word 0xb63c0000  ! 3392: XNOR_R	xnor 	%r16, %r0, %r27
	.word 0xb7504000  ! 3393: RDPR_TNPC	rdpr	%tnpc, %r27
	setx	data_start_0, %g1, %r16
	.word 0xf675a07e  ! 3398: STX_I	stx	%r27, [%r22 + 0x007e]
	.word 0xb751c000  ! 3401: RDPR_TL	<illegal instruction>
	.word 0xf43d8000  ! 3403: STD_R	std	%r26, [%r22 + %r0]
	.word 0x8194a0de  ! 3405: WRPR_TPC_I	wrpr	%r18, 0x00de, %tpc
	.word 0xb4b5c000  ! 3406: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xf2256118  ! 3407: STW_I	stw	%r25, [%r21 + 0x0118]
	.word 0x8d94e042  ! 3409: WRPR_PSTATE_I	wrpr	%r19, 0x0042, %pstate
	.word 0x9195a1dd  ! 3412: WRPR_PIL_I	wrpr	%r22, 0x01dd, %pil
	.word 0xf0354000  ! 3414: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xbf540000  ! 3419: RDPR_GL	rdpr	%-, %r31
	.word 0xb3540000  ! 3420: RDPR_GL	<illegal instruction>
	.word 0xb7500000  ! 3422: RDPR_TPC	<illegal instruction>
	.word 0xf67560f9  ! 3423: STX_I	stx	%r27, [%r21 + 0x00f9]
	.word 0x8d9520fe  ! 3426: WRPR_PSTATE_I	wrpr	%r20, 0x00fe, %pstate
	.word 0xfe3cc000  ! 3434: STD_R	std	%r31, [%r19 + %r0]
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 3439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0x8794602e  ! 3442: WRPR_TT_I	wrpr	%r17, 0x002e, %tt
	.word 0xf024a152  ! 3444: STW_I	stw	%r24, [%r18 + 0x0152]
	.word 0xb89421c5  ! 3448: ORcc_I	orcc 	%r16, 0x01c5, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0x89942170  ! 3454: WRPR_TICK_I	wrpr	%r16, 0x0170, %tick
	setx	data_start_7, %g1, %r17
	.word 0xb694e066  ! 3462: ORcc_I	orcc 	%r19, 0x0066, %r27
	.word 0xf0258000  ! 3465: STW_R	stw	%r24, [%r22 + %r0]
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	.word 0xf635a1ff  ! 3474: STH_I	sth	%r27, [%r22 + 0x01ff]
	.word 0x8d95a13d  ! 3476: WRPR_PSTATE_I	wrpr	%r22, 0x013d, %pstate
	.word 0xba344000  ! 3478: ORN_R	orn 	%r17, %r0, %r29
	.word 0xfc25c000  ! 3479: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf83dc000  ! 3482: STD_R	std	%r28, [%r23 + %r0]
	.word 0xf034c000  ! 3491: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf4744000  ! 3492: STX_R	stx	%r26, [%r17 + %r0]
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3500: RDPR_PIL	rdpr	%pil, %r26
	.word 0xb0854000  ! 3501: ADDcc_R	addcc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3d2169  ! 3505: STDF_I	std	%f30, [0x0169, %r20]
	.word 0xb3540000  ! 3510: RDPR_GL	<illegal instruction>
	.word 0xfc25a0f5  ! 3511: STW_I	stw	%r30, [%r22 + 0x00f5]
	.word 0xfc24c000  ! 3513: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf73ca08b  ! 3514: STDF_I	std	%f27, [0x008b, %r18]
	.word 0xfa340000  ! 3516: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfe75c000  ! 3517: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfe346076  ! 3518: STH_I	sth	%r31, [%r17 + 0x0076]
	.word 0x91946159  ! 3522: WRPR_PIL_I	wrpr	%r17, 0x0159, %pil
	.word 0xf93dc000  ! 3523: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf93d60b7  ! 3530: STDF_I	std	%f28, [0x00b7, %r21]
	.word 0xb684e07b  ! 3536: ADDcc_I	addcc 	%r19, 0x007b, %r27
	.word 0xfa2d4000  ! 3538: STB_R	stb	%r29, [%r21 + %r0]
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 3541: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb9508000  ! 3544: RDPR_TSTATE	<illegal instruction>
	.word 0xf0254000  ! 3545: STW_R	stw	%r24, [%r21 + %r0]
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf625e1f7  ! 3547: STW_I	stw	%r27, [%r23 + 0x01f7]
	.word 0xfa75c000  ! 3549: STX_R	stx	%r29, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 3551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3556: RDPR_GL	rdpr	%-, %r29
	.word 0x8d95e0fa  ! 3560: WRPR_PSTATE_I	wrpr	%r23, 0x00fa, %pstate
	.word 0x89942100  ! 3561: WRPR_TICK_I	wrpr	%r16, 0x0100, %tick
	.word 0xf82c4000  ! 3562: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xbd508000  ! 3563: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf27520f7  ! 3569: STX_I	stx	%r25, [%r20 + 0x00f7]
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 3571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	.word 0x8595e0f8  ! 3581: WRPR_TSTATE_I	wrpr	%r23, 0x00f8, %tstate
	.word 0xfc24c000  ! 3584: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb3500000  ! 3585: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf4744000  ! 3589: STX_R	stx	%r26, [%r17 + %r0]
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 3599: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_0, %g1, %r18
	.word 0xb4bc0000  ! 3606: XNORcc_R	xnorcc 	%r16, %r0, %r26
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 3609: STH_R	sth	%r28, [%r19 + %r0]
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 3616: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xbb518000  ! 3621: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 3624: RDPR_TL	<illegal instruction>
	.word 0xf02d8000  ! 3625: STB_R	stb	%r24, [%r22 + %r0]
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d8000  ! 3627: STD_R	std	%r26, [%r22 + %r0]
	.word 0xb5518000  ! 3628: RDPR_PSTATE	<illegal instruction>
	.word 0xf73dc000  ! 3636: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf0254000  ! 3637: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb13c7001  ! 3639: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xb43560e4  ! 3640: ORN_I	orn 	%r21, 0x00e4, %r26
	.word 0x819460c6  ! 3642: WRPR_TPC_I	wrpr	%r17, 0x00c6, %tpc
	.word 0xb7643801  ! 3644: MOVcc_I	<illegal instruction>
	.word 0xf424e15a  ! 3646: STW_I	stw	%r26, [%r19 + 0x015a]
	.word 0xf2752154  ! 3653: STX_I	stx	%r25, [%r20 + 0x0154]
	.word 0xbd540000  ! 3654: RDPR_GL	rdpr	%-, %r30
	.word 0xf4258000  ! 3657: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf42520b7  ! 3658: STW_I	stw	%r26, [%r20 + 0x00b7]
	.word 0xfb3d4000  ! 3660: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb2adc000  ! 3663: ANDNcc_R	andncc 	%r23, %r0, %r25
	.word 0x91956047  ! 3666: WRPR_PIL_I	wrpr	%r21, 0x0047, %pil
	.word 0x8d956107  ! 3669: WRPR_PSTATE_I	wrpr	%r21, 0x0107, %pstate
	.word 0xfe340000  ! 3676: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xfe3ca004  ! 3678: STD_I	std	%r31, [%r18 + 0x0004]
	.word 0xf13dc000  ! 3679: STDF_R	std	%f24, [%r0, %r23]
	.word 0x8d94e00b  ! 3684: WRPR_PSTATE_I	wrpr	%r19, 0x000b, %pstate
	.word 0xf274a0c5  ! 3686: STX_I	stx	%r25, [%r18 + 0x00c5]
	.word 0x8995e0a3  ! 3687: WRPR_TICK_I	wrpr	%r23, 0x00a3, %tick
	.word 0xfc2da1fa  ! 3688: STB_I	stb	%r30, [%r22 + 0x01fa]
	.word 0xfc25a142  ! 3694: STW_I	stw	%r30, [%r22 + 0x0142]
	.word 0x8195a17b  ! 3699: WRPR_TPC_I	wrpr	%r22, 0x017b, %tpc
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 3707: STW_R	stw	%r24, [%r22 + %r0]
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 3714: MOVcc_I	<illegal instruction>
	.word 0xb4344000  ! 3720: ORN_R	orn 	%r17, %r0, %r26
	.word 0xbf51c000  ! 3722: RDPR_TL	rdpr	%tl, %r31
	.word 0xba150000  ! 3723: OR_R	or 	%r20, %r0, %r29
	.word 0xfc2c0000  ! 3727: STB_R	stb	%r30, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982a59  ! 3729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a59, %hpstate
	.word 0xfc242048  ! 3730: STW_I	stw	%r30, [%r16 + 0x0048]
	.word 0xf62c4000  ! 3738: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf22dc000  ! 3740: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xb7508000  ! 3742: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb1510000  ! 3746: RDPR_TICK	<illegal instruction>
	.word 0xb2342068  ! 3748: SUBC_I	orn 	%r16, 0x0068, %r25
	.word 0xf624a0d1  ! 3749: STW_I	stw	%r27, [%r18 + 0x00d1]
	.word 0xbf480000  ! 3755: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc350000  ! 3759: STH_R	sth	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xf425a1f6  ! 3762: STW_I	stw	%r26, [%r22 + 0x01f6]
	.word 0xf93c4000  ! 3763: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb3500000  ! 3765: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x819560e0  ! 3772: WRPR_TPC_I	wrpr	%r21, 0x00e0, %tpc
	.word 0x8595216d  ! 3778: WRPR_TSTATE_I	wrpr	%r20, 0x016d, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x819828c3  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c3, %hpstate
	.word 0xb7508000  ! 3788: RDPR_TSTATE	rdpr	%tstate, %r27
	setx	0x3013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 3791: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf435a1fc  ! 3793: STH_I	sth	%r26, [%r22 + 0x01fc]
	.word 0xfc2c20c3  ! 3797: STB_I	stb	%r30, [%r16 + 0x00c3]
	.word 0xbb510000  ! 3799: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfc2d4000  ! 3801: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfe2d607d  ! 3802: STB_I	stb	%r31, [%r21 + 0x007d]
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6344000  ! 3807: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xb5540000  ! 3809: RDPR_GL	<illegal instruction>
	.word 0xf025c000  ! 3814: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf674c000  ! 3816: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf434e160  ! 3818: STH_I	sth	%r26, [%r19 + 0x0160]
	.word 0xf0250000  ! 3819: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf8740000  ! 3820: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf42c8000  ! 3821: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfc254000  ! 3823: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xb9504000  ! 3826: RDPR_TNPC	<illegal instruction>
	.word 0xb93d8000  ! 3827: SRA_R	sra 	%r22, %r0, %r28
	.word 0xfb3c8000  ! 3828: STDF_R	std	%f29, [%r0, %r18]
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 3839: RDPR_GL	<illegal instruction>
	.word 0xfc2d8000  ! 3842: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb5508000  ! 3844: RDPR_TSTATE	<illegal instruction>
	.word 0xb13d8000  ! 3845: SRA_R	sra 	%r22, %r0, %r24
	.word 0xb3518000  ! 3847: RDPR_PSTATE	<illegal instruction>
	.word 0xf93d8000  ! 3849: STDF_R	std	%f28, [%r0, %r22]
	.word 0x89946011  ! 3853: WRPR_TICK_I	wrpr	%r17, 0x0011, %tick
	setx	data_start_2, %g1, %r23
	.word 0xf82cc000  ! 3858: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xbb510000  ! 3860: RDPR_TICK	rdpr	%tick, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983989  ! 3863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1989, %hpstate
	.word 0xf93d0000  ! 3866: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfb3c0000  ! 3868: STDF_R	std	%f29, [%r0, %r16]
	.word 0xba35a01b  ! 3869: ORN_I	orn 	%r22, 0x001b, %r29
	.word 0xfa2c61f3  ! 3872: STB_I	stb	%r29, [%r17 + 0x01f3]
	.word 0xb40c0000  ! 3876: AND_R	and 	%r16, %r0, %r26
	.word 0xf83521bb  ! 3877: STH_I	sth	%r28, [%r20 + 0x01bb]
	.word 0xf0240000  ! 3878: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfe348000  ! 3879: STH_R	sth	%r31, [%r18 + %r0]
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395200d  ! 3883: WRPR_TNPC_I	wrpr	%r20, 0x000d, %tnpc
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 3885: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfe2c0000  ! 3888: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfa250000  ! 3890: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf2758000  ! 3892: STX_R	stx	%r25, [%r22 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 3895: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1641800  ! 3899: MOVcc_R	<illegal instruction>
	.word 0xb1504000  ! 3905: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb9357001  ! 3908: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0xb1480000  ! 3909: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe25a00f  ! 3914: STW_I	stw	%r31, [%r22 + 0x000f]
	.word 0xb29dc000  ! 3915: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xbcad212d  ! 3918: ANDNcc_I	andncc 	%r20, 0x012d, %r30
	setx	data_start_6, %g1, %r23
	mov	2, %r14
	.word 0xa193a000  ! 3920: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc3c20f3  ! 3921: STD_I	std	%r30, [%r16 + 0x00f3]
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d612a  ! 3927: STD_I	std	%r26, [%r21 + 0x012a]
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 3931: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf82c4000  ! 3934: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xba854000  ! 3935: ADDcc_R	addcc 	%r21, %r0, %r29
	.word 0x8194e022  ! 3936: WRPR_TPC_I	wrpr	%r19, 0x0022, %tpc
	.word 0xb4ada0e0  ! 3938: ANDNcc_I	andncc 	%r22, 0x00e0, %r26
	.word 0xb614c000  ! 3940: OR_R	or 	%r19, %r0, %r27
	.word 0xf93d0000  ! 3942: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf82c2015  ! 3943: STB_I	stb	%r28, [%r16 + 0x0015]
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c2171  ! 3949: STDF_I	std	%f25, [0x0171, %r16]
	.word 0xfc2c6050  ! 3951: STB_I	stb	%r30, [%r17 + 0x0050]
	.word 0xf53d6101  ! 3952: STDF_I	std	%f26, [0x0101, %r21]
	.word 0xb4b5602a  ! 3955: ORNcc_I	orncc 	%r21, 0x002a, %r26
	.word 0xbf510000  ! 3956: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf03d617b  ! 3958: STD_I	std	%r24, [%r21 + 0x017b]
	.word 0xbb500000  ! 3959: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3962: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 3966: ADDcc_R	addcc 	%r17, %r0, %r25
	.word 0xff3ce017  ! 3967: STDF_I	std	%f31, [0x0017, %r19]
	.word 0xb334f001  ! 3969: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xf43d8000  ! 3973: STD_R	std	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ad1  ! 3975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad1, %hpstate
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41d0000  ! 3981: XOR_R	xor 	%r20, %r0, %r26
	.word 0x8994a198  ! 3982: WRPR_TICK_I	wrpr	%r18, 0x0198, %tick
	.word 0xf13d6027  ! 3983: STDF_I	std	%f24, [0x0027, %r21]
	.word 0xf42de1b3  ! 3984: STB_I	stb	%r26, [%r23 + 0x01b3]
	.word 0xf33ce0e4  ! 3986: STDF_I	std	%f25, [0x00e4, %r19]
	.word 0xf635e1a9  ! 3988: STH_I	sth	%r27, [%r23 + 0x01a9]
	.word 0xfa3d4000  ! 3992: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf13c601a  ! 3995: STDF_I	std	%f24, [0x001a, %r17]
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf625e0da  ! 4003: STW_I	stw	%r27, [%r23 + 0x00da]
	.word 0xf835a002  ! 4005: STH_I	sth	%r28, [%r22 + 0x0002]
	.word 0xb5351000  ! 4007: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xfb3c0000  ! 4008: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf6352039  ! 4013: STH_I	sth	%r27, [%r20 + 0x0039]
	.word 0xf6750000  ! 4014: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xbf50c000  ! 4017: RDPR_TT	rdpr	%tt, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983d5b  ! 4019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5b, %hpstate
	.word 0xf435a0b8  ! 4020: STH_I	sth	%r26, [%r22 + 0x00b8]
	.word 0xfe35e06e  ! 4022: STH_I	sth	%r31, [%r23 + 0x006e]
	.word 0xf62da10a  ! 4025: STB_I	stb	%r27, [%r22 + 0x010a]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf13ce03d  ! 4028: STDF_I	std	%f24, [0x003d, %r19]
	.word 0xfc748000  ! 4039: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xb97d6401  ! 4040: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xb535f001  ! 4041: SRLX_I	srlx	%r23, 0x0001, %r26
	.word 0xfc358000  ! 4045: STH_R	sth	%r30, [%r22 + %r0]
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 4051: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xbd3da001  ! 4052: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xb834c000  ! 4054: ORN_R	orn 	%r19, %r0, %r28
	.word 0xf63d219d  ! 4056: STD_I	std	%r27, [%r20 + 0x019d]
	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 4058: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e186  ! 4067: WRPR_TICK_I	wrpr	%r19, 0x0186, %tick
	.word 0xbd50c000  ! 4069: RDPR_TT	rdpr	%tt, %r30
	.word 0xbcb40000  ! 4072: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xf4246150  ! 4078: STW_I	stw	%r26, [%r17 + 0x0150]
	.word 0xb92d2001  ! 4079: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xf22d21a9  ! 4080: STB_I	stb	%r25, [%r20 + 0x01a9]
	.word 0xbb520000  ! 4081: RDPR_PIL	<illegal instruction>
	.word 0xf22d21c4  ! 4082: STB_I	stb	%r25, [%r20 + 0x01c4]
	.word 0xfe3de181  ! 4088: STD_I	std	%r31, [%r23 + 0x0181]
	.word 0xfe2da1f6  ! 4089: STB_I	stb	%r31, [%r22 + 0x01f6]
	.word 0xf33ca1d5  ! 4093: STDF_I	std	%f25, [0x01d5, %r18]
	setx	0x30020, %g1, %o0
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
	.word 0xb1540000  ! 4104: RDPR_GL	<illegal instruction>
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xbc0d61c6  ! 4111: AND_I	and 	%r21, 0x01c6, %r30
	.word 0xf93ce1f0  ! 4112: STDF_I	std	%f28, [0x01f0, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3c8000  ! 4120: STDF_R	std	%f30, [%r0, %r18]
	.word 0xff3da0b5  ! 4121: STDF_I	std	%f31, [0x00b5, %r22]
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	.word 0xbd504000  ! 4131: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf83c61cf  ! 4134: STD_I	std	%r28, [%r17 + 0x01cf]
	.word 0xf275c000  ! 4139: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfa3c8000  ! 4141: STD_R	std	%r29, [%r18 + %r0]
	.word 0x8794e1f3  ! 4143: WRPR_TT_I	wrpr	%r19, 0x01f3, %tt
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 4146: STX_R	stx	%r30, [%r19 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4147: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa342093  ! 4150: STH_I	sth	%r29, [%r16 + 0x0093]
	.word 0xfa342125  ! 4152: STH_I	sth	%r29, [%r16 + 0x0125]
	.word 0xb2244000  ! 4153: SUB_R	sub 	%r17, %r0, %r25
	.word 0xfc7521de  ! 4156: STX_I	stx	%r30, [%r20 + 0x01de]
	.word 0xfe740000  ! 4159: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf13da16f  ! 4164: STDF_I	std	%f24, [0x016f, %r22]
	.word 0xb294e127  ! 4167: ORcc_I	orcc 	%r19, 0x0127, %r25
	.word 0xfa24a033  ! 4169: STW_I	stw	%r29, [%r18 + 0x0033]
	.word 0xfa358000  ! 4175: STH_R	sth	%r29, [%r22 + %r0]
	.word 0x81956075  ! 4177: WRPR_TPC_I	wrpr	%r21, 0x0075, %tpc
	.word 0x8194212b  ! 4178: WRPR_TPC_I	wrpr	%r16, 0x012b, %tpc
	.word 0xf6352133  ! 4179: STH_I	sth	%r27, [%r20 + 0x0133]
	.word 0xf024a03a  ! 4181: STW_I	stw	%r24, [%r18 + 0x003a]
	.word 0xf074a1de  ! 4182: STX_I	stx	%r24, [%r18 + 0x01de]
	.word 0xfa74c000  ! 4188: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xbeb4e0c8  ! 4194: ORNcc_I	orncc 	%r19, 0x00c8, %r31
	.word 0xfc75e1c9  ! 4196: STX_I	stx	%r30, [%r23 + 0x01c9]
	.word 0xfe3461ba  ! 4197: STH_I	sth	%r31, [%r17 + 0x01ba]
	.word 0xf02ca196  ! 4201: STB_I	stb	%r24, [%r18 + 0x0196]
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0746150  ! 4204: STX_I	stx	%r24, [%r17 + 0x0150]
	.word 0xf2344000  ! 4206: STH_R	sth	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb72df001  ! 4208: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xfa348000  ! 4209: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf53c205b  ! 4210: STDF_I	std	%f26, [0x005b, %r16]
	.word 0x8595e16f  ! 4220: WRPR_TSTATE_I	wrpr	%r23, 0x016f, %tstate
	.word 0xba352132  ! 4222: ORN_I	orn 	%r20, 0x0132, %r29
	.word 0xbb7de401  ! 4226: MOVR_I	movre	%r23, 0x1, %r29
	.word 0xb3518000  ! 4233: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf0342158  ! 4237: STH_I	sth	%r24, [%r16 + 0x0158]
	.word 0xb7518000  ! 4240: RDPR_PSTATE	<illegal instruction>
	.word 0x859420b1  ! 4242: WRPR_TSTATE_I	wrpr	%r16, 0x00b1, %tstate
	.word 0xfc2c2161  ! 4244: STB_I	stb	%r30, [%r16 + 0x0161]
	.word 0xf73d20b0  ! 4248: STDF_I	std	%f27, [0x00b0, %r20]
	.word 0xb6c4a1fc  ! 4251: ADDCcc_I	addccc 	%r18, 0x01fc, %r27
	.word 0xf42d61be  ! 4254: STB_I	stb	%r26, [%r21 + 0x01be]
	.word 0xb42d0000  ! 4255: ANDN_R	andn 	%r20, %r0, %r26
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc350000  ! 4261: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xb9508000  ! 4262: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf42ca1ff  ! 4263: STB_I	stb	%r26, [%r18 + 0x01ff]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8394a0e9  ! 4271: WRPR_TNPC_I	wrpr	%r18, 0x00e9, %tnpc
	.word 0xf2252191  ! 4272: STW_I	stw	%r25, [%r20 + 0x0191]
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e110  ! 4277: WRPR_TT_I	wrpr	%r23, 0x0110, %tt
	.word 0xfa256182  ! 4285: STW_I	stw	%r29, [%r21 + 0x0182]
	ta	T_CHANGE_HPRIV
	.word 0x81982c43  ! 4286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 4291: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03d606d  ! 4293: STD_I	std	%r24, [%r21 + 0x006d]
	.word 0xfc75a1e2  ! 4294: STX_I	stx	%r30, [%r22 + 0x01e2]
	.word 0xf075e1cc  ! 4296: STX_I	stx	%r24, [%r23 + 0x01cc]
	.word 0xfc2cc000  ! 4297: STB_R	stb	%r30, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 4298: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x819839d1  ! 4301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d1, %hpstate
	.word 0xf13c2107  ! 4302: STDF_I	std	%f24, [0x0107, %r16]
	mov	1, %r12
	.word 0x8f932000  ! 4303: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4758000  ! 4304: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbb480000  ! 4305: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x9194a1e7  ! 4306: WRPR_PIL_I	wrpr	%r18, 0x01e7, %pil
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	.word 0xfe2d0000  ! 4313: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xb824c000  ! 4314: SUB_R	sub 	%r19, %r0, %r28
	.word 0xf93c0000  ! 4316: STDF_R	std	%f28, [%r0, %r16]
	.word 0xfe748000  ! 4319: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb3510000  ! 4323: RDPR_TICK	rdpr	%tick, %r25
	mov	1, %r12
	.word 0x8f932000  ! 4327: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4350000  ! 4328: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf42c8000  ! 4330: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xb5500000  ! 4335: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2da0c7  ! 4337: STB_I	stb	%r30, [%r22 + 0x00c7]
	.word 0xf225c000  ! 4339: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfa75e0d8  ! 4341: STX_I	stx	%r29, [%r23 + 0x00d8]
	mov	0, %r12
	.word 0x8f932000  ! 4344: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r17
	.word 0xb414a0f7  ! 4352: OR_I	or 	%r18, 0x00f7, %r26
	.word 0x8995a1c2  ! 4353: WRPR_TICK_I	wrpr	%r22, 0x01c2, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r23
	.word 0x8195e115  ! 4360: WRPR_TPC_I	wrpr	%r23, 0x0115, %tpc
	.word 0xb1357001  ! 4363: SRLX_I	srlx	%r21, 0x0001, %r24
	.word 0xf47560bb  ! 4364: STX_I	stx	%r26, [%r21 + 0x00bb]
	.word 0xbf504000  ! 4366: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xfa3dc000  ! 4369: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfa748000  ! 4370: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbf51c000  ! 4371: RDPR_TL	<illegal instruction>
	.word 0xfe2ca02e  ! 4374: STB_I	stb	%r31, [%r18 + 0x002e]
	.word 0xf6754000  ! 4379: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf2740000  ! 4380: STX_R	stx	%r25, [%r16 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 4381: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa24e0a5  ! 4382: STW_I	stw	%r29, [%r19 + 0x00a5]
	.word 0xb351c000  ! 4383: RDPR_TL	rdpr	%tl, %r25
	.word 0xb53dc000  ! 4384: SRA_R	sra 	%r23, %r0, %r26
	.word 0xb1510000  ! 4386: RDPR_TICK	rdpr	%tick, %r24
	.word 0x839521f9  ! 4389: WRPR_TNPC_I	wrpr	%r20, 0x01f9, %tnpc
	.word 0xba258000  ! 4390: SUB_R	sub 	%r22, %r0, %r29
	.word 0x8d9460cb  ! 4391: WRPR_PSTATE_I	wrpr	%r17, 0x00cb, %pstate
	.word 0xf8348000  ! 4395: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfe744000  ! 4398: STX_R	stx	%r31, [%r17 + %r0]
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 4400: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb53d3001  ! 4402: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xb1352001  ! 4403: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0x919521c7  ! 4406: WRPR_PIL_I	wrpr	%r20, 0x01c7, %pil
	.word 0xb02c0000  ! 4407: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xb415a0b5  ! 4408: OR_I	or 	%r22, 0x00b5, %r26
	.word 0xbe85a1e8  ! 4410: ADDcc_I	addcc 	%r22, 0x01e8, %r31
	.word 0xbe2420a5  ! 4414: SUB_I	sub 	%r16, 0x00a5, %r31
	.word 0xf22dc000  ! 4416: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xb97de401  ! 4417: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xf23c4000  ! 4425: STD_R	std	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e13  ! 4427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e13, %hpstate
	.word 0xf23ca097  ! 4429: STD_I	std	%r25, [%r18 + 0x0097]
	.word 0xf8750000  ! 4431: STX_R	stx	%r28, [%r20 + %r0]
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4344000  ! 4439: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf22da084  ! 4441: STB_I	stb	%r25, [%r22 + 0x0084]
	.word 0xf4748000  ! 4444: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfe354000  ! 4445: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf22c6194  ! 4450: STB_I	stb	%r25, [%r17 + 0x0194]
	.word 0xb61c2054  ! 4456: XOR_I	xor 	%r16, 0x0054, %r27
	.word 0xfc74a076  ! 4458: STX_I	stx	%r30, [%r18 + 0x0076]
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942014  ! 4466: WRPR_TPC_I	wrpr	%r16, 0x0014, %tpc
	.word 0xf33de019  ! 4473: STDF_I	std	%f25, [0x0019, %r23]
	.word 0xb3540000  ! 4474: RDPR_GL	rdpr	%-, %r25
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899460af  ! 4481: WRPR_TICK_I	wrpr	%r17, 0x00af, %tick
	.word 0xfc344000  ! 4482: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xb815c000  ! 4485: OR_R	or 	%r23, %r0, %r28
	.word 0xbd510000  ! 4486: RDPR_TICK	rdpr	%tick, %r30
	.word 0xbc45a058  ! 4487: ADDC_I	addc 	%r22, 0x0058, %r30
	.word 0xb951c000  ! 4489: RDPR_TL	rdpr	%tl, %r28
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c8000  ! 4491: STD_R	std	%r27, [%r18 + %r0]
	.word 0xfc750000  ! 4495: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfe2ca099  ! 4496: STB_I	stb	%r31, [%r18 + 0x0099]
	.word 0xfe24e15d  ! 4498: STW_I	stw	%r31, [%r19 + 0x015d]
	.word 0xfe3cc000  ! 4499: STD_R	std	%r31, [%r19 + %r0]
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba1d0000  ! 4502: XOR_R	xor 	%r20, %r0, %r29
	.word 0xb0c461be  ! 4507: ADDCcc_I	addccc 	%r17, 0x01be, %r24
	.word 0xfc3c21d9  ! 4509: STD_I	std	%r30, [%r16 + 0x01d9]
	.word 0xf43da067  ! 4511: STD_I	std	%r26, [%r22 + 0x0067]
	.word 0xfa248000  ! 4513: STW_R	stw	%r29, [%r18 + %r0]
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d2006  ! 4515: STB_I	stb	%r24, [%r20 + 0x0006]
	.word 0xfc74a0e5  ! 4516: STX_I	stx	%r30, [%r18 + 0x00e5]
	.word 0xf33c20d1  ! 4517: STDF_I	std	%f25, [0x00d1, %r16]
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834e096  ! 4522: STH_I	sth	%r28, [%r19 + 0x0096]
	.word 0xfc358000  ! 4524: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb9540000  ! 4527: RDPR_GL	rdpr	%-, %r28
	.word 0xfc74c000  ! 4528: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf474a0f4  ! 4531: STX_I	stx	%r26, [%r18 + 0x00f4]
	.word 0xfc7460a8  ! 4532: STX_I	stx	%r30, [%r17 + 0x00a8]
	.word 0xf0250000  ! 4533: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf62c8000  ! 4536: STB_R	stb	%r27, [%r18 + %r0]
	.word 0x839461c1  ! 4540: WRPR_TNPC_I	wrpr	%r17, 0x01c1, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982999  ! 4541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0xf424c000  ! 4542: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xbd508000  ! 4543: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf62d8000  ! 4544: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfc2d8000  ! 4546: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb3520000  ! 4547: RDPR_PIL	<illegal instruction>
	.word 0xfe750000  ! 4548: STX_R	stx	%r31, [%r20 + %r0]
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 4561: RDPR_TNPC	<illegal instruction>
	.word 0xf43c2054  ! 4563: STD_I	std	%r26, [%r16 + 0x0054]
	.word 0xb9510000  ! 4573: RDPR_TICK	<illegal instruction>
	.word 0xfe354000  ! 4577: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf43da112  ! 4579: STD_I	std	%r26, [%r22 + 0x0112]
	.word 0xf624a17b  ! 4581: STW_I	stw	%r27, [%r18 + 0x017b]
	.word 0xb434e1de  ! 4583: SUBC_I	orn 	%r19, 0x01de, %r26
	.word 0xf33d2081  ! 4585: STDF_I	std	%f25, [0x0081, %r20]
	ta	T_CHANGE_HPRIV
	.word 0x81982ccb  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccb, %hpstate
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 4596: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf82d20e9  ! 4597: STB_I	stb	%r28, [%r20 + 0x00e9]
	.word 0xb5508000  ! 4599: RDPR_TSTATE	<illegal instruction>
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43460cc  ! 4607: STH_I	sth	%r26, [%r17 + 0x00cc]
	.word 0x8195a17a  ! 4611: WRPR_TPC_I	wrpr	%r22, 0x017a, %tpc
	.word 0xf035c000  ! 4614: STH_R	sth	%r24, [%r23 + %r0]
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 4619: STH_R	sth	%r26, [%r20 + %r0]
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 4627: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf43ca15b  ! 4631: STD_I	std	%r26, [%r18 + 0x015b]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983e09  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e09, %hpstate
	.word 0xf93ce1c2  ! 4637: STDF_I	std	%f28, [0x01c2, %r19]
	.word 0xf824c000  ! 4638: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfa74a00b  ! 4641: STX_I	stx	%r29, [%r18 + 0x000b]
	.word 0xfa24c000  ! 4642: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf03c20c1  ! 4645: STD_I	std	%r24, [%r16 + 0x00c1]
	.word 0xf6256091  ! 4647: STW_I	stw	%r27, [%r21 + 0x0091]
	.word 0xb2b4e0c0  ! 4655: ORNcc_I	orncc 	%r19, 0x00c0, %r25
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xfd3d203f  ! 4660: STDF_I	std	%f30, [0x003f, %r20]
	.word 0xb1508000  ! 4661: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfe74c000  ! 4662: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb8a54000  ! 4664: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xfd3da02b  ! 4667: STDF_I	std	%f30, [0x002b, %r22]
	.word 0xbb500000  ! 4668: RDPR_TPC	<illegal instruction>
	.word 0xfc3c4000  ! 4670: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf024a051  ! 4671: STW_I	stw	%r24, [%r18 + 0x0051]
	setx	data_start_5, %g1, %r23
	.word 0xbf2d1000  ! 4678: SLLX_R	sllx	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d0b  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0b, %hpstate
	.word 0x8d95a1b5  ! 4684: WRPR_PSTATE_I	wrpr	%r22, 0x01b5, %pstate
	.word 0xf23c2054  ! 4686: STD_I	std	%r25, [%r16 + 0x0054]
	.word 0xf93da136  ! 4687: STDF_I	std	%f28, [0x0136, %r22]
	.word 0x8995a02d  ! 4689: WRPR_TICK_I	wrpr	%r22, 0x002d, %tick
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbea4a19b  ! 4693: SUBcc_I	subcc 	%r18, 0x019b, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819828c3  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c3, %hpstate
	.word 0x8795a109  ! 4695: WRPR_TT_I	wrpr	%r22, 0x0109, %tt
	.word 0x81952125  ! 4698: WRPR_TPC_I	wrpr	%r20, 0x0125, %tpc
	.word 0xf035e0a5  ! 4699: STH_I	sth	%r24, [%r23 + 0x00a5]
	.word 0xb8348000  ! 4700: ORN_R	orn 	%r18, %r0, %r28
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce1bc  ! 4711: STD_I	std	%r30, [%r19 + 0x01bc]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x819839db  ! 4721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19db, %hpstate
	.word 0xf42d8000  ! 4729: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf0358000  ! 4730: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf82c0000  ! 4731: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xbec50000  ! 4734: ADDCcc_R	addccc 	%r20, %r0, %r31
	.word 0xf0354000  ! 4735: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xb7480000  ! 4738: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf53d8000  ! 4739: STDF_R	std	%f26, [%r0, %r22]
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 4744: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf83c0000  ! 4745: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf93c8000  ! 4747: STDF_R	std	%f28, [%r0, %r18]
	.word 0xfe3d0000  ! 4752: STD_R	std	%r31, [%r20 + %r0]
	.word 0xb3540000  ! 4753: RDPR_GL	<illegal instruction>
	.word 0x899420c1  ! 4754: WRPR_TICK_I	wrpr	%r16, 0x00c1, %tick
	.word 0xfe3461f1  ! 4756: STH_I	sth	%r31, [%r17 + 0x01f1]
	.word 0xfe3dc000  ! 4758: STD_R	std	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf624a06d  ! 4760: STW_I	stw	%r27, [%r18 + 0x006d]
	.word 0xbd520000  ! 4761: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf63de172  ! 4762: STD_I	std	%r27, [%r23 + 0x0172]
	.word 0xff3d4000  ! 4770: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb5500000  ! 4771: RDPR_TPC	<illegal instruction>
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c8000  ! 4778: STDF_R	std	%f26, [%r0, %r18]
	.word 0xb29c0000  ! 4780: XORcc_R	xorcc 	%r16, %r0, %r25
	setx	data_start_1, %g1, %r21
	.word 0xbd540000  ! 4782: RDPR_GL	<illegal instruction>
	.word 0xf4344000  ! 4783: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb5504000  ! 4784: RDPR_TNPC	<illegal instruction>
	.word 0xf8754000  ! 4786: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfe240000  ! 4789: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb7510000  ! 4792: RDPR_TICK	<illegal instruction>
	.word 0xf42c4000  ! 4794: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xb2b54000  ! 4797: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0xbf350000  ! 4799: SRL_R	srl 	%r20, %r0, %r31
	.word 0xf074a162  ! 4802: STX_I	stx	%r24, [%r18 + 0x0162]
	.word 0xf8244000  ! 4803: STW_R	stw	%r28, [%r17 + %r0]
	.word 0x9194e073  ! 4804: WRPR_PIL_I	wrpr	%r19, 0x0073, %pil
	.word 0xf23da074  ! 4805: STD_I	std	%r25, [%r22 + 0x0074]
	.word 0xfc25a163  ! 4807: STW_I	stw	%r30, [%r22 + 0x0163]
	.word 0xfc3c8000  ! 4808: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf13c2090  ! 4809: STDF_I	std	%f24, [0x0090, %r16]
	.word 0xbf510000  ! 4811: RDPR_TICK	rdpr	%tick, %r31
	setx	data_start_7, %g1, %r23
	.word 0xf33d8000  ! 4815: STDF_R	std	%f25, [%r0, %r22]
	setx	0x227, %g1, %o0
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
	.word 0xb49561a3  ! 4826: ORcc_I	orcc 	%r21, 0x01a3, %r26
	.word 0xf83c8000  ! 4828: STD_R	std	%r28, [%r18 + %r0]
	.word 0xb80d0000  ! 4829: AND_R	and 	%r20, %r0, %r28
	.word 0xfa2cc000  ! 4830: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf23c4000  ! 4837: STD_R	std	%r25, [%r17 + %r0]
	.word 0xbb518000  ! 4841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3dc000  ! 4844: STD_R	std	%r31, [%r23 + %r0]
	.word 0xfe2c0000  ! 4847: STB_R	stb	%r31, [%r16 + %r0]
	.word 0x8d9521ce  ! 4849: WRPR_PSTATE_I	wrpr	%r20, 0x01ce, %pstate
	.word 0xbf3ca001  ! 4850: SRA_I	sra 	%r18, 0x0001, %r31
	.word 0xfc3ca083  ! 4852: STD_I	std	%r30, [%r18 + 0x0083]
	.word 0xb1518000  ! 4853: RDPR_PSTATE	rdpr	%pstate, %r24
	mov	2, %r12
	.word 0x8f932000  ! 4854: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc742119  ! 4856: STX_I	stx	%r30, [%r16 + 0x0119]
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a0de  ! 4864: WRPR_TICK_I	wrpr	%r18, 0x00de, %tick
	.word 0xfa3da0ee  ! 4869: STD_I	std	%r29, [%r22 + 0x00ee]
	.word 0xb3520000  ! 4872: RDPR_PIL	rdpr	%pil, %r25
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c219a  ! 4882: STDF_I	std	%f31, [0x019a, %r16]
	setx	data_start_6, %g1, %r20
	.word 0xb5480000  ! 4886: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf6248000  ! 4887: STW_R	stw	%r27, [%r18 + %r0]
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf635e18b  ! 4889: STH_I	sth	%r27, [%r23 + 0x018b]
	.word 0xf83c0000  ! 4894: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf235c000  ! 4895: STH_R	sth	%r25, [%r23 + %r0]
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c8000  ! 4900: STDF_R	std	%f24, [%r0, %r18]
	.word 0xfc3cc000  ! 4901: STD_R	std	%r30, [%r19 + %r0]
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75e144  ! 4904: STX_I	stx	%r30, [%r23 + 0x0144]
	.word 0xb1510000  ! 4906: RDPR_TICK	<illegal instruction>
	.word 0x819521d3  ! 4907: WRPR_TPC_I	wrpr	%r20, 0x01d3, %tpc
	.word 0xf825c000  ! 4909: STW_R	stw	%r28, [%r23 + %r0]
	.word 0x9194216c  ! 4911: WRPR_PIL_I	wrpr	%r16, 0x016c, %pil
	.word 0xf4240000  ! 4914: STW_R	stw	%r26, [%r16 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 4916: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf82520a5  ! 4917: STW_I	stw	%r28, [%r20 + 0x00a5]
	.word 0xf62de04a  ! 4919: STB_I	stb	%r27, [%r23 + 0x004a]
	.word 0xfe2ca1ac  ! 4923: STB_I	stb	%r31, [%r18 + 0x01ac]
	.word 0xf13c4000  ! 4925: STDF_R	std	%f24, [%r0, %r17]
	mov	2, %r14
	.word 0xa193a000  ! 4931: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4932: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe2561cb  ! 4933: STW_I	stw	%r31, [%r21 + 0x01cb]
	.word 0xfe2c4000  ! 4934: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb3540000  ! 4936: RDPR_GL	rdpr	%-, %r25
	.word 0xff3dc000  ! 4939: STDF_R	std	%f31, [%r0, %r23]
	.word 0xfc3560f4  ! 4940: STH_I	sth	%r30, [%r21 + 0x00f4]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43da0a8  ! 4945: STD_I	std	%r26, [%r22 + 0x00a8]
	.word 0xfe340000  ! 4946: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf02ca0a2  ! 4949: STB_I	stb	%r24, [%r18 + 0x00a2]
	.word 0xfe3ca104  ! 4950: STD_I	std	%r31, [%r18 + 0x0104]
	.word 0xf6344000  ! 4951: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xbd520000  ! 4954: RDPR_PIL	<illegal instruction>
	.word 0xf62cc000  ! 4956: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xbc95c000  ! 4957: ORcc_R	orcc 	%r23, %r0, %r30
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224a03f  ! 4960: STW_I	stw	%r25, [%r18 + 0x003f]
	.word 0xfa350000  ! 4961: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xb735d000  ! 4962: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xb93d3001  ! 4964: SRAX_I	srax	%r20, 0x0001, %r28
	.word 0xb6b52092  ! 4965: ORNcc_I	orncc 	%r20, 0x0092, %r27
	.word 0xf43cc000  ! 4966: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb9500000  ! 4968: RDPR_TPC	<illegal instruction>
	.word 0xf03c2155  ! 4971: STD_I	std	%r24, [%r16 + 0x0155]
	.word 0xf624618c  ! 4972: STW_I	stw	%r27, [%r17 + 0x018c]
	.word 0xb9643801  ! 4973: MOVcc_I	<illegal instruction>
	.word 0xf6246005  ! 4976: STW_I	stw	%r27, [%r17 + 0x0005]
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e1d4  ! 4982: WRPR_TPC_I	wrpr	%r19, 0x01d4, %tpc
	.word 0xb9520000  ! 4984: RDPR_PIL	rdpr	%pil, %r28
	.word 0xbd7cc400  ! 4985: MOVR_R	movre	%r19, %r0, %r30
	.word 0xb151c000  ! 4991: RDPR_TL	rdpr	%tl, %r24
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025201f  ! 4998: STW_I	stw	%r24, [%r20 + 0x001f]
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
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 9: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xbe1d206e  ! 10: XOR_I	xor 	%r20, 0x006e, %r31
	.word 0xf85d606f  ! 11: LDX_I	ldx	[%r21 + 0x006f], %r28
	.word 0xfe148000  ! 12: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf455605a  ! 14: LDSH_I	ldsh	[%r21 + 0x005a], %r26
	.word 0xbd641800  ! 15: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a99  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a99, %hpstate
	.word 0xf854c000  ! 17: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xfa14618b  ! 18: LDUH_I	lduh	[%r17 + 0x018b], %r29
	.word 0xb224c000  ! 21: SUB_R	sub 	%r19, %r0, %r25
	.word 0xf41dc000  ! 23: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xf6142068  ! 25: LDUH_I	lduh	[%r16 + 0x0068], %r27
	.word 0xfa040000  ! 26: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb89c4000  ! 29: XORcc_R	xorcc 	%r17, %r0, %r28
	setx	data_start_7, %g1, %r17
	.word 0xb7504000  ! 36: RDPR_TNPC	<illegal instruction>
	.word 0xfe450000  ! 37: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfa058000  ! 40: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xb951c000  ! 41: RDPR_TL	<illegal instruction>
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 47: RDPR_TNPC	<illegal instruction>
	.word 0xfa4dc000  ! 49: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xf80de1a6  ! 52: LDUB_I	ldub	[%r23 + 0x01a6], %r28
	.word 0xfe4d8000  ! 53: LDSB_R	ldsb	[%r22 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xf60c8000  ! 60: LDUB_R	ldub	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xf44de0fd  ! 67: LDSB_I	ldsb	[%r23 + 0x00fd], %r26
	setx	0x20316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r23
	.word 0xfe55a0ea  ! 72: LDSH_I	ldsh	[%r22 + 0x00ea], %r31
	.word 0xfe0dc000  ! 74: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xfd1d8000  ! 79: LDDF_R	ldd	[%r22, %r0], %f30
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e0b3  ! 88: WRPR_TNPC_I	wrpr	%r23, 0x00b3, %tnpc
	setx	0x20103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a14a  ! 95: WRPR_TSTATE_I	wrpr	%r18, 0x014a, %tstate
	.word 0xfb1de04b  ! 98: LDDF_I	ldd	[%r23, 0x004b], %f29
	.word 0xbf504000  ! 102: RDPR_TNPC	<illegal instruction>
	.word 0xb32de001  ! 107: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xf65dc000  ! 109: LDX_R	ldx	[%r23 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198288b  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088b, %hpstate
	.word 0xf21d200e  ! 112: LDD_I	ldd	[%r20 + 0x000e], %r25
	.word 0xbd2d2001  ! 113: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0xfb1c0000  ! 116: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xf01ce126  ! 119: LDD_I	ldd	[%r19 + 0x0126], %r24
	.word 0xf04d8000  ! 120: LDSB_R	ldsb	[%r22 + %r0], %r24
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d21e4  ! 126: LDD_I	ldd	[%r20 + 0x01e4], %r28
	.word 0xf84dc000  ! 127: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf404c000  ! 128: LDUW_R	lduw	[%r19 + %r0], %r26
	setx	data_start_3, %g1, %r19
	.word 0xb2b521f8  ! 135: SUBCcc_I	orncc 	%r20, 0x01f8, %r25
	.word 0xf24dc000  ! 137: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xbb480000  ! 144: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf01d207c  ! 146: LDD_I	ldd	[%r20 + 0x007c], %r24
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xf64ce007  ! 150: LDSB_I	ldsb	[%r19 + 0x0007], %r27
	.word 0xf71cc000  ! 152: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xf0542145  ! 153: LDSH_I	ldsh	[%r16 + 0x0145], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	.word 0xfe558000  ! 159: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xf2154000  ! 162: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xb83d2057  ! 163: XNOR_I	xnor 	%r20, 0x0057, %r28
	.word 0xb5508000  ! 164: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r22
	.word 0xfd1c4000  ! 166: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xfa0d610f  ! 168: LDUB_I	ldub	[%r21 + 0x010f], %r29
	mov	2, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe55a089  ! 170: LDSH_I	ldsh	[%r22 + 0x0089], %r31
	.word 0xf844c000  ! 171: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf014c000  ! 174: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xfe5561e6  ! 175: LDSH_I	ldsh	[%r21 + 0x01e6], %r31
	.word 0xf2448000  ! 176: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf60c2110  ! 179: LDUB_I	ldub	[%r16 + 0x0110], %r27
	.word 0xf8454000  ! 180: LDSW_R	ldsw	[%r21 + %r0], %r28
	mov	2, %r12
	.word 0x8f932000  ! 181: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 188: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xbd7c6401  ! 195: MOVR_I	movre	%r17, 0x1, %r30
	.word 0x8995a0ce  ! 201: WRPR_TICK_I	wrpr	%r22, 0x00ce, %tick
	.word 0x8d952075  ! 203: WRPR_PSTATE_I	wrpr	%r20, 0x0075, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795e1f7  ! 206: WRPR_TT_I	wrpr	%r23, 0x01f7, %tt
	.word 0xfa048000  ! 212: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xbb504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xf60d608a  ! 215: LDUB_I	ldub	[%r21 + 0x008a], %r27
	.word 0xf2142050  ! 220: LDUH_I	lduh	[%r16 + 0x0050], %r25
	.word 0xf415e078  ! 221: LDUH_I	lduh	[%r23 + 0x0078], %r26
	.word 0xff1c8000  ! 227: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xb01ca0d6  ! 229: XOR_I	xor 	%r18, 0x00d6, %r24
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 232: RDPR_TNPC	<illegal instruction>
	setx	data_start_6, %g1, %r23
	.word 0xf4058000  ! 236: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xbf510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xfc4c4000  ! 240: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xf61de025  ! 243: LDD_I	ldd	[%r23 + 0x0025], %r27
	.word 0xbc0c4000  ! 246: AND_R	and 	%r17, %r0, %r30
	.word 0xbb540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xfc1c206c  ! 250: LDD_I	ldd	[%r16 + 0x006c], %r30
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80c6022  ! 256: LDUB_I	ldub	[%r17 + 0x0022], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982bc3  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0xf51cc000  ! 264: LDDF_R	ldd	[%r19, %r0], %f26
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81983a43  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a43, %hpstate
	.word 0xfa0da155  ! 272: LDUB_I	ldub	[%r22 + 0x0155], %r29
	setx	data_start_1, %g1, %r18
	.word 0x8194a17f  ! 277: WRPR_TPC_I	wrpr	%r18, 0x017f, %tpc
	.word 0xfc45c000  ! 278: LDSW_R	ldsw	[%r23 + %r0], %r30
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 282: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfd1de072  ! 283: LDDF_I	ldd	[%r23, 0x0072], %f30
	.word 0xf80c2124  ! 286: LDUB_I	ldub	[%r16 + 0x0124], %r28
	.word 0xba0d6137  ! 287: AND_I	and 	%r21, 0x0137, %r29
	.word 0xf64c219e  ! 289: LDSB_I	ldsb	[%r16 + 0x019e], %r27
	.word 0xfe05e0a7  ! 302: LDUW_I	lduw	[%r23 + 0x00a7], %r31
	.word 0xf41c60f3  ! 303: LDD_I	ldd	[%r17 + 0x00f3], %r26
	.word 0xfa5420d5  ! 304: LDSH_I	ldsh	[%r16 + 0x00d5], %r29
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d8000  ! 307: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xf01c6100  ! 308: LDD_I	ldd	[%r17 + 0x0100], %r24
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838db  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18db, %hpstate
	.word 0xbf50c000  ! 316: RDPR_TT	<illegal instruction>
	.word 0xf71de07e  ! 321: LDDF_I	ldd	[%r23, 0x007e], %f27
	.word 0xfa4d21d6  ! 324: LDSB_I	ldsb	[%r20 + 0x01d6], %r29
	.word 0x8d9421c4  ! 325: WRPR_PSTATE_I	wrpr	%r16, 0x01c4, %pstate
	.word 0xf51da0c8  ! 327: LDDF_I	ldd	[%r22, 0x00c8], %f26
	.word 0x89942131  ! 328: WRPR_TICK_I	wrpr	%r16, 0x0131, %tick
	.word 0xf01d8000  ! 331: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf61dc000  ! 335: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xfb1d0000  ! 337: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xb13da001  ! 338: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xf454e11e  ! 339: LDSH_I	ldsh	[%r19 + 0x011e], %r26
	.word 0xf4154000  ! 341: LDUH_R	lduh	[%r21 + %r0], %r26
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819521f7  ! 345: WRPR_TPC_I	wrpr	%r20, 0x01f7, %tpc
	.word 0xb3500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0xba04215d  ! 349: ADD_I	add 	%r16, 0x015d, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb32c7001  ! 357: SLLX_I	sllx	%r17, 0x0001, %r25
	.word 0xfc45c000  ! 361: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf20da094  ! 362: LDUB_I	ldub	[%r22 + 0x0094], %r25
	.word 0x8d94e182  ! 363: WRPR_PSTATE_I	wrpr	%r19, 0x0182, %pstate
	.word 0x8995e0c7  ! 364: WRPR_TICK_I	wrpr	%r23, 0x00c7, %tick
	setx	0x20339, %g1, %o0
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
	.word 0x8995202d  ! 378: WRPR_TICK_I	wrpr	%r20, 0x002d, %tick
	.word 0xf8048000  ! 382: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0x91946128  ! 383: WRPR_PIL_I	wrpr	%r17, 0x0128, %pil
	.word 0xf014a124  ! 388: LDUH_I	lduh	[%r18 + 0x0124], %r24
	.word 0xf25521e0  ! 390: LDSH_I	ldsh	[%r20 + 0x01e0], %r25
	.word 0xf814a1a0  ! 392: LDUH_I	lduh	[%r18 + 0x01a0], %r28
	.word 0x8195e1d8  ! 395: WRPR_TPC_I	wrpr	%r23, 0x01d8, %tpc
	.word 0xf25d6016  ! 397: LDX_I	ldx	[%r21 + 0x0016], %r25
	.word 0xf01cc000  ! 398: LDD_R	ldd	[%r19 + %r0], %r24
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0x8795e0e1  ! 411: WRPR_TT_I	wrpr	%r23, 0x00e1, %tt
	.word 0xfe45e044  ! 414: LDSW_I	ldsw	[%r23 + 0x0044], %r31
	.word 0xbac5c000  ! 418: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0xfe1d61b8  ! 420: LDD_I	ldd	[%r21 + 0x01b8], %r31
	.word 0xf214211d  ! 423: LDUH_I	lduh	[%r16 + 0x011d], %r25
	.word 0xfd1d8000  ! 424: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xb12d5000  ! 428: SLLX_R	sllx	%r21, %r0, %r24
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf804e1a8  ! 436: LDUW_I	lduw	[%r19 + 0x01a8], %r28
	.word 0xb6958000  ! 437: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0x8994e11d  ! 439: WRPR_TICK_I	wrpr	%r19, 0x011d, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	.word 0xf6448000  ! 443: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf44ce05a  ! 444: LDSB_I	ldsb	[%r19 + 0x005a], %r26
	.word 0xfc0d614f  ! 448: LDUB_I	ldub	[%r21 + 0x014f], %r30
	.word 0xb351c000  ! 450: RDPR_TL	rdpr	%tl, %r25
	.word 0xf4152084  ! 451: LDUH_I	lduh	[%r20 + 0x0084], %r26
	.word 0xf00d8000  ! 458: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xf2450000  ! 464: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xf85c8000  ! 468: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb53dc000  ! 469: SRA_R	sra 	%r23, %r0, %r26
	.word 0x9195a109  ! 470: WRPR_PIL_I	wrpr	%r22, 0x0109, %pil
	.word 0xf04c4000  ! 471: LDSB_R	ldsb	[%r17 + %r0], %r24
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41ca0d0  ! 474: LDD_I	ldd	[%r18 + 0x00d0], %r26
	.word 0xb5508000  ! 475: RDPR_TSTATE	<illegal instruction>
	.word 0xfa5421bc  ! 476: LDSH_I	ldsh	[%r16 + 0x01bc], %r29
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5cc000  ! 481: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb5518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0x8395a0d5  ! 486: WRPR_TNPC_I	wrpr	%r22, 0x00d5, %tnpc
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1d0000  ! 489: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xf84de073  ! 490: LDSB_I	ldsb	[%r23 + 0x0073], %r28
	.word 0xf844e0ee  ! 491: LDSW_I	ldsw	[%r19 + 0x00ee], %r28
	.word 0xfc05a141  ! 494: LDUW_I	lduw	[%r22 + 0x0141], %r30
	.word 0xbb480000  ! 498: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf24da108  ! 503: LDSB_I	ldsb	[%r22 + 0x0108], %r25
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	.word 0xf404e0a3  ! 507: LDUW_I	lduw	[%r19 + 0x00a3], %r26
	.word 0xf25dc000  ! 510: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xfc5ce073  ! 512: LDX_I	ldx	[%r19 + 0x0073], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982e41  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xf6458000  ! 514: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf6454000  ! 515: LDSW_R	ldsw	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf84d2048  ! 517: LDSB_I	ldsb	[%r20 + 0x0048], %r28
	.word 0xbd510000  ! 521: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0xfd1da019  ! 526: LDDF_I	ldd	[%r22, 0x0019], %f30
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01d2021  ! 530: LDD_I	ldd	[%r20 + 0x0021], %r24
	.word 0xb49d8000  ! 533: XORcc_R	xorcc 	%r22, %r0, %r26
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf815a1fa  ! 538: LDUH_I	lduh	[%r22 + 0x01fa], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f932000  ! 541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2c44000  ! 552: ADDCcc_R	addccc 	%r17, %r0, %r25
	.word 0xfe0c8000  ! 554: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfc0da06a  ! 558: LDUB_I	ldub	[%r22 + 0x006a], %r30
	.word 0xbd504000  ! 559: RDPR_TNPC	<illegal instruction>
	.word 0xfa044000  ! 562: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf11dc000  ! 563: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf40460b6  ! 565: LDUW_I	lduw	[%r17 + 0x00b6], %r26
	.word 0xb92c1000  ! 566: SLLX_R	sllx	%r16, %r0, %r28
	.word 0x8395a11e  ! 568: WRPR_TNPC_I	wrpr	%r22, 0x011e, %tnpc
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8054000  ! 570: LDUW_R	lduw	[%r21 + %r0], %r28
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcb4e049  ! 577: SUBCcc_I	orncc 	%r19, 0x0049, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982ddb  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddb, %hpstate
	.word 0xf81d217c  ! 581: LDD_I	ldd	[%r20 + 0x017c], %r28
	.word 0xfe0dc000  ! 583: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xfe046186  ! 589: LDUW_I	lduw	[%r17 + 0x0186], %r31
	.word 0x83946092  ! 590: WRPR_TNPC_I	wrpr	%r17, 0x0092, %tnpc
	.word 0xb21421fa  ! 591: OR_I	or 	%r16, 0x01fa, %r25
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04da1a1  ! 593: LDSB_I	ldsb	[%r22 + 0x01a1], %r24
	.word 0xf654a0a8  ! 594: LDSH_I	ldsh	[%r18 + 0x00a8], %r27
	mov	2, %r14
	.word 0xa193a000  ! 598: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1510000  ! 601: RDPR_TICK	<illegal instruction>
	.word 0xb085c000  ! 602: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xfe4ce18c  ! 603: LDSB_I	ldsb	[%r19 + 0x018c], %r31
	.word 0xf45460fc  ! 605: LDSH_I	ldsh	[%r17 + 0x00fc], %r26
	.word 0xfc5d6151  ! 606: LDX_I	ldx	[%r21 + 0x0151], %r30
	.word 0x87942031  ! 607: WRPR_TT_I	wrpr	%r16, 0x0031, %tt
	.word 0xb53d5000  ! 608: SRAX_R	srax	%r21, %r0, %r26
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e094  ! 612: WRPR_TICK_I	wrpr	%r19, 0x0094, %tick
	.word 0xbb480000  ! 614: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb40c4000  ! 616: AND_R	and 	%r17, %r0, %r26
	.word 0xbd504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xbb345000  ! 621: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xfe55606b  ! 623: LDSH_I	ldsh	[%r21 + 0x006b], %r31
	.word 0xb751c000  ! 627: RDPR_TL	<illegal instruction>
	.word 0xfe4c4000  ! 629: LDSB_R	ldsb	[%r17 + %r0], %r31
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba35e16d  ! 633: ORN_I	orn 	%r23, 0x016d, %r29
	.word 0x8d94e0fc  ! 635: WRPR_PSTATE_I	wrpr	%r19, 0x00fc, %pstate
	.word 0xf81c60d6  ! 636: LDD_I	ldd	[%r17 + 0x00d6], %r28
	.word 0xf4144000  ! 637: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf20de131  ! 640: LDUB_I	ldub	[%r23 + 0x0131], %r25
	.word 0xb7500000  ! 644: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45d6023  ! 646: LDX_I	ldx	[%r21 + 0x0023], %r26
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4da0e0  ! 650: LDSB_I	ldsb	[%r22 + 0x00e0], %r29
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 662: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xb89ca192  ! 663: XORcc_I	xorcc 	%r18, 0x0192, %r28
	.word 0x89956117  ! 669: WRPR_TICK_I	wrpr	%r21, 0x0117, %tick
	.word 0xf64d200d  ! 672: LDSB_I	ldsb	[%r20 + 0x000d], %r27
	setx	data_start_0, %g1, %r19
	.word 0xfc154000  ! 678: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xba946119  ! 683: ORcc_I	orcc 	%r17, 0x0119, %r29
	.word 0xf25c60ef  ! 684: LDX_I	ldx	[%r17 + 0x00ef], %r25
	.word 0xbb7d8400  ! 686: MOVR_R	movre	%r22, %r0, %r29
	.word 0xf81c4000  ! 687: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xf25cc000  ! 688: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf6548000  ! 691: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0x8d94e1a6  ! 692: WRPR_PSTATE_I	wrpr	%r19, 0x01a6, %pstate
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6044000  ! 695: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0x8d956034  ! 696: WRPR_PSTATE_I	wrpr	%r21, 0x0034, %pstate
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879520fa  ! 699: WRPR_TT_I	wrpr	%r20, 0x00fa, %tt
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 707: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe1d6173  ! 708: LDD_I	ldd	[%r21 + 0x0173], %r31
	.word 0xfe0c0000  ! 712: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf24c21e7  ! 717: LDSB_I	ldsb	[%r16 + 0x01e7], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982913  ! 718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0913, %hpstate
	.word 0xf91c0000  ! 719: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xf055a05f  ! 720: LDSH_I	ldsh	[%r22 + 0x005f], %r24
	.word 0xbebc8000  ! 721: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0xf2548000  ! 726: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xfa5c8000  ! 727: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0x919460d3  ! 728: WRPR_PIL_I	wrpr	%r17, 0x00d3, %pil
	.word 0xb950c000  ! 733: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 738: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb357001  ! 740: SRLX_I	srlx	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf054e1b1  ! 746: LDSH_I	ldsh	[%r19 + 0x01b1], %r24
	.word 0xb4348000  ! 747: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xf8458000  ! 748: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf415c000  ! 749: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xb1504000  ! 750: RDPR_TNPC	<illegal instruction>
	.word 0xfe55c000  ! 756: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xfa5cc000  ! 757: LDX_R	ldx	[%r19 + %r0], %r29
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5460da  ! 760: LDSH_I	ldsh	[%r17 + 0x00da], %r31
	.word 0xf80dc000  ! 763: LDUB_R	ldub	[%r23 + %r0], %r28
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00c60f6  ! 771: LDUB_I	ldub	[%r17 + 0x00f6], %r24
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc44208b  ! 778: LDSW_I	ldsw	[%r16 + 0x008b], %r30
	.word 0xf71d217b  ! 783: LDDF_I	ldd	[%r20, 0x017b], %f27
	.word 0x8d9521bc  ! 784: WRPR_PSTATE_I	wrpr	%r20, 0x01bc, %pstate
	.word 0xfe5dc000  ! 791: LDX_R	ldx	[%r23 + %r0], %r31
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244c000  ! 797: LDSW_R	ldsw	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5c21f2  ! 801: LDX_I	ldx	[%r16 + 0x01f2], %r31
	.word 0xf444601c  ! 802: LDSW_I	ldsw	[%r17 + 0x001c], %r26
	.word 0xff1ca1f0  ! 803: LDDF_I	ldd	[%r18, 0x01f0], %f31
	.word 0xb4344000  ! 804: ORN_R	orn 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf04de150  ! 807: LDSB_I	ldsb	[%r23 + 0x0150], %r24
	.word 0xf40ca05e  ! 808: LDUB_I	ldub	[%r18 + 0x005e], %r26
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	.word 0xb3504000  ! 812: RDPR_TNPC	rdpr	%tnpc, %r25
	setx	0x135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa558000  ! 817: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb950c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0xf8554000  ! 825: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfc4da16a  ! 826: LDSB_I	ldsb	[%r22 + 0x016a], %r30
	.word 0xf25da07d  ! 829: LDX_I	ldx	[%r22 + 0x007d], %r25
	.word 0xfc5c4000  ! 830: LDX_R	ldx	[%r17 + %r0], %r30
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc54e0aa  ! 833: LDSH_I	ldsh	[%r19 + 0x00aa], %r30
	.word 0xf31cc000  ! 834: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf814216f  ! 835: LDUH_I	lduh	[%r16 + 0x016f], %r28
	.word 0xb0050000  ! 843: ADD_R	add 	%r20, %r0, %r24
	.word 0xfe546195  ! 849: LDSH_I	ldsh	[%r17 + 0x0195], %r31
	.word 0xfa14612f  ! 851: LDUH_I	lduh	[%r17 + 0x012f], %r29
	.word 0xf40d21e4  ! 852: LDUB_I	ldub	[%r20 + 0x01e4], %r26
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65da1bc  ! 854: LDX_I	ldx	[%r22 + 0x01bc], %r27
	.word 0xb4bc0000  ! 856: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xf0154000  ! 861: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xb351c000  ! 862: RDPR_TL	<illegal instruction>
	.word 0xf21ca00b  ! 866: LDD_I	ldd	[%r18 + 0x000b], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0xbe1d2153  ! 873: XOR_I	xor 	%r20, 0x0153, %r31
	.word 0xf44ca01c  ! 876: LDSB_I	ldsb	[%r18 + 0x001c], %r26
	.word 0xb1540000  ! 878: RDPR_GL	<illegal instruction>
	.word 0x8d9561fd  ! 879: WRPR_PSTATE_I	wrpr	%r21, 0x01fd, %pstate
	.word 0x8994a01c  ! 880: WRPR_TICK_I	wrpr	%r18, 0x001c, %tick
	.word 0xbf51c000  ! 881: RDPR_TL	<illegal instruction>
	.word 0xf81c21ba  ! 885: LDD_I	ldd	[%r16 + 0x01ba], %r28
	.word 0xf4458000  ! 886: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0x879560c6  ! 887: WRPR_TT_I	wrpr	%r21, 0x00c6, %tt
	mov	0, %r12
	.word 0x8f932000  ! 888: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0056197  ! 891: LDUW_I	lduw	[%r21 + 0x0197], %r24
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc8d200a  ! 894: ANDcc_I	andcc 	%r20, 0x000a, %r30
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09d0000  ! 901: XORcc_R	xorcc 	%r20, %r0, %r24
	mov	1, %r14
	.word 0xa193a000  ! 902: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf04cc000  ! 906: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf81da103  ! 907: LDD_I	ldd	[%r22 + 0x0103], %r28
	.word 0xbb2d8000  ! 908: SLL_R	sll 	%r22, %r0, %r29
	.word 0xb60cc000  ! 909: AND_R	and 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0x83946170  ! 918: WRPR_TNPC_I	wrpr	%r17, 0x0170, %tnpc
	.word 0xf64d6160  ! 922: LDSB_I	ldsb	[%r21 + 0x0160], %r27
	.word 0xbf50c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xf00c61b3  ! 928: LDUB_I	ldub	[%r17 + 0x01b3], %r24
	.word 0xbe2de178  ! 930: ANDN_I	andn 	%r23, 0x0178, %r31
	.word 0xbb504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xf24d4000  ! 937: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf6044000  ! 938: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xfe1560a3  ! 939: LDUH_I	lduh	[%r21 + 0x00a3], %r31
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85cc000  ! 945: LDX_R	ldx	[%r19 + %r0], %r28
	setx	data_start_0, %g1, %r17
	.word 0x8995e175  ! 948: WRPR_TICK_I	wrpr	%r23, 0x0175, %tick
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe44a14f  ! 954: LDSW_I	ldsw	[%r18 + 0x014f], %r31
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 960: RDPR_PSTATE	<illegal instruction>
	.word 0xbf518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xf844c000  ! 965: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xb1520000  ! 967: RDPR_PIL	<illegal instruction>
	.word 0x8994e16e  ! 968: WRPR_TICK_I	wrpr	%r19, 0x016e, %tick
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa14c000  ! 981: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xfe0d615d  ! 982: LDUB_I	ldub	[%r21 + 0x015d], %r31
	.word 0xf20d4000  ! 985: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0x8794e055  ! 987: WRPR_TT_I	wrpr	%r19, 0x0055, %tt
	.word 0x9194a048  ! 991: WRPR_PIL_I	wrpr	%r18, 0x0048, %pil
	.word 0xbf3ca001  ! 994: SRA_I	sra 	%r18, 0x0001, %r31
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xb9540000  ! 1007: RDPR_GL	<illegal instruction>
	.word 0xbd3c2001  ! 1009: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xbe1421c3  ! 1011: OR_I	or 	%r16, 0x01c3, %r31
	.word 0x8d946001  ! 1014: WRPR_PSTATE_I	wrpr	%r17, 0x0001, %pstate
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa550000  ! 1018: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf65dc000  ! 1022: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xfe5d2032  ! 1028: LDX_I	ldx	[%r20 + 0x0032], %r31
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 1030: RDPR_TSTATE	<illegal instruction>
	.word 0xf454c000  ! 1033: LDSH_R	ldsh	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb520000  ! 1037: RDPR_PIL	<illegal instruction>
	.word 0x8d942027  ! 1038: WRPR_PSTATE_I	wrpr	%r16, 0x0027, %pstate
	.word 0xfe5c8000  ! 1040: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xf01dc000  ! 1043: LDD_R	ldd	[%r23 + %r0], %r24
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00c8000  ! 1046: LDUB_R	ldub	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982f91  ! 1052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f91, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x819828cb  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0xb835c000  ! 1063: ORN_R	orn 	%r23, %r0, %r28
	.word 0xfe0ce068  ! 1067: LDUB_I	ldub	[%r19 + 0x0068], %r31
	.word 0xbf480000  ! 1070: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa5d8000  ! 1073: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xb2c4c000  ! 1074: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0x8194208f  ! 1076: WRPR_TPC_I	wrpr	%r16, 0x008f, %tpc
	setx	data_start_5, %g1, %r16
	.word 0xb7510000  ! 1080: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf20c8000  ! 1081: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0x9195a0b6  ! 1083: WRPR_PIL_I	wrpr	%r22, 0x00b6, %pil
	.word 0xfe0d20c7  ! 1090: LDUB_I	ldub	[%r20 + 0x00c7], %r31
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64ca1f7  ! 1093: LDSB_I	ldsb	[%r18 + 0x01f7], %r27
	.word 0xb3518000  ! 1094: RDPR_PSTATE	<illegal instruction>
	.word 0xf405c000  ! 1099: LDUW_R	lduw	[%r23 + %r0], %r26
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0xf20521ca  ! 1102: LDUW_I	lduw	[%r20 + 0x01ca], %r25
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c21a3  ! 1107: LDDF_I	ldd	[%r16, 0x01a3], %f31
	.word 0xfc14e184  ! 1108: LDUH_I	lduh	[%r19 + 0x0184], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982f41  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983e1b  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1b, %hpstate
	.word 0xf6050000  ! 1115: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xfe5d8000  ! 1116: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xfe1d211d  ! 1119: LDD_I	ldd	[%r20 + 0x011d], %r31
	.word 0xf71c6054  ! 1121: LDDF_I	ldd	[%r17, 0x0054], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xb2444000  ! 1133: ADDC_R	addc 	%r17, %r0, %r25
	.word 0x83956154  ! 1134: WRPR_TNPC_I	wrpr	%r21, 0x0154, %tnpc
	.word 0xf81dc000  ! 1136: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xb1518000  ! 1140: RDPR_PSTATE	<illegal instruction>
	.word 0xf2146083  ! 1143: LDUH_I	lduh	[%r17 + 0x0083], %r25
	.word 0xf05520bd  ! 1147: LDSH_I	ldsh	[%r20 + 0x00bd], %r24
	mov	0, %r12
	.word 0x8f932000  ! 1149: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3508000  ! 1150: RDPR_TSTATE	<illegal instruction>
	.word 0xf24d219a  ! 1151: LDSB_I	ldsb	[%r20 + 0x019a], %r25
	.word 0xfe148000  ! 1153: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf01520b9  ! 1154: LDUH_I	lduh	[%r20 + 0x00b9], %r24
	.word 0xf71cc000  ! 1164: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xf84ca0c0  ! 1165: LDSB_I	ldsb	[%r18 + 0x00c0], %r28
	.word 0xb751c000  ! 1167: RDPR_TL	<illegal instruction>
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d0000  ! 1175: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xf91d8000  ! 1176: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xb550c000  ! 1178: RDPR_TT	<illegal instruction>
	.word 0xbd2dd000  ! 1186: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xbb50c000  ! 1188: RDPR_TT	<illegal instruction>
	.word 0x85952109  ! 1190: WRPR_TSTATE_I	wrpr	%r20, 0x0109, %tstate
	.word 0xf11d61a9  ! 1191: LDDF_I	ldd	[%r21, 0x01a9], %f24
	.word 0xfc1cc000  ! 1193: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xfe44c000  ! 1196: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xbd518000  ! 1197: RDPR_PSTATE	<illegal instruction>
	.word 0x8d95a122  ! 1198: WRPR_PSTATE_I	wrpr	%r22, 0x0122, %pstate
	.word 0xfa054000  ! 1201: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xf8558000  ! 1202: LDSH_R	ldsh	[%r22 + %r0], %r28
	setx	0x30109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2150000  ! 1205: OR_R	or 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0xf45c8000  ! 1218: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb68d2134  ! 1219: ANDcc_I	andcc 	%r20, 0x0134, %r27
	.word 0xf8052109  ! 1220: LDUW_I	lduw	[%r20 + 0x0109], %r28
	.word 0xb3510000  ! 1224: RDPR_TICK	<illegal instruction>
	.word 0xfe4520e6  ! 1225: LDSW_I	ldsw	[%r20 + 0x00e6], %r31
	.word 0xf24d6087  ! 1226: LDSB_I	ldsb	[%r21 + 0x0087], %r25
	.word 0xf05c8000  ! 1228: LDX_R	ldx	[%r18 + %r0], %r24
	setx	data_start_6, %g1, %r16
	.word 0xf11c201f  ! 1231: LDDF_I	ldd	[%r16, 0x001f], %f24
	.word 0xfd1c4000  ! 1233: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xf6044000  ! 1234: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xfe452184  ! 1235: LDSW_I	ldsw	[%r20 + 0x0184], %r31
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 1246: RDPR_TSTATE	<illegal instruction>
	.word 0xf80d6145  ! 1248: LDUB_I	ldub	[%r21 + 0x0145], %r28
	.word 0xbd510000  ! 1249: RDPR_TICK	<illegal instruction>
	.word 0xf4554000  ! 1250: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf05de1c1  ! 1251: LDX_I	ldx	[%r23 + 0x01c1], %r24
	.word 0xbea54000  ! 1252: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xb7540000  ! 1254: RDPR_GL	<illegal instruction>
	.word 0x85946021  ! 1255: WRPR_TSTATE_I	wrpr	%r17, 0x0021, %tstate
	.word 0x8195e14e  ! 1259: WRPR_TPC_I	wrpr	%r23, 0x014e, %tpc
	mov	2, %r14
	.word 0xa193a000  ! 1260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb08de0c8  ! 1261: ANDcc_I	andcc 	%r23, 0x00c8, %r24
	.word 0xf41420d6  ! 1262: LDUH_I	lduh	[%r16 + 0x00d6], %r26
	.word 0xf05521c3  ! 1263: LDSH_I	ldsh	[%r20 + 0x01c3], %r24
	.word 0xf6048000  ! 1264: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb7510000  ! 1267: RDPR_TICK	<illegal instruction>
	.word 0xf2144000  ! 1271: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xbc15c000  ! 1273: OR_R	or 	%r23, %r0, %r30
	.word 0xfe44a15e  ! 1278: LDSW_I	ldsw	[%r18 + 0x015e], %r31
	.word 0x8195e1b1  ! 1279: WRPR_TPC_I	wrpr	%r23, 0x01b1, %tpc
	.word 0xf71d6056  ! 1280: LDDF_I	ldd	[%r21, 0x0056], %f27
	.word 0xfe154000  ! 1282: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf11d6076  ! 1285: LDDF_I	ldd	[%r21, 0x0076], %f24
	.word 0xf00ca075  ! 1286: LDUB_I	ldub	[%r18 + 0x0075], %r24
	.word 0xb445a1db  ! 1289: ADDC_I	addc 	%r22, 0x01db, %r26
	.word 0xb8142152  ! 1293: OR_I	or 	%r16, 0x0152, %r28
	setx	0x1012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 1296: RDPR_TPC	<illegal instruction>
	.word 0xfa0ce1ef  ! 1301: LDUB_I	ldub	[%r19 + 0x01ef], %r29
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4cc000  ! 1307: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xf85d2164  ! 1308: LDX_I	ldx	[%r20 + 0x0164], %r28
	.word 0xf454e038  ! 1309: LDSH_I	ldsh	[%r19 + 0x0038], %r26
	.word 0xf20d8000  ! 1311: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xb1504000  ! 1313: RDPR_TNPC	<illegal instruction>
	.word 0x8d946112  ! 1316: WRPR_PSTATE_I	wrpr	%r17, 0x0112, %pstate
	.word 0xf21de03c  ! 1318: LDD_I	ldd	[%r23 + 0x003c], %r25
	.word 0xfa44210d  ! 1320: LDSW_I	ldsw	[%r16 + 0x010d], %r29
	.word 0xf615c000  ! 1323: LDUH_R	lduh	[%r23 + %r0], %r27
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 1325: RDPR_PSTATE	<illegal instruction>
	.word 0xb2040000  ! 1328: ADD_R	add 	%r16, %r0, %r25
	.word 0xf44d6115  ! 1335: LDSB_I	ldsb	[%r21 + 0x0115], %r26
	.word 0xfc544000  ! 1337: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf805c000  ! 1346: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfe5461b8  ! 1348: LDSH_I	ldsh	[%r17 + 0x01b8], %r31
	.word 0xf444a1f3  ! 1349: LDSW_I	ldsw	[%r18 + 0x01f3], %r26
	.word 0xfe0420f0  ! 1352: LDUW_I	lduw	[%r16 + 0x00f0], %r31
	.word 0xf21d214e  ! 1354: LDD_I	ldd	[%r20 + 0x014e], %r25
	.word 0xfc4d60f6  ! 1357: LDSB_I	ldsb	[%r21 + 0x00f6], %r30
	.word 0xb53c4000  ! 1358: SRA_R	sra 	%r17, %r0, %r26
	.word 0xf65420bc  ! 1359: LDSH_I	ldsh	[%r16 + 0x00bc], %r27
	.word 0xfa1ce05b  ! 1361: LDD_I	ldd	[%r19 + 0x005b], %r29
	.word 0xf41461a4  ! 1363: LDUH_I	lduh	[%r17 + 0x01a4], %r26
	.word 0xbd540000  ! 1368: RDPR_GL	<illegal instruction>
	.word 0xf8140000  ! 1369: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf64d60b2  ! 1370: LDSB_I	ldsb	[%r21 + 0x00b2], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 1372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92ce001  ! 1376: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xbf2da001  ! 1377: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xb32c9000  ! 1381: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xb21d4000  ! 1386: XOR_R	xor 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983ad3  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad3, %hpstate
	.word 0xf015c000  ! 1388: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xfa0d6095  ! 1390: LDUB_I	ldub	[%r21 + 0x0095], %r29
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5dc000  ! 1393: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf11c4000  ! 1401: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xfc1ce11c  ! 1403: LDD_I	ldd	[%r19 + 0x011c], %r30
	.word 0xb9480000  ! 1404: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	2, %r14
	.word 0xa193a000  ! 1405: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc5da0d0  ! 1406: LDX_I	ldx	[%r22 + 0x00d0], %r30
	.word 0xf11d4000  ! 1413: LDDF_R	ldd	[%r21, %r0], %f24
	mov	2, %r14
	.word 0xa193a000  ! 1414: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa050000  ! 1416: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf6054000  ! 1418: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf644c000  ! 1424: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xb13c7001  ! 1426: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xf04d0000  ! 1427: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf41560cd  ! 1429: LDUH_I	lduh	[%r21 + 0x00cd], %r26
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 1434: RDPR_PSTATE	<illegal instruction>
	.word 0xfe0ca0c5  ! 1435: LDUB_I	ldub	[%r18 + 0x00c5], %r31
	.word 0xfa54e160  ! 1436: LDSH_I	ldsh	[%r19 + 0x0160], %r29
	.word 0xf11ce0fc  ! 1439: LDDF_I	ldd	[%r19, 0x00fc], %f24
	.word 0xb0a4a1a7  ! 1442: SUBcc_I	subcc 	%r18, 0x01a7, %r24
	.word 0xb22de1db  ! 1445: ANDN_I	andn 	%r23, 0x01db, %r25
	.word 0xbd50c000  ! 1447: RDPR_TT	<illegal instruction>
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819420da  ! 1450: WRPR_TPC_I	wrpr	%r16, 0x00da, %tpc
	.word 0xb534d000  ! 1451: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xbb480000  ! 1452: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf25da182  ! 1455: LDX_I	ldx	[%r22 + 0x0182], %r25
	.word 0xf0044000  ! 1457: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xb9518000  ! 1458: RDPR_PSTATE	<illegal instruction>
	.word 0xf245e0b6  ! 1465: LDSW_I	ldsw	[%r23 + 0x00b6], %r25
	.word 0xfe45c000  ! 1466: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xb7480000  ! 1469: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf41de1f5  ! 1475: LDD_I	ldd	[%r23 + 0x01f5], %r26
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0da042  ! 1479: LDUB_I	ldub	[%r22 + 0x0042], %r31
	mov	0, %r12
	.word 0x8f932000  ! 1486: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8194607b  ! 1488: WRPR_TPC_I	wrpr	%r17, 0x007b, %tpc
	.word 0xf654c000  ! 1489: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0x899520b0  ! 1490: WRPR_TICK_I	wrpr	%r20, 0x00b0, %tick
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6154000  ! 1498: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf04ce1a4  ! 1499: LDSB_I	ldsb	[%r19 + 0x01a4], %r24
	setx	data_start_6, %g1, %r18
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa450000  ! 1511: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0x8d94615f  ! 1515: WRPR_PSTATE_I	wrpr	%r17, 0x015f, %pstate
	.word 0xf20de1a6  ! 1517: LDUB_I	ldub	[%r23 + 0x01a6], %r25
	.word 0xf64de103  ! 1518: LDSB_I	ldsb	[%r23 + 0x0103], %r27
	mov	0, %r12
	.word 0x8f932000  ! 1519: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc0c4000  ! 1520: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf21cc000  ! 1523: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xf8442187  ! 1524: LDSW_I	ldsw	[%r16 + 0x0187], %r28
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01420fb  ! 1530: LDUH_I	lduh	[%r16 + 0x00fb], %r24
	.word 0xf8144000  ! 1531: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xb7344000  ! 1532: SRL_R	srl 	%r17, %r0, %r27
	.word 0xf815606d  ! 1534: LDUH_I	lduh	[%r21 + 0x006d], %r28
	.word 0xf4054000  ! 1535: LDUW_R	lduw	[%r21 + %r0], %r26
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xf84ce069  ! 1539: LDSB_I	ldsb	[%r19 + 0x0069], %r28
	.word 0xf454a064  ! 1543: LDSH_I	ldsh	[%r18 + 0x0064], %r26
	.word 0xfc44c000  ! 1546: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xbaadc000  ! 1547: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xb92dc000  ! 1549: SLL_R	sll 	%r23, %r0, %r28
	.word 0x859520b4  ! 1553: WRPR_TSTATE_I	wrpr	%r20, 0x00b4, %tstate
	.word 0xbe2c4000  ! 1558: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xf654c000  ! 1559: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf404e004  ! 1565: LDUW_I	lduw	[%r19 + 0x0004], %r26
	.word 0xb534e001  ! 1566: SRL_I	srl 	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f09  ! 1569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f09, %hpstate
	.word 0xb6bc20bf  ! 1570: XNORcc_I	xnorcc 	%r16, 0x00bf, %r27
	.word 0xb0a4a0ff  ! 1571: SUBcc_I	subcc 	%r18, 0x00ff, %r24
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 1574: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xfc44e177  ! 1575: LDSW_I	ldsw	[%r19 + 0x0177], %r30
	.word 0xf81d0000  ! 1576: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf405e1d9  ! 1577: LDUW_I	lduw	[%r23 + 0x01d9], %r26
	.word 0x89942011  ! 1581: WRPR_TICK_I	wrpr	%r16, 0x0011, %tick
	.word 0xf71dc000  ! 1586: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xf00c206a  ! 1587: LDUB_I	ldub	[%r16 + 0x006a], %r24
	.word 0xfd1d4000  ! 1590: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xb1500000  ! 1596: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfa1de042  ! 1597: LDD_I	ldd	[%r23 + 0x0042], %r29
	.word 0xf444a19b  ! 1602: LDSW_I	ldsw	[%r18 + 0x019b], %r26
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91de04d  ! 1611: LDDF_I	ldd	[%r23, 0x004d], %f28
	.word 0xb9518000  ! 1612: RDPR_PSTATE	<illegal instruction>
	.word 0xfa4d0000  ! 1614: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xb151c000  ! 1615: RDPR_TL	<illegal instruction>
	.word 0xfe0dc000  ! 1619: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xf2450000  ! 1620: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xb1500000  ! 1621: RDPR_TPC	<illegal instruction>
	.word 0x8595a051  ! 1622: WRPR_TSTATE_I	wrpr	%r22, 0x0051, %tstate
	mov	0, %r14
	.word 0xa193a000  ! 1630: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0044000  ! 1632: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xf85c0000  ! 1633: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xb28d4000  ! 1634: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xfa4d8000  ! 1636: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0x8994a15a  ! 1642: WRPR_TICK_I	wrpr	%r18, 0x015a, %tick
	.word 0xf25de1f2  ! 1658: LDX_I	ldx	[%r23 + 0x01f2], %r25
	mov	1, %r14
	.word 0xa193a000  ! 1659: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9540000  ! 1660: RDPR_GL	<illegal instruction>
	.word 0xfa554000  ! 1661: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf85da0d8  ! 1662: LDX_I	ldx	[%r22 + 0x00d8], %r28
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 1666: RDPR_PSTATE	<illegal instruction>
	.word 0xf41c6126  ! 1667: LDD_I	ldd	[%r17 + 0x0126], %r26
	.word 0xf60c20fb  ! 1668: LDUB_I	ldub	[%r16 + 0x00fb], %r27
	.word 0xf405c000  ! 1669: LDUW_R	lduw	[%r23 + %r0], %r26
	mov	2, %r14
	.word 0xa193a000  ! 1670: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf44c8000  ! 1674: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0x85952099  ! 1675: WRPR_TSTATE_I	wrpr	%r20, 0x0099, %tstate
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa548000  ! 1679: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xb61d8000  ! 1681: XOR_R	xor 	%r22, %r0, %r27
	.word 0xf614e135  ! 1685: LDUH_I	lduh	[%r19 + 0x0135], %r27
	.word 0xbf2d4000  ! 1688: SLL_R	sll 	%r21, %r0, %r31
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xfa5da1d9  ! 1691: LDX_I	ldx	[%r22 + 0x01d9], %r29
	.word 0xb0254000  ! 1693: SUB_R	sub 	%r21, %r0, %r24
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1696: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa054000  ! 1698: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xb72cd000  ! 1699: SLLX_R	sllx	%r19, %r0, %r27
	.word 0x8d946088  ! 1701: WRPR_PSTATE_I	wrpr	%r17, 0x0088, %pstate
	.word 0xf44c8000  ! 1703: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xb7480000  ! 1704: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d9461f4  ! 1708: WRPR_PSTATE_I	wrpr	%r17, 0x01f4, %pstate
	.word 0xfc5561bb  ! 1709: LDSH_I	ldsh	[%r21 + 0x01bb], %r30
	.word 0xfe1c0000  ! 1712: LDD_R	ldd	[%r16 + %r0], %r31
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8b5608c  ! 1721: SUBCcc_I	orncc 	%r21, 0x008c, %r28
	.word 0xf6144000  ! 1723: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf00de0e3  ! 1725: LDUB_I	ldub	[%r23 + 0x00e3], %r24
	.word 0xf91c4000  ! 1726: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xfe550000  ! 1727: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf0448000  ! 1731: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xfa148000  ! 1732: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb6040000  ! 1737: ADD_R	add 	%r16, %r0, %r27
	.word 0xfa1ca1db  ! 1740: LDD_I	ldd	[%r18 + 0x01db], %r29
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6054000  ! 1746: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf0140000  ! 1747: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb9480000  ! 1748: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbd2d0000  ! 1754: SLL_R	sll 	%r20, %r0, %r30
	.word 0xbf500000  ! 1756: RDPR_TPC	<illegal instruction>
	.word 0xf04d209f  ! 1758: LDSB_I	ldsb	[%r20 + 0x009f], %r24
	.word 0xb5345000  ! 1759: SRLX_R	srlx	%r17, %r0, %r26
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a054  ! 1761: WRPR_TICK_I	wrpr	%r22, 0x0054, %tick
	.word 0xf65c6103  ! 1763: LDX_I	ldx	[%r17 + 0x0103], %r27
	.word 0xf6054000  ! 1764: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf0048000  ! 1769: LDUW_R	lduw	[%r18 + %r0], %r24
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0xf215a058  ! 1777: LDUH_I	lduh	[%r22 + 0x0058], %r25
	.word 0xfc5c208d  ! 1781: LDX_I	ldx	[%r16 + 0x008d], %r30
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2cc000  ! 1783: SLL_R	sll 	%r19, %r0, %r29
	.word 0x81952181  ! 1784: WRPR_TPC_I	wrpr	%r20, 0x0181, %tpc
	.word 0xb93d6001  ! 1790: SRA_I	sra 	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983f89  ! 1791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f89, %hpstate
	.word 0xfc556123  ! 1793: LDSH_I	ldsh	[%r21 + 0x0123], %r30
	.word 0x839461ab  ! 1795: WRPR_TNPC_I	wrpr	%r17, 0x01ab, %tnpc
	.word 0x89956108  ! 1803: WRPR_TICK_I	wrpr	%r21, 0x0108, %tick
	.word 0xb7500000  ! 1806: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 1808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0x8194a1f1  ! 1812: WRPR_TPC_I	wrpr	%r18, 0x01f1, %tpc
	.word 0xfc0561c8  ! 1815: LDUW_I	lduw	[%r21 + 0x01c8], %r30
	.word 0xb2a46055  ! 1817: SUBcc_I	subcc 	%r17, 0x0055, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983ed9  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed9, %hpstate
	.word 0xf05d61bd  ! 1819: LDX_I	ldx	[%r21 + 0x01bd], %r24
	.word 0xf61c4000  ! 1821: LDD_R	ldd	[%r17 + %r0], %r27
	setx	data_start_5, %g1, %r18
	.word 0xfe0d61fc  ! 1824: LDUB_I	ldub	[%r21 + 0x01fc], %r31
	.word 0x899421d2  ! 1826: WRPR_TICK_I	wrpr	%r16, 0x01d2, %tick
	.word 0xb8144000  ! 1828: OR_R	or 	%r17, %r0, %r28
	.word 0x8995e111  ! 1829: WRPR_TICK_I	wrpr	%r23, 0x0111, %tick
	.word 0xf11d611e  ! 1831: LDDF_I	ldd	[%r21, 0x011e], %f24
	.word 0xf85c4000  ! 1832: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf65c0000  ! 1833: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xb5504000  ! 1836: RDPR_TNPC	<illegal instruction>
	.word 0xfc0d20cb  ! 1837: LDUB_I	ldub	[%r20 + 0x00cb], %r30
	mov	0, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb351c000  ! 1846: RDPR_TL	rdpr	%tl, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf414e17c  ! 1851: LDUH_I	lduh	[%r19 + 0x017c], %r26
	.word 0xbcad0000  ! 1853: ANDNcc_R	andncc 	%r20, %r0, %r30
	.word 0xfa1d4000  ! 1855: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xfc1d4000  ! 1857: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xbd51c000  ! 1860: RDPR_TL	<illegal instruction>
	.word 0xfc5da145  ! 1862: LDX_I	ldx	[%r22 + 0x0145], %r30
	.word 0xf71ca09e  ! 1865: LDDF_I	ldd	[%r18, 0x009e], %f27
	.word 0xfa450000  ! 1866: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf8044000  ! 1867: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf414c000  ! 1868: LDUH_R	lduh	[%r19 + %r0], %r26
	mov	0, %r14
	.word 0xa193a000  ! 1869: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf045e138  ! 1872: LDSW_I	ldsw	[%r23 + 0x0138], %r24
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23da19d  ! 1880: XNOR_I	xnor 	%r22, 0x019d, %r25
	.word 0xf45c8000  ! 1881: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb5520000  ! 1893: RDPR_PIL	<illegal instruction>
	.word 0xb550c000  ! 1895: RDPR_TT	<illegal instruction>
	.word 0xf405208e  ! 1905: LDUW_I	lduw	[%r20 + 0x008e], %r26
	.word 0xf85c61a5  ! 1907: LDX_I	ldx	[%r17 + 0x01a5], %r28
	.word 0xb9540000  ! 1911: RDPR_GL	<illegal instruction>
	.word 0xb73c0000  ! 1913: SRA_R	sra 	%r16, %r0, %r27
	.word 0xfe5c0000  ! 1917: LDX_R	ldx	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 1920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xb7508000  ! 1921: RDPR_TSTATE	<illegal instruction>
	.word 0xf20ca056  ! 1923: LDUB_I	ldub	[%r18 + 0x0056], %r25
	.word 0xf81c0000  ! 1924: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xb3480000  ! 1925: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa4dc000  ! 1927: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfc054000  ! 1929: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xbb480000  ! 1930: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe15c000  ! 1932: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf41c8000  ! 1934: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xfa4d606a  ! 1936: LDSB_I	ldsb	[%r21 + 0x006a], %r29
	.word 0xb1518000  ! 1939: RDPR_PSTATE	<illegal instruction>
	.word 0xf8154000  ! 1940: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0x8795612c  ! 1945: WRPR_TT_I	wrpr	%r21, 0x012c, %tt
	.word 0xbec54000  ! 1949: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xfa0c610b  ! 1950: LDUB_I	ldub	[%r17 + 0x010b], %r29
	.word 0xfe5c0000  ! 1952: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf81c8000  ! 1954: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf0554000  ! 1962: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xb9508000  ! 1963: RDPR_TSTATE	<illegal instruction>
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb234a1d5  ! 1965: ORN_I	orn 	%r18, 0x01d5, %r25
	.word 0xf845c000  ! 1969: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xfe5c2197  ! 1970: LDX_I	ldx	[%r16 + 0x0197], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6058000  ! 1974: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0x8995218c  ! 1984: WRPR_TICK_I	wrpr	%r20, 0x018c, %tick
	.word 0xf21c6004  ! 1985: LDD_I	ldd	[%r17 + 0x0004], %r25
	.word 0xb9641800  ! 1987: MOVcc_R	<illegal instruction>
	.word 0xbac5c000  ! 1988: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0x87946185  ! 1991: WRPR_TT_I	wrpr	%r17, 0x0185, %tt
	mov	1, %r14
	.word 0xa193a000  ! 1993: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc5d8000  ! 1994: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf8144000  ! 1998: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xbcac604b  ! 2002: ANDNcc_I	andncc 	%r17, 0x004b, %r30
	.word 0x8d946112  ! 2003: WRPR_PSTATE_I	wrpr	%r17, 0x0112, %pstate
	.word 0xf80c20fe  ! 2005: LDUB_I	ldub	[%r16 + 0x00fe], %r28
	.word 0xb13d4000  ! 2008: SRA_R	sra 	%r21, %r0, %r24
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0258000  ! 2012: SUB_R	sub 	%r22, %r0, %r24
	.word 0x87956122  ! 2013: WRPR_TT_I	wrpr	%r21, 0x0122, %tt
	.word 0x8795205f  ! 2021: WRPR_TT_I	wrpr	%r20, 0x005f, %tt
	.word 0x9195e1e3  ! 2023: WRPR_PIL_I	wrpr	%r23, 0x01e3, %pil
	.word 0xfc54616a  ! 2026: LDSH_I	ldsh	[%r17 + 0x016a], %r30
	.word 0xfc5c20e7  ! 2030: LDX_I	ldx	[%r16 + 0x00e7], %r30
	.word 0xbd50c000  ! 2031: RDPR_TT	<illegal instruction>
	.word 0xf40ca044  ! 2034: LDUB_I	ldub	[%r18 + 0x0044], %r26
	.word 0xbc444000  ! 2035: ADDC_R	addc 	%r17, %r0, %r30
	.word 0xfe4d208c  ! 2036: LDSB_I	ldsb	[%r20 + 0x008c], %r31
	.word 0xf215c000  ! 2039: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xb7480000  ! 2040: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf25c214f  ! 2041: LDX_I	ldx	[%r16 + 0x014f], %r25
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45d2185  ! 2047: LDX_I	ldx	[%r20 + 0x0185], %r26
	.word 0xf6440000  ! 2048: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xf044a1f6  ! 2050: LDSW_I	ldsw	[%r18 + 0x01f6], %r24
	.word 0x819521ff  ! 2051: WRPR_TPC_I	wrpr	%r20, 0x01ff, %tpc
	.word 0xf605206d  ! 2055: LDUW_I	lduw	[%r20 + 0x006d], %r27
	.word 0xf404e097  ! 2058: LDUW_I	lduw	[%r19 + 0x0097], %r26
	.word 0xf60c619b  ! 2060: LDUB_I	ldub	[%r17 + 0x019b], %r27
	.word 0x839420c5  ! 2065: WRPR_TNPC_I	wrpr	%r16, 0x00c5, %tnpc
	.word 0xb60c205b  ! 2066: AND_I	and 	%r16, 0x005b, %r27
	.word 0xbcc4c000  ! 2068: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xfa0c61cd  ! 2069: LDUB_I	ldub	[%r17 + 0x01cd], %r29
	.word 0x8595a0de  ! 2070: WRPR_TSTATE_I	wrpr	%r22, 0x00de, %tstate
	.word 0x8595e09e  ! 2071: WRPR_TSTATE_I	wrpr	%r23, 0x009e, %tstate
	.word 0xf45c21be  ! 2073: LDX_I	ldx	[%r16 + 0x01be], %r26
	.word 0xf2544000  ! 2076: LDSH_R	ldsh	[%r17 + %r0], %r25
	setx	data_start_6, %g1, %r18
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	.word 0xbe2d4000  ! 2095: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xf0548000  ! 2096: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xfe5420c0  ! 2097: LDSH_I	ldsh	[%r16 + 0x00c0], %r31
	.word 0xb750c000  ! 2098: RDPR_TT	<illegal instruction>
	.word 0xfc45a1ed  ! 2099: LDSW_I	ldsw	[%r22 + 0x01ed], %r30
	.word 0xf604c000  ! 2100: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf51d4000  ! 2102: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xb77cc400  ! 2105: MOVR_R	movre	%r19, %r0, %r27
	.word 0xbf520000  ! 2106: RDPR_PIL	<illegal instruction>
	.word 0xbc95a198  ! 2113: ORcc_I	orcc 	%r22, 0x0198, %r30
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe35218a  ! 2116: SUBC_I	orn 	%r20, 0x018a, %r31
	.word 0xf4148000  ! 2119: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfc444000  ! 2122: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0x879421e5  ! 2123: WRPR_TT_I	wrpr	%r16, 0x01e5, %tt
	.word 0xfc452043  ! 2124: LDSW_I	ldsw	[%r20 + 0x0043], %r30
	.word 0xf8540000  ! 2126: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xb33cd000  ! 2131: SRAX_R	srax	%r19, %r0, %r25
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85d603e  ! 2134: LDX_I	ldx	[%r21 + 0x003e], %r28
	.word 0xfa5cc000  ! 2136: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xfe544000  ! 2140: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf4040000  ! 2143: LDUW_R	lduw	[%r16 + %r0], %r26
	setx	0x20103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84420d2  ! 2147: LDSW_I	ldsw	[%r16 + 0x00d2], %r28
	mov	1, %r12
	.word 0x8f932000  ! 2148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994609b  ! 2152: WRPR_TICK_I	wrpr	%r17, 0x009b, %tick
	.word 0xbf3cf001  ! 2153: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0xf05c61cf  ! 2154: LDX_I	ldx	[%r17 + 0x01cf], %r24
	.word 0xfc4d6048  ! 2155: LDSB_I	ldsb	[%r21 + 0x0048], %r30
	.word 0xf6450000  ! 2156: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0x8995e1f1  ! 2160: WRPR_TICK_I	wrpr	%r23, 0x01f1, %tick
	.word 0xfc15e103  ! 2161: LDUH_I	lduh	[%r23 + 0x0103], %r30
	.word 0xf40d4000  ! 2162: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbd540000  ! 2164: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7510000  ! 2178: RDPR_TICK	<illegal instruction>
	.word 0xb3500000  ! 2180: RDPR_TPC	<illegal instruction>
	.word 0xf84ca191  ! 2181: LDSB_I	ldsb	[%r18 + 0x0191], %r28
	.word 0xf045e166  ! 2183: LDSW_I	ldsw	[%r23 + 0x0166], %r24
	.word 0xf4148000  ! 2184: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0x8595e0ac  ! 2185: WRPR_TSTATE_I	wrpr	%r23, 0x00ac, %tstate
	.word 0x8595a1ef  ! 2186: WRPR_TSTATE_I	wrpr	%r22, 0x01ef, %tstate
	.word 0xfc546106  ! 2191: LDSH_I	ldsh	[%r17 + 0x0106], %r30
	.word 0x8d942074  ! 2192: WRPR_PSTATE_I	wrpr	%r16, 0x0074, %pstate
	.word 0xb12da001  ! 2194: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0x8594a03e  ! 2195: WRPR_TSTATE_I	wrpr	%r18, 0x003e, %tstate
	.word 0xfe0dc000  ! 2201: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xb60c205a  ! 2203: AND_I	and 	%r16, 0x005a, %r27
	.word 0xf6456084  ! 2208: LDSW_I	ldsw	[%r21 + 0x0084], %r27
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8a50000  ! 2215: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xf65dc000  ! 2217: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf2458000  ! 2218: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xbd641800  ! 2221: MOVcc_R	<illegal instruction>
	.word 0xf71ca1d0  ! 2222: LDDF_I	ldd	[%r18, 0x01d0], %f27
	.word 0xbf51c000  ! 2223: RDPR_TL	<illegal instruction>
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6ad4000  ! 2226: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xbd349000  ! 2227: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xbd504000  ! 2238: RDPR_TNPC	<illegal instruction>
	.word 0x8994a0fc  ! 2241: WRPR_TICK_I	wrpr	%r18, 0x00fc, %tick
	.word 0xfc1c4000  ! 2243: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xb1508000  ! 2245: RDPR_TSTATE	<illegal instruction>
	.word 0xf31d8000  ! 2246: LDDF_R	ldd	[%r22, %r0], %f25
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0x8994e16a  ! 2254: WRPR_TICK_I	wrpr	%r19, 0x016a, %tick
	.word 0xb3518000  ! 2257: RDPR_PSTATE	<illegal instruction>
	.word 0x8795e15b  ! 2259: WRPR_TT_I	wrpr	%r23, 0x015b, %tt
	mov	2, %r14
	.word 0xa193a000  ! 2260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc542189  ! 2262: LDSH_I	ldsh	[%r16 + 0x0189], %r30
	.word 0xba45c000  ! 2264: ADDC_R	addc 	%r23, %r0, %r29
	.word 0xf6558000  ! 2265: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf2140000  ! 2266: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf71ca196  ! 2268: LDDF_I	ldd	[%r18, 0x0196], %f27
	.word 0xf01d4000  ! 2271: LDD_R	ldd	[%r21 + %r0], %r24
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c6148  ! 2273: LDD_I	ldd	[%r17 + 0x0148], %r26
	.word 0xb7520000  ! 2275: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 2277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0xfe14e055  ! 2278: LDUH_I	lduh	[%r19 + 0x0055], %r31
	.word 0xfa14a017  ! 2279: LDUH_I	lduh	[%r18 + 0x0017], %r29
	.word 0xb814618e  ! 2282: OR_I	or 	%r17, 0x018e, %r28
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0xf05c61b4  ! 2291: LDX_I	ldx	[%r17 + 0x01b4], %r24
	.word 0xb04460be  ! 2292: ADDC_I	addc 	%r17, 0x00be, %r24
	setx	data_start_4, %g1, %r20
	.word 0x8794a010  ! 2299: WRPR_TT_I	wrpr	%r18, 0x0010, %tt
	.word 0xb735d000  ! 2300: SRLX_R	srlx	%r23, %r0, %r27
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20d210a  ! 2303: LDUB_I	ldub	[%r20 + 0x010a], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4cc000  ! 2309: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0x8995e06d  ! 2310: WRPR_TICK_I	wrpr	%r23, 0x006d, %tick
	.word 0xfa1d0000  ! 2311: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xf64dc000  ! 2314: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf71d4000  ! 2323: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xf60c6179  ! 2327: LDUB_I	ldub	[%r17 + 0x0179], %r27
	.word 0xbf510000  ! 2332: RDPR_TICK	rdpr	%tick, %r31
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d2170  ! 2336: LDUB_I	ldub	[%r20 + 0x0170], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd520000  ! 2341: RDPR_PIL	<illegal instruction>
	.word 0xf65c4000  ! 2344: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xb605c000  ! 2345: ADD_R	add 	%r23, %r0, %r27
	.word 0xf605e0ec  ! 2346: LDUW_I	lduw	[%r23 + 0x00ec], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf81ca1fa  ! 2355: LDD_I	ldd	[%r18 + 0x01fa], %r28
	mov	0, %r12
	.word 0x8f932000  ! 2357: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0448000  ! 2360: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xf6458000  ! 2361: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfd1d8000  ! 2362: LDDF_R	ldd	[%r22, %r0], %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xb9508000  ! 2369: RDPR_TSTATE	<illegal instruction>
	.word 0x8994603d  ! 2373: WRPR_TICK_I	wrpr	%r17, 0x003d, %tick
	.word 0xbb50c000  ! 2376: RDPR_TT	rdpr	%tt, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983899  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1899, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 2381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	.word 0xf85d611d  ! 2390: LDX_I	ldx	[%r21 + 0x011d], %r28
	.word 0xba954000  ! 2391: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xf255e130  ! 2394: LDSH_I	ldsh	[%r23 + 0x0130], %r25
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1d8000  ! 2397: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xf41da0dc  ! 2398: LDD_I	ldd	[%r22 + 0x00dc], %r26
	.word 0xb2bd6131  ! 2400: XNORcc_I	xnorcc 	%r21, 0x0131, %r25
	.word 0xf854a0a9  ! 2402: LDSH_I	ldsh	[%r18 + 0x00a9], %r28
	.word 0xf245219c  ! 2403: LDSW_I	ldsw	[%r20 + 0x019c], %r25
	.word 0x8994a12b  ! 2404: WRPR_TICK_I	wrpr	%r18, 0x012b, %tick
	.word 0xbd518000  ! 2407: RDPR_PSTATE	<illegal instruction>
	.word 0xbcb4c000  ! 2409: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xb0048000  ! 2413: ADD_R	add 	%r18, %r0, %r24
	.word 0xbab40000  ! 2415: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xf6058000  ! 2418: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xb550c000  ! 2420: RDPR_TT	<illegal instruction>
	.word 0x8194a0fa  ! 2422: WRPR_TPC_I	wrpr	%r18, 0x00fa, %tpc
	.word 0xfe0dc000  ! 2423: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xb0bcc000  ! 2424: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xfe558000  ! 2425: LDSH_R	ldsh	[%r22 + %r0], %r31
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r20
	.word 0xf8548000  ! 2434: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xb61cc000  ! 2435: XOR_R	xor 	%r19, %r0, %r27
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2441: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2454000  ! 2443: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf91c21c8  ! 2444: LDDF_I	ldd	[%r16, 0x01c8], %f28
	.word 0xb1520000  ! 2445: RDPR_PIL	<illegal instruction>
	.word 0xf805a16c  ! 2446: LDUW_I	lduw	[%r22 + 0x016c], %r28
	.word 0x8d94619f  ! 2447: WRPR_PSTATE_I	wrpr	%r17, 0x019f, %pstate
	.word 0xf255c000  ! 2449: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf61c0000  ! 2451: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xfc45e1a0  ! 2452: LDSW_I	ldsw	[%r23 + 0x01a0], %r30
	.word 0xf01d4000  ! 2457: LDD_R	ldd	[%r21 + %r0], %r24
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ec9  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec9, %hpstate
	.word 0xf20da12f  ! 2463: LDUB_I	ldub	[%r22 + 0x012f], %r25
	.word 0xf84c21a5  ! 2465: LDSB_I	ldsb	[%r16 + 0x01a5], %r28
	.word 0xb551c000  ! 2467: RDPR_TL	<illegal instruction>
	.word 0xfc14a030  ! 2470: LDUH_I	lduh	[%r18 + 0x0030], %r30
	.word 0xf8544000  ! 2474: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xf604e1d9  ! 2477: LDUW_I	lduw	[%r19 + 0x01d9], %r27
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf605c000  ! 2479: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xf845e1c2  ! 2483: LDSW_I	ldsw	[%r23 + 0x01c2], %r28
	.word 0xf65ca08b  ! 2484: LDX_I	ldx	[%r18 + 0x008b], %r27
	.word 0xfa540000  ! 2486: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	data_start_2, %g1, %r18
	.word 0xfe548000  ! 2491: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xb29461f0  ! 2494: ORcc_I	orcc 	%r17, 0x01f0, %r25
	.word 0xf45d0000  ! 2496: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xfc1cc000  ! 2498: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xb1540000  ! 2502: RDPR_GL	<illegal instruction>
	.word 0xbd508000  ! 2507: RDPR_TSTATE	<illegal instruction>
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 2509: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xbd51c000  ! 2512: RDPR_TL	<illegal instruction>
	.word 0xf11de090  ! 2513: LDDF_I	ldd	[%r23, 0x0090], %f24
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 2516: RDPR_TT	<illegal instruction>
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc15a1e9  ! 2519: LDUH_I	lduh	[%r22 + 0x01e9], %r30
	.word 0xfe446142  ! 2522: LDSW_I	ldsw	[%r17 + 0x0142], %r31
	.word 0xb7518000  ! 2523: RDPR_PSTATE	<illegal instruction>
	.word 0xf31da123  ! 2525: LDDF_I	ldd	[%r22, 0x0123], %f25
	.word 0xf25cc000  ! 2526: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xfc058000  ! 2527: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf814e146  ! 2528: LDUH_I	lduh	[%r19 + 0x0146], %r28
	.word 0xf645a09d  ! 2529: LDSW_I	ldsw	[%r22 + 0x009d], %r27
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 2533: LDX_R	ldx	[%r22 + %r0], %r25
	setx	data_start_1, %g1, %r19
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8154000  ! 2537: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xf605e11d  ! 2538: LDUW_I	lduw	[%r23 + 0x011d], %r27
	.word 0xb9540000  ! 2539: RDPR_GL	<illegal instruction>
	.word 0xf44c0000  ! 2542: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf4054000  ! 2543: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xb235212d  ! 2546: SUBC_I	orn 	%r20, 0x012d, %r25
	.word 0xf244a1b3  ! 2548: LDSW_I	ldsw	[%r18 + 0x01b3], %r25
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 2554: RDPR_GL	<illegal instruction>
	.word 0x8995e1f9  ! 2556: WRPR_TICK_I	wrpr	%r23, 0x01f9, %tick
	.word 0x9194e010  ! 2557: WRPR_PIL_I	wrpr	%r19, 0x0010, %pil
	.word 0xfc048000  ! 2558: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0x8795600d  ! 2560: WRPR_TT_I	wrpr	%r21, 0x000d, %tt
	.word 0xf80d0000  ! 2562: LDUB_R	ldub	[%r20 + %r0], %r28
	setx	data_start_6, %g1, %r19
	.word 0xf65de089  ! 2565: LDX_I	ldx	[%r23 + 0x0089], %r27
	setx	data_start_2, %g1, %r23
	setx	data_start_6, %g1, %r17
	.word 0xf4540000  ! 2574: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xfe150000  ! 2585: LDUH_R	lduh	[%r20 + %r0], %r31
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e094  ! 2599: WRPR_TSTATE_I	wrpr	%r23, 0x0094, %tstate
	.word 0x919560da  ! 2602: WRPR_PIL_I	wrpr	%r21, 0x00da, %pil
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf655a147  ! 2609: LDSH_I	ldsh	[%r22 + 0x0147], %r27
	.word 0xbf480000  ! 2612: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc05e1f4  ! 2625: LDUW_I	lduw	[%r23 + 0x01f4], %r30
	.word 0xfa040000  ! 2632: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0x859420e9  ! 2634: WRPR_TSTATE_I	wrpr	%r16, 0x00e9, %tstate
	.word 0xfa456150  ! 2640: LDSW_I	ldsw	[%r21 + 0x0150], %r29
	.word 0x9195211d  ! 2642: WRPR_PIL_I	wrpr	%r20, 0x011d, %pil
	.word 0xfe050000  ! 2645: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xb7508000  ! 2647: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xfb1da115  ! 2648: LDDF_I	ldd	[%r22, 0x0115], %f29
	.word 0xf644a06e  ! 2650: LDSW_I	ldsw	[%r18 + 0x006e], %r27
	.word 0xbf504000  ! 2651: RDPR_TNPC	<illegal instruction>
	.word 0xf045c000  ! 2653: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xbf520000  ! 2657: RDPR_PIL	<illegal instruction>
	.word 0xb6b421a9  ! 2659: SUBCcc_I	orncc 	%r16, 0x01a9, %r27
	.word 0x85952096  ! 2660: WRPR_TSTATE_I	wrpr	%r20, 0x0096, %tstate
	.word 0xfe544000  ! 2663: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfa45a181  ! 2665: LDSW_I	ldsw	[%r22 + 0x0181], %r29
	.word 0xf44de115  ! 2666: LDSB_I	ldsb	[%r23 + 0x0115], %r26
	mov	2, %r14
	.word 0xa193a000  ! 2668: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 2670: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd50c000  ! 2678: RDPR_TT	<illegal instruction>
	.word 0xfe050000  ! 2680: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xfc45c000  ! 2681: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf2550000  ! 2683: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf60d6182  ! 2685: LDUB_I	ldub	[%r21 + 0x0182], %r27
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879521ad  ! 2689: WRPR_TT_I	wrpr	%r20, 0x01ad, %tt
	.word 0xf31cc000  ! 2690: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xfb1d6149  ! 2693: LDDF_I	ldd	[%r21, 0x0149], %f29
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 2697: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf61d0000  ! 2700: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xb0354000  ! 2701: ORN_R	orn 	%r21, %r0, %r24
	.word 0xb7508000  ! 2703: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2705: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6150000  ! 2707: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf805e11f  ! 2711: LDUW_I	lduw	[%r23 + 0x011f], %r28
	.word 0xbd480000  ! 2712: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8995a1b1  ! 2713: WRPR_TICK_I	wrpr	%r22, 0x01b1, %tick
	.word 0xf45cc000  ! 2714: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xfb1da014  ! 2715: LDDF_I	ldd	[%r22, 0x0014], %f29
	.word 0xb72d3001  ! 2716: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xfc5d2188  ! 2721: LDX_I	ldx	[%r20 + 0x0188], %r30
	setx	0x11a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e0ff  ! 2726: WRPR_TSTATE_I	wrpr	%r23, 0x00ff, %tstate
	.word 0xbf504000  ! 2728: RDPR_TNPC	<illegal instruction>
	.word 0xf4154000  ! 2731: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xbca58000  ! 2733: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xf2550000  ! 2734: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xfc05a018  ! 2740: LDUW_I	lduw	[%r22 + 0x0018], %r30
	.word 0xf61de023  ! 2742: LDD_I	ldd	[%r23 + 0x0023], %r27
	.word 0xf91cc000  ! 2743: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xbb504000  ! 2744: RDPR_TNPC	<illegal instruction>
	.word 0xf814c000  ! 2747: LDUH_R	lduh	[%r19 + %r0], %r28
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xff1d217c  ! 2753: LDDF_I	ldd	[%r20, 0x017c], %f31
	.word 0xbb520000  ! 2754: RDPR_PIL	<illegal instruction>
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a1a2  ! 2760: WRPR_PIL_I	wrpr	%r22, 0x01a2, %pil
	.word 0xfa048000  ! 2762: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xbf508000  ! 2763: RDPR_TSTATE	<illegal instruction>
	.word 0xf04c0000  ! 2765: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xfa5c209f  ! 2770: LDX_I	ldx	[%r16 + 0x009f], %r29
	.word 0xb0ad4000  ! 2771: ANDNcc_R	andncc 	%r21, %r0, %r24
	.word 0xbd480000  ! 2772: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	data_start_6, %g1, %r23
	.word 0x8d94a0e6  ! 2783: WRPR_PSTATE_I	wrpr	%r18, 0x00e6, %pstate
	.word 0xf40d4000  ! 2791: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xff1d2046  ! 2793: LDDF_I	ldd	[%r20, 0x0046], %f31
	.word 0xfa45e177  ! 2795: LDSW_I	ldsw	[%r23 + 0x0177], %r29
	.word 0xf04d0000  ! 2798: LDSB_R	ldsb	[%r20 + %r0], %r24
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf644e11f  ! 2803: LDSW_I	ldsw	[%r19 + 0x011f], %r27
	.word 0xf05c6097  ! 2804: LDX_I	ldx	[%r17 + 0x0097], %r24
	setx	data_start_5, %g1, %r18
	.word 0xbd508000  ! 2809: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d2089  ! 2820: LDD_I	ldd	[%r20 + 0x0089], %r27
	.word 0xfa4c4000  ! 2823: LDSB_R	ldsb	[%r17 + %r0], %r29
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1c0000  ! 2825: LDD_R	ldd	[%r16 + %r0], %r30
	setx	data_start_5, %g1, %r23
	.word 0xb3510000  ! 2831: RDPR_TICK	<illegal instruction>
	.word 0x8394a0da  ! 2835: WRPR_TNPC_I	wrpr	%r18, 0x00da, %tnpc
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf20da0c8  ! 2842: LDUB_I	ldub	[%r22 + 0x00c8], %r25
	.word 0x819520c0  ! 2843: WRPR_TPC_I	wrpr	%r20, 0x00c0, %tpc
	.word 0xbb51c000  ! 2844: RDPR_TL	<illegal instruction>
	.word 0xf44dc000  ! 2846: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xbb518000  ! 2848: RDPR_PSTATE	<illegal instruction>
	.word 0xfb1ce1f2  ! 2849: LDDF_I	ldd	[%r19, 0x01f2], %f29
	.word 0xb9510000  ! 2851: RDPR_TICK	<illegal instruction>
	.word 0xb53c5000  ! 2853: SRAX_R	srax	%r17, %r0, %r26
	.word 0xfa44c000  ! 2854: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf01c0000  ! 2856: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf44d617d  ! 2857: LDSB_I	ldsb	[%r21 + 0x017d], %r26
	.word 0xf244c000  ! 2866: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xf205a18a  ! 2868: LDUW_I	lduw	[%r22 + 0x018a], %r25
	mov	2, %r14
	.word 0xa193a000  ! 2874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4b4211a  ! 2877: SUBCcc_I	orncc 	%r16, 0x011a, %r26
	.word 0xfe4d4000  ! 2879: LDSB_R	ldsb	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb845e0a8  ! 2891: ADDC_I	addc 	%r23, 0x00a8, %r28
	.word 0xfa0ca1ed  ! 2892: LDUB_I	ldub	[%r18 + 0x01ed], %r29
	.word 0x8394e072  ! 2893: WRPR_TNPC_I	wrpr	%r19, 0x0072, %tnpc
	.word 0xf0158000  ! 2894: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf015605e  ! 2895: LDUH_I	lduh	[%r21 + 0x005e], %r24
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 2899: LDUH_R	lduh	[%r23 + %r0], %r26
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa14e16a  ! 2902: LDUH_I	lduh	[%r19 + 0x016a], %r29
	.word 0xf85dc000  ! 2909: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb351c000  ! 2910: RDPR_TL	<illegal instruction>
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf045c000  ! 2912: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xfe1c2024  ! 2914: LDD_I	ldd	[%r16 + 0x0024], %r31
	.word 0xbd518000  ! 2915: RDPR_PSTATE	<illegal instruction>
	.word 0xbd51c000  ! 2916: RDPR_TL	<illegal instruction>
	.word 0xf45420db  ! 2917: LDSH_I	ldsh	[%r16 + 0x00db], %r26
	.word 0xf71d8000  ! 2920: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xfc0c218f  ! 2922: LDUB_I	ldub	[%r16 + 0x018f], %r30
	.word 0xf51c21cb  ! 2928: LDDF_I	ldd	[%r16, 0x01cb], %f26
	.word 0xf055a0a6  ! 2929: LDSH_I	ldsh	[%r22 + 0x00a6], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d83  ! 2933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0xfb1c2149  ! 2936: LDDF_I	ldd	[%r16, 0x0149], %f29
	.word 0xf04da1cf  ! 2942: LDSB_I	ldsb	[%r22 + 0x01cf], %r24
	.word 0x8994a0b8  ! 2944: WRPR_TICK_I	wrpr	%r18, 0x00b8, %tick
	.word 0xf8546036  ! 2945: LDSH_I	ldsh	[%r17 + 0x0036], %r28
	.word 0xf61da11b  ! 2951: LDD_I	ldd	[%r22 + 0x011b], %r27
	.word 0x8995612a  ! 2954: WRPR_TICK_I	wrpr	%r21, 0x012a, %tick
	.word 0xf40d4000  ! 2955: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfc45a132  ! 2956: LDSW_I	ldsw	[%r22 + 0x0132], %r30
	.word 0x8194210e  ! 2962: WRPR_TPC_I	wrpr	%r16, 0x010e, %tpc
	.word 0xbf520000  ! 2964: RDPR_PIL	<illegal instruction>
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2967: RDPR_PIL	<illegal instruction>
	.word 0xfa55e170  ! 2968: LDSH_I	ldsh	[%r23 + 0x0170], %r29
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 2980: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb0250000  ! 2985: SUB_R	sub 	%r20, %r0, %r24
	.word 0xfc44a126  ! 2990: LDSW_I	ldsw	[%r18 + 0x0126], %r30
	.word 0xb3500000  ! 2991: RDPR_TPC	<illegal instruction>
	.word 0xf405e1cf  ! 2994: LDUW_I	lduw	[%r23 + 0x01cf], %r26
	.word 0xf455c000  ! 2996: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0x8d94e133  ! 2999: WRPR_PSTATE_I	wrpr	%r19, 0x0133, %pstate
	.word 0xb1508000  ! 3000: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 3002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xf445a195  ! 3003: LDSW_I	ldsw	[%r22 + 0x0195], %r26
	.word 0xb0b58000  ! 3004: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xf844c000  ! 3008: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0x8795a0c4  ! 3009: WRPR_TT_I	wrpr	%r22, 0x00c4, %tt
	.word 0xfe0ca1c6  ! 3011: LDUB_I	ldub	[%r18 + 0x01c6], %r31
	.word 0xfc0d8000  ! 3014: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0x8594a16b  ! 3015: WRPR_TSTATE_I	wrpr	%r18, 0x016b, %tstate
	.word 0x8995a02e  ! 3016: WRPR_TICK_I	wrpr	%r22, 0x002e, %tick
	.word 0xf255c000  ! 3017: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf71c0000  ! 3019: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xfd1cc000  ! 3021: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf20c60d8  ! 3022: LDUB_I	ldub	[%r17 + 0x00d8], %r25
	.word 0xf61de06f  ! 3023: LDD_I	ldd	[%r23 + 0x006f], %r27
	mov	2, %r12
	.word 0x8f932000  ! 3029: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983fdb  ! 3030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fdb, %hpstate
	.word 0x8595a184  ! 3034: WRPR_TSTATE_I	wrpr	%r22, 0x0184, %tstate
	.word 0xf0158000  ! 3035: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb5540000  ! 3037: RDPR_GL	<illegal instruction>
	.word 0xf91c4000  ! 3038: LDDF_R	ldd	[%r17, %r0], %f28
	setx	0x33f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85956051  ! 3043: WRPR_TSTATE_I	wrpr	%r21, 0x0051, %tstate
	.word 0xf44c8000  ! 3045: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xbf508000  ! 3048: RDPR_TSTATE	<illegal instruction>
	.word 0xfa4ca0ca  ! 3050: LDSB_I	ldsb	[%r18 + 0x00ca], %r29
	.word 0xf814c000  ! 3051: LDUH_R	lduh	[%r19 + %r0], %r28
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa44212e  ! 3055: LDSW_I	ldsw	[%r16 + 0x012e], %r29
	.word 0xf91d2133  ! 3056: LDDF_I	ldd	[%r20, 0x0133], %f28
	.word 0xf71d61cf  ! 3058: LDDF_I	ldd	[%r21, 0x01cf], %f27
	.word 0xf0044000  ! 3062: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xf2154000  ! 3064: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xf0040000  ! 3065: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf04c8000  ! 3067: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0x81952097  ! 3074: WRPR_TPC_I	wrpr	%r20, 0x0097, %tpc
	.word 0xfe1d4000  ! 3076: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xb9504000  ! 3079: RDPR_TNPC	<illegal instruction>
	.word 0x8795209f  ! 3083: WRPR_TT_I	wrpr	%r20, 0x009f, %tt
	.word 0xf25d0000  ! 3086: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xb951c000  ! 3088: RDPR_TL	<illegal instruction>
	.word 0xb4b50000  ! 3089: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xf255a119  ! 3092: LDSH_I	ldsh	[%r22 + 0x0119], %r25
	.word 0xf61d4000  ! 3093: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xf24c4000  ! 3094: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf414c000  ! 3096: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xf60c619e  ! 3102: LDUB_I	ldub	[%r17 + 0x019e], %r27
	.word 0xfc5c4000  ! 3106: LDX_R	ldx	[%r17 + %r0], %r30
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20521c0  ! 3111: LDUW_I	lduw	[%r20 + 0x01c0], %r25
	.word 0x8d9421a7  ! 3113: WRPR_PSTATE_I	wrpr	%r16, 0x01a7, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 3116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xff1c4000  ! 3119: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xfb1ce09c  ! 3120: LDDF_I	ldd	[%r19, 0x009c], %f29
	.word 0xba44e199  ! 3121: ADDC_I	addc 	%r19, 0x0199, %r29
	.word 0xf65ce16e  ! 3127: LDX_I	ldx	[%r19 + 0x016e], %r27
	.word 0xb9518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xfc44c000  ! 3130: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xbcb50000  ! 3131: SUBCcc_R	orncc 	%r20, %r0, %r30
	.word 0xfe5420d4  ! 3132: LDSH_I	ldsh	[%r16 + 0x00d4], %r31
	.word 0xb80cc000  ! 3137: AND_R	and 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xf84d8000  ! 3142: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb3643801  ! 3143: MOVcc_I	<illegal instruction>
	.word 0xfe54a1b5  ! 3145: LDSH_I	ldsh	[%r18 + 0x01b5], %r31
	.word 0xf84c61dd  ! 3147: LDSB_I	ldsb	[%r17 + 0x01dd], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf24d61c1  ! 3153: LDSB_I	ldsb	[%r21 + 0x01c1], %r25
	.word 0xfe5c4000  ! 3154: LDX_R	ldx	[%r17 + %r0], %r31
	mov	2, %r12
	.word 0x8f932000  ! 3155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa0dc000  ! 3156: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xb1520000  ! 3157: RDPR_PIL	rdpr	%pil, %r24
	.word 0xb5500000  ! 3160: RDPR_TPC	<illegal instruction>
	.word 0xfa158000  ! 3162: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0x879561a4  ! 3165: WRPR_TT_I	wrpr	%r21, 0x01a4, %tt
	.word 0xf8158000  ! 3167: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb8356083  ! 3168: ORN_I	orn 	%r21, 0x0083, %r28
	mov	2, %r14
	.word 0xa193a000  ! 3169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf61c0000  ! 3172: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xbd50c000  ! 3177: RDPR_TT	<illegal instruction>
	.word 0xb5520000  ! 3178: RDPR_PIL	<illegal instruction>
	.word 0xfe1ca16e  ! 3180: LDD_I	ldd	[%r18 + 0x016e], %r31
	.word 0xfa4c20f9  ! 3182: LDSB_I	ldsb	[%r16 + 0x00f9], %r29
	.word 0xb09cc000  ! 3188: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xbb518000  ! 3190: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3194: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbaa561ca  ! 3195: SUBcc_I	subcc 	%r21, 0x01ca, %r29
	.word 0xf64ce0f4  ! 3196: LDSB_I	ldsb	[%r19 + 0x00f4], %r27
	.word 0xfe050000  ! 3197: LDUW_R	lduw	[%r20 + %r0], %r31
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcac4000  ! 3199: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xfc4de192  ! 3201: LDSB_I	ldsb	[%r23 + 0x0192], %r30
	.word 0xf6146093  ! 3202: LDUH_I	lduh	[%r17 + 0x0093], %r27
	.word 0xf65d8000  ! 3203: LDX_R	ldx	[%r22 + %r0], %r27
	setx	data_start_4, %g1, %r20
	.word 0xbd508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	.word 0xb0b56073  ! 3213: ORNcc_I	orncc 	%r21, 0x0073, %r24
	.word 0xb1508000  ! 3214: RDPR_TSTATE	<illegal instruction>
	.word 0xb0ace1be  ! 3215: ANDNcc_I	andncc 	%r19, 0x01be, %r24
	.word 0xfa45c000  ! 3217: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xfa14c000  ! 3218: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xf40da1a0  ! 3220: LDUB_I	ldub	[%r22 + 0x01a0], %r26
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb81de059  ! 3233: XOR_I	xor 	%r23, 0x0059, %r28
	.word 0xf65da037  ! 3234: LDX_I	ldx	[%r22 + 0x0037], %r27
	.word 0xfa0d4000  ! 3235: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xbf3d0000  ! 3236: SRA_R	sra 	%r20, %r0, %r31
	.word 0x8795e02b  ! 3238: WRPR_TT_I	wrpr	%r23, 0x002b, %tt
	.word 0xbd7c0400  ! 3239: MOVR_R	movre	%r16, %r0, %r30
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982843  ! 3249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0843, %hpstate
	setx	data_start_5, %g1, %r22
	.word 0xf2448000  ! 3253: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfe55c000  ! 3254: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0x8994e009  ! 3260: WRPR_TICK_I	wrpr	%r19, 0x0009, %tick
	.word 0xbb504000  ! 3262: RDPR_TNPC	<illegal instruction>
	.word 0xf654a003  ! 3263: LDSH_I	ldsh	[%r18 + 0x0003], %r27
	.word 0xf20ca07e  ! 3264: LDUB_I	ldub	[%r18 + 0x007e], %r25
	.word 0xb5518000  ! 3265: RDPR_PSTATE	<illegal instruction>
	.word 0xf21c209c  ! 3272: LDD_I	ldd	[%r16 + 0x009c], %r25
	ta	T_CHANGE_HPRIV
	.word 0x819839c3  ! 3275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c3, %hpstate
	.word 0xb3643801  ! 3276: MOVcc_I	<illegal instruction>
	.word 0xfc5d4000  ! 3277: LDX_R	ldx	[%r21 + %r0], %r30
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e161  ! 3284: WRPR_TT_I	wrpr	%r23, 0x0161, %tt
	.word 0xf05d0000  ! 3286: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xfe15e0ac  ! 3287: LDUH_I	lduh	[%r23 + 0x00ac], %r31
	.word 0xf644a03b  ! 3288: LDSW_I	ldsw	[%r18 + 0x003b], %r27
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8542091  ! 3291: LDSH_I	ldsh	[%r16 + 0x0091], %r28
	.word 0xf814205f  ! 3294: LDUH_I	lduh	[%r16 + 0x005f], %r28
	.word 0xb40d4000  ! 3295: AND_R	and 	%r21, %r0, %r26
	.word 0xb151c000  ! 3301: RDPR_TL	<illegal instruction>
	.word 0xf41c6100  ! 3302: LDD_I	ldd	[%r17 + 0x0100], %r26
	.word 0xb02da12c  ! 3304: ANDN_I	andn 	%r22, 0x012c, %r24
	setx	0x32d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5d0000  ! 3307: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf6454000  ! 3308: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xbd518000  ! 3309: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf85ce1d5  ! 3321: LDX_I	ldx	[%r19 + 0x01d5], %r28
	.word 0xbc954000  ! 3326: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xbf7cc400  ! 3327: MOVR_R	movre	%r19, %r0, %r31
	.word 0xb9510000  ! 3328: RDPR_TICK	<illegal instruction>
	.word 0xfb1d218f  ! 3329: LDDF_I	ldd	[%r20, 0x018f], %f29
	.word 0xb1504000  ! 3331: RDPR_TNPC	<illegal instruction>
	.word 0xfc144000  ! 3332: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf04520c2  ! 3336: LDSW_I	ldsw	[%r20 + 0x00c2], %r24
	.word 0xfc54a1bf  ! 3337: LDSH_I	ldsh	[%r18 + 0x01bf], %r30
	.word 0xb0444000  ! 3340: ADDC_R	addc 	%r17, %r0, %r24
	.word 0xb950c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xf40c0000  ! 3344: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf845a0db  ! 3346: LDSW_I	ldsw	[%r22 + 0x00db], %r28
	.word 0xf45d4000  ! 3347: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xf654a118  ! 3349: LDSH_I	ldsh	[%r18 + 0x0118], %r27
	.word 0xf215a01d  ! 3352: LDUH_I	lduh	[%r22 + 0x001d], %r25
	.word 0xf6550000  ! 3353: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf6558000  ! 3354: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf61d61ad  ! 3356: LDD_I	ldd	[%r21 + 0x01ad], %r27
	.word 0xfe45a0bd  ! 3357: LDSW_I	ldsw	[%r22 + 0x00bd], %r31
	.word 0xf61d2078  ! 3360: LDD_I	ldd	[%r20 + 0x0078], %r27
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 3367: RDPR_TSTATE	<illegal instruction>
	.word 0xfa4c4000  ! 3369: LDSB_R	ldsb	[%r17 + %r0], %r29
	mov	2, %r14
	.word 0xa193a000  ! 3382: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4b40000  ! 3383: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xf015c000  ! 3384: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xf51d60b8  ! 3386: LDDF_I	ldd	[%r21, 0x00b8], %f26
	.word 0xfe1c4000  ! 3389: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf045c000  ! 3391: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb83d0000  ! 3392: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xb1504000  ! 3393: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r17
	.word 0xf2048000  ! 3395: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfa54c000  ! 3397: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xbf51c000  ! 3401: RDPR_TL	<illegal instruction>
	.word 0xfa5c8000  ! 3402: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfe0de00a  ! 3404: LDUB_I	ldub	[%r23 + 0x000a], %r31
	.word 0x819560f7  ! 3405: WRPR_TPC_I	wrpr	%r21, 0x00f7, %tpc
	.word 0xb4b4c000  ! 3406: ORNcc_R	orncc 	%r19, %r0, %r26
	.word 0xf604e019  ! 3408: LDUW_I	lduw	[%r19 + 0x0019], %r27
	.word 0x8d94e131  ! 3409: WRPR_PSTATE_I	wrpr	%r19, 0x0131, %pstate
	.word 0xfe544000  ! 3410: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf60d4000  ! 3411: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0x9195a123  ! 3412: WRPR_PIL_I	wrpr	%r22, 0x0123, %pil
	.word 0xb3540000  ! 3419: RDPR_GL	rdpr	%-, %r25
	.word 0xb3540000  ! 3420: RDPR_GL	<illegal instruction>
	.word 0xb7500000  ! 3422: RDPR_TPC	<illegal instruction>
	.word 0xf405c000  ! 3424: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf65c0000  ! 3425: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0x8d95217a  ! 3426: WRPR_PSTATE_I	wrpr	%r20, 0x017a, %pstate
	.word 0xf01d8000  ! 3429: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf454200a  ! 3432: LDSH_I	ldsh	[%r16 + 0x000a], %r26
	.word 0xfe054000  ! 3433: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf31c4000  ! 3435: LDDF_R	ldd	[%r17, %r0], %f25
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982813  ! 3439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0813, %hpstate
	.word 0x87956122  ! 3442: WRPR_TT_I	wrpr	%r21, 0x0122, %tt
	.word 0xf8552170  ! 3447: LDSH_I	ldsh	[%r20 + 0x0170], %r28
	.word 0xb09560df  ! 3448: ORcc_I	orcc 	%r21, 0x00df, %r24
	.word 0xfc150000  ! 3451: LDUH_R	lduh	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xfa4ca1e9  ! 3453: LDSB_I	ldsb	[%r18 + 0x01e9], %r29
	.word 0x8995e081  ! 3454: WRPR_TICK_I	wrpr	%r23, 0x0081, %tick
	.word 0xf44c8000  ! 3457: LDSB_R	ldsb	[%r18 + %r0], %r26
	setx	data_start_4, %g1, %r22
	.word 0xfe1ce0b3  ! 3460: LDD_I	ldd	[%r19 + 0x00b3], %r31
	.word 0xbc9560e3  ! 3462: ORcc_I	orcc 	%r21, 0x00e3, %r30
	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d8000  ! 3467: LDUB_R	ldub	[%r22 + %r0], %r28
	setx	data_start_2, %g1, %r17
	.word 0xf31cc000  ! 3472: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf6154000  ! 3473: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0x8d942044  ! 3476: WRPR_PSTATE_I	wrpr	%r16, 0x0044, %pstate
	.word 0xb6340000  ! 3478: ORN_R	orn 	%r16, %r0, %r27
	.word 0xf25cc000  ! 3481: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xfa1ce14f  ! 3483: LDD_I	ldd	[%r19 + 0x014f], %r29
	.word 0xf015206b  ! 3486: LDUH_I	lduh	[%r20 + 0x006b], %r24
	.word 0xf24561fd  ! 3487: LDSW_I	ldsw	[%r21 + 0x01fd], %r25
	.word 0xfe44e11d  ! 3489: LDSW_I	ldsw	[%r19 + 0x011d], %r31
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41d8000  ! 3499: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xbb520000  ! 3500: RDPR_PIL	<illegal instruction>
	.word 0xb0844000  ! 3501: ADDcc_R	addcc 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c4000  ! 3504: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf0558000  ! 3506: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf00ce0b0  ! 3507: LDUB_I	ldub	[%r19 + 0x00b0], %r24
	.word 0xb1540000  ! 3510: RDPR_GL	<illegal instruction>
	.word 0xf4446175  ! 3512: LDSW_I	ldsw	[%r17 + 0x0175], %r26
	.word 0x9194e0bb  ! 3522: WRPR_PIL_I	wrpr	%r19, 0x00bb, %pil
	.word 0xf8144000  ! 3531: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf41d4000  ! 3532: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xfe4c200f  ! 3533: LDSB_I	ldsb	[%r16 + 0x000f], %r31
	.word 0xbc85201e  ! 3536: ADDcc_I	addcc 	%r20, 0x001e, %r30
	.word 0xf24c8000  ! 3537: LDSB_R	ldsb	[%r18 + %r0], %r25
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 3541: RDPR_TPC	<illegal instruction>
	.word 0xf05c8000  ! 3542: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xb3508000  ! 3544: RDPR_TSTATE	<illegal instruction>
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65ce154  ! 3548: LDX_I	ldx	[%r19 + 0x0154], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982d1b  ! 3551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51dc000  ! 3554: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xb9540000  ! 3556: RDPR_GL	<illegal instruction>
	.word 0x8d94e144  ! 3560: WRPR_PSTATE_I	wrpr	%r19, 0x0144, %pstate
	.word 0x899560eb  ! 3561: WRPR_TICK_I	wrpr	%r21, 0x00eb, %tick
	.word 0xbd508000  ! 3563: RDPR_TSTATE	<illegal instruction>
	.word 0xfc150000  ! 3564: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf8048000  ! 3566: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf05d8000  ! 3570: LDX_R	ldx	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983d09  ! 3571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d09, %hpstate
	.word 0xf25dc000  ! 3572: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf21c4000  ! 3574: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xfa5d6156  ! 3580: LDX_I	ldx	[%r21 + 0x0156], %r29
	.word 0x8594609c  ! 3581: WRPR_TSTATE_I	wrpr	%r17, 0x009c, %tstate
	.word 0xfa5d6076  ! 3582: LDX_I	ldx	[%r21 + 0x0076], %r29
	.word 0xb1500000  ! 3585: RDPR_TPC	<illegal instruction>
	.word 0xfa0cc000  ! 3590: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xfa056019  ! 3591: LDUW_I	lduw	[%r21 + 0x0019], %r29
	.word 0xf4448000  ! 3593: LDSW_R	ldsw	[%r18 + %r0], %r26
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d0000  ! 3598: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xb9540000  ! 3599: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc5c600c  ! 3602: LDX_I	ldx	[%r17 + 0x000c], %r30
	.word 0xfb1d2170  ! 3603: LDDF_I	ldd	[%r20, 0x0170], %f29
	setx	data_start_4, %g1, %r22
	.word 0xb6bc8000  ! 3606: XNORcc_R	xnorcc 	%r18, %r0, %r27
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe444000  ! 3614: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xbd518000  ! 3621: RDPR_PSTATE	<illegal instruction>
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 3624: RDPR_TL	<illegal instruction>
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3628: RDPR_PSTATE	<illegal instruction>
	.word 0xf2058000  ! 3634: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfa1cc000  ! 3635: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xf61d4000  ! 3638: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xbf3cb001  ! 3639: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xbc346091  ! 3640: ORN_I	orn 	%r17, 0x0091, %r30
	.word 0xfe5ca0c0  ! 3641: LDX_I	ldx	[%r18 + 0x00c0], %r31
	.word 0x819461a0  ! 3642: WRPR_TPC_I	wrpr	%r17, 0x01a0, %tpc
	.word 0xf8452076  ! 3643: LDSW_I	ldsw	[%r20 + 0x0076], %r28
	.word 0xb9643801  ! 3644: MOVcc_I	<illegal instruction>
	.word 0xfc0d60ff  ! 3648: LDUB_I	ldub	[%r21 + 0x00ff], %r30
	.word 0xf8444000  ! 3649: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf015607b  ! 3650: LDUH_I	lduh	[%r21 + 0x007b], %r24
	.word 0xf815e0aa  ! 3651: LDUH_I	lduh	[%r23 + 0x00aa], %r28
	.word 0xbd540000  ! 3654: RDPR_GL	<illegal instruction>
	.word 0xfa040000  ! 3655: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfe048000  ! 3659: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xbaad4000  ! 3663: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xfa5de020  ! 3664: LDX_I	ldx	[%r23 + 0x0020], %r29
	.word 0x9195e1d2  ! 3666: WRPR_PIL_I	wrpr	%r23, 0x01d2, %pil
	.word 0xff1c2010  ! 3667: LDDF_I	ldd	[%r16, 0x0010], %f31
	.word 0x8d95a054  ! 3669: WRPR_PSTATE_I	wrpr	%r22, 0x0054, %pstate
	.word 0xfc5ca041  ! 3672: LDX_I	ldx	[%r18 + 0x0041], %r30
	.word 0xfc5c4000  ! 3675: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xfe4de1f9  ! 3677: LDSB_I	ldsb	[%r23 + 0x01f9], %r31
	.word 0xfa150000  ! 3681: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0x8d946194  ! 3684: WRPR_PSTATE_I	wrpr	%r17, 0x0194, %pstate
	.word 0x899520f6  ! 3687: WRPR_TICK_I	wrpr	%r20, 0x00f6, %tick
	.word 0xf655c000  ! 3689: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xff1ca12c  ! 3690: LDDF_I	ldd	[%r18, 0x012c], %f31
	.word 0x8194a04b  ! 3699: WRPR_TPC_I	wrpr	%r18, 0x004b, %tpc
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe150000  ! 3706: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf8048000  ! 3708: LDUW_R	lduw	[%r18 + %r0], %r28
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c0000  ! 3712: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xbf643801  ! 3714: MOVcc_I	<illegal instruction>
	.word 0xf004c000  ! 3717: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xbc340000  ! 3720: ORN_R	orn 	%r16, %r0, %r30
	.word 0xbb51c000  ! 3722: RDPR_TL	rdpr	%tl, %r29
	.word 0xb8150000  ! 3723: OR_R	or 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b83  ! 3729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	.word 0xf24d2105  ! 3731: LDSB_I	ldsb	[%r20 + 0x0105], %r25
	.word 0xf51de1e7  ! 3733: LDDF_I	ldd	[%r23, 0x01e7], %f26
	.word 0xfa55a1ca  ! 3734: LDSH_I	ldsh	[%r22 + 0x01ca], %r29
	.word 0xfa15c000  ! 3736: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xf4444000  ! 3739: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xf4146078  ! 3741: LDUH_I	lduh	[%r17 + 0x0078], %r26
	.word 0xbf508000  ! 3742: RDPR_TSTATE	<illegal instruction>
	.word 0xfa0c4000  ! 3744: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf20cc000  ! 3745: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xbf510000  ! 3746: RDPR_TICK	<illegal instruction>
	.word 0xfe148000  ! 3747: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xb635a1ef  ! 3748: SUBC_I	orn 	%r22, 0x01ef, %r27
	.word 0xf605a1c0  ! 3750: LDUW_I	lduw	[%r22 + 0x01c0], %r27
	.word 0xfd1c4000  ! 3754: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xb1480000  ! 3755: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf61420f5  ! 3756: LDUH_I	lduh	[%r16 + 0x00f5], %r27
	.word 0xfa5de105  ! 3757: LDX_I	ldx	[%r23 + 0x0105], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	.word 0xb9500000  ! 3765: RDPR_TPC	<illegal instruction>
	.word 0xfe0c61fd  ! 3770: LDUB_I	ldub	[%r17 + 0x01fd], %r31
	.word 0x8195a12d  ! 3772: WRPR_TPC_I	wrpr	%r22, 0x012d, %tpc
	.word 0xf60ce0c5  ! 3773: LDUB_I	ldub	[%r19 + 0x00c5], %r27
	.word 0xfe05c000  ! 3776: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf65c4000  ! 3777: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0x85946059  ! 3778: WRPR_TSTATE_I	wrpr	%r17, 0x0059, %tstate
	.word 0xf85dc000  ! 3780: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf91c612d  ! 3782: LDDF_I	ldd	[%r17, 0x012d], %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0xf01c0000  ! 3786: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf844c000  ! 3787: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xb9508000  ! 3788: RDPR_TSTATE	<illegal instruction>
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf644c000  ! 3790: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xbb510000  ! 3791: RDPR_TICK	<illegal instruction>
	.word 0xfe45201e  ! 3794: LDSW_I	ldsw	[%r20 + 0x001e], %r31
	.word 0xb3510000  ! 3799: RDPR_TICK	<illegal instruction>
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 3809: RDPR_GL	<illegal instruction>
	.word 0xfc45a053  ! 3810: LDSW_I	ldsw	[%r22 + 0x0053], %r30
	.word 0xfe052177  ! 3811: LDUW_I	lduw	[%r20 + 0x0177], %r31
	.word 0xfe044000  ! 3812: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf91c4000  ! 3815: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf4150000  ! 3824: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xbd504000  ! 3826: RDPR_TNPC	<illegal instruction>
	.word 0xb33dc000  ! 3827: SRA_R	sra 	%r23, %r0, %r25
	.word 0xf0558000  ! 3832: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfe542138  ! 3833: LDSH_I	ldsh	[%r16 + 0x0138], %r31
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 3839: RDPR_GL	<illegal instruction>
	.word 0xf04c6184  ! 3840: LDSB_I	ldsb	[%r17 + 0x0184], %r24
	.word 0xfc440000  ! 3841: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf05c61c9  ! 3843: LDX_I	ldx	[%r17 + 0x01c9], %r24
	.word 0xb7508000  ! 3844: RDPR_TSTATE	<illegal instruction>
	.word 0xb73c8000  ! 3845: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb9518000  ! 3847: RDPR_PSTATE	<illegal instruction>
	.word 0xfa148000  ! 3851: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0x899560a2  ! 3853: WRPR_TICK_I	wrpr	%r21, 0x00a2, %tick
	.word 0xfc0c4000  ! 3855: LDUB_R	ldub	[%r17 + %r0], %r30
	setx	data_start_7, %g1, %r16
	.word 0xfa4520c9  ! 3857: LDSW_I	ldsw	[%r20 + 0x00c9], %r29
	.word 0xb5510000  ! 3860: RDPR_TICK	<illegal instruction>
	.word 0xf24d4000  ! 3861: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf015c000  ! 3862: LDUH_R	lduh	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 3863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0xf4542094  ! 3865: LDSH_I	ldsh	[%r16 + 0x0094], %r26
	.word 0xf054e1c6  ! 3867: LDSH_I	ldsh	[%r19 + 0x01c6], %r24
	.word 0xb835608e  ! 3869: ORN_I	orn 	%r21, 0x008e, %r28
	.word 0xfe0c0000  ! 3874: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xfc1561e4  ! 3875: LDUH_I	lduh	[%r21 + 0x01e4], %r30
	.word 0xb00d4000  ! 3876: AND_R	and 	%r21, %r0, %r24
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e14a  ! 3883: WRPR_TNPC_I	wrpr	%r19, 0x014a, %tnpc
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 3885: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf51da0e8  ! 3889: LDDF_I	ldd	[%r22, 0x00e8], %f26
	mov	0, %r14
	.word 0xa193a000  ! 3895: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb641800  ! 3899: MOVcc_R	<illegal instruction>
	.word 0xfe056175  ! 3900: LDUW_I	lduw	[%r21 + 0x0175], %r31
	.word 0xb5504000  ! 3905: RDPR_TNPC	<illegal instruction>
	.word 0xf8450000  ! 3907: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xb5347001  ! 3908: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xb3480000  ! 3909: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf24c0000  ! 3910: LDSB_R	ldsb	[%r16 + %r0], %r25
	setx	0x30317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe9d0000  ! 3915: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xb6ad61f7  ! 3918: ANDNcc_I	andncc 	%r21, 0x01f7, %r27
	setx	data_start_6, %g1, %r22
	mov	1, %r14
	.word 0xa193a000  ! 3920: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff1ce10a  ! 3922: LDDF_I	ldd	[%r19, 0x010a], %f31
	setx	0x20333, %g1, %o0
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
	.word 0xfe14e125  ! 3929: LDUH_I	lduh	[%r19 + 0x0125], %r31
	.word 0xf71c4000  ! 3933: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xb4848000  ! 3935: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0x81942027  ! 3936: WRPR_TPC_I	wrpr	%r16, 0x0027, %tpc
	.word 0xf41d6021  ! 3937: LDD_I	ldd	[%r21 + 0x0021], %r26
	.word 0xb8ac21c2  ! 3938: ANDNcc_I	andncc 	%r16, 0x01c2, %r28
	.word 0xbe140000  ! 3940: OR_R	or 	%r16, %r0, %r31
	.word 0xfe1d8000  ! 3941: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xf204a04f  ! 3946: LDUW_I	lduw	[%r18 + 0x004f], %r25
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d0000  ! 3950: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xb8b4e012  ! 3955: ORNcc_I	orncc 	%r19, 0x0012, %r28
	.word 0xbb510000  ! 3956: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb3500000  ! 3959: RDPR_TPC	<illegal instruction>
	.word 0xfe548000  ! 3961: LDSH_R	ldsh	[%r18 + %r0], %r31
	mov	1, %r12
	.word 0x8f932000  ! 3962: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2850000  ! 3966: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xb1343001  ! 3969: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xfc05e1c7  ! 3974: LDUW_I	lduw	[%r23 + 0x01c7], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 3975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0150000  ! 3979: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb21cc000  ! 3981: XOR_R	xor 	%r19, %r0, %r25
	.word 0x8995603f  ! 3982: WRPR_TICK_I	wrpr	%r21, 0x003f, %tick
	.word 0xfa458000  ! 3985: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf4148000  ! 3989: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf81560f5  ! 3990: LDUH_I	lduh	[%r21 + 0x00f5], %r28
	.word 0xf65de025  ! 3997: LDX_I	ldx	[%r23 + 0x0025], %r27
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d616c  ! 3999: LDUB_I	ldub	[%r21 + 0x016c], %r29
	.word 0xf80dc000  ! 4006: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xbd35d000  ! 4007: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xf11c4000  ! 4011: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xbb50c000  ! 4017: RDPR_TT	rdpr	%tt, %r29
	.word 0xf044e196  ! 4018: LDSW_I	ldsw	[%r19 + 0x0196], %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 4019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0xf20d0000  ! 4021: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf4540000  ! 4023: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf44c2083  ! 4026: LDSB_I	ldsb	[%r16 + 0x0083], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1c61d3  ! 4029: LDD_I	ldd	[%r17 + 0x01d3], %r29
	.word 0xfe5de02e  ! 4030: LDX_I	ldx	[%r23 + 0x002e], %r31
	.word 0xf85461e1  ! 4031: LDSH_I	ldsh	[%r17 + 0x01e1], %r28
	.word 0xfa540000  ! 4033: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xfe554000  ! 4035: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf11c0000  ! 4036: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xbb7c6401  ! 4040: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xb3347001  ! 4041: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xfa4da1cb  ! 4042: LDSB_I	ldsb	[%r22 + 0x01cb], %r29
	.word 0xfa0ca040  ! 4046: LDUB_I	ldub	[%r18 + 0x0040], %r29
	setx	0x3030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93de001  ! 4052: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xba354000  ! 4054: ORN_R	orn 	%r21, %r0, %r29
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 4058: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1c8000  ! 4066: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0x8995a1da  ! 4067: WRPR_TICK_I	wrpr	%r22, 0x01da, %tick
	.word 0xb150c000  ! 4069: RDPR_TT	<illegal instruction>
	.word 0xfd1d2119  ! 4071: LDDF_I	ldd	[%r20, 0x0119], %f30
	.word 0xb2b5c000  ! 4072: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbd2d6001  ! 4079: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xb5520000  ! 4081: RDPR_PIL	<illegal instruction>
	.word 0xf8542148  ! 4083: LDSH_I	ldsh	[%r16 + 0x0148], %r28
	.word 0xfc04e0a9  ! 4084: LDUW_I	lduw	[%r19 + 0x00a9], %r30
	.word 0xfe558000  ! 4092: LDSH_R	ldsh	[%r22 + %r0], %r31
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0054000  ! 4095: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfa050000  ! 4099: LDUW_R	lduw	[%r20 + %r0], %r29
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 4104: RDPR_GL	<illegal instruction>
	.word 0xf84d4000  ! 4105: LDSB_R	ldsb	[%r21 + %r0], %r28
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xb20d211d  ! 4111: AND_I	and 	%r20, 0x011d, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c20fc  ! 4119: LDDF_I	ldd	[%r16, 0x00fc], %f31
	.word 0xf654a142  ! 4122: LDSH_I	ldsh	[%r18 + 0x0142], %r27
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf814a155  ! 4125: LDUH_I	lduh	[%r18 + 0x0155], %r28
	.word 0xfc0cc000  ! 4126: LDUB_R	ldub	[%r19 + %r0], %r30
	setx	data_start_4, %g1, %r19
	.word 0xb7504000  ! 4131: RDPR_TNPC	<illegal instruction>
	.word 0xfe540000  ! 4135: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf91d0000  ! 4137: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf80460a7  ! 4138: LDUW_I	lduw	[%r17 + 0x00a7], %r28
	.word 0xf645e107  ! 4140: LDSW_I	ldsw	[%r23 + 0x0107], %r27
	.word 0x8795207a  ! 4143: WRPR_TT_I	wrpr	%r20, 0x007a, %tt
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4147: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc254000  ! 4153: SUB_R	sub 	%r21, %r0, %r30
	.word 0xfd1da10f  ! 4158: LDDF_I	ldd	[%r22, 0x010f], %f30
	.word 0xf61461f8  ! 4162: LDUH_I	lduh	[%r17 + 0x01f8], %r27
	.word 0xb695a0c7  ! 4167: ORcc_I	orcc 	%r22, 0x00c7, %r27
	.word 0xfe1420f2  ! 4171: LDUH_I	lduh	[%r16 + 0x00f2], %r31
	.word 0xf05c0000  ! 4172: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xfa156184  ! 4173: LDUH_I	lduh	[%r21 + 0x0184], %r29
	.word 0xf81420f9  ! 4174: LDUH_I	lduh	[%r16 + 0x00f9], %r28
	.word 0xf01de0ad  ! 4176: LDD_I	ldd	[%r23 + 0x00ad], %r24
	.word 0x8194e0c4  ! 4177: WRPR_TPC_I	wrpr	%r19, 0x00c4, %tpc
	.word 0x8195e141  ! 4178: WRPR_TPC_I	wrpr	%r23, 0x0141, %tpc
	.word 0xf0142019  ! 4180: LDUH_I	lduh	[%r16 + 0x0019], %r24
	.word 0xfa140000  ! 4183: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfe0c8000  ! 4185: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfe44e1f2  ! 4186: LDSW_I	ldsw	[%r19 + 0x01f2], %r31
	.word 0xf24c4000  ! 4190: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf0454000  ! 4191: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xf04d4000  ! 4193: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xb2b5e13b  ! 4194: ORNcc_I	orncc 	%r23, 0x013b, %r25
	.word 0xf814e17b  ! 4195: LDUH_I	lduh	[%r19 + 0x017b], %r28
	setx	0x10120, %g1, %o0
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
	.word 0xb52cb001  ! 4208: SLLX_I	sllx	%r18, 0x0001, %r26
	.word 0xf41c0000  ! 4212: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xfc058000  ! 4215: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf84cc000  ! 4216: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xfe0d0000  ! 4217: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xf81d8000  ! 4218: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf31c4000  ! 4219: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0x8594a080  ! 4220: WRPR_TSTATE_I	wrpr	%r18, 0x0080, %tstate
	.word 0xb434a1ce  ! 4222: ORN_I	orn 	%r18, 0x01ce, %r26
	.word 0xfe5d2041  ! 4223: LDX_I	ldx	[%r20 + 0x0041], %r31
	.word 0xb57de401  ! 4226: MOVR_I	movre	%r23, 0x1, %r26
	.word 0xf91d8000  ! 4227: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf61c602e  ! 4228: LDD_I	ldd	[%r17 + 0x002e], %r27
	.word 0xf61d0000  ! 4230: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf0056027  ! 4232: LDUW_I	lduw	[%r21 + 0x0027], %r24
	.word 0xb5518000  ! 4233: RDPR_PSTATE	<illegal instruction>
	.word 0xbb518000  ! 4240: RDPR_PSTATE	<illegal instruction>
	.word 0xf44d214c  ! 4241: LDSB_I	ldsb	[%r20 + 0x014c], %r26
	.word 0x8594e050  ! 4242: WRPR_TSTATE_I	wrpr	%r19, 0x0050, %tstate
	.word 0xf0148000  ! 4246: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfe0461f7  ! 4249: LDUW_I	lduw	[%r17 + 0x01f7], %r31
	.word 0xfa4de1ac  ! 4250: LDSB_I	ldsb	[%r23 + 0x01ac], %r29
	.word 0xb4c420bd  ! 4251: ADDCcc_I	addccc 	%r16, 0x00bd, %r26
	.word 0xf91d8000  ! 4252: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xbc2cc000  ! 4255: ANDN_R	andn 	%r19, %r0, %r30
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 4262: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf11d20d1  ! 4266: LDDF_I	ldd	[%r20, 0x00d1], %f24
	.word 0xf40d8000  ! 4269: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0x8395e170  ! 4271: WRPR_TNPC_I	wrpr	%r23, 0x0170, %tnpc
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91dc000  ! 4276: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0x8795206d  ! 4277: WRPR_TT_I	wrpr	%r20, 0x006d, %tt
	.word 0xf05cc000  ! 4283: LDX_R	ldx	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983989  ! 4286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1989, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 4291: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4298: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc0da09d  ! 4299: LDUB_I	ldub	[%r22 + 0x009d], %r30
	.word 0xfc152183  ! 4300: LDUH_I	lduh	[%r20 + 0x0183], %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 4301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 4303: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7480000  ! 4305: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x919420c7  ! 4306: WRPR_PIL_I	wrpr	%r16, 0x00c7, %pil
	.word 0xf415c000  ! 4308: LDUH_R	lduh	[%r23 + %r0], %r26
	setx	0x20035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xb8258000  ! 4314: SUB_R	sub 	%r22, %r0, %r28
	.word 0xfb1de16d  ! 4320: LDDF_I	ldd	[%r23, 0x016d], %f29
	.word 0xb9510000  ! 4323: RDPR_TICK	<illegal instruction>
	.word 0xfe5d20f5  ! 4325: LDX_I	ldx	[%r20 + 0x00f5], %r31
	mov	0, %r12
	.word 0x8f932000  ! 4327: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3500000  ! 4335: RDPR_TPC	<illegal instruction>
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11c4000  ! 4342: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xf654c000  ! 4343: LDSH_R	ldsh	[%r19 + %r0], %r27
	mov	0, %r12
	.word 0x8f932000  ! 4344: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r20
	.word 0xfa1d21bc  ! 4349: LDD_I	ldd	[%r20 + 0x01bc], %r29
	.word 0xf04c4000  ! 4350: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf6152184  ! 4351: LDUH_I	lduh	[%r20 + 0x0184], %r27
	.word 0xbc14e0c0  ! 4352: OR_I	or 	%r19, 0x00c0, %r30
	.word 0x8994a0d7  ! 4353: WRPR_TICK_I	wrpr	%r18, 0x00d7, %tick
	.word 0xf8050000  ! 4354: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xff1d4000  ! 4355: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xf91d4000  ! 4356: LDDF_R	ldd	[%r21, %r0], %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r20
	.word 0x8194e070  ! 4360: WRPR_TPC_I	wrpr	%r19, 0x0070, %tpc
	.word 0xbd343001  ! 4363: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb7504000  ! 4366: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfa1c21c8  ! 4367: LDD_I	ldd	[%r16 + 0x01c8], %r29
	.word 0xf64d21a1  ! 4368: LDSB_I	ldsb	[%r20 + 0x01a1], %r27
	.word 0xb551c000  ! 4371: RDPR_TL	<illegal instruction>
	.word 0xfe1520a3  ! 4375: LDUH_I	lduh	[%r20 + 0x00a3], %r31
	.word 0xfc044000  ! 4376: LDUW_R	lduw	[%r17 + %r0], %r30
	mov	0, %r14
	.word 0xa193a000  ! 4381: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb751c000  ! 4383: RDPR_TL	<illegal instruction>
	.word 0xbf3d0000  ! 4384: SRA_R	sra 	%r20, %r0, %r31
	.word 0xbf510000  ! 4386: RDPR_TICK	<illegal instruction>
	.word 0xf81c0000  ! 4387: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0x8394a1a5  ! 4389: WRPR_TNPC_I	wrpr	%r18, 0x01a5, %tnpc
	.word 0xbc258000  ! 4390: SUB_R	sub 	%r22, %r0, %r30
	.word 0x8d94a178  ! 4391: WRPR_PSTATE_I	wrpr	%r18, 0x0178, %pstate
	.word 0xf604e097  ! 4392: LDUW_I	lduw	[%r19 + 0x0097], %r27
	.word 0xf71ca0bd  ! 4394: LDDF_I	ldd	[%r18, 0x00bd], %f27
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73df001  ! 4402: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xbf352001  ! 4403: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0x9194613a  ! 4406: WRPR_PIL_I	wrpr	%r17, 0x013a, %pil
	.word 0xb22c4000  ! 4407: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb81421f6  ! 4408: OR_I	or 	%r16, 0x01f6, %r28
	.word 0xf71ca185  ! 4409: LDDF_I	ldd	[%r18, 0x0185], %f27
	.word 0xb685e114  ! 4410: ADDcc_I	addcc 	%r23, 0x0114, %r27
	.word 0xfa4c4000  ! 4413: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xba242103  ! 4414: SUB_I	sub 	%r16, 0x0103, %r29
	.word 0xbb7da401  ! 4417: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xfa040000  ! 4418: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xf404c000  ! 4419: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf60d0000  ! 4420: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf00d0000  ! 4421: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xfe1d205f  ! 4426: LDD_I	ldd	[%r20 + 0x005f], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983a09  ! 4427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a09, %hpstate
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1d2146  ! 4435: LDDF_I	ldd	[%r20, 0x0146], %f31
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d2093  ! 4440: LDD_I	ldd	[%r20 + 0x0093], %r27
	.word 0xf614a104  ! 4442: LDUH_I	lduh	[%r18 + 0x0104], %r27
	.word 0xfc158000  ! 4443: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf45c2113  ! 4447: LDX_I	ldx	[%r16 + 0x0113], %r26
	.word 0xf25520dd  ! 4451: LDSH_I	ldsh	[%r20 + 0x00dd], %r25
	.word 0xf40de126  ! 4452: LDUB_I	ldub	[%r23 + 0x0126], %r26
	.word 0xfe548000  ! 4455: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xba1c60f2  ! 4456: XOR_I	xor 	%r17, 0x00f2, %r29
	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942027  ! 4466: WRPR_TPC_I	wrpr	%r16, 0x0027, %tpc
	.word 0xf85ce142  ! 4470: LDX_I	ldx	[%r19 + 0x0142], %r28
	.word 0xf51ce0c4  ! 4472: LDDF_I	ldd	[%r19, 0x00c4], %f26
	.word 0xb1540000  ! 4474: RDPR_GL	<illegal instruction>
	.word 0xf85ce1e8  ! 4475: LDX_I	ldx	[%r19 + 0x01e8], %r28
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e020  ! 4481: WRPR_TICK_I	wrpr	%r23, 0x0020, %tick
	.word 0xfe4ce069  ! 4483: LDSB_I	ldsb	[%r19 + 0x0069], %r31
	.word 0xf0054000  ! 4484: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xbe154000  ! 4485: OR_R	or 	%r21, %r0, %r31
	.word 0xb5510000  ! 4486: RDPR_TICK	<illegal instruction>
	.word 0xb8446064  ! 4487: ADDC_I	addc 	%r17, 0x0064, %r28
	.word 0xfc0461cf  ! 4488: LDUW_I	lduw	[%r17 + 0x01cf], %r30
	.word 0xb351c000  ! 4489: RDPR_TL	<illegal instruction>
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1da0ad  ! 4492: LDDF_I	ldd	[%r22, 0x00ad], %f29
	.word 0xfc0d4000  ! 4500: LDUB_R	ldub	[%r21 + %r0], %r30
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 4502: XOR_R	xor 	%r19, %r0, %r26
	.word 0xb2c5616e  ! 4507: ADDCcc_I	addccc 	%r21, 0x016e, %r25
	.word 0xfc0c20e9  ! 4510: LDUB_I	ldub	[%r16 + 0x00e9], %r30
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61c205c  ! 4518: LDD_I	ldd	[%r16 + 0x005c], %r27
	.word 0xf84c8000  ! 4520: LDSB_R	ldsb	[%r18 + %r0], %r28
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 4527: RDPR_GL	<illegal instruction>
	.word 0xf8444000  ! 4538: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0x8394a09d  ! 4540: WRPR_TNPC_I	wrpr	%r18, 0x009d, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983acb  ! 4541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acb, %hpstate
	.word 0xbd508000  ! 4543: RDPR_TSTATE	<illegal instruction>
	.word 0xbb520000  ! 4547: RDPR_PIL	<illegal instruction>
	.word 0xf6148000  ! 4549: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfe15c000  ! 4555: LDUH_R	lduh	[%r23 + %r0], %r31
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe440000  ! 4559: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xb7504000  ! 4561: RDPR_TNPC	<illegal instruction>
	.word 0xfa0c4000  ! 4566: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf45520ce  ! 4569: LDSH_I	ldsh	[%r20 + 0x00ce], %r26
	.word 0xb7510000  ! 4573: RDPR_TICK	<illegal instruction>
	.word 0xf04d2187  ! 4575: LDSB_I	ldsb	[%r20 + 0x0187], %r24
	.word 0xf21cc000  ! 4582: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xba356002  ! 4583: SUBC_I	orn 	%r21, 0x0002, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8148000  ! 4588: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfc1420c6  ! 4589: LDUH_I	lduh	[%r16 + 0x00c6], %r30
	.word 0xf6058000  ! 4590: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xb1508000  ! 4596: RDPR_TSTATE	<illegal instruction>
	.word 0xfe05a16c  ! 4598: LDUW_I	lduw	[%r22 + 0x016c], %r31
	.word 0xb1508000  ! 4599: RDPR_TSTATE	<illegal instruction>
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa146172  ! 4606: LDUH_I	lduh	[%r17 + 0x0172], %r29
	.word 0x81946174  ! 4611: WRPR_TPC_I	wrpr	%r17, 0x0174, %tpc
	.word 0xfc0da126  ! 4612: LDUB_I	ldub	[%r22 + 0x0126], %r30
	.word 0xf80d8000  ! 4613: LDUB_R	ldub	[%r22 + %r0], %r28
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1c4000  ! 4621: LDD_R	ldd	[%r17 + %r0], %r31
	setx	0x1b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 4624: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf64cc000  ! 4626: LDSB_R	ldsb	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6454000  ! 4629: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf8444000  ! 4630: LDSW_R	ldsw	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982d43  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d43, %hpstate
	.word 0xf6548000  ! 4635: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xf84c0000  ! 4636: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf91cc000  ! 4640: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xfa440000  ! 4643: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xfa55e195  ! 4644: LDSH_I	ldsh	[%r23 + 0x0195], %r29
	.word 0xfa05e174  ! 4650: LDUW_I	lduw	[%r23 + 0x0174], %r29
	.word 0xf04c4000  ! 4651: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xfe4d4000  ! 4652: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf0552044  ! 4654: LDSH_I	ldsh	[%r20 + 0x0044], %r24
	.word 0xb2b42150  ! 4655: ORNcc_I	orncc 	%r16, 0x0150, %r25
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	.word 0xf20de051  ! 4659: LDUB_I	ldub	[%r23 + 0x0051], %r25
	.word 0xbf508000  ! 4661: RDPR_TSTATE	<illegal instruction>
	.word 0xbca4c000  ! 4664: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xf64c4000  ! 4666: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xb7500000  ! 4668: RDPR_TPC	<illegal instruction>
	.word 0xf4548000  ! 4672: LDSH_R	ldsh	[%r18 + %r0], %r26
	setx	data_start_0, %g1, %r23
	.word 0xf71da0d9  ! 4676: LDDF_I	ldd	[%r22, 0x00d9], %f27
	.word 0xf44c4000  ! 4677: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xb52dd000  ! 4678: SLLX_R	sllx	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	.word 0xf85de001  ! 4682: LDX_I	ldx	[%r23 + 0x0001], %r28
	.word 0xf44cc000  ! 4683: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8d95a003  ! 4684: WRPR_PSTATE_I	wrpr	%r22, 0x0003, %pstate
	.word 0x8995e04e  ! 4689: WRPR_TICK_I	wrpr	%r23, 0x004e, %tick
	.word 0xf404c000  ! 4690: LDUW_R	lduw	[%r19 + %r0], %r26
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4440000  ! 4692: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xb2a5607f  ! 4693: SUBcc_I	subcc 	%r21, 0x007f, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0x879420c7  ! 4695: WRPR_TT_I	wrpr	%r16, 0x00c7, %tt
	.word 0x8195e11a  ! 4698: WRPR_TPC_I	wrpr	%r23, 0x011a, %tpc
	.word 0xb434c000  ! 4700: ORN_R	orn 	%r19, %r0, %r26
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 4704: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf51dc000  ! 4705: LDDF_R	ldd	[%r23, %r0], %f26
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30306, %g1, %o0
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
	setx	data_start_6, %g1, %r20
	.word 0xfa5d8000  ! 4718: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xfe1dc000  ! 4720: LDD_R	ldd	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982f41  ! 4721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	.word 0xfc142190  ! 4726: LDUH_I	lduh	[%r16 + 0x0190], %r30
	.word 0xf80d20c9  ! 4727: LDUB_I	ldub	[%r20 + 0x00c9], %r28
	.word 0xfe0460ec  ! 4732: LDUW_I	lduw	[%r17 + 0x00ec], %r31
	.word 0xf614207e  ! 4733: LDUH_I	lduh	[%r16 + 0x007e], %r27
	.word 0xb0c54000  ! 4734: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0xb1480000  ! 4738: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe146110  ! 4742: LDUH_I	lduh	[%r17 + 0x0110], %r31
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 4753: RDPR_GL	<illegal instruction>
	.word 0x8994a07f  ! 4754: WRPR_TICK_I	wrpr	%r18, 0x007f, %tick
	.word 0xf40c8000  ! 4757: LDUB_R	ldub	[%r18 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7520000  ! 4761: RDPR_PIL	<illegal instruction>
	.word 0xf05c20d4  ! 4763: LDX_I	ldx	[%r16 + 0x00d4], %r24
	.word 0xf844a0db  ! 4764: LDSW_I	ldsw	[%r18 + 0x00db], %r28
	.word 0xfc5521ca  ! 4768: LDSH_I	ldsh	[%r20 + 0x01ca], %r30
	.word 0xbb500000  ! 4771: RDPR_TPC	<illegal instruction>
	.word 0xfc544000  ! 4772: LDSH_R	ldsh	[%r17 + %r0], %r30
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244217e  ! 4774: LDSW_I	ldsw	[%r16 + 0x017e], %r25
	.word 0xb09cc000  ! 4780: XORcc_R	xorcc 	%r19, %r0, %r24
	setx	data_start_0, %g1, %r22
	.word 0xbf540000  ! 4782: RDPR_GL	<illegal instruction>
	.word 0xbb504000  ! 4784: RDPR_TNPC	<illegal instruction>
	.word 0xf05d217f  ! 4787: LDX_I	ldx	[%r20 + 0x017f], %r24
	.word 0xf84ca0e9  ! 4788: LDSB_I	ldsb	[%r18 + 0x00e9], %r28
	.word 0xf04c4000  ! 4790: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xb3510000  ! 4792: RDPR_TICK	<illegal instruction>
	.word 0xfa0da082  ! 4795: LDUB_I	ldub	[%r22 + 0x0082], %r29
	.word 0xbcb5c000  ! 4797: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0xbd354000  ! 4799: SRL_R	srl 	%r21, %r0, %r30
	.word 0xf004e18d  ! 4801: LDUW_I	lduw	[%r19 + 0x018d], %r24
	.word 0x9194609e  ! 4804: WRPR_PIL_I	wrpr	%r17, 0x009e, %pil
	.word 0xfe5da1ed  ! 4806: LDX_I	ldx	[%r22 + 0x01ed], %r31
	.word 0xbf510000  ! 4811: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf44ca0dc  ! 4813: LDSB_I	ldsb	[%r18 + 0x00dc], %r26
	setx	data_start_1, %g1, %r19
	.word 0xfe0c8000  ! 4817: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfa0d8000  ! 4818: LDUB_R	ldub	[%r22 + %r0], %r29
	setx	0x3010f, %g1, %o0
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
	.word 0xf014218e  ! 4824: LDUH_I	lduh	[%r16 + 0x018e], %r24
	.word 0xb4952142  ! 4826: ORcc_I	orcc 	%r20, 0x0142, %r26
	.word 0xb40d8000  ! 4829: AND_R	and 	%r22, %r0, %r26
	.word 0xf44ce0a7  ! 4838: LDSB_I	ldsb	[%r19 + 0x00a7], %r26
	.word 0xf2150000  ! 4839: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfa046048  ! 4840: LDUW_I	lduw	[%r17 + 0x0048], %r29
	.word 0xb5518000  ! 4841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4d0000  ! 4843: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf85c4000  ! 4846: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf81dc000  ! 4848: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0x8d95e19d  ! 4849: WRPR_PSTATE_I	wrpr	%r23, 0x019d, %pstate
	.word 0xb73da001  ! 4850: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xb1518000  ! 4853: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 4854: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa0cc000  ! 4860: LDUB_R	ldub	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982c51  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994207f  ! 4864: WRPR_TICK_I	wrpr	%r16, 0x007f, %tick
	.word 0xf01da02c  ! 4865: LDD_I	ldd	[%r22 + 0x002c], %r24
	.word 0xf01561e8  ! 4868: LDUH_I	lduh	[%r21 + 0x01e8], %r24
	.word 0xf65ce09c  ! 4870: LDX_I	ldx	[%r19 + 0x009c], %r27
	.word 0xb3520000  ! 4872: RDPR_PIL	<illegal instruction>
	.word 0xf40420f8  ! 4873: LDUW_I	lduw	[%r16 + 0x00f8], %r26
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc050000  ! 4879: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfc542176  ! 4881: LDSH_I	ldsh	[%r16 + 0x0176], %r30
	setx	data_start_4, %g1, %r21
	.word 0xb5480000  ! 4886: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa142127  ! 4891: LDUH_I	lduh	[%r16 + 0x0127], %r29
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d20a4  ! 4899: LDSB_I	ldsb	[%r20 + 0x00a4], %r29
	.word 0xfe44a0b1  ! 4902: LDSW_I	ldsw	[%r18 + 0x00b1], %r31
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 4906: RDPR_TICK	<illegal instruction>
	.word 0x8194214e  ! 4907: WRPR_TPC_I	wrpr	%r16, 0x014e, %tpc
	.word 0x91946002  ! 4911: WRPR_PIL_I	wrpr	%r17, 0x0002, %pil
	mov	0, %r12
	.word 0x8f932000  ! 4916: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf11de0d0  ! 4924: LDDF_I	ldd	[%r23, 0x00d0], %f24
	.word 0xf05ce025  ! 4927: LDX_I	ldx	[%r19 + 0x0025], %r24
	mov	1, %r14
	.word 0xa193a000  ! 4931: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 4932: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb540000  ! 4936: RDPR_GL	<illegal instruction>
	.word 0xf24de142  ! 4938: LDSB_I	ldsb	[%r23 + 0x0142], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81cc000  ! 4947: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xf845e104  ! 4948: LDSW_I	ldsw	[%r23 + 0x0104], %r28
	.word 0xf644201e  ! 4952: LDSW_I	ldsw	[%r16 + 0x001e], %r27
	.word 0xb5520000  ! 4954: RDPR_PIL	<illegal instruction>
	.word 0xbc940000  ! 4957: ORcc_R	orcc 	%r16, %r0, %r30
	setx	0x1000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd355000  ! 4962: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xbf3c3001  ! 4964: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xb0b42142  ! 4965: ORNcc_I	orncc 	%r16, 0x0142, %r24
	.word 0xf40c205f  ! 4967: LDUB_I	ldub	[%r16 + 0x005f], %r26
	.word 0xb3500000  ! 4968: RDPR_TPC	<illegal instruction>
	.word 0xfc5d2013  ! 4970: LDX_I	ldx	[%r20 + 0x0013], %r30
	.word 0xb9643801  ! 4973: MOVcc_I	<illegal instruction>
	.word 0xf05ca1ef  ! 4977: LDX_I	ldx	[%r18 + 0x01ef], %r24
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819421a2  ! 4982: WRPR_TPC_I	wrpr	%r16, 0x01a2, %tpc
	.word 0xb5520000  ! 4984: RDPR_PIL	<illegal instruction>
	.word 0xb37dc400  ! 4985: MOVR_R	movre	%r23, %r0, %r25
	.word 0xfa1d8000  ! 4988: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xb951c000  ! 4991: RDPR_TL	<illegal instruction>
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c20c9  ! 4997: LDX_I	ldx	[%r16 + 0x00c9], %r26
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5a448c0  ! 1: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xbfa44820  ! 3: FADDs	fadds	%f17, %f0, %f31
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 7: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb61ca0f3  ! 10: XOR_I	xor 	%r18, 0x00f3, %r27
	.word 0xb1a00520  ! 13: FSQRTs	fsqrt	
	.word 0xb9641800  ! 15: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xb024c000  ! 21: SUB_R	sub 	%r19, %r0, %r24
	.word 0xbfa4c9a0  ! 22: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb3a58840  ! 28: FADDd	faddd	%f22, %f0, %f56
	.word 0xb29d8000  ! 29: XORcc_R	xorcc 	%r22, %r0, %r25
	setx	data_start_0, %g1, %r17
	.word 0xbda81820  ! 35: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3504000  ! 36: RDPR_TNPC	<illegal instruction>
	.word 0xb151c000  ! 41: RDPR_TL	<illegal instruction>
	.word 0xb3a00040  ! 42: FMOVd	fmovd	%f0, %f56
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda40840  ! 45: FADDd	faddd	%f16, %f0, %f30
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 47: RDPR_TNPC	<illegal instruction>
	.word 0xb7a80820  ! 57: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0xb9aa8820  ! 61: FMOVG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xbfa00520  ! 75: FSQRTs	fsqrt	
	.word 0xbfa4c9c0  ! 81: FDIVd	fdivd	%f50, %f0, %f62
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 86: FSQRTs	fsqrt	
	.word 0x83942046  ! 88: WRPR_TNPC_I	wrpr	%r16, 0x0046, %tnpc
	.word 0xb3a54920  ! 90: FMULs	fmuls	%f21, %f0, %f25
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x859420d1  ! 95: WRPR_TSTATE_I	wrpr	%r16, 0x00d1, %tstate
	.word 0xb3a548e0  ! 97: FSUBq	dis not found

	.word 0xb5a81820  ! 99: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb504000  ! 102: RDPR_TNPC	<illegal instruction>
	.word 0xb1aa8820  ! 103: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a449a0  ! 104: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb5a8c820  ! 105: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbf2ca001  ! 107: SLL_I	sll 	%r18, 0x0001, %r31
	.word 0xb1a80820  ! 110: FMOVN	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	.word 0xb72ca001  ! 113: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xbda80820  ! 115: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbda8c820  ! 118: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00020  ! 122: FMOVs	fmovs	%f0, %f27
	setx	0x20117, %g1, %o0
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
	.word 0xbda4c9c0  ! 125: FDIVd	fdivd	%f50, %f0, %f30
	setx	data_start_6, %g1, %r19
	.word 0xb1a00020  ! 130: FMOVs	fmovs	%f0, %f24
	.word 0xb6b420c7  ! 135: SUBCcc_I	orncc 	%r16, 0x00c7, %r27
	.word 0xb5a81420  ! 136: FMOVRNZ	dis not found

	.word 0xb1a5c9c0  ! 140: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb3480000  ! 144: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbba448a0  ! 145: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbba5c960  ! 147: FMULq	dis not found

	setx	0x20029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xbda8c820  ! 155: FMOVL	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0xb3ab0820  ! 157: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa8820  ! 161: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb03ce014  ! 163: XNOR_I	xnor 	%r19, 0x0014, %r24
	.word 0xb1508000  ! 164: RDPR_TSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r22
	mov	0, %r14
	.word 0xa193a000  ! 169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 181: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa80c20  ! 183: FMOVRLZ	dis not found

	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa54840  ! 186: FADDd	faddd	%f52, %f0, %f62
	.word 0xb1a80c20  ! 187: FMOVRLZ	dis not found

	.word 0xb9510000  ! 188: RDPR_TICK	<illegal instruction>
	.word 0xb9a54960  ! 191: FMULq	dis not found

	setx	data_start_6, %g1, %r22
	.word 0xbb7c6401  ! 195: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xbba5c8a0  ! 196: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb1a00540  ! 197: FSQRTd	fsqrt	
	.word 0xbfa80c20  ! 198: FMOVRLZ	dis not found

	.word 0x8994a071  ! 201: WRPR_TICK_I	wrpr	%r18, 0x0071, %tick
	.word 0x8d94e1f2  ! 203: WRPR_PSTATE_I	wrpr	%r19, 0x01f2, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x87952102  ! 206: WRPR_TT_I	wrpr	%r20, 0x0102, %tt
	.word 0xb5a5c940  ! 208: FMULd	fmuld	%f54, %f0, %f26
	.word 0xbf504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xb9a588a0  ! 225: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xbfa8c820  ! 226: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb21d208b  ! 229: XOR_I	xor 	%r20, 0x008b, %r25
	setx	0x10, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 232: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r16
	.word 0xb9510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xbfa00540  ! 245: FSQRTd	fsqrt	
	.word 0xb60d4000  ! 246: AND_R	and 	%r21, %r0, %r27
	.word 0xb3540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xb5ab8820  ! 249: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00560  ! 253: FSQRTq	fsqrt	
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982801  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0801, %hpstate
	setx	data_start_3, %g1, %r17
	.word 0xb5a81c20  ! 268: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983a83  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a83, %hpstate
	.word 0xb9a90820  ! 273: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r17
	.word 0xbfaa4820  ! 276: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x819521c5  ! 277: WRPR_TPC_I	wrpr	%r20, 0x01c5, %tpc
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 282: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba00520  ! 285: FSQRTs	fsqrt	
	.word 0xb60d214e  ! 287: AND_I	and 	%r20, 0x014e, %r27
	.word 0xb1a4c8a0  ! 291: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb3a58960  ! 293: FMULq	dis not found

	.word 0xb1a5c8c0  ! 294: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb7a00560  ! 298: FSQRTq	fsqrt	
	.word 0xbbaa4820  ! 299: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48820  ! 300: FADDs	fadds	%f18, %f0, %f24
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0xb150c000  ! 316: RDPR_TT	<illegal instruction>
	.word 0xbda81420  ! 319: FMOVRNZ	dis not found

	.word 0xbda80c20  ! 320: FMOVRLZ	dis not found

	.word 0xb5a488c0  ! 322: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xb9a5c9a0  ! 323: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x8d94e06d  ! 325: WRPR_PSTATE_I	wrpr	%r19, 0x006d, %pstate
	.word 0xb5a9c820  ! 326: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0x89952169  ! 328: WRPR_TICK_I	wrpr	%r20, 0x0169, %tick
	.word 0xb3a88820  ! 329: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c860  ! 333: FADDq	dis not found

	.word 0xbba4c8e0  ! 334: FSUBq	dis not found

	.word 0xb73d2001  ! 338: SRA_I	sra 	%r20, 0x0001, %r27
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942177  ! 345: WRPR_TPC_I	wrpr	%r16, 0x0177, %tpc
	.word 0xbda58840  ! 346: FADDd	faddd	%f22, %f0, %f30
	.word 0xb3500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0xb4052151  ! 349: ADD_I	add 	%r20, 0x0151, %r26
	.word 0xb9aac820  ! 352: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb32db001  ! 357: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xb5ab8820  ! 359: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x8d9420a5  ! 363: WRPR_PSTATE_I	wrpr	%r16, 0x00a5, %pstate
	.word 0x8995a145  ! 364: WRPR_TICK_I	wrpr	%r22, 0x0145, %tick
	.word 0xbba4c8c0  ! 365: FSUBd	fsubd	%f50, %f0, %f60
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 368: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda589a0  ! 372: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xb9a84820  ! 373: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0x89946053  ! 378: WRPR_TICK_I	wrpr	%r17, 0x0053, %tick
	.word 0x9195a1e8  ! 383: WRPR_PIL_I	wrpr	%r22, 0x01e8, %pil
	.word 0xbfa548e0  ! 385: FSUBq	dis not found

	.word 0xbda50860  ! 386: FADDq	dis not found

	.word 0x819560e4  ! 395: WRPR_TPC_I	wrpr	%r21, 0x00e4, %tpc
	.word 0xb3a88820  ! 401: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x10326, %g1, %o0
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
	.word 0xb3a80820  ! 404: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5a54960  ! 405: FMULq	dis not found

	.word 0xbba548c0  ! 408: FSUBd	fsubd	%f52, %f0, %f60
	setx	data_start_7, %g1, %r18
	.word 0x8794a02b  ! 411: WRPR_TT_I	wrpr	%r18, 0x002b, %tt
	.word 0xb3aac820  ! 412: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda489e0  ! 413: FDIVq	dis not found

	.word 0xb7a80c20  ! 415: FMOVRLZ	dis not found

	.word 0xb8c58000  ! 418: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xb3a48940  ! 419: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbf2c9000  ! 428: SLLX_R	sllx	%r18, %r0, %r31
	.word 0xb9a409e0  ! 430: FDIVq	dis not found

	.word 0xb9a508a0  ! 431: FSUBs	fsubs	%f20, %f0, %f28
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba50860  ! 434: FADDq	dis not found

	.word 0xb7a88820  ! 435: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb4958000  ! 437: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0x899561d9  ! 439: WRPR_TICK_I	wrpr	%r21, 0x01d9, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xb5aa4820  ! 441: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb351c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xb9a549c0  ! 460: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb7a5c9e0  ! 461: FDIVq	dis not found

	.word 0xbba4c9e0  ! 466: FDIVq	dis not found

	.word 0xbfa00540  ! 467: FSQRTd	fsqrt	
	.word 0xb33c4000  ! 469: SRA_R	sra 	%r17, %r0, %r25
	.word 0x919561d5  ! 470: WRPR_PIL_I	wrpr	%r21, 0x01d5, %pil
	setx	0x30139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 475: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a589c0  ! 477: FDIVd	fdivd	%f22, %f0, %f28
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 485: RDPR_PSTATE	<illegal instruction>
	.word 0x83942150  ! 486: WRPR_TNPC_I	wrpr	%r16, 0x0150, %tnpc
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 493: FMOVs	fmovs	%f0, %f24
	.word 0xbba548e0  ! 497: FSUBq	dis not found

	.word 0xb3480000  ! 498: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3a9c820  ! 500: FMOVVS	fmovs	%fcc1, %f0, %f25
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	.word 0xb9a449a0  ! 509: FDIVs	fdivs	%f17, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3510000  ! 521: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0xb7a00540  ! 524: FSQRTd	fsqrt	
	.word 0xb5a9c820  ! 528: FMOVVS	fmovs	%fcc1, %f0, %f26
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa449c0  ! 532: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb29c0000  ! 533: XORcc_R	xorcc 	%r16, %r0, %r25
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 537: FMOVRNZ	dis not found

	.word 0xb1a00520  ! 539: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f932000  ! 541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa90820  ! 542: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 545: FMOVCC	fmovs	%fcc1, %f0, %f29
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2c40000  ! 552: ADDCcc_R	addccc 	%r16, %r0, %r25
	.word 0xb3a98820  ! 557: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb7504000  ! 559: RDPR_TNPC	<illegal instruction>
	.word 0xbda4c8e0  ! 560: FSUBq	dis not found

	.word 0xbba5c8c0  ! 561: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb7a00040  ! 564: FMOVd	fmovd	%f0, %f58
	.word 0xb12d1000  ! 566: SLLX_R	sllx	%r20, %r0, %r24
	.word 0x8394214c  ! 568: WRPR_TNPC_I	wrpr	%r16, 0x014c, %tnpc
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 571: FSQRTd	fsqrt	
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb5211c  ! 577: SUBCcc_I	orncc 	%r20, 0x011c, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0xbba00040  ! 582: FMOVd	fmovd	%f0, %f60
	.word 0xb1a54960  ! 584: FMULq	dis not found

	.word 0xbda408c0  ! 585: FSUBd	fsubd	%f16, %f0, %f30
	.word 0x839561c4  ! 590: WRPR_TNPC_I	wrpr	%r21, 0x01c4, %tnpc
	.word 0xb215e16a  ! 591: OR_I	or 	%r23, 0x016a, %r25
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 598: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3510000  ! 601: RDPR_TICK	<illegal instruction>
	.word 0xb685c000  ! 602: ADDcc_R	addcc 	%r23, %r0, %r27
	.word 0xb1a00520  ! 604: FSQRTs	fsqrt	
	.word 0x8794a015  ! 607: WRPR_TT_I	wrpr	%r18, 0x0015, %tt
	.word 0xb53d5000  ! 608: SRAX_R	srax	%r21, %r0, %r26
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e00c  ! 612: WRPR_TICK_I	wrpr	%r19, 0x000c, %tick
	.word 0xb5aa0820  ! 613: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7480000  ! 614: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbc0c8000  ! 616: AND_R	and 	%r18, %r0, %r30
	.word 0xb1504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xbd35d000  ! 621: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xbf51c000  ! 627: RDPR_TL	<illegal instruction>
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba34a047  ! 633: ORN_I	orn 	%r18, 0x0047, %r29
	.word 0x8d94e0cd  ! 635: WRPR_PSTATE_I	wrpr	%r19, 0x00cd, %pstate
	.word 0xbba81c20  ! 639: FMOVRGEZ	dis not found

	.word 0xb7a588a0  ! 642: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb7a448e0  ! 643: FSUBq	dis not found

	.word 0xb7500000  ! 644: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8e0  ! 652: FSUBq	dis not found

	.word 0xb5a81c20  ! 654: FMOVRGEZ	dis not found

	.word 0xbdabc820  ! 655: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba98820  ! 659: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbbabc820  ! 661: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb09de1fc  ! 663: XORcc_I	xorcc 	%r23, 0x01fc, %r24
	.word 0xb5a00560  ! 665: FSQRTq	fsqrt	
	.word 0xbda81820  ! 666: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb1a4c820  ! 668: FADDs	fadds	%f19, %f0, %f24
	.word 0x8994e0f1  ! 669: WRPR_TICK_I	wrpr	%r19, 0x00f1, %tick
	.word 0xb9a5c8a0  ! 671: FSUBs	fsubs	%f23, %f0, %f28
	setx	data_start_3, %g1, %r22
	.word 0xb3a50960  ! 680: FMULq	dis not found

	.word 0xbfa81420  ! 681: FMOVRNZ	dis not found

	.word 0xb295203c  ! 683: ORcc_I	orcc 	%r20, 0x003c, %r25
	.word 0xbda40940  ! 685: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb97d4400  ! 686: MOVR_R	movre	%r21, %r0, %r28
	.word 0xb7ab8820  ! 689: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0x8d95a078  ! 692: WRPR_PSTATE_I	wrpr	%r22, 0x0078, %pstate
	.word 0xb3a98820  ! 693: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a1ff  ! 696: WRPR_PSTATE_I	wrpr	%r22, 0x01ff, %pstate
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942038  ! 699: WRPR_TT_I	wrpr	%r16, 0x0038, %tt
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 706: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbb510000  ! 707: RDPR_TICK	<illegal instruction>
	.word 0xb9a589c0  ! 714: FDIVd	fdivd	%f22, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xb0bc0000  ! 721: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xbda50860  ! 725: FADDq	dis not found

	.word 0x9194a084  ! 728: WRPR_PIL_I	wrpr	%r18, 0x0084, %pil
	.word 0xb5a80820  ! 729: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a44920  ! 731: FMULs	fmuls	%f17, %f0, %f24
	.word 0xbd50c000  ! 733: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 738: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb534f001  ! 740: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb9a5c820  ! 741: FADDs	fadds	%f23, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80c20  ! 743: FMOVRLZ	dis not found

	.word 0xbc344000  ! 747: SUBC_R	orn 	%r17, %r0, %r30
	.word 0xb5504000  ! 750: RDPR_TNPC	<illegal instruction>
	.word 0xb5a4c9a0  ! 752: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb7a5c8c0  ! 753: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb3a00040  ! 755: FMOVd	fmovd	%f0, %f56
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 761: FSQRTq	fsqrt	
	.word 0xbfa98820  ! 762: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba80c20  ! 766: FMOVRLZ	dis not found

	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a448a0  ! 769: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xb5a9c820  ! 772: FMOVVS	fmovs	%fcc1, %f0, %f26
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50820  ! 779: FADDs	fadds	%f20, %f0, %f26
	.word 0xbbab8820  ! 781: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8d94a0a2  ! 784: WRPR_PSTATE_I	wrpr	%r18, 0x00a2, %pstate
	.word 0xb5a44960  ! 785: FMULq	dis not found

	.word 0xb7a4c9e0  ! 786: FDIVq	dis not found

	.word 0xbba40820  ! 787: FADDs	fadds	%f16, %f0, %f29
	.word 0xbfa408a0  ! 788: FSUBs	fsubs	%f16, %f0, %f31
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba509a0  ! 793: FDIVs	fdivs	%f20, %f0, %f29
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 798: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbfa4c860  ! 799: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4340000  ! 804: ORN_R	orn 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xbf504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb9a48820  ! 815: FADDs	fadds	%f18, %f0, %f28
	setx	0x1030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0xb9a549a0  ! 821: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xbfa81420  ! 823: FMOVRNZ	dis not found

	.word 0xbfa8c820  ! 827: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbda5c960  ! 828: FMULq	dis not found

	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6040000  ! 843: ADD_R	add 	%r16, %r0, %r27
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbc4000  ! 856: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xbba98820  ! 857: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5aac820  ! 858: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a54940  ! 859: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb1aa8820  ! 860: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbf51c000  ! 862: RDPR_TL	<illegal instruction>
	.word 0xbda94820  ! 868: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00560  ! 869: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983803  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1803, %hpstate
	.word 0xb1a88820  ! 872: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbc1ce0de  ! 873: XOR_I	xor 	%r19, 0x00de, %r30
	.word 0xb3540000  ! 878: RDPR_GL	<illegal instruction>
	.word 0x8d95218a  ! 879: WRPR_PSTATE_I	wrpr	%r20, 0x018a, %pstate
	.word 0x8994e043  ! 880: WRPR_TICK_I	wrpr	%r19, 0x0043, %tick
	.word 0xb551c000  ! 881: RDPR_TL	<illegal instruction>
	.word 0xbba80420  ! 882: FMOVRZ	dis not found

	.word 0xb3aa8820  ! 884: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x87956148  ! 887: WRPR_TT_I	wrpr	%r21, 0x0148, %tt
	mov	2, %r12
	.word 0x8f932000  ! 888: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a00040  ! 890: FMOVd	fmovd	%f0, %f58
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb48de03e  ! 894: ANDcc_I	andcc 	%r23, 0x003e, %r26
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 899: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbe9c4000  ! 901: XORcc_R	xorcc 	%r17, %r0, %r31
	mov	1, %r14
	.word 0xa193a000  ! 902: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a9c820  ! 903: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a509c0  ! 904: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xb52c4000  ! 908: SLL_R	sll 	%r17, %r0, %r26
	.word 0xbc0c8000  ! 909: AND_R	and 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983801  ! 914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1801, %hpstate
	.word 0xbbaa8820  ! 915: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a48860  ! 916: FADDq	dis not found

	.word 0x8394a069  ! 918: WRPR_TNPC_I	wrpr	%r18, 0x0069, %tnpc
	.word 0xbda90820  ! 919: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a40960  ! 920: FMULq	dis not found

	.word 0xb3a589a0  ! 924: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xbf50c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 927: FSQRTs	fsqrt	
	.word 0xb5ab4820  ! 929: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb02c2113  ! 930: ANDN_I	andn 	%r16, 0x0113, %r24
	.word 0xbbaa4820  ! 931: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbf504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xb1a58840  ! 940: FADDd	faddd	%f22, %f0, %f24
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	.word 0x899420fc  ! 948: WRPR_TICK_I	wrpr	%r16, 0x00fc, %tick
	.word 0xb9a00040  ! 952: FMOVd	fmovd	%f0, %f28
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8e0  ! 957: FSUBq	dis not found

	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 960: RDPR_PSTATE	<illegal instruction>
	.word 0xbd518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xbba8c820  ! 966: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbd520000  ! 967: RDPR_PIL	<illegal instruction>
	.word 0x89952100  ! 968: WRPR_TICK_I	wrpr	%r20, 0x0100, %tick
	.word 0xb5a98820  ! 970: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a9c820  ! 971: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a588c0  ! 973: FSUBd	fsubd	%f22, %f0, %f24
	setx	data_start_5, %g1, %r17
	.word 0xb9a00520  ! 975: FSQRTs	fsqrt	
	.word 0xbba81c20  ! 977: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x87942041  ! 987: WRPR_TT_I	wrpr	%r16, 0x0041, %tt
	.word 0xb9a40820  ! 989: FADDs	fadds	%f16, %f0, %f28
	.word 0x9194207b  ! 991: WRPR_PIL_I	wrpr	%r16, 0x007b, %pil
	.word 0xbb3d2001  ! 994: SRA_I	sra 	%r20, 0x0001, %r29
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 999: FMOVRZ	dis not found

	.word 0xb3510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xb7a589c0  ! 1006: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb1540000  ! 1007: RDPR_GL	<illegal instruction>
	.word 0xbd3ca001  ! 1009: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0xb3a94820  ! 1010: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xba146078  ! 1011: OR_I	or 	%r17, 0x0078, %r29
	.word 0x8d942177  ! 1014: WRPR_PSTATE_I	wrpr	%r16, 0x0177, %pstate
	.word 0xb5a508c0  ! 1016: FSUBd	fsubd	%f20, %f0, %f26
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c840  ! 1019: FADDd	faddd	%f50, %f0, %f24
	.word 0xb7a40820  ! 1024: FADDs	fadds	%f16, %f0, %f27
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 1030: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf520000  ! 1037: RDPR_PIL	<illegal instruction>
	.word 0x8d952191  ! 1038: WRPR_PSTATE_I	wrpr	%r20, 0x0191, %pstate
	.word 0xb7a98820  ! 1042: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 1044: FSQRTs	fsqrt	
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 1048: FMOVs	fmovs	%f0, %f24
	.word 0xb5a50860  ! 1049: FADDq	dis not found

	.word 0xb7a408e0  ! 1050: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983b53  ! 1052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b53, %hpstate
	.word 0xbfa84820  ! 1054: FMOVE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983d09  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d09, %hpstate
	.word 0xb9a50940  ! 1060: FMULd	fmuld	%f20, %f0, %f28
	.word 0xb3a00540  ! 1061: FSQRTd	fsqrt	
	.word 0xb4350000  ! 1063: ORN_R	orn 	%r20, %r0, %r26
	.word 0xbfa489e0  ! 1064: FDIVq	dis not found

	.word 0xb5a81420  ! 1069: FMOVRNZ	dis not found

	.word 0xb9480000  ! 1070: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9a84820  ! 1071: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbec5c000  ! 1074: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0xbba54860  ! 1075: FADDq	dis not found

	.word 0x8195a0e6  ! 1076: WRPR_TPC_I	wrpr	%r22, 0x00e6, %tpc
	setx	data_start_3, %g1, %r20
	.word 0xbba00540  ! 1079: FSQRTd	fsqrt	
	.word 0xb1510000  ! 1080: RDPR_TICK	<illegal instruction>
	.word 0x919520b8  ! 1083: WRPR_PIL_I	wrpr	%r20, 0x00b8, %pil
	.word 0xbba449a0  ! 1084: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb7a00520  ! 1085: FSQRTs	fsqrt	
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 1094: RDPR_PSTATE	<illegal instruction>
	.word 0xb5aa0820  ! 1097: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81820  ! 1098: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 1105: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00040  ! 1106: FMOVd	fmovd	%f0, %f56
	.word 0xbda8c820  ! 1110: FMOVL	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a8b  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 1130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xb7aa8820  ! 1131: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xba45c000  ! 1133: ADDC_R	addc 	%r23, %r0, %r29
	.word 0x839521ee  ! 1134: WRPR_TNPC_I	wrpr	%r20, 0x01ee, %tnpc
	.word 0xb3a5c820  ! 1138: FADDs	fadds	%f23, %f0, %f25
	.word 0xbf518000  ! 1140: RDPR_PSTATE	<illegal instruction>
	.word 0xbba80c20  ! 1141: FMOVRLZ	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 1149: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 1150: RDPR_TSTATE	<illegal instruction>
	.word 0xbfaa0820  ! 1155: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda80c20  ! 1156: FMOVRLZ	dis not found

	.word 0xb1a5c820  ! 1157: FADDs	fadds	%f23, %f0, %f24
	.word 0xb1a00020  ! 1160: FMOVs	fmovs	%f0, %f24
	.word 0xbda00540  ! 1163: FSQRTd	fsqrt	
	.word 0xb351c000  ! 1167: RDPR_TL	<illegal instruction>
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 1170: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 1171: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab8820  ! 1172: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 1174: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3aa4820  ! 1177: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb750c000  ! 1178: RDPR_TT	<illegal instruction>
	.word 0xb3a80820  ! 1180: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb12d9000  ! 1186: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xbda509c0  ! 1187: FDIVd	fdivd	%f20, %f0, %f30
	.word 0xb350c000  ! 1188: RDPR_TT	<illegal instruction>
	.word 0x8595e171  ! 1190: WRPR_TSTATE_I	wrpr	%r23, 0x0171, %tstate
	.word 0xb3aa8820  ! 1195: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7518000  ! 1197: RDPR_PSTATE	<illegal instruction>
	.word 0x8d95a0d5  ! 1198: WRPR_PSTATE_I	wrpr	%r22, 0x00d5, %pstate
	.word 0xb7a00560  ! 1200: FSQRTq	fsqrt	
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a40940  ! 1204: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb4144000  ! 1205: OR_R	or 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982949  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	.word 0xb1a80420  ! 1210: FMOVRZ	dis not found

	.word 0xb48ca0b9  ! 1219: ANDcc_I	andcc 	%r18, 0x00b9, %r26
	.word 0xb9510000  ! 1224: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r19
	.word 0xbba81820  ! 1230: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbfa48820  ! 1236: FADDs	fadds	%f18, %f0, %f31
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a54940  ! 1241: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb9a509e0  ! 1242: FDIVq	dis not found

	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 1246: RDPR_TSTATE	<illegal instruction>
	.word 0xbb510000  ! 1249: RDPR_TICK	<illegal instruction>
	.word 0xbca54000  ! 1252: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb5540000  ! 1254: RDPR_GL	<illegal instruction>
	.word 0x8595a1b9  ! 1255: WRPR_TSTATE_I	wrpr	%r22, 0x01b9, %tstate
	.word 0x8194215a  ! 1259: WRPR_TPC_I	wrpr	%r16, 0x015a, %tpc
	mov	0, %r14
	.word 0xa193a000  ! 1260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb08d206c  ! 1261: ANDcc_I	andcc 	%r20, 0x006c, %r24
	.word 0xbd510000  ! 1267: RDPR_TICK	<illegal instruction>
	.word 0xbe15c000  ! 1273: OR_R	or 	%r23, %r0, %r31
	.word 0xb1a409c0  ! 1276: FDIVd	fdivd	%f16, %f0, %f24
	.word 0x8195604f  ! 1279: WRPR_TPC_I	wrpr	%r21, 0x004f, %tpc
	.word 0xb044a1be  ! 1289: ADDC_I	addc 	%r18, 0x01be, %r24
	.word 0xb7a80820  ! 1290: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb614e048  ! 1293: OR_I	or 	%r19, 0x0048, %r27
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1296: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 1298: FSQRTq	fsqrt	
	.word 0xb3a90820  ! 1299: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 1313: RDPR_TNPC	<illegal instruction>
	.word 0x8d95610f  ! 1316: WRPR_PSTATE_I	wrpr	%r21, 0x010f, %pstate
	.word 0xbda00020  ! 1317: FMOVs	fmovs	%f0, %f30
	.word 0xbda81c20  ! 1321: FMOVRGEZ	dis not found

	.word 0xbda508e0  ! 1322: FSUBq	dis not found

	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1325: RDPR_PSTATE	<illegal instruction>
	.word 0xbfaa8820  ! 1327: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xba05c000  ! 1328: ADD_R	add 	%r23, %r0, %r29
	.word 0xbfa4c8c0  ! 1333: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb5aac820  ! 1334: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81820  ! 1336: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbfa80820  ! 1338: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80c20  ! 1341: FMOVRLZ	dis not found

	.word 0xb3a50960  ! 1342: FMULq	dis not found

	.word 0xb9a5c820  ! 1347: FADDs	fadds	%f23, %f0, %f28
	.word 0xb9a81c20  ! 1351: FMOVRGEZ	dis not found

	.word 0xb7a81c20  ! 1355: FMOVRGEZ	dis not found

	.word 0xbf3cc000  ! 1358: SRA_R	sra 	%r19, %r0, %r31
	.word 0xb5a409c0  ! 1362: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xbda5c8e0  ! 1365: FSUBq	dis not found

	.word 0xbd540000  ! 1368: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 1372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0xbba81420  ! 1373: FMOVRNZ	dis not found

	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 1375: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb52c2001  ! 1376: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xbb2ca001  ! 1377: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xbbab0820  ! 1380: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbd2c1000  ! 1381: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xb5a80420  ! 1384: FMOVRZ	dis not found

	.word 0xb41d0000  ! 1386: XOR_R	xor 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	setx	0x230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508a0  ! 1394: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbfaa4820  ! 1399: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbd480000  ! 1404: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1405: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9aac820  ! 1407: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a589e0  ! 1411: FDIVq	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 1414: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfaa4820  ! 1415: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a589e0  ! 1420: FDIVq	dis not found

	.word 0xb7ab0820  ! 1421: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a50920  ! 1422: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbda5c960  ! 1423: FMULq	dis not found

	.word 0xb13c7001  ! 1426: SRAX_I	srax	%r17, 0x0001, %r24
	setx	0x2013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c820  ! 1432: FADDs	fadds	%f19, %f0, %f28
	.word 0xb9ab8820  ! 1433: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3518000  ! 1434: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a00040  ! 1437: FMOVd	fmovd	%f0, %f58
	.word 0xb4a52020  ! 1442: SUBcc_I	subcc 	%r20, 0x0020, %r26
	.word 0xb1a488e0  ! 1444: FSUBq	dis not found

	.word 0xba2de190  ! 1445: ANDN_I	andn 	%r23, 0x0190, %r29
	.word 0xb150c000  ! 1447: RDPR_TT	<illegal instruction>
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a004  ! 1450: WRPR_TPC_I	wrpr	%r22, 0x0004, %tpc
	.word 0xb5359000  ! 1451: SRLX_R	srlx	%r22, %r0, %r26
	.word 0xbb480000  ! 1452: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbf518000  ! 1458: RDPR_PSTATE	<illegal instruction>
	.word 0xb3480000  ! 1469: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7a00540  ! 1473: FSQRTd	fsqrt	
	.word 0xbfa548e0  ! 1476: FSUBq	dis not found

	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 1482: FMOVRNZ	dis not found

	.word 0xb7a88820  ! 1485: FMOVLE	fmovs	%fcc1, %f0, %f27
	mov	1, %r12
	.word 0x8f932000  ! 1486: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x81956161  ! 1488: WRPR_TPC_I	wrpr	%r21, 0x0161, %tpc
	.word 0x8994e146  ! 1490: WRPR_TICK_I	wrpr	%r19, 0x0146, %tick
	.word 0xb3a00540  ! 1491: FSQRTd	fsqrt	
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8c0  ! 1495: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb1a84820  ! 1496: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a48840  ! 1504: FADDd	faddd	%f18, %f0, %f28
	setx	data_start_4, %g1, %r20
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8c0  ! 1512: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb1a4c840  ! 1513: FADDd	faddd	%f50, %f0, %f24
	.word 0xbfaa0820  ! 1514: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0x8d9560f4  ! 1515: WRPR_PSTATE_I	wrpr	%r21, 0x00f4, %pstate
	mov	0, %r12
	.word 0x8f932000  ! 1519: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a4c840  ! 1522: FADDd	faddd	%f50, %f0, %f58
	.word 0xbbab0820  ! 1525: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x2013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb35c000  ! 1532: SRL_R	srl 	%r23, %r0, %r29
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xbda48940  ! 1542: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb9ab0820  ! 1545: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb0acc000  ! 1547: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xb52cc000  ! 1549: SLL_R	sll 	%r19, %r0, %r26
	.word 0xbfa48940  ! 1552: FMULd	fmuld	%f18, %f0, %f62
	.word 0x859421c5  ! 1553: WRPR_TSTATE_I	wrpr	%r16, 0x01c5, %tstate
	.word 0xb3a50940  ! 1554: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb62dc000  ! 1558: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbfa00020  ! 1563: FMOVs	fmovs	%f0, %f31
	.word 0xbd352001  ! 1566: SRL_I	srl 	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 1569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0xb2bc218c  ! 1570: XNORcc_I	xnorcc 	%r16, 0x018c, %r25
	.word 0xb2a4e13d  ! 1571: SUBcc_I	subcc 	%r19, 0x013d, %r25
	.word 0xb7a50940  ! 1572: FMULd	fmuld	%f20, %f0, %f58
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 1580: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x8995e0ed  ! 1581: WRPR_TICK_I	wrpr	%r23, 0x00ed, %tick
	.word 0xb9a84820  ! 1583: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a408a0  ! 1584: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb5a4c8c0  ! 1585: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb7a488e0  ! 1588: FSUBq	dis not found

	.word 0xb7abc820  ! 1591: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb5500000  ! 1596: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 1600: FSQRTq	fsqrt	
	.word 0xb7a44920  ! 1605: FMULs	fmuls	%f17, %f0, %f27
	.word 0xb5a94820  ! 1608: FMOVCS	fmovs	%fcc1, %f0, %f26
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 1610: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9518000  ! 1612: RDPR_PSTATE	<illegal instruction>
	.word 0xb1ab8820  ! 1613: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb551c000  ! 1615: RDPR_TL	<illegal instruction>
	.word 0xb1a00540  ! 1617: FSQRTd	fsqrt	
	.word 0xbda4c8e0  ! 1618: FSUBq	dis not found

	.word 0xb7500000  ! 1621: RDPR_TPC	<illegal instruction>
	.word 0x859460a5  ! 1622: WRPR_TSTATE_I	wrpr	%r17, 0x00a5, %tstate
	.word 0xb5a00540  ! 1623: FSQRTd	fsqrt	
	.word 0xb5a5c960  ! 1626: FMULq	dis not found

	.word 0xb3a548a0  ! 1627: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xb5a81c20  ! 1629: FMOVRGEZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 1630: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb88c4000  ! 1634: ANDcc_R	andcc 	%r17, %r0, %r28
	.word 0xb1a5c960  ! 1635: FMULq	dis not found

	.word 0xb1aa0820  ! 1640: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x899421ad  ! 1642: WRPR_TICK_I	wrpr	%r16, 0x01ad, %tick
	.word 0xbda44940  ! 1646: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb5a00540  ! 1647: FSQRTd	fsqrt	
	.word 0xb5ab4820  ! 1650: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbda489a0  ! 1651: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xb7a00520  ! 1653: FSQRTs	fsqrt	
	mov	1, %r14
	.word 0xa193a000  ! 1659: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5540000  ! 1660: RDPR_GL	<illegal instruction>
	setx	0x10139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 1664: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbda48960  ! 1665: FMULq	dis not found

	.word 0xbb518000  ! 1666: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1670: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a44960  ! 1671: FMULq	dis not found

	.word 0xb5a4c860  ! 1672: FADDq	dis not found

	.word 0x8594607c  ! 1675: WRPR_TSTATE_I	wrpr	%r17, 0x007c, %tstate
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb21c4000  ! 1681: XOR_R	xor 	%r17, %r0, %r25
	.word 0xbfa00520  ! 1687: FSQRTs	fsqrt	
	.word 0xb12c8000  ! 1688: SLL_R	sll 	%r18, %r0, %r24
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0xbe248000  ! 1693: SUB_R	sub 	%r18, %r0, %r31
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 1696: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb32c5000  ! 1699: SLLX_R	sllx	%r17, %r0, %r25
	.word 0x8d94e025  ! 1701: WRPR_PSTATE_I	wrpr	%r19, 0x0025, %pstate
	.word 0xb5480000  ! 1704: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7abc820  ! 1705: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 1706: FSQRTs	fsqrt	
	.word 0x8d946174  ! 1708: WRPR_PSTATE_I	wrpr	%r17, 0x0174, %pstate
	.word 0xb5a84820  ! 1710: FMOVE	fmovs	%fcc1, %f0, %f26
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 1715: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00040  ! 1717: FMOVd	fmovd	%f0, %f56
	.word 0xbfaa0820  ! 1718: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb6b4a171  ! 1721: SUBCcc_I	orncc 	%r18, 0x0171, %r27
	.word 0xb9ab8820  ! 1722: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a90820  ! 1729: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c8c0  ! 1733: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xbba50820  ! 1734: FADDs	fadds	%f20, %f0, %f29
	.word 0xb8050000  ! 1737: ADD_R	add 	%r20, %r0, %r28
	.word 0xb5a80820  ! 1738: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80420  ! 1739: FMOVRZ	dis not found

	.word 0xb1a40920  ! 1741: FMULs	fmuls	%f16, %f0, %f24
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1748: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbba88820  ! 1749: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a90820  ! 1751: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb92dc000  ! 1754: SLL_R	sll 	%r23, %r0, %r28
	.word 0xb7500000  ! 1756: RDPR_TPC	<illegal instruction>
	.word 0xb7359000  ! 1759: SRLX_R	srlx	%r22, %r0, %r27
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952138  ! 1761: WRPR_TICK_I	wrpr	%r20, 0x0138, %tick
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	.word 0xbba58920  ! 1775: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb5ab0820  ! 1778: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c8e0  ! 1779: FSUBq	dis not found

	.word 0xbfab4820  ! 1780: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2d4000  ! 1783: SLL_R	sll 	%r21, %r0, %r30
	.word 0x8195210a  ! 1784: WRPR_TPC_I	wrpr	%r20, 0x010a, %tpc
	.word 0xbb3ce001  ! 1790: SRA_I	sra 	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b59  ! 1791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b59, %hpstate
	.word 0x839420d3  ! 1795: WRPR_TNPC_I	wrpr	%r16, 0x00d3, %tnpc
	.word 0xb5a408e0  ! 1797: FSUBq	dis not found

	.word 0x8994a1a6  ! 1803: WRPR_TICK_I	wrpr	%r18, 0x01a6, %tick
	.word 0xbf500000  ! 1806: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c81  ! 1808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c81, %hpstate
	.word 0xb7a80420  ! 1809: FMOVRZ	dis not found

	.word 0xb7a00520  ! 1811: FSQRTs	fsqrt	
	.word 0x81946173  ! 1812: WRPR_TPC_I	wrpr	%r17, 0x0173, %tpc
	.word 0xb8a5a0e9  ! 1817: SUBcc_I	subcc 	%r22, 0x00e9, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	setx	data_start_6, %g1, %r20
	.word 0x8994a042  ! 1826: WRPR_TICK_I	wrpr	%r18, 0x0042, %tick
	.word 0xb1a9c820  ! 1827: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb4158000  ! 1828: OR_R	or 	%r22, %r0, %r26
	.word 0x8994e1a6  ! 1829: WRPR_TICK_I	wrpr	%r19, 0x01a6, %tick
	.word 0xbf504000  ! 1836: RDPR_TNPC	<illegal instruction>
	.word 0xb7a54860  ! 1839: FADDq	dis not found

	.word 0xb3abc820  ! 1842: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a90820  ! 1844: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbf51c000  ! 1846: RDPR_TL	<illegal instruction>
	.word 0xbfa508c0  ! 1847: FSUBd	fsubd	%f20, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8ad8000  ! 1853: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xbf51c000  ! 1860: RDPR_TL	<illegal instruction>
	.word 0xb7a00560  ! 1863: FSQRTq	fsqrt	
	mov	0, %r14
	.word 0xa193a000  ! 1869: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 1876: FSQRTq	fsqrt	
	.word 0xb1a588e0  ! 1877: FSUBq	dis not found

	.word 0xb43da09f  ! 1880: XNOR_I	xnor 	%r22, 0x009f, %r26
	.word 0xbba00540  ! 1883: FSQRTd	fsqrt	
	.word 0xbbab4820  ! 1884: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbda00540  ! 1885: FSQRTd	fsqrt	
	.word 0xbba4c8c0  ! 1889: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbf520000  ! 1893: RDPR_PIL	<illegal instruction>
	.word 0xbb50c000  ! 1895: RDPR_TT	<illegal instruction>
	.word 0xb3aa0820  ! 1897: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb9a44960  ! 1909: FMULq	dis not found

	.word 0xbb540000  ! 1911: RDPR_GL	<illegal instruction>
	.word 0xb93d8000  ! 1913: SRA_R	sra 	%r22, %r0, %r28
	.word 0xbba00560  ! 1914: FSQRTq	fsqrt	
	.word 0xbda5c9e0  ! 1916: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 1920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xb9508000  ! 1921: RDPR_TSTATE	<illegal instruction>
	.word 0xbf480000  ! 1925: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9a54960  ! 1928: FMULq	dis not found

	.word 0xb7480000  ! 1930: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a00520  ! 1933: FSQRTs	fsqrt	
	.word 0xb9518000  ! 1939: RDPR_PSTATE	<illegal instruction>
	.word 0xb7aa4820  ! 1944: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8794a0ab  ! 1945: WRPR_TT_I	wrpr	%r18, 0x00ab, %tt
	.word 0xbcc58000  ! 1949: ADDCcc_R	addccc 	%r22, %r0, %r30
	.word 0xb1aa0820  ! 1956: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbfa9c820  ! 1958: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda00560  ! 1959: FSQRTq	fsqrt	
	.word 0xb3508000  ! 1963: RDPR_TSTATE	<illegal instruction>
	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb835e18c  ! 1965: ORN_I	orn 	%r23, 0x018c, %r28
	.word 0xbda98820  ! 1972: FMOVNEG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80c20  ! 1975: FMOVRLZ	dis not found

	.word 0xbba88820  ! 1976: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00520  ! 1977: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 1978: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbba90820  ! 1980: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00520  ! 1982: FSQRTs	fsqrt	
	.word 0xb5a00560  ! 1983: FSQRTq	fsqrt	
	.word 0x89956049  ! 1984: WRPR_TICK_I	wrpr	%r21, 0x0049, %tick
	.word 0xb7641800  ! 1987: MOVcc_R	<illegal instruction>
	.word 0xbac50000  ! 1988: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0x879460ce  ! 1991: WRPR_TT_I	wrpr	%r17, 0x00ce, %tt
	mov	0, %r14
	.word 0xa193a000  ! 1993: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda90820  ! 2001: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbaace0ef  ! 2002: ANDNcc_I	andncc 	%r19, 0x00ef, %r29
	.word 0x8d9420ec  ! 2003: WRPR_PSTATE_I	wrpr	%r16, 0x00ec, %pstate
	.word 0xb9ab8820  ! 2004: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb33c0000  ! 2008: SRA_R	sra 	%r16, %r0, %r25
	.word 0xb5a8c820  ! 2009: FMOVL	fmovs	%fcc1, %f0, %f26
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2240000  ! 2012: SUB_R	sub 	%r16, %r0, %r25
	.word 0x87942025  ! 2013: WRPR_TT_I	wrpr	%r16, 0x0025, %tt
	.word 0xb5a58940  ! 2019: FMULd	fmuld	%f22, %f0, %f26
	.word 0x87946197  ! 2021: WRPR_TT_I	wrpr	%r17, 0x0197, %tt
	.word 0xb3a00540  ! 2022: FSQRTd	fsqrt	
	.word 0x919421c6  ! 2023: WRPR_PIL_I	wrpr	%r16, 0x01c6, %pil
	.word 0xb950c000  ! 2031: RDPR_TT	<illegal instruction>
	.word 0xbba8c820  ! 2033: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb0448000  ! 2035: ADDC_R	addc 	%r18, %r0, %r24
	.word 0xb1480000  ! 2040: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda489a0  ! 2045: FDIVs	fdivs	%f18, %f0, %f30
	.word 0x81952190  ! 2051: WRPR_TPC_I	wrpr	%r20, 0x0190, %tpc
	.word 0xbfa81820  ! 2057: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3a80c20  ! 2059: FMOVRLZ	dis not found

	.word 0x8394a1c0  ! 2065: WRPR_TNPC_I	wrpr	%r18, 0x01c0, %tnpc
	.word 0xbe0ce026  ! 2066: AND_I	and 	%r19, 0x0026, %r31
	.word 0xb2c44000  ! 2068: ADDCcc_R	addccc 	%r17, %r0, %r25
	.word 0x8595e0d1  ! 2070: WRPR_TSTATE_I	wrpr	%r23, 0x00d1, %tstate
	.word 0x85956084  ! 2071: WRPR_TSTATE_I	wrpr	%r21, 0x0084, %tstate
	.word 0xbfa48940  ! 2072: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbfaa8820  ! 2074: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a50820  ! 2075: FADDs	fadds	%f20, %f0, %f24
	setx	data_start_1, %g1, %r17
	.word 0xbfa00520  ! 2079: FSQRTs	fsqrt	
	.word 0xbda90820  ! 2080: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00520  ! 2084: FSQRTs	fsqrt	
	.word 0xbfa48840  ! 2085: FADDd	faddd	%f18, %f0, %f62
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 2091: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb3a58820  ! 2092: FADDs	fadds	%f22, %f0, %f25
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	.word 0xb82d8000  ! 2095: ANDN_R	andn 	%r22, %r0, %r28
	.word 0xbd50c000  ! 2098: RDPR_TT	<illegal instruction>
	.word 0xbb7cc400  ! 2105: MOVR_R	movre	%r19, %r0, %r29
	.word 0xbd520000  ! 2106: RDPR_PIL	<illegal instruction>
	.word 0xbba448c0  ! 2108: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb5aa0820  ! 2109: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb495e1fb  ! 2113: ORcc_I	orcc 	%r23, 0x01fb, %r26
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3520ff  ! 2116: SUBC_I	orn 	%r20, 0x00ff, %r31
	.word 0xbda549e0  ! 2121: FDIVq	dis not found

	.word 0x879521ea  ! 2123: WRPR_TT_I	wrpr	%r20, 0x01ea, %tt
	.word 0xb1a88820  ! 2130: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb73c9000  ! 2131: SRAX_R	srax	%r18, %r0, %r27
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a44920  ! 2138: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb3a94820  ! 2139: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba58820  ! 2145: FADDs	fadds	%f22, %f0, %f29
	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 2151: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0x89952101  ! 2152: WRPR_TICK_I	wrpr	%r20, 0x0101, %tick
	.word 0xb33c3001  ! 2153: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0x8995613f  ! 2160: WRPR_TICK_I	wrpr	%r21, 0x013f, %tick
	.word 0xb5540000  ! 2164: RDPR_GL	<illegal instruction>
	.word 0xb3a448a0  ! 2165: FSUBs	fsubs	%f17, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a489a0  ! 2168: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb3a81820  ! 2169: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a40920  ! 2172: FMULs	fmuls	%f16, %f0, %f28
	.word 0xb3ab4820  ! 2173: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c960  ! 2177: FMULq	dis not found

	.word 0xb1510000  ! 2178: RDPR_TICK	<illegal instruction>
	.word 0xb5500000  ! 2180: RDPR_TPC	<illegal instruction>
	.word 0x85952126  ! 2185: WRPR_TSTATE_I	wrpr	%r20, 0x0126, %tstate
	.word 0x8594a17e  ! 2186: WRPR_TSTATE_I	wrpr	%r18, 0x017e, %tstate
	.word 0xb5a48820  ! 2187: FADDs	fadds	%f18, %f0, %f26
	.word 0xbfa4c9a0  ! 2190: FDIVs	fdivs	%f19, %f0, %f31
	.word 0x8d95e09b  ! 2192: WRPR_PSTATE_I	wrpr	%r23, 0x009b, %pstate
	.word 0xb92d6001  ! 2194: SLL_I	sll 	%r21, 0x0001, %r28
	.word 0x8594e0ff  ! 2195: WRPR_TSTATE_I	wrpr	%r19, 0x00ff, %tstate
	.word 0xbe0d6005  ! 2203: AND_I	and 	%r21, 0x0005, %r31
	.word 0xb7a48860  ! 2206: FADDq	dis not found

	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca4c000  ! 2215: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbfa81820  ! 2216: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb5641800  ! 2221: MOVcc_R	<illegal instruction>
	.word 0xbf51c000  ! 2223: RDPR_TL	<illegal instruction>
	.word 0xbda9c820  ! 2224: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6ad4000  ! 2226: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb5341000  ! 2227: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xbda00520  ! 2228: FSQRTs	fsqrt	
	.word 0xb1abc820  ! 2234: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbda54860  ! 2236: FADDq	dis not found

	.word 0xbd504000  ! 2238: RDPR_TNPC	<illegal instruction>
	.word 0x8995a051  ! 2241: WRPR_TICK_I	wrpr	%r22, 0x0051, %tick
	.word 0xb1508000  ! 2245: RDPR_TSTATE	<illegal instruction>
	.word 0xbbaa4820  ! 2250: FMOVNE	fmovs	%fcc1, %f0, %f29
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0xbfab0820  ! 2253: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x899461cf  ! 2254: WRPR_TICK_I	wrpr	%r17, 0x01cf, %tick
	.word 0xbfab8820  ! 2256: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9518000  ! 2257: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa408c0  ! 2258: FSUBd	fsubd	%f16, %f0, %f62
	.word 0x8795e1a5  ! 2259: WRPR_TT_I	wrpr	%r23, 0x01a5, %tt
	mov	2, %r14
	.word 0xa193a000  ! 2260: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb445c000  ! 2264: ADDC_R	addc 	%r23, %r0, %r26
	.word 0xbfa548a0  ! 2267: FSUBs	fsubs	%f21, %f0, %f31
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c860  ! 2274: FADDq	dis not found

	.word 0xb7520000  ! 2275: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d11  ! 2277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d11, %hpstate
	.word 0xb7aa0820  ! 2280: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb215a09d  ! 2282: OR_I	or 	%r22, 0x009d, %r25
	.word 0xb5a80820  ! 2283: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda5c860  ! 2287: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0xb3a81820  ! 2289: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb644a0d0  ! 2292: ADDC_I	addc 	%r18, 0x00d0, %r27
	setx	data_start_4, %g1, %r19
	.word 0xbda00560  ! 2296: FSQRTq	fsqrt	
	.word 0xbfa00540  ! 2297: FSQRTd	fsqrt	
	.word 0xb9a54860  ! 2298: FADDq	dis not found

	.word 0x8794e097  ! 2299: WRPR_TT_I	wrpr	%r19, 0x0097, %tt
	.word 0xb9355000  ! 2300: SRLX_R	srlx	%r21, %r0, %r28
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0xb5a48840  ! 2306: FADDd	faddd	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x899521e6  ! 2310: WRPR_TICK_I	wrpr	%r20, 0x01e6, %tick
	.word 0xb1a4c9e0  ! 2315: FDIVq	dis not found

	.word 0xbda80420  ! 2318: FMOVRZ	dis not found

	.word 0xb9a58840  ! 2319: FADDd	faddd	%f22, %f0, %f28
	.word 0xb9aa8820  ! 2320: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a54920  ! 2321: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb9a4c820  ! 2325: FADDs	fadds	%f19, %f0, %f28
	.word 0xb1a44820  ! 2326: FADDs	fadds	%f17, %f0, %f24
	.word 0xb5a48840  ! 2328: FADDd	faddd	%f18, %f0, %f26
	.word 0xbfa488c0  ! 2330: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb9510000  ! 2332: RDPR_TICK	rdpr	%tick, %r28
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9e0  ! 2335: FDIVq	dis not found

	.word 0xbba9c820  ! 2338: FMOVVS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9520000  ! 2341: RDPR_PIL	<illegal instruction>
	.word 0xb1a80c20  ! 2342: FMOVRLZ	dis not found

	.word 0xb0048000  ! 2345: ADD_R	add 	%r18, %r0, %r24
	.word 0xb9a00520  ! 2348: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba40920  ! 2353: FMULs	fmuls	%f16, %f0, %f29
	mov	0, %r12
	.word 0x8f932000  ! 2357: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa448e0  ! 2358: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	.word 0xbb508000  ! 2369: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa81420  ! 2372: FMOVRNZ	dis not found

	.word 0x899460a9  ! 2373: WRPR_TICK_I	wrpr	%r17, 0x00a9, %tick
	.word 0xb7a5c9a0  ! 2374: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbd50c000  ! 2376: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xb3a94820  ! 2379: FMOVCS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983e8b  ! 2381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8b, %hpstate
	.word 0xbda508a0  ! 2382: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb1a00540  ! 2385: FSQRTd	fsqrt	
	.word 0xb4954000  ! 2391: ORcc_R	orcc 	%r21, %r0, %r26
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbebca130  ! 2400: XNORcc_I	xnorcc 	%r18, 0x0130, %r31
	.word 0xb9a4c9c0  ! 2401: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x8995e0db  ! 2404: WRPR_TICK_I	wrpr	%r23, 0x00db, %tick
	.word 0xbba00520  ! 2406: FSQRTs	fsqrt	
	.word 0xb7518000  ! 2407: RDPR_PSTATE	<illegal instruction>
	.word 0xbcb58000  ! 2409: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xbc048000  ! 2413: ADD_R	add 	%r18, %r0, %r30
	.word 0xb7a98820  ! 2414: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb6b48000  ! 2415: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xb9a00520  ! 2419: FSQRTs	fsqrt	
	.word 0xb150c000  ! 2420: RDPR_TT	<illegal instruction>
	.word 0x8194e0f5  ! 2422: WRPR_TPC_I	wrpr	%r19, 0x00f5, %tpc
	.word 0xbabd0000  ! 2424: XNORcc_R	xnorcc 	%r20, %r0, %r29
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a5c8c0  ! 2429: FSUBd	fsubd	%f54, %f0, %f26
	setx	data_start_6, %g1, %r20
	.word 0xba1cc000  ! 2435: XOR_R	xor 	%r19, %r0, %r29
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2438: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 2440: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb9520000  ! 2441: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb520000  ! 2445: RDPR_PIL	<illegal instruction>
	.word 0x8d94a11c  ! 2447: WRPR_PSTATE_I	wrpr	%r18, 0x011c, %pstate
	.word 0xbfa50960  ! 2450: FMULq	dis not found

	.word 0xbda588a0  ! 2454: FSUBs	fsubs	%f22, %f0, %f30
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0xbfaa4820  ! 2462: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb751c000  ! 2467: RDPR_TL	<illegal instruction>
	.word 0xb5a48860  ! 2472: FADDq	dis not found

	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xb3a48860  ! 2492: FADDq	dis not found

	.word 0xb0946099  ! 2494: ORcc_I	orcc 	%r17, 0x0099, %r24
	.word 0xb1a94820  ! 2497: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 2502: RDPR_GL	<illegal instruction>
	.word 0xb1508000  ! 2507: RDPR_TSTATE	<illegal instruction>
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 2512: RDPR_TL	<illegal instruction>
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 2516: RDPR_TT	<illegal instruction>
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2523: RDPR_PSTATE	<illegal instruction>
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	.word 0xbfa40940  ! 2535: FMULd	fmuld	%f16, %f0, %f62
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2539: RDPR_GL	<illegal instruction>
	.word 0xb3a98820  ! 2540: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb235a1f6  ! 2546: SUBC_I	orn 	%r22, 0x01f6, %r25
	setx	0x30139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 2551: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab0820  ! 2553: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5540000  ! 2554: RDPR_GL	<illegal instruction>
	.word 0xb7aa4820  ! 2555: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8995a1ce  ! 2556: WRPR_TICK_I	wrpr	%r22, 0x01ce, %tick
	.word 0x919561c0  ! 2557: WRPR_PIL_I	wrpr	%r21, 0x01c0, %pil
	.word 0x8795e1e1  ! 2560: WRPR_TT_I	wrpr	%r23, 0x01e1, %tt
	.word 0xb5a4c9c0  ! 2561: FDIVd	fdivd	%f50, %f0, %f26
	setx	data_start_2, %g1, %r22
	setx	data_start_2, %g1, %r19
	.word 0xbba88820  ! 2568: FMOVLE	fmovs	%fcc1, %f0, %f29
	setx	data_start_5, %g1, %r19
	.word 0xb5a80c20  ! 2573: FMOVRLZ	dis not found

	.word 0xb3a00560  ! 2575: FSQRTq	fsqrt	
	.word 0xb3a48920  ! 2580: FMULs	fmuls	%f18, %f0, %f25
	.word 0xbfab8820  ! 2581: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a58840  ! 2590: FADDd	faddd	%f22, %f0, %f56
	.word 0xb1a548a0  ! 2591: FSUBs	fsubs	%f21, %f0, %f24
	setx	0x10217, %g1, %o0
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
	.word 0xbfa489a0  ! 2597: FDIVs	fdivs	%f18, %f0, %f31
	.word 0x85952080  ! 2599: WRPR_TSTATE_I	wrpr	%r20, 0x0080, %tstate
	.word 0xb5a8c820  ! 2600: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0x9195a1ad  ! 2602: WRPR_PIL_I	wrpr	%r22, 0x01ad, %pil
	.word 0xb7a58820  ! 2605: FADDs	fadds	%f22, %f0, %f27
	setx	0x30312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa488c0  ! 2607: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbfa8c820  ! 2608: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9a58840  ! 2610: FADDd	faddd	%f22, %f0, %f28
	.word 0xbf480000  ! 2612: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 2619: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a40860  ! 2621: FADDq	dis not found

	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2623: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa488c0  ! 2624: FSUBd	fsubd	%f18, %f0, %f62
	.word 0x8595e04e  ! 2634: WRPR_TSTATE_I	wrpr	%r23, 0x004e, %tstate
	.word 0xbda80c20  ! 2635: FMOVRLZ	dis not found

	.word 0xb9a54920  ! 2641: FMULs	fmuls	%f21, %f0, %f28
	.word 0x91956053  ! 2642: WRPR_PIL_I	wrpr	%r21, 0x0053, %pil
	.word 0xb9508000  ! 2647: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 2651: RDPR_TNPC	<illegal instruction>
	.word 0xbd520000  ! 2657: RDPR_PIL	<illegal instruction>
	.word 0xb4b46085  ! 2659: SUBCcc_I	orncc 	%r17, 0x0085, %r26
	.word 0x8595a157  ! 2660: WRPR_TSTATE_I	wrpr	%r22, 0x0157, %tstate
	.word 0xb9a9c820  ! 2664: FMOVVS	fmovs	%fcc1, %f0, %f28
	mov	2, %r14
	.word 0xa193a000  ! 2668: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba81820  ! 2669: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	mov	0, %r12
	.word 0x8f932000  ! 2670: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a54820  ! 2672: FADDs	fadds	%f21, %f0, %f26
	.word 0xbda84820  ! 2675: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba4c8a0  ! 2676: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xbfa488e0  ! 2677: FSUBq	dis not found

	.word 0xbf50c000  ! 2678: RDPR_TT	<illegal instruction>
	.word 0xb5ab4820  ! 2679: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 2688: FSUBs	fsubs	%f23, %f0, %f26
	.word 0x879520c9  ! 2689: WRPR_TT_I	wrpr	%r20, 0x00c9, %tt
	.word 0xb3aa8820  ! 2691: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbfa84820  ! 2694: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a58820  ! 2695: FADDs	fadds	%f22, %f0, %f27
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 2697: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbba48960  ! 2699: FMULq	dis not found

	.word 0xb2340000  ! 2701: ORN_R	orn 	%r16, %r0, %r25
	.word 0xbfa5c860  ! 2702: FADDq	dis not found

	.word 0xb7508000  ! 2703: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2705: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2712: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8994218c  ! 2713: WRPR_TICK_I	wrpr	%r16, 0x018c, %tick
	.word 0xb52c7001  ! 2716: SLLX_I	sllx	%r17, 0x0001, %r26
	.word 0xb9a488e0  ! 2722: FSUBq	dis not found

	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 2725: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0x8594e18d  ! 2726: WRPR_TSTATE_I	wrpr	%r19, 0x018d, %tstate
	.word 0xb3504000  ! 2728: RDPR_TNPC	<illegal instruction>
	.word 0xbbab0820  ! 2729: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa84820  ! 2732: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbca48000  ! 2733: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xb3ab8820  ! 2741: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbf504000  ! 2744: RDPR_TNPC	<illegal instruction>
	.word 0xb5a4c8a0  ! 2746: FSUBs	fsubs	%f19, %f0, %f26
	setx	data_start_1, %g1, %r18
	.word 0xb1a54920  ! 2749: FMULs	fmuls	%f21, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb520000  ! 2754: RDPR_PIL	<illegal instruction>
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e1f3  ! 2760: WRPR_PIL_I	wrpr	%r19, 0x01f3, %pil
	.word 0xb7508000  ! 2763: RDPR_TSTATE	<illegal instruction>
	.word 0xbba508c0  ! 2768: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xbead4000  ! 2771: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xbf480000  ! 2772: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_7, %g1, %r16
	.word 0xbda98820  ! 2776: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a58920  ! 2777: FMULs	fmuls	%f22, %f0, %f28
	.word 0xbfab8820  ! 2778: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab4820  ! 2782: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8d9561d7  ! 2783: WRPR_PSTATE_I	wrpr	%r21, 0x01d7, %pstate
	.word 0xb3aac820  ! 2784: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a94820  ! 2786: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a549a0  ! 2787: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb1a489a0  ! 2788: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb7a40960  ! 2796: FMULq	dis not found

	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r22
	.word 0xb9aa4820  ! 2807: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbb508000  ! 2809: RDPR_TSTATE	<illegal instruction>
	.word 0xb1ab0820  ! 2811: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfab4820  ! 2816: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 2819: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a409c0  ! 2822: FDIVd	fdivd	%f16, %f0, %f26
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xbb510000  ! 2831: RDPR_TICK	<illegal instruction>
	.word 0x83956021  ! 2835: WRPR_TNPC_I	wrpr	%r21, 0x0021, %tnpc
	.word 0xbbab0820  ! 2836: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a409e0  ! 2837: FDIVq	dis not found

	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x81942154  ! 2843: WRPR_TPC_I	wrpr	%r16, 0x0154, %tpc
	.word 0xb351c000  ! 2844: RDPR_TL	<illegal instruction>
	.word 0xb7a00520  ! 2845: FSQRTs	fsqrt	
	.word 0xbd518000  ! 2848: RDPR_PSTATE	<illegal instruction>
	.word 0xb7510000  ! 2851: RDPR_TICK	<illegal instruction>
	.word 0xbb3c1000  ! 2853: SRAX_R	srax	%r16, %r0, %r29
	.word 0xbfa00520  ! 2855: FSQRTs	fsqrt	
	.word 0xbba00020  ! 2859: FMOVs	fmovs	%f0, %f29
	.word 0xb3a4c8e0  ! 2867: FSUBq	dis not found

	.word 0xb3a00540  ! 2869: FSQRTd	fsqrt	
	.word 0xb5a48940  ! 2870: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb7ab4820  ! 2871: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00560  ! 2873: FSQRTq	fsqrt	
	mov	0, %r14
	.word 0xa193a000  ! 2874: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6b420e3  ! 2877: SUBCcc_I	orncc 	%r16, 0x00e3, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa00020  ! 2883: FMOVs	fmovs	%f0, %f31
	.word 0xb3a00560  ! 2886: FSQRTq	fsqrt	
	.word 0xb1a4c9e0  ! 2890: FDIVq	dis not found

	.word 0xb044a168  ! 2891: ADDC_I	addc 	%r18, 0x0168, %r24
	.word 0x8394a1ea  ! 2893: WRPR_TNPC_I	wrpr	%r18, 0x01ea, %tnpc
	.word 0xb9a90820  ! 2896: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb7a5c940  ! 2897: FMULd	fmuld	%f54, %f0, %f58
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2905: FSQRTq	fsqrt	
	.word 0xbf51c000  ! 2910: RDPR_TL	<illegal instruction>
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9a0  ! 2913: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xbb518000  ! 2915: RDPR_PSTATE	<illegal instruction>
	.word 0xb951c000  ! 2916: RDPR_TL	<illegal instruction>
	.word 0xb5a98820  ! 2921: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a98820  ! 2924: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a488c0  ! 2926: FSUBd	fsubd	%f18, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983a81  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a81, %hpstate
	.word 0xbfa54960  ! 2932: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983c99  ! 2933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c99, %hpstate
	.word 0xb9a84820  ! 2937: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbda488e0  ! 2938: FSUBq	dis not found

	.word 0x899420f6  ! 2944: WRPR_TICK_I	wrpr	%r16, 0x00f6, %tick
	.word 0xb9a4c9c0  ! 2946: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xb9a4c9e0  ! 2948: FDIVq	dis not found

	.word 0xbda40920  ! 2949: FMULs	fmuls	%f16, %f0, %f30
	.word 0x8995e0ec  ! 2954: WRPR_TICK_I	wrpr	%r23, 0x00ec, %tick
	.word 0xb3aa8820  ! 2958: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a94820  ! 2960: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0x81952150  ! 2962: WRPR_TPC_I	wrpr	%r20, 0x0150, %tpc
	.word 0xb7520000  ! 2964: RDPR_PIL	<illegal instruction>
	.word 0xbfa5c9a0  ! 2965: FDIVs	fdivs	%f23, %f0, %f31
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 2967: RDPR_PIL	<illegal instruction>
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40820  ! 2971: FADDs	fadds	%f16, %f0, %f31
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 2980: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbe24c000  ! 2985: SUB_R	sub 	%r19, %r0, %r31
	.word 0xb7a00540  ! 2986: FSQRTd	fsqrt	
	.word 0xb7a4c8c0  ! 2989: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb3500000  ! 2991: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 2992: FSQRTq	fsqrt	
	.word 0x8d95e116  ! 2999: WRPR_PSTATE_I	wrpr	%r23, 0x0116, %pstate
	.word 0xb5508000  ! 3000: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a90820  ! 3001: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983e9b  ! 3002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e9b, %hpstate
	.word 0xb8b44000  ! 3004: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xb9a00540  ! 3005: FSQRTd	fsqrt	
	.word 0xbda81420  ! 3006: FMOVRNZ	dis not found

	.word 0x87942027  ! 3009: WRPR_TT_I	wrpr	%r16, 0x0027, %tt
	.word 0xbdaa4820  ! 3012: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x8595212d  ! 3015: WRPR_TSTATE_I	wrpr	%r20, 0x012d, %tstate
	.word 0x8995e03e  ! 3016: WRPR_TICK_I	wrpr	%r23, 0x003e, %tick
	.word 0xbda488c0  ! 3018: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb9a88820  ! 3020: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a549e0  ! 3025: FDIVq	dis not found

	.word 0xbba50960  ! 3026: FMULq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 3029: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x819839cb  ! 3030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19cb, %hpstate
	.word 0x8594207a  ! 3034: WRPR_TSTATE_I	wrpr	%r16, 0x007a, %tstate
	.word 0xb7540000  ! 3037: RDPR_GL	<illegal instruction>
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e091  ! 3043: WRPR_TSTATE_I	wrpr	%r23, 0x0091, %tstate
	.word 0xbba81820  ! 3046: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbf508000  ! 3048: RDPR_TSTATE	<illegal instruction>
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 3057: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbbaa4820  ! 3061: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbda58820  ! 3063: FADDs	fadds	%f22, %f0, %f30
	.word 0xb3a48920  ! 3068: FMULs	fmuls	%f18, %f0, %f25
	.word 0x81946050  ! 3074: WRPR_TPC_I	wrpr	%r17, 0x0050, %tpc
	.word 0xb5a81420  ! 3078: FMOVRNZ	dis not found

	.word 0xbd504000  ! 3079: RDPR_TNPC	<illegal instruction>
	.word 0xb1a448c0  ! 3080: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xbda509a0  ! 3082: FDIVs	fdivs	%f20, %f0, %f30
	.word 0x8794e02b  ! 3083: WRPR_TT_I	wrpr	%r19, 0x002b, %tt
	.word 0xbd51c000  ! 3088: RDPR_TL	<illegal instruction>
	.word 0xb8b4c000  ! 3089: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0xb7a4c820  ! 3097: FADDs	fadds	%f19, %f0, %f27
	.word 0xb9a00560  ! 3098: FSQRTq	fsqrt	
	.word 0xb1a00520  ! 3103: FSQRTs	fsqrt	
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a509a0  ! 3112: FDIVs	fdivs	%f20, %f0, %f26
	.word 0x8d95e050  ! 3113: WRPR_PSTATE_I	wrpr	%r23, 0x0050, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 3116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	.word 0xbfa94820  ! 3117: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb644e1bc  ! 3121: ADDC_I	addc 	%r19, 0x01bc, %r27
	.word 0xb9a00560  ! 3122: FSQRTq	fsqrt	
	.word 0xb5aa0820  ! 3124: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a50860  ! 3125: FADDq	dis not found

	.word 0xbd518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xbba58860  ! 3129: FADDq	dis not found

	.word 0xb6b44000  ! 3131: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xb1a00020  ! 3133: FMOVs	fmovs	%f0, %f24
	.word 0xbda548e0  ! 3135: FSUBq	dis not found

	.word 0xbc0d4000  ! 3137: AND_R	and 	%r21, %r0, %r30
	.word 0xbba549a0  ! 3138: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb7a81c20  ! 3139: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982a4b  ! 3140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4b, %hpstate
	.word 0xb3643801  ! 3143: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f932000  ! 3155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3520000  ! 3157: RDPR_PIL	<illegal instruction>
	.word 0xb7500000  ! 3160: RDPR_TPC	<illegal instruction>
	.word 0xbfa548a0  ! 3164: FSUBs	fsubs	%f21, %f0, %f31
	.word 0x8794e168  ! 3165: WRPR_TT_I	wrpr	%r19, 0x0168, %tt
	.word 0xbc3421a2  ! 3168: ORN_I	orn 	%r16, 0x01a2, %r30
	mov	0, %r14
	.word 0xa193a000  ! 3169: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a81820  ! 3170: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb350c000  ! 3177: RDPR_TT	<illegal instruction>
	.word 0xb5520000  ! 3178: RDPR_PIL	<illegal instruction>
	.word 0xbfa84820  ! 3179: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda9c820  ! 3183: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80c20  ! 3185: FMOVRLZ	dis not found

	.word 0xb89c4000  ! 3188: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb1a80420  ! 3189: FMOVRZ	dis not found

	.word 0xbb518000  ! 3190: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3194: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbaa5a1b6  ! 3195: SUBcc_I	subcc 	%r22, 0x01b6, %r29
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ad0000  ! 3199: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb9a509a0  ! 3206: FDIVs	fdivs	%f20, %f0, %f28
	setx	data_start_7, %g1, %r23
	.word 0xb3a408c0  ! 3209: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb7508000  ! 3210: RDPR_TSTATE	<illegal instruction>
	.word 0xbeb460bf  ! 3213: ORNcc_I	orncc 	%r17, 0x00bf, %r31
	.word 0xbf508000  ! 3214: RDPR_TSTATE	<illegal instruction>
	.word 0xb8aca09a  ! 3215: ANDNcc_I	andncc 	%r18, 0x009a, %r28
	.word 0xb5a488e0  ! 3216: FSUBq	dis not found

	.word 0xb9a9c820  ! 3219: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a90820  ! 3221: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a8c820  ! 3225: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a88820  ! 3226: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	0x20001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda5c840  ! 3230: FADDd	faddd	%f54, %f0, %f30
	.word 0xb61ca129  ! 3233: XOR_I	xor 	%r18, 0x0129, %r27
	.word 0xbb3c0000  ! 3236: SRA_R	sra 	%r16, %r0, %r29
	.word 0xb7a4c840  ! 3237: FADDd	faddd	%f50, %f0, %f58
	.word 0x87952173  ! 3238: WRPR_TT_I	wrpr	%r20, 0x0173, %tt
	.word 0xb77dc400  ! 3239: MOVR_R	movre	%r23, %r0, %r27
	setx	data_start_4, %g1, %r16
	.word 0xb9aac820  ! 3245: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbba58840  ! 3248: FADDd	faddd	%f22, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982e81  ! 3249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e81, %hpstate
	setx	data_start_7, %g1, %r19
	.word 0xb3a4c8c0  ! 3252: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xbba00040  ! 3257: FMOVd	fmovd	%f0, %f60
	.word 0xb5a44840  ! 3258: FADDd	faddd	%f48, %f0, %f26
	.word 0x89956174  ! 3260: WRPR_TICK_I	wrpr	%r21, 0x0174, %tick
	.word 0xb3aa0820  ! 3261: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbf504000  ! 3262: RDPR_TNPC	<illegal instruction>
	.word 0xb9518000  ! 3265: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a84820  ! 3267: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a489e0  ! 3269: FDIVq	dis not found

	.word 0xbba98820  ! 3271: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbba80420  ! 3273: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982dcb  ! 3275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcb, %hpstate
	.word 0xb5643801  ! 3276: MOVcc_I	<illegal instruction>
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a588c0  ! 3279: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb3a88820  ! 3281: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0x87956145  ! 3284: WRPR_TT_I	wrpr	%r21, 0x0145, %tt
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 3292: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbc0dc000  ! 3295: AND_R	and 	%r23, %r0, %r30
	.word 0xb5a88820  ! 3297: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a44940  ! 3299: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb551c000  ! 3301: RDPR_TL	<illegal instruction>
	.word 0xba2da129  ! 3304: ANDN_I	andn 	%r22, 0x0129, %r29
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda58840  ! 3306: FADDd	faddd	%f22, %f0, %f30
	.word 0xb9518000  ! 3309: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a40940  ! 3311: FMULd	fmuld	%f16, %f0, %f26
	.word 0xbfa48960  ! 3312: FMULq	dis not found

	.word 0xb7a81820  ! 3313: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3a508c0  ! 3317: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb3a549a0  ! 3318: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xbfab4820  ! 3319: FMOVCC	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 3322: FMOVRNZ	dis not found

	.word 0xb8948000  ! 3326: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xbb7d4400  ! 3327: MOVR_R	movre	%r21, %r0, %r29
	.word 0xbf510000  ! 3328: RDPR_TICK	<illegal instruction>
	.word 0xb7a48840  ! 3330: FADDd	faddd	%f18, %f0, %f58
	.word 0xbd504000  ! 3331: RDPR_TNPC	<illegal instruction>
	.word 0xbda409a0  ! 3335: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbfaac820  ! 3339: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb8454000  ! 3340: ADDC_R	addc 	%r21, %r0, %r28
	.word 0xb150c000  ! 3341: RDPR_TT	<illegal instruction>
	.word 0xb7a80420  ! 3345: FMOVRZ	dis not found

	.word 0xb1aa4820  ! 3350: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbba448a0  ! 3364: FSUBs	fsubs	%f17, %f0, %f29
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 3367: RDPR_TSTATE	<illegal instruction>
	.word 0xbbabc820  ! 3371: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa9c820  ! 3372: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c920  ! 3373: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb1a48960  ! 3374: FMULq	dis not found

	.word 0xb5a408e0  ! 3375: FSUBq	dis not found

	.word 0xb5a488c0  ! 3376: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbfa81420  ! 3377: FMOVRNZ	dis not found

	.word 0xb3a00020  ! 3379: FMOVs	fmovs	%f0, %f25
	.word 0xb3a80820  ! 3380: FMOVN	fmovs	%fcc1, %f0, %f25
	mov	0, %r14
	.word 0xa193a000  ! 3382: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6b54000  ! 3383: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xb1a408c0  ! 3385: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbfa00560  ! 3387: FSQRTq	fsqrt	
	.word 0xb03c0000  ! 3392: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0xb5504000  ! 3393: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xb9a588e0  ! 3396: FSUBq	dis not found

	.word 0xbba81420  ! 3399: FMOVRNZ	dis not found

	.word 0xb9a4c840  ! 3400: FADDd	faddd	%f50, %f0, %f28
	.word 0xb351c000  ! 3401: RDPR_TL	<illegal instruction>
	.word 0x81956185  ! 3405: WRPR_TPC_I	wrpr	%r21, 0x0185, %tpc
	.word 0xbab44000  ! 3406: ORNcc_R	orncc 	%r17, %r0, %r29
	.word 0x8d94e1e2  ! 3409: WRPR_PSTATE_I	wrpr	%r19, 0x01e2, %pstate
	.word 0x9195a0eb  ! 3412: WRPR_PIL_I	wrpr	%r22, 0x00eb, %pil
	.word 0xbdab4820  ! 3415: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 3416: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba00520  ! 3417: FSQRTs	fsqrt	
	.word 0xb7540000  ! 3419: RDPR_GL	<illegal instruction>
	.word 0xb9540000  ! 3420: RDPR_GL	<illegal instruction>
	.word 0xb3a81c20  ! 3421: FMOVRGEZ	dis not found

	.word 0xbd500000  ! 3422: RDPR_TPC	<illegal instruction>
	.word 0x8d9521e3  ! 3426: WRPR_PSTATE_I	wrpr	%r20, 0x01e3, %pstate
	.word 0xb7a80420  ! 3427: FMOVRZ	dis not found

	.word 0xbfa40960  ! 3428: FMULq	dis not found

	.word 0xb1a589a0  ! 3431: FDIVs	fdivs	%f22, %f0, %f24
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 3437: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb7a58960  ! 3438: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982bcb  ! 3439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcb, %hpstate
	.word 0x8795a1d3  ! 3442: WRPR_TT_I	wrpr	%r22, 0x01d3, %tt
	.word 0xb7a00560  ! 3445: FSQRTq	fsqrt	
	.word 0xb895e058  ! 3448: ORcc_I	orcc 	%r23, 0x0058, %r28
	.word 0xbdabc820  ! 3449: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00040  ! 3450: FMOVd	fmovd	%f0, %f62
	ta	T_CHANGE_HPRIV
	.word 0x81982f81  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	.word 0x8995609c  ! 3454: WRPR_TICK_I	wrpr	%r21, 0x009c, %tick
	.word 0xb3a488c0  ! 3455: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xbba81420  ! 3456: FMOVRNZ	dis not found

	.word 0xb7a509e0  ! 3458: FDIVq	dis not found

	setx	data_start_1, %g1, %r17
	.word 0xbfabc820  ! 3461: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xba956100  ! 3462: ORcc_I	orcc 	%r21, 0x0100, %r29
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0x8d9421f7  ! 3476: WRPR_PSTATE_I	wrpr	%r16, 0x01f7, %pstate
	.word 0xbfa5c8a0  ! 3477: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb6358000  ! 3478: ORN_R	orn 	%r22, %r0, %r27
	.word 0xb3a00540  ! 3480: FSQRTd	fsqrt	
	.word 0xb3a00540  ! 3485: FSQRTd	fsqrt	
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 3498: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbd520000  ! 3500: RDPR_PIL	<illegal instruction>
	.word 0xb4848000  ! 3501: ADDcc_R	addcc 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 3510: RDPR_GL	<illegal instruction>
	.word 0xbfa80820  ! 3515: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a8c820  ! 3519: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfaa4820  ! 3521: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x9195e14a  ! 3522: WRPR_PIL_I	wrpr	%r23, 0x014a, %pil
	.word 0xbda98820  ! 3525: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a4c860  ! 3528: FADDq	dis not found

	.word 0xbba98820  ! 3529: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xba85e070  ! 3536: ADDcc_I	addcc 	%r23, 0x0070, %r29
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 3540: FSQRTq	fsqrt	
	.word 0xb1500000  ! 3541: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 3544: RDPR_TSTATE	<illegal instruction>
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 3550: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982991  ! 3551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 3556: RDPR_GL	<illegal instruction>
	.word 0xb5a80c20  ! 3557: FMOVRLZ	dis not found

	.word 0xb3ab4820  ! 3558: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba00540  ! 3559: FSQRTd	fsqrt	
	.word 0x8d94211e  ! 3560: WRPR_PSTATE_I	wrpr	%r16, 0x011e, %pstate
	.word 0x89956145  ! 3561: WRPR_TICK_I	wrpr	%r21, 0x0145, %tick
	.word 0xbf508000  ! 3563: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982949  ! 3571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	.word 0xbba409c0  ! 3573: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb1a44820  ! 3575: FADDs	fadds	%f17, %f0, %f24
	.word 0xb9a00560  ! 3577: FSQRTq	fsqrt	
	.word 0xb7a4c9e0  ! 3578: FDIVq	dis not found

	.word 0xb9a58820  ! 3579: FADDs	fadds	%f22, %f0, %f28
	.word 0x85946097  ! 3581: WRPR_TSTATE_I	wrpr	%r17, 0x0097, %tstate
	.word 0xb7500000  ! 3585: RDPR_TPC	<illegal instruction>
	.word 0xb7a98820  ! 3586: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a508a0  ! 3588: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xb7a4c8c0  ! 3592: FSUBd	fsubd	%f50, %f0, %f58
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 3599: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda549c0  ! 3601: FDIVd	fdivd	%f52, %f0, %f30
	setx	data_start_0, %g1, %r19
	.word 0xbabd8000  ! 3606: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb7a94820  ! 3607: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3612: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbda549a0  ! 3618: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb3a94820  ! 3620: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb5518000  ! 3621: RDPR_PSTATE	<illegal instruction>
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 3624: RDPR_TL	<illegal instruction>
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3628: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a88820  ! 3629: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbda80420  ! 3632: FMOVRZ	dis not found

	.word 0xb9a588e0  ! 3633: FSUBq	dis not found

	.word 0xbd3cb001  ! 3639: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xba342149  ! 3640: ORN_I	orn 	%r16, 0x0149, %r29
	.word 0x8194e04a  ! 3642: WRPR_TPC_I	wrpr	%r19, 0x004a, %tpc
	.word 0xbf643801  ! 3644: MOVcc_I	<illegal instruction>
	.word 0xb7540000  ! 3654: RDPR_GL	<illegal instruction>
	.word 0xb3a588a0  ! 3662: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xbaadc000  ! 3663: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xbba00040  ! 3665: FMOVd	fmovd	%f0, %f60
	.word 0x919420c8  ! 3666: WRPR_PIL_I	wrpr	%r16, 0x00c8, %pil
	.word 0x8d952083  ! 3669: WRPR_PSTATE_I	wrpr	%r20, 0x0083, %pstate
	.word 0xbda4c820  ! 3670: FADDs	fadds	%f19, %f0, %f30
	.word 0xb9a81420  ! 3673: FMOVRNZ	dis not found

	.word 0xb9a5c920  ! 3674: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb7a40920  ! 3680: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbba4c9a0  ! 3682: FDIVs	fdivs	%f19, %f0, %f29
	.word 0x8d95a152  ! 3684: WRPR_PSTATE_I	wrpr	%r22, 0x0152, %pstate
	.word 0xbfa90820  ! 3685: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x89956114  ! 3687: WRPR_TICK_I	wrpr	%r21, 0x0114, %tick
	.word 0xb9a00540  ! 3692: FSQRTd	fsqrt	
	.word 0xb9a80420  ! 3696: FMOVRZ	dis not found

	.word 0xb9a408a0  ! 3698: FSUBs	fsubs	%f16, %f0, %f28
	.word 0x819421a6  ! 3699: WRPR_TPC_I	wrpr	%r16, 0x01a6, %tpc
	.word 0xb5a00540  ! 3700: FSQRTd	fsqrt	
	.word 0xbbaa0820  ! 3702: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba00540  ! 3703: FSQRTd	fsqrt	
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3711: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbd643801  ! 3714: MOVcc_I	<illegal instruction>
	.word 0xb9a80420  ! 3716: FMOVRZ	dis not found

	.word 0xbe350000  ! 3720: ORN_R	orn 	%r20, %r0, %r31
	.word 0xb951c000  ! 3722: RDPR_TL	<illegal instruction>
	.word 0xbe154000  ! 3723: OR_R	or 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 3729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xb7a549c0  ! 3737: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb5508000  ! 3742: RDPR_TSTATE	<illegal instruction>
	.word 0xb3510000  ! 3746: RDPR_TICK	<illegal instruction>
	.word 0xb634a0ec  ! 3748: SUBC_I	orn 	%r18, 0x00ec, %r27
	.word 0xb1a88820  ! 3751: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab8820  ! 3753: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb1480000  ! 3755: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	.word 0xb7a508c0  ! 3761: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb7aa4820  ! 3764: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1500000  ! 3765: RDPR_TPC	<illegal instruction>
	.word 0xbba81420  ! 3766: FMOVRNZ	dis not found

	.word 0xb3a00020  ! 3769: FMOVs	fmovs	%f0, %f25
	.word 0x8194e0ab  ! 3772: WRPR_TPC_I	wrpr	%r19, 0x00ab, %tpc
	.word 0xbfa00520  ! 3774: FSQRTs	fsqrt	
	.word 0x85942195  ! 3778: WRPR_TSTATE_I	wrpr	%r16, 0x0195, %tstate
	.word 0xb7ab8820  ! 3779: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa4820  ! 3783: FMOVNE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982e93  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0xb9508000  ! 3788: RDPR_TSTATE	<illegal instruction>
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 3791: RDPR_TICK	<illegal instruction>
	.word 0xb3a88820  ! 3792: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb5ab4820  ! 3795: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbdaac820  ! 3798: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7510000  ! 3799: RDPR_TICK	<illegal instruction>
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 3808: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb7540000  ! 3809: RDPR_GL	<illegal instruction>
	.word 0xb3a8c820  ! 3813: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9a508e0  ! 3817: FSUBq	dis not found

	.word 0xb1504000  ! 3826: RDPR_TNPC	<illegal instruction>
	.word 0xb53dc000  ! 3827: SRA_R	sra 	%r23, %r0, %r26
	.word 0xbdaa0820  ! 3834: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 3838: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5540000  ! 3839: RDPR_GL	<illegal instruction>
	.word 0xbb508000  ! 3844: RDPR_TSTATE	<illegal instruction>
	.word 0xb13d0000  ! 3845: SRA_R	sra 	%r20, %r0, %r24
	.word 0xbbaac820  ! 3846: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbd518000  ! 3847: RDPR_PSTATE	<illegal instruction>
	.word 0xbba5c940  ! 3848: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbda509e0  ! 3850: FDIVq	dis not found

	.word 0x8995a0e2  ! 3853: WRPR_TICK_I	wrpr	%r22, 0x00e2, %tick
	setx	data_start_2, %g1, %r17
	.word 0xbbab0820  ! 3859: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbf510000  ! 3860: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e1b  ! 3863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1b, %hpstate
	.word 0xb0346139  ! 3869: ORN_I	orn 	%r17, 0x0139, %r24
	.word 0xb20d8000  ! 3876: AND_R	and 	%r22, %r0, %r25
	.word 0xb7a80820  ! 3880: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba408c0  ! 3881: FSUBd	fsubd	%f16, %f0, %f60
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a106  ! 3883: WRPR_TNPC_I	wrpr	%r18, 0x0106, %tnpc
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3885: RDPR_TSTATE	<illegal instruction>
	.word 0xbba50820  ! 3887: FADDs	fadds	%f20, %f0, %f29
	.word 0xbda00040  ! 3891: FMOVd	fmovd	%f0, %f30
	.word 0xb5a488e0  ! 3893: FSUBq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 3895: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf641800  ! 3899: MOVcc_R	<illegal instruction>
	.word 0xbfa00560  ! 3901: FSQRTq	fsqrt	
	.word 0xbd504000  ! 3905: RDPR_TNPC	<illegal instruction>
	.word 0xbf347001  ! 3908: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xb3480000  ! 3909: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 3912: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbda9c820  ! 3913: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb49cc000  ! 3915: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xb1a448e0  ! 3916: FSUBq	dis not found

	.word 0xbcade0c4  ! 3918: ANDNcc_I	andncc 	%r23, 0x00c4, %r30
	setx	data_start_6, %g1, %r23
	mov	2, %r14
	.word 0xa193a000  ! 3920: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10135, %g1, %o0
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
	.word 0xb0858000  ! 3935: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0x819461da  ! 3936: WRPR_TPC_I	wrpr	%r17, 0x01da, %tpc
	.word 0xb4ace0ce  ! 3938: ANDNcc_I	andncc 	%r19, 0x00ce, %r26
	.word 0xb3a84820  ! 3939: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xba15c000  ! 3940: OR_R	or 	%r23, %r0, %r29
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa509e0  ! 3953: FDIVq	dis not found

	.word 0xb7a00520  ! 3954: FSQRTs	fsqrt	
	.word 0xb4b4203a  ! 3955: ORNcc_I	orncc 	%r16, 0x003a, %r26
	.word 0xb3510000  ! 3956: RDPR_TICK	<illegal instruction>
	.word 0xb9a58840  ! 3957: FADDd	faddd	%f22, %f0, %f28
	.word 0xbf500000  ! 3959: RDPR_TPC	<illegal instruction>
	.word 0xbba549a0  ! 3960: FDIVs	fdivs	%f21, %f0, %f29
	mov	0, %r12
	.word 0x8f932000  ! 3962: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a488c0  ! 3964: FSUBd	fsubd	%f18, %f0, %f56
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc84c000  ! 3966: ADDcc_R	addcc 	%r19, %r0, %r30
	.word 0xb1a88820  ! 3968: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb934f001  ! 3969: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xb1a5c8a0  ! 3970: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb3a00560  ! 3971: FSQRTq	fsqrt	
	.word 0xb7ab0820  ! 3972: FMOVGU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 3975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xb3a5c8c0  ! 3977: FSUBd	fsubd	%f54, %f0, %f56
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe1d4000  ! 3981: XOR_R	xor 	%r21, %r0, %r31
	.word 0x899520aa  ! 3982: WRPR_TICK_I	wrpr	%r20, 0x00aa, %tick
	.word 0xb7a589a0  ! 3993: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb3a80c20  ! 3994: FMOVRLZ	dis not found

	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a58940  ! 4001: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb9a9c820  ! 4002: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a4c9e0  ! 4004: FDIVq	dis not found

	.word 0xb935d000  ! 4007: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb9a4c9a0  ! 4010: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb7a00540  ! 4015: FSQRTd	fsqrt	
	.word 0xb3a5c960  ! 4016: FMULq	dis not found

	.word 0xb750c000  ! 4017: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198299b  ! 4019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0xb5a549c0  ! 4024: FDIVd	fdivd	%f52, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a80c20  ! 4038: FMOVRLZ	dis not found

	.word 0xb77d6401  ! 4040: MOVR_I	movre	%r21, 0x1, %r27
	.word 0xb9357001  ! 4041: SRLX_I	srlx	%r21, 0x0001, %r28
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93de001  ! 4052: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xb4348000  ! 4054: ORN_R	orn 	%r18, %r0, %r26
	.word 0xb1a94820  ! 4055: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 4058: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda00540  ! 4059: FSQRTd	fsqrt	
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e1c6  ! 4067: WRPR_TICK_I	wrpr	%r19, 0x01c6, %tick
	.word 0xb550c000  ! 4069: RDPR_TT	<illegal instruction>
	.word 0xbab58000  ! 4072: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xbfa48840  ! 4073: FADDd	faddd	%f18, %f0, %f62
	.word 0xb1a88820  ! 4075: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa4820  ! 4076: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a81420  ! 4077: FMOVRNZ	dis not found

	.word 0xb72ce001  ! 4079: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xb7520000  ! 4081: RDPR_PIL	<illegal instruction>
	.word 0xbfa8c820  ! 4085: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbda81420  ! 4086: FMOVRNZ	dis not found

	.word 0xb7a54840  ! 4087: FADDd	faddd	%f52, %f0, %f58
	.word 0xbda4c820  ! 4090: FADDs	fadds	%f19, %f0, %f30
	.word 0xbda4c9c0  ! 4091: FDIVd	fdivd	%f50, %f0, %f30
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8c0  ! 4096: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb9ab8820  ! 4097: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a4c840  ! 4100: FADDd	faddd	%f50, %f0, %f58
	.word 0xbda549a0  ! 4102: FDIVs	fdivs	%f21, %f0, %f30
	setx	0x3022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 4104: RDPR_GL	<illegal instruction>
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0xbe0ca13c  ! 4111: AND_I	and 	%r18, 0x013c, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	.word 0xbba4c9e0  ! 4114: FDIVq	dis not found

	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 4116: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa8c820  ! 4123: FMOVL	fmovs	%fcc1, %f0, %f31
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 4127: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab0820  ! 4128: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	data_start_6, %g1, %r22
	.word 0xbd504000  ! 4131: RDPR_TNPC	<illegal instruction>
	.word 0xb1a50860  ! 4133: FADDq	dis not found

	.word 0xbda81820  ! 4136: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb9aa0820  ! 4142: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0x8795a1c5  ! 4143: WRPR_TT_I	wrpr	%r22, 0x01c5, %tt
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4147: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a00560  ! 4149: FSQRTq	fsqrt	
	.word 0xb3a80420  ! 4151: FMOVRZ	dis not found

	.word 0xb8240000  ! 4153: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb1a58860  ! 4157: FADDq	dis not found

	.word 0xbba88820  ! 4160: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa4820  ! 4163: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab8820  ! 4166: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb094a152  ! 4167: ORcc_I	orcc 	%r18, 0x0152, %r24
	.word 0xbba00560  ! 4168: FSQRTq	fsqrt	
	.word 0x8194e166  ! 4177: WRPR_TPC_I	wrpr	%r19, 0x0166, %tpc
	.word 0x8194e184  ! 4178: WRPR_TPC_I	wrpr	%r19, 0x0184, %tpc
	.word 0xbbab0820  ! 4184: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbba508e0  ! 4187: FSUBq	dis not found

	.word 0xbfa4c940  ! 4189: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbba48920  ! 4192: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb2b5a104  ! 4194: ORNcc_I	orncc 	%r22, 0x0104, %r25
	.word 0xb7a00560  ! 4198: FSQRTq	fsqrt	
	.word 0xb3a81c20  ! 4199: FMOVRGEZ	dis not found

	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 4205: FMOVLE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb32c3001  ! 4208: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xb9a00520  ! 4211: FSQRTs	fsqrt	
	.word 0x859560ef  ! 4220: WRPR_TSTATE_I	wrpr	%r21, 0x00ef, %tstate
	.word 0xba356062  ! 4222: ORN_I	orn 	%r21, 0x0062, %r29
	.word 0xb3a48840  ! 4224: FADDd	faddd	%f18, %f0, %f56
	.word 0xbd7da401  ! 4226: MOVR_I	movre	%r22, 0x1, %r30
	.word 0xbfa00020  ! 4231: FMOVs	fmovs	%f0, %f31
	.word 0xb9518000  ! 4233: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a00520  ! 4234: FSQRTs	fsqrt	
	.word 0xbfa00520  ! 4235: FSQRTs	fsqrt	
	.word 0xb3a81420  ! 4239: FMOVRNZ	dis not found

	.word 0xb1518000  ! 4240: RDPR_PSTATE	<illegal instruction>
	.word 0x8595a1da  ! 4242: WRPR_TSTATE_I	wrpr	%r22, 0x01da, %tstate
	.word 0xbba9c820  ! 4243: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbba00040  ! 4245: FMOVd	fmovd	%f0, %f60
	.word 0xb1a588a0  ! 4247: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb6c5e001  ! 4251: ADDCcc_I	addccc 	%r23, 0x0001, %r27
	.word 0xb5a44920  ! 4253: FMULs	fmuls	%f17, %f0, %f26
	.word 0xb82c4000  ! 4255: ANDN_R	andn 	%r17, %r0, %r28
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 4258: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa4820  ! 4259: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb7508000  ! 4262: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a448e0  ! 4267: FSUBq	dis not found

	.word 0x8394217a  ! 4271: WRPR_TNPC_I	wrpr	%r16, 0x017a, %tnpc
	.word 0xbfa80c20  ! 4273: FMOVRLZ	dis not found

	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54960  ! 4275: FMULq	dis not found

	.word 0x8795212f  ! 4277: WRPR_TT_I	wrpr	%r20, 0x012f, %tt
	.word 0xb7a98820  ! 4278: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81c20  ! 4280: FMOVRGEZ	dis not found

	.word 0xbfa90820  ! 4282: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a448e0  ! 4284: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982e41  ! 4286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xbda94820  ! 4288: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a81420  ! 4290: FMOVRNZ	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 4291: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 4295: FMOVCC	fmovs	%fcc1, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 4298: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 4301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 4303: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3480000  ! 4305: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x9194602f  ! 4306: WRPR_PIL_I	wrpr	%r17, 0x002f, %pil
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 4310: FSQRTq	fsqrt	
	setx	data_start_5, %g1, %r20
	.word 0xbba84820  ! 4312: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbe250000  ! 4314: SUB_R	sub 	%r20, %r0, %r31
	.word 0xb5510000  ! 4323: RDPR_TICK	<illegal instruction>
	.word 0xb5a448c0  ! 4324: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb3a9c820  ! 4326: FMOVVS	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 4327: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a00040  ! 4332: FMOVd	fmovd	%f0, %f58
	.word 0xbf500000  ! 4335: RDPR_TPC	<illegal instruction>
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4344: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r16
	.word 0xb5a00540  ! 4348: FSQRTd	fsqrt	
	.word 0xb814e191  ! 4352: OR_I	or 	%r19, 0x0191, %r28
	.word 0x899561f5  ! 4353: WRPR_TICK_I	wrpr	%r21, 0x01f5, %tick
	.word 0xb3abc820  ! 4357: FMOVVC	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r19
	.word 0x819521b5  ! 4360: WRPR_TPC_I	wrpr	%r20, 0x01b5, %tpc
	.word 0xb7a81820  ! 4362: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9343001  ! 4363: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xb7a81c20  ! 4365: FMOVRGEZ	dis not found

	.word 0xb9504000  ! 4366: RDPR_TNPC	<illegal instruction>
	.word 0xb951c000  ! 4371: RDPR_TL	<illegal instruction>
	.word 0xb9a48920  ! 4373: FMULs	fmuls	%f18, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 4381: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd51c000  ! 4383: RDPR_TL	<illegal instruction>
	.word 0xb53d8000  ! 4384: SRA_R	sra 	%r22, %r0, %r26
	.word 0xbb510000  ! 4386: RDPR_TICK	<illegal instruction>
	.word 0x8394608f  ! 4389: WRPR_TNPC_I	wrpr	%r17, 0x008f, %tnpc
	.word 0xb8250000  ! 4390: SUB_R	sub 	%r20, %r0, %r28
	.word 0x8d952069  ! 4391: WRPR_PSTATE_I	wrpr	%r20, 0x0069, %pstate
	.word 0xb1a00020  ! 4397: FMOVs	fmovs	%f0, %f24
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb13cf001  ! 4402: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xb734e001  ! 4403: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xbbab8820  ! 4404: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x91946012  ! 4406: WRPR_PIL_I	wrpr	%r17, 0x0012, %pil
	.word 0xb62d0000  ! 4407: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xb01461d6  ! 4408: OR_I	or 	%r17, 0x01d6, %r24
	.word 0xbc84a1ce  ! 4410: ADDcc_I	addcc 	%r18, 0x01ce, %r30
	.word 0xb5aa8820  ! 4411: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a509a0  ! 4412: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xba25a0eb  ! 4414: SUB_I	sub 	%r22, 0x00eb, %r29
	.word 0xb1aa4820  ! 4415: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb77da401  ! 4417: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xbba8c820  ! 4422: FMOVL	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 4427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xb5aa8820  ! 4428: FMOVG	fmovs	%fcc1, %f0, %f26
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4438: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 4446: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3aac820  ! 4448: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a40960  ! 4449: FMULq	dis not found

	.word 0xb9a80820  ! 4453: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb61ce1bd  ! 4456: XOR_I	xor 	%r19, 0x01bd, %r27
	.word 0xbba509a0  ! 4457: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb7a88820  ! 4460: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 4463: FMOVRGEZ	dis not found

	.word 0xbba84820  ! 4465: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x81956147  ! 4466: WRPR_TPC_I	wrpr	%r21, 0x0147, %tpc
	.word 0xbbab8820  ! 4468: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbf540000  ! 4474: RDPR_GL	<illegal instruction>
	.word 0xb7a94820  ! 4478: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80c20  ! 4479: FMOVRLZ	dis not found

	setx	0x110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a03b  ! 4481: WRPR_TICK_I	wrpr	%r22, 0x003b, %tick
	.word 0xbc15c000  ! 4485: OR_R	or 	%r23, %r0, %r30
	.word 0xb7510000  ! 4486: RDPR_TICK	<illegal instruction>
	.word 0xba44a058  ! 4487: ADDC_I	addc 	%r18, 0x0058, %r29
	.word 0xb751c000  ! 4489: RDPR_TL	<illegal instruction>
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba40840  ! 4493: FADDd	faddd	%f16, %f0, %f60
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe1d4000  ! 4502: XOR_R	xor 	%r21, %r0, %r31
	.word 0xb7a80c20  ! 4504: FMOVRLZ	dis not found

	.word 0xbbab4820  ! 4505: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba40820  ! 4506: FADDs	fadds	%f16, %f0, %f29
	.word 0xbcc5a078  ! 4507: ADDCcc_I	addccc 	%r22, 0x0078, %r30
	.word 0xbfa548e0  ! 4512: FSUBq	dis not found

	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 4519: FMOVRLZ	dis not found

	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 4527: RDPR_GL	<illegal instruction>
	.word 0xb5a9c820  ! 4529: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80420  ! 4530: FMOVRZ	dis not found

	.word 0xb7a409c0  ! 4534: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xbba00560  ! 4535: FSQRTq	fsqrt	
	.word 0x8394e1fa  ! 4540: WRPR_TNPC_I	wrpr	%r19, 0x01fa, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 4541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0xb5508000  ! 4543: RDPR_TSTATE	<illegal instruction>
	.word 0xb3520000  ! 4547: RDPR_PIL	<illegal instruction>
	.word 0xb9a9c820  ! 4550: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a5c8c0  ! 4551: FSUBd	fsubd	%f54, %f0, %f56
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50820  ! 4558: FADDs	fadds	%f20, %f0, %f26
	.word 0xbfa488a0  ! 4560: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb7504000  ! 4561: RDPR_TNPC	<illegal instruction>
	.word 0xbba8c820  ! 4565: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c840  ! 4570: FADDd	faddd	%f54, %f0, %f58
	.word 0xbdab0820  ! 4571: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a80820  ! 4572: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1510000  ! 4573: RDPR_TICK	<illegal instruction>
	.word 0xb3a44960  ! 4578: FMULq	dis not found

	.word 0xb9a00520  ! 4580: FSQRTs	fsqrt	
	.word 0xbc3461b1  ! 4583: SUBC_I	orn 	%r17, 0x01b1, %r30
	.word 0xb1a408c0  ! 4584: FSUBd	fsubd	%f16, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983fd3  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd3, %hpstate
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 4591: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a4c9c0  ! 4592: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xb3a90820  ! 4594: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 4595: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3508000  ! 4596: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb1508000  ! 4599: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a44840  ! 4600: FADDd	faddd	%f48, %f0, %f24
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 4604: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9a48840  ! 4610: FADDd	faddd	%f18, %f0, %f28
	.word 0x819461c6  ! 4611: WRPR_TPC_I	wrpr	%r17, 0x01c6, %tpc
	setx	0x20335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 4620: FMOVRNZ	dis not found

	.word 0xb5abc820  ! 4622: FMOVVC	fmovs	%fcc1, %f0, %f26
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 4625: FDIVd	fdivd	%f52, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0xb5a00560  ! 4634: FSQRTq	fsqrt	
	.word 0xb5a81820  ! 4646: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3a98820  ! 4649: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb7aa0820  ! 4653: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb0b5618b  ! 4655: ORNcc_I	orncc 	%r21, 0x018b, %r24
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	.word 0xb1508000  ! 4661: RDPR_TSTATE	<illegal instruction>
	.word 0xb4a4c000  ! 4664: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xb1a44820  ! 4665: FADDs	fadds	%f17, %f0, %f24
	.word 0xbb500000  ! 4668: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xb7a90820  ! 4675: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb12c9000  ! 4678: SLLX_R	sllx	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0x8d942031  ! 4684: WRPR_PSTATE_I	wrpr	%r16, 0x0031, %pstate
	.word 0xbba588c0  ! 4685: FSUBd	fsubd	%f22, %f0, %f60
	.word 0x8995a17d  ! 4689: WRPR_TICK_I	wrpr	%r22, 0x017d, %tick
	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6a42061  ! 4693: SUBcc_I	subcc 	%r16, 0x0061, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e91  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e91, %hpstate
	.word 0x879560c0  ! 4695: WRPR_TT_I	wrpr	%r21, 0x00c0, %tt
	.word 0xb1a409c0  ! 4697: FDIVd	fdivd	%f16, %f0, %f24
	.word 0x819420aa  ! 4698: WRPR_TPC_I	wrpr	%r16, 0x00aa, %tpc
	.word 0xbe358000  ! 4700: ORN_R	orn 	%r22, %r0, %r31
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54840  ! 4703: FADDd	faddd	%f52, %f0, %f28
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10115, %g1, %o0
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
	.word 0xb7a00520  ! 4713: FSQRTs	fsqrt	
	.word 0xb7ab8820  ! 4715: FMOVPOS	fmovs	%fcc1, %f0, %f27
	setx	data_start_6, %g1, %r22
	.word 0xb5a98820  ! 4717: FMOVNEG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 4721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	.word 0xbfa4c920  ! 4723: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb2c58000  ! 4734: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xbba00560  ! 4736: FSQRTq	fsqrt	
	.word 0xb1480000  ! 4738: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 4741: FMOVVC	fmovs	%fcc1, %f0, %f25
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 4746: FADDq	dis not found

	.word 0xbfa84820  ! 4750: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5540000  ! 4753: RDPR_GL	<illegal instruction>
	.word 0x8995a19a  ! 4754: WRPR_TICK_I	wrpr	%r22, 0x019a, %tick
	.word 0xb9a80820  ! 4755: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf520000  ! 4761: RDPR_PIL	<illegal instruction>
	.word 0xbdaac820  ! 4766: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbda50960  ! 4767: FMULq	dis not found

	.word 0xbf500000  ! 4771: RDPR_TPC	<illegal instruction>
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9a0  ! 4775: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb9a48840  ! 4776: FADDd	faddd	%f18, %f0, %f28
	.word 0xb5a00560  ! 4779: FSQRTq	fsqrt	
	.word 0xb69c4000  ! 4780: XORcc_R	xorcc 	%r17, %r0, %r27
	setx	data_start_2, %g1, %r19
	.word 0xb3540000  ! 4782: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 4784: RDPR_TNPC	<illegal instruction>
	.word 0xb5a81420  ! 4785: FMOVRNZ	dis not found

	.word 0xb7a98820  ! 4791: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbb510000  ! 4792: RDPR_TICK	<illegal instruction>
	.word 0xb9aa0820  ! 4793: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbda44840  ! 4796: FADDd	faddd	%f48, %f0, %f30
	.word 0xb0b40000  ! 4797: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xb3aa0820  ! 4798: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbb350000  ! 4799: SRL_R	srl 	%r20, %r0, %r29
	.word 0xb5a40820  ! 4800: FADDs	fadds	%f16, %f0, %f26
	.word 0x9195e109  ! 4804: WRPR_PIL_I	wrpr	%r23, 0x0109, %pil
	.word 0xb1a409e0  ! 4810: FDIVq	dis not found

	.word 0xb5510000  ! 4811: RDPR_TICK	rdpr	%tick, %r26
	.word 0xbba94820  ! 4812: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	data_start_0, %g1, %r17
	.word 0xb7a58860  ! 4816: FADDq	dis not found

	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 4820: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbda80820  ! 4821: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfaa8820  ! 4823: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb094a128  ! 4826: ORcc_I	orcc 	%r18, 0x0128, %r24
	.word 0xb00c4000  ! 4829: AND_R	and 	%r17, %r0, %r24
	.word 0xb3a00540  ! 4833: FSQRTd	fsqrt	
	.word 0xb9a48960  ! 4835: FMULq	dis not found

	.word 0xb3a5c8a0  ! 4836: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xbb518000  ! 4841: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa00560  ! 4845: FSQRTq	fsqrt	
	.word 0x8d95a117  ! 4849: WRPR_PSTATE_I	wrpr	%r22, 0x0117, %pstate
	.word 0xb33d2001  ! 4850: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb3a00520  ! 4851: FSQRTs	fsqrt	
	.word 0xb1518000  ! 4853: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 4854: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba5c940  ! 4857: FMULd	fmuld	%f54, %f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982b89  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e13d  ! 4864: WRPR_TICK_I	wrpr	%r19, 0x013d, %tick
	.word 0xbda54860  ! 4867: FADDq	dis not found

	.word 0xb3520000  ! 4872: RDPR_PIL	<illegal instruction>
	.word 0xb1abc820  ! 4876: FMOVVC	fmovs	%fcc1, %f0, %f24
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 4880: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a448a0  ! 4883: FSUBs	fsubs	%f17, %f0, %f28
	setx	data_start_3, %g1, %r21
	.word 0xb1480000  ! 4886: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c920  ! 4897: FMULs	fmuls	%f23, %f0, %f25
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4906: RDPR_TICK	<illegal instruction>
	.word 0x8194a085  ! 4907: WRPR_TPC_I	wrpr	%r18, 0x0085, %tpc
	.word 0xb5aa4820  ! 4910: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x919460af  ! 4911: WRPR_PIL_I	wrpr	%r17, 0x00af, %pil
	.word 0xbfa588e0  ! 4912: FSUBq	dis not found

	.word 0xbbaa0820  ! 4913: FMOVA	fmovs	%fcc1, %f0, %f29
	mov	0, %r12
	.word 0x8f932000  ! 4916: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1aa8820  ! 4920: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa48860  ! 4921: FADDq	dis not found

	.word 0xb3a94820  ! 4922: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbdaa4820  ! 4926: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbfaac820  ! 4928: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a54860  ! 4929: FADDq	dis not found

	.word 0xb1ab8820  ! 4930: FMOVPOS	fmovs	%fcc1, %f0, %f24
	mov	1, %r14
	.word 0xa193a000  ! 4931: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4932: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd540000  ! 4936: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4943: FSQRTq	fsqrt	
	.word 0xb1aa0820  ! 4944: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb5a80c20  ! 4953: FMOVRLZ	dis not found

	.word 0xb9520000  ! 4954: RDPR_PIL	<illegal instruction>
	.word 0xb495c000  ! 4957: ORcc_R	orcc 	%r23, %r0, %r26
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd351000  ! 4962: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xbba00020  ! 4963: FMOVs	fmovs	%f0, %f29
	.word 0xbb3cb001  ! 4964: SRAX_I	srax	%r18, 0x0001, %r29
	.word 0xb2b56094  ! 4965: ORNcc_I	orncc 	%r21, 0x0094, %r25
	.word 0xb5500000  ! 4968: RDPR_TPC	<illegal instruction>
	.word 0xbb643801  ! 4973: MOVcc_I	<illegal instruction>
	.word 0xb1a80820  ! 4975: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80420  ! 4978: FMOVRZ	dis not found

	setx	0x1021a, %g1, %o0
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
	.word 0xb7a488a0  ! 4981: FSUBs	fsubs	%f18, %f0, %f27
	.word 0x8194e0e1  ! 4982: WRPR_TPC_I	wrpr	%r19, 0x00e1, %tpc
	.word 0xbda5c860  ! 4983: FADDq	dis not found

	.word 0xbf520000  ! 4984: RDPR_PIL	<illegal instruction>
	.word 0xbb7cc400  ! 4985: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb5a44820  ! 4986: FADDs	fadds	%f17, %f0, %f26
	.word 0xbfa81820  ! 4987: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa48820  ! 4990: FADDs	fadds	%f18, %f0, %f31
	.word 0xbf51c000  ! 4991: RDPR_TL	<illegal instruction>
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 4994: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a5c8e0  ! 4996: FSUBq	dis not found


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

	.xword	0xf488b106307ccf8c
	.xword	0x82ab8c70fda0952f
	.xword	0xe99cf0ed52384039
	.xword	0xed30bfedf7b4ce33
	.xword	0x689df2da1d823ed5
	.xword	0xd80e3e18feeac3e3
	.xword	0x90e8aed95a14946f
	.xword	0x80caed1663bc5569
	.xword	0x7741695775069bfb
	.xword	0x2b2c360dd01e7859
	.xword	0x3cde520f1cde5a72
	.xword	0xca2de4b02f86dc27
	.xword	0x070a0bf2a4478696
	.xword	0x045faec720a5e6a1
	.xword	0x05e3bc6b8439654a
	.xword	0x40e35edc99515fa2
	.xword	0x4e5acf3a8a8f858f
	.xword	0xcaab38697771a3ed
	.xword	0x228a25cdfc7b6187
	.xword	0xe752f6b0aed6391a
	.xword	0xcfae19b5d837e680
	.xword	0xd0af3dbba14cf30b
	.xword	0xd61240eddbd1ae47
	.xword	0x5b7616b108305dd3
	.xword	0xc7592f5aa2709d08
	.xword	0x637073dae45bddbe
	.xword	0x225413a8def58e06
	.xword	0x639db3bbcdbd7016
	.xword	0x6408698412a6574c
	.xword	0xca89a88fedaf893e
	.xword	0xb04e18045fa299ba
	.xword	0x5aa74c3fbb026006
	.xword	0xd8048557083b9e3f
	.xword	0x90dd6988da6d56bc
	.xword	0x85d7eb72de1fcb44
	.xword	0xcaed3b5a3d80f6ea
	.xword	0x560d522733ca6028
	.xword	0x0d89b1d1bfe24102
	.xword	0x5a7d83e6830659c0
	.xword	0x6b143b0e83ccf4d0
	.xword	0x56e36d056f6a7844
	.xword	0x80b5b04c0c386140
	.xword	0xb81d695c9e15fc00
	.xword	0xf823986d5544b72a
	.xword	0xb84f00a50300c6a7
	.xword	0x4db697d64c9760a1
	.xword	0x08b95014a7c8e908
	.xword	0x9c8132b120b81952
	.xword	0x0be938829b8d2927
	.xword	0x2e64f3a46949bda6
	.xword	0xeec06b02ee09c54f
	.xword	0x600ffa04c9cf4467
	.xword	0x48296d991d14d6e0
	.xword	0x51c4e005d40c689e
	.xword	0xe8a242035afe3dc9
	.xword	0x5a611ba22f8766eb
	.xword	0x88e5798744a2e01b
	.xword	0x888786ddc32a888c
	.xword	0xd50bba1e68eb4f83
	.xword	0x926e97c6ec09727a
	.xword	0x379f923e02218add
	.xword	0xc3c7042abc94225e
	.xword	0x87e3579006eddb05
	.xword	0x5a9e574bf700cb91
	.xword	0x6dd975331138ba6d
	.xword	0xcd96b919ebe19e04
	.xword	0xbdbaad2af21083e8
	.xword	0x78fba56db5d2a4bf
	.xword	0x31449a5202a2402d
	.xword	0xa50f55c1523badf9
	.xword	0xb9451756eaeca4d7
	.xword	0x411c6bac73a57b2f
	.xword	0xbc5fb0a27d7308ec
	.xword	0x4f6bb41192bf907e
	.xword	0x9b429d469421d30c
	.xword	0x09edce5800539fd2
	.xword	0x1a56bc3d5c9a80e8
	.xword	0x0c3b54015548ae55
	.xword	0x45ed3fae7a8d6665
	.xword	0xd62b8b78a0b4d910
	.xword	0x216a1cae72a9680f
	.xword	0x8a264f60bf081345
	.xword	0x4289b110a7cb2c23
	.xword	0x2b030999c0df7ca9
	.xword	0x8b839439da8cca72
	.xword	0x336b6abf84b7a777
	.xword	0x4ff52032280e6fcf
	.xword	0x138a9572bb495bbe
	.xword	0xbb7767b4296ad9f8
	.xword	0xd4dd23d0a7c495c1
	.xword	0x0c86e97428c91bf8
	.xword	0xecec32785847ea30
	.xword	0x5a7f1ec64130c1e9
	.xword	0x023e49901fe2de28
	.xword	0x57b10b481d2d70c7
	.xword	0x2f1bdd2f8545ac63
	.xword	0xe3a57113b2b19d9e
	.xword	0x5b83e740e45b43dc
	.xword	0x7813b5d54d6f780d
	.xword	0x90709e007ef6c98e
	.xword	0x877fc5be086ede19
	.xword	0x8aff44314e57f027
	.xword	0x942ebc23e32a4814
	.xword	0xfda7959af7d089cf
	.xword	0x14010b05bb8e7693
	.xword	0xd81f0885d6121711
	.xword	0x6bd8ae6aa2cede30
	.xword	0x422549dcb3a3a21a
	.xword	0x572dfc839e73b33d
	.xword	0xad20abe7b56b05b0
	.xword	0xc042f9159b2cd4f2
	.xword	0xc1d671258e4ea5d6
	.xword	0x39a6ecaba79c3c9c
	.xword	0x5ca087eea8593a8f
	.xword	0xf307d9da04a78061
	.xword	0xb2fc3aa5c9d5cfd5
	.xword	0xed67e753229818f4
	.xword	0xafe72cea58e3dccd
	.xword	0x9db310ffe22c4b07
	.xword	0x1bbc8d6b07092d80
	.xword	0x0c8ea466a7a56a9b
	.xword	0x276e66fb050dfdfc
	.xword	0xb345c59a0c07eb88
	.xword	0x8a8ad1e8420ffc19
	.xword	0x42377a0f37c56749
	.xword	0x7dd0751bdee66e2d
	.xword	0x81391d68a17caa28
	.xword	0x84a555310f93c6b5
	.xword	0x09253d43454dc798
	.xword	0x5911f9c0fb925632
	.xword	0x6305e2623632ee37
	.xword	0x9c822ff810a165e4
	.xword	0xc6d8b5821ccee708
	.xword	0x23224cd768ce139d
	.xword	0x86d74c0fac457767
	.xword	0x12950c63368bd23a
	.xword	0x6ad2d852e06d114d
	.xword	0xad048e976b72f032
	.xword	0x0fcecb46ff2b7521
	.xword	0x47f66155f003305c
	.xword	0x20f986c75c6419cd
	.xword	0x937b47d1ba095cf6
	.xword	0xfd76e06d8ab4ee8b
	.xword	0xc5b734af0fb4ec09
	.xword	0x6e92ff4f1a8c668f
	.xword	0xa02641dff439a3ea
	.xword	0x49fcb883df657d8e
	.xword	0x6f237c115dcf0c98
	.xword	0xd9f4e6b24792e0cf
	.xword	0xe26ece786fd3aa78
	.xword	0xd20cec9ab0675e26
	.xword	0x31dfc33f5a81e380
	.xword	0x83227cb54a06fdc4
	.xword	0xf1a8b09622392324
	.xword	0x9a22fc5f3d410eb3
	.xword	0xfe8a343a2fe6f797
	.xword	0x4faa748c6f18ea18
	.xword	0xccb248107dfa3910
	.xword	0xdaeea1299933f294
	.xword	0xec8f2d41d9919d2a
	.xword	0x6a6c5a3247b7eda3
	.xword	0xe7d327e839a1a7fe
	.xword	0x276fcc6c8f14f639
	.xword	0xa75f0f9e4274c77b
	.xword	0x6b7b934575f0141e
	.xword	0xf06ffcb96e084008
	.xword	0x17d8c31d0ff518ab
	.xword	0xe240448584079294
	.xword	0x5a75ee358f8df750
	.xword	0x055496f5244a39d3
	.xword	0xfcfb8d013087a482
	.xword	0x61b8c76eef06876e
	.xword	0x89946949f951e6cf
	.xword	0x82dd470aaf3826c5
	.xword	0xe8ceb2dc6efb1122
	.xword	0x4a6dd8182227b11c
	.xword	0xebeb9e4e6d6ebd54
	.xword	0xacc464c57e027695
	.xword	0x16ee8fb875df61ae
	.xword	0x4e73869726c99602
	.xword	0xc6ee271450749115
	.xword	0x1330a6dbbf66721b
	.xword	0xe12e98caa756425b
	.xword	0x97068fee35389d58
	.xword	0x9636cc0abbc36e02
	.xword	0x72c9ee1707037dcf
	.xword	0xe3a7fc259e2585c7
	.xword	0xd42e8bb75c417d5c
	.xword	0x03163f3e15269c37
	.xword	0x335323361dae94ac
	.xword	0x2224b19dea3f0490
	.xword	0xf3c657f010746e85
	.xword	0x718e76bf20ec29fe
	.xword	0xca2950c2fa20e16e
	.xword	0xf6d3770046554ae0
	.xword	0x6ae1fd28c8f6aadd
	.xword	0xb7b1ea6d3e6effcf
	.xword	0xaba17417e9fd27ef
	.xword	0x3cbac6dca0b1e129
	.xword	0x74f8578dcf4287a5
	.xword	0x4e5694b8de2091f8
	.xword	0x60a000213b782d31
	.xword	0x504c76643d38c60b
	.xword	0x4216ced172d70e0e
	.xword	0x2fce98d6f7030966
	.xword	0x108b66b34e84e2af
	.xword	0xa64fb4102d3b4f80
	.xword	0xfab371f88053351a
	.xword	0x64322b5ee25022a1
	.xword	0xe036891630453246
	.xword	0xca1e02dbfad3a2fb
	.xword	0x9f9ac223b9e802e5
	.xword	0x03281a3d177ed0e6
	.xword	0x5c7e1786b321c764
	.xword	0x12b1352473e858bd
	.xword	0x78efa8772421c736
	.xword	0xd79d3d1254329e4a
	.xword	0xa31a2f038f1ff539
	.xword	0xfb61238eb7455aa5
	.xword	0xd9ecaf5f66636b2e
	.xword	0x82cff064d19bc292
	.xword	0xa7fabdcb30deb53a
	.xword	0xc8b9131cbdb7a8d9
	.xword	0xaefab645377f8989
	.xword	0x1117bb514082a1f4
	.xword	0x766798f26dabc17f
	.xword	0x22203bd1dace9d58
	.xword	0xf3ffa1f66524df08
	.xword	0xf3d352dd81cc408c
	.xword	0xff9a24b3237bdfa1
	.xword	0x374c992d69c9f4d4
	.xword	0x89995837b0e92e8c
	.xword	0xd7a6357e696a8c38
	.xword	0xae5b7c01eacb9d51
	.xword	0xeae4e81c24a477e5
	.xword	0x27d3cdee083e84cb
	.xword	0x34721fc4e866ff90
	.xword	0x82fe60ed57691ee3
	.xword	0x73f39f103b28e49a
	.xword	0x855f0ab3c017572f
	.xword	0xed5e9c6fefbb4855
	.xword	0x2246b2e04a453fd8
	.xword	0x6ea5d5060588965f
	.xword	0x0f2fdd4ab8eb8f21
	.xword	0x16116cdf34dd4bda
	.xword	0x7b0c0b2ab638f8e8
	.xword	0x1b40abda3373d5fc
	.xword	0xba9c45363fd54275
	.xword	0x8dea2d2563516027
	.xword	0x5054752574c2f7de
	.xword	0x393abf11f8c1327a
	.xword	0x2d143c395288686b
	.xword	0x25f4de605f1f9452
	.xword	0x955d8e2b430bfa3e
	.xword	0xd92f084b15cf4c3b
	.xword	0xb588729603ae76be
	.align 0x2000
	.data
data_start_1:

	.xword	0xa410ba22692fd503
	.xword	0xa239b6c1221dcccd
	.xword	0x1b28575ff0ac32dd
	.xword	0xf8276153df575303
	.xword	0xc47f157e49661210
	.xword	0xf62d928929b9af3a
	.xword	0xb6e9cf39d429c08a
	.xword	0x264238e9c31e7b7f
	.xword	0x56ac9e630169a0be
	.xword	0x6c58b9e0fb9227b1
	.xword	0x332a3420471bfbed
	.xword	0xf888e5e5050d04d7
	.xword	0xef8ee9ef93548498
	.xword	0x157d3950db3e6226
	.xword	0xabb44454f3aa9ea2
	.xword	0xaf5692c3768617f0
	.xword	0x64a748fadf7fe44a
	.xword	0xa61e088975321ea3
	.xword	0x54835e5699f37004
	.xword	0x1af10cc156021117
	.xword	0x24f834c1f6adfadb
	.xword	0xbc7c96721b07338a
	.xword	0xb3fec216dc5a1caf
	.xword	0x1aa253db1376abf1
	.xword	0x673101edae499cc6
	.xword	0x9dfabb7606e84c2e
	.xword	0x360e131176d14f14
	.xword	0x9a6b56a0871828ff
	.xword	0xccf3af57f6c26dcb
	.xword	0x853e57f3a95a1139
	.xword	0x6f9aa52299aa3fe1
	.xword	0xfa945da4b4c6017f
	.xword	0x02d5997d12bdedad
	.xword	0x2f1be0b6f2f11cbe
	.xword	0x7fd0e21b82bf7ec6
	.xword	0xabef04b02e10f8cc
	.xword	0x6e8181e81fd1410b
	.xword	0x27cb915ace8a9053
	.xword	0xa7eccb87ba091691
	.xword	0x7ce8fbe10ab02b0c
	.xword	0x0eb302ee58fea36f
	.xword	0x7b08298ec2233f48
	.xword	0xf562023897838752
	.xword	0x14270b62203795e7
	.xword	0x39adbba91ee00d20
	.xword	0x920ee242d47fc7fd
	.xword	0x48d6e0a49768b565
	.xword	0x1bc61ea3c3e8b690
	.xword	0xe3217be0e25b568b
	.xword	0x6d6d448ed022e10a
	.xword	0xcc773aed17d45497
	.xword	0xac8134d7b7d0a685
	.xword	0xb3b083323f1643fd
	.xword	0x12f93bf492731cb6
	.xword	0x11f9590aa8f6f1f1
	.xword	0x518f9d36120ba072
	.xword	0x7c2854151f093fbe
	.xword	0xa546c528f42ca03b
	.xword	0x1cc1618d58967037
	.xword	0xe7c0e15aca578d90
	.xword	0x7071390ce1392991
	.xword	0x1eb60eb54c95973a
	.xword	0xdb3583463edaeb25
	.xword	0x151fdb1a833f47ca
	.xword	0x41395c7e79265b8c
	.xword	0x7cfe02801cafea57
	.xword	0x631bf86b7ff37ffb
	.xword	0xd5d7525bc3be09a2
	.xword	0x7438f516da8c89e8
	.xword	0x1dc0eb3ee3891f9e
	.xword	0xfd92d2b850e97a21
	.xword	0x6c3977be4b34c422
	.xword	0x2508f8ac2f872b95
	.xword	0x748243448c9c822d
	.xword	0x52b76a0b70c23330
	.xword	0x3f968252981e717d
	.xword	0xe0c92c4a2f7854a7
	.xword	0x57512aad8ec77061
	.xword	0x21a448aeae61006e
	.xword	0x64bd426bb73218ef
	.xword	0x9671e399ffae810b
	.xword	0xaf656d7384fd579d
	.xword	0x2da1789015107e6d
	.xword	0x4a40b98fc8aed7aa
	.xword	0x0dd785fd6ae89140
	.xword	0x7a77e15653916825
	.xword	0xc6d371fe5509e34f
	.xword	0x59f40a33ab5ad869
	.xword	0xbed2f35270ed4b43
	.xword	0xe0acc5cba0255cfe
	.xword	0x719dabb5caf456c4
	.xword	0xef738e7fb2b4af23
	.xword	0xaca21314e1541b99
	.xword	0x9244934c08057263
	.xword	0x19d1c1c3457e6415
	.xword	0x397af60687c03354
	.xword	0x5570e2c4a59feb89
	.xword	0xec998bbdb28b59f6
	.xword	0x2c4516f5791e3fc9
	.xword	0xc42773bec1360de1
	.xword	0x3453d585bd8e9f21
	.xword	0xa00905905140132b
	.xword	0xf92068cfa5deee65
	.xword	0x29cf3b9c6059f7e9
	.xword	0x765d361c3c3a8f0b
	.xword	0x5f98cdf5bad28df9
	.xword	0xe744c87d67e64ca5
	.xword	0x7a8f2206519fd3f0
	.xword	0xc86f583468ffc78a
	.xword	0x20c9c0551f2a038b
	.xword	0xf5610bef6b88b636
	.xword	0xa9fe23356c482c88
	.xword	0x23095ebe59163bce
	.xword	0x825ce381cb321baa
	.xword	0xf3b30f2701769ae8
	.xword	0x214f4e00eeaffd64
	.xword	0x6c7b05cd95ee439f
	.xword	0xf480f539142c3ecd
	.xword	0x878bff653554a8db
	.xword	0xd65580ea42823cbd
	.xword	0x5b2cae76409831d4
	.xword	0x7f1698d6b57b9042
	.xword	0xa93fb7210be8b838
	.xword	0xc958918965feaf0b
	.xword	0x8577bf0eeb0d07fd
	.xword	0x91dce6ac9d7ed6aa
	.xword	0xe8697d31ecb84960
	.xword	0x0ef81ae18ad82817
	.xword	0x9fb49b7b8c96818a
	.xword	0x63575c88885e53fa
	.xword	0xebe5e14134c1b810
	.xword	0x05d9344b52554bf8
	.xword	0xcff1a843b6fe1335
	.xword	0x4e4152a9b80bbf3a
	.xword	0xeedb68093a2b7f32
	.xword	0x0e90ed458b27f36b
	.xword	0x79521d2ecfe75b15
	.xword	0x73b286a53df48848
	.xword	0x3b7800a50ed8191d
	.xword	0xeab685def3a35493
	.xword	0xc64136e1dd2d1add
	.xword	0x9659cdd47928d12c
	.xword	0x77eb4caf2379bb50
	.xword	0x2a8448fc36ae3f75
	.xword	0x2c1edca5f7b1e9a3
	.xword	0x30c68d5820bdb5d7
	.xword	0x2f12a8dd57006cb9
	.xword	0x51c94d16c69f11ed
	.xword	0x1cda0975ba57ba6f
	.xword	0x644805dbbe54fcb4
	.xword	0x6860aab923b96509
	.xword	0x8bbbb8c99631ae9c
	.xword	0x1f395963ea18ad04
	.xword	0x63ba8fb5cf8e55c6
	.xword	0xc956063fe3bcda4e
	.xword	0xb153c9917967c494
	.xword	0x6e79a12aac18b2ea
	.xword	0xd1e2701721a656d6
	.xword	0x5bdddb9a286aa8ad
	.xword	0xd4c74138344d6bca
	.xword	0x568b17c3c80d6618
	.xword	0xb15355d728ebe088
	.xword	0x8339336e2069fd69
	.xword	0x469027dcaaf94385
	.xword	0xcaeaa8b7989fe40e
	.xword	0x9fd419d5398bf35d
	.xword	0x78bb45d920b343ec
	.xword	0x534d3c38bbe15dc9
	.xword	0xc4b728eef57959bd
	.xword	0x96c0b7963469c624
	.xword	0xd3dce432cdbeb0d2
	.xword	0x17162137579d7fa8
	.xword	0x66a8bd9a54909288
	.xword	0x1df90f09642438cc
	.xword	0x18764e5b88f3c685
	.xword	0x0ec80538a37d03bc
	.xword	0xd4852b6c4a56b02d
	.xword	0x999481b513f01281
	.xword	0x9922b1216772f11f
	.xword	0x44432ebaa160fb59
	.xword	0x7e78d07d9bd91ea7
	.xword	0x3d440872b600c3fe
	.xword	0xf520e9c3e73d211f
	.xword	0x5a3e2ae6346d458a
	.xword	0x07b20c56d75ddc47
	.xword	0x39ea65669c806c76
	.xword	0xae8c9384034bd68e
	.xword	0xad8f687cd44e6360
	.xword	0x526447a30cbe04b5
	.xword	0xfc9ea7812f994220
	.xword	0x6b92ede313112f53
	.xword	0x6929e3e51bd47a69
	.xword	0xc3de707875a9ea46
	.xword	0x238a6d2243ed5d66
	.xword	0x66f82f85649d2c0c
	.xword	0x14505218f634bd9d
	.xword	0xf4f5efd821907a45
	.xword	0xb04649f8b5d68c23
	.xword	0xae9c9cd9b982a389
	.xword	0x214526f55a7e362f
	.xword	0x4875a1e2b08091ed
	.xword	0xfcfd99373488ac26
	.xword	0x768c4592f10907d4
	.xword	0xb09f3b52bb9cf2ce
	.xword	0x124f383ee30dbe3e
	.xword	0xd0416dd2f1c01526
	.xword	0xeda9098e12f3bd67
	.xword	0x208c55865c538bdc
	.xword	0x969107aba8a7294e
	.xword	0x3266d1dcd8a6b82c
	.xword	0xf3c0c59858f82ed3
	.xword	0x0370092949f90884
	.xword	0xd35c36d65457ef56
	.xword	0xf955ad9239c17147
	.xword	0x13340e2bb67558bf
	.xword	0x843c373533306033
	.xword	0x9bb22711ec455c28
	.xword	0x8a745232137f73db
	.xword	0x7b2e481f384a0ed6
	.xword	0xb7ebba5a5f04d92b
	.xword	0xfe3035e175425d49
	.xword	0xc65148a37edd6ef8
	.xword	0x3ed68c1223d24957
	.xword	0xa4e7587932a99a12
	.xword	0xad37baaa13dc885c
	.xword	0xfdc4585b04530435
	.xword	0x8efaa1e038f16276
	.xword	0x0202201d607538e8
	.xword	0x74b36cbfb7efd04d
	.xword	0xe0e3278c64ff5268
	.xword	0x87c08eded3147713
	.xword	0x82bc8c802d3c46fc
	.xword	0x9d80754d2ff42832
	.xword	0xc567ce0873d103ce
	.xword	0xb1d1f442425b20bc
	.xword	0xeddc513817883d89
	.xword	0xa7aba64937132f3b
	.xword	0x96f9b48c4ab33c0b
	.xword	0x94b2c74a60c9be9f
	.xword	0xde90eb69292de103
	.xword	0x1bf1891333257b63
	.xword	0xecca7527a6d0a3a8
	.xword	0x7de9e6a6036fb349
	.xword	0x29f089b76fbab8f9
	.xword	0xcd5f98c2de27c14e
	.xword	0x6838ec694722e6c3
	.xword	0x7f43ad425af347ff
	.xword	0x6d15d84dcebb783b
	.xword	0x164cffaccc572e2a
	.xword	0x78add2f8fc694350
	.xword	0x427a449afe7ab5be
	.xword	0x60c6232a4c436e51
	.xword	0x9f1cc6809b939c86
	.xword	0x42ef3628e60da82b
	.xword	0x5235482320c94706
	.xword	0xa424ab498558ee17
	.align 0x4000
	.data
data_start_2:

	.xword	0x63dae70c1dcc3ccd
	.xword	0xc154c3cebc516c37
	.xword	0x120432c1a57c9737
	.xword	0x7b40d2dbff720056
	.xword	0x0987e2533f0edb54
	.xword	0xf42d1284d772a561
	.xword	0xea03ed7e27806e9a
	.xword	0x738b996fbc4a90b1
	.xword	0xe846b2b1ccb5bdfb
	.xword	0x61391640c50b2288
	.xword	0xcae2065129f21739
	.xword	0x5030e3c0c917b06f
	.xword	0xb969dddb2ab307ec
	.xword	0x9a1b06214492093d
	.xword	0x1c82c971046fd0f1
	.xword	0x7b74319ccd4ab462
	.xword	0x98123752e1f9b57a
	.xword	0x82fc65e6ea42a78a
	.xword	0x438d56f10a97c838
	.xword	0xae16580ccadf5797
	.xword	0xfd73334cc87ac31f
	.xword	0x88c16e16ca565f5e
	.xword	0x278bbce491583c6d
	.xword	0xb91b2a478cc33532
	.xword	0x9a95d55e515ee354
	.xword	0xf5229d3861b48f36
	.xword	0x25edbae6bb2960e0
	.xword	0xf8525acdb5f9ee84
	.xword	0xb8791b3998db00c3
	.xword	0x63486fee8250e09c
	.xword	0x4a6805413679db07
	.xword	0xc965fb69621cae24
	.xword	0x28ee4a5877a250ed
	.xword	0xfe505a77281d87fe
	.xword	0x4d8df3f388a89fe2
	.xword	0x1a7f25eb5a991af8
	.xword	0xe371688533ee763c
	.xword	0xd4deec5f527f755d
	.xword	0xd4cbd79ed3e0d818
	.xword	0x01eece652e63d541
	.xword	0x5e0bc1390cfbdb3d
	.xword	0x97f6dc293a3ddc21
	.xword	0x2b06648b78fa33f8
	.xword	0xa26b4f56c9ed0826
	.xword	0xabe34cbbfedeaf72
	.xword	0x8ab95d73e3d6065c
	.xword	0xf123240a63bcae2b
	.xword	0x2380944c99a04851
	.xword	0xd842e13f51c9840d
	.xword	0xd0fed1b06d2d9787
	.xword	0x3d7ea8ccbd546aef
	.xword	0x945137ba8d299d1e
	.xword	0xe3735f54b8d483cb
	.xword	0xf9c63ce54d53f4c9
	.xword	0x90b7180a2b756cd5
	.xword	0x0eb4112095d9c918
	.xword	0xb3b379d2c085d828
	.xword	0x525790b0a45e8336
	.xword	0x6e8e2f4bd3b153b8
	.xword	0x4cf008d6c9b2a1a4
	.xword	0xe4c815c0ca0be191
	.xword	0x17a4a7431eea37c8
	.xword	0x5d5755bde878eea9
	.xword	0xbf37ffd3659511e0
	.xword	0x33e2cd31982ce4bc
	.xword	0x3e51a059930f3346
	.xword	0x723f60420b0d87c1
	.xword	0x60cabf090dc4284f
	.xword	0xae88dd7c2c2b13df
	.xword	0xa2fff7a5a87135f9
	.xword	0x93c093d3e1e630bf
	.xword	0xe6b54d05db6a4628
	.xword	0x82b8503ffc2ff1e8
	.xword	0xe6281eb0ecefdb9f
	.xword	0xfe9119f11aaf31b0
	.xword	0x164e4f27b30ffc56
	.xword	0xdebcd3219f17899d
	.xword	0x0298858c1e491a35
	.xword	0x257ef737ac6f8618
	.xword	0x6868ec1e398ac6d5
	.xword	0x7352d2ad585c2bc0
	.xword	0x9c89016b91c18987
	.xword	0xfb1506c65ace03cf
	.xword	0x065ff2fc3b849013
	.xword	0x1cdd59d0a186338a
	.xword	0x8259b3466d4aa6bf
	.xword	0x1f52b77fd05fd9cc
	.xword	0x017869f2582b100a
	.xword	0x676323620ab40ce4
	.xword	0x8bf204ab905f1f70
	.xword	0x6abce7eef2c99ef4
	.xword	0xe98c9cbbe6acac56
	.xword	0x0644078c422a05cc
	.xword	0xbc8ab6e977ccbafb
	.xword	0xd14f4ec8687345ee
	.xword	0x2add330c07c312a3
	.xword	0xd1aac9375275d19a
	.xword	0xa354c66cdd809850
	.xword	0xbddfbc9fc7aa213c
	.xword	0xf592106feb1fc9d1
	.xword	0xe951850b339d1aba
	.xword	0x1371e14d4f173689
	.xword	0x70e458846825769d
	.xword	0x0e1f6e3a0e269c83
	.xword	0xf248b670c561e225
	.xword	0x46ec1c7f252fcd5d
	.xword	0x90bd01aec053ea09
	.xword	0x2b153bbd2055f814
	.xword	0x09b7be76e9e5312d
	.xword	0xd5818de1b44c304a
	.xword	0xeaeb73121a51c94d
	.xword	0xae2793df142f1917
	.xword	0xf9e703d98ab73572
	.xword	0x11f05befa38b1367
	.xword	0xdae020d0b66c1004
	.xword	0x697f05d82e384372
	.xword	0x3bedc5018219d1d3
	.xword	0x2eb819931cd3beef
	.xword	0xa6c6dfd573942dc6
	.xword	0x04559521f2e613e7
	.xword	0x0ae9d2598e452c0b
	.xword	0x4096c56797bf7f00
	.xword	0x51be79dc85b8311f
	.xword	0x9416d8337daeb071
	.xword	0xb98b39f74d22673c
	.xword	0x6234323733cdd0e4
	.xword	0x40d377a09b9dc223
	.xword	0x324f501c9efb2f27
	.xword	0x41ed912ce0bb296e
	.xword	0x68699b0c0c308773
	.xword	0x2841c9cc26b790ee
	.xword	0x1fbb43ccc19931e0
	.xword	0xc2ad19e270fdfa8a
	.xword	0x7d579199b1f11d8b
	.xword	0x68ca6dcf1ccb72bb
	.xword	0xbb3ac6a751296927
	.xword	0x512821bab4ba24de
	.xword	0xc039c8c12995c922
	.xword	0x596996741820d765
	.xword	0x3fc135c78bc106de
	.xword	0x8dbf6a40aae2e8b0
	.xword	0xaf67ca096ef9015d
	.xword	0x376de78126d79887
	.xword	0xf3f3a139bed6c2df
	.xword	0xa1b3f6729a9792f0
	.xword	0x341e50317afe7d9d
	.xword	0x7a92ecb24a7f8938
	.xword	0x6cbb77a980849324
	.xword	0xc91e3fcee34c4b5c
	.xword	0x2b8b6bc633480901
	.xword	0x7f480fb1d37c6592
	.xword	0xb56a3444038c0caa
	.xword	0x231e0f920bcecf0d
	.xword	0x9d752754a484a0d1
	.xword	0xf0703eecb6bedbbd
	.xword	0xe34547d67b40f02c
	.xword	0x9285340aff3d3451
	.xword	0xf58509cffafaf032
	.xword	0x340cbcdf0b3cd42b
	.xword	0x6a3b5dae12579ea4
	.xword	0xa7b96857bdeb4ce0
	.xword	0xaf0d3c606f0c090e
	.xword	0xd608e0f76c6ec57e
	.xword	0x4e1534e9b8e9ca61
	.xword	0xb06c28996c1d5357
	.xword	0x62438a961d247c2a
	.xword	0x8ed26dbbd9e7531e
	.xword	0xf296494f168bcd04
	.xword	0xac8a0d1a30496802
	.xword	0x1a279972ac10c7ad
	.xword	0x15f32ecfa1002313
	.xword	0xf368545003cd7bf7
	.xword	0xc3bf49582bb056e6
	.xword	0xf35e041892fd696b
	.xword	0x21a3cfe46be8bfab
	.xword	0x88d92f0edcd311e4
	.xword	0x78c7fe0f241f8c6d
	.xword	0x4f24f6492699cde4
	.xword	0x0e8aa323c42f5d8e
	.xword	0xf7cfd0653b525fce
	.xword	0xe256c79c3829cd13
	.xword	0x81d073d4dfa800fc
	.xword	0xa3ab89d2d8b6d38a
	.xword	0xee330b6abfb27fd1
	.xword	0x4d883f3d7ec04e8b
	.xword	0xe4f9407c77906cdb
	.xword	0x9850468f22638e9c
	.xword	0x2fe7bcf2f8c0e101
	.xword	0x1f1ea7a6cee545d1
	.xword	0xdae496cc816cc237
	.xword	0x57b0d39b66b6771f
	.xword	0xce3fd73a108a2029
	.xword	0x3a7a19b0de3bf62b
	.xword	0x4bc0dca9f37c4aa5
	.xword	0x6a9818b457d9e3e7
	.xword	0x07c082919611fd5b
	.xword	0x23316e1a8c1f909a
	.xword	0xcdeea4cc3540ccb3
	.xword	0xc4518f3ac210f2ed
	.xword	0xa2e4facee0ca34f8
	.xword	0x6911c76185189269
	.xword	0x5ee1a9d72203c71e
	.xword	0x0a197e573a892d8a
	.xword	0x8d79ed472ef139d3
	.xword	0xbb749fd8ab8a920f
	.xword	0x59c078a3c92d23e8
	.xword	0x15a00fc35a600e4c
	.xword	0x22cdc67d0625503c
	.xword	0x1f38ba92b5bb5820
	.xword	0x0708971dbeff8cca
	.xword	0x788005df95f691a0
	.xword	0x13114094f6094246
	.xword	0x3104090effa4959d
	.xword	0xa5eb1cdbcbac8196
	.xword	0x2f7c570960c13bf7
	.xword	0x200eae20e65b6c14
	.xword	0xd6580f01b3423973
	.xword	0xa88984f6891e48b5
	.xword	0x754e04ea42bead58
	.xword	0x9ae695cb590cdc36
	.xword	0x5677f9f6acd78f78
	.xword	0x3a0cd18c322d720b
	.xword	0xa311538581a43e60
	.xword	0xb81f1188e45e5ba2
	.xword	0x9df14268f60017ce
	.xword	0x9b4a9e3e30fdce2a
	.xword	0x43b08a3d918e831a
	.xword	0x40a3f55754992a70
	.xword	0x9c5067c21996a55d
	.xword	0x4c7fc998881a15e0
	.xword	0x21de8672297de528
	.xword	0x8a96bf76466740c8
	.xword	0x603405736679c358
	.xword	0x00b1ab568542f3ca
	.xword	0xeab35bfd18b8950c
	.xword	0x1630329757bbf4b2
	.xword	0xe7a45f510f4a2a70
	.xword	0x395a2f473f807ba3
	.xword	0xb884c75c1231de7d
	.xword	0x1617ef9d7e45c01b
	.xword	0xecec423a0fba0e5f
	.xword	0xf401f7870a99bfa5
	.xword	0xf6477c95c55dc366
	.xword	0xb4be14d7fe51f7d9
	.xword	0x47c968158b163646
	.xword	0xf9545afd9f7c4c52
	.xword	0x02e6b1cbc4533c16
	.xword	0xc5af82bce5961885
	.xword	0xfe6f6688db326495
	.xword	0x5748d8239d77a3ba
	.xword	0xf9e9aa329904df39
	.xword	0x4ff659402824f602
	.xword	0x16450cc018721e75
	.xword	0x0ed8e1649d3a10d4
	.xword	0x24b86eeaf5866498
	.xword	0xe12b0bb17658ba2f
	.align 0x8000
	.data
data_start_3:

	.xword	0x4b90e24c63373c07
	.xword	0x79b1c9c770ba4169
	.xword	0xa238a4955772deb5
	.xword	0xe2ce280cc03c1a6f
	.xword	0x72187721e8edf5b1
	.xword	0x53855a7e9ac56041
	.xword	0xfc487407aee81d5e
	.xword	0x29959303ce63472c
	.xword	0xe6f08dd1e935554b
	.xword	0x6f978f4f32f6198f
	.xword	0x96fb57e97b6556c4
	.xword	0xe4edbe5a02745e08
	.xword	0x8f46ee0b21499b40
	.xword	0x751a10766744f99c
	.xword	0xd87eb7aea3210bce
	.xword	0x9406519a626a9d71
	.xword	0xb92cb6d9caf34f45
	.xword	0xd60b26f4e411c664
	.xword	0x8e6606ec33755f39
	.xword	0xef200c5d2ec1ab9e
	.xword	0x42c36ff46411622d
	.xword	0xa2bc9925b67d4864
	.xword	0x9fd09d25ba2c2781
	.xword	0x0059cdf079c44b5f
	.xword	0xdd0f2c6651b2d565
	.xword	0xfea7ccf601f8258f
	.xword	0xa7659ed6f09f0189
	.xword	0xc3dc74a7dca45cf5
	.xword	0x089cd0c650487c3b
	.xword	0x5b9b7329c2d2566b
	.xword	0x88b994337306e093
	.xword	0x80a3d489f580f282
	.xword	0x4d0ee1b0086419e0
	.xword	0x9f53c0089fc62169
	.xword	0x85844dbf0d2ee9ec
	.xword	0x48b31d9fb6493e56
	.xword	0xe435a6cb716c0153
	.xword	0xfdf1dd53b0d35ad2
	.xword	0xfe605a0844e64082
	.xword	0x76284a098c6ddd6d
	.xword	0xfa30a51c99b4ab80
	.xword	0x30b2b2bc6a1ecae3
	.xword	0x6e1f0e66c9bc3137
	.xword	0x6752b01f2a79f75f
	.xword	0x6a72fc4470006054
	.xword	0x9b8f8fd67f4692ae
	.xword	0x1575f4932794fa68
	.xword	0xd64ca4f4666b0e3a
	.xword	0xfd5876d24f2c1521
	.xword	0xb0fd517bbac6a9fc
	.xword	0xe9d988e9f50666c7
	.xword	0x9d81bc6cdff306ef
	.xword	0x3def1dbc14e1bda7
	.xword	0x4ad5cb3860f66b15
	.xword	0xe4ea37ab352be8cb
	.xword	0x02e19ea2baea17ae
	.xword	0xd889b5ce5ae4d0a9
	.xword	0x5005963563995119
	.xword	0x414feb2b4f602935
	.xword	0x074ab7bef522dfe0
	.xword	0x76d00ff35e2fe04e
	.xword	0x82e470cb3879488f
	.xword	0x46fa55b3b1790462
	.xword	0x0344a0eaa693a086
	.xword	0x2203998c5c1bd3ef
	.xword	0x477fc14f30a78f14
	.xword	0xb8bf401d58f5379c
	.xword	0x93bea2c05d8f1d24
	.xword	0x48bd342b39ba4de5
	.xword	0xc2f8595f80fc0350
	.xword	0xcdb3cb87bb99d830
	.xword	0xac9bd5b4c5c34a72
	.xword	0x28ed032e9fa05ffb
	.xword	0x770c09790387531c
	.xword	0x33acfc01fd523522
	.xword	0x1a4e8cf9541163ad
	.xword	0x555f9b95aced7d3f
	.xword	0x783c4e34170b59f8
	.xword	0xe4afa876d6a21e91
	.xword	0x1a8cf1f3b0c4f7c7
	.xword	0xdf469566510f1770
	.xword	0x1135963bf24a133a
	.xword	0x10e2af5d0cba86d7
	.xword	0x74c2fc84c38e36bf
	.xword	0xf725d6bad9e67e9d
	.xword	0x75efad09617d63ca
	.xword	0x19d9411c79f29068
	.xword	0x6fd8a527617a393d
	.xword	0xb89e230d0998122b
	.xword	0x1d3de20965d03136
	.xword	0xd932226670a87de5
	.xword	0x7b17d130b88fe75c
	.xword	0xd0474ce199882860
	.xword	0xbd868a109ef623f0
	.xword	0xbcb080b3f4556f2a
	.xword	0xcb37ef258b40a5f9
	.xword	0xb4f0922e6e5b222f
	.xword	0x1208a33a2f655ac5
	.xword	0xe74ccfb082ec5b5c
	.xword	0x4817b4e135bb8d51
	.xword	0x4dda1421db5e1855
	.xword	0xb2d85de1789c4e41
	.xword	0x1e8ef6bf7f8b443f
	.xword	0xa0bf1bde0beddc4e
	.xword	0x625101c4730192a8
	.xword	0xa0aeeea515e3c81f
	.xword	0xd27482d5feb9786e
	.xword	0xc47e5136945bfdaa
	.xword	0xd2d744843fcefda4
	.xword	0x5b518a0bc3fab0f0
	.xword	0x97ac3e156626a485
	.xword	0xd0be032db6b4f8b1
	.xword	0x3558722b89ba755e
	.xword	0x01fb7a656ec26440
	.xword	0x38c232e33b98f678
	.xword	0x5ca63016f82844d5
	.xword	0xff1f45df3ee4cc11
	.xword	0xc000c4e11c0ff896
	.xword	0xebc1ded07b1125d0
	.xword	0x149139eb2f2cce2e
	.xword	0x2891f46f14d98224
	.xword	0x07abc2cdaf014aa7
	.xword	0xbfe230dfe44fa179
	.xword	0xff0a31574a4cda76
	.xword	0x3a6a69a9af0c85ff
	.xword	0xa9efecb625f2acb9
	.xword	0x901c153a5fdf1e61
	.xword	0x72bf59ec26cc2f2a
	.xword	0xc24a9b93eb7403a3
	.xword	0x414f2f13d2dd68c8
	.xword	0x86d4e52bf9a3440f
	.xword	0x3db7207a47d96f4b
	.xword	0x65b90cb96565b250
	.xword	0x7eb94bcb25c90479
	.xword	0x3fa8a0af81ff7e22
	.xword	0xecadcd8b49065cba
	.xword	0x24ac8499ce7cd507
	.xword	0x93f97cbaf6a89a8e
	.xword	0xd0b65fab720aae60
	.xword	0x752a3d8d735862ad
	.xword	0x2c179a4333e9c0cc
	.xword	0xace3d0ea0abe761a
	.xword	0x3bad3ac6c08cb2e3
	.xword	0x6df9d701786f3a29
	.xword	0xc92060bf25203e06
	.xword	0xe542a0ac4d4a3c2d
	.xword	0x7831341770d1d41d
	.xword	0x74b7e8c357d2b1f8
	.xword	0x6020e5cfb07fe38d
	.xword	0xbeae58f12f640df5
	.xword	0xbac38d247456635d
	.xword	0xd35313095ee9105f
	.xword	0x8a19641c219a2174
	.xword	0xcc549d29b7d01de9
	.xword	0xdb70367150a07a12
	.xword	0x3eb40fe5679fcd22
	.xword	0x95b4330c23a3b477
	.xword	0xa56c38132c2f99a8
	.xword	0xfcdf2ddd36a262a8
	.xword	0x8f895364ed878ebc
	.xword	0x5a6a4e0bdf9f92d5
	.xword	0xddf0aaf66ad1460d
	.xword	0x57716403c28282e8
	.xword	0x80713fbb0bf2a140
	.xword	0x7ff2255db74c495f
	.xword	0x17fff0c0c2fe3ad1
	.xword	0x204d4cc9d6c313da
	.xword	0x24ca855432fda1fb
	.xword	0xe7e1a3b48f9e629c
	.xword	0x7f8aa9b4f2cd699b
	.xword	0x6674cb997fc120b8
	.xword	0x5cbea32a95d05ff0
	.xword	0x6bd79a86111f00ab
	.xword	0x31a9f91e3237d24b
	.xword	0x727549bcbc1735db
	.xword	0x7a3bf6c4575c3c6c
	.xword	0x5dfba81e92ebf4d1
	.xword	0x7369b52b797d9f91
	.xword	0xa17f813cebaec602
	.xword	0x0989af9bb8950ba7
	.xword	0xc4275373b7dc30d1
	.xword	0xff73cad128c72c84
	.xword	0x8e764129756aa660
	.xword	0x749446c28689f294
	.xword	0xf61734572cdc21b7
	.xword	0xe7b5d04d588fd7d9
	.xword	0x990aaf0d66053bc6
	.xword	0x4efc7251e747d6f9
	.xword	0x96a47b0412e591a0
	.xword	0x522a67a881c041dc
	.xword	0xf0fe28450bbb3515
	.xword	0x97fff9b6df6b3cf2
	.xword	0x127d197e4d8e2fae
	.xword	0xc48a92be427f4d1b
	.xword	0xd11c643e16ecf04a
	.xword	0x4a54335a901a9cea
	.xword	0xbf873d9b660abc52
	.xword	0x0f0dd658e93abf3b
	.xword	0xc6e4de8360b8691c
	.xword	0x969afd3eed67f0db
	.xword	0xb48bd1cc9dabaeb5
	.xword	0xe25903a5da18a267
	.xword	0x4602b6ad547b8f16
	.xword	0xfcc81e5aae15b3c1
	.xword	0x3f323766af1faff5
	.xword	0x8d0e1978b46bcf07
	.xword	0x313d3c0018bb2c6f
	.xword	0x552583bfbc797555
	.xword	0x25827312289a9e34
	.xword	0xc1a0c738fbcec181
	.xword	0xdae8e6eeefa86bf9
	.xword	0x14fc9a935663653e
	.xword	0x18787e71660be7c6
	.xword	0x6451d7c9a4e9cd26
	.xword	0x15bf9730fda39343
	.xword	0xcc90422853480623
	.xword	0x03d1cde2688edee7
	.xword	0xb5e3cd9427f6ef29
	.xword	0x347a183bae6235c7
	.xword	0x582b22f3f6298288
	.xword	0xd65a15cef4bf0189
	.xword	0x89cd598e712c1377
	.xword	0x0d642ceef3db2d5f
	.xword	0x59d3a74629cb279d
	.xword	0xbbe3cd41cea9ed3e
	.xword	0x8ca08ed463dd586c
	.xword	0x87daac1c0a9555a7
	.xword	0x21c222a5ca7115cc
	.xword	0x29fa0c8628ac7d35
	.xword	0x2af623f841a7a1a0
	.xword	0xb8518cc0f0313929
	.xword	0xb42702bc914038e2
	.xword	0x00777a2334c14602
	.xword	0x798be00250e9e164
	.xword	0xcde7237139b81fa8
	.xword	0x58188eb020be5966
	.xword	0x3df05ef0167e856f
	.xword	0xd4adcf65c5644830
	.xword	0x290f405f43aa7345
	.xword	0x268f8880fc70f22e
	.xword	0xacbf4456a9e81c1e
	.xword	0xe32f769a4c85f183
	.xword	0xc57482feb910a90f
	.xword	0xfd874d5ef194ce61
	.xword	0x47399a50522e7616
	.xword	0xbd2d94e5da915361
	.xword	0x49cd7d66c4f2a58f
	.xword	0xb57841c1d23bdf86
	.xword	0xf6eb97477260de2f
	.xword	0xff44526b9bbbc69e
	.xword	0xaa409a1e8322e525
	.xword	0x654bca50dbeee167
	.xword	0x3c9fd9b06e017075
	.xword	0xf5e85a5af0c22e7c
	.xword	0x8c715628a8f456f7
	.xword	0xa315921cfa9799b7
	.align 0x10000
	.data
data_start_4:

	.xword	0x9a229ab3afc0b38a
	.xword	0x78fc23a2bc51a0e8
	.xword	0xb6f1f7689531bc40
	.xword	0x2658deeece748b0b
	.xword	0x2a56fcda593bdf64
	.xword	0x1bbd844e7fecf87a
	.xword	0xe1de738a3b5aec2f
	.xword	0xdbdde2037077a68b
	.xword	0xdd0f830bf337009c
	.xword	0xcf1223371ad9990e
	.xword	0x6f585553c6efc473
	.xword	0x4bf8490b5e321ee4
	.xword	0x2529971368d7282e
	.xword	0xec7e8a16ea3ddbd7
	.xword	0xc7e8f19a7ff030e3
	.xword	0xfccff29f063926e9
	.xword	0x31b5cfbd738252fa
	.xword	0xce539737ca8aa87d
	.xword	0x07df52c04f22df64
	.xword	0xf3941fff3fbfe0ab
	.xword	0x461e1c2180cff1f4
	.xword	0xac339a78ae401508
	.xword	0x5ef28dadb63f58df
	.xword	0x1903e65e0d2348dd
	.xword	0x28be14fe630d6fc1
	.xword	0x64c76a1f41cc2b8e
	.xword	0xf824beb54663d9cc
	.xword	0xf8f01ba8c6fef683
	.xword	0x9a3bde5ac5f8a1ec
	.xword	0x4151e84116b19c23
	.xword	0xd2929ee234569a41
	.xword	0xaf0e825f0273147e
	.xword	0x9c03cce89181e285
	.xword	0x143c3c6ba268cbfc
	.xword	0xcdb678871a271034
	.xword	0xd0fc1b445c9ac4de
	.xword	0xa1d321987d2954c4
	.xword	0x337e7f210f5d0f72
	.xword	0x8dcfe5c069a43a41
	.xword	0xd483775d4d2388cc
	.xword	0x86d587a3c2e3c9ff
	.xword	0xdb1ac3bf0bd93655
	.xword	0x866c930a20b32199
	.xword	0xa334dd71ea318457
	.xword	0xe48e7c28ac375555
	.xword	0xc4ce891920659d83
	.xword	0xc29736d35ab24c38
	.xword	0x4edad8f46593a693
	.xword	0x60f8bb61580b8e3d
	.xword	0x1160b01ba62a29dc
	.xword	0x251222734b4c068e
	.xword	0xc1d30d50bba56a75
	.xword	0xb9f888a5a52bda3c
	.xword	0x0c808829a54ebe38
	.xword	0x20443f4d37e9f003
	.xword	0x50f4ccce01103078
	.xword	0x5b0cdf067a69e67a
	.xword	0x6d1e8c7f80ff7aa7
	.xword	0xcbbc68ed653ace25
	.xword	0xa5d4d627ba8e6ec0
	.xword	0x02a3ca73dc71c82d
	.xword	0x453f6afb57e631db
	.xword	0x1d53bd84a2660441
	.xword	0x98b3cf385c994d57
	.xword	0x25de7762d266d923
	.xword	0x4e0edeb01f726a0e
	.xword	0x4d634751c4e3df96
	.xword	0x9aacd998fd566e4b
	.xword	0x86565998b70c0604
	.xword	0xa8c208d61b13ba7d
	.xword	0xa93b6403c8f6a957
	.xword	0xf4d6a7c067c68c76
	.xword	0xfb3c37805c01f98f
	.xword	0x56f526746f9b669a
	.xword	0x04b737bde8ce7a4c
	.xword	0xf806734be3d4f156
	.xword	0xb284742b744f4f9b
	.xword	0xc5c3245a1d6ed572
	.xword	0xc86b5539a7d13f2b
	.xword	0x3e9a8ac6107008f4
	.xword	0x02117e8bf44fc689
	.xword	0xa9c4e6f153753103
	.xword	0x5cc9407e3e26b02a
	.xword	0x30708e9b5057e89c
	.xword	0x5f6f452369aff822
	.xword	0xa697111cecaf00a6
	.xword	0x0a3770837c0395e7
	.xword	0x2cee5f245cf05690
	.xword	0x55d7c66f87fce1be
	.xword	0xd777e7cc5bb3cee4
	.xword	0x9d93b02d966c5aef
	.xword	0xe72504a481634198
	.xword	0xa9e1db0a5f069039
	.xword	0x588839f409781034
	.xword	0x47c0cd192d5ad9ca
	.xword	0xd8ef85f27666f3cd
	.xword	0x744e092d08f6dda9
	.xword	0x7cbcceb7e4c9da98
	.xword	0xcdd22d41b401f139
	.xword	0x3984b4e31a29557d
	.xword	0x2a873daa83b4f5e8
	.xword	0x2ce5f9a94f910dfc
	.xword	0xc56daa98da8035a5
	.xword	0xd0dbc2aada951800
	.xword	0x03a5d1b84d1b5950
	.xword	0x2240f22a50275ce7
	.xword	0xbc615d123ac201e3
	.xword	0x19990792a882340f
	.xword	0xb05eee17d40fe846
	.xword	0x80c6270b3d21450c
	.xword	0xe3867d463beed229
	.xword	0x19af6e9433569c69
	.xword	0x14159eccf7c0075f
	.xword	0x9020d6a665bdbb39
	.xword	0xbcd5b3e3c05ef8ab
	.xword	0xd989031d4918686a
	.xword	0x7232df83d987a37a
	.xword	0xab98e595e02ff7cc
	.xword	0x4089c06b33064016
	.xword	0x797cbaa23a42f3a2
	.xword	0xd587775a5400a997
	.xword	0x8ea0323d1140a101
	.xword	0x7e5e15728934f4ca
	.xword	0xee7200b43c7d3d9d
	.xword	0xdd090bb99afa07b1
	.xword	0x1ca003ed234d8335
	.xword	0x39e8be0f3476db47
	.xword	0x2358aa4068b8ddfb
	.xword	0x312b91eb9c098da7
	.xword	0x5454110d035994e8
	.xword	0xe0f4b82c7b31da7f
	.xword	0x6162506632df8118
	.xword	0x6308fbd3586c2400
	.xword	0x835a4832a53761ae
	.xword	0xe58d0e370aa8a31e
	.xword	0xe24a775ebf7c7ceb
	.xword	0x0fb11af2e1d9c320
	.xword	0xc974628d8666d426
	.xword	0x1bc8ed8b90ac40ad
	.xword	0x7d9f20d2f4f2f99d
	.xword	0x590a20ee9b5dcec4
	.xword	0xa5f0e50848c6d7b0
	.xword	0x87d2f42bc489f58f
	.xword	0xe2f3d586ece54f41
	.xword	0x0b78c9f27494588f
	.xword	0xebc3315955e0e0e1
	.xword	0xa0d912cc69cdc12e
	.xword	0x6d80325acc562111
	.xword	0xad2ebf69e3bb0608
	.xword	0xc6d9ee47ef6fcbde
	.xword	0x8e7a4d17cdb7fa17
	.xword	0x105ac0d78d4bc7ba
	.xword	0xc3c7e1ce101c6f60
	.xword	0x2f692216db75de0a
	.xword	0x143457a0daa98623
	.xword	0x664dc4ea527a1825
	.xword	0x08ae5cbe5b3bee69
	.xword	0x4ffd52b73465764c
	.xword	0x2228b4c9de19ec68
	.xword	0xec3c542908d822ca
	.xword	0x8556926b1e1a1f99
	.xword	0xce0afc7a8e585e87
	.xword	0x4892c128efadb505
	.xword	0xe948d252a98ab488
	.xword	0xfe77d8584e28fc1e
	.xword	0x635efc200bf8bcde
	.xword	0xb119957616c101b9
	.xword	0xfd884ab44d70ce79
	.xword	0x3313834d622a237a
	.xword	0x59fb5550f5eb73b4
	.xword	0x0421620f965c055a
	.xword	0x26dfe1ba58c23b58
	.xword	0x3360a8b01379c27f
	.xword	0xb4b9eeb7468e90ba
	.xword	0x3bc81b6b8b8c4745
	.xword	0x2ba0cff9e716eebe
	.xword	0x0a7bf18072676a30
	.xword	0x62fe2640a2ff86c6
	.xword	0x6eda11aa71bc4d10
	.xword	0x5facb0295b06e5f1
	.xword	0x171b87a84f2cfb2e
	.xword	0xbd3f8fa2ee6d3f00
	.xword	0xf336f56307a90713
	.xword	0x80b82a1d2c393021
	.xword	0x5edd9f8e6471e5a3
	.xword	0x8a258e8f16855179
	.xword	0xac68f118dbe087ff
	.xword	0x1c2f6d221b3ec656
	.xword	0x04e9daab98a92466
	.xword	0x0e98aa192cdfbcb3
	.xword	0xaf67adf6880ad23e
	.xword	0x072d633c57cc5fff
	.xword	0xf94479e776eaa1d9
	.xword	0x1304067e309bf045
	.xword	0xc125e214753b3f18
	.xword	0xbba4c4bc7da98666
	.xword	0x79d91bc7e68b9cb6
	.xword	0x8a9ad799c4a07021
	.xword	0x1159d9ca5f89ad54
	.xword	0xee64f6c0b3606d64
	.xword	0x4551717819e0fbfc
	.xword	0x111e1399cbdaa948
	.xword	0x9494fdaba98fb60f
	.xword	0x137954c919c02e56
	.xword	0x61b9f03529800aaa
	.xword	0x6b0b0726c9b2262d
	.xword	0xe87c9f5e424df417
	.xword	0x82afc716d273a2ef
	.xword	0x2ec1a6e115791bff
	.xword	0xca2d70fd49d67729
	.xword	0x061b991d98e3597c
	.xword	0xa93dd1a8bf648c70
	.xword	0xa2b6bfb79d23ae28
	.xword	0x8150daf08cd58a2d
	.xword	0x35f9f3f3c5bf340c
	.xword	0x28c321b3f31fe568
	.xword	0x01e4c8211f169bae
	.xword	0x6400858f68581fb5
	.xword	0xcc3ac69579553dcf
	.xword	0xbb86a95d5fcb0ef7
	.xword	0x10130ba175796938
	.xword	0x2be62f0668dfde02
	.xword	0x13a756da1bc3caac
	.xword	0xc67aa8da4fe8072b
	.xword	0x28afcb7615ba0e5c
	.xword	0xa7fbc5563a71359d
	.xword	0x3127264fc6a912a1
	.xword	0x4889ee456d313338
	.xword	0x32a9ebadc6e87ec2
	.xword	0x749a6f0289edc7e6
	.xword	0x7407712ac71ef45c
	.xword	0x15e013d757c4face
	.xword	0xa986313df8fda8f9
	.xword	0x54a6abd8e4439508
	.xword	0xde9d30d030b7e5ca
	.xword	0xd7e30d167e800652
	.xword	0xfd7a0ed5975fa6ab
	.xword	0xd246b652bd51accb
	.xword	0x2b93405f247f72c3
	.xword	0x88a25b5de3c83dab
	.xword	0x28641102df37c15f
	.xword	0xf391b3db70bae094
	.xword	0x1e8c41c68442afde
	.xword	0x523958da3e74e8a9
	.xword	0x534b0c73b5bfd9b1
	.xword	0x9db4f82f99581cec
	.xword	0x853492c44d97a4b8
	.xword	0x8591c8327021b755
	.xword	0x812b90398135bd8a
	.xword	0xcd2f30a84ffdf2a9
	.xword	0xa2669d6d9a350625
	.xword	0x382e1e108afc94e6
	.xword	0x673177c6d1884794
	.xword	0x511aa77394388e68
	.xword	0x1464d010f25d6504
	.xword	0xb6f3221f057a8571
	.align 0x20000
	.data
data_start_5:

	.xword	0xfa94f03c0dd93bed
	.xword	0x729933fc744ce7c0
	.xword	0x1ecb35d21db23a30
	.xword	0x2a8de7f625b180c6
	.xword	0x721f9116e79ce7c4
	.xword	0x4d591bfd5de3cdd1
	.xword	0x4be784389c255008
	.xword	0xded23fcc77fd45ff
	.xword	0x785e700b5f03e946
	.xword	0xbffe2527d3c081ff
	.xword	0xa46b1f56b9c05cee
	.xword	0x20919ee95968c32a
	.xword	0x435b8c8b95726eb7
	.xword	0xd2df5e4df3924f61
	.xword	0x0e266b2607c15ecd
	.xword	0xa76715161a72b95e
	.xword	0x996f6182eb653a0a
	.xword	0xea092c54318fae1c
	.xword	0x62e2681d8b38049d
	.xword	0xdb6d2e0aa7f7eab3
	.xword	0x3c9ac9de5cc4190d
	.xword	0x54a943cc6d79fe25
	.xword	0xb391f33437153c43
	.xword	0xacb9765806fd7bbe
	.xword	0x73a20fba99723452
	.xword	0x45accf5a33d2f43d
	.xword	0x6fa10adc427431a8
	.xword	0x151060f7a07973c2
	.xword	0xeb4f2fa4392d4f56
	.xword	0xd1810807d06fba1d
	.xword	0x67a4e71eda1d941c
	.xword	0xe20450b489a938be
	.xword	0x024fbeef59d88450
	.xword	0x37f07500396659f0
	.xword	0x14a83053847ac390
	.xword	0xe06e3b165227c71f
	.xword	0x44cce041be21c3b4
	.xword	0xee5d24b5a3d8f9bf
	.xword	0x44811c1145f888ca
	.xword	0xcfab9eece16541b7
	.xword	0x59b622df6e7a618c
	.xword	0xbdfddec27480ee99
	.xword	0xa0a088fdb9cb27f4
	.xword	0xcb47159e5e940e22
	.xword	0x4e38e55ebcf27f40
	.xword	0x457d0e27be9d015b
	.xword	0x3404914478d484e2
	.xword	0xdb38a94c9f8d9df0
	.xword	0x540cff2bd69bf98e
	.xword	0x28259e1d2737a2cd
	.xword	0x1487bce0be201ec0
	.xword	0x0d94a091dad68c91
	.xword	0x9b92a5c2cad5ef30
	.xword	0x5b47ec4a7ef6dfc3
	.xword	0x22ab8c80b817fd34
	.xword	0x4fd3749c8231cee4
	.xword	0x1f7299cb34d9ce17
	.xword	0x43f8de67a6d72246
	.xword	0x1261888a00c2e97d
	.xword	0x5804f8ea5f483738
	.xword	0x14996d6e48b5096b
	.xword	0x1e1d5a8f3305dc85
	.xword	0x51d846f763046a0a
	.xword	0xa67a7cd933aa3e71
	.xword	0x9dc01c936d99ae13
	.xword	0x86d67d5d9002cacb
	.xword	0x8f5e7389d8701502
	.xword	0xb5003fedf2e47347
	.xword	0xa339a00f5c4cf14d
	.xword	0x2c3179020fe4d2b3
	.xword	0xf8360e96605c030e
	.xword	0x9867f252d04e109c
	.xword	0xfec9c47649fcfadd
	.xword	0xd4475ca2bb5a5d08
	.xword	0xe8c4d653acc8167c
	.xword	0x6d17c0688aa41cb7
	.xword	0x2392a25359ea8e6b
	.xword	0x6d2b99702d4dd782
	.xword	0xfebfa3b332db8d44
	.xword	0x1fba738cee32aaf8
	.xword	0x45f5475b8f12d741
	.xword	0x6d726037d458e2f5
	.xword	0x1d6934330b42507c
	.xword	0x05b42081f34d2d15
	.xword	0xb934e262dd44d482
	.xword	0x68808a549a2f58e7
	.xword	0x80e6be6f99a96c04
	.xword	0xd6b66c9bcbff6003
	.xword	0x73cf49973feb90b2
	.xword	0xcc4370879c8be007
	.xword	0x898cac9b329161d3
	.xword	0x5a5507062dcd1596
	.xword	0x9785efce8c5bc09b
	.xword	0x949e16f293a3fd10
	.xword	0x35f9458385fdbea5
	.xword	0x2c5f9641fbf0b446
	.xword	0xa91166f5f64d9027
	.xword	0xe23a264b8f0b586c
	.xword	0xb021a713adfae802
	.xword	0x676f91bd41545252
	.xword	0x27eea50d5ec31b58
	.xword	0xf1a0c89b58ac93a4
	.xword	0xe156ce8e8318932a
	.xword	0xd0da7a0dd4d7d8d4
	.xword	0xcba0f1ee247fea8c
	.xword	0x50dcfe70ba5a211c
	.xword	0xb12d168be6e5259d
	.xword	0xf495bff024b8bcb6
	.xword	0xf97392009e12c1f9
	.xword	0x1c7a91fb2e894543
	.xword	0xd1644cc2b082f7db
	.xword	0xc007ef81519c4494
	.xword	0x23134b420c60415a
	.xword	0xd3f1162626b3ec00
	.xword	0x262130067e1f2e21
	.xword	0x2318f04ab5faa702
	.xword	0x16c84000643cbb1e
	.xword	0xdf0f62051668ad34
	.xword	0xa945dacef4990170
	.xword	0x997e554f4c034f50
	.xword	0xa1beb4739947217b
	.xword	0x4d2d01d0c5997538
	.xword	0x91172760192ab144
	.xword	0xd11d358729ac8178
	.xword	0xe097605960bf0dd7
	.xword	0x0aa163de0b2e12c9
	.xword	0x5bdb190b83c98840
	.xword	0xcf84c70198460235
	.xword	0x1c34d4f9a569793c
	.xword	0x7cc93b0e5e41c64c
	.xword	0x44601070a93ecc81
	.xword	0xceda80351f5c2595
	.xword	0x14bebefd99a3eb87
	.xword	0x60a5aeb44a9c503b
	.xword	0x5bdbac54f03d52ae
	.xword	0xca0055f61b2af61b
	.xword	0xcbcf0fbb20aa6cf4
	.xword	0xdd5b8256ce9e05e0
	.xword	0xcbba523b13f2fcd1
	.xword	0xd03336b79e371a8c
	.xword	0xc15ac3ea8180801f
	.xword	0x2b5b024f8e3b5029
	.xword	0x2f22bd05249c7792
	.xword	0xd9296829aaf277c1
	.xword	0xcf0652e9bf97cb48
	.xword	0x668fe4f329505a2d
	.xword	0x8f35bc6bc2b1f933
	.xword	0x0befcb84beb6508a
	.xword	0x749c3ceded72c3dd
	.xword	0xe5931d394a8863e1
	.xword	0x77943c4907ce2f91
	.xword	0x29094bb03d71dd05
	.xword	0x9c26d63fea8f4945
	.xword	0x2e9758ef2437387d
	.xword	0x412bd438f8cb437c
	.xword	0x8c8318e698f2bad2
	.xword	0x6f11719294f1410a
	.xword	0xf4f0215b385b1f9c
	.xword	0x8e22190d86ead9bc
	.xword	0x0872dd234784a62f
	.xword	0x2ee4e3e44f13f3f7
	.xword	0xb9aa4dc7d6c3e074
	.xword	0xc66975cb089ae6b8
	.xword	0x0f3cd7edcbee244c
	.xword	0x99868c2a78b71f91
	.xword	0x35829617af086fa8
	.xword	0x888df1f4ff614505
	.xword	0xc89e1f5fc7e9cb90
	.xword	0x441b472b67810955
	.xword	0x5d3d4c5aa711bf80
	.xword	0x8c90f5a4b6c1d550
	.xword	0x00e42fdacffea3d9
	.xword	0x105b77a5f6195f47
	.xword	0x79d3be3161d49ccc
	.xword	0x278610cfb000a52a
	.xword	0x061851a59f2b98bc
	.xword	0xd706c0071949c076
	.xword	0xd4eab22445fc3444
	.xword	0x33d48dbfd978d4dd
	.xword	0x77f9458a116caf0a
	.xword	0x018cb7b4598028cc
	.xword	0x9f8e27e7e5b82fd5
	.xword	0xd464129ae14f151c
	.xword	0x8502a7b29c814c04
	.xword	0x8a06568f0673a40b
	.xword	0x55bb92fa7aca1f55
	.xword	0xc84591ca65b9a919
	.xword	0x4e2824a5276295aa
	.xword	0x3e6c091844405fa5
	.xword	0x3fcfe58572987750
	.xword	0x557b7d2d802650f2
	.xword	0x46cb0ac6ac6b16ef
	.xword	0x35df486ff5af3677
	.xword	0xf7e75329bc017d5b
	.xword	0x3a216563351019b0
	.xword	0x136e0012fd08e661
	.xword	0x7090ecb97e974234
	.xword	0xaedc07be50605d74
	.xword	0xad24968eebbe52e4
	.xword	0x8cec7647207c499b
	.xword	0xcee654723d151504
	.xword	0xd7baa5e2a1b26b08
	.xword	0x8914d3a00edbf6c0
	.xword	0x002518d55f99fe32
	.xword	0x68f1e87e18f37f0c
	.xword	0x2dcf257ab9893d64
	.xword	0xea9c1889b0c8cc70
	.xword	0xac13301658eecc36
	.xword	0x5ec7cb1ad8761504
	.xword	0xa04e605a951be719
	.xword	0xb32b05e593e3b575
	.xword	0x4cf09157d78613be
	.xword	0xe572e5c39940f0a7
	.xword	0x4f78e83f7f722bcf
	.xword	0x4af5fece0eaad6bc
	.xword	0x897513457e570f03
	.xword	0xe854582c17cf800a
	.xword	0x55a7658d72e88c74
	.xword	0x48d02f44eb2bf5db
	.xword	0xaf98ac2a5e99ee2f
	.xword	0xae41baf023a6810f
	.xword	0x893e222dd4cca34f
	.xword	0xf448d40445466c99
	.xword	0xaee8cf0bf729cc18
	.xword	0xdd93c8b68572e54d
	.xword	0xcb29e53a135a7da4
	.xword	0x125daecd040ff5b3
	.xword	0x6d1d31bf497d3e10
	.xword	0x90a3e29159ea74f7
	.xword	0xb80699d5ca67ada3
	.xword	0x51a4baf8e99a7f45
	.xword	0xb488b7eb10a3bebd
	.xword	0x4a1d9702f1af0a06
	.xword	0x83ce6414ef2b8f02
	.xword	0xd26f3f9b33218f4c
	.xword	0x1677e33ae7115bd2
	.xword	0x4383dff276d88b23
	.xword	0x98ea2d9eeecb5f4a
	.xword	0xc44c7dbbbcfe4144
	.xword	0x20c5ead19fa5cbd8
	.xword	0x71edc5483f4438c0
	.xword	0xe202936f83107b95
	.xword	0xbf20b9e1c0618194
	.xword	0xd4d3f76a6036f8fe
	.xword	0x662ac9818dc1a55d
	.xword	0xf943b83a961d7c2d
	.xword	0x8b1ef0b76df22ef8
	.xword	0xcdd9afd7cda68f71
	.xword	0x5184a2ca4a58a99f
	.xword	0x1fdf88c0493eee94
	.xword	0xb87fa00dd5039670
	.xword	0x92f31d14f6c77fd9
	.xword	0x050437d14b79bbb6
	.xword	0x670340a5d9f3fbe5
	.xword	0x7dffcc1d6cf5cffb
	.xword	0x72f3c890e52e6a41
	.align 0x40000
	.data
data_start_6:

	.xword	0x31f02f1db9b2cdbc
	.xword	0x4a1cea3d61ed18be
	.xword	0xc9f18993e2a8cdc8
	.xword	0xe0b0e170f167e00f
	.xword	0x9f1a1fa5c4d3ff0e
	.xword	0xcaa29dcad2fc6304
	.xword	0x43c341f82d753218
	.xword	0x2830b70c23a1acc8
	.xword	0xfacdca58c6413485
	.xword	0x95d7e56f86602cc3
	.xword	0xb7b2bb8d0f60991e
	.xword	0xbe2dc1777ee0e92f
	.xword	0x5100625cf1fc3386
	.xword	0x215ba0ed3c495d52
	.xword	0x25508496f99b700a
	.xword	0x3c58849b0db30b6e
	.xword	0x19ceabf945b59d31
	.xword	0xa27c40a928b5cf24
	.xword	0x8af59d5452af4e64
	.xword	0x23c6bfc2fbf7eb79
	.xword	0x9372bfbc80b0cf45
	.xword	0x873ea83f76c47e78
	.xword	0x68edc7855cb664dd
	.xword	0x4e8e3c12267a76b5
	.xword	0xd4ff367e3c4615c4
	.xword	0x8d8b4e41d4a4a566
	.xword	0x2d7e3ffa80de56ce
	.xword	0xc44d4dff1dbd0ab8
	.xword	0x23643b7e5b112a1e
	.xword	0xeb0e94bde2d81bd7
	.xword	0x9b11f39815a58bea
	.xword	0x8900a62c7119200e
	.xword	0xb1080d20b715a4a7
	.xword	0x8b89d7010c70892d
	.xword	0x3d5300e960312411
	.xword	0x7cc658932607e205
	.xword	0x05acc7099754c961
	.xword	0x5c6e4fe7117b76fb
	.xword	0x8b7d3f8815917acb
	.xword	0x6ddb515d044c633d
	.xword	0x04db69413b81cdf6
	.xword	0xd553e8e51235c6d1
	.xword	0x9168014e2c9a435d
	.xword	0xe6c84e25d293e5ab
	.xword	0xec50b7bed5b84143
	.xword	0x5b4157289f262ea8
	.xword	0x0295a92db97c28e4
	.xword	0xf00ed95d4ff5fa2f
	.xword	0xd757a6feb86f4098
	.xword	0x5568e61ca8191910
	.xword	0x03ab3614701de604
	.xword	0x02c1d7b6ebb9949c
	.xword	0x4c9f3ed0047e80e6
	.xword	0xd5504408a8fc1337
	.xword	0xf50a38de0435874c
	.xword	0x8354cee00122331d
	.xword	0x6ba8f1b21345d892
	.xword	0x7de8f19149948e9f
	.xword	0xf48076cbdc01844c
	.xword	0xcb8c66cdb49297f6
	.xword	0xe02b49f1b07e0fb2
	.xword	0x98a9b1003fd30b12
	.xword	0xa9422d052ab9711f
	.xword	0xeccc43ca458b7c54
	.xword	0xc3e1f0814f202cb0
	.xword	0x38df95ca0772266a
	.xword	0x03b3563bdec568af
	.xword	0x37e0014e3745e874
	.xword	0xaffefb7a77599fb4
	.xword	0x7174c0c9f6f8ac12
	.xword	0x574112ffaeb2c951
	.xword	0x671895ec66ce513f
	.xword	0x9a36ec84e4442549
	.xword	0xc678476f8925020b
	.xword	0x6f50b248689fe3e5
	.xword	0xea9de2d440740feb
	.xword	0x1fa5b57dc0079a8e
	.xword	0x33524006a7c71e05
	.xword	0x73f3b84d5108370f
	.xword	0x1be016978b8eba29
	.xword	0x772f97a0615add70
	.xword	0x7616b27bc52806f5
	.xword	0xc20682b5331b9cb1
	.xword	0x209fabc74e4a83a2
	.xword	0x1f95d9c6dd534a12
	.xword	0xffd5b73d3eeeda84
	.xword	0xd8e2f76ad0033441
	.xword	0xbc672e88dd1b9a7a
	.xword	0x6df700ac3a8e4b17
	.xword	0x584a1684061faf79
	.xword	0x1ea1fa3f9bdde3bc
	.xword	0x81e34e1717028964
	.xword	0xa1dc186301852db0
	.xword	0xf2e85728bb3949dd
	.xword	0xe208191c92f804e5
	.xword	0xb82c8e573314284f
	.xword	0x31a759f623cb50bb
	.xword	0xdc673b3ae43324c7
	.xword	0x6da2bd158362d78a
	.xword	0x56e58ff9719160ab
	.xword	0xbef534f23226d5dc
	.xword	0xc7e25d9ae7c8d71c
	.xword	0xc8c75cf3de7ab427
	.xword	0x47c0f1167498c8a8
	.xword	0x91ce74495316574c
	.xword	0xcfbad61808a7249d
	.xword	0xc043cf2d8d22e5b5
	.xword	0x050a6391206851c2
	.xword	0xebc8a27b8c7bedc2
	.xword	0x8f7dda9fd8a3ea85
	.xword	0x3282690c64e36940
	.xword	0x3fb70c18a3bc6eed
	.xword	0x9165958383cb5813
	.xword	0x3bb3508d7ecc14d9
	.xword	0x80c31eae10eecfcf
	.xword	0xcce757cce243fbee
	.xword	0x2d3ea69627e88d0b
	.xword	0xa83c8e5a8efc1fe8
	.xword	0x14860bf9a0a898c2
	.xword	0x9daaff0a04dc098d
	.xword	0xa63828f536016eac
	.xword	0x600db03ac9db1e53
	.xword	0x9b3c638f98397d0f
	.xword	0xb60d9217f5feaad7
	.xword	0xa5ba3eb174f9d0b8
	.xword	0x3c646f8d62d7a36a
	.xword	0xc457785c8b9c4b58
	.xword	0x7b63e21f3e8c7ece
	.xword	0x8bf66713cba87dc2
	.xword	0x55e30c24f648583f
	.xword	0x9e77d387f0ce035f
	.xword	0x816279b7642db175
	.xword	0xa17c6deedc1b801f
	.xword	0xb128c0292b6d5b5e
	.xword	0x35ad2b175c755987
	.xword	0xed28bca2c287849b
	.xword	0x90af2356f77b87ca
	.xword	0x491209a65ca39f74
	.xword	0xcb72bdc0338954be
	.xword	0x736d22183e41db25
	.xword	0x68cb6d613f187090
	.xword	0x14e9b9c966e2175e
	.xword	0x37dbbe8b835999b1
	.xword	0xdba8f06fff1af4a6
	.xword	0x0c797275036407d2
	.xword	0x316a4b89adce5934
	.xword	0x6caf3c4dd4240671
	.xword	0xbf2baae32e94f182
	.xword	0x79687e2cbfe86fa3
	.xword	0xb3244734d06005b8
	.xword	0xbaffa46041375d35
	.xword	0x7e88af74c0e2a4b5
	.xword	0xee3dd854a582b070
	.xword	0xce25fc82e2d8e4f7
	.xword	0x9a8196af6587d6ad
	.xword	0x0950d50e91d33c85
	.xword	0x9e0401736da6e126
	.xword	0xea2502b5ddaf7e2d
	.xword	0x08bf2c1a00a1579f
	.xword	0x81dfe2c82711ccc7
	.xword	0x2a1b7c128fa1c300
	.xword	0x0c37c7de33164de7
	.xword	0x540f8234f0bdee22
	.xword	0x4dabf7215b5ab431
	.xword	0xf9537ee11381fd1c
	.xword	0x40adc2ecbeadd335
	.xword	0x354710be572ceaf6
	.xword	0xd5090bf86efee6b0
	.xword	0x81d720039177ac96
	.xword	0x66135473ec464ac1
	.xword	0xda0c17010a5996d1
	.xword	0x95b9b413a8bc0d7f
	.xword	0xed20c9a11332e307
	.xword	0xf2c9d7002af2c587
	.xword	0x9f64d7a6256ceebc
	.xword	0x43a1472f9aa5ebff
	.xword	0x97d58bb144e60995
	.xword	0xcbb6fb71e9fc16bf
	.xword	0x9f7f3eb74d586dc9
	.xword	0x69fa462fd1b48401
	.xword	0xcf989b0bdae8024c
	.xword	0xfe4365c54b5446ba
	.xword	0x4d1e98d0433e6f0f
	.xword	0xa51a628255253729
	.xword	0x4dd5259e838187d9
	.xword	0x4a4a7e4d5e6f319d
	.xword	0xd178c99c3540cbe4
	.xword	0x3f7846f2e09dea3e
	.xword	0x5b128db5186e3ed2
	.xword	0x4febee551e83c0ca
	.xword	0xfb3bc851fb0963d3
	.xword	0xac700ca73724d4f0
	.xword	0x2e0e5d0b056729c7
	.xword	0x12bacfdf0ecc3b10
	.xword	0x94869fd0f3b15400
	.xword	0x017d2fcbe5b7643a
	.xword	0xab4d343ddc3ed252
	.xword	0x0b3566181a641fb6
	.xword	0xe4caad333d097354
	.xword	0x7fd9e95ce89ddf4b
	.xword	0x5b36aa630d15a775
	.xword	0x88ab1d86e97b9315
	.xword	0x2bc0f48bf4e17ccd
	.xword	0x0f5b650c5f8ad074
	.xword	0x08c3754e12bd923d
	.xword	0xd4fd59013fce77d5
	.xword	0xa93fe8476dc56521
	.xword	0xfe88fec0d5ec4c6d
	.xword	0xd6fdc39f15c39d24
	.xword	0xcd764d7cb1c75fe1
	.xword	0x213f85e6777c99a7
	.xword	0x3daa36b84ce48d51
	.xword	0x6f91e67dea60859e
	.xword	0x1c3d494183afc175
	.xword	0x53e2fb994c32f9f7
	.xword	0xc2aef2b637d1f4cb
	.xword	0xcb27006f2cf68f23
	.xword	0x8aed93aad5bbaeac
	.xword	0xd5881afc3759938f
	.xword	0x11d700f839f7ccb5
	.xword	0x7a54ae1fb2bcafd1
	.xword	0xd6e41f06929d7962
	.xword	0x7e4e2f51c18142ed
	.xword	0x0d7a61dc79e6a70a
	.xword	0x44270920a164c65c
	.xword	0x87c03a05edb52e43
	.xword	0x2a6d04d36e17b94a
	.xword	0xe46d4be730ece00b
	.xword	0x8fc72b086392b724
	.xword	0x5a41c3e99d60b903
	.xword	0xbbe2c40223456e18
	.xword	0x4dfe2d7c6cf7ffe7
	.xword	0xb997e883fe151fb0
	.xword	0x6af172816050ca94
	.xword	0xf69c7f7da3a84a7c
	.xword	0xd898771f7d016ed3
	.xword	0x70a3ce53a9a9da5e
	.xword	0x49fba5954b89ad61
	.xword	0xe1a46eba617fac8d
	.xword	0xa23fb20e6fb82a42
	.xword	0x6e692be79918d51d
	.xword	0x5856e6d991cfa400
	.xword	0x0f82966b48edd47e
	.xword	0xf4e7d2ffa5e3f48f
	.xword	0x797e8e38ea6abeea
	.xword	0xf9ee2ae8162a9a43
	.xword	0xaf6a5dd60073797c
	.xword	0x63d6c0eb75deec24
	.xword	0x97e37e009cdd6047
	.xword	0xbb2fafbe7288189e
	.xword	0x8676f92f88da1d6e
	.xword	0x91377dc8068d4812
	.xword	0x4ca41f12fdeba529
	.xword	0x8d921216954d74f5
	.xword	0xa5bbbcb94b5f5bf2
	.xword	0xd47ef0e15d87ab83
	.align 0x80000
	.data
data_start_7:

	.xword	0x642f941ba46dedbe
	.xword	0xd4062aadd8181e87
	.xword	0x0a81c066dc11a3cf
	.xword	0x461f09a20d5f35f6
	.xword	0x2562c34b436c9eba
	.xword	0x2d108204cb3f5eb9
	.xword	0xfac647206ea8e69b
	.xword	0x6773d372ae2d0622
	.xword	0x44f44335c35819b3
	.xword	0xa4f1f0cd31c6f1cc
	.xword	0x729ab42d943756e1
	.xword	0x1179f5885f4ed788
	.xword	0x287491fff71cde2f
	.xword	0x8bcdc977e2526e45
	.xword	0x97e6864126e91661
	.xword	0x651fcdbf7c752d39
	.xword	0x7cb7b62f985a0bbc
	.xword	0x2602eab174e4914f
	.xword	0x6467c8c12d5b823d
	.xword	0x3badfb84d1a84fc5
	.xword	0xbc339b0828188176
	.xword	0xac2e13e45d13fa7c
	.xword	0xc8609c8ebf6f1cb1
	.xword	0x31866f11ef3ec1b1
	.xword	0x5dd07b60e1e7da0e
	.xword	0xccf2a1d45ee7c589
	.xword	0x2e3ab2c0a26fa3c4
	.xword	0x691079c32c3e43e0
	.xword	0x6bbae4f2e516dec0
	.xword	0xfb1b21d28cec3a72
	.xword	0x0f92785c900fb0da
	.xword	0x19ea67bc7ae0bd61
	.xword	0xc868202b6adca9dd
	.xword	0x76d58d336e5a16c3
	.xword	0x4d2150a244bdf827
	.xword	0x34a2ec1eab15fa7a
	.xword	0xa6ac42c3a5d21638
	.xword	0x8ffcec7d351b4c61
	.xword	0x895eeecb8bc1bfe8
	.xword	0x411b6ee3b124ef19
	.xword	0x4ac8fcc95af41c9a
	.xword	0x56ffcfc5f6e2dbbe
	.xword	0xc424c8197659943c
	.xword	0x43f9e1361b83d6ff
	.xword	0x4094f3a79aa3deed
	.xword	0x2a68eb6cdd471003
	.xword	0x14700e94708af9bb
	.xword	0x2dbc18e21cc35d0d
	.xword	0xb039de4398c5f5fe
	.xword	0xedb3be404604c86b
	.xword	0xd8ffbb3f98dc2059
	.xword	0x618d049049c2943c
	.xword	0xd7d360a90a104068
	.xword	0xed11d84f2399cd48
	.xword	0x2d53031035b82d74
	.xword	0x51adef99871c22e4
	.xword	0x2747785adfb137f0
	.xword	0xcb6a47f3aa4c5fd8
	.xword	0x513fd0387a237f33
	.xword	0x939a509475cde789
	.xword	0x8db9ca2f2e23ebda
	.xword	0x378725fc41522072
	.xword	0x37041b27ad5db24a
	.xword	0x077d92d36022fba7
	.xword	0xca3c374d48fea98e
	.xword	0x3aef7ab0ab8f7826
	.xword	0x0d3c5078a6a8c625
	.xword	0xbad0e94ca20a782e
	.xword	0x63cec3cfbc6f9e59
	.xword	0xa353ceb896ca4a43
	.xword	0x1ab99aedacc65b61
	.xword	0x7df89a4cb6998dc1
	.xword	0x6665604a048be19e
	.xword	0x9e8966973392bd24
	.xword	0x3ae84ce599f00369
	.xword	0xb03d96a4abd26807
	.xword	0xbfeb85f1aa932073
	.xword	0x23a5fbd62e1c5308
	.xword	0xc07a27ccd144ffa4
	.xword	0xa14071498296fe03
	.xword	0x19e99c331808d186
	.xword	0xe2b4e803b358383a
	.xword	0xfd25658e52dd0908
	.xword	0x5b0af4a46b765077
	.xword	0x93c0ead853b5a6d6
	.xword	0x24e54b4a787eff40
	.xword	0x5ba1608222e5b09a
	.xword	0xf3f30b70d7fb5ea0
	.xword	0xe1837c4ce591d9f2
	.xword	0x3248cd60972d25ba
	.xword	0x71b25bef271fdf33
	.xword	0xb6c627ebb0c531a8
	.xword	0xf5408e8fa4435fdb
	.xword	0xc6b940bb5429d7ec
	.xword	0xc2cc42388787cb9b
	.xword	0xe18853d0ac45eaa3
	.xword	0xcc260957135895b9
	.xword	0x53b674721655168a
	.xword	0x4ca41c267e5b394a
	.xword	0x37d9008bb0963f2e
	.xword	0x8a29c2812e92d3bd
	.xword	0x44c8c3615c4dd264
	.xword	0x58d6bf6cdd52cfc2
	.xword	0x313f3072a37b970a
	.xword	0xe39852a8755ee1e2
	.xword	0x556ab92c1b1408c7
	.xword	0x3c81a93cef981c2b
	.xword	0x5f700d3c7186a157
	.xword	0x5c4cb53756e124d5
	.xword	0x112efeecbe43fc2b
	.xword	0xd6e9203bb2dc1c1a
	.xword	0xde62005880713995
	.xword	0xbb1de4639314b6b2
	.xword	0x80a9ab3554a3d09a
	.xword	0x3ef8e28e04370c47
	.xword	0x6b85541498344765
	.xword	0xba75fa2dee5a8130
	.xword	0x4aec9308c36b73a5
	.xword	0x2a36b16f934d3b4b
	.xword	0xa4fd8106f65d2227
	.xword	0x78b49aa528c77768
	.xword	0x1e69b677f712c4b2
	.xword	0x815b7ffb9145ad60
	.xword	0x511c23d647712c6b
	.xword	0x357c43b5e74aab90
	.xword	0xd5e42026b3dda0ea
	.xword	0xfdb390270b1f15b3
	.xword	0x5dd0a729df89baf6
	.xword	0x5a243854d4e89594
	.xword	0x0dfafc2789582e6a
	.xword	0x101438eba1257ac5
	.xword	0xbfbdf185835af431
	.xword	0x40435ab19c33cc7d
	.xword	0x83fa640429d333bd
	.xword	0x52ed7ddc8b2604db
	.xword	0x3909d763aa8be67e
	.xword	0xc66414002c92470b
	.xword	0x0adb64b281dd48ae
	.xword	0xaf97a77a7b487ba1
	.xword	0x0380baaa2233a940
	.xword	0x3796655748125960
	.xword	0xc12016ae69a3d40c
	.xword	0x6245e3b1f0a3915f
	.xword	0xf1ca51ad1ea3e365
	.xword	0x28c46a64f9fe7bae
	.xword	0xd16de967d35dea13
	.xword	0xe551ef3b537a36bd
	.xword	0x603b35d44820b50c
	.xword	0x532d0bcb8cb0d9b7
	.xword	0x66d0f62c75fc1707
	.xword	0x33781bf1c71ce023
	.xword	0x4311a22d180bc3ae
	.xword	0xe6724aaeb0c765cc
	.xword	0xf09af77f59f7d067
	.xword	0x8a045569b73a69a0
	.xword	0x31f143526f655ffd
	.xword	0x8744df004ab02f6e
	.xword	0x100a25cb68911c8d
	.xword	0x15f8bb3268ab4914
	.xword	0x9ddbd70a1a214b64
	.xword	0x2372c2bde085d128
	.xword	0xe856e50b31cba604
	.xword	0xae34bcdcd6237a33
	.xword	0x9ad07e85fa28ae04
	.xword	0x58ffe387b20a12ca
	.xword	0xdc777e019e1afa5c
	.xword	0x77d21ff8d33989bd
	.xword	0xac9698816e3cff76
	.xword	0x760ff12006effa6a
	.xword	0x33ea8bd7d560a8ed
	.xword	0x695ea40398d4687c
	.xword	0x5d511a1c1223ea2a
	.xword	0xe4291866e0fa01c2
	.xword	0x42d13e04f5c7da1f
	.xword	0xdc146c35c6ea73ea
	.xword	0x8591db60c8c1cc34
	.xword	0x1f11b7d39cc5b959
	.xword	0x7a84f82541628ec3
	.xword	0x7e3122ddd88323c7
	.xword	0x81d022fd69853b3c
	.xword	0x1dbf3316f63823fd
	.xword	0xb13b58fc7295934d
	.xword	0x4bbf704331221fe3
	.xword	0xd46e4df31b51f4ff
	.xword	0x53363bf18e26bbb2
	.xword	0x2dad7931eef97451
	.xword	0xe12f0f8656169d3d
	.xword	0xd0da5b40ba15b84c
	.xword	0xacb2f27aa367358e
	.xword	0x21a6658f66d24793
	.xword	0x6c5a65f33b2c942b
	.xword	0x07800ca2006ff8fa
	.xword	0x7fa27f39cc68f934
	.xword	0x60479bac72b64143
	.xword	0x64e46a3c92a4e3ec
	.xword	0xc8f8949c57bfb7a5
	.xword	0x7926d9ac78261b93
	.xword	0x44a65eebd28ed5cd
	.xword	0x2e5dfcaac8508fd8
	.xword	0x9c3e40a417c63691
	.xword	0x116410705673a9b0
	.xword	0x4cb4240ec82947be
	.xword	0x368501d171dbb9a5
	.xword	0xe53b613c4984500c
	.xword	0x1d5ec8d1f9291def
	.xword	0xb382e9291aeb3bd9
	.xword	0x39d8f4c8d68984da
	.xword	0x19bf4fc4d6b3afdf
	.xword	0x73e8728daa80d2d9
	.xword	0x5beb170904c1dbdb
	.xword	0xac21c7377ff70872
	.xword	0x892d138d72b06154
	.xword	0x5fda00c659902988
	.xword	0xf48f2ee440e106a7
	.xword	0x6442139d92bc6b8d
	.xword	0xbe7d131f9bbae792
	.xword	0xc77a7975549fecee
	.xword	0x38d5baffa0e3ff54
	.xword	0x78915941f10456e0
	.xword	0x1d5dac12b1004756
	.xword	0x51a944f2d1cbc4be
	.xword	0x6b305c81a083cfcd
	.xword	0x8e97cf069a08826f
	.xword	0x22e0a71663564e96
	.xword	0xd6678ad52ff456cb
	.xword	0x027b5892e110775d
	.xword	0x5dfaf4986fe901f6
	.xword	0xa07b1480f3c71bd7
	.xword	0x03c95e0820d14718
	.xword	0xb136ea604a537a1e
	.xword	0x688422b89d592fc9
	.xword	0x346e95f4b71ea4a1
	.xword	0x4c2ec962674f4ece
	.xword	0xce58d6882257aecc
	.xword	0xa8cc7f1a36da2005
	.xword	0xd6f615ebfc11abac
	.xword	0xf33125b93d7d3f5e
	.xword	0x025383f6a4bd4083
	.xword	0x8bdbd9beb36991f0
	.xword	0x4449f741dc020c83
	.xword	0xce36c145a53ae665
	.xword	0xe1fa6f9a05d61edd
	.xword	0x059786f184effa80
	.xword	0x814f44b2dbd74140
	.xword	0x54dd998491ee62f5
	.xword	0x4f81f517d63cf8e1
	.xword	0xb8949c2b9d60966b
	.xword	0x403f484ee0b32ba9
	.xword	0xb70b7152832f6f74
	.xword	0xed24ae300144db85
	.xword	0x6cb5be0a6b864f79
	.xword	0x5cf9e4ae13b047cf
	.xword	0xc73af1c831f255b2
	.xword	0xcfd20fc96102cbe2
	.xword	0x52e942aa0fecae3e
	.xword	0x84f240540ce76da6



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
