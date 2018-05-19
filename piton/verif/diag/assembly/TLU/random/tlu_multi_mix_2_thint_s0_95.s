// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_95.s
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
   random seed:	60537589
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

	setx 0x6fb2abf2180e415a, %g1, %g0
	setx 0x16b41e48400176a0, %g1, %g1
	setx 0xf8c3cba457c8e808, %g1, %g2
	setx 0xae5cbf4a0a3a1d6c, %g1, %g3
	setx 0x7d0304827ccb6b69, %g1, %g4
	setx 0x6c48f73738fb9f10, %g1, %g5
	setx 0xec34d5b7a40ed77d, %g1, %g6
	setx 0xaea15bd392d448a2, %g1, %g7
	setx 0x951038e130c4fb05, %g1, %r16
	setx 0xd4261621cef1f9f0, %g1, %r17
	setx 0x7a5557e1578ed171, %g1, %r18
	setx 0x5192d4af3a940e79, %g1, %r19
	setx 0xd0aae55233e7fb32, %g1, %r20
	setx 0x8930ea772d57951c, %g1, %r21
	setx 0xb1af0a7d23bd9db7, %g1, %r22
	setx 0xe9290be57b8b43be, %g1, %r23
	setx 0xe3b5907b7b4d8b66, %g1, %r24
	setx 0x74dedec0bab2b4a1, %g1, %r25
	setx 0x4846693457add219, %g1, %r26
	setx 0x764ddb613e0d9d8f, %g1, %r27
	setx 0xe83f6e9f0bf3d2fd, %g1, %r28
	setx 0x9be3e28c2ab5eb10, %g1, %r29
	setx 0xa563e9dccd15316e, %g1, %r30
	setx 0x91de88720c8f84c1, %g1, %r31
	save
	setx 0xe97d7fe78089b481, %g1, %r16
	setx 0xbff429a4ca231220, %g1, %r17
	setx 0x6d14d150aef5affd, %g1, %r18
	setx 0x2d97985e7b719f61, %g1, %r19
	setx 0xd68691f1b3d178ee, %g1, %r20
	setx 0xae7dad6cabf49542, %g1, %r21
	setx 0xe314e904a00a0f28, %g1, %r22
	setx 0x39c77025cd6b2104, %g1, %r23
	setx 0x05d4c59165e921ac, %g1, %r24
	setx 0x3e5c00f82dab848d, %g1, %r25
	setx 0x2fcd982ebdb3b561, %g1, %r26
	setx 0x4b38797671869b8d, %g1, %r27
	setx 0x896a11d671407110, %g1, %r28
	setx 0xc494181cd4a45a74, %g1, %r29
	setx 0x27ad414c67d8a851, %g1, %r30
	setx 0x43c98c7d6d69b83f, %g1, %r31
	save
	setx 0x69d168f39782210a, %g1, %r16
	setx 0x10f33d465d861a96, %g1, %r17
	setx 0x5af6a292d8bcdffe, %g1, %r18
	setx 0xef02c880c3b37724, %g1, %r19
	setx 0x00442a9b3ca9c06d, %g1, %r20
	setx 0x918869dd99adbd6e, %g1, %r21
	setx 0x8510dc8e24833648, %g1, %r22
	setx 0x3b6f3d6ec89079bb, %g1, %r23
	setx 0xc117da71454ae307, %g1, %r24
	setx 0x07554c6e77295a6f, %g1, %r25
	setx 0xa1abefce4a382a73, %g1, %r26
	setx 0x6cb2fd8439810940, %g1, %r27
	setx 0x05f2fea0e222a484, %g1, %r28
	setx 0xe3c27386eb54a456, %g1, %r29
	setx 0x696f7cea925f86b5, %g1, %r30
	setx 0xd654a4e86cae0752, %g1, %r31
	save
	setx 0xbbd178a291193f5a, %g1, %r16
	setx 0x07e9b7f4328d3c07, %g1, %r17
	setx 0x50404a76fc11508b, %g1, %r18
	setx 0x4e9805ad5cda6978, %g1, %r19
	setx 0xeeaaf0d738be0d9b, %g1, %r20
	setx 0xded0cb90c7fd44a9, %g1, %r21
	setx 0xfa2b23cc238c5e47, %g1, %r22
	setx 0x0033943bc0874232, %g1, %r23
	setx 0x510e11a9306b2b39, %g1, %r24
	setx 0x07cfa51ca71be6b5, %g1, %r25
	setx 0x7f4f285fdb54ecf2, %g1, %r26
	setx 0x20cc358018213e2a, %g1, %r27
	setx 0xc1c610094ca4febd, %g1, %r28
	setx 0x7a6dc2ccf898702c, %g1, %r29
	setx 0x4a8ffa71f6f9fed4, %g1, %r30
	setx 0x8f6d386038785b58, %g1, %r31
	save
	setx 0x41eee6de2672205d, %g1, %r16
	setx 0xf17d1809aeed30ef, %g1, %r17
	setx 0x4350cecc97fe9473, %g1, %r18
	setx 0x1743872c6405514f, %g1, %r19
	setx 0x2e3e2d4f86497f04, %g1, %r20
	setx 0x66896c03d0b45f0a, %g1, %r21
	setx 0xa7e84631cc6a0868, %g1, %r22
	setx 0x2a912835ed115262, %g1, %r23
	setx 0xceab810c44dfce56, %g1, %r24
	setx 0xdf24bdcec45bbe98, %g1, %r25
	setx 0x81340c62d2bc98fd, %g1, %r26
	setx 0x153048b8c519ff9b, %g1, %r27
	setx 0x87090dafa4d61c4a, %g1, %r28
	setx 0xc69193ae332bdbb2, %g1, %r29
	setx 0x48ad112ba2aec467, %g1, %r30
	setx 0xa5b2011f50fb94cc, %g1, %r31
	save
	setx 0x90a125a49d812ce7, %g1, %r16
	setx 0x05b7be4533875fba, %g1, %r17
	setx 0xf6ccc547e588a790, %g1, %r18
	setx 0x96fbbba6b098b0ca, %g1, %r19
	setx 0xa4ee97a5b2877f2a, %g1, %r20
	setx 0xdd05a3134cabdc2c, %g1, %r21
	setx 0x713c9ca93e949dc8, %g1, %r22
	setx 0x909d2e1206809675, %g1, %r23
	setx 0x76dd67809ef1a3c4, %g1, %r24
	setx 0x03033593842e7785, %g1, %r25
	setx 0x787dcca4d2a01c53, %g1, %r26
	setx 0x6e88c67353a792aa, %g1, %r27
	setx 0x4135921bb2af7bcc, %g1, %r28
	setx 0xa18d37dfce5e3cc0, %g1, %r29
	setx 0xcaf176a1feb0ec3a, %g1, %r30
	setx 0xeabaef30ca50fb92, %g1, %r31
	save
	setx 0x140b091f3786553c, %g1, %r16
	setx 0xc3e75e5175406047, %g1, %r17
	setx 0x7bd1e1d8d808d5f9, %g1, %r18
	setx 0x58e28f0bfa2bb8d5, %g1, %r19
	setx 0x1d5be5ba74e09ef3, %g1, %r20
	setx 0x81dd3ea65029a2cc, %g1, %r21
	setx 0x86b96273395a0d6a, %g1, %r22
	setx 0xc3ea153ad8bd8d42, %g1, %r23
	setx 0x48de1701c3f71171, %g1, %r24
	setx 0x019dd660a8ec3dee, %g1, %r25
	setx 0x71bc5fa111638e03, %g1, %r26
	setx 0xfd91eed3d07e8e9b, %g1, %r27
	setx 0x16d8a37b28942627, %g1, %r28
	setx 0x233fa026e9db3148, %g1, %r29
	setx 0x2d98d107c0fab799, %g1, %r30
	setx 0x021eb6f6e153c433, %g1, %r31
	save
	setx 0x63c087d8a4f9058b, %g1, %r16
	setx 0xb2339f8883912fc4, %g1, %r17
	setx 0x9aba9ab24be22d3f, %g1, %r18
	setx 0xbfc58dce42ff2a87, %g1, %r19
	setx 0xbae0b3138ab8b797, %g1, %r20
	setx 0xb24c440367b86aa7, %g1, %r21
	setx 0x3eae47f12683d540, %g1, %r22
	setx 0x90477abe063ac105, %g1, %r23
	setx 0x693952c873dfc2c7, %g1, %r24
	setx 0x2cbdb785624b4902, %g1, %r25
	setx 0x2b148fe3be77ddae, %g1, %r26
	setx 0x0fe70e90fbd6f3a0, %g1, %r27
	setx 0xe617f3287e9949db, %g1, %r28
	setx 0x9eb10eb84f3c77ab, %g1, %r29
	setx 0xd8877a49e07f7c1d, %g1, %r30
	setx 0x47edb0bf940ad722, %g1, %r31
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
	.word 0xbde4219b  ! 3: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8394a19d  ! 5: WRPR_TNPC_I	wrpr	%r18, 0x019d, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4a1e0  ! 7: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e152  ! 11: SAVE_I	save	%r19, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe4e11b  ! 14: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e5e0a8  ! 15: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbe95e1f9  ! 19: ORcc_I	orcc 	%r23, 0x01f9, %r31
	.word 0xbfe420c0  ! 22: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5209c  ! 24: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde5618f  ! 26: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb97ce401  ! 27: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xb9e46193  ! 28: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_4, %g1, %r17
	.word 0xb17d4400  ! 39: MOVR_R	movre	%r21, %r0, %r24
	.word 0xb7e460d6  ! 41: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5e021  ! 45: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8d946146  ! 51: WRPR_PSTATE_I	wrpr	%r17, 0x0146, %pstate
	.word 0xbc054000  ! 52: ADD_R	add 	%r21, %r0, %r30
	.word 0xb09dc000  ! 53: XORcc_R	xorcc 	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb53cb001  ! 56: SRAX_I	srax	%r18, 0x0001, %r26
	setx	data_start_1, %g1, %r23
	.word 0xb3e4a1e5  ! 62: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a17c  ! 63: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e1f4  ! 67: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1508000  ! 69: RDPR_TSTATE	<illegal instruction>
	.word 0xb8bd4000  ! 70: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb9e4a11d  ! 71: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbcc461d3  ! 73: ADDCcc_I	addccc 	%r17, 0x01d3, %r30
	.word 0xb3e4619e  ! 74: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb150c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0xbfe5a063  ! 76: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e159  ! 77: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x4623fb4100008b08, %g1, %r10
	.word 0x819a8000  ! 78: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_0, %g1, %r17
	.word 0xb1e46140  ! 82: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	mov	2, %r12
	.word 0x8f930000  ! 90: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5e18d  ! 93: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5a177  ! 95: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe521d4  ! 96: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbd480000  ! 103: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbf508000  ! 104: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4217c  ! 107: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe421c4  ! 112: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_5, %g1, %r19
	.word 0xbbe4204e  ! 114: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4e078  ! 126: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb351c000  ! 130: RDPR_TL	<illegal instruction>
	.word 0x859460b0  ! 133: WRPR_TSTATE_I	wrpr	%r17, 0x00b0, %tstate
	setx	data_start_2, %g1, %r22
	.word 0xb5e4a088  ! 140: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4e11d  ! 143: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc8d60ef  ! 144: ANDcc_I	andcc 	%r21, 0x00ef, %r30
	.word 0xbab52160  ! 149: ORNcc_I	orncc 	%r20, 0x0160, %r29
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 151: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x91946061  ! 152: WRPR_PIL_I	wrpr	%r17, 0x0061, %pil
	.word 0x89942156  ! 154: WRPR_TICK_I	wrpr	%r16, 0x0156, %tick
	.word 0xb5e5a169  ! 155: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5214a  ! 156: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e5e18c  ! 157: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a06e  ! 158: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbe84a027  ! 160: ADDcc_I	addcc 	%r18, 0x0027, %r31
	.word 0xbfe4e018  ! 164: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbf510000  ! 165: RDPR_TICK	<illegal instruction>
	setx	0x778e2aa900000c18, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e42182  ! 168: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5504000  ! 170: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4a02b  ! 175: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbf518000  ! 177: RDPR_PSTATE	<illegal instruction>
	.word 0xbde420a6  ! 178: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4210e  ! 180: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e42176  ! 183: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb6b561cc  ! 185: ORNcc_I	orncc 	%r21, 0x01cc, %r27
	.word 0xbf3c0000  ! 186: SRA_R	sra 	%r16, %r0, %r31
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xb9e52034  ! 198: SAVE_I	save	%r20, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 200: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe4e0c3  ! 201: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5a1e6  ! 205: SAVE_I	save	%r22, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 206: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde52134  ! 209: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e52047  ! 210: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421d1  ! 216: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x9195a0f4  ! 218: WRPR_PIL_I	wrpr	%r22, 0x00f4, %pil
	setx	data_start_7, %g1, %r18
	setx	0xddeed0e00002c8d, %g1, %r10
	.word 0x819a8000  ! 221: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a1e8  ! 222: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56098  ! 230: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e07f  ! 236: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe461f5  ! 237: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5a0fa  ! 238: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a065  ! 241: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3510000  ! 245: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xbbe4203c  ! 248: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8595e11a  ! 249: WRPR_TSTATE_I	wrpr	%r23, 0x011a, %tstate
	.word 0xb9e46059  ! 250: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe56027  ! 251: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe560b8  ! 255: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e180  ! 256: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb044c000  ! 265: ADDC_R	addc 	%r19, %r0, %r24
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a1c7  ! 271: WRPR_TT_I	wrpr	%r22, 0x01c7, %tt
	.word 0xb7e4a099  ! 272: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc350000  ! 282: ORN_R	orn 	%r20, %r0, %r30
	.word 0x85952178  ! 287: WRPR_TSTATE_I	wrpr	%r20, 0x0178, %tstate
	.word 0xb5e4a19d  ! 288: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba144000  ! 291: OR_R	or 	%r17, %r0, %r29
	.word 0xbfe5e0e3  ! 292: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8d94618c  ! 295: WRPR_PSTATE_I	wrpr	%r17, 0x018c, %pstate
	.word 0xb9e521cd  ! 297: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4e1c9  ! 298: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e111  ! 305: SAVE_I	save	%r19, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 306: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e5a143  ! 307: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb73c1000  ! 313: SRAX_R	srax	%r16, %r0, %r27
	.word 0x8d9421bd  ! 317: WRPR_PSTATE_I	wrpr	%r16, 0x01bd, %pstate
	.word 0xb1e461b0  ! 321: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbe9460a0  ! 322: ORcc_I	orcc 	%r17, 0x00a0, %r31
	.word 0xb9e4e097  ! 328: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4a054  ! 330: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4e0e5  ! 331: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe460a5  ! 332: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461dd  ! 334: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5540000  ! 335: RDPR_GL	<illegal instruction>
	.word 0xb5e561ed  ! 339: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e420c3  ! 343: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4e158  ! 345: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xb9510000  ! 347: RDPR_TICK	<illegal instruction>
	setx	0x96502e3600006c8e, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195605e  ! 350: WRPR_TPC_I	wrpr	%r21, 0x005e, %tpc
	.word 0xbfe4e1c9  ! 352: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x879461ee  ! 357: WRPR_TT_I	wrpr	%r17, 0x01ee, %tt
	.word 0x9195206c  ! 361: WRPR_PIL_I	wrpr	%r20, 0x006c, %pil
	.word 0xb3508000  ! 367: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4e18c  ! 370: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 375: RDPR_GL	<illegal instruction>
	.word 0xb7e5207e  ! 376: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbb540000  ! 383: RDPR_GL	<illegal instruction>
	.word 0xb9e4a075  ! 387: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe521d0  ! 388: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e420e6  ! 390: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e461df  ! 392: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e52071  ! 393: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d9521a9  ! 395: WRPR_PSTATE_I	wrpr	%r20, 0x01a9, %pstate
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0xb5e560d9  ! 404: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x9195e0a5  ! 410: WRPR_PIL_I	wrpr	%r23, 0x00a5, %pil
	.word 0xb60cc000  ! 411: AND_R	and 	%r19, %r0, %r27
	.word 0xbfe521b5  ! 412: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x82e154470000ef56, %g1, %r10
	.word 0x839a8000  ! 413: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde561eb  ! 416: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4e025  ! 420: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5e060  ! 423: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e4e102  ! 424: SAVE_I	save	%r19, 0x0001, %r27
	mov	1, %r12
	.word 0xa1930000  ! 426: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb32db001  ! 427: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xb350c000  ! 435: RDPR_TT	<illegal instruction>
	.word 0xb5e4e0e0  ! 436: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4612f  ! 442: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4a002  ! 445: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e5a08f  ! 447: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 454: RDPR_TICK	<illegal instruction>
	.word 0x8d94e032  ! 455: WRPR_PSTATE_I	wrpr	%r19, 0x0032, %pstate
	.word 0xb1e4e098  ! 458: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb534f001  ! 459: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb09520f1  ! 461: ORcc_I	orcc 	%r20, 0x00f1, %r24
	.word 0xb5e4e1ee  ! 462: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5e090  ! 464: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e460fb  ! 468: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7540000  ! 470: RDPR_GL	<illegal instruction>
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5e155  ! 477: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_7, %g1, %r20
	.word 0xb9e4a03a  ! 480: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5e0e5  ! 481: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb0042039  ! 484: ADD_I	add 	%r16, 0x0039, %r24
	.word 0xb3e46036  ! 485: SAVE_I	save	%r17, 0x0001, %r25
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0fc  ! 491: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4a137  ! 493: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9520000  ! 495: RDPR_PIL	<illegal instruction>
	.word 0xbde56009  ! 496: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde5e0cb  ! 499: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e5e1b7  ! 501: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8995619b  ! 503: WRPR_TICK_I	wrpr	%r21, 0x019b, %tick
	.word 0xb1e461cb  ! 506: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e52031  ! 507: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xba9c0000  ! 508: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xb8158000  ! 510: OR_R	or 	%r22, %r0, %r28
	.word 0xb7510000  ! 514: RDPR_TICK	<illegal instruction>
	.word 0xbde5e12a  ! 515: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x4af2847d00007b85, %g1, %r10
	.word 0x839a8000  ! 518: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d94a051  ! 522: WRPR_PSTATE_I	wrpr	%r18, 0x0051, %pstate
	.word 0xb9e4e047  ! 523: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e52176  ! 525: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_5, %g1, %r18
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46063  ! 530: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb4844000  ! 531: ADDcc_R	addcc 	%r17, %r0, %r26
	setx	0x90fdbfe400001808, %g1, %r10
	.word 0x819a8000  ! 532: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4e1be  ! 533: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8394e1f9  ! 535: WRPR_TNPC_I	wrpr	%r19, 0x01f9, %tnpc
	.word 0xb12ce001  ! 541: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xb7e46061  ! 548: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e11b  ! 551: SAVE_I	save	%r23, 0x0001, %r31
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0d1  ! 555: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4215f  ! 562: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbf518000  ! 563: RDPR_PSTATE	<illegal instruction>
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e02c  ! 573: WRPR_TT_I	wrpr	%r19, 0x002c, %tt
	.word 0x8795e133  ! 575: WRPR_TT_I	wrpr	%r23, 0x0133, %tt
	.word 0xb5e5e001  ! 576: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e46167  ! 583: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e560c5  ! 586: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5600e  ! 591: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x73229a33000048c5, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e4a01f  ! 594: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe56172  ! 595: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf510000  ! 600: RDPR_TICK	<illegal instruction>
	.word 0xb9e56170  ! 602: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x85946047  ! 604: WRPR_TSTATE_I	wrpr	%r17, 0x0047, %tstate
	.word 0xb9e460d5  ! 605: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8194614b  ! 607: WRPR_TPC_I	wrpr	%r17, 0x014b, %tpc
	.word 0xbe3de049  ! 608: XNOR_I	xnor 	%r23, 0x0049, %r31
	.word 0xb7e56187  ! 610: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1f4  ! 615: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb77de401  ! 619: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb7e560d6  ! 620: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1520000  ! 621: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba8da053  ! 626: ANDcc_I	andcc 	%r22, 0x0053, %r29
	.word 0xb7e4a1ba  ! 628: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf510000  ! 630: RDPR_TICK	<illegal instruction>
	.word 0xbbe520c2  ! 631: SAVE_I	save	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 634: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb3c0000  ! 638: SRA_R	sra 	%r16, %r0, %r29
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a084  ! 641: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8595a0f2  ! 643: WRPR_TSTATE_I	wrpr	%r22, 0x00f2, %tstate
	.word 0xb7e4a14c  ! 653: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5205a  ! 655: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_7, %g1, %r23
	.word 0xb3e42016  ! 662: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5a1a2  ! 664: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8595e0d3  ! 665: WRPR_TSTATE_I	wrpr	%r23, 0x00d3, %tstate
	.word 0xb73d7001  ! 667: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0x91942167  ! 669: WRPR_PIL_I	wrpr	%r16, 0x0167, %pil
	.word 0xbb2d6001  ! 671: SLL_I	sll 	%r21, 0x0001, %r29
	setx	0x510b956b00006895, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc950000  ! 674: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0x8d95e077  ! 677: WRPR_PSTATE_I	wrpr	%r23, 0x0077, %pstate
	.word 0x8194a0ef  ! 678: WRPR_TPC_I	wrpr	%r18, 0x00ef, %tpc
	.word 0xb5e42074  ! 684: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0bb  ! 689: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9508000  ! 692: RDPR_TSTATE	<illegal instruction>
	.word 0x899461c9  ! 693: WRPR_TICK_I	wrpr	%r17, 0x01c9, %tick
	.word 0xb08dc000  ! 696: ANDcc_R	andcc 	%r23, %r0, %r24
	.word 0xb1e4a04b  ! 697: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4e126  ! 698: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e46145  ! 699: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5612c  ! 700: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb6b40000  ! 701: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb5e4201f  ! 705: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_3, %g1, %r17
	.word 0xbbe42134  ! 709: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_5, %g1, %r18
	.word 0x9195e0a3  ! 724: WRPR_PIL_I	wrpr	%r23, 0x00a3, %pil
	setx	0xc48c434700007b57, %g1, %r10
	.word 0x839a8000  ! 726: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd50c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0xb7e56079  ! 733: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e4e19f  ! 734: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e52100  ! 739: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a040  ! 742: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e4a03e  ! 745: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9520000  ! 746: RDPR_PIL	<illegal instruction>
	.word 0xb1e5a1a5  ! 747: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe440000  ! 751: ADDC_R	addc 	%r16, %r0, %r31
	setx	data_start_2, %g1, %r23
	.word 0xbde46004  ! 753: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbb50c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xbc148000  ! 762: OR_R	or 	%r18, %r0, %r30
	.word 0xb7e4e13e  ! 763: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e4a14d  ! 766: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5a0e1  ! 767: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e561d0  ! 770: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d946036  ! 776: WRPR_PSTATE_I	wrpr	%r17, 0x0036, %pstate
	setx	data_start_6, %g1, %r20
	.word 0xb3500000  ! 778: RDPR_TPC	<illegal instruction>
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0ad  ! 785: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5a154  ! 786: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e081  ! 787: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5e0e6  ! 789: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd540000  ! 793: RDPR_GL	<illegal instruction>
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e170  ! 797: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a01d  ! 801: WRPR_TNPC_I	wrpr	%r22, 0x001d, %tnpc
	.word 0xbf500000  ! 804: RDPR_TPC	<illegal instruction>
	.word 0xbde5e062  ! 810: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8795216b  ! 812: WRPR_TT_I	wrpr	%r20, 0x016b, %tt
	.word 0xb9e5e14c  ! 814: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4a048  ! 816: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe561a9  ! 817: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x87952131  ! 818: WRPR_TT_I	wrpr	%r20, 0x0131, %tt
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e082  ! 823: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5e1b6  ! 826: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbc24c000  ! 833: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb224a06a  ! 836: SUB_I	sub 	%r18, 0x006a, %r25
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0bf  ! 842: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1480000  ! 845: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e52097  ! 848: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5e174  ! 850: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb643801  ! 853: MOVcc_I	<illegal instruction>
	.word 0xbbe4a101  ! 855: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1352001  ! 856: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xb1e561f0  ! 859: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d94a0c0  ! 861: WRPR_PSTATE_I	wrpr	%r18, 0x00c0, %pstate
	.word 0x8194e049  ! 862: WRPR_TPC_I	wrpr	%r19, 0x0049, %tpc
	.word 0xb3e56135  ! 863: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e14f  ! 865: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e521c4  ! 871: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbabd8000  ! 872: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xbfe42065  ! 873: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbde52076  ! 877: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e4a133  ! 879: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4611e  ! 882: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e521dc  ! 888: SAVE_I	save	%r20, 0x0001, %r28
	mov	2, %r12
	.word 0x8f930000  ! 892: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e460c4  ! 893: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4608b  ! 894: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e5a00f  ! 895: SAVE_I	save	%r22, 0x0001, %r27
	setx	0xc1429f760000ee5d, %g1, %r10
	.word 0x839a8000  ! 898: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf540000  ! 903: RDPR_GL	<illegal instruction>
	.word 0xbcb4202f  ! 907: ORNcc_I	orncc 	%r16, 0x002f, %r30
	.word 0x81952003  ! 908: WRPR_TPC_I	wrpr	%r20, 0x0003, %tpc
	.word 0xb33c5000  ! 909: SRAX_R	srax	%r17, %r0, %r25
	setx	0x37a4c4d70000f9ca, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb6b4a10a  ! 915: ORNcc_I	orncc 	%r18, 0x010a, %r27
	.word 0xb750c000  ! 920: RDPR_TT	<illegal instruction>
	.word 0xb7e4a159  ! 923: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8595a19f  ! 925: WRPR_TSTATE_I	wrpr	%r22, 0x019f, %tstate
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5606e  ! 934: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde4e063  ! 937: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e4a0aa  ! 938: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4a07e  ! 940: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4a1ee  ! 943: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe52130  ! 944: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbd540000  ! 945: RDPR_GL	<illegal instruction>
	.word 0xb9e4e1d3  ! 946: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e421b7  ! 947: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5e013  ! 953: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5a1c6  ! 954: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e52097  ! 957: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde56150  ! 959: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4e077  ! 963: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb8b58000  ! 965: SUBCcc_R	orncc 	%r22, %r0, %r28
	.word 0xbf508000  ! 966: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5e0a1  ! 968: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb540000  ! 972: RDPR_GL	<illegal instruction>
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5204c  ! 976: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xba34a031  ! 977: ORN_I	orn 	%r18, 0x0031, %r29
	.word 0xbd504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5a0a5  ! 980: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e42057  ! 982: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4211c  ! 986: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4a1f1  ! 989: SAVE_I	save	%r18, 0x0001, %r26
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
	.word 0x8395a078  ! 5: WRPR_TNPC_I	wrpr	%r22, 0x0078, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	2, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf02cc000  ! 16: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb894605c  ! 19: ORcc_I	orcc 	%r17, 0x005c, %r28
	.word 0xf43d4000  ! 25: STD_R	std	%r26, [%r21 + %r0]
	.word 0xb17ce401  ! 27: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xf63c6110  ! 30: STD_I	std	%r27, [%r17 + 0x0110]
	.word 0xf33d20ff  ! 32: STDF_I	std	%f25, [0x00ff, %r20]
	setx	data_start_4, %g1, %r23
	.word 0xf22420ec  ! 35: STW_I	stw	%r25, [%r16 + 0x00ec]
	.word 0xfc744000  ! 38: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xbd7d8400  ! 39: MOVR_R	movre	%r22, %r0, %r30
	.word 0xf835c000  ! 42: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfd3c0000  ! 50: STDF_R	std	%f30, [%r0, %r16]
	.word 0x8d94a1bd  ! 51: WRPR_PSTATE_I	wrpr	%r18, 0x01bd, %pstate
	.word 0xbe058000  ! 52: ADD_R	add 	%r22, %r0, %r31
	.word 0xb69d8000  ! 53: XORcc_R	xorcc 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb93c7001  ! 56: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xf43c8000  ! 58: STD_R	std	%r26, [%r18 + %r0]
	setx	data_start_2, %g1, %r17
	.word 0xfd3dc000  ! 66: STDF_R	std	%f30, [%r0, %r23]
	.word 0xbd508000  ! 69: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb6bc8000  ! 70: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xf2248000  ! 72: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb6c5a0a8  ! 73: ADDCcc_I	addccc 	%r22, 0x00a8, %r27
	.word 0xb350c000  ! 75: RDPR_TT	<illegal instruction>
	setx	0xd00309700000398d, %g1, %r10
	.word 0x819a8000  ! 78: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfd3c61e6  ! 80: STDF_I	std	%f30, [0x01e6, %r17]
	setx	data_start_7, %g1, %r21
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435c000  ! 88: STH_R	sth	%r26, [%r23 + %r0]
	setx	data_start_5, %g1, %r16
	mov	1, %r12
	.word 0x8f930000  ! 90: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53d8000  ! 92: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfc3c4000  ! 97: STD_R	std	%r30, [%r17 + %r0]
	.word 0xb1480000  ! 103: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3508000  ! 104: RDPR_TSTATE	<illegal instruction>
	.word 0xf87520d0  ! 108: STX_I	stx	%r28, [%r20 + 0x00d0]
	.word 0xfe3de100  ! 109: STD_I	std	%r31, [%r23 + 0x0100]
	.word 0xf02560b8  ! 111: STW_I	stw	%r24, [%r21 + 0x00b8]
	setx	data_start_3, %g1, %r19
	.word 0xfe256192  ! 115: STW_I	stw	%r31, [%r21 + 0x0192]
	.word 0xf224a02f  ! 116: STW_I	stw	%r25, [%r18 + 0x002f]
	.word 0xf53d4000  ! 117: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf4758000  ! 121: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfe2561f3  ! 125: STW_I	stw	%r31, [%r21 + 0x01f3]
	.word 0xf2256085  ! 129: STW_I	stw	%r25, [%r21 + 0x0085]
	.word 0xb951c000  ! 130: RDPR_TL	<illegal instruction>
	.word 0xf83d0000  ! 132: STD_R	std	%r28, [%r20 + %r0]
	.word 0x85946187  ! 133: WRPR_TSTATE_I	wrpr	%r17, 0x0187, %tstate
	setx	data_start_6, %g1, %r19
	.word 0xf33da1ca  ! 135: STDF_I	std	%f25, [0x01ca, %r22]
	.word 0xf2358000  ! 136: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xb68da079  ! 144: ANDcc_I	andcc 	%r22, 0x0079, %r27
	.word 0xf6748000  ! 146: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xfd3de11b  ! 148: STDF_I	std	%f30, [0x011b, %r23]
	.word 0xbab4a0a9  ! 149: ORNcc_I	orncc 	%r18, 0x00a9, %r29
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 151: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x919461db  ! 152: WRPR_PIL_I	wrpr	%r17, 0x01db, %pil
	.word 0xfc24e1e2  ! 153: STW_I	stw	%r30, [%r19 + 0x01e2]
	.word 0x899461fe  ! 154: WRPR_TICK_I	wrpr	%r17, 0x01fe, %tick
	.word 0xb4856199  ! 160: ADDcc_I	addcc 	%r21, 0x0199, %r26
	.word 0xfe748000  ! 161: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf43c61ef  ! 162: STD_I	std	%r26, [%r17 + 0x01ef]
	.word 0xb3510000  ! 165: RDPR_TICK	rdpr	%tick, %r25
	setx	0xda4da8d600001b07, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf674e1fa  ! 169: STX_I	stx	%r27, [%r19 + 0x01fa]
	.word 0xb1504000  ! 170: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb9508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xf475e053  ! 173: STX_I	stx	%r26, [%r23 + 0x0053]
	.word 0xb5518000  ! 177: RDPR_PSTATE	<illegal instruction>
	.word 0xfe2de0f4  ! 181: STB_I	stb	%r31, [%r23 + 0x00f4]
	.word 0xb6b5e014  ! 185: ORNcc_I	orncc 	%r23, 0x0014, %r27
	.word 0xb73d8000  ! 186: SRA_R	sra 	%r22, %r0, %r27
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	mov	0, %r12
	.word 0xa1930000  ! 200: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf33d8000  ! 202: STDF_R	std	%f25, [%r0, %r22]
	mov	1, %r12
	.word 0x8f930000  ! 206: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa2de078  ! 211: STB_I	stb	%r29, [%r23 + 0x0078]
	.word 0xf82c0000  ! 214: STB_R	stb	%r28, [%r16 + %r0]
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946116  ! 218: WRPR_PIL_I	wrpr	%r17, 0x0116, %pil
	setx	data_start_2, %g1, %r17
	setx	0x979cacb600004adc, %g1, %r10
	.word 0x819a8000  ! 221: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6244000  ! 226: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfe3c4000  ! 228: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf83cc000  ! 229: STD_R	std	%r28, [%r19 + %r0]
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3c0000  ! 234: STDF_R	std	%f31, [%r0, %r16]
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3ce032  ! 242: STD_I	std	%r31, [%r19 + 0x0032]
	.word 0xbf510000  ! 245: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf0244000  ! 246: STW_R	stw	%r24, [%r17 + %r0]
	setx	data_start_1, %g1, %r16
	.word 0x85942118  ! 249: WRPR_TSTATE_I	wrpr	%r16, 0x0118, %tstate
	.word 0xff3ce17c  ! 252: STDF_I	std	%f31, [0x017c, %r19]
	.word 0xf275c000  ! 257: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfe2ca0e8  ! 260: STB_I	stb	%r31, [%r18 + 0x00e8]
	.word 0xf624c000  ! 261: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf8752194  ! 262: STX_I	stx	%r28, [%r20 + 0x0194]
	.word 0xf2258000  ! 263: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf93c20e0  ! 264: STDF_I	std	%f28, [0x00e0, %r16]
	.word 0xb6454000  ! 265: ADDC_R	addc 	%r21, %r0, %r27
	.word 0xf6748000  ! 266: STX_R	stx	%r27, [%r18 + %r0]
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e0a5  ! 271: WRPR_TT_I	wrpr	%r23, 0x00a5, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc342006  ! 279: STH_I	sth	%r30, [%r16 + 0x0006]
	.word 0xfe248000  ! 280: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xb235c000  ! 282: ORN_R	orn 	%r23, %r0, %r25
	.word 0xf275c000  ! 286: STX_R	stx	%r25, [%r23 + %r0]
	.word 0x8594e027  ! 287: WRPR_TSTATE_I	wrpr	%r19, 0x0027, %tstate
	.word 0xf2244000  ! 289: STW_R	stw	%r25, [%r17 + %r0]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6154000  ! 291: OR_R	or 	%r21, %r0, %r27
	.word 0xf02c0000  ! 294: STB_R	stb	%r24, [%r16 + %r0]
	.word 0x8d95a097  ! 295: WRPR_PSTATE_I	wrpr	%r22, 0x0097, %pstate
	.word 0xf435608c  ! 296: STH_I	sth	%r26, [%r21 + 0x008c]
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 302: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf275e0e3  ! 303: STX_I	stx	%r25, [%r23 + 0x00e3]
	mov	1, %r12
	.word 0xa1930000  ! 306: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc2c4000  ! 308: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf43cc000  ! 311: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf825201e  ! 312: STW_I	stw	%r28, [%r20 + 0x001e]
	.word 0xb73d1000  ! 313: SRAX_R	srax	%r20, %r0, %r27
	.word 0xfe244000  ! 315: STW_R	stw	%r31, [%r17 + %r0]
	.word 0x8d95a172  ! 317: WRPR_PSTATE_I	wrpr	%r22, 0x0172, %pstate
	.word 0xf43d4000  ! 320: STD_R	std	%r26, [%r21 + %r0]
	.word 0xb094e15f  ! 322: ORcc_I	orcc 	%r19, 0x015f, %r24
	.word 0xf02c0000  ! 323: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf82d4000  ! 326: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf23d6047  ! 327: STD_I	std	%r25, [%r21 + 0x0047]
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 335: RDPR_GL	rdpr	%-, %r29
	.word 0xfa25217a  ! 337: STW_I	stw	%r29, [%r20 + 0x017a]
	.word 0xf82da021  ! 338: STB_I	stb	%r28, [%r22 + 0x0021]
	.word 0xfe7461fb  ! 342: STX_I	stx	%r31, [%r17 + 0x01fb]
	.word 0xfc2ce1b4  ! 344: STB_I	stb	%r30, [%r19 + 0x01b4]
	.word 0xb1504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xb1510000  ! 347: RDPR_TICK	<illegal instruction>
	setx	0x85fc2d1a0000ac53, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8194a042  ! 350: WRPR_TPC_I	wrpr	%r18, 0x0042, %tpc
	.word 0xf874e10c  ! 353: STX_I	stx	%r28, [%r19 + 0x010c]
	.word 0xfe2c4000  ! 354: STB_R	stb	%r31, [%r17 + %r0]
	.word 0x8794206d  ! 357: WRPR_TT_I	wrpr	%r16, 0x006d, %tt
	.word 0xf27560f7  ! 358: STX_I	stx	%r25, [%r21 + 0x00f7]
	.word 0xf225606c  ! 360: STW_I	stw	%r25, [%r21 + 0x006c]
	.word 0x9194a042  ! 361: WRPR_PIL_I	wrpr	%r18, 0x0042, %pil
	.word 0xf93d60ff  ! 365: STDF_I	std	%f28, [0x00ff, %r21]
	.word 0xfe258000  ! 366: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xbb508000  ! 367: RDPR_TSTATE	rdpr	%tstate, %r29
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 375: RDPR_GL	<illegal instruction>
	.word 0xf23cc000  ! 381: STD_R	std	%r25, [%r19 + %r0]
	.word 0xbf540000  ! 383: RDPR_GL	<illegal instruction>
	.word 0xf435600a  ! 384: STH_I	sth	%r26, [%r21 + 0x000a]
	.word 0xfc74e10a  ! 385: STX_I	stx	%r30, [%r19 + 0x010a]
	.word 0xf4340000  ! 386: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xff3ca02c  ! 389: STDF_I	std	%f31, [0x002c, %r18]
	.word 0x8d956167  ! 395: WRPR_PSTATE_I	wrpr	%r21, 0x0167, %pstate
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 399: RDPR_TT	rdpr	%tt, %r25
	.word 0xf235614a  ! 402: STH_I	sth	%r25, [%r21 + 0x014a]
	.word 0xf73de05d  ! 403: STDF_I	std	%f27, [0x005d, %r23]
	.word 0xf23c0000  ! 407: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf82c8000  ! 409: STB_R	stb	%r28, [%r18 + %r0]
	.word 0x9195a17b  ! 410: WRPR_PIL_I	wrpr	%r22, 0x017b, %pil
	.word 0xb20d8000  ! 411: AND_R	and 	%r22, %r0, %r25
	setx	0x90623a300006945, %g1, %r10
	.word 0x839a8000  ! 413: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa35a0bc  ! 414: STH_I	sth	%r29, [%r22 + 0x00bc]
	mov	1, %r12
	.word 0xa1930000  ! 426: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb2c7001  ! 427: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xfb3de1e0  ! 433: STDF_I	std	%f29, [0x01e0, %r23]
	.word 0xb150c000  ! 435: RDPR_TT	rdpr	%tt, %r24
	.word 0xf834e0d7  ! 438: STH_I	sth	%r28, [%r19 + 0x00d7]
	.word 0xfe74a19c  ! 439: STX_I	stx	%r31, [%r18 + 0x019c]
	.word 0xf82c21ea  ! 440: STB_I	stb	%r28, [%r16 + 0x01ea]
	.word 0xfc3d61a5  ! 448: STD_I	std	%r30, [%r21 + 0x01a5]
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 454: RDPR_TICK	<illegal instruction>
	.word 0x8d9461f7  ! 455: WRPR_PSTATE_I	wrpr	%r17, 0x01f7, %pstate
	.word 0xfa3d8000  ! 456: STD_R	std	%r29, [%r22 + %r0]
	.word 0xb7347001  ! 459: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xfc3d6021  ! 460: STD_I	std	%r30, [%r21 + 0x0021]
	.word 0xbe952073  ! 461: ORcc_I	orcc 	%r20, 0x0073, %r31
	.word 0xfe750000  ! 466: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfc2d2069  ! 467: STB_I	stb	%r30, [%r20 + 0x0069]
	.word 0xb3540000  ! 470: RDPR_GL	rdpr	%-, %r25
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875607f  ! 474: STX_I	stx	%r28, [%r21 + 0x007f]
	.word 0xbb518000  ! 475: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xb20460ba  ! 484: ADD_I	add 	%r17, 0x00ba, %r25
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 495: RDPR_PIL	<illegal instruction>
	.word 0x89946141  ! 503: WRPR_TICK_I	wrpr	%r17, 0x0141, %tick
	.word 0xb09c4000  ! 508: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xb214c000  ! 510: OR_R	or 	%r19, %r0, %r25
	.word 0xf874601f  ! 511: STX_I	stx	%r28, [%r17 + 0x001f]
	.word 0xb7510000  ! 514: RDPR_TICK	rdpr	%tick, %r27
	setx	0xb658287e00005b95, %g1, %r10
	.word 0x839a8000  ! 518: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf62d2001  ! 519: STB_I	stb	%r27, [%r20 + 0x0001]
	.word 0x8d95a1e8  ! 522: WRPR_PSTATE_I	wrpr	%r22, 0x01e8, %pstate
	setx	data_start_1, %g1, %r17
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33de139  ! 529: STDF_I	std	%f25, [0x0139, %r23]
	.word 0xbc850000  ! 531: ADDcc_R	addcc 	%r20, %r0, %r30
	setx	0x209d84db00004b93, %g1, %r10
	.word 0x819a8000  ! 532: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x83946077  ! 535: WRPR_TNPC_I	wrpr	%r17, 0x0077, %tnpc
	.word 0xf93c4000  ! 537: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf434e027  ! 538: STH_I	sth	%r26, [%r19 + 0x0027]
	.word 0xb72d2001  ! 541: SLL_I	sll 	%r20, 0x0001, %r27
	.word 0xfd3ce0c5  ! 545: STDF_I	std	%f30, [0x00c5, %r19]
	.word 0xfc35a152  ! 549: STH_I	sth	%r30, [%r22 + 0x0152]
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53d8000  ! 553: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfa344000  ! 558: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfe742111  ! 559: STX_I	stx	%r31, [%r16 + 0x0111]
	.word 0xb7518000  ! 563: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf82ca18d  ! 564: STB_I	stb	%r28, [%r18 + 0x018d]
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25e1b9  ! 572: STW_I	stw	%r29, [%r23 + 0x01b9]
	.word 0x8794e115  ! 573: WRPR_TT_I	wrpr	%r19, 0x0115, %tt
	.word 0xfa2de069  ! 574: STB_I	stb	%r29, [%r23 + 0x0069]
	.word 0x8794e1ee  ! 575: WRPR_TT_I	wrpr	%r19, 0x01ee, %tt
	.word 0xf83c6151  ! 577: STD_I	std	%r28, [%r17 + 0x0151]
	.word 0xfa2c8000  ! 579: STB_R	stb	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82d8000  ! 587: STB_R	stb	%r28, [%r22 + %r0]
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 590: STX_R	stx	%r24, [%r16 + %r0]
	setx	0xaf057b7600007c57, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7510000  ! 600: RDPR_TICK	rdpr	%tick, %r27
	.word 0x85956127  ! 604: WRPR_TSTATE_I	wrpr	%r21, 0x0127, %tstate
	.word 0xf82c4000  ! 606: STB_R	stb	%r28, [%r17 + %r0]
	.word 0x819521c0  ! 607: WRPR_TPC_I	wrpr	%r20, 0x01c0, %tpc
	.word 0xbc3d614c  ! 608: XNOR_I	xnor 	%r21, 0x014c, %r30
	.word 0xf2344000  ! 609: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf034a155  ! 612: STH_I	sth	%r24, [%r18 + 0x0155]
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 614: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfb3c8000  ! 618: STDF_R	std	%f29, [%r0, %r18]
	.word 0xb17de401  ! 619: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xbb520000  ! 621: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf33cc000  ! 623: STDF_R	std	%f25, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb48de0cb  ! 626: ANDcc_I	andcc 	%r23, 0x00cb, %r26
	.word 0xbd510000  ! 630: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 634: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf4258000  ! 635: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xb93dc000  ! 638: SRA_R	sra 	%r23, %r0, %r28
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a085  ! 643: WRPR_TSTATE_I	wrpr	%r22, 0x0085, %tstate
	.word 0xf43c0000  ! 647: STD_R	std	%r26, [%r16 + %r0]
	.word 0xfe24a1ad  ! 651: STW_I	stw	%r31, [%r18 + 0x01ad]
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83ca108  ! 659: STD_I	std	%r28, [%r18 + 0x0108]
	setx	data_start_1, %g1, %r20
	.word 0xf8254000  ! 663: STW_R	stw	%r28, [%r21 + %r0]
	.word 0x8594e04c  ! 665: WRPR_TSTATE_I	wrpr	%r19, 0x004c, %tstate
	.word 0xf43461f6  ! 666: STH_I	sth	%r26, [%r17 + 0x01f6]
	.word 0xbb3c7001  ! 667: SRAX_I	srax	%r17, 0x0001, %r29
	.word 0x91946082  ! 669: WRPR_PIL_I	wrpr	%r17, 0x0082, %pil
	.word 0xbf2da001  ! 671: SLL_I	sll 	%r22, 0x0001, %r31
	setx	0xac20b4010000b8ce, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba950000  ! 674: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0x8d9560f2  ! 677: WRPR_PSTATE_I	wrpr	%r21, 0x00f2, %pstate
	.word 0x81952196  ! 678: WRPR_TPC_I	wrpr	%r20, 0x0196, %tpc
	.word 0xfc74e148  ! 685: STX_I	stx	%r30, [%r19 + 0x0148]
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 692: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x8994200c  ! 693: WRPR_TICK_I	wrpr	%r16, 0x000c, %tick
	.word 0xf8748000  ! 694: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xbe8cc000  ! 696: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xbeb4c000  ! 701: ORNcc_R	orncc 	%r19, %r0, %r31
	.word 0xf434e1ef  ! 702: STH_I	sth	%r26, [%r19 + 0x01ef]
	setx	data_start_6, %g1, %r16
	.word 0xf63dc000  ! 707: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfc250000  ! 710: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf42c0000  ! 712: STB_R	stb	%r26, [%r16 + %r0]
	setx	data_start_7, %g1, %r17
	.word 0xfe344000  ! 714: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfe3ce058  ! 722: STD_I	std	%r31, [%r19 + 0x0058]
	.word 0x91952181  ! 724: WRPR_PIL_I	wrpr	%r20, 0x0181, %pil
	.word 0xf63c0000  ! 725: STD_R	std	%r27, [%r16 + %r0]
	setx	0x957377990000b85d, %g1, %r10
	.word 0x839a8000  ! 726: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf93cc000  ! 727: STDF_R	std	%f28, [%r0, %r19]
	.word 0xbf50c000  ! 728: RDPR_TT	rdpr	%tt, %r31
	.word 0xfa35c000  ! 730: STH_R	sth	%r29, [%r23 + %r0]
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 744: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb9520000  ! 746: RDPR_PIL	<illegal instruction>
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc444000  ! 751: ADDC_R	addc 	%r17, %r0, %r30
	setx	data_start_6, %g1, %r22
	.word 0xb3480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf22d60fb  ! 756: STB_I	stb	%r25, [%r21 + 0x00fb]
	.word 0xf0756051  ! 757: STX_I	stx	%r24, [%r21 + 0x0051]
	.word 0xb950c000  ! 758: RDPR_TT	rdpr	%tt, %r28
	.word 0xb6154000  ! 762: OR_R	or 	%r21, %r0, %r27
	.word 0xf635c000  ! 771: STH_R	sth	%r27, [%r23 + %r0]
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95600c  ! 776: WRPR_PSTATE_I	wrpr	%r21, 0x000c, %pstate
	setx	data_start_5, %g1, %r23
	.word 0xb9500000  ! 778: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfc3c201d  ! 781: STD_I	std	%r30, [%r16 + 0x001d]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc7461d6  ! 783: STX_I	stx	%r30, [%r17 + 0x01d6]
	.word 0xfc750000  ! 784: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf43d8000  ! 788: STD_R	std	%r26, [%r22 + %r0]
	.word 0xbd540000  ! 793: RDPR_GL	<illegal instruction>
	.word 0xf2250000  ! 794: STW_R	stw	%r25, [%r20 + %r0]
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a12d  ! 801: WRPR_TNPC_I	wrpr	%r18, 0x012d, %tnpc
	.word 0xb9500000  ! 804: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfc35c000  ! 807: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf42cc000  ! 808: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfd3d4000  ! 811: STDF_R	std	%f30, [%r0, %r21]
	.word 0x879561ed  ! 812: WRPR_TT_I	wrpr	%r21, 0x01ed, %tt
	.word 0x8794a12c  ! 818: WRPR_TT_I	wrpr	%r18, 0x012c, %tt
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63ce02c  ! 825: STD_I	std	%r27, [%r19 + 0x002c]
	.word 0xf4746009  ! 829: STX_I	stx	%r26, [%r17 + 0x0009]
	.word 0xfe3dc000  ! 832: STD_R	std	%r31, [%r23 + %r0]
	.word 0xbc254000  ! 833: SUB_R	sub 	%r21, %r0, %r30
	.word 0xfc740000  ! 834: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf424e18b  ! 835: STW_I	stw	%r26, [%r19 + 0x018b]
	.word 0xb425e121  ! 836: SUB_I	sub 	%r23, 0x0121, %r26
	.word 0xfa248000  ! 838: STW_R	stw	%r29, [%r18 + %r0]
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ce038  ! 841: STB_I	stb	%r28, [%r19 + 0x0038]
	.word 0xf42ca1bd  ! 843: STB_I	stb	%r26, [%r18 + 0x01bd]
	.word 0xf034c000  ! 844: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xbf480000  ! 845: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	2, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7643801  ! 853: MOVcc_I	<illegal instruction>
	.word 0xf075205c  ! 854: STX_I	stx	%r24, [%r20 + 0x005c]
	.word 0xb3342001  ! 856: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xff3d202d  ! 857: STDF_I	std	%f31, [0x002d, %r20]
	.word 0xf73d0000  ! 858: STDF_R	std	%f27, [%r0, %r20]
	.word 0x8d9460d4  ! 861: WRPR_PSTATE_I	wrpr	%r17, 0x00d4, %pstate
	.word 0x819461c8  ! 862: WRPR_TPC_I	wrpr	%r17, 0x01c8, %tpc
	.word 0xfc74a088  ! 867: STX_I	stx	%r30, [%r18 + 0x0088]
	.word 0xbb480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf33de1a0  ! 870: STDF_I	std	%f25, [0x01a0, %r23]
	.word 0xb6bc8000  ! 872: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xbf480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfe250000  ! 878: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfe254000  ! 880: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf13c8000  ! 881: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf83c8000  ! 883: STD_R	std	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe348000  ! 889: STH_R	sth	%r31, [%r18 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 892: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x45374e5a0000d848, %g1, %r10
	.word 0x839a8000  ! 898: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc3da1e8  ! 899: STD_I	std	%r30, [%r22 + 0x01e8]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3540000  ! 903: RDPR_GL	rdpr	%-, %r25
	.word 0xf82d0000  ! 904: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb0b4a10c  ! 907: ORNcc_I	orncc 	%r18, 0x010c, %r24
	.word 0x8195e184  ! 908: WRPR_TPC_I	wrpr	%r23, 0x0184, %tpc
	.word 0xb73c9000  ! 909: SRAX_R	srax	%r18, %r0, %r27
	setx	0xc20b49bc0000cbd6, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb0b4a107  ! 915: ORNcc_I	orncc 	%r18, 0x0107, %r24
	.word 0xf82de111  ! 916: STB_I	stb	%r28, [%r23 + 0x0111]
	.word 0xb950c000  ! 920: RDPR_TT	rdpr	%tt, %r28
	.word 0xfc2c0000  ! 924: STB_R	stb	%r30, [%r16 + %r0]
	.word 0x8595a169  ! 925: WRPR_TSTATE_I	wrpr	%r22, 0x0169, %tstate
	.word 0xfa3de1eb  ! 926: STD_I	std	%r29, [%r23 + 0x01eb]
	.word 0xfc25a1a5  ! 929: STW_I	stw	%r30, [%r22 + 0x01a5]
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35608d  ! 932: STH_I	sth	%r30, [%r21 + 0x008d]
	.word 0xf035e19b  ! 936: STH_I	sth	%r24, [%r23 + 0x019b]
	.word 0xb5540000  ! 945: RDPR_GL	rdpr	%-, %r26
	.word 0xf435c000  ! 948: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf4250000  ! 950: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xb9508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xf83da159  ! 960: STD_I	std	%r28, [%r22 + 0x0159]
	.word 0xb8b54000  ! 965: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xbb508000  ! 966: RDPR_TSTATE	<illegal instruction>
	.word 0xf075a13d  ! 967: STX_I	stx	%r24, [%r22 + 0x013d]
	.word 0xf03ce00f  ! 970: STD_I	std	%r24, [%r19 + 0x000f]
	.word 0xbb540000  ! 972: RDPR_GL	<illegal instruction>
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 974: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb035a002  ! 977: ORN_I	orn 	%r22, 0x0002, %r24
	.word 0xf224e012  ! 978: STW_I	stw	%r25, [%r19 + 0x0012]
	.word 0xb9504000  ! 979: RDPR_TNPC	<illegal instruction>
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35e094  ! 985: STH_I	sth	%r30, [%r23 + 0x0094]
	.word 0xf424a1ca  ! 987: STW_I	stw	%r26, [%r18 + 0x01ca]
	.word 0xfd3c4000  ! 993: STDF_R	std	%f30, [%r0, %r17]
	.word 0xf42c60d6  ! 994: STB_I	stb	%r26, [%r17 + 0x00d6]
	.word 0xff3ce16c  ! 997: STDF_I	std	%f31, [0x016c, %r19]
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
	.word 0x8394a1bc  ! 5: WRPR_TNPC_I	wrpr	%r18, 0x01bc, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe04605e  ! 8: LDUW_I	lduw	[%r17 + 0x005e], %r31
	.word 0xf6144000  ! 9: LDUH_R	lduh	[%r17 + %r0], %r27
	mov	1, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa0de0a7  ! 13: LDUB_I	ldub	[%r23 + 0x00a7], %r29
	.word 0xb4956071  ! 19: ORcc_I	orcc 	%r21, 0x0071, %r26
	.word 0xfd1c8000  ! 23: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xb77da401  ! 27: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xf4148000  ! 31: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfa1c0000  ! 33: LDD_R	ldd	[%r16 + %r0], %r29
	setx	data_start_2, %g1, %r16
	.word 0xb77cc400  ! 39: MOVR_R	movre	%r19, %r0, %r27
	.word 0xfc0d8000  ! 40: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xf604c000  ! 43: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xfe056158  ! 44: LDUW_I	lduw	[%r21 + 0x0158], %r31
	.word 0xf844c000  ! 46: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xfe0521ff  ! 47: LDUW_I	lduw	[%r20 + 0x01ff], %r31
	.word 0x8d94e1d0  ! 51: WRPR_PSTATE_I	wrpr	%r19, 0x01d0, %pstate
	.word 0xb0058000  ! 52: ADD_R	add 	%r22, %r0, %r24
	.word 0xbe9d0000  ! 53: XORcc_R	xorcc 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb93cf001  ! 56: SRAX_I	srax	%r19, 0x0001, %r28
	.word 0xf64c608c  ! 57: LDSB_I	ldsb	[%r17 + 0x008c], %r27
	setx	data_start_4, %g1, %r20
	.word 0xf41d0000  ! 61: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xfe048000  ! 64: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf71c8000  ! 65: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xb9508000  ! 69: RDPR_TSTATE	<illegal instruction>
	.word 0xb8bc0000  ! 70: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xbac56019  ! 73: ADDCcc_I	addccc 	%r21, 0x0019, %r29
	.word 0xb350c000  ! 75: RDPR_TT	<illegal instruction>
	setx	0xe4496a9800003c03, %g1, %r10
	.word 0x819a8000  ! 78: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_2, %g1, %r18
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d4000  ! 86: LDSB_R	ldsb	[%r21 + %r0], %r27
	setx	data_start_6, %g1, %r22
	mov	0, %r12
	.word 0x8f930000  ! 90: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf014a097  ! 91: LDUH_I	lduh	[%r18 + 0x0097], %r24
	.word 0xf24da1da  ! 94: LDSB_I	ldsb	[%r22 + 0x01da], %r25
	.word 0xf64460e5  ! 98: LDSW_I	ldsw	[%r17 + 0x00e5], %r27
	.word 0xf20de0ed  ! 99: LDUB_I	ldub	[%r23 + 0x00ed], %r25
	.word 0xfc4560af  ! 100: LDSW_I	ldsw	[%r21 + 0x00af], %r30
	.word 0xfa5dc000  ! 101: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xb7480000  ! 103: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf508000  ! 104: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xf91d205c  ! 120: LDDF_I	ldd	[%r20, 0x005c], %f28
	.word 0xfe450000  ! 122: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xb951c000  ! 130: RDPR_TL	<illegal instruction>
	.word 0x85942151  ! 133: WRPR_TSTATE_I	wrpr	%r16, 0x0151, %tstate
	setx	data_start_6, %g1, %r17
	.word 0xfc05216f  ! 139: LDUW_I	lduw	[%r20 + 0x016f], %r30
	.word 0xfa1c6090  ! 142: LDD_I	ldd	[%r17 + 0x0090], %r29
	.word 0xb88c20dc  ! 144: ANDcc_I	andcc 	%r16, 0x00dc, %r28
	.word 0xf64520fb  ! 145: LDSW_I	ldsw	[%r20 + 0x00fb], %r27
	.word 0xfc5c2085  ! 147: LDX_I	ldx	[%r16 + 0x0085], %r30
	.word 0xb2b5e0e2  ! 149: ORNcc_I	orncc 	%r23, 0x00e2, %r25
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 151: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194a089  ! 152: WRPR_PIL_I	wrpr	%r18, 0x0089, %pil
	.word 0x8995a152  ! 154: WRPR_TICK_I	wrpr	%r22, 0x0152, %tick
	.word 0xfe04c000  ! 159: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xba856033  ! 160: ADDcc_I	addcc 	%r21, 0x0033, %r29
	.word 0xb7510000  ! 165: RDPR_TICK	<illegal instruction>
	.word 0xf81c4000  ! 166: LDD_R	ldd	[%r17 + %r0], %r28
	setx	0xda820ef00000ca0a, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd504000  ! 170: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1c4000  ! 174: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xfe1c0000  ! 176: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xbb518000  ! 177: RDPR_PSTATE	<illegal instruction>
	.word 0xf31d61e2  ! 182: LDDF_I	ldd	[%r21, 0x01e2], %f25
	.word 0xb2b4a1fa  ! 185: ORNcc_I	orncc 	%r18, 0x01fa, %r25
	.word 0xbd3c8000  ! 186: SRA_R	sra 	%r18, %r0, %r30
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1dc000  ! 188: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xfc050000  ! 189: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfe05e145  ! 190: LDUW_I	lduw	[%r23 + 0x0145], %r31
	setx	data_start_2, %g1, %r20
	.word 0xf245e151  ! 192: LDSW_I	ldsw	[%r23 + 0x0151], %r25
	.word 0xfe0de1ea  ! 193: LDUB_I	ldub	[%r23 + 0x01ea], %r31
	.word 0xf21d6006  ! 194: LDD_I	ldd	[%r21 + 0x0006], %r25
	.word 0xfc4cc000  ! 195: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfe0460be  ! 197: LDUW_I	lduw	[%r17 + 0x00be], %r31
	mov	0, %r12
	.word 0xa1930000  ! 200: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0540000  ! 203: LDSH_R	ldsh	[%r16 + %r0], %r24
	mov	1, %r12
	.word 0x8f930000  ! 206: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe0d60d3  ! 207: LDUB_I	ldub	[%r21 + 0x00d3], %r31
	.word 0xfa544000  ! 208: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfd1d0000  ! 212: LDDF_R	ldd	[%r20, %r0], %f30
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91952056  ! 218: WRPR_PIL_I	wrpr	%r20, 0x0056, %pil
	setx	data_start_6, %g1, %r23
	.word 0xf6548000  ! 220: LDSH_R	ldsh	[%r18 + %r0], %r27
	setx	0x90a48bae00004e8f, %g1, %r10
	.word 0x819a8000  ! 221: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1da10b  ! 225: LDD_I	ldd	[%r22 + 0x010b], %r29
	.word 0xf40c4000  ! 227: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf60c21d4  ! 231: LDUB_I	ldub	[%r16 + 0x01d4], %r27
	.word 0xf80d8000  ! 232: LDUB_R	ldub	[%r22 + %r0], %r28
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4044000  ! 239: LDUW_R	lduw	[%r17 + %r0], %r26
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1cc000  ! 243: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb1510000  ! 245: RDPR_TICK	rdpr	%tick, %r24
	setx	data_start_1, %g1, %r18
	.word 0x8595a1ac  ! 249: WRPR_TSTATE_I	wrpr	%r22, 0x01ac, %tstate
	.word 0xf71d8000  ! 254: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xf6154000  ! 258: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xb0450000  ! 265: ADDC_R	addc 	%r20, %r0, %r24
	.word 0xfa144000  ! 268: LDUH_R	lduh	[%r17 + %r0], %r29
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879560e7  ! 271: WRPR_TT_I	wrpr	%r21, 0x00e7, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0c2118  ! 275: LDUB_I	ldub	[%r16 + 0x0118], %r30
	.word 0xf005604b  ! 278: LDUW_I	lduw	[%r21 + 0x004b], %r24
	.word 0xf654a128  ! 281: LDSH_I	ldsh	[%r18 + 0x0128], %r27
	.word 0xba350000  ! 282: ORN_R	orn 	%r20, %r0, %r29
	.word 0xf64c6035  ! 283: LDSB_I	ldsb	[%r17 + 0x0035], %r27
	.word 0xfd1d608e  ! 284: LDDF_I	ldd	[%r21, 0x008e], %f30
	.word 0xf615c000  ! 285: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0x85952113  ! 287: WRPR_TSTATE_I	wrpr	%r20, 0x0113, %tstate
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0158000  ! 291: OR_R	or 	%r22, %r0, %r24
	.word 0xfe548000  ! 293: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0x8d94e102  ! 295: WRPR_PSTATE_I	wrpr	%r19, 0x0102, %pstate
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d8000  ! 304: LDSB_R	ldsb	[%r22 + %r0], %r25
	mov	1, %r12
	.word 0xa1930000  ! 306: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb3d5000  ! 313: SRAX_R	srax	%r21, %r0, %r29
	.word 0xf81d0000  ! 314: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0x8d9561c3  ! 317: WRPR_PSTATE_I	wrpr	%r21, 0x01c3, %pstate
	.word 0xfc4d61ea  ! 319: LDSB_I	ldsb	[%r21 + 0x01ea], %r30
	.word 0xba95605d  ! 322: ORcc_I	orcc 	%r21, 0x005d, %r29
	.word 0xfa05c000  ! 325: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xf04cc000  ! 329: LDSB_R	ldsb	[%r19 + %r0], %r24
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 335: RDPR_GL	<illegal instruction>
	.word 0xfe1cc000  ! 336: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xb5504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xb9510000  ! 347: RDPR_TICK	<illegal instruction>
	setx	0xc4b0af8f00004b1f, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195216a  ! 350: WRPR_TPC_I	wrpr	%r20, 0x016a, %tpc
	.word 0xf214a150  ! 351: LDUH_I	lduh	[%r18 + 0x0150], %r25
	.word 0xf005c000  ! 355: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0x879460b8  ! 357: WRPR_TT_I	wrpr	%r17, 0x00b8, %tt
	.word 0xff1c21a0  ! 359: LDDF_I	ldd	[%r16, 0x01a0], %f31
	.word 0x9194e198  ! 361: WRPR_PIL_I	wrpr	%r19, 0x0198, %pil
	.word 0xfa1c8000  ! 363: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xb9508000  ! 367: RDPR_TSTATE	<illegal instruction>
	.word 0xf80c8000  ! 371: LDUB_R	ldub	[%r18 + %r0], %r28
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 375: RDPR_GL	<illegal instruction>
	.word 0xf05ca1f9  ! 377: LDX_I	ldx	[%r18 + 0x01f9], %r24
	.word 0xf40ce039  ! 378: LDUB_I	ldub	[%r19 + 0x0039], %r26
	.word 0xf31de1b0  ! 380: LDDF_I	ldd	[%r23, 0x01b0], %f25
	.word 0xf11cc000  ! 382: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xb9540000  ! 383: RDPR_GL	<illegal instruction>
	.word 0xf405c000  ! 394: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0x8d95a139  ! 395: WRPR_PSTATE_I	wrpr	%r22, 0x0139, %pstate
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf205a172  ! 398: LDUW_I	lduw	[%r22 + 0x0172], %r25
	.word 0xb950c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0xf254c000  ! 401: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf655615b  ! 406: LDSH_I	ldsh	[%r21 + 0x015b], %r27
	.word 0x9195603f  ! 410: WRPR_PIL_I	wrpr	%r21, 0x003f, %pil
	.word 0xb00dc000  ! 411: AND_R	and 	%r23, %r0, %r24
	setx	0xb402d9fd0000fd07, %g1, %r10
	.word 0x839a8000  ! 413: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2042041  ! 415: LDUW_I	lduw	[%r16 + 0x0041], %r25
	.word 0xf20ce02b  ! 417: LDUB_I	ldub	[%r19 + 0x002b], %r25
	.word 0xf21ca120  ! 419: LDD_I	ldd	[%r18 + 0x0120], %r25
	.word 0xf04d8000  ! 421: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf41c0000  ! 422: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xfe1d4000  ! 425: LDD_R	ldd	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0xa1930000  ! 426: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb32cb001  ! 427: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0xf8044000  ! 431: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xb350c000  ! 435: RDPR_TT	<illegal instruction>
	.word 0xf20d6057  ! 437: LDUB_I	ldub	[%r21 + 0x0057], %r25
	.word 0xf24de138  ! 441: LDSB_I	ldsb	[%r23 + 0x0138], %r25
	.word 0xf8156104  ! 443: LDUH_I	lduh	[%r21 + 0x0104], %r28
	.word 0xf21c60d8  ! 446: LDD_I	ldd	[%r17 + 0x00d8], %r25
	.word 0xf00c6052  ! 449: LDUB_I	ldub	[%r17 + 0x0052], %r24
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc158000  ! 451: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xb5510000  ! 454: RDPR_TICK	<illegal instruction>
	.word 0x8d95e132  ! 455: WRPR_PSTATE_I	wrpr	%r23, 0x0132, %pstate
	.word 0xfc4d0000  ! 457: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xb734b001  ! 459: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xbc95e045  ! 461: ORcc_I	orcc 	%r23, 0x0045, %r30
	.word 0xf04d60cd  ! 469: LDSB_I	ldsb	[%r21 + 0x00cd], %r24
	.word 0xbb540000  ! 470: RDPR_GL	<illegal instruction>
	.word 0xf45c20c5  ! 471: LDX_I	ldx	[%r16 + 0x00c5], %r26
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 475: RDPR_PSTATE	<illegal instruction>
	.word 0xfa45a168  ! 476: LDSW_I	ldsw	[%r22 + 0x0168], %r29
	setx	data_start_0, %g1, %r22
	.word 0xfe040000  ! 479: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xfa0c2153  ! 483: LDUB_I	ldub	[%r16 + 0x0153], %r29
	.word 0xb004a171  ! 484: ADD_I	add 	%r18, 0x0171, %r24
	.word 0xf04d0000  ! 487: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfc148000  ! 488: LDUH_R	lduh	[%r18 + %r0], %r30
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44460dc  ! 492: LDSW_I	ldsw	[%r17 + 0x00dc], %r26
	.word 0xf204e062  ! 494: LDUW_I	lduw	[%r19 + 0x0062], %r25
	.word 0xbb520000  ! 495: RDPR_PIL	<illegal instruction>
	.word 0xf64c0000  ! 500: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf80cc000  ! 502: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0x89946006  ! 503: WRPR_TICK_I	wrpr	%r17, 0x0006, %tick
	.word 0xf44de157  ! 504: LDSB_I	ldsb	[%r23 + 0x0157], %r26
	.word 0xb89d8000  ! 508: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb2144000  ! 510: OR_R	or 	%r17, %r0, %r25
	.word 0xf85c0000  ! 512: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf6440000  ! 513: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xb7510000  ! 514: RDPR_TICK	<illegal instruction>
	.word 0xf60d4000  ! 516: LDUB_R	ldub	[%r21 + %r0], %r27
	setx	0x3324ff9400009a0c, %g1, %r10
	.word 0x839a8000  ! 518: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8450000  ! 520: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfc0ca188  ! 521: LDUB_I	ldub	[%r18 + 0x0188], %r30
	.word 0x8d95a0ef  ! 522: WRPR_PSTATE_I	wrpr	%r22, 0x00ef, %pstate
	setx	data_start_1, %g1, %r18
	.word 0xf45da14f  ! 527: LDX_I	ldx	[%r22 + 0x014f], %r26
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4840000  ! 531: ADDcc_R	addcc 	%r16, %r0, %r26
	setx	0x83e9ce1b00006d80, %g1, %r10
	.word 0x819a8000  ! 532: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x83946178  ! 535: WRPR_TNPC_I	wrpr	%r17, 0x0178, %tnpc
	.word 0xf605a12b  ! 536: LDUW_I	lduw	[%r22 + 0x012b], %r27
	.word 0xf01d8000  ! 540: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xbf2d2001  ! 541: SLL_I	sll 	%r20, 0x0001, %r31
	.word 0xf454a18c  ! 542: LDSH_I	ldsh	[%r18 + 0x018c], %r26
	.word 0xf61c4000  ! 544: LDD_R	ldd	[%r17 + %r0], %r27
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015c000  ! 554: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xfc55e066  ! 556: LDSH_I	ldsh	[%r23 + 0x0066], %r30
	.word 0xfc0dc000  ! 560: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf00c8000  ! 561: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xb5518000  ! 563: RDPR_PSTATE	<illegal instruction>
	.word 0xf6144000  ! 565: LDUH_R	lduh	[%r17 + %r0], %r27
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61ce0f0  ! 569: LDD_I	ldd	[%r19 + 0x00f0], %r27
	.word 0xfc1da10f  ! 571: LDD_I	ldd	[%r22 + 0x010f], %r30
	.word 0x8794a14f  ! 573: WRPR_TT_I	wrpr	%r18, 0x014f, %tt
	.word 0x879520f8  ! 575: WRPR_TT_I	wrpr	%r20, 0x00f8, %tt
	.word 0xf05c8000  ! 580: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xf0048000  ! 581: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xfc1d611a  ! 582: LDD_I	ldd	[%r21 + 0x011a], %r30
	.word 0xfa5c0000  ! 584: LDX_R	ldx	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	0xfac4afb200005993, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf81de0a1  ! 598: LDD_I	ldd	[%r23 + 0x00a1], %r28
	.word 0xb9510000  ! 600: RDPR_TICK	<illegal instruction>
	.word 0xf45560b0  ! 601: LDSH_I	ldsh	[%r21 + 0x00b0], %r26
	.word 0xff1d61a6  ! 603: LDDF_I	ldd	[%r21, 0x01a6], %f31
	.word 0x8595e0c1  ! 604: WRPR_TSTATE_I	wrpr	%r23, 0x00c1, %tstate
	.word 0x8194e188  ! 607: WRPR_TPC_I	wrpr	%r19, 0x0188, %tpc
	.word 0xb83c2080  ! 608: XNOR_I	xnor 	%r16, 0x0080, %r28
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6540000  ! 617: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xb17d6401  ! 619: MOVR_I	movre	%r21, 0x1, %r24
	.word 0xb5520000  ! 621: RDPR_PIL	<illegal instruction>
	.word 0xf005c000  ! 624: LDUW_R	lduw	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb48c2114  ! 626: ANDcc_I	andcc 	%r16, 0x0114, %r26
	.word 0xf51cc000  ! 627: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xfc5c8000  ! 629: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xbf510000  ! 630: RDPR_TICK	<illegal instruction>
	.word 0xfa448000  ! 632: LDSW_R	ldsw	[%r18 + %r0], %r29
	mov	2, %r12
	.word 0xa1930000  ! 634: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf85dc000  ! 637: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb13d0000  ! 638: SRA_R	sra 	%r20, %r0, %r24
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1c0000  ! 640: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xfe4d217a  ! 642: LDSB_I	ldsb	[%r20 + 0x017a], %r31
	.word 0x8595e095  ! 643: WRPR_TSTATE_I	wrpr	%r23, 0x0095, %tstate
	.word 0xf81c8000  ! 644: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xfc15a05e  ! 645: LDUH_I	lduh	[%r22 + 0x005e], %r30
	.word 0xfe55c000  ! 649: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf81521c5  ! 650: LDUH_I	lduh	[%r20 + 0x01c5], %r28
	.word 0xf61561ab  ! 652: LDUH_I	lduh	[%r21 + 0x01ab], %r27
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5461ef  ! 657: LDSH_I	ldsh	[%r17 + 0x01ef], %r29
	.word 0xf51de03a  ! 660: LDDF_I	ldd	[%r23, 0x003a], %f26
	setx	data_start_6, %g1, %r18
	.word 0x859520e2  ! 665: WRPR_TSTATE_I	wrpr	%r20, 0x00e2, %tstate
	.word 0xbd3cb001  ! 667: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xf84c8000  ! 668: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0x91952038  ! 669: WRPR_PIL_I	wrpr	%r20, 0x0038, %pil
	.word 0xb52ce001  ! 671: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xfe5cc000  ! 672: LDX_R	ldx	[%r19 + %r0], %r31
	setx	0xc127a2a700004f92, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6944000  ! 674: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xfc5ca1b9  ! 675: LDX_I	ldx	[%r18 + 0x01b9], %r30
	.word 0xf44421e4  ! 676: LDSW_I	ldsw	[%r16 + 0x01e4], %r26
	.word 0x8d94601f  ! 677: WRPR_PSTATE_I	wrpr	%r17, 0x001f, %pstate
	.word 0x8195e083  ! 678: WRPR_TPC_I	wrpr	%r23, 0x0083, %tpc
	.word 0xff1c0000  ! 680: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf854c000  ! 681: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf81c0000  ! 683: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xfa5c208b  ! 687: LDX_I	ldx	[%r16 + 0x008b], %r29
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c8000  ! 690: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb9508000  ! 692: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x89942190  ! 693: WRPR_TICK_I	wrpr	%r16, 0x0190, %tick
	.word 0xb88dc000  ! 696: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xbcb4c000  ! 701: ORNcc_R	orncc 	%r19, %r0, %r30
	setx	data_start_2, %g1, %r16
	.word 0xfe448000  ! 711: LDSW_R	ldsw	[%r18 + %r0], %r31
	setx	data_start_7, %g1, %r16
	.word 0xf645e0ed  ! 716: LDSW_I	ldsw	[%r23 + 0x00ed], %r27
	.word 0xf645a0e3  ! 719: LDSW_I	ldsw	[%r22 + 0x00e3], %r27
	.word 0xf85d8000  ! 720: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0x9194e00c  ! 724: WRPR_PIL_I	wrpr	%r19, 0x000c, %pil
	setx	0x47a2c9a00000fc49, %g1, %r10
	.word 0x839a8000  ! 726: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb150c000  ! 728: RDPR_TT	rdpr	%tt, %r24
	.word 0xfa454000  ! 729: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf81c8000  ! 735: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf71c20ae  ! 736: LDDF_I	ldd	[%r16, 0x00ae], %f27
	.word 0xf0156004  ! 737: LDUH_I	lduh	[%r21 + 0x0004], %r24
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d2183  ! 743: LDX_I	ldx	[%r20 + 0x0183], %r31
	.word 0xb5520000  ! 746: RDPR_PIL	<illegal instruction>
	.word 0xf445c000  ! 748: LDSW_R	ldsw	[%r23 + %r0], %r26
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe450000  ! 751: ADDC_R	addc 	%r20, %r0, %r31
	setx	data_start_5, %g1, %r20
	.word 0xf8444000  ! 754: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xbd480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb350c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xf205a08f  ! 759: LDUW_I	lduw	[%r22 + 0x008f], %r25
	.word 0xfe050000  ! 760: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xf4056067  ! 761: LDUW_I	lduw	[%r21 + 0x0067], %r26
	.word 0xb4154000  ! 762: OR_R	or 	%r21, %r0, %r26
	.word 0xf255c000  ! 765: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xfa148000  ! 768: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf51dc000  ! 769: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xfa0c8000  ! 772: LDUB_R	ldub	[%r18 + %r0], %r29
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a09e  ! 776: WRPR_PSTATE_I	wrpr	%r18, 0x009e, %pstate
	setx	data_start_1, %g1, %r17
	.word 0xb7500000  ! 778: RDPR_TPC	<illegal instruction>
	.word 0xf645a10d  ! 780: LDSW_I	ldsw	[%r22 + 0x010d], %r27
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4ca05e  ! 791: LDSB_I	ldsb	[%r18 + 0x005e], %r31
	.word 0xfe458000  ! 792: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xb3540000  ! 793: RDPR_GL	<illegal instruction>
	.word 0xf81da104  ! 795: LDD_I	ldd	[%r22 + 0x0104], %r28
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51c2190  ! 798: LDDF_I	ldd	[%r16, 0x0190], %f26
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839420f2  ! 801: WRPR_TNPC_I	wrpr	%r16, 0x00f2, %tnpc
	.word 0xf814a1c9  ! 802: LDUH_I	lduh	[%r18 + 0x01c9], %r28
	.word 0xff1c4000  ! 803: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xbd500000  ! 804: RDPR_TPC	<illegal instruction>
	.word 0xfd1c2122  ! 809: LDDF_I	ldd	[%r16, 0x0122], %f30
	.word 0x8794a0eb  ! 812: WRPR_TT_I	wrpr	%r18, 0x00eb, %tt
	.word 0xfa1dc000  ! 813: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0x8794e1be  ! 818: WRPR_TT_I	wrpr	%r19, 0x01be, %tt
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81da1d0  ! 828: LDD_I	ldd	[%r22 + 0x01d0], %r28
	.word 0xfa154000  ! 830: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf40d4000  ! 831: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbc250000  ! 833: SUB_R	sub 	%r20, %r0, %r30
	.word 0xbc24611a  ! 836: SUB_I	sub 	%r17, 0x011a, %r30
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0dc000  ! 840: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xb3480000  ! 845: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	1, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf844a1e4  ! 849: LDSW_I	ldsw	[%r18 + 0x01e4], %r28
	.word 0xb9643801  ! 853: MOVcc_I	<illegal instruction>
	.word 0xbb35a001  ! 856: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xfa0dc000  ! 860: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0x8d94e0c3  ! 861: WRPR_PSTATE_I	wrpr	%r19, 0x00c3, %pstate
	.word 0x8194a16b  ! 862: WRPR_TPC_I	wrpr	%r18, 0x016b, %tpc
	.word 0xf81d6098  ! 868: LDD_I	ldd	[%r21 + 0x0098], %r28
	.word 0xb1480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb4bc8000  ! 872: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xfa556148  ! 874: LDSH_I	ldsh	[%r21 + 0x0148], %r29
	.word 0xbd480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf71c4000  ! 876: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf51d0000  ! 885: LDDF_R	ldd	[%r20, %r0], %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0040000  ! 887: LDUW_R	lduw	[%r16 + %r0], %r24
	mov	2, %r12
	.word 0x8f930000  ! 892: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf004c000  ! 896: LDUW_R	lduw	[%r19 + %r0], %r24
	setx	0x8a3a353c0000a85f, %g1, %r10
	.word 0x839a8000  ! 898: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf21de06b  ! 902: LDD_I	ldd	[%r23 + 0x006b], %r25
	.word 0xb9540000  ! 903: RDPR_GL	<illegal instruction>
	.word 0xfa0d8000  ! 905: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xb4b42076  ! 907: ORNcc_I	orncc 	%r16, 0x0076, %r26
	.word 0x8194e13f  ! 908: WRPR_TPC_I	wrpr	%r19, 0x013f, %tpc
	.word 0xb73d9000  ! 909: SRAX_R	srax	%r22, %r0, %r27
	setx	0xc26ad57c0000b80d, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc5c2093  ! 911: LDX_I	ldx	[%r16 + 0x0093], %r30
	.word 0xb2b5216e  ! 915: ORNcc_I	orncc 	%r20, 0x016e, %r25
	.word 0xfe05c000  ! 917: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xbf50c000  ! 920: RDPR_TT	<illegal instruction>
	.word 0xf245a16b  ! 921: LDSW_I	ldsw	[%r22 + 0x016b], %r25
	.word 0x85942149  ! 925: WRPR_TSTATE_I	wrpr	%r16, 0x0149, %tstate
	.word 0xf214a0cb  ! 928: LDUH_I	lduh	[%r18 + 0x00cb], %r25
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11ce17c  ! 933: LDDF_I	ldd	[%r19, 0x017c], %f24
	.word 0xf845e1b6  ! 935: LDSW_I	ldsw	[%r23 + 0x01b6], %r28
	.word 0xf65de19f  ! 941: LDX_I	ldx	[%r23 + 0x019f], %r27
	.word 0xbf540000  ! 945: RDPR_GL	<illegal instruction>
	.word 0xf65dc000  ! 949: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xb5508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xfc1c6044  ! 956: LDD_I	ldd	[%r17 + 0x0044], %r30
	.word 0xf41c0000  ! 962: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf4458000  ! 964: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xb8b4c000  ! 965: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0xbf508000  ! 966: RDPR_TSTATE	<illegal instruction>
	.word 0xf644a19a  ! 969: LDSW_I	ldsw	[%r18 + 0x019a], %r27
	.word 0xb1540000  ! 972: RDPR_GL	<illegal instruction>
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804a1ff  ! 975: LDUW_I	lduw	[%r18 + 0x01ff], %r28
	.word 0xb2356160  ! 977: ORN_I	orn 	%r21, 0x0160, %r25
	.word 0xb7504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xf654e187  ! 981: LDSH_I	ldsh	[%r19 + 0x0187], %r27
	.word 0xfb1d4000  ! 983: LDDF_R	ldd	[%r21, %r0], %f29
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11d4000  ! 990: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf414e0f7  ! 992: LDUH_I	lduh	[%r19 + 0x00f7], %r26
	.word 0xf6148000  ! 995: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfa05a102  ! 996: LDUW_I	lduw	[%r22 + 0x0102], %r29
	.word 0xfc4ce07a  ! 998: LDSB_I	ldsb	[%r19 + 0x007a], %r30
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda00560  ! 1: FSQRTq	fsqrt	
	.word 0xbfab0820  ! 2: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a4c8e0  ! 4: FSUBq	dis not found

	.word 0x83952090  ! 5: WRPR_TNPC_I	wrpr	%r20, 0x0090, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 6: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7ab0820  ! 10: FMOVGU	fmovs	%fcc1, %f0, %f27
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa549a0  ! 17: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xb5a98820  ! 18: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb494e0b5  ! 19: ORcc_I	orcc 	%r19, 0x00b5, %r26
	.word 0xb5a5c820  ! 20: FADDs	fadds	%f23, %f0, %f26
	.word 0xb3a00520  ! 21: FSQRTs	fsqrt	
	.word 0xb97d2401  ! 27: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb3aac820  ! 29: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	data_start_0, %g1, %r20
	.word 0xbba54820  ! 36: FADDs	fadds	%f21, %f0, %f29
	.word 0xbfa54820  ! 37: FADDs	fadds	%f21, %f0, %f31
	.word 0xbb7dc400  ! 39: MOVR_R	movre	%r23, %r0, %r29
	.word 0xb1a48920  ! 48: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb3a54860  ! 49: FADDq	dis not found

	.word 0x8d952049  ! 51: WRPR_PSTATE_I	wrpr	%r20, 0x0049, %pstate
	.word 0xb2044000  ! 52: ADD_R	add 	%r17, %r0, %r25
	.word 0xba9c4000  ! 53: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xb5a449c0  ! 54: FDIVd	fdivd	%f48, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb93c7001  ! 56: SRAX_I	srax	%r17, 0x0001, %r28
	setx	data_start_3, %g1, %r20
	.word 0xbdab8820  ! 60: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a589c0  ! 68: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb9508000  ! 69: RDPR_TSTATE	<illegal instruction>
	.word 0xb2bcc000  ! 70: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xb0c46131  ! 73: ADDCcc_I	addccc 	%r17, 0x0131, %r24
	.word 0xbf50c000  ! 75: RDPR_TT	<illegal instruction>
	setx	0xcfa46fe400003b18, %g1, %r10
	.word 0x819a8000  ! 78: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba00560  ! 79: FSQRTq	fsqrt	
	setx	data_start_5, %g1, %r18
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 84: FSQRTs	fsqrt	
	.word 0xb9a80420  ! 85: FMOVRZ	dis not found

	.word 0xbfabc820  ! 87: FMOVVC	fmovs	%fcc1, %f0, %f31
	setx	data_start_0, %g1, %r20
	mov	2, %r12
	.word 0x8f930000  ! 90: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a00520  ! 102: FSQRTs	fsqrt	
	.word 0xbb480000  ! 103: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3508000  ! 104: RDPR_TSTATE	<illegal instruction>
	.word 0xb5aa8820  ! 105: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00520  ! 106: FSQRTs	fsqrt	
	.word 0xb5a84820  ! 110: FMOVE	fmovs	%fcc1, %f0, %f26
	setx	data_start_0, %g1, %r20
	.word 0xb9a81c20  ! 118: FMOVRGEZ	dis not found

	.word 0xb3aac820  ! 119: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda488e0  ! 123: FSUBq	dis not found

	.word 0xb5aa4820  ! 124: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c9a0  ! 127: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbba448c0  ! 128: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb151c000  ! 130: RDPR_TL	<illegal instruction>
	.word 0xb7ab0820  ! 131: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0x8594a0a6  ! 133: WRPR_TSTATE_I	wrpr	%r18, 0x00a6, %tstate
	setx	data_start_4, %g1, %r18
	.word 0xb7a5c9a0  ! 137: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbfa94820  ! 138: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a80820  ! 141: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb88c2021  ! 144: ANDcc_I	andcc 	%r16, 0x0021, %r28
	.word 0xb2b521b3  ! 149: ORNcc_I	orncc 	%r20, 0x01b3, %r25
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 151: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x919460dd  ! 152: WRPR_PIL_I	wrpr	%r17, 0x00dd, %pil
	.word 0x899421ec  ! 154: WRPR_TICK_I	wrpr	%r16, 0x01ec, %tick
	.word 0xb684e101  ! 160: ADDcc_I	addcc 	%r19, 0x0101, %r27
	.word 0xbfa80c20  ! 163: FMOVRLZ	dis not found

	.word 0xbb510000  ! 165: RDPR_TICK	<illegal instruction>
	setx	0x60aca18e00002e8a, %g1, %r10
	.word 0x819a8000  ! 167: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb504000  ! 170: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00520  ! 172: FSQRTs	fsqrt	
	.word 0xb1518000  ! 177: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a81c20  ! 179: FMOVRGEZ	dis not found

	.word 0xbba80820  ! 184: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbcb460dc  ! 185: ORNcc_I	orncc 	%r17, 0x00dc, %r30
	.word 0xb93cc000  ! 186: SRA_R	sra 	%r19, %r0, %r28
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xbba409c0  ! 196: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb9a88820  ! 199: FMOVLE	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 200: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a54940  ! 204: FMULd	fmuld	%f52, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 206: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5ab0820  ! 213: FMOVGU	fmovs	%fcc1, %f0, %f26
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c940  ! 217: FMULd	fmuld	%f50, %f0, %f58
	.word 0x919460d8  ! 218: WRPR_PIL_I	wrpr	%r17, 0x00d8, %pil
	setx	data_start_4, %g1, %r23
	setx	0xa82f2d5700003d87, %g1, %r10
	.word 0x819a8000  ! 221: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9c0  ! 224: FDIVd	fdivd	%f54, %f0, %f56
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba548c0  ! 235: FSUBd	fsubd	%f52, %f0, %f60
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 244: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb5510000  ! 245: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r16
	.word 0x8595a0c9  ! 249: WRPR_TSTATE_I	wrpr	%r22, 0x00c9, %tstate
	.word 0xbba509c0  ! 253: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb3abc820  ! 259: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb8440000  ! 265: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xb7a448e0  ! 267: FSUBq	dis not found

	.word 0xbda9c820  ! 269: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e061  ! 271: WRPR_TT_I	wrpr	%r23, 0x0061, %tt
	.word 0xb3a00560  ! 273: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40960  ! 276: FMULq	dis not found

	.word 0xb5a80420  ! 277: FMOVRZ	dis not found

	.word 0xbe340000  ! 282: ORN_R	orn 	%r16, %r0, %r31
	.word 0x85946032  ! 287: WRPR_TSTATE_I	wrpr	%r17, 0x0032, %tstate
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe154000  ! 291: OR_R	or 	%r21, %r0, %r31
	.word 0x8d94217e  ! 295: WRPR_PSTATE_I	wrpr	%r16, 0x017e, %pstate
	.word 0xbfa00520  ! 299: FSQRTs	fsqrt	
	.word 0xb7a00020  ! 300: FMOVs	fmovs	%f0, %f27
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 306: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a5c8e0  ! 309: FSUBq	dis not found

	.word 0xbda80820  ! 310: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbf3d5000  ! 313: SRAX_R	srax	%r21, %r0, %r31
	.word 0xbda80820  ! 316: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0x8d946037  ! 317: WRPR_PSTATE_I	wrpr	%r17, 0x0037, %pstate
	.word 0xb1a80420  ! 318: FMOVRZ	dis not found

	.word 0xb095e1ce  ! 322: ORcc_I	orcc 	%r23, 0x01ce, %r24
	.word 0xb1a94820  ! 324: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 335: RDPR_GL	<illegal instruction>
	.word 0xbbab0820  ! 340: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb9a90820  ! 341: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbd504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xbb510000  ! 347: RDPR_TICK	<illegal instruction>
	.word 0xb9a448a0  ! 348: FSUBs	fsubs	%f17, %f0, %f28
	setx	0xe38405a000001c1a, %g1, %r10
	.word 0x819a8000  ! 349: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195e160  ! 350: WRPR_TPC_I	wrpr	%r23, 0x0160, %tpc
	.word 0xb7aac820  ! 356: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x8794a1cc  ! 357: WRPR_TT_I	wrpr	%r18, 0x01cc, %tt
	.word 0x9195a07b  ! 361: WRPR_PIL_I	wrpr	%r22, 0x007b, %pil
	.word 0xbba81420  ! 362: FMOVRNZ	dis not found

	.word 0xb7a00020  ! 364: FMOVs	fmovs	%f0, %f27
	.word 0xbf508000  ! 367: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a54920  ! 368: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb9aa8820  ! 369: FMOVG	fmovs	%fcc1, %f0, %f28
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 373: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbdab8820  ! 374: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3540000  ! 375: RDPR_GL	<illegal instruction>
	.word 0xb1a81820  ! 379: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbd540000  ! 383: RDPR_GL	<illegal instruction>
	.word 0xb5a9c820  ! 391: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0x8d946182  ! 395: WRPR_PSTATE_I	wrpr	%r17, 0x0182, %pstate
	.word 0xb3a409a0  ! 396: FDIVs	fdivs	%f16, %f0, %f25
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0xb5ab8820  ! 400: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a588e0  ! 405: FSUBq	dis not found

	.word 0xb7a44860  ! 408: FADDq	dis not found

	.word 0x919421cb  ! 410: WRPR_PIL_I	wrpr	%r16, 0x01cb, %pil
	.word 0xb40dc000  ! 411: AND_R	and 	%r23, %r0, %r26
	setx	0xc44d2910000cace, %g1, %r10
	.word 0x839a8000  ! 413: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00520  ! 418: FSQRTs	fsqrt	
	mov	0, %r12
	.word 0xa1930000  ! 426: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb92c7001  ! 427: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xb3a40840  ! 428: FADDd	faddd	%f16, %f0, %f56
	.word 0xbbaa0820  ! 429: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a548e0  ! 430: FSUBq	dis not found

	.word 0xbda489e0  ! 432: FDIVq	dis not found

	.word 0xbba508c0  ! 434: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb150c000  ! 435: RDPR_TT	<illegal instruction>
	.word 0xb5aa4820  ! 444: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 452: FMOVd	fmovd	%f0, %f28
	.word 0xb1a00040  ! 453: FMOVd	fmovd	%f0, %f24
	.word 0xb3510000  ! 454: RDPR_TICK	<illegal instruction>
	.word 0x8d942181  ! 455: WRPR_PSTATE_I	wrpr	%r16, 0x0181, %pstate
	.word 0xb734f001  ! 459: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xbc95a0e7  ! 461: ORcc_I	orcc 	%r22, 0x00e7, %r30
	.word 0xb9a589a0  ! 463: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbda4c860  ! 465: FADDq	dis not found

	.word 0xb3540000  ! 470: RDPR_GL	<illegal instruction>
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589a0  ! 473: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb7518000  ! 475: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xb1aa8820  ! 482: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbe0421e9  ! 484: ADD_I	add 	%r16, 0x01e9, %r31
	.word 0xbba44820  ! 486: FADDs	fadds	%f17, %f0, %f29
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 490: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb5520000  ! 495: RDPR_PIL	<illegal instruction>
	.word 0xbba00540  ! 497: FSQRTd	fsqrt	
	.word 0xb9a508e0  ! 498: FSUBq	dis not found

	.word 0x899560e1  ! 503: WRPR_TICK_I	wrpr	%r21, 0x00e1, %tick
	.word 0xbfab8820  ! 505: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbe9c8000  ! 508: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xb7a508a0  ! 509: FSUBs	fsubs	%f20, %f0, %f27
	.word 0xb614c000  ! 510: OR_R	or 	%r19, %r0, %r27
	.word 0xb9510000  ! 514: RDPR_TICK	<illegal instruction>
	.word 0xb5a98820  ! 517: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0xffcab86400001d88, %g1, %r10
	.word 0x839a8000  ! 518: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d94e186  ! 522: WRPR_PSTATE_I	wrpr	%r19, 0x0186, %pstate
	.word 0xb7aa8820  ! 524: FMOVG	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r23
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc85c000  ! 531: ADDcc_R	addcc 	%r23, %r0, %r30
	setx	0x1d6a4d810000ba13, %g1, %r10
	.word 0x819a8000  ! 532: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a00560  ! 534: FSQRTq	fsqrt	
	.word 0x8394a19e  ! 535: WRPR_TNPC_I	wrpr	%r18, 0x019e, %tnpc
	.word 0xbfa449e0  ! 539: FDIVq	dis not found

	.word 0xb72d6001  ! 541: SLL_I	sll 	%r21, 0x0001, %r27
	.word 0xb5a00560  ! 543: FSQRTq	fsqrt	
	.word 0xbfa00520  ! 546: FSQRTs	fsqrt	
	.word 0xbfa5c9a0  ! 547: FDIVs	fdivs	%f23, %f0, %f31
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 557: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbb518000  ! 563: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a00020  ! 566: FMOVs	fmovs	%f0, %f28
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 570: FMOVs	fmovs	%f0, %f31
	.word 0x879520b9  ! 573: WRPR_TT_I	wrpr	%r20, 0x00b9, %tt
	.word 0x8794e0ba  ! 575: WRPR_TT_I	wrpr	%r19, 0x00ba, %tt
	.word 0xb7a54920  ! 578: FMULs	fmuls	%f21, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a509c0  ! 589: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb7a40960  ! 592: FMULq	dis not found

	setx	0x7746ae400000fccb, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba9c820  ! 596: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbda549c0  ! 597: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb1a58940  ! 599: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb1510000  ! 600: RDPR_TICK	<illegal instruction>
	.word 0x859460c0  ! 604: WRPR_TSTATE_I	wrpr	%r17, 0x00c0, %tstate
	.word 0x8195e1ce  ! 607: WRPR_TPC_I	wrpr	%r23, 0x01ce, %tpc
	.word 0xbc3d21f2  ! 608: XNOR_I	xnor 	%r20, 0x01f2, %r30
	.word 0xb5aa8820  ! 611: FMOVG	fmovs	%fcc1, %f0, %f26
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 616: FMOVd	fmovd	%f0, %f60
	.word 0xb37ca401  ! 619: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xbf520000  ! 621: RDPR_PIL	<illegal instruction>
	.word 0xbba54860  ! 622: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb48c20ff  ! 626: ANDcc_I	andcc 	%r16, 0x00ff, %r26
	.word 0xbf510000  ! 630: RDPR_TICK	<illegal instruction>
	.word 0xb3a98820  ! 633: FMOVNEG	fmovs	%fcc1, %f0, %f25
	mov	1, %r12
	.word 0xa1930000  ! 634: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a54960  ! 636: FMULq	dis not found

	.word 0xb13c0000  ! 638: SRA_R	sra 	%r16, %r0, %r24
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a083  ! 643: WRPR_TSTATE_I	wrpr	%r18, 0x0083, %tstate
	.word 0xbda00040  ! 646: FMOVd	fmovd	%f0, %f30
	.word 0xb9a8c820  ! 648: FMOVL	fmovs	%fcc1, %f0, %f28
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 656: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a5c8e0  ! 658: FSUBq	dis not found

	setx	data_start_7, %g1, %r18
	.word 0x8594e12f  ! 665: WRPR_TSTATE_I	wrpr	%r19, 0x012f, %tstate
	.word 0xb53df001  ! 667: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0x919460f7  ! 669: WRPR_PIL_I	wrpr	%r17, 0x00f7, %pil
	.word 0xbfa88820  ! 670: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb52de001  ! 671: SLL_I	sll 	%r23, 0x0001, %r26
	setx	0x777d83200002a5e, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6954000  ! 674: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0x8d94e098  ! 677: WRPR_PSTATE_I	wrpr	%r19, 0x0098, %pstate
	.word 0x8195e05d  ! 678: WRPR_TPC_I	wrpr	%r23, 0x005d, %tpc
	.word 0xbfa80820  ! 679: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a81c20  ! 682: FMOVRGEZ	dis not found

	.word 0xbfaa8820  ! 686: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548c0  ! 691: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb9508000  ! 692: RDPR_TSTATE	<illegal instruction>
	.word 0x8994e18c  ! 693: WRPR_TICK_I	wrpr	%r19, 0x018c, %tick
	.word 0xb9a81c20  ! 695: FMOVRGEZ	dis not found

	.word 0xb68d0000  ! 696: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xbeb50000  ! 701: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbfa48920  ! 703: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb5a00560  ! 704: FSQRTq	fsqrt	
	setx	data_start_5, %g1, %r17
	.word 0xbfa54840  ! 708: FADDd	faddd	%f52, %f0, %f62
	setx	data_start_0, %g1, %r20
	.word 0xb7a80c20  ! 715: FMOVRLZ	dis not found

	.word 0xbfa409a0  ! 717: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xbda5c940  ! 718: FMULd	fmuld	%f54, %f0, %f30
	.word 0xbfaa4820  ! 721: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda54940  ! 723: FMULd	fmuld	%f52, %f0, %f30
	.word 0x9194e18a  ! 724: WRPR_PIL_I	wrpr	%r19, 0x018a, %pil
	setx	0xdd43d0930000aa5b, %g1, %r10
	.word 0x839a8000  ! 726: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb750c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0xb5a549a0  ! 731: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbfa00520  ! 732: FSQRTs	fsqrt	
	.word 0xb5a50820  ! 738: FADDs	fadds	%f20, %f0, %f26
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 741: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbb520000  ! 746: RDPR_PIL	<illegal instruction>
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba440000  ! 751: ADDC_R	addc 	%r16, %r0, %r29
	setx	data_start_5, %g1, %r18
	.word 0xbd480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbf50c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xb4154000  ! 762: OR_R	or 	%r21, %r0, %r26
	.word 0xbfab4820  ! 764: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 774: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81c20  ! 775: FMOVRGEZ	dis not found

	.word 0x8d942009  ! 776: WRPR_PSTATE_I	wrpr	%r16, 0x0009, %pstate
	setx	data_start_3, %g1, %r21
	.word 0xbf500000  ! 778: RDPR_TPC	<illegal instruction>
	.word 0xb9a509e0  ! 779: FDIVq	dis not found

	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 790: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5540000  ! 793: RDPR_GL	<illegal instruction>
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 799: FMOVRZ	dis not found

	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a12a  ! 801: WRPR_TNPC_I	wrpr	%r18, 0x012a, %tnpc
	.word 0xbb500000  ! 804: RDPR_TPC	<illegal instruction>
	.word 0xbfa81c20  ! 805: FMOVRGEZ	dis not found

	.word 0xb3a50840  ! 806: FADDd	faddd	%f20, %f0, %f56
	.word 0x879560e3  ! 812: WRPR_TT_I	wrpr	%r21, 0x00e3, %tt
	.word 0xb3ab4820  ! 815: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8794e1e2  ! 818: WRPR_TT_I	wrpr	%r19, 0x01e2, %tt
	.word 0xb7a88820  ! 819: FMOVLE	fmovs	%fcc1, %f0, %f27
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 821: FSQRTs	fsqrt	
	.word 0xb9a44820  ! 822: FADDs	fadds	%f17, %f0, %f28
	.word 0xb5a80820  ! 824: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a90820  ! 827: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb8254000  ! 833: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb4246037  ! 836: SUB_I	sub 	%r17, 0x0037, %r26
	.word 0xb3a80c20  ! 837: FMOVRLZ	dis not found

	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 845: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbda98820  ! 846: FMOVNEG	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a5c8c0  ! 851: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb5a80820  ! 852: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbf643801  ! 853: MOVcc_I	<illegal instruction>
	.word 0xb535e001  ! 856: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0x8d9420fe  ! 861: WRPR_PSTATE_I	wrpr	%r16, 0x00fe, %pstate
	.word 0x8195e07f  ! 862: WRPR_TPC_I	wrpr	%r23, 0x007f, %tpc
	.word 0xb7a548c0  ! 864: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb7a4c9c0  ! 866: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb9480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbcbcc000  ! 872: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0xb3480000  ! 875: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbba98820  ! 884: FMOVNEG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa488c0  ! 890: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbda48840  ! 891: FADDd	faddd	%f18, %f0, %f30
	mov	2, %r12
	.word 0x8f930000  ! 892: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda408a0  ! 897: FSUBs	fsubs	%f16, %f0, %f30
	setx	0xc570ce400005f06, %g1, %r10
	.word 0x839a8000  ! 898: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5aa0820  ! 900: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7540000  ! 903: RDPR_GL	<illegal instruction>
	.word 0xbbab8820  ! 906: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb4b56167  ! 907: ORNcc_I	orncc 	%r21, 0x0167, %r26
	.word 0x81956105  ! 908: WRPR_TPC_I	wrpr	%r21, 0x0105, %tpc
	.word 0xb13c5000  ! 909: SRAX_R	srax	%r17, %r0, %r24
	setx	0x39c4c48900002d0f, %g1, %r10
	.word 0x819a8000  ! 910: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a00520  ! 912: FSQRTs	fsqrt	
	.word 0xb3ab0820  ! 913: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa4c8c0  ! 914: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb8b4a0a0  ! 915: ORNcc_I	orncc 	%r18, 0x00a0, %r28
	.word 0xbfa4c9a0  ! 918: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xbba509a0  ! 919: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb150c000  ! 920: RDPR_TT	<illegal instruction>
	.word 0xb7aac820  ! 922: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x8595208c  ! 925: WRPR_TSTATE_I	wrpr	%r20, 0x008c, %tstate
	.word 0xb3a40920  ! 927: FMULs	fmuls	%f16, %f0, %f25
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 931: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab0820  ! 939: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda98820  ! 942: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3540000  ! 945: RDPR_GL	<illegal instruction>
	.word 0xb9a488e0  ! 951: FSUBq	dis not found

	.word 0xbb508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a58960  ! 955: FMULq	dis not found

	.word 0xbfa00520  ! 958: FSQRTs	fsqrt	
	.word 0xbba589a0  ! 961: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbcb54000  ! 965: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xb9508000  ! 966: RDPR_TSTATE	<illegal instruction>
	.word 0xbba5c9c0  ! 971: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb5540000  ! 972: RDPR_GL	<illegal instruction>
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3420ea  ! 977: ORN_I	orn 	%r16, 0x00ea, %r29
	.word 0xb3504000  ! 979: RDPR_TNPC	<illegal instruction>
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c940  ! 988: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb5a81420  ! 991: FMOVRNZ	dis not found


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

	.xword	0xe76280ddd2d5d567
	.xword	0x8cf50029391751b2
	.xword	0x5714c38fde8c2687
	.xword	0xcb1a312361ebb552
	.xword	0x1450c6cdbb0a9e3d
	.xword	0xef1c16b611e9a54d
	.xword	0xce4dc1f4bfdcfd48
	.xword	0x96c12a21f08dbb35
	.xword	0x6500f6019d1fa0ed
	.xword	0x85c33229ef36c42c
	.xword	0x9cdc02439089048e
	.xword	0xaf33abc151e926a5
	.xword	0xf306bffbd4295d44
	.xword	0x9f5adc280ca7503f
	.xword	0xb8743c5a0c76b230
	.xword	0x81e970fd53f66928
	.xword	0xcd7f87180b367b97
	.xword	0x18210cea94fa382a
	.xword	0xe10452f63998e341
	.xword	0xa5c070b6fa623c0a
	.xword	0xab5f32784caf7d5b
	.xword	0xef0226052992b460
	.xword	0xdfd1186d5e2932d6
	.xword	0x802b8d8544256e30
	.xword	0x5b0817df0b9f8b77
	.xword	0x9c71792a977faef5
	.xword	0xa67cc33a3950150f
	.xword	0x2b0dc1f07fd4aff8
	.xword	0x7b76e38e884d771e
	.xword	0x3112ca2ca74e209d
	.xword	0x0cd12ceb7edbbf18
	.xword	0x7802a7eea77ed2b0
	.xword	0x15916cfc425147a6
	.xword	0x6a84bc74c7086f8e
	.xword	0xd5edcd656ba96ed6
	.xword	0xbf77edf12751c5e9
	.xword	0x920bcb0a12e125ba
	.xword	0x3a48a2c7462a638a
	.xword	0x7d982475b4073b07
	.xword	0x388d3bdda526152b
	.xword	0x2883637e4a36f42e
	.xword	0x699fea936ff728ed
	.xword	0xb778ff6fdbaac522
	.xword	0x9ca2aa7403821e32
	.xword	0x8cf8d49e87a9cb61
	.xword	0xc577efc01fc4d44c
	.xword	0x9f3c97655032db05
	.xword	0x07449af492a421a5
	.xword	0x01cd156e278cba0d
	.xword	0xa9af22cfacc0b6de
	.xword	0x9df99917ef6b5971
	.xword	0x19f0047fe0241ff3
	.xword	0x94340d6e0cd58b34
	.xword	0x844c71523e66fcfc
	.xword	0x5243299fd2a5f74d
	.xword	0x59eae30d94e7e6a1
	.xword	0x91e839e765287408
	.xword	0x35a09fc6b05149ae
	.xword	0xed2d070061040864
	.xword	0xd186118a83192248
	.xword	0xcbf1bf0e1aaa6826
	.xword	0x2e00720954e9e942
	.xword	0x8e3feb9bbb4bf475
	.xword	0x8bc0e51403b1aab0
	.xword	0x322a8d96c29d266c
	.xword	0x4c641242646a8bbe
	.xword	0x43bba035df0e3342
	.xword	0x21390694b1554919
	.xword	0x7b52d9ab4a0b0fcb
	.xword	0x46caacdae5eaf091
	.xword	0x48d95c8c5817af4f
	.xword	0x99882e60279f1be3
	.xword	0xa94c1c2df105d511
	.xword	0x3f390e686783b312
	.xword	0x72ed74c53e22bacd
	.xword	0xea58808f7ea476a0
	.xword	0x29e8e523953ec2fb
	.xword	0x6853258b8f822c8e
	.xword	0xf2460c233e98db16
	.xword	0xd0f5cf3a4b6314ea
	.xword	0x480d9addad6707b0
	.xword	0x79e1f470c5ca6c69
	.xword	0xd7414f057cc65524
	.xword	0x2d0797f041af4ac0
	.xword	0xb229154184b5ef50
	.xword	0x2ca9514a1e259512
	.xword	0x0dcb4e6855cd42a3
	.xword	0x62996d0af32d5ccf
	.xword	0x86b844a535d094d1
	.xword	0x8eee7b838645833c
	.xword	0x22012a6d7c78642d
	.xword	0x3288ea98ea78f3b5
	.xword	0xc53326cf35d1e5f9
	.xword	0x13356f843e99886a
	.xword	0x67c6e1e8761fa12b
	.xword	0x417dd9531f0f185e
	.xword	0x2de3b06a71acd10a
	.xword	0x58104bfc0efd4ddb
	.xword	0xe55a37be3957b0d8
	.xword	0xc17fd60b75befaa9
	.xword	0x086db0259d6b8372
	.xword	0x32271a8c3f7a1051
	.xword	0xaf2ec5b52c95dfbe
	.xword	0x450640b8fe0b35fa
	.xword	0x257ba0bfef68162f
	.xword	0x2d32af7f46b8bc78
	.xword	0xbefee96f8967c08f
	.xword	0xa2437a208702dccb
	.xword	0x2b0fae4813ca18ac
	.xword	0x7e282e040839e2f8
	.xword	0x2bb97a76f3b0c420
	.xword	0xe32ad34d38b26c93
	.xword	0xab9d207c49e83d05
	.xword	0xb1644ca4d6415865
	.xword	0x138572e50b2642ed
	.xword	0x7539e0ee5f228146
	.xword	0x2d5b7952d3fa7421
	.xword	0xf9d98d7fa2772a9e
	.xword	0xac715b45253124d0
	.xword	0xfae92893b51446b5
	.xword	0x1e9715fb0739bd7b
	.xword	0x9ed3ed15abe61992
	.xword	0x5024d6d6544f192c
	.xword	0xddb0d1ef7755fc78
	.xword	0x474feb78851dcd2e
	.xword	0x240f38536577e431
	.xword	0x3315b11ffc15b3f4
	.xword	0x2f8eee128d2adc73
	.xword	0x91e8e8de97e53c3e
	.xword	0x1a7f2fb75b95b745
	.xword	0x11851d9dc0254a2d
	.xword	0x6a72cac8b04cede7
	.xword	0x975ffa3004c9d9f9
	.xword	0xa70575499bf7db88
	.xword	0xcbedd15704e8ee0e
	.xword	0xeefb9449bfb0ecdb
	.xword	0xf7fc8606fd0767e9
	.xword	0x132faac32a1ee50a
	.xword	0x833868ce94b39b59
	.xword	0x53e4c156c78688aa
	.xword	0xa46afaafa9dc5b89
	.xword	0x43f97a854b0eee5d
	.xword	0xdb443c487bbf77d2
	.xword	0x396e98cde50eabd9
	.xword	0x3d9fe1b412dffb7f
	.xword	0xe1766649f362e240
	.xword	0xa68c79d9e68b226e
	.xword	0x12cb977699e6fe71
	.xword	0xb48ac1f130497691
	.xword	0xce6bdceb708595b3
	.xword	0x25fb62a61993dcc2
	.xword	0x3f491f22bd5fc1ea
	.xword	0x3154855e35a65b6e
	.xword	0x482dd5d2f09b33fc
	.xword	0xced8d58a223b5f57
	.xword	0x9e3f0de07af6493b
	.xword	0x9c0a1ecd45792b17
	.xword	0xc27d7c3066b5fe4f
	.xword	0x033eff46acdad0af
	.xword	0xd69566fac74f6bc1
	.xword	0x2b1901672712d9d9
	.xword	0x9edd26474fda9bc7
	.xword	0x2375681e75b42306
	.xword	0x58446f5345701ce6
	.xword	0x30ae9ac6e4ee5e58
	.xword	0x9706f6b29ba3401e
	.xword	0x20e047ba0181c6a6
	.xword	0x89607cd159f19f2b
	.xword	0x501911d5c1a8df15
	.xword	0x67f8ca1ee532f875
	.xword	0x6dc63412f1671eea
	.xword	0x68b047d40973b1d2
	.xword	0x963381dab66acb2b
	.xword	0x8fea2edb59db5edf
	.xword	0x5b1e9439faff41a3
	.xword	0x92a64cb22e2cfabe
	.xword	0x3775112e7f616b6d
	.xword	0x5d08bcf01d83ba0a
	.xword	0xf77fb7fe25e5166c
	.xword	0xa1c9ae1ceeb7b648
	.xword	0x50138ce02ce8b001
	.xword	0xbe6a01a76f8f4001
	.xword	0xc7c74347be7e1ac3
	.xword	0x98d82e69c1b01468
	.xword	0xd4b374209417c553
	.xword	0xaff51c840eaa6b15
	.xword	0xb6c671fce7c91dff
	.xword	0xf86aa2a28c3b7a39
	.xword	0x52cfad9de68524e8
	.xword	0xa9397f8e92a6e30d
	.xword	0x1cc875bc663c708f
	.xword	0xb6b129acfc95aba5
	.xword	0x58933e804bc0b391
	.xword	0x16dc72d3d948cb80
	.xword	0xec4d5b80a21042a3
	.xword	0xfdb307848bba1f5c
	.xword	0x87a0734a2850261f
	.xword	0x9bff60b8ca21771a
	.xword	0x0a25e415892f3770
	.xword	0x9590339fcdc49cfc
	.xword	0xf4bc7ec894e4c1a7
	.xword	0xcb9aa53d1248f25d
	.xword	0xde3e89900cc96ac9
	.xword	0x01690b619d4b8cac
	.xword	0x9ca884c03539e64a
	.xword	0x8cd79a98dcfe1717
	.xword	0xd6ae1463f911728a
	.xword	0xa8d735448fd6e7ef
	.xword	0x2b3211c6b9e419a4
	.xword	0x94aee2ee73462ba9
	.xword	0x8fd79fcf121d189b
	.xword	0xdf111ee24d98e9dc
	.xword	0x26c7f975d5c074f3
	.xword	0x065b2d8365392573
	.xword	0x36a8edf7b0a7b767
	.xword	0x9b0399b6e253d50f
	.xword	0x98eae8867c4be851
	.xword	0x0bdb03e284d9259d
	.xword	0xf46c59e84b00fe1d
	.xword	0xe785191063be0696
	.xword	0x6ce7e42e16fa628e
	.xword	0x06f345448bd2d0c5
	.xword	0x2477d213383b404d
	.xword	0x4dd90d2be6372445
	.xword	0x7acf5a5bff0b9fc6
	.xword	0x644365b4d7255226
	.xword	0xe50f4423d50be545
	.xword	0x7661207f0c0407e2
	.xword	0xea0a6915e0e836e4
	.xword	0x9c07fdd50f63dbb4
	.xword	0xb9e2edbeb2a5c332
	.xword	0x1987825f5c53e9fd
	.xword	0x95d89717b81ccf4a
	.xword	0x987c8eb13b387326
	.xword	0x83291982297df359
	.xword	0x66da811bc780a431
	.xword	0x0e1010bafb85c225
	.xword	0x3fc33fb92f79edec
	.xword	0xce232b966a62fb42
	.xword	0xaed2d15e29581a07
	.xword	0x838e74aa98ea6d77
	.xword	0x417b7dadf62b269d
	.xword	0xff4096b3146d5e02
	.xword	0x394a78f4e979a125
	.xword	0x80e006f1232b86b7
	.xword	0xed66efe9661f11e5
	.xword	0xb7802c42b77ab313
	.xword	0x3d51cdeb837ee4c3
	.xword	0xf4f039e1301688da
	.xword	0xdaca2043b3d2d76d
	.xword	0x3dcd21238ee2d698
	.xword	0x784e34f818e51141
	.xword	0x1782c1796c90818e
	.xword	0xde765af9dd4ede31
	.xword	0xc9cd852894df94a9
	.xword	0x11b804b3ff73ec5d
	.align 0x2000
	.data
data_start_1:

	.xword	0x097ef059f75078ac
	.xword	0x77ca5600faf556e9
	.xword	0x6c3b7d145816fdae
	.xword	0xaad54d3a6c8028f3
	.xword	0x7f7fa3392b8f7ad3
	.xword	0x950565bac0f6b061
	.xword	0x4512d4fb74bbe2b7
	.xword	0xc96f76af5b7407f9
	.xword	0x8c6c15a4c703ba33
	.xword	0x7ebd7421c08c8696
	.xword	0xe379e30b36053f5c
	.xword	0x480ba7244dc0fbe2
	.xword	0xe9c4322ee5c51779
	.xword	0xdd6d9559c5b5fe29
	.xword	0xdb415d98d7215752
	.xword	0xba577c7a95d3720c
	.xword	0x70e2ceee92a3a219
	.xword	0xace1d64bda44af79
	.xword	0xf957a500f9a54a49
	.xword	0xef93ca0227fd187d
	.xword	0xdc82b43775c810c6
	.xword	0x1237c9d1197ac617
	.xword	0xf06f8ab3be8c04a0
	.xword	0x0c3996d4b3dc8801
	.xword	0x58719a6f8235454d
	.xword	0xc64145e8d7c24a17
	.xword	0x9f94580b2c43cc38
	.xword	0xff94802e58c205a3
	.xword	0x4502895bdde80df2
	.xword	0x986ddbff8c11d258
	.xword	0x856e93a1d3a51411
	.xword	0x8801a009d425838b
	.xword	0xa4f678d2a458b23e
	.xword	0x4e63543f26374492
	.xword	0x82502cb6e2694743
	.xword	0x6b8643af79033e86
	.xword	0x59827be641a9e809
	.xword	0x4228388d55294a59
	.xword	0xaa871959cb22ea01
	.xword	0x5594175ed0b9884b
	.xword	0xbf504ae2eb04fd4d
	.xword	0xd4426be265b054db
	.xword	0x2d80ede54360e2b8
	.xword	0xdcf395465efb41d0
	.xword	0x1d97832f468402c2
	.xword	0x0f8034f61b91bbe5
	.xword	0xe9f372cb5be0d56f
	.xword	0xc0d11367e97de870
	.xword	0xfd2b6243f5f8b55d
	.xword	0x021cf7424b2d0f07
	.xword	0x3845f7e9982039c4
	.xword	0x6dfb38961faa1c75
	.xword	0xef1a98ee450eaba3
	.xword	0x79b4907099a5d779
	.xword	0x496dfe703e7464c5
	.xword	0xeee81ee32074269c
	.xword	0x3626200bd9a053ec
	.xword	0x595c43f10e8e7cbc
	.xword	0x742066b757cab315
	.xword	0x8d092ff9219e643b
	.xword	0x18df1c9c20c515b8
	.xword	0x809c15869baacf52
	.xword	0xd3660624fdecb5ba
	.xword	0x607e63475760bb8c
	.xword	0x29afd113138c44e8
	.xword	0x9499165439620ce5
	.xword	0xcb6446a6eca2d3c0
	.xword	0x5b372b37a7f15658
	.xword	0xce49c334c4648bb1
	.xword	0xd8c2c4129779ea1d
	.xword	0x2f8a232f6f5fc50b
	.xword	0x54230e62d75f992c
	.xword	0x9930f47614ba4a1d
	.xword	0xab3f4f2f57e3c71a
	.xword	0x53fff4f322dc85ac
	.xword	0xa946dbd7b5e92fc3
	.xword	0x24b80e6b594d0e6c
	.xword	0xfa296abaf2507552
	.xword	0x22a2364fed121a55
	.xword	0xce8d76835791dcee
	.xword	0xf89384dc9623441c
	.xword	0x48dd62d4e8afa854
	.xword	0xc663720b6b45ee09
	.xword	0x78bd69a7ed03fd5f
	.xword	0x3a72aa6c0b4885a8
	.xword	0xa4a446f0c26f73df
	.xword	0x6a35b1b34491ad5e
	.xword	0x704eb20ab3270f32
	.xword	0x711b6ae07f18f37d
	.xword	0x1b31e561aa3ee5ed
	.xword	0x548bc4d950754dbb
	.xword	0xf4dea499b2a80508
	.xword	0xee6d086b31fca124
	.xword	0x3e3ea74653b88bce
	.xword	0x4182ef507afc7cf4
	.xword	0xb580d8eb06683f9b
	.xword	0xab85268e66715cfd
	.xword	0x1444189e7c30ce6a
	.xword	0x0be6f0e1b8ba53d9
	.xword	0xda34e87a564e9227
	.xword	0xf27c9a669c15ba53
	.xword	0x128e2deb5c9f75f2
	.xword	0x7b75e88f02e50fe7
	.xword	0x894b2a6b2982c7a9
	.xword	0x39d06f85470aa19a
	.xword	0xc7ade625e48a41f2
	.xword	0x0d4bdefe2a1d2bd0
	.xword	0x106a6ea70d253626
	.xword	0xe730c6e38d9896d2
	.xword	0x8f795daf26ce2569
	.xword	0xa247ec9a9dde2c6d
	.xword	0xd9452be6a69a1534
	.xword	0x295db5b24e8069d7
	.xword	0x051bc5bca452e408
	.xword	0xb4d48caf40ffce43
	.xword	0x8448af7855eb8861
	.xword	0xec6392001cc94f92
	.xword	0xf3457c3b3a89ecc9
	.xword	0x354b70b50ed21cb9
	.xword	0x09f53790b87f5ac5
	.xword	0x91534122e569339d
	.xword	0xb53df78e6ce60d4d
	.xword	0x3eab8f4a26563241
	.xword	0x56222bab76c22b44
	.xword	0xc47d1d8bfe57eab2
	.xword	0x0b90d84cf424dc98
	.xword	0x1e0cb533de15fe43
	.xword	0x833885e64bb234f3
	.xword	0xf13a7bacf1562b4a
	.xword	0x06ca62c418880aa0
	.xword	0x592314ffcaef94cf
	.xword	0x64627c5529a51a75
	.xword	0x424553b51b44ef13
	.xword	0x755589056d59808d
	.xword	0xa56e6d258627c615
	.xword	0xbbf18384666e98b7
	.xword	0x09ab0956a777e4db
	.xword	0x7387ddb27102003b
	.xword	0xac3ed83885cd84ec
	.xword	0xf886a0f0625c19be
	.xword	0x1903e4d681a772af
	.xword	0xafdf80b4ef8f77d3
	.xword	0xda85694085e51371
	.xword	0xd554ac58517f762d
	.xword	0x2b308d4f9d7dc333
	.xword	0x25d49344a38e8370
	.xword	0x4fdf9402f43ef83e
	.xword	0x363626c42292357d
	.xword	0x2775ac3286cba6b1
	.xword	0xeec232ad04529cc7
	.xword	0x6c82506017634ef0
	.xword	0x237ec264e282d40e
	.xword	0xf55806275e132d20
	.xword	0x7420d4bf3f267c10
	.xword	0xe29d53fc1d5fc512
	.xword	0xfcdea22cff244af2
	.xword	0xc8512d829f1bafe0
	.xword	0xb23fb14757d67d0f
	.xword	0x690bc08b25ac5530
	.xword	0x70bb53fd65f801f0
	.xword	0x2303461f6594754e
	.xword	0x0576fbea7ee2ed60
	.xword	0x783de778ae93e1c2
	.xword	0x45319dddfad554f2
	.xword	0x1f3272d8fbe3a5bd
	.xword	0x4e9f2ea005febb18
	.xword	0x1b340824e7c9cd4b
	.xword	0xf8e6b6d2441d54b7
	.xword	0xa69555504632a1a3
	.xword	0x6012c12cb0ceab2e
	.xword	0x53fe701e42274493
	.xword	0xbaaf5b4f665a0794
	.xword	0x9f4f9667078d2b8c
	.xword	0x315d21861e539ab7
	.xword	0x3b224803979a7444
	.xword	0x72df6262356f453a
	.xword	0xddf2edcb78ccc7b1
	.xword	0xba31a7bb1a639968
	.xword	0xcb38d70a4d32260b
	.xword	0x39744a0c32c8c49f
	.xword	0xaeae1ce88d55d193
	.xword	0x702b6dbeada81d31
	.xword	0xf528e35b2bd38159
	.xword	0xb09852fd90a608ec
	.xword	0x405627d7d922932a
	.xword	0xe14db1f0b0b4b4bf
	.xword	0x420991c68182f0cc
	.xword	0xd7767100a5c0df3e
	.xword	0x37db47423e21a046
	.xword	0xd64464b8c6de3c98
	.xword	0x9b5ac3bf361c90af
	.xword	0x8233dab66ce2cd01
	.xword	0x0ee49bf2d05ed10e
	.xword	0xe8dbe2155e3f479a
	.xword	0x36d1ed4414c6357a
	.xword	0x3a8109c462ca761e
	.xword	0x06bcf82cf8d91690
	.xword	0x25b6b2f7b9d615a7
	.xword	0x2434c35b2cf1df84
	.xword	0xb3fed12b8eadd058
	.xword	0x413406c9490ccb2a
	.xword	0x50c426c43400e5df
	.xword	0xe2535bf0dd3948d1
	.xword	0x9816af746c16377b
	.xword	0xd8654a52c14d5997
	.xword	0xe8515664b90318e4
	.xword	0xee5fc3e868d6c407
	.xword	0x9e42db3e6f99c478
	.xword	0xa073306be325c327
	.xword	0x700d65cd7da547e7
	.xword	0x4d76a2b8fce5b636
	.xword	0x7fe89b13fbed9094
	.xword	0xfd38160e113ada60
	.xword	0xb19ed76926f93b50
	.xword	0xe3e28bc2726f4026
	.xword	0x1bdbe7fb7d967688
	.xword	0x45a98685d9cc5d34
	.xword	0x7d6788039a0b0e37
	.xword	0x7d2f4e72223e8812
	.xword	0x68138f9d32c349c2
	.xword	0x1a6d4980d8bed821
	.xword	0xf76fb53a274c3e94
	.xword	0x23f824fdd8d188fd
	.xword	0x28ef7c23a2d517bd
	.xword	0xbd1b7271c1734cba
	.xword	0xeecbc2a1cd9d0019
	.xword	0xc016d5249619fd9c
	.xword	0x1c03ac9933d975e9
	.xword	0x8767c8f7b87db262
	.xword	0xc07e6dff66023fbf
	.xword	0x3781a71dd2c00410
	.xword	0x18be2cb6cf3916be
	.xword	0xdba9aaf354224781
	.xword	0x5b94af1149fbafff
	.xword	0x283b4f85e17ce2dc
	.xword	0xfb995d23b9d75552
	.xword	0xf0f2183ece44fb54
	.xword	0xbfa67f1d2a8aed04
	.xword	0xcaab5815091daa82
	.xword	0xb69f29b1aea839c0
	.xword	0x28fb807b0093c1ee
	.xword	0x42ae1a87a74dd73c
	.xword	0xdaf569c30614feba
	.xword	0xe60b37df72388655
	.xword	0xc05402c3f016fb4c
	.xword	0x23d6135c6a3f7413
	.xword	0xa2784da42a6d39b4
	.xword	0x126c94d227fefd78
	.xword	0x7e1fb0cb5c97cc4b
	.xword	0xccdec7ae8ba26b5c
	.xword	0x72e3c32827c3f0a4
	.xword	0xc03a99a9c1093fba
	.xword	0x424229c57c56ca54
	.xword	0x2fae1675dda6a0df
	.xword	0x2bba0364d4646a4f
	.xword	0xba2f8f631957cc88
	.align 0x4000
	.data
data_start_2:

	.xword	0xa18c8ceba8ae47c6
	.xword	0xd979c1c3988dd6ae
	.xword	0x91de12399545f5fc
	.xword	0x851c11359549aad6
	.xword	0x84228c0aacc72cab
	.xword	0x4694a067ceb818ca
	.xword	0xf94931577b6e2503
	.xword	0xdf3c07b4dc705a02
	.xword	0x39196cbbdc845c0e
	.xword	0xf4b65b7ddede69d3
	.xword	0x78c61d0f70fcd2c6
	.xword	0xbbfa1736e6191ca2
	.xword	0x6c70175182a98418
	.xword	0xdb43b7c1a383659d
	.xword	0xbeead88e925ffa8b
	.xword	0x3332e63128a99841
	.xword	0x4b340cbb4e21eb41
	.xword	0xd20f78d6bce91056
	.xword	0xdda9276fd98f98ad
	.xword	0x11c5282b018221df
	.xword	0xdb4476813e65c03f
	.xword	0x42ca7d37debeb6d9
	.xword	0x5ada7eca678b6f3c
	.xword	0x19f448fd28eb26c9
	.xword	0xb61e8e5aa4bfb2a4
	.xword	0xf447ca5063a41d24
	.xword	0x1b7c8b719cb68e80
	.xword	0x18bce5452f83c3e8
	.xword	0xee218ac486d4dec4
	.xword	0x1a80966ca7e1b762
	.xword	0x0c8546dc3eb20359
	.xword	0xf7f43825cb77a8dd
	.xword	0xae7172ee1c801f43
	.xword	0x249462dd7b82a011
	.xword	0x72d335d07840447b
	.xword	0x021427402c0c5191
	.xword	0xb8e50b213a1f3d0a
	.xword	0x1b2ba739b4e81c2f
	.xword	0xdaaf5067ec75ab72
	.xword	0xec7e67f99cbcec50
	.xword	0x7c79be127458bf48
	.xword	0xba1028997898a413
	.xword	0x8b8ef75d2fd9a93b
	.xword	0x9ab069e33da0c1bc
	.xword	0x7baeaf81ee84289e
	.xword	0xeb0d73f7e2c136b5
	.xword	0xbeaed0cb7b96b6d0
	.xword	0xac113a9ff4fd1321
	.xword	0xeaee50c702d3cfba
	.xword	0x4ed78130bbba7196
	.xword	0x024a41307c631c06
	.xword	0x0778ee770500574a
	.xword	0xb5bb1153cfb456fa
	.xword	0xc8c9fd86e9cd5c64
	.xword	0xcd04479c578ad6de
	.xword	0x34f862b73e189682
	.xword	0xd02ce879a2535807
	.xword	0xfb523d30218312b3
	.xword	0x69415d6070b54d7a
	.xword	0x3ac3032cb21bb8d1
	.xword	0x15788f8f33b7fc15
	.xword	0x4cec5cf0e38e645a
	.xword	0x80d6c304254e2707
	.xword	0x4641874ae9917075
	.xword	0x19bd372a1337e4a6
	.xword	0x1ad4c84616caff6e
	.xword	0x141c9d8fcbddfc61
	.xword	0x1d7d19e0d0fc9f86
	.xword	0xa6e339726de1c280
	.xword	0x620e33f7abf94e2f
	.xword	0x25b5a75bf239f3ce
	.xword	0x4fdf5fe4d8d7648e
	.xword	0x5f87cd92e25d9b30
	.xword	0x0b9f89a482253791
	.xword	0x6dd88f7e37274330
	.xword	0x097d385cee625b58
	.xword	0x3a163448f27a6a2c
	.xword	0xfecccfab03bac534
	.xword	0x85cf24ffec20f42d
	.xword	0xe1a27773d50cfb8f
	.xword	0x329b3a4d2f12f5fe
	.xword	0x3d4e9a176a3522ff
	.xword	0x27cb2d34b8bcc643
	.xword	0xa71dd83745c6b9de
	.xword	0x8f508f9883d06604
	.xword	0xed1339201ca57a0e
	.xword	0xea1a10ab015877d0
	.xword	0xc6574863cccbf5f1
	.xword	0x8305d71de9162e63
	.xword	0xd09e6e36a9bbcfb8
	.xword	0x182852264ee523a5
	.xword	0x43b32f108567cc40
	.xword	0x984b073cdf375edf
	.xword	0x94b03df16fb136ca
	.xword	0xade95998ee280d5e
	.xword	0x343065203f1ccdc9
	.xword	0xe6131ac40d16368d
	.xword	0x2adafbab78cfadc4
	.xword	0x343f84bb40750039
	.xword	0x78ebe67dd76e9949
	.xword	0xfc928b473da6c38d
	.xword	0x8c7b03c6aa72be31
	.xword	0x17aaef63fefae8d5
	.xword	0xb0aece183a157712
	.xword	0x22bd590fa33ff681
	.xword	0x1daee7a881296feb
	.xword	0x9316e054b436c864
	.xword	0xd15d450bac60f7d7
	.xword	0x6412aee3de1a5596
	.xword	0x10f6a04ad46710d8
	.xword	0xab2312eaae3c2b26
	.xword	0xe0eca51203844c43
	.xword	0xc411c127a76c6ce1
	.xword	0x8db6e918c8f0f72b
	.xword	0x0e0d6046eb8d107e
	.xword	0x58cdf2a3f58a513a
	.xword	0x805894c364ce678d
	.xword	0x111f7b6634a9c2dc
	.xword	0x6c8113726ad75a79
	.xword	0x65ce92db161b169e
	.xword	0xd06a43329eed491f
	.xword	0x5bf63f3d9042c916
	.xword	0xe946a14a0970abb6
	.xword	0x3b8e8c00211b9e63
	.xword	0x0e82aea80d78e01a
	.xword	0xaeb2ac706dc83ce9
	.xword	0x28dab86858ca7bd1
	.xword	0x227baa99cdfb5d1f
	.xword	0xcb4b603062422145
	.xword	0x28827906625ecb06
	.xword	0x29cd6971b1547108
	.xword	0x6db26e670aeb2571
	.xword	0xd94fb6d51ef70349
	.xword	0xb5f63f4d8f371479
	.xword	0x050871037ee2f667
	.xword	0x003fb18f803105ea
	.xword	0x91b3776d234ffe33
	.xword	0x6416e966c5eb43cd
	.xword	0x3388f8f0d998c7ef
	.xword	0xb00cfff69859a11d
	.xword	0xc79e53c53229b646
	.xword	0xc260e3da7c3d35bd
	.xword	0xe05aef89c0ae2b91
	.xword	0x8b2c1604a7ad52d2
	.xword	0xd51e6ac6fd5dacb9
	.xword	0xd6b8c6ccc84e8844
	.xword	0x22163af0167272f9
	.xword	0x493ba742b3c3b26e
	.xword	0x416071166246136a
	.xword	0xeedbe24cf91cd0c0
	.xword	0xec286f3cfb8a5c7b
	.xword	0x5d8bcd081f73f235
	.xword	0xd6ebd45a499e003d
	.xword	0x336ad0cc5ee17d2e
	.xword	0xe7505710cc6fcf0f
	.xword	0x8eefe2d32380620a
	.xword	0x5c506a324b248966
	.xword	0x7a90135df6f8e370
	.xword	0x7d39e226d2aaf39a
	.xword	0x93b65919505adfb7
	.xword	0x377f0087f0d3dac9
	.xword	0xb2ce3459bab773c0
	.xword	0x4d7b5f52fe229e2d
	.xword	0x1e75c6a4ad9c7e22
	.xword	0x68ed9999cf1cc930
	.xword	0x6d1e7beab5b09234
	.xword	0xdc5e51ec2b49cd8b
	.xword	0x8ca1ce268a2758a2
	.xword	0x9b5eeccd02383ae2
	.xword	0x582f6c60b058afcb
	.xword	0x0ddf5831806f7945
	.xword	0x2d598f1c4b290d51
	.xword	0x2017df00da4c0bb7
	.xword	0xa4f206799a002268
	.xword	0x4127319d4dfe8684
	.xword	0x6612c9255c8be585
	.xword	0x6c2d65e8d0beb563
	.xword	0x8ccf7eec10f651dc
	.xword	0xa2d49b61a2119022
	.xword	0x338a44ab95146cd4
	.xword	0xda310917ce9f7fdb
	.xword	0x552ab222f89babba
	.xword	0x86721d92d3425804
	.xword	0x30b3c5df3624fbac
	.xword	0xdf7e7e44f800b3a3
	.xword	0x42ffda8f86a280cd
	.xword	0xa26f560f2c37c938
	.xword	0x9d17e340890d492c
	.xword	0xa46bd3d78cb1f884
	.xword	0x8b9f58653020755b
	.xword	0x775c2c0539a98fa6
	.xword	0x7f27dbc974efe183
	.xword	0x6bab3775219fde10
	.xword	0x226a1a494b18551b
	.xword	0xaea3b787afded3fb
	.xword	0x1c8fd2ff54a61d60
	.xword	0xa4981b9196a11058
	.xword	0xfd143e1541e28fe1
	.xword	0xf6f6acf4fbc09f29
	.xword	0x2d339bc9ead86726
	.xword	0x6245657b84bdc08e
	.xword	0x4042777fb0c7ab99
	.xword	0x7f0dddbcf59c9cf5
	.xword	0xd6b6b75ec242c3e3
	.xword	0xc20dec0d18735f4b
	.xword	0x6c4a51a346f9e86f
	.xword	0x59e640d0abbaa9ae
	.xword	0x8856032ec024533c
	.xword	0x19b681cb3201a421
	.xword	0xe46a661b07d8a6f3
	.xword	0xc1a16a247cdc4164
	.xword	0x254d649986a8eb36
	.xword	0xaff6ce8164abb9c2
	.xword	0x7090582211877872
	.xword	0xaefcc6719f006fcf
	.xword	0x3ec188d3d840ef74
	.xword	0xc8195c4d08321f81
	.xword	0x9bc4f391f9f7df6f
	.xword	0x02723996e3c404cd
	.xword	0x55773d92ef827ab0
	.xword	0x92683cf91d76a7ef
	.xword	0x22340940d1dad9a1
	.xword	0xceb5475ac405305c
	.xword	0x90a8d2e2ef9d2b76
	.xword	0x7c6f5d01562053db
	.xword	0xccf26b3727b7b68d
	.xword	0x3ae11d33f076cb5e
	.xword	0x68df5cc218b4eac3
	.xword	0x0dcd09a66ec9e885
	.xword	0xd5feea9516a0b191
	.xword	0x63ef54f43d38c4ab
	.xword	0x84ee87512833d5cc
	.xword	0xb7bfac9092f6513a
	.xword	0xf208bdedefdf0918
	.xword	0xa00567bc1f22ee18
	.xword	0x34923ac7dc329664
	.xword	0x9e4448befa13eff8
	.xword	0x527caee81e6e23fa
	.xword	0xd94e0523cdbe1b53
	.xword	0x5a09f13ba6d137e1
	.xword	0x1394eae6d21ddb8b
	.xword	0x7662f4d7392b9b6d
	.xword	0x8841286743caea1f
	.xword	0xdb0077adb6fae035
	.xword	0xff58fbb75bbdfaaa
	.xword	0x5a810935f5d2e1cd
	.xword	0x212ba9ede354b51a
	.xword	0xf8809c19b8556a81
	.xword	0xbbf40b1c693478e8
	.xword	0xe14b939bbdeadc84
	.xword	0x240c48dde8478dfb
	.xword	0xbd822aefbda735a4
	.xword	0x4dc9d5a2070c6e49
	.xword	0x673b4dee4ed18355
	.xword	0xf67bdff7d27ccf95
	.xword	0xa73f50c8361f0085
	.align 0x8000
	.data
data_start_3:

	.xword	0x2c61d9772b739189
	.xword	0x626992eebcdb9688
	.xword	0xe0734167fe6fc93d
	.xword	0x0e2311b60ca5889f
	.xword	0x0570e0660c336294
	.xword	0x577dfc7b02cf155b
	.xword	0x428a07706ac25266
	.xword	0xcc248265f25d7cf8
	.xword	0x200d2c43ab6cbbbd
	.xword	0x2de23655b032c348
	.xword	0x907856da80f48938
	.xword	0x01045ac554bf8e53
	.xword	0x0769e12b07754a42
	.xword	0xc54cd75ba1f7a717
	.xword	0x0d67e8977ca7bc6f
	.xword	0x5d3985b57a6919be
	.xword	0xc35847a4435f3493
	.xword	0x006c9a7f67aea95e
	.xword	0xf3c52cca4f759596
	.xword	0x5211fb31bb6df05a
	.xword	0x248f8d09ed183230
	.xword	0xee45f9d006308800
	.xword	0xf3158f99ee7ae5c6
	.xword	0x5830245001a0d9b9
	.xword	0xc7d9238b325bad9f
	.xword	0xaa2dae1df8095ad2
	.xword	0xaef63a3bd30473da
	.xword	0x25104868bf3055d5
	.xword	0x27eea3f0d8ec369b
	.xword	0x28db8bb271c3e8a1
	.xword	0x43678008d6126a62
	.xword	0x7d406326bc3394ae
	.xword	0x2fcc1ed03704616a
	.xword	0x5f4c21a01ec8747f
	.xword	0xf95d034986ee545c
	.xword	0x6f078d0f81639bdc
	.xword	0xcf1400ba47a82da0
	.xword	0xa8d0928f1e809e3e
	.xword	0xe74ba9cfdbb2bf11
	.xword	0xf52452de3da728ea
	.xword	0xef989ee8b4590eb0
	.xword	0x8b534b2d8dad7f0a
	.xword	0x056be64168df082b
	.xword	0x2b111c965b9d72b9
	.xword	0x37c862edaf7da618
	.xword	0xad07f65960b8d006
	.xword	0xdd58d6c3627f0661
	.xword	0xd45da8e83cd6ee25
	.xword	0xd609bae59ac10b2c
	.xword	0xf56b5e4a71c0490e
	.xword	0x3fa56772dcd6723b
	.xword	0xf82fac87809bcb26
	.xword	0xc9b0bd13b22cda0c
	.xword	0x29cc32526c2029f8
	.xword	0x8fa764fdc4141897
	.xword	0x74022603068af5fb
	.xword	0x5f75582087d6f38e
	.xword	0x14bdf1e03ca45f88
	.xword	0xd96c44db2715bd07
	.xword	0xb5b23b3ccb127fe2
	.xword	0x8813e830fb94ef41
	.xword	0x6800707eb892899a
	.xword	0x4dfecd04cd0d41ed
	.xword	0x43ce1dd95f082e09
	.xword	0xf5353430c927b9d2
	.xword	0x4b4b32abb3200c01
	.xword	0x9007a88e1b00b692
	.xword	0xcfba910233de87a1
	.xword	0x24adf6f980b7b544
	.xword	0xf70260095567ad37
	.xword	0xb42be5c3f42ce60d
	.xword	0xb570d57e29f7e1d7
	.xword	0xa88b38c2e0386dfc
	.xword	0x9c54c4a0d0014007
	.xword	0x0fd23584d490401d
	.xword	0x1488cfedbdff2253
	.xword	0x7195277d5037a99a
	.xword	0x0d4e376bde779061
	.xword	0x6ade22d46e248253
	.xword	0xb282855e7a3888cc
	.xword	0x223a4487d57d628a
	.xword	0x92586f02c4c130d3
	.xword	0xdd8835b2d20a4a9e
	.xword	0x535a138135c12401
	.xword	0x7ea3c7efca0feed1
	.xword	0x26fbb1c5695d8b78
	.xword	0x46f182def407324d
	.xword	0x7b26619a583321a3
	.xword	0xb994a8e089c83cd7
	.xword	0xa5cdfcf17ff5db07
	.xword	0xe8a8b781987100d4
	.xword	0x073a2e868d0a26df
	.xword	0x24807a965af24719
	.xword	0x321a8d34a49be5fd
	.xword	0x20e9f7ec1fa37579
	.xword	0x13dda2dde2791850
	.xword	0x4a1bded9cd5ad3d9
	.xword	0x149bea2cfe2b946e
	.xword	0x86e41a09a4d3033e
	.xword	0xffbe2562c4ae1ef5
	.xword	0x9b6aac5ecbdef044
	.xword	0xc0c6eb1c786a8420
	.xword	0x19e383fcad29cfb0
	.xword	0xcdc227f851e2cedf
	.xword	0x9ecc6ce75e923bd6
	.xword	0x8ddf9838eeacb69c
	.xword	0x9c31e8649166f42a
	.xword	0xa58aa4210cf1cf31
	.xword	0xe11d292ff3c58c39
	.xword	0xaee6498a017a4e09
	.xword	0x7bb4cb93e37ce7f3
	.xword	0x048ea2f5a2db7485
	.xword	0x7f2fd5e74941219b
	.xword	0x7993c4e95a9fdfe9
	.xword	0xb08adc5a302978a4
	.xword	0xa0f5349a5f311f97
	.xword	0x444c7b0b9f1d8be1
	.xword	0x56936a7334e33828
	.xword	0xaeadf25d9d5a6362
	.xword	0xab49af32990d3fd2
	.xword	0xb391babf2ceee370
	.xword	0xf047f679c0b3def4
	.xword	0x200347cfe71e91c6
	.xword	0x985524d6af4e3fc9
	.xword	0x04769ccdfd4ea2e3
	.xword	0xac7e950fb4035db8
	.xword	0x3558e03e72272b9f
	.xword	0xdc7c9c0c0f3b1eb6
	.xword	0x1322bb5de9075e1d
	.xword	0xb0ed079f39824df1
	.xword	0x6e4b9273a9873632
	.xword	0x11ab5e399fe599fb
	.xword	0xf1f3eb29f7904492
	.xword	0x9caeb12bbbbc49ff
	.xword	0x77cb3f7ebe5bb601
	.xword	0x41b68db168a709be
	.xword	0x43bde87d192f4726
	.xword	0xb080b0cff3140a00
	.xword	0xd3ed60188bdf0df8
	.xword	0x4cb24039d4866d5b
	.xword	0xdc0e1afaa097a715
	.xword	0xb35841337b896cc2
	.xword	0x249de61ecc6be1c4
	.xword	0xea5408ec45824d8a
	.xword	0x62be082e3df483c9
	.xword	0x566b71987224e655
	.xword	0x97998444b5687716
	.xword	0xb453fc4d2c44d2e6
	.xword	0x8d5c45128718d4e1
	.xword	0x85f651a705c898dc
	.xword	0x27e0a526b79a7d2e
	.xword	0xb4c6f6d24a437d7d
	.xword	0xa398497727382c60
	.xword	0x514b2abdfad0e16b
	.xword	0x568089385d4f5b9a
	.xword	0x11a2d34c73332da2
	.xword	0x4ca729b6039176e0
	.xword	0xb4b8dbca8e3857ec
	.xword	0xed06ac7374cbdcf9
	.xword	0x08300af283ac9b99
	.xword	0x6f967146f8155447
	.xword	0x46d46aeff702ad84
	.xword	0x780a8e4ec327b9fe
	.xword	0x9223d974b58d4b27
	.xword	0xf36627e3d01aaec1
	.xword	0xbb4edeea433da847
	.xword	0x503de36dd2d8fb23
	.xword	0x6712c4c7cf618705
	.xword	0xcaa262496653aedb
	.xword	0x3c2d8ff8a011dbe3
	.xword	0x3d622f57604b99eb
	.xword	0xf8500448a5365538
	.xword	0x7747ec1afcd9c7b1
	.xword	0xec0a00d768849cc1
	.xword	0x9edf30418ceac803
	.xword	0xbad096e903a8190d
	.xword	0x3d4e6f0f5b36b951
	.xword	0xd03da86d7f6da76d
	.xword	0x34a7f3d52ddd1e76
	.xword	0x735396ae5394b691
	.xword	0xb3a612fd78ea3160
	.xword	0x413c560b8e21729b
	.xword	0x0d64b630e6424001
	.xword	0x0f63b83a3a2ee8f8
	.xword	0xb6e5c750d83d364c
	.xword	0xe74969de22ecaa83
	.xword	0x09688c9088567b8b
	.xword	0xfd497a9cd5e5601e
	.xword	0x905f3e4e3ff56d7f
	.xword	0x06b69d78dc12982f
	.xword	0x2dfaf38f49b3a070
	.xword	0x3c0ab0119255c8bf
	.xword	0xf96bb5fae6338cf3
	.xword	0x4ec12a845782502d
	.xword	0x7c314f6b947d9352
	.xword	0x63dff424a7dd3db8
	.xword	0xe2edf696f1408c1a
	.xword	0xfa547fdf1b965d80
	.xword	0xa272d70da8266a8b
	.xword	0x15336fcafc6aa8aa
	.xword	0x321355a247200fc8
	.xword	0x5303a8e47bf1b46b
	.xword	0xbc5b7405b5e65d62
	.xword	0x2e9eff1c312471ca
	.xword	0xaef14b8ef76f27f8
	.xword	0xe08e20eb5876930c
	.xword	0x9adb002422530e92
	.xword	0x32fc814182fcf778
	.xword	0xd91d2a0f4792e220
	.xword	0x08ccb565c80abca4
	.xword	0x1fa8ec7e96b9d85c
	.xword	0x9e5a0c5737a4ea1f
	.xword	0x994e2b17eb3a16e8
	.xword	0xd857a1e53d8615de
	.xword	0x968255fa5522771e
	.xword	0xecf2c21d1493d279
	.xword	0x57c66f0d7dbe8d7a
	.xword	0x57ed42f5e73da690
	.xword	0xeca56aab31ad822e
	.xword	0xc6315960c3bc8a63
	.xword	0x2475b56c352f9b16
	.xword	0xbdb1503d7aa82f23
	.xword	0x527b775478571911
	.xword	0x4654268ca487a3ad
	.xword	0x5d60b9987204e573
	.xword	0x70f293c1af15f0ef
	.xword	0xc24331a87a923978
	.xword	0xbb36a009c521566b
	.xword	0xbd4930cf97c21889
	.xword	0x65ceb08797f58315
	.xword	0x9a5145b579fa3b7c
	.xword	0x088699414d935d57
	.xword	0xd2838348a1091b72
	.xword	0xac83ae9862fce4c9
	.xword	0x1d7cde6833d3e019
	.xword	0x0cb3c7c0ad1c098a
	.xword	0x0f6733a76b7cc202
	.xword	0x95cd2098e755dd42
	.xword	0x4a92fada5645e700
	.xword	0xad31df60deff776f
	.xword	0x0a42e55b6496c0c0
	.xword	0x1fdac430561f2662
	.xword	0x449b4358fbc1a690
	.xword	0x2ecc3d148b76c496
	.xword	0x9800d7280a6dc7ee
	.xword	0x82faadec01bdd549
	.xword	0xb55df04d73eb8573
	.xword	0xca37752c2136e549
	.xword	0x47ff18e46a343f87
	.xword	0xf82691019c9c0448
	.xword	0xa764c7243dc6e0b8
	.xword	0xf03990d8919ddcc1
	.xword	0xf2e18c26277209d8
	.xword	0x7547cd928e1dae81
	.xword	0x9a905f69545b63c0
	.xword	0xdf96b98b7d7e4ff2
	.align 0x10000
	.data
data_start_4:

	.xword	0x957337b00481d669
	.xword	0x3ea1da4a159beee8
	.xword	0xfaf7ec75c2fee893
	.xword	0x606c851bdf045009
	.xword	0x33bbfdbe18e35525
	.xword	0xdeb477d0cc4ec649
	.xword	0xa3765b6b601f2c43
	.xword	0x3db2ddafc0c6cb23
	.xword	0x912607a8618dec41
	.xword	0x7e58b64f4bf23605
	.xword	0xa451fedf988b3bfe
	.xword	0xe8ce56eb97cf98a4
	.xword	0x7314507076d9ab1e
	.xword	0xed28b431960af998
	.xword	0xb36c719783aeea32
	.xword	0x18dc9d1685ed8a1d
	.xword	0x546f1da8627e5696
	.xword	0x289d063342e18231
	.xword	0x141f539fae7be159
	.xword	0x6de78d651329dabb
	.xword	0xb498aa1f3d373da5
	.xword	0x538bb0299ed68f4a
	.xword	0x99973813a5a74ae9
	.xword	0xdfbc9eb6f998b0c0
	.xword	0xdb7e2722811c3e43
	.xword	0xee6c73f6a06c2a3f
	.xword	0x7b624b6574672572
	.xword	0x6f3d5d69f814ee1a
	.xword	0xc8e777beb6aa11a7
	.xword	0x39e251d489a02586
	.xword	0xee98cb36640300b9
	.xword	0xe9624fb9fc9db0ce
	.xword	0x4664931979eead6d
	.xword	0x3b3ad70d8cd68f0e
	.xword	0x84e4c341827ddbe6
	.xword	0x1a53386f68029d44
	.xword	0x31da197f493881e4
	.xword	0xac13ee71d24bef64
	.xword	0x152cd0893fd94b00
	.xword	0x98d52e18031d935d
	.xword	0x52f44ca8792b32a4
	.xword	0xc15ce9060c014f64
	.xword	0x3f6402da7d1454ef
	.xword	0xa9ba6e3904c3f807
	.xword	0x21173e1e3b8a3c66
	.xword	0xece9ce781d9cb7d5
	.xword	0x065b8c7cf71705d3
	.xword	0xfd404ff636ed9b6e
	.xword	0xb6b2c942261b7410
	.xword	0x56c67a90c215d361
	.xword	0x5a0cd795744ad2ef
	.xword	0x93dfc7fe517aa945
	.xword	0x1cd3eba2126fdf60
	.xword	0x8c1c474a6e4bd3aa
	.xword	0xa6e92077aef1a03e
	.xword	0x3a34624c7e2e944f
	.xword	0xbcd8fcc311a8838d
	.xword	0xa0666ca65cd86e5e
	.xword	0xb9b90ae8ff207fa2
	.xword	0xe729a3b045b057ee
	.xword	0x323ea8199a267d9d
	.xword	0x3c22fad8d6e96a53
	.xword	0xc0145c6f6282cf1e
	.xword	0xb6684b64f1f0a946
	.xword	0xa11d3d6fd6f80f14
	.xword	0x5c08f728966fc505
	.xword	0xbd4ed80e7de1f79c
	.xword	0x2929e401593cf92d
	.xword	0xb15912ade5d9d94b
	.xword	0x0166043cccb61776
	.xword	0xd9142027fe4b1fa7
	.xword	0x43eff34b77ab58d9
	.xword	0x921eaf289db469ad
	.xword	0xd49950263eff8c9f
	.xword	0x4b75d85b1f4802a3
	.xword	0x88163a045b9b8238
	.xword	0x0f9c9c10b3a27b7d
	.xword	0x0979abbd5380e285
	.xword	0x4b0e761ea47df54b
	.xword	0x2e72bdcfe9346ea0
	.xword	0x70fea3a57e80e43a
	.xword	0xd478f51193185bce
	.xword	0x2f394437759cfab4
	.xword	0x48922e2ea99df4b4
	.xword	0xadb448506c92e10a
	.xword	0x7b78b1cb956e1932
	.xword	0x87be6bbc40733075
	.xword	0xc6438fd8ec45e168
	.xword	0xb70cd9ed07c077aa
	.xword	0x08f6b70b420f23d5
	.xword	0xdbf33a225c1d37ba
	.xword	0x4e5cdbb9b012e720
	.xword	0xd2af913f9110823e
	.xword	0xa9f0abe2bf2fc81a
	.xword	0x5a5916646b6fd056
	.xword	0x2d1ccd5e33f26e70
	.xword	0xf6d9f2a5acc0942d
	.xword	0xa7e5d629538dc944
	.xword	0x97271a3c9b6705c8
	.xword	0x9038fb9ec44dd4b7
	.xword	0x5a282c3a02678f01
	.xword	0x72ccfe9bbcb0abb0
	.xword	0x26b3709d5e1b75e4
	.xword	0x141e340031c0e0a8
	.xword	0x34e0e18a1d71d44b
	.xword	0x7466460577fd1b55
	.xword	0xffd5419a343a6c03
	.xword	0x3a8cbb443e73054a
	.xword	0x88a53ebdcb0e4584
	.xword	0x1fdd9fedc30a3334
	.xword	0x352911e189241795
	.xword	0xc407e31097a07f83
	.xword	0x54f9699521d715ca
	.xword	0x84601578f0dda450
	.xword	0x3e4ed0c19595a1f3
	.xword	0x1321adac70735a89
	.xword	0x0e41ed007cfee13a
	.xword	0x5d325e33a00753fd
	.xword	0xe49fa76264c34d54
	.xword	0xe8006277b1eeed60
	.xword	0x0904c76e5548c72b
	.xword	0x9ad7f10b524751e5
	.xword	0xd9d5d05f50bcc48a
	.xword	0xc67d9da62c02ab5a
	.xword	0x1c711e9e38ed932b
	.xword	0xd9a931b37e8db534
	.xword	0x96d750977c8bc5cd
	.xword	0x66220c62f2215362
	.xword	0x4a99db9b11b21677
	.xword	0x7928d0186785542d
	.xword	0x0f4ffc1d96d1822d
	.xword	0x4bf26e413c5c6074
	.xword	0xbc4b4ddd2ae85801
	.xword	0xeeac7fc200f8b47d
	.xword	0x1f01b7d81741e922
	.xword	0xe26be68b2a9f1104
	.xword	0x40a0ea33fdce81ed
	.xword	0x5ae58feb537501a8
	.xword	0x08ed0589d564b909
	.xword	0x46e11fce6720b558
	.xword	0x7c574e4abe913153
	.xword	0x6d04539b6acc4ece
	.xword	0xfc2c8b31d6de4326
	.xword	0x52c8f20cd998faac
	.xword	0xa3a2823ae7c72ac0
	.xword	0xfc78df81a6538804
	.xword	0x0cf4f5bc27659057
	.xword	0x12699e9e9afdd2ba
	.xword	0x992d228d83901ddb
	.xword	0x582cfd03c3079e8f
	.xword	0xf779386008f509fd
	.xword	0x17ddefd8e5ded06c
	.xword	0x544cfa32d097e188
	.xword	0x1c83f21a73213dc4
	.xword	0xf1cfd9438fed23f2
	.xword	0x711bff44a2f454af
	.xword	0x5b43e2b9e611e4a1
	.xword	0x220aa77f21737e33
	.xword	0xbc1cb44785ab435a
	.xword	0x3a64130a30d29b23
	.xword	0x3e5e15f552514056
	.xword	0xd85333bfd9d89ed9
	.xword	0x334973a4994e75f5
	.xword	0xb438fadfa910aed8
	.xword	0x94ac415e5e2ad2d3
	.xword	0xc1741c5508991ead
	.xword	0x6b572bf707285798
	.xword	0x90c2bee69f296549
	.xword	0x442e9e6d39f6fa6f
	.xword	0xe2d3b43967dfb380
	.xword	0xa8c35cb2870675da
	.xword	0xa6f0e48570f14d14
	.xword	0x4fd2b4ef1f75a5c3
	.xword	0x639a318039d9ca03
	.xword	0x50eac45212d130f2
	.xword	0xa69fd1cd09bf0906
	.xword	0xd5091fa73da722be
	.xword	0x03ec2874a16acda3
	.xword	0x0ac85a3b290c59b2
	.xword	0x2961b289162fae01
	.xword	0x5904104586a0d2f5
	.xword	0xce4bf57a93da99ef
	.xword	0xad4f42b778c5fa7a
	.xword	0xa03096ffd8949c25
	.xword	0x9bd632b7d0d761a2
	.xword	0x4cc07c42430482c4
	.xword	0x730511d7a644a8d9
	.xword	0x519c95b4b70c4970
	.xword	0xa06fde9ee2f67735
	.xword	0xffb57acd3a9c280a
	.xword	0x387b30fd02d62615
	.xword	0xf093b795639dad77
	.xword	0x84d905b92c8706ec
	.xword	0xe1d839560d74cb9c
	.xword	0xabe95146037ab485
	.xword	0x83fc8a56e9c00088
	.xword	0x3a34281cd28125a4
	.xword	0xc7f2a9690103a488
	.xword	0x4022adc2d0dfa13b
	.xword	0x07378f6b5338b040
	.xword	0xb2c74275b838531f
	.xword	0xde36526130e980b3
	.xword	0x525ff692d3fe77b2
	.xword	0x6b7a300da1c78542
	.xword	0xb9f83650d3fa6e04
	.xword	0xc285ce59200a87e3
	.xword	0xbedca46e171765ab
	.xword	0x8fee789f8a549ae1
	.xword	0xd5a3f22040c228dd
	.xword	0x28b106e2e0a1d592
	.xword	0xeed491bf881ec627
	.xword	0x49cfe1bb9f13c50f
	.xword	0x4ac8fb3827b9e845
	.xword	0x53d86def8059abb0
	.xword	0xc35cf87ed3254b0a
	.xword	0x11abfcb23e209dbd
	.xword	0x99282924e4b32787
	.xword	0x0214058d8b7649d3
	.xword	0xaa019f7f9f58e551
	.xword	0x6aff1f0c6b393c18
	.xword	0xd51844fdf5a3d9ad
	.xword	0x30ff45e546a65d10
	.xword	0x3fbaedb24712a7b3
	.xword	0x19ce0ed7bcfae5ff
	.xword	0xc5111a5ca89ce290
	.xword	0x7e38d0374c85b371
	.xword	0x1a68530d19c5febb
	.xword	0x1f609fea35de32b0
	.xword	0xa3e60a1fa7c3f4a7
	.xword	0x53fad86661f3c667
	.xword	0x994822dea40eb49c
	.xword	0x134b52e363082947
	.xword	0xac8e5155f9754842
	.xword	0x2f1442e1b4d03030
	.xword	0x4e68f6597b7fed62
	.xword	0xbcc865531320630f
	.xword	0x64bb274e3fc8e6c8
	.xword	0x8abdf69175809d62
	.xword	0x462ecb80577576c1
	.xword	0x96b9b89b17b87a22
	.xword	0xa0b3f05a378b75f4
	.xword	0xd757114e12ddbf45
	.xword	0xbb9641dee5e65f0b
	.xword	0xc35ba45b71502194
	.xword	0xf970d26339a6eb28
	.xword	0x5a35be99596cc80b
	.xword	0xfe53ef309a0a73ce
	.xword	0x1d9a287bdc02c11c
	.xword	0xc3b0e52d961d1792
	.xword	0x48ab081bb586b2b4
	.xword	0x463d0a1b0f21f468
	.xword	0x0f5c04543fd6a6f7
	.xword	0xff07d607bc969f41
	.xword	0xfd7b257b54139a26
	.xword	0xdb61eb0a8e7f9bf5
	.xword	0x35e115d8d9ce237b
	.align 0x20000
	.data
data_start_5:

	.xword	0x3b74eac02d4be367
	.xword	0xd1e9acdd83c32a89
	.xword	0xfa68573cfdc08850
	.xword	0xc7514c2e4d4f9a93
	.xword	0x5cacbfd70a052064
	.xword	0x689dbea3b7b963b1
	.xword	0x3d045dfd06c6a19e
	.xword	0x9f90befc5d3d09b6
	.xword	0x1b2b3979e709e07e
	.xword	0x401ecc7a08c87df6
	.xword	0x2528d1bfbc3f5376
	.xword	0x3d7d005464267ca4
	.xword	0xe574a3af6ad9dcd7
	.xword	0xa704ab63e1a906da
	.xword	0xcd4f9f3fbdb06c39
	.xword	0xdfa6b773953f0b77
	.xword	0x873af0f02970d41b
	.xword	0x3f1953a543582a14
	.xword	0x12089f9e0674ad4b
	.xword	0xec9c36fefa2aa2ef
	.xword	0xe9d32c7525efcc89
	.xword	0x3466cda8a788de66
	.xword	0x3fccbe35ee39db1b
	.xword	0x078b37dda7dbad0f
	.xword	0xaf1e353967f8c327
	.xword	0x7275c2b49928141b
	.xword	0x8755dc932c149346
	.xword	0x0a8b2a020ae2b1c0
	.xword	0xf05821c1af6004b6
	.xword	0xdbe765edc354dfc8
	.xword	0x02d720bc80ff76bb
	.xword	0x59c9c4f07d88a666
	.xword	0x0ddde4bf45207236
	.xword	0x5f442e33b5bab9dc
	.xword	0xad69e049670caf3b
	.xword	0xace7caf8d6847b68
	.xword	0xaedb6600b605b527
	.xword	0x519aacaa4ba226ed
	.xword	0x80aab4f3cafd6a11
	.xword	0xad81a05f06902906
	.xword	0x00f65d1a261ba1ee
	.xword	0xb38b4780b3de2262
	.xword	0xdefc42b021749163
	.xword	0x1bf0111bc80f12f4
	.xword	0x8540d442e18a4e43
	.xword	0xacd11755f5b74e25
	.xword	0x61dfaabb37b59167
	.xword	0xf62088915faab2e1
	.xword	0x78d0c6c7db99d1fa
	.xword	0x0778f68b635348b4
	.xword	0x876fcfd7dfb7a1ac
	.xword	0x9147bd82a5ba0c02
	.xword	0x257819b82a822366
	.xword	0x875906eec21fb380
	.xword	0x87d331b915d0d1c1
	.xword	0x722578d156fccefc
	.xword	0xbbd29df525ef291d
	.xword	0xf6b7527c8c889025
	.xword	0x151c8128870bbe3e
	.xword	0xfcc4d1dfcf15a640
	.xword	0x0141f77557c012e1
	.xword	0x719dfa49ac363b65
	.xword	0x2e7130287f7c2d06
	.xword	0x5808abcc45fc11b3
	.xword	0x7846010471ce3a79
	.xword	0xf82dca4aeba93134
	.xword	0x9366ef16e391bbe0
	.xword	0xa27c88a46477cffc
	.xword	0xbaedf0f89d8c5e11
	.xword	0x492b7b0d62f4e09d
	.xword	0xd813b7146981d741
	.xword	0xf6f357dffc0089d7
	.xword	0x5ab6df2fe37560ad
	.xword	0x89bd1de6cb27d082
	.xword	0x10d50986937d47dd
	.xword	0x79a2fe50daf246a0
	.xword	0x071c0a8980dfc22c
	.xword	0x475fac5f969fa6a9
	.xword	0x6f4c71f6a1e61d18
	.xword	0xe98f4ade246482e4
	.xword	0x56dfd565f1cf3d4d
	.xword	0x8e8c90299895af3a
	.xword	0x6d4d69f64e48eac4
	.xword	0x904de85b1b3380db
	.xword	0xaf4d13040cdbad2d
	.xword	0x3186c157c9a83e5d
	.xword	0xa97a93995d16d3ba
	.xword	0x5a560862cb3487f0
	.xword	0x7619848cd6c8fa15
	.xword	0xed3789d0f9299650
	.xword	0x075f9352f26089b6
	.xword	0x42de81e75b721565
	.xword	0x160e6ab0985f7d5e
	.xword	0x036e955056cdf547
	.xword	0x38ab5a88748bf027
	.xword	0x92894212fc0b9e93
	.xword	0x9d29494234c23b1a
	.xword	0x4318d8ae3b825853
	.xword	0x7f0b898280b083b8
	.xword	0xeb13d7e6376d2328
	.xword	0x59a6bb8670998ea7
	.xword	0x15c01f6c16372b8f
	.xword	0xfd56cdacb8bab873
	.xword	0xb662991734090648
	.xword	0x4fbe05ff0c1f5c40
	.xword	0xbf357bf6fc0eb2f4
	.xword	0xc3ba5ecc22ea52bd
	.xword	0xff3341add712e295
	.xword	0xadabeec7f466f098
	.xword	0x1c23f07f6bb22745
	.xword	0xcebb2408b2eeb699
	.xword	0x403f4c941ba13333
	.xword	0xdf93173bf4d15425
	.xword	0xbc8774eec58d9809
	.xword	0x88cf9a83261bd071
	.xword	0xf17e01547642a75d
	.xword	0xf69b126d4f954a05
	.xword	0x1d5f314fa27299f0
	.xword	0x0019c69f89dbf141
	.xword	0x63bd4d9ef04654c7
	.xword	0x380efd2354d4b2c5
	.xword	0x5938b8a337308718
	.xword	0x5d4f8c6cb51ad44c
	.xword	0xc55b152952c2717a
	.xword	0x959a2f9f035a5208
	.xword	0xc403d660e43b904f
	.xword	0x810965b2dd517dd2
	.xword	0x2ab0c6ae78dcd644
	.xword	0x6a1e67ded89c2c8d
	.xword	0xaeb9ba01139b60f4
	.xword	0x3230e69b0936726a
	.xword	0x460d3e649aed22e6
	.xword	0x88723f5291e5b1c2
	.xword	0xa3be3318f2e3214e
	.xword	0x915928e63b16e9a7
	.xword	0x4b036a80893834fc
	.xword	0x8e662e58b12af6ff
	.xword	0xb226b214b621df67
	.xword	0x134f53925a3c1420
	.xword	0x4bc36e2b9448407b
	.xword	0xc44c382cff1ba4c5
	.xword	0xb9bb707dd62a0902
	.xword	0xd5b01931ca587043
	.xword	0x0e23d44c3c0b89ec
	.xword	0xb2734192102aa48d
	.xword	0x77ef40c9181822fa
	.xword	0x9ec6a7b8b3141c24
	.xword	0x99c86dbc653e4dc7
	.xword	0x54d2077b059de800
	.xword	0x24daae7801890f07
	.xword	0xb9c3ab4a28b894db
	.xword	0xe3fd7b4f82309f5a
	.xword	0xf5fdeadf3f56efd1
	.xword	0xfd686be1f1170295
	.xword	0xc72215c7a087ff93
	.xword	0x1b1d251a55acbe48
	.xword	0x0a3acd29dc0ce6cb
	.xword	0x00ccfd001b8a28ea
	.xword	0x0f477d3eabfdc4cf
	.xword	0x9e74cfffbeb10685
	.xword	0x95dd627b727bf4ea
	.xword	0x6b41b5b8ae6769e2
	.xword	0xba2cfe808c50f80f
	.xword	0xf0ca6f313bcef769
	.xword	0x14d1fafe4bf2019d
	.xword	0x5fe98cc740d1272f
	.xword	0x995dd558b72022cf
	.xword	0x5684e7cb5395aa91
	.xword	0x5a67d4addef04554
	.xword	0x23cd4196a93f9c7d
	.xword	0x1435439c1d09cf14
	.xword	0x48433fd5b62ed135
	.xword	0x0550c79d1ca30646
	.xword	0x6d87b889d428156f
	.xword	0x540c04ff6c24f828
	.xword	0xd6309fe86780b35f
	.xword	0x12d5d72d5f7b3f88
	.xword	0xe7da34f04048a758
	.xword	0x921ef940d79fc3d5
	.xword	0xd4ff3334bc57a7d2
	.xword	0xd43e0fed3dff9777
	.xword	0x6602834c31e1d253
	.xword	0xeed28cf0b6f2504c
	.xword	0x085148f8e6443e08
	.xword	0x50c6483e4b69ecd8
	.xword	0xa75117a63534c07b
	.xword	0xdd2c5320a708282d
	.xword	0x13ccc27d453f4092
	.xword	0x0216906791c44fa5
	.xword	0x87ab433fddab439b
	.xword	0xa71568c514d820cb
	.xword	0x2bd067e6b03a0eed
	.xword	0x597e1b3b4e1445c6
	.xword	0x630a3101a8f51fe9
	.xword	0xa09fcc8c7413ba5d
	.xword	0x0340b0d4863f8da5
	.xword	0x1617e1556daab98f
	.xword	0xd9f78cac97ab62fd
	.xword	0xab7004fe0a491b42
	.xword	0x7e7ace8b4b20b5cc
	.xword	0xf955032e7508508a
	.xword	0x0ea20416fb566385
	.xword	0x17913cb6f054b9b9
	.xword	0x283fff88f2119125
	.xword	0xf391bd0a49d00f4d
	.xword	0x04ee37264ed330a4
	.xword	0x8488b65603dee7d2
	.xword	0x37615825fba3aca6
	.xword	0x894ee0a48b4a63ac
	.xword	0x9b39e2654a39c9fa
	.xword	0x9abf28b8fb51edb4
	.xword	0x59dcd72daf2205ea
	.xword	0x1d746a1520a4f689
	.xword	0x5c134d85edaa7e2d
	.xword	0x7d20a0f7a07d63e8
	.xword	0x8cb6c1799de8ab40
	.xword	0xd80620714e685ef6
	.xword	0x99f8255301bf977e
	.xword	0xed0643cc5aed041b
	.xword	0xf09f783f4e499e76
	.xword	0xf81e1b89d7e30593
	.xword	0x08da1129f46f0eae
	.xword	0x019c65e644b86559
	.xword	0x70a05af7887a02b5
	.xword	0xba5cbba18cd06861
	.xword	0x24d82e08a07efc71
	.xword	0xf602d32d2c749f26
	.xword	0x04166bf406e239d8
	.xword	0x1958c661ffeab382
	.xword	0x1d637faf0e5ca7bb
	.xword	0xb4c6129d10778abc
	.xword	0x2ecdf3b13c93a041
	.xword	0x64657d7d8fbb11f3
	.xword	0x0d4591fd8ad00f4c
	.xword	0x0d9838a7cd150d42
	.xword	0xbcff6479f6736eb0
	.xword	0x5da3938f769fb8e9
	.xword	0xe58e0cb793023b69
	.xword	0x0e66f74f4bc60809
	.xword	0x74de1642a0cae187
	.xword	0x5ccb206a3786aab2
	.xword	0x2268a4918d453727
	.xword	0xc2729bd24d316079
	.xword	0x16ab2e048a45b9f3
	.xword	0x3ca4840edd6efac1
	.xword	0xb72a607328d65683
	.xword	0x529b7499d916a867
	.xword	0xba658a11ab31b8c1
	.xword	0x6f7038522b9f0b66
	.xword	0x5762e7f47d8675d3
	.xword	0x9e109f8aa5fcf508
	.xword	0xcfca8433c0c07ece
	.xword	0x48e3bd8253438edf
	.xword	0x2e9e9b077d464d8e
	.xword	0x6f2013f16354ca4b
	.xword	0xe1836c9d819b8013
	.align 0x40000
	.data
data_start_6:

	.xword	0xfc627477ec9cbd71
	.xword	0x05379a2b4cd1659a
	.xword	0xe4f2564f76e67b0c
	.xword	0x9fc24703ee5cc720
	.xword	0xa95178c57b82e8ad
	.xword	0x2111505ed8e6d452
	.xword	0x4b4a600df3499a70
	.xword	0x2c3abe09124dbf60
	.xword	0xaa521852149532f3
	.xword	0x3af4081c9df6b24d
	.xword	0x8bc024c7d2110255
	.xword	0x5f8bf869e1502e7d
	.xword	0x8cda45be56463e94
	.xword	0xd4878e77d1a70a68
	.xword	0xe21c939b64a6f133
	.xword	0xa92ac966662e32f3
	.xword	0xddfdab5f398ed67e
	.xword	0x7eb1921d108477fd
	.xword	0x61bac1350d4f6b72
	.xword	0x0598c5b97a79e28a
	.xword	0x5f1151b1f1c9b197
	.xword	0x35284296a9a4d4f6
	.xword	0xd3e2c825c0dab32f
	.xword	0x1b626d60abaf79d9
	.xword	0xb87771ca31115299
	.xword	0x872f4ab99e499fbc
	.xword	0xe31cb1929836a7db
	.xword	0xff75bb3cb79dd70e
	.xword	0x750e72137f3a1af6
	.xword	0x2bf14580a22fb2d8
	.xword	0xed365d316d86a6ff
	.xword	0x67f0682aed9fabb5
	.xword	0xbaa8131cb11cb0be
	.xword	0xc9b4850232a9ea51
	.xword	0x66bf3f9b91d1b193
	.xword	0xd49494af7eef44f3
	.xword	0x83105a76b15299cf
	.xword	0x647c5da34fcc80bb
	.xword	0xe43d55b9de59b69d
	.xword	0xe361adb75357e2ab
	.xword	0x8f9801a99b537dad
	.xword	0x0b56c1b47d31b7b8
	.xword	0x89a12713605c9d25
	.xword	0x592b57f14ee89818
	.xword	0x5c0234e2dbeaadb9
	.xword	0xf8f4727851ce141b
	.xword	0x9ccb1583b660a7af
	.xword	0xf0154324b5216b33
	.xword	0x6bf97db7f1b0d3c6
	.xword	0x9acb2d4a01449d0d
	.xword	0x463bb56d534e4079
	.xword	0x6980a7c2ea10b98a
	.xword	0x47f70ab1aac3ed89
	.xword	0x4ff75bfcd2346ed9
	.xword	0xe9475240baf79288
	.xword	0x5f9d41137f8622db
	.xword	0x475bfd04ab59f2d7
	.xword	0x5061b7be8d6ef491
	.xword	0x6b63b5c7f44b7d49
	.xword	0x074ef780ba44c920
	.xword	0x2d59be8557937d24
	.xword	0x33a88100e99c3c8a
	.xword	0x48c0a1a195b04336
	.xword	0x461831b402187c47
	.xword	0x0ae4d01c0219fa98
	.xword	0xb0e01660c28e32b6
	.xword	0x379607324018c5f5
	.xword	0x93bae9241666b022
	.xword	0xe0a6c5620edb6c13
	.xword	0x704059c18b40a66c
	.xword	0xb3faabdeeec35ada
	.xword	0xf1c8db7980db5a81
	.xword	0x163cfdf32ac78b58
	.xword	0x012bbe5d829c656a
	.xword	0x1056035f17d56c07
	.xword	0xb2be204ce32b5d19
	.xword	0xb468a56cb81b3716
	.xword	0x86de5221ec60a753
	.xword	0xbb080f391712639b
	.xword	0xbfd64166332af659
	.xword	0x47f4f51574200768
	.xword	0x22ceb9cc3cc1bc29
	.xword	0x89f9fb9edbb41964
	.xword	0x2f01d0876b142f1b
	.xword	0xd2d86dec718980de
	.xword	0xb1bc0d86df640c94
	.xword	0x90c77f239b23319f
	.xword	0x717905eae60b9be1
	.xword	0xf034cfaf24c62060
	.xword	0x1a79ca3f97f8f145
	.xword	0xf1ce02a12ee2fe9f
	.xword	0x2176f941a5425c07
	.xword	0x8d024c11486e577f
	.xword	0x10a4819f3a0ffe9f
	.xword	0x227e28f761105778
	.xword	0x43cf176d5358972e
	.xword	0x7b42b6598d83c81b
	.xword	0x939f77441835d660
	.xword	0x10b629efb579ab2a
	.xword	0x2d25c3c46e682df6
	.xword	0xfc621dfd7e7d3b8d
	.xword	0x8dbaac0674dd01c2
	.xword	0x01eb1e3aa2a5a08b
	.xword	0xa48cb73199cfbf59
	.xword	0x7350a3c42d62124c
	.xword	0x4b2318ec7c686eae
	.xword	0x61bb1579ae8934b0
	.xword	0x5f395a41ee8051e0
	.xword	0x143d606e39e08a7b
	.xword	0xd20bd5467a7548f7
	.xword	0x4ffe03ba63b526de
	.xword	0xa6e4f8ab787d7a1e
	.xword	0x5a22f45921d3bb21
	.xword	0x980b3000e4f26356
	.xword	0x9d2ed58a26e5e958
	.xword	0xdd1b6fad57ff8f90
	.xword	0xa249b0a6716f0c52
	.xword	0xa6a2036711decb34
	.xword	0x5d51a6c40c2e0d7e
	.xword	0xc25268b70a2ce2fb
	.xword	0xd7b0743d3a9ed5bf
	.xword	0x2df5962b255f1b99
	.xword	0x6751e01012a79e8d
	.xword	0x025ee1c785712c5d
	.xword	0x9cf6bdd68fb057bf
	.xword	0x40f54c8a0a9c1f7b
	.xword	0xafb5e87935de2293
	.xword	0x53b0abd112541dd1
	.xword	0xac9d47f4338c957b
	.xword	0x22e51623302f0b15
	.xword	0x769de4f0f39d7f74
	.xword	0x9f0d08300ed4dd07
	.xword	0x1cefd8290e111900
	.xword	0x179c7abefb14382b
	.xword	0x020112c6142de93e
	.xword	0xf7c9d969dcb991e5
	.xword	0xc8121c75da506634
	.xword	0xbad6de802bb7aa53
	.xword	0x7e293f53e83aeb65
	.xword	0x49906528f66d8383
	.xword	0xed4b7a4a80282de9
	.xword	0x52e5e93015f09287
	.xword	0x6ddce36069b3ec84
	.xword	0x5aa08a5d6cbb906f
	.xword	0x1d6838f57b8b5441
	.xword	0x1782f07f16aafed9
	.xword	0x6ac113800af6d91c
	.xword	0x730ae1a08955200d
	.xword	0xf30e218fe1c527f2
	.xword	0xa66087bbf28eb87f
	.xword	0xd39ddd1cd248e7fa
	.xword	0x597b32f631982b51
	.xword	0x8fec76060992a4c2
	.xword	0xcfe6457926ba9c16
	.xword	0x858ddc1817b59041
	.xword	0xe3e6e55e065c9f13
	.xword	0xf84800b63a768514
	.xword	0xb1ff0711c2ad7253
	.xword	0x03ab8dc0b6ac336a
	.xword	0x84484aa798c1d667
	.xword	0x6d15dab484d04474
	.xword	0x6528e36bca6d7aaf
	.xword	0x8a88f08c2d7c330a
	.xword	0xf0ef34bf3c93768d
	.xword	0x1cf9c5fd0357d448
	.xword	0xb3a4941c18033037
	.xword	0x5771f00683cc163e
	.xword	0x1592fd1f1e022e2b
	.xword	0xc3e4a4887470fa2f
	.xword	0x0a1b1b7c257c9cd9
	.xword	0xc3c9f7444f22a8a0
	.xword	0xa7470433def3aeb5
	.xword	0xff1caa2d2636df82
	.xword	0xea333e05eb392669
	.xword	0x676c160d8d3fe77f
	.xword	0x04b3482987ef3cd7
	.xword	0xca7ec55e9e406162
	.xword	0xd3c00b39bdbb3d2d
	.xword	0x521e5a6ae3a52792
	.xword	0xd698974242ffef07
	.xword	0x86d2d0479a1c8145
	.xword	0x46a0f1082076c7a2
	.xword	0xae27307a1aa9dff4
	.xword	0x6f12113a5356fec9
	.xword	0xfa350f2430f7bdec
	.xword	0xc8fa50b7814a3ac2
	.xword	0x3814b7f61e955321
	.xword	0x6f3c8d85adf4a95e
	.xword	0x77cade7de850e1f8
	.xword	0xdf888bdbc19c8426
	.xword	0x3b401bf1a154d8d0
	.xword	0x8c57d416ddca9d46
	.xword	0x3d0094cac38b25b2
	.xword	0xab2116ce9b2e2d80
	.xword	0x173a75e41830b157
	.xword	0xd783b15a0a30e521
	.xword	0xdaede999801af811
	.xword	0x7443abf65bf10fd0
	.xword	0x398c250c2dfe4434
	.xword	0xfd6fe2568e3d2cff
	.xword	0x238e477eb05af965
	.xword	0xe6e1f4bd83c0d2c9
	.xword	0x71cb6a0d79d1ae9b
	.xword	0x38a236d8a96a6a96
	.xword	0xe2b3856120667802
	.xword	0xa1ccaf12d6b5aee1
	.xword	0xb03b8c838a4ffc67
	.xword	0x6a313c89ae9ed56a
	.xword	0xaad10c06084fdebf
	.xword	0x9012a6fea51304ff
	.xword	0xcb3e9b5dab9e2681
	.xword	0xb097963df4e1dd0d
	.xword	0xc20972d245dff0c2
	.xword	0xaacd840a928ce067
	.xword	0xe5a7fd0593f41caf
	.xword	0xf7c871a64e43d1ee
	.xword	0xbbb12c37bcf186b1
	.xword	0x330742fea745a0bb
	.xword	0x2a33e389815ad47d
	.xword	0x8936813313d84a5c
	.xword	0x35e7d9605982ad88
	.xword	0x040ec6f44dd90f6b
	.xword	0xe10923ff879d2e76
	.xword	0x810f19bbaeb1f9e5
	.xword	0x0fb057ad06460538
	.xword	0x38f27ebea2b94590
	.xword	0x672fd0c1a3dc3bc3
	.xword	0x071fcc2cd33b08d7
	.xword	0xeda5065ac558b194
	.xword	0xb6154d9c8309908f
	.xword	0x44d659ddb2a22282
	.xword	0x1b4d94fb3a728bb5
	.xword	0x24ed84dc970976f6
	.xword	0xe2db0b94b64aa965
	.xword	0xd58c9b0101699d6d
	.xword	0xb6213f3a667b5314
	.xword	0x47137bd6223a5e27
	.xword	0xd4a08ce22d8f7751
	.xword	0x76b36f39a6748226
	.xword	0xa25db02135821991
	.xword	0x68202190915d50ed
	.xword	0xeb224b91c75cb60b
	.xword	0x6ac81717c413ca6d
	.xword	0xc8c15fefd0efff98
	.xword	0xc7f2553a22e8c1fa
	.xword	0x0961d86ce81a633a
	.xword	0xc318702f1b1beb04
	.xword	0x5c63b5e8e01f79ee
	.xword	0x7fb3bcd6659eed37
	.xword	0x42584917d72bbd58
	.xword	0xef9144cf9d3a4148
	.xword	0xdc72cc0dcd447ae1
	.xword	0x797e85511368be23
	.xword	0x2739f2f62dfaa7fc
	.xword	0xe7418af40726f009
	.xword	0x98e01ef500b0c203
	.align 0x80000
	.data
data_start_7:

	.xword	0x6430bb2acd4b9dba
	.xword	0x20d0bcbae5457e1f
	.xword	0x02db463ee5458abe
	.xword	0xf70b0e28bae1f268
	.xword	0x24d82b41e557ca0b
	.xword	0xa7680b83237aa4ee
	.xword	0x989d9a6e35bc8422
	.xword	0xefa39471a14155ee
	.xword	0x5ec8b6d762797f2e
	.xword	0x078ad4aa47871730
	.xword	0x80f1b28cfc674c8c
	.xword	0x81d81dc11e258f94
	.xword	0xfcdf1ad133c035d0
	.xword	0x1147235c7968737a
	.xword	0x00c78d28ed758400
	.xword	0x53537e5a7ec3fbb5
	.xword	0x9b5bc69904b1ca87
	.xword	0x2f111e00145e7ea4
	.xword	0x8eb9540a4e0af619
	.xword	0x02c4ed80f15c67df
	.xword	0xe36f722ae4afcd18
	.xword	0x144bb71e71b9ae73
	.xword	0xa2d5eeb35e4e8328
	.xword	0x1b136e02b05c5c1c
	.xword	0xc8222b52b9ae5f9a
	.xword	0x736b6a304fb8735b
	.xword	0x0f4d1795a070369c
	.xword	0xfc05d4c563159ae3
	.xword	0xc746100222fac936
	.xword	0xea7a35cd88f847fb
	.xword	0xe2d136344da1189d
	.xword	0x8ed88e9eb04ead15
	.xword	0x03429be24e5f4f09
	.xword	0x9da92315aee766b2
	.xword	0x25fa4debe4ef8f06
	.xword	0x218665ce3566c311
	.xword	0xe498011e52c8ff93
	.xword	0x329b12f2602863b0
	.xword	0x693bffd8d8c950b1
	.xword	0x1b8f77cd504179fd
	.xword	0x92957acfa1edac89
	.xword	0x42487300ec02cfd6
	.xword	0x630229228c83ea3b
	.xword	0x7e2795837c1848c2
	.xword	0xb7f04d85fbfdb79f
	.xword	0x3406a8f4bc810e35
	.xword	0x7669f95d2b394adf
	.xword	0x3f1ada1b91ea58f2
	.xword	0x562a862abcbb4196
	.xword	0x4366ec37c88f79c3
	.xword	0x325523224b5563c4
	.xword	0xd9c9cf7299e4fbc6
	.xword	0x2c9386a90784bf43
	.xword	0xfd02cc4456c7d17b
	.xword	0x7b1a443972bd25e4
	.xword	0xfeb05b69ec1d08bd
	.xword	0x49c6adeab4bedd62
	.xword	0x374aae449b3dd677
	.xword	0x5631b28ca9184e60
	.xword	0x1652142cfc2e7113
	.xword	0x6a7b84e840f9fcae
	.xword	0x441b7b46bc6e9d0b
	.xword	0x31b8b4bf52aaa3a7
	.xword	0x7699ae055c0d82c8
	.xword	0x0d78ed731a6c1e0e
	.xword	0x180c245776f49a40
	.xword	0xe6e6fc2911b4f34f
	.xword	0x5a8adb89870dc5ed
	.xword	0x5f0d61c641895f49
	.xword	0x598987250cedb34e
	.xword	0x5b0dd015215852d9
	.xword	0x0f63fcb06a61048d
	.xword	0xba43d65393736f69
	.xword	0xc41ef7add3ebc9d7
	.xword	0x2b0a11c404fab3ba
	.xword	0xf40e4f2193e92a75
	.xword	0xf1ddc76245d49c1b
	.xword	0x08ee28eb8c285f0f
	.xword	0xc380ddb2a0ec22d3
	.xword	0xdb5bfbd07cfa35bf
	.xword	0x59ae915ee04246eb
	.xword	0xff8c792f264a4978
	.xword	0xac844b4b6aaf3306
	.xword	0xa64925c811c91894
	.xword	0xed3ad7e1f41f1260
	.xword	0x1cbcb4dbaa7bb556
	.xword	0xbb1445a82c972574
	.xword	0x4b90dadfa16376b1
	.xword	0x0e469ac41de8de04
	.xword	0x7f04aed9edca00fc
	.xword	0x5c1affac968ca479
	.xword	0x1f703a967107afca
	.xword	0x902d6a20ebfa7f7a
	.xword	0x58463e5278637ce1
	.xword	0x9997534657f5e007
	.xword	0xdb56d6969911093b
	.xword	0x3fdfeb2137186990
	.xword	0x5689cd1862a2623e
	.xword	0x63667643efd1722a
	.xword	0x40b1d6a048aae9a7
	.xword	0x053d6f4bf275decd
	.xword	0x0e9279608160044c
	.xword	0x297de4b86e90e107
	.xword	0x58885e90f09d3d76
	.xword	0x86dec8ae817637cc
	.xword	0x4083a799d9e45bb4
	.xword	0xb951d5c02fe683e4
	.xword	0x03d19a967b8dcce4
	.xword	0xb8652bf21424eda3
	.xword	0xbc7cc7d7fd051cff
	.xword	0xd98202a0604ea8b6
	.xword	0x2ecc062083ca7b96
	.xword	0xca7e7ceca66f7b90
	.xword	0xe51e08f2c880c79e
	.xword	0x8e5e4c4f35504ec0
	.xword	0x99c1fe3bff8f6d94
	.xword	0x366843770c7e0bd1
	.xword	0x5c6bdb7594100e7d
	.xword	0x30b2e2d5882e49eb
	.xword	0x6325425c1ea234c5
	.xword	0xdfbfcd494167161c
	.xword	0xa3345d80933a94fc
	.xword	0xfe478a2d6e19bd30
	.xword	0x70c91865fba67092
	.xword	0x719d47e66e9be240
	.xword	0xe8ee29444172d926
	.xword	0x8a24cf5574aebfb1
	.xword	0xb86e2d0afe842476
	.xword	0x1cd7ad6321ffae11
	.xword	0xd52407e8a3d2f6d6
	.xword	0xbdbd7f2622a00ae9
	.xword	0x4253fb9c4f23c1a1
	.xword	0x383e768e6ecb567b
	.xword	0xfc143fd58f5d6a4c
	.xword	0xbc6f97bdea68c8db
	.xword	0x2e081e86f25de01c
	.xword	0xf21d630ca9768808
	.xword	0x4336a2b59c6d1da9
	.xword	0xff0a72c9d36c542d
	.xword	0x93ac70774ad35e99
	.xword	0x8ca7d9046e3eb214
	.xword	0x909d1b97e95d4189
	.xword	0x98dde5cb691bd0c4
	.xword	0xa85ab496f7ecc0ab
	.xword	0xa7b6e683de965e63
	.xword	0xc05246982886a9f6
	.xword	0xc1dd1f06a566235a
	.xword	0x7e80ed273fd37acd
	.xword	0x460f3810e80a3c7f
	.xword	0x0cd9c8b45bcd2cee
	.xword	0xe04a7d29a2fb859d
	.xword	0x39b12c1995351798
	.xword	0xa8ac334d6e333775
	.xword	0xd6d062ebd25a091d
	.xword	0xe2fb20fe3e099e55
	.xword	0x4ceee7a938ec3e92
	.xword	0xedfca445ea4eb0f7
	.xword	0xb719bdbeead71058
	.xword	0x67f40f92a037a0b6
	.xword	0x85ff14100d80801f
	.xword	0x82e80b6da0f9c077
	.xword	0x10641e38246a4040
	.xword	0x06f088e3d7b07778
	.xword	0x89f58402b03d6bbd
	.xword	0xba67b1e963e95611
	.xword	0xaf7edd0fc6ee90d7
	.xword	0xc59c6d8da29a7519
	.xword	0xf75b22bbe8b4ddd9
	.xword	0x04048e0129671713
	.xword	0xab67ad461e79328f
	.xword	0xce97621f3f56b443
	.xword	0xeb9e27c4d4b8407a
	.xword	0x93b56adf1ed12c7d
	.xword	0xda3b11dec3c7e3ec
	.xword	0xa4457f220e2fb618
	.xword	0xf72b0f03e260d03d
	.xword	0xe13b98e9057db1fa
	.xword	0xeed80395680b16eb
	.xword	0xe9242b66d9e24830
	.xword	0x272c24102424a838
	.xword	0xd6e889a4f78cf0e4
	.xword	0x8677bd871fd1fcc3
	.xword	0xc6b3db8fa9cbabe0
	.xword	0xb72e6ec7f9388efd
	.xword	0xb71ef6c80044980c
	.xword	0x32398d768c140a93
	.xword	0x0d94be945b2b0ce3
	.xword	0xbadcdde16ecdae88
	.xword	0xd67d6072ab94162e
	.xword	0x9918e0bb5752fb70
	.xword	0xc837f97681cb2c38
	.xword	0x210f314735273521
	.xword	0xc5f410e530f083a4
	.xword	0x57f8f416e977ff21
	.xword	0x3850068cf4ad69cb
	.xword	0x6a6bc4be249f51e3
	.xword	0x662c3e674319bd1d
	.xword	0xae225a8bd5c0a4cb
	.xword	0x689d1a2ee3c67491
	.xword	0xf4bf9bf96445b414
	.xword	0xec792ee02aa97458
	.xword	0x0df1362aa8e0309b
	.xword	0xd1c80ed20d421681
	.xword	0x97ac42abcb008f9e
	.xword	0xa710bef25ceccb48
	.xword	0x5a5bc281963afa74
	.xword	0xdbe78d2713e974e3
	.xword	0xe39fc356d0abe235
	.xword	0x08fae2d399a76271
	.xword	0x5b90165762882a03
	.xword	0x98106e07ed2f5a59
	.xword	0xc3dc644415a6c241
	.xword	0x64406a4dc7c90783
	.xword	0x6da96f1713bcc560
	.xword	0xd1b9f37556fa6a64
	.xword	0x2054135731a18f97
	.xword	0x5da634a84ff62394
	.xword	0x1e4b77bab35cbbd3
	.xword	0xfcb1ce11f188c449
	.xword	0x1971a40a61a98c5f
	.xword	0xd44b6403ddd1b7e3
	.xword	0xdfca04bcfaa4a2ab
	.xword	0xf44a6ff90936a033
	.xword	0x93e946e0794abf95
	.xword	0xf72e9ffa0ba59093
	.xword	0x2ae905f73b87a750
	.xword	0xe68fdd40e05d544c
	.xword	0xad5fb3c44aa796fc
	.xword	0xe75d31f728e378d3
	.xword	0x5c52411e665a9ff8
	.xword	0xe27322404ee34829
	.xword	0xec2b3453c2bb29be
	.xword	0x0a3a8e9fc1fb3e9a
	.xword	0xb46c7642f521fd08
	.xword	0xdeafeef65d7e8cc4
	.xword	0xbb1e6ccd4abf3bf5
	.xword	0xb65955f4807b17a2
	.xword	0x1bfea8825e232e1a
	.xword	0x3f51219ef9fb9c7c
	.xword	0xbb69dbafa32511dc
	.xword	0xea45cffd8788ce6d
	.xword	0x3640f08e8abb7412
	.xword	0x2ec08415c763d028
	.xword	0x3c8d3277370e4b46
	.xword	0x4894491008e83068
	.xword	0xf8ff8a296a38b86b
	.xword	0x3c57ccc40a6ed94c
	.xword	0x244f4c6b01149918
	.xword	0xc100505999ae916f
	.xword	0xb2915e7ccf35aa9f
	.xword	0xf981504847acf762
	.xword	0xed9bc0cc37ac4c06
	.xword	0x72d66a799ab821ff
	.xword	0xfb1c419f9e7547a6
	.xword	0x4974abf643c1506b
	.xword	0x4c4f9be0083b3523



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
