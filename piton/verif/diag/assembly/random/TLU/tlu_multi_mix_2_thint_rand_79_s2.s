// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_79_s2.s
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
   random seed:	207174251
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

	setx 0x20266ebc25e84200, %g1, %g0
	setx 0xa74aa13cf2811e25, %g1, %g1
	setx 0x653e49f61e81a3e0, %g1, %g2
	setx 0xbf87f3940ecd7329, %g1, %g3
	setx 0x11011c81ae148cdf, %g1, %g4
	setx 0xb43d5f4c7ff8d326, %g1, %g5
	setx 0xc4b0028e5d4a7eaa, %g1, %g6
	setx 0x358a12c4d0d6822e, %g1, %g7
	setx 0x6463bd04f6ae1d79, %g1, %r16
	setx 0x9a184bb6b2c0f1bb, %g1, %r17
	setx 0xe8a8717159c55730, %g1, %r18
	setx 0xffc06f0945c3f58d, %g1, %r19
	setx 0x37aaa77bb0ea8701, %g1, %r20
	setx 0x6affa722be1725dc, %g1, %r21
	setx 0x309aec79a82f7fc1, %g1, %r22
	setx 0x4dc9e224d2c19174, %g1, %r23
	setx 0x0fed9e601bbcf45b, %g1, %r24
	setx 0x9b0d10e18407d6de, %g1, %r25
	setx 0x12a16c0760b25b04, %g1, %r26
	setx 0xc14ca681494ae7ce, %g1, %r27
	setx 0xbfcb8377c8ef7759, %g1, %r28
	setx 0x81f5b353c32e321e, %g1, %r29
	setx 0x99331c79a8ccc25f, %g1, %r30
	setx 0xd6b9812faae1e930, %g1, %r31
	save
	setx 0x440fbc52de610032, %g1, %r16
	setx 0xe8f952941bd3a539, %g1, %r17
	setx 0x31745c3431100030, %g1, %r18
	setx 0xeb5fc3cb411328c3, %g1, %r19
	setx 0x92b5444985fbb656, %g1, %r20
	setx 0x3850ff05e0b31e68, %g1, %r21
	setx 0x84644fc3e4ac66a8, %g1, %r22
	setx 0xbc31edc9a1a57439, %g1, %r23
	setx 0xd5eb78ca93e04833, %g1, %r24
	setx 0xf7081f06b72044e4, %g1, %r25
	setx 0x4c1e5143be880b3d, %g1, %r26
	setx 0xcb370c58247deabd, %g1, %r27
	setx 0xf195dca0c8c90a50, %g1, %r28
	setx 0x723bb45acf33c0a9, %g1, %r29
	setx 0x7c82cae9298016bb, %g1, %r30
	setx 0x08b1f7ad96491e4d, %g1, %r31
	save
	setx 0x1779bc85b59f09d7, %g1, %r16
	setx 0x8379f28e1c44eaf6, %g1, %r17
	setx 0x299128f695a9a34a, %g1, %r18
	setx 0x3a50b254e547864a, %g1, %r19
	setx 0x80b544699777144c, %g1, %r20
	setx 0x134676cfbc2c7b90, %g1, %r21
	setx 0x8c1f06a981f6481f, %g1, %r22
	setx 0x53d381838d3224cb, %g1, %r23
	setx 0x0bf64d7d014f8d75, %g1, %r24
	setx 0x0eb51808dce44cb1, %g1, %r25
	setx 0xe00e3b46ce976663, %g1, %r26
	setx 0x42b5a9a7d03948dd, %g1, %r27
	setx 0xaff34cde0514c909, %g1, %r28
	setx 0x30163ff51b6cf98d, %g1, %r29
	setx 0xdf61fe57b19ec84e, %g1, %r30
	setx 0x93a0c859357c0a85, %g1, %r31
	save
	setx 0xe4cd22e5f54e10b2, %g1, %r16
	setx 0xfa267a32b0aa691d, %g1, %r17
	setx 0x42ff262c8d47c774, %g1, %r18
	setx 0xa156ba53deaea84e, %g1, %r19
	setx 0x192b7c7c439b3bd1, %g1, %r20
	setx 0x3267af98ec12319f, %g1, %r21
	setx 0xce5963680424f99f, %g1, %r22
	setx 0xc8febdaf6f343066, %g1, %r23
	setx 0xae076838d978c15f, %g1, %r24
	setx 0x3f162513908b83da, %g1, %r25
	setx 0xec732b5187dfdccc, %g1, %r26
	setx 0xa57ff5888870810c, %g1, %r27
	setx 0x9df71118171c60a1, %g1, %r28
	setx 0xf9a1340516a670cb, %g1, %r29
	setx 0xa83832c4fd98cd88, %g1, %r30
	setx 0x537802cf2e83bddb, %g1, %r31
	save
	setx 0x2fb997d6da25a3f3, %g1, %r16
	setx 0xd04659bb7c1cb6af, %g1, %r17
	setx 0x9bf9ab019d944b49, %g1, %r18
	setx 0x2cc10bafa9d8771e, %g1, %r19
	setx 0x05959255a22ef9e0, %g1, %r20
	setx 0xf1ba80333e596a5b, %g1, %r21
	setx 0xb549d5c0218b9d95, %g1, %r22
	setx 0xf4a7adc7695fe539, %g1, %r23
	setx 0xc828639287bdecd1, %g1, %r24
	setx 0x7669cecf2177a499, %g1, %r25
	setx 0xdff1a64051e0422d, %g1, %r26
	setx 0x54503d07b732ac38, %g1, %r27
	setx 0xca3fcac933eb0ef8, %g1, %r28
	setx 0xbc6c8d7d316c0e11, %g1, %r29
	setx 0x622d8104953e351d, %g1, %r30
	setx 0x138523955439a911, %g1, %r31
	save
	setx 0x043ffd18516a1505, %g1, %r16
	setx 0x3bd27ca8f266d35e, %g1, %r17
	setx 0x2a6fc166fb65a2b1, %g1, %r18
	setx 0x59d09a2bedc833f7, %g1, %r19
	setx 0xd78fb14e83394c8b, %g1, %r20
	setx 0xa39c17524aa138ed, %g1, %r21
	setx 0x0a3c01bd83add739, %g1, %r22
	setx 0xe45726a17d0ba9a1, %g1, %r23
	setx 0xfbf3b5800ebb2af7, %g1, %r24
	setx 0x086948a81defb120, %g1, %r25
	setx 0x442b4194f04bfe4b, %g1, %r26
	setx 0xcf1790f80826d917, %g1, %r27
	setx 0xe5d11560accdd8e4, %g1, %r28
	setx 0x27a5bec35f5a5841, %g1, %r29
	setx 0x73353953178b9df8, %g1, %r30
	setx 0x6a1717bd2496c24d, %g1, %r31
	save
	setx 0xf22008c57e1932bf, %g1, %r16
	setx 0xf906f70f8184dfc5, %g1, %r17
	setx 0x4833937181a49b33, %g1, %r18
	setx 0x4433d52f02faafb9, %g1, %r19
	setx 0x414e68b9af7b5ec2, %g1, %r20
	setx 0x5a7f0de5e9ac19aa, %g1, %r21
	setx 0x476f946e40aae260, %g1, %r22
	setx 0xa0f5aaf8781907ac, %g1, %r23
	setx 0x1e3017e56ce99115, %g1, %r24
	setx 0xb61269ca23d0e055, %g1, %r25
	setx 0x2dff13e6d84a7b07, %g1, %r26
	setx 0x468e7d2daf3ddd66, %g1, %r27
	setx 0x2673b382feb6217e, %g1, %r28
	setx 0x2476c32d0b83b54b, %g1, %r29
	setx 0x345d91f15e1c396f, %g1, %r30
	setx 0x1478e289a84718ed, %g1, %r31
	save
	setx 0x952fdc77ad4d7f58, %g1, %r16
	setx 0x17d7d598a9a52b80, %g1, %r17
	setx 0x88944a7b8c1a69ad, %g1, %r18
	setx 0x9b924a7ffe8a0f86, %g1, %r19
	setx 0x2e239bf952e6c427, %g1, %r20
	setx 0x94ae9deb3d79105c, %g1, %r21
	setx 0xa8838d84910c630c, %g1, %r22
	setx 0xe523080097a0d6b9, %g1, %r23
	setx 0x9dbc72aaeab88d09, %g1, %r24
	setx 0x4ddb9e6b18931c3f, %g1, %r25
	setx 0xebe71195d5bb0048, %g1, %r26
	setx 0xd0bae1a5b8377f6c, %g1, %r27
	setx 0x40382246af674550, %g1, %r28
	setx 0x7002543f12ed546c, %g1, %r29
	setx 0xba9c06b0d4fdbebd, %g1, %r30
	setx 0x90c342c7fad490b0, %g1, %r31
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
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e461b2  ! 3: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0x8995a0f6  ! 13: WRPR_TICK_I	wrpr	%r22, 0x00f6, %tick
	.word 0x8794609f  ! 14: WRPR_TT_I	wrpr	%r17, 0x009f, %tt
	.word 0xbde56064  ! 17: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e02b  ! 22: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e56044  ! 24: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5e013  ! 25: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4e1a4  ! 32: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e13  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e13, %hpstate
	.word 0xb77c4400  ! 42: MOVR_R	movre	%r17, %r0, %r27
	.word 0xb7643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0xbbe52033  ! 48: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe460a7  ! 49: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb8ade18e  ! 52: ANDNcc_I	andncc 	%r23, 0x018e, %r28
	.word 0xb9e5e077  ! 59: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a0e7  ! 63: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xbd504000  ! 71: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e19e  ! 72: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5510000  ! 73: RDPR_TICK	<illegal instruction>
	.word 0xb1e52096  ! 76: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb8c4204b  ! 77: ADDCcc_I	addccc 	%r16, 0x004b, %r28
	.word 0xbde4a1db  ! 79: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e56110  ! 82: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e46038  ! 88: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x839420a1  ! 90: WRPR_TNPC_I	wrpr	%r16, 0x00a1, %tnpc
	.word 0xb5e560b2  ! 91: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4610b  ! 95: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbb518000  ! 97: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 98: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e56058  ! 103: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46193  ! 107: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a00c  ! 108: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe520d1  ! 110: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_0, %g1, %r20
	.word 0xb7e52172  ! 121: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4e12d  ! 125: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e460fd  ! 126: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf51c000  ! 131: RDPR_TL	<illegal instruction>
	.word 0xb5e421a5  ! 134: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd510000  ! 135: RDPR_TICK	<illegal instruction>
	.word 0xb3e4a193  ! 136: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4e066  ! 137: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e5e09a  ! 138: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a102  ! 145: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e18b  ! 146: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e167  ! 148: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe4a050  ! 150: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe56079  ! 152: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5a149  ! 156: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e56060  ! 158: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5a080  ! 160: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xb1e46077  ! 166: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb57ce401  ! 167: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb52c0000  ! 168: SLL_R	sll 	%r16, %r0, %r26
	.word 0xb3504000  ! 169: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a021  ! 170: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb53c1000  ! 171: SRAX_R	srax	%r16, %r0, %r26
	.word 0xb5e5e165  ! 172: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e521b1  ! 175: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460d4  ! 186: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 189: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e521e9  ! 190: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x819828c3  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c3, %hpstate
	.word 0xb5346001  ! 192: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xbde5e1d7  ! 193: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5a0f7  ! 194: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4a1aa  ! 196: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb4ad8000  ! 197: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xbbe56170  ! 199: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5e12c  ! 200: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e521b3  ! 203: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc840000  ! 204: ADDcc_R	addcc 	%r16, %r0, %r30
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46147  ! 209: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8395e039  ! 210: WRPR_TNPC_I	wrpr	%r23, 0x0039, %tnpc
	.word 0xb3e561e2  ! 211: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbd3d3001  ! 212: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xb7e42166  ! 216: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbc1c6019  ! 218: XOR_I	xor 	%r17, 0x0019, %r30
	.word 0xbde4e030  ! 220: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb13d2001  ! 222: SRA_I	sra 	%r20, 0x0001, %r24
	.word 0xb9e460dc  ! 223: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x9195a183  ! 230: WRPR_PIL_I	wrpr	%r22, 0x0183, %pil
	.word 0x8995608b  ! 231: WRPR_TICK_I	wrpr	%r21, 0x008b, %tick
	.word 0xbde560ce  ! 233: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 236: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a0e2  ! 238: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe561bb  ! 239: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x83956155  ! 247: WRPR_TNPC_I	wrpr	%r21, 0x0155, %tnpc
	.word 0x8995e1de  ! 249: WRPR_TICK_I	wrpr	%r23, 0x01de, %tick
	.word 0xb5e4608f  ! 252: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983d11  ! 259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d11, %hpstate
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5201d  ! 265: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e46138  ! 267: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4e012  ! 269: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8995205f  ! 275: WRPR_TICK_I	wrpr	%r20, 0x005f, %tick
	.word 0xb3e460db  ! 276: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8195a16f  ! 281: WRPR_TPC_I	wrpr	%r22, 0x016f, %tpc
	.word 0xb9e5e03e  ! 282: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e420e2  ! 284: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5a020  ! 285: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e087  ! 291: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5a0f0  ! 292: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbd500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a10d  ! 296: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8395e0ad  ! 297: WRPR_TNPC_I	wrpr	%r23, 0x00ad, %tnpc
	.word 0xbb510000  ! 301: RDPR_TICK	<illegal instruction>
	.word 0xb3643801  ! 302: MOVcc_I	<illegal instruction>
	.word 0xb5e5a19f  ! 304: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	.word 0xbde5e127  ! 311: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a196  ! 313: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe420da  ! 318: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_5, %g1, %r19
	.word 0x839560d2  ! 321: WRPR_TNPC_I	wrpr	%r21, 0x00d2, %tnpc
	.word 0xbf520000  ! 324: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	.word 0xb5643801  ! 332: MOVcc_I	<illegal instruction>
	.word 0xbde4a013  ! 339: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4e192  ! 342: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e52166  ! 344: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52036  ! 352: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d946139  ! 353: WRPR_PSTATE_I	wrpr	%r17, 0x0139, %pstate
	.word 0xbe2d4000  ! 354: ANDN_R	andn 	%r21, %r0, %r31
	.word 0x819420c1  ! 355: WRPR_TPC_I	wrpr	%r16, 0x00c1, %tpc
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb9520000  ! 358: RDPR_PIL	<illegal instruction>
	.word 0xbfe42104  ! 363: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e4207e  ! 366: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc0ce1a1  ! 367: AND_I	and 	%r19, 0x01a1, %r30
	.word 0xb5e5e117  ! 389: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5e1fd  ! 390: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbd540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0xb935d000  ! 403: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb13ca001  ! 404: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xb235c000  ! 405: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xb52d4000  ! 410: SLL_R	sll 	%r21, %r0, %r26
	.word 0xb9e56160  ! 411: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4608b  ! 413: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5a1a6  ! 421: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e46149  ! 423: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5e079  ! 426: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e42029  ! 428: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe56180  ! 430: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56043  ! 433: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb53c5000  ! 434: SRAX_R	srax	%r17, %r0, %r26
	.word 0x839460c1  ! 440: WRPR_TNPC_I	wrpr	%r17, 0x00c1, %tnpc
	setx	data_start_6, %g1, %r23
	.word 0xbd3d4000  ! 452: SRA_R	sra 	%r21, %r0, %r30
	setx	0x10208, %g1, %o0
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
	.word 0x85946107  ! 463: WRPR_TSTATE_I	wrpr	%r17, 0x0107, %tstate
	.word 0xb1e561e6  ! 465: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46067  ! 468: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e561e4  ! 475: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e52046  ! 476: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x9194210b  ! 478: WRPR_PIL_I	wrpr	%r16, 0x010b, %pil
	.word 0xb1e52056  ! 487: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9510000  ! 488: RDPR_TICK	<illegal instruction>
	.word 0xb6458000  ! 491: ADDC_R	addc 	%r22, %r0, %r27
	.word 0xbde421ac  ! 496: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb4bc8000  ! 497: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xbe2c4000  ! 498: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xbb508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a026  ! 507: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4213c  ! 508: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5a138  ! 512: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8595609f  ! 513: WRPR_TSTATE_I	wrpr	%r21, 0x009f, %tstate
	.word 0xbc842078  ! 521: ADDcc_I	addcc 	%r16, 0x0078, %r30
	.word 0xb9508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xbc0dc000  ! 525: AND_R	and 	%r23, %r0, %r30
	mov	0, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5a1e2  ! 528: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e52186  ! 531: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x20209, %g1, %o0
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
	.word 0xbbe4e01c  ! 539: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8795a0ec  ! 541: WRPR_TT_I	wrpr	%r22, 0x00ec, %tt
	.word 0xb1e460f4  ! 542: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde52150  ! 545: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a19d  ! 549: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4a14a  ! 553: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4e0a9  ! 556: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb424c000  ! 559: SUB_R	sub 	%r19, %r0, %r26
	.word 0x8995a11d  ! 564: WRPR_TICK_I	wrpr	%r22, 0x011d, %tick
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a102  ! 570: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4e1ce  ! 577: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc15e1f1  ! 580: OR_I	or 	%r23, 0x01f1, %r30
	.word 0xb1e4e00b  ! 583: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4e1f2  ! 589: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e187  ! 594: WRPR_PIL_I	wrpr	%r23, 0x0187, %pil
	.word 0xb9e520a5  ! 600: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e4e0bc  ! 601: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xbde46019  ! 604: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7480000  ! 606: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb52c6001  ! 612: SLL_I	sll 	%r17, 0x0001, %r26
	.word 0xbde461ad  ! 620: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e5a085  ! 621: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8594e1d2  ! 624: WRPR_TSTATE_I	wrpr	%r19, 0x01d2, %tstate
	.word 0xbde5a030  ! 625: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e521ba  ! 627: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb2c3001  ! 628: SLLX_I	sllx	%r16, 0x0001, %r29
	setx	data_start_4, %g1, %r22
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46024  ! 634: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe42142  ! 636: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4e0d6  ! 638: SAVE_I	save	%r19, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 639: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e4e19d  ! 640: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbcbc0000  ! 647: XNORcc_R	xnorcc 	%r16, %r0, %r30
	mov	1, %r12
	.word 0x8f932000  ! 648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe520d1  ! 651: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5e0c3  ! 655: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4a0cb  ! 660: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb004606c  ! 662: ADD_I	add 	%r17, 0x006c, %r24
	.word 0x81942196  ! 668: WRPR_TPC_I	wrpr	%r16, 0x0196, %tpc
	.word 0x8795a02e  ! 669: WRPR_TT_I	wrpr	%r22, 0x002e, %tt
	.word 0xbde521b9  ! 671: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5a18f  ! 672: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x899421aa  ! 673: WRPR_TICK_I	wrpr	%r16, 0x01aa, %tick
	.word 0xb5e460fb  ! 674: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e421d8  ! 675: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r23
	setx	data_start_7, %g1, %r16
	mov	0, %r12
	.word 0x8f932000  ! 681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd520000  ! 683: RDPR_PIL	<illegal instruction>
	.word 0xb5e4219f  ! 685: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4a10c  ! 686: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a1eb  ! 694: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e460ba  ! 695: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4604d  ! 697: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbd3c2001  ! 699: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xbbe460d0  ! 700: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8594a144  ! 701: WRPR_TSTATE_I	wrpr	%r18, 0x0144, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e19  ! 702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xbbe4212e  ! 706: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e520e0  ! 710: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbf2d4000  ! 715: SLL_R	sll 	%r21, %r0, %r31
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a104  ! 718: WRPR_TSTATE_I	wrpr	%r22, 0x0104, %tstate
	setx	data_start_1, %g1, %r19
	.word 0xb9e5a1df  ! 723: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8594a089  ! 728: WRPR_TSTATE_I	wrpr	%r18, 0x0089, %tstate
	.word 0xbde42031  ! 732: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5e029  ! 736: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3500000  ! 737: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e1f3  ! 738: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4a0a0  ! 739: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e560cd  ! 741: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb8852037  ! 743: ADDcc_I	addcc 	%r20, 0x0037, %r28
	.word 0xb83de14a  ! 744: XNOR_I	xnor 	%r23, 0x014a, %r28
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3ce001  ! 747: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xb9e560df  ! 748: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	.word 0x81983ed1  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed1, %hpstate
	.word 0xbbe461f7  ! 751: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde521a2  ! 753: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe560a8  ! 754: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe560b3  ! 757: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5e026  ! 760: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e56101  ! 765: SAVE_I	save	%r21, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe56162  ! 769: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9e460c0  ! 771: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x919521c1  ! 773: WRPR_PIL_I	wrpr	%r20, 0x01c1, %pil
	.word 0x8595a1b7  ! 774: WRPR_TSTATE_I	wrpr	%r22, 0x01b7, %tstate
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a006  ! 781: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e5609a  ! 782: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbf7dc400  ! 783: MOVR_R	movre	%r23, %r0, %r31
	.word 0xbbe4e00e  ! 784: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf540000  ! 786: RDPR_GL	<illegal instruction>
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e00a  ! 791: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4a113  ! 792: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb83d8000  ! 793: XNOR_R	xnor 	%r22, %r0, %r28
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8154000  ! 798: OR_R	or 	%r21, %r0, %r28
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4952072  ! 802: ORcc_I	orcc 	%r20, 0x0072, %r26
	.word 0xb9e421d5  ! 804: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e52106  ! 805: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde560b8  ! 806: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe4a106  ! 809: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 814: RDPR_GL	<illegal instruction>
	.word 0xb5e4a082  ! 815: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x899520f3  ! 817: WRPR_TICK_I	wrpr	%r20, 0x00f3, %tick
	.word 0x89952085  ! 822: WRPR_TICK_I	wrpr	%r20, 0x0085, %tick
	.word 0xb1e561c6  ! 824: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x91952142  ! 829: WRPR_PIL_I	wrpr	%r20, 0x0142, %pil
	.word 0xbde4a092  ! 830: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5209f  ! 831: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4a143  ! 833: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7510000  ! 835: RDPR_TICK	<illegal instruction>
	.word 0xb5e42058  ! 840: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5a012  ! 841: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb6c4610b  ! 842: ADDCcc_I	addccc 	%r17, 0x010b, %r27
	.word 0xb3e5e0aa  ! 843: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4e17d  ! 844: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd51c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xb9e4619e  ! 848: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5340000  ! 850: SRL_R	srl 	%r16, %r0, %r26
	.word 0xbbe56016  ! 851: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795605c  ! 857: WRPR_TT_I	wrpr	%r21, 0x005c, %tt
	.word 0xb3e5a01a  ! 860: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5e1e9  ! 861: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e560d7  ! 862: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5a10b  ! 864: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe5613a  ! 870: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e136  ! 872: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb6b40000  ! 876: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb7e421d1  ! 880: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 885: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3510000  ! 891: RDPR_TICK	<illegal instruction>
	.word 0xb3e4a16b  ! 894: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde5a012  ! 896: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8194a1ed  ! 898: WRPR_TPC_I	wrpr	%r18, 0x01ed, %tpc
	.word 0xb7480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb63c4000  ! 905: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xb5e520d5  ! 909: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 912: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e4a0ea  ! 915: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5e064  ! 917: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8394e030  ! 926: WRPR_TNPC_I	wrpr	%r19, 0x0030, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 927: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbcb5a03f  ! 929: ORNcc_I	orncc 	%r22, 0x003f, %r30
	.word 0xb3e561d3  ! 930: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3d3001  ! 932: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xb7e4216c  ! 933: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3c0000  ! 936: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xb3e4613e  ! 940: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x919461d9  ! 941: WRPR_PIL_I	wrpr	%r17, 0x01d9, %pil
	.word 0xb5e5a002  ! 950: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e52030  ! 954: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e420fa  ! 960: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbeb54000  ! 961: SUBCcc_R	orncc 	%r21, %r0, %r31
	.word 0xb1504000  ! 964: RDPR_TNPC	<illegal instruction>
	.word 0xb3e5e11b  ! 968: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe46165  ! 969: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e460aa  ! 970: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5616b  ! 976: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952080  ! 981: WRPR_PSTATE_I	wrpr	%r20, 0x0080, %pstate
	.word 0xb1e420bc  ! 982: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb245e006  ! 983: ADDC_I	addc 	%r23, 0x0006, %r25
	mov	1, %r14
	.word 0xa193a000  ! 985: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r20
	.word 0xb32d1000  ! 989: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xbfe421ab  ! 990: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbac48000  ! 994: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xb22d4000  ! 995: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xb3e56016  ! 998: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9520000  ! 1001: RDPR_PIL	<illegal instruction>
	.word 0xb7e5608e  ! 1003: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe340000  ! 1008: ORN_R	orn 	%r16, %r0, %r31
	.word 0xbbe5a1d2  ! 1009: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x9194a072  ! 1015: WRPR_PIL_I	wrpr	%r18, 0x0072, %pil
	.word 0xb7e5e10d  ! 1016: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb504000  ! 1020: RDPR_TNPC	<illegal instruction>
	.word 0xb9e56072  ! 1021: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5e02e  ! 1029: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb6158000  ! 1031: OR_R	or 	%r22, %r0, %r27
	.word 0xbfe5e171  ! 1036: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1fb  ! 1043: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5e120  ! 1044: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde56158  ! 1045: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e52112  ! 1048: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3510000  ! 1057: RDPR_TICK	<illegal instruction>
	.word 0xbde4e166  ! 1059: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd480000  ! 1060: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	data_start_1, %g1, %r20
	.word 0xb3e4a087  ! 1062: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4a01e  ! 1063: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e5a075  ! 1067: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a077  ! 1069: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e560fc  ! 1070: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7480000  ! 1072: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbe4a144  ! 1073: SAVE_I	save	%r18, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 1075: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8595e1a4  ! 1076: WRPR_TSTATE_I	wrpr	%r23, 0x01a4, %tstate
	.word 0xb1e561c4  ! 1081: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1086: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd480000  ! 1091: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1e5210f  ! 1092: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1099: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x81952195  ! 1101: WRPR_TPC_I	wrpr	%r20, 0x0195, %tpc
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	.word 0xb1e460c7  ! 1109: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb551c000  ! 1111: RDPR_TL	<illegal instruction>
	.word 0xb3540000  ! 1112: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 1114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e560f8  ! 1119: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x20102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a027  ! 1121: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e4e00b  ! 1127: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf510000  ! 1128: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a0ed  ! 1129: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5e0db  ! 1135: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a0de  ! 1137: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a186  ! 1145: WRPR_TPC_I	wrpr	%r22, 0x0186, %tpc
	.word 0xbcbc4000  ! 1146: XNORcc_R	xnorcc 	%r17, %r0, %r30
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e119  ! 1151: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe46193  ! 1154: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3480000  ! 1155: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	1, %r14
	.word 0xa193a000  ! 1156: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5611b  ! 1157: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a03a  ! 1163: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe4e1ae  ! 1170: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982953  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0953, %hpstate
	.word 0xb5e4208e  ! 1172: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e560ec  ! 1174: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_4, %g1, %r20
	.word 0xb1e4e152  ! 1177: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e42051  ! 1180: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde5e0e5  ! 1182: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb151c000  ! 1184: RDPR_TL	<illegal instruction>
	.word 0xb3e5a091  ! 1186: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5e023  ! 1187: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2ac8000  ! 1189: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0x8795a11a  ! 1190: WRPR_TT_I	wrpr	%r22, 0x011a, %tt
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 1193: RDPR_TT	<illegal instruction>
	.word 0xbc84a0f6  ! 1195: ADDcc_I	addcc 	%r18, 0x00f6, %r30
	.word 0xb1e420ff  ! 1196: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x85942085  ! 1197: WRPR_TSTATE_I	wrpr	%r16, 0x0085, %tstate
	.word 0x819420d7  ! 1207: WRPR_TPC_I	wrpr	%r16, 0x00d7, %tpc
	.word 0xbe44601d  ! 1210: ADDC_I	addc 	%r17, 0x001d, %r31
	.word 0xbfe56169  ! 1216: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5e0a0  ! 1219: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c11  ! 1224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c11, %hpstate
	.word 0xb9e5a024  ! 1230: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e421b6  ! 1232: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5a00b  ! 1233: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e07a  ! 1234: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd641800  ! 1238: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a93  ! 1246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a93, %hpstate
	.word 0xb5e46089  ! 1247: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5e170  ! 1249: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb08de005  ! 1254: ANDcc_I	andcc 	%r23, 0x0005, %r24
	.word 0xbd2db001  ! 1255: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xb1e46078  ! 1259: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e46123  ! 1261: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe5e145  ! 1262: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e1e6  ! 1265: WRPR_PSTATE_I	wrpr	%r23, 0x01e6, %pstate
	.word 0x8194e10e  ! 1266: WRPR_TPC_I	wrpr	%r19, 0x010e, %tpc
	.word 0xb7e421b6  ! 1267: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb73cc000  ! 1272: SRA_R	sra 	%r19, %r0, %r27
	.word 0xbc8cc000  ! 1273: ANDcc_R	andcc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb404204f  ! 1276: ADD_I	add 	%r16, 0x004f, %r26
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a068  ! 1281: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1540000  ! 1282: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 1284: RDPR_TPC	<illegal instruction>
	.word 0xb1e42097  ! 1285: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4e166  ! 1286: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a0ef  ! 1305: WRPR_TT_I	wrpr	%r22, 0x00ef, %tt
	.word 0xbc2ca19e  ! 1307: ANDN_I	andn 	%r18, 0x019e, %r30
	.word 0xbd500000  ! 1309: RDPR_TPC	<illegal instruction>
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982bd9  ! 1312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd9, %hpstate
	.word 0x879561aa  ! 1313: WRPR_TT_I	wrpr	%r21, 0x01aa, %tt
	setx	data_start_7, %g1, %r17
	.word 0xb5e5a15c  ! 1317: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4200c  ! 1322: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x9194a0b5  ! 1324: WRPR_PIL_I	wrpr	%r18, 0x00b5, %pil
	.word 0xb9520000  ! 1327: RDPR_PIL	<illegal instruction>
	.word 0xbbe52198  ! 1328: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xb5510000  ! 1335: RDPR_TICK	<illegal instruction>
	.word 0xb7e4e0ff  ! 1336: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9540000  ! 1338: RDPR_GL	<illegal instruction>
	.word 0xbfe561f8  ! 1343: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e561c0  ! 1345: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5602d  ! 1346: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbca58000  ! 1349: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xba0c2129  ! 1350: AND_I	and 	%r16, 0x0129, %r29
	.word 0xb40c21cd  ! 1352: AND_I	and 	%r16, 0x01cd, %r26
	.word 0xb7e46134  ! 1354: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a014  ! 1358: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4e0f9  ! 1361: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb4958000  ! 1362: ORcc_R	orcc 	%r22, %r0, %r26
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 1364: RDPR_GL	<illegal instruction>
	.word 0xb7e420ce  ! 1366: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_1, %g1, %r18
	.word 0xbebc2175  ! 1374: XNORcc_I	xnorcc 	%r16, 0x0175, %r31
	.word 0xbfe5a077  ! 1378: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e1c0  ! 1383: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859521e4  ! 1391: WRPR_TSTATE_I	wrpr	%r20, 0x01e4, %tstate
	.word 0xb1508000  ! 1393: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r19
	.word 0xbde4a176  ! 1399: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3641800  ! 1401: MOVcc_R	<illegal instruction>
	.word 0xb41c2085  ! 1404: XOR_I	xor 	%r16, 0x0085, %r26
	.word 0xbfe5a125  ! 1405: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e461c3  ! 1412: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4613b  ! 1413: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4a02c  ! 1415: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4a074  ! 1419: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5a13f  ! 1420: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4201b  ! 1422: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5510000  ! 1424: RDPR_TICK	<illegal instruction>
	.word 0xb9e4e119  ! 1430: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbb480000  ! 1431: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb5e520c0  ! 1432: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52088  ! 1441: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5e065  ! 1443: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1f9  ! 1447: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919420f5  ! 1453: WRPR_PIL_I	wrpr	%r16, 0x00f5, %pil
	.word 0xbde52130  ! 1457: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbc14c000  ! 1461: OR_R	or 	%r19, %r0, %r30
	.word 0xbfe521c4  ! 1467: SAVE_I	save	%r20, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 1469: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb350000  ! 1476: SRL_R	srl 	%r20, %r0, %r29
	.word 0xb3e52094  ! 1478: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb751c000  ! 1486: RDPR_TL	<illegal instruction>
	.word 0xb5e46148  ! 1489: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e42109  ! 1491: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e46047  ! 1503: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb605a073  ! 1504: ADD_I	add 	%r22, 0x0073, %r27
	.word 0xb3e560f4  ! 1505: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x89942004  ! 1510: WRPR_TICK_I	wrpr	%r16, 0x0004, %tick
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	.word 0xb9e420de  ! 1517: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a003  ! 1522: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4e16a  ! 1524: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd510000  ! 1526: RDPR_TICK	<illegal instruction>
	.word 0xbfe42097  ! 1530: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5e13d  ! 1531: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x32d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42069  ! 1543: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982841  ! 1548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1550: RDPR_TPC	<illegal instruction>
	.word 0xb5510000  ! 1551: RDPR_TICK	<illegal instruction>
	.word 0xbe2cc000  ! 1553: ANDN_R	andn 	%r19, %r0, %r31
	.word 0xb7e4e168  ! 1554: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb151c000  ! 1556: RDPR_TL	<illegal instruction>
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 1564: RDPR_TPC	<illegal instruction>
	.word 0xbc2de0d2  ! 1567: ANDN_I	andn 	%r23, 0x00d2, %r30
	setx	data_start_5, %g1, %r16
	.word 0xbde4a1ca  ! 1570: SAVE_I	save	%r18, 0x0001, %r30
	mov	1, %r12
	.word 0x8f932000  ! 1571: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4bc8000  ! 1574: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xb7e5a050  ! 1577: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5a027  ! 1578: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4202b  ! 1582: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_0, %g1, %r22
	.word 0xb1e5a14f  ! 1585: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_4, %g1, %r17
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794214c  ! 1590: WRPR_TT_I	wrpr	%r16, 0x014c, %tt
	.word 0x8194a0e8  ! 1594: WRPR_TPC_I	wrpr	%r18, 0x00e8, %tpc
	.word 0xbde4e0fb  ! 1596: SAVE_I	save	%r19, 0x0001, %r30
	mov	1, %r12
	.word 0x8f932000  ! 1600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1fd  ! 1605: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf510000  ! 1608: RDPR_TICK	<illegal instruction>
	.word 0xb1e5e0a7  ! 1611: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982dd3  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0xb9e5a171  ! 1613: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a1f9  ! 1616: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e420e2  ! 1618: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb520000  ! 1621: RDPR_PIL	<illegal instruction>
	.word 0xb9e5617d  ! 1626: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbd508000  ! 1628: RDPR_TSTATE	<illegal instruction>
	setx	0x1033b, %g1, %o0
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
	.word 0xbde52099  ! 1640: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb93db001  ! 1641: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xb7520000  ! 1644: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 1645: RDPR_TL	<illegal instruction>
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb48000  ! 1653: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xb1e5e085  ! 1654: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4e03c  ! 1657: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a14b  ! 1664: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1540000  ! 1666: RDPR_GL	<illegal instruction>
	.word 0xbde56119  ! 1669: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8d94e079  ! 1671: WRPR_PSTATE_I	wrpr	%r19, 0x0079, %pstate
	.word 0xb1e4e018  ! 1672: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde46183  ! 1674: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e460ea  ! 1675: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5e0be  ! 1676: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 1680: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb03d0000  ! 1681: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xb7508000  ! 1687: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4a005  ! 1690: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde460d7  ! 1692: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4e153  ! 1693: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e46094  ! 1700: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e5e05d  ! 1703: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x819520c1  ! 1704: WRPR_TPC_I	wrpr	%r20, 0x00c1, %tpc
	.word 0x8395e1f6  ! 1709: WRPR_TNPC_I	wrpr	%r23, 0x01f6, %tnpc
	.word 0xb9518000  ! 1711: RDPR_PSTATE	<illegal instruction>
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe25c000  ! 1719: SUB_R	sub 	%r23, %r0, %r31
	.word 0xbfe42152  ! 1720: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4a0be  ! 1722: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5a1b7  ! 1723: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe46185  ! 1735: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb520000  ! 1736: RDPR_PIL	<illegal instruction>
	.word 0x8194609b  ! 1738: WRPR_TPC_I	wrpr	%r17, 0x009b, %tpc
	.word 0xbbe4215e  ! 1740: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbc34c000  ! 1744: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xbbe4e169  ! 1751: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1c1  ! 1754: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d9560c9  ! 1755: WRPR_PSTATE_I	wrpr	%r21, 0x00c9, %pstate
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e460ad  ! 1759: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5e0a1  ! 1761: SAVE_I	save	%r23, 0x0001, %r24
	mov	0, %r14
	.word 0xa193a000  ! 1766: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe5e025  ! 1767: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1347001  ! 1770: SRLX_I	srlx	%r17, 0x0001, %r24
	.word 0xb9e5607c  ! 1773: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461c9  ! 1779: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3da001  ! 1783: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xbbe56055  ! 1785: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4a076  ! 1788: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394a1a8  ! 1791: WRPR_TNPC_I	wrpr	%r18, 0x01a8, %tnpc
	.word 0xb3e5a1fa  ! 1796: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe4a1e3  ! 1801: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983803  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1803, %hpstate
	.word 0xbde42170  ! 1805: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	.word 0xbfe4a1ee  ! 1822: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4e18f  ! 1823: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4e1d3  ! 1827: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e42150  ! 1828: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7520000  ! 1829: RDPR_PIL	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xb3e421d7  ! 1837: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982d51  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e4a1a3  ! 1844: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_3, %g1, %r22
	.word 0xb3510000  ! 1846: RDPR_TICK	<illegal instruction>
	.word 0xb5e5a0cb  ! 1847: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x81942080  ! 1852: WRPR_TPC_I	wrpr	%r16, 0x0080, %tpc
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e461e2  ! 1857: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a00e  ! 1862: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56031  ! 1868: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x89942164  ! 1870: WRPR_TICK_I	wrpr	%r16, 0x0164, %tick
	.word 0xb5e4a0e1  ! 1871: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x89952174  ! 1874: WRPR_TICK_I	wrpr	%r20, 0x0174, %tick
	.word 0x9195e1e2  ! 1875: WRPR_PIL_I	wrpr	%r23, 0x01e2, %pil
	.word 0xb9510000  ! 1877: RDPR_TICK	<illegal instruction>
	.word 0xbfe52050  ! 1882: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe561b8  ! 1883: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5e1c4  ! 1885: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e521ea  ! 1891: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb49d612f  ! 1897: XORcc_I	xorcc 	%r21, 0x012f, %r26
	.word 0xb3e4a031  ! 1904: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x9195e0ba  ! 1905: WRPR_PIL_I	wrpr	%r23, 0x00ba, %pil
	.word 0xb3e4a151  ! 1908: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4e0c3  ! 1913: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb4b54000  ! 1914: ORNcc_R	orncc 	%r21, %r0, %r26
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1e0  ! 1918: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_6, %g1, %r21
	.word 0xb9e5e08c  ! 1922: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb550c000  ! 1923: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe1de066  ! 1925: XOR_I	xor 	%r23, 0x0066, %r31
	.word 0xb1510000  ! 1927: RDPR_TICK	<illegal instruction>
	.word 0x819460ed  ! 1928: WRPR_TPC_I	wrpr	%r17, 0x00ed, %tpc
	.word 0x91956076  ! 1929: WRPR_PIL_I	wrpr	%r21, 0x0076, %pil
	.word 0x8394e0b6  ! 1930: WRPR_TNPC_I	wrpr	%r19, 0x00b6, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x819829db  ! 1935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09db, %hpstate
	setx	data_start_5, %g1, %r18
	.word 0xb3e42127  ! 1938: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5616a  ! 1941: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe4617e  ! 1943: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7508000  ! 1944: RDPR_TSTATE	<illegal instruction>
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42001  ! 1946: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4610e  ! 1951: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe560e0  ! 1952: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 1960: RDPR_TT	<illegal instruction>
	.word 0xb7e46131  ! 1965: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3540000  ! 1966: RDPR_GL	<illegal instruction>
	.word 0xbbe461bc  ! 1969: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5e1bc  ! 1972: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e520b1  ! 1977: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e4e0f0  ! 1981: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8d95a081  ! 1983: WRPR_PSTATE_I	wrpr	%r22, 0x0081, %pstate
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a189  ! 1985: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a093  ! 1990: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e420a6  ! 1992: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb4ac4000  ! 1993: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xb1e4a135  ! 1994: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e4a11b  ! 1995: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5e090  ! 1999: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc344000  ! 2000: ORN_R	orn 	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982913  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0913, %hpstate
	.word 0xb7e5202f  ! 2007: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e461ca  ! 2012: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe421f6  ! 2015: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5e0ff  ! 2018: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e5a11e  ! 2019: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b40000  ! 2021: ORNcc_R	orncc 	%r16, %r0, %r27
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e460eb  ! 2026: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8995a133  ! 2027: WRPR_TICK_I	wrpr	%r22, 0x0133, %tick
	.word 0xb5e5e0d7  ! 2034: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe521ee  ! 2036: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf510000  ! 2037: RDPR_TICK	<illegal instruction>
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 2040: RDPR_TPC	<illegal instruction>
	.word 0xbfe4a1a6  ! 2041: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2046: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4614a  ! 2052: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xba34c000  ! 2056: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xbd540000  ! 2058: RDPR_GL	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xb3e4a1ce  ! 2063: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e46103  ! 2066: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4a03a  ! 2070: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e560af  ! 2071: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb4354000  ! 2072: SUBC_R	orn 	%r21, %r0, %r26
	setx	data_start_6, %g1, %r22
	.word 0xbbe4e063  ! 2074: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5213b  ! 2075: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e5e0b1  ! 2077: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9510000  ! 2079: RDPR_TICK	<illegal instruction>
	.word 0xbf520000  ! 2081: RDPR_PIL	<illegal instruction>
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0x899520c5  ! 2091: WRPR_TICK_I	wrpr	%r20, 0x00c5, %tick
	.word 0xbfe521b9  ! 2092: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4a050  ! 2096: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe5a16a  ! 2097: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbf504000  ! 2098: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5a132  ! 2099: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5e013  ! 2102: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbcad6120  ! 2103: ANDNcc_I	andncc 	%r21, 0x0120, %r30
	.word 0xb1e4e192  ! 2109: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e460b3  ! 2111: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4e10f  ! 2112: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e521c3  ! 2114: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e52180  ! 2115: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb951c000  ! 2116: RDPR_TL	<illegal instruction>
	.word 0xb40ca12d  ! 2118: AND_I	and 	%r18, 0x012d, %r26
	.word 0xbbe5a1c7  ! 2122: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf520000  ! 2123: RDPR_PIL	<illegal instruction>
	.word 0xbde5e1e7  ! 2126: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5a06a  ! 2129: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8195e08b  ! 2136: WRPR_TPC_I	wrpr	%r23, 0x008b, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2150: RDPR_PSTATE	<illegal instruction>
	.word 0x89946105  ! 2151: WRPR_TICK_I	wrpr	%r17, 0x0105, %tick
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5615c  ! 2156: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3353001  ! 2157: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb3500000  ! 2158: RDPR_TPC	<illegal instruction>
	.word 0xbde4e002  ! 2161: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1e2  ! 2167: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x91956026  ! 2173: WRPR_PIL_I	wrpr	%r21, 0x0026, %pil
	.word 0xb7e421fb  ! 2175: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e561a7  ! 2181: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8594a0ea  ! 2186: WRPR_TSTATE_I	wrpr	%r18, 0x00ea, %tstate
	.word 0xbfe5a16a  ! 2187: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_6, %g1, %r20
	.word 0xbde5207d  ! 2189: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2193: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1518000  ! 2196: RDPR_PSTATE	<illegal instruction>
	setx	0x30329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819421b2  ! 2200: WRPR_TPC_I	wrpr	%r16, 0x01b2, %tpc
	.word 0xbe8da0b3  ! 2201: ANDcc_I	andcc 	%r22, 0x00b3, %r31
	.word 0xbd518000  ! 2209: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e521ec  ! 2210: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb03d60c6  ! 2211: XNOR_I	xnor 	%r21, 0x00c6, %r24
	.word 0xb22d4000  ! 2213: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xb9e5616c  ! 2214: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb52c7001  ! 2216: SLLX_I	sllx	%r17, 0x0001, %r26
	.word 0x8795219e  ! 2217: WRPR_TT_I	wrpr	%r20, 0x019e, %tt
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2219: RDPR_TNPC	<illegal instruction>
	.word 0xb7643801  ! 2220: MOVcc_I	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e46086  ! 2225: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5e1b4  ! 2226: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8394e1f9  ! 2228: WRPR_TNPC_I	wrpr	%r19, 0x01f9, %tnpc
	.word 0xb3e5a080  ! 2232: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a02f  ! 2233: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e520c3  ! 2235: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4603b  ! 2236: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e4214a  ! 2237: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe52011  ! 2238: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb500000  ! 2239: RDPR_TPC	<illegal instruction>
	.word 0xb5510000  ! 2241: RDPR_TICK	<illegal instruction>
	.word 0xb9e5e1fd  ! 2242: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a16c  ! 2248: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5540000  ! 2251: RDPR_GL	<illegal instruction>
	.word 0xb1e5a01c  ! 2252: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983d13  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d13, %hpstate
	.word 0xb81560d5  ! 2255: OR_I	or 	%r21, 0x00d5, %r28
	.word 0xbbe460a7  ! 2256: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe46078  ! 2258: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e42171  ! 2259: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5e1c2  ! 2260: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e5a1a6  ! 2262: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb8b48000  ! 2264: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xbbe5e1cc  ! 2265: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8795a19d  ! 2267: WRPR_TT_I	wrpr	%r22, 0x019d, %tt
	.word 0xb7e5a01a  ! 2270: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4a125  ! 2271: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x919460a0  ! 2272: WRPR_PIL_I	wrpr	%r17, 0x00a0, %pil
	.word 0xb8348000  ! 2273: ORN_R	orn 	%r18, %r0, %r28
	.word 0xb1e560f2  ! 2275: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a1d4  ! 2277: SAVE_I	save	%r18, 0x0001, %r29
	mov	0, %r12
	.word 0x8f932000  ! 2278: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e42070  ! 2279: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4208e  ! 2281: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e521d7  ! 2283: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e4a086  ! 2284: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1357001  ! 2285: SRLX_I	srlx	%r21, 0x0001, %r24
	.word 0x8595e193  ! 2287: WRPR_TSTATE_I	wrpr	%r23, 0x0193, %tstate
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8c611f  ! 2290: ANDcc_I	andcc 	%r17, 0x011f, %r29
	.word 0xb7643801  ! 2294: MOVcc_I	<illegal instruction>
	.word 0xbbe46071  ! 2299: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e4a0f7  ! 2301: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4e000  ! 2304: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1b5  ! 2311: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbe25208b  ! 2312: SUB_I	sub 	%r20, 0x008b, %r31
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52045  ! 2323: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5a105  ! 2325: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x879420ce  ! 2327: WRPR_TT_I	wrpr	%r16, 0x00ce, %tt
	.word 0xb7e5a0e9  ! 2330: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb81d61fc  ! 2331: XOR_I	xor 	%r21, 0x01fc, %r28
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	.word 0xb5e5a15f  ! 2337: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e56133  ! 2341: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5605d  ! 2342: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb01de1fc  ! 2348: XOR_I	xor 	%r23, 0x01fc, %r24
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c59  ! 2356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c59, %hpstate
	setx	data_start_0, %g1, %r22
	.word 0xb9e56022  ! 2358: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 2359: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 2367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd510000  ! 2372: RDPR_TICK	<illegal instruction>
	.word 0x8995210d  ! 2375: WRPR_TICK_I	wrpr	%r20, 0x010d, %tick
	.word 0xb3e5e008  ! 2378: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8794617c  ! 2379: WRPR_TT_I	wrpr	%r17, 0x017c, %tt
	.word 0x9194e01f  ! 2380: WRPR_PIL_I	wrpr	%r19, 0x001f, %pil
	.word 0xb21c20ff  ! 2381: XOR_I	xor 	%r16, 0x00ff, %r25
	.word 0xb9e5e184  ! 2384: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42156  ! 2389: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e42178  ! 2390: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_1, %g1, %r16
	.word 0xbfe5a096  ! 2392: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e56039  ! 2393: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e031  ! 2397: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e46168  ! 2398: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e420dd  ! 2399: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4e143  ! 2406: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5a0d8  ! 2410: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0ad0000  ! 2411: ANDNcc_R	andncc 	%r20, %r0, %r24
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46195  ! 2416: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8795618c  ! 2417: WRPR_TT_I	wrpr	%r21, 0x018c, %tt
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33c1000  ! 2421: SRAX_R	srax	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f1b  ! 2423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1b, %hpstate
	.word 0xb7540000  ! 2426: RDPR_GL	<illegal instruction>
	.word 0x81942051  ! 2427: WRPR_TPC_I	wrpr	%r16, 0x0051, %tpc
	.word 0xb7e5e15c  ! 2429: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e56146  ! 2435: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x87942160  ! 2436: WRPR_TT_I	wrpr	%r16, 0x0160, %tt
	.word 0xb7e4205b  ! 2437: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2439: RDPR_GL	<illegal instruction>
	.word 0xb9e460d8  ! 2441: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8350000  ! 2446: SUBC_R	orn 	%r20, %r0, %r28
	.word 0xb9e4a089  ! 2449: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb8b54000  ! 2459: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xbd520000  ! 2460: RDPR_PIL	<illegal instruction>
	.word 0xbde4204c  ! 2461: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbc9d4000  ! 2467: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xb7e5e086  ! 2468: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e42159  ! 2474: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 2476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xbfe4a0ef  ! 2483: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e420b2  ! 2486: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe4e062  ! 2489: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb89c6009  ! 2490: XORcc_I	xorcc 	%r17, 0x0009, %r28
	.word 0xbbe4214d  ! 2491: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe5e067  ! 2497: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e5e199  ! 2501: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde56000  ! 2502: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42140  ! 2505: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe4a073  ! 2507: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe46027  ! 2510: SAVE_I	save	%r17, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 2513: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5e030  ! 2515: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbc850000  ! 2516: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xbde421a7  ! 2517: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e561d4  ! 2521: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4a124  ! 2523: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 2525: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e19a  ! 2530: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e460d5  ! 2534: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5e13d  ! 2541: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7500000  ! 2543: RDPR_TPC	<illegal instruction>
	.word 0xb3e5605c  ! 2546: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_5, %g1, %r23
	.word 0xb02d208d  ! 2549: ANDN_I	andn 	%r20, 0x008d, %r24
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a179  ! 2551: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e520b0  ! 2558: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbb500000  ! 2560: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2563: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe42003  ! 2566: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb614e078  ! 2567: OR_I	or 	%r19, 0x0078, %r27
	.word 0xbd510000  ! 2569: RDPR_TICK	<illegal instruction>
	.word 0xbbe4e1d9  ! 2571: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe42009  ! 2572: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd50c000  ! 2576: RDPR_TT	<illegal instruction>
	.word 0xb5e4a00d  ! 2578: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4a10a  ! 2579: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe521c3  ! 2581: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5611c  ! 2583: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5a1ac  ! 2586: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb480000  ! 2592: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_0, %g1, %r20
	.word 0xbfe561db  ! 2594: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e46193  ! 2597: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08c0000  ! 2604: ANDcc_R	andcc 	%r16, %r0, %r24
	.word 0xb8458000  ! 2605: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xbde521bc  ! 2606: SAVE_I	save	%r20, 0x0001, %r30
	mov	2, %r12
	.word 0x8f932000  ! 2607: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e4e03a  ! 2611: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb80d2027  ! 2612: AND_I	and 	%r20, 0x0027, %r28
	.word 0x8d95e125  ! 2614: WRPR_PSTATE_I	wrpr	%r23, 0x0125, %pstate
	.word 0xb2944000  ! 2615: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xb5345000  ! 2616: SRLX_R	srlx	%r17, %r0, %r26
	.word 0xbfe5e0b8  ! 2622: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4e1e2  ! 2624: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_7, %g1, %r17
	.word 0xb1e4a135  ! 2632: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8595a146  ! 2633: WRPR_TSTATE_I	wrpr	%r22, 0x0146, %tstate
	.word 0xb5e460b7  ! 2635: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf518000  ! 2637: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3d4000  ! 2638: SRA_R	sra 	%r21, %r0, %r31
	.word 0xb9355000  ! 2641: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xbfe56032  ! 2642: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5e040  ! 2645: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e561fd  ! 2650: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 2651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	.word 0xb1e52023  ! 2652: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9500000  ! 2656: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a1da  ! 2660: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e461d2  ! 2664: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e420bc  ! 2666: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e5a179  ! 2669: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe5a1e8  ! 2672: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e0f8  ! 2683: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e561e3  ! 2694: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xba958000  ! 2695: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xb9e4a10d  ! 2697: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e42098  ! 2699: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb0bd4000  ! 2700: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xbfe4210d  ! 2706: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982881  ! 2708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0881, %hpstate
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0cc  ! 2711: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4e02a  ! 2712: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb03cc000  ! 2713: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0x8395e14b  ! 2714: WRPR_TNPC_I	wrpr	%r23, 0x014b, %tnpc
	.word 0xb82c20bf  ! 2715: ANDN_I	andn 	%r16, 0x00bf, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0x8594e0d7  ! 2722: WRPR_TSTATE_I	wrpr	%r19, 0x00d7, %tstate
	setx	data_start_6, %g1, %r18
	.word 0xbe15c000  ! 2725: OR_R	or 	%r23, %r0, %r31
	.word 0xbde4a071  ! 2728: SAVE_I	save	%r18, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2731: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85956184  ! 2732: WRPR_TSTATE_I	wrpr	%r21, 0x0184, %tstate
	.word 0xbde5a0c5  ! 2738: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4206a  ! 2742: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5e10c  ! 2743: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8594e137  ! 2745: WRPR_TSTATE_I	wrpr	%r19, 0x0137, %tstate
	.word 0xbe8c8000  ! 2746: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0x859460a9  ! 2756: WRPR_TSTATE_I	wrpr	%r17, 0x00a9, %tstate
	.word 0xb9504000  ! 2757: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e18b  ! 2758: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5614d  ! 2759: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5608e  ! 2761: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5602d  ! 2762: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5e103  ! 2764: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8595a0e0  ! 2767: WRPR_TSTATE_I	wrpr	%r22, 0x00e0, %tstate
	.word 0xb1e5613a  ! 2768: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb01d8000  ! 2771: XOR_R	xor 	%r22, %r0, %r24
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a07a  ! 2774: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 2776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	.word 0xb9e521a0  ! 2777: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5a0ff  ! 2778: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e42047  ! 2781: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8595e06c  ! 2786: WRPR_TSTATE_I	wrpr	%r23, 0x006c, %tstate
	.word 0xb9e5e190  ! 2795: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e461b8  ! 2798: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5520000  ! 2801: RDPR_PIL	<illegal instruction>
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba0c6093  ! 2810: AND_I	and 	%r17, 0x0093, %r29
	.word 0xbd518000  ! 2811: RDPR_PSTATE	<illegal instruction>
	.word 0x8595e062  ! 2813: WRPR_TSTATE_I	wrpr	%r23, 0x0062, %tstate
	.word 0x8794e032  ! 2814: WRPR_TT_I	wrpr	%r19, 0x0032, %tt
	.word 0xb1e5a1bc  ! 2816: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5504000  ! 2817: RDPR_TNPC	<illegal instruction>
	.word 0xb5e4218f  ! 2818: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5e17f  ! 2821: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb2a4a0f7  ! 2822: SUBcc_I	subcc 	%r18, 0x00f7, %r25
	.word 0xb9e56073  ! 2825: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5e07f  ! 2826: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e560b1  ! 2828: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_1, %g1, %r22
	.word 0x85946071  ! 2832: WRPR_TSTATE_I	wrpr	%r17, 0x0071, %tstate
	.word 0xbde4602a  ! 2833: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2ca090  ! 2836: ANDN_I	andn 	%r18, 0x0090, %r31
	mov	0, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc140000  ! 2842: OR_R	or 	%r16, %r0, %r30
	.word 0xb9e560a8  ! 2843: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe52101  ! 2845: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb28d60de  ! 2848: ANDcc_I	andcc 	%r21, 0x00de, %r25
	.word 0x859520dc  ! 2851: WRPR_TSTATE_I	wrpr	%r20, 0x00dc, %tstate
	.word 0xbfe4a13c  ! 2858: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe5e0d8  ! 2860: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb8b5a0d3  ! 2862: SUBCcc_I	orncc 	%r22, 0x00d3, %r28
	.word 0xb7e421a2  ! 2863: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4e085  ! 2864: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc450000  ! 2869: ADDC_R	addc 	%r20, %r0, %r30
	.word 0xbbe4204c  ! 2870: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8994a022  ! 2871: WRPR_TICK_I	wrpr	%r18, 0x0022, %tick
	.word 0xb1518000  ! 2873: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d49  ! 2874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	setx	data_start_0, %g1, %r23
	.word 0xb7e4e0a5  ! 2878: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe52048  ! 2885: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e4612c  ! 2890: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4611d  ! 2901: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 2902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xb3520000  ! 2903: RDPR_PIL	<illegal instruction>
	.word 0xbbe4a00b  ! 2904: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe56032  ! 2906: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe4a018  ! 2907: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe42050  ! 2911: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbb643801  ! 2914: MOVcc_I	<illegal instruction>
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e050  ! 2916: WRPR_TNPC_I	wrpr	%r19, 0x0050, %tnpc
	.word 0xbbe521b1  ! 2921: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5e039  ! 2924: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_6, %g1, %r19
	.word 0xbbe4603d  ! 2929: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba840000  ! 2935: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xbbe561e4  ! 2936: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb6c4e143  ! 2937: ADDCcc_I	addccc 	%r19, 0x0143, %r27
	.word 0xb3e4e1b4  ! 2938: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8795a0cf  ! 2940: WRPR_TT_I	wrpr	%r22, 0x00cf, %tt
	.word 0xb7e4606c  ! 2943: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x83956123  ! 2945: WRPR_TNPC_I	wrpr	%r21, 0x0123, %tnpc
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521be  ! 2947: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8395219b  ! 2948: WRPR_TNPC_I	wrpr	%r20, 0x019b, %tnpc
	.word 0xb9e52179  ! 2949: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5a15c  ! 2950: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5a1fd  ! 2955: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3480000  ! 2957: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982b93  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0xb01c8000  ! 2960: XOR_R	xor 	%r18, %r0, %r24
	.word 0xbfe4a130  ! 2961: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e42145  ! 2962: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5e125  ! 2963: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e4a07f  ! 2965: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde4a034  ! 2967: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5a1d0  ! 2974: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4a1a4  ! 2975: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0x8194a175  ! 2978: WRPR_TPC_I	wrpr	%r18, 0x0175, %tpc
	.word 0xbebce011  ! 2981: XNORcc_I	xnorcc 	%r19, 0x0011, %r31
	.word 0x839420c5  ! 2982: WRPR_TNPC_I	wrpr	%r16, 0x00c5, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 2985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	.word 0xb1e56009  ! 2987: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4a195  ! 2995: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3504000  ! 2997: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5201b  ! 3002: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde420d9  ! 3004: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd35b001  ! 3005: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xbde4a1ee  ! 3008: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e56121  ! 3016: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbb540000  ! 3018: RDPR_GL	<illegal instruction>
	.word 0xbde4a044  ! 3023: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1518000  ! 3024: RDPR_PSTATE	<illegal instruction>
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e038  ! 3033: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e56072  ! 3035: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb2b5e054  ! 3037: ORNcc_I	orncc 	%r23, 0x0054, %r25
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 3040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xb6b44000  ! 3041: ORNcc_R	orncc 	%r17, %r0, %r27
	setx	0x13c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 3046: RDPR_TL	<illegal instruction>
	.word 0xb3e4e0b6  ! 3047: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xbb540000  ! 3049: RDPR_GL	<illegal instruction>
	.word 0xbc0c4000  ! 3050: AND_R	and 	%r17, %r0, %r30
	.word 0xb1e42050  ! 3053: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_7, %g1, %r19
	.word 0xb9e5a1c4  ! 3056: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	.word 0x81982d91  ! 3058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d91, %hpstate
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e561bf  ! 3063: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5a1bd  ! 3065: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb53c1000  ! 3066: SRAX_R	srax	%r16, %r0, %r26
	.word 0xbfe460bb  ! 3067: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a025  ! 3070: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb49560e3  ! 3077: ORcc_I	orcc 	%r21, 0x00e3, %r26
	.word 0xbbe5e014  ! 3078: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e4e01a  ! 3082: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb550c000  ! 3087: RDPR_TT	<illegal instruction>
	.word 0x8394216c  ! 3088: WRPR_TNPC_I	wrpr	%r16, 0x016c, %tnpc
	.word 0xb3e4a0c9  ! 3089: SAVE_I	save	%r18, 0x0001, %r25
	mov	2, %r12
	.word 0x8f932000  ! 3090: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1508000  ! 3091: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 3095: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4214c  ! 3096: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983859  ! 3097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1859, %hpstate
	.word 0xb9e560f4  ! 3099: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e42113  ! 3104: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe460f2  ! 3105: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde4a08e  ! 3106: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9540000  ! 3107: RDPR_GL	<illegal instruction>
	.word 0xb1e560c8  ! 3112: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_4, %g1, %r22
	.word 0xbabc4000  ! 3119: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xb1e4e1fd  ! 3122: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r18
	mov	1, %r12
	.word 0x8f932000  ! 3127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1540000  ! 3129: RDPR_GL	<illegal instruction>
	.word 0xb7504000  ! 3132: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56004  ! 3133: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb2b50000  ! 3134: ORNcc_R	orncc 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f43  ! 3136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f43, %hpstate
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4200e  ! 3140: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7520000  ! 3143: RDPR_PIL	<illegal instruction>
	.word 0xb5e46151  ! 3146: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4a1ab  ! 3148: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5a017  ! 3150: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4613a  ! 3151: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb234e112  ! 3155: ORN_I	orn 	%r19, 0x0112, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5a1c9  ! 3160: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf510000  ! 3162: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 3163: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbc35c000  ! 3164: SUBC_R	orn 	%r23, %r0, %r30
	.word 0xb1e4a1f0  ! 3165: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4617b  ! 3166: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4a12e  ! 3167: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3540000  ! 3169: RDPR_GL	<illegal instruction>
	.word 0xb7e420d0  ! 3175: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb215e154  ! 3176: OR_I	or 	%r23, 0x0154, %r25
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e46057  ! 3183: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e421bc  ! 3185: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e132  ! 3191: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0xb7e4e0e2  ! 3195: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5e1d4  ! 3198: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23ca07b  ! 3203: XNOR_I	xnor 	%r18, 0x007b, %r25
	.word 0xb5e520cd  ! 3205: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e460ab  ! 3206: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb751c000  ! 3210: RDPR_TL	<illegal instruction>
	.word 0xb5e5e02d  ! 3211: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe35e152  ! 3214: ORN_I	orn 	%r23, 0x0152, %r31
	.word 0xb7e4618a  ! 3215: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e46107  ! 3217: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb29dc000  ! 3218: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xbde5e1e9  ! 3219: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8d94219b  ! 3221: WRPR_PSTATE_I	wrpr	%r16, 0x019b, %pstate
	setx	data_start_1, %g1, %r17
	.word 0xb7e421de  ! 3226: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e560cc  ! 3228: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d9461b7  ! 3231: WRPR_PSTATE_I	wrpr	%r17, 0x01b7, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d81  ! 3234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d81, %hpstate
	.word 0xbfe52070  ! 3235: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x85942054  ! 3241: WRPR_TSTATE_I	wrpr	%r16, 0x0054, %tstate
	.word 0xbbe46055  ! 3245: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5a062  ! 3248: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbf504000  ! 3252: RDPR_TNPC	<illegal instruction>
	.word 0xb52d7001  ! 3254: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xb5e52037  ! 3257: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5e11a  ! 3259: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb2ad8000  ! 3262: ANDNcc_R	andncc 	%r22, %r0, %r25
	.word 0xbfe421ba  ! 3264: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe56089  ! 3266: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4e0df  ! 3270: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9520000  ! 3273: RDPR_PIL	<illegal instruction>
	.word 0xbf510000  ! 3277: RDPR_TICK	<illegal instruction>
	.word 0xbb540000  ! 3279: RDPR_GL	<illegal instruction>
	.word 0xbcb40000  ! 3280: SUBCcc_R	orncc 	%r16, %r0, %r30
	mov	2, %r12
	.word 0x8f932000  ! 3282: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5a081  ! 3283: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe52196  ! 3284: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x30228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995605d  ! 3287: WRPR_TICK_I	wrpr	%r21, 0x005d, %tick
	.word 0xb41521dd  ! 3288: OR_I	or 	%r20, 0x01dd, %r26
	.word 0xb5e460f4  ! 3289: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5e1a9  ! 3293: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb97de401  ! 3299: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xb9518000  ! 3302: RDPR_PSTATE	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 3303: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 3305: RDPR_TICK	<illegal instruction>
	.word 0xbde5e18d  ! 3306: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe250000  ! 3311: SUB_R	sub 	%r20, %r0, %r31
	.word 0xb3e4214f  ! 3316: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde461fd  ! 3318: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb48d61db  ! 3319: ANDcc_I	andcc 	%r21, 0x01db, %r26
	.word 0x8394e155  ! 3326: WRPR_TNPC_I	wrpr	%r19, 0x0155, %tnpc
	.word 0xbfe521a4  ! 3327: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x89956125  ! 3328: WRPR_TICK_I	wrpr	%r21, 0x0125, %tick
	.word 0xb7e561fb  ! 3330: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e461e0  ! 3333: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe561cf  ! 3334: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe244000  ! 3339: SUB_R	sub 	%r17, %r0, %r31
	setx	data_start_1, %g1, %r16
	.word 0x8795a160  ! 3344: WRPR_TT_I	wrpr	%r22, 0x0160, %tt
	.word 0xb5e4615c  ! 3347: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5a14d  ! 3348: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe42185  ! 3352: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43c4000  ! 3355: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xb3500000  ! 3356: RDPR_TPC	<illegal instruction>
	.word 0xb1e4a044  ! 3358: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d95a0fe  ! 3363: WRPR_PSTATE_I	wrpr	%r22, 0x00fe, %pstate
	.word 0xb8c54000  ! 3368: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0x8194a153  ! 3372: WRPR_TPC_I	wrpr	%r18, 0x0153, %tpc
	.word 0xbbe420cf  ! 3373: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe460ea  ! 3388: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5510000  ! 3391: RDPR_TICK	<illegal instruction>
	.word 0xbc342059  ! 3394: SUBC_I	orn 	%r16, 0x0059, %r30
	.word 0xbfe5204c  ! 3396: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb508000  ! 3398: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe42186  ! 3399: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a070  ! 3401: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8795609f  ! 3402: WRPR_TT_I	wrpr	%r21, 0x009f, %tt
	setx	data_start_4, %g1, %r16
	.word 0x8d95a124  ! 3407: WRPR_PSTATE_I	wrpr	%r22, 0x0124, %pstate
	.word 0xb3e521d5  ! 3409: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x839461fa  ! 3411: WRPR_TNPC_I	wrpr	%r17, 0x01fa, %tnpc
	.word 0xbd480000  ! 3412: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb3e4619a  ! 3420: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf3c9000  ! 3424: SRAX_R	srax	%r18, %r0, %r31
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a05c  ! 3427: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x879561da  ! 3432: WRPR_TT_I	wrpr	%r21, 0x01da, %tt
	.word 0xbb504000  ! 3434: RDPR_TNPC	<illegal instruction>
	.word 0xb9e52141  ! 3435: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d09  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xbf518000  ! 3442: RDPR_PSTATE	<illegal instruction>
	.word 0xbd518000  ! 3443: RDPR_PSTATE	<illegal instruction>
	.word 0x819521d4  ! 3453: WRPR_TPC_I	wrpr	%r20, 0x01d4, %tpc
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 3466: RDPR_PIL	<illegal instruction>
	.word 0xbde5e1a2  ! 3471: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a0e4  ! 3473: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4e168  ! 3478: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 3490: RDPR_PIL	<illegal instruction>
	.word 0xbbe4e12f  ! 3493: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e4e126  ! 3499: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e42090  ! 3503: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x9194e14c  ! 3504: WRPR_PIL_I	wrpr	%r19, 0x014c, %pil
	.word 0xb6958000  ! 3506: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0xb68de0dc  ! 3508: ANDcc_I	andcc 	%r23, 0x00dc, %r27
	.word 0xbd520000  ! 3509: RDPR_PIL	<illegal instruction>
	.word 0xb1510000  ! 3510: RDPR_TICK	<illegal instruction>
	.word 0xb7e560ca  ! 3511: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4207a  ! 3515: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5e1c8  ! 3518: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc9c21a5  ! 3525: XORcc_I	xorcc 	%r16, 0x01a5, %r30
	.word 0xbfe4a0ae  ! 3526: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983ad3  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad3, %hpstate
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 3537: RDPR_TICK	<illegal instruction>
	setx	0x1030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba050000  ! 3543: ADD_R	add 	%r20, %r0, %r29
	.word 0xbfe5a1a8  ! 3544: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e42192  ! 3546: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde46092  ! 3549: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e42104  ! 3552: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42111  ! 3557: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde56157  ! 3558: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8595a117  ! 3559: WRPR_TSTATE_I	wrpr	%r22, 0x0117, %tstate
	.word 0xb7518000  ! 3561: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e46024  ! 3565: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5a0c7  ! 3566: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e56104  ! 3567: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5e095  ! 3568: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e199  ! 3579: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e560f1  ! 3583: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81946097  ! 3596: WRPR_TPC_I	wrpr	%r17, 0x0097, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb151c000  ! 3598: RDPR_TL	<illegal instruction>
	.word 0xba1c609f  ! 3600: XOR_I	xor 	%r17, 0x009f, %r29
	.word 0xb1e5213d  ! 3602: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e52110  ! 3608: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1fe  ! 3611: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde421bd  ! 3612: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e5e1ab  ! 3613: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbf510000  ! 3615: RDPR_TICK	<illegal instruction>
	.word 0xb5e560b1  ! 3618: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf50c000  ! 3619: RDPR_TT	<illegal instruction>
	.word 0xb3e56106  ! 3621: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb88ca19d  ! 3629: ANDcc_I	andcc 	%r18, 0x019d, %r28
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879460da  ! 3631: WRPR_TT_I	wrpr	%r17, 0x00da, %tt
	.word 0xb8c5606c  ! 3632: ADDCcc_I	addccc 	%r21, 0x006c, %r28
	.word 0xb3e56040  ! 3633: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e42165  ! 3635: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4a028  ! 3637: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe4a134  ! 3638: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb89de1ed  ! 3645: XORcc_I	xorcc 	%r23, 0x01ed, %r28
	.word 0xb7e4a012  ! 3647: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb49d8000  ! 3650: XORcc_R	xorcc 	%r22, %r0, %r26
	.word 0xbf500000  ! 3651: RDPR_TPC	<illegal instruction>
	.word 0x8195e1e2  ! 3654: WRPR_TPC_I	wrpr	%r23, 0x01e2, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 3656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xb5540000  ! 3658: RDPR_GL	<illegal instruction>
	.word 0xbde4e02d  ! 3659: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e42138  ! 3661: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3510000  ! 3663: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a1f9  ! 3664: SAVE_I	save	%r22, 0x0001, %r29
	setx	data_start_5, %g1, %r17
	setx	data_start_0, %g1, %r16
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0de  ! 3672: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8594a1e5  ! 3676: WRPR_TSTATE_I	wrpr	%r18, 0x01e5, %tstate
	.word 0xb83d4000  ! 3678: XNOR_R	xnor 	%r21, %r0, %r28
	setx	0x3001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e1fe  ! 3681: WRPR_PSTATE_I	wrpr	%r19, 0x01fe, %pstate
	.word 0x8194a09a  ! 3683: WRPR_TPC_I	wrpr	%r18, 0x009a, %tpc
	.word 0xb3e52125  ! 3685: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde4e0b9  ! 3687: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb4340000  ! 3695: SUBC_R	orn 	%r16, %r0, %r26
	.word 0xbbe5a1ca  ! 3698: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4e01e  ! 3699: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4e077  ! 3700: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e5a104  ! 3703: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a0f0  ! 3704: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e56034  ! 3707: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e461c8  ! 3709: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e420f3  ! 3713: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb0c54000  ! 3714: ADDCcc_R	addccc 	%r21, %r0, %r24
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52114  ! 3719: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1508000  ! 3720: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a0cf  ! 3721: WRPR_PSTATE_I	wrpr	%r18, 0x00cf, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982993  ! 3725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0xbde561b9  ! 3726: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb0c46036  ! 3727: ADDCcc_I	addccc 	%r17, 0x0036, %r24
	.word 0xbbe5e087  ! 3728: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde560e9  ! 3732: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983dcb  ! 3735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dcb, %hpstate
	.word 0xb9e46075  ! 3737: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e420e1  ! 3739: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4e120  ! 3740: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4a007  ! 3741: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4e082  ! 3743: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e561cc  ! 3744: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x81956030  ! 3745: WRPR_TPC_I	wrpr	%r21, 0x0030, %tpc
	.word 0xb69da16c  ! 3748: XORcc_I	xorcc 	%r22, 0x016c, %r27
	.word 0xbbe560ab  ! 3750: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4e17f  ! 3753: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5205e  ! 3756: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x100, %g1, %o0
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
	mov	2, %r12
	.word 0x8f932000  ! 3763: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4206c  ! 3765: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 3767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0xb5e4e187  ! 3768: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xb9e5200f  ! 3779: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbd51c000  ! 3781: RDPR_TL	<illegal instruction>
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e164  ! 3786: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e10c  ! 3787: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb2d3001  ! 3790: SLLX_I	sllx	%r20, 0x0001, %r29
	.word 0x8395a028  ! 3792: WRPR_TNPC_I	wrpr	%r22, 0x0028, %tnpc
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56114  ! 3798: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e062  ! 3800: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 3803: RDPR_TL	<illegal instruction>
	.word 0x8395a13a  ! 3804: WRPR_TNPC_I	wrpr	%r22, 0x013a, %tnpc
	.word 0xb7508000  ! 3809: RDPR_TSTATE	<illegal instruction>
	.word 0xb9643801  ! 3812: MOVcc_I	<illegal instruction>
	.word 0x8d94a068  ! 3814: WRPR_PSTATE_I	wrpr	%r18, 0x0068, %pstate
	.word 0xb5e4e16d  ! 3818: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x81956020  ! 3820: WRPR_TPC_I	wrpr	%r21, 0x0020, %tpc
	.word 0xbb51c000  ! 3821: RDPR_TL	<illegal instruction>
	.word 0xb3e4e125  ! 3823: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e5616f  ! 3824: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4e1f0  ! 3825: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e00b  ! 3826: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4e122  ! 3828: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_3, %g1, %r17
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461d0  ! 3833: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde560c8  ! 3835: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe561a2  ! 3836: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb8850000  ! 3837: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xb9e5a0c5  ! 3838: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde460b8  ! 3840: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe56135  ! 3841: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e10d  ! 3845: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9194a091  ! 3849: WRPR_PIL_I	wrpr	%r18, 0x0091, %pil
	.word 0xbfe520b0  ! 3850: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5e158  ! 3852: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5a047  ! 3855: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe521b6  ! 3857: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf518000  ! 3858: RDPR_PSTATE	<illegal instruction>
	.word 0xb44561fc  ! 3860: ADDC_I	addc 	%r21, 0x01fc, %r26
	.word 0xb1e5e042  ! 3869: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb750c000  ! 3870: RDPR_TT	<illegal instruction>
	.word 0xb29c0000  ! 3874: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0xbde4a057  ! 3875: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e42044  ! 3879: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3882: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4609f  ! 3885: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4e020  ! 3887: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe4a0ed  ! 3893: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5a0b6  ! 3894: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4a079  ! 3895: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe46089  ! 3897: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb6b560e1  ! 3898: ORNcc_I	orncc 	%r21, 0x00e1, %r27
	.word 0xb43ca084  ! 3907: XNOR_I	xnor 	%r18, 0x0084, %r26
	.word 0xb5500000  ! 3910: RDPR_TPC	<illegal instruction>
	.word 0xba140000  ! 3912: OR_R	or 	%r16, %r0, %r29
	.word 0xb9e5614f  ! 3913: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9518000  ! 3915: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f53  ! 3916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f53, %hpstate
	.word 0xb7e5e0b9  ! 3917: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xba0c21d2  ! 3918: AND_I	and 	%r16, 0x01d2, %r29
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe460e5  ! 3923: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5e07f  ! 3925: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x1003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0b4  ! 3928: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4206d  ! 3929: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4218d  ! 3934: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_0, %g1, %r22
	.word 0xb7e5e16e  ! 3938: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e421a4  ! 3939: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e56025  ! 3940: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbec56119  ! 3941: ADDCcc_I	addccc 	%r21, 0x0119, %r31
	.word 0x8595615b  ! 3943: WRPR_TSTATE_I	wrpr	%r21, 0x015b, %tstate
	.word 0xbbe4a129  ! 3946: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4a0bc  ! 3947: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42170  ! 3951: SAVE_I	save	%r16, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 3952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_0, %g1, %r16
	.word 0xb5e42128  ! 3962: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1504000  ! 3965: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e153  ! 3969: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e4a106  ! 3970: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb504000  ! 3978: RDPR_TNPC	<illegal instruction>
	.word 0xbde4e168  ! 3979: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e4a0d8  ! 3980: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4a190  ! 3983: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4e1e3  ! 3984: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e4218b  ! 3988: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde42180  ! 3989: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x819460b2  ! 3991: WRPR_TPC_I	wrpr	%r17, 0x00b2, %tpc
	.word 0xb7e4a0de  ! 3992: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0ef  ! 3997: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4e1db  ! 3999: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe461f2  ! 4000: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb684a1b7  ! 4001: ADDcc_I	addcc 	%r18, 0x01b7, %r27
	.word 0xbde5a160  ! 4005: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e151  ! 4009: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbe25e039  ! 4011: SUB_I	sub 	%r23, 0x0039, %r31
	.word 0x8195a01c  ! 4013: WRPR_TPC_I	wrpr	%r22, 0x001c, %tpc
	.word 0xbde56166  ! 4017: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5e005  ! 4018: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 4021: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf504000  ! 4022: RDPR_TNPC	<illegal instruction>
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6adc000  ! 4024: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xbd518000  ! 4025: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e5604f  ! 4027: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5e04c  ! 4034: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0xbd50c000  ! 4037: RDPR_TT	<illegal instruction>
	.word 0xb8a40000  ! 4041: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xbfe5e1f8  ! 4043: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x1002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4046: RDPR_TPC	<illegal instruction>
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 4054: RDPR_TICK	<illegal instruction>
	.word 0xb5e521e2  ! 4057: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde520a9  ! 4060: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe521db  ! 4061: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde561f0  ! 4062: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb93c3001  ! 4064: SRAX_I	srax	%r16, 0x0001, %r28
	.word 0xb5e4a1c8  ! 4065: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb510000  ! 4069: RDPR_TICK	<illegal instruction>
	.word 0xb7e5e095  ! 4075: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4e016  ! 4076: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x20010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5614d  ! 4078: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5217d  ! 4079: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e560a5  ! 4089: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53cc000  ! 4093: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb7e5e0c8  ! 4097: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde42146  ! 4099: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4a1fe  ! 4101: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd540000  ! 4105: RDPR_GL	<illegal instruction>
	.word 0xb3e42136  ! 4109: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e5e0e4  ! 4110: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb6052124  ! 4111: ADD_I	add 	%r20, 0x0124, %r27
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52c1000  ! 4114: SLLX_R	sllx	%r16, %r0, %r26
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4120: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 4122: RDPR_TICK	<illegal instruction>
	.word 0xb7e5a1bd  ! 4124: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e461d5  ! 4126: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a0ed  ! 4127: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bd21ef  ! 4138: XNORcc_I	xnorcc 	%r20, 0x01ef, %r27
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 4142: RDPR_TT	<illegal instruction>
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb17c6401  ! 4152: MOVR_I	movre	%r17, 0x1, %r24
	mov	1, %r14
	.word 0xa193a000  ! 4153: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4a44000  ! 4154: SUBcc_R	subcc 	%r17, %r0, %r26
	.word 0xb1e5e06b  ! 4157: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e56118  ! 4159: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb51c000  ! 4160: RDPR_TL	<illegal instruction>
	.word 0xbe948000  ! 4163: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xbebc6085  ! 4166: XNORcc_I	xnorcc 	%r17, 0x0085, %r31
	.word 0xb62c0000  ! 4167: ANDN_R	andn 	%r16, %r0, %r27
	.word 0x91952092  ! 4168: WRPR_PIL_I	wrpr	%r20, 0x0092, %pil
	setx	data_start_6, %g1, %r16
	.word 0xbbe4a178  ! 4174: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb6b50000  ! 4175: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xb7508000  ! 4179: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5e176  ! 4182: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a021  ! 4187: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e52044  ! 4188: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7504000  ! 4189: RDPR_TNPC	<illegal instruction>
	.word 0xbde5a131  ! 4190: SAVE_I	save	%r22, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 4195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8994a1f4  ! 4197: WRPR_TICK_I	wrpr	%r18, 0x01f4, %tick
	.word 0xbfe52082  ! 4199: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e46059  ! 4203: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe52034  ! 4205: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e52000  ! 4206: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4a1d7  ! 4207: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e521b9  ! 4208: SAVE_I	save	%r20, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 4210: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd508000  ! 4211: RDPR_TSTATE	<illegal instruction>
	.word 0xb4844000  ! 4212: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xbabcc000  ! 4216: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xb3e5a02f  ! 4218: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4205a  ! 4220: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e421c5  ! 4221: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8195a07b  ! 4222: WRPR_TPC_I	wrpr	%r22, 0x007b, %tpc
	.word 0xbfe5605a  ! 4226: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4218f  ! 4227: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 4228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0xb9e5e0c3  ! 4232: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e561b3  ! 4238: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb81d4000  ! 4239: XOR_R	xor 	%r21, %r0, %r28
	.word 0xb9e5a104  ! 4243: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4619f  ! 4247: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd2c0000  ! 4248: SLL_R	sll 	%r16, %r0, %r30
	.word 0xbbe46092  ! 4250: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e4e031  ! 4259: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e072  ! 4265: WRPR_TPC_I	wrpr	%r23, 0x0072, %tpc
	.word 0x81956099  ! 4268: WRPR_TPC_I	wrpr	%r21, 0x0099, %tpc
	.word 0xbe3c8000  ! 4270: XNOR_R	xnor 	%r18, %r0, %r31
	.word 0xb9e5a0b5  ! 4271: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a043  ! 4273: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb2d5000  ! 4274: SLLX_R	sllx	%r21, %r0, %r29
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc24c000  ! 4277: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb1e5a014  ! 4278: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde461fc  ! 4279: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a038  ! 4290: WRPR_PSTATE_I	wrpr	%r22, 0x0038, %pstate
	.word 0xba2c0000  ! 4292: ANDN_R	andn 	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	.word 0x8395e1d8  ! 4299: WRPR_TNPC_I	wrpr	%r23, 0x01d8, %tnpc
	setx	data_start_5, %g1, %r21
	.word 0xbbe4204b  ! 4302: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8995a14b  ! 4303: WRPR_TICK_I	wrpr	%r22, 0x014b, %tick
	.word 0x9195e0b2  ! 4305: WRPR_PIL_I	wrpr	%r23, 0x00b2, %pil
	setx	data_start_1, %g1, %r22
	.word 0xbbe4a164  ! 4312: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982b91  ! 4315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	.word 0xb5e4e183  ! 4319: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4e02f  ! 4320: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5a0a3  ! 4321: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x9195a07f  ! 4323: WRPR_PIL_I	wrpr	%r22, 0x007f, %pil
	.word 0xb9e4a121  ! 4324: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e42079  ! 4326: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7540000  ! 4327: RDPR_GL	<illegal instruction>
	.word 0xbd520000  ! 4337: RDPR_PIL	<illegal instruction>
	.word 0xb9540000  ! 4339: RDPR_GL	<illegal instruction>
	.word 0xbbe420be  ! 4341: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e56129  ! 4342: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb12d0000  ! 4348: SLL_R	sll 	%r20, %r0, %r24
	.word 0xb135d000  ! 4352: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xb614618a  ! 4354: OR_I	or 	%r17, 0x018a, %r27
	.word 0xb3e520a9  ! 4356: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbda1f8  ! 4359: XNORcc_I	xnorcc 	%r22, 0x01f8, %r30
	.word 0xb9e56156  ! 4360: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb2bc601d  ! 4362: XNORcc_I	xnorcc 	%r17, 0x001d, %r25
	.word 0x8594e0e6  ! 4363: WRPR_TSTATE_I	wrpr	%r19, 0x00e6, %tstate
	.word 0xb7e46044  ! 4365: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e4a054  ! 4367: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd520000  ! 4368: RDPR_PIL	<illegal instruction>
	.word 0xb9518000  ! 4373: RDPR_PSTATE	<illegal instruction>
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0c5  ! 4376: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbb3dd000  ! 4378: SRAX_R	srax	%r23, %r0, %r29
	.word 0xb7e4203a  ! 4380: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbc1ca099  ! 4381: XOR_I	xor 	%r18, 0x0099, %r30
	.word 0xb3e4e150  ! 4382: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e421d8  ! 4383: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9540000  ! 4384: RDPR_GL	<illegal instruction>
	.word 0xb7e5e00a  ! 4390: SAVE_I	save	%r23, 0x0001, %r27
	setx	data_start_6, %g1, %r21
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e19c  ! 4394: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e521fd  ! 4398: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8795a140  ! 4400: WRPR_TT_I	wrpr	%r22, 0x0140, %tt
	.word 0xb9e420c6  ! 4405: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a14a  ! 4406: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5e1fb  ! 4407: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5e10a  ! 4408: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe56134  ! 4410: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf504000  ! 4411: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5a123  ! 4416: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb504000  ! 4419: RDPR_TNPC	<illegal instruction>
	.word 0xb1e52144  ! 4420: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbf641800  ! 4424: MOVcc_R	<illegal instruction>
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbdc000  ! 4432: XNORcc_R	xnorcc 	%r23, %r0, %r30
	setx	data_start_6, %g1, %r20
	.word 0xbb508000  ! 4437: RDPR_TSTATE	<illegal instruction>
	.word 0xbde52108  ! 4442: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9500000  ! 4443: RDPR_TPC	<illegal instruction>
	.word 0xb3e5e1c0  ! 4444: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_3, %g1, %r18
	.word 0xb5e46079  ! 4449: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2db001  ! 4454: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb9e4a01a  ! 4455: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e5e05b  ! 4460: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4a094  ! 4461: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e146  ! 4463: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d94e1bf  ! 4465: WRPR_PSTATE_I	wrpr	%r19, 0x01bf, %pstate
	setx	0xe, %g1, %o0
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
	.word 0xb1e421e0  ! 4471: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe4615b  ! 4472: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 4474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	.word 0xb3e46029  ! 4476: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e461c3  ! 4478: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1510000  ! 4480: RDPR_TICK	<illegal instruction>
	setx	0x2003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e560ca  ! 4483: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0a52000  ! 4484: SUBcc_I	subcc 	%r20, 0x0000, %r24
	.word 0xbde460ba  ! 4486: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb641800  ! 4491: MOVcc_R	<illegal instruction>
	.word 0xbfe5a07f  ! 4495: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e561d0  ! 4496: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e560d1  ! 4500: SAVE_I	save	%r21, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4e08a  ! 4507: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e46115  ! 4509: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbc940000  ! 4513: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xb1e52043  ! 4514: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8794a0fc  ! 4516: WRPR_TT_I	wrpr	%r18, 0x00fc, %tt
	.word 0xbde5a0ca  ! 4517: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb40c20ec  ! 4521: AND_I	and 	%r16, 0x00ec, %r26
	.word 0xb7e520ff  ! 4524: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbd540000  ! 4527: RDPR_GL	<illegal instruction>
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460f3  ! 4530: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde421fe  ! 4533: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a108  ! 4537: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5a1e8  ! 4539: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde56159  ! 4540: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3540000  ! 4541: RDPR_GL	<illegal instruction>
	.word 0xbde5e101  ! 4543: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe240000  ! 4545: SUB_R	sub 	%r16, %r0, %r31
	.word 0xb7e420e9  ! 4546: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e461dd  ! 4547: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4a0c5  ! 4549: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x9194208a  ! 4551: WRPR_PIL_I	wrpr	%r16, 0x008a, %pil
	.word 0xb3e56109  ! 4555: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x819561da  ! 4556: WRPR_TPC_I	wrpr	%r21, 0x01da, %tpc
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 4560: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a011  ! 4566: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_7, %g1, %r22
	.word 0xbbe5a195  ! 4571: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe4a01b  ! 4576: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb224e02e  ! 4577: SUB_I	sub 	%r19, 0x002e, %r25
	.word 0xb5480000  ! 4585: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbde4e099  ! 4586: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe521a3  ! 4587: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e56054  ! 4590: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 4593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0xbde521a7  ! 4594: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e421f3  ! 4600: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde4a0c7  ! 4601: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e52122  ! 4602: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e5e1d7  ! 4603: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde561d6  ! 4604: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8d9420a6  ! 4605: WRPR_PSTATE_I	wrpr	%r16, 0x00a6, %pstate
	.word 0xb7e521df  ! 4607: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7508000  ! 4609: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e151  ! 4610: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e4e077  ! 4615: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8395a0b5  ! 4617: WRPR_TNPC_I	wrpr	%r22, 0x00b5, %tnpc
	.word 0xb9e5a1e6  ! 4618: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4611b  ! 4623: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4e169  ! 4624: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5a062  ! 4627: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e46036  ! 4631: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb80461db  ! 4632: ADD_I	add 	%r17, 0x01db, %r28
	.word 0xba844000  ! 4634: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xbbe4e1f0  ! 4635: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460e2  ! 4639: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e52083  ! 4641: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5e1ae  ! 4644: SAVE_I	save	%r23, 0x0001, %r26
	mov	0, %r14
	.word 0xa193a000  ! 4648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a11e  ! 4650: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e520f5  ! 4651: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4a161  ! 4654: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4e054  ! 4655: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5a1eb  ! 4659: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e5a1c7  ! 4660: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5643801  ! 4662: MOVcc_I	<illegal instruction>
	.word 0xb9e52030  ! 4667: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8994e1b4  ! 4668: WRPR_TICK_I	wrpr	%r19, 0x01b4, %tick
	.word 0xbbe4a16d  ! 4669: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4617a  ! 4675: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1540000  ! 4677: RDPR_GL	<illegal instruction>
	.word 0xb2b4a186  ! 4678: SUBCcc_I	orncc 	%r18, 0x0186, %r25
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5602e  ! 4689: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5609f  ! 4690: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e5e1f9  ! 4691: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e42087  ! 4692: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e52023  ! 4697: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4e063  ! 4707: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9540000  ! 4708: RDPR_GL	<illegal instruction>
	.word 0xb9e4e197  ! 4714: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e4a049  ! 4717: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a06f  ! 4720: SAVE_I	save	%r22, 0x0001, %r29
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
	.word 0xb7e52174  ! 4723: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e4a092  ! 4725: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5540000  ! 4727: RDPR_GL	<illegal instruction>
	.word 0xb5e5e10c  ! 4729: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xba0da089  ! 4732: AND_I	and 	%r22, 0x0089, %r29
	.word 0xbe25c000  ! 4734: SUB_R	sub 	%r23, %r0, %r31
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46141  ! 4743: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb52dd000  ! 4751: SLLX_R	sllx	%r23, %r0, %r26
	.word 0xbfe52053  ! 4754: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x3013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 4757: SRLX_R	srlx	%r19, %r0, %r27
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5207f  ! 4761: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d94a026  ! 4764: WRPR_PSTATE_I	wrpr	%r18, 0x0026, %pstate
	.word 0xbbe4e0d4  ! 4770: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e561d9  ! 4772: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb355000  ! 4776: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xbbe46155  ! 4789: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4e079  ! 4791: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e56114  ! 4797: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb53d6001  ! 4798: SRA_I	sra 	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xbd508000  ! 4808: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r22
	setx	data_start_5, %g1, %r19
	.word 0xb2450000  ! 4816: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xb0444000  ! 4817: ADDC_R	addc 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5609a  ! 4825: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb504000  ! 4826: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e0b8  ! 4829: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e42053  ! 4831: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd50c000  ! 4833: RDPR_TT	<illegal instruction>
	.word 0x9194e159  ! 4834: WRPR_PIL_I	wrpr	%r19, 0x0159, %pil
	.word 0xb5504000  ! 4839: RDPR_TNPC	<illegal instruction>
	.word 0x8795218f  ! 4841: WRPR_TT_I	wrpr	%r20, 0x018f, %tt
	.word 0xb3e4a138  ! 4842: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e460a7  ! 4846: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde421c6  ! 4849: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 4853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xb5e521a9  ! 4854: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde52135  ! 4859: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e460e6  ! 4861: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb6ad60f8  ! 4865: ANDNcc_I	andncc 	%r21, 0x00f8, %r27
	.word 0xb7e56020  ! 4866: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e56031  ! 4868: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x9194e1e5  ! 4869: WRPR_PIL_I	wrpr	%r19, 0x01e5, %pil
	.word 0xb1540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xbe9de0ab  ! 4881: XORcc_I	xorcc 	%r23, 0x00ab, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e421c6  ! 4887: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e52076  ! 4891: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb89c8000  ! 4892: XORcc_R	xorcc 	%r18, %r0, %r28
	.word 0x8994205a  ! 4897: WRPR_TICK_I	wrpr	%r16, 0x005a, %tick
	.word 0x8394e064  ! 4898: WRPR_TNPC_I	wrpr	%r19, 0x0064, %tnpc
	.word 0x87956195  ! 4900: WRPR_TT_I	wrpr	%r21, 0x0195, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde56040  ! 4902: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e4a124  ! 4906: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1510000  ! 4907: RDPR_TICK	<illegal instruction>
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0ac8000  ! 4910: ANDNcc_R	andncc 	%r18, %r0, %r24
	.word 0x839521ec  ! 4912: WRPR_TNPC_I	wrpr	%r20, 0x01ec, %tnpc
	.word 0xb1e56042  ! 4913: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e46048  ! 4918: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5614f  ! 4919: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbc05a1a5  ! 4921: ADD_I	add 	%r22, 0x01a5, %r30
	.word 0xb3e4a00f  ! 4923: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4a0df  ! 4924: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e520b9  ! 4925: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3504000  ! 4926: RDPR_TNPC	<illegal instruction>
	.word 0xb1518000  ! 4927: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5a05f  ! 4931: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e46002  ! 4933: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5a1f4  ! 4936: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb2a4215c  ! 4946: SUBcc_I	subcc 	%r16, 0x015c, %r25
	.word 0xb2b561c7  ! 4948: ORNcc_I	orncc 	%r21, 0x01c7, %r25
	.word 0xb5520000  ! 4949: RDPR_PIL	rdpr	%pil, %r26
	.word 0xb5e5a1dd  ! 4951: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e520b7  ! 4954: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8d95e02f  ! 4956: WRPR_PSTATE_I	wrpr	%r23, 0x002f, %pstate
	.word 0xb5e460a6  ! 4957: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5e06f  ! 4961: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_5, %g1, %r21
	.word 0xbfe5218b  ! 4964: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1540000  ! 4967: RDPR_GL	<illegal instruction>
	.word 0xb535b001  ! 4977: SRLX_I	srlx	%r22, 0x0001, %r26
	setx	0x3013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	.word 0xbde4a17f  ! 4985: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1508000  ! 4989: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4602b  ! 4995: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb8340000  ! 4998: SUBC_R	orn 	%r16, %r0, %r28
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
	.word 0xf82ce17b  ! 1: STB_I	stb	%r28, [%r19 + 0x017b]
	setx	0x121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 10: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfe34a03e  ! 12: STH_I	sth	%r31, [%r18 + 0x003e]
	.word 0x8994e0c8  ! 13: WRPR_TICK_I	wrpr	%r19, 0x00c8, %tick
	.word 0x8795a0b0  ! 14: WRPR_TT_I	wrpr	%r22, 0x00b0, %tt
	.word 0xf025a150  ! 16: STW_I	stw	%r24, [%r22 + 0x0150]
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 23: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf13dc000  ! 26: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf22d4000  ! 27: STB_R	stb	%r25, [%r21 + %r0]
	setx	0x226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xfc2d0000  ! 37: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfa3d219c  ! 38: STD_I	std	%r29, [%r20 + 0x019c]
	.word 0xfc744000  ! 39: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf2258000  ! 40: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb97d0400  ! 42: MOVR_R	movre	%r20, %r0, %r28
	.word 0xb9643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0xfa244000  ! 51: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xbcaca0eb  ! 52: ANDNcc_I	andncc 	%r18, 0x00eb, %r30
	.word 0xf674e16b  ! 53: STX_I	stx	%r27, [%r19 + 0x016b]
	.word 0xf62ca0a5  ! 54: STB_I	stb	%r27, [%r18 + 0x00a5]
	.word 0xf674c000  ! 58: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfe2ce0eb  ! 61: STB_I	stb	%r31, [%r19 + 0x00eb]
	.word 0xb5508000  ! 68: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb3500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xf8246097  ! 70: STW_I	stw	%r28, [%r17 + 0x0097]
	.word 0xb1504000  ! 71: RDPR_TNPC	<illegal instruction>
	.word 0xb3510000  ! 73: RDPR_TICK	<illegal instruction>
	.word 0xf225a02b  ! 74: STW_I	stw	%r25, [%r22 + 0x002b]
	.word 0xb2c4e12f  ! 77: ADDCcc_I	addccc 	%r19, 0x012f, %r25
	.word 0xf275a024  ! 81: STX_I	stx	%r25, [%r22 + 0x0024]
	.word 0xfc3d4000  ! 84: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf03de0fa  ! 86: STD_I	std	%r24, [%r23 + 0x00fa]
	.word 0xf4244000  ! 87: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf43ce15d  ! 89: STD_I	std	%r26, [%r19 + 0x015d]
	.word 0x8395e148  ! 90: WRPR_TNPC_I	wrpr	%r23, 0x0148, %tnpc
	.word 0xf53c2146  ! 92: STDF_I	std	%f26, [0x0146, %r16]
	.word 0xf13c60f3  ! 96: STDF_I	std	%f24, [0x00f3, %r17]
	.word 0xbb518000  ! 97: RDPR_PSTATE	rdpr	%pstate, %r29
	mov	1, %r14
	.word 0xa193a000  ! 98: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8240000  ! 102: STW_R	stw	%r28, [%r16 + %r0]
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3c6028  ! 112: STDF_I	std	%f30, [0x0028, %r17]
	setx	data_start_2, %g1, %r16
	.word 0xfc354000  ! 117: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf02ca0eb  ! 120: STB_I	stb	%r24, [%r18 + 0x00eb]
	.word 0xf825c000  ! 122: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf13dc000  ! 127: STDF_R	std	%f24, [%r0, %r23]
	.word 0xbd51c000  ! 131: RDPR_TL	rdpr	%tl, %r30
	.word 0xb1510000  ! 135: RDPR_TICK	<illegal instruction>
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d4000  ! 140: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfa3d21fc  ! 142: STD_I	std	%r29, [%r20 + 0x01fc]
	.word 0xf4752195  ! 144: STX_I	stx	%r26, [%r20 + 0x0195]
	.word 0xf0252184  ! 147: STW_I	stw	%r24, [%r20 + 0x0184]
	.word 0xb5540000  ! 161: RDPR_GL	rdpr	%-, %r26
	.word 0xf53ce11c  ! 162: STDF_I	std	%f26, [0x011c, %r19]
	.word 0xb77da401  ! 167: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xbf2dc000  ! 168: SLL_R	sll 	%r23, %r0, %r31
	.word 0xb5504000  ! 169: RDPR_TNPC	<illegal instruction>
	.word 0xb73c1000  ! 171: SRAX_R	srax	%r16, %r0, %r27
	.word 0xf634e1ac  ! 173: STH_I	sth	%r27, [%r19 + 0x01ac]
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034a102  ! 187: STH_I	sth	%r24, [%r18 + 0x0102]
	mov	0, %r12
	.word 0x8f932000  ! 189: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982b83  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	.word 0xbf35a001  ! 192: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb8ac0000  ! 197: ANDNcc_R	andncc 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb684c000  ! 204: ADDcc_R	addcc 	%r19, %r0, %r27
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83942036  ! 210: WRPR_TNPC_I	wrpr	%r16, 0x0036, %tnpc
	.word 0xb73cf001  ! 212: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xf82c4000  ! 213: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf624c000  ! 215: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf0744000  ! 217: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xb41ce03a  ! 218: XOR_I	xor 	%r19, 0x003a, %r26
	.word 0xb73da001  ! 222: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xf634e034  ! 225: STH_I	sth	%r27, [%r19 + 0x0034]
	.word 0xf275e047  ! 226: STX_I	stx	%r25, [%r23 + 0x0047]
	.word 0xfd3c0000  ! 227: STDF_R	std	%f30, [%r0, %r16]
	.word 0x9195e07e  ! 230: WRPR_PIL_I	wrpr	%r23, 0x007e, %pil
	.word 0x899461ab  ! 231: WRPR_TICK_I	wrpr	%r17, 0x01ab, %tick
	.word 0xf02ca151  ! 232: STB_I	stb	%r24, [%r18 + 0x0151]
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 236: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa3c0000  ! 237: STD_R	std	%r29, [%r16 + %r0]
	.word 0xf63ce01a  ! 241: STD_I	std	%r27, [%r19 + 0x001a]
	.word 0xf43c207b  ! 243: STD_I	std	%r26, [%r16 + 0x007b]
	.word 0x8395a15f  ! 247: WRPR_TNPC_I	wrpr	%r22, 0x015f, %tnpc
	.word 0x899561a4  ! 249: WRPR_TICK_I	wrpr	%r21, 0x01a4, %tick
	.word 0xff3c4000  ! 250: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf075a04f  ! 253: STX_I	stx	%r24, [%r22 + 0x004f]
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf234a162  ! 266: STH_I	sth	%r25, [%r18 + 0x0162]
	.word 0xfc2de1f2  ! 271: STB_I	stb	%r30, [%r23 + 0x01f2]
	.word 0x89956185  ! 275: WRPR_TICK_I	wrpr	%r21, 0x0185, %tick
	.word 0xf22d8000  ! 279: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf8340000  ! 280: STH_R	sth	%r28, [%r16 + %r0]
	.word 0x8195a19f  ! 281: WRPR_TPC_I	wrpr	%r22, 0x019f, %tpc
	.word 0xbd500000  ! 294: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8395617a  ! 297: WRPR_TNPC_I	wrpr	%r21, 0x017a, %tnpc
	.word 0xfc250000  ! 298: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfa2d6129  ! 299: STB_I	stb	%r29, [%r21 + 0x0129]
	.word 0xbb510000  ! 301: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb9643801  ! 302: MOVcc_I	<illegal instruction>
	.word 0xf43d0000  ! 306: STD_R	std	%r26, [%r20 + %r0]
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	.word 0x839521b1  ! 321: WRPR_TNPC_I	wrpr	%r20, 0x01b1, %tnpc
	.word 0xbf520000  ! 324: RDPR_PIL	rdpr	%pil, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983999  ! 327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1999, %hpstate
	.word 0xf2754000  ! 331: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb3643801  ! 332: MOVcc_I	<illegal instruction>
	.word 0xf4244000  ! 335: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfa754000  ! 336: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfe342101  ! 340: STH_I	sth	%r31, [%r16 + 0x0101]
	.word 0xfe34207a  ! 341: STH_I	sth	%r31, [%r16 + 0x007a]
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23d61ba  ! 347: STD_I	std	%r25, [%r21 + 0x01ba]
	.word 0xfe250000  ! 349: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf83520e9  ! 351: STH_I	sth	%r28, [%r20 + 0x00e9]
	.word 0x8d95e0f5  ! 353: WRPR_PSTATE_I	wrpr	%r23, 0x00f5, %pstate
	.word 0xb22c4000  ! 354: ANDN_R	andn 	%r17, %r0, %r25
	.word 0x8194e1e9  ! 355: WRPR_TPC_I	wrpr	%r19, 0x01e9, %tpc
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	.word 0xb5520000  ! 358: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf23d20ee  ! 359: STD_I	std	%r25, [%r20 + 0x00ee]
	.word 0xfc2d4000  ! 360: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf82c4000  ! 364: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb20da01b  ! 367: AND_I	and 	%r22, 0x001b, %r25
	.word 0xf42ce1b3  ! 370: STB_I	stb	%r26, [%r19 + 0x01b3]
	.word 0xf634e1cf  ! 372: STH_I	sth	%r27, [%r19 + 0x01cf]
	.word 0xf2358000  ! 377: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfb3dc000  ! 378: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfe750000  ! 379: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf42ca1dc  ! 380: STB_I	stb	%r26, [%r18 + 0x01dc]
	.word 0xfe754000  ! 386: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfe24c000  ! 391: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf82d4000  ! 393: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf33d8000  ! 394: STDF_R	std	%f25, [%r0, %r22]
	.word 0xb1540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0xfe2ce0b9  ! 401: STB_I	stb	%r31, [%r19 + 0x00b9]
	.word 0xf874c000  ! 402: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb135d000  ! 403: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xb33de001  ! 404: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xbe35c000  ! 405: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xb12dc000  ! 410: SLL_R	sll 	%r23, %r0, %r24
	.word 0xfa3d216b  ! 412: STD_I	std	%r29, [%r20 + 0x016b]
	.word 0xfa25201f  ! 415: STW_I	stw	%r29, [%r20 + 0x001f]
	.word 0xb9518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0xfc346028  ! 419: STH_I	sth	%r30, [%r17 + 0x0028]
	.word 0xfe25608e  ! 422: STW_I	stw	%r31, [%r21 + 0x008e]
	.word 0xf23de1d6  ! 425: STD_I	std	%r25, [%r23 + 0x01d6]
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3d1000  ! 434: SRAX_R	srax	%r20, %r0, %r30
	.word 0xfc3dc000  ! 435: STD_R	std	%r30, [%r23 + %r0]
	.word 0xfe34c000  ! 437: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x8394204c  ! 440: WRPR_TNPC_I	wrpr	%r16, 0x004c, %tnpc
	.word 0xf2754000  ! 442: STX_R	stx	%r25, [%r21 + %r0]
	setx	data_start_4, %g1, %r18
	.word 0xfd3d21e1  ! 446: STDF_I	std	%f30, [0x01e1, %r20]
	.word 0xff3d609a  ! 448: STDF_I	std	%f31, [0x009a, %r21]
	.word 0xf2344000  ! 451: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xb73dc000  ! 452: SRA_R	sra 	%r23, %r0, %r27
	.word 0xff3ca1c8  ! 455: STDF_I	std	%f31, [0x01c8, %r18]
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 459: STH_R	sth	%r30, [%r23 + %r0]
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85956113  ! 463: WRPR_TSTATE_I	wrpr	%r21, 0x0113, %tstate
	.word 0xf2242171  ! 464: STW_I	stw	%r25, [%r16 + 0x0171]
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 471: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf6348000  ! 472: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfc3d6161  ! 477: STD_I	std	%r30, [%r21 + 0x0161]
	.word 0x9194609c  ! 478: WRPR_PIL_I	wrpr	%r17, 0x009c, %pil
	.word 0xff3c4000  ! 481: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf425a174  ! 482: STW_I	stw	%r26, [%r22 + 0x0174]
	.word 0xf22d8000  ! 483: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xff3d0000  ! 484: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf53d8000  ! 486: STDF_R	std	%f26, [%r0, %r22]
	.word 0xb5510000  ! 488: RDPR_TICK	rdpr	%tick, %r26
	.word 0xff3d206a  ! 489: STDF_I	std	%f31, [0x006a, %r20]
	.word 0xfb3ce02e  ! 490: STDF_I	std	%f29, [0x002e, %r19]
	.word 0xbc44c000  ! 491: ADDC_R	addc 	%r19, %r0, %r30
	.word 0xfe2d4000  ! 495: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xb8bdc000  ! 497: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xb62c0000  ! 498: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xb3508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xfa240000  ! 500: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf035c000  ! 501: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf13c2048  ! 503: STDF_I	std	%f24, [0x0048, %r16]
	.word 0x859461b7  ! 513: WRPR_TSTATE_I	wrpr	%r17, 0x01b7, %tstate
	.word 0xfa3ca115  ! 517: STD_I	std	%r29, [%r18 + 0x0115]
	.word 0xff3d8000  ! 518: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf8348000  ! 519: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf03da024  ! 520: STD_I	std	%r24, [%r22 + 0x0024]
	.word 0xb68561d3  ! 521: ADDcc_I	addcc 	%r21, 0x01d3, %r27
	.word 0xbb508000  ! 523: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb80c4000  ! 525: AND_R	and 	%r17, %r0, %r28
	mov	1, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf33c8000  ! 527: STDF_R	std	%f25, [%r0, %r18]
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d8000  ! 538: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf8752196  ! 540: STX_I	stx	%r28, [%r20 + 0x0196]
	.word 0x879561ca  ! 541: WRPR_TT_I	wrpr	%r21, 0x01ca, %tt
	.word 0xf675c000  ! 543: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf8758000  ! 551: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf63c21e8  ! 557: STD_I	std	%r27, [%r16 + 0x01e8]
	.word 0xbe254000  ! 559: SUB_R	sub 	%r21, %r0, %r31
	.word 0xf43ce16b  ! 563: STD_I	std	%r26, [%r19 + 0x016b]
	.word 0x899520d1  ! 564: WRPR_TICK_I	wrpr	%r20, 0x00d1, %tick
	.word 0xf02cc000  ! 565: STB_R	stb	%r24, [%r19 + %r0]
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22560c6  ! 568: STW_I	stw	%r25, [%r21 + 0x00c6]
	.word 0xfa74c000  ! 569: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfc3461ba  ! 572: STH_I	sth	%r30, [%r17 + 0x01ba]
	.word 0xfc744000  ! 573: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xbe1420e7  ! 580: OR_I	or 	%r16, 0x00e7, %r31
	.word 0xfc248000  ! 582: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf43d8000  ! 585: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf53ce04a  ! 586: STDF_I	std	%f26, [0x004a, %r19]
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919420a8  ! 594: WRPR_PIL_I	wrpr	%r16, 0x00a8, %pil
	.word 0xfe34c000  ! 597: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe34c000  ! 599: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xb1508000  ! 602: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb1480000  ! 606: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf4748000  ! 609: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf73c4000  ! 611: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb72ce001  ! 612: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xfe24e1e7  ! 617: STW_I	stw	%r31, [%r19 + 0x01e7]
	.word 0xfa3d601b  ! 623: STD_I	std	%r29, [%r21 + 0x001b]
	.word 0x859420ce  ! 624: WRPR_TSTATE_I	wrpr	%r16, 0x00ce, %tstate
	mov	2, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb12d7001  ! 628: SLLX_I	sllx	%r21, 0x0001, %r24
	setx	data_start_3, %g1, %r20
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 637: STX_R	stx	%r24, [%r21 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 639: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa2d0000  ! 644: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbcbc0000  ! 647: XNORcc_R	xnorcc 	%r16, %r0, %r30
	mov	0, %r12
	.word 0x8f932000  ! 648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf2256121  ! 652: STW_I	stw	%r25, [%r21 + 0x0121]
	.word 0xf035617c  ! 656: STH_I	sth	%r24, [%r21 + 0x017c]
	.word 0xfc3dc000  ! 658: STD_R	std	%r30, [%r23 + %r0]
	.word 0xb60560b1  ! 662: ADD_I	add 	%r21, 0x00b1, %r27
	.word 0xf53de04d  ! 664: STDF_I	std	%f26, [0x004d, %r23]
	.word 0xfa24a0a3  ! 666: STW_I	stw	%r29, [%r18 + 0x00a3]
	.word 0xf42560b2  ! 667: STW_I	stw	%r26, [%r21 + 0x00b2]
	.word 0x81956159  ! 668: WRPR_TPC_I	wrpr	%r21, 0x0159, %tpc
	.word 0x8795a018  ! 669: WRPR_TT_I	wrpr	%r22, 0x0018, %tt
	.word 0x89956161  ! 673: WRPR_TICK_I	wrpr	%r21, 0x0161, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r19
	setx	data_start_1, %g1, %r21
	.word 0xf424c000  ! 680: STW_R	stw	%r26, [%r19 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf2340000  ! 682: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xbf520000  ! 683: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf4246113  ! 689: STW_I	stw	%r26, [%r17 + 0x0113]
	.word 0xf6256020  ! 690: STW_I	stw	%r27, [%r21 + 0x0020]
	.word 0xfc3c203a  ! 691: STD_I	std	%r30, [%r16 + 0x003a]
	.word 0xf02cc000  ! 698: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb73c2001  ! 699: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0x8594a16f  ! 701: WRPR_TSTATE_I	wrpr	%r18, 0x016f, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983819  ! 702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1819, %hpstate
	.word 0xf6246114  ! 707: STW_I	stw	%r27, [%r17 + 0x0114]
	.word 0xf73dc000  ! 708: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfe2d60c9  ! 711: STB_I	stb	%r31, [%r21 + 0x00c9]
	.word 0xf6746007  ! 712: STX_I	stx	%r27, [%r17 + 0x0007]
	.word 0xfb3ca16c  ! 714: STDF_I	std	%f29, [0x016c, %r18]
	.word 0xbf2c0000  ! 715: SLL_R	sll 	%r16, %r0, %r31
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e095  ! 718: WRPR_TSTATE_I	wrpr	%r19, 0x0095, %tstate
	.word 0xf8748000  ! 719: STX_R	stx	%r28, [%r18 + %r0]
	setx	data_start_6, %g1, %r22
	.word 0xf82d2090  ! 724: STB_I	stb	%r28, [%r20 + 0x0090]
	.word 0xf2744000  ! 727: STX_R	stx	%r25, [%r17 + %r0]
	.word 0x859560e1  ! 728: WRPR_TSTATE_I	wrpr	%r21, 0x00e1, %tstate
	.word 0xf43cc000  ! 729: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf53d2118  ! 734: STDF_I	std	%f26, [0x0118, %r20]
	.word 0xf674c000  ! 735: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xb1500000  ! 737: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf425a10f  ! 740: STW_I	stw	%r26, [%r22 + 0x010f]
	.word 0xbc85a1d2  ! 743: ADDcc_I	addcc 	%r22, 0x01d2, %r30
	.word 0xbc3de0ab  ! 744: XNOR_I	xnor 	%r23, 0x00ab, %r30
	setx	0x135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53d2001  ! 747: SRA_I	sra 	%r20, 0x0001, %r26
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983b03  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b03, %hpstate
	.word 0xfc2de1b7  ! 752: STB_I	stb	%r30, [%r23 + 0x01b7]
	.word 0xf82c0000  ! 755: STB_R	stb	%r28, [%r16 + %r0]
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43ca1a7  ! 759: STD_I	std	%r26, [%r18 + 0x01a7]
	.word 0xf23ce13b  ! 761: STD_I	std	%r25, [%r19 + 0x013b]
	.word 0xf62c8000  ! 764: STB_R	stb	%r27, [%r18 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x91956169  ! 773: WRPR_PIL_I	wrpr	%r21, 0x0169, %pil
	.word 0x8595e011  ! 774: WRPR_TSTATE_I	wrpr	%r23, 0x0011, %tstate
	.word 0xf63d0000  ! 778: STD_R	std	%r27, [%r20 + %r0]
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb77c4400  ! 783: MOVR_R	movre	%r17, %r0, %r27
	.word 0xbd540000  ! 786: RDPR_GL	rdpr	%-, %r30
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63cc000  ! 793: XNOR_R	xnor 	%r19, %r0, %r27
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4148000  ! 798: OR_R	or 	%r18, %r0, %r26
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 801: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb295a0c3  ! 802: ORcc_I	orcc 	%r22, 0x00c3, %r25
	.word 0xf434e05f  ! 810: STH_I	sth	%r26, [%r19 + 0x005f]
	.word 0xfe2c0000  ! 811: STB_R	stb	%r31, [%r16 + %r0]
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 814: RDPR_GL	rdpr	%-, %r30
	.word 0x89956183  ! 817: WRPR_TICK_I	wrpr	%r21, 0x0183, %tick
	.word 0x899460ef  ! 822: WRPR_TICK_I	wrpr	%r17, 0x00ef, %tick
	.word 0xfe2c6019  ! 826: STB_I	stb	%r31, [%r17 + 0x0019]
	.word 0x9195a102  ! 829: WRPR_PIL_I	wrpr	%r22, 0x0102, %pil
	.word 0xbb510000  ! 835: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbec521e6  ! 842: ADDCcc_I	addccc 	%r20, 0x01e6, %r31
	.word 0xb551c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xbf340000  ! 850: SRL_R	srl 	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3d0000  ! 856: STD_R	std	%r30, [%r20 + %r0]
	.word 0x8794a1db  ! 857: WRPR_TT_I	wrpr	%r18, 0x01db, %tt
	.word 0xf8258000  ! 859: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfc3da173  ! 866: STD_I	std	%r30, [%r22 + 0x0173]
	.word 0xf02cc000  ! 871: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf13d6033  ! 873: STDF_I	std	%f24, [0x0033, %r21]
	.word 0xb2b58000  ! 876: ORNcc_R	orncc 	%r22, %r0, %r25
	.word 0xfc24e0a3  ! 878: STW_I	stw	%r30, [%r19 + 0x00a3]
	.word 0xf22c4000  ! 882: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf73dc000  ! 883: STDF_R	std	%f27, [%r0, %r23]
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 885: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc3cc000  ! 886: STD_R	std	%r30, [%r19 + %r0]
	.word 0xb1510000  ! 891: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf6758000  ! 895: STX_R	stx	%r27, [%r22 + %r0]
	.word 0x8195209b  ! 898: WRPR_TPC_I	wrpr	%r20, 0x009b, %tpc
	.word 0xfb3ca1a8  ! 901: STDF_I	std	%f29, [0x01a8, %r18]
	.word 0xb5480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf22da108  ! 904: STB_I	stb	%r25, [%r22 + 0x0108]
	.word 0xbc3c0000  ! 905: XNOR_R	xnor 	%r16, %r0, %r30
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 912: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe34c000  ! 920: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xff3c20ce  ! 925: STDF_I	std	%f31, [0x00ce, %r16]
	.word 0x8395a166  ! 926: WRPR_TNPC_I	wrpr	%r22, 0x0166, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 927: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6b4a14d  ! 929: ORNcc_I	orncc 	%r18, 0x014d, %r27
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93d3001  ! 932: SRAX_I	srax	%r20, 0x0001, %r28
	.word 0xfe740000  ! 934: STX_R	stx	%r31, [%r16 + %r0]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23dc000  ! 936: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfe744000  ! 937: STX_R	stx	%r31, [%r17 + %r0]
	.word 0x9195e087  ! 941: WRPR_PIL_I	wrpr	%r23, 0x0087, %pil
	.word 0xf874a1c8  ! 946: STX_I	stx	%r28, [%r18 + 0x01c8]
	.word 0xfb3da1c5  ! 948: STDF_I	std	%f29, [0x01c5, %r22]
	.word 0xf4244000  ! 951: STW_R	stw	%r26, [%r17 + %r0]
	setx	0x1002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 961: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xbf504000  ! 964: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf475e043  ! 966: STX_I	stx	%r26, [%r23 + 0x0043]
	.word 0xf03ce0d0  ! 967: STD_I	std	%r24, [%r19 + 0x00d0]
	.word 0xf23de0d4  ! 971: STD_I	std	%r25, [%r23 + 0x00d4]
	.word 0xfc24c000  ! 972: STW_R	stw	%r30, [%r19 + %r0]
	setx	0x10335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c4000  ! 979: STDF_R	std	%f24, [%r0, %r17]
	.word 0x8d9560a7  ! 981: WRPR_PSTATE_I	wrpr	%r21, 0x00a7, %pstate
	.word 0xb84521e0  ! 983: ADDC_I	addc 	%r20, 0x01e0, %r28
	mov	2, %r14
	.word 0xa193a000  ! 985: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r16
	.word 0xf0350000  ! 988: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb32cd000  ! 989: SLLX_R	sllx	%r19, %r0, %r25
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0c44000  ! 994: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xb02c0000  ! 995: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xf43d8000  ! 996: STD_R	std	%r26, [%r22 + %r0]
	.word 0xb1520000  ! 1001: RDPR_PIL	rdpr	%pil, %r24
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf635c000  ! 1006: STH_R	sth	%r27, [%r23 + %r0]
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe358000  ! 1008: ORN_R	orn 	%r22, %r0, %r31
	.word 0xfd3cc000  ! 1010: STDF_R	std	%f30, [%r0, %r19]
	.word 0x9195e195  ! 1015: WRPR_PIL_I	wrpr	%r23, 0x0195, %pil
	.word 0xf4756191  ! 1018: STX_I	stx	%r26, [%r21 + 0x0191]
	.word 0xf33ce032  ! 1019: STDF_I	std	%f25, [0x0032, %r19]
	.word 0xbf504000  ! 1020: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xfc2d4000  ! 1026: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xbe140000  ! 1031: OR_R	or 	%r16, %r0, %r31
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d20a5  ! 1041: STD_I	std	%r31, [%r20 + 0x00a5]
	.word 0xfc2c60c3  ! 1042: STB_I	stb	%r30, [%r17 + 0x00c3]
	.word 0xf475c000  ! 1046: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf43461f9  ! 1047: STH_I	sth	%r26, [%r17 + 0x01f9]
	.word 0xfe7460f5  ! 1049: STX_I	stx	%r31, [%r17 + 0x00f5]
	.word 0xfc3c8000  ! 1054: STD_R	std	%r30, [%r18 + %r0]
	.word 0xbf510000  ! 1057: RDPR_TICK	<illegal instruction>
	.word 0xf0748000  ! 1058: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xb9480000  ! 1060: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	data_start_1, %g1, %r23
	.word 0xf22d2194  ! 1066: STB_I	stb	%r25, [%r20 + 0x0194]
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1072: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf62c61c8  ! 1074: STB_I	stb	%r27, [%r17 + 0x01c8]
	mov	0, %r14
	.word 0xa193a000  ! 1075: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85956048  ! 1076: WRPR_TSTATE_I	wrpr	%r21, 0x0048, %tstate
	.word 0xf23c8000  ! 1077: STD_R	std	%r25, [%r18 + %r0]
	.word 0xfb3c21a3  ! 1083: STDF_I	std	%f29, [0x01a3, %r16]
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1086: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf674e1c1  ! 1087: STX_I	stx	%r27, [%r19 + 0x01c1]
	.word 0xfe2c20ce  ! 1089: STB_I	stb	%r31, [%r16 + 0x00ce]
	.word 0xf824219b  ! 1090: STW_I	stw	%r28, [%r16 + 0x019b]
	.word 0xb9480000  ! 1091: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025e10c  ! 1097: STW_I	stw	%r24, [%r23 + 0x010c]
	.word 0xb9480000  ! 1099: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8194a1ca  ! 1101: WRPR_TPC_I	wrpr	%r18, 0x01ca, %tpc
	.word 0xfa344000  ! 1104: STH_R	sth	%r29, [%r17 + %r0]
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c21f0  ! 1106: STB_I	stb	%r29, [%r16 + 0x01f0]
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	.word 0xf03c4000  ! 1110: STD_R	std	%r24, [%r17 + %r0]
	.word 0xbf51c000  ! 1111: RDPR_TL	rdpr	%tl, %r31
	.word 0xbb540000  ! 1112: RDPR_GL	<illegal instruction>
	.word 0xf33c213b  ! 1113: STDF_I	std	%f25, [0x013b, %r16]
	mov	1, %r12
	.word 0x8f932000  ! 1114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xff3d8000  ! 1116: STDF_R	std	%f31, [%r0, %r22]
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 1122: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf034614e  ! 1124: STH_I	sth	%r24, [%r17 + 0x014e]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf510000  ! 1128: RDPR_TICK	rdpr	%tick, %r31
	.word 0xfa75c000  ! 1130: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf624e08a  ! 1132: STW_I	stw	%r27, [%r19 + 0x008a]
	.word 0xf33c0000  ! 1133: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf87520e4  ! 1134: STX_I	stx	%r28, [%r20 + 0x00e4]
	.word 0xf624a1fa  ! 1136: STW_I	stw	%r27, [%r18 + 0x01fa]
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81946102  ! 1145: WRPR_TPC_I	wrpr	%r17, 0x0102, %tpc
	.word 0xbcbdc000  ! 1146: XNORcc_R	xnorcc 	%r23, %r0, %r30
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa356019  ! 1153: STH_I	sth	%r29, [%r21 + 0x0019]
	.word 0xb1480000  ! 1155: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	2, %r14
	.word 0xa193a000  ! 1156: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf42ce064  ! 1158: STB_I	stb	%r26, [%r19 + 0x0064]
	.word 0xfc742131  ! 1162: STX_I	stx	%r30, [%r16 + 0x0131]
	.word 0xff3ca000  ! 1165: STDF_I	std	%f31, [0x0000, %r18]
	.word 0xf475c000  ! 1167: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf53ce0e0  ! 1168: STDF_I	std	%f26, [0x00e0, %r19]
	.word 0xf33c0000  ! 1169: STDF_R	std	%f25, [%r0, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81982a83  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	setx	data_start_7, %g1, %r22
	.word 0xfa346079  ! 1178: STH_I	sth	%r29, [%r17 + 0x0079]
	.word 0xf225202c  ! 1181: STW_I	stw	%r25, [%r20 + 0x002c]
	.word 0xb951c000  ! 1184: RDPR_TL	rdpr	%tl, %r28
	.word 0xb2ac4000  ! 1189: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0x8794a0f6  ! 1190: WRPR_TT_I	wrpr	%r18, 0x00f6, %tt
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1193: RDPR_TT	rdpr	%tt, %r27
	.word 0xbc84204a  ! 1195: ADDcc_I	addcc 	%r16, 0x004a, %r30
	.word 0x859460b2  ! 1197: WRPR_TSTATE_I	wrpr	%r17, 0x00b2, %tstate
	.word 0xfe24a126  ! 1200: STW_I	stw	%r31, [%r18 + 0x0126]
	.word 0xfc2560cb  ! 1203: STW_I	stw	%r30, [%r21 + 0x00cb]
	.word 0xfb3c219a  ! 1205: STDF_I	std	%f29, [0x019a, %r16]
	.word 0x8195e09e  ! 1207: WRPR_TPC_I	wrpr	%r23, 0x009e, %tpc
	.word 0xf825e0d2  ! 1208: STW_I	stw	%r28, [%r23 + 0x00d2]
	.word 0xf73ce05e  ! 1209: STDF_I	std	%f27, [0x005e, %r19]
	.word 0xb2442088  ! 1210: ADDC_I	addc 	%r16, 0x0088, %r25
	.word 0xf835c000  ! 1211: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfa246131  ! 1212: STW_I	stw	%r29, [%r17 + 0x0131]
	.word 0xfe34a157  ! 1220: STH_I	sth	%r31, [%r18 + 0x0157]
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 1222: STX_R	stx	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f03  ! 1224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f03, %hpstate
	.word 0xf63c0000  ! 1225: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf53c6162  ! 1228: STDF_I	std	%f26, [0x0162, %r17]
	.word 0xfb3d4000  ! 1235: STDF_R	std	%f29, [%r0, %r21]
	.word 0xff3c203c  ! 1237: STDF_I	std	%f31, [0x003c, %r16]
	.word 0xbd641800  ! 1238: MOVcc_R	<illegal instruction>
	.word 0xf435c000  ! 1239: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf274c000  ! 1240: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xfc25204e  ! 1243: STW_I	stw	%r30, [%r20 + 0x004e]
	ta	T_CHANGE_HPRIV
	.word 0x81983d53  ! 1246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d53, %hpstate
	.word 0xfc7520b8  ! 1248: STX_I	stx	%r30, [%r20 + 0x00b8]
	.word 0xb28c20d1  ! 1254: ANDcc_I	andcc 	%r16, 0x00d1, %r25
	.word 0xbb2c7001  ! 1255: SLLX_I	sllx	%r17, 0x0001, %r29
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95218b  ! 1265: WRPR_PSTATE_I	wrpr	%r20, 0x018b, %pstate
	.word 0x8195e12a  ! 1266: WRPR_TPC_I	wrpr	%r23, 0x012a, %tpc
	.word 0xfb3d6133  ! 1268: STDF_I	std	%f29, [0x0133, %r21]
	.word 0xf6258000  ! 1269: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xb53d8000  ! 1272: SRA_R	sra 	%r22, %r0, %r26
	.word 0xb48c0000  ! 1273: ANDcc_R	andcc 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb404e1bb  ! 1276: ADD_I	add 	%r19, 0x01bb, %r26
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675201a  ! 1279: STX_I	stx	%r27, [%r20 + 0x001a]
	.word 0xb1540000  ! 1282: RDPR_GL	rdpr	%-, %r24
	.word 0xfe24c000  ! 1283: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xb7500000  ! 1284: RDPR_TPC	<illegal instruction>
	.word 0xf0756199  ! 1289: STX_I	stx	%r24, [%r21 + 0x0199]
	.word 0xf63ca0b7  ! 1290: STD_I	std	%r27, [%r18 + 0x00b7]
	.word 0xf224e1be  ! 1291: STW_I	stw	%r25, [%r19 + 0x01be]
	.word 0xf43c0000  ! 1292: STD_R	std	%r26, [%r16 + %r0]
	.word 0xfa35a046  ! 1295: STH_I	sth	%r29, [%r22 + 0x0046]
	setx	0x22d, %g1, %o0
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
	.word 0xf63d4000  ! 1304: STD_R	std	%r27, [%r21 + %r0]
	.word 0x8795e093  ! 1305: WRPR_TT_I	wrpr	%r23, 0x0093, %tt
	.word 0xf33d2146  ! 1306: STDF_I	std	%f25, [0x0146, %r20]
	.word 0xb42c208d  ! 1307: ANDN_I	andn 	%r16, 0x008d, %r26
	.word 0xf6742008  ! 1308: STX_I	stx	%r27, [%r16 + 0x0008]
	.word 0xb5500000  ! 1309: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 1312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0x8795201d  ! 1313: WRPR_TT_I	wrpr	%r20, 0x001d, %tt
	setx	data_start_3, %g1, %r21
	.word 0xf424c000  ! 1318: STW_R	stw	%r26, [%r19 + %r0]
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 1323: STX_R	stx	%r31, [%r17 + %r0]
	.word 0x91946085  ! 1324: WRPR_PIL_I	wrpr	%r17, 0x0085, %pil
	.word 0xfd3cc000  ! 1325: STDF_R	std	%f30, [%r0, %r19]
	.word 0xbf520000  ! 1327: RDPR_PIL	rdpr	%pil, %r31
	.word 0xbf508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xf87460b9  ! 1331: STX_I	stx	%r28, [%r17 + 0x00b9]
	.word 0xfb3ca119  ! 1333: STDF_I	std	%f29, [0x0119, %r18]
	.word 0xb7510000  ! 1335: RDPR_TICK	<illegal instruction>
	.word 0xb5540000  ! 1338: RDPR_GL	<illegal instruction>
	.word 0xf2248000  ! 1339: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf035a127  ! 1340: STH_I	sth	%r24, [%r22 + 0x0127]
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf474a007  ! 1347: STX_I	stx	%r26, [%r18 + 0x0007]
	.word 0xb8a54000  ! 1349: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xb20ca098  ! 1350: AND_I	and 	%r18, 0x0098, %r25
	.word 0xba0c60dd  ! 1352: AND_I	and 	%r17, 0x00dd, %r29
	.word 0xff3d2156  ! 1353: STDF_I	std	%f31, [0x0156, %r20]
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2950000  ! 1362: ORcc_R	orcc 	%r20, %r0, %r25
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 1364: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xf83c0000  ! 1369: STD_R	std	%r28, [%r16 + %r0]
	.word 0xfc250000  ! 1370: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfa74e139  ! 1371: STX_I	stx	%r29, [%r19 + 0x0139]
	.word 0xfa2d0000  ! 1372: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb2bc60b0  ! 1374: XNORcc_I	xnorcc 	%r17, 0x00b0, %r25
	.word 0xfe342007  ! 1379: STH_I	sth	%r31, [%r16 + 0x0007]
	.word 0xf83c8000  ! 1380: STD_R	std	%r28, [%r18 + %r0]
	.word 0xfe2da174  ! 1384: STB_I	stb	%r31, [%r22 + 0x0174]
	.word 0xf02d4000  ! 1385: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xfe358000  ! 1386: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xfe25e12a  ! 1387: STW_I	stw	%r31, [%r23 + 0x012a]
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73de1db  ! 1389: STDF_I	std	%f27, [0x01db, %r23]
	.word 0x8594a1cc  ! 1391: WRPR_TSTATE_I	wrpr	%r18, 0x01cc, %tstate
	.word 0xf4358000  ! 1392: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xb3508000  ! 1393: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xfe24a1d9  ! 1394: STW_I	stw	%r31, [%r18 + 0x01d9]
	setx	data_start_3, %g1, %r16
	.word 0xfb3d6092  ! 1398: STDF_I	std	%f29, [0x0092, %r21]
	.word 0xb5641800  ! 1401: MOVcc_R	<illegal instruction>
	.word 0xb61ce0c8  ! 1404: XOR_I	xor 	%r19, 0x00c8, %r27
	.word 0xf03c4000  ! 1407: STD_R	std	%r24, [%r17 + %r0]
	.word 0xfc3c4000  ! 1411: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf6754000  ! 1417: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfc35c000  ! 1421: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xb1510000  ! 1424: RDPR_TICK	<illegal instruction>
	.word 0xfe2dc000  ! 1425: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf874c000  ! 1426: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf33c4000  ! 1428: STDF_R	std	%f25, [%r0, %r17]
	.word 0xb5480000  ! 1431: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34e0d8  ! 1435: STH_I	sth	%r31, [%r19 + 0x00d8]
	.word 0xf63cc000  ! 1442: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfe35a0c2  ! 1444: STH_I	sth	%r31, [%r22 + 0x00c2]
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 1448: STX_R	stx	%r24, [%r20 + %r0]
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919460b0  ! 1453: WRPR_PIL_I	wrpr	%r17, 0x00b0, %pil
	.word 0xf675c000  ! 1454: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfc3de1c2  ! 1455: STD_I	std	%r30, [%r23 + 0x01c2]
	.word 0xf33da1ae  ! 1458: STDF_I	std	%f25, [0x01ae, %r22]
	.word 0xfe35e158  ! 1459: STH_I	sth	%r31, [%r23 + 0x0158]
	.word 0xf63da0f0  ! 1460: STD_I	std	%r27, [%r22 + 0x00f0]
	.word 0xb6150000  ! 1461: OR_R	or 	%r20, %r0, %r27
	.word 0xf874a149  ! 1462: STX_I	stx	%r28, [%r18 + 0x0149]
	.word 0xf4258000  ! 1464: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xfd3dc000  ! 1466: STDF_R	std	%f30, [%r0, %r23]
	mov	0, %r12
	.word 0x8f932000  ! 1469: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf824e0b7  ! 1472: STW_I	stw	%r28, [%r19 + 0x00b7]
	.word 0xf82d0000  ! 1474: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb934c000  ! 1476: SRL_R	srl 	%r19, %r0, %r28
	.word 0xf33de0c8  ! 1481: STDF_I	std	%f25, [0x00c8, %r23]
	.word 0xbb51c000  ! 1486: RDPR_TL	rdpr	%tl, %r29
	.word 0xf235c000  ! 1487: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf42c4000  ! 1492: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xfa3c215a  ! 1497: STD_I	std	%r29, [%r16 + 0x015a]
	.word 0xfc2da10d  ! 1499: STB_I	stb	%r30, [%r22 + 0x010d]
	.word 0xb80561d3  ! 1504: ADD_I	add 	%r21, 0x01d3, %r28
	.word 0xf824c000  ! 1506: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf83de0d8  ! 1507: STD_I	std	%r28, [%r23 + 0x00d8]
	.word 0xf22c0000  ! 1508: STB_R	stb	%r25, [%r16 + %r0]
	.word 0x89946090  ! 1510: WRPR_TICK_I	wrpr	%r17, 0x0090, %tick
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982953  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0953, %hpstate
	.word 0xfc35e011  ! 1516: STH_I	sth	%r30, [%r23 + 0x0011]
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22c608e  ! 1525: STB_I	stb	%r25, [%r17 + 0x008e]
	.word 0xbb510000  ! 1526: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf2254000  ! 1527: STW_R	stw	%r25, [%r21 + %r0]
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75618f  ! 1538: STX_I	stx	%r31, [%r21 + 0x018f]
	.word 0xf62c8000  ! 1540: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf2752148  ! 1545: STX_I	stx	%r25, [%r20 + 0x0148]
	.word 0xfc24a08a  ! 1546: STW_I	stw	%r30, [%r18 + 0x008a]
	ta	T_CHANGE_HPRIV
	.word 0x81983d53  ! 1548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d53, %hpstate
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1550: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xbf510000  ! 1551: RDPR_TICK	<illegal instruction>
	.word 0xb82d4000  ! 1553: ANDN_R	andn 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xfa250000  ! 1558: STW_R	stw	%r29, [%r20 + %r0]
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675e1f7  ! 1563: STX_I	stx	%r27, [%r23 + 0x01f7]
	.word 0xb7500000  ! 1564: RDPR_TPC	<illegal instruction>
	.word 0xb02c61e0  ! 1567: ANDN_I	andn 	%r17, 0x01e0, %r24
	setx	data_start_6, %g1, %r16
	mov	2, %r12
	.word 0x8f932000  ! 1571: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf63c0000  ! 1573: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb0bcc000  ! 1574: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xf43c20ed  ! 1575: STD_I	std	%r26, [%r16 + 0x00ed]
	.word 0xf4742079  ! 1576: STX_I	stx	%r26, [%r16 + 0x0079]
	setx	data_start_2, %g1, %r21
	setx	data_start_7, %g1, %r21
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942087  ! 1590: WRPR_TT_I	wrpr	%r16, 0x0087, %tt
	.word 0xf07561b9  ! 1591: STX_I	stx	%r24, [%r21 + 0x01b9]
	.word 0x819560ab  ! 1594: WRPR_TPC_I	wrpr	%r21, 0x00ab, %tpc
	.word 0xf674a18d  ! 1595: STX_I	stx	%r27, [%r18 + 0x018d]
	.word 0xf02dc000  ! 1599: STB_R	stb	%r24, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 1600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe24e152  ! 1602: STW_I	stw	%r31, [%r19 + 0x0152]
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d8000  ! 1606: STDF_R	std	%f31, [%r0, %r22]
	.word 0xb3510000  ! 1608: RDPR_TICK	rdpr	%tick, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982a41  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0xfc3d0000  ! 1615: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfe75c000  ! 1617: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xbb520000  ! 1621: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf2354000  ! 1625: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xb9508000  ! 1628: RDPR_TSTATE	<illegal instruction>
	.word 0xf8250000  ! 1629: STW_R	stw	%r28, [%r20 + %r0]
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 1633: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa2c2072  ! 1634: STB_I	stb	%r29, [%r16 + 0x0072]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3d7001  ! 1641: SRAX_I	srax	%r21, 0x0001, %r29
	.word 0xb1520000  ! 1644: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 1645: RDPR_TL	<illegal instruction>
	.word 0xf63d6063  ! 1646: STD_I	std	%r27, [%r21 + 0x0063]
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 1648: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf4754000  ! 1651: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfd3d204f  ! 1652: STDF_I	std	%f30, [0x004f, %r20]
	.word 0xbeb44000  ! 1653: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xf425a0aa  ! 1660: STW_I	stw	%r26, [%r22 + 0x00aa]
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 1666: RDPR_GL	<illegal instruction>
	.word 0xf624a042  ! 1670: STW_I	stw	%r27, [%r18 + 0x0042]
	.word 0x8d95e1ad  ! 1671: WRPR_PSTATE_I	wrpr	%r23, 0x01ad, %pstate
	setx	0x20220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 1680: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb83c0000  ! 1681: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xf225a0e8  ! 1682: STW_I	stw	%r25, [%r22 + 0x00e8]
	.word 0xb3508000  ! 1687: RDPR_TSTATE	<illegal instruction>
	.word 0xf82cc000  ! 1688: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfc758000  ! 1695: STX_R	stx	%r30, [%r22 + %r0]
	.word 0x8194e0a9  ! 1704: WRPR_TPC_I	wrpr	%r19, 0x00a9, %tpc
	.word 0xf4756000  ! 1706: STX_I	stx	%r26, [%r21 + 0x0000]
	.word 0xfe35a08c  ! 1707: STH_I	sth	%r31, [%r22 + 0x008c]
	.word 0x8395205d  ! 1709: WRPR_TNPC_I	wrpr	%r20, 0x005d, %tnpc
	.word 0xbf518000  ! 1711: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf6350000  ! 1712: STH_R	sth	%r27, [%r20 + %r0]
	setx	0x3000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf875603f  ! 1714: STX_I	stx	%r28, [%r21 + 0x003f]
	.word 0xff3c8000  ! 1717: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf73d6139  ! 1718: STDF_I	std	%f27, [0x0139, %r21]
	.word 0xb0258000  ! 1719: SUB_R	sub 	%r22, %r0, %r24
	.word 0xf42421ee  ! 1721: STW_I	stw	%r26, [%r16 + 0x01ee]
	.word 0xf4250000  ! 1724: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf03d60a8  ! 1726: STD_I	std	%r24, [%r21 + 0x00a8]
	.word 0xfb3c8000  ! 1729: STDF_R	std	%f29, [%r0, %r18]
	.word 0xfc2ce063  ! 1731: STB_I	stb	%r30, [%r19 + 0x0063]
	.word 0xf43561f2  ! 1733: STH_I	sth	%r26, [%r21 + 0x01f2]
	.word 0xf02d21d6  ! 1734: STB_I	stb	%r24, [%r20 + 0x01d6]
	.word 0xb9520000  ! 1736: RDPR_PIL	rdpr	%pil, %r28
	.word 0x8194e149  ! 1738: WRPR_TPC_I	wrpr	%r19, 0x0149, %tpc
	.word 0xf02dc000  ! 1739: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xbc348000  ! 1744: SUBC_R	orn 	%r18, %r0, %r30
	.word 0xf62c0000  ! 1747: STB_R	stb	%r27, [%r16 + %r0]
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e196  ! 1755: WRPR_PSTATE_I	wrpr	%r19, 0x0196, %pstate
	setx	0x20223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 1757: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf035c000  ! 1763: STH_R	sth	%r24, [%r23 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 1766: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf347001  ! 1770: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xfa248000  ! 1771: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf874600c  ! 1772: STX_I	stx	%r28, [%r17 + 0x000c]
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425218a  ! 1780: STW_I	stw	%r26, [%r20 + 0x018a]
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93da001  ! 1783: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xf8344000  ! 1784: STH_R	sth	%r28, [%r17 + %r0]
	.word 0x83942039  ! 1791: WRPR_TNPC_I	wrpr	%r16, 0x0039, %tnpc
	.word 0xfa2dc000  ! 1793: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf02560b2  ! 1794: STW_I	stw	%r24, [%r21 + 0x00b2]
	.word 0xfc2de053  ! 1798: STB_I	stb	%r30, [%r23 + 0x0053]
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xf23c61ef  ! 1806: STD_I	std	%r25, [%r17 + 0x01ef]
	.word 0xf824e0cb  ! 1809: STW_I	stw	%r28, [%r19 + 0x00cb]
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0xfe340000  ! 1812: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf8754000  ! 1819: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf4340000  ! 1825: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfd3c20fa  ! 1826: STDF_I	std	%f30, [0x00fa, %r16]
	.word 0xbd520000  ! 1829: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfa35a1f7  ! 1833: STH_I	sth	%r29, [%r22 + 0x01f7]
	setx	data_start_0, %g1, %r19
	.word 0xf235e008  ! 1838: STH_I	sth	%r25, [%r23 + 0x0008]
	ta	T_CHANGE_HPRIV
	.word 0x81983f13  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f13, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r23
	.word 0xb1510000  ! 1846: RDPR_TICK	rdpr	%tick, %r24
	.word 0xfc24e0be  ! 1850: STW_I	stw	%r30, [%r19 + 0x00be]
	.word 0xfe2ce1a8  ! 1851: STB_I	stb	%r31, [%r19 + 0x01a8]
	.word 0x8194a049  ! 1852: WRPR_TPC_I	wrpr	%r18, 0x0049, %tpc
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c4000  ! 1858: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf93d211b  ! 1863: STDF_I	std	%f28, [0x011b, %r20]
	.word 0xfa3d202c  ! 1864: STD_I	std	%r29, [%r20 + 0x002c]
	.word 0xf22d4000  ! 1865: STB_R	stb	%r25, [%r21 + %r0]
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994600b  ! 1870: WRPR_TICK_I	wrpr	%r17, 0x000b, %tick
	.word 0x8995e0ee  ! 1874: WRPR_TICK_I	wrpr	%r23, 0x00ee, %tick
	.word 0x9194205c  ! 1875: WRPR_PIL_I	wrpr	%r16, 0x005c, %pil
	.word 0xb1510000  ! 1877: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf83de15a  ! 1879: STD_I	std	%r28, [%r23 + 0x015a]
	.word 0xfc7561fb  ! 1881: STX_I	stx	%r30, [%r21 + 0x01fb]
	.word 0xf22d4000  ! 1889: STB_R	stb	%r25, [%r21 + %r0]
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d21f8  ! 1893: STB_I	stb	%r29, [%r20 + 0x01f8]
	.word 0xf6740000  ! 1895: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xba9da07b  ! 1897: XORcc_I	xorcc 	%r22, 0x007b, %r29
	.word 0xf234c000  ! 1903: STH_R	sth	%r25, [%r19 + %r0]
	.word 0x919561e1  ! 1905: WRPR_PIL_I	wrpr	%r21, 0x01e1, %pil
	.word 0xbeb4c000  ! 1914: ORNcc_R	orncc 	%r19, %r0, %r31
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 1916: STX_R	stx	%r27, [%r23 + %r0]
	setx	data_start_7, %g1, %r17
	.word 0xfa2ce1ff  ! 1921: STB_I	stb	%r29, [%r19 + 0x01ff]
	.word 0xbb50c000  ! 1923: RDPR_TT	rdpr	%tt, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb61c21f8  ! 1925: XOR_I	xor 	%r16, 0x01f8, %r27
	.word 0xb3510000  ! 1927: RDPR_TICK	<illegal instruction>
	.word 0x8195e1eb  ! 1928: WRPR_TPC_I	wrpr	%r23, 0x01eb, %tpc
	.word 0x9194611b  ! 1929: WRPR_PIL_I	wrpr	%r17, 0x011b, %pil
	.word 0x839460b9  ! 1930: WRPR_TNPC_I	wrpr	%r17, 0x00b9, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983d43  ! 1935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d43, %hpstate
	setx	data_start_3, %g1, %r19
	.word 0xf0356193  ! 1939: STH_I	sth	%r24, [%r21 + 0x0193]
	.word 0xf02d21b7  ! 1940: STB_I	stb	%r24, [%r20 + 0x01b7]
	.word 0xb1508000  ! 1944: RDPR_TSTATE	rdpr	%tstate, %r24
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa740000  ! 1948: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf4746130  ! 1954: STX_I	stx	%r26, [%r17 + 0x0130]
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 1960: RDPR_TT	rdpr	%tt, %r31
	.word 0xfe340000  ! 1963: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xbb540000  ! 1966: RDPR_GL	<illegal instruction>
	.word 0xf83ce0db  ! 1967: STD_I	std	%r28, [%r19 + 0x00db]
	.word 0xf835207b  ! 1970: STH_I	sth	%r28, [%r20 + 0x007b]
	.word 0xf62de186  ! 1976: STB_I	stb	%r27, [%r23 + 0x0186]
	.word 0xf434a15e  ! 1978: STH_I	sth	%r26, [%r18 + 0x015e]
	.word 0xfe75a14d  ! 1980: STX_I	stx	%r31, [%r22 + 0x014d]
	.word 0x8d9520e2  ! 1983: WRPR_PSTATE_I	wrpr	%r20, 0x00e2, %pstate
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4acc000  ! 1993: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xf0340000  ! 1997: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xba34c000  ! 2000: ORN_R	orn 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xfe350000  ! 2003: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf8754000  ! 2006: STX_R	stx	%r28, [%r21 + %r0]
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d8000  ! 2013: STD_R	std	%r27, [%r22 + %r0]
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb4c000  ! 2021: ORNcc_R	orncc 	%r19, %r0, %r31
	.word 0xf33c0000  ! 2022: STDF_R	std	%f25, [%r0, %r16]
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3ca0c2  ! 2025: STDF_I	std	%f31, [0x00c2, %r18]
	.word 0x899521c8  ! 2027: WRPR_TICK_I	wrpr	%r20, 0x01c8, %tick
	.word 0xbf510000  ! 2037: RDPR_TICK	rdpr	%tick, %r31
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2040: RDPR_TPC	<illegal instruction>
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf27521d3  ! 2044: STX_I	stx	%r25, [%r20 + 0x01d3]
	mov	1, %r14
	.word 0xa193a000  ! 2046: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf93de0b9  ! 2049: STDF_I	std	%f28, [0x00b9, %r23]
	.word 0xf8244000  ! 2050: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf075e00f  ! 2051: STX_I	stx	%r24, [%r23 + 0x000f]
	.word 0xf23d0000  ! 2054: STD_R	std	%r25, [%r20 + %r0]
	.word 0xba354000  ! 2056: SUBC_R	orn 	%r21, %r0, %r29
	.word 0xf22d4000  ! 2057: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xb1540000  ! 2058: RDPR_GL	rdpr	%-, %r24
	setx	data_start_2, %g1, %r19
	.word 0xf42ce0dc  ! 2061: STB_I	stb	%r26, [%r19 + 0x00dc]
	.word 0xf42c604b  ! 2062: STB_I	stb	%r26, [%r17 + 0x004b]
	.word 0xb6348000  ! 2072: SUBC_R	orn 	%r18, %r0, %r27
	setx	data_start_4, %g1, %r21
	.word 0xb3510000  ! 2079: RDPR_TICK	<illegal instruction>
	.word 0xff3d8000  ! 2080: STDF_R	std	%f31, [%r0, %r22]
	.word 0xbf520000  ! 2081: RDPR_PIL	<illegal instruction>
	.word 0xf73dc000  ! 2082: STDF_R	std	%f27, [%r0, %r23]
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	.word 0x8994e0c3  ! 2091: WRPR_TICK_I	wrpr	%r19, 0x00c3, %tick
	.word 0xf075214f  ! 2093: STX_I	stx	%r24, [%r20 + 0x014f]
	.word 0xfe748000  ! 2094: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf6240000  ! 2095: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xb7504000  ! 2098: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xff3c0000  ! 2100: STDF_R	std	%f31, [%r0, %r16]
	.word 0xbead20cc  ! 2103: ANDNcc_I	andncc 	%r20, 0x00cc, %r31
	.word 0xfe34c000  ! 2104: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfa2c2188  ! 2107: STB_I	stb	%r29, [%r16 + 0x0188]
	.word 0xf02d0000  ! 2110: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xbd51c000  ! 2116: RDPR_TL	rdpr	%tl, %r30
	.word 0xf63c4000  ! 2117: STD_R	std	%r27, [%r17 + %r0]
	.word 0xb40da06b  ! 2118: AND_I	and 	%r22, 0x006b, %r26
	.word 0xb1520000  ! 2123: RDPR_PIL	<illegal instruction>
	.word 0xf73da0f2  ! 2127: STDF_I	std	%f27, [0x00f2, %r22]
	.word 0xf13dc000  ! 2128: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf2750000  ! 2130: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfa348000  ! 2131: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf0758000  ! 2133: STX_R	stx	%r24, [%r22 + %r0]
	.word 0x819461a1  ! 2136: WRPR_TPC_I	wrpr	%r17, 0x01a1, %tpc
	.word 0xf4254000  ! 2137: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf22de113  ! 2141: STB_I	stb	%r25, [%r23 + 0x0113]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13d60b3  ! 2145: STDF_I	std	%f24, [0x00b3, %r21]
	.word 0xf0356022  ! 2148: STH_I	sth	%r24, [%r21 + 0x0022]
	.word 0xb3518000  ! 2150: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0x8994612e  ! 2151: WRPR_TICK_I	wrpr	%r17, 0x012e, %tick
	.word 0xf33d4000  ! 2152: STDF_R	std	%f25, [%r0, %r21]
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43ca1ec  ! 2155: STD_I	std	%r26, [%r18 + 0x01ec]
	.word 0xbd35f001  ! 2157: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xbb500000  ! 2158: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf03ca127  ! 2162: STD_I	std	%r24, [%r18 + 0x0127]
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 2168: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf024e164  ! 2169: STW_I	stw	%r24, [%r19 + 0x0164]
	.word 0x9194a178  ! 2173: WRPR_PIL_I	wrpr	%r18, 0x0178, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3c206f  ! 2182: STD_I	std	%r31, [%r16 + 0x006f]
	.word 0xf53c8000  ! 2183: STDF_R	std	%f26, [%r0, %r18]
	.word 0x859461ef  ! 2186: WRPR_TSTATE_I	wrpr	%r17, 0x01ef, %tstate
	setx	data_start_3, %g1, %r22
	.word 0xf875a1cf  ! 2190: STX_I	stx	%r28, [%r22 + 0x01cf]
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2193: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0742185  ! 2194: STX_I	stx	%r24, [%r16 + 0x0185]
	.word 0xfe758000  ! 2195: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xbb518000  ! 2196: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	0x10329, %g1, %o0
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
	.word 0x8194a1ec  ! 2200: WRPR_TPC_I	wrpr	%r18, 0x01ec, %tpc
	.word 0xb08da1ce  ! 2201: ANDcc_I	andcc 	%r22, 0x01ce, %r24
	.word 0xf33d208d  ! 2208: STDF_I	std	%f25, [0x008d, %r20]
	.word 0xbd518000  ! 2209: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xbc3ca146  ! 2211: XNOR_I	xnor 	%r18, 0x0146, %r30
	.word 0xb42c8000  ! 2213: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xf0744000  ! 2215: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xbb2db001  ! 2216: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0x8795a0cf  ! 2217: WRPR_TT_I	wrpr	%r22, 0x00cf, %tt
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 2219: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xbf643801  ! 2220: MOVcc_I	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839421c4  ! 2228: WRPR_TNPC_I	wrpr	%r16, 0x01c4, %tnpc
	.word 0xfa3c21fd  ! 2229: STD_I	std	%r29, [%r16 + 0x01fd]
	.word 0xf02ca135  ! 2230: STB_I	stb	%r24, [%r18 + 0x0135]
	.word 0xbb500000  ! 2239: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf83c6046  ! 2240: STD_I	std	%r28, [%r17 + 0x0046]
	.word 0xb1510000  ! 2241: RDPR_TICK	<illegal instruction>
	.word 0xfc2d60a9  ! 2250: STB_I	stb	%r30, [%r21 + 0x00a9]
	.word 0xb1540000  ! 2251: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d53  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d53, %hpstate
	.word 0xb815203c  ! 2255: OR_I	or 	%r20, 0x003c, %r28
	.word 0xbeb40000  ! 2264: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0xfd3d4000  ! 2266: STDF_R	std	%f30, [%r0, %r21]
	.word 0x8795e1d4  ! 2267: WRPR_TT_I	wrpr	%r23, 0x01d4, %tt
	.word 0x9194e103  ! 2272: WRPR_PIL_I	wrpr	%r19, 0x0103, %pil
	.word 0xbc344000  ! 2273: ORN_R	orn 	%r17, %r0, %r30
	.word 0xfc3ce186  ! 2274: STD_I	std	%r30, [%r19 + 0x0186]
	mov	1, %r12
	.word 0x8f932000  ! 2278: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf02dc000  ! 2282: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb9357001  ! 2285: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0x859421ea  ! 2287: WRPR_TSTATE_I	wrpr	%r16, 0x01ea, %tstate
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88da18e  ! 2290: ANDcc_I	andcc 	%r22, 0x018e, %r28
	.word 0xf4350000  ! 2292: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xb3643801  ! 2294: MOVcc_I	<illegal instruction>
	.word 0xfd3d0000  ! 2302: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf62ce08f  ! 2303: STB_I	stb	%r27, [%r19 + 0x008f]
	.word 0xf27561ce  ! 2305: STX_I	stx	%r25, [%r21 + 0x01ce]
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe252119  ! 2312: SUB_I	sub 	%r20, 0x0119, %r31
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 2315: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xff3ca0be  ! 2317: STDF_I	std	%f31, [0x00be, %r18]
	.word 0xf02dc000  ! 2318: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf0358000  ! 2321: STH_R	sth	%r24, [%r22 + %r0]
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942110  ! 2327: WRPR_TT_I	wrpr	%r16, 0x0110, %tt
	.word 0xb41c2113  ! 2331: XOR_I	xor 	%r16, 0x0113, %r26
	.word 0xfa75c000  ! 2332: STX_R	stx	%r29, [%r23 + %r0]
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xff3c0000  ! 2338: STDF_R	std	%f31, [%r0, %r16]
	.word 0xf625c000  ! 2340: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf73d60a3  ! 2345: STDF_I	std	%f27, [0x00a3, %r21]
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba1d20fb  ! 2348: XOR_I	xor 	%r20, 0x00fb, %r29
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982881  ! 2356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0881, %hpstate
	setx	data_start_4, %g1, %r18
	mov	0, %r14
	.word 0xa193a000  ! 2359: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6752033  ! 2361: STX_I	stx	%r27, [%r20 + 0x0033]
	.word 0xfc35c000  ! 2365: STH_R	sth	%r30, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1510000  ! 2372: RDPR_TICK	rdpr	%tick, %r24
	.word 0xfd3c612e  ! 2373: STDF_I	std	%f30, [0x012e, %r17]
	.word 0x8995a147  ! 2375: WRPR_TICK_I	wrpr	%r22, 0x0147, %tick
	.word 0x87956160  ! 2379: WRPR_TT_I	wrpr	%r21, 0x0160, %tt
	.word 0x9194e18c  ! 2380: WRPR_PIL_I	wrpr	%r19, 0x018c, %pil
	.word 0xb61c605c  ! 2381: XOR_I	xor 	%r17, 0x005c, %r27
	.word 0xf63d21c3  ! 2385: STD_I	std	%r27, [%r20 + 0x01c3]
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 2387: STB_R	stb	%r27, [%r20 + %r0]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc344000  ! 2396: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xb8acc000  ! 2411: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xf22de15f  ! 2413: STB_I	stb	%r25, [%r23 + 0x015f]
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879520e8  ! 2417: WRPR_TT_I	wrpr	%r20, 0x00e8, %tt
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb13c1000  ! 2421: SRAX_R	srax	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983c5b  ! 2423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5b, %hpstate
	.word 0xfc2c2146  ! 2425: STB_I	stb	%r30, [%r16 + 0x0146]
	.word 0xbd540000  ! 2426: RDPR_GL	rdpr	%-, %r30
	.word 0x8194203b  ! 2427: WRPR_TPC_I	wrpr	%r16, 0x003b, %tpc
	.word 0xf82dc000  ! 2428: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf03da0f7  ! 2431: STD_I	std	%r24, [%r22 + 0x00f7]
	.word 0xf03de0e7  ! 2432: STD_I	std	%r24, [%r23 + 0x00e7]
	.word 0xfc2d0000  ! 2433: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf82c8000  ! 2434: STB_R	stb	%r28, [%r18 + %r0]
	.word 0x8795208f  ! 2436: WRPR_TT_I	wrpr	%r20, 0x008f, %tt
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2439: RDPR_GL	rdpr	%-, %r30
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe358000  ! 2446: SUBC_R	orn 	%r22, %r0, %r31
	.word 0xfa3da1f2  ! 2447: STD_I	std	%r29, [%r22 + 0x01f2]
	.word 0xf825e12b  ! 2450: STW_I	stw	%r28, [%r23 + 0x012b]
	.word 0xf03de07c  ! 2451: STD_I	std	%r24, [%r23 + 0x007c]
	.word 0xf234205a  ! 2452: STH_I	sth	%r25, [%r16 + 0x005a]
	.word 0xfb3c61ba  ! 2454: STDF_I	std	%f29, [0x01ba, %r17]
	.word 0xf675218d  ! 2456: STX_I	stx	%r27, [%r20 + 0x018d]
	.word 0xf73c0000  ! 2458: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb8b58000  ! 2459: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xb5520000  ! 2460: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf475e0b1  ! 2466: STX_I	stx	%r26, [%r23 + 0x00b1]
	.word 0xba9c8000  ! 2467: XORcc_R	xorcc 	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x819838cb  ! 2476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18cb, %hpstate
	.word 0xf074e099  ! 2480: STX_I	stx	%r24, [%r19 + 0x0099]
	.word 0xf53da07a  ! 2484: STDF_I	std	%f26, [0x007a, %r22]
	.word 0xfe35a004  ! 2485: STH_I	sth	%r31, [%r22 + 0x0004]
	.word 0xbe9ce07f  ! 2490: XORcc_I	xorcc 	%r19, 0x007f, %r31
	.word 0xf83c8000  ! 2500: STD_R	std	%r28, [%r18 + %r0]
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 2506: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfc244000  ! 2508: STW_R	stw	%r30, [%r17 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 2513: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa2d219f  ! 2514: STB_I	stb	%r29, [%r20 + 0x019f]
	.word 0xb0848000  ! 2516: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xfc3d61c0  ! 2522: STD_I	std	%r30, [%r21 + 0x01c0]
	.word 0xf43461d2  ! 2524: STH_I	sth	%r26, [%r17 + 0x01d2]
	mov	2, %r14
	.word 0xa193a000  ! 2525: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc742099  ! 2527: STX_I	stx	%r30, [%r16 + 0x0099]
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42da190  ! 2531: STB_I	stb	%r26, [%r22 + 0x0190]
	.word 0xf6348000  ! 2532: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf93c4000  ! 2537: STDF_R	std	%f28, [%r0, %r17]
	.word 0xfe2ce026  ! 2539: STB_I	stb	%r31, [%r19 + 0x0026]
	.word 0xb9500000  ! 2543: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfc35c000  ! 2544: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xfe340000  ! 2545: STH_R	sth	%r31, [%r16 + %r0]
	setx	data_start_3, %g1, %r17
	.word 0xb42ce0f1  ! 2549: ANDN_I	andn 	%r19, 0x00f1, %r26
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2ce156  ! 2553: STB_I	stb	%r29, [%r19 + 0x0156]
	.word 0xb1500000  ! 2560: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2563: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb614210d  ! 2567: OR_I	or 	%r16, 0x010d, %r27
	.word 0xb5510000  ! 2569: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfb3da1eb  ! 2570: STDF_I	std	%f29, [0x01eb, %r22]
	.word 0xf02dc000  ! 2573: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb750c000  ! 2576: RDPR_TT	<illegal instruction>
	.word 0xf43d0000  ! 2580: STD_R	std	%r26, [%r20 + %r0]
	.word 0xfc25c000  ! 2588: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfd3c4000  ! 2589: STDF_R	std	%f30, [%r0, %r17]
	.word 0xb9480000  ! 2592: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	data_start_4, %g1, %r21
	.word 0xf53c8000  ! 2596: STDF_R	std	%f26, [%r0, %r18]
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 2601: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xfa74a124  ! 2602: STX_I	stx	%r29, [%r18 + 0x0124]
	.word 0xb08c0000  ! 2604: ANDcc_R	andcc 	%r16, %r0, %r24
	.word 0xb844c000  ! 2605: ADDC_R	addc 	%r19, %r0, %r28
	mov	0, %r12
	.word 0x8f932000  ! 2607: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf63d4000  ! 2608: STD_R	std	%r27, [%r21 + %r0]
	.word 0xf43dc000  ! 2610: STD_R	std	%r26, [%r23 + %r0]
	.word 0xbc0da152  ! 2612: AND_I	and 	%r22, 0x0152, %r30
	.word 0x8d9421de  ! 2614: WRPR_PSTATE_I	wrpr	%r16, 0x01de, %pstate
	.word 0xb494c000  ! 2615: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xb3359000  ! 2616: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xf02d4000  ! 2626: STB_R	stb	%r24, [%r21 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0xf82cc000  ! 2630: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x8595a027  ! 2633: WRPR_TSTATE_I	wrpr	%r22, 0x0027, %tstate
	.word 0xf13da1d6  ! 2636: STDF_I	std	%f24, [0x01d6, %r22]
	.word 0xbd518000  ! 2637: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xbf3d0000  ! 2638: SRA_R	sra 	%r20, %r0, %r31
	.word 0xff3c8000  ! 2639: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf22c2005  ! 2640: STB_I	stb	%r25, [%r16 + 0x0005]
	.word 0xbf341000  ! 2641: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xfd3c8000  ! 2646: STDF_R	std	%f30, [%r0, %r18]
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0248000  ! 2648: STW_R	stw	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 2651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xf67521d6  ! 2655: STX_I	stx	%r27, [%r20 + 0x01d6]
	.word 0xbb500000  ! 2656: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf33dc000  ! 2668: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf025608f  ! 2677: STW_I	stw	%r24, [%r21 + 0x008f]
	.word 0xf63d4000  ! 2678: STD_R	std	%r27, [%r21 + %r0]
	.word 0xf22ca1d2  ! 2679: STB_I	stb	%r25, [%r18 + 0x01d2]
	.word 0xfd3c4000  ! 2680: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfc74e146  ! 2684: STX_I	stx	%r30, [%r19 + 0x0146]
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8958000  ! 2695: ORcc_R	orcc 	%r22, %r0, %r28
	.word 0xbebd8000  ! 2700: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xf074c000  ! 2701: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf875214b  ! 2705: STX_I	stx	%r28, [%r20 + 0x014b]
	ta	T_CHANGE_HPRIV
	.word 0x81983fdb  ! 2708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fdb, %hpstate
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3dc000  ! 2713: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0x8395e11f  ! 2714: WRPR_TNPC_I	wrpr	%r23, 0x011f, %tnpc
	.word 0xb42c6095  ! 2715: ANDN_I	andn 	%r17, 0x0095, %r26
	.word 0xfa2c20b0  ! 2716: STB_I	stb	%r29, [%r16 + 0x00b0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0xf4240000  ! 2718: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfc34c000  ! 2721: STH_R	sth	%r30, [%r19 + %r0]
	.word 0x85956153  ! 2722: WRPR_TSTATE_I	wrpr	%r21, 0x0153, %tstate
	setx	data_start_7, %g1, %r23
	.word 0xfa356047  ! 2724: STH_I	sth	%r29, [%r21 + 0x0047]
	.word 0xb0144000  ! 2725: OR_R	or 	%r17, %r0, %r24
	.word 0xf83dc000  ! 2727: STD_R	std	%r28, [%r23 + %r0]
	.word 0xf93c0000  ! 2730: STDF_R	std	%f28, [%r0, %r16]
	mov	0, %r14
	.word 0xa193a000  ! 2731: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8594e0f8  ! 2732: WRPR_TSTATE_I	wrpr	%r19, 0x00f8, %tstate
	.word 0xf4244000  ! 2733: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfe3521fc  ! 2734: STH_I	sth	%r31, [%r20 + 0x01fc]
	.word 0x8595608a  ! 2745: WRPR_TSTATE_I	wrpr	%r21, 0x008a, %tstate
	.word 0xb08c8000  ! 2746: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xfa750000  ! 2748: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf42c8000  ! 2749: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfe35e0ff  ! 2752: STH_I	sth	%r31, [%r23 + 0x00ff]
	.word 0x85942067  ! 2756: WRPR_TSTATE_I	wrpr	%r16, 0x0067, %tstate
	.word 0xb7504000  ! 2757: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfc75c000  ! 2763: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf6344000  ! 2766: STH_R	sth	%r27, [%r17 + %r0]
	.word 0x859560a0  ! 2767: WRPR_TSTATE_I	wrpr	%r21, 0x00a0, %tstate
	.word 0xf0754000  ! 2770: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xb21c0000  ! 2771: XOR_R	xor 	%r16, %r0, %r25
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0746059  ! 2775: STX_I	stx	%r24, [%r17 + 0x0059]
	ta	T_CHANGE_HPRIV
	.word 0x81982c5b  ! 2776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0xf43c8000  ! 2779: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf0356114  ! 2782: STH_I	sth	%r24, [%r21 + 0x0114]
	.word 0xf42d4000  ! 2783: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xf0752119  ! 2785: STX_I	stx	%r24, [%r20 + 0x0119]
	.word 0x859421e8  ! 2786: WRPR_TSTATE_I	wrpr	%r16, 0x01e8, %tstate
	.word 0xfc35a098  ! 2790: STH_I	sth	%r30, [%r22 + 0x0098]
	.word 0xf424e1a1  ! 2792: STW_I	stw	%r26, [%r19 + 0x01a1]
	.word 0xf02d6085  ! 2793: STB_I	stb	%r24, [%r21 + 0x0085]
	.word 0xfc35e161  ! 2797: STH_I	sth	%r30, [%r23 + 0x0161]
	.word 0xfa24c000  ! 2800: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xbb520000  ! 2801: RDPR_PIL	rdpr	%pil, %r29
	.word 0xfa2da138  ! 2804: STB_I	stb	%r29, [%r22 + 0x0138]
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60c218a  ! 2810: AND_I	and 	%r16, 0x018a, %r27
	.word 0xbd518000  ! 2811: RDPR_PSTATE	<illegal instruction>
	.word 0xf22d601f  ! 2812: STB_I	stb	%r25, [%r21 + 0x001f]
	.word 0x8595e019  ! 2813: WRPR_TSTATE_I	wrpr	%r23, 0x0019, %tstate
	.word 0x8795e16a  ! 2814: WRPR_TT_I	wrpr	%r23, 0x016a, %tt
	.word 0xbf504000  ! 2817: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xff3cc000  ! 2819: STDF_R	std	%f31, [%r0, %r19]
	.word 0xbaa4e09a  ! 2822: SUBcc_I	subcc 	%r19, 0x009a, %r29
	.word 0xf13c0000  ! 2823: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf33d21dd  ! 2824: STDF_I	std	%f25, [0x01dd, %r20]
	setx	data_start_0, %g1, %r16
	.word 0xf6346162  ! 2830: STH_I	sth	%r27, [%r17 + 0x0162]
	.word 0x8595e0e6  ! 2832: WRPR_TSTATE_I	wrpr	%r23, 0x00e6, %tstate
	.word 0xf22421bc  ! 2834: STW_I	stw	%r25, [%r16 + 0x01bc]
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb62d209d  ! 2836: ANDN_I	andn 	%r20, 0x009d, %r27
	.word 0xfc3dc000  ! 2837: STD_R	std	%r30, [%r23 + %r0]
	.word 0xfa3c8000  ! 2839: STD_R	std	%r29, [%r18 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6154000  ! 2842: OR_R	or 	%r21, %r0, %r27
	.word 0xf43d0000  ! 2844: STD_R	std	%r26, [%r20 + %r0]
	.word 0xba8c2129  ! 2848: ANDcc_I	andcc 	%r16, 0x0129, %r29
	.word 0xfd3d615b  ! 2849: STDF_I	std	%f30, [0x015b, %r21]
	.word 0xf63d0000  ! 2850: STD_R	std	%r27, [%r20 + %r0]
	.word 0x85946021  ! 2851: WRPR_TSTATE_I	wrpr	%r17, 0x0021, %tstate
	.word 0xf0354000  ! 2853: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfe358000  ! 2855: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf43d8000  ! 2859: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf42d0000  ! 2861: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xbab461bd  ! 2862: SUBCcc_I	orncc 	%r17, 0x01bd, %r29
	.word 0xf224c000  ! 2865: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf0746120  ! 2867: STX_I	stx	%r24, [%r17 + 0x0120]
	.word 0xb6458000  ! 2869: ADDC_R	addc 	%r22, %r0, %r27
	.word 0x8994e049  ! 2871: WRPR_TICK_I	wrpr	%r19, 0x0049, %tick
	.word 0xb9518000  ! 2873: RDPR_PSTATE	rdpr	%pstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 2874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	setx	data_start_2, %g1, %r19
	.word 0xf4240000  ! 2879: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf23ca1f6  ! 2882: STD_I	std	%r25, [%r18 + 0x01f6]
	.word 0xfd3d0000  ! 2883: STDF_R	std	%f30, [%r0, %r20]
	.word 0xff3c8000  ! 2888: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf625e11b  ! 2891: STW_I	stw	%r27, [%r23 + 0x011b]
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca053  ! 2894: STB_I	stb	%r31, [%r18 + 0x0053]
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 2902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xbf520000  ! 2903: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf82d4000  ! 2910: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xb3643801  ! 2914: MOVcc_I	<illegal instruction>
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395603d  ! 2916: WRPR_TNPC_I	wrpr	%r21, 0x003d, %tnpc
	.word 0xf62d20c8  ! 2918: STB_I	stb	%r27, [%r20 + 0x00c8]
	.word 0xf635e132  ! 2919: STH_I	sth	%r27, [%r23 + 0x0132]
	.word 0xf43d4000  ! 2925: STD_R	std	%r26, [%r21 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0xf2244000  ! 2930: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xfb3da113  ! 2932: STDF_I	std	%f29, [0x0113, %r22]
	.word 0xfa34a046  ! 2934: STH_I	sth	%r29, [%r18 + 0x0046]
	.word 0xb285c000  ! 2935: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xb8c521bb  ! 2937: ADDCcc_I	addccc 	%r20, 0x01bb, %r28
	.word 0xfa252167  ! 2939: STW_I	stw	%r29, [%r20 + 0x0167]
	.word 0x87946020  ! 2940: WRPR_TT_I	wrpr	%r17, 0x0020, %tt
	.word 0xfc3c0000  ! 2944: STD_R	std	%r30, [%r16 + %r0]
	.word 0x8394e023  ! 2945: WRPR_TNPC_I	wrpr	%r19, 0x0023, %tnpc
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395615a  ! 2948: WRPR_TNPC_I	wrpr	%r21, 0x015a, %tnpc
	.word 0xfa358000  ! 2953: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xbb480000  ! 2957: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xf22c0000  ! 2959: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xbe1d4000  ! 2960: XOR_R	xor 	%r21, %r0, %r31
	.word 0xfc358000  ! 2964: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf03420e4  ! 2969: STH_I	sth	%r24, [%r16 + 0x00e4]
	.word 0xf03d612a  ! 2970: STD_I	std	%r24, [%r21 + 0x012a]
	.word 0xfe3ce17f  ! 2972: STD_I	std	%r31, [%r19 + 0x017f]
	.word 0xb5510000  ! 2976: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf4342189  ! 2977: STH_I	sth	%r26, [%r16 + 0x0189]
	.word 0x8194a0b8  ! 2978: WRPR_TPC_I	wrpr	%r18, 0x00b8, %tpc
	.word 0xf13c61d2  ! 2979: STDF_I	std	%f24, [0x01d2, %r17]
	.word 0xf6254000  ! 2980: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xbebda1e5  ! 2981: XNORcc_I	xnorcc 	%r22, 0x01e5, %r31
	.word 0x8395e098  ! 2982: WRPR_TNPC_I	wrpr	%r23, 0x0098, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982e19  ! 2985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xf024a024  ! 2986: STW_I	stw	%r24, [%r18 + 0x0024]
	.word 0xf224a056  ! 2991: STW_I	stw	%r25, [%r18 + 0x0056]
	.word 0xfa2dc000  ! 2993: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xb7504000  ! 2997: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf8748000  ! 3001: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb9353001  ! 3005: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xf22c60b0  ! 3007: STB_I	stb	%r25, [%r17 + 0x00b0]
	setx	data_start_2, %g1, %r20
	.word 0xfe344000  ! 3011: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf6350000  ! 3013: STH_R	sth	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf474c000  ! 3015: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfe25a172  ! 3017: STW_I	stw	%r31, [%r22 + 0x0172]
	.word 0xb5540000  ! 3018: RDPR_GL	<illegal instruction>
	.word 0xf62460a2  ! 3019: STW_I	stw	%r27, [%r17 + 0x00a2]
	.word 0xf23ce013  ! 3020: STD_I	std	%r25, [%r19 + 0x0013]
	.word 0xbf518000  ! 3024: RDPR_PSTATE	<illegal instruction>
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0b4e0b1  ! 3037: ORNcc_I	orncc 	%r19, 0x00b1, %r24
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4742069  ! 3039: STX_I	stx	%r26, [%r16 + 0x0069]
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 3040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	.word 0xb6b54000  ! 3041: ORNcc_R	orncc 	%r21, %r0, %r27
	setx	0x20335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c615a  ! 3043: STDF_I	std	%f31, [0x015a, %r17]
	.word 0xb951c000  ! 3046: RDPR_TL	rdpr	%tl, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0xb3540000  ! 3049: RDPR_GL	rdpr	%-, %r25
	.word 0xbc0c0000  ! 3050: AND_R	and 	%r16, %r0, %r30
	.word 0xff3c4000  ! 3051: STDF_R	std	%f31, [%r0, %r17]
	setx	data_start_0, %g1, %r22
	.word 0xf2758000  ! 3055: STX_R	stx	%r25, [%r22 + %r0]
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 3058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xfa748000  ! 3060: STX_R	stx	%r29, [%r18 + %r0]
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235e1f8  ! 3064: STH_I	sth	%r25, [%r23 + 0x01f8]
	.word 0xb93d5000  ! 3066: SRAX_R	srax	%r21, %r0, %r28
	.word 0xf22c2095  ! 3068: STB_I	stb	%r25, [%r16 + 0x0095]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0946057  ! 3077: ORcc_I	orcc 	%r17, 0x0057, %r24
	.word 0xfe35a0ea  ! 3083: STH_I	sth	%r31, [%r22 + 0x00ea]
	.word 0xf22d2085  ! 3085: STB_I	stb	%r25, [%r20 + 0x0085]
	.word 0xfa354000  ! 3086: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb550c000  ! 3087: RDPR_TT	rdpr	%tt, %r26
	.word 0x8395a199  ! 3088: WRPR_TNPC_I	wrpr	%r22, 0x0199, %tnpc
	mov	1, %r12
	.word 0x8f932000  ! 3090: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 3091: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfe340000  ! 3092: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xbf504000  ! 3095: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 3097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	.word 0xf42dc000  ! 3102: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbf540000  ! 3107: RDPR_GL	rdpr	%-, %r31
	.word 0xf4244000  ! 3111: STW_R	stw	%r26, [%r17 + %r0]
	setx	data_start_1, %g1, %r16
	.word 0xf62d2057  ! 3115: STB_I	stb	%r27, [%r20 + 0x0057]
	.word 0xfe74618f  ! 3116: STX_I	stx	%r31, [%r17 + 0x018f]
	.word 0xb2bdc000  ! 3119: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xfc2d2126  ! 3121: STB_I	stb	%r30, [%r20 + 0x0126]
	.word 0xf8756125  ! 3123: STX_I	stx	%r28, [%r21 + 0x0125]
	.word 0xf93c8000  ! 3124: STDF_R	std	%f28, [%r0, %r18]
	setx	data_start_3, %g1, %r16
	mov	0, %r12
	.word 0x8f932000  ! 3127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf540000  ! 3129: RDPR_GL	rdpr	%-, %r31
	.word 0xb9504000  ! 3132: RDPR_TNPC	<illegal instruction>
	.word 0xb4b58000  ! 3134: ORNcc_R	orncc 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x819838cb  ! 3136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18cb, %hpstate
	.word 0xf33dc000  ! 3137: STDF_R	std	%f25, [%r0, %r23]
	setx	0x20029, %g1, %o0
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
	.word 0xb1520000  ! 3143: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfc34e115  ! 3147: STH_I	sth	%r30, [%r19 + 0x0115]
	.word 0xf624c000  ! 3149: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfc758000  ! 3152: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfe35a010  ! 3153: STH_I	sth	%r31, [%r22 + 0x0010]
	.word 0xfc2ce103  ! 3154: STB_I	stb	%r30, [%r19 + 0x0103]
	.word 0xb835e1de  ! 3155: ORN_I	orn 	%r23, 0x01de, %r28
	.word 0xff3cc000  ! 3156: STDF_R	std	%f31, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf675c000  ! 3159: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xb7510000  ! 3162: RDPR_TICK	<illegal instruction>
	.word 0xbf480000  ! 3163: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbe344000  ! 3164: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xb5540000  ! 3169: RDPR_GL	<illegal instruction>
	.word 0xb0142177  ! 3176: OR_I	or 	%r16, 0x0177, %r24
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3cc000  ! 3181: STDF_R	std	%f30, [%r0, %r19]
	.word 0xfe25c000  ! 3182: STW_R	stw	%r31, [%r23 + %r0]
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d6153  ! 3189: STB_I	stb	%r30, [%r21 + 0x0153]
	.word 0xfa340000  ! 3190: STH_R	sth	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f19  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f19, %hpstate
	.word 0xf625c000  ! 3197: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf27461dc  ! 3199: STX_I	stx	%r25, [%r17 + 0x01dc]
	.word 0xfe748000  ! 3200: STX_R	stx	%r31, [%r18 + %r0]
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43ca1c1  ! 3203: XNOR_I	xnor 	%r18, 0x01c1, %r26
	.word 0xf6750000  ! 3207: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf434c000  ! 3208: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb351c000  ! 3210: RDPR_TL	rdpr	%tl, %r25
	.word 0xfb3d21bc  ! 3212: STDF_I	std	%f29, [0x01bc, %r20]
	.word 0xb234e044  ! 3214: ORN_I	orn 	%r19, 0x0044, %r25
	.word 0xf835a1bb  ! 3216: STH_I	sth	%r28, [%r22 + 0x01bb]
	.word 0xb29c0000  ! 3218: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0xfc3c4000  ! 3220: STD_R	std	%r30, [%r17 + %r0]
	.word 0x8d95a1f6  ! 3221: WRPR_PSTATE_I	wrpr	%r22, 0x01f6, %pstate
	.word 0xf22cc000  ! 3223: STB_R	stb	%r25, [%r19 + %r0]
	setx	data_start_0, %g1, %r18
	.word 0xf23ce1f2  ! 3230: STD_I	std	%r25, [%r19 + 0x01f2]
	.word 0x8d942069  ! 3231: WRPR_PSTATE_I	wrpr	%r16, 0x0069, %pstate
	.word 0xfc244000  ! 3232: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 3234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0xfa2c4000  ! 3236: STB_R	stb	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe240000  ! 3240: STW_R	stw	%r31, [%r16 + %r0]
	.word 0x859561d3  ! 3241: WRPR_TSTATE_I	wrpr	%r21, 0x01d3, %tstate
	.word 0xfe740000  ! 3243: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfc2d4000  ! 3244: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xff3d21e2  ! 3251: STDF_I	std	%f31, [0x01e2, %r20]
	.word 0xbb504000  ! 3252: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb32db001  ! 3254: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xb0acc000  ! 3262: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xf4256187  ! 3267: STW_I	stw	%r26, [%r21 + 0x0187]
	.word 0xf33d4000  ! 3268: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb1520000  ! 3273: RDPR_PIL	<illegal instruction>
	.word 0xb7510000  ! 3277: RDPR_TICK	<illegal instruction>
	.word 0xbd540000  ! 3279: RDPR_GL	<illegal instruction>
	.word 0xbcb44000  ! 3280: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0xf62dc000  ! 3281: STB_R	stb	%r27, [%r23 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 3282: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe3ce10c  ! 3285: STD_I	std	%r31, [%r19 + 0x010c]
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952086  ! 3287: WRPR_TICK_I	wrpr	%r20, 0x0086, %tick
	.word 0xbc15e093  ! 3288: OR_I	or 	%r23, 0x0093, %r30
	.word 0xf834e041  ! 3292: STH_I	sth	%r28, [%r19 + 0x0041]
	.word 0xb37c2401  ! 3299: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xb1518000  ! 3302: RDPR_PSTATE	rdpr	%pstate, %r24
	mov	1, %r14
	.word 0xa193a000  ! 3303: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 3305: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf82c0000  ! 3308: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf82ca04b  ! 3310: STB_I	stb	%r28, [%r18 + 0x004b]
	.word 0xb425c000  ! 3311: SUB_R	sub 	%r23, %r0, %r26
	.word 0xba8ce118  ! 3319: ANDcc_I	andcc 	%r19, 0x0118, %r29
	.word 0xf6744000  ! 3320: STX_R	stx	%r27, [%r17 + %r0]
	.word 0x8395a178  ! 3326: WRPR_TNPC_I	wrpr	%r22, 0x0178, %tnpc
	.word 0x8994a15c  ! 3328: WRPR_TICK_I	wrpr	%r18, 0x015c, %tick
	.word 0xfe740000  ! 3329: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfa748000  ! 3332: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf4248000  ! 3335: STW_R	stw	%r26, [%r18 + %r0]
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 3338: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb4254000  ! 3339: SUB_R	sub 	%r21, %r0, %r26
	.word 0xf63ce069  ! 3342: STD_I	std	%r27, [%r19 + 0x0069]
	setx	data_start_1, %g1, %r23
	.word 0x8794e18f  ! 3344: WRPR_TT_I	wrpr	%r19, 0x018f, %tt
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63d0000  ! 3355: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0xb1500000  ! 3356: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf4354000  ! 3359: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf13de1e2  ! 3361: STDF_I	std	%f24, [0x01e2, %r23]
	.word 0x8d94a0ed  ! 3363: WRPR_PSTATE_I	wrpr	%r18, 0x00ed, %pstate
	.word 0xfd3ca144  ! 3364: STDF_I	std	%f30, [0x0144, %r18]
	.word 0xf73c4000  ! 3365: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb0c54000  ! 3368: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0x819561b2  ! 3372: WRPR_TPC_I	wrpr	%r21, 0x01b2, %tpc
	.word 0xfc758000  ! 3375: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf0258000  ! 3377: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfc254000  ! 3378: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf63d8000  ! 3380: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf33c605f  ! 3384: STDF_I	std	%f25, [0x005f, %r17]
	.word 0xf53cc000  ! 3386: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf82cc000  ! 3389: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xbd510000  ! 3391: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf33d4000  ! 3393: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb6352120  ! 3394: SUBC_I	orn 	%r20, 0x0120, %r27
	.word 0xb9508000  ! 3398: RDPR_TSTATE	<illegal instruction>
	.word 0x8795619a  ! 3402: WRPR_TT_I	wrpr	%r21, 0x019a, %tt
	.word 0xfa750000  ! 3403: STX_R	stx	%r29, [%r20 + %r0]
	setx	data_start_2, %g1, %r20
	.word 0x8d94611d  ! 3407: WRPR_PSTATE_I	wrpr	%r17, 0x011d, %pstate
	.word 0x8395e0b3  ! 3411: WRPR_TNPC_I	wrpr	%r23, 0x00b3, %tnpc
	.word 0xbd480000  ! 3412: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa25617f  ! 3415: STW_I	stw	%r29, [%r21 + 0x017f]
	.word 0xf42ca12a  ! 3416: STB_I	stb	%r26, [%r18 + 0x012a]
	.word 0xfa358000  ! 3417: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xfe3d8000  ! 3418: STD_R	std	%r31, [%r22 + %r0]
	.word 0xb33d5000  ! 3424: SRAX_R	srax	%r21, %r0, %r25
	.word 0xfa34e1e6  ! 3425: STH_I	sth	%r29, [%r19 + 0x01e6]
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c4000  ! 3428: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf224a096  ! 3429: STW_I	stw	%r25, [%r18 + 0x0096]
	.word 0xf33c4000  ! 3430: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf73d4000  ! 3431: STDF_R	std	%f27, [%r0, %r21]
	.word 0x8795e08e  ! 3432: WRPR_TT_I	wrpr	%r23, 0x008e, %tt
	.word 0xfc3521ec  ! 3433: STH_I	sth	%r30, [%r20 + 0x01ec]
	.word 0xb9504000  ! 3434: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfe2560c0  ! 3438: STW_I	stw	%r31, [%r21 + 0x00c0]
	ta	T_CHANGE_HPRIV
	.word 0x81983a01  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a01, %hpstate
	.word 0xb1518000  ! 3442: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb3518000  ! 3443: RDPR_PSTATE	<illegal instruction>
	.word 0xfa258000  ! 3446: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfe7521ad  ! 3447: STX_I	stx	%r31, [%r20 + 0x01ad]
	.word 0xf03cc000  ! 3448: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf83ce0b9  ! 3449: STD_I	std	%r28, [%r19 + 0x00b9]
	.word 0xfe750000  ! 3451: STX_R	stx	%r31, [%r20 + %r0]
	.word 0x8194e06b  ! 3453: WRPR_TPC_I	wrpr	%r19, 0x006b, %tpc
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa75c000  ! 3461: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf025e197  ! 3462: STW_I	stw	%r24, [%r23 + 0x0197]
	.word 0xb9520000  ! 3466: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfe2c216d  ! 3467: STB_I	stb	%r31, [%r16 + 0x016d]
	.word 0xf8758000  ! 3468: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf73d2041  ! 3477: STDF_I	std	%f27, [0x0041, %r20]
	.word 0xf6246094  ! 3485: STW_I	stw	%r27, [%r17 + 0x0094]
	.word 0xfe252189  ! 3487: STW_I	stw	%r31, [%r20 + 0x0189]
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2de0e0  ! 3489: STB_I	stb	%r29, [%r23 + 0x00e0]
	.word 0xbb520000  ! 3490: RDPR_PIL	<illegal instruction>
	.word 0xfa74600e  ! 3491: STX_I	stx	%r29, [%r17 + 0x000e]
	.word 0xfe24e0f5  ! 3492: STW_I	stw	%r31, [%r19 + 0x00f5]
	.word 0xf4344000  ! 3494: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf73de055  ! 3496: STDF_I	std	%f27, [0x0055, %r23]
	.word 0xfc3c8000  ! 3497: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf2254000  ! 3501: STW_R	stw	%r25, [%r21 + %r0]
	.word 0x91956016  ! 3504: WRPR_PIL_I	wrpr	%r21, 0x0016, %pil
	.word 0xbc950000  ! 3506: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xb68d21ea  ! 3508: ANDcc_I	andcc 	%r20, 0x01ea, %r27
	.word 0xb7520000  ! 3509: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb9510000  ! 3510: RDPR_TICK	<illegal instruction>
	.word 0xfe756103  ! 3512: STX_I	stx	%r31, [%r21 + 0x0103]
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4258000  ! 3517: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf2742003  ! 3519: STX_I	stx	%r25, [%r16 + 0x0003]
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09c20e3  ! 3525: XORcc_I	xorcc 	%r16, 0x00e3, %r24
	.word 0xfc3560b2  ! 3527: STH_I	sth	%r30, [%r21 + 0x00b2]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2748000  ! 3530: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf43dc000  ! 3533: STD_R	std	%r26, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	setx	0x20132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 3537: RDPR_TICK	rdpr	%tick, %r24
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c0000  ! 3539: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf02c4000  ! 3542: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb2048000  ! 3543: ADD_R	add 	%r18, %r0, %r25
	.word 0xf874a165  ! 3548: STX_I	stx	%r28, [%r18 + 0x0165]
	.word 0xfc3d8000  ! 3550: STD_R	std	%r30, [%r22 + %r0]
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa258000  ! 3555: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfe746070  ! 3556: STX_I	stx	%r31, [%r17 + 0x0070]
	.word 0x8594e000  ! 3559: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbd518000  ! 3561: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf8346100  ! 3570: STH_I	sth	%r28, [%r17 + 0x0100]
	.word 0xf875a1c4  ! 3573: STX_I	stx	%r28, [%r22 + 0x01c4]
	.word 0xf8248000  ! 3577: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf8258000  ! 3578: STW_R	stw	%r28, [%r22 + %r0]
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c6184  ! 3587: STD_I	std	%r31, [%r17 + 0x0184]
	.word 0xfc74e1c9  ! 3591: STX_I	stx	%r30, [%r19 + 0x01c9]
	.word 0xfa350000  ! 3594: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfe75e024  ! 3595: STX_I	stx	%r31, [%r23 + 0x0024]
	.word 0x8195e152  ! 3596: WRPR_TPC_I	wrpr	%r23, 0x0152, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb951c000  ! 3598: RDPR_TL	rdpr	%tl, %r28
	.word 0xf22d2130  ! 3599: STB_I	stb	%r25, [%r20 + 0x0130]
	.word 0xb81de00b  ! 3600: XOR_I	xor 	%r23, 0x000b, %r28
	.word 0xf875208a  ! 3603: STX_I	stx	%r28, [%r20 + 0x008a]
	.word 0xfa2cc000  ! 3606: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf93cc000  ! 3607: STDF_R	std	%f28, [%r0, %r19]
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 3615: RDPR_TICK	<illegal instruction>
	.word 0xf62461a8  ! 3617: STW_I	stw	%r27, [%r17 + 0x01a8]
	.word 0xb350c000  ! 3619: RDPR_TT	<illegal instruction>
	.word 0xf53cc000  ! 3620: STDF_R	std	%f26, [%r0, %r19]
	.word 0xfc252122  ! 3626: STW_I	stw	%r30, [%r20 + 0x0122]
	.word 0xfa344000  ! 3627: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb48da00e  ! 3629: ANDcc_I	andcc 	%r22, 0x000e, %r26
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e1d5  ! 3631: WRPR_TT_I	wrpr	%r23, 0x01d5, %tt
	.word 0xbcc4a061  ! 3632: ADDCcc_I	addccc 	%r18, 0x0061, %r30
	.word 0xf42d0000  ! 3634: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfa35c000  ! 3639: STH_R	sth	%r29, [%r23 + %r0]
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9de111  ! 3645: XORcc_I	xorcc 	%r23, 0x0111, %r29
	.word 0xf93c4000  ! 3649: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb69d4000  ! 3650: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xbb500000  ! 3651: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf53dc000  ! 3652: STDF_R	std	%f26, [%r0, %r23]
	.word 0x8194207b  ! 3654: WRPR_TPC_I	wrpr	%r16, 0x007b, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982b91  ! 3656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	.word 0xbb540000  ! 3658: RDPR_GL	rdpr	%-, %r29
	.word 0xbb510000  ! 3663: RDPR_TICK	<illegal instruction>
	setx	data_start_2, %g1, %r16
	setx	data_start_3, %g1, %r20
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2756022  ! 3674: STX_I	stx	%r25, [%r21 + 0x0022]
	.word 0x8595210e  ! 3676: WRPR_TSTATE_I	wrpr	%r20, 0x010e, %tstate
	.word 0xb23c0000  ! 3678: XNOR_R	xnor 	%r16, %r0, %r25
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942167  ! 3681: WRPR_PSTATE_I	wrpr	%r16, 0x0167, %pstate
	.word 0xfe2da0e3  ! 3682: STB_I	stb	%r31, [%r22 + 0x00e3]
	.word 0x8195e1b6  ! 3683: WRPR_TPC_I	wrpr	%r23, 0x01b6, %tpc
	.word 0xfe740000  ! 3688: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf0250000  ! 3689: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf4244000  ! 3692: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf075c000  ! 3694: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xbe35c000  ! 3695: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xfe744000  ! 3701: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xfe3de0d8  ! 3705: STD_I	std	%r31, [%r23 + 0x00d8]
	.word 0xfb3d4000  ! 3706: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf82d2106  ! 3712: STB_I	stb	%r28, [%r20 + 0x0106]
	.word 0xb4c40000  ! 3714: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xfd3c8000  ! 3715: STDF_R	std	%f30, [%r0, %r18]
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3720: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8d94a13a  ! 3721: WRPR_PSTATE_I	wrpr	%r18, 0x013a, %pstate
	.word 0xfc24c000  ! 3723: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819838c3  ! 3725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c3, %hpstate
	.word 0xb2c4212e  ! 3727: ADDCcc_I	addccc 	%r16, 0x012e, %r25
	.word 0xfb3d21c1  ! 3729: STDF_I	std	%f29, [0x01c1, %r20]
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 3731: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfc358000  ! 3733: STH_R	sth	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 3735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xf02cc000  ! 3736: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf8248000  ! 3738: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf0354000  ! 3742: STH_R	sth	%r24, [%r21 + %r0]
	.word 0x8195e1bb  ! 3745: WRPR_TPC_I	wrpr	%r23, 0x01bb, %tpc
	.word 0xf2750000  ! 3746: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf4348000  ! 3747: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb69ca0c8  ! 3748: XORcc_I	xorcc 	%r18, 0x00c8, %r27
	.word 0xfe758000  ! 3749: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf53ca0fd  ! 3752: STDF_I	std	%f26, [0x00fd, %r18]
	.word 0xf4356034  ! 3754: STH_I	sth	%r26, [%r21 + 0x0034]
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 3759: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f932000  ! 3763: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 3767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc358000  ! 3771: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfe34a0f7  ! 3772: STH_I	sth	%r31, [%r18 + 0x00f7]
	.word 0xf82c4000  ! 3773: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfc75a053  ! 3777: STX_I	stx	%r30, [%r22 + 0x0053]
	ta	T_CHANGE_HPRIV
	.word 0x81983b83  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b83, %hpstate
	.word 0xb351c000  ! 3781: RDPR_TL	rdpr	%tl, %r25
	.word 0xf82cc000  ! 3782: STB_R	stb	%r28, [%r19 + %r0]
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c7001  ! 3790: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0x839521ec  ! 3792: WRPR_TNPC_I	wrpr	%r20, 0x01ec, %tnpc
	.word 0xfa254000  ! 3793: STW_R	stw	%r29, [%r21 + %r0]
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 3802: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb151c000  ! 3803: RDPR_TL	rdpr	%tl, %r24
	.word 0x8395e0c3  ! 3804: WRPR_TNPC_I	wrpr	%r23, 0x00c3, %tnpc
	.word 0xf8340000  ! 3805: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf6246079  ! 3807: STW_I	stw	%r27, [%r17 + 0x0079]
	.word 0xfe750000  ! 3808: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xbb508000  ! 3809: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf2350000  ! 3811: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xbd643801  ! 3812: MOVcc_I	<illegal instruction>
	.word 0x8d95e145  ! 3814: WRPR_PSTATE_I	wrpr	%r23, 0x0145, %pstate
	.word 0xf635e107  ! 3816: STH_I	sth	%r27, [%r23 + 0x0107]
	.word 0xfd3cc000  ! 3819: STDF_R	std	%f30, [%r0, %r19]
	.word 0x8194a1d1  ! 3820: WRPR_TPC_I	wrpr	%r18, 0x01d1, %tpc
	.word 0xb551c000  ! 3821: RDPR_TL	rdpr	%tl, %r26
	setx	data_start_2, %g1, %r16
	setx	0x20339, %g1, %o0
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
	.word 0xb6844000  ! 3837: ADDcc_R	addcc 	%r17, %r0, %r27
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 3844: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfa24c000  ! 3846: STW_R	stw	%r29, [%r19 + %r0]
	.word 0x9194a039  ! 3849: WRPR_PIL_I	wrpr	%r18, 0x0039, %pil
	.word 0xf33c4000  ! 3851: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf0754000  ! 3854: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xb5518000  ! 3858: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfe2cc000  ! 3859: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xb644a0db  ! 3860: ADDC_I	addc 	%r18, 0x00db, %r27
	.word 0xfe3ce043  ! 3861: STD_I	std	%r31, [%r19 + 0x0043]
	.word 0xf13ce1f7  ! 3863: STDF_I	std	%f24, [0x01f7, %r19]
	.word 0xfc740000  ! 3864: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf6746094  ! 3868: STX_I	stx	%r27, [%r17 + 0x0094]
	.word 0xbd50c000  ! 3870: RDPR_TT	<illegal instruction>
	.word 0xf53cc000  ! 3871: STDF_R	std	%f26, [%r0, %r19]
	.word 0xb69c0000  ! 3874: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xfc756142  ! 3878: STX_I	stx	%r30, [%r21 + 0x0142]
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3882: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfc34c000  ! 3883: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf425c000  ! 3891: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xbab5e0ef  ! 3898: ORNcc_I	orncc 	%r23, 0x00ef, %r29
	.word 0xff3c0000  ! 3901: STDF_R	std	%f31, [%r0, %r16]
	.word 0xf22c8000  ! 3903: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf8740000  ! 3904: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfd3c0000  ! 3906: STDF_R	std	%f30, [%r0, %r16]
	.word 0xb43d20ea  ! 3907: XNOR_I	xnor 	%r20, 0x00ea, %r26
	.word 0xfc2c4000  ! 3908: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xbf500000  ! 3910: RDPR_TPC	<illegal instruction>
	.word 0xb415c000  ! 3912: OR_R	or 	%r23, %r0, %r26
	.word 0xfc3d4000  ! 3914: STD_R	std	%r30, [%r21 + %r0]
	.word 0xb7518000  ! 3915: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 3916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xb60d6085  ! 3918: AND_I	and 	%r21, 0x0085, %r27
	.word 0xf22d21bb  ! 3919: STB_I	stb	%r25, [%r20 + 0x01bb]
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c61c5  ! 3924: STD_I	std	%r31, [%r17 + 0x01c5]
	.word 0xfe25c000  ! 3926: STW_R	stw	%r31, [%r23 + %r0]
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235e0ba  ! 3930: STH_I	sth	%r25, [%r23 + 0x00ba]
	.word 0xfa2c8000  ! 3931: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf824e0af  ! 3932: STW_I	stw	%r28, [%r19 + 0x00af]
	.word 0xf62d6115  ! 3933: STB_I	stb	%r27, [%r21 + 0x0115]
	.word 0xf23c619b  ! 3935: STD_I	std	%r25, [%r17 + 0x019b]
	.word 0xf224e03a  ! 3936: STW_I	stw	%r25, [%r19 + 0x003a]
	setx	data_start_2, %g1, %r21
	.word 0xbec42053  ! 3941: ADDCcc_I	addccc 	%r16, 0x0053, %r31
	.word 0x8595e1d8  ! 3943: WRPR_TSTATE_I	wrpr	%r23, 0x01d8, %tstate
	.word 0xfc34e199  ! 3944: STH_I	sth	%r30, [%r19 + 0x0199]
	.word 0xfc256158  ! 3945: STW_I	stw	%r30, [%r21 + 0x0158]
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r16
	.word 0xf23da162  ! 3956: STD_I	std	%r25, [%r22 + 0x0162]
	.word 0xfa7520ad  ! 3957: STX_I	stx	%r29, [%r20 + 0x00ad]
	.word 0xf4750000  ! 3958: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xb9504000  ! 3965: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xff3de0ac  ! 3971: STDF_I	std	%f31, [0x00ac, %r23]
	.word 0xf23de00c  ! 3975: STD_I	std	%r25, [%r23 + 0x000c]
	.word 0xb1504000  ! 3978: RDPR_TNPC	<illegal instruction>
	.word 0xf33c61e6  ! 3982: STDF_I	std	%f25, [0x01e6, %r17]
	.word 0xf8244000  ! 3986: STW_R	stw	%r28, [%r17 + %r0]
	.word 0x8195e076  ! 3991: WRPR_TPC_I	wrpr	%r23, 0x0076, %tpc
	.word 0xf03c4000  ! 3994: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf0740000  ! 3995: STX_R	stx	%r24, [%r16 + %r0]
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8852133  ! 4001: ADDcc_I	addcc 	%r20, 0x0133, %r28
	.word 0xf42de01a  ! 4004: STB_I	stb	%r26, [%r23 + 0x001a]
	.word 0xfd3c8000  ! 4007: STDF_R	std	%f30, [%r0, %r18]
	.word 0xff3c20bf  ! 4008: STDF_I	std	%f31, [0x00bf, %r16]
	.word 0xb225a132  ! 4011: SUB_I	sub 	%r22, 0x0132, %r25
	.word 0x8194a052  ! 4013: WRPR_TPC_I	wrpr	%r18, 0x0052, %tpc
	.word 0xf02d8000  ! 4016: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf6340000  ! 4020: STH_R	sth	%r27, [%r16 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 4021: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf504000  ! 4022: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ad8000  ! 4024: ANDNcc_R	andncc 	%r22, %r0, %r25
	.word 0xb1518000  ! 4025: RDPR_PSTATE	<illegal instruction>
	.word 0xf2258000  ! 4026: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf23420a8  ! 4028: STH_I	sth	%r25, [%r16 + 0x00a8]
	.word 0xf0348000  ! 4031: STH_R	sth	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f9b  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9b, %hpstate
	.word 0xb950c000  ! 4037: RDPR_TT	rdpr	%tt, %r28
	.word 0xfa3d213d  ! 4040: STD_I	std	%r29, [%r20 + 0x013d]
	.word 0xb2a5c000  ! 4041: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0xf83ce100  ! 4042: STD_I	std	%r28, [%r19 + 0x0100]
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8740000  ! 4045: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xb9500000  ! 4046: RDPR_TPC	<illegal instruction>
	.word 0xf434a1d7  ! 4049: STH_I	sth	%r26, [%r18 + 0x01d7]
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63ce033  ! 4053: STD_I	std	%r27, [%r19 + 0x0033]
	.word 0xb9510000  ! 4054: RDPR_TICK	<illegal instruction>
	.word 0xf13da05d  ! 4056: STDF_I	std	%f24, [0x005d, %r22]
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33c3001  ! 4064: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xfe244000  ! 4066: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb5510000  ! 4069: RDPR_TICK	<illegal instruction>
	.word 0xfa2c0000  ! 4071: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf6352135  ! 4073: STH_I	sth	%r27, [%r20 + 0x0135]
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63cc000  ! 4080: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfd3d0000  ! 4081: STDF_R	std	%f30, [%r0, %r20]
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 4092: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xbf3d0000  ! 4093: SRA_R	sra 	%r20, %r0, %r31
	.word 0xfe756149  ! 4096: STX_I	stx	%r31, [%r21 + 0x0149]
	.word 0xf2254000  ! 4103: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xbb540000  ! 4105: RDPR_GL	rdpr	%-, %r29
	.word 0xf62ca16c  ! 4106: STB_I	stb	%r27, [%r18 + 0x016c]
	.word 0xf33c6050  ! 4107: STDF_I	std	%f25, [0x0050, %r17]
	.word 0xb804a1e9  ! 4111: ADD_I	add 	%r18, 0x01e9, %r28
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2c5000  ! 4114: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xf2254000  ! 4116: STW_R	stw	%r25, [%r21 + %r0]
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 4119: STX_R	stx	%r29, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 4120: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4122: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfa24c000  ! 4123: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf03cc000  ! 4128: STD_R	std	%r24, [%r19 + %r0]
	.word 0xfb3d21a3  ! 4130: STDF_I	std	%f29, [0x01a3, %r20]
	.word 0xf425201a  ! 4131: STW_I	stw	%r26, [%r20 + 0x001a]
	.word 0xf13c8000  ! 4132: STDF_R	std	%f24, [%r0, %r18]
	.word 0xff3d8000  ! 4133: STDF_R	std	%f31, [%r0, %r22]
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3ce045  ! 4135: STDF_I	std	%f31, [0x0045, %r19]
	.word 0xb0bda02f  ! 4138: XNORcc_I	xnorcc 	%r22, 0x002f, %r24
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 4142: RDPR_TT	<illegal instruction>
	.word 0xf42ca185  ! 4143: STB_I	stb	%r26, [%r18 + 0x0185]
	.word 0xf43d8000  ! 4144: STD_R	std	%r26, [%r22 + %r0]
	.word 0xfe3d2083  ! 4145: STD_I	std	%r31, [%r20 + 0x0083]
	.word 0xf275c000  ! 4147: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf6240000  ! 4148: STW_R	stw	%r27, [%r16 + %r0]
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 4151: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb97c6401  ! 4152: MOVR_I	movre	%r17, 0x1, %r28
	mov	2, %r14
	.word 0xa193a000  ! 4153: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8a58000  ! 4154: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xb151c000  ! 4160: RDPR_TL	rdpr	%tl, %r24
	.word 0xff3ce03f  ! 4161: STDF_I	std	%f31, [0x003f, %r19]
	.word 0xb695c000  ! 4163: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xb2bc6102  ! 4166: XNORcc_I	xnorcc 	%r17, 0x0102, %r25
	.word 0xb02c0000  ! 4167: ANDN_R	andn 	%r16, %r0, %r24
	.word 0x9195a09a  ! 4168: WRPR_PIL_I	wrpr	%r22, 0x009a, %pil
	.word 0xfc24c000  ! 4169: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfe3c4000  ! 4170: STD_R	std	%r31, [%r17 + %r0]
	setx	data_start_1, %g1, %r21
	.word 0xf8758000  ! 4172: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf035e006  ! 4173: STH_I	sth	%r24, [%r23 + 0x0006]
	.word 0xb6b40000  ! 4175: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xbb508000  ! 4179: RDPR_TSTATE	rdpr	%tstate, %r29
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 4185: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xb1504000  ! 4189: RDPR_TNPC	<illegal instruction>
	.word 0xff3de1a3  ! 4191: STDF_I	std	%f31, [0x01a3, %r23]
	mov	1, %r14
	.word 0xa193a000  ! 4195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf93d8000  ! 4196: STDF_R	std	%f28, [%r0, %r22]
	.word 0x89942191  ! 4197: WRPR_TICK_I	wrpr	%r16, 0x0191, %tick
	.word 0xf62c0000  ! 4198: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf63c8000  ! 4200: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf0346156  ! 4201: STH_I	sth	%r24, [%r17 + 0x0156]
	.word 0xfa35c000  ! 4202: STH_R	sth	%r29, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 4210: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf508000  ! 4211: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb0854000  ! 4212: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xf13de15f  ! 4215: STDF_I	std	%f24, [0x015f, %r23]
	.word 0xb6bc0000  ! 4216: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0x8195a0d5  ! 4222: WRPR_TPC_I	wrpr	%r22, 0x00d5, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 4228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	.word 0xfc754000  ! 4230: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfe750000  ! 4235: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf62c61bd  ! 4237: STB_I	stb	%r27, [%r17 + 0x01bd]
	.word 0xb61d0000  ! 4239: XOR_R	xor 	%r20, %r0, %r27
	.word 0xf42c0000  ! 4244: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb92cc000  ! 4248: SLL_R	sll 	%r19, %r0, %r28
	.word 0xfc35e0ef  ! 4261: STH_I	sth	%r30, [%r23 + 0x00ef]
	.word 0xf02460f6  ! 4263: STW_I	stw	%r24, [%r17 + 0x00f6]
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952047  ! 4265: WRPR_TPC_I	wrpr	%r20, 0x0047, %tpc
	.word 0xf2356070  ! 4266: STH_I	sth	%r25, [%r21 + 0x0070]
	.word 0x81946105  ! 4268: WRPR_TPC_I	wrpr	%r17, 0x0105, %tpc
	.word 0xb23c0000  ! 4270: XNOR_R	xnor 	%r16, %r0, %r25
	.word 0xf6350000  ! 4272: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb32c1000  ! 4274: SLLX_R	sllx	%r16, %r0, %r25
	setx	0x30329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc24c000  ! 4277: SUB_R	sub 	%r19, %r0, %r30
	.word 0xf22421d4  ! 4281: STW_I	stw	%r25, [%r16 + 0x01d4]
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 4284: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf4250000  ! 4289: STW_R	stw	%r26, [%r20 + %r0]
	.word 0x8d94e108  ! 4290: WRPR_PSTATE_I	wrpr	%r19, 0x0108, %pstate
	.word 0xb42c8000  ! 4292: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xf93ce0cf  ! 4294: STDF_I	std	%f28, [0x00cf, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81983bc1  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc1, %hpstate
	.word 0x8395a08d  ! 4299: WRPR_TNPC_I	wrpr	%r22, 0x008d, %tnpc
	setx	data_start_7, %g1, %r19
	.word 0x899521d6  ! 4303: WRPR_TICK_I	wrpr	%r20, 0x01d6, %tick
	.word 0xf42521be  ! 4304: STW_I	stw	%r26, [%r20 + 0x01be]
	.word 0x9195e1d9  ! 4305: WRPR_PIL_I	wrpr	%r23, 0x01d9, %pil
	setx	data_start_7, %g1, %r22
	.word 0xf6744000  ! 4307: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfa356160  ! 4311: STH_I	sth	%r29, [%r21 + 0x0160]
	.word 0xf73de109  ! 4313: STDF_I	std	%f27, [0x0109, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 4315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0x9194e0b7  ! 4323: WRPR_PIL_I	wrpr	%r19, 0x00b7, %pil
	.word 0xbd540000  ! 4327: RDPR_GL	rdpr	%-, %r30
	.word 0xfc748000  ! 4333: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf8740000  ! 4334: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf6250000  ! 4336: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb9520000  ! 4337: RDPR_PIL	<illegal instruction>
	.word 0xb1540000  ! 4339: RDPR_GL	<illegal instruction>
	.word 0xf03d8000  ! 4340: STD_R	std	%r24, [%r22 + %r0]
	.word 0xfa3420e8  ! 4343: STH_I	sth	%r29, [%r16 + 0x00e8]
	.word 0xf834a1da  ! 4345: STH_I	sth	%r28, [%r18 + 0x01da]
	.word 0xbb2c0000  ! 4348: SLL_R	sll 	%r16, %r0, %r29
	.word 0xb3355000  ! 4352: SRLX_R	srlx	%r21, %r0, %r25
	.word 0xbc14e05f  ! 4354: OR_I	or 	%r19, 0x005f, %r30
	.word 0xf73c2134  ! 4355: STDF_I	std	%f27, [0x0134, %r16]
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bca092  ! 4359: XNORcc_I	xnorcc 	%r18, 0x0092, %r24
	.word 0xbebca138  ! 4362: XNORcc_I	xnorcc 	%r18, 0x0138, %r31
	.word 0x859461f3  ! 4363: WRPR_TSTATE_I	wrpr	%r17, 0x01f3, %tstate
	.word 0xb1520000  ! 4368: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf03c60c0  ! 4371: STD_I	std	%r24, [%r17 + 0x00c0]
	.word 0xf93dc000  ! 4372: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb3518000  ! 4373: RDPR_PSTATE	<illegal instruction>
	.word 0xf63dc000  ! 4374: STD_R	std	%r27, [%r23 + %r0]
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c9000  ! 4378: SRAX_R	srax	%r18, %r0, %r30
	.word 0xb61d2021  ! 4381: XOR_I	xor 	%r20, 0x0021, %r27
	.word 0xbf540000  ! 4384: RDPR_GL	<illegal instruction>
	.word 0xfe35e07d  ! 4387: STH_I	sth	%r31, [%r23 + 0x007d]
	.word 0xf53c0000  ! 4389: STDF_R	std	%f26, [%r0, %r16]
	setx	data_start_1, %g1, %r22
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3ca18e  ! 4395: STDF_I	std	%f30, [0x018e, %r18]
	.word 0xf33c0000  ! 4397: STDF_R	std	%f25, [%r0, %r16]
	.word 0x8795a094  ! 4400: WRPR_TT_I	wrpr	%r22, 0x0094, %tt
	.word 0xf33d200e  ! 4403: STDF_I	std	%f25, [0x000e, %r20]
	.word 0xf43d205a  ! 4404: STD_I	std	%r26, [%r20 + 0x005a]
	.word 0xf43de0d1  ! 4409: STD_I	std	%r26, [%r23 + 0x00d1]
	.word 0xb5504000  ! 4411: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf33ca01e  ! 4412: STDF_I	std	%f25, [0x001e, %r18]
	.word 0xf02d0000  ! 4414: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf43d8000  ! 4415: STD_R	std	%r26, [%r22 + %r0]
	.word 0xfe3d0000  ! 4418: STD_R	std	%r31, [%r20 + %r0]
	.word 0xbb504000  ! 4419: RDPR_TNPC	<illegal instruction>
	.word 0xf635a1a4  ! 4421: STH_I	sth	%r27, [%r22 + 0x01a4]
	.word 0xb1641800  ! 4424: MOVcc_R	<illegal instruction>
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d6039  ! 4429: STD_I	std	%r30, [%r21 + 0x0039]
	.word 0xb4bd0000  ! 4432: XNORcc_R	xnorcc 	%r20, %r0, %r26
	setx	data_start_7, %g1, %r23
	.word 0xfa3d2186  ! 4435: STD_I	std	%r29, [%r20 + 0x0186]
	.word 0xb3508000  ! 4437: RDPR_TSTATE	<illegal instruction>
	.word 0xfe3de064  ! 4438: STD_I	std	%r31, [%r23 + 0x0064]
	.word 0xf4240000  ! 4439: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb9500000  ! 4443: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xf4356023  ! 4448: STH_I	sth	%r26, [%r21 + 0x0023]
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3461c6  ! 4451: STH_I	sth	%r29, [%r17 + 0x01c6]
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2cb001  ! 4454: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xf33c0000  ! 4457: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf23d2053  ! 4459: STD_I	std	%r25, [%r20 + 0x0053]
	.word 0xf63de142  ! 4462: STD_I	std	%r27, [%r23 + 0x0142]
	.word 0xf82c4000  ! 4464: STB_R	stb	%r28, [%r17 + %r0]
	.word 0x8d952100  ! 4465: WRPR_PSTATE_I	wrpr	%r20, 0x0100, %pstate
	setx	0x10012, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 4474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	.word 0xb5510000  ! 4480: RDPR_TICK	rdpr	%tick, %r26
	setx	0x10139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24e0a8  ! 4482: STW_I	stw	%r30, [%r19 + 0x00a8]
	.word 0xbea46042  ! 4484: SUBcc_I	subcc 	%r17, 0x0042, %r31
	.word 0xf93de07f  ! 4487: STDF_I	std	%f28, [0x007f, %r23]
	.word 0xfe3c21d3  ! 4489: STD_I	std	%r31, [%r16 + 0x01d3]
	.word 0xbf641800  ! 4491: MOVcc_R	<illegal instruction>
	.word 0xff3d0000  ! 4492: STDF_R	std	%f31, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4240000  ! 4499: STW_R	stw	%r26, [%r16 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc75e0f0  ! 4502: STX_I	stx	%r30, [%r23 + 0x00f0]
	.word 0xfe2ca14f  ! 4505: STB_I	stb	%r31, [%r18 + 0x014f]
	.word 0xf875608b  ! 4511: STX_I	stx	%r28, [%r21 + 0x008b]
	.word 0xbe958000  ! 4513: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0x87956155  ! 4516: WRPR_TT_I	wrpr	%r21, 0x0155, %tt
	.word 0xb00ca10b  ! 4521: AND_I	and 	%r18, 0x010b, %r24
	.word 0xf0256072  ! 4522: STW_I	stw	%r24, [%r21 + 0x0072]
	.word 0xbf540000  ! 4527: RDPR_GL	rdpr	%-, %r31
	.word 0xfc240000  ! 4528: STW_R	stw	%r30, [%r16 + %r0]
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d6035  ! 4531: STDF_I	std	%f27, [0x0035, %r21]
	.word 0xf23c4000  ! 4534: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf024e064  ! 4538: STW_I	stw	%r24, [%r19 + 0x0064]
	.word 0xb7540000  ! 4541: RDPR_GL	rdpr	%-, %r27
	.word 0xf024c000  ! 4542: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb4250000  ! 4545: SUB_R	sub 	%r20, %r0, %r26
	.word 0xfe358000  ! 4548: STH_R	sth	%r31, [%r22 + %r0]
	.word 0x91942004  ! 4551: WRPR_PIL_I	wrpr	%r16, 0x0004, %pil
	.word 0xf62cc000  ! 4552: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf825a14b  ! 4553: STW_I	stw	%r28, [%r22 + 0x014b]
	.word 0xfc740000  ! 4554: STX_R	stx	%r30, [%r16 + %r0]
	.word 0x8195e0f8  ! 4556: WRPR_TPC_I	wrpr	%r23, 0x00f8, %tpc
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 4560: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf02c8000  ! 4569: STB_R	stb	%r24, [%r18 + %r0]
	setx	data_start_7, %g1, %r19
	.word 0xfa2dc000  ! 4573: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf13d0000  ! 4574: STDF_R	std	%f24, [%r0, %r20]
	.word 0xfb3da0c8  ! 4575: STDF_I	std	%f29, [0x00c8, %r22]
	.word 0xbe24211f  ! 4577: SUB_I	sub 	%r16, 0x011f, %r31
	.word 0xf8240000  ! 4578: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf13cc000  ! 4583: STDF_R	std	%f24, [%r0, %r19]
	.word 0xbd480000  ! 4585: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf53de067  ! 4592: STDF_I	std	%f26, [0x0067, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983f4b  ! 4593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
	.word 0xfa2d6100  ! 4595: STB_I	stb	%r29, [%r21 + 0x0100]
	.word 0x8d9561ba  ! 4605: WRPR_PSTATE_I	wrpr	%r21, 0x01ba, %pstate
	.word 0xb5508000  ! 4609: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf42460b0  ! 4611: STW_I	stw	%r26, [%r17 + 0x00b0]
	.word 0xfa3d8000  ! 4612: STD_R	std	%r29, [%r22 + %r0]
	.word 0x83946099  ! 4617: WRPR_TNPC_I	wrpr	%r17, 0x0099, %tnpc
	.word 0xf235c000  ! 4620: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfc3da08f  ! 4621: STD_I	std	%r30, [%r22 + 0x008f]
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba05a105  ! 4632: ADD_I	add 	%r22, 0x0105, %r29
	.word 0xb2850000  ! 4634: ADDcc_R	addcc 	%r20, %r0, %r25
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf024a13c  ! 4637: STW_I	stw	%r24, [%r18 + 0x013c]
	.word 0xfe74e160  ! 4638: STX_I	stx	%r31, [%r19 + 0x0160]
	.word 0xfa2d2139  ! 4640: STB_I	stb	%r29, [%r20 + 0x0139]
	.word 0xf6344000  ! 4642: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf03de176  ! 4645: STD_I	std	%r24, [%r23 + 0x0176]
	mov	1, %r14
	.word 0xa193a000  ! 4648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc352164  ! 4656: STH_I	sth	%r30, [%r20 + 0x0164]
	.word 0xf43d8000  ! 4658: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf82520df  ! 4661: STW_I	stw	%r28, [%r20 + 0x00df]
	.word 0xbb643801  ! 4662: MOVcc_I	<illegal instruction>
	.word 0x8994e16a  ! 4668: WRPR_TICK_I	wrpr	%r19, 0x016a, %tick
	.word 0xf73d2004  ! 4672: STDF_I	std	%f27, [0x0004, %r20]
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 4677: RDPR_GL	rdpr	%-, %r24
	.word 0xb2b56046  ! 4678: SUBCcc_I	orncc 	%r21, 0x0046, %r25
	.word 0xfc2420c2  ! 4679: STW_I	stw	%r30, [%r16 + 0x00c2]
	.word 0xf03de18f  ! 4680: STD_I	std	%r24, [%r23 + 0x018f]
	.word 0xf43c2097  ! 4681: STD_I	std	%r26, [%r16 + 0x0097]
	setx	0x3010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3de0b5  ! 4695: STD_I	std	%r31, [%r23 + 0x00b5]
	.word 0xfc248000  ! 4696: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf22c4000  ! 4699: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfc3c4000  ! 4704: STD_R	std	%r30, [%r17 + %r0]
	.word 0xf024e062  ! 4706: STW_I	stw	%r24, [%r19 + 0x0062]
	.word 0xbf540000  ! 4708: RDPR_GL	<illegal instruction>
	.word 0xf02d0000  ! 4710: STB_R	stb	%r24, [%r20 + %r0]
	setx	0x3c, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 4724: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb7540000  ! 4727: RDPR_GL	<illegal instruction>
	.word 0xf63d2058  ! 4731: STD_I	std	%r27, [%r20 + 0x0058]
	.word 0xba0da1ad  ! 4732: AND_I	and 	%r22, 0x01ad, %r29
	.word 0xb824c000  ! 4734: SUB_R	sub 	%r19, %r0, %r28
	.word 0xf834a0ac  ! 4735: STH_I	sth	%r28, [%r18 + 0x00ac]
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c4000  ! 4739: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf4248000  ! 4740: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf024201a  ! 4749: STW_I	stw	%r24, [%r16 + 0x001a]
	.word 0xb32d9000  ! 4751: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xf82c0000  ! 4752: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf8254000  ! 4753: STW_R	stw	%r28, [%r21 + %r0]
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb534d000  ! 4757: SRLX_R	srlx	%r19, %r0, %r26
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a15c  ! 4764: WRPR_PSTATE_I	wrpr	%r18, 0x015c, %pstate
	.word 0xf82d612d  ! 4769: STB_I	stb	%r28, [%r21 + 0x012d]
	.word 0xf225a0ab  ! 4775: STW_I	stw	%r25, [%r22 + 0x00ab]
	.word 0xb934d000  ! 4776: SRLX_R	srlx	%r19, %r0, %r28
	.word 0xf03ce067  ! 4777: STD_I	std	%r24, [%r19 + 0x0067]
	.word 0xfa75c000  ! 4786: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf8254000  ! 4794: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf62dc000  ! 4796: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xbb3de001  ! 4798: SRA_I	sra 	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	.word 0xfa246152  ! 4805: STW_I	stw	%r29, [%r17 + 0x0152]
	.word 0xf43d8000  ! 4806: STD_R	std	%r26, [%r22 + %r0]
	.word 0xbd508000  ! 4808: RDPR_TSTATE	rdpr	%tstate, %r30
	setx	data_start_1, %g1, %r21
	.word 0xfc2c4000  ! 4812: STB_R	stb	%r30, [%r17 + %r0]
	setx	data_start_0, %g1, %r17
	.word 0xb4458000  ! 4816: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xb4458000  ! 4817: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xf63c0000  ! 4818: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf425a1c2  ! 4821: STW_I	stw	%r26, [%r22 + 0x01c2]
	.word 0xfc34c000  ! 4822: STH_R	sth	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5504000  ! 4826: RDPR_TNPC	<illegal instruction>
	.word 0xfc3d8000  ! 4827: STD_R	std	%r30, [%r22 + %r0]
	.word 0xbd50c000  ! 4833: RDPR_TT	<illegal instruction>
	.word 0x919421a1  ! 4834: WRPR_PIL_I	wrpr	%r16, 0x01a1, %pil
	.word 0xfa3da1dc  ! 4835: STD_I	std	%r29, [%r22 + 0x01dc]
	.word 0xf13c610e  ! 4836: STDF_I	std	%f24, [0x010e, %r17]
	.word 0xf42421d4  ! 4838: STW_I	stw	%r26, [%r16 + 0x01d4]
	.word 0xbd504000  ! 4839: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x87942129  ! 4841: WRPR_TT_I	wrpr	%r16, 0x0129, %tt
	.word 0xff3c4000  ! 4844: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf22d4000  ! 4850: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf4252053  ! 4851: STW_I	stw	%r26, [%r20 + 0x0053]
	ta	T_CHANGE_HPRIV
	.word 0x81983e89  ! 4853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e89, %hpstate
	.word 0xf23d4000  ! 4857: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf73d20e6  ! 4860: STDF_I	std	%f27, [0x00e6, %r20]
	.word 0xbcad61d5  ! 4865: ANDNcc_I	andncc 	%r21, 0x01d5, %r30
	.word 0x919460c6  ! 4869: WRPR_PIL_I	wrpr	%r17, 0x00c6, %pil
	.word 0xfe3d60c9  ! 4872: STD_I	std	%r31, [%r21 + 0x00c9]
	.word 0xf73d601e  ! 4873: STDF_I	std	%f27, [0x001e, %r21]
	.word 0xf62c206e  ! 4875: STB_I	stb	%r27, [%r16 + 0x006e]
	.word 0xb1540000  ! 4876: RDPR_GL	rdpr	%-, %r24
	.word 0xbe9de182  ! 4881: XORcc_I	xorcc 	%r23, 0x0182, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb3c0000  ! 4889: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf82cc000  ! 4890: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xba9d0000  ! 4892: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xf73c4000  ! 4896: STDF_R	std	%f27, [%r0, %r17]
	.word 0x8995a021  ! 4897: WRPR_TICK_I	wrpr	%r22, 0x0021, %tick
	.word 0x8394605e  ! 4898: WRPR_TNPC_I	wrpr	%r17, 0x005e, %tnpc
	.word 0x8794a1db  ! 4900: WRPR_TT_I	wrpr	%r18, 0x01db, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2d4000  ! 4903: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xfa25c000  ! 4905: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xbf510000  ! 4907: RDPR_TICK	rdpr	%tick, %r31
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6ad4000  ! 4910: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0x8395a0d0  ! 4912: WRPR_TNPC_I	wrpr	%r22, 0x00d0, %tnpc
	.word 0xfe256061  ! 4914: STW_I	stw	%r31, [%r21 + 0x0061]
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf225e020  ! 4920: STW_I	stw	%r25, [%r23 + 0x0020]
	.word 0xb0042063  ! 4921: ADD_I	add 	%r16, 0x0063, %r24
	.word 0xbb504000  ! 4926: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb7518000  ! 4927: RDPR_PSTATE	<illegal instruction>
	.word 0xf275c000  ! 4940: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfa3d4000  ! 4942: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf83461b3  ! 4944: STH_I	sth	%r28, [%r17 + 0x01b3]
	.word 0xfa2da1a4  ! 4945: STB_I	stb	%r29, [%r22 + 0x01a4]
	.word 0xb6a4e08c  ! 4946: SUBcc_I	subcc 	%r19, 0x008c, %r27
	.word 0xbab52104  ! 4948: ORNcc_I	orncc 	%r20, 0x0104, %r29
	.word 0xb9520000  ! 4949: RDPR_PIL	<illegal instruction>
	.word 0xf6348000  ! 4952: STH_R	sth	%r27, [%r18 + %r0]
	.word 0x8d94a0ad  ! 4956: WRPR_PSTATE_I	wrpr	%r18, 0x00ad, %pstate
	.word 0xf22cc000  ! 4959: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf82dc000  ! 4960: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfe340000  ! 4962: STH_R	sth	%r31, [%r16 + %r0]
	setx	data_start_1, %g1, %r21
	.word 0xbd540000  ! 4967: RDPR_GL	rdpr	%-, %r30
	.word 0xf13da041  ! 4968: STDF_I	std	%f24, [0x0041, %r22]
	.word 0xb935f001  ! 4977: SRLX_I	srlx	%r23, 0x0001, %r28
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xfc24c000  ! 4980: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfa34a1c1  ! 4981: STH_I	sth	%r29, [%r18 + 0x01c1]
	.word 0xf42c6174  ! 4984: STB_I	stb	%r26, [%r17 + 0x0174]
	.word 0xfd3c61fe  ! 4986: STDF_I	std	%f30, [0x01fe, %r17]
	.word 0xb1508000  ! 4989: RDPR_TSTATE	<illegal instruction>
	.word 0xfe2d8000  ! 4993: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb2358000  ! 4998: SUBC_R	orn 	%r22, %r0, %r25
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
	setx	0x10312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205a082  ! 7: LDUW_I	lduw	[%r22 + 0x0082], %r25
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0x8994213e  ! 13: WRPR_TICK_I	wrpr	%r16, 0x013e, %tick
	.word 0x879460ba  ! 14: WRPR_TT_I	wrpr	%r17, 0x00ba, %tt
	.word 0xfe1c61eb  ! 15: LDD_I	ldd	[%r17 + 0x01eb], %r31
	.word 0xf20421e7  ! 19: LDUW_I	lduw	[%r16 + 0x01e7], %r25
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1cc000  ! 21: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xf20c607d  ! 28: LDUB_I	ldub	[%r17 + 0x007d], %r25
	.word 0xfa5d0000  ! 30: LDX_R	ldx	[%r20 + %r0], %r29
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xf25d8000  ! 41: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xb37c4400  ! 42: MOVR_R	movre	%r17, %r0, %r25
	.word 0xf8452190  ! 43: LDSW_I	ldsw	[%r20 + 0x0190], %r28
	.word 0xbf643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0xf2054000  ! 45: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf00c8000  ! 47: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xbcade13f  ! 52: ANDNcc_I	andncc 	%r23, 0x013f, %r30
	.word 0xfe0cc000  ! 55: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf31d8000  ! 62: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xfc454000  ! 64: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf01cc000  ! 66: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf24cc000  ! 67: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xb9508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 71: RDPR_TNPC	<illegal instruction>
	.word 0xbd510000  ! 73: RDPR_TICK	<illegal instruction>
	.word 0xf20d4000  ! 75: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xbec5e19f  ! 77: ADDCcc_I	addccc 	%r23, 0x019f, %r31
	.word 0xf20520c4  ! 78: LDUW_I	lduw	[%r20 + 0x00c4], %r25
	.word 0x83942075  ! 90: WRPR_TNPC_I	wrpr	%r16, 0x0075, %tnpc
	.word 0xfe442009  ! 93: LDSW_I	ldsw	[%r16 + 0x0009], %r31
	.word 0xb7518000  ! 97: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 98: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf25c8000  ! 100: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xfa05c000  ! 104: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xf24c60ca  ! 105: LDSB_I	ldsb	[%r17 + 0x00ca], %r25
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44d0000  ! 111: LDSB_R	ldsb	[%r20 + %r0], %r26
	setx	data_start_1, %g1, %r18
	.word 0xf04d4000  ! 115: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfc158000  ! 116: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfa5d0000  ! 123: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xf84cc000  ! 129: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf245c000  ! 130: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb351c000  ! 131: RDPR_TL	<illegal instruction>
	.word 0xf2142030  ! 133: LDUH_I	lduh	[%r16 + 0x0030], %r25
	.word 0xbb510000  ! 135: RDPR_TICK	<illegal instruction>
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25521e6  ! 143: LDSH_I	ldsh	[%r20 + 0x01e6], %r25
	.word 0xf60ca0bf  ! 151: LDUB_I	ldub	[%r18 + 0x00bf], %r27
	.word 0xfa5d4000  ! 153: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf6540000  ! 154: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xf00cc000  ! 157: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf804616b  ! 159: LDUW_I	lduw	[%r17 + 0x016b], %r28
	.word 0xbf540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xf44521be  ! 163: LDSW_I	ldsw	[%r20 + 0x01be], %r26
	.word 0xfe1ce190  ! 164: LDD_I	ldd	[%r19 + 0x0190], %r31
	.word 0xb57c2401  ! 167: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xb72d0000  ! 168: SLL_R	sll 	%r20, %r0, %r27
	.word 0xbd504000  ! 169: RDPR_TNPC	<illegal instruction>
	.word 0xb13c5000  ! 171: SRAX_R	srax	%r17, %r0, %r24
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d21a0  ! 182: LDD_I	ldd	[%r20 + 0x01a0], %r27
	.word 0xf11dc000  ! 183: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf21d8000  ! 188: LDD_R	ldd	[%r22 + %r0], %r25
	mov	2, %r12
	.word 0x8f932000  ! 189: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xb135e001  ! 192: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xf04dc000  ! 195: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xb0ad8000  ! 197: ANDNcc_R	andncc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba854000  ! 204: ADDcc_R	addcc 	%r21, %r0, %r29
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05ca073  ! 206: LDX_I	ldx	[%r18 + 0x0073], %r24
	.word 0x8395a118  ! 210: WRPR_TNPC_I	wrpr	%r22, 0x0118, %tnpc
	.word 0xb13cb001  ! 212: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xf25c4000  ! 214: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xb41d21f8  ! 218: XOR_I	xor 	%r20, 0x01f8, %r26
	.word 0xf245c000  ! 219: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xbd3da001  ! 222: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xfc5dc000  ! 224: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf2440000  ! 228: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0x9194e1fe  ! 230: WRPR_PIL_I	wrpr	%r19, 0x01fe, %pil
	.word 0x89942065  ! 231: WRPR_TICK_I	wrpr	%r16, 0x0065, %tick
	.word 0xfc1c4000  ! 234: LDD_R	ldd	[%r17 + %r0], %r30
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 236: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe5c2115  ! 240: LDX_I	ldx	[%r16 + 0x0115], %r31
	.word 0xf045c000  ! 244: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf6558000  ! 246: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0x8394e0f6  ! 247: WRPR_TNPC_I	wrpr	%r19, 0x00f6, %tnpc
	.word 0xf40d2110  ! 248: LDUB_I	ldub	[%r20 + 0x0110], %r26
	.word 0x899561f7  ! 249: WRPR_TICK_I	wrpr	%r21, 0x01f7, %tick
	.word 0xfa14c000  ! 256: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xf604e158  ! 257: LDUW_I	lduw	[%r19 + 0x0158], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xf6556171  ! 260: LDSH_I	ldsh	[%r21 + 0x0171], %r27
	.word 0xf6044000  ! 261: LDUW_R	lduw	[%r17 + %r0], %r27
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d8000  ! 270: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xfe0460d6  ! 272: LDUW_I	lduw	[%r17 + 0x00d6], %r31
	.word 0x89942047  ! 275: WRPR_TICK_I	wrpr	%r16, 0x0047, %tick
	.word 0xf44c0000  ! 277: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0x8195e060  ! 281: WRPR_TPC_I	wrpr	%r23, 0x0060, %tpc
	.word 0xf85ca0da  ! 283: LDX_I	ldx	[%r18 + 0x00da], %r28
	.word 0xf645e1a1  ! 286: LDSW_I	ldsw	[%r23 + 0x01a1], %r27
	.word 0xf11c0000  ! 287: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfc4d0000  ! 288: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xfc1c0000  ! 290: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf4058000  ! 293: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xbd500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0xfa552035  ! 295: LDSH_I	ldsh	[%r20 + 0x0035], %r29
	.word 0x8394e0da  ! 297: WRPR_TNPC_I	wrpr	%r19, 0x00da, %tnpc
	.word 0xb9510000  ! 301: RDPR_TICK	<illegal instruction>
	.word 0xb3643801  ! 302: MOVcc_I	<illegal instruction>
	.word 0xfc1420b5  ! 303: LDUH_I	lduh	[%r16 + 0x00b5], %r30
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5c8000  ! 308: LDX_R	ldx	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	.word 0xfc0d8000  ! 310: LDUB_R	ldub	[%r22 + %r0], %r30
	setx	0x30136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf255e0ad  ! 315: LDSH_I	ldsh	[%r23 + 0x00ad], %r25
	.word 0xf0146011  ! 317: LDUH_I	lduh	[%r17 + 0x0011], %r24
	setx	data_start_6, %g1, %r23
	.word 0x8394607c  ! 321: WRPR_TNPC_I	wrpr	%r17, 0x007c, %tnpc
	.word 0xf21520bf  ! 322: LDUH_I	lduh	[%r20 + 0x00bf], %r25
	.word 0xf85d4000  ! 323: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xbf520000  ! 324: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf80de0a4  ! 325: LDUB_I	ldub	[%r23 + 0x00a4], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982941  ! 327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0941, %hpstate
	.word 0xfe04c000  ! 328: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xfc5d0000  ! 329: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xfe5d0000  ! 330: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xb1643801  ! 332: MOVcc_I	<illegal instruction>
	.word 0xfa4d4000  ! 333: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xfe4c61cb  ! 334: LDSB_I	ldsb	[%r17 + 0x01cb], %r31
	.word 0xf01d8000  ! 337: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf6054000  ! 343: LDUW_R	lduw	[%r21 + %r0], %r27
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2054000  ! 348: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x8d9461a8  ! 353: WRPR_PSTATE_I	wrpr	%r17, 0x01a8, %pstate
	.word 0xbe2c4000  ! 354: ANDN_R	andn 	%r17, %r0, %r31
	.word 0x819520d6  ! 355: WRPR_TPC_I	wrpr	%r20, 0x00d6, %tpc
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0xb7520000  ! 358: RDPR_PIL	<illegal instruction>
	.word 0xf8454000  ! 365: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xb40d61c9  ! 367: AND_I	and 	%r21, 0x01c9, %r26
	.word 0xfe14c000  ! 369: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf84d8000  ! 371: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xfc0c0000  ! 374: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xfe0cc000  ! 375: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xfc0c210d  ! 382: LDUB_I	ldub	[%r16 + 0x010d], %r30
	.word 0xfa058000  ! 384: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfe0c8000  ! 385: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfa150000  ! 397: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xb1540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0xf8444000  ! 399: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf44461df  ! 400: LDSW_I	ldsw	[%r17 + 0x01df], %r26
	.word 0xbf359000  ! 403: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xb73da001  ! 404: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xb2358000  ! 405: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xf64d0000  ! 408: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfc5d4000  ! 409: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xb72d8000  ! 410: SLL_R	sll 	%r22, %r0, %r27
	.word 0xf81c4000  ! 416: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xb9518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0xfa1da01e  ! 418: LDD_I	ldd	[%r22 + 0x001e], %r29
	.word 0xf84c8000  ! 420: LDSB_R	ldsb	[%r18 + %r0], %r28
	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61dc000  ! 432: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xb53c9000  ! 434: SRAX_R	srax	%r18, %r0, %r26
	.word 0xf045e1ce  ! 438: LDSW_I	ldsw	[%r23 + 0x01ce], %r24
	.word 0xf05421a3  ! 439: LDSH_I	ldsh	[%r16 + 0x01a3], %r24
	.word 0x8395a09b  ! 440: WRPR_TNPC_I	wrpr	%r22, 0x009b, %tnpc
	.word 0xff1c6181  ! 441: LDDF_I	ldd	[%r17, 0x0181], %f31
	.word 0xf2050000  ! 443: LDUW_R	lduw	[%r20 + %r0], %r25
	setx	data_start_7, %g1, %r23
	.word 0xfe1d8000  ! 447: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xfa052056  ! 449: LDUW_I	lduw	[%r20 + 0x0056], %r29
	.word 0xf404e044  ! 450: LDUW_I	lduw	[%r19 + 0x0044], %r26
	.word 0xb33d0000  ! 452: SRA_R	sra 	%r20, %r0, %r25
	.word 0xfe0cc000  ! 453: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf614e1a9  ! 454: LDUH_I	lduh	[%r19 + 0x01a9], %r27
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015e176  ! 457: LDUH_I	lduh	[%r23 + 0x0176], %r24
	.word 0xfe5ce116  ! 458: LDX_I	ldx	[%r19 + 0x0116], %r31
	.word 0xf11d20cc  ! 460: LDDF_I	ldd	[%r20, 0x00cc], %f24
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4de059  ! 462: LDSB_I	ldsb	[%r23 + 0x0059], %r31
	.word 0x859520a9  ! 463: WRPR_TSTATE_I	wrpr	%r20, 0x00a9, %tstate
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 474: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0x9194213e  ! 478: WRPR_PIL_I	wrpr	%r16, 0x013e, %pil
	.word 0xf8548000  ! 485: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xbb510000  ! 488: RDPR_TICK	<illegal instruction>
	.word 0xb444c000  ! 491: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xfc1421ff  ! 492: LDUH_I	lduh	[%r16 + 0x01ff], %r30
	.word 0xf44de06e  ! 494: LDSB_I	ldsb	[%r23 + 0x006e], %r26
	.word 0xb2bd0000  ! 497: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0xb62dc000  ! 498: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbd508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xf51c4000  ! 509: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0x85956091  ! 513: WRPR_TSTATE_I	wrpr	%r21, 0x0091, %tstate
	.word 0xfa550000  ! 514: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf40de157  ! 516: LDUB_I	ldub	[%r23 + 0x0157], %r26
	.word 0xba85619a  ! 521: ADDcc_I	addcc 	%r21, 0x019a, %r29
	.word 0xf11d8000  ! 522: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xb9508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xbc0d8000  ! 525: AND_R	and 	%r22, %r0, %r30
	mov	2, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe54c000  ! 529: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf81561d4  ! 532: LDUH_I	lduh	[%r21 + 0x01d4], %r28
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d4000  ! 535: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0x8794e045  ! 541: WRPR_TT_I	wrpr	%r19, 0x0045, %tt
	.word 0xf6440000  ! 544: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xfe4d4000  ! 546: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf25ca017  ! 548: LDX_I	ldx	[%r18 + 0x0017], %r25
	.word 0xfe0ca06a  ! 554: LDUB_I	ldub	[%r18 + 0x006a], %r31
	.word 0xf05dc000  ! 555: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfa0ca10c  ! 558: LDUB_I	ldub	[%r18 + 0x010c], %r29
	.word 0xb0240000  ! 559: SUB_R	sub 	%r16, %r0, %r24
	.word 0xfe4c6145  ! 561: LDSB_I	ldsb	[%r17 + 0x0145], %r31
	.word 0xfa5d8000  ! 562: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0x89946176  ! 564: WRPR_TICK_I	wrpr	%r17, 0x0176, %tick
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1ce132  ! 576: LDD_I	ldd	[%r19 + 0x0132], %r31
	.word 0xba15e0df  ! 580: OR_I	or 	%r23, 0x00df, %r29
	.word 0xf91c4000  ! 581: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xfe44609d  ! 588: LDSW_I	ldsw	[%r17 + 0x009d], %r31
	.word 0xf80d0000  ! 590: LDUB_R	ldub	[%r20 + %r0], %r28
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45ce108  ! 592: LDX_I	ldx	[%r19 + 0x0108], %r26
	.word 0x9195e025  ! 594: WRPR_PIL_I	wrpr	%r23, 0x0025, %pil
	.word 0xbd508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xb1480000  ! 606: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb52ce001  ! 612: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xf60520d0  ! 614: LDUW_I	lduw	[%r20 + 0x00d0], %r27
	.word 0xf11dc000  ! 615: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf04d8000  ! 618: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xfc4c606d  ! 622: LDSB_I	ldsb	[%r17 + 0x006d], %r30
	.word 0x8595e021  ! 624: WRPR_TSTATE_I	wrpr	%r23, 0x0021, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb52cb001  ! 628: SLLX_I	sllx	%r18, 0x0001, %r26
	.word 0xf414e158  ! 630: LDUH_I	lduh	[%r19 + 0x0158], %r26
	setx	data_start_3, %g1, %r22
	.word 0xfe04a1c5  ! 632: LDUW_I	lduw	[%r18 + 0x01c5], %r31
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0c8000  ! 635: LDUB_R	ldub	[%r18 + %r0], %r31
	mov	1, %r14
	.word 0xa193a000  ! 639: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe5ce132  ! 642: LDX_I	ldx	[%r19 + 0x0132], %r31
	.word 0xf45c202e  ! 643: LDX_I	ldx	[%r16 + 0x002e], %r26
	.word 0xb4bdc000  ! 647: XNORcc_R	xnorcc 	%r23, %r0, %r26
	mov	1, %r12
	.word 0x8f932000  ! 648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf81d21c8  ! 654: LDD_I	ldd	[%r20 + 0x01c8], %r28
	.word 0xfe0c0000  ! 661: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbc046176  ! 662: ADD_I	add 	%r17, 0x0176, %r30
	.word 0xfa054000  ! 665: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0x81946040  ! 668: WRPR_TPC_I	wrpr	%r17, 0x0040, %tpc
	.word 0x8795a0a6  ! 669: WRPR_TT_I	wrpr	%r22, 0x00a6, %tt
	.word 0xfd1ce178  ! 670: LDDF_I	ldd	[%r19, 0x0178], %f30
	.word 0x8994a1e1  ! 673: WRPR_TICK_I	wrpr	%r18, 0x01e1, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r20
	setx	data_start_2, %g1, %r21
	mov	0, %r12
	.word 0x8f932000  ! 681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7520000  ! 683: RDPR_PIL	rdpr	%pil, %r27
	.word 0xfa044000  ! 688: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xbd3c2001  ! 699: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0x85942194  ! 701: WRPR_TSTATE_I	wrpr	%r16, 0x0194, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f89  ! 702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f89, %hpstate
	.word 0xf8458000  ! 704: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xbd2c4000  ! 715: SLL_R	sll 	%r17, %r0, %r30
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e1cc  ! 718: WRPR_TSTATE_I	wrpr	%r23, 0x01cc, %tstate
	setx	data_start_7, %g1, %r21
	.word 0xf0056119  ! 721: LDUW_I	lduw	[%r21 + 0x0119], %r24
	.word 0xf85de06e  ! 722: LDX_I	ldx	[%r23 + 0x006e], %r28
	.word 0xfe5420f2  ! 726: LDSH_I	ldsh	[%r16 + 0x00f2], %r31
	.word 0x859460b5  ! 728: WRPR_TSTATE_I	wrpr	%r17, 0x00b5, %tstate
	.word 0xf0040000  ! 733: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xbb500000  ! 737: RDPR_TPC	<illegal instruction>
	.word 0xfa04e187  ! 742: LDUW_I	lduw	[%r19 + 0x0187], %r29
	.word 0xba842094  ! 743: ADDcc_I	addcc 	%r16, 0x0094, %r29
	.word 0xb43da07e  ! 744: XNOR_I	xnor 	%r22, 0x007e, %r26
	setx	0x1003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93da001  ! 747: SRA_I	sra 	%r22, 0x0001, %r28
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4cc000  ! 758: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfc1da180  ! 763: LDD_I	ldd	[%r22 + 0x0180], %r30
	mov	1, %r14
	.word 0xa193a000  ! 768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf0554000  ! 772: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0x9195e17f  ! 773: WRPR_PIL_I	wrpr	%r23, 0x017f, %pil
	.word 0x8595206b  ! 774: WRPR_TSTATE_I	wrpr	%r20, 0x006b, %tstate
	.word 0xf41d61a4  ! 777: LDD_I	ldd	[%r21 + 0x01a4], %r26
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44ce0ab  ! 780: LDSB_I	ldsb	[%r19 + 0x00ab], %r26
	.word 0xb57d0400  ! 783: MOVR_R	movre	%r20, %r0, %r26
	.word 0xbd540000  ! 786: RDPR_GL	<illegal instruction>
	.word 0xf0144000  ! 789: LDUH_R	lduh	[%r17 + %r0], %r24
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63d0000  ! 793: XNOR_R	xnor 	%r20, %r0, %r27
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa05208d  ! 795: LDUW_I	lduw	[%r20 + 0x008d], %r29
	.word 0xf40dc000  ! 796: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xbe158000  ! 798: OR_R	or 	%r22, %r0, %r31
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2942198  ! 802: ORcc_I	orcc 	%r16, 0x0198, %r25
	.word 0xf64da1bc  ! 803: LDSB_I	ldsb	[%r22 + 0x01bc], %r27
	.word 0xf445e1a7  ! 807: LDSW_I	ldsw	[%r23 + 0x01a7], %r26
	.word 0xff1d0000  ! 808: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf05461da  ! 812: LDSH_I	ldsh	[%r17 + 0x01da], %r24
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 814: RDPR_GL	<illegal instruction>
	.word 0xf45c4000  ! 816: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0x89956170  ! 817: WRPR_TICK_I	wrpr	%r21, 0x0170, %tick
	.word 0xfa4da1f2  ! 819: LDSB_I	ldsb	[%r22 + 0x01f2], %r29
	.word 0xfe0c61b3  ! 821: LDUB_I	ldub	[%r17 + 0x01b3], %r31
	.word 0x8995e05a  ! 822: WRPR_TICK_I	wrpr	%r23, 0x005a, %tick
	.word 0xfe44a039  ! 823: LDSW_I	ldsw	[%r18 + 0x0039], %r31
	.word 0xf91d8000  ! 828: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0x919421e0  ! 829: WRPR_PIL_I	wrpr	%r16, 0x01e0, %pil
	.word 0xfc0cc000  ! 832: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xbf510000  ! 835: RDPR_TICK	<illegal instruction>
	.word 0xf0458000  ! 839: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xb4c460a0  ! 842: ADDCcc_I	addccc 	%r17, 0x00a0, %r26
	.word 0xf85ce14d  ! 845: LDX_I	ldx	[%r19 + 0x014d], %r28
	.word 0xb351c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xf25d0000  ! 847: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xff1cc000  ! 849: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xbf340000  ! 850: SRL_R	srl 	%r16, %r0, %r31
	.word 0xfe1dc000  ! 852: LDD_R	ldd	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf11cc000  ! 854: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xfe048000  ! 855: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0x87946022  ! 857: WRPR_TT_I	wrpr	%r17, 0x0022, %tt
	.word 0xf2148000  ! 868: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xb8b58000  ! 876: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xf20cc000  ! 877: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xf20da0c5  ! 879: LDUB_I	ldub	[%r22 + 0x00c5], %r25
	.word 0xf015a1f8  ! 881: LDUH_I	lduh	[%r22 + 0x01f8], %r24
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 885: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf84520ba  ! 888: LDSW_I	ldsw	[%r20 + 0x00ba], %r28
	.word 0xf51dc000  ! 889: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xbf510000  ! 891: RDPR_TICK	<illegal instruction>
	.word 0xfa5c4000  ! 893: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf61cc000  ! 897: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0x8195a105  ! 898: WRPR_TPC_I	wrpr	%r22, 0x0105, %tpc
	.word 0xf31d614b  ! 900: LDDF_I	ldd	[%r21, 0x014b], %f25
	.word 0xf255a1d2  ! 902: LDSH_I	ldsh	[%r22 + 0x01d2], %r25
	.word 0xbd480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xba3c4000  ! 905: XNOR_R	xnor 	%r17, %r0, %r29
	.word 0xfb1de112  ! 906: LDDF_I	ldd	[%r23, 0x0112], %f29
	.word 0xf20da0a4  ! 908: LDUB_I	ldub	[%r22 + 0x00a4], %r25
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 912: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf6140000  ! 913: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf80c615b  ! 914: LDUB_I	ldub	[%r17 + 0x015b], %r28
	.word 0xf80dc000  ! 918: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf444a0e1  ! 919: LDSW_I	ldsw	[%r18 + 0x00e1], %r26
	.word 0xfa0d4000  ! 921: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf455c000  ! 922: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xff1c8000  ! 924: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0x83956114  ! 926: WRPR_TNPC_I	wrpr	%r21, 0x0114, %tnpc
	mov	2, %r14
	.word 0xa193a000  ! 927: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0154000  ! 928: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xbcb5a077  ! 929: ORNcc_I	orncc 	%r22, 0x0077, %r30
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3df001  ! 932: SRAX_I	srax	%r23, 0x0001, %r29
	setx	0x30313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23d4000  ! 936: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xfc4ce158  ! 938: LDSB_I	ldsb	[%r19 + 0x0158], %r30
	.word 0x9194604f  ! 941: WRPR_PIL_I	wrpr	%r17, 0x004f, %pil
	.word 0xf44460ac  ! 942: LDSW_I	ldsw	[%r17 + 0x00ac], %r26
	.word 0xf6040000  ! 943: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf254611c  ! 945: LDSH_I	ldsh	[%r17 + 0x011c], %r25
	.word 0xf44c4000  ! 949: LDSB_R	ldsb	[%r17 + %r0], %r26
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa54e020  ! 957: LDSH_I	ldsh	[%r19 + 0x0020], %r29
	.word 0xf2552135  ! 959: LDSH_I	ldsh	[%r20 + 0x0135], %r25
	.word 0xb6b54000  ! 961: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xfc0d8000  ! 962: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xf45c4000  ! 963: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xb7504000  ! 964: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfc44a0fa  ! 965: LDSW_I	ldsw	[%r18 + 0x00fa], %r30
	.word 0xfe4dc000  ! 975: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf81c8000  ! 977: LDD_R	ldd	[%r18 + %r0], %r28
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf644a180  ! 980: LDSW_I	ldsw	[%r18 + 0x0180], %r27
	.word 0x8d956072  ! 981: WRPR_PSTATE_I	wrpr	%r21, 0x0072, %pstate
	.word 0xba452167  ! 983: ADDC_I	addc 	%r20, 0x0167, %r29
	mov	2, %r14
	.word 0xa193a000  ! 985: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r18
	.word 0xfa048000  ! 987: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xbf2cd000  ! 989: SLLX_R	sllx	%r19, %r0, %r31
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21d601c  ! 992: LDD_I	ldd	[%r21 + 0x001c], %r25
	.word 0xbac58000  ! 994: ADDCcc_R	addccc 	%r22, %r0, %r29
	.word 0xb42d0000  ! 995: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xf91d8000  ! 997: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xfe04e118  ! 999: LDUW_I	lduw	[%r19 + 0x0118], %r31
	.word 0xbd520000  ! 1001: RDPR_PIL	<illegal instruction>
	.word 0xf44c61de  ! 1002: LDSB_I	ldsb	[%r17 + 0x01de], %r26
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6354000  ! 1008: ORN_R	orn 	%r21, %r0, %r27
	.word 0xfc5ca05d  ! 1011: LDX_I	ldx	[%r18 + 0x005d], %r30
	.word 0xf80c6110  ! 1012: LDUB_I	ldub	[%r17 + 0x0110], %r28
	.word 0xf24d0000  ! 1013: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0x9195e121  ! 1015: WRPR_PIL_I	wrpr	%r23, 0x0121, %pil
	.word 0xbf504000  ! 1020: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf64d4000  ! 1022: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf4444000  ! 1023: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xf11c0000  ! 1024: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfa048000  ! 1028: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xb2148000  ! 1031: OR_R	or 	%r18, %r0, %r25
	.word 0xfc4ce137  ! 1033: LDSB_I	ldsb	[%r19 + 0x0137], %r30
	.word 0xf8448000  ! 1034: LDSW_R	ldsw	[%r18 + %r0], %r28
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4da12b  ! 1038: LDSB_I	ldsb	[%r22 + 0x012b], %r31
	.word 0xfa45e031  ! 1053: LDSW_I	ldsw	[%r23 + 0x0031], %r29
	.word 0xf41d4000  ! 1055: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xb5510000  ! 1057: RDPR_TICK	<illegal instruction>
	.word 0xb5480000  ! 1060: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_5, %g1, %r21
	.word 0xf015e0c3  ! 1064: LDUH_I	lduh	[%r23 + 0x00c3], %r24
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa15203f  ! 1071: LDUH_I	lduh	[%r20 + 0x003f], %r29
	.word 0xbb480000  ! 1072: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	1, %r14
	.word 0xa193a000  ! 1075: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8594e1d3  ! 1076: WRPR_TSTATE_I	wrpr	%r19, 0x01d3, %tstate
	.word 0xf84521cc  ! 1078: LDSW_I	ldsw	[%r20 + 0x01cc], %r28
	.word 0xf41ca1fa  ! 1079: LDD_I	ldd	[%r18 + 0x01fa], %r26
	.word 0xf604a1bb  ! 1082: LDUW_I	lduw	[%r18 + 0x01bb], %r27
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1086: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc14c000  ! 1088: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xb9480000  ! 1091: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe440000  ! 1095: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xb7480000  ! 1099: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x819521eb  ! 1101: WRPR_TPC_I	wrpr	%r20, 0x01eb, %tpc
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	.word 0xb751c000  ! 1111: RDPR_TL	rdpr	%tl, %r27
	.word 0xb7540000  ! 1112: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf61d60aa  ! 1115: LDD_I	ldd	[%r21 + 0x00aa], %r27
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5da1bb  ! 1123: LDX_I	ldx	[%r22 + 0x01bb], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa1d0000  ! 1126: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb9510000  ! 1128: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe446120  ! 1138: LDSW_I	ldsw	[%r17 + 0x0120], %r31
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 1142: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xf64ca060  ! 1143: LDSB_I	ldsb	[%r18 + 0x0060], %r27
	.word 0xf85d4000  ! 1144: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0x81946126  ! 1145: WRPR_TPC_I	wrpr	%r17, 0x0126, %tpc
	.word 0xbebdc000  ! 1146: XNORcc_R	xnorcc 	%r23, %r0, %r31
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0c0000  ! 1150: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xb9480000  ! 1155: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1156: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	setx	data_start_7, %g1, %r22
	.word 0xbf51c000  ! 1184: RDPR_TL	<illegal instruction>
	.word 0xfc4ca174  ! 1185: LDSB_I	ldsb	[%r18 + 0x0174], %r30
	.word 0xb8acc000  ! 1189: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0x8794e0f6  ! 1190: WRPR_TT_I	wrpr	%r19, 0x00f6, %tt
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1193: RDPR_TT	<illegal instruction>
	.word 0xf404e19f  ! 1194: LDUW_I	lduw	[%r19 + 0x019f], %r26
	.word 0xba84e135  ! 1195: ADDcc_I	addcc 	%r19, 0x0135, %r29
	.word 0x8594a0e9  ! 1197: WRPR_TSTATE_I	wrpr	%r18, 0x00e9, %tstate
	.word 0xf2048000  ! 1198: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfe0c8000  ! 1199: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf84d6085  ! 1201: LDSB_I	ldsb	[%r21 + 0x0085], %r28
	.word 0xfc1ca1bb  ! 1202: LDD_I	ldd	[%r18 + 0x01bb], %r30
	.word 0xf65c4000  ! 1204: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0x8195a1f9  ! 1207: WRPR_TPC_I	wrpr	%r22, 0x01f9, %tpc
	.word 0xba442178  ! 1210: ADDC_I	addc 	%r16, 0x0178, %r29
	.word 0xf845a199  ! 1213: LDSW_I	ldsw	[%r22 + 0x0199], %r28
	.word 0xfc54600c  ! 1214: LDSH_I	ldsh	[%r17 + 0x000c], %r30
	.word 0xfe4cc000  ! 1215: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf8444000  ! 1217: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf2444000  ! 1218: LDSW_R	ldsw	[%r17 + %r0], %r25
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44421bf  ! 1223: LDSW_I	ldsw	[%r16 + 0x01bf], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 1224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xf85d21f2  ! 1226: LDX_I	ldx	[%r20 + 0x01f2], %r28
	.word 0xf85cc000  ! 1229: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb1641800  ! 1238: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983813  ! 1246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1813, %hpstate
	.word 0xf855c000  ! 1251: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xb08de116  ! 1254: ANDcc_I	andcc 	%r23, 0x0116, %r24
	.word 0xb32d3001  ! 1255: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xf05ca17a  ! 1257: LDX_I	ldx	[%r18 + 0x017a], %r24
	.word 0xfe1560a4  ! 1258: LDUH_I	lduh	[%r21 + 0x00a4], %r31
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946117  ! 1265: WRPR_PSTATE_I	wrpr	%r17, 0x0117, %pstate
	.word 0x8194e071  ! 1266: WRPR_TPC_I	wrpr	%r19, 0x0071, %tpc
	.word 0xf6058000  ! 1270: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xb93c4000  ! 1272: SRA_R	sra 	%r17, %r0, %r28
	.word 0xb48c0000  ! 1273: ANDcc_R	andcc 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb405e029  ! 1276: ADD_I	add 	%r23, 0x0029, %r26
	.word 0xf00c609f  ! 1277: LDUB_I	ldub	[%r17 + 0x009f], %r24
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04dc000  ! 1280: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xb3540000  ! 1282: RDPR_GL	<illegal instruction>
	.word 0xbb500000  ! 1284: RDPR_TPC	<illegal instruction>
	.word 0xfa4c617e  ! 1287: LDSB_I	ldsb	[%r17 + 0x017e], %r29
	.word 0xf24d4000  ! 1297: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf004a005  ! 1299: LDUW_I	lduw	[%r18 + 0x0005], %r24
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879561cc  ! 1305: WRPR_TT_I	wrpr	%r21, 0x01cc, %tt
	.word 0xba2ce074  ! 1307: ANDN_I	andn 	%r19, 0x0074, %r29
	.word 0xb9500000  ! 1309: RDPR_TPC	<illegal instruction>
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 1312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0x8795a0d8  ! 1313: WRPR_TT_I	wrpr	%r22, 0x00d8, %tt
	setx	data_start_6, %g1, %r23
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195610b  ! 1324: WRPR_PIL_I	wrpr	%r21, 0x010b, %pil
	.word 0xfe05e1fc  ! 1326: LDUW_I	lduw	[%r23 + 0x01fc], %r31
	.word 0xb3520000  ! 1327: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf21c4000  ! 1329: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xb5508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xf60d2198  ! 1334: LDUB_I	ldub	[%r20 + 0x0198], %r27
	.word 0xbd510000  ! 1335: RDPR_TICK	<illegal instruction>
	.word 0xb9540000  ! 1338: RDPR_GL	<illegal instruction>
	.word 0xf844a139  ! 1342: LDSW_I	ldsw	[%r18 + 0x0139], %r28
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 1348: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xb6a5c000  ! 1349: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0xbc0da007  ! 1350: AND_I	and 	%r22, 0x0007, %r30
	.word 0xbe0ca13a  ! 1352: AND_I	and 	%r18, 0x013a, %r31
	.word 0xf81d2165  ! 1355: LDD_I	ldd	[%r20 + 0x0165], %r28
	.word 0xf64d4000  ! 1356: LDSB_R	ldsb	[%r21 + %r0], %r27
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d8000  ! 1359: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xba954000  ! 1362: ORcc_R	orcc 	%r21, %r0, %r29
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 1364: RDPR_GL	<illegal instruction>
	.word 0xf71c8000  ! 1365: LDDF_R	ldd	[%r18, %r0], %f27
	setx	data_start_6, %g1, %r16
	.word 0xfc44c000  ! 1368: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xfa0d8000  ! 1373: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xb2bce0fb  ! 1374: XNORcc_I	xnorcc 	%r19, 0x00fb, %r25
	.word 0xfa5dc000  ! 1375: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xff1d4000  ! 1381: LDDF_R	ldd	[%r21, %r0], %f31
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859560c1  ! 1391: WRPR_TSTATE_I	wrpr	%r21, 0x00c1, %tstate
	.word 0xb3508000  ! 1393: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r19
	.word 0xf51d60e4  ! 1396: LDDF_I	ldd	[%r21, 0x00e4], %f26
	.word 0xf0548000  ! 1400: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb1641800  ! 1401: MOVcc_R	<illegal instruction>
	.word 0xba1d20bb  ! 1404: XOR_I	xor 	%r20, 0x00bb, %r29
	.word 0xf254c000  ! 1409: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfc0560f6  ! 1410: LDUW_I	lduw	[%r21 + 0x00f6], %r30
	.word 0xfa4da156  ! 1414: LDSB_I	ldsb	[%r22 + 0x0156], %r29
	.word 0xfe5d8000  ! 1418: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xbd510000  ! 1424: RDPR_TICK	<illegal instruction>
	.word 0xf015a190  ! 1429: LDUH_I	lduh	[%r22 + 0x0190], %r24
	.word 0xb7480000  ! 1431: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0da0ee  ! 1434: LDUB_I	ldub	[%r22 + 0x00ee], %r29
	.word 0xfc5ce117  ! 1437: LDX_I	ldx	[%r19 + 0x0117], %r30
	.word 0xf25da1f5  ! 1440: LDX_I	ldx	[%r22 + 0x01f5], %r25
	setx	0x30136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d4000  ! 1446: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xf21c20ca  ! 1451: LDD_I	ldd	[%r16 + 0x00ca], %r25
	setx	0x10d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195218e  ! 1453: WRPR_PIL_I	wrpr	%r20, 0x018e, %pil
	.word 0xbc150000  ! 1461: OR_R	or 	%r20, %r0, %r30
	.word 0xfd1c8000  ! 1465: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf25d8000  ! 1468: LDX_R	ldx	[%r22 + %r0], %r25
	mov	1, %r12
	.word 0x8f932000  ! 1469: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe5c4000  ! 1470: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xfc5d0000  ! 1471: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xfa5c8000  ! 1473: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf65c61d2  ! 1475: LDX_I	ldx	[%r17 + 0x01d2], %r27
	.word 0xb5358000  ! 1476: SRL_R	srl 	%r22, %r0, %r26
	.word 0xf24520e8  ! 1480: LDSW_I	ldsw	[%r20 + 0x00e8], %r25
	.word 0xf31de1e8  ! 1482: LDDF_I	ldd	[%r23, 0x01e8], %f25
	.word 0xfa4d8000  ! 1483: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf01c0000  ! 1485: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xbf51c000  ! 1486: RDPR_TL	<illegal instruction>
	.word 0xfd1dc000  ! 1501: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf044617e  ! 1502: LDSW_I	ldsw	[%r17 + 0x017e], %r24
	.word 0xb2056147  ! 1504: ADD_I	add 	%r21, 0x0147, %r25
	.word 0xfe540000  ! 1509: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0x8995a0d5  ! 1510: WRPR_TICK_I	wrpr	%r22, 0x00d5, %tick
	.word 0xfe5de10f  ! 1511: LDX_I	ldx	[%r23 + 0x010f], %r31
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xf805a0b7  ! 1514: LDUW_I	lduw	[%r22 + 0x00b7], %r28
	.word 0xfc0ce0fe  ! 1520: LDUB_I	ldub	[%r19 + 0x00fe], %r30
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d8000  ! 1523: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xbf510000  ! 1526: RDPR_TICK	<illegal instruction>
	.word 0xf01d0000  ! 1529: LDD_R	ldd	[%r20 + %r0], %r24
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8054000  ! 1536: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xfc440000  ! 1537: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xfc042190  ! 1542: LDUW_I	lduw	[%r16 + 0x0190], %r30
	.word 0xf11c4000  ! 1547: LDDF_R	ldd	[%r17, %r0], %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983d91  ! 1548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
	setx	0x13, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 1550: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb1510000  ! 1551: RDPR_TICK	<illegal instruction>
	.word 0xf21d4000  ! 1552: LDD_R	ldd	[%r21 + %r0], %r25
	.word 0xb02d8000  ! 1553: ANDN_R	andn 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb51c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xf44d61a2  ! 1557: LDSB_I	ldsb	[%r21 + 0x01a2], %r26
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91c204a  ! 1561: LDDF_I	ldd	[%r16, 0x004a], %f28
	.word 0xf0540000  ! 1562: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xbd500000  ! 1564: RDPR_TPC	<illegal instruction>
	.word 0xfc4c8000  ! 1565: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xb42c215d  ! 1567: ANDN_I	andn 	%r16, 0x015d, %r26
	setx	data_start_4, %g1, %r17
	mov	2, %r12
	.word 0x8f932000  ! 1571: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2bc4000  ! 1574: XNORcc_R	xnorcc 	%r17, %r0, %r25
	setx	data_start_0, %g1, %r20
	.word 0xf91d4000  ! 1584: LDDF_R	ldd	[%r21, %r0], %f28
	setx	data_start_1, %g1, %r23
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87956068  ! 1590: WRPR_TT_I	wrpr	%r21, 0x0068, %tt
	.word 0xfc1521d4  ! 1593: LDUH_I	lduh	[%r20 + 0x01d4], %r30
	.word 0x81946149  ! 1594: WRPR_TPC_I	wrpr	%r17, 0x0149, %tpc
	.word 0xfc144000  ! 1597: LDUH_R	lduh	[%r17 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 1600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c8000  ! 1604: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfe1ca1af  ! 1607: LDD_I	ldd	[%r18 + 0x01af], %r31
	.word 0xb9510000  ! 1608: RDPR_TICK	<illegal instruction>
	.word 0xf24ca0eb  ! 1609: LDSB_I	ldsb	[%r18 + 0x00eb], %r25
	.word 0xfa0cc000  ! 1610: LDUB_R	ldub	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982a41  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0xf444a13b  ! 1614: LDSW_I	ldsw	[%r18 + 0x013b], %r26
	.word 0xf01c2097  ! 1620: LDD_I	ldd	[%r16 + 0x0097], %r24
	.word 0xb7520000  ! 1621: RDPR_PIL	<illegal instruction>
	.word 0xfa152099  ! 1627: LDUH_I	lduh	[%r20 + 0x0099], %r29
	.word 0xb7508000  ! 1628: RDPR_TSTATE	<illegal instruction>
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1520f6  ! 1631: LDUH_I	lduh	[%r20 + 0x00f6], %r30
	.word 0xf81c6193  ! 1632: LDD_I	ldd	[%r17 + 0x0193], %r28
	.word 0xf6550000  ! 1635: LDSH_R	ldsh	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0444000  ! 1638: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xb93d7001  ! 1641: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xfe0d0000  ! 1642: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xbf520000  ! 1644: RDPR_PIL	<illegal instruction>
	.word 0xb351c000  ! 1645: RDPR_TL	<illegal instruction>
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa55617f  ! 1649: LDSH_I	ldsh	[%r21 + 0x017f], %r29
	.word 0xfc544000  ! 1650: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb2b4c000  ! 1653: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xf0450000  ! 1659: LDSW_R	ldsw	[%r20 + %r0], %r24
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60521f3  ! 1662: LDUW_I	lduw	[%r20 + 0x01f3], %r27
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1666: RDPR_GL	<illegal instruction>
	.word 0x8d95608b  ! 1671: WRPR_PSTATE_I	wrpr	%r21, 0x008b, %pstate
	.word 0xfa14e155  ! 1673: LDUH_I	lduh	[%r19 + 0x0155], %r29
	.word 0xf51d8000  ! 1677: LDDF_R	ldd	[%r22, %r0], %f26
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1680: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbc3d8000  ! 1681: XNOR_R	xnor 	%r22, %r0, %r30
	.word 0xf214200b  ! 1683: LDUH_I	lduh	[%r16 + 0x000b], %r25
	.word 0xf81560c9  ! 1684: LDUH_I	lduh	[%r21 + 0x00c9], %r28
	.word 0xf25ca0ee  ! 1685: LDX_I	ldx	[%r18 + 0x00ee], %r25
	.word 0xf31c61ce  ! 1686: LDDF_I	ldd	[%r17, 0x01ce], %f25
	.word 0xb3508000  ! 1687: RDPR_TSTATE	<illegal instruction>
	.word 0xfc056060  ! 1696: LDUW_I	lduw	[%r21 + 0x0060], %r30
	.word 0xf00dc000  ! 1698: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xfc5da19d  ! 1701: LDX_I	ldx	[%r22 + 0x019d], %r30
	.word 0xf0554000  ! 1702: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0x819561cc  ! 1704: WRPR_TPC_I	wrpr	%r21, 0x01cc, %tpc
	.word 0x8394a17b  ! 1709: WRPR_TNPC_I	wrpr	%r18, 0x017b, %tnpc
	.word 0xf40d2049  ! 1710: LDUB_I	ldub	[%r20 + 0x0049], %r26
	.word 0xb5518000  ! 1711: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc550000  ! 1716: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xb025c000  ! 1719: SUB_R	sub 	%r23, %r0, %r24
	.word 0xfa454000  ! 1728: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xfa44a111  ! 1730: LDSW_I	ldsw	[%r18 + 0x0111], %r29
	.word 0xf81cc000  ! 1732: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xbd520000  ! 1736: RDPR_PIL	<illegal instruction>
	.word 0x8194a068  ! 1738: WRPR_TPC_I	wrpr	%r18, 0x0068, %tpc
	.word 0xfe4d2043  ! 1741: LDSB_I	ldsb	[%r20 + 0x0043], %r31
	.word 0xf004e1c6  ! 1743: LDUW_I	lduw	[%r19 + 0x01c6], %r24
	.word 0xb4350000  ! 1744: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xfb1dc000  ! 1748: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xf815e066  ! 1750: LDUH_I	lduh	[%r23 + 0x0066], %r28
	.word 0xf2456024  ! 1752: LDSW_I	ldsw	[%r21 + 0x0024], %r25
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94215a  ! 1755: WRPR_PSTATE_I	wrpr	%r16, 0x015a, %pstate
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa05e12b  ! 1758: LDUW_I	lduw	[%r23 + 0x012b], %r29
	.word 0xfa546075  ! 1760: LDSH_I	ldsh	[%r17 + 0x0075], %r29
	.word 0xfc5c21a8  ! 1762: LDX_I	ldx	[%r16 + 0x01a8], %r30
	mov	1, %r14
	.word 0xa193a000  ! 1766: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf45de044  ! 1768: LDX_I	ldx	[%r23 + 0x0044], %r26
	.word 0xfa444000  ! 1769: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xb5353001  ! 1770: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xfa45a1b5  ! 1774: LDSW_I	ldsw	[%r22 + 0x01b5], %r29
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1ca032  ! 1777: LDDF_I	ldd	[%r18, 0x0032], %f31
	setx	0x10238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3d6001  ! 1783: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xf51cc000  ! 1787: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf44cc000  ! 1789: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8394a1c6  ! 1791: WRPR_TNPC_I	wrpr	%r18, 0x01c6, %tnpc
	.word 0xf21da0a7  ! 1792: LDD_I	ldd	[%r22 + 0x00a7], %r25
	.word 0xf41c611a  ! 1795: LDD_I	ldd	[%r17 + 0x011a], %r26
	.word 0xf8448000  ! 1797: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfc540000  ! 1802: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfc5c4000  ! 1803: LDX_R	ldx	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c41  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c41, %hpstate
	.word 0xf444c000  ! 1807: LDSW_R	ldsw	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xfa54a129  ! 1815: LDSH_I	ldsh	[%r18 + 0x0129], %r29
	.word 0xf814c000  ! 1816: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf6458000  ! 1818: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf8148000  ! 1821: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfc440000  ! 1824: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xbf520000  ! 1829: RDPR_PIL	<illegal instruction>
	.word 0xf015e174  ! 1830: LDUH_I	lduh	[%r23 + 0x0174], %r24
	.word 0xf6554000  ! 1832: LDSH_R	ldsh	[%r21 + %r0], %r27
	setx	data_start_1, %g1, %r16
	.word 0xf2044000  ! 1835: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xf45c0000  ! 1839: LDX_R	ldx	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983e0b  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0b, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r18
	.word 0xbd510000  ! 1846: RDPR_TICK	<illegal instruction>
	.word 0xfc5da1f6  ! 1848: LDX_I	ldx	[%r22 + 0x01f6], %r30
	.word 0x81952048  ! 1852: WRPR_TPC_I	wrpr	%r20, 0x0048, %tpc
	.word 0xfc4d6026  ! 1853: LDSB_I	ldsb	[%r21 + 0x0026], %r30
	.word 0xf11d60d0  ! 1855: LDDF_I	ldd	[%r21, 0x00d0], %f24
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81420e4  ! 1859: LDUH_I	lduh	[%r16 + 0x00e4], %r28
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e0b3  ! 1870: WRPR_TICK_I	wrpr	%r19, 0x00b3, %tick
	.word 0xf25da1df  ! 1872: LDX_I	ldx	[%r22 + 0x01df], %r25
	.word 0x8995a065  ! 1874: WRPR_TICK_I	wrpr	%r22, 0x0065, %tick
	.word 0x9195e186  ! 1875: WRPR_PIL_I	wrpr	%r23, 0x0186, %pil
	.word 0xf2440000  ! 1876: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xb3510000  ! 1877: RDPR_TICK	<illegal instruction>
	.word 0xfc1dc000  ! 1878: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf01461d4  ! 1880: LDUH_I	lduh	[%r17 + 0x01d4], %r24
	.word 0xfe1d602c  ! 1888: LDD_I	ldd	[%r21 + 0x002c], %r31
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9da081  ! 1897: XORcc_I	xorcc 	%r22, 0x0081, %r29
	.word 0xf614c000  ! 1902: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0x9195e1cd  ! 1905: WRPR_PIL_I	wrpr	%r23, 0x01cd, %pil
	.word 0xfc044000  ! 1906: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfe1d212b  ! 1909: LDD_I	ldd	[%r20 + 0x012b], %r31
	.word 0xf91ce107  ! 1911: LDDF_I	ldd	[%r19, 0x0107], %f28
	.word 0xfc04211a  ! 1912: LDUW_I	lduw	[%r16 + 0x011a], %r30
	.word 0xbab4c000  ! 1914: ORNcc_R	orncc 	%r19, %r0, %r29
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d0000  ! 1919: LDUB_R	ldub	[%r20 + %r0], %r28
	setx	data_start_5, %g1, %r22
	.word 0xb550c000  ! 1923: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb21ca1e5  ! 1925: XOR_I	xor 	%r18, 0x01e5, %r25
	.word 0xb3510000  ! 1927: RDPR_TICK	<illegal instruction>
	.word 0x8195215b  ! 1928: WRPR_TPC_I	wrpr	%r20, 0x015b, %tpc
	.word 0x9194a0b1  ! 1929: WRPR_PIL_I	wrpr	%r18, 0x00b1, %pil
	.word 0x8394a0ae  ! 1930: WRPR_TNPC_I	wrpr	%r18, 0x00ae, %tnpc
	.word 0xfc45e183  ! 1933: LDSW_I	ldsw	[%r23 + 0x0183], %r30
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 1935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xf91da08f  ! 1936: LDDF_I	ldd	[%r22, 0x008f], %f28
	setx	data_start_2, %g1, %r18
	.word 0xfa05213c  ! 1942: LDUW_I	lduw	[%r20 + 0x013c], %r29
	.word 0xb5508000  ! 1944: RDPR_TSTATE	<illegal instruction>
	setx	0x10200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44d8000  ! 1947: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xfc04e120  ! 1953: LDUW_I	lduw	[%r19 + 0x0120], %r30
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf644a080  ! 1956: LDSW_I	ldsw	[%r18 + 0x0080], %r27
	.word 0xfa15c000  ! 1959: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xb550c000  ! 1960: RDPR_TT	rdpr	%tt, %r26
	.word 0xf6552177  ! 1962: LDSH_I	ldsh	[%r20 + 0x0177], %r27
	.word 0xf11ce005  ! 1964: LDDF_I	ldd	[%r19, 0x0005], %f24
	.word 0xbf540000  ! 1966: RDPR_GL	<illegal instruction>
	.word 0xf45d61a5  ! 1971: LDX_I	ldx	[%r21 + 0x01a5], %r26
	.word 0xf11ca19d  ! 1973: LDDF_I	ldd	[%r18, 0x019d], %f24
	.word 0xf21d6031  ! 1974: LDD_I	ldd	[%r21 + 0x0031], %r25
	.word 0xf04d6087  ! 1979: LDSB_I	ldsb	[%r21 + 0x0087], %r24
	.word 0x8d95a0c5  ! 1983: WRPR_PSTATE_I	wrpr	%r22, 0x00c5, %pstate
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa442113  ! 1991: LDSW_I	ldsw	[%r16 + 0x0113], %r29
	.word 0xbcad8000  ! 1993: ANDNcc_R	andncc 	%r22, %r0, %r30
	.word 0xf004e031  ! 1996: LDUW_I	lduw	[%r19 + 0x0031], %r24
	.word 0xba34c000  ! 2000: ORN_R	orn 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983ed1  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed1, %hpstate
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d8000  ! 2010: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xfe458000  ! 2011: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf4148000  ! 2014: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfe4560ba  ! 2017: LDSW_I	ldsw	[%r21 + 0x00ba], %r31
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b40000  ! 2021: ORNcc_R	orncc 	%r16, %r0, %r25
	setx	0x225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952167  ! 2027: WRPR_TICK_I	wrpr	%r20, 0x0167, %tick
	.word 0xf05d8000  ! 2028: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xfc0de0db  ! 2029: LDUB_I	ldub	[%r23 + 0x00db], %r30
	.word 0xfd1d2165  ! 2030: LDDF_I	ldd	[%r20, 0x0165], %f30
	.word 0xfe5dc000  ! 2031: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xfa4c0000  ! 2032: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xfe4d8000  ! 2035: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xb7510000  ! 2037: RDPR_TICK	rdpr	%tick, %r27
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 2040: RDPR_TPC	<illegal instruction>
	.word 0xfe1c0000  ! 2042: LDD_R	ldd	[%r16 + %r0], %r31
	setx	0x30031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2046: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf81cc000  ! 2047: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xfe15a180  ! 2053: LDUH_I	lduh	[%r22 + 0x0180], %r31
	.word 0xbc354000  ! 2056: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xb9540000  ! 2058: RDPR_GL	<illegal instruction>
	.word 0xf8044000  ! 2059: LDUW_R	lduw	[%r17 + %r0], %r28
	setx	data_start_3, %g1, %r22
	.word 0xf455e05e  ! 2065: LDSH_I	ldsh	[%r23 + 0x005e], %r26
	.word 0xfe450000  ! 2069: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xb8354000  ! 2072: SUBC_R	orn 	%r21, %r0, %r28
	setx	data_start_2, %g1, %r22
	.word 0xfe0420b5  ! 2076: LDUW_I	lduw	[%r16 + 0x00b5], %r31
	.word 0xbb510000  ! 2079: RDPR_TICK	<illegal instruction>
	.word 0xbf520000  ! 2081: RDPR_PIL	<illegal instruction>
	.word 0xf84c4000  ! 2083: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf8144000  ! 2084: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf11da16c  ! 2086: LDDF_I	ldd	[%r22, 0x016c], %f24
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0xfa148000  ! 2089: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf01d0000  ! 2090: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0x899521d4  ! 2091: WRPR_TICK_I	wrpr	%r20, 0x01d4, %tick
	.word 0xbb504000  ! 2098: RDPR_TNPC	<illegal instruction>
	.word 0xfe5ca16f  ! 2101: LDX_I	ldx	[%r18 + 0x016f], %r31
	.word 0xb6ad20e6  ! 2103: ANDNcc_I	andncc 	%r20, 0x00e6, %r27
	.word 0xf44cc000  ! 2105: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf4140000  ! 2106: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfe450000  ! 2108: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xbb51c000  ! 2116: RDPR_TL	<illegal instruction>
	.word 0xb20ca12e  ! 2118: AND_I	and 	%r18, 0x012e, %r25
	.word 0xf65da1c2  ! 2120: LDX_I	ldx	[%r22 + 0x01c2], %r27
	.word 0xf2142110  ! 2121: LDUH_I	lduh	[%r16 + 0x0110], %r25
	.word 0xb7520000  ! 2123: RDPR_PIL	<illegal instruction>
	.word 0xfc1d6152  ! 2124: LDD_I	ldd	[%r21 + 0x0152], %r30
	.word 0xfe4d8000  ! 2134: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xf81dc000  ! 2135: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0x81952115  ! 2136: WRPR_TPC_I	wrpr	%r20, 0x0115, %tpc
	.word 0xf60ca199  ! 2139: LDUB_I	ldub	[%r18 + 0x0199], %r27
	.word 0xf04c6174  ! 2140: LDSB_I	ldsb	[%r17 + 0x0174], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc046022  ! 2143: LDUW_I	lduw	[%r17 + 0x0022], %r30
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01ca027  ! 2146: LDD_I	ldd	[%r18 + 0x0027], %r24
	.word 0xfe4c618c  ! 2147: LDSB_I	ldsb	[%r17 + 0x018c], %r31
	.word 0xfe55e146  ! 2149: LDSH_I	ldsh	[%r23 + 0x0146], %r31
	.word 0xb1518000  ! 2150: RDPR_PSTATE	<illegal instruction>
	.word 0x8994a041  ! 2151: WRPR_TICK_I	wrpr	%r18, 0x0041, %tick
	.word 0xf81d0000  ! 2153: LDD_R	ldd	[%r20 + %r0], %r28
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5353001  ! 2157: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xbd500000  ! 2158: RDPR_TPC	<illegal instruction>
	.word 0xf24de118  ! 2160: LDSB_I	ldsb	[%r23 + 0x0118], %r25
	.word 0xfa05a06d  ! 2164: LDUW_I	lduw	[%r22 + 0x006d], %r29
	.word 0xf21c8000  ! 2165: LDD_R	ldd	[%r18 + %r0], %r25
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85ce177  ! 2170: LDX_I	ldx	[%r19 + 0x0177], %r28
	.word 0xf41da011  ! 2171: LDD_I	ldd	[%r22 + 0x0011], %r26
	.word 0xf64de036  ! 2172: LDSB_I	ldsb	[%r23 + 0x0036], %r27
	.word 0x9195e055  ! 2173: WRPR_PIL_I	wrpr	%r23, 0x0055, %pil
	.word 0xfa4c2193  ! 2174: LDSB_I	ldsb	[%r16 + 0x0193], %r29
	.word 0xfc5d20c4  ! 2177: LDX_I	ldx	[%r20 + 0x00c4], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa44a0bc  ! 2185: LDSW_I	ldsw	[%r18 + 0x00bc], %r29
	.word 0x8595a03d  ! 2186: WRPR_TSTATE_I	wrpr	%r22, 0x003d, %tstate
	setx	data_start_5, %g1, %r21
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2193: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf518000  ! 2196: RDPR_PSTATE	<illegal instruction>
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa05c000  ! 2198: LDUW_R	lduw	[%r23 + %r0], %r29
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819460d8  ! 2200: WRPR_TPC_I	wrpr	%r17, 0x00d8, %tpc
	.word 0xbe8c61f6  ! 2201: ANDcc_I	andcc 	%r17, 0x01f6, %r31
	.word 0xfe452082  ! 2203: LDSW_I	ldsw	[%r20 + 0x0082], %r31
	.word 0xfa5c2169  ! 2204: LDX_I	ldx	[%r16 + 0x0169], %r29
	.word 0xf60da1f9  ! 2205: LDUB_I	ldub	[%r22 + 0x01f9], %r27
	.word 0xbd518000  ! 2209: RDPR_PSTATE	<illegal instruction>
	.word 0xba3c210a  ! 2211: XNOR_I	xnor 	%r16, 0x010a, %r29
	.word 0xb82c4000  ! 2213: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xb92df001  ! 2216: SLLX_I	sllx	%r23, 0x0001, %r28
	.word 0x8794a16f  ! 2217: WRPR_TT_I	wrpr	%r18, 0x016f, %tt
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2219: RDPR_TNPC	<illegal instruction>
	.word 0xb7643801  ! 2220: MOVcc_I	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8394e01a  ! 2228: WRPR_TNPC_I	wrpr	%r19, 0x001a, %tnpc
	.word 0xf014c000  ! 2231: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf80d4000  ! 2234: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xbb500000  ! 2239: RDPR_TPC	<illegal instruction>
	.word 0xb3510000  ! 2241: RDPR_TICK	<illegal instruction>
	.word 0xf6148000  ! 2243: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfa55a16a  ! 2244: LDSH_I	ldsh	[%r22 + 0x016a], %r29
	.word 0xf8058000  ! 2245: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xf61561e8  ! 2247: LDUH_I	lduh	[%r21 + 0x01e8], %r27
	.word 0xfe4d4000  ! 2249: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb7540000  ! 2251: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198384b  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184b, %hpstate
	.word 0xb014e005  ! 2255: OR_I	or 	%r19, 0x0005, %r24
	.word 0xf85ce179  ! 2257: LDX_I	ldx	[%r19 + 0x0179], %r28
	.word 0xbeb50000  ! 2264: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0x87956123  ! 2267: WRPR_TT_I	wrpr	%r21, 0x0123, %tt
	.word 0xf4546089  ! 2269: LDSH_I	ldsh	[%r17 + 0x0089], %r26
	.word 0x9194a1d6  ! 2272: WRPR_PIL_I	wrpr	%r18, 0x01d6, %pil
	.word 0xbc35c000  ! 2273: ORN_R	orn 	%r23, %r0, %r30
	mov	1, %r12
	.word 0x8f932000  ! 2278: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3343001  ! 2285: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xf71da13d  ! 2286: LDDF_I	ldd	[%r22, 0x013d], %f27
	.word 0x8594e078  ! 2287: WRPR_TSTATE_I	wrpr	%r19, 0x0078, %tstate
	.word 0xf24c4000  ! 2288: LDSB_R	ldsb	[%r17 + %r0], %r25
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb68d60f6  ! 2290: ANDcc_I	andcc 	%r21, 0x00f6, %r27
	.word 0xf85da1cc  ! 2291: LDX_I	ldx	[%r22 + 0x01cc], %r28
	.word 0xfa450000  ! 2293: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xb5643801  ! 2294: MOVcc_I	<illegal instruction>
	.word 0xf0544000  ! 2297: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xf51ca10c  ! 2298: LDDF_I	ldd	[%r18, 0x010c], %f26
	.word 0xfa45a06c  ! 2300: LDSW_I	ldsw	[%r22 + 0x006c], %r29
	.word 0xfb1c20a4  ! 2306: LDDF_I	ldd	[%r16, 0x00a4], %f29
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d4000  ! 2310: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xb025a0c1  ! 2312: SUB_I	sub 	%r22, 0x00c1, %r24
	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa548000  ! 2314: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xfd1ca08c  ! 2319: LDDF_I	ldd	[%r18, 0x008c], %f30
	.word 0xf0550000  ! 2320: LDSH_R	ldsh	[%r20 + %r0], %r24
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1c6106  ! 2324: LDDF_I	ldd	[%r17, 0x0106], %f29
	.word 0x87942172  ! 2327: WRPR_TT_I	wrpr	%r16, 0x0172, %tt
	.word 0xbe1ce03c  ! 2331: XOR_I	xor 	%r19, 0x003c, %r31
	.word 0xfe554000  ! 2333: LDSH_R	ldsh	[%r21 + %r0], %r31
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01d4000  ! 2335: LDD_R	ldd	[%r21 + %r0], %r24
	setx	data_start_4, %g1, %r18
	.word 0xfc1c0000  ! 2343: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xfe4cc000  ! 2344: LDSB_R	ldsb	[%r19 + %r0], %r31
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc1de176  ! 2348: XOR_I	xor 	%r23, 0x0176, %r30
	.word 0xfa058000  ! 2350: LDUW_R	lduw	[%r22 + %r0], %r29
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20da107  ! 2352: LDUB_I	ldub	[%r22 + 0x0107], %r25
	.word 0xf81c218c  ! 2353: LDD_I	ldd	[%r16 + 0x018c], %r28
	.word 0xf24da012  ! 2355: LDSB_I	ldsb	[%r22 + 0x0012], %r25
	ta	T_CHANGE_HPRIV
	.word 0x8198285b  ! 2356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	setx	data_start_0, %g1, %r21
	mov	1, %r14
	.word 0xa193a000  ! 2359: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf21460d5  ! 2362: LDUH_I	lduh	[%r17 + 0x00d5], %r25
	.word 0xf24cc000  ! 2363: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xf40d8000  ! 2366: LDUB_R	ldub	[%r22 + %r0], %r26
	mov	1, %r12
	.word 0x8f932000  ! 2367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe5da08f  ! 2368: LDX_I	ldx	[%r22 + 0x008f], %r31
	.word 0xfb1c8000  ! 2369: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xfa548000  ! 2370: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf4544000  ! 2371: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb9510000  ! 2372: RDPR_TICK	<illegal instruction>
	.word 0xfb1d20fe  ! 2374: LDDF_I	ldd	[%r20, 0x00fe], %f29
	.word 0x8994e126  ! 2375: WRPR_TICK_I	wrpr	%r19, 0x0126, %tick
	.word 0xf45c0000  ! 2377: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0x8794e10f  ! 2379: WRPR_TT_I	wrpr	%r19, 0x010f, %tt
	.word 0x91946065  ! 2380: WRPR_PIL_I	wrpr	%r17, 0x0065, %pil
	.word 0xb81c6175  ! 2381: XOR_I	xor 	%r17, 0x0175, %r28
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6444000  ! 2388: LDSW_R	ldsw	[%r17 + %r0], %r27
	setx	data_start_4, %g1, %r16
	.word 0xfe4c210d  ! 2394: LDSB_I	ldsb	[%r16 + 0x010d], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf24ce10b  ! 2401: LDSB_I	ldsb	[%r19 + 0x010b], %r25
	.word 0xfe45c000  ! 2402: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xfc544000  ! 2403: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfd1cc000  ! 2407: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xb4ac8000  ! 2411: ANDNcc_R	andncc 	%r18, %r0, %r26
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e169  ! 2417: WRPR_TT_I	wrpr	%r23, 0x0169, %tt
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1ca1bb  ! 2419: LDD_I	ldd	[%r18 + 0x01bb], %r29
	.word 0xb93d1000  ! 2421: SRAX_R	srax	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983bdb  ! 2423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bdb, %hpstate
	.word 0xbf540000  ! 2426: RDPR_GL	<illegal instruction>
	.word 0x8195e061  ! 2427: WRPR_TPC_I	wrpr	%r23, 0x0061, %tpc
	.word 0x87952078  ! 2436: WRPR_TT_I	wrpr	%r20, 0x0078, %tt
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2439: RDPR_GL	<illegal instruction>
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61de11f  ! 2445: LDD_I	ldd	[%r23 + 0x011f], %r27
	.word 0xb8344000  ! 2446: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xf61d0000  ! 2448: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf61c4000  ! 2455: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xf71d0000  ! 2457: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xbeb5c000  ! 2459: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xbf520000  ! 2460: RDPR_PIL	<illegal instruction>
	.word 0xf91c0000  ! 2462: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfc0cc000  ! 2463: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xfa0d211a  ! 2464: LDUB_I	ldub	[%r20 + 0x011a], %r29
	.word 0xf014e166  ! 2465: LDUH_I	lduh	[%r19 + 0x0166], %r24
	.word 0xb09d4000  ! 2467: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xf45421ed  ! 2469: LDSH_I	ldsh	[%r16 + 0x01ed], %r26
	.word 0xf85ce182  ! 2470: LDX_I	ldx	[%r19 + 0x0182], %r28
	.word 0xfc04a085  ! 2471: LDUW_I	lduw	[%r18 + 0x0085], %r30
	.word 0xf45da17f  ! 2473: LDX_I	ldx	[%r22 + 0x017f], %r26
	ta	T_CHANGE_HPRIV
	.word 0x8198294b  ! 2476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094b, %hpstate
	.word 0xf054a185  ! 2478: LDSH_I	ldsh	[%r18 + 0x0185], %r24
	.word 0xb49da176  ! 2490: XORcc_I	xorcc 	%r22, 0x0176, %r26
	.word 0xf404a19f  ! 2495: LDUW_I	lduw	[%r18 + 0x019f], %r26
	.word 0xf24c8000  ! 2496: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xfd1d60bf  ! 2498: LDDF_I	ldd	[%r21, 0x00bf], %f30
	.word 0xf20d4000  ! 2499: LDUB_R	ldub	[%r21 + %r0], %r25
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11ce16b  ! 2511: LDDF_I	ldd	[%r19, 0x016b], %f24
	mov	0, %r14
	.word 0xa193a000  ! 2513: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4840000  ! 2516: ADDcc_R	addcc 	%r16, %r0, %r26
	mov	1, %r14
	.word 0xa193a000  ! 2525: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf855202f  ! 2526: LDSH_I	ldsh	[%r20 + 0x002f], %r28
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1d4000  ! 2533: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf20d8000  ! 2536: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf445c000  ! 2540: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf00ce16e  ! 2542: LDUB_I	ldub	[%r19 + 0x016e], %r24
	.word 0xb9500000  ! 2543: RDPR_TPC	<illegal instruction>
	.word 0xfa0420f6  ! 2547: LDUW_I	lduw	[%r16 + 0x00f6], %r29
	setx	data_start_1, %g1, %r21
	.word 0xb62c606f  ! 2549: ANDN_I	andn 	%r17, 0x006f, %r27
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85de052  ! 2554: LDX_I	ldx	[%r23 + 0x0052], %r28
	.word 0xf4050000  ! 2555: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xfc458000  ! 2557: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xbd500000  ! 2560: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2563: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb614e10d  ! 2567: OR_I	or 	%r19, 0x010d, %r27
	.word 0xb1510000  ! 2569: RDPR_TICK	<illegal instruction>
	.word 0xf05d0000  ! 2574: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf24d0000  ! 2575: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xbb50c000  ! 2576: RDPR_TT	<illegal instruction>
	.word 0xf61c0000  ! 2582: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf2048000  ! 2584: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf054200d  ! 2585: LDSH_I	ldsh	[%r16 + 0x000d], %r24
	.word 0xf91ca1bb  ! 2587: LDDF_I	ldd	[%r18, 0x01bb], %f28
	.word 0xb1480000  ! 2592: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_7, %g1, %r22
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa54c000  ! 2600: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xb68d4000  ! 2604: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xb8440000  ! 2605: ADDC_R	addc 	%r16, %r0, %r28
	mov	0, %r12
	.word 0x8f932000  ! 2607: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb20c602d  ! 2612: AND_I	and 	%r17, 0x002d, %r25
	.word 0x8d95a179  ! 2614: WRPR_PSTATE_I	wrpr	%r22, 0x0179, %pstate
	.word 0xb8948000  ! 2615: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xb7341000  ! 2616: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xf01ce1cb  ! 2617: LDD_I	ldd	[%r19 + 0x01cb], %r24
	.word 0xf00d4000  ! 2618: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf51c60cc  ! 2620: LDDF_I	ldd	[%r17, 0x00cc], %f26
	setx	data_start_4, %g1, %r19
	.word 0xf25460ec  ! 2631: LDSH_I	ldsh	[%r17 + 0x00ec], %r25
	.word 0x859420f4  ! 2633: WRPR_TSTATE_I	wrpr	%r16, 0x00f4, %tstate
	.word 0xf20d8000  ! 2634: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xb1518000  ! 2637: RDPR_PSTATE	<illegal instruction>
	.word 0xb73c8000  ! 2638: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb1359000  ! 2641: SRLX_R	srlx	%r22, %r0, %r24
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf805e1f9  ! 2649: LDUW_I	lduw	[%r23 + 0x01f9], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 2651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0xf01d8000  ! 2654: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xbb500000  ! 2656: RDPR_TPC	<illegal instruction>
	.word 0xf20c6139  ! 2665: LDUB_I	ldub	[%r17 + 0x0139], %r25
	.word 0xf854c000  ! 2673: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf71d21a0  ! 2674: LDDF_I	ldd	[%r20, 0x01a0], %f27
	.word 0xfe1d8000  ! 2685: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xfa1cc000  ! 2686: LDD_R	ldd	[%r19 + %r0], %r29
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1dc000  ! 2690: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xfe1d20a1  ! 2693: LDD_I	ldd	[%r20 + 0x00a1], %r31
	.word 0xba944000  ! 2695: ORcc_R	orcc 	%r17, %r0, %r29
	.word 0xfa54e079  ! 2696: LDSH_I	ldsh	[%r19 + 0x0079], %r29
	.word 0xb0bc4000  ! 2700: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xfa14a17d  ! 2702: LDUH_I	lduh	[%r18 + 0x017d], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 2708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3cc000  ! 2713: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0x8395602d  ! 2714: WRPR_TNPC_I	wrpr	%r21, 0x002d, %tnpc
	.word 0xb62da014  ! 2715: ANDN_I	andn 	%r22, 0x0014, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983bcb  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bcb, %hpstate
	.word 0x8595a0e7  ! 2722: WRPR_TSTATE_I	wrpr	%r22, 0x00e7, %tstate
	setx	data_start_7, %g1, %r18
	.word 0xba158000  ! 2725: OR_R	or 	%r22, %r0, %r29
	.word 0xf60d0000  ! 2726: LDUB_R	ldub	[%r20 + %r0], %r27
	mov	2, %r14
	.word 0xa193a000  ! 2731: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8595a1b0  ! 2732: WRPR_TSTATE_I	wrpr	%r22, 0x01b0, %tstate
	.word 0xf2454000  ! 2736: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf65ce0ee  ! 2739: LDX_I	ldx	[%r19 + 0x00ee], %r27
	.word 0xfa152143  ! 2740: LDUH_I	lduh	[%r20 + 0x0143], %r29
	.word 0xfc1ce177  ! 2744: LDD_I	ldd	[%r19 + 0x0177], %r30
	.word 0x85952113  ! 2745: WRPR_TSTATE_I	wrpr	%r20, 0x0113, %tstate
	.word 0xba8dc000  ! 2746: ANDcc_R	andcc 	%r23, %r0, %r29
	.word 0xf00d4000  ! 2747: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf44d4000  ! 2751: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xf40d0000  ! 2754: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xfd1d21ff  ! 2755: LDDF_I	ldd	[%r20, 0x01ff], %f30
	.word 0x859560f8  ! 2756: WRPR_TSTATE_I	wrpr	%r21, 0x00f8, %tstate
	.word 0xb9504000  ! 2757: RDPR_TNPC	<illegal instruction>
	.word 0xfe5ce188  ! 2760: LDX_I	ldx	[%r19 + 0x0188], %r31
	.word 0x8595a19c  ! 2767: WRPR_TSTATE_I	wrpr	%r22, 0x019c, %tstate
	.word 0xbc1dc000  ! 2771: XOR_R	xor 	%r23, %r0, %r30
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819839db  ! 2776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19db, %hpstate
	.word 0xf71ce0fa  ! 2780: LDDF_I	ldd	[%r19, 0x00fa], %f27
	.word 0xfd1ca1a2  ! 2784: LDDF_I	ldd	[%r18, 0x01a2], %f30
	.word 0x8595a15b  ! 2786: WRPR_TSTATE_I	wrpr	%r22, 0x015b, %tstate
	.word 0xf60d2103  ! 2787: LDUB_I	ldub	[%r20 + 0x0103], %r27
	.word 0xfa5d4000  ! 2789: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf854e1c9  ! 2796: LDSH_I	ldsh	[%r19 + 0x01c9], %r28
	.word 0xfe15a1eb  ! 2799: LDUH_I	lduh	[%r22 + 0x01eb], %r31
	.word 0xbb520000  ! 2801: RDPR_PIL	<illegal instruction>
	.word 0xf4540000  ! 2803: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf85dc000  ! 2805: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf015c000  ! 2806: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xfe0561db  ! 2807: LDUW_I	lduw	[%r21 + 0x01db], %r31
	.word 0xf215c000  ! 2808: LDUH_R	lduh	[%r23 + %r0], %r25
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00c601d  ! 2810: AND_I	and 	%r17, 0x001d, %r24
	.word 0xb3518000  ! 2811: RDPR_PSTATE	<illegal instruction>
	.word 0x8595e1f8  ! 2813: WRPR_TSTATE_I	wrpr	%r23, 0x01f8, %tstate
	.word 0x87952153  ! 2814: WRPR_TT_I	wrpr	%r20, 0x0153, %tt
	.word 0xb9504000  ! 2817: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfe140000  ! 2820: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb6a4e012  ! 2822: SUBcc_I	subcc 	%r19, 0x0012, %r27
	setx	data_start_6, %g1, %r19
	.word 0xfa5cc000  ! 2831: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0x85952049  ! 2832: WRPR_TSTATE_I	wrpr	%r20, 0x0049, %tstate
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02c2164  ! 2836: ANDN_I	andn 	%r16, 0x0164, %r24
	.word 0xf614a1de  ! 2840: LDUH_I	lduh	[%r18 + 0x01de], %r27
	mov	1, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6144000  ! 2842: OR_R	or 	%r17, %r0, %r27
	.word 0xf05cc000  ! 2846: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf8152011  ! 2847: LDUH_I	lduh	[%r20 + 0x0011], %r28
	.word 0xb68da0aa  ! 2848: ANDcc_I	andcc 	%r22, 0x00aa, %r27
	.word 0x85946130  ! 2851: WRPR_TSTATE_I	wrpr	%r17, 0x0130, %tstate
	.word 0xf6542109  ! 2852: LDSH_I	ldsh	[%r16 + 0x0109], %r27
	.word 0xfe148000  ! 2854: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf64421c2  ! 2857: LDSW_I	ldsw	[%r16 + 0x01c2], %r27
	.word 0xb6b4613e  ! 2862: SUBCcc_I	orncc 	%r17, 0x013e, %r27
	.word 0xf4444000  ! 2868: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xb8450000  ! 2869: ADDC_R	addc 	%r20, %r0, %r28
	.word 0x899520ba  ! 2871: WRPR_TICK_I	wrpr	%r20, 0x00ba, %tick
	.word 0xf44420f1  ! 2872: LDSW_I	ldsw	[%r16 + 0x00f1], %r26
	.word 0xbb518000  ! 2873: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f81  ! 2874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f81, %hpstate
	setx	data_start_7, %g1, %r23
	.word 0xfc0c0000  ! 2876: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xfa0c602f  ! 2877: LDUB_I	ldub	[%r17 + 0x002f], %r29
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64421bc  ! 2893: LDSW_I	ldsw	[%r16 + 0x01bc], %r27
	.word 0xfa1c0000  ! 2895: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xf41460d3  ! 2896: LDUH_I	lduh	[%r17 + 0x00d3], %r26
	.word 0xf20c60b8  ! 2898: LDUB_I	ldub	[%r17 + 0x00b8], %r25
	.word 0xfc0c0000  ! 2899: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf11d4000  ! 2900: LDDF_R	ldd	[%r21, %r0], %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983bdb  ! 2902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bdb, %hpstate
	.word 0xb7520000  ! 2903: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf2040000  ! 2909: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf81d4000  ! 2912: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xbd643801  ! 2914: MOVcc_I	<illegal instruction>
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a065  ! 2916: WRPR_TNPC_I	wrpr	%r22, 0x0065, %tnpc
	.word 0xf71ca1db  ! 2917: LDDF_I	ldd	[%r18, 0x01db], %f27
	.word 0xf6148000  ! 2920: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfc4de1c9  ! 2926: LDSB_I	ldsb	[%r23 + 0x01c9], %r30
	setx	data_start_5, %g1, %r20
	.word 0xf85d0000  ! 2928: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xfe546061  ! 2933: LDSH_I	ldsh	[%r17 + 0x0061], %r31
	.word 0xbe850000  ! 2935: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xbcc4a1a5  ! 2937: ADDCcc_I	addccc 	%r18, 0x01a5, %r30
	.word 0x87956194  ! 2940: WRPR_TT_I	wrpr	%r21, 0x0194, %tt
	.word 0xfc454000  ! 2941: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xfa0ca121  ! 2942: LDUB_I	ldub	[%r18 + 0x0121], %r29
	.word 0x8394e131  ! 2945: WRPR_TNPC_I	wrpr	%r19, 0x0131, %tnpc
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394600d  ! 2948: WRPR_TNPC_I	wrpr	%r17, 0x000d, %tnpc
	.word 0xb7480000  ! 2957: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198288b  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088b, %hpstate
	.word 0xba1c8000  ! 2960: XOR_R	xor 	%r18, %r0, %r29
	.word 0xf45d0000  ! 2966: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xfc558000  ! 2973: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xbb510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0x819461aa  ! 2978: WRPR_TPC_I	wrpr	%r17, 0x01aa, %tpc
	.word 0xb6bd6103  ! 2981: XNORcc_I	xnorcc 	%r21, 0x0103, %r27
	.word 0x8395612f  ! 2982: WRPR_TNPC_I	wrpr	%r21, 0x012f, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983c1b  ! 2985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1b, %hpstate
	.word 0xfb1c20a2  ! 2989: LDDF_I	ldd	[%r16, 0x00a2], %f29
	.word 0xfe5da0c4  ! 2990: LDX_I	ldx	[%r22 + 0x00c4], %r31
	.word 0xfa5cc000  ! 2992: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf40ca07f  ! 2994: LDUB_I	ldub	[%r18 + 0x007f], %r26
	.word 0xb3504000  ! 2997: RDPR_TNPC	<illegal instruction>
	.word 0xfa150000  ! 2998: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xfc458000  ! 2999: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xf11c2159  ! 3000: LDDF_I	ldd	[%r16, 0x0159], %f24
	.word 0xf0554000  ! 3003: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xb334b001  ! 3005: SRLX_I	srlx	%r18, 0x0001, %r25
	setx	data_start_4, %g1, %r17
	.word 0xf845a15c  ! 3010: LDSW_I	ldsw	[%r22 + 0x015c], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd540000  ! 3018: RDPR_GL	<illegal instruction>
	.word 0xb3518000  ! 3024: RDPR_PSTATE	<illegal instruction>
	.word 0xf20d6100  ! 3026: LDUB_I	ldub	[%r21 + 0x0100], %r25
	.word 0xf84dc000  ! 3029: LDSB_R	ldsb	[%r23 + %r0], %r28
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0b4e1e3  ! 3037: ORNcc_I	orncc 	%r19, 0x01e3, %r24
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198290b  ! 3040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090b, %hpstate
	.word 0xb4b54000  ! 3041: ORNcc_R	orncc 	%r21, %r0, %r26
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf254206b  ! 3044: LDSH_I	ldsh	[%r16 + 0x006b], %r25
	.word 0xf4552118  ! 3045: LDSH_I	ldsh	[%r20 + 0x0118], %r26
	.word 0xbd51c000  ! 3046: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d93  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d93, %hpstate
	.word 0xb5540000  ! 3049: RDPR_GL	rdpr	%-, %r26
	.word 0xbc0c8000  ! 3050: AND_R	and 	%r18, %r0, %r30
	setx	data_start_6, %g1, %r20
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	.word 0x81983849  ! 3058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1849, %hpstate
	.word 0xf644e1f3  ! 3059: LDSW_I	ldsw	[%r19 + 0x01f3], %r27
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c8000  ! 3062: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xb93d5000  ! 3066: SRAX_R	srax	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf004a0fc  ! 3071: LDUW_I	lduw	[%r18 + 0x00fc], %r24
	.word 0xf71c216c  ! 3072: LDDF_I	ldd	[%r16, 0x016c], %f27
	.word 0xf4452165  ! 3075: LDSW_I	ldsw	[%r20 + 0x0165], %r26
	.word 0xf40d4000  ! 3076: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xb09420c2  ! 3077: ORcc_I	orcc 	%r16, 0x00c2, %r24
	.word 0xf01520d6  ! 3079: LDUH_I	lduh	[%r20 + 0x00d6], %r24
	.word 0xfe5d0000  ! 3080: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xff1d0000  ! 3081: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xb550c000  ! 3087: RDPR_TT	<illegal instruction>
	.word 0x8395e122  ! 3088: WRPR_TNPC_I	wrpr	%r23, 0x0122, %tnpc
	mov	1, %r12
	.word 0x8f932000  ! 3090: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9508000  ! 3091: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 3095: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 3097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xb1540000  ! 3107: RDPR_GL	rdpr	%-, %r24
	.word 0xfa4ca162  ! 3109: LDSB_I	ldsb	[%r18 + 0x0162], %r29
	.word 0xf45cc000  ! 3113: LDX_R	ldx	[%r19 + %r0], %r26
	setx	data_start_1, %g1, %r16
	.word 0xfa0460ed  ! 3117: LDUW_I	lduw	[%r17 + 0x00ed], %r29
	.word 0xb4bd4000  ! 3119: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xf0140000  ! 3120: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf2154000  ! 3125: LDUH_R	lduh	[%r21 + %r0], %r25
	setx	data_start_6, %g1, %r22
	mov	2, %r12
	.word 0x8f932000  ! 3127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3540000  ! 3129: RDPR_GL	rdpr	%-, %r25
	.word 0xf41461f5  ! 3130: LDUH_I	lduh	[%r17 + 0x01f5], %r26
	.word 0xbd504000  ! 3132: RDPR_TNPC	<illegal instruction>
	.word 0xbab58000  ! 3134: ORNcc_R	orncc 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b03  ! 3136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b03, %hpstate
	setx	0x2012b, %g1, %o0
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
	.word 0xb7520000  ! 3143: RDPR_PIL	<illegal instruction>
	.word 0xb43560a8  ! 3155: ORN_I	orn 	%r21, 0x00a8, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0da067  ! 3161: LDUB_I	ldub	[%r22 + 0x0067], %r30
	.word 0xb1510000  ! 3162: RDPR_TICK	<illegal instruction>
	.word 0xb1480000  ! 3163: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xba340000  ! 3164: SUBC_R	orn 	%r16, %r0, %r29
	.word 0xfe044000  ! 3168: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xbf540000  ! 3169: RDPR_GL	<illegal instruction>
	.word 0xfc0d6136  ! 3170: LDUB_I	ldub	[%r21 + 0x0136], %r30
	.word 0xf254a150  ! 3173: LDSH_I	ldsh	[%r18 + 0x0150], %r25
	.word 0xb415a048  ! 3176: OR_I	or 	%r22, 0x0048, %r26
	.word 0xfa554000  ! 3177: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfe44c000  ! 3178: LDSW_R	ldsw	[%r19 + %r0], %r31
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe154000  ! 3184: LDUH_R	lduh	[%r21 + %r0], %r31
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0xf6558000  ! 3193: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf2158000  ! 3194: LDUH_R	lduh	[%r22 + %r0], %r25
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05de1e4  ! 3202: LDX_I	ldx	[%r23 + 0x01e4], %r24
	.word 0xb03c21a9  ! 3203: XNOR_I	xnor 	%r16, 0x01a9, %r24
	.word 0xf21cc000  ! 3204: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xb351c000  ! 3210: RDPR_TL	<illegal instruction>
	.word 0xb034e01a  ! 3214: ORN_I	orn 	%r19, 0x001a, %r24
	.word 0xb89d8000  ! 3218: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0x8d95609d  ! 3221: WRPR_PSTATE_I	wrpr	%r21, 0x009d, %pstate
	.word 0xfc050000  ! 3222: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf415e185  ! 3224: LDUH_I	lduh	[%r23 + 0x0185], %r26
	setx	data_start_3, %g1, %r21
	.word 0xfa0d8000  ! 3227: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf04c8000  ! 3229: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0x8d9420c3  ! 3231: WRPR_PSTATE_I	wrpr	%r16, 0x00c3, %pstate
	.word 0xfc44c000  ! 3233: LDSW_R	ldsw	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 3234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xfc1d0000  ! 3238: LDD_R	ldd	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8594218f  ! 3241: WRPR_TSTATE_I	wrpr	%r16, 0x018f, %tstate
	.word 0xfc0ce065  ! 3242: LDUB_I	ldub	[%r19 + 0x0065], %r30
	.word 0xf645211b  ! 3246: LDSW_I	ldsw	[%r20 + 0x011b], %r27
	.word 0xf65c8000  ! 3247: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf804c000  ! 3249: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xf11da189  ! 3250: LDDF_I	ldd	[%r22, 0x0189], %f24
	.word 0xb7504000  ! 3252: RDPR_TNPC	<illegal instruction>
	.word 0xbb2d3001  ! 3254: SLLX_I	sllx	%r20, 0x0001, %r29
	.word 0xfe4ca037  ! 3255: LDSB_I	ldsb	[%r18 + 0x0037], %r31
	.word 0xfa0da06a  ! 3260: LDUB_I	ldub	[%r22 + 0x006a], %r29
	.word 0xbead4000  ! 3262: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xfd1d612a  ! 3263: LDDF_I	ldd	[%r21, 0x012a], %f30
	.word 0xfa4d60bd  ! 3265: LDSB_I	ldsb	[%r21 + 0x00bd], %r29
	.word 0xb9520000  ! 3273: RDPR_PIL	<illegal instruction>
	.word 0xf055e085  ! 3274: LDSH_I	ldsh	[%r23 + 0x0085], %r24
	.word 0xfe1d4000  ! 3275: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xbb510000  ! 3277: RDPR_TICK	<illegal instruction>
	.word 0xb3540000  ! 3279: RDPR_GL	<illegal instruction>
	.word 0xb0b54000  ! 3280: SUBCcc_R	orncc 	%r21, %r0, %r24
	mov	0, %r12
	.word 0x8f932000  ! 3282: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1d7  ! 3287: WRPR_TICK_I	wrpr	%r18, 0x01d7, %tick
	.word 0xb41560d4  ! 3288: OR_I	or 	%r21, 0x00d4, %r26
	.word 0xf605a1de  ! 3294: LDUW_I	lduw	[%r22 + 0x01de], %r27
	.word 0xfa0c0000  ! 3296: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xb97d6401  ! 3299: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xfa45a1de  ! 3301: LDSW_I	ldsw	[%r22 + 0x01de], %r29
	.word 0xb9518000  ! 3302: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3303: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 3305: RDPR_TICK	<illegal instruction>
	.word 0xfc45c000  ! 3309: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb824c000  ! 3311: SUB_R	sub 	%r19, %r0, %r28
	.word 0xf85520c3  ! 3312: LDSH_I	ldsh	[%r20 + 0x00c3], %r28
	.word 0xf80561a5  ! 3314: LDUW_I	lduw	[%r21 + 0x01a5], %r28
	.word 0xf404e100  ! 3315: LDUW_I	lduw	[%r19 + 0x0100], %r26
	.word 0xfa0ca175  ! 3317: LDUB_I	ldub	[%r18 + 0x0175], %r29
	.word 0xb68c21b9  ! 3319: ANDcc_I	andcc 	%r16, 0x01b9, %r27
	.word 0xf05c4000  ! 3321: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf805c000  ! 3322: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfa5c0000  ! 3323: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfc0ca185  ! 3324: LDUB_I	ldub	[%r18 + 0x0185], %r30
	.word 0xf8544000  ! 3325: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0x8394a0a3  ! 3326: WRPR_TNPC_I	wrpr	%r18, 0x00a3, %tnpc
	.word 0x8994a04e  ! 3328: WRPR_TICK_I	wrpr	%r18, 0x004e, %tick
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0254000  ! 3339: SUB_R	sub 	%r21, %r0, %r24
	setx	data_start_3, %g1, %r18
	.word 0x8794e0c9  ! 3344: WRPR_TT_I	wrpr	%r19, 0x00c9, %tt
	.word 0xfc04c000  ! 3349: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xf0154000  ! 3350: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xf2046119  ! 3351: LDUW_I	lduw	[%r17 + 0x0119], %r25
	.word 0xf01c4000  ! 3353: LDD_R	ldd	[%r17 + %r0], %r24
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3c8000  ! 3355: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xbb500000  ! 3356: RDPR_TPC	<illegal instruction>
	.word 0xf41c4000  ! 3357: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0x8d946024  ! 3363: WRPR_PSTATE_I	wrpr	%r17, 0x0024, %pstate
	.word 0xf8142112  ! 3367: LDUH_I	lduh	[%r16 + 0x0112], %r28
	.word 0xb8c58000  ! 3368: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xfc5de1e7  ! 3369: LDX_I	ldx	[%r23 + 0x01e7], %r30
	.word 0xf2448000  ! 3371: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0x8194a035  ! 3372: WRPR_TPC_I	wrpr	%r18, 0x0035, %tpc
	.word 0xf41de0a5  ! 3374: LDD_I	ldd	[%r23 + 0x00a5], %r26
	.word 0xf84c61b3  ! 3376: LDSB_I	ldsb	[%r17 + 0x01b3], %r28
	.word 0xf015c000  ! 3379: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xfe45a0f3  ! 3381: LDSW_I	ldsw	[%r22 + 0x00f3], %r31
	.word 0xf04cc000  ! 3385: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf4140000  ! 3390: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xbb510000  ! 3391: RDPR_TICK	<illegal instruction>
	.word 0xb835e173  ! 3394: SUBC_I	orn 	%r23, 0x0173, %r28
	.word 0xb9508000  ! 3398: RDPR_TSTATE	<illegal instruction>
	.word 0xfa0d0000  ! 3400: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0x8795217e  ! 3402: WRPR_TT_I	wrpr	%r20, 0x017e, %tt
	.word 0xf00d6178  ! 3404: LDUB_I	ldub	[%r21 + 0x0178], %r24
	setx	data_start_6, %g1, %r18
	.word 0x8d95a18c  ! 3407: WRPR_PSTATE_I	wrpr	%r22, 0x018c, %pstate
	.word 0x83946087  ! 3411: WRPR_TNPC_I	wrpr	%r17, 0x0087, %tnpc
	.word 0xb5480000  ! 3412: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf65cc000  ! 3413: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xfa054000  ! 3419: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xfa1ce110  ! 3421: LDD_I	ldd	[%r19 + 0x0110], %r29
	.word 0xb73c5000  ! 3424: SRAX_R	srax	%r17, %r0, %r27
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e0ed  ! 3432: WRPR_TT_I	wrpr	%r23, 0x00ed, %tt
	.word 0xb7504000  ! 3434: RDPR_TNPC	<illegal instruction>
	.word 0xfc0c4000  ! 3436: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf44d20c4  ! 3437: LDSB_I	ldsb	[%r20 + 0x00c4], %r26
	.word 0xf00d610d  ! 3439: LDUB_I	ldub	[%r21 + 0x010d], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983989  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1989, %hpstate
	.word 0xfe442092  ! 3441: LDSW_I	ldsw	[%r16 + 0x0092], %r31
	.word 0xb7518000  ! 3442: RDPR_PSTATE	<illegal instruction>
	.word 0xb9518000  ! 3443: RDPR_PSTATE	<illegal instruction>
	.word 0xfa44c000  ! 3444: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0x8195e0a2  ! 3453: WRPR_TPC_I	wrpr	%r23, 0x00a2, %tpc
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa544000  ! 3456: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfa4d4000  ! 3458: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf44d6053  ! 3460: LDSB_I	ldsb	[%r21 + 0x0053], %r26
	.word 0xf245c000  ! 3463: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb5520000  ! 3466: RDPR_PIL	<illegal instruction>
	.word 0xf25da00c  ! 3470: LDX_I	ldx	[%r22 + 0x000c], %r25
	.word 0xfe5da1fb  ! 3472: LDX_I	ldx	[%r22 + 0x01fb], %r31
	.word 0xfc0dc000  ! 3474: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf6558000  ! 3475: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xfa1ca064  ! 3476: LDD_I	ldd	[%r18 + 0x0064], %r29
	.word 0xf044a072  ! 3480: LDSW_I	ldsw	[%r18 + 0x0072], %r24
	.word 0xf61dc000  ! 3482: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf6044000  ! 3483: LDUW_R	lduw	[%r17 + %r0], %r27
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 3490: RDPR_PIL	<illegal instruction>
	.word 0xf25dc000  ! 3502: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0x9195e035  ! 3504: WRPR_PIL_I	wrpr	%r23, 0x0035, %pil
	.word 0xf65ca0fc  ! 3505: LDX_I	ldx	[%r18 + 0x00fc], %r27
	.word 0xb0948000  ! 3506: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xba8ce019  ! 3508: ANDcc_I	andcc 	%r19, 0x0019, %r29
	.word 0xbd520000  ! 3509: RDPR_PIL	<illegal instruction>
	.word 0xb5510000  ! 3510: RDPR_TICK	<illegal instruction>
	.word 0xf20d4000  ! 3513: LDUB_R	ldub	[%r21 + %r0], %r25
	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d2145  ! 3516: LDD_I	ldd	[%r20 + 0x0145], %r31
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c8000  ! 3523: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xf045e06d  ! 3524: LDSW_I	ldsw	[%r23 + 0x006d], %r24
	.word 0xb69de03d  ! 3525: XORcc_I	xorcc 	%r23, 0x003d, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf01c8000  ! 3531: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfe4ca0de  ! 3534: LDSB_I	ldsb	[%r18 + 0x00de], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 3537: RDPR_TICK	<illegal instruction>
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8042131  ! 3540: LDUW_I	lduw	[%r16 + 0x0131], %r28
	.word 0xbc050000  ! 3543: ADD_R	add 	%r20, %r0, %r30
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e1c9  ! 3559: WRPR_TSTATE_I	wrpr	%r19, 0x01c9, %tstate
	.word 0xbb518000  ! 3561: RDPR_PSTATE	<illegal instruction>
	.word 0xfd1dc000  ! 3562: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xfe55603e  ! 3574: LDSH_I	ldsh	[%r21 + 0x003e], %r31
	.word 0xfa4d0000  ! 3575: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf8156190  ! 3580: LDUH_I	lduh	[%r21 + 0x0190], %r28
	.word 0xfc048000  ! 3581: LDUW_R	lduw	[%r18 + %r0], %r30
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00cc000  ! 3589: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xfa54c000  ! 3590: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0x8195619e  ! 3596: WRPR_TPC_I	wrpr	%r21, 0x019e, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb351c000  ! 3598: RDPR_TL	<illegal instruction>
	.word 0xba1da116  ! 3600: XOR_I	xor 	%r22, 0x0116, %r29
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25ca0ae  ! 3614: LDX_I	ldx	[%r18 + 0x00ae], %r25
	.word 0xb1510000  ! 3615: RDPR_TICK	<illegal instruction>
	.word 0xfc546193  ! 3616: LDSH_I	ldsh	[%r17 + 0x0193], %r30
	.word 0xb350c000  ! 3619: RDPR_TT	<illegal instruction>
	.word 0xfa1c207f  ! 3622: LDD_I	ldd	[%r16 + 0x007f], %r29
	.word 0xf85c8000  ! 3623: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf31de058  ! 3624: LDDF_I	ldd	[%r23, 0x0058], %f25
	.word 0xf455c000  ! 3625: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xb68de0fb  ! 3629: ANDcc_I	andcc 	%r23, 0x00fb, %r27
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e0e7  ! 3631: WRPR_TT_I	wrpr	%r19, 0x00e7, %tt
	.word 0xb8c42080  ! 3632: ADDCcc_I	addccc 	%r16, 0x0080, %r28
	.word 0xfc4ce1e0  ! 3642: LDSB_I	ldsb	[%r19 + 0x01e0], %r30
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe9da030  ! 3645: XORcc_I	xorcc 	%r22, 0x0030, %r31
	.word 0xf81ca1e8  ! 3648: LDD_I	ldd	[%r18 + 0x01e8], %r28
	.word 0xb29cc000  ! 3650: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb1500000  ! 3651: RDPR_TPC	<illegal instruction>
	.word 0xf84c4000  ! 3653: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0x81946028  ! 3654: WRPR_TPC_I	wrpr	%r17, 0x0028, %tpc
	.word 0xfa1460a6  ! 3655: LDUH_I	lduh	[%r17 + 0x00a6], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982d9b  ! 3656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0xbb540000  ! 3658: RDPR_GL	<illegal instruction>
	.word 0xfe550000  ! 3660: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xfe45e03a  ! 3662: LDSW_I	ldsw	[%r23 + 0x003a], %r31
	.word 0xb1510000  ! 3663: RDPR_TICK	<illegal instruction>
	.word 0xfa5de01a  ! 3665: LDX_I	ldx	[%r23 + 0x001a], %r29
	.word 0xf0558000  ! 3666: LDSH_R	ldsh	[%r22 + %r0], %r24
	setx	data_start_3, %g1, %r20
	.word 0xf214a1c2  ! 3668: LDUH_I	lduh	[%r18 + 0x01c2], %r25
	setx	data_start_6, %g1, %r21
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf005c000  ! 3671: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfa0c4000  ! 3673: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0x859420d8  ! 3676: WRPR_TSTATE_I	wrpr	%r16, 0x00d8, %tstate
	.word 0xfa040000  ! 3677: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb83c4000  ! 3678: XNOR_R	xnor 	%r17, %r0, %r28
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e118  ! 3681: WRPR_PSTATE_I	wrpr	%r19, 0x0118, %pstate
	.word 0x81942147  ! 3683: WRPR_TPC_I	wrpr	%r16, 0x0147, %tpc
	.word 0xf254e1e5  ! 3684: LDSH_I	ldsh	[%r19 + 0x01e5], %r25
	.word 0xfa458000  ! 3686: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf2558000  ! 3690: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf60ce07f  ! 3691: LDUB_I	ldub	[%r19 + 0x007f], %r27
	.word 0xb2340000  ! 3695: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xf20cc000  ! 3696: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xfa0da0a4  ! 3697: LDUB_I	ldub	[%r22 + 0x00a4], %r29
	.word 0xfa0c6151  ! 3702: LDUB_I	ldub	[%r17 + 0x0151], %r29
	.word 0xf6548000  ! 3708: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xfa14203b  ! 3711: LDUH_I	lduh	[%r16 + 0x003b], %r29
	.word 0xb6c48000  ! 3714: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xfc05e0fc  ! 3716: LDUW_I	lduw	[%r23 + 0x00fc], %r30
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 3720: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95606f  ! 3721: WRPR_PSTATE_I	wrpr	%r21, 0x006f, %pstate
	.word 0xf44c4000  ! 3724: LDSB_R	ldsb	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b9b  ! 3725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9b, %hpstate
	.word 0xb6c56128  ! 3727: ADDCcc_I	addccc 	%r21, 0x0128, %r27
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 3735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	.word 0x8194a1e0  ! 3745: WRPR_TPC_I	wrpr	%r18, 0x01e0, %tpc
	.word 0xb69ce009  ! 3748: XORcc_I	xorcc 	%r19, 0x0009, %r27
	.word 0xf91dc000  ! 3751: LDDF_R	ldd	[%r23, %r0], %f28
	setx	0x20316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204c000  ! 3761: LDUW_R	lduw	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0x8f932000  ! 3763: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 3767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2450000  ! 3774: LDSW_R	ldsw	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982859  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0xfe5cc000  ! 3780: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xb151c000  ! 3781: RDPR_TL	<illegal instruction>
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80c0000  ! 3785: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf85dc000  ! 3789: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb72d7001  ! 3790: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0x8395a090  ! 3792: WRPR_TNPC_I	wrpr	%r22, 0x0090, %tnpc
	.word 0xf85dc000  ! 3794: LDX_R	ldx	[%r23 + %r0], %r28
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 3803: RDPR_TL	<illegal instruction>
	.word 0x839560ab  ! 3804: WRPR_TNPC_I	wrpr	%r21, 0x00ab, %tnpc
	.word 0xfc5c2022  ! 3806: LDX_I	ldx	[%r16 + 0x0022], %r30
	.word 0xb3508000  ! 3809: RDPR_TSTATE	<illegal instruction>
	.word 0xfe0c0000  ! 3810: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xb1643801  ! 3812: MOVcc_I	<illegal instruction>
	.word 0xf04c8000  ! 3813: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0x8d9461f3  ! 3814: WRPR_PSTATE_I	wrpr	%r17, 0x01f3, %pstate
	.word 0x8194e1db  ! 3820: WRPR_TPC_I	wrpr	%r19, 0x01db, %tpc
	.word 0xbb51c000  ! 3821: RDPR_TL	<illegal instruction>
	.word 0xf21c6177  ! 3822: LDD_I	ldd	[%r17 + 0x0177], %r25
	.word 0xf64c0000  ! 3827: LDSB_R	ldsb	[%r16 + %r0], %r27
	setx	data_start_7, %g1, %r20
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41dc000  ! 3832: LDD_R	ldd	[%r23 + %r0], %r26
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc858000  ! 3837: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xf81ca1cb  ! 3842: LDD_I	ldd	[%r18 + 0x01cb], %r28
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195618b  ! 3849: WRPR_PIL_I	wrpr	%r21, 0x018b, %pil
	.word 0xfa046002  ! 3853: LDUW_I	lduw	[%r17 + 0x0002], %r29
	.word 0xf84da14c  ! 3856: LDSB_I	ldsb	[%r22 + 0x014c], %r28
	.word 0xb3518000  ! 3858: RDPR_PSTATE	<illegal instruction>
	.word 0xbc45e1bc  ! 3860: ADDC_I	addc 	%r23, 0x01bc, %r30
	.word 0xf844e0bb  ! 3865: LDSW_I	ldsw	[%r19 + 0x00bb], %r28
	.word 0xf85da117  ! 3866: LDX_I	ldx	[%r22 + 0x0117], %r28
	.word 0xf00dc000  ! 3867: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xb750c000  ! 3870: RDPR_TT	<illegal instruction>
	.word 0xf65d2075  ! 3872: LDX_I	ldx	[%r20 + 0x0075], %r27
	.word 0xfc4d61fc  ! 3873: LDSB_I	ldsb	[%r21 + 0x01fc], %r30
	.word 0xb49cc000  ! 3874: XORcc_R	xorcc 	%r19, %r0, %r26
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d4000  ! 3881: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xb1518000  ! 3882: RDPR_PSTATE	<illegal instruction>
	.word 0xf4442119  ! 3884: LDSW_I	ldsw	[%r16 + 0x0119], %r26
	.word 0xfe0ca197  ! 3888: LDUB_I	ldub	[%r18 + 0x0197], %r31
	.word 0xfe0560cb  ! 3892: LDUW_I	lduw	[%r21 + 0x00cb], %r31
	.word 0xf64d6115  ! 3896: LDSB_I	ldsb	[%r21 + 0x0115], %r27
	.word 0xb4b420a3  ! 3898: ORNcc_I	orncc 	%r16, 0x00a3, %r26
	.word 0xfc5d203a  ! 3899: LDX_I	ldx	[%r20 + 0x003a], %r30
	.word 0xb63d60b2  ! 3907: XNOR_I	xnor 	%r21, 0x00b2, %r27
	.word 0xb3500000  ! 3910: RDPR_TPC	<illegal instruction>
	.word 0xbe150000  ! 3912: OR_R	or 	%r20, %r0, %r31
	.word 0xb3518000  ! 3915: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983bc1  ! 3916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc1, %hpstate
	.word 0xb60c6045  ! 3918: AND_I	and 	%r17, 0x0045, %r27
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2156178  ! 3921: LDUH_I	lduh	[%r21 + 0x0178], %r25
	setx	0x324, %g1, %o0
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
	setx	data_start_0, %g1, %r17
	.word 0xbac4a1cf  ! 3941: ADDCcc_I	addccc 	%r18, 0x01cf, %r29
	.word 0x8594e1d1  ! 3943: WRPR_TSTATE_I	wrpr	%r19, 0x01d1, %tstate
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6548000  ! 3950: LDSH_R	ldsh	[%r18 + %r0], %r27
	mov	0, %r14
	.word 0xa193a000  ! 3952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r22
	.word 0xfe1c0000  ! 3954: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xfc04209f  ! 3959: LDUW_I	lduw	[%r16 + 0x009f], %r30
	.word 0xf04c0000  ! 3964: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xb3504000  ! 3965: RDPR_TNPC	<illegal instruction>
	.word 0xf215c000  ! 3968: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfc0da0c6  ! 3974: LDUB_I	ldub	[%r22 + 0x00c6], %r30
	.word 0xf645e0c9  ! 3976: LDSW_I	ldsw	[%r23 + 0x00c9], %r27
	.word 0xb5504000  ! 3978: RDPR_TNPC	<illegal instruction>
	.word 0xfa144000  ! 3981: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xfc1d215e  ! 3985: LDD_I	ldd	[%r20 + 0x015e], %r30
	.word 0xf25c6038  ! 3987: LDX_I	ldx	[%r17 + 0x0038], %r25
	.word 0xfa1d8000  ! 3990: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0x8195e1ad  ! 3991: WRPR_TPC_I	wrpr	%r23, 0x01ad, %tpc
	.word 0xf2544000  ! 3993: LDSH_R	ldsh	[%r17 + %r0], %r25
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb885a04d  ! 4001: ADDcc_I	addcc 	%r22, 0x004d, %r28
	.word 0xfe54c000  ! 4003: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf85520a2  ! 4006: LDSH_I	ldsh	[%r20 + 0x00a2], %r28
	.word 0xf00d61b1  ! 4010: LDUB_I	ldub	[%r21 + 0x01b1], %r24
	.word 0xb425600f  ! 4011: SUB_I	sub 	%r21, 0x000f, %r26
	.word 0x8195e08b  ! 4013: WRPR_TPC_I	wrpr	%r23, 0x008b, %tpc
	.word 0xf6444000  ! 4014: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xfa0ce08d  ! 4019: LDUB_I	ldub	[%r19 + 0x008d], %r29
	mov	1, %r14
	.word 0xa193a000  ! 4021: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd504000  ! 4022: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeac4000  ! 4024: ANDNcc_R	andncc 	%r17, %r0, %r31
	.word 0xbf518000  ! 4025: RDPR_PSTATE	<illegal instruction>
	.word 0xf2550000  ! 4030: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf45c8000  ! 4032: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf615e08c  ! 4035: LDUH_I	lduh	[%r23 + 0x008c], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983993  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1993, %hpstate
	.word 0xbf50c000  ! 4037: RDPR_TT	<illegal instruction>
	.word 0xb2a48000  ! 4041: SUBcc_R	subcc 	%r18, %r0, %r25
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 4046: RDPR_TPC	<illegal instruction>
	.word 0xf71d61c5  ! 4047: LDDF_I	ldd	[%r21, 0x01c5], %f27
	.word 0xf05de028  ! 4051: LDX_I	ldx	[%r23 + 0x0028], %r24
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 4054: RDPR_TICK	<illegal instruction>
	.word 0xf85c0000  ! 4055: LDX_R	ldx	[%r16 + %r0], %r28
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8440000  ! 4059: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xf45c0000  ! 4063: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xb33cf001  ! 4064: SRAX_I	srax	%r19, 0x0001, %r25
	.word 0xf205a1d9  ! 4067: LDUW_I	lduw	[%r22 + 0x01d9], %r25
	.word 0xf21d20fb  ! 4068: LDD_I	ldd	[%r20 + 0x00fb], %r25
	.word 0xb1510000  ! 4069: RDPR_TICK	<illegal instruction>
	.word 0xfa15e100  ! 4072: LDUH_I	lduh	[%r23 + 0x0100], %r29
	.word 0xf215e0f6  ! 4074: LDUH_I	lduh	[%r23 + 0x00f6], %r25
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc04a1ea  ! 4083: LDUW_I	lduw	[%r18 + 0x01ea], %r30
	.word 0xf454603d  ! 4084: LDSH_I	ldsh	[%r17 + 0x003d], %r26
	.word 0xf405e088  ! 4085: LDUW_I	lduw	[%r23 + 0x0088], %r26
	.word 0xfe454000  ! 4086: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xf2054000  ! 4087: LDUW_R	lduw	[%r21 + %r0], %r25
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3d0000  ! 4093: SRA_R	sra 	%r20, %r0, %r30
	.word 0xfc554000  ! 4094: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf24c8000  ! 4095: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xf45c0000  ! 4098: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xbd540000  ! 4105: RDPR_GL	<illegal instruction>
	.word 0xb60560a9  ! 4111: ADD_I	add 	%r21, 0x00a9, %r27
	setx	0x3022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2c5000  ! 4114: SLLX_R	sllx	%r17, %r0, %r30
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4120: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4122: RDPR_TICK	<illegal instruction>
	.word 0xfa540000  ! 4125: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bd20bb  ! 4138: XNORcc_I	xnorcc 	%r20, 0x00bb, %r27
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4142: RDPR_TT	<illegal instruction>
	.word 0xfa440000  ! 4146: LDSW_R	ldsw	[%r16 + %r0], %r29
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb97de401  ! 4152: MOVR_I	movre	%r23, 0x1, %r28
	mov	2, %r14
	.word 0xa193a000  ! 4153: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8a4c000  ! 4154: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xf65cc000  ! 4156: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf045a011  ! 4158: LDSW_I	ldsw	[%r22 + 0x0011], %r24
	.word 0xb351c000  ! 4160: RDPR_TL	<illegal instruction>
	.word 0xf84c4000  ! 4162: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xbc958000  ! 4163: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xf00ca1c1  ! 4164: LDUB_I	ldub	[%r18 + 0x01c1], %r24
	.word 0xbebde17f  ! 4166: XNORcc_I	xnorcc 	%r23, 0x017f, %r31
	.word 0xb42c8000  ! 4167: ANDN_R	andn 	%r18, %r0, %r26
	.word 0x9195e04b  ! 4168: WRPR_PIL_I	wrpr	%r23, 0x004b, %pil
	setx	data_start_6, %g1, %r16
	.word 0xbeb40000  ! 4175: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xb9508000  ! 4179: RDPR_TSTATE	<illegal instruction>
	.word 0xf8448000  ! 4180: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfd1c4000  ! 4181: LDDF_R	ldd	[%r17, %r0], %f30
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0148000  ! 4184: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xb5504000  ! 4189: RDPR_TNPC	<illegal instruction>
	.word 0xfc5d0000  ! 4193: LDX_R	ldx	[%r20 + %r0], %r30
	mov	2, %r14
	.word 0xa193a000  ! 4195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x899521b0  ! 4197: WRPR_TICK_I	wrpr	%r20, 0x01b0, %tick
	mov	2, %r12
	.word 0x8f932000  ! 4210: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9508000  ! 4211: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb2850000  ! 4212: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xbcbc4000  ! 4216: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xfe0c60d6  ! 4219: LDUB_I	ldub	[%r17 + 0x00d6], %r31
	.word 0x819561b9  ! 4222: WRPR_TPC_I	wrpr	%r21, 0x01b9, %tpc
	.word 0xf44d60f1  ! 4223: LDSB_I	ldsb	[%r21 + 0x00f1], %r26
	.word 0xf61d8000  ! 4224: LDD_R	ldd	[%r22 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982d93  ! 4228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d93, %hpstate
	.word 0xf61c8000  ! 4233: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xf2152000  ! 4236: LDUH_I	lduh	[%r20 + 0x0000], %r25
	.word 0xb21d4000  ! 4239: XOR_R	xor 	%r21, %r0, %r25
	.word 0xf80de009  ! 4241: LDUB_I	ldub	[%r23 + 0x0009], %r28
	.word 0xf60dc000  ! 4242: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xb12cc000  ! 4248: SLL_R	sll 	%r19, %r0, %r24
	.word 0xfd1d8000  ! 4249: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf01ca1ba  ! 4255: LDD_I	ldd	[%r18 + 0x01ba], %r24
	.word 0xf44de02c  ! 4256: LDSB_I	ldsb	[%r23 + 0x002c], %r26
	.word 0xfd1c8000  ! 4258: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xfd1ca1e1  ! 4260: LDDF_I	ldd	[%r18, 0x01e1], %f30
	setx	0x2033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a0e2  ! 4265: WRPR_TPC_I	wrpr	%r22, 0x00e2, %tpc
	.word 0x81956121  ! 4268: WRPR_TPC_I	wrpr	%r21, 0x0121, %tpc
	.word 0xb83c0000  ! 4270: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xb92d5000  ! 4274: SLLX_R	sllx	%r21, %r0, %r28
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4258000  ! 4277: SUB_R	sub 	%r22, %r0, %r26
	.word 0xf815a0ef  ! 4280: LDUH_I	lduh	[%r22 + 0x00ef], %r28
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf054a1e1  ! 4283: LDSH_I	ldsh	[%r18 + 0x01e1], %r24
	.word 0xf91c21ce  ! 4286: LDDF_I	ldd	[%r16, 0x01ce], %f28
	.word 0xf6140000  ! 4287: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0x8d95a05e  ! 4290: WRPR_PSTATE_I	wrpr	%r22, 0x005e, %pstate
	.word 0xb42d8000  ! 4292: ANDN_R	andn 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983849  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1849, %hpstate
	.word 0xff1d60b5  ! 4298: LDDF_I	ldd	[%r21, 0x00b5], %f31
	.word 0x83956007  ! 4299: WRPR_TNPC_I	wrpr	%r21, 0x0007, %tnpc
	setx	data_start_3, %g1, %r22
	.word 0x899521a1  ! 4303: WRPR_TICK_I	wrpr	%r20, 0x01a1, %tick
	.word 0x91946169  ! 4305: WRPR_PIL_I	wrpr	%r17, 0x0169, %pil
	setx	data_start_0, %g1, %r21
	.word 0xff1c0000  ! 4310: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf11c610b  ! 4314: LDDF_I	ldd	[%r17, 0x010b], %f24
	ta	T_CHANGE_HPRIV
	.word 0x819839c3  ! 4315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c3, %hpstate
	.word 0xf24ca1e0  ! 4316: LDSB_I	ldsb	[%r18 + 0x01e0], %r25
	.word 0xf214e1d5  ! 4322: LDUH_I	lduh	[%r19 + 0x01d5], %r25
	.word 0x91942181  ! 4323: WRPR_PIL_I	wrpr	%r16, 0x0181, %pil
	.word 0xfa4461e5  ! 4325: LDSW_I	ldsw	[%r17 + 0x01e5], %r29
	.word 0xb1540000  ! 4327: RDPR_GL	<illegal instruction>
	.word 0xfe4460ee  ! 4329: LDSW_I	ldsw	[%r17 + 0x00ee], %r31
	.word 0xf91c0000  ! 4331: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xf405e0f4  ! 4332: LDUW_I	lduw	[%r23 + 0x00f4], %r26
	.word 0xfd1c6187  ! 4335: LDDF_I	ldd	[%r17, 0x0187], %f30
	.word 0xb5520000  ! 4337: RDPR_PIL	<illegal instruction>
	.word 0xbb540000  ! 4339: RDPR_GL	<illegal instruction>
	.word 0xf2158000  ! 4347: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xb52d0000  ! 4348: SLL_R	sll 	%r20, %r0, %r26
	.word 0xf01ce114  ! 4350: LDD_I	ldd	[%r19 + 0x0114], %r24
	.word 0xf0150000  ! 4351: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb5341000  ! 4352: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xfb1de109  ! 4353: LDDF_I	ldd	[%r23, 0x0109], %f29
	.word 0xbe14e034  ! 4354: OR_I	or 	%r19, 0x0034, %r31
	.word 0xf91d8000  ! 4357: LDDF_R	ldd	[%r22, %r0], %f28
	setx	0x239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bde083  ! 4359: XNORcc_I	xnorcc 	%r23, 0x0083, %r24
	.word 0xb6bc61a1  ! 4362: XNORcc_I	xnorcc 	%r17, 0x01a1, %r27
	.word 0x8595a1b3  ! 4363: WRPR_TSTATE_I	wrpr	%r22, 0x01b3, %tstate
	.word 0xb3520000  ! 4368: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 4373: RDPR_PSTATE	<illegal instruction>
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf004a02a  ! 4377: LDUW_I	lduw	[%r18 + 0x002a], %r24
	.word 0xbf3c9000  ! 4378: SRAX_R	srax	%r18, %r0, %r31
	.word 0xb41ca13b  ! 4381: XOR_I	xor 	%r18, 0x013b, %r26
	.word 0xb7540000  ! 4384: RDPR_GL	<illegal instruction>
	.word 0xf004a165  ! 4386: LDUW_I	lduw	[%r18 + 0x0165], %r24
	.word 0xff1cc000  ! 4388: LDDF_R	ldd	[%r19, %r0], %f31
	setx	data_start_6, %g1, %r17
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d6088  ! 4396: LDUB_I	ldub	[%r21 + 0x0088], %r28
	.word 0xf71cc000  ! 4399: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0x8794a04d  ! 4400: WRPR_TT_I	wrpr	%r18, 0x004d, %tt
	.word 0xf814a139  ! 4401: LDUH_I	lduh	[%r18 + 0x0139], %r28
	.word 0xf4140000  ! 4402: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xb1504000  ! 4411: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 4419: RDPR_TNPC	<illegal instruction>
	.word 0xf645c000  ! 4423: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xbd641800  ! 4424: MOVcc_R	<illegal instruction>
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0da0ea  ! 4430: LDUB_I	ldub	[%r22 + 0x00ea], %r31
	.word 0xf20d0000  ! 4431: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xbabd4000  ! 4432: XNORcc_R	xnorcc 	%r21, %r0, %r29
	setx	data_start_1, %g1, %r23
	.word 0xfc142114  ! 4434: LDUH_I	lduh	[%r16 + 0x0114], %r30
	.word 0xf85d6112  ! 4436: LDX_I	ldx	[%r21 + 0x0112], %r28
	.word 0xbf508000  ! 4437: RDPR_TSTATE	<illegal instruction>
	.word 0xf51ca0ce  ! 4440: LDDF_I	ldd	[%r18, 0x00ce], %f26
	.word 0xb7500000  ! 4443: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xf644a1a9  ! 4447: LDSW_I	ldsw	[%r18 + 0x01a9], %r27
	setx	0x30201, %g1, %o0
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
	.word 0xf45da144  ! 4453: LDX_I	ldx	[%r22 + 0x0144], %r26
	.word 0xb12db001  ! 4454: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0xf804a12e  ! 4458: LDUW_I	lduw	[%r18 + 0x012e], %r28
	.word 0x8d94e104  ! 4465: WRPR_PSTATE_I	wrpr	%r19, 0x0104, %pstate
	setx	0x2011e, %g1, %o0
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
	.word 0xf11c0000  ! 4470: LDDF_R	ldd	[%r16, %r0], %f24
	ta	T_CHANGE_HPRIV
	.word 0x819839d1  ! 4474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d1, %hpstate
	.word 0xb3510000  ! 4480: RDPR_TICK	<illegal instruction>
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2a5a107  ! 4484: SUBcc_I	subcc 	%r22, 0x0107, %r25
	.word 0xf4040000  ! 4485: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xfe1c4000  ! 4490: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xb1641800  ! 4491: MOVcc_R	<illegal instruction>
	.word 0xf644c000  ! 4493: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf00c0000  ! 4494: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xfc04a02d  ! 4497: LDUW_I	lduw	[%r18 + 0x002d], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf51d4000  ! 4504: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xba950000  ! 4513: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xfa0da016  ! 4515: LDUB_I	ldub	[%r22 + 0x0016], %r29
	.word 0x8794a031  ! 4516: WRPR_TT_I	wrpr	%r18, 0x0031, %tt
	.word 0xb20de186  ! 4521: AND_I	and 	%r23, 0x0186, %r25
	.word 0xf01dc000  ! 4523: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xf055c000  ! 4525: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xf80d61e9  ! 4526: LDUB_I	ldub	[%r21 + 0x01e9], %r28
	.word 0xb1540000  ! 4527: RDPR_GL	rdpr	%-, %r24
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25de12c  ! 4532: LDX_I	ldx	[%r23 + 0x012c], %r25
	.word 0xf60d21de  ! 4536: LDUB_I	ldub	[%r20 + 0x01de], %r27
	.word 0xbd540000  ! 4541: RDPR_GL	<illegal instruction>
	.word 0xfe148000  ! 4544: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xba250000  ! 4545: SUB_R	sub 	%r20, %r0, %r29
	.word 0xf85ca1e8  ! 4550: LDX_I	ldx	[%r18 + 0x01e8], %r28
	.word 0x9195e1c6  ! 4551: WRPR_PIL_I	wrpr	%r23, 0x01c6, %pil
	.word 0x8194a1a9  ! 4556: WRPR_TPC_I	wrpr	%r18, 0x01a9, %tpc
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855c000  ! 4559: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xbb500000  ! 4560: RDPR_TPC	<illegal instruction>
	.word 0xf05c8000  ! 4561: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xfa0c6054  ! 4564: LDUB_I	ldub	[%r17 + 0x0054], %r29
	.word 0xfd1de016  ! 4565: LDDF_I	ldd	[%r23, 0x0016], %f30
	setx	data_start_0, %g1, %r19
	.word 0xb824a1ce  ! 4577: SUB_I	sub 	%r18, 0x01ce, %r28
	.word 0xfa058000  ! 4580: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf0440000  ! 4582: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xff1c0000  ! 4584: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xbb480000  ! 4585: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982d41  ! 4593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d41, %hpstate
	.word 0xfa4ce1a7  ! 4597: LDSB_I	ldsb	[%r19 + 0x01a7], %r29
	.word 0xf20dc000  ! 4598: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xf404208f  ! 4599: LDUW_I	lduw	[%r16 + 0x008f], %r26
	.word 0x8d94e179  ! 4605: WRPR_PSTATE_I	wrpr	%r19, 0x0179, %pstate
	.word 0xfa544000  ! 4606: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xbd508000  ! 4609: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e1d0  ! 4617: WRPR_TNPC_I	wrpr	%r19, 0x01d0, %tnpc
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81c8000  ! 4625: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xfe0c4000  ! 4630: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xb004e1be  ! 4632: ADD_I	add 	%r19, 0x01be, %r24
	.word 0xfa048000  ! 4633: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xba840000  ! 4634: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204c000  ! 4646: LDUW_R	lduw	[%r19 + %r0], %r25
	mov	0, %r14
	.word 0xa193a000  ! 4648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 4662: MOVcc_I	<illegal instruction>
	.word 0xf60d0000  ! 4663: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf2156027  ! 4664: LDUH_I	lduh	[%r21 + 0x0027], %r25
	.word 0xf41c603f  ! 4665: LDD_I	ldd	[%r17 + 0x003f], %r26
	.word 0xfc0de0e5  ! 4666: LDUB_I	ldub	[%r23 + 0x00e5], %r30
	.word 0x8995604d  ! 4668: WRPR_TICK_I	wrpr	%r21, 0x004d, %tick
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244a1d5  ! 4674: LDSW_I	ldsw	[%r18 + 0x01d5], %r25
	.word 0xb5540000  ! 4677: RDPR_GL	<illegal instruction>
	.word 0xb8b421b1  ! 4678: SUBCcc_I	orncc 	%r16, 0x01b1, %r28
	.word 0xfa04e1ce  ! 4682: LDUW_I	lduw	[%r19 + 0x01ce], %r29
	.word 0xf044e0b8  ! 4684: LDSW_I	ldsw	[%r19 + 0x00b8], %r24
	.word 0xf21d20d8  ! 4685: LDD_I	ldd	[%r20 + 0x00d8], %r25
	.word 0xfc5c21fb  ! 4686: LDX_I	ldx	[%r16 + 0x01fb], %r30
	.word 0xf84c4000  ! 4687: LDSB_R	ldsb	[%r17 + %r0], %r28
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0dc000  ! 4693: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfc152194  ! 4698: LDUH_I	lduh	[%r20 + 0x0194], %r30
	.word 0xf41da169  ! 4700: LDD_I	ldd	[%r22 + 0x0169], %r26
	.word 0xf25c617d  ! 4701: LDX_I	ldx	[%r17 + 0x017d], %r25
	.word 0xf40561d8  ! 4705: LDUW_I	lduw	[%r21 + 0x01d8], %r26
	.word 0xbf540000  ! 4708: RDPR_GL	<illegal instruction>
	.word 0xfa5d4000  ! 4709: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf445a19d  ! 4711: LDSW_I	ldsw	[%r22 + 0x019d], %r26
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30126, %g1, %o0
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
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8544000  ! 4726: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xb5540000  ! 4727: RDPR_GL	<illegal instruction>
	.word 0xb00d2083  ! 4732: AND_I	and 	%r20, 0x0083, %r24
	.word 0xfc54e0e2  ! 4733: LDSH_I	ldsh	[%r19 + 0x00e2], %r30
	.word 0xb424c000  ! 4734: SUB_R	sub 	%r19, %r0, %r26
	.word 0xf84d0000  ! 4736: LDSB_R	ldsb	[%r20 + %r0], %r28
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc544000  ! 4738: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf845a121  ! 4744: LDSW_I	ldsw	[%r22 + 0x0121], %r28
	.word 0xf31dc000  ! 4746: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xf444605a  ! 4748: LDSW_I	ldsw	[%r17 + 0x005a], %r26
	.word 0xf414a04c  ! 4750: LDUH_I	lduh	[%r18 + 0x004c], %r26
	.word 0xb52d1000  ! 4751: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xfe0c4000  ! 4755: LDUB_R	ldub	[%r17 + %r0], %r31
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5351000  ! 4757: SRLX_R	srlx	%r20, %r0, %r26
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e17d  ! 4764: WRPR_PSTATE_I	wrpr	%r19, 0x017d, %pstate
	.word 0xf455a016  ! 4766: LDSH_I	ldsh	[%r22 + 0x0016], %r26
	.word 0xfe0c606b  ! 4773: LDUB_I	ldub	[%r17 + 0x006b], %r31
	.word 0xf205a14e  ! 4774: LDUW_I	lduw	[%r22 + 0x014e], %r25
	.word 0xb135d000  ! 4776: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xf004619c  ! 4778: LDUW_I	lduw	[%r17 + 0x019c], %r24
	.word 0xf6550000  ! 4783: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfc554000  ! 4785: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf20de164  ! 4787: LDUB_I	ldub	[%r23 + 0x0164], %r25
	.word 0xfa554000  ! 4788: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfe1d21fc  ! 4790: LDD_I	ldd	[%r20 + 0x01fc], %r31
	.word 0xf40d21e5  ! 4792: LDUB_I	ldub	[%r20 + 0x01e5], %r26
	.word 0xfc54a0bf  ! 4795: LDSH_I	ldsh	[%r18 + 0x00bf], %r30
	.word 0xbb3de001  ! 4798: SRA_I	sra 	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xff1c0000  ! 4803: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xbd508000  ! 4808: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xfa15c000  ! 4810: LDUH_R	lduh	[%r23 + %r0], %r29
	setx	data_start_7, %g1, %r17
	.word 0xf805c000  ! 4815: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xb4458000  ! 4816: ADDC_R	addc 	%r22, %r0, %r26
	.word 0xbc448000  ! 4817: ADDC_R	addc 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf504000  ! 4826: RDPR_TNPC	<illegal instruction>
	.word 0xfc1c4000  ! 4832: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xb350c000  ! 4833: RDPR_TT	<illegal instruction>
	.word 0x919561d1  ! 4834: WRPR_PIL_I	wrpr	%r21, 0x01d1, %pil
	.word 0xfd1ca151  ! 4837: LDDF_I	ldd	[%r18, 0x0151], %f30
	.word 0xbb504000  ! 4839: RDPR_TNPC	<illegal instruction>
	.word 0xfe54a0f4  ! 4840: LDSH_I	ldsh	[%r18 + 0x00f4], %r31
	.word 0x8795e01b  ! 4841: WRPR_TT_I	wrpr	%r23, 0x001b, %tt
	.word 0xf4040000  ! 4847: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xf65c6103  ! 4852: LDX_I	ldx	[%r17 + 0x0103], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983f8b  ! 4853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f8b, %hpstate
	.word 0xf8448000  ! 4855: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfe5ce1ed  ! 4856: LDX_I	ldx	[%r19 + 0x01ed], %r31
	.word 0xfa558000  ! 4858: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xfb1c6054  ! 4862: LDDF_I	ldd	[%r17, 0x0054], %f29
	.word 0xbcace084  ! 4865: ANDNcc_I	andncc 	%r19, 0x0084, %r30
	.word 0x91946162  ! 4869: WRPR_PIL_I	wrpr	%r17, 0x0162, %pil
	.word 0xf04dc000  ! 4870: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xfc4420a9  ! 4874: LDSW_I	ldsw	[%r16 + 0x00a9], %r30
	.word 0xbd540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xf054a190  ! 4879: LDSH_I	ldsh	[%r18 + 0x0190], %r24
	.word 0xb49d6196  ! 4881: XORcc_I	xorcc 	%r21, 0x0196, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf51d6169  ! 4886: LDDF_I	ldd	[%r21, 0x0169], %f26
	.word 0xf655a1e7  ! 4888: LDSH_I	ldsh	[%r22 + 0x01e7], %r27
	.word 0xb89d0000  ! 4892: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xf60da1a1  ! 4894: LDUB_I	ldub	[%r22 + 0x01a1], %r27
	.word 0x8995218a  ! 4897: WRPR_TICK_I	wrpr	%r20, 0x018a, %tick
	.word 0x8394a0fa  ! 4898: WRPR_TNPC_I	wrpr	%r18, 0x00fa, %tnpc
	.word 0xfe4c4000  ! 4899: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0x8795209f  ! 4900: WRPR_TT_I	wrpr	%r20, 0x009f, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7510000  ! 4907: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf415e01a  ! 4908: LDUH_I	lduh	[%r23 + 0x001a], %r26
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ad4000  ! 4910: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xf20ca0dc  ! 4911: LDUB_I	ldub	[%r18 + 0x00dc], %r25
	.word 0x839421fb  ! 4912: WRPR_TNPC_I	wrpr	%r16, 0x01fb, %tnpc
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe54a022  ! 4916: LDSH_I	ldsh	[%r18 + 0x0022], %r31
	.word 0xf25d4000  ! 4917: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xb0042117  ! 4921: ADD_I	add 	%r16, 0x0117, %r24
	.word 0xf65dc000  ! 4922: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xb1504000  ! 4926: RDPR_TNPC	<illegal instruction>
	.word 0xbb518000  ! 4927: RDPR_PSTATE	<illegal instruction>
	.word 0xfa1521c9  ! 4929: LDUH_I	lduh	[%r20 + 0x01c9], %r29
	.word 0xf204c000  ! 4930: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xff1d0000  ! 4935: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xfc1d4000  ! 4943: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xbca561a4  ! 4946: SUBcc_I	subcc 	%r21, 0x01a4, %r30
	.word 0xf8550000  ! 4947: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xbcb5e1fe  ! 4948: ORNcc_I	orncc 	%r23, 0x01fe, %r30
	.word 0xbf520000  ! 4949: RDPR_PIL	<illegal instruction>
	.word 0xfa15a1f5  ! 4950: LDUH_I	lduh	[%r22 + 0x01f5], %r29
	.word 0xf45cc000  ! 4953: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0x8d9560f5  ! 4956: WRPR_PSTATE_I	wrpr	%r21, 0x00f5, %pstate
	.word 0xf04c0000  ! 4958: LDSB_R	ldsb	[%r16 + %r0], %r24
	setx	data_start_1, %g1, %r19
	.word 0xb7540000  ! 4967: RDPR_GL	<illegal instruction>
	.word 0xfa5d4000  ! 4969: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfc440000  ! 4971: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf614c000  ! 4972: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xb1347001  ! 4977: SRLX_I	srlx	%r17, 0x0001, %r24
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	.word 0xf84d4000  ! 4982: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf64da09f  ! 4983: LDSB_I	ldsb	[%r22 + 0x009f], %r27
	.word 0xfe4ce1cb  ! 4987: LDSB_I	ldsb	[%r19 + 0x01cb], %r31
	.word 0xf81d8000  ! 4988: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xb1508000  ! 4989: RDPR_TSTATE	<illegal instruction>
	.word 0xf40d2057  ! 4994: LDUB_I	ldub	[%r20 + 0x0057], %r26
	.word 0xf4140000  ! 4996: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xb6344000  ! 4998: SUBC_R	orn 	%r17, %r0, %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda80820  ! 5: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa54940  ! 6: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb5a00020  ! 8: FMOVs	fmovs	%f0, %f26
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0xbfa81c20  ! 11: FMOVRGEZ	dis not found

	.word 0x8994e1a2  ! 13: WRPR_TICK_I	wrpr	%r19, 0x01a2, %tick
	.word 0x8794a018  ! 14: WRPR_TT_I	wrpr	%r18, 0x0018, %tt
	.word 0xbba80820  ! 18: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 29: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbba9c820  ! 31: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a5c9c0  ! 33: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbfa00540  ! 34: FSQRTd	fsqrt	
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a49  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a49, %hpstate
	.word 0xbd7c4400  ! 42: MOVR_R	movre	%r17, %r0, %r30
	.word 0xb5643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0xb7a508c0  ! 46: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb9a8c820  ! 50: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb8ad20d9  ! 52: ANDNcc_I	andncc 	%r20, 0x00d9, %r28
	.word 0xb1a00040  ! 56: FMOVd	fmovd	%f0, %f24
	.word 0xb5a81c20  ! 57: FMOVRGEZ	dis not found

	.word 0xb5a88820  ! 60: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 65: FMOVRNZ	dis not found

	.word 0xb9508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 71: RDPR_TNPC	<illegal instruction>
	.word 0xb7510000  ! 73: RDPR_TICK	<illegal instruction>
	.word 0xbac420b7  ! 77: ADDCcc_I	addccc 	%r16, 0x00b7, %r29
	.word 0xb9ab8820  ! 80: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00040  ! 83: FMOVd	fmovd	%f0, %f28
	.word 0xb3ab0820  ! 85: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x8394a07b  ! 90: WRPR_TNPC_I	wrpr	%r18, 0x007b, %tnpc
	.word 0xb5a48940  ! 94: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb5518000  ! 97: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 98: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfaa0820  ! 99: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda98820  ! 101: FMOVNEG	fmovs	%fcc1, %f0, %f30
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 109: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r23
	.word 0xbfa81820  ! 114: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbba9c820  ! 118: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa0820  ! 119: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a4c860  ! 124: FADDq	dis not found

	.word 0xbfa00560  ! 128: FSQRTq	fsqrt	
	.word 0xb351c000  ! 131: RDPR_TL	<illegal instruction>
	.word 0xbfa80820  ! 132: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb5510000  ! 135: RDPR_TICK	<illegal instruction>
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 141: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a44860  ! 149: FADDq	dis not found

	.word 0xbda80c20  ! 155: FMOVRLZ	dis not found

	.word 0xbb540000  ! 161: RDPR_GL	<illegal instruction>
	.word 0xb7a4c8a0  ! 165: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb57d2401  ! 167: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xb32dc000  ! 168: SLL_R	sll 	%r23, %r0, %r25
	.word 0xb7504000  ! 169: RDPR_TNPC	<illegal instruction>
	.word 0xbf3d5000  ! 171: SRAX_R	srax	%r21, %r0, %r31
	setx	0x3031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 176: FMOVRZ	dis not found

	.word 0xbda88820  ! 177: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00040  ! 178: FMOVd	fmovd	%f0, %f56
	.word 0xb1a50860  ! 179: FADDq	dis not found

	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 181: FMOVd	fmovd	%f0, %f24
	.word 0xbfa508e0  ! 184: FSUBq	dis not found

	.word 0xb5abc820  ! 185: FMOVVC	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f932000  ! 189: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0xb735a001  ! 192: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xbaadc000  ! 197: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xb7a8c820  ! 198: FMOVL	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a00040  ! 202: FMOVd	fmovd	%f0, %f28
	.word 0xb8848000  ! 204: ADDcc_R	addcc 	%r18, %r0, %r28
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9e0  ! 207: FDIVq	dis not found

	.word 0xbba88820  ! 208: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0x8394a1e8  ! 210: WRPR_TNPC_I	wrpr	%r18, 0x01e8, %tnpc
	.word 0xb53cb001  ! 212: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xb21c61d0  ! 218: XOR_I	xor 	%r17, 0x01d0, %r25
	.word 0xbfa00560  ! 221: FSQRTq	fsqrt	
	.word 0xb93ca001  ! 222: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xbfa549e0  ! 229: FDIVq	dis not found

	.word 0x91942156  ! 230: WRPR_PIL_I	wrpr	%r16, 0x0156, %pil
	.word 0x8994210a  ! 231: WRPR_TICK_I	wrpr	%r16, 0x010a, %tick
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 236: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba94820  ! 242: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbbab4820  ! 245: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0x8394a107  ! 247: WRPR_TNPC_I	wrpr	%r18, 0x0107, %tnpc
	.word 0x89952024  ! 249: WRPR_TICK_I	wrpr	%r20, 0x0024, %tick
	.word 0xbbab4820  ! 251: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00560  ! 254: FSQRTq	fsqrt	
	.word 0xb3a54920  ! 255: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb5a81420  ! 258: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0xb7a00040  ! 262: FMOVd	fmovd	%f0, %f58
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9e0  ! 264: FDIVq	dis not found

	.word 0xb1a81420  ! 268: FMOVRNZ	dis not found

	.word 0xb7a508c0  ! 273: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb7a54820  ! 274: FADDs	fadds	%f21, %f0, %f27
	.word 0x8995a085  ! 275: WRPR_TICK_I	wrpr	%r22, 0x0085, %tick
	.word 0xb1a4c8c0  ! 278: FSUBd	fsubd	%f50, %f0, %f24
	.word 0x81942168  ! 281: WRPR_TPC_I	wrpr	%r16, 0x0168, %tpc
	.word 0xb9a5c920  ! 289: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb1500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0x8394a101  ! 297: WRPR_TNPC_I	wrpr	%r18, 0x0101, %tnpc
	.word 0xb9a00040  ! 300: FMOVd	fmovd	%f0, %f28
	.word 0xb7510000  ! 301: RDPR_TICK	<illegal instruction>
	.word 0xbd643801  ! 302: MOVcc_I	<illegal instruction>
	.word 0xb5a00040  ! 305: FMOVd	fmovd	%f0, %f26
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ac1  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac1, %hpstate
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 314: FMOVs	fmovs	%f0, %f30
	.word 0xb7a4c9c0  ! 316: FDIVd	fdivd	%f50, %f0, %f58
	setx	data_start_4, %g1, %r18
	.word 0xb7a00560  ! 320: FSQRTq	fsqrt	
	.word 0x839521bb  ! 321: WRPR_TNPC_I	wrpr	%r20, 0x01bb, %tnpc
	.word 0xb9520000  ! 324: RDPR_PIL	rdpr	%pil, %r28
	.word 0xbdab0820  ! 326: FMOVGU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983d91  ! 327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
	.word 0xb5643801  ! 332: MOVcc_I	<illegal instruction>
	.word 0xbfa90820  ! 338: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48940  ! 346: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb9a4c960  ! 350: FMULq	dis not found

	.word 0x8d94e10e  ! 353: WRPR_PSTATE_I	wrpr	%r19, 0x010e, %pstate
	.word 0xbc2d8000  ! 354: ANDN_R	andn 	%r22, %r0, %r30
	.word 0x819421bb  ! 355: WRPR_TPC_I	wrpr	%r16, 0x01bb, %tpc
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	.word 0xb5520000  ! 358: RDPR_PIL	<illegal instruction>
	.word 0xb1a4c820  ! 361: FADDs	fadds	%f19, %f0, %f24
	.word 0xb3aa4820  ! 362: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb40c2046  ! 367: AND_I	and 	%r16, 0x0046, %r26
	.word 0xbfa48920  ! 368: FMULs	fmuls	%f18, %f0, %f31
	.word 0xbda508c0  ! 373: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xbfa5c8c0  ! 376: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xb3aac820  ! 381: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a5c8e0  ! 383: FSUBq	dis not found

	.word 0xb5a00040  ! 387: FMOVd	fmovd	%f0, %f26
	.word 0xbba81820  ! 388: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1ab4820  ! 392: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a5c920  ! 395: FMULs	fmuls	%f23, %f0, %f27
	.word 0xbfa80820  ! 396: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0xb9341000  ! 403: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xb33de001  ! 404: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xbe344000  ! 405: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xb9aa4820  ! 406: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbba84820  ! 407: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb72c4000  ! 410: SLL_R	sll 	%r17, %r0, %r27
	.word 0xb7a58960  ! 414: FMULq	dis not found

	.word 0xbd518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0xbfab0820  ! 424: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab4820  ! 427: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbba94820  ! 429: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73cd000  ! 434: SRAX_R	srax	%r19, %r0, %r27
	.word 0xb5aa4820  ! 436: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x8394e125  ! 440: WRPR_TNPC_I	wrpr	%r19, 0x0125, %tnpc
	setx	data_start_7, %g1, %r18
	.word 0xb3a548c0  ! 445: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xb73d0000  ! 452: SRA_R	sra 	%r20, %r0, %r27
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e1d5  ! 463: WRPR_TSTATE_I	wrpr	%r19, 0x01d5, %tstate
	setx	0x1032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 467: FSQRTq	fsqrt	
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 470: FSQRTd	fsqrt	
	.word 0xbfabc820  ! 473: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0x9195a04f  ! 478: WRPR_PIL_I	wrpr	%r22, 0x004f, %pil
	.word 0xb7a00560  ! 479: FSQRTq	fsqrt	
	.word 0xb5a44840  ! 480: FADDd	faddd	%f48, %f0, %f26
	.word 0xb3510000  ! 488: RDPR_TICK	<illegal instruction>
	.word 0xb0440000  ! 491: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xbba508c0  ! 493: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb6bc0000  ! 497: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0xb22d4000  ! 498: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xb5508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a54940  ! 502: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb7a80420  ! 504: FMOVRZ	dis not found

	.word 0xb9a80820  ! 505: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbba549a0  ! 506: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb3a44960  ! 510: FMULq	dis not found

	.word 0xbba589a0  ! 511: FDIVs	fdivs	%f22, %f0, %f29
	.word 0x8595a15b  ! 513: WRPR_TSTATE_I	wrpr	%r22, 0x015b, %tstate
	.word 0xb9aac820  ! 515: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb885e03f  ! 521: ADDcc_I	addcc 	%r23, 0x003f, %r28
	.word 0xbf508000  ! 523: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a4c860  ! 524: FADDq	dis not found

	.word 0xb40c4000  ! 525: AND_R	and 	%r17, %r0, %r26
	mov	0, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda58860  ! 530: FADDq	dis not found

	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c860  ! 536: FADDq	dis not found

	.word 0xb5a44860  ! 537: FADDq	dis not found

	.word 0x879460f6  ! 541: WRPR_TT_I	wrpr	%r17, 0x00f6, %tt
	.word 0xbda5c9a0  ! 547: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb3a84820  ! 550: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa50820  ! 552: FADDs	fadds	%f20, %f0, %f31
	.word 0xb4250000  ! 559: SUB_R	sub 	%r20, %r0, %r26
	.word 0xbfaac820  ! 560: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x8995a001  ! 564: WRPR_TICK_I	wrpr	%r22, 0x0001, %tick
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a448a0  ! 567: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xb9ab4820  ! 571: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a40820  ! 574: FADDs	fadds	%f16, %f0, %f25
	.word 0xb1a588c0  ! 575: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb5a409a0  ! 578: FDIVs	fdivs	%f16, %f0, %f26
	.word 0xb1a4c9c0  ! 579: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xb015a19a  ! 580: OR_I	or 	%r22, 0x019a, %r24
	.word 0xb9a50840  ! 584: FADDd	faddd	%f20, %f0, %f28
	.word 0xbda448a0  ! 587: FSUBs	fsubs	%f17, %f0, %f30
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a40960  ! 593: FMULq	dis not found

	.word 0x9195a125  ! 594: WRPR_PIL_I	wrpr	%r22, 0x0125, %pil
	.word 0xb1a50960  ! 595: FMULq	dis not found

	.word 0xbdaa8820  ! 596: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c940  ! 598: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbb508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa90820  ! 603: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a589e0  ! 605: FDIVq	dis not found

	.word 0xb5480000  ! 606: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbda4c8c0  ! 607: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb5a80420  ! 608: FMOVRZ	dis not found

	.word 0xb7a90820  ! 610: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbf2c6001  ! 612: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xb5a449e0  ! 613: FDIVq	dis not found

	.word 0xb7a40920  ! 616: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb3a4c940  ! 619: FMULd	fmuld	%f50, %f0, %f56
	.word 0x8594a165  ! 624: WRPR_TSTATE_I	wrpr	%r18, 0x0165, %tstate
	mov	0, %r12
	.word 0x8f932000  ! 626: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb72df001  ! 628: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xb1a00020  ! 629: FMOVs	fmovs	%f0, %f24
	setx	data_start_4, %g1, %r18
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 639: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a50940  ! 641: FMULd	fmuld	%f20, %f0, %f28
	.word 0xb9a4c920  ! 645: FMULs	fmuls	%f19, %f0, %f28
	.word 0xb1a9c820  ! 646: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb4bc4000  ! 647: XNORcc_R	xnorcc 	%r17, %r0, %r26
	mov	2, %r12
	.word 0x8f932000  ! 648: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a84820  ! 649: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80820  ! 650: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa44940  ! 653: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb5a588e0  ! 657: FSUBq	dis not found

	.word 0xbda00520  ! 659: FSQRTs	fsqrt	
	.word 0xb00420e7  ! 662: ADD_I	add 	%r16, 0x00e7, %r24
	.word 0xbba81c20  ! 663: FMOVRGEZ	dis not found

	.word 0x819521fd  ! 668: WRPR_TPC_I	wrpr	%r20, 0x01fd, %tpc
	.word 0x8795a0c8  ! 669: WRPR_TT_I	wrpr	%r22, 0x00c8, %tt
	.word 0x899561fb  ! 673: WRPR_TICK_I	wrpr	%r21, 0x01fb, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r16
	setx	data_start_4, %g1, %r23
	.word 0xb5a00560  ! 679: FSQRTq	fsqrt	
	mov	2, %r12
	.word 0x8f932000  ! 681: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3520000  ! 683: RDPR_PIL	<illegal instruction>
	.word 0xb3a508e0  ! 684: FSUBq	dis not found

	.word 0xb1a9c820  ! 687: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00520  ! 692: FSQRTs	fsqrt	
	.word 0xbda449e0  ! 693: FDIVq	dis not found

	.word 0xbba409c0  ! 696: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb53d2001  ! 699: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0x8595a10f  ! 701: WRPR_TSTATE_I	wrpr	%r22, 0x010f, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xb9a00520  ! 703: FSQRTs	fsqrt	
	.word 0xbdab8820  ! 705: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa9c820  ! 709: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba449c0  ! 713: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbd2dc000  ! 715: SLL_R	sll 	%r23, %r0, %r30
	.word 0xb3a00520  ! 716: FSQRTs	fsqrt	
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a133  ! 718: WRPR_TSTATE_I	wrpr	%r18, 0x0133, %tstate
	setx	data_start_4, %g1, %r22
	.word 0xb9a00520  ! 725: FSQRTs	fsqrt	
	.word 0x859521ef  ! 728: WRPR_TSTATE_I	wrpr	%r20, 0x01ef, %tstate
	.word 0xbfa40820  ! 730: FADDs	fadds	%f16, %f0, %f31
	.word 0xb7aa8820  ! 731: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3500000  ! 737: RDPR_TPC	<illegal instruction>
	.word 0xb885a0cf  ! 743: ADDcc_I	addcc 	%r22, 0x00cf, %r28
	.word 0xb63da065  ! 744: XNOR_I	xnor 	%r22, 0x0065, %r27
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a48940  ! 746: FMULd	fmuld	%f18, %f0, %f24
	.word 0xbb3d6001  ! 747: SRA_I	sra 	%r21, 0x0001, %r29
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	0x30014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda548c0  ! 762: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb5a00520  ! 766: FSQRTs	fsqrt	
	.word 0xb7a549a0  ! 767: FDIVs	fdivs	%f21, %f0, %f27
	mov	1, %r14
	.word 0xa193a000  ! 768: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x9195a172  ! 773: WRPR_PIL_I	wrpr	%r22, 0x0172, %pil
	.word 0x8595e04c  ! 774: WRPR_TSTATE_I	wrpr	%r23, 0x004c, %tstate
	.word 0xb7a448a0  ! 775: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xb7a5c960  ! 776: FMULq	dis not found

	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb97cc400  ! 783: MOVR_R	movre	%r19, %r0, %r28
	.word 0xbba44840  ! 785: FADDd	faddd	%f48, %f0, %f60
	.word 0xbb540000  ! 786: RDPR_GL	<illegal instruction>
	.word 0xbda50860  ! 787: FADDq	dis not found

	.word 0xb1ab0820  ! 788: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63c0000  ! 793: XNOR_R	xnor 	%r16, %r0, %r27
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 797: FMOVRNZ	dis not found

	.word 0xb6140000  ! 798: OR_R	or 	%r16, %r0, %r27
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 800: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb895213e  ! 802: ORcc_I	orcc 	%r20, 0x013e, %r28
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 814: RDPR_GL	<illegal instruction>
	.word 0x899460b9  ! 817: WRPR_TICK_I	wrpr	%r17, 0x00b9, %tick
	.word 0xbda00020  ! 818: FMOVs	fmovs	%f0, %f30
	.word 0xb5a54840  ! 820: FADDd	faddd	%f52, %f0, %f26
	.word 0x8994218f  ! 822: WRPR_TICK_I	wrpr	%r16, 0x018f, %tick
	.word 0xbda80820  ! 825: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00560  ! 827: FSQRTq	fsqrt	
	.word 0x9194210f  ! 829: WRPR_PIL_I	wrpr	%r16, 0x010f, %pil
	.word 0xb9a4c840  ! 834: FADDd	faddd	%f50, %f0, %f28
	.word 0xbd510000  ! 835: RDPR_TICK	<illegal instruction>
	.word 0xb3a80820  ! 836: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba44960  ! 837: FMULq	dis not found

	.word 0xbba81820  ! 838: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbcc52120  ! 842: ADDCcc_I	addccc 	%r20, 0x0120, %r30
	.word 0xbb51c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xb9348000  ! 850: SRL_R	srl 	%r18, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x879420c2  ! 857: WRPR_TT_I	wrpr	%r16, 0x00c2, %tt
	.word 0xb1a00540  ! 858: FSQRTd	fsqrt	
	.word 0xb7a408a0  ! 863: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xb1ab0820  ! 865: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a589e0  ! 867: FDIVq	dis not found

	.word 0xb9a408a0  ! 869: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb5a00520  ! 874: FSQRTs	fsqrt	
	.word 0xb5a98820  ! 875: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb6b58000  ! 876: ORNcc_R	orncc 	%r22, %r0, %r27
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 885: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a58860  ! 887: FADDq	dis not found

	.word 0xbda00540  ! 890: FSQRTd	fsqrt	
	.word 0xb5510000  ! 891: RDPR_TICK	<illegal instruction>
	.word 0xbdaac820  ! 892: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0x819421c6  ! 898: WRPR_TPC_I	wrpr	%r16, 0x01c6, %tpc
	.word 0xbda80c20  ! 899: FMOVRLZ	dis not found

	.word 0xb5480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb43c4000  ! 905: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xbba81420  ! 907: FMOVRNZ	dis not found

	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 911: FMOVA	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0x8f932000  ! 912: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7aa8820  ! 916: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00560  ! 923: FSQRTq	fsqrt	
	.word 0x8395a136  ! 926: WRPR_TNPC_I	wrpr	%r22, 0x0136, %tnpc
	mov	1, %r14
	.word 0xa193a000  ! 927: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8b5a170  ! 929: ORNcc_I	orncc 	%r22, 0x0170, %r28
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb13db001  ! 932: SRAX_I	srax	%r22, 0x0001, %r24
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3d8000  ! 936: XNOR_R	xnor 	%r22, %r0, %r30
	.word 0xbda00520  ! 939: FSQRTs	fsqrt	
	.word 0x919520f8  ! 941: WRPR_PIL_I	wrpr	%r20, 0x00f8, %pil
	.word 0xb3a90820  ! 944: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80420  ! 947: FMOVRZ	dis not found

	.word 0xb5a00520  ! 952: FSQRTs	fsqrt	
	.word 0xbda00560  ! 953: FSQRTq	fsqrt	
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 956: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a54860  ! 958: FADDq	dis not found

	.word 0xb6b5c000  ! 961: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb7504000  ! 964: RDPR_TNPC	<illegal instruction>
	.word 0xbfa4c8c0  ! 973: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb1a00020  ! 974: FMOVs	fmovs	%f0, %f24
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a026  ! 981: WRPR_PSTATE_I	wrpr	%r22, 0x0026, %pstate
	.word 0xbe442133  ! 983: ADDC_I	addc 	%r16, 0x0133, %r31
	.word 0xbfa5c8c0  ! 984: FSUBd	fsubd	%f54, %f0, %f62
	mov	1, %r14
	.word 0xa193a000  ! 985: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r18
	.word 0xb52d1000  ! 989: SLLX_R	sllx	%r20, %r0, %r26
	setx	0x2013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 993: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb0c58000  ! 994: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xba2c8000  ! 995: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xbda00540  ! 1000: FSQRTd	fsqrt	
	.word 0xb9520000  ! 1001: RDPR_PIL	<illegal instruction>
	.word 0xbba94820  ! 1004: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6348000  ! 1008: ORN_R	orn 	%r18, %r0, %r27
	.word 0xb3a4c860  ! 1014: FADDq	dis not found

	.word 0x9195e145  ! 1015: WRPR_PIL_I	wrpr	%r23, 0x0145, %pil
	.word 0xbdaa0820  ! 1017: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbb504000  ! 1020: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb7aac820  ! 1025: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81820  ! 1027: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbba81820  ! 1030: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb0148000  ! 1031: OR_R	or 	%r18, %r0, %r24
	.word 0xb1a5c960  ! 1032: FMULq	dis not found

	.word 0xb1aac820  ! 1035: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	0x30135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba48820  ! 1039: FADDs	fadds	%f18, %f0, %f29
	.word 0xb3a4c840  ! 1040: FADDd	faddd	%f50, %f0, %f56
	.word 0xbba5c940  ! 1050: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbbaa0820  ! 1051: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda508a0  ! 1052: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb3ab8820  ! 1056: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbb510000  ! 1057: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 1060: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_4, %g1, %r23
	.word 0xbda58820  ! 1065: FADDs	fadds	%f22, %f0, %f30
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 1072: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	0, %r14
	.word 0xa193a000  ! 1075: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x859561e6  ! 1076: WRPR_TSTATE_I	wrpr	%r21, 0x01e6, %tstate
	.word 0xbfa80420  ! 1080: FMOVRZ	dis not found

	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 1085: FMOVRGEZ	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 1086: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1480000  ! 1091: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 1094: FSQRTq	fsqrt	
	.word 0xb1aa8820  ! 1096: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa4820  ! 1098: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb9480000  ! 1099: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda81420  ! 1100: FMOVRNZ	dis not found

	.word 0x819460f9  ! 1101: WRPR_TPC_I	wrpr	%r17, 0x00f9, %tpc
	.word 0xbdaa8820  ! 1102: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a549a0  ! 1103: FDIVs	fdivs	%f21, %f0, %f25
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	.word 0xb351c000  ! 1111: RDPR_TL	<illegal instruction>
	.word 0xbb540000  ! 1112: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7ab0820  ! 1117: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a90820  ! 1118: FMOVLEU	fmovs	%fcc1, %f0, %f26
	setx	0x2003f, %g1, %o0
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
	.word 0xb3510000  ! 1128: RDPR_TICK	<illegal instruction>
	.word 0xb1a40920  ! 1131: FMULs	fmuls	%f16, %f0, %f24
	.word 0xbfa448a0  ! 1139: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xb7a4c9a0  ! 1140: FDIVs	fdivs	%f19, %f0, %f27
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952074  ! 1145: WRPR_TPC_I	wrpr	%r20, 0x0074, %tpc
	.word 0xb6bdc000  ! 1146: XNORcc_R	xnorcc 	%r23, %r0, %r27
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a548a0  ! 1148: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb5a409c0  ! 1149: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xb7aa8820  ! 1152: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbd480000  ! 1155: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1156: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a00540  ! 1159: FSQRTd	fsqrt	
	.word 0xb3ab8820  ! 1160: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81c20  ! 1161: FMOVRGEZ	dis not found

	.word 0xb9ab4820  ! 1164: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 1166: FMOVCS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x8198285b  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	.word 0xbba81c20  ! 1173: FMOVRGEZ	dis not found

	setx	data_start_5, %g1, %r21
	.word 0xb5a80420  ! 1176: FMOVRZ	dis not found

	.word 0xb5a00520  ! 1179: FSQRTs	fsqrt	
	.word 0xb9a40860  ! 1183: FADDq	dis not found

	.word 0xb351c000  ! 1184: RDPR_TL	<illegal instruction>
	.word 0xbfa80820  ! 1188: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbcac8000  ! 1189: ANDNcc_R	andncc 	%r18, %r0, %r30
	.word 0x87942136  ! 1190: WRPR_TT_I	wrpr	%r16, 0x0136, %tt
	.word 0xb5a98820  ! 1191: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1193: RDPR_TT	<illegal instruction>
	.word 0xb284a0f1  ! 1195: ADDcc_I	addcc 	%r18, 0x00f1, %r25
	.word 0x8595e0da  ! 1197: WRPR_TSTATE_I	wrpr	%r23, 0x00da, %tstate
	.word 0xb3aa4820  ! 1206: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8194a081  ! 1207: WRPR_TPC_I	wrpr	%r18, 0x0081, %tpc
	.word 0xb6452189  ! 1210: ADDC_I	addc 	%r20, 0x0189, %r27
	setx	0x2012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983dd1  ! 1224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd1, %hpstate
	.word 0xb7a00540  ! 1227: FSQRTd	fsqrt	
	.word 0xb1a00560  ! 1231: FSQRTq	fsqrt	
	.word 0xb9aa4820  ! 1236: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbf641800  ! 1238: MOVcc_R	<illegal instruction>
	.word 0xb5ab4820  ! 1241: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbda44920  ! 1242: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb9aa8820  ! 1244: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a448c0  ! 1245: FSUBd	fsubd	%f48, %f0, %f58
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 1246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	.word 0xb3a8c820  ! 1250: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9a449e0  ! 1252: FDIVq	dis not found

	.word 0xb3aa4820  ! 1253: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb28d6154  ! 1254: ANDcc_I	andcc 	%r21, 0x0154, %r25
	.word 0xb52c3001  ! 1255: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb9a80420  ! 1256: FMOVRZ	dis not found

	.word 0xb3aac820  ! 1260: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 1264: FMOVRGEZ	dis not found

	.word 0x8d94a196  ! 1265: WRPR_PSTATE_I	wrpr	%r18, 0x0196, %pstate
	.word 0x81942159  ! 1266: WRPR_TPC_I	wrpr	%r16, 0x0159, %tpc
	.word 0xbfa449a0  ! 1271: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xb13c4000  ! 1272: SRA_R	sra 	%r17, %r0, %r24
	.word 0xb08c0000  ! 1273: ANDcc_R	andcc 	%r16, %r0, %r24
	.word 0xbfa00040  ! 1274: FMOVd	fmovd	%f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb404e0ea  ! 1276: ADD_I	add 	%r19, 0x00ea, %r26
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 1282: RDPR_GL	<illegal instruction>
	.word 0xb9500000  ! 1284: RDPR_TPC	<illegal instruction>
	.word 0xbfa50940  ! 1288: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb5a9c820  ! 1293: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81820  ! 1294: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbda4c9e0  ! 1296: FDIVq	dis not found

	.word 0xbda80820  ! 1298: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54860  ! 1301: FADDq	dis not found

	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c9e0  ! 1303: FDIVq	dis not found

	.word 0x879520bd  ! 1305: WRPR_TT_I	wrpr	%r20, 0x00bd, %tt
	.word 0xb22de17a  ! 1307: ANDN_I	andn 	%r23, 0x017a, %r25
	.word 0xbb500000  ! 1309: RDPR_TPC	<illegal instruction>
	.word 0xb3a00040  ! 1310: FMOVd	fmovd	%f0, %f56
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d89  ! 1312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d89, %hpstate
	.word 0x8794a107  ! 1313: WRPR_TT_I	wrpr	%r18, 0x0107, %tt
	setx	data_start_2, %g1, %r21
	.word 0xb1a00520  ! 1315: FSQRTs	fsqrt	
	.word 0xbba94820  ! 1316: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a40960  ! 1319: FMULq	dis not found

	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1321: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x9194a16d  ! 1324: WRPR_PIL_I	wrpr	%r18, 0x016d, %pil
	.word 0xbf520000  ! 1327: RDPR_PIL	<illegal instruction>
	.word 0xb5508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00520  ! 1332: FSQRTs	fsqrt	
	.word 0xb5510000  ! 1335: RDPR_TICK	<illegal instruction>
	.word 0xbda81420  ! 1337: FMOVRNZ	dis not found

	.word 0xb7540000  ! 1338: RDPR_GL	<illegal instruction>
	.word 0xb1a00540  ! 1341: FSQRTd	fsqrt	
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca40000  ! 1349: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xba0c60fe  ! 1350: AND_I	and 	%r17, 0x00fe, %r29
	.word 0xbfa44860  ! 1351: FADDq	dis not found

	.word 0xbe0d21d1  ! 1352: AND_I	and 	%r20, 0x01d1, %r31
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 1360: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb294c000  ! 1362: ORcc_R	orcc 	%r19, %r0, %r25
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1364: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r16
	.word 0xbebca12c  ! 1374: XNORcc_I	xnorcc 	%r18, 0x012c, %r31
	.word 0xb9aa0820  ! 1376: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbda00020  ! 1377: FMOVs	fmovs	%f0, %f30
	.word 0xbda9c820  ! 1382: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 1390: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x8594214d  ! 1391: WRPR_TSTATE_I	wrpr	%r16, 0x014d, %tstate
	.word 0xb5508000  ! 1393: RDPR_TSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r22
	.word 0xb7a80420  ! 1397: FMOVRZ	dis not found

	.word 0xb9641800  ! 1401: MOVcc_R	<illegal instruction>
	.word 0xbba98820  ! 1402: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00560  ! 1403: FSQRTq	fsqrt	
	.word 0xb21de1de  ! 1404: XOR_I	xor 	%r23, 0x01de, %r25
	.word 0xb3a4c9c0  ! 1406: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb1abc820  ! 1408: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00540  ! 1416: FSQRTd	fsqrt	
	.word 0xbda4c9c0  ! 1423: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb1510000  ! 1424: RDPR_TICK	<illegal instruction>
	.word 0xb7a508a0  ! 1427: FSUBs	fsubs	%f20, %f0, %f27
	.word 0xb5480000  ! 1431: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 1436: FSQRTd	fsqrt	
	.word 0xb9a80c20  ! 1438: FMOVRLZ	dis not found

	.word 0xbfab0820  ! 1439: FMOVGU	fmovs	%fcc1, %f0, %f31
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 1449: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a81820  ! 1450: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a02a  ! 1453: WRPR_PIL_I	wrpr	%r22, 0x002a, %pil
	.word 0xbba00520  ! 1456: FSQRTs	fsqrt	
	.word 0xb4154000  ! 1461: OR_R	or 	%r21, %r0, %r26
	.word 0xb7a98820  ! 1463: FMOVNEG	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0x8f932000  ! 1469: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3344000  ! 1476: SRL_R	srl 	%r17, %r0, %r25
	.word 0xbfa50840  ! 1477: FADDd	faddd	%f20, %f0, %f62
	.word 0xb3a44840  ! 1479: FADDd	faddd	%f48, %f0, %f56
	.word 0xbda9c820  ! 1484: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbd51c000  ! 1486: RDPR_TL	<illegal instruction>
	.word 0xbba81820  ! 1488: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1a80820  ! 1490: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbfa90820  ! 1493: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81820  ! 1494: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb5a50920  ! 1495: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbda00020  ! 1496: FMOVs	fmovs	%f0, %f30
	.word 0xbfa4c920  ! 1498: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbda80420  ! 1500: FMOVRZ	dis not found

	.word 0xb60420b0  ! 1504: ADD_I	add 	%r16, 0x00b0, %r27
	.word 0x8994204a  ! 1510: WRPR_TICK_I	wrpr	%r16, 0x004a, %tick
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d01  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d01, %hpstate
	.word 0xb1ab4820  ! 1515: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab8820  ! 1518: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a98820  ! 1519: FMOVNEG	fmovs	%fcc1, %f0, %f28
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 1526: RDPR_TICK	<illegal instruction>
	.word 0xb5aa0820  ! 1528: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c840  ! 1532: FADDd	faddd	%f54, %f0, %f62
	.word 0xbfa98820  ! 1533: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a4c840  ! 1534: FADDd	faddd	%f50, %f0, %f26
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 1539: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a80c20  ! 1541: FMOVRLZ	dis not found

	.word 0xb1a488c0  ! 1544: FSUBd	fsubd	%f18, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982d51  ! 1548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 1550: RDPR_TPC	<illegal instruction>
	.word 0xb7510000  ! 1551: RDPR_TICK	<illegal instruction>
	.word 0xbc2d4000  ! 1553: ANDN_R	andn 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 1556: RDPR_TL	<illegal instruction>
	.word 0xb5a40940  ! 1559: FMULd	fmuld	%f16, %f0, %f26
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1564: RDPR_TPC	<illegal instruction>
	.word 0xb1a489c0  ! 1566: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb22c2095  ! 1567: ANDN_I	andn 	%r16, 0x0095, %r25
	setx	data_start_7, %g1, %r21
	.word 0xbda9c820  ! 1569: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 1571: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda80c20  ! 1572: FMOVRLZ	dis not found

	.word 0xb6bd8000  ! 1574: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xb5a81820  ! 1579: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb7a448a0  ! 1580: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbdaa8820  ! 1581: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	data_start_2, %g1, %r22
	setx	data_start_7, %g1, %r17
	.word 0xb3aa0820  ! 1587: FMOVA	fmovs	%fcc1, %f0, %f25
	setx	0x2001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1589: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8794a1a6  ! 1590: WRPR_TT_I	wrpr	%r18, 0x01a6, %tt
	.word 0xb7a80c20  ! 1592: FMOVRLZ	dis not found

	.word 0x81946112  ! 1594: WRPR_TPC_I	wrpr	%r17, 0x0112, %tpc
	.word 0xbfa80820  ! 1598: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0x8f932000  ! 1600: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa00040  ! 1601: FMOVd	fmovd	%f0, %f62
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1608: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983853  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1853, %hpstate
	.word 0xb3a589c0  ! 1619: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb9520000  ! 1621: RDPR_PIL	<illegal instruction>
	.word 0xb3a509c0  ! 1622: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xbfa94820  ! 1623: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48860  ! 1624: FADDq	dis not found

	.word 0xb7508000  ! 1628: RDPR_TSTATE	<illegal instruction>
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a40840  ! 1636: FADDd	faddd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a58960  ! 1639: FMULq	dis not found

	.word 0xb13df001  ! 1641: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xb5a80820  ! 1643: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbb520000  ! 1644: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 1645: RDPR_TL	<illegal instruction>
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbab5c000  ! 1653: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xbda00520  ! 1655: FSQRTs	fsqrt	
	.word 0xbda50860  ! 1656: FADDq	dis not found

	.word 0xb1ab4820  ! 1658: FMOVCC	fmovs	%fcc1, %f0, %f24
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c940  ! 1665: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb5540000  ! 1666: RDPR_GL	<illegal instruction>
	.word 0xb9a40820  ! 1667: FADDs	fadds	%f16, %f0, %f28
	.word 0xb3a489a0  ! 1668: FDIVs	fdivs	%f18, %f0, %f25
	.word 0x8d95e0be  ! 1671: WRPR_PSTATE_I	wrpr	%r23, 0x00be, %pstate
	.word 0xb7a5c920  ! 1678: FMULs	fmuls	%f23, %f0, %f27
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1680: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb63c8000  ! 1681: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xbf508000  ! 1687: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a48860  ! 1689: FADDq	dis not found

	.word 0xbba00020  ! 1691: FMOVs	fmovs	%f0, %f29
	.word 0xb9a81c20  ! 1694: FMOVRGEZ	dis not found

	.word 0xb3a48840  ! 1697: FADDd	faddd	%f18, %f0, %f56
	.word 0xb1a58920  ! 1699: FMULs	fmuls	%f22, %f0, %f24
	.word 0x819421c6  ! 1704: WRPR_TPC_I	wrpr	%r16, 0x01c6, %tpc
	.word 0xbfa80820  ! 1705: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1aac820  ! 1708: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x8394a13c  ! 1709: WRPR_TNPC_I	wrpr	%r18, 0x013c, %tnpc
	.word 0xb3518000  ! 1711: RDPR_PSTATE	<illegal instruction>
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 1715: FMOVRGEZ	dis not found

	.word 0xb4244000  ! 1719: SUB_R	sub 	%r17, %r0, %r26
	.word 0xbba00560  ! 1725: FSQRTq	fsqrt	
	.word 0xbba4c9a0  ! 1727: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xb1520000  ! 1736: RDPR_PIL	<illegal instruction>
	.word 0xbba509a0  ! 1737: FDIVs	fdivs	%f20, %f0, %f29
	.word 0x81952176  ! 1738: WRPR_TPC_I	wrpr	%r20, 0x0176, %tpc
	.word 0xb9a44820  ! 1742: FADDs	fadds	%f17, %f0, %f28
	.word 0xb6344000  ! 1744: SUBC_R	orn 	%r17, %r0, %r27
	.word 0xbda00020  ! 1745: FMOVs	fmovs	%f0, %f30
	.word 0xb1a589e0  ! 1746: FDIVq	dis not found

	.word 0xb7a00020  ! 1749: FMOVs	fmovs	%f0, %f27
	setx	0x10119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e0ce  ! 1755: WRPR_PSTATE_I	wrpr	%r23, 0x00ce, %pstate
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 1764: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80c20  ! 1765: FMOVRLZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 1766: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb734f001  ! 1770: SRLX_I	srlx	%r19, 0x0001, %r27
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba548a0  ! 1776: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xbda81820  ! 1778: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3c2001  ! 1783: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xbda54840  ! 1786: FADDd	faddd	%f52, %f0, %f30
	.word 0xbda81420  ! 1790: FMOVRNZ	dis not found

	.word 0x83956103  ! 1791: WRPR_TNPC_I	wrpr	%r21, 0x0103, %tnpc
	.word 0xb1a4c940  ! 1799: FMULd	fmuld	%f50, %f0, %f24
	.word 0xbba00540  ! 1800: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983c11  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c11, %hpstate
	.word 0xb9a54860  ! 1808: FADDq	dis not found

	.word 0xb7a58840  ! 1810: FADDd	faddd	%f22, %f0, %f58
	ta	T_CHANGE_HPRIV
	.word 0x81982d89  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d89, %hpstate
	.word 0xb1a40940  ! 1813: FMULd	fmuld	%f16, %f0, %f24
	.word 0xbfab0820  ! 1814: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbdab8820  ! 1817: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa88820  ! 1820: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3520000  ! 1829: RDPR_PIL	<illegal instruction>
	.word 0xb3a00540  ! 1831: FSQRTd	fsqrt	
	setx	data_start_4, %g1, %r19
	.word 0xb9a00560  ! 1836: FSQRTq	fsqrt	
	.word 0xb1a44820  ! 1840: FADDs	fadds	%f17, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983983  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1983, %hpstate
	.word 0xbda409e0  ! 1842: FDIVq	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 1843: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r16
	.word 0xb3510000  ! 1846: RDPR_TICK	<illegal instruction>
	.word 0xbfa48940  ! 1849: FMULd	fmuld	%f18, %f0, %f62
	.word 0x8195212c  ! 1852: WRPR_TPC_I	wrpr	%r20, 0x012c, %tpc
	.word 0xbda488e0  ! 1854: FSUBq	dis not found

	setx	0x3030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 1860: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9abc820  ! 1861: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 1867: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c940  ! 1869: FMULd	fmuld	%f54, %f0, %f60
	.word 0x8994616c  ! 1870: WRPR_TICK_I	wrpr	%r17, 0x016c, %tick
	.word 0xb5a8c820  ! 1873: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0x8994a0ca  ! 1874: WRPR_TICK_I	wrpr	%r18, 0x00ca, %tick
	.word 0x9194a00d  ! 1875: WRPR_PIL_I	wrpr	%r18, 0x000d, %pil
	.word 0xbf510000  ! 1877: RDPR_TICK	<illegal instruction>
	.word 0xb3a508c0  ! 1884: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb3a84820  ! 1886: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a58860  ! 1887: FADDq	dis not found

	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44920  ! 1892: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb7a80820  ! 1894: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c8e0  ! 1896: FSUBq	dis not found

	.word 0xba9de12b  ! 1897: XORcc_I	xorcc 	%r23, 0x012b, %r29
	.word 0xb3a5c960  ! 1898: FMULq	dis not found

	.word 0xb7a80420  ! 1899: FMOVRZ	dis not found

	.word 0xb7aa4820  ! 1900: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a54960  ! 1901: FMULq	dis not found

	.word 0x9195a125  ! 1905: WRPR_PIL_I	wrpr	%r22, 0x0125, %pil
	.word 0xb7aa4820  ! 1907: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00040  ! 1910: FMOVd	fmovd	%f0, %f56
	.word 0xb6b4c000  ! 1914: ORNcc_R	orncc 	%r19, %r0, %r27
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 1917: FMOVCS	fmovs	%fcc1, %f0, %f31
	setx	data_start_2, %g1, %r18
	.word 0xb550c000  ! 1923: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba1d61c9  ! 1925: XOR_I	xor 	%r21, 0x01c9, %r29
	.word 0xb7a509e0  ! 1926: FDIVq	dis not found

	.word 0xb1510000  ! 1927: RDPR_TICK	<illegal instruction>
	.word 0x8195e18d  ! 1928: WRPR_TPC_I	wrpr	%r23, 0x018d, %tpc
	.word 0x9194a18b  ! 1929: WRPR_PIL_I	wrpr	%r18, 0x018b, %pil
	.word 0x8395a172  ! 1930: WRPR_TNPC_I	wrpr	%r22, 0x0172, %tnpc
	.word 0xbba40940  ! 1931: FMULd	fmuld	%f16, %f0, %f60
	.word 0xbda5c9a0  ! 1932: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb9a448e0  ! 1934: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982813  ! 1935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0813, %hpstate
	setx	data_start_2, %g1, %r20
	.word 0xb7508000  ! 1944: RDPR_TSTATE	<illegal instruction>
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a489a0  ! 1949: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb5a81c20  ! 1950: FMOVRGEZ	dis not found

	setx	0x30136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 1957: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbba44920  ! 1958: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbf50c000  ! 1960: RDPR_TT	<illegal instruction>
	.word 0xbba5c840  ! 1961: FADDd	faddd	%f54, %f0, %f60
	.word 0xb9540000  ! 1966: RDPR_GL	<illegal instruction>
	.word 0xb3a40820  ! 1968: FADDs	fadds	%f16, %f0, %f25
	.word 0xb1a489a0  ! 1975: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb9a00040  ! 1982: FMOVd	fmovd	%f0, %f28
	.word 0x8d9420ee  ! 1983: WRPR_PSTATE_I	wrpr	%r16, 0x00ee, %pstate
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 1987: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a48840  ! 1988: FADDd	faddd	%f18, %f0, %f58
	.word 0xb1a88820  ! 1989: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb4ad8000  ! 1993: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xb1a00020  ! 1998: FMOVs	fmovs	%f0, %f24
	.word 0xb2350000  ! 2000: ORN_R	orn 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	.word 0xbfab0820  ! 2002: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa508c0  ! 2004: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb1a40960  ! 2005: FMULq	dis not found

	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 2016: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b44000  ! 2021: ORNcc_R	orncc 	%r17, %r0, %r25
	.word 0xbda81420  ! 2023: FMOVRNZ	dis not found

	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e09a  ! 2027: WRPR_TICK_I	wrpr	%r19, 0x009a, %tick
	.word 0xbda90820  ! 2033: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd510000  ! 2037: RDPR_TICK	<illegal instruction>
	.word 0xb9a4c8e0  ! 2038: FSUBq	dis not found

	setx	0x33f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 2040: RDPR_TPC	<illegal instruction>
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2045: FSQRTq	fsqrt	
	mov	1, %r14
	.word 0xa193a000  ! 2046: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a00020  ! 2048: FMOVs	fmovs	%f0, %f25
	.word 0xbfa40960  ! 2055: FMULq	dis not found

	.word 0xb035c000  ! 2056: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xb3540000  ! 2058: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xbfa81c20  ! 2064: FMOVRGEZ	dis not found

	.word 0xbbab0820  ! 2067: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a94820  ! 2068: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xba344000  ! 2072: SUBC_R	orn 	%r17, %r0, %r29
	setx	data_start_7, %g1, %r16
	.word 0xbba84820  ! 2078: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7510000  ! 2079: RDPR_TICK	<illegal instruction>
	.word 0xbf520000  ! 2081: RDPR_PIL	<illegal instruction>
	.word 0xb7a40960  ! 2085: FMULq	dis not found

	setx	0x225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0x89942077  ! 2091: WRPR_TICK_I	wrpr	%r16, 0x0077, %tick
	.word 0xb5504000  ! 2098: RDPR_TNPC	<illegal instruction>
	.word 0xbeac206d  ! 2103: ANDNcc_I	andncc 	%r16, 0x006d, %r31
	.word 0xbba84820  ! 2113: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb751c000  ! 2116: RDPR_TL	<illegal instruction>
	.word 0xb80d607f  ! 2118: AND_I	and 	%r21, 0x007f, %r28
	.word 0xb9a81420  ! 2119: FMOVRNZ	dis not found

	.word 0xb1520000  ! 2123: RDPR_PIL	<illegal instruction>
	.word 0xbda80420  ! 2125: FMOVRZ	dis not found

	.word 0xb9a50820  ! 2132: FADDs	fadds	%f20, %f0, %f28
	.word 0x8195609d  ! 2136: WRPR_TPC_I	wrpr	%r21, 0x009d, %tpc
	.word 0xbda44920  ! 2138: FMULs	fmuls	%f17, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 2150: RDPR_PSTATE	<illegal instruction>
	.word 0x8995605c  ! 2151: WRPR_TICK_I	wrpr	%r21, 0x005c, %tick
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd347001  ! 2157: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xb3500000  ! 2158: RDPR_TPC	<illegal instruction>
	.word 0xb7a509c0  ! 2159: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb1a00540  ! 2163: FSQRTd	fsqrt	
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919521f1  ! 2173: WRPR_PIL_I	wrpr	%r20, 0x01f1, %pil
	.word 0xb9a9c820  ! 2176: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa509c0  ! 2179: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb5a00520  ! 2180: FSQRTs	fsqrt	
	.word 0xbfa50940  ! 2184: FMULd	fmuld	%f20, %f0, %f62
	.word 0x85946113  ! 2186: WRPR_TSTATE_I	wrpr	%r17, 0x0113, %tstate
	setx	data_start_7, %g1, %r21
	.word 0xbba80820  ! 2191: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2193: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd518000  ! 2196: RDPR_PSTATE	<illegal instruction>
	setx	0x20229, %g1, %o0
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
	.word 0x81946039  ! 2200: WRPR_TPC_I	wrpr	%r17, 0x0039, %tpc
	.word 0xb28c202d  ! 2201: ANDcc_I	andcc 	%r16, 0x002d, %r25
	.word 0xb3a81820  ! 2202: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7aac820  ! 2206: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbda5c820  ! 2207: FADDs	fadds	%f23, %f0, %f30
	.word 0xb1518000  ! 2209: RDPR_PSTATE	<illegal instruction>
	.word 0xb03c2120  ! 2211: XNOR_I	xnor 	%r16, 0x0120, %r24
	.word 0xbfa00040  ! 2212: FMOVd	fmovd	%f0, %f62
	.word 0xb82c4000  ! 2213: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xb32db001  ! 2216: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0x8794e1c1  ! 2217: WRPR_TT_I	wrpr	%r19, 0x01c1, %tt
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2219: RDPR_TNPC	<illegal instruction>
	.word 0xb1643801  ! 2220: MOVcc_I	<illegal instruction>
	.word 0xb7a9c820  ! 2221: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a84820  ! 2222: FMOVE	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 2223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa58940  ! 2224: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb3a80820  ! 2227: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0x8394e168  ! 2228: WRPR_TNPC_I	wrpr	%r19, 0x0168, %tnpc
	.word 0xb9500000  ! 2239: RDPR_TPC	<illegal instruction>
	.word 0xbd510000  ! 2241: RDPR_TICK	<illegal instruction>
	.word 0xb9a4c820  ! 2246: FADDs	fadds	%f19, %f0, %f28
	.word 0xb7540000  ! 2251: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	.word 0xbda488e0  ! 2254: FSUBq	dis not found

	.word 0xbe14a00f  ! 2255: OR_I	or 	%r18, 0x000f, %r31
	.word 0xb5a40820  ! 2261: FADDs	fadds	%f16, %f0, %f26
	.word 0xb1a54820  ! 2263: FADDs	fadds	%f21, %f0, %f24
	.word 0xb2b54000  ! 2264: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0x87942096  ! 2267: WRPR_TT_I	wrpr	%r16, 0x0096, %tt
	.word 0xb1a548c0  ! 2268: FSUBd	fsubd	%f52, %f0, %f24
	.word 0x91946061  ! 2272: WRPR_PIL_I	wrpr	%r17, 0x0061, %pil
	.word 0xb8354000  ! 2273: ORN_R	orn 	%r21, %r0, %r28
	.word 0xbfa80420  ! 2276: FMOVRZ	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 2278: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a80820  ! 2280: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5347001  ! 2285: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0x859460bf  ! 2287: WRPR_TSTATE_I	wrpr	%r17, 0x00bf, %tstate
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88d20f1  ! 2290: ANDcc_I	andcc 	%r20, 0x00f1, %r28
	.word 0xbb643801  ! 2294: MOVcc_I	<illegal instruction>
	.word 0xbba5c8e0  ! 2295: FSUBq	dis not found

	.word 0xb3a00520  ! 2296: FSQRTs	fsqrt	
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8e0  ! 2308: FSUBq	dis not found

	.word 0xb3a48820  ! 2309: FADDs	fadds	%f18, %f0, %f25
	.word 0xb024e0a7  ! 2312: SUB_I	sub 	%r19, 0x00a7, %r24
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40860  ! 2316: FADDq	dis not found

	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 2326: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x87942123  ! 2327: WRPR_TT_I	wrpr	%r16, 0x0123, %tt
	.word 0xb5a80820  ! 2328: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbda00040  ! 2329: FMOVd	fmovd	%f0, %f30
	.word 0xbc1c61ef  ! 2331: XOR_I	xor 	%r17, 0x01ef, %r30
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0xb9ab0820  ! 2339: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5abc820  ! 2346: FMOVVC	fmovs	%fcc1, %f0, %f26
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb41c60ab  ! 2348: XOR_I	xor 	%r17, 0x00ab, %r26
	.word 0xb9a90820  ! 2349: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa409a0  ! 2354: FDIVs	fdivs	%f16, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 2356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	setx	data_start_2, %g1, %r18
	mov	2, %r14
	.word 0xa193a000  ! 2359: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7aac820  ! 2360: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a94820  ! 2364: FMOVCS	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f932000  ! 2367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd510000  ! 2372: RDPR_TICK	<illegal instruction>
	.word 0x899460ca  ! 2375: WRPR_TICK_I	wrpr	%r17, 0x00ca, %tick
	.word 0xb9a00520  ! 2376: FSQRTs	fsqrt	
	.word 0x87952003  ! 2379: WRPR_TT_I	wrpr	%r20, 0x0003, %tt
	.word 0x919560fd  ! 2380: WRPR_PIL_I	wrpr	%r21, 0x00fd, %pil
	.word 0xb81ca140  ! 2381: XOR_I	xor 	%r18, 0x0140, %r28
	.word 0xb7ab0820  ! 2382: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80c20  ! 2383: FMOVRLZ	dis not found

	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa489a0  ! 2400: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xbda5c9a0  ! 2404: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb7a448e0  ! 2405: FSUBq	dis not found

	.word 0xb7ab4820  ! 2408: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1abc820  ! 2409: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbcad8000  ! 2411: ANDNcc_R	andncc 	%r22, %r0, %r30
	.word 0xb1a488e0  ! 2412: FSUBq	dis not found

	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a489c0  ! 2415: FDIVd	fdivd	%f18, %f0, %f26
	.word 0x8795a16c  ! 2417: WRPR_TT_I	wrpr	%r22, 0x016c, %tt
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 2420: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbd3d5000  ! 2421: SRAX_R	srax	%r21, %r0, %r30
	.word 0xb3a4c920  ! 2422: FMULs	fmuls	%f19, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 2423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xb1abc820  ! 2424: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9540000  ! 2426: RDPR_GL	<illegal instruction>
	.word 0x8194e0a9  ! 2427: WRPR_TPC_I	wrpr	%r19, 0x00a9, %tpc
	.word 0xbdaa0820  ! 2430: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x879521d0  ! 2436: WRPR_TT_I	wrpr	%r20, 0x01d0, %tt
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2439: RDPR_GL	<illegal instruction>
	.word 0xbda00560  ! 2440: FSQRTq	fsqrt	
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda40960  ! 2443: FMULq	dis not found

	.word 0xb1a84820  ! 2444: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbc354000  ! 2446: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xb1a9c820  ! 2453: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbeb5c000  ! 2459: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xb5520000  ! 2460: RDPR_PIL	<illegal instruction>
	.word 0xb49c8000  ! 2467: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xb7a00540  ! 2472: FSQRTd	fsqrt	
	.word 0xb9a80420  ! 2475: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982811  ! 2476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0811, %hpstate
	.word 0xbfa00520  ! 2477: FSQRTs	fsqrt	
	.word 0xbda489c0  ! 2479: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb7a8c820  ! 2481: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab0820  ! 2482: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 2487: FSQRTd	fsqrt	
	.word 0xb1a98820  ! 2488: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb89c210c  ! 2490: XORcc_I	xorcc 	%r16, 0x010c, %r28
	.word 0xbba448c0  ! 2492: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb7a00560  ! 2493: FSQRTq	fsqrt	
	.word 0xb3a94820  ! 2494: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 2504: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda48920  ! 2509: FMULs	fmuls	%f18, %f0, %f30
	.word 0xb7aac820  ! 2512: FMOVGE	fmovs	%fcc1, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 2513: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0854000  ! 2516: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xbdaac820  ! 2518: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 2519: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81c20  ! 2520: FMOVRGEZ	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 2525: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3aa0820  ! 2528: FMOVA	fmovs	%fcc1, %f0, %f25
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48820  ! 2535: FADDs	fadds	%f18, %f0, %f31
	.word 0xb7a508c0  ! 2538: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1500000  ! 2543: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xb22c601d  ! 2549: ANDN_I	andn 	%r17, 0x001d, %r25
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 2556: FSQRTs	fsqrt	
	.word 0xb1a8c820  ! 2559: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb9500000  ! 2560: RDPR_TPC	<illegal instruction>
	.word 0xbba4c840  ! 2561: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a81420  ! 2562: FMOVRNZ	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 2563: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a408c0  ! 2564: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb9a58820  ! 2565: FADDs	fadds	%f22, %f0, %f28
	.word 0xb414611d  ! 2567: OR_I	or 	%r17, 0x011d, %r26
	.word 0xb5a549e0  ! 2568: FDIVq	dis not found

	.word 0xb3510000  ! 2569: RDPR_TICK	<illegal instruction>
	.word 0xb350c000  ! 2576: RDPR_TT	<illegal instruction>
	.word 0xb3a48960  ! 2577: FMULq	dis not found

	.word 0xbfa00520  ! 2590: FSQRTs	fsqrt	
	.word 0xb5a409c0  ! 2591: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xb7480000  ! 2592: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_2, %g1, %r23
	.word 0xb1a44920  ! 2595: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb3a00040  ! 2598: FMOVd	fmovd	%f0, %f56
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2603: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbe8c0000  ! 2604: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xbc450000  ! 2605: ADDC_R	addc 	%r20, %r0, %r30
	mov	0, %r12
	.word 0x8f932000  ! 2607: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa50860  ! 2609: FADDq	dis not found

	.word 0xbc0ce0dd  ! 2612: AND_I	and 	%r19, 0x00dd, %r30
	.word 0xb5a00040  ! 2613: FMOVd	fmovd	%f0, %f26
	.word 0x8d95a151  ! 2614: WRPR_PSTATE_I	wrpr	%r22, 0x0151, %pstate
	.word 0xbc950000  ! 2615: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xbb351000  ! 2616: SRLX_R	srlx	%r20, %r0, %r29
	.word 0xbba508c0  ! 2619: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xbba4c840  ! 2621: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a489e0  ! 2623: FDIVq	dis not found

	.word 0xb7a8c820  ! 2625: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbbaa8820  ! 2627: FMOVG	fmovs	%fcc1, %f0, %f29
	setx	data_start_6, %g1, %r19
	.word 0xbfab4820  ! 2629: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0x859460ff  ! 2633: WRPR_TSTATE_I	wrpr	%r17, 0x00ff, %tstate
	.word 0xb1518000  ! 2637: RDPR_PSTATE	<illegal instruction>
	.word 0xbd3c4000  ! 2638: SRA_R	sra 	%r17, %r0, %r30
	.word 0xbb345000  ! 2641: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb5a44820  ! 2643: FADDs	fadds	%f17, %f0, %f26
	.word 0xbba408e0  ! 2644: FSUBq	dis not found

	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 2651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0xbda90820  ! 2653: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbf500000  ! 2656: RDPR_TPC	<illegal instruction>
	.word 0xbba409c0  ! 2657: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xbfa00560  ! 2658: FSQRTq	fsqrt	
	.word 0xb1a80820  ! 2659: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa81420  ! 2661: FMOVRNZ	dis not found

	.word 0xbfa81820  ! 2662: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a81c20  ! 2663: FMOVRGEZ	dis not found

	.word 0xb1a40960  ! 2667: FMULq	dis not found

	.word 0xb1a80420  ! 2670: FMOVRZ	dis not found

	.word 0xb5aa8820  ! 2671: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a88820  ! 2675: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a8c820  ! 2676: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbba548a0  ! 2681: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb5a80420  ! 2682: FMOVRZ	dis not found

	.word 0xb3ab0820  ! 2687: FMOVGU	fmovs	%fcc1, %f0, %f25
	setx	0x20f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 2689: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbda54860  ! 2691: FADDq	dis not found

	.word 0xbfa00560  ! 2692: FSQRTq	fsqrt	
	.word 0xba94c000  ! 2695: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xb7a548e0  ! 2698: FSUBq	dis not found

	.word 0xbebd0000  ! 2700: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xbba44860  ! 2703: FADDq	dis not found

	.word 0xb9a00540  ! 2704: FSQRTd	fsqrt	
	.word 0xb7a00020  ! 2707: FMOVs	fmovs	%f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 2708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xb1a588e0  ! 2709: FSUBq	dis not found

	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3cc000  ! 2713: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0x839420bc  ! 2714: WRPR_TNPC_I	wrpr	%r16, 0x00bc, %tnpc
	.word 0xba2d205f  ! 2715: ANDN_I	andn 	%r20, 0x005f, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983a91  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a91, %hpstate
	.word 0xb3a00520  ! 2719: FSQRTs	fsqrt	
	.word 0xb7a508c0  ! 2720: FSUBd	fsubd	%f20, %f0, %f58
	.word 0x859420e7  ! 2722: WRPR_TSTATE_I	wrpr	%r16, 0x00e7, %tstate
	setx	data_start_6, %g1, %r21
	.word 0xba144000  ! 2725: OR_R	or 	%r17, %r0, %r29
	.word 0xb1a449e0  ! 2729: FDIVq	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 2731: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85946194  ! 2732: WRPR_TSTATE_I	wrpr	%r17, 0x0194, %tstate
	.word 0xbfa589c0  ! 2735: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbfa589a0  ! 2737: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xbda44860  ! 2741: FADDq	dis not found

	.word 0x8595217f  ! 2745: WRPR_TSTATE_I	wrpr	%r20, 0x017f, %tstate
	.word 0xbe8c4000  ! 2746: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xb9a81c20  ! 2750: FMOVRGEZ	dis not found

	.word 0xb1aac820  ! 2753: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x8594e006  ! 2756: WRPR_TSTATE_I	wrpr	%r19, 0x0006, %tstate
	.word 0xb9504000  ! 2757: RDPR_TNPC	<illegal instruction>
	.word 0xbdaa8820  ! 2765: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8595e1b7  ! 2767: WRPR_TSTATE_I	wrpr	%r23, 0x01b7, %tstate
	.word 0xb7a48840  ! 2769: FADDd	faddd	%f18, %f0, %f58
	.word 0xb21d0000  ! 2771: XOR_R	xor 	%r20, %r0, %r25
	.word 0xb3a5c9e0  ! 2772: FDIVq	dis not found

	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 2776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0x85942174  ! 2786: WRPR_TSTATE_I	wrpr	%r16, 0x0174, %tstate
	.word 0xb3a81420  ! 2788: FMOVRNZ	dis not found

	.word 0xb1a588c0  ! 2791: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb3a88820  ! 2794: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7520000  ! 2801: RDPR_PIL	<illegal instruction>
	.word 0xb7a00540  ! 2802: FSQRTd	fsqrt	
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00ce10f  ! 2810: AND_I	and 	%r19, 0x010f, %r24
	.word 0xb9518000  ! 2811: RDPR_PSTATE	<illegal instruction>
	.word 0x85942172  ! 2813: WRPR_TSTATE_I	wrpr	%r16, 0x0172, %tstate
	.word 0x8794e138  ! 2814: WRPR_TT_I	wrpr	%r19, 0x0138, %tt
	.word 0xbba5c8a0  ! 2815: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb3504000  ! 2817: RDPR_TNPC	<illegal instruction>
	.word 0xb2a560a4  ! 2822: SUBcc_I	subcc 	%r21, 0x00a4, %r25
	.word 0xb7a549a0  ! 2827: FDIVs	fdivs	%f21, %f0, %f27
	setx	data_start_7, %g1, %r23
	.word 0x859560a5  ! 2832: WRPR_TSTATE_I	wrpr	%r21, 0x00a5, %tstate
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02de0fc  ! 2836: ANDN_I	andn 	%r23, 0x00fc, %r24
	.word 0xb5a00540  ! 2838: FSQRTd	fsqrt	
	mov	0, %r12
	.word 0x8f932000  ! 2841: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc154000  ! 2842: OR_R	or 	%r21, %r0, %r30
	.word 0xb88ca11f  ! 2848: ANDcc_I	andcc 	%r18, 0x011f, %r28
	.word 0x8594605b  ! 2851: WRPR_TSTATE_I	wrpr	%r17, 0x005b, %tstate
	.word 0xb5a94820  ! 2856: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbab4a14c  ! 2862: SUBCcc_I	orncc 	%r18, 0x014c, %r29
	.word 0xb7a00540  ! 2866: FSQRTd	fsqrt	
	.word 0xb644c000  ! 2869: ADDC_R	addc 	%r19, %r0, %r27
	.word 0x8995e0f4  ! 2871: WRPR_TICK_I	wrpr	%r23, 0x00f4, %tick
	.word 0xb3518000  ! 2873: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983bdb  ! 2874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bdb, %hpstate
	setx	data_start_0, %g1, %r16
	.word 0xb1a80820  ! 2880: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfab8820  ! 2881: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a54940  ! 2884: FMULd	fmuld	%f52, %f0, %f24
	.word 0xbda88820  ! 2886: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3ab4820  ! 2887: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba409a0  ! 2889: FDIVs	fdivs	%f16, %f0, %f29
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2897: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982cd1  ! 2902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd1, %hpstate
	.word 0xb1520000  ! 2903: RDPR_PIL	<illegal instruction>
	.word 0xb3a48920  ! 2905: FMULs	fmuls	%f18, %f0, %f25
	.word 0xbda00020  ! 2908: FMOVs	fmovs	%f0, %f30
	.word 0xb1abc820  ! 2913: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9643801  ! 2914: MOVcc_I	<illegal instruction>
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520da  ! 2916: WRPR_TNPC_I	wrpr	%r20, 0x00da, %tnpc
	.word 0xb1aa8820  ! 2922: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa4820  ! 2923: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	data_start_3, %g1, %r22
	.word 0xbda00020  ! 2931: FMOVs	fmovs	%f0, %f30
	.word 0xb6854000  ! 2935: ADDcc_R	addcc 	%r21, %r0, %r27
	.word 0xb6c520cb  ! 2937: ADDCcc_I	addccc 	%r20, 0x00cb, %r27
	.word 0x8795607e  ! 2940: WRPR_TT_I	wrpr	%r21, 0x007e, %tt
	.word 0x839521a5  ! 2945: WRPR_TNPC_I	wrpr	%r20, 0x01a5, %tnpc
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e15a  ! 2948: WRPR_TNPC_I	wrpr	%r23, 0x015a, %tnpc
	.word 0xb1a00520  ! 2951: FSQRTs	fsqrt	
	.word 0xbda48820  ! 2952: FADDs	fadds	%f18, %f0, %f30
	.word 0xb1a549a0  ! 2954: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbfa94820  ! 2956: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbd480000  ! 2957: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982d83  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0xb01d0000  ! 2960: XOR_R	xor 	%r20, %r0, %r24
	.word 0xbbab0820  ! 2968: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00540  ! 2971: FSQRTd	fsqrt	
	.word 0xbd510000  ! 2976: RDPR_TICK	<illegal instruction>
	.word 0x8194e125  ! 2978: WRPR_TPC_I	wrpr	%r19, 0x0125, %tpc
	.word 0xb4bca1ba  ! 2981: XNORcc_I	xnorcc 	%r18, 0x01ba, %r26
	.word 0x8395a06b  ! 2982: WRPR_TNPC_I	wrpr	%r22, 0x006b, %tnpc
	.word 0xb9a489a0  ! 2983: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb7a4c8a0  ! 2984: FSUBs	fsubs	%f19, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 2985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xb9aa4820  ! 2988: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbba5c840  ! 2996: FADDd	faddd	%f54, %f0, %f60
	.word 0xbf504000  ! 2997: RDPR_TNPC	<illegal instruction>
	.word 0xb934b001  ! 3005: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb7a88820  ! 3006: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r23
	.word 0xb7a549e0  ! 3012: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1540000  ! 3018: RDPR_GL	<illegal instruction>
	.word 0xbfa00520  ! 3021: FSQRTs	fsqrt	
	.word 0xb5a44860  ! 3022: FADDq	dis not found

	.word 0xbb518000  ! 3024: RDPR_PSTATE	<illegal instruction>
	.word 0xb5aa8820  ! 3025: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a4c8e0  ! 3027: FSUBq	dis not found

	.word 0xb9a54820  ! 3028: FADDs	fadds	%f21, %f0, %f28
	.word 0xbfab4820  ! 3030: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbfa44960  ! 3031: FMULq	dis not found

	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3034: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00020  ! 3036: FMOVs	fmovs	%f0, %f28
	.word 0xb4b5a060  ! 3037: ORNcc_I	orncc 	%r22, 0x0060, %r26
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 3040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0xb0b58000  ! 3041: ORNcc_R	orncc 	%r22, %r0, %r24
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 3046: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 3048: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	.word 0xb1540000  ! 3049: RDPR_GL	<illegal instruction>
	.word 0xb80c0000  ! 3050: AND_R	and 	%r16, %r0, %r28
	.word 0xb9a90820  ! 3052: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	data_start_0, %g1, %r19
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 3058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3cd000  ! 3066: SRAX_R	srax	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c8a0  ! 3073: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb7a4c820  ! 3074: FADDs	fadds	%f19, %f0, %f27
	.word 0xba95a1c8  ! 3077: ORcc_I	orcc 	%r22, 0x01c8, %r29
	.word 0xb1a548e0  ! 3084: FSUBq	dis not found

	.word 0xbf50c000  ! 3087: RDPR_TT	<illegal instruction>
	.word 0x839420a8  ! 3088: WRPR_TNPC_I	wrpr	%r16, 0x00a8, %tnpc
	mov	2, %r12
	.word 0x8f932000  ! 3090: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9508000  ! 3091: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00040  ! 3093: FMOVd	fmovd	%f0, %f58
	.word 0xb3abc820  ! 3094: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9504000  ! 3095: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 3097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0xbfab8820  ! 3098: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c9e0  ! 3100: FDIVq	dis not found

	.word 0xb9a00560  ! 3101: FSQRTq	fsqrt	
	.word 0xbda81820  ! 3103: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb7540000  ! 3107: RDPR_GL	<illegal instruction>
	.word 0xbfa00560  ! 3108: FSQRTq	fsqrt	
	.word 0xbba00540  ! 3110: FSQRTd	fsqrt	
	setx	data_start_4, %g1, %r20
	.word 0xb3a588e0  ! 3118: FSUBq	dis not found

	.word 0xb4bd8000  ! 3119: XNORcc_R	xnorcc 	%r22, %r0, %r26
	setx	data_start_1, %g1, %r16
	mov	1, %r12
	.word 0x8f932000  ! 3127: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a589c0  ! 3128: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbf540000  ! 3129: RDPR_GL	<illegal instruction>
	.word 0xbda40940  ! 3131: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb1504000  ! 3132: RDPR_TNPC	<illegal instruction>
	.word 0xbab44000  ! 3134: ORNcc_R	orncc 	%r17, %r0, %r29
	.word 0xbfa90820  ! 3135: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982dd9  ! 3136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd9, %hpstate
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508a0  ! 3139: FSUBs	fsubs	%f20, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a98820  ! 3142: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb9520000  ! 3143: RDPR_PIL	<illegal instruction>
	.word 0xb1aa0820  ! 3144: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbfa81c20  ! 3145: FMOVRGEZ	dis not found

	.word 0xb43460c4  ! 3155: ORN_I	orn 	%r17, 0x00c4, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba00520  ! 3158: FSQRTs	fsqrt	
	.word 0xb3510000  ! 3162: RDPR_TICK	<illegal instruction>
	.word 0xbd480000  ! 3163: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb2350000  ! 3164: SUBC_R	orn 	%r20, %r0, %r25
	.word 0xbd540000  ! 3169: RDPR_GL	<illegal instruction>
	.word 0xb7a80820  ! 3171: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a58840  ! 3172: FADDd	faddd	%f22, %f0, %f28
	.word 0xbba589c0  ! 3174: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb414e1b3  ! 3176: OR_I	or 	%r19, 0x01b3, %r26
	.word 0xb1ab0820  ! 3179: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 3187: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80820  ! 3188: FMOVN	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983b1b  ! 3192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1b, %hpstate
	.word 0xb3a8c820  ! 3196: FMOVL	fmovs	%fcc1, %f0, %f25
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3de0b5  ! 3203: XNOR_I	xnor 	%r23, 0x00b5, %r31
	.word 0xb3a00560  ! 3209: FSQRTq	fsqrt	
	.word 0xb351c000  ! 3210: RDPR_TL	<illegal instruction>
	.word 0xbda588a0  ! 3213: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xbe3561a7  ! 3214: ORN_I	orn 	%r21, 0x01a7, %r31
	.word 0xbe9c8000  ! 3218: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0x8d946145  ! 3221: WRPR_PSTATE_I	wrpr	%r17, 0x0145, %pstate
	setx	data_start_1, %g1, %r17
	.word 0x8d94a0b0  ! 3231: WRPR_PSTATE_I	wrpr	%r18, 0x00b0, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x8198294b  ! 3234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094b, %hpstate
	.word 0xb3a88820  ! 3237: FMOVLE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8594e10e  ! 3241: WRPR_TSTATE_I	wrpr	%r19, 0x010e, %tstate
	.word 0xbd504000  ! 3252: RDPR_TNPC	<illegal instruction>
	.word 0xb9a88820  ! 3253: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbd2cb001  ! 3254: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xbba48920  ! 3256: FMULs	fmuls	%f18, %f0, %f29
	.word 0xbda00560  ! 3258: FSQRTq	fsqrt	
	.word 0xbfa8c820  ! 3261: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb8adc000  ! 3262: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xbda8c820  ! 3269: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5a88820  ! 3271: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb5abc820  ! 3272: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb3520000  ! 3273: RDPR_PIL	<illegal instruction>
	.word 0xb9a98820  ! 3276: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbf510000  ! 3277: RDPR_TICK	<illegal instruction>
	.word 0xbfa80420  ! 3278: FMOVRZ	dis not found

	.word 0xb7540000  ! 3279: RDPR_GL	<illegal instruction>
	.word 0xb8b5c000  ! 3280: SUBCcc_R	orncc 	%r23, %r0, %r28
	mov	1, %r12
	.word 0x8f932000  ! 3282: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899460f0  ! 3287: WRPR_TICK_I	wrpr	%r17, 0x00f0, %tick
	.word 0xb01420ef  ! 3288: OR_I	or 	%r16, 0x00ef, %r24
	.word 0xbda54960  ! 3290: FMULq	dis not found

	.word 0xb9a588c0  ! 3291: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xbda488c0  ! 3295: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xbba80820  ! 3297: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a9c820  ! 3298: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbb7ce401  ! 3299: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xbbaa4820  ! 3300: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5518000  ! 3302: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3303: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 3305: RDPR_TICK	<illegal instruction>
	.word 0xb3a4c9e0  ! 3307: FDIVq	dis not found

	.word 0xbe24c000  ! 3311: SUB_R	sub 	%r19, %r0, %r31
	.word 0xb3a8c820  ! 3313: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb28de12d  ! 3319: ANDcc_I	andcc 	%r23, 0x012d, %r25
	.word 0x8395614b  ! 3326: WRPR_TNPC_I	wrpr	%r21, 0x014b, %tnpc
	.word 0x8995601a  ! 3328: WRPR_TICK_I	wrpr	%r21, 0x001a, %tick
	.word 0xbba81420  ! 3331: FMOVRNZ	dis not found

	.word 0xb3a88820  ! 3336: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0248000  ! 3339: SUB_R	sub 	%r18, %r0, %r24
	.word 0xb9a489a0  ! 3340: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb7aa8820  ! 3341: FMOVG	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r19
	.word 0x8794208a  ! 3344: WRPR_TT_I	wrpr	%r16, 0x008a, %tt
	.word 0xbfa40940  ! 3345: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb5a81820  ! 3346: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3d4000  ! 3355: XNOR_R	xnor 	%r21, %r0, %r31
	.word 0xbf500000  ! 3356: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c8c0  ! 3360: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbba50860  ! 3362: FADDq	dis not found

	.word 0x8d94e117  ! 3363: WRPR_PSTATE_I	wrpr	%r19, 0x0117, %pstate
	.word 0xbda88820  ! 3366: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb8c54000  ! 3368: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0xb1a58840  ! 3370: FADDd	faddd	%f22, %f0, %f24
	.word 0x81942007  ! 3372: WRPR_TPC_I	wrpr	%r16, 0x0007, %tpc
	.word 0xb1a81420  ! 3382: FMOVRNZ	dis not found

	.word 0xb5aa8820  ! 3383: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 3387: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb9510000  ! 3391: RDPR_TICK	<illegal instruction>
	.word 0xb9ab8820  ! 3392: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb834612c  ! 3394: SUBC_I	orn 	%r17, 0x012c, %r28
	.word 0xb5a449e0  ! 3395: FDIVq	dis not found

	.word 0xb7a00540  ! 3397: FSQRTd	fsqrt	
	.word 0xb9508000  ! 3398: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e0af  ! 3402: WRPR_TT_I	wrpr	%r19, 0x00af, %tt
	.word 0xbba80420  ! 3405: FMOVRZ	dis not found

	setx	data_start_0, %g1, %r17
	.word 0x8d9421bd  ! 3407: WRPR_PSTATE_I	wrpr	%r16, 0x01bd, %pstate
	.word 0xbfa88820  ! 3408: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbba409e0  ! 3410: FDIVq	dis not found

	.word 0x8395a01c  ! 3411: WRPR_TNPC_I	wrpr	%r22, 0x001c, %tnpc
	.word 0xb9480000  ! 3412: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1a00020  ! 3414: FMOVs	fmovs	%f0, %f24
	.word 0xbbaa0820  ! 3422: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a549e0  ! 3423: FDIVq	dis not found

	.word 0xb53c5000  ! 3424: SRAX_R	srax	%r17, %r0, %r26
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a105  ! 3432: WRPR_TT_I	wrpr	%r22, 0x0105, %tt
	.word 0xb7504000  ! 3434: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xb3518000  ! 3442: RDPR_PSTATE	<illegal instruction>
	.word 0xb3518000  ! 3443: RDPR_PSTATE	<illegal instruction>
	.word 0xbda94820  ! 3445: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 3450: FMOVRLZ	dis not found

	.word 0xb9a548e0  ! 3452: FSUBq	dis not found

	.word 0x819461aa  ! 3453: WRPR_TPC_I	wrpr	%r17, 0x01aa, %tpc
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 3455: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a50920  ! 3457: FMULs	fmuls	%f20, %f0, %f27
	.word 0xbfa88820  ! 3459: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa4820  ! 3464: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c840  ! 3465: FADDd	faddd	%f54, %f0, %f58
	.word 0xb9520000  ! 3466: RDPR_PIL	<illegal instruction>
	.word 0xb9a408a0  ! 3469: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xbba81820  ! 3479: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbdaa8820  ! 3481: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a88820  ! 3484: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a449a0  ! 3486: FDIVs	fdivs	%f17, %f0, %f24
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 3490: RDPR_PIL	<illegal instruction>
	.word 0xb9a44860  ! 3495: FADDq	dis not found

	.word 0xbda54840  ! 3498: FADDd	faddd	%f52, %f0, %f30
	.word 0xb3ab8820  ! 3500: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0x9195e11c  ! 3504: WRPR_PIL_I	wrpr	%r23, 0x011c, %pil
	.word 0xb0944000  ! 3506: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xbda5c960  ! 3507: FMULq	dis not found

	.word 0xb48d6104  ! 3508: ANDcc_I	andcc 	%r21, 0x0104, %r26
	.word 0xbb520000  ! 3509: RDPR_PIL	<illegal instruction>
	.word 0xb9510000  ! 3510: RDPR_TICK	<illegal instruction>
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda44860  ! 3521: FADDq	dis not found

	.word 0xbda489c0  ! 3522: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xbe9c61a0  ! 3525: XORcc_I	xorcc 	%r17, 0x01a0, %r31
	.word 0xb7a5c820  ! 3528: FADDs	fadds	%f23, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa94820  ! 3532: FMOVCS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3537: RDPR_TICK	<illegal instruction>
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 3541: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb004c000  ! 3543: ADD_R	add 	%r19, %r0, %r24
	.word 0xbda00560  ! 3545: FSQRTq	fsqrt	
	.word 0xbda5c8e0  ! 3547: FSUBq	dis not found

	.word 0xbba00540  ! 3551: FSQRTd	fsqrt	
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 3554: FMOVs	fmovs	%f0, %f25
	.word 0x8594e12a  ! 3559: WRPR_TSTATE_I	wrpr	%r19, 0x012a, %tstate
	.word 0xbda80820  ! 3560: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbf518000  ! 3561: RDPR_PSTATE	<illegal instruction>
	.word 0xbda88820  ! 3563: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00020  ! 3564: FMOVs	fmovs	%f0, %f25
	.word 0xbba81820  ! 3569: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb5a80c20  ! 3571: FMOVRLZ	dis not found

	.word 0xb7aac820  ! 3572: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80820  ! 3576: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb7a408c0  ! 3582: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb3a54860  ! 3584: FADDq	dis not found

	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50920  ! 3586: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb9a549e0  ! 3588: FDIVq	dis not found

	.word 0xb5a00540  ! 3592: FSQRTd	fsqrt	
	.word 0xbdabc820  ! 3593: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0x8195e0a9  ! 3596: WRPR_TPC_I	wrpr	%r23, 0x00a9, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb351c000  ! 3598: RDPR_TL	<illegal instruction>
	.word 0xb41d60b5  ! 3600: XOR_I	xor 	%r21, 0x00b5, %r26
	.word 0xbfa98820  ! 3601: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00560  ! 3604: FSQRTq	fsqrt	
	.word 0xb9aa4820  ! 3605: FMOVNE	fmovs	%fcc1, %f0, %f28
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 3610: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbd510000  ! 3615: RDPR_TICK	<illegal instruction>
	.word 0xbb50c000  ! 3619: RDPR_TT	<illegal instruction>
	.word 0xb5a8c820  ! 3628: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb48c60e0  ! 3629: ANDcc_I	andcc 	%r17, 0x00e0, %r26
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942086  ! 3631: WRPR_TT_I	wrpr	%r16, 0x0086, %tt
	.word 0xbcc5e1b8  ! 3632: ADDCcc_I	addccc 	%r23, 0x01b8, %r30
	.word 0xbfaa8820  ! 3636: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbda50860  ! 3640: FADDq	dis not found

	.word 0xbfab4820  ! 3641: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 3644: FMOVd	fmovd	%f0, %f58
	.word 0xbe9c61b2  ! 3645: XORcc_I	xorcc 	%r17, 0x01b2, %r31
	.word 0xbfa408a0  ! 3646: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbe9c0000  ! 3650: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xb7500000  ! 3651: RDPR_TPC	<illegal instruction>
	.word 0x8195615d  ! 3654: WRPR_TPC_I	wrpr	%r21, 0x015d, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982f8b  ! 3656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8b, %hpstate
	.word 0xbda88820  ! 3657: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9540000  ! 3658: RDPR_GL	<illegal instruction>
	.word 0xb9510000  ! 3663: RDPR_TICK	<illegal instruction>
	setx	data_start_2, %g1, %r19
	setx	data_start_3, %g1, %r19
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 3675: FSQRTq	fsqrt	
	.word 0x8594e160  ! 3676: WRPR_TSTATE_I	wrpr	%r19, 0x0160, %tstate
	.word 0xb23d4000  ! 3678: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xb5a589e0  ! 3679: FDIVq	dis not found

	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952033  ! 3681: WRPR_PSTATE_I	wrpr	%r20, 0x0033, %pstate
	.word 0x819561d9  ! 3683: WRPR_TPC_I	wrpr	%r21, 0x01d9, %tpc
	.word 0xbdab0820  ! 3693: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb8350000  ! 3695: SUBC_R	orn 	%r20, %r0, %r28
	.word 0xbfa58920  ! 3710: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb0c54000  ! 3714: ADDCcc_R	addccc 	%r21, %r0, %r24
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3718: FSQRTq	fsqrt	
	.word 0xb1508000  ! 3720: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e090  ! 3721: WRPR_PSTATE_I	wrpr	%r19, 0x0090, %pstate
	.word 0xb1a98820  ! 3722: FMOVNEG	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983dc9  ! 3725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc9, %hpstate
	.word 0xbac460b5  ! 3727: ADDCcc_I	addccc 	%r17, 0x00b5, %r29
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a589a0  ! 3734: FDIVs	fdivs	%f22, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982ec9  ! 3735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec9, %hpstate
	.word 0x8195a153  ! 3745: WRPR_TPC_I	wrpr	%r22, 0x0153, %tpc
	.word 0xbc9ca0be  ! 3748: XORcc_I	xorcc 	%r18, 0x00be, %r30
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 3758: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80c20  ! 3760: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0x8f932000  ! 3763: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a4c840  ! 3764: FADDd	faddd	%f50, %f0, %f26
	.word 0xb9a488c0  ! 3766: FSUBd	fsubd	%f18, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983a89  ! 3767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a89, %hpstate
	.word 0xbbabc820  ! 3769: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c860  ! 3775: FADDq	dis not found

	.word 0xbda448a0  ! 3776: FSUBs	fsubs	%f17, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 3778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xb751c000  ! 3781: RDPR_TL	<illegal instruction>
	.word 0xb9a00040  ! 3783: FMOVd	fmovd	%f0, %f28
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a489a0  ! 3788: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xb52df001  ! 3790: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xb7a00560  ! 3791: FSQRTq	fsqrt	
	.word 0x83956149  ! 3792: WRPR_TNPC_I	wrpr	%r21, 0x0149, %tnpc
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a50960  ! 3796: FMULq	dis not found

	.word 0xbda00560  ! 3797: FSQRTq	fsqrt	
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 3803: RDPR_TL	<illegal instruction>
	.word 0x83942113  ! 3804: WRPR_TNPC_I	wrpr	%r16, 0x0113, %tnpc
	.word 0xb5508000  ! 3809: RDPR_TSTATE	<illegal instruction>
	.word 0xb9643801  ! 3812: MOVcc_I	<illegal instruction>
	.word 0x8d95a067  ! 3814: WRPR_PSTATE_I	wrpr	%r22, 0x0067, %pstate
	.word 0xbfa40840  ! 3815: FADDd	faddd	%f16, %f0, %f62
	.word 0xb9a8c820  ! 3817: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8194a169  ! 3820: WRPR_TPC_I	wrpr	%r18, 0x0169, %tpc
	.word 0xb351c000  ! 3821: RDPR_TL	<illegal instruction>
	.word 0xbda488a0  ! 3829: FSUBs	fsubs	%f18, %f0, %f30
	setx	data_start_0, %g1, %r20
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc858000  ! 3837: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xbba84820  ! 3839: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 3847: FSQRTq	fsqrt	
	.word 0xb3a00020  ! 3848: FMOVs	fmovs	%f0, %f25
	.word 0x91956107  ! 3849: WRPR_PIL_I	wrpr	%r21, 0x0107, %pil
	.word 0xbb518000  ! 3858: RDPR_PSTATE	<illegal instruction>
	.word 0xba45a11b  ! 3860: ADDC_I	addc 	%r22, 0x011b, %r29
	.word 0xb3a508c0  ! 3862: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb950c000  ! 3870: RDPR_TT	<illegal instruction>
	.word 0xb29d8000  ! 3874: XORcc_R	xorcc 	%r22, %r0, %r25
	.word 0xb1a4c9a0  ! 3876: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb9ab8820  ! 3877: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3882: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a448c0  ! 3886: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb5a48860  ! 3889: FADDq	dis not found

	.word 0xb3a58820  ! 3890: FADDs	fadds	%f22, %f0, %f25
	.word 0xb0b42003  ! 3898: ORNcc_I	orncc 	%r16, 0x0003, %r24
	.word 0xbfa4c840  ! 3900: FADDd	faddd	%f50, %f0, %f62
	.word 0xbda80c20  ! 3902: FMOVRLZ	dis not found

	.word 0xb7a44860  ! 3905: FADDq	dis not found

	.word 0xb43c61be  ! 3907: XNOR_I	xnor 	%r17, 0x01be, %r26
	.word 0xb9a84820  ! 3909: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9500000  ! 3910: RDPR_TPC	<illegal instruction>
	.word 0xb9a40820  ! 3911: FADDs	fadds	%f16, %f0, %f28
	.word 0xbe158000  ! 3912: OR_R	or 	%r22, %r0, %r31
	.word 0xb7518000  ! 3915: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982991  ! 3916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	.word 0xba0d218a  ! 3918: AND_I	and 	%r20, 0x018a, %r29
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	.word 0xb4c56119  ! 3941: ADDCcc_I	addccc 	%r21, 0x0119, %r26
	.word 0xb5a00520  ! 3942: FSQRTs	fsqrt	
	.word 0x8595a1bf  ! 3943: WRPR_TSTATE_I	wrpr	%r22, 0x01bf, %tstate
	.word 0xb7aa0820  ! 3948: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3952: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r23
	.word 0xb5a58920  ! 3955: FMULs	fmuls	%f22, %f0, %f26
	.word 0xbba80820  ! 3960: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c8a0  ! 3961: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba00040  ! 3963: FMOVd	fmovd	%f0, %f60
	.word 0xb7504000  ! 3965: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00020  ! 3966: FMOVs	fmovs	%f0, %f25
	.word 0xbfa00540  ! 3967: FSQRTd	fsqrt	
	.word 0xb9a00560  ! 3972: FSQRTq	fsqrt	
	.word 0xb5a81420  ! 3973: FMOVRNZ	dis not found

	.word 0xbfa488e0  ! 3977: FSUBq	dis not found

	.word 0xbd504000  ! 3978: RDPR_TNPC	<illegal instruction>
	.word 0x8195a089  ! 3991: WRPR_TPC_I	wrpr	%r22, 0x0089, %tpc
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 3998: FMOVs	fmovs	%f0, %f27
	.word 0xb485e072  ! 4001: ADDcc_I	addcc 	%r23, 0x0072, %r26
	.word 0xbba00540  ! 4002: FSQRTd	fsqrt	
	.word 0xb025e1ec  ! 4011: SUB_I	sub 	%r23, 0x01ec, %r24
	.word 0xb7a48920  ! 4012: FMULs	fmuls	%f18, %f0, %f27
	.word 0x8194a1dc  ! 4013: WRPR_TPC_I	wrpr	%r18, 0x01dc, %tpc
	.word 0xb1a81c20  ! 4015: FMOVRGEZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 4021: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb504000  ! 4022: RDPR_TNPC	<illegal instruction>
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ac0000  ! 4024: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xbb518000  ! 4025: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa509a0  ! 4029: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xbda00560  ! 4033: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x8198290b  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090b, %hpstate
	.word 0xbd50c000  ! 4037: RDPR_TT	<illegal instruction>
	.word 0xb1a5c940  ! 4038: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb3a448e0  ! 4039: FSUBq	dis not found

	.word 0xb2a58000  ! 4041: SUBcc_R	subcc 	%r22, %r0, %r25
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4046: RDPR_TPC	<illegal instruction>
	.word 0xb3a81420  ! 4048: FMOVRNZ	dis not found

	.word 0xb9abc820  ! 4050: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 4054: RDPR_TICK	<illegal instruction>
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33c3001  ! 4064: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xb9510000  ! 4069: RDPR_TICK	<illegal instruction>
	.word 0xb9a58960  ! 4070: FMULq	dis not found

	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4082: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00560  ! 4088: FSQRTq	fsqrt	
	.word 0xb7a409e0  ! 4090: FDIVq	dis not found

	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3d8000  ! 4093: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb3a44940  ! 4100: FMULd	fmuld	%f48, %f0, %f56
	.word 0xbfa00560  ! 4102: FSQRTq	fsqrt	
	.word 0xb7a5c9a0  ! 4104: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbd540000  ! 4105: RDPR_GL	<illegal instruction>
	.word 0xb3a00540  ! 4108: FSQRTd	fsqrt	
	.word 0xb20520e6  ! 4111: ADD_I	add 	%r20, 0x00e6, %r25
	.word 0xb7a00560  ! 4112: FSQRTq	fsqrt	
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72cd000  ! 4114: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xb3a81420  ! 4115: FMOVRNZ	dis not found

	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4120: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 4122: RDPR_TICK	<illegal instruction>
	.word 0xbfa00020  ! 4129: FMOVs	fmovs	%f0, %f31
	setx	0x2033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 4136: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00520  ! 4137: FSQRTs	fsqrt	
	.word 0xb2bde1ec  ! 4138: XNORcc_I	xnorcc 	%r23, 0x01ec, %r25
	.word 0xbda81420  ! 4139: FMOVRNZ	dis not found

	.word 0xb7ab0820  ! 4140: FMOVGU	fmovs	%fcc1, %f0, %f27
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 4142: RDPR_TT	<illegal instruction>
	.word 0xb7a589c0  ! 4149: FDIVd	fdivd	%f22, %f0, %f58
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb77c6401  ! 4152: MOVR_I	movre	%r17, 0x1, %r27
	mov	1, %r14
	.word 0xa193a000  ! 4153: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6a40000  ! 4154: SUBcc_R	subcc 	%r16, %r0, %r27
	.word 0xb7a80820  ! 4155: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb551c000  ! 4160: RDPR_TL	<illegal instruction>
	.word 0xb8950000  ! 4163: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xbfa9c820  ! 4165: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb8bd60e0  ! 4166: XNORcc_I	xnorcc 	%r21, 0x00e0, %r28
	.word 0xba2c8000  ! 4167: ANDN_R	andn 	%r18, %r0, %r29
	.word 0x91942193  ! 4168: WRPR_PIL_I	wrpr	%r16, 0x0193, %pil
	setx	data_start_5, %g1, %r22
	.word 0xbcb40000  ! 4175: ORNcc_R	orncc 	%r16, %r0, %r30
	.word 0xb3a88820  ! 4176: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00020  ! 4177: FMOVs	fmovs	%f0, %f29
	.word 0xb5a54920  ! 4178: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbb508000  ! 4179: RDPR_TSTATE	<illegal instruction>
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 4186: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3504000  ! 4189: RDPR_TNPC	<illegal instruction>
	.word 0xbba00540  ! 4192: FSQRTd	fsqrt	
	.word 0xbbaa8820  ! 4194: FMOVG	fmovs	%fcc1, %f0, %f29
	mov	0, %r14
	.word 0xa193a000  ! 4195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x89952024  ! 4197: WRPR_TICK_I	wrpr	%r20, 0x0024, %tick
	.word 0xb9a48840  ! 4204: FADDd	faddd	%f18, %f0, %f28
	.word 0xb9a58820  ! 4209: FADDs	fadds	%f22, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 4210: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd508000  ! 4211: RDPR_TSTATE	<illegal instruction>
	.word 0xb884c000  ! 4212: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb7a40940  ! 4213: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb7a81820  ! 4214: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb2bd8000  ! 4216: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xb5ab8820  ! 4217: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x8195619d  ! 4222: WRPR_TPC_I	wrpr	%r21, 0x019d, %tpc
	.word 0xb7a98820  ! 4225: FMOVNEG	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982e01  ! 4228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e01, %hpstate
	.word 0xbfa509a0  ! 4229: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xbdaac820  ! 4231: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab0820  ! 4234: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbe1cc000  ! 4239: XOR_R	xor 	%r19, %r0, %r31
	.word 0xb9a488e0  ! 4240: FSUBq	dis not found

	.word 0xb5a94820  ! 4245: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c840  ! 4246: FADDd	faddd	%f54, %f0, %f56
	.word 0xb72dc000  ! 4248: SLL_R	sll 	%r23, %r0, %r27
	.word 0xb7a94820  ! 4251: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a548a0  ! 4252: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb9a588e0  ! 4253: FSUBq	dis not found

	.word 0xbfa44820  ! 4254: FADDs	fadds	%f17, %f0, %f31
	.word 0xb3a5c9a0  ! 4257: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb1a81820  ! 4262: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0x1d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194215d  ! 4265: WRPR_TPC_I	wrpr	%r16, 0x015d, %tpc
	.word 0xb9aa0820  ! 4267: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0x8195610b  ! 4268: WRPR_TPC_I	wrpr	%r21, 0x010b, %tpc
	.word 0xb3a80820  ! 4269: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb23d8000  ! 4270: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xbb2d9000  ! 4274: SLLX_R	sllx	%r22, %r0, %r29
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 4276: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb224c000  ! 4277: SUB_R	sub 	%r19, %r0, %r25
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 4285: FMOVs	fmovs	%f0, %f24
	.word 0xb9a00540  ! 4288: FSQRTd	fsqrt	
	.word 0x8d946171  ! 4290: WRPR_PSTATE_I	wrpr	%r17, 0x0171, %pstate
	.word 0xb9a54820  ! 4291: FADDs	fadds	%f21, %f0, %f28
	.word 0xba2dc000  ! 4292: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xb5a90820  ! 4293: FMOVLEU	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982949  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	.word 0xb1a48820  ! 4296: FADDs	fadds	%f18, %f0, %f24
	.word 0xb7a409a0  ! 4297: FDIVs	fdivs	%f16, %f0, %f27
	.word 0x83952105  ! 4299: WRPR_TNPC_I	wrpr	%r20, 0x0105, %tnpc
	.word 0xb9a81820  ! 4300: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	data_start_3, %g1, %r16
	.word 0x8995a154  ! 4303: WRPR_TICK_I	wrpr	%r22, 0x0154, %tick
	.word 0x919460be  ! 4305: WRPR_PIL_I	wrpr	%r17, 0x00be, %pil
	setx	data_start_4, %g1, %r21
	.word 0xbba5c920  ! 4308: FMULs	fmuls	%f23, %f0, %f29
	.word 0xbda4c920  ! 4309: FMULs	fmuls	%f19, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983999  ! 4315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1999, %hpstate
	.word 0xbfa88820  ! 4317: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00560  ! 4318: FSQRTq	fsqrt	
	.word 0x919521bb  ! 4323: WRPR_PIL_I	wrpr	%r20, 0x01bb, %pil
	.word 0xbf540000  ! 4327: RDPR_GL	<illegal instruction>
	.word 0xb3a98820  ! 4328: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a40820  ! 4330: FADDs	fadds	%f16, %f0, %f25
	.word 0xb9520000  ! 4337: RDPR_PIL	<illegal instruction>
	.word 0xbfa4c8a0  ! 4338: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xbd540000  ! 4339: RDPR_GL	<illegal instruction>
	.word 0xbda94820  ! 4344: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a81820  ! 4346: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb12c4000  ! 4348: SLL_R	sll 	%r17, %r0, %r24
	.word 0xbda5c8a0  ! 4349: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb3341000  ! 4352: SRLX_R	srlx	%r16, %r0, %r25
	.word 0xb2142184  ! 4354: OR_I	or 	%r16, 0x0184, %r25
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbd61a8  ! 4359: XNORcc_I	xnorcc 	%r21, 0x01a8, %r30
	.word 0xbba588e0  ! 4361: FSUBq	dis not found

	.word 0xb2bd60c8  ! 4362: XNORcc_I	xnorcc 	%r21, 0x00c8, %r25
	.word 0x8595e11b  ! 4363: WRPR_TSTATE_I	wrpr	%r23, 0x011b, %tstate
	.word 0xb3a80820  ! 4364: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb1a98820  ! 4366: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb3520000  ! 4368: RDPR_PIL	<illegal instruction>
	.word 0xb9a80420  ! 4369: FMOVRZ	dis not found

	.word 0xb9a84820  ! 4370: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7518000  ! 4373: RDPR_PSTATE	<illegal instruction>
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3c5000  ! 4378: SRAX_R	srax	%r17, %r0, %r31
	.word 0xb3a00520  ! 4379: FSQRTs	fsqrt	
	.word 0xb61c619d  ! 4381: XOR_I	xor 	%r17, 0x019d, %r27
	.word 0xbb540000  ! 4384: RDPR_GL	<illegal instruction>
	.word 0xbfab0820  ! 4385: FMOVGU	fmovs	%fcc1, %f0, %f31
	setx	data_start_6, %g1, %r21
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 4393: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x8794205f  ! 4400: WRPR_TT_I	wrpr	%r16, 0x005f, %tt
	.word 0xbb504000  ! 4411: RDPR_TNPC	<illegal instruction>
	.word 0xb1a44840  ! 4413: FADDd	faddd	%f48, %f0, %f24
	.word 0xbba84820  ! 4417: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbb504000  ! 4419: RDPR_TNPC	<illegal instruction>
	.word 0xbba9c820  ! 4422: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbf641800  ! 4424: MOVcc_R	<illegal instruction>
	.word 0xb5a00540  ! 4425: FSQRTd	fsqrt	
	.word 0xbba98820  ! 4426: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 4428: FADDs	fadds	%f22, %f0, %f25
	.word 0xb4bcc000  ! 4432: XNORcc_R	xnorcc 	%r19, %r0, %r26
	setx	data_start_2, %g1, %r21
	.word 0xb7508000  ! 4437: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a81820  ! 4441: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1500000  ! 4443: RDPR_TPC	<illegal instruction>
	.word 0xbdaa8820  ! 4445: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r20
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2db001  ! 4454: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb7aa4820  ! 4456: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8d94e024  ! 4465: WRPR_PSTATE_I	wrpr	%r19, 0x0024, %pstate
	.word 0xb1abc820  ! 4466: FMOVVC	fmovs	%fcc1, %f0, %f24
	setx	0x10201, %g1, %o0
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
	.word 0xbba548e0  ! 4469: FSUBq	dis not found

	.word 0xb1a8c820  ! 4473: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982999  ! 4474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0xb3abc820  ! 4475: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a548e0  ! 4477: FSUBq	dis not found

	.word 0xb5a00540  ! 4479: FSQRTd	fsqrt	
	.word 0xb3510000  ! 4480: RDPR_TICK	<illegal instruction>
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0a521bd  ! 4484: SUBcc_I	subcc 	%r20, 0x01bd, %r24
	.word 0xb5ab8820  ! 4488: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1641800  ! 4491: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba88820  ! 4503: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a88820  ! 4506: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbda9c820  ! 4508: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00040  ! 4510: FMOVd	fmovd	%f0, %f62
	.word 0xb1a80c20  ! 4512: FMOVRLZ	dis not found

	.word 0xb8950000  ! 4513: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0x8794a146  ! 4516: WRPR_TT_I	wrpr	%r18, 0x0146, %tt
	.word 0xb7aa0820  ! 4518: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c9c0  ! 4519: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb5a50840  ! 4520: FADDd	faddd	%f20, %f0, %f26
	.word 0xb80d60d5  ! 4521: AND_I	and 	%r21, 0x00d5, %r28
	.word 0xbf540000  ! 4527: RDPR_GL	<illegal instruction>
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c820  ! 4535: FADDs	fadds	%f23, %f0, %f25
	.word 0xb9540000  ! 4541: RDPR_GL	<illegal instruction>
	.word 0xbe24c000  ! 4545: SUB_R	sub 	%r19, %r0, %r31
	.word 0x9195a1a2  ! 4551: WRPR_PIL_I	wrpr	%r22, 0x01a2, %pil
	.word 0x81942185  ! 4556: WRPR_TPC_I	wrpr	%r16, 0x0185, %tpc
	.word 0xbda81820  ! 4557: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4560: RDPR_TPC	<illegal instruction>
	.word 0xb5a88820  ! 4562: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48940  ! 4563: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb9a40940  ! 4567: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb3a44940  ! 4568: FMULd	fmuld	%f48, %f0, %f56
	setx	data_start_6, %g1, %r20
	.word 0xb7a00560  ! 4572: FSQRTq	fsqrt	
	.word 0xba25a074  ! 4577: SUB_I	sub 	%r22, 0x0074, %r29
	.word 0xb5a5c8a0  ! 4579: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xbbabc820  ! 4581: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbd480000  ! 4585: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00520  ! 4589: FSQRTs	fsqrt	
	.word 0xbba548e0  ! 4591: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983c11  ! 4593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c11, %hpstate
	.word 0xbba5c940  ! 4596: FMULd	fmuld	%f54, %f0, %f60
	.word 0x8d94e022  ! 4605: WRPR_PSTATE_I	wrpr	%r19, 0x0022, %pstate
	.word 0xb9a00520  ! 4608: FSQRTs	fsqrt	
	.word 0xb5508000  ! 4609: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00560  ! 4613: FSQRTq	fsqrt	
	.word 0xbba94820  ! 4614: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81c20  ! 4616: FMOVRGEZ	dis not found

	.word 0x8394201e  ! 4617: WRPR_TNPC_I	wrpr	%r16, 0x001e, %tnpc
	.word 0xbfa44960  ! 4619: FMULq	dis not found

	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 4626: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbda54940  ! 4628: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbda589e0  ! 4629: FDIVq	dis not found

	.word 0xb204602b  ! 4632: ADD_I	add 	%r17, 0x002b, %r25
	.word 0xba840000  ! 4634: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 4643: FSQRTd	fsqrt	
	.word 0xbda8c820  ! 4647: FMOVL	fmovs	%fcc1, %f0, %f30
	mov	2, %r14
	.word 0xa193a000  ! 4648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a449e0  ! 4652: FDIVq	dis not found

	.word 0xb7a40820  ! 4653: FADDs	fadds	%f16, %f0, %f27
	.word 0xbba44860  ! 4657: FADDq	dis not found

	.word 0xbd643801  ! 4662: MOVcc_I	<illegal instruction>
	.word 0x89956143  ! 4668: WRPR_TICK_I	wrpr	%r21, 0x0143, %tick
	.word 0xb1a80420  ! 4670: FMOVRZ	dis not found

	.word 0xb1a81c20  ! 4671: FMOVRGEZ	dis not found

	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 4676: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbb540000  ! 4677: RDPR_GL	<illegal instruction>
	.word 0xbab4e1d2  ! 4678: SUBCcc_I	orncc 	%r19, 0x01d2, %r29
	.word 0xb9a8c820  ! 4683: FMOVL	fmovs	%fcc1, %f0, %f28
	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9e0  ! 4694: FDIVq	dis not found

	.word 0xb1a448e0  ! 4702: FSUBq	dis not found

	.word 0xb1abc820  ! 4703: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb5540000  ! 4708: RDPR_GL	<illegal instruction>
	.word 0xbfa80820  ! 4712: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba509c0  ! 4713: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xbba94820  ! 4715: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a98820  ! 4716: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x14, %g1, %o0
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
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 4727: RDPR_GL	<illegal instruction>
	.word 0xb9a81420  ! 4728: FMOVRNZ	dis not found

	.word 0xb7a448c0  ! 4730: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbc0d6117  ! 4732: AND_I	and 	%r21, 0x0117, %r30
	.word 0xb0248000  ! 4734: SUB_R	sub 	%r18, %r0, %r24
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 4741: FSQRTq	fsqrt	
	.word 0xbda5c960  ! 4742: FMULq	dis not found

	.word 0xb9a9c820  ! 4745: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a98820  ! 4747: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbb2dd000  ! 4751: SLLX_R	sllx	%r23, %r0, %r29
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb345000  ! 4757: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xbdabc820  ! 4758: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c820  ! 4760: FADDs	fadds	%f23, %f0, %f27
	.word 0xb5a90820  ! 4762: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa58920  ! 4763: FMULs	fmuls	%f22, %f0, %f31
	.word 0x8d94e08a  ! 4764: WRPR_PSTATE_I	wrpr	%r19, 0x008a, %pstate
	.word 0xb3a8c820  ! 4765: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa8820  ! 4767: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbbaa8820  ! 4768: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a408c0  ! 4771: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb5349000  ! 4776: SRLX_R	srlx	%r18, %r0, %r26
	.word 0xb9ab4820  ! 4779: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa40820  ! 4780: FADDs	fadds	%f16, %f0, %f31
	.word 0xb1a508a0  ! 4781: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb3abc820  ! 4782: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a54860  ! 4784: FADDq	dis not found

	.word 0xbfa589c0  ! 4793: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb93ca001  ! 4798: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xbba80820  ! 4799: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81c20  ! 4800: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982841  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	.word 0xbbaa8820  ! 4802: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a81420  ! 4804: FMOVRNZ	dis not found

	.word 0xb7a00540  ! 4807: FSQRTd	fsqrt	
	.word 0xb3508000  ! 4808: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r17
	.word 0xb9a88820  ! 4811: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a449e0  ! 4813: FDIVq	dis not found

	setx	data_start_4, %g1, %r23
	.word 0xb245c000  ! 4816: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xb645c000  ! 4817: ADDC_R	addc 	%r23, %r0, %r27
	.word 0xb3a90820  ! 4819: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81c20  ! 4820: FMOVRGEZ	dis not found

	.word 0xbfa40920  ! 4823: FMULs	fmuls	%f16, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb504000  ! 4826: RDPR_TNPC	<illegal instruction>
	.word 0xbda508c0  ! 4828: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xbfa548a0  ! 4830: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb950c000  ! 4833: RDPR_TT	<illegal instruction>
	.word 0x91942184  ! 4834: WRPR_PIL_I	wrpr	%r16, 0x0184, %pil
	.word 0xb1504000  ! 4839: RDPR_TNPC	<illegal instruction>
	.word 0x8795a06e  ! 4841: WRPR_TT_I	wrpr	%r22, 0x006e, %tt
	.word 0xb1a00040  ! 4843: FMOVd	fmovd	%f0, %f24
	.word 0xb1a80820  ! 4845: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00540  ! 4848: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982c51  ! 4853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0xbba00020  ! 4863: FMOVs	fmovs	%f0, %f29
	.word 0xb3a549e0  ! 4864: FDIVq	dis not found

	.word 0xb0ac601b  ! 4865: ANDNcc_I	andncc 	%r17, 0x001b, %r24
	.word 0xbba00560  ! 4867: FSQRTq	fsqrt	
	.word 0x9194a113  ! 4869: WRPR_PIL_I	wrpr	%r18, 0x0113, %pil
	.word 0xbba58940  ! 4871: FMULd	fmuld	%f22, %f0, %f60
	.word 0xbd540000  ! 4876: RDPR_GL	<illegal instruction>
	.word 0xb7a48940  ! 4877: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb5a00540  ! 4878: FSQRTd	fsqrt	
	.word 0xb9a00040  ! 4880: FMOVd	fmovd	%f0, %f28
	.word 0xb89ce0f5  ! 4881: XORcc_I	xorcc 	%r19, 0x00f5, %r28
	.word 0xb9a58920  ! 4882: FMULs	fmuls	%f22, %f0, %f28
	.word 0xbda44860  ! 4883: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba90820  ! 4885: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xba9d8000  ! 4892: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xb9a00020  ! 4893: FMOVs	fmovs	%f0, %f28
	.word 0xb7a488a0  ! 4895: FSUBs	fsubs	%f18, %f0, %f27
	.word 0x8995a05f  ! 4897: WRPR_TICK_I	wrpr	%r22, 0x005f, %tick
	.word 0x8395e0cf  ! 4898: WRPR_TNPC_I	wrpr	%r23, 0x00cf, %tnpc
	.word 0x8794a0e3  ! 4900: WRPR_TT_I	wrpr	%r18, 0x00e3, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80820  ! 4904: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb5510000  ! 4907: RDPR_TICK	<illegal instruction>
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ad0000  ! 4910: ANDNcc_R	andncc 	%r20, %r0, %r28
	.word 0x83956047  ! 4912: WRPR_TNPC_I	wrpr	%r21, 0x0047, %tnpc
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe05e1bb  ! 4921: ADD_I	add 	%r23, 0x01bb, %r31
	.word 0xb5504000  ! 4926: RDPR_TNPC	<illegal instruction>
	.word 0xb1518000  ! 4927: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a80420  ! 4928: FMOVRZ	dis not found

	.word 0xb5a509e0  ! 4932: FDIVq	dis not found

	.word 0xbfa81c20  ! 4934: FMOVRGEZ	dis not found

	.word 0xb1aa8820  ! 4937: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80420  ! 4938: FMOVRZ	dis not found

	.word 0xbba58920  ! 4939: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb1a00040  ! 4941: FMOVd	fmovd	%f0, %f24
	.word 0xb6a56086  ! 4946: SUBcc_I	subcc 	%r21, 0x0086, %r27
	.word 0xb8b5618c  ! 4948: ORNcc_I	orncc 	%r21, 0x018c, %r28
	.word 0xb7520000  ! 4949: RDPR_PIL	<illegal instruction>
	.word 0xb7a00540  ! 4955: FSQRTd	fsqrt	
	.word 0x8d95a0f8  ! 4956: WRPR_PSTATE_I	wrpr	%r22, 0x00f8, %pstate
	setx	data_start_5, %g1, %r22
	.word 0xbfa50820  ! 4965: FADDs	fadds	%f20, %f0, %f31
	.word 0xb5a80c20  ! 4966: FMOVRLZ	dis not found

	.word 0xbf540000  ! 4967: RDPR_GL	<illegal instruction>
	.word 0xb9abc820  ! 4970: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00520  ! 4973: FSQRTs	fsqrt	
	.word 0xb5a00540  ! 4974: FSQRTd	fsqrt	
	.word 0xb7a80820  ! 4975: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba48840  ! 4976: FADDd	faddd	%f18, %f0, %f60
	.word 0xb9357001  ! 4977: SRLX_I	srlx	%r21, 0x0001, %r28
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	.word 0xbb508000  ! 4989: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00520  ! 4990: FSQRTs	fsqrt	
	.word 0xb9a80c20  ! 4991: FMOVRLZ	dis not found

	.word 0xbdaa0820  ! 4992: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a509c0  ! 4997: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb0340000  ! 4998: SUBC_R	orn 	%r16, %r0, %r24

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

	.xword	0xa8c23f8ae82af9bf
	.xword	0xfe59c1594ba90b6a
	.xword	0x4a363d910d85513f
	.xword	0x0ec9120eb9bb4297
	.xword	0x97e5b8683dfe6670
	.xword	0xf2947c32f444b5a6
	.xword	0x6a15c0275f956ef8
	.xword	0xb983f979e1ad7753
	.xword	0x6414fea3b6c6ac12
	.xword	0x593c38f0e03fbc63
	.xword	0xdd48690c1c298977
	.xword	0x7af9ad3b0eb504e4
	.xword	0x91373b6d400a053c
	.xword	0x17a8075b64379fc6
	.xword	0x362bf7db8de025ee
	.xword	0x1e5386c3b1d8242b
	.xword	0x0cf6f1a376237cb6
	.xword	0x055793cf9a1c05d6
	.xword	0x70fc3b06369bd3b3
	.xword	0xdad5e80ac6020328
	.xword	0x88bf92a3a8a1a3bb
	.xword	0x1a2bb36343cb4fba
	.xword	0xa5ec45b423ee5f5a
	.xword	0x14fae4d6d1fe1c54
	.xword	0xbce2241f4e062be0
	.xword	0xd0d603c33de0eb76
	.xword	0xef904e8bbdac0406
	.xword	0xb34d0132db1f8f87
	.xword	0x7320a5c613eba566
	.xword	0x94d7df9670d4184d
	.xword	0xfb33b75819422d92
	.xword	0x0a546482cdfe243a
	.xword	0x3d744ea749790cde
	.xword	0xc2fdc33b1a7d3831
	.xword	0x55049dce433799cd
	.xword	0xe4546702d2da92db
	.xword	0x1ad5b9e0ee416096
	.xword	0xe7ed06ad6dcc603a
	.xword	0x631b3cc1eb0bc6ff
	.xword	0x43ad9eaabd282c04
	.xword	0x3fcc8aa1403d0775
	.xword	0xfbefb918be6e01bd
	.xword	0xa28115b5fd71936f
	.xword	0xea6b74089e110ef2
	.xword	0x88c0a8963f641fb2
	.xword	0x0635a29b218f575a
	.xword	0xa3ebe9c91662f8fc
	.xword	0x1264cbb0f4fdfb63
	.xword	0x81958ff39d098290
	.xword	0xf0e1f819cc544d8d
	.xword	0x4ec74038aacbf2f3
	.xword	0xa2c0263d1785815d
	.xword	0x5640f642af462bf0
	.xword	0x5bf6f72e6749fc4f
	.xword	0xb9fb9c9882171b4b
	.xword	0xe0c1276c9c07bf2d
	.xword	0x2739fefc8cf84c76
	.xword	0xf6b9ed06505012d5
	.xword	0xf7b4233a55dec297
	.xword	0xbaeaaf1b4cb7ff32
	.xword	0xe8602225f03b46f4
	.xword	0x568d3640c6dbff5f
	.xword	0x6c1482cc5dac534d
	.xword	0xe0d2b6b54e888d66
	.xword	0x17d1f7cd983240f3
	.xword	0xc876a91f155f119f
	.xword	0x9de041dfe5cd3ae3
	.xword	0x88358b8c6a1275af
	.xword	0x5ec8e37b65315ec9
	.xword	0x7ec6d38bfaac383d
	.xword	0x348ba801542c85ae
	.xword	0x3ee0ddcb2d595bd9
	.xword	0x4829b525e904712d
	.xword	0x21d1c7f3148e0484
	.xword	0xf4fbdd1a72312159
	.xword	0xa682336a33543f6a
	.xword	0x1305a4d3baf40e23
	.xword	0xfca4870950b0ff55
	.xword	0x7d02a894fd1820a0
	.xword	0xcab296b15c92e436
	.xword	0xac72b1a492b6f0d6
	.xword	0x8f8594bd18a4d843
	.xword	0xe9bd50a67fb60b6f
	.xword	0xc7d63538d55ddafb
	.xword	0xca90ce9f9804ac1d
	.xword	0x7e93d30b89621171
	.xword	0xaf466498a1100de3
	.xword	0x3631390a62cd1c8a
	.xword	0x91c9eafe12dbb15d
	.xword	0x732507a91f24c037
	.xword	0x95cd9989cc5b567a
	.xword	0x8da3728330bc043b
	.xword	0x9c8d9a902301b712
	.xword	0xa2cad91c3a76962e
	.xword	0x68a8b9daf70fd7a4
	.xword	0x267cf4088549439f
	.xword	0xa7968d7e9472c0af
	.xword	0xf2de77c5e3546129
	.xword	0x630163dbd8c6b95f
	.xword	0x64e185fb01deac2f
	.xword	0xe00c32aca87c2bde
	.xword	0x145780efb36e65ae
	.xword	0x6b6064762cc2514d
	.xword	0xd29c5de4ccd4799d
	.xword	0x0ce732b594b76e85
	.xword	0x94493e1690383f13
	.xword	0x592608a93ed78fbb
	.xword	0x8fc9feb4ab548799
	.xword	0xa18a82c8c8f3e065
	.xword	0xb1275dd11674528b
	.xword	0xfb08d48700789af8
	.xword	0x1a86b6434b35ef7a
	.xword	0x694610e712a6939f
	.xword	0x55127ee276e7ee1c
	.xword	0x753a047a8be565d8
	.xword	0x7bd5f529ac92443a
	.xword	0xdee01c9b196996b4
	.xword	0x6ea3eeee0c7e34e9
	.xword	0x4353b611e82b4c6f
	.xword	0xd0410824d79d5309
	.xword	0x73fd583b0d68a76b
	.xword	0xe4e05e9f1fb1979d
	.xword	0xd3de7dd8ed20fa18
	.xword	0x7bf24ae185f8dbfe
	.xword	0x79da22641b2e94f0
	.xword	0xcb31ff645b8c3141
	.xword	0x502b6b59e2551899
	.xword	0xf38d0716bcc50865
	.xword	0x47073cf1641d079b
	.xword	0x185a32319e1ba4e0
	.xword	0xea5af4f68c89ebcf
	.xword	0x0c0a1cc7a6edb9e3
	.xword	0xc5bab3a9e4666d85
	.xword	0x86f991cdae104573
	.xword	0x33e6b8ecb33adcc8
	.xword	0x1b29a0e72d5de910
	.xword	0xdb5f006042b1ed54
	.xword	0xc8654a5346c97845
	.xword	0xff9656a32f96c86c
	.xword	0x6fdb7ae3a968dd33
	.xword	0x792fa98ed12e0694
	.xword	0x45d9842c01720dd2
	.xword	0x26fcbad10088a152
	.xword	0xb5ab55ffdc081ed4
	.xword	0xcd2f8a4b42926cd1
	.xword	0x15c25088cd07a2aa
	.xword	0x54a3662431f29cc7
	.xword	0xd575442338f4f5fd
	.xword	0x79f0ea5af2a1500a
	.xword	0x6ac962cb87e1dc7b
	.xword	0x1b02ad6fcee1c614
	.xword	0x04cb8d73121e95a4
	.xword	0xc4810293454b6b71
	.xword	0x29980cebdfda9a1e
	.xword	0xddbdb35699e2d19d
	.xword	0xc14561d1bc0807de
	.xword	0x8d37fb4bbb8b08e4
	.xword	0xb7503101fa13ce8e
	.xword	0x7a7b7b4b5c1085f0
	.xword	0xd6744e698bb85714
	.xword	0x6c775240056db11e
	.xword	0x52ede59ef39d879e
	.xword	0x0c98b7924eef6c99
	.xword	0x5ef3d1327e7eba25
	.xword	0xaf911f5f5bdec01c
	.xword	0x2223533d1046a44d
	.xword	0x2d5cd1d7cd05ee15
	.xword	0x0cae840f763c723a
	.xword	0xdeb62a6363844cd1
	.xword	0x71885a2e616e3a8e
	.xword	0xf1f7d46f8b015051
	.xword	0x41c257f7fc353d12
	.xword	0xd13bde2c8b8573f9
	.xword	0xf0f7d68ed9e805f7
	.xword	0x67f3a1224e31159b
	.xword	0x8162786f065a7f52
	.xword	0x3a9559e3cc44d2a3
	.xword	0x7dd4d5fa31c2beb7
	.xword	0xcd437fc2e5e39a4f
	.xword	0xc45d838b898219a9
	.xword	0x3121dfae42ee9b17
	.xword	0x291e35f7febd33f4
	.xword	0x1b499010865f550e
	.xword	0x09f9b4684f15bdce
	.xword	0x1602853cd05e502c
	.xword	0x6353d7df467493db
	.xword	0x3b163ca86e178be0
	.xword	0x8366214fc41920dd
	.xword	0x8c7d14ecb436383d
	.xword	0x2453c006f0097cbe
	.xword	0xf438779ec2e6d4d4
	.xword	0xece7fcc67b5fc0ff
	.xword	0x1a796a5f3c40f246
	.xword	0xb127ce601da9aa34
	.xword	0xf981739e27d70c75
	.xword	0x4f36d4bf22162fde
	.xword	0xf47cb66a02ee602c
	.xword	0x7fb48ecd5f74094a
	.xword	0xfd0d056439326b10
	.xword	0x2fb1d447d403795d
	.xword	0xebd4fa7f591a9ac5
	.xword	0x41d49d3eb9867275
	.xword	0x5ab7df5e9afbab26
	.xword	0xab1e8d0764e0df01
	.xword	0x9ee47e138350c9b6
	.xword	0x6e071a126f8f4174
	.xword	0xcbcd5099b2b337b3
	.xword	0x27d418cc7b459cbe
	.xword	0x9f2a874ead951e22
	.xword	0xf71efaf4e41ee972
	.xword	0xb93d12f0ec040f11
	.xword	0x744c760aa82041a8
	.xword	0x099b08c801b7bfb1
	.xword	0xfb0f5e6dee291321
	.xword	0x58c79c650203073a
	.xword	0xca8d9c51b1082069
	.xword	0x11f18ca8474ce9f4
	.xword	0xe32274e6b3806b91
	.xword	0x468c47ad38774a50
	.xword	0xa6839da2f27cdf80
	.xword	0x7c019e5d0fe17269
	.xword	0xb985bf50e4d9f134
	.xword	0x2b9dd5612580b36f
	.xword	0x807c1b2c023c626d
	.xword	0x8e9d7e327686f4db
	.xword	0xf2f5a9863618abb0
	.xword	0x738303f1ae498ac3
	.xword	0xd74bea2b2abe5155
	.xword	0xa3f4c2e94ea5147c
	.xword	0x20ebbee0c626df1f
	.xword	0xc418fd6085ac55cb
	.xword	0xb885a0ce3c255812
	.xword	0x4e6a9b4a708784c3
	.xword	0x5fb0c399a6ea68c6
	.xword	0x18d97bc2fc792a5f
	.xword	0x46812db0c98d5ae4
	.xword	0x593d364a30fc09c0
	.xword	0x198642963d19e5f3
	.xword	0xc09c80e822ff6b7f
	.xword	0x2cac7397c51d1c51
	.xword	0x7d93f8ede635e4ea
	.xword	0xde73e9b3c7736d63
	.xword	0x4dd5d548b9588326
	.xword	0x044f5d08ee01947c
	.xword	0x2bc53f0f84acbed8
	.xword	0xa31cfdc60ae22569
	.xword	0x960a7b50cacafc7e
	.xword	0xaa1937bcad20271c
	.xword	0x07fc7087ca7de49c
	.xword	0xaf614cbce1d9e618
	.xword	0xf709fe3c985cc565
	.xword	0x537812fc426d5675
	.xword	0x6fdac05cd903fb3a
	.xword	0x80e605692c0b4707
	.xword	0x1e5ed6dcc6fb9e7c
	.xword	0x4a1e6c84f5baf6c7
	.align 0x2000
	.data
data_start_1:

	.xword	0x44a8ead5f8153e39
	.xword	0xa0a23deed2f21380
	.xword	0xffc7a854b4d8f89f
	.xword	0x3da5e116643d18b7
	.xword	0x5f3b8ff0d3ad8990
	.xword	0x1b323f17e1af45ad
	.xword	0x8595ab587eb8bc29
	.xword	0x432175051e9a9afc
	.xword	0x6d58fc9adcff4e02
	.xword	0xf05d2f8ff5c8e821
	.xword	0xeaccae676b5a61cd
	.xword	0xdfe79de2df954601
	.xword	0xd6f39c59a9e52458
	.xword	0x271434668d385041
	.xword	0xf119ff90c7e633a4
	.xword	0x09261f56c00e8dff
	.xword	0xacb53e149e28c9fb
	.xword	0xe52d7110e1080dc5
	.xword	0x5e5965fa8cccc747
	.xword	0x1d43cd0d11246575
	.xword	0xffa225c03fc85eb7
	.xword	0xe68f8fd00c2314cd
	.xword	0xc3829d48d6b64c64
	.xword	0xc148ab0ea2db5926
	.xword	0x3854bd3492c15dcf
	.xword	0x8d7f235305ae60e1
	.xword	0x36fc0fb40d806687
	.xword	0xdfe0074e241b8d2d
	.xword	0x2b8340c51c7a9fcf
	.xword	0xd9eaec7d86b1c0cf
	.xword	0x754ae52984d32640
	.xword	0xe86fba153d41edcf
	.xword	0x57f97c5697d3349c
	.xword	0xba16494dda668d8c
	.xword	0xa9c33dadd1d662c9
	.xword	0x0c123fdb0be7734f
	.xword	0xcaa6524b702c4444
	.xword	0x93150b938bf41b9f
	.xword	0x3afaa20d08c16194
	.xword	0x589e6d89bbba0ed2
	.xword	0x456dc12d0390f58f
	.xword	0x9671943c2801dfc1
	.xword	0x547ac5ea8cb67d36
	.xword	0x56c8b1f142c03fa5
	.xword	0x9d9739c21b7de367
	.xword	0x97027d383128d42a
	.xword	0x3453f9de82d8c5ba
	.xword	0xdbe42d88ee039ffc
	.xword	0xcebc13d625e2e2ef
	.xword	0x42e2f36c1678623b
	.xword	0xe883329e9454e082
	.xword	0x7cb7c2ddc9aee37b
	.xword	0xb7a0211052c17b4a
	.xword	0x2715ba6c0f53517a
	.xword	0x0d32db94bcd821e9
	.xword	0xbb077ebffe1f7b2d
	.xword	0xd95994e2bf6e2de7
	.xword	0xbaf58212d64bc7e6
	.xword	0xd14a0666015c7e73
	.xword	0xb18dbc713fe944ca
	.xword	0xde0a7ac1b4466c62
	.xword	0x1e8d11a9cd534c97
	.xword	0xa1c3079345523568
	.xword	0x0e8732c38ae6ae1f
	.xword	0x3ed7a05e00ac8210
	.xword	0x7d085a772cee9d13
	.xword	0x0a0141180a54185b
	.xword	0xd5332ac7e0fb9562
	.xword	0x1f1ada95277ca12b
	.xword	0xe2a9a54ad3a3410d
	.xword	0x1590a91465c24f77
	.xword	0xc463b2b6d1faf6d8
	.xword	0xf9645697aecf6047
	.xword	0x8754ad04e185d47f
	.xword	0x29a0fa0cf8ce6815
	.xword	0x6ff69863914b88f1
	.xword	0xc5808b6d63640562
	.xword	0xf8e72a14a1b71842
	.xword	0xb2d7e7559bbdf75e
	.xword	0xe904c0d040acba42
	.xword	0xdda174ec360be158
	.xword	0xb51f8523d6549ca7
	.xword	0x77f8b13422764236
	.xword	0x627c926c7bfbef33
	.xword	0x301c5de6bf291fd0
	.xword	0xadb4c8dcbe36255f
	.xword	0xd8d062da5def7482
	.xword	0x6e80727da2475311
	.xword	0xf463f19e30a0e5d0
	.xword	0xd687138c6a66566f
	.xword	0x9f840a1ad6951ce5
	.xword	0x29e461c3fa1052b6
	.xword	0x5fb62a05b494d19a
	.xword	0xfd871144ab5ebbfc
	.xword	0x5541162c39378806
	.xword	0xd8588dc88521d276
	.xword	0x7f13b7d9b3cc2b06
	.xword	0x1fff8f76f7a7ba20
	.xword	0xfe2173552cc2f0dc
	.xword	0x4de5ba2face5f594
	.xword	0xb31744ae0ddad07d
	.xword	0xa0efc16d97e531b6
	.xword	0x125ed877bf9fd853
	.xword	0xf50bcab6e9399fc5
	.xword	0x05cdd60c3e4fac31
	.xword	0x2019d3bc179e7fb9
	.xword	0xc2c2b7b196cdfdbc
	.xword	0xff0a9942f04965bd
	.xword	0x250932983815870a
	.xword	0x4f3f19bbcaf07aa0
	.xword	0x8803274d3c3c8b6f
	.xword	0x5281a2c497395851
	.xword	0x2aae7309ef8305dd
	.xword	0x19d35a27b1750157
	.xword	0x31eb31d7bfe9f4b8
	.xword	0x49e314084bad49c5
	.xword	0xd8de2e987545df32
	.xword	0x1a2d084ddcf6af14
	.xword	0x8df96509ea427afc
	.xword	0xc43c1c42662ad6e4
	.xword	0xaea07deb0235e50c
	.xword	0x644769232dd58731
	.xword	0x8d31d14f542bb764
	.xword	0x450c33f7db3e6304
	.xword	0x34111b97276ca868
	.xword	0x2008691daca5c58a
	.xword	0xccd5bb478375733a
	.xword	0xaa70799e9dd46493
	.xword	0xd5b349fb08f2fe98
	.xword	0x77d5fe42c7ebb859
	.xword	0x088bc70fa13492ac
	.xword	0x1ea423ff94a3b95d
	.xword	0x223ff0b2f8521c9b
	.xword	0x898e9a1e517b0208
	.xword	0xb0b940fe2845f55b
	.xword	0xb721a8dc11989059
	.xword	0x3ed214ab79bed950
	.xword	0x5aad58a483134f0e
	.xword	0x9fd6151e265d422a
	.xword	0x3b7e17ac01dfb892
	.xword	0x61f4975273f1961f
	.xword	0x9ca8a33da85c684c
	.xword	0xbbec70961db6f91d
	.xword	0xc663ee9a60283e29
	.xword	0x684043417d754fff
	.xword	0xf1b13f942b5c612d
	.xword	0x8a01d329a1a3c202
	.xword	0x82130b11fbe14477
	.xword	0xde1127f29027bd5e
	.xword	0xd8409481d7526d9b
	.xword	0x56c31d5170758084
	.xword	0x411c4c2181aa0756
	.xword	0x2282bb0eb91c8517
	.xword	0x47ab8bc8d1a1ba60
	.xword	0x10cae0c50dac0a0f
	.xword	0x40e357deccd040ea
	.xword	0xc20844b965edfb5b
	.xword	0xa3e362f34ecdde21
	.xword	0xd9d765b871be1746
	.xword	0xac68e1c0c35429f5
	.xword	0x532152099ae06637
	.xword	0x066f3982572265b8
	.xword	0xef03504ad33ffb6f
	.xword	0x80ff06aefcadad26
	.xword	0x081467795f435418
	.xword	0x9e6cefc3968a323e
	.xword	0xce102701a4f76751
	.xword	0x8339b7a6be4d92b0
	.xword	0xf3194c3bd313c74f
	.xword	0x9212a10ff3a20018
	.xword	0x600c0ecb6981bb08
	.xword	0xe73ccff4f5c552dc
	.xword	0x4314d4ad702b69a7
	.xword	0x79f05b914cc9e321
	.xword	0xd9ed03045a52222a
	.xword	0x689a019764364bdb
	.xword	0x30b7e7e9dfc09487
	.xword	0xfef471d24c8b58ed
	.xword	0x31add9062dd99b6e
	.xword	0xcf66893033c5401e
	.xword	0x55c711133ea08478
	.xword	0x18a6cbe7a7dfd6f4
	.xword	0x262d7ded6714eb0f
	.xword	0xd60a841af58caa14
	.xword	0x11e8894884868d70
	.xword	0x1e005e9c7cfd8960
	.xword	0xaf01e698ab69fef0
	.xword	0x10e25ae77f5c2049
	.xword	0xf8dbd5e793a3344d
	.xword	0x7d7d29f44285dde8
	.xword	0xa1a27129e4ed546b
	.xword	0xc0f2aaf5c6a299f8
	.xword	0x6a48d791ea6f7e66
	.xword	0xc41acb3a622dd8f2
	.xword	0x6385721a1f4f9752
	.xword	0x8163911a3e2dc7f3
	.xword	0x8bdd8ad32cb6d2f0
	.xword	0xb71ae16c8698f575
	.xword	0xe4f7a3d9a08bb807
	.xword	0x3ece64516be95a4c
	.xword	0x1f67da784fc11f5a
	.xword	0x3ac1c16016673ec9
	.xword	0xecd50717df947ec9
	.xword	0x43274d47bf2f4548
	.xword	0xe24c6ece52008c0a
	.xword	0x846a0d19d8facf94
	.xword	0xdea0e992cb7eb396
	.xword	0x31be7b53fd75e67f
	.xword	0x0bfe16507028c513
	.xword	0x07dd757c2115b1e8
	.xword	0xf19843f823fb07be
	.xword	0xeda3c7f767876963
	.xword	0xab6bb00b03e6abc0
	.xword	0x4118566f0f345037
	.xword	0x3b8729dfe2440200
	.xword	0x1e94139ff19d9dc5
	.xword	0xf19d5dce435e247b
	.xword	0x2c55b937805022ac
	.xword	0xc3b63c3f1987355a
	.xword	0x5e83839bc378fc84
	.xword	0xe0ceda71838a043e
	.xword	0x6d06635d2522d9b0
	.xword	0x6cc081e2dc028a20
	.xword	0xf333c68a1c7f384f
	.xword	0x17e718f6933d1d50
	.xword	0x41b50e5812a463ee
	.xword	0x4562ce221a220214
	.xword	0x8a84179432c7b5a1
	.xword	0x1939507ca863c573
	.xword	0x4644a2e3e15f55fd
	.xword	0x5c0750b3562d6ab9
	.xword	0xa9cbe9db9ed3f63f
	.xword	0xb619596e685c4ab4
	.xword	0x3e02d40955b50f12
	.xword	0x88e79bb0d70bea39
	.xword	0x70347810c026b5e3
	.xword	0xf22d7520cd935724
	.xword	0x836d331046921360
	.xword	0x0e59d6db80382ba5
	.xword	0x69813821054167b2
	.xword	0x2318c5958a86424c
	.xword	0x8546b47bc2c43ca6
	.xword	0x670db898777f54f7
	.xword	0xc2a75534e153430d
	.xword	0xdd477e8452566577
	.xword	0x066238534767bf3d
	.xword	0x2990e4ab6a24c8b7
	.xword	0xf5f0ea207d4ec210
	.xword	0xb24b1325c2700fe0
	.xword	0xb685825d96324da8
	.xword	0xe02911d66cd8fd6b
	.xword	0x05fdd28542b3f10f
	.xword	0xf578cb7868b7ce87
	.xword	0xf85f9cd30141a39c
	.xword	0x8a542436007df18d
	.xword	0x82e9214558eb8091
	.align 0x4000
	.data
data_start_2:

	.xword	0xe00bd1b8744f9453
	.xword	0xcb8d1befb3b100a3
	.xword	0xc2fe0646f35a3bf7
	.xword	0x917adb6435f9d852
	.xword	0x2255c08f60a43a39
	.xword	0x8f772325c6d89694
	.xword	0x3f28530c3c5baf95
	.xword	0x819721b99daa1282
	.xword	0xf1e57de61d89cd7e
	.xword	0xb437fb1b5376eaf4
	.xword	0xa7ed28780dba7338
	.xword	0x64caeb3de7962282
	.xword	0xb15d4b34a2a508ae
	.xword	0x3bc8eeab670daad8
	.xword	0x2bd2ffd0bdf54d49
	.xword	0x6a1797c668faf4a0
	.xword	0xb8036ce31f9b011a
	.xword	0x68b5fefa03f2ef87
	.xword	0x701dbbd1ef41f6d6
	.xword	0x444e7283ab64ba97
	.xword	0xff7bccf7367f6934
	.xword	0x4fe6766674b5ae20
	.xword	0xbfb4320415147ad1
	.xword	0xa5891e27ba6bd4ad
	.xword	0x19d7f5665292e5d7
	.xword	0x573592262440fb6f
	.xword	0x7bd535677d8c306d
	.xword	0xe750eb3ef6129b73
	.xword	0xe567b272fc6ee5e7
	.xword	0x92e5f0625dc1d293
	.xword	0xf8e4d97a1711a524
	.xword	0xe0090d8680481750
	.xword	0xeba71876f79ad296
	.xword	0xbd4718c6650680ce
	.xword	0xe33e14183f54bc5d
	.xword	0x6e7e92f43939d803
	.xword	0xf7fa62e009839cbc
	.xword	0xfe25656a4f8c0739
	.xword	0xbd1d3700ddac7887
	.xword	0xc9464559d2b5c2e8
	.xword	0xbafe7204aec42b68
	.xword	0x922b322b5356a2eb
	.xword	0x49003f72e618c140
	.xword	0x89939583a533bb14
	.xword	0x570100125b9cf2d1
	.xword	0xcc24543ee221d342
	.xword	0xe8f4e78d9e717d3b
	.xword	0x551f851c3e6600e0
	.xword	0xbae851f48a652142
	.xword	0xce5515974e4050ab
	.xword	0x455872b71523052f
	.xword	0x07158dc80632bf90
	.xword	0x97b23e5cdf80462c
	.xword	0xb94509c6f4a89397
	.xword	0x3c9ad2e22d4d98bd
	.xword	0x6aa94c8069ce1348
	.xword	0x08c90e01d3d1b9bb
	.xword	0x7e1d8a76ef06f5ca
	.xword	0x297ef223f8eb06f2
	.xword	0xbf9ed5c3d1d4e736
	.xword	0x059d5e1b5d5c8c19
	.xword	0x4f62c6ae4ee8ad4f
	.xword	0xbdef37cfcc7762f1
	.xword	0x647aafd644011f1e
	.xword	0x4ede2139080aeee5
	.xword	0x41b8e234fc73caf9
	.xword	0xdd7ba0d582f4150f
	.xword	0xf50bfaff076101cf
	.xword	0xa86a9aa50dc651ff
	.xword	0x21f2fa9462f8cd29
	.xword	0x15180240e35b6d22
	.xword	0x912959a561f195eb
	.xword	0xdb8386d8f369b666
	.xword	0x73219df68f1dfe89
	.xword	0xffccc0e019514d1d
	.xword	0xd4ad6232e1e92d6e
	.xword	0x2ca6ba93e8cb4b02
	.xword	0x4c7af5303e036153
	.xword	0xd80afa7c370ab0b9
	.xword	0x10b3743c7568c8b2
	.xword	0x6954167cae5127a2
	.xword	0xd67a5f00f07bc5cd
	.xword	0x15f7eea5c49ff34e
	.xword	0x6a88706b43d1febe
	.xword	0x0fe9685846335f00
	.xword	0x342049c4bd86a0a8
	.xword	0x1fffce2c55446b5d
	.xword	0xb0a78aa21d38f5e5
	.xword	0x072669dc669cc257
	.xword	0xc8d222a23cac4c7c
	.xword	0xb8be602582e8597b
	.xword	0x28efb82e465de97c
	.xword	0x7030e6b4ee1452b6
	.xword	0x30487e1177a8b461
	.xword	0x24b7dbd43c667299
	.xword	0xb8a4df95684b67e4
	.xword	0x029f218dbd3196ad
	.xword	0x4b956ec8565098a6
	.xword	0xd38c639580bbd841
	.xword	0x9fcf1e072f15c4c0
	.xword	0xa65c438dad8de62a
	.xword	0xdb2d32d3ab022ee1
	.xword	0x2dbc31c1b6508ea1
	.xword	0xbcb37cc5945bcbeb
	.xword	0x5fb7ce058ed3b04b
	.xword	0x5b0a2088811d98b4
	.xword	0x9fe92c10f5108702
	.xword	0x84bc20005ef0ce39
	.xword	0xe6917e4f9c5d3f1b
	.xword	0x8c34ca8b14f5f4e5
	.xword	0xb8d244db5371c864
	.xword	0xd1ce50455f1500e5
	.xword	0xe888668148eb92dc
	.xword	0x28a7472175e10bf8
	.xword	0x067f38917276161b
	.xword	0x677d817cd90d2016
	.xword	0xd27dbcb37be2e73d
	.xword	0xc35dc551ab092519
	.xword	0x1250cda55f886f28
	.xword	0x44e4b3fd6c0b33a8
	.xword	0x1d2b30d4c243c61b
	.xword	0xb337823cda16500f
	.xword	0x98bb0f54025821c8
	.xword	0x3dfc21b6da690b98
	.xword	0x3c76c51163c4f8e3
	.xword	0xd29c18ad9bf2d737
	.xword	0x99b2919cbfc6b7da
	.xword	0x865d441fc390db52
	.xword	0xcfcc2a7f1fd914fb
	.xword	0xf0d0b4dc8c92aac3
	.xword	0x3582d61688c73c4d
	.xword	0xa6bcb6f42f2b108c
	.xword	0x6aa73b93023dcabe
	.xword	0x0d4a0f91a84fc627
	.xword	0x809f82b695ce0cf5
	.xword	0x9ac5adaf204d5876
	.xword	0xfbb6bd3b23fd6872
	.xword	0xb963b61ae8708ae0
	.xword	0xd6aa2810ecf1d32b
	.xword	0x79dd98cc6c08ea4f
	.xword	0xa06509b12978fa73
	.xword	0x22a386cd3f7f576b
	.xword	0xb66c252811b64586
	.xword	0xb5be9686fb41c802
	.xword	0x9e7edc20427194bf
	.xword	0x70be408d9f2652a4
	.xword	0x6d111235e7eac5cd
	.xword	0x07aefe9fc531a5d9
	.xword	0x5a46e429215a1270
	.xword	0x1c33c48956655cb2
	.xword	0x0bc701f248c8d155
	.xword	0x7c54bad2e3b89c44
	.xword	0xceaeaa66e96c9086
	.xword	0x6c28c4a4f28a3a29
	.xword	0x95614688b1bcb1d5
	.xword	0xa8a3100d0f521d7f
	.xword	0x574446c0b3dd99cc
	.xword	0xa833f62d786e34e0
	.xword	0x652c3680405e2ce8
	.xword	0x91bfc2c06852b8aa
	.xword	0x09cca18921d0be77
	.xword	0xe54bad13d1bf39f5
	.xword	0xb8763f9ef8e15b4a
	.xword	0xf75968259e871da9
	.xword	0xdefaa76361a54dde
	.xword	0x8aa3df55c980bc4c
	.xword	0x3333f9aa75bb74bb
	.xword	0xe1bc9aadbdbe223f
	.xword	0xa6e601cf4bd9ebd7
	.xword	0x8a4469270f2ddc21
	.xword	0x894fdf6cc19bc9ef
	.xword	0xe70bcbab9a7aa129
	.xword	0x28b5425d83c4e103
	.xword	0x6c4c17173ccf62ec
	.xword	0x1daa4f6a49e78cfa
	.xword	0x447b9be6952cbf5c
	.xword	0x46ddc4e02232a1f7
	.xword	0xbfb31d0002bc2bea
	.xword	0x70c9e76078903158
	.xword	0x27eb8fe651dc0e2d
	.xword	0xad0915f90c1c3c50
	.xword	0xe26e5ce22805ad9a
	.xword	0x8cdd3c5c275332ca
	.xword	0x351bb340ee89dfa6
	.xword	0xfefc0808b5daa12f
	.xword	0x65ba994541e0c8ff
	.xword	0xf06ee4ed3b69e2e0
	.xword	0xb163c08bc2920043
	.xword	0x2746d3037034fa7c
	.xword	0x17ceecc795291d84
	.xword	0x68641bb33bc5602f
	.xword	0x5d897139b1178e20
	.xword	0xaa88437bcb351792
	.xword	0xc8c4c8f569caf15d
	.xword	0x143f5dde1cf59013
	.xword	0x3bcdd4406d2cfad1
	.xword	0x6789b1f53c66c2cc
	.xword	0x8f2bb0182d8ea12e
	.xword	0x5b5e2b92655ad66b
	.xword	0x7f2c2dec509ec656
	.xword	0x164aea4fa4493659
	.xword	0x915b29a84454797c
	.xword	0x8b5b830b0a294d67
	.xword	0x1c2e27c5d41359ff
	.xword	0x7bccdc96bfe3597d
	.xword	0x7bc3011ab60f86d0
	.xword	0x5c2b8729a5cc1707
	.xword	0xe21fc8724a2e4546
	.xword	0x4a9f859a8d5eb6d5
	.xword	0xa03eab487fca3c81
	.xword	0x5cf68bc43f7ff1c7
	.xword	0x979a6f36e1c3a144
	.xword	0x9062cc7f7f8e8c3d
	.xword	0xd2cc192b99f397ea
	.xword	0x210b66d65a348745
	.xword	0xfd3de6e46cde8518
	.xword	0xa6294b2e7e007e24
	.xword	0x26585bcdf628bac6
	.xword	0xfa731e13a6008a97
	.xword	0x454aa74b026125cc
	.xword	0x371fadfae2f23af9
	.xword	0x6bfee22d86881eda
	.xword	0x33ce59867f8b867a
	.xword	0xbffca82e91d23bf1
	.xword	0xf5a1657c6f8a64da
	.xword	0x444b44514933cfbd
	.xword	0x743380283f16025a
	.xword	0x9da4c24502c72577
	.xword	0x0462f1d8df46b55b
	.xword	0xcd764b94d87fce69
	.xword	0xf582c1a01f3d5fcd
	.xword	0x5ce552c2a81cb37f
	.xword	0x9168ccfe51b01567
	.xword	0x48eb629df8dbe62d
	.xword	0x58fcce34d244a059
	.xword	0x614d7f23fde73b93
	.xword	0x6d78b7d9d8fbeb1a
	.xword	0x819f3aa196694874
	.xword	0x5c32e49b743cd3fa
	.xword	0x8cfaebe596f4ace0
	.xword	0xd948bf6c6b1145b8
	.xword	0xcd2dabc171aa461e
	.xword	0x4131d5e1a12eb86c
	.xword	0x243b7909760c16c0
	.xword	0x655aee7e92fba4b6
	.xword	0xe7f101027021308e
	.xword	0x0856ee657263bd85
	.xword	0xea8a45c2b2f5b187
	.xword	0x7343afdf1b5aa017
	.xword	0xc14be828bf98ce88
	.xword	0xfad8c9df7384bac8
	.xword	0x8665cb8b2d86eea4
	.xword	0xf27428f6a1eb76ea
	.xword	0xad8cf1dfb2791235
	.xword	0x3caaf85ba2307bde
	.xword	0x59ee42ce25b6f566
	.align 0x8000
	.data
data_start_3:

	.xword	0x3c63d9ec4637a61b
	.xword	0x81a4e05f4fd67951
	.xword	0x06b45d54945dcf96
	.xword	0x7b15e50b7b3a14f1
	.xword	0x6b36c9637f34b1d1
	.xword	0x39b319f7092959e6
	.xword	0xf5991e0f0ea46fbe
	.xword	0xbfd77b04d45c2867
	.xword	0x8bfd35a283f52179
	.xword	0xd7e63d8d76df7d1c
	.xword	0xaf43060590c3fa89
	.xword	0xb9b937d30b24f6f2
	.xword	0x02001ec42d2e9440
	.xword	0x2142fa1e495aadaf
	.xword	0xc392411a2454dd71
	.xword	0xfba547c34e2aa08f
	.xword	0x26bc53e22448e659
	.xword	0x6287f7ebc7ec9157
	.xword	0x41d8ab5d98cb12b1
	.xword	0x909a38f4d1621ea2
	.xword	0x2d8fad1a54baca33
	.xword	0xf6d60e06c135bc55
	.xword	0x91ba0975d26718d0
	.xword	0xc9873700a6336484
	.xword	0xfbb1bac558dab16f
	.xword	0x43b26fd73733a1f5
	.xword	0xcfd4d5ed9b4ca32b
	.xword	0x47cf879c3ee694e7
	.xword	0x26b54960cf025884
	.xword	0x6e20bcc1f535727c
	.xword	0xbb6155c81bd34cad
	.xword	0x0ec684fdaef9dd44
	.xword	0x2b4c7b2364834025
	.xword	0xcb7e01ba75438de7
	.xword	0x72f41cf4ac855b22
	.xword	0xad654fb7d7ca0ee7
	.xword	0x1aa3a2e258532c65
	.xword	0xd5cc77708a6e2c43
	.xword	0x5be37cf49ed4fc06
	.xword	0x84c0507dac4f7a93
	.xword	0xf563dfb8f12f0cca
	.xword	0x8e0fbffeb4da1b92
	.xword	0xf1d30a72117bc78a
	.xword	0x99a9a24b4a9de766
	.xword	0xd469b52e15eb21ec
	.xword	0xc05c0ebc63fd0c9e
	.xword	0x8b5d5e7d36620cb3
	.xword	0x464e404469525cf9
	.xword	0xf958f74a20ef7f1f
	.xword	0x2400fe00cf19a1bc
	.xword	0x14e557a69b1be3bc
	.xword	0x8839aecbd2601610
	.xword	0x54553c45e17e6d5e
	.xword	0xa0fc11906b557925
	.xword	0x332fcc1603c130f8
	.xword	0xe7de478299a16a88
	.xword	0xfb8245a544d86c9d
	.xword	0x4e09fe330cc8c8e3
	.xword	0xb98878954c8c69d4
	.xword	0x826da4527f702510
	.xword	0xf19050f4a946018b
	.xword	0x4a93f0d8c4f5a560
	.xword	0xf8bde3f411d4f893
	.xword	0x2131f86e7eb98717
	.xword	0xf3b2f625399a745f
	.xword	0x271e1e01a6459d53
	.xword	0x3c8e087cdcfc8eea
	.xword	0x319e7fcb422341e4
	.xword	0xe43ed353d53bf79b
	.xword	0x430094f2ee128e7e
	.xword	0x60f53cb9435dce5b
	.xword	0x92920a48a484750c
	.xword	0x280c65b0a44bdcb4
	.xword	0x318c8f4196445acd
	.xword	0x8087fd00e6d75d81
	.xword	0xd1c1ff40217b5a07
	.xword	0xa5546a7bc43d4be3
	.xword	0x20c63c759f431571
	.xword	0x42fd9c1ad740732a
	.xword	0x0d6a71543c1f687f
	.xword	0x741cd061e6eaeb82
	.xword	0x7def6ad7ea6432c1
	.xword	0x2f5aa3cff910f26d
	.xword	0x7874107cc49d4be3
	.xword	0x0a823acaa7b20044
	.xword	0x67d685050ad16d22
	.xword	0xa0b6e00d6595ce52
	.xword	0xa17ab8dd1b145710
	.xword	0xde0403092825d09f
	.xword	0x58557841b19c562e
	.xword	0x5095d608caed257d
	.xword	0x45dd5f478bff5224
	.xword	0xe9ec6d67be9421f6
	.xword	0x2f2a85f23d3796a3
	.xword	0xc538c20e018526f3
	.xword	0x70c7a1112f08b654
	.xword	0x3e426dbbcfbb48b6
	.xword	0x9181b0941d15c01e
	.xword	0x508ff2a1a3c6f940
	.xword	0x56cdb00a8de38777
	.xword	0x966397f612d2f8e3
	.xword	0xdf718e0010de68f3
	.xword	0x632f11ba076072e3
	.xword	0x1557ebbae59c61bc
	.xword	0x8554ee069e693b98
	.xword	0x259393b776e8106b
	.xword	0x7f62f61110704ac6
	.xword	0x8de9106c9833d54f
	.xword	0x7a35dfb60143b062
	.xword	0x05cef1b6c1781cf8
	.xword	0x679fb0d897c1bf38
	.xword	0x67aa757f11331962
	.xword	0x7d3bf4b601a3b154
	.xword	0x994beced8c7d94fb
	.xword	0x6b34030f93d2bc08
	.xword	0x936995a4d6548b5f
	.xword	0xd26852793ff259a3
	.xword	0x38ff5f0a346b831d
	.xword	0x177a0761d13b9d58
	.xword	0x3ae6cd6b27ff9b27
	.xword	0xf2265254e5802922
	.xword	0x7c56c63c65b77e3e
	.xword	0x14d9d601f4f32ceb
	.xword	0x56220ee51a69eef8
	.xword	0x18750dfadd880500
	.xword	0xd43ea722eeb563bc
	.xword	0x8eb6ba6db8c74e9e
	.xword	0x22721b6477461bcd
	.xword	0xb7f569d319c0b1d5
	.xword	0xba70dc47f6df28f3
	.xword	0xa4d1b03446174b37
	.xword	0xe920bba856fca682
	.xword	0xe63317979ab30268
	.xword	0x5ddccbad0d3962e1
	.xword	0xcffb6ed1b8de5055
	.xword	0x5e0b1d701e2a4009
	.xword	0xb421ce8ff9528625
	.xword	0xe35f0a5e570842d9
	.xword	0x78cacc79b037c8a4
	.xword	0xb25c55a86d42bf4f
	.xword	0xf1d0d13cf1cb0cb6
	.xword	0xe02e3f5e6fea1f9a
	.xword	0x234499d1355f7dbb
	.xword	0x721704ff9758c67a
	.xword	0x46bae531db00bafd
	.xword	0xdcac54893e23232b
	.xword	0x14390ef41ed6b119
	.xword	0x581fc695bc9641e8
	.xword	0x850db445347a811c
	.xword	0x20cc27a28de0e8c5
	.xword	0xbfd02debfa49811d
	.xword	0x61ab815a47badd6a
	.xword	0x8fca6e75dc1a7acf
	.xword	0x3252f39293bd0c68
	.xword	0xc2dda92ba3edb677
	.xword	0xd4e11e8b2ae23422
	.xword	0x2d6ef51c3fa9dd1a
	.xword	0x23af71abf7b729b7
	.xword	0x08d680bf12299c0f
	.xword	0x3d9cb81791fc666d
	.xword	0x81e5f64f47caf8d9
	.xword	0x07be0f358641cd98
	.xword	0x4204b3fd350695bd
	.xword	0xaf2f9d84516ea4f3
	.xword	0xac762ce06429f554
	.xword	0xfd03986b148d8abb
	.xword	0x655f07900ca1611a
	.xword	0xc2375ce09608b68e
	.xword	0xdc0053cca1dfc1e4
	.xword	0x8d4dbc86c081f310
	.xword	0x83fab53dc5421f01
	.xword	0x24d6e7f567d82958
	.xword	0x5191426d31e2fa2f
	.xword	0xb6ce7355bb55a6d0
	.xword	0x8b754d6040f2f63c
	.xword	0x8a6ce5cae161cba1
	.xword	0x824d02f6dd75593a
	.xword	0xd8465be4aa0f53b3
	.xword	0xcc6e843131283062
	.xword	0x35ea10c73a453f42
	.xword	0xe45e8e547cd2170a
	.xword	0x3274060ba161cec5
	.xword	0xd4da15abb35f4e90
	.xword	0xf45dec3bedb39027
	.xword	0x865b2074e122d516
	.xword	0xe7298e7d9258d800
	.xword	0xefefd7fce97ffdf1
	.xword	0xaa9404c5e1596d39
	.xword	0x79da267fd693b37d
	.xword	0x0e282d442fb8f43b
	.xword	0x963ba2e847f89b7b
	.xword	0x6f430106addacf96
	.xword	0x8b8bae7a1dff6e52
	.xword	0xcf0300c5e78bdca1
	.xword	0xf938efab20b2a4a9
	.xword	0xf680a8d71d1eb02e
	.xword	0xc486edaeb9b9cb7d
	.xword	0x648f1e1b96dd2700
	.xword	0xcc448d8965b4a344
	.xword	0x20776eed0bb2f038
	.xword	0x66e7a88b7fc9747d
	.xword	0xf91154a982d8c262
	.xword	0xb99ef802af459ac5
	.xword	0x15411d5dc3a714be
	.xword	0x3581caa6912ec02c
	.xword	0x9a9f33a4f61e3d28
	.xword	0x37bcf7efed94028e
	.xword	0xc6ad69b013c7dca6
	.xword	0xff4852d5858869ec
	.xword	0x436df6b2973e6c6c
	.xword	0x78cdc0bdf6203650
	.xword	0x282fcab9d40b7f9b
	.xword	0x3b5d547393a2e04d
	.xword	0x6d429146ad8f42d3
	.xword	0x1b5ace67282240f1
	.xword	0x6ec6bd8c0fc82316
	.xword	0x17f7d99d0a3cfa22
	.xword	0x71055a2371367280
	.xword	0x1283f0d1ece401d0
	.xword	0x6398134cacae266e
	.xword	0xac981b8799d0aed8
	.xword	0x2119e7421ac394d2
	.xword	0x0cbeff555a90fe06
	.xword	0x8ac45f3bcc29b617
	.xword	0xca919cea287e352a
	.xword	0x2d63f564999bf367
	.xword	0xb1cc8c259677d1a5
	.xword	0x51f4a31974a997a3
	.xword	0x23c1368470371925
	.xword	0x90d1f3c823f64a80
	.xword	0x4855910d97c9db7a
	.xword	0x3b27d9a37465a759
	.xword	0x4a202acba4cb0817
	.xword	0x595d1701cb05e141
	.xword	0xd3046d63b1215318
	.xword	0xe7a25e0544f66e2d
	.xword	0x8abe69f0604ca765
	.xword	0x95009ee0523be06a
	.xword	0x0d887eb693c1a8cc
	.xword	0xc8580346ce4ef561
	.xword	0xf271fc77b4d33271
	.xword	0x733188d3ac59d7ca
	.xword	0x430abefc3b837f12
	.xword	0x739a1d574f800712
	.xword	0x29144e55eb382406
	.xword	0xe9a134eaf7c5f229
	.xword	0x2a0ddfaf7f5e6a80
	.xword	0x8ef79882b3b31b8c
	.xword	0x7a14ab0dcdd3cffd
	.xword	0x6d72c4226a6dece9
	.xword	0xde522a25fc960a9f
	.xword	0x6e4383e38d510058
	.xword	0x9ce3df4a7f1d0613
	.xword	0xbb501cc014c84e6d
	.xword	0x3ec7a886c813f64a
	.xword	0x187f2d67b77f7224
	.align 0x10000
	.data
data_start_4:

	.xword	0x88b11f70719e7bbe
	.xword	0x6a7a7569bab08bad
	.xword	0xd8ba67b99b4c9434
	.xword	0x3b4398b824d17c5a
	.xword	0xb4e12ebce8c81e0a
	.xword	0x19d8d569a7a1c13f
	.xword	0xafb477a5ed598a18
	.xword	0x86e7d3642bc4c758
	.xword	0x164f3a9e08ea66cb
	.xword	0x972f9bd00d09054a
	.xword	0xc870999565529fcd
	.xword	0xea34b05b01d9b11c
	.xword	0xa9a69b8315a3f8f7
	.xword	0xab2637aa1e341b51
	.xword	0x4a0b45ad3c7eaa23
	.xword	0xb392019a703b611a
	.xword	0xc0a5e0c81ede6830
	.xword	0xbf7ff43a8d4d1a65
	.xword	0xcb96d9f1a9e9441d
	.xword	0xbd85bf5624db0ea7
	.xword	0xb1a987bb0631c05b
	.xword	0x0333ecf09d845959
	.xword	0x253ddfe94a8d47db
	.xword	0xd7fabb68711f7b22
	.xword	0x2544bea0bf98406c
	.xword	0xc47a73550847edeb
	.xword	0x2633ef9e8dd06fce
	.xword	0x13184310daaebfbd
	.xword	0x8cd5b665b03bbf19
	.xword	0x5549ce68ef789c90
	.xword	0xf3cbc3a22cc3ab4a
	.xword	0x8d4a6c4e38697cfa
	.xword	0xd56d810dcaaff2f7
	.xword	0x80f13ad4b788e762
	.xword	0x75a2559785915d22
	.xword	0x1db2083629ac92e6
	.xword	0xb7910e3a0ec0886f
	.xword	0x9fabfe0106db80f5
	.xword	0x33eb2038eb8fba2a
	.xword	0xe8173475140141db
	.xword	0x22820a4987f44abe
	.xword	0xadd6aacb8ceb17ff
	.xword	0x1ea568642cb37d24
	.xword	0x3127da46a5b8192e
	.xword	0x8af528ff1175d46f
	.xword	0xd28730c517b487dc
	.xword	0x138a1d732a08143a
	.xword	0xf48eef4df3e84a0e
	.xword	0xb2acde289009779c
	.xword	0x9a2c505aa7a1cebd
	.xword	0x1e4eedacb43dbfce
	.xword	0x3678380e07e10ec2
	.xword	0x292c4bcdde14abf9
	.xword	0x83635f7cba777b8d
	.xword	0x65f1976ab5d13ab8
	.xword	0x38e476790c3229cc
	.xword	0x7dbd4a81ce7aece0
	.xword	0xb03296879a0d4e4b
	.xword	0x9812b928e8acd49e
	.xword	0x1c733fb9997013a3
	.xword	0x224f1e99a57c33b2
	.xword	0x666c9cf9d472bd4e
	.xword	0x27fa462953fd72f7
	.xword	0x3112e34c8524dd80
	.xword	0xc2f34d069865add2
	.xword	0xdc482beef4631447
	.xword	0x90a778c9fc160f84
	.xword	0x150d3b9345111031
	.xword	0xe8632e08d28bcb9d
	.xword	0xb8f3b4b49705ba65
	.xword	0xed5ce3666eb73f22
	.xword	0x28087012a591dc4c
	.xword	0x65b3b1fe652ac46c
	.xword	0xe1f9e30ba0a63869
	.xword	0xf438d86e81b8f030
	.xword	0x176169fb1724c65e
	.xword	0x37ea7390e9471ec4
	.xword	0xbe365f7b1f0e67b7
	.xword	0x6e9f7554c6c753aa
	.xword	0x6a64d20fc970bdca
	.xword	0xefad8d37cbe8c453
	.xword	0x8c8674597e01643f
	.xword	0x7ca6b5caed59870b
	.xword	0xab64637d5f09d220
	.xword	0x3e3bb6475a896971
	.xword	0x55d4f9cd49998fd2
	.xword	0x91adcb28f6d51579
	.xword	0x54b4c726dc802464
	.xword	0x0d8619e90e84e97d
	.xword	0x72e0055b2361aa34
	.xword	0x513e78f1fb06f23f
	.xword	0xe5d47dc21efd0db4
	.xword	0x81fde8ac21b081d9
	.xword	0x33467dcf1c2e5ee8
	.xword	0x09e68b15456cee1a
	.xword	0x08bf98c774411e66
	.xword	0xafec3e6b1e9910f8
	.xword	0x62f998f1ee4095b9
	.xword	0x23238a6d9f2041cb
	.xword	0x761ad56adb383e85
	.xword	0x90a5535658157145
	.xword	0x599e4987b7264541
	.xword	0xdd6d373eba826333
	.xword	0xd17353ddaeb80151
	.xword	0x00c2aca3c525473b
	.xword	0x5cdd4a25cb2e4f43
	.xword	0x9e2d1dfd0866f139
	.xword	0x8a1d7c3a0b22fbba
	.xword	0x63c5d1b8305e9ca0
	.xword	0x27e6f3ecda7c0b28
	.xword	0x724fee5333fe35fa
	.xword	0x8987a9968ef868d4
	.xword	0x18f845604112fc03
	.xword	0x5a1b6cfa8a45b77c
	.xword	0x1c1a1261d6b01c89
	.xword	0x564062e7922d4e2f
	.xword	0x28d84a55b8071d4c
	.xword	0xecf0e1ae2cb9591d
	.xword	0x6a6dc98a0ae0bfac
	.xword	0x025c70df112964c2
	.xword	0xfb58d51a96ef89a6
	.xword	0x0fe7e26090fa5e6f
	.xword	0x6ce6180bea05f6ef
	.xword	0x8d5294a2f6873fbf
	.xword	0x7ce6da77c171e76f
	.xword	0x3db71a9c62545a7c
	.xword	0x57610f3138e7be59
	.xword	0x7c4f9760e416dbfd
	.xword	0x15e2da594354f0cb
	.xword	0xdc1939f6ce6cb040
	.xword	0xe682d6902e22e07f
	.xword	0x04e7b9fcfc8d2d0a
	.xword	0x552af68243f81768
	.xword	0x7c82a16feeb9c286
	.xword	0x39d6c878d194cb5b
	.xword	0xf04dfa035e29cdd6
	.xword	0x298c453e2b3070a2
	.xword	0xd1cd8c1c1d100c22
	.xword	0xa205d94b52d734c9
	.xword	0xf1bb57268ab661d0
	.xword	0xfafababc8d754139
	.xword	0x655cd9e555efa306
	.xword	0x96c8b56a7069b21c
	.xword	0x3afa996ec8910232
	.xword	0xa2a973c1153d33e4
	.xword	0x96d2bc4e44c0afd3
	.xword	0xd98dd5f8a5dc4d08
	.xword	0xef5a61be78d15b18
	.xword	0xff4d64a2919e8d48
	.xword	0xbede8eeb59dd11bc
	.xword	0xb3da1d7a086f2696
	.xword	0x8c75f1dc490a4116
	.xword	0xacd5deaeb16c9e75
	.xword	0xd52adfe0eea6c8e8
	.xword	0x27cf0d2f69edcc4a
	.xword	0xd027ae7fa7ea275f
	.xword	0x77c772f1605430f9
	.xword	0x8f07e0901d436976
	.xword	0x207bfa75438b2719
	.xword	0x58a86585e80e06b1
	.xword	0x968d86ae6a105a7d
	.xword	0x39ef5a25c553ecaa
	.xword	0xeb6ba667e9036d69
	.xword	0x88d9803c6105bd93
	.xword	0x5cc1f32e8e39fcfd
	.xword	0x2cd603faf424358f
	.xword	0x6e537b6568a55ead
	.xword	0x0fa04dfbdb3ead0c
	.xword	0xfcd0f632f74ea50b
	.xword	0xfe3154167e22768f
	.xword	0x44a65feaf0bcc596
	.xword	0x001bd3c64cfd51eb
	.xword	0x1af9ec095ad1a4ba
	.xword	0x0f8e264f72b41cb8
	.xword	0xcc73b7a563f4115c
	.xword	0x65fe0b576daa01f7
	.xword	0xa4175a43f879c200
	.xword	0xbdff6e1e58c4357a
	.xword	0x378e6ebc5c7429fb
	.xword	0xbf8a1c7715d1d43f
	.xword	0xbc087cf7f2a8482a
	.xword	0x9b9659afd494c1e7
	.xword	0x242fddf0213fc39c
	.xword	0x493fb794c934b244
	.xword	0x8ca93141c292f395
	.xword	0xf067872fdb22fd4b
	.xword	0x90474c276d51a866
	.xword	0xd49087f4e76f61d2
	.xword	0x018d8a89f48010ca
	.xword	0x374f90f82eaf05fd
	.xword	0x306580220b3c9f24
	.xword	0x36fd141c14bfcdf0
	.xword	0x0891eb107864c6cb
	.xword	0xa8e8b202f6d0a49f
	.xword	0xf91c71149ccd8666
	.xword	0x42328bf6e4f02bcd
	.xword	0x787af62d24cf060e
	.xword	0x4bf4f98ac0384c17
	.xword	0xe9c4ce08a540029f
	.xword	0xda6437a151544944
	.xword	0x40b98da9171f2721
	.xword	0x631aa319ded0fd97
	.xword	0xcd11c301e490fd00
	.xword	0xf456e8ff2f841c8f
	.xword	0xbe2988a3105a904c
	.xword	0xea0fb95915cb3b35
	.xword	0x732012b870698336
	.xword	0x64d61314e76828d9
	.xword	0x1444c943fa696309
	.xword	0xc368996fda08ed13
	.xword	0x0957a829aec06ae6
	.xword	0x8b013406eed1ff7b
	.xword	0x10ed062fd2e61b6a
	.xword	0x5a5acc7d93410a5a
	.xword	0x789b14acf3907d58
	.xword	0x7347b37762fab674
	.xword	0x3ed9dd3ae8e65ff6
	.xword	0x816bce874456e135
	.xword	0x9ed4c16bc0595f85
	.xword	0x266ac75d1a9e90cd
	.xword	0x7aacd4479e50d684
	.xword	0xbfeef0dc45b0597a
	.xword	0xc75421be4f4c07bf
	.xword	0xd44ccaa78deae2a3
	.xword	0x42f91a56552b9ade
	.xword	0xf5f9c9af8caeeacd
	.xword	0x5879c4ff34e3d899
	.xword	0x2952cd3e4fb839e0
	.xword	0x1d008840120054fb
	.xword	0x49e8bf4e5da501ea
	.xword	0x0f3c730e3428ac58
	.xword	0xe11af4a11586b8cf
	.xword	0x787df07b4f1f73e6
	.xword	0x1a733c8b38b72a8a
	.xword	0x4b367b53f4780d25
	.xword	0xe4e30fcc39dbdeab
	.xword	0x6a648bc2ef921c47
	.xword	0x4cbb6d85df812e13
	.xword	0x7e9caa68243510bb
	.xword	0xe16fe3a79edfe8d8
	.xword	0xc3001166441ecafa
	.xword	0x898f7aa338641314
	.xword	0x782d1be0a6e5a12f
	.xword	0x7c5860a2f7c5a429
	.xword	0xd757aa48f786133f
	.xword	0x90064de294fe28c1
	.xword	0x8a9a99bb672a97ab
	.xword	0x65c32ac3b4da4850
	.xword	0x2a1e90f93614f06a
	.xword	0x07cefce4c12e46e9
	.xword	0x4a73e22e80e1fa6f
	.xword	0x6b3c2b2d9f1a00b1
	.xword	0x2b35aba3038e723a
	.xword	0xf27e3485db029cac
	.xword	0x70b003052834d0c4
	.xword	0xf686916757a6fbd6
	.align 0x20000
	.data
data_start_5:

	.xword	0xae3d39dd41364b0e
	.xword	0xd4cfeb434ed7dc02
	.xword	0x843d898fa5f21967
	.xword	0x0737fcb0e93cd3ae
	.xword	0x4ee1eae93c488e4f
	.xword	0xb42531e51fa6433c
	.xword	0xe3270dfa7fb95689
	.xword	0xc3c3723d62802735
	.xword	0xb5dd531575f9a3ab
	.xword	0xfe9d9a938784eb7a
	.xword	0x849e006278a05b5b
	.xword	0x014904a0991e7489
	.xword	0xbd220a7e65aa5244
	.xword	0x57f38e29472a8228
	.xword	0x1664ba33d35e1c0f
	.xword	0xacdd00ba156d5155
	.xword	0x7b1e46ee7f154792
	.xword	0x3ec44a8efe6c7790
	.xword	0x88ce7f114e1c817c
	.xword	0xa6fea59040496be7
	.xword	0xd170c837f8ea306c
	.xword	0x20f870d31efa58a0
	.xword	0xa4d31d10a9674e75
	.xword	0xdf0c757cf70bbd6b
	.xword	0x7a96a74815b4cb86
	.xword	0xd99f4bbfa63fefbc
	.xword	0x4c097e211734c3e6
	.xword	0x3622db15915c2d5d
	.xword	0xcaff3cf61fbbae89
	.xword	0xcfa50b80a43efcc8
	.xword	0x833e67f27d68580d
	.xword	0x36a361c063b8e788
	.xword	0x5f587ba9887ace01
	.xword	0x922f0771a4a3da97
	.xword	0xa5602a1af56ff811
	.xword	0x040c03515b2dbb00
	.xword	0x4b81d5b8dbbc4d68
	.xword	0x3967699c41cdb9a9
	.xword	0xf2a621d3019b33aa
	.xword	0x4786059a375c7e63
	.xword	0x2a01427cecbbc9bb
	.xword	0x24bbf758365c82b4
	.xword	0x8a935436927c6204
	.xword	0x786c89c62087358c
	.xword	0x69c5f0ee65937cd4
	.xword	0x448a058f8ba2c7ec
	.xword	0x54a060729e12fa6c
	.xword	0x0497502e5955b341
	.xword	0x02941f8abf3898c0
	.xword	0xb1dbd872395e7883
	.xword	0xc1f7ae75f93ee3d3
	.xword	0xd50d8a3ab65ada03
	.xword	0xf4a65f77dd80a3c2
	.xword	0x24c2132762e9af0d
	.xword	0xdc7eaa74c4dfa09d
	.xword	0x12d5530c537b928d
	.xword	0x67c67f6f2b371ea6
	.xword	0xaab2b259b4eb7e9c
	.xword	0x3fd4d32928194ebf
	.xword	0xa41f4254f1ea4a2d
	.xword	0x84b41b7f3c54c38f
	.xword	0x3a616005c809d554
	.xword	0x9c3f5bd5d4c52d3a
	.xword	0x72c271817516f16f
	.xword	0x1d14cd76e4d7a3e1
	.xword	0x12c1df1f3ce16a72
	.xword	0x4203a073eb6af0ef
	.xword	0x4bcd92335b074ce9
	.xword	0x4f0765eea907c8cd
	.xword	0x914a44f35aa5f22b
	.xword	0xa0924098be92e270
	.xword	0x48b11b1cf536ffd2
	.xword	0x55bf493bdde7b7d4
	.xword	0xc55c93a2b0a72c4f
	.xword	0x982c7f518dbe1db3
	.xword	0x7fa20fa35a850076
	.xword	0x397dd08b58d5f8d8
	.xword	0x4f579036ef34bb7f
	.xword	0x353cd82c41c08bc1
	.xword	0x861c43190bc5f0ff
	.xword	0xd7af907904de2462
	.xword	0x8bb4ec9dbd40f88e
	.xword	0x0720144f2085a6f8
	.xword	0x0a6c74afb150bbd8
	.xword	0x7ec5d51e603702aa
	.xword	0x0b5ce4035e5266dc
	.xword	0x551baf30efbe2674
	.xword	0x0bcb1c4cf4b48628
	.xword	0xbc86853c1e2ec435
	.xword	0xf98a259c32beb2fd
	.xword	0xaa823050f235a791
	.xword	0xb316ef0fe17065fa
	.xword	0x4ee1bf66eb281b89
	.xword	0x2ab7f207f6638a82
	.xword	0x7db82aead099fbe8
	.xword	0x852937026318ad1c
	.xword	0x161a1f4a3ae130ae
	.xword	0xed0615267a06a26a
	.xword	0x67fa8f5d5a317448
	.xword	0x3bf53c258e6b0296
	.xword	0xe33a83d66a6d3260
	.xword	0xb20a09b88d7d0c42
	.xword	0x9e0b0b3d513dd27f
	.xword	0xdafa3c1a6fd4a5c6
	.xword	0xa2ca2c63ace22979
	.xword	0x4d43f08c0ae7ebb7
	.xword	0xbc7e4fb63272b377
	.xword	0xb5d17255da33252f
	.xword	0x490eb3236ecfb468
	.xword	0x42aea2857ce2e241
	.xword	0x7ca1b58e78cecac1
	.xword	0xfbc53d88729ae9e5
	.xword	0x2baf14f034f7fb6d
	.xword	0x948ce7bd91b1dfaa
	.xword	0x0b306a98a15fc258
	.xword	0x2024ecf70ce64d09
	.xword	0xfce10d2fdcb570e5
	.xword	0xf3ec0f50358442cc
	.xword	0x6e1ed3848713d9c6
	.xword	0x9cd79bdf4e13548c
	.xword	0x0061fca21de26892
	.xword	0xc72b5c0ff858ebb9
	.xword	0x38fcc23254d71327
	.xword	0xf9b84f1e07637251
	.xword	0xd3f5eb9a700110ab
	.xword	0x5645ac967e3e3e97
	.xword	0x4c0cf0c2493fc6ac
	.xword	0xbd2c3fe3acd2d26a
	.xword	0x1422dbaf3817a4b7
	.xword	0xbb81c9622b9cdfa6
	.xword	0xdfad62abe0a0b135
	.xword	0x561d87bca5f0a41b
	.xword	0x491c57bb1e780d4a
	.xword	0xf55e9ea4bde233c6
	.xword	0x70fff38b2834a5d3
	.xword	0x78974ff6da9ca12d
	.xword	0xb896691d71bb8d61
	.xword	0x64b97062b677a5d0
	.xword	0x161e19962ed21de6
	.xword	0xf7dfd0f4c5b927de
	.xword	0xfd2949fc7b8ead2f
	.xword	0x12780dc8c2ace65d
	.xword	0x017392e94838e9a3
	.xword	0x0473d445b43c11c4
	.xword	0x269eabcc0d04495b
	.xword	0x2d964be411725397
	.xword	0xe000afcc1f56594e
	.xword	0x8cd91673449b5945
	.xword	0x8352e599948a3460
	.xword	0xec285f8093d5e10f
	.xword	0xe411da214da3b2ff
	.xword	0xa2606dfc45e110b7
	.xword	0x72729f9b824e1136
	.xword	0x0bee959834b45537
	.xword	0x07c5ae5dd8977ea2
	.xword	0xe9a7c0cefb7988a3
	.xword	0xeed5d9848000ffdd
	.xword	0x0f36813d69686729
	.xword	0xe3dd5a772fbfd71f
	.xword	0x3a29ba35184c4869
	.xword	0x6e2051f052a4e28b
	.xword	0x4403bcd6a7c5879d
	.xword	0xc6546595cf7ae7eb
	.xword	0x5f3ebf05339e4fed
	.xword	0xe358e9d8bd30cc14
	.xword	0x6adfc53b6fe7c361
	.xword	0x5f7d533c78ff314a
	.xword	0xc9c513687b22f23c
	.xword	0x6494027b6af07a89
	.xword	0xbfc6d8e22922d762
	.xword	0xdc53cf0259f9646f
	.xword	0xadd328c8962ff8e9
	.xword	0x9f5e2fcf5b368025
	.xword	0x5b64ccfa5e579dd7
	.xword	0xbb60bf7647c143f1
	.xword	0x5408fe611b99d1f1
	.xword	0x5aa03259e3e485a5
	.xword	0xa1fdc5dec4f47201
	.xword	0x22bf293f60de0136
	.xword	0x2ff1266e4548ef28
	.xword	0xcccd1ffb42d1139c
	.xword	0xd29959c97f4d9a02
	.xword	0xdd2392964e8111c4
	.xword	0x5f0405e656820dc5
	.xword	0x36a98d53fd68570d
	.xword	0x8dbc24ecd57e711e
	.xword	0xf231de4377281d19
	.xword	0x5090a4019f22fd30
	.xword	0x2a4165acfaaca5bb
	.xword	0x78819167d8729210
	.xword	0x2636a4f20d4b13de
	.xword	0x7ab0f3105a3adf08
	.xword	0xb4c9943f58b0066e
	.xword	0x7de44e4dfa70e1ff
	.xword	0x92bae31799c831a2
	.xword	0x739e3c496bc66b4c
	.xword	0xa470b08f15a877c6
	.xword	0x2743e8b0d4ce5400
	.xword	0xbbddf3ea6a714602
	.xword	0xfeee00c94013e0aa
	.xword	0x0b4b17ad05ecfc87
	.xword	0xff201b782d9e8838
	.xword	0xec8f6142eef8d71e
	.xword	0xc5e0d1f5ae205b6f
	.xword	0x6921b63af5f25956
	.xword	0x1650767ca4b167bd
	.xword	0xbbfebbbacaeca22c
	.xword	0x62e88ed681920d89
	.xword	0x49a7e95c91e90bcd
	.xword	0x8a93f51ba5d6040a
	.xword	0x91989807dc329cc5
	.xword	0x5724e2b1280ef077
	.xword	0x3a58dfbfbcf4b7d2
	.xword	0xae8247b6de12593a
	.xword	0xf2a650db575b81e0
	.xword	0x90c0981e810d18d5
	.xword	0x31bbc34d79e7b646
	.xword	0x5b39eab84900476f
	.xword	0xc5c59aee35256203
	.xword	0xdcb92a003ab4c3b8
	.xword	0x56342cfdec2fab33
	.xword	0x3206ea62a965832e
	.xword	0xfee67358e247e363
	.xword	0xeac29a8ac0a480a0
	.xword	0x9173967e3e0bd5d6
	.xword	0xfe419dc84fdf6fcf
	.xword	0x05fdeb53cfd3dd79
	.xword	0x80bc29f2fcdf5481
	.xword	0x54dcd26451080d17
	.xword	0xc844b0e990f0261c
	.xword	0xb88a6a4bc02721e0
	.xword	0x40cfdcdfe2ed4328
	.xword	0x4b5d1599ce7172fc
	.xword	0x82af45888fa06883
	.xword	0xdfaccd28deb973ce
	.xword	0xe4f445b534c1cdab
	.xword	0xf33cbf787f205719
	.xword	0xcf8d56d6e596b41e
	.xword	0x26ac5f6d08f82f54
	.xword	0xda4206ea7f62e78f
	.xword	0xd78adc3016b0cbce
	.xword	0x6d43fc44acaccb5c
	.xword	0x5baa789798719bf3
	.xword	0xaaf8bddc6c017bb2
	.xword	0xf16b59f5df3d8f60
	.xword	0x7f83a8aef17e14b5
	.xword	0x91bba62ac69b7b62
	.xword	0x604fb3c9e3230aa0
	.xword	0xf17db4cc537701f7
	.xword	0x267688d3a2e3ba07
	.xword	0xd368c7938fe1f8c2
	.xword	0x725669f89f4e8db8
	.xword	0x857df650c0412e73
	.xword	0xf09b88ed8565ec1e
	.xword	0x35d353c70be593ab
	.xword	0x826b67a3e3469167
	.align 0x40000
	.data
data_start_6:

	.xword	0x2c169b40a7c4f5a5
	.xword	0x15eea98aaf1b8d95
	.xword	0x5c39dbc8114c2c54
	.xword	0x6ca9fcb81f735f9f
	.xword	0x2184524e50e37989
	.xword	0x5ab34ff64537014f
	.xword	0xbf2ca03c9f2501f2
	.xword	0x8c8297372541bf25
	.xword	0x197083bbb9f765a6
	.xword	0x31fd80dd974d61e1
	.xword	0x63d3364eaad6d98a
	.xword	0x31ca714eb2fa8590
	.xword	0xee8990d51ba98a44
	.xword	0x3f199c345a1edd77
	.xword	0x56c57bdd72548298
	.xword	0xceaa3da310f8bd27
	.xword	0x1a4810e609208c1f
	.xword	0x1489fd7c299d482c
	.xword	0xb733e12a5dfe2364
	.xword	0x6ba1a489d173937a
	.xword	0x001e823e948bdc1a
	.xword	0xe258b1f29a3faaa1
	.xword	0xc7d99553c1a43aac
	.xword	0xa06dc9e2d7911007
	.xword	0x90530de6a3ee7549
	.xword	0x2d1d975c3bd3df27
	.xword	0x28967b3c528b037b
	.xword	0xae402c39bc3a7c1d
	.xword	0x049e8e0d21912006
	.xword	0xb318c80604ee9845
	.xword	0x5ff89f5dccb0660e
	.xword	0x53303893d8d48961
	.xword	0x0d4d1f4dd9ff3e5b
	.xword	0x349f24982b530bb9
	.xword	0x5788e6ff3f380f0b
	.xword	0x88ea83cf3ab1d7c2
	.xword	0x111c93f365ef594e
	.xword	0x93eaed414263afba
	.xword	0x95ff00450c8af97a
	.xword	0xb229ff1db4cd2ca6
	.xword	0x670cd9c116859723
	.xword	0xa39129860810de5c
	.xword	0x01a4a49b034db2f3
	.xword	0x631a46091737cb26
	.xword	0xd5d7bfb81e6fa80e
	.xword	0x1a1d3f442011833d
	.xword	0xad3af5aed8550e78
	.xword	0x2434768b0e5215f1
	.xword	0x085be27fd108cc58
	.xword	0x75a07010c67b84dd
	.xword	0x395bd7e4e0173052
	.xword	0x0f194a824222b446
	.xword	0xd9a003ff86d77703
	.xword	0x13a5538b6cb09822
	.xword	0xf6fecac8481decb9
	.xword	0x455f2305aa6a5ebb
	.xword	0x44e329707012d19f
	.xword	0xa6cdec5da68d6bd0
	.xword	0xc09920766a151898
	.xword	0x9839a0ea76676fcd
	.xword	0xec00fff398c42f63
	.xword	0xb6c2c2bcbe9387e4
	.xword	0x0eda2495e255127c
	.xword	0x161933dacb64f332
	.xword	0x31b111757ee5cf03
	.xword	0xb82b09c8f681082e
	.xword	0x084bdf2e8e43811c
	.xword	0x9d19fb9231e4c903
	.xword	0x0cc993885a48c20f
	.xword	0xa927d5491c46727c
	.xword	0xd01ac36b455b247d
	.xword	0xdd3969ef2123228c
	.xword	0xf48afb65a51594e3
	.xword	0x0865b596406fc125
	.xword	0x7caa4e1e0574c1db
	.xword	0xc2cfac0dcb4eb562
	.xword	0x2d77698137023fa6
	.xword	0xc4bf3d5a70fcb61f
	.xword	0x335e481d668038a0
	.xword	0xeba9434027f5ea48
	.xword	0x91224eb7c5a347cd
	.xword	0xe811313f3a09687f
	.xword	0x09dfcf7fc03b091c
	.xword	0xe2bc8de1a9d0cfb6
	.xword	0xb83d5bfa5d49276f
	.xword	0x57bfe948eb65cd37
	.xword	0x0a117e346ee6d842
	.xword	0xd94a437f1ad37b72
	.xword	0x98ff6b52dd94a1d4
	.xword	0xb65547c3c45b9028
	.xword	0x84f7e89ff3f632fc
	.xword	0xf6e6ae420787d759
	.xword	0x436204799e7fed9f
	.xword	0xc8b5e3071618c3d2
	.xword	0x703bd3994b088fc4
	.xword	0x9c7a1fb1ae22a33d
	.xword	0x6f1b01b1cecf591d
	.xword	0xfc5f8a0f45a6245a
	.xword	0xaee4819756e92620
	.xword	0xf09639e7c38f09bb
	.xword	0x87649e9774fc34ae
	.xword	0x0ceac6873f3ee28e
	.xword	0xd73ab881a390e781
	.xword	0x24ba9e2fb52d7dbb
	.xword	0x46933153588bae8c
	.xword	0x7460aa24028c080c
	.xword	0x21ddf1d04ea7b559
	.xword	0x29613092defb1a0c
	.xword	0xc2cb605e62bae8e3
	.xword	0x55544320f6a8f78a
	.xword	0x1f7cbae03a1b2ac5
	.xword	0x8897dd7f7722a119
	.xword	0x560ecc64174034cf
	.xword	0x59dcb08c73f2cd9b
	.xword	0xa9dc7ae26051f497
	.xword	0xa1b72008c059b9b7
	.xword	0xc1e8f1816f287c90
	.xword	0x7b3a2e9d1e4a9518
	.xword	0xa112b9d26bed9337
	.xword	0x585cd38c8f496006
	.xword	0x328d89302bfe29ee
	.xword	0x584533cbcb8ef0a1
	.xword	0xf28a3c46c5a98649
	.xword	0xc245b496138b5321
	.xword	0x1fca0abc409f00c5
	.xword	0x1956996c9885140b
	.xword	0xf00bd39aa62b7a15
	.xword	0x55b8e0b6a214f461
	.xword	0x75cac6869af68ca6
	.xword	0x35023b2154a67f84
	.xword	0xaec95652cecd70b5
	.xword	0x3fe1be1515494461
	.xword	0x8c81182656e45474
	.xword	0xef3de4bbafb23540
	.xword	0x1f4a18d80047f179
	.xword	0xd2df82915f8221fe
	.xword	0xbadea1943597900e
	.xword	0x2f8a8e26f0cd5b47
	.xword	0x63e697d10bde57bb
	.xword	0xa6689f0825e043f7
	.xword	0xc15ada9e19c3ac83
	.xword	0xc04c4b159c5ee582
	.xword	0x01e446338b02a041
	.xword	0x231009b8c574f381
	.xword	0x00be814462a48817
	.xword	0x9434e65fd35750d0
	.xword	0x2871c7b37bbb929c
	.xword	0x487d1f44b684467e
	.xword	0xbbf29081222c861c
	.xword	0x55fd828ace438317
	.xword	0x5c7cda953a2af35b
	.xword	0x642b26a9d0c1fb9b
	.xword	0x65d91f0fd04c4ddd
	.xword	0x706ef06abc080fdf
	.xword	0x15c000241b4f0837
	.xword	0x1bda051e820f52e9
	.xword	0x88c733a904195885
	.xword	0xa790afcf1f534244
	.xword	0xcb6a0056903c1e54
	.xword	0x6662430ffbec5bf3
	.xword	0x4acef5b69d9c6b24
	.xword	0xf3336915acb10f6f
	.xword	0x7beef605bfd5bfad
	.xword	0x1a4227cd79952870
	.xword	0xdad7fe29b946adff
	.xword	0xd5f13bfea7b782b8
	.xword	0xa75d624f0cc2aada
	.xword	0xa7a89285c3631060
	.xword	0xac25a3246c1902b4
	.xword	0x3cbfc85ad2b1d30a
	.xword	0x803f3f0ea18b49e2
	.xword	0x73a99e6a5ee9b5e5
	.xword	0xbfa1d1fa7f9c4fc8
	.xword	0xf94c6801287d39c1
	.xword	0x52bb273e307e4de4
	.xword	0xe35ac87b16ee1867
	.xword	0x00e8aace78e13ddc
	.xword	0x1976866833f55c73
	.xword	0x6f896f07c90ecbb9
	.xword	0x6ffe6086e51d0c17
	.xword	0xa3c02ef0573fce01
	.xword	0xbe0938115dc91430
	.xword	0x351fb8ab3f0623bd
	.xword	0x7c84867b259adb5c
	.xword	0x6f5991af5022e566
	.xword	0xd692221402fceeaa
	.xword	0x48f4d9f15c5c3154
	.xword	0x84305ada033ea68c
	.xword	0x21aaad9474d11b16
	.xword	0xfd34c4a2c174907d
	.xword	0x9e799a4a8147478f
	.xword	0x89dd6775ab5e7041
	.xword	0x5582bee58b5f066d
	.xword	0x5db3697febad886d
	.xword	0x76c873bdfe81cedf
	.xword	0xc73e4948fd426ea1
	.xword	0xbde8b9cfa8129e73
	.xword	0x279983ca1692dd32
	.xword	0xb1d3fda6c8a40f60
	.xword	0xd08c7452d9ee8514
	.xword	0x4e6c1777fbe614f5
	.xword	0x0e47ff49b58cef6f
	.xword	0x0f7883125ddcdd25
	.xword	0xd59bf5fcb4e5ac42
	.xword	0xe9b20a663fefd988
	.xword	0x5b029562c996a6d9
	.xword	0x825c44ce7b7b8ca0
	.xword	0x990abddd72a2d601
	.xword	0x9f2c6ede84ae2eb0
	.xword	0x583416ff2674844f
	.xword	0xaed333e406484e89
	.xword	0xc45946aa83d29794
	.xword	0x9921eade30e3ee93
	.xword	0x973e2de4b0dd5e09
	.xword	0xbb3393d413f073ca
	.xword	0xe88214344dab9b38
	.xword	0x696e9fb857061fd4
	.xword	0x2b63e0b686b249e7
	.xword	0x13b0fe99ac8fec19
	.xword	0xd565e611ab30e30a
	.xword	0x8ca0c6ab86345c5e
	.xword	0x1fdb7eba97978bed
	.xword	0xb7eba47ef7a5eb29
	.xword	0x211a7407f15ae905
	.xword	0x96741a7209241444
	.xword	0xe5c7d4c6d4d190e3
	.xword	0xcad1bab5b20aed0a
	.xword	0x64bd75d6c847ab17
	.xword	0x9bb0887cc5bfc6b8
	.xword	0x93041b65cbe03c48
	.xword	0x125f3193c5ce760a
	.xword	0x4eab6410f74697b7
	.xword	0xde79f270ff0dae59
	.xword	0x1be93b1a2f55812b
	.xword	0x818d93f283ffa247
	.xword	0x4b7548250f5684a6
	.xword	0xc766aefb86eff60a
	.xword	0xd1084de3a32299c0
	.xword	0xa3b6f362623c21e7
	.xword	0x896d70bdf4f20484
	.xword	0x945a2050c5c3406c
	.xword	0x94dac76ca4b00964
	.xword	0x0aa141083d5897f1
	.xword	0x4a58a4d634becab7
	.xword	0xda478401fca8de1f
	.xword	0x9de9b3849fada6d3
	.xword	0xa690285174f8d3e6
	.xword	0x1d88e5d789924a5b
	.xword	0xc920580fe52f89dd
	.xword	0xf45e02412bae926b
	.xword	0x1ee3163f449131b0
	.xword	0x6132aee93f20da6f
	.xword	0xcb51f5367e31e120
	.xword	0xf3c24e1ce508db80
	.xword	0xa894bba763fbf382
	.xword	0x6413e28013832f24
	.align 0x80000
	.data
data_start_7:

	.xword	0x64ced02ac9f280de
	.xword	0x51d3b715a0733f2b
	.xword	0x0b5dd41280040bef
	.xword	0xc4e99673ee303f03
	.xword	0xb5fb64de8dbe3999
	.xword	0xbc5cd2135d9df34e
	.xword	0xca083bd38cffc9d1
	.xword	0xaf220e5bce65543b
	.xword	0x06472903071f148c
	.xword	0xb56cfed592e1c46a
	.xword	0x8ee05475cf5b5d04
	.xword	0xa90f9718f9562121
	.xword	0x7919a829035d5452
	.xword	0x8f38587492d3fcbd
	.xword	0x0903f6fc3e907d03
	.xword	0x635a21716cd24c1f
	.xword	0xebf8952d47b69fd6
	.xword	0xea5685cff0f2a668
	.xword	0xc193a537696d5d6e
	.xword	0x6cb49a4d17dde66a
	.xword	0x6b6577ff7ca92a0e
	.xword	0x7512d840e29be206
	.xword	0x217adf10d709e7d2
	.xword	0xf0f1fa1a2bae07a6
	.xword	0x8ffbc23a8d059eec
	.xword	0x88f07cf66601fa2e
	.xword	0x52b5ac72ca4b0668
	.xword	0x429474606af5ab2b
	.xword	0x99dc6224fecda536
	.xword	0x2fc30605a816ecfd
	.xword	0xae59983706073061
	.xword	0x33760ed2d83a10f2
	.xword	0x403feabddbf70b73
	.xword	0xa4ef7f0ebe81a4df
	.xword	0xf71cedd0c7184270
	.xword	0xa3ad952d7afa39ad
	.xword	0x2ec9ae00da4033cb
	.xword	0xc54e5c9d51b80b9d
	.xword	0xe129d4144cb2ece9
	.xword	0x4e120df53e96f303
	.xword	0xbaed88e9d3a8fc6e
	.xword	0xfd6195e1bde9ddce
	.xword	0x0c2f98414a55f1a3
	.xword	0x0c8504d8717a7337
	.xword	0x082706d488c85af3
	.xword	0xf1b4d3dd73e457da
	.xword	0x20a3f1f9f3eea4ab
	.xword	0x429f28b1cc4e8fae
	.xword	0x8e01983a1fe02582
	.xword	0x433813be286d0d55
	.xword	0x21691c7a7de9e964
	.xword	0xd51b04deeedf04ea
	.xword	0xe54cc2c7300a7fee
	.xword	0xe32528e3d01c4df9
	.xword	0x38607baefe120612
	.xword	0xd0a6dedc33941f9e
	.xword	0xa3c8f44610bc5b48
	.xword	0x0106bc6ce88be60a
	.xword	0x4bc62e0a6684abe0
	.xword	0x688adda6abf49f53
	.xword	0xd89a48f27d2b2052
	.xword	0xb824267f5c773551
	.xword	0x8c34b0ef15561eda
	.xword	0x9a6fbfd9d8150f98
	.xword	0x80490b8c1c238634
	.xword	0x7d7d1bd567c10c92
	.xword	0xa1dad3e90dbcf0d2
	.xword	0x85beeba58db9ab88
	.xword	0xdfeb82eef909fe59
	.xword	0xb88b700ef84c7440
	.xword	0xb1395ab79ec5c953
	.xword	0xd4a241086e318e78
	.xword	0xe82808713bb615c9
	.xword	0x59e667edea385bd7
	.xword	0x5bebc6e75016ac5e
	.xword	0x081358005a9ffaa6
	.xword	0xa30f7461126ce2db
	.xword	0x6577ecb2514be4c4
	.xword	0x238d5c0f6a5faf0e
	.xword	0xdeedc6db336205c3
	.xword	0xee7d1bc1aff62e51
	.xword	0x0aeb003428775830
	.xword	0xcdbcf3145176a3fe
	.xword	0x6ea0cd7ad24cd04d
	.xword	0x8a2e2c8a36a412dc
	.xword	0x6305f3b52eee3734
	.xword	0xb7f2181b6202bbc4
	.xword	0x8576d17247da205c
	.xword	0xd448386f897252cd
	.xword	0x5a425e9d012c5666
	.xword	0x958307aa6a61e7bf
	.xword	0x2bef2df918fd3e6d
	.xword	0x9dcd9cc508182cd1
	.xword	0xe80168aee073f523
	.xword	0x4b495390c89371aa
	.xword	0x996a18486b1e5ebd
	.xword	0x2192cdab5ecaa77e
	.xword	0x547806cd62c8d1b4
	.xword	0xedeff783629a65ce
	.xword	0xab7a8ff0ade5271d
	.xword	0xb913bc04d457f888
	.xword	0x49c939797e909213
	.xword	0xfdee0c5797a64c78
	.xword	0x5e4a6ec594de4a92
	.xword	0x726e9412c97ca051
	.xword	0x37589b264aee5685
	.xword	0x6b6fb727255379bd
	.xword	0x088c02a58af440de
	.xword	0xa87e2aa3f83a658e
	.xword	0xb4bc2eef4fbc34fe
	.xword	0xbebf93cfe57d56a7
	.xword	0x57d37218dd5f2120
	.xword	0x06d5eb647e30319a
	.xword	0x3580afefdb4d8828
	.xword	0xce7ba9b37814a236
	.xword	0x976cace1efd8ad8c
	.xword	0x46f42b27ce53f58c
	.xword	0xfba7918191970baf
	.xword	0x7f2f59e23bc681c5
	.xword	0x7b31e328ca879e29
	.xword	0x17cce70c9ae3e4bb
	.xword	0xfa68223133e39f5d
	.xword	0xc9725708968c8dd5
	.xword	0x6781783807dd9fe5
	.xword	0x3c868c6dc31fb621
	.xword	0x6a2e785a78c73a34
	.xword	0xc71a444eca47c0e0
	.xword	0xf78c9b8351f86406
	.xword	0xe2d070fe5567ac76
	.xword	0xe4fa83b64e0cce95
	.xword	0xe35cd5191d91edd7
	.xword	0xc9ed237ce685d5b7
	.xword	0x0126c85765e8be5b
	.xword	0x961548aaf786b81f
	.xword	0xd7bce139763e7754
	.xword	0x8d4e8c6f95ad920e
	.xword	0x30715eecf557ecdb
	.xword	0xa1d26228b658c520
	.xword	0xd2d0317d2032f3f7
	.xword	0x545fa0c015d2c90b
	.xword	0x902e452058f71a7e
	.xword	0xbda6e213ed958fd1
	.xword	0x711bbc6af3830dd0
	.xword	0x247a3ce79d7ab93a
	.xword	0x0fdac735b1975887
	.xword	0x60aebf5883463d5b
	.xword	0xea0f8a6877539707
	.xword	0xd87f6cf62cba072e
	.xword	0x5404d0e6c89d2384
	.xword	0xc8c1e394c2c10d21
	.xword	0xcd76a38525148f96
	.xword	0x82d1f154405f569a
	.xword	0x97321e7900ea0d8a
	.xword	0x1e77a16af5d34a00
	.xword	0xfea00691c3ef75cf
	.xword	0xeebaaf95e02f99bc
	.xword	0x24e553226b1fcac7
	.xword	0x24e91959eb63fa52
	.xword	0x29b98ca51756b715
	.xword	0xcec02aa2b47649d2
	.xword	0xf9eac9f23f50f9a0
	.xword	0xb230529ddb152a29
	.xword	0x7ad2073edc0f5785
	.xword	0xfb1b8472a5acb876
	.xword	0x60a7d6e12790c42f
	.xword	0x348b0e3a73e8d122
	.xword	0xbe5612b5ea0a6614
	.xword	0xe8a0da60ce063c2b
	.xword	0xa18d253662eef7b7
	.xword	0x46c6bb56ffed3b84
	.xword	0x32c00feba00f09d7
	.xword	0x8c3019486cb2d1d8
	.xword	0xfff0b5f8c38b3d9e
	.xword	0x55189cf1b366d686
	.xword	0xd20345cdbb584b70
	.xword	0x6cd6f2659977277f
	.xword	0x03fd9736d95aa7a2
	.xword	0x967cb9cbd2c6bcd6
	.xword	0x355b38daec6488be
	.xword	0x9b5d03f2bfe6c2eb
	.xword	0x717bdd65f815ac06
	.xword	0x20e7f32ae80d13a0
	.xword	0x0acfc9a8d1c4a555
	.xword	0xa8413af647a8fdba
	.xword	0x85f9d9d55a27477e
	.xword	0xe23d403c138b13e6
	.xword	0xbc3ba0b12c85b215
	.xword	0xa370a7e0335ca8e3
	.xword	0x5240069524716ff8
	.xword	0x8e35facc1af4f489
	.xword	0xa5b4462ae34819a9
	.xword	0xcbce75cba3d94961
	.xword	0xf0d6997e1ee1f156
	.xword	0xee2dcd120fc5afb7
	.xword	0x31ad9be99fa063eb
	.xword	0x87524439b0aa25b3
	.xword	0x6f0d5ed2bbc9fa9c
	.xword	0x02b89ae335158bfa
	.xword	0x6f9fd42539402c19
	.xword	0x2878d872c788e317
	.xword	0x96ecca7f95caf7d1
	.xword	0xc89b434ae98fba11
	.xword	0x7255deeaced2e4bb
	.xword	0x762da59b2da4b858
	.xword	0x84aec57efe576ee4
	.xword	0x8cf92435b1e0aa0a
	.xword	0x2022f7ca7a5d47d0
	.xword	0x6b9b92ebb3c96d85
	.xword	0x9b9ee27e4c59ad75
	.xword	0xb210d67812947ff4
	.xword	0x1a9a082790a63c72
	.xword	0x8085be9d3aa87c3f
	.xword	0x28ef5726f684723f
	.xword	0x1fea5db6135c5efc
	.xword	0x541e3ca655758a9a
	.xword	0xfb76f65626f3fea6
	.xword	0xd082fa247fec005f
	.xword	0x3f61d94eb324ed15
	.xword	0x2cbb7e866d82bde0
	.xword	0xa06e2397bc0c138f
	.xword	0x51beba87d9e6c7e6
	.xword	0xe6dcdddb20816a43
	.xword	0x486f68b7a0d5910f
	.xword	0x83e82aff55dcc4fe
	.xword	0x696872c426d6cfcf
	.xword	0x661a545b52c3d2b4
	.xword	0x1cac0d48e2b5bbc4
	.xword	0xc34481c9ca7c6bcd
	.xword	0x144e2504f5e58e05
	.xword	0x879fec4d734b908f
	.xword	0xf224d04b3dde6b4a
	.xword	0xdedc5cb13aedc895
	.xword	0xe30eff5ffe29a8f7
	.xword	0x24a6a30ac1e58007
	.xword	0xa5735c8d6b02737b
	.xword	0xfbaf2fdd45a95265
	.xword	0xf6f663ca23ee44a5
	.xword	0x19924f71e352a41e
	.xword	0xf4588bb088667d15
	.xword	0x113c895f799b3501
	.xword	0x43f2cd6dca46dad1
	.xword	0x9e1434bcab2848cc
	.xword	0x161d9eaf54e84c93
	.xword	0x51242fe4ab6afd3b
	.xword	0xaa4afcee48a3f6e9
	.xword	0x9e9b4a0b52bcff4a
	.xword	0x448f5f320ad7cb33
	.xword	0xe67f26b7f1631176
	.xword	0x288b0e15db0bb73b
	.xword	0xf4c3bf2ce9cc211e
	.xword	0xe36eb5f8fd0a9152
	.xword	0xb25e4c3c54084e17
	.xword	0x1b781d1cbf6cb91b
	.xword	0xcfd3b5da0ee150bc
	.xword	0x7216da3a85bfaa53
	.xword	0x138bb98a57a952f2



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
