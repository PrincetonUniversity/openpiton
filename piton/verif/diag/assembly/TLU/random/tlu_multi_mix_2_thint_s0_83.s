// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_83.s
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
   random seed:	494458811
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

	setx 0x791c42a37ee03c9a, %g1, %g0
	setx 0xc9171e11f17b7ec4, %g1, %g1
	setx 0x3b899536410b2d50, %g1, %g2
	setx 0x318a780baf1e9061, %g1, %g3
	setx 0xb5f5b9c3b7518861, %g1, %g4
	setx 0x2c8ea4cd6c84cac2, %g1, %g5
	setx 0xe26d3511d1cbd3ac, %g1, %g6
	setx 0xfc207a362e4bcee5, %g1, %g7
	setx 0xcbd3892f1fd7ad79, %g1, %r16
	setx 0x430ced661f6c66c4, %g1, %r17
	setx 0xcc296cbe4293793a, %g1, %r18
	setx 0x70d4f5556352be2b, %g1, %r19
	setx 0x51780c9b24cbfcbe, %g1, %r20
	setx 0x0d9ffb0beeab3de5, %g1, %r21
	setx 0xf35d32978042077f, %g1, %r22
	setx 0xfd979a7a627be706, %g1, %r23
	setx 0x3a1f1058da943de6, %g1, %r24
	setx 0xfd8aa7358eea932a, %g1, %r25
	setx 0x0c7b10df3912abf2, %g1, %r26
	setx 0x55a01b6d737a2eb1, %g1, %r27
	setx 0xcda3112045fa4524, %g1, %r28
	setx 0xb52b17bc27bf10fd, %g1, %r29
	setx 0x3cae007f83374e5a, %g1, %r30
	setx 0xba616ae8a6802d61, %g1, %r31
	save
	setx 0xb4369d21b7b5c153, %g1, %r16
	setx 0xeea9197682ed382f, %g1, %r17
	setx 0xe71f2cd016ad1397, %g1, %r18
	setx 0xa6d8d19396c77056, %g1, %r19
	setx 0xdcf56e0ef5158280, %g1, %r20
	setx 0xbfce903524631f10, %g1, %r21
	setx 0x33c47f65fafcda87, %g1, %r22
	setx 0x8fb6676b2bd1be57, %g1, %r23
	setx 0x1f46cd7e377dd4a6, %g1, %r24
	setx 0xf686b658e12aff3f, %g1, %r25
	setx 0x84c68bda8415eed9, %g1, %r26
	setx 0x421c81e64406bf4f, %g1, %r27
	setx 0xed977cf666496b60, %g1, %r28
	setx 0x43c4ef54a2226101, %g1, %r29
	setx 0x6a5d1b79ac7a1c4f, %g1, %r30
	setx 0x6f26ab5409a5ae6e, %g1, %r31
	save
	setx 0x92749f7622171daa, %g1, %r16
	setx 0x493f8cb4272af9ee, %g1, %r17
	setx 0x6e91757494011dc1, %g1, %r18
	setx 0x540bd04660c42a63, %g1, %r19
	setx 0x98a0abc1bdf7ded8, %g1, %r20
	setx 0xd252bfe943c19515, %g1, %r21
	setx 0xd9b94f13563db6b9, %g1, %r22
	setx 0xdfa7e882442d6554, %g1, %r23
	setx 0x9449a2b93b419df1, %g1, %r24
	setx 0x4995bdf4984f520c, %g1, %r25
	setx 0xcc5be8d0cdcfc09b, %g1, %r26
	setx 0xd01d4a79fc54bfae, %g1, %r27
	setx 0xf91d01cf11c20304, %g1, %r28
	setx 0xb6cffae9c950d88e, %g1, %r29
	setx 0x44db756f86457279, %g1, %r30
	setx 0xbad6933b292df5fe, %g1, %r31
	save
	setx 0xdd50072145b8f3f7, %g1, %r16
	setx 0x9ab7d2971fbc19c8, %g1, %r17
	setx 0xbeac0b727792a57a, %g1, %r18
	setx 0x2d69f1dcbe3f79b1, %g1, %r19
	setx 0xd885c14c2528b1c8, %g1, %r20
	setx 0x314a7d93e24b5b13, %g1, %r21
	setx 0xe7f041e14435e85e, %g1, %r22
	setx 0xa8c755759851e5d8, %g1, %r23
	setx 0xa3f09d9346b8f5b0, %g1, %r24
	setx 0x5e1ecaa18017fa19, %g1, %r25
	setx 0x92232a12d91fb5ab, %g1, %r26
	setx 0x41cc42565f88a2b4, %g1, %r27
	setx 0x82bb2a13f66b583d, %g1, %r28
	setx 0x9216e9382b0823b5, %g1, %r29
	setx 0x202a27a820b14070, %g1, %r30
	setx 0x2556362ad77ec2a1, %g1, %r31
	save
	setx 0x9e7e59b1797f22ab, %g1, %r16
	setx 0x73432f8dc3a9fe5d, %g1, %r17
	setx 0xb8e86f5d5571f6f7, %g1, %r18
	setx 0xa3e301be2da6b9be, %g1, %r19
	setx 0x03f9853ebfb1c07a, %g1, %r20
	setx 0x267f1a6c9bde244a, %g1, %r21
	setx 0x943829a931e76dac, %g1, %r22
	setx 0x37ba223f2474bc00, %g1, %r23
	setx 0xaf4e2f417ae77dd7, %g1, %r24
	setx 0x7df3f25b321476d3, %g1, %r25
	setx 0xaf9526c5d7a29535, %g1, %r26
	setx 0xc16dad88bdfafe61, %g1, %r27
	setx 0x31cb6d0edb6e573b, %g1, %r28
	setx 0x65b65a7f3c2d8725, %g1, %r29
	setx 0xa9b178c6ccdbf519, %g1, %r30
	setx 0x8389b52567ee0a05, %g1, %r31
	save
	setx 0x2eb1523ff1bec8b6, %g1, %r16
	setx 0x9ef57ef96e2b8cad, %g1, %r17
	setx 0xfd09dcd575ae34a2, %g1, %r18
	setx 0xb3ab949207248c25, %g1, %r19
	setx 0xe72b2274fc7613a4, %g1, %r20
	setx 0x9c71a453d9a9e23e, %g1, %r21
	setx 0xb46a0864c156b409, %g1, %r22
	setx 0xbe703ee8cc4d83cf, %g1, %r23
	setx 0x38e15828ebe8e427, %g1, %r24
	setx 0xb98be4cffba322fe, %g1, %r25
	setx 0x8a69d3d88617c8bf, %g1, %r26
	setx 0x1985a213d05e5c5a, %g1, %r27
	setx 0xf0d988a1dd1a85cc, %g1, %r28
	setx 0xdff5e0c0dfbff9ac, %g1, %r29
	setx 0xfc60e0e0d50a9b69, %g1, %r30
	setx 0x8348215d03015183, %g1, %r31
	save
	setx 0xec818d7cf98ff828, %g1, %r16
	setx 0x44d0b2ffe69aee3b, %g1, %r17
	setx 0x47a27ac6bd08c203, %g1, %r18
	setx 0x3e23523b5e3e47ff, %g1, %r19
	setx 0x77334f49a2f31e39, %g1, %r20
	setx 0xc023fce7bfa6bb8e, %g1, %r21
	setx 0x8d0dcf454ed9e510, %g1, %r22
	setx 0x1569bfcb4e78f493, %g1, %r23
	setx 0x19c7a348ea621cb5, %g1, %r24
	setx 0x0d18158fd2cb7361, %g1, %r25
	setx 0x557106aa597f2a61, %g1, %r26
	setx 0x852df1efa3e6e1a9, %g1, %r27
	setx 0xa6db12981a25fbdd, %g1, %r28
	setx 0x70ef8e9f3a9c4eb8, %g1, %r29
	setx 0x09b443b9ab98c280, %g1, %r30
	setx 0x210a1725823e9c01, %g1, %r31
	save
	setx 0xdda40da4e95ea38d, %g1, %r16
	setx 0x1d90a08d12616669, %g1, %r17
	setx 0x653426c818881a75, %g1, %r18
	setx 0xf02cb798ad103d66, %g1, %r19
	setx 0x769f1e8ee05dd6e1, %g1, %r20
	setx 0x2af6b76b67e32877, %g1, %r21
	setx 0x0f61b6e646746d53, %g1, %r22
	setx 0x0e9594b217d49aad, %g1, %r23
	setx 0x1dc2f0d5f20d32a9, %g1, %r24
	setx 0x5efc7881e0256b29, %g1, %r25
	setx 0x4662be18a3a2a5af, %g1, %r26
	setx 0x1d3a1ae8b7e91720, %g1, %r27
	setx 0x9c8ef834ed235acb, %g1, %r28
	setx 0xab58b2f865407777, %g1, %r29
	setx 0x2cce6528dcac74ac, %g1, %r30
	setx 0xa596e723d81b2bc9, %g1, %r31
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
	.word 0xb9e5a0e3  ! 3: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x83946116  ! 4: WRPR_TNPC_I	wrpr	%r17, 0x0116, %tnpc
	.word 0xb1e461e3  ! 8: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e560f3  ! 10: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe421c4  ! 13: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5a124  ! 16: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca560cc  ! 19: SUBcc_I	subcc 	%r21, 0x00cc, %r30
	.word 0xb5e4a116  ! 21: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9345000  ! 22: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xb69de13d  ! 23: XORcc_I	xorcc 	%r23, 0x013d, %r27
	.word 0xb5e5a0b3  ! 27: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e421d2  ! 30: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e4e1d7  ! 31: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe52150  ! 37: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb48c8000  ! 40: ANDcc_R	andcc 	%r18, %r0, %r26
	.word 0xbbe5e1e6  ! 42: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e42079  ! 48: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7540000  ! 56: RDPR_GL	<illegal instruction>
	.word 0xbb540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xb7e420fa  ! 59: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xba9ce040  ! 61: XORcc_I	xorcc 	%r19, 0x0040, %r29
	.word 0x8794a0ed  ! 65: WRPR_TT_I	wrpr	%r18, 0x00ed, %tt
	.word 0x8195e026  ! 68: WRPR_TPC_I	wrpr	%r23, 0x0026, %tpc
	.word 0xb3520000  ! 70: RDPR_PIL	<illegal instruction>
	.word 0xbe2d4000  ! 71: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xb3e5a184  ! 76: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5a040  ! 78: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4e0dc  ! 80: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9518000  ! 82: RDPR_PSTATE	<illegal instruction>
	.word 0xb204a0a6  ! 84: ADD_I	add 	%r18, 0x00a6, %r25
	.word 0xbfe460c5  ! 86: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4e1d2  ! 90: SAVE_I	save	%r19, 0x0001, %r28
	setx	0xdc6f674600005cd2, %g1, %r10
	.word 0x819a8000  ! 92: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r19
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 103: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5e17a  ! 110: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb88da1ce  ! 111: ANDcc_I	andcc 	%r22, 0x01ce, %r28
	.word 0xb1e5200c  ! 112: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde56004  ! 113: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4e1f1  ! 116: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x919461e5  ! 120: WRPR_PIL_I	wrpr	%r17, 0x01e5, %pil
	setx	data_start_4, %g1, %r20
	.word 0xbc45609c  ! 125: ADDC_I	addc 	%r21, 0x009c, %r30
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a01d  ! 130: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb93dd000  ! 131: SRAX_R	srax	%r23, %r0, %r28
	.word 0xb82d4000  ! 133: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xbb480000  ! 136: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8595a1f4  ! 137: WRPR_TSTATE_I	wrpr	%r22, 0x01f4, %tstate
	.word 0xb9e4a14d  ! 140: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb751c000  ! 144: RDPR_TL	<illegal instruction>
	.word 0xb6c54000  ! 147: ADDCcc_R	addccc 	%r21, %r0, %r27
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0c0  ! 151: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe520de  ! 155: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8794203b  ! 156: WRPR_TT_I	wrpr	%r16, 0x003b, %tt
	.word 0xbbe5a181  ! 157: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5e001  ! 162: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe521ab  ! 168: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e5a0bb  ! 171: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e46187  ! 173: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x87952181  ! 174: WRPR_TT_I	wrpr	%r20, 0x0181, %tt
	.word 0xb3e421ee  ! 175: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x4c58d4fb00006ed0, %g1, %r10
	.word 0x839a8000  ! 176: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbea420b5  ! 178: SUBcc_I	subcc 	%r16, 0x00b5, %r31
	setx	data_start_0, %g1, %r18
	.word 0xb5e52030  ! 180: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbe948000  ! 182: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0x85946135  ! 183: WRPR_TSTATE_I	wrpr	%r17, 0x0135, %tstate
	.word 0xbde5a0c0  ! 184: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4a003  ! 187: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e52155  ! 191: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4215e  ! 192: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_2, %g1, %r23
	.word 0xbfe52160  ! 199: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e521bd  ! 202: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e4a0d0  ! 204: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e460f3  ! 205: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe520c2  ! 207: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56013  ! 212: SAVE_I	save	%r21, 0x0001, %r26
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 217: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e4a0ec  ! 219: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde521f5  ! 220: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e560b8  ! 222: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4e004  ! 225: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe560d2  ! 230: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4a04b  ! 231: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe5e079  ! 233: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_2, %g1, %r21
	.word 0xb9504000  ! 238: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e56045  ! 244: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a092  ! 247: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e0ec  ! 252: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e42028  ! 257: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb50c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xb33db001  ! 262: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xb9480000  ! 263: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3e4a0c3  ! 265: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e52043  ! 267: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5613f  ! 269: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb40d8000  ! 270: AND_R	and 	%r22, %r0, %r26
	.word 0xbf480000  ! 271: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbbe52152  ! 276: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e460ea  ! 282: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7344000  ! 284: SRL_R	srl 	%r17, %r0, %r27
	.word 0xb1e4a0c8  ! 285: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e420e6  ! 286: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_6, %g1, %r16
	.word 0xb9504000  ! 291: RDPR_TNPC	<illegal instruction>
	.word 0xbc2420c4  ! 292: SUB_I	sub 	%r16, 0x00c4, %r30
	.word 0xbde5e0ce  ! 293: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e070  ! 295: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb508000  ! 296: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 297: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e4a16f  ! 298: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8194e00c  ! 299: WRPR_TPC_I	wrpr	%r19, 0x000c, %tpc
	.word 0xbbe52088  ! 304: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb81d8000  ! 305: XOR_R	xor 	%r22, %r0, %r28
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0b0  ! 308: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe4a199  ! 309: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8794a165  ! 313: WRPR_TT_I	wrpr	%r18, 0x0165, %tt
	.word 0xbbe52101  ! 315: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e004  ! 318: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8995a104  ! 321: WRPR_TICK_I	wrpr	%r22, 0x0104, %tick
	.word 0xb1e56185  ! 322: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9504000  ! 325: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4a059  ! 326: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_0, %g1, %r21
	setx	data_start_7, %g1, %r17
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e560e7  ! 336: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5619d  ! 337: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e52029  ! 339: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e4a00e  ! 340: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1520000  ! 342: RDPR_PIL	<illegal instruction>
	.word 0xb3e5611a  ! 343: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb844c000  ! 344: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xb9e5e044  ! 352: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5e01e  ! 353: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde56151  ! 355: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e460c0  ! 356: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x899421e1  ! 359: WRPR_TICK_I	wrpr	%r16, 0x01e1, %tick
	.word 0xb5e5e095  ! 360: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde42027  ! 361: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e46199  ! 363: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e421b1  ! 366: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5a1cc  ! 370: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad8000  ! 375: ANDNcc_R	andncc 	%r22, %r0, %r30
	.word 0xbde5e041  ! 380: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e5e036  ! 382: SAVE_I	save	%r23, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 383: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e4a1a1  ! 384: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e52110  ! 386: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe521b0  ! 390: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_5, %g1, %r17
	.word 0x8994a056  ! 397: WRPR_TICK_I	wrpr	%r18, 0x0056, %tick
	.word 0xb9510000  ! 398: RDPR_TICK	<illegal instruction>
	.word 0xbde52068  ! 399: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5a160  ! 400: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde42041  ! 401: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbcb4a111  ! 403: SUBCcc_I	orncc 	%r18, 0x0111, %r30
	.word 0xb7e5a141  ! 405: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e56038  ! 407: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x839560b3  ! 408: WRPR_TNPC_I	wrpr	%r21, 0x00b3, %tnpc
	.word 0xb3e421e4  ! 409: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e46048  ! 410: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e15f  ! 412: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf510000  ! 414: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xb0bda10c  ! 418: XNORcc_I	xnorcc 	%r22, 0x010c, %r24
	.word 0x9194a0a7  ! 420: WRPR_PIL_I	wrpr	%r18, 0x00a7, %pil
	.word 0xb9e4219c  ! 421: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e5e02b  ! 422: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8395e0dc  ! 423: WRPR_TNPC_I	wrpr	%r23, 0x00dc, %tnpc
	.word 0xbcc58000  ! 424: ADDCcc_R	addccc 	%r22, %r0, %r30
	.word 0xbde42065  ! 428: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb20d0000  ! 429: AND_R	and 	%r20, %r0, %r25
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a02f  ! 432: WRPR_PIL_I	wrpr	%r22, 0x002f, %pil
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5205c  ! 444: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5207f  ! 453: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb351c000  ! 456: RDPR_TL	<illegal instruction>
	.word 0xb1e5e0dc  ! 458: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb2048000  ! 459: ADD_R	add 	%r18, %r0, %r25
	.word 0xb5480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0xdaf13e640000491d, %g1, %r10
	.word 0x819a8000  ! 470: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde521df  ! 472: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe5a06f  ! 478: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x91946073  ! 479: WRPR_PIL_I	wrpr	%r17, 0x0073, %pil
	.word 0xb1e560fd  ! 480: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e4e143  ! 483: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e5e0ae  ! 488: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4613c  ! 493: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5e008  ! 494: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4212e  ! 497: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e52112  ! 498: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	setx	0xdac5477900003e85, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde5e160  ! 505: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbea461a3  ! 506: SUBcc_I	subcc 	%r17, 0x01a3, %r31
	.word 0xb5500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0xbbe4a023  ! 513: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde42011  ! 516: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8395a18a  ! 522: WRPR_TNPC_I	wrpr	%r22, 0x018a, %tnpc
	.word 0xb7e4219c  ! 527: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4200c  ! 530: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4e15a  ! 531: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb4b40000  ! 535: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0xb9e560d4  ! 540: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4e09e  ! 547: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd480000  ! 548: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbbe5608f  ! 551: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4a1e5  ! 556: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5e0f1  ! 557: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8394e06d  ! 566: WRPR_TNPC_I	wrpr	%r19, 0x006d, %tnpc
	.word 0xb5508000  ! 569: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4e141  ! 574: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e460a3  ! 575: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8395613a  ! 578: WRPR_TNPC_I	wrpr	%r21, 0x013a, %tnpc
	.word 0xb3520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xb63d4000  ! 584: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xb9520000  ! 588: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	.word 0xbf50c000  ! 597: RDPR_TT	<illegal instruction>
	.word 0xb5e5614d  ! 598: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e0df  ! 604: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe521e6  ! 605: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_2, %g1, %r18
	.word 0xb1e561f3  ! 607: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4202c  ! 609: SAVE_I	save	%r16, 0x0001, %r29
	setx	0xbd7aa7b700001bdb, %g1, %r10
	.word 0x839a8000  ! 619: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5504000  ! 622: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 624: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e46144  ! 626: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8394a13f  ! 631: WRPR_TNPC_I	wrpr	%r18, 0x013f, %tnpc
	.word 0xb9e421aa  ! 633: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a18d  ! 637: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4a0c9  ! 639: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3540000  ! 641: RDPR_GL	<illegal instruction>
	.word 0xbfe4a07e  ! 643: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5e15e  ! 644: SAVE_I	save	%r23, 0x0001, %r31
	setx	0xb7182ce90000680f, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e4e073  ! 646: SAVE_I	save	%r19, 0x0001, %r24
	mov	0, %r12
	.word 0xa1930000  ! 653: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e46155  ! 654: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e4a16d  ! 655: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e5200f  ! 656: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb0a5608e  ! 658: SUBcc_I	subcc 	%r21, 0x008e, %r24
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a13a  ! 661: SAVE_I	save	%r22, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 662: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 671: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a1ab  ! 675: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x899561fd  ! 676: WRPR_TICK_I	wrpr	%r21, 0x01fd, %tick
	mov	1, %r12
	.word 0x8f930000  ! 678: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xb9e461e0  ! 684: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe56057  ! 690: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a03f  ! 691: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe520cb  ! 695: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4e1e1  ! 697: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb805a0e6  ! 700: ADD_I	add 	%r22, 0x00e6, %r28
	.word 0xbde4a096  ! 701: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5a023  ! 703: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5218b  ! 704: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e56075  ! 706: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8394a108  ! 707: WRPR_TNPC_I	wrpr	%r18, 0x0108, %tnpc
	.word 0xbc0c21b3  ! 709: AND_I	and 	%r16, 0x01b3, %r30
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46083  ! 712: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4207c  ! 719: SAVE_I	save	%r16, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 720: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e18e  ! 724: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e070  ! 729: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5a0fe  ! 730: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 736: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4a129  ! 738: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0b56020  ! 739: SUBCcc_I	orncc 	%r21, 0x0020, %r24
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	setx	0x4a8ea26500001a9e, %g1, %r10
	.word 0x839a8000  ! 744: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe420ec  ! 745: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x4141745c00002b47, %g1, %r10
	.word 0x819a8000  ! 746: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795e1da  ! 748: WRPR_TT_I	wrpr	%r23, 0x01da, %tt
	.word 0xb3e561ed  ! 751: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e003  ! 752: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd510000  ! 753: RDPR_TICK	<illegal instruction>
	.word 0xbbe56182  ! 754: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb12d7001  ! 756: SLLX_I	sllx	%r21, 0x0001, %r24
	.word 0xbfe5609c  ! 758: SAVE_I	save	%r21, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 759: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e52109  ! 761: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5e0ad  ! 762: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe461e2  ! 768: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83da186  ! 773: XNOR_I	xnor 	%r22, 0x0186, %r28
	.word 0xb1e42162  ! 776: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb518000  ! 777: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e0b8  ! 780: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7540000  ! 782: RDPR_GL	<illegal instruction>
	.word 0x8595e199  ! 783: WRPR_TSTATE_I	wrpr	%r23, 0x0199, %tstate
	.word 0xbf51c000  ! 789: RDPR_TL	<illegal instruction>
	.word 0xb295e0d8  ! 791: ORcc_I	orcc 	%r23, 0x00d8, %r25
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e03a  ! 796: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e52063  ! 797: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe46155  ! 798: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8795a1b3  ! 799: WRPR_TT_I	wrpr	%r22, 0x01b3, %tt
	.word 0xb5e56026  ! 800: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5211d  ! 804: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb92c3001  ! 806: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb0b4c000  ! 807: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xbfe4a1f3  ! 808: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe52170  ! 809: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e42037  ! 810: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e56098  ! 812: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e56071  ! 814: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e460b2  ! 815: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r21
	.word 0xb085a043  ! 819: ADDcc_I	addcc 	%r22, 0x0043, %r24
	.word 0xbf641800  ! 820: MOVcc_R	<illegal instruction>
	.word 0xbea5c000  ! 822: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xb5e420b2  ! 824: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9520000  ! 825: RDPR_PIL	<illegal instruction>
	.word 0xbfe5a0ff  ! 827: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5e145  ! 828: SAVE_I	save	%r23, 0x0001, %r27
	setx	0xcca5e7ce0000cc0b, %g1, %r10
	.word 0x839a8000  ! 829: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5e10d  ! 830: SAVE_I	save	%r23, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xba0d21a9  ! 834: AND_I	and 	%r20, 0x01a9, %r29
	.word 0xbde4e110  ! 835: SAVE_I	save	%r19, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 840: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd504000  ! 841: RDPR_TNPC	<illegal instruction>
	.word 0xb7e42139  ! 846: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e42123  ! 847: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4606f  ! 848: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4609d  ! 855: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_2, %g1, %r20
	.word 0xb434c000  ! 858: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xbd504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4e1fe  ! 861: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_3, %g1, %r20
	.word 0x8594a122  ! 873: WRPR_TSTATE_I	wrpr	%r18, 0x0122, %tstate
	.word 0xb9e4606f  ! 878: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5e174  ! 879: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4605e  ! 885: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd34f001  ! 888: SRLX_I	srlx	%r19, 0x0001, %r30
	.word 0xbfe5204e  ! 889: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4a115  ! 890: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_2, %g1, %r17
	.word 0xb0340000  ! 896: ORN_R	orn 	%r16, %r0, %r24
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 908: RDPR_PIL	<illegal instruction>
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a157  ! 912: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e420fd  ! 918: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x87942016  ! 919: WRPR_TT_I	wrpr	%r16, 0x0016, %tt
	.word 0xb7e420a3  ! 921: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5e0e8  ! 925: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbcac616f  ! 927: ANDNcc_I	andncc 	%r17, 0x016f, %r30
	.word 0x899560af  ! 932: WRPR_TICK_I	wrpr	%r21, 0x00af, %tick
	.word 0xbde52189  ! 933: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1518000  ! 937: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4e030  ! 938: SAVE_I	save	%r19, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde5a12c  ! 940: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a021  ! 943: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8d94e1d3  ! 947: WRPR_PSTATE_I	wrpr	%r19, 0x01d3, %pstate
	.word 0xb9e56177  ! 948: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e421f6  ! 949: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4e1a5  ! 950: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5213b  ! 952: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbaad2025  ! 954: ANDNcc_I	andncc 	%r20, 0x0025, %r29
	.word 0xb3e561da  ! 957: SAVE_I	save	%r21, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 958: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a070  ! 960: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e421da  ! 961: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde460d8  ! 963: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x9194a05b  ! 967: WRPR_PIL_I	wrpr	%r18, 0x005b, %pil
	.word 0xbbe460ec  ! 968: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e004  ! 973: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe42196  ! 974: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5201c  ! 976: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e56091  ! 977: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5e0b5  ! 979: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a097  ! 985: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e5e0ee  ! 986: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e46151  ! 989: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e060  ! 991: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5214f  ! 995: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e4e0b7  ! 996: SAVE_I	save	%r19, 0x0001, %r26
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
	.word 0xf73d4000  ! 2: STDF_R	std	%f27, [%r0, %r21]
	.word 0x83942135  ! 4: WRPR_TNPC_I	wrpr	%r16, 0x0135, %tnpc
	.word 0xf4758000  ! 6: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfc2ce04a  ! 12: STB_I	stb	%r30, [%r19 + 0x004a]
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13c20f2  ! 18: STDF_I	std	%f24, [0x00f2, %r16]
	.word 0xb8a4615e  ! 19: SUBcc_I	subcc 	%r17, 0x015e, %r28
	.word 0xf62d214c  ! 20: STB_I	stb	%r27, [%r20 + 0x014c]
	.word 0xbf351000  ! 22: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xb49c6097  ! 23: XORcc_I	xorcc 	%r17, 0x0097, %r26
	.word 0xfb3dc000  ! 24: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfa752136  ! 39: STX_I	stx	%r29, [%r20 + 0x0136]
	.word 0xb08d0000  ! 40: ANDcc_R	andcc 	%r20, %r0, %r24
	.word 0xfc254000  ! 49: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf63ce16f  ! 52: STD_I	std	%r27, [%r19 + 0x016f]
	.word 0xf73d214f  ! 53: STDF_I	std	%f27, [0x014f, %r20]
	.word 0xbb540000  ! 56: RDPR_GL	rdpr	%-, %r29
	.word 0xb7540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xb89ce083  ! 61: XORcc_I	xorcc 	%r19, 0x0083, %r28
	.word 0x8794214b  ! 65: WRPR_TT_I	wrpr	%r16, 0x014b, %tt
	.word 0x819560be  ! 68: WRPR_TPC_I	wrpr	%r21, 0x00be, %tpc
	.word 0xb1520000  ! 70: RDPR_PIL	rdpr	%pil, %r24
	.word 0xbc2cc000  ! 71: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xf4354000  ! 73: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfd3c4000  ! 79: STDF_R	std	%f30, [%r0, %r17]
	.word 0xf03d0000  ! 81: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb9518000  ! 82: RDPR_PSTATE	<illegal instruction>
	.word 0xb805a087  ! 84: ADD_I	add 	%r22, 0x0087, %r28
	.word 0xfa3ca04a  ! 91: STD_I	std	%r29, [%r18 + 0x004a]
	setx	0xcd57853f00007e95, %g1, %r10
	.word 0x819a8000  ! 92: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r20
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf87420ed  ! 101: STX_I	stx	%r28, [%r16 + 0x00ed]
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 103: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf62c20c7  ! 104: STB_I	stb	%r27, [%r16 + 0x00c7]
	.word 0xbc8ce1a6  ! 111: ANDcc_I	andcc 	%r19, 0x01a6, %r30
	.word 0xf43d8000  ! 115: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf474219d  ! 118: STX_I	stx	%r26, [%r16 + 0x019d]
	.word 0x9195e1b5  ! 120: WRPR_PIL_I	wrpr	%r23, 0x01b5, %pil
	setx	data_start_2, %g1, %r21
	.word 0xb4456194  ! 125: ADDC_I	addc 	%r21, 0x0194, %r26
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74e155  ! 128: STX_I	stx	%r29, [%r19 + 0x0155]
	.word 0xf875c000  ! 129: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb93c5000  ! 131: SRAX_R	srax	%r17, %r0, %r28
	.word 0xfb3c8000  ! 132: STDF_R	std	%f29, [%r0, %r18]
	.word 0xbe2d0000  ! 133: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xf82d6049  ! 134: STB_I	stb	%r28, [%r21 + 0x0049]
	.word 0xb1480000  ! 136: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8594a1e2  ! 137: WRPR_TSTATE_I	wrpr	%r18, 0x01e2, %tstate
	.word 0xfe3c61c6  ! 143: STD_I	std	%r31, [%r17 + 0x01c6]
	.word 0xb551c000  ! 144: RDPR_TL	rdpr	%tl, %r26
	.word 0xb8c58000  ! 147: ADDCcc_R	addccc 	%r22, %r0, %r28
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2754000  ! 149: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf62c8000  ! 152: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf02ca088  ! 153: STB_I	stb	%r24, [%r18 + 0x0088]
	.word 0x8794611f  ! 156: WRPR_TT_I	wrpr	%r17, 0x011f, %tt
	.word 0xf825a02c  ! 158: STW_I	stw	%r28, [%r22 + 0x002c]
	.word 0x8795a12d  ! 174: WRPR_TT_I	wrpr	%r22, 0x012d, %tt
	setx	0x3881bfc100007840, %g1, %r10
	.word 0x839a8000  ! 176: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbaa4a07f  ! 178: SUBcc_I	subcc 	%r18, 0x007f, %r29
	setx	data_start_1, %g1, %r16
	.word 0xbe948000  ! 182: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0x8595a016  ! 183: WRPR_TSTATE_I	wrpr	%r22, 0x0016, %tstate
	.word 0xf33ce0a5  ! 185: STDF_I	std	%f25, [0x00a5, %r19]
	.word 0xf63cc000  ! 188: STD_R	std	%r27, [%r19 + %r0]
	setx	data_start_5, %g1, %r19
	.word 0xf2758000  ! 200: STX_R	stx	%r25, [%r22 + %r0]
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d2102  ! 211: STB_I	stb	%r25, [%r20 + 0x0102]
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 217: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf83560f0  ! 223: STH_I	sth	%r28, [%r21 + 0x00f0]
	setx	data_start_2, %g1, %r21
	.word 0xb5504000  ! 238: RDPR_TNPC	rdpr	%tnpc, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf424c000  ! 253: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xfa2d0000  ! 254: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc2de024  ! 255: STB_I	stb	%r30, [%r23 + 0x0024]
	.word 0xfa74c000  ! 256: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xf82c4000  ! 259: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb550c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xb53d3001  ! 262: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xb9480000  ! 263: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb20d0000  ! 270: AND_R	and 	%r20, %r0, %r25
	.word 0xb1480000  ! 271: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf8240000  ! 278: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfc346073  ! 279: STH_I	sth	%r30, [%r17 + 0x0073]
	.word 0xf93c0000  ! 281: STDF_R	std	%f28, [%r0, %r16]
	.word 0xbb340000  ! 284: SRL_R	srl 	%r16, %r0, %r29
	.word 0xf024a020  ! 287: STW_I	stw	%r24, [%r18 + 0x0020]
	setx	data_start_4, %g1, %r18
	.word 0xbd504000  ! 291: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb0256064  ! 292: SUB_I	sub 	%r21, 0x0064, %r24
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 296: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 297: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195601e  ! 299: WRPR_TPC_I	wrpr	%r21, 0x001e, %tpc
	.word 0xfa248000  ! 301: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf53c4000  ! 302: STDF_R	std	%f26, [%r0, %r17]
	.word 0xfb3dc000  ! 303: STDF_R	std	%f29, [%r0, %r23]
	.word 0xb21d4000  ! 305: XOR_R	xor 	%r21, %r0, %r25
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e0ee  ! 313: WRPR_TT_I	wrpr	%r23, 0x00ee, %tt
	.word 0xf02520e3  ! 314: STW_I	stw	%r24, [%r20 + 0x00e3]
	.word 0x899560ac  ! 321: WRPR_TICK_I	wrpr	%r21, 0x00ac, %tick
	.word 0xf03ce03b  ! 323: STD_I	std	%r24, [%r19 + 0x003b]
	.word 0xb9504000  ! 325: RDPR_TNPC	rdpr	%tnpc, %r28
	setx	data_start_1, %g1, %r18
	setx	data_start_0, %g1, %r23
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa752019  ! 333: STX_I	stx	%r29, [%r20 + 0x0019]
	.word 0xb3520000  ! 342: RDPR_PIL	<illegal instruction>
	.word 0xb8440000  ! 344: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xf474e132  ! 345: STX_I	stx	%r26, [%r19 + 0x0132]
	.word 0xf435c000  ! 346: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf33de054  ! 347: STDF_I	std	%f25, [0x0054, %r23]
	.word 0xf634a12e  ! 350: STH_I	sth	%r27, [%r18 + 0x012e]
	.word 0xfe754000  ! 357: STX_R	stx	%r31, [%r21 + %r0]
	.word 0x899420c2  ! 359: WRPR_TICK_I	wrpr	%r16, 0x00c2, %tick
	.word 0xfe758000  ! 365: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfc34c000  ! 367: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf93d212f  ! 368: STDF_I	std	%f28, [0x012f, %r20]
	.word 0xf42d8000  ! 371: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfa35e0fb  ! 372: STH_I	sth	%r29, [%r23 + 0x00fb]
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad4000  ! 375: ANDNcc_R	andncc 	%r21, %r0, %r24
	.word 0xf635a0f8  ! 377: STH_I	sth	%r27, [%r22 + 0x00f8]
	mov	1, %r12
	.word 0xa1930000  ! 383: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0342072  ! 388: STH_I	sth	%r24, [%r16 + 0x0072]
	setx	data_start_3, %g1, %r19
	.word 0x8995a12b  ! 397: WRPR_TICK_I	wrpr	%r22, 0x012b, %tick
	.word 0xbf510000  ! 398: RDPR_TICK	rdpr	%tick, %r31
	.word 0xb4b4605d  ! 403: SUBCcc_I	orncc 	%r17, 0x005d, %r26
	.word 0x8395a0fc  ! 408: WRPR_TNPC_I	wrpr	%r22, 0x00fc, %tnpc
	.word 0xb1510000  ! 414: RDPR_TICK	rdpr	%tick, %r24
	setx	data_start_7, %g1, %r19
	.word 0xbcbca09d  ! 418: XNORcc_I	xnorcc 	%r18, 0x009d, %r30
	.word 0x91952073  ! 420: WRPR_PIL_I	wrpr	%r20, 0x0073, %pil
	.word 0x8394e0d9  ! 423: WRPR_TNPC_I	wrpr	%r19, 0x00d9, %tnpc
	.word 0xbec48000  ! 424: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xfa354000  ! 425: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb20d8000  ! 429: AND_R	and 	%r22, %r0, %r25
	.word 0xfe2ce1d7  ! 430: STB_I	stb	%r31, [%r19 + 0x01d7]
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e0a6  ! 432: WRPR_PIL_I	wrpr	%r23, 0x00a6, %pil
	.word 0xf42ce060  ! 433: STB_I	stb	%r26, [%r19 + 0x0060]
	.word 0xf73cc000  ! 435: STDF_R	std	%f27, [%r0, %r19]
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 456: RDPR_TL	rdpr	%tl, %r28
	.word 0xb2040000  ! 459: ADD_R	add 	%r16, %r0, %r25
	.word 0xf23ca040  ! 460: STD_I	std	%r25, [%r18 + 0x0040]
	.word 0xfe35e1e3  ! 461: STH_I	sth	%r31, [%r23 + 0x01e3]
	.word 0xf13d8000  ! 464: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf13c0000  ! 467: STDF_R	std	%f24, [%r0, %r16]
	.word 0xb1480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf63d60b7  ! 469: STD_I	std	%r27, [%r21 + 0x00b7]
	setx	0xa3fc8dd500008dc8, %g1, %r10
	.word 0x819a8000  ! 470: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0348000  ! 473: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfc252057  ! 474: STW_I	stw	%r30, [%r20 + 0x0057]
	.word 0x9194217c  ! 479: WRPR_PIL_I	wrpr	%r16, 0x017c, %pil
	.word 0xfa3c8000  ! 486: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf2754000  ! 487: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf63420ae  ! 489: STH_I	sth	%r27, [%r16 + 0x00ae]
	.word 0xfa344000  ! 491: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfe25e177  ! 492: STW_I	stw	%r31, [%r23 + 0x0177]
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	setx	0x230c01170000a817, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf23ca011  ! 504: STD_I	std	%r25, [%r18 + 0x0011]
	.word 0xb4a4215f  ! 506: SUBcc_I	subcc 	%r16, 0x015f, %r26
	.word 0xf825a086  ! 508: STW_I	stw	%r28, [%r22 + 0x0086]
	.word 0xb1500000  ! 510: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf02560d8  ! 511: STW_I	stw	%r24, [%r21 + 0x00d8]
	.word 0xf03c60e8  ! 514: STD_I	std	%r24, [%r17 + 0x00e8]
	.word 0xfc3461b3  ! 515: STH_I	sth	%r30, [%r17 + 0x01b3]
	.word 0xfa748000  ! 517: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf8750000  ! 520: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x83952177  ! 522: WRPR_TNPC_I	wrpr	%r20, 0x0177, %tnpc
	.word 0xf43d616b  ! 523: STD_I	std	%r26, [%r21 + 0x016b]
	.word 0xfa2c8000  ! 524: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfc3d6183  ! 525: STD_I	std	%r30, [%r21 + 0x0183]
	.word 0xfe34c000  ! 528: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe348000  ! 529: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf13c8000  ! 532: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf8752180  ! 534: STX_I	stx	%r28, [%r20 + 0x0180]
	.word 0xb6b54000  ! 535: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xfc24a1cf  ! 538: STW_I	stw	%r30, [%r18 + 0x01cf]
	.word 0xf424c000  ! 541: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf22c21f1  ! 545: STB_I	stb	%r25, [%r16 + 0x01f1]
	.word 0xb5480000  ! 548: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf435a0f5  ! 549: STH_I	sth	%r26, [%r22 + 0x00f5]
	.word 0xf22de0eb  ! 550: STB_I	stb	%r25, [%r23 + 0x00eb]
	.word 0x8394a189  ! 566: WRPR_TNPC_I	wrpr	%r18, 0x0189, %tnpc
	.word 0xf475a161  ! 568: STX_I	stx	%r26, [%r22 + 0x0161]
	.word 0xbf508000  ! 569: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfb3d4000  ! 570: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfa25e1b0  ! 572: STW_I	stw	%r29, [%r23 + 0x01b0]
	.word 0xfe3d4000  ! 573: STD_R	std	%r31, [%r21 + %r0]
	.word 0xf4248000  ! 576: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x83942033  ! 578: WRPR_TNPC_I	wrpr	%r16, 0x0033, %tnpc
	.word 0xfa254000  ! 579: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xb3520000  ! 581: RDPR_PIL	rdpr	%pil, %r25
	.word 0xbe3d0000  ! 584: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xb5520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xfd3da1a5  ! 591: STDF_I	std	%f30, [0x01a5, %r22]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	.word 0xbf50c000  ! 597: RDPR_TT	<illegal instruction>
	.word 0xf53c4000  ! 599: STDF_R	std	%f26, [%r0, %r17]
	.word 0xff3de1e0  ! 601: STDF_I	std	%f31, [0x01e0, %r23]
	.word 0xf42c0000  ! 602: STB_R	stb	%r26, [%r16 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xf93d61f8  ! 608: STDF_I	std	%f28, [0x01f8, %r21]
	.word 0xf82da0f1  ! 610: STB_I	stb	%r28, [%r22 + 0x00f1]
	.word 0xf634204f  ! 611: STH_I	sth	%r27, [%r16 + 0x004f]
	.word 0xf4744000  ! 614: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf625c000  ! 616: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xff3d6091  ! 618: STDF_I	std	%f31, [0x0091, %r21]
	setx	0xdaf8c59d0000fa5f, %g1, %r10
	.word 0x839a8000  ! 619: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5504000  ! 622: RDPR_TNPC	rdpr	%tnpc, %r26
	mov	1, %r12
	.word 0xa1930000  ! 624: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xff3c8000  ! 628: STDF_R	std	%f31, [%r0, %r18]
	.word 0x839460d6  ! 631: WRPR_TNPC_I	wrpr	%r17, 0x00d6, %tnpc
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43ce03f  ! 636: STD_I	std	%r26, [%r19 + 0x003f]
	.word 0xb7540000  ! 641: RDPR_GL	rdpr	%-, %r27
	setx	0x25cad8390000fd5a, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8258000  ! 651: STW_R	stw	%r28, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 653: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf22d8000  ! 657: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xbea4a1ef  ! 658: SUBcc_I	subcc 	%r18, 0x01ef, %r31
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	2, %r12
	.word 0x8f930000  ! 662: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 671: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfc2c20e8  ! 672: STB_I	stb	%r30, [%r16 + 0x00e8]
	.word 0x8995a144  ! 676: WRPR_TICK_I	wrpr	%r22, 0x0144, %tick
	mov	0, %r12
	.word 0x8f930000  ! 678: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1500000  ! 679: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf8742032  ! 687: STX_I	stx	%r28, [%r16 + 0x0032]
	.word 0xf024a057  ! 688: STW_I	stw	%r24, [%r18 + 0x0057]
	.word 0xf0348000  ! 698: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb605a154  ! 700: ADD_I	add 	%r22, 0x0154, %r27
	.word 0x839460b7  ! 707: WRPR_TNPC_I	wrpr	%r17, 0x00b7, %tnpc
	.word 0xb60ce093  ! 709: AND_I	and 	%r19, 0x0093, %r27
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 720: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3cc000  ! 725: STDF_R	std	%f31, [%r0, %r19]
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82de13c  ! 734: STB_I	stb	%r28, [%r23 + 0x013c]
	.word 0xb1508000  ! 736: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfa350000  ! 737: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xbcb521cc  ! 739: SUBCcc_I	orncc 	%r20, 0x01cc, %r30
	.word 0xf6358000  ! 741: STH_R	sth	%r27, [%r22 + %r0]
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	setx	0x690874df0000ab1f, %g1, %r10
	.word 0x839a8000  ! 744: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xf19376a7000049da, %g1, %r10
	.word 0x819a8000  ! 746: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8794e051  ! 748: WRPR_TT_I	wrpr	%r19, 0x0051, %tt
	.word 0xf22cc000  ! 749: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf73c2079  ! 750: STDF_I	std	%f27, [0x0079, %r16]
	.word 0xbb510000  ! 753: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf23421a6  ! 755: STH_I	sth	%r25, [%r16 + 0x01a6]
	.word 0xb92d7001  ! 756: SLLX_I	sllx	%r21, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 759: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfd3c21d4  ! 767: STDF_I	std	%f30, [0x01d4, %r16]
	.word 0xfd3d8000  ! 770: STDF_R	std	%f30, [%r0, %r22]
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24e077  ! 772: STW_I	stw	%r31, [%r19 + 0x0077]
	.word 0xbe3da146  ! 773: XNOR_I	xnor 	%r22, 0x0146, %r31
	.word 0xbd518000  ! 777: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xbd540000  ! 782: RDPR_GL	<illegal instruction>
	.word 0x85952092  ! 783: WRPR_TSTATE_I	wrpr	%r20, 0x0092, %tstate
	.word 0xf224a114  ! 788: STW_I	stw	%r25, [%r18 + 0x0114]
	.word 0xbb51c000  ! 789: RDPR_TL	rdpr	%tl, %r29
	.word 0xba95e0f6  ! 791: ORcc_I	orcc 	%r23, 0x00f6, %r29
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d0000  ! 793: STDF_R	std	%f31, [%r0, %r20]
	.word 0xfe2c0000  ! 794: STB_R	stb	%r31, [%r16 + %r0]
	.word 0x8795a10e  ! 799: WRPR_TT_I	wrpr	%r22, 0x010e, %tt
	.word 0xf2748000  ! 801: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf634c000  ! 803: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf625a069  ! 805: STW_I	stw	%r27, [%r22 + 0x0069]
	.word 0xb72df001  ! 806: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xbcb4c000  ! 807: ORNcc_R	orncc 	%r19, %r0, %r30
	setx	data_start_6, %g1, %r23
	.word 0xb0846028  ! 819: ADDcc_I	addcc 	%r17, 0x0028, %r24
	.word 0xb9641800  ! 820: MOVcc_R	<illegal instruction>
	.word 0xfc3c4000  ! 821: STD_R	std	%r30, [%r17 + %r0]
	.word 0xb4a54000  ! 822: SUBcc_R	subcc 	%r21, %r0, %r26
	.word 0xb7520000  ! 825: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf434617e  ! 826: STH_I	sth	%r26, [%r17 + 0x017e]
	setx	0xe7db3d8300008949, %g1, %r10
	.word 0x839a8000  ! 829: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc0da1eb  ! 834: AND_I	and 	%r22, 0x01eb, %r30
	.word 0xf4248000  ! 836: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf82d205f  ! 837: STB_I	stb	%r28, [%r20 + 0x005f]
	mov	2, %r12
	.word 0xa1930000  ! 840: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5504000  ! 841: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf0754000  ! 843: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf42ce1e7  ! 845: STB_I	stb	%r26, [%r19 + 0x01e7]
	.word 0xfa75a0d4  ! 849: STX_I	stx	%r29, [%r22 + 0x00d4]
	.word 0xfa3d0000  ! 852: STD_R	std	%r29, [%r20 + %r0]
	.word 0xf834c000  ! 853: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf13de17a  ! 854: STDF_I	std	%f24, [0x017a, %r23]
	.word 0xfa3da0ac  ! 856: STD_I	std	%r29, [%r22 + 0x00ac]
	setx	data_start_0, %g1, %r20
	.word 0xb0354000  ! 858: SUBC_R	orn 	%r21, %r0, %r24
	.word 0xf6340000  ! 859: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xb3504000  ! 860: RDPR_TNPC	<illegal instruction>
	setx	data_start_6, %g1, %r19
	.word 0xf635602a  ! 865: STH_I	sth	%r27, [%r21 + 0x002a]
	.word 0xfc25e13c  ! 870: STW_I	stw	%r30, [%r23 + 0x013c]
	.word 0xfc3cc000  ! 871: STD_R	std	%r30, [%r19 + %r0]
	.word 0x85952188  ! 873: WRPR_TSTATE_I	wrpr	%r20, 0x0188, %tstate
	.word 0xf63c6010  ! 882: STD_I	std	%r27, [%r17 + 0x0010]
	.word 0xfe744000  ! 884: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf13d60f0  ! 886: STDF_I	std	%f24, [0x00f0, %r21]
	.word 0xbf357001  ! 888: SRLX_I	srlx	%r21, 0x0001, %r31
	.word 0xf035c000  ! 891: STH_R	sth	%r24, [%r23 + %r0]
	setx	data_start_6, %g1, %r18
	.word 0xfe748000  ! 893: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf4258000  ! 895: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xbe358000  ! 896: ORN_R	orn 	%r22, %r0, %r31
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34619c  ! 899: STH_I	sth	%r30, [%r17 + 0x019c]
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3cc000  ! 904: STD_R	std	%r31, [%r19 + %r0]
	.word 0xf03d8000  ! 905: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf675e17e  ! 906: STX_I	stx	%r27, [%r23 + 0x017e]
	.word 0xb9520000  ! 908: RDPR_PIL	rdpr	%pil, %r28
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234a1a0  ! 910: STH_I	sth	%r25, [%r18 + 0x01a0]
	.word 0xfa2560fc  ! 915: STW_I	stw	%r29, [%r21 + 0x00fc]
	.word 0x87942147  ! 919: WRPR_TT_I	wrpr	%r16, 0x0147, %tt
	.word 0xb4ad2159  ! 927: ANDNcc_I	andncc 	%r20, 0x0159, %r26
	.word 0xfa754000  ! 930: STX_R	stx	%r29, [%r21 + %r0]
	.word 0x899421fe  ! 932: WRPR_TICK_I	wrpr	%r16, 0x01fe, %tick
	.word 0xbd518000  ! 937: RDPR_PSTATE	rdpr	%pstate, %r30
	mov	2, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13da11b  ! 942: STDF_I	std	%f24, [0x011b, %r22]
	.word 0x8d94a14a  ! 947: WRPR_PSTATE_I	wrpr	%r18, 0x014a, %pstate
	.word 0xf83cc000  ! 951: STD_R	std	%r28, [%r19 + %r0]
	.word 0xb4ade00e  ! 954: ANDNcc_I	andncc 	%r23, 0x000e, %r26
	.word 0xf42de103  ! 955: STB_I	stb	%r26, [%r23 + 0x0103]
	mov	0, %r12
	.word 0x8f930000  ! 958: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43d60f1  ! 962: STD_I	std	%r26, [%r21 + 0x00f1]
	.word 0xf43421e9  ! 966: STH_I	sth	%r26, [%r16 + 0x01e9]
	.word 0x9194208e  ! 967: WRPR_PIL_I	wrpr	%r16, 0x008e, %pil
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23da1e0  ! 971: STD_I	std	%r25, [%r22 + 0x01e0]
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e1a0  ! 983: STX_I	stx	%r31, [%r19 + 0x01a0]
	.word 0xf674e047  ! 988: STX_I	stx	%r27, [%r19 + 0x0047]
	.word 0xfa2ce05c  ! 992: STB_I	stb	%r29, [%r19 + 0x005c]
	.word 0xfd3dc000  ! 993: STDF_R	std	%f30, [%r0, %r23]
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
	.word 0x8395a0a9  ! 4: WRPR_TNPC_I	wrpr	%r22, 0x00a9, %tnpc
	.word 0xf71c60cd  ! 9: LDDF_I	ldd	[%r17, 0x00cd], %f27
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea4e021  ! 19: SUBcc_I	subcc 	%r19, 0x0021, %r31
	.word 0xb7345000  ! 22: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xba9d6053  ! 23: XORcc_I	xorcc 	%r21, 0x0053, %r29
	.word 0xf44c61be  ! 28: LDSB_I	ldsb	[%r17 + 0x01be], %r26
	.word 0xf65d0000  ! 29: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf31ce1d2  ! 32: LDDF_I	ldd	[%r19, 0x01d2], %f25
	.word 0xf005c000  ! 33: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf2550000  ! 34: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf24d6070  ! 36: LDSB_I	ldsb	[%r21 + 0x0070], %r25
	.word 0xf0056166  ! 38: LDUW_I	lduw	[%r21 + 0x0166], %r24
	.word 0xba8d0000  ! 40: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xf854e070  ! 41: LDSH_I	ldsh	[%r19 + 0x0070], %r28
	.word 0xf05ce0da  ! 43: LDX_I	ldx	[%r19 + 0x00da], %r24
	.word 0xfe0c8000  ! 45: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfd1d0000  ! 47: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xb7540000  ! 56: RDPR_GL	<illegal instruction>
	.word 0xbb540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xb49d605f  ! 61: XORcc_I	xorcc 	%r21, 0x005f, %r26
	.word 0xf44d8000  ! 63: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0x87942037  ! 65: WRPR_TT_I	wrpr	%r16, 0x0037, %tt
	.word 0xf814e191  ! 66: LDUH_I	lduh	[%r19 + 0x0191], %r28
	.word 0x8195e0f0  ! 68: WRPR_TPC_I	wrpr	%r23, 0x00f0, %tpc
	.word 0xf454a020  ! 69: LDSH_I	ldsh	[%r18 + 0x0020], %r26
	.word 0xbb520000  ! 70: RDPR_PIL	<illegal instruction>
	.word 0xb02c8000  ! 71: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xfc448000  ! 72: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf91ca051  ! 74: LDDF_I	ldd	[%r18, 0x0051], %f28
	.word 0xfc4da065  ! 75: LDSB_I	ldsb	[%r22 + 0x0065], %r30
	.word 0xf84d207d  ! 77: LDSB_I	ldsb	[%r20 + 0x007d], %r28
	.word 0xb7518000  ! 82: RDPR_PSTATE	<illegal instruction>
	.word 0xb405e1e2  ! 84: ADD_I	add 	%r23, 0x01e2, %r26
	.word 0xfa55c000  ! 85: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf8456065  ! 88: LDSW_I	ldsw	[%r21 + 0x0065], %r28
	setx	0x74125b8500008f83, %g1, %r10
	.word 0x819a8000  ! 92: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_4, %g1, %r16
	.word 0xfc0ca165  ! 95: LDUB_I	ldub	[%r18 + 0x0165], %r30
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0de155  ! 97: LDUB_I	ldub	[%r23 + 0x0155], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 103: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61421f9  ! 105: LDUH_I	lduh	[%r16 + 0x01f9], %r27
	.word 0xf71de026  ! 108: LDDF_I	ldd	[%r23, 0x0026], %f27
	.word 0xfe44a041  ! 109: LDSW_I	ldsw	[%r18 + 0x0041], %r31
	.word 0xb68d6038  ! 111: ANDcc_I	andcc 	%r21, 0x0038, %r27
	.word 0xf054a056  ! 114: LDSH_I	ldsh	[%r18 + 0x0056], %r24
	.word 0x9194e074  ! 120: WRPR_PIL_I	wrpr	%r19, 0x0074, %pil
	.word 0xfb1d0000  ! 121: LDDF_R	ldd	[%r20, %r0], %f29
	setx	data_start_2, %g1, %r19
	.word 0xfc0421b2  ! 123: LDUW_I	lduw	[%r16 + 0x01b2], %r30
	.word 0xb04421da  ! 125: ADDC_I	addc 	%r16, 0x01da, %r24
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c21c8  ! 127: LDSB_I	ldsb	[%r16 + 0x01c8], %r29
	.word 0xb13c5000  ! 131: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb22dc000  ! 133: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xfe044000  ! 135: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xb9480000  ! 136: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8595a014  ! 137: WRPR_TSTATE_I	wrpr	%r22, 0x0014, %tstate
	.word 0xf01c4000  ! 138: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xf8558000  ! 139: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xb551c000  ! 144: RDPR_TL	<illegal instruction>
	.word 0xf84c0000  ! 146: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb4c40000  ! 147: ADDCcc_R	addccc 	%r16, %r0, %r26
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54c000  ! 154: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0x8795e0ac  ! 156: WRPR_TT_I	wrpr	%r23, 0x00ac, %tt
	.word 0xf21c0000  ! 159: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xf614c000  ! 160: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf6548000  ! 166: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xf8450000  ! 167: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf01d2123  ! 172: LDD_I	ldd	[%r20 + 0x0123], %r24
	.word 0x8795614a  ! 174: WRPR_TT_I	wrpr	%r21, 0x014a, %tt
	setx	0xddc061c0000ef92, %g1, %r10
	.word 0x839a8000  ! 176: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa5d4000  ! 177: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xbaa56103  ! 178: SUBcc_I	subcc 	%r21, 0x0103, %r29
	setx	data_start_3, %g1, %r18
	.word 0xfe1c2190  ! 181: LDD_I	ldd	[%r16 + 0x0190], %r31
	.word 0xbe95c000  ! 182: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0x8595e0b2  ! 183: WRPR_TSTATE_I	wrpr	%r23, 0x00b2, %tstate
	.word 0xf04d4000  ! 195: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf61561c5  ! 196: LDUH_I	lduh	[%r21 + 0x01c5], %r27
	setx	data_start_3, %g1, %r16
	.word 0xfe1d0000  ! 201: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xfb1cc000  ! 203: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xf71ca0b1  ! 208: LDDF_I	ldd	[%r18, 0x00b1], %f27
	.word 0xfe154000  ! 209: LDUH_R	lduh	[%r21 + %r0], %r31
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44214f  ! 213: LDSW_I	ldsw	[%r16 + 0x014f], %r30
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 217: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8556109  ! 221: LDSH_I	ldsh	[%r21 + 0x0109], %r28
	.word 0xf4042105  ! 226: LDUW_I	lduw	[%r16 + 0x0105], %r26
	.word 0xf05c0000  ! 227: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xf0048000  ! 228: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xfe458000  ! 234: LDSW_R	ldsw	[%r22 + %r0], %r31
	setx	data_start_7, %g1, %r17
	.word 0xb9504000  ! 238: RDPR_TNPC	<illegal instruction>
	.word 0xf65c0000  ! 240: LDX_R	ldx	[%r16 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa0d2050  ! 243: LDUB_I	ldub	[%r20 + 0x0050], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf60d0000  ! 246: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf84dc000  ! 249: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf20de031  ! 250: LDUB_I	ldub	[%r23 + 0x0031], %r25
	.word 0xb750c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xbf3db001  ! 262: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0xb1480000  ! 263: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf8556108  ! 264: LDSH_I	ldsh	[%r21 + 0x0108], %r28
	.word 0xf8554000  ! 268: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xb20d0000  ! 270: AND_R	and 	%r20, %r0, %r25
	.word 0xb7480000  ! 271: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf20da17f  ! 272: LDUB_I	ldub	[%r22 + 0x017f], %r25
	.word 0xfe458000  ! 274: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xfe1d8000  ! 277: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xf01d21c9  ! 280: LDD_I	ldd	[%r20 + 0x01c9], %r24
	.word 0xbb344000  ! 284: SRL_R	srl 	%r17, %r0, %r29
	setx	data_start_2, %g1, %r22
	.word 0xf20ce0c6  ! 289: LDUB_I	ldub	[%r19 + 0x00c6], %r25
	.word 0xf21c20bb  ! 290: LDD_I	ldd	[%r16 + 0x00bb], %r25
	.word 0xbf504000  ! 291: RDPR_TNPC	<illegal instruction>
	.word 0xb024a116  ! 292: SUB_I	sub 	%r18, 0x0116, %r24
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 296: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 297: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x819561aa  ! 299: WRPR_TPC_I	wrpr	%r21, 0x01aa, %tpc
	.word 0xf25d0000  ! 300: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xba1c4000  ! 305: XOR_R	xor 	%r17, %r0, %r29
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4da1cb  ! 310: LDSB_I	ldsb	[%r22 + 0x01cb], %r29
	.word 0xfa148000  ! 311: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0x8795e1b1  ! 313: WRPR_TT_I	wrpr	%r23, 0x01b1, %tt
	.word 0xf40d602b  ! 320: LDUB_I	ldub	[%r21 + 0x002b], %r26
	.word 0x8995e0ec  ! 321: WRPR_TICK_I	wrpr	%r23, 0x00ec, %tick
	.word 0xf40c8000  ! 324: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xbf504000  ! 325: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r22
	setx	data_start_6, %g1, %r19
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4054000  ! 334: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf24d8000  ! 341: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xb1520000  ! 342: RDPR_PIL	<illegal instruction>
	.word 0xb2440000  ! 344: ADDC_R	addc 	%r16, %r0, %r25
	.word 0xf44d614e  ! 348: LDSB_I	ldsb	[%r21 + 0x014e], %r26
	.word 0xf41c0000  ! 349: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf2540000  ! 351: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf6054000  ! 354: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0x899521a1  ! 359: WRPR_TICK_I	wrpr	%r20, 0x01a1, %tick
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8adc000  ! 375: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xf454e106  ! 378: LDSH_I	ldsh	[%r19 + 0x0106], %r26
	.word 0xfa554000  ! 379: LDSH_R	ldsh	[%r21 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 383: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf605e0a7  ! 385: LDUW_I	lduw	[%r23 + 0x00a7], %r27
	.word 0xf805e19a  ! 387: LDUW_I	lduw	[%r23 + 0x019a], %r28
	setx	data_start_4, %g1, %r19
	.word 0xfe54e1b7  ! 392: LDSH_I	ldsh	[%r19 + 0x01b7], %r31
	.word 0xf6444000  ! 393: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xf2554000  ! 395: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0x8995e17b  ! 397: WRPR_TICK_I	wrpr	%r23, 0x017b, %tick
	.word 0xbf510000  ! 398: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf804c000  ! 402: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xb8b46165  ! 403: SUBCcc_I	orncc 	%r17, 0x0165, %r28
	.word 0xf05cc000  ! 404: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xfc0c0000  ! 406: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0x8394e0fe  ! 408: WRPR_TNPC_I	wrpr	%r19, 0x00fe, %tnpc
	.word 0xfc54206f  ! 413: LDSH_I	ldsh	[%r16 + 0x006f], %r30
	.word 0xbf510000  ! 414: RDPR_TICK	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xf614e0a3  ! 416: LDUH_I	lduh	[%r19 + 0x00a3], %r27
	.word 0xb2bce068  ! 418: XNORcc_I	xnorcc 	%r19, 0x0068, %r25
	.word 0x9194e0c6  ! 420: WRPR_PIL_I	wrpr	%r19, 0x00c6, %pil
	.word 0x8395e0a7  ! 423: WRPR_TNPC_I	wrpr	%r23, 0x00a7, %tnpc
	.word 0xb0c48000  ! 424: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xba0d0000  ! 429: AND_R	and 	%r20, %r0, %r29
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e0d9  ! 432: WRPR_PIL_I	wrpr	%r19, 0x00d9, %pil
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604a0aa  ! 438: LDUW_I	lduw	[%r18 + 0x00aa], %r27
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81de119  ! 440: LDD_I	ldd	[%r23 + 0x0119], %r28
	.word 0xfa15e13a  ! 446: LDUH_I	lduh	[%r23 + 0x013a], %r29
	.word 0xfa5d6106  ! 448: LDX_I	ldx	[%r21 + 0x0106], %r29
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ca104  ! 450: LDX_I	ldx	[%r18 + 0x0104], %r24
	.word 0xf00d4000  ! 452: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xb151c000  ! 456: RDPR_TL	<illegal instruction>
	.word 0xfc5d8000  ! 457: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xba058000  ! 459: ADD_R	add 	%r22, %r0, %r29
	.word 0xf60c8000  ! 463: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xfa0c8000  ! 466: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xbd480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x9f068cb70000ac8d, %g1, %r10
	.word 0x819a8000  ! 470: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe44c000  ! 471: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xfa4c20eb  ! 476: LDSB_I	ldsb	[%r16 + 0x00eb], %r29
	.word 0xf815e0f0  ! 477: LDUH_I	lduh	[%r23 + 0x00f0], %r28
	.word 0x9195a09b  ! 479: WRPR_PIL_I	wrpr	%r22, 0x009b, %pil
	.word 0xf6058000  ! 482: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf6042112  ! 484: LDUW_I	lduw	[%r16 + 0x0112], %r27
	.word 0xf11c4000  ! 496: LDDF_R	ldd	[%r17, %r0], %f24
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	setx	0x8972d9aa00006c10, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf24d600b  ! 503: LDSB_I	ldsb	[%r21 + 0x000b], %r25
	.word 0xb6a4a1c8  ! 506: SUBcc_I	subcc 	%r18, 0x01c8, %r27
	.word 0xfc558000  ! 507: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xf4140000  ! 509: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xbf500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0xfb1d8000  ! 518: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0x83952191  ! 522: WRPR_TNPC_I	wrpr	%r20, 0x0191, %tnpc
	.word 0xbcb4c000  ! 535: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xf05c6060  ! 536: LDX_I	ldx	[%r17 + 0x0060], %r24
	.word 0xfa0da042  ! 539: LDUB_I	ldub	[%r22 + 0x0042], %r29
	.word 0xf644a16d  ! 544: LDSW_I	ldsw	[%r18 + 0x016d], %r27
	.word 0xfe1c6156  ! 546: LDD_I	ldd	[%r17 + 0x0156], %r31
	.word 0xbd480000  ! 548: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf84d6187  ! 552: LDSB_I	ldsb	[%r21 + 0x0187], %r28
	.word 0xfe444000  ! 554: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf4544000  ! 555: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf6140000  ! 558: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xfa14c000  ! 561: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0x8394e0ff  ! 566: WRPR_TNPC_I	wrpr	%r19, 0x00ff, %tnpc
	.word 0xb1508000  ! 569: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfe0da151  ! 571: LDUB_I	ldub	[%r22 + 0x0151], %r31
	.word 0x839461ac  ! 578: WRPR_TNPC_I	wrpr	%r17, 0x01ac, %tnpc
	.word 0xf31d216a  ! 580: LDDF_I	ldd	[%r20, 0x016a], %f25
	.word 0xb9520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xb83c8000  ! 584: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xf0152149  ! 587: LDUH_I	lduh	[%r20 + 0x0149], %r24
	.word 0xbd520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xf8540000  ! 593: LDSH_R	ldsh	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xbf50c000  ! 597: RDPR_TT	<illegal instruction>
	.word 0xff1ce1f1  ! 603: LDDF_I	ldd	[%r19, 0x01f1], %f31
	setx	data_start_4, %g1, %r18
	.word 0xfe1c61fe  ! 612: LDD_I	ldd	[%r17 + 0x01fe], %r31
	.word 0xfa5dc000  ! 613: LDX_R	ldx	[%r23 + %r0], %r29
	setx	0xb6cb7cc80000f846, %g1, %r10
	.word 0x839a8000  ! 619: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5504000  ! 622: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 624: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf80460bd  ! 625: LDUW_I	lduw	[%r17 + 0x00bd], %r28
	.word 0x83952155  ! 631: WRPR_TNPC_I	wrpr	%r20, 0x0155, %tnpc
	.word 0xf65c8000  ! 632: LDX_R	ldx	[%r18 + %r0], %r27
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 641: RDPR_GL	<illegal instruction>
	.word 0xf204c000  ! 642: LDUW_R	lduw	[%r19 + %r0], %r25
	setx	0x971600ce0000b98e, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc45e1a9  ! 648: LDSW_I	ldsw	[%r23 + 0x01a9], %r30
	.word 0xfa048000  ! 650: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf40d2102  ! 652: LDUB_I	ldub	[%r20 + 0x0102], %r26
	mov	2, %r12
	.word 0xa1930000  ! 653: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbea5a0b3  ! 658: SUBcc_I	subcc 	%r22, 0x00b3, %r31
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	1, %r12
	.word 0x8f930000  ! 662: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1d8000  ! 668: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xf60d4000  ! 669: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf91d0000  ! 670: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xb7500000  ! 671: RDPR_TPC	<illegal instruction>
	.word 0x89956059  ! 676: WRPR_TICK_I	wrpr	%r21, 0x0059, %tick
	mov	2, %r12
	.word 0x8f930000  ! 678: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xfe1da129  ! 682: LDD_I	ldd	[%r22 + 0x0129], %r31
	.word 0xfa154000  ! 686: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf6546019  ! 692: LDSH_I	ldsh	[%r17 + 0x0019], %r27
	.word 0xf25c0000  ! 693: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xfb1c0000  ! 699: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xb2042100  ! 700: ADD_I	add 	%r16, 0x0100, %r25
	.word 0x83952154  ! 707: WRPR_TNPC_I	wrpr	%r20, 0x0154, %tnpc
	.word 0xfa0d0000  ! 708: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xbe0d616d  ! 709: AND_I	and 	%r21, 0x016d, %r31
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6040000  ! 715: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf21ce1a1  ! 716: LDD_I	ldd	[%r19 + 0x01a1], %r25
	.word 0xf2044000  ! 718: LDUW_R	lduw	[%r17 + %r0], %r25
	mov	1, %r12
	.word 0xa1930000  ! 720: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf244e0d4  ! 723: LDSW_I	ldsw	[%r19 + 0x00d4], %r25
	.word 0xf04d8000  ! 727: LDSB_R	ldsb	[%r22 + %r0], %r24
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605c000  ! 732: LDUW_R	lduw	[%r23 + %r0], %r27
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0550000  ! 735: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xb9508000  ! 736: RDPR_TSTATE	<illegal instruction>
	.word 0xb0b4a05f  ! 739: SUBCcc_I	orncc 	%r18, 0x005f, %r24
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	setx	0xb1eaaeb200005b47, %g1, %r10
	.word 0x839a8000  ! 744: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xfe1f6a080000ca48, %g1, %r10
	.word 0x819a8000  ! 746: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x87946083  ! 748: WRPR_TT_I	wrpr	%r17, 0x0083, %tt
	.word 0xb7510000  ! 753: RDPR_TICK	<illegal instruction>
	.word 0xb92db001  ! 756: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xf11da05e  ! 757: LDDF_I	ldd	[%r22, 0x005e], %f24
	mov	0, %r12
	.word 0x8f930000  ! 759: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4454000  ! 765: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf65c61d8  ! 766: LDX_I	ldx	[%r17 + 0x01d8], %r27
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63da106  ! 773: XNOR_I	xnor 	%r22, 0x0106, %r27
	.word 0xfa5c6085  ! 775: LDX_I	ldx	[%r17 + 0x0085], %r29
	.word 0xbb518000  ! 777: RDPR_PSTATE	<illegal instruction>
	.word 0xf85c6065  ! 778: LDX_I	ldx	[%r17 + 0x0065], %r28
	.word 0xf2542153  ! 781: LDSH_I	ldsh	[%r16 + 0x0153], %r25
	.word 0xb5540000  ! 782: RDPR_GL	<illegal instruction>
	.word 0x8594202f  ! 783: WRPR_TSTATE_I	wrpr	%r16, 0x002f, %tstate
	.word 0xf8044000  ! 787: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xb151c000  ! 789: RDPR_TL	<illegal instruction>
	.word 0xfe5d8000  ! 790: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb095a020  ! 791: ORcc_I	orcc 	%r22, 0x0020, %r24
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf31da186  ! 795: LDDF_I	ldd	[%r22, 0x0186], %f25
	.word 0x8794a134  ! 799: WRPR_TT_I	wrpr	%r18, 0x0134, %tt
	.word 0xb92cb001  ! 806: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xb2b4c000  ! 807: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xf24d210c  ! 811: LDSB_I	ldsb	[%r20 + 0x010c], %r25
	.word 0xf84d4000  ! 813: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf45de1d7  ! 816: LDX_I	ldx	[%r23 + 0x01d7], %r26
	.word 0xfc54a12a  ! 817: LDSH_I	ldsh	[%r18 + 0x012a], %r30
	setx	data_start_1, %g1, %r23
	.word 0xb6842135  ! 819: ADDcc_I	addcc 	%r16, 0x0135, %r27
	.word 0xb5641800  ! 820: MOVcc_R	<illegal instruction>
	.word 0xb8a54000  ! 822: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xbf520000  ! 825: RDPR_PIL	<illegal instruction>
	setx	0x93c7f9700000cc86, %g1, %r10
	.word 0x839a8000  ! 829: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	2, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4142022  ! 833: LDUH_I	lduh	[%r16 + 0x0022], %r26
	.word 0xb20c216b  ! 834: AND_I	and 	%r16, 0x016b, %r25
	.word 0xf4150000  ! 838: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xfe14c000  ! 839: LDUH_R	lduh	[%r19 + %r0], %r31
	mov	2, %r12
	.word 0xa1930000  ! 840: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5504000  ! 841: RDPR_TNPC	<illegal instruction>
	.word 0xf61c4000  ! 844: LDD_R	ldd	[%r17 + %r0], %r27
	setx	data_start_7, %g1, %r19
	.word 0xb234c000  ! 858: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xb1504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xf80dc000  ! 862: LDUB_R	ldub	[%r23 + %r0], %r28
	setx	data_start_6, %g1, %r16
	.word 0xf8546078  ! 867: LDSH_I	ldsh	[%r17 + 0x0078], %r28
	.word 0xf204e02a  ! 868: LDUW_I	lduw	[%r19 + 0x002a], %r25
	.word 0x85942179  ! 873: WRPR_TSTATE_I	wrpr	%r16, 0x0179, %tstate
	.word 0xff1d6069  ! 875: LDDF_I	ldd	[%r21, 0x0069], %f31
	.word 0xfc552175  ! 877: LDSH_I	ldsh	[%r20 + 0x0175], %r30
	.word 0xf004c000  ! 881: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf6454000  ! 883: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf644e0ef  ! 887: LDSW_I	ldsw	[%r19 + 0x00ef], %r27
	.word 0xbb35b001  ! 888: SRLX_I	srlx	%r22, 0x0001, %r29
	setx	data_start_0, %g1, %r22
	.word 0xbe340000  ! 896: ORN_R	orn 	%r16, %r0, %r31
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c0000  ! 898: LDX_R	ldx	[%r16 + %r0], %r31
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64ca00c  ! 902: LDSB_I	ldsb	[%r18 + 0x000c], %r27
	.word 0xf61c8000  ! 903: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xb1520000  ! 908: RDPR_PIL	<illegal instruction>
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44e165  ! 914: LDSW_I	ldsw	[%r19 + 0x0165], %r31
	.word 0x8794e086  ! 919: WRPR_TT_I	wrpr	%r19, 0x0086, %tt
	.word 0xf0044000  ! 923: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xff1de06e  ! 926: LDDF_I	ldd	[%r23, 0x006e], %f31
	.word 0xb4ac6037  ! 927: ANDNcc_I	andncc 	%r17, 0x0037, %r26
	.word 0xf25ca13a  ! 928: LDX_I	ldx	[%r18 + 0x013a], %r25
	.word 0x899561ea  ! 932: WRPR_TICK_I	wrpr	%r21, 0x01ea, %tick
	.word 0xf11d2081  ! 936: LDDF_I	ldd	[%r20, 0x0081], %f24
	.word 0xbd518000  ! 937: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1c21e8  ! 944: LDDF_I	ldd	[%r16, 0x01e8], %f31
	.word 0xfe04e016  ! 946: LDUW_I	lduw	[%r19 + 0x0016], %r31
	.word 0x8d9561c2  ! 947: WRPR_PSTATE_I	wrpr	%r21, 0x01c2, %pstate
	.word 0xb8ada0e2  ! 954: ANDNcc_I	andncc 	%r22, 0x00e2, %r28
	mov	1, %r12
	.word 0x8f930000  ! 958: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e12d  ! 967: WRPR_PIL_I	wrpr	%r23, 0x012d, %pil
	.word 0xf11ca07f  ! 969: LDDF_I	ldd	[%r18, 0x007f], %f24
	mov	0x11f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60de0a8  ! 972: LDUB_I	ldub	[%r23 + 0x00a8], %r27
	.word 0xfa142061  ! 975: LDUH_I	lduh	[%r16 + 0x0061], %r29
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55e192  ! 982: LDSH_I	ldsh	[%r23 + 0x0192], %r30
	.word 0xfc540000  ! 987: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf044c000  ! 990: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xf044a01d  ! 994: LDSW_I	ldsw	[%r18 + 0x001d], %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1a80c20  ! 1: FMOVRLZ	dis not found

	.word 0x8394e1a6  ! 4: WRPR_TNPC_I	wrpr	%r19, 0x01a6, %tnpc
	.word 0xbda00560  ! 5: FSQRTq	fsqrt	
	.word 0xb9a4c8e0  ! 7: FSUBq	dis not found

	.word 0xbda84820  ! 11: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba90820  ! 14: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a90820  ! 15: FMOVLEU	fmovs	%fcc1, %f0, %f24
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca52031  ! 19: SUBcc_I	subcc 	%r20, 0x0031, %r30
	.word 0xb935d000  ! 22: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb49d60c5  ! 23: XORcc_I	xorcc 	%r21, 0x00c5, %r26
	.word 0xb3a40960  ! 25: FMULq	dis not found

	.word 0xbda9c820  ! 26: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a8c820  ! 35: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb88d0000  ! 40: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xbda00020  ! 44: FMOVs	fmovs	%f0, %f30
	.word 0xb3a80820  ! 46: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a5c8e0  ! 50: FSUBq	dis not found

	.word 0xb9a54860  ! 51: FADDq	dis not found

	.word 0xbba88820  ! 54: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a48960  ! 55: FMULq	dis not found

	.word 0xb1540000  ! 56: RDPR_GL	<illegal instruction>
	.word 0xb1540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xbda81420  ! 58: FMOVRNZ	dis not found

	.word 0xb1a408e0  ! 60: FSUBq	dis not found

	.word 0xb29d212e  ! 61: XORcc_I	xorcc 	%r20, 0x012e, %r25
	.word 0xb1a40960  ! 62: FMULq	dis not found

	.word 0xb3a50860  ! 64: FADDq	dis not found

	.word 0x8795207c  ! 65: WRPR_TT_I	wrpr	%r20, 0x007c, %tt
	.word 0xb5a549e0  ! 67: FDIVq	dis not found

	.word 0x81952051  ! 68: WRPR_TPC_I	wrpr	%r20, 0x0051, %tpc
	.word 0xb7520000  ! 70: RDPR_PIL	<illegal instruction>
	.word 0xba2cc000  ! 71: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xb7518000  ! 82: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a588c0  ! 83: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb804e19f  ! 84: ADD_I	add 	%r19, 0x019f, %r28
	.word 0xb5ab4820  ! 87: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a408c0  ! 89: FSUBd	fsubd	%f16, %f0, %f56
	setx	0xb162ac2c00005f99, %g1, %r10
	.word 0x819a8000  ! 92: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda80820  ! 93: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r22
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44860  ! 98: FADDq	dis not found

	.word 0xbdaa8820  ! 99: FMOVG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 103: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba90820  ! 106: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a589e0  ! 107: FDIVq	dis not found

	.word 0xb28da16d  ! 111: ANDcc_I	andcc 	%r22, 0x016d, %r25
	.word 0xb1a88820  ! 117: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbda50840  ! 119: FADDd	faddd	%f20, %f0, %f30
	.word 0x9194a1d5  ! 120: WRPR_PIL_I	wrpr	%r18, 0x01d5, %pil
	setx	data_start_7, %g1, %r21
	.word 0xb3a88820  ! 124: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xba44a1d0  ! 125: ADDC_I	addc 	%r18, 0x01d0, %r29
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c9000  ! 131: SRAX_R	srax	%r18, %r0, %r29
	.word 0xb42dc000  ! 133: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xb9480000  ! 136: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x859521ca  ! 137: WRPR_TSTATE_I	wrpr	%r20, 0x01ca, %tstate
	.word 0xb7a88820  ! 141: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda90820  ! 142: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd51c000  ! 144: RDPR_TL	<illegal instruction>
	.word 0xb5a88820  ! 145: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb2c54000  ! 147: ADDCcc_R	addccc 	%r21, %r0, %r25
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54940  ! 150: FMULd	fmuld	%f52, %f0, %f30
	.word 0x8794e166  ! 156: WRPR_TT_I	wrpr	%r19, 0x0166, %tt
	.word 0xbda509c0  ! 161: FDIVd	fdivd	%f20, %f0, %f30
	.word 0xb3a8c820  ! 163: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbba509c0  ! 164: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb7a81820  ! 165: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbda90820  ! 169: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbda488e0  ! 170: FSUBq	dis not found

	.word 0x8795e1bc  ! 174: WRPR_TT_I	wrpr	%r23, 0x01bc, %tt
	setx	0xc5da820f000069db, %g1, %r10
	.word 0x839a8000  ! 176: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4a561cb  ! 178: SUBcc_I	subcc 	%r21, 0x01cb, %r26
	setx	data_start_2, %g1, %r21
	.word 0xb8950000  ! 182: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0x8594a050  ! 183: WRPR_TSTATE_I	wrpr	%r18, 0x0050, %tstate
	.word 0xbfa4c8a0  ! 186: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xb9a54840  ! 189: FADDd	faddd	%f52, %f0, %f28
	.word 0xbda4c8c0  ! 190: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbfa81420  ! 193: FMOVRNZ	dis not found

	.word 0xbba50820  ! 194: FADDs	fadds	%f20, %f0, %f29
	setx	data_start_3, %g1, %r19
	.word 0xb1a81c20  ! 198: FMOVRGEZ	dis not found

	.word 0xb9a00040  ! 206: FMOVd	fmovd	%f0, %f28
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 215: FMOVRLZ	dis not found

	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 217: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a48960  ! 218: FMULq	dis not found

	.word 0xb1a94820  ! 224: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa8820  ! 229: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 232: FMOVRLZ	dis not found

	.word 0xb5a5c8a0  ! 235: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb7a88820  ! 236: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	data_start_5, %g1, %r23
	.word 0xb7504000  ! 238: RDPR_TNPC	<illegal instruction>
	.word 0xbda409c0  ! 239: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xbda548e0  ! 241: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a94820  ! 248: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a94820  ! 251: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbbaac820  ! 258: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48960  ! 260: FMULq	dis not found

	.word 0xb950c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xb33d7001  ! 262: SRAX_I	srax	%r21, 0x0001, %r25
	.word 0xb7480000  ! 263: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbda50960  ! 266: FMULq	dis not found

	.word 0xba0c4000  ! 270: AND_R	and 	%r17, %r0, %r29
	.word 0xbb480000  ! 271: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9a80c20  ! 273: FMOVRLZ	dis not found

	.word 0xb3ab4820  ! 275: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a48960  ! 283: FMULq	dis not found

	.word 0xb7350000  ! 284: SRL_R	srl 	%r20, %r0, %r27
	setx	data_start_5, %g1, %r22
	.word 0xbb504000  ! 291: RDPR_TNPC	<illegal instruction>
	.word 0xb825e11d  ! 292: SUB_I	sub 	%r23, 0x011d, %r28
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 296: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 297: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195a097  ! 299: WRPR_TPC_I	wrpr	%r22, 0x0097, %tpc
	.word 0xbe1c4000  ! 305: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb1a8c820  ! 306: FMOVL	fmovs	%fcc1, %f0, %f24
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 312: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x87956093  ! 313: WRPR_TT_I	wrpr	%r21, 0x0093, %tt
	.word 0xbdaa4820  ! 316: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7ab0820  ! 317: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a94820  ! 319: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0x89956170  ! 321: WRPR_TICK_I	wrpr	%r21, 0x0170, %tick
	.word 0xbd504000  ! 325: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r18
	setx	data_start_4, %g1, %r16
	.word 0xbda4c860  ! 329: FADDq	dis not found

	.word 0xb9aa4820  ! 330: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508a0  ! 335: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb5a00020  ! 338: FMOVs	fmovs	%f0, %f26
	.word 0xb5520000  ! 342: RDPR_PIL	<illegal instruction>
	.word 0xbe458000  ! 344: ADDC_R	addc 	%r22, %r0, %r31
	.word 0xb1a88820  ! 358: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0x89942027  ! 359: WRPR_TICK_I	wrpr	%r16, 0x0027, %tick
	.word 0xb7a58920  ! 362: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb7a80820  ! 364: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb5a4c920  ! 369: FMULs	fmuls	%f19, %f0, %f26
	.word 0xb9a98820  ! 373: FMOVNEG	fmovs	%fcc1, %f0, %f28
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad0000  ! 375: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xb9abc820  ! 376: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a50940  ! 381: FMULd	fmuld	%f20, %f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 383: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbab4820  ! 389: FMOVCC	fmovs	%fcc1, %f0, %f29
	setx	data_start_7, %g1, %r20
	.word 0xb3a508e0  ! 394: FSUBq	dis not found

	.word 0xb9a50840  ! 396: FADDd	faddd	%f20, %f0, %f28
	.word 0x8995a09f  ! 397: WRPR_TICK_I	wrpr	%r22, 0x009f, %tick
	.word 0xb9510000  ! 398: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb4b4e1ae  ! 403: SUBCcc_I	orncc 	%r19, 0x01ae, %r26
	.word 0x8395a1c1  ! 408: WRPR_TNPC_I	wrpr	%r22, 0x01c1, %tnpc
	.word 0xbbaac820  ! 411: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1510000  ! 414: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xb3a549e0  ! 417: FDIVq	dis not found

	.word 0xb4bda0e2  ! 418: XNORcc_I	xnorcc 	%r22, 0x00e2, %r26
	.word 0xb1aa0820  ! 419: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x9194a131  ! 420: WRPR_PIL_I	wrpr	%r18, 0x0131, %pil
	.word 0x839460b5  ! 423: WRPR_TNPC_I	wrpr	%r17, 0x00b5, %tnpc
	.word 0xbec50000  ! 424: ADDCcc_R	addccc 	%r20, %r0, %r31
	.word 0xb9a80c20  ! 426: FMOVRLZ	dis not found

	.word 0xb9a409a0  ! 427: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xb60d8000  ! 429: AND_R	and 	%r22, %r0, %r27
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919420ee  ! 432: WRPR_PIL_I	wrpr	%r16, 0x00ee, %pil
	.word 0xb5a94820  ! 434: FMOVCS	fmovs	%fcc1, %f0, %f26
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a409a0  ! 437: FDIVs	fdivs	%f16, %f0, %f25
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 441: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbfa548a0  ! 442: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb3a80820  ! 443: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00040  ! 445: FMOVd	fmovd	%f0, %f58
	.word 0xbfa80820  ! 447: FMOVN	fmovs	%fcc1, %f0, %f31
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa4820  ! 451: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb1abc820  ! 454: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa509a0  ! 455: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb151c000  ! 456: RDPR_TL	<illegal instruction>
	.word 0xbc058000  ! 459: ADD_R	add 	%r22, %r0, %r30
	.word 0xb1a409e0  ! 462: FDIVq	dis not found

	.word 0xb7a5c860  ! 465: FADDq	dis not found

	.word 0xb3480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x5ecfe3b500008ac7, %g1, %r10
	.word 0x819a8000  ! 470: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa80820  ! 475: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0x9195e08e  ! 479: WRPR_PIL_I	wrpr	%r23, 0x008e, %pil
	.word 0xb7ab0820  ! 481: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa488c0  ! 485: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbfaa0820  ! 490: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb1a94820  ! 495: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 501: FMULd	fmuld	%f48, %f0, %f24
	setx	0x1c55b3b00000e942, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2a4210b  ! 506: SUBcc_I	subcc 	%r16, 0x010b, %r25
	.word 0xb9500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0xbba00520  ! 512: FSQRTs	fsqrt	
	.word 0xb9a40820  ! 519: FADDs	fadds	%f16, %f0, %f28
	.word 0xb5a58820  ! 521: FADDs	fadds	%f22, %f0, %f26
	.word 0x8395a00b  ! 522: WRPR_TNPC_I	wrpr	%r22, 0x000b, %tnpc
	.word 0xbfab8820  ! 526: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a408e0  ! 533: FSUBq	dis not found

	.word 0xb8b4c000  ! 535: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0xb3a48860  ! 537: FADDq	dis not found

	.word 0xb7a50840  ! 542: FADDd	faddd	%f20, %f0, %f58
	.word 0xbdab8820  ! 543: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3480000  ! 548: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3a80820  ! 553: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00040  ! 559: FMOVd	fmovd	%f0, %f58
	.word 0xbda48940  ! 560: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb5aa8820  ! 562: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a5c8c0  ! 563: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb1a508c0  ! 564: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb3a48860  ! 565: FADDq	dis not found

	.word 0x83956146  ! 566: WRPR_TNPC_I	wrpr	%r21, 0x0146, %tnpc
	.word 0xbfa44940  ! 567: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb7508000  ! 569: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a80820  ! 577: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x8394a15e  ! 578: WRPR_TNPC_I	wrpr	%r18, 0x015e, %tnpc
	.word 0xb3520000  ! 581: RDPR_PIL	<illegal instruction>
	.word 0xb7a98820  ! 582: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbba508a0  ! 583: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb63c8000  ! 584: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xb7ab4820  ! 585: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a449a0  ! 586: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb5520000  ! 588: RDPR_PIL	<illegal instruction>
	.word 0xb3ab4820  ! 589: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa48840  ! 590: FADDd	faddd	%f18, %f0, %f62
	.word 0xb5a4c920  ! 592: FMULs	fmuls	%f19, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	.word 0xbf50c000  ! 597: RDPR_TT	<illegal instruction>
	.word 0xb3a00540  ! 600: FSQRTd	fsqrt	
	setx	data_start_2, %g1, %r20
	.word 0xb3ab8820  ! 615: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a94820  ! 617: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0xd11a86b90000fb9f, %g1, %r10
	.word 0x839a8000  ! 619: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a00520  ! 620: FSQRTs	fsqrt	
	.word 0xbda00560  ! 621: FSQRTq	fsqrt	
	.word 0xbf504000  ! 622: RDPR_TNPC	<illegal instruction>
	.word 0xb3a84820  ! 623: FMOVE	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0xa1930000  ! 624: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3aac820  ! 627: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa81820  ! 629: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a508c0  ! 630: FSUBd	fsubd	%f20, %f0, %f24
	.word 0x8394602b  ! 631: WRPR_TNPC_I	wrpr	%r17, 0x002b, %tnpc
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 635: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa8820  ! 638: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a88820  ! 640: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbf540000  ! 641: RDPR_GL	<illegal instruction>
	setx	0x56dc2bd200007f18, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa588a0  ! 647: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb5aa4820  ! 649: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0xa1930000  ! 653: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbaa5e1f4  ! 658: SUBcc_I	subcc 	%r23, 0x01f4, %r29
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	1, %r12
	.word 0x8f930000  ! 662: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7abc820  ! 663: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a44840  ! 664: FADDd	faddd	%f48, %f0, %f28
	.word 0xb3a8c820  ! 665: FMOVL	fmovs	%fcc1, %f0, %f25
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c940  ! 667: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb7500000  ! 671: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c9a0  ! 673: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb7a548e0  ! 674: FSUBq	dis not found

	.word 0x8995202a  ! 676: WRPR_TICK_I	wrpr	%r20, 0x002a, %tick
	.word 0xb5a88820  ! 677: FMOVLE	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f930000  ! 678: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xbdab8820  ! 680: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a44960  ! 681: FMULq	dis not found

	.word 0xb3a449e0  ! 683: FDIVq	dis not found

	.word 0xb9a40820  ! 685: FADDs	fadds	%f16, %f0, %f28
	.word 0xbda88820  ! 689: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00560  ! 694: FSQRTq	fsqrt	
	.word 0xb1ab0820  ! 696: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb005e1b6  ! 700: ADD_I	add 	%r23, 0x01b6, %r24
	.word 0xbba44840  ! 702: FADDd	faddd	%f48, %f0, %f60
	.word 0xb7a548a0  ! 705: FSUBs	fsubs	%f21, %f0, %f27
	.word 0x83942126  ! 707: WRPR_TNPC_I	wrpr	%r16, 0x0126, %tnpc
	.word 0xb60da08f  ! 709: AND_I	and 	%r22, 0x008f, %r27
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c820  ! 711: FADDs	fadds	%f23, %f0, %f25
	.word 0xbda409c0  ! 713: FDIVd	fdivd	%f16, %f0, %f30
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 717: FMOVNEG	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0xa1930000  ! 720: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a80c20  ! 721: FMOVRLZ	dis not found

	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 726: FMOVLE	fmovs	%fcc1, %f0, %f24
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 736: RDPR_TSTATE	<illegal instruction>
	.word 0xbeb5a12c  ! 739: SUBCcc_I	orncc 	%r22, 0x012c, %r31
	.word 0xb3a00560  ! 740: FSQRTq	fsqrt	
	.word 0xb3a4c9c0  ! 742: FDIVd	fdivd	%f50, %f0, %f56
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	setx	0x4454ca7400004814, %g1, %r10
	.word 0x839a8000  ! 744: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x1d3ae97600000ac2, %g1, %r10
	.word 0x819a8000  ! 746: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba449e0  ! 747: FDIVq	dis not found

	.word 0x8795203b  ! 748: WRPR_TT_I	wrpr	%r20, 0x003b, %tt
	.word 0xb5510000  ! 753: RDPR_TICK	<illegal instruction>
	.word 0xbb2d3001  ! 756: SLLX_I	sllx	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 759: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a509e0  ! 760: FDIVq	dis not found

	.word 0xbba00520  ! 763: FSQRTs	fsqrt	
	.word 0xb3a509e0  ! 764: FDIVq	dis not found

	.word 0xb5a548e0  ! 769: FSUBq	dis not found

	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3de1fd  ! 773: XNOR_I	xnor 	%r23, 0x01fd, %r29
	.word 0xbda58960  ! 774: FMULq	dis not found

	.word 0xb7518000  ! 777: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a00040  ! 779: FMOVd	fmovd	%f0, %f24
	.word 0xb1540000  ! 782: RDPR_GL	<illegal instruction>
	.word 0x8594a0c4  ! 783: WRPR_TSTATE_I	wrpr	%r18, 0x00c4, %tstate
	.word 0xbba50960  ! 784: FMULq	dis not found

	.word 0xb3aa0820  ! 785: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81c20  ! 786: FMOVRGEZ	dis not found

	.word 0xb951c000  ! 789: RDPR_TL	<illegal instruction>
	.word 0xb294a0d6  ! 791: ORcc_I	orcc 	%r18, 0x00d6, %r25
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794209e  ! 799: WRPR_TT_I	wrpr	%r16, 0x009e, %tt
	.word 0xbfa54940  ! 802: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb12db001  ! 806: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0xb4b54000  ! 807: ORNcc_R	orncc 	%r21, %r0, %r26
	setx	data_start_4, %g1, %r19
	.word 0xb28420d0  ! 819: ADDcc_I	addcc 	%r16, 0x00d0, %r25
	.word 0xb7641800  ! 820: MOVcc_R	<illegal instruction>
	.word 0xbaa44000  ! 822: SUBcc_R	subcc 	%r17, %r0, %r29
	.word 0xb3a408a0  ! 823: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbb520000  ! 825: RDPR_PIL	<illegal instruction>
	setx	0x9249b22e00005c8d, %g1, %r10
	.word 0x839a8000  ! 829: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a4c8a0  ! 831: FSUBs	fsubs	%f19, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb80c21cc  ! 834: AND_I	and 	%r16, 0x01cc, %r28
	mov	1, %r12
	.word 0xa1930000  ! 840: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3504000  ! 841: RDPR_TNPC	<illegal instruction>
	.word 0xbbaa0820  ! 842: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda589a0  ! 850: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xbda00520  ! 851: FSQRTs	fsqrt	
	setx	data_start_1, %g1, %r21
	.word 0xb8344000  ! 858: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xbf504000  ! 860: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xb3aa0820  ! 864: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7ab0820  ! 866: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbda508a0  ! 869: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xbda50860  ! 872: FADDq	dis not found

	.word 0x85952186  ! 873: WRPR_TSTATE_I	wrpr	%r20, 0x0186, %tstate
	.word 0xb3aac820  ! 874: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab8820  ! 876: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa8820  ! 880: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7343001  ! 888: SRLX_I	srlx	%r16, 0x0001, %r27
	setx	data_start_2, %g1, %r22
	.word 0xb5a88820  ! 894: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xba34c000  ! 896: ORN_R	orn 	%r19, %r0, %r29
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 907: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9520000  ! 908: RDPR_PIL	<illegal instruction>
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 911: FSQRTq	fsqrt	
	.word 0xb7aac820  ! 913: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00040  ! 916: FMOVd	fmovd	%f0, %f24
	.word 0xb7aa4820  ! 917: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x87956061  ! 919: WRPR_TT_I	wrpr	%r21, 0x0061, %tt
	.word 0xbfa58820  ! 920: FADDs	fadds	%f22, %f0, %f31
	.word 0xb7a90820  ! 922: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a84820  ! 924: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbaac21c0  ! 927: ANDNcc_I	andncc 	%r16, 0x01c0, %r29
	.word 0xbba54840  ! 929: FADDd	faddd	%f52, %f0, %f60
	.word 0xb7a589e0  ! 931: FDIVq	dis not found

	.word 0x899460f3  ! 932: WRPR_TICK_I	wrpr	%r17, 0x00f3, %tick
	.word 0xbba4c860  ! 934: FADDq	dis not found

	.word 0xb3a54960  ! 935: FMULq	dis not found

	.word 0xb7518000  ! 937: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c9a0  ! 945: FDIVs	fdivs	%f23, %f0, %f30
	.word 0x8d95e1fa  ! 947: WRPR_PSTATE_I	wrpr	%r23, 0x01fa, %pstate
	.word 0xbba88820  ! 953: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb8ac6045  ! 954: ANDNcc_I	andncc 	%r17, 0x0045, %r28
	.word 0xb3a88820  ! 956: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f930000  ! 958: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54940  ! 964: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb5a48920  ! 965: FMULs	fmuls	%f18, %f0, %f26
	.word 0x9194a11b  ! 967: WRPR_PIL_I	wrpr	%r18, 0x011b, %pil
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 978: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a90820  ! 980: FMOVLEU	fmovs	%fcc1, %f0, %f26
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 984: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb9a50960  ! 997: FMULq	dis not found

	.word 0xbba00520  ! 998: FSQRTs	fsqrt	

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

	.xword	0xa74ffcbd45c40a9d
	.xword	0x128211da135a9278
	.xword	0x9a6aa725a261a7ef
	.xword	0x167ce00c240457a1
	.xword	0x76233faa7f40e730
	.xword	0x911ab7f7cdc00054
	.xword	0x79f737db4b74ea5d
	.xword	0x9bd912336a927d46
	.xword	0x5d41f8f08a6c00ba
	.xword	0xcd87ff0e2b8228a6
	.xword	0xe8cd5ce275316603
	.xword	0xc501f9ee91a59226
	.xword	0xdbda2f726e6cd26f
	.xword	0x09f3bef43e129572
	.xword	0xfcfb91f7b7b4df0a
	.xword	0x1426f277d035c7a6
	.xword	0x7d10f6da1291cd8d
	.xword	0x565eb0b17a099f9c
	.xword	0xbaede0944202cb23
	.xword	0x4a4435302130f89e
	.xword	0x60f0fd1f71699577
	.xword	0x87ae6a411ec2e7e0
	.xword	0x91990321d6e92c11
	.xword	0x86fc5a75a094521c
	.xword	0x0c3eb12adf48d0ef
	.xword	0x8e29425140ba62bc
	.xword	0x1d761f557af61da0
	.xword	0xd292b3a52265c4e1
	.xword	0x445bf5c3c54ebbba
	.xword	0xfa550859054053b4
	.xword	0x26790f1b495ded32
	.xword	0x9b9cb3a890fd508a
	.xword	0xa4141378af3167c2
	.xword	0x1344984e8ca2fd5b
	.xword	0x2caaa0e0d59a3ab4
	.xword	0x5deb7560d397e278
	.xword	0x4ad8a601eef1e7a6
	.xword	0x62a38191f567d3b9
	.xword	0xd42ff3df5fb00051
	.xword	0xe1f6a0bc763616d3
	.xword	0x782a1f6eb27479ba
	.xword	0x1cb6a7f339506383
	.xword	0x882ddb0ef034fddf
	.xword	0x881b4c4a508e7975
	.xword	0x7260c43922fa734a
	.xword	0x2ec3653d7c86fd08
	.xword	0x33f1986145d95afe
	.xword	0x93dd6d6adaea75cd
	.xword	0x6b03bb6ccb14b422
	.xword	0xc8aba190b033c327
	.xword	0x3b41b4830c2f71a7
	.xword	0xa4151e97de07f6c5
	.xword	0x3c0f903313aa4086
	.xword	0x78d1a411c63d666d
	.xword	0xe703e2022421d62f
	.xword	0xcb3c20a9ea595e4f
	.xword	0x8204c504fc6eda8c
	.xword	0x0e47c828dfc3f13e
	.xword	0x83e85ae207ae2cc8
	.xword	0x76807552aafa9ca0
	.xword	0xab4eb76af637b162
	.xword	0xf404794780e0f536
	.xword	0xceb9123350e92b9f
	.xword	0xb8e53c869f6e118d
	.xword	0x2212096af3dd0115
	.xword	0x110dbcaa8c48754a
	.xword	0x3031a39ccdd1b5dc
	.xword	0xf5baa703946f4b6e
	.xword	0x382bdb00864f9ee7
	.xword	0x3dba6d3dbcdc9114
	.xword	0x585d41e57705fda0
	.xword	0xead10d30f28b1492
	.xword	0x5dfe2c2e72186c94
	.xword	0x6c1af666df298bc1
	.xword	0x1a71df41aa15d67a
	.xword	0x175a220a31ad695c
	.xword	0x920af4c1c84b46bd
	.xword	0xd2b8ea4503ec0492
	.xword	0x03e5d88280ac0de0
	.xword	0x6845315cda840785
	.xword	0xc89f48ddef4b6e80
	.xword	0x7229ceb89504391e
	.xword	0x5e38bc93da4bede3
	.xword	0x59487f6f5b62d3e5
	.xword	0xdacde76484dfa6b9
	.xword	0x8fcd3562d1449da3
	.xword	0x011c862ab588613f
	.xword	0x3a049c6bac13aa39
	.xword	0xc71636f0f6efb58e
	.xword	0x34b60ebc3b8ce738
	.xword	0x2bbb46a6fdea719b
	.xword	0xd06bfdda8fc52d57
	.xword	0xc855635b19120d0b
	.xword	0x889cf57fe0d2214d
	.xword	0x6b28fb322c97bf54
	.xword	0x7e11b82d650ff1c5
	.xword	0x082f0505a612159a
	.xword	0xfc9b974480f762f6
	.xword	0xa26d71b43f2398aa
	.xword	0xb41fef182101a8e5
	.xword	0xb1c164a70e37f0fc
	.xword	0xf8dd1eaf4a0c0086
	.xword	0xd2af23342bfb959b
	.xword	0xfe124d6a38de4b93
	.xword	0xb206e25d13f269e6
	.xword	0x5ffd89c82da2e9ed
	.xword	0xf62f59003a1d4e09
	.xword	0x33f874f19847b308
	.xword	0x461044cccc51a36f
	.xword	0x18bf5992bb0fbbb5
	.xword	0x07a81bab523301d3
	.xword	0x1c823869f4fbba31
	.xword	0xd2875111f95ec216
	.xword	0x8d5d1deb9ee5011d
	.xword	0x3ef7f9496818a1d4
	.xword	0xc176c457fc84c1c5
	.xword	0xbed90a8525745766
	.xword	0x1a04a6f8cfe909a5
	.xword	0xcd2879e43dcaf77b
	.xword	0x444fe4abeecc634e
	.xword	0xb5fc77f0011d235f
	.xword	0xa7e2a5a28629b638
	.xword	0x32209ddd87d22d60
	.xword	0x2052fea5be2b1967
	.xword	0x172aca84575a2a8a
	.xword	0xf73add33734f6d8b
	.xword	0xf7e4446ae8c55abe
	.xword	0x0378b99db80baa9c
	.xword	0x8fd2a24bcf7ca184
	.xword	0x50bab9afd5318c8e
	.xword	0xea6d23f0c8c23133
	.xword	0xb0595976684cd225
	.xword	0xf419b39d5506b2c7
	.xword	0xdca0a9d7eae03623
	.xword	0x98e370276590523a
	.xword	0xc6042b661900588f
	.xword	0x4c6593d589181b87
	.xword	0xd9209a911d73c0da
	.xword	0x825e6e139555fad2
	.xword	0x6f5762a30ca1f5ea
	.xword	0x7f65a638703ad253
	.xword	0x47aae4ada53a84c9
	.xword	0x45b18daea7af788b
	.xword	0xa0c77321862a74c6
	.xword	0x6889c3d2bf2c9176
	.xword	0xe4df486a876281ce
	.xword	0x86ee97c0950442b6
	.xword	0x7bb9076d478b44f9
	.xword	0xe483a5b50d88c262
	.xword	0xfd82b0c6a55df0ef
	.xword	0xca653303e8db5cb3
	.xword	0x5f84f901727e79bb
	.xword	0xb53e6dcf14423919
	.xword	0x99116e4cef5f6388
	.xword	0x59a486c65f810bb2
	.xword	0x11f2ccea68c68fe1
	.xword	0xdc1107264b276ce5
	.xword	0xa14e73646e1434ba
	.xword	0xedd65585233d56e3
	.xword	0xd86c234a16f4a73e
	.xword	0x16273b81a0fce74a
	.xword	0xf1f7880d427490dd
	.xword	0x67e8986cf5a047f1
	.xword	0xeec9b0fb5795c510
	.xword	0xd364610b793f10be
	.xword	0x933c976428e850d8
	.xword	0x254175d9d4331bed
	.xword	0x9b9b3c5e6b4c898f
	.xword	0x76497113e391e9c7
	.xword	0x052bce506e6ffd6a
	.xword	0xd93437646df7e894
	.xword	0x1e58d924964ce391
	.xword	0xfc7e645590810f1f
	.xword	0x089c428d30bbbc72
	.xword	0x4a84f647fd15da17
	.xword	0x95bc1d9079513c1f
	.xword	0x9b7c3d80070acf90
	.xword	0xe214307c3c74ad06
	.xword	0xb058e34630ed525d
	.xword	0xa034b18f84a58b5e
	.xword	0xe340e2c88bbb0f20
	.xword	0x54930a73f5cd2954
	.xword	0xa94eb97f34a84913
	.xword	0xe6e8f3b590df851d
	.xword	0x239bc530fb6f3464
	.xword	0xfeba17ebf0e08246
	.xword	0x1fdd346c3e38bdb3
	.xword	0xab27fa9a21b6cb20
	.xword	0xfea4f65f9f890365
	.xword	0x34c0897ab723631f
	.xword	0xc1ce24abcca884fd
	.xword	0x616373268009e0d5
	.xword	0x1f87e7fcafbfea56
	.xword	0x47cc8e54c0781168
	.xword	0x7a4ce9434fabc514
	.xword	0x76ecd2dc320db2d7
	.xword	0x9b526081e9fba938
	.xword	0x69d8233c3952a980
	.xword	0x027e284f66780f7c
	.xword	0xf457b55dcc3af4ec
	.xword	0x53591be160784c9d
	.xword	0xc7c3f8d1babab8c2
	.xword	0x11ef27700a399b2c
	.xword	0x065293475138545f
	.xword	0x08a37fc3bb28ed1b
	.xword	0x9e851be712098ffd
	.xword	0x7369e679fee95f8f
	.xword	0x54c9e5c52f2f79da
	.xword	0x774dcf8c5fe7d525
	.xword	0x34454d47b08ae45a
	.xword	0x93c40f2054b4103f
	.xword	0xac676a138178ae36
	.xword	0x278e83200c599a53
	.xword	0xfa343ae22f45b348
	.xword	0xb142cab0e57140ce
	.xword	0x9e27ebe631052b0d
	.xword	0x8f542fef69c66cb5
	.xword	0x00aecf128e597534
	.xword	0x249a3fcfa20a3267
	.xword	0x9dafc231ea84d904
	.xword	0x22d1c621cdacdb0d
	.xword	0xac01db8aca532cc5
	.xword	0xc76349fa6cfc6b25
	.xword	0xe6e79b3e6e83de8c
	.xword	0x9a9d888fefbefe66
	.xword	0x722a0434e984d32b
	.xword	0x630703999fc37532
	.xword	0x17a2730481817bd6
	.xword	0xfac8d9c8c07395d8
	.xword	0x782bcbf6a7c4ead9
	.xword	0x0359f671a39441ba
	.xword	0x0edc6064c40108b2
	.xword	0xbaa76b196a89a940
	.xword	0x2f0f82cf580f92c4
	.xword	0x2809118f97f3aba2
	.xword	0x8e7f9f317dac047a
	.xword	0x4db1dc94a8fc3172
	.xword	0x19fd3f821a49a8a6
	.xword	0x950e7c35af264bc9
	.xword	0x8a56a6d5094d5d24
	.xword	0xea1e687319574a9e
	.xword	0xb91c5cb7e64749c8
	.xword	0x6371ef2498a156ab
	.xword	0x343598566da82035
	.xword	0xe9810f0aa1687e8b
	.xword	0x942836a75187f171
	.xword	0x8e618ec72c75a8d2
	.xword	0x506e35f5443ec6c7
	.xword	0x77a107216a438788
	.xword	0x5cccf858c0e0acc9
	.xword	0xcf42d7910c568f41
	.xword	0xfcd452232e02bd6f
	.xword	0xb1362681e0c39b1b
	.xword	0xd5e638bd5fdd1f96
	.xword	0x1f5f2e4bdeeedc40
	.xword	0xa04e80a81f435de8
	.align 0x2000
	.data
data_start_1:

	.xword	0x68871c66f34ae279
	.xword	0x11256cd11d0e2765
	.xword	0xac0c579392e394e8
	.xword	0x862bfdbf856f4683
	.xword	0x4c505eb87f56312f
	.xword	0xd02327fd4eeef0b5
	.xword	0x278999eac11ac6ea
	.xword	0x3f387ec5aaedf55d
	.xword	0x34f4bd006969c6d3
	.xword	0x148f033c1054bb86
	.xword	0xb135f63348f2c92b
	.xword	0x208cd75f7c0a1763
	.xword	0xcdb7d33e9eced3fa
	.xword	0xa0e9b4965a2545e7
	.xword	0x4bc4cdea9aee191a
	.xword	0xc5083966ed72be02
	.xword	0x25395ca87d7f597d
	.xword	0x40fea249560a3a08
	.xword	0x0b062c948ef0a754
	.xword	0x8968229822323663
	.xword	0x117aa7a93dc75ed7
	.xword	0x28b0f1ce80da8170
	.xword	0x5726ce530ea26d09
	.xword	0x9d6fedb1a701d3fe
	.xword	0x1146d6dbb7ec71e7
	.xword	0x965ba6b9dec5c422
	.xword	0xaaeff9cd55edb4ef
	.xword	0x0911210a24ef82e4
	.xword	0x0ef107a512d7f79e
	.xword	0x0e6593396df987cb
	.xword	0x418bc3c9561749dd
	.xword	0x521540196986e4be
	.xword	0xf5272e266e45ef08
	.xword	0x0fe6a9f92684531d
	.xword	0xc2c9d3a05cd8bbba
	.xword	0xbd4beefaa3e32ea8
	.xword	0x9c7d172f5de80cce
	.xword	0x97e1943f13990655
	.xword	0xa934f491884b2674
	.xword	0x05dc9cd5e7f97088
	.xword	0xe84fd68c8a17a69f
	.xword	0x17144688db7c8050
	.xword	0xbb055bbb80cddc11
	.xword	0x6445d7ab9e8d6346
	.xword	0xa571ca114c65bb14
	.xword	0xc25546a9e3431963
	.xword	0x3a81d0a3505fd94b
	.xword	0x4282cc90819af55c
	.xword	0x584104102f37d87b
	.xword	0x02e289aced2028fd
	.xword	0x4f21dc9f3421f22f
	.xword	0xe23d71e291135c1d
	.xword	0x9f845a319b55808c
	.xword	0xd59698585b4a16a2
	.xword	0x27fb198ca64a8a04
	.xword	0x69603b798fbb9884
	.xword	0xf98c350ab3d31840
	.xword	0x771f33b75fc98225
	.xword	0xc752965eeb91a6cf
	.xword	0x3cca813b75a093b3
	.xword	0x2a43dfe691ec5206
	.xword	0xb3819c63f1ea301f
	.xword	0xee69aabdb5638695
	.xword	0x75a08af5e8d64a2e
	.xword	0xc0f9ed072f6dfb31
	.xword	0x044ecfdffb96e78e
	.xword	0xa05a2d0fb6c61eff
	.xword	0x0ebf290fd280b9a3
	.xword	0x1435c87ac47dd0c4
	.xword	0x87e7a17147d83f7f
	.xword	0xa3c721a68bdcc5a9
	.xword	0x140e131555051502
	.xword	0x200a412aa967c142
	.xword	0xa7e35da2fcc2b43a
	.xword	0xc331667aaa0893d6
	.xword	0xbfad9ab204c8efcd
	.xword	0xc00533a0cb6eaeae
	.xword	0x17e098763ac8519a
	.xword	0x5c8b327bc20569f8
	.xword	0xbd9e66ea679a41b1
	.xword	0xa61800b2bd92e4e8
	.xword	0x4e3d596e6c8cd633
	.xword	0xb7f015e975ee7c37
	.xword	0x316f4aafb4f33fa3
	.xword	0x2b6db8834552f2d7
	.xword	0x63ef989e551edcc9
	.xword	0x5a4552123e8f6654
	.xword	0xa39b21958b28184a
	.xword	0xfd855729c2871c82
	.xword	0xfbaacced61e5eb0a
	.xword	0x1880f86c3a9ce0be
	.xword	0x6e753bdcdaf0eac1
	.xword	0xa83846f526bffbb4
	.xword	0x1eb77f280b185795
	.xword	0xe8f87abbe60a1346
	.xword	0xd8d0abe8527e4151
	.xword	0x4f60cdff3b5ac75b
	.xword	0x137d5966aabd5936
	.xword	0xfb5c1c0fffea4cf8
	.xword	0x4b2988a0d140aef9
	.xword	0x001a48ba79a7965c
	.xword	0x1d42a141a6a9e3a3
	.xword	0x179c626309476c3d
	.xword	0x964e9dbda0d6e096
	.xword	0x83ab29a079958167
	.xword	0x00adf9c677bcf108
	.xword	0x104f334410ebbccd
	.xword	0x0adad43d71febcc7
	.xword	0xbbc4b2605b2d670a
	.xword	0x7cd17ee70428a7a4
	.xword	0x72ac0fb2b93def74
	.xword	0xb7161d0d1a791469
	.xword	0xfae25171cfd0c1bc
	.xword	0xb84ec8a962702ab4
	.xword	0x50e2229a034a26a4
	.xword	0x1373f9b50ac009ce
	.xword	0x509ea1f7096447a8
	.xword	0x9232b1c1f3cc9d33
	.xword	0xf1478ec000f83910
	.xword	0x216507412335fb20
	.xword	0x77ccc01b266bb726
	.xword	0x0d24cfa2ee8b65af
	.xword	0xe00327caac27b88a
	.xword	0xfadba700007f193f
	.xword	0x811e8de59f589f4d
	.xword	0x822dd2a0116aba46
	.xword	0x96510403eff380df
	.xword	0xc9091aef9e382cf1
	.xword	0x4f6f226a78ebf631
	.xword	0xf6d5e95b50afa04b
	.xword	0xf5f03af0427f32fd
	.xword	0x8b2ece460d65490f
	.xword	0xd67cd164fec34fb5
	.xword	0xb50c13a725f69131
	.xword	0xd585b33f194a73c3
	.xword	0x51053861957a5898
	.xword	0xdce0c52bed14230e
	.xword	0x7a5d68473499525e
	.xword	0x214912b726b558cb
	.xword	0x72a706b0be6e4b23
	.xword	0x8f1c8f59621df4c8
	.xword	0x92d7e532350576a2
	.xword	0xc4941c0fe23fb761
	.xword	0x94876e5577b3ce77
	.xword	0xb6bdbd4a44fca7f6
	.xword	0x6923ace28051471a
	.xword	0xad6ef6cde20ccc86
	.xword	0x5cb8f6d7f531494a
	.xword	0xe333ed8907373c25
	.xword	0x64128098788a1629
	.xword	0x6a83cd7e6c7501bd
	.xword	0xbe3c626ce95b194f
	.xword	0x3183f9b703c05bf4
	.xword	0x44ed60cd1556a239
	.xword	0x4356616a230ce78e
	.xword	0x0a6f99b2be4f525a
	.xword	0x29f2ff4d8a39b07b
	.xword	0x5220211ebb6cd652
	.xword	0xbca83c371e7a38ea
	.xword	0xb168dc5f790f7be4
	.xword	0xb20818f9b6f49901
	.xword	0xbc7b5b0733adadcb
	.xword	0x057fdde5c520715d
	.xword	0x74f733e103be6125
	.xword	0xd8ed92b6c85e1929
	.xword	0xb208cd55e7f908c1
	.xword	0x2b1280c723c2e458
	.xword	0xd5eb886c607a10a2
	.xword	0x54c8cf6c3565a6f6
	.xword	0x3e30fbcc790caea1
	.xword	0xacfd3292adec2561
	.xword	0x7deb3dc9bcae1137
	.xword	0x488918b70b9b7fef
	.xword	0x58c5bb59d22c4acc
	.xword	0x8780ab8b484c5ec6
	.xword	0x69f95f825cce1b3f
	.xword	0xf17ac8a47a1294c4
	.xword	0xa4b9313cf9f1c782
	.xword	0xb7ee6b605fa2b2db
	.xword	0x0810163a898f4f12
	.xword	0x95833a189efa21e3
	.xword	0x9362c9f6dced7425
	.xword	0x6bd4f3374aaf59d9
	.xword	0x9b2949c95dfab6ff
	.xword	0xa9eceebd3298478a
	.xword	0x4cf0aca1fdb700fc
	.xword	0x6bff57eb5db1170b
	.xword	0x57142874f0d80c34
	.xword	0xda2f01445f0780a0
	.xword	0x3d4fd5fbb3800b11
	.xword	0x949e59ef40700595
	.xword	0x134cbb4cb0110138
	.xword	0xa586dc49afe6cb3c
	.xword	0xbf41aa9f61529573
	.xword	0xc50629dbc7ae1e3a
	.xword	0xda3efa338ffdf9ff
	.xword	0x859b21d5ecd896e9
	.xword	0x0f9bd7bc563d6083
	.xword	0x861229fc6714623f
	.xword	0x4762f1771d987983
	.xword	0x1532294ef03ab17b
	.xword	0x88398194ee3c0c15
	.xword	0xb2c283a9079bb3c4
	.xword	0x71ce0453bcf37f88
	.xword	0x2f9835ee46a2e766
	.xword	0x45b5038262582cfd
	.xword	0x2e7adabf0d55179e
	.xword	0x6732e614440b2cab
	.xword	0x1b43d81f40f678a3
	.xword	0xb70f02114437919c
	.xword	0xe595c79721d545ad
	.xword	0x9f69a8574976680b
	.xword	0x76ed986ce590b360
	.xword	0xa886ead160e0f199
	.xword	0x33f31481c1aa8439
	.xword	0x6d8dcc4b4c71bedd
	.xword	0x6c4da5d3572c143d
	.xword	0x56e9d91813b01f9b
	.xword	0xc47d599c1539e66e
	.xword	0x9a13b858ab832451
	.xword	0x598bd343c0b6cbec
	.xword	0xbab264454b40017e
	.xword	0x23771cada950c16f
	.xword	0x59c3fdeddfbfe9dc
	.xword	0xe75cbfcb4044f3f4
	.xword	0xf21dc2275a21e154
	.xword	0xd4a87ab5f5d5a704
	.xword	0x323aad742a273bbf
	.xword	0xf09624d913869480
	.xword	0xb6640c1ea6324282
	.xword	0x1654dff1aca31051
	.xword	0x0ccb20e7f23d8169
	.xword	0x16db3551f6a8f319
	.xword	0x5bf2848296dbea13
	.xword	0x80aba718d0cfff6c
	.xword	0x3fd8996b7c84a3e0
	.xword	0x172c650f662e0598
	.xword	0x31087f7a24de69d1
	.xword	0x2768066b3d7d8a9f
	.xword	0xb1e632b82b57cee1
	.xword	0x3481c50e6173c607
	.xword	0x62f0ae0913fa5240
	.xword	0xed7aa11cc8f3d589
	.xword	0x6fe717b8192d6027
	.xword	0xeebd7c11f5e53e74
	.xword	0xe7bcb20f73f8fca9
	.xword	0x5bf71c5e0aee87c1
	.xword	0x88e76df20b601c83
	.xword	0x3e85e4fb21fe7291
	.xword	0xcb4cd85581c37ace
	.xword	0xf9a776bbefec7cf9
	.xword	0xc9bb44f2a45cc3ca
	.xword	0xe3ea70f19ea11363
	.xword	0x95b18f40443cd9eb
	.xword	0x78896655ec96fddc
	.xword	0xcab1763f7e27e904
	.align 0x4000
	.data
data_start_2:

	.xword	0x1ac1adde404cb5c7
	.xword	0x9f62e69a2eb652e7
	.xword	0x2d0712908cdad23e
	.xword	0x56f5a4e603fd6b6b
	.xword	0x44adbbc4aba84abb
	.xword	0xad52e7e7bb108391
	.xword	0xfb7bdf0cbd7ef313
	.xword	0x3083fd208393961f
	.xword	0x78bc4d8082b3ce23
	.xword	0x8ded98694a5a6b91
	.xword	0xb71e41f124c9c1d0
	.xword	0xa3268c6c9e59e579
	.xword	0x4698826178b75097
	.xword	0x8cbb734eaec16544
	.xword	0x9ffae4ac5cc1ffa1
	.xword	0x30138bef3467868a
	.xword	0x03ef29b6e57118d2
	.xword	0x2e0751e74857255d
	.xword	0x51494a11025efff7
	.xword	0xf841a9ae3cce5371
	.xword	0x528f6e2189fc793d
	.xword	0xa52ec9eb451af3ab
	.xword	0x2bec6ec4a2fefff7
	.xword	0x24562d343bda3553
	.xword	0x66d40f029c7d224c
	.xword	0x7de0c3c2ec4916ab
	.xword	0x8914c30dba797ced
	.xword	0xecab67a1b5f46afd
	.xword	0x2a99f95fdfcfe593
	.xword	0xa56ad80311aaeb34
	.xword	0x71cfdb03c35962a2
	.xword	0xbdd2d3ef875f1312
	.xword	0xdaefef869e845b1c
	.xword	0x6ac5fa63bbfc6512
	.xword	0x686b2cd313042cf4
	.xword	0x348ac66325bf0992
	.xword	0x43964e0aaa152a1d
	.xword	0x96b7e04accf9eaa8
	.xword	0xf7a24f03646a1b25
	.xword	0xcc186467b61c0ee8
	.xword	0x680c2726c9723e82
	.xword	0x09ef3ed2e6ae36bb
	.xword	0xa20fcff9f75ac0d5
	.xword	0x70a183701fe12e1f
	.xword	0xd006b622ea10488c
	.xword	0x5d3d9cae3989c280
	.xword	0x4a1b54ffd28f927d
	.xword	0x67a597002bab6d28
	.xword	0x21c79e3d93cd33cc
	.xword	0x4afab5083b273684
	.xword	0x583fe19a02d7b860
	.xword	0x228a2fcc12484325
	.xword	0x1f1a9c4e8faa8f04
	.xword	0x535ed2e7f1fcd651
	.xword	0xeb8f7acfb7b448ab
	.xword	0xd6da764a4d6cdc1d
	.xword	0x8fee9afcf07aed5d
	.xword	0x4a2e39e996666513
	.xword	0xe7a143f0d1c9fad1
	.xword	0x4d595b660381bf0d
	.xword	0x635ee5fe56023de6
	.xword	0x482e4399e29a476a
	.xword	0x6d4878ffe2adc4fb
	.xword	0x711ea3965e3470be
	.xword	0x9726b5c20310066d
	.xword	0x977305449b049aee
	.xword	0xe5e6dddd21169f7a
	.xword	0x812115d382137cbd
	.xword	0xea6ddd6f5485e104
	.xword	0x509e445bd36ec0a3
	.xword	0xef24a01915993159
	.xword	0x19fbe17db5610b2e
	.xword	0xb2adc366b8f47db8
	.xword	0x4aec40dc003f961c
	.xword	0xbb9ff5e042379646
	.xword	0x4d22316a4b9bf886
	.xword	0x85f91bfb21d55b0d
	.xword	0x48eaa9e622fabef6
	.xword	0xfa411cb6fde410ce
	.xword	0x417e2a5ba24ae66d
	.xword	0x0e3f406561e684c2
	.xword	0x71e4fc5e7b0b6d1e
	.xword	0x3711f73c1ba1eb5c
	.xword	0x1b5890fc3fc0c674
	.xword	0xaace035bec087439
	.xword	0xf61f81ab8080b45f
	.xword	0x3c780447e88849f4
	.xword	0x6ae7826fd08e62ae
	.xword	0xa93a229ed7d14161
	.xword	0xe2b4dc09dbfd53ea
	.xword	0x122fa8514bf92bf6
	.xword	0x1a888d041549ff3e
	.xword	0x38e8af26e6d376d8
	.xword	0x243478c148e1d79e
	.xword	0xb290d66a41894a02
	.xword	0xa713b861ad92e5fc
	.xword	0xae54ff03445562b3
	.xword	0xee44b66ea8e4270a
	.xword	0xf1e4acab7a73ee45
	.xword	0x35d6deacc31af11c
	.xword	0x309194c9cd2693e1
	.xword	0xb0e235a2cc3f84ad
	.xword	0x8f116965593ee194
	.xword	0x76ab33803257b20c
	.xword	0x894a75e252fcaae3
	.xword	0x770a0e7d0c3e0bfe
	.xword	0x08847204f699625d
	.xword	0xe09bf4de83484bff
	.xword	0x260a10035910df16
	.xword	0xeca6219ac969b7e7
	.xword	0x86ce9a4ebe29953c
	.xword	0xbe8e4be01a34f6d7
	.xword	0x6f899844eb2309a4
	.xword	0x64e31950df5f0b76
	.xword	0x1f6cdcde21105266
	.xword	0x2776612b961aafa5
	.xword	0x3d092631d2a057a3
	.xword	0xc9fc67e4ab852645
	.xword	0x1fd45365288ea64f
	.xword	0x89425af0db9af206
	.xword	0x49e47d6e0074f811
	.xword	0x2a2a7b258cd5b582
	.xword	0xb5a6e90d5f9a4b71
	.xword	0xf6ffb2cb3299e38a
	.xword	0x8b2959b02a8759dd
	.xword	0x2f84155be784f477
	.xword	0xd13fb9d51958d81d
	.xword	0xc66d791fa17dad09
	.xword	0x670d58bdea1cfadf
	.xword	0xd919a0d45ed267b3
	.xword	0x9e449156b1729353
	.xword	0xa3cf56de3dddedec
	.xword	0xe5062d0c45bb3567
	.xword	0x3839caff5105583f
	.xword	0xa74f1b4f867131ca
	.xword	0xfdc1d7be2543bcdd
	.xword	0x4e9b7fee77058338
	.xword	0x4da5089d07b9e197
	.xword	0xe9042e1281b80873
	.xword	0xd26a2d2e616bbb2f
	.xword	0xf6120e5678ce76b8
	.xword	0x4e7cec3bb48fe36f
	.xword	0xc3947af4b2886169
	.xword	0x88f39feabd35b929
	.xword	0x534345ac9a1e51c4
	.xword	0x6dc3defb2f769d43
	.xword	0x707813b00f66b611
	.xword	0xdba00b1d8b67c401
	.xword	0x6e8fb07069136f39
	.xword	0x59cd5190663b8c64
	.xword	0xc737fb2974204173
	.xword	0xacca688f5018be99
	.xword	0x484807cb4dbf3c75
	.xword	0x2b0837d8935bd2f6
	.xword	0x55956fc82883c2c7
	.xword	0x67db6875fc81ce65
	.xword	0x882eb0d875152486
	.xword	0xc5bc4f0688de3f54
	.xword	0x87930ffcab6020fc
	.xword	0x4a0a3dba3d16ef16
	.xword	0xad296f22b85a8d92
	.xword	0x910b222539f6187e
	.xword	0xc29146ea2a8c0955
	.xword	0xd2a4632ef47d94d7
	.xword	0x07bff64b97a75ebb
	.xword	0x964026e1fc47ed76
	.xword	0xa0066133b0e89e9f
	.xword	0x4bb7c8bdfed5aed9
	.xword	0x99b682bc1a10ff7d
	.xword	0x96041bb80ea4967c
	.xword	0x84a79722a53eee2a
	.xword	0x45525aafbb6af18e
	.xword	0xad61e34799bbb06b
	.xword	0x28f37c06a12579fd
	.xword	0xf3af824b6d3e307f
	.xword	0xd2a1639903a6a2f0
	.xword	0x82d963edaf5e7ceb
	.xword	0xdc3d9b5bffd46beb
	.xword	0x5d48befb93b382a9
	.xword	0x075bc6c9f426fb94
	.xword	0xc949ded706c22471
	.xword	0x7b04609bc5f33be3
	.xword	0x805977eba2109df8
	.xword	0xab3125cab69a46ee
	.xword	0x40b8bd769205b03d
	.xword	0x61b50683315fad01
	.xword	0x65b5e35710993112
	.xword	0x833683bcae00ed12
	.xword	0x5da1544557a194a4
	.xword	0x6370c41312e8c48b
	.xword	0xc428d1f3bf6a1062
	.xword	0xf03081d735648269
	.xword	0x7cd15b650b285223
	.xword	0xd465b6a54f12106e
	.xword	0x609fe9cc975f2b60
	.xword	0x0fbabbb25bc9d6cf
	.xword	0x29765584a973fcd4
	.xword	0x753dfec5843cdc71
	.xword	0x2189fdac0a9dabfa
	.xword	0x8099e0a64393add1
	.xword	0xc3e06b748c47400f
	.xword	0x6e2b24795be8087f
	.xword	0x045c78bae07aaf6e
	.xword	0x912b7fc730244e16
	.xword	0xb5d945ee509206b1
	.xword	0x2ec3c7e6c537a538
	.xword	0x9eaa3ac2698e3aad
	.xword	0xa6aaceddf8a081d5
	.xword	0x005bb023e04288b0
	.xword	0x91033f86615285a1
	.xword	0xef3082c3555646c8
	.xword	0x8064d8f3e778d874
	.xword	0x24f56e2fbe3a85be
	.xword	0x963b497949189620
	.xword	0x3542d210f43c267a
	.xword	0xc6a9b52431e80487
	.xword	0x7e07e8ae5e899d09
	.xword	0x05552926a202c40e
	.xword	0x8b28bda8e204c18a
	.xword	0x57c193c610207d31
	.xword	0x6a14b215be96ad01
	.xword	0x3b7b7bbc63978e7e
	.xword	0x0344f8ab6f2c2b1e
	.xword	0xa516a99ba8f7f2ef
	.xword	0x0be66d00ac5df84e
	.xword	0x3d0707b19937a135
	.xword	0x34d29f71a5b58d98
	.xword	0x6ab81a8d9248d6b6
	.xword	0x352d46cde851cf1b
	.xword	0xcb868be41da0055e
	.xword	0x2d1e61ba4b11005c
	.xword	0x3d1a3bae8197b4f7
	.xword	0x8c0f2c5bda07f555
	.xword	0xe1551aed08fd556b
	.xword	0x7d756e6ac8b81c58
	.xword	0x645a2982f1bf806a
	.xword	0x9c0e20fa304ca2c4
	.xword	0xa8d4592aef7cc30a
	.xword	0xf2cb18e93e707c03
	.xword	0x5109f277b9ab1ae7
	.xword	0x3a502a90d1fb9aae
	.xword	0x30a02ce0d1036b8b
	.xword	0xbcdb4a8520f79a20
	.xword	0x15e2356fd907a5a0
	.xword	0xc3b77e25999e2cd8
	.xword	0x3b2403da263033fc
	.xword	0xeb4f22a57c3bf85c
	.xword	0x8d0858e1c218be63
	.xword	0x38a6ea43b94b6e1b
	.xword	0xe750355a5ff1ef5e
	.xword	0x57a38e83e1401957
	.xword	0x1ed269b7e9eac3b5
	.xword	0xdb1743b58a869751
	.xword	0xcd8641db723100b0
	.xword	0xb294d100ce7d66fa
	.xword	0x9eadd34133caa07c
	.align 0x8000
	.data
data_start_3:

	.xword	0x3611603fe298927d
	.xword	0xa99ca01cf4528758
	.xword	0xe8faa746074a183b
	.xword	0x7b7152713625b674
	.xword	0xc6dd4ed19df8e55f
	.xword	0x079a08374c93d435
	.xword	0xdeca3297befb6b9e
	.xword	0x0bd9dcefd04a04f8
	.xword	0xd07ccce504dce3fa
	.xword	0x82a010c9a835c95a
	.xword	0x80b34d77d04ff22d
	.xword	0xfb3771bc6e391654
	.xword	0x3a9072afe5ce41f8
	.xword	0x89b79088f1f5c053
	.xword	0x76cd3f24955b61f7
	.xword	0xef361c0bd6f97d90
	.xword	0xaffc5a2b7a82f0b1
	.xword	0xc3cd3da28520b8e6
	.xword	0x1bbf93ff16aa9864
	.xword	0xeaf70c5f9dc1ecc2
	.xword	0xa134a5365fca8f81
	.xword	0x4623b36b5fcdb95e
	.xword	0x2eaf9a88ef50c3eb
	.xword	0x170e85a9bcafc38e
	.xword	0xfb21bb33a8e25393
	.xword	0xc814963baa99b994
	.xword	0xc3f658f70479ed1c
	.xword	0x41daef02e1f7944f
	.xword	0x7ce8e1fe64be16d9
	.xword	0x88f929fb6c87e4a6
	.xword	0xe924bd15957a15d5
	.xword	0xa1eec1e50cd80b24
	.xword	0xabc3059ea07ebfaf
	.xword	0x281c9e6a48524c89
	.xword	0xf02280bb1459099a
	.xword	0x7da79fdce5b34c84
	.xword	0xd2a97ea8f1d80f2b
	.xword	0xccaf4dea3083cd87
	.xword	0x3576ea892894db2e
	.xword	0xddd7482325d63157
	.xword	0x9902a8c682e5c3e0
	.xword	0x3ecbacd7d147bc47
	.xword	0xaa24c423608f7434
	.xword	0xf3a52ce5b9e5acc7
	.xword	0xd5ca883070c10816
	.xword	0x51d11ae9efdfb390
	.xword	0xe86bcd2236050642
	.xword	0xe92dad9f7ac08b7f
	.xword	0x904ced1474bc73d2
	.xword	0x7da2691ca6dea858
	.xword	0x8b0345e04bc7c6d2
	.xword	0x21944ac65b99289f
	.xword	0x7f0e90e3e66d36ed
	.xword	0x413ab33ed20034a8
	.xword	0x9338d0bd67a67cff
	.xword	0xafd136b785962f10
	.xword	0xfcebb4168c8f52de
	.xword	0xa94dcf0b87376830
	.xword	0xe187094809106efd
	.xword	0xbc07e2e45aeeb503
	.xword	0x9de8b047a851777b
	.xword	0x703bcdbe03e9b89c
	.xword	0xed5782dc0037b687
	.xword	0x63e063101ca6d468
	.xword	0x7626de001b975507
	.xword	0x61f57b5a3a2ccf16
	.xword	0xd59f4b86375abfb5
	.xword	0xeb368ad389f5ecb2
	.xword	0x3e4fb8aac2170e34
	.xword	0xe43058a461490ea3
	.xword	0xcebdf27fad4b67c4
	.xword	0x2db818a75522bd69
	.xword	0x3c5bc12b51d99c51
	.xword	0x8fdcfcedcd4542ad
	.xword	0x2bd2148a7e5af4c6
	.xword	0xef6cb3ad5f46353f
	.xword	0x6aec39f1773a54f4
	.xword	0x15c2982907875018
	.xword	0x8201c3d9cf6ae56d
	.xword	0x051abd606bf8c008
	.xword	0x01c3a9fdb4431a5e
	.xword	0x150e057b72b77a84
	.xword	0xaedacecb0a6fe928
	.xword	0xa0ca6eb136b39720
	.xword	0x11fdd19fb505f441
	.xword	0x51cbace24a6dafa6
	.xword	0x2f65c3d673d1b56c
	.xword	0xd7c3300bd0f95460
	.xword	0x342f0150b5b4036a
	.xword	0xb511af44b9db140a
	.xword	0x0bfce87287de0236
	.xword	0xb8699c8932ef1473
	.xword	0x3fc445665dc940c5
	.xword	0x3859e99ff4b2f6fa
	.xword	0x0afd91fb29360c7c
	.xword	0x5cf5ea4f327ab5bd
	.xword	0x8b4620053f47f658
	.xword	0x4156dfaf918b0c49
	.xword	0xc6c9943bd4467efc
	.xword	0x4bd64c51fb1d9574
	.xword	0xcd21de802c761a7d
	.xword	0x4ac7fea62b1e9333
	.xword	0xc8c7de52a11c5773
	.xword	0xacd90f1ef44dff35
	.xword	0x0df787201f4883b3
	.xword	0xd9ecf9cb8637e866
	.xword	0x2adb0e95d10d237b
	.xword	0x8eff25482a09e296
	.xword	0x47377f48605ff1f6
	.xword	0x9566dde388b42ffd
	.xword	0x333c533b96aa5c1f
	.xword	0x55b1721098e991d4
	.xword	0x62327a4c2296c70e
	.xword	0x6eb7c9334355608f
	.xword	0x63cdc8ca3a120e02
	.xword	0x949b8d4d8d8189e9
	.xword	0xd895c0f3da84b472
	.xword	0xfb50fd48a2555829
	.xword	0x30960c8f92054618
	.xword	0x489acdef592e901d
	.xword	0x23a8fd2a37e92c2d
	.xword	0xaabcb0369959909d
	.xword	0x74f2201122923dbf
	.xword	0xf7eb1270933ff975
	.xword	0x4ab460911ab73e2a
	.xword	0x28d331f64df9ebf4
	.xword	0xd69bf8f92c2dc7d8
	.xword	0x343ff2275ce0a2a7
	.xword	0x9e46c307af6aa21c
	.xword	0x03221780523eee5d
	.xword	0x30d840b3fc54802b
	.xword	0x48016b54d068132f
	.xword	0xbff70a380173f57a
	.xword	0x34082d7a2103b98d
	.xword	0xdddae373eae3c8e3
	.xword	0x07a6689f8dde8b4d
	.xword	0xf1b31b5485cbad1d
	.xword	0xf007a99f429e5cba
	.xword	0xa7819c1e1ba896a2
	.xword	0x09c0352b4f5bb8ac
	.xword	0x64b33633f33956bf
	.xword	0x24708f28d6bab889
	.xword	0xed11e6cd39d5fa79
	.xword	0xd964ddaa7596dc8a
	.xword	0xe2f8b30c74ca6616
	.xword	0x8580091cdd4eaf55
	.xword	0xc66561ddfc2e789e
	.xword	0xdb45db842074db91
	.xword	0x5d522fc347111206
	.xword	0x329240b4d36cda4b
	.xword	0xd54f33f042e67f6a
	.xword	0x41da1ed507bef0a5
	.xword	0x16c5b15346188a00
	.xword	0xd456fea137f11472
	.xword	0x3ac5413315292223
	.xword	0xd58168786e8883de
	.xword	0xbeeb3e5efaa6f109
	.xword	0x9d8cb307b8970f65
	.xword	0x8b9ab9bcf4b65254
	.xword	0x027c7c4cc8bdd765
	.xword	0xa9d265d23766245e
	.xword	0x7a6d11953cd96e77
	.xword	0xfbe448f345b5e80e
	.xword	0x748f74eb6f254d62
	.xword	0x4fb7f422733c746c
	.xword	0x3e7597b89deae4ef
	.xword	0xeb9d1e560f0c42c0
	.xword	0x4cd7905eaea1764d
	.xword	0x47cf794ca62118cf
	.xword	0x9c63bf4c50482947
	.xword	0x28240551c9b6909c
	.xword	0x6671b7c9819f8f68
	.xword	0xb7b43c94cb9530f9
	.xword	0x36aea05a9b58b26b
	.xword	0xf08a455ecfca6f39
	.xword	0xd86ed90d60e127cf
	.xword	0xf2fc4769d0945a72
	.xword	0xef48aa40f4684a34
	.xword	0x820ded76925117aa
	.xword	0x82a4524abee92d35
	.xword	0xd7cbfbe3051743de
	.xword	0x3e7531f8b4f17443
	.xword	0x854231b60d6831aa
	.xword	0x43828294c9365a43
	.xword	0xcc7990b82fb4b366
	.xword	0x9c6295f75dbd60be
	.xword	0xc1171329344a6070
	.xword	0xa62ac199c452887d
	.xword	0x9ad0db8c8c9ec2d3
	.xword	0x7c798545d0cb50bb
	.xword	0xd5bdf7064af1a6c6
	.xword	0xe0935e40adbb0731
	.xword	0xfe7f3417ccc0bd4e
	.xword	0xe88a5142024a8dea
	.xword	0x1ea591801cebe9d0
	.xword	0xfb9596dbb0436241
	.xword	0x43f1db22c06abc2c
	.xword	0xca0feba03c788bc2
	.xword	0xfbc7cd691fa4e573
	.xword	0x57eb00ed81194d25
	.xword	0x3e29ea423e490889
	.xword	0xee2546254f39b63d
	.xword	0x5c4c6c138531f199
	.xword	0x4046ebfacc9951da
	.xword	0x1e91f6ff061a0b39
	.xword	0x00ae43f9fdbf66cd
	.xword	0x89ad5e25c1c6e6a2
	.xword	0x5a9765f9a4d53fe0
	.xword	0x41b8f4b3d2a74e87
	.xword	0xfd39f127c47aa97c
	.xword	0x7ffcfc56f05358ca
	.xword	0x63aba7695cd40025
	.xword	0xb569bc5ca1ea421a
	.xword	0x8d64bdbc211df338
	.xword	0x3fa074d60ad4ef4b
	.xword	0x44ead0a49d05fd90
	.xword	0x9bd1c6b3015e5117
	.xword	0x4811f2aec58dd870
	.xword	0xeb5fc61d9ec897ed
	.xword	0x97101a4f71230bff
	.xword	0x6cb4c7fbdb01810f
	.xword	0x61889b2ccf48f8c4
	.xword	0xebd499925eb3f6d7
	.xword	0x6edbcd08681de05c
	.xword	0x64ca403772271369
	.xword	0x0f055ff296705234
	.xword	0x9b3f7fe6588194b2
	.xword	0xf7d7c07a52890e41
	.xword	0xb84b6ebdb2cbae5c
	.xword	0xd2dd97f8a058aaae
	.xword	0x9f24b206f7fb0271
	.xword	0xbb75f96b27970e92
	.xword	0x297400c889509f3a
	.xword	0x6d78ab19439c15a2
	.xword	0x7c967cb259240d13
	.xword	0x28ec01bb3e9db1dc
	.xword	0x1c1cd75fe2a660e0
	.xword	0xb51c58b70d38cadc
	.xword	0x3193d533f393a182
	.xword	0xb334002cbb47331f
	.xword	0xc2db88c6b068f24e
	.xword	0xf0eabe05f6733e83
	.xword	0x6fcd445ee086a906
	.xword	0xb364840b3a95bf1c
	.xword	0x080ea499a47d6bc7
	.xword	0x25868add627ab742
	.xword	0x8caf5f7e406a8090
	.xword	0x3254ce72ab7a9448
	.xword	0x0328c7dc94c599cc
	.xword	0x20611c419ef17cb9
	.xword	0x5be3448079902107
	.xword	0x346bd01ccd66fa14
	.xword	0x964ae5c45f199b0f
	.xword	0x2bbee3d5a31b0689
	.xword	0x979b31b57971c4e2
	.xword	0x0e4c845ba243adf3
	.align 0x10000
	.data
data_start_4:

	.xword	0x8338aae58500d326
	.xword	0xe630aca4bfbe1b0d
	.xword	0x3dc8ce3223ce4973
	.xword	0x79c6a14d35cbb967
	.xword	0x85ab75dbc4ee8bed
	.xword	0xacd916e3cb4ce4b4
	.xword	0x645756a340c96ab3
	.xword	0xb0d9a94ad21abaa5
	.xword	0x3df34792e1004df4
	.xword	0xa999e74b30b6f150
	.xword	0xda823542186261a3
	.xword	0xf063cdc0af9d6da2
	.xword	0x55cda87d03d2e78e
	.xword	0x8b1ae055c4d3fc52
	.xword	0x40a2d42dac62deec
	.xword	0xcf082b1d124fd6b1
	.xword	0x65995390666f5770
	.xword	0xd136725900ebcbbd
	.xword	0x20d0cdda56d78f72
	.xword	0x490d127e7b1bfcc6
	.xword	0xb01dc3c044d2cc68
	.xword	0x6a39f9d830b03819
	.xword	0xed6dbeb13fa82c7e
	.xword	0x7f39e94e6b10db2c
	.xword	0x639c965f8644a8ff
	.xword	0x48b8bf3c80b84fe8
	.xword	0x51e77c942aceb67e
	.xword	0x112d77e2fb84bc94
	.xword	0x126bc86c0a5e277d
	.xword	0xdeb25dff118de0c7
	.xword	0x59b1132381987476
	.xword	0x1b0920f6ef84deff
	.xword	0x183d87793ed41452
	.xword	0x66bd7c0938dc9072
	.xword	0x73ce1171d57617b0
	.xword	0x00f124c757306b16
	.xword	0xbf5f0c4d93efa4d5
	.xword	0x79a9edd47da03825
	.xword	0xff814dc166495826
	.xword	0xe4e73b3d3f267134
	.xword	0x92fe222b334bfa71
	.xword	0x64cca715923c9a90
	.xword	0xfaa57c0e9c1a14d8
	.xword	0x1d66b3fb7e24e9de
	.xword	0x5020530f5a612e9a
	.xword	0xc0743dfc28a1d430
	.xword	0x8f5d7f03d49ed3c6
	.xword	0x640b67c3df2d3796
	.xword	0x5e1ac32a48e2cf9a
	.xword	0xe4e5a53db35d7413
	.xword	0x8980eac112df60df
	.xword	0x45c367a5c3220b2e
	.xword	0x72a8572f78762234
	.xword	0xe37c5bd50c9c212a
	.xword	0x96cbf0e77c8c2b80
	.xword	0xb4a96d4607351c68
	.xword	0x017ed729226522ad
	.xword	0x76566c6932f7a8af
	.xword	0x0b6cbec6a414e975
	.xword	0x5607eceed5864f35
	.xword	0xeff9783466955962
	.xword	0xb5d0fc669462c3c8
	.xword	0x47a1f1c7a0265df9
	.xword	0x41e660cbabd4068c
	.xword	0x6e41d2f0e61b35aa
	.xword	0xcc0525f92d6b085b
	.xword	0x0683f3ae8a2fa935
	.xword	0xbb6a067f675dce7f
	.xword	0xee996ca8aae49f73
	.xword	0x1eca477cafd7f48d
	.xword	0x2e13944e2587c558
	.xword	0x6325eebe9541c8e7
	.xword	0xbd117d21946135e9
	.xword	0xf8ea500f779900dc
	.xword	0x6fa9c81bd7e1526c
	.xword	0x3884fc19fc2fc2d0
	.xword	0x35acd78de52c7882
	.xword	0x47f3d63948c9149d
	.xword	0x89dd1a67d41fdb00
	.xword	0x386f2b970a228f31
	.xword	0x0ddf6fcd1ec2495a
	.xword	0xb6cd8eef41b690e3
	.xword	0x338ab5c929214a72
	.xword	0x20076870600b0764
	.xword	0x2aeebcdc8853d724
	.xword	0x19e6c30cdeb1a1c9
	.xword	0x9c654295ffe28fe7
	.xword	0xd1e5f5924cdf8774
	.xword	0xd72c88012e9b93b6
	.xword	0xf93db1348573da0f
	.xword	0x08ef063bc1898483
	.xword	0x1f42a70602a522ed
	.xword	0x4a204f4e7edf2611
	.xword	0xc51dbe0c63d8bd6a
	.xword	0x2f4a1339d7991dc2
	.xword	0x422f282306ed852d
	.xword	0x634fa47eaa54a936
	.xword	0x438d218e81fb2bb7
	.xword	0xde250fa419dc97f6
	.xword	0x1b4efebfba6c43f6
	.xword	0x3832bf74bfeb6027
	.xword	0x08937d10e0b5d6c5
	.xword	0xc72b1c6ce33be652
	.xword	0xd0bc0932e6cdc23f
	.xword	0x012a378cda3624c7
	.xword	0x67f8c803c368ce0c
	.xword	0x06c1909eb011be0e
	.xword	0xdcf71fc7168e6b54
	.xword	0x379223cde5133e9b
	.xword	0x8c2c261ba3e89f33
	.xword	0x05dc829a9492ff63
	.xword	0xa1ddc05c4daf07eb
	.xword	0xe91dc89de859b1dc
	.xword	0x591efe4796a36852
	.xword	0xa0ff6c2173c71677
	.xword	0xe91e7e7ec02f7812
	.xword	0x3e0d851111926784
	.xword	0x9e7b62a980ee48f1
	.xword	0x03cca453608ce917
	.xword	0xea17cb04f8e161fe
	.xword	0x4973569e7b02d8ce
	.xword	0xd116a37c97dda730
	.xword	0x6e89704f845b6760
	.xword	0xbaa8486f013ff427
	.xword	0xec22adc4af545b8b
	.xword	0x746672c4b980a108
	.xword	0xa5ffd4e4a224b139
	.xword	0x8c0f060e9b5a24dd
	.xword	0x52f2d617d8593c38
	.xword	0x51d63ea7676701a6
	.xword	0x7ea4f7a58630bdbe
	.xword	0xab776a0ed7a29781
	.xword	0xa468c6168bb73ff2
	.xword	0xd326f874c93c0183
	.xword	0x0eb4fea283ba4cc4
	.xword	0xca1cf4db8aa2aeb2
	.xword	0x08aec5c3a19d7f1d
	.xword	0xa6c88bbe4eafaa93
	.xword	0x8893462b1bed4fce
	.xword	0x42c69cf0325494f5
	.xword	0xeab9fb3d5f799eae
	.xword	0x231d45acde0c43c5
	.xword	0x894e15bae9f1209f
	.xword	0xbe923d230a99de49
	.xword	0x663c1ba7d61fc5a2
	.xword	0xab9c634431443f3a
	.xword	0x65db07f50e14d9b3
	.xword	0x37879c1a9531f9f6
	.xword	0x03079a0cc70267b5
	.xword	0xf9e5e9230fd484ec
	.xword	0x25a570269bbd8f28
	.xword	0x2094d1add49e27eb
	.xword	0xa6d1a57d7d0df5a9
	.xword	0xd44f70c4ba698290
	.xword	0x377d66419e16f443
	.xword	0x72bb8f1170db505a
	.xword	0x2a1c80f4de8b1ecf
	.xword	0x63d36ad524b59d4b
	.xword	0xfb740d39fbc4f1a1
	.xword	0x0fc3efbf1a0688c3
	.xword	0x6d9c734ee68296f9
	.xword	0x035f06b2564874c2
	.xword	0x9dc79bd2eeab8726
	.xword	0x2ab5e75d914897b3
	.xword	0xb0fbce17538cc3d7
	.xword	0x2cc439ae1a8d8249
	.xword	0xc9fdced78f2c5823
	.xword	0xe268a55fe2288a76
	.xword	0x3c282b607d51d313
	.xword	0x08b465370e0ca10a
	.xword	0xa1a4de07dbc4e792
	.xword	0xa374a2841315eb1d
	.xword	0xae2fcb1938c27200
	.xword	0x674238e7044a2fac
	.xword	0x10eccc21ffc46e09
	.xword	0x760dfe0aaf934e73
	.xword	0xfba73a5ba73e6422
	.xword	0x95461c9640cca53d
	.xword	0x9f6233e510a016e2
	.xword	0xc54e9b5801a3acc4
	.xword	0x3b3b7879c5200be3
	.xword	0xbe20c39377fb151f
	.xword	0x9878d88d82b608a7
	.xword	0xa281c472adab4b90
	.xword	0x1b572b035a1bc846
	.xword	0xa4dc9070608e5cd0
	.xword	0x8ef50b9364227a99
	.xword	0x7038fd781a03df55
	.xword	0x45cbd8a88f9dbda9
	.xword	0xaf8dd9baea67bb1d
	.xword	0xb26c00c72a111ed7
	.xword	0x18580dae51ed3d65
	.xword	0x47bba8bc20ab2ebf
	.xword	0x557c5cfe5a3c6fcd
	.xword	0xf6f7891e94bec108
	.xword	0x45237ba1f6e112f8
	.xword	0x6afe7f7ec8e2aed3
	.xword	0x157f6a7f55f7bbed
	.xword	0xb0a5b70b8151e558
	.xword	0x4d179d79911cdab6
	.xword	0x495fde69978f0be7
	.xword	0x043ad23dd895d18b
	.xword	0x5d857c4c2531d698
	.xword	0xe2aa16b9f02adf12
	.xword	0x077e5dfb362e9e36
	.xword	0x74cc927443ee1fa0
	.xword	0x99e965bd016b2edc
	.xword	0xfdcb79d48a27631c
	.xword	0x44d694f2f6ff09d2
	.xword	0x6884acc90177ba2c
	.xword	0x938f4e218efae88c
	.xword	0xb87cc919ba2136b5
	.xword	0x8343c75bd6bcaaba
	.xword	0x1d09c1a999701d78
	.xword	0x7425ea3743b46ded
	.xword	0xfa3fe4039ea91d76
	.xword	0x50cb73697f549d77
	.xword	0xf93322e07f0f9c6b
	.xword	0x4b3bf5f687cce06d
	.xword	0x99617e3342c447e2
	.xword	0x280a5248a30bfdf0
	.xword	0x2596c61eee82c3cc
	.xword	0xb5db651dc2ed9ec9
	.xword	0xf8dc0d94fe73195a
	.xword	0xbc92b6a52a032493
	.xword	0x081c5028d69083ad
	.xword	0x68e9b67ab95e70d1
	.xword	0xe6eb4b64b45343eb
	.xword	0xff06149a12208a5f
	.xword	0x253556b70e5f958b
	.xword	0x49aab631c108d0c4
	.xword	0xb91065c007041fe2
	.xword	0xe3cd931f5489dcf7
	.xword	0xa2db760cb34d74c1
	.xword	0x05c38707cfe9d2a8
	.xword	0x01fd32cea3801c2e
	.xword	0xcc25542ed4fb2d47
	.xword	0xa7f5c6eebcba4bab
	.xword	0x3d2ccdd0a102eae8
	.xword	0xfccbcbcb1c433591
	.xword	0x99d08e32cfd6a377
	.xword	0x73f6cf36e3125b1a
	.xword	0x0a0ae23c36b59241
	.xword	0x16842e6bbb24c2b8
	.xword	0x108a3e757214b65c
	.xword	0x039063c1c8018baa
	.xword	0x490ce3f9ebc31519
	.xword	0x3eff1599a7d0d337
	.xword	0x0f6c541156bd7acf
	.xword	0x4f6d9a30c60053d4
	.xword	0xf593cfb01be9ed1d
	.xword	0x4d44a5dc22b2d9d0
	.xword	0x6cf932275f1d137f
	.xword	0xe215ddc1a25fea24
	.xword	0x5973d1ec05abb901
	.xword	0x5ddd329f091e2540
	.align 0x20000
	.data
data_start_5:

	.xword	0xafb4fdb94e0cfeab
	.xword	0xe43fc3bb3c353e70
	.xword	0xf7d59fafb6233194
	.xword	0x12110a1b1677678c
	.xword	0xb9dbdd9c4253250c
	.xword	0x2f69c9568b45af9c
	.xword	0x9549b2d237040d4c
	.xword	0x3167cd8ce9e23470
	.xword	0x0af9a0087d276721
	.xword	0x3bee98303d14491e
	.xword	0x51ecb462c71b349d
	.xword	0x8525308759b88323
	.xword	0xaef5c9220831ef3a
	.xword	0xbd781115a44b9721
	.xword	0xcdd58e3779b656f7
	.xword	0x89bfa57e5d640ab8
	.xword	0x686c925511cdad75
	.xword	0x40eef1e0eb2149e5
	.xword	0xeec76c1bccd2d759
	.xword	0x23f7ca3b330a7a9d
	.xword	0xf17c7820674624eb
	.xword	0x927d8a1e3adcb73f
	.xword	0xd5f4379a9cf63355
	.xword	0x96b51172e9040e38
	.xword	0x8a24982e24629b45
	.xword	0xea9e5a5ee0823c21
	.xword	0x371f6cca1de43d56
	.xword	0x70649afbf4b74524
	.xword	0x9cf8ac2d4277a163
	.xword	0x87db35b02c28ccf4
	.xword	0xca2dced99ee081a6
	.xword	0x40429c13312b91f7
	.xword	0x3a7b3e16b5cfbe96
	.xword	0x8e1798309dff439f
	.xword	0xb6e58a82dc3d007e
	.xword	0x3177a303b780789f
	.xword	0x46ea57a0bbbf511a
	.xword	0x9493b531e0047660
	.xword	0x3177cd987f5a53b0
	.xword	0x5d6c652fda0e4c37
	.xword	0xb3d2cc3c72b70431
	.xword	0x6dc640b3ef91ec5b
	.xword	0x413926a5e36543e1
	.xword	0x36d4789e46a36324
	.xword	0xa58a4ebad51ba781
	.xword	0x14a4c748e9b0fecf
	.xword	0x005b8f3ef1a5fc32
	.xword	0xa041f094359f9b86
	.xword	0x2fa54368c45b2552
	.xword	0xfa159ec56a6a2294
	.xword	0xb7ef9a65ff70c9db
	.xword	0xd71f961c1edba349
	.xword	0x88e735636de804ca
	.xword	0x22369d198acbef49
	.xword	0x0d3dab87c7e3a29d
	.xword	0x0a9ffcd4007e3ff5
	.xword	0x13254a491ed68a47
	.xword	0x021e4daa7c08cdad
	.xword	0x6faa83e7e4409b6a
	.xword	0x85d3f4ce0b6f98ed
	.xword	0xf23488a8f218fa27
	.xword	0xe6aeb6856a52555a
	.xword	0x28f9aefd79c197bb
	.xword	0x24d233daed6d6ffc
	.xword	0x1d7eb8d6bbc7e894
	.xword	0x3314bf52d52beefd
	.xword	0x1c91b3dc018b9554
	.xword	0x5dc7cb28528b2d13
	.xword	0x72105f727938841c
	.xword	0x65e45bf3f721a1ca
	.xword	0xe3827de58d66df84
	.xword	0x253428ff9368af66
	.xword	0xdb4b45132bb068f3
	.xword	0x00f4ecf30220258d
	.xword	0xf77f17fc3fefec71
	.xword	0xbb8ca51ae16acd23
	.xword	0xf994d35122958387
	.xword	0x06c335ae101f534c
	.xword	0x10d4185dae4a0623
	.xword	0x50e35dce4233b58c
	.xword	0x57db6ae050c0510b
	.xword	0x0194c743c10b45d6
	.xword	0x608b9900ba66cb9b
	.xword	0xf3fab37378ac98e3
	.xword	0xc41aa7042e48f3f9
	.xword	0x392b11912c127112
	.xword	0x40a8e91602ff26a3
	.xword	0xe17bc9e3d6e304a5
	.xword	0x97da57734c865096
	.xword	0xe247cff6dfcef7e6
	.xword	0x15248f48275bf562
	.xword	0xd50f6524a16cb4b8
	.xword	0xe268b75c8a90a2a6
	.xword	0xebedcb68a35afb83
	.xword	0x84175e5d1f5936d4
	.xword	0x078d98af366d2b8d
	.xword	0x04b8d5dd50234ce7
	.xword	0x22c67e847f401542
	.xword	0x4aa553159273fccf
	.xword	0xb03cc1ca5f054714
	.xword	0xa4acfe868e769756
	.xword	0x9b3df8a209097b18
	.xword	0x2cdcc7d4076690b9
	.xword	0x8cc76b8dd06f6853
	.xword	0x75cdc1fb67b020df
	.xword	0x28d8e268b763e450
	.xword	0xd027f88b318672b0
	.xword	0xf50318ae9a8c897b
	.xword	0x45d17da123187514
	.xword	0x396da7ff9b32032e
	.xword	0x5a1c3646f7c07086
	.xword	0x742a1500c7f4f16d
	.xword	0x811e101bb578744f
	.xword	0x5c1b8fcb7c7bb5af
	.xword	0xc24a328c625071f3
	.xword	0x8981cada14812f59
	.xword	0x3b659700f2422001
	.xword	0xb8bbcd5206a3b2c9
	.xword	0xc42235213ee68cff
	.xword	0x4284e18c37333cff
	.xword	0xb2499ff912310cf2
	.xword	0xeab5c04ab0eb55f8
	.xword	0x0b6ba5d9d75814d9
	.xword	0xc3f0c1cef12d88df
	.xword	0x8381c5d55bf1f2ac
	.xword	0x767d7cba4b9f3bc6
	.xword	0xd298f121c04dc3bb
	.xword	0x94144304b275e53e
	.xword	0xf5b1189c1e0316d6
	.xword	0xa4e1dacb0d4ae03f
	.xword	0x8d934e4cf7a331ec
	.xword	0x3c50415bbefa98e4
	.xword	0x3851574114238196
	.xword	0x5c03da119b235b45
	.xword	0xddecead495d91a33
	.xword	0xf53dc9248851712a
	.xword	0x63a193ab772e7d27
	.xword	0x3be433c80a1008dc
	.xword	0xce75abd5afb7534f
	.xword	0xa230366c285790b0
	.xword	0x06986bf9c06a51e7
	.xword	0xa7097d2b3609fb1a
	.xword	0xd2b3fa12695ffb25
	.xword	0x88ad5de6bc809f12
	.xword	0xc3b19f678e7caae3
	.xword	0xcf52964c2f9ee832
	.xword	0x9ddacefef01fd222
	.xword	0xf8308c3765c80944
	.xword	0xc7ff4ff8aef04050
	.xword	0x06ccdd1cffb5c775
	.xword	0x3c67acf862c29f3e
	.xword	0x6552a0778b78fdc2
	.xword	0x9a2a2fa0c83651c9
	.xword	0x695c9ec4f152bfe5
	.xword	0x79190921c195e228
	.xword	0x9b9154138e7978dd
	.xword	0x7a8ee4c3652a06d3
	.xword	0xc0edc9cb8ed48441
	.xword	0x4357671184fbf7a8
	.xword	0x8a72596a10f7f04a
	.xword	0x8c220a97f8621770
	.xword	0xc3b89c2d0e9ee4ab
	.xword	0xe57a18e72b8e6a22
	.xword	0xc5ab5e40ad0d5c96
	.xword	0x0c0fbfdc207cc268
	.xword	0x7694f068a8e648ea
	.xword	0x3aad4482b48425f4
	.xword	0xc4e9c4640d299db9
	.xword	0x9959ab68706e5fe3
	.xword	0x3566fadc4786ac05
	.xword	0x3d6df17cefa4ef7d
	.xword	0x8a1e0e83eb7da381
	.xword	0xdf813069393b696a
	.xword	0xbfe8d1e9140012db
	.xword	0xa44838e4e97071aa
	.xword	0x1142887fe120ee2c
	.xword	0x2db927d6eeaad948
	.xword	0xc89eb8b2a687b815
	.xword	0xe115efaf52d23bda
	.xword	0x9f8468365be7e7a0
	.xword	0x2c22c9a0594f8b17
	.xword	0x4f674b7e0feb7389
	.xword	0x9875a284491c3589
	.xword	0xb51209ade7ebf531
	.xword	0x6b182e176f19415f
	.xword	0x0c66855c661036f3
	.xword	0xc291b92237e3d847
	.xword	0xf223c5d800852df2
	.xword	0xa26dac49c6b97bc7
	.xword	0x83ec53501df32566
	.xword	0xe6d0b6215ab20bed
	.xword	0xa553d3d71443314e
	.xword	0x90184002205598cf
	.xword	0x6c8189023a6b8f74
	.xword	0xb26b06257a6d0fbe
	.xword	0xd29844dda530817a
	.xword	0x5c33e0719c2324ab
	.xword	0x9697409b2b0bf96d
	.xword	0x2374d0057cea8452
	.xword	0x09d18110a185e717
	.xword	0xbec084ac0678556c
	.xword	0x92b11160230938d2
	.xword	0x7615e9b3b35c21ce
	.xword	0x54875b43386b463a
	.xword	0xa9f48fc229e84eb1
	.xword	0x861681eaf9cbd652
	.xword	0x40a7d4e10b76ea96
	.xword	0xca8c7bbac6d2d855
	.xword	0xf259e644c5622e89
	.xword	0xcc3137219716f167
	.xword	0x11c52e0e3f07cc7f
	.xword	0xa32e04d42a2b1610
	.xword	0xfc18c6e34830d35a
	.xword	0x08692d1455c0db0a
	.xword	0xd78b0e9edcaad44a
	.xword	0xc23184c32647e888
	.xword	0xa9f3eae9aec6252d
	.xword	0xc761e4fd614abdc6
	.xword	0x39ef00279aa0e32f
	.xword	0x1dbe36ea46e59209
	.xword	0x09dba3588f06d127
	.xword	0xa41e9ef290a0e948
	.xword	0x2b16bc7cacf78d77
	.xword	0xedb8a69b462f18ae
	.xword	0xd15447cded911463
	.xword	0xa951e047e0ac2de6
	.xword	0xf7f6952c87cdf37a
	.xword	0xf696c3638ec88d07
	.xword	0x8a6fa9f368542866
	.xword	0xb239eac2d39115db
	.xword	0x4f7938518ffdb25b
	.xword	0x0152f4bb572b14c8
	.xword	0x6cf118bf4bf17753
	.xword	0x0c6aad018741982b
	.xword	0x27bf717b758154a0
	.xword	0xb051a41d8e143486
	.xword	0x0bb45bc9b73fef0d
	.xword	0x4cd6a4514535752c
	.xword	0xfd7c011e3b676eb6
	.xword	0x3874f641774933c8
	.xword	0x0f4493f0b7673d29
	.xword	0x7ee573c3f6bbb088
	.xword	0x229c3844ff35b98c
	.xword	0x8bc4d6b046fce0bf
	.xword	0x589195850529830e
	.xword	0x076ffe653cda9974
	.xword	0xd734f0c1fd0b7802
	.xword	0xcfe5bb1c52db9a5e
	.xword	0xb90d3fd559185a53
	.xword	0x883db74d20330c6b
	.xword	0xbb5ca5b6403fb876
	.xword	0x273e90e17b0e20b3
	.xword	0xb5e36bf36a7b2c28
	.xword	0xee1ade8308b67ae3
	.xword	0x05e3c4b522a12e41
	.xword	0x12cff698dd89b3f3
	.align 0x40000
	.data
data_start_6:

	.xword	0x1dfdf1ca2716a668
	.xword	0xb3e244da05713a9e
	.xword	0xedcfbd38764b32e7
	.xword	0x75c7b9d2ea08047b
	.xword	0x9ecc27eb29e72d6c
	.xword	0xa88ad52b0d162fd9
	.xword	0xc7c1ef51db3d2e31
	.xword	0x6c6f5c37fa58ef15
	.xword	0x136bb12913f969fe
	.xword	0xe14acecd3098d114
	.xword	0xb051b63357a0b0bc
	.xword	0x9bf068d7920d7d24
	.xword	0x1675d7f273f0c1b3
	.xword	0x299ae6deec346502
	.xword	0x6500a0c12827af06
	.xword	0xf4ffba592abc1bdc
	.xword	0xe1a591e8e2895db5
	.xword	0x9bb24b53f8ba1066
	.xword	0x2bb50380eb853fb4
	.xword	0xf37442016dab2f41
	.xword	0x31c5441489274270
	.xword	0x643e4771f8eda701
	.xword	0x4c70e180822558cf
	.xword	0xc79089a710f1c4fc
	.xword	0x6907ac477196b153
	.xword	0xb3571a075a8dd420
	.xword	0xd79beb44c27b2bc8
	.xword	0xc0970e6445c17a23
	.xword	0x5d964c3aa264e0cf
	.xword	0x2b64027562bb9ee2
	.xword	0x1d4c4af55099ef1a
	.xword	0xf37395fd368f07f8
	.xword	0xade05b19fad28f44
	.xword	0xc84ad3f601ab7ec5
	.xword	0x202fc4de498d940a
	.xword	0xc376ca94570e52ad
	.xword	0xbb47fd3ea4e4ed49
	.xword	0x9f98a32c32e42ef9
	.xword	0x97d7c94af3365d6e
	.xword	0xb68d2cbcd7cfa12f
	.xword	0x84e51ef7dbf12c6d
	.xword	0xb3211a46c5b5a188
	.xword	0x9c8c15c710ea8d56
	.xword	0xaf7495ae70cd302d
	.xword	0xb3740cf0ab4d3cb5
	.xword	0x35de66b3a6e3fa5f
	.xword	0x1ea90b7c9682a3c8
	.xword	0xa4233b0fb49fca28
	.xword	0x0fe8edd411006b12
	.xword	0xa93928444e3fc0c2
	.xword	0x53429382d9e4f8c5
	.xword	0x0adb2616dd2b2c9f
	.xword	0x39156190ed22f747
	.xword	0x93d060888d8107e5
	.xword	0x7ce69e6e78fdd86a
	.xword	0x1d1d1da923899604
	.xword	0x3cfb7db5c11b399e
	.xword	0x2bab324c6a2ce62f
	.xword	0xc7822f7b84d0797e
	.xword	0xefdf75df36f6e8e8
	.xword	0xaa129c6f273a9e9b
	.xword	0x853f365630822e89
	.xword	0x00fd60d444314e69
	.xword	0x5cc269c7dc9f24c2
	.xword	0x059bc27ee9a01388
	.xword	0x99038747badd20d7
	.xword	0x00df2e99386ba320
	.xword	0x14aa7e5b7d3e0be3
	.xword	0xe1d8f255f7655af6
	.xword	0x2fb97106510fe874
	.xword	0xd5c31661d1d344c4
	.xword	0xb1f0d6e1331b4162
	.xword	0xfaf4d03cc1c5a9f4
	.xword	0xc22143ff7630b047
	.xword	0x5f68b283193b6eec
	.xword	0xa4d821dc8eadee63
	.xword	0x83e2ce7812c9b51e
	.xword	0xe9fbcf5b1e866801
	.xword	0x0e5516398a80b20c
	.xword	0xba3414cb0af9b1b3
	.xword	0x2e3ad74be35e24fd
	.xword	0x7922f722c07ff999
	.xword	0x45c0166a66778095
	.xword	0x46675db75402d5cc
	.xword	0xf7e41ea9eca36c93
	.xword	0xa220f13c046e6588
	.xword	0xebeef18ddfd8b952
	.xword	0x69027e27d67f31e6
	.xword	0xcd399305bfd5180d
	.xword	0x879eba68ed8d142c
	.xword	0x3582fff2621cf540
	.xword	0x29deaeb3fd628450
	.xword	0xdf363e2c8968cc1d
	.xword	0x9128a827a4cb30c4
	.xword	0xde9177ecb2171963
	.xword	0x65a642501d454840
	.xword	0x78feda48177301cb
	.xword	0x9b7de0d1339c12b8
	.xword	0x8d842cdc28f67aea
	.xword	0xb98e1bdf6cc1493e
	.xword	0x12d35385c20997a3
	.xword	0x290ce5ed53b77202
	.xword	0xb090ed3f22c1e31e
	.xword	0x6157ee2d56d7baa2
	.xword	0xfa2ea908d15a2d64
	.xword	0x6d5fdf0eafbbfd53
	.xword	0xef5ca6aa61498fec
	.xword	0x163a975f18a825be
	.xword	0xabd8fec9df2ca37c
	.xword	0xf8822339f8e67b25
	.xword	0xe68b2c1170e6ec87
	.xword	0xb179a868bca7f657
	.xword	0xc6b768d034295356
	.xword	0x0afc9b1e59292d40
	.xword	0xc25449a4ab4f493f
	.xword	0x25ee4a1d6428e554
	.xword	0x38695855bbb94b84
	.xword	0x8132b2b46cbdd3f8
	.xword	0x072e1467f068ba1f
	.xword	0xea0693f2c4ca4630
	.xword	0x1545060c891c1899
	.xword	0x921adc6f16fe0244
	.xword	0x0f70bcbbb7f9fb9f
	.xword	0x5dfb74caa0640c78
	.xword	0x6effd29c8afa7569
	.xword	0x8c075b6937ad0b01
	.xword	0xb3e1802c7e27fed4
	.xword	0x96a51412c2e1fa99
	.xword	0x8957e63ec3e7c7fe
	.xword	0xbe86f2148234a6ca
	.xword	0xb35caddc731b492a
	.xword	0xea91ef35a0206046
	.xword	0x6e4c52c610b4f295
	.xword	0x7cf463afb1858921
	.xword	0xf7a1b900cba5ada6
	.xword	0x79541e1e2c45197b
	.xword	0x7f2b49c9e1b6b75a
	.xword	0x9e6859e0075ac288
	.xword	0xe1ec29b366eac669
	.xword	0x7ac266c2af5065a8
	.xword	0xa1510c05709654a5
	.xword	0x0395626dc8521fae
	.xword	0xcb918f1f2670e156
	.xword	0x96844da00f3a32a1
	.xword	0x64463358ac12d815
	.xword	0xac5fb55128c0d2cd
	.xword	0xc408b12dcfee6a0d
	.xword	0x08a8f62b68db2ee5
	.xword	0x818f938e6c78370b
	.xword	0xd7014d1343310bf0
	.xword	0xfc6d1cba6594701d
	.xword	0x9b4d75c8adfa5c7d
	.xword	0x79fa538ea41f2de7
	.xword	0x1e0de539e5d9fe0f
	.xword	0x6ee8d7fab8760512
	.xword	0x5b040d5fcf0e205f
	.xword	0x0ef82fa3724a1ec6
	.xword	0x19dd0f9c36e44cbc
	.xword	0x49025c3e3ba0e76e
	.xword	0x57cb470a6426ab20
	.xword	0x74e994c45f212fd0
	.xword	0x2c3e1a6f39390f82
	.xword	0xc71ee220fc656344
	.xword	0xb37ccfaa8a2170c4
	.xword	0xad601b56c01fa0a1
	.xword	0x7281b951267fd4dc
	.xword	0x4a0474bffc557672
	.xword	0x6d8cebbe101368da
	.xword	0xf346add2bf5314c4
	.xword	0x7ce74353e0a75ef1
	.xword	0x0f5360e3d0a88214
	.xword	0xc080db8578798290
	.xword	0xb2cfe0d890adea75
	.xword	0x48492c4aadaa6eaf
	.xword	0xb5b984ecb08d2d9a
	.xword	0xc102b75d08f2f4a8
	.xword	0xc985040c7e16f8d9
	.xword	0x8788a4664f80e2ba
	.xword	0x28031c1942b79f50
	.xword	0x4be6ba0151ff07a7
	.xword	0xbac945acc5ab5e7f
	.xword	0xf32efd352c88ce1e
	.xword	0xd9674d10e706dec9
	.xword	0xaa1ac35ef5590e3b
	.xword	0x7638e2f0b4adfeb1
	.xword	0x18986689fcc10e8b
	.xword	0x41ae6c64291f2c81
	.xword	0xd98cb35afd0b5ef1
	.xword	0xa555aa500f26b5f9
	.xword	0xa4eb77c42384544c
	.xword	0x38ab2d8d575f57b3
	.xword	0x15067508c226fa13
	.xword	0x603d5577ff6591a4
	.xword	0x8709cf993b0c641a
	.xword	0x55afa7dd35d2340b
	.xword	0x2acd29b2c05ac6b7
	.xword	0x281623e610923941
	.xword	0x5d85ef2c4d78c3ef
	.xword	0x2bdd83014b0eb53d
	.xword	0xfba571fd39654b86
	.xword	0xa91dc195cd07802b
	.xword	0xaff08ae635faaad5
	.xword	0x1ad30bb38dc5a330
	.xword	0x9a8ba709924fd72d
	.xword	0xffbd915764946796
	.xword	0xac0071f0dc9014d0
	.xword	0x3c68c0f81be53b9e
	.xword	0x06fe67b59a2f5731
	.xword	0xd82a8d87883f0d63
	.xword	0x69d449ffe3beee49
	.xword	0xb704b88f9f503915
	.xword	0xd35a3e1cffb66325
	.xword	0x35fd6044b8abf950
	.xword	0x52806a8fcf1dab4d
	.xword	0x249c6159714f5039
	.xword	0xf1704a779b219e07
	.xword	0x2686fc9eda9eaea4
	.xword	0x6a188fa57a03f8d9
	.xword	0x0f3fd7478d5b5f36
	.xword	0x8bfa9924d5caecc2
	.xword	0x2aa3e07ec11351d9
	.xword	0x7a0f8640103c49eb
	.xword	0x6cbc94e1ce0ac6a5
	.xword	0xbd73f426c951e5fd
	.xword	0xe97165b190c9f151
	.xword	0xadec5ba9cc31895d
	.xword	0x248d6e0e77811b07
	.xword	0x843969d0502adb8d
	.xword	0xed98795efe0df809
	.xword	0x4097487ee297008a
	.xword	0xb9cac6f3de394419
	.xword	0x379ecb83e658da53
	.xword	0xeb987e1ac3eaf967
	.xword	0x25e5a9e83784e418
	.xword	0xea43089930f2bc19
	.xword	0xae2d9e3d9b2c444b
	.xword	0x472fb235d426900b
	.xword	0x1988a5e6b748d98d
	.xword	0xdef7b19abf943f17
	.xword	0x10d8d912d16e2515
	.xword	0x01be8e804309ca23
	.xword	0x7b4a80606097bfb7
	.xword	0xd59de0c727ea170e
	.xword	0x9f023927910f2247
	.xword	0x477eca265c604074
	.xword	0x71f35eeef9be538d
	.xword	0xb6da1316bfde1d98
	.xword	0x2b983653d5319a10
	.xword	0xc46d79ff856ac803
	.xword	0xc6c4132729612d96
	.xword	0x0daf5f259812a3f1
	.xword	0xc2c5e82b4c424f35
	.xword	0xfc98b5648687f476
	.xword	0xc04aa08091170b0d
	.xword	0x1c6069df00ef593e
	.xword	0x22264570b222659b
	.align 0x80000
	.data
data_start_7:

	.xword	0xd3853ed522bc0ff0
	.xword	0xa062e27d79353d89
	.xword	0xed69dcc23ef45766
	.xword	0xdb63b53b0b2e4ab8
	.xword	0xdd831387c4fdf2cd
	.xword	0xf27d582c01ccfe69
	.xword	0x6c2f755fba99112a
	.xword	0x14c3fa5851d81f28
	.xword	0x25910812fb435f8c
	.xword	0x9cf433e2a6ab5ac9
	.xword	0xa5d1be368348de31
	.xword	0xfad1a64ffd030191
	.xword	0x1c560e838891d39a
	.xword	0x836338f539276d20
	.xword	0xb2bad45408c0fdfb
	.xword	0x717c370015a0dbdd
	.xword	0xbe81447b48569015
	.xword	0x9bd6b8f9450e9b45
	.xword	0x82ef885b5f7df19f
	.xword	0xe51c64fda752bd02
	.xword	0xb1fc386ee5acdeee
	.xword	0x020584bd16d27a3f
	.xword	0xaf71dac328949f86
	.xword	0x10ffe4616756b29b
	.xword	0xdc436890cdc9c07d
	.xword	0x7b51f6083ca0ce6e
	.xword	0x7d890bcd6840778d
	.xword	0x7c04689d7d3d15ca
	.xword	0x784bc709aa852b13
	.xword	0x20d76367dc094e1a
	.xword	0xa006effb8c43b2ec
	.xword	0xccbf2bb1e8ef2540
	.xword	0xe05f946df61f5cd8
	.xword	0x8532afb123ae5ae6
	.xword	0x4349efcd9725c746
	.xword	0xad555d5cfaeb81d3
	.xword	0xab4a5b7905649332
	.xword	0xe11c1abcd4c78396
	.xword	0x5517c6eb78b1bc57
	.xword	0x472d7f97f746bc44
	.xword	0x678283a6f5df114d
	.xword	0x55223e4d85f9fad5
	.xword	0xd8f12a7d51b0aa6a
	.xword	0xe5d065d523ef658d
	.xword	0x87fd56fe94e7d67a
	.xword	0x9c5f662d5b13ffe0
	.xword	0x782dae33cdfeeade
	.xword	0xddbf3799763f4a85
	.xword	0x1faf247e88cacadd
	.xword	0xfdf6e0f1eca5bfcc
	.xword	0xa76c57e200b4e893
	.xword	0x392e6a754d7fa51f
	.xword	0x13ffba6716e5d0d4
	.xword	0xd48c6f7880c2e121
	.xword	0xcce9bf36531ca2ea
	.xword	0x076aca17c8286545
	.xword	0x72f7e254d5eb0105
	.xword	0xa92ff74686477382
	.xword	0xb0e8d8029ad9bbdf
	.xword	0x5e1e47ca509d8363
	.xword	0xcecba725810ba900
	.xword	0x903de1ceb04c2ab9
	.xword	0x9d5966f28950d108
	.xword	0x93824beed2bb5bef
	.xword	0x2a24191d7876c91f
	.xword	0x26b3e4a16176de32
	.xword	0x6843ddd3da5da405
	.xword	0xcb38d811f40b97c9
	.xword	0x9a353ad18974fe6c
	.xword	0x08921d7cec746902
	.xword	0xb3c88f3123e9a9b0
	.xword	0x210dcb5d6c39ff87
	.xword	0xb916e616d7c14954
	.xword	0x6fb18bf9ad50614a
	.xword	0xd86738f771302ff6
	.xword	0x182b5caf7fc75741
	.xword	0xd73c82f59c637532
	.xword	0xde246149aa786d70
	.xword	0x963ee84e97389324
	.xword	0x98bf2d5a80cd63c5
	.xword	0x382341bb0ad5414a
	.xword	0x59479e44c2a90324
	.xword	0x08bd242f7757ef65
	.xword	0xfaf9ff41ae838f74
	.xword	0x046b005dd9d249cd
	.xword	0x4a837d12bfbf302f
	.xword	0x2e0fb8e5e42c1035
	.xword	0xf06070bcaa1fa562
	.xword	0x06a6714ae2cc6234
	.xword	0xe03c7014b3d8cd70
	.xword	0xf475c5e0188d51b4
	.xword	0x9759d54e13433370
	.xword	0xd51046caa333ae7d
	.xword	0xa4217c19cf056d1a
	.xword	0xdba6451247284831
	.xword	0x8d88aecf8725432c
	.xword	0x3ba7201b76ad7d97
	.xword	0x00dddd3b156c34e8
	.xword	0x6643e28361378492
	.xword	0x66a79dbcf919bbf7
	.xword	0x1fc9b7b3537af2b3
	.xword	0x29945b9e931aeedc
	.xword	0x5c09761ffc796794
	.xword	0x2362df607a9156ca
	.xword	0x7481cebee9111385
	.xword	0x0e90d45bfcdff6d6
	.xword	0xab6da7effeb83597
	.xword	0x5e2f2e36146eccd5
	.xword	0x3f26fed552596c53
	.xword	0x80d83bd77ac445eb
	.xword	0x5f634953916fd38e
	.xword	0x74315913488a8210
	.xword	0x446c460b417a982b
	.xword	0x37ccaff366c75925
	.xword	0xfddaed57088d33b4
	.xword	0xfdd20b96588a4487
	.xword	0x9249153df7a70c31
	.xword	0x17b0e35cb24ed3d6
	.xword	0x49bddfb75330e0fc
	.xword	0xa5c0a14aac71a48e
	.xword	0x038979ff9917e8d3
	.xword	0xf7ed2914b1f04501
	.xword	0xa96db5e604a6bf72
	.xword	0x02d767c3bb7ff8a5
	.xword	0xa60b1ee16d4a91bf
	.xword	0xe07f8c469fe5f57e
	.xword	0x3100c611f585e6ba
	.xword	0x7b23c35668bfccbc
	.xword	0x92f6662bb388803f
	.xword	0x4ca908ced8288d7d
	.xword	0x285261c1dd595152
	.xword	0xa1efd8cd2b61b799
	.xword	0xb8c25b5d3a7df4a6
	.xword	0x4049c4040a745c46
	.xword	0xe41992f4e68bbe4a
	.xword	0xedf408891e5a27e3
	.xword	0x2c31b250aa743546
	.xword	0xf5a5387e67e39385
	.xword	0xf8d281783e23e328
	.xword	0x1143f9b72b5d9505
	.xword	0xd3bfea0da06fe64d
	.xword	0x6863464568df2693
	.xword	0x62318d152060dc72
	.xword	0xfc369a54731e2585
	.xword	0x49cb55440b68c2b8
	.xword	0xc665065ad6b2d6db
	.xword	0x4ea0fb012caffb80
	.xword	0x5ad19d097fd72f16
	.xword	0x1eb84596af78079b
	.xword	0xc996ebb0fdcac7fd
	.xword	0x979a88458a796dc6
	.xword	0xd3f38ee67546bf04
	.xword	0xd91ac4cbd5444213
	.xword	0xb7cbfdfea2c9deb1
	.xword	0xb069e15228e19933
	.xword	0x7fc3b0a232cb0fd6
	.xword	0x5e0c8b13f1158b73
	.xword	0x66d139116fd055a6
	.xword	0x8ce012dc008d5e40
	.xword	0xcee9db95ea9fc7d7
	.xword	0x388189f0e9ce1ef3
	.xword	0x4fa7b522627230eb
	.xword	0x8e098ae5f0e12f74
	.xword	0xac35841323f98a4a
	.xword	0xed493e4740890034
	.xword	0xa20496d06710bd90
	.xword	0x5fda8a478f44ee63
	.xword	0x9fac0c5de3de041a
	.xword	0xf8eb0bf1dee258c6
	.xword	0x6d1b7a6a878c4a4e
	.xword	0x72daa82867c099ad
	.xword	0x2755a6487661c15a
	.xword	0x9049e1d97b0bc02a
	.xword	0x6410b73ddcff90a9
	.xword	0x0d786113122eb30a
	.xword	0x159e37a75f3a784f
	.xword	0x78b50a803e5f6572
	.xword	0xb3b949ca17ed6ba0
	.xword	0x7518fe64f13e32be
	.xword	0x5b21cc6441f7b5be
	.xword	0x0db9157bd0335f7d
	.xword	0x0371821f10036d6e
	.xword	0x4d3ac9f495365da7
	.xword	0xc04df3845846be0f
	.xword	0xd45decac2c8d4c6e
	.xword	0x35d0ce4cf5f5b0fa
	.xword	0x14e0aa7b231c1c68
	.xword	0x53478cafaa8ee145
	.xword	0x30051ce389ddb1e8
	.xword	0xb00e0de7ef47f38e
	.xword	0x612f1b0e867719e0
	.xword	0x15e3d26aec293590
	.xword	0x1147507c2f64f8a7
	.xword	0x42055857434d56a0
	.xword	0x3434f099438ef12e
	.xword	0xbe5802e9294ef0c9
	.xword	0x1d446c5306ce26d1
	.xword	0xac91235d97564be6
	.xword	0x25317efdaf8e2c0d
	.xword	0xd1c46b16a6e31173
	.xword	0x8800efb281ecf71a
	.xword	0x3ec2ca4b000f69ba
	.xword	0xe3a4ab08565642e6
	.xword	0x7823c076dcfcba29
	.xword	0xa76ffb089c2a902b
	.xword	0x5d1635339f8b930e
	.xword	0xfb08d0c3f3a83e92
	.xword	0x3b6a4e70d7e13dfd
	.xword	0x0ca6d16265f70ddb
	.xword	0xa71745a051389e17
	.xword	0x652d4c933c78c8b5
	.xword	0xee361b91dbfa8bb7
	.xword	0x99c6fe6d1f5ff2e4
	.xword	0x8f0633e0d08f0d4d
	.xword	0x725ca819d8536eab
	.xword	0x722d5296c777685b
	.xword	0x2acd462c95b7d90f
	.xword	0x22ef15cef843d702
	.xword	0x8a803840c1927ca3
	.xword	0x5c82f79db499bf3c
	.xword	0x033108c90617aaf1
	.xword	0xd9d1e018c81efdae
	.xword	0xc554cdf0c7ad9f80
	.xword	0xb02cfbe3034d7ab4
	.xword	0x7983240601e1c857
	.xword	0xc5eaaf87a0c1bd8a
	.xword	0xfec348f7dd0c6526
	.xword	0xc9c7a436a8a1dc65
	.xword	0x222fab700f23c2f7
	.xword	0x48fe8ebd77db7980
	.xword	0x02dac619d86d0460
	.xword	0x5f85025dd969bb4b
	.xword	0xf5064efb71d2cabe
	.xword	0x0647bad759d6d349
	.xword	0xca018d843c8e2eaa
	.xword	0xff8071780b506e3d
	.xword	0x3852eae9a72a7b91
	.xword	0x0dad50a29651accd
	.xword	0x0da3d322accaf13b
	.xword	0xfe975d626c3ea16e
	.xword	0x9c9f472c7a1642cf
	.xword	0xe6f1bb7d523b9b0f
	.xword	0x509cb902a24eea8f
	.xword	0x707ff23b02d76a52
	.xword	0x636c4f74d66ca01d
	.xword	0x28abf414bb456d2d
	.xword	0xc35383f4bb7e6d7e
	.xword	0x2574ff94d7884d75
	.xword	0xab1af4702a0bdff2
	.xword	0x7b46006888e37cea
	.xword	0xddff8cde93ad6928
	.xword	0xf49a0b44a4bdb682
	.xword	0x06ca59fb7b824cd7
	.xword	0xc9f27f43beb7f3b7
	.xword	0xe24819b2f288eca2
	.xword	0x3856e75f13ed6c79



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
