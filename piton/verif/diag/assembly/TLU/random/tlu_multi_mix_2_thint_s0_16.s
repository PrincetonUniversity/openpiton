// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_16.s
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
   random seed:	9930033
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

	setx 0x2fbbed1c23575cda, %g1, %g0
	setx 0xf9cd40e259180408, %g1, %g1
	setx 0xece4f138d7224638, %g1, %g2
	setx 0x71c3f174f3e785be, %g1, %g3
	setx 0x646aa2ccbbf8ec39, %g1, %g4
	setx 0xbab32b531d64d1a4, %g1, %g5
	setx 0x7e0c02bb5cf04353, %g1, %g6
	setx 0x85bff6f10e3a53c0, %g1, %g7
	setx 0x32acf06d05d2454d, %g1, %r16
	setx 0x7b4e1733373a7ef8, %g1, %r17
	setx 0xc233bf83d6f1a0eb, %g1, %r18
	setx 0x68ffe3ab8ce50acd, %g1, %r19
	setx 0x6e0d284c815b2bca, %g1, %r20
	setx 0x862f41bf40f97476, %g1, %r21
	setx 0xf720b70147688067, %g1, %r22
	setx 0x7dddf6577dc8db8e, %g1, %r23
	setx 0xfc702edd2483f366, %g1, %r24
	setx 0xf52348d23fedb2bb, %g1, %r25
	setx 0x8a10ec02c6cc54d3, %g1, %r26
	setx 0xaa17d0b9cea79163, %g1, %r27
	setx 0xb6d27b092fff3383, %g1, %r28
	setx 0x25ac8d6c1a4b1312, %g1, %r29
	setx 0x8f69babacc060c26, %g1, %r30
	setx 0xac0ddc0e8a00c701, %g1, %r31
	save
	setx 0xe917f0abbc0acc75, %g1, %r16
	setx 0xa53db4986a2535b6, %g1, %r17
	setx 0xe3c34ed046896901, %g1, %r18
	setx 0x1ab4c8f0912a86b3, %g1, %r19
	setx 0x84e8e59320871b62, %g1, %r20
	setx 0xaf179f86e56c870e, %g1, %r21
	setx 0x082d1a0e9c4ad91e, %g1, %r22
	setx 0x7ad2fda13b4a5242, %g1, %r23
	setx 0x0905b15336efd790, %g1, %r24
	setx 0x5d39af380b35b581, %g1, %r25
	setx 0xff6a4926a368df71, %g1, %r26
	setx 0x5a19c896453c10a1, %g1, %r27
	setx 0x7d688ed68be38f70, %g1, %r28
	setx 0xeb899b6ce91eef36, %g1, %r29
	setx 0x1db17a8e1280cabd, %g1, %r30
	setx 0x88135fa354f03bd5, %g1, %r31
	save
	setx 0xd3a0b851fa7f3bca, %g1, %r16
	setx 0xf94650d267ecef06, %g1, %r17
	setx 0x2de65f065e48725c, %g1, %r18
	setx 0x362dac5c3659f35a, %g1, %r19
	setx 0xf2a007574779985b, %g1, %r20
	setx 0xbbb24555c139bd94, %g1, %r21
	setx 0x7025238046850bb2, %g1, %r22
	setx 0x867d1096c54b4775, %g1, %r23
	setx 0x3357c4214a381e6b, %g1, %r24
	setx 0x15b23eaa8105a231, %g1, %r25
	setx 0xac020de2e075ba63, %g1, %r26
	setx 0xbef6a4d65a562b8c, %g1, %r27
	setx 0xb2ecfc5601114e84, %g1, %r28
	setx 0x6de832e4d29cc686, %g1, %r29
	setx 0x9a9d2ddcfe91e61d, %g1, %r30
	setx 0x466d2626bca7b6ca, %g1, %r31
	save
	setx 0xf8c4ea78d64db73c, %g1, %r16
	setx 0x784e62d22e92a1b1, %g1, %r17
	setx 0x4559244e3e8e6ae1, %g1, %r18
	setx 0xb8e027438b750872, %g1, %r19
	setx 0xf51c23e9b9925d1d, %g1, %r20
	setx 0x31dfaceeb3e8954d, %g1, %r21
	setx 0x3ca4de5e643f502d, %g1, %r22
	setx 0xff7cdbffa907db2e, %g1, %r23
	setx 0xbec6b50d27e90c5f, %g1, %r24
	setx 0x514c0bee45100c9d, %g1, %r25
	setx 0x57a2335d42e5b5ec, %g1, %r26
	setx 0x0180a1dcc44505ce, %g1, %r27
	setx 0x866a056d10a18a3d, %g1, %r28
	setx 0x18ae4dc4ce3f5906, %g1, %r29
	setx 0xfcb759d73dd0cfec, %g1, %r30
	setx 0x4f59f004f5a8cbf2, %g1, %r31
	save
	setx 0xe4eb769cda44dd89, %g1, %r16
	setx 0xd74e8e71e641fb1b, %g1, %r17
	setx 0x4099d6969452f89b, %g1, %r18
	setx 0xfdf6462058220a25, %g1, %r19
	setx 0x3cc1fd258fe5ece0, %g1, %r20
	setx 0x3a158fbdcb09ed8a, %g1, %r21
	setx 0x8506c3214af8f3f0, %g1, %r22
	setx 0x4bdd2919e5013b8e, %g1, %r23
	setx 0xea4c1a5e8f0305e0, %g1, %r24
	setx 0x12afb8b0ba474fe6, %g1, %r25
	setx 0x73ffcec0a545b9ad, %g1, %r26
	setx 0x857c36d816425d57, %g1, %r27
	setx 0x0786e5e5a63b0474, %g1, %r28
	setx 0x86497d5824ad2030, %g1, %r29
	setx 0xf5190d995afc2e1b, %g1, %r30
	setx 0xca47c1db20e56bc6, %g1, %r31
	save
	setx 0x0ee54bd21a06df9d, %g1, %r16
	setx 0x481604cd9ebee8f8, %g1, %r17
	setx 0x3f261873188508a4, %g1, %r18
	setx 0x3545271e9f4554b8, %g1, %r19
	setx 0xd3b0be9b5f84ed6e, %g1, %r20
	setx 0x19571c93c63127a0, %g1, %r21
	setx 0x0f62bab77e226b92, %g1, %r22
	setx 0x405d990edf75d679, %g1, %r23
	setx 0x4f0c3b300cb268e2, %g1, %r24
	setx 0x0176e90ba93fb1ff, %g1, %r25
	setx 0xb98d4dacaf9cf96b, %g1, %r26
	setx 0x48e7e133931b498a, %g1, %r27
	setx 0x4dfafd17dfd9accc, %g1, %r28
	setx 0x49bcdb89cbb38e18, %g1, %r29
	setx 0x8cfe4097cc9c78d0, %g1, %r30
	setx 0x32f63cb2f43b15fc, %g1, %r31
	save
	setx 0xa3e8bc411d2edef4, %g1, %r16
	setx 0x2585695d4eceae0f, %g1, %r17
	setx 0x59909c6485ebb2dd, %g1, %r18
	setx 0xfb6845ab3a2e97f9, %g1, %r19
	setx 0xfa29815045731acf, %g1, %r20
	setx 0x1618f070a03b2220, %g1, %r21
	setx 0x1c14c147fc1effe6, %g1, %r22
	setx 0x171f3f64861a50ec, %g1, %r23
	setx 0x3fad1307bd6efa19, %g1, %r24
	setx 0x947d935609c00a6c, %g1, %r25
	setx 0x2edf39db8bb1232f, %g1, %r26
	setx 0xbdd9c3eb73860cc7, %g1, %r27
	setx 0xc084bd1d29b63a83, %g1, %r28
	setx 0x558085a057f93a68, %g1, %r29
	setx 0x89df54fbaa6e9e5f, %g1, %r30
	setx 0x0ab7ccac6b798c7f, %g1, %r31
	save
	setx 0x4b4fdb90d394ed7f, %g1, %r16
	setx 0x4611267ad6197cb6, %g1, %r17
	setx 0x4c30ec2ec1ffdc5b, %g1, %r18
	setx 0x89e3485205648cfd, %g1, %r19
	setx 0xe06321e13a80c5fb, %g1, %r20
	setx 0x206ef71383f472c7, %g1, %r21
	setx 0x22f2af039bf2c29e, %g1, %r22
	setx 0x8797f2a62dcff595, %g1, %r23
	setx 0x564384ca0adf843b, %g1, %r24
	setx 0x3c4edcbdcf7b5cc8, %g1, %r25
	setx 0xb54c99356cdbdbf8, %g1, %r26
	setx 0xd0dc58e039b97260, %g1, %r27
	setx 0x42ed35a074c424bb, %g1, %r28
	setx 0xc025b8389581cb63, %g1, %r29
	setx 0x3f47dadf919e6af3, %g1, %r30
	setx 0x8587716775230d28, %g1, %r31
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
	.word 0x8d9560fa  ! 2: WRPR_PSTATE_I	wrpr	%r21, 0x00fa, %pstate
	.word 0xb1e4a1cc  ! 4: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e52187  ! 5: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x412fb11300001b12, %g1, %r10
	.word 0x839a8000  ! 6: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3540000  ! 7: RDPR_GL	<illegal instruction>
	.word 0xb1e5e0db  ! 15: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e5e105  ! 19: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d9420de  ! 21: WRPR_PSTATE_I	wrpr	%r16, 0x00de, %pstate
	.word 0xb5e42076  ! 22: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e520b1  ! 27: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85956129  ! 30: WRPR_TSTATE_I	wrpr	%r21, 0x0129, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d60b4  ! 34: ANDcc_I	andcc 	%r21, 0x00b4, %r28
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 38: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba04c000  ! 39: ADD_R	add 	%r19, %r0, %r29
	.word 0xbbe521a8  ! 41: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x91952059  ! 44: WRPR_PIL_I	wrpr	%r20, 0x0059, %pil
	.word 0xbf504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5619b  ! 47: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb12c4000  ! 51: SLL_R	sll 	%r17, %r0, %r24
	.word 0xb734f001  ! 55: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xb5508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0xb6b5e1a2  ! 60: SUBCcc_I	orncc 	%r23, 0x01a2, %r27
	.word 0x8195206d  ! 64: WRPR_TPC_I	wrpr	%r20, 0x006d, %tpc
	.word 0xbb345000  ! 65: SRLX_R	srlx	%r17, %r0, %r29
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a54000  ! 69: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xb9e4a15c  ! 70: SAVE_I	save	%r18, 0x0001, %r28
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 72: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e520f6  ! 81: SAVE_I	save	%r20, 0x0001, %r24
	mov	1, %r12
	.word 0xa1930000  ! 84: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e4211e  ! 86: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5201d  ! 87: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8194e0a4  ! 89: WRPR_TPC_I	wrpr	%r19, 0x00a4, %tpc
	.word 0xb3520000  ! 91: RDPR_PIL	<illegal instruction>
	.word 0xbfe42048  ! 93: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4619f  ! 97: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe521fd  ! 101: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4e178  ! 107: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe5a114  ! 108: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe561e2  ! 109: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb825e0bf  ! 110: SUB_I	sub 	%r23, 0x00bf, %r28
	setx	data_start_0, %g1, %r22
	.word 0xbbe4a15b  ! 113: SAVE_I	save	%r18, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e56113  ! 124: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc346132  ! 130: ORN_I	orn 	%r17, 0x0132, %r30
	setx	data_start_0, %g1, %r21
	.word 0xb9e4a1e8  ! 133: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 134: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8594609d  ! 138: WRPR_TSTATE_I	wrpr	%r17, 0x009d, %tstate
	.word 0xb5e420a0  ! 139: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e125  ! 142: SAVE_I	save	%r19, 0x0001, %r28
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e561c3  ! 150: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5e0aa  ! 156: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbc250000  ! 160: SUB_R	sub 	%r20, %r0, %r30
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421ea  ! 163: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460a4  ! 166: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x9195e02b  ! 168: WRPR_PIL_I	wrpr	%r23, 0x002b, %pil
	.word 0xbb357001  ! 171: SRLX_I	srlx	%r21, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 174: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5500000  ! 175: RDPR_TPC	<illegal instruction>
	.word 0xb135f001  ! 176: SRLX_I	srlx	%r23, 0x0001, %r24
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1f4  ! 183: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e52013  ! 190: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e52178  ! 192: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5a163  ! 193: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8995e142  ! 196: WRPR_TICK_I	wrpr	%r23, 0x0142, %tick
	mov	1, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5602d  ! 202: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e560f0  ! 207: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e460a1  ! 208: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5a1bd  ! 211: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4204d  ! 215: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbcbc0000  ! 216: XNORcc_R	xnorcc 	%r16, %r0, %r30
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a003  ! 220: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e561b0  ! 221: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e5e1ab  ! 222: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd510000  ! 226: RDPR_TICK	<illegal instruction>
	setx	0xa6a8febf00009bc9, %g1, %r10
	.word 0x819a8000  ! 229: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46134  ! 238: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf480000  ! 239: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd342001  ! 243: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xbfe4a196  ! 244: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe520a8  ! 245: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e56110  ! 251: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe521e1  ! 252: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5540000  ! 253: RDPR_GL	<illegal instruction>
	.word 0xb5e5a1f8  ! 255: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20ca07bf00006d05, %g1, %r10
	.word 0x819a8000  ! 259: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e421d5  ! 264: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e421b8  ! 266: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb950c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0xb7e46152  ! 269: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 278: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919461bb  ! 279: WRPR_PIL_I	wrpr	%r17, 0x01bb, %pil
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4603e  ! 284: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a058  ! 285: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe5a15f  ! 287: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e46055  ! 288: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb0148000  ! 289: OR_R	or 	%r18, %r0, %r24
	.word 0xbbe5a18d  ! 296: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4619c  ! 297: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a145  ! 306: ORNcc_I	orncc 	%r18, 0x0145, %r27
	.word 0xbd500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0xb1e4a02b  ! 308: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8394e055  ! 311: WRPR_TNPC_I	wrpr	%r19, 0x0055, %tnpc
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946189  ! 324: WRPR_TPC_I	wrpr	%r17, 0x0189, %tpc
	.word 0xb3e5e149  ! 325: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb53ca001  ! 326: SRA_I	sra 	%r18, 0x0001, %r26
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 329: RDPR_TNPC	<illegal instruction>
	.word 0x81942092  ! 332: WRPR_TPC_I	wrpr	%r16, 0x0092, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x819560ee  ! 336: WRPR_TPC_I	wrpr	%r21, 0x00ee, %tpc
	.word 0xbf500000  ! 337: RDPR_TPC	<illegal instruction>
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e199  ! 343: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e4218d  ! 347: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5a059  ! 350: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5a195  ! 355: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a030  ! 359: WRPR_PSTATE_I	wrpr	%r22, 0x0030, %pstate
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46194  ! 365: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e56173  ! 368: SAVE_I	save	%r21, 0x0001, %r24
	mov	0, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb53cd000  ! 373: SRAX_R	srax	%r19, %r0, %r26
	.word 0xbde461b5  ! 374: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x859561a7  ! 376: WRPR_TSTATE_I	wrpr	%r21, 0x01a7, %tstate
	.word 0xbde5e08a  ! 377: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e46123  ! 381: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x859520d7  ! 382: WRPR_TSTATE_I	wrpr	%r20, 0x00d7, %tstate
	setx	data_start_2, %g1, %r16
	.word 0x919421e7  ! 388: WRPR_PIL_I	wrpr	%r16, 0x01e7, %pil
	.word 0xbbe42188  ! 392: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e460af  ! 393: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5a19e  ! 394: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb0446172  ! 395: ADDC_I	addc 	%r17, 0x0172, %r24
	.word 0xbfe461b1  ! 396: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8194a0fa  ! 397: WRPR_TPC_I	wrpr	%r18, 0x00fa, %tpc
	.word 0x89952094  ! 400: WRPR_TICK_I	wrpr	%r20, 0x0094, %tick
	.word 0xbfe42054  ! 401: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x87952127  ! 402: WRPR_TT_I	wrpr	%r20, 0x0127, %tt
	.word 0xbfe5a16b  ! 403: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4a06d  ! 405: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe42120  ! 407: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe5201a  ! 410: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 412: MOVR_R	movre	%r23, %r0, %r29
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	.word 0x8594e008  ! 418: WRPR_TSTATE_I	wrpr	%r19, 0x0008, %tstate
	.word 0x8d94e033  ! 422: WRPR_PSTATE_I	wrpr	%r19, 0x0033, %pstate
	.word 0xbfe5a0da  ! 426: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a142  ! 428: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4a15d  ! 429: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e5a11c  ! 430: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5e0cd  ! 431: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 434: RDPR_TICK	<illegal instruction>
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4607d  ! 440: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e421cf  ! 442: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb751c000  ! 449: RDPR_TL	<illegal instruction>
	.word 0xb7e4a1ed  ! 454: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e52135  ! 456: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_5, %g1, %r18
	.word 0xbfe5610c  ! 473: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e42165  ! 479: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e46049  ! 480: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x919521e5  ! 482: WRPR_PIL_I	wrpr	%r20, 0x01e5, %pil
	.word 0xbde5a03d  ! 483: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x2c2d00450000cb9c, %g1, %r10
	.word 0x819a8000  ! 484: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0xb3e42108  ! 487: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x899521e5  ! 488: WRPR_TICK_I	wrpr	%r20, 0x01e5, %tick
	.word 0xb950c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xbde4a04e  ! 497: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4613a  ! 501: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e5a164  ! 508: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe46065  ! 510: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe56046  ! 511: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7510000  ! 512: RDPR_TICK	<illegal instruction>
	.word 0xb3e420ac  ! 513: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e5e130  ! 516: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d94a09f  ! 519: WRPR_PSTATE_I	wrpr	%r18, 0x009f, %pstate
	.word 0xb3e4611e  ! 521: SAVE_I	save	%r17, 0x0001, %r25
	setx	0xca7328430000c8dd, %g1, %r10
	.word 0x819a8000  ! 522: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0xa1930000  ! 525: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4a1bb  ! 527: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4e1c4  ! 533: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe421bf  ! 536: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb6954000  ! 537: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0xb7e46016  ! 540: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e42004  ! 541: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8994a096  ! 543: WRPR_TICK_I	wrpr	%r18, 0x0096, %tick
	.word 0xb3352001  ! 546: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xbde5e1db  ! 548: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e521de  ! 549: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5e123  ! 550: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x89946064  ! 570: WRPR_TICK_I	wrpr	%r17, 0x0064, %tick
	.word 0xbb7da401  ! 572: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb7e421a4  ! 573: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe42194  ! 574: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42137  ! 575: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3500000  ! 579: RDPR_TPC	<illegal instruction>
	.word 0xb1e42138  ! 583: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba956031  ! 585: ORcc_I	orcc 	%r21, 0x0031, %r29
	.word 0x8d94a1b0  ! 586: WRPR_PSTATE_I	wrpr	%r18, 0x01b0, %pstate
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xb3e4a1cd  ! 594: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4613c  ! 597: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4a100  ! 598: SAVE_I	save	%r18, 0x0001, %r25
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421ad  ! 600: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbc0521bb  ! 601: ADD_I	add 	%r20, 0x01bb, %r30
	.word 0xbfe561a9  ! 607: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e56189  ! 610: SAVE_I	save	%r21, 0x0001, %r26
	setx	0xb74efd2800000a1f, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a1b2  ! 618: WRPR_TPC_I	wrpr	%r18, 0x01b2, %tpc
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ca001  ! 620: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0x8994a100  ! 621: WRPR_TICK_I	wrpr	%r18, 0x0100, %tick
	.word 0xb3e4615a  ! 622: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf480000  ! 625: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0xc1d290e60000ea0c, %g1, %r10
	.word 0x839a8000  ! 626: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e4a114  ! 628: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8795e1da  ! 631: WRPR_TT_I	wrpr	%r23, 0x01da, %tt
	.word 0xb7e461c1  ! 635: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a055  ! 638: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5e1cc  ! 640: SAVE_I	save	%r23, 0x0001, %r29
	setx	0xfb3b3a9000009d5, %g1, %r10
	.word 0x819a8000  ! 642: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e42122  ! 643: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe521ce  ! 645: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a1f6  ! 648: WRPR_PSTATE_I	wrpr	%r22, 0x01f6, %pstate
	.word 0xbab54000  ! 650: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xb7e5603f  ! 653: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8d942094  ! 661: WRPR_PSTATE_I	wrpr	%r16, 0x0094, %pstate
	.word 0xb1e520f5  ! 664: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde520e6  ! 665: SAVE_I	save	%r20, 0x0001, %r30
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e460cd  ! 669: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf520000  ! 670: RDPR_PIL	<illegal instruction>
	.word 0xb5e4a045  ! 673: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e421d9  ! 674: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8995a071  ! 675: WRPR_TICK_I	wrpr	%r22, 0x0071, %tick
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e105  ! 684: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x9195607e  ! 686: WRPR_PIL_I	wrpr	%r21, 0x007e, %pil
	.word 0xbfe46187  ! 687: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb641800  ! 689: MOVcc_R	<illegal instruction>
	.word 0xb0a40000  ! 693: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0x9195605a  ! 694: WRPR_PIL_I	wrpr	%r21, 0x005a, %pil
	mov	0, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e46033  ! 697: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7520000  ! 698: RDPR_PIL	<illegal instruction>
	.word 0xbd510000  ! 704: RDPR_TICK	<illegal instruction>
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0c1  ! 708: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb951c000  ! 709: RDPR_TL	<illegal instruction>
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1e0  ! 718: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5a052  ! 719: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3508000  ! 729: RDPR_TSTATE	<illegal instruction>
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	.word 0xbf518000  ! 740: RDPR_PSTATE	<illegal instruction>
	.word 0xbc2ca107  ! 741: ANDN_I	andn 	%r18, 0x0107, %r30
	.word 0xb5518000  ! 742: RDPR_PSTATE	<illegal instruction>
	.word 0xb351c000  ! 743: RDPR_TL	<illegal instruction>
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94219a  ! 752: WRPR_PSTATE_I	wrpr	%r16, 0x019a, %pstate
	.word 0xb5e560d9  ! 755: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e065  ! 759: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e4e197  ! 768: SAVE_I	save	%r19, 0x0001, %r28
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfe4e173  ! 774: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a019  ! 776: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde52090  ! 778: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5617d  ! 779: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e56131  ! 780: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde520ea  ! 781: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7520000  ! 782: RDPR_PIL	<illegal instruction>
	.word 0xb9e5e16b  ! 784: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e420b8  ! 785: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3510000  ! 787: RDPR_TICK	<illegal instruction>
	.word 0x8394e10b  ! 792: WRPR_TNPC_I	wrpr	%r19, 0x010b, %tnpc
	mov	2, %r12
	.word 0xa1930000  ! 793: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb33de001  ! 794: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0x8795a0e6  ! 795: WRPR_TT_I	wrpr	%r22, 0x00e6, %tt
	.word 0xbea58000  ! 798: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xbfe5a119  ! 800: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819560e3  ! 802: WRPR_TPC_I	wrpr	%r21, 0x00e3, %tpc
	.word 0xb9e4a05c  ! 805: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbf500000  ! 807: RDPR_TPC	<illegal instruction>
	.word 0xbbe52193  ! 809: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 811: RDPR_TSTATE	<illegal instruction>
	.word 0xbde56086  ! 813: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde5604b  ! 814: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e5e09d  ! 815: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 817: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb351c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xb73d9000  ! 829: SRAX_R	srax	%r22, %r0, %r27
	.word 0xbde561a0  ! 830: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1510000  ! 832: RDPR_TICK	<illegal instruction>
	.word 0xb3e4601f  ! 835: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8395e162  ! 837: WRPR_TNPC_I	wrpr	%r23, 0x0162, %tnpc
	.word 0xb415a0da  ! 840: OR_I	or 	%r22, 0x00da, %r26
	.word 0xb48d4000  ! 841: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0x8995a1ba  ! 844: WRPR_TICK_I	wrpr	%r22, 0x01ba, %tick
	.word 0xb1e5e014  ! 847: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb815204f  ! 849: OR_I	or 	%r20, 0x004f, %r28
	mov	0, %r12
	.word 0xa1930000  ! 852: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56049  ! 855: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb415c000  ! 864: OR_R	or 	%r23, %r0, %r26
	.word 0xb3e4211c  ! 865: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3355000  ! 866: SRLX_R	srlx	%r21, %r0, %r25
	mov	1, %r12
	.word 0xa1930000  ! 869: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d95213d  ! 870: WRPR_PSTATE_I	wrpr	%r20, 0x013d, %pstate
	.word 0xb1480000  ! 871: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3e561c1  ! 872: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4e1cd  ! 876: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5e17b  ! 879: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e038  ! 886: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xba34a1a8  ! 887: SUBC_I	orn 	%r18, 0x01a8, %r29
	.word 0xb3e521d7  ! 888: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_4, %g1, %r22
	.word 0xb1e5a1aa  ! 893: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5201d  ! 894: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8d94613b  ! 899: WRPR_PSTATE_I	wrpr	%r17, 0x013b, %pstate
	.word 0xb1e4e178  ! 901: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb8a42113  ! 902: SUBcc_I	subcc 	%r16, 0x0113, %r28
	.word 0xb9e5614e  ! 906: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb62ca0d3  ! 908: ANDN_I	andn 	%r18, 0x00d3, %r27
	setx	data_start_6, %g1, %r17
	.word 0xb1e42193  ! 910: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x81952162  ! 912: WRPR_TPC_I	wrpr	%r20, 0x0162, %tpc
	setx	0x43361f3000003ec6, %g1, %r10
	.word 0x839a8000  ! 917: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb235e108  ! 918: ORN_I	orn 	%r23, 0x0108, %r25
	.word 0xb5e42008  ! 921: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x2749cd170000ae10, %g1, %r10
	.word 0x839a8000  ! 922: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe46032  ! 923: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4a1e7  ! 928: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb73d2001  ! 932: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xbbe420bd  ! 933: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd510000  ! 937: RDPR_TICK	<illegal instruction>
	.word 0xbfe46198  ! 940: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8395a0c6  ! 942: WRPR_TNPC_I	wrpr	%r22, 0x00c6, %tnpc
	.word 0xb1e56066  ! 943: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb151c000  ! 945: RDPR_TL	<illegal instruction>
	.word 0xb1500000  ! 946: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e03f  ! 947: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe461e4  ! 952: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xba3ca1bc  ! 954: XNOR_I	xnor 	%r18, 0x01bc, %r29
	.word 0xbd500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0x919421e4  ! 957: WRPR_PIL_I	wrpr	%r16, 0x01e4, %pil
	.word 0xbde5207a  ! 959: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xba1421df  ! 961: OR_I	or 	%r16, 0x01df, %r29
	.word 0xb9e4203d  ! 962: SAVE_I	save	%r16, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 963: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe461d2  ! 971: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35c000  ! 977: SRL_R	srl 	%r23, %r0, %r30
	.word 0x859460d7  ! 979: WRPR_TSTATE_I	wrpr	%r17, 0x00d7, %tstate
	.word 0x8194a1b1  ! 980: WRPR_TPC_I	wrpr	%r18, 0x01b1, %tpc
	.word 0xb5e4a000  ! 981: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e421ac  ! 983: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde42095  ! 985: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e52142  ! 986: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a040  ! 989: WRPR_TT_I	wrpr	%r18, 0x0040, %tt
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5602d  ! 992: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a133  ! 994: SAVE_I	save	%r18, 0x0001, %r27
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
	.word 0xf875e12b  ! 1: STX_I	stx	%r28, [%r23 + 0x012b]
	.word 0x8d95e09e  ! 2: WRPR_PSTATE_I	wrpr	%r23, 0x009e, %pstate
	setx	0x4de747a60000bb9d, %g1, %r10
	.word 0x839a8000  ! 6: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd540000  ! 7: RDPR_GL	rdpr	%-, %r30
	.word 0xf0244000  ! 8: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf93de126  ! 11: STDF_I	std	%f28, [0x0126, %r23]
	.word 0xf6350000  ! 12: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x8d95e04e  ! 21: WRPR_PSTATE_I	wrpr	%r23, 0x004e, %pstate
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859560a8  ! 30: WRPR_TSTATE_I	wrpr	%r21, 0x00a8, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d600c  ! 34: ANDcc_I	andcc 	%r21, 0x000c, %r28
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 37: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xb5480000  ! 38: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbe044000  ! 39: ADD_R	add 	%r17, %r0, %r31
	.word 0x91946159  ! 44: WRPR_PIL_I	wrpr	%r17, 0x0159, %pil
	.word 0xbd504000  ! 46: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf73dc000  ! 48: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfa3d8000  ! 49: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf82dc000  ! 50: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xb72d8000  ! 51: SLL_R	sll 	%r22, %r0, %r27
	.word 0xf82da075  ! 53: STB_I	stb	%r28, [%r22 + 0x0075]
	.word 0xbb34f001  ! 55: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xf234c000  ! 57: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xbb508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0xbab56122  ! 60: SUBCcc_I	orncc 	%r21, 0x0122, %r29
	.word 0x819461d9  ! 64: WRPR_TPC_I	wrpr	%r17, 0x01d9, %tpc
	.word 0xb9351000  ! 65: SRLX_R	srlx	%r20, %r0, %r28
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ca0ef  ! 68: STB_I	stb	%r28, [%r18 + 0x00ef]
	.word 0xbaa54000  ! 69: SUBcc_R	subcc 	%r21, %r0, %r29
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 72: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf82da0ee  ! 74: STB_I	stb	%r28, [%r22 + 0x00ee]
	.word 0xf62c0000  ! 79: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfe75c000  ! 80: STX_R	stx	%r31, [%r23 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 84: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x819460eb  ! 89: WRPR_TPC_I	wrpr	%r17, 0x00eb, %tpc
	.word 0xb5520000  ! 91: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf075c000  ! 94: STX_R	stx	%r24, [%r23 + %r0]
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53d20f7  ! 96: STDF_I	std	%f26, [0x00f7, %r20]
	.word 0xf73d4000  ! 98: STDF_R	std	%f27, [%r0, %r21]
	.word 0xb625a1e3  ! 110: SUB_I	sub 	%r22, 0x01e3, %r27
	setx	data_start_5, %g1, %r20
	.word 0xf53ca095  ! 115: STDF_I	std	%f26, [0x0095, %r18]
	mov	2, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf43da097  ! 118: STD_I	std	%r26, [%r22 + 0x0097]
	.word 0xfe35c000  ! 119: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf6754000  ! 122: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfa25215f  ! 127: STW_I	stw	%r29, [%r20 + 0x015f]
	.word 0xf62ce154  ! 128: STB_I	stb	%r27, [%r19 + 0x0154]
	.word 0xbc34e0a5  ! 130: ORN_I	orn 	%r19, 0x00a5, %r30
	setx	data_start_7, %g1, %r23
	mov	1, %r12
	.word 0xa1930000  ! 134: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8594a090  ! 138: WRPR_TSTATE_I	wrpr	%r18, 0x0090, %tstate
	.word 0xfc3c0000  ! 140: STD_R	std	%r30, [%r16 + %r0]
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82de105  ! 149: STB_I	stb	%r28, [%r23 + 0x0105]
	.word 0xfa2c6008  ! 151: STB_I	stb	%r29, [%r17 + 0x0008]
	.word 0xf83d4000  ! 152: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe3d0000  ! 154: STD_R	std	%r31, [%r20 + %r0]
	.word 0xbc25c000  ! 160: SUB_R	sub 	%r23, %r0, %r30
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91952152  ! 168: WRPR_PIL_I	wrpr	%r20, 0x0152, %pil
	.word 0xb3347001  ! 171: SRLX_I	srlx	%r17, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 174: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7500000  ! 175: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xbd347001  ! 176: SRLX_I	srlx	%r17, 0x0001, %r30
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 181: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf73c4000  ! 182: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf73c8000  ! 189: STDF_R	std	%f27, [%r0, %r18]
	.word 0x8995a0b7  ! 196: WRPR_TICK_I	wrpr	%r22, 0x00b7, %tick
	mov	0, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53cc000  ! 198: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf825c000  ! 199: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf82d8000  ! 201: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf62521f2  ! 204: STW_I	stw	%r27, [%r20 + 0x01f2]
	.word 0xf8252001  ! 205: STW_I	stw	%r28, [%r20 + 0x0001]
	.word 0xf43da16d  ! 210: STD_I	std	%r26, [%r22 + 0x016d]
	.word 0xf675a10d  ! 214: STX_I	stx	%r27, [%r22 + 0x010d]
	.word 0xb6bd0000  ! 216: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xf6350000  ! 218: STH_R	sth	%r27, [%r20 + %r0]
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 224: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb3510000  ! 226: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf6748000  ! 227: STX_R	stx	%r27, [%r18 + %r0]
	setx	0xe62f612200001a1b, %g1, %r10
	.word 0x819a8000  ! 229: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63c4000  ! 232: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf2748000  ! 233: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xfe74e1ef  ! 236: STX_I	stx	%r31, [%r19 + 0x01ef]
	.word 0xf675e0bc  ! 237: STX_I	stx	%r27, [%r23 + 0x00bc]
	.word 0xbd480000  ! 239: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf6340000  ! 242: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xbf34a001  ! 243: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0xbf540000  ! 253: RDPR_GL	rdpr	%-, %r31
	setx	0xa83e087b00009c9f, %g1, %r10
	.word 0x819a8000  ! 259: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf82dc000  ! 261: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf82d8000  ! 262: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfe356157  ! 267: STH_I	sth	%r31, [%r21 + 0x0157]
	.word 0xbd50c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0xf83c4000  ! 270: STD_R	std	%r28, [%r17 + %r0]
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13c0000  ! 275: STDF_R	std	%f24, [%r0, %r16]
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 278: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9194602d  ! 279: WRPR_PIL_I	wrpr	%r17, 0x002d, %pil
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc150000  ! 289: OR_R	or 	%r20, %r0, %r30
	.word 0xf53ca012  ! 291: STDF_I	std	%f26, [0x0012, %r18]
	.word 0xf42dc000  ! 292: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf83cc000  ! 293: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfe750000  ! 295: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf8348000  ! 302: STH_R	sth	%r28, [%r18 + %r0]
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e0c6  ! 306: ORNcc_I	orncc 	%r23, 0x00c6, %r29
	.word 0xbb500000  ! 307: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xff3d4000  ! 309: STDF_R	std	%f31, [%r0, %r21]
	.word 0x83956123  ! 311: WRPR_TNPC_I	wrpr	%r21, 0x0123, %tnpc
	.word 0xf22d21cb  ! 314: STB_I	stb	%r25, [%r20 + 0x01cb]
	.word 0xf274e03e  ! 316: STX_I	stx	%r25, [%r19 + 0x003e]
	.word 0xf674610e  ! 319: STX_I	stx	%r27, [%r17 + 0x010e]
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a1cf  ! 324: WRPR_TPC_I	wrpr	%r18, 0x01cf, %tpc
	.word 0xb73ce001  ! 326: SRA_I	sra 	%r19, 0x0001, %r27
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c2081  ! 328: STB_I	stb	%r31, [%r16 + 0x0081]
	.word 0xb7504000  ! 329: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8195203a  ! 332: WRPR_TPC_I	wrpr	%r20, 0x003a, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa2d4000  ! 335: STB_R	stb	%r29, [%r21 + %r0]
	.word 0x8194a16f  ! 336: WRPR_TPC_I	wrpr	%r18, 0x016f, %tpc
	.word 0xb3500000  ! 337: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf824c000  ! 338: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfd3dc000  ! 339: STDF_R	std	%f30, [%r0, %r23]
	.word 0xfa248000  ! 340: STW_R	stw	%r29, [%r18 + %r0]
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3da1d7  ! 342: STDF_I	std	%f30, [0x01d7, %r22]
	.word 0xf035c000  ! 348: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf0358000  ! 349: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xfc35e1ec  ! 356: STH_I	sth	%r30, [%r23 + 0x01ec]
	.word 0xfa25618a  ! 357: STW_I	stw	%r29, [%r21 + 0x018a]
	.word 0xb1504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e0fa  ! 359: WRPR_PSTATE_I	wrpr	%r23, 0x00fa, %pstate
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425e173  ! 366: STW_I	stw	%r26, [%r23 + 0x0173]
	mov	1, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb33d5000  ! 373: SRAX_R	srax	%r21, %r0, %r25
	.word 0xf93da0be  ! 375: STDF_I	std	%f28, [0x00be, %r22]
	.word 0x85952094  ! 376: WRPR_TSTATE_I	wrpr	%r20, 0x0094, %tstate
	.word 0x85942084  ! 382: WRPR_TSTATE_I	wrpr	%r16, 0x0084, %tstate
	.word 0xfe24e14d  ! 385: STW_I	stw	%r31, [%r19 + 0x014d]
	.word 0xff3de0b8  ! 386: STDF_I	std	%f31, [0x00b8, %r23]
	setx	data_start_1, %g1, %r21
	.word 0x91942187  ! 388: WRPR_PIL_I	wrpr	%r16, 0x0187, %pil
	.word 0xf625e07a  ! 389: STW_I	stw	%r27, [%r23 + 0x007a]
	.word 0xf23d8000  ! 391: STD_R	std	%r25, [%r22 + %r0]
	.word 0xbc4420a8  ! 395: ADDC_I	addc 	%r16, 0x00a8, %r30
	.word 0x8195a073  ! 397: WRPR_TPC_I	wrpr	%r22, 0x0073, %tpc
	.word 0x8994e12b  ! 400: WRPR_TICK_I	wrpr	%r19, 0x012b, %tick
	.word 0x8795a063  ! 402: WRPR_TT_I	wrpr	%r22, 0x0063, %tt
	.word 0xf33d0000  ! 408: STDF_R	std	%f25, [%r0, %r20]
	.word 0xfc240000  ! 409: STW_R	stw	%r30, [%r16 + %r0]
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17dc400  ! 412: MOVR_R	movre	%r23, %r0, %r24
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 414: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xfb3dc000  ! 416: STDF_R	std	%f29, [%r0, %r23]
	setx	data_start_4, %g1, %r20
	.word 0x85956118  ! 418: WRPR_TSTATE_I	wrpr	%r21, 0x0118, %tstate
	.word 0xf62ca0f0  ! 420: STB_I	stb	%r27, [%r18 + 0x00f0]
	.word 0x8d946116  ! 422: WRPR_PSTATE_I	wrpr	%r17, 0x0116, %pstate
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8344000  ! 433: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb3510000  ! 434: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf83d8000  ! 435: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf2348000  ! 437: STH_R	sth	%r25, [%r18 + %r0]
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93de13e  ! 443: STDF_I	std	%f28, [0x013e, %r23]
	.word 0xf93cc000  ! 446: STDF_R	std	%f28, [%r0, %r19]
	.word 0xbb51c000  ! 449: RDPR_TL	rdpr	%tl, %r29
	.word 0xf4350000  ! 451: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf22ca187  ! 453: STB_I	stb	%r25, [%r18 + 0x0187]
	setx	data_start_3, %g1, %r23
	.word 0xf42d20bc  ! 458: STB_I	stb	%r26, [%r20 + 0x00bc]
	.word 0xf63c6151  ! 460: STD_I	std	%r27, [%r17 + 0x0151]
	.word 0xfa75609e  ! 462: STX_I	stx	%r29, [%r21 + 0x009e]
	.word 0xf834c000  ! 463: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf6344000  ! 466: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfd3cc000  ! 469: STDF_R	std	%f30, [%r0, %r19]
	.word 0xfd3d4000  ! 471: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf23d4000  ! 472: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf0758000  ! 474: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf03d4000  ! 475: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfb3c8000  ! 477: STDF_R	std	%f29, [%r0, %r18]
	.word 0xfc750000  ! 478: STX_R	stx	%r30, [%r20 + %r0]
	.word 0x91952191  ! 482: WRPR_PIL_I	wrpr	%r20, 0x0191, %pil
	setx	0x4df9ab1f0000384e, %g1, %r10
	.word 0x819a8000  ! 484: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5504000  ! 485: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc3de0f2  ! 486: STD_I	std	%r30, [%r23 + 0x00f2]
	.word 0x89952039  ! 488: WRPR_TICK_I	wrpr	%r20, 0x0039, %tick
	.word 0xb750c000  ! 490: RDPR_TT	rdpr	%tt, %r27
	.word 0xfe746191  ! 491: STX_I	stx	%r31, [%r17 + 0x0191]
	.word 0xfa35606c  ! 492: STH_I	sth	%r29, [%r21 + 0x006c]
	.word 0xf93ca1b8  ! 494: STDF_I	std	%f28, [0x01b8, %r18]
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 500: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf42c0000  ! 502: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xff3c60b4  ! 503: STDF_I	std	%f31, [0x00b4, %r17]
	.word 0xf63d61c0  ! 504: STD_I	std	%r27, [%r21 + 0x01c0]
	.word 0xf2344000  ! 505: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xfa3da06b  ! 506: STD_I	std	%r29, [%r22 + 0x006b]
	.word 0xb1510000  ! 512: RDPR_TICK	<illegal instruction>
	.word 0xf634c000  ! 517: STH_R	sth	%r27, [%r19 + %r0]
	.word 0x8d94e0b9  ! 519: WRPR_PSTATE_I	wrpr	%r19, 0x00b9, %pstate
	.word 0xf875a1aa  ! 520: STX_I	stx	%r28, [%r22 + 0x01aa]
	setx	0xf9dd4ff00000a9c0, %g1, %r10
	.word 0x819a8000  ! 522: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 525: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8354000  ! 531: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf42560ed  ! 532: STW_I	stw	%r26, [%r21 + 0x00ed]
	.word 0xfc25a11e  ! 534: STW_I	stw	%r30, [%r22 + 0x011e]
	.word 0xf625c000  ! 535: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xb0950000  ! 537: ORcc_R	orcc 	%r20, %r0, %r24
	.word 0x8995a192  ! 543: WRPR_TICK_I	wrpr	%r22, 0x0192, %tick
	.word 0xbf356001  ! 546: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xf22ca1a3  ! 554: STB_I	stb	%r25, [%r18 + 0x01a3]
	.word 0xfa2ce134  ! 556: STB_I	stb	%r29, [%r19 + 0x0134]
	.word 0xf43cc000  ! 557: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf13c0000  ! 558: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfe2d8000  ! 562: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfc2ce0aa  ! 564: STB_I	stb	%r30, [%r19 + 0x00aa]
	.word 0xfa74e1a3  ! 565: STX_I	stx	%r29, [%r19 + 0x01a3]
	.word 0xf73c8000  ! 567: STDF_R	std	%f27, [%r0, %r18]
	.word 0xfc35606b  ! 569: STH_I	sth	%r30, [%r21 + 0x006b]
	.word 0x8994e1d8  ! 570: WRPR_TICK_I	wrpr	%r19, 0x01d8, %tick
	.word 0xb97ca401  ! 572: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xfa750000  ! 576: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb3500000  ! 579: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xfe350000  ! 580: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xfe3ca0f9  ! 581: STD_I	std	%r31, [%r18 + 0x00f9]
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9521f2  ! 585: ORcc_I	orcc 	%r20, 0x01f2, %r31
	.word 0x8d95a08b  ! 586: WRPR_PSTATE_I	wrpr	%r22, 0x008b, %pstate
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 591: RDPR_PIL	rdpr	%pil, %r26
	.word 0xfe344000  ! 595: STH_R	sth	%r31, [%r17 + %r0]
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0560d1  ! 601: ADD_I	add 	%r21, 0x00d1, %r30
	.word 0xf42c8000  ! 606: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf23c6096  ! 613: STD_I	std	%r25, [%r17 + 0x0096]
	setx	0x772d017d00005a4b, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a196  ! 618: WRPR_TPC_I	wrpr	%r18, 0x0196, %tpc
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3da001  ! 620: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0x899460a7  ! 621: WRPR_TICK_I	wrpr	%r17, 0x00a7, %tick
	.word 0xf8754000  ! 623: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xb7480000  ! 625: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x948b342b00004b97, %g1, %r10
	.word 0x839a8000  ! 626: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf53d8000  ! 629: STDF_R	std	%f26, [%r0, %r22]
	.word 0x8794a1b8  ! 631: WRPR_TT_I	wrpr	%r18, 0x01b8, %tt
	.word 0xfa756158  ! 632: STX_I	stx	%r29, [%r21 + 0x0158]
	.word 0xf0740000  ! 641: STX_R	stx	%r24, [%r16 + %r0]
	setx	0xa00f5d9d00006fc4, %g1, %r10
	.word 0x819a8000  ! 642: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf23de171  ! 644: STD_I	std	%r25, [%r23 + 0x0171]
	.word 0xb7504000  ! 647: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8d952064  ! 648: WRPR_PSTATE_I	wrpr	%r20, 0x0064, %pstate
	.word 0xb4b5c000  ! 650: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xf33ce09b  ! 652: STDF_I	std	%f25, [0x009b, %r19]
	.word 0xf23c8000  ! 657: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf23ce06f  ! 660: STD_I	std	%r25, [%r19 + 0x006f]
	.word 0x8d94201c  ! 661: WRPR_PSTATE_I	wrpr	%r16, 0x001c, %pstate
	.word 0xfa74c000  ! 662: STX_R	stx	%r29, [%r19 + %r0]
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 668: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xb9520000  ! 670: RDPR_PIL	rdpr	%pil, %r28
	.word 0x8994e08f  ! 675: WRPR_TICK_I	wrpr	%r19, 0x008f, %tick
	.word 0xfc24c000  ! 676: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf62de19e  ! 678: STB_I	stb	%r27, [%r23 + 0x019e]
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91956068  ! 686: WRPR_PIL_I	wrpr	%r21, 0x0068, %pil
	.word 0xbd641800  ! 689: MOVcc_R	<illegal instruction>
	.word 0xfc34e138  ! 691: STH_I	sth	%r30, [%r19 + 0x0138]
	.word 0xb2a54000  ! 693: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0x9194e124  ! 694: WRPR_PIL_I	wrpr	%r19, 0x0124, %pil
	mov	0, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9520000  ! 698: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf83d4000  ! 700: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe3460bc  ! 702: STH_I	sth	%r31, [%r17 + 0x00bc]
	.word 0xfc344000  ! 703: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xb9510000  ! 704: RDPR_TICK	<illegal instruction>
	.word 0xf075e09e  ! 705: STX_I	stx	%r24, [%r23 + 0x009e]
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 709: RDPR_TL	<illegal instruction>
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc246069  ! 720: STW_I	stw	%r30, [%r17 + 0x0069]
	.word 0xfa2c0000  ! 722: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf234618d  ! 724: STH_I	sth	%r25, [%r17 + 0x018d]
	.word 0xf225a125  ! 726: STW_I	stw	%r25, [%r22 + 0x0125]
	.word 0xb7508000  ! 729: RDPR_TSTATE	<illegal instruction>
	.word 0xfa2d0000  ! 730: STB_R	stb	%r29, [%r20 + %r0]
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 732: STH_R	sth	%r29, [%r16 + %r0]
	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 735: STW_R	stw	%r28, [%r19 + %r0]
	setx	data_start_2, %g1, %r16
	.word 0xbd518000  ! 740: RDPR_PSTATE	<illegal instruction>
	.word 0xb02de12b  ! 741: ANDN_I	andn 	%r23, 0x012b, %r24
	.word 0xbf518000  ! 742: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 743: RDPR_TL	<illegal instruction>
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95e1e6  ! 752: WRPR_PSTATE_I	wrpr	%r23, 0x01e6, %pstate
	.word 0xf42da126  ! 753: STB_I	stb	%r26, [%r22 + 0x0126]
	.word 0xf62d21ae  ! 756: STB_I	stb	%r27, [%r20 + 0x01ae]
	.word 0xf6744000  ! 758: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf2754000  ! 765: STX_R	stx	%r25, [%r21 + %r0]
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf6252077  ! 771: STW_I	stw	%r27, [%r20 + 0x0077]
	.word 0xb9520000  ! 782: RDPR_PIL	<illegal instruction>
	.word 0xb1510000  ! 787: RDPR_TICK	<illegal instruction>
	.word 0xfe35c000  ! 788: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf53d0000  ! 789: STDF_R	std	%f26, [%r0, %r20]
	.word 0x8394e0f0  ! 792: WRPR_TNPC_I	wrpr	%r19, 0x00f0, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 793: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb33de001  ! 794: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0x8794a148  ! 795: WRPR_TT_I	wrpr	%r18, 0x0148, %tt
	.word 0xb0a44000  ! 798: SUBcc_R	subcc 	%r17, %r0, %r24
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946066  ! 802: WRPR_TPC_I	wrpr	%r17, 0x0066, %tpc
	.word 0xbd500000  ! 807: RDPR_TPC	rdpr	%tpc, %r30
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 811: RDPR_TSTATE	<illegal instruction>
	.word 0xf4244000  ! 812: STW_R	stw	%r26, [%r17 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 817: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0748000  ! 820: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf82d8000  ! 821: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfc3c8000  ! 823: STD_R	std	%r30, [%r18 + %r0]
	.word 0xb351c000  ! 826: RDPR_TL	rdpr	%tl, %r25
	.word 0xb93c5000  ! 829: SRAX_R	srax	%r17, %r0, %r28
	.word 0xfe2d8000  ! 831: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb9510000  ! 832: RDPR_TICK	<illegal instruction>
	.word 0xf53de1ed  ! 834: STDF_I	std	%f26, [0x01ed, %r23]
	.word 0xff3c0000  ! 836: STDF_R	std	%f31, [%r0, %r16]
	.word 0x8395a062  ! 837: WRPR_TNPC_I	wrpr	%r22, 0x0062, %tnpc
	.word 0xfa3d0000  ! 838: STD_R	std	%r29, [%r20 + %r0]
	.word 0xb814a1ea  ! 840: OR_I	or 	%r18, 0x01ea, %r28
	.word 0xbe8dc000  ! 841: ANDcc_R	andcc 	%r23, %r0, %r31
	.word 0xfe2460bf  ! 842: STW_I	stw	%r31, [%r17 + 0x00bf]
	.word 0x899461c3  ! 844: WRPR_TICK_I	wrpr	%r17, 0x01c3, %tick
	.word 0xfc35a0a3  ! 848: STH_I	sth	%r30, [%r22 + 0x00a3]
	.word 0xb215209f  ! 849: OR_I	or 	%r20, 0x009f, %r25
	.word 0xf03c8000  ! 850: STD_R	std	%r24, [%r18 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 852: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42cc000  ! 859: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf02c0000  ! 860: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf424a1ac  ! 861: STW_I	stw	%r26, [%r18 + 0x01ac]
	.word 0xf8240000  ! 863: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xb2150000  ! 864: OR_R	or 	%r20, %r0, %r25
	.word 0xb7345000  ! 866: SRLX_R	srlx	%r17, %r0, %r27
	mov	1, %r12
	.word 0xa1930000  ! 869: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d9460df  ! 870: WRPR_PSTATE_I	wrpr	%r17, 0x00df, %pstate
	.word 0xb3480000  ! 871: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf4258000  ! 873: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xfc3cc000  ! 877: STD_R	std	%r30, [%r19 + %r0]
	.word 0xfb3d0000  ! 878: STDF_R	std	%f29, [%r0, %r20]
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34602a  ! 887: SUBC_I	orn 	%r17, 0x002a, %r29
	setx	data_start_3, %g1, %r16
	.word 0xf63da113  ! 891: STD_I	std	%r27, [%r22 + 0x0113]
	.word 0xfe7560d0  ! 892: STX_I	stx	%r31, [%r21 + 0x00d0]
	.word 0xfe34c000  ! 896: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfc75e130  ! 897: STX_I	stx	%r30, [%r23 + 0x0130]
	.word 0x8d956181  ! 899: WRPR_PSTATE_I	wrpr	%r21, 0x0181, %pstate
	.word 0xbaa4e124  ! 902: SUBcc_I	subcc 	%r19, 0x0124, %r29
	.word 0xb82d6147  ! 908: ANDN_I	andn 	%r21, 0x0147, %r28
	setx	data_start_0, %g1, %r21
	.word 0xfc3c4000  ! 911: STD_R	std	%r30, [%r17 + %r0]
	.word 0x8195a058  ! 912: WRPR_TPC_I	wrpr	%r22, 0x0058, %tpc
	.word 0xfa2de1bd  ! 914: STB_I	stb	%r29, [%r23 + 0x01bd]
	setx	0xc9f69f9f000099c0, %g1, %r10
	.word 0x839a8000  ! 917: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe35e09a  ! 918: ORN_I	orn 	%r23, 0x009a, %r31
	setx	0x7869ed040000480c, %g1, %r10
	.word 0x839a8000  ! 922: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf82c8000  ! 924: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfa2dc000  ! 926: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfc24c000  ! 929: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf0340000  ! 930: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xb33ce001  ! 932: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xf835c000  ! 934: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfe3cc000  ! 936: STD_R	std	%r31, [%r19 + %r0]
	.word 0xb9510000  ! 937: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf67460d8  ! 938: STX_I	stx	%r27, [%r17 + 0x00d8]
	.word 0x8395e084  ! 942: WRPR_TNPC_I	wrpr	%r23, 0x0084, %tnpc
	.word 0xbd51c000  ! 945: RDPR_TL	rdpr	%tl, %r30
	.word 0xb3500000  ! 946: RDPR_TPC	<illegal instruction>
	.word 0xf2250000  ! 949: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf2750000  ! 950: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb83de05b  ! 954: XNOR_I	xnor 	%r23, 0x005b, %r28
	.word 0xbb500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0x9195a1dd  ! 957: WRPR_PIL_I	wrpr	%r22, 0x01dd, %pil
	.word 0xf4256148  ! 958: STW_I	stw	%r26, [%r21 + 0x0148]
	.word 0xb414a102  ! 961: OR_I	or 	%r18, 0x0102, %r26
	mov	0, %r12
	.word 0x8f930000  ! 963: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4358000  ! 965: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfa3de0f3  ! 966: STD_I	std	%r29, [%r23 + 0x00f3]
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25217c  ! 973: STW_I	stw	%r29, [%r20 + 0x017c]
	.word 0xb3348000  ! 977: SRL_R	srl 	%r18, %r0, %r25
	.word 0x85942109  ! 979: WRPR_TSTATE_I	wrpr	%r16, 0x0109, %tstate
	.word 0x8195e1ae  ! 980: WRPR_TPC_I	wrpr	%r23, 0x01ae, %tpc
	.word 0xf275a015  ! 984: STX_I	stx	%r25, [%r22 + 0x0015]
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87942025  ! 989: WRPR_TT_I	wrpr	%r16, 0x0025, %tt
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22461f4  ! 991: STW_I	stw	%r25, [%r17 + 0x01f4]
	.word 0xfc2ce1dc  ! 997: STB_I	stb	%r30, [%r19 + 0x01dc]
	.word 0xf13da008  ! 998: STDF_I	std	%f24, [0x0008, %r22]
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
	.word 0x8d95a06a  ! 2: WRPR_PSTATE_I	wrpr	%r22, 0x006a, %pstate
	.word 0xfc0d20a8  ! 3: LDUB_I	ldub	[%r20 + 0x00a8], %r30
	setx	0xf104961e00000d9a, %g1, %r10
	.word 0x839a8000  ! 6: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1540000  ! 7: RDPR_GL	<illegal instruction>
	.word 0xfc45a003  ! 13: LDSW_I	ldsw	[%r22 + 0x0003], %r30
	.word 0xf415c000  ! 14: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfd1d8000  ! 16: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf64d2196  ! 17: LDSB_I	ldsb	[%r20 + 0x0196], %r27
	.word 0xfc54a138  ! 20: LDSH_I	ldsh	[%r18 + 0x0138], %r30
	.word 0x8d94208f  ! 21: WRPR_PSTATE_I	wrpr	%r16, 0x008f, %pstate
	.word 0xf31d2072  ! 23: LDDF_I	ldd	[%r20, 0x0072], %f25
	.word 0xf81c0000  ! 24: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xf615e0f8  ! 25: LDUH_I	lduh	[%r23 + 0x00f8], %r27
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d8000  ! 29: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0x859460b4  ! 30: WRPR_TSTATE_I	wrpr	%r17, 0x00b4, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf51c6080  ! 32: LDDF_I	ldd	[%r17, 0x0080], %f26
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c209f  ! 34: ANDcc_I	andcc 	%r16, 0x009f, %r30
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 38: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbe05c000  ! 39: ADD_R	add 	%r23, %r0, %r31
	.word 0xf44d20ce  ! 43: LDSB_I	ldsb	[%r20 + 0x00ce], %r26
	.word 0x91956195  ! 44: WRPR_PIL_I	wrpr	%r21, 0x0195, %pil
	.word 0xf8058000  ! 45: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xbf504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xb52c0000  ! 51: SLL_R	sll 	%r16, %r0, %r26
	.word 0xfa550000  ! 52: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf254e190  ! 54: LDSH_I	ldsh	[%r19 + 0x0190], %r25
	.word 0xb735b001  ! 55: SRLX_I	srlx	%r22, 0x0001, %r27
	.word 0xb1508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0xb6b5a11a  ! 60: SUBCcc_I	orncc 	%r22, 0x011a, %r27
	.word 0xf0446176  ! 61: LDSW_I	ldsw	[%r17 + 0x0176], %r24
	.word 0x8195e040  ! 64: WRPR_TPC_I	wrpr	%r23, 0x0040, %tpc
	.word 0xb5341000  ! 65: SRLX_R	srlx	%r16, %r0, %r26
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a4c000  ! 69: SUBcc_R	subcc 	%r19, %r0, %r25
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 72: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf614a016  ! 73: LDUH_I	lduh	[%r18 + 0x0016], %r27
	mov	1, %r12
	.word 0xa1930000  ! 84: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf655e11f  ! 88: LDSH_I	ldsh	[%r23 + 0x011f], %r27
	.word 0x8195a08f  ! 89: WRPR_TPC_I	wrpr	%r22, 0x008f, %tpc
	.word 0xf255a11b  ! 90: LDSH_I	ldsh	[%r22 + 0x011b], %r25
	.word 0xb9520000  ! 91: RDPR_PIL	<illegal instruction>
	.word 0xfc4421b3  ! 92: LDSW_I	ldsw	[%r16 + 0x01b3], %r30
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054e04f  ! 100: LDSH_I	ldsh	[%r19 + 0x004f], %r24
	.word 0xf8450000  ! 104: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf04d0000  ! 106: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xbc25e1e7  ! 110: SUB_I	sub 	%r23, 0x01e7, %r30
	.word 0xf4558000  ! 111: LDSH_R	ldsh	[%r22 + %r0], %r26
	setx	data_start_3, %g1, %r23
	.word 0xf31d6078  ! 114: LDDF_I	ldd	[%r21, 0x0078], %f25
	mov	0, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf84ca122  ! 121: LDSB_I	ldsb	[%r18 + 0x0122], %r28
	.word 0xf40c8000  ! 123: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf20ce019  ! 125: LDUB_I	ldub	[%r19 + 0x0019], %r25
	.word 0xf2140000  ! 126: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf81da171  ! 129: LDD_I	ldd	[%r22 + 0x0171], %r28
	.word 0xb635e052  ! 130: ORN_I	orn 	%r23, 0x0052, %r27
	setx	data_start_1, %g1, %r22
	.word 0xfc1d0000  ! 132: LDD_R	ldd	[%r20 + %r0], %r30
	mov	0, %r12
	.word 0xa1930000  ! 134: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf64dc000  ! 136: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0x859460cb  ! 138: WRPR_TSTATE_I	wrpr	%r17, 0x00cb, %tstate
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6144000  ! 144: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf0040000  ! 145: LDUW_R	lduw	[%r16 + %r0], %r24
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1c0000  ! 148: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf65ca0fb  ! 153: LDX_I	ldx	[%r18 + 0x00fb], %r27
	.word 0xf64460c1  ! 155: LDSW_I	ldsw	[%r17 + 0x00c1], %r27
	.word 0xf8054000  ! 157: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xfe5c61df  ! 159: LDX_I	ldx	[%r17 + 0x01df], %r31
	.word 0xb4240000  ! 160: SUB_R	sub 	%r16, %r0, %r26
	.word 0xf2040000  ! 161: LDUW_R	lduw	[%r16 + %r0], %r25
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c8000  ! 167: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0x919521bd  ! 168: WRPR_PIL_I	wrpr	%r20, 0x01bd, %pil
	.word 0xf214a025  ! 169: LDUH_I	lduh	[%r18 + 0x0025], %r25
	.word 0xf005c000  ! 170: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xb335b001  ! 171: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xfb1c4000  ! 172: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf415a049  ! 173: LDUH_I	lduh	[%r22 + 0x0049], %r26
	mov	1, %r12
	.word 0x8f930000  ! 174: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb500000  ! 175: RDPR_TPC	<illegal instruction>
	.word 0xb735b001  ! 176: SRLX_I	srlx	%r22, 0x0001, %r27
	.word 0xfa55e007  ! 178: LDSH_I	ldsh	[%r23 + 0x0007], %r29
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44216c  ! 184: LDSW_I	ldsw	[%r16 + 0x016c], %r30
	.word 0xfe0561a3  ! 185: LDUW_I	lduw	[%r21 + 0x01a3], %r31
	.word 0xf2040000  ! 186: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf01d21ab  ! 187: LDD_I	ldd	[%r20 + 0x01ab], %r24
	.word 0xf51da17c  ! 188: LDDF_I	ldd	[%r22, 0x017c], %f26
	.word 0xf654202a  ! 195: LDSH_I	ldsh	[%r16 + 0x002a], %r27
	.word 0x8994e189  ! 196: WRPR_TICK_I	wrpr	%r19, 0x0189, %tick
	mov	0, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf31d4000  ! 203: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf51da05c  ! 206: LDDF_I	ldd	[%r22, 0x005c], %f26
	.word 0xf8044000  ! 209: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf45d8000  ! 213: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xb8bc0000  ! 216: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xfa144000  ! 217: LDUH_R	lduh	[%r17 + %r0], %r29
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d61bf  ! 225: LDX_I	ldx	[%r21 + 0x01bf], %r25
	.word 0xbf510000  ! 226: RDPR_TICK	<illegal instruction>
	.word 0xfe0c2198  ! 228: LDUB_I	ldub	[%r16 + 0x0198], %r31
	setx	0xad35b43500008ec7, %g1, %r10
	.word 0x819a8000  ! 229: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 234: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xbb480000  ! 239: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf11d2107  ! 240: LDDF_I	ldd	[%r20, 0x0107], %f24
	.word 0xfa5c6113  ! 241: LDX_I	ldx	[%r17 + 0x0113], %r29
	.word 0xbb352001  ! 243: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xf2148000  ! 246: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf61ce1a1  ! 247: LDD_I	ldd	[%r19 + 0x01a1], %r27
	.word 0xf60ce125  ! 249: LDUB_I	ldub	[%r19 + 0x0125], %r27
	.word 0xf645e17d  ! 250: LDSW_I	ldsw	[%r23 + 0x017d], %r27
	.word 0xb9540000  ! 253: RDPR_GL	rdpr	%-, %r28
	.word 0xf4144000  ! 254: LDUH_R	lduh	[%r17 + %r0], %r26
	setx	0x3a9ef0400007e93, %g1, %r10
	.word 0x819a8000  ! 259: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf65da008  ! 265: LDX_I	ldx	[%r22 + 0x0008], %r27
	.word 0xb550c000  ! 268: RDPR_TT	<illegal instruction>
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c4000  ! 273: LDX_R	ldx	[%r17 + %r0], %r24
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 278: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9195213c  ! 279: WRPR_PIL_I	wrpr	%r20, 0x013c, %pil
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d20ed  ! 281: LDX_I	ldx	[%r20 + 0x00ed], %r27
	.word 0xf44c8000  ! 283: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xfc0cc000  ! 286: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xb815c000  ! 289: OR_R	or 	%r23, %r0, %r28
	.word 0xfb1dc000  ! 290: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xf24c0000  ! 294: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe14e1d6  ! 298: LDUH_I	lduh	[%r19 + 0x01d6], %r31
	.word 0xfa554000  ! 301: LDSH_R	ldsh	[%r21 + %r0], %r29
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa144000  ! 304: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb6b52003  ! 306: ORNcc_I	orncc 	%r20, 0x0003, %r27
	.word 0xb9500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0xfc1de1b7  ! 310: LDD_I	ldd	[%r23 + 0x01b7], %r30
	.word 0x8394e1e9  ! 311: WRPR_TNPC_I	wrpr	%r19, 0x01e9, %tnpc
	.word 0xfc4c8000  ! 312: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xfd1dc000  ! 313: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf85dc000  ! 315: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xfe0c61ba  ! 317: LDUB_I	ldub	[%r17 + 0x01ba], %r31
	.word 0xf0046070  ! 320: LDUW_I	lduw	[%r17 + 0x0070], %r24
	.word 0xfa0c4000  ! 321: LDUB_R	ldub	[%r17 + %r0], %r29
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d8000  ! 323: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0x8194e0d5  ! 324: WRPR_TPC_I	wrpr	%r19, 0x00d5, %tpc
	.word 0xbf3ce001  ! 326: SRA_I	sra 	%r19, 0x0001, %r31
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 329: RDPR_TNPC	<illegal instruction>
	.word 0xfc55211e  ! 330: LDSH_I	ldsh	[%r20 + 0x011e], %r30
	.word 0x81942088  ! 332: WRPR_TPC_I	wrpr	%r16, 0x0088, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf91d4000  ! 334: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0x81946058  ! 336: WRPR_TPC_I	wrpr	%r17, 0x0058, %tpc
	.word 0xbf500000  ! 337: RDPR_TPC	<illegal instruction>
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d4000  ! 344: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf015208e  ! 345: LDUH_I	lduh	[%r20 + 0x008e], %r24
	.word 0xfc444000  ! 352: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfc05c000  ! 354: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xbd504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e096  ! 359: WRPR_PSTATE_I	wrpr	%r23, 0x0096, %pstate
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d0000  ! 363: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfe0c20a7  ! 364: LDUB_I	ldub	[%r16 + 0x00a7], %r31
	.word 0xf91c20f5  ! 367: LDDF_I	ldd	[%r16, 0x00f5], %f28
	mov	2, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb33dd000  ! 373: SRAX_R	srax	%r23, %r0, %r25
	.word 0x8595a073  ! 376: WRPR_TSTATE_I	wrpr	%r22, 0x0073, %tstate
	.word 0xf8458000  ! 379: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf0150000  ! 380: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0x8594619e  ! 382: WRPR_TSTATE_I	wrpr	%r17, 0x019e, %tstate
	.word 0xfe5d0000  ! 384: LDX_R	ldx	[%r20 + %r0], %r31
	setx	data_start_6, %g1, %r21
	.word 0x9194a10f  ! 388: WRPR_PIL_I	wrpr	%r18, 0x010f, %pil
	.word 0xfe5d61b0  ! 390: LDX_I	ldx	[%r21 + 0x01b0], %r31
	.word 0xbc45e0fb  ! 395: ADDC_I	addc 	%r23, 0x00fb, %r30
	.word 0x8195a0c8  ! 397: WRPR_TPC_I	wrpr	%r22, 0x00c8, %tpc
	.word 0xf0044000  ! 399: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0x89942080  ! 400: WRPR_TICK_I	wrpr	%r16, 0x0080, %tick
	.word 0x879521ee  ! 402: WRPR_TT_I	wrpr	%r20, 0x01ee, %tt
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7c0400  ! 412: MOVR_R	movre	%r16, %r0, %r31
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1dc000  ! 415: LDDF_R	ldd	[%r23, %r0], %f29
	setx	data_start_2, %g1, %r17
	.word 0x8595e191  ! 418: WRPR_TSTATE_I	wrpr	%r23, 0x0191, %tstate
	.word 0xfc558000  ! 419: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xf6044000  ! 421: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0x8d946174  ! 422: WRPR_PSTATE_I	wrpr	%r17, 0x0174, %pstate
	.word 0xf11cc000  ! 425: LDDF_R	ldd	[%r19, %r0], %f24
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 434: RDPR_TICK	<illegal instruction>
	.word 0xfe146175  ! 436: LDUH_I	lduh	[%r17 + 0x0175], %r31
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6542074  ! 441: LDSH_I	ldsh	[%r16 + 0x0074], %r27
	.word 0xfa4cc000  ! 448: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xb351c000  ! 449: RDPR_TL	<illegal instruction>
	.word 0xfa050000  ! 450: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf91d218e  ! 452: LDDF_I	ldd	[%r20, 0x018e], %f28
	.word 0xfc55e093  ! 455: LDSH_I	ldsh	[%r23 + 0x0093], %r30
	setx	data_start_5, %g1, %r18
	.word 0xfc0c4000  ! 459: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf91dc000  ! 461: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf84d0000  ! 467: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xf055a05a  ! 470: LDSH_I	ldsh	[%r22 + 0x005a], %r24
	.word 0xf24d8000  ! 481: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0x91946193  ! 482: WRPR_PIL_I	wrpr	%r17, 0x0193, %pil
	setx	0x6e4a7aea0000a80d, %g1, %r10
	.word 0x819a8000  ! 484: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0x8994a021  ! 488: WRPR_TICK_I	wrpr	%r18, 0x0021, %tick
	.word 0xb750c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xfa5d0000  ! 493: LDX_R	ldx	[%r20 + %r0], %r29
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 507: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xbd510000  ! 512: RDPR_TICK	<illegal instruction>
	.word 0xfb1de0ea  ! 514: LDDF_I	ldd	[%r23, 0x00ea], %f29
	.word 0x8d9521ef  ! 519: WRPR_PSTATE_I	wrpr	%r20, 0x01ef, %pstate
	setx	0x5cce0f730000aecc, %g1, %r10
	.word 0x819a8000  ! 522: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf01c8000  ! 524: LDD_R	ldd	[%r18 + %r0], %r24
	mov	0, %r12
	.word 0xa1930000  ! 525: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc950000  ! 537: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xfa144000  ! 538: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0x8995a1b1  ! 543: WRPR_TICK_I	wrpr	%r22, 0x01b1, %tick
	.word 0xb735a001  ! 546: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xf40d60b8  ! 547: LDUB_I	ldub	[%r21 + 0x00b8], %r26
	.word 0xf80d60e5  ! 551: LDUB_I	ldub	[%r21 + 0x00e5], %r28
	.word 0xfa5c0000  ! 552: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf65dc000  ! 553: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf254e19b  ! 559: LDSH_I	ldsh	[%r19 + 0x019b], %r25
	.word 0xff1d20f4  ! 560: LDDF_I	ldd	[%r20, 0x00f4], %f31
	.word 0xf0444000  ! 563: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf91c4000  ! 566: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0x89956138  ! 570: WRPR_TICK_I	wrpr	%r21, 0x0138, %tick
	.word 0xf81d4000  ! 571: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xb77ce401  ! 572: MOVR_I	movre	%r19, 0x1, %r27
	.word 0xf0150000  ! 578: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb9500000  ! 579: RDPR_TPC	<illegal instruction>
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba94218b  ! 585: ORcc_I	orcc 	%r16, 0x018b, %r29
	.word 0x8d94202b  ! 586: WRPR_PSTATE_I	wrpr	%r16, 0x002b, %pstate
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854a0d4  ! 590: LDSH_I	ldsh	[%r18 + 0x00d4], %r28
	.word 0xbd520000  ! 591: RDPR_PIL	<illegal instruction>
	.word 0xf2054000  ! 592: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf04c4000  ! 593: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf614e069  ! 596: LDUH_I	lduh	[%r19 + 0x0069], %r27
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb605610c  ! 601: ADD_I	add 	%r21, 0x010c, %r27
	.word 0xf44c8000  ! 602: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xfc5521c8  ! 603: LDSH_I	ldsh	[%r20 + 0x01c8], %r30
	.word 0xf44c0000  ! 604: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xfa5460d0  ! 605: LDSH_I	ldsh	[%r17 + 0x00d0], %r29
	.word 0xfc4d0000  ! 608: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf4148000  ! 609: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf20d8000  ! 612: LDUB_R	ldub	[%r22 + %r0], %r25
	setx	0xe0b715f4000048d4, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819561fe  ! 618: WRPR_TPC_I	wrpr	%r21, 0x01fe, %tpc
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13de001  ! 620: SRA_I	sra 	%r23, 0x0001, %r24
	.word 0x8994616b  ! 621: WRPR_TICK_I	wrpr	%r17, 0x016b, %tick
	.word 0xbf480000  ! 625: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x68b0f5920000681d, %g1, %r10
	.word 0x839a8000  ! 626: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879461ea  ! 631: WRPR_TT_I	wrpr	%r17, 0x01ea, %tt
	.word 0xf2054000  ! 637: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf45c4000  ! 639: LDX_R	ldx	[%r17 + %r0], %r26
	setx	0xcfeee32d00007bc9, %g1, %r10
	.word 0x819a8000  ! 642: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0x8d94e0d0  ! 648: WRPR_PSTATE_I	wrpr	%r19, 0x00d0, %pstate
	.word 0xb2b4c000  ! 650: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xfc154000  ! 654: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf4540000  ! 656: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf84d61de  ! 658: LDSB_I	ldsb	[%r21 + 0x01de], %r28
	.word 0xf244a152  ! 659: LDSW_I	ldsw	[%r18 + 0x0152], %r25
	.word 0x8d9421ec  ! 661: WRPR_PSTATE_I	wrpr	%r16, 0x01ec, %pstate
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 670: RDPR_PIL	<illegal instruction>
	.word 0xfc540000  ! 671: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf6058000  ! 672: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0x89946118  ! 675: WRPR_TICK_I	wrpr	%r17, 0x0118, %tick
	.word 0xfe050000  ! 677: LDUW_R	lduw	[%r20 + %r0], %r31
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4054000  ! 681: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xfc548000  ! 682: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf014a199  ! 685: LDUH_I	lduh	[%r18 + 0x0199], %r24
	.word 0x9195a015  ! 686: WRPR_PIL_I	wrpr	%r22, 0x0015, %pil
	.word 0xb5641800  ! 689: MOVcc_R	<illegal instruction>
	.word 0xf45421b1  ! 690: LDSH_I	ldsh	[%r16 + 0x01b1], %r26
	.word 0xb0a40000  ! 693: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0x919561f6  ! 694: WRPR_PIL_I	wrpr	%r21, 0x01f6, %pil
	mov	1, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7520000  ! 698: RDPR_PIL	<illegal instruction>
	.word 0xf84c4000  ! 701: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xb5510000  ! 704: RDPR_TICK	<illegal instruction>
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d2065  ! 707: LDX_I	ldx	[%r20 + 0x0065], %r26
	.word 0xbb51c000  ! 709: RDPR_TL	<illegal instruction>
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa544000  ! 714: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf605e197  ! 716: LDUW_I	lduw	[%r23 + 0x0197], %r27
	.word 0xf41d20ea  ! 717: LDD_I	ldd	[%r20 + 0x00ea], %r26
	.word 0xfa4cc000  ! 721: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf20d4000  ! 725: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xbf508000  ! 729: RDPR_TSTATE	<illegal instruction>
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1d2165  ! 734: LDDF_I	ldd	[%r20, 0x0165], %f29
	.word 0xfa05e11b  ! 737: LDUW_I	lduw	[%r23 + 0x011b], %r29
	.word 0xf8540000  ! 738: LDSH_R	ldsh	[%r16 + %r0], %r28
	setx	data_start_1, %g1, %r20
	.word 0xbf518000  ! 740: RDPR_PSTATE	<illegal instruction>
	.word 0xb62d2082  ! 741: ANDN_I	andn 	%r20, 0x0082, %r27
	.word 0xb9518000  ! 742: RDPR_PSTATE	<illegal instruction>
	.word 0xb951c000  ! 743: RDPR_TL	<illegal instruction>
	.word 0xfe54a0a2  ! 746: LDSH_I	ldsh	[%r18 + 0x00a2], %r31
	.word 0xf244e04d  ! 747: LDSW_I	ldsw	[%r19 + 0x004d], %r25
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95600c  ! 752: WRPR_PSTATE_I	wrpr	%r21, 0x000c, %pstate
	.word 0xf8450000  ! 754: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf6144000  ! 757: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf0458000  ! 760: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf614a05b  ! 763: LDUH_I	lduh	[%r18 + 0x005b], %r27
	.word 0xf2148000  ! 764: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf65520d6  ! 766: LDSH_I	ldsh	[%r20 + 0x00d6], %r27
	.word 0xf40d8000  ! 767: LDUB_R	ldub	[%r22 + %r0], %r26
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbf520000  ! 782: RDPR_PIL	<illegal instruction>
	.word 0xf6558000  ! 783: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf11cc000  ! 786: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xbd510000  ! 787: RDPR_TICK	<illegal instruction>
	.word 0xf05d2039  ! 790: LDX_I	ldx	[%r20 + 0x0039], %r24
	.word 0xf21d61cd  ! 791: LDD_I	ldd	[%r21 + 0x01cd], %r25
	.word 0x839560e1  ! 792: WRPR_TNPC_I	wrpr	%r21, 0x00e1, %tnpc
	mov	2, %r12
	.word 0xa1930000  ! 793: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb53d6001  ! 794: SRA_I	sra 	%r21, 0x0001, %r26
	.word 0x8794610a  ! 795: WRPR_TT_I	wrpr	%r17, 0x010a, %tt
	.word 0xb4a48000  ! 798: SUBcc_R	subcc 	%r18, %r0, %r26
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a0cb  ! 802: WRPR_TPC_I	wrpr	%r22, 0x00cb, %tpc
	.word 0xb1500000  ! 807: RDPR_TPC	<illegal instruction>
	.word 0xf45d206a  ! 808: LDX_I	ldx	[%r20 + 0x006a], %r26
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 811: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 817: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa0d2173  ! 818: LDUB_I	ldub	[%r20 + 0x0173], %r29
	.word 0xf40c0000  ! 822: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfe1ca082  ! 824: LDD_I	ldd	[%r18 + 0x0082], %r31
	.word 0xb551c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xf04da0ad  ! 827: LDSB_I	ldsb	[%r22 + 0x00ad], %r24
	.word 0xbd3c1000  ! 829: SRAX_R	srax	%r16, %r0, %r30
	.word 0xb7510000  ! 832: RDPR_TICK	<illegal instruction>
	.word 0x8395618f  ! 837: WRPR_TNPC_I	wrpr	%r21, 0x018f, %tnpc
	.word 0xba14a0c3  ! 840: OR_I	or 	%r18, 0x00c3, %r29
	.word 0xb88cc000  ! 841: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0x8995e131  ! 844: WRPR_TICK_I	wrpr	%r23, 0x0131, %tick
	.word 0xb01560d9  ! 849: OR_I	or 	%r21, 0x00d9, %r24
	.word 0xf11ca136  ! 851: LDDF_I	ldd	[%r18, 0x0136], %f24
	mov	2, %r12
	.word 0xa1930000  ! 852: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe050000  ! 853: LDUW_R	lduw	[%r20 + %r0], %r31
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8044000  ! 857: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xb0144000  ! 864: OR_R	or 	%r17, %r0, %r24
	.word 0xb1359000  ! 866: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf00d8000  ! 868: LDUB_R	ldub	[%r22 + %r0], %r24
	mov	0, %r12
	.word 0xa1930000  ! 869: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d95a093  ! 870: WRPR_PSTATE_I	wrpr	%r22, 0x0093, %pstate
	.word 0xbf480000  ! 871: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21d4000  ! 881: LDD_R	ldd	[%r21 + %r0], %r25
	.word 0xfa0cc000  ! 882: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf60c2055  ! 883: LDUB_I	ldub	[%r16 + 0x0055], %r27
	.word 0xf8548000  ! 884: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xbe34202c  ! 887: SUBC_I	orn 	%r16, 0x002c, %r31
	setx	data_start_4, %g1, %r19
	.word 0xf05421ba  ! 898: LDSH_I	ldsh	[%r16 + 0x01ba], %r24
	.word 0x8d94e032  ! 899: WRPR_PSTATE_I	wrpr	%r19, 0x0032, %pstate
	.word 0xb2a56127  ! 902: SUBcc_I	subcc 	%r21, 0x0127, %r25
	.word 0xf214c000  ! 903: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfa144000  ! 904: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb02de0e9  ! 908: ANDN_I	andn 	%r23, 0x00e9, %r24
	setx	data_start_4, %g1, %r22
	.word 0x8194a179  ! 912: WRPR_TPC_I	wrpr	%r18, 0x0179, %tpc
	.word 0xf31c202f  ! 913: LDDF_I	ldd	[%r16, 0x002f], %f25
	.word 0xfc54c000  ! 916: LDSH_R	ldsh	[%r19 + %r0], %r30
	setx	0xe46cbca500000c18, %g1, %r10
	.word 0x839a8000  ! 917: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4352108  ! 918: ORN_I	orn 	%r20, 0x0108, %r26
	setx	0x380f9390000068c5, %g1, %r10
	.word 0x839a8000  ! 922: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf51d8000  ! 931: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xb93d2001  ! 932: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xbb510000  ! 937: RDPR_TICK	<illegal instruction>
	.word 0xf45d6123  ! 939: LDX_I	ldx	[%r21 + 0x0123], %r26
	.word 0x8395e176  ! 942: WRPR_TNPC_I	wrpr	%r23, 0x0176, %tnpc
	.word 0xf25c0000  ! 944: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xbf51c000  ! 945: RDPR_TL	<illegal instruction>
	.word 0xbf500000  ! 946: RDPR_TPC	<illegal instruction>
	.word 0xf605c000  ! 948: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xfc5d61e8  ! 951: LDX_I	ldx	[%r21 + 0x01e8], %r30
	.word 0xf45cc000  ! 953: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xbc3ca1f8  ! 954: XNOR_I	xnor 	%r18, 0x01f8, %r30
	.word 0xb3500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0x9194a097  ! 957: WRPR_PIL_I	wrpr	%r18, 0x0097, %pil
	.word 0xf11ca134  ! 960: LDDF_I	ldd	[%r18, 0x0134], %f24
	.word 0xba14e0a3  ! 961: OR_I	or 	%r19, 0x00a3, %r29
	mov	0, %r12
	.word 0x8f930000  ! 963: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf31dc000  ! 964: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xfa1d20e4  ! 967: LDD_I	ldd	[%r20 + 0x00e4], %r29
	.word 0xf91c4000  ! 969: LDDF_R	ldd	[%r17, %r0], %f28
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4554000  ! 974: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xbf34c000  ! 977: SRL_R	srl 	%r19, %r0, %r31
	.word 0xfc5c8000  ! 978: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0x859521c2  ! 979: WRPR_TSTATE_I	wrpr	%r20, 0x01c2, %tstate
	.word 0x8195e0cd  ! 980: WRPR_TPC_I	wrpr	%r23, 0x00cd, %tpc
	.word 0xfe5d606c  ! 987: LDX_I	ldx	[%r21 + 0x006c], %r31
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e180  ! 989: WRPR_TT_I	wrpr	%r19, 0x0180, %tt
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81da0a3  ! 996: LDD_I	ldd	[%r22 + 0x00a3], %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x8d95a12d  ! 2: WRPR_PSTATE_I	wrpr	%r22, 0x012d, %pstate
	setx	0xae0a72d000006e47, %g1, %r10
	.word 0x839a8000  ! 6: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3540000  ! 7: RDPR_GL	<illegal instruction>
	.word 0xbba5c8c0  ! 9: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbfa44920  ! 10: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb1a5c860  ! 18: FADDq	dis not found

	.word 0x8d9521b8  ! 21: WRPR_PSTATE_I	wrpr	%r20, 0x01b8, %pstate
	.word 0xbba448a0  ! 26: FSUBs	fsubs	%f17, %f0, %f29
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e128  ! 30: WRPR_TSTATE_I	wrpr	%r19, 0x0128, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c21e6  ! 34: ANDcc_I	andcc 	%r16, 0x01e6, %r30
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 36: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbb480000  ! 38: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb0058000  ! 39: ADD_R	add 	%r22, %r0, %r24
	.word 0xb9a50940  ! 40: FMULd	fmuld	%f20, %f0, %f28
	.word 0xb5a9c820  ! 42: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0x9195e1e8  ! 44: WRPR_PIL_I	wrpr	%r23, 0x01e8, %pil
	.word 0xbf504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0xbd2c4000  ! 51: SLL_R	sll 	%r17, %r0, %r30
	.word 0xb734b001  ! 55: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xb7a90820  ! 56: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a58940  ! 59: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbeb520c6  ! 60: SUBCcc_I	orncc 	%r20, 0x00c6, %r31
	.word 0xbba48840  ! 62: FADDd	faddd	%f18, %f0, %f60
	.word 0xb7a5c8c0  ! 63: FSUBd	fsubd	%f54, %f0, %f58
	.word 0x819460fc  ! 64: WRPR_TPC_I	wrpr	%r17, 0x00fc, %tpc
	.word 0xb9359000  ! 65: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xb7ab4820  ! 66: FMOVCC	fmovs	%fcc1, %f0, %f27
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca44000  ! 69: SUBcc_R	subcc 	%r17, %r0, %r30
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 72: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a9c820  ! 75: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbda00520  ! 76: FSQRTs	fsqrt	
	.word 0xbba00560  ! 77: FSQRTq	fsqrt	
	.word 0xb1a4c860  ! 78: FADDq	dis not found

	.word 0xbba588a0  ! 82: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb3a00020  ! 83: FMOVs	fmovs	%f0, %f25
	mov	0, %r12
	.word 0xa1930000  ! 84: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00020  ! 85: FMOVs	fmovs	%f0, %f27
	.word 0x8194e1a4  ! 89: WRPR_TPC_I	wrpr	%r19, 0x01a4, %tpc
	.word 0xbf520000  ! 91: RDPR_PIL	<illegal instruction>
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 99: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa40820  ! 102: FADDs	fadds	%f16, %f0, %f31
	.word 0xbda94820  ! 103: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbda80820  ! 105: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb825e18b  ! 110: SUB_I	sub 	%r23, 0x018b, %r28
	setx	data_start_1, %g1, %r18
	.word 0xbda94820  ! 116: FMOVCS	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9ab8820  ! 120: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbe3521d1  ! 130: ORN_I	orn 	%r20, 0x01d1, %r31
	setx	data_start_3, %g1, %r20
	mov	0, %r12
	.word 0xa1930000  ! 134: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a54960  ! 135: FMULq	dis not found

	.word 0xb1a80420  ! 137: FMOVRZ	dis not found

	.word 0x8595a01f  ! 138: WRPR_TSTATE_I	wrpr	%r22, 0x001f, %tstate
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 147: FMOVRGEZ	dis not found

	.word 0xb1a548a0  ! 158: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbc24c000  ! 160: SUB_R	sub 	%r19, %r0, %r30
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 164: FMOVVC	fmovs	%fcc1, %f0, %f31
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919420d9  ! 168: WRPR_PIL_I	wrpr	%r16, 0x00d9, %pil
	.word 0xbf35f001  ! 171: SRLX_I	srlx	%r23, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 174: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9500000  ! 175: RDPR_TPC	<illegal instruction>
	.word 0xbf353001  ! 176: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xbda408e0  ! 177: FSUBq	dis not found

	.word 0xbba00560  ! 179: FSQRTq	fsqrt	
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 191: FMOVRLZ	dis not found

	.word 0xb9a4c8e0  ! 194: FSUBq	dis not found

	.word 0x8994e091  ! 196: WRPR_TICK_I	wrpr	%r19, 0x0091, %tick
	mov	0, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a54940  ! 200: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb5a80820  ! 212: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb4bc8000  ! 216: XNORcc_R	xnorcc 	%r18, %r0, %r26
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 223: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9510000  ! 226: RDPR_TICK	<illegal instruction>
	setx	0x24b12fb300002800, %g1, %r10
	.word 0x819a8000  ! 229: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a94820  ! 230: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c940  ! 235: FMULd	fmuld	%f54, %f0, %f58
	.word 0xb3480000  ! 239: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbf352001  ! 243: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xb5a00560  ! 248: FSQRTq	fsqrt	
	.word 0xb1540000  ! 253: RDPR_GL	<illegal instruction>
	.word 0xb7a00540  ! 256: FSQRTd	fsqrt	
	.word 0xbda44840  ! 257: FADDd	faddd	%f48, %f0, %f30
	.word 0xb1a448e0  ! 258: FSUBq	dis not found

	setx	0x970866650000bccf, %g1, %r10
	.word 0x819a8000  ! 259: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbba4c8a0  ! 263: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xbb50c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0xb3a00040  ! 271: FMOVd	fmovd	%f0, %f56
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a549c0  ! 274: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xbba5c940  ! 276: FMULd	fmuld	%f54, %f0, %f60
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 278: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x91946192  ! 279: WRPR_PIL_I	wrpr	%r17, 0x0192, %pil
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba509c0  ! 282: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb8140000  ! 289: OR_R	or 	%r16, %r0, %r28
	.word 0xb9a4c9e0  ! 299: FDIVq	dis not found

	.word 0xb9a5c860  ! 300: FADDq	dis not found

	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 305: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb0b42029  ! 306: ORNcc_I	orncc 	%r16, 0x0029, %r24
	.word 0xb5500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x8395217b  ! 311: WRPR_TNPC_I	wrpr	%r20, 0x017b, %tnpc
	.word 0xbda80820  ! 318: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a1ad  ! 324: WRPR_TPC_I	wrpr	%r18, 0x01ad, %tpc
	.word 0xbd3d2001  ! 326: SRA_I	sra 	%r20, 0x0001, %r30
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 329: RDPR_TNPC	<illegal instruction>
	.word 0xb1aa8820  ! 331: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0x819420f1  ! 332: WRPR_TPC_I	wrpr	%r16, 0x00f1, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x81952049  ! 336: WRPR_TPC_I	wrpr	%r20, 0x0049, %tpc
	.word 0xbf500000  ! 337: RDPR_TPC	<illegal instruction>
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548e0  ! 346: FSUBq	dis not found

	.word 0xb9ab8820  ! 351: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7ab4820  ! 353: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbb504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a065  ! 359: WRPR_PSTATE_I	wrpr	%r18, 0x0065, %pstate
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 361: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbfaa4820  ! 362: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a9c820  ! 369: FMOVVS	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a81820  ! 371: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbdaa8820  ! 372: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbd3c9000  ! 373: SRAX_R	srax	%r18, %r0, %r30
	.word 0x8595602c  ! 376: WRPR_TSTATE_I	wrpr	%r21, 0x002c, %tstate
	.word 0xb9a98820  ! 378: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0x859460a2  ! 382: WRPR_TSTATE_I	wrpr	%r17, 0x00a2, %tstate
	.word 0xbfa90820  ! 383: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	data_start_3, %g1, %r21
	.word 0x91946093  ! 388: WRPR_PIL_I	wrpr	%r17, 0x0093, %pil
	.word 0xb2446168  ! 395: ADDC_I	addc 	%r17, 0x0168, %r25
	.word 0x8195e193  ! 397: WRPR_TPC_I	wrpr	%r23, 0x0193, %tpc
	.word 0xbda81420  ! 398: FMOVRNZ	dis not found

	.word 0x8995a182  ! 400: WRPR_TICK_I	wrpr	%r22, 0x0182, %tick
	.word 0x8794a100  ! 402: WRPR_TT_I	wrpr	%r18, 0x0100, %tt
	.word 0xbbaa0820  ! 404: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7a9c820  ! 406: FMOVVS	fmovs	%fcc1, %f0, %f27
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d4400  ! 412: MOVR_R	movre	%r21, %r0, %r28
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0x859561c3  ! 418: WRPR_TSTATE_I	wrpr	%r21, 0x01c3, %tstate
	.word 0x8d952033  ! 422: WRPR_PSTATE_I	wrpr	%r20, 0x0033, %pstate
	.word 0xb3a408e0  ! 423: FSUBq	dis not found

	.word 0xb7a8c820  ! 424: FMOVL	fmovs	%fcc1, %f0, %f27
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 434: RDPR_TICK	<illegal instruction>
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9a0  ! 439: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xb1a00540  ! 444: FSQRTd	fsqrt	
	.word 0xb3a4c8e0  ! 445: FSUBq	dis not found

	.word 0xb9a40820  ! 447: FADDs	fadds	%f16, %f0, %f28
	.word 0xb551c000  ! 449: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xb7a509a0  ! 464: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xbba00540  ! 465: FSQRTd	fsqrt	
	.word 0xb3a5c840  ! 468: FADDd	faddd	%f54, %f0, %f56
	.word 0xb9a549c0  ! 476: FDIVd	fdivd	%f52, %f0, %f28
	.word 0x919560ff  ! 482: WRPR_PIL_I	wrpr	%r21, 0x00ff, %pil
	setx	0x705296bb0000389e, %g1, %r10
	.word 0x819a8000  ! 484: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0x8994212b  ! 488: WRPR_TICK_I	wrpr	%r16, 0x012b, %tick
	.word 0xb9ab4820  ! 489: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbb50c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xbba54840  ! 495: FADDd	faddd	%f52, %f0, %f60
	.word 0xbba00020  ! 496: FMOVs	fmovs	%f0, %f29
	.word 0xb3a50940  ! 498: FMULd	fmuld	%f20, %f0, %f56
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 509: FMOVRNZ	dis not found

	.word 0xb5510000  ! 512: RDPR_TICK	<illegal instruction>
	.word 0xb9a90820  ! 515: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa409a0  ! 518: FDIVs	fdivs	%f16, %f0, %f31
	.word 0x8d94204a  ! 519: WRPR_PSTATE_I	wrpr	%r16, 0x004a, %pstate
	setx	0xc9ad93c60000ce03, %g1, %r10
	.word 0x819a8000  ! 522: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a509c0  ! 523: FDIVd	fdivd	%f20, %f0, %f58
	mov	0, %r12
	.word 0xa1930000  ! 525: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba449c0  ! 526: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb7aa8820  ! 528: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a54860  ! 529: FADDq	dis not found

	.word 0xbfa4c820  ! 530: FADDs	fadds	%f19, %f0, %f31
	.word 0xb4958000  ! 537: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xb1a509a0  ! 539: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb1a80c20  ! 542: FMOVRLZ	dis not found

	.word 0x8995a0aa  ! 543: WRPR_TICK_I	wrpr	%r22, 0x00aa, %tick
	.word 0xbfa408e0  ! 544: FSUBq	dis not found

	.word 0xbfa90820  ! 545: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbd34e001  ! 546: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xb9a4c960  ! 555: FMULq	dis not found

	.word 0xbba4c9a0  ! 561: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xb7a4c940  ! 568: FMULd	fmuld	%f50, %f0, %f58
	.word 0x8995e1a6  ! 570: WRPR_TICK_I	wrpr	%r23, 0x01a6, %tick
	.word 0xb57ce401  ! 572: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb5a80820  ! 577: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbb500000  ! 579: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 582: FSQRTs	fsqrt	
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4946163  ! 585: ORcc_I	orcc 	%r17, 0x0163, %r26
	.word 0x8d952020  ! 586: WRPR_PSTATE_I	wrpr	%r20, 0x0020, %pstate
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 588: FMOVRGEZ	dis not found

	.word 0xb3a5c9a0  ! 589: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbd520000  ! 591: RDPR_PIL	<illegal instruction>
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba046086  ! 601: ADD_I	add 	%r17, 0x0086, %r29
	.word 0xbba00020  ! 611: FMOVs	fmovs	%f0, %f29
	setx	0xac1fb3c700009c82, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 617: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8195e092  ! 618: WRPR_TPC_I	wrpr	%r23, 0x0092, %tpc
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73de001  ! 620: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0x899561c6  ! 621: WRPR_TICK_I	wrpr	%r21, 0x01c6, %tick
	.word 0xb7a4c8a0  ! 624: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb7480000  ! 625: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x5bd6769800006e44, %g1, %r10
	.word 0x839a8000  ! 626: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda5c960  ! 627: FMULq	dis not found

	.word 0xbba84820  ! 630: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x879560a3  ! 631: WRPR_TT_I	wrpr	%r21, 0x00a3, %tt
	.word 0xb9aa0820  ! 633: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba589a0  ! 634: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbba00560  ! 636: FSQRTq	fsqrt	
	setx	0xfffbd6000008dd5, %g1, %r10
	.word 0x819a8000  ! 642: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3aac820  ! 646: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0x8d952059  ! 648: WRPR_PSTATE_I	wrpr	%r20, 0x0059, %pstate
	.word 0xb3a509a0  ! 649: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb8b40000  ! 650: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xb1a4c940  ! 651: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb5a589e0  ! 655: FDIVq	dis not found

	.word 0x8d952126  ! 661: WRPR_PSTATE_I	wrpr	%r20, 0x0126, %pstate
	.word 0xb3a00540  ! 663: FSQRTd	fsqrt	
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c960  ! 667: FMULq	dis not found

	.word 0xbd520000  ! 670: RDPR_PIL	<illegal instruction>
	.word 0x8995e08e  ! 675: WRPR_TICK_I	wrpr	%r23, 0x008e, %tick
	.word 0xbfa54940  ! 679: FMULd	fmuld	%f52, %f0, %f62
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50840  ! 683: FADDd	faddd	%f20, %f0, %f28
	.word 0x9195e10b  ! 686: WRPR_PIL_I	wrpr	%r23, 0x010b, %pil
	.word 0xbfaa4820  ! 688: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1641800  ! 689: MOVcc_R	<illegal instruction>
	.word 0xb9a588e0  ! 692: FSUBq	dis not found

	.word 0xb4a50000  ! 693: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0x9195a114  ! 694: WRPR_PIL_I	wrpr	%r22, 0x0114, %pil
	.word 0xb5a90820  ! 695: FMOVLEU	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3520000  ! 698: RDPR_PIL	<illegal instruction>
	.word 0xb3a589c0  ! 699: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb1510000  ! 704: RDPR_TICK	<illegal instruction>
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 709: RDPR_TL	<illegal instruction>
	.word 0xb5ab8820  ! 710: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a9c820  ! 711: FMOVVS	fmovs	%fcc1, %f0, %f28
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48820  ! 713: FADDs	fadds	%f18, %f0, %f31
	.word 0xb3aa8820  ! 715: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a54840  ! 723: FADDd	faddd	%f52, %f0, %f26
	.word 0xb7a548c0  ! 727: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb1a5c860  ! 728: FADDq	dis not found

	.word 0xb5508000  ! 729: RDPR_TSTATE	<illegal instruction>
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 736: FMOVGE	fmovs	%fcc1, %f0, %f31
	setx	data_start_1, %g1, %r23
	.word 0xb1518000  ! 740: RDPR_PSTATE	<illegal instruction>
	.word 0xb02ca0aa  ! 741: ANDN_I	andn 	%r18, 0x00aa, %r24
	.word 0xbb518000  ! 742: RDPR_PSTATE	<illegal instruction>
	.word 0xb151c000  ! 743: RDPR_TL	<illegal instruction>
	.word 0xbba00560  ! 744: FSQRTq	fsqrt	
	.word 0xb9a80820  ! 745: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00540  ! 748: FSQRTd	fsqrt	
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 750: FSQRTs	fsqrt	
	.word 0xb3a00520  ! 751: FSQRTs	fsqrt	
	.word 0x8d9560d8  ! 752: WRPR_PSTATE_I	wrpr	%r21, 0x00d8, %pstate
	.word 0xb1a5c8e0  ! 761: FSUBq	dis not found

	.word 0xbda81420  ! 762: FMOVRNZ	dis not found

	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb3a489a0  ! 772: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb5a81420  ! 773: FMOVRNZ	dis not found

	.word 0xbba8c820  ! 775: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda508e0  ! 777: FSUBq	dis not found

	.word 0xb7520000  ! 782: RDPR_PIL	<illegal instruction>
	.word 0xb5510000  ! 787: RDPR_TICK	<illegal instruction>
	.word 0x8394e138  ! 792: WRPR_TNPC_I	wrpr	%r19, 0x0138, %tnpc
	mov	0, %r12
	.word 0xa1930000  ! 793: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb53d2001  ! 794: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0x8795a045  ! 795: WRPR_TT_I	wrpr	%r22, 0x0045, %tt
	.word 0xbbaac820  ! 796: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda48860  ! 797: FADDq	dis not found

	.word 0xb4a40000  ! 798: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xbbabc820  ! 799: FMOVVC	fmovs	%fcc1, %f0, %f29
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194a02f  ! 802: WRPR_TPC_I	wrpr	%r18, 0x002f, %tpc
	.word 0xbba98820  ! 803: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbba80820  ! 804: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3a4c860  ! 806: FADDq	dis not found

	.word 0xbb500000  ! 807: RDPR_TPC	<illegal instruction>
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 811: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00020  ! 816: FMOVs	fmovs	%f0, %f25
	mov	1, %r12
	.word 0xa1930000  ! 817: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda4c920  ! 819: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb1aa0820  ! 825: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb351c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xb9a5c920  ! 828: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb33d1000  ! 829: SRAX_R	srax	%r20, %r0, %r25
	.word 0xbf510000  ! 832: RDPR_TICK	<illegal instruction>
	.word 0xb3a00540  ! 833: FSQRTd	fsqrt	
	.word 0x8394e137  ! 837: WRPR_TNPC_I	wrpr	%r19, 0x0137, %tnpc
	.word 0xbda9c820  ! 839: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb615a10c  ! 840: OR_I	or 	%r22, 0x010c, %r27
	.word 0xb28cc000  ! 841: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xbdaa4820  ! 843: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x89956038  ! 844: WRPR_TICK_I	wrpr	%r21, 0x0038, %tick
	.word 0xb5aa0820  ! 845: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbbaa4820  ! 846: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb4146070  ! 849: OR_I	or 	%r17, 0x0070, %r26
	mov	0, %r12
	.word 0xa1930000  ! 852: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548c0  ! 856: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb1a589a0  ! 858: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xbba81820  ! 862: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xba154000  ! 864: OR_R	or 	%r21, %r0, %r29
	.word 0xbb355000  ! 866: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xb7a00540  ! 867: FSQRTd	fsqrt	
	mov	0, %r12
	.word 0xa1930000  ! 869: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d94a16a  ! 870: WRPR_PSTATE_I	wrpr	%r18, 0x016a, %pstate
	.word 0xb7480000  ! 871: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7a84820  ! 874: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00560  ! 875: FSQRTq	fsqrt	
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 885: FMOVRGEZ	dis not found

	.word 0xb63421ed  ! 887: SUBC_I	orn 	%r16, 0x01ed, %r27
	setx	data_start_2, %g1, %r20
	.word 0xb1a80420  ! 890: FMOVRZ	dis not found

	.word 0xb1a00520  ! 895: FSQRTs	fsqrt	
	.word 0x8d95200b  ! 899: WRPR_PSTATE_I	wrpr	%r20, 0x000b, %pstate
	.word 0xb5a40860  ! 900: FADDq	dis not found

	.word 0xb4a5a0ae  ! 902: SUBcc_I	subcc 	%r22, 0x00ae, %r26
	.word 0xbfa5c940  ! 905: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb9a4c820  ! 907: FADDs	fadds	%f19, %f0, %f28
	.word 0xb02da04e  ! 908: ANDN_I	andn 	%r22, 0x004e, %r24
	setx	data_start_3, %g1, %r18
	.word 0x8194a1c5  ! 912: WRPR_TPC_I	wrpr	%r18, 0x01c5, %tpc
	.word 0xbda81c20  ! 915: FMOVRGEZ	dis not found

	setx	0xc9a134280000fdcc, %g1, %r10
	.word 0x839a8000  ! 917: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb034a016  ! 918: ORN_I	orn 	%r18, 0x0016, %r24
	.word 0xb3a4c820  ! 919: FADDs	fadds	%f19, %f0, %f25
	.word 0xb7ab8820  ! 920: FMOVPOS	fmovs	%fcc1, %f0, %f27
	setx	0x3f72859d0000bf9c, %g1, %r10
	.word 0x839a8000  ! 922: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a81820  ! 925: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3aac820  ! 927: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbf3c6001  ! 932: SRA_I	sra 	%r17, 0x0001, %r31
	.word 0xb3a80820  ! 935: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7510000  ! 937: RDPR_TICK	<illegal instruction>
	.word 0xb3a00040  ! 941: FMOVd	fmovd	%f0, %f56
	.word 0x8395e143  ! 942: WRPR_TNPC_I	wrpr	%r23, 0x0143, %tnpc
	.word 0xbd51c000  ! 945: RDPR_TL	<illegal instruction>
	.word 0xb7500000  ! 946: RDPR_TPC	<illegal instruction>
	.word 0xb63de0fc  ! 954: XNOR_I	xnor 	%r23, 0x00fc, %r27
	.word 0xb1500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0xb1a4c940  ! 956: FMULd	fmuld	%f50, %f0, %f24
	.word 0x9195e15d  ! 957: WRPR_PIL_I	wrpr	%r23, 0x015d, %pil
	.word 0xb214a0ab  ! 961: OR_I	or 	%r18, 0x00ab, %r25
	mov	2, %r12
	.word 0x8f930000  ! 963: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa589c0  ! 968: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb9ab8820  ! 970: FMOVPOS	fmovs	%fcc1, %f0, %f28
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 975: FSQRTs	fsqrt	
	.word 0xbba58920  ! 976: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb934c000  ! 977: SRL_R	srl 	%r19, %r0, %r28
	.word 0x8594602e  ! 979: WRPR_TSTATE_I	wrpr	%r17, 0x002e, %tstate
	.word 0x8194a021  ! 980: WRPR_TPC_I	wrpr	%r18, 0x0021, %tpc
	.word 0xb5a408a0  ! 982: FSUBs	fsubs	%f16, %f0, %f26
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879461e9  ! 989: WRPR_TT_I	wrpr	%r17, 0x01e9, %tt
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9c0  ! 993: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb9a94820  ! 995: FMOVCS	fmovs	%fcc1, %f0, %f28

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

	.xword	0xab53ec5ddcdf1243
	.xword	0xa1cb8cabc3aa0f26
	.xword	0x96621fa58c82c191
	.xword	0x6f521b2fbce1b806
	.xword	0x2be9bd5af1b928b5
	.xword	0x7ea4720c06c26774
	.xword	0xa8d964693471e150
	.xword	0x3f3366e078e836c5
	.xword	0xfe1ceeba4140109a
	.xword	0xe60a8a54a4db50b9
	.xword	0x2b193584e1ade91a
	.xword	0x42f38384bce29b43
	.xword	0x681fd21f43c695f8
	.xword	0xe2f960d39fb78ed2
	.xword	0xad3c629907322bd2
	.xword	0xcc49a713803cfae3
	.xword	0x666720968da68cd1
	.xword	0x7cdb68bcd3c7ef77
	.xword	0xcecf061a65a629ac
	.xword	0xb9d7470a4c952e50
	.xword	0x0fccb3c89c307dc1
	.xword	0x526b1db1838ba42c
	.xword	0x9ea35f6eaa3b1642
	.xword	0x721aa74aeae242a6
	.xword	0xb66ed1aa9b0f57a2
	.xword	0x0ad6d2f1d5214fbe
	.xword	0x5164a7772556f22d
	.xword	0x27b6b5eab4d16dd0
	.xword	0xbc9127ffba27dc32
	.xword	0x75cf059d3d60d833
	.xword	0x244cb15d0094514f
	.xword	0x21167f56c5373e3c
	.xword	0xcc67d09b18fffbaf
	.xword	0xa04d14c73078aeb6
	.xword	0xc64714505b55b1c0
	.xword	0xb6891280987317fb
	.xword	0xb6ffc17cdd00b5e4
	.xword	0x9161e137040da3b5
	.xword	0x76aa982cfbe53629
	.xword	0x4d5052802b829195
	.xword	0xcdc254ad45ece1ca
	.xword	0x0b9aed759f044729
	.xword	0x85e060b9ac0e148f
	.xword	0xea76a8a6a2df4ed0
	.xword	0xb2bb41a0d9b86a8c
	.xword	0x3f7b724f14d2a37f
	.xword	0x54d3ea8fcc9a4eff
	.xword	0x82072d2755c86f54
	.xword	0xe1d4c492a0a4a65a
	.xword	0x4df0cf50046273f2
	.xword	0x6f20f78a56741f28
	.xword	0xc276a9aaab008d44
	.xword	0xa7bdff5fedbf6d22
	.xword	0x1fc649cd81193f9d
	.xword	0x94b3ef065b218dde
	.xword	0x0cb17c1ea7ea8dea
	.xword	0xf6473cda229d6096
	.xword	0x4b417e4de2604caa
	.xword	0x6ac90c348eaa2535
	.xword	0x50d902b7f89075a7
	.xword	0xb746eea20bdb16bd
	.xword	0x42382f9c9557de8b
	.xword	0x6cff69c88108b795
	.xword	0xe008bf898a539f25
	.xword	0x2cb851b42198c1c8
	.xword	0xaa87e5b1eddfd7df
	.xword	0x54c77fcddedec6be
	.xword	0x5476ece9299f22c1
	.xword	0xd78467bd8b2d21e4
	.xword	0xdd1849954f80eab8
	.xword	0xf4613982e8974a00
	.xword	0x445f09c3239a9c9e
	.xword	0x479663fa7d118897
	.xword	0x8024e7b3c8dc6dd6
	.xword	0x4d56878ae2cdfbae
	.xword	0x1496d96566516a02
	.xword	0x20da29ae54730d02
	.xword	0xf9d38f5498105849
	.xword	0x307cdbd6a9da3933
	.xword	0xa026294dfaed6c03
	.xword	0xefe71213a2d96786
	.xword	0xd0ac84f18bf3e731
	.xword	0xa48cb264ade6f7ab
	.xword	0x18ced90db18f00d9
	.xword	0xf691f00858700444
	.xword	0x65e2d508cc09a3f5
	.xword	0xdf5383e1784cb2d4
	.xword	0x91a4c46466754d40
	.xword	0xb3295300900beebd
	.xword	0xff16351248ca93f6
	.xword	0x28f35a99c537bae7
	.xword	0xc6db826b2c33af28
	.xword	0xf7d2fed8f4a30957
	.xword	0x6e684c4d2881e6e2
	.xword	0xea7f79be2a82b1e2
	.xword	0xe98f0f89620668ab
	.xword	0xc2862b9f07ba832a
	.xword	0xd3113c8d1ddc9b43
	.xword	0x8fcdaffa0117e91f
	.xword	0xb9333d3a17f9d200
	.xword	0xf66487907fd49dca
	.xword	0x6fbf614ef9f50414
	.xword	0x2d6b83fd7dc28813
	.xword	0x49633f127d0a1399
	.xword	0xa666fc6890a080ff
	.xword	0x2ca87b3900fdd885
	.xword	0xf83b67b4f384dc56
	.xword	0x89bb2bb0995d89d3
	.xword	0x0e9fa05bd9eaea92
	.xword	0xe3af85f93f7f906e
	.xword	0xb27862151230490f
	.xword	0xc50e2c796550ff85
	.xword	0x8beda43576de2cc8
	.xword	0xd8fa855e696b757c
	.xword	0xce64e07bf26b8910
	.xword	0xd4ef6888d65d7a76
	.xword	0x95fab233ce37c14f
	.xword	0xe6151db196494a40
	.xword	0x95ffc8c238847e83
	.xword	0x0bbfbb4024d043e2
	.xword	0x6878d037dfa02eaf
	.xword	0x38d41895ac6872b1
	.xword	0xf2fa98e46087a4ff
	.xword	0x535f9968f08a3cf1
	.xword	0xc00026515ad2a7ac
	.xword	0x938c7b199e2b548e
	.xword	0xa263764dba242afb
	.xword	0xb56e2a0cf44e8faf
	.xword	0xa9a238658a323348
	.xword	0x61dbcbd0a650ade1
	.xword	0xf97d39c664382532
	.xword	0x0ec9627f047e8539
	.xword	0xc552fc3f80cab3d5
	.xword	0x76515292071a27f6
	.xword	0x3aa2900753e10939
	.xword	0x0d1a2a2e37dd6b1d
	.xword	0x56fb80ebbdfd725a
	.xword	0xff35a0a1caa117be
	.xword	0x14f52c584047157b
	.xword	0x4847eb85bc54ab6d
	.xword	0x397fe35d1078e49f
	.xword	0xddfe6e60edfc475e
	.xword	0x8175f08890bcbe60
	.xword	0xad58c1008d61a982
	.xword	0xa769fdc02cb54642
	.xword	0x11ea5190c88a0b47
	.xword	0x1d5c5bbe67155795
	.xword	0x9875f6233eedd9a9
	.xword	0xb0900a8c9e528683
	.xword	0x1e86b3f62bd872c7
	.xword	0x9ae7db1ef9a5c70b
	.xword	0x9635f62f178d2521
	.xword	0x1781d5fbafb45e95
	.xword	0x88a0a5f6016b822e
	.xword	0x66b83edb95673af0
	.xword	0xcc72c5ce610a978c
	.xword	0x09d35a8036cf19e4
	.xword	0xd967fab858ebefe6
	.xword	0xf2dab627ac14f52f
	.xword	0xdc6a2fe516638e09
	.xword	0x31be7744c6a4e599
	.xword	0xd6abfcba2d5854d2
	.xword	0x245a2dba0ed6c85e
	.xword	0x1fe30154805640b3
	.xword	0x1f0799bde5647e9b
	.xword	0xbd0e81699e5cd203
	.xword	0xe1ac6f4833b7e51c
	.xword	0xce64d91c56e970a1
	.xword	0x100bc5b86998c300
	.xword	0xcc1bb13c29b22ba6
	.xword	0x0bcdf340a05dfc10
	.xword	0x2000840c972928d9
	.xword	0xd7f9899b222aed53
	.xword	0x9be10e196c27271b
	.xword	0x32a4f951df0ab99e
	.xword	0x7dc73250977e30a5
	.xword	0xd90945988660e0f1
	.xword	0x4964c42a2b5ab6c5
	.xword	0xddc4b74a58938a93
	.xword	0xecf47e43555aa2fc
	.xword	0xd16aa86607a99151
	.xword	0x662d44e2c76eb9fb
	.xword	0xaa0841c8a89e5a0d
	.xword	0x2923380e1623a90b
	.xword	0x4ab9f4b33e4fd2d6
	.xword	0x0318ad3ebf75a0f1
	.xword	0x51a8baa8250d0c76
	.xword	0x6c1169fa1d73ddff
	.xword	0xe6e2cc48c93493f6
	.xword	0x0de0d4c3912130f6
	.xword	0xea387f4dd1bfa062
	.xword	0xf893a00e9ad434bf
	.xword	0xfc03f3132e6307cd
	.xword	0x92c86630a5765c7f
	.xword	0xea4dfecbc5a1aa26
	.xword	0x9178548a9033556e
	.xword	0x13b12984f02f804b
	.xword	0xc955c39dd8da3982
	.xword	0x4b6908dae39d06fb
	.xword	0x7e306cfa9ab3b796
	.xword	0xebdeca3c2c2e06c5
	.xword	0x374b04eb8eb98dad
	.xword	0x24fd95c05aeeb020
	.xword	0x17f0b245344a978b
	.xword	0x60951c47eb2b0ba1
	.xword	0x8fb9d68d55126ddf
	.xword	0x1a3d5fbcc92b4e67
	.xword	0x9be1a7aee1677b17
	.xword	0x98accd7c05299555
	.xword	0xe165c738b80272e9
	.xword	0x0b5dcc3cd0e231d4
	.xword	0x69e65b645be3a30c
	.xword	0x2b37da741faad63d
	.xword	0x892169bde756bed9
	.xword	0xbf1ab81585c3bd51
	.xword	0xedd47fcfc2c93b18
	.xword	0x2adaacd66626e1be
	.xword	0x1772c43f733ec241
	.xword	0xbfb6677d259939bc
	.xword	0x121d97a9dc25e24a
	.xword	0x540193b95424739e
	.xword	0x127a6de69f9d620a
	.xword	0x8b158a75250e76a5
	.xword	0xcb5f6817d587ba88
	.xword	0xbcfd1ae385e0e312
	.xword	0x9c62846cc4c0d2fd
	.xword	0x8f2cec754c0c6407
	.xword	0x02615a8452489beb
	.xword	0x98bc8379ec332e04
	.xword	0x54a0df84097ea132
	.xword	0x61bae7d6ed6590e7
	.xword	0x075f5ee2b2721fff
	.xword	0xd334d94b3c272ecb
	.xword	0xd8654027616e8f70
	.xword	0x3162156a2751b039
	.xword	0x83ad82cd9ba1b79d
	.xword	0x02417b45d3ebc549
	.xword	0xcdd22d964fdad35d
	.xword	0x7cd019eb53b1d2c1
	.xword	0xa3046b479962dc56
	.xword	0x49125b25dfdaaf21
	.xword	0x371c252321a7512c
	.xword	0x5c8c979ebff7ada7
	.xword	0xbdc128ade0e91e20
	.xword	0x8aad4101c27af611
	.xword	0xa199f1e8858575f5
	.xword	0xc852b60f025b4165
	.xword	0x4c96c777637c7c48
	.xword	0x2f17c906e6d8fa31
	.xword	0xa26b45da18dac9e4
	.xword	0xcc46d4f8ad864b33
	.xword	0x02c7c69f4c18aeaf
	.xword	0x71505700c8fd0c07
	.xword	0xd0e3e19fbd332ce1
	.xword	0x181e5937c9849dc7
	.xword	0x8ffb6d8c1aeaa835
	.align 0x2000
	.data
data_start_1:

	.xword	0x595133871a2decf0
	.xword	0xbf9d2d4b23062da8
	.xword	0xdf9c54e84c65e90c
	.xword	0x6ec8ef245d4480fd
	.xword	0xb8073a159bbd57d7
	.xword	0xa0d56d7693cfeb62
	.xword	0xff483976bf805106
	.xword	0x09785a0e8a9922ab
	.xword	0x0f6d4ae92c157f07
	.xword	0x1b45869c08efdbff
	.xword	0x9868b438729c6279
	.xword	0xdcef6f3fba2bf092
	.xword	0xd60e7c2730392623
	.xword	0xf03eda77309258c2
	.xword	0x84b09a047e9d8f93
	.xword	0x4dba13ab1c5081a5
	.xword	0xfe81e644119b4cff
	.xword	0xf5986a8dfcaaa99c
	.xword	0x756092280d1d03f5
	.xword	0x13b92913214bb3d0
	.xword	0xaeceb3cf9f92d968
	.xword	0x826692ebc6e75a9d
	.xword	0x76dd5d31ae310d95
	.xword	0xe018833a7bfaae30
	.xword	0x0ab2bb03978cfa84
	.xword	0x19123c14f533676d
	.xword	0x7c5f0bc7ebad46b0
	.xword	0xac4c39fa05378761
	.xword	0xfb63a597902b15d7
	.xword	0x1af1773fe3e7498f
	.xword	0x7b58c9961ca1d805
	.xword	0x10f639904d5fc23d
	.xword	0x43447a8ae4703117
	.xword	0xfb11d4531f1515e8
	.xword	0xe934e85cedbdaa14
	.xword	0x9c586ccf0e356ba0
	.xword	0x9eed4970a7032eef
	.xword	0xf8966b4757a18939
	.xword	0xb8e51e9161d6aa54
	.xword	0xaf9962c5a2f490e3
	.xword	0xc90c2f8a95098a9d
	.xword	0x49939f370fc13994
	.xword	0xceed9a3ec887e4e5
	.xword	0x8b0d5cc23de27e49
	.xword	0xe4d3244a71fee671
	.xword	0x502796b2de36af0d
	.xword	0xf307b5a707de37a2
	.xword	0x8ed8d52b8f173aba
	.xword	0x7bdd3115155f7f48
	.xword	0x0e9cf085a47a5b9f
	.xword	0x498640efc0c2a839
	.xword	0x443c1cf46d37128c
	.xword	0x2eaed7e033a7dc42
	.xword	0x294a220437da1a66
	.xword	0x1f98598d56dcdfd2
	.xword	0xb539d603dc16b404
	.xword	0x190f6e248c39f98d
	.xword	0x673c9168f77509c0
	.xword	0xebf5263db8d3afd4
	.xword	0xf6f307e2f62bb5cf
	.xword	0x9ab64696d06f49ad
	.xword	0xecf89a0f1172bad7
	.xword	0xe615c90e863532a2
	.xword	0xc50d840ecd0d50e7
	.xword	0x80206bd9ea4a5576
	.xword	0xafb852679e5fdc50
	.xword	0xc9f8ba8d4855bcab
	.xword	0xd246601166c65412
	.xword	0xc039d466f80bd702
	.xword	0x35260f75551d6067
	.xword	0x2be693bd0ffcda3c
	.xword	0xdc8209781c9389aa
	.xword	0xa6fcef6ef38b12fe
	.xword	0xf4f54993492ee9cb
	.xword	0x1a041889c4669dc3
	.xword	0xaee686ee91dee5dc
	.xword	0x0fb5702e826eb8f5
	.xword	0x02e372959c86bb76
	.xword	0x5222d16018eb1136
	.xword	0x394d1f06d81e20eb
	.xword	0x212e304d90154549
	.xword	0x93d786a37796f4d7
	.xword	0xb9f8409dedae1482
	.xword	0x27e279af2a58d25e
	.xword	0x217798c4a4234c02
	.xword	0x02396324600ea44e
	.xword	0x8980666952be4b7b
	.xword	0x599574f6b87badbb
	.xword	0x8dc13c66d782f2d6
	.xword	0xadc487690a47175f
	.xword	0xf53b620c3a1456ed
	.xword	0x5467bbe08c0878ef
	.xword	0x840283c3b88ad9b2
	.xword	0xa842ad2f91ca9ceb
	.xword	0x46c3d4fddbea9583
	.xword	0x2978170d33b3ca14
	.xword	0x78a7042f4b88759e
	.xword	0x4dd867a068870368
	.xword	0x9baea889797f77be
	.xword	0x484939593ab2461e
	.xword	0xadfb388ff5bcc61b
	.xword	0xeb715c2831bf4129
	.xword	0x954da07ec6e9d5a0
	.xword	0x2dda02f698655757
	.xword	0x7518d456536b4ce6
	.xword	0xa52fe58bb225f0e9
	.xword	0x47c743e0aa1cfb9d
	.xword	0x24eddc9c146fed9c
	.xword	0x99fbe9f94613e149
	.xword	0xe2bbbdc95b96e7d3
	.xword	0xab70e44028781f6f
	.xword	0xe8dfe574c7278179
	.xword	0xb2ef571e5332ce35
	.xword	0x69769db89210d291
	.xword	0xb728a6ebf4f96db2
	.xword	0x2dbb68370fb46520
	.xword	0x0c1035deceebd1c6
	.xword	0xced57eb789c6133d
	.xword	0x96fdfe1c31201063
	.xword	0x559d26643de98f9e
	.xword	0x1a0308bab328b300
	.xword	0xc5e4435d3cbd7cc9
	.xword	0xc5eca8e7fcfb0207
	.xword	0xc479dd97a6e8654f
	.xword	0x2169c87f83d8657d
	.xword	0x4daf12c5e2bd4119
	.xword	0xa072fae841808779
	.xword	0x6c6eb8f253b8e0ed
	.xword	0xd89038a02c76274f
	.xword	0x58757088174832dc
	.xword	0x00840f449076eda4
	.xword	0x4d070e787d673b07
	.xword	0xbc9d7c80941b5645
	.xword	0xb674cca6442ed2a9
	.xword	0x8e4a02189a96b12b
	.xword	0xa7594c1fd23c198d
	.xword	0xacd929ca18ef5bca
	.xword	0x0d3adaec406a68b4
	.xword	0x1b42bbe46c8f8d55
	.xword	0x62573ea86daa07dd
	.xword	0xb691108dbfcc8f6b
	.xword	0x004897e29db2ea52
	.xword	0xbbd238ca10408864
	.xword	0xa75286d399592778
	.xword	0x79339e2d2dd2c644
	.xword	0x95bed1242f804952
	.xword	0x69fad56a46791440
	.xword	0x3d6b3a383a8223a8
	.xword	0xcdfedc470d2d04b3
	.xword	0x080ba8f996ed35d6
	.xword	0xa21fc90142263b76
	.xword	0x2f332b579b7f024a
	.xword	0xb49827f6b53e7772
	.xword	0x8b872cd2198eb7b4
	.xword	0xa7287255103726e6
	.xword	0xde1e5f9c22dd88fd
	.xword	0x06bc2caa070a0f22
	.xword	0x8273819e788af1f3
	.xword	0xc2db454a16845e4b
	.xword	0xb59842f694671e21
	.xword	0x69c5676cb3c2e1cc
	.xword	0x35500824637e4d55
	.xword	0x0d56ed0d03bf510a
	.xword	0x8ddd2cfbd5b9db24
	.xword	0x833e2780550b6b5f
	.xword	0xc83eaf07f267aeb4
	.xword	0xace21f58e40f0e94
	.xword	0x1babaa59ea4af785
	.xword	0x6537a4698643bca0
	.xword	0x91b399d4eccab1f9
	.xword	0x193a15485d03715d
	.xword	0x033634d4697e8a27
	.xword	0xa33b877edea77c9f
	.xword	0xf6534349de44d75f
	.xword	0x108836233fb489a8
	.xword	0x6cf22721489d8bca
	.xword	0xac7f563edf7cc341
	.xword	0x61475d9a17f42804
	.xword	0x12a65f320c9fd6f0
	.xword	0x6b7cd71eacacf6b6
	.xword	0xe324c53c083e1d10
	.xword	0x728bb1793e0e666f
	.xword	0x59cb50d83215fcc1
	.xword	0xb3b6a15abed9d244
	.xword	0x9291c30bf1f2a126
	.xword	0xc77836401dd58e74
	.xword	0x02c9a69e6b4d8cce
	.xword	0x25e041a62316645c
	.xword	0xc5ff47c5c2b0dbb9
	.xword	0xb58877fda691185a
	.xword	0x48d99fa72eca3622
	.xword	0x5cdc974d5770252e
	.xword	0xea91c80c3aae75f1
	.xword	0x64b7b52a4acdc8ef
	.xword	0xa8d61cd69c844d17
	.xword	0x646b04b880de4c2f
	.xword	0xe476a9fe2f57b4f6
	.xword	0x6b5a12c0f5c681db
	.xword	0x7c7f8c0ce38ff92a
	.xword	0x46f2de89c7328daf
	.xword	0xd907fe73ada6697f
	.xword	0x9654e14e7b81a56a
	.xword	0x0f55d0c1346c0d18
	.xword	0x991ab54c8a1c11de
	.xword	0x08ae5b254f20dd1c
	.xword	0x86471a58ebc6d8d8
	.xword	0x49ecf87d376c14a0
	.xword	0x09a8f323f1c27cc0
	.xword	0x12e9da39955ddeb1
	.xword	0xda74133a6adaa49e
	.xword	0x16d092cd9f8c1638
	.xword	0xc9eb723a5fc21eb9
	.xword	0x6665e78264501a02
	.xword	0xc5f331fd6858ef71
	.xword	0x91de53517c6fe891
	.xword	0xe2e124497f7b3d28
	.xword	0x865431fbf28e06d5
	.xword	0xd0c88b82001b00d2
	.xword	0xb4f34eb7ffe452b1
	.xword	0xcabec3cf5cbdd922
	.xword	0xd3f13b11aeaa8377
	.xword	0xb424bcc11b68ba0e
	.xword	0x79b844a0dd2613e8
	.xword	0x62fa0837df047d27
	.xword	0x2a04363d35450c83
	.xword	0xc27e33e591787df8
	.xword	0xc139d7d9841b6df4
	.xword	0xbed6fc029c9bbdd8
	.xword	0x779933633eafdf3e
	.xword	0xb170c7cf4ebf978c
	.xword	0x070723e39badfb9c
	.xword	0xb2ce7e1b3024ed92
	.xword	0x7e170c8d10947e56
	.xword	0x864c45fd80f777d8
	.xword	0x596b72895e312d3f
	.xword	0x672eb5219ae43ce6
	.xword	0xf3a51a24c7626dc3
	.xword	0x2454ca2aef841b3c
	.xword	0xd5e9d1cc613481de
	.xword	0xca55b3f1ba9a6de7
	.xword	0x2873cf100372c636
	.xword	0x71a74f3e8973cdea
	.xword	0xacb417697c3ea016
	.xword	0x2c84e2510e53feba
	.xword	0xff00e9bba38eff1b
	.xword	0x45cfde084c520431
	.xword	0xd5f9d021c132262a
	.xword	0xf2b372dde0cd66ce
	.xword	0x948df3e5e9b9ac3c
	.xword	0xcd99b64d5a50a680
	.xword	0x8f499c45a2071e18
	.xword	0x930b2c1ab579dc7b
	.xword	0xd673b10b5ac8ff0a
	.xword	0xe0e2164136d81faf
	.xword	0x60df8c025a809090
	.xword	0x9dfce1cfed4980ac
	.align 0x4000
	.data
data_start_2:

	.xword	0x93e493b17eab1fff
	.xword	0x9353ef5bf6181a58
	.xword	0x7e55b8a21f42962a
	.xword	0xc859ee13e1fc82fc
	.xword	0x0f817265fb089ee1
	.xword	0x306f43b65010ba53
	.xword	0xfe10a0fbe5f015c5
	.xword	0x86200b9394c1e447
	.xword	0xb9e95fd23a831146
	.xword	0x8239b52bf7b5f08d
	.xword	0x6c6b1c298e217503
	.xword	0x9a9bfa4b2f244a4f
	.xword	0x1bcd8a55e22c5525
	.xword	0x664c3282b67205e2
	.xword	0xeb0671c38c32616f
	.xword	0xc2fe22789f11771a
	.xword	0x2163d9a6ac8a2464
	.xword	0x26ada82f284fa4e4
	.xword	0x687c1d074d924004
	.xword	0x6e764e1009c2ec30
	.xword	0x360ec5e89a6ef358
	.xword	0xe3258624bcd92d2d
	.xword	0x25e48ad3ff33af93
	.xword	0xbff96122a30813b9
	.xword	0x166f5fa336ee2d95
	.xword	0xe5655e04a6d2a25d
	.xword	0xa09d937a3f1026a9
	.xword	0xb22a7c757ccf72d8
	.xword	0xb3c1e86d22bde007
	.xword	0xcae2069ba0442212
	.xword	0xef7107b597ec5a24
	.xword	0xa67635f273ca23f8
	.xword	0x8968f3659283e605
	.xword	0x8f2a36a9bdb0d3f5
	.xword	0x05dd31ad9564de38
	.xword	0x1bfa997735193d7a
	.xword	0xd384f84f4ecaf593
	.xword	0x123cb9ed3ca6d8ba
	.xword	0xaa382baf08b9a553
	.xword	0x6ad65dd9dec92950
	.xword	0xb2a1b3c067815690
	.xword	0x12bbe49cb064211c
	.xword	0x589d1c4b4c7a7538
	.xword	0x34d93b45f318632c
	.xword	0x950b4be46489bc98
	.xword	0x07bacf5a594c5488
	.xword	0xf0f426777ffc55a4
	.xword	0x6e29132b4520462b
	.xword	0x364a69cad409d033
	.xword	0xf17e6a9a2d42c24c
	.xword	0x7df722fe1ef47d53
	.xword	0x6c633fe56beb77fb
	.xword	0x842ca45a67166bf8
	.xword	0x16adeb5c94efed1f
	.xword	0xd3b34b229bc7845f
	.xword	0x626666a62a8a6466
	.xword	0x3b586dc248329192
	.xword	0x04716fc94dccdca7
	.xword	0xa1cc41daaa449afa
	.xword	0x9f1ac1f6bd1caece
	.xword	0x8b64a8fb3c3c353f
	.xword	0x9c45e961fcbeaf60
	.xword	0x1b221eaa3c9f1df2
	.xword	0x7716dfae5bfd87a4
	.xword	0x46c8099887355955
	.xword	0x5b327b0690f57f2c
	.xword	0x37731bea5424c120
	.xword	0x08067d8e590b219a
	.xword	0x23a24c655dfd8c2c
	.xword	0x43976cfdcc271e51
	.xword	0x5c7ff117e4103023
	.xword	0x85797901f9ec4e14
	.xword	0xde8998d1d2b5e417
	.xword	0x33bcabd26f3d6077
	.xword	0xa5e813994735bf9e
	.xword	0x51edfb88e71ac590
	.xword	0x91b190465aa01aac
	.xword	0xa96200fb25dad134
	.xword	0x0480edd342be1a8f
	.xword	0xc8da8e112fed2a8f
	.xword	0xc777b49c2c25c3f8
	.xword	0x5039e0169d9f2611
	.xword	0xa7b4295c2b4f06de
	.xword	0x87c4c1a0c6e9c297
	.xword	0xcc362869128e8b68
	.xword	0x4efcf90037e219a0
	.xword	0x713cbc84c34010cd
	.xword	0x53459b4c7a531b81
	.xword	0x0f673b9d02e385f8
	.xword	0xe426f79f6268bcb9
	.xword	0xf0988347567e6f97
	.xword	0xcb14f5b3013dc7e3
	.xword	0x95fcc39a478d4087
	.xword	0x91f55797319767bb
	.xword	0x25187c40e7ccbe88
	.xword	0xd6ab6acb6f8b44cf
	.xword	0x4d637d0cdbcc928d
	.xword	0xacda55ceda580be6
	.xword	0x817c4417186ff09f
	.xword	0xb4411ac718e1b3ce
	.xword	0x362c91425d6c4872
	.xword	0xf584b8b67187e950
	.xword	0xe26f3e2e652373fd
	.xword	0x88c4b0a1d29ca183
	.xword	0xfab9eb7835a79d61
	.xword	0x5dfb3432aec2f59c
	.xword	0x81099a95f0116f34
	.xword	0x8fa424f7431069f5
	.xword	0x5a0bfd3827157cb8
	.xword	0xfcbc820e55d60bfd
	.xword	0x1d2d6f59b32a3c5a
	.xword	0xf969e4a860f50603
	.xword	0x210fb121a62146e6
	.xword	0xb4ea1b025815e784
	.xword	0x3c42ded242e9842d
	.xword	0xbb2af802dcb9537c
	.xword	0x9d5ded00fb6ff22d
	.xword	0x5270ebb838aa6b75
	.xword	0x4dea6b3bcf640a65
	.xword	0xed085ddc5ace0043
	.xword	0x09edbfccfbe553da
	.xword	0xdbf6f0b30af2159e
	.xword	0x9cf252f751ec9283
	.xword	0xda566c15ed9f698b
	.xword	0xc5076c0706623ebd
	.xword	0x89529155920ddf05
	.xword	0xabbf937f37117f18
	.xword	0x7c9a0625561202f9
	.xword	0x9dda5fae4dbf129d
	.xword	0xf9fe29f4ede87a57
	.xword	0xf546b582951fbc5b
	.xword	0xc1ecb11d4be3d1b2
	.xword	0x35d2d6628284e075
	.xword	0x2105c5619672606d
	.xword	0xcf944e32df9d0c98
	.xword	0xb5c2cb5c815bd3e5
	.xword	0xc7d53504617f9a24
	.xword	0x4e79e4ae45b6dac1
	.xword	0x6e74f4a2a34f5df2
	.xword	0x4f45b8c6f4cd008a
	.xword	0x49b263d2da67ba1c
	.xword	0x1947dcfc66acb32b
	.xword	0x0656f1c038e5fd25
	.xword	0x112a947c27469849
	.xword	0x5b0c23e2605b370c
	.xword	0x3dcc259e8a4d9b0f
	.xword	0x611ea48778591f22
	.xword	0xf9560132e67b7894
	.xword	0x0720dd7f4b3be8fe
	.xword	0x20a06c42c0484cd0
	.xword	0x24e086b76c3fb3b7
	.xword	0xdabd6d1562460b1d
	.xword	0xc4d886c3337e79e0
	.xword	0x3c6968783aaed113
	.xword	0xc8e0f6e2c6e4c9f2
	.xword	0x11e0e0c5705cc17a
	.xword	0x09e286103bc884ee
	.xword	0xf3224474db7f1fb1
	.xword	0x8e906de00588b576
	.xword	0x1f47d0cd840b781e
	.xword	0xa8cef3860949805d
	.xword	0x0c720d09c94263d5
	.xword	0x4827fcbec243a843
	.xword	0x78c8a69443c6902b
	.xword	0xd15fc2cbda4e898a
	.xword	0x56f7cd73be7c9646
	.xword	0x3ed4ca47ab00f0b1
	.xword	0x462bc946cef7f4bb
	.xword	0x509a188cf2b06932
	.xword	0x98d72161d1b14df0
	.xword	0xada89279639636a0
	.xword	0x2fa6566bc7b3a743
	.xword	0xeb407570f7c5aa5c
	.xword	0x47da75622b2353e6
	.xword	0xfefa7167cc60cf84
	.xword	0x0aab9c84d0157eb5
	.xword	0xf631d9591ff5c261
	.xword	0xc99b374576870bd2
	.xword	0x2a3a25a0b40fd46a
	.xword	0x75dabd9d3c74edee
	.xword	0xa56df1fde17b4023
	.xword	0x34f92221eb43bd4e
	.xword	0x8ebfd9a1866ecc8d
	.xword	0x1feb0803ce566bc6
	.xword	0xe0c3d3c96875cc21
	.xword	0xd750bc736206db05
	.xword	0xdd49b7f1b5c38030
	.xword	0x9325827dcbb72c12
	.xword	0x1468f153d10b244b
	.xword	0xf6ef6f92682b9e6d
	.xword	0xe02ab5a515c205fe
	.xword	0xf1178f89b6db5182
	.xword	0x7216c807b39d901d
	.xword	0x92ca0bc087a9dd33
	.xword	0xf6aada40c1d1fd61
	.xword	0xcaa41ee5cabee129
	.xword	0x7219e75b07e4a053
	.xword	0x15e3892c3b2520ea
	.xword	0x5ba052387ae9e266
	.xword	0x419307d13002119d
	.xword	0x95bd9de763326923
	.xword	0x4f6d6b560be1503e
	.xword	0x1ece1fc90e67f5ec
	.xword	0x7a0d7741d79e33c4
	.xword	0x0341cb603ce21562
	.xword	0x3ad8d513b70f7f13
	.xword	0x57afd7e34333b3bc
	.xword	0x56df2fcbceb04c19
	.xword	0x9c6d763f39e67e7d
	.xword	0x93ddedbef4601591
	.xword	0xa3fcb898bc457a44
	.xword	0xc8b6946dc5e7c245
	.xword	0x3a9d288eab9a2d07
	.xword	0x1c71b09e57fdb4fa
	.xword	0x97c1efda78ca17de
	.xword	0xef2876e361e54401
	.xword	0xa27421195ff888c7
	.xword	0x7b56e641006ebaee
	.xword	0x21d63af8d7be1afd
	.xword	0xa1df76de50a0fd5f
	.xword	0x98af627baaef0969
	.xword	0x6fe0f93820c626cf
	.xword	0x522207952d9acb96
	.xword	0x7723d17204154348
	.xword	0xe620461f73f5794a
	.xword	0x0c3a9d9eca296a00
	.xword	0x8fe3db0586d22432
	.xword	0x0e2c3c20fc9d204c
	.xword	0x773e0e0e3bca7920
	.xword	0xa438826bce9c5f81
	.xword	0x2ac3e901451fce35
	.xword	0xda96968eb1ccda27
	.xword	0x7ab19e67972a6d75
	.xword	0x3f53c46ddca955c1
	.xword	0xd8b6b717d78ab5dd
	.xword	0x194ffa8d7d7e84e4
	.xword	0xcc5fee552de429ad
	.xword	0xe1ceaf09c9ea74c4
	.xword	0x215be30125bb1355
	.xword	0xf26f85625bb0787c
	.xword	0x670e13a9faab0c7a
	.xword	0x08d210132573d83d
	.xword	0x1b2502b925123756
	.xword	0x72563c42f14b2f09
	.xword	0x3d6dba1221d0640b
	.xword	0xac97836114783351
	.xword	0xc14540703cfc3431
	.xword	0xb0f9ad530ea8bb39
	.xword	0xc087c3b24ee85488
	.xword	0x6d1cc0c17221e3af
	.xword	0x158097f4e363ad93
	.xword	0x9665c174bdaab15e
	.xword	0x82ce04d5179ff147
	.xword	0x897c9c5ec2e34006
	.xword	0x923d4e1929b58758
	.xword	0x0e8a9a753a38443b
	.align 0x8000
	.data
data_start_3:

	.xword	0x8c89b79fe1d1f3b6
	.xword	0x163e34d401a994ce
	.xword	0x6e8ba451381a41ad
	.xword	0xdc7162051f8e3026
	.xword	0xe058ce3fcd3aca7d
	.xword	0xc2ddbbcb5352c3f7
	.xword	0x1c72938b4092cb64
	.xword	0x3286d016d2d2aaf3
	.xword	0x2bf6883dda19a736
	.xword	0x85362b72b7c55ff8
	.xword	0x946648ff2fc2940e
	.xword	0x464f57a901b64562
	.xword	0x07766f625b63ea02
	.xword	0x6c8b204db74fc3d6
	.xword	0xcd52e850612815c9
	.xword	0xbd9a45631d5a7acb
	.xword	0x56c26e8fd8d3db68
	.xword	0xcb9a2803c263b87a
	.xword	0x86d0fc1ef3eef4c7
	.xword	0x62b38da411dc32c9
	.xword	0x752c2e8a2b573bbd
	.xword	0xb4ef6cb200ee82c6
	.xword	0xf617bf78f7d42758
	.xword	0x60ba24fc6248c5c4
	.xword	0x04c6826a3fb87955
	.xword	0xba83379f2425f96a
	.xword	0x3f99bfd1fec21924
	.xword	0xcb71c49e5be72cc4
	.xword	0x470b4845583fe970
	.xword	0xc110db1772872b87
	.xword	0x4b834452a0aed8b8
	.xword	0x8236c4bcc61adc80
	.xword	0xcdce7aeba33a45f8
	.xword	0xa24d01d3029bc619
	.xword	0x02278eb473fbc299
	.xword	0xb10ad4172ebceaba
	.xword	0xb96e707b67b8b686
	.xword	0x83f06d2ba8278e51
	.xword	0x07874cb6bd760bdb
	.xword	0x2c4408c3668e1126
	.xword	0xbf0b97fecbcad244
	.xword	0xed07f9489849a1d9
	.xword	0x055b9463a63f64f6
	.xword	0x02acabc7e2521262
	.xword	0xe3020130cfa6a56c
	.xword	0x0132719390abc859
	.xword	0x7a8a6fdfa475cac7
	.xword	0xb9d535e2b5b5c112
	.xword	0xf1d1ba8c3ed32286
	.xword	0x2357dfd3476d4ec3
	.xword	0xab311f2ec3c7a6ea
	.xword	0x1defd89a0cb80acb
	.xword	0xc7e9702876f74e44
	.xword	0x2b37029c2bd2221f
	.xword	0xe629275d4da3e489
	.xword	0x0e35a9b8e72b2e84
	.xword	0x9e8cf1d9c45c00ef
	.xword	0xd60ec2f23f27292e
	.xword	0x664cc244ab85ebfd
	.xword	0x06f24967a0dc1bc8
	.xword	0x613ca0d5c3bb64e5
	.xword	0x5c1bbe13eb7741c9
	.xword	0x22e78d60519dec81
	.xword	0xf1158d86267b78f2
	.xword	0xda7ce5f4739c9bb1
	.xword	0x58c11c9cbf7b6267
	.xword	0x7ffeb063623ee1b3
	.xword	0xda2851cd94c22a92
	.xword	0xc72b9e898716be93
	.xword	0x02346966a5d368f7
	.xword	0xf55be5108a1aa1f8
	.xword	0x754e0031824690f6
	.xword	0x979cd8564651316d
	.xword	0x72f6e1f2602c3ee8
	.xword	0xff887d17264c5ed3
	.xword	0x1c7aa27b6cf30607
	.xword	0xea54f9c11de2612c
	.xword	0x96d2ab382fd7c6c9
	.xword	0xb488168efb81ebc9
	.xword	0x3b7e7d1293554f1f
	.xword	0x6248aa9d8c89240d
	.xword	0x9622b60d6ff1260c
	.xword	0x9f1fb2565be9da5b
	.xword	0x51769a24ec565805
	.xword	0x423de526dd132fd3
	.xword	0xdace2fd44170748f
	.xword	0x68875da54582d17e
	.xword	0x34f6acd98f476365
	.xword	0x15ecb84c1dedbb0e
	.xword	0x8250f25b2dbd8854
	.xword	0xb7bffacac0c551e7
	.xword	0x63e714609c5c498e
	.xword	0xd7ba2becc756acbe
	.xword	0xd073a5a42e682a38
	.xword	0xf47cf1726787f2f9
	.xword	0x9b6d3fb50aa1e130
	.xword	0x09678c40524ac702
	.xword	0x30a0a6629ddd5ba4
	.xword	0x2a960939dba28f17
	.xword	0xc035b7b748dd3755
	.xword	0xea674d326a2bbf65
	.xword	0x9aaf7bb15546bf35
	.xword	0x2fffb2a9b06cb9df
	.xword	0xfdf155951e4d3d7d
	.xword	0x9ce86835de2e2385
	.xword	0x01af234a4d4751e2
	.xword	0x80c55614de8c288d
	.xword	0x82574ded7cf0e359
	.xword	0x1692d279ee7b8890
	.xword	0x7505e9073cad239a
	.xword	0x058fbebe7e390f4e
	.xword	0x1267b55f553a403a
	.xword	0x62f4923765ea9706
	.xword	0x992a58890cdeb73e
	.xword	0x21ab1b44feee1b69
	.xword	0x487ec319d94e4217
	.xword	0x4d59ca8bf14a3e62
	.xword	0xc94357084fe99af3
	.xword	0x2e9b933699955a94
	.xword	0xdd50abf511c332e5
	.xword	0xd0df3c89fd589645
	.xword	0x1ca09dd3306fbdb2
	.xword	0x36a087f1bb709551
	.xword	0x0887168bf6638a42
	.xword	0x87f26639af798f55
	.xword	0x16e406bc4bb32a63
	.xword	0xcce4b4cd6a11dee4
	.xword	0x79aaee65b9cc5122
	.xword	0xc4e2b2c3789d843e
	.xword	0x112084e8e0a6a89e
	.xword	0x5ee59d059eacc8fb
	.xword	0xacecd80ea12795f5
	.xword	0x231b205975229cce
	.xword	0x7e67cd88ba2b2aae
	.xword	0x4778888ad435f202
	.xword	0xfe5497e0b6b1b047
	.xword	0x005a407a4fbe73d7
	.xword	0x6627fe80bc26bbb8
	.xword	0xc240e9ff8fc68820
	.xword	0x1cce2c584936eabf
	.xword	0x69179ee1711d1226
	.xword	0x0c12da101bd88340
	.xword	0xa399f2ac78a9fce5
	.xword	0x249ba0c781085532
	.xword	0x0c9af86b06384f1f
	.xword	0xcf955002706895e8
	.xword	0x47ba71c41e25a7c2
	.xword	0xbc9eb41a5b71ec94
	.xword	0x354c010e472b1732
	.xword	0x3b6866dd75745ca1
	.xword	0xc9366d68445cc01f
	.xword	0x9e86f5403aa7603f
	.xword	0xc86c85b5c069170a
	.xword	0x1a019e8cc32b22b4
	.xword	0x5b9ee55cd7a99f3f
	.xword	0xe1eb4f7d91b6476b
	.xword	0x55eb9824a1c48d8d
	.xword	0xe7cc2a0129d1e375
	.xword	0x8e9897a7cb6ab223
	.xword	0x5aaea0af32b043df
	.xword	0xe323c902de850129
	.xword	0xcf62bc0733bbe62b
	.xword	0xdd4a2018ba523ea6
	.xword	0x251bb7327cfea105
	.xword	0xdf0b43c9059ab6e9
	.xword	0x34bb7a21ed12e0a1
	.xword	0xd225db15329fb215
	.xword	0x1648dd4f540fbef5
	.xword	0x3717781ddbdd6d75
	.xword	0x0d049223390b7914
	.xword	0x6f788cdaf57cd7b1
	.xword	0xfcbdbeeda823e7e4
	.xword	0xf5210b1f5cd4b30f
	.xword	0x91479ace56801ad1
	.xword	0xd877eb60012fec1a
	.xword	0x2d90a20ed3250f7e
	.xword	0x2f7aa1162f09829d
	.xword	0x59730e1065f901b1
	.xword	0xceb9c336ee592f9c
	.xword	0x76e2bec8a3b4ab3b
	.xword	0x2010e01e3646c44f
	.xword	0xbedaa947a2394564
	.xword	0xa8dc80434edb667b
	.xword	0x2341fa0cd1d2b359
	.xword	0x5b5250ba4ef9ef4d
	.xword	0xead2742533c48698
	.xword	0x2010e100ff04a8b6
	.xword	0x4bb7df64b1de4b80
	.xword	0x3bcb32fbeec1ff70
	.xword	0xdbe0746f36042ded
	.xword	0xe93d5a30112577d6
	.xword	0xecd110f4f57b778c
	.xword	0x43d3ade6489a0735
	.xword	0x47a041fb941d8b46
	.xword	0xded1db5e2796a330
	.xword	0x84a7d09647a78694
	.xword	0xc020982ba26ab8e8
	.xword	0x3cb76d1694af2bd8
	.xword	0xc06356db1c07f526
	.xword	0x56573d278381f358
	.xword	0x6d8686e72ff80d92
	.xword	0x2297d00a56fca650
	.xword	0xf60577d955f8758d
	.xword	0x9db8df1bd33dbf18
	.xword	0x50f90b7955c4f094
	.xword	0x9c368f96e6a9168c
	.xword	0xd3a6e8df879f1c2f
	.xword	0x752e6aa398876d92
	.xword	0x3ec1483dbd954eee
	.xword	0x656d42e5c2ba71c0
	.xword	0xfb34097e9f7d905f
	.xword	0x7500539abf4bc8a6
	.xword	0x39b6a36fdacdf505
	.xword	0x01cbcb5c2ca0b35b
	.xword	0xf93370ae25d25c3b
	.xword	0xc678b31252e0b86d
	.xword	0x66019b0734b8e887
	.xword	0x7a7f65f69e68c872
	.xword	0xde08410d2a23db6d
	.xword	0x627eae0fe4550185
	.xword	0x805c370bbe332e43
	.xword	0x7630145be21eb080
	.xword	0xf4605e5d6c158f59
	.xword	0x715607d870c2af00
	.xword	0x31f85e0c967911f9
	.xword	0x6301fb7e965d54cf
	.xword	0x814d3bc68c6e63b2
	.xword	0x0c6dfc7b33b10a7c
	.xword	0xfb5cf13280f0f4c0
	.xword	0xc31dbe80f1c55fc2
	.xword	0xc734782c33e62455
	.xword	0x68bef9097a5eb5d0
	.xword	0xb2bbe14040476dba
	.xword	0x34c9022c59e43b68
	.xword	0x5d3d4ae605807636
	.xword	0xfa8bdeae996f1d60
	.xword	0xae868bd0dd1d29d1
	.xword	0x4c0e91c7dd01f0bf
	.xword	0x722551be64942573
	.xword	0x12156d9041e6947f
	.xword	0x2e6b0adbe86ebb0c
	.xword	0xae7bc94a08c6cac6
	.xword	0x55cdd7c68d328623
	.xword	0xa950aece6cdb5d06
	.xword	0xfd3e9f32f66d7805
	.xword	0x6b4f94b95d4527ba
	.xword	0xd2d423b1f238dba4
	.xword	0x1513ebc4817db219
	.xword	0x79531f0eca138cc6
	.xword	0xb09bdae7ac5bf591
	.xword	0xd1be7c2d450b3005
	.xword	0x66b9a64e9a88fa97
	.xword	0x8925c006cb66c2e1
	.xword	0xe995bdafd415780b
	.xword	0xcbd5f4d9b70c30c7
	.xword	0x6daca6909df85421
	.align 0x10000
	.data
data_start_4:

	.xword	0xc20a5eb74ad215df
	.xword	0xd27534476634cb34
	.xword	0x547a0fa74c1db9da
	.xword	0x4041c6fadda435ae
	.xword	0x1b82bab9fbf0a1f2
	.xword	0x8b1ae679a90dbff0
	.xword	0x39229b4089a18e89
	.xword	0xdc40c29caa45eb56
	.xword	0xf95b6c670ac07837
	.xword	0xfccbf98fd5dbb567
	.xword	0x47a3ea83b64ae109
	.xword	0x4bc370e59b8b3c57
	.xword	0xfc4ead8f4f962904
	.xword	0xe2b4738730d399f9
	.xword	0xacb6a99662031f94
	.xword	0xc0fca02a282daf35
	.xword	0x9ef30fa832dd5c13
	.xword	0x56f48cb1e8357d66
	.xword	0xb74f6c3f75b9848a
	.xword	0x914dcea210b9299f
	.xword	0xf97305de2654f1e8
	.xword	0xfa8d0fe081efa701
	.xword	0x33420a51ab8e8b4c
	.xword	0xd31a45fd4e8b0567
	.xword	0xd9a5180ddcb7256c
	.xword	0x6249b067339dc52c
	.xword	0x66f99f891f7aa8d8
	.xword	0xc417a611c004964c
	.xword	0xfbe957f3e3bd616e
	.xword	0x30007461c22790f2
	.xword	0x1306595cc11ab4b5
	.xword	0x9831b566a1d830ce
	.xword	0xe1e1d5f0243996fe
	.xword	0x1bdcf50a65a0b40d
	.xword	0x20f3a90fac1f2bb5
	.xword	0x168fa3662d84033a
	.xword	0xe03f64e4d483a6bf
	.xword	0x4a5a58d85da4cb03
	.xword	0x9b98b0a689ed03d8
	.xword	0xfc5f0ca6de035f26
	.xword	0x2705fd605c00b4ab
	.xword	0xe3e408cb82251463
	.xword	0x9b5ecfe23107884f
	.xword	0x94926622989dc71e
	.xword	0x59f15598b7d94df6
	.xword	0x99f2c4f93067fd86
	.xword	0xc6889a98a12aac27
	.xword	0x84727d7d9d8a21a9
	.xword	0x6ebddcb65af40d76
	.xword	0x943a35a0653b9ee6
	.xword	0xe4c4450a9e9bedf6
	.xword	0xcc8daaf595eac577
	.xword	0xf1f79898452cdff9
	.xword	0xd47cce4d00ac22bc
	.xword	0xad57ef364826b37e
	.xword	0x3470326371b568de
	.xword	0x3708911ad2311de7
	.xword	0x8c7541d80506af9c
	.xword	0xe6d6a213316d483d
	.xword	0x5a27a901876a2a0f
	.xword	0xea9f0df8a7731648
	.xword	0x6930babd76e09f81
	.xword	0x1110507703c14e9f
	.xword	0x1b8d31246abefc75
	.xword	0xf7013350aa530f45
	.xword	0x73a07a3718cefc19
	.xword	0xd4c95f6a5fb8b43c
	.xword	0x3281f3e090a60043
	.xword	0x7a2cd0eb59315309
	.xword	0xb436c82280242833
	.xword	0x84f31f0de24d2254
	.xword	0x8cca358d8f6b4278
	.xword	0xc95d5e3d3b58f048
	.xword	0xba735a052fce6fea
	.xword	0x638a62fcb2d52564
	.xword	0xc557568688c6cd36
	.xword	0x3d3918a36d64b4f8
	.xword	0x7bc7bd186ba6d66b
	.xword	0x3e7c1cc8c842e8b8
	.xword	0x094c85915b526732
	.xword	0xe74e0defea4ef84b
	.xword	0xf5fd3d6880047e4c
	.xword	0xf8bf3a3b1671213a
	.xword	0x11f4d1e3242ca39e
	.xword	0x64a47a40f95a0d40
	.xword	0xb0678b5a1eee9712
	.xword	0xa924155ac98353e4
	.xword	0x4283f27350d78539
	.xword	0xb96e5ad7579ba220
	.xword	0xe08357b61d514534
	.xword	0xf96a0014dacaeaa3
	.xword	0x89e93cf8be2c7457
	.xword	0x013c39bfe0b9d1d0
	.xword	0x51c4e249c3360d44
	.xword	0xc1f251ea7ace53b2
	.xword	0x2f2425ca0a36a3ff
	.xword	0xa6e2d92f604e471d
	.xword	0xe522b4144d9ef625
	.xword	0xb4405d5cbf937252
	.xword	0xa9945f6bae939d56
	.xword	0x405d7169f6b608c0
	.xword	0x3ff44601b7f0ba53
	.xword	0x4f3887862f8d9c19
	.xword	0x48dae44b62e304e8
	.xword	0x6b0f76363106417c
	.xword	0xd49e32b52be02183
	.xword	0xb74ca212489e6ebf
	.xword	0xb7561a6cce0ce23a
	.xword	0x268a61699a78352d
	.xword	0xbcc69e26d5df95ca
	.xword	0xc7ad11458d6fe996
	.xword	0x903a28dad1c95e9d
	.xword	0x906524eb0ebac6f9
	.xword	0x87629f7b24a7951c
	.xword	0xde0fb46e4e9cde7a
	.xword	0x0ab6dd243880ad6b
	.xword	0x347745634156bdae
	.xword	0xc1d5d9b10352d75b
	.xword	0x95d4d018a333b32a
	.xword	0xabea475dd6948c9b
	.xword	0x4f5a6e302a9f675f
	.xword	0x73a8b0ff8cbcfee3
	.xword	0x2860b4ebf30797be
	.xword	0x771775653724c05b
	.xword	0x5011b126062d4a23
	.xword	0x006317e465e60f7e
	.xword	0xed9f3187998ccc24
	.xword	0x05a4d575e988f05f
	.xword	0xca51a5bb3788b998
	.xword	0xebdf0b8fd0846cbf
	.xword	0x4c4b46882f0c72f2
	.xword	0x55af4006968666bb
	.xword	0xe55c21734f4399c8
	.xword	0x6129f7f192f136d4
	.xword	0x519772ae0b9d9d9a
	.xword	0x221a936e3ee04ece
	.xword	0xdd9211ffe59981d6
	.xword	0xeed40a7e439433ef
	.xword	0xc450e36a725c5c62
	.xword	0x0c8310235d78117d
	.xword	0xb5296cef235d8503
	.xword	0x8052af4c1ae8afc5
	.xword	0x18036cfac56d2934
	.xword	0x6cad2bc4c249f05c
	.xword	0x5bc98bf60cfeaa06
	.xword	0x2c35156fb6ad0c28
	.xword	0xc080ca947ebe86a7
	.xword	0xb389ca6d618558e7
	.xword	0x696b6b39c938f40d
	.xword	0xb564e0cfdb06cebe
	.xword	0x0a0e775624f37fdb
	.xword	0x8f7fc26fcfa7e80e
	.xword	0x83e066cf0c31257b
	.xword	0x763076a4d3b7c6a9
	.xword	0x6c2a807d4576c000
	.xword	0x351bb0e87a43c473
	.xword	0x05fe9199270edbe1
	.xword	0x499f6d1f723da394
	.xword	0xfe426f823da04953
	.xword	0xf9792eadd5e1bf65
	.xword	0x2a71755f4246ddca
	.xword	0xb5bc5cbafa136902
	.xword	0xadda1dbfdb8af3c8
	.xword	0xc44628dbd3eafddf
	.xword	0xf9d8e7a21a445039
	.xword	0x515709f4972ace4e
	.xword	0x944cf8e59f9f0b7a
	.xword	0x406ea8fdce7a3a2e
	.xword	0xbb89724677849907
	.xword	0x641f2373b6d9d3a6
	.xword	0xf1dc4a5b05d1a53b
	.xword	0xfd6dd4a95b6b42ef
	.xword	0x6ee8e3003385a983
	.xword	0x86b395a983f484da
	.xword	0xaaf78f519b6efb2b
	.xword	0x947863312ed4f042
	.xword	0x51298bbc7d91c2d0
	.xword	0x2338a4d57f95cb1f
	.xword	0x13d9843a3b9671cc
	.xword	0xccdd98e678a4172d
	.xword	0x0201547de9a97824
	.xword	0x9a305877e23e8983
	.xword	0xfd2212a9b5979eb3
	.xword	0x7d896b5bd2e567ba
	.xword	0xab0b82b279d0a2cc
	.xword	0xe3c7091a4f97bf2f
	.xword	0x3c58b44627d07528
	.xword	0x9daf5c6c2cd7a8ba
	.xword	0x1e15f911bc93673c
	.xword	0x53b45b0e38a886a7
	.xword	0xc7d002b710f1dcb8
	.xword	0xc03f4043297b946d
	.xword	0x59b3598b10c75851
	.xword	0xf8c22c34f82ffa0a
	.xword	0x32cbe18f00a5704e
	.xword	0xbf1ad8f877a6fb1c
	.xword	0xf968e6bf7700aaa7
	.xword	0x53fc31de5b721a97
	.xword	0xf0428f47c3b57be5
	.xword	0x005b36b4ec7b04d9
	.xword	0xfdab053af3b0b4f6
	.xword	0x4e71a9f5cc1bde79
	.xword	0x5c8240d553068f83
	.xword	0x37e6214243e806a7
	.xword	0xb850737787536f90
	.xword	0x446aa59c40267e2e
	.xword	0x21ac0cb825841873
	.xword	0x0d62c26a2314faad
	.xword	0x7c1f0741e8f6f15d
	.xword	0x4dc2d77594d7bd1b
	.xword	0x7ea5a830ac401dee
	.xword	0x54554c1f2297439d
	.xword	0x53cd54637b3ce47e
	.xword	0x89c7fe0ab0573eaf
	.xword	0x81282319bd1d5597
	.xword	0x8b96a11c061354d2
	.xword	0x9336a7d52f66f365
	.xword	0x0e123aadcb94491d
	.xword	0x88a6ec6817fede4e
	.xword	0x5d0851af1082ad17
	.xword	0x13a1054c54766e0f
	.xword	0x0476952e445ef832
	.xword	0xeb34e4bfc5cf293b
	.xword	0x38b628f90b7424d2
	.xword	0xbea53c2ffedcec3a
	.xword	0x63e122212e12dd40
	.xword	0x631f1371bc0aaf0b
	.xword	0xc98c5b5899e2503c
	.xword	0x6390e2a56b3f1888
	.xword	0x5bc457706e483b3b
	.xword	0xb52cf2a912010c96
	.xword	0x528a06a49038c1c8
	.xword	0xd7e5ffbc6a75670d
	.xword	0xb1f425eefc7553c3
	.xword	0x92e9d8893219cfb2
	.xword	0x20e4342fcfc2807e
	.xword	0x006095a5db11431f
	.xword	0x9737cfb074a81810
	.xword	0x5be09b31a9b16566
	.xword	0x0784957f0c37ec50
	.xword	0x64c85bc130282498
	.xword	0xaf2bc0ddba22be22
	.xword	0xd18d73e0d38020ab
	.xword	0xfa3f56e195ed50f1
	.xword	0x5149f7abd66b917c
	.xword	0x339eace2f9e0e99b
	.xword	0x62966b5ea7a11ec9
	.xword	0x375bee50ccc901e9
	.xword	0x452bd43b235f8685
	.xword	0x0e926f86a4d9c9ea
	.xword	0xf4536ce6dc2bea83
	.xword	0x858ffc891cb69d8a
	.xword	0x6128e52b282eabe7
	.xword	0x57e0590bc9a3d346
	.xword	0xd5f74b081c08d402
	.xword	0x8061a621d4cae972
	.align 0x20000
	.data
data_start_5:

	.xword	0xc5651c4c75cfeb68
	.xword	0x3e85dc3f916b469c
	.xword	0x6d31e01c340d6434
	.xword	0xa32938e1dfba1d95
	.xword	0x26c8c025fe2f0a08
	.xword	0x64405ef5b41b2f7d
	.xword	0xc3b125df6a2f4a0b
	.xword	0x6e388b2ec07a5569
	.xword	0x84b4eab5f5d1ba6a
	.xword	0x6d2259c6b5b19969
	.xword	0x84bd3b74f93f473f
	.xword	0x3c5739f7c093ba4d
	.xword	0x31628f6812c5fe52
	.xword	0x23b5fd7faa532369
	.xword	0x2cfc4d13b919594f
	.xword	0xe272740b97bb839d
	.xword	0x5cdb0c90fb130579
	.xword	0x02c947178433291a
	.xword	0xee34d796f7f62e14
	.xword	0x5424faf9ec1c47de
	.xword	0x22e56765669e0aae
	.xword	0xefaf7e5e70883c0b
	.xword	0x731dd8ea83ad8f4e
	.xword	0x15b847a90b9d3e5c
	.xword	0xd2bb830b2a328720
	.xword	0x9d6048b55265d06d
	.xword	0x94afe784a29e5fda
	.xword	0x5df5f0b85cc3b699
	.xword	0x2a407e2ceb88f157
	.xword	0x836deea5a1c4c943
	.xword	0x10d388e78cd96c60
	.xword	0xb5012668badef666
	.xword	0x6983c070162b7814
	.xword	0xe1c045d6634ca48f
	.xword	0x8a81cafd58a24f18
	.xword	0xd55d262000670703
	.xword	0x27815fe559f86f7d
	.xword	0x31b5399b72b7d5d3
	.xword	0xb8a7f69df19bab7b
	.xword	0x4884435bcf174ba6
	.xword	0x8c5351af1e0ab778
	.xword	0xaf89ed21aba6f972
	.xword	0x18a88acaeb378b08
	.xword	0x98fb78de98a90c46
	.xword	0x0cf308d8cb495d22
	.xword	0x81eb8913a6e9820d
	.xword	0xbe61c98d30187b90
	.xword	0x8ec003c531b6bcf9
	.xword	0xc3bb67f2f84c2379
	.xword	0x5fc2740e0e6db3da
	.xword	0xe98adbef56925fec
	.xword	0x05bd1cd954b24cf3
	.xword	0x643b1d29786f7453
	.xword	0xed4888e6b1307f26
	.xword	0x585cc07c404ca935
	.xword	0xa66de542d987e42d
	.xword	0xfd875d5e3198de2c
	.xword	0xb4a2b0587d5fdd4c
	.xword	0xb557f2688c5f130e
	.xword	0xd0d74cc85d257911
	.xword	0x8503a92d5375f3b1
	.xword	0xe4af3be06f1d9035
	.xword	0x3d869c9d675dd59f
	.xword	0x3686092d02af71ff
	.xword	0x89e1b07c18139410
	.xword	0xef757ade0804c58d
	.xword	0x44c00ffe1d3fc358
	.xword	0x4c295789a038394e
	.xword	0xf7b6f1755e56d73b
	.xword	0x725dd166048f3f76
	.xword	0xb4d6cfdc7345c842
	.xword	0x2d1a62bd69a119bf
	.xword	0xcc30f2a548159c52
	.xword	0xbbdcfa3c144b5fd2
	.xword	0x85d3e4333daebc53
	.xword	0xa98d9568775c6c89
	.xword	0xb8a13d3b7c3707db
	.xword	0xfffaf3f57ac8dc4c
	.xword	0xa87739aacdb7fe7c
	.xword	0x1d7fcdbae7411771
	.xword	0xa063b58439381966
	.xword	0x0580b638b53fc318
	.xword	0x6f3abdf3871a03e7
	.xword	0x10ae64d271fc17fe
	.xword	0xd3c1d95acd365993
	.xword	0x5edd044842403d07
	.xword	0x2c856b8891c70653
	.xword	0x012260ee44ea98a6
	.xword	0x23b19b8a05df0cb7
	.xword	0xd25bd5c8e9e8ddb6
	.xword	0xbf44ae3c4209236e
	.xword	0x769be97ab469358f
	.xword	0x1a9b30d8a9339d13
	.xword	0x416b2758d1d1431d
	.xword	0xa367bdb10117c900
	.xword	0x301f93af2b843abc
	.xword	0xb8d24e905467ecf6
	.xword	0xa4a72a7ea683a1d7
	.xword	0xf6d497d98b8ea84b
	.xword	0x09a354690ae23124
	.xword	0xd30b47e3e18d5207
	.xword	0x76ce7acc280b0f07
	.xword	0x4b1eaad2b79851f5
	.xword	0xdf39de3dc739bf63
	.xword	0x4523d5c426f2d1c9
	.xword	0x1e48c591c6d9184d
	.xword	0x054a95d23187c1eb
	.xword	0x1945b79bcb114735
	.xword	0x7e9a46f9b9139a6c
	.xword	0x7e7e325998be4123
	.xword	0xcbc42a1ea1fc36e9
	.xword	0x46bb5607cb06fccf
	.xword	0x1533dfeb6e91d2d8
	.xword	0x353bcc6444a3e5f2
	.xword	0x9897ebab4e9a838e
	.xword	0x4cddbbf34f268592
	.xword	0x6a39f1aae21aff1b
	.xword	0x88f7f58c2804de24
	.xword	0x2f1d89da8a086c34
	.xword	0xc1ab5422b0a86e6f
	.xword	0x031d97715015f2b6
	.xword	0x6cf334c1b731b368
	.xword	0x72ae04ee7d3b9530
	.xword	0x5866ed0a5e817648
	.xword	0xb66c552cea10ef32
	.xword	0x94ec9eaeea116087
	.xword	0x55a799f832044e62
	.xword	0xacb73a8ea44ec4f7
	.xword	0xdd22e5e0fc2158eb
	.xword	0x60629758147f6464
	.xword	0xd854e18dac582823
	.xword	0xd3acf82c4714c09b
	.xword	0x60f93c85b989c99a
	.xword	0xe823bcd954766e17
	.xword	0xb9ca12ea38ca02f8
	.xword	0x9469c0e237c7cc99
	.xword	0xd4b972bddcd8531a
	.xword	0xcff12e848177d0d2
	.xword	0xc0c9ceca36a84f25
	.xword	0x95f3ca438edfb884
	.xword	0xd1caae9405d9c82d
	.xword	0xfd663eccda4aa1e9
	.xword	0x11f72e8dd4370924
	.xword	0xa34f978be0d8fe87
	.xword	0x06b5805903cd1cd5
	.xword	0x93c28ba76336942f
	.xword	0x44e1d18abe955674
	.xword	0x0ec4dd3f8dc10afb
	.xword	0xcb7eafdc8139ec20
	.xword	0x6b3ccfcc3b8a9a25
	.xword	0xd0b042538d629187
	.xword	0xb5f915f54d3804c6
	.xword	0x72c274762aa0e8fc
	.xword	0x5a69963a18f5eb49
	.xword	0xa46381c3becc6dfb
	.xword	0x500ee0e4d71f6d37
	.xword	0xb6e8ad7d1f3baaed
	.xword	0x0fe757968091af73
	.xword	0x4b83cbd75b77d40d
	.xword	0xca96319dab2e5ed6
	.xword	0x2b7bb7ee803708c3
	.xword	0xd01135f26201b22c
	.xword	0x0b7a7f5f632aabe3
	.xword	0xc2989b9d7231aa3e
	.xword	0x321ee77de25f89fd
	.xword	0x9012654f1ad18594
	.xword	0xc433a9c0911390b5
	.xword	0x6a5fce7191cbf6e0
	.xword	0x90f330d84ba7dc4c
	.xword	0x8534444ad1c54b8d
	.xword	0xff111a86a81e6d3a
	.xword	0x3036cc11d2f4c921
	.xword	0x231ca19e72486947
	.xword	0xca2d1b4a278fd950
	.xword	0x97005dc427758048
	.xword	0x41789976f2801024
	.xword	0x13829eb46cb8a9e7
	.xword	0x3ff4bb927532fab5
	.xword	0x15c10c3fdcb4b6c6
	.xword	0x1857a5b5a1e3afb7
	.xword	0xf7ddc8bb8f0a7497
	.xword	0x0438500d6ff1ca03
	.xword	0xc3708822090b958b
	.xword	0x544811d9784ddf2a
	.xword	0x31e52401b0f3af55
	.xword	0xf6f0e2acc2ed513d
	.xword	0x2def56987c47fd9f
	.xword	0xeefc4793923323d3
	.xword	0x9bd8576c85b89a4b
	.xword	0x1c61bd54e8f66fb6
	.xword	0xac4b7177e80c004c
	.xword	0xee33ecf069a54eca
	.xword	0xdd900d4865812bd1
	.xword	0x0c4638a4a98b4173
	.xword	0x5255522e60f8df2f
	.xword	0xa4aa0b508c9d896b
	.xword	0x5b534a88005f45b2
	.xword	0xe7e66ff09308fd4a
	.xword	0x6746ee6fd63e6d7e
	.xword	0x57836caaf4555e02
	.xword	0xf3292619a880f974
	.xword	0x8ebf13fe26623cf8
	.xword	0x781a47c5adc93f04
	.xword	0x99b5a68d4c29b645
	.xword	0xac8a3801731c5f17
	.xword	0x8797e76bd49f1400
	.xword	0x013a3505d11296fa
	.xword	0x7daaa5a7e9e94152
	.xword	0xf8e243077ab2d8ac
	.xword	0xaf258a0c390da773
	.xword	0xef5342e76acca1f2
	.xword	0x5036808159404731
	.xword	0x158493796d05a5d4
	.xword	0x8ddc1952f3103797
	.xword	0x8501c9b12d68561f
	.xword	0x9c020673e891f9cb
	.xword	0xf0b739402a0afbd7
	.xword	0x7edac02920480e4a
	.xword	0xee9594ecebf21964
	.xword	0x7c14bbcd725610aa
	.xword	0xaa79c215b3cdd9fb
	.xword	0xe5d2439f81cd8274
	.xword	0x1cdd4e436a53553d
	.xword	0x67cf5201ac5f0527
	.xword	0x53e1eea7c35bcd92
	.xword	0x92dab47997dc5b8a
	.xword	0xf0930b2bfef56ba0
	.xword	0xc703611bd433f661
	.xword	0x72980d21d7d41261
	.xword	0x89f9c34de90630b1
	.xword	0x3b5c6ba43b5d85fd
	.xword	0x0241b3d46b8414be
	.xword	0x47573d615ea56d6d
	.xword	0x35b43b96b0f2335b
	.xword	0x47d7446a1a56571f
	.xword	0xf01f77f859ac8af7
	.xword	0x93b5bc739c79eaeb
	.xword	0x5a145de54592c3b3
	.xword	0x546367a5152df9f7
	.xword	0xa9a818da1a4bd04a
	.xword	0xafa2ee60c23d400d
	.xword	0xe5138e92e7d35318
	.xword	0x82da69f783391f02
	.xword	0xf9502b5ef267283b
	.xword	0xc44c87d70374c4f4
	.xword	0x5f3ebc33ca1a8de7
	.xword	0xa60b9a49c1075b2f
	.xword	0xf375a57d8280ce11
	.xword	0xb303c5ab7d370a02
	.xword	0x0c664b1974dd6c44
	.xword	0xa0663cbfe7cefea4
	.xword	0xde49aa690c6f66b5
	.xword	0x3c0672f627893aca
	.xword	0x02f675ff028e0198
	.xword	0x8fb138ef4c6e5ee8
	.xword	0xf04cdde812e00bd5
	.align 0x40000
	.data
data_start_6:

	.xword	0x2db4a6e81e854e2f
	.xword	0xe3cc14693890e701
	.xword	0x483a4855e7c772ad
	.xword	0x308e60428a3dcf2a
	.xword	0x8c433bf7b57d8bca
	.xword	0xd2135ee94e20d171
	.xword	0x8e99284ae0842f49
	.xword	0x95b7fbcdc9962b26
	.xword	0x83f985798f4cdd63
	.xword	0xa26784c57fafd52e
	.xword	0x939fe8a9f8363112
	.xword	0xe8168dfd8f3f88a1
	.xword	0xdcc0cf3e2fa6a504
	.xword	0x4c033bf95f8d2299
	.xword	0xe6424ba0a8c45a7b
	.xword	0x4d8b6712efd8ab25
	.xword	0x41f86aa17e50e2e4
	.xword	0x2b61537a855f2e11
	.xword	0x51ddb7ecdb8dbbf8
	.xword	0xa347d75354069844
	.xword	0x7b54b2e206442cce
	.xword	0x546a25a745868495
	.xword	0xbb5caa80a3d2b743
	.xword	0x9765609aab4821c0
	.xword	0xc91af8fe132f474f
	.xword	0x97ef41dfaa402b8d
	.xword	0xa504f3892114bc59
	.xword	0x3589c9d44ce3d175
	.xword	0x36ad2bed3b0bbec5
	.xword	0x2b420f450fd1a06f
	.xword	0x185a95393e77d44b
	.xword	0x0e58d9d1fd286e6f
	.xword	0x05ed33b4783ceda4
	.xword	0x4b1d6d093e5924a7
	.xword	0x92540c0f3993443a
	.xword	0x6a0c623ae1e44c8f
	.xword	0xda9c9f96dceb7537
	.xword	0x40559d9f7c6c8349
	.xword	0x05007ed4fdcc3a6b
	.xword	0x2a4f7d2d7950a94a
	.xword	0x2fdaa1cc20cb8adf
	.xword	0x9c254261883cf65b
	.xword	0xedb1325ea2bae7a0
	.xword	0x2ee8831bbc9b9c75
	.xword	0x0abefba651927daf
	.xword	0x49746b38a550ce7e
	.xword	0xb0341b1325ac9457
	.xword	0x1cce8e0247bb5613
	.xword	0xef84dc4871f45b49
	.xword	0x2d6bea7ff232a8a7
	.xword	0x2ea40f086a8cda4c
	.xword	0x54e8324db90eaf84
	.xword	0xc3afaa92cbd3b1ee
	.xword	0x6ae1bec17e9a4070
	.xword	0x98021e7c2e6986af
	.xword	0x0e4bafc6e4f63f8c
	.xword	0x0de81382c47eb4e2
	.xword	0x1b31dad8f09abddb
	.xword	0x05b4b06819e36832
	.xword	0x4417b7fc1e7d109b
	.xword	0x5ebeda656f1e4028
	.xword	0xed96c9c6349d9d96
	.xword	0xab2847378eee421f
	.xword	0x4cd8b70d4d1c86a6
	.xword	0xf0aef9e748afc440
	.xword	0x5893096fea129883
	.xword	0x5f26faf01b129b13
	.xword	0x2bc2fbf02412f25a
	.xword	0x1c6857295c6bf19f
	.xword	0xd027a4dd39d79da9
	.xword	0xb7a301644a27072b
	.xword	0xf12f9af9928d6cda
	.xword	0x8e5c7c369e0d2029
	.xword	0xd46d8892e0c17752
	.xword	0xbcbe62f7f2ec7a0f
	.xword	0xb98e7518924d8056
	.xword	0x4aa60ff2cfbc86dc
	.xword	0xb21c152b9da9765f
	.xword	0x6be4a22cfb142669
	.xword	0xa56cb9cbc1617208
	.xword	0xf7fecdddb09059a3
	.xword	0xa3afe5e5f5ab3489
	.xword	0x572d114f25472847
	.xword	0xd65579ffe513c4af
	.xword	0x9d1f2c9bf42ca3c3
	.xword	0xa0cf745fea2649a8
	.xword	0x48911ce54084debe
	.xword	0xa1722dbb48ac42fb
	.xword	0x232f2ab48325a16a
	.xword	0x6f6b56015709dc5c
	.xword	0xd88230aee0d19e8a
	.xword	0xeaea4b0194c80731
	.xword	0xf1c0cb4ef674b5c0
	.xword	0xf88107568bea309b
	.xword	0x00449087bcf08c91
	.xword	0x40e919b0a3ead918
	.xword	0x5ad734a6aa5ab43a
	.xword	0x467aa7d1a55123da
	.xword	0xd46413079126b97e
	.xword	0xc52e982a04cc730f
	.xword	0x865ee4e85b5c4f69
	.xword	0xfda796d8360a1a10
	.xword	0xb62117bff4c464a4
	.xword	0x91cba323be59c66f
	.xword	0x8c334a982cafd94a
	.xword	0xcf84d764a29565a4
	.xword	0x717c9789a20c40ba
	.xword	0x99c1d73cbb557de8
	.xword	0x6e4ac30f1cab3600
	.xword	0xf3e7dc701310716e
	.xword	0x9a538b11993e5355
	.xword	0x26ef2201b607c41f
	.xword	0x7cb9b98d13a95305
	.xword	0xd8f932163339e27f
	.xword	0x48f10b592cd5ee67
	.xword	0x2c960e8cbec5fb2b
	.xword	0xbd88492842c755b7
	.xword	0x23ba0e73898b6ecd
	.xword	0x3bf8add13b2f2fdf
	.xword	0x21158a9848f5b5bd
	.xword	0x17b9d3ffc2af8991
	.xword	0xa4c3ef8e6f861354
	.xword	0x1e08831ac5382a8d
	.xword	0x92296d6dc7b77944
	.xword	0xa5840ea222162a89
	.xword	0x74a982de3605f042
	.xword	0x4f9ac529229800a3
	.xword	0xc184a67764264020
	.xword	0x6c1be36aadd48973
	.xword	0xdea6e6798ffbef61
	.xword	0x270b50f2e84bd477
	.xword	0x2d175fca6960dfff
	.xword	0x29c94cd6c1d528bb
	.xword	0xb00bb1c87731a66c
	.xword	0xcbdd71216e0e1dd7
	.xword	0xabfe707f6b3586d1
	.xword	0xeb5d1343f365a0b1
	.xword	0x2a7b7a7a08dea83e
	.xword	0xa6435afa814f39f5
	.xword	0x7af16d4774bc450c
	.xword	0x146a971b5d5096e3
	.xword	0x16c7aa402f4cc0ae
	.xword	0x8a03002ee57fab37
	.xword	0x9ca3c930a0d8b60c
	.xword	0xf3a47519b68d72e0
	.xword	0x67067c9cd3e8b199
	.xword	0xec7922b22b2e2ae3
	.xword	0xbbd939b85f97b10e
	.xword	0x66c954bd46c9dd07
	.xword	0xfc72808e2d375dee
	.xword	0x7f9fb4fba35bfe13
	.xword	0x84064ab2a026ba2c
	.xword	0x2274f6a1d2806527
	.xword	0xabd110d69c0839d8
	.xword	0x4591decd64aeeebf
	.xword	0xc77084a782e19b16
	.xword	0x498e93a230cb8229
	.xword	0x955fbe6015e54b7a
	.xword	0x5028fedf69c2c8cf
	.xword	0xf6a174765d921821
	.xword	0xa7c9d93a13815aab
	.xword	0x60623916624b8bdc
	.xword	0x6c201afd88ac72cb
	.xword	0xf835072d4c061312
	.xword	0x713d8dadb6cf3487
	.xword	0xce61c8ff25256b87
	.xword	0x0c43716591810285
	.xword	0x7438dc64b2f3d3d2
	.xword	0xc8eb81e37f9d605d
	.xword	0x1cefd2945a67ff0c
	.xword	0xe85c47a80a71e2f7
	.xword	0x20e5c83d994703d3
	.xword	0x9f414a7ea09653f2
	.xword	0xb0ec96603ae9d17c
	.xword	0xa871047ef9904179
	.xword	0x710b0f6871681752
	.xword	0x14879ab13affe214
	.xword	0x00341358d84668d1
	.xword	0x38d29823be7676f4
	.xword	0x55da092b2e4d933c
	.xword	0x5dc95a2b6a1eee78
	.xword	0x3fb13585fb76b668
	.xword	0x2e57993a4f562998
	.xword	0x1f9dd29c9b568866
	.xword	0x8401765e43c425cc
	.xword	0xbe3336a051fe633f
	.xword	0xfcf51c72c972898b
	.xword	0x7e6478932b006a89
	.xword	0x6b9c85225d5fe9ba
	.xword	0x30b3df0a9bb734e8
	.xword	0xd1a190783decf3f7
	.xword	0xb63d44f47383f531
	.xword	0xc4d54c6d015e680d
	.xword	0xc87fc567eff44b55
	.xword	0x601443a4d68f8e98
	.xword	0x902fcd7f29dc4740
	.xword	0x70175d7076b40f8b
	.xword	0xfe4251c32fbd5faf
	.xword	0x33b1b1d355f5770e
	.xword	0x83bed8c05f7a91a9
	.xword	0xfdae62bc35bdb083
	.xword	0x76750fa1843d754b
	.xword	0x3a4045e7a83b8e63
	.xword	0x0df2b48424ebf5de
	.xword	0xd928d2c875ac6997
	.xword	0xf64b9303ba53d57d
	.xword	0x5f98ee04ea0cac02
	.xword	0x686de1973b2c4cdd
	.xword	0x82f9b8706ae3fa31
	.xword	0xa299ba17ecc8ac49
	.xword	0x171bc9b1739c63ae
	.xword	0xe799611ef26c45fa
	.xword	0xf835cda61cad48e7
	.xword	0x5442c19920fbdcbc
	.xword	0x336704bface77ad1
	.xword	0xbca9cffdc45f6756
	.xword	0x61bf850069593140
	.xword	0x54d0a127c45e6af3
	.xword	0xb1b65986c85e34e5
	.xword	0x003210a482e1cadc
	.xword	0xdbcb8cc82ac2b579
	.xword	0x7b58bcaf43f49522
	.xword	0xb865dadd68c5757f
	.xword	0x8ba688c460f19492
	.xword	0x13facd1e9afdd971
	.xword	0x397b0dad35a3303d
	.xword	0xfc709a36b69afa7e
	.xword	0x19e69e1e5e84933b
	.xword	0x9ed95cda9e82f513
	.xword	0x5148082f4e16b33a
	.xword	0x195ad3e91485c079
	.xword	0x58295824dec6f69b
	.xword	0x2857fefbe3013457
	.xword	0x6e71433356208de5
	.xword	0xf35f0dd3e1b0d79a
	.xword	0x3a17e4eaaf2a65c0
	.xword	0xe5b29606b98a5dd8
	.xword	0x80605c73b0344c76
	.xword	0x9a8bcc66e311af98
	.xword	0x8987f5049dbfc04f
	.xword	0x2a9ef205166ae980
	.xword	0xc5b60b4776e4734c
	.xword	0xbf1bf2377cbccefb
	.xword	0x94b540cf84113b15
	.xword	0x5988a3442d5ccb02
	.xword	0xc865e9468d734de7
	.xword	0xde2af16bd20ed6f3
	.xword	0xb44e4cee681d402a
	.xword	0xaba17ca04eb98411
	.xword	0x8dcc88701f99c06a
	.xword	0x7d59864a1e4e736a
	.xword	0xa7e0624b03f96391
	.xword	0x9db1959bd6a302c6
	.xword	0xd3ceb5686c14acec
	.xword	0x6bf60965b3b00c26
	.xword	0xfd0bfbd7f540ab60
	.align 0x80000
	.data
data_start_7:

	.xword	0xef1dd14448ba5678
	.xword	0x2a2c7f3683536718
	.xword	0x92300cc5a54ba54a
	.xword	0x8e87a7196d4c36b8
	.xword	0xce241038353ddc58
	.xword	0x760efd7862e53380
	.xword	0x35e3f2fa3b52b96d
	.xword	0x11918313f0f81e59
	.xword	0x72c4a826c81dcdd6
	.xword	0xbaabb30a2f47ae7f
	.xword	0x20a414a877286df7
	.xword	0x134e8a22809e0ca6
	.xword	0x42f0bf365f7b7369
	.xword	0x0984a8e56601b08e
	.xword	0xbe882542a19995f6
	.xword	0x10974d0aa53a56f0
	.xword	0x539e841ec6a66c4d
	.xword	0x5dccd6b14b34279c
	.xword	0x734f68511fcd3551
	.xword	0xe926052620bb5894
	.xword	0x7fe17a7b0c78126d
	.xword	0x018c886cb2c95613
	.xword	0xdc3ebce4f3d2e01f
	.xword	0xfd1fcb1c49e9c125
	.xword	0x8df00ad3ddbdcc3a
	.xword	0x2c4e19ab9693715e
	.xword	0x8f078cc89845939f
	.xword	0x7f58e4621ffd61d9
	.xword	0x71f6b88a3f3f2d1a
	.xword	0x0b55b6be7a583273
	.xword	0x92bf7dbfc9bbab25
	.xword	0xa4332e1520a376e5
	.xword	0xa2e33df069d34858
	.xword	0xfc6abafa6cadbbef
	.xword	0x16064ec9a4b93c30
	.xword	0xfc1c312be157cd3d
	.xword	0x08a66bf8de2477a1
	.xword	0x7582036907f21f97
	.xword	0x2dc0bb4703a89e0e
	.xword	0x9b2a01bcc6d409dc
	.xword	0xefd9247dbe41d767
	.xword	0x9d860dce978e5bd2
	.xword	0x9fb0a62a6218dd9c
	.xword	0x8932ca370ba53875
	.xword	0x90d3b57c825a8e8b
	.xword	0xf0247c0315f52b0e
	.xword	0xa868f8bd8d922c27
	.xword	0x96c9c4b64182b51c
	.xword	0x7581effe68bf49f5
	.xword	0xd44708a687be6880
	.xword	0x805852d0f38fa08d
	.xword	0x08ed2ebef903a9dc
	.xword	0x7209bb720732fa81
	.xword	0x71f9bf7b969c4e2b
	.xword	0x4c0187a5a07cf9b4
	.xword	0xff79ca0d476da660
	.xword	0x7f8f32094e749c12
	.xword	0xe7e3c99f6ebdef45
	.xword	0x9acd7b7b5c171e51
	.xword	0xce46fe680a0e32e7
	.xword	0x5981925d9b052578
	.xword	0xa235b2878c2bd685
	.xword	0x290627f23280971d
	.xword	0xa7ca66db7fabb4b1
	.xword	0xc208dd9d6a9a2b47
	.xword	0xa9ca4b14d8c2b10c
	.xword	0x99ecf07b81ed9abd
	.xword	0xaaf1d1c0bcb16d41
	.xword	0xe7380b8712418cd3
	.xword	0x755b72b2d7725fb5
	.xword	0x78c24ba4b44bd815
	.xword	0xef360c18a30cbd13
	.xword	0xf68da0ad1ac91a0e
	.xword	0x5c2268ab14997c24
	.xword	0x2ebac4eef4bb776a
	.xword	0x1a6511f97e7f35ca
	.xword	0x395136cfd0322692
	.xword	0xa1a45932a7648846
	.xword	0x6bef149556f0d48f
	.xword	0x88c1770ab625d472
	.xword	0x77d8169d13ba340e
	.xword	0xc55713400046ca09
	.xword	0x450e0f9e3fb19a94
	.xword	0xfd613f54b283fec4
	.xword	0x79c8372ab56e81b9
	.xword	0x7b2ac35224f47c9b
	.xword	0x641f67b8fe8891f3
	.xword	0x5d7f09510917d582
	.xword	0x171a52ccd9710e4a
	.xword	0x9578abdfbf162754
	.xword	0xcfa0bd4ed6ac2f91
	.xword	0xa2281249eb731d8b
	.xword	0x2b3a4926c22b7e1a
	.xword	0x3d35c544249accd5
	.xword	0x96768fc0a8f9a014
	.xword	0x87a9df405f53ebea
	.xword	0x95c4371f1a1e8edc
	.xword	0xfb2e5906762e232c
	.xword	0x98b5e71e66cd6fa4
	.xword	0xbb7aca22a246be87
	.xword	0xf8531aed3973e239
	.xword	0x6866794626164c76
	.xword	0x72d0cd7ee735680c
	.xword	0x9fd00cac771ec75e
	.xword	0xe8dfca363c96e3f0
	.xword	0xb29bc56f1540fdec
	.xword	0x01e01bf36f18e74a
	.xword	0x7f20f187fa6d1865
	.xword	0x069197877bdfe745
	.xword	0xe12b88ddeada50cb
	.xword	0x741ecbac5135d6ff
	.xword	0x4bf71f63b97a64b4
	.xword	0x732d56223d25b6d2
	.xword	0xdb0611ad255a92ce
	.xword	0xbd03be090097d9fc
	.xword	0xbb116bdc9dc6f6ca
	.xword	0x2069084a6f700c5c
	.xword	0x7a7452db9b8610cb
	.xword	0x171295b0093849c2
	.xword	0x9fb5dbd9ce605609
	.xword	0xcf7ce012ecfc37c6
	.xword	0x6d988ebe70706633
	.xword	0x6b05438a2f1a8261
	.xword	0xe6a0dbb045c7613f
	.xword	0xbeb638c1750ee8c8
	.xword	0x75c2fcadb0c564b1
	.xword	0x466b6c36abe94b68
	.xword	0x25c31cfab4b311d2
	.xword	0xac27ae6577fc3535
	.xword	0xaf55c2abee7836df
	.xword	0x97c9bea393a91331
	.xword	0x3bbd95548e56eb1c
	.xword	0xea3aca7bf78e48a3
	.xword	0x433f02219f6570d0
	.xword	0x61133d4cdf48bd53
	.xword	0x55f7569b29d19e0b
	.xword	0x0bd4105cfbacd47e
	.xword	0x60338cdce8b55694
	.xword	0x8b6f596979b55233
	.xword	0xe0b1e5526a98ce0b
	.xword	0x2124469e336632ca
	.xword	0xbc84facbff95ccc9
	.xword	0x5054d99d6ae27d60
	.xword	0x84d9f4533abd1f6f
	.xword	0x634f616f8d247fd9
	.xword	0x2d47126c750801f1
	.xword	0x1145934f10861f6a
	.xword	0x66f4afafb823d43d
	.xword	0x138d6836c53afb84
	.xword	0xc29d92b4b03117e8
	.xword	0xbe37d5fe91589297
	.xword	0x2795a6efe77e4205
	.xword	0x31f5f916d7f8c37e
	.xword	0x78c1eb3f7966f54c
	.xword	0xfde3379804e9cf89
	.xword	0xd4ea5cf1ae3b8447
	.xword	0xbf2bdef1ee2c9b9f
	.xword	0xe3b6f34193209ca7
	.xword	0x9a810de396c369b3
	.xword	0xf11ebc1bd9176a77
	.xword	0xb9998556d05d0cc9
	.xword	0x2624bc91d5929997
	.xword	0x63f3e854cd3f73bc
	.xword	0x41474a9599c1fc2f
	.xword	0x63b9cffc876b5550
	.xword	0xdd00813c7732663c
	.xword	0xeb5a745d06025aab
	.xword	0x246299f314848288
	.xword	0x9735576d925f4f19
	.xword	0x11290bd0b13bed38
	.xword	0xcf5ba74e81f31350
	.xword	0x2f696a1e4372215a
	.xword	0x94fab2e391b895cd
	.xword	0x2b505fd373c7fee0
	.xword	0x8b07bfb71fa99967
	.xword	0xbf8ac5188fac4d7c
	.xword	0xd640e1dc667ca905
	.xword	0x7421a83802319eb7
	.xword	0x9637feb99476bed8
	.xword	0x45b5d3f068d11f90
	.xword	0xbd631573b0548668
	.xword	0x58888d22458abf82
	.xword	0x4bcc10d3255fc943
	.xword	0x8c6cb76bf13c9332
	.xword	0x3a1d9f10589e6cb3
	.xword	0xb811e7f673b2f271
	.xword	0x650a512430847723
	.xword	0xe1991b4f735f5e99
	.xword	0xf1fe5dcb245dcf9b
	.xword	0xe3a314b46f28cedb
	.xword	0x7d586335751ad93e
	.xword	0xefcbd3b2e2c31116
	.xword	0xd47a70a8a36ebb21
	.xword	0x97bd0e06cce08541
	.xword	0xfcd4e02d791b6104
	.xword	0x3c1f3ebc3ac1b6b0
	.xword	0xd14dd2f3bb5cc212
	.xword	0x508c4e33e1cce025
	.xword	0x0df2949857ac1317
	.xword	0x47065cbbe7c3e775
	.xword	0xa622776710ff5b1b
	.xword	0x2e55e06f4cc675f7
	.xword	0x673aa146bf0b75d9
	.xword	0xa8eb21235010d89b
	.xword	0x9cc8844fe8374776
	.xword	0x17a7cf3197ecf15c
	.xword	0xef85dffdf6c0c7d5
	.xword	0xc7544228c2c6d696
	.xword	0x20671240663a70cb
	.xword	0x867a0175204ffc25
	.xword	0x3e305056e7410013
	.xword	0x73be5a5950610677
	.xword	0xecb4f56a3230d6d5
	.xword	0x679d13e5a7316013
	.xword	0x8342b1da84edfba9
	.xword	0x714cc0407be06d07
	.xword	0x6e6ff54159410f2e
	.xword	0xf737f55c4b4c0d42
	.xword	0xa3eb37e45d88ec80
	.xword	0x7dbf8f15aa2de26b
	.xword	0x96f1c2165af34d28
	.xword	0xa2252e825f1113db
	.xword	0xf115f4ddb9b026be
	.xword	0x034223796987b7c2
	.xword	0x1dedea6c6ed81086
	.xword	0xd186ea9624ad42e4
	.xword	0xea669c63da8e0b5b
	.xword	0x958beaee7a444270
	.xword	0x7096aeda22ae3318
	.xword	0x22466974d72252e8
	.xword	0xf723d2dff42e8070
	.xword	0xc0116a8b2e15ba3b
	.xword	0x7aa4694e550524e6
	.xword	0xbc3e4579bd94ac26
	.xword	0x2bd84d3f9b9d2b2e
	.xword	0xfc2dd6e8ab5d9c88
	.xword	0xcca7fac5d3f87159
	.xword	0x8b5e56da0f4d75e8
	.xword	0x6aab2af12f97a388
	.xword	0xc8c0bebbf2a8f521
	.xword	0xdcc3d2faedf0e761
	.xword	0x19f942228aee66f2
	.xword	0x2e4f1c5c2e01487a
	.xword	0x4965ca8ff2cb9dd7
	.xword	0x11684d1b0234e832
	.xword	0x7e644846db785253
	.xword	0x4592f8a4d7b74a13
	.xword	0x3e252f36ce868322
	.xword	0x238d9fa45468259d
	.xword	0x5a061e58c4d1faa3
	.xword	0x7b0c78592d729fc4
	.xword	0xce36a7bd71060b37
	.xword	0xe751f96789ddca7e
	.xword	0xe8e99ad823ef64bb
	.xword	0xf9bd4e4852904502
	.xword	0x621a0e0a502afb73



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
