// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_85.s
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
   random seed:	894070688
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

	setx 0x146f67e7d094e33a, %g1, %g0
	setx 0x35822130c595dfda, %g1, %g1
	setx 0xc97192edec4b28d4, %g1, %g2
	setx 0xa648343e0e864c63, %g1, %g3
	setx 0xd9d220effe836f25, %g1, %g4
	setx 0x4d4c6a6a193bed71, %g1, %g5
	setx 0xa8e862949ec34801, %g1, %g6
	setx 0x4cfe0249d6845c88, %g1, %g7
	setx 0x9dea14b012e73027, %g1, %r16
	setx 0x931438a0faf9cbfa, %g1, %r17
	setx 0xcddf35849914043a, %g1, %r18
	setx 0xe6d051326d7665b2, %g1, %r19
	setx 0x36298543a5f247c8, %g1, %r20
	setx 0x9e237a71aa6b8244, %g1, %r21
	setx 0x6222bbc21b355263, %g1, %r22
	setx 0xad100d343583994a, %g1, %r23
	setx 0xa340d90eca7dcac6, %g1, %r24
	setx 0x9d422a2fcec8dad2, %g1, %r25
	setx 0x1d43f1eec4898b72, %g1, %r26
	setx 0xafb11cefee89cce8, %g1, %r27
	setx 0xb800703c1f81eaed, %g1, %r28
	setx 0x6883cf4ccb867f62, %g1, %r29
	setx 0x7a442271b8ce5154, %g1, %r30
	setx 0xcb09d03526494e31, %g1, %r31
	save
	setx 0x2d1f747cae655802, %g1, %r16
	setx 0x9fad2d05fd96bc73, %g1, %r17
	setx 0x6d07cfb039ebc942, %g1, %r18
	setx 0xab786aada04846ef, %g1, %r19
	setx 0xede86b0b4363cc17, %g1, %r20
	setx 0x129511bd4a10fe01, %g1, %r21
	setx 0xf81ea820b7d8524b, %g1, %r22
	setx 0x7893761858ee3a89, %g1, %r23
	setx 0xf0fbb73c87e59649, %g1, %r24
	setx 0xea3fb8d0a71259e6, %g1, %r25
	setx 0x11e63b24ecb63b75, %g1, %r26
	setx 0x881cbd7e1453687e, %g1, %r27
	setx 0xd9d954eee8785790, %g1, %r28
	setx 0x993ce31856ccbc96, %g1, %r29
	setx 0x6f0073963883f8e8, %g1, %r30
	setx 0x50a0447c886cbc0b, %g1, %r31
	save
	setx 0xcf5858109c52b65a, %g1, %r16
	setx 0xee99697d291351fa, %g1, %r17
	setx 0x5794808321df6cb3, %g1, %r18
	setx 0xa80a29935c3facff, %g1, %r19
	setx 0xd60419fe8b0c962f, %g1, %r20
	setx 0xf027e5cbffe3c1ad, %g1, %r21
	setx 0x61d78c0c5aef72cd, %g1, %r22
	setx 0xc286a0c04fedd0b3, %g1, %r23
	setx 0xbaf8612d97f1ea7c, %g1, %r24
	setx 0x666da5f918c5b561, %g1, %r25
	setx 0x1087d89f06a86107, %g1, %r26
	setx 0xed824fdb11a89b07, %g1, %r27
	setx 0x8891b7ac932903c4, %g1, %r28
	setx 0xa4dc3cb46971088a, %g1, %r29
	setx 0xdeae9cc0186e5147, %g1, %r30
	setx 0x21610b86d4c1be80, %g1, %r31
	save
	setx 0xdb7479350b6dd54c, %g1, %r16
	setx 0x74347dd150be9d73, %g1, %r17
	setx 0x3872f1848c34eebe, %g1, %r18
	setx 0x247876405928ca09, %g1, %r19
	setx 0x0acfd34ef67fba4d, %g1, %r20
	setx 0x05d99cae2ae52626, %g1, %r21
	setx 0x4194beda75a885e6, %g1, %r22
	setx 0x101e0e98d0ce0515, %g1, %r23
	setx 0xba872f8626b236c9, %g1, %r24
	setx 0xfcd24eea9c9b2117, %g1, %r25
	setx 0xd630c384abdd587a, %g1, %r26
	setx 0xd2f82633b1bdbacf, %g1, %r27
	setx 0xb9749aeeefe35175, %g1, %r28
	setx 0x1caa5f2ac1b20f1c, %g1, %r29
	setx 0xf0570c6051f68ef2, %g1, %r30
	setx 0x87dc8b45437a03d0, %g1, %r31
	save
	setx 0xa98f36f43d91e81c, %g1, %r16
	setx 0x15654413b7958266, %g1, %r17
	setx 0x0b08c6703cebcdcd, %g1, %r18
	setx 0x04861e8509a47683, %g1, %r19
	setx 0x746020421c77ec97, %g1, %r20
	setx 0x11683ac45776c06a, %g1, %r21
	setx 0x6b0472056907de92, %g1, %r22
	setx 0x195599ea2c5486d9, %g1, %r23
	setx 0x00ab7ce3a8672da3, %g1, %r24
	setx 0xec3a3f1944d25611, %g1, %r25
	setx 0xfc89bd77947b1b79, %g1, %r26
	setx 0x8d92d9a83e06ab0e, %g1, %r27
	setx 0x6595045bd27bbbe7, %g1, %r28
	setx 0x7423f25a2f02e89f, %g1, %r29
	setx 0xf5f52ec55f8581f0, %g1, %r30
	setx 0xc0107cf21d45bcbd, %g1, %r31
	save
	setx 0x55b0bf26d26dbb53, %g1, %r16
	setx 0x9002672f604fd21f, %g1, %r17
	setx 0x51c0bae63c6c15b9, %g1, %r18
	setx 0xe095ef0c1fef105b, %g1, %r19
	setx 0xaf0acca991846c1f, %g1, %r20
	setx 0x83a44cd32406ab15, %g1, %r21
	setx 0xc799c2aaeb6215b4, %g1, %r22
	setx 0x7e2c1d6d2a2c0452, %g1, %r23
	setx 0x68eeaa5c81eb1a3a, %g1, %r24
	setx 0x2db74aa9994c4366, %g1, %r25
	setx 0x173cedc6cd59e161, %g1, %r26
	setx 0x5ce3f683e4e2089a, %g1, %r27
	setx 0x1898f68e21903144, %g1, %r28
	setx 0x8416f1cb267e07de, %g1, %r29
	setx 0x20e00fb4b99cb396, %g1, %r30
	setx 0xa36e2ba30d4188c6, %g1, %r31
	save
	setx 0x9837809236bdfaa2, %g1, %r16
	setx 0xcbea30184b7cf539, %g1, %r17
	setx 0xa9cd2d1f4f1c9d46, %g1, %r18
	setx 0x2c6d01b31b25fa5a, %g1, %r19
	setx 0x9838db356325615e, %g1, %r20
	setx 0x4f07b993f33499c5, %g1, %r21
	setx 0xb203619c865a992d, %g1, %r22
	setx 0xaf69e826c5edc61e, %g1, %r23
	setx 0x93341bc09bd513bb, %g1, %r24
	setx 0xdad3efc33a016544, %g1, %r25
	setx 0x3e3283b2681f735a, %g1, %r26
	setx 0xf3ac4c6980ffbfd2, %g1, %r27
	setx 0x26b8b81e929882ba, %g1, %r28
	setx 0x81ad84d76d390e60, %g1, %r29
	setx 0x3fe975f881d943a1, %g1, %r30
	setx 0xeb26ea92a7da8ff2, %g1, %r31
	save
	setx 0xb08f44968cf8da9c, %g1, %r16
	setx 0xbedb0c3e4f1f99f2, %g1, %r17
	setx 0x3a32367507f3089a, %g1, %r18
	setx 0x69380633ba8814ca, %g1, %r19
	setx 0x5bb1ca14c1a6d134, %g1, %r20
	setx 0x8652217ff6408427, %g1, %r21
	setx 0xff3cf28feb333d9d, %g1, %r22
	setx 0xb3296f7001335131, %g1, %r23
	setx 0x4f13a6ba29e48fe8, %g1, %r24
	setx 0x0cf01bcb64356da1, %g1, %r25
	setx 0xca5989d914053c3a, %g1, %r26
	setx 0xe706ff4ce59fbdf8, %g1, %r27
	setx 0x8598b6664618af4b, %g1, %r28
	setx 0x4fd56d90890941b1, %g1, %r29
	setx 0x09a36b8d64d30119, %g1, %r30
	setx 0xb0047609fa282071, %g1, %r31
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
	.word 0xb1e4a177  ! 3: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb8958000  ! 5: ORcc_R	orcc 	%r22, %r0, %r28
	.word 0xb3e5617d  ! 7: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e421c5  ! 8: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9508000  ! 10: RDPR_TSTATE	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 12: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbbe5615a  ! 13: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4a17c  ! 16: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbd508000  ! 19: RDPR_TSTATE	<illegal instruction>
	setx	0xd18c6fda0000c991, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb884a07b  ! 22: ADDcc_I	addcc 	%r18, 0x007b, %r28
	.word 0xb9540000  ! 23: RDPR_GL	<illegal instruction>
	.word 0xb5e56161  ! 25: SAVE_I	save	%r21, 0x0001, %r26
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0d2  ! 28: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e56107  ! 30: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_6, %g1, %r22
	.word 0xb9e42189  ! 34: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e5a193  ! 35: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb2b4c000  ! 42: SUBCcc_R	orncc 	%r19, %r0, %r25
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42181  ! 44: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xbd480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbbe56181  ! 49: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8d94610e  ! 51: WRPR_PSTATE_I	wrpr	%r17, 0x010e, %pstate
	.word 0xb750c000  ! 52: RDPR_TT	<illegal instruction>
	.word 0xb9e560e9  ! 54: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5e131  ! 55: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e068  ! 59: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4a0d2  ! 65: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_1, %g1, %r19
	.word 0xb3e4e190  ! 68: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x879520e0  ! 70: WRPR_TT_I	wrpr	%r20, 0x00e0, %tt
	.word 0xb9480000  ! 71: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9e5e107  ! 74: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5a1f5  ! 80: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e0c4  ! 85: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x839520d3  ! 86: WRPR_TNPC_I	wrpr	%r20, 0x00d3, %tnpc
	.word 0xbbe4a136  ! 90: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e075  ! 92: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe460b9  ! 98: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb0344000  ! 100: SUBC_R	orn 	%r17, %r0, %r24
	.word 0x9194e177  ! 101: WRPR_PIL_I	wrpr	%r19, 0x0177, %pil
	.word 0xbf510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0x87946150  ! 105: WRPR_TT_I	wrpr	%r17, 0x0150, %tt
	.word 0xbc256152  ! 106: SUB_I	sub 	%r21, 0x0152, %r30
	.word 0xb3480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7e461f7  ! 115: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8994a045  ! 119: WRPR_TICK_I	wrpr	%r18, 0x0045, %tick
	.word 0xbfe56168  ! 123: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb150c000  ! 124: RDPR_TT	<illegal instruction>
	.word 0xb3e4a0b9  ! 125: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4a0d6  ! 129: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_3, %g1, %r19
	.word 0xbe1c0000  ! 132: XOR_R	xor 	%r16, %r0, %r31
	.word 0xb7e5e144  ! 136: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42131  ! 143: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4210c  ! 144: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434e1c4  ! 146: ORN_I	orn 	%r19, 0x01c4, %r26
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56179  ! 152: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_0, %g1, %r21
	.word 0x8595616c  ! 157: WRPR_TSTATE_I	wrpr	%r21, 0x016c, %tstate
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194600e  ! 164: WRPR_TPC_I	wrpr	%r17, 0x000e, %tpc
	.word 0xb9504000  ! 165: RDPR_TNPC	<illegal instruction>
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a08f  ! 170: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe5e1be  ! 174: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5a13c  ! 176: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5e046  ! 179: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb13d0000  ! 184: SRA_R	sra 	%r20, %r0, %r24
	.word 0xb9508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0x91946130  ! 193: WRPR_PIL_I	wrpr	%r17, 0x0130, %pil
	.word 0x8995213d  ! 196: WRPR_TICK_I	wrpr	%r20, 0x013d, %tick
	.word 0xbfe561f9  ! 200: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0c0000  ! 204: AND_R	and 	%r16, %r0, %r29
	.word 0xb7e460cb  ! 205: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb4ade1c7  ! 208: ANDNcc_I	andncc 	%r23, 0x01c7, %r26
	.word 0xb3e5e0a1  ! 209: SAVE_I	save	%r23, 0x0001, %r25
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56014  ! 218: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x9194e1cb  ! 221: WRPR_PIL_I	wrpr	%r19, 0x01cb, %pil
	.word 0xb7e460ec  ! 223: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_6, %g1, %r16
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4456044  ! 228: ADDC_I	addc 	%r21, 0x0044, %r26
	.word 0x8395200f  ! 229: WRPR_TNPC_I	wrpr	%r20, 0x000f, %tnpc
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	setx	0xd845a80800007dcd, %g1, %r10
	.word 0x839a8000  ! 235: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e521df  ! 237: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde561c5  ! 242: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e520ab  ! 246: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 255: RDPR_GL	<illegal instruction>
	.word 0xb1540000  ! 256: RDPR_GL	<illegal instruction>
	.word 0xb09d6126  ! 259: XORcc_I	xorcc 	%r21, 0x0126, %r24
	.word 0xbde5a016  ! 270: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb8c421ec  ! 273: ADDCcc_I	addccc 	%r16, 0x01ec, %r28
	.word 0xb6b461d7  ! 274: SUBCcc_I	orncc 	%r17, 0x01d7, %r27
	.word 0xb5e5a121  ! 275: SAVE_I	save	%r22, 0x0001, %r26
	mov	2, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e5e144  ! 283: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb63ca125  ! 286: XNOR_I	xnor 	%r18, 0x0125, %r27
	.word 0xb3e421a0  ! 288: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3520000  ! 291: RDPR_PIL	<illegal instruction>
	.word 0xb5e5a024  ! 295: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4619c  ! 299: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x1753ba990000ca5c, %g1, %r10
	.word 0x839a8000  ! 303: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e4e1be  ! 304: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a0a1  ! 305: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4e1cd  ! 306: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe420b7  ! 307: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e46137  ! 310: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4600f  ! 311: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4e040  ! 312: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5e02c  ! 315: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x85956095  ! 319: WRPR_TSTATE_I	wrpr	%r21, 0x0095, %tstate
	.word 0xbf500000  ! 320: RDPR_TPC	<illegal instruction>
	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 325: MOVcc_I	<illegal instruction>
	.word 0xb9e5e066  ! 329: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e52182  ! 330: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a15b  ! 333: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1500000  ! 335: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 336: RDPR_TNPC	<illegal instruction>
	.word 0xb48c21ac  ! 339: ANDcc_I	andcc 	%r16, 0x01ac, %r26
	.word 0xbfe4202f  ! 341: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4a077  ! 345: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb2358000  ! 353: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xb5e4a1d1  ! 354: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e5e011  ! 355: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e4e075  ! 356: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe4a099  ! 361: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb550c000  ! 362: RDPR_TT	<illegal instruction>
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9de1df  ! 366: XORcc_I	xorcc 	%r23, 0x01df, %r31
	.word 0xb7e4e19a  ! 367: SAVE_I	save	%r19, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e5a16c  ! 370: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8394a1f5  ! 373: WRPR_TNPC_I	wrpr	%r18, 0x01f5, %tnpc
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 378: RDPR_TSTATE	<illegal instruction>
	setx	0x624bbbc00008cdb, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e42197  ! 391: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4e193  ! 392: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd508000  ! 398: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x89946001  ! 401: WRPR_TICK_I	wrpr	%r17, 0x0001, %tick
	.word 0xb77c4400  ! 402: MOVR_R	movre	%r17, %r0, %r27
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 406: RDPR_TL	<illegal instruction>
	.word 0xb7e5e0c4  ! 407: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4e1f7  ! 408: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8594a055  ! 411: WRPR_TSTATE_I	wrpr	%r18, 0x0055, %tstate
	setx	0x53e2cc8300006849, %g1, %r10
	.word 0x819a8000  ! 413: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb22de079  ! 416: ANDN_I	andn 	%r23, 0x0079, %r25
	.word 0xbde4a070  ! 419: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb12c5000  ! 420: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xba3ce147  ! 422: XNOR_I	xnor 	%r19, 0x0147, %r29
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4207f  ! 433: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5e07f  ! 434: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8995a06c  ! 435: WRPR_TICK_I	wrpr	%r22, 0x006c, %tick
	.word 0x8d9461d9  ! 439: WRPR_PSTATE_I	wrpr	%r17, 0x01d9, %pstate
	.word 0xb33d9000  ! 440: SRAX_R	srax	%r22, %r0, %r25
	.word 0xbfe4a0b8  ! 441: SAVE_I	save	%r18, 0x0001, %r31
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421a9  ! 462: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e421b6  ! 464: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe520b0  ! 465: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xbde561d9  ! 470: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc3dc000  ! 477: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb135c000  ! 478: SRL_R	srl 	%r23, %r0, %r24
	.word 0xb68dc000  ! 479: ANDcc_R	andcc 	%r23, %r0, %r27
	.word 0xb3e5a1f8  ! 484: SAVE_I	save	%r22, 0x0001, %r25
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195610e  ! 487: WRPR_TPC_I	wrpr	%r21, 0x010e, %tpc
	.word 0xb09ca1dc  ! 488: XORcc_I	xorcc 	%r18, 0x01dc, %r24
	.word 0xbb2c1000  ! 489: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xb5504000  ! 490: RDPR_TNPC	<illegal instruction>
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 495: RDPR_TNPC	<illegal instruction>
	.word 0xb3343001  ! 497: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb9508000  ! 498: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 500: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5e01e  ! 503: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbd504000  ! 508: RDPR_TNPC	<illegal instruction>
	.word 0xb92c3001  ! 510: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xbfe5e13e  ! 514: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e56190  ! 515: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xb3e56189  ! 527: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e19c  ! 530: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba154000  ! 531: OR_R	or 	%r21, %r0, %r29
	.word 0xb28d211b  ! 536: ANDcc_I	andcc 	%r20, 0x011b, %r25
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 540: RDPR_PSTATE	<illegal instruction>
	.word 0xbde521a2  ! 543: SAVE_I	save	%r20, 0x0001, %r30
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521e8  ! 550: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5a1c4  ! 556: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4e07b  ! 559: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d94e1de  ! 560: WRPR_PSTATE_I	wrpr	%r19, 0x01de, %pstate
	.word 0xb3e5a104  ! 561: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8395e0be  ! 564: WRPR_TNPC_I	wrpr	%r23, 0x00be, %tnpc
	setx	0xf8d1fb8e0000dcd8, %g1, %r10
	.word 0x819a8000  ! 571: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e5a0b3  ! 574: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421a0  ! 578: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb8ad0000  ! 580: ANDNcc_R	andncc 	%r20, %r0, %r28
	.word 0xbfe52152  ! 588: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4a1dc  ! 589: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x9195e15e  ! 591: WRPR_PIL_I	wrpr	%r23, 0x015e, %pil
	.word 0x839520e7  ! 594: WRPR_TNPC_I	wrpr	%r20, 0x00e7, %tnpc
	.word 0xb3e42145  ! 596: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_7, %g1, %r17
	.word 0xbfe560fa  ! 602: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r22
	.word 0xb5508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe56019  ! 608: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e46036  ! 610: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e42147  ! 614: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e52136  ! 618: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xb52c1000  ! 624: SLLX_R	sllx	%r16, %r0, %r26
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 627: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbb480000  ! 629: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684a0d3  ! 635: ADDcc_I	addcc 	%r18, 0x00d3, %r27
	.word 0xb03c4000  ! 636: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xb5e420fa  ! 637: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a0ae  ! 638: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e4a090  ! 640: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e4a1ba  ! 649: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394e1f2  ! 651: WRPR_TNPC_I	wrpr	%r19, 0x01f2, %tnpc
	.word 0xb3e56094  ! 653: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e460e5  ! 657: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb540000  ! 658: RDPR_GL	<illegal instruction>
	.word 0xbc3da056  ! 659: XNOR_I	xnor 	%r22, 0x0056, %r30
	.word 0xbaada0ce  ! 661: ANDNcc_I	andncc 	%r22, 0x00ce, %r29
	.word 0xb7508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0x81956052  ! 668: WRPR_TPC_I	wrpr	%r21, 0x0052, %tpc
	.word 0xb3500000  ! 678: RDPR_TPC	<illegal instruction>
	.word 0xb3e42048  ! 682: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd50c000  ! 683: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r22
	.word 0xbfe520c2  ! 690: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e5210a  ! 691: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e56149  ! 693: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8995a09e  ! 694: WRPR_TICK_I	wrpr	%r22, 0x009e, %tick
	.word 0x8d95e0bf  ! 696: WRPR_PSTATE_I	wrpr	%r23, 0x00bf, %pstate
	.word 0xbfe46189  ! 698: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4a007  ! 701: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e42072  ! 704: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x7467699800004f92, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8994e1cd  ! 707: WRPR_TICK_I	wrpr	%r19, 0x01cd, %tick
	mov	2, %r12
	.word 0xa1930000  ! 709: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e56070  ! 710: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x91942004  ! 711: WRPR_PIL_I	wrpr	%r16, 0x0004, %pil
	.word 0xb3e5607e  ! 713: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e0fc  ! 715: SAVE_I	save	%r23, 0x0001, %r28
	setx	0xc1e150830000998f, %g1, %r10
	.word 0x819a8000  ! 716: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95a002  ! 718: WRPR_PSTATE_I	wrpr	%r22, 0x0002, %pstate
	.word 0x859520ec  ! 720: WRPR_TSTATE_I	wrpr	%r20, 0x00ec, %tstate
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0d0  ! 727: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe46026  ! 729: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb02d6092  ! 730: ANDN_I	andn 	%r21, 0x0092, %r24
	.word 0x85952043  ! 731: WRPR_TSTATE_I	wrpr	%r20, 0x0043, %tstate
	.word 0x8194a027  ! 736: WRPR_TPC_I	wrpr	%r18, 0x0027, %tpc
	.word 0xb7e4e011  ! 737: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe461c7  ! 739: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r12
	.word 0xa1930000  ! 741: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e5a0da  ! 742: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb150c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0xbde42117  ! 745: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e4e1f6  ! 747: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8594a1e0  ! 754: WRPR_TSTATE_I	wrpr	%r18, 0x01e0, %tstate
	.word 0xbf518000  ! 755: RDPR_PSTATE	<illegal instruction>
	.word 0x8d946142  ! 757: WRPR_PSTATE_I	wrpr	%r17, 0x0142, %pstate
	.word 0xbde5a1f7  ! 759: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e5205f  ! 760: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9508000  ! 761: RDPR_TSTATE	<illegal instruction>
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520ce  ! 766: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7518000  ! 770: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5a1ba  ! 772: SAVE_I	save	%r22, 0x0001, %r31
	setx	0xaa5b3fc30000ba8f, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe46150  ! 776: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e05d  ! 780: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e4e1ef  ! 781: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe052078  ! 783: ADD_I	add 	%r20, 0x0078, %r31
	.word 0x85956076  ! 788: WRPR_TSTATE_I	wrpr	%r21, 0x0076, %tstate
	.word 0xb52c8000  ! 792: SLL_R	sll 	%r18, %r0, %r26
	.word 0xb5e4e191  ! 794: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb02ce11d  ! 795: ANDN_I	andn 	%r19, 0x011d, %r24
	setx	0xdb99602000009b41, %g1, %r10
	.word 0x819a8000  ! 796: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195217a  ! 797: WRPR_PIL_I	wrpr	%r20, 0x017a, %pil
	.word 0xb3e5211e  ! 798: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a195  ! 805: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb48ce123  ! 818: ANDcc_I	andcc 	%r19, 0x0123, %r26
	.word 0xb3e560c9  ! 820: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde42154  ! 822: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5a16b  ! 823: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5480000  ! 830: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e5209f  ! 831: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbb500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0xbde46090  ! 836: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb97d4400  ! 837: MOVR_R	movre	%r21, %r0, %r28
	.word 0xbde561be  ! 838: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e56119  ! 845: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521ef  ! 853: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5a162  ! 858: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e561a8  ! 863: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4e0a7  ! 866: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb2356186  ! 868: SUBC_I	orn 	%r21, 0x0186, %r25
	.word 0xb951c000  ! 873: RDPR_TL	<illegal instruction>
	.word 0xb3e52009  ! 878: SAVE_I	save	%r20, 0x0001, %r25
	setx	0xc2c5004b00008d9b, %g1, %r10
	.word 0x839a8000  ! 879: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e5a169  ! 880: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x9195e1ad  ! 882: WRPR_PIL_I	wrpr	%r23, 0x01ad, %pil
	.word 0xb41d61ca  ! 887: XOR_I	xor 	%r21, 0x01ca, %r26
	.word 0xb7e4203f  ! 888: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb2348000  ! 892: ORN_R	orn 	%r18, %r0, %r25
	.word 0x8994e0db  ! 894: WRPR_TICK_I	wrpr	%r19, 0x00db, %tick
	.word 0xbfe46175  ! 897: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5a012  ! 901: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e42082  ! 903: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e52173  ! 904: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e421a5  ! 905: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e104  ! 911: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5a135  ! 914: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x91956160  ! 916: WRPR_PIL_I	wrpr	%r21, 0x0160, %pil
	.word 0xb7e5613f  ! 917: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4a19d  ! 918: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde561c4  ! 920: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe520f7  ! 925: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1504000  ! 928: RDPR_TNPC	<illegal instruction>
	.word 0xb7e46140  ! 929: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb6b5a10d  ! 931: ORNcc_I	orncc 	%r22, 0x010d, %r27
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb805a00b  ! 939: ADD_I	add 	%r22, 0x000b, %r28
	setx	0x769ad55e0000dcd6, %g1, %r10
	.word 0x819a8000  ! 941: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a011  ! 942: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8194618c  ! 945: WRPR_TPC_I	wrpr	%r17, 0x018c, %tpc
	setx	data_start_1, %g1, %r19
	.word 0xb2c4a0db  ! 953: ADDCcc_I	addccc 	%r18, 0x00db, %r25
	.word 0xb5e561b6  ! 955: SAVE_I	save	%r21, 0x0001, %r26
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56052  ! 960: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e4e02b  ! 961: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xb750c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x859460de  ! 968: WRPR_TSTATE_I	wrpr	%r17, 0x00de, %tstate
	setx	data_start_0, %g1, %r16
	.word 0xb7e421ca  ! 972: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbcb5e19e  ! 973: ORNcc_I	orncc 	%r23, 0x019e, %r30
	.word 0xb3e46020  ! 977: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e4a172  ! 978: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4e1ec  ! 984: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf2c1000  ! 985: SLLX_R	sllx	%r16, %r0, %r31
	setx	data_start_6, %g1, %r20
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	.word 0xbbe5e10b  ! 993: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1540000  ! 995: RDPR_GL	<illegal instruction>
	.word 0xb9480000  ! 996: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
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
	.word 0xbc950000  ! 5: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xbb508000  ! 10: RDPR_TSTATE	rdpr	%tstate, %r29
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 12: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf43c0000  ! 17: STD_R	std	%r26, [%r16 + %r0]
	.word 0xbb508000  ! 19: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf2748000  ! 20: STX_R	stx	%r25, [%r18 + %r0]
	setx	0x5b693a0c0000dc19, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba85a1eb  ! 22: ADDcc_I	addcc 	%r22, 0x01eb, %r29
	.word 0xb9540000  ! 23: RDPR_GL	rdpr	%-, %r28
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3cc000  ! 31: STDF_R	std	%f30, [%r0, %r19]
	setx	data_start_2, %g1, %r21
	.word 0xf33d616f  ! 36: STDF_I	std	%f25, [0x016f, %r21]
	.word 0xf83c2138  ! 39: STD_I	std	%r28, [%r16 + 0x0138]
	.word 0xb4b48000  ! 42: SUBCcc_R	orncc 	%r18, %r0, %r26
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xb9480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d952166  ! 51: WRPR_PSTATE_I	wrpr	%r20, 0x0166, %pstate
	.word 0xb750c000  ! 52: RDPR_TT	rdpr	%tt, %r27
	.word 0xfa74207b  ! 63: STX_I	stx	%r29, [%r16 + 0x007b]
	setx	data_start_0, %g1, %r23
	.word 0xf035e1de  ! 67: STH_I	sth	%r24, [%r23 + 0x01de]
	.word 0xf93c0000  ! 69: STDF_R	std	%f28, [%r0, %r16]
	.word 0x879461b0  ! 70: WRPR_TT_I	wrpr	%r17, 0x01b0, %tt
	.word 0xb1480000  ! 71: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa344000  ! 73: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf22c60b6  ! 76: STB_I	stb	%r25, [%r17 + 0x00b6]
	.word 0xf2240000  ! 77: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfe7461f2  ! 83: STX_I	stx	%r31, [%r17 + 0x01f2]
	.word 0xf73d8000  ! 84: STDF_R	std	%f27, [%r0, %r22]
	.word 0x83946057  ! 86: WRPR_TNPC_I	wrpr	%r17, 0x0057, %tnpc
	.word 0xfc3c2195  ! 87: STD_I	std	%r30, [%r16 + 0x0195]
	.word 0xf43c2160  ! 96: STD_I	std	%r26, [%r16 + 0x0160]
	.word 0xf224202e  ! 99: STW_I	stw	%r25, [%r16 + 0x002e]
	.word 0xb8358000  ! 100: SUBC_R	orn 	%r22, %r0, %r28
	.word 0x91942011  ! 101: WRPR_PIL_I	wrpr	%r16, 0x0011, %pil
	.word 0xb7510000  ! 102: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf43d4000  ! 104: STD_R	std	%r26, [%r21 + %r0]
	.word 0x8794e15b  ! 105: WRPR_TT_I	wrpr	%r19, 0x015b, %tt
	.word 0xb2246065  ! 106: SUB_I	sub 	%r17, 0x0065, %r25
	.word 0xfd3d8000  ! 107: STDF_R	std	%f30, [%r0, %r22]
	.word 0xb9480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf03dc000  ! 110: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf22ce1b1  ! 111: STB_I	stb	%r25, [%r19 + 0x01b1]
	.word 0xfa244000  ! 114: STW_R	stw	%r29, [%r17 + %r0]
	.word 0x8994611e  ! 119: WRPR_TICK_I	wrpr	%r17, 0x011e, %tick
	.word 0xf6358000  ! 120: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xbf50c000  ! 124: RDPR_TT	rdpr	%tt, %r31
	setx	data_start_5, %g1, %r17
	.word 0xfa2ca077  ! 131: STB_I	stb	%r29, [%r18 + 0x0077]
	.word 0xbc1dc000  ! 132: XOR_R	xor 	%r23, %r0, %r30
	.word 0xf475e181  ! 137: STX_I	stx	%r26, [%r23 + 0x0181]
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3de08c  ! 140: STD_I	std	%r30, [%r23 + 0x008c]
	.word 0xf474a1ba  ! 141: STX_I	stx	%r26, [%r18 + 0x01ba]
	.word 0xf43c0000  ! 142: STD_R	std	%r26, [%r16 + %r0]
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8352029  ! 146: ORN_I	orn 	%r20, 0x0029, %r28
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33cc000  ! 153: STDF_R	std	%f25, [%r0, %r19]
	setx	data_start_3, %g1, %r18
	.word 0x8594205f  ! 157: WRPR_TSTATE_I	wrpr	%r16, 0x005f, %tstate
	.word 0xf274616b  ! 159: STX_I	stx	%r25, [%r17 + 0x016b]
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81956171  ! 164: WRPR_TPC_I	wrpr	%r21, 0x0171, %tpc
	.word 0xbf504000  ! 165: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf03521ee  ! 166: STH_I	sth	%r24, [%r20 + 0x01ee]
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24e1b8  ! 172: STW_I	stw	%r30, [%r19 + 0x01b8]
	.word 0xf824e182  ! 173: STW_I	stw	%r28, [%r19 + 0x0182]
	.word 0xfe3c8000  ! 181: STD_R	std	%r31, [%r18 + %r0]
	.word 0xf13d60fc  ! 182: STDF_I	std	%f24, [0x00fc, %r21]
	.word 0xbf3d8000  ! 184: SRA_R	sra 	%r22, %r0, %r31
	.word 0xb5508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xfe35c000  ! 190: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xbd500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0x9195209c  ! 193: WRPR_PIL_I	wrpr	%r20, 0x009c, %pil
	.word 0xf6250000  ! 194: STW_R	stw	%r27, [%r20 + %r0]
	.word 0x8994a053  ! 196: WRPR_TICK_I	wrpr	%r18, 0x0053, %tick
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 203: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xb20dc000  ! 204: AND_R	and 	%r23, %r0, %r25
	.word 0xbaad6085  ! 208: ANDNcc_I	andncc 	%r21, 0x0085, %r29
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435a06f  ! 220: STH_I	sth	%r26, [%r22 + 0x006f]
	.word 0x919561a6  ! 221: WRPR_PIL_I	wrpr	%r21, 0x01a6, %pil
	.word 0xfa34e0fe  ! 222: STH_I	sth	%r29, [%r19 + 0x00fe]
	setx	data_start_2, %g1, %r23
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3c6108  ! 227: STD_I	std	%r30, [%r17 + 0x0108]
	.word 0xb2452119  ! 228: ADDC_I	addc 	%r20, 0x0119, %r25
	.word 0x8394a1c5  ! 229: WRPR_TNPC_I	wrpr	%r18, 0x01c5, %tnpc
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 232: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf03de183  ! 234: STD_I	std	%r24, [%r23 + 0x0183]
	setx	0xf6c881d600006e55, %g1, %r10
	.word 0x839a8000  ! 235: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe35c000  ! 238: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf6358000  ! 239: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfa2c21d0  ! 241: STB_I	stb	%r29, [%r16 + 0x01d0]
	.word 0xf83c2069  ! 244: STD_I	std	%r28, [%r16 + 0x0069]
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2de194  ! 251: STB_I	stb	%r31, [%r23 + 0x0194]
	.word 0xbf540000  ! 255: RDPR_GL	rdpr	%-, %r31
	.word 0xb5540000  ! 256: RDPR_GL	<illegal instruction>
	.word 0xf33d8000  ! 257: STDF_R	std	%f25, [%r0, %r22]
	.word 0xb29de152  ! 259: XORcc_I	xorcc 	%r23, 0x0152, %r25
	.word 0xfc3de1a2  ! 263: STD_I	std	%r30, [%r23 + 0x01a2]
	.word 0xfa2de054  ! 266: STB_I	stb	%r29, [%r23 + 0x0054]
	.word 0xfd3cc000  ! 267: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf2744000  ! 268: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf0744000  ! 269: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xbec46040  ! 273: ADDCcc_I	addccc 	%r17, 0x0040, %r31
	.word 0xbab5e0a3  ! 274: SUBCcc_I	orncc 	%r23, 0x00a3, %r29
	.word 0xfc3c8000  ! 276: STD_R	std	%r30, [%r18 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc3ca095  ! 286: XNOR_I	xnor 	%r18, 0x0095, %r30
	.word 0xf2754000  ! 287: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa740000  ! 289: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xff3c4000  ! 290: STDF_R	std	%f31, [%r0, %r17]
	.word 0xbb520000  ! 291: RDPR_PIL	rdpr	%pil, %r29
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53c4000  ! 300: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf2350000  ! 301: STH_R	sth	%r25, [%r20 + %r0]
	setx	0x443b7c50000ed0b, %g1, %r10
	.word 0x839a8000  ! 303: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe758000  ! 309: STX_R	stx	%r31, [%r22 + %r0]
	.word 0x859561f1  ! 319: WRPR_TSTATE_I	wrpr	%r21, 0x01f1, %tstate
	.word 0xb1500000  ! 320: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf33ca15c  ! 321: STDF_I	std	%f25, [0x015c, %r18]
	.word 0xf635e175  ! 322: STH_I	sth	%r27, [%r23 + 0x0175]
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 325: MOVcc_I	<illegal instruction>
	.word 0xfa74611b  ! 328: STX_I	stx	%r29, [%r17 + 0x011b]
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 335: RDPR_TPC	<illegal instruction>
	.word 0xbd504000  ! 336: RDPR_TNPC	<illegal instruction>
	.word 0xf6258000  ! 338: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xb68ca1ac  ! 339: ANDcc_I	andcc 	%r18, 0x01ac, %r27
	.word 0xfe358000  ! 343: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf53c4000  ! 344: STDF_R	std	%f26, [%r0, %r17]
	.word 0xfa25604a  ! 346: STW_I	stw	%r29, [%r21 + 0x004a]
	.word 0xff3da166  ! 348: STDF_I	std	%f31, [0x0166, %r22]
	.word 0xf62c60c7  ! 349: STB_I	stb	%r27, [%r17 + 0x00c7]
	.word 0xfe35c000  ! 351: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xfa356006  ! 352: STH_I	sth	%r29, [%r21 + 0x0006]
	.word 0xba35c000  ! 353: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xfc3c2041  ! 358: STD_I	std	%r30, [%r16 + 0x0041]
	.word 0xfc35214b  ! 359: STH_I	sth	%r30, [%r20 + 0x014b]
	.word 0xb550c000  ! 362: RDPR_TT	<illegal instruction>
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c6188  ! 366: XORcc_I	xorcc 	%r17, 0x0188, %r27
	mov	0, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6354000  ! 372: STH_R	sth	%r27, [%r21 + %r0]
	.word 0x839460ff  ! 373: WRPR_TNPC_I	wrpr	%r17, 0x00ff, %tnpc
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 378: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfe2cc000  ! 380: STB_R	stb	%r31, [%r19 + %r0]
	setx	0x4957dc720000590c, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf074a1f7  ! 387: STX_I	stx	%r24, [%r18 + 0x01f7]
	.word 0xf23ce0a7  ! 388: STD_I	std	%r25, [%r19 + 0x00a7]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02420db  ! 397: STW_I	stw	%r24, [%r16 + 0x00db]
	.word 0xbd508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	2, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994e121  ! 401: WRPR_TICK_I	wrpr	%r19, 0x0121, %tick
	.word 0xb37d4400  ! 402: MOVR_R	movre	%r21, %r0, %r25
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 406: RDPR_TL	rdpr	%tl, %r29
	.word 0xf02ce081  ! 409: STB_I	stb	%r24, [%r19 + 0x0081]
	.word 0xfc3ca1b3  ! 410: STD_I	std	%r30, [%r18 + 0x01b3]
	.word 0x859520cc  ! 411: WRPR_TSTATE_I	wrpr	%r20, 0x00cc, %tstate
	.word 0xf4740000  ! 412: STX_R	stx	%r26, [%r16 + %r0]
	setx	0xc0851c4100001e97, %g1, %r10
	.word 0x819a8000  ! 413: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc2ce1af  ! 416: ANDN_I	andn 	%r19, 0x01af, %r30
	.word 0xf62c8000  ! 418: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xb92dd000  ! 420: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb63de0c0  ! 422: XNOR_I	xnor 	%r23, 0x00c0, %r27
	.word 0xf4248000  ! 423: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf035e0fb  ! 426: STH_I	sth	%r24, [%r23 + 0x00fb]
	.word 0xfd3c4000  ! 427: STDF_R	std	%f30, [%r0, %r17]
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6746114  ! 430: STX_I	stx	%r27, [%r17 + 0x0114]
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89952007  ! 435: WRPR_TICK_I	wrpr	%r20, 0x0007, %tick
	.word 0x8d9521ef  ! 439: WRPR_PSTATE_I	wrpr	%r20, 0x01ef, %pstate
	.word 0xb13dd000  ! 440: SRAX_R	srax	%r23, %r0, %r24
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce087  ! 453: STB_I	stb	%r27, [%r19 + 0x0087]
	.word 0xfb3d60fe  ! 460: STDF_I	std	%f29, [0x00fe, %r21]
	.word 0xfe248000  ! 461: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xbf540000  ! 467: RDPR_GL	rdpr	%-, %r31
	.word 0xfc752037  ! 468: STX_I	stx	%r30, [%r20 + 0x0037]
	.word 0xf4358000  ! 469: STH_R	sth	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6340000  ! 475: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xba3cc000  ! 477: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xbb344000  ! 478: SRL_R	srl 	%r17, %r0, %r29
	.word 0xb88cc000  ! 479: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xf434e19e  ! 480: STH_I	sth	%r26, [%r19 + 0x019e]
	.word 0xf234e0f4  ! 481: STH_I	sth	%r25, [%r19 + 0x00f4]
	.word 0xf2740000  ! 482: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfa24c000  ! 483: STW_R	stw	%r29, [%r19 + %r0]
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a018  ! 487: WRPR_TPC_I	wrpr	%r18, 0x0018, %tpc
	.word 0xb89c60a4  ! 488: XORcc_I	xorcc 	%r17, 0x00a4, %r28
	.word 0xbf2c1000  ! 489: SLLX_R	sllx	%r16, %r0, %r31
	.word 0xb1504000  ! 490: RDPR_TNPC	rdpr	%tnpc, %r24
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83c0000  ! 492: STD_R	std	%r28, [%r16 + %r0]
	.word 0xb9504000  ! 495: RDPR_TNPC	<illegal instruction>
	.word 0xfc25c000  ! 496: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb134b001  ! 497: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb5508000  ! 498: RDPR_TSTATE	<illegal instruction>
	.word 0xf875202f  ! 499: STX_I	stx	%r28, [%r20 + 0x002f]
	mov	0, %r12
	.word 0x8f930000  ! 500: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53c8000  ! 504: STDF_R	std	%f26, [%r0, %r18]
	.word 0xf6344000  ! 506: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfc2d212e  ! 507: STB_I	stb	%r30, [%r20 + 0x012e]
	.word 0xbf504000  ! 508: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb12d3001  ! 510: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xf23c2189  ! 512: STD_I	std	%r25, [%r16 + 0x0189]
	.word 0xb9510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xf275613a  ! 522: STX_I	stx	%r25, [%r21 + 0x013a]
	.word 0xf33de13d  ! 523: STDF_I	std	%f25, [0x013d, %r23]
	.word 0xfe344000  ! 524: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xb6140000  ! 531: OR_R	or 	%r16, %r0, %r27
	.word 0xf8748000  ! 533: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xbe8da1ba  ! 536: ANDcc_I	andcc 	%r22, 0x01ba, %r31
	.word 0xfe344000  ! 537: STH_R	sth	%r31, [%r17 + %r0]
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 540: RDPR_PSTATE	<illegal instruction>
	.word 0xf42c208a  ! 542: STB_I	stb	%r26, [%r16 + 0x008a]
	.word 0xfa3c4000  ! 544: STD_R	std	%r29, [%r17 + %r0]
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74a149  ! 548: STX_I	stx	%r29, [%r18 + 0x0149]
	.word 0xfe2cc000  ! 549: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf6254000  ! 552: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfc75a135  ! 555: STX_I	stx	%r30, [%r22 + 0x0135]
	.word 0xf73da1b5  ! 558: STDF_I	std	%f27, [0x01b5, %r22]
	.word 0x8d95a00f  ! 560: WRPR_PSTATE_I	wrpr	%r22, 0x000f, %pstate
	.word 0x839421fd  ! 564: WRPR_TNPC_I	wrpr	%r16, 0x01fd, %tnpc
	.word 0xfc258000  ! 565: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf024602b  ! 568: STW_I	stw	%r24, [%r17 + 0x002b]
	.word 0xf6250000  ! 570: STW_R	stw	%r27, [%r20 + %r0]
	setx	0xcdd935fa0000fdd0, %g1, %r10
	.word 0x819a8000  ! 571: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa34204c  ! 575: STH_I	sth	%r29, [%r16 + 0x004c]
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42460b8  ! 579: STW_I	stw	%r26, [%r17 + 0x00b8]
	.word 0xbeacc000  ! 580: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xf03cc000  ! 581: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf6344000  ! 583: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf53d8000  ! 587: STDF_R	std	%f26, [%r0, %r22]
	.word 0x919460cb  ! 591: WRPR_PIL_I	wrpr	%r17, 0x00cb, %pil
	.word 0xfe24e0ae  ! 592: STW_I	stw	%r31, [%r19 + 0x00ae]
	.word 0x839561b5  ! 594: WRPR_TNPC_I	wrpr	%r21, 0x01b5, %tnpc
	.word 0xf02c61a3  ! 595: STB_I	stb	%r24, [%r17 + 0x01a3]
	.word 0xfa3c4000  ! 597: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf23de11c  ! 599: STD_I	std	%r25, [%r23 + 0x011c]
	setx	data_start_0, %g1, %r16
	.word 0xfa2da1c6  ! 603: STB_I	stb	%r29, [%r22 + 0x01c6]
	setx	data_start_5, %g1, %r16
	.word 0xbd508000  ! 606: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf22c4000  ! 612: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf73d0000  ! 616: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf22cc000  ! 622: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xbf510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xb52c1000  ! 624: SLLX_R	sllx	%r16, %r0, %r26
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 626: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xb7480000  ! 627: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3480000  ! 629: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e196  ! 634: STX_I	stx	%r27, [%r23 + 0x0196]
	.word 0xb08461e6  ! 635: ADDcc_I	addcc 	%r17, 0x01e6, %r24
	.word 0xb03dc000  ! 636: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xf93de18e  ! 639: STDF_I	std	%f28, [0x018e, %r23]
	.word 0xf62dc000  ! 641: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf83c8000  ! 650: STD_R	std	%r28, [%r18 + %r0]
	.word 0x8395214b  ! 651: WRPR_TNPC_I	wrpr	%r20, 0x014b, %tnpc
	.word 0xfc2cc000  ! 654: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb3540000  ! 658: RDPR_GL	rdpr	%-, %r25
	.word 0xba3d211e  ! 659: XNOR_I	xnor 	%r20, 0x011e, %r29
	.word 0xf93d604b  ! 660: STDF_I	std	%f28, [0x004b, %r21]
	.word 0xb6ac619f  ! 661: ANDNcc_I	andncc 	%r17, 0x019f, %r27
	.word 0xbb508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0xf82ca1f1  ! 665: STB_I	stb	%r28, [%r18 + 0x01f1]
	.word 0xf234c000  ! 666: STH_R	sth	%r25, [%r19 + %r0]
	.word 0x81946189  ! 668: WRPR_TPC_I	wrpr	%r17, 0x0189, %tpc
	.word 0xf634c000  ! 670: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfa354000  ! 673: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf0744000  ! 674: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xfa748000  ! 676: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xb9500000  ! 678: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfc744000  ! 679: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb550c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xf23c8000  ! 685: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf2754000  ! 686: STX_R	stx	%r25, [%r21 + %r0]
	setx	data_start_1, %g1, %r20
	.word 0xf42d6110  ! 692: STB_I	stb	%r26, [%r21 + 0x0110]
	.word 0x89942078  ! 694: WRPR_TICK_I	wrpr	%r16, 0x0078, %tick
	.word 0xf0758000  ! 695: STX_R	stx	%r24, [%r22 + %r0]
	.word 0x8d9421c2  ! 696: WRPR_PSTATE_I	wrpr	%r16, 0x01c2, %pstate
	.word 0xf23da1be  ! 697: STD_I	std	%r25, [%r22 + 0x01be]
	setx	0x9162d9100008fc0, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8995a00c  ! 707: WRPR_TICK_I	wrpr	%r22, 0x000c, %tick
	mov	2, %r12
	.word 0xa1930000  ! 709: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9194e13c  ! 711: WRPR_PIL_I	wrpr	%r19, 0x013c, %pil
	.word 0xfd3d2006  ! 712: STDF_I	std	%f30, [0x0006, %r20]
	setx	0x7c57b4bc0000d959, %g1, %r10
	.word 0x819a8000  ! 716: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xff3d6095  ! 717: STDF_I	std	%f31, [0x0095, %r21]
	.word 0x8d95a062  ! 718: WRPR_PSTATE_I	wrpr	%r22, 0x0062, %pstate
	.word 0x8594e1a8  ! 720: WRPR_TSTATE_I	wrpr	%r19, 0x01a8, %tstate
	.word 0xfe35e15b  ! 722: STH_I	sth	%r31, [%r23 + 0x015b]
	.word 0xf475a0a0  ! 723: STX_I	stx	%r26, [%r22 + 0x00a0]
	.word 0xf4354000  ! 724: STH_R	sth	%r26, [%r21 + %r0]
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d212a  ! 728: STB_I	stb	%r30, [%r20 + 0x012a]
	.word 0xb62ce12f  ! 730: ANDN_I	andn 	%r19, 0x012f, %r27
	.word 0x859461e4  ! 731: WRPR_TSTATE_I	wrpr	%r17, 0x01e4, %tstate
	.word 0x8195e18c  ! 736: WRPR_TPC_I	wrpr	%r23, 0x018c, %tpc
	mov	1, %r12
	.word 0xa1930000  ! 741: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb350c000  ! 744: RDPR_TT	rdpr	%tt, %r25
	.word 0xf83d6113  ! 749: STD_I	std	%r28, [%r21 + 0x0113]
	.word 0xf43d0000  ! 752: STD_R	std	%r26, [%r20 + %r0]
	.word 0xfe34e1e2  ! 753: STH_I	sth	%r31, [%r19 + 0x01e2]
	.word 0x8595a094  ! 754: WRPR_TSTATE_I	wrpr	%r22, 0x0094, %tstate
	.word 0xb1518000  ! 755: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf03d4000  ! 756: STD_R	std	%r24, [%r21 + %r0]
	.word 0x8d95214d  ! 757: WRPR_PSTATE_I	wrpr	%r20, 0x014d, %pstate
	.word 0xb7508000  ! 761: RDPR_TSTATE	rdpr	%tstate, %r27
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 765: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfd3ca050  ! 769: STDF_I	std	%f30, [0x0050, %r18]
	.word 0xb1518000  ! 770: RDPR_PSTATE	<illegal instruction>
	setx	0x51f6a75f0000fc85, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf234201b  ! 775: STH_I	sth	%r25, [%r16 + 0x001b]
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6056158  ! 783: ADD_I	add 	%r21, 0x0158, %r27
	.word 0xf825618f  ! 785: STW_I	stw	%r28, [%r21 + 0x018f]
	.word 0xf835212f  ! 787: STH_I	sth	%r28, [%r20 + 0x012f]
	.word 0x85952178  ! 788: WRPR_TSTATE_I	wrpr	%r20, 0x0178, %tstate
	.word 0xbf2c8000  ! 792: SLL_R	sll 	%r18, %r0, %r31
	.word 0xbe2c6049  ! 795: ANDN_I	andn 	%r17, 0x0049, %r31
	setx	0x1951b9d10000ce82, %g1, %r10
	.word 0x819a8000  ! 796: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9194608c  ! 797: WRPR_PIL_I	wrpr	%r17, 0x008c, %pil
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53dc000  ! 803: STDF_R	std	%f26, [%r0, %r23]
	.word 0xf0350000  ! 804: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfe746144  ! 807: STX_I	stx	%r31, [%r17 + 0x0144]
	.word 0xfc3d0000  ! 812: STD_R	std	%r30, [%r20 + %r0]
	.word 0xb28ca1a1  ! 818: ANDcc_I	andcc 	%r18, 0x01a1, %r25
	.word 0xf0744000  ! 821: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf22c8000  ! 825: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf83c21e9  ! 826: STD_I	std	%r28, [%r16 + 0x01e9]
	.word 0xb9480000  ! 830: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0xfc3c60e1  ! 834: STD_I	std	%r30, [%r17 + 0x00e1]
	.word 0xf225603f  ! 835: STW_I	stw	%r25, [%r21 + 0x003f]
	.word 0xbd7c8400  ! 837: MOVR_R	movre	%r18, %r0, %r30
	.word 0xfc7560e9  ! 839: STX_I	stx	%r30, [%r21 + 0x00e9]
	.word 0xf93d20be  ! 841: STDF_I	std	%f28, [0x00be, %r20]
	.word 0xfd3cc000  ! 842: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf2754000  ! 843: STX_R	stx	%r25, [%r21 + %r0]
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xfc3c0000  ! 850: STD_R	std	%r30, [%r16 + %r0]
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d604f  ! 856: STB_I	stb	%r29, [%r21 + 0x004f]
	.word 0xf33d8000  ! 864: STDF_R	std	%f25, [%r0, %r22]
	.word 0xba34a1e9  ! 868: SUBC_I	orn 	%r18, 0x01e9, %r29
	.word 0xf62d0000  ! 869: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfe25c000  ! 872: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xbd51c000  ! 873: RDPR_TL	<illegal instruction>
	.word 0xfa3cc000  ! 874: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf234207e  ! 876: STH_I	sth	%r25, [%r16 + 0x007e]
	setx	0xb208c6900008b4c, %g1, %r10
	.word 0x839a8000  ! 879: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfb3d8000  ! 881: STDF_R	std	%f29, [%r0, %r22]
	.word 0x919460f1  ! 882: WRPR_PIL_I	wrpr	%r17, 0x00f1, %pil
	.word 0xb61de0a2  ! 887: XOR_I	xor 	%r23, 0x00a2, %r27
	.word 0xb835c000  ! 892: ORN_R	orn 	%r23, %r0, %r28
	.word 0x899420ac  ! 894: WRPR_TICK_I	wrpr	%r16, 0x00ac, %tick
	.word 0xfe3ce08f  ! 896: STD_I	std	%r31, [%r19 + 0x008f]
	.word 0xfc3d0000  ! 898: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfe74c000  ! 899: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf424c000  ! 900: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf93c0000  ! 902: STDF_R	std	%f28, [%r0, %r16]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 907: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf63cc000  ! 909: STD_R	std	%r27, [%r19 + %r0]
	.word 0x919421cb  ! 916: WRPR_PIL_I	wrpr	%r16, 0x01cb, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf834e1be  ! 922: STH_I	sth	%r28, [%r19 + 0x01be]
	.word 0xf82ca0c3  ! 927: STB_I	stb	%r28, [%r18 + 0x00c3]
	.word 0xbb504000  ! 928: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb8b4202f  ! 931: ORNcc_I	orncc 	%r16, 0x002f, %r28
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 938: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xbe04e04b  ! 939: ADD_I	add 	%r19, 0x004b, %r31
	setx	0xd43aaad10000ebd2, %g1, %r10
	.word 0x819a8000  ! 941: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf23d4000  ! 944: STD_R	std	%r25, [%r21 + %r0]
	.word 0x8195a0a3  ! 945: WRPR_TPC_I	wrpr	%r22, 0x00a3, %tpc
	.word 0xf675e0e5  ! 946: STX_I	stx	%r27, [%r23 + 0x00e5]
	.word 0xfc3ce09a  ! 947: STD_I	std	%r30, [%r19 + 0x009a]
	.word 0xf13ce136  ! 951: STDF_I	std	%f24, [0x0136, %r19]
	setx	data_start_2, %g1, %r23
	.word 0xb0c560ba  ! 953: ADDCcc_I	addccc 	%r21, 0x00ba, %r24
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 962: STH_R	sth	%r24, [%r18 + %r0]
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 964: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb150c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x8594e03a  ! 968: WRPR_TSTATE_I	wrpr	%r19, 0x003a, %tstate
	setx	data_start_7, %g1, %r20
	.word 0xb2b420c1  ! 973: ORNcc_I	orncc 	%r16, 0x00c1, %r25
	.word 0xf6746045  ! 975: STX_I	stx	%r27, [%r17 + 0x0045]
	.word 0xfe3d4000  ! 979: STD_R	std	%r31, [%r21 + %r0]
	.word 0xfa34604e  ! 983: STH_I	sth	%r29, [%r17 + 0x004e]
	.word 0xb12c1000  ! 985: SLLX_R	sllx	%r16, %r0, %r24
	setx	data_start_2, %g1, %r17
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 991: STW_R	stw	%r31, [%r23 + %r0]
	setx	data_start_0, %g1, %r22
	.word 0xb9540000  ! 995: RDPR_GL	rdpr	%-, %r28
	.word 0xbd480000  ! 996: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
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
	.word 0xb0940000  ! 5: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xfc1c61ff  ! 9: LDD_I	ldd	[%r17 + 0x01ff], %r30
	.word 0xb7508000  ! 10: RDPR_TSTATE	<illegal instruction>
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 12: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf00560bf  ! 14: LDUW_I	lduw	[%r21 + 0x00bf], %r24
	.word 0xf45d4000  ! 15: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xf6144000  ! 18: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xb7508000  ! 19: RDPR_TSTATE	<illegal instruction>
	setx	0x5d4d2b8300000b0d, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2856062  ! 22: ADDcc_I	addcc 	%r21, 0x0062, %r25
	.word 0xbf540000  ! 23: RDPR_GL	<illegal instruction>
	.word 0xf44d8000  ! 24: LDSB_R	ldsb	[%r22 + %r0], %r26
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf405a0f2  ! 29: LDUW_I	lduw	[%r22 + 0x00f2], %r26
	setx	data_start_2, %g1, %r19
	.word 0xf415616a  ! 37: LDUH_I	lduh	[%r21 + 0x016a], %r26
	.word 0xf91d0000  ! 38: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf4048000  ! 40: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xfa058000  ! 41: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xb2b5c000  ! 42: SUBCcc_R	orncc 	%r23, %r0, %r25
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41cc000  ! 45: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xbb504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xbf480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8d9521de  ! 51: WRPR_PSTATE_I	wrpr	%r20, 0x01de, %pstate
	.word 0xb350c000  ! 52: RDPR_TT	<illegal instruction>
	.word 0xf815e10d  ! 57: LDUH_I	lduh	[%r23 + 0x010d], %r28
	.word 0xf31d8000  ! 60: LDDF_R	ldd	[%r22, %r0], %f25
	setx	data_start_4, %g1, %r17
	.word 0x8794e199  ! 70: WRPR_TT_I	wrpr	%r19, 0x0199, %tt
	.word 0xb7480000  ! 71: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc5d8000  ! 78: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf4554000  ! 81: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf81c0000  ! 82: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0x8394210c  ! 86: WRPR_TNPC_I	wrpr	%r16, 0x010c, %tnpc
	.word 0xf40dc000  ! 93: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf85d8000  ! 94: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf41d4000  ! 97: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xbe358000  ! 100: SUBC_R	orn 	%r22, %r0, %r31
	.word 0x9194e140  ! 101: WRPR_PIL_I	wrpr	%r19, 0x0140, %pil
	.word 0xb9510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0x8794214c  ! 105: WRPR_TT_I	wrpr	%r16, 0x014c, %tt
	.word 0xbc24e0aa  ! 106: SUB_I	sub 	%r19, 0x00aa, %r30
	.word 0xfe1d61bd  ! 108: LDD_I	ldd	[%r21 + 0x01bd], %r31
	.word 0xb5480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf04ce1b6  ! 113: LDSB_I	ldsb	[%r19 + 0x01b6], %r24
	.word 0xf64d0000  ! 117: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0x8995e13a  ! 119: WRPR_TICK_I	wrpr	%r23, 0x013a, %tick
	.word 0xfe5d0000  ! 122: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xb150c000  ! 124: RDPR_TT	rdpr	%tt, %r24
	setx	data_start_4, %g1, %r16
	.word 0xb61c0000  ! 132: XOR_R	xor 	%r16, %r0, %r27
	.word 0xfa5ce104  ! 134: LDX_I	ldx	[%r19 + 0x0104], %r29
	.word 0xfa0ca1b6  ! 135: LDUB_I	ldub	[%r18 + 0x01b6], %r29
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21c8000  ! 139: LDD_R	ldd	[%r18 + %r0], %r25
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635e1d8  ! 146: ORN_I	orn 	%r23, 0x01d8, %r27
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415a156  ! 149: LDUH_I	lduh	[%r22 + 0x0156], %r26
	.word 0xf44d6010  ! 150: LDSB_I	ldsb	[%r21 + 0x0010], %r26
	.word 0xfa558000  ! 154: LDSH_R	ldsh	[%r22 + %r0], %r29
	setx	data_start_6, %g1, %r23
	.word 0x859420a1  ! 157: WRPR_TSTATE_I	wrpr	%r16, 0x00a1, %tstate
	.word 0xf60c0000  ! 158: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xfc4ca03e  ! 160: LDSB_I	ldsb	[%r18 + 0x003e], %r30
	.word 0xfd1ce020  ! 162: LDDF_I	ldd	[%r19, 0x0020], %f30
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a1e8  ! 164: WRPR_TPC_I	wrpr	%r18, 0x01e8, %tpc
	.word 0xbb504000  ! 165: RDPR_TNPC	rdpr	%tnpc, %r29
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44dc000  ! 168: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xf41d8000  ! 171: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xf2040000  ! 175: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xfe0c20b3  ! 177: LDUB_I	ldub	[%r16 + 0x00b3], %r31
	.word 0xfa1561b8  ! 183: LDUH_I	lduh	[%r21 + 0x01b8], %r29
	.word 0xb53d0000  ! 184: SRA_R	sra 	%r20, %r0, %r26
	.word 0xb1508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xfc542185  ! 187: LDSH_I	ldsh	[%r16 + 0x0185], %r30
	.word 0xb3500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0x9194213a  ! 193: WRPR_PIL_I	wrpr	%r16, 0x013a, %pil
	.word 0x8994a1e4  ! 196: WRPR_TICK_I	wrpr	%r18, 0x01e4, %tick
	.word 0xf51c8000  ! 197: LDDF_R	ldd	[%r18, %r0], %f26
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4454000  ! 202: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xb80d0000  ! 204: AND_R	and 	%r20, %r0, %r28
	.word 0xb6aca1c1  ! 208: ANDNcc_I	andncc 	%r18, 0x01c1, %r27
	.word 0xf2158000  ! 210: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xf844e0dc  ! 211: LDSW_I	ldsw	[%r19 + 0x00dc], %r28
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11d8000  ! 213: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xf01d4000  ! 214: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xf2554000  ! 216: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf31c205e  ! 217: LDDF_I	ldd	[%r16, 0x005e], %f25
	.word 0x91956051  ! 221: WRPR_PIL_I	wrpr	%r21, 0x0051, %pil
	.word 0xf005617f  ! 224: LDUW_I	lduw	[%r21 + 0x017f], %r24
	setx	data_start_6, %g1, %r19
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0446159  ! 228: ADDC_I	addc 	%r17, 0x0159, %r24
	.word 0x8395e0ac  ! 229: WRPR_TNPC_I	wrpr	%r23, 0x00ac, %tnpc
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc15e06c  ! 233: LDUH_I	lduh	[%r23 + 0x006c], %r30
	setx	0xbe44cd0d00000c80, %g1, %r10
	.word 0x839a8000  ! 235: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf0056100  ! 245: LDUW_I	lduw	[%r21 + 0x0100], %r24
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d613e  ! 249: LDUB_I	ldub	[%r21 + 0x013e], %r24
	.word 0xf64d0000  ! 250: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfc058000  ! 252: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf6456150  ! 254: LDSW_I	ldsw	[%r21 + 0x0150], %r27
	.word 0xb1540000  ! 255: RDPR_GL	rdpr	%-, %r24
	.word 0xbf540000  ! 256: RDPR_GL	<illegal instruction>
	.word 0xfa1c0000  ! 258: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xb29c2103  ! 259: XORcc_I	xorcc 	%r16, 0x0103, %r25
	.word 0xf61c20d3  ! 260: LDD_I	ldd	[%r16 + 0x00d3], %r27
	.word 0xf2056074  ! 261: LDUW_I	lduw	[%r21 + 0x0074], %r25
	.word 0xf44da1a6  ! 262: LDSB_I	ldsb	[%r22 + 0x01a6], %r26
	.word 0xb6c5e12f  ! 273: ADDCcc_I	addccc 	%r23, 0x012f, %r27
	.word 0xb2b461ca  ! 274: SUBCcc_I	orncc 	%r17, 0x01ca, %r25
	.word 0xf8144000  ! 277: LDUH_R	lduh	[%r17 + %r0], %r28
	mov	0, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf81ce126  ! 281: LDD_I	ldd	[%r19 + 0x0126], %r28
	.word 0xf65d4000  ! 282: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf45c60b1  ! 284: LDX_I	ldx	[%r17 + 0x00b1], %r26
	.word 0xfc15a0a3  ! 285: LDUH_I	lduh	[%r22 + 0x00a3], %r30
	.word 0xbc3de12b  ! 286: XNOR_I	xnor 	%r23, 0x012b, %r30
	.word 0xb5520000  ! 291: RDPR_PIL	<illegal instruction>
	.word 0xfa44e00b  ! 292: LDSW_I	ldsw	[%r19 + 0x000b], %r29
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa444000  ! 298: LDSW_R	ldsw	[%r17 + %r0], %r29
	setx	0xde6ea12b0000ffd7, %g1, %r10
	.word 0x839a8000  ! 303: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf24d8000  ! 313: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfa054000  ! 314: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xf415a1fe  ! 317: LDUH_I	lduh	[%r22 + 0x01fe], %r26
	.word 0xf44ca17a  ! 318: LDSB_I	ldsb	[%r18 + 0x017a], %r26
	.word 0x8595e0f0  ! 319: WRPR_TSTATE_I	wrpr	%r23, 0x00f0, %tstate
	.word 0xb9500000  ! 320: RDPR_TPC	<illegal instruction>
	.word 0xf44cc000  ! 323: LDSB_R	ldsb	[%r19 + %r0], %r26
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 325: MOVcc_I	<illegal instruction>
	.word 0xf6458000  ! 327: LDSW_R	ldsw	[%r22 + %r0], %r27
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 335: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 336: RDPR_TNPC	<illegal instruction>
	.word 0xbc8d6080  ! 339: ANDcc_I	andcc 	%r21, 0x0080, %r30
	.word 0xf21de182  ! 340: LDD_I	ldd	[%r23 + 0x0182], %r25
	.word 0xf04d0000  ! 347: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xbe34c000  ! 353: SUBC_R	orn 	%r19, %r0, %r31
	.word 0xf91c8000  ! 357: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xfe5d4000  ! 360: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xb750c000  ! 362: RDPR_TT	<illegal instruction>
	.word 0xf21c4000  ! 363: LDD_R	ldd	[%r17 + %r0], %r25
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9de083  ! 366: XORcc_I	xorcc 	%r23, 0x0083, %r29
	.word 0xf71de107  ! 368: LDDF_I	ldd	[%r23, 0x0107], %f27
	mov	2, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfb1da1b3  ! 371: LDDF_I	ldd	[%r22, 0x01b3], %f29
	.word 0x83956133  ! 373: WRPR_TNPC_I	wrpr	%r21, 0x0133, %tnpc
	.word 0xf815e1b8  ! 374: LDUH_I	lduh	[%r23 + 0x01b8], %r28
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80da1aa  ! 377: LDUB_I	ldub	[%r22 + 0x01aa], %r28
	.word 0xb9508000  ! 378: RDPR_TSTATE	<illegal instruction>
	.word 0xf81c4000  ! 379: LDD_R	ldd	[%r17 + %r0], %r28
	setx	0x40090ac6000099cc, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe1cc000  ! 383: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xfa0dc000  ! 385: LDUB_R	ldub	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf64ce1e7  ! 393: LDSB_I	ldsb	[%r19 + 0x01e7], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6540000  ! 395: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xb7508000  ! 398: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf91ca05e  ! 400: LDDF_I	ldd	[%r18, 0x005e], %f28
	.word 0x8995618e  ! 401: WRPR_TICK_I	wrpr	%r21, 0x018e, %tick
	.word 0xb57c8400  ! 402: MOVR_R	movre	%r18, %r0, %r26
	.word 0xf605c000  ! 403: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xfe058000  ! 404: LDUW_R	lduw	[%r22 + %r0], %r31
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 406: RDPR_TL	<illegal instruction>
	.word 0x8595e09b  ! 411: WRPR_TSTATE_I	wrpr	%r23, 0x009b, %tstate
	setx	0xe3167f7b0000bf54, %g1, %r10
	.word 0x819a8000  ! 413: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf6446068  ! 415: LDSW_I	ldsw	[%r17 + 0x0068], %r27
	.word 0xb22de125  ! 416: ANDN_I	andn 	%r23, 0x0125, %r25
	.word 0xf0550000  ! 417: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xb72c1000  ! 420: SLLX_R	sllx	%r16, %r0, %r27
	.word 0xb03c2160  ! 422: XNOR_I	xnor 	%r16, 0x0160, %r24
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a1d9  ! 435: WRPR_TICK_I	wrpr	%r18, 0x01d9, %tick
	.word 0x8d9560eb  ! 439: WRPR_PSTATE_I	wrpr	%r21, 0x00eb, %pstate
	.word 0xb33d1000  ! 440: SRAX_R	srax	%r20, %r0, %r25
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8046053  ! 445: LDUW_I	lduw	[%r17 + 0x0053], %r28
	.word 0xf60cc000  ! 447: LDUB_R	ldub	[%r19 + %r0], %r27
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51cc000  ! 449: LDDF_R	ldd	[%r19, %r0], %f26
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05dc000  ! 452: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfa04e07a  ! 454: LDUW_I	lduw	[%r19 + 0x007a], %r29
	.word 0xf644a0c5  ! 455: LDSW_I	ldsw	[%r18 + 0x00c5], %r27
	.word 0xf65d4000  ! 457: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf05d2112  ! 459: LDX_I	ldx	[%r20 + 0x0112], %r24
	.word 0xfe0dc000  ! 463: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xfe1c2150  ! 466: LDD_I	ldd	[%r16 + 0x0150], %r31
	.word 0xb3540000  ! 467: RDPR_GL	rdpr	%-, %r25
	.word 0xfc5cc000  ! 471: LDX_R	ldx	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf415a039  ! 474: LDUH_I	lduh	[%r22 + 0x0039], %r26
	.word 0xb43dc000  ! 477: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xb9344000  ! 478: SRL_R	srl 	%r17, %r0, %r28
	.word 0xb48d8000  ! 479: ANDcc_R	andcc 	%r22, %r0, %r26
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a0fb  ! 487: WRPR_TPC_I	wrpr	%r22, 0x00fb, %tpc
	.word 0xb89ce0c9  ! 488: XORcc_I	xorcc 	%r19, 0x00c9, %r28
	.word 0xb72d5000  ! 489: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xbf504000  ! 490: RDPR_TNPC	<illegal instruction>
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 495: RDPR_TNPC	<illegal instruction>
	.word 0xb3347001  ! 497: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xb9508000  ! 498: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 500: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf91c8000  ! 502: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xfc4cc000  ! 505: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xbf504000  ! 508: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf2548000  ! 509: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xb32df001  ! 510: SLLX_I	sllx	%r23, 0x0001, %r25
	.word 0xf65c2197  ! 516: LDX_I	ldx	[%r16 + 0x0197], %r27
	.word 0xbd510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xf24d0000  ! 528: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xbe144000  ! 531: OR_R	or 	%r17, %r0, %r31
	.word 0xf31cc000  ! 534: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf80c4000  ! 535: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xb48d2111  ! 536: ANDcc_I	andcc 	%r20, 0x0111, %r26
	.word 0xf85d6057  ! 538: LDX_I	ldx	[%r21 + 0x0057], %r28
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 540: RDPR_PSTATE	<illegal instruction>
	.word 0xfc44a13b  ! 541: LDSW_I	ldsw	[%r18 + 0x013b], %r30
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85de1bf  ! 553: LDX_I	ldx	[%r23 + 0x01bf], %r28
	.word 0xf05da1ff  ! 557: LDX_I	ldx	[%r22 + 0x01ff], %r24
	.word 0x8d9521b1  ! 560: WRPR_PSTATE_I	wrpr	%r20, 0x01b1, %pstate
	.word 0xf44cc000  ! 563: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8394e076  ! 564: WRPR_TNPC_I	wrpr	%r19, 0x0076, %tnpc
	.word 0xf4548000  ! 566: LDSH_R	ldsh	[%r18 + %r0], %r26
	setx	0xe836847300002802, %g1, %r10
	.word 0x819a8000  ! 571: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1c60a5  ! 577: LDDF_I	ldd	[%r17, 0x00a5], %f30
	.word 0xb6ac8000  ! 580: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xf4154000  ! 585: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0x9195610d  ! 591: WRPR_PIL_I	wrpr	%r21, 0x010d, %pil
	.word 0xf814214d  ! 593: LDUH_I	lduh	[%r16 + 0x014d], %r28
	.word 0x839461c2  ! 594: WRPR_TNPC_I	wrpr	%r17, 0x01c2, %tnpc
	.word 0xf80ca1d1  ! 598: LDUB_I	ldub	[%r18 + 0x01d1], %r28
	setx	data_start_2, %g1, %r18
	.word 0xf41de161  ! 601: LDD_I	ldd	[%r23 + 0x0161], %r26
	setx	data_start_0, %g1, %r20
	.word 0xf0050000  ! 605: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xbb508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xf45ce129  ! 607: LDX_I	ldx	[%r19 + 0x0129], %r26
	.word 0xf8044000  ! 617: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf8144000  ! 619: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf25ce1e8  ! 620: LDX_I	ldx	[%r19 + 0x01e8], %r25
	.word 0xf61c0000  ! 621: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xb3510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xb92dd000  ! 624: SLLX_R	sllx	%r23, %r0, %r28
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 627: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfe1dc000  ! 628: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xb3480000  ! 629: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf8058000  ! 630: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xfa144000  ! 631: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf84c60cc  ! 632: LDSB_I	ldsb	[%r17 + 0x00cc], %r28
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84e104  ! 635: ADDcc_I	addcc 	%r19, 0x0104, %r29
	.word 0xb83cc000  ! 636: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xfc1ce04e  ! 642: LDD_I	ldd	[%r19 + 0x004e], %r30
	.word 0xf31c0000  ! 644: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf60c4000  ! 645: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf51d4000  ! 646: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xfc05a080  ! 648: LDUW_I	lduw	[%r22 + 0x0080], %r30
	.word 0x8395e1de  ! 651: WRPR_TNPC_I	wrpr	%r23, 0x01de, %tnpc
	.word 0xfa144000  ! 655: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf84ca1ad  ! 656: LDSB_I	ldsb	[%r18 + 0x01ad], %r28
	.word 0xb9540000  ! 658: RDPR_GL	<illegal instruction>
	.word 0xba3da16a  ! 659: XNOR_I	xnor 	%r22, 0x016a, %r29
	.word 0xbaade152  ! 661: ANDNcc_I	andncc 	%r23, 0x0152, %r29
	.word 0xbb508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0xf805c000  ! 664: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf8048000  ! 667: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0x8194214f  ! 668: WRPR_TPC_I	wrpr	%r16, 0x014f, %tpc
	.word 0xf0140000  ! 669: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf45ca067  ! 671: LDX_I	ldx	[%r18 + 0x0067], %r26
	.word 0xfc058000  ! 677: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xb7500000  ! 678: RDPR_TPC	<illegal instruction>
	.word 0xf0550000  ! 681: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xb950c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xf6452073  ! 684: LDSW_I	ldsw	[%r20 + 0x0073], %r27
	setx	data_start_6, %g1, %r23
	.word 0x8995a006  ! 694: WRPR_TICK_I	wrpr	%r22, 0x0006, %tick
	.word 0x8d94a1ee  ! 696: WRPR_PSTATE_I	wrpr	%r18, 0x01ee, %pstate
	.word 0xfc05e1bd  ! 699: LDUW_I	lduw	[%r23 + 0x01bd], %r30
	.word 0xf40c61e2  ! 700: LDUB_I	ldub	[%r17 + 0x01e2], %r26
	.word 0xfa5d8000  ! 702: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xfe5c2010  ! 705: LDX_I	ldx	[%r16 + 0x0010], %r31
	setx	0x120d1b1500007d81, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x899560a5  ! 707: WRPR_TICK_I	wrpr	%r21, 0x00a5, %tick
	mov	2, %r12
	.word 0xa1930000  ! 709: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x91946068  ! 711: WRPR_PIL_I	wrpr	%r17, 0x0068, %pil
	.word 0xfe0dc000  ! 714: LDUB_R	ldub	[%r23 + %r0], %r31
	setx	0x9ce8a0be00007c4f, %g1, %r10
	.word 0x819a8000  ! 716: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d942088  ! 718: WRPR_PSTATE_I	wrpr	%r16, 0x0088, %pstate
	.word 0xf44d8000  ! 719: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0x8595a08f  ! 720: WRPR_TSTATE_I	wrpr	%r22, 0x008f, %tstate
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22c607a  ! 730: ANDN_I	andn 	%r17, 0x007a, %r25
	.word 0x8594618a  ! 731: WRPR_TSTATE_I	wrpr	%r17, 0x018a, %tstate
	.word 0x81952088  ! 736: WRPR_TPC_I	wrpr	%r20, 0x0088, %tpc
	.word 0xf71ce0a7  ! 738: LDDF_I	ldd	[%r19, 0x00a7], %f27
	.word 0xf20520b9  ! 740: LDUW_I	lduw	[%r20 + 0x00b9], %r25
	mov	2, %r12
	.word 0xa1930000  ! 741: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf50c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0xfa05c000  ! 748: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xfa1c2117  ! 750: LDD_I	ldd	[%r16 + 0x0117], %r29
	.word 0xf21c0000  ! 751: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0x8595a157  ! 754: WRPR_TSTATE_I	wrpr	%r22, 0x0157, %tstate
	.word 0xb3518000  ! 755: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94609b  ! 757: WRPR_PSTATE_I	wrpr	%r17, 0x009b, %pstate
	.word 0xb5508000  ! 761: RDPR_TSTATE	<illegal instruction>
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 770: RDPR_PSTATE	<illegal instruction>
	.word 0xf85460aa  ! 771: LDSH_I	ldsh	[%r17 + 0x00aa], %r28
	setx	0x97ab43f30000ec00, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb804200b  ! 783: ADD_I	add 	%r16, 0x000b, %r28
	.word 0xfe5d616a  ! 784: LDX_I	ldx	[%r21 + 0x016a], %r31
	.word 0x8595e179  ! 788: WRPR_TSTATE_I	wrpr	%r23, 0x0179, %tstate
	.word 0xf41ca134  ! 791: LDD_I	ldd	[%r18 + 0x0134], %r26
	.word 0xb72c4000  ! 792: SLL_R	sll 	%r17, %r0, %r27
	.word 0xbc2c6089  ! 795: ANDN_I	andn 	%r17, 0x0089, %r30
	setx	0xfac4700e0000ccd8, %g1, %r10
	.word 0x819a8000  ! 796: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195e195  ! 797: WRPR_PIL_I	wrpr	%r23, 0x0195, %pil
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2146107  ! 809: LDUH_I	lduh	[%r17 + 0x0107], %r25
	.word 0xf4542033  ! 810: LDSH_I	ldsh	[%r16 + 0x0033], %r26
	.word 0xf81c4000  ! 811: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xf6450000  ! 813: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfa5c8000  ! 815: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfe5ca0cf  ! 816: LDX_I	ldx	[%r18 + 0x00cf], %r31
	.word 0xb08d61fd  ! 818: ANDcc_I	andcc 	%r21, 0x01fd, %r24
	.word 0xfa448000  ! 824: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf45de03d  ! 827: LDX_I	ldx	[%r23 + 0x003d], %r26
	.word 0xfc5d2045  ! 828: LDX_I	ldx	[%r20 + 0x0045], %r30
	.word 0xb1480000  ! 830: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf05ce0ce  ! 832: LDX_I	ldx	[%r19 + 0x00ce], %r24
	.word 0xb3500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0xbd7d4400  ! 837: MOVR_R	movre	%r21, %r0, %r30
	.word 0xf4040000  ! 840: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xfa4ce16a  ! 844: LDSB_I	ldsb	[%r19 + 0x016a], %r29
	.word 0xf45ce1d4  ! 846: LDX_I	ldx	[%r19 + 0x01d4], %r26
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	.word 0xfc5c0000  ! 851: LDX_R	ldx	[%r16 + %r0], %r30
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 855: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfc1420c7  ! 859: LDUH_I	lduh	[%r16 + 0x00c7], %r30
	.word 0xfc14c000  ! 860: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xfc05209e  ! 867: LDUW_I	lduw	[%r20 + 0x009e], %r30
	.word 0xb8356110  ! 868: SUBC_I	orn 	%r21, 0x0110, %r28
	.word 0xf45dc000  ! 870: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xbf51c000  ! 873: RDPR_TL	<illegal instruction>
	setx	0x36cd9f6c0000cc89, %g1, %r10
	.word 0x839a8000  ! 879: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9194e050  ! 882: WRPR_PIL_I	wrpr	%r19, 0x0050, %pil
	.word 0xbc1de1d3  ! 887: XOR_I	xor 	%r23, 0x01d3, %r30
	.word 0xfe5c0000  ! 889: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf61d0000  ! 890: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf05c6158  ! 891: LDX_I	ldx	[%r17 + 0x0158], %r24
	.word 0xb4354000  ! 892: ORN_R	orn 	%r21, %r0, %r26
	.word 0x8995e0ef  ! 894: WRPR_TICK_I	wrpr	%r23, 0x00ef, %tick
	.word 0xfe452059  ! 895: LDSW_I	ldsw	[%r20 + 0x0059], %r31
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa054000  ! 913: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0x91952005  ! 916: WRPR_PIL_I	wrpr	%r20, 0x0005, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf20c215f  ! 924: LDUB_I	ldub	[%r16 + 0x015f], %r25
	.word 0xb9504000  ! 928: RDPR_TNPC	<illegal instruction>
	.word 0xf65d8000  ! 930: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xbeb46085  ! 931: ORNcc_I	orncc 	%r17, 0x0085, %r31
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4de0ce  ! 933: LDSB_I	ldsb	[%r23 + 0x00ce], %r29
	.word 0xfa4420a1  ! 934: LDSW_I	ldsw	[%r16 + 0x00a1], %r29
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb605a10c  ! 939: ADD_I	add 	%r22, 0x010c, %r27
	.word 0xf00ca155  ! 940: LDUB_I	ldub	[%r18 + 0x0155], %r24
	setx	0x31d598f10000aed4, %g1, %r10
	.word 0x819a8000  ! 941: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa1da005  ! 943: LDD_I	ldd	[%r22 + 0x0005], %r29
	.word 0x81942162  ! 945: WRPR_TPC_I	wrpr	%r16, 0x0162, %tpc
	.word 0xfc0d8000  ! 950: LDUB_R	ldub	[%r22 + %r0], %r30
	setx	data_start_6, %g1, %r23
	.word 0xb2c4e0cc  ! 953: ADDCcc_I	addccc 	%r19, 0x00cc, %r25
	.word 0xfe4d4000  ! 954: LDSB_R	ldsb	[%r21 + %r0], %r31
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xfe4d212e  ! 965: LDSB_I	ldsb	[%r20 + 0x012e], %r31
	.word 0xbf50c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x8595a11d  ! 968: WRPR_TSTATE_I	wrpr	%r22, 0x011d, %tstate
	.word 0xf71da1e7  ! 969: LDDF_I	ldd	[%r22, 0x01e7], %f27
	setx	data_start_3, %g1, %r22
	.word 0xfe1c2169  ! 971: LDD_I	ldd	[%r16 + 0x0169], %r31
	.word 0xbab4a008  ! 973: ORNcc_I	orncc 	%r18, 0x0008, %r29
	.word 0xf614c000  ! 974: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xb52d5000  ! 985: SLLX_R	sllx	%r21, %r0, %r26
	setx	data_start_5, %g1, %r18
	.word 0xfc440000  ! 988: LDSW_R	ldsw	[%r16 + %r0], %r30
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	.word 0xb1540000  ! 995: RDPR_GL	<illegal instruction>
	.word 0xbb480000  ! 996: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf4554000  ! 997: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf21da08e  ! 998: LDD_I	ldd	[%r22 + 0x008e], %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb7a80820  ! 1: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbda00040  ! 2: FMOVd	fmovd	%f0, %f30
	.word 0xb5aa4820  ! 4: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb8950000  ! 5: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xb7aa4820  ! 6: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5508000  ! 10: RDPR_TSTATE	<illegal instruction>
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 12: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1508000  ! 19: RDPR_TSTATE	<illegal instruction>
	setx	0x781b78b000009a9d, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb284a073  ! 22: ADDcc_I	addcc 	%r18, 0x0073, %r25
	.word 0xbb540000  ! 23: RDPR_GL	<illegal instruction>
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48960  ! 27: FMULq	dis not found

	setx	data_start_0, %g1, %r18
	.word 0xbfa00020  ! 33: FMOVs	fmovs	%f0, %f31
	.word 0xbab40000  ! 42: SUBCcc_R	orncc 	%r16, %r0, %r29
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xb7a5c960  ! 47: FMULq	dis not found

	.word 0xbf480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3ab0820  ! 50: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x8d95a038  ! 51: WRPR_PSTATE_I	wrpr	%r22, 0x0038, %pstate
	.word 0xb150c000  ! 52: RDPR_TT	<illegal instruction>
	.word 0xbdab0820  ! 53: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa409e0  ! 56: FDIVq	dis not found

	.word 0xbfa81820  ! 58: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb5a54960  ! 61: FMULq	dis not found

	.word 0xb5a58920  ! 62: FMULs	fmuls	%f22, %f0, %f26
	.word 0xb5a90820  ! 64: FMOVLEU	fmovs	%fcc1, %f0, %f26
	setx	data_start_3, %g1, %r20
	.word 0x8795e17a  ! 70: WRPR_TT_I	wrpr	%r23, 0x017a, %tt
	.word 0xbd480000  ! 71: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbba5c920  ! 72: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb3a00520  ! 75: FSQRTs	fsqrt	
	.word 0xbda81420  ! 79: FMOVRNZ	dis not found

	.word 0x8395601b  ! 86: WRPR_TNPC_I	wrpr	%r21, 0x001b, %tnpc
	.word 0xbda5c960  ! 88: FMULq	dis not found

	.word 0xbda00560  ! 89: FSQRTq	fsqrt	
	.word 0xb5a80420  ! 91: FMOVRZ	dis not found

	.word 0xb9a00520  ! 95: FSQRTs	fsqrt	
	.word 0xb4340000  ! 100: SUBC_R	orn 	%r16, %r0, %r26
	.word 0x9195e061  ! 101: WRPR_PIL_I	wrpr	%r23, 0x0061, %pil
	.word 0xb7510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0xb7a00520  ! 103: FSQRTs	fsqrt	
	.word 0x8794e109  ! 105: WRPR_TT_I	wrpr	%r19, 0x0109, %tt
	.word 0xbc2461a8  ! 106: SUB_I	sub 	%r17, 0x01a8, %r30
	.word 0xb7480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1a00560  ! 112: FSQRTq	fsqrt	
	.word 0xb3a4c820  ! 116: FADDs	fadds	%f19, %f0, %f25
	.word 0xb9a80420  ! 118: FMOVRZ	dis not found

	.word 0x8995e1f0  ! 119: WRPR_TICK_I	wrpr	%r23, 0x01f0, %tick
	.word 0xb5a408a0  ! 121: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xb550c000  ! 124: RDPR_TT	<illegal instruction>
	.word 0xbfa448a0  ! 126: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xb7a489e0  ! 127: FDIVq	dis not found

	.word 0xbba94820  ! 128: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r17
	.word 0xba1c0000  ! 132: XOR_R	xor 	%r16, %r0, %r29
	.word 0xbfa5c9a0  ! 133: FDIVs	fdivs	%f23, %f0, %f31
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634e06b  ! 146: ORN_I	orn 	%r19, 0x006b, %r27
	.word 0xb1a00040  ! 147: FMOVd	fmovd	%f0, %f24
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 151: FSQRTs	fsqrt	
	.word 0xbda00540  ! 155: FSQRTd	fsqrt	
	setx	data_start_6, %g1, %r17
	.word 0x8594a06b  ! 157: WRPR_TSTATE_I	wrpr	%r18, 0x006b, %tstate
	.word 0xbda48940  ! 161: FMULd	fmuld	%f18, %f0, %f30
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a104  ! 164: WRPR_TPC_I	wrpr	%r18, 0x0104, %tpc
	.word 0xb5504000  ! 165: RDPR_TNPC	<illegal instruction>
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 169: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbda8c820  ! 178: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb9a588a0  ! 180: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb13d4000  ! 184: SRA_R	sra 	%r21, %r0, %r24
	.word 0xbfa84820  ! 185: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xbba9c820  ! 188: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a488c0  ! 189: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb9a588e0  ! 191: FSUBq	dis not found

	.word 0xbd500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0x919461cb  ! 193: WRPR_PIL_I	wrpr	%r17, 0x01cb, %pil
	.word 0xbba88820  ! 195: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0x899560de  ! 196: WRPR_TICK_I	wrpr	%r21, 0x00de, %tick
	.word 0xbba509a0  ! 198: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xbfa84820  ! 199: FMOVE	fmovs	%fcc1, %f0, %f31
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00dc000  ! 204: AND_R	and 	%r23, %r0, %r24
	.word 0xb1a00560  ! 206: FSQRTq	fsqrt	
	.word 0xbba84820  ! 207: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbaac2061  ! 208: ANDNcc_I	andncc 	%r16, 0x0061, %r29
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588e0  ! 215: FSUBq	dis not found

	.word 0xbbab4820  ! 219: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0x9195207b  ! 221: WRPR_PIL_I	wrpr	%r20, 0x007b, %pil
	setx	data_start_4, %g1, %r20
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc446107  ! 228: ADDC_I	addc 	%r17, 0x0107, %r30
	.word 0x8395e0ad  ! 229: WRPR_TNPC_I	wrpr	%r23, 0x00ad, %tnpc
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 231: FSQRTq	fsqrt	
	setx	0x349ed86a000029d6, %g1, %r10
	.word 0x839a8000  ! 235: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00560  ! 236: FSQRTq	fsqrt	
	.word 0xb1ab8820  ! 240: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a8c820  ! 243: FMOVL	fmovs	%fcc1, %f0, %f28
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 248: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbbab0820  ! 253: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1540000  ! 255: RDPR_GL	<illegal instruction>
	.word 0xbd540000  ! 256: RDPR_GL	<illegal instruction>
	.word 0xb49de038  ! 259: XORcc_I	xorcc 	%r23, 0x0038, %r26
	.word 0xbdaa0820  ! 264: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00020  ! 265: FMOVs	fmovs	%f0, %f24
	.word 0xb5a00520  ! 271: FSQRTs	fsqrt	
	.word 0xb1a44920  ! 272: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb4c5a108  ! 273: ADDCcc_I	addccc 	%r22, 0x0108, %r26
	.word 0xbab56144  ! 274: SUBCcc_I	orncc 	%r21, 0x0144, %r29
	.word 0xb9a409e0  ! 278: FDIVq	dis not found

	.word 0xbfa80420  ! 279: FMOVRZ	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 280: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc3ce042  ! 286: XNOR_I	xnor 	%r19, 0x0042, %r30
	.word 0xb9520000  ! 291: RDPR_PIL	<illegal instruction>
	.word 0xb5a98820  ! 293: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbda80c20  ! 294: FMOVRLZ	dis not found

	.word 0xb3abc820  ! 296: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a448a0  ! 302: FSUBs	fsubs	%f17, %f0, %f26
	setx	0x5f8d4ac900002a50, %g1, %r10
	.word 0x839a8000  ! 303: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a509a0  ! 308: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb5a81c20  ! 316: FMOVRGEZ	dis not found

	.word 0x859460cb  ! 319: WRPR_TSTATE_I	wrpr	%r17, 0x00cb, %tstate
	.word 0xbb500000  ! 320: RDPR_TPC	<illegal instruction>
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 325: MOVcc_I	<illegal instruction>
	.word 0xb9a81c20  ! 326: FMOVRGEZ	dis not found

	.word 0xb1a5c9c0  ! 331: FDIVd	fdivd	%f54, %f0, %f24
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 334: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbd500000  ! 335: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 336: RDPR_TNPC	<illegal instruction>
	.word 0xb3a50960  ! 337: FMULq	dis not found

	.word 0xba8ca00f  ! 339: ANDcc_I	andcc 	%r18, 0x000f, %r29
	.word 0xbfa9c820  ! 342: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a409e0  ! 350: FDIVq	dis not found

	.word 0xbc340000  ! 353: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xbb50c000  ! 362: RDPR_TT	<illegal instruction>
	.word 0xb9a589c0  ! 364: FDIVd	fdivd	%f22, %f0, %f28
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69da00d  ! 366: XORcc_I	xorcc 	%r22, 0x000d, %r27
	mov	1, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394a0ae  ! 373: WRPR_TNPC_I	wrpr	%r18, 0x00ae, %tnpc
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 376: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb7508000  ! 378: RDPR_TSTATE	<illegal instruction>
	setx	0x2df305370000ec1a, %g1, %r10
	.word 0x839a8000  ! 381: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba54820  ! 382: FADDs	fadds	%f21, %f0, %f29
	.word 0xb1a548e0  ! 384: FSUBq	dis not found

	.word 0xbfa48920  ! 386: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb3a00020  ! 389: FMOVs	fmovs	%f0, %f25
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
	.word 0xb3a88820  ! 396: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3508000  ! 398: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 399: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x899560c9  ! 401: WRPR_TICK_I	wrpr	%r21, 0x00c9, %tick
	.word 0xb97d8400  ! 402: MOVR_R	movre	%r22, %r0, %r28
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 406: RDPR_TL	<illegal instruction>
	.word 0x8594a0e8  ! 411: WRPR_TSTATE_I	wrpr	%r18, 0x00e8, %tstate
	setx	0xd233ef0a00002ac6, %g1, %r10
	.word 0x819a8000  ! 413: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1aa8820  ! 414: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xba2da0e1  ! 416: ANDN_I	andn 	%r22, 0x00e1, %r29
	.word 0xbb2d1000  ! 420: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xbfa00540  ! 421: FSQRTd	fsqrt	
	.word 0xb03ce1be  ! 422: XNOR_I	xnor 	%r19, 0x01be, %r24
	.word 0xb5aac820  ! 424: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80420  ! 425: FMOVRZ	dis not found

	.word 0xbbab8820  ! 428: FMOVPOS	fmovs	%fcc1, %f0, %f29
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 431: FMOVNE	fmovs	%fcc1, %f0, %f31
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89956014  ! 435: WRPR_TICK_I	wrpr	%r21, 0x0014, %tick
	.word 0xbda00520  ! 436: FSQRTs	fsqrt	
	.word 0xb7a00560  ! 437: FSQRTq	fsqrt	
	.word 0xbdab8820  ! 438: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0x8d94a12c  ! 439: WRPR_PSTATE_I	wrpr	%r18, 0x012c, %pstate
	.word 0xb73cd000  ! 440: SRAX_R	srax	%r19, %r0, %r27
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 443: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589e0  ! 446: FDIVq	dis not found

	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8c0  ! 450: FSUBd	fsubd	%f50, %f0, %f62
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54820  ! 456: FADDs	fadds	%f21, %f0, %f27
	.word 0xb1a00520  ! 458: FSQRTs	fsqrt	
	.word 0xb1540000  ! 467: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a00520  ! 473: FSQRTs	fsqrt	
	.word 0xbdaa4820  ! 476: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xba3c0000  ! 477: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xbd354000  ! 478: SRL_R	srl 	%r21, %r0, %r30
	.word 0xba8d0000  ! 479: ANDcc_R	andcc 	%r20, %r0, %r29
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 486: FSQRTd	fsqrt	
	.word 0x8195608d  ! 487: WRPR_TPC_I	wrpr	%r21, 0x008d, %tpc
	.word 0xbc9ca12a  ! 488: XORcc_I	xorcc 	%r18, 0x012a, %r30
	.word 0xbf2d1000  ! 489: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xb1504000  ! 490: RDPR_TNPC	<illegal instruction>
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50920  ! 493: FMULs	fmuls	%f20, %f0, %f24
	.word 0xbda448a0  ! 494: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb9504000  ! 495: RDPR_TNPC	<illegal instruction>
	.word 0xbd343001  ! 497: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xbf508000  ! 498: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 500: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa8c820  ! 501: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbb504000  ! 508: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb32cb001  ! 510: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0xbba488e0  ! 511: FSUBq	dis not found

	.word 0xbda44840  ! 513: FADDd	faddd	%f48, %f0, %f30
	.word 0xb1510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xbda489c0  ! 518: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb3a44840  ! 519: FADDd	faddd	%f48, %f0, %f56
	.word 0xb5a88820  ! 520: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a94820  ! 521: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb1abc820  ! 525: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfab0820  ! 526: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a44820  ! 529: FADDs	fadds	%f17, %f0, %f27
	.word 0xb0154000  ! 531: OR_R	or 	%r21, %r0, %r24
	.word 0xb9a81820  ! 532: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbc8de145  ! 536: ANDcc_I	andcc 	%r23, 0x0145, %r30
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 540: RDPR_PSTATE	<illegal instruction>
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa488c0  ! 546: FSUBd	fsubd	%f18, %f0, %f62
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48820  ! 551: FADDs	fadds	%f18, %f0, %f28
	.word 0xb9ab0820  ! 554: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0x8d95a1df  ! 560: WRPR_PSTATE_I	wrpr	%r22, 0x01df, %pstate
	.word 0xb3a00560  ! 562: FSQRTq	fsqrt	
	.word 0x83956115  ! 564: WRPR_TNPC_I	wrpr	%r21, 0x0115, %tnpc
	.word 0xb3a588a0  ! 567: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb9a81820  ! 569: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	0x561b84a00007891, %g1, %r10
	.word 0x819a8000  ! 571: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbdab8820  ! 572: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbba9c820  ! 573: FMOVVS	fmovs	%fcc1, %f0, %f29
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeac8000  ! 580: ANDNcc_R	andncc 	%r18, %r0, %r31
	.word 0xb1ab8820  ! 582: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00540  ! 584: FSQRTd	fsqrt	
	.word 0xb9a88820  ! 586: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80420  ! 590: FMOVRZ	dis not found

	.word 0x91946100  ! 591: WRPR_PIL_I	wrpr	%r17, 0x0100, %pil
	.word 0x8394619a  ! 594: WRPR_TNPC_I	wrpr	%r17, 0x019a, %tnpc
	setx	data_start_4, %g1, %r19
	setx	data_start_3, %g1, %r18
	.word 0xb3508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xbdaa4820  ! 609: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a50920  ! 611: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb9a81420  ! 613: FMOVRNZ	dis not found

	.word 0xb9a00040  ! 615: FMOVd	fmovd	%f0, %f28
	.word 0xb7510000  ! 623: RDPR_TICK	<illegal instruction>
	.word 0xb52d9000  ! 624: SLLX_R	sllx	%r22, %r0, %r26
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 627: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7480000  ! 629: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8460ef  ! 635: ADDcc_I	addcc 	%r17, 0x00ef, %r29
	.word 0xb83d4000  ! 636: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xbda48940  ! 643: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb5a84820  ! 647: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8394a0f3  ! 651: WRPR_TNPC_I	wrpr	%r18, 0x00f3, %tnpc
	.word 0xb3a80820  ! 652: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbb540000  ! 658: RDPR_GL	<illegal instruction>
	.word 0xb83de1c6  ! 659: XNOR_I	xnor 	%r23, 0x01c6, %r28
	.word 0xb2aca0c7  ! 661: ANDNcc_I	andncc 	%r18, 0x00c7, %r25
	.word 0xb5a90820  ! 662: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a0d1  ! 668: WRPR_TPC_I	wrpr	%r22, 0x00d1, %tpc
	.word 0xbba88820  ! 672: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a40840  ! 675: FADDd	faddd	%f16, %f0, %f24
	.word 0xb1500000  ! 678: RDPR_TPC	<illegal instruction>
	.word 0xb7a9c820  ! 680: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbf50c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0xb9a00020  ! 687: FMOVs	fmovs	%f0, %f28
	.word 0xb9aa0820  ! 688: FMOVA	fmovs	%fcc1, %f0, %f28
	setx	data_start_7, %g1, %r23
	.word 0x899561a2  ! 694: WRPR_TICK_I	wrpr	%r21, 0x01a2, %tick
	.word 0x8d946080  ! 696: WRPR_PSTATE_I	wrpr	%r17, 0x0080, %pstate
	.word 0xbda80820  ! 703: FMOVN	fmovs	%fcc1, %f0, %f30
	setx	0x34e8872c00006b4c, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8994e082  ! 707: WRPR_TICK_I	wrpr	%r19, 0x0082, %tick
	.word 0xb9a40940  ! 708: FMULd	fmuld	%f16, %f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 709: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9195a0e3  ! 711: WRPR_PIL_I	wrpr	%r22, 0x00e3, %pil
	setx	0x8834fbdd0000bb14, %g1, %r10
	.word 0x819a8000  ! 716: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d94212f  ! 718: WRPR_PSTATE_I	wrpr	%r16, 0x012f, %pstate
	.word 0x859561bb  ! 720: WRPR_TSTATE_I	wrpr	%r21, 0x01bb, %tstate
	.word 0xb3a9c820  ! 721: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a58860  ! 725: FADDq	dis not found

	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42da1b2  ! 730: ANDN_I	andn 	%r22, 0x01b2, %r26
	.word 0x8595e0f1  ! 731: WRPR_TSTATE_I	wrpr	%r23, 0x00f1, %tstate
	.word 0xb5a00540  ! 732: FSQRTd	fsqrt	
	.word 0xb5a58820  ! 733: FADDs	fadds	%f22, %f0, %f26
	.word 0xb7ab8820  ! 734: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a5c9a0  ! 735: FDIVs	fdivs	%f23, %f0, %f24
	.word 0x81952123  ! 736: WRPR_TPC_I	wrpr	%r20, 0x0123, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 741: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a8c820  ! 743: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb550c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0xb1ab4820  ! 746: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0x85952169  ! 754: WRPR_TSTATE_I	wrpr	%r20, 0x0169, %tstate
	.word 0xb9518000  ! 755: RDPR_PSTATE	<illegal instruction>
	.word 0x8d95e13d  ! 757: WRPR_PSTATE_I	wrpr	%r23, 0x013d, %pstate
	.word 0xb5a44920  ! 758: FMULs	fmuls	%f17, %f0, %f26
	.word 0xb1508000  ! 761: RDPR_TSTATE	<illegal instruction>
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 764: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00560  ! 767: FSQRTq	fsqrt	
	.word 0xbda80820  ! 768: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9518000  ! 770: RDPR_PSTATE	<illegal instruction>
	setx	0xd30dc5690000f951, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1abc820  ! 774: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00020  ! 777: FMOVs	fmovs	%f0, %f26
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 779: FMOVGU	fmovs	%fcc1, %f0, %f24
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb805a03a  ! 783: ADD_I	add 	%r22, 0x003a, %r28
	.word 0xb9a40920  ! 786: FMULs	fmuls	%f16, %f0, %f28
	.word 0x859460c6  ! 788: WRPR_TSTATE_I	wrpr	%r17, 0x00c6, %tstate
	.word 0xb9a80420  ! 789: FMOVRZ	dis not found

	.word 0xbfa448e0  ! 790: FSUBq	dis not found

	.word 0xb52d8000  ! 792: SLL_R	sll 	%r22, %r0, %r26
	.word 0xbfa4c9a0  ! 793: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb82de100  ! 795: ANDN_I	andn 	%r23, 0x0100, %r28
	setx	0x2580c7c800005cc2, %g1, %r10
	.word 0x819a8000  ! 796: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195a046  ! 797: WRPR_PIL_I	wrpr	%r22, 0x0046, %pil
	.word 0xb1a00560  ! 799: FSQRTq	fsqrt	
	.word 0xb7aa0820  ! 800: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda81420  ! 801: FMOVRNZ	dis not found

	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c840  ! 806: FADDd	faddd	%f54, %f0, %f30
	.word 0xb5a00520  ! 808: FSQRTs	fsqrt	
	.word 0xb1a58860  ! 814: FADDq	dis not found

	.word 0xb7a81420  ! 817: FMOVRNZ	dis not found

	.word 0xb68c20e5  ! 818: ANDcc_I	andcc 	%r16, 0x00e5, %r27
	.word 0xbda4c9e0  ! 819: FDIVq	dis not found

	.word 0xb3a81c20  ! 829: FMOVRGEZ	dis not found

	.word 0xb7480000  ! 830: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0xb77c8400  ! 837: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb7a50960  ! 847: FMULq	dis not found

	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58860  ! 854: FADDq	dis not found

	.word 0xbda88820  ! 857: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c8c0  ! 861: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb9a4c820  ! 862: FADDs	fadds	%f19, %f0, %f28
	.word 0xb3a588c0  ! 865: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xba34a1d5  ! 868: SUBC_I	orn 	%r18, 0x01d5, %r29
	.word 0xbfaa4820  ! 871: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb751c000  ! 873: RDPR_TL	<illegal instruction>
	.word 0xb7a84820  ! 875: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbba589e0  ! 877: FDIVq	dis not found

	setx	0x951e12940000aa0d, %g1, %r10
	.word 0x839a8000  ! 879: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9194202e  ! 882: WRPR_PIL_I	wrpr	%r16, 0x002e, %pil
	.word 0xbba00040  ! 883: FMOVd	fmovd	%f0, %f60
	.word 0xb9a5c8a0  ! 884: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb7aa8820  ! 885: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa549e0  ! 886: FDIVq	dis not found

	.word 0xb01ca12e  ! 887: XOR_I	xor 	%r18, 0x012e, %r24
	.word 0xb4358000  ! 892: ORN_R	orn 	%r22, %r0, %r26
	.word 0xbbab8820  ! 893: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8994a06d  ! 894: WRPR_TICK_I	wrpr	%r18, 0x006d, %tick
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c8e0  ! 908: FSUBq	dis not found

	.word 0xbba9c820  ! 910: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00520  ! 912: FSQRTs	fsqrt	
	.word 0xb1a48940  ! 915: FMULd	fmuld	%f18, %f0, %f24
	.word 0x91942009  ! 916: WRPR_PIL_I	wrpr	%r16, 0x0009, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbdaa4820  ! 921: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80c20  ! 923: FMOVRLZ	dis not found

	.word 0xb1a00520  ! 926: FSQRTs	fsqrt	
	.word 0xbb504000  ! 928: RDPR_TNPC	<illegal instruction>
	.word 0xb4b560b8  ! 931: ORNcc_I	orncc 	%r21, 0x00b8, %r26
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54940  ! 936: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb3a00560  ! 937: FSQRTq	fsqrt	
	.word 0xb004e04b  ! 939: ADD_I	add 	%r19, 0x004b, %r24
	setx	0x1d69c0fb00008887, %g1, %r10
	.word 0x819a8000  ! 941: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195a11e  ! 945: WRPR_TPC_I	wrpr	%r22, 0x011e, %tpc
	.word 0xb3a5c820  ! 948: FADDs	fadds	%f23, %f0, %f25
	.word 0xb9a80420  ! 949: FMOVRZ	dis not found

	setx	data_start_1, %g1, %r17
	.word 0xb6c56095  ! 953: ADDCcc_I	addccc 	%r21, 0x0095, %r27
	.word 0xbfa90820  ! 956: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa44940  ! 957: FMULd	fmuld	%f48, %f0, %f62
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 959: FADDd	faddd	%f52, %f0, %f24
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 964: RDPR_PSTATE	<illegal instruction>
	.word 0xbda90820  ! 966: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb750c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x8595e1a5  ! 968: WRPR_TSTATE_I	wrpr	%r23, 0x01a5, %tstate
	setx	data_start_3, %g1, %r16
	.word 0xb6b421f7  ! 973: ORNcc_I	orncc 	%r16, 0x01f7, %r27
	.word 0xbfaac820  ! 976: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80c20  ! 980: FMOVRLZ	dis not found

	.word 0xb7a48920  ! 981: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb3a449a0  ! 982: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb52d1000  ! 985: SLLX_R	sllx	%r20, %r0, %r26
	setx	data_start_2, %g1, %r19
	.word 0xb7a588e0  ! 987: FSUBq	dis not found

	.word 0xbfa00540  ! 989: FSQRTd	fsqrt	
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xb5a80820  ! 994: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbd540000  ! 995: RDPR_GL	<illegal instruction>
	.word 0xbd480000  ! 996: RDHPR_HPSTATE	rdhpr	%hpstate, %r30

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

	.xword	0xcc95135529ee9162
	.xword	0xbf696b61509e7315
	.xword	0x5330db1668542dd5
	.xword	0x6720ce6b25522971
	.xword	0xf85649d3f69499c9
	.xword	0xfc75b5059e8678cc
	.xword	0x8d1eec1df049c2f7
	.xword	0xf0f7a79259d41150
	.xword	0xe3ebce99a34a14d1
	.xword	0x39663bdc816f7459
	.xword	0xaab4c6a1c2bfd2cf
	.xword	0x70bf7236c7794801
	.xword	0xb698a4fe189b4f4b
	.xword	0x9cb6e4ada1a14048
	.xword	0x8d3889b73aeb3eba
	.xword	0xaf9473333d52d416
	.xword	0x9bb5d05b973a2548
	.xword	0xcaa80077c0ce053f
	.xword	0x5e76710617ade6b0
	.xword	0x78d161169b869f0a
	.xword	0x3225746e048146cf
	.xword	0x621f6135b801d397
	.xword	0x8c38ab2f3e518801
	.xword	0x16e3e091b5edbab3
	.xword	0x6eb91e0831eb8375
	.xword	0xd3b3a7c771792484
	.xword	0xfc60f11eaae3adf7
	.xword	0xc2378c0a731c76f5
	.xword	0x99d281874d960177
	.xword	0xef3eb212920c46d3
	.xword	0x856fb04b909fb1a5
	.xword	0xa74f9cc7c0f65d23
	.xword	0xd086d500af5afa70
	.xword	0x9017c0311e2a3ffa
	.xword	0x5d2f966af1ebc502
	.xword	0xa6e03ca3bd355bef
	.xword	0xc578bff2466db92d
	.xword	0x429253b0bdad943e
	.xword	0xc2ba367417740478
	.xword	0x60075b2171489300
	.xword	0x2e3d9a989c029fb5
	.xword	0xe67a0cc633818c0a
	.xword	0x7bd9ed430bd9d872
	.xword	0x51a4547a8e170ad8
	.xword	0x04c6fce5824f1629
	.xword	0x02593e3a82f8ae22
	.xword	0xcdf23803baee09e2
	.xword	0x4502a77b08727b00
	.xword	0x1870021b972ce5f2
	.xword	0x89eb487f95c59588
	.xword	0xef6f1ccdd230443d
	.xword	0xf03b70b9fc579c1e
	.xword	0x7cd3ea6c0fc519af
	.xword	0xb118594b5b4fe491
	.xword	0xe646b412c82fa387
	.xword	0x33d71e1a15f49479
	.xword	0x2165585a38e7a767
	.xword	0xef2e7ee693c275d0
	.xword	0x9181db187cbbc92b
	.xword	0x35983dfad01234d7
	.xword	0x448d298535bdcb33
	.xword	0xf2fc8a3c431398e5
	.xword	0xe2220d2281ee8242
	.xword	0xbcbfc182fb54032e
	.xword	0x1971e056675ab7c2
	.xword	0xd8b06d2cbc0a0169
	.xword	0xa00cf6370a05e134
	.xword	0xfa85ace908d015f1
	.xword	0x3344c4ce372fb5d6
	.xword	0x2fc518b3bbf5f68f
	.xword	0x7dbf7c2e4a5dbf1c
	.xword	0x6e39df89295b9a87
	.xword	0x45744a8d7c1f3e98
	.xword	0xca3b734577c655d1
	.xword	0x9d5e3aa996a2f4dc
	.xword	0x18353f9cb9f09fb7
	.xword	0xf3f0d77cd3f12c84
	.xword	0x4fa865f1a0552bc9
	.xword	0x4f1dcafd834afd5d
	.xword	0x3bfce29964046fca
	.xword	0xa3417d21d8b421f4
	.xword	0x61b725ea0bee0e35
	.xword	0x5808350033e9b7e8
	.xword	0x8588ede6e7c0660a
	.xword	0x23f5e48e02280851
	.xword	0x4ce20009fa98361e
	.xword	0x2f898f2da859dfd4
	.xword	0xd69f95fbef6cc53d
	.xword	0x8dbeecfa36443cf8
	.xword	0x3894902dfbd0f6d6
	.xword	0xe4821e2f4d42c02a
	.xword	0xbc1eb0b02f0812bc
	.xword	0x522633ac64405545
	.xword	0xe1294ec615a29aba
	.xword	0xd9d26921c23b89cb
	.xword	0xcaf5b7875a715b86
	.xword	0xb62d10cfbb1e7401
	.xword	0x7f5cc704737a9ae9
	.xword	0xfe5936863ff40e6d
	.xword	0x763ff6abf7cc7870
	.xword	0x4052219b43408f8c
	.xword	0xce8c6ab7b7bcdc92
	.xword	0x01291e0913c1097f
	.xword	0x88ac91796cc45362
	.xword	0x620e486f5da2580c
	.xword	0xbd90f2260b1dbcdd
	.xword	0xd695160187766bb7
	.xword	0xc2ce43ce05db973c
	.xword	0x9966091ac27636fe
	.xword	0x68864d038d276d82
	.xword	0xc5ab6eb84bae9d2a
	.xword	0x3f010f089e4a112a
	.xword	0xfdb7aa879cbe79ac
	.xword	0x4a7f974ed1ba83f5
	.xword	0x7d7ec30f7fdde743
	.xword	0xadf3208a25d4fd35
	.xword	0x27a3e473768fa962
	.xword	0x4f70064b54123055
	.xword	0xb4097f535aa1cdda
	.xword	0x94e28d0d46b9dba8
	.xword	0x68a466612abbaa30
	.xword	0xe36b2681505d3354
	.xword	0xff98e0df27e7cd47
	.xword	0xe10d75ff3b712047
	.xword	0xb6639a21260c5df0
	.xword	0x2616dfd155c46255
	.xword	0x46ff90d055a78780
	.xword	0x075bdcdea1e9a0e3
	.xword	0x90b6fe7d93593195
	.xword	0x8b32e58991165968
	.xword	0xe93828c6170e1919
	.xword	0xe4f3c1ccf658ecb8
	.xword	0x57b8ab980a3c942d
	.xword	0xcdb4de8e1ab7186a
	.xword	0x6b33fd13435f53ea
	.xword	0xf90bf2fba058be8e
	.xword	0x4769897cc53ef826
	.xword	0x6361b54f9481e316
	.xword	0x21c54051a53f900c
	.xword	0x9f8bf0961effc273
	.xword	0xb6bc1104e0536cbc
	.xword	0x9d9a873d31e7e90e
	.xword	0x2076a18bd036155f
	.xword	0x8de79a0b1a0711de
	.xword	0xf9859b2b5fbc3867
	.xword	0x49f6a3ab0458c225
	.xword	0x34c5006e6599d665
	.xword	0xa0cd925faa638749
	.xword	0xcf8fb5f6bdc786c9
	.xword	0xdee7de5d00773db8
	.xword	0xd1a56df5e373e132
	.xword	0x0670ad193f5cb365
	.xword	0x4014728ea1862c08
	.xword	0x5485ba78a6d71a23
	.xword	0x5706020e497d0586
	.xword	0x600ed399818066ed
	.xword	0x8652ee11c695232e
	.xword	0x800b677f1ed42456
	.xword	0xe0fc514f522fd1c1
	.xword	0xe6f310699c480229
	.xword	0x9d17d6c3fe6abf9c
	.xword	0x930cc7ef914a9982
	.xword	0x3aec12983110384d
	.xword	0x63301b7ffbe999cd
	.xword	0x00ce84d7a99ad346
	.xword	0xcc34571005034673
	.xword	0x48429d9fbc73ec83
	.xword	0x67cfc45232e8b36f
	.xword	0x0702e8a1006667d7
	.xword	0xd83e64a919e7571d
	.xword	0x58afa107237eb14e
	.xword	0xd7c6b186fdbf5395
	.xword	0xf63a25eb91cbdcbe
	.xword	0x92fcdb9f34b592bb
	.xword	0xd803746420803a42
	.xword	0x5ca35aedc3269a21
	.xword	0x280f9afd830146b9
	.xword	0x811e96d89e3e1656
	.xword	0x46ce421b1f23b236
	.xword	0x44471b193b2b2ce0
	.xword	0x9d95bdedeb1e6999
	.xword	0x3d54113c392e5646
	.xword	0x84c65fdcbabd3718
	.xword	0xd62abf5871617bfa
	.xword	0x6169ac95e60fbf7c
	.xword	0xa1af499e052d9961
	.xword	0x1508495ccb612717
	.xword	0x48530e74c2351e58
	.xword	0x49f8f116ee43e938
	.xword	0x4f606d513f04a3ea
	.xword	0x362e81256a627de9
	.xword	0x47fac65b541353fe
	.xword	0xc183483f2209ccb9
	.xword	0x5a96872217e1e4ad
	.xword	0xeadb72c7b8e08c9b
	.xword	0xd0a9ecf4c4eda846
	.xword	0x707812cbf7d4228a
	.xword	0xfd02197fd2da9c16
	.xword	0x8fb7e5b7d7e6a8b5
	.xword	0x31722e0de942d10b
	.xword	0xb899d54ac3fb09e1
	.xword	0x302fe55207275a53
	.xword	0x2defc6a258800236
	.xword	0x605be4dbcfa8807a
	.xword	0xc7d01ad743c927cd
	.xword	0x01d19d3ec93959a0
	.xword	0xc7cc082b1a8abc7d
	.xword	0x4119a43c8971d567
	.xword	0x2bbfe73ae7259d87
	.xword	0xeab078fc47fcbb33
	.xword	0xc51c276e327553c8
	.xword	0x33ca0ab761673259
	.xword	0x45eea68ec186a8a8
	.xword	0xdc0267a12bb4d415
	.xword	0x5a07084e16ecb154
	.xword	0xc586700b6f066efe
	.xword	0x3e79cd1b1cc421c0
	.xword	0xcb41cd3c6ef344d7
	.xword	0x5b9b5e95d643610b
	.xword	0x855532338bb4d09d
	.xword	0xde2b06baa758d39c
	.xword	0x42b851327665deac
	.xword	0xdacdad58e246459a
	.xword	0x7f89081caf16c0f2
	.xword	0xa1ca5de609d1ef09
	.xword	0x45153e39c094343e
	.xword	0x3bd8ab77e6784bd1
	.xword	0x75402c7f38bf0845
	.xword	0x525c9747cb102065
	.xword	0xc4f00597bb614632
	.xword	0x89949607093f926e
	.xword	0x1cc627800569f7d8
	.xword	0xb862b48e68a22f82
	.xword	0xfcc0897632f7063f
	.xword	0x6b523f2d5172e32d
	.xword	0xb49f2baa38cb94d2
	.xword	0xc615e172bb664b73
	.xword	0xa9677a34e0cffe11
	.xword	0xc683ebe2cec1a9e9
	.xword	0xed954b2dcb5c86f2
	.xword	0x05ade1fdb68742cb
	.xword	0x8ba9d40616ba7f58
	.xword	0x672e890ca3eddd85
	.xword	0x41f485276730b9dd
	.xword	0x9316c3a3a118c10e
	.xword	0xb1476278bb58cfc6
	.xword	0xa1ec7f5de95619ab
	.xword	0x935c273ecd27322e
	.xword	0x78c6fadae2ac5ef5
	.xword	0x97d2faa76317825e
	.xword	0xa3e5ec5269f023a6
	.xword	0x27f9ace0b7158402
	.xword	0xfc5ec7667c389bf3
	.xword	0xe7b9b16cf3417992
	.xword	0xb7bd892428146dee
	.xword	0x0cc21d96ba4ca3ef
	.align 0x2000
	.data
data_start_1:

	.xword	0xcfb77d2575c589fd
	.xword	0xf968fdbc1cdc2922
	.xword	0x373fb1eeec253426
	.xword	0xa3a3ca6723349a3a
	.xword	0x720cefc121c11dd2
	.xword	0xbfcb2c2855883d8e
	.xword	0xf2d380edf0ce5297
	.xword	0x159fd6be5c8220db
	.xword	0x3b2c48e98eef55e2
	.xword	0x062f26287ec10399
	.xword	0x3e20fa330e33bcd5
	.xword	0x72eb09f163e00c41
	.xword	0x3e025a3cb8511fb5
	.xword	0x8f4368db861a83ff
	.xword	0x7e204cc112f8358e
	.xword	0xdae0aff7e90f7787
	.xword	0xb6b61c313751c850
	.xword	0x1801026e85fbde13
	.xword	0x601bc9d129619967
	.xword	0xbb1112a77f8693d2
	.xword	0xcdb114ed446cfeed
	.xword	0x52b03ee1d9641990
	.xword	0x7c4eeaa47775a072
	.xword	0xbd4935d081dbe659
	.xword	0xfee079f146c01f49
	.xword	0x4444194a8f468bb6
	.xword	0x63b957ddab5cd173
	.xword	0xb6f787b06afc8e73
	.xword	0x247fba9aa546c5d9
	.xword	0xce0c170da4a458e9
	.xword	0xbd51383b19ae10ba
	.xword	0xbb82d17616a8fef3
	.xword	0x5df4551e68f35c34
	.xword	0xcf64d647529acd38
	.xword	0xb7becb9d13da4e3e
	.xword	0x08b15d52fbbdf2d6
	.xword	0xd5a0c67b07a7ecb5
	.xword	0xcb8a60574dd1108c
	.xword	0x981688c1d18e9544
	.xword	0xdc8f721d1626c7cb
	.xword	0xd82f78999e49ebf7
	.xword	0x051f94f6374d5687
	.xword	0x5da1c42cfeedf1fe
	.xword	0x39c5b59329abd2ad
	.xword	0x0078e1d82ef7efd0
	.xword	0x48252fef1a130512
	.xword	0x784e76ea404c78cb
	.xword	0xa09ca5c40574cd32
	.xword	0x19c1c37cd4fca1ea
	.xword	0x9cb34569c5475254
	.xword	0x94353ff20800775b
	.xword	0x309bc08d62bf9eb0
	.xword	0xf7338f53266a729f
	.xword	0xbcbe639b0762fe8f
	.xword	0xe870c7dd249fced9
	.xword	0x643b235c5222c922
	.xword	0xa3f3e242e757dd30
	.xword	0xd5c100b4a6b3cd0f
	.xword	0xd5328e59bc7f9c33
	.xword	0x2de3f49877674b91
	.xword	0x6b748bb84752856e
	.xword	0x6ed1c47f14d44f62
	.xword	0x95d30b7d1d1d0b76
	.xword	0x9ecc1cafa480cd93
	.xword	0x4ba83ed0b50ab042
	.xword	0x88ba1a509013736f
	.xword	0x28b0576f9ad6e919
	.xword	0xf6a91eec4e21c88e
	.xword	0x56493d59c917e0da
	.xword	0x3a9fa45086be6cf8
	.xword	0x66f7be35a3fbe52c
	.xword	0x6b9e7ea7070a5c6d
	.xword	0x037018c14339ecac
	.xword	0x241e07af1c0ee730
	.xword	0x76fd0726426242db
	.xword	0xcbd87f55d43b15b9
	.xword	0xda710ebe2c3b6882
	.xword	0x5785717955c64a1a
	.xword	0xdbe82d2cbc46948b
	.xword	0xe8bbc3bab673b86d
	.xword	0x967d631fd7f8b3c9
	.xword	0x25d3436e504f7a89
	.xword	0xd55de311d099d7a2
	.xword	0xaa87033285b72d3b
	.xword	0xf1de76da451f50ee
	.xword	0xf821c318e291d72a
	.xword	0x53c6dc886d3669fb
	.xword	0x42f4fc2e8a931dfa
	.xword	0x5e1ae6a74d2c267a
	.xword	0x1df7915c89383129
	.xword	0xf538a85c8ac3730b
	.xword	0xb3ade149fd0b6e1a
	.xword	0xbcc2fc62d6216b39
	.xword	0x74fb78495f43edb2
	.xword	0xf8ed364949f34302
	.xword	0xc7b6df85f0c13994
	.xword	0xfdb394dd61e9db4a
	.xword	0xfa4397f168f46389
	.xword	0xc834e32f0c341320
	.xword	0x852ddbcf97f99c30
	.xword	0xe260c53123526e1e
	.xword	0xd4b6fae061929e6e
	.xword	0x942ce544e432ad02
	.xword	0xbbbb92e79659313d
	.xword	0x0cd28e811c7f9f92
	.xword	0xbf2bc863da2f482a
	.xword	0xc319a1f3a3155247
	.xword	0xdebc4160f68a3cc1
	.xword	0x8c6d67e543da1711
	.xword	0xdf402a3dcbb50763
	.xword	0x3ac1003b54bcda3a
	.xword	0x9b40c980d82783dc
	.xword	0x447c7953b234fae7
	.xword	0xbab49a767e41d609
	.xword	0x5692f98a063476e1
	.xword	0x22f421b426282290
	.xword	0x665d41722d3ff048
	.xword	0x854d7c6e1be6e7f5
	.xword	0xdd08f501ca25adcc
	.xword	0x96ba48f7c5c7420c
	.xword	0x8f66ca9f6fc64a73
	.xword	0xd01680f9a304a890
	.xword	0x1e310528bafba5df
	.xword	0x556fc553a63bc4a3
	.xword	0xf09fccb559797d76
	.xword	0x2484dc93a078d262
	.xword	0xcf00abcfe25eecd1
	.xword	0x0db31c5d9eb5d1fd
	.xword	0xebffe01363d505a2
	.xword	0x255f7cad0a1cba25
	.xword	0x31db7a75a1b0df1e
	.xword	0xc258e5b89527cd5e
	.xword	0x3d955ec94d613782
	.xword	0xdca285f570e5194b
	.xword	0x75bfefb85faf5efb
	.xword	0x9ddb0b4024ffb125
	.xword	0xcfd4e0e847cd352d
	.xword	0xb1456c1a10a81002
	.xword	0xc79c7ef949cfa8a1
	.xword	0x797a4f7c26554e1c
	.xword	0x8cae287630c3c2b2
	.xword	0xed0b4acc2bc12db4
	.xword	0x7c839f2364da88f9
	.xword	0xecfffd1d56d477c8
	.xword	0x0105fc7e63ed08e3
	.xword	0x45d984d769dcd911
	.xword	0x432245d83d95bba4
	.xword	0xef0f7e6e6de21bb5
	.xword	0x197129dd8403a991
	.xword	0x1e5d89162a9e4e4a
	.xword	0xe4825a8bd3603cf5
	.xword	0x653ce49b79765c69
	.xword	0x35229b5ef96f6f80
	.xword	0x0d86f35a21f04921
	.xword	0x6a8bd3aa7cacd369
	.xword	0x493412626c02243b
	.xword	0x878eda101f89db4e
	.xword	0x9ef2cdec2620d21f
	.xword	0x6880bedee90d0669
	.xword	0x003461adfbf877b0
	.xword	0xfca88e75c723fabd
	.xword	0x2609a2d057b91759
	.xword	0x33e62a4641696c0c
	.xword	0x955f3b62edeed51f
	.xword	0xe07d29559d40fb8d
	.xword	0xe448b16604a8a8f1
	.xword	0x45a7e1f920e63b16
	.xword	0xac6d6ccd62632b8c
	.xword	0x327d9ecbb0b606a5
	.xword	0x07591203f36506ca
	.xword	0x4b872146faad599e
	.xword	0x7e7c01dbab596ec7
	.xword	0xcb5ac5946c50ad64
	.xword	0xb00e4312a0629e14
	.xword	0x8f374c00245253e2
	.xword	0x9496652cf55a23b6
	.xword	0x87137f543a017681
	.xword	0x365346ef136f9aa7
	.xword	0x2af581ce7baa5319
	.xword	0x079b8b2b3acaf80e
	.xword	0x6c89cccee0329dff
	.xword	0xba562b7446d7bc60
	.xword	0x6d2c5fabeb9a0f73
	.xword	0x2fbc9e843464379e
	.xword	0xf7f70c279120bd9b
	.xword	0x9ad31239d9349059
	.xword	0x367f87ea22c07d1b
	.xword	0x0e661eeacb4309e9
	.xword	0x718016052a3c641c
	.xword	0xcff77850ca5dff7d
	.xword	0xceb1411f99ca7271
	.xword	0xdd6dd060cc7fe6f0
	.xword	0xcbaf20673b634d19
	.xword	0xb0cd28cc76ca5bd5
	.xword	0xf00db2a76ae96819
	.xword	0xcab8762cc7d67869
	.xword	0x2355b75b88e4158f
	.xword	0xb536ca825546380e
	.xword	0xb33a8fe877eab127
	.xword	0xb0e156e9604f4f8f
	.xword	0x1fc7a58f5d46689d
	.xword	0x7844aaf71aacd80d
	.xword	0x2679e7e0229b157c
	.xword	0x7c4a2eae0aac1d5f
	.xword	0x56fb21e8add64915
	.xword	0xb2e39cee451f1ec6
	.xword	0x079dadc8caa83548
	.xword	0x3b1771aeba7d4b60
	.xword	0xf39fddbadfe87469
	.xword	0x11cb286f23a1b571
	.xword	0x7d7e62cc2052d826
	.xword	0xdee89fc386e029e2
	.xword	0xb25ed3f7a4efe2a3
	.xword	0x5e0a8c970adb5b0e
	.xword	0x0b3ac1b1c9d6199b
	.xword	0x3a1a0656dfd4af8d
	.xword	0x92805d7d0c5f4e2c
	.xword	0x1bc83e2a08d3611e
	.xword	0xc449cbb8bf76030d
	.xword	0x45cfde2f18929d27
	.xword	0xa59c57cf185e6a66
	.xword	0x23db1c6c1e0c9a39
	.xword	0x1d6d93e7554ba47e
	.xword	0x6c1bfe5d330cd82f
	.xword	0xce915605757ab0ac
	.xword	0xc1653395d16d87b5
	.xword	0x99c14172b3640eeb
	.xword	0xbc10c91390ab3a28
	.xword	0x108d3a9c7e56df73
	.xword	0xa73b3370bfb63012
	.xword	0x830ff6d20d6f2083
	.xword	0x9987bc9983cd6817
	.xword	0xff327ae902767171
	.xword	0x71f90acb1f9cda1a
	.xword	0xc29c480112799b4a
	.xword	0x3905bafeb66c80dd
	.xword	0xfd247548291c83c0
	.xword	0xde7429e07bc368ae
	.xword	0x025f15199353014d
	.xword	0x47b8676ace9fa710
	.xword	0x6f9f467d82667d4e
	.xword	0x85629af9f70e3aa6
	.xword	0x25626127b0501bbc
	.xword	0x6c333ee6ba27f1d9
	.xword	0xd2d52a8a5df7043e
	.xword	0x3a0fce80566847d8
	.xword	0x5cf9e4cbafb146ea
	.xword	0xb6f6aa66242c03b3
	.xword	0x637287d70732f60a
	.xword	0x3d4e3e2b910cd7eb
	.xword	0x7655736d2743ce7c
	.xword	0x88a371e20078643a
	.xword	0x242dce23426a3a7c
	.xword	0x15a920d9a41b8577
	.xword	0xd3f76ff9cea93209
	.xword	0x3bba87d9a8642bf9
	.align 0x4000
	.data
data_start_2:

	.xword	0xc1989034ab3c6d70
	.xword	0x2c8ddafec9bc4c5e
	.xword	0xb254c66901925b3e
	.xword	0x2f889c3399d8afb3
	.xword	0x9e2ca7b54ce62aa3
	.xword	0xffa05575f7cc73bf
	.xword	0x2821c2b106d759b9
	.xword	0x9ddf0a4204fa2a5c
	.xword	0x78fb6a6bb7582168
	.xword	0x5c8b08c3223b70ce
	.xword	0xe630d79efd0fbcac
	.xword	0xeb77ac20ca7aa52c
	.xword	0xad4515af8d9019f8
	.xword	0x40b275d00af43ab0
	.xword	0x74007c673fea9ba8
	.xword	0xdc45e7b8cdf48706
	.xword	0xd7c4da997a7fbb85
	.xword	0xbf6c2c835648e4f7
	.xword	0xbb4e15ddd46dcc38
	.xword	0x95d8b6e7a57d8324
	.xword	0x58d2c273c883d01e
	.xword	0x3e5c60c6750c23e2
	.xword	0xdfc0c1093c727d67
	.xword	0xd82ce333c0ccd042
	.xword	0x1bc0f33750e06ba5
	.xword	0x03c1dddd5ccf2251
	.xword	0x49eee33424d709d7
	.xword	0x66f04b9c321367b5
	.xword	0xe82610c83278030a
	.xword	0x4d2d94523a30fdce
	.xword	0xccb56f8e556682aa
	.xword	0x9072742fa8771be4
	.xword	0x1c4c10fb85811775
	.xword	0x75576b6201a8c315
	.xword	0x958162dc5f4ba1a6
	.xword	0x10160ab5d559d702
	.xword	0xbe8a37a332df33b9
	.xword	0x42962cb76a30a57e
	.xword	0x0d2e77995b9d64e1
	.xword	0x2d0c43e8cb586093
	.xword	0x6c68ae7cca17b4d6
	.xword	0x3bb4c492430e7e85
	.xword	0xed4e46905dc2de2b
	.xword	0x0b44ec6a43f269c1
	.xword	0xfc951f3c03d20b7e
	.xword	0x02f5404dfd4a3641
	.xword	0x5b50db816d20b06b
	.xword	0x9228fef912693f00
	.xword	0x39f3284a41cb9f0f
	.xword	0x7ae060752f65745c
	.xword	0x2f8b40101a53acbb
	.xword	0x282b3335a535b5d5
	.xword	0x6e7d5c8bc35395b8
	.xword	0xe40acb4e96184543
	.xword	0xfba675068b6d7cdd
	.xword	0xd65cf451fbf5bc60
	.xword	0xaf8d89347e7dd19a
	.xword	0xe55efeb82fbcd09b
	.xword	0x0db12f10c39ff9c8
	.xword	0x64ef6d06458a3b7b
	.xword	0x7ec68c3b27152a29
	.xword	0x00b42968e59cf18e
	.xword	0x6ded70109a147ce6
	.xword	0x033cb8375569a50d
	.xword	0x7a8d6f2ea10a4b63
	.xword	0x9da9e433c6f5a816
	.xword	0xb8faddf5cc463707
	.xword	0xbf33a5698ae52757
	.xword	0xb0c4a5e2c07626cf
	.xword	0xd751ddf526b2dfd6
	.xword	0xe69d77bc09b0bce4
	.xword	0xba5a7446b169d90c
	.xword	0xeae5d2c0d6884400
	.xword	0x3903db62f961f982
	.xword	0x86ed826adc9a75d8
	.xword	0x494b3d78d7ffd424
	.xword	0xbd2b326938912121
	.xword	0xbba2e6149338d225
	.xword	0x178c8bc23dcebe54
	.xword	0xff90177ac5bbafaa
	.xword	0xecdc57579022f2b1
	.xword	0x2caac79b4dc5cbce
	.xword	0x18b3e9a49e02edbe
	.xword	0xe2e4bd9da7aa19af
	.xword	0x066409559f6d1621
	.xword	0xedaee297d5f55ff7
	.xword	0x563667b400975748
	.xword	0xe5232581298c5e14
	.xword	0xd236ee64e05ba5d0
	.xword	0xca319b9f7ceaf9b3
	.xword	0xe50b3759371603ad
	.xword	0xcec95a03d6071bd2
	.xword	0x2b9dca2ff1cca7a0
	.xword	0x918e491c36181982
	.xword	0x952f45999ab9c288
	.xword	0xc1ef72793dd3568a
	.xword	0xa0c87440e7dc5b48
	.xword	0x334246699aec1911
	.xword	0x489a177c2a288b3d
	.xword	0x4aec8ec091db2c06
	.xword	0xe5f05d87429ff109
	.xword	0x8244ed3056f887d8
	.xword	0xab70fa8ca8fc6210
	.xword	0x9250da8ae737687c
	.xword	0xb754513a6ef121f7
	.xword	0x01d6f8fb5070730e
	.xword	0x6d0d1b7b4bc7305c
	.xword	0x123992d73d16f438
	.xword	0x637079483248768d
	.xword	0xf6f344b983f9976b
	.xword	0x12b59c8776487562
	.xword	0x7beacfa2f3d82e53
	.xword	0x242b5f5c43922513
	.xword	0x9e6dda11d719a404
	.xword	0x5c4804fb9105b62a
	.xword	0x69b0eb69c36744c5
	.xword	0x5db4849dad5176ee
	.xword	0xc3d03cbe847a6bb0
	.xword	0x1617daa7598c6be1
	.xword	0x1474062680ab1fab
	.xword	0xf409793bc04371d6
	.xword	0xf3df6755f061aa45
	.xword	0xd6efbd5f99ea2f00
	.xword	0x87eddbbc4aad0032
	.xword	0x2ddaebd69a13c85e
	.xword	0x5f1cd78e8b6555aa
	.xword	0x4a1b4fd96176f1c2
	.xword	0x1bbe82433cd6aae8
	.xword	0xcd4d58542251e0d6
	.xword	0xbfd80e1984776ac9
	.xword	0x3efa2496cec46611
	.xword	0x71daca00379f74fb
	.xword	0xe0c212c914dddf33
	.xword	0xc6d9263d23eb9cb5
	.xword	0x5b70cb3ffcd2b183
	.xword	0x0cec924036b20eba
	.xword	0xd5bd40fd4740fa81
	.xword	0x1d176398ccf737f1
	.xword	0x32651241fe422132
	.xword	0xabfc775759366d4d
	.xword	0x9a6537220d166975
	.xword	0x881a460d8156cb35
	.xword	0xc2c3682da55fe5f3
	.xword	0x2f604be6a2ebe59a
	.xword	0x18bad56bd40f42e4
	.xword	0xfdc11e16d776a0af
	.xword	0x72f43379b7ff4dcb
	.xword	0x936789efebd128fd
	.xword	0x72a258abf7e7f7ee
	.xword	0xb9e313652ffa87f3
	.xword	0x9ce1afea51780d06
	.xword	0x946df8190c0f61e0
	.xword	0xf1a1f23509459301
	.xword	0x45168898ef742b23
	.xword	0x57754a7410747bb9
	.xword	0x4079f25b3b8a9101
	.xword	0x178eb187f886e392
	.xword	0x56567701c9f4e829
	.xword	0x7627a769ca6129ef
	.xword	0x839655259d1faea0
	.xword	0x8de476308a1d6262
	.xword	0x0b64970f2ede9bac
	.xword	0x2f840d7733197abd
	.xword	0x1c8b63aeae21d320
	.xword	0xeb9c1bf2b8d97c4c
	.xword	0x0a42cab6e1caad27
	.xword	0xfa9c58c4ba4fd578
	.xword	0x8522fae3ab00c7e0
	.xword	0x2700a0dbdf711ac9
	.xword	0xb429d298614d767a
	.xword	0x9203382915324d1f
	.xword	0x894c5cdcde306557
	.xword	0xfd914e7f5d980b27
	.xword	0x249c8d983ee9ebdc
	.xword	0xf81a62486e3ace0e
	.xword	0x35b3828f0406b51d
	.xword	0x9a4f045108f82859
	.xword	0xb1ec9704e8ec4f7d
	.xword	0x2623295d8d37e3c1
	.xword	0xa62219def9240ab0
	.xword	0x8e641da67f4a402b
	.xword	0x4bd86fbdc9e474cb
	.xword	0xad13bcc1e63c7daf
	.xword	0xc20216b0f352b2aa
	.xword	0x17e4d5bdcea41da7
	.xword	0x67debad71fec8710
	.xword	0x10f5dfe085971f05
	.xword	0xe45e41b9afc32cc1
	.xword	0x38e45629828fb095
	.xword	0xe6ff1b870d6e2038
	.xword	0xc7a00eaa0d6ff7a7
	.xword	0xb61743bc67c1c1b3
	.xword	0xad84e4136727431b
	.xword	0x7773e9016916ccf1
	.xword	0xfa5cff0e86cb6996
	.xword	0xdddfef0af7da7dad
	.xword	0xd77b57f0954bf041
	.xword	0xac61b22281bd69f8
	.xword	0xc199916325b7a212
	.xword	0xd9f73c01f7656882
	.xword	0x1741f405442c79c2
	.xword	0x3bf15321714120cd
	.xword	0x1d0438a3edc4c5ad
	.xword	0xbd4b65f3f54183ab
	.xword	0xa2d9d7645fe715e6
	.xword	0x5529012b5b42c716
	.xword	0xc995d11732da9444
	.xword	0x1fd0555829c5f1dc
	.xword	0x73dd3090b0f49dd3
	.xword	0x1c26625e81d40956
	.xword	0x0eb2cf45f08f8ebf
	.xword	0x9f608bd8559b34f3
	.xword	0xab7f798c0c46d362
	.xword	0x90c7218f9d2b811e
	.xword	0x448b0a277c41881c
	.xword	0x8ce3742e9296cb86
	.xword	0x91e26d2d1b70880e
	.xword	0x4c1d634a95183cee
	.xword	0x96c73b33ee6c5bb1
	.xword	0x99c1b66c8ab8506a
	.xword	0xe026f77c6b424c1f
	.xword	0x944d3e894c57362a
	.xword	0xd2184b122ae14aa3
	.xword	0x0369fc1860bffbbb
	.xword	0x0199cdf01192a49f
	.xword	0xf085a6dcf2159185
	.xword	0x4b063e14b7314d31
	.xword	0x1dc05ad62dc2f446
	.xword	0x0a3bcba114d62204
	.xword	0x2ab09f7e61960a44
	.xword	0x4b32f91974c84b8e
	.xword	0x079a0f2bf0a8bf83
	.xword	0x73c9d22249c373e3
	.xword	0x50b2bb5c59c46961
	.xword	0xaecce6162dd662da
	.xword	0xb611abb69d3d8c23
	.xword	0x464f3819382c5263
	.xword	0x2bc76d460c0eaf89
	.xword	0x97f2e0875146bacc
	.xword	0x1b22eb06ff01dbd7
	.xword	0x5f8f3230794c0a14
	.xword	0xb3c0667471f8ae42
	.xword	0x62ef84faa08e55b5
	.xword	0xf23f365ed26acfaa
	.xword	0x76271ef43ef9a9d2
	.xword	0x6847ab7ccefece3e
	.xword	0x9e163b16a9b7f583
	.xword	0xd1d684124a1f3b7f
	.xword	0x229bf8c112bbc8cb
	.xword	0x37c5af46886615b6
	.xword	0x4a72c8ee8ff91c08
	.xword	0xba378f2860e56ab5
	.xword	0xce46ccd153ee2a41
	.xword	0xb719666103bb4bdd
	.xword	0xd6fc2a7b488a97bf
	.xword	0xe9250730c4f703fa
	.align 0x8000
	.data
data_start_3:

	.xword	0xa92c0ffd65914108
	.xword	0xd1ccb630f2c24f4e
	.xword	0x3481ab79dde5acb9
	.xword	0xc01da9c218a0b862
	.xword	0xe2b68180c34aff62
	.xword	0x862657a0b7415cc0
	.xword	0xb10e6a8af293807d
	.xword	0xc0d97fbc0ff1560d
	.xword	0x93b5be8fb476c253
	.xword	0xd9297a050606adf7
	.xword	0x7a49ff85d6f6366a
	.xword	0xa2c6d2047eb7ce70
	.xword	0x6c03380e84420892
	.xword	0x392dbb16dbfb0a4e
	.xword	0xd5e48a96e2b1d840
	.xword	0xa7c6b6081bffc7d9
	.xword	0xcbcedc9f53bdf7dd
	.xword	0x1aa385e4b490732a
	.xword	0xdfdcab3d8e65e78d
	.xword	0x69dff4128ff0a958
	.xword	0xe96bfac7024a247f
	.xword	0x36f29216d187030b
	.xword	0x4928ef32c4eb534f
	.xword	0x41e785d8cbd5b9ae
	.xword	0x55af2db5a05776cb
	.xword	0x7d34df276c3b42e1
	.xword	0x881d1e217f961ce3
	.xword	0xa699b04ac86c1f38
	.xword	0xd60eecb575d92ecc
	.xword	0xbd15d82c4df72306
	.xword	0xe9f0de01d37bb5d1
	.xword	0xb096e53dd0301c5a
	.xword	0x8a9f4b7cdb473184
	.xword	0x52ebae9002c1a372
	.xword	0xebcc32e49485d2d8
	.xword	0xf41436a3418bb8d7
	.xword	0x9e0aedde42d79eca
	.xword	0xfa8d01277edc5322
	.xword	0x147a7963835c036c
	.xword	0x4217c7872944eafd
	.xword	0xb673544cd4ebfd3c
	.xword	0xf536a54c2f7d84be
	.xword	0x517778d016cdb96a
	.xword	0x84733a6688c8fc1e
	.xword	0x7e77e569ba0a0b7f
	.xword	0xbe29cde2b286e1ae
	.xword	0x07607cdd48ca3257
	.xword	0x71a662b9087995b7
	.xword	0x18676b9f71a5c02a
	.xword	0xa46713ba4afc84d2
	.xword	0x22090ce71d62f4ed
	.xword	0x9ca8f5e9afff00fa
	.xword	0xd83bd3d3862cee31
	.xword	0x7fc69a52f3bd0312
	.xword	0x3f7dcb7f63212de8
	.xword	0xe17ad6f34c847787
	.xword	0xf517935ed9cbb592
	.xword	0xcdeb3485dae0d6e9
	.xword	0x5b4b36ddbaa651ef
	.xword	0x4a7067a0f1d4345a
	.xword	0xa8cbb66f10140359
	.xword	0x2f345f4cbb07bf03
	.xword	0x1a7eef97b9a8a84a
	.xword	0xe3b7f56da2cc80ac
	.xword	0x80e3b5ccc717c46b
	.xword	0x22e39b75f55f898f
	.xword	0x75e2ca69177f2a15
	.xword	0x4e6eb7997ded7eae
	.xword	0x3c3aa675a09f6e87
	.xword	0xdd7425b664abc12d
	.xword	0x0a12fb64c93dcbe4
	.xword	0x46395cce1b917565
	.xword	0x50ee7caae3242bf6
	.xword	0xfe6d5405a9b52dad
	.xword	0x88c54e6f22254967
	.xword	0x59fc6c8d1e31aac0
	.xword	0xac11c6a0c8b4e796
	.xword	0xac46e07fb3123d68
	.xword	0x078f43c950fe881f
	.xword	0x1038b18a53f464a6
	.xword	0xb917f112140a6f4a
	.xword	0xde7b66528e687da7
	.xword	0x6f53f143fc45d865
	.xword	0xc8ab27f45c4915d4
	.xword	0xff68924bbc0bddf2
	.xword	0x2810c4889798b464
	.xword	0xa200cbe38f9677b6
	.xword	0x9bab539c40894871
	.xword	0x73310e433698671f
	.xword	0x41e6030bf0b5f27e
	.xword	0x75a1af8b3d9eec0c
	.xword	0x4918372d3bf117a5
	.xword	0x4e5e81f8342bada4
	.xword	0x9a54663d4f132050
	.xword	0xdcfab5eef6ca0253
	.xword	0xa1e0b9d82ee6a93d
	.xword	0xb31b8185d451fcd6
	.xword	0x3f36303ec59f67b5
	.xword	0x24bdb86375099a95
	.xword	0x40e9f0e7c219fa33
	.xword	0xd12b8dbe7e64dac3
	.xword	0xaa1d5373f1756e3a
	.xword	0x7fa072da8fcbfc6d
	.xword	0x302479eb7556bf18
	.xword	0xfcbb0ed7a5445b9a
	.xword	0xc835b808cbeb513b
	.xword	0x45715843aff15a44
	.xword	0xf25fc58ca9fdc075
	.xword	0x46d4cfad9ee1029c
	.xword	0x8faa81901e270de5
	.xword	0xac1dd0c0e508af48
	.xword	0x0443324160c0ddd5
	.xword	0x2607230451858da3
	.xword	0x49a31249119b3985
	.xword	0xbcc85f82d21d0d9d
	.xword	0xe70dd99f166e29b9
	.xword	0x7d57661cee384526
	.xword	0x1b887bf0c9fba89c
	.xword	0x8278a58ad2e71be0
	.xword	0x27c6f665b657945d
	.xword	0x36dd2471b9ba59be
	.xword	0xecd39c4864bcc1ba
	.xword	0xd7c77a994ae096a7
	.xword	0x941d2f0dc2760c64
	.xword	0x61d956eb7bf70727
	.xword	0xaa0761ae835d3e8b
	.xword	0x40bae8404e775e1a
	.xword	0xf50e9cc018fcadd8
	.xword	0x9b8d7da8d144efb8
	.xword	0x9cdf4209190dcd66
	.xword	0x2eeae37a624b164e
	.xword	0xd543799af5720773
	.xword	0x8f6267e5b027bad5
	.xword	0xea5f1f518a75a688
	.xword	0xf0b12ec78d1ea18e
	.xword	0x43e5e0cf42bc3b9e
	.xword	0xcb5c4a9303d78835
	.xword	0x2942d4a63c100420
	.xword	0x2206749c962cc1d4
	.xword	0x54a115029dc28092
	.xword	0x415348d7ac22ae64
	.xword	0xc2b392479369e608
	.xword	0xa72a16de456dc564
	.xword	0x3ed23ee5e8089934
	.xword	0x3c6d6b87113bec60
	.xword	0xe5892c4f7661aeed
	.xword	0x21c2cebdbf21cae9
	.xword	0xa97e7b00c1469c6c
	.xword	0xe89dac30f2e50d49
	.xword	0x0cea777b0c88c540
	.xword	0x350ba9e24d78bc31
	.xword	0x6bdc5d413f57ad5c
	.xword	0x5f712c026c284925
	.xword	0xa2237bcb2ec93eff
	.xword	0x6c80ff701b246c57
	.xword	0x7451484523f82f6a
	.xword	0x073ba32aa6004461
	.xword	0x2bbe2988df45553f
	.xword	0xf101cdb49cf43359
	.xword	0x3d3a5233922edf57
	.xword	0x8025c9b39472f3c8
	.xword	0x3ad9e14c2eaf452b
	.xword	0x2d477cb5770a0db9
	.xword	0xabda4501a1869ef1
	.xword	0x220cfb6412f33ead
	.xword	0xdf8cabfa616533ae
	.xword	0x0a40a763ddac4fcb
	.xword	0xd6dd282f9f707467
	.xword	0x0210f1088bc57909
	.xword	0xbb3457508f1f0d1a
	.xword	0xb4288860f7c30967
	.xword	0xb0c6df1d361852ae
	.xword	0xb8ed3e353445e0a3
	.xword	0x8ec04d1a30868e58
	.xword	0x7a68c10ca7fdbf56
	.xword	0xa5bb88fef3a6234a
	.xword	0x4aee11c9c48bc3cf
	.xword	0xfe931cee34bf2364
	.xword	0x703cd1b6f0055a81
	.xword	0x37f97033444f6b78
	.xword	0x4a52c1cd882adcb9
	.xword	0x4c41e38b8f708363
	.xword	0xb6e6cc74add4ac62
	.xword	0xd2a0a6ef3a0b5009
	.xword	0x35d2de749b4a9e00
	.xword	0x13acb015efc7cabf
	.xword	0xc65616e5f83dba7f
	.xword	0xdaea8311d52601d7
	.xword	0x7e8d32cb912814f5
	.xword	0xb069aff3747eae58
	.xword	0x7f16e74c071e486e
	.xword	0xbb39e6b5b20490eb
	.xword	0xe13d23d1b544f00d
	.xword	0xb26ab68c38ff36c3
	.xword	0x997c94f7715d854c
	.xword	0x0cd13fb5d6987518
	.xword	0x6f0b22c38e31541b
	.xword	0xda80f6303e341ef6
	.xword	0xd98327ae78777543
	.xword	0x53150af6ffece9ea
	.xword	0x08040e13369c7157
	.xword	0xaee0505ac8a8cf9b
	.xword	0x4bab9eb583de77c1
	.xword	0x6d1457aae06e7d56
	.xword	0x7a3366dbd2861794
	.xword	0x4645d81ff4220e2e
	.xword	0x6fefc7c541f484f7
	.xword	0x37f5e62ec6a38a30
	.xword	0x5934f1ec91b1eac3
	.xword	0xb5d074c49a162e4d
	.xword	0xaacea6bfa53c0206
	.xword	0x26950b46bba9c2c3
	.xword	0x8335f440f9373f8c
	.xword	0xcf4ee22cc4604f2b
	.xword	0x57c71e0c9e18a81c
	.xword	0xbf7fdf5928688dd2
	.xword	0xc16917270c8264d9
	.xword	0x25ce9ccf1a18d914
	.xword	0x3417683ad01dc667
	.xword	0x7abbce7c1cc387c2
	.xword	0x86666770d4e3b8b1
	.xword	0x55c4608513964eef
	.xword	0x0107becdc848f17d
	.xword	0x86cdd0c9e11ce03a
	.xword	0x129f1c5b6ffbdbbf
	.xword	0x9fb71c2fdf403b0c
	.xword	0x981e57fdefafbde9
	.xword	0xe63d567ad6c0a542
	.xword	0x21a4107562b4479b
	.xword	0xca3f4616aebfb4e5
	.xword	0x61a1e0560b1f31ec
	.xword	0x15ba115a58dfaf6c
	.xword	0x6a8b7cea5f09959a
	.xword	0xe8c88625bb67bd12
	.xword	0x2be8a122c9c3801f
	.xword	0x3a23c5d8a09eb640
	.xword	0x8071ea6d1992288d
	.xword	0x22162726035c1ef9
	.xword	0xfe09867aa5f26ea4
	.xword	0x6e1ac0b8145d88ea
	.xword	0xc8136028b902d579
	.xword	0xc7448d39131fea1e
	.xword	0xc7e6558df555fd10
	.xword	0x7a03762bea7546ba
	.xword	0xaec4737300152bdc
	.xword	0xd3d35f64d63fd718
	.xword	0x5ebbbb5b7df5eaf2
	.xword	0xa911198c265e2f62
	.xword	0x436a5e4735b99aa3
	.xword	0xea9b9baba2ecc512
	.xword	0x229166be7546a681
	.xword	0x632934e54c449f05
	.xword	0x82441486844a890d
	.xword	0x700f410e4e6f066c
	.xword	0x241beea00f409467
	.xword	0x5ebc6ecfc71a94a4
	.align 0x10000
	.data
data_start_4:

	.xword	0x9424280f6e5f3feb
	.xword	0xa609c6d7e8f2abad
	.xword	0xa8a61524c7592fbe
	.xword	0xc1d805a9e18c2994
	.xword	0xcdb90c642ea6b7e5
	.xword	0x9ad416dbede715b7
	.xword	0x139d534484ecf105
	.xword	0x9fe3e62b9629fe08
	.xword	0x83201c0d0d4eef0c
	.xword	0xf185786f55e1e503
	.xword	0x25cda927bfa5672c
	.xword	0x0f780582040885e4
	.xword	0xe0d8dc7675d3b3f0
	.xword	0xee719440b103e31a
	.xword	0x715e2e1484868242
	.xword	0x22df5d380ef713dc
	.xword	0x3c44257095ab5151
	.xword	0x1d2f4eb4b8d2d299
	.xword	0xfce2bfd56d9a9abc
	.xword	0x1d46f0d30a03335e
	.xword	0x84e9e05f1af927ce
	.xword	0xdbaa87a1024d3e76
	.xword	0x7301d282752e2c45
	.xword	0xa5e38d971c9b08a7
	.xword	0xa92cbb9028a637c8
	.xword	0x536a0f411f6bea15
	.xword	0x3e2d4e19de1cd062
	.xword	0x35b082fa9926681e
	.xword	0x7bae3fdd39f5262c
	.xword	0xa59898a217e7f760
	.xword	0xc7145cc436e47ab1
	.xword	0x54d0a7ddcf23faab
	.xword	0xe023ecf5e433403d
	.xword	0x30fb4dee99067c1e
	.xword	0xc8ab13a69de2e15d
	.xword	0x90a81b1f54e44f8a
	.xword	0x965756e7d56eb710
	.xword	0xa7ea57466a744848
	.xword	0x663080a696e22385
	.xword	0x3d6029129810cf6a
	.xword	0x85107f0a26259b79
	.xword	0xb082b37caf3f504d
	.xword	0xf50c35d3e732df13
	.xword	0xecbfbda39cc46613
	.xword	0x55bb926fa77fa16b
	.xword	0x4e63d3908305b897
	.xword	0x874ed57fda792e4b
	.xword	0x9fb4edc2f8bde6c1
	.xword	0xb29d6b899d855d2a
	.xword	0x38cc0ea80ccaba84
	.xword	0x9b864ea571a5df58
	.xword	0xe6205bc9eb6694da
	.xword	0x8962cb6f7947b146
	.xword	0x0bb8eb3b13fd5aff
	.xword	0xed6d12f341a9b2fc
	.xword	0x4eb2dc302ed7cbfb
	.xword	0x091e33d3b53c789d
	.xword	0xb40731d455e9f819
	.xword	0x99503afb096290aa
	.xword	0x85322821c599ce94
	.xword	0x16624ae9003ea212
	.xword	0xfece5c98b04d6cf6
	.xword	0x3c4c5ac76cc656bd
	.xword	0xd815ccb5fea13b8f
	.xword	0x2b0ee85a1df86e29
	.xword	0x9de81b4f96a33a84
	.xword	0xfa1a68c079feefd2
	.xword	0xd02ae4094f352072
	.xword	0xd70ad33e2af26595
	.xword	0xe26993f84377b0e9
	.xword	0xb861a9ff19c14ef2
	.xword	0xa798abf54e51d104
	.xword	0xa6b055078e756b22
	.xword	0xd021a0f737ab5bed
	.xword	0x96ae89b25cea0ea8
	.xword	0xa2013d849bdc23e9
	.xword	0xef6078f57adff4db
	.xword	0x1e5976d90226bc55
	.xword	0x0f2c6b407bab82a3
	.xword	0x9e232913e9613fd2
	.xword	0x68c62234325fd95a
	.xword	0x177c4a57080c299e
	.xword	0x92ea4337b24aed5c
	.xword	0xda392e1980f49e5a
	.xword	0x6ad247e33cfd323a
	.xword	0x38405d639c3fcd87
	.xword	0xf2454b681b16c25c
	.xword	0xfb82ecf0fe309ae3
	.xword	0xd69ae5b5e046448c
	.xword	0x353f02c8449193a4
	.xword	0xd2f781f9cfd3c01c
	.xword	0x5a4d83cf2178898a
	.xword	0x7fd3ea2e790188bd
	.xword	0xc9456de113a5828a
	.xword	0xb11cf5242ca54d7c
	.xword	0x3f76b256c5efc0be
	.xword	0x49187d4a5bf3df68
	.xword	0xd3a8757500554a58
	.xword	0xe30813490b084b67
	.xword	0x60c95c4d35af00f2
	.xword	0xa2f9857c3ffc2fe4
	.xword	0x0ee4e662db6655d0
	.xword	0xad70d61b4ef51380
	.xword	0x8a58b83007345b85
	.xword	0xc40724c76bc2ed1a
	.xword	0x0cf3d671b67a501a
	.xword	0xee13114867606430
	.xword	0x1cc69a213ef54f1e
	.xword	0xb888920bfa859790
	.xword	0x5fe4d2de35865edf
	.xword	0x75a530c788c78509
	.xword	0x0dbfa8da75ab7949
	.xword	0x0fbca9571becc49c
	.xword	0xf9d1a61867271dd0
	.xword	0xde2dc9d913386429
	.xword	0x378c6eae4d89e53f
	.xword	0x730037d04be72179
	.xword	0xf4d98f8e5377fb7c
	.xword	0x9430cd9084ce0c5f
	.xword	0x0b1da2514498537c
	.xword	0x0a05bff642a713ce
	.xword	0x022c3fbe15885d14
	.xword	0xf0117d8ab0abb280
	.xword	0x8fbb238f978dc649
	.xword	0x49d09344a6998c54
	.xword	0x4f0e29bacd6f84a9
	.xword	0xb866490ca8369bec
	.xword	0xdc9b9a4e3478d0ef
	.xword	0x153c2237a770eec4
	.xword	0xa928a17220d923aa
	.xword	0xb398b0663735790c
	.xword	0x011341aa913c9500
	.xword	0xdd7303fce131adbc
	.xword	0x855a9bad46a9e730
	.xword	0xe5cd0177c4177684
	.xword	0x2cfca619cee76db7
	.xword	0xd50817ddddbd6f80
	.xword	0x5436277e8c47cb63
	.xword	0x2aa8cfc95469b5ab
	.xword	0x47ed580a91e57a5d
	.xword	0x9c7e3e967f58d797
	.xword	0xdea49d4b3b3ff9b0
	.xword	0x38c30a8dbb5bdd3b
	.xword	0x672ba66409651037
	.xword	0x40f265a2ce47c5ea
	.xword	0xa981a8dffa10ec70
	.xword	0xab24fbf41802eff9
	.xword	0x15a897dc2f40c337
	.xword	0x0e3d18f2ee511aa2
	.xword	0x72413d7fb20e37b4
	.xword	0x791fb6899e752092
	.xword	0x6c58148093f30bed
	.xword	0xcb78aed34be5d217
	.xword	0x1fcea2bb57008d04
	.xword	0x3c0df16bbbce6f68
	.xword	0x85f6c597373dad0d
	.xword	0xfd764624b9b2c081
	.xword	0x462f82bd0e4fcfdf
	.xword	0xb63286574542c13b
	.xword	0x30d007c1a618871c
	.xword	0x4b476c94ec92d317
	.xword	0xeb109726aa0384f1
	.xword	0xcb14e27a6bc06562
	.xword	0xacf663dd582f9478
	.xword	0x15777a54b190879e
	.xword	0x0619a9f514d22724
	.xword	0x35d3e45132591998
	.xword	0x7c6d4a6a0114f080
	.xword	0x44928b04eb7e5f65
	.xword	0x7a3d332384ba129a
	.xword	0x6965efb7beb97896
	.xword	0xc432b538f724161e
	.xword	0x70f0609778282b95
	.xword	0xc3acb7e6e7027706
	.xword	0x601e5c42dea909cb
	.xword	0xae5e3e221860bcaa
	.xword	0x4252f5af76fe380a
	.xword	0xc16ee4babaf7adf9
	.xword	0x7219ef8605400b60
	.xword	0xb102797b0822f788
	.xword	0x3b9188ee19008f4d
	.xword	0x96b280e2cffb9e9b
	.xword	0x72f5c42aea39429a
	.xword	0xba505c8620355715
	.xword	0x58e3f6a0b1d0db11
	.xword	0x265abc5ffa0e868a
	.xword	0x9679f7ed99b79e17
	.xword	0x922de7cf1600b178
	.xword	0xff02a06de2a8e867
	.xword	0x1c56a9e5a1fc68f0
	.xword	0x03a7157296b2d2ce
	.xword	0x188bc18e4b43fcdd
	.xword	0x2720d3af1e74bfb3
	.xword	0x918a280cbf681040
	.xword	0xda30947904b0a580
	.xword	0xdbe865b968734b40
	.xword	0x602d8bebdc10fe77
	.xword	0x9da8a20cbc6dc15a
	.xword	0xe0c3c087b3af76ac
	.xword	0x0e5dbc67d32c76f6
	.xword	0x2a407ef0f96418c3
	.xword	0x34e09d86a98335ab
	.xword	0x6ad343ffccf124eb
	.xword	0x4d8b82261d8c0ba5
	.xword	0x2c656480ad69c75a
	.xword	0xe4cc9dcaaad9c653
	.xword	0x9ebd9c3e9350486e
	.xword	0x70d0825550329404
	.xword	0x0959ce62741925dd
	.xword	0x21ca9182d2c73773
	.xword	0xf07dbf1e530b70b0
	.xword	0x31068efc4b2e8e14
	.xword	0x801b3f15259f83a8
	.xword	0xd20065f60ecb4af4
	.xword	0xdff6a3a8e30efa8b
	.xword	0xf2fd8285ff4258f9
	.xword	0x4e5e924d1a3dc36a
	.xword	0x7ea271f12adba4d1
	.xword	0x745e6a55b02d838f
	.xword	0xd5dea5e9ca090ddf
	.xword	0x8ddacc61379cf867
	.xword	0x82fce00c6de44b0b
	.xword	0xec1c35018e4d5345
	.xword	0x71baa909af298bef
	.xword	0x87aba2065b28720e
	.xword	0xda971d118be66211
	.xword	0xb2f0543bba3adcf4
	.xword	0x2c461c345a2e32a9
	.xword	0xd82dae30ec7fa317
	.xword	0x136b7d7a239360f6
	.xword	0x8114d6851a4aade7
	.xword	0xa5a30c520d69c719
	.xword	0x5cc12f34ebdd03f7
	.xword	0x5391bb9bd3ba3f94
	.xword	0x32c4fbac4e14cd93
	.xword	0xc5fe4d6891de40a4
	.xword	0xbde7b2b15c5e59a4
	.xword	0x387585524424ffe0
	.xword	0xe3097d327d8ee383
	.xword	0xf7fe11bfc28bbd30
	.xword	0x023a5295284443ec
	.xword	0x01b970d84690824d
	.xword	0x0c258eccac066e31
	.xword	0x2c659ef521392470
	.xword	0xcbdbace6ab6315fa
	.xword	0x33a531325943621c
	.xword	0x9f14f2b2e7f7f725
	.xword	0xdfbf561cd62ddb76
	.xword	0xdaeb6cc15a3af4ed
	.xword	0x62a8b931047a30f2
	.xword	0x4be96af3352a997f
	.xword	0x5a6334200cc8843c
	.xword	0x24fc0b7bdd83b4c5
	.xword	0xf0da1b921e03eb88
	.xword	0x90bf23d042155528
	.xword	0x2075adc9087272fd
	.align 0x20000
	.data
data_start_5:

	.xword	0x646497fbd77ad646
	.xword	0x64a6fa4a6e0684bc
	.xword	0x2bdda5640dae9c5d
	.xword	0x9d06edb15b779c14
	.xword	0x43a09b5a21a0fd19
	.xword	0xb599b680db187cb1
	.xword	0x6dec926902c0aac1
	.xword	0xe1ec930abb2ad552
	.xword	0x8fe402cf1cfa3325
	.xword	0x27eacba0f8dc3369
	.xword	0x0c82aa3e2bfe6013
	.xword	0xa1fb28e48ecaafc1
	.xword	0xb03e9d9627f0b0ce
	.xword	0x35efe39b75d038c8
	.xword	0x2438101b72597730
	.xword	0xe2c195b512b69b02
	.xword	0xa538f275856358fc
	.xword	0xf405b0dccb210775
	.xword	0xd24430aefb4052d5
	.xword	0x69101c0dfb597ebb
	.xword	0xa73a307e24072654
	.xword	0xb16a280bcc8fac3f
	.xword	0xb58a212b72407f9f
	.xword	0xfccad98dc124ea10
	.xword	0xd40880029bf058eb
	.xword	0x03eca55e2bde04df
	.xword	0x9b57eeaa70b41b4d
	.xword	0x17af77056257ed19
	.xword	0x84dfa53e82ca7866
	.xword	0xdd57f036851b035c
	.xword	0xa224f07453f93188
	.xword	0x64ac60166c290ba1
	.xword	0xb486d6605ef0ef1f
	.xword	0x2f06661b979ce2d5
	.xword	0x28ba7c8432b56d71
	.xword	0x0ec65be3d7b47529
	.xword	0x9c24e1da56bf936f
	.xword	0x742cb0a65df27556
	.xword	0xca50817871b35738
	.xword	0x5f90c2f877c3aa3c
	.xword	0xa43bc71fd6ad7c9d
	.xword	0x38fedff8d664e4fe
	.xword	0x2bafc3c0165f34ce
	.xword	0x9044cf3ff2b5c2ad
	.xword	0x7bbbdd2e3c3e1d2e
	.xword	0x41ce100d136a4a16
	.xword	0x4fd61c84b0f8c2b2
	.xword	0x17d3b58963621496
	.xword	0xdefc6d375a5c6e13
	.xword	0x45ab7a7fb851e8ac
	.xword	0x4bc49cce71f1aa4e
	.xword	0x6cff9a0b30c4ee98
	.xword	0xdc5bb7e770478819
	.xword	0x2ced1a067b7400c6
	.xword	0xd6fbb214978320cf
	.xword	0xf84bee06171d7e29
	.xword	0x040874a3460a2609
	.xword	0xf941e2735bcc04ac
	.xword	0xd2de19fc5b09120d
	.xword	0x7550be163a8942ec
	.xword	0x73b7d6fbcecded14
	.xword	0xdab7e79c72e5e81d
	.xword	0x6db2821307ee9973
	.xword	0x7e6e3880a3b83a61
	.xword	0x03348a1a1b0ecd4c
	.xword	0x05cd3c3026d09922
	.xword	0x72a29d48e172e019
	.xword	0x8fc668fa9d9501fc
	.xword	0xadc70bdd873e55a9
	.xword	0x7475478bb34b204d
	.xword	0x818bc8d3b872009d
	.xword	0x9d1ec1517f555fdf
	.xword	0xd32ba11b8e307daa
	.xword	0x5352186c8bf08ef6
	.xword	0x82fd949588180c06
	.xword	0xb73879b27853992d
	.xword	0x571238e078e602d5
	.xword	0xe7eb1203d1426c6b
	.xword	0x54780f8ef70e9984
	.xword	0xc9f1303e01911db5
	.xword	0xa60addae28713f03
	.xword	0xeb9525f10e659432
	.xword	0x5d5209627ce9e452
	.xword	0xd4bfd5760b7452fb
	.xword	0x0eb22669fe3355c0
	.xword	0xc64abef111f2f342
	.xword	0xefe4c24e6507a4a5
	.xword	0xdd6a79d5f29ca9ca
	.xword	0x8b4088e0291a051b
	.xword	0x94156bee87105011
	.xword	0x523a0def20dc1a0d
	.xword	0x993bfd15fbbbf9f0
	.xword	0x68c6bf01806b3375
	.xword	0x2fbb1ca861d0f05c
	.xword	0xc835bb232046a318
	.xword	0x3629f59cbb5e881b
	.xword	0x96916fe79e64de46
	.xword	0xff7a27020f692236
	.xword	0x381311451e32db9a
	.xword	0x4904bed7875873b2
	.xword	0x03e7a53893c860e4
	.xword	0xcd6670d57b4dec3e
	.xword	0x1890666760017d54
	.xword	0x39c783565c4d37bc
	.xword	0x5869d1d817b4f7f6
	.xword	0x1e5384b7b1f72d59
	.xword	0xe1b6e34ab3907732
	.xword	0x297f48c0de87be25
	.xword	0x6fbdbad1f31e3fcf
	.xword	0x511ad38e3cc46a69
	.xword	0xe5417d661552e833
	.xword	0xaf084179767d0f51
	.xword	0x0e5ced6e3b46fa42
	.xword	0x25035023cfdbdd9e
	.xword	0x0e6c9bd32ef277da
	.xword	0x7472bb7e253a0c2c
	.xword	0x071f9a498e115b46
	.xword	0xdb488eb053449bab
	.xword	0x378c8c5fce64448b
	.xword	0xd02b64cd76ba9ae7
	.xword	0x6f0990c812e03320
	.xword	0x8c8ce4b923e17d86
	.xword	0x91dabd90bd990cab
	.xword	0x778a551595e4a9b9
	.xword	0xc3df492b3448a523
	.xword	0xd26d2adcb871f448
	.xword	0xe5015b13963a9c47
	.xword	0x917bf1bb433e72c3
	.xword	0x1c6e388f65314e13
	.xword	0x2263f325d428013c
	.xword	0xca085d3fe1a210ba
	.xword	0x408aacb267b72e52
	.xword	0x741d7b362c2915e2
	.xword	0x34b3921581d4a0ad
	.xword	0x46094e51bca24cec
	.xword	0x1f1798d449142588
	.xword	0xd18737b0130e315c
	.xword	0x7d069de40b48bb94
	.xword	0x18724b13390776d3
	.xword	0xc545d65f47772267
	.xword	0x25331237c8f49a93
	.xword	0xc389d4b0edcf1a7f
	.xword	0x8df1b42f36fea1b8
	.xword	0x82ed38af1a02cf4f
	.xword	0x3e0d0d74d81d564d
	.xword	0x8d0a774136b457ad
	.xword	0x7b97943cc021d01e
	.xword	0x763e600cc6e3ff37
	.xword	0x7ec8a2fdc38b2863
	.xword	0xabf331cac2ade892
	.xword	0x8b2d30822d559980
	.xword	0x618502cd6394c5c4
	.xword	0x6127f8fbd38a48a0
	.xword	0x23ad99967a70c900
	.xword	0x36dc1e3c3f20b567
	.xword	0xdb4568ac3d673add
	.xword	0x4c0477be251ef989
	.xword	0x75781f74ca8f6717
	.xword	0xd68547552926ff77
	.xword	0xce9eb236250f1438
	.xword	0xa52f022778801ec5
	.xword	0xb426602962f535d0
	.xword	0x2c8d7f9df09cbe69
	.xword	0xe567d8dc57f99b59
	.xword	0xf1ce86d7cfd4576d
	.xword	0x65e29ba58be5fb36
	.xword	0xb078749e3e580c51
	.xword	0xe5c0352503ee3233
	.xword	0x5b9c0d0d434c3397
	.xword	0x7b99e0f4305c3ee0
	.xword	0x3789834d3c205c74
	.xword	0x701aa1614e284c11
	.xword	0xe1049f2a8219e55b
	.xword	0x72c7b900cfdb4ee7
	.xword	0x4623f807e89fe45e
	.xword	0x6ae3b1b6637848d0
	.xword	0x821937a82f35e469
	.xword	0x2d81f7725d146ef1
	.xword	0x8bfca890eb3c8118
	.xword	0xa99649669be3a54d
	.xword	0x1add2e610d3df1f6
	.xword	0x8e77808e2d8375d6
	.xword	0x393802da9bbf0537
	.xword	0xfd6a62193456260d
	.xword	0x30892259def00c98
	.xword	0x6d8b8d795913c1f2
	.xword	0x210c2dbe4918b91f
	.xword	0x769c6b263216ef5b
	.xword	0x2c0b44e7646e6805
	.xword	0x1a4b85db5f1c0e24
	.xword	0x583939850a26d634
	.xword	0x7e795f64d3404e86
	.xword	0x06c5fce06fd701ff
	.xword	0x90d94ea36f1cbf31
	.xword	0xb6c68e429889bab7
	.xword	0xb167593a926f9eee
	.xword	0xf71862c58ab527cc
	.xword	0x944e0c78f487c227
	.xword	0xd765cbb39b55ef29
	.xword	0xb8cedd5ba350e5e5
	.xword	0x090e074144ff3db8
	.xword	0xbc4b656d1ffe7b94
	.xword	0x373a23f7a7d890db
	.xword	0x64a04a4bee83e09d
	.xword	0xd462f36dbdb3af35
	.xword	0x9bb76d86cc4fcf96
	.xword	0xaf44e6d31b46f355
	.xword	0xffd17f80b94c7078
	.xword	0x2352d5e6842b6215
	.xword	0x90447bfbef43cb28
	.xword	0xae18e24897a84d5e
	.xword	0xd33af12256fbdb50
	.xword	0x8d1ed78a4c736c39
	.xword	0x93785c275ef56a01
	.xword	0x60eae765cd05ee09
	.xword	0x86652d097a08506b
	.xword	0xbef902c8f5a1d254
	.xword	0xdc462712be53fcf1
	.xword	0x5dbadfc237ff8d3b
	.xword	0xe6cd74125f8b830c
	.xword	0xf0b3e9f252f802f1
	.xword	0x519f943b24d1c7ee
	.xword	0x3fe744933991a7d9
	.xword	0x9d1c9d3004f8a66a
	.xword	0x43ab9d3afe372be2
	.xword	0x12720321182bd244
	.xword	0xee539d687ce4a206
	.xword	0x739c0125a2b25625
	.xword	0x79d22b44269616ef
	.xword	0xf97e67ca7b422684
	.xword	0x1119c84307cf2ee4
	.xword	0xc4184200d0d3880e
	.xword	0x12defe9372125636
	.xword	0xa9ed7f32e0bb36ca
	.xword	0x8533cf9962b0eaef
	.xword	0x995cede8b5d706dc
	.xword	0xf7fef6a8b43ed4b6
	.xword	0x0a1ad62754b78c9d
	.xword	0xe27e84cd7148df7a
	.xword	0xa59149a60a6051e5
	.xword	0xefa830da04421f46
	.xword	0xa37dd05be2213d58
	.xword	0x8e2b073134be896a
	.xword	0xe944a1477344a704
	.xword	0x44c240ac3b11521c
	.xword	0xe6a263ad6f5532d0
	.xword	0xb1fd327a13fdc6f0
	.xword	0x239931f28e15dcdc
	.xword	0x8ace47ebffc234f6
	.xword	0x9ae212eb561a5601
	.xword	0x468cf18195befa59
	.xword	0x29f21885a932d413
	.xword	0xd0d2fe986f69333e
	.xword	0x8d24c4067bb209ce
	.xword	0xed0bbb6df5a3ae65
	.xword	0xe2770db6b37ef6ca
	.align 0x40000
	.data
data_start_6:

	.xword	0x8fc32510e7e3aaed
	.xword	0xf2bcd41c9fb298d2
	.xword	0x9b5a56cd6d9145ad
	.xword	0xf84b95b66d02a2fd
	.xword	0x92f356ad6c0fce17
	.xword	0xcabd708d88f05a1b
	.xword	0x0c0caa52cfe42e57
	.xword	0xee3d07efa7180c09
	.xword	0x07ca391c16db6428
	.xword	0x289013ac41976158
	.xword	0x7a30f0b20644740d
	.xword	0x0c84092ad1aa1cd5
	.xword	0x1aa3da96384fb4db
	.xword	0x12f23d3a52c2e42a
	.xword	0xb416d5777d47a765
	.xword	0x3b61291a03c2dbd9
	.xword	0x111ea33a0c432e12
	.xword	0x1e8281f0cd97b075
	.xword	0x28b3c66b586ab15c
	.xword	0x34740e87eb7ea930
	.xword	0x7959ad6df3c72f49
	.xword	0x55354ae253766b08
	.xword	0x3d35af406203d5b9
	.xword	0x799e19b0c75f6db9
	.xword	0x9e69137556bdf6a0
	.xword	0x8f19ff81560e5ba7
	.xword	0x6be8b5af78272410
	.xword	0x4acaae05d68e5921
	.xword	0xa8a7c76379c449a5
	.xword	0xc2f9744e7b35d616
	.xword	0x3cb9301cc597efc4
	.xword	0x972cbbdaa8ef311e
	.xword	0x6760eb32da8bd833
	.xword	0x83b1afba89a1e2b4
	.xword	0x38fa361a48ccfa93
	.xword	0x9002649fe9946b84
	.xword	0x01c31e74d5293c1b
	.xword	0xd21dca52ee074195
	.xword	0xd9749762cb9ebb07
	.xword	0x2f9e1390b82f0a74
	.xword	0x237ab4568162cda7
	.xword	0x45fbbd5aa024d608
	.xword	0xe9db9f73e88b6afa
	.xword	0xf7620685b7b01ab0
	.xword	0x5f5186fa5857e709
	.xword	0x677fdcb685c17a1c
	.xword	0xc33e1ed8e827cbeb
	.xword	0x392a232169873235
	.xword	0xc38739b328e1260f
	.xword	0xdea229cad02f5cc8
	.xword	0x3140a20e27e268ae
	.xword	0x94d4e5cd2771a8db
	.xword	0x4ede62ffac187d10
	.xword	0x026e50ed85bce24e
	.xword	0x492af878cd4c8a33
	.xword	0xd0b964f8c2b82446
	.xword	0x738bbe0668a437b3
	.xword	0x175c630d57a4ec0b
	.xword	0x6a1cfe397a6ccfcd
	.xword	0x6ac9f9b320234af2
	.xword	0x380857f05e3628e8
	.xword	0x431d35e7c3b9a5ef
	.xword	0x26594bd12b3f12f3
	.xword	0xe14f16162778250e
	.xword	0x778ca366a66f0f47
	.xword	0x05eaf92ed3231e00
	.xword	0xaa7555cbdab65fd4
	.xword	0x42384e3c7b56da1d
	.xword	0xb0dd0429e97daea6
	.xword	0xbe2be7f6bd5e858b
	.xword	0x036604dc2d5fb791
	.xword	0x6cd90253041be01c
	.xword	0x44d273398c7ef175
	.xword	0x3127662b741ffdee
	.xword	0xbdddef81d6fbc83a
	.xword	0xd774898b346fac6b
	.xword	0xfc2bca7742c019b4
	.xword	0xcf89de4c1d03d6d9
	.xword	0xddabb8704d39cc02
	.xword	0xc621bdcff13b073a
	.xword	0x76c5a4d458a1ef4f
	.xword	0x64bc81927de5e50c
	.xword	0xcbe0ddf6f449a396
	.xword	0x5af0d920cd645141
	.xword	0xb84c6cde96d4d6fe
	.xword	0x3ce0d47fe6526761
	.xword	0xf63b62627570cb7e
	.xword	0xcdf86e7be9ada1f5
	.xword	0xe0c7e7677e32fecb
	.xword	0xc57daf88b1581eac
	.xword	0xe6d60950736628d2
	.xword	0xd2a43c255f5650df
	.xword	0x490bfabe101d80d1
	.xword	0xed2f695346f6f7e8
	.xword	0x77bf51d2cba5b595
	.xword	0x034299eb907f5b11
	.xword	0x4fda9cb6dfdc1f6d
	.xword	0x9c4ee912ebc4ae54
	.xword	0xd8514a381fb77242
	.xword	0x631d01e0010209b1
	.xword	0x9b5be8d8b24fa864
	.xword	0x2dc8cc980d13567e
	.xword	0x9b3bffa0beade7b1
	.xword	0x5b1349d4756e9c9e
	.xword	0xec928bc3c2e74a1d
	.xword	0x83e14f4f3a0c3ad8
	.xword	0xbe8a28c1e38d13f0
	.xword	0xd619bb90025dc6bb
	.xword	0xa738c0a7f8b4daf8
	.xword	0x48beb8da854853ae
	.xword	0x7d61d24c7fffdd07
	.xword	0x6173973d4fc84344
	.xword	0x1b845c4a05f44503
	.xword	0xde81fab30cd1054f
	.xword	0x974a5b6f024db57e
	.xword	0xdbcd010ca9c17309
	.xword	0x62b3326dfd2a39eb
	.xword	0x58d38c74a3a3ffcd
	.xword	0x9e47f69e699bf919
	.xword	0x1779969af6bfe602
	.xword	0x053322fdd2f6db71
	.xword	0x9cd466c884900eb2
	.xword	0x88fef3a76dfa8f76
	.xword	0x65f773ec6ccb6643
	.xword	0x2f18ce169730a7aa
	.xword	0x2c727de47517ccba
	.xword	0xf965d2e05800c17a
	.xword	0x2d60b13aac362b3d
	.xword	0xbb4d8a9ced00d0e3
	.xword	0x6d20676643141f3c
	.xword	0xf606cd7c1f5bb740
	.xword	0x8237ca52bda17557
	.xword	0x682826b513a558b6
	.xword	0xd6c6b35cf20f0ab1
	.xword	0xea1699c9b7aeca99
	.xword	0x02c2699d114c543f
	.xword	0x38b1e29d27930944
	.xword	0x5d158937252c7d6b
	.xword	0x927584eb97652e2a
	.xword	0x19435c0695944519
	.xword	0xe8e9c59133c0049b
	.xword	0x55a4b352f514b319
	.xword	0xeacc26c15c4e38e7
	.xword	0x6c9172e8df689fcc
	.xword	0xa64022c90ea16a04
	.xword	0xc4c0a65e98cb0820
	.xword	0xbd01d9fb659c4781
	.xword	0xdf90bd620fdf09ef
	.xword	0xb7a505dceef3e17b
	.xword	0x4673c17c101fa110
	.xword	0x3f8652dc7342d4ec
	.xword	0x13760f1edf12a9cc
	.xword	0xf96679432ec6cd1c
	.xword	0x6a6005db3d1905ad
	.xword	0x6a0c20a19e4705f5
	.xword	0x4c77f95795cf6f58
	.xword	0x4bf6d2c6d800df67
	.xword	0xcd6b988e5f1dc9bc
	.xword	0x9c455f8220f22742
	.xword	0xa21f44b58b2f50c1
	.xword	0x237ce932cbcadaf9
	.xword	0x2befa1ad1a5e9c83
	.xword	0xbd77c4962a05790c
	.xword	0x8e62b5f3af76137a
	.xword	0x811a1161e5f13882
	.xword	0xc96217b920cc9f96
	.xword	0x7bf119c9343a2a00
	.xword	0x5287043a2133f223
	.xword	0x4794f28484b654da
	.xword	0xb3d286dc4bc10319
	.xword	0x6a76b287214f6eb5
	.xword	0xab6bbdb5d2762386
	.xword	0xb3b7e1101f5e4245
	.xword	0x3c9d7aa8dfff5c23
	.xword	0xde206792005ad990
	.xword	0x301cabda9d3f4b7b
	.xword	0xfdeed716ad0b681c
	.xword	0x6fa9dd3765f2d718
	.xword	0x1070367fbb88567f
	.xword	0x5fff247bcf80d4b6
	.xword	0xd3bcf984878736ad
	.xword	0x1fdf083e6e0d241b
	.xword	0xa255e1df203d55aa
	.xword	0xbedd2c192ca847b8
	.xword	0x1895c9a59bf26d46
	.xword	0xedeb9239c2aa7ad9
	.xword	0xc0d803df7078e47a
	.xword	0x7bbd93ae87255f62
	.xword	0x600ba4ed30f2f83a
	.xword	0x00fbfc2378509083
	.xword	0xe4f2ff259a84ddc2
	.xword	0x5c699d25ef48b5e4
	.xword	0x1cd3c32a510ec4f8
	.xword	0xc61b79a3952c74a4
	.xword	0x645d90fe7e05363f
	.xword	0x2412cb42e8cedafe
	.xword	0xaa9e9188bda8f2f2
	.xword	0xc9dca6cba7caef29
	.xword	0x9998dd1d8b62068c
	.xword	0xe70ffd29a3110c6c
	.xword	0x85f8b3fb41251e58
	.xword	0x35954ffa093b7bdb
	.xword	0x2b968d7bbc442f2f
	.xword	0x9e44da10938e92a9
	.xword	0xdbe3b84fe27e0d1f
	.xword	0x2f126caa2b74f169
	.xword	0xa49f2df1e450b2f7
	.xword	0x81fe45153bca1eb1
	.xword	0x9d06d426cc97602a
	.xword	0xdd3c506ca162132f
	.xword	0xb4085c3f5d21ed6a
	.xword	0xbabfe24d874d2b20
	.xword	0x669374ca6061c634
	.xword	0xb18496fa6c9c6b0b
	.xword	0x4cffa32dbf69733a
	.xword	0xa77757bb3adef5c8
	.xword	0x8107c575d9a186f8
	.xword	0x8a0bd0920f89a718
	.xword	0xe8edac55d9f6e6fb
	.xword	0xded1ac038c799021
	.xword	0x34636019390dc24a
	.xword	0x58a2231913eae0e2
	.xword	0x338817b7286cb51a
	.xword	0x8bc3c66dca55312d
	.xword	0x86597d51935e55f2
	.xword	0x91b11778d6c44ff7
	.xword	0x71e1d32a9bbd6688
	.xword	0x7fcc260ed78d6feb
	.xword	0x6a7df1f6bfd15241
	.xword	0x8e48f5d548cafdf2
	.xword	0x0e664497ba5d01da
	.xword	0x0826e554bd2145ca
	.xword	0x9243a36c99c63fbd
	.xword	0x2d0b1cc3914d7442
	.xword	0xf58461fc799225c8
	.xword	0xf54f9478ebabb50b
	.xword	0x2d9dec200f1fac46
	.xword	0x4578b90218685453
	.xword	0x8df944f0b69d5374
	.xword	0xf6dd6f9fb03dfa3a
	.xword	0x82fd7d5ee66fdefc
	.xword	0x8e50dedd11032278
	.xword	0xa877f1e825495d6d
	.xword	0x3d14e5346e5c94e0
	.xword	0x6dced8ad7b2b8fab
	.xword	0xadc0d8de68b56cd8
	.xword	0xd3f2550b4d8af872
	.xword	0x141caef075780082
	.xword	0x979b9c02b3996f62
	.xword	0x44b54c7255cd6c07
	.xword	0x3ce0a6039071a8b9
	.xword	0x67f6a6f904ad37a9
	.xword	0x36c453bd0fe9f474
	.xword	0x45c804b2c0ec0883
	.xword	0x4dbeee5aea973434
	.xword	0x9996fec2a7857c6f
	.align 0x80000
	.data
data_start_7:

	.xword	0x2fdf4c95d5c21f79
	.xword	0x897379c94a42c078
	.xword	0x81425fc7fe76a434
	.xword	0x0cace13034c6efea
	.xword	0x61e2777f30b7d131
	.xword	0x5c5a3e3d58eee07c
	.xword	0x858853bf514b4677
	.xword	0x2d0a7f4c6f458ce1
	.xword	0x525b4c17663fc902
	.xword	0xeb3495bd1fe6c0b1
	.xword	0xf2a0c3503f2cce2e
	.xword	0xf7c34ec0ed100216
	.xword	0x6968b8d2c62c0bb9
	.xword	0x5d8cef80a02548cb
	.xword	0xa4f0d16c947b4526
	.xword	0xfca11e92808379bb
	.xword	0xa18e2496e3895ac9
	.xword	0x899d08d005871bb0
	.xword	0x18004103c414008b
	.xword	0x82e8b7ffb599b5ce
	.xword	0x9b9540309c56abeb
	.xword	0x74476e6f40caf013
	.xword	0x94cd647f5ade1b0b
	.xword	0xb1a2d75a1c5cd8ed
	.xword	0x22853944d505f8c1
	.xword	0x408e389e2b74892e
	.xword	0xda822c21b9dce475
	.xword	0x3a9f1c4b7b41366a
	.xword	0xce67a46b6a940796
	.xword	0xd8bb7cc1b14b4601
	.xword	0x25d8a1e8430d62b9
	.xword	0x96567cde1db219b8
	.xword	0xf0846f2389247726
	.xword	0xfaecdc3c5961751f
	.xword	0x3f7d1a9e44771a02
	.xword	0x3bb0623d1cc29d6b
	.xword	0xf563844755bb5149
	.xword	0xc57463969bbbc1ad
	.xword	0x46a755d22a55a996
	.xword	0x6a9ca3608495161b
	.xword	0xae4faf8923d8523e
	.xword	0x5b92228ea92d58b5
	.xword	0xe132f5757dc62774
	.xword	0xd4218b0729812280
	.xword	0x18598dce32b2494b
	.xword	0xb2c95512c3f771b2
	.xword	0xa8c11fdaf8151699
	.xword	0xbfc655a23f1cb47c
	.xword	0x095c139bdb476a11
	.xword	0x4aba03c905c030ec
	.xword	0xba1c574d6411a1e5
	.xword	0xe9466fb2170cdddf
	.xword	0x44933aeb5ee4240c
	.xword	0x04503c8dfa4edc4a
	.xword	0xced11e8d9ee89918
	.xword	0x19c2fe76c4b95669
	.xword	0x91e59cee49269157
	.xword	0x13f306413dcb2550
	.xword	0x0e2381158226b4b5
	.xword	0x889441ca8d602eb5
	.xword	0x8d71c7734418e7c5
	.xword	0xeeb75e5f42eea4d6
	.xword	0xf722ce71f976fabc
	.xword	0x607cc27f17cc089a
	.xword	0xc2ccad5d43997320
	.xword	0xb492ff686cfe8afd
	.xword	0xb783b60226fde1e4
	.xword	0xc4bc412cb3de5845
	.xword	0xc6afe3e5f5186467
	.xword	0x3b9ed3566471e39a
	.xword	0xff60889a93bc6270
	.xword	0x80539cd85e199ae1
	.xword	0xaa809690d04a5df0
	.xword	0x301d08e9b45c9272
	.xword	0x530f73ecf5ea7659
	.xword	0x93984a513718532a
	.xword	0x4d49c952f0ee3941
	.xword	0x2fe9ac5c89f252b8
	.xword	0xe75c4dc7fcea0072
	.xword	0xa50d9bb9b0e60cb7
	.xword	0x70b01c3897f78cfa
	.xword	0x55477eee588b4e2e
	.xword	0x56b6aa2fc156f8a3
	.xword	0x3ce87f82f5e26dad
	.xword	0xbd8a977d22bfce5d
	.xword	0xe957af418e930087
	.xword	0x649a192bf375e8b7
	.xword	0x4d7f62b2116e5d3f
	.xword	0x0edae409ad58cb24
	.xword	0x4ac9ec4ebda20cdc
	.xword	0x667221d5b1ebd52a
	.xword	0xfa8b58422d2a6832
	.xword	0xb83bd857f3d615a8
	.xword	0x7d5067849201758e
	.xword	0xc7b2038b4fb9d0ac
	.xword	0x221ce36ee3eb7f22
	.xword	0x157b4d9781ddc27b
	.xword	0xbfd8ad00725e0cb5
	.xword	0x5358d73ba3b5eb56
	.xword	0x7ef6a4d82f42275c
	.xword	0x9e8940224fe737cf
	.xword	0x32ed34d5690d2232
	.xword	0xb28f669064d02533
	.xword	0x9564efe787e500db
	.xword	0x58aa2a3f467e5773
	.xword	0x66dce4eebabfe153
	.xword	0x8b7c5c2572b3822b
	.xword	0x67503a2f21477c5e
	.xword	0x52523798d759ecbd
	.xword	0x7fcba98d86582022
	.xword	0x7db0dc94e9d7a639
	.xword	0x69fb7a33f8befa62
	.xword	0x962604a2bfc16fa2
	.xword	0x202bc92044e1da76
	.xword	0x98db96211ba1509a
	.xword	0xc72290c738eca193
	.xword	0xa0254eb41395fa1a
	.xword	0x0dbc10c82cebc9e4
	.xword	0x8b5cb043b3e872ca
	.xword	0x22b35c5b0ace22ec
	.xword	0x3eb46e8545aaae8f
	.xword	0x4933c27ce7cc3c48
	.xword	0x6fdbf55d076c0ed2
	.xword	0xcd5711e47aac6eb1
	.xword	0xddb01d9365b1cd1c
	.xword	0x9c49ce720a09e195
	.xword	0x4cea5973862cd66c
	.xword	0x474abf579bf8a20b
	.xword	0x5e80d133358103db
	.xword	0xc7a7c4dad820266d
	.xword	0x5993db0b5eeb7f6a
	.xword	0x24e7193880f94d28
	.xword	0xbe4e70fc44f4402b
	.xword	0x0c39c451b6d461f4
	.xword	0xbc1c6b939c619d71
	.xword	0x22ebb5895e9e7f31
	.xword	0x489fa57616eff0cb
	.xword	0x9dbd3c6189c4b736
	.xword	0x9e7c5c72eba8e6f1
	.xword	0xaecdb3e7f4d95fe2
	.xword	0xe26ec6f8caabe867
	.xword	0xbfedfafe83709a31
	.xword	0x10441106c6d76d38
	.xword	0x6cff8cf60a75da2e
	.xword	0xaaab82e4a8c6e451
	.xword	0x21ddc88566ff5ad0
	.xword	0x6677771c62df3114
	.xword	0xb41521a4890013eb
	.xword	0x6589f7bf46b28f9e
	.xword	0x754572d3bb2ff076
	.xword	0x56fae420b1727cfd
	.xword	0x215bd9d7f84ef0ad
	.xword	0x9f3af16a1aa48123
	.xword	0xa07e6e78f4c0bd7e
	.xword	0x78675135e24f8053
	.xword	0x5a8936f0cb99501f
	.xword	0x573f716b9bbdeac5
	.xword	0xf256d05dde66db27
	.xword	0x762004ee796d1f75
	.xword	0x0539053382aa22ef
	.xword	0x4456570d24aea2e4
	.xword	0xfc64757043d9aa10
	.xword	0x40f37dea80aba553
	.xword	0x3d2b5489be807183
	.xword	0xf0aae4efb60a22ed
	.xword	0xc1c2fb11953d5972
	.xword	0xc4f5ccdc3eff340f
	.xword	0xef9ab97244f56175
	.xword	0x0bf5badc49f14048
	.xword	0xef58ae25e68432a6
	.xword	0x1e0001710b7f2522
	.xword	0x058631977a7063c6
	.xword	0x9ba3fed9cfa7a1c0
	.xword	0x93c2aa6776df7b42
	.xword	0x2821d175008ffb6a
	.xword	0xc821dca86a7ad610
	.xword	0x616677dff688c9ae
	.xword	0x60667f835bd172a5
	.xword	0xe6bd2318649329c6
	.xword	0xbb6288e94632abf7
	.xword	0x44cc06b8cae80542
	.xword	0x5d5846d9fd9f2d8e
	.xword	0x9e31cb80eb59fab7
	.xword	0x427d7ded656ad76e
	.xword	0x1f40add72d936150
	.xword	0xb9f153ea9906bd45
	.xword	0x7145f44a40b2ee78
	.xword	0xbec149fe1a5b3327
	.xword	0x39f11b9c9e103309
	.xword	0xdf8bc05f247ef252
	.xword	0xa2173ff5efee4464
	.xword	0x9c51155a822560e7
	.xword	0x064da1196e2ab8a3
	.xword	0x88fa67bdbc35aef8
	.xword	0x399d54b7a94aef6a
	.xword	0xd0706ff1a6b5a05a
	.xword	0xef96a3afdc59fa69
	.xword	0x85a680f3c5f5bbc2
	.xword	0x9b707e4597468c80
	.xword	0x1628d8f39e1c1baf
	.xword	0x225fe19a310c5811
	.xword	0xa78d3dfa9b9207e8
	.xword	0x3a9d6f3a46bd767a
	.xword	0xaf7fd8ff92b15fa4
	.xword	0x33221be8824ff98e
	.xword	0x1c8780cdc205fef3
	.xword	0x056230d592957233
	.xword	0xc212f10a601ca832
	.xword	0x595992ed2dd79ce8
	.xword	0xcd7154f63d166052
	.xword	0x7ba9d3c4026c7b16
	.xword	0x5b387183556a3618
	.xword	0x789a18470cfcbca5
	.xword	0x9c4d8ce4755627a3
	.xword	0x74e7cd1f88ca4ce7
	.xword	0xed1e739124f60cdf
	.xword	0x23a6c86977b56a85
	.xword	0xf10660629c510188
	.xword	0x285a4a5cc3a10e1b
	.xword	0x1fd70c10ece58b33
	.xword	0xc2ec86cb78acfac0
	.xword	0xe5315b7255483663
	.xword	0x4b2afbf95863cadc
	.xword	0xc3dbfc149e933953
	.xword	0xfac7bc23c5ed5985
	.xword	0x4c2c403e194fea0c
	.xword	0x71e268ce30100cfb
	.xword	0xd7b4579d04121d28
	.xword	0x242c714ee49ce3b2
	.xword	0x537a115ea8cb08c6
	.xword	0xb46cfca4eac19b43
	.xword	0x15884b10eaaff0d3
	.xword	0x787a7eb4cb66ec9d
	.xword	0x2cf863fbe7f50e76
	.xword	0xc6a51671f306e764
	.xword	0x35c7043625f936f0
	.xword	0x1deb687c662b0cd4
	.xword	0xdf4d746baf0640b5
	.xword	0x176943c9b0d83644
	.xword	0xb3a60d0b9e8ee1e2
	.xword	0x69a29a735855fc89
	.xword	0x2faa661fa9f09ca5
	.xword	0x256f62828753b54c
	.xword	0xd2f3c24d69b5824a
	.xword	0x2b48ea45e80e801e
	.xword	0x2f35dc5bac71afd7
	.xword	0x54fabac3d70d61a5
	.xword	0xb47b950eab534dc9
	.xword	0xf254626889732e04
	.xword	0x83932f957ba4af93
	.xword	0x7a6b6613d2608f60
	.xword	0x3df6e6b27d6c7bf9
	.xword	0x24111fb87dabac6b
	.xword	0x3855219ca683eade
	.xword	0x00a8d5bfedbdcbc6
	.xword	0x12b053aa1041539e



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
