// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_29.s
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
   random seed:	10998575
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

	setx 0x41496e0188afe61a, %g1, %g0
	setx 0xd70f69ff35de059c, %g1, %g1
	setx 0xc1d54192f8d240c0, %g1, %g2
	setx 0x277a8f097ce9b0f7, %g1, %g3
	setx 0x4ece134164b9e511, %g1, %g4
	setx 0x9be55761d356d3fe, %g1, %g5
	setx 0xf75b411db2b7778e, %g1, %g6
	setx 0x60e11af0457703df, %g1, %g7
	setx 0x48443b5355841bd1, %g1, %r16
	setx 0xb138eb7c7536863c, %g1, %r17
	setx 0x986a1be4dc7e2aa8, %g1, %r18
	setx 0x8cd87529a9d0a807, %g1, %r19
	setx 0x7ea439e9c8035006, %g1, %r20
	setx 0xb16011631ae09833, %g1, %r21
	setx 0xa375fe6370c8d8ef, %g1, %r22
	setx 0x088006d04ecb7b96, %g1, %r23
	setx 0x22bc65de804812e6, %g1, %r24
	setx 0x879abe2be614d698, %g1, %r25
	setx 0xec6a3ea9e93948a0, %g1, %r26
	setx 0xa0bd1f95e1713c8d, %g1, %r27
	setx 0x7a9eb87eb0aba136, %g1, %r28
	setx 0x96d4829ca7cdc7a3, %g1, %r29
	setx 0x8ecac7b933d27a02, %g1, %r30
	setx 0xde5dfefc973bd6a1, %g1, %r31
	save
	setx 0xf796d0ad890689ef, %g1, %r16
	setx 0xd2aee8d26edda871, %g1, %r17
	setx 0x8bbbc250f0f004a3, %g1, %r18
	setx 0xfcad7aa95a18a00c, %g1, %r19
	setx 0xab915af4e602103c, %g1, %r20
	setx 0x555ef7a36051e4b4, %g1, %r21
	setx 0x4c67bda354e56049, %g1, %r22
	setx 0x324df63f02112eb1, %g1, %r23
	setx 0x211d6204aa3001f2, %g1, %r24
	setx 0x6f1a3758c245951b, %g1, %r25
	setx 0x9a4031624d8d95e9, %g1, %r26
	setx 0x287504c6b9e01f4b, %g1, %r27
	setx 0x32ad28b68dc18580, %g1, %r28
	setx 0xc59ac9c4738d6067, %g1, %r29
	setx 0x024ce6df827eb4b3, %g1, %r30
	setx 0xceef24260e79c790, %g1, %r31
	save
	setx 0x4945d7f0d72788ea, %g1, %r16
	setx 0x245164d8b0c3d8de, %g1, %r17
	setx 0x40e676b0dc5c9b9b, %g1, %r18
	setx 0xf12b5e3a5a62e9a5, %g1, %r19
	setx 0x2ae0ed75147bf7a2, %g1, %r20
	setx 0x865e5c31e7205647, %g1, %r21
	setx 0x7de1d48961f9f157, %g1, %r22
	setx 0x202b5bda35b04c82, %g1, %r23
	setx 0xf7f043a9283e861d, %g1, %r24
	setx 0xc0c279e8feff84d2, %g1, %r25
	setx 0x78cbed4c5efe796b, %g1, %r26
	setx 0x4999664fff203b12, %g1, %r27
	setx 0xa6541b917d500604, %g1, %r28
	setx 0x64c8d7e3c0ec57fe, %g1, %r29
	setx 0x4ecdc025c9d3b6f1, %g1, %r30
	setx 0xa1970895884e4206, %g1, %r31
	save
	setx 0xe15e16234c326f3d, %g1, %r16
	setx 0x864174915ae21546, %g1, %r17
	setx 0x6ecb6c7adf42a25c, %g1, %r18
	setx 0xce174dbe718a9d3f, %g1, %r19
	setx 0x88f4d862d067e62e, %g1, %r20
	setx 0x0b7f9bedccd5a97f, %g1, %r21
	setx 0xeaf688d797ca5db0, %g1, %r22
	setx 0x9df34e81c7747c6c, %g1, %r23
	setx 0x36b2687fd9e58102, %g1, %r24
	setx 0xf33052f7f9d42ed1, %g1, %r25
	setx 0x23a73b4c918e77b9, %g1, %r26
	setx 0xe8bb182a96682dc0, %g1, %r27
	setx 0x1767393f944356bd, %g1, %r28
	setx 0x93d938c0fc15a123, %g1, %r29
	setx 0xdae89cba540af4b8, %g1, %r30
	setx 0xa20f47f6ad20b54f, %g1, %r31
	save
	setx 0x8cd0e9eb0016000f, %g1, %r16
	setx 0xab1e218549c7a601, %g1, %r17
	setx 0x4c513cfb5fbf4fef, %g1, %r18
	setx 0xece703da67b4ba40, %g1, %r19
	setx 0x2c3b76403815b52e, %g1, %r20
	setx 0x04e7d23a0450f6ca, %g1, %r21
	setx 0x961e0e59d92a22e4, %g1, %r22
	setx 0xbecfc0abff42d344, %g1, %r23
	setx 0x6402a65707d474d5, %g1, %r24
	setx 0x8fc6de4112f5c71d, %g1, %r25
	setx 0xc53f211f100ee045, %g1, %r26
	setx 0x1f0c3e281ae873b5, %g1, %r27
	setx 0xe0ffa0d03af70ad9, %g1, %r28
	setx 0x38feff9dccff1d5f, %g1, %r29
	setx 0x697a8910306aabf5, %g1, %r30
	setx 0xdb945cf9254a1513, %g1, %r31
	save
	setx 0xb0e554a93248f5d8, %g1, %r16
	setx 0x01edebd1ea435e07, %g1, %r17
	setx 0x3979f6b9af60e67e, %g1, %r18
	setx 0x569d04fa291ac56f, %g1, %r19
	setx 0x2598f79660d8a430, %g1, %r20
	setx 0x0775be53e104f51a, %g1, %r21
	setx 0xb607816ec4e8a007, %g1, %r22
	setx 0xc7f629bc414a7fdb, %g1, %r23
	setx 0x11eba358358111e1, %g1, %r24
	setx 0x19c8d3178e690e6c, %g1, %r25
	setx 0xae070ab015f33667, %g1, %r26
	setx 0x82868ad3ff9751ba, %g1, %r27
	setx 0xa12921d583dcfdcc, %g1, %r28
	setx 0x57648d5e0305a9d4, %g1, %r29
	setx 0x9dd942e280d06d4b, %g1, %r30
	setx 0xe61fbf03cc9d8ce1, %g1, %r31
	save
	setx 0xe9a84fa2b86fcdd0, %g1, %r16
	setx 0xae5d5f4354564493, %g1, %r17
	setx 0x7e7db96a690fe82f, %g1, %r18
	setx 0x83d9f41b066e6f4b, %g1, %r19
	setx 0xe928282b9e8ecd0d, %g1, %r20
	setx 0x88c11ae5eff8370a, %g1, %r21
	setx 0xfa36d661fcad9464, %g1, %r22
	setx 0xbbd594e924fb0771, %g1, %r23
	setx 0x6418527acebc140d, %g1, %r24
	setx 0xba276671d8bf8c3b, %g1, %r25
	setx 0x653b91b897a02125, %g1, %r26
	setx 0xfe3a05d7c9e32c4d, %g1, %r27
	setx 0x153bdf9ec8ce5d71, %g1, %r28
	setx 0x5a9bf64dfa67c118, %g1, %r29
	setx 0x8e909e5565c6dc32, %g1, %r30
	setx 0xbeb14e873dd94be5, %g1, %r31
	save
	setx 0x65fb844c05c55c89, %g1, %r16
	setx 0xcae28f03dc4f75df, %g1, %r17
	setx 0x299fcabc01e421e9, %g1, %r18
	setx 0x8e826604c63a1aa8, %g1, %r19
	setx 0x57ae32189eca568d, %g1, %r20
	setx 0xdcfef1fba404bb17, %g1, %r21
	setx 0xdfb92e1c4556234d, %g1, %r22
	setx 0xa429a30af30ad8bd, %g1, %r23
	setx 0x0d12893b6459e125, %g1, %r24
	setx 0xed2f0b8939f0e0bb, %g1, %r25
	setx 0xab1dc2eed8e20d2d, %g1, %r26
	setx 0xa62cbd181cd70c60, %g1, %r27
	setx 0x4de7d4dce9dd10eb, %g1, %r28
	setx 0x4ac5f3788d6838df, %g1, %r29
	setx 0xe86e9c6a4498410e, %g1, %r30
	setx 0xe5c38c3beae1829b, %g1, %r31
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
	.word 0xb7e56133  ! 1: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x89942168  ! 3: WRPR_TICK_I	wrpr	%r16, 0x0168, %tick
	.word 0xbf480000  ! 4: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbcb58000  ! 9: ORNcc_R	orncc 	%r22, %r0, %r30
	setx	0xe9cb25f900002959, %g1, %r10
	.word 0x839a8000  ! 14: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5614f  ! 15: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbe9460af  ! 16: ORcc_I	orcc 	%r17, 0x00af, %r31
	.word 0xbbe5a0e9  ! 18: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb50c000  ! 19: RDPR_TT	<illegal instruction>
	.word 0xbde5214e  ! 20: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e5e03c  ! 21: SAVE_I	save	%r23, 0x0001, %r26
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0ba  ! 25: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4e1cd  ! 26: SAVE_I	save	%r19, 0x0001, %r24
	mov	0, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde56158  ! 29: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4600a  ! 32: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e46146  ! 33: SAVE_I	save	%r17, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_3, %g1, %r16
	.word 0xbd500000  ! 41: RDPR_TPC	<illegal instruction>
	.word 0xb5e420e3  ! 43: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4a02b  ! 46: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbea4c000  ! 48: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xb1e420fd  ! 52: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe56159  ! 53: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 59: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e42170  ! 63: SAVE_I	save	%r16, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde5e17e  ! 67: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5e06a  ! 69: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe4e199  ! 73: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb4ad21fe  ! 76: ANDNcc_I	andncc 	%r20, 0x01fe, %r26
	.word 0xbde4a0b7  ! 78: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8195a1ad  ! 83: WRPR_TPC_I	wrpr	%r22, 0x01ad, %tpc
	.word 0xb7e4600c  ! 85: SAVE_I	save	%r17, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 87: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e5e13b  ! 93: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x1debc2860000c89f, %g1, %r10
	.word 0x819a8000  ! 95: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8994e1ab  ! 96: WRPR_TICK_I	wrpr	%r19, 0x01ab, %tick
	.word 0x8594a105  ! 101: WRPR_TSTATE_I	wrpr	%r18, 0x0105, %tstate
	.word 0xbde4a1ed  ! 104: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb540000  ! 107: RDPR_GL	<illegal instruction>
	.word 0xb1e56078  ! 108: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e520cb  ! 109: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d94e18b  ! 110: WRPR_PSTATE_I	wrpr	%r19, 0x018b, %pstate
	mov	0, %r12
	.word 0xa1930000  ! 119: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994e118  ! 121: WRPR_TICK_I	wrpr	%r19, 0x0118, %tick
	.word 0x91952075  ! 125: WRPR_PIL_I	wrpr	%r20, 0x0075, %pil
	.word 0xb5e4e10c  ! 127: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a08e  ! 132: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde52185  ! 133: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb40dc000  ! 136: AND_R	and 	%r23, %r0, %r26
	.word 0xb3e5a04f  ! 137: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e561f9  ! 143: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x879421c0  ! 145: WRPR_TT_I	wrpr	%r16, 0x01c0, %tt
	mov	0, %r12
	.word 0xa1930000  ! 147: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e5a0b2  ! 151: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_7, %g1, %r16
	.word 0xb0bd0000  ! 157: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xb3e4e02c  ! 160: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4212f  ! 161: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e56027  ! 162: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde4603c  ! 163: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde42009  ! 166: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8195a19c  ! 167: WRPR_TPC_I	wrpr	%r22, 0x019c, %tpc
	.word 0xb3500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0xbde42044  ! 171: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e420a9  ! 177: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4603c  ! 180: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe42040  ! 181: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e42172  ! 182: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9510000  ! 183: RDPR_TICK	<illegal instruction>
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0e3  ! 188: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4a0c1  ! 189: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x3a0a01320000ccc2, %g1, %r10
	.word 0x819a8000  ! 190: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9e52086  ! 200: SAVE_I	save	%r20, 0x0001, %r28
	mov	2, %r12
	.word 0xa1930000  ! 201: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb51c000  ! 204: RDPR_TL	<illegal instruction>
	.word 0xb1e4a083  ! 205: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbcb56050  ! 206: SUBCcc_I	orncc 	%r21, 0x0050, %r30
	.word 0xbde5a19a  ! 207: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46143  ! 220: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe420e7  ! 222: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a016  ! 234: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5207d  ! 240: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbc35a1fe  ! 243: SUBC_I	orn 	%r22, 0x01fe, %r30
	.word 0x879460f2  ! 246: WRPR_TT_I	wrpr	%r17, 0x00f2, %tt
	.word 0xb7500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0xb1518000  ! 248: RDPR_PSTATE	<illegal instruction>
	.word 0x8395a155  ! 252: WRPR_TNPC_I	wrpr	%r22, 0x0155, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 253: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde5600d  ! 254: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4a0c2  ! 260: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe52182  ! 262: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5a1c3  ! 263: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a114  ! 266: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4206f  ! 268: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb950c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xb8b4e010  ! 270: SUBCcc_I	orncc 	%r19, 0x0010, %r28
	.word 0xb3e4a012  ! 277: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8795e124  ! 279: WRPR_TT_I	wrpr	%r23, 0x0124, %tt
	mov	2, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe461a3  ! 287: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf51c000  ! 288: RDPR_TL	<illegal instruction>
	setx	0x998ce4bd00003e98, %g1, %r10
	.word 0x819a8000  ! 289: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe46019  ! 290: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8195a0ef  ! 291: WRPR_TPC_I	wrpr	%r22, 0x00ef, %tpc
	.word 0x9194206d  ! 293: WRPR_PIL_I	wrpr	%r16, 0x006d, %pil
	.word 0xbbe4e1ae  ! 295: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5608e  ! 298: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e42194  ! 299: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xba842067  ! 303: ADDcc_I	addcc 	%r16, 0x0067, %r29
	.word 0xb9e421ed  ! 305: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461d2  ! 309: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e0ab  ! 310: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4210f  ! 316: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x839521b7  ! 318: WRPR_TNPC_I	wrpr	%r20, 0x01b7, %tnpc
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a170  ! 324: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbab4c000  ! 326: SUBCcc_R	orncc 	%r19, %r0, %r29
	.word 0xb9e4a0e6  ! 327: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e420d7  ! 330: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 337: RDPR_TT	<illegal instruction>
	.word 0xbbe4a13f  ! 338: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe52153  ! 339: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e52197  ! 341: SAVE_I	save	%r20, 0x0001, %r26
	setx	data_start_7, %g1, %r18
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba344000  ! 348: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xbbe5a02e  ! 354: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5e06a  ! 357: SAVE_I	save	%r23, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 359: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xbbe5e078  ! 362: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbeaca0f3  ! 363: ANDNcc_I	andncc 	%r18, 0x00f3, %r31
	setx	data_start_7, %g1, %r19
	.word 0xbde5a08b  ! 368: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4a043  ! 370: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 372: RDPR_TNPC	<illegal instruction>
	setx	data_start_7, %g1, %r23
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e094  ! 378: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe52013  ! 379: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	setx	0x20f2c8080000bccd, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb6c5c000  ! 383: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xb2b461e3  ! 386: ORNcc_I	orncc 	%r17, 0x01e3, %r25
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a1cc  ! 390: WRPR_PSTATE_I	wrpr	%r18, 0x01cc, %pstate
	.word 0xb7e4a095  ! 394: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0x8d952147  ! 399: WRPR_PSTATE_I	wrpr	%r20, 0x0147, %pstate
	.word 0xbde5e1ad  ! 401: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4e17d  ! 409: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe46054  ! 415: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbf518000  ! 419: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e42061  ! 426: SAVE_I	save	%r16, 0x0001, %r26
	setx	0xdc239f3e00001e00, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde46009  ! 428: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8794e07f  ! 430: WRPR_TT_I	wrpr	%r19, 0x007f, %tt
	.word 0xb1e4a178  ! 431: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe5611b  ! 439: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x9195607b  ! 442: WRPR_PIL_I	wrpr	%r21, 0x007b, %pil
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94e1ef  ! 448: WRPR_PSTATE_I	wrpr	%r19, 0x01ef, %pstate
	.word 0xbb500000  ! 449: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xb3508000  ! 456: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e42100  ! 457: SAVE_I	save	%r16, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 459: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46175  ! 463: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5a0c3  ! 464: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe42027  ! 466: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5600a  ! 468: SAVE_I	save	%r21, 0x0001, %r30
	setx	data_start_5, %g1, %r21
	.word 0xb495e1a3  ! 472: ORcc_I	orcc 	%r23, 0x01a3, %r26
	.word 0xba1da172  ! 474: XOR_I	xor 	%r22, 0x0172, %r29
	.word 0xb751c000  ! 475: RDPR_TL	<illegal instruction>
	.word 0xb3e46054  ! 476: SAVE_I	save	%r17, 0x0001, %r25
	mov	1, %r12
	.word 0xa1930000  ! 482: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1480000  ! 484: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb42de1f9  ! 485: ANDN_I	andn 	%r23, 0x01f9, %r26
	mov	2, %r12
	.word 0xa1930000  ! 486: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e520e4  ! 488: SAVE_I	save	%r20, 0x0001, %r27
	setx	0xdcd0926b00008c4a, %g1, %r10
	.word 0x819a8000  ! 491: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e05d  ! 496: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde52158  ! 497: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf50c000  ! 499: RDPR_TT	<illegal instruction>
	.word 0xb08d6075  ! 501: ANDcc_I	andcc 	%r21, 0x0075, %r24
	.word 0xb9e4e0bf  ! 506: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8594216a  ! 507: WRPR_TSTATE_I	wrpr	%r16, 0x016a, %tstate
	.word 0xb5e461aa  ! 511: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e147  ! 518: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf518000  ! 521: RDPR_PSTATE	<illegal instruction>
	.word 0xb5500000  ! 522: RDPR_TPC	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xb3520000  ! 528: RDPR_PIL	<illegal instruction>
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a152  ! 533: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3518000  ! 534: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4e023  ! 536: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb69cc000  ! 537: XORcc_R	xorcc 	%r19, %r0, %r27
	.word 0x85946019  ! 539: WRPR_TSTATE_I	wrpr	%r17, 0x0019, %tstate
	.word 0xbd51c000  ! 540: RDPR_TL	<illegal instruction>
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a072  ! 548: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5510000  ! 549: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 551: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 552: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4e04f  ! 554: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_5, %g1, %r16
	.word 0x839460f9  ! 560: WRPR_TNPC_I	wrpr	%r17, 0x00f9, %tnpc
	.word 0xbfe5e184  ! 570: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4e020  ! 571: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e420ff  ! 572: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4218b  ! 574: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a07a  ! 577: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb6b5e1ac  ! 578: SUBCcc_I	orncc 	%r23, 0x01ac, %r27
	.word 0xbde4a013  ! 580: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4612f  ! 581: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5e13c  ! 582: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5606b  ! 583: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7518000  ! 585: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5a15c  ! 590: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x87956191  ! 591: WRPR_TT_I	wrpr	%r21, 0x0191, %tt
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 599: RDPR_PIL	<illegal instruction>
	.word 0xbd500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xbbe520dc  ! 603: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e006  ! 604: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e5a0b3  ! 608: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e176  ! 609: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e521ff  ! 612: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e5e0f5  ! 613: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbe1d619f  ! 614: XOR_I	xor 	%r21, 0x019f, %r31
	.word 0xbab4e15b  ! 617: SUBCcc_I	orncc 	%r19, 0x015b, %r29
	.word 0xbde520bb  ! 618: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb5510000  ! 620: RDPR_TICK	<illegal instruction>
	.word 0xbfe4a102  ! 621: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e421c0  ! 627: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb535e001  ! 634: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0x8d94e172  ! 635: WRPR_PSTATE_I	wrpr	%r19, 0x0172, %pstate
	setx	0x3f22384900003bde, %g1, %r10
	.word 0x819a8000  ! 636: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0xbbe42131  ! 642: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8395a1bd  ! 643: WRPR_TNPC_I	wrpr	%r22, 0x01bd, %tnpc
	.word 0xbaad60e3  ! 644: ANDNcc_I	andncc 	%r21, 0x00e3, %r29
	.word 0xb1e56167  ! 646: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe5e030  ! 649: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4a012  ! 650: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d94e15b  ! 651: WRPR_PSTATE_I	wrpr	%r19, 0x015b, %pstate
	.word 0xbbe5e1db  ! 652: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e520a9  ! 655: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e0fc  ! 659: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8194e17c  ! 662: WRPR_TPC_I	wrpr	%r19, 0x017c, %tpc
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0xb4340000  ! 671: ORN_R	orn 	%r16, %r0, %r26
	.word 0xb5508000  ! 674: RDPR_TSTATE	<illegal instruction>
	.word 0x91952054  ! 676: WRPR_PIL_I	wrpr	%r20, 0x0054, %pil
	.word 0xb3e5617f  ! 677: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8952177  ! 679: ORcc_I	orcc 	%r20, 0x0177, %r28
	.word 0xb9e561b0  ! 680: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb951c000  ! 682: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x410889a10000eb53, %g1, %r10
	.word 0x839a8000  ! 690: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe460a9  ! 691: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e4a1d4  ! 693: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1518000  ! 695: RDPR_PSTATE	<illegal instruction>
	.word 0xb350c000  ! 696: RDPR_TT	<illegal instruction>
	.word 0x8d95a1a8  ! 705: WRPR_PSTATE_I	wrpr	%r22, 0x01a8, %pstate
	.word 0xb9e42181  ! 707: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5e192  ! 709: SAVE_I	save	%r23, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 710: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb518000  ! 713: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4e020  ! 714: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e1fa  ! 715: SAVE_I	save	%r23, 0x0001, %r31
	setx	0xe28e441c00007951, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe421af  ! 720: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe3521a8  ! 721: ORN_I	orn 	%r20, 0x01a8, %r31
	.word 0xb0154000  ! 723: OR_R	or 	%r21, %r0, %r24
	.word 0xbde461cf  ! 727: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb835601f  ! 730: SUBC_I	orn 	%r21, 0x001f, %r28
	.word 0xb7500000  ! 733: RDPR_TPC	<illegal instruction>
	setx	0x74e2336b00008c9d, %g1, %r10
	.word 0x839a8000  ! 739: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e46022  ! 740: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb151c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x91946076  ! 743: WRPR_PIL_I	wrpr	%r17, 0x0076, %pil
	.word 0xb9e560ff  ! 745: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe46046  ! 747: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4216d  ! 748: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	setx	0x379a4b180000ff0b, %g1, %r10
	.word 0x839a8000  ! 753: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8794e027  ! 756: WRPR_TT_I	wrpr	%r19, 0x0027, %tt
	.word 0xb0bd4000  ! 758: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xb5e460be  ! 759: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbe1d8000  ! 760: XOR_R	xor 	%r22, %r0, %r31
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01da0bb  ! 770: XOR_I	xor 	%r22, 0x00bb, %r24
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42027  ! 776: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4a1e0  ! 779: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5a1e4  ! 781: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e460fe  ! 784: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e420ab  ! 790: SAVE_I	save	%r16, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 792: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9355000  ! 796: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xb3e561df  ! 797: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x85942187  ! 802: WRPR_TSTATE_I	wrpr	%r16, 0x0187, %tstate
	.word 0xb3e5e055  ! 803: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x879460df  ! 804: WRPR_TT_I	wrpr	%r17, 0x00df, %tt
	mov	1, %r12
	.word 0x8f930000  ! 807: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e4a071  ! 808: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8795e151  ! 810: WRPR_TT_I	wrpr	%r23, 0x0151, %tt
	.word 0xbfe5a196  ! 815: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e56065  ! 816: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbb3c4000  ! 817: SRA_R	sra 	%r17, %r0, %r29
	.word 0x91952146  ! 819: WRPR_PIL_I	wrpr	%r20, 0x0146, %pil
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4840000  ! 825: ADDcc_R	addcc 	%r16, %r0, %r26
	.word 0x9194e13b  ! 827: WRPR_PIL_I	wrpr	%r19, 0x013b, %pil
	.word 0xb00d8000  ! 829: AND_R	and 	%r22, %r0, %r24
	.word 0xb5508000  ! 830: RDPR_TSTATE	<illegal instruction>
	.word 0xbb3d9000  ! 831: SRAX_R	srax	%r22, %r0, %r29
	.word 0xbde561e3  ! 832: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe42179  ! 837: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbaacc000  ! 839: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xb02c0000  ! 842: ANDN_R	andn 	%r16, %r0, %r24
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560a5  ! 846: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5e10f  ! 847: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xba840000  ! 852: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	data_start_1, %g1, %r16
	.word 0xb29ce0f2  ! 857: XORcc_I	xorcc 	%r19, 0x00f2, %r25
	.word 0xb7e460f7  ! 859: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d94a160  ! 862: WRPR_PSTATE_I	wrpr	%r18, 0x0160, %pstate
	.word 0xbde52040  ! 863: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e561b6  ! 865: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e42018  ! 866: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb425603b  ! 868: SUB_I	sub 	%r21, 0x003b, %r26
	.word 0xb1e56191  ! 871: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5a0ef  ! 875: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x89942182  ! 876: WRPR_TICK_I	wrpr	%r16, 0x0182, %tick
	.word 0xbfe5e14c  ! 878: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7540000  ! 879: RDPR_GL	<illegal instruction>
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e129  ! 887: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4a1c8  ! 890: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e18f  ! 892: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4217d  ! 894: SAVE_I	save	%r16, 0x0001, %r29
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 901: RDPR_GL	<illegal instruction>
	.word 0xb1e461aa  ! 902: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xb9e42079  ! 905: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e56144  ! 906: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbf50c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x91942033  ! 912: WRPR_PIL_I	wrpr	%r16, 0x0033, %pil
	.word 0xb0042019  ! 915: ADD_I	add 	%r16, 0x0019, %r24
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b40000  ! 922: SUBCcc_R	orncc 	%r16, %r0, %r26
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e420b2  ! 929: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x5d67f6c800002e42, %g1, %r10
	.word 0x839a8000  ! 930: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394e1a6  ! 932: WRPR_TNPC_I	wrpr	%r19, 0x01a6, %tnpc
	.word 0xb5e56111  ! 936: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e029  ! 939: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde460c6  ! 940: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a087  ! 948: SAVE_I	save	%r22, 0x0001, %r25
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	setx	0x9bb4774c00000a50, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1ac  ! 959: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5609d  ! 969: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e52196  ! 972: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0x8594e18d  ! 985: WRPR_TSTATE_I	wrpr	%r19, 0x018d, %tstate
	.word 0xbde5a1f4  ! 986: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbf3de001  ! 987: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xb1e521da  ! 989: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5a1c0  ! 990: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e420a3  ! 994: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb550c000  ! 995: RDPR_TT	<illegal instruction>
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
	.word 0x89946088  ! 3: WRPR_TICK_I	wrpr	%r17, 0x0088, %tick
	.word 0xbb480000  ! 4: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf8258000  ! 7: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xbcb4c000  ! 9: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xf82c8000  ! 10: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf874e199  ! 11: STX_I	stx	%r28, [%r19 + 0x0199]
	.word 0xfe3d4000  ! 13: STD_R	std	%r31, [%r21 + %r0]
	setx	0xb7eda0810000fc85, %g1, %r10
	.word 0x839a8000  ! 14: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb694e05e  ! 16: ORcc_I	orcc 	%r19, 0x005e, %r27
	.word 0xbd50c000  ! 19: RDPR_TT	rdpr	%tt, %r30
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf83d0000  ! 31: STD_R	std	%r28, [%r20 + %r0]
	.word 0xfa758000  ! 34: STX_R	stx	%r29, [%r22 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf22dc000  ! 36: STB_R	stb	%r25, [%r23 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xb1500000  ! 41: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfc2d4000  ! 44: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xb2a40000  ! 48: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xf82420ea  ! 54: STW_I	stw	%r28, [%r16 + 0x00ea]
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 59: RDPR_TSTATE	<illegal instruction>
	.word 0xf6346083  ! 61: STH_I	sth	%r27, [%r17 + 0x0083]
	.word 0xfa35a1ff  ! 62: STH_I	sth	%r29, [%r22 + 0x01ff]
	.word 0xf6342140  ! 64: STH_I	sth	%r27, [%r16 + 0x0140]
	.word 0xf42ce0ef  ! 65: STB_I	stb	%r26, [%r19 + 0x00ef]
	mov	2, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc3ce04b  ! 70: STD_I	std	%r30, [%r19 + 0x004b]
	.word 0xf43ce195  ! 71: STD_I	std	%r26, [%r19 + 0x0195]
	.word 0xb4ace192  ! 76: ANDNcc_I	andncc 	%r19, 0x0192, %r26
	.word 0xfd3c8000  ! 80: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf475a038  ! 81: STX_I	stx	%r26, [%r22 + 0x0038]
	.word 0x81956027  ! 83: WRPR_TPC_I	wrpr	%r21, 0x0027, %tpc
	mov	1, %r12
	.word 0x8f930000  ! 87: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe2de06d  ! 88: STB_I	stb	%r31, [%r23 + 0x006d]
	.word 0xf024e081  ! 89: STW_I	stw	%r24, [%r19 + 0x0081]
	.word 0xfc2d8000  ! 90: STB_R	stb	%r30, [%r22 + %r0]
	setx	0x3156b16000069d3, %g1, %r10
	.word 0x819a8000  ! 95: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995e168  ! 96: WRPR_TICK_I	wrpr	%r23, 0x0168, %tick
	.word 0x8595e0c3  ! 101: WRPR_TSTATE_I	wrpr	%r23, 0x00c3, %tstate
	.word 0xfe2c8000  ! 103: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf224601f  ! 105: STW_I	stw	%r25, [%r17 + 0x001f]
	.word 0xb5540000  ! 107: RDPR_GL	rdpr	%-, %r26
	.word 0x8d9461ec  ! 110: WRPR_PSTATE_I	wrpr	%r17, 0x01ec, %pstate
	.word 0xf225a071  ! 111: STW_I	stw	%r25, [%r22 + 0x0071]
	.word 0xf224a084  ! 114: STW_I	stw	%r25, [%r18 + 0x0084]
	mov	1, %r12
	.word 0xa1930000  ! 119: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6258000  ! 120: STW_R	stw	%r27, [%r22 + %r0]
	.word 0x8994e00c  ! 121: WRPR_TICK_I	wrpr	%r19, 0x000c, %tick
	.word 0xf6350000  ! 124: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x919561ee  ! 125: WRPR_PIL_I	wrpr	%r21, 0x01ee, %pil
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 130: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfa3de129  ! 134: STD_I	std	%r29, [%r23 + 0x0129]
	.word 0xb40cc000  ! 136: AND_R	and 	%r19, %r0, %r26
	.word 0xf674202c  ! 140: STX_I	stx	%r27, [%r16 + 0x002c]
	.word 0xf02c61fe  ! 142: STB_I	stb	%r24, [%r17 + 0x01fe]
	.word 0xfb3dc000  ! 144: STDF_R	std	%f29, [%r0, %r23]
	.word 0x879561b2  ! 145: WRPR_TT_I	wrpr	%r21, 0x01b2, %tt
	mov	1, %r12
	.word 0xa1930000  ! 147: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf62c0000  ! 149: STB_R	stb	%r27, [%r16 + %r0]
	setx	data_start_0, %g1, %r19
	.word 0xfa35a01c  ! 156: STH_I	sth	%r29, [%r22 + 0x001c]
	.word 0xbcbd0000  ! 157: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xf23ca181  ! 164: STD_I	std	%r25, [%r18 + 0x0181]
	.word 0x8194612c  ! 167: WRPR_TPC_I	wrpr	%r17, 0x012c, %tpc
	.word 0xb1500000  ! 168: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfe2d21c1  ! 172: STB_I	stb	%r31, [%r20 + 0x01c1]
	.word 0xfe754000  ! 175: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xb5510000  ! 183: RDPR_TICK	<illegal instruction>
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53de080  ! 186: STDF_I	std	%f26, [0x0080, %r23]
	setx	0xcd2004cb0000088f, %g1, %r10
	.word 0x819a8000  ! 190: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf425a134  ! 199: STW_I	stw	%r26, [%r22 + 0x0134]
	mov	1, %r12
	.word 0xa1930000  ! 201: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc354000  ! 203: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb951c000  ! 204: RDPR_TL	rdpr	%tl, %r28
	.word 0xb6b461d4  ! 206: SUBCcc_I	orncc 	%r17, 0x01d4, %r27
	.word 0xf6744000  ! 210: STX_R	stx	%r27, [%r17 + %r0]
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3521e6  ! 213: STH_I	sth	%r29, [%r20 + 0x01e6]
	.word 0xf13d20a9  ! 215: STDF_I	std	%f24, [0x00a9, %r20]
	.word 0xf22c4000  ! 218: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xff3cc000  ! 223: STDF_R	std	%f31, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82c4000  ! 227: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfe258000  ! 229: STW_R	stw	%r31, [%r22 + %r0]
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83c2093  ! 237: STD_I	std	%r28, [%r16 + 0x0093]
	.word 0xf82d0000  ! 239: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb2356095  ! 243: SUBC_I	orn 	%r21, 0x0095, %r25
	.word 0x8794a18c  ! 246: WRPR_TT_I	wrpr	%r18, 0x018c, %tt
	.word 0xb9500000  ! 247: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xbd518000  ! 248: RDPR_PSTATE	<illegal instruction>
	.word 0xf03d2017  ! 249: STD_I	std	%r24, [%r20 + 0x0017]
	.word 0x83952056  ! 252: WRPR_TNPC_I	wrpr	%r20, 0x0056, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 253: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc74c000  ! 257: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf33d60df  ! 261: STDF_I	std	%f25, [0x00df, %r21]
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 269: RDPR_TT	rdpr	%tt, %r27
	.word 0xb6b4e056  ! 270: SUBCcc_I	orncc 	%r19, 0x0056, %r27
	.word 0xf22de05b  ! 273: STB_I	stb	%r25, [%r23 + 0x005b]
	.word 0x879420dc  ! 279: WRPR_TT_I	wrpr	%r16, 0x00dc, %tt
	.word 0xfc2cc000  ! 280: STB_R	stb	%r30, [%r19 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf635e049  ! 284: STH_I	sth	%r27, [%r23 + 0x0049]
	.word 0xf82d0000  ! 285: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xbb51c000  ! 288: RDPR_TL	rdpr	%tl, %r29
	setx	0xba63bbdb0000db0c, %g1, %r10
	.word 0x819a8000  ! 289: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195a15b  ! 291: WRPR_TPC_I	wrpr	%r22, 0x015b, %tpc
	.word 0x9195a1d3  ! 293: WRPR_PIL_I	wrpr	%r22, 0x01d3, %pil
	.word 0xfc2c61c2  ! 297: STB_I	stb	%r30, [%r17 + 0x01c2]
	.word 0xb48520e5  ! 303: ADDcc_I	addcc 	%r20, 0x00e5, %r26
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e0c4  ! 312: STH_I	sth	%r31, [%r19 + 0x00c4]
	.word 0x839560bb  ! 318: WRPR_TNPC_I	wrpr	%r21, 0x00bb, %tnpc
	.word 0xf33c61c0  ! 321: STDF_I	std	%f25, [0x01c0, %r17]
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4c000  ! 326: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xfc2d8000  ! 328: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf825a0ce  ! 331: STW_I	stw	%r28, [%r22 + 0x00ce]
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d6031  ! 333: STB_I	stb	%r24, [%r21 + 0x0031]
	.word 0xf42d0000  ! 334: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf824c000  ! 335: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xbf50c000  ! 337: RDPR_TT	rdpr	%tt, %r31
	setx	data_start_6, %g1, %r17
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875a156  ! 345: STX_I	stx	%r28, [%r22 + 0x0156]
	.word 0xfc24e137  ! 347: STW_I	stw	%r30, [%r19 + 0x0137]
	.word 0xb0358000  ! 348: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xfe24a0bc  ! 351: STW_I	stw	%r31, [%r18 + 0x00bc]
	.word 0xf424a06b  ! 358: STW_I	stw	%r26, [%r18 + 0x006b]
	mov	1, %r12
	.word 0xa1930000  ! 359: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7500000  ! 360: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb2ade00e  ! 363: ANDNcc_I	andncc 	%r23, 0x000e, %r25
	setx	data_start_6, %g1, %r16
	.word 0xf424a05f  ! 367: STW_I	stw	%r26, [%r18 + 0x005f]
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 372: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xfe2d4000  ! 375: STB_R	stb	%r31, [%r21 + %r0]
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d8000  ! 380: STD_R	std	%r24, [%r22 + %r0]
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	setx	0xfbcaec890000ba0a, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2c48000  ! 383: ADDCcc_R	addccc 	%r18, %r0, %r25
	.word 0xf0748000  ! 384: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xbab5e0f9  ! 386: ORNcc_I	orncc 	%r23, 0x00f9, %r29
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424a075  ! 388: STW_I	stw	%r26, [%r18 + 0x0075]
	.word 0x8d94a059  ! 390: WRPR_PSTATE_I	wrpr	%r18, 0x0059, %pstate
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	.word 0x8d95a0c1  ! 399: WRPR_PSTATE_I	wrpr	%r22, 0x00c1, %pstate
	.word 0xf93da15e  ! 402: STDF_I	std	%f28, [0x015e, %r22]
	.word 0xf43d61f5  ! 406: STD_I	std	%r26, [%r21 + 0x01f5]
	.word 0xf025e08c  ! 408: STW_I	stw	%r24, [%r23 + 0x008c]
	.word 0xfa34a126  ! 413: STH_I	sth	%r29, [%r18 + 0x0126]
	.word 0xf22c0000  ! 417: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb7518000  ! 419: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xff3c6134  ! 421: STDF_I	std	%f31, [0x0134, %r17]
	.word 0xf63dc000  ! 423: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfe7520a7  ! 425: STX_I	stx	%r31, [%r20 + 0x00a7]
	setx	0xd226d62500009cd6, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795a112  ! 430: WRPR_TT_I	wrpr	%r22, 0x0112, %tt
	.word 0xf23d21da  ! 432: STD_I	std	%r25, [%r20 + 0x01da]
	.word 0xf22c602a  ! 433: STB_I	stb	%r25, [%r17 + 0x002a]
	.word 0xf33ce113  ! 434: STDF_I	std	%f25, [0x0113, %r19]
	.word 0xfe2d0000  ! 435: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfa2c4000  ! 438: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf83c8000  ! 441: STD_R	std	%r28, [%r18 + %r0]
	.word 0x9194e0c0  ! 442: WRPR_PIL_I	wrpr	%r19, 0x00c0, %pil
	.word 0xf22dc000  ! 443: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf62421f5  ! 444: STW_I	stw	%r27, [%r16 + 0x01f5]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94605b  ! 448: WRPR_PSTATE_I	wrpr	%r17, 0x005b, %pstate
	.word 0xbf500000  ! 449: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf13c20a2  ! 450: STDF_I	std	%f24, [0x00a2, %r16]
	setx	data_start_6, %g1, %r16
	.word 0xb3508000  ! 456: RDPR_TSTATE	<illegal instruction>
	.word 0xf42cc000  ! 458: STB_R	stb	%r26, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 459: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824606f  ! 462: STW_I	stw	%r28, [%r17 + 0x006f]
	.word 0xf23dc000  ! 467: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfa34e112  ! 469: STH_I	sth	%r29, [%r19 + 0x0112]
	setx	data_start_5, %g1, %r21
	.word 0xb894a1e8  ! 472: ORcc_I	orcc 	%r18, 0x01e8, %r28
	.word 0xf0254000  ! 473: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb01d6146  ! 474: XOR_I	xor 	%r21, 0x0146, %r24
	.word 0xbf51c000  ! 475: RDPR_TL	rdpr	%tl, %r31
	.word 0xf73de085  ! 479: STDF_I	std	%f27, [0x0085, %r23]
	mov	0, %r12
	.word 0xa1930000  ! 482: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1480000  ! 484: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbe2d605a  ! 485: ANDN_I	andn 	%r21, 0x005a, %r31
	mov	1, %r12
	.word 0xa1930000  ! 486: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa2d0000  ! 487: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf63d8000  ! 489: STD_R	std	%r27, [%r22 + %r0]
	setx	0x77138e5000008f84, %g1, %r10
	.word 0x819a8000  ! 491: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf42cc000  ! 492: STB_R	stb	%r26, [%r19 + %r0]
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 499: RDPR_TT	rdpr	%tt, %r30
	.word 0xb48c60cc  ! 501: ANDcc_I	andcc 	%r17, 0x00cc, %r26
	.word 0xfe7461f6  ! 503: STX_I	stx	%r31, [%r17 + 0x01f6]
	.word 0x8595a04c  ! 507: WRPR_TSTATE_I	wrpr	%r22, 0x004c, %tstate
	.word 0xfa754000  ! 509: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf73dc000  ! 510: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf42c4000  ! 513: STB_R	stb	%r26, [%r17 + %r0]
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d61f8  ! 519: STDF_I	std	%f31, [0x01f8, %r21]
	.word 0xb7518000  ! 521: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbf500000  ! 522: RDPR_TPC	<illegal instruction>
	.word 0xf43ce144  ! 523: STD_I	std	%r26, [%r19 + 0x0144]
	setx	data_start_2, %g1, %r22
	.word 0xf62ce142  ! 526: STB_I	stb	%r27, [%r19 + 0x0142]
	.word 0xfc2cc000  ! 527: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb5520000  ! 528: RDPR_PIL	<illegal instruction>
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34a147  ! 532: STH_I	sth	%r30, [%r18 + 0x0147]
	.word 0xb9518000  ! 534: RDPR_PSTATE	<illegal instruction>
	.word 0xb09cc000  ! 537: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xf435200b  ! 538: STH_I	sth	%r26, [%r20 + 0x000b]
	.word 0x85952111  ! 539: WRPR_TSTATE_I	wrpr	%r20, 0x0111, %tstate
	.word 0xb951c000  ! 540: RDPR_TL	rdpr	%tl, %r28
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 542: STH_R	sth	%r25, [%r20 + %r0]
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 547: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb7510000  ! 549: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 551: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 552: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_0, %g1, %r23
	.word 0xf23ca1c5  ! 558: STD_I	std	%r25, [%r18 + 0x01c5]
	.word 0xf2254000  ! 559: STW_R	stw	%r25, [%r21 + %r0]
	.word 0x8394614f  ! 560: WRPR_TNPC_I	wrpr	%r17, 0x014f, %tnpc
	.word 0xf8354000  ! 561: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf02d0000  ! 562: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf22d0000  ! 568: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf83c4000  ! 573: STD_R	std	%r28, [%r17 + %r0]
	.word 0xfc240000  ! 575: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xb4b421de  ! 578: SUBCcc_I	orncc 	%r16, 0x01de, %r26
	.word 0xbf518000  ! 585: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfa752008  ! 588: STX_I	stx	%r29, [%r20 + 0x0008]
	.word 0x87942066  ! 591: WRPR_TT_I	wrpr	%r16, 0x0066, %tt
	.word 0xf024c000  ! 593: STW_R	stw	%r24, [%r19 + %r0]
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 597: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xbb520000  ! 599: RDPR_PIL	rdpr	%pil, %r29
	.word 0xbd500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xfa356196  ! 605: STH_I	sth	%r29, [%r21 + 0x0196]
	.word 0xf82d61ae  ! 607: STB_I	stb	%r28, [%r21 + 0x01ae]
	.word 0xb3508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0xbe1ca09f  ! 614: XOR_I	xor 	%r18, 0x009f, %r31
	.word 0xf62c8000  ! 615: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf93c4000  ! 616: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb0b4e118  ! 617: SUBCcc_I	orncc 	%r19, 0x0118, %r24
	.word 0xbb504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb5510000  ! 620: RDPR_TICK	<illegal instruction>
	.word 0xfe35a11b  ! 624: STH_I	sth	%r31, [%r22 + 0x011b]
	.word 0xf83d4000  ! 629: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf225e1cb  ! 631: STW_I	stw	%r25, [%r23 + 0x01cb]
	.word 0xf03dc000  ! 633: STD_R	std	%r24, [%r23 + %r0]
	.word 0xbb356001  ! 634: SRL_I	srl 	%r21, 0x0001, %r29
	.word 0x8d94a0e4  ! 635: WRPR_PSTATE_I	wrpr	%r18, 0x00e4, %pstate
	setx	0xf24a7cf800003a86, %g1, %r10
	.word 0x819a8000  ! 636: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3500000  ! 641: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8394e009  ! 643: WRPR_TNPC_I	wrpr	%r19, 0x0009, %tnpc
	.word 0xbeada127  ! 644: ANDNcc_I	andncc 	%r22, 0x0127, %r31
	.word 0x8d9521be  ! 651: WRPR_PSTATE_I	wrpr	%r20, 0x01be, %pstate
	.word 0xff3d8000  ! 653: STDF_R	std	%f31, [%r0, %r22]
	.word 0x8194a0ef  ! 662: WRPR_TPC_I	wrpr	%r18, 0x00ef, %tpc
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 667: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xfa240000  ! 668: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xfa75e073  ! 669: STX_I	stx	%r29, [%r23 + 0x0073]
	.word 0xbb518000  ! 670: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xbc344000  ! 671: ORN_R	orn 	%r17, %r0, %r30
	.word 0xbb508000  ! 674: RDPR_TSTATE	<illegal instruction>
	.word 0x9195a1fe  ! 676: WRPR_PIL_I	wrpr	%r22, 0x01fe, %pil
	.word 0xb494610d  ! 679: ORcc_I	orcc 	%r17, 0x010d, %r26
	.word 0xf6752167  ! 681: STX_I	stx	%r27, [%r20 + 0x0167]
	.word 0xb751c000  ! 682: RDPR_TL	rdpr	%tl, %r27
	.word 0xfa24e04b  ! 684: STW_I	stw	%r29, [%r19 + 0x004b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf875615e  ! 687: STX_I	stx	%r28, [%r21 + 0x015e]
	.word 0xfe740000  ! 689: STX_R	stx	%r31, [%r16 + %r0]
	setx	0x4e69ad100000b80, %g1, %r10
	.word 0x839a8000  ! 690: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf02dc000  ! 694: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb3518000  ! 695: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb950c000  ! 696: RDPR_TT	<illegal instruction>
	.word 0xf33cc000  ! 697: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf025a080  ! 700: STW_I	stw	%r24, [%r22 + 0x0080]
	.word 0xf53d4000  ! 701: STDF_R	std	%f26, [%r0, %r21]
	.word 0xfe346072  ! 702: STH_I	sth	%r31, [%r17 + 0x0072]
	.word 0xfd3d0000  ! 704: STDF_R	std	%f30, [%r0, %r20]
	.word 0x8d9421c0  ! 705: WRPR_PSTATE_I	wrpr	%r16, 0x01c0, %pstate
	mov	2, %r12
	.word 0x8f930000  ! 710: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe244000  ! 712: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb3518000  ! 713: RDPR_PSTATE	rdpr	%pstate, %r25
	setx	0xb2f63f9400001848, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb035e0ed  ! 721: ORN_I	orn 	%r23, 0x00ed, %r24
	.word 0xb0148000  ! 723: OR_R	or 	%r18, %r0, %r24
	.word 0xf83ce12e  ! 726: STD_I	std	%r28, [%r19 + 0x012e]
	.word 0xb834a0c5  ! 730: SUBC_I	orn 	%r18, 0x00c5, %r28
	.word 0xb1500000  ! 733: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf634e082  ! 734: STH_I	sth	%r27, [%r19 + 0x0082]
	.word 0xf43d2140  ! 735: STD_I	std	%r26, [%r20 + 0x0140]
	setx	0xa8dda8b70000f90e, %g1, %r10
	.word 0x839a8000  ! 739: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb551c000  ! 742: RDPR_TL	rdpr	%tl, %r26
	.word 0x9194a11e  ! 743: WRPR_PIL_I	wrpr	%r18, 0x011e, %pil
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	setx	0xa6d443660000190d, %g1, %r10
	.word 0x839a8000  ! 753: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795a1d5  ! 756: WRPR_TT_I	wrpr	%r22, 0x01d5, %tt
	.word 0xbcbd4000  ! 758: XNORcc_R	xnorcc 	%r21, %r0, %r30
	.word 0xba1c8000  ! 760: XOR_R	xor 	%r18, %r0, %r29
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3d20a3  ! 763: STD_I	std	%r30, [%r20 + 0x00a3]
	.word 0xf22c4000  ! 764: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfe74c000  ! 765: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf4758000  ! 766: STX_R	stx	%r26, [%r22 + %r0]
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53c8000  ! 769: STDF_R	std	%f26, [%r0, %r18]
	.word 0xb81c20ad  ! 770: XOR_I	xor 	%r16, 0x00ad, %r28
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53dc000  ! 782: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfd3cc000  ! 783: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf82d4000  ! 785: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf23d8000  ! 789: STD_R	std	%r25, [%r22 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 792: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa3d8000  ! 794: STD_R	std	%r29, [%r22 + %r0]
	.word 0xbf345000  ! 796: SRLX_R	srlx	%r17, %r0, %r31
	.word 0x85952111  ! 802: WRPR_TSTATE_I	wrpr	%r20, 0x0111, %tstate
	.word 0x8794e173  ! 804: WRPR_TT_I	wrpr	%r19, 0x0173, %tt
	mov	1, %r12
	.word 0x8f930000  ! 807: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x87956185  ! 810: WRPR_TT_I	wrpr	%r21, 0x0185, %tt
	.word 0xf83460e6  ! 813: STH_I	sth	%r28, [%r17 + 0x00e6]
	.word 0xb13c8000  ! 817: SRA_R	sra 	%r18, %r0, %r24
	.word 0xf82da136  ! 818: STB_I	stb	%r28, [%r22 + 0x0136]
	.word 0x91942065  ! 819: WRPR_PIL_I	wrpr	%r16, 0x0065, %pil
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13de035  ! 821: STDF_I	std	%f24, [0x0035, %r23]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6848000  ! 825: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xfb3dc000  ! 826: STDF_R	std	%f29, [%r0, %r23]
	.word 0x9195a132  ! 827: WRPR_PIL_I	wrpr	%r22, 0x0132, %pil
	.word 0xb20c0000  ! 829: AND_R	and 	%r16, %r0, %r25
	.word 0xb1508000  ! 830: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb93c1000  ! 831: SRAX_R	srax	%r16, %r0, %r28
	.word 0xb8ac0000  ! 839: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xf87461b6  ! 840: STX_I	stx	%r28, [%r17 + 0x01b6]
	.word 0xb42c8000  ! 842: ANDN_R	andn 	%r18, %r0, %r26
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33d8000  ! 848: STDF_R	std	%f25, [%r0, %r22]
	.word 0xb484c000  ! 852: ADDcc_R	addcc 	%r19, %r0, %r26
	setx	data_start_2, %g1, %r22
	.word 0xb09ca11d  ! 857: XORcc_I	xorcc 	%r18, 0x011d, %r24
	.word 0x8d942053  ! 862: WRPR_PSTATE_I	wrpr	%r16, 0x0053, %pstate
	.word 0xb4242156  ! 868: SUB_I	sub 	%r16, 0x0156, %r26
	.word 0xfa3ce0c9  ! 869: STD_I	std	%r29, [%r19 + 0x00c9]
	.word 0xfa3da12a  ! 874: STD_I	std	%r29, [%r22 + 0x012a]
	.word 0x89942058  ! 876: WRPR_TICK_I	wrpr	%r16, 0x0058, %tick
	.word 0xbd540000  ! 879: RDPR_GL	rdpr	%-, %r30
	.word 0xf63cc000  ! 882: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfa2d6058  ! 883: STB_I	stb	%r29, [%r21 + 0x0058]
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43c8000  ! 897: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf23c8000  ! 899: STD_R	std	%r25, [%r18 + %r0]
	.word 0xfc3cc000  ! 900: STD_R	std	%r30, [%r19 + %r0]
	.word 0xb7540000  ! 901: RDPR_GL	<illegal instruction>
	.word 0xb5504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x9195616e  ! 912: WRPR_PIL_I	wrpr	%r21, 0x016e, %pil
	.word 0xb604a017  ! 915: ADD_I	add 	%r18, 0x0017, %r27
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73c0000  ! 920: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfa35e121  ! 921: STH_I	sth	%r29, [%r23 + 0x0121]
	.word 0xb2b50000  ! 922: SUBCcc_R	orncc 	%r20, %r0, %r25
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674a030  ! 924: STX_I	stx	%r27, [%r18 + 0x0030]
	.word 0xf6244000  ! 925: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfe258000  ! 927: STW_R	stw	%r31, [%r22 + %r0]
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	setx	0x27fae46c0000f909, %g1, %r10
	.word 0x839a8000  ! 930: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8395e011  ! 932: WRPR_TNPC_I	wrpr	%r23, 0x0011, %tnpc
	.word 0xf234e047  ! 938: STH_I	sth	%r25, [%r19 + 0x0047]
	.word 0xf03d2043  ! 942: STD_I	std	%r24, [%r20 + 0x0043]
	.word 0xf274a0c3  ! 945: STX_I	stx	%r25, [%r18 + 0x00c3]
	.word 0xfa24a1aa  ! 946: STW_I	stw	%r29, [%r18 + 0x01aa]
	.word 0xf93c206c  ! 947: STDF_I	std	%f28, [0x006c, %r16]
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	setx	0x512bb95d00007e94, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 960: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf22c200a  ! 961: STB_I	stb	%r25, [%r16 + 0x000a]
	.word 0xf22ce12d  ! 962: STB_I	stb	%r25, [%r19 + 0x012d]
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 966: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf13d0000  ! 970: STDF_R	std	%f24, [%r0, %r20]
	.word 0xfe3c8000  ! 971: STD_R	std	%r31, [%r18 + %r0]
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 982: STD_R	std	%r27, [%r20 + %r0]
	.word 0xbf50c000  ! 983: RDPR_TT	rdpr	%tt, %r31
	.word 0x8595a1e3  ! 985: WRPR_TSTATE_I	wrpr	%r22, 0x01e3, %tstate
	.word 0xb93c6001  ! 987: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xbb50c000  ! 995: RDPR_TT	rdpr	%tt, %r29
	.word 0xf23d2055  ! 997: STD_I	std	%r25, [%r20 + 0x0055]
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
	.word 0xfa552127  ! 2: LDSH_I	ldsh	[%r20 + 0x0127], %r29
	.word 0x8995a160  ! 3: WRPR_TICK_I	wrpr	%r22, 0x0160, %tick
	.word 0xb9480000  ! 4: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf6454000  ! 8: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xbeb44000  ! 9: ORNcc_R	orncc 	%r17, %r0, %r31
	.word 0xf24561cc  ! 12: LDSW_I	ldsw	[%r21 + 0x01cc], %r25
	setx	0x7a7cdc120000be95, %g1, %r10
	.word 0x839a8000  ! 14: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb095e176  ! 16: ORcc_I	orcc 	%r23, 0x0176, %r24
	.word 0xfa4de017  ! 17: LDSB_I	ldsb	[%r23 + 0x0017], %r29
	.word 0xb750c000  ! 19: RDPR_TT	<illegal instruction>
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa5d219d  ! 30: LDX_I	ldx	[%r20 + 0x019d], %r29
	mov	1, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6440000  ! 37: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xf454c000  ! 38: LDSH_R	ldsh	[%r19 + %r0], %r26
	setx	data_start_4, %g1, %r22
	.word 0xf85d6198  ! 40: LDX_I	ldx	[%r21 + 0x0198], %r28
	.word 0xb3500000  ! 41: RDPR_TPC	<illegal instruction>
	.word 0xfc44219b  ! 42: LDSW_I	ldsw	[%r16 + 0x019b], %r30
	.word 0xbaa58000  ! 48: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xfc1c4000  ! 50: LDD_R	ldd	[%r17 + %r0], %r30
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 59: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa1c0000  ! 68: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xf64de15d  ! 72: LDSB_I	ldsb	[%r23 + 0x015d], %r27
	.word 0xb0ade143  ! 76: ANDNcc_I	andncc 	%r23, 0x0143, %r24
	.word 0xf05d4000  ! 77: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xfe4cc000  ! 79: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xfc142136  ! 82: LDUH_I	lduh	[%r16 + 0x0136], %r30
	.word 0x81942145  ! 83: WRPR_TPC_I	wrpr	%r16, 0x0145, %tpc
	.word 0xfe44a117  ! 86: LDSW_I	ldsw	[%r18 + 0x0117], %r31
	mov	2, %r12
	.word 0x8f930000  ! 87: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe4c2039  ! 91: LDSB_I	ldsb	[%r16 + 0x0039], %r31
	.word 0xf31cc000  ! 94: LDDF_R	ldd	[%r19, %r0], %f25
	setx	0xb932bc2d0000cf82, %g1, %r10
	.word 0x819a8000  ! 95: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x899560d6  ! 96: WRPR_TICK_I	wrpr	%r21, 0x00d6, %tick
	.word 0xf8040000  ! 100: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0x8595607f  ! 101: WRPR_TSTATE_I	wrpr	%r21, 0x007f, %tstate
	.word 0xb3540000  ! 107: RDPR_GL	<illegal instruction>
	.word 0x8d942164  ! 110: WRPR_PSTATE_I	wrpr	%r16, 0x0164, %pstate
	.word 0xf655e08a  ! 115: LDSH_I	ldsh	[%r23 + 0x008a], %r27
	.word 0xf71d8000  ! 116: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xfe1d4000  ! 118: LDD_R	ldd	[%r21 + %r0], %r31
	mov	1, %r12
	.word 0xa1930000  ! 119: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994e146  ! 121: WRPR_TICK_I	wrpr	%r19, 0x0146, %tick
	.word 0xf91ce056  ! 123: LDDF_I	ldd	[%r19, 0x0056], %f28
	.word 0x9195e1b4  ! 125: WRPR_PIL_I	wrpr	%r23, 0x01b4, %pil
	.word 0xfe14a06d  ! 126: LDUH_I	lduh	[%r18 + 0x006d], %r31
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844c000  ! 131: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xb20d0000  ! 136: AND_R	and 	%r20, %r0, %r25
	.word 0x8794a03c  ! 145: WRPR_TT_I	wrpr	%r18, 0x003c, %tt
	mov	2, %r12
	.word 0xa1930000  ! 147: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf005c000  ! 148: LDUW_R	lduw	[%r23 + %r0], %r24
	setx	data_start_0, %g1, %r18
	.word 0xf45ce028  ! 154: LDX_I	ldx	[%r19 + 0x0028], %r26
	.word 0xfd1d8000  ! 155: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xbebc0000  ! 157: XNORcc_R	xnorcc 	%r16, %r0, %r31
	.word 0xf4144000  ! 159: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0x8195604d  ! 167: WRPR_TPC_I	wrpr	%r21, 0x004d, %tpc
	.word 0xb5500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0xf8444000  ! 173: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf4544000  ! 179: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb5510000  ! 183: RDPR_TICK	<illegal instruction>
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1cc000  ! 187: LDDF_R	ldd	[%r19, %r0], %f31
	setx	0x575a6100000dc57, %g1, %r10
	.word 0x819a8000  ! 190: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc1c60dc  ! 194: LDD_I	ldd	[%r17 + 0x00dc], %r30
	.word 0xfe4520c8  ! 195: LDSW_I	ldsw	[%r20 + 0x00c8], %r31
	.word 0xf855a180  ! 197: LDSH_I	ldsh	[%r22 + 0x0180], %r28
	mov	1, %r12
	.word 0xa1930000  ! 201: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61ca120  ! 202: LDD_I	ldd	[%r18 + 0x0120], %r27
	.word 0xbb51c000  ! 204: RDPR_TL	<illegal instruction>
	.word 0xb8b521e3  ! 206: SUBCcc_I	orncc 	%r20, 0x01e3, %r28
	.word 0xfc55616a  ! 208: LDSH_I	ldsh	[%r21 + 0x016a], %r30
	.word 0xfa5d0000  ! 209: LDX_R	ldx	[%r20 + %r0], %r29
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2058000  ! 214: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfc054000  ! 217: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xfc15a13e  ! 224: LDUH_I	lduh	[%r22 + 0x013e], %r30
	.word 0xfe05a10a  ! 225: LDUW_I	lduw	[%r22 + 0x010a], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4ce03c  ! 228: LDSB_I	ldsb	[%r19 + 0x003c], %r29
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64dc000  ! 233: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf21561b1  ! 235: LDUH_I	lduh	[%r21 + 0x01b1], %r25
	.word 0xfc540000  ! 236: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfc4c8000  ! 241: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xb434e093  ! 243: SUBC_I	orn 	%r19, 0x0093, %r26
	.word 0x8794e016  ! 246: WRPR_TT_I	wrpr	%r19, 0x0016, %tt
	.word 0xbb500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0xbb518000  ! 248: RDPR_PSTATE	<illegal instruction>
	.word 0xf2156161  ! 250: LDUH_I	lduh	[%r21 + 0x0161], %r25
	.word 0x8394e075  ! 252: WRPR_TNPC_I	wrpr	%r19, 0x0075, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 253: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa544000  ! 256: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf65de127  ! 259: LDX_I	ldx	[%r23 + 0x0127], %r27
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44de0fb  ! 265: LDSB_I	ldsb	[%r23 + 0x00fb], %r26
	.word 0xfe1c8000  ! 267: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xb150c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xb6b5a1f0  ! 270: SUBCcc_I	orncc 	%r22, 0x01f0, %r27
	.word 0xf404e1c8  ! 274: LDUW_I	lduw	[%r19 + 0x01c8], %r26
	.word 0x8794e046  ! 279: WRPR_TT_I	wrpr	%r19, 0x0046, %tt
	mov	1, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf654e1c0  ! 282: LDSH_I	ldsh	[%r19 + 0x01c0], %r27
	.word 0xf614e01e  ! 283: LDUH_I	lduh	[%r19 + 0x001e], %r27
	.word 0xbb51c000  ! 288: RDPR_TL	<illegal instruction>
	setx	0xafdbc4ab0000ce56, %g1, %r10
	.word 0x819a8000  ! 289: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x819460c4  ! 291: WRPR_TPC_I	wrpr	%r17, 0x00c4, %tpc
	.word 0x9195205a  ! 293: WRPR_PIL_I	wrpr	%r20, 0x005a, %pil
	.word 0xf41cc000  ! 300: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb684613f  ! 303: ADDcc_I	addcc 	%r17, 0x013f, %r27
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d4000  ! 311: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf005e098  ! 313: LDUW_I	lduw	[%r23 + 0x0098], %r24
	.word 0xf20cc000  ! 315: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0x8395219a  ! 318: WRPR_TNPC_I	wrpr	%r20, 0x019a, %tnpc
	.word 0xf64d6041  ! 320: LDSB_I	ldsb	[%r21 + 0x0041], %r27
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04e13d  ! 325: LDUW_I	lduw	[%r19 + 0x013d], %r29
	.word 0xb4b54000  ! 326: SUBCcc_R	orncc 	%r21, %r0, %r26
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 337: RDPR_TT	rdpr	%tt, %r26
	.word 0xf61461eb  ! 340: LDUH_I	lduh	[%r17 + 0x01eb], %r27
	setx	data_start_7, %g1, %r19
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4dc000  ! 344: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf8040000  ! 346: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb0358000  ! 348: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xf21c0000  ! 350: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xf6550000  ! 352: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf2154000  ! 353: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xfa1d6116  ! 355: LDD_I	ldd	[%r21 + 0x0116], %r29
	.word 0xfb1d2025  ! 356: LDDF_I	ldd	[%r20, 0x0025], %f29
	mov	1, %r12
	.word 0xa1930000  ! 359: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xb8ada122  ! 363: ANDNcc_I	andncc 	%r22, 0x0122, %r28
	.word 0xf31c4000  ! 365: LDDF_R	ldd	[%r17, %r0], %f25
	setx	data_start_1, %g1, %r23
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 372: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r20
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	setx	0x239d3ac1000079d3, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb6c44000  ! 383: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xfa4c2029  ! 385: LDSB_I	ldsb	[%r16 + 0x0029], %r29
	.word 0xbab4a1c5  ! 386: ORNcc_I	orncc 	%r18, 0x01c5, %r29
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20461fb  ! 389: LDUW_I	lduw	[%r17 + 0x01fb], %r25
	.word 0x8d95e0f7  ! 390: WRPR_PSTATE_I	wrpr	%r23, 0x00f7, %pstate
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	.word 0xf415218c  ! 398: LDUH_I	lduh	[%r20 + 0x018c], %r26
	.word 0x8d946010  ! 399: WRPR_PSTATE_I	wrpr	%r17, 0x0010, %pstate
	.word 0xfe1c8000  ! 403: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf80d6007  ! 405: LDUB_I	ldub	[%r21 + 0x0007], %r28
	.word 0xf85c61e3  ! 410: LDX_I	ldx	[%r17 + 0x01e3], %r28
	.word 0xf24c4000  ! 411: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfe444000  ! 418: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xb1518000  ! 419: RDPR_PSTATE	<illegal instruction>
	.word 0xff1ce081  ! 420: LDDF_I	ldd	[%r19, 0x0081], %f31
	.word 0xfc0c0000  ! 422: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xfe0d8000  ! 424: LDUB_R	ldub	[%r22 + %r0], %r31
	setx	0x2f0dcbb200007d03, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879560e5  ! 430: WRPR_TT_I	wrpr	%r21, 0x00e5, %tt
	.word 0xf61d0000  ! 436: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf054a0b6  ! 437: LDSH_I	ldsh	[%r18 + 0x00b6], %r24
	.word 0x91952047  ! 442: WRPR_PIL_I	wrpr	%r20, 0x0047, %pil
	.word 0xf44560b4  ! 445: LDSW_I	ldsw	[%r21 + 0x00b4], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d952102  ! 448: WRPR_PSTATE_I	wrpr	%r20, 0x0102, %pstate
	.word 0xb1500000  ! 449: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfb1c0000  ! 451: LDDF_R	ldd	[%r16, %r0], %f29
	setx	data_start_4, %g1, %r17
	.word 0xfa0de027  ! 454: LDUB_I	ldub	[%r23 + 0x0027], %r29
	.word 0xbb508000  ! 456: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 459: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc058000  ! 470: LDUW_R	lduw	[%r22 + %r0], %r30
	setx	data_start_1, %g1, %r22
	.word 0xbc94a06a  ! 472: ORcc_I	orcc 	%r18, 0x006a, %r30
	.word 0xbc1c608b  ! 474: XOR_I	xor 	%r17, 0x008b, %r30
	.word 0xb751c000  ! 475: RDPR_TL	rdpr	%tl, %r27
	.word 0xfe1da0ca  ! 477: LDD_I	ldd	[%r22 + 0x00ca], %r31
	mov	2, %r12
	.word 0xa1930000  ! 482: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa05a07c  ! 483: LDUW_I	lduw	[%r22 + 0x007c], %r29
	.word 0xb3480000  ! 484: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb82ca0ea  ! 485: ANDN_I	andn 	%r18, 0x00ea, %r28
	mov	1, %r12
	.word 0xa1930000  ! 486: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf44d8000  ! 490: LDSB_R	ldsb	[%r22 + %r0], %r26
	setx	0xbec0c53500004f9a, %g1, %r10
	.word 0x819a8000  ! 491: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf24c4000  ! 494: LDSB_R	ldsb	[%r17 + %r0], %r25
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 499: RDPR_TT	<illegal instruction>
	.word 0xb68ca084  ! 501: ANDcc_I	andcc 	%r18, 0x0084, %r27
	.word 0xf71c8000  ! 504: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xfa540000  ! 505: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0x859420f0  ! 507: WRPR_TSTATE_I	wrpr	%r16, 0x00f0, %tstate
	.word 0xfe052177  ! 508: LDUW_I	lduw	[%r20 + 0x0177], %r31
	.word 0xfc4de0ad  ! 514: LDSB_I	ldsb	[%r23 + 0x00ad], %r30
	.word 0xfe4c6161  ! 515: LDSB_I	ldsb	[%r17 + 0x0161], %r31
	.word 0xf01ca011  ! 516: LDD_I	ldd	[%r18 + 0x0011], %r24
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24de125  ! 520: LDSB_I	ldsb	[%r23 + 0x0125], %r25
	.word 0xb1518000  ! 521: RDPR_PSTATE	<illegal instruction>
	.word 0xb3500000  ! 522: RDPR_TPC	<illegal instruction>
	.word 0xfa1521f7  ! 524: LDUH_I	lduh	[%r20 + 0x01f7], %r29
	setx	data_start_3, %g1, %r18
	.word 0xbf520000  ! 528: RDPR_PIL	<illegal instruction>
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 534: RDPR_PSTATE	<illegal instruction>
	.word 0xf0450000  ! 535: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xbc9c8000  ! 537: XORcc_R	xorcc 	%r18, %r0, %r30
	.word 0x85952069  ! 539: WRPR_TSTATE_I	wrpr	%r20, 0x0069, %tstate
	.word 0xb351c000  ! 540: RDPR_TL	<illegal instruction>
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c21ac  ! 543: LDUB_I	ldub	[%r16 + 0x01ac], %r26
	.word 0xf2552035  ! 544: LDSH_I	ldsh	[%r20 + 0x0035], %r25
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 549: RDPR_TICK	<illegal instruction>
	.word 0xf21de03d  ! 550: LDD_I	ldd	[%r23 + 0x003d], %r25
	mov	0, %r12
	.word 0x8f930000  ! 551: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 552: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf64c4000  ! 555: LDSB_R	ldsb	[%r17 + %r0], %r27
	setx	data_start_4, %g1, %r16
	.word 0x8394a1b3  ! 560: WRPR_TNPC_I	wrpr	%r18, 0x01b3, %tnpc
	.word 0xfe458000  ! 563: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf4450000  ! 566: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf61d2053  ! 576: LDD_I	ldd	[%r20 + 0x0053], %r27
	.word 0xbeb4606b  ! 578: SUBCcc_I	orncc 	%r17, 0x006b, %r31
	.word 0xf4054000  ! 584: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xb3518000  ! 585: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf01c6094  ! 586: LDD_I	ldd	[%r17 + 0x0094], %r24
	.word 0xfa14a1d6  ! 589: LDUH_I	lduh	[%r18 + 0x01d6], %r29
	.word 0x8794e1a9  ! 591: WRPR_TT_I	wrpr	%r19, 0x01a9, %tt
	.word 0xf40da0b5  ! 592: LDUB_I	ldub	[%r22 + 0x00b5], %r26
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4544000  ! 595: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf20460ba  ! 598: LDUW_I	lduw	[%r17 + 0x00ba], %r25
	.word 0xbb520000  ! 599: RDPR_PIL	<illegal instruction>
	.word 0xb7500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xf2050000  ! 602: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xb3508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0xb01de122  ! 614: XOR_I	xor 	%r23, 0x0122, %r24
	.word 0xb6b4601b  ! 617: SUBCcc_I	orncc 	%r17, 0x001b, %r27
	.word 0xbd504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xbf510000  ! 620: RDPR_TICK	<illegal instruction>
	.word 0xfe14208e  ! 622: LDUH_I	lduh	[%r16 + 0x008e], %r31
	.word 0xf005e0b7  ! 625: LDUW_I	lduw	[%r23 + 0x00b7], %r24
	.word 0xfe0c618d  ! 628: LDUB_I	ldub	[%r17 + 0x018d], %r31
	.word 0xfd1d60a9  ! 632: LDDF_I	ldd	[%r21, 0x00a9], %f30
	.word 0xb134a001  ! 634: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0x8d94e023  ! 635: WRPR_PSTATE_I	wrpr	%r19, 0x0023, %pstate
	setx	0xc48fbb9200007d89, %g1, %r10
	.word 0x819a8000  ! 636: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0x8395a0f0  ! 643: WRPR_TNPC_I	wrpr	%r22, 0x00f0, %tnpc
	.word 0xb2ad2069  ! 644: ANDNcc_I	andncc 	%r20, 0x0069, %r25
	.word 0xf6042078  ! 645: LDUW_I	lduw	[%r16 + 0x0078], %r27
	.word 0xf24c8000  ! 647: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xf214e11d  ! 648: LDUH_I	lduh	[%r19 + 0x011d], %r25
	.word 0x8d95a10c  ! 651: WRPR_PSTATE_I	wrpr	%r22, 0x010c, %pstate
	.word 0xf71c4000  ! 654: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf44420c6  ! 656: LDSW_I	ldsw	[%r16 + 0x00c6], %r26
	.word 0xf454a1cb  ! 658: LDSH_I	ldsh	[%r18 + 0x01cb], %r26
	.word 0xfc5c8000  ! 660: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf31c20ff  ! 661: LDDF_I	ldd	[%r16, 0x00ff], %f25
	.word 0x8194e00e  ! 662: WRPR_TPC_I	wrpr	%r19, 0x000e, %tpc
	.word 0xf6144000  ! 663: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xfa1cc000  ! 664: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xf8544000  ! 665: LDSH_R	ldsh	[%r17 + %r0], %r28
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0xb834c000  ! 671: ORN_R	orn 	%r19, %r0, %r28
	.word 0xfa146042  ! 673: LDUH_I	lduh	[%r17 + 0x0042], %r29
	.word 0xb9508000  ! 674: RDPR_TSTATE	<illegal instruction>
	.word 0x9194203f  ! 676: WRPR_PIL_I	wrpr	%r16, 0x003f, %pil
	.word 0xf00560bd  ! 678: LDUW_I	lduw	[%r21 + 0x00bd], %r24
	.word 0xb095e11e  ! 679: ORcc_I	orcc 	%r23, 0x011e, %r24
	.word 0xb151c000  ! 682: RDPR_TL	<illegal instruction>
	.word 0xf65da1b3  ! 683: LDX_I	ldx	[%r22 + 0x01b3], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84c4000  ! 686: LDSB_R	ldsb	[%r17 + %r0], %r28
	setx	0xf134340000009987, %g1, %r10
	.word 0x839a8000  ! 690: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf518000  ! 695: RDPR_PSTATE	<illegal instruction>
	.word 0xb150c000  ! 696: RDPR_TT	<illegal instruction>
	.word 0xf44d4000  ! 699: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xf4048000  ! 703: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0x8d9521e7  ! 705: WRPR_PSTATE_I	wrpr	%r20, 0x01e7, %pstate
	mov	1, %r12
	.word 0x8f930000  ! 710: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe052020  ! 711: LDUW_I	lduw	[%r20 + 0x0020], %r31
	.word 0xbf518000  ! 713: RDPR_PSTATE	<illegal instruction>
	setx	0x75e4302800008cdd, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbe35a0ab  ! 721: ORN_I	orn 	%r22, 0x00ab, %r31
	.word 0xf11ce1fb  ! 722: LDDF_I	ldd	[%r19, 0x01fb], %f24
	.word 0xb614c000  ! 723: OR_R	or 	%r19, %r0, %r27
	.word 0xf8154000  ! 724: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xf41dc000  ! 728: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xb8356018  ! 730: SUBC_I	orn 	%r21, 0x0018, %r28
	.word 0xfc458000  ! 732: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xb5500000  ! 733: RDPR_TPC	<illegal instruction>
	.word 0xf405e070  ! 736: LDUW_I	lduw	[%r23 + 0x0070], %r26
	.word 0xf71d4000  ! 738: LDDF_R	ldd	[%r21, %r0], %f27
	setx	0x139b502900003d85, %g1, %r10
	.word 0x839a8000  ! 739: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf85de1b5  ! 741: LDX_I	ldx	[%r23 + 0x01b5], %r28
	.word 0xb151c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x91952006  ! 743: WRPR_PIL_I	wrpr	%r20, 0x0006, %pil
	.word 0xfd1c2126  ! 744: LDDF_I	ldd	[%r16, 0x0126], %f30
	.word 0xfa5dc000  ! 746: LDX_R	ldx	[%r23 + %r0], %r29
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc446108  ! 751: LDSW_I	ldsw	[%r17 + 0x0108], %r30
	.word 0xfa0dc000  ! 752: LDUB_R	ldub	[%r23 + %r0], %r29
	setx	0xe60e82ce00003ed0, %g1, %r10
	.word 0x839a8000  ! 753: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf24dc000  ! 754: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0x8795216b  ! 756: WRPR_TT_I	wrpr	%r20, 0x016b, %tt
	.word 0xf014a137  ! 757: LDUH_I	lduh	[%r18 + 0x0137], %r24
	.word 0xb6bd4000  ! 758: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xb81d8000  ! 760: XOR_R	xor 	%r22, %r0, %r28
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41de0b4  ! 767: LDD_I	ldd	[%r23 + 0x00b4], %r26
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1de0d3  ! 770: XOR_I	xor 	%r23, 0x00d3, %r30
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71c4000  ! 772: LDDF_R	ldd	[%r17, %r0], %f27
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51d6030  ! 774: LDDF_I	ldd	[%r21, 0x0030], %f26
	.word 0xfe0de1ce  ! 786: LDUB_I	ldub	[%r23 + 0x01ce], %r31
	mov	2, %r12
	.word 0x8f930000  ! 792: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf51c21b1  ! 793: LDDF_I	ldd	[%r16, 0x01b1], %f26
	.word 0xb3359000  ! 796: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xf204a005  ! 799: LDUW_I	lduw	[%r18 + 0x0005], %r25
	.word 0xf84cc000  ! 800: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0x85952166  ! 802: WRPR_TSTATE_I	wrpr	%r20, 0x0166, %tstate
	.word 0x8794e1cf  ! 804: WRPR_TT_I	wrpr	%r19, 0x01cf, %tt
	mov	2, %r12
	.word 0x8f930000  ! 807: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xff1de1a3  ! 809: LDDF_I	ldd	[%r23, 0x01a3], %f31
	.word 0x8795a1b3  ! 810: WRPR_TT_I	wrpr	%r22, 0x01b3, %tt
	.word 0xf40d4000  ! 811: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfc15a1c7  ! 814: LDUH_I	lduh	[%r22 + 0x01c7], %r30
	.word 0xb93c8000  ! 817: SRA_R	sra 	%r18, %r0, %r28
	.word 0x9194e190  ! 819: WRPR_PIL_I	wrpr	%r19, 0x0190, %pil
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfd1c614b  ! 823: LDDF_I	ldd	[%r17, 0x014b], %f30
	.word 0xfc5d61e8  ! 824: LDX_I	ldx	[%r21 + 0x01e8], %r30
	.word 0xb084c000  ! 825: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0x91946080  ! 827: WRPR_PIL_I	wrpr	%r17, 0x0080, %pil
	.word 0xf44c61f2  ! 828: LDSB_I	ldsb	[%r17 + 0x01f2], %r26
	.word 0xba0d4000  ! 829: AND_R	and 	%r21, %r0, %r29
	.word 0xb7508000  ! 830: RDPR_TSTATE	<illegal instruction>
	.word 0xbb3d9000  ! 831: SRAX_R	srax	%r22, %r0, %r29
	.word 0xfc14a118  ! 833: LDUH_I	lduh	[%r18 + 0x0118], %r30
	.word 0xfe1cc000  ! 834: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf20d21b8  ! 835: LDUB_I	ldub	[%r20 + 0x01b8], %r25
	.word 0xb2ac8000  ! 839: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xbc2d8000  ! 842: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xf61d4000  ! 843: LDD_R	ldd	[%r21 + %r0], %r27
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55c000  ! 845: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf04c604e  ! 849: LDSB_I	ldsb	[%r17 + 0x004e], %r24
	.word 0xf40c0000  ! 851: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xb485c000  ! 852: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xf41d2115  ! 853: LDD_I	ldd	[%r20 + 0x0115], %r26
	setx	data_start_1, %g1, %r22
	.word 0xb89c2032  ! 857: XORcc_I	xorcc 	%r16, 0x0032, %r28
	.word 0xf61dc000  ! 858: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf6448000  ! 860: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0x8d94e131  ! 862: WRPR_PSTATE_I	wrpr	%r19, 0x0131, %pstate
	.word 0xfc45e114  ! 864: LDSW_I	ldsw	[%r23 + 0x0114], %r30
	.word 0xb824a0fc  ! 868: SUB_I	sub 	%r18, 0x00fc, %r28
	.word 0xf6052098  ! 872: LDUW_I	lduw	[%r20 + 0x0098], %r27
	.word 0xf4154000  ! 873: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0x899461e4  ! 876: WRPR_TICK_I	wrpr	%r17, 0x01e4, %tick
	.word 0xfc4da09b  ! 877: LDSB_I	ldsb	[%r22 + 0x009b], %r30
	.word 0xbd540000  ! 879: RDPR_GL	<illegal instruction>
	.word 0xf814e0fa  ! 880: LDUH_I	lduh	[%r19 + 0x00fa], %r28
	.word 0xf4544000  ! 884: LDSH_R	ldsh	[%r17 + %r0], %r26
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91d8000  ! 893: LDDF_R	ldd	[%r22, %r0], %f28
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55e1d6  ! 896: LDSH_I	ldsh	[%r23 + 0x01d6], %r31
	.word 0xf41c0000  ! 898: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xbb540000  ! 901: RDPR_GL	<illegal instruction>
	.word 0xb7504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xf415605e  ! 904: LDUH_I	lduh	[%r21 + 0x005e], %r26
	.word 0xf0048000  ! 909: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf25c8000  ! 910: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xb550c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x9195a0d7  ! 912: WRPR_PIL_I	wrpr	%r22, 0x00d7, %pil
	.word 0xb204a005  ! 915: ADD_I	add 	%r18, 0x0005, %r25
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b44000  ! 922: SUBCcc_R	orncc 	%r17, %r0, %r25
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe442084  ! 926: LDSW_I	ldsw	[%r16 + 0x0084], %r31
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	setx	0x6b70c4ac00007d90, %g1, %r10
	.word 0x839a8000  ! 930: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394e0de  ! 932: WRPR_TNPC_I	wrpr	%r19, 0x00de, %tnpc
	.word 0xf61c2024  ! 933: LDD_I	ldd	[%r16 + 0x0024], %r27
	.word 0xfa0c212b  ! 934: LDUB_I	ldub	[%r16 + 0x012b], %r29
	.word 0xfe1d6049  ! 937: LDD_I	ldd	[%r21 + 0x0049], %r31
	.word 0xf61d4000  ! 941: LDD_R	ldd	[%r21 + %r0], %r27
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	setx	0x305517090000da15, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c0000  ! 956: LDX_R	ldx	[%r16 + %r0], %r29
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44ce011  ! 967: LDSB_I	ldsb	[%r19 + 0x0011], %r26
	.word 0xfc4cc000  ! 968: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfe1d60f3  ! 974: LDD_I	ldd	[%r21 + 0x00f3], %r31
	.word 0xfa04c000  ! 977: LDUW_R	lduw	[%r19 + %r0], %r29
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805619d  ! 981: LDUW_I	lduw	[%r21 + 0x019d], %r28
	.word 0xb950c000  ! 983: RDPR_TT	rdpr	%tt, %r28
	.word 0xf51c4000  ! 984: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0x8594a1d5  ! 985: WRPR_TSTATE_I	wrpr	%r18, 0x01d5, %tstate
	.word 0xb33c2001  ! 987: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xf01cc000  ! 988: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf45d4000  ! 993: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xbd50c000  ! 995: RDPR_TT	<illegal instruction>
	.word 0xfe1c205a  ! 996: LDD_I	ldd	[%r16 + 0x005a], %r31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x89946067  ! 3: WRPR_TICK_I	wrpr	%r17, 0x0067, %tick
	.word 0xbf480000  ! 4: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9a449a0  ! 5: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb1a48940  ! 6: FMULd	fmuld	%f18, %f0, %f24
	.word 0xbcb5c000  ! 9: ORNcc_R	orncc 	%r23, %r0, %r30
	setx	0x24f03e47000008d6, %g1, %r10
	.word 0x839a8000  ! 14: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba94216a  ! 16: ORcc_I	orcc 	%r16, 0x016a, %r29
	.word 0xb350c000  ! 19: RDPR_TT	<illegal instruction>
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549a0  ! 23: FDIVs	fdivs	%f21, %f0, %f29
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 27: FMOVE	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 35: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_6, %g1, %r22
	.word 0xb9500000  ! 41: RDPR_TPC	<illegal instruction>
	.word 0xb1aa0820  ! 45: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa8820  ! 47: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb8a5c000  ! 48: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xb1aa0820  ! 49: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbba84820  ! 51: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbda98820  ! 55: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a44820  ! 56: FADDs	fadds	%f17, %f0, %f26
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 59: RDPR_TSTATE	<illegal instruction>
	.word 0xb5aa4820  ! 60: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a94820  ! 74: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa8820  ! 75: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb0ace1de  ! 76: ANDNcc_I	andncc 	%r19, 0x01de, %r24
	.word 0x8195a1e3  ! 83: WRPR_TPC_I	wrpr	%r22, 0x01e3, %tpc
	.word 0xb9a44860  ! 84: FADDq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 87: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a489c0  ! 92: FDIVd	fdivd	%f18, %f0, %f28
	setx	0x220e467b0000198a, %g1, %r10
	.word 0x819a8000  ! 95: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8994e080  ! 96: WRPR_TICK_I	wrpr	%r19, 0x0080, %tick
	.word 0xb5abc820  ! 97: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba509a0  ! 98: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xbfa94820  ! 99: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x85952153  ! 101: WRPR_TSTATE_I	wrpr	%r20, 0x0153, %tstate
	.word 0xb1a00560  ! 102: FSQRTq	fsqrt	
	.word 0xb7a50860  ! 106: FADDq	dis not found

	.word 0xb7540000  ! 107: RDPR_GL	<illegal instruction>
	.word 0x8d95a0b7  ! 110: WRPR_PSTATE_I	wrpr	%r22, 0x00b7, %pstate
	.word 0xb1a94820  ! 112: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbda448a0  ! 113: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb5a48960  ! 117: FMULq	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 119: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8995a11b  ! 121: WRPR_TICK_I	wrpr	%r22, 0x011b, %tick
	.word 0xb3a00560  ! 122: FSQRTq	fsqrt	
	.word 0x91952159  ! 125: WRPR_PIL_I	wrpr	%r20, 0x0159, %pil
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 129: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a448a0  ! 135: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb60cc000  ! 136: AND_R	and 	%r19, %r0, %r27
	.word 0xb5ab0820  ! 138: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbbab4820  ! 139: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba84820  ! 141: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x8795e178  ! 145: WRPR_TT_I	wrpr	%r23, 0x0178, %tt
	.word 0xbdab0820  ! 146: FMOVGU	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 147: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfa488e0  ! 150: FSUBq	dis not found

	setx	data_start_5, %g1, %r17
	.word 0xbfa54920  ! 153: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb0bd0000  ! 157: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xbba44920  ! 158: FMULs	fmuls	%f17, %f0, %f29
	.word 0xb3a00560  ! 165: FSQRTq	fsqrt	
	.word 0x8194e047  ! 167: WRPR_TPC_I	wrpr	%r19, 0x0047, %tpc
	.word 0xb9500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0xb5a50840  ! 169: FADDd	faddd	%f20, %f0, %f26
	.word 0xb9ab0820  ! 170: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a81820  ! 174: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3a81c20  ! 176: FMOVRGEZ	dis not found

	.word 0xb1a48820  ! 178: FADDs	fadds	%f18, %f0, %f24
	.word 0xbd510000  ! 183: RDPR_TICK	<illegal instruction>
	.word 0xbfa44860  ! 184: FADDq	dis not found

	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	setx	0x36b5a5c800008ed8, %g1, %r10
	.word 0x819a8000  ! 190: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda40820  ! 191: FADDs	fadds	%f16, %f0, %f30
	.word 0xb7480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbaa0820  ! 193: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda4c820  ! 196: FADDs	fadds	%f19, %f0, %f30
	.word 0xb7a00540  ! 198: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 201: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb151c000  ! 204: RDPR_TL	<illegal instruction>
	.word 0xb0b56155  ! 206: SUBCcc_I	orncc 	%r21, 0x0155, %r24
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40860  ! 212: FADDq	dis not found

	.word 0xb7ab8820  ! 216: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda80820  ! 219: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9a88820  ! 221: FMOVLE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a5c940  ! 230: FMULd	fmuld	%f54, %f0, %f56
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 232: FMOVRNZ	dis not found

	.word 0xbba5c9a0  ! 238: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xbda81820  ! 242: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbe34a1a8  ! 243: SUBC_I	orn 	%r18, 0x01a8, %r31
	.word 0xbda81420  ! 244: FMOVRNZ	dis not found

	.word 0xb9a00040  ! 245: FMOVd	fmovd	%f0, %f28
	.word 0x8795a1ff  ! 246: WRPR_TT_I	wrpr	%r22, 0x01ff, %tt
	.word 0xb3500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0xb9518000  ! 248: RDPR_PSTATE	<illegal instruction>
	.word 0xb7abc820  ! 251: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0x8395a120  ! 252: WRPR_TNPC_I	wrpr	%r22, 0x0120, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 253: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa488e0  ! 255: FSUBq	dis not found

	.word 0xb3a88820  ! 258: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xbeb5606b  ! 270: SUBCcc_I	orncc 	%r21, 0x006b, %r31
	.word 0xbda4c8c0  ! 271: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbda98820  ! 272: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba00020  ! 275: FMOVs	fmovs	%f0, %f29
	.word 0xb1aac820  ! 276: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a9c820  ! 278: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x8795a0ad  ! 279: WRPR_TT_I	wrpr	%r22, 0x00ad, %tt
	mov	2, %r12
	.word 0xa1930000  ! 281: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda80420  ! 286: FMOVRZ	dis not found

	.word 0xbf51c000  ! 288: RDPR_TL	<illegal instruction>
	setx	0xed30e7e900001dc6, %g1, %r10
	.word 0x819a8000  ! 289: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x819420ff  ! 291: WRPR_TPC_I	wrpr	%r16, 0x00ff, %tpc
	.word 0xb5aac820  ! 292: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x9194a1d3  ! 293: WRPR_PIL_I	wrpr	%r18, 0x01d3, %pil
	.word 0xb9ab0820  ! 294: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80820  ! 296: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab8820  ! 301: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a488a0  ! 302: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb88521d7  ! 303: ADDcc_I	addcc 	%r20, 0x01d7, %r28
	.word 0xb5a84820  ! 304: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 306: FMOVN	fmovs	%fcc1, %f0, %f28
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488a0  ! 308: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xbba44940  ! 314: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb5a00540  ! 317: FSQRTd	fsqrt	
	.word 0x8394a1a7  ! 318: WRPR_TNPC_I	wrpr	%r18, 0x01a7, %tnpc
	.word 0xb1a4c920  ! 319: FMULs	fmuls	%f19, %f0, %f24
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 323: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb2b4c000  ! 326: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xbba449a0  ! 329: FDIVs	fdivs	%f17, %f0, %f29
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 336: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb750c000  ! 337: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r16
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35c000  ! 348: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xb1a00560  ! 349: FSQRTq	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 359: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xbbab4820  ! 361: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbaade16a  ! 363: ANDNcc_I	andncc 	%r23, 0x016a, %r29
	.word 0xb5a81420  ! 364: FMOVRNZ	dis not found

	setx	data_start_1, %g1, %r20
	.word 0xb5ab8820  ! 369: FMOVPOS	fmovs	%fcc1, %f0, %f26
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 372: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r19
	.word 0xbfa98820  ! 374: FMOVNEG	fmovs	%fcc1, %f0, %f31
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	setx	0x355d0c8a00009acf, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb4c40000  ! 383: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xbeb5e1bc  ! 386: ORNcc_I	orncc 	%r23, 0x01bc, %r31
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d942081  ! 390: WRPR_PSTATE_I	wrpr	%r16, 0x0081, %pstate
	.word 0xb9a5c820  ! 391: FADDs	fadds	%f23, %f0, %f28
	.word 0xb1a50820  ! 392: FADDs	fadds	%f20, %f0, %f24
	.word 0xbfa58940  ! 393: FMULd	fmuld	%f22, %f0, %f62
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488c0  ! 396: FSUBd	fsubd	%f18, %f0, %f24
	setx	data_start_6, %g1, %r16
	.word 0x8d94a172  ! 399: WRPR_PSTATE_I	wrpr	%r18, 0x0172, %pstate
	.word 0xb5aac820  ! 400: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a90820  ! 404: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a44940  ! 407: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb3ab4820  ! 412: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa0820  ! 414: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5a9c820  ! 416: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbf518000  ! 419: RDPR_PSTATE	<illegal instruction>
	setx	0xdcdb8eb900002858, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda58960  ! 429: FMULq	dis not found

	.word 0x879460b0  ! 430: WRPR_TT_I	wrpr	%r17, 0x00b0, %tt
	.word 0xb9ab4820  ! 440: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x91942043  ! 442: WRPR_PIL_I	wrpr	%r16, 0x0043, %pil
	.word 0xbfa50820  ! 446: FADDs	fadds	%f20, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d952097  ! 448: WRPR_PSTATE_I	wrpr	%r20, 0x0097, %pstate
	.word 0xb3500000  ! 449: RDPR_TPC	<illegal instruction>
	.word 0xb3a80420  ! 452: FMOVRZ	dis not found

	setx	data_start_3, %g1, %r16
	.word 0xbba94820  ! 455: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbf508000  ! 456: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 459: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda80820  ! 460: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44840  ! 465: FADDd	faddd	%f48, %f0, %f56
	setx	data_start_0, %g1, %r21
	.word 0xbe9560ac  ! 472: ORcc_I	orcc 	%r21, 0x00ac, %r31
	.word 0xb01d606d  ! 474: XOR_I	xor 	%r21, 0x006d, %r24
	.word 0xbd51c000  ! 475: RDPR_TL	<illegal instruction>
	.word 0xb5a98820  ! 478: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa0820  ! 480: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa0820  ! 481: FMOVA	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0xa1930000  ! 482: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf480000  ! 484: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb62ca1fd  ! 485: ANDN_I	andn 	%r18, 0x01fd, %r27
	mov	0, %r12
	.word 0xa1930000  ! 486: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xf762066600000c09, %g1, %r10
	.word 0x819a8000  ! 491: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1abc820  ! 493: FMOVVC	fmovs	%fcc1, %f0, %f24
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 498: FMOVRZ	dis not found

	.word 0xbb50c000  ! 499: RDPR_TT	<illegal instruction>
	.word 0xb5a81820  ! 500: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb28ca067  ! 501: ANDcc_I	andcc 	%r18, 0x0067, %r25
	.word 0xbda00520  ! 502: FSQRTs	fsqrt	
	.word 0x8595a009  ! 507: WRPR_TSTATE_I	wrpr	%r22, 0x0009, %tstate
	.word 0xbfa00040  ! 512: FMOVd	fmovd	%f0, %f62
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 521: RDPR_PSTATE	<illegal instruction>
	.word 0xbb500000  ! 522: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r17
	.word 0xb1520000  ! 528: RDPR_PIL	<illegal instruction>
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 530: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 531: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbd518000  ! 534: RDPR_PSTATE	<illegal instruction>
	.word 0xb09d0000  ! 537: XORcc_R	xorcc 	%r20, %r0, %r24
	.word 0x8595a092  ! 539: WRPR_TSTATE_I	wrpr	%r22, 0x0092, %tstate
	.word 0xb151c000  ! 540: RDPR_TL	<illegal instruction>
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda44940  ! 545: FMULd	fmuld	%f48, %f0, %f30
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 549: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 551: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 552: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a81820  ! 553: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbdaa4820  ! 556: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	data_start_2, %g1, %r20
	.word 0x839461c6  ! 560: WRPR_TNPC_I	wrpr	%r17, 0x01c6, %tnpc
	.word 0xb1a40860  ! 564: FADDq	dis not found

	.word 0xbfa90820  ! 565: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbda8c820  ! 567: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb9a81820  ! 569: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb2b5a0a8  ! 578: SUBCcc_I	orncc 	%r22, 0x00a8, %r25
	.word 0xbba488a0  ! 579: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xbf518000  ! 585: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa489e0  ! 587: FDIVq	dis not found

	.word 0x879520e8  ! 591: WRPR_TT_I	wrpr	%r20, 0x00e8, %tt
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58920  ! 596: FMULs	fmuls	%f22, %f0, %f30
	.word 0xbb520000  ! 599: RDPR_PIL	<illegal instruction>
	.word 0xb9500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xbfa84820  ! 601: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda58820  ! 606: FADDs	fadds	%f22, %f0, %f30
	.word 0xbda00520  ! 610: FSQRTs	fsqrt	
	.word 0xbb508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0xb61ce057  ! 614: XOR_I	xor 	%r19, 0x0057, %r27
	.word 0xb0b5e042  ! 617: SUBCcc_I	orncc 	%r23, 0x0042, %r24
	.word 0xb7504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb1510000  ! 620: RDPR_TICK	<illegal instruction>
	.word 0xb5a48960  ! 623: FMULq	dis not found

	.word 0xb9a44960  ! 626: FMULq	dis not found

	.word 0xbdaa8820  ! 630: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb334a001  ! 634: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0x8d95206a  ! 635: WRPR_PSTATE_I	wrpr	%r20, 0x006a, %pstate
	setx	0xd67b6ee200009e54, %g1, %r10
	.word 0x819a8000  ! 636: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a9c820  ! 637: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00560  ! 638: FSQRTq	fsqrt	
	.word 0xb3a40960  ! 639: FMULq	dis not found

	.word 0xb7a48820  ! 640: FADDs	fadds	%f18, %f0, %f27
	.word 0xb5500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0x8394611f  ! 643: WRPR_TNPC_I	wrpr	%r17, 0x011f, %tnpc
	.word 0xb2aca014  ! 644: ANDNcc_I	andncc 	%r18, 0x0014, %r25
	.word 0x8d95a057  ! 651: WRPR_PSTATE_I	wrpr	%r22, 0x0057, %pstate
	.word 0xbba98820  ! 657: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0x8194a142  ! 662: WRPR_TPC_I	wrpr	%r18, 0x0142, %tpc
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0xbe348000  ! 671: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb9a80820  ! 672: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb7508000  ! 674: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a448e0  ! 675: FSUBq	dis not found

	.word 0x9195e0aa  ! 676: WRPR_PIL_I	wrpr	%r23, 0x00aa, %pil
	.word 0xba95a16f  ! 679: ORcc_I	orcc 	%r22, 0x016f, %r29
	.word 0xb151c000  ! 682: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00560  ! 688: FSQRTq	fsqrt	
	setx	0x68c386810000d902, %g1, %r10
	.word 0x839a8000  ! 690: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba449c0  ! 692: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbf518000  ! 695: RDPR_PSTATE	<illegal instruction>
	.word 0xb350c000  ! 696: RDPR_TT	<illegal instruction>
	.word 0xb3a548a0  ! 698: FSUBs	fsubs	%f21, %f0, %f25
	.word 0x8d952108  ! 705: WRPR_PSTATE_I	wrpr	%r20, 0x0108, %pstate
	.word 0xb3a449c0  ! 706: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xbfa4c9c0  ! 708: FDIVd	fdivd	%f50, %f0, %f62
	mov	2, %r12
	.word 0x8f930000  ! 710: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7518000  ! 713: RDPR_PSTATE	<illegal instruction>
	.word 0xbda48840  ! 716: FADDd	faddd	%f18, %f0, %f30
	.word 0xbba54840  ! 717: FADDd	faddd	%f52, %f0, %f60
	setx	0x1dc77b3700000991, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3abc820  ! 719: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb234219a  ! 721: ORN_I	orn 	%r16, 0x019a, %r25
	.word 0xbe150000  ! 723: OR_R	or 	%r20, %r0, %r31
	.word 0xb9a81420  ! 725: FMOVRNZ	dis not found

	.word 0xb9a80420  ! 729: FMOVRZ	dis not found

	.word 0xbc3420d3  ! 730: SUBC_I	orn 	%r16, 0x00d3, %r30
	.word 0xb7a00020  ! 731: FMOVs	fmovs	%f0, %f27
	.word 0xbf500000  ! 733: RDPR_TPC	<illegal instruction>
	.word 0xb5a9c820  ! 737: FMOVVS	fmovs	%fcc1, %f0, %f26
	setx	0xc17bf1e50000bb5c, %g1, %r10
	.word 0x839a8000  ! 739: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb751c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x9195a15a  ! 743: WRPR_PIL_I	wrpr	%r22, 0x015a, %pil
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549a0  ! 750: FDIVs	fdivs	%f21, %f0, %f26
	setx	0x29b06aa90000ac83, %g1, %r10
	.word 0x839a8000  ! 753: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a588a0  ! 755: FSUBs	fsubs	%f22, %f0, %f25
	.word 0x8795a1b8  ! 756: WRPR_TT_I	wrpr	%r22, 0x01b8, %tt
	.word 0xb2bd4000  ! 758: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xbc1d0000  ! 760: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb3a98820  ! 761: FMOVNEG	fmovs	%fcc1, %f0, %f25
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c2112  ! 770: XOR_I	xor 	%r16, 0x0112, %r31
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 775: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa4820  ! 777: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a4c960  ! 778: FMULq	dis not found

	.word 0xb5a5c920  ! 780: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb9a90820  ! 787: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a40960  ! 788: FMULq	dis not found

	.word 0xb1a94820  ! 791: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f930000  ! 792: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a4c920  ! 795: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb1355000  ! 796: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xbda488e0  ! 798: FSUBq	dis not found

	.word 0xb7a00540  ! 801: FSQRTd	fsqrt	
	.word 0x8595a073  ! 802: WRPR_TSTATE_I	wrpr	%r22, 0x0073, %tstate
	.word 0x879421ac  ! 804: WRPR_TT_I	wrpr	%r16, 0x01ac, %tt
	.word 0xbda81c20  ! 805: FMOVRGEZ	dis not found

	.word 0xb5a81420  ! 806: FMOVRNZ	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 807: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8794605c  ! 810: WRPR_TT_I	wrpr	%r17, 0x005c, %tt
	.word 0xbfa5c8a0  ! 812: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xbd3c8000  ! 817: SRA_R	sra 	%r18, %r0, %r30
	.word 0x91952053  ! 819: WRPR_PIL_I	wrpr	%r20, 0x0053, %pil
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb884c000  ! 825: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0x9195e069  ! 827: WRPR_PIL_I	wrpr	%r23, 0x0069, %pil
	.word 0xba0c0000  ! 829: AND_R	and 	%r16, %r0, %r29
	.word 0xbd508000  ! 830: RDPR_TSTATE	<illegal instruction>
	.word 0xb53dd000  ! 831: SRAX_R	srax	%r23, %r0, %r26
	.word 0xbba4c8c0  ! 836: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb3a8c820  ! 838: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb8ac0000  ! 839: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xb9a5c860  ! 841: FADDq	dis not found

	.word 0xb62d4000  ! 842: ANDN_R	andn 	%r21, %r0, %r27
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c860  ! 850: FADDq	dis not found

	.word 0xb0858000  ! 852: ADDcc_R	addcc 	%r22, %r0, %r24
	setx	data_start_1, %g1, %r17
	.word 0xb7a4c920  ! 855: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb7a81420  ! 856: FMOVRNZ	dis not found

	.word 0xb49de0e6  ! 857: XORcc_I	xorcc 	%r23, 0x00e6, %r26
	.word 0xb3a58920  ! 861: FMULs	fmuls	%f22, %f0, %f25
	.word 0x8d95a0d1  ! 862: WRPR_PSTATE_I	wrpr	%r22, 0x00d1, %pstate
	.word 0xb3a90820  ! 867: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xba2561c6  ! 868: SUB_I	sub 	%r21, 0x01c6, %r29
	.word 0xbda50960  ! 870: FMULq	dis not found

	.word 0x8995a159  ! 876: WRPR_TICK_I	wrpr	%r22, 0x0159, %tick
	.word 0xb1540000  ! 879: RDPR_GL	<illegal instruction>
	.word 0xbda8c820  ! 881: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb3ab8820  ! 885: FMOVPOS	fmovs	%fcc1, %f0, %f25
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588a0  ! 888: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb1a509a0  ! 889: FDIVs	fdivs	%f20, %f0, %f24
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 901: RDPR_GL	<illegal instruction>
	.word 0xbf504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xb9a58820  ! 907: FADDs	fadds	%f22, %f0, %f28
	.word 0xb3a9c820  ! 908: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb550c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x9194a1b3  ! 912: WRPR_PIL_I	wrpr	%r18, 0x01b3, %pil
	.word 0xb1ab0820  ! 913: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a50940  ! 914: FMULd	fmuld	%f20, %f0, %f26
	.word 0xba042026  ! 915: ADD_I	add 	%r16, 0x0026, %r29
	.word 0xb9a00560  ! 916: FSQRTq	fsqrt	
	.word 0xbda509a0  ! 917: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbfab4820  ! 918: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb58000  ! 922: SUBCcc_R	orncc 	%r22, %r0, %r31
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	setx	0xaaa516df00008c96, %g1, %r10
	.word 0x839a8000  ! 930: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5aa0820  ! 931: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x8395a1b9  ! 932: WRPR_TNPC_I	wrpr	%r22, 0x01b9, %tnpc
	.word 0xbbaac820  ! 935: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa4c8c0  ! 943: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb5a81820  ! 944: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb5a81820  ! 949: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9a488c0  ! 950: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbfab8820  ! 951: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a54820  ! 952: FADDs	fadds	%f21, %f0, %f24
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	setx	0x2b8ee8a800005ec6, %g1, %r10
	.word 0x819a8000  ! 954: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c940  ! 957: FMULd	fmuld	%f54, %f0, %f60
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40960  ! 964: FMULq	dis not found

	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 973: FMOVRZ	dis not found

	.word 0xbfa81c20  ! 975: FMOVRGEZ	dis not found

	.word 0xbfa80c20  ! 976: FMOVRLZ	dis not found

	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 979: FSQRTd	fsqrt	
	.word 0xb9a81820  ! 980: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb150c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0x8594e197  ! 985: WRPR_TSTATE_I	wrpr	%r19, 0x0197, %tstate
	.word 0xbb3d6001  ! 987: SRA_I	sra 	%r21, 0x0001, %r29
	.word 0xbbaa0820  ! 991: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa588e0  ! 992: FSUBq	dis not found

	.word 0xbd50c000  ! 995: RDPR_TT	<illegal instruction>
	.word 0xb7aa8820  ! 998: FMOVG	fmovs	%fcc1, %f0, %f27

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

	.xword	0x889242fd9fb14ab1
	.xword	0xc0065ba5905c5caa
	.xword	0x4ece411f59aaca97
	.xword	0x069585562529d826
	.xword	0x3c80cf74279fd264
	.xword	0xbe86f79d6ebca4a3
	.xword	0x83f92d39c36a7556
	.xword	0xf9e0b6dcfe4a9cbb
	.xword	0xf442a98553202c1a
	.xword	0xcc3e40ea6908a00f
	.xword	0x00bf984ef09d8eed
	.xword	0xedc00fbd25462a53
	.xword	0x05c240eb92e0fbf7
	.xword	0xef9d4a9a7b71af74
	.xword	0xd318daba0020d876
	.xword	0x4163e714320820f6
	.xword	0xbfb1ce77ed6bd7e2
	.xword	0x44aaa327f71a0e1c
	.xword	0x4dbb41a99207e72f
	.xword	0x3dfce9707a461198
	.xword	0x2f8eff7ec0e46686
	.xword	0xab064b6327a86be1
	.xword	0x5322825fe88dc7ce
	.xword	0xc7a50c7edad7664e
	.xword	0xb6d2a753b037d89d
	.xword	0xfe7257c3e537e48e
	.xword	0xb728733ef402fc0d
	.xword	0x483b31a205a9c9ce
	.xword	0xd3fed391a39a039d
	.xword	0x69717d400d2641c1
	.xword	0xacf25a808c125510
	.xword	0x09a7cb08f0409fa8
	.xword	0xf82fe26f3c9b6ebf
	.xword	0xc0aa6adf05f25589
	.xword	0x40d4663411a78a1f
	.xword	0x69fae596becec382
	.xword	0x9a361f79c4a8b00b
	.xword	0x4f9cde460db6d0d4
	.xword	0x2c84f45bf02d4790
	.xword	0x51f1dddf996c37cc
	.xword	0x966ec92dc5224722
	.xword	0xd2ecf32fa429627f
	.xword	0xab723af0698c3fae
	.xword	0x9cc5d9d651c19999
	.xword	0x3c7584c47a320e21
	.xword	0xe854610781673aad
	.xword	0x40e61ee6cc9768b6
	.xword	0x01d6904c8baa96c1
	.xword	0x14ac28aeada5caf8
	.xword	0xe8c764f2ca84b492
	.xword	0xc46f88cfa8864494
	.xword	0xecc955229e8760e1
	.xword	0x56c59e3261b2f132
	.xword	0xb6296733d1538ca2
	.xword	0xe7696e41932f7558
	.xword	0xb7fa61c1228b3ff9
	.xword	0xdaaae121bbc49a5a
	.xword	0xfa929ed4fe404727
	.xword	0x27d79fed6a2d21f3
	.xword	0xde294d921b5b7d50
	.xword	0x11a95a2732362125
	.xword	0xf06f81eeb67edb87
	.xword	0x14c839a3d62a89bf
	.xword	0xf7c80fd874e31b73
	.xword	0xd92ae10cd3f56812
	.xword	0x9a8e1c3f700cdbdc
	.xword	0x6d9bfba919fd7be3
	.xword	0x526ce022d21972a4
	.xword	0x82f3833110808e02
	.xword	0xf6131ce6a87fa7fd
	.xword	0x17e97f6fdf0f39e5
	.xword	0x60da1ca31c8bc433
	.xword	0xa37e27c912465e63
	.xword	0xae2e149aea6b96c2
	.xword	0x180cb134e15cb08c
	.xword	0x30fb13ffc960c729
	.xword	0x917a08c2ad573f97
	.xword	0x37d4d326f0a81f63
	.xword	0x7797a9a8e2f9f595
	.xword	0x9bf6c5fbd7a7d2b6
	.xword	0xe22db43a1776af2d
	.xword	0x4c93d8768ca04040
	.xword	0x5e105c6a233417cd
	.xword	0xb3896f38b73e93f8
	.xword	0x1f2f0090e60bd3ec
	.xword	0xec9930d84b889077
	.xword	0xb1a01baa86fba1ed
	.xword	0x606f700cda9aa3f5
	.xword	0xb9f1799fec19880f
	.xword	0xbecbebb05914d480
	.xword	0xcdf8e0aecec2a104
	.xword	0x2a9783e6c9bd7b0f
	.xword	0x2dd5ba61c259dcb6
	.xword	0x1f959efd63e4bc29
	.xword	0xfb9c8a0f9360c250
	.xword	0x46416645831c954b
	.xword	0xfe4532a06f380534
	.xword	0xc4b542a5e2131168
	.xword	0x35e414fe0ed32d5b
	.xword	0x71f6e3d56ee6659c
	.xword	0xbc61cb1fd5c4bb25
	.xword	0x23f316adc33ef0bd
	.xword	0x0f1d6c11d7fdbb45
	.xword	0x20dcb434974cda19
	.xword	0x234138f438414495
	.xword	0x074cf4a2ed17ccb5
	.xword	0x7adb78b5c8625470
	.xword	0x7e44a803d45e6e8f
	.xword	0x7987559854040f97
	.xword	0xf89e97c1c2e88d63
	.xword	0x738002c18394dfcf
	.xword	0xc164f6c12f25785d
	.xword	0xa3d4a556313e77be
	.xword	0xf1673de902120858
	.xword	0x8b466e73acef3aab
	.xword	0x500fa5b023813635
	.xword	0xaa1cb7fff2841694
	.xword	0xfb92ffe92b1744c0
	.xword	0x01e28d00137981f8
	.xword	0xec4978f1bb82bc3d
	.xword	0x2d49320cb22f2ed2
	.xword	0xb653d4541e793b36
	.xword	0xddc0dc81fef67dd3
	.xword	0xa6bfb5d204ec8199
	.xword	0x65f1311c7c3954cd
	.xword	0x86fdab591d58e232
	.xword	0x54e74c27754d5db6
	.xword	0x39b90980885d6e9c
	.xword	0x64eb651d4ad79f0a
	.xword	0x55cd31b0476b191c
	.xword	0xa55dfe55216a9444
	.xword	0xce0ce6844f529c3f
	.xword	0xb18fdbc72aceb871
	.xword	0xea2e5ef6dc0f91ca
	.xword	0xd89b913c8d016e75
	.xword	0x57b6cfa35174c788
	.xword	0x2a292f57961138e2
	.xword	0xc0618deea16953d0
	.xword	0xd040af5c3bd41573
	.xword	0x9620e3f79e757b41
	.xword	0x4826eebec6f8b370
	.xword	0x16bae64070a9d0f8
	.xword	0x318d2bbcadc63e31
	.xword	0x6de38fe75612ef10
	.xword	0x6d5b34bc28dc2383
	.xword	0xd469d5ccbcc7bdf6
	.xword	0xfddd55873e782c82
	.xword	0xe2eb9a206bf8bd33
	.xword	0x7ad8de47e116f16d
	.xword	0x57f7072209f79ce6
	.xword	0x3e1231d807fd920f
	.xword	0x9b04a52f220bee73
	.xword	0x3a4ca3fdf863fd18
	.xword	0xc340a3aa3f5ea989
	.xword	0x8345e7fd287f4c34
	.xword	0x23d8c95764c77563
	.xword	0x1340fa478e6ea600
	.xword	0x847327c17dca66f2
	.xword	0xb9f671de55bcba0e
	.xword	0xc0f7d5400edc01a2
	.xword	0x79059152944b7a0b
	.xword	0x61041bfc3e79fc09
	.xword	0xe83f2af68d7b3666
	.xword	0x24b8f055be9d318a
	.xword	0x4d51c28b87562bf3
	.xword	0x54bc8bff6eb8d9b7
	.xword	0x710c6e6e105dae35
	.xword	0xaa3619b9a39fc3a0
	.xword	0xc49390ab12a9486d
	.xword	0x1f6f3eb62e26c1fa
	.xword	0x1146a403b2596c02
	.xword	0xf77b480675413c03
	.xword	0x4181f1d575451b8f
	.xword	0xf48d45856c2b15a7
	.xword	0x99639dc663ba7e58
	.xword	0x64a3d3959d339bbe
	.xword	0x5188d9fb6c2d21d7
	.xword	0x8e5efd2c64e5c176
	.xword	0x11c059643ea0c418
	.xword	0x2c3e90563f396a16
	.xword	0xcf2141d25cf42f80
	.xword	0xf8005513a3c2fa6a
	.xword	0x691c3f7c336c6f37
	.xword	0x982b760c23b271b9
	.xword	0xe9d4a630f54c087b
	.xword	0xe55ce06f2b8dc2c8
	.xword	0xc28a7b021e213833
	.xword	0x4c7a318b237355b4
	.xword	0x505eea276643944c
	.xword	0x6e936a0fb681bb75
	.xword	0x695ac4715609be43
	.xword	0x329771b903b33be6
	.xword	0x41338c52d8bfe83f
	.xword	0x3bad53646d159645
	.xword	0xebe700d6cceb7b1f
	.xword	0xd0772fdecb6c7fc4
	.xword	0xb1e29aa45e3ce19c
	.xword	0x638f71ef818d941b
	.xword	0x1795387a4f1226d0
	.xword	0xd4826f819b4a66de
	.xword	0xa59ae4e2fe8b24d1
	.xword	0x8aa9791d7f54e323
	.xword	0x0806bae71a7501ba
	.xword	0xc050854caa601d36
	.xword	0x358233f410899b8d
	.xword	0x7a70f5c179066e2e
	.xword	0xa63d022020888ec3
	.xword	0x989eb1d9feda9980
	.xword	0x6803979943832d42
	.xword	0x0ca266a6fa8c3fad
	.xword	0xc6609e213cef0c4b
	.xword	0xb7909dbebadffe55
	.xword	0xb009d0e3f0ce1978
	.xword	0x79b3826f43246953
	.xword	0x66e89fe816bc65fa
	.xword	0x70b2332816dffd9b
	.xword	0xe0fb5aaccfc5e685
	.xword	0xfbe7b75d51df0e0f
	.xword	0x4d2c6aac7e6b2fb2
	.xword	0x6675da0c2b7b1594
	.xword	0x73adf890d88e4ea4
	.xword	0x0b27e39c9cb5a212
	.xword	0xd6a4879eb9070563
	.xword	0xd2aba1a10d2aaa5c
	.xword	0x53837854529c19fe
	.xword	0xf6f407a46585d5ea
	.xword	0x2ce5552407ce5180
	.xword	0x320f689f98df9454
	.xword	0x7dfa6d0238835fdc
	.xword	0xd2dc02b72054a0ac
	.xword	0xf444130d472e1557
	.xword	0x99861d0615d77806
	.xword	0xb433a83b97ea7a31
	.xword	0xfeae039978c91358
	.xword	0x60f330736b86691c
	.xword	0x56d8bba1b42d0f0c
	.xword	0xb6617de11c6710b5
	.xword	0x3089452b4f027340
	.xword	0xef416029378c3281
	.xword	0x96ea5559109b971a
	.xword	0x56ad19df444d58d2
	.xword	0xe3e091a207daa06e
	.xword	0xae24fc52ffe4e8f9
	.xword	0x3b95a71a097ece97
	.xword	0x58ed7d1581097dae
	.xword	0xe53b990ff345e4c9
	.xword	0x8d4d1f3e831d8c08
	.xword	0x8955f3e2b43813f2
	.xword	0x1861bda71cf84b2a
	.xword	0x1a7eb6974e8ed6e6
	.xword	0x1eb7dfb8083be1b5
	.xword	0x1e22265a24483fed
	.xword	0x80847e3207da7229
	.xword	0xd714fe9612aac616
	.xword	0x90ed806322d8c109
	.xword	0x2a00a1078c0241e0
	.align 0x2000
	.data
data_start_1:

	.xword	0x96b22c856a71bea8
	.xword	0x2206d17d35d77a19
	.xword	0x95df89002615824b
	.xword	0xd772cfe3b16f91f9
	.xword	0xf1e08a02744df8d1
	.xword	0xdb635f00a39b6ba1
	.xword	0x9fd24297f034b193
	.xword	0xc3c9ecf0fb5dc317
	.xword	0xdfaff32263ae4565
	.xword	0x7f62fefc72538010
	.xword	0xb7560041893f0293
	.xword	0x6b5a550319e513de
	.xword	0xb347982131ea6332
	.xword	0x522bfe5d58bbb098
	.xword	0xca9b3331809806fd
	.xword	0xfa1906a1e3d7995b
	.xword	0x871089ee85bcc5c1
	.xword	0x474ca0941f36e880
	.xword	0x94cdabaaac8de2d8
	.xword	0x424ffedb7d179684
	.xword	0x46808fddc7a2c578
	.xword	0x09cb9a73b89c1a57
	.xword	0x6d0e32dd7cb88028
	.xword	0xb7b192b0a468e5fb
	.xword	0xe834dff0138d6121
	.xword	0xf81bf581ce292f4e
	.xword	0xcab6f600abcb5202
	.xword	0xa22601b67c189290
	.xword	0x25a54dd9fa39b479
	.xword	0x4b3e25028e0f4c8c
	.xword	0xf7cee5eb1903c7d9
	.xword	0x0bca734356ded4fa
	.xword	0x1b54ad3dc250d594
	.xword	0x16780e5db8c52c65
	.xword	0xc5075c7c87d4fd46
	.xword	0x50da6374b1a6e030
	.xword	0xad282ddd01b31cc0
	.xword	0xc2243f103ec1a224
	.xword	0xbba73ee02d57a425
	.xword	0x866abcfb689320ba
	.xword	0x64e9bd4bf0f23dc3
	.xword	0xfc0142dc93db6efd
	.xword	0x00f4fe34542cba42
	.xword	0x94938079ccf243bc
	.xword	0x37bf29bc693e22be
	.xword	0x584c808f6cf3c8e0
	.xword	0xd7fb92295b42df3f
	.xword	0x92a1f4cfca43a3ea
	.xword	0x37f64b590311959d
	.xword	0x3a32bc5df5419557
	.xword	0xa5e7c2a976dba14a
	.xword	0xe7278c3b855a3c2c
	.xword	0xe22ae8fe8a7dbc1a
	.xword	0xbec4240c9e2d00c7
	.xword	0x2358f1068c371f55
	.xword	0xf7937e318fd0386d
	.xword	0x83eb72d8117323c2
	.xword	0x7fdc827d1f32ba0b
	.xword	0xe282ad2b81b9257e
	.xword	0xbd8ac40adb097f15
	.xword	0x5ebb9c7988e5df1a
	.xword	0x8f3a0e9999ac4938
	.xword	0x3079ba3214124794
	.xword	0xdea6381d51d9f58b
	.xword	0xb5e4228f85466547
	.xword	0x07e8fcc701bc3a97
	.xword	0xeca2da5d76286f86
	.xword	0x1313ec45e25282d4
	.xword	0x9761a63a7d3a7319
	.xword	0xcc2fc5c33d11140a
	.xword	0x24e1547abb566e5e
	.xword	0x5d570cac3c123963
	.xword	0xcfc1d1c9f31912fa
	.xword	0xb5a4a086ba35defd
	.xword	0x793e6d2c574defd4
	.xword	0x1304167e4b4729f9
	.xword	0x1f8594981e0d7875
	.xword	0x1477668142a1e4e0
	.xword	0x40658e48cbc5615d
	.xword	0x7211dabec27e6572
	.xword	0x5ed66475ef43325b
	.xword	0xf29f719f0e6f455e
	.xword	0x1addb9c523d56cdc
	.xword	0x688e14afa56df886
	.xword	0x3ca8715223353862
	.xword	0x4cc8ad8e4fae6fb6
	.xword	0x1b2084f8dd912d6a
	.xword	0x25d550f76cb5f57e
	.xword	0x6c0b30c9076f9322
	.xword	0xeaf4b58575b98559
	.xword	0xf660cbcd37004af8
	.xword	0x7fa6dde85f6d8459
	.xword	0x699299ad6927bc27
	.xword	0x6472e847c542fa04
	.xword	0x920ceec8c2faff1a
	.xword	0xf655ca171f878c4a
	.xword	0x5f8485a98971f214
	.xword	0x1804e851365ffb0b
	.xword	0xdb7d27affd2167aa
	.xword	0xb5339db2b75ce266
	.xword	0xf0da22e725790296
	.xword	0x6306c394b792e163
	.xword	0xb434aaa508b3c699
	.xword	0x8dc5e3ffce397e4c
	.xword	0x9b03f46e24747c52
	.xword	0x9c480c4403d5360c
	.xword	0x7d9b683b2966f3e6
	.xword	0x7d8908857c9e4351
	.xword	0xe6bf08e68b06548d
	.xword	0x3c9dd80dbb448fc1
	.xword	0x9385867b1abceeb8
	.xword	0x2ae451730273290d
	.xword	0xa5a8f65dbc921d8f
	.xword	0xa084b207107c3657
	.xword	0x174fa5ab94ebe51e
	.xword	0xe161b0d5007f8ca3
	.xword	0x1a6bff160bb4ecdc
	.xword	0xc50314bf49bb09a1
	.xword	0x600f78e1c34c5300
	.xword	0x3f12811cccb07d26
	.xword	0x4725b2e94f61cfb3
	.xword	0x6df10e6e499a17cd
	.xword	0x1793443ec284a4bb
	.xword	0x16664d3d97a4dfcc
	.xword	0xee91e52336b29158
	.xword	0xa03ddb11b3b27d8e
	.xword	0x237cf70bf42fab4a
	.xword	0x43570a554cd3ee22
	.xword	0x8d26a95931a16c26
	.xword	0x6dcb2c0b2ff23ee9
	.xword	0x8a2c4c5c01eeb596
	.xword	0x8fc89feb0b8ea282
	.xword	0x536f184b845ae64e
	.xword	0x68afac395bf73dc5
	.xword	0x5823bb893f1dc908
	.xword	0xcb1c45b6cd806502
	.xword	0x212953c2250a5e71
	.xword	0x530cf09e5e9a0820
	.xword	0xcfc6501075baace1
	.xword	0x5e37bf6abe3f0912
	.xword	0x6568ab96578f8171
	.xword	0xd77d277c780be41b
	.xword	0xe890e6c34cbf1d15
	.xword	0xd58357a0c90fa75f
	.xword	0xb4fd422d87ac31eb
	.xword	0x044adf1a0a85ec7c
	.xword	0xa7c2464ca3886bb1
	.xword	0x32660631e7f2c8d0
	.xword	0x95460505d2a34428
	.xword	0xba8f1f651ab5cb44
	.xword	0x3d5c2938524de0b5
	.xword	0xb7682d62ae1784a9
	.xword	0x7f938d2d29fa3c39
	.xword	0x1ed2b6325b9ad7e4
	.xword	0xd41cf54cb9ba3eee
	.xword	0xfb29d5ba6067aa1d
	.xword	0x74495168069e987a
	.xword	0xdfe1b5493329d3e3
	.xword	0xb9d535d0639d0e60
	.xword	0xbc9f8b4f183ae3a0
	.xword	0x0e68bb7d14bcdded
	.xword	0x4c32ba919773f2b0
	.xword	0xcb5bb18165d47b89
	.xword	0xfbce528b831a567c
	.xword	0x8755d14957debf22
	.xword	0x03b8918bf7f2ae2f
	.xword	0x3ef5c606a5ee9c7c
	.xword	0xf974f76c603ce58d
	.xword	0x7c9ee98feceedbbb
	.xword	0x31f61644a9791282
	.xword	0x5bcf78519f219f90
	.xword	0x9e0e8062aa1ba9b2
	.xword	0xa1b59b560006a15d
	.xword	0x096523273823837f
	.xword	0xe039c1aa877b223c
	.xword	0x161ee387c47b9b0f
	.xword	0xf454d49727866727
	.xword	0x0f67a1888175c12e
	.xword	0xab4a58e60a4c9e7c
	.xword	0x1bff0c9ecb749853
	.xword	0x8b5b44024be7023c
	.xword	0x527e2632ae4e09d9
	.xword	0xb08e151d4ec06d0a
	.xword	0xad6a579a330f130e
	.xword	0x3f09f29c729eea38
	.xword	0x6379e207f18d1eac
	.xword	0x52d920a47ce9463c
	.xword	0x1b086dccc14688f0
	.xword	0xf2a4b4cefb50a56e
	.xword	0xf0e598829000a2ed
	.xword	0x054cb8d178dd08b1
	.xword	0x9949e785e147956e
	.xword	0x152602fcc0c160cd
	.xword	0x0b8d064871c101bb
	.xword	0x320a631df0c0ad5c
	.xword	0x26b09a183a626251
	.xword	0x4544d890be2c2a18
	.xword	0x347a631e1319f16a
	.xword	0x136418b2b4e42f02
	.xword	0x52bff0f28b7afe45
	.xword	0x47f15992fe077930
	.xword	0xf9b95e868d7174db
	.xword	0xda91cf8943c0463c
	.xword	0xef7229b2df40d5d9
	.xword	0x64a2c6b7a9fc8b08
	.xword	0x6a2f020e57838570
	.xword	0xd00021b93f926a24
	.xword	0x382d4f230ec622b4
	.xword	0x5a564bf688de4daa
	.xword	0xb655a6c21d30e77e
	.xword	0x7c98cbd3026f8936
	.xword	0x04ca4276d5fa874e
	.xword	0x4dcf148f32125e44
	.xword	0x3a794461f0d9872c
	.xword	0x99a4d1be751e8299
	.xword	0xade60b051c0e4554
	.xword	0xa3d8a9425fc8aee5
	.xword	0xd28efbf53c3abf5c
	.xword	0x8817a190a8e65ceb
	.xword	0xd6e9053412f610b4
	.xword	0xac48290477d6fb78
	.xword	0xb1a5fd1922a9c00e
	.xword	0xe223999d2410efad
	.xword	0xa93f67919557b892
	.xword	0x388d1aebbf8fcedc
	.xword	0xf2193714bde30b93
	.xword	0xf3f05ccd28abd538
	.xword	0x955c44f26b0d1638
	.xword	0x3d5e6ad7775d8270
	.xword	0xf3c7389274405597
	.xword	0xc325af1b8bfc6231
	.xword	0x1e42eb537c80640a
	.xword	0x7e0473e9c8d1bb45
	.xword	0x01c584cd55335010
	.xword	0x1692f18f308b88a3
	.xword	0xb783084131ca3b54
	.xword	0x29d414f3c938328f
	.xword	0xd73e49be83b386d0
	.xword	0x2c89b3a534e46bc9
	.xword	0x71ac410110cd078e
	.xword	0x47abaf5e5a2e648d
	.xword	0xc722170dcbf6bc18
	.xword	0x6255a50a20896516
	.xword	0x7eacfe5b19cdd6ec
	.xword	0x2e55d73f1b4f4b8a
	.xword	0xef4befbd408471b6
	.xword	0xf1791a8434ec7c1a
	.xword	0xb0f6ff3fb7bb4389
	.xword	0xd7ecc8c1199730f1
	.xword	0x5e7ae46967bf597a
	.xword	0xf8e550f298d355ac
	.xword	0x51bc7a7784be0add
	.xword	0xf468ccb3b99a5c1e
	.xword	0xae0e255f822c33a9
	.xword	0x25ed2885d64684f8
	.xword	0xc9fe75947a464ffd
	.align 0x4000
	.data
data_start_2:

	.xword	0xe7771627521ddc18
	.xword	0x31f7c4f57de75350
	.xword	0x4811f3190173f1f4
	.xword	0x990c1c841c76499d
	.xword	0x1a6dfd5944a87e37
	.xword	0x6e0ef05f966add7c
	.xword	0xc264c56cbfe81bde
	.xword	0x1816f84e996bc3fb
	.xword	0x8fde65e616579e1c
	.xword	0x1eb04e2cedeb6225
	.xword	0xacb114d2c2a9d14a
	.xword	0xee520eba1e92bd34
	.xword	0x85c1272535978fd2
	.xword	0xb3ee2f091a2da442
	.xword	0xede3ece37a3c89e8
	.xword	0x63d8cf3420687993
	.xword	0x9938877b636f332b
	.xword	0x0301cf1d0a3ead66
	.xword	0x90fbab87695fe939
	.xword	0x57e80ad21fba0394
	.xword	0x08c65b888a2869d4
	.xword	0x390e46dc9c8f7d3d
	.xword	0xa27c73592acd6b75
	.xword	0x2e5ebedbe3fba63b
	.xword	0xfc2601cd0807b237
	.xword	0x8c708c14ba2c71ad
	.xword	0x1641ce8bcf401a9f
	.xword	0x703989178ff77177
	.xword	0xaeda71671ad364b4
	.xword	0xec6cacc2b887ce1d
	.xword	0x82070111cfd97e14
	.xword	0x13ea95ef469a3606
	.xword	0xc2b32d2a70c8993d
	.xword	0x55babdd4580e7427
	.xword	0xdc3ff417c549d182
	.xword	0x574afc99aee36ed0
	.xword	0xd94f630cd5d7ec0d
	.xword	0x64df9a481eb837fe
	.xword	0x00783efab4fb1356
	.xword	0xa80c209f2a8b68fc
	.xword	0xf686a698f4926508
	.xword	0x5298d03975636092
	.xword	0x1edf8029cbd17d82
	.xword	0xb8a7b05ee59a3a64
	.xword	0x65f0d4cce26471e1
	.xword	0x5769e5e1d5a2a818
	.xword	0x9541c3b0377c786e
	.xword	0x404228df16d10d2d
	.xword	0xef30890af3318ac9
	.xword	0x7b0b4f8541a38da0
	.xword	0xdc22b0c7b2246ab0
	.xword	0xcc33a15d1c44cb61
	.xword	0x1a8e822ef77ccc71
	.xword	0xe56caa5ac869b8d7
	.xword	0xee269d491af4c4cf
	.xword	0x0965f3c62428c905
	.xword	0x0d4bace300e2cb10
	.xword	0xd548e691b15fac2f
	.xword	0xf350eba03470d81c
	.xword	0x2f204e9d93f57965
	.xword	0x6f32ef1e233c68da
	.xword	0x156ddad6848e9aa3
	.xword	0xef576436df0bff90
	.xword	0xb6df36b616db1b3c
	.xword	0xe8f8117862c20822
	.xword	0x0946128922c12a9a
	.xword	0x4825cabb9829ff88
	.xword	0x57fc88fa942533a4
	.xword	0xc425ddcc66fe5e17
	.xword	0x9c78b973c6034dd9
	.xword	0x022cb619eebc4820
	.xword	0x696fc87c53db7623
	.xword	0x88a452a2f30b17ce
	.xword	0x03b9a41341431d20
	.xword	0xa3e9839452f529e4
	.xword	0xc8c2c8130e3d2ea5
	.xword	0x22266e92569ce1a1
	.xword	0xb301a8e4a1c13e21
	.xword	0x9f8ea69765debafc
	.xword	0x00d981c63759f6f8
	.xword	0xfc9e7ce2f10a104c
	.xword	0x1a0e2f4d5c6e324e
	.xword	0xa49f2d7b5938c907
	.xword	0xaeebfd4d4a0723b2
	.xword	0x3ba53d6a2531e0ea
	.xword	0x66eed0e8bafdc975
	.xword	0xc42977ec33b19a2d
	.xword	0x161005744209d6b7
	.xword	0xa31109d7a104fc91
	.xword	0x99a970bd13fb22e7
	.xword	0xba2ec726fb4bcb9a
	.xword	0x2284efdbd52efbfc
	.xword	0xe499fa784337f023
	.xword	0x10bcdcb0fe8159bc
	.xword	0x4b533e6a4eb7d1a0
	.xword	0xd6570140b651153c
	.xword	0x3a77fe78fb605305
	.xword	0x5b299e1f5ff70ba4
	.xword	0x6905739b0cca3786
	.xword	0x6ecbacc0a7be22fe
	.xword	0x047f734b925e0b78
	.xword	0x3d8e12db83cf02da
	.xword	0xd140e3537e3ff472
	.xword	0x96e7702814fb8071
	.xword	0xfd30581264576bac
	.xword	0xc1379b708b67b7b3
	.xword	0x76ff438334bd0579
	.xword	0xef3444f0a3421f6f
	.xword	0x09fb5403e146efc5
	.xword	0x73f3915691a20d25
	.xword	0x6770f13987fa7f64
	.xword	0x3677e0e7aaee9ba9
	.xword	0x043faaae1588182d
	.xword	0xe22e53f2be8d405a
	.xword	0x8191bbc4a98a8e5f
	.xword	0x2c03ff98bcb62ae6
	.xword	0xea1d043dbd4d8e01
	.xword	0x51209088b8658edb
	.xword	0xcd97cd24c23a171c
	.xword	0x1aebc7b3d0195d10
	.xword	0x385fd4fd3c4b2768
	.xword	0xb488a02e46f2f05a
	.xword	0xa9cf34b504759cb4
	.xword	0x40633372ae5a8f69
	.xword	0x476c22ca4c4175a2
	.xword	0xba2ac4627c6bea1b
	.xword	0x39ce08df072f84f2
	.xword	0xa3f3693ae485c29c
	.xword	0x673c59c57e57625d
	.xword	0x994c4b628243e853
	.xword	0xd9129dcf4fd9ac0e
	.xword	0xe751600271a8d59d
	.xword	0x95a302c86aba1dfd
	.xword	0xd701fe9f0d1c3764
	.xword	0x21b554fbbe82e6f4
	.xword	0xb4731a98a5cadfc5
	.xword	0xa2d2c7cda0e70a0c
	.xword	0x38d4b05ebc41fe90
	.xword	0x2386267305440322
	.xword	0x2b50bfd7f02dfb19
	.xword	0xdc46bf5093f442bb
	.xword	0x6fe83a86a754bdf5
	.xword	0xf9c614632b012a73
	.xword	0x09c74333299f8cd4
	.xword	0x737a6a1ad3e5b2c8
	.xword	0x205d91e54f4ab03b
	.xword	0xb80c806089e15330
	.xword	0x2c4fd8855600b967
	.xword	0xec87ddf404ac6177
	.xword	0x08acc431f3669931
	.xword	0x73e0011e4d24daab
	.xword	0x7ef4e220c03be157
	.xword	0xf9c3b0f601355d31
	.xword	0xa9fc13c3db35a29a
	.xword	0x30f14aeaecf081fb
	.xword	0x6dbd214ab8953f02
	.xword	0x0dd65f845a046cf0
	.xword	0xb32c426da287ea9d
	.xword	0x253241c365eab8a4
	.xword	0x3ac7cb64f817b502
	.xword	0x47867873dd1cfff2
	.xword	0xb553687691ea7e93
	.xword	0xda98ec1a2383207d
	.xword	0x5630d0862e5c63ab
	.xword	0x63b62dddf01d7bdb
	.xword	0x1e1fea1b4c649be7
	.xword	0x0b7b9d2f81df21ae
	.xword	0xd278cb381dbba7dd
	.xword	0x78081169c055e52a
	.xword	0x250b2892e0f4588b
	.xword	0x6c4fa78119e43ef3
	.xword	0x3b14889a29b9b50f
	.xword	0x562df80fa1025efa
	.xword	0xabe95bbee32cd7c4
	.xword	0x8b9d51fa33493236
	.xword	0xa9b5754bd2a306a1
	.xword	0xafa708b4b00cf6c1
	.xword	0x776177937c490d7e
	.xword	0xd3185619c50cea69
	.xword	0x3e807e73a4965f69
	.xword	0x0cfaa6a06345a5a7
	.xword	0x9748131b0354e3e3
	.xword	0x74edc338c9c00bfa
	.xword	0xac45e5ce141a7857
	.xword	0xa184c947fe47b3bf
	.xword	0x9e37c830a658cb87
	.xword	0xe9168b20ed5a8c5a
	.xword	0xe3dca7aae7cc24db
	.xword	0xdb24d38e28ae26b2
	.xword	0x5fb6f2b490a2abb0
	.xword	0xa2182dc9a9a21da5
	.xword	0x26a30b38a5f88c0b
	.xword	0xaf7354d42594103d
	.xword	0x905dce023775b492
	.xword	0xbdb03ea4e316a15b
	.xword	0x21669a0e7147d7dd
	.xword	0x106d3d3612a8fb0e
	.xword	0xe1be0991de7c8ab1
	.xword	0xb5ac454f0dcba585
	.xword	0x174ef34ca207f656
	.xword	0xc3128be43d1a1f0b
	.xword	0xbe230f475eb78814
	.xword	0xa8e61fd0d3802b6e
	.xword	0x18c5b83df748167d
	.xword	0xc15457d675e4c0ab
	.xword	0xe9568b48ddd88574
	.xword	0x8cc7c2bf91d02119
	.xword	0xf459ffc379b2211a
	.xword	0x1f9328cf2fc224e8
	.xword	0xefc56b3f797dd0c3
	.xword	0xaadf7f731cdaf43d
	.xword	0x320c37aa39952635
	.xword	0x2dcc4df5a1b23942
	.xword	0x29a89fb0a29eb4bf
	.xword	0xde73ef08240715b5
	.xword	0x60bda0d9165abc71
	.xword	0x2323c833db41b9dc
	.xword	0xb9fce1dc72911901
	.xword	0x2920389046db891d
	.xword	0x3432ebbfb6a57ec0
	.xword	0x9d8c976cd31fafea
	.xword	0x11f3592d94868500
	.xword	0x9c89a2961a4ced2d
	.xword	0x906b81df669ba0fd
	.xword	0xfee5d4dc95eea067
	.xword	0x3b983d39cbf72fd8
	.xword	0xf25472e391a70312
	.xword	0xc44365e7a1e661ad
	.xword	0xa1b35fb9c2876ca3
	.xword	0x7fbb7975fb5eee18
	.xword	0x7a3f64f814ee4ca4
	.xword	0x0fb2680ceed1f295
	.xword	0x660c7f301d75691b
	.xword	0x03bab44595266545
	.xword	0xeb46fe76b1e270a6
	.xword	0x5bc5ba07b5ee9526
	.xword	0xe235c50990f0fb79
	.xword	0xde2c2df39218daff
	.xword	0x50972846ec9bc72e
	.xword	0xa8b27f8b12fe69bb
	.xword	0xdce1a10b7b31829f
	.xword	0x0802ad079c8c61eb
	.xword	0x08bfc3917755f730
	.xword	0x1ed53e32a0fbf7b5
	.xword	0x77dd6312682be658
	.xword	0x6a04384e06d4e476
	.xword	0x0d7a4fdd9dae7dfa
	.xword	0x4ae992cd796e5f66
	.xword	0x6ca43cd51f8bd617
	.xword	0x671e3df6342655a3
	.xword	0x8f3b6d9299fc5cc8
	.xword	0x9e0da75b82bd5b31
	.xword	0xa2528494baa4a3c3
	.xword	0xaa1d52d5ad9eb7d8
	.xword	0xb905e19c9253e842
	.xword	0xef22b6873756f589
	.align 0x8000
	.data
data_start_3:

	.xword	0x4b368b2805723577
	.xword	0xadd65ae3cd4e8adf
	.xword	0xa31c74925c78fd86
	.xword	0x6fc1429e1239eafe
	.xword	0x0de6d9bfaac69f3c
	.xword	0x88e32eba0e0dee78
	.xword	0x7df82045e3e81dae
	.xword	0x5f06c98d744804c1
	.xword	0x41566ca269b79341
	.xword	0x23240b0d37df8633
	.xword	0x0d0b5ffe9f15c1b5
	.xword	0x77ff1c27f9d5b375
	.xword	0xabd28c9a0d5f3796
	.xword	0x5c187c06f96b8f7e
	.xword	0xa7505d0ecb4c1c45
	.xword	0x10c352115c90e967
	.xword	0x26dee4aa667af91b
	.xword	0x89031acbacf6cbeb
	.xword	0x3dc18c6dac91ab20
	.xword	0x2719c2cd084ab675
	.xword	0x39d95ff49e6c4bb8
	.xword	0xb988f6baa132fdcc
	.xword	0x4b390e51d1e2bfeb
	.xword	0x71e2a8f9f7a55b71
	.xword	0xe2bba6bd9880f1bb
	.xword	0xb708ab91cf4ab178
	.xword	0x268603d007853a8d
	.xword	0xaa56d56283221a35
	.xword	0x1163c7c86933a9fa
	.xword	0xc4773b09a22a6c0f
	.xword	0x546692de31a690ca
	.xword	0x50188253ea1e154a
	.xword	0x7e1f97cc9593d420
	.xword	0xa9de3e73b53dd8a9
	.xword	0x96228efcae85cb3a
	.xword	0x92cdb40efe084eed
	.xword	0xc96717667371b955
	.xword	0x397701bd14794988
	.xword	0x647eb6dd191a9450
	.xword	0xae1e5fc18ed273ef
	.xword	0x5acb90764926a82f
	.xword	0x01fe16cd469ebabc
	.xword	0x252e030063fe99fa
	.xword	0x6b7d8e180e66c6da
	.xword	0xbabf85347d76de44
	.xword	0x8a7c3bcb58f25530
	.xword	0x2592b496fdde34d2
	.xword	0x36eaba50855ca3eb
	.xword	0xb09f235322142eb9
	.xword	0xb15ad8c751a48364
	.xword	0xa350c38770f23e1d
	.xword	0xe43d9095beaea0e3
	.xword	0x277d803f1dc4974c
	.xword	0xd7dca2c6cc2953a0
	.xword	0xf9e4d2ed5fdb00d2
	.xword	0x9e376fa7aeecb519
	.xword	0xafe87a6eab8148d5
	.xword	0x4a9b09f02f10040c
	.xword	0x33c7b51f47eac03b
	.xword	0xbe1e6b766abadbe2
	.xword	0x0d8c6b0812b1461f
	.xword	0x8f01378dff363956
	.xword	0x85630b9292556730
	.xword	0x37b63bf04d3ed075
	.xword	0x4dc4ed7fb32e38cd
	.xword	0x1633d1fe05409ffc
	.xword	0xc9ce7485972f2e09
	.xword	0x9f970106b52d0796
	.xword	0x64f071270c49b49d
	.xword	0x0d3a24b71fc54b07
	.xword	0x97707155a3fd8c5f
	.xword	0x62fa74bc0a00e2ce
	.xword	0xe26b0f9dbf2ad8f1
	.xword	0x560d7c966496a423
	.xword	0x1a876d5bc772c26d
	.xword	0x19203fb27f8f7d66
	.xword	0x4552f9025d3303ac
	.xword	0x803aa4df51190c74
	.xword	0x8222d832f31430e7
	.xword	0x9603d9c6c95ecc21
	.xword	0x7f5dc83ff3ea797f
	.xword	0x36c3c62454dae020
	.xword	0xe62a486612a5fc56
	.xword	0xc6419644942a1ac6
	.xword	0x733a833bd7743bde
	.xword	0x86c918525d9a3bf8
	.xword	0x13e2581a7ffcec99
	.xword	0xfc725678020ccc4c
	.xword	0xab1a85022688d1f0
	.xword	0xa06810a5629704d8
	.xword	0xf6e320d6d6a8e26d
	.xword	0x372d9f9f9634e970
	.xword	0x5c84b98c3fd0ca00
	.xword	0x857999ee627b0f2e
	.xword	0xf34eac5ffb38d482
	.xword	0xba3e262aaa8aabac
	.xword	0x944a2604ad9da644
	.xword	0xe306411a3376e565
	.xword	0xe56a7f700b4b61ed
	.xword	0xcef797a1fb9c500e
	.xword	0xc7aea5f1f93c7b12
	.xword	0xff2cbd389220da7a
	.xword	0x201e1925bdd122ee
	.xword	0xee3a428b8af76e7d
	.xword	0xd9a5f2bc13f88087
	.xword	0xdf865ee7aa4374f9
	.xword	0x2f2251f0f696e709
	.xword	0x27c89991c7bdb490
	.xword	0x205469cf0bc99c16
	.xword	0x6bc4c3079470d7da
	.xword	0x20da66e955fbf3d6
	.xword	0xa8ce80f24e281405
	.xword	0x8915f493c499fd1b
	.xword	0xf0cb7427be720cf7
	.xword	0x1dc059b60bf689ad
	.xword	0xbe2d5b100179a6da
	.xword	0x9424932173ce3aa2
	.xword	0x86952904edb90c01
	.xword	0x3045a0a27d0fd2e1
	.xword	0x2a93531ebc2cd1e0
	.xword	0x4f134d5c4e63685b
	.xword	0x3c373ba5a551dae6
	.xword	0xf3d781686c9f74fe
	.xword	0x7c7c4dabe08ab0f8
	.xword	0x96f5832a66d6a23c
	.xword	0x77c3112c317fa0d8
	.xword	0x11f346101e6118e3
	.xword	0xe2ed40173eeb02c0
	.xword	0xe4611234ebf85d11
	.xword	0xbae0830cbb793328
	.xword	0x9de16f533220b1c1
	.xword	0x0725c5089f34419a
	.xword	0x263801da049bc39e
	.xword	0x4348d63abfcb00c9
	.xword	0x1d7965798c97d033
	.xword	0xa9492cefdabf81ab
	.xword	0x85c3cc8cbfdc1b4f
	.xword	0x2b5c06874931d8d7
	.xword	0x6ad8532ce7b4f4d4
	.xword	0xbe2f599ed5fa28fd
	.xword	0x4be87ebaccb4bb17
	.xword	0x4999847aef8f1f32
	.xword	0xfa51b8098f4b6c75
	.xword	0x0a2305c3c2e90522
	.xword	0xdec7e1ca1ce2cf19
	.xword	0xf90ae22813c8274b
	.xword	0x3caf88f7500cfe9a
	.xword	0x60d8c410517b947c
	.xword	0x2504c2c422f67f3d
	.xword	0x0dc40958c2306502
	.xword	0xb4bb1a240eb17d82
	.xword	0xd6e8f7c46e7cfbc3
	.xword	0x373355a60289161a
	.xword	0x6e09ab189d997fbd
	.xword	0xf40b7e0ed0b4ef7f
	.xword	0x265706fd97a33d32
	.xword	0x6c69159d28b6c3a2
	.xword	0x50993a72d23ad7fd
	.xword	0xc68c94ee732500d8
	.xword	0x7ba513dc3b84867d
	.xword	0x1e50c82004f48554
	.xword	0xd8e920004adea352
	.xword	0x240eb953860a68f7
	.xword	0x3b4abe8163e420de
	.xword	0x77b2341f5a970f67
	.xword	0xddfbfd33cb5b5ebb
	.xword	0xfb70510899085728
	.xword	0xa9caa56ca6968b74
	.xword	0x010a63215de7f728
	.xword	0x6b3a352476ba1c7e
	.xword	0x8dad96264fdaa697
	.xword	0x91975cbd60e5b524
	.xword	0x0350aeeba07e9d7b
	.xword	0x50d73a7f42926c47
	.xword	0x466ce035965bfa06
	.xword	0x09b9640da60e9321
	.xword	0x16cdc1aa48947848
	.xword	0xb85081f53897dac8
	.xword	0x676e0a519d0542eb
	.xword	0xf9bc9180c60c41c4
	.xword	0xbc21cd684aa6fa7f
	.xword	0x0659af126fc39941
	.xword	0xa0c22ecc72210f89
	.xword	0x3f7d18b5205072fb
	.xword	0x0598c6e6895915e2
	.xword	0x1d48e5d9a0515372
	.xword	0x4577c3fa575ab7a2
	.xword	0xccde62d38173b34e
	.xword	0x9eaad67637539641
	.xword	0xb0a7660675ee33c8
	.xword	0x8abf0a8c6d6cfb13
	.xword	0xc01f74035fa0b80b
	.xword	0x36f1cb431fc036c5
	.xword	0xcf318a0094522568
	.xword	0x97c327de2b84fa78
	.xword	0xee061a91fd01e04d
	.xword	0x2030638b9f1d10a7
	.xword	0x98227a71b3fb3d45
	.xword	0xe4a160cb181bfa35
	.xword	0x58ee4da025e0bad5
	.xword	0x398a4fc6562a89cb
	.xword	0x5b03c1c96a5adced
	.xword	0xf63812a60e30ec71
	.xword	0x63d4ae8de2f9c06a
	.xword	0xd99cc07c2e30b795
	.xword	0x62cea64c426dbadd
	.xword	0xf3f074a1598293fa
	.xword	0x7b8010f5f90316c0
	.xword	0x12b3bdb48fda9a7f
	.xword	0x229a0c170242ff90
	.xword	0x37dae9c5e274754a
	.xword	0x13dbb1b87f2edfeb
	.xword	0x878ea6666d236f8e
	.xword	0xc54f9e088a4b64ec
	.xword	0xf5b55457d638fb48
	.xword	0x54fcae21108d7411
	.xword	0x7a21bb590f9dfc96
	.xword	0x8f8e994fda66fc8f
	.xword	0x4922093c06da6f4e
	.xword	0x8f5897648a9bdf68
	.xword	0x241ffee31f596c87
	.xword	0x94e077f8b6042e67
	.xword	0x35f7a00614f3aff9
	.xword	0x47f4d8c112a62798
	.xword	0x47a167df444f1015
	.xword	0xa46b55a4e78f76e9
	.xword	0x6518831e3cd762c0
	.xword	0xb6192e6258541429
	.xword	0xbeeb0b58c1ee6dc8
	.xword	0xc70cf48b2cd79b47
	.xword	0xdb39a567952153f6
	.xword	0xa8e627d8831d008b
	.xword	0x2d8c245564dab19a
	.xword	0x13ea603171b6e21b
	.xword	0x59adf4ee6d71ebbc
	.xword	0xea4af9da918ad571
	.xword	0xc312656ef4e4d4df
	.xword	0xb526f2819f7b527a
	.xword	0x6c02c53ea67175f7
	.xword	0x4942b49d88eed43a
	.xword	0xa4f949567a1718e0
	.xword	0xe3755458148c4156
	.xword	0x9b88980b59de08bc
	.xword	0x96d3c3c141522c75
	.xword	0xc7d200fcf12476ff
	.xword	0xd6f32c271b1b241e
	.xword	0x55f2d7e68b77c9c7
	.xword	0xc0be2ff30979bec2
	.xword	0x7a4349ffcdd5b935
	.xword	0x84e91727f2030dc5
	.xword	0x330c3c28457d81fb
	.xword	0xbe5c9742be7f897d
	.xword	0x99fc5105723ff2f1
	.xword	0xd5d8e4fcbf32875c
	.xword	0x7cc129b1cd13a376
	.xword	0xf8f264bca8ae52ef
	.align 0x10000
	.data
data_start_4:

	.xword	0xf2bd393033e74646
	.xword	0x1a76e76780094550
	.xword	0x08050987f835067d
	.xword	0x9e2939e608cefc89
	.xword	0x444662dbb2b1ec64
	.xword	0x8e92d882ae3fe606
	.xword	0xdf295679f74e4b31
	.xword	0x601124a99ae52c9c
	.xword	0xf1e54bb55ad732d9
	.xword	0xbddac4b928276f70
	.xword	0x3affa571c7960132
	.xword	0xb63193480bc398c7
	.xword	0x6a93c3a27492aaac
	.xword	0x917ebac1e365e404
	.xword	0xb731a94187c54a65
	.xword	0x07641563d4e59a18
	.xword	0x672f01f70be91bb6
	.xword	0x3ddc6b148ab3b82b
	.xword	0x7519e3a54fdbb63b
	.xword	0xc952014868ec7bc7
	.xword	0xb5e284c226ed6a8a
	.xword	0x8d733e1d1e838695
	.xword	0xc969d0e8df92af9e
	.xword	0x8d442ebc326b7467
	.xword	0xe97900b3fb093dc8
	.xword	0x2b97cbfb0b3b4421
	.xword	0xa8eaf93073e4b161
	.xword	0x6077b2ff0158c538
	.xword	0x058e5440031ca898
	.xword	0x9727886ee72f2277
	.xword	0xdb5355917bbbb54b
	.xword	0x18117621bd8763f3
	.xword	0x668257d56ac7c707
	.xword	0x9bb4949cb067fd26
	.xword	0x2bd501e00076b1b2
	.xword	0x79013ff8008e3da3
	.xword	0xa3c6e8d3c16e505a
	.xword	0x3e50f76f9ccc055c
	.xword	0xebbdc8dfebcd5f28
	.xword	0x3ed871ef8bf2a821
	.xword	0x2d08e077ef205c58
	.xword	0x235ea1e1b5fcfc27
	.xword	0x2ccc520f2f6ad0c1
	.xword	0x52f2236da5d4f519
	.xword	0x732cf6faf6e12697
	.xword	0x24e8d220906d482d
	.xword	0x073be1974484df44
	.xword	0x567b3b2f43e3cc6c
	.xword	0x044306b0682513af
	.xword	0x27eda572337a6f0a
	.xword	0xfa6a0ec74b4abd51
	.xword	0x2cf33b63421e61a6
	.xword	0x10b30fc8ca9c95f3
	.xword	0x9e774192bed025c2
	.xword	0x0abc7f06ed832703
	.xword	0xc88b2f22e4e0eab6
	.xword	0x241ce3fe1fb08770
	.xword	0x121cd962f7fd41cc
	.xword	0x256206da737ef8cb
	.xword	0x59a28512ad9b2420
	.xword	0x802e9342f7c4e910
	.xword	0xc34fcc8f9fcb7292
	.xword	0x013ec3169aa94a5e
	.xword	0x5a0de7766b9b8cfc
	.xword	0xe54cf1ad9c9cf944
	.xword	0xc869edeab1b90075
	.xword	0x20b59c9163de33ef
	.xword	0x4da648c71746e453
	.xword	0x0c568bb127aa67f1
	.xword	0x5f7c28aa46a886f5
	.xword	0x9646dd4a359c8c19
	.xword	0x3404d2323f3d7c5f
	.xword	0xe621cb815a5f42a9
	.xword	0xe483fce25708db44
	.xword	0x7a016385d6721f04
	.xword	0x1146f1c96eb8e3b7
	.xword	0x93fccacf1bd2ef5a
	.xword	0xfc6fa16ff970e15c
	.xword	0x5a1a9b0b4904f6f3
	.xword	0xf00778e59a7b82c0
	.xword	0x278360aa89080f7f
	.xword	0x68b95c6ad4fe6f6a
	.xword	0x54a6ff930665ea1b
	.xword	0x26dba48f313e170a
	.xword	0xd7e03f964c10d366
	.xword	0xf86c0972d4e91065
	.xword	0x350324256e425fb1
	.xword	0x83ec9941f8b0ec07
	.xword	0xbcc4b516a891d918
	.xword	0x8fabf49fc4b33f18
	.xword	0xe7f8b60fa8c2f6ba
	.xword	0x8934c0481875bdd5
	.xword	0xafc9821759b76db6
	.xword	0x257d18183ca83e29
	.xword	0xf0507d5667baaa55
	.xword	0x7367d2c2809fbc08
	.xword	0xa4ba313f6e41c6d5
	.xword	0xb20245715fef17d6
	.xword	0x7ebc22f725bebe18
	.xword	0x7c339af4f02774e1
	.xword	0x3d4ecbb7295a1c83
	.xword	0x266dff7479007a55
	.xword	0x08d8b01f7ee36a2b
	.xword	0x516fa06a6acc346e
	.xword	0x5d4a173f14913300
	.xword	0x4c1b770a080990d6
	.xword	0xd8a3f95d2aa90bf6
	.xword	0x40735448c5d2f941
	.xword	0x8a93a114477199d2
	.xword	0x80a93b0e1f63e3ae
	.xword	0x961e61c09f73d049
	.xword	0xcc5b1ddcc7afa1bf
	.xword	0x6a5ac9cebd186eae
	.xword	0xec81adcefa8987b2
	.xword	0x0eddd847cf6dfe03
	.xword	0xa03101569df0fc5d
	.xword	0xa01181d187409cbb
	.xword	0xdd093927e8c4a334
	.xword	0x32c1b500b95856e0
	.xword	0xcc47d82dc98227c2
	.xword	0xcd835e5bc96ee39e
	.xword	0x68e96116c932d542
	.xword	0x616f3bbd9dc5f288
	.xword	0x119623d12a732a8a
	.xword	0x7056a273dc54bae5
	.xword	0xa0bfdc751f6bb1e9
	.xword	0xf4cd21a5a4fea802
	.xword	0xbb71042d320aadf4
	.xword	0xc0c17e0f8862107a
	.xword	0x26d748f687c89752
	.xword	0x11000bbf46912f15
	.xword	0xd9104ea5eb2e94bb
	.xword	0x4d6e8bbe519ac3a8
	.xword	0xf181c5eaa0563ea5
	.xword	0xe1e74cd34eea8b98
	.xword	0x6b73ae4c38d337fd
	.xword	0x6c20f59eac4ea742
	.xword	0xb91f433511cff009
	.xword	0x2a5bb7c443519817
	.xword	0xe3cee31ff3048e6f
	.xword	0xaccd4048943c3ec2
	.xword	0xb2e89fe3fa73cf89
	.xword	0x52b6ad5428607072
	.xword	0x0da55bd61b751679
	.xword	0xb2f9e7be921c1615
	.xword	0xfa3b6127a2febbad
	.xword	0x49a84bfd6a4364a1
	.xword	0x4885ea5d370d421b
	.xword	0x38c4cbcfae9aaab9
	.xword	0x850b2d2e68d65bdd
	.xword	0x663b41cfc071f547
	.xword	0x465138ddc049af77
	.xword	0x6d6be65af9f9041a
	.xword	0xcab4d40e210fa1a2
	.xword	0xb8811c3c43648e59
	.xword	0xad491398e35974e0
	.xword	0x9446a245d936d02e
	.xword	0x097e0f0bd9640233
	.xword	0xfe4a9cc87e6eefd2
	.xword	0x470df339c84af5c0
	.xword	0x5d5b1cf3741cd612
	.xword	0x17750f1b96d78ff9
	.xword	0x76848ad318379ae5
	.xword	0xc253564154d0d9f5
	.xword	0xb5a099c6a083d710
	.xword	0xe83ef8d9c18dba52
	.xword	0x41ce6d4ba5719071
	.xword	0x5d3de246e0c265ca
	.xword	0xe7ff2d69386fc463
	.xword	0xf1eed81420737192
	.xword	0xd849900a5f8103c1
	.xword	0xbf93181b18f5cf74
	.xword	0xec008c6cf2f0dcea
	.xword	0x46b17cf182d91361
	.xword	0xc45cfddaea9de4b9
	.xword	0x0885c8cc7f2a3a1e
	.xword	0x592df0a2bea8c88e
	.xword	0xfc42bdd44b356d38
	.xword	0xd25549bb1fecd01a
	.xword	0x07e37af7a88b1bc7
	.xword	0x397a7f9fb0f941db
	.xword	0xea2f9705c09ac2ed
	.xword	0xcb5697cbeac20861
	.xword	0xafaf661860f852a0
	.xword	0xdf9356f174b369a5
	.xword	0x1b5ffe0c8ded1829
	.xword	0x239eb2c525f42d18
	.xword	0x42276efc4a07593b
	.xword	0x76c59f2de749412c
	.xword	0xaa853dc399351529
	.xword	0xa7917cc9c5af39ac
	.xword	0x3949e3f2fe9175dd
	.xword	0x2158df31d1df2337
	.xword	0x458333db4371ed1c
	.xword	0x8043e4ae0b263200
	.xword	0x98d449e2f77b3bc1
	.xword	0xf236f7f83d5c4782
	.xword	0xbb5f80caf703adea
	.xword	0x0945d9de4cfed8d5
	.xword	0x84b56dc9095bd9cb
	.xword	0x85a3ddb443d777dd
	.xword	0x7f657e4573387b0f
	.xword	0x815a526f5c2dde98
	.xword	0xc965cca254f89088
	.xword	0x3ac8dfe5886fb2ef
	.xword	0x58d04f80a0792a04
	.xword	0x13aebbfad42fd5ff
	.xword	0xd14e60349b9fe047
	.xword	0xc694a0cf4fe88ffa
	.xword	0x51aa550d964ef13a
	.xword	0x00dcb4cd0d85e98a
	.xword	0xd4af65a87bbc7950
	.xword	0x184789a62dab5078
	.xword	0x075fb4df88fec3f3
	.xword	0xdfa87e76dcf43674
	.xword	0x0eb4d7c07385868b
	.xword	0xd90162467cddcc46
	.xword	0xc24c34e32645c1e1
	.xword	0x256133492229b108
	.xword	0xe3e89a9d77f4fa7c
	.xword	0xaa5e9bc98887c5e4
	.xword	0x863c84cf7b7ef955
	.xword	0x5cfcf6df5132b413
	.xword	0x43bb97d58e1d7281
	.xword	0x319eb1b1e48c8366
	.xword	0xa55416ef3a690044
	.xword	0x090afd9c00b21c1e
	.xword	0x3eb1e9da175a992e
	.xword	0xc4513817ef08af53
	.xword	0x87eafeb908576c48
	.xword	0xce61863c2e47eea6
	.xword	0xb24fa7d6dbdeada4
	.xword	0x941200d1c799b6ec
	.xword	0x04dc9f4c4f38b078
	.xword	0x0e978356319c0d66
	.xword	0xe6e00729af2965d0
	.xword	0x2fb06bc424be5fad
	.xword	0x13592622af55c4b2
	.xword	0xb02d31ee29f47e93
	.xword	0x16313f45da614515
	.xword	0x9b3e72678d6398db
	.xword	0x1595d2d0278c6716
	.xword	0xc6e3c0d16a0af521
	.xword	0x1862eb924f646d58
	.xword	0x1712971516fa6b30
	.xword	0x7f01478439a2c725
	.xword	0xf267edcd69ec9c26
	.xword	0x722f9936c558d38f
	.xword	0x89f02fd5c014c515
	.xword	0xe0840b6e08b5e1ce
	.xword	0x698cdc0d517c836a
	.xword	0xc9743ebe21fa1f9c
	.xword	0x9ebdb05ede6602bc
	.xword	0x576adf200b721e97
	.xword	0x1a5a90d44866baa4
	.xword	0xc6d148ebc82afb0e
	.align 0x20000
	.data
data_start_5:

	.xword	0xbe7e68d828474878
	.xword	0x85b457082d74e2ab
	.xword	0x3fb1250d2b54ea47
	.xword	0x7249d50fd0018dd3
	.xword	0xdc624aca8966d808
	.xword	0x7baf169da215d090
	.xword	0xde5d2b93e8a0580d
	.xword	0x0bee846da75441b2
	.xword	0x892c34d29c8c4a26
	.xword	0x7a7128ccd3328f3f
	.xword	0x65577ca2091f8175
	.xword	0x7feac839b41f3915
	.xword	0xa3f3b3d62d96cad4
	.xword	0xf193ab7248afe8aa
	.xword	0x2de0d8dea6699f40
	.xword	0x191a28ecac20477f
	.xword	0x4086a502d93298f9
	.xword	0x8ebd6ab5dec04190
	.xword	0x17678f0902697b0f
	.xword	0x751b713b54379629
	.xword	0xdfac44dd9120ed6b
	.xword	0xfc33308fc439affc
	.xword	0x68b27706c68f384a
	.xword	0x2354d7fdacf5e100
	.xword	0x599e377ac038c7a7
	.xword	0x77e40e9c93f490d3
	.xword	0xde240346e4ed8521
	.xword	0xafd5ff832c5ce605
	.xword	0x435fe1ea902281ed
	.xword	0xd0a6e9b8079f29d0
	.xword	0x9f4f178fcd662a65
	.xword	0x4ab3a3eb6de6b9e0
	.xword	0xaa1f4f9df26abc93
	.xword	0x623e3107fa1cca06
	.xword	0x82b95c0d55922b19
	.xword	0xcf80cd418a63c05b
	.xword	0xd02703292318162e
	.xword	0x09be3fb0f1e222e2
	.xword	0xeed665b91a3d66cf
	.xword	0x854d91b25bc1fc25
	.xword	0x08d2d87fdd8d6d91
	.xword	0xa0b9d1e452947b3d
	.xword	0xbc2c34a94f47ff2a
	.xword	0xe0ed0656714cf4e0
	.xword	0xc3ae6244ad318ff2
	.xword	0xeaa7c6062585a46d
	.xword	0xe962c501565f3311
	.xword	0x7acce75b25ec53d2
	.xword	0xbc13b51e4e354305
	.xword	0x50b904f9b3628032
	.xword	0x84a37a9248331c87
	.xword	0x90360e9aac812135
	.xword	0x139f78ec646c85f5
	.xword	0x7b25bdd64b5384cb
	.xword	0x9630707d0bcaa427
	.xword	0xbeb2661c59d67f82
	.xword	0xbf73bf0035312703
	.xword	0x0ebed1e77f385e9c
	.xword	0x4a0f26411dc896e9
	.xword	0xa87f5cb32bf3204a
	.xword	0xeb13010d1e48213c
	.xword	0xef2d617a11251079
	.xword	0x1a7aa49854bd0102
	.xword	0xf48cdda8e475963c
	.xword	0x044d474ecdf7b340
	.xword	0x454bef0ac0d27f8c
	.xword	0xc6b4b6db95ebdcae
	.xword	0x76ef064cede3e193
	.xword	0x6b949a7b6b4ff449
	.xword	0xc8b56aff9f03605e
	.xword	0x4cd44a37944f6809
	.xword	0x3bf205480e36556a
	.xword	0x604fb7a337e51178
	.xword	0xc92661fc78942a1f
	.xword	0x9686113fcc94fe8e
	.xword	0x5a93cc1a12d262d5
	.xword	0xaf98664869f2665d
	.xword	0xb38b00df3c548616
	.xword	0xb84e4f2ed4f97c83
	.xword	0x5b81ef95ace26769
	.xword	0x5b2a3effe7d22f63
	.xword	0x6c0b4768dc12f6c4
	.xword	0x83392181de919d0d
	.xword	0x6eeedcb7dbbaa533
	.xword	0x1500726a2c200300
	.xword	0xe3b4e496dfae7701
	.xword	0x0a8baaa1e0a0a48c
	.xword	0xcca399acb112ea82
	.xword	0xf671adc4d4ebb0d4
	.xword	0x13ebe52a98a330b4
	.xword	0xd6b4ab35c09050be
	.xword	0xf18e0732d5b6de49
	.xword	0x30a3a40e5794ee39
	.xword	0x209ec2dd164fbe51
	.xword	0x4afb2a0a6d77be51
	.xword	0xe49de740299459f9
	.xword	0x514ca61e0597582c
	.xword	0x858ee2607572f969
	.xword	0x7bc6ed8beb61597a
	.xword	0x676bf6b9d3f2321a
	.xword	0x5c4d60a4db33976e
	.xword	0x8a2696afd7cc8d77
	.xword	0x9c8bf2f845717c9d
	.xword	0xe9130ae1102142f1
	.xword	0xf26c24892d3d383f
	.xword	0xe595efc567fb5004
	.xword	0x6c877e24f0219364
	.xword	0x714b7ec66a31de04
	.xword	0xe3c3bb353f8c7e42
	.xword	0x789db5e9f8ecd90d
	.xword	0xbf128a32ca04873a
	.xword	0x89969c73ead54c77
	.xword	0x561ee67b024ee783
	.xword	0x096e0d1ddeed139c
	.xword	0x3f52a2f24a7ae446
	.xword	0x1d7ec370a1b3df95
	.xword	0x5e22295c5bec57d4
	.xword	0x73dad3dc47204604
	.xword	0xefec634f22f322b8
	.xword	0x79038eb011ba5e48
	.xword	0xe8fa56c24984ca34
	.xword	0xadaf4b4acc717161
	.xword	0x0e3aebefbc647c6b
	.xword	0x280cc210b48252bd
	.xword	0xa0a16fd44897b67c
	.xword	0xa85ed84972d8ea7c
	.xword	0xeb1419de452eddee
	.xword	0xb4729dd7558f992e
	.xword	0x1007ad41078ddda8
	.xword	0xe222075a0a7b97d8
	.xword	0x3ba058a3d01985aa
	.xword	0xa5e21f8681794bf8
	.xword	0x37414ddc1310e81e
	.xword	0x4d9fdb5d21da4a2b
	.xword	0x646d531d1e5548bd
	.xword	0x38b3e6e672c30c14
	.xword	0x4fd2678cee006aac
	.xword	0xcf68393820ad4937
	.xword	0xa9a49b7266fb7bb1
	.xword	0x5143335fab298984
	.xword	0x6330dc30f4edb512
	.xword	0x2e3fc8752d363087
	.xword	0x148745e77da40816
	.xword	0x0f2fdeab36226ff2
	.xword	0xe7fc99b2f1e06b35
	.xword	0xc39d6e8f9007fc47
	.xword	0x470f4f6b0db99dab
	.xword	0xe13113eaf11f405c
	.xword	0x2cc9c3be7986c653
	.xword	0xc6fe2bdd18c9e168
	.xword	0x87fba6851e856b85
	.xword	0xeb9daed71764f5f2
	.xword	0x7e3f8ff29f00247e
	.xword	0x959119ac3e5a035b
	.xword	0x521d27d656bc1dae
	.xword	0x3a52a2441889d66f
	.xword	0xc557f723586d5b2d
	.xword	0x2b300d81f3941914
	.xword	0xa9e1818f1bcd0205
	.xword	0xa495ca2f8fe5f4d3
	.xword	0x860d234c8a807938
	.xword	0xf279456c23b9c364
	.xword	0x893bb6540b515f1e
	.xword	0x46856ff7bc859262
	.xword	0xf0c5d36a833eab59
	.xword	0x23329f28fbf02bd7
	.xword	0xb7c5ef03ede22cb0
	.xword	0x64ff924ff669c1f7
	.xword	0x829ba7af52c2bf20
	.xword	0x75db2dc4f4482c6d
	.xword	0xb8fd989c515afe40
	.xword	0xcadb2d6d40c2b923
	.xword	0xc4b08d48a5acfe19
	.xword	0x199800f3c846882c
	.xword	0xf7a4df4a9b7cea09
	.xword	0x035bbf98c7b24fe2
	.xword	0xa3bbf6c457aabce7
	.xword	0xcba78f5cbfb2a2cc
	.xword	0xd3b619fc2a60adf9
	.xword	0x660078f5099061bc
	.xword	0xb8497fe0ad6fb6bc
	.xword	0xf845fee51476744b
	.xword	0x4e1353dea109d4d9
	.xword	0x8e5bfbcdf6faf882
	.xword	0xd80df6a61b811b3f
	.xword	0x95b7b439c2a6744e
	.xword	0xd05ecf8b4af2533b
	.xword	0x857b3d55d9c95018
	.xword	0x8a8e10e32a587ef7
	.xword	0x92b78a28141d92e7
	.xword	0x950120fbbeda44ba
	.xword	0xc15eafbcad0d7ea6
	.xword	0x7cfd00e255c55e9d
	.xword	0xb8e56854c271feb3
	.xword	0x0ea11be74bf0f0f9
	.xword	0x2c284a90b66acd14
	.xword	0x1095aae0e25e29b1
	.xword	0x9e3318fafd5b7d9c
	.xword	0x464747693aa0c89e
	.xword	0xf591d658386a5156
	.xword	0x7f5d9bdbab3150d1
	.xword	0x06ead464c1435f06
	.xword	0x5ba90739b87b2077
	.xword	0x81d1f65a1a7e2544
	.xword	0xa4f162c6911a7113
	.xword	0x7819303249977f37
	.xword	0x70f0bef96245b0d0
	.xword	0x777ea4ac0f9d2bb2
	.xword	0xcbfaec70c7063937
	.xword	0xb43d05cc0750ebc7
	.xword	0xcf7b443cda3d8e8c
	.xword	0xedb60c8f525d2c2f
	.xword	0xa8c7a56cf86e0cdc
	.xword	0x385d277e0f5f9db8
	.xword	0xaa971de00dd7fd35
	.xword	0x2fe0e65b3e545065
	.xword	0x59a6b07b50224147
	.xword	0x6fe46eab60f57dbc
	.xword	0x1760de6491695686
	.xword	0x0c81f058840ca516
	.xword	0xda2c4c39004af5ed
	.xword	0x712583e0e2395717
	.xword	0x84312b32b107c19b
	.xword	0x67ea15300a547627
	.xword	0xb4935677cef5b60c
	.xword	0x493bdfd86feb89ad
	.xword	0x2f228649e074be53
	.xword	0x2bf47dacde9f1754
	.xword	0xc98bb9d1d9157065
	.xword	0xf1fffed257d45e8b
	.xword	0xcb76c2d5fdf2b7ed
	.xword	0xaa8aa50da7498db6
	.xword	0x602b4bb69f5d7db0
	.xword	0x3f6ade952603c6ea
	.xword	0x0fa4723664e32e4a
	.xword	0x94bb8168a078a8c4
	.xword	0x88dd3578a46b5a8b
	.xword	0xe4012be0a75b2938
	.xword	0x43bf80cd90f44af1
	.xword	0x27185f27159eb81f
	.xword	0x54cf4854462544b2
	.xword	0x6fedbe6305b1a74c
	.xword	0x90841d1a9d927fb9
	.xword	0x21311a0e066f3366
	.xword	0xd700323f9726d4e2
	.xword	0x2f33dd3cd065b38e
	.xword	0x1492151715fcbde7
	.xword	0x77f418d242b09e06
	.xword	0xb577cdb8582c9ab3
	.xword	0x6a0c2187db0da4d5
	.xword	0x8beb19c53daefb16
	.xword	0x837f0f8b27fc68cf
	.xword	0x051867f9319523e3
	.xword	0xb83cdf05616fb613
	.xword	0xd2d9bf61a6ce152f
	.xword	0xcea8d70a2838ce04
	.align 0x40000
	.data
data_start_6:

	.xword	0xb9f592f1af502ab9
	.xword	0x025989ddaa0f01bd
	.xword	0x2cc198bdcbb02da4
	.xword	0xea1d4e1b17ad0937
	.xword	0xc13ee2fe44dbeb5b
	.xword	0x9e568b253c428a67
	.xword	0x042c48e08ba080dc
	.xword	0xbcc69b225d297f9d
	.xword	0xa4f5ba486b0d6195
	.xword	0x1218bc960df98568
	.xword	0x1689c9f40cd578b7
	.xword	0x88b6170830ef26d8
	.xword	0x9f7cec9eb8b276a5
	.xword	0xfdf119742506b29d
	.xword	0xaee2bcd361ba6ee3
	.xword	0x48490912a86585d0
	.xword	0xae1f1982bf0cd74e
	.xword	0x16e9c7e2360da0e9
	.xword	0xb790e3ac7908796a
	.xword	0x3fd0690bc6b75998
	.xword	0x51aa7d66a8cdfe83
	.xword	0x2e459bce76bca791
	.xword	0x697095ff897bc590
	.xword	0x6343a47f3fc86ee8
	.xword	0x2f7e40b8b3da56ba
	.xword	0x5c860a249fa6ef37
	.xword	0x0c88c3c50d10ab2b
	.xword	0xe6e564e0a71ea5ca
	.xword	0xbbe194221cdf2977
	.xword	0x55a07961838df77e
	.xword	0x126057637b2f7c63
	.xword	0xf28a46eacc447929
	.xword	0xa723cda7285c5145
	.xword	0x4e0d0e7b2ac3e962
	.xword	0x2bfbb0cf048f46d9
	.xword	0xd578073bf7b44f4d
	.xword	0x2964395d54dbc488
	.xword	0x3fa03405d49a92d5
	.xword	0xa4769caf03e4d9a4
	.xword	0x7894225cb15c9d5b
	.xword	0xf9a8103ff5b1fdfd
	.xword	0x4313674583403620
	.xword	0x02f8df6c0565933f
	.xword	0xa7c3db5e05dac212
	.xword	0x0c3c507959e180c6
	.xword	0xa4c9bcafd77170cf
	.xword	0x1842e3c587aff8fc
	.xword	0x0ce1d421bd348b47
	.xword	0x2f7436d375c6e3ae
	.xword	0xcc2f2cfab4e441b4
	.xword	0x5485dca59ef10460
	.xword	0x813b0e6b7b025dc9
	.xword	0x187a8d9eced9d0fe
	.xword	0xcc17a8e9148e94e2
	.xword	0x70738a52383e1cf3
	.xword	0x7e0364e899529f65
	.xword	0x161ebad2509fa3c3
	.xword	0x97bf8031b1911874
	.xword	0x1e4fe9592a592caa
	.xword	0x5ea7e7991e05ddbb
	.xword	0x5a39f5391749a73c
	.xword	0xdc03418798b989d8
	.xword	0x179b36cec71aefac
	.xword	0xf814e1375b883ee4
	.xword	0x87e34fa73d52f5d5
	.xword	0x87b16713b066e28d
	.xword	0x4f5061bc44c24150
	.xword	0x4fb4e77ff6acba9e
	.xword	0x3cae43c07dd0ce95
	.xword	0x85e171404ce2f366
	.xword	0xade8a3ebd90aea42
	.xword	0x8e7f06c5f12ed46a
	.xword	0x4f5c9f35edce82ce
	.xword	0xee54c241dc7d91ec
	.xword	0xe1a8ed4fcc10f67c
	.xword	0xbeb502558d34ff1d
	.xword	0x7563c9e914696e3d
	.xword	0x74a30da168f6a153
	.xword	0xbe3610410f8c7870
	.xword	0xcb14e6e6ab1e7076
	.xword	0x1a93b9d5fca61564
	.xword	0x62cead299fff8133
	.xword	0xe7c53e6f13dc0098
	.xword	0xf3e7d44cbb2afeaa
	.xword	0xc566d8d7abbfde59
	.xword	0xccd9577507a82da8
	.xword	0x9216fc83e6b30ce4
	.xword	0xac077ce93909f382
	.xword	0x305407c193c7a364
	.xword	0xb15cef25ac3f3f68
	.xword	0xf0090e5d3fdfe01c
	.xword	0x5ab4170f74a328a5
	.xword	0x337087763d77b8d4
	.xword	0x0827114b7d1d9944
	.xword	0x491eb36261a5d13f
	.xword	0xa8b9d6d92e4531c2
	.xword	0xac23f4421db5c281
	.xword	0xc39aa18c499837f8
	.xword	0xc6bb5847623a828b
	.xword	0xb0c4b2aa1841d44d
	.xword	0xd1f12697035b1e3f
	.xword	0x10456fb980b5cf1b
	.xword	0xf992830262f0fe23
	.xword	0xc1bf5e93edd9170d
	.xword	0xf244eb0863625fb2
	.xword	0x5644ec859e3f1596
	.xword	0x44e74f4a143bd3a2
	.xword	0x748453493cfe25ca
	.xword	0xd335a6d64d6af246
	.xword	0x795272e2ed51475a
	.xword	0x0cca4b53a07cc1a3
	.xword	0xefc02a2db36bd03f
	.xword	0x4e3fca78be9dab7d
	.xword	0xf810d0b037c0a155
	.xword	0x9ad31082171f8928
	.xword	0x8a1d48ff0c41ed93
	.xword	0x259443cf31392386
	.xword	0x002b605bd33e4ee6
	.xword	0x11be82c0dd16be0d
	.xword	0x58028558641e8e04
	.xword	0x15bdc9b3f2e616f9
	.xword	0xfbe15e8dd5bf7e32
	.xword	0x3e6e645d54a9a762
	.xword	0xcbd4c26113c2bd60
	.xword	0xc97f4baf1b2acded
	.xword	0x13a95e70e4ef1eb4
	.xword	0x7c74f8685f84bdaf
	.xword	0x951c5ee1deebed12
	.xword	0x4f8a5ac423291f81
	.xword	0xf6a1c319b6ff8bd3
	.xword	0x812f1cc76959c200
	.xword	0xc238ae267eca9619
	.xword	0xf26a18f9a1d3b3b4
	.xword	0x61bc94d4d640e2f4
	.xword	0x38fb03a3a33f9ff2
	.xword	0x03ea17fe2bda6c36
	.xword	0xbd0550fc8bd20cb7
	.xword	0x3c0bd57e83a638f7
	.xword	0xb4017916c7410d32
	.xword	0xe89b831e02b8b492
	.xword	0xafc70b74dc88a9e1
	.xword	0xc7fe00ad8c577595
	.xword	0x02dbf06a632493c5
	.xword	0x87b6aa4c57431ae9
	.xword	0xe65038cb7ebe062f
	.xword	0x55a5283c078726b5
	.xword	0xb50760bd2f47c632
	.xword	0xfcb059d3369a69f7
	.xword	0x74b62b4e3296c2b6
	.xword	0x05a9320935588e9f
	.xword	0xdddeb44c92066e1a
	.xword	0x0413a5d68fb30c0b
	.xword	0xda50855e5942ba8c
	.xword	0xc2a28a91e08a6916
	.xword	0x15d597c3489db723
	.xword	0x47eb9f566f346424
	.xword	0x9bf29d9db5f98a58
	.xword	0x899f2657665ac592
	.xword	0x100dd50e1653891f
	.xword	0x9ef9ca83234dbf31
	.xword	0x37ea16dc6b3d4cbb
	.xword	0x749e927121f258aa
	.xword	0x0d41315d741c698f
	.xword	0x4590a798ce05a97f
	.xword	0xe7c7f183fb804053
	.xword	0xb31be5e5e6bc4a76
	.xword	0xa0749118e6343c3d
	.xword	0x6d7d92170c3a4709
	.xword	0x0c99cb2641bf9540
	.xword	0x513eb82d6eae9530
	.xword	0x6b0135b1d818e7fc
	.xword	0x64d1f5c28adef9e8
	.xword	0x497da727b29adfd5
	.xword	0x775cd48de819f996
	.xword	0xe3c6b244804f8e61
	.xword	0xe975fb14020273dd
	.xword	0xef3e1c6a8d6e00c7
	.xword	0x02b4df93fdc90af4
	.xword	0x7768d0c2fa8a49ad
	.xword	0xbaf99e42faa33e84
	.xword	0x548ee6a087dd997a
	.xword	0x1b1b6a0bfbc6c9a2
	.xword	0xf755a0d4950e4d03
	.xword	0x94a126e6d73cea89
	.xword	0x86673de658384abb
	.xword	0x6e5d65a13b82e76d
	.xword	0x73f36660cfd9fe6e
	.xword	0x22ae43a280fab314
	.xword	0x9d4b47fd5acd2071
	.xword	0x5fa6036eaa915c25
	.xword	0x830e578bb075e712
	.xword	0x8ce43481c7b22374
	.xword	0x5c27a2b7054a5819
	.xword	0x95d04f6440ebbdf9
	.xword	0x09786188ba16189f
	.xword	0x33cb59b8512f9e42
	.xword	0x9c4f85a0ba91c48f
	.xword	0x1d0e251838745a34
	.xword	0x087bcdf7ab967666
	.xword	0x271a91226a579f80
	.xword	0xd8d0fdb9802b62e8
	.xword	0xfc776324b2a7c88d
	.xword	0x80d045fb21054b69
	.xword	0x7abf2a1608ad8786
	.xword	0x01a4d4583374ccac
	.xword	0x247e6c679347376d
	.xword	0x4f275af92c4f245b
	.xword	0x429b938642128bc9
	.xword	0x7bcf41ec05a7675b
	.xword	0x0dc873d8d7ca3948
	.xword	0x5f13f645bf264ec2
	.xword	0x9d568ce6bb82ed60
	.xword	0x5bfef897eba0adf3
	.xword	0x592ce54f7de43919
	.xword	0xf75aced3ad1d3396
	.xword	0x195df3c3a1f44596
	.xword	0x15773fcc1a493025
	.xword	0x2138c678f50bacc1
	.xword	0x574b44477d553a8e
	.xword	0xfeb47d735fd07465
	.xword	0xc8321d4c653de425
	.xword	0xac0a77cb53072a35
	.xword	0xce1283b9e65e8c07
	.xword	0xf25cd0046df68131
	.xword	0xb97c0518ce304033
	.xword	0x2b7b8c388230eef2
	.xword	0xbeb8f72f63c6a06b
	.xword	0xce14427fad4fd5b3
	.xword	0x6c453e2a3b1c1822
	.xword	0x6b9a11451da88fab
	.xword	0x9400a7f17772b399
	.xword	0x55d0492478202743
	.xword	0x8d31ca12e7afb2a5
	.xword	0x13d8afd410e7fa5a
	.xword	0x2750a96bead2e321
	.xword	0x5efcb3237a29f143
	.xword	0x8c9bc074b1dac3a6
	.xword	0x30c4f047d877d5c0
	.xword	0x907dbbf2cc0d1090
	.xword	0x2b32533eb46440c7
	.xword	0x5ef8c40e64698155
	.xword	0x0e52e80712046830
	.xword	0x81c480aa2eb5a0b1
	.xword	0xa26df3b5de4e11a3
	.xword	0xc9378b367d197b93
	.xword	0x5334b473e1e8d86f
	.xword	0x7f3b07619a880c2a
	.xword	0xcf529c193bea6662
	.xword	0xfc3a6f9a7d1170dc
	.xword	0xf4410e5b1e8383ff
	.xword	0x1ccb82ee2c3308d0
	.xword	0x686454b7863e7a7a
	.xword	0x0ec56524384c5e52
	.xword	0x257039c4090aa51f
	.xword	0x54b23b07c29f8b32
	.xword	0xce2fdf3f4e0130ea
	.align 0x80000
	.data
data_start_7:

	.xword	0xe7e39e28209aafa8
	.xword	0xc059c56c74b36c74
	.xword	0xc7cd0ea5290978aa
	.xword	0x5f119d1163680f91
	.xword	0x169f9d198e80f16f
	.xword	0x0aac42dccd65cc0d
	.xword	0xe0063e8d14ef48ba
	.xword	0x9b2e858cf65e374e
	.xword	0xe9724edee14de12e
	.xword	0x00462eb902fcb8a1
	.xword	0x1b06053be7973fd9
	.xword	0xa1c31711a4d0dbcd
	.xword	0x685a114ec457b5d0
	.xword	0xf823b316b7962fb1
	.xword	0xd7a7b4ac728b6265
	.xword	0xb4ad897643843645
	.xword	0xf489668dd81b0ff7
	.xword	0x81fda95617134f56
	.xword	0x9f88b4ce98f95e6b
	.xword	0x0f3e982e91454b26
	.xword	0xff7c70e30d9a6b46
	.xword	0xf34e22c88319a452
	.xword	0xc06d0f402b2262d6
	.xword	0xc80d6cd7f90c5df7
	.xword	0xa3f8f876aaf6a693
	.xword	0x1a1619fd9cd1728e
	.xword	0xe01cd496dc58469c
	.xword	0x9f44724661091501
	.xword	0x4f6584e826e98396
	.xword	0x1a71cff6b15984b6
	.xword	0x89d66077f6429d21
	.xword	0x5c921634064377a9
	.xword	0x3e7508735c2f0749
	.xword	0xbb52fbe9071785fd
	.xword	0x66f1dd6627262013
	.xword	0x1ad256f6f5132bf6
	.xword	0x4c77ae78603dab93
	.xword	0x9cdcba3361e3953e
	.xword	0x7292aa446c9090d3
	.xword	0xff665dc6ce813bb5
	.xword	0x84fc2c48827297aa
	.xword	0x04f7db30b44bba95
	.xword	0xf2cb70810cd803e7
	.xword	0x7895449cdedf4e4f
	.xword	0x1a814c28f63bc874
	.xword	0x46e6d1b9f1a2320f
	.xword	0xf32276e1fc7ff8d7
	.xword	0xfe49bca245c14d90
	.xword	0x4c0733914dd5b4ea
	.xword	0xf873ac97a7cadda3
	.xword	0x6666383a0667838e
	.xword	0x6f77af80d1a301c1
	.xword	0xb0365ec23e3fc6ec
	.xword	0x1e4de355c32ec8d3
	.xword	0x94730b93288fb42c
	.xword	0x5317d6f2efe8fb21
	.xword	0xa769f5a0124ed498
	.xword	0x453dc1b735f79b6f
	.xword	0x085077e5a840efad
	.xword	0x869031bb24b51084
	.xword	0x773dd3a9a09af266
	.xword	0x4cf6d8df6fc67385
	.xword	0xbd600b0a04784ae7
	.xword	0x5ad3692f0f22d334
	.xword	0x0ca3ea918224fa48
	.xword	0xdbf116058e0b5c3e
	.xword	0x7c412d211f2859e8
	.xword	0x981eb174eb98b53e
	.xword	0x47c8f68fee13f3d7
	.xword	0x0b9116f81311b4c0
	.xword	0x9dcabb7335a6e20e
	.xword	0x40e86e3cd4244f7a
	.xword	0xf6764c5cbedc1671
	.xword	0x25fd1532547014a4
	.xword	0x6ac4cd57b707714f
	.xword	0x6aff08d24635018b
	.xword	0x20f2e02cffd58105
	.xword	0xd69ee727784112a1
	.xword	0x38d3be83f521deb7
	.xword	0xa07cd4c09c00f7dc
	.xword	0x1f176e6a7129d2fe
	.xword	0xb253649d1d3761f1
	.xword	0x44c1521c61633055
	.xword	0x20b07603093f2f2b
	.xword	0x454930286f2e0d1c
	.xword	0x56655bcf032ae535
	.xword	0x0a53f98f7c190c9c
	.xword	0xc5d6ec35d4b40f56
	.xword	0x55cb916985b30aeb
	.xword	0x8b22beb40908f274
	.xword	0xf9d2367f560f62a6
	.xword	0xc71b6f3ffef984aa
	.xword	0xc0bf8e3122b05c4f
	.xword	0xad16d1362772592f
	.xword	0x691753c1a2facdaf
	.xword	0x462b8c4d1804c1ee
	.xword	0x5bbb879cda7a1067
	.xword	0x640a82e556d0f2d4
	.xword	0xcc10a6526cd80f23
	.xword	0x857c375c2073a777
	.xword	0x38ef0592464ba5bf
	.xword	0x7dc936942d158eae
	.xword	0x364d174770a26bf4
	.xword	0x2408e38371e0faaf
	.xword	0x5e1d970add7c9cb4
	.xword	0xc0e7893d66182d11
	.xword	0x15f8dd93cd72e97d
	.xword	0x0fb1d6610035a2ea
	.xword	0xd7cec0341f29eae7
	.xword	0xa3c4b0a4e1dd0104
	.xword	0x4d210114ea10c7f5
	.xword	0x67bf8f2e6e7ce8ed
	.xword	0x2b8e39f463221277
	.xword	0x2db43b5e17b8ac42
	.xword	0xe4ffc6a4ca670ea7
	.xword	0x8a67fd3cb8ae6b96
	.xword	0x056fca0889f7f12d
	.xword	0x2cdb2a33554bcbca
	.xword	0x306ec7f525e1d048
	.xword	0xc7d53c47edfd3944
	.xword	0xb2cc32ee473383a8
	.xword	0x2ab9610c04d8b008
	.xword	0xcb286a3c47990332
	.xword	0x009c860e7b57bf6b
	.xword	0xb332a66301ad9b10
	.xword	0xa16ca29c58a56817
	.xword	0x269a8496c2d41324
	.xword	0x9507a8693cf5e917
	.xword	0x49f1c823bc037f67
	.xword	0x328851e1ecc291b3
	.xword	0xdb8474b87f8d5fa0
	.xword	0x1864a4c926ebbd3f
	.xword	0xa8a8f0124246d718
	.xword	0x0727549dafaf47f8
	.xword	0x517736a7e26072d6
	.xword	0xa5ac948d1759c042
	.xword	0xbcda2f10173ee039
	.xword	0x1533d40522130d7d
	.xword	0xbe2f45df7ac2a354
	.xword	0x9727ebbe7082315b
	.xword	0x2dcf97a318023330
	.xword	0xfeb5a2e064e9a036
	.xword	0xa0eaa250dcd46223
	.xword	0x865525ac19709f21
	.xword	0xb2b9a287699be9ae
	.xword	0xed9d3b35e9f4a085
	.xword	0xa7e0e11479fa49e5
	.xword	0xa1b2bed58512be89
	.xword	0x7078a3bc4824c07f
	.xword	0x086d462299dd7ec2
	.xword	0x6b944273f300d15f
	.xword	0x897769fd78ce3aaa
	.xword	0x85c742b79398fb7b
	.xword	0x2bcb352d718d4583
	.xword	0x77d99bf5c27ddab1
	.xword	0x70011fc6334d9361
	.xword	0x859cb20aeba32345
	.xword	0xeb321f9fea7b7716
	.xword	0xfb11e8f35637759a
	.xword	0x4962ac553097c017
	.xword	0xb19c342c780cabcb
	.xword	0x9aa0e26e7da8f540
	.xword	0x42eb3a662407c7df
	.xword	0x6a00c05f1f01a543
	.xword	0xa1300e1abdd44612
	.xword	0x05004821448ffe4b
	.xword	0xe881dfab1ce6bc60
	.xword	0xc37fa8f00da600e7
	.xword	0xc790ee9aa7146204
	.xword	0x6b4925b6fba37076
	.xword	0x76018b7b48958cb6
	.xword	0x12d7f340357386cb
	.xword	0xd10aac7d11fa72ad
	.xword	0x94fc08e1e1086fce
	.xword	0x2747ece886a4eb2d
	.xword	0x93cc4d8f6f4d47ba
	.xword	0x6a43ce7e06aed89b
	.xword	0xe3f562ab6da7b75e
	.xword	0xf0d75f2e9f81953b
	.xword	0x702f57fd957be674
	.xword	0x9933bdf62822287e
	.xword	0xdb876d16512d6e72
	.xword	0x3e9acc3f2a0fb7c4
	.xword	0x488172fd824a5a7d
	.xword	0x244970fc4ff9eedb
	.xword	0x559a578c1f29ff2e
	.xword	0x810124f3e0cf6948
	.xword	0x372079022e1ce8a0
	.xword	0x2ee5e2576b661561
	.xword	0x882bf7a5f7b684e7
	.xword	0x97a67925e422afb6
	.xword	0xd4ca993f6988a685
	.xword	0xa9764bd68dcd5c2d
	.xword	0x9b682a91f09bf98c
	.xword	0x87c6119824769304
	.xword	0x49adb99233192066
	.xword	0x0955a223bbcbb81c
	.xword	0x71209a2a8d2ffd43
	.xword	0x01b3582d5608ab41
	.xword	0xbdaa5bc3785cd116
	.xword	0x057b5df7ece22235
	.xword	0x88805d653ee9dc4e
	.xword	0x151fbaa84777a6ac
	.xword	0xf11ce042bd6fcf7f
	.xword	0xde4ac1a54cec21a0
	.xword	0xc41761870d72a6b9
	.xword	0x75e6341f2c50741b
	.xword	0x8257ecbf835aa03b
	.xword	0x931d4fa85c30b600
	.xword	0x9bbf4fbb176819b7
	.xword	0xfe035c26f0c7a887
	.xword	0xd16226d04e18425e
	.xword	0x62576609a9830738
	.xword	0xd3668ac319fb6a73
	.xword	0x7065df9d31539d9c
	.xword	0xf03a2f0028280268
	.xword	0xdb9ee50776748843
	.xword	0xe6d90614106bc167
	.xword	0xecf9d4f97009f0cb
	.xword	0x4ac88309c9bbc661
	.xword	0x76e2e83b37b40e1e
	.xword	0xdeb40b89a01152d3
	.xword	0xf450d76a2ed4b608
	.xword	0x7d9c014e0cf0a134
	.xword	0x06806c7a7c251617
	.xword	0xab18da37d4692411
	.xword	0xfdd685260db60520
	.xword	0xa4cbfb2a73d355d6
	.xword	0xb3d0f7f766c03eb2
	.xword	0x835f57328fa741b8
	.xword	0x77342ba6d1cb01cc
	.xword	0x495a1bc53650029d
	.xword	0xc18c225f398ac3da
	.xword	0x0a9627349f3c63e2
	.xword	0xada941976b234f56
	.xword	0xd712efc336ad9c12
	.xword	0x144bec98af8ab047
	.xword	0xd7bf29f30bf85b81
	.xword	0x2fb027648488aeb2
	.xword	0xa7fd3d0e928273e5
	.xword	0x0a68dbe5e03fa7a4
	.xword	0x799756a1aea576d0
	.xword	0xca1864a7cf6805ac
	.xword	0xea3b4afe8feafd75
	.xword	0x189805cbb5bc4457
	.xword	0xab7a89dad49f73e2
	.xword	0xaa8ea306d3c98668
	.xword	0xa944b29449b74d13
	.xword	0x724c65efeb296bb2
	.xword	0x8ee7ff0744bcda41
	.xword	0xb4670d2afb9dc96f
	.xword	0x55781cc5c6d7fc02
	.xword	0x7836c48945f900ae
	.xword	0x120f0c3534eb44f2
	.xword	0x9edcdec9af5dff01
	.xword	0xee4dfad0fbea43e7



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
