// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_67_s2.s
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
   random seed:	204118296
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

	setx 0xbd4fe3797a6b6d5c, %g1, %g0
	setx 0x7d2c568cb4cfb3e6, %g1, %g1
	setx 0x0a46d26e1053acd0, %g1, %g2
	setx 0xc0133bf84ea1949a, %g1, %g3
	setx 0x4efce09a4e46f380, %g1, %g4
	setx 0xdf47d12891ab28f7, %g1, %g5
	setx 0x5e2de64c9a51f3da, %g1, %g6
	setx 0x2d94e4d582a2171a, %g1, %g7
	setx 0x459f7fabda717d0f, %g1, %r16
	setx 0x099b6c6ba1ac5f0b, %g1, %r17
	setx 0x3855b6f648efb00b, %g1, %r18
	setx 0x6dd3fb5b9519c999, %g1, %r19
	setx 0x2672ceb0df43c1e1, %g1, %r20
	setx 0x144d1bd02738efa7, %g1, %r21
	setx 0xc9f3214d76802244, %g1, %r22
	setx 0x22e9fc7119772225, %g1, %r23
	setx 0xf40e39c7d3198c67, %g1, %r24
	setx 0xa61c1cff1a11fd9f, %g1, %r25
	setx 0xfab9f5d803ea63c4, %g1, %r26
	setx 0xed38db707e3700ea, %g1, %r27
	setx 0x3b76cee430ff2797, %g1, %r28
	setx 0x4c7e16827a5aa5b0, %g1, %r29
	setx 0x4c813921f8ebae10, %g1, %r30
	setx 0xb834be0d822f7947, %g1, %r31
	save
	setx 0xdef7d27453539bca, %g1, %r16
	setx 0x916f892ca013523d, %g1, %r17
	setx 0x9756b792e8e789d1, %g1, %r18
	setx 0xd54f5e6aa6ae916e, %g1, %r19
	setx 0xa4f8adfe9ec89b92, %g1, %r20
	setx 0x91996da07fd9b56d, %g1, %r21
	setx 0x274f03ce85b74c95, %g1, %r22
	setx 0x0459fbce0fbec727, %g1, %r23
	setx 0x40e0e900a1b151ee, %g1, %r24
	setx 0xa327336bba4c37f7, %g1, %r25
	setx 0x2c4a1736a294fb75, %g1, %r26
	setx 0xd9bebc1ace723d50, %g1, %r27
	setx 0x53b57cac506c2a22, %g1, %r28
	setx 0x1720f10da57d5304, %g1, %r29
	setx 0xa1895070bc3cc1f4, %g1, %r30
	setx 0x09ae3a436347c65e, %g1, %r31
	save
	setx 0xaa1110a4e2a57fbd, %g1, %r16
	setx 0x5ae34f2dd61059af, %g1, %r17
	setx 0xe23180ae2914bd4f, %g1, %r18
	setx 0x0e182a98bb01116a, %g1, %r19
	setx 0x9b4c90a5a2e8ade2, %g1, %r20
	setx 0x3feaed328e3d1fb1, %g1, %r21
	setx 0xdd627dc775e10197, %g1, %r22
	setx 0x2925e91d0f3e8b0d, %g1, %r23
	setx 0x4bbec3334bcd11d9, %g1, %r24
	setx 0x69518568a0cb2086, %g1, %r25
	setx 0x1df3d3478c4fc91b, %g1, %r26
	setx 0x3a7d232ed425481b, %g1, %r27
	setx 0xa7cf61a1e9bd6ed8, %g1, %r28
	setx 0xd250cdea1b50ed31, %g1, %r29
	setx 0xfdb8a2429a5381bf, %g1, %r30
	setx 0x55551e3fbcda839b, %g1, %r31
	save
	setx 0x9065dd5ede055fa1, %g1, %r16
	setx 0x4b69d2bccb7f2f37, %g1, %r17
	setx 0xbaafc575bd2d6187, %g1, %r18
	setx 0xa7557ad345c592fd, %g1, %r19
	setx 0xa38ee50671fc5148, %g1, %r20
	setx 0x2442a6253a25205a, %g1, %r21
	setx 0xc0ba64bcc5f7fff6, %g1, %r22
	setx 0xd341d7f93242dfda, %g1, %r23
	setx 0x5569a0d626f55f11, %g1, %r24
	setx 0x2c37e40396aad1da, %g1, %r25
	setx 0xe226a8867b0610c4, %g1, %r26
	setx 0x8b32f53f24083bae, %g1, %r27
	setx 0x3c97cd8019b98242, %g1, %r28
	setx 0xf96327271d9d9cba, %g1, %r29
	setx 0xf5a32756f9689232, %g1, %r30
	setx 0x8c5d5d700f50d6a9, %g1, %r31
	save
	setx 0x52a5d2b703a7e90e, %g1, %r16
	setx 0x6a5cbcf30ed4cf22, %g1, %r17
	setx 0xe4310041c2806fd6, %g1, %r18
	setx 0x7f77b7a706e6cced, %g1, %r19
	setx 0x85428884b2f12da5, %g1, %r20
	setx 0x08b537fa0af0f0f2, %g1, %r21
	setx 0xb7b853cc9e6b218b, %g1, %r22
	setx 0x370fab2f2b5426c0, %g1, %r23
	setx 0xfe7057e636a7c0f2, %g1, %r24
	setx 0xbbcc0ad951afd4ca, %g1, %r25
	setx 0xdc1b1a22ff86fbf2, %g1, %r26
	setx 0x0570b24b620baca0, %g1, %r27
	setx 0x87fa03e08cd0faad, %g1, %r28
	setx 0x2247fbbe1ce1294a, %g1, %r29
	setx 0xc1bb18662d5091c4, %g1, %r30
	setx 0x94dac1a217b64696, %g1, %r31
	save
	setx 0x4ad2982dab34cd52, %g1, %r16
	setx 0x4d1f147b1e7ecd56, %g1, %r17
	setx 0x66bc41706dbde07c, %g1, %r18
	setx 0xafbd699fee4d3fe7, %g1, %r19
	setx 0x521843537764f699, %g1, %r20
	setx 0xe006b18093ee8c51, %g1, %r21
	setx 0xa5a3b73e77fcab30, %g1, %r22
	setx 0x3e388ffb2f7207ad, %g1, %r23
	setx 0x441ee03de516e4ce, %g1, %r24
	setx 0x6e2353ece7faf578, %g1, %r25
	setx 0x6fcde87621fa000b, %g1, %r26
	setx 0x1db886102d6a4801, %g1, %r27
	setx 0x87115d191bfd60c5, %g1, %r28
	setx 0xea4232f994ca7ffd, %g1, %r29
	setx 0x06a4d68229c2e280, %g1, %r30
	setx 0x67406dd5107cbc3a, %g1, %r31
	save
	setx 0x314378486638daa6, %g1, %r16
	setx 0xcd384c8d6c5e3d27, %g1, %r17
	setx 0xe04d0883a5a812e0, %g1, %r18
	setx 0x56c729ce9faf527e, %g1, %r19
	setx 0x5c4b98fb610ba3ea, %g1, %r20
	setx 0xa85fce4e644cfa6b, %g1, %r21
	setx 0xae11eb5dca9de1f8, %g1, %r22
	setx 0xc97e67b11d23a9f5, %g1, %r23
	setx 0x837603fb9268e3ad, %g1, %r24
	setx 0xcd715e7279b3ad90, %g1, %r25
	setx 0xf2193afe626be830, %g1, %r26
	setx 0x069ef6ffaba69bca, %g1, %r27
	setx 0x1cf1577aa639e519, %g1, %r28
	setx 0x8bbe034fd1e5b46b, %g1, %r29
	setx 0xa7bf9310ba7ae302, %g1, %r30
	setx 0xd470f68c4079786c, %g1, %r31
	save
	setx 0x36dfda3bdeb1d51a, %g1, %r16
	setx 0x0a9c55ee9d170031, %g1, %r17
	setx 0xee996922a11a0458, %g1, %r18
	setx 0x1a11c016ae846fde, %g1, %r19
	setx 0x35a5eac894d89f8c, %g1, %r20
	setx 0x9109a010f72dc01d, %g1, %r21
	setx 0x7dfebb78fe6183a7, %g1, %r22
	setx 0xb355c9f0dee75bb8, %g1, %r23
	setx 0xd2f9b3aa20859dc0, %g1, %r24
	setx 0xb48651be8e064724, %g1, %r25
	setx 0x309dc717e933ad48, %g1, %r26
	setx 0x3e4d4cd9ca599a02, %g1, %r27
	setx 0x36a2ea98187bf79a, %g1, %r28
	setx 0xe5e0bc445c54d6c4, %g1, %r29
	setx 0xf50c13b0eb06d27c, %g1, %r30
	setx 0x45dfdfadd96df445, %g1, %r31
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
	.word 0xb3e420f1  ! 1: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e520cd  ! 2: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe5a1f9  ! 4: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe42038  ! 9: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe5618d  ! 12: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e119  ! 17: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe4a18f  ! 19: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb4354000  ! 29: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xb5520000  ! 30: RDPR_PIL	<illegal instruction>
	.word 0xb5e4a0e7  ! 33: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 35: RDPR_TNPC	<illegal instruction>
	.word 0xb7520000  ! 37: RDPR_PIL	<illegal instruction>
	.word 0xbd2cc000  ! 46: SLL_R	sll 	%r19, %r0, %r30
	.word 0xb3e52173  ! 47: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4a093  ! 49: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d94618e  ! 51: WRPR_PSTATE_I	wrpr	%r17, 0x018e, %pstate
	.word 0xb7e56036  ! 54: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9510000  ! 56: RDPR_TICK	<illegal instruction>
	.word 0xb3480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7e521fb  ! 65: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5e11c  ! 67: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e46091  ! 72: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5a1b1  ! 76: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xb1e520d2  ! 94: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0xb7e5213f  ! 105: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbb508000  ! 108: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4a027  ! 109: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0cd  ! 116: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5a119  ! 117: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5617b  ! 118: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0x8794a110  ! 120: WRPR_TT_I	wrpr	%r18, 0x0110, %tt
	.word 0xb3480000  ! 121: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbd480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e16e  ! 124: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbcb54000  ! 127: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xb5e461e8  ! 128: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e56143  ! 129: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e4a138  ! 130: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_2, %g1, %r17
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc156063  ! 143: OR_I	or 	%r21, 0x0063, %r30
	.word 0xb9e52153  ! 148: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a075  ! 154: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e520ae  ! 157: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde560e3  ! 160: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xba8dc000  ! 165: ANDcc_R	andcc 	%r23, %r0, %r29
	.word 0xb9e5e1f8  ! 166: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde460fa  ! 167: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_5, %g1, %r20
	.word 0x8794e13e  ! 170: WRPR_TT_I	wrpr	%r19, 0x013e, %tt
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 179: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5a108  ! 181: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4604d  ! 183: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9500000  ! 188: RDPR_TPC	<illegal instruction>
	.word 0x819520f3  ! 189: WRPR_TPC_I	wrpr	%r20, 0x00f3, %tpc
	.word 0xb83cc000  ! 191: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0x839520fc  ! 194: WRPR_TNPC_I	wrpr	%r20, 0x00fc, %tnpc
	.word 0xbbe5e135  ! 197: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x859520ea  ! 200: WRPR_TSTATE_I	wrpr	%r20, 0x00ea, %tstate
	.word 0xb9e5e01e  ! 204: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e421bc  ! 206: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb22461aa  ! 217: SUB_I	sub 	%r17, 0x01aa, %r25
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3348000  ! 220: SRL_R	srl 	%r18, %r0, %r25
	.word 0xb0442153  ! 221: ADDC_I	addc 	%r16, 0x0153, %r24
	setx	0x1012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83942096  ! 223: WRPR_TNPC_I	wrpr	%r16, 0x0096, %tnpc
	.word 0xbfe460d8  ! 224: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb0a58000  ! 226: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xb9518000  ! 227: RDPR_PSTATE	<illegal instruction>
	.word 0xbc840000  ! 228: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xbbe5206e  ! 234: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e00b  ! 236: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe421e4  ! 238: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4e13b  ! 243: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb425612c  ! 247: SUB_I	sub 	%r21, 0x012c, %r26
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e460eb  ! 249: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e420e8  ! 250: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4a120  ! 251: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde42128  ! 253: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a180  ! 257: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5348000  ! 258: SRL_R	srl 	%r18, %r0, %r26
	.word 0xbbe4a0cb  ! 261: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e00b  ! 263: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e195  ! 267: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_0, %g1, %r19
	.word 0xbde4e036  ! 269: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4a18a  ! 270: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e521f1  ! 271: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x879521f9  ! 278: WRPR_TT_I	wrpr	%r20, 0x01f9, %tt
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e171  ! 281: WRPR_PSTATE_I	wrpr	%r19, 0x0171, %pstate
	.word 0xb00c4000  ! 282: AND_R	and 	%r17, %r0, %r24
	.word 0xb1480000  ! 287: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3e4e02d  ! 289: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1540000  ! 293: RDPR_GL	<illegal instruction>
	setx	data_start_2, %g1, %r21
	setx	data_start_0, %g1, %r18
	.word 0xb3540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xbde4e1a3  ! 298: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4e17d  ! 302: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8595e017  ! 303: WRPR_TSTATE_I	wrpr	%r23, 0x0017, %tstate
	.word 0xb1e5207a  ! 304: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5e068  ! 309: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb2b5e0dd  ! 311: ORNcc_I	orncc 	%r23, 0x00dd, %r25
	.word 0xb9e5a19a  ! 312: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8995618b  ! 314: WRPR_TICK_I	wrpr	%r21, 0x018b, %tick
	.word 0xb1e5e0fa  ! 320: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e5e1c3  ! 324: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a058  ! 325: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e094  ! 330: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb33cc000  ! 342: SRA_R	sra 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983f49  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f49, %hpstate
	.word 0xb9e5206a  ! 352: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 356: RDPR_TL	<illegal instruction>
	.word 0x85956007  ! 357: WRPR_TSTATE_I	wrpr	%r21, 0x0007, %tstate
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 360: RDPR_TT	<illegal instruction>
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0ff  ! 365: SAVE_I	save	%r19, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf3d7001  ! 368: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0x83956012  ! 373: WRPR_TNPC_I	wrpr	%r21, 0x0012, %tnpc
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe46126  ! 375: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe42164  ! 377: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e19c  ! 380: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc0c4000  ! 382: AND_R	and 	%r17, %r0, %r30
	.word 0xb6b4609f  ! 385: ORNcc_I	orncc 	%r17, 0x009f, %r27
	.word 0xb5540000  ! 386: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982adb  ! 387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adb, %hpstate
	.word 0xb9520000  ! 391: RDPR_PIL	<illegal instruction>
	.word 0xb1e4a190  ! 393: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb134c000  ! 395: SRL_R	srl 	%r19, %r0, %r24
	.word 0xb9e4e081  ! 396: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1e8  ! 404: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4e189  ! 407: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc34c000  ! 410: ORN_R	orn 	%r19, %r0, %r30
	.word 0xb7e42016  ! 414: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbc2d2038  ! 415: ANDN_I	andn 	%r20, 0x0038, %r30
	.word 0xb3e4e0bb  ! 419: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46057  ! 422: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 425: RDPR_PSTATE	<illegal instruction>
	.word 0xb5500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb83ce157  ! 430: XNOR_I	xnor 	%r19, 0x0157, %r28
	.word 0xb5641800  ! 431: MOVcc_R	<illegal instruction>
	setx	0x3002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20210, %g1, %o0
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
	.word 0xb9e5a1dc  ! 440: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e560a2  ! 442: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e4e008  ! 445: SAVE_I	save	%r19, 0x0001, %r25
	mov	2, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3540000  ! 450: RDPR_GL	<illegal instruction>
	.word 0xb3e42059  ! 451: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e460cb  ! 457: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4203e  ! 458: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5e16a  ! 461: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e4a153  ! 462: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e460c3  ! 463: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbcac2069  ! 466: ANDNcc_I	andncc 	%r16, 0x0069, %r30
	.word 0x8795e15b  ! 467: WRPR_TT_I	wrpr	%r23, 0x015b, %tt
	.word 0xb151c000  ! 473: RDPR_TL	<illegal instruction>
	.word 0xb7e5a06a  ! 474: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4a094  ! 476: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5a180  ! 477: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x819520b1  ! 479: WRPR_TPC_I	wrpr	%r20, 0x00b1, %tpc
	.word 0xbfe4214b  ! 480: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc0d2183  ! 483: AND_I	and 	%r20, 0x0183, %r30
	setx	data_start_1, %g1, %r20
	.word 0xb2850000  ! 489: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xb1e4a092  ! 491: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e46027  ! 494: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a1e3  ! 496: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4a01c  ! 498: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb61d8000  ! 503: XOR_R	xor 	%r22, %r0, %r27
	.word 0xbbe5e01f  ! 507: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983883  ! 510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1883, %hpstate
	.word 0x8595e0d5  ! 513: WRPR_TSTATE_I	wrpr	%r23, 0x00d5, %tstate
	.word 0xb5e5e073  ! 515: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x839420c5  ! 517: WRPR_TNPC_I	wrpr	%r16, 0x00c5, %tnpc
	.word 0xb3e4a102  ! 520: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e5e04b  ! 522: SAVE_I	save	%r23, 0x0001, %r24
	mov	0, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0e3  ! 530: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e4e113  ! 531: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc3c8000  ! 541: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xb024e0ae  ! 542: SUB_I	sub 	%r19, 0x00ae, %r24
	.word 0xb9e5e08f  ! 543: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 549: MOVcc_I	<illegal instruction>
	.word 0xbf480000  ! 550: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfe4e1b1  ! 553: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8595e0bf  ! 554: WRPR_TSTATE_I	wrpr	%r23, 0x00bf, %tstate
	.word 0x819521c9  ! 557: WRPR_TPC_I	wrpr	%r20, 0x01c9, %tpc
	.word 0xb445c000  ! 559: ADDC_R	addc 	%r23, %r0, %r26
	setx	0x20008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4213b  ! 563: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e5a1e8  ! 567: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95611b  ! 569: WRPR_PSTATE_I	wrpr	%r21, 0x011b, %pstate
	.word 0xb9e4a09e  ! 572: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4e1fd  ! 573: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0a2  ! 576: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5e149  ! 577: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb8b5c000  ! 578: SUBCcc_R	orncc 	%r23, %r0, %r28
	.word 0xb7e460f0  ! 579: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb42c0000  ! 581: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xb3e4e0a3  ! 583: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf3d5000  ! 587: SRAX_R	srax	%r21, %r0, %r31
	.word 0xb9520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xb1e5e1e3  ! 589: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe5a006  ! 595: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8d9520e2  ! 596: WRPR_PSTATE_I	wrpr	%r20, 0x00e2, %pstate
	.word 0xb5e561e7  ! 599: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a004  ! 605: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde4a048  ! 609: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5e1ba  ! 613: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983dc9  ! 614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc9, %hpstate
	.word 0xb1e521ef  ! 617: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4202e  ! 618: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198289b  ! 620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089b, %hpstate
	.word 0xbbe5a197  ! 621: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe561aa  ! 623: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5602d  ! 627: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8994a0f1  ! 635: WRPR_TICK_I	wrpr	%r18, 0x00f1, %tick
	.word 0xbde52057  ! 643: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe56141  ! 644: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde52078  ! 654: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe420b8  ! 656: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e46122  ! 658: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e521e3  ! 660: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde42062  ! 662: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd35b001  ! 663: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0x8195a0f8  ! 668: WRPR_TPC_I	wrpr	%r22, 0x00f8, %tpc
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0f0  ! 675: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x20029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982909  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0909, %hpstate
	setx	data_start_4, %g1, %r19
	.word 0xbc04a1c9  ! 683: ADD_I	add 	%r18, 0x01c9, %r30
	.word 0x8794a019  ! 686: WRPR_TT_I	wrpr	%r18, 0x0019, %tt
	.word 0xb3e56140  ! 687: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e19e  ! 688: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5e0cb  ! 692: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bca1ab  ! 696: XNORcc_I	xnorcc 	%r18, 0x01ab, %r24
	.word 0x8195e046  ! 698: WRPR_TPC_I	wrpr	%r23, 0x0046, %tpc
	.word 0xbbe46063  ! 699: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e56074  ! 702: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e460a8  ! 704: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e52125  ! 708: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e520a0  ! 709: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb2b461e1  ! 711: SUBCcc_I	orncc 	%r17, 0x01e1, %r25
	.word 0xb8c4e00a  ! 712: ADDCcc_I	addccc 	%r19, 0x000a, %r28
	.word 0x91942017  ! 713: WRPR_PIL_I	wrpr	%r16, 0x0017, %pil
	.word 0xb7e520aa  ! 714: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5e142  ! 717: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5a181  ! 722: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e4e027  ! 723: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4a0c1  ! 724: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x89942017  ! 729: WRPR_TICK_I	wrpr	%r16, 0x0017, %tick
	.word 0xb7643801  ! 730: MOVcc_I	<illegal instruction>
	.word 0xb92dd000  ! 731: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb285a17e  ! 734: ADDcc_I	addcc 	%r22, 0x017e, %r25
	.word 0x8d95a1cd  ! 737: WRPR_PSTATE_I	wrpr	%r22, 0x01cd, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983ac9  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac9, %hpstate
	.word 0x8594e079  ! 741: WRPR_TSTATE_I	wrpr	%r19, 0x0079, %tstate
	.word 0xb7e46084  ! 743: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x919461a3  ! 752: WRPR_PIL_I	wrpr	%r17, 0x01a3, %pil
	.word 0xbbe52035  ! 753: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb351c000  ! 756: RDPR_TL	<illegal instruction>
	.word 0xb1e5a062  ! 757: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x859421f3  ! 762: WRPR_TSTATE_I	wrpr	%r16, 0x01f3, %tstate
	.word 0xbde4a0ce  ! 768: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x859560f9  ! 771: WRPR_TSTATE_I	wrpr	%r21, 0x00f9, %tstate
	.word 0xb9e460f0  ! 772: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5a128  ! 773: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e027  ! 774: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 780: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a01e  ! 783: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb551c000  ! 785: RDPR_TL	<illegal instruction>
	.word 0xbfe5e0d0  ! 789: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8594a099  ! 792: WRPR_TSTATE_I	wrpr	%r18, 0x0099, %tstate
	.word 0xb7480000  ! 793: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9e5e056  ! 796: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	setx	data_start_0, %g1, %r22
	.word 0x8d94e1ac  ! 826: WRPR_PSTATE_I	wrpr	%r19, 0x01ac, %pstate
	.word 0xb150c000  ! 828: RDPR_TT	<illegal instruction>
	.word 0xbfe5a140  ! 831: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e561b9  ! 836: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5518000  ! 837: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a0a2  ! 842: WRPR_TT_I	wrpr	%r22, 0x00a2, %tt
	.word 0xb3e5a175  ! 844: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5203d  ! 847: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8994215e  ! 852: WRPR_TICK_I	wrpr	%r16, 0x015e, %tick
	.word 0xb1e46005  ! 859: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x8594e182  ! 873: WRPR_TSTATE_I	wrpr	%r19, 0x0182, %tstate
	.word 0xbbe420eb  ! 878: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb02d8000  ! 879: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xbbe4a0a7  ! 881: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb350c000  ! 883: RDPR_TT	<illegal instruction>
	.word 0xbbe561db  ! 889: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a0f4  ! 894: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4614e  ! 896: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4e08a  ! 898: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 905: RDPR_TT	<illegal instruction>
	.word 0xbd359000  ! 906: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xb5e560b0  ! 907: SAVE_I	save	%r21, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 910: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe421f6  ! 914: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8395a0ee  ! 915: WRPR_TNPC_I	wrpr	%r22, 0x00ee, %tnpc
	.word 0xbd35a001  ! 918: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xb5510000  ! 919: RDPR_TICK	<illegal instruction>
	.word 0xb3e5a0a5  ! 923: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe460f7  ! 925: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0a5  ! 930: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe350000  ! 932: ORN_R	orn 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d51  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	setx	data_start_2, %g1, %r19
	.word 0xb7e5608c  ! 935: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4a18c  ! 937: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe42063  ! 938: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb951c000  ! 944: RDPR_TL	<illegal instruction>
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a10a  ! 950: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4a0c6  ! 953: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x1d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e421e2  ! 957: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_1, %g1, %r19
	.word 0x8195e117  ! 960: WRPR_TPC_I	wrpr	%r23, 0x0117, %tpc
	.word 0xb0b5e10a  ! 964: ORNcc_I	orncc 	%r23, 0x010a, %r24
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e420f8  ! 974: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4e18f  ! 975: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1508000  ! 977: RDPR_TSTATE	<illegal instruction>
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4612d  ! 980: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb350000  ! 984: SRL_R	srl 	%r20, %r0, %r29
	.word 0xb9510000  ! 986: RDPR_TICK	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb72c1000  ! 988: SLLX_R	sllx	%r16, %r0, %r27
	.word 0x91942128  ! 991: WRPR_PIL_I	wrpr	%r16, 0x0128, %pil
	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1e3  ! 1002: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xb9e5e0ac  ! 1010: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e46156  ! 1011: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20036, %g1, %o0
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
	.word 0xbbe5e0df  ! 1017: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde5a0bf  ! 1018: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbb508000  ! 1020: RDPR_TSTATE	<illegal instruction>
	.word 0xb13de001  ! 1027: SRA_I	sra 	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 1028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5a1c2  ! 1041: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4a151  ! 1044: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3500000  ! 1045: RDPR_TPC	<illegal instruction>
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46159  ! 1049: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 1051: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1053: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	.word 0x81982acb  ! 1057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	.word 0xbfe560b1  ! 1063: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3518000  ! 1065: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1066: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb52df001  ! 1068: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xbfe4e1bd  ! 1069: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4207f  ! 1071: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8994210a  ! 1072: WRPR_TICK_I	wrpr	%r16, 0x010a, %tick
	setx	data_start_4, %g1, %r22
	.word 0xbbe42097  ! 1076: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x2000a, %g1, %o0
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
	.word 0xb9e5a135  ! 1082: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb42c4000  ! 1084: ANDN_R	andn 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xb7518000  ! 1095: RDPR_PSTATE	rdpr	%pstate, %r27
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4603d  ! 1106: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5a1b5  ! 1109: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982fd9  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xb9e560fe  ! 1121: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a17c  ! 1124: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7518000  ! 1126: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a0cc  ! 1127: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde46100  ! 1128: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a18a  ! 1137: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e46194  ! 1141: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5e09d  ! 1143: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde56072  ! 1150: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5540000  ! 1151: RDPR_GL	<illegal instruction>
	.word 0x9194204b  ! 1154: WRPR_PIL_I	wrpr	%r16, 0x004b, %pil
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbce0ee  ! 1156: XNORcc_I	xnorcc 	%r19, 0x00ee, %r30
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1158: MOVcc_I	<illegal instruction>
	.word 0xb5e5e18d  ! 1163: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe1da07b  ! 1168: XOR_I	xor 	%r22, 0x007b, %r31
	.word 0xb9e4210c  ! 1169: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x819420f1  ! 1170: WRPR_TPC_I	wrpr	%r16, 0x00f1, %tpc
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421f7  ! 1173: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbeac4000  ! 1174: ANDNcc_R	andncc 	%r17, %r0, %r31
	.word 0xb3e46013  ! 1177: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e5209b  ! 1179: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe5615d  ! 1182: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e56063  ! 1188: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4203c  ! 1189: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e560db  ! 1191: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5217f  ! 1194: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e56003  ! 1195: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a108  ! 1197: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x9195605a  ! 1198: WRPR_PIL_I	wrpr	%r21, 0x005a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982c99  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c99, %hpstate
	setx	data_start_5, %g1, %r17
	.word 0xbbe5e1d4  ! 1202: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb550c000  ! 1203: RDPR_TT	<illegal instruction>
	.word 0xb7e56153  ! 1204: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4e19c  ! 1205: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e420ba  ! 1206: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e520aa  ! 1207: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e56020  ! 1210: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4e0be  ! 1211: SAVE_I	save	%r19, 0x0001, %r28
	setx	data_start_5, %g1, %r22
	.word 0xb5e4e025  ! 1215: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31f, %g1, %o0
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
	.word 0xb1508000  ! 1231: RDPR_TSTATE	<illegal instruction>
	.word 0xb9340000  ! 1237: SRL_R	srl 	%r16, %r0, %r28
	.word 0xb5e4e13f  ! 1241: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x89946014  ! 1242: WRPR_TICK_I	wrpr	%r17, 0x0014, %tick
	.word 0xb1e5a1f0  ! 1243: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e421e4  ! 1244: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb414e1aa  ! 1246: OR_I	or 	%r19, 0x01aa, %r26
	.word 0xbfe5a18b  ! 1248: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd508000  ! 1249: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e46159  ! 1250: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_3, %g1, %r17
	.word 0xbf504000  ! 1255: RDPR_TNPC	<illegal instruction>
	.word 0xb9e4a165  ! 1256: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e56123  ! 1262: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb2946156  ! 1265: ORcc_I	orcc 	%r17, 0x0156, %r25
	.word 0xb8440000  ! 1272: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xbbe4e197  ! 1273: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe42110  ! 1274: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e46194  ! 1275: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e4e072  ! 1276: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x8198285b  ! 1277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	setx	data_start_1, %g1, %r23
	.word 0xb5e5a09d  ! 1287: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	.word 0x8795607a  ! 1292: WRPR_TT_I	wrpr	%r21, 0x007a, %tt
	.word 0xbde5205e  ! 1293: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5a0ea  ! 1296: SAVE_I	save	%r22, 0x0001, %r25
	mov	1, %r12
	.word 0x8f932000  ! 1299: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_4, %g1, %r20
	.word 0xb7e4a151  ! 1303: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e520a6  ! 1308: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e4a03b  ! 1310: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e561dd  ! 1313: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e1dc  ! 1318: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1508000  ! 1320: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5e0df  ! 1322: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb28461dd  ! 1323: ADDcc_I	addcc 	%r17, 0x01dd, %r25
	.word 0xb7508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e561b6  ! 1331: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb2ac4000  ! 1336: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0x8394a126  ! 1338: WRPR_TNPC_I	wrpr	%r18, 0x0126, %tnpc
	.word 0xb5e4e163  ! 1339: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7510000  ! 1342: RDPR_TICK	<illegal instruction>
	setx	0x30016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4203a  ! 1346: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb2158000  ! 1347: OR_R	or 	%r22, %r0, %r25
	.word 0xbbe5e083  ! 1352: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e4e0cc  ! 1353: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe56092  ! 1354: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e42194  ! 1355: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e421e2  ! 1356: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1359: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe56119  ! 1362: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5e1a6  ! 1363: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a04b  ! 1364: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_2, %g1, %r23
	.word 0xb5e560e6  ! 1367: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7504000  ! 1368: RDPR_TNPC	<illegal instruction>
	.word 0x8795a158  ! 1375: WRPR_TT_I	wrpr	%r22, 0x0158, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e461f0  ! 1382: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde421ac  ! 1384: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8795e15f  ! 1386: WRPR_TT_I	wrpr	%r23, 0x015f, %tt
	.word 0xb13de001  ! 1391: SRA_I	sra 	%r23, 0x0001, %r24
	.word 0xb3344000  ! 1392: SRL_R	srl 	%r17, %r0, %r25
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0e9  ! 1398: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a00b  ! 1399: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e4a069  ! 1400: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4e00a  ! 1401: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a1e0  ! 1402: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5a02a  ! 1403: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4610a  ! 1404: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e56157  ! 1405: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_6, %g1, %r19
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a11e  ! 1409: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 1413: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5e5a0d9  ! 1415: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e4e17d  ! 1416: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe56103  ! 1418: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87946169  ! 1423: WRPR_TT_I	wrpr	%r17, 0x0169, %tt
	.word 0xbbe4e0b5  ! 1424: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x9195206e  ! 1426: WRPR_PIL_I	wrpr	%r20, 0x006e, %pil
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e46058  ! 1430: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e4e1cd  ! 1433: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x819460d1  ! 1435: WRPR_TPC_I	wrpr	%r17, 0x00d1, %tpc
	.word 0xb1e52073  ! 1436: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d942041  ! 1437: WRPR_PSTATE_I	wrpr	%r16, 0x0041, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d4b  ! 1438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4b, %hpstate
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 1440: RDPR_TNPC	<illegal instruction>
	.word 0xb3520000  ! 1442: RDPR_PIL	<illegal instruction>
	.word 0xbbe420ba  ! 1443: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd51c000  ! 1446: RDPR_TL	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xbfe4e0e9  ! 1448: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a095  ! 1449: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8794e1cb  ! 1450: WRPR_TT_I	wrpr	%r19, 0x01cb, %tt
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 1452: RDPR_TT	<illegal instruction>
	.word 0xbfe52175  ! 1454: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8c58000  ! 1460: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xba35c000  ! 1462: ORN_R	orn 	%r23, %r0, %r29
	.word 0xb1e5a05b  ! 1463: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb49da195  ! 1465: XORcc_I	xorcc 	%r22, 0x0195, %r26
	.word 0xb1e4e1df  ! 1467: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1504000  ! 1469: RDPR_TNPC	<illegal instruction>
	.word 0xb1e46038  ! 1470: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x879461a8  ! 1474: WRPR_TT_I	wrpr	%r17, 0x01a8, %tt
	.word 0xb5520000  ! 1478: RDPR_PIL	<illegal instruction>
	.word 0xb7504000  ! 1480: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 1482: RDPR_TPC	<illegal instruction>
	.word 0xba84e090  ! 1485: ADDcc_I	addcc 	%r19, 0x0090, %r29
	.word 0xb9e5a150  ! 1486: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb8148000  ! 1488: OR_R	or 	%r18, %r0, %r28
	.word 0xb3e421b8  ! 1493: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb4c42119  ! 1494: ADDCcc_I	addccc 	%r16, 0x0119, %r26
	.word 0xb3e52187  ! 1495: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e46178  ! 1496: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5a053  ! 1497: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e42186  ! 1498: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4e068  ! 1505: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb551c000  ! 1507: RDPR_TL	<illegal instruction>
	.word 0xb7e46047  ! 1515: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560d7  ! 1519: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5a076  ! 1522: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e42123  ! 1524: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x30227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 1533: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x9194a0b9  ! 1534: WRPR_PIL_I	wrpr	%r18, 0x00b9, %pil
	setx	0x13e, %g1, %o0
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
	.word 0xbfe5e0b0  ! 1538: SAVE_I	save	%r23, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 1540: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe5a11f  ! 1541: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe56137  ! 1542: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe521de  ! 1549: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe46081  ! 1554: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8194a05b  ! 1558: WRPR_TPC_I	wrpr	%r18, 0x005b, %tpc
	.word 0xbabd21cd  ! 1563: XNORcc_I	xnorcc 	%r20, 0x01cd, %r29
	.word 0xb1510000  ! 1565: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xbbe46172  ! 1568: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4b4e1dd  ! 1581: ORNcc_I	orncc 	%r19, 0x01dd, %r26
	.word 0xbfe421ad  ! 1582: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4a0c4  ! 1583: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe4e04e  ! 1585: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5e1ce  ! 1586: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e42045  ! 1591: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e016  ! 1593: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8795e11b  ! 1598: WRPR_TT_I	wrpr	%r23, 0x011b, %tt
	.word 0xb3e561fa  ! 1603: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_1, %g1, %r17
	.word 0xb3e4e03e  ! 1606: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb750c000  ! 1607: RDPR_TT	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 1611: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe520c9  ! 1613: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe460c3  ! 1618: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e141  ! 1622: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb42c2099  ! 1627: ANDN_I	andn 	%r16, 0x0099, %r26
	.word 0x91946120  ! 1628: WRPR_PIL_I	wrpr	%r17, 0x0120, %pil
	.word 0xba94613c  ! 1629: ORcc_I	orcc 	%r17, 0x013c, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 1631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	.word 0xb0bd8000  ! 1633: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xbbe5e0a4  ! 1637: SAVE_I	save	%r23, 0x0001, %r29
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942196  ! 1645: WRPR_PSTATE_I	wrpr	%r16, 0x0196, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d83  ! 1650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d83, %hpstate
	setx	data_start_5, %g1, %r16
	.word 0xbb510000  ! 1653: RDPR_TICK	<illegal instruction>
	setx	data_start_6, %g1, %r18
	.word 0xb93d6001  ! 1656: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xb23420f0  ! 1658: ORN_I	orn 	%r16, 0x00f0, %r25
	.word 0xb0350000  ! 1660: SUBC_R	orn 	%r20, %r0, %r24
	.word 0xb5500000  ! 1665: RDPR_TPC	<illegal instruction>
	setx	0x10332, %g1, %o0
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
	mov	2, %r14
	.word 0xa193a000  ! 1672: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4614b  ! 1674: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb351c000  ! 1676: RDPR_TL	<illegal instruction>
	.word 0xb9e4202d  ! 1677: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983e41  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e41, %hpstate
	.word 0xb5e461e6  ! 1681: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x859561f5  ! 1682: WRPR_TSTATE_I	wrpr	%r21, 0x01f5, %tstate
	.word 0xbde4a0ba  ! 1685: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde52131  ! 1689: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbeb42168  ! 1691: SUBCcc_I	orncc 	%r16, 0x0168, %r31
	.word 0xb1e4e1ec  ! 1695: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e4a0ef  ! 1698: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde561c8  ! 1702: SAVE_I	save	%r21, 0x0001, %r30
	setx	data_start_2, %g1, %r20
	.word 0xb5500000  ! 1710: RDPR_TPC	<illegal instruction>
	.word 0xbde4e162  ! 1711: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5610a  ! 1716: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4204f  ! 1722: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e4202d  ! 1723: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e42139  ! 1726: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e56129  ! 1727: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb2bd60bc  ! 1728: XNORcc_I	xnorcc 	%r21, 0x00bc, %r25
	.word 0xbfe5e063  ! 1731: SAVE_I	save	%r23, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 1734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde46157  ! 1735: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8995e09d  ! 1736: WRPR_TICK_I	wrpr	%r23, 0x009d, %tick
	.word 0xbde4a0df  ! 1739: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe420d8  ! 1740: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e56038  ! 1741: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe561e8  ! 1749: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a17a  ! 1751: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1cd  ! 1752: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4a1ca  ! 1754: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4e14d  ! 1755: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe42041  ! 1756: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1760: RDPR_TICK	<illegal instruction>
	.word 0xb234e002  ! 1761: SUBC_I	orn 	%r19, 0x0002, %r25
	.word 0xbde5219d  ! 1765: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde5a05f  ! 1766: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4a0c2  ! 1767: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e561f7  ! 1771: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1775: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a116  ! 1779: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e017  ! 1783: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5a09b  ! 1785: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561d1  ! 1788: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbe9d6015  ! 1789: XORcc_I	xorcc 	%r21, 0x0015, %r31
	.word 0xb5e560d2  ! 1791: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8d94e0dd  ! 1793: WRPR_PSTATE_I	wrpr	%r19, 0x00dd, %pstate
	.word 0xb5e420d8  ! 1795: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4e0eb  ! 1796: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5602c  ! 1798: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e56171  ! 1801: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8140000  ! 1807: OR_R	or 	%r16, %r0, %r28
	.word 0xb5e52179  ! 1809: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983f59  ! 1810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f59, %hpstate
	.word 0xb950c000  ! 1814: RDPR_TT	<illegal instruction>
	.word 0xb3e4a027  ! 1815: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5a0ff  ! 1817: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x30028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63d8000  ! 1821: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xbfe4e079  ! 1825: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4e0ee  ! 1831: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_7, %g1, %r23
	.word 0xb5520000  ! 1837: RDPR_PIL	<illegal instruction>
	.word 0xb5e561d3  ! 1838: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x1033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e19d  ! 1840: WRPR_PIL_I	wrpr	%r19, 0x019d, %pil
	.word 0xb7e5e134  ! 1844: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5e1e0  ! 1848: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4e0f8  ! 1854: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4e0d8  ! 1856: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4a146  ! 1857: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4e1e3  ! 1858: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3508000  ! 1861: RDPR_TSTATE	<illegal instruction>
	.word 0xb01c0000  ! 1863: XOR_R	xor 	%r16, %r0, %r24
	.word 0xb32d5000  ! 1864: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xbde56192  ! 1865: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe560d4  ! 1868: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf518000  ! 1870: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5204e  ! 1871: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5219e  ! 1879: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x839520da  ! 1881: WRPR_TNPC_I	wrpr	%r20, 0x00da, %tnpc
	.word 0xb1504000  ! 1883: RDPR_TNPC	<illegal instruction>
	.word 0x8195a1c6  ! 1886: WRPR_TPC_I	wrpr	%r22, 0x01c6, %tpc
	.word 0xb62c2096  ! 1887: ANDN_I	andn 	%r16, 0x0096, %r27
	.word 0xb3e5a0e2  ! 1891: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e5a14e  ! 1901: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5504000  ! 1902: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 1906: RDPR_TT	<illegal instruction>
	.word 0xb7e4615b  ! 1907: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8995a1b2  ! 1908: WRPR_TICK_I	wrpr	%r22, 0x01b2, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1909: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde52186  ! 1911: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e52054  ! 1916: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e5a1e0  ! 1917: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb20c4000  ! 1918: AND_R	and 	%r17, %r0, %r25
	.word 0xb7e4e0b5  ! 1919: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e42024  ! 1931: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd504000  ! 1937: RDPR_TNPC	<illegal instruction>
	.word 0xbbe521b2  ! 1939: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1ac  ! 1944: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e520d7  ! 1950: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1500000  ! 1952: RDPR_TPC	<illegal instruction>
	.word 0xb1e561d4  ! 1953: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8994a007  ! 1955: WRPR_TICK_I	wrpr	%r18, 0x0007, %tick
	.word 0xb5e4219b  ! 1958: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982819  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0819, %hpstate
	.word 0xb7e5e1bc  ! 1963: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5e05e  ! 1965: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9195219d  ! 1966: WRPR_PIL_I	wrpr	%r20, 0x019d, %pil
	.word 0xbde5e082  ! 1973: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe4607e  ! 1974: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e421ef  ! 1979: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02c21d6  ! 1981: ANDN_I	andn 	%r16, 0x01d6, %r24
	.word 0xb3e4a05e  ! 1985: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e5e107  ! 1987: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4e031  ! 1988: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e42063  ! 1991: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5a01e  ! 1995: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 2000: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e42085  ! 2002: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0ca  ! 2007: WRPR_PSTATE_I	wrpr	%r18, 0x00ca, %pstate
	.word 0x8394206f  ! 2009: WRPR_TNPC_I	wrpr	%r16, 0x006f, %tnpc
	.word 0xbd510000  ! 2011: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2014: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 2020: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e46073  ! 2022: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde421b4  ! 2023: SAVE_I	save	%r16, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2027: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8444000  ! 2028: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xb1510000  ! 2029: RDPR_TICK	<illegal instruction>
	.word 0xb13d5000  ! 2030: SRAX_R	srax	%r21, %r0, %r24
	.word 0xbfe4e056  ! 2031: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4e04c  ! 2033: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e42164  ! 2034: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x81952117  ! 2036: WRPR_TPC_I	wrpr	%r20, 0x0117, %tpc
	setx	data_start_2, %g1, %r20
	.word 0xb1e5e0af  ! 2052: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e124  ! 2058: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd480000  ! 2059: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb5e5a08b  ! 2061: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a0b3  ! 2062: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde520ab  ! 2063: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e56142  ! 2064: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba35c000  ! 2066: ORN_R	orn 	%r23, %r0, %r29
	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a18a  ! 2072: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3518000  ! 2077: RDPR_PSTATE	<illegal instruction>
	.word 0xbde560f6  ! 2078: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe46146  ! 2079: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5a0dd  ! 2081: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd480000  ! 2084: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe4461f5  ! 2085: ADDC_I	addc 	%r17, 0x01f5, %r31
	.word 0xb3e5605c  ! 2088: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x839520b0  ! 2089: WRPR_TNPC_I	wrpr	%r20, 0x00b0, %tnpc
	.word 0xbfe46186  ! 2099: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb540000  ! 2100: RDPR_GL	<illegal instruction>
	.word 0xb950c000  ! 2101: RDPR_TT	<illegal instruction>
	.word 0xbbe5606d  ! 2103: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe561e9  ! 2104: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4e1f0  ! 2106: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb02c8000  ! 2107: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xbb2cf001  ! 2109: SLLX_I	sllx	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 2114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xb0b5610c  ! 2115: SUBCcc_I	orncc 	%r21, 0x010c, %r24
	.word 0xb3480000  ! 2116: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3e56174  ! 2117: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5a1e6  ! 2122: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e118  ! 2128: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1480000  ! 2129: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x2033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc05e10c  ! 2132: ADD_I	add 	%r23, 0x010c, %r30
	.word 0xb9e5e1b9  ! 2137: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 2144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819421d9  ! 2147: WRPR_TPC_I	wrpr	%r16, 0x01d9, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 2148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xb5504000  ! 2149: RDPR_TNPC	<illegal instruction>
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e46107  ! 2158: SAVE_I	save	%r17, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 2161: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a0c7  ! 2162: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x10, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946150  ! 2166: WRPR_TSTATE_I	wrpr	%r17, 0x0150, %tstate
	.word 0xb9e56039  ! 2168: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e421c0  ! 2171: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1500000  ! 2174: RDPR_TPC	<illegal instruction>
	.word 0xbde4207b  ! 2181: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x9194e01d  ! 2182: WRPR_PIL_I	wrpr	%r19, 0x001d, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 2183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	.word 0xbde5608a  ! 2184: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e420a1  ! 2192: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5a1a8  ! 2193: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4a025  ! 2196: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb21de01d  ! 2197: XOR_I	xor 	%r23, 0x001d, %r25
	.word 0xbbe5e08d  ! 2199: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4a19c  ! 2201: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2203: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 2205: RDPR_TPC	<illegal instruction>
	.word 0xb7e4a1d4  ! 2208: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1d0  ! 2211: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbea561bf  ! 2214: SUBcc_I	subcc 	%r21, 0x01bf, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xbfe520f4  ! 2217: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8594e081  ! 2222: WRPR_TSTATE_I	wrpr	%r19, 0x0081, %tstate
	.word 0xb1e42053  ! 2224: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8995a0db  ! 2228: WRPR_TICK_I	wrpr	%r22, 0x00db, %tick
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e13c  ! 2230: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 2233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0xb1e5e1bc  ! 2235: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7508000  ! 2240: RDPR_TSTATE	<illegal instruction>
	.word 0x9195a07d  ! 2241: WRPR_PIL_I	wrpr	%r22, 0x007d, %pil
	.word 0xb9480000  ! 2242: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 2244: RDPR_PIL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2251: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e46072  ! 2252: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e460ea  ! 2256: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9520000  ! 2259: RDPR_PIL	<illegal instruction>
	.word 0xb1e420aa  ! 2265: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 2266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xb1480000  ! 2268: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb2adc000  ! 2269: ANDNcc_R	andncc 	%r23, %r0, %r25
	.word 0xbd520000  ! 2270: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 2271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0xbde52081  ! 2273: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbb51c000  ! 2275: RDPR_TL	<illegal instruction>
	.word 0xb9e4a08f  ! 2276: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d956105  ! 2279: WRPR_PSTATE_I	wrpr	%r21, 0x0105, %pstate
	.word 0xb3643801  ! 2280: MOVcc_I	<illegal instruction>
	.word 0xb5e5a072  ! 2281: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x1033c, %g1, %o0
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
	.word 0x81982ad3  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad3, %hpstate
	.word 0x8795604c  ! 2287: WRPR_TT_I	wrpr	%r21, 0x004c, %tt
	.word 0xba358000  ! 2288: ORN_R	orn 	%r22, %r0, %r29
	.word 0xb3e521b2  ! 2289: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e4e05b  ! 2290: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0xbaa40000  ! 2301: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xb3510000  ! 2305: RDPR_TICK	<illegal instruction>
	.word 0xbbe4202e  ! 2313: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb951c000  ! 2321: RDPR_TL	<illegal instruction>
	.word 0xbfe4a01b  ! 2323: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4a048  ! 2325: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a0dd  ! 2333: ORNcc_I	orncc 	%r18, 0x00dd, %r27
	.word 0xb7e46165  ! 2334: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1c3  ! 2343: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e1f5  ! 2346: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0c0  ! 2348: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e42095  ! 2351: SAVE_I	save	%r16, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 2352: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1031d, %g1, %o0
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
	.word 0x819421fe  ! 2357: WRPR_TPC_I	wrpr	%r16, 0x01fe, %tpc
	.word 0xb9e460ea  ! 2358: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4e18e  ! 2359: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5e11b  ! 2360: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5e0db  ! 2362: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4a057  ! 2365: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4203a  ! 2367: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8595206a  ! 2368: WRPR_TSTATE_I	wrpr	%r20, 0x006a, %tstate
	.word 0xb1e5605f  ! 2369: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4a075  ! 2370: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7500000  ! 2372: RDPR_TPC	<illegal instruction>
	.word 0x8395e0fd  ! 2373: WRPR_TNPC_I	wrpr	%r23, 0x00fd, %tnpc
	.word 0xb7e561ed  ! 2375: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb12de001  ! 2377: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xb92dd000  ! 2378: SLLX_R	sllx	%r23, %r0, %r28
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd348000  ! 2386: SRL_R	srl 	%r18, %r0, %r30
	.word 0xbd504000  ! 2387: RDPR_TNPC	<illegal instruction>
	.word 0xb43cc000  ! 2388: XNOR_R	xnor 	%r19, %r0, %r26
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e46099  ! 2393: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb2c9000  ! 2401: SLLX_R	sllx	%r18, %r0, %r29
	.word 0xbfe56128  ! 2402: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5a1e8  ! 2404: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbc0c8000  ! 2406: AND_R	and 	%r18, %r0, %r30
	.word 0xbde46055  ! 2407: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5e0aa  ! 2408: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5a1e0  ! 2409: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_6, %g1, %r18
	.word 0x8995e19d  ! 2415: WRPR_TICK_I	wrpr	%r23, 0x019d, %tick
	.word 0x879420a3  ! 2417: WRPR_TT_I	wrpr	%r16, 0x00a3, %tt
	.word 0xb89d21a1  ! 2419: XORcc_I	xorcc 	%r20, 0x01a1, %r28
	.word 0xb7e5a03f  ! 2422: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52014  ! 2424: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2428: RDPR_TL	<illegal instruction>
	.word 0xbd504000  ! 2429: RDPR_TNPC	<illegal instruction>
	.word 0xbbe560e7  ! 2430: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xb8b4c000  ! 2439: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xb5e4219e  ! 2440: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e46146  ! 2442: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7510000  ! 2447: RDPR_TICK	<illegal instruction>
	.word 0xbb2cf001  ! 2449: SLLX_I	sllx	%r19, 0x0001, %r29
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4200c  ! 2453: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde42020  ! 2456: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1d1  ! 2463: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb094e19a  ! 2464: ORcc_I	orcc 	%r19, 0x019a, %r24
	.word 0xbde56062  ! 2465: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe5a1ca  ! 2467: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde5a0a4  ! 2468: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3504000  ! 2472: RDPR_TNPC	<illegal instruction>
	.word 0xb5e56013  ! 2473: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8595216b  ! 2477: WRPR_TSTATE_I	wrpr	%r20, 0x016b, %tstate
	.word 0xbde4a07c  ! 2479: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e420dd  ! 2480: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d946017  ! 2487: WRPR_PSTATE_I	wrpr	%r17, 0x0017, %pstate
	.word 0xb3e56172  ! 2488: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbd350000  ! 2490: SRL_R	srl 	%r20, %r0, %r30
	.word 0xb435a188  ! 2491: SUBC_I	orn 	%r22, 0x0188, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb01d0000  ! 2494: XOR_R	xor 	%r20, %r0, %r24
	.word 0xb2a54000  ! 2495: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xbfe4a0cc  ! 2503: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e42112  ! 2504: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56197  ! 2512: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e560a6  ! 2518: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5a1eb  ! 2519: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4e1b4  ! 2521: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a172  ! 2524: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4a1cb  ! 2525: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521d6  ! 2528: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb4a4e0e4  ! 2530: SUBcc_I	subcc 	%r19, 0x00e4, %r26
	.word 0xbbe4e1ab  ! 2531: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e10d  ! 2540: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e420f2  ! 2545: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb02ca1fe  ! 2548: ANDN_I	andn 	%r18, 0x01fe, %r24
	.word 0xbd508000  ! 2551: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5e145  ! 2557: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbc252129  ! 2560: SUB_I	sub 	%r20, 0x0129, %r30
	.word 0xb21d4000  ! 2561: XOR_R	xor 	%r21, %r0, %r25
	.word 0xbbe52016  ! 2567: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb150c000  ! 2569: RDPR_TT	<illegal instruction>
	.word 0xbfe521bf  ! 2570: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb92de001  ! 2572: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0xbbe46148  ! 2580: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5a1fb  ! 2583: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e521b2  ! 2584: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46001  ! 2591: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5e13a  ! 2593: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5211d  ! 2601: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4613f  ! 2603: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x87952183  ! 2604: WRPR_TT_I	wrpr	%r20, 0x0183, %tt
	.word 0xbfe5a0ce  ! 2605: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 2607: RDPR_TICK	<illegal instruction>
	.word 0x8195e104  ! 2609: WRPR_TPC_I	wrpr	%r23, 0x0104, %tpc
	.word 0x8995a0e5  ! 2611: WRPR_TICK_I	wrpr	%r22, 0x00e5, %tick
	.word 0x8594e028  ! 2614: WRPR_TSTATE_I	wrpr	%r19, 0x0028, %tstate
	.word 0x8195e031  ! 2617: WRPR_TPC_I	wrpr	%r23, 0x0031, %tpc
	.word 0xb5e5a102  ! 2620: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5e1d8  ! 2625: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e52036  ! 2627: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3540000  ! 2629: RDPR_GL	<illegal instruction>
	.word 0xb1e5e01c  ! 2630: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x819561ec  ! 2631: WRPR_TPC_I	wrpr	%r21, 0x01ec, %tpc
	.word 0xb9e460e0  ! 2632: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56130  ! 2636: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde521df  ! 2640: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x9194e048  ! 2642: WRPR_PIL_I	wrpr	%r19, 0x0048, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982ed3  ! 2643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed3, %hpstate
	.word 0x87956030  ! 2644: WRPR_TT_I	wrpr	%r21, 0x0030, %tt
	.word 0xb405a149  ! 2646: ADD_I	add 	%r22, 0x0149, %r26
	mov	0, %r14
	.word 0xa193a000  ! 2648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e5e080  ! 2650: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb7ce401  ! 2654: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xb1e52120  ! 2658: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_7, %g1, %r17
	.word 0xb5e520eb  ! 2661: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3510000  ! 2662: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xbbe5a0e7  ! 2665: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3510000  ! 2667: RDPR_TICK	<illegal instruction>
	.word 0xb5e461c7  ! 2668: SAVE_I	save	%r17, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 2669: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5209d  ! 2670: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4a150  ! 2672: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf508000  ! 2673: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5e174  ! 2674: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9540000  ! 2675: RDPR_GL	<illegal instruction>
	.word 0x8795a1b9  ! 2676: WRPR_TT_I	wrpr	%r22, 0x01b9, %tt
	.word 0xb7e4a044  ! 2679: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e52001  ! 2682: SAVE_I	save	%r20, 0x0001, %r25
	mov	1, %r14
	.word 0xa193a000  ! 2683: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5e03f  ! 2686: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe56089  ! 2688: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb8ac8000  ! 2689: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xb7e421e3  ! 2690: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982ac9  ! 2693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0xb7518000  ! 2694: RDPR_PSTATE	<illegal instruction>
	.word 0x859420d0  ! 2695: WRPR_TSTATE_I	wrpr	%r16, 0x00d0, %tstate
	.word 0xb751c000  ! 2697: RDPR_TL	<illegal instruction>
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 2699: RDPR_GL	<illegal instruction>
	.word 0xbfe5e147  ! 2700: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3500000  ! 2702: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e560d7  ! 2704: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x9194e016  ! 2706: WRPR_PIL_I	wrpr	%r19, 0x0016, %pil
	.word 0xb5e46075  ! 2709: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x10218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d49  ! 2711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	setx	data_start_6, %g1, %r19
	.word 0xbfe56096  ! 2713: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4e004  ! 2717: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1508000  ! 2721: RDPR_TSTATE	<illegal instruction>
	.word 0x8594219e  ! 2723: WRPR_TSTATE_I	wrpr	%r16, 0x019e, %tstate
	.word 0xbde4e16d  ! 2726: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe5a094  ! 2731: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8995a16e  ! 2732: WRPR_TICK_I	wrpr	%r22, 0x016e, %tick
	.word 0x8195e0d9  ! 2733: WRPR_TPC_I	wrpr	%r23, 0x00d9, %tpc
	.word 0xb52de001  ! 2736: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xbf540000  ! 2737: RDPR_GL	<illegal instruction>
	.word 0xb3e5e1a0  ! 2739: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4211f  ! 2743: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2751: RDPR_TL	<illegal instruction>
	.word 0xbd510000  ! 2754: RDPR_TICK	<illegal instruction>
	setx	0x10302, %g1, %o0
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
	.word 0xb4954000  ! 2760: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0xb751c000  ! 2761: RDPR_TL	<illegal instruction>
	.word 0xb3e4614b  ! 2764: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e521dd  ! 2766: SAVE_I	save	%r20, 0x0001, %r26
	setx	data_start_4, %g1, %r19
	.word 0xba35209f  ! 2768: ORN_I	orn 	%r20, 0x009f, %r29
	.word 0xb7e4e107  ! 2769: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe42186  ! 2770: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9480000  ! 2773: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52016  ! 2776: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e521e8  ! 2777: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a063  ! 2785: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9510000  ! 2788: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0xb9510000  ! 2792: RDPR_TICK	<illegal instruction>
	.word 0xbde460fe  ! 2794: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5e1f2  ! 2796: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5a0a8  ! 2800: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xba04e030  ! 2801: ADD_I	add 	%r19, 0x0030, %r29
	.word 0xbfe46108  ! 2802: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e52037  ! 2805: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e561fd  ! 2807: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5217e  ! 2808: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8794a0f3  ! 2814: WRPR_TT_I	wrpr	%r18, 0x00f3, %tt
	.word 0x899520af  ! 2815: WRPR_TICK_I	wrpr	%r20, 0x00af, %tick
	setx	data_start_0, %g1, %r23
	.word 0xb5e420e8  ! 2825: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb09d61f9  ! 2827: XORcc_I	xorcc 	%r21, 0x01f9, %r24
	.word 0xbbe4e022  ! 2830: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x91952023  ! 2835: WRPR_PIL_I	wrpr	%r20, 0x0023, %pil
	.word 0xbbe56103  ! 2836: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4209b  ! 2847: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8995a18c  ! 2852: WRPR_TICK_I	wrpr	%r22, 0x018c, %tick
	.word 0xb3e46078  ! 2860: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5a133  ! 2861: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb035e1cc  ! 2863: ORN_I	orn 	%r23, 0x01cc, %r24
	mov	1, %r14
	.word 0xa193a000  ! 2868: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4e133  ! 2869: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf540000  ! 2872: RDPR_GL	<illegal instruction>
	.word 0xbf518000  ! 2875: RDPR_PSTATE	<illegal instruction>
	.word 0xb7643801  ! 2881: MOVcc_I	<illegal instruction>
	.word 0xbde52108  ! 2883: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde420f3  ! 2888: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5a009  ! 2889: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb6ada061  ! 2894: ANDNcc_I	andncc 	%r22, 0x0061, %r27
	.word 0xb1510000  ! 2895: RDPR_TICK	<illegal instruction>
	.word 0xb9e46076  ! 2896: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd7c8400  ! 2899: MOVR_R	movre	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983ac1  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac1, %hpstate
	.word 0xbbe4e132  ! 2904: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb6c5218d  ! 2907: ADDCcc_I	addccc 	%r20, 0x018d, %r27
	.word 0xb32c6001  ! 2908: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0x9194219b  ! 2909: WRPR_PIL_I	wrpr	%r16, 0x019b, %pil
	.word 0xbbe5a03a  ! 2911: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde5e063  ! 2912: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5a0f3  ! 2915: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e5e0ca  ! 2917: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4e1a6  ! 2919: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4a0a0  ! 2922: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5e1d4  ! 2924: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5e0ee  ! 2925: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421c7  ! 2932: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e42196  ! 2933: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e56020  ! 2934: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5a157  ! 2936: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e030  ! 2938: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e560b3  ! 2939: SAVE_I	save	%r21, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 2941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r12
	.word 0x8f932000  ! 2942: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe42163  ! 2943: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e520e2  ! 2944: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5e1f2  ! 2945: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5e02e  ! 2948: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e42138  ! 2949: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5e073  ! 2950: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5e133  ! 2951: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde42157  ! 2952: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4e06b  ! 2953: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba940000  ! 2954: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0xb7e520ad  ! 2956: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4a1c4  ! 2958: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r17
	.word 0xb2ac2129  ! 2964: ANDNcc_I	andncc 	%r16, 0x0129, %r25
	.word 0xb7e521a1  ! 2972: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1520000  ! 2974: RDPR_PIL	<illegal instruction>
	.word 0xb7e42009  ! 2975: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x3031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a15a  ! 2979: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2983: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4609c  ! 2989: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3518000  ! 2990: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a060  ! 2993: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb225615a  ! 2995: SUB_I	sub 	%r21, 0x015a, %r25
	.word 0xb62c215d  ! 2996: ANDN_I	andn 	%r16, 0x015d, %r27
	.word 0xbf504000  ! 2999: RDPR_TNPC	<illegal instruction>
	.word 0x9194614d  ! 3000: WRPR_PIL_I	wrpr	%r17, 0x014d, %pil
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e421d4  ! 3004: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb0bd8000  ! 3005: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0x8194e0f0  ! 3014: WRPR_TPC_I	wrpr	%r19, 0x00f0, %tpc
	.word 0xb8c560a4  ! 3018: ADDCcc_I	addccc 	%r21, 0x00a4, %r28
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 3023: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4e129  ! 3024: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x859561fc  ! 3030: WRPR_TSTATE_I	wrpr	%r21, 0x01fc, %tstate
	.word 0x89942106  ! 3032: WRPR_TICK_I	wrpr	%r16, 0x0106, %tick
	.word 0x81942061  ! 3034: WRPR_TPC_I	wrpr	%r16, 0x0061, %tpc
	.word 0xbde4a13d  ! 3037: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe46186  ! 3041: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e521e9  ! 3042: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_5, %g1, %r21
	.word 0xb9e5e137  ! 3047: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5a10c  ! 3048: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0acc000  ! 3050: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xbb540000  ! 3052: RDPR_GL	<illegal instruction>
	.word 0xb7e5615f  ! 3053: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x859561b3  ! 3054: WRPR_TSTATE_I	wrpr	%r21, 0x01b3, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cdb  ! 3055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cdb, %hpstate
	.word 0xbd3d9000  ! 3057: SRAX_R	srax	%r22, %r0, %r30
	.word 0xbbe52065  ! 3059: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8795a11c  ! 3061: WRPR_TT_I	wrpr	%r22, 0x011c, %tt
	.word 0xb5e42002  ! 3069: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4204e  ! 3072: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0f0  ! 3075: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a12a  ! 3084: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 3087: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4ac61a6  ! 3091: ANDNcc_I	andncc 	%r17, 0x01a6, %r26
	.word 0xb3e4a1d4  ! 3095: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4607c  ! 3096: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e56139  ! 3097: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_6, %g1, %r22
	.word 0xb1e4e012  ! 3101: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a1bd  ! 3102: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5a037  ! 3103: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbea56031  ! 3104: SUBcc_I	subcc 	%r21, 0x0031, %r31
	.word 0xb5e4e193  ! 3105: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 3110: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_2, %g1, %r19
	.word 0xb8c4c000  ! 3114: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xb82cc000  ! 3118: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xb3e52024  ! 3121: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8195211c  ! 3122: WRPR_TPC_I	wrpr	%r20, 0x011c, %tpc
	.word 0xb5e561d2  ! 3123: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 3128: RDPR_TL	<illegal instruction>
	.word 0xb351c000  ! 3135: RDPR_TL	<illegal instruction>
	.word 0xb3e5a1bf  ! 3137: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe420c3  ! 3138: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbc9d0000  ! 3140: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0x8195a032  ! 3142: WRPR_TPC_I	wrpr	%r22, 0x0032, %tpc
	.word 0xb2c50000  ! 3143: ADDCcc_R	addccc 	%r20, %r0, %r25
	.word 0xb951c000  ! 3145: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 3148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 3149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	setx	0x233, %g1, %o0
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
	.word 0xb3518000  ! 3153: RDPR_PSTATE	<illegal instruction>
	.word 0xb750c000  ! 3154: RDPR_TT	<illegal instruction>
	.word 0xbbe5a016  ! 3157: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf518000  ! 3158: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e520c3  ! 3160: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8194e196  ! 3162: WRPR_TPC_I	wrpr	%r19, 0x0196, %tpc
	.word 0xb60ca09e  ! 3163: AND_I	and 	%r18, 0x009e, %r27
	.word 0xbfe42103  ! 3164: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb950c000  ! 3165: RDPR_TT	<illegal instruction>
	.word 0xbfe420d4  ! 3166: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5e090  ! 3168: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8595e1c7  ! 3169: WRPR_TSTATE_I	wrpr	%r23, 0x01c7, %tstate
	.word 0xb1e460f8  ! 3172: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4a0ad  ! 3176: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421df  ! 3179: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe521a9  ! 3180: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4616d  ! 3183: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5508000  ! 3184: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4a061  ! 3185: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7520000  ! 3186: RDPR_PIL	<illegal instruction>
	.word 0xb12dd000  ! 3187: SLLX_R	sllx	%r23, %r0, %r24
	.word 0xb1e5e0d2  ! 3189: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9520000  ! 3191: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r20
	.word 0xbde4610e  ! 3195: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe520ea  ! 3196: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf510000  ! 3200: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982809  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0809, %hpstate
	.word 0xbc45612f  ! 3203: ADDC_I	addc 	%r21, 0x012f, %r30
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a016  ! 3209: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8195e1df  ! 3211: WRPR_TPC_I	wrpr	%r23, 0x01df, %tpc
	.word 0xbbe4e151  ! 3213: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5a085  ! 3217: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf51c000  ! 3219: RDPR_TL	<illegal instruction>
	.word 0xb9e42048  ! 3222: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e4614c  ! 3223: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e421ed  ! 3225: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5613b  ! 3228: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4214c  ! 3235: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e5e081  ! 3236: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 3238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e05c  ! 3243: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4e096  ! 3244: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e560c2  ! 3246: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe520aa  ! 3247: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e46056  ! 3251: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x2001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460b2  ! 3257: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0fa  ! 3260: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x859421a6  ! 3261: WRPR_TSTATE_I	wrpr	%r16, 0x01a6, %tstate
	.word 0x9194a0ae  ! 3263: WRPR_PIL_I	wrpr	%r18, 0x00ae, %pil
	.word 0xbd540000  ! 3264: RDPR_GL	<illegal instruction>
	.word 0xb0342052  ! 3266: ORN_I	orn 	%r16, 0x0052, %r24
	.word 0xb5e4a19c  ! 3267: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb33c7001  ! 3270: SRAX_I	srax	%r17, 0x0001, %r25
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xb22de1a9  ! 3284: ANDN_I	andn 	%r23, 0x01a9, %r25
	.word 0xbbe52167  ! 3285: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_4, %g1, %r18
	.word 0x879560dc  ! 3287: WRPR_TT_I	wrpr	%r21, 0x00dc, %tt
	.word 0xb9e56151  ! 3288: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a14b  ! 3290: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb500000  ! 3292: RDPR_TPC	<illegal instruction>
	.word 0xb3e461ac  ! 3294: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe420d5  ! 3295: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3508000  ! 3296: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe561c2  ! 3302: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7504000  ! 3311: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a1c8  ! 3314: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde560e1  ! 3317: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e56095  ! 3326: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb510000  ! 3327: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r18
	.word 0x81942059  ! 3336: WRPR_TPC_I	wrpr	%r16, 0x0059, %tpc
	setx	data_start_3, %g1, %r19
	.word 0xb83d216e  ! 3343: XNOR_I	xnor 	%r20, 0x016e, %r28
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 3346: RDPR_TPC	<illegal instruction>
	.word 0xb9e5a1a4  ! 3347: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb8b4a0c4  ! 3350: ORNcc_I	orncc 	%r18, 0x00c4, %r28
	.word 0xb1e4604f  ! 3351: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde46163  ! 3354: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_0, %g1, %r22
	.word 0xb3e5a0ac  ! 3361: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5e1d0  ! 3362: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe42009  ! 3363: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe56028  ! 3365: SAVE_I	save	%r21, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 3366: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e5a03a  ! 3367: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e46053  ! 3368: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4e193  ! 3371: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5a0f7  ! 3374: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1508000  ! 3375: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe46027  ! 3378: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8794a113  ! 3380: WRPR_TT_I	wrpr	%r18, 0x0113, %tt
	.word 0xbfe42115  ! 3382: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5a0e6  ! 3383: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e420d1  ! 3384: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4a0ac  ! 3386: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3641800  ! 3391: MOVcc_R	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3392: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95a157  ! 3393: WRPR_PSTATE_I	wrpr	%r22, 0x0157, %pstate
	.word 0x83956044  ! 3400: WRPR_TNPC_I	wrpr	%r21, 0x0044, %tnpc
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52011  ! 3410: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a082  ! 3413: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5e12a  ! 3414: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5e09c  ! 3416: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5605e  ! 3418: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb2bc4000  ! 3421: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xbde4a135  ! 3423: SAVE_I	save	%r18, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 3424: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8395e0cc  ! 3427: WRPR_TNPC_I	wrpr	%r23, 0x00cc, %tnpc
	.word 0x8d9460c1  ! 3429: WRPR_PSTATE_I	wrpr	%r17, 0x00c1, %pstate
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 3431: RDPR_TNPC	<illegal instruction>
	.word 0xb5e4a1c9  ! 3432: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e14e  ! 3436: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf480000  ! 3439: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbbe4e1df  ! 3441: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e460d5  ! 3442: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbc1520c7  ! 3443: OR_I	or 	%r20, 0x00c7, %r30
	.word 0xb3520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xb7e4a1dd  ! 3447: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1c4  ! 3448: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e5e06d  ! 3449: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e1b9  ! 3453: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e5217f  ! 3457: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbe056006  ! 3461: ADD_I	add 	%r21, 0x0006, %r31
	.word 0xb7e5a074  ! 3462: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4a0dd  ! 3463: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a10f  ! 3466: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5a07c  ! 3467: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819460ae  ! 3469: WRPR_TPC_I	wrpr	%r17, 0x00ae, %tpc
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c3001  ! 3478: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xbbe52139  ! 3480: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb518000  ! 3484: RDPR_PSTATE	<illegal instruction>
	.word 0xbb510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xbfe520e5  ! 3489: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9510000  ! 3493: RDPR_TICK	<illegal instruction>
	.word 0xb3480000  ! 3495: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_0, %g1, %r22
	.word 0xb1e421ca  ! 3500: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e52107  ! 3506: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1520000  ! 3511: RDPR_PIL	<illegal instruction>
	.word 0xbde5a12e  ! 3512: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xba1d8000  ! 3513: XOR_R	xor 	%r22, %r0, %r29
	.word 0x91952087  ! 3514: WRPR_PIL_I	wrpr	%r20, 0x0087, %pil
	.word 0x919420bf  ! 3516: WRPR_PIL_I	wrpr	%r16, 0x00bf, %pil
	.word 0xb7e4a118  ! 3519: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4216a  ! 3520: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8595e10f  ! 3524: WRPR_TSTATE_I	wrpr	%r23, 0x010f, %tstate
	.word 0x919561ba  ! 3526: WRPR_PIL_I	wrpr	%r21, 0x01ba, %pil
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02c0000  ! 3528: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xb1e46171  ! 3530: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e52158  ! 3534: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4e0cc  ! 3538: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd480000  ! 3543: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1e4603a  ! 3546: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf500000  ! 3547: RDPR_TPC	<illegal instruction>
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde561d1  ! 3550: SAVE_I	save	%r21, 0x0001, %r30
	setx	data_start_4, %g1, %r22
	.word 0xb5e5a1be  ! 3559: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5e05a  ! 3561: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x33f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942076  ! 3563: WRPR_TT_I	wrpr	%r16, 0x0076, %tt
	.word 0xb494618e  ! 3567: ORcc_I	orcc 	%r17, 0x018e, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e52148  ! 3572: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5a148  ! 3575: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4a046  ! 3576: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4e0c4  ! 3579: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e460cb  ! 3581: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbc1d8000  ! 3585: XOR_R	xor 	%r22, %r0, %r30
	.word 0xb4b4a0c3  ! 3586: SUBCcc_I	orncc 	%r18, 0x00c3, %r26
	.word 0xbd352001  ! 3588: SRL_I	srl 	%r20, 0x0001, %r30
	setx	data_start_2, %g1, %r20
	.word 0xbfe4a063  ! 3594: SAVE_I	save	%r18, 0x0001, %r31
	setx	data_start_5, %g1, %r16
	.word 0xbca40000  ! 3600: SUBcc_R	subcc 	%r16, %r0, %r30
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56060  ! 3612: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e122  ! 3613: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f49  ! 3614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f49, %hpstate
	.word 0x8395e1c6  ! 3617: WRPR_TNPC_I	wrpr	%r23, 0x01c6, %tnpc
	.word 0x81946031  ! 3621: WRPR_TPC_I	wrpr	%r17, 0x0031, %tpc
	.word 0x8194a166  ! 3624: WRPR_TPC_I	wrpr	%r18, 0x0166, %tpc
	.word 0xb5e4204e  ! 3629: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e42107  ! 3632: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1f1  ! 3635: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb62c8000  ! 3638: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xbfe56136  ! 3640: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8595a14c  ! 3641: WRPR_TSTATE_I	wrpr	%r22, 0x014c, %tstate
	.word 0xbde52167  ! 3642: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x859520b6  ! 3643: WRPR_TSTATE_I	wrpr	%r20, 0x00b6, %tstate
	.word 0x8d942126  ! 3646: WRPR_PSTATE_I	wrpr	%r16, 0x0126, %pstate
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a025  ! 3649: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40c4000  ! 3653: AND_R	and 	%r17, %r0, %r26
	.word 0xbfe46186  ! 3658: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x89942106  ! 3659: WRPR_TICK_I	wrpr	%r16, 0x0106, %tick
	.word 0xb7e5207c  ! 3661: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5e18f  ! 3662: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e560b6  ! 3669: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4e18b  ! 3671: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5500000  ! 3674: RDPR_TPC	<illegal instruction>
	.word 0xb7e4e031  ! 3681: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a14c  ! 3683: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe56196  ! 3684: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4205e  ! 3686: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e520f5  ! 3688: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1508000  ! 3689: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe461eb  ! 3690: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde46158  ! 3691: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5a103  ! 3692: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e420f6  ! 3695: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d956070  ! 3699: WRPR_PSTATE_I	wrpr	%r21, 0x0070, %pstate
	.word 0xb7518000  ! 3712: RDPR_PSTATE	<illegal instruction>
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xbd500000  ! 3724: RDPR_TPC	<illegal instruction>
	.word 0xb5e46095  ! 3727: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b83  ! 3730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	.word 0xbfe420c6  ! 3731: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb835217c  ! 3733: SUBC_I	orn 	%r20, 0x017c, %r28
	.word 0xb9e4208a  ! 3735: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xba040000  ! 3736: ADD_R	add 	%r16, %r0, %r29
	.word 0xbde5a185  ! 3737: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5a070  ! 3741: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4e0c9  ! 3749: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r21
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 3752: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ac1  ! 3754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac1, %hpstate
	.word 0xb3e461e2  ! 3755: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4209e  ! 3756: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46091  ! 3760: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982b5b  ! 3762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	.word 0x859461a0  ! 3765: WRPR_TSTATE_I	wrpr	%r17, 0x01a0, %tstate
	.word 0xb5e461f1  ! 3770: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5206e  ! 3777: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe4e10a  ! 3778: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a0be  ! 3779: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4a0c9  ! 3781: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd480000  ! 3782: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe9cc000  ! 3787: XORcc_R	xorcc 	%r19, %r0, %r31
	.word 0x8195e012  ! 3788: WRPR_TPC_I	wrpr	%r23, 0x0012, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982edb  ! 3790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	.word 0xb2acc000  ! 3793: ANDNcc_R	andncc 	%r19, %r0, %r25
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe24c000  ! 3797: SUB_R	sub 	%r19, %r0, %r31
	.word 0xbfe4a0b9  ! 3798: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbb518000  ! 3804: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a0ea  ! 3806: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5e13a  ! 3808: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69421ea  ! 3815: ORcc_I	orcc 	%r16, 0x01ea, %r27
	.word 0xbd518000  ! 3818: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5a09e  ! 3822: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb4048000  ! 3823: ADD_R	add 	%r18, %r0, %r26
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	.word 0xb0a50000  ! 3830: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0xb3e52119  ! 3834: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb03d8000  ! 3835: XNOR_R	xnor 	%r22, %r0, %r24
	.word 0x8594e037  ! 3836: WRPR_TSTATE_I	wrpr	%r19, 0x0037, %tstate
	.word 0xbb50c000  ! 3837: RDPR_TT	<illegal instruction>
	.word 0xbfe5a1b0  ! 3845: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5614f  ! 3856: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a124  ! 3861: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e0f4  ! 3862: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3864: RDPR_PSTATE	<illegal instruction>
	.word 0xb3643801  ! 3866: MOVcc_I	<illegal instruction>
	.word 0xb3e4a190  ! 3870: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb500000  ! 3871: RDPR_TPC	<illegal instruction>
	.word 0xbde4202e  ! 3874: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5e04a  ! 3877: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d95a03a  ! 3886: WRPR_PSTATE_I	wrpr	%r22, 0x003a, %pstate
	.word 0xb2b4a1cd  ! 3887: ORNcc_I	orncc 	%r18, 0x01cd, %r25
	.word 0xb9e5e0c6  ! 3890: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3500000  ! 3891: RDPR_TPC	<illegal instruction>
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 3894: MOVcc_I	<illegal instruction>
	.word 0xb9e5a1ad  ! 3896: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbcbde010  ! 3899: XNORcc_I	xnorcc 	%r23, 0x0010, %r30
	.word 0xbf50c000  ! 3900: RDPR_TT	<illegal instruction>
	.word 0x8395612a  ! 3902: WRPR_TNPC_I	wrpr	%r21, 0x012a, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xbde5e03e  ! 3906: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb33d9000  ! 3907: SRAX_R	srax	%r22, %r0, %r25
	.word 0x8394a131  ! 3911: WRPR_TNPC_I	wrpr	%r18, 0x0131, %tnpc
	.word 0xbfe4a099  ! 3916: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe4a15c  ! 3918: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbf504000  ! 3920: RDPR_TNPC	<illegal instruction>
	.word 0xb3e5e0f4  ! 3922: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbf520000  ! 3924: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a1ec  ! 3927: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4a075  ! 3929: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8795a117  ! 3931: WRPR_TT_I	wrpr	%r22, 0x0117, %tt
	.word 0x9195e02e  ! 3932: WRPR_PIL_I	wrpr	%r23, 0x002e, %pil
	.word 0xbde521a0  ! 3933: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x91942150  ! 3934: WRPR_PIL_I	wrpr	%r16, 0x0150, %pil
	setx	data_start_2, %g1, %r18
	.word 0xb9e5e1ea  ! 3937: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb22c4000  ! 3939: ANDN_R	andn 	%r17, %r0, %r25
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42173  ! 3943: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x879421c2  ! 3944: WRPR_TT_I	wrpr	%r16, 0x01c2, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819839d9  ! 3946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d9, %hpstate
	.word 0xb3e421a6  ! 3948: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x879421f1  ! 3950: WRPR_TT_I	wrpr	%r16, 0x01f1, %tt
	.word 0xb7e5609a  ! 3953: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb504000  ! 3954: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4e141  ! 3956: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4a1a1  ! 3964: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 3966: MOVcc_R	<illegal instruction>
	.word 0x87942031  ! 3967: WRPR_TT_I	wrpr	%r16, 0x0031, %tt
	.word 0xb3e560a9  ! 3970: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982fc1  ! 3977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc1, %hpstate
	.word 0xb7e5e1f0  ! 3978: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8794a00d  ! 3979: WRPR_TT_I	wrpr	%r18, 0x000d, %tt
	.word 0xb5e461e2  ! 3980: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3500000  ! 3981: RDPR_TPC	<illegal instruction>
	setx	0x114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a10c  ! 3984: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xba358000  ! 3987: ORN_R	orn 	%r22, %r0, %r29
	.word 0xba240000  ! 3988: SUB_R	sub 	%r16, %r0, %r29
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4618f  ! 3991: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe421de  ! 3992: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbf504000  ! 3997: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4e0ad  ! 3998: SAVE_I	save	%r19, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 3999: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e56176  ! 4000: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe52167  ! 4001: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e4e139  ! 4003: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4a18c  ! 4006: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4200b  ! 4008: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4a174  ! 4009: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5603c  ! 4010: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb22d201e  ! 4015: ANDN_I	andn 	%r20, 0x001e, %r25
	.word 0xb97ce401  ! 4018: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xb3e4a08e  ! 4019: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e560b3  ! 4020: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4615d  ! 4021: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4212a  ! 4022: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb845c000  ! 4023: ADDC_R	addc 	%r23, %r0, %r28
	.word 0x8d95a199  ! 4025: WRPR_PSTATE_I	wrpr	%r22, 0x0199, %pstate
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859461f0  ! 4028: WRPR_TSTATE_I	wrpr	%r17, 0x01f0, %tstate
	.word 0xbbe5204c  ! 4038: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a05e  ! 4052: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4207d  ! 4058: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5a14b  ! 4059: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4602b  ! 4060: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1355000  ! 4067: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb7e461c1  ! 4068: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e561bb  ! 4069: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe42050  ! 4071: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8d95a012  ! 4072: WRPR_PSTATE_I	wrpr	%r22, 0x0012, %pstate
	setx	0x30229, %g1, %o0
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
	.word 0xb1e4e01d  ! 4078: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4a068  ! 4079: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4e084  ! 4082: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe560d7  ! 4083: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e460a7  ! 4086: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5e121  ! 4088: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e52199  ! 4092: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe461c9  ! 4093: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e460d1  ! 4097: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x9194614b  ! 4100: WRPR_PIL_I	wrpr	%r17, 0x014b, %pil
	.word 0xbbe5e118  ! 4102: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e42115  ! 4106: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5a1e0  ! 4108: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf520000  ! 4109: RDPR_PIL	<illegal instruction>
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd359000  ! 4112: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xb7e560ea  ! 4115: SAVE_I	save	%r21, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 4116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd508000  ! 4119: RDPR_TSTATE	<illegal instruction>
	.word 0xb2148000  ! 4120: OR_R	or 	%r18, %r0, %r25
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561bc  ! 4123: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e420b8  ! 4124: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982dd3  ! 4125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0xb3e5a1b3  ! 4127: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe42187  ! 4129: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe5612a  ! 4134: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe520b8  ! 4136: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919520c6  ! 4142: WRPR_PIL_I	wrpr	%r20, 0x00c6, %pil
	.word 0xbbe5e058  ! 4145: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 4147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4151: RDPR_TT	<illegal instruction>
	.word 0xbbe52146  ! 4153: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_0, %g1, %r23
	.word 0xb7e4a17f  ! 4160: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8994e1e9  ! 4162: WRPR_TICK_I	wrpr	%r19, 0x01e9, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e52120  ! 4166: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e4e007  ! 4168: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb225a007  ! 4170: SUB_I	sub 	%r22, 0x0007, %r25
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56175  ! 4173: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf50c000  ! 4176: RDPR_TT	<illegal instruction>
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956024  ! 4181: WRPR_TNPC_I	wrpr	%r21, 0x0024, %tnpc
	.word 0xb9520000  ! 4182: RDPR_PIL	<illegal instruction>
	.word 0xb1510000  ! 4186: RDPR_TICK	<illegal instruction>
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952069  ! 4193: WRPR_TNPC_I	wrpr	%r20, 0x0069, %tnpc
	.word 0xb5350000  ! 4194: SRL_R	srl 	%r20, %r0, %r26
	.word 0xbfe4e1fd  ! 4196: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5a171  ! 4197: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8195e03a  ! 4198: WRPR_TPC_I	wrpr	%r23, 0x003a, %tpc
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 4200: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4e1ae  ! 4202: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e420f6  ! 4204: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4214e  ! 4206: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x85956143  ! 4208: WRPR_TSTATE_I	wrpr	%r21, 0x0143, %tstate
	.word 0x8d95e063  ! 4212: WRPR_PSTATE_I	wrpr	%r23, 0x0063, %pstate
	.word 0x9195e0b7  ! 4213: WRPR_PIL_I	wrpr	%r23, 0x00b7, %pil
	mov	1, %r14
	.word 0xa193a000  ! 4216: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb504000  ! 4218: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5e00d  ! 4219: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe46172  ! 4221: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5a0b8  ! 4222: SAVE_I	save	%r22, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 4223: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e101  ! 4225: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4a036  ! 4227: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1ee  ! 4231: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4a1d5  ! 4237: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe4a011  ! 4238: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde460fb  ! 4239: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x87942033  ! 4240: WRPR_TT_I	wrpr	%r16, 0x0033, %tt
	.word 0xbbe5e005  ! 4246: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3510000  ! 4252: RDPR_TICK	<illegal instruction>
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46051  ! 4258: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4e063  ! 4259: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9643801  ! 4265: MOVcc_I	<illegal instruction>
	.word 0xb1e42157  ! 4267: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb0a4e0c9  ! 4269: SUBcc_I	subcc 	%r19, 0x00c9, %r24
	.word 0xb32c3001  ! 4271: SLLX_I	sllx	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 4273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	.word 0xbac521b3  ! 4278: ADDCcc_I	addccc 	%r20, 0x01b3, %r29
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 4282: RDPR_TICK	<illegal instruction>
	.word 0xbde42088  ! 4283: SAVE_I	save	%r16, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 4284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e52033  ! 4285: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 4287: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e5a124  ! 4291: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5a12a  ! 4293: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5a076  ! 4295: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a04c  ! 4298: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e56021  ! 4305: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8395a168  ! 4307: WRPR_TNPC_I	wrpr	%r22, 0x0168, %tnpc
	.word 0xbbe5a1d0  ! 4311: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e56180  ! 4315: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4a061  ! 4318: SAVE_I	save	%r18, 0x0001, %r26
	mov	1, %r14
	.word 0xa193a000  ! 4319: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd518000  ! 4321: RDPR_PSTATE	<illegal instruction>
	.word 0xb551c000  ! 4322: RDPR_TL	<illegal instruction>
	.word 0xb7e46083  ! 4324: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_6, %g1, %r22
	.word 0xb1e4e1fa  ! 4327: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8d95a136  ! 4331: WRPR_PSTATE_I	wrpr	%r22, 0x0136, %pstate
	.word 0x8195a0d6  ! 4337: WRPR_TPC_I	wrpr	%r22, 0x00d6, %tpc
	.word 0x8794a139  ! 4338: WRPR_TT_I	wrpr	%r18, 0x0139, %tt
	.word 0xbd500000  ! 4340: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e1f8  ! 4341: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8794a0cc  ! 4342: WRPR_TT_I	wrpr	%r18, 0x00cc, %tt
	.word 0x81956137  ! 4343: WRPR_TPC_I	wrpr	%r21, 0x0137, %tpc
	.word 0xb1510000  ! 4345: RDPR_TICK	<illegal instruction>
	.word 0xbd508000  ! 4346: RDPR_TSTATE	<illegal instruction>
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e520c1  ! 4348: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbec4a1c8  ! 4349: ADDCcc_I	addccc 	%r18, 0x01c8, %r31
	.word 0xb9e5a04e  ! 4350: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4e0ef  ! 4351: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e421c5  ! 4352: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8d94e028  ! 4358: WRPR_PSTATE_I	wrpr	%r19, 0x0028, %pstate
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e088  ! 4361: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e521b1  ! 4362: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1510000  ! 4368: RDPR_TICK	<illegal instruction>
	.word 0x87946018  ! 4371: WRPR_TT_I	wrpr	%r17, 0x0018, %tt
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 4375: RDPR_TICK	<illegal instruction>
	.word 0xbbe46192  ! 4378: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf500000  ! 4379: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e11  ! 4380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e11, %hpstate
	.word 0xb5e4210d  ! 4381: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_0, %g1, %r22
	.word 0xb9e5e121  ! 4383: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e560a3  ! 4385: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e560c4  ! 4386: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e421aa  ! 4387: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb72d2001  ! 4393: SLL_I	sll 	%r20, 0x0001, %r27
	.word 0xb7e46103  ! 4396: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb2942196  ! 4399: ORcc_I	orcc 	%r16, 0x0196, %r25
	.word 0xbf480000  ! 4400: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8395a1e7  ! 4401: WRPR_TNPC_I	wrpr	%r22, 0x01e7, %tnpc
	.word 0xb9e5a09d  ! 4402: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e42024  ! 4404: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5a045  ! 4406: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e46071  ! 4407: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x204, %g1, %o0
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
	.word 0xbf500000  ! 4417: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 4420: RDPR_TPC	<illegal instruction>
	.word 0xbde5a01c  ! 4422: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x20102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e46169  ! 4425: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5a06d  ! 4427: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5a001  ! 4430: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe4e10d  ! 4432: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe5e055  ! 4433: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5603b  ! 4435: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4a140  ! 4436: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e42113  ! 4437: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e42104  ! 4439: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5a1ff  ! 4442: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5e1bd  ! 4452: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5a155  ! 4453: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4b5e198  ! 4454: SUBCcc_I	orncc 	%r23, 0x0198, %r26
	setx	data_start_4, %g1, %r16
	setx	data_start_2, %g1, %r21
	.word 0xbe8da071  ! 4465: ANDcc_I	andcc 	%r22, 0x0071, %r31
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0f6  ! 4474: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a1b6  ! 4478: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3540000  ! 4479: RDPR_GL	<illegal instruction>
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421bc  ! 4481: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde421d3  ! 4484: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xb02c4000  ! 4489: ANDN_R	andn 	%r17, %r0, %r24
	.word 0xb1e5a135  ! 4490: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46052  ! 4493: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5610c  ! 4495: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a148  ! 4501: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe46187  ! 4504: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_7, %g1, %r20
	.word 0xbbe520d2  ! 4509: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4a16a  ! 4511: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982991  ! 4514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	.word 0x8394a136  ! 4517: WRPR_TNPC_I	wrpr	%r18, 0x0136, %tnpc
	.word 0xbfe4e1f1  ! 4519: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e561c5  ! 4528: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x30200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0b6  ! 4532: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a041  ! 4538: SAVE_I	save	%r18, 0x0001, %r25
	mov	1, %r14
	.word 0xa193a000  ! 4543: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e4e1f0  ! 4544: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_3, %g1, %r17
	.word 0xb7510000  ! 4546: RDPR_TICK	<illegal instruction>
	.word 0xb21ca1d7  ! 4547: XOR_I	xor 	%r18, 0x01d7, %r25
	.word 0xb1e4e078  ! 4549: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8195e0ae  ! 4551: WRPR_TPC_I	wrpr	%r23, 0x00ae, %tpc
	.word 0xb3e520d5  ! 4552: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2c608d  ! 4555: ANDN_I	andn 	%r17, 0x008d, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983a8b  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8b, %hpstate
	.word 0xbde5e1cf  ! 4559: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4e0e0  ! 4561: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	mov	2, %r12
	.word 0x8f932000  ! 4575: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8594a043  ! 4576: WRPR_TSTATE_I	wrpr	%r18, 0x0043, %tstate
	.word 0xbfe5e0c7  ! 4580: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb480000  ! 4584: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbfe4e072  ! 4585: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d946056  ! 4586: WRPR_PSTATE_I	wrpr	%r17, 0x0056, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983c0b  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0b, %hpstate
	.word 0xbde52015  ! 4588: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb4ac4000  ! 4589: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xbd3d0000  ! 4591: SRA_R	sra 	%r20, %r0, %r30
	.word 0x899421cc  ! 4592: WRPR_TICK_I	wrpr	%r16, 0x01cc, %tick
	.word 0xb3e4608a  ! 4593: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb4050000  ! 4594: ADD_R	add 	%r20, %r0, %r26
	.word 0xb5e5e12a  ! 4595: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x899420ac  ! 4600: WRPR_TICK_I	wrpr	%r16, 0x00ac, %tick
	.word 0xb1540000  ! 4601: RDPR_GL	<illegal instruction>
	.word 0xb1e420a4  ! 4606: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e047  ! 4607: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5608f  ! 4608: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4e13d  ! 4610: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf2c6001  ! 4620: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xb88c8000  ! 4621: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xb7e56069  ! 4623: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e560de  ! 4625: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5a045  ! 4629: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_3, %g1, %r18
	.word 0xb9e46042  ! 4631: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_5, %g1, %r17
	.word 0xb1e52111  ! 4636: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe421c0  ! 4638: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x81956029  ! 4640: WRPR_TPC_I	wrpr	%r21, 0x0029, %tpc
	.word 0xb3e4a044  ! 4642: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbd612a  ! 4646: XNORcc_I	xnorcc 	%r21, 0x012a, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 4649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 4654: RDPR_TPC	<illegal instruction>
	.word 0xb37de401  ! 4656: MOVR_I	movre	%r23, 0x1, %r25
	.word 0xbd50c000  ! 4658: RDPR_TT	<illegal instruction>
	.word 0xb9e4e025  ! 4659: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1504000  ! 4661: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4e193  ! 4663: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828d3  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d3, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e03  ! 4668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e03, %hpstate
	.word 0xbde4a0be  ! 4669: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5a136  ! 4670: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a188  ! 4677: WRPR_PIL_I	wrpr	%r22, 0x0188, %pil
	.word 0xb7e520fa  ! 4681: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a199  ! 4683: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e4e031  ! 4687: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb550c000  ! 4690: RDPR_TT	<illegal instruction>
	.word 0xb9e5a0b0  ! 4697: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e42034  ! 4699: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7480000  ! 4701: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb550c000  ! 4702: RDPR_TT	<illegal instruction>
	.word 0xb5e461cc  ! 4704: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbe9dc000  ! 4707: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xbfe4e1dd  ! 4708: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d94a13a  ! 4710: WRPR_PSTATE_I	wrpr	%r18, 0x013a, %pstate
	.word 0xb6042033  ! 4711: ADD_I	add 	%r16, 0x0033, %r27
	.word 0x8395e00f  ! 4712: WRPR_TNPC_I	wrpr	%r23, 0x000f, %tnpc
	.word 0x9195a11e  ! 4716: WRPR_PIL_I	wrpr	%r22, 0x011e, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e421c8  ! 4721: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbf520000  ! 4723: RDPR_PIL	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb88d0000  ! 4735: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xb3e5a040  ! 4739: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb81c4000  ! 4741: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb1643801  ! 4742: MOVcc_I	<illegal instruction>
	.word 0xb550c000  ! 4743: RDPR_TT	<illegal instruction>
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919520b0  ! 4749: WRPR_PIL_I	wrpr	%r20, 0x00b0, %pil
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5a138  ! 4755: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb2ada0f6  ! 4759: ANDNcc_I	andncc 	%r22, 0x00f6, %r25
	.word 0xb5e5a193  ! 4762: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5a0b6  ! 4763: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde46117  ! 4768: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5a0b6  ! 4769: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a03f  ! 4771: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e5e1d4  ! 4773: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4a104  ! 4774: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5604b  ! 4777: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d9460c6  ! 4779: WRPR_PSTATE_I	wrpr	%r17, 0x00c6, %pstate
	.word 0x919420e0  ! 4782: WRPR_PIL_I	wrpr	%r16, 0x00e0, %pil
	.word 0xbf480000  ! 4783: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e421d1  ! 4788: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e521cf  ! 4789: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5a123  ! 4790: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a1ca  ! 4797: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde460d8  ! 4798: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a180  ! 4801: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7520000  ! 4803: RDPR_PIL	<illegal instruction>
	.word 0xb3e5e121  ! 4809: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e520c4  ! 4812: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5e16c  ! 4814: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe561f3  ! 4822: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e171  ! 4837: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e044  ! 4842: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x9195a066  ! 4843: WRPR_PIL_I	wrpr	%r22, 0x0066, %pil
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a050  ! 4848: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56083  ! 4850: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3504000  ! 4852: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5a125  ! 4860: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe5e06c  ! 4862: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5a06f  ! 4863: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983cd9  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd9, %hpstate
	.word 0xb9e56191  ! 4870: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0xb9e5a16f  ! 4875: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a06d  ! 4877: SAVE_I	save	%r18, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 4878: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 4882: RDPR_TL	<illegal instruction>
	.word 0xbfe561fe  ! 4884: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 4889: MOVcc_I	<illegal instruction>
	setx	0x3d, %g1, %o0
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
	.word 0xb7352001  ! 4892: SRL_I	srl 	%r20, 0x0001, %r27
	setx	data_start_0, %g1, %r23
	.word 0xbde4a0cc  ! 4901: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e42056  ! 4902: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 4905: RDPR_TL	<illegal instruction>
	.word 0xb5e5605d  ! 4908: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbd50c000  ! 4910: RDPR_TT	<illegal instruction>
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42012  ! 4912: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e5a148  ! 4923: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952166  ! 4925: WRPR_TNPC_I	wrpr	%r20, 0x0166, %tnpc
	.word 0xbbe52061  ! 4926: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe560ab  ! 4927: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42161  ! 4931: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4e0a3  ! 4932: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 4935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabc0000  ! 4940: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0xbd480000  ! 4941: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9e4e069  ! 4942: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 4943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0xb3e46087  ! 4944: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5616c  ! 4949: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198288b  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088b, %hpstate
	.word 0xbbe5618c  ! 4957: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x9195e154  ! 4959: WRPR_PIL_I	wrpr	%r23, 0x0154, %pil
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521a4  ! 4968: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb645a1b6  ! 4969: ADDC_I	addc 	%r22, 0x01b6, %r27
	.word 0xbfe520e6  ! 4971: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8194209f  ! 4972: WRPR_TPC_I	wrpr	%r16, 0x009f, %tpc
	.word 0xbcb54000  ! 4974: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xbfe42186  ! 4978: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e46145  ! 4981: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8795a006  ! 4983: WRPR_TT_I	wrpr	%r22, 0x0006, %tt
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e034  ! 4986: WRPR_TSTATE_I	wrpr	%r19, 0x0034, %tstate
	mov	0, %r12
	.word 0x8f932000  ! 4992: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb12ca001  ! 4993: SLL_I	sll 	%r18, 0x0001, %r24
	.word 0xbde4a054  ! 4995: SAVE_I	save	%r18, 0x0001, %r30
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
	.word 0xf13c21db  ! 6: STDF_I	std	%f24, [0x01db, %r16]
	.word 0xfc3dc000  ! 8: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf62c4000  ! 11: STB_R	stb	%r27, [%r17 + %r0]
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13cc000  ! 16: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfe2c8000  ! 21: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfe754000  ! 24: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfc758000  ! 26: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfe3c0000  ! 27: STD_R	std	%r31, [%r16 + %r0]
	.word 0xb435c000  ! 29: SUBC_R	orn 	%r23, %r0, %r26
	.word 0xbb520000  ! 30: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf03dc000  ! 31: STD_R	std	%r24, [%r23 + %r0]
	.word 0xfc75c000  ! 32: STX_R	stx	%r30, [%r23 + %r0]
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 35: RDPR_TNPC	<illegal instruction>
	.word 0xbd520000  ! 37: RDPR_PIL	<illegal instruction>
	.word 0xf4748000  ! 42: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf03ca0c8  ! 44: STD_I	std	%r24, [%r18 + 0x00c8]
	.word 0xb12dc000  ! 46: SLL_R	sll 	%r23, %r0, %r24
	.word 0xf42da0b8  ! 50: STB_I	stb	%r26, [%r22 + 0x00b8]
	.word 0x8d94218c  ! 51: WRPR_PSTATE_I	wrpr	%r16, 0x018c, %pstate
	.word 0xfe3d6155  ! 52: STD_I	std	%r31, [%r21 + 0x0155]
	.word 0xb5510000  ! 56: RDPR_TICK	rdpr	%tick, %r26
	.word 0xff3c0000  ! 57: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb5480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf0754000  ! 62: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf62c2036  ! 64: STB_I	stb	%r27, [%r16 + 0x0036]
	.word 0xf8344000  ! 68: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf2752162  ! 69: STX_I	stx	%r25, [%r20 + 0x0162]
	.word 0xf075a15a  ! 74: STX_I	stx	%r24, [%r22 + 0x015a]
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c201c  ! 86: STDF_I	std	%f29, [0x001c, %r16]
	.word 0xbb540000  ! 91: RDPR_GL	<illegal instruction>
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93c4000  ! 97: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf53ce0d8  ! 101: STDF_I	std	%f26, [0x00d8, %r19]
	.word 0xbb50c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0xf42d8000  ! 104: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xbb508000  ! 108: RDPR_TSTATE	<illegal instruction>
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24e10a  ! 113: STW_I	stw	%r30, [%r19 + 0x010a]
	.word 0xf2358000  ! 115: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xbb518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a08f  ! 120: WRPR_TT_I	wrpr	%r22, 0x008f, %tt
	.word 0xbd480000  ! 121: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbb480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4b58000  ! 127: SUBCcc_R	orncc 	%r22, %r0, %r26
	setx	data_start_6, %g1, %r17
	.word 0xf0344000  ! 134: STH_R	sth	%r24, [%r17 + %r0]
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe15a0c8  ! 143: OR_I	or 	%r22, 0x00c8, %r31
	.word 0xfa35e0a9  ! 146: STH_I	sth	%r29, [%r23 + 0x00a9]
	.word 0xf424c000  ! 147: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf13ce160  ! 149: STDF_I	std	%f24, [0x0160, %r19]
	.word 0xfc3521f8  ! 150: STH_I	sth	%r30, [%r20 + 0x01f8]
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc7521bc  ! 156: STX_I	stx	%r30, [%r20 + 0x01bc]
	.word 0xf02c2131  ! 162: STB_I	stb	%r24, [%r16 + 0x0131]
	.word 0xb08d0000  ! 165: ANDcc_R	andcc 	%r20, %r0, %r24
	setx	data_start_5, %g1, %r16
	.word 0x8794e175  ! 170: WRPR_TT_I	wrpr	%r19, 0x0175, %tt
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d0000  ! 174: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf22c201e  ! 176: STB_I	stb	%r25, [%r16 + 0x001e]
	mov	2, %r14
	.word 0xa193a000  ! 179: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9500000  ! 188: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x819520e1  ! 189: WRPR_TPC_I	wrpr	%r20, 0x00e1, %tpc
	.word 0xfa7420cb  ! 190: STX_I	stx	%r29, [%r16 + 0x00cb]
	.word 0xb23cc000  ! 191: XNOR_R	xnor 	%r19, %r0, %r25
	.word 0xfe25e00a  ! 192: STW_I	stw	%r31, [%r23 + 0x000a]
	.word 0xfc7521ca  ! 193: STX_I	stx	%r30, [%r20 + 0x01ca]
	.word 0x83956135  ! 194: WRPR_TNPC_I	wrpr	%r21, 0x0135, %tnpc
	.word 0xff3d6175  ! 198: STDF_I	std	%f31, [0x0175, %r21]
	.word 0x8595e027  ! 200: WRPR_TSTATE_I	wrpr	%r23, 0x0027, %tstate
	.word 0xfc2c0000  ! 201: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf62da0c7  ! 202: STB_I	stb	%r27, [%r22 + 0x00c7]
	.word 0xfc742069  ! 212: STX_I	stx	%r30, [%r16 + 0x0069]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa3d4000  ! 215: STD_R	std	%r29, [%r21 + %r0]
	.word 0xba24a10b  ! 217: SUB_I	sub 	%r18, 0x010b, %r29
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7350000  ! 220: SRL_R	srl 	%r20, %r0, %r27
	.word 0xbe44a1a4  ! 221: ADDC_I	addc 	%r18, 0x01a4, %r31
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e153  ! 223: WRPR_TNPC_I	wrpr	%r23, 0x0153, %tnpc
	.word 0xf42ca087  ! 225: STB_I	stb	%r26, [%r18 + 0x0087]
	.word 0xbca5c000  ! 226: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xb5518000  ! 227: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xbc84c000  ! 228: ADDcc_R	addcc 	%r19, %r0, %r30
	.word 0xf43dc000  ! 231: STD_R	std	%r26, [%r23 + %r0]
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 239: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf22d0000  ! 241: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xbc24a061  ! 247: SUB_I	sub 	%r18, 0x0061, %r30
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025217c  ! 252: STW_I	stw	%r24, [%r20 + 0x017c]
	.word 0xb135c000  ! 258: SRL_R	srl 	%r23, %r0, %r24
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	.word 0xfe244000  ! 276: STW_R	stw	%r31, [%r17 + %r0]
	.word 0x87946038  ! 278: WRPR_TT_I	wrpr	%r17, 0x0038, %tt
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9421f9  ! 281: WRPR_PSTATE_I	wrpr	%r16, 0x01f9, %pstate
	.word 0xb20c8000  ! 282: AND_R	and 	%r18, %r0, %r25
	.word 0xf624c000  ! 286: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xb7480000  ! 287: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf93dc000  ! 291: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf13d4000  ! 292: STDF_R	std	%f24, [%r0, %r21]
	.word 0xb7540000  ! 293: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r17
	setx	data_start_1, %g1, %r20
	.word 0xb3540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0x8595a198  ! 303: WRPR_TSTATE_I	wrpr	%r22, 0x0198, %tstate
	.word 0xbab460b8  ! 311: ORNcc_I	orncc 	%r17, 0x00b8, %r29
	.word 0x89942066  ! 314: WRPR_TICK_I	wrpr	%r16, 0x0066, %tick
	.word 0xf13de1b2  ! 322: STDF_I	std	%f24, [0x01b2, %r23]
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc746105  ! 332: STX_I	stx	%r30, [%r17 + 0x0105]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2cc000  ! 341: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb93c0000  ! 342: SRA_R	sra 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983b51  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b51, %hpstate
	.word 0xfe24c000  ! 350: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf824608f  ! 351: STW_I	stw	%r28, [%r17 + 0x008f]
	.word 0xfe2c4000  ! 353: STB_R	stb	%r31, [%r17 + %r0]
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 356: RDPR_TL	rdpr	%tl, %r27
	.word 0x8594a0ce  ! 357: WRPR_TSTATE_I	wrpr	%r18, 0x00ce, %tstate
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03de074  ! 359: STD_I	std	%r24, [%r23 + 0x0074]
	.word 0xb750c000  ! 360: RDPR_TT	rdpr	%tt, %r27
	setx	0x1030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb33c3001  ! 368: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xfe248000  ! 370: STW_R	stw	%r31, [%r18 + %r0]
	.word 0x83942056  ! 373: WRPR_TNPC_I	wrpr	%r16, 0x0056, %tnpc
	setx	0x30016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c6167  ! 379: STDF_I	std	%f31, [0x0167, %r17]
	.word 0xbe0c4000  ! 382: AND_R	and 	%r17, %r0, %r31
	.word 0xf43420c3  ! 383: STH_I	sth	%r26, [%r16 + 0x00c3]
	.word 0xf624a07e  ! 384: STW_I	stw	%r27, [%r18 + 0x007e]
	.word 0xbeb560cb  ! 385: ORNcc_I	orncc 	%r21, 0x00cb, %r31
	.word 0xb7540000  ! 386: RDPR_GL	rdpr	%-, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983edb  ! 387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edb, %hpstate
	.word 0xfe74c000  ! 390: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xbf520000  ! 391: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf035c000  ! 394: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xb3340000  ! 395: SRL_R	srl 	%r16, %r0, %r25
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d60d4  ! 398: STDF_I	std	%f31, [0x00d4, %r21]
	.word 0xfa3d6034  ! 399: STD_I	std	%r29, [%r21 + 0x0034]
	.word 0xfd3d4000  ! 405: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf0752145  ! 409: STX_I	stx	%r24, [%r20 + 0x0145]
	.word 0xb6350000  ! 410: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb42c2165  ! 415: ANDN_I	andn 	%r16, 0x0165, %r26
	.word 0xf6340000  ! 416: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xfc740000  ! 417: STX_R	stx	%r30, [%r16 + %r0]
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0242054  ! 421: STW_I	stw	%r24, [%r16 + 0x0054]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0244000  ! 424: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb7518000  ! 425: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbf500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb43c2027  ! 430: XNOR_I	xnor 	%r16, 0x0027, %r26
	.word 0xbd641800  ! 431: MOVcc_R	<illegal instruction>
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 434: STX_R	stx	%r27, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe25e039  ! 436: STW_I	stw	%r31, [%r23 + 0x0039]
	.word 0xfe344000  ! 444: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf6242099  ! 446: STW_I	stw	%r27, [%r16 + 0x0099]
	.word 0xff3dc000  ! 447: STDF_R	std	%f31, [%r0, %r23]
	mov	1, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5540000  ! 450: RDPR_GL	rdpr	%-, %r26
	.word 0xf82c21ac  ! 452: STB_I	stb	%r28, [%r16 + 0x01ac]
	.word 0xf0240000  ! 453: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf47560db  ! 456: STX_I	stx	%r26, [%r21 + 0x00db]
	.word 0xfc250000  ! 459: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf2752121  ! 464: STX_I	stx	%r25, [%r20 + 0x0121]
	.word 0xf62c0000  ! 465: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xb0ade068  ! 466: ANDNcc_I	andncc 	%r23, 0x0068, %r24
	.word 0x8795607f  ! 467: WRPR_TT_I	wrpr	%r21, 0x007f, %tt
	.word 0xfa3de0dc  ! 469: STD_I	std	%r29, [%r23 + 0x00dc]
	.word 0xfa75e128  ! 472: STX_I	stx	%r29, [%r23 + 0x0128]
	.word 0xb751c000  ! 473: RDPR_TL	rdpr	%tl, %r27
	.word 0xf835a127  ! 478: STH_I	sth	%r28, [%r22 + 0x0127]
	.word 0x8195214d  ! 479: WRPR_TPC_I	wrpr	%r20, 0x014d, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60d606f  ! 483: AND_I	and 	%r21, 0x006f, %r27
	setx	data_start_4, %g1, %r20
	.word 0xfa756186  ! 488: STX_I	stx	%r29, [%r21 + 0x0186]
	.word 0xb0848000  ! 489: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xf33c2011  ! 495: STDF_I	std	%f25, [0x0011, %r16]
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba1dc000  ! 503: XOR_R	xor 	%r23, %r0, %r29
	.word 0xfa2c0000  ! 505: STB_R	stb	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f8b  ! 510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f8b, %hpstate
	.word 0xf674c000  ! 511: STX_R	stx	%r27, [%r19 + %r0]
	.word 0x8595600e  ! 513: WRPR_TSTATE_I	wrpr	%r21, 0x000e, %tstate
	.word 0x8394216d  ! 517: WRPR_TNPC_I	wrpr	%r16, 0x016d, %tnpc
	.word 0xf8244000  ! 524: STW_R	stw	%r28, [%r17 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa34a07c  ! 529: STH_I	sth	%r29, [%r18 + 0x007c]
	.word 0xf8354000  ! 532: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfa2c8000  ! 534: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe3420ea  ! 535: STH_I	sth	%r31, [%r16 + 0x00ea]
	.word 0xba3cc000  ! 541: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xba2560d0  ! 542: SUB_I	sub 	%r21, 0x00d0, %r29
	setx	0x2032b, %g1, %o0
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
	.word 0xb1643801  ! 549: MOVcc_I	<illegal instruction>
	.word 0xb3480000  ! 550: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8595a10f  ! 554: WRPR_TSTATE_I	wrpr	%r22, 0x010f, %tstate
	.word 0x81952141  ! 557: WRPR_TPC_I	wrpr	%r20, 0x0141, %tpc
	.word 0xb0454000  ! 559: ADDC_R	addc 	%r21, %r0, %r24
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3ca0e1  ! 564: STD_I	std	%r29, [%r18 + 0x00e1]
	.word 0xfc24619f  ! 566: STW_I	stw	%r30, [%r17 + 0x019f]
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e194  ! 569: WRPR_PSTATE_I	wrpr	%r19, 0x0194, %pstate
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4b50000  ! 578: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xf6240000  ! 580: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xb62d4000  ! 581: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xf53ca142  ! 582: STDF_I	std	%f26, [0x0142, %r18]
	.word 0xfa358000  ! 585: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf73d2009  ! 586: STDF_I	std	%f27, [0x0009, %r20]
	.word 0xb73c5000  ! 587: SRAX_R	srax	%r17, %r0, %r27
	.word 0xb5520000  ! 588: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf73d4000  ! 590: STDF_R	std	%f27, [%r0, %r21]
	.word 0x8d95e0cc  ! 596: WRPR_PSTATE_I	wrpr	%r23, 0x00cc, %pstate
	.word 0xb1500000  ! 600: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfd3c4000  ! 602: STDF_R	std	%f30, [%r0, %r17]
	.word 0xf82c4000  ! 606: STB_R	stb	%r28, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198395b  ! 614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a83  ! 620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d4000  ! 629: STD_R	std	%r29, [%r21 + %r0]
	.word 0xfe3da1b1  ! 630: STD_I	std	%r31, [%r22 + 0x01b1]
	.word 0xfc2d8000  ! 633: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf4252076  ! 634: STW_I	stw	%r26, [%r20 + 0x0076]
	.word 0x8995210a  ! 635: WRPR_TICK_I	wrpr	%r20, 0x010a, %tick
	.word 0xfe2d8000  ! 636: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf074a166  ! 640: STX_I	stx	%r24, [%r18 + 0x0166]
	.word 0xfe74c000  ! 641: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf025a021  ! 642: STW_I	stw	%r24, [%r22 + 0x0021]
	.word 0xf73da0e0  ! 645: STDF_I	std	%f27, [0x00e0, %r22]
	.word 0xf63de0d0  ! 647: STD_I	std	%r27, [%r23 + 0x00d0]
	.word 0xfe2da0b4  ! 649: STB_I	stb	%r31, [%r22 + 0x00b4]
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d61c5  ! 655: STB_I	stb	%r29, [%r21 + 0x01c5]
	.word 0xb3353001  ! 663: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0x8195a137  ! 668: WRPR_TPC_I	wrpr	%r22, 0x0137, %tpc
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xf02cc000  ! 671: STB_R	stb	%r24, [%r19 + %r0]
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf23dc000  ! 678: STD_R	std	%r25, [%r23 + %r0]
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983853  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1853, %hpstate
	setx	data_start_4, %g1, %r18
	.word 0xb204607b  ! 683: ADD_I	add 	%r17, 0x007b, %r25
	.word 0xf034a05d  ! 684: STH_I	sth	%r24, [%r18 + 0x005d]
	.word 0x8795a01b  ! 686: WRPR_TT_I	wrpr	%r22, 0x001b, %tt
	.word 0xf02cc000  ! 689: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfe25609a  ! 690: STW_I	stw	%r31, [%r21 + 0x009a]
	.word 0xf82d217c  ! 693: STB_I	stb	%r28, [%r20 + 0x017c]
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2bc61ec  ! 696: XNORcc_I	xnorcc 	%r17, 0x01ec, %r25
	.word 0xfa3c20cb  ! 697: STD_I	std	%r29, [%r16 + 0x00cb]
	.word 0x819520cf  ! 698: WRPR_TPC_I	wrpr	%r20, 0x00cf, %tpc
	setx	0x2001f, %g1, %o0
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
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 710: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xb6b52055  ! 711: SUBCcc_I	orncc 	%r20, 0x0055, %r27
	.word 0xbac5e14e  ! 712: ADDCcc_I	addccc 	%r23, 0x014e, %r29
	.word 0x9194e059  ! 713: WRPR_PIL_I	wrpr	%r19, 0x0059, %pil
	.word 0xff3c8000  ! 715: STDF_R	std	%f31, [%r0, %r18]
	.word 0xbf504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf23c0000  ! 720: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf2346065  ! 725: STH_I	sth	%r25, [%r17 + 0x0065]
	.word 0xf875a18c  ! 726: STX_I	stx	%r28, [%r22 + 0x018c]
	.word 0x899521fa  ! 729: WRPR_TICK_I	wrpr	%r20, 0x01fa, %tick
	.word 0xb1643801  ! 730: MOVcc_I	<illegal instruction>
	.word 0xb32dd000  ! 731: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xb6856065  ! 734: ADDcc_I	addcc 	%r21, 0x0065, %r27
	.word 0xf23c8000  ! 735: STD_R	std	%r25, [%r18 + %r0]
	.word 0x8d94a06e  ! 737: WRPR_PSTATE_I	wrpr	%r18, 0x006e, %pstate
	.word 0xfa2c0000  ! 739: STB_R	stb	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982bd3  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd3, %hpstate
	.word 0x8594602c  ! 741: WRPR_TSTATE_I	wrpr	%r17, 0x002c, %tstate
	.word 0xfe74a046  ! 742: STX_I	stx	%r31, [%r18 + 0x0046]
	.word 0x9194219d  ! 752: WRPR_PIL_I	wrpr	%r16, 0x019d, %pil
	.word 0xf83d61e6  ! 755: STD_I	std	%r28, [%r21 + 0x01e6]
	.word 0xb751c000  ! 756: RDPR_TL	rdpr	%tl, %r27
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 761: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x859420ed  ! 762: WRPR_TSTATE_I	wrpr	%r16, 0x00ed, %tstate
	.word 0x859460ab  ! 771: WRPR_TSTATE_I	wrpr	%r17, 0x00ab, %tstate
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 776: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf8354000  ! 777: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf73cc000  ! 778: STDF_R	std	%f27, [%r0, %r19]
	.word 0xb9500000  ! 780: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xf63d2067  ! 781: STD_I	std	%r27, [%r20 + 0x0067]
	.word 0xbd51c000  ! 785: RDPR_TL	<illegal instruction>
	.word 0xfe2520b5  ! 786: STW_I	stw	%r31, [%r20 + 0x00b5]
	.word 0x859421ca  ! 792: WRPR_TSTATE_I	wrpr	%r16, 0x01ca, %tstate
	.word 0xbd480000  ! 793: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfe244000  ! 797: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf6250000  ! 800: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb7480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc3521c5  ! 806: STH_I	sth	%r30, [%r20 + 0x01c5]
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xf834e0ef  ! 814: STH_I	sth	%r28, [%r19 + 0x00ef]
	setx	data_start_3, %g1, %r19
	.word 0xf93da04e  ! 817: STDF_I	std	%f28, [0x004e, %r22]
	.word 0xf4340000  ! 821: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfe35e0e1  ! 822: STH_I	sth	%r31, [%r23 + 0x00e1]
	.word 0xf42c0000  ! 823: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf03560be  ! 824: STH_I	sth	%r24, [%r21 + 0x00be]
	.word 0x8d94e08c  ! 826: WRPR_PSTATE_I	wrpr	%r19, 0x008c, %pstate
	.word 0xbf50c000  ! 828: RDPR_TT	rdpr	%tt, %r31
	.word 0xfa2ce1fd  ! 830: STB_I	stb	%r29, [%r19 + 0x01fd]
	.word 0xfc2da19b  ! 832: STB_I	stb	%r30, [%r22 + 0x019b]
	.word 0xf4254000  ! 834: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xb9518000  ! 837: RDPR_PSTATE	<illegal instruction>
	.word 0xfc2461fc  ! 838: STW_I	stw	%r30, [%r17 + 0x01fc]
	.word 0xf53ce1c4  ! 841: STDF_I	std	%f26, [0x01c4, %r19]
	.word 0x8794e1b0  ! 842: WRPR_TT_I	wrpr	%r19, 0x01b0, %tt
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c21e5  ! 849: STD_I	std	%r25, [%r16 + 0x01e5]
	.word 0x8995208a  ! 852: WRPR_TICK_I	wrpr	%r20, 0x008a, %tick
	.word 0xf6248000  ! 857: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf83d200a  ! 860: STD_I	std	%r28, [%r20 + 0x000a]
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 867: RDPR_TT	rdpr	%tt, %r30
	.word 0xfd3dc000  ! 869: STDF_R	std	%f30, [%r0, %r23]
	.word 0xfb3dc000  ! 871: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfc2ce0bc  ! 872: STB_I	stb	%r30, [%r19 + 0x00bc]
	.word 0x85952013  ! 873: WRPR_TSTATE_I	wrpr	%r20, 0x0013, %tstate
	.word 0xb02d4000  ! 879: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xf02d20c5  ! 882: STB_I	stb	%r24, [%r20 + 0x00c5]
	.word 0xb750c000  ! 883: RDPR_TT	rdpr	%tt, %r27
	.word 0xf635c000  ! 884: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfe2ca110  ! 885: STB_I	stb	%r31, [%r18 + 0x0110]
	.word 0xff3c4000  ! 886: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf42d2038  ! 891: STB_I	stb	%r26, [%r20 + 0x0038]
	.word 0xfe2cc000  ! 895: STB_R	stb	%r31, [%r19 + %r0]
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 905: RDPR_TT	rdpr	%tt, %r31
	.word 0xb3349000  ! 906: SRLX_R	srlx	%r18, %r0, %r25
	.word 0xf93d208a  ! 908: STDF_I	std	%f28, [0x008a, %r20]
	mov	2, %r14
	.word 0xa193a000  ! 910: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8340000  ! 911: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf82cc000  ! 912: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x8394e1d5  ! 915: WRPR_TNPC_I	wrpr	%r19, 0x01d5, %tnpc
	.word 0xb7352001  ! 918: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xb1510000  ! 919: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf8346004  ! 920: STH_I	sth	%r28, [%r17 + 0x0004]
	.word 0xf53d61d2  ! 922: STDF_I	std	%f26, [0x01d2, %r21]
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03dc000  ! 927: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb2344000  ! 932: ORN_R	orn 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982893  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0893, %hpstate
	setx	data_start_7, %g1, %r18
	.word 0xfe2c214e  ! 936: STB_I	stb	%r31, [%r16 + 0x014e]
	.word 0xf634e147  ! 942: STH_I	sth	%r27, [%r19 + 0x0147]
	.word 0xb151c000  ! 944: RDPR_TL	rdpr	%tl, %r24
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	.word 0xf2258000  ! 959: STW_R	stw	%r25, [%r22 + %r0]
	.word 0x8194616a  ! 960: WRPR_TPC_I	wrpr	%r17, 0x016a, %tpc
	.word 0xbcb4a1ea  ! 964: ORNcc_I	orncc 	%r18, 0x01ea, %r30
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 970: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf634e0cb  ! 971: STH_I	sth	%r27, [%r19 + 0x00cb]
	.word 0xf634a04f  ! 973: STH_I	sth	%r27, [%r18 + 0x004f]
	.word 0xb5508000  ! 977: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3340000  ! 984: SRL_R	srl 	%r16, %r0, %r25
	.word 0xfd3d606b  ! 985: STDF_I	std	%f30, [0x006b, %r21]
	.word 0xb9510000  ! 986: RDPR_TICK	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb52dd000  ! 988: SLLX_R	sllx	%r23, %r0, %r26
	.word 0x9195e1f3  ! 991: WRPR_PIL_I	wrpr	%r23, 0x01f3, %pil
	setx	0x20105, %g1, %o0
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
	.word 0xfe350000  ! 996: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xb5510000  ! 1003: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfc350000  ! 1004: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfc3da1a3  ! 1005: STD_I	std	%r30, [%r22 + 0x01a3]
	.word 0xf73d20ef  ! 1008: STDF_I	std	%f27, [0x00ef, %r20]
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 1019: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xb1508000  ! 1020: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf42cc000  ! 1026: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xb53de001  ! 1027: SRA_I	sra 	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983c43  ! 1028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c43, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb3c4000  ! 1031: STDF_R	std	%f29, [%r0, %r17]
	.word 0xf274c000  ! 1032: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf73d4000  ! 1033: STDF_R	std	%f27, [%r0, %r21]
	.word 0xfe2421b6  ! 1034: STW_I	stw	%r31, [%r16 + 0x01b6]
	.word 0xf835e13c  ! 1037: STH_I	sth	%r28, [%r23 + 0x013c]
	.word 0xfe35c000  ! 1039: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb1500000  ! 1045: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf235203e  ! 1047: STH_I	sth	%r25, [%r20 + 0x003e]
	setx	0x30233, %g1, %o0
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
	.word 0xb1504000  ! 1051: RDPR_TNPC	<illegal instruction>
	.word 0xf33ce0a9  ! 1052: STDF_I	std	%f25, [0x00a9, %r19]
	mov	0, %r12
	.word 0x8f932000  ! 1053: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf224a195  ! 1054: STW_I	stw	%r25, [%r18 + 0x0195]
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 1057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xfa254000  ! 1061: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xb3518000  ! 1065: RDPR_PSTATE	rdpr	%pstate, %r25
	mov	1, %r12
	.word 0x8f932000  ! 1066: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb32c7001  ! 1068: SLLX_I	sllx	%r17, 0x0001, %r25
	.word 0x8994200a  ! 1072: WRPR_TICK_I	wrpr	%r16, 0x000a, %tick
	setx	data_start_5, %g1, %r21
	.word 0xf8746174  ! 1074: STX_I	stx	%r28, [%r17 + 0x0174]
	.word 0xf235e074  ! 1075: STH_I	sth	%r25, [%r23 + 0x0074]
	setx	0x3021b, %g1, %o0
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
	.word 0xb22cc000  ! 1084: ANDN_R	andn 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d13  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d13, %hpstate
	.word 0xf27421dd  ! 1089: STX_I	stx	%r25, [%r16 + 0x01dd]
	.word 0xf03420f5  ! 1092: STH_I	sth	%r24, [%r16 + 0x00f5]
	.word 0xbf518000  ! 1095: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf824c000  ! 1096: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf93dc000  ! 1100: STDF_R	std	%f28, [%r0, %r23]
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2756190  ! 1110: STX_I	stx	%r25, [%r21 + 0x0190]
	.word 0xf02d21cc  ! 1113: STB_I	stb	%r24, [%r20 + 0x01cc]
	.word 0xfe2c4000  ! 1115: STB_R	stb	%r31, [%r17 + %r0]
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f13  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f13, %hpstate
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 1126: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfe258000  ! 1132: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xfe244000  ! 1134: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf53c210f  ! 1135: STDF_I	std	%f26, [0x010f, %r16]
	.word 0xf63da12f  ! 1136: STD_I	std	%r27, [%r22 + 0x012f]
	.word 0xf83d619f  ! 1138: STD_I	std	%r28, [%r21 + 0x019f]
	.word 0xfd3de190  ! 1142: STDF_I	std	%f30, [0x0190, %r23]
	.word 0xf23dc000  ! 1144: STD_R	std	%r25, [%r23 + %r0]
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4754000  ! 1147: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xb9540000  ! 1151: RDPR_GL	<illegal instruction>
	.word 0x91952161  ! 1154: WRPR_PIL_I	wrpr	%r20, 0x0161, %pil
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabce15b  ! 1156: XNORcc_I	xnorcc 	%r19, 0x015b, %r29
	setx	0x3032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 1158: MOVcc_I	<illegal instruction>
	.word 0xb61c60ab  ! 1168: XOR_I	xor 	%r17, 0x00ab, %r27
	.word 0x819560d3  ! 1170: WRPR_TPC_I	wrpr	%r21, 0x00d3, %tpc
	.word 0xff3d4000  ! 1171: STDF_R	std	%f31, [%r0, %r21]
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbead0000  ! 1174: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xf435c000  ! 1175: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfe3d8000  ! 1176: STD_R	std	%r31, [%r22 + %r0]
	.word 0xfe2521f9  ! 1178: STW_I	stw	%r31, [%r20 + 0x01f9]
	.word 0xf93c4000  ! 1181: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf82d8000  ! 1187: STB_R	stb	%r28, [%r22 + %r0]
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a073  ! 1198: WRPR_PIL_I	wrpr	%r22, 0x0073, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	setx	data_start_5, %g1, %r20
	.word 0xb150c000  ! 1203: RDPR_TT	rdpr	%tt, %r24
	setx	data_start_4, %g1, %r22
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3cc000  ! 1219: STDF_R	std	%f29, [%r0, %r19]
	setx	0x30036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 1222: STH_R	sth	%r31, [%r16 + %r0]
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe354000  ! 1225: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf02c600f  ! 1229: STB_I	stb	%r24, [%r17 + 0x000f]
	.word 0xb7508000  ! 1231: RDPR_TSTATE	<illegal instruction>
	.word 0xf835e007  ! 1232: STH_I	sth	%r28, [%r23 + 0x0007]
	.word 0xf0744000  ! 1233: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf8348000  ! 1235: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xb7354000  ! 1237: SRL_R	srl 	%r21, %r0, %r27
	.word 0x8995e07b  ! 1242: WRPR_TICK_I	wrpr	%r23, 0x007b, %tick
	.word 0xb015e0f5  ! 1246: OR_I	or 	%r23, 0x00f5, %r24
	.word 0xf73da1ce  ! 1247: STDF_I	std	%f27, [0x01ce, %r22]
	.word 0xbb508000  ! 1249: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf03c2080  ! 1251: STD_I	std	%r24, [%r16 + 0x0080]
	setx	data_start_7, %g1, %r22
	.word 0xf23d4000  ! 1253: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf474a031  ! 1254: STX_I	stx	%r26, [%r18 + 0x0031]
	.word 0xb7504000  ! 1255: RDPR_TNPC	<illegal instruction>
	.word 0xf035a11a  ! 1257: STH_I	sth	%r24, [%r22 + 0x011a]
	.word 0xf82d0000  ! 1258: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xb294219c  ! 1265: ORcc_I	orcc 	%r16, 0x019c, %r25
	.word 0xf0252188  ! 1268: STW_I	stw	%r24, [%r20 + 0x0188]
	.word 0xf43c215b  ! 1269: STD_I	std	%r26, [%r16 + 0x015b]
	.word 0xbe45c000  ! 1272: ADDC_R	addc 	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 1277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xf4240000  ! 1280: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf02d8000  ! 1281: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfc2520b3  ! 1283: STW_I	stw	%r30, [%r20 + 0x00b3]
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81983981  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1981, %hpstate
	.word 0x8794a1cf  ! 1292: WRPR_TT_I	wrpr	%r18, 0x01cf, %tt
	.word 0xf0758000  ! 1294: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfa74c000  ! 1297: STX_R	stx	%r29, [%r19 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 1299: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_0, %g1, %r21
	.word 0xfa3d4000  ! 1301: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf42420e9  ! 1304: STW_I	stw	%r26, [%r16 + 0x00e9]
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8758000  ! 1315: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf03dc000  ! 1319: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb1508000  ! 1320: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf82c0000  ! 1321: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb285e17f  ! 1323: ADDcc_I	addcc 	%r23, 0x017f, %r25
	.word 0xfe2de02d  ! 1325: STB_I	stb	%r31, [%r23 + 0x002d]
	.word 0xf02c4000  ! 1327: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xbd508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xf33c0000  ! 1333: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfa35c000  ! 1335: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xbeacc000  ! 1336: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0x83956149  ! 1338: WRPR_TNPC_I	wrpr	%r21, 0x0149, %tnpc
	.word 0xf42ca0de  ! 1341: STB_I	stb	%r26, [%r18 + 0x00de]
	.word 0xbf510000  ! 1342: RDPR_TICK	rdpr	%tick, %r31
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc140000  ! 1347: OR_R	or 	%r16, %r0, %r30
	.word 0xfb3c8000  ! 1349: STDF_R	std	%f29, [%r0, %r18]
	.word 0xf83c2139  ! 1351: STD_I	std	%r28, [%r16 + 0x0139]
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf024e11a  ! 1358: STW_I	stw	%r24, [%r19 + 0x011a]
	.word 0xbd518000  ! 1359: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf82c0000  ! 1365: STB_R	stb	%r28, [%r16 + %r0]
	setx	data_start_2, %g1, %r19
	.word 0xb7504000  ! 1368: RDPR_TNPC	<illegal instruction>
	.word 0xfc2c8000  ! 1369: STB_R	stb	%r30, [%r18 + %r0]
	.word 0x87942137  ! 1375: WRPR_TT_I	wrpr	%r16, 0x0137, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf03d8000  ! 1380: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf835c000  ! 1385: STH_R	sth	%r28, [%r23 + %r0]
	.word 0x879561c8  ! 1386: WRPR_TT_I	wrpr	%r21, 0x01c8, %tt
	.word 0xf93c6016  ! 1387: STDF_I	std	%f28, [0x0016, %r17]
	.word 0xb93c2001  ! 1391: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb134c000  ! 1392: SRL_R	srl 	%r19, %r0, %r24
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d0000  ! 1395: STDF_R	std	%f29, [%r0, %r20]
	.word 0xf434e0e9  ! 1396: STH_I	sth	%r26, [%r19 + 0x00e9]
	setx	data_start_6, %g1, %r22
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d0000  ! 1408: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf73c0000  ! 1410: STDF_R	std	%f27, [%r0, %r16]
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 1413: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e02f  ! 1423: WRPR_TT_I	wrpr	%r19, 0x002f, %tt
	.word 0x919521ba  ! 1426: WRPR_PIL_I	wrpr	%r20, 0x01ba, %pil
	setx	0x10234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6358000  ! 1428: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf62c21da  ! 1432: STB_I	stb	%r27, [%r16 + 0x01da]
	.word 0xf075c000  ! 1434: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x819561a0  ! 1435: WRPR_TPC_I	wrpr	%r21, 0x01a0, %tpc
	.word 0x8d95a099  ! 1437: WRPR_PSTATE_I	wrpr	%r22, 0x0099, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e99  ! 1438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e99, %hpstate
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 1440: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb1520000  ! 1442: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 1446: RDPR_TL	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0x8794e06d  ! 1450: WRPR_TT_I	wrpr	%r19, 0x006d, %tt
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 1452: RDPR_TT	rdpr	%tt, %r26
	setx	0x10206, %g1, %o0
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
	.word 0xf63c8000  ! 1459: STD_R	std	%r27, [%r18 + %r0]
	.word 0xbec4c000  ! 1460: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xb8344000  ! 1462: ORN_R	orn 	%r17, %r0, %r28
	.word 0xb69da01b  ! 1465: XORcc_I	xorcc 	%r22, 0x001b, %r27
	.word 0xf82d8000  ! 1466: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xbf504000  ! 1469: RDPR_TNPC	<illegal instruction>
	.word 0xfc244000  ! 1471: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf6250000  ! 1472: STW_R	stw	%r27, [%r20 + %r0]
	.word 0x8794a174  ! 1474: WRPR_TT_I	wrpr	%r18, 0x0174, %tt
	.word 0xb5520000  ! 1478: RDPR_PIL	rdpr	%pil, %r26
	.word 0xfe3421dd  ! 1479: STH_I	sth	%r31, [%r16 + 0x01dd]
	.word 0xb9504000  ! 1480: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 1482: RDPR_TPC	<illegal instruction>
	.word 0xfc754000  ! 1483: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfc344000  ! 1484: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbe84a003  ! 1485: ADDcc_I	addcc 	%r18, 0x0003, %r31
	.word 0xb2154000  ! 1488: OR_R	or 	%r21, %r0, %r25
	.word 0xf22c0000  ! 1490: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfc352169  ! 1491: STH_I	sth	%r30, [%r20 + 0x0169]
	.word 0xbcc561ce  ! 1494: ADDCcc_I	addccc 	%r21, 0x01ce, %r30
	.word 0xfe3ca071  ! 1503: STD_I	std	%r31, [%r18 + 0x0071]
	.word 0xb951c000  ! 1507: RDPR_TL	<illegal instruction>
	.word 0xf02d0000  ! 1509: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf73cc000  ! 1510: STDF_R	std	%f27, [%r0, %r19]
	.word 0xfa754000  ! 1512: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfc350000  ! 1514: STH_R	sth	%r30, [%r20 + %r0]
	setx	0x1021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c4000  ! 1518: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf53da086  ! 1520: STDF_I	std	%f26, [0x0086, %r22]
	.word 0xfe25612d  ! 1523: STW_I	stw	%r31, [%r21 + 0x012d]
	.word 0xf424e1ae  ! 1525: STW_I	stw	%r26, [%r19 + 0x01ae]
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 1533: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x9195a089  ! 1534: WRPR_PIL_I	wrpr	%r22, 0x0089, %pil
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1540: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe74e1aa  ! 1546: STX_I	stx	%r31, [%r19 + 0x01aa]
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d0000  ! 1556: STD_R	std	%r28, [%r20 + %r0]
	.word 0x8194a1ae  ! 1558: WRPR_TPC_I	wrpr	%r18, 0x01ae, %tpc
	.word 0xfa350000  ! 1560: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf43ca178  ! 1562: STD_I	std	%r26, [%r18 + 0x0178]
	.word 0xbabd602c  ! 1563: XNORcc_I	xnorcc 	%r21, 0x002c, %r29
	.word 0xf22521a0  ! 1564: STW_I	stw	%r25, [%r20 + 0x01a0]
	.word 0xb9510000  ! 1565: RDPR_TICK	rdpr	%tick, %r28
	setx	data_start_5, %g1, %r19
	.word 0xff3ce10b  ! 1567: STDF_I	std	%f31, [0x010b, %r19]
	.word 0xf025c000  ! 1570: STW_R	stw	%r24, [%r23 + %r0]
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d4000  ! 1576: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf02520d5  ! 1579: STW_I	stw	%r24, [%r20 + 0x00d5]
	.word 0xf83521a6  ! 1580: STH_I	sth	%r28, [%r20 + 0x01a6]
	.word 0xb0b4e104  ! 1581: ORNcc_I	orncc 	%r19, 0x0104, %r24
	.word 0xf03d0000  ! 1584: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf13c212a  ! 1590: STDF_I	std	%f24, [0x012a, %r16]
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2354000  ! 1597: STH_R	sth	%r25, [%r21 + %r0]
	.word 0x879421d5  ! 1598: WRPR_TT_I	wrpr	%r16, 0x01d5, %tt
	.word 0xf03c20f2  ! 1599: STD_I	std	%r24, [%r16 + 0x00f2]
	.word 0xf22d2003  ! 1601: STB_I	stb	%r25, [%r20 + 0x0003]
	.word 0xf6750000  ! 1602: STX_R	stx	%r27, [%r20 + %r0]
	setx	data_start_4, %g1, %r18
	.word 0xfb3ce1fa  ! 1605: STDF_I	std	%f29, [0x01fa, %r19]
	.word 0xb550c000  ! 1607: RDPR_TT	rdpr	%tt, %r26
	.word 0xf835a1b6  ! 1610: STH_I	sth	%r28, [%r22 + 0x01b6]
	mov	2, %r14
	.word 0xa193a000  ! 1611: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa24a0df  ! 1620: STW_I	stw	%r29, [%r18 + 0x00df]
	.word 0xf62ce1ce  ! 1621: STB_I	stb	%r27, [%r19 + 0x01ce]
	.word 0xf424a09d  ! 1624: STW_I	stw	%r26, [%r18 + 0x009d]
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74e1ff  ! 1626: STX_I	stx	%r31, [%r19 + 0x01ff]
	.word 0xb82d208f  ! 1627: ANDN_I	andn 	%r20, 0x008f, %r28
	.word 0x9194e14e  ! 1628: WRPR_PIL_I	wrpr	%r19, 0x014e, %pil
	.word 0xbe94a0a0  ! 1629: ORcc_I	orcc 	%r18, 0x00a0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e41  ! 1631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xb4bdc000  ! 1633: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xf22421a0  ! 1636: STW_I	stw	%r25, [%r16 + 0x01a0]
	setx	0x20020, %g1, %o0
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
	.word 0x8d95e064  ! 1645: WRPR_PSTATE_I	wrpr	%r23, 0x0064, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 1650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	.word 0xf63d0000  ! 1651: STD_R	std	%r27, [%r20 + %r0]
	setx	data_start_6, %g1, %r16
	.word 0xbb510000  ! 1653: RDPR_TICK	rdpr	%tick, %r29
	setx	data_start_3, %g1, %r19
	.word 0xb93da001  ! 1656: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xb234e17b  ! 1658: ORN_I	orn 	%r19, 0x017b, %r25
	.word 0xf93d0000  ! 1659: STDF_R	std	%f28, [%r0, %r20]
	.word 0xbe358000  ! 1660: SUBC_R	orn 	%r22, %r0, %r31
	.word 0xf474c000  ! 1663: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xbb500000  ! 1665: RDPR_TPC	<illegal instruction>
	.word 0xfe2da07f  ! 1667: STB_I	stb	%r31, [%r22 + 0x007f]
	setx	0x20200, %g1, %o0
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
	mov	0, %r14
	.word 0xa193a000  ! 1672: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03d8000  ! 1673: STD_R	std	%r24, [%r22 + %r0]
	.word 0xb551c000  ! 1676: RDPR_TL	rdpr	%tl, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982853  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0853, %hpstate
	.word 0xfc7561f4  ! 1680: STX_I	stx	%r30, [%r21 + 0x01f4]
	.word 0x8594a1a9  ! 1682: WRPR_TSTATE_I	wrpr	%r18, 0x01a9, %tstate
	.word 0xf42d60be  ! 1687: STB_I	stb	%r26, [%r21 + 0x00be]
	.word 0xff3cc000  ! 1690: STDF_R	std	%f31, [%r0, %r19]
	.word 0xb6b42140  ! 1691: SUBCcc_I	orncc 	%r16, 0x0140, %r27
	.word 0xfc3de0f5  ! 1699: STD_I	std	%r30, [%r23 + 0x00f5]
	.word 0xf22c8000  ! 1701: STB_R	stb	%r25, [%r18 + %r0]
	setx	data_start_3, %g1, %r23
	.word 0xf23c60ee  ! 1708: STD_I	std	%r25, [%r17 + 0x00ee]
	.word 0xff3d6072  ! 1709: STDF_I	std	%f31, [0x0072, %r21]
	.word 0xbb500000  ! 1710: RDPR_TPC	rdpr	%tpc, %r29
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 1721: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf63ca1ca  ! 1724: STD_I	std	%r27, [%r18 + 0x01ca]
	.word 0xb6bd206d  ! 1728: XNORcc_I	xnorcc 	%r20, 0x006d, %r27
	.word 0xf63d203a  ! 1729: STD_I	std	%r27, [%r20 + 0x003a]
	mov	1, %r12
	.word 0x8f932000  ! 1734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x89946016  ! 1736: WRPR_TICK_I	wrpr	%r17, 0x0016, %tick
	.word 0xfa3c8000  ! 1738: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf035a1b5  ! 1742: STH_I	sth	%r24, [%r22 + 0x01b5]
	.word 0xf23ca045  ! 1750: STD_I	std	%r25, [%r18 + 0x0045]
	.word 0xfc3de08f  ! 1753: STD_I	std	%r30, [%r23 + 0x008f]
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 1760: RDPR_TICK	rdpr	%tick, %r27
	.word 0xbe3561a0  ! 1761: SUBC_I	orn 	%r21, 0x01a0, %r31
	.word 0xfa348000  ! 1768: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfe2d8000  ! 1770: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf875e17b  ! 1774: STX_I	stx	%r28, [%r23 + 0x017b]
	mov	1, %r14
	.word 0xa193a000  ! 1775: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 1777: STB_R	stb	%r29, [%r20 + %r0]
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49ce0cb  ! 1789: XORcc_I	xorcc 	%r19, 0x00cb, %r26
	.word 0x8d95a0d6  ! 1793: WRPR_PSTATE_I	wrpr	%r22, 0x00d6, %pstate
	.word 0xf83c8000  ! 1800: STD_R	std	%r28, [%r18 + %r0]
	.word 0xf23d8000  ! 1803: STD_R	std	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf435c000  ! 1806: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xba15c000  ! 1807: OR_R	or 	%r23, %r0, %r29
	.word 0xf13d213e  ! 1808: STDF_I	std	%f24, [0x013e, %r20]
	ta	T_CHANGE_HPRIV
	.word 0x81983c83  ! 1810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c83, %hpstate
	.word 0xfc354000  ! 1811: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfe744000  ! 1813: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xbb50c000  ! 1814: RDPR_TT	rdpr	%tt, %r29
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53ca05d  ! 1820: STDF_I	std	%f26, [0x005d, %r18]
	.word 0xb83c8000  ! 1821: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xf2248000  ! 1823: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf93ce01c  ! 1827: STDF_I	std	%f28, [0x001c, %r19]
	setx	data_start_7, %g1, %r22
	.word 0xbf520000  ! 1837: RDPR_PIL	<illegal instruction>
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a124  ! 1840: WRPR_PIL_I	wrpr	%r22, 0x0124, %pil
	.word 0xfa348000  ! 1842: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa754000  ! 1846: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf23d6117  ! 1847: STD_I	std	%r25, [%r21 + 0x0117]
	.word 0xf0244000  ! 1850: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf33c8000  ! 1852: STDF_R	std	%f25, [%r0, %r18]
	.word 0xfa2d4000  ! 1853: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xbb508000  ! 1861: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf03420eb  ! 1862: STH_I	sth	%r24, [%r16 + 0x00eb]
	.word 0xb81d4000  ! 1863: XOR_R	xor 	%r21, %r0, %r28
	.word 0xbd2c9000  ! 1864: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xf23de001  ! 1869: STD_I	std	%r25, [%r23 + 0x0001]
	.word 0xb5518000  ! 1870: RDPR_PSTATE	<illegal instruction>
	.word 0xf634c000  ! 1873: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfe74c000  ! 1876: STX_R	stx	%r31, [%r19 + %r0]
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2346177  ! 1880: STH_I	sth	%r25, [%r17 + 0x0177]
	.word 0x8395606c  ! 1881: WRPR_TNPC_I	wrpr	%r21, 0x006c, %tnpc
	.word 0xb7504000  ! 1883: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf73da10b  ! 1884: STDF_I	std	%f27, [0x010b, %r22]
	.word 0xfa2dc000  ! 1885: STB_R	stb	%r29, [%r23 + %r0]
	.word 0x8195e040  ! 1886: WRPR_TPC_I	wrpr	%r23, 0x0040, %tpc
	.word 0xb42d20b3  ! 1887: ANDN_I	andn 	%r20, 0x00b3, %r26
	.word 0xfc3c61ee  ! 1889: STD_I	std	%r30, [%r17 + 0x01ee]
	.word 0xf02d2071  ! 1896: STB_I	stb	%r24, [%r20 + 0x0071]
	.word 0xb1504000  ! 1902: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb550c000  ! 1906: RDPR_TT	<illegal instruction>
	.word 0x89942150  ! 1908: WRPR_TICK_I	wrpr	%r16, 0x0150, %tick
	mov	1, %r12
	.word 0x8f932000  ! 1909: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc350000  ! 1910: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf13c8000  ! 1912: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf83d4000  ! 1915: STD_R	std	%r28, [%r21 + %r0]
	.word 0xb40d8000  ! 1918: AND_R	and 	%r22, %r0, %r26
	.word 0xf4740000  ! 1922: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf2344000  ! 1923: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf82c2162  ! 1924: STB_I	stb	%r28, [%r16 + 0x0162]
	.word 0xf33de0ed  ! 1927: STDF_I	std	%f25, [0x00ed, %r23]
	.word 0xf075202d  ! 1929: STX_I	stx	%r24, [%r20 + 0x002d]
	.word 0xfe3c0000  ! 1932: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf53d8000  ! 1935: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf275a071  ! 1936: STX_I	stx	%r25, [%r22 + 0x0071]
	.word 0xb3504000  ! 1937: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfc752015  ! 1940: STX_I	stx	%r30, [%r20 + 0x0015]
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca0ac  ! 1942: STB_I	stb	%r30, [%r18 + 0x00ac]
	.word 0xfc3d0000  ! 1945: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf42c8000  ! 1946: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf22cc000  ! 1947: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xb3500000  ! 1952: RDPR_TPC	<illegal instruction>
	.word 0x8995a1f8  ! 1955: WRPR_TICK_I	wrpr	%r22, 0x01f8, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xfe3cc000  ! 1962: STD_R	std	%r31, [%r19 + %r0]
	.word 0x91942095  ! 1966: WRPR_PIL_I	wrpr	%r16, 0x0095, %pil
	.word 0xfe24c000  ! 1967: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe2ce1b8  ! 1969: STB_I	stb	%r31, [%r19 + 0x01b8]
	.word 0xfc240000  ! 1970: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfc35a199  ! 1972: STH_I	sth	%r30, [%r22 + 0x0199]
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2de12b  ! 1981: ANDN_I	andn 	%r23, 0x012b, %r31
	.word 0xf53d8000  ! 1983: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf02c8000  ! 1993: STB_R	stb	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xf93d21e1  ! 1998: STDF_I	std	%f28, [0x01e1, %r20]
	mov	0, %r14
	.word 0xa193a000  ! 2000: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a0a2  ! 2007: WRPR_PSTATE_I	wrpr	%r22, 0x00a2, %pstate
	.word 0x8395e125  ! 2009: WRPR_TNPC_I	wrpr	%r23, 0x0125, %tnpc
	.word 0xb5510000  ! 2011: RDPR_TICK	rdpr	%tick, %r26
	mov	1, %r14
	.word 0xa193a000  ! 2014: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02561a3  ! 2018: STW_I	stw	%r24, [%r21 + 0x01a3]
	.word 0xbf508000  ! 2020: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf73c4000  ! 2021: STDF_R	std	%f27, [%r0, %r17]
	mov	2, %r14
	.word 0xa193a000  ! 2027: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4444000  ! 2028: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xb1510000  ! 2029: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb33d9000  ! 2030: SRAX_R	srax	%r22, %r0, %r25
	.word 0x8195e1cc  ! 2036: WRPR_TPC_I	wrpr	%r23, 0x01cc, %tpc
	.word 0xfa344000  ! 2037: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfa344000  ! 2039: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf93dc000  ! 2042: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf33d4000  ! 2043: STDF_R	std	%f25, [%r0, %r21]
	setx	data_start_3, %g1, %r18
	.word 0xf6752030  ! 2048: STX_I	stx	%r27, [%r20 + 0x0030]
	.word 0xb9480000  ! 2059: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x20104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6348000  ! 2066: ORN_R	orn 	%r18, %r0, %r27
	.word 0xf0348000  ! 2067: STH_R	sth	%r24, [%r18 + %r0]
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 2077: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf6758000  ! 2080: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xb9480000  ! 2084: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb8452000  ! 2085: ADDC_I	addc 	%r20, 0x0000, %r28
	.word 0x8395a1ce  ! 2089: WRPR_TNPC_I	wrpr	%r22, 0x01ce, %tnpc
	.word 0xfc75213b  ! 2091: STX_I	stx	%r30, [%r20 + 0x013b]
	.word 0xf22de103  ! 2093: STB_I	stb	%r25, [%r23 + 0x0103]
	.word 0xf025612d  ! 2094: STW_I	stw	%r24, [%r21 + 0x012d]
	.word 0xf73de0e6  ! 2096: STDF_I	std	%f27, [0x00e6, %r23]
	.word 0xbd540000  ! 2100: RDPR_GL	rdpr	%-, %r30
	.word 0xbb50c000  ! 2101: RDPR_TT	<illegal instruction>
	.word 0xf03d21c1  ! 2105: STD_I	std	%r24, [%r20 + 0x01c1]
	.word 0xb62c8000  ! 2107: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xfc2d0000  ! 2108: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb32cf001  ! 2109: SLLX_I	sllx	%r19, 0x0001, %r25
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983e83  ! 2114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e83, %hpstate
	.word 0xbab5a0e7  ! 2115: SUBCcc_I	orncc 	%r22, 0x00e7, %r29
	.word 0xbb480000  ! 2116: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf074c000  ! 2118: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf23c2035  ! 2120: STD_I	std	%r25, [%r16 + 0x0035]
	.word 0xf034a06f  ! 2121: STH_I	sth	%r24, [%r18 + 0x006f]
	.word 0xfc3ca0ba  ! 2123: STD_I	std	%r30, [%r18 + 0x00ba]
	.word 0xf675611b  ! 2124: STX_I	stx	%r27, [%r21 + 0x011b]
	.word 0xf8254000  ! 2126: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xb3480000  ! 2129: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d6027  ! 2131: STB_I	stb	%r27, [%r21 + 0x0027]
	.word 0xba0421aa  ! 2132: ADD_I	add 	%r16, 0x01aa, %r29
	.word 0xf23d210c  ! 2134: STD_I	std	%r25, [%r20 + 0x010c]
	.word 0xf474c000  ! 2135: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xff3c8000  ! 2138: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf42c8000  ! 2141: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfe3c8000  ! 2142: STD_R	std	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 2144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e165  ! 2147: WRPR_TPC_I	wrpr	%r19, 0x0165, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 2148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0xb5504000  ! 2149: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc744000  ! 2151: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf47460ec  ! 2153: STX_I	stx	%r26, [%r17 + 0x00ec]
	.word 0xf03c2091  ! 2155: STD_I	std	%r24, [%r16 + 0x0091]
	setx	0x30022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82de036  ! 2159: STB_I	stb	%r28, [%r23 + 0x0036]
	mov	2, %r14
	.word 0xa193a000  ! 2161: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6758000  ! 2163: STX_R	stx	%r27, [%r22 + %r0]
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a183  ! 2166: WRPR_TSTATE_I	wrpr	%r22, 0x0183, %tstate
	.word 0xf074a05a  ! 2167: STX_I	stx	%r24, [%r18 + 0x005a]
	.word 0xb1500000  ! 2174: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf73cc000  ! 2177: STDF_R	std	%f27, [%r0, %r19]
	.word 0x9194a1d3  ! 2182: WRPR_PIL_I	wrpr	%r18, 0x01d3, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983953  ! 2183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1953, %hpstate
	.word 0xf73c0000  ! 2189: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb01c6028  ! 2197: XOR_I	xor 	%r17, 0x0028, %r24
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2203: RDPR_GL	rdpr	%-, %r31
	.word 0xb1500000  ! 2205: RDPR_TPC	<illegal instruction>
	.word 0xfc2cc000  ! 2207: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf035e15b  ! 2209: STH_I	sth	%r24, [%r23 + 0x015b]
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4348000  ! 2212: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf024c000  ! 2213: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb4a5a16d  ! 2214: SUBcc_I	subcc 	%r22, 0x016d, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b19  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0xf43cc000  ! 2218: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf53c21b8  ! 2221: STDF_I	std	%f26, [0x01b8, %r16]
	.word 0x85946038  ! 2222: WRPR_TSTATE_I	wrpr	%r17, 0x0038, %tstate
	.word 0xfc2d2052  ! 2226: STB_I	stb	%r30, [%r20 + 0x0052]
	.word 0x89952071  ! 2228: WRPR_TICK_I	wrpr	%r20, 0x0071, %tick
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24603c  ! 2231: STW_I	stw	%r29, [%r17 + 0x003c]
	.word 0xfa754000  ! 2232: STX_R	stx	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b1b  ! 2233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1b, %hpstate
	.word 0xf8248000  ! 2236: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xbd480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfe742069  ! 2239: STX_I	stx	%r31, [%r16 + 0x0069]
	.word 0xb3508000  ! 2240: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e1de  ! 2241: WRPR_PIL_I	wrpr	%r23, 0x01de, %pil
	.word 0xb9480000  ! 2242: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2244: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfe25e042  ! 2246: STW_I	stw	%r31, [%r23 + 0x0042]
	mov	1, %r14
	.word 0xa193a000  ! 2251: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf025c000  ! 2253: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf6256034  ! 2258: STW_I	stw	%r27, [%r21 + 0x0034]
	.word 0xbd520000  ! 2259: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfe3c8000  ! 2263: STD_R	std	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d4b  ! 2266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4b, %hpstate
	.word 0xb5480000  ! 2268: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbaac4000  ! 2269: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xb1520000  ! 2270: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982bc3  ! 2271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0xbf51c000  ! 2275: RDPR_TL	rdpr	%tl, %r31
	.word 0xf43d4000  ! 2277: STD_R	std	%r26, [%r21 + %r0]
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9521f5  ! 2279: WRPR_PSTATE_I	wrpr	%r20, 0x01f5, %pstate
	.word 0xbd643801  ! 2280: MOVcc_I	<illegal instruction>
	setx	0x1011d, %g1, %o0
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
	.word 0x81982ecb  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0x8794603b  ! 2287: WRPR_TT_I	wrpr	%r17, 0x003b, %tt
	.word 0xb635c000  ! 2288: ORN_R	orn 	%r23, %r0, %r27
	.word 0xf23c0000  ! 2296: STD_R	std	%r25, [%r16 + %r0]
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	.word 0xbea44000  ! 2301: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xf43cc000  ! 2303: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb3510000  ! 2305: RDPR_TICK	rdpr	%tick, %r25
	.word 0xfa252043  ! 2310: STW_I	stw	%r29, [%r20 + 0x0043]
	.word 0xf83da1e1  ! 2311: STD_I	std	%r28, [%r22 + 0x01e1]
	.word 0xf4344000  ! 2317: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb551c000  ! 2321: RDPR_TL	<illegal instruction>
	.word 0xfb3dc000  ! 2324: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfa752115  ! 2326: STX_I	stx	%r29, [%r20 + 0x0115]
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 2329: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xbeb561bc  ! 2333: ORNcc_I	orncc 	%r21, 0x01bc, %r31
	.word 0xf22d8000  ! 2335: STB_R	stb	%r25, [%r22 + %r0]
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3da041  ! 2339: STDF_I	std	%f31, [0x0041, %r22]
	.word 0xf0350000  ! 2342: STH_R	sth	%r24, [%r20 + %r0]
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2352: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 2355: STB_R	stb	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x81946172  ! 2357: WRPR_TPC_I	wrpr	%r17, 0x0172, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x859520af  ! 2368: WRPR_TSTATE_I	wrpr	%r20, 0x00af, %tstate
	.word 0xb1500000  ! 2372: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x839460b8  ! 2373: WRPR_TNPC_I	wrpr	%r17, 0x00b8, %tnpc
	.word 0xbd2de001  ! 2377: SLL_I	sll 	%r23, 0x0001, %r30
	.word 0xbf2d1000  ! 2378: SLLX_R	sllx	%r20, %r0, %r31
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 2384: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf03da142  ! 2385: STD_I	std	%r24, [%r22 + 0x0142]
	.word 0xb9340000  ! 2386: SRL_R	srl 	%r16, %r0, %r28
	.word 0xbf504000  ! 2387: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb03d4000  ! 2388: XNOR_R	xnor 	%r21, %r0, %r24
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf274e04e  ! 2395: STX_I	stx	%r25, [%r19 + 0x004e]
	.word 0xbb2c1000  ! 2401: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xb00c4000  ! 2406: AND_R	and 	%r17, %r0, %r24
	.word 0xfa2ce01c  ! 2411: STB_I	stb	%r29, [%r19 + 0x001c]
	.word 0xf6348000  ! 2412: STH_R	sth	%r27, [%r18 + %r0]
	setx	data_start_2, %g1, %r21
	.word 0x89956035  ! 2415: WRPR_TICK_I	wrpr	%r21, 0x0035, %tick
	.word 0x8794e00c  ! 2417: WRPR_TT_I	wrpr	%r19, 0x000c, %tt
	.word 0xba9da00c  ! 2419: XORcc_I	xorcc 	%r22, 0x000c, %r29
	.word 0xf82c8000  ! 2420: STB_R	stb	%r28, [%r18 + %r0]
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 2428: RDPR_TL	rdpr	%tl, %r25
	.word 0xbb504000  ! 2429: RDPR_TNPC	<illegal instruction>
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	.word 0xf23d8000  ! 2434: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf82d203e  ! 2435: STB_I	stb	%r28, [%r20 + 0x003e]
	.word 0xf82d0000  ! 2436: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xbcb58000  ! 2439: ORNcc_R	orncc 	%r22, %r0, %r30
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc25e1b0  ! 2443: STW_I	stw	%r30, [%r23 + 0x01b0]
	.word 0xbd510000  ! 2447: RDPR_TICK	<illegal instruction>
	.word 0xb32d3001  ! 2449: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xf07560e9  ! 2451: STX_I	stx	%r24, [%r21 + 0x00e9]
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c213f  ! 2454: STD_I	std	%r24, [%r16 + 0x013f]
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf635e086  ! 2462: STH_I	sth	%r27, [%r23 + 0x0086]
	.word 0xb494215b  ! 2464: ORcc_I	orcc 	%r16, 0x015b, %r26
	.word 0xfa250000  ! 2471: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xbf504000  ! 2472: RDPR_TNPC	<illegal instruction>
	.word 0xff3d2071  ! 2474: STDF_I	std	%f31, [0x0071, %r20]
	.word 0xf13d212a  ! 2476: STDF_I	std	%f24, [0x012a, %r20]
	.word 0x8595a118  ! 2477: WRPR_TSTATE_I	wrpr	%r22, 0x0118, %tstate
	.word 0xf225c000  ! 2484: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf02da1cb  ! 2486: STB_I	stb	%r24, [%r22 + 0x01cb]
	.word 0x8d94e083  ! 2487: WRPR_PSTATE_I	wrpr	%r19, 0x0083, %pstate
	.word 0xbf354000  ! 2490: SRL_R	srl 	%r21, %r0, %r31
	.word 0xba3561b3  ! 2491: SUBC_I	orn 	%r21, 0x01b3, %r29
	.word 0xf4240000  ! 2492: STW_R	stw	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb21d4000  ! 2494: XOR_R	xor 	%r21, %r0, %r25
	.word 0xb6a48000  ! 2495: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xfc24c000  ! 2501: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf2740000  ! 2502: STX_R	stx	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982d89  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d89, %hpstate
	.word 0xf2248000  ! 2509: STW_R	stw	%r25, [%r18 + %r0]
	setx	0x10239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 2514: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf73c613d  ! 2515: STDF_I	std	%f27, [0x013d, %r17]
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675614f  ! 2522: STX_I	stx	%r27, [%r21 + 0x014f]
	.word 0xf53dc000  ! 2523: STDF_R	std	%f26, [%r0, %r23]
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25a192  ! 2527: STW_I	stw	%r29, [%r22 + 0x0192]
	.word 0xb8a4a136  ! 2530: SUBcc_I	subcc 	%r18, 0x0136, %r28
	.word 0xfe740000  ! 2532: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfe74c000  ! 2536: STX_R	stx	%r31, [%r19 + %r0]
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43dc000  ! 2542: STD_R	std	%r26, [%r23 + %r0]
	.word 0xfc344000  ! 2543: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfe3da00a  ! 2544: STD_I	std	%r31, [%r22 + 0x000a]
	.word 0xb62c61be  ! 2548: ANDN_I	andn 	%r17, 0x01be, %r27
	.word 0xb1508000  ! 2551: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfe2d8000  ! 2553: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf43ce1f2  ! 2556: STD_I	std	%r26, [%r19 + 0x01f2]
	.word 0xbf480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf0346152  ! 2559: STH_I	sth	%r24, [%r17 + 0x0152]
	.word 0xbc24a0e3  ! 2560: SUB_I	sub 	%r18, 0x00e3, %r30
	.word 0xb81dc000  ! 2561: XOR_R	xor 	%r23, %r0, %r28
	.word 0xf13c4000  ! 2564: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf02561da  ! 2565: STW_I	stw	%r24, [%r21 + 0x01da]
	.word 0xb550c000  ! 2569: RDPR_TT	<illegal instruction>
	.word 0xbf2da001  ! 2572: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xfe248000  ! 2581: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf62460a3  ! 2582: STW_I	stw	%r27, [%r17 + 0x00a3]
	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d4000  ! 2594: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf43de10e  ! 2597: STD_I	std	%r26, [%r23 + 0x010e]
	.word 0x8795e11c  ! 2604: WRPR_TT_I	wrpr	%r23, 0x011c, %tt
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 2607: RDPR_TICK	rdpr	%tick, %r26
	.word 0x819560d2  ! 2609: WRPR_TPC_I	wrpr	%r21, 0x00d2, %tpc
	.word 0x899460f2  ! 2611: WRPR_TICK_I	wrpr	%r17, 0x00f2, %tick
	.word 0xf635a113  ! 2613: STH_I	sth	%r27, [%r22 + 0x0113]
	.word 0x8594a08f  ! 2614: WRPR_TSTATE_I	wrpr	%r18, 0x008f, %tstate
	.word 0xf6740000  ! 2615: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfc34e167  ! 2616: STH_I	sth	%r30, [%r19 + 0x0167]
	.word 0x819521f1  ! 2617: WRPR_TPC_I	wrpr	%r20, 0x01f1, %tpc
	.word 0xf6240000  ! 2626: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf424e192  ! 2628: STW_I	stw	%r26, [%r19 + 0x0192]
	.word 0xbf540000  ! 2629: RDPR_GL	rdpr	%-, %r31
	.word 0x8194a18f  ! 2631: WRPR_TPC_I	wrpr	%r18, 0x018f, %tpc
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d8000  ! 2634: STDF_R	std	%f31, [%r0, %r22]
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6352097  ! 2639: STH_I	sth	%r27, [%r20 + 0x0097]
	.word 0x9194a11a  ! 2642: WRPR_PIL_I	wrpr	%r18, 0x011a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982d11  ! 2643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d11, %hpstate
	.word 0x8794e062  ! 2644: WRPR_TT_I	wrpr	%r19, 0x0062, %tt
	.word 0xbe0421dc  ! 2646: ADD_I	add 	%r16, 0x01dc, %r31
	mov	2, %r14
	.word 0xa193a000  ! 2648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03520b4  ! 2652: STH_I	sth	%r24, [%r20 + 0x00b4]
	.word 0xf53d8000  ! 2653: STDF_R	std	%f26, [%r0, %r22]
	.word 0xbf7d6401  ! 2654: MOVR_I	movre	%r21, 0x1, %r31
	.word 0xf83c8000  ! 2655: STD_R	std	%r28, [%r18 + %r0]
	setx	data_start_2, %g1, %r17
	.word 0xb7510000  ! 2662: RDPR_TICK	rdpr	%tick, %r27
	setx	data_start_5, %g1, %r19
	.word 0xb7510000  ! 2667: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2669: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf508000  ! 2673: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbd540000  ! 2675: RDPR_GL	<illegal instruction>
	.word 0x8794204f  ! 2676: WRPR_TT_I	wrpr	%r16, 0x004f, %tt
	mov	1, %r14
	.word 0xa193a000  ! 2683: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbaac4000  ! 2689: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xfa75611b  ! 2692: STX_I	stx	%r29, [%r21 + 0x011b]
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 2693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xbb518000  ! 2694: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0x8595e195  ! 2695: WRPR_TSTATE_I	wrpr	%r23, 0x0195, %tstate
	.word 0xf6240000  ! 2696: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xb151c000  ! 2697: RDPR_TL	rdpr	%tl, %r24
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2699: RDPR_GL	<illegal instruction>
	.word 0xb9500000  ! 2702: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf93c4000  ! 2705: STDF_R	std	%f28, [%r0, %r17]
	.word 0x9195e1df  ! 2706: WRPR_PIL_I	wrpr	%r23, 0x01df, %pil
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b91  ! 2711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	setx	data_start_2, %g1, %r20
	.word 0xf53d4000  ! 2716: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf8246085  ! 2718: STW_I	stw	%r28, [%r17 + 0x0085]
	.word 0xbd508000  ! 2721: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8594a093  ! 2723: WRPR_TSTATE_I	wrpr	%r18, 0x0093, %tstate
	.word 0xf2758000  ! 2724: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf675e166  ! 2727: STX_I	stx	%r27, [%r23 + 0x0166]
	.word 0xf6754000  ! 2729: STX_R	stx	%r27, [%r21 + %r0]
	.word 0x8995a0c4  ! 2732: WRPR_TICK_I	wrpr	%r22, 0x00c4, %tick
	.word 0x8195e134  ! 2733: WRPR_TPC_I	wrpr	%r23, 0x0134, %tpc
	.word 0xfc2d0000  ! 2735: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xbb2d6001  ! 2736: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xb5540000  ! 2737: RDPR_GL	rdpr	%-, %r26
	.word 0xf8242104  ! 2746: STW_I	stw	%r28, [%r16 + 0x0104]
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2751: RDPR_TL	<illegal instruction>
	.word 0xfc7460c1  ! 2753: STX_I	stx	%r30, [%r17 + 0x00c1]
	.word 0xb7510000  ! 2754: RDPR_TICK	rdpr	%tick, %r27
	setx	0x20207, %g1, %o0
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
	.word 0xbe94c000  ! 2760: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xb351c000  ! 2761: RDPR_TL	<illegal instruction>
	.word 0xf235c000  ! 2762: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xff3cc000  ! 2763: STDF_R	std	%f31, [%r0, %r19]
	.word 0xfe24e0e1  ! 2765: STW_I	stw	%r31, [%r19 + 0x00e1]
	setx	data_start_6, %g1, %r23
	.word 0xb234e14c  ! 2768: ORN_I	orn 	%r19, 0x014c, %r25
	.word 0xfe2d20f8  ! 2771: STB_I	stb	%r31, [%r20 + 0x00f8]
	.word 0xbd480000  ! 2773: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 2784: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf6340000  ! 2787: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xbd510000  ! 2788: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf13c2041  ! 2790: STDF_I	std	%f24, [0x0041, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81983903  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1903, %hpstate
	.word 0xbf510000  ! 2792: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf4756004  ! 2799: STX_I	stx	%r26, [%r21 + 0x0004]
	.word 0xba05a0a1  ! 2801: ADD_I	add 	%r22, 0x00a1, %r29
	.word 0xfc744000  ! 2806: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf2244000  ! 2809: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xfe34c000  ! 2810: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf23520c3  ! 2813: STH_I	sth	%r25, [%r20 + 0x00c3]
	.word 0x8795a06d  ! 2814: WRPR_TT_I	wrpr	%r22, 0x006d, %tt
	.word 0x899561ee  ! 2815: WRPR_TICK_I	wrpr	%r21, 0x01ee, %tick
	.word 0xfe758000  ! 2818: STX_R	stx	%r31, [%r22 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0xfe74210f  ! 2821: STX_I	stx	%r31, [%r16 + 0x010f]
	.word 0xf62de1b3  ! 2823: STB_I	stb	%r27, [%r23 + 0x01b3]
	.word 0xf475c000  ! 2826: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xb89d2107  ! 2827: XORcc_I	xorcc 	%r20, 0x0107, %r28
	.word 0xf42de07e  ! 2831: STB_I	stb	%r26, [%r23 + 0x007e]
	.word 0xf83d60cb  ! 2833: STD_I	std	%r28, [%r21 + 0x00cb]
	.word 0xfd3dc000  ! 2834: STDF_R	std	%f30, [%r0, %r23]
	.word 0x9195a040  ! 2835: WRPR_PIL_I	wrpr	%r22, 0x0040, %pil
	.word 0xfc3c4000  ! 2837: STD_R	std	%r30, [%r17 + %r0]
	.word 0xfc2c603d  ! 2838: STB_I	stb	%r30, [%r17 + 0x003d]
	.word 0xf6340000  ! 2839: STH_R	sth	%r27, [%r16 + %r0]
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf474c000  ! 2849: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfe25c000  ! 2851: STW_R	stw	%r31, [%r23 + %r0]
	.word 0x8995a0ef  ! 2852: WRPR_TICK_I	wrpr	%r22, 0x00ef, %tick
	.word 0xfb3d20de  ! 2854: STDF_I	std	%f29, [0x00de, %r20]
	.word 0xfc3c6027  ! 2856: STD_I	std	%r30, [%r17 + 0x0027]
	.word 0xfa2da158  ! 2859: STB_I	stb	%r29, [%r22 + 0x0158]
	.word 0xb834e05e  ! 2863: ORN_I	orn 	%r19, 0x005e, %r28
	.word 0xfa3de147  ! 2864: STD_I	std	%r29, [%r23 + 0x0147]
	.word 0xf835c000  ! 2865: STH_R	sth	%r28, [%r23 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 2868: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa3d2100  ! 2871: STD_I	std	%r29, [%r20 + 0x0100]
	.word 0xbf540000  ! 2872: RDPR_GL	rdpr	%-, %r31
	.word 0xf73c8000  ! 2873: STDF_R	std	%f27, [%r0, %r18]
	.word 0xf13c20a8  ! 2874: STDF_I	std	%f24, [0x00a8, %r16]
	.word 0xbf518000  ! 2875: RDPR_PSTATE	<illegal instruction>
	.word 0xf6248000  ! 2876: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xbb643801  ! 2881: MOVcc_I	<illegal instruction>
	.word 0xbaad61e9  ! 2894: ANDNcc_I	andncc 	%r21, 0x01e9, %r29
	.word 0xb1510000  ! 2895: RDPR_TICK	<illegal instruction>
	.word 0xb57d8400  ! 2899: MOVR_R	movre	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	.word 0xfe254000  ! 2901: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf6250000  ! 2902: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfc2de136  ! 2903: STB_I	stb	%r30, [%r23 + 0x0136]
	.word 0xbec4e146  ! 2907: ADDCcc_I	addccc 	%r19, 0x0146, %r31
	.word 0xbb2c6001  ! 2908: SLL_I	sll 	%r17, 0x0001, %r29
	.word 0x9194207b  ! 2909: WRPR_PIL_I	wrpr	%r16, 0x007b, %pil
	.word 0xf73c0000  ! 2910: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf43c0000  ! 2914: STD_R	std	%r26, [%r16 + %r0]
	.word 0xf274c000  ! 2916: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf22cc000  ! 2921: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf675c000  ! 2923: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf42dc000  ! 2926: STB_R	stb	%r26, [%r23 + %r0]
	setx	0x12d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc352053  ! 2930: STH_I	sth	%r30, [%r20 + 0x0053]
	.word 0xf824e165  ! 2931: STW_I	stw	%r28, [%r19 + 0x0165]
	.word 0xfb3dc000  ! 2935: STDF_R	std	%f29, [%r0, %r23]
	mov	0, %r12
	.word 0x8f932000  ! 2941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	2, %r12
	.word 0x8f932000  ! 2942: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf02d0000  ! 2947: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb095c000  ! 2954: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xf22c619a  ! 2955: STB_I	stb	%r25, [%r17 + 0x019a]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r22
	.word 0xbcade118  ! 2964: ANDNcc_I	andncc 	%r23, 0x0118, %r30
	.word 0xf02c20fe  ! 2965: STB_I	stb	%r24, [%r16 + 0x00fe]
	.word 0xfc248000  ! 2968: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf53d2038  ! 2969: STDF_I	std	%f26, [0x0038, %r20]
	.word 0xf23ce13a  ! 2970: STD_I	std	%r25, [%r19 + 0x013a]
	.word 0xf93ce04a  ! 2973: STDF_I	std	%f28, [0x004a, %r19]
	.word 0xbb520000  ! 2974: RDPR_PIL	rdpr	%pil, %r29
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2de19f  ! 2977: STB_I	stb	%r31, [%r23 + 0x019f]
	.word 0xf33c0000  ! 2978: STDF_R	std	%f25, [%r0, %r16]
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224a1e4  ! 2982: STW_I	stw	%r25, [%r18 + 0x01e4]
	.word 0xbb504000  ! 2983: RDPR_TNPC	<illegal instruction>
	.word 0xbd518000  ! 2990: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3c4000  ! 2991: STDF_R	std	%f30, [%r0, %r17]
	.word 0xba25e00a  ! 2995: SUB_I	sub 	%r23, 0x000a, %r29
	.word 0xb42c200c  ! 2996: ANDN_I	andn 	%r16, 0x000c, %r26
	.word 0xb5504000  ! 2999: RDPR_TNPC	<illegal instruction>
	.word 0x9195e00d  ! 3000: WRPR_PIL_I	wrpr	%r23, 0x000d, %pil
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa258000  ! 3002: STW_R	stw	%r29, [%r22 + %r0]
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbebc8000  ! 3005: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0xf42ce1e0  ! 3009: STB_I	stb	%r26, [%r19 + 0x01e0]
	.word 0xf73c0000  ! 3012: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf424c000  ! 3013: STW_R	stw	%r26, [%r19 + %r0]
	.word 0x81956149  ! 3014: WRPR_TPC_I	wrpr	%r21, 0x0149, %tpc
	.word 0xf434a02c  ! 3015: STH_I	sth	%r26, [%r18 + 0x002c]
	.word 0xfe2c8000  ! 3016: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xb0c421c0  ! 3018: ADDCcc_I	addccc 	%r16, 0x01c0, %r24
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d20db  ! 3022: STDF_I	std	%f31, [0x00db, %r20]
	.word 0xbb508000  ! 3023: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf23d210d  ! 3027: STD_I	std	%r25, [%r20 + 0x010d]
	.word 0xf434e1cc  ! 3029: STH_I	sth	%r26, [%r19 + 0x01cc]
	.word 0x85942030  ! 3030: WRPR_TSTATE_I	wrpr	%r16, 0x0030, %tstate
	.word 0x8995e044  ! 3032: WRPR_TICK_I	wrpr	%r23, 0x0044, %tick
	.word 0x81942165  ! 3034: WRPR_TPC_I	wrpr	%r16, 0x0165, %tpc
	.word 0xfd3da072  ! 3035: STDF_I	std	%f30, [0x0072, %r22]
	.word 0xfa25c000  ! 3038: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf83c4000  ! 3045: STD_R	std	%r28, [%r17 + %r0]
	setx	data_start_2, %g1, %r20
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeadc000  ! 3050: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xb3540000  ! 3052: RDPR_GL	rdpr	%-, %r25
	.word 0x8595606a  ! 3054: WRPR_TSTATE_I	wrpr	%r21, 0x006a, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982b8b  ! 3055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	.word 0xbb3c5000  ! 3057: SRAX_R	srax	%r17, %r0, %r29
	.word 0x8794a1e7  ! 3061: WRPR_TT_I	wrpr	%r18, 0x01e7, %tt
	.word 0xf6754000  ! 3064: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfa74c000  ! 3065: STX_R	stx	%r29, [%r19 + %r0]
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce026  ! 3074: STD_I	std	%r30, [%r19 + 0x0026]
	.word 0xf4344000  ! 3078: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf03c0000  ! 3080: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf2240000  ! 3081: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfa758000  ! 3082: STX_R	stx	%r29, [%r22 + %r0]
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3087: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6250000  ! 3089: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb0ac2126  ! 3091: ANDNcc_I	andncc 	%r16, 0x0126, %r24
	setx	data_start_0, %g1, %r21
	.word 0xb4a42162  ! 3104: SUBcc_I	subcc 	%r16, 0x0162, %r26
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa75e024  ! 3108: STX_I	stx	%r29, [%r23 + 0x0024]
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 3110: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_4, %g1, %r23
	.word 0xfe74c000  ! 3113: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xbac48000  ! 3114: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xf62c8000  ! 3116: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xb22dc000  ! 3118: ANDN_R	andn 	%r23, %r0, %r25
	.word 0x81942115  ! 3122: WRPR_TPC_I	wrpr	%r16, 0x0115, %tpc
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6340000  ! 3125: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf42d0000  ! 3126: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xb351c000  ! 3128: RDPR_TL	rdpr	%tl, %r25
	.word 0xf23cc000  ! 3130: STD_R	std	%r25, [%r19 + %r0]
	.word 0xfc34c000  ! 3132: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf624a0f1  ! 3133: STW_I	stw	%r27, [%r18 + 0x00f1]
	.word 0xfc75a0d7  ! 3134: STX_I	stx	%r30, [%r22 + 0x00d7]
	.word 0xbf51c000  ! 3135: RDPR_TL	<illegal instruction>
	.word 0xbc9d0000  ! 3140: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0x8195208f  ! 3142: WRPR_TPC_I	wrpr	%r20, 0x008f, %tpc
	.word 0xb8c48000  ! 3143: ADDCcc_R	addccc 	%r18, %r0, %r28
	.word 0xfa758000  ! 3144: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb751c000  ! 3145: RDPR_TL	rdpr	%tl, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 3149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	setx	0x20003, %g1, %o0
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
	.word 0xb3518000  ! 3153: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xbd50c000  ! 3154: RDPR_TT	<illegal instruction>
	.word 0xf8344000  ! 3155: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb9518000  ! 3158: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8194a042  ! 3162: WRPR_TPC_I	wrpr	%r18, 0x0042, %tpc
	.word 0xb00de1fa  ! 3163: AND_I	and 	%r23, 0x01fa, %r24
	.word 0xbd50c000  ! 3165: RDPR_TT	rdpr	%tt, %r30
	.word 0xf635e00c  ! 3167: STH_I	sth	%r27, [%r23 + 0x000c]
	.word 0x8594200c  ! 3169: WRPR_TSTATE_I	wrpr	%r16, 0x000c, %tstate
	.word 0xff3d8000  ! 3171: STDF_R	std	%f31, [%r0, %r22]
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33de060  ! 3181: STDF_I	std	%f25, [0x0060, %r23]
	.word 0xbb508000  ! 3184: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbb520000  ! 3186: RDPR_PIL	<illegal instruction>
	.word 0xbb2c9000  ! 3187: SLLX_R	sllx	%r18, %r0, %r29
	.word 0xfb3c2140  ! 3190: STDF_I	std	%f29, [0x0140, %r16]
	.word 0xbf520000  ! 3191: RDPR_PIL	<illegal instruction>
	.word 0xf23d4000  ! 3192: STD_R	std	%r25, [%r21 + %r0]
	setx	data_start_0, %g1, %r20
	.word 0xfa2dc000  ! 3199: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xb9510000  ! 3200: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a8b  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	.word 0xb045e1c7  ! 3203: ADDC_I	addc 	%r23, 0x01c7, %r24
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e16f  ! 3211: WRPR_TPC_I	wrpr	%r23, 0x016f, %tpc
	.word 0xfe2da0b3  ! 3214: STB_I	stb	%r31, [%r22 + 0x00b3]
	.word 0xf63cc000  ! 3216: STD_R	std	%r27, [%r19 + %r0]
	.word 0xbf51c000  ! 3219: RDPR_TL	rdpr	%tl, %r31
	.word 0xf625a067  ! 3220: STW_I	stw	%r27, [%r22 + 0x0067]
	.word 0xfc2c21f3  ! 3224: STB_I	stb	%r30, [%r16 + 0x01f3]
	.word 0xf4340000  ! 3230: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf23460b6  ! 3232: STH_I	sth	%r25, [%r17 + 0x00b6]
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 3238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xfa74e012  ! 3239: STX_I	stx	%r29, [%r19 + 0x0012]
	.word 0xf02de172  ! 3240: STB_I	stb	%r24, [%r23 + 0x0172]
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 3249: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf82c4000  ! 3250: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf4754000  ! 3252: STX_R	stx	%r26, [%r21 + %r0]
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43c4000  ! 3255: STD_R	std	%r26, [%r17 + %r0]
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a09d  ! 3261: WRPR_TSTATE_I	wrpr	%r18, 0x009d, %tstate
	.word 0x9195e1b1  ! 3263: WRPR_PIL_I	wrpr	%r23, 0x01b1, %pil
	.word 0xb9540000  ! 3264: RDPR_GL	rdpr	%-, %r28
	.word 0xf4258000  ! 3265: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xba34a1c8  ! 3266: ORN_I	orn 	%r18, 0x01c8, %r29
	.word 0xf73da1cb  ! 3268: STDF_I	std	%f27, [0x01cb, %r22]
	.word 0xbb3c3001  ! 3270: SRAX_I	srax	%r16, 0x0001, %r29
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93dc000  ! 3274: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf224c000  ! 3276: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xff3c60ef  ! 3277: STDF_I	std	%f31, [0x00ef, %r17]
	.word 0xf82421a3  ! 3278: STW_I	stw	%r28, [%r16 + 0x01a3]
	setx	data_start_1, %g1, %r22
	.word 0xb42c6006  ! 3284: ANDN_I	andn 	%r17, 0x0006, %r26
	setx	data_start_3, %g1, %r19
	.word 0x8794e0c6  ! 3287: WRPR_TT_I	wrpr	%r19, 0x00c6, %tt
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23dc000  ! 3291: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb5500000  ! 3292: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfc35c000  ! 3293: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xb3508000  ! 3296: RDPR_TSTATE	<illegal instruction>
	.word 0xf63d21e6  ! 3297: STD_I	std	%r27, [%r20 + 0x01e6]
	.word 0xf23d4000  ! 3299: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf22560f6  ! 3300: STW_I	stw	%r25, [%r21 + 0x00f6]
	.word 0xf62d8000  ! 3307: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf62d617a  ! 3310: STB_I	stb	%r27, [%r21 + 0x017a]
	.word 0xb7504000  ! 3311: RDPR_TNPC	<illegal instruction>
	.word 0xf825603f  ! 3315: STW_I	stw	%r28, [%r21 + 0x003f]
	.word 0xf275616c  ! 3316: STX_I	stx	%r25, [%r21 + 0x016c]
	.word 0xfc758000  ! 3321: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xb3510000  ! 3327: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0x8194e1c5  ! 3336: WRPR_TPC_I	wrpr	%r19, 0x01c5, %tpc
	.word 0xf6254000  ! 3337: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfa34a02e  ! 3338: STH_I	sth	%r29, [%r18 + 0x002e]
	setx	data_start_4, %g1, %r16
	.word 0xfb3d4000  ! 3341: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb43d2125  ! 3343: XNOR_I	xnor 	%r20, 0x0125, %r26
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 3346: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb0b4e067  ! 3350: ORNcc_I	orncc 	%r19, 0x0067, %r24
	setx	data_start_4, %g1, %r22
	.word 0xf0758000  ! 3364: STX_R	stx	%r24, [%r22 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 3366: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0758000  ! 3369: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xb5508000  ! 3375: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8794210a  ! 3380: WRPR_TT_I	wrpr	%r16, 0x010a, %tt
	.word 0xf23dc000  ! 3387: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf025a1a5  ! 3388: STW_I	stw	%r24, [%r22 + 0x01a5]
	.word 0xbb641800  ! 3391: MOVcc_R	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3392: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95a0ff  ! 3393: WRPR_PSTATE_I	wrpr	%r22, 0x00ff, %pstate
	.word 0xf225c000  ! 3394: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfe3dc000  ! 3395: STD_R	std	%r31, [%r23 + %r0]
	.word 0x8395a189  ! 3400: WRPR_TNPC_I	wrpr	%r22, 0x0189, %tnpc
	.word 0xf73de13e  ! 3402: STDF_I	std	%f27, [0x013e, %r23]
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d4000  ! 3404: STDF_R	std	%f28, [%r0, %r21]
	.word 0xfe25608a  ! 3406: STW_I	stw	%r31, [%r21 + 0x008a]
	.word 0xf53c4000  ! 3407: STDF_R	std	%f26, [%r0, %r17]
	.word 0xfd3c2095  ! 3408: STDF_I	std	%f30, [0x0095, %r16]
	.word 0xfa3c21bb  ! 3409: STD_I	std	%r29, [%r16 + 0x01bb]
	.word 0xf22c6059  ! 3411: STB_I	stb	%r25, [%r17 + 0x0059]
	.word 0xb2bd8000  ! 3421: XNORcc_R	xnorcc 	%r22, %r0, %r25
	mov	0, %r14
	.word 0xa193a000  ! 3424: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x83942153  ! 3427: WRPR_TNPC_I	wrpr	%r16, 0x0153, %tnpc
	.word 0xf6356125  ! 3428: STH_I	sth	%r27, [%r21 + 0x0125]
	.word 0x8d9461ce  ! 3429: WRPR_PSTATE_I	wrpr	%r17, 0x01ce, %pstate
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 3431: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfc3d8000  ! 3433: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb3480000  ! 3439: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa2d0000  ! 3440: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb414607d  ! 3443: OR_I	or 	%r17, 0x007d, %r26
	.word 0xb7520000  ! 3445: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf03d615c  ! 3446: STD_I	std	%r24, [%r21 + 0x015c]
	.word 0xf224a0f2  ! 3450: STW_I	stw	%r25, [%r18 + 0x00f2]
	.word 0xfb3c4000  ! 3451: STDF_R	std	%f29, [%r0, %r17]
	.word 0xfb3ce0e0  ! 3455: STDF_I	std	%f29, [0x00e0, %r19]
	.word 0xf53de1b4  ! 3458: STDF_I	std	%f26, [0x01b4, %r23]
	.word 0xb804a0d3  ! 3461: ADD_I	add 	%r18, 0x00d3, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a191  ! 3469: WRPR_TPC_I	wrpr	%r18, 0x0191, %tpc
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 3473: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfb3cc000  ! 3474: STDF_R	std	%f29, [%r0, %r19]
	.word 0xfa2ce14b  ! 3475: STB_I	stb	%r29, [%r19 + 0x014b]
	.word 0xf274a071  ! 3476: STX_I	stx	%r25, [%r18 + 0x0071]
	.word 0xb32db001  ! 3478: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xf0742080  ! 3483: STX_I	stx	%r24, [%r16 + 0x0080]
	.word 0xb7518000  ! 3484: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbb510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xf03de17e  ! 3486: STD_I	std	%r24, [%r23 + 0x017e]
	.word 0xf42c0000  ! 3491: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb7510000  ! 3493: RDPR_TICK	<illegal instruction>
	.word 0xb7480000  ! 3495: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc2c0000  ! 3496: STB_R	stb	%r30, [%r16 + %r0]
	setx	data_start_1, %g1, %r20
	.word 0xf43d0000  ! 3508: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf6250000  ! 3510: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb3520000  ! 3511: RDPR_PIL	<illegal instruction>
	.word 0xb41d0000  ! 3513: XOR_R	xor 	%r20, %r0, %r26
	.word 0x9195a190  ! 3514: WRPR_PIL_I	wrpr	%r22, 0x0190, %pil
	.word 0xf83ca159  ! 3515: STD_I	std	%r28, [%r18 + 0x0159]
	.word 0x919461aa  ! 3516: WRPR_PIL_I	wrpr	%r17, 0x01aa, %pil
	.word 0xfe3d0000  ! 3517: STD_R	std	%r31, [%r20 + %r0]
	.word 0xf025208a  ! 3521: STW_I	stw	%r24, [%r20 + 0x008a]
	.word 0x859421a7  ! 3524: WRPR_TSTATE_I	wrpr	%r16, 0x01a7, %tstate
	.word 0xf224a036  ! 3525: STW_I	stw	%r25, [%r18 + 0x0036]
	.word 0x9194a1ca  ! 3526: WRPR_PIL_I	wrpr	%r18, 0x01ca, %pil
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb42cc000  ! 3528: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xf675e122  ! 3536: STX_I	stx	%r27, [%r23 + 0x0122]
	.word 0xf13d0000  ! 3541: STDF_R	std	%f24, [%r0, %r20]
	.word 0xb9480000  ! 3543: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf62ca12e  ! 3544: STB_I	stb	%r27, [%r18 + 0x012e]
	.word 0xb5500000  ! 3547: RDPR_TPC	<illegal instruction>
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	.word 0xfa750000  ! 3556: STX_R	stx	%r29, [%r20 + %r0]
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a169  ! 3563: WRPR_TT_I	wrpr	%r22, 0x0169, %tt
	.word 0xfe740000  ! 3565: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xb8946047  ! 3567: ORcc_I	orcc 	%r17, 0x0047, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02da1e5  ! 3580: STB_I	stb	%r24, [%r22 + 0x01e5]
	.word 0xb01c4000  ! 3585: XOR_R	xor 	%r17, %r0, %r24
	.word 0xb8b4e127  ! 3586: SUBCcc_I	orncc 	%r19, 0x0127, %r28
	.word 0xff3c0000  ! 3587: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb335a001  ! 3588: SRL_I	srl 	%r22, 0x0001, %r25
	setx	data_start_4, %g1, %r17
	.word 0xf274e037  ! 3593: STX_I	stx	%r25, [%r19 + 0x0037]
	setx	data_start_6, %g1, %r22
	.word 0xb8a50000  ! 3600: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xf235602b  ! 3602: STH_I	sth	%r25, [%r21 + 0x002b]
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 3614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	.word 0xf93cc000  ! 3615: STDF_R	std	%f28, [%r0, %r19]
	.word 0x8395a0ba  ! 3617: WRPR_TNPC_I	wrpr	%r22, 0x00ba, %tnpc
	.word 0xf22d0000  ! 3620: STB_R	stb	%r25, [%r20 + %r0]
	.word 0x8195e0ce  ! 3621: WRPR_TPC_I	wrpr	%r23, 0x00ce, %tpc
	.word 0xf074208c  ! 3622: STX_I	stx	%r24, [%r16 + 0x008c]
	.word 0x819520a2  ! 3624: WRPR_TPC_I	wrpr	%r20, 0x00a2, %tpc
	.word 0xf2244000  ! 3625: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf23ce04f  ! 3626: STD_I	std	%r25, [%r19 + 0x004f]
	.word 0xfe344000  ! 3631: STH_R	sth	%r31, [%r17 + %r0]
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d2198  ! 3634: STD_I	std	%r30, [%r20 + 0x0198]
	.word 0xf8750000  ! 3636: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xba2d0000  ! 3638: ANDN_R	andn 	%r20, %r0, %r29
	.word 0x85956173  ! 3641: WRPR_TSTATE_I	wrpr	%r21, 0x0173, %tstate
	.word 0x859460ee  ! 3643: WRPR_TSTATE_I	wrpr	%r17, 0x00ee, %tstate
	.word 0x8d94a13e  ! 3646: WRPR_PSTATE_I	wrpr	%r18, 0x013e, %pstate
	.word 0xfa254000  ! 3647: STW_R	stw	%r29, [%r21 + %r0]
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60d0000  ! 3653: AND_R	and 	%r20, %r0, %r27
	.word 0xfa3420be  ! 3654: STH_I	sth	%r29, [%r16 + 0x00be]
	.word 0xf93d4000  ! 3657: STDF_R	std	%f28, [%r0, %r21]
	.word 0x8995e1c0  ! 3659: WRPR_TICK_I	wrpr	%r23, 0x01c0, %tick
	.word 0xf23c0000  ! 3663: STD_R	std	%r25, [%r16 + %r0]
	.word 0xfe3d0000  ! 3665: STD_R	std	%r31, [%r20 + %r0]
	.word 0xf02ce03d  ! 3667: STB_I	stb	%r24, [%r19 + 0x003d]
	.word 0xf0340000  ! 3670: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf024e003  ! 3672: STW_I	stw	%r24, [%r19 + 0x0003]
	.word 0xbb500000  ! 3674: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf22d8000  ! 3675: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfc2d0000  ! 3676: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfe348000  ! 3677: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf03461ce  ! 3678: STH_I	sth	%r24, [%r17 + 0x01ce]
	.word 0xfc3d8000  ! 3679: STD_R	std	%r30, [%r22 + %r0]
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 3689: RDPR_TSTATE	<illegal instruction>
	.word 0xf0746093  ! 3693: STX_I	stx	%r24, [%r17 + 0x0093]
	.word 0xfa75c000  ! 3694: STX_R	stx	%r29, [%r23 + %r0]
	.word 0x8d95e1b5  ! 3699: WRPR_PSTATE_I	wrpr	%r23, 0x01b5, %pstate
	.word 0xf62c4000  ! 3701: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf83d4000  ! 3703: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf53c214a  ! 3704: STDF_I	std	%f26, [0x014a, %r16]
	.word 0xf835a1cf  ! 3711: STH_I	sth	%r28, [%r22 + 0x01cf]
	.word 0xbf518000  ! 3712: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xfc750000  ! 3721: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf2754000  ! 3722: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf825a13c  ! 3723: STW_I	stw	%r28, [%r22 + 0x013c]
	.word 0xbf500000  ! 3724: RDPR_TPC	<illegal instruction>
	.word 0xfa24c000  ! 3726: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf23d4000  ! 3729: STD_R	std	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 3730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0xb63521b9  ! 3733: SUBC_I	orn 	%r20, 0x01b9, %r27
	.word 0xfd3c21fb  ! 3734: STDF_I	std	%f30, [0x01fb, %r16]
	.word 0xb8040000  ! 3736: ADD_R	add 	%r16, %r0, %r28
	.word 0xf0744000  ! 3745: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf6750000  ! 3746: STX_R	stx	%r27, [%r20 + %r0]
	setx	data_start_7, %g1, %r16
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 3752: RDPR_TICK	rdpr	%tick, %r24
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 3754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43cc000  ! 3761: STD_R	std	%r26, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 3762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xf03c8000  ! 3763: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfa342103  ! 3764: STH_I	sth	%r29, [%r16 + 0x0103]
	.word 0x8594a1d8  ! 3765: WRPR_TSTATE_I	wrpr	%r18, 0x01d8, %tstate
	.word 0xfc3dc000  ! 3766: STD_R	std	%r30, [%r23 + %r0]
	.word 0xfe3460f0  ! 3772: STH_I	sth	%r31, [%r17 + 0x00f0]
	.word 0xf625c000  ! 3774: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf8354000  ! 3776: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf62d6171  ! 3780: STB_I	stb	%r27, [%r21 + 0x0171]
	.word 0xbd480000  ! 3782: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc2d0000  ! 3785: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb69dc000  ! 3787: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0x8194a117  ! 3788: WRPR_TPC_I	wrpr	%r18, 0x0117, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 3790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	.word 0xbaac4000  ! 3793: ANDNcc_R	andncc 	%r17, %r0, %r29
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb624c000  ! 3797: SUB_R	sub 	%r19, %r0, %r27
	.word 0xfc3d2056  ! 3803: STD_I	std	%r30, [%r20 + 0x0056]
	.word 0xb7518000  ! 3804: RDPR_PSTATE	rdpr	%pstate, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe2c4000  ! 3809: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa2d21d2  ! 3810: STB_I	stb	%r29, [%r20 + 0x01d2]
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d0000  ! 3813: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb695a0c1  ! 3815: ORcc_I	orcc 	%r22, 0x00c1, %r27
	.word 0xfc34c000  ! 3816: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfe3d2146  ! 3817: STD_I	std	%r31, [%r20 + 0x0146]
	.word 0xbf518000  ! 3818: RDPR_PSTATE	<illegal instruction>
	.word 0xfc340000  ! 3821: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb6050000  ! 3823: ADD_R	add 	%r20, %r0, %r27
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xb6a44000  ! 3830: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb23d4000  ! 3835: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0x8594a1e3  ! 3836: WRPR_TSTATE_I	wrpr	%r18, 0x01e3, %tstate
	.word 0xb550c000  ! 3837: RDPR_TT	rdpr	%tt, %r26
	.word 0xf2352110  ! 3839: STH_I	sth	%r25, [%r20 + 0x0110]
	.word 0xf224c000  ! 3842: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfc2dc000  ! 3844: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf625e1b3  ! 3846: STW_I	stw	%r27, [%r23 + 0x01b3]
	.word 0xfa2c0000  ! 3847: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf13d4000  ! 3848: STDF_R	std	%f24, [%r0, %r21]
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c2063  ! 3853: STD_I	std	%r30, [%r16 + 0x0063]
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 3858: STH_R	sth	%r28, [%r19 + %r0]
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3864: RDPR_PSTATE	<illegal instruction>
	.word 0xfc256101  ! 3865: STW_I	stw	%r30, [%r21 + 0x0101]
	.word 0xbd643801  ! 3866: MOVcc_I	<illegal instruction>
	.word 0xf02da0b0  ! 3868: STB_I	stb	%r24, [%r22 + 0x00b0]
	.word 0xb9500000  ! 3871: RDPR_TPC	<illegal instruction>
	.word 0xfb3d4000  ! 3872: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfe3c4000  ! 3876: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf235c000  ! 3883: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf0748000  ! 3884: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xfc2c8000  ! 3885: STB_R	stb	%r30, [%r18 + %r0]
	.word 0x8d9461e3  ! 3886: WRPR_PSTATE_I	wrpr	%r17, 0x01e3, %pstate
	.word 0xb2b5a079  ! 3887: ORNcc_I	orncc 	%r22, 0x0079, %r25
	.word 0xfe348000  ! 3889: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xb1500000  ! 3891: RDPR_TPC	rdpr	%tpc, %r24
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 3894: MOVcc_I	<illegal instruction>
	.word 0xfd3d8000  ! 3898: STDF_R	std	%f30, [%r0, %r22]
	.word 0xbcbda1b1  ! 3899: XNORcc_I	xnorcc 	%r22, 0x01b1, %r30
	.word 0xb950c000  ! 3900: RDPR_TT	<illegal instruction>
	.word 0x8394a0c0  ! 3902: WRPR_TNPC_I	wrpr	%r18, 0x00c0, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0xb13c1000  ! 3907: SRAX_R	srax	%r16, %r0, %r24
	.word 0x8394a1c7  ! 3911: WRPR_TNPC_I	wrpr	%r18, 0x01c7, %tnpc
	.word 0xf674c000  ! 3914: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf2342084  ! 3915: STH_I	sth	%r25, [%r16 + 0x0084]
	.word 0xb5504000  ! 3920: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc2521a2  ! 3923: STW_I	stw	%r30, [%r20 + 0x01a2]
	.word 0xb9520000  ! 3924: RDPR_PIL	<illegal instruction>
	.word 0xf63c618a  ! 3930: STD_I	std	%r27, [%r17 + 0x018a]
	.word 0x879561cb  ! 3931: WRPR_TT_I	wrpr	%r21, 0x01cb, %tt
	.word 0x9195a086  ! 3932: WRPR_PIL_I	wrpr	%r22, 0x0086, %pil
	.word 0x91956059  ! 3934: WRPR_PIL_I	wrpr	%r21, 0x0059, %pil
	setx	data_start_5, %g1, %r19
	.word 0xf875e108  ! 3938: STX_I	stx	%r28, [%r23 + 0x0108]
	.word 0xbe2c4000  ! 3939: ANDN_R	andn 	%r17, %r0, %r31
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc746099  ! 3941: STX_I	stx	%r30, [%r17 + 0x0099]
	.word 0xfc24a109  ! 3942: STW_I	stw	%r30, [%r18 + 0x0109]
	.word 0x879421ba  ! 3944: WRPR_TT_I	wrpr	%r16, 0x01ba, %tt
	.word 0xf824a0bf  ! 3945: STW_I	stw	%r28, [%r18 + 0x00bf]
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 3946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0x8795a043  ! 3950: WRPR_TT_I	wrpr	%r22, 0x0043, %tt
	.word 0xbb504000  ! 3954: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfe2c8000  ! 3959: STB_R	stb	%r31, [%r18 + %r0]
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 3966: MOVcc_R	<illegal instruction>
	.word 0x879521a2  ! 3967: WRPR_TT_I	wrpr	%r20, 0x01a2, %tt
	.word 0xf33c4000  ! 3969: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf6240000  ! 3973: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfe258000  ! 3975: STW_R	stw	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f83  ! 3977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f83, %hpstate
	.word 0x8795e006  ! 3979: WRPR_TT_I	wrpr	%r23, 0x0006, %tt
	.word 0xb9500000  ! 3981: RDPR_TPC	rdpr	%tpc, %r28
	setx	0x218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d609c  ! 3985: STB_I	stb	%r30, [%r21 + 0x009c]
	.word 0xb8344000  ! 3987: ORN_R	orn 	%r17, %r0, %r28
	.word 0xb4244000  ! 3988: SUB_R	sub 	%r17, %r0, %r26
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3ce11c  ! 3993: STD_I	std	%r31, [%r19 + 0x011c]
	.word 0xb5504000  ! 3997: RDPR_TNPC	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3999: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc740000  ! 4002: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf635216a  ! 4007: STH_I	sth	%r27, [%r20 + 0x016a]
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2c6015  ! 4015: ANDN_I	andn 	%r17, 0x0015, %r29
	.word 0xf235a05b  ! 4017: STH_I	sth	%r25, [%r22 + 0x005b]
	.word 0xbb7d6401  ! 4018: MOVR_I	movre	%r21, 0x1, %r29
	.word 0xb8458000  ! 4023: ADDC_R	addc 	%r22, %r0, %r28
	.word 0x8d956108  ! 4025: WRPR_PSTATE_I	wrpr	%r21, 0x0108, %pstate
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 4027: STB_R	stb	%r24, [%r20 + %r0]
	.word 0x8595a1f0  ! 4028: WRPR_TSTATE_I	wrpr	%r22, 0x01f0, %tstate
	.word 0xf835c000  ! 4029: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfc74e1c6  ! 4036: STX_I	stx	%r30, [%r19 + 0x01c6]
	.word 0xf13da072  ! 4037: STDF_I	std	%f24, [0x0072, %r22]
	.word 0xf435e1aa  ! 4041: STH_I	sth	%r26, [%r23 + 0x01aa]
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34614f  ! 4046: STH_I	sth	%r31, [%r17 + 0x014f]
	.word 0xff3c0000  ! 4051: STDF_R	std	%f31, [%r0, %r16]
	.word 0xff3d4000  ! 4053: STDF_R	std	%f31, [%r0, %r21]
	.word 0xf53c4000  ! 4054: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf23da0d5  ! 4061: STD_I	std	%r25, [%r22 + 0x00d5]
	.word 0xfe2c4000  ! 4063: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb7351000  ! 4067: SRLX_R	srlx	%r20, %r0, %r27
	.word 0x8d94e0ae  ! 4072: WRPR_PSTATE_I	wrpr	%r19, 0x00ae, %pstate
	setx	0x1013b, %g1, %o0
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
	.word 0xf73c8000  ! 4075: STDF_R	std	%f27, [%r0, %r18]
	.word 0xf93d20e8  ! 4076: STDF_I	std	%f28, [0x00e8, %r20]
	.word 0xfd3c2040  ! 4080: STDF_I	std	%f30, [0x0040, %r16]
	.word 0xf2344000  ! 4085: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xfa2c8000  ! 4087: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf235e083  ! 4089: STH_I	sth	%r25, [%r23 + 0x0083]
	.word 0xfe25612d  ! 4095: STW_I	stw	%r31, [%r21 + 0x012d]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x9195a19f  ! 4100: WRPR_PIL_I	wrpr	%r22, 0x019f, %pil
	.word 0xfa2d0000  ! 4105: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf93d4000  ! 4107: STDF_R	std	%f28, [%r0, %r21]
	.word 0xb5520000  ! 4109: RDPR_PIL	rdpr	%pil, %r26
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 4112: SRLX_R	srlx	%r16, %r0, %r26
	mov	2, %r14
	.word 0xa193a000  ! 4116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa3dc000  ! 4117: STD_R	std	%r29, [%r23 + %r0]
	.word 0xb9508000  ! 4119: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xba154000  ! 4120: OR_R	or 	%r21, %r0, %r29
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 4125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xfa348000  ! 4126: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa7421f9  ! 4138: STX_I	stx	%r29, [%r16 + 0x01f9]
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195606c  ! 4142: WRPR_PIL_I	wrpr	%r21, 0x006c, %pil
	.word 0xf63560cb  ! 4144: STH_I	sth	%r27, [%r21 + 0x00cb]
	ta	T_CHANGE_HPRIV
	.word 0x81982b5b  ! 4147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c2112  ! 4149: STDF_I	std	%f26, [0x0112, %r16]
	.word 0xbb50c000  ! 4151: RDPR_TT	rdpr	%tt, %r29
	.word 0xf6344000  ! 4152: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfb3d8000  ! 4154: STDF_R	std	%f29, [%r0, %r22]
	setx	data_start_6, %g1, %r18
	.word 0xf2758000  ! 4157: STX_R	stx	%r25, [%r22 + %r0]
	.word 0x899421cb  ! 4162: WRPR_TICK_I	wrpr	%r16, 0x01cb, %tick
	.word 0xf8250000  ! 4163: STW_R	stw	%r28, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe242173  ! 4170: SUB_I	sub 	%r16, 0x0173, %r31
	setx	0x10018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8244000  ! 4175: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xbf50c000  ! 4176: RDPR_TT	rdpr	%tt, %r31
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43dc000  ! 4180: STD_R	std	%r26, [%r23 + %r0]
	.word 0x8394216a  ! 4181: WRPR_TNPC_I	wrpr	%r16, 0x016a, %tnpc
	.word 0xb7520000  ! 4182: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf23da19e  ! 4183: STD_I	std	%r25, [%r22 + 0x019e]
	.word 0xf8744000  ! 4185: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xbf510000  ! 4186: RDPR_TICK	<illegal instruction>
	.word 0xf434e04a  ! 4190: STH_I	sth	%r26, [%r19 + 0x004a]
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839461a4  ! 4193: WRPR_TNPC_I	wrpr	%r17, 0x01a4, %tnpc
	.word 0xb334c000  ! 4194: SRL_R	srl 	%r19, %r0, %r25
	.word 0xf82ca147  ! 4195: STB_I	stb	%r28, [%r18 + 0x0147]
	.word 0x8194609d  ! 4198: WRPR_TPC_I	wrpr	%r17, 0x009d, %tpc
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 4200: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf825a080  ! 4201: STW_I	stw	%r28, [%r22 + 0x0080]
	.word 0xf23d0000  ! 4207: STD_R	std	%r25, [%r20 + %r0]
	.word 0x8595a168  ! 4208: WRPR_TSTATE_I	wrpr	%r22, 0x0168, %tstate
	.word 0xfc3da1f9  ! 4210: STD_I	std	%r30, [%r22 + 0x01f9]
	.word 0x8d94604e  ! 4212: WRPR_PSTATE_I	wrpr	%r17, 0x004e, %pstate
	.word 0x919560de  ! 4213: WRPR_PIL_I	wrpr	%r21, 0x00de, %pil
	.word 0xf02cc000  ! 4214: STB_R	stb	%r24, [%r19 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4216: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf234e04c  ! 4217: STH_I	sth	%r25, [%r19 + 0x004c]
	.word 0xb9504000  ! 4218: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf4356163  ! 4220: STH_I	sth	%r26, [%r21 + 0x0163]
	mov	0, %r14
	.word 0xa193a000  ! 4223: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62c8000  ! 4229: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf2350000  ! 4230: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfa2ce13e  ! 4232: STB_I	stb	%r29, [%r19 + 0x013e]
	.word 0x879521b4  ! 4240: WRPR_TT_I	wrpr	%r20, 0x01b4, %tt
	.word 0xfa2c0000  ! 4244: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf23de17d  ! 4245: STD_I	std	%r25, [%r23 + 0x017d]
	.word 0xf874c000  ! 4251: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb3510000  ! 4252: RDPR_TICK	rdpr	%tick, %r25
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c213a  ! 4254: STD_I	std	%r24, [%r16 + 0x013a]
	.word 0xf82ca165  ! 4255: STB_I	stb	%r28, [%r18 + 0x0165]
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c0000  ! 4261: STDF_R	std	%f25, [%r0, %r16]
	.word 0xb9643801  ! 4265: MOVcc_I	<illegal instruction>
	.word 0xfa352001  ! 4268: STH_I	sth	%r29, [%r20 + 0x0001]
	.word 0xbaa46021  ! 4269: SUBcc_I	subcc 	%r17, 0x0021, %r29
	.word 0xb52cf001  ! 4271: SLLX_I	sllx	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c4b  ! 4273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4b, %hpstate
	setx	0x10239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	.word 0xf62c6089  ! 4277: STB_I	stb	%r27, [%r17 + 0x0089]
	.word 0xb0c521c3  ! 4278: ADDCcc_I	addccc 	%r20, 0x01c3, %r24
	.word 0xfa24a05f  ! 4279: STW_I	stw	%r29, [%r18 + 0x005f]
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 4282: RDPR_TICK	rdpr	%tick, %r25
	mov	0, %r12
	.word 0x8f932000  ! 4284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf624e1c3  ! 4286: STW_I	stw	%r27, [%r19 + 0x01c3]
	mov	1, %r12
	.word 0x8f932000  ! 4287: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfb3c600d  ! 4296: STDF_I	std	%f29, [0x000d, %r17]
	.word 0xf434a174  ! 4297: STH_I	sth	%r26, [%r18 + 0x0174]
	.word 0xfa3c4000  ! 4301: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf22c207d  ! 4303: STB_I	stb	%r25, [%r16 + 0x007d]
	.word 0xfd3d2103  ! 4304: STDF_I	std	%f30, [0x0103, %r20]
	.word 0xfa2ce12f  ! 4306: STB_I	stb	%r29, [%r19 + 0x012f]
	.word 0x839560fc  ! 4307: WRPR_TNPC_I	wrpr	%r21, 0x00fc, %tnpc
	.word 0xf2748000  ! 4308: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf024a09a  ! 4314: STW_I	stw	%r24, [%r18 + 0x009a]
	mov	0, %r14
	.word 0xa193a000  ! 4319: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5518000  ! 4321: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb751c000  ! 4322: RDPR_TL	<illegal instruction>
	.word 0xf4740000  ! 4323: STX_R	stx	%r26, [%r16 + %r0]
	setx	data_start_3, %g1, %r23
	.word 0xf93dc000  ! 4326: STDF_R	std	%f28, [%r0, %r23]
	.word 0xff3dc000  ! 4329: STDF_R	std	%f31, [%r0, %r23]
	.word 0x8d94e181  ! 4331: WRPR_PSTATE_I	wrpr	%r19, 0x0181, %pstate
	.word 0xfa3d8000  ! 4332: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf53ca01c  ! 4335: STDF_I	std	%f26, [0x001c, %r18]
	.word 0x8195e17d  ! 4337: WRPR_TPC_I	wrpr	%r23, 0x017d, %tpc
	.word 0x8795a116  ! 4338: WRPR_TT_I	wrpr	%r22, 0x0116, %tt
	.word 0xf225c000  ! 4339: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb3500000  ! 4340: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x87956025  ! 4342: WRPR_TT_I	wrpr	%r21, 0x0025, %tt
	.word 0x8194a0d3  ! 4343: WRPR_TPC_I	wrpr	%r18, 0x00d3, %tpc
	.word 0xb3510000  ! 4345: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb3508000  ! 4346: RDPR_TSTATE	<illegal instruction>
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8c4a1d9  ! 4349: ADDCcc_I	addccc 	%r18, 0x01d9, %r28
	.word 0xfe748000  ! 4353: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfc7420b7  ! 4355: STX_I	stx	%r30, [%r16 + 0x00b7]
	.word 0x8d95a005  ! 4358: WRPR_PSTATE_I	wrpr	%r22, 0x0005, %pstate
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 4368: RDPR_TICK	rdpr	%tick, %r26
	.word 0x8795e1dd  ! 4371: WRPR_TT_I	wrpr	%r23, 0x01dd, %tt
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 4373: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbd510000  ! 4375: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb5500000  ! 4379: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ddb  ! 4380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddb, %hpstate
	setx	data_start_6, %g1, %r22
	.word 0xf13d206d  ! 4389: STDF_I	std	%f24, [0x006d, %r20]
	.word 0xb12ce001  ! 4393: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xf62d8000  ! 4394: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfe3ce1ac  ! 4398: STD_I	std	%r31, [%r19 + 0x01ac]
	.word 0xb494a02b  ! 4399: ORcc_I	orcc 	%r18, 0x002b, %r26
	.word 0xbb480000  ! 4400: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8395e115  ! 4401: WRPR_TNPC_I	wrpr	%r23, 0x0115, %tnpc
	.word 0xfa2dc000  ! 4405: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf675e160  ! 4408: STX_I	stx	%r27, [%r23 + 0x0160]
	.word 0xf62c61f3  ! 4410: STB_I	stb	%r27, [%r17 + 0x01f3]
	.word 0xfa742010  ! 4411: STX_I	stx	%r29, [%r16 + 0x0010]
	setx	0x137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 4417: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xfb3d2062  ! 4418: STDF_I	std	%f29, [0x0062, %r20]
	.word 0xf8244000  ! 4419: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb7500000  ! 4420: RDPR_TPC	<illegal instruction>
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62da183  ! 4431: STB_I	stb	%r27, [%r22 + 0x0183]
	.word 0xf4348000  ! 4438: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xfe2c0000  ! 4440: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfc748000  ! 4444: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf074e1db  ! 4446: STX_I	stx	%r24, [%r19 + 0x01db]
	.word 0xf63d4000  ! 4449: STD_R	std	%r27, [%r21 + %r0]
	.word 0xb4b42114  ! 4454: SUBCcc_I	orncc 	%r16, 0x0114, %r26
	.word 0xf33c0000  ! 4455: STDF_R	std	%f25, [%r0, %r16]
	setx	data_start_6, %g1, %r19
	.word 0xf53ca1c1  ! 4457: STDF_I	std	%f26, [0x01c1, %r18]
	setx	data_start_4, %g1, %r19
	.word 0xf22c4000  ! 4461: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfa758000  ! 4463: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb28d6175  ! 4465: ANDcc_I	andcc 	%r21, 0x0175, %r25
	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23d206e  ! 4472: STD_I	std	%r25, [%r20 + 0x006e]
	.word 0xf42460ff  ! 4475: STW_I	stw	%r26, [%r17 + 0x00ff]
	.word 0xb7508000  ! 4476: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb1540000  ! 4479: RDPR_GL	<illegal instruction>
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xfe3d8000  ! 4486: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf27560db  ! 4487: STX_I	stx	%r25, [%r21 + 0x00db]
	.word 0xba2d8000  ! 4489: ANDN_R	andn 	%r22, %r0, %r29
	.word 0xfe35c000  ! 4491: STH_R	sth	%r31, [%r23 + %r0]
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6244000  ! 4502: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfc240000  ! 4506: STW_R	stw	%r30, [%r16 + %r0]
	setx	data_start_6, %g1, %r19
	.word 0xf8744000  ! 4508: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf624a016  ! 4510: STW_I	stw	%r27, [%r18 + 0x0016]
	.word 0xfa354000  ! 4512: STH_R	sth	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982d49  ! 4514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	.word 0xfc3d8000  ! 4515: STD_R	std	%r30, [%r22 + %r0]
	.word 0x83946168  ! 4517: WRPR_TNPC_I	wrpr	%r17, 0x0168, %tnpc
	.word 0xf53d21f3  ! 4518: STDF_I	std	%f26, [0x01f3, %r20]
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c4000  ! 4531: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf4352057  ! 4533: STH_I	sth	%r26, [%r20 + 0x0057]
	.word 0xf73ca0f2  ! 4537: STDF_I	std	%f27, [0x00f2, %r18]
	.word 0xf23c4000  ! 4540: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf53c619d  ! 4541: STDF_I	std	%f26, [0x019d, %r17]
	mov	1, %r14
	.word 0xa193a000  ! 4543: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_5, %g1, %r18
	.word 0xb5510000  ! 4546: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb61ca1fe  ! 4547: XOR_I	xor 	%r18, 0x01fe, %r27
	.word 0x8195e01b  ! 4551: WRPR_TPC_I	wrpr	%r23, 0x001b, %tpc
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0350000  ! 4554: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb42d20a8  ! 4555: ANDN_I	andn 	%r20, 0x00a8, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xf82c0000  ! 4560: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf82c0000  ! 4565: STB_R	stb	%r28, [%r16 + %r0]
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa34600b  ! 4570: STH_I	sth	%r29, [%r17 + 0x000b]
	setx	data_start_5, %g1, %r20
	mov	2, %r12
	.word 0x8f932000  ! 4575: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8595a024  ! 4576: WRPR_TSTATE_I	wrpr	%r22, 0x0024, %tstate
	.word 0xfc25c000  ! 4579: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf0754000  ! 4581: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf73da1e1  ! 4582: STDF_I	std	%f27, [0x01e1, %r22]
	.word 0xf02c0000  ! 4583: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb9480000  ! 4584: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d95a1a0  ! 4586: WRPR_PSTATE_I	wrpr	%r22, 0x01a0, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982951  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0951, %hpstate
	.word 0xbaad8000  ! 4589: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0xb53d4000  ! 4591: SRA_R	sra 	%r21, %r0, %r26
	.word 0x8994e14f  ! 4592: WRPR_TICK_I	wrpr	%r19, 0x014f, %tick
	.word 0xbc058000  ! 4594: ADD_R	add 	%r22, %r0, %r30
	.word 0xf42521f0  ! 4596: STW_I	stw	%r26, [%r20 + 0x01f0]
	.word 0xfe3d4000  ! 4597: STD_R	std	%r31, [%r21 + %r0]
	.word 0xf63cc000  ! 4598: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf03d0000  ! 4599: STD_R	std	%r24, [%r20 + %r0]
	.word 0x8995a023  ! 4600: WRPR_TICK_I	wrpr	%r22, 0x0023, %tick
	.word 0xb5540000  ! 4601: RDPR_GL	rdpr	%-, %r26
	.word 0xf63dc000  ! 4603: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf53ce1ba  ! 4611: STDF_I	std	%f26, [0x01ba, %r19]
	.word 0xf274607e  ! 4613: STX_I	stx	%r25, [%r17 + 0x007e]
	.word 0xf2748000  ! 4617: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf43c2038  ! 4618: STD_I	std	%r26, [%r16 + 0x0038]
	.word 0xbd2d6001  ! 4620: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xbc8d4000  ! 4621: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xfd3d4000  ! 4624: STDF_R	std	%f30, [%r0, %r21]
	setx	data_start_0, %g1, %r17
	setx	data_start_2, %g1, %r19
	.word 0xf034e134  ! 4637: STH_I	sth	%r24, [%r19 + 0x0134]
	.word 0x8195a0ce  ! 4640: WRPR_TPC_I	wrpr	%r22, 0x00ce, %tpc
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bc219a  ! 4646: XNORcc_I	xnorcc 	%r16, 0x019a, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983ac1  ! 4649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac1, %hpstate
	.word 0xfc3d20f2  ! 4650: STD_I	std	%r30, [%r20 + 0x00f2]
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 4654: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb77de401  ! 4656: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb550c000  ! 4658: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 4661: RDPR_TNPC	<illegal instruction>
	.word 0xf63d20bc  ! 4662: STD_I	std	%r27, [%r20 + 0x00bc]
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63dc000  ! 4666: STD_R	std	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982903  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0903, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 4668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e187  ! 4677: WRPR_PIL_I	wrpr	%r19, 0x0187, %pil
	.word 0xfe3d20a8  ! 4684: STD_I	std	%r31, [%r20 + 0x00a8]
	.word 0xf434a0e8  ! 4689: STH_I	sth	%r26, [%r18 + 0x00e8]
	.word 0xb950c000  ! 4690: RDPR_TT	rdpr	%tt, %r28
	.word 0xf074c000  ! 4691: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf075c000  ! 4692: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf2348000  ! 4698: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xb7480000  ! 4701: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb350c000  ! 4702: RDPR_TT	<illegal instruction>
	.word 0xb09d4000  ! 4707: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0x8d94201f  ! 4710: WRPR_PSTATE_I	wrpr	%r16, 0x001f, %pstate
	.word 0xbe04a1f5  ! 4711: ADD_I	add 	%r18, 0x01f5, %r31
	.word 0x8394205a  ! 4712: WRPR_TNPC_I	wrpr	%r16, 0x005a, %tnpc
	.word 0xf13c6178  ! 4713: STDF_I	std	%f24, [0x0178, %r17]
	.word 0xf42d0000  ! 4715: STB_R	stb	%r26, [%r20 + %r0]
	.word 0x919561fa  ! 4716: WRPR_PIL_I	wrpr	%r21, 0x01fa, %pil
	.word 0xf63d8000  ! 4718: STD_R	std	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3520000  ! 4723: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf33d2033  ! 4724: STDF_I	std	%f25, [0x0033, %r20]
	setx	data_start_5, %g1, %r21
	.word 0xf8354000  ! 4728: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf42da004  ! 4729: STB_I	stb	%r26, [%r22 + 0x0004]
	.word 0xb08d0000  ! 4735: ANDcc_R	andcc 	%r20, %r0, %r24
	.word 0xf13d0000  ! 4736: STDF_R	std	%f24, [%r0, %r20]
	.word 0xb21c4000  ! 4741: XOR_R	xor 	%r17, %r0, %r25
	.word 0xbf643801  ! 4742: MOVcc_I	<illegal instruction>
	.word 0xbf50c000  ! 4743: RDPR_TT	<illegal instruction>
	.word 0xf834c000  ! 4744: STH_R	sth	%r28, [%r19 + %r0]
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d4000  ! 4748: STD_R	std	%r30, [%r21 + %r0]
	.word 0x91942038  ! 4749: WRPR_PIL_I	wrpr	%r16, 0x0038, %pil
	.word 0xf434a0bd  ! 4750: STH_I	sth	%r26, [%r18 + 0x00bd]
	.word 0xfe74c000  ! 4751: STX_R	stx	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d61a0  ! 4754: STB_I	stb	%r30, [%r21 + 0x01a0]
	.word 0xf2754000  ! 4758: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb2ad60ab  ! 4759: ANDNcc_I	andncc 	%r21, 0x00ab, %r25
	.word 0xf53c6106  ! 4761: STDF_I	std	%f26, [0x0106, %r17]
	.word 0xf624c000  ! 4766: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf275c000  ! 4767: STX_R	stx	%r25, [%r23 + %r0]
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e06d  ! 4779: WRPR_PSTATE_I	wrpr	%r23, 0x006d, %pstate
	.word 0xf13d21f1  ! 4781: STDF_I	std	%f24, [0x01f1, %r20]
	.word 0x9194a1c4  ! 4782: WRPR_PIL_I	wrpr	%r18, 0x01c4, %pil
	.word 0xb3480000  ! 4783: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc2c618e  ! 4784: STB_I	stb	%r30, [%r17 + 0x018e]
	.word 0xf835e1b1  ! 4786: STH_I	sth	%r28, [%r23 + 0x01b1]
	.word 0xf33c0000  ! 4787: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf03ce119  ! 4792: STD_I	std	%r24, [%r19 + 0x0119]
	.word 0xf0758000  ! 4793: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf42da118  ! 4800: STB_I	stb	%r26, [%r22 + 0x0118]
	.word 0xf22ce01a  ! 4802: STB_I	stb	%r25, [%r19 + 0x001a]
	.word 0xbf520000  ! 4803: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf024219f  ! 4807: STW_I	stw	%r24, [%r16 + 0x019f]
	.word 0xf42d613f  ! 4811: STB_I	stb	%r26, [%r21 + 0x013f]
	.word 0xf035c000  ! 4818: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf03c4000  ! 4820: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf8748000  ! 4824: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf675a1ed  ! 4830: STX_I	stx	%r27, [%r22 + 0x01ed]
	.word 0xfe35c000  ! 4834: STH_R	sth	%r31, [%r23 + %r0]
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91956160  ! 4843: WRPR_PIL_I	wrpr	%r21, 0x0160, %pil
	setx	0x2003d, %g1, %o0
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
	.word 0xb9504000  ! 4852: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfe242141  ! 4853: STW_I	stw	%r31, [%r16 + 0x0141]
	.word 0xfa354000  ! 4858: STH_R	sth	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ad1  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad1, %hpstate
	.word 0xf0744000  ! 4867: STX_R	stx	%r24, [%r17 + %r0]
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62ce06b  ! 4873: STB_I	stb	%r27, [%r19 + 0x006b]
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4878: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 4882: RDPR_TL	rdpr	%tl, %r28
	.word 0xf83d8000  ! 4883: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf22c0000  ! 4886: STB_R	stb	%r25, [%r16 + %r0]
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 4889: MOVcc_I	<illegal instruction>
	setx	0x1f, %g1, %o0
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
	.word 0xbd35a001  ! 4892: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xf234c000  ! 4895: STH_R	sth	%r25, [%r19 + %r0]
	setx	data_start_3, %g1, %r19
	.word 0xf234e1a0  ! 4900: STH_I	sth	%r25, [%r19 + 0x01a0]
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4240000  ! 4904: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbb51c000  ! 4905: RDPR_TL	<illegal instruction>
	.word 0xfa34e18c  ! 4907: STH_I	sth	%r29, [%r19 + 0x018c]
	.word 0xbb50c000  ! 4910: RDPR_TT	rdpr	%tt, %r29
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe25e0bc  ! 4915: STW_I	stw	%r31, [%r23 + 0x00bc]
	.word 0xf2354000  ! 4917: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf73d202c  ! 4922: STDF_I	std	%f27, [0x002c, %r20]
	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e1b4  ! 4925: WRPR_TNPC_I	wrpr	%r19, 0x01b4, %tnpc
	.word 0xf33c0000  ! 4928: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf73dc000  ! 4929: STDF_R	std	%f27, [%r0, %r23]
	setx	0x3010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf634e18b  ! 4934: STH_I	sth	%r27, [%r19 + 0x018b]
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 4935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0xf73dc000  ! 4936: STDF_R	std	%f27, [%r0, %r23]
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74c000  ! 4938: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb4bd0000  ! 4940: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xb9480000  ! 4941: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 4943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	.word 0xfb3dc000  ! 4945: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf8346096  ! 4948: STH_I	sth	%r28, [%r17 + 0x0096]
	.word 0xfc348000  ! 4951: STH_R	sth	%r30, [%r18 + %r0]
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b83  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b83, %hpstate
	.word 0x919421da  ! 4959: WRPR_PIL_I	wrpr	%r16, 0x01da, %pil
	.word 0xf62d20a6  ! 4961: STB_I	stb	%r27, [%r20 + 0x00a6]
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d0000  ! 4964: STD_R	std	%r28, [%r20 + %r0]
	.word 0xb644a112  ! 4969: ADDC_I	addc 	%r18, 0x0112, %r27
	.word 0x819421bb  ! 4972: WRPR_TPC_I	wrpr	%r16, 0x01bb, %tpc
	.word 0xb4b44000  ! 4974: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0xf83ca1dd  ! 4980: STD_I	std	%r28, [%r18 + 0x01dd]
	.word 0x8794205f  ! 4983: WRPR_TT_I	wrpr	%r16, 0x005f, %tt
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a1cc  ! 4986: WRPR_TSTATE_I	wrpr	%r22, 0x01cc, %tstate
	.word 0xfa24c000  ! 4987: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfb3de0ea  ! 4988: STDF_I	std	%f29, [0x00ea, %r23]
	.word 0xfd3da023  ! 4989: STDF_I	std	%f30, [0x0023, %r22]
	.word 0xf234c000  ! 4990: STH_R	sth	%r25, [%r19 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 4992: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb92c6001  ! 4993: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xfe242191  ! 4996: STW_I	stw	%r31, [%r16 + 0x0191]
	.word 0xfa75c000  ! 4997: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf13dc000  ! 4998: STDF_R	std	%f24, [%r0, %r23]
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
	.word 0xf21d4000  ! 10: LDD_R	ldd	[%r21 + %r0], %r25
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf404a07c  ! 14: LDUW_I	lduw	[%r18 + 0x007c], %r26
	.word 0xfe4d2127  ! 15: LDSB_I	ldsb	[%r20 + 0x0127], %r31
	.word 0xf2544000  ! 18: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xfe4d4000  ! 20: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf85ce16a  ! 22: LDX_I	ldx	[%r19 + 0x016a], %r28
	.word 0xf8444000  ! 23: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xb2340000  ! 29: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xb3520000  ! 30: RDPR_PIL	<illegal instruction>
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 35: RDPR_TNPC	<illegal instruction>
	.word 0xf00cc000  ! 36: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xb9520000  ! 37: RDPR_PIL	<illegal instruction>
	.word 0xf655a1bb  ! 38: LDSH_I	ldsh	[%r22 + 0x01bb], %r27
	.word 0xf84d8000  ! 39: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf2140000  ! 40: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf24c0000  ! 43: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe05a0b4  ! 45: LDUW_I	lduw	[%r22 + 0x00b4], %r31
	.word 0xbd2c8000  ! 46: SLL_R	sll 	%r18, %r0, %r30
	.word 0xf455207d  ! 48: LDSH_I	ldsh	[%r20 + 0x007d], %r26
	.word 0x8d95a167  ! 51: WRPR_PSTATE_I	wrpr	%r22, 0x0167, %pstate
	.word 0xfa0c603e  ! 53: LDUB_I	ldub	[%r17 + 0x003e], %r29
	.word 0xb9510000  ! 56: RDPR_TICK	<illegal instruction>
	.word 0xb7480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf00c21d3  ! 70: LDUB_I	ldub	[%r16 + 0x01d3], %r24
	.word 0xf214a0da  ! 71: LDUH_I	lduh	[%r18 + 0x00da], %r25
	.word 0xf84da147  ! 73: LDSB_I	ldsb	[%r22 + 0x0147], %r28
	.word 0xfe454000  ! 75: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xf844a1cf  ! 80: LDSW_I	ldsw	[%r18 + 0x01cf], %r28
	.word 0xfe5560c6  ! 81: LDSH_I	ldsh	[%r21 + 0x00c6], %r31
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2150000  ! 85: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfe5dc000  ! 87: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xfe04219e  ! 89: LDUW_I	lduw	[%r16 + 0x019e], %r31
	.word 0xf6458000  ! 90: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xb5540000  ! 91: RDPR_GL	<illegal instruction>
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c8000  ! 99: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf2152137  ! 100: LDUH_I	lduh	[%r20 + 0x0137], %r25
	.word 0xf8040000  ! 102: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xbb50c000  ! 103: RDPR_TT	rdpr	%tt, %r29
	.word 0xf60ca0ed  ! 107: LDUB_I	ldub	[%r18 + 0x00ed], %r27
	.word 0xbb508000  ! 108: RDPR_TSTATE	<illegal instruction>
	.word 0xf05c0000  ! 110: LDX_R	ldx	[%r16 + %r0], %r24
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6050000  ! 112: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xf844e067  ! 114: LDSW_I	ldsw	[%r19 + 0x0067], %r28
	.word 0xb1518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0x87946170  ! 120: WRPR_TT_I	wrpr	%r17, 0x0170, %tt
	.word 0xb3480000  ! 121: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbd480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4b54000  ! 127: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xf71c4000  ! 131: LDDF_R	ldd	[%r17, %r0], %f27
	setx	data_start_7, %g1, %r21
	.word 0xfe0c8000  ! 133: LDUB_R	ldub	[%r18 + %r0], %r31
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41d0000  ! 137: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xf2554000  ! 138: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf6542098  ! 139: LDSH_I	ldsh	[%r16 + 0x0098], %r27
	.word 0xf11c61ad  ! 140: LDDF_I	ldd	[%r17, 0x01ad], %f24
	.word 0xf84c0000  ! 142: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb4146032  ! 143: OR_I	or 	%r17, 0x0032, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0c214e  ! 153: LDUB_I	ldub	[%r16 + 0x014e], %r30
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c4000  ! 161: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xb28cc000  ! 165: ANDcc_R	andcc 	%r19, %r0, %r25
	setx	data_start_1, %g1, %r22
	.word 0x879420ce  ! 170: WRPR_TT_I	wrpr	%r16, 0x00ce, %tt
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 179: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd500000  ! 188: RDPR_TPC	<illegal instruction>
	.word 0x8194e097  ! 189: WRPR_TPC_I	wrpr	%r19, 0x0097, %tpc
	.word 0xba3c0000  ! 191: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0x839520f9  ! 194: WRPR_TNPC_I	wrpr	%r20, 0x00f9, %tnpc
	.word 0xfa052196  ! 196: LDUW_I	lduw	[%r20 + 0x0196], %r29
	.word 0xf8144000  ! 199: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0x8595e1a4  ! 200: WRPR_TSTATE_I	wrpr	%r23, 0x01a4, %tstate
	.word 0xf04d0000  ! 205: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfa14c000  ! 207: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xf41c0000  ! 208: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xfc0cc000  ! 209: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf65d2166  ! 211: LDX_I	ldx	[%r20 + 0x0166], %r27
	.word 0xfa1c0000  ! 213: LDD_R	ldd	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8146191  ! 216: LDUH_I	lduh	[%r17 + 0x0191], %r28
	.word 0xb62420eb  ! 217: SUB_I	sub 	%r16, 0x00eb, %r27
	setx	0x223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd348000  ! 220: SRL_R	srl 	%r18, %r0, %r30
	.word 0xbe45a0b3  ! 221: ADDC_I	addc 	%r22, 0x00b3, %r31
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839521d2  ! 223: WRPR_TNPC_I	wrpr	%r20, 0x01d2, %tnpc
	.word 0xb4a4c000  ! 226: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xb9518000  ! 227: RDPR_PSTATE	<illegal instruction>
	.word 0xbe840000  ! 228: ADDcc_R	addcc 	%r16, %r0, %r31
	.word 0xf0140000  ! 230: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf80de1ea  ! 232: LDUB_I	ldub	[%r23 + 0x01ea], %r28
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 245: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xb624a03b  ! 247: SUB_I	sub 	%r18, 0x003b, %r27
	setx	0x20132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25c20f9  ! 254: LDX_I	ldx	[%r16 + 0x00f9], %r25
	.word 0xb935c000  ! 258: SRL_R	srl 	%r23, %r0, %r28
	.word 0xf91d60f6  ! 259: LDDF_I	ldd	[%r21, 0x00f6], %f28
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6142024  ! 266: LDUH_I	lduh	[%r16 + 0x0024], %r27
	setx	data_start_3, %g1, %r22
	.word 0xf2148000  ! 273: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf85ce0c7  ! 274: LDX_I	ldx	[%r19 + 0x00c7], %r28
	.word 0x8794618d  ! 278: WRPR_TT_I	wrpr	%r17, 0x018d, %tt
	.word 0xf604c000  ! 279: LDUW_R	lduw	[%r19 + %r0], %r27
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a006  ! 281: WRPR_PSTATE_I	wrpr	%r18, 0x0006, %pstate
	.word 0xb00d4000  ! 282: AND_R	and 	%r21, %r0, %r24
	.word 0xb5480000  ! 287: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf45d6170  ! 288: LDX_I	ldx	[%r21 + 0x0170], %r26
	.word 0xf41d4000  ! 290: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xb7540000  ! 293: RDPR_GL	<illegal instruction>
	.word 0xf71da064  ! 294: LDDF_I	ldd	[%r22, 0x0064], %f27
	setx	data_start_2, %g1, %r23
	setx	data_start_3, %g1, %r22
	.word 0xb5540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xf60461b6  ! 300: LDUW_I	lduw	[%r17 + 0x01b6], %r27
	.word 0xfc540000  ! 301: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0x8594a013  ! 303: WRPR_TSTATE_I	wrpr	%r18, 0x0013, %tstate
	.word 0xf51de12c  ! 306: LDDF_I	ldd	[%r23, 0x012c], %f26
	.word 0xf31cc000  ! 308: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf0056071  ! 310: LDUW_I	lduw	[%r21 + 0x0071], %r24
	.word 0xbcb5a08e  ! 311: ORNcc_I	orncc 	%r22, 0x008e, %r30
	.word 0x89952165  ! 314: WRPR_TICK_I	wrpr	%r20, 0x0165, %tick
	.word 0xfc4d215a  ! 323: LDSB_I	ldsb	[%r20 + 0x015a], %r30
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf404a16e  ! 331: LDUW_I	lduw	[%r18 + 0x016e], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4dc000  ! 334: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfc5d203d  ! 337: LDX_I	ldx	[%r20 + 0x003d], %r30
	.word 0xf65dc000  ! 338: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xfa1c61c5  ! 339: LDD_I	ldd	[%r17 + 0x01c5], %r29
	.word 0xb53d8000  ! 342: SRA_R	sra 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xf204217d  ! 346: LDUW_I	lduw	[%r16 + 0x017d], %r25
	.word 0xf71d6105  ! 347: LDDF_I	ldd	[%r21, 0x0105], %f27
	.word 0xf245c000  ! 348: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xfe45204d  ! 349: LDSW_I	ldsw	[%r20 + 0x004d], %r31
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0ca02c  ! 355: LDUB_I	ldub	[%r18 + 0x002c], %r30
	.word 0xbb51c000  ! 356: RDPR_TL	<illegal instruction>
	.word 0x8595a1c7  ! 357: WRPR_TSTATE_I	wrpr	%r22, 0x01c7, %tstate
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 360: RDPR_TT	<illegal instruction>
	.word 0xfa4d4000  ! 361: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xfe5de0f2  ! 362: LDX_I	ldx	[%r23 + 0x00f2], %r31
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c4000  ! 364: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xfc5c8000  ! 366: LDX_R	ldx	[%r18 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb73cf001  ! 368: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xfa4c0000  ! 369: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xf6042087  ! 372: LDUW_I	lduw	[%r16 + 0x0087], %r27
	.word 0x8395e074  ! 373: WRPR_TNPC_I	wrpr	%r23, 0x0074, %tnpc
	setx	0x2033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71c8000  ! 376: LDDF_R	ldd	[%r18, %r0], %f27
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe15e176  ! 381: LDUH_I	lduh	[%r23 + 0x0176], %r31
	.word 0xb40d0000  ! 382: AND_R	and 	%r20, %r0, %r26
	.word 0xb0b4a010  ! 385: ORNcc_I	orncc 	%r18, 0x0010, %r24
	.word 0xbb540000  ! 386: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c53  ! 387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c53, %hpstate
	.word 0xfb1de034  ! 389: LDDF_I	ldd	[%r23, 0x0034], %f29
	.word 0xb5520000  ! 391: RDPR_PIL	rdpr	%pil, %r26
	.word 0xb1358000  ! 395: SRL_R	srl 	%r22, %r0, %r24
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0da078  ! 406: LDUB_I	ldub	[%r22 + 0x0078], %r30
	.word 0xb6354000  ! 410: ORN_R	orn 	%r21, %r0, %r27
	.word 0xfa1dc000  ! 413: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xb42ce14f  ! 415: ANDN_I	andn 	%r19, 0x014f, %r26
	setx	0x10104, %g1, %o0
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
	.word 0xb3518000  ! 425: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0d4000  ! 426: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf45c0000  ! 427: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xb5500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb43d2181  ! 430: XNOR_I	xnor 	%r20, 0x0181, %r26
	.word 0xb5641800  ! 431: MOVcc_R	<illegal instruction>
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20327, %g1, %o0
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
	.word 0xf65ce152  ! 441: LDX_I	ldx	[%r19 + 0x0152], %r27
	.word 0xf844c000  ! 443: LDSW_R	ldsw	[%r19 + %r0], %r28
	mov	2, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb540000  ! 450: RDPR_GL	<illegal instruction>
	.word 0xf80d202a  ! 455: LDUB_I	ldub	[%r20 + 0x002a], %r28
	.word 0xbeac21b4  ! 466: ANDNcc_I	andncc 	%r16, 0x01b4, %r31
	.word 0x879421ca  ! 467: WRPR_TT_I	wrpr	%r16, 0x01ca, %tt
	.word 0xfa1de17e  ! 468: LDD_I	ldd	[%r23 + 0x017e], %r29
	.word 0xbb51c000  ! 473: RDPR_TL	<illegal instruction>
	.word 0x8194614c  ! 479: WRPR_TPC_I	wrpr	%r17, 0x014c, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb60d208e  ! 483: AND_I	and 	%r20, 0x008e, %r27
	.word 0xf64c20c3  ! 484: LDSB_I	ldsb	[%r16 + 0x00c3], %r27
	setx	data_start_1, %g1, %r19
	.word 0xfa1d0000  ! 486: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb2858000  ! 489: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xf01d21ad  ! 493: LDD_I	ldd	[%r20 + 0x01ad], %r24
	.word 0xfc04c000  ! 497: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xfa44e098  ! 500: LDSW_I	ldsw	[%r19 + 0x0098], %r29
	.word 0xfb1cc000  ! 501: LDDF_R	ldd	[%r19, %r0], %f29
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb81c8000  ! 503: XOR_R	xor 	%r18, %r0, %r28
	.word 0xf45c60cc  ! 509: LDX_I	ldx	[%r17 + 0x00cc], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f1b  ! 510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1b, %hpstate
	.word 0xf31c618a  ! 512: LDDF_I	ldd	[%r17, 0x018a], %f25
	.word 0x8594601d  ! 513: WRPR_TSTATE_I	wrpr	%r17, 0x001d, %tstate
	.word 0xfd1d8000  ! 514: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf20da159  ! 516: LDUB_I	ldub	[%r22 + 0x0159], %r25
	.word 0x8394a0a5  ! 517: WRPR_TNPC_I	wrpr	%r18, 0x00a5, %tnpc
	.word 0xf25ca114  ! 519: LDX_I	ldx	[%r18 + 0x0114], %r25
	.word 0xf20c0000  ! 521: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf81d0000  ! 523: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf85d8000  ! 525: LDX_R	ldx	[%r22 + %r0], %r28
	mov	1, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0ca061  ! 528: LDUB_I	ldub	[%r18 + 0x0061], %r30
	.word 0xfa5d4000  ! 537: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf44d0000  ! 538: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xf644c000  ! 539: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf11c214e  ! 540: LDDF_I	ldd	[%r16, 0x014e], %f24
	.word 0xbc3c0000  ! 541: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xb62420b1  ! 542: SUB_I	sub 	%r16, 0x00b1, %r27
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85c0000  ! 546: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xff1c21b6  ! 547: LDDF_I	ldd	[%r16, 0x01b6], %f31
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 549: MOVcc_I	<illegal instruction>
	.word 0xb3480000  ! 550: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa4c61b5  ! 551: LDSB_I	ldsb	[%r17 + 0x01b5], %r29
	.word 0x859461cf  ! 554: WRPR_TSTATE_I	wrpr	%r17, 0x01cf, %tstate
	.word 0xfc140000  ! 555: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xfa54c000  ! 556: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0x819521df  ! 557: WRPR_TPC_I	wrpr	%r20, 0x01df, %tpc
	.word 0xbc45c000  ! 559: ADDC_R	addc 	%r23, %r0, %r30
	.word 0xf51c20ee  ! 560: LDDF_I	ldd	[%r16, 0x00ee], %f26
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1c214c  ! 565: LDD_I	ldd	[%r16 + 0x014c], %r30
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a030  ! 569: WRPR_PSTATE_I	wrpr	%r22, 0x0030, %pstate
	.word 0xf245a1ea  ! 570: LDSW_I	ldsw	[%r22 + 0x01ea], %r25
	.word 0xf21d8000  ! 571: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xf014e045  ! 574: LDUH_I	lduh	[%r19 + 0x0045], %r24
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b58000  ! 578: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xb82cc000  ! 581: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xb53dd000  ! 587: SRAX_R	srax	%r23, %r0, %r26
	.word 0xb7520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xf11c60d9  ! 592: LDDF_I	ldd	[%r17, 0x00d9], %f24
	.word 0xf244217f  ! 593: LDSW_I	ldsw	[%r16 + 0x017f], %r25
	.word 0xf205c000  ! 594: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0x8d9421ae  ! 596: WRPR_PSTATE_I	wrpr	%r16, 0x01ae, %pstate
	.word 0xfe140000  ! 598: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb5500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xf2040000  ! 604: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf85c0000  ! 607: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf24ce0f6  ! 610: LDSB_I	ldsb	[%r19 + 0x00f6], %r25
	.word 0xf204c000  ! 611: LDUW_R	lduw	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x819828cb  ! 614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0xf6056188  ! 619: LDUW_I	lduw	[%r21 + 0x0188], %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198395b  ! 620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195b, %hpstate
	.word 0xfc4da1ff  ! 622: LDSB_I	ldsb	[%r22 + 0x01ff], %r30
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1dc000  ! 626: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xf20cc000  ! 628: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xf204c000  ! 631: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf44da10e  ! 632: LDSB_I	ldsb	[%r22 + 0x010e], %r26
	.word 0x89956073  ! 635: WRPR_TICK_I	wrpr	%r21, 0x0073, %tick
	.word 0xfa0560fd  ! 637: LDUW_I	lduw	[%r21 + 0x00fd], %r29
	.word 0xf244c000  ! 638: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xf6442174  ! 639: LDSW_I	ldsw	[%r16 + 0x0174], %r27
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d0000  ! 653: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfc054000  ! 661: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xb7347001  ! 663: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xf404c000  ! 664: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfe55208b  ! 666: LDSH_I	ldsh	[%r20 + 0x008b], %r31
	.word 0x819520bd  ! 668: WRPR_TPC_I	wrpr	%r20, 0x00bd, %tpc
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xf91c4000  ! 672: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf04ce149  ! 673: LDSB_I	ldsb	[%r19 + 0x0149], %r24
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfe154000  ! 679: LDUH_R	lduh	[%r21 + %r0], %r31
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	setx	data_start_0, %g1, %r22
	.word 0xb605a1fb  ! 683: ADD_I	add 	%r22, 0x01fb, %r27
	.word 0x8795a105  ! 686: WRPR_TT_I	wrpr	%r22, 0x0105, %tt
	.word 0xf0154000  ! 691: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xfa1c21ad  ! 694: LDD_I	ldd	[%r16 + 0x01ad], %r29
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbebda153  ! 696: XNORcc_I	xnorcc 	%r22, 0x0153, %r31
	.word 0x8195a09c  ! 698: WRPR_TPC_I	wrpr	%r22, 0x009c, %tpc
	.word 0xf00c6132  ! 700: LDUB_I	ldub	[%r17 + 0x0132], %r24
	setx	0x33, %g1, %o0
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
	.word 0xf2150000  ! 705: LDUH_R	lduh	[%r20 + %r0], %r25
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c210e  ! 707: LDD_I	ldd	[%r16 + 0x010e], %r26
	.word 0xbeb560a6  ! 711: SUBCcc_I	orncc 	%r21, 0x00a6, %r31
	.word 0xbac4a0ef  ! 712: ADDCcc_I	addccc 	%r18, 0x00ef, %r29
	.word 0x91946093  ! 713: WRPR_PIL_I	wrpr	%r17, 0x0093, %pil
	.word 0xf11c8000  ! 716: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xb1504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf51dc000  ! 727: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf8140000  ! 728: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0x8995a1ab  ! 729: WRPR_TICK_I	wrpr	%r22, 0x01ab, %tick
	.word 0xbf643801  ! 730: MOVcc_I	<illegal instruction>
	.word 0xbd2cd000  ! 731: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xb28421cf  ! 734: ADDcc_I	addcc 	%r16, 0x01cf, %r25
	.word 0xf61da085  ! 736: LDD_I	ldd	[%r22 + 0x0085], %r27
	.word 0x8d95a0c8  ! 737: WRPR_PSTATE_I	wrpr	%r22, 0x00c8, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x819828cb  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0x859520b9  ! 741: WRPR_TSTATE_I	wrpr	%r20, 0x00b9, %tstate
	.word 0xf11ca066  ! 744: LDDF_I	ldd	[%r18, 0x0066], %f24
	.word 0xf24c4000  ! 745: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfc554000  ! 746: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf4544000  ! 747: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfa0c8000  ! 749: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf61ca09e  ! 750: LDD_I	ldd	[%r18 + 0x009e], %r27
	.word 0xf0544000  ! 751: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0x91952056  ! 752: WRPR_PIL_I	wrpr	%r20, 0x0056, %pil
	.word 0xb351c000  ! 756: RDPR_TL	<illegal instruction>
	.word 0xfe45a0af  ! 758: LDSW_I	ldsw	[%r22 + 0x00af], %r31
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x859520dc  ! 762: WRPR_TSTATE_I	wrpr	%r20, 0x00dc, %tstate
	.word 0xf6058000  ! 766: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xfd1d6115  ! 767: LDDF_I	ldd	[%r21, 0x0115], %f30
	.word 0xf8544000  ! 770: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0x8594617c  ! 771: WRPR_TSTATE_I	wrpr	%r17, 0x017c, %tstate
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0c61d2  ! 779: LDUB_I	ldub	[%r17 + 0x01d2], %r31
	.word 0xbb500000  ! 780: RDPR_TPC	<illegal instruction>
	.word 0xf454618c  ! 782: LDSH_I	ldsh	[%r17 + 0x018c], %r26
	.word 0xb751c000  ! 785: RDPR_TL	<illegal instruction>
	.word 0xf0450000  ! 787: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xfd1d604e  ! 788: LDDF_I	ldd	[%r21, 0x004e], %f30
	.word 0x85946018  ! 792: WRPR_TSTATE_I	wrpr	%r17, 0x0018, %tstate
	.word 0xb3480000  ! 793: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc0dc000  ! 798: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfc1ca1da  ! 799: LDD_I	ldd	[%r18 + 0x01da], %r30
	.word 0xf6048000  ! 803: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb7480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf044a100  ! 805: LDSW_I	ldsw	[%r18 + 0x0100], %r24
	setx	data_start_3, %g1, %r23
	.word 0xf31c8000  ! 808: LDDF_R	ldd	[%r18, %r0], %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983c51  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c51, %hpstate
	.word 0xf0542027  ! 811: LDSH_I	ldsh	[%r16 + 0x0027], %r24
	.word 0xf44d6057  ! 812: LDSB_I	ldsb	[%r21 + 0x0057], %r26
	.word 0xf854a143  ! 815: LDSH_I	ldsh	[%r18 + 0x0143], %r28
	setx	data_start_2, %g1, %r22
	.word 0xf6558000  ! 818: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf20c4000  ! 820: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0x8d94a0e3  ! 826: WRPR_PSTATE_I	wrpr	%r18, 0x00e3, %pstate
	.word 0xb150c000  ! 828: RDPR_TT	rdpr	%tt, %r24
	.word 0xfc444000  ! 829: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfe5d4000  ! 835: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xb7518000  ! 837: RDPR_PSTATE	<illegal instruction>
	.word 0x879520f0  ! 842: WRPR_TT_I	wrpr	%r20, 0x00f0, %tt
	.word 0xf45ce089  ! 843: LDX_I	ldx	[%r19 + 0x0089], %r26
	.word 0xf11d8000  ! 845: LDDF_R	ldd	[%r22, %r0], %f24
	setx	0x3, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c2066  ! 848: LDUB_I	ldub	[%r16 + 0x0066], %r26
	.word 0xf81da02d  ! 850: LDD_I	ldd	[%r22 + 0x002d], %r28
	.word 0x8995e1c2  ! 852: WRPR_TICK_I	wrpr	%r23, 0x01c2, %tick
	.word 0xfa1c8000  ! 853: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xf254c000  ! 854: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf615218b  ! 855: LDUH_I	lduh	[%r20 + 0x018b], %r27
	.word 0xf45c4000  ! 856: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xf00c0000  ! 858: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xfc4ca199  ! 861: LDSB_I	ldsb	[%r18 + 0x0199], %r30
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60ca167  ! 863: LDUB_I	ldub	[%r18 + 0x0167], %r27
	.word 0xf0548000  ! 864: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf405a03b  ! 866: LDUW_I	lduw	[%r22 + 0x003b], %r26
	.word 0xb150c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0xf20cc000  ! 868: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xfc1dc000  ! 870: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0x8594601a  ! 873: WRPR_TSTATE_I	wrpr	%r17, 0x001a, %tstate
	.word 0xfc158000  ! 877: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xbc2d8000  ! 879: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xb550c000  ! 883: RDPR_TT	<illegal instruction>
	.word 0xf85c0000  ! 887: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xfe5c60b0  ! 892: LDX_I	ldx	[%r17 + 0x00b0], %r31
	.word 0xf8448000  ! 893: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf0456079  ! 899: LDSW_I	ldsw	[%r21 + 0x0079], %r24
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c6103  ! 904: LDSB_I	ldsb	[%r17 + 0x0103], %r29
	.word 0xbf50c000  ! 905: RDPR_TT	rdpr	%tt, %r31
	.word 0xb9341000  ! 906: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xfe1cc000  ! 909: LDD_R	ldd	[%r19 + %r0], %r31
	mov	2, %r14
	.word 0xa193a000  ! 910: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf31ce0bb  ! 913: LDDF_I	ldd	[%r19, 0x00bb], %f25
	.word 0x839460e5  ! 915: WRPR_TNPC_I	wrpr	%r17, 0x00e5, %tnpc
	.word 0xb1346001  ! 918: SRL_I	srl 	%r17, 0x0001, %r24
	.word 0xbd510000  ! 919: RDPR_TICK	<illegal instruction>
	setx	0x3033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d8000  ! 928: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf45421fa  ! 929: LDSH_I	ldsh	[%r16 + 0x01fa], %r26
	.word 0xf4148000  ! 931: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xb2344000  ! 932: ORN_R	orn 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982ed1  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	setx	data_start_7, %g1, %r17
	.word 0xf614c000  ! 939: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf40de123  ! 940: LDUB_I	ldub	[%r23 + 0x0123], %r26
	.word 0xf01d0000  ! 941: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xfe456120  ! 943: LDSW_I	ldsw	[%r21 + 0x0120], %r31
	.word 0xb951c000  ! 944: RDPR_TL	<illegal instruction>
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2548000  ! 948: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf04561ce  ! 949: LDSW_I	ldsw	[%r21 + 0x01ce], %r24
	.word 0xf80d0000  ! 951: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfa146012  ! 952: LDUH_I	lduh	[%r17 + 0x0012], %r29
	.word 0xf60d61c1  ! 954: LDUB_I	ldub	[%r21 + 0x01c1], %r27
	.word 0xf6148000  ! 955: LDUH_R	lduh	[%r18 + %r0], %r27
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0x8195a07a  ! 960: WRPR_TPC_I	wrpr	%r22, 0x007a, %tpc
	.word 0xb4b461b0  ! 964: ORNcc_I	orncc 	%r17, 0x01b0, %r26
	.word 0xfe1561ec  ! 965: LDUH_I	lduh	[%r21 + 0x01ec], %r31
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8058000  ! 969: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xb1508000  ! 977: RDPR_TSTATE	<illegal instruction>
	.word 0xf4558000  ! 978: LDSH_R	ldsh	[%r22 + %r0], %r26
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205a192  ! 981: LDUW_I	lduw	[%r22 + 0x0192], %r25
	.word 0xf11de141  ! 983: LDDF_I	ldd	[%r23, 0x0141], %f24
	.word 0xbd344000  ! 984: SRL_R	srl 	%r17, %r0, %r30
	.word 0xb9510000  ! 986: RDPR_TICK	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd2d1000  ! 988: SLLX_R	sllx	%r20, %r0, %r30
	.word 0xf60560f8  ! 989: LDUW_I	lduw	[%r21 + 0x00f8], %r27
	.word 0x919561cf  ! 991: WRPR_PIL_I	wrpr	%r21, 0x01cf, %pil
	.word 0xf64c4000  ! 992: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfe44204f  ! 993: LDSW_I	ldsw	[%r16 + 0x004f], %r31
	setx	0x22e, %g1, %o0
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
	.word 0xf20da048  ! 997: LDUB_I	ldub	[%r22 + 0x0048], %r25
	.word 0xfa440000  ! 999: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xbd510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xf214c000  ! 1007: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfa5c8000  ! 1009: LDX_R	ldx	[%r18 + %r0], %r29
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 1013: LDSB_R	ldsb	[%r17 + %r0], %r26
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d21db  ! 1016: LDUB_I	ldub	[%r20 + 0x01db], %r29
	.word 0xb9508000  ! 1020: RDPR_TSTATE	<illegal instruction>
	.word 0xf51d4000  ! 1021: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xf854e10c  ! 1022: LDSH_I	ldsh	[%r19 + 0x010c], %r28
	.word 0xf44c0000  ! 1024: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xb73d6001  ! 1027: SRA_I	sra 	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 1028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf804e056  ! 1038: LDUW_I	lduw	[%r19 + 0x0056], %r28
	.word 0xf845e17f  ! 1042: LDSW_I	ldsw	[%r23 + 0x017f], %r28
	.word 0xf41cc000  ! 1043: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb9500000  ! 1045: RDPR_TPC	<illegal instruction>
	.word 0xfe144000  ! 1046: LDUH_R	lduh	[%r17 + %r0], %r31
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 1051: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1053: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r23
	.word 0xf41d8000  ! 1056: LDD_R	ldd	[%r22 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 1057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xfa05c000  ! 1058: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xfe5561dc  ! 1060: LDSH_I	ldsh	[%r21 + 0x01dc], %r31
	.word 0xf21c4000  ! 1064: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xb3518000  ! 1065: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1066: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa5c6177  ! 1067: LDX_I	ldx	[%r17 + 0x0177], %r29
	.word 0xbd2c7001  ! 1068: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0x8994a093  ! 1072: WRPR_TICK_I	wrpr	%r18, 0x0093, %tick
	setx	data_start_0, %g1, %r20
	.word 0xfb1ca0b9  ! 1077: LDDF_I	ldd	[%r18, 0x00b9], %f29
	.word 0xf05561d7  ! 1079: LDSH_I	ldsh	[%r21 + 0x01d7], %r24
	setx	0x32a, %g1, %o0
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
	.word 0xf45ca0fc  ! 1083: LDX_I	ldx	[%r18 + 0x00fc], %r26
	.word 0xba2c4000  ! 1084: ANDN_R	andn 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xf8144000  ! 1087: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfc05c000  ! 1088: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf855e1f7  ! 1094: LDSH_I	ldsh	[%r23 + 0x01f7], %r28
	.word 0xbf518000  ! 1095: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfc148000  ! 1097: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xfe540000  ! 1099: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf80da0a0  ! 1101: LDUB_I	ldub	[%r22 + 0x00a0], %r28
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa15a1a0  ! 1111: LDUH_I	lduh	[%r22 + 0x01a0], %r29
	.word 0xfa440000  ! 1114: LDSW_R	ldsw	[%r16 + %r0], %r29
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf414a192  ! 1118: LDUH_I	lduh	[%r18 + 0x0192], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xf51ca1dd  ! 1122: LDDF_I	ldd	[%r18, 0x01dd], %f26
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1126: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfe5de100  ! 1130: LDX_I	ldx	[%r23 + 0x0100], %r31
	.word 0xff1dc000  ! 1139: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d0000  ! 1148: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xb9540000  ! 1151: RDPR_GL	<illegal instruction>
	.word 0xfe4ca186  ! 1152: LDSB_I	ldsb	[%r18 + 0x0186], %r31
	.word 0x9194a030  ! 1154: WRPR_PIL_I	wrpr	%r18, 0x0030, %pil
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bde0d7  ! 1156: XNORcc_I	xnorcc 	%r23, 0x00d7, %r27
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 1158: MOVcc_I	<illegal instruction>
	.word 0xf40dc000  ! 1161: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf65c6074  ! 1162: LDX_I	ldx	[%r17 + 0x0074], %r27
	.word 0xfa5d6159  ! 1164: LDX_I	ldx	[%r21 + 0x0159], %r29
	.word 0xf44da19a  ! 1166: LDSB_I	ldsb	[%r22 + 0x019a], %r26
	.word 0xbe1d204c  ! 1168: XOR_I	xor 	%r20, 0x004c, %r31
	.word 0x8195e06b  ! 1170: WRPR_TPC_I	wrpr	%r23, 0x006b, %tpc
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaadc000  ! 1174: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xf20d0000  ! 1180: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf31ce0df  ! 1183: LDDF_I	ldd	[%r19, 0x00df], %f25
	.word 0xfc15a155  ! 1184: LDUH_I	lduh	[%r22 + 0x0155], %r30
	.word 0xf64d0000  ! 1185: LDSB_R	ldsb	[%r20 + %r0], %r27
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf605e0de  ! 1193: LDUW_I	lduw	[%r23 + 0x00de], %r27
	.word 0x9195e095  ! 1198: WRPR_PIL_I	wrpr	%r23, 0x0095, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983a9b  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9b, %hpstate
	setx	data_start_5, %g1, %r22
	.word 0xb350c000  ! 1203: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xfa1ca0b3  ! 1214: LDD_I	ldd	[%r18 + 0x00b3], %r29
	.word 0xfa152148  ! 1216: LDUH_I	lduh	[%r20 + 0x0148], %r29
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05c4000  ! 1221: LDX_R	ldx	[%r17 + %r0], %r24
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71d60be  ! 1226: LDDF_I	ldd	[%r21, 0x00be], %f27
	.word 0xfa450000  ! 1227: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf40dc000  ! 1228: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xfe5d4000  ! 1230: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xb7508000  ! 1231: RDPR_TSTATE	<illegal instruction>
	.word 0xb5344000  ! 1237: SRL_R	srl 	%r17, %r0, %r26
	.word 0xf2144000  ! 1238: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0x8995615a  ! 1242: WRPR_TICK_I	wrpr	%r21, 0x015a, %tick
	.word 0xbc15a112  ! 1246: OR_I	or 	%r22, 0x0112, %r30
	.word 0xbd508000  ! 1249: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r18
	.word 0xb1504000  ! 1255: RDPR_TNPC	<illegal instruction>
	.word 0xf45d209e  ! 1259: LDX_I	ldx	[%r20 + 0x009e], %r26
	.word 0xfc048000  ! 1261: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xf00c218e  ! 1264: LDUB_I	ldub	[%r16 + 0x018e], %r24
	.word 0xbe94a16d  ! 1265: ORcc_I	orcc 	%r18, 0x016d, %r31
	.word 0xf25d4000  ! 1267: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf45de1ed  ! 1271: LDX_I	ldx	[%r23 + 0x01ed], %r26
	.word 0xb0458000  ! 1272: ADDC_R	addc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f49  ! 1277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f49, %hpstate
	.word 0xf25d211d  ! 1278: LDX_I	ldx	[%r20 + 0x011d], %r25
	.word 0xf81d4000  ! 1279: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xf85421c9  ! 1285: LDSH_I	ldsh	[%r16 + 0x01c9], %r28
	setx	data_start_1, %g1, %r18
	.word 0xfa5c0000  ! 1288: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf205a105  ! 1289: LDUW_I	lduw	[%r22 + 0x0105], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c0b  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0b, %hpstate
	.word 0xf2544000  ! 1291: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0x8794e106  ! 1292: WRPR_TT_I	wrpr	%r19, 0x0106, %tt
	.word 0xfa54a008  ! 1298: LDSH_I	ldsh	[%r18 + 0x0008], %r29
	mov	2, %r12
	.word 0x8f932000  ! 1299: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r19
	.word 0xf00dc000  ! 1305: LDUB_R	ldub	[%r23 + %r0], %r24
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0da147  ! 1314: LDUB_I	ldub	[%r22 + 0x0147], %r30
	.word 0xbf508000  ! 1320: RDPR_TSTATE	<illegal instruction>
	.word 0xb285a1a4  ! 1323: ADDcc_I	addcc 	%r22, 0x01a4, %r25
	.word 0xf45c0000  ! 1324: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xb7508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xf6540000  ! 1332: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xbaac8000  ! 1336: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0x8394613d  ! 1338: WRPR_TNPC_I	wrpr	%r17, 0x013d, %tnpc
	.word 0xbf510000  ! 1342: RDPR_TICK	rdpr	%tick, %r31
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4da10d  ! 1344: LDSB_I	ldsb	[%r22 + 0x010d], %r31
	.word 0xf404606b  ! 1345: LDUW_I	lduw	[%r17 + 0x006b], %r26
	.word 0xbc14c000  ! 1347: OR_R	or 	%r19, %r0, %r30
	setx	0x20229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 1359: RDPR_PSTATE	<illegal instruction>
	.word 0xf45c21ff  ! 1360: LDX_I	ldx	[%r16 + 0x01ff], %r26
	setx	data_start_6, %g1, %r21
	.word 0xbf504000  ! 1368: RDPR_TNPC	<illegal instruction>
	.word 0x8794e0a8  ! 1375: WRPR_TT_I	wrpr	%r19, 0x00a8, %tt
	.word 0xf605a1f8  ! 1376: LDUW_I	lduw	[%r22 + 0x01f8], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1d4000  ! 1378: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xfa0ca0ab  ! 1379: LDUB_I	ldub	[%r18 + 0x00ab], %r29
	.word 0x8794218e  ! 1386: WRPR_TT_I	wrpr	%r16, 0x018e, %tt
	.word 0xfa4d200c  ! 1389: LDSB_I	ldsb	[%r20 + 0x000c], %r29
	.word 0xf40c6037  ! 1390: LDUB_I	ldub	[%r17 + 0x0037], %r26
	.word 0xbd3da001  ! 1391: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xb9348000  ! 1392: SRL_R	srl 	%r18, %r0, %r28
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00c2087  ! 1412: LDUB_I	ldub	[%r16 + 0x0087], %r24
	.word 0xbb480000  ! 1413: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf61d20a4  ! 1417: LDD_I	ldd	[%r20 + 0x00a4], %r27
	.word 0xf60d60d3  ! 1419: LDUB_I	ldub	[%r21 + 0x00d3], %r27
	.word 0xfe0c2022  ! 1420: LDUB_I	ldub	[%r16 + 0x0022], %r31
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e0dc  ! 1423: WRPR_TT_I	wrpr	%r23, 0x00dc, %tt
	.word 0xf24ca015  ! 1425: LDSB_I	ldsb	[%r18 + 0x0015], %r25
	.word 0x919461e6  ! 1426: WRPR_PIL_I	wrpr	%r17, 0x01e6, %pil
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194208a  ! 1435: WRPR_TPC_I	wrpr	%r16, 0x008a, %tpc
	.word 0x8d95e07f  ! 1437: WRPR_PSTATE_I	wrpr	%r23, 0x007f, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 1438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 1440: RDPR_TNPC	<illegal instruction>
	.word 0xb1520000  ! 1442: RDPR_PIL	<illegal instruction>
	.word 0xbd51c000  ! 1446: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0x8795e08b  ! 1450: WRPR_TT_I	wrpr	%r23, 0x008b, %tt
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 1452: RDPR_TT	<illegal instruction>
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6040000  ! 1457: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf6540000  ! 1458: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xbec50000  ! 1460: ADDCcc_R	addccc 	%r20, %r0, %r31
	.word 0xb8350000  ! 1462: ORN_R	orn 	%r20, %r0, %r28
	.word 0xbc9d211f  ! 1465: XORcc_I	xorcc 	%r20, 0x011f, %r30
	.word 0xf645c000  ! 1468: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb3504000  ! 1469: RDPR_TNPC	<illegal instruction>
	.word 0xf20c4000  ! 1473: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0x8795213f  ! 1474: WRPR_TT_I	wrpr	%r20, 0x013f, %tt
	.word 0xfa1c0000  ! 1476: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xf255e004  ! 1477: LDSH_I	ldsh	[%r23 + 0x0004], %r25
	.word 0xb5520000  ! 1478: RDPR_PIL	<illegal instruction>
	.word 0xb7504000  ! 1480: RDPR_TNPC	<illegal instruction>
	.word 0xf8544000  ! 1481: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xbd500000  ! 1482: RDPR_TPC	<illegal instruction>
	.word 0xb685a03e  ! 1485: ADDcc_I	addcc 	%r22, 0x003e, %r27
	.word 0xba148000  ! 1488: OR_R	or 	%r18, %r0, %r29
	.word 0xfd1ce0c3  ! 1492: LDDF_I	ldd	[%r19, 0x00c3], %f30
	.word 0xb4c5a04a  ! 1494: ADDCcc_I	addccc 	%r22, 0x004a, %r26
	.word 0xfa5c4000  ! 1499: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf25561e4  ! 1502: LDSH_I	ldsh	[%r21 + 0x01e4], %r25
	.word 0xb951c000  ! 1507: RDPR_TL	<illegal instruction>
	.word 0xfe4de165  ! 1508: LDSB_I	ldsb	[%r23 + 0x0165], %r31
	.word 0xf844c000  ! 1513: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf64d0000  ! 1516: LDSB_R	ldsb	[%r20 + %r0], %r27
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1ce0db  ! 1526: LDDF_I	ldd	[%r19, 0x00db], %f29
	.word 0xf40d4000  ! 1527: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfa4c616e  ! 1528: LDSB_I	ldsb	[%r17 + 0x016e], %r29
	.word 0xfe4c4000  ! 1529: LDSB_R	ldsb	[%r17 + %r0], %r31
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 1533: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x9195a184  ! 1534: WRPR_PIL_I	wrpr	%r22, 0x0184, %pil
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d601b  ! 1539: LDX_I	ldx	[%r21 + 0x001b], %r27
	mov	2, %r12
	.word 0x8f932000  ! 1540: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa14c000  ! 1545: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xf655a1ea  ! 1547: LDSH_I	ldsh	[%r22 + 0x01ea], %r27
	.word 0xfe55c000  ! 1548: LDSH_R	ldsh	[%r23 + %r0], %r31
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81cc000  ! 1551: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xfe0d8000  ! 1552: LDUB_R	ldub	[%r22 + %r0], %r31
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c0000  ! 1555: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0x8195a1ff  ! 1558: WRPR_TPC_I	wrpr	%r22, 0x01ff, %tpc
	.word 0xbebca103  ! 1563: XNORcc_I	xnorcc 	%r18, 0x0103, %r31
	.word 0xb3510000  ! 1565: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r16
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25d4000  ! 1572: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xff1dc000  ! 1574: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xf64ca17c  ! 1577: LDSB_I	ldsb	[%r18 + 0x017c], %r27
	.word 0xf4550000  ! 1578: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xb6b561a2  ! 1581: ORNcc_I	orncc 	%r21, 0x01a2, %r27
	.word 0xf04de0b7  ! 1588: LDSB_I	ldsb	[%r23 + 0x00b7], %r24
	.word 0xfa4de1a9  ! 1589: LDSB_I	ldsb	[%r23 + 0x01a9], %r29
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 1594: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf854c000  ! 1595: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xfc556083  ! 1596: LDSH_I	ldsh	[%r21 + 0x0083], %r30
	.word 0x8794e1ee  ! 1598: WRPR_TT_I	wrpr	%r19, 0x01ee, %tt
	.word 0xf8442006  ! 1600: LDSW_I	ldsw	[%r16 + 0x0006], %r28
	setx	data_start_0, %g1, %r17
	.word 0xb150c000  ! 1607: RDPR_TT	<illegal instruction>
	.word 0xf05560a0  ! 1608: LDSH_I	ldsh	[%r21 + 0x00a0], %r24
	.word 0xf004e174  ! 1609: LDUW_I	lduw	[%r19 + 0x0174], %r24
	mov	2, %r14
	.word 0xa193a000  ! 1611: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf84dc000  ! 1612: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xfc5cc000  ! 1614: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfe5cc000  ! 1616: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xf805c000  ! 1617: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf41d4000  ! 1619: LDD_R	ldd	[%r21 + %r0], %r26
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb62de12e  ! 1627: ANDN_I	andn 	%r23, 0x012e, %r27
	.word 0x919420c9  ! 1628: WRPR_PIL_I	wrpr	%r16, 0x00c9, %pil
	.word 0xbe9561ef  ! 1629: ORcc_I	orcc 	%r21, 0x01ef, %r31
	.word 0xf64ce0ee  ! 1630: LDSB_I	ldsb	[%r19 + 0x00ee], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 1631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0xf21c613e  ! 1632: LDD_I	ldd	[%r17 + 0x013e], %r25
	.word 0xb6bd0000  ! 1633: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xf414a12b  ! 1635: LDUH_I	lduh	[%r18 + 0x012b], %r26
	.word 0xf0058000  ! 1638: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf91d0000  ! 1640: LDDF_R	ldd	[%r20, %r0], %f28
	setx	0x10125, %g1, %o0
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
	.word 0x8d94e188  ! 1645: WRPR_PSTATE_I	wrpr	%r19, 0x0188, %pstate
	.word 0xf214604a  ! 1646: LDUH_I	lduh	[%r17 + 0x004a], %r25
	.word 0xfe14c000  ! 1647: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xfc4dc000  ! 1648: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfc058000  ! 1649: LDUW_R	lduw	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 1650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	setx	data_start_1, %g1, %r22
	.word 0xb5510000  ! 1653: RDPR_TICK	<illegal instruction>
	.word 0xfc5cc000  ! 1654: LDX_R	ldx	[%r19 + %r0], %r30
	setx	data_start_2, %g1, %r17
	.word 0xb93ce001  ! 1656: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xb03521b1  ! 1658: ORN_I	orn 	%r20, 0x01b1, %r24
	.word 0xbc350000  ! 1660: SUBC_R	orn 	%r20, %r0, %r30
	.word 0xb5500000  ! 1665: RDPR_TPC	<illegal instruction>
	setx	0x20026, %g1, %o0
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
	mov	2, %r14
	.word 0xa193a000  ! 1672: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf01de11b  ! 1675: LDD_I	ldd	[%r23 + 0x011b], %r24
	.word 0xb551c000  ! 1676: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0x859420e3  ! 1682: WRPR_TSTATE_I	wrpr	%r16, 0x00e3, %tstate
	.word 0xf0544000  ! 1684: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xf71d0000  ! 1688: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xb8b4e009  ! 1691: SUBCcc_I	orncc 	%r19, 0x0009, %r28
	.word 0xf04de030  ! 1692: LDSB_I	ldsb	[%r23 + 0x0030], %r24
	.word 0xfe5d61b8  ! 1693: LDX_I	ldx	[%r21 + 0x01b8], %r31
	.word 0xf054200c  ! 1694: LDSH_I	ldsh	[%r16 + 0x000c], %r24
	.word 0xfa45c000  ! 1700: LDSW_R	ldsw	[%r23 + %r0], %r29
	setx	data_start_7, %g1, %r18
	.word 0xf605e086  ! 1705: LDUW_I	lduw	[%r23 + 0x0086], %r27
	.word 0xf21ce1fa  ! 1706: LDD_I	ldd	[%r19 + 0x01fa], %r25
	.word 0xbb500000  ! 1710: RDPR_TPC	<illegal instruction>
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d21f2  ! 1713: LDSB_I	ldsb	[%r20 + 0x01f2], %r27
	.word 0xf24dc000  ! 1714: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf01461cf  ! 1717: LDUH_I	lduh	[%r17 + 0x01cf], %r24
	.word 0xbabde1ac  ! 1728: XNORcc_I	xnorcc 	%r23, 0x01ac, %r29
	.word 0xf045203b  ! 1732: LDSW_I	ldsw	[%r20 + 0x003b], %r24
	.word 0xf0452003  ! 1733: LDSW_I	ldsw	[%r20 + 0x0003], %r24
	mov	0, %r12
	.word 0x8f932000  ! 1734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8995611e  ! 1736: WRPR_TICK_I	wrpr	%r21, 0x011e, %tick
	.word 0xf41d4000  ! 1743: LDD_R	ldd	[%r21 + %r0], %r26
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0d8000  ! 1758: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb3510000  ! 1760: RDPR_TICK	<illegal instruction>
	.word 0xb0342025  ! 1761: SUBC_I	orn 	%r16, 0x0025, %r24
	.word 0xfd1d2182  ! 1762: LDDF_I	ldd	[%r20, 0x0182], %f30
	.word 0xf045e001  ! 1763: LDSW_I	ldsw	[%r23 + 0x0001], %r24
	.word 0xfe154000  ! 1764: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf845e0b7  ! 1772: LDSW_I	ldsw	[%r23 + 0x00b7], %r28
	.word 0xf40d2012  ! 1773: LDUB_I	ldub	[%r20 + 0x0012], %r26
	mov	1, %r14
	.word 0xa193a000  ! 1775: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61d8000  ! 1780: LDD_R	ldd	[%r22 + %r0], %r27
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49d6189  ! 1789: XORcc_I	xorcc 	%r21, 0x0189, %r26
	.word 0xf24cc000  ! 1790: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xf245e1e8  ! 1792: LDSW_I	ldsw	[%r23 + 0x01e8], %r25
	.word 0x8d94a04f  ! 1793: WRPR_PSTATE_I	wrpr	%r18, 0x004f, %pstate
	.word 0xfa1d60e6  ! 1794: LDD_I	ldd	[%r21 + 0x00e6], %r29
	.word 0xf815a001  ! 1799: LDUH_I	lduh	[%r22 + 0x0001], %r28
	.word 0xf51dc000  ! 1802: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf04dc000  ! 1804: LDSB_R	ldsb	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc144000  ! 1807: OR_R	or 	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 1810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	.word 0xf71d6026  ! 1812: LDDF_I	ldd	[%r21, 0x0026], %f27
	.word 0xb950c000  ! 1814: RDPR_TT	<illegal instruction>
	.word 0xfd1cc000  ! 1818: LDDF_R	ldd	[%r19, %r0], %f30
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb83c8000  ! 1821: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xff1c60e0  ! 1822: LDDF_I	ldd	[%r17, 0x00e0], %f31
	.word 0xf44c8000  ! 1824: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xff1d607a  ! 1830: LDDF_I	ldd	[%r21, 0x007a], %f31
	setx	data_start_3, %g1, %r16
	.word 0xf055a0b4  ! 1835: LDSH_I	ldsh	[%r22 + 0x00b4], %r24
	.word 0xb7520000  ! 1837: RDPR_PIL	<illegal instruction>
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952111  ! 1840: WRPR_PIL_I	wrpr	%r20, 0x0111, %pil
	.word 0xf05ca18e  ! 1843: LDX_I	ldx	[%r18 + 0x018e], %r24
	.word 0xfe0561be  ! 1845: LDUW_I	lduw	[%r21 + 0x01be], %r31
	.word 0xfc0c8000  ! 1855: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xf8440000  ! 1860: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xb9508000  ! 1861: RDPR_TSTATE	<illegal instruction>
	.word 0xba1d0000  ! 1863: XOR_R	xor 	%r20, %r0, %r29
	.word 0xbd2c1000  ! 1864: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xbd518000  ! 1870: RDPR_PSTATE	<illegal instruction>
	.word 0xfe048000  ! 1872: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf65d2097  ! 1877: LDX_I	ldx	[%r20 + 0x0097], %r27
	setx	0x227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952124  ! 1881: WRPR_TNPC_I	wrpr	%r20, 0x0124, %tnpc
	.word 0xbd504000  ! 1883: RDPR_TNPC	<illegal instruction>
	.word 0x8195a07a  ! 1886: WRPR_TPC_I	wrpr	%r22, 0x007a, %tpc
	.word 0xb62d60da  ! 1887: ANDN_I	andn 	%r21, 0x00da, %r27
	.word 0xf81c2085  ! 1888: LDD_I	ldd	[%r16 + 0x0085], %r28
	.word 0xf8448000  ! 1892: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfe556058  ! 1894: LDSH_I	ldsh	[%r21 + 0x0058], %r31
	.word 0xf4144000  ! 1898: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xb9504000  ! 1902: RDPR_TNPC	<illegal instruction>
	.word 0xfc5d6135  ! 1903: LDX_I	ldx	[%r21 + 0x0135], %r30
	.word 0xfc14c000  ! 1905: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xb350c000  ! 1906: RDPR_TT	<illegal instruction>
	.word 0x899561d0  ! 1908: WRPR_TICK_I	wrpr	%r21, 0x01d0, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1909: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe440000  ! 1913: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xb40dc000  ! 1918: AND_R	and 	%r23, %r0, %r26
	.word 0xfd1d610d  ! 1920: LDDF_I	ldd	[%r21, 0x010d], %f30
	.word 0xf8144000  ! 1921: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf04c4000  ! 1925: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf2050000  ! 1933: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xfa5dc000  ! 1934: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xb9504000  ! 1937: RDPR_TNPC	<illegal instruction>
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa05c000  ! 1943: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xf45c8000  ! 1948: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb9500000  ! 1952: RDPR_TPC	<illegal instruction>
	.word 0x89952138  ! 1955: WRPR_TICK_I	wrpr	%r20, 0x0138, %tick
	.word 0xf60ce029  ! 1956: LDUB_I	ldub	[%r19 + 0x0029], %r27
	.word 0xf04d4000  ! 1957: LDSB_R	ldsb	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983ad1  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad1, %hpstate
	.word 0xf005e1cd  ! 1961: LDUW_I	lduw	[%r23 + 0x01cd], %r24
	.word 0x91956163  ! 1966: WRPR_PIL_I	wrpr	%r21, 0x0163, %pil
	.word 0xfa5cc000  ! 1968: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf81461de  ! 1971: LDUH_I	lduh	[%r17 + 0x01de], %r28
	.word 0xf2040000  ! 1975: LDUW_R	lduw	[%r16 + %r0], %r25
	setx	0x30329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb62d6083  ! 1981: ANDN_I	andn 	%r21, 0x0083, %r27
	.word 0xf44cc000  ! 1986: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xfc044000  ! 1992: LDUW_R	lduw	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b9b  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9b, %hpstate
	.word 0xf4554000  ! 1999: LDSH_R	ldsh	[%r21 + %r0], %r26
	mov	1, %r14
	.word 0xa193a000  ! 2000: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf65460ac  ! 2003: LDSH_I	ldsh	[%r17 + 0x00ac], %r27
	.word 0xfc14a014  ! 2004: LDUH_I	lduh	[%r18 + 0x0014], %r30
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa442181  ! 2006: LDSW_I	ldsw	[%r16 + 0x0181], %r29
	.word 0x8d95203f  ! 2007: WRPR_PSTATE_I	wrpr	%r20, 0x003f, %pstate
	.word 0x8395e0b4  ! 2009: WRPR_TNPC_I	wrpr	%r23, 0x00b4, %tnpc
	.word 0xb7510000  ! 2011: RDPR_TICK	<illegal instruction>
	.word 0xfb1d0000  ! 2012: LDDF_R	ldd	[%r20, %r0], %f29
	mov	1, %r14
	.word 0xa193a000  ! 2014: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 2020: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfa14c000  ! 2024: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xf014a009  ! 2025: LDUH_I	lduh	[%r18 + 0x0009], %r24
	mov	1, %r14
	.word 0xa193a000  ! 2027: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4440000  ! 2028: ADDC_R	addc 	%r16, %r0, %r26
	.word 0xb5510000  ! 2029: RDPR_TICK	<illegal instruction>
	.word 0xb33dd000  ! 2030: SRAX_R	srax	%r23, %r0, %r25
	.word 0xfc4dc000  ! 2032: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0x8194a0b0  ! 2036: WRPR_TPC_I	wrpr	%r18, 0x00b0, %tpc
	.word 0xf25ca120  ! 2038: LDX_I	ldx	[%r18 + 0x0120], %r25
	.word 0xfc0c8000  ! 2041: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xfa45e03d  ! 2044: LDSW_I	ldsw	[%r23 + 0x003d], %r29
	setx	data_start_3, %g1, %r20
	.word 0xf85d61f2  ! 2047: LDX_I	ldx	[%r21 + 0x01f2], %r28
	.word 0xf61ce181  ! 2051: LDD_I	ldd	[%r19 + 0x0181], %r27
	.word 0xf51c8000  ! 2055: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf60d8000  ! 2056: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xf844c000  ! 2057: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xbd480000  ! 2059: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x1c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 2066: ORN_R	orn 	%r21, %r0, %r26
	.word 0xf6042191  ! 2068: LDUW_I	lduw	[%r16 + 0x0191], %r27
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015a14d  ! 2071: LDUH_I	lduh	[%r22 + 0x014d], %r24
	.word 0xfc45a1d6  ! 2074: LDSW_I	ldsw	[%r22 + 0x01d6], %r30
	.word 0xf8448000  ! 2075: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfc0c4000  ! 2076: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xb1518000  ! 2077: RDPR_PSTATE	<illegal instruction>
	.word 0xf20cc000  ! 2083: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xb3480000  ! 2084: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbc452032  ! 2085: ADDC_I	addc 	%r20, 0x0032, %r30
	.word 0xf60de18c  ! 2087: LDUB_I	ldub	[%r23 + 0x018c], %r27
	.word 0x8395a156  ! 2089: WRPR_TNPC_I	wrpr	%r22, 0x0156, %tnpc
	.word 0xfa4d4000  ! 2090: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf25da1e0  ! 2095: LDX_I	ldx	[%r22 + 0x01e0], %r25
	.word 0xfb1dc000  ! 2097: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xfa0d0000  ! 2098: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xb1540000  ! 2100: RDPR_GL	<illegal instruction>
	.word 0xb750c000  ! 2101: RDPR_TT	<illegal instruction>
	.word 0xfa442047  ! 2102: LDSW_I	ldsw	[%r16 + 0x0047], %r29
	.word 0xb82d0000  ! 2107: ANDN_R	andn 	%r20, %r0, %r28
	.word 0xb92c3001  ! 2109: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xfa5da0be  ! 2110: LDX_I	ldx	[%r22 + 0x00be], %r29
	.word 0xfa1da0e2  ! 2111: LDD_I	ldd	[%r22 + 0x00e2], %r29
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983fc1  ! 2114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc1, %hpstate
	.word 0xbcb42036  ! 2115: SUBCcc_I	orncc 	%r16, 0x0036, %r30
	.word 0xbd480000  ! 2116: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc05a1a9  ! 2119: LDUW_I	lduw	[%r22 + 0x01a9], %r30
	.word 0xf814611d  ! 2125: LDUH_I	lduh	[%r17 + 0x011d], %r28
	.word 0xf615e009  ! 2127: LDUH_I	lduh	[%r23 + 0x0009], %r27
	.word 0xbb480000  ! 2129: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80420b3  ! 2132: ADD_I	add 	%r16, 0x00b3, %r28
	.word 0xfa040000  ! 2133: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfe4d4000  ! 2143: LDSB_R	ldsb	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 2144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xfa4c6075  ! 2145: LDSB_I	ldsb	[%r17 + 0x0075], %r29
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952109  ! 2147: WRPR_TPC_I	wrpr	%r20, 0x0109, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982fd9  ! 2148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xbb504000  ! 2149: RDPR_TNPC	<illegal instruction>
	.word 0xf445e01a  ! 2150: LDSW_I	ldsw	[%r23 + 0x001a], %r26
	.word 0xf05d4000  ! 2152: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf014e07f  ! 2154: LDUH_I	lduh	[%r19 + 0x007f], %r24
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 2161: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c6006  ! 2165: LDX_I	ldx	[%r17 + 0x0006], %r30
	.word 0x8595a06e  ! 2166: WRPR_TSTATE_I	wrpr	%r22, 0x006e, %tstate
	.word 0xf2548000  ! 2170: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf414e147  ! 2173: LDUH_I	lduh	[%r19 + 0x0147], %r26
	.word 0xb9500000  ! 2174: RDPR_TPC	<illegal instruction>
	.word 0xf615a003  ! 2175: LDUH_I	lduh	[%r22 + 0x0003], %r27
	.word 0xf0054000  ! 2178: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfa55e130  ! 2179: LDSH_I	ldsh	[%r23 + 0x0130], %r29
	.word 0x91946036  ! 2182: WRPR_PIL_I	wrpr	%r17, 0x0036, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 2183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xf4458000  ! 2185: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf41dc000  ! 2186: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xf84dc000  ! 2187: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xfa0ce1ac  ! 2191: LDUB_I	ldub	[%r19 + 0x01ac], %r29
	.word 0xf04dc000  ! 2195: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xb81c613b  ! 2197: XOR_I	xor 	%r17, 0x013b, %r28
	.word 0xf855a0c7  ! 2198: LDSH_I	ldsh	[%r22 + 0x00c7], %r28
	.word 0xf6548000  ! 2200: LDSH_R	ldsh	[%r18 + %r0], %r27
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 2203: RDPR_GL	rdpr	%-, %r28
	.word 0xb7500000  ! 2205: RDPR_TPC	<illegal instruction>
	.word 0xfc1c4000  ! 2206: LDD_R	ldd	[%r17 + %r0], %r30
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2a4a0b4  ! 2214: SUBcc_I	subcc 	%r18, 0x00b4, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983c1b  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1b, %hpstate
	.word 0xf00561ec  ! 2219: LDUW_I	lduw	[%r21 + 0x01ec], %r24
	.word 0xfc5d603c  ! 2220: LDX_I	ldx	[%r21 + 0x003c], %r30
	.word 0x8595614c  ! 2222: WRPR_TSTATE_I	wrpr	%r21, 0x014c, %tstate
	.word 0xf20d61ae  ! 2225: LDUB_I	ldub	[%r21 + 0x01ae], %r25
	.word 0x8994a05d  ! 2228: WRPR_TICK_I	wrpr	%r18, 0x005d, %tick
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 2233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xbb480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3508000  ! 2240: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e00c  ! 2241: WRPR_PIL_I	wrpr	%r23, 0x000c, %pil
	.word 0xb5480000  ! 2242: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 2244: RDPR_PIL	<illegal instruction>
	.word 0xf2454000  ! 2247: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf01c8000  ! 2248: LDD_R	ldd	[%r18 + %r0], %r24
	mov	0, %r14
	.word 0xa193a000  ! 2251: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2154000  ! 2254: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xf44560a5  ! 2257: LDSW_I	ldsw	[%r21 + 0x00a5], %r26
	.word 0xb1520000  ! 2259: RDPR_PIL	<illegal instruction>
	.word 0xf0440000  ! 2260: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf21d0000  ! 2261: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xfd1d215a  ! 2262: LDDF_I	ldd	[%r20, 0x015a], %f30
	.word 0xf04c206c  ! 2264: LDSB_I	ldsb	[%r16 + 0x006c], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983899  ! 2266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1899, %hpstate
	.word 0xb3480000  ! 2268: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb0ad0000  ! 2269: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb5520000  ! 2270: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982899  ! 2271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xf4144000  ! 2274: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xb751c000  ! 2275: RDPR_TL	rdpr	%tl, %r27
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9461b9  ! 2279: WRPR_PSTATE_I	wrpr	%r17, 0x01b9, %pstate
	.word 0xb9643801  ! 2280: MOVcc_I	<illegal instruction>
	setx	0x3010c, %g1, %o0
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
	.word 0x81982e4b  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0x8795a084  ! 2287: WRPR_TT_I	wrpr	%r22, 0x0084, %tt
	.word 0xb2354000  ! 2288: ORN_R	orn 	%r21, %r0, %r25
	.word 0xf40d6047  ! 2291: LDUB_I	ldub	[%r21 + 0x0047], %r26
	.word 0xf51d612a  ! 2292: LDDF_I	ldd	[%r21, 0x012a], %f26
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	.word 0xf80521d0  ! 2299: LDUW_I	lduw	[%r20 + 0x01d0], %r28
	.word 0xfc05c000  ! 2300: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xb4a44000  ! 2301: SUBcc_R	subcc 	%r17, %r0, %r26
	.word 0xf214213c  ! 2304: LDUH_I	lduh	[%r16 + 0x013c], %r25
	.word 0xb1510000  ! 2305: RDPR_TICK	<illegal instruction>
	.word 0xf045e006  ! 2308: LDSW_I	ldsw	[%r23 + 0x0006], %r24
	.word 0xfe14a17e  ! 2312: LDUH_I	lduh	[%r18 + 0x017e], %r31
	.word 0xf40560c4  ! 2314: LDUW_I	lduw	[%r21 + 0x00c4], %r26
	.word 0xf805e072  ! 2316: LDUW_I	lduw	[%r23 + 0x0072], %r28
	.word 0xf60d600e  ! 2320: LDUB_I	ldub	[%r21 + 0x000e], %r27
	.word 0xb151c000  ! 2321: RDPR_TL	<illegal instruction>
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05c6040  ! 2328: LDX_I	ldx	[%r17 + 0x0040], %r24
	.word 0xfb1d6034  ! 2330: LDDF_I	ldd	[%r21, 0x0034], %f29
	.word 0xfe058000  ! 2331: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf8040000  ! 2332: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xbab4e07e  ! 2333: ORNcc_I	orncc 	%r19, 0x007e, %r29
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81cc000  ! 2338: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xf64ce006  ! 2341: LDSB_I	ldsb	[%r19 + 0x0006], %r27
	.word 0xf61c8000  ! 2345: LDD_R	ldd	[%r18 + %r0], %r27
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2352: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x201, %g1, %o0
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
	.word 0x8195e07f  ! 2357: WRPR_TPC_I	wrpr	%r23, 0x007f, %tpc
	.word 0xfe148000  ! 2361: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xfe55e146  ! 2363: LDSH_I	ldsh	[%r23 + 0x0146], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595e0e0  ! 2368: WRPR_TSTATE_I	wrpr	%r23, 0x00e0, %tstate
	.word 0xfa5de1fd  ! 2371: LDX_I	ldx	[%r23 + 0x01fd], %r29
	.word 0xbb500000  ! 2372: RDPR_TPC	<illegal instruction>
	.word 0x8394e171  ! 2373: WRPR_TNPC_I	wrpr	%r19, 0x0171, %tnpc
	.word 0xf60d8000  ! 2376: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xb32c2001  ! 2377: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xb12c5000  ! 2378: SLLX_R	sllx	%r17, %r0, %r24
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d8000  ! 2382: LDUB_R	ldub	[%r22 + %r0], %r29
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb344000  ! 2386: SRL_R	srl 	%r17, %r0, %r29
	.word 0xbf504000  ! 2387: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb63dc000  ! 2388: XNOR_R	xnor 	%r23, %r0, %r27
	.word 0xf4044000  ! 2390: LDUW_R	lduw	[%r17 + %r0], %r26
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00c4000  ! 2394: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xf855e13f  ! 2397: LDSH_I	ldsh	[%r23 + 0x013f], %r28
	.word 0xf51dc000  ! 2398: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf01c6038  ! 2399: LDD_I	ldd	[%r17 + 0x0038], %r24
	.word 0xbb2d9000  ! 2401: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xf4554000  ! 2405: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xb00d8000  ! 2406: AND_R	and 	%r22, %r0, %r24
	.word 0xfe1c6140  ! 2413: LDD_I	ldd	[%r17 + 0x0140], %r31
	setx	data_start_6, %g1, %r21
	.word 0x8994a04c  ! 2415: WRPR_TICK_I	wrpr	%r18, 0x004c, %tick
	.word 0x8795603a  ! 2417: WRPR_TT_I	wrpr	%r21, 0x003a, %tt
	.word 0xb29c2023  ! 2419: XORcc_I	xorcc 	%r16, 0x0023, %r25
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c4000  ! 2425: LDSB_R	ldsb	[%r17 + %r0], %r29
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 2428: RDPR_TL	<illegal instruction>
	.word 0xbf504000  ! 2429: RDPR_TNPC	<illegal instruction>
	.word 0xfa0cc000  ! 2431: LDUB_R	ldub	[%r19 + %r0], %r29
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0xfa4de001  ! 2437: LDSB_I	ldsb	[%r23 + 0x0001], %r29
	.word 0xfc0de10a  ! 2438: LDUB_I	ldub	[%r23 + 0x010a], %r30
	.word 0xb4b50000  ! 2439: ORNcc_R	orncc 	%r20, %r0, %r26
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0560cb  ! 2444: LDUW_I	lduw	[%r21 + 0x00cb], %r30
	.word 0xf44c60e0  ! 2445: LDSB_I	ldsb	[%r17 + 0x00e0], %r26
	.word 0xf8058000  ! 2446: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xbf510000  ! 2447: RDPR_TICK	<illegal instruction>
	.word 0xbb2d7001  ! 2449: SLLX_I	sllx	%r21, 0x0001, %r29
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454605f  ! 2457: LDSH_I	ldsh	[%r17 + 0x005f], %r26
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0558000  ! 2460: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf65da100  ! 2461: LDX_I	ldx	[%r22 + 0x0100], %r27
	.word 0xb694a093  ! 2464: ORcc_I	orcc 	%r18, 0x0093, %r27
	.word 0xfe14c000  ! 2466: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf4058000  ! 2470: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xbd504000  ! 2472: RDPR_TNPC	<illegal instruction>
	.word 0xf805e073  ! 2475: LDUW_I	lduw	[%r23 + 0x0073], %r28
	.word 0x859421ba  ! 2477: WRPR_TSTATE_I	wrpr	%r16, 0x01ba, %tstate
	.word 0xf11d20e0  ! 2478: LDDF_I	ldd	[%r20, 0x00e0], %f24
	.word 0xf6454000  ! 2482: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf014e0a9  ! 2483: LDUH_I	lduh	[%r19 + 0x00a9], %r24
	.word 0x8d942007  ! 2487: WRPR_PSTATE_I	wrpr	%r16, 0x0007, %pstate
	.word 0xf05c2018  ! 2489: LDX_I	ldx	[%r16 + 0x0018], %r24
	.word 0xb135c000  ! 2490: SRL_R	srl 	%r23, %r0, %r24
	.word 0xba34a090  ! 2491: SUBC_I	orn 	%r18, 0x0090, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb81d4000  ! 2494: XOR_R	xor 	%r21, %r0, %r28
	.word 0xb2a44000  ! 2495: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xf014e0e2  ! 2496: LDUH_I	lduh	[%r19 + 0x00e2], %r24
	.word 0xfc14604b  ! 2500: LDUH_I	lduh	[%r17 + 0x004b], %r30
	.word 0xfe44a17e  ! 2505: LDSW_I	ldsw	[%r18 + 0x017e], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xf91d213e  ! 2507: LDDF_I	ldd	[%r20, 0x013e], %f28
	.word 0xfd1d8000  ! 2508: LDDF_R	ldd	[%r22, %r0], %f30
	setx	0x231, %g1, %o0
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
	.word 0xfa452007  ! 2520: LDSW_I	ldsw	[%r20 + 0x0007], %r29
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe158000  ! 2529: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xbaa5a1a8  ! 2530: SUBcc_I	subcc 	%r22, 0x01a8, %r29
	.word 0xfd1ce170  ! 2534: LDDF_I	ldd	[%r19, 0x0170], %f30
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04d21f0  ! 2538: LDSB_I	ldsb	[%r20 + 0x01f0], %r24
	.word 0xf24ca0ca  ! 2546: LDSB_I	ldsb	[%r18 + 0x00ca], %r25
	.word 0xb42d6105  ! 2548: ANDN_I	andn 	%r21, 0x0105, %r26
	.word 0xfc5d8000  ! 2549: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xb5508000  ! 2551: RDPR_TSTATE	<illegal instruction>
	.word 0xf05c8000  ! 2555: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xb5480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb0246079  ! 2560: SUB_I	sub 	%r17, 0x0079, %r24
	.word 0xb81d0000  ! 2561: XOR_R	xor 	%r20, %r0, %r28
	.word 0xfa05e16e  ! 2562: LDUW_I	lduw	[%r23 + 0x016e], %r29
	.word 0xf2150000  ! 2563: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfc45c000  ! 2566: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf054e022  ! 2568: LDSH_I	ldsh	[%r19 + 0x0022], %r24
	.word 0xb550c000  ! 2569: RDPR_TT	<illegal instruction>
	.word 0xf605608d  ! 2571: LDUW_I	lduw	[%r21 + 0x008d], %r27
	.word 0xbd2d2001  ! 2572: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0xf11de17b  ! 2575: LDDF_I	ldd	[%r23, 0x017b], %f24
	.word 0xf84d8000  ! 2576: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xfa150000  ! 2578: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xfd1d6091  ! 2579: LDDF_I	ldd	[%r21, 0x0091], %f30
	.word 0xf05ca019  ! 2585: LDX_I	ldx	[%r18 + 0x0019], %r24
	.word 0xf2442002  ! 2586: LDSW_I	ldsw	[%r16 + 0x0002], %r25
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05420ca  ! 2588: LDSH_I	ldsh	[%r16 + 0x00ca], %r24
	.word 0xfc05e15e  ! 2589: LDUW_I	lduw	[%r23 + 0x015e], %r30
	.word 0xf44ca01c  ! 2592: LDSB_I	ldsb	[%r18 + 0x001c], %r26
	.word 0xf64ce0db  ! 2595: LDSB_I	ldsb	[%r19 + 0x00db], %r27
	.word 0xf40c0000  ! 2596: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf44c4000  ! 2600: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0x8794601c  ! 2604: WRPR_TT_I	wrpr	%r17, 0x001c, %tt
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 2607: RDPR_TICK	<illegal instruction>
	.word 0x8195a1e5  ! 2609: WRPR_TPC_I	wrpr	%r22, 0x01e5, %tpc
	.word 0x8995a051  ! 2611: WRPR_TICK_I	wrpr	%r22, 0x0051, %tick
	.word 0xf11c60af  ! 2612: LDDF_I	ldd	[%r17, 0x00af], %f24
	.word 0x8594e038  ! 2614: WRPR_TSTATE_I	wrpr	%r19, 0x0038, %tstate
	.word 0x8194a15c  ! 2617: WRPR_TPC_I	wrpr	%r18, 0x015c, %tpc
	.word 0xfc5c204e  ! 2621: LDX_I	ldx	[%r16 + 0x004e], %r30
	.word 0xf4554000  ! 2622: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf815c000  ! 2624: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xb9540000  ! 2629: RDPR_GL	rdpr	%-, %r28
	.word 0x8195a1f4  ! 2631: WRPR_TPC_I	wrpr	%r22, 0x01f4, %tpc
	setx	0x1022d, %g1, %o0
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
	.word 0xf24cc000  ! 2638: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xfa548000  ! 2641: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0x91946151  ! 2642: WRPR_PIL_I	wrpr	%r17, 0x0151, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982d89  ! 2643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d89, %hpstate
	.word 0x8794a089  ! 2644: WRPR_TT_I	wrpr	%r18, 0x0089, %tt
	.word 0xb4046133  ! 2646: ADD_I	add 	%r17, 0x0133, %r26
	mov	1, %r14
	.word 0xa193a000  ! 2648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf11cc000  ! 2651: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xb37d2401  ! 2654: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xf80d2065  ! 2656: LDUB_I	ldub	[%r20 + 0x0065], %r28
	.word 0xfe5520a7  ! 2657: LDSH_I	ldsh	[%r20 + 0x00a7], %r31
	setx	data_start_5, %g1, %r22
	.word 0xb7510000  ! 2662: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xf6450000  ! 2664: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf24c4000  ! 2666: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xb5510000  ! 2667: RDPR_TICK	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 2669: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf25521f6  ! 2671: LDSH_I	ldsh	[%r20 + 0x01f6], %r25
	.word 0xbf508000  ! 2673: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbd540000  ! 2675: RDPR_GL	<illegal instruction>
	.word 0x8795209a  ! 2676: WRPR_TT_I	wrpr	%r20, 0x009a, %tt
	.word 0xf40d0000  ! 2677: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf81c0000  ! 2681: LDD_R	ldd	[%r16 + %r0], %r28
	mov	2, %r14
	.word 0xa193a000  ! 2683: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8050000  ! 2685: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf84c61cc  ! 2687: LDSB_I	ldsb	[%r17 + 0x01cc], %r28
	.word 0xb0ad8000  ! 2689: ANDNcc_R	andncc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982f91  ! 2693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f91, %hpstate
	.word 0xb1518000  ! 2694: RDPR_PSTATE	<illegal instruction>
	.word 0x8595e1df  ! 2695: WRPR_TSTATE_I	wrpr	%r23, 0x01df, %tstate
	.word 0xbf51c000  ! 2697: RDPR_TL	<illegal instruction>
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2699: RDPR_GL	<illegal instruction>
	.word 0xf01c2043  ! 2701: LDD_I	ldd	[%r16 + 0x0043], %r24
	.word 0xb9500000  ! 2702: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x919460a0  ! 2706: WRPR_PIL_I	wrpr	%r17, 0x00a0, %pil
	.word 0xfa142171  ! 2707: LDUH_I	lduh	[%r16 + 0x0171], %r29
	.word 0xf11d8000  ! 2708: LDDF_R	ldd	[%r22, %r0], %f24
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982adb  ! 2711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adb, %hpstate
	setx	data_start_5, %g1, %r17
	.word 0xf00dc000  ! 2719: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xf71cc000  ! 2720: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xb7508000  ! 2721: RDPR_TSTATE	<illegal instruction>
	.word 0xfc1ca19a  ! 2722: LDD_I	ldd	[%r18 + 0x019a], %r30
	.word 0x8595619d  ! 2723: WRPR_TSTATE_I	wrpr	%r21, 0x019d, %tstate
	.word 0xfc1c0000  ! 2725: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0x8994e164  ! 2732: WRPR_TICK_I	wrpr	%r19, 0x0164, %tick
	.word 0x8194e149  ! 2733: WRPR_TPC_I	wrpr	%r19, 0x0149, %tpc
	.word 0xb52d2001  ! 2736: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xbd540000  ! 2737: RDPR_GL	<illegal instruction>
	.word 0xf64c4000  ! 2741: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfc5520ee  ! 2744: LDSH_I	ldsh	[%r20 + 0x00ee], %r30
	.word 0xf71da051  ! 2745: LDDF_I	ldd	[%r22, 0x0051], %f27
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2751: RDPR_TL	<illegal instruction>
	.word 0xb5510000  ! 2754: RDPR_TICK	<illegal instruction>
	setx	0x10039, %g1, %o0
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
	.word 0xf01d4000  ! 2759: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xb8954000  ! 2760: ORcc_R	orcc 	%r21, %r0, %r28
	.word 0xb751c000  ! 2761: RDPR_TL	<illegal instruction>
	setx	data_start_7, %g1, %r18
	.word 0xbe35e175  ! 2768: ORN_I	orn 	%r23, 0x0175, %r31
	.word 0xf40d0000  ! 2772: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb9480000  ! 2773: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d4000  ! 2778: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf04d8000  ! 2779: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xfa4c601d  ! 2780: LDSB_I	ldsb	[%r17 + 0x001d], %r29
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0044000  ! 2786: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xb9510000  ! 2788: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	.word 0xb3510000  ! 2792: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb4046001  ! 2801: ADD_I	add 	%r17, 0x0001, %r26
	.word 0xf84560fd  ! 2804: LDSW_I	ldsw	[%r21 + 0x00fd], %r28
	.word 0x879561c2  ! 2814: WRPR_TT_I	wrpr	%r21, 0x01c2, %tt
	.word 0x8994217e  ! 2815: WRPR_TICK_I	wrpr	%r16, 0x017e, %tick
	setx	data_start_0, %g1, %r23
	.word 0xf84dc000  ! 2820: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xbe9d6130  ! 2827: XORcc_I	xorcc 	%r21, 0x0130, %r31
	.word 0xfe1de0df  ! 2829: LDD_I	ldd	[%r23 + 0x00df], %r31
	.word 0xf2454000  ! 2832: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0x9194a132  ! 2835: WRPR_PIL_I	wrpr	%r18, 0x0132, %pil
	.word 0xf0144000  ! 2840: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xfa14e007  ! 2841: LDUH_I	lduh	[%r19 + 0x0007], %r29
	setx	0x30228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 2844: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf81cc000  ! 2845: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xf414c000  ! 2850: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0x8995e0be  ! 2852: WRPR_TICK_I	wrpr	%r23, 0x00be, %tick
	.word 0xfe140000  ! 2862: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb634214a  ! 2863: ORN_I	orn 	%r16, 0x014a, %r27
	.word 0xf0158000  ! 2867: LDUH_R	lduh	[%r22 + %r0], %r24
	mov	1, %r14
	.word 0xa193a000  ! 2868: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb540000  ! 2872: RDPR_GL	rdpr	%-, %r29
	.word 0xb3518000  ! 2875: RDPR_PSTATE	<illegal instruction>
	.word 0xf05560e8  ! 2878: LDSH_I	ldsh	[%r21 + 0x00e8], %r24
	.word 0xf20ca075  ! 2879: LDUB_I	ldub	[%r18 + 0x0075], %r25
	.word 0xbf643801  ! 2881: MOVcc_I	<illegal instruction>
	.word 0xf11de132  ! 2882: LDDF_I	ldd	[%r23, 0x0132], %f24
	.word 0xfe04602b  ! 2884: LDUW_I	lduw	[%r17 + 0x002b], %r31
	.word 0xf31d0000  ! 2892: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xfa5c0000  ! 2893: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xb8ac20c1  ! 2894: ANDNcc_I	andncc 	%r16, 0x00c1, %r28
	.word 0xb1510000  ! 2895: RDPR_TICK	<illegal instruction>
	.word 0xf44ca16d  ! 2898: LDSB_I	ldsb	[%r18 + 0x016d], %r26
	.word 0xb37d8400  ! 2899: MOVR_R	movre	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982d03  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d03, %hpstate
	.word 0xfa554000  ! 2906: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xbec4e044  ! 2907: ADDCcc_I	addccc 	%r19, 0x0044, %r31
	.word 0xbb2da001  ! 2908: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0x91946123  ! 2909: WRPR_PIL_I	wrpr	%r17, 0x0123, %pil
	.word 0xf81d0000  ! 2913: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf2158000  ! 2920: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xfa55c000  ! 2927: LDSH_R	ldsh	[%r23 + %r0], %r29
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81421ca  ! 2940: LDUH_I	lduh	[%r16 + 0x01ca], %r28
	mov	2, %r12
	.word 0x8f932000  ! 2941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r12
	.word 0x8f932000  ! 2942: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba950000  ! 2954: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xf51c8000  ! 2957: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xfe5560bb  ! 2959: LDSH_I	ldsh	[%r21 + 0x00bb], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r21
	.word 0xb6ac2169  ! 2964: ANDNcc_I	andncc 	%r16, 0x0169, %r27
	.word 0xf2558000  ! 2966: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf01ce038  ! 2967: LDD_I	ldd	[%r19 + 0x0038], %r24
	.word 0xf244614c  ! 2971: LDSW_I	ldsw	[%r17 + 0x014c], %r25
	.word 0xb5520000  ! 2974: RDPR_PIL	<illegal instruction>
	setx	0x3032a, %g1, %o0
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
	.word 0xbb504000  ! 2983: RDPR_TNPC	<illegal instruction>
	.word 0xf44c618c  ! 2985: LDSB_I	ldsb	[%r17 + 0x018c], %r26
	.word 0xf60d8000  ! 2986: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xfc5c2085  ! 2987: LDX_I	ldx	[%r16 + 0x0085], %r30
	.word 0xb3518000  ! 2990: RDPR_PSTATE	<illegal instruction>
	.word 0xb025a073  ! 2995: SUB_I	sub 	%r22, 0x0073, %r24
	.word 0xb82c6150  ! 2996: ANDN_I	andn 	%r17, 0x0150, %r28
	.word 0xb5504000  ! 2999: RDPR_TNPC	<illegal instruction>
	.word 0x9195e07b  ! 3000: WRPR_PIL_I	wrpr	%r23, 0x007b, %pil
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bd0000  ! 3005: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xf24d0000  ! 3006: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xfc552168  ! 3010: LDSH_I	ldsh	[%r20 + 0x0168], %r30
	.word 0xf244206b  ! 3011: LDSW_I	ldsw	[%r16 + 0x006b], %r25
	.word 0x8195611b  ! 3014: WRPR_TPC_I	wrpr	%r21, 0x011b, %tpc
	.word 0xb2c5e086  ! 3018: ADDCcc_I	addccc 	%r23, 0x0086, %r25
	.word 0xfe5c4000  ! 3020: LDX_R	ldx	[%r17 + %r0], %r31
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 3023: RDPR_TSTATE	<illegal instruction>
	.word 0xfe5ca1f5  ! 3026: LDX_I	ldx	[%r18 + 0x01f5], %r31
	.word 0x8594a056  ! 3030: WRPR_TSTATE_I	wrpr	%r18, 0x0056, %tstate
	.word 0x89942103  ! 3032: WRPR_TICK_I	wrpr	%r16, 0x0103, %tick
	.word 0xf64ca127  ! 3033: LDSB_I	ldsb	[%r18 + 0x0127], %r27
	.word 0x8195217d  ! 3034: WRPR_TPC_I	wrpr	%r20, 0x017d, %tpc
	.word 0xf815e1f6  ! 3040: LDUH_I	lduh	[%r23 + 0x01f6], %r28
	.word 0xf2542185  ! 3043: LDSH_I	ldsh	[%r16 + 0x0185], %r25
	setx	data_start_4, %g1, %r22
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ac8000  ! 3050: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xbb540000  ! 3052: RDPR_GL	<illegal instruction>
	.word 0x859460df  ! 3054: WRPR_TSTATE_I	wrpr	%r17, 0x00df, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983893  ! 3055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1893, %hpstate
	.word 0xfa5c4000  ! 3056: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xbb3cd000  ! 3057: SRAX_R	srax	%r19, %r0, %r29
	.word 0x87956081  ! 3061: WRPR_TT_I	wrpr	%r21, 0x0081, %tt
	.word 0xf2144000  ! 3066: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf51c6004  ! 3067: LDDF_I	ldd	[%r17, 0x0004], %f26
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8156117  ! 3077: LDUH_I	lduh	[%r21 + 0x0117], %r28
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 3086: LDX_R	ldx	[%r16 + %r0], %r26
	mov	2, %r14
	.word 0xa193a000  ! 3087: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf84ca01b  ! 3088: LDSB_I	ldsb	[%r18 + 0x001b], %r28
	.word 0xb4ada000  ! 3091: ANDNcc_I	andncc 	%r22, 0x0000, %r26
	.word 0xfe54203b  ! 3092: LDSH_I	ldsh	[%r16 + 0x003b], %r31
	.word 0xf51dc000  ! 3098: LDDF_R	ldd	[%r23, %r0], %f26
	setx	data_start_1, %g1, %r19
	.word 0xb6a5a0dd  ! 3104: SUBcc_I	subcc 	%r22, 0x00dd, %r27
	setx	0x10d, %g1, %o0
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
	mov	0, %r12
	.word 0x8f932000  ! 3110: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0556189  ! 3111: LDSH_I	ldsh	[%r21 + 0x0189], %r24
	setx	data_start_2, %g1, %r18
	.word 0xb6c54000  ! 3114: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xfa4c8000  ! 3115: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf8548000  ! 3117: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xb02d4000  ! 3118: ANDN_R	andn 	%r21, %r0, %r24
	.word 0x8194a0d2  ! 3122: WRPR_TPC_I	wrpr	%r18, 0x00d2, %tpc
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2558000  ! 3127: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xb751c000  ! 3128: RDPR_TL	<illegal instruction>
	.word 0xf61ca018  ! 3129: LDD_I	ldd	[%r18 + 0x0018], %r27
	.word 0xbf51c000  ! 3135: RDPR_TL	<illegal instruction>
	.word 0xf244e125  ! 3136: LDSW_I	ldsw	[%r19 + 0x0125], %r25
	.word 0xba9c4000  ! 3140: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xfe4de071  ! 3141: LDSB_I	ldsb	[%r23 + 0x0071], %r31
	.word 0x8194a156  ! 3142: WRPR_TPC_I	wrpr	%r18, 0x0156, %tpc
	.word 0xb2c4c000  ! 3143: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xbf51c000  ! 3145: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983f0b  ! 3149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0b, %hpstate
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00d8000  ! 3151: LDUB_R	ldub	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 3153: RDPR_PSTATE	<illegal instruction>
	.word 0xbd50c000  ! 3154: RDPR_TT	<illegal instruction>
	.word 0xbd518000  ! 3158: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8195e03a  ! 3162: WRPR_TPC_I	wrpr	%r23, 0x003a, %tpc
	.word 0xbc0ce111  ! 3163: AND_I	and 	%r19, 0x0111, %r30
	.word 0xb750c000  ! 3165: RDPR_TT	<illegal instruction>
	.word 0x859420d7  ! 3169: WRPR_TSTATE_I	wrpr	%r16, 0x00d7, %tstate
	.word 0xf0042090  ! 3173: LDUW_I	lduw	[%r16 + 0x0090], %r24
	.word 0xfc0d6158  ! 3174: LDUB_I	ldub	[%r21 + 0x0158], %r30
	setx	0x30011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c21b4  ! 3182: LDX_I	ldx	[%r16 + 0x01b4], %r30
	.word 0xb7508000  ! 3184: RDPR_TSTATE	<illegal instruction>
	.word 0xbb520000  ! 3186: RDPR_PIL	<illegal instruction>
	.word 0xb32d5000  ! 3187: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xf20521b9  ! 3188: LDUW_I	lduw	[%r20 + 0x01b9], %r25
	.word 0xbf520000  ! 3191: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xfa15e0c0  ! 3194: LDUH_I	lduh	[%r23 + 0x00c0], %r29
	.word 0xf2554000  ! 3197: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf61c4000  ! 3198: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xb9510000  ! 3200: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xf0544000  ! 3202: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xbc45208b  ! 3203: ADDC_I	addc 	%r20, 0x008b, %r30
	.word 0xf61d2169  ! 3204: LDD_I	ldd	[%r20 + 0x0169], %r27
	.word 0xf80de0bf  ! 3206: LDUB_I	ldub	[%r23 + 0x00bf], %r28
	setx	0x3002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e0aa  ! 3211: WRPR_TPC_I	wrpr	%r19, 0x00aa, %tpc
	.word 0xb151c000  ! 3219: RDPR_TL	rdpr	%tl, %r24
	.word 0xfa554000  ! 3221: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf4054000  ! 3226: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xfc048000  ! 3227: LDUW_R	lduw	[%r18 + %r0], %r30
	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71da005  ! 3234: LDDF_I	ldd	[%r22, 0x0005], %f27
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81982ed1  ! 3238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	.word 0xff1cc000  ! 3241: LDDF_R	ldd	[%r19, %r0], %f31
	setx	0x10332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61c8000  ! 3256: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xfd1de1b3  ! 3258: LDDF_I	ldd	[%r23, 0x01b3], %f30
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859561d1  ! 3261: WRPR_TSTATE_I	wrpr	%r21, 0x01d1, %tstate
	.word 0x9195e199  ! 3263: WRPR_PIL_I	wrpr	%r23, 0x0199, %pil
	.word 0xbb540000  ! 3264: RDPR_GL	<illegal instruction>
	.word 0xb83460e2  ! 3266: ORN_I	orn 	%r17, 0x00e2, %r28
	.word 0xfa5d8000  ! 3269: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xb93d7001  ! 3270: SRAX_I	srax	%r21, 0x0001, %r28
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4c6008  ! 3273: LDSB_I	ldsb	[%r17 + 0x0008], %r29
	.word 0xf644c000  ! 3275: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf51d0000  ! 3279: LDDF_R	ldd	[%r20, %r0], %f26
	setx	data_start_2, %g1, %r22
	.word 0xf0058000  ! 3283: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xba2ce17c  ! 3284: ANDN_I	andn 	%r19, 0x017c, %r29
	setx	data_start_4, %g1, %r19
	.word 0x8794e12e  ! 3287: WRPR_TT_I	wrpr	%r19, 0x012e, %tt
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 3292: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 3296: RDPR_TSTATE	<illegal instruction>
	.word 0xf4046056  ! 3301: LDUW_I	lduw	[%r17 + 0x0056], %r26
	.word 0xf2458000  ! 3309: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xb7504000  ! 3311: RDPR_TNPC	<illegal instruction>
	.word 0xf24d0000  ! 3313: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xfc554000  ! 3320: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xfa4c0000  ! 3325: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xbb510000  ! 3327: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf51c8000  ! 3328: LDDF_R	ldd	[%r18, %r0], %f26
	setx	data_start_3, %g1, %r19
	.word 0x8195e1b1  ! 3336: WRPR_TPC_I	wrpr	%r23, 0x01b1, %tpc
	setx	data_start_6, %g1, %r23
	.word 0xb83ca1da  ! 3343: XNOR_I	xnor 	%r18, 0x01da, %r28
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa440000  ! 3345: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xb1500000  ! 3346: RDPR_TPC	<illegal instruction>
	.word 0xb8b4e12a  ! 3350: ORNcc_I	orncc 	%r19, 0x012a, %r28
	.word 0xfd1de0e0  ! 3352: LDDF_I	ldd	[%r23, 0x00e0], %f30
	.word 0xfc5420f3  ! 3355: LDSH_I	ldsh	[%r16 + 0x00f3], %r30
	.word 0xf4450000  ! 3356: LDSW_R	ldsw	[%r20 + %r0], %r26
	setx	data_start_0, %g1, %r21
	mov	2, %r12
	.word 0x8f932000  ! 3366: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb508000  ! 3375: RDPR_TSTATE	<illegal instruction>
	.word 0xf60de0e8  ! 3377: LDUB_I	ldub	[%r23 + 0x00e8], %r27
	.word 0xf21da0dd  ! 3379: LDD_I	ldd	[%r22 + 0x00dd], %r25
	.word 0x879520cb  ! 3380: WRPR_TT_I	wrpr	%r20, 0x00cb, %tt
	.word 0xfe044000  ! 3385: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf2144000  ! 3390: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xb1641800  ! 3391: MOVcc_R	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3392: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d956090  ! 3393: WRPR_PSTATE_I	wrpr	%r21, 0x0090, %pstate
	.word 0x8395a1e4  ! 3400: WRPR_TNPC_I	wrpr	%r22, 0x01e4, %tnpc
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa440000  ! 3405: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf0058000  ! 3412: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xbcbd4000  ! 3421: XNORcc_R	xnorcc 	%r21, %r0, %r30
	.word 0xfc1dc000  ! 3422: LDD_R	ldd	[%r23 + %r0], %r30
	mov	0, %r14
	.word 0xa193a000  ! 3424: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8395217c  ! 3427: WRPR_TNPC_I	wrpr	%r20, 0x017c, %tnpc
	.word 0x8d95e0ec  ! 3429: WRPR_PSTATE_I	wrpr	%r23, 0x00ec, %pstate
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 3431: RDPR_TNPC	<illegal instruction>
	.word 0xf6054000  ! 3437: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xbf480000  ! 3439: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb015e030  ! 3443: OR_I	or 	%r23, 0x0030, %r24
	.word 0xfe1d61bc  ! 3444: LDD_I	ldd	[%r21 + 0x01bc], %r31
	.word 0xbd520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xf654c000  ! 3452: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xfe5d61ee  ! 3454: LDX_I	ldx	[%r21 + 0x01ee], %r31
	.word 0xfc4c8000  ! 3459: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xbe04618c  ! 3461: ADD_I	add 	%r17, 0x018c, %r31
	.word 0xf8048000  ! 3464: LDUW_R	lduw	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81956057  ! 3469: WRPR_TPC_I	wrpr	%r21, 0x0057, %tpc
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d4000  ! 3472: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xf65561a0  ! 3477: LDSH_I	ldsh	[%r21 + 0x01a0], %r27
	.word 0xb52db001  ! 3478: SLLX_I	sllx	%r22, 0x0001, %r26
	.word 0xf40c0000  ! 3479: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xb9518000  ! 3484: RDPR_PSTATE	<illegal instruction>
	.word 0xb3510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xf80d20e1  ! 3487: LDUB_I	ldub	[%r20 + 0x00e1], %r28
	.word 0xfa55c000  ! 3492: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xb7510000  ! 3493: RDPR_TICK	<illegal instruction>
	.word 0xb7480000  ! 3495: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf00cc000  ! 3497: LDUB_R	ldub	[%r19 + %r0], %r24
	setx	data_start_7, %g1, %r17
	.word 0xf41521e6  ! 3501: LDUH_I	lduh	[%r20 + 0x01e6], %r26
	.word 0xfa4420ea  ! 3502: LDSW_I	ldsw	[%r16 + 0x00ea], %r29
	.word 0xff1d6198  ! 3504: LDDF_I	ldd	[%r21, 0x0198], %f31
	.word 0xfc0d0000  ! 3509: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xb7520000  ! 3511: RDPR_PIL	<illegal instruction>
	.word 0xba1dc000  ! 3513: XOR_R	xor 	%r23, %r0, %r29
	.word 0x9194205f  ! 3514: WRPR_PIL_I	wrpr	%r16, 0x005f, %pil
	.word 0x9194e1df  ! 3516: WRPR_PIL_I	wrpr	%r19, 0x01df, %pil
	.word 0xf60d8000  ! 3522: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0x8594e1fd  ! 3524: WRPR_TSTATE_I	wrpr	%r19, 0x01fd, %tstate
	.word 0x9194e1c1  ! 3526: WRPR_PIL_I	wrpr	%r19, 0x01c1, %pil
	setx	0x32, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02d4000  ! 3528: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xf31c2107  ! 3529: LDDF_I	ldd	[%r16, 0x0107], %f25
	.word 0xf91c4000  ! 3533: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf80c2029  ! 3537: LDUB_I	ldub	[%r16 + 0x0029], %r28
	.word 0xfc4de077  ! 3539: LDSB_I	ldsb	[%r23 + 0x0077], %r30
	.word 0xb9480000  ! 3543: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf45c2055  ! 3545: LDX_I	ldx	[%r16 + 0x0055], %r26
	.word 0xb1500000  ! 3547: RDPR_TPC	<illegal instruction>
	setx	0x10018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80dc000  ! 3552: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf654a05d  ! 3554: LDSH_I	ldsh	[%r18 + 0x005d], %r27
	setx	data_start_0, %g1, %r16
	.word 0xf2040000  ! 3557: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf00cc000  ! 3558: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf405e008  ! 3560: LDUW_I	lduw	[%r23 + 0x0008], %r26
	setx	0x20320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a05d  ! 3563: WRPR_TT_I	wrpr	%r18, 0x005d, %tt
	.word 0xf645e1d6  ! 3564: LDSW_I	ldsw	[%r23 + 0x01d6], %r27
	.word 0xb295e0a1  ! 3567: ORcc_I	orcc 	%r23, 0x00a1, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf445205c  ! 3570: LDSW_I	ldsw	[%r20 + 0x005c], %r26
	.word 0xfe4d8000  ! 3571: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xf71cc000  ! 3573: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xf81ce174  ! 3578: LDD_I	ldd	[%r19 + 0x0174], %r28
	.word 0xb21c0000  ! 3585: XOR_R	xor 	%r16, %r0, %r25
	.word 0xb2b4602e  ! 3586: SUBCcc_I	orncc 	%r17, 0x002e, %r25
	.word 0xb934a001  ! 3588: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xfa1d0000  ! 3590: LDD_R	ldd	[%r20 + %r0], %r29
	setx	data_start_7, %g1, %r20
	setx	data_start_0, %g1, %r21
	.word 0xfa45e1a3  ! 3598: LDSW_I	ldsw	[%r23 + 0x01a3], %r29
	.word 0xb0a48000  ! 3600: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xfe14c000  ! 3601: LDUH_R	lduh	[%r19 + %r0], %r31
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa55e16b  ! 3609: LDSH_I	ldsh	[%r23 + 0x016b], %r29
	.word 0xf2554000  ! 3610: LDSH_R	ldsh	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 3614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0x8394e01d  ! 3617: WRPR_TNPC_I	wrpr	%r19, 0x001d, %tnpc
	.word 0x8195e03d  ! 3621: WRPR_TPC_I	wrpr	%r23, 0x003d, %tpc
	.word 0x8195e0e0  ! 3624: WRPR_TPC_I	wrpr	%r23, 0x00e0, %tpc
	.word 0xfa4d4000  ! 3627: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf414a1e9  ! 3628: LDUH_I	lduh	[%r18 + 0x01e9], %r26
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82d4000  ! 3638: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xf04da08f  ! 3639: LDSB_I	ldsb	[%r22 + 0x008f], %r24
	.word 0x8595e1f2  ! 3641: WRPR_TSTATE_I	wrpr	%r23, 0x01f2, %tstate
	.word 0x8594e14d  ! 3643: WRPR_TSTATE_I	wrpr	%r19, 0x014d, %tstate
	.word 0xf44cc000  ! 3645: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8d95213d  ! 3646: WRPR_PSTATE_I	wrpr	%r20, 0x013d, %pstate
	setx	0x3020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85ca016  ! 3650: LDX_I	ldx	[%r18 + 0x0016], %r28
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31d8000  ! 3652: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xbe0c4000  ! 3653: AND_R	and 	%r17, %r0, %r31
	.word 0xfc454000  ! 3656: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0x89952133  ! 3659: WRPR_TICK_I	wrpr	%r20, 0x0133, %tick
	.word 0xfc050000  ! 3660: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf0158000  ! 3673: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb1500000  ! 3674: RDPR_TPC	<illegal instruction>
	.word 0xf41c8000  ! 3680: LDD_R	ldd	[%r18 + %r0], %r26
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 3689: RDPR_TSTATE	<illegal instruction>
	.word 0xf91c4000  ! 3696: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf24cc000  ! 3697: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0x8d942164  ! 3699: WRPR_PSTATE_I	wrpr	%r16, 0x0164, %pstate
	.word 0xfc5d0000  ! 3700: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xfe4c4000  ! 3706: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xfa4d8000  ! 3707: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xfc0461a5  ! 3708: LDUW_I	lduw	[%r17 + 0x01a5], %r30
	.word 0xfa1cc000  ! 3709: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xf0150000  ! 3710: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xbf518000  ! 3712: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	.word 0xf41cc000  ! 3716: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xff1ce17d  ! 3718: LDDF_I	ldd	[%r19, 0x017d], %f31
	.word 0xf80da073  ! 3719: LDUB_I	ldub	[%r22 + 0x0073], %r28
	.word 0xfa4d61eb  ! 3720: LDSB_I	ldsb	[%r21 + 0x01eb], %r29
	.word 0xb9500000  ! 3724: RDPR_TPC	<illegal instruction>
	.word 0xfc5da173  ! 3728: LDX_I	ldx	[%r22 + 0x0173], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 3730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0xfa4c60e0  ! 3732: LDSB_I	ldsb	[%r17 + 0x00e0], %r29
	.word 0xb835a029  ! 3733: SUBC_I	orn 	%r22, 0x0029, %r28
	.word 0xb4054000  ! 3736: ADD_R	add 	%r21, %r0, %r26
	.word 0xf415c000  ! 3738: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfe1ca076  ! 3740: LDD_I	ldd	[%r18 + 0x0076], %r31
	.word 0xfd1cc000  ! 3743: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf6048000  ! 3744: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xf60ca1b5  ! 3747: LDUB_I	ldub	[%r18 + 0x01b5], %r27
	.word 0xf85520e8  ! 3748: LDSH_I	ldsh	[%r20 + 0x00e8], %r28
	setx	data_start_0, %g1, %r21
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 3752: RDPR_TICK	<illegal instruction>
	.word 0xf44c60cb  ! 3753: LDSB_I	ldsb	[%r17 + 0x00cb], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 3754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xf4046070  ! 3757: LDUW_I	lduw	[%r17 + 0x0070], %r26
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 3762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0x8594a0e3  ! 3765: WRPR_TSTATE_I	wrpr	%r18, 0x00e3, %tstate
	.word 0xff1c206b  ! 3767: LDDF_I	ldd	[%r16, 0x006b], %f31
	.word 0xfe5ce1ef  ! 3769: LDX_I	ldx	[%r19 + 0x01ef], %r31
	.word 0xf00521a3  ! 3771: LDUW_I	lduw	[%r20 + 0x01a3], %r24
	.word 0xfa44a0af  ! 3773: LDSW_I	ldsw	[%r18 + 0x00af], %r29
	.word 0xbf480000  ! 3782: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf6054000  ! 3783: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xfe540000  ! 3786: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xb89c4000  ! 3787: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0x819561f8  ! 3788: WRPR_TPC_I	wrpr	%r21, 0x01f8, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982881  ! 3790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0881, %hpstate
	.word 0xf805208f  ! 3791: LDUW_I	lduw	[%r20 + 0x008f], %r28
	.word 0xb2ac0000  ! 3793: ANDNcc_R	andncc 	%r16, %r0, %r25
	setx	0x3022f, %g1, %o0
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
	.word 0xf814609a  ! 3796: LDUH_I	lduh	[%r17 + 0x009a], %r28
	.word 0xb4258000  ! 3797: SUB_R	sub 	%r22, %r0, %r26
	.word 0xf01d215c  ! 3801: LDD_I	ldd	[%r20 + 0x015c], %r24
	.word 0xb1518000  ! 3804: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf65460af  ! 3807: LDSH_I	ldsh	[%r17 + 0x00af], %r27
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244c000  ! 3812: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xfc4ce111  ! 3814: LDSB_I	ldsb	[%r19 + 0x0111], %r30
	.word 0xbe946193  ! 3815: ORcc_I	orcc 	%r17, 0x0193, %r31
	.word 0xbd518000  ! 3818: RDPR_PSTATE	<illegal instruction>
	.word 0xbe050000  ! 3823: ADD_R	add 	%r20, %r0, %r31
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	.word 0xb8a48000  ! 3830: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xf6140000  ! 3833: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xb03cc000  ! 3835: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0x8595a121  ! 3836: WRPR_TSTATE_I	wrpr	%r22, 0x0121, %tstate
	.word 0xbb50c000  ! 3837: RDPR_TT	<illegal instruction>
	.word 0xfe554000  ! 3843: LDSH_R	ldsh	[%r21 + %r0], %r31
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04a143  ! 3852: LDUW_I	lduw	[%r18 + 0x0143], %r29
	.word 0xf0544000  ! 3854: LDSH_R	ldsh	[%r17 + %r0], %r24
	setx	0x3013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 3864: RDPR_PSTATE	<illegal instruction>
	.word 0xb7643801  ! 3866: MOVcc_I	<illegal instruction>
	.word 0xf84d4000  ! 3867: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xbd500000  ! 3871: RDPR_TPC	<illegal instruction>
	.word 0xfc5de168  ! 3873: LDX_I	ldx	[%r23 + 0x0168], %r30
	.word 0xf00d0000  ! 3875: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf41c61d6  ! 3880: LDD_I	ldd	[%r17 + 0x01d6], %r26
	.word 0xf8548000  ! 3882: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0x8d94a073  ! 3886: WRPR_PSTATE_I	wrpr	%r18, 0x0073, %pstate
	.word 0xbcb4e0b9  ! 3887: ORNcc_I	orncc 	%r19, 0x00b9, %r30
	.word 0xf81c4000  ! 3888: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xbf500000  ! 3891: RDPR_TPC	<illegal instruction>
	.word 0xfe1c8000  ! 3892: LDD_R	ldd	[%r18 + %r0], %r31
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 3894: MOVcc_I	<illegal instruction>
	.word 0xf20ca1ca  ! 3895: LDUB_I	ldub	[%r18 + 0x01ca], %r25
	.word 0xbabc21f9  ! 3899: XNORcc_I	xnorcc 	%r16, 0x01f9, %r29
	.word 0xb550c000  ! 3900: RDPR_TT	<illegal instruction>
	.word 0x839421fd  ! 3902: WRPR_TNPC_I	wrpr	%r16, 0x01fd, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xf00ce169  ! 3904: LDUB_I	ldub	[%r19 + 0x0169], %r24
	.word 0xbb3dd000  ! 3907: SRAX_R	srax	%r23, %r0, %r29
	.word 0xf00d203b  ! 3909: LDUB_I	ldub	[%r20 + 0x003b], %r24
	.word 0xf44cc000  ! 3910: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8395619e  ! 3911: WRPR_TNPC_I	wrpr	%r21, 0x019e, %tnpc
	.word 0xbd504000  ! 3920: RDPR_TNPC	<illegal instruction>
	.word 0xbb520000  ! 3924: RDPR_PIL	<illegal instruction>
	.word 0xf80c6102  ! 3926: LDUB_I	ldub	[%r17 + 0x0102], %r28
	.word 0xf44c8000  ! 3928: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0x8795e02b  ! 3931: WRPR_TT_I	wrpr	%r23, 0x002b, %tt
	.word 0x9194609e  ! 3932: WRPR_PIL_I	wrpr	%r17, 0x009e, %pil
	.word 0x91956159  ! 3934: WRPR_PIL_I	wrpr	%r21, 0x0159, %pil
	setx	data_start_7, %g1, %r18
	.word 0xba2c0000  ! 3939: ANDN_R	andn 	%r16, %r0, %r29
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a12f  ! 3944: WRPR_TT_I	wrpr	%r18, 0x012f, %tt
	ta	T_CHANGE_HPRIV
	.word 0x8198399b  ! 3946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199b, %hpstate
	.word 0xfa0c60cc  ! 3947: LDUB_I	ldub	[%r17 + 0x00cc], %r29
	.word 0x87956055  ! 3950: WRPR_TT_I	wrpr	%r21, 0x0055, %tt
	.word 0xf85dc000  ! 3951: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf11d0000  ! 3952: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xb1504000  ! 3954: RDPR_TNPC	<illegal instruction>
	.word 0xfe05c000  ! 3958: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xfa1460de  ! 3960: LDUH_I	lduh	[%r17 + 0x00de], %r29
	.word 0xf24c61a4  ! 3961: LDSB_I	ldsb	[%r17 + 0x01a4], %r25
	.word 0xf71cc000  ! 3962: LDDF_R	ldd	[%r19, %r0], %f27
	setx	0x10220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 3966: MOVcc_R	<illegal instruction>
	.word 0x879520fc  ! 3967: WRPR_TT_I	wrpr	%r20, 0x00fc, %tt
	.word 0xfa444000  ! 3974: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfc4520ff  ! 3976: LDSW_I	ldsw	[%r20 + 0x00ff], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983e19  ! 3977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e19, %hpstate
	.word 0x8795e118  ! 3979: WRPR_TT_I	wrpr	%r23, 0x0118, %tt
	.word 0xbd500000  ! 3981: RDPR_TPC	<illegal instruction>
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe154000  ! 3986: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xbe340000  ! 3987: ORN_R	orn 	%r16, %r0, %r31
	.word 0xba244000  ! 3988: SUB_R	sub 	%r17, %r0, %r29
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe140000  ! 3995: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xf84ca121  ! 3996: LDSB_I	ldsb	[%r18 + 0x0121], %r28
	.word 0xb3504000  ! 3997: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3999: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf215e16a  ! 4011: LDUH_I	lduh	[%r23 + 0x016a], %r25
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2ca037  ! 4015: ANDN_I	andn 	%r18, 0x0037, %r29
	.word 0xfc45c000  ! 4016: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xbb7d2401  ! 4018: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xb2450000  ! 4023: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xfc548000  ! 4024: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0x8d94a055  ! 4025: WRPR_PSTATE_I	wrpr	%r18, 0x0055, %pstate
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859520b1  ! 4028: WRPR_TSTATE_I	wrpr	%r20, 0x00b1, %tstate
	.word 0xfe5d2043  ! 4032: LDX_I	ldx	[%r20 + 0x0043], %r31
	.word 0xfa1d8000  ! 4034: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xfc44c000  ! 4035: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf0454000  ! 4040: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xf404c000  ! 4042: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf8458000  ! 4043: LDSW_R	ldsw	[%r22 + %r0], %r28
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe55e026  ! 4048: LDSH_I	ldsh	[%r23 + 0x0026], %r31
	.word 0xfa150000  ! 4050: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf4442025  ! 4055: LDSW_I	ldsw	[%r16 + 0x0025], %r26
	.word 0xfa050000  ! 4056: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf214c000  ! 4064: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf81dc000  ! 4065: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xb3349000  ! 4067: SRLX_R	srlx	%r18, %r0, %r25
	.word 0x8d9461de  ! 4072: WRPR_PSTATE_I	wrpr	%r17, 0x01de, %pstate
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c2022  ! 4084: LDUB_I	ldub	[%r16 + 0x0022], %r26
	.word 0xf8444000  ! 4091: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xfa5ca19a  ! 4094: LDX_I	ldx	[%r18 + 0x019a], %r29
	.word 0xf81c0000  ! 4096: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xf4052130  ! 4098: LDUW_I	lduw	[%r20 + 0x0130], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x9195a196  ! 4100: WRPR_PIL_I	wrpr	%r22, 0x0196, %pil
	.word 0xb7520000  ! 4109: RDPR_PIL	<illegal instruction>
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb359000  ! 4112: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xf04d60c9  ! 4113: LDSB_I	ldsb	[%r21 + 0x00c9], %r24
	.word 0xfa4c0000  ! 4114: LDSB_R	ldsb	[%r16 + %r0], %r29
	mov	1, %r14
	.word 0xa193a000  ! 4116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5508000  ! 4119: RDPR_TSTATE	<illegal instruction>
	.word 0xbc154000  ! 4120: OR_R	or 	%r21, %r0, %r30
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982909  ! 4125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0909, %hpstate
	.word 0xf05de1a6  ! 4128: LDX_I	ldx	[%r23 + 0x01a6], %r24
	.word 0xfa5da108  ! 4130: LDX_I	ldx	[%r22 + 0x0108], %r29
	.word 0xf01d4000  ! 4132: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xf20520a6  ! 4137: LDUW_I	lduw	[%r20 + 0x00a6], %r25
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4c61b2  ! 4140: LDSB_I	ldsb	[%r17 + 0x01b2], %r30
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919461c6  ! 4142: WRPR_PIL_I	wrpr	%r17, 0x01c6, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982f09  ! 4147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f09, %hpstate
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 4151: RDPR_TT	<illegal instruction>
	.word 0xf45d8000  ! 4155: LDX_R	ldx	[%r22 + %r0], %r26
	setx	data_start_5, %g1, %r19
	.word 0xf21cc000  ! 4158: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xfc0d60f1  ! 4159: LDUB_I	ldub	[%r21 + 0x00f1], %r30
	.word 0x8994a0e2  ! 4162: WRPR_TICK_I	wrpr	%r18, 0x00e2, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb424a0fb  ! 4170: SUB_I	sub 	%r18, 0x00fb, %r26
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 4172: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xbd50c000  ! 4176: RDPR_TT	rdpr	%tt, %r30
	setx	0x10014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa458000  ! 4178: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xfe540000  ! 4179: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0x839560b0  ! 4181: WRPR_TNPC_I	wrpr	%r21, 0x00b0, %tnpc
	.word 0xb1520000  ! 4182: RDPR_PIL	<illegal instruction>
	.word 0xb7510000  ! 4186: RDPR_TICK	<illegal instruction>
	.word 0xfe5c4000  ! 4187: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xf61c4000  ! 4188: LDD_R	ldd	[%r17 + %r0], %r27
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0de067  ! 4192: LDUB_I	ldub	[%r23 + 0x0067], %r30
	.word 0x83946186  ! 4193: WRPR_TNPC_I	wrpr	%r17, 0x0186, %tnpc
	.word 0xb1348000  ! 4194: SRL_R	srl 	%r18, %r0, %r24
	.word 0x81946111  ! 4198: WRPR_TPC_I	wrpr	%r17, 0x0111, %tpc
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 4200: RDPR_TNPC	<illegal instruction>
	.word 0xfe1c2073  ! 4203: LDD_I	ldd	[%r16 + 0x0073], %r31
	.word 0x8595a053  ! 4208: WRPR_TSTATE_I	wrpr	%r22, 0x0053, %tstate
	.word 0x8d94a0a9  ! 4212: WRPR_PSTATE_I	wrpr	%r18, 0x00a9, %pstate
	.word 0x9195a142  ! 4213: WRPR_PIL_I	wrpr	%r22, 0x0142, %pil
	mov	2, %r14
	.word 0xa193a000  ! 4216: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7504000  ! 4218: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4223: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30119, %g1, %o0
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
	.word 0xf414a0d3  ! 4233: LDUH_I	lduh	[%r18 + 0x00d3], %r26
	.word 0xfa45c000  ! 4234: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf24dc000  ! 4235: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0x87946005  ! 4240: WRPR_TT_I	wrpr	%r17, 0x0005, %tt
	.word 0xff1c4000  ! 4242: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf444e117  ! 4248: LDSW_I	ldsw	[%r19 + 0x0117], %r26
	.word 0xbf510000  ! 4252: RDPR_TICK	<illegal instruction>
	setx	0x3013f, %g1, %o0
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
	.word 0xfa5cc000  ! 4262: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf6454000  ! 4264: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xbf643801  ! 4265: MOVcc_I	<illegal instruction>
	.word 0xfd1c2006  ! 4266: LDDF_I	ldd	[%r16, 0x0006], %f30
	.word 0xbca46190  ! 4269: SUBcc_I	subcc 	%r17, 0x0190, %r30
	.word 0xfa4d8000  ! 4270: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xbb2d7001  ! 4271: SLLX_I	sllx	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 4273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	.word 0xb0c42029  ! 4278: ADDCcc_I	addccc 	%r16, 0x0029, %r24
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4282: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r12
	.word 0x8f932000  ! 4287: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf245c000  ! 4288: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xf805e0ef  ! 4292: LDUW_I	lduw	[%r23 + 0x00ef], %r28
	.word 0xf05d8000  ! 4302: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0x83946162  ! 4307: WRPR_TNPC_I	wrpr	%r17, 0x0162, %tnpc
	.word 0xfa048000  ! 4310: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf25d4000  ! 4313: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfe05a1f2  ! 4316: LDUW_I	lduw	[%r22 + 0x01f2], %r31
	.word 0xf84c4000  ! 4317: LDSB_R	ldsb	[%r17 + %r0], %r28
	mov	0, %r14
	.word 0xa193a000  ! 4319: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc45c000  ! 4320: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb3518000  ! 4321: RDPR_PSTATE	<illegal instruction>
	.word 0xbd51c000  ! 4322: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0x8d94a07f  ! 4331: WRPR_PSTATE_I	wrpr	%r18, 0x007f, %pstate
	.word 0xf45dc000  ! 4334: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfa040000  ! 4336: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0x8194617f  ! 4337: WRPR_TPC_I	wrpr	%r17, 0x017f, %tpc
	.word 0x879420db  ! 4338: WRPR_TT_I	wrpr	%r16, 0x00db, %tt
	.word 0xb3500000  ! 4340: RDPR_TPC	<illegal instruction>
	.word 0x8794a187  ! 4342: WRPR_TT_I	wrpr	%r18, 0x0187, %tt
	.word 0x8195e00b  ! 4343: WRPR_TPC_I	wrpr	%r23, 0x000b, %tpc
	.word 0xfe440000  ! 4344: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xb3510000  ! 4345: RDPR_TICK	<illegal instruction>
	.word 0xb3508000  ! 4346: RDPR_TSTATE	<illegal instruction>
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4c52184  ! 4349: ADDCcc_I	addccc 	%r20, 0x0184, %r26
	.word 0x8d94e1c6  ! 4358: WRPR_PSTATE_I	wrpr	%r19, 0x01c6, %pstate
	.word 0xfc05a18f  ! 4359: LDUW_I	lduw	[%r22 + 0x018f], %r30
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4521cd  ! 4364: LDSW_I	ldsw	[%r20 + 0x01cd], %r30
	.word 0xfa4c21c4  ! 4366: LDSB_I	ldsb	[%r16 + 0x01c4], %r29
	.word 0xf84d0000  ! 4367: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb9510000  ! 4368: RDPR_TICK	<illegal instruction>
	.word 0xf2450000  ! 4370: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0x8795a15f  ! 4371: WRPR_TT_I	wrpr	%r22, 0x015f, %tt
	setx	0x30314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 4375: RDPR_TICK	<illegal instruction>
	.word 0xf91cc000  ! 4377: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xbd500000  ! 4379: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819829c3  ! 4380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c3, %hpstate
	setx	data_start_6, %g1, %r20
	.word 0xfb1de072  ! 4384: LDDF_I	ldd	[%r23, 0x0072], %f29
	.word 0xf11d4000  ! 4388: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xbf2d2001  ! 4393: SLL_I	sll 	%r20, 0x0001, %r31
	.word 0xf80dc000  ! 4395: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf4140000  ! 4397: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xb6952097  ! 4399: ORcc_I	orcc 	%r20, 0x0097, %r27
	.word 0xb5480000  ! 4400: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x83956167  ! 4401: WRPR_TNPC_I	wrpr	%r21, 0x0167, %tnpc
	.word 0xf24c0000  ! 4409: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe044000  ! 4412: LDUW_R	lduw	[%r17 + %r0], %r31
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1c4000  ! 4414: LDD_R	ldd	[%r17 + %r0], %r30
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855a02f  ! 4416: LDSH_I	ldsh	[%r22 + 0x002f], %r28
	.word 0xb5500000  ! 4417: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 4420: RDPR_TPC	<illegal instruction>
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60d8000  ! 4424: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xfe5c4000  ! 4429: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xf04c60fb  ! 4445: LDSB_I	ldsb	[%r17 + 0x00fb], %r24
	.word 0xf25c207f  ! 4447: LDX_I	ldx	[%r16 + 0x007f], %r25
	.word 0xfa04e060  ! 4448: LDUW_I	lduw	[%r19 + 0x0060], %r29
	.word 0xb6b5a1c5  ! 4454: SUBCcc_I	orncc 	%r22, 0x01c5, %r27
	setx	data_start_5, %g1, %r16
	setx	data_start_6, %g1, %r20
	.word 0xf2446071  ! 4459: LDSW_I	ldsw	[%r17 + 0x0071], %r25
	.word 0xfe1c60b1  ! 4460: LDD_I	ldd	[%r17 + 0x00b1], %r31
	.word 0xf2458000  ! 4462: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xba8c6175  ! 4465: ANDcc_I	andcc 	%r17, 0x0175, %r29
	.word 0xfc448000  ! 4466: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfa5cc000  ! 4467: LDX_R	ldx	[%r19 + %r0], %r29
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe450000  ! 4471: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfa1dc000  ! 4473: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xb5508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xf91d8000  ! 4477: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xb1540000  ! 4479: RDPR_GL	<illegal instruction>
	setx	0x30307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf244a024  ! 4482: LDSW_I	ldsw	[%r18 + 0x0024], %r25
	.word 0xf44de07c  ! 4483: LDSB_I	ldsb	[%r23 + 0x007c], %r26
	.word 0xbd510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xf8550000  ! 4488: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xba2c4000  ! 4489: ANDN_R	andn 	%r17, %r0, %r29
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855e1a0  ! 4494: LDSH_I	ldsh	[%r23 + 0x01a0], %r28
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4d4000  ! 4497: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xfc55e0bb  ! 4500: LDSH_I	ldsh	[%r23 + 0x00bb], %r30
	.word 0xfa15a1f6  ! 4503: LDUH_I	lduh	[%r22 + 0x01f6], %r29
	.word 0xf65d20d9  ! 4505: LDX_I	ldx	[%r20 + 0x00d9], %r27
	setx	data_start_2, %g1, %r16
	.word 0xf85420c6  ! 4513: LDSH_I	ldsh	[%r16 + 0x00c6], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b19  ! 4514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0x83946133  ! 4517: WRPR_TNPC_I	wrpr	%r17, 0x0133, %tnpc
	.word 0xfc1c60e9  ! 4521: LDD_I	ldd	[%r17 + 0x00e9], %r30
	.word 0xf41ca1af  ! 4522: LDD_I	ldd	[%r18 + 0x01af], %r26
	.word 0xf00c0000  ! 4523: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xf81de0ef  ! 4524: LDD_I	ldd	[%r23 + 0x00ef], %r28
	.word 0xfb1c8000  ! 4525: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xfa046197  ! 4526: LDUW_I	lduw	[%r17 + 0x0197], %r29
	.word 0xfe5d21ca  ! 4527: LDX_I	ldx	[%r20 + 0x01ca], %r31
	.word 0xf91c61c4  ! 4529: LDDF_I	ldd	[%r17, 0x01c4], %f28
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2554000  ! 4535: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf05560f8  ! 4542: LDSH_I	ldsh	[%r21 + 0x00f8], %r24
	mov	2, %r14
	.word 0xa193a000  ! 4543: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r17
	.word 0xbb510000  ! 4546: RDPR_TICK	<illegal instruction>
	.word 0xbc1c2193  ! 4547: XOR_I	xor 	%r16, 0x0193, %r30
	.word 0xff1d4000  ! 4550: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0x8195e0ac  ! 4551: WRPR_TPC_I	wrpr	%r23, 0x00ac, %tpc
	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb02d6078  ! 4555: ANDN_I	andn 	%r21, 0x0078, %r24
	.word 0xfc142193  ! 4556: LDUH_I	lduh	[%r16 + 0x0193], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xf804202a  ! 4566: LDUW_I	lduw	[%r16 + 0x002a], %r28
	.word 0xf04da066  ! 4567: LDSB_I	ldsb	[%r22 + 0x0066], %r24
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xf25d4000  ! 4572: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf11cc000  ! 4574: LDDF_R	ldd	[%r19, %r0], %f24
	mov	2, %r12
	.word 0x8f932000  ! 4575: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8594e161  ! 4576: WRPR_TSTATE_I	wrpr	%r19, 0x0161, %tstate
	.word 0xf91c4000  ! 4578: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xb9480000  ! 4584: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d946192  ! 4586: WRPR_PSTATE_I	wrpr	%r17, 0x0192, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	.word 0xb6ad4000  ! 4589: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xbf3c0000  ! 4591: SRA_R	sra 	%r16, %r0, %r31
	.word 0x8994e1ec  ! 4592: WRPR_TICK_I	wrpr	%r19, 0x01ec, %tick
	.word 0xb6040000  ! 4594: ADD_R	add 	%r16, %r0, %r27
	.word 0x89952105  ! 4600: WRPR_TICK_I	wrpr	%r20, 0x0105, %tick
	.word 0xbd540000  ! 4601: RDPR_GL	<illegal instruction>
	.word 0xfc040000  ! 4604: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf31d4000  ! 4612: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf4148000  ! 4615: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf00c8000  ! 4616: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf20de146  ! 4619: LDUB_I	ldub	[%r23 + 0x0146], %r25
	.word 0xbd2c2001  ! 4620: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xb88d4000  ! 4621: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xf85c602a  ! 4622: LDX_I	ldx	[%r17 + 0x002a], %r28
	.word 0xfd1c219f  ! 4626: LDDF_I	ldd	[%r16, 0x019f], %f30
	.word 0xff1c0000  ! 4627: LDDF_R	ldd	[%r16, %r0], %f31
	setx	data_start_2, %g1, %r16
	setx	data_start_1, %g1, %r23
	.word 0x81952049  ! 4640: WRPR_TPC_I	wrpr	%r20, 0x0049, %tpc
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbd2136  ! 4646: XNORcc_I	xnorcc 	%r20, 0x0136, %r30
	.word 0xfc556112  ! 4647: LDSH_I	ldsh	[%r21 + 0x0112], %r30
	.word 0xf05c8000  ! 4648: LDX_R	ldx	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 4649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xf31da1dc  ! 4652: LDDF_I	ldd	[%r22, 0x01dc], %f25
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4654: RDPR_TPC	<illegal instruction>
	.word 0xbb7d2401  ! 4656: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xfa4c20ad  ! 4657: LDSB_I	ldsb	[%r16 + 0x00ad], %r29
	.word 0xb750c000  ! 4658: RDPR_TT	<illegal instruction>
	.word 0xf40de187  ! 4660: LDUB_I	ldub	[%r23 + 0x0187], %r26
	.word 0xb7504000  ! 4661: RDPR_TNPC	<illegal instruction>
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b13  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b13, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983a5b  ! 4668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5b, %hpstate
	.word 0xfc44e077  ! 4673: LDSW_I	ldsw	[%r19 + 0x0077], %r30
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45ce148  ! 4675: LDX_I	ldx	[%r19 + 0x0148], %r26
	.word 0x919461c8  ! 4677: WRPR_PIL_I	wrpr	%r17, 0x01c8, %pil
	.word 0xfe5ce1dd  ! 4679: LDX_I	ldx	[%r19 + 0x01dd], %r31
	.word 0xfc1c6159  ! 4680: LDD_I	ldd	[%r17 + 0x0159], %r30
	.word 0xf254e0cd  ! 4682: LDSH_I	ldsh	[%r19 + 0x00cd], %r25
	.word 0xf44d0000  ! 4685: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xfc5de180  ! 4688: LDX_I	ldx	[%r23 + 0x0180], %r30
	.word 0xb750c000  ! 4690: RDPR_TT	<illegal instruction>
	.word 0xf24ce101  ! 4695: LDSB_I	ldsb	[%r19 + 0x0101], %r25
	.word 0xfb1c8000  ! 4696: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf8158000  ! 4700: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xbb480000  ! 4701: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb950c000  ! 4702: RDPR_TT	<illegal instruction>
	.word 0xf21521e5  ! 4705: LDUH_I	lduh	[%r20 + 0x01e5], %r25
	.word 0xb49cc000  ! 4707: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0x8d9520e3  ! 4710: WRPR_PSTATE_I	wrpr	%r20, 0x00e3, %pstate
	.word 0xbc0421dc  ! 4711: ADD_I	add 	%r16, 0x01dc, %r30
	.word 0x8395a021  ! 4712: WRPR_TNPC_I	wrpr	%r22, 0x0021, %tnpc
	.word 0x9194a00e  ! 4716: WRPR_PIL_I	wrpr	%r18, 0x000e, %pil
	.word 0xfe4c0000  ! 4717: LDSB_R	ldsb	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45d6107  ! 4722: LDX_I	ldx	[%r21 + 0x0107], %r26
	.word 0xb7520000  ! 4723: RDPR_PIL	<illegal instruction>
	setx	data_start_1, %g1, %r17
	.word 0xf814a1cb  ! 4726: LDUH_I	lduh	[%r18 + 0x01cb], %r28
	.word 0xf20ca076  ! 4727: LDUB_I	ldub	[%r18 + 0x0076], %r25
	.word 0xf11c2150  ! 4731: LDDF_I	ldd	[%r16, 0x0150], %f24
	.word 0xfa0da17b  ! 4732: LDUB_I	ldub	[%r22 + 0x017b], %r29
	.word 0xfc158000  ! 4733: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfe55a079  ! 4734: LDSH_I	ldsh	[%r22 + 0x0079], %r31
	.word 0xba8d0000  ! 4735: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xba1d4000  ! 4741: XOR_R	xor 	%r21, %r0, %r29
	.word 0xbf643801  ! 4742: MOVcc_I	<illegal instruction>
	.word 0xb950c000  ! 4743: RDPR_TT	<illegal instruction>
	.word 0xfc45e1b4  ! 4745: LDSW_I	ldsw	[%r23 + 0x01b4], %r30
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91942034  ! 4749: WRPR_PIL_I	wrpr	%r16, 0x0034, %pil
	.word 0xf65d4000  ! 4752: LDX_R	ldx	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa558000  ! 4757: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb6ace127  ! 4759: ANDNcc_I	andncc 	%r19, 0x0127, %r27
	.word 0xfa0ce187  ! 4764: LDUB_I	ldub	[%r19 + 0x0187], %r29
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25c20d1  ! 4772: LDX_I	ldx	[%r16 + 0x00d1], %r25
	.word 0xf244e0b7  ! 4775: LDSW_I	ldsw	[%r19 + 0x00b7], %r25
	.word 0xfa1d60d9  ! 4776: LDD_I	ldd	[%r21 + 0x00d9], %r29
	.word 0xf00c0000  ! 4778: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0x8d94a126  ! 4779: WRPR_PSTATE_I	wrpr	%r18, 0x0126, %pstate
	.word 0xf6448000  ! 4780: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0x919461ed  ! 4782: WRPR_PIL_I	wrpr	%r17, 0x01ed, %pil
	.word 0xb9480000  ! 4783: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf31d0000  ! 4785: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xf81c8000  ! 4791: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf45d6105  ! 4795: LDX_I	ldx	[%r21 + 0x0105], %r26
	.word 0xf4456103  ! 4796: LDSW_I	ldsw	[%r21 + 0x0103], %r26
	.word 0xf24d61c3  ! 4799: LDSB_I	ldsb	[%r21 + 0x01c3], %r25
	.word 0xb1520000  ! 4803: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfe5d2028  ! 4806: LDX_I	ldx	[%r20 + 0x0028], %r31
	.word 0xfe55c000  ! 4810: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf61c21c9  ! 4815: LDD_I	ldd	[%r16 + 0x01c9], %r27
	.word 0xfc552143  ! 4817: LDSH_I	ldsh	[%r20 + 0x0143], %r30
	.word 0xf31c8000  ! 4819: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xfa454000  ! 4825: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf005a1af  ! 4826: LDUW_I	lduw	[%r22 + 0x01af], %r24
	.word 0xf31d8000  ! 4827: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf40dc000  ! 4828: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xfe544000  ! 4829: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf61d6153  ! 4831: LDD_I	ldd	[%r21 + 0x0153], %r27
	.word 0xfe452002  ! 4835: LDSW_I	ldsw	[%r20 + 0x0002], %r31
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4c217d  ! 4840: LDSB_I	ldsb	[%r16 + 0x017d], %r30
	.word 0x9195a026  ! 4843: WRPR_PIL_I	wrpr	%r22, 0x0026, %pil
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d0000  ! 4847: LDSB_R	ldsb	[%r20 + %r0], %r31
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65c6187  ! 4851: LDX_I	ldx	[%r17 + 0x0187], %r27
	.word 0xb5504000  ! 4852: RDPR_TNPC	<illegal instruction>
	.word 0xfe0cc000  ! 4855: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf2140000  ! 4861: LDUH_R	lduh	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2440000  ! 4872: LDSW_R	ldsw	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4878: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80cc000  ! 4881: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xbf51c000  ! 4882: RDPR_TL	<illegal instruction>
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 4889: MOVcc_I	<illegal instruction>
	setx	0x30203, %g1, %o0
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
	.word 0xbb34a001  ! 4892: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xfc04c000  ! 4893: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xf615a0b0  ! 4894: LDUH_I	lduh	[%r22 + 0x00b0], %r27
	setx	data_start_2, %g1, %r20
	.word 0xf84c0000  ! 4898: LDSB_R	ldsb	[%r16 + %r0], %r28
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 4905: RDPR_TL	<illegal instruction>
	.word 0xf6442000  ! 4909: LDSW_I	ldsw	[%r16 + 0x0000], %r27
	.word 0xb350c000  ! 4910: RDPR_TT	<illegal instruction>
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454e176  ! 4914: LDSH_I	ldsh	[%r19 + 0x0176], %r26
	.word 0xf4452054  ! 4918: LDSW_I	ldsw	[%r20 + 0x0054], %r26
	.word 0xf005c000  ! 4919: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfc4c0000  ! 4921: LDSB_R	ldsb	[%r16 + %r0], %r30
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a02b  ! 4925: WRPR_TNPC_I	wrpr	%r18, 0x002b, %tnpc
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25cc000  ! 4933: LDX_R	ldx	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x819838c3  ! 4935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c3, %hpstate
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bd8000  ! 4940: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xb9480000  ! 4941: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x819829cb  ! 4943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cb, %hpstate
	.word 0xfa5d8000  ! 4950: LDX_R	ldx	[%r22 + %r0], %r29
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11cc000  ! 4954: LDDF_R	ldd	[%r19, %r0], %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0xf91c4000  ! 4958: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0x9195e147  ! 4959: WRPR_PIL_I	wrpr	%r23, 0x0147, %pil
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa156040  ! 4966: LDUH_I	lduh	[%r21 + 0x0040], %r29
	.word 0xfe158000  ! 4967: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xbc45e03c  ! 4969: ADDC_I	addc 	%r23, 0x003c, %r30
	.word 0xf6448000  ! 4970: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0x8194e12f  ! 4972: WRPR_TPC_I	wrpr	%r19, 0x012f, %tpc
	.word 0xff1d6137  ! 4973: LDDF_I	ldd	[%r21, 0x0137], %f31
	.word 0xbab54000  ! 4974: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xf65c0000  ! 4975: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf6142150  ! 4982: LDUH_I	lduh	[%r16 + 0x0150], %r27
	.word 0x87942183  ! 4983: WRPR_TT_I	wrpr	%r16, 0x0183, %tt
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00ce1ca  ! 4985: LDUB_I	ldub	[%r19 + 0x01ca], %r24
	.word 0x859561cb  ! 4986: WRPR_TSTATE_I	wrpr	%r21, 0x01cb, %tstate
	.word 0xfe1d60b0  ! 4991: LDD_I	ldd	[%r21 + 0x00b0], %r31
	mov	1, %r12
	.word 0x8f932000  ! 4992: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb12ce001  ! 4993: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xf00c8000  ! 4994: LDUB_R	ldub	[%r18 + %r0], %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb7a58920  ! 3: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb3a448e0  ! 5: FSUBq	dis not found

	.word 0xbba81820  ! 7: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa588c0  ! 25: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xb9a4c840  ! 28: FADDd	faddd	%f50, %f0, %f28
	.word 0xbc358000  ! 29: SUBC_R	orn 	%r22, %r0, %r30
	.word 0xbd520000  ! 30: RDPR_PIL	<illegal instruction>
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 35: RDPR_TNPC	<illegal instruction>
	.word 0xb7520000  ! 37: RDPR_PIL	<illegal instruction>
	.word 0xbfa54920  ! 41: FMULs	fmuls	%f21, %f0, %f31
	.word 0xbb2dc000  ! 46: SLL_R	sll 	%r23, %r0, %r29
	.word 0x8d9521c3  ! 51: WRPR_PSTATE_I	wrpr	%r20, 0x01c3, %pstate
	.word 0xbfa00020  ! 55: FMOVs	fmovs	%f0, %f31
	.word 0xb1510000  ! 56: RDPR_TICK	<illegal instruction>
	.word 0xbd480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7a488a0  ! 59: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb7a44940  ! 60: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb1a48860  ! 61: FADDq	dis not found

	.word 0xbfa81820  ! 63: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa4c920  ! 66: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbfab8820  ! 77: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbda40840  ! 78: FADDd	faddd	%f16, %f0, %f30
	.word 0xb3a81420  ! 79: FMOVRNZ	dis not found

	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 84: FMOVd	fmovd	%f0, %f26
	.word 0xbfa80c20  ! 88: FMOVRLZ	dis not found

	.word 0xb3540000  ! 91: RDPR_GL	<illegal instruction>
	.word 0xbfa448c0  ! 92: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb7a00560  ! 93: FSQRTq	fsqrt	
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 96: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb7a58840  ! 98: FADDd	faddd	%f22, %f0, %f58
	.word 0xb550c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0xbba81c20  ! 106: FMOVRGEZ	dis not found

	.word 0xb5508000  ! 108: RDPR_TSTATE	<illegal instruction>
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0x87952167  ! 120: WRPR_TT_I	wrpr	%r20, 0x0167, %tt
	.word 0xb3480000  ! 121: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 125: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbbaa8820  ! 126: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb0b44000  ! 127: SUBCcc_R	orncc 	%r17, %r0, %r24
	setx	data_start_7, %g1, %r16
	.word 0xb7a84820  ! 135: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	0x10238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40860  ! 141: FADDq	dis not found

	.word 0xb01521be  ! 143: OR_I	or 	%r20, 0x01be, %r24
	.word 0xbdaa0820  ! 144: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab4820  ! 145: FMOVCC	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983d11  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d11, %hpstate
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a549a0  ! 158: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbfa50940  ! 159: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbfab4820  ! 163: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9ab0820  ! 164: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb28c0000  ! 165: ANDcc_R	andcc 	%r16, %r0, %r25
	setx	data_start_0, %g1, %r18
	.word 0xb1a9c820  ! 169: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8795612b  ! 170: WRPR_TT_I	wrpr	%r21, 0x012b, %tt
	setx	0x3032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 172: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00520  ! 173: FSQRTs	fsqrt	
	.word 0xb5a5c940  ! 175: FMULd	fmuld	%f54, %f0, %f26
	.word 0xbdab8820  ! 177: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a508a0  ! 178: FSUBs	fsubs	%f20, %f0, %f26
	mov	0, %r14
	.word 0xa193a000  ! 179: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a94820  ! 180: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a58820  ! 182: FADDs	fadds	%f22, %f0, %f27
	.word 0xb9a94820  ! 184: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa94820  ! 185: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81820  ! 186: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb7a448c0  ! 187: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbf500000  ! 188: RDPR_TPC	<illegal instruction>
	.word 0x8194a042  ! 189: WRPR_TPC_I	wrpr	%r18, 0x0042, %tpc
	.word 0xbe3d4000  ! 191: XNOR_R	xnor 	%r21, %r0, %r31
	.word 0x8395a0c8  ! 194: WRPR_TNPC_I	wrpr	%r22, 0x00c8, %tnpc
	.word 0xb5a549a0  ! 195: FDIVs	fdivs	%f21, %f0, %f26
	.word 0x8595613c  ! 200: WRPR_TSTATE_I	wrpr	%r21, 0x013c, %tstate
	.word 0xbba00560  ! 203: FSQRTq	fsqrt	
	.word 0xb7a00540  ! 210: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb024e0bd  ! 217: SUB_I	sub 	%r19, 0x00bd, %r24
	.word 0xb7a00520  ! 218: FSQRTs	fsqrt	
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9354000  ! 220: SRL_R	srl 	%r21, %r0, %r28
	.word 0xbc446151  ! 221: ADDC_I	addc 	%r17, 0x0151, %r30
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a099  ! 223: WRPR_TNPC_I	wrpr	%r22, 0x0099, %tnpc
	.word 0xb6a44000  ! 226: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb5518000  ! 227: RDPR_PSTATE	<illegal instruction>
	.word 0xb0850000  ! 228: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xb9a4c820  ! 229: FADDs	fadds	%f19, %f0, %f28
	.word 0xb3a94820  ! 233: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 237: FSQRTq	fsqrt	
	.word 0xbda449a0  ! 240: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xb9a54860  ! 242: FADDq	dis not found

	.word 0xbda5c8c0  ! 244: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb3a00520  ! 246: FSQRTs	fsqrt	
	.word 0xb02461ad  ! 247: SUB_I	sub 	%r17, 0x01ad, %r24
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 255: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a509a0  ! 256: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb734c000  ! 258: SRL_R	srl 	%r19, %r0, %r27
	.word 0xb7a488a0  ! 260: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb7a54920  ! 262: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb7a58860  ! 264: FADDq	dis not found

	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xb1a4c9c0  ! 272: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xbda588c0  ! 275: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb5a50820  ! 277: FADDs	fadds	%f20, %f0, %f26
	.word 0x87952175  ! 278: WRPR_TT_I	wrpr	%r20, 0x0175, %tt
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95610d  ! 281: WRPR_PSTATE_I	wrpr	%r21, 0x010d, %pstate
	.word 0xb40d0000  ! 282: AND_R	and 	%r20, %r0, %r26
	.word 0xb3a409c0  ! 283: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xbba9c820  ! 284: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a448a0  ! 285: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbd480000  ! 287: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbb540000  ! 293: RDPR_GL	<illegal instruction>
	setx	data_start_3, %g1, %r16
	setx	data_start_3, %g1, %r22
	.word 0xb1540000  ! 297: RDPR_GL	<illegal instruction>
	.word 0xbbaa8820  ! 299: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x8595e015  ! 303: WRPR_TSTATE_I	wrpr	%r23, 0x0015, %tstate
	.word 0xb7a90820  ! 305: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda4c920  ! 307: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb8b52003  ! 311: ORNcc_I	orncc 	%r20, 0x0003, %r28
	.word 0xb7a81c20  ! 313: FMOVRGEZ	dis not found

	.word 0x89952071  ! 314: WRPR_TICK_I	wrpr	%r20, 0x0071, %tick
	.word 0xbba50840  ! 315: FADDd	faddd	%f20, %f0, %f60
	.word 0xb3a00520  ! 316: FSQRTs	fsqrt	
	.word 0xbda40960  ! 317: FMULq	dis not found

	.word 0xb3a80820  ! 318: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb3a4c920  ! 319: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbda58820  ! 321: FADDs	fadds	%f22, %f0, %f30
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 328: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbba00040  ! 329: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a48940  ! 335: FMULd	fmuld	%f18, %f0, %f28
	.word 0xbda9c820  ! 336: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfabc820  ! 340: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbb3c8000  ! 342: SRA_R	sra 	%r18, %r0, %r29
	.word 0xb7a98820  ! 343: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb7aac820  ! 344: FMOVGE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982e81  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e81, %hpstate
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 356: RDPR_TL	<illegal instruction>
	.word 0x859460c8  ! 357: WRPR_TSTATE_I	wrpr	%r17, 0x00c8, %tstate
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 360: RDPR_TT	<illegal instruction>
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 367: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf3d7001  ! 368: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xb3ab4820  ! 371: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8394a117  ! 373: WRPR_TNPC_I	wrpr	%r18, 0x0117, %tnpc
	setx	0x30121, %g1, %o0
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
	.word 0xb80cc000  ! 382: AND_R	and 	%r19, %r0, %r28
	.word 0xb0b460ce  ! 385: ORNcc_I	orncc 	%r17, 0x00ce, %r24
	.word 0xbd540000  ! 386: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	.word 0xb9a00520  ! 388: FSQRTs	fsqrt	
	.word 0xbb520000  ! 391: RDPR_PIL	<illegal instruction>
	.word 0xb3a5c820  ! 392: FADDs	fadds	%f23, %f0, %f25
	.word 0xbd350000  ! 395: SRL_R	srl 	%r20, %r0, %r30
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda549c0  ! 400: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb3a488a0  ! 401: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb9abc820  ! 402: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa408a0  ! 403: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbda00520  ! 408: FSQRTs	fsqrt	
	.word 0xb6350000  ! 410: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb3a589e0  ! 411: FDIVq	dis not found

	.word 0xb9a94820  ! 412: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xba2c2049  ! 415: ANDN_I	andn 	%r16, 0x0049, %r29
	.word 0xbfaa0820  ! 418: FMOVA	fmovs	%fcc1, %f0, %f31
	setx	0x1032b, %g1, %o0
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
	.word 0xb1518000  ! 425: RDPR_PSTATE	<illegal instruction>
	.word 0xb1500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb7a4c8a0  ! 429: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xba3ca0e3  ! 430: XNOR_I	xnor 	%r18, 0x00e3, %r29
	.word 0xb7641800  ! 431: MOVcc_R	<illegal instruction>
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20110, %g1, %o0
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
	.word 0xbfa80820  ! 437: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00560  ! 438: FSQRTq	fsqrt	
	.word 0xb1a98820  ! 439: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbfab0820  ! 448: FMOVGU	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5540000  ! 450: RDPR_GL	<illegal instruction>
	.word 0xb3a81420  ! 454: FMOVRNZ	dis not found

	.word 0xb9a5c960  ! 460: FMULq	dis not found

	.word 0xbcad6188  ! 466: ANDNcc_I	andncc 	%r21, 0x0188, %r30
	.word 0x87946086  ! 467: WRPR_TT_I	wrpr	%r17, 0x0086, %tt
	.word 0xbda58940  ! 470: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb7a00040  ! 471: FMOVd	fmovd	%f0, %f58
	.word 0xb551c000  ! 473: RDPR_TL	<illegal instruction>
	.word 0xb1a00540  ! 475: FSQRTd	fsqrt	
	.word 0x8195a14f  ! 479: WRPR_TPC_I	wrpr	%r22, 0x014f, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb00da1c8  ! 483: AND_I	and 	%r22, 0x01c8, %r24
	setx	data_start_1, %g1, %r23
	.word 0xb3a80820  ! 487: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb885c000  ! 489: ADDcc_R	addcc 	%r23, %r0, %r28
	.word 0xb3a44920  ! 490: FMULs	fmuls	%f17, %f0, %f25
	.word 0xbda4c940  ! 492: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb5a00540  ! 499: FSQRTd	fsqrt	
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb01d4000  ! 503: XOR_R	xor 	%r21, %r0, %r24
	.word 0xb9a00520  ! 504: FSQRTs	fsqrt	
	.word 0xb3a81c20  ! 506: FMOVRGEZ	dis not found

	.word 0xb3a80820  ! 508: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982c99  ! 510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c99, %hpstate
	.word 0x85956121  ! 513: WRPR_TSTATE_I	wrpr	%r21, 0x0121, %tstate
	.word 0x8394219d  ! 517: WRPR_TNPC_I	wrpr	%r16, 0x019d, %tnpc
	.word 0xb5a588c0  ! 518: FSUBd	fsubd	%f22, %f0, %f26
	mov	1, %r14
	.word 0xa193a000  ! 526: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 533: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00560  ! 536: FSQRTq	fsqrt	
	.word 0xbe3c8000  ! 541: XNOR_R	xnor 	%r18, %r0, %r31
	.word 0xb025218f  ! 542: SUB_I	sub 	%r20, 0x018f, %r24
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 545: FMOVRLZ	dis not found

	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 549: MOVcc_I	<illegal instruction>
	.word 0xb9480000  ! 550: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbba00540  ! 552: FSQRTd	fsqrt	
	.word 0x8594e005  ! 554: WRPR_TSTATE_I	wrpr	%r19, 0x0005, %tstate
	.word 0x8195200f  ! 557: WRPR_TPC_I	wrpr	%r20, 0x000f, %tpc
	.word 0xbdaa4820  ! 558: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb4454000  ! 559: ADDC_R	addc 	%r21, %r0, %r26
	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 562: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e08f  ! 569: WRPR_PSTATE_I	wrpr	%r19, 0x008f, %pstate
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b58000  ! 578: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xb62c0000  ! 581: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xb3a81c20  ! 584: FMOVRGEZ	dis not found

	.word 0xbf3cd000  ! 587: SRAX_R	srax	%r19, %r0, %r31
	.word 0xbb520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xbda81c20  ! 591: FMOVRGEZ	dis not found

	.word 0x8d94a06c  ! 596: WRPR_PSTATE_I	wrpr	%r18, 0x006c, %pstate
	.word 0xbbabc820  ! 597: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1500000  ! 600: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 601: FSQRTq	fsqrt	
	.word 0xbfa00540  ! 603: FSQRTd	fsqrt	
	.word 0xb3a98820  ! 608: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81820  ! 612: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982d49  ! 614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	.word 0xb1aac820  ! 615: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbbaa0820  ! 616: FMOVA	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 625: FMOVRLZ	dis not found

	.word 0x89946156  ! 635: WRPR_TICK_I	wrpr	%r17, 0x0156, %tick
	.word 0xb9a58960  ! 646: FMULq	dis not found

	.word 0xbfaa0820  ! 648: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbba9c820  ! 650: FMOVVS	fmovs	%fcc1, %f0, %f29
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 652: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb7a54860  ! 657: FADDq	dis not found

	.word 0xbda448c0  ! 659: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb3357001  ! 663: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xb3a80420  ! 665: FMOVRZ	dis not found

	.word 0xb7aa0820  ! 667: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0x81952078  ! 668: WRPR_TPC_I	wrpr	%r20, 0x0078, %tpc
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 677: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	setx	data_start_4, %g1, %r17
	.word 0xb60521c1  ! 683: ADD_I	add 	%r20, 0x01c1, %r27
	.word 0xb1a54940  ! 685: FMULd	fmuld	%f52, %f0, %f24
	.word 0x8795e171  ! 686: WRPR_TT_I	wrpr	%r23, 0x0171, %tt
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbebde04e  ! 696: XNORcc_I	xnorcc 	%r23, 0x004e, %r31
	.word 0x81952167  ! 698: WRPR_TPC_I	wrpr	%r20, 0x0167, %tpc
	setx	0x216, %g1, %o0
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
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8b461ec  ! 711: SUBCcc_I	orncc 	%r17, 0x01ec, %r28
	.word 0xb8c561e4  ! 712: ADDCcc_I	addccc 	%r21, 0x01e4, %r28
	.word 0x919520ee  ! 713: WRPR_PIL_I	wrpr	%r20, 0x00ee, %pil
	.word 0xb9a449c0  ! 718: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xbf504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xb9a8c820  ! 721: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8995a176  ! 729: WRPR_TICK_I	wrpr	%r22, 0x0176, %tick
	.word 0xb1643801  ! 730: MOVcc_I	<illegal instruction>
	.word 0xb72d9000  ! 731: SLLX_R	sllx	%r22, %r0, %r27
	.word 0xbdab4820  ! 732: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a98820  ! 733: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbc84618b  ! 734: ADDcc_I	addcc 	%r17, 0x018b, %r30
	.word 0x8d9561b0  ! 737: WRPR_PSTATE_I	wrpr	%r21, 0x01b0, %pstate
	.word 0xbda409e0  ! 738: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982bcb  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcb, %hpstate
	.word 0x85956134  ! 741: WRPR_TSTATE_I	wrpr	%r21, 0x0134, %tstate
	.word 0xb9ab0820  ! 748: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0x9195a143  ! 752: WRPR_PIL_I	wrpr	%r22, 0x0143, %pil
	.word 0xb7a488a0  ! 754: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb351c000  ! 756: RDPR_TL	<illegal instruction>
	.word 0xbfa00520  ! 759: FSQRTs	fsqrt	
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x85946078  ! 762: WRPR_TSTATE_I	wrpr	%r17, 0x0078, %tstate
	.word 0xb5a00520  ! 763: FSQRTs	fsqrt	
	.word 0xb7a80820  ! 764: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba00040  ! 765: FMOVd	fmovd	%f0, %f60
	.word 0xbba81420  ! 769: FMOVRNZ	dis not found

	.word 0x8594e034  ! 771: WRPR_TSTATE_I	wrpr	%r19, 0x0034, %tstate
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 780: RDPR_TPC	<illegal instruction>
	.word 0xbba98820  ! 784: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbd51c000  ! 785: RDPR_TL	<illegal instruction>
	.word 0xb5a80820  ! 790: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba81820  ! 791: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x8595e0b4  ! 792: WRPR_TSTATE_I	wrpr	%r23, 0x00b4, %tstate
	.word 0xb9480000  ! 793: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3ab4820  ! 794: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda84820  ! 795: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a409e0  ! 801: FDIVq	dis not found

	.word 0xb1a4c8e0  ! 802: FSUBq	dis not found

	.word 0xbb480000  ! 804: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_7, %g1, %r16
	.word 0xbba00040  ! 809: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	.word 0x81982989  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0989, %hpstate
	.word 0xbba00540  ! 813: FSQRTd	fsqrt	
	setx	data_start_7, %g1, %r19
	.word 0xb3ab0820  ! 819: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a589a0  ! 825: FDIVs	fdivs	%f22, %f0, %f24
	.word 0x8d94a1c5  ! 826: WRPR_PSTATE_I	wrpr	%r18, 0x01c5, %pstate
	.word 0xbdaac820  ! 827: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb350c000  ! 828: RDPR_TT	<illegal instruction>
	.word 0xb3ab4820  ! 833: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb7518000  ! 837: RDPR_PSTATE	<illegal instruction>
	.word 0xbfab4820  ! 839: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 840: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8795216f  ! 842: WRPR_TT_I	wrpr	%r20, 0x016f, %tt
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9e0  ! 851: FDIVq	dis not found

	.word 0x89946046  ! 852: WRPR_TICK_I	wrpr	%r17, 0x0046, %tick
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 865: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb550c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x8594a1ff  ! 873: WRPR_TSTATE_I	wrpr	%r18, 0x01ff, %tstate
	.word 0xb5a80420  ! 874: FMOVRZ	dis not found

	.word 0xb9a90820  ! 875: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50820  ! 876: FADDs	fadds	%f20, %f0, %f31
	.word 0xbc2c8000  ! 879: ANDN_R	andn 	%r18, %r0, %r30
	.word 0xb7a588a0  ! 880: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb950c000  ! 883: RDPR_TT	<illegal instruction>
	.word 0xb1aa0820  ! 888: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00020  ! 890: FMOVs	fmovs	%f0, %f25
	.word 0xb1a80c20  ! 897: FMOVRLZ	dis not found

	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8a0  ! 901: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbfa4c8a0  ! 902: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xb9abc820  ! 903: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb750c000  ! 905: RDPR_TT	rdpr	%tt, %r27
	.word 0xb535d000  ! 906: SRLX_R	srlx	%r23, %r0, %r26
	mov	1, %r14
	.word 0xa193a000  ! 910: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x839421fc  ! 915: WRPR_TNPC_I	wrpr	%r16, 0x01fc, %tnpc
	.word 0xb9aa8820  ! 916: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa81420  ! 917: FMOVRNZ	dis not found

	.word 0xb335e001  ! 918: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xbd510000  ! 919: RDPR_TICK	<illegal instruction>
	.word 0xb7a40820  ! 921: FADDs	fadds	%f16, %f0, %f27
	.word 0xbfa58920  ! 924: FMULs	fmuls	%f22, %f0, %f31
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 932: ORN_R	orn 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982c93  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c93, %hpstate
	setx	data_start_1, %g1, %r20
	.word 0xb151c000  ! 944: RDPR_TL	<illegal instruction>
	.word 0xbda5c9c0  ! 945: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb3a50840  ! 946: FADDd	faddd	%f20, %f0, %f56
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	.word 0x819520e4  ! 960: WRPR_TPC_I	wrpr	%r20, 0x00e4, %tpc
	.word 0xbfa44840  ! 961: FADDd	faddd	%f48, %f0, %f62
	.word 0xb9ab4820  ! 962: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb1a9c820  ! 963: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb8b4211b  ! 964: ORNcc_I	orncc 	%r16, 0x011b, %r28
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 967: FMOVRGEZ	dis not found

	.word 0xb5a44840  ! 968: FADDd	faddd	%f48, %f0, %f26
	.word 0xb9a80c20  ! 972: FMOVRLZ	dis not found

	.word 0xbbabc820  ! 976: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5508000  ! 977: RDPR_TSTATE	<illegal instruction>
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 982: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb934c000  ! 984: SRL_R	srl 	%r19, %r0, %r28
	.word 0xbb510000  ! 986: RDPR_TICK	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb32c1000  ! 988: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xbfaa0820  ! 990: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0x9194202f  ! 991: WRPR_PIL_I	wrpr	%r16, 0x002f, %pil
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 998: FMOVRZ	dis not found

	.word 0xb5aac820  ! 1000: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a8c820  ! 1001: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbd510000  ! 1003: RDPR_TICK	<illegal instruction>
	.word 0xbdab8820  ! 1006: FMOVPOS	fmovs	%fcc1, %f0, %f30
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x100, %g1, %o0
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
	.word 0xb9508000  ! 1020: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00560  ! 1023: FSQRTq	fsqrt	
	.word 0xb7aa0820  ! 1025: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbd3d2001  ! 1027: SRA_I	sra 	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 1028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda81c20  ! 1030: FMOVRGEZ	dis not found

	.word 0xbba50920  ! 1035: FMULs	fmuls	%f20, %f0, %f29
	.word 0xbfa80820  ! 1036: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb5a5c840  ! 1040: FADDd	faddd	%f54, %f0, %f26
	.word 0xb1500000  ! 1045: RDPR_TPC	<illegal instruction>
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 1051: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 1053: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983a81  ! 1057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a81, %hpstate
	.word 0xb9aa4820  ! 1059: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a00560  ! 1062: FSQRTq	fsqrt	
	.word 0xb7518000  ! 1065: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1066: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf2c3001  ! 1068: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xb7a488e0  ! 1070: FSUBq	dis not found

	.word 0x8995a057  ! 1072: WRPR_TICK_I	wrpr	%r22, 0x0057, %tick
	setx	data_start_1, %g1, %r18
	.word 0xb5aa0820  ! 1078: FMOVA	fmovs	%fcc1, %f0, %f26
	setx	0x10322, %g1, %o0
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
	.word 0xb82c0000  ! 1084: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xb3a8c820  ! 1085: FMOVL	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xb5a50840  ! 1090: FADDd	faddd	%f20, %f0, %f26
	.word 0xbda00040  ! 1091: FMOVd	fmovd	%f0, %f30
	.word 0xb1a48920  ! 1093: FMULs	fmuls	%f18, %f0, %f24
	.word 0xbf518000  ! 1095: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xbfa4c920  ! 1098: FMULs	fmuls	%f19, %f0, %f31
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba408e0  ! 1103: FSUBq	dis not found

	.word 0xb9a80c20  ! 1104: FMOVRLZ	dis not found

	.word 0xbfa4c960  ! 1105: FMULq	dis not found

	.word 0xb7a489a0  ! 1107: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb5a00540  ! 1108: FSQRTd	fsqrt	
	.word 0xbfa00540  ! 1112: FSQRTd	fsqrt	
	.word 0xbba40960  ! 1116: FMULq	dis not found

	setx	0x10d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0xb1a50920  ! 1120: FMULs	fmuls	%f20, %f0, %f24
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a588e0  ! 1125: FSUBq	dis not found

	.word 0xb3518000  ! 1126: RDPR_PSTATE	<illegal instruction>
	.word 0xbba8c820  ! 1129: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a88820  ! 1131: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00520  ! 1133: FSQRTs	fsqrt	
	.word 0xb7a5c840  ! 1140: FADDd	faddd	%f54, %f0, %f58
	.word 0xb9a80820  ! 1145: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	setx	0x1032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 1149: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbb540000  ! 1151: RDPR_GL	<illegal instruction>
	.word 0xb5aac820  ! 1153: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x91956108  ! 1154: WRPR_PIL_I	wrpr	%r21, 0x0108, %pil
	setx	0x31e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bca12a  ! 1156: XNORcc_I	xnorcc 	%r18, 0x012a, %r26
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 1158: MOVcc_I	<illegal instruction>
	.word 0xbfaa4820  ! 1159: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80c20  ! 1160: FMOVRLZ	dis not found

	.word 0xb3a508a0  ! 1165: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xbba48860  ! 1167: FADDq	dis not found

	.word 0xb81d608a  ! 1168: XOR_I	xor 	%r21, 0x008a, %r28
	.word 0x8194e110  ! 1170: WRPR_TPC_I	wrpr	%r19, 0x0110, %tpc
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ad0000  ! 1174: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xb1a80820  ! 1186: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3a44920  ! 1190: FMULs	fmuls	%f17, %f0, %f25
	setx	0x20311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda50820  ! 1196: FADDs	fadds	%f20, %f0, %f30
	.word 0x9194e174  ! 1198: WRPR_PIL_I	wrpr	%r19, 0x0174, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 1199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xb3a508c0  ! 1200: FSUBd	fsubd	%f20, %f0, %f56
	setx	data_start_4, %g1, %r20
	.word 0xb150c000  ! 1203: RDPR_TT	<illegal instruction>
	.word 0xbfa408a0  ! 1208: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbda00520  ! 1209: FSQRTs	fsqrt	
	.word 0xb5aac820  ! 1212: FMOVGE	fmovs	%fcc1, %f0, %f26
	setx	data_start_6, %g1, %r21
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 1218: FSQRTq	fsqrt	
	setx	0x20005, %g1, %o0
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
	.word 0xb3a54960  ! 1224: FMULq	dis not found

	.word 0xb7508000  ! 1231: RDPR_TSTATE	<illegal instruction>
	.word 0xbba54820  ! 1234: FADDs	fadds	%f21, %f0, %f29
	.word 0xbfa90820  ! 1236: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbf35c000  ! 1237: SRL_R	srl 	%r23, %r0, %r31
	.word 0xbba80820  ! 1239: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80820  ! 1240: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0x89956162  ! 1242: WRPR_TICK_I	wrpr	%r21, 0x0162, %tick
	.word 0xb5a4c8e0  ! 1245: FSUBq	dis not found

	.word 0xb61521fb  ! 1246: OR_I	or 	%r20, 0x01fb, %r27
	.word 0xb7508000  ! 1249: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xb3504000  ! 1255: RDPR_TNPC	<illegal instruction>
	.word 0xb1a00020  ! 1260: FMOVs	fmovs	%f0, %f24
	.word 0xb5a81420  ! 1263: FMOVRNZ	dis not found

	.word 0xba94a16c  ! 1265: ORcc_I	orcc 	%r18, 0x016c, %r29
	.word 0xbfa5c820  ! 1266: FADDs	fadds	%f23, %f0, %f31
	.word 0xb1abc820  ! 1270: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb2458000  ! 1272: ADDC_R	addc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 1277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0xbfa84820  ! 1282: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c940  ! 1284: FMULd	fmuld	%f50, %f0, %f62
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0x8794a1c0  ! 1292: WRPR_TT_I	wrpr	%r18, 0x01c0, %tt
	.word 0xbda80820  ! 1295: FMOVN	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0x8f932000  ! 1299: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r23
	.word 0xb3a48940  ! 1302: FMULd	fmuld	%f18, %f0, %f56
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 1307: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a8c820  ! 1309: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a509a0  ! 1311: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xb7a5c8a0  ! 1312: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xb3a88820  ! 1316: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa90820  ! 1317: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbb508000  ! 1320: RDPR_TSTATE	<illegal instruction>
	.word 0xba84e09e  ! 1323: ADDcc_I	addcc 	%r19, 0x009e, %r29
	.word 0xb5a58860  ! 1326: FADDq	dis not found

	.word 0xbfa4c960  ! 1328: FMULq	dis not found

	.word 0xb7aa0820  ! 1329: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9508000  ! 1330: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a48820  ! 1334: FADDs	fadds	%f18, %f0, %f27
	.word 0xb4ac4000  ! 1336: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xb1a4c9a0  ! 1337: FDIVs	fdivs	%f19, %f0, %f24
	.word 0x83942140  ! 1338: WRPR_TNPC_I	wrpr	%r16, 0x0140, %tnpc
	.word 0xb7a81c20  ! 1340: FMOVRGEZ	dis not found

	.word 0xb1510000  ! 1342: RDPR_TICK	rdpr	%tick, %r24
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6148000  ! 1347: OR_R	or 	%r18, %r0, %r27
	.word 0xbba588c0  ! 1348: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xbba80c20  ! 1350: FMOVRLZ	dis not found

	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 1359: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a5c9e0  ! 1361: FDIVq	dis not found

	setx	data_start_7, %g1, %r21
	.word 0xb3504000  ! 1368: RDPR_TNPC	<illegal instruction>
	.word 0xb3a90820  ! 1370: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbbab8820  ! 1371: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a88820  ! 1372: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00540  ! 1373: FSQRTd	fsqrt	
	.word 0xb3a4c9e0  ! 1374: FDIVq	dis not found

	.word 0x8794a014  ! 1375: WRPR_TT_I	wrpr	%r18, 0x0014, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80820  ! 1381: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbbab4820  ! 1383: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0x8795a021  ! 1386: WRPR_TT_I	wrpr	%r22, 0x0021, %tt
	.word 0xb7a44940  ! 1388: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb93d6001  ! 1391: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xb535c000  ! 1392: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb1a488e0  ! 1393: FSUBq	dis not found

	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 1397: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r19
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1413: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3a50960  ! 1414: FMULq	dis not found

	setx	0x3, %g1, %o0
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
	.word 0x8794612f  ! 1423: WRPR_TT_I	wrpr	%r17, 0x012f, %tt
	.word 0x919560f6  ! 1426: WRPR_PIL_I	wrpr	%r21, 0x00f6, %pil
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48940  ! 1429: FMULd	fmuld	%f18, %f0, %f28
	.word 0xbbaa0820  ! 1431: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0x8194e0f3  ! 1435: WRPR_TPC_I	wrpr	%r19, 0x00f3, %tpc
	.word 0x8d95a0d6  ! 1437: WRPR_PSTATE_I	wrpr	%r22, 0x00d6, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d51  ! 1438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 1440: RDPR_TNPC	<illegal instruction>
	.word 0xb7a5c8a0  ! 1441: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xbf520000  ! 1442: RDPR_PIL	<illegal instruction>
	.word 0xb5a98820  ! 1444: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfabc820  ! 1445: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbf51c000  ! 1446: RDPR_TL	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0x87942116  ! 1450: WRPR_TT_I	wrpr	%r16, 0x0116, %tt
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 1452: RDPR_TT	<illegal instruction>
	.word 0xb1a00520  ! 1453: FSQRTs	fsqrt	
	setx	0x2011f, %g1, %o0
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
	.word 0xb0c4c000  ! 1460: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb1a4c860  ! 1461: FADDq	dis not found

	.word 0xb8340000  ! 1462: ORN_R	orn 	%r16, %r0, %r28
	.word 0xb3a449c0  ! 1464: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb29ce0a8  ! 1465: XORcc_I	xorcc 	%r19, 0x00a8, %r25
	.word 0xb7504000  ! 1469: RDPR_TNPC	<illegal instruction>
	.word 0x8794618c  ! 1474: WRPR_TT_I	wrpr	%r17, 0x018c, %tt
	.word 0xb3a509a0  ! 1475: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb7520000  ! 1478: RDPR_PIL	<illegal instruction>
	.word 0xb7504000  ! 1480: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 1482: RDPR_TPC	<illegal instruction>
	.word 0xb485a14a  ! 1485: ADDcc_I	addcc 	%r22, 0x014a, %r26
	.word 0xb1a449a0  ! 1487: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xbc144000  ! 1488: OR_R	or 	%r17, %r0, %r30
	.word 0xb5a94820  ! 1489: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbec52134  ! 1494: ADDCcc_I	addccc 	%r20, 0x0134, %r31
	.word 0xb5a80820  ! 1500: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a50820  ! 1501: FADDs	fadds	%f20, %f0, %f25
	.word 0xbfaa4820  ! 1504: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00020  ! 1506: FMOVs	fmovs	%f0, %f28
	.word 0xbb51c000  ! 1507: RDPR_TL	<illegal instruction>
	.word 0xb1aa0820  ! 1511: FMOVA	fmovs	%fcc1, %f0, %f24
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 1521: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1abc820  ! 1530: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3aac820  ! 1531: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 1533: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x91946105  ! 1534: WRPR_PIL_I	wrpr	%r17, 0x0105, %pil
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 1536: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1540: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7aa0820  ! 1543: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 1544: FSQRTs	fsqrt	
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba44840  ! 1557: FADDd	faddd	%f48, %f0, %f60
	.word 0x81956180  ! 1558: WRPR_TPC_I	wrpr	%r21, 0x0180, %tpc
	.word 0xbda00540  ! 1559: FSQRTd	fsqrt	
	.word 0xb7ab0820  ! 1561: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb6bd20c2  ! 1563: XNORcc_I	xnorcc 	%r20, 0x00c2, %r27
	.word 0xbd510000  ! 1565: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r19
	.word 0xbda549a0  ! 1569: FDIVs	fdivs	%f21, %f0, %f30
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 1573: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab0820  ! 1575: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb6b4a13c  ! 1581: ORNcc_I	orncc 	%r18, 0x013c, %r27
	.word 0xbba5c9c0  ! 1587: FDIVd	fdivd	%f54, %f0, %f60
	setx	0x30135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e06d  ! 1598: WRPR_TT_I	wrpr	%r19, 0x006d, %tt
	setx	data_start_5, %g1, %r21
	.word 0xb750c000  ! 1607: RDPR_TT	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 1611: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a81820  ! 1615: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a81c20  ! 1623: FMOVRGEZ	dis not found

	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2d601b  ! 1627: ANDN_I	andn 	%r21, 0x001b, %r31
	.word 0x9195204f  ! 1628: WRPR_PIL_I	wrpr	%r20, 0x004f, %pil
	.word 0xb295a068  ! 1629: ORcc_I	orcc 	%r22, 0x0068, %r25
	ta	T_CHANGE_HPRIV
	.word 0x8198398b  ! 1631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
	.word 0xb6bd8000  ! 1633: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xb7a81820  ! 1634: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa589c0  ! 1639: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb5a44840  ! 1641: FADDd	faddd	%f48, %f0, %f26
	.word 0xbbaac820  ! 1642: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a18c  ! 1645: WRPR_PSTATE_I	wrpr	%r18, 0x018c, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982999  ! 1650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	setx	data_start_5, %g1, %r23
	.word 0xb5510000  ! 1653: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r20
	.word 0xb33c6001  ! 1656: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xb3a40960  ! 1657: FMULq	dis not found

	.word 0xba342058  ! 1658: ORN_I	orn 	%r16, 0x0058, %r29
	.word 0xb634c000  ! 1660: SUBC_R	orn 	%r19, %r0, %r27
	.word 0xb5abc820  ! 1661: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a488e0  ! 1662: FSUBq	dis not found

	.word 0xbda94820  ! 1664: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbf500000  ! 1665: RDPR_TPC	<illegal instruction>
	.word 0xb3abc820  ! 1666: FMOVVC	fmovs	%fcc1, %f0, %f25
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 1669: FMOVRNZ	dis not found

	.word 0xbba448a0  ! 1670: FSUBs	fsubs	%f17, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r14
	.word 0xa193a000  ! 1672: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb351c000  ! 1676: RDPR_TL	<illegal instruction>
	.word 0xb5a5c8e0  ! 1678: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	.word 0x8595a161  ! 1682: WRPR_TSTATE_I	wrpr	%r22, 0x0161, %tstate
	.word 0xb7a50960  ! 1683: FMULq	dis not found

	.word 0xbba4c860  ! 1686: FADDq	dis not found

	.word 0xb6b420c8  ! 1691: SUBCcc_I	orncc 	%r16, 0x00c8, %r27
	.word 0xbbab8820  ! 1696: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00560  ! 1697: FSQRTq	fsqrt	
	.word 0xb9a588e0  ! 1703: FSUBq	dis not found

	setx	data_start_7, %g1, %r17
	.word 0xbfa94820  ! 1707: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbb500000  ! 1710: RDPR_TPC	<illegal instruction>
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 1715: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a5c8a0  ! 1718: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb5ab4820  ! 1719: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb1abc820  ! 1720: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80c20  ! 1725: FMOVRLZ	dis not found

	.word 0xb2bde01e  ! 1728: XNORcc_I	xnorcc 	%r23, 0x001e, %r25
	.word 0xbfa81820  ! 1730: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	mov	2, %r12
	.word 0x8f932000  ! 1734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8995e1ff  ! 1736: WRPR_TICK_I	wrpr	%r23, 0x01ff, %tick
	.word 0xb3aa4820  ! 1737: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbda449c0  ! 1744: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb1a40820  ! 1745: FADDs	fadds	%f16, %f0, %f24
	.word 0xbda58920  ! 1746: FMULs	fmuls	%f22, %f0, %f30
	.word 0xbda00040  ! 1747: FMOVd	fmovd	%f0, %f30
	.word 0xb1a00540  ! 1748: FSQRTd	fsqrt	
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 1759: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3510000  ! 1760: RDPR_TICK	<illegal instruction>
	.word 0xb8342195  ! 1761: SUBC_I	orn 	%r16, 0x0195, %r28
	.word 0xb5a409c0  ! 1769: FDIVd	fdivd	%f16, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 1775: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda48940  ! 1778: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb3a488c0  ! 1781: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb3a4c820  ! 1782: FADDs	fadds	%f19, %f0, %f25
	.word 0xb9a9c820  ! 1784: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 1787: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb09d60a7  ! 1789: XORcc_I	xorcc 	%r21, 0x00a7, %r24
	.word 0x8d94e197  ! 1793: WRPR_PSTATE_I	wrpr	%r19, 0x0197, %pstate
	.word 0xbba88820  ! 1797: FMOVLE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6150000  ! 1807: OR_R	or 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 1810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0xbf50c000  ! 1814: RDPR_TT	<illegal instruction>
	.word 0xbba81c20  ! 1816: FMOVRGEZ	dis not found

	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43c0000  ! 1821: XNOR_R	xnor 	%r16, %r0, %r26
	.word 0xbda00520  ! 1826: FSQRTs	fsqrt	
	.word 0xb5ab4820  ! 1828: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a4c960  ! 1829: FMULq	dis not found

	.word 0xb9aac820  ! 1832: FMOVGE	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r22
	.word 0xb9a84820  ! 1834: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a589a0  ! 1836: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xbd520000  ! 1837: RDPR_PIL	<illegal instruction>
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946125  ! 1840: WRPR_PIL_I	wrpr	%r17, 0x0125, %pil
	.word 0xb1a00540  ! 1841: FSQRTd	fsqrt	
	.word 0xb9a81820  ! 1849: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbfa44960  ! 1851: FMULq	dis not found

	.word 0xbba00560  ! 1859: FSQRTq	fsqrt	
	.word 0xb9508000  ! 1861: RDPR_TSTATE	<illegal instruction>
	.word 0xb01d4000  ! 1863: XOR_R	xor 	%r21, %r0, %r24
	.word 0xb72d5000  ! 1864: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xbfa9c820  ! 1866: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba88820  ! 1867: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbd518000  ! 1870: RDPR_PSTATE	<illegal instruction>
	.word 0xb1aa0820  ! 1874: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbbaac820  ! 1875: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956193  ! 1881: WRPR_TNPC_I	wrpr	%r21, 0x0193, %tnpc
	.word 0xb9a408a0  ! 1882: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb7504000  ! 1883: RDPR_TNPC	<illegal instruction>
	.word 0x81946098  ! 1886: WRPR_TPC_I	wrpr	%r17, 0x0098, %tpc
	.word 0xbe2ca1bd  ! 1887: ANDN_I	andn 	%r18, 0x01bd, %r31
	.word 0xbfa81820  ! 1890: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbba00020  ! 1893: FMOVs	fmovs	%f0, %f29
	.word 0xb7a588e0  ! 1895: FSUBq	dis not found

	.word 0xb1a8c820  ! 1897: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7abc820  ! 1899: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a449c0  ! 1900: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xbd504000  ! 1902: RDPR_TNPC	<illegal instruction>
	.word 0xbba4c940  ! 1904: FMULd	fmuld	%f50, %f0, %f60
	.word 0xb950c000  ! 1906: RDPR_TT	<illegal instruction>
	.word 0x8995219a  ! 1908: WRPR_TICK_I	wrpr	%r20, 0x019a, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1909: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a449e0  ! 1914: FDIVq	dis not found

	.word 0xb40dc000  ! 1918: AND_R	and 	%r23, %r0, %r26
	.word 0xb1a489e0  ! 1926: FDIVq	dis not found

	.word 0xbda548a0  ! 1928: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbda90820  ! 1930: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd504000  ! 1937: RDPR_TNPC	<illegal instruction>
	.word 0xb5a48940  ! 1938: FMULd	fmuld	%f18, %f0, %f26
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a50960  ! 1949: FMULq	dis not found

	.word 0xb3a00020  ! 1951: FMOVs	fmovs	%f0, %f25
	.word 0xbb500000  ! 1952: RDPR_TPC	<illegal instruction>
	.word 0xb1a98820  ! 1954: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0x8995e010  ! 1955: WRPR_TICK_I	wrpr	%r23, 0x0010, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983f01  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f01, %hpstate
	.word 0xb3a80420  ! 1960: FMOVRZ	dis not found

	.word 0xb7a88820  ! 1964: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0x9195e0a7  ! 1966: WRPR_PIL_I	wrpr	%r23, 0x00a7, %pil
	.word 0xbdab8820  ! 1976: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbdab8820  ! 1977: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00520  ! 1978: FSQRTs	fsqrt	
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2da09e  ! 1981: ANDN_I	andn 	%r22, 0x009e, %r29
	.word 0xbba9c820  ! 1982: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a8c820  ! 1984: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 1989: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa4820  ! 1990: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48940  ! 1994: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb7aac820  ! 1996: FMOVGE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 2000: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a58960  ! 2001: FMULq	dis not found

	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e10d  ! 2007: WRPR_PSTATE_I	wrpr	%r23, 0x010d, %pstate
	.word 0xb5a00540  ! 2008: FSQRTd	fsqrt	
	.word 0x83956088  ! 2009: WRPR_TNPC_I	wrpr	%r21, 0x0088, %tnpc
	.word 0xb5a44940  ! 2010: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb9510000  ! 2011: RDPR_TICK	<illegal instruction>
	.word 0xbdab8820  ! 2013: FMOVPOS	fmovs	%fcc1, %f0, %f30
	mov	1, %r14
	.word 0xa193a000  ! 2014: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a5c820  ! 2015: FADDs	fadds	%f23, %f0, %f26
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 2017: FMOVRNZ	dis not found

	.word 0xbda80c20  ! 2019: FMOVRLZ	dis not found

	.word 0xb9508000  ! 2020: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb7aa4820  ! 2026: FMOVNE	fmovs	%fcc1, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 2027: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xba45c000  ! 2028: ADDC_R	addc 	%r23, %r0, %r29
	.word 0xb7510000  ! 2029: RDPR_TICK	<illegal instruction>
	.word 0xb73c9000  ! 2030: SRAX_R	srax	%r18, %r0, %r27
	.word 0xbbab8820  ! 2035: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8195a167  ! 2036: WRPR_TPC_I	wrpr	%r22, 0x0167, %tpc
	.word 0xb9a80820  ! 2040: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	setx	data_start_7, %g1, %r22
	.word 0xb7a8c820  ! 2046: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbdaac820  ! 2049: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a48940  ! 2050: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb7a00040  ! 2053: FMOVd	fmovd	%f0, %f58
	.word 0xb7a9c820  ! 2054: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7480000  ! 2059: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba50960  ! 2060: FMULq	dis not found

	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc350000  ! 2066: ORN_R	orn 	%r20, %r0, %r30
	.word 0xb3a5c960  ! 2069: FMULq	dis not found

	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 2073: FMOVd	fmovd	%f0, %f30
	.word 0xbd518000  ! 2077: RDPR_PSTATE	<illegal instruction>
	.word 0xbbaa0820  ! 2082: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3480000  ! 2084: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb845609a  ! 2085: ADDC_I	addc 	%r21, 0x009a, %r28
	.word 0xb3a4c9a0  ! 2086: FDIVs	fdivs	%f19, %f0, %f25
	.word 0x8395a06b  ! 2089: WRPR_TNPC_I	wrpr	%r22, 0x006b, %tnpc
	.word 0xbba588a0  ! 2092: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xbf540000  ! 2100: RDPR_GL	<illegal instruction>
	.word 0xb750c000  ! 2101: RDPR_TT	<illegal instruction>
	.word 0xb42c8000  ! 2107: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xbb2d3001  ! 2109: SLLX_I	sllx	%r20, 0x0001, %r29
	.word 0xb7a549c0  ! 2112: FDIVd	fdivd	%f52, %f0, %f58
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 2114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	.word 0xb4b46001  ! 2115: SUBCcc_I	orncc 	%r17, 0x0001, %r26
	.word 0xbf480000  ! 2116: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3480000  ! 2129: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0056058  ! 2132: ADD_I	add 	%r21, 0x0058, %r24
	.word 0xbda90820  ! 2136: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a4c820  ! 2139: FADDs	fadds	%f19, %f0, %f24
	.word 0xbfa80820  ! 2140: FMOVN	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982909  ! 2144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0909, %hpstate
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952073  ! 2147: WRPR_TPC_I	wrpr	%r20, 0x0073, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982919  ! 2148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	.word 0xbf504000  ! 2149: RDPR_TNPC	<illegal instruction>
	setx	0x3032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48920  ! 2157: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb1a489e0  ! 2160: FDIVq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 2161: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595605e  ! 2166: WRPR_TSTATE_I	wrpr	%r21, 0x005e, %tstate
	.word 0xb3a00560  ! 2169: FSQRTq	fsqrt	
	.word 0xb3a80c20  ! 2172: FMOVRLZ	dis not found

	.word 0xbb500000  ! 2174: RDPR_TPC	<illegal instruction>
	.word 0xbda48860  ! 2176: FADDq	dis not found

	.word 0xb7a4c920  ! 2180: FMULs	fmuls	%f19, %f0, %f27
	.word 0x9194a02b  ! 2182: WRPR_PIL_I	wrpr	%r18, 0x002b, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982b8b  ! 2183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	.word 0xb9a4c940  ! 2188: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb5a589a0  ! 2190: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xb7a588a0  ! 2194: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb01da018  ! 2197: XOR_I	xor 	%r22, 0x0018, %r24
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 2203: RDPR_GL	<illegal instruction>
	.word 0xb5a80420  ! 2204: FMOVRZ	dis not found

	.word 0xbd500000  ! 2205: RDPR_TPC	<illegal instruction>
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6a5a1e5  ! 2214: SUBcc_I	subcc 	%r22, 0x01e5, %r27
	.word 0xb9a40820  ! 2215: FADDs	fadds	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983e03  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e03, %hpstate
	.word 0x8594e0b0  ! 2222: WRPR_TSTATE_I	wrpr	%r19, 0x00b0, %tstate
	.word 0xbfa98820  ! 2223: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb9abc820  ! 2227: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0x8995e1f1  ! 2228: WRPR_TICK_I	wrpr	%r23, 0x01f1, %tick
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 2233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	.word 0xbfa88820  ! 2234: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a548c0  ! 2237: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xb3480000  ! 2238: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb508000  ! 2240: RDPR_TSTATE	<illegal instruction>
	.word 0x9194e031  ! 2241: WRPR_PIL_I	wrpr	%r19, 0x0031, %pil
	.word 0xb7480000  ! 2242: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 2244: RDPR_PIL	<illegal instruction>
	.word 0xbfa90820  ! 2245: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbda4c8a0  ! 2249: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb5a54960  ! 2250: FMULq	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 2251: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda448e0  ! 2255: FSUBq	dis not found

	.word 0xb3520000  ! 2259: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 2266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	.word 0xb5a409e0  ! 2267: FDIVq	dis not found

	.word 0xb5480000  ! 2268: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb8acc000  ! 2269: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xb7520000  ! 2270: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 2271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xbfa00540  ! 2272: FSQRTd	fsqrt	
	.word 0xb551c000  ! 2275: RDPR_TL	<illegal instruction>
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a0c0  ! 2279: WRPR_PSTATE_I	wrpr	%r22, 0x00c0, %pstate
	.word 0xbb643801  ! 2280: MOVcc_I	<illegal instruction>
	.word 0xb3a98820  ! 2282: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x22b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 2284: FMOVLE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983a59  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a59, %hpstate
	.word 0x87942047  ! 2287: WRPR_TT_I	wrpr	%r16, 0x0047, %tt
	.word 0xb0344000  ! 2288: ORN_R	orn 	%r17, %r0, %r24
	.word 0xbfab0820  ! 2293: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab8820  ! 2294: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c8e0  ! 2295: FSUBq	dis not found

	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	.word 0xbca44000  ! 2301: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xbfa4c920  ! 2302: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb9510000  ! 2305: RDPR_TICK	<illegal instruction>
	.word 0xbfa5c8e0  ! 2306: FSUBq	dis not found

	.word 0xb1a8c820  ! 2307: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb3a44940  ! 2309: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb7a409a0  ! 2315: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb5a94820  ! 2318: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a508a0  ! 2319: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xbb51c000  ! 2321: RDPR_TL	<illegal instruction>
	.word 0xbda00560  ! 2322: FSQRTq	fsqrt	
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb5e1a7  ! 2333: ORNcc_I	orncc 	%r23, 0x01a7, %r31
	.word 0xb1a54840  ! 2336: FADDd	faddd	%f52, %f0, %f24
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 2340: FMOVs	fmovs	%f0, %f31
	.word 0xb1a80820  ! 2344: FMOVN	fmovs	%fcc1, %f0, %f24
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 2349: FADDd	faddd	%f18, %f0, %f56
	.word 0xb3a588c0  ! 2350: FSUBd	fsubd	%f22, %f0, %f56
	mov	0, %r12
	.word 0x8f932000  ! 2352: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2354: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x81956008  ! 2357: WRPR_TPC_I	wrpr	%r21, 0x0008, %tpc
	.word 0xb7a94820  ! 2364: FMOVCS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595e0bf  ! 2368: WRPR_TSTATE_I	wrpr	%r23, 0x00bf, %tstate
	.word 0xb1500000  ! 2372: RDPR_TPC	<illegal instruction>
	.word 0x8394e061  ! 2373: WRPR_TNPC_I	wrpr	%r19, 0x0061, %tnpc
	.word 0xb9a81420  ! 2374: FMOVRNZ	dis not found

	.word 0xbb2da001  ! 2377: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xb92c9000  ! 2378: SLLX_R	sllx	%r18, %r0, %r28
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 2380: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda80c20  ! 2381: FMOVRLZ	dis not found

	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9358000  ! 2386: SRL_R	srl 	%r22, %r0, %r28
	.word 0xb9504000  ! 2387: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb03dc000  ! 2388: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xbda50840  ! 2389: FADDd	faddd	%f20, %f0, %f30
	.word 0xbba58920  ! 2391: FMULs	fmuls	%f22, %f0, %f29
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 2396: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa588e0  ! 2400: FSUBq	dis not found

	.word 0xbb2d9000  ! 2401: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xbdaa0820  ! 2403: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb60c4000  ! 2406: AND_R	and 	%r17, %r0, %r27
	.word 0xb7ab0820  ! 2410: FMOVGU	fmovs	%fcc1, %f0, %f27
	setx	data_start_7, %g1, %r18
	.word 0x8995603b  ! 2415: WRPR_TICK_I	wrpr	%r21, 0x003b, %tick
	.word 0xb9aa0820  ! 2416: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0x8795e018  ! 2417: WRPR_TT_I	wrpr	%r23, 0x0018, %tt
	.word 0xb3a9c820  ! 2418: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbc9ce025  ! 2419: XORcc_I	xorcc 	%r19, 0x0025, %r30
	.word 0xb9a9c820  ! 2421: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x2012a, %g1, %o0
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
	.word 0xb5a4c8a0  ! 2427: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb151c000  ! 2428: RDPR_TL	<illegal instruction>
	.word 0xb7504000  ! 2429: RDPR_TNPC	<illegal instruction>
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xbeb44000  ! 2439: ORNcc_R	orncc 	%r17, %r0, %r31
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 2447: RDPR_TICK	<illegal instruction>
	.word 0xb7a81420  ! 2448: FMOVRNZ	dis not found

	.word 0xbf2cb001  ! 2449: SLLX_I	sllx	%r18, 0x0001, %r31
	.word 0xbfa509c0  ! 2450: FDIVd	fdivd	%f20, %f0, %f62
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 2455: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbba94820  ! 2458: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2946112  ! 2464: ORcc_I	orcc 	%r17, 0x0112, %r25
	.word 0xb3a448e0  ! 2469: FSUBq	dis not found

	.word 0xb1504000  ! 2472: RDPR_TNPC	<illegal instruction>
	.word 0x8595a1d4  ! 2477: WRPR_TSTATE_I	wrpr	%r22, 0x01d4, %tstate
	.word 0xbfa54860  ! 2481: FADDq	dis not found

	.word 0xb1a98820  ! 2485: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0x8d94205e  ! 2487: WRPR_PSTATE_I	wrpr	%r16, 0x005e, %pstate
	.word 0xb9348000  ! 2490: SRL_R	srl 	%r18, %r0, %r28
	.word 0xb235e189  ! 2491: SUBC_I	orn 	%r23, 0x0189, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba1c4000  ! 2494: XOR_R	xor 	%r17, %r0, %r29
	.word 0xb4a54000  ! 2495: SUBcc_R	subcc 	%r21, %r0, %r26
	.word 0xb1a4c960  ! 2497: FMULq	dis not found

	.word 0xb5a00520  ! 2498: FSQRTs	fsqrt	
	.word 0xbdaa8820  ! 2499: FMOVG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda48860  ! 2511: FADDq	dis not found

	.word 0xb7a4c820  ! 2513: FADDs	fadds	%f19, %f0, %f27
	.word 0xbfa5c840  ! 2516: FADDd	faddd	%f54, %f0, %f62
	setx	0x31b, %g1, %o0
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
	.word 0xb8a4610b  ! 2530: SUBcc_I	subcc 	%r17, 0x010b, %r28
	.word 0xb1a80820  ! 2533: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb1a48820  ! 2535: FADDs	fadds	%f18, %f0, %f24
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c8a0  ! 2539: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb1a00540  ! 2541: FSQRTd	fsqrt	
	.word 0xb5a58860  ! 2547: FADDq	dis not found

	.word 0xbe2ce055  ! 2548: ANDN_I	andn 	%r19, 0x0055, %r31
	.word 0xbfa40860  ! 2550: FADDq	dis not found

	.word 0xb3508000  ! 2551: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a508a0  ! 2552: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbda80420  ! 2554: FMOVRZ	dis not found

	.word 0xb3480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb2246102  ! 2560: SUB_I	sub 	%r17, 0x0102, %r25
	.word 0xbe1dc000  ! 2561: XOR_R	xor 	%r23, %r0, %r31
	.word 0xbd50c000  ! 2569: RDPR_TT	<illegal instruction>
	.word 0xbf2da001  ! 2572: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xb7a449e0  ! 2573: FDIVq	dis not found

	.word 0xb7a00020  ! 2574: FMOVs	fmovs	%f0, %f27
	.word 0xbdaa0820  ! 2577: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 2590: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 2598: FSQRTs	fsqrt	
	.word 0xbba00540  ! 2599: FSQRTd	fsqrt	
	.word 0xb9a5c960  ! 2602: FMULq	dis not found

	.word 0x879521be  ! 2604: WRPR_TT_I	wrpr	%r20, 0x01be, %tt
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 2607: RDPR_TICK	<illegal instruction>
	.word 0xb7a50840  ! 2608: FADDd	faddd	%f20, %f0, %f58
	.word 0x8194e07e  ! 2609: WRPR_TPC_I	wrpr	%r19, 0x007e, %tpc
	.word 0xb1a80820  ! 2610: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0x8995e147  ! 2611: WRPR_TICK_I	wrpr	%r23, 0x0147, %tick
	.word 0x8595611f  ! 2614: WRPR_TSTATE_I	wrpr	%r21, 0x011f, %tstate
	.word 0x81956190  ! 2617: WRPR_TPC_I	wrpr	%r21, 0x0190, %tpc
	.word 0xb3a50920  ! 2618: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb5a4c860  ! 2619: FADDq	dis not found

	.word 0xb7a40960  ! 2623: FMULq	dis not found

	.word 0xbd540000  ! 2629: RDPR_GL	<illegal instruction>
	.word 0x8194a146  ! 2631: WRPR_TPC_I	wrpr	%r18, 0x0146, %tpc
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 2637: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x9194a07a  ! 2642: WRPR_PIL_I	wrpr	%r18, 0x007a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982e89  ! 2643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e89, %hpstate
	.word 0x879420e5  ! 2644: WRPR_TT_I	wrpr	%r16, 0x00e5, %tt
	.word 0xbfa80820  ! 2645: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb8046187  ! 2646: ADD_I	add 	%r17, 0x0187, %r28
	.word 0xb9a88820  ! 2647: FMOVLE	fmovs	%fcc1, %f0, %f28
	mov	2, %r14
	.word 0xa193a000  ! 2648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda90820  ! 2649: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd7d6401  ! 2654: MOVR_I	movre	%r21, 0x1, %r30
	setx	data_start_4, %g1, %r17
	.word 0xbfa00040  ! 2660: FMOVd	fmovd	%f0, %f62
	.word 0xbf510000  ! 2662: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xb1510000  ! 2667: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2669: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1508000  ! 2673: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb5540000  ! 2675: RDPR_GL	<illegal instruction>
	.word 0x8795e1c2  ! 2676: WRPR_TT_I	wrpr	%r23, 0x01c2, %tt
	.word 0xb3aa8820  ! 2678: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a40940  ! 2680: FMULd	fmuld	%f16, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 2683: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa80820  ! 2684: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb2ac0000  ! 2689: ANDNcc_R	andncc 	%r16, %r0, %r25
	.word 0xbfa8c820  ! 2691: FMOVL	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 2693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0xbd518000  ! 2694: RDPR_PSTATE	<illegal instruction>
	.word 0x8594a097  ! 2695: WRPR_TSTATE_I	wrpr	%r18, 0x0097, %tstate
	.word 0xbd51c000  ! 2697: RDPR_TL	<illegal instruction>
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 2699: RDPR_GL	<illegal instruction>
	.word 0xbb500000  ! 2702: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x919561d0  ! 2706: WRPR_PIL_I	wrpr	%r21, 0x01d0, %pil
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 2711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	setx	data_start_1, %g1, %r20
	.word 0xb9a50860  ! 2714: FADDq	dis not found

	.word 0xb5a88820  ! 2715: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb1508000  ! 2721: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e150  ! 2723: WRPR_TSTATE_I	wrpr	%r19, 0x0150, %tstate
	.word 0xbfa50820  ! 2728: FADDs	fadds	%f20, %f0, %f31
	.word 0xb5a588e0  ! 2730: FSUBq	dis not found

	.word 0x89952156  ! 2732: WRPR_TICK_I	wrpr	%r20, 0x0156, %tick
	.word 0x81952074  ! 2733: WRPR_TPC_I	wrpr	%r20, 0x0074, %tpc
	.word 0xbba48940  ! 2734: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb12ca001  ! 2736: SLL_I	sll 	%r18, 0x0001, %r24
	.word 0xb9540000  ! 2737: RDPR_GL	<illegal instruction>
	.word 0xb5a5c9a0  ! 2738: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb1a88820  ! 2740: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbda588e0  ! 2742: FSUBq	dis not found

	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2748: FMOVRZ	dis not found

	.word 0xb9a94820  ! 2749: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00020  ! 2750: FMOVs	fmovs	%f0, %f26
	.word 0xb551c000  ! 2751: RDPR_TL	<illegal instruction>
	.word 0xb5a588e0  ! 2752: FSUBq	dis not found

	.word 0xbb510000  ! 2754: RDPR_TICK	<illegal instruction>
	.word 0xbfa4c840  ! 2755: FADDd	faddd	%f50, %f0, %f62
	.word 0xbba489e0  ! 2756: FDIVq	dis not found

	setx	0x13a, %g1, %o0
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
	.word 0xbc95c000  ! 2760: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xb751c000  ! 2761: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xb2342049  ! 2768: ORN_I	orn 	%r16, 0x0049, %r25
	.word 0xb1480000  ! 2773: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 2775: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbba50960  ! 2781: FMULq	dis not found

	.word 0xbfa9c820  ! 2782: FMOVVS	fmovs	%fcc1, %f0, %f31
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 2788: RDPR_TICK	<illegal instruction>
	.word 0xb7a409e0  ! 2789: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983889  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1889, %hpstate
	.word 0xb5510000  ! 2792: RDPR_TICK	<illegal instruction>
	.word 0xb7a8c820  ! 2793: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb1a589a0  ! 2795: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xb3a00540  ! 2797: FSQRTd	fsqrt	
	.word 0xb5ab8820  ! 2798: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb4056084  ! 2801: ADD_I	add 	%r21, 0x0084, %r26
	.word 0xbba8c820  ! 2803: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81420  ! 2811: FMOVRNZ	dis not found

	.word 0xbda5c860  ! 2812: FADDq	dis not found

	.word 0x8795e10d  ! 2814: WRPR_TT_I	wrpr	%r23, 0x010d, %tt
	.word 0x89956166  ! 2815: WRPR_TICK_I	wrpr	%r21, 0x0166, %tick
	.word 0xb5a409c0  ! 2816: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xb7a00520  ! 2817: FSQRTs	fsqrt	
	setx	data_start_0, %g1, %r23
	.word 0xb7a549e0  ! 2822: FDIVq	dis not found

	.word 0xb5a54940  ! 2824: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb29ce0ad  ! 2827: XORcc_I	xorcc 	%r19, 0x00ad, %r25
	.word 0xbba448c0  ! 2828: FSUBd	fsubd	%f48, %f0, %f60
	.word 0x91952098  ! 2835: WRPR_PIL_I	wrpr	%r20, 0x0098, %pil
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c860  ! 2843: FADDq	dis not found

	.word 0xbda81820  ! 2846: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5a80820  ! 2848: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x8994a160  ! 2852: WRPR_TICK_I	wrpr	%r18, 0x0160, %tick
	.word 0xbfa488e0  ! 2853: FSUBq	dis not found

	.word 0xb7a88820  ! 2855: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab4820  ! 2857: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda94820  ! 2858: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xba342121  ! 2863: ORN_I	orn 	%r16, 0x0121, %r29
	.word 0xb1a94820  ! 2866: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	2, %r14
	.word 0xa193a000  ! 2868: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a489e0  ! 2870: FDIVq	dis not found

	.word 0xbd540000  ! 2872: RDPR_GL	<illegal instruction>
	.word 0xb3518000  ! 2875: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa90820  ! 2877: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa50940  ! 2880: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb9643801  ! 2881: MOVcc_I	<illegal instruction>
	.word 0xb1a00040  ! 2885: FMOVd	fmovd	%f0, %f24
	.word 0xb5a81420  ! 2886: FMOVRNZ	dis not found

	.word 0xbdaa0820  ! 2887: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00560  ! 2890: FSQRTq	fsqrt	
	.word 0xb5a88820  ! 2891: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb8aca1be  ! 2894: ANDNcc_I	andncc 	%r18, 0x01be, %r28
	.word 0xbb510000  ! 2895: RDPR_TICK	<illegal instruction>
	.word 0xb1a48820  ! 2897: FADDs	fadds	%f18, %f0, %f24
	.word 0xb77d0400  ! 2899: MOVR_R	movre	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0xb7a80820  ! 2905: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb8c5e077  ! 2907: ADDCcc_I	addccc 	%r23, 0x0077, %r28
	.word 0xbb2d2001  ! 2908: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0x9194a110  ! 2909: WRPR_PIL_I	wrpr	%r18, 0x0110, %pil
	.word 0xb1aac820  ! 2918: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a54940  ! 2928: FMULd	fmuld	%f52, %f0, %f24
	setx	0x10335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 2937: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	1, %r12
	.word 0x8f932000  ! 2941: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	2, %r12
	.word 0x8f932000  ! 2942: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a00040  ! 2946: FMOVd	fmovd	%f0, %f24
	.word 0xb694c000  ! 2954: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xb5a00020  ! 2960: FMOVs	fmovs	%f0, %f26
	.word 0xb3aa4820  ! 2961: FMOVNE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r19
	.word 0xbeac619b  ! 2964: ANDNcc_I	andncc 	%r17, 0x019b, %r31
	.word 0xb9520000  ! 2974: RDPR_PIL	<illegal instruction>
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9e0  ! 2981: FDIVq	dis not found

	.word 0xb3504000  ! 2983: RDPR_TNPC	<illegal instruction>
	.word 0xb1a88820  ! 2984: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c9c0  ! 2988: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xb5518000  ! 2990: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a9c820  ! 2992: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a88820  ! 2994: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb025a179  ! 2995: SUB_I	sub 	%r22, 0x0179, %r24
	.word 0xb62ca03e  ! 2996: ANDN_I	andn 	%r18, 0x003e, %r27
	.word 0xbfaac820  ! 2997: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3aac820  ! 2998: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1504000  ! 2999: RDPR_TNPC	<illegal instruction>
	.word 0x9194a178  ! 3000: WRPR_PIL_I	wrpr	%r18, 0x0178, %pil
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bcc000  ! 3005: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xbba409e0  ! 3007: FDIVq	dis not found

	.word 0xbfa58820  ! 3008: FADDs	fadds	%f22, %f0, %f31
	.word 0x819421a5  ! 3014: WRPR_TPC_I	wrpr	%r16, 0x01a5, %tpc
	.word 0xb7a80820  ! 3017: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb6c5a059  ! 3018: ADDCcc_I	addccc 	%r22, 0x0059, %r27
	.word 0xb7a40840  ! 3019: FADDd	faddd	%f16, %f0, %f58
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 3023: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a5c9a0  ! 3025: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb3a88820  ! 3028: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0x8594a0e2  ! 3030: WRPR_TSTATE_I	wrpr	%r18, 0x00e2, %tstate
	.word 0xb3a5c860  ! 3031: FADDq	dis not found

	.word 0x899521b8  ! 3032: WRPR_TICK_I	wrpr	%r20, 0x01b8, %tick
	.word 0x8194e12f  ! 3034: WRPR_TPC_I	wrpr	%r19, 0x012f, %tpc
	.word 0xb1a449e0  ! 3036: FDIVq	dis not found

	.word 0xb9a84820  ! 3039: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a8c820  ! 3044: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	data_start_1, %g1, %r23
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbead0000  ! 3050: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xb7a40860  ! 3051: FADDq	dis not found

	.word 0xb1540000  ! 3052: RDPR_GL	<illegal instruction>
	.word 0x8595e054  ! 3054: WRPR_TSTATE_I	wrpr	%r23, 0x0054, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982989  ! 3055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0989, %hpstate
	.word 0xbd3c9000  ! 3057: SRAX_R	srax	%r18, %r0, %r30
	.word 0xb5a548c0  ! 3058: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb1a5c820  ! 3060: FADDs	fadds	%f23, %f0, %f24
	.word 0x8795e190  ! 3061: WRPR_TT_I	wrpr	%r23, 0x0190, %tt
	.word 0xb5aac820  ! 3062: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa509c0  ! 3063: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbda84820  ! 3068: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80820  ! 3070: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbda00020  ! 3071: FMOVs	fmovs	%f0, %f30
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c9e0  ! 3076: FDIVq	dis not found

	.word 0xb7ab4820  ! 3079: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 3085: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 3087: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda44860  ! 3090: FADDq	dis not found

	.word 0xbcac61c5  ! 3091: ANDNcc_I	andncc 	%r17, 0x01c5, %r30
	.word 0xb5a00020  ! 3093: FMOVs	fmovs	%f0, %f26
	.word 0xbfa44960  ! 3094: FMULq	dis not found

	.word 0xb7a8c820  ! 3099: FMOVL	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r23
	.word 0xb6a5e1f6  ! 3104: SUBcc_I	subcc 	%r23, 0x01f6, %r27
	.word 0xb3a90820  ! 3106: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 3110: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r19
	.word 0xb6c5c000  ! 3114: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xbc2d4000  ! 3118: ANDN_R	andn 	%r21, %r0, %r30
	.word 0xb1aac820  ! 3119: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58940  ! 3120: FMULd	fmuld	%f22, %f0, %f58
	.word 0x8195e162  ! 3122: WRPR_TPC_I	wrpr	%r23, 0x0162, %tpc
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 3128: RDPR_TL	<illegal instruction>
	.word 0xb5a00040  ! 3131: FMOVd	fmovd	%f0, %f26
	.word 0xbb51c000  ! 3135: RDPR_TL	<illegal instruction>
	.word 0xbda50940  ! 3139: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb29c8000  ! 3140: XORcc_R	xorcc 	%r18, %r0, %r25
	.word 0x8194e0c1  ! 3142: WRPR_TPC_I	wrpr	%r19, 0x00c1, %tpc
	.word 0xbec5c000  ! 3143: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0xb951c000  ! 3145: RDPR_TL	<illegal instruction>
	.word 0xbfa5c8a0  ! 3146: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb3a58960  ! 3147: FMULq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 3148: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982989  ! 3149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0989, %hpstate
	setx	0x23e, %g1, %o0
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
	.word 0xbb518000  ! 3153: RDPR_PSTATE	<illegal instruction>
	.word 0xb950c000  ! 3154: RDPR_TT	<illegal instruction>
	.word 0xbda84820  ! 3156: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3518000  ! 3158: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a549e0  ! 3161: FDIVq	dis not found

	.word 0x8195e1d4  ! 3162: WRPR_TPC_I	wrpr	%r23, 0x01d4, %tpc
	.word 0xbe0c20ac  ! 3163: AND_I	and 	%r16, 0x00ac, %r31
	.word 0xbd50c000  ! 3165: RDPR_TT	<illegal instruction>
	.word 0x8594a09a  ! 3169: WRPR_TSTATE_I	wrpr	%r18, 0x009a, %tstate
	.word 0xb5aa8820  ! 3170: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c9a0  ! 3175: FDIVs	fdivs	%f23, %f0, %f29
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a548a0  ! 3178: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb9508000  ! 3184: RDPR_TSTATE	<illegal instruction>
	.word 0xbf520000  ! 3186: RDPR_PIL	<illegal instruction>
	.word 0xbb2c1000  ! 3187: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xbf520000  ! 3191: RDPR_PIL	<illegal instruction>
	setx	data_start_2, %g1, %r16
	.word 0xbd510000  ! 3200: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d19  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d19, %hpstate
	.word 0xb045e1ab  ! 3203: ADDC_I	addc 	%r23, 0x01ab, %r24
	.word 0xbfa00020  ! 3205: FMOVs	fmovs	%f0, %f31
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 3208: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a54960  ! 3210: FMULq	dis not found

	.word 0x81952196  ! 3211: WRPR_TPC_I	wrpr	%r20, 0x0196, %tpc
	.word 0xb9a8c820  ! 3212: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbba50840  ! 3215: FADDd	faddd	%f20, %f0, %f60
	.word 0xbba00560  ! 3218: FSQRTq	fsqrt	
	.word 0xb751c000  ! 3219: RDPR_TL	<illegal instruction>
	.word 0xb3aa8820  ! 3229: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a98820  ! 3231: FMOVNEG	fmovs	%fcc1, %f0, %f27
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 3238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 3245: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a80420  ! 3248: FMOVRZ	dis not found

	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3254: FSQRTq	fsqrt	
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859461a3  ! 3261: WRPR_TSTATE_I	wrpr	%r17, 0x01a3, %tstate
	.word 0xb7a488c0  ! 3262: FSUBd	fsubd	%f18, %f0, %f58
	.word 0x9195a190  ! 3263: WRPR_PIL_I	wrpr	%r22, 0x0190, %pil
	.word 0xbd540000  ! 3264: RDPR_GL	<illegal instruction>
	.word 0xb634a0b8  ! 3266: ORN_I	orn 	%r18, 0x00b8, %r27
	.word 0xb53cb001  ! 3270: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xb5a88820  ! 3271: FMOVLE	fmovs	%fcc1, %f0, %f26
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb7a448e0  ! 3281: FSUBq	dis not found

	.word 0xbda448c0  ! 3282: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb62ce129  ! 3284: ANDN_I	andn 	%r19, 0x0129, %r27
	setx	data_start_6, %g1, %r23
	.word 0x87946184  ! 3287: WRPR_TT_I	wrpr	%r17, 0x0184, %tt
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 3292: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 3296: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a449a0  ! 3298: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb3a00540  ! 3303: FSQRTd	fsqrt	
	.word 0xbfa488a0  ! 3304: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb3a00040  ! 3305: FMOVd	fmovd	%f0, %f56
	.word 0xb7a9c820  ! 3306: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa98820  ! 3308: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbb504000  ! 3311: RDPR_TNPC	<illegal instruction>
	.word 0xb7a88820  ! 3312: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a9c820  ! 3318: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a54960  ! 3319: FMULq	dis not found

	.word 0xbfaa0820  ! 3322: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbba81c20  ! 3323: FMOVRGEZ	dis not found

	.word 0xb7a408e0  ! 3324: FSUBq	dis not found

	.word 0xb9510000  ! 3327: RDPR_TICK	<illegal instruction>
	.word 0xbfaa4820  ! 3329: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda50960  ! 3330: FMULq	dis not found

	setx	data_start_2, %g1, %r22
	.word 0xb9a408c0  ! 3332: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb9aa4820  ! 3333: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab4820  ! 3334: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda449e0  ! 3335: FDIVq	dis not found

	.word 0x819421ec  ! 3336: WRPR_TPC_I	wrpr	%r16, 0x01ec, %tpc
	setx	data_start_4, %g1, %r18
	.word 0xbfa48920  ! 3340: FMULs	fmuls	%f18, %f0, %f31
	.word 0xbda8c820  ! 3342: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xba3c201f  ! 3343: XNOR_I	xnor 	%r16, 0x001f, %r29
	setx	0x2012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 3346: RDPR_TPC	<illegal instruction>
	.word 0xbfa81420  ! 3348: FMOVRNZ	dis not found

	.word 0xb9a9c820  ! 3349: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb4b4a01f  ! 3350: ORNcc_I	orncc 	%r18, 0x001f, %r26
	.word 0xb3ab8820  ! 3353: FMOVPOS	fmovs	%fcc1, %f0, %f25
	setx	data_start_2, %g1, %r20
	.word 0xb3a80820  ! 3358: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbdaac820  ! 3359: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a98820  ! 3360: FMOVNEG	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0x8f932000  ! 3366: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9ab0820  ! 3370: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbba94820  ! 3372: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 3373: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1508000  ! 3375: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00520  ! 3376: FSQRTs	fsqrt	
	.word 0x8794a180  ! 3380: WRPR_TT_I	wrpr	%r18, 0x0180, %tt
	.word 0xb9a84820  ! 3381: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbda00540  ! 3389: FSQRTd	fsqrt	
	.word 0xb3641800  ! 3391: MOVcc_R	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 3392: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95a058  ! 3393: WRPR_PSTATE_I	wrpr	%r22, 0x0058, %pstate
	.word 0xb1a588a0  ! 3396: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb9a40920  ! 3397: FMULs	fmuls	%f16, %f0, %f28
	.word 0xbba81c20  ! 3398: FMOVRGEZ	dis not found

	.word 0xb5a00020  ! 3399: FMOVs	fmovs	%f0, %f26
	.word 0x8394a15e  ! 3400: WRPR_TNPC_I	wrpr	%r18, 0x015e, %tnpc
	.word 0xb7a44960  ! 3401: FMULq	dis not found

	setx	0x30011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a48860  ! 3415: FADDq	dis not found

	.word 0xb7a48860  ! 3417: FADDq	dis not found

	.word 0xb3a4c820  ! 3419: FADDs	fadds	%f19, %f0, %f25
	.word 0xb7a80820  ! 3420: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbabc4000  ! 3421: XNORcc_R	xnorcc 	%r17, %r0, %r29
	mov	0, %r14
	.word 0xa193a000  ! 3424: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a00540  ! 3425: FSQRTd	fsqrt	
	.word 0xbba80820  ! 3426: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0x8394210b  ! 3427: WRPR_TNPC_I	wrpr	%r16, 0x010b, %tnpc
	.word 0x8d94e05f  ! 3429: WRPR_PSTATE_I	wrpr	%r19, 0x005f, %pstate
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 3431: RDPR_TNPC	<illegal instruction>
	.word 0xbda88820  ! 3434: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c8a0  ! 3435: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xbba449e0  ! 3438: FDIVq	dis not found

	.word 0xb5480000  ! 3439: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbc15e1aa  ! 3443: OR_I	or 	%r23, 0x01aa, %r30
	.word 0xb9520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xb1a80c20  ! 3456: FMOVRLZ	dis not found

	.word 0xb5a98820  ! 3460: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbe0521f4  ! 3461: ADD_I	add 	%r20, 0x01f4, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81956117  ! 3469: WRPR_TPC_I	wrpr	%r21, 0x0117, %tpc
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 3471: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb72c7001  ! 3478: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xb7aac820  ! 3481: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5ab4820  ! 3482: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3518000  ! 3484: RDPR_PSTATE	<illegal instruction>
	.word 0xb1510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xb5aa0820  ! 3488: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb1a4c9e0  ! 3490: FDIVq	dis not found

	.word 0xb1510000  ! 3493: RDPR_TICK	<illegal instruction>
	.word 0xb9a409c0  ! 3494: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb9480000  ! 3495: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9a84820  ! 3498: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r20
	.word 0xbda84820  ! 3503: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00560  ! 3505: FSQRTq	fsqrt	
	.word 0xb3a81820  ! 3507: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9520000  ! 3511: RDPR_PIL	<illegal instruction>
	.word 0xb41c8000  ! 3513: XOR_R	xor 	%r18, %r0, %r26
	.word 0x9195e1d4  ! 3514: WRPR_PIL_I	wrpr	%r23, 0x01d4, %pil
	.word 0x9195a10b  ! 3516: WRPR_PIL_I	wrpr	%r22, 0x010b, %pil
	.word 0xbda80c20  ! 3518: FMOVRLZ	dis not found

	.word 0xb7aa4820  ! 3523: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x859561a9  ! 3524: WRPR_TSTATE_I	wrpr	%r21, 0x01a9, %tstate
	.word 0x9194a08a  ! 3526: WRPR_PIL_I	wrpr	%r18, 0x008a, %pil
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba2c0000  ! 3528: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xbba94820  ! 3531: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00520  ! 3532: FSQRTs	fsqrt	
	.word 0xb7a00560  ! 3535: FSQRTq	fsqrt	
	.word 0xb7aa0820  ! 3540: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbdaa0820  ! 3542: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbd480000  ! 3543: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbb500000  ! 3547: RDPR_TPC	<illegal instruction>
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 3549: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5a98820  ! 3551: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbbab8820  ! 3553: FMOVPOS	fmovs	%fcc1, %f0, %f29
	setx	data_start_4, %g1, %r22
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87956039  ! 3563: WRPR_TT_I	wrpr	%r21, 0x0039, %tt
	.word 0xb1a00540  ! 3566: FSQRTd	fsqrt	
	.word 0xb295a176  ! 3567: ORcc_I	orcc 	%r22, 0x0176, %r25
	.word 0xb5a98820  ! 3568: FMOVNEG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a549c0  ! 3574: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xb7a80c20  ! 3577: FMOVRLZ	dis not found

	.word 0xb3ab0820  ! 3582: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a448a0  ! 3583: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xbbaa8820  ! 3584: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb41dc000  ! 3585: XOR_R	xor 	%r23, %r0, %r26
	.word 0xbcb46124  ! 3586: SUBCcc_I	orncc 	%r17, 0x0124, %r30
	.word 0xb9352001  ! 3588: SRL_I	srl 	%r20, 0x0001, %r28
	.word 0xb7aa4820  ! 3589: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a54960  ! 3591: FMULq	dis not found

	setx	data_start_6, %g1, %r18
	.word 0xb5a00520  ! 3595: FSQRTs	fsqrt	
	setx	data_start_2, %g1, %r23
	.word 0xb3a5c860  ! 3597: FADDq	dis not found

	.word 0xb7a50840  ! 3599: FADDd	faddd	%f20, %f0, %f58
	.word 0xbea44000  ! 3600: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xbba48940  ! 3603: FMULd	fmuld	%f18, %f0, %f60
	.word 0xbfa00540  ! 3604: FSQRTd	fsqrt	
	.word 0xb5a449a0  ! 3605: FDIVs	fdivs	%f17, %f0, %f26
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 3607: FMOVs	fmovs	%f0, %f24
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 3611: FMOVG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983c9b  ! 3614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
	.word 0xbda4c8a0  ! 3616: FSUBs	fsubs	%f19, %f0, %f30
	.word 0x8395e11e  ! 3617: WRPR_TNPC_I	wrpr	%r23, 0x011e, %tnpc
	.word 0xbfaa4820  ! 3618: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a549a0  ! 3619: FDIVs	fdivs	%f21, %f0, %f26
	.word 0x81942012  ! 3621: WRPR_TPC_I	wrpr	%r16, 0x0012, %tpc
	.word 0xb7a44840  ! 3623: FADDd	faddd	%f48, %f0, %f58
	.word 0x819521a2  ! 3624: WRPR_TPC_I	wrpr	%r20, 0x01a2, %tpc
	.word 0xb9a449c0  ! 3630: FDIVd	fdivd	%f48, %f0, %f28
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50840  ! 3637: FADDd	faddd	%f20, %f0, %f26
	.word 0xb22d0000  ! 3638: ANDN_R	andn 	%r20, %r0, %r25
	.word 0x8595e0a7  ! 3641: WRPR_TSTATE_I	wrpr	%r23, 0x00a7, %tstate
	.word 0x859461ef  ! 3643: WRPR_TSTATE_I	wrpr	%r17, 0x01ef, %tstate
	.word 0xb9a00520  ! 3644: FSQRTs	fsqrt	
	.word 0x8d956175  ! 3646: WRPR_PSTATE_I	wrpr	%r21, 0x0175, %pstate
	setx	0x3001e, %g1, %o0
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
	.word 0xb40c8000  ! 3653: AND_R	and 	%r18, %r0, %r26
	.word 0xb1a589c0  ! 3655: FDIVd	fdivd	%f22, %f0, %f24
	.word 0x8994e1bd  ! 3659: WRPR_TICK_I	wrpr	%r19, 0x01bd, %tick
	.word 0xb3a00560  ! 3664: FSQRTq	fsqrt	
	.word 0xbfa58860  ! 3666: FADDq	dis not found

	.word 0xb3a00520  ! 3668: FSQRTs	fsqrt	
	.word 0xb5500000  ! 3674: RDPR_TPC	<illegal instruction>
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 3687: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbf508000  ! 3689: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a449e0  ! 3698: FDIVq	dis not found

	.word 0x8d94e17c  ! 3699: WRPR_PSTATE_I	wrpr	%r19, 0x017c, %pstate
	.word 0xbda80420  ! 3702: FMOVRZ	dis not found

	.word 0xb3a98820  ! 3705: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbd518000  ! 3712: RDPR_PSTATE	rdpr	%pstate, %r30
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a40820  ! 3714: FADDs	fadds	%f16, %f0, %f28
	setx	data_start_5, %g1, %r22
	.word 0xbdab4820  ! 3717: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb7500000  ! 3724: RDPR_TPC	<illegal instruction>
	.word 0xb7a5c8e0  ! 3725: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 3730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xbc352197  ! 3733: SUBC_I	orn 	%r20, 0x0197, %r30
	.word 0xbe058000  ! 3736: ADD_R	add 	%r22, %r0, %r31
	.word 0xb7a5c920  ! 3739: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb5a80420  ! 3742: FMOVRZ	dis not found

	setx	data_start_1, %g1, %r20
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 3752: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c91  ! 3754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 3759: FMOVs	fmovs	%f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983e99  ! 3762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e99, %hpstate
	.word 0x8594a11a  ! 3765: WRPR_TSTATE_I	wrpr	%r18, 0x011a, %tstate
	.word 0xbfa508c0  ! 3768: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xbba50920  ! 3775: FMULs	fmuls	%f20, %f0, %f29
	.word 0xbf480000  ! 3782: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbba9c820  ! 3784: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb69d4000  ! 3787: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0x8195a0b2  ! 3788: WRPR_TPC_I	wrpr	%r22, 0x00b2, %tpc
	.word 0xb5ab8820  ! 3789: FMOVPOS	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982c8b  ! 3790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8b, %hpstate
	.word 0xbfa00520  ! 3792: FSQRTs	fsqrt	
	.word 0xb0ad0000  ! 3793: ANDNcc_R	andncc 	%r20, %r0, %r24
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb624c000  ! 3797: SUB_R	sub 	%r19, %r0, %r27
	.word 0xb1a80c20  ! 3799: FMOVRLZ	dis not found

	.word 0xb1a00520  ! 3800: FSQRTs	fsqrt	
	.word 0xb1aac820  ! 3802: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5518000  ! 3804: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe94a0e7  ! 3815: ORcc_I	orcc 	%r18, 0x00e7, %r31
	.word 0xb9518000  ! 3818: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a4c920  ! 3819: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb3a81420  ! 3820: FMOVRNZ	dis not found

	.word 0xb4050000  ! 3823: ADD_R	add 	%r20, %r0, %r26
	.word 0xb9aa0820  ! 3824: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa80420  ! 3825: FMOVRZ	dis not found

	.word 0xbfa98820  ! 3826: FMOVNEG	fmovs	%fcc1, %f0, %f31
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3828: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	data_start_4, %g1, %r19
	.word 0xbaa5c000  ! 3830: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xbda00540  ! 3831: FSQRTd	fsqrt	
	.word 0xb9a00520  ! 3832: FSQRTs	fsqrt	
	.word 0xb03c4000  ! 3835: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0x8595a1f2  ! 3836: WRPR_TSTATE_I	wrpr	%r22, 0x01f2, %tstate
	.word 0xb350c000  ! 3837: RDPR_TT	<illegal instruction>
	.word 0xbfabc820  ! 3838: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbba489a0  ! 3840: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb9ab8820  ! 3841: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7ab8820  ! 3849: FMOVPOS	fmovs	%fcc1, %f0, %f27
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 3851: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c960  ! 3855: FMULq	dis not found

	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 3859: FSQRTq	fsqrt	
	.word 0xbfa5c8c0  ! 3860: FSUBd	fsubd	%f54, %f0, %f62
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 3864: RDPR_PSTATE	<illegal instruction>
	.word 0xbf643801  ! 3866: MOVcc_I	<illegal instruction>
	.word 0xb9a4c840  ! 3869: FADDd	faddd	%f50, %f0, %f28
	.word 0xbd500000  ! 3871: RDPR_TPC	<illegal instruction>
	.word 0xb1a48920  ! 3878: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb7abc820  ! 3879: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda80420  ! 3881: FMOVRZ	dis not found

	.word 0x8d9461a4  ! 3886: WRPR_PSTATE_I	wrpr	%r17, 0x01a4, %pstate
	.word 0xb4b56072  ! 3887: ORNcc_I	orncc 	%r21, 0x0072, %r26
	.word 0xbb500000  ! 3891: RDPR_TPC	<illegal instruction>
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 3894: MOVcc_I	<illegal instruction>
	.word 0xbfa50860  ! 3897: FADDq	dis not found

	.word 0xbcbc2064  ! 3899: XNORcc_I	xnorcc 	%r16, 0x0064, %r30
	.word 0xb350c000  ! 3900: RDPR_TT	<illegal instruction>
	.word 0xb1aa8820  ! 3901: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0x8395e0de  ! 3902: WRPR_TNPC_I	wrpr	%r23, 0x00de, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xb1a80420  ! 3905: FMOVRZ	dis not found

	.word 0xb33cd000  ! 3907: SRAX_R	srax	%r19, %r0, %r25
	.word 0xbbab8820  ! 3908: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x83946111  ! 3911: WRPR_TNPC_I	wrpr	%r17, 0x0111, %tnpc
	.word 0xb5a58840  ! 3912: FADDd	faddd	%f22, %f0, %f26
	.word 0xb9a4c8e0  ! 3913: FSUBq	dis not found

	.word 0xb3aa8820  ! 3917: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a48820  ! 3919: FADDs	fadds	%f18, %f0, %f27
	.word 0xb1504000  ! 3920: RDPR_TNPC	<illegal instruction>
	.word 0xb3a80420  ! 3921: FMOVRZ	dis not found

	.word 0xbb520000  ! 3924: RDPR_PIL	<illegal instruction>
	.word 0xb5a5c8e0  ! 3925: FSUBq	dis not found

	.word 0x8795e019  ! 3931: WRPR_TT_I	wrpr	%r23, 0x0019, %tt
	.word 0x919420ac  ! 3932: WRPR_PIL_I	wrpr	%r16, 0x00ac, %pil
	.word 0x9195612f  ! 3934: WRPR_PIL_I	wrpr	%r21, 0x012f, %pil
	setx	data_start_4, %g1, %r17
	.word 0xb3a00040  ! 3936: FMOVd	fmovd	%f0, %f56
	.word 0xbe2d8000  ! 3939: ANDN_R	andn 	%r22, %r0, %r31
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a147  ! 3944: WRPR_TT_I	wrpr	%r18, 0x0147, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 3946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xbba98820  ! 3949: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0x8794e174  ! 3950: WRPR_TT_I	wrpr	%r19, 0x0174, %tt
	.word 0xb1504000  ! 3954: RDPR_TNPC	<illegal instruction>
	.word 0xbfa80820  ! 3955: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7a488e0  ! 3957: FSUBq	dis not found

	.word 0xb3a00560  ! 3963: FSQRTq	fsqrt	
	setx	0x20102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 3966: MOVcc_R	<illegal instruction>
	.word 0x8795a1be  ! 3967: WRPR_TT_I	wrpr	%r22, 0x01be, %tt
	.word 0xb9a508a0  ! 3968: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbfa58820  ! 3971: FADDs	fadds	%f22, %f0, %f31
	.word 0xbda00560  ! 3972: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982993  ! 3977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0x8795e1d0  ! 3979: WRPR_TT_I	wrpr	%r23, 0x01d0, %tt
	.word 0xb7500000  ! 3981: RDPR_TPC	<illegal instruction>
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a44820  ! 3983: FADDs	fadds	%f17, %f0, %f27
	.word 0xb8358000  ! 3987: ORN_R	orn 	%r22, %r0, %r28
	.word 0xb025c000  ! 3988: SUB_R	sub 	%r23, %r0, %r24
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c840  ! 3990: FADDd	faddd	%f50, %f0, %f56
	.word 0xb7ab8820  ! 3994: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5504000  ! 3997: RDPR_TNPC	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3999: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a9c820  ! 4004: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00040  ! 4005: FMOVd	fmovd	%f0, %f56
	.word 0xbba80c20  ! 4012: FMOVRLZ	dis not found

	setx	0x2002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 4014: FSQRTq	fsqrt	
	.word 0xbc2d61d3  ! 4015: ANDN_I	andn 	%r21, 0x01d3, %r30
	.word 0xbf7d6401  ! 4018: MOVR_I	movre	%r21, 0x1, %r31
	.word 0xba44c000  ! 4023: ADDC_R	addc 	%r19, %r0, %r29
	.word 0x8d94e088  ! 4025: WRPR_PSTATE_I	wrpr	%r19, 0x0088, %pstate
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859561c7  ! 4028: WRPR_TSTATE_I	wrpr	%r21, 0x01c7, %tstate
	.word 0xb7aa8820  ! 4030: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbdab8820  ! 4031: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c820  ! 4033: FADDs	fadds	%f23, %f0, %f27
	.word 0xb3aa4820  ! 4039: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4047: FSQRTd	fsqrt	
	.word 0xbfaa8820  ! 4049: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a50860  ! 4057: FADDq	dis not found

	.word 0xb9a4c9a0  ! 4062: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb7ab4820  ! 4066: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbb355000  ! 4067: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xb5aac820  ! 4070: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x8d9420bd  ! 4072: WRPR_PSTATE_I	wrpr	%r16, 0x00bd, %pstate
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 4077: FMOVRNZ	dis not found

	.word 0xbfa80420  ! 4081: FMOVRZ	dis not found

	.word 0xbfa48820  ! 4090: FADDs	fadds	%f18, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x91942122  ! 4100: WRPR_PIL_I	wrpr	%r16, 0x0122, %pil
	.word 0xb7abc820  ! 4101: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfab8820  ! 4103: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa408c0  ! 4104: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xb9520000  ! 4109: RDPR_PIL	<illegal instruction>
	.word 0xb9a80c20  ! 4110: FMOVRLZ	dis not found

	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7349000  ! 4112: SRLX_R	srlx	%r18, %r0, %r27
	mov	0, %r14
	.word 0xa193a000  ! 4116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa00520  ! 4118: FSQRTs	fsqrt	
	.word 0xb1508000  ! 4119: RDPR_TSTATE	<illegal instruction>
	.word 0xbc154000  ! 4120: OR_R	or 	%r21, %r0, %r30
	setx	0x1021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 4125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0xbda9c820  ! 4131: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80820  ! 4133: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1aac820  ! 4135: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a01f  ! 4142: WRPR_PIL_I	wrpr	%r18, 0x001f, %pil
	.word 0xb1a589e0  ! 4143: FDIVq	dis not found

	.word 0xb1a8c820  ! 4146: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982dd3  ! 4147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 4150: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbb50c000  ! 4151: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xbda80c20  ! 4161: FMOVRLZ	dis not found

	.word 0x8995a1fb  ! 4162: WRPR_TICK_I	wrpr	%r22, 0x01fb, %tick
	.word 0xb5a00540  ! 4164: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a588c0  ! 4167: FSUBd	fsubd	%f22, %f0, %f24
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb424a180  ! 4170: SUB_I	sub 	%r18, 0x0180, %r26
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4174: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb950c000  ! 4176: RDPR_TT	<illegal instruction>
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e08b  ! 4181: WRPR_TNPC_I	wrpr	%r23, 0x008b, %tnpc
	.word 0xb1520000  ! 4182: RDPR_PIL	<illegal instruction>
	.word 0xb1a58860  ! 4184: FADDq	dis not found

	.word 0xbf510000  ! 4186: RDPR_TICK	<illegal instruction>
	.word 0xb7a5c960  ! 4189: FMULq	dis not found

	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952060  ! 4193: WRPR_TNPC_I	wrpr	%r20, 0x0060, %tnpc
	.word 0xb5354000  ! 4194: SRL_R	srl 	%r21, %r0, %r26
	.word 0x8194e1d1  ! 4198: WRPR_TPC_I	wrpr	%r19, 0x01d1, %tpc
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 4200: RDPR_TNPC	<illegal instruction>
	.word 0xb5a80820  ! 4205: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x85956051  ! 4208: WRPR_TSTATE_I	wrpr	%r21, 0x0051, %tstate
	.word 0xb9a00540  ! 4209: FSQRTd	fsqrt	
	.word 0xb3aa4820  ! 4211: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8d9561aa  ! 4212: WRPR_PSTATE_I	wrpr	%r21, 0x01aa, %pstate
	.word 0x91956182  ! 4213: WRPR_PIL_I	wrpr	%r21, 0x0182, %pil
	.word 0xb3a5c9c0  ! 4215: FDIVd	fdivd	%f54, %f0, %f56
	mov	2, %r14
	.word 0xa193a000  ! 4216: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7504000  ! 4218: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4223: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 4226: FMOVs	fmovs	%f0, %f29
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4236: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0x87956124  ! 4240: WRPR_TT_I	wrpr	%r21, 0x0124, %tt
	.word 0xb3a81420  ! 4241: FMOVRNZ	dis not found

	.word 0xb1a44920  ! 4243: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb9a90820  ! 4247: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a58820  ! 4249: FADDs	fadds	%f22, %f0, %f26
	.word 0xb9a90820  ! 4250: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbb510000  ! 4252: RDPR_TICK	<illegal instruction>
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 4256: FMOVs	fmovs	%f0, %f31
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 4260: FSQRTs	fsqrt	
	.word 0xbdaa4820  ! 4263: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbf643801  ! 4265: MOVcc_I	<illegal instruction>
	.word 0xb2a5a14b  ! 4269: SUBcc_I	subcc 	%r22, 0x014b, %r25
	.word 0xb12cb001  ! 4271: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0xbda00520  ! 4272: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983cc3  ! 4273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc3, %hpstate
	.word 0xbba409a0  ! 4274: FDIVs	fdivs	%f16, %f0, %f29
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	.word 0xb4c5a086  ! 4278: ADDCcc_I	addccc 	%r22, 0x0086, %r26
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4281: FSQRTq	fsqrt	
	.word 0xbb510000  ! 4282: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r12
	.word 0x8f932000  ! 4287: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa81c20  ! 4289: FMOVRGEZ	dis not found

	.word 0xbfa4c8c0  ! 4290: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbdaa4820  ! 4294: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a5c820  ! 4299: FADDs	fadds	%f23, %f0, %f28
	.word 0xb7aa8820  ! 4300: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x83942129  ! 4307: WRPR_TNPC_I	wrpr	%r16, 0x0129, %tnpc
	.word 0xbba90820  ! 4309: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00540  ! 4312: FSQRTd	fsqrt	
	mov	2, %r14
	.word 0xa193a000  ! 4319: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9518000  ! 4321: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 4322: RDPR_TL	<illegal instruction>
	setx	data_start_5, %g1, %r22
	.word 0xb5a4c9a0  ! 4328: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xbda81420  ! 4330: FMOVRNZ	dis not found

	.word 0x8d942175  ! 4331: WRPR_PSTATE_I	wrpr	%r16, 0x0175, %pstate
	.word 0xb5a488a0  ! 4333: FSUBs	fsubs	%f18, %f0, %f26
	.word 0x8195a099  ! 4337: WRPR_TPC_I	wrpr	%r22, 0x0099, %tpc
	.word 0x87942130  ! 4338: WRPR_TT_I	wrpr	%r16, 0x0130, %tt
	.word 0xb9500000  ! 4340: RDPR_TPC	<illegal instruction>
	.word 0x8794a0f0  ! 4342: WRPR_TT_I	wrpr	%r18, 0x00f0, %tt
	.word 0x8195a04d  ! 4343: WRPR_TPC_I	wrpr	%r22, 0x004d, %tpc
	.word 0xb9510000  ! 4345: RDPR_TICK	<illegal instruction>
	.word 0xb1508000  ! 4346: RDPR_TSTATE	<illegal instruction>
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2c5e085  ! 4349: ADDCcc_I	addccc 	%r23, 0x0085, %r25
	.word 0xb3a81820  ! 4354: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba80820  ! 4356: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfa48940  ! 4357: FMULd	fmuld	%f18, %f0, %f62
	.word 0x8d956188  ! 4358: WRPR_PSTATE_I	wrpr	%r21, 0x0188, %pstate
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4363: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbbaac820  ! 4365: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb9510000  ! 4368: RDPR_TICK	<illegal instruction>
	.word 0xb1a40840  ! 4369: FADDd	faddd	%f16, %f0, %f24
	.word 0x879421d5  ! 4371: WRPR_TT_I	wrpr	%r16, 0x01d5, %tt
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 4374: FSQRTs	fsqrt	
	.word 0xbf510000  ! 4375: RDPR_TICK	<illegal instruction>
	.word 0xb9a489e0  ! 4376: FDIVq	dis not found

	.word 0xb3500000  ! 4379: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c83  ! 4380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c83, %hpstate
	setx	data_start_1, %g1, %r17
	.word 0xb7a588e0  ! 4390: FSUBq	dis not found

	.word 0xbda4c920  ! 4391: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb7a489a0  ! 4392: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb12ce001  ! 4393: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xb095601c  ! 4399: ORcc_I	orcc 	%r21, 0x001c, %r24
	.word 0xb1480000  ! 4400: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8395a037  ! 4401: WRPR_TNPC_I	wrpr	%r22, 0x0037, %tnpc
	.word 0xbda44960  ! 4403: FMULq	dis not found

	setx	0x20202, %g1, %o0
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
	.word 0xbd500000  ! 4417: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 4420: RDPR_TPC	<illegal instruction>
	.word 0xb5a8c820  ! 4421: FMOVL	fmovs	%fcc1, %f0, %f26
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54960  ! 4426: FMULq	dis not found

	.word 0xbba50940  ! 4428: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb3a5c9a0  ! 4434: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb1ab4820  ! 4441: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a50940  ! 4443: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbda44940  ! 4450: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb7a5c820  ! 4451: FADDs	fadds	%f23, %f0, %f27
	.word 0xb4b5a1dc  ! 4454: SUBCcc_I	orncc 	%r22, 0x01dc, %r26
	setx	data_start_4, %g1, %r18
	setx	data_start_7, %g1, %r23
	.word 0xbdab8820  ! 4464: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb08da195  ! 4465: ANDcc_I	andcc 	%r22, 0x0195, %r24
	.word 0xbfa549c0  ! 4468: FDIVd	fdivd	%f52, %f0, %f62
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8c0  ! 4470: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb5508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xbd540000  ! 4479: RDPR_GL	<illegal instruction>
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 4485: RDPR_TICK	<illegal instruction>
	.word 0xb22c8000  ! 4489: ANDN_R	andn 	%r18, %r0, %r25
	setx	0x10026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a54940  ! 4498: FMULd	fmuld	%f52, %f0, %f24
	.word 0xbba489c0  ! 4499: FDIVd	fdivd	%f18, %f0, %f60
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	.word 0x81983981  ! 4514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1981, %hpstate
	.word 0xb7a548e0  ! 4516: FSUBq	dis not found

	.word 0x8394216b  ! 4517: WRPR_TNPC_I	wrpr	%r16, 0x016b, %tnpc
	.word 0xb5a589e0  ! 4520: FDIVq	dis not found

	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4534: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00020  ! 4536: FMOVs	fmovs	%f0, %f31
	.word 0xb9a81820  ! 4539: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 4543: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_5, %g1, %r21
	.word 0xbb510000  ! 4546: RDPR_TICK	<illegal instruction>
	.word 0xba1c2020  ! 4547: XOR_I	xor 	%r16, 0x0020, %r29
	.word 0xb1a5c960  ! 4548: FMULq	dis not found

	.word 0x81956071  ! 4551: WRPR_TPC_I	wrpr	%r21, 0x0071, %tpc
	setx	0x1b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc2d616f  ! 4555: ANDN_I	andn 	%r21, 0x016f, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xb1a58940  ! 4558: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb1a80420  ! 4562: FMOVRZ	dis not found

	.word 0xb3a4c820  ! 4563: FADDs	fadds	%f19, %f0, %f25
	.word 0xb9a58920  ! 4564: FMULs	fmuls	%f22, %f0, %f28
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508e0  ! 4569: FSUBq	dis not found

	setx	data_start_1, %g1, %r17
	.word 0xbfaa0820  ! 4573: FMOVA	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0x8f932000  ! 4575: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8595a0c3  ! 4576: WRPR_TSTATE_I	wrpr	%r22, 0x00c3, %tstate
	.word 0xbba8c820  ! 4577: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbb480000  ! 4584: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8d94a115  ! 4586: WRPR_PSTATE_I	wrpr	%r18, 0x0115, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0xbead8000  ! 4589: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xbda548c0  ! 4590: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb73cc000  ! 4591: SRA_R	sra 	%r19, %r0, %r27
	.word 0x8995a1f9  ! 4592: WRPR_TICK_I	wrpr	%r22, 0x01f9, %tick
	.word 0xb4054000  ! 4594: ADD_R	add 	%r21, %r0, %r26
	.word 0x8994e0ca  ! 4600: WRPR_TICK_I	wrpr	%r19, 0x00ca, %tick
	.word 0xb5540000  ! 4601: RDPR_GL	<illegal instruction>
	.word 0xb3a4c9c0  ! 4602: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xbda81c20  ! 4605: FMOVRGEZ	dis not found

	.word 0xb1a88820  ! 4609: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c960  ! 4614: FMULq	dis not found

	.word 0xb92d2001  ! 4620: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xbe8d8000  ! 4621: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xb5aa8820  ! 4628: FMOVG	fmovs	%fcc1, %f0, %f26
	setx	data_start_7, %g1, %r22
	.word 0xb1a00520  ! 4632: FSQRTs	fsqrt	
	.word 0xb1a5c840  ! 4633: FADDd	faddd	%f54, %f0, %f24
	setx	data_start_4, %g1, %r21
	.word 0xb5aa0820  ! 4635: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5aa0820  ! 4639: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x81942199  ! 4640: WRPR_TPC_I	wrpr	%r16, 0x0199, %tpc
	.word 0xb1a88820  ! 4641: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a88820  ! 4643: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4645: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb2bc6118  ! 4646: XNORcc_I	xnorcc 	%r17, 0x0118, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983803  ! 4649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1803, %hpstate
	.word 0xbfa5c8a0  ! 4651: FSUBs	fsubs	%f23, %f0, %f31
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4654: RDPR_TPC	<illegal instruction>
	.word 0xb3a4c940  ! 4655: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb37d6401  ! 4656: MOVR_I	movre	%r21, 0x1, %r25
	.word 0xb550c000  ! 4658: RDPR_TT	<illegal instruction>
	.word 0xbd504000  ! 4661: RDPR_TNPC	<illegal instruction>
	.word 0xb7a80820  ! 4664: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a93  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a93, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 4668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0xb3a88820  ! 4671: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3ab4820  ! 4672: FMOVCC	fmovs	%fcc1, %f0, %f25
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9a0  ! 4676: FDIVs	fdivs	%f23, %f0, %f29
	.word 0x9195a146  ! 4677: WRPR_PIL_I	wrpr	%r22, 0x0146, %pil
	.word 0xbba448e0  ! 4678: FSUBq	dis not found

	.word 0xb3a589c0  ! 4686: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xbb50c000  ! 4690: RDPR_TT	<illegal instruction>
	.word 0xb9a548c0  ! 4693: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb5a00520  ! 4694: FSQRTs	fsqrt	
	.word 0xb9480000  ! 4701: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb750c000  ! 4702: RDPR_TT	<illegal instruction>
	.word 0xbba4c8e0  ! 4703: FSUBq	dis not found

	.word 0xb9abc820  ! 4706: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbc9c0000  ! 4707: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xbfa80c20  ! 4709: FMOVRLZ	dis not found

	.word 0x8d952003  ! 4710: WRPR_PSTATE_I	wrpr	%r20, 0x0003, %pstate
	.word 0xb005a0aa  ! 4711: ADD_I	add 	%r22, 0x00aa, %r24
	.word 0x8394a029  ! 4712: WRPR_TNPC_I	wrpr	%r18, 0x0029, %tnpc
	.word 0xb3a5c8e0  ! 4714: FSUBq	dis not found

	.word 0x91952090  ! 4716: WRPR_PIL_I	wrpr	%r20, 0x0090, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1abc820  ! 4720: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb5520000  ! 4723: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xbda00540  ! 4730: FSQRTd	fsqrt	
	.word 0xb48d0000  ! 4735: ANDcc_R	andcc 	%r20, %r0, %r26
	.word 0xbba81420  ! 4737: FMOVRNZ	dis not found

	.word 0xbda54940  ! 4738: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1a98820  ! 4740: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb21d4000  ! 4741: XOR_R	xor 	%r21, %r0, %r25
	.word 0xb7643801  ! 4742: MOVcc_I	<illegal instruction>
	.word 0xb950c000  ! 4743: RDPR_TT	<illegal instruction>
	.word 0xb7a448e0  ! 4746: FSUBq	dis not found

	setx	0x30f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195200f  ! 4749: WRPR_PIL_I	wrpr	%r20, 0x000f, %pil
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a44920  ! 4756: FMULs	fmuls	%f17, %f0, %f25
	.word 0xbeade0bc  ! 4759: ANDNcc_I	andncc 	%r23, 0x00bc, %r31
	.word 0xbba448c0  ! 4760: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbba00560  ! 4765: FSQRTq	fsqrt	
	setx	0x10212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942070  ! 4779: WRPR_PSTATE_I	wrpr	%r16, 0x0070, %pstate
	.word 0x9194e10f  ! 4782: WRPR_PIL_I	wrpr	%r19, 0x010f, %pil
	.word 0xbd480000  ! 4783: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa8c820  ! 4794: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3520000  ! 4803: RDPR_PIL	<illegal instruction>
	.word 0xb7a81420  ! 4804: FMOVRNZ	dis not found

	.word 0xb7a58960  ! 4805: FMULq	dis not found

	.word 0xb5a449e0  ! 4808: FDIVq	dis not found

	.word 0xb1a80420  ! 4813: FMOVRZ	dis not found

	.word 0xb5a449c0  ! 4816: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb1a81420  ! 4821: FMOVRNZ	dis not found

	.word 0xbfa40940  ! 4823: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb3a00560  ! 4832: FSQRTq	fsqrt	
	.word 0xb5ab0820  ! 4833: FMOVGU	fmovs	%fcc1, %f0, %f26
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 4838: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c960  ! 4841: FMULq	dis not found

	.word 0x9195a182  ! 4843: WRPR_PIL_I	wrpr	%r22, 0x0182, %pil
	.word 0xbda549c0  ! 4844: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb7a44840  ! 4845: FADDd	faddd	%f48, %f0, %f58
	setx	0x3030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 4852: RDPR_TNPC	<illegal instruction>
	.word 0xb3a4c940  ! 4854: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb5a84820  ! 4856: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a58820  ! 4857: FADDs	fadds	%f22, %f0, %f28
	.word 0xb5a488a0  ! 4859: FSUBs	fsubs	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 4864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xb7a40840  ! 4865: FADDd	faddd	%f16, %f0, %f58
	.word 0xb7a5c9a0  ! 4866: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb1abc820  ! 4868: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa408c0  ! 4869: FSUBd	fsubd	%f16, %f0, %f62
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4878: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c940  ! 4880: FMULd	fmuld	%f54, %f0, %f60
	.word 0xb151c000  ! 4882: RDPR_TL	<illegal instruction>
	.word 0xb1a00020  ! 4885: FMOVs	fmovs	%f0, %f24
	.word 0xb7aa0820  ! 4887: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 4889: MOVcc_I	<illegal instruction>
	setx	0x20307, %g1, %o0
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
	.word 0xb9356001  ! 4892: SRL_I	srl 	%r21, 0x0001, %r28
	.word 0xb7a98820  ! 4896: FMOVNEG	fmovs	%fcc1, %f0, %f27
	setx	data_start_7, %g1, %r18
	.word 0xb1aa4820  ! 4899: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 4905: RDPR_TL	<illegal instruction>
	.word 0xb3a40840  ! 4906: FADDd	faddd	%f16, %f0, %f56
	.word 0xbb50c000  ! 4910: RDPR_TT	<illegal instruction>
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4913: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a50960  ! 4916: FMULq	dis not found

	.word 0xbba48860  ! 4920: FADDq	dis not found

	setx	0x30139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839460d8  ! 4925: WRPR_TNPC_I	wrpr	%r17, 0x00d8, %tnpc
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982991  ! 4935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a408e0  ! 4939: FSUBq	dis not found

	.word 0xb2bc4000  ! 4940: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xb1480000  ! 4941: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 4943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xb3ab8820  ! 4946: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80420  ! 4947: FMOVRZ	dis not found

	.word 0xb1ab4820  ! 4952: FMOVCC	fmovs	%fcc1, %f0, %f24
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 4955: FMOVN	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982d8b  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8b, %hpstate
	.word 0x9194203f  ! 4959: WRPR_PIL_I	wrpr	%r16, 0x003f, %pil
	.word 0xb7ab4820  ! 4960: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb7a548e0  ! 4962: FSUBq	dis not found

	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 4965: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbc45e0e7  ! 4969: ADDC_I	addc 	%r23, 0x00e7, %r30
	.word 0x819560f4  ! 4972: WRPR_TPC_I	wrpr	%r21, 0x00f4, %tpc
	.word 0xb0b44000  ! 4974: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xbda58860  ! 4976: FADDq	dis not found

	.word 0xb3ab0820  ! 4977: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81820  ! 4979: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x87942060  ! 4983: WRPR_TT_I	wrpr	%r16, 0x0060, %tt
	setx	0x10320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e064  ! 4986: WRPR_TSTATE_I	wrpr	%r23, 0x0064, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 4992: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb72ce001  ! 4993: SLL_I	sll 	%r19, 0x0001, %r27

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

	.xword	0x9cb118646e33b6ed
	.xword	0xa263073ff1e33c53
	.xword	0x2321bcdc5f86e7ed
	.xword	0xbd96f122eb47fcb9
	.xword	0xfb6281ed16f0f721
	.xword	0xee46c96528a9e8be
	.xword	0x92ab0317ff9aaf45
	.xword	0x82c166ed30ab5a94
	.xword	0xf8c6ecf32dfcab77
	.xword	0x6f9772a421d8cffb
	.xword	0xb01c61d15828baef
	.xword	0x8aa09efca5f1fad8
	.xword	0xcf8672cfd04134dd
	.xword	0x21b03a063ca0314d
	.xword	0xab2ca3df0f367dd3
	.xword	0x98eed03d883a5b4e
	.xword	0xfa9618d0e86ba93c
	.xword	0xda1c576d5e6e2633
	.xword	0x62f9724e76ad6390
	.xword	0x9472ae356be66e9d
	.xword	0x1f010b9f35bc7beb
	.xword	0x7fe5f587b60854f8
	.xword	0x02531d7c6cd859b3
	.xword	0x15bb1628464c352c
	.xword	0x0418ac4da096c354
	.xword	0x79be72b57137781d
	.xword	0x333f342c928b4b3d
	.xword	0x2ffc3dca2d0df3eb
	.xword	0x503e4f839601bdd9
	.xword	0x4b54c920274f08b2
	.xword	0xc96ff837a0663f90
	.xword	0xbce1a4ba2060b03f
	.xword	0x670eb924794713f7
	.xword	0x8a37a5f253648ae2
	.xword	0x4d740ef7fdbdb443
	.xword	0xa46b09fceaba126b
	.xword	0x5601a9696e4aea36
	.xword	0x5c6aebaece247212
	.xword	0x39aaec2ef599f197
	.xword	0x169019c5dccf422e
	.xword	0x9f4c28a590000148
	.xword	0x0ef16a4bc46d9b1d
	.xword	0x755df8b8e0f07aae
	.xword	0x0aa46c5509cf7cf6
	.xword	0x9171680f11298fdf
	.xword	0xeae333ed55e9a7c0
	.xword	0x25a0158a9a85485f
	.xword	0xff35c3d35ecaf936
	.xword	0x462fa36237bcb2f5
	.xword	0xab8e954fe398bd69
	.xword	0x787899b142ad8a0b
	.xword	0x47397bed5602da5e
	.xword	0x2a855e683764cef7
	.xword	0xdfdd2755badb2464
	.xword	0x5d452c8f02a26f8e
	.xword	0xc9922130b4329dff
	.xword	0x5886ba4a8a8ce641
	.xword	0x88f570b66acc6730
	.xword	0xf0e6dd2992602d98
	.xword	0x7758f68689131942
	.xword	0x7b76e27478a72afb
	.xword	0xb5c97f96133cb775
	.xword	0xbb09b3ffacdc20be
	.xword	0xb520850ba1772642
	.xword	0xc297faf0eacfc370
	.xword	0xc077e659de194d2e
	.xword	0x01f6c7c78490fafc
	.xword	0xa4ca2ca2f9cee02b
	.xword	0xf8b406359c4f2455
	.xword	0x42abfc32a029eb78
	.xword	0x0af349225a6e72b0
	.xword	0x755b25a9d2a6a0b9
	.xword	0x8c1f0aeee6a6f309
	.xword	0xe092397446459803
	.xword	0xca47a1853ee6ab9e
	.xword	0x39fe99177d7a3d6a
	.xword	0xc6d5d78162ef6050
	.xword	0x30574c9cdce23728
	.xword	0x3ddfa485c3151377
	.xword	0xeec15e31c4ed39de
	.xword	0x557c65574bad778e
	.xword	0x6ea71f925bec21aa
	.xword	0x77122bedfebb4538
	.xword	0x98de8d6a02484c7b
	.xword	0x95b602c4ffcedb4a
	.xword	0x18e05510507b6600
	.xword	0xd8b93bfe0e2f70be
	.xword	0xed85d143770193ce
	.xword	0x97e13e5b573c9a6a
	.xword	0x47700d460295ed3d
	.xword	0xa562ca422700ea47
	.xword	0xd04289d96100a91c
	.xword	0xca723038f7950217
	.xword	0x62787f08e10605a4
	.xword	0x6993deadd3868434
	.xword	0xc247b8699beae52d
	.xword	0x0372cac089da5162
	.xword	0xc3dd19687696431a
	.xword	0x8f4aed871dbf507a
	.xword	0x41dfa7bed8ba2e88
	.xword	0x5e8e898c2dc83960
	.xword	0x4cddb26ae5f60639
	.xword	0xbd5ef0582224be63
	.xword	0x47a92357c43f6f5d
	.xword	0xd8927d078ce120c1
	.xword	0x8483dafbf79970c1
	.xword	0x8631ec4484b184db
	.xword	0xb2e4fc0f31285d97
	.xword	0xb0e0d46e93d629d0
	.xword	0xad08cd3c50c9f2d8
	.xword	0x693da2aa4ecd4b10
	.xword	0x0c4a70b2641ece01
	.xword	0xb22010baee0d80ec
	.xword	0xc67a9d41a6ffa79e
	.xword	0x6ab2cf7e083cb431
	.xword	0x343c279c66c3df68
	.xword	0x9fe16650c7a9a546
	.xword	0xe44f543b773c2f71
	.xword	0x2983d5492273b07e
	.xword	0x2e2db1b33340685d
	.xword	0xccff058c6003a91e
	.xword	0xc68ac47993129123
	.xword	0x3f5d5c039499120e
	.xword	0xfdc63e843e244de6
	.xword	0x1caaf14bb98fbb80
	.xword	0xfa387739689f21f3
	.xword	0x5436246ef6a93a2b
	.xword	0x9510caadaf947510
	.xword	0x27a31eec9a99134b
	.xword	0xe9d9b92e934b5ab1
	.xword	0xcf69264aa22abd81
	.xword	0x1a63a6d4ba8def9e
	.xword	0xb45e6ceff08aa9f5
	.xword	0xf10319197c1a45dc
	.xword	0x480de108e8c6ad08
	.xword	0x4635ebedde09c709
	.xword	0xa8975cd22bf5393f
	.xword	0x66234a89470e7f34
	.xword	0xc7cd12753ec04fc9
	.xword	0x1e1b8fc648c629bd
	.xword	0xd224c222b796cbb9
	.xword	0x66ed2e509de146be
	.xword	0x82570f7b7381fe37
	.xword	0x147655f8213b5768
	.xword	0x5855eddd18ea5a62
	.xword	0x5ee7cac84b14ee67
	.xword	0x25d9ca73c49c8469
	.xword	0x46342f7cfb6c7b7a
	.xword	0xd2bd2be64195e217
	.xword	0xaa4aff2f3751cdb3
	.xword	0x1c9cea009d5caa03
	.xword	0xd86306960fd1255b
	.xword	0xfa54492470150c5d
	.xword	0x7179c7cc3bdbdbf1
	.xword	0x6841cc26d6404a1c
	.xword	0x08144d5c4a054772
	.xword	0x37d0f1cf4acfbdc6
	.xword	0x4567fc62ed2e017c
	.xword	0x02de38137421c2fd
	.xword	0x1700393597221b50
	.xword	0xf2cb1aa408b77207
	.xword	0x837db2c9843e93d2
	.xword	0xc6fe0e3a398c8ea7
	.xword	0x17676e58efc5d2b9
	.xword	0x7a9c20ac153ee7b7
	.xword	0x8b559de81fcbd23b
	.xword	0x8b5beada2cf1166c
	.xword	0x7514ac9707528eb4
	.xword	0x99b1afc03b4a5670
	.xword	0xcbce8d6e1747fe5d
	.xword	0xae4853683f804456
	.xword	0xbb9833d863eb337a
	.xword	0x1f6e506348503e6f
	.xword	0x7b0ecfdf123a5fd3
	.xword	0x65414ffb579dc635
	.xword	0xfb4f18e803ffb645
	.xword	0x737a4d22e530dd07
	.xword	0xdd95af9ddb1a8073
	.xword	0x8154d80289c531c2
	.xword	0x91a0d7cc6b5bdcd2
	.xword	0x76cebe72eb8db405
	.xword	0x385c2880834fd560
	.xword	0xfcbbeb991ea4946e
	.xword	0xc58f587e433655ac
	.xword	0x23eb5aeb99b44455
	.xword	0x443e3afd5d04a6d2
	.xword	0x4a62ee11a968db56
	.xword	0xcb334db652434304
	.xword	0x0b54feb2c1dc140a
	.xword	0xc5257c29839b9a19
	.xword	0xf0ecf216e1136baa
	.xword	0xfe2bf6f382a9b33c
	.xword	0x207a99280a32fc37
	.xword	0xbff772532cec7062
	.xword	0x2f2b37b28ecbf2b7
	.xword	0xec1dbdbc87262e02
	.xword	0x099917b158f913a0
	.xword	0x0bd5b723682cc477
	.xword	0x87d48520a9e92430
	.xword	0x48079ea1e705ed42
	.xword	0x6230cd2602318070
	.xword	0xd58a4441db9c50b7
	.xword	0x874e5479d7630c9c
	.xword	0x0203aeec70fcb7c8
	.xword	0x5a1a856112ef20d5
	.xword	0x86c493b110c24c97
	.xword	0x4d7d307bc7044f12
	.xword	0x39ecc3ef86998cbc
	.xword	0x5f2a82f444c1828e
	.xword	0xd07096021dabd1d5
	.xword	0xc2e60287822768a4
	.xword	0x359a52e2614bf88c
	.xword	0x97664d9175ca2d41
	.xword	0xdc99bc12feaca88d
	.xword	0x16b0a6f928732edf
	.xword	0xcc17ded803be48e9
	.xword	0xe27c6f44ab245e21
	.xword	0x2ab9cf433d8380a7
	.xword	0x29b5f6b52d4f187a
	.xword	0xf7a4347734b9657c
	.xword	0xd4eb742245a94485
	.xword	0xc1aac572897cf643
	.xword	0xb2d8d220c64e894c
	.xword	0xc688d0f68168aa35
	.xword	0x6fde967266eba6ea
	.xword	0xebe8b4fb15c98d8e
	.xword	0xc826fc2b57d032c8
	.xword	0x9c4f47adbd444f2b
	.xword	0xd021dec1ef85f43e
	.xword	0xbcb85a19602e3911
	.xword	0xc7c6a1246c0e16ab
	.xword	0x3532f3fbd3d0c510
	.xword	0xeb7bb6eb398dc90e
	.xword	0xa03644785816baf1
	.xword	0x96ed84522040d55c
	.xword	0xa3dd95610bbd1020
	.xword	0xb613ce11a188d10a
	.xword	0x7c1ee2106d9ab128
	.xword	0x3dab368323848867
	.xword	0x7fc4734153ac0a6c
	.xword	0xa6896cd69bade075
	.xword	0x420fe1bd9ef65292
	.xword	0x77338d62e233d48e
	.xword	0x87cd7d1983a2b22a
	.xword	0xc38deeb5369ce83f
	.xword	0xf82d88e77c0fe56f
	.xword	0x0025fa22d7de8ead
	.xword	0xa7050f278ffda5af
	.xword	0x7b561fd5fe87d2a2
	.xword	0x40d3e27b4c7d69c2
	.xword	0xba6b0271672ae714
	.xword	0x2f9dbd16fd437135
	.xword	0x009b73891789d705
	.xword	0x08666ba019362904
	.xword	0xc1b45394b93f8c21
	.xword	0x02adf6064e39371d
	.align 0x2000
	.data
data_start_1:

	.xword	0xb267ea5848b003cb
	.xword	0xff921112a2d243be
	.xword	0x9cda1e783c1c63d8
	.xword	0xef5caa45e33f7fd4
	.xword	0x6144f4b273b17da1
	.xword	0xe7e75d8a0b56a676
	.xword	0xcaa27a46a9085bd0
	.xword	0x387aec35f8f97394
	.xword	0xed1ff4fee9b256e1
	.xword	0xea599d44f2d5ed04
	.xword	0xb04f16354b9da6e9
	.xword	0xd60d867a1eeae943
	.xword	0xefe722c4c61a7e26
	.xword	0x36800fa89f187caf
	.xword	0xdfa12f619aa0d2cc
	.xword	0x7f7e92ef09a364f3
	.xword	0xc2b7c4fd92827815
	.xword	0xd0dffa79a8a9958c
	.xword	0x44e127bf06aa3e61
	.xword	0xa48cdba25a6eaefc
	.xword	0xda6d07a1bd2e85bb
	.xword	0x1004d1cd411f4740
	.xword	0xf5d386994ce01357
	.xword	0x7d19de15dbbce01a
	.xword	0x64a45a9c76e6ddaa
	.xword	0xc0c8e3e1bd352a35
	.xword	0x5bf38b05c77bf00d
	.xword	0x393ed366cfcfa13d
	.xword	0x349c64f2107cc453
	.xword	0x5476b336e553f617
	.xword	0x6479f5013c48ca6b
	.xword	0x5d4f3c18af462575
	.xword	0x355c088f769adc4a
	.xword	0x973d91edfe1292f8
	.xword	0x40439cf567fff0a6
	.xword	0x706451c40b072bd3
	.xword	0x3b5092e146a0530f
	.xword	0xba350d71bf79f230
	.xword	0xc6b578d9be680c35
	.xword	0xcec44a3b3e81d88c
	.xword	0xaa8b7b7ec381199c
	.xword	0x5e407257914631f1
	.xword	0x7ee2fed31ed959fa
	.xword	0xe7c30a65270d1d39
	.xword	0x18a50440f516944c
	.xword	0x469d05e079aeea00
	.xword	0x5d032ff667b713b9
	.xword	0xb7db23666304f3f0
	.xword	0xd6ebf0649b0656b8
	.xword	0xa7daa0ad539fc408
	.xword	0x9b49a7fd24622a96
	.xword	0xedb5822a735d2e7c
	.xword	0xcc7f16f0752f6109
	.xword	0x96cd8620dac141a5
	.xword	0x993f711ae052627e
	.xword	0x2e8fdfe320f3f870
	.xword	0x57a17fd7f0bb5280
	.xword	0x440d3c34b0836a6e
	.xword	0xd50666e2d4e89118
	.xword	0x58c78a897b0a9e8d
	.xword	0xc87044ee586ba2ce
	.xword	0x0623d8937758ae01
	.xword	0xeeb88127a2ede0f5
	.xword	0xc023d12e699b5f1a
	.xword	0xac53891a3457acd9
	.xword	0x12fbf9f64ef41f5d
	.xword	0xfe56fb2f8f648b0f
	.xword	0xf9294a2b045e0945
	.xword	0xd8f92b6f6ee6490c
	.xword	0x6880c366fd43504d
	.xword	0x1dae3e79e9da4133
	.xword	0x844a53b03644e216
	.xword	0x97ecec38097a068a
	.xword	0x95361a2c8bfaef10
	.xword	0xbb6986686ea1f9cb
	.xword	0x5b7993469761d757
	.xword	0x01cec1ac64f77a31
	.xword	0x1bd9f40f8c738cc5
	.xword	0x6d04ccd75b0f75c3
	.xword	0xf92a0fd05398f3ca
	.xword	0x478aa5b19da553cf
	.xword	0xef2b35d568998a2a
	.xword	0x224134abbf8af5cd
	.xword	0x6b02057591675bae
	.xword	0x249cb7e4c275b846
	.xword	0x422987378c741667
	.xword	0x277a54b3becce8ef
	.xword	0x7f26e945041e06f7
	.xword	0xdd17fe419e9008d8
	.xword	0x3cb2db76aa4c4a90
	.xword	0x36f7a967f88cbe01
	.xword	0x4bac41ccab7c7c59
	.xword	0x640ebf1e8051b87d
	.xword	0xc077f1d9530c8583
	.xword	0x15eaa2c606cc9d74
	.xword	0x133a5c5f96c084ae
	.xword	0xb4115972bb437532
	.xword	0x283119e1968c8fc9
	.xword	0x4488c7d46b29ef9a
	.xword	0x76a4b0a1dedb12a3
	.xword	0x4102dd438bc7e812
	.xword	0x35a6dc98aaeb89b2
	.xword	0x47d60c85f52ca932
	.xword	0x032c1cb70b9429c6
	.xword	0x57fa8e2d2240328d
	.xword	0xc6c715c8eb5640c8
	.xword	0x3fd0dc1646054025
	.xword	0x7eed5b7bb0adde1c
	.xword	0xd5010145eff317e5
	.xword	0xda1dae11786e0505
	.xword	0x424bdd3ac2c8a964
	.xword	0xb5fc0868a1b73f01
	.xword	0x25ef003d1fbad38f
	.xword	0x0fc02e40def853f5
	.xword	0xba9bb6b2b5772c62
	.xword	0xbc33051a666f09b7
	.xword	0x970e58946e7b19ae
	.xword	0xbdb1e30b98a280b6
	.xword	0x67a73d1041380049
	.xword	0x4019f7dab47edad9
	.xword	0xac25aabe13e85762
	.xword	0xd0543bcd677fdbc5
	.xword	0xc6d3a059c9091428
	.xword	0xdfa2a0ed66d50cdc
	.xword	0x58eed86707acdc8d
	.xword	0x3f18f99040069628
	.xword	0x67966e8a6a85d43e
	.xword	0x750689ffa27694ce
	.xword	0xdf4b71c266d3a35d
	.xword	0x4f0fea8390d07933
	.xword	0xc18cd74ec96a60fb
	.xword	0xa4fd82a8370c1229
	.xword	0x32b2e6c677556b36
	.xword	0xa2cf4d7a1f002c18
	.xword	0x052ff112ed94cd9b
	.xword	0x87a1517decd83746
	.xword	0xc9b44ecc4f6530e1
	.xword	0xf08dbdf1ad62f436
	.xword	0x24e670186898e6dc
	.xword	0x4fb95587a5f0f146
	.xword	0xb219c3830353fbc3
	.xword	0xf6dd370807948974
	.xword	0x01d0e51dc53161cf
	.xword	0xa87aa7536c4b9294
	.xword	0xfcb4d52852bf0115
	.xword	0x30cbfab4ead44080
	.xword	0x799a9f0eb96cea26
	.xword	0x2abac9c9d3dbc624
	.xword	0x7444a1c594a5083b
	.xword	0xe513542ddadf7f03
	.xword	0x1632e28ec72c684d
	.xword	0xae14fd2ca793afb5
	.xword	0x382757687c38a495
	.xword	0xa8d0b7681bfdb48e
	.xword	0x936de59e192c5702
	.xword	0x249d0d90357a284f
	.xword	0x79bd5172b473065c
	.xword	0x7e8bae8643fc03e6
	.xword	0xf677159b217ddf50
	.xword	0xf0320d9552cf91c0
	.xword	0xc0a7ca7e16c2af62
	.xword	0x0479304b9c7a6a5c
	.xword	0xa583f0851a1d9ed1
	.xword	0xe97ae3f43626cc2f
	.xword	0x1fda7de571c85b5a
	.xword	0xe296d8485498b827
	.xword	0x0b7adffb6dd59cd3
	.xword	0xcfbcb2928602c666
	.xword	0xcf7b54981ed36b11
	.xword	0x368126559e693ac1
	.xword	0x14ec0b78a0f2a413
	.xword	0x8c8e7563bf739688
	.xword	0x1ff91ec09f7eabce
	.xword	0xe48b19447a345244
	.xword	0xee77d6b498a1f44c
	.xword	0x5a3449d070f3fb0d
	.xword	0x6c9de09b5a997ad5
	.xword	0x0a117a5484858439
	.xword	0x6c803cea12005581
	.xword	0xb5c6ed04768cd9a6
	.xword	0x979e8d791a7f3398
	.xword	0x968c2771936f8085
	.xword	0x447a073cc7370c32
	.xword	0x9d188df71a695c5f
	.xword	0xdcfb72517a7a10ff
	.xword	0xe2c9d73b400d730d
	.xword	0x92d09d40ddbcc16c
	.xword	0x179c58399f03e381
	.xword	0x4dafd021f1709dcc
	.xword	0xee7e871d30c42b63
	.xword	0x1ec81d32b6e44269
	.xword	0x224824f6bad37d06
	.xword	0x658dcb1751b5054d
	.xword	0x11111b6a322ffa54
	.xword	0x93ebbd8ba2cab443
	.xword	0x96242661ea54f8ed
	.xword	0x6167c791d0f7cf3a
	.xword	0xb96dec230b67a07b
	.xword	0xf01142f67a03231c
	.xword	0xfd8d7b2677fbfe5e
	.xword	0x26ec8b0c99e4c638
	.xword	0x69dcf0857d3e608b
	.xword	0xa26b300d757521b0
	.xword	0x2ea58beb1b9c5797
	.xword	0xeef2ad9e9fb5230f
	.xword	0xfa5f898e3d487932
	.xword	0x5a789c55c2dd4a3d
	.xword	0x60944b2ae1c5f64b
	.xword	0x1d3622a93d03ddd3
	.xword	0x050c842522239bdc
	.xword	0x0a39383dc3faa09a
	.xword	0xd00bda8739354dff
	.xword	0xa9734b2e80795e95
	.xword	0x254b1835f81af076
	.xword	0x2522556d0485cff0
	.xword	0xbc128326bcaaa7a1
	.xword	0x5628ee322ff01203
	.xword	0x3dd306bdbec0a0b7
	.xword	0x0558177a6fb91773
	.xword	0x2de5551c326ffe7d
	.xword	0xde01ed4e8f7d9fa5
	.xword	0x9d5503971488f341
	.xword	0xab49995aba0c4eca
	.xword	0x83d9ef1a970d965b
	.xword	0x7c89b72a897cdb7f
	.xword	0xe629cbbab488c538
	.xword	0xcad9ca979b54634a
	.xword	0x6295eca616f05bff
	.xword	0x905e70a167a6ccf1
	.xword	0x46772fca3821809a
	.xword	0x679c8e22ce449459
	.xword	0x22f5b9426048cb5c
	.xword	0x7dca9b9bad6ec125
	.xword	0xa9050e1d5e637da6
	.xword	0xd14fa8ae2bc21016
	.xword	0xa52acbfb411469da
	.xword	0x6048cae3a678101f
	.xword	0xf176cbf26a69a172
	.xword	0x7d587261530fea5e
	.xword	0x4ea850b86dcfc8ed
	.xword	0x479ecf312c7abd4c
	.xword	0xf0b920edc976bc23
	.xword	0xe22d3a22cb5a9ad0
	.xword	0xb91c30c45bdb358b
	.xword	0x657b736a4ace581e
	.xword	0xfb9b51d49cb6c20b
	.xword	0x97d82a1735accbfe
	.xword	0x8c1e0437bfb3ee54
	.xword	0x5a38dbe75de847ee
	.xword	0x145d6db7934e7831
	.xword	0x4d42b4941001c67a
	.xword	0x5eb1fe9a6fbc714b
	.xword	0x2b38cf88900e6ec5
	.xword	0x5a16b78ebbce1a5f
	.xword	0x6555c0e01a00406c
	.xword	0x2a0b555ed22b40b7
	.align 0x4000
	.data
data_start_2:

	.xword	0x3c6a3fbc7b36b2ae
	.xword	0xf97fcbf63896b00b
	.xword	0xbc78769c0eb530c6
	.xword	0x032c0a9c9835ef83
	.xword	0x476d26186dc54498
	.xword	0xf5b703aea0f8d1ea
	.xword	0x53e174d5b9e96771
	.xword	0x010729a5e92c50d8
	.xword	0xeaf19bb4c523e6d6
	.xword	0x4ea0d5ebbd3cead4
	.xword	0x0f80dd1fe2f62fad
	.xword	0xdebc907b7b9e5f99
	.xword	0x918f3c0a9e05fc0f
	.xword	0x3e3bd8b1b2cbfaf7
	.xword	0xeef4bbe50863d4c4
	.xword	0x0c076b3b829fe4d5
	.xword	0xd9130e19ba8fda92
	.xword	0x504df6f0acc14f6c
	.xword	0x3934d1dc0494d0b6
	.xword	0x4c8d23fd01406051
	.xword	0x983e1fdedb115cbd
	.xword	0xce7f263c7a2d46f9
	.xword	0xc911ea9b37b3bcd3
	.xword	0xa1853bbe4128cafc
	.xword	0x5312b743c6434af9
	.xword	0x32993d4b2b413fe8
	.xword	0x8d299d16c085988e
	.xword	0x0a6a12e0135083e1
	.xword	0x41e93fcaf894c940
	.xword	0xb86396eee0eada6f
	.xword	0xdd5e90aae3440e3b
	.xword	0x2984474a79238b7a
	.xword	0x67832450968b2f2e
	.xword	0x1e4374dc02a709ec
	.xword	0xa5e60ed5c4b870b5
	.xword	0xfadbcfea63661874
	.xword	0xc85f94eaf656e858
	.xword	0x8dc38dd3ba74a421
	.xword	0x38022ff7e307d8cd
	.xword	0xf8d8c1ba98cc834e
	.xword	0x4ef75a369e2d7b18
	.xword	0x7f6350a69919595c
	.xword	0x3ed790a22769bd2b
	.xword	0x1b9e59f64f47eeec
	.xword	0x7f4bcba14763fc77
	.xword	0x94cac996d2907bac
	.xword	0xecb46c4b986b5311
	.xword	0x8993185aadb73ced
	.xword	0x4f697c3be68d5767
	.xword	0x86a12f86dd22bb99
	.xword	0xe709f1329a1f5abc
	.xword	0xff65faa85fa123b1
	.xword	0x5a392db773fee37a
	.xword	0xd4f046d3138e8614
	.xword	0xcd27839db1213e1c
	.xword	0x519a7c96d41020fb
	.xword	0xddd08df685f63d97
	.xword	0x8732a843d2a1e166
	.xword	0x1cbae0ea693dbeb8
	.xword	0x1a39134eda2d439a
	.xword	0x9b36ba73d3968262
	.xword	0x9b414699aa6ae9c1
	.xword	0x3eebc11a45d81932
	.xword	0xeeaf843aa7df8109
	.xword	0x1e3976a0973d7055
	.xword	0x3832fb9f93349f64
	.xword	0xdb3706cfc75f40c4
	.xword	0xda850f1ec216978b
	.xword	0xe6f4568c00922ead
	.xword	0xe7f986360e36cbb5
	.xword	0x260f626d8be46064
	.xword	0x9654abba523efd0c
	.xword	0x4486cbb422f15208
	.xword	0x757e71ced11931c9
	.xword	0x24046505367baf08
	.xword	0x67fb45768f7d4beb
	.xword	0xf14c7f9657ebe4c0
	.xword	0x3c33d79f22e6db62
	.xword	0xb0590bebf6f04700
	.xword	0x2a3b0e542c22520b
	.xword	0xc9c81506d76f8480
	.xword	0x328a12e01565786e
	.xword	0x81b4a74321c236a6
	.xword	0x1ec49a19514a6b7f
	.xword	0x3092999bd7d4b524
	.xword	0x04f0a135016cc01a
	.xword	0x3d7791f72b3b8c04
	.xword	0x7601cb0df9be3bd8
	.xword	0xc627b4776c171136
	.xword	0x9221ed5d28cc2d9c
	.xword	0x5ab4f36d1221d6e5
	.xword	0xfc9f6e4c5fef575a
	.xword	0x53faa3b6eb626634
	.xword	0x8e4799315f271da7
	.xword	0xd4748366a25d4551
	.xword	0x750f1708597d15f8
	.xword	0xed83b2850b182448
	.xword	0x04f094bc9e3fbca7
	.xword	0x465ead6291877d92
	.xword	0xd7f15bb0c225050f
	.xword	0x97b3f8a379dbff29
	.xword	0xd883d2c03f12589d
	.xword	0x16549d7943ac3874
	.xword	0x3f35a2327604a960
	.xword	0x68a2c53fee289482
	.xword	0xd25f67b3457896b8
	.xword	0x8c8708422f4e2d46
	.xword	0xfe648775bf2b16c4
	.xword	0x43bb15bb7eb87bc2
	.xword	0xb520e291a34cc118
	.xword	0x474acd95dd4d9944
	.xword	0x60b3734ac1ef36bd
	.xword	0xa46ade70970dd210
	.xword	0x82fc133e5ed86a12
	.xword	0xca5ffdd53883420f
	.xword	0x581c25aa674f7f4a
	.xword	0x5c5e35f7ab29b456
	.xword	0xe191f85e2aa1cfa9
	.xword	0x434bdb46b4f84300
	.xword	0xcbaed639ac785ee9
	.xword	0xb02b1723575d78ef
	.xword	0xf44251050ba1f0e0
	.xword	0x0fe5c83063814f9d
	.xword	0x58ac4bc1296459e0
	.xword	0x065cfe06ea9365b7
	.xword	0x98d2aaf13e5af789
	.xword	0x29fbcc3b78b48569
	.xword	0x9ff24e82ec1c4386
	.xword	0xe50b39a6238ac2e5
	.xword	0x50b098bfefe08da4
	.xword	0x62fd98fa59e2d712
	.xword	0xc9157e223ea008a4
	.xword	0x23afb6745b90de61
	.xword	0xe6e8bd9d29f3be82
	.xword	0x1d531f122385088d
	.xword	0x346de29879d02f7e
	.xword	0x02148b0b677b0fdf
	.xword	0x3daf7141f79c3824
	.xword	0x55e6c60ba5fd52ef
	.xword	0x80e6ef0a3aec918e
	.xword	0xb8a6f6d4b1b776a4
	.xword	0x242b3cd314d07fdf
	.xword	0x9204df6bb92dbce8
	.xword	0x75734ebda4977808
	.xword	0x0156c8c4109f59ae
	.xword	0xf65c34feb2deeaec
	.xword	0x80b9f7c35ee40b33
	.xword	0x08172adcdf0ebf65
	.xword	0xe7b331c6b71060a8
	.xword	0x6455b000f6f6600c
	.xword	0x214e46ff78616f5c
	.xword	0x24722bce73d77609
	.xword	0x0b3c3095bd664109
	.xword	0x66b70b13b17f0aaf
	.xword	0x84295f114335c2c1
	.xword	0xc6c36f1810c79f59
	.xword	0x66d5fa76603b5308
	.xword	0xb08193f22d7aee0c
	.xword	0xf24516e9336defbc
	.xword	0x27e7db87473b8040
	.xword	0xb9dc2def6ef28430
	.xword	0x75e4a497c8fdef17
	.xword	0x2d8e1dc3975d7405
	.xword	0x9ddab0497dad2b12
	.xword	0x13928844b1055c8b
	.xword	0x885c3974cb5681db
	.xword	0x1ba220f11ce78ef3
	.xword	0xac0654ac3af38b31
	.xword	0x4b382753bb50ac72
	.xword	0xdb14a8d3e0f5f514
	.xword	0x216372461ceec1ed
	.xword	0xe662c6f55e0d544e
	.xword	0x33c36fb976e582c8
	.xword	0x41147ff80779c220
	.xword	0x4654833a07793591
	.xword	0x21858810678b75b2
	.xword	0xb37bf550474133e4
	.xword	0x78b9303734d20fa4
	.xword	0xd1fe0457788961d6
	.xword	0xeac428265a26cd5b
	.xword	0x1bdbabfeca6049b7
	.xword	0xc5f070132ffed220
	.xword	0xdfbc176508da3b87
	.xword	0x7037b9d5a65f0b44
	.xword	0x23071d729d561d08
	.xword	0x6addef2b1055cdb6
	.xword	0xee7247e39b54c7b0
	.xword	0x02fdfcca2a64125d
	.xword	0x2e87baa35175744a
	.xword	0x17f9f2f881607a13
	.xword	0xe079f0ef53ebbd2e
	.xword	0xb3ce9370f6707c7e
	.xword	0x2358f363071b0c15
	.xword	0x18a0f9d9fdf4ff5a
	.xword	0x663e662649f2718e
	.xword	0x0d1387d3b6c1368a
	.xword	0x452a905699c702bb
	.xword	0xf99cf453504d72a0
	.xword	0x3e6f4d3e5f3caf66
	.xword	0x47b4fc53f0affda5
	.xword	0xa1bd3d9040ec37cd
	.xword	0x3cf70263c116b4af
	.xword	0xfae3546f4a2ab487
	.xword	0xbc55a1f1cb71fb6d
	.xword	0x998c9d4a9df2aa58
	.xword	0x17cc84a97e804e60
	.xword	0xff14275c3dc1ada4
	.xword	0x4ec123d5554f4439
	.xword	0x53b339b1cad9fcd0
	.xword	0xf485866697f5267a
	.xword	0x94f8d52187cea08a
	.xword	0x1dcd4291ac81f342
	.xword	0x6015f9232fc7119a
	.xword	0xbcd3994b241dd5b2
	.xword	0xa60bfca7d1fb4c75
	.xword	0xc223911b7ffd1fca
	.xword	0x2c09557983638a10
	.xword	0xf25b388ba442fbce
	.xword	0x5f0b0d5b04aaffaa
	.xword	0xa74960d3abef465b
	.xword	0x957c133b1dcba251
	.xword	0xb4066a5c37a42d3d
	.xword	0xe9347f11c2e20e4b
	.xword	0xd85ed9d2504c2981
	.xword	0x29a3bbcd0dbf8480
	.xword	0x2f57360eb391ff13
	.xword	0x0c8f933d4052f604
	.xword	0xaae0d82d70c5bce2
	.xword	0xc6d27a79338a30b1
	.xword	0x0ad134472ec92409
	.xword	0xb1502f2bee231a40
	.xword	0xe67ff705758583fb
	.xword	0xdf24efe7ee5c124c
	.xword	0x3c00c1968331621e
	.xword	0x61915ecbc267e89a
	.xword	0x3fa8fe2b86998ca2
	.xword	0x0f28dd6b77732ff4
	.xword	0xc54b0de9f526f236
	.xword	0xadc1236969cbb7b0
	.xword	0xcd2a01bef4e9500e
	.xword	0x3f3bd3e0efc40e1c
	.xword	0x7668f13f0cfb0fb6
	.xword	0xc001b5790f17d270
	.xword	0xf0b5746f38de629b
	.xword	0xc3f9466bcfdfafe9
	.xword	0xe72318822c105026
	.xword	0x9c9b3e1d7837d2a3
	.xword	0x09476c5bfaf41361
	.xword	0x38d38d0eb36e18be
	.xword	0x62a46636a3a74902
	.xword	0xabff2cf91502bb45
	.xword	0x0166589ec8a06d5c
	.xword	0xd2a5cdcf42fc7511
	.xword	0x6aa5493b4b9e8b2f
	.xword	0x393306928fbb4857
	.xword	0xd388fdd801bd6700
	.align 0x8000
	.data
data_start_3:

	.xword	0xe3713216cf511a55
	.xword	0x0f0e3b748f67b8cc
	.xword	0xcd82d3e6bcb4f4c3
	.xword	0x2d79ed93f678a4f1
	.xword	0xc7c815f53dc443dc
	.xword	0xfdb461e97efbecfd
	.xword	0xc3281ba9bf3a004f
	.xword	0x512248ae55f66f5d
	.xword	0xfa721ea88c1846fb
	.xword	0x90d323a3f3d376cd
	.xword	0x8822f55c0d3d5307
	.xword	0x40a573d9c5f6d31f
	.xword	0x3727cc89b0ee1f7d
	.xword	0x1e297c299b881b70
	.xword	0xb65ad60dd72fd061
	.xword	0xbed3d3da9c99dfea
	.xword	0xb3d2fb7370b4e4b3
	.xword	0xb44f14c576af726e
	.xword	0x34c9353f723ed2f1
	.xword	0x9a2c2c3e709e3b11
	.xword	0x269b0469201314fe
	.xword	0xb95e782e84d4ab65
	.xword	0xe00702123314fd4f
	.xword	0x4a207c2cf89ef217
	.xword	0x5b52588c9079404e
	.xword	0x9e53e23f4fb89b11
	.xword	0xb871041394421314
	.xword	0x81bf7f0608bf9755
	.xword	0x74fd312d35b5937f
	.xword	0x68fa51016eff42e8
	.xword	0x0756798a88a70e58
	.xword	0x4a5c00f5a540fc58
	.xword	0x8773ad8c268fd59b
	.xword	0x6cff65dbc970aaad
	.xword	0x59fc834f4f2699f1
	.xword	0x4b64a5337ba8614c
	.xword	0xcea958e55808eb44
	.xword	0xa85456b612e40d47
	.xword	0x03601c0fb83dbf39
	.xword	0xda1f1e05fbccc2b2
	.xword	0x2bdc0c3e2c7c9835
	.xword	0x796c3dd952dae521
	.xword	0x7422fdf085876a52
	.xword	0x649d34a952116d0c
	.xword	0x9a5c3bf7fc322868
	.xword	0xbb84b8f770f4df45
	.xword	0xdcad22550fe014b1
	.xword	0x23c0777a838e6d13
	.xword	0xe50d29ad062f0d1c
	.xword	0x98d5e58c7e340c01
	.xword	0xa3a113a93deb5986
	.xword	0x1a5dd5efe4563167
	.xword	0x4b069b4f830d88af
	.xword	0xfc9aebbaeab08cff
	.xword	0x89d52c32d074b703
	.xword	0xce3064cf5459d447
	.xword	0x58968f5f1f6438d3
	.xword	0x56491abac478908b
	.xword	0x6cb4420b9278df22
	.xword	0x82b8ce485d308628
	.xword	0x4571ac0c5e03033c
	.xword	0xa78980eed10876e6
	.xword	0x7f30ea73312429be
	.xword	0xdeed076ea42dae63
	.xword	0xc0924fe08416d680
	.xword	0x573e9e3d5ca0c005
	.xword	0x324a919ce0c4c853
	.xword	0x929be58daf39de69
	.xword	0x29d2baa0833c2c17
	.xword	0xbdc532dce0ef8b9d
	.xword	0xc09cb8586d61f5ad
	.xword	0x94048121e9bfe601
	.xword	0xb56e6b0e29d95609
	.xword	0x560865baa3c6b441
	.xword	0x5564f9f7bd1aea39
	.xword	0xba9d4e33184d23ae
	.xword	0x751174f153099561
	.xword	0x3d58dfe5aa97d373
	.xword	0x064798cda44c893a
	.xword	0xd4b83e33e7ee69e4
	.xword	0xe08df051d4976d3d
	.xword	0x818778d1bbf1061a
	.xword	0x4398163695881ff0
	.xword	0x27a1027849790b20
	.xword	0x36d6e16b941079e4
	.xword	0xac29749cff9bb15d
	.xword	0x984d2bf5f7e7824c
	.xword	0x1d6eb31d6928bd75
	.xword	0x5aaa44d8b1faca4f
	.xword	0xd0df7c3f56547535
	.xword	0x59a6eefaf18a9267
	.xword	0x179baedb06fefbeb
	.xword	0xa43a1aed55b9869c
	.xword	0x343ac497b609c33f
	.xword	0x76f38a6f61193fb9
	.xword	0x0660b87395792c8a
	.xword	0xa4ad6edbfaa1cda0
	.xword	0x6102b32e215c23e6
	.xword	0xd765f555fb8bc62c
	.xword	0x565868db678b67cb
	.xword	0x0cadf2a099925d1b
	.xword	0xde49a34db00b619f
	.xword	0x5b7c39b9699838fc
	.xword	0x2563acbca7b26933
	.xword	0xea4b97bdcfaf358d
	.xword	0xa0175b0fe766e7c4
	.xword	0x72a03de1579a861e
	.xword	0x8cacb320007bb1ae
	.xword	0xd1152a285590cc47
	.xword	0x7ecb24db5c97f0d9
	.xword	0xc5e28ec8acfd3f42
	.xword	0xbb7f67c1e915064d
	.xword	0xebec460ea70cfed8
	.xword	0x99ae99f452a6d359
	.xword	0x240eb2460c2240f5
	.xword	0x973a1ecd5f9f0100
	.xword	0xa1f4de503c425210
	.xword	0xb47fd6c37ac65d33
	.xword	0x15d58ec6380c3376
	.xword	0xa3eff2efaf1c3fc2
	.xword	0x76029238d54f3735
	.xword	0x29cb21704ef25cfb
	.xword	0x155b65ba5ea34f8f
	.xword	0x86fd12b55508eba0
	.xword	0xc5226c0a4df78582
	.xword	0xf81be56c7e9d04c6
	.xword	0x2d3111f81c17eb95
	.xword	0x1cc40751827deb31
	.xword	0xc2f928eec757a12d
	.xword	0xbae6571c19b82f9c
	.xword	0xe2fd73149ee3b64e
	.xword	0x74a7b14fc31df81a
	.xword	0xd71b22f689d60d92
	.xword	0xda669703856a3dc4
	.xword	0x7ab8971dfa2d1a3c
	.xword	0x1fcbf11a46d570d3
	.xword	0x6428c13cadd6d950
	.xword	0x07d93e78073ab3bf
	.xword	0xb1eb934b46004faf
	.xword	0xbc7659a23853a4c8
	.xword	0xb84e4ad07b42b27e
	.xword	0x265336d8728ac26b
	.xword	0xa92f3b6864c97b37
	.xword	0xae0b3877f7991f9a
	.xword	0x1680eca4169f2a9d
	.xword	0x300c994d56fc42ab
	.xword	0xcae36b608c610bc0
	.xword	0x3f1d5e72f175ea69
	.xword	0xc11c74f983cb494b
	.xword	0xa6bada29346336ab
	.xword	0x92986025236a34ea
	.xword	0x39f5205030fafdd7
	.xword	0xac6da8f97d417a17
	.xword	0x8ec0a2b6dd2cf914
	.xword	0x92981e64ecc94429
	.xword	0xe3fdf571ae6c0097
	.xword	0x751cbb90a6eca0c8
	.xword	0x1701540b77b62172
	.xword	0x8dd12f25aa135f9a
	.xword	0xc71cd4c6c7e87c0b
	.xword	0x263e4932a3b20068
	.xword	0x5d2b0ca1ec08fb9b
	.xword	0x6cd6908e20d5f428
	.xword	0x8da3032ba0f3c038
	.xword	0x2aca1924d8a259c7
	.xword	0xe8719f0e60aee7fa
	.xword	0xdb309868b732ffd5
	.xword	0x270ab6185f538b3a
	.xword	0xc515090d14fad204
	.xword	0x18b10beb7995873c
	.xword	0x170fd41bf3f1d2cd
	.xword	0xbe4d2ebc22cb3f75
	.xword	0xc56feb5b730a2c40
	.xword	0x43d0beb215db1f27
	.xword	0x582d1ecb448f33d8
	.xword	0xa9554cfb38b9508b
	.xword	0x4652a7d9552ca1a1
	.xword	0xf193ccf2b66eb00d
	.xword	0xd6a71331933671ce
	.xword	0x3ba5c16ed4cf5352
	.xword	0x19ba92d1ebab05f3
	.xword	0x8d51295edfa83026
	.xword	0x47863a32dc00a7d3
	.xword	0x03826586dacdc949
	.xword	0x5e8096ff1ba9f5e8
	.xword	0x29bff08f9d1dd8bd
	.xword	0x435025117879cb38
	.xword	0x0dc87d2672ccef1c
	.xword	0xee1a0c57ddd9c0e8
	.xword	0xdb109e8cb8b30fc5
	.xword	0x983790810915dd7f
	.xword	0xbdc216d420b8a2f3
	.xword	0x000607d682669006
	.xword	0xcbc182d555a31f12
	.xword	0x82d197e53c0b38dc
	.xword	0x4a938a53b710ac57
	.xword	0xb260ab758569b097
	.xword	0x204cd9ebb6caf97c
	.xword	0x4744b1abda4d3421
	.xword	0xb00369ecb0e88c5a
	.xword	0xde4d06426fd143c9
	.xword	0xd05f5e7058c8e17c
	.xword	0x1d109555807be753
	.xword	0x7ae23a8402513b5c
	.xword	0x878152253b16032a
	.xword	0xd411c958dfb9c745
	.xword	0x722eb3ea77b7f44e
	.xword	0x923035620022a2c7
	.xword	0xe9c820d37b2a749b
	.xword	0x792f09e92b65c701
	.xword	0x7fa1e329633ff1d6
	.xword	0x36c68d95f12aeed1
	.xword	0x18859190060b01a0
	.xword	0x09da993c71f680fb
	.xword	0x979a67a7311d27fb
	.xword	0x30fc1af37d47a886
	.xword	0xe2060045891c1b76
	.xword	0x512d1b9511cc195f
	.xword	0x5a3f4de89f2bfed9
	.xword	0xfa02cfbd6f92c100
	.xword	0x24b3c605721cd541
	.xword	0x8fb618edede6a87d
	.xword	0x8b8e0f55cc8a3b17
	.xword	0x4f35a1277996087d
	.xword	0xb60cdff16c6832c5
	.xword	0x95a7c335f708bac9
	.xword	0x12421f6332316469
	.xword	0xd526ab72281dc981
	.xword	0x01d907dde99f0240
	.xword	0x7822dea83467dfdd
	.xword	0x60c070c392533a5e
	.xword	0xb63487c32a7aff89
	.xword	0x19c8509fd5c04120
	.xword	0x8f0baef4e49a767c
	.xword	0xb6096f8545410201
	.xword	0x4895797611b3301f
	.xword	0x1a348de90e1a3a13
	.xword	0x80d8b6943811d7de
	.xword	0x9d844a07a7f76e8b
	.xword	0x3e1c41e97f9496e3
	.xword	0x7e9b8327362fc592
	.xword	0x05c843cf6f7c9ce1
	.xword	0xbf2776422e5cf51c
	.xword	0xdec9d8d6652d386b
	.xword	0xe6f363fd905f75cd
	.xword	0x1df291c9f956b381
	.xword	0xd5d73f6331e9de4c
	.xword	0xbb38cedcecf0f7ca
	.xword	0x0395853a3c488c7c
	.xword	0x965a314f6c82fa84
	.xword	0x6fd39fd128b37e20
	.xword	0x4d8b2cc5dc03f281
	.xword	0x61b4421a3dd6a368
	.xword	0x9f4bc934112538f7
	.xword	0xa7398c3bb395d71c
	.xword	0x9649bcb6a2528879
	.align 0x10000
	.data
data_start_4:

	.xword	0xfa6aa0e8471b4b89
	.xword	0x1b9fd09d066af304
	.xword	0x854ebd039bb25497
	.xword	0x0be9c22e28814f7f
	.xword	0xb1f745d0ca8f65e0
	.xword	0x86d5886133e766ec
	.xword	0x3a9da34b5d7583fb
	.xword	0x91f1c30f5bbcf0b1
	.xword	0xe399b85b6f7f49d6
	.xword	0x9a5d46023ec92bbc
	.xword	0xe31c839e1c65ba8d
	.xword	0xed92c6b9d6eea047
	.xword	0x7f3afe006dec9f0d
	.xword	0xfabb6927503e6d19
	.xword	0x90b844a453be3f58
	.xword	0xde1ee02aa9c7c2ac
	.xword	0x0e76c6b361b90a91
	.xword	0x8bc91f02b388121f
	.xword	0x91b08c7bc78ca465
	.xword	0xeb3702559237235d
	.xword	0x400136b7c2647b4a
	.xword	0xab7066dde134cdf6
	.xword	0x2afeeb971a2dda24
	.xword	0x04d6a153678f45be
	.xword	0xa3ff7e60153ed1ff
	.xword	0x4d2cf6215f853ef1
	.xword	0xb34bcfb73bc0bdcf
	.xword	0xa445885228446867
	.xword	0x502f7fbc67a3395b
	.xword	0x0a85860f7ea3db69
	.xword	0x56ed27fa3507059f
	.xword	0x51b653fa7aeb84a1
	.xword	0xe5306b64a833e1d7
	.xword	0xba0cfffef3d8c8f4
	.xword	0x42267a126e6cdeb4
	.xword	0xd60b2d24a2a49cdf
	.xword	0xaaeb8e5ca12747bc
	.xword	0x9f3b5266e6bf4e6d
	.xword	0x14e6b679e514d4cc
	.xword	0x7378fc61a4a03a1b
	.xword	0x76811b16386ab680
	.xword	0x8ca10c80bbaef0f0
	.xword	0x8a5c9947bd5e6563
	.xword	0x3195043bb0b129ff
	.xword	0xa6f42fa3f32a2d9f
	.xword	0xc1600c6738f6954c
	.xword	0xa16c652ae044846f
	.xword	0x7207df32c969fd02
	.xword	0x24334be039a0b3df
	.xword	0xc9dae88d5341a643
	.xword	0xecfed557c186d819
	.xword	0x8f8450e390ba4bd2
	.xword	0x17af6b905ba95e7b
	.xword	0x23b3470617652f80
	.xword	0x24bb91fe73f48a74
	.xword	0x8d3ad744f53fdcef
	.xword	0x56e3b0a359c477e9
	.xword	0x071dfbf1cf3f3184
	.xword	0xb66abf9ceb281a8e
	.xword	0x3bc269f556359163
	.xword	0xf6a37f576b5f1cf5
	.xword	0xe6373c4db3b33fb8
	.xword	0xd087178b15785ee3
	.xword	0x7ec969d9815469c8
	.xword	0x71b1e78a428d65ec
	.xword	0x8f1cba9e72ada7e4
	.xword	0xeca9d37030e4a0fe
	.xword	0x511b932eaab953e9
	.xword	0xd0dcdbc3b12de6a9
	.xword	0xe58be8be60795fe3
	.xword	0xf81795a0f81aa12b
	.xword	0x1085121430871ef3
	.xword	0x5660e516eb4a7710
	.xword	0x8ffb5a4b41bde7b1
	.xword	0x9e8963b8de998e57
	.xword	0x84871538f904cd21
	.xword	0x04be9064b1e4f572
	.xword	0x919b5e94c85120c2
	.xword	0x31ffa218761c9e55
	.xword	0x5740f4a0c64a0392
	.xword	0x8b3faa5c336869d2
	.xword	0xf3b984af45254e00
	.xword	0xfc9091cc41b6962d
	.xword	0x224a9538a52b4fda
	.xword	0x2dad388a8b92fec4
	.xword	0x0281471ed1739b56
	.xword	0x07d821d8a4e3541b
	.xword	0xe7bec6e50b1a0fd9
	.xword	0x4eb5eba1b2eaf96b
	.xword	0x4bb0c866a175a129
	.xword	0x787b5b6390817592
	.xword	0x411f35b0de11f0f4
	.xword	0x28da50d437154a14
	.xword	0x393bb7dc8c33ccb7
	.xword	0x79b891f9d8c42ea8
	.xword	0xcdb324fabd8e949c
	.xword	0x4d08eda89d3df688
	.xword	0x12db484ab52ec1d4
	.xword	0x77e4b8c8e032e7fb
	.xword	0x17b643c109d4db21
	.xword	0xfe430355c57e7515
	.xword	0xcf91756f5232d1e0
	.xword	0x337869a389956d36
	.xword	0xaa789977e404c0f7
	.xword	0xfc4398068b0d02fd
	.xword	0x2174c38005cd6e5b
	.xword	0xcfedd0118f0977f4
	.xword	0x757e35835fb0cba7
	.xword	0x34eb6b32d8455909
	.xword	0x326c3207f5d089a2
	.xword	0x3f75b1633e200386
	.xword	0x252d2c62ccf414d0
	.xword	0xb91a84d651b6255c
	.xword	0x7cbc0449638b5242
	.xword	0x2c6d6247c2158ebc
	.xword	0x84a47fa43c1826db
	.xword	0xd5ba0fae3d9f7b87
	.xword	0x5e170ca3d561b42a
	.xword	0x88c5d0bbf0f816c5
	.xword	0x266b61baf5e4f16f
	.xword	0x20f2652af245de7c
	.xword	0xe8eb7e5d87d189dc
	.xword	0x5d620fbb74f97541
	.xword	0x9661f18c8878c440
	.xword	0x123fb540bd7e47c6
	.xword	0x8dd162e3103ea77b
	.xword	0x0af07473405c4ef7
	.xword	0xa936cd7bcd2222e4
	.xword	0xd6540a205f3e0e8e
	.xword	0xafded8f0837acaf8
	.xword	0x38d840cc3249a353
	.xword	0x270aebb13fb35e0f
	.xword	0x0a3f31ed89acef5e
	.xword	0x03a1ac949661f05f
	.xword	0x84677ff8933a4bff
	.xword	0x259cabe144b7c280
	.xword	0x4cc44e0ecff42836
	.xword	0x7bb9b147211ef529
	.xword	0x8ea2a7bdc1fc96cf
	.xword	0x1082d3936aa432b6
	.xword	0x3ffb52e880c488d5
	.xword	0xd983a2d2795b7b02
	.xword	0xf7d2168a1f95819f
	.xword	0x205a6cdf3ad0a54f
	.xword	0x04b67820a9f158f2
	.xword	0x45e6e8a6f6f7d1af
	.xword	0x7ee2257eab74bb63
	.xword	0x4f724c8a23f8eaf9
	.xword	0x96b65ace627c655e
	.xword	0xf22a026af6e92f1c
	.xword	0xd3b58a24185e2dbc
	.xword	0xba72737d0223b6c7
	.xword	0x52ea995c61707e7e
	.xword	0xb4769412fec312a4
	.xword	0xbc4b52ac66fcaf25
	.xword	0x372e07f8741c49fa
	.xword	0x64978b05197d1dab
	.xword	0x81a5235169931e15
	.xword	0xd8b9ccb90004169c
	.xword	0x3a624589fc469457
	.xword	0xa148c2c4929050db
	.xword	0x9ddba9fae74782f7
	.xword	0xd44fd800be352d4f
	.xword	0x66746e5faf19a061
	.xword	0x1f84e487397ce0b2
	.xword	0xf33315de9c6f76b8
	.xword	0xfd82234304e7ef05
	.xword	0x38c9f090f2596f01
	.xword	0xd44a578f36aaa596
	.xword	0xdc9a58b3b8ad8407
	.xword	0x9eb33aee24fe7014
	.xword	0x8b3bfd036148619c
	.xword	0xd407aab382d5aeb8
	.xword	0x57a84cebab8aed2e
	.xword	0xf3a5bd03d05b6761
	.xword	0x2ec4bf97f281e067
	.xword	0xb99c3907861ddb40
	.xword	0x30935ce635565e74
	.xword	0x0cdff4126c04b277
	.xword	0x11502105dc9fa67c
	.xword	0x8beb8ae35f0126ff
	.xword	0x34e66d34868aa721
	.xword	0x100ecf7612ae95bd
	.xword	0xe14fed2017559180
	.xword	0x6d6a7c5fa3edb7e6
	.xword	0x9e8561b2c2cb45dc
	.xword	0x17413c307b2ec967
	.xword	0xd2a2436f62bef036
	.xword	0x7b534f3df749cdfa
	.xword	0x3f68121f1e9521d8
	.xword	0xd2bce0fac0db900a
	.xword	0x1118e3244bd44c67
	.xword	0xfbc1478f686a6a48
	.xword	0x82e03b4ca7a324b4
	.xword	0x4a81357510701fe0
	.xword	0x83d15996b7899f15
	.xword	0xf1efd01778d012d0
	.xword	0x021d73cb2d5325ed
	.xword	0xfc4ef071b629f8de
	.xword	0xab6127d8c7f5a036
	.xword	0x12499532af0b6022
	.xword	0xd99aae1a1c4bbca9
	.xword	0x849c36ca0a325b1b
	.xword	0xaac1218f145bc9b2
	.xword	0xd0e3577195b2c608
	.xword	0x675024b6b8cd27c5
	.xword	0x1b4da6b4ec2cfd60
	.xword	0x3ac495b07611bced
	.xword	0x8dbdf4a5fb0fb9cd
	.xword	0x049705eadaac30b4
	.xword	0x5dd03b8df24bfe46
	.xword	0xf5e5a8d17dd12e73
	.xword	0xd7ed9ad3f1a985dc
	.xword	0x1d20064cd7692c5e
	.xword	0x24e27d1ef841f13d
	.xword	0x26a5e91eb6580ab3
	.xword	0x63a92fcc041247b4
	.xword	0x88273c8a23f6fd44
	.xword	0x71517d3b85cc1292
	.xword	0x8d1ea14f21bffb4e
	.xword	0x7ee6eb6ade9813d6
	.xword	0x10693fce254e49b1
	.xword	0x17c948c68e0ee745
	.xword	0x01bffcbcdf387219
	.xword	0x58e3e72aecd7729b
	.xword	0x69b1f2ac96ffaf80
	.xword	0x9aa3788df452cda8
	.xword	0x70127998eeab3f05
	.xword	0x302a78afb6aa04c3
	.xword	0x2694b273147a01b1
	.xword	0x23f2c14d073c2602
	.xword	0x250ae973bd100385
	.xword	0x6c3099240ec5b213
	.xword	0xf302c30084f8e909
	.xword	0xce1614ce9110e662
	.xword	0x86e4508305020492
	.xword	0xa5e60c227dfb4d0f
	.xword	0x2a5fe6581387e47e
	.xword	0xf469edabedf50271
	.xword	0x63f92bf594ce6d86
	.xword	0x63ebc883d27c4718
	.xword	0xd8ab217f45809a44
	.xword	0xcdd9fc0023a233ae
	.xword	0x32045cb7c0c3e60f
	.xword	0x206f675b04d95045
	.xword	0x86a25aeb099e8bda
	.xword	0x170bf638ab83f5a0
	.xword	0xf405d71c8f462760
	.xword	0xc90908d0560d41ea
	.xword	0x890168fa776b7d8e
	.xword	0x7be6adfd5aff3248
	.xword	0x15dbc47421c13ede
	.xword	0xf99ab9812c5cc920
	.xword	0x6ab851d0f2b9c537
	.xword	0x43f0d7f50f929324
	.xword	0xea2f326dc715119b
	.align 0x20000
	.data
data_start_5:

	.xword	0x279d23b279beb85c
	.xword	0x39e73f1fbc7c26bc
	.xword	0x5d323c4f500b751d
	.xword	0xabf5f8ff8d60c8c7
	.xword	0xcb4f3b751106a679
	.xword	0x4761f0d70e765a7c
	.xword	0x056c7cf220cf270f
	.xword	0xfe1e4d3383052c56
	.xword	0x095a6c65c9078008
	.xword	0xdfed607619048003
	.xword	0x076c9280cf601e7a
	.xword	0xb59d375adee9cad4
	.xword	0xdb86e86c147b49cb
	.xword	0x0fab4af69a2dcb7f
	.xword	0x24ea721d4ba434bd
	.xword	0x3a7b7e7f5feb9ec8
	.xword	0x56f1d35142c861d4
	.xword	0x92885995f8364fb5
	.xword	0x1ef703de3719048f
	.xword	0x48df39028c07b390
	.xword	0xfca634965c5e9a96
	.xword	0x6274aafb596d038f
	.xword	0x6134850b5e1af341
	.xword	0x8915c1df359e2549
	.xword	0x980c047b3d9342f3
	.xword	0x58a38aeed2053acb
	.xword	0x5dca40ba0ff15146
	.xword	0xc4bf781b46adbb61
	.xword	0x785d7faef706b4d0
	.xword	0x08433377e46f4f4c
	.xword	0x0087f5c162ac7d00
	.xword	0xeadffbc4621ba282
	.xword	0x4b5c7a43b3c9675b
	.xword	0x9b21c62e3bb2dfdf
	.xword	0xc7bba4f49108d6bb
	.xword	0x32086e8381411b19
	.xword	0x203e067fe744d9b8
	.xword	0x4920f81b6efca3be
	.xword	0xfc05ca343daa48f5
	.xword	0x8017d2d2d728e270
	.xword	0x9ec8ddf1dae62877
	.xword	0x13a5ef9ddb58120e
	.xword	0x93d2219bdd1b2651
	.xword	0x8a4a746b811762df
	.xword	0x5d7e5d7f1fabf7ac
	.xword	0xd4a9ac5a505a52f2
	.xword	0x4ad8ce4296803e91
	.xword	0xc5569976a149d4ed
	.xword	0x0bff8ce9203f63e5
	.xword	0xaf28f0a5e83dd8c9
	.xword	0xf040c48f88fd08cd
	.xword	0xad27bb4b3afafe44
	.xword	0xc3b2eb85b12f0d2e
	.xword	0xd4da99399d5906b0
	.xword	0x3900ad544e5e70cf
	.xword	0x82069769b8ca41b6
	.xword	0xd59a13d07427744f
	.xword	0x437754083e935f11
	.xword	0xed7ae74713c343c4
	.xword	0x787a1078bcbcf537
	.xword	0xe497d094dd8def71
	.xword	0x14c6f11ceecb68f7
	.xword	0xafd0caa855680745
	.xword	0x263db6085d897e58
	.xword	0xc3e6ba4f09c58a05
	.xword	0xd51729e2303ff1cc
	.xword	0xf6cae0aa4a7cb3ea
	.xword	0x8724bf144d418609
	.xword	0x8240faa4eb2492d3
	.xword	0x9f978610a120736d
	.xword	0x1a84f7ca13ce1b82
	.xword	0x96eacab23dfced7d
	.xword	0xb6867429c0e19ff5
	.xword	0x2e95a9dd46c25a11
	.xword	0x1a4ba225ad4ddd8c
	.xword	0x7c0089c02b0d5814
	.xword	0xac092b83505853b0
	.xword	0x2fdb18f653ec58fd
	.xword	0x497a163a43fe4b96
	.xword	0x771892ca6451816b
	.xword	0x91109de55a7bf678
	.xword	0x1b4436271933de4f
	.xword	0xcf8be84c55173629
	.xword	0xf1ec2d2846e1e9cf
	.xword	0xecd21467258447f8
	.xword	0x966908a7c711b32b
	.xword	0x40307f81e722b276
	.xword	0x3b29bb1836dda4cc
	.xword	0xb69826df94aa9988
	.xword	0x676c31805a897b3e
	.xword	0x0a46fb4b2c8e77df
	.xword	0xe06fa11dbfb6393f
	.xword	0x3205afb9069ced01
	.xword	0x3468a0420785c669
	.xword	0xb0115f28abf26ede
	.xword	0x8225600adad35c16
	.xword	0x8110620dbd6e0f85
	.xword	0xd1230a8ea7f1bdce
	.xword	0x047e11b8d8e255b1
	.xword	0x5fb14f3a25a24f93
	.xword	0x43e19fff59ac30f2
	.xword	0x664a85fb3765e626
	.xword	0x4a6b6155f8a98b09
	.xword	0x359cf74b6c0aeb52
	.xword	0x514a88276fbd07dc
	.xword	0xf77bfa0fcfad3955
	.xword	0xec61112602286849
	.xword	0x9241651882ddd470
	.xword	0x4914eb0d012b7f8b
	.xword	0x8fb590a32e626f2b
	.xword	0x0cb5db0a9c848ff6
	.xword	0x9ef73019575ceb77
	.xword	0xfd1011e8a9d5a8d8
	.xword	0xcb3643a34c805962
	.xword	0xbe1cd33d135c3918
	.xword	0x9cdb9949450a82a8
	.xword	0x28e95480029bb07f
	.xword	0x4267f314c95bf8bf
	.xword	0xa25a49a4960f3377
	.xword	0xd335fbf0b15266ef
	.xword	0xf60b5e28526907d2
	.xword	0x19fb85d153c380f9
	.xword	0x2902c80c3e849387
	.xword	0x5fff99a0728aa472
	.xword	0x4dc1cd90b495b01a
	.xword	0x41f70d83255a0059
	.xword	0x4f1f4f57b17478c2
	.xword	0x29b0dd240def895e
	.xword	0x964e440e39230ede
	.xword	0x10e50020015e9cff
	.xword	0x6bc67497bea63048
	.xword	0x6632dd26f74778fc
	.xword	0x649c762e37e34c3e
	.xword	0x7a50252027ce6363
	.xword	0x0731b17d1d58d687
	.xword	0xeef1b5f3c0e48ead
	.xword	0x576694e685376298
	.xword	0xb1f26c92b6afb9df
	.xword	0x01c35969119de921
	.xword	0xa71627b232c7fe52
	.xword	0x9e0c29e1749cbf4e
	.xword	0x8395c6c573253078
	.xword	0x59a6b6e767b4be36
	.xword	0x67c7dce72fc6c6fb
	.xword	0x8290272a7d53542b
	.xword	0x700837084e340d14
	.xword	0x9c3ef0067c00f6ee
	.xword	0x93966be6a55ca165
	.xword	0x111c57ed3bcccc38
	.xword	0xede3b19df56ddd31
	.xword	0xdfedc7e7e63ae7d0
	.xword	0x70faa971a0abbda2
	.xword	0x3dd4b9c7e743ee1c
	.xword	0xfe2d53fe86a4c1e2
	.xword	0x257bc943612256ba
	.xword	0x3c51fa44b5b7f02c
	.xword	0xfd5741d3dcf73f5b
	.xword	0xec7b65d9fa348e93
	.xword	0xd69e31b19bc803c8
	.xword	0x4c3148f46d0ca6e9
	.xword	0xa49d722dd343adf0
	.xword	0xc9999bea2b075e95
	.xword	0xb0a2e1c9d108bf00
	.xword	0x17ee9dfc0981255b
	.xword	0xad6db8df03492bf5
	.xword	0x3232ed997b2d6bbf
	.xword	0x34cb3cf31cd305ca
	.xword	0xa36372f711c378ed
	.xword	0x79e1c3a62cd63a56
	.xword	0xe49f445fbb55798d
	.xword	0x3bf431b49cceab42
	.xword	0x55911877cae01004
	.xword	0xe3148ed914328084
	.xword	0x94196b9f926ccd65
	.xword	0xad816a3da128234b
	.xword	0x7d95ff0b25cca889
	.xword	0xb260038bce1e3fa5
	.xword	0x04f8181fcc4b34eb
	.xword	0x5ebd7aaaf1dd8a3d
	.xword	0x07b2b9f782023426
	.xword	0x23bb49b8dfcdc9fd
	.xword	0xe51315662f837bd7
	.xword	0x914f24c800cf0956
	.xword	0xebd602a45ce8cd09
	.xword	0x9e2ad8dbb0a4a5c3
	.xword	0x933c867952bd2ff9
	.xword	0xe6ed674cfbc4a2e1
	.xword	0xd78ccb5e4b625fd2
	.xword	0x8605203d5593a723
	.xword	0x3ca518e726abe013
	.xword	0x84f8459bef8d2a18
	.xword	0x6eaad5341a79c69e
	.xword	0x4833e5572f110c59
	.xword	0xfbeac36fb6979636
	.xword	0x488c14c1351ca674
	.xword	0x9daf5b9fc9086299
	.xword	0xf85cd63ffcdea76f
	.xword	0x77b097ddfacc2679
	.xword	0x5e785e6b8dc7caa8
	.xword	0x0157d8991252f4ca
	.xword	0xe63972bf3750fb94
	.xword	0xe34b678e502a5407
	.xword	0x09284c6a9753d472
	.xword	0xc8e67d3d5c35e596
	.xword	0x4b7748c477c5a0ee
	.xword	0x48403b2005996c61
	.xword	0xd0d8726f0b1b6de2
	.xword	0xa93a29008fc268ca
	.xword	0xc39f1e168bbed746
	.xword	0x67fb4f6600a880da
	.xword	0x5d6994dd3fa2f4a0
	.xword	0x725e611098acbd83
	.xword	0x9f0362827574c3fa
	.xword	0xc86dcbe62fecc28f
	.xword	0xd096a2f181b283b2
	.xword	0x88a91009cb5afde6
	.xword	0x838d79158ffe71e2
	.xword	0x52d192d2b8e4b7fb
	.xword	0x64afe0aa67142ece
	.xword	0xb592a04095f673e7
	.xword	0xa3a9c37f3dace9dc
	.xword	0x2440d44a6ce8208c
	.xword	0xa7938d2371e77443
	.xword	0xe840ff6f4f3ba90a
	.xword	0x051ce62608de6533
	.xword	0x8d68b0b9501296ee
	.xword	0x97519551a1d9d7ab
	.xword	0x7d20420c7946d900
	.xword	0x0741b432051abf09
	.xword	0x4baadfab187838cf
	.xword	0x25aaa1331696223c
	.xword	0x06ba9563cb03428e
	.xword	0x2f2e4cfa633306e7
	.xword	0x9f8e268a29e53e4f
	.xword	0xf7e20d0f9e886d78
	.xword	0x3856ae64c46ffefb
	.xword	0xb7f70dc8674506f3
	.xword	0x6cca63f8a4199654
	.xword	0x3d41d4bbf9b0abf2
	.xword	0xa13e6b5b39585e97
	.xword	0x3659fda0241e1ee9
	.xword	0x76c7fd7971c2ed13
	.xword	0xff2de273922cafd7
	.xword	0x6601d16959fbdc84
	.xword	0x311e4a9a8b90acd0
	.xword	0xe6debcb13e3123ac
	.xword	0x02d5ac4ff1082b97
	.xword	0x2434d6e3beedbf70
	.xword	0x2d2793d2fcdd3b8e
	.xword	0x30540749556be597
	.xword	0x3ca4f2650d515b71
	.xword	0x6afe319f8ccf356a
	.xword	0xa46fd0ad67bdfc7a
	.xword	0xc7319267bea03566
	.xword	0xd6c680d2ea60e68c
	.xword	0xf6d32d9d6f17a212
	.align 0x40000
	.data
data_start_6:

	.xword	0xd69e02171f2c3e2e
	.xword	0x008e4dfbe0d2b742
	.xword	0xca48dfb998b0b52f
	.xword	0x2460fca39a2aa6a5
	.xword	0x04b28ec62fe35e7b
	.xword	0x488b7641084edc98
	.xword	0x920e84b626b1019e
	.xword	0xe5bff6af99f259e4
	.xword	0xc45d86fd8da29280
	.xword	0x80aa6d68ea36eeae
	.xword	0xd0bf3406e316e32f
	.xword	0x0d218b7381a50566
	.xword	0xe369de172622ecbc
	.xword	0x1dd8aa54e899c45c
	.xword	0x9ef147952e490694
	.xword	0x06e98a9e496785d7
	.xword	0xeaeca1a2026f5c40
	.xword	0x40408375d957423e
	.xword	0x4770a20ba4e21167
	.xword	0xf09b8a84199eb42b
	.xword	0xcfcc762efe4b4b35
	.xword	0x1d2462adef30ae78
	.xword	0x9fc233adfb51f868
	.xword	0xc659c008e9f80afa
	.xword	0x88b67e649318d63f
	.xword	0x5de4c1c48bedc60f
	.xword	0xbe9625afaabb343a
	.xword	0x4b4b6ff3ba1e8f6e
	.xword	0xa2fe634a4fd679d5
	.xword	0xae3aac6f4546463a
	.xword	0x35200ee792534e04
	.xword	0x12f6fea9e5e17ea4
	.xword	0xc82beafe7510b669
	.xword	0x77123e702c86865a
	.xword	0xd2932293383caec6
	.xword	0xf6c99d4ee944cd1b
	.xword	0x558d51c0bc125fc7
	.xword	0x5d96d58c6189ce93
	.xword	0x679d600a96465805
	.xword	0xd0171aa2d1dfd59a
	.xword	0xd663a3e7218b27d4
	.xword	0x425ac1548e463efb
	.xword	0x5611814e8961ae41
	.xword	0x49dec8b1c173f05e
	.xword	0xc139a176c3aaa4ca
	.xword	0x6123b05488bc6142
	.xword	0xfd18e194b287a86d
	.xword	0xaefdae2eb612508c
	.xword	0x62a3379e765a79cc
	.xword	0x58b0ba0004733c81
	.xword	0xaa5d392af3bfeb83
	.xword	0x4f470a74ad7fab35
	.xword	0x834aec991888c79f
	.xword	0xd9b9695c6888b3fd
	.xword	0x40f7b0ee79d9ecfe
	.xword	0x44da403674188ebb
	.xword	0xfc03991be7db56d2
	.xword	0x7d24f493fac836f9
	.xword	0xd7ed4550b5c4347a
	.xword	0xe4a94b915f58b744
	.xword	0xc5a2d46a4cc277bd
	.xword	0x7195f729ec200cde
	.xword	0xc335f6ca69793d90
	.xword	0x4a91ab4596f8f9d2
	.xword	0x3f85b60f250736a0
	.xword	0x844781a8440d3c31
	.xword	0x4de999a98d46e625
	.xword	0xa977a9412b88ab67
	.xword	0x79ef523cb0ea2152
	.xword	0xc47c8111bf7c0fea
	.xword	0xdba0fdd026fc7a2c
	.xword	0x0d522c5f22883e7b
	.xword	0x7ab7bac203ab4215
	.xword	0xbda515be4f711365
	.xword	0x946f410d1a47afb9
	.xword	0x35e8758dfe12498d
	.xword	0x12eeb0105579b60d
	.xword	0x24af61177e0ced16
	.xword	0x65bb685f8209d9ff
	.xword	0x2e4ded5ca0b37bf5
	.xword	0x7c5344c556fcf1c0
	.xword	0x6bd2cd33e426807d
	.xword	0x311de812ecd378a6
	.xword	0xe2ea4114d9545412
	.xword	0x1219fba58d133f6a
	.xword	0xaaf20255f389f8db
	.xword	0xe4c1da7c5d247cde
	.xword	0x3b0db612df38cf30
	.xword	0x41e8af6641294224
	.xword	0x6360e510c1f242cc
	.xword	0xb4124f5e8ef1f4e0
	.xword	0x06baaf66c2489f91
	.xword	0xb03eb910072172fa
	.xword	0x212c0483c09a880a
	.xword	0xb93cb4a148c08aeb
	.xword	0x4323034073caef1c
	.xword	0xec3adf8fa2063f78
	.xword	0x6f536ea6a1f2c656
	.xword	0xbfcd26280fc970ae
	.xword	0x4fb20052df0a6ca0
	.xword	0x5d1762df01976305
	.xword	0x45b36d088afe08a4
	.xword	0xaf07ecef288a7d32
	.xword	0x8ef9f3ec785e4664
	.xword	0x6bf3f9a9e2540d68
	.xword	0xfe1e8b756f8a9617
	.xword	0x759b8f945bd02768
	.xword	0x7e94981b0ee5a6a0
	.xword	0x8d5a2e6ec0e54027
	.xword	0x5e61b1a00cb47cdf
	.xword	0xff3dcd674cd91144
	.xword	0xdd411f4f17701e9a
	.xword	0xc74dce48560a9449
	.xword	0xf068cc97bc312b9d
	.xword	0xf211cef19ce5527b
	.xword	0x8fd94b7a5445f52b
	.xword	0x04c239f97a44eab9
	.xword	0x32bb087d53194486
	.xword	0x15fc0fd3cfce3327
	.xword	0xa68494a824876cab
	.xword	0x2f9d44ccdd4af906
	.xword	0x64b9d720859bf186
	.xword	0xc8c553bc7b08ed8b
	.xword	0x5487bbba8d4c9fe0
	.xword	0xa890897a0ec25c9b
	.xword	0xdceb93ea26030081
	.xword	0xdb74c578ce1e3c77
	.xword	0x3e426f9bfc6493bc
	.xword	0x1d013ca9c5708e4e
	.xword	0x21303a86bd9e8d3d
	.xword	0xd9f1db4a4a2ba068
	.xword	0x10db6e02a75ff8bf
	.xword	0xe8bf1cb5d211aed8
	.xword	0xeac657f4367087fd
	.xword	0x5c33858dae11cc1b
	.xword	0x6aef463fe9de7c68
	.xword	0xcd4b151af5b8741a
	.xword	0x7afc29ef5d8af71d
	.xword	0x603f2db50d3317c2
	.xword	0xb3b704613fc8c598
	.xword	0x6d51620971a012f0
	.xword	0x3bb59fe76f229d8a
	.xword	0x5a0b1bdf669b0ce0
	.xword	0x5f66b0bf86a2c882
	.xword	0x957c80fbc9c2abfb
	.xword	0x8b09488a89ae4575
	.xword	0x2345bdee1c59ab06
	.xword	0x787ec184a7182286
	.xword	0x948cfd5b88897bb9
	.xword	0x9752a05d87839687
	.xword	0x5ad53c79e84ad5d9
	.xword	0x2514f23e5c13069e
	.xword	0x1f41b0abab9979bd
	.xword	0x79f1253e01bb8183
	.xword	0x40727d6fd3d70e28
	.xword	0x53459eaa01c172b9
	.xword	0x5376bab42731b259
	.xword	0x3faf4fd1a98d840d
	.xword	0xa88c496656810459
	.xword	0x0b20437a247efdca
	.xword	0x8d982db56415e412
	.xword	0xc6fe9109881ffffd
	.xword	0xd80bd723be3dd5fd
	.xword	0x0368b7ddda7cf159
	.xword	0x4df944fa723250e2
	.xword	0x02cad5bd3deedc52
	.xword	0xca105178c0d9a308
	.xword	0xeb8994cde057952a
	.xword	0x3dcd07ded1e12830
	.xword	0x945430bef086a8da
	.xword	0xeca11c95b2f1e037
	.xword	0x4ba9f29a4592d071
	.xword	0x71814854cdce2ecb
	.xword	0xe74d32f092d8c0d6
	.xword	0x1c9c448889b89d86
	.xword	0x0f40a1706f509a05
	.xword	0x2341a138f24d55d9
	.xword	0x31bc5fcea1f57ced
	.xword	0x0ea552ac00ab78f0
	.xword	0x9da0e593a58d4c9e
	.xword	0x959fee88e94a56a1
	.xword	0x8ebfdcb9230b7872
	.xword	0x4f9c9c0f4f8c0cc8
	.xword	0x83628175c4b65b70
	.xword	0x8ea1098693174af1
	.xword	0xc9f99e41f9dacd11
	.xword	0x6bf935bfd33f5939
	.xword	0x547635dd63d94d7a
	.xword	0x78a3bf0983e0c31a
	.xword	0x085ad896ebc4fb5d
	.xword	0x4c116d50f49151dd
	.xword	0xc59c9232702ddbd9
	.xword	0x482d5496c0ba5653
	.xword	0x2b30d8b530c9223b
	.xword	0x64cf21d271726269
	.xword	0x7b266e118d0e67e7
	.xword	0x7f1152f57d56f04b
	.xword	0x79df3e2d5d02eb7e
	.xword	0xe5719855d6951ff3
	.xword	0x1c5e8e577810168a
	.xword	0xc37fda8f183a5e46
	.xword	0x47ee78198686dba9
	.xword	0xfe03aa8b02a126eb
	.xword	0x6ae12315ffeca3d9
	.xword	0xbaf6719ca8ccdd5d
	.xword	0x69aab69e66306733
	.xword	0x6f36223b6156513c
	.xword	0x7e34c1fb6ef26d57
	.xword	0x8e6c91454cff02d5
	.xword	0x2070ed203972754f
	.xword	0x2f2d2985d740146f
	.xword	0x4c5c77957b80c516
	.xword	0x5233d3ccce74925a
	.xword	0xa66ee677cd3fc5e2
	.xword	0x7cfd593270744e0c
	.xword	0xff125039a391d89c
	.xword	0x6f0748e718e8dbfe
	.xword	0xed0373502c5dfece
	.xword	0xbbc5dcf6ded49b5a
	.xword	0xb447c959ce56cfaa
	.xword	0xc1503f02b8ff603a
	.xword	0xe4751f5e23049d44
	.xword	0x202de5cc3b7274d2
	.xword	0x221bc1cc96c75e2b
	.xword	0x0dc4fe7838814026
	.xword	0xb08ae9b29ab0b18f
	.xword	0xed765cf8046a3609
	.xword	0x7fd4db0972f5d5d5
	.xword	0x25757787ab631f9f
	.xword	0x6fe89ddac35430c9
	.xword	0x7e16c4c67cbf852b
	.xword	0xd34f81f656ae860a
	.xword	0xe4727b8e579eca3b
	.xword	0xa75cfb2a7059e63a
	.xword	0x9f839e5968d367fb
	.xword	0x7f9e17cb0c16921b
	.xword	0xac226122c61d752d
	.xword	0x5c7b4e104c831a3b
	.xword	0x0417177986c665c1
	.xword	0x46fb4f92340b05f0
	.xword	0x9f8b65f7c8e3ce40
	.xword	0x1a63414aeefa5d08
	.xword	0x38749bc73e1994f2
	.xword	0xc523aa74deca6d3c
	.xword	0x52857a992e0ac49c
	.xword	0x5d7788460db84945
	.xword	0xcc738620932a32c9
	.xword	0x4d46982f5fb37228
	.xword	0x98abe6c4c93c6708
	.xword	0xbd7ae06ff0d6936a
	.xword	0x3fc531f6331a347f
	.xword	0x814125b25d344339
	.xword	0xee14d7643b8cc6e3
	.xword	0x341b65c001ab4fac
	.xword	0xcc2bc5687df17840
	.xword	0x14da1b03fcc9c7c6
	.align 0x80000
	.data
data_start_7:

	.xword	0xe849caf1a014b272
	.xword	0x648911f447aa54cf
	.xword	0xe09dbb355c998404
	.xword	0x1192e1f35266a6dd
	.xword	0xaadfa07b77d01c52
	.xword	0x6ea4976d132c7449
	.xword	0x3f7046e00982565e
	.xword	0xbfbe88f078d610d1
	.xword	0x6134a00df6783a4c
	.xword	0xd6110917abd29356
	.xword	0x49beb35e6a31f108
	.xword	0x3486a04037f7e9b4
	.xword	0xaaad2dbff8328d48
	.xword	0xaa0d25fb7f83a8d7
	.xword	0xaafbfe88d6d5cbfa
	.xword	0x47c5e1ad27570b38
	.xword	0x9aa5bd424e6d32c4
	.xword	0x148f40f9f6d51580
	.xword	0x515f4caf3ae5f412
	.xword	0x34d412b9d08b134e
	.xword	0x9fad4716311885e2
	.xword	0xc51ea88cbf3d29b3
	.xword	0xf110a2aac7dbb011
	.xword	0xdcd8d5958fb2378a
	.xword	0xdece6c5c933bd937
	.xword	0xfb58bb5c5813ba97
	.xword	0x3b1301b9a6e6a2b2
	.xword	0xc8b3fe57010fb734
	.xword	0xe35d529016197573
	.xword	0xf80c8f0f246cf537
	.xword	0x16ee1edfafd8bba2
	.xword	0xbe2ec802f04c19fd
	.xword	0xf0ea3e821d9b58cf
	.xword	0x11ac769373dae786
	.xword	0xced23e46db6932ce
	.xword	0xe19d27f0e3cba4e4
	.xword	0x8cd361b4131cac8f
	.xword	0x799104aa2a919283
	.xword	0x73ceb10ad1c99b7e
	.xword	0x8cca8504ea31de8d
	.xword	0xbba0add56ad8703a
	.xword	0x7c76a4efe1266c55
	.xword	0x50fe0a339e7337fc
	.xword	0xe10d0f1f1d705657
	.xword	0x53e5dccb6ff2b638
	.xword	0x8a983c2cd3c3a5eb
	.xword	0x1ea052ad32cc3377
	.xword	0x6e5bfe793f5d2413
	.xword	0xd1f1290eca3511d6
	.xword	0xc1e5084253f116b8
	.xword	0xa4eb3d0c46b927ea
	.xword	0xfc394f6e81cdd264
	.xword	0xa298434d7d0ed4dc
	.xword	0x2f3048d748d1b204
	.xword	0x4b7e14e2e2beb9a0
	.xword	0xe4043aa97c967e65
	.xword	0x1991f853e35623b0
	.xword	0x06a0c05dd5087fe5
	.xword	0x65ef02e3ced9614f
	.xword	0x5616bbf4c6987965
	.xword	0x6d7af8c130feaedf
	.xword	0x9ad0323a99e876e1
	.xword	0xe4a948f82cd10ee8
	.xword	0x58981cd1ddd89664
	.xword	0x0b75a98173fb4544
	.xword	0x7376fbdbc8096957
	.xword	0x75f004acaf0430fd
	.xword	0x930065c4678bb681
	.xword	0xd3cdb697d0b73eca
	.xword	0x2f66e8f6b2a4ee5a
	.xword	0x05b911d318fe2349
	.xword	0xa0190cb39e447152
	.xword	0xd708c4f86bd18a92
	.xword	0x2f68ec1e0bc4da08
	.xword	0x2bd79da1e4a2ba20
	.xword	0x33fc76ec1dd5f7b1
	.xword	0x3385d26e5aa2f20e
	.xword	0xe936b396aa357856
	.xword	0x70e37b8509521ce2
	.xword	0x3f8433d2866df761
	.xword	0x3313203645e369bf
	.xword	0x9b989d619685de88
	.xword	0xea1d0b403b2c932c
	.xword	0xf9439bc0d4f8b7ac
	.xword	0x666ccd29f99fd94d
	.xword	0x4c339dc10ea16251
	.xword	0x769626527e69cd8a
	.xword	0x8d4fc58855692697
	.xword	0x523d326a512b5cb0
	.xword	0x0aac5092c4b483ad
	.xword	0xac7b6d784ce9bcf7
	.xword	0x881d3557e4e61ac8
	.xword	0x3c147197e41c161a
	.xword	0xf85dc9ef7219c74b
	.xword	0xe9f780adfd1cf74b
	.xword	0x5f0ca95af6900c4b
	.xword	0xb60b0b294230a6e1
	.xword	0x85f6f1daa952a546
	.xword	0x8ec10237b66c0da8
	.xword	0x5eea22798291d6a2
	.xword	0x1723686fd07dfe54
	.xword	0xe89adde745c6afc8
	.xword	0xea9c22486251978d
	.xword	0xf38d57116841e7c4
	.xword	0x0c7fcd9e2ab796b6
	.xword	0x8429c3a08a8e5507
	.xword	0x61b5c0e76811553f
	.xword	0x0cc8f3ced53f05ac
	.xword	0x271c96d4db89dc43
	.xword	0x05b136d6f1911c62
	.xword	0x1ac9a7c621ed50a2
	.xword	0xa9823d34b3e0751d
	.xword	0xd5ada19be5e1fff9
	.xword	0x28e9c9fb3cbd504b
	.xword	0x6afaf0d5dd68a4ff
	.xword	0xde761ff97f0e7582
	.xword	0xbeefcef716faed35
	.xword	0x9bb0bf6cc5a2f59b
	.xword	0x352d9cb0eac377b9
	.xword	0x0109dfa288266542
	.xword	0x3988d0ba5713bf41
	.xword	0x43bd857da756e6a6
	.xword	0xbcc128dcbdee8ac1
	.xword	0x52baf3509dbee771
	.xword	0x1cb31e5c8d2159a0
	.xword	0xd270f09d7a5f37ac
	.xword	0xce2f0b8030777e3f
	.xword	0x7f4840d5f8922c11
	.xword	0x1be91241a5dab15b
	.xword	0x26727c89a437c5be
	.xword	0xcaedef4b72653160
	.xword	0x02b933f9d947a185
	.xword	0xa748141b722d20d9
	.xword	0x4279c0d26b18d9eb
	.xword	0xe459866851e781ed
	.xword	0xadd63b8856013896
	.xword	0x0de15355cd03198a
	.xword	0xc65c45fb14ee3131
	.xword	0x317a525ef92a0d9a
	.xword	0xc902dddf028cb465
	.xword	0xc17d8140f6028758
	.xword	0xf2e5e6af6e0a79d0
	.xword	0xfaaca27cdd076f4e
	.xword	0x87d1d682926abcc1
	.xword	0x871726cf881e9148
	.xword	0x31ddbef53656499e
	.xword	0x3c8b7e055d86fa43
	.xword	0x5bac35378b38ad6c
	.xword	0xc6a6826b65cf5cf7
	.xword	0x5dcc201547d9cdc4
	.xword	0x7e80205c69455d0a
	.xword	0xa4179d607c9c40ce
	.xword	0xfcdd6addf851a06f
	.xword	0x89e6661cd28a7948
	.xword	0xe02fe5b9e3cd4c4c
	.xword	0x5a96612cf878ca1d
	.xword	0xe3565f24f3181926
	.xword	0x8eb773cba0b56356
	.xword	0xb92d44ee438aaf22
	.xword	0x600ce7b10cfd7e18
	.xword	0x22e846af237cb29b
	.xword	0xa14c24432d94247f
	.xword	0xf9af99d489f89f99
	.xword	0x359d20b06e3a154f
	.xword	0x1f9c286e454df551
	.xword	0x183f7b5a3fb80145
	.xword	0x45e6f5c2c5288607
	.xword	0x7a48c3575d8a694d
	.xword	0x91eeba5636374ee3
	.xword	0xaa55ca808a0ca645
	.xword	0x05668f2720264901
	.xword	0x085e1538336c6de9
	.xword	0xf9028013ba5be88b
	.xword	0xf84a16a28a792235
	.xword	0xa84680a24821af94
	.xword	0xbaad3873ea972eb8
	.xword	0x47e80288d22a2642
	.xword	0xe05626a91f22a108
	.xword	0xfb02698c263e0a4b
	.xword	0x75a29908f4b0bbdf
	.xword	0xfe4782d6fa8498ae
	.xword	0x3d41541bb41f1664
	.xword	0x99770ef7ec669893
	.xword	0x354e5a0722e0aedb
	.xword	0x0f9af6972d143023
	.xword	0xc1249dc1016b052f
	.xword	0xb3a2054c4fdd3f92
	.xword	0x96f8b94afe206a29
	.xword	0xb68fbf6c840293d0
	.xword	0x36bc4515a4e9e3df
	.xword	0x69aa9207cb0be645
	.xword	0x1b9ca9eb04772439
	.xword	0x7800435e0b5d119a
	.xword	0x4473fd7e7967e5ca
	.xword	0x22d0f3ba71b5407e
	.xword	0xe3cbeb88b8b702e7
	.xword	0x5110f7360988c26e
	.xword	0xb5dba8355be66d7c
	.xword	0x7ef14f6f34cec77d
	.xword	0xb9be8ca2135ab60d
	.xword	0x9e16ce6aa6c53afa
	.xword	0xc87bef96eaf7d7b7
	.xword	0x9bae8a6cdacce3fa
	.xword	0x69a39e97db921e79
	.xword	0xaf510a086207171e
	.xword	0x14df6f05b5e38e87
	.xword	0x8b2ab17a460e73c9
	.xword	0x2169b0f3925a6e15
	.xword	0xfe9b40e8c5f19a36
	.xword	0xb02b22f8cab7816b
	.xword	0x9f8d17a67281a0dc
	.xword	0x73fe53da2ac173b0
	.xword	0xb0c71008f63b2c7e
	.xword	0xcf9a7ba4ac6fe141
	.xword	0xa9c5636a7da882fd
	.xword	0x7f0ab45d21c57ce1
	.xword	0x3f9cf11dbda23935
	.xword	0xc9b923dffd84d9ba
	.xword	0x200d41316abf67a6
	.xword	0x84452b45da60fca6
	.xword	0xbd0adfef89f8ba62
	.xword	0xd3f51566903f2f49
	.xword	0x46ad7261b197d18a
	.xword	0x242e085854f7b3e2
	.xword	0x60cfc461a2a2707e
	.xword	0x4176ecb8f881c1cd
	.xword	0x111380dac9ec3c29
	.xword	0x8872095a85af777c
	.xword	0x4d09faf17890c8fa
	.xword	0x1d26bc26a09fb825
	.xword	0x4bead0a304bf9fc9
	.xword	0xf1872d05bc03c8a3
	.xword	0xc5766e1930459dbd
	.xword	0xbbcccf3f1f303a28
	.xword	0x3253cd67857aa9bb
	.xword	0x5b21c92bbee98d75
	.xword	0x87b0cd77a5627c76
	.xword	0x2a36f2dae4334583
	.xword	0xbc6418be67008174
	.xword	0x8dac7c40fe33eef3
	.xword	0xd13f07600aae4086
	.xword	0xe8d753f6d38ffa52
	.xword	0xb164aa9b06080fd8
	.xword	0x3e0473f90871c920
	.xword	0x213c08be0b33be13
	.xword	0x81fce70c58e2bbe1
	.xword	0xa8cf90a45c93ad0a
	.xword	0x59c05586ca21247c
	.xword	0x255de383ab7d3e85
	.xword	0x267d15faa128eb29
	.xword	0x1388e35a4ebbfb54
	.xword	0x16fc93e5d2033de0
	.xword	0x2c77c4f5a8c459d5
	.xword	0x51fa101b5ab50c7d
	.xword	0xa47cf2c70e8fb167
	.xword	0xcbaec7a6200e8b6e



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
