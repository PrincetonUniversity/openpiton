// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_48_s2.s
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
   random seed:	983309206
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

	setx 0x6f8f8d8c7a0c138f, %g1, %g0
	setx 0x6cfb5ddce739e9b7, %g1, %g1
	setx 0x4097deee8d4336e0, %g1, %g2
	setx 0xb58e1e90f9e0768b, %g1, %g3
	setx 0xf3bf566b481a7636, %g1, %g4
	setx 0x6724346be09bd1f2, %g1, %g5
	setx 0x42383c4bf5a8cefa, %g1, %g6
	setx 0xe678595b404d4cb2, %g1, %g7
	setx 0xce1fcf955c6a090e, %g1, %r16
	setx 0x904533295e073096, %g1, %r17
	setx 0x4c7925542da33912, %g1, %r18
	setx 0xf0c8e5776678c70c, %g1, %r19
	setx 0x60ebf979d6c7a3c6, %g1, %r20
	setx 0xb43807d4d05da454, %g1, %r21
	setx 0x5d0d193511e38e56, %g1, %r22
	setx 0xc3b9bdaf7c3497a6, %g1, %r23
	setx 0x585ecbd18683dd6f, %g1, %r24
	setx 0xf64533b834cb5b65, %g1, %r25
	setx 0xf642b653cffa2dc4, %g1, %r26
	setx 0xe482df6f1ab30f82, %g1, %r27
	setx 0xc40474adae780aeb, %g1, %r28
	setx 0xa4686a11db45062c, %g1, %r29
	setx 0xbbfe9eac148e0e51, %g1, %r30
	setx 0xea9e912ce2d56dfc, %g1, %r31
	save
	setx 0xa37c9720780dcf45, %g1, %r16
	setx 0x7b2d89079557ec2a, %g1, %r17
	setx 0x64a85eeb11a1f4a2, %g1, %r18
	setx 0xaf67f52931acc200, %g1, %r19
	setx 0xd1084537dc1a2495, %g1, %r20
	setx 0xc331310275e809eb, %g1, %r21
	setx 0x622fd1e0f68cd6f8, %g1, %r22
	setx 0xb200089739d42c9b, %g1, %r23
	setx 0xbf43852f064f8d7b, %g1, %r24
	setx 0xdd921939f1305389, %g1, %r25
	setx 0xe3e420e8d8b435f5, %g1, %r26
	setx 0x95ac6036dff6daad, %g1, %r27
	setx 0xce189f4fc860dd6e, %g1, %r28
	setx 0x1008f93f39daff21, %g1, %r29
	setx 0x26ab761f343c89fa, %g1, %r30
	setx 0x03076e97fb527344, %g1, %r31
	save
	setx 0x63cfb989a6ca8811, %g1, %r16
	setx 0xdfaa85e775b78a8a, %g1, %r17
	setx 0x5483c74910f275dd, %g1, %r18
	setx 0x61d7995539e5012a, %g1, %r19
	setx 0x3725ea3d1f71f5d6, %g1, %r20
	setx 0x2ed64ca4f4bebea7, %g1, %r21
	setx 0x8ee75080e3d7ddec, %g1, %r22
	setx 0xe880dcee50863064, %g1, %r23
	setx 0x35b585b25b63f2f1, %g1, %r24
	setx 0x82c15f586f6b8e84, %g1, %r25
	setx 0x3a1033d2e48a0ec0, %g1, %r26
	setx 0xbe6ae33362b1310a, %g1, %r27
	setx 0x2e56265857d426f2, %g1, %r28
	setx 0xd85492a8a06ecc1e, %g1, %r29
	setx 0x4d9ee219b2bb243a, %g1, %r30
	setx 0x80d38cc34105fd2a, %g1, %r31
	save
	setx 0x5a105f84bfc4d55b, %g1, %r16
	setx 0xfb1f1198864958ce, %g1, %r17
	setx 0x2748f37017cc3709, %g1, %r18
	setx 0x0865c4132ef92b57, %g1, %r19
	setx 0x784b4a5d9b2c54fd, %g1, %r20
	setx 0x18c504335b76b57c, %g1, %r21
	setx 0x1794872417ee6cb5, %g1, %r22
	setx 0x9656e9e544d07c07, %g1, %r23
	setx 0x8929c2da0e1fdf4d, %g1, %r24
	setx 0x9ffc2ae3341dd1ea, %g1, %r25
	setx 0x9b641be438747944, %g1, %r26
	setx 0x9878beb4c9531a8a, %g1, %r27
	setx 0xaed4948bfa24cb9d, %g1, %r28
	setx 0x12b48938497fe2ff, %g1, %r29
	setx 0x869d9bd7679c716e, %g1, %r30
	setx 0xac91aff6ac303acd, %g1, %r31
	save
	setx 0xf34245dddc1e1c80, %g1, %r16
	setx 0x5efb5123821b47d4, %g1, %r17
	setx 0x2576f53c2a78ef14, %g1, %r18
	setx 0x676e5adc9dc16b17, %g1, %r19
	setx 0xc931db7eded4f1a3, %g1, %r20
	setx 0x0564241f9ec619b7, %g1, %r21
	setx 0xc08cd2df6c421f9f, %g1, %r22
	setx 0xb9b4716a191266cf, %g1, %r23
	setx 0x1c5a9b03957805e8, %g1, %r24
	setx 0x72c1fe250866a3d0, %g1, %r25
	setx 0x52773f432c169ec0, %g1, %r26
	setx 0xb0df60d8d08daf10, %g1, %r27
	setx 0xe9a382ba9c3a0900, %g1, %r28
	setx 0x068e51198d602790, %g1, %r29
	setx 0x9362c342fb44876e, %g1, %r30
	setx 0x8ae8222b7312f3ff, %g1, %r31
	save
	setx 0x2231e29b36143900, %g1, %r16
	setx 0xab15e94d35c4b2e1, %g1, %r17
	setx 0x2cb0a42760f912ae, %g1, %r18
	setx 0xe88f2d87e005d2d7, %g1, %r19
	setx 0x0ac523ac02fa70a8, %g1, %r20
	setx 0x5138a1641d94bef9, %g1, %r21
	setx 0x205aef6f821cf69a, %g1, %r22
	setx 0xba240f27564acec0, %g1, %r23
	setx 0xc267a3b68d43f843, %g1, %r24
	setx 0x9d5de184e3b30798, %g1, %r25
	setx 0xc1d9be72c7452bfb, %g1, %r26
	setx 0x75302fd05669c83d, %g1, %r27
	setx 0xcdc189e46d55c6e0, %g1, %r28
	setx 0x497a434d2b42bdb0, %g1, %r29
	setx 0x0c9513c125c3bf90, %g1, %r30
	setx 0x89028c3553b77408, %g1, %r31
	save
	setx 0x97ebe0f56adb792b, %g1, %r16
	setx 0xe05363764e631518, %g1, %r17
	setx 0xfd57f31a75a013be, %g1, %r18
	setx 0x569650dde3a26dec, %g1, %r19
	setx 0x64d22937a382408a, %g1, %r20
	setx 0x063aeb2972d8b961, %g1, %r21
	setx 0x7c8075d23b873203, %g1, %r22
	setx 0x313e33c29cf2f910, %g1, %r23
	setx 0x013b9204666634bd, %g1, %r24
	setx 0x6ef82f327aa49ad2, %g1, %r25
	setx 0xcb3764397c349af1, %g1, %r26
	setx 0x6ff0246bb0aa74f2, %g1, %r27
	setx 0x4f5cb64a7f125fb0, %g1, %r28
	setx 0x09a3cca0b2583d2b, %g1, %r29
	setx 0x3c9ca2ea1b5bd1d4, %g1, %r30
	setx 0x0822dbc3b3f8645b, %g1, %r31
	save
	setx 0x8629f5236aa98796, %g1, %r16
	setx 0xf1a029428d34dbac, %g1, %r17
	setx 0xec1f8d81de928eaa, %g1, %r18
	setx 0x822051e031b9fcbe, %g1, %r19
	setx 0x088d4c47c498d3f5, %g1, %r20
	setx 0x4eab6ab9d7fb1db8, %g1, %r21
	setx 0xae5550c0fdf24b3e, %g1, %r22
	setx 0xc49b4e75cd188ae2, %g1, %r23
	setx 0x86b48f7a08cfb80a, %g1, %r24
	setx 0x8dc28eb533570917, %g1, %r25
	setx 0x213599333f8615d3, %g1, %r26
	setx 0x816b5b21542818c1, %g1, %r27
	setx 0xd9beb77f8efcb636, %g1, %r28
	setx 0x71621fe2466acde4, %g1, %r29
	setx 0xe1dd43fb4fd51de1, %g1, %r30
	setx 0xac57a9e65111c773, %g1, %r31
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
	.word 0xbfe5a06a  ! 1: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e460aa  ! 7: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4254000  ! 10: SUB_R	sub 	%r21, %r0, %r26
	.word 0x8395e0cc  ! 12: WRPR_TNPC_I	wrpr	%r23, 0x00cc, %tnpc
	.word 0xbf504000  ! 13: RDPR_TNPC	<illegal instruction>
	.word 0xb5e561bd  ! 14: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5a11c  ! 16: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e56190  ! 17: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5614d  ! 20: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e460a8  ! 25: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5e188  ! 26: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5a0c8  ! 28: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a05a  ! 31: WRPR_TICK_I	wrpr	%r18, 0x005a, %tick
	.word 0xbfe5a0ad  ! 37: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5a162  ! 38: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x85956079  ! 40: WRPR_TSTATE_I	wrpr	%r21, 0x0079, %tstate
	.word 0xb5500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0xb7520000  ! 49: RDPR_PIL	<illegal instruction>
	.word 0xb1e5203a  ! 50: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e0ae  ! 59: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5602a  ! 64: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbd7ce401  ! 67: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xb3518000  ! 70: RDPR_PSTATE	<illegal instruction>
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 83: RDPR_PSTATE	<illegal instruction>
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 89: RDPR_TNPC	<illegal instruction>
	.word 0xb751c000  ! 91: RDPR_TL	<illegal instruction>
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1b1  ! 93: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_4, %g1, %r22
	.word 0x8594209f  ! 99: WRPR_TSTATE_I	wrpr	%r16, 0x009f, %tstate
	.word 0xb9e5205c  ! 110: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e421aa  ! 111: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43c0000  ! 114: XNOR_R	xnor 	%r16, %r0, %r26
	.word 0xbfe5e19a  ! 116: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 117: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983fd3  ! 127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd3, %hpstate
	.word 0xb7510000  ! 130: RDPR_TICK	<illegal instruction>
	.word 0xb3e4e1ea  ! 137: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x89956146  ! 139: WRPR_TICK_I	wrpr	%r21, 0x0146, %tick
	.word 0xbde5e0bc  ! 140: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x83942025  ! 141: WRPR_TNPC_I	wrpr	%r16, 0x0025, %tnpc
	.word 0x8d95a1d4  ! 142: WRPR_PSTATE_I	wrpr	%r22, 0x01d4, %pstate
	.word 0xb5e4a07b  ! 144: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e46148  ! 148: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e42047  ! 149: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7518000  ! 150: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a0e5  ! 152: WRPR_TT_I	wrpr	%r22, 0x00e5, %tt
	.word 0x8d95e16a  ! 155: WRPR_PSTATE_I	wrpr	%r23, 0x016a, %pstate
	.word 0xb9e560f0  ! 157: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbcb561fb  ! 159: ORNcc_I	orncc 	%r21, 0x01fb, %r30
	.word 0xb9e521fb  ! 161: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde460fb  ! 164: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbcadc000  ! 165: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0x91952098  ! 166: WRPR_PIL_I	wrpr	%r20, 0x0098, %pil
	.word 0xbbe56006  ! 167: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb2ac6119  ! 170: ANDNcc_I	andncc 	%r17, 0x0119, %r25
	.word 0xbbe5e1ca  ! 173: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8d9420c6  ! 174: WRPR_PSTATE_I	wrpr	%r16, 0x00c6, %pstate
	.word 0xb7e5618e  ! 178: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a110  ! 185: WRPR_TSTATE_I	wrpr	%r18, 0x0110, %tstate
	setx	data_start_2, %g1, %r19
	.word 0xb1e5e185  ! 187: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982edb  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	setx	data_start_2, %g1, %r22
	.word 0xb1e561e3  ! 192: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4e0ab  ! 197: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5e168  ! 199: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e521b8  ! 202: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbc1520c6  ! 203: OR_I	or 	%r20, 0x00c6, %r30
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xbbe5200a  ! 207: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4e10b  ! 208: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8394a0f0  ! 210: WRPR_TNPC_I	wrpr	%r18, 0x00f0, %tnpc
	.word 0xbde5e11f  ! 211: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_6, %g1, %r20
	.word 0xb1e4211d  ! 213: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5a144  ! 215: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe56124  ! 218: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a070  ! 221: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a116  ! 225: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8195e186  ! 226: WRPR_TPC_I	wrpr	%r23, 0x0186, %tpc
	.word 0xb3e4a128  ! 229: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9643801  ! 232: MOVcc_I	<illegal instruction>
	.word 0xbf540000  ! 234: RDPR_GL	<illegal instruction>
	.word 0x91956079  ! 239: WRPR_PIL_I	wrpr	%r21, 0x0079, %pil
	.word 0xb9e5a077  ! 241: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_1, %g1, %r18
	.word 0xb3e4a0ee  ! 244: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb4b52178  ! 249: SUBCcc_I	orncc 	%r20, 0x0178, %r26
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4848000  ! 251: ADDcc_R	addcc 	%r18, %r0, %r26
	setx	0x117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5612d  ! 255: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x3d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4616f  ! 261: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e52184  ! 264: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e4e183  ! 265: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x81946091  ! 266: WRPR_TPC_I	wrpr	%r17, 0x0091, %tpc
	.word 0xbf508000  ! 267: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4e113  ! 269: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e5e0aa  ! 271: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5e1a1  ! 276: SAVE_I	save	%r23, 0x0001, %r31
	mov	2, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e4a198  ! 283: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4e1a7  ! 287: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a099  ! 289: WRPR_TT_I	wrpr	%r18, 0x0099, %tt
	.word 0xb7e4a1c8  ! 290: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4618f  ! 296: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb63c4000  ! 298: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xb7e56014  ! 300: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbeac61d0  ! 301: ANDNcc_I	andncc 	%r17, 0x01d0, %r31
	.word 0xbf500000  ! 303: RDPR_TPC	<illegal instruction>
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x123, %g1, %o0
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
	.word 0xbde42017  ! 314: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb97ca401  ! 317: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xb7e4210f  ! 318: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbe9521ee  ! 319: ORcc_I	orcc 	%r20, 0x01ee, %r31
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4205b  ! 324: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4216c  ! 329: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb81d8000  ! 335: XOR_R	xor 	%r22, %r0, %r28
	.word 0xb1518000  ! 337: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4e13f  ! 338: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e42062  ! 340: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb0a4a076  ! 342: SUBcc_I	subcc 	%r18, 0x0076, %r24
	.word 0xbbe5e1d6  ! 346: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf3c6001  ! 347: SRA_I	sra 	%r17, 0x0001, %r31
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0c8  ! 350: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0xbcc40000  ! 354: ADDCcc_R	addccc 	%r16, %r0, %r30
	.word 0xb7e4e184  ! 356: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 358: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982b59  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	.word 0xb3e4217d  ! 364: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e521c4  ! 365: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5a17d  ! 369: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde561ea  ! 370: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbb500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xb93da001  ! 373: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xbde4610e  ! 375: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e12c  ! 378: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd540000  ! 379: RDPR_GL	<illegal instruction>
	.word 0xb3e42114  ! 381: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e561c4  ! 383: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e46121  ! 385: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5a1d1  ! 386: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5a0c2  ! 393: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4216d  ! 394: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e560d1  ! 396: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5e13e  ! 397: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9508000  ! 398: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e46090  ! 400: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7504000  ! 402: RDPR_TNPC	<illegal instruction>
	.word 0xb4040000  ! 404: ADD_R	add 	%r16, %r0, %r26
	.word 0xb0848000  ! 405: ADDcc_R	addcc 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde460c1  ! 407: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde46042  ! 410: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4e1e0  ! 414: SAVE_I	save	%r19, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5607e  ! 418: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4e143  ! 419: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a0ea  ! 422: SAVE_I	save	%r18, 0x0001, %r28
	mov	2, %r14
	.word 0xa193a000  ! 425: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e038  ! 429: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4e033  ! 430: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198388b  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188b, %hpstate
	.word 0xb9e461f8  ! 437: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd3d8000  ! 440: SRA_R	sra 	%r22, %r0, %r30
	.word 0xbe15c000  ! 441: OR_R	or 	%r23, %r0, %r31
	.word 0xb5e5e080  ! 443: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5a15b  ! 444: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3500000  ! 447: RDPR_TPC	<illegal instruction>
	.word 0xbfe52085  ! 449: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe4201c  ! 456: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb494c000  ! 458: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xb7e5e07a  ! 466: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e42061  ! 469: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5e020  ! 470: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe448000  ! 478: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xb1e5e1f6  ! 480: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e420d4  ! 481: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xba0c60fe  ! 493: AND_I	and 	%r17, 0x00fe, %r29
	.word 0xb7e5e02e  ! 494: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e4a1f6  ! 498: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb22521a5  ! 503: SUB_I	sub 	%r20, 0x01a5, %r25
	.word 0xbfe521b7  ! 508: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5500000  ! 512: RDPR_TPC	<illegal instruction>
	.word 0x859521b0  ! 514: WRPR_TSTATE_I	wrpr	%r20, 0x01b0, %tstate
	.word 0xb9510000  ! 515: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 517: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5e06f  ! 520: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a197  ! 523: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb550c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0xbfe5a1f5  ! 530: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb8148000  ! 531: OR_R	or 	%r18, %r0, %r28
	.word 0xb4bde00a  ! 533: XNORcc_I	xnorcc 	%r23, 0x000a, %r26
	.word 0x8994e155  ! 534: WRPR_TICK_I	wrpr	%r19, 0x0155, %tick
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a16a  ! 536: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d95a02d  ! 538: WRPR_PSTATE_I	wrpr	%r22, 0x002d, %pstate
	.word 0xbde4a028  ! 539: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42054  ! 546: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde46059  ! 549: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde4e12a  ! 551: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e46139  ! 553: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_1, %g1, %r18
	.word 0xbfe56142  ! 556: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e4e0ec  ! 558: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd51c000  ! 559: RDPR_TL	<illegal instruction>
	.word 0xba1c604e  ! 562: XOR_I	xor 	%r17, 0x004e, %r29
	.word 0xb5e5a1fd  ! 563: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 565: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982993  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0xbd508000  ! 570: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4e0e6  ! 576: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5a05f  ! 577: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde421ab  ! 578: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e52068  ! 581: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e56098  ! 584: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4a1f8  ! 588: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4209d  ! 590: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8194202f  ! 594: WRPR_TPC_I	wrpr	%r16, 0x002f, %tpc
	mov	0, %r12
	.word 0x8f932000  ! 596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983f93  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f93, %hpstate
	.word 0xbde4e1dc  ! 600: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x10022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0cd  ! 609: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d95e0ed  ! 612: WRPR_PSTATE_I	wrpr	%r23, 0x00ed, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd520000  ! 625: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983edb  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edb, %hpstate
	.word 0xb5e4e116  ! 628: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5210f  ! 632: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe4e057  ! 633: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5a1b4  ! 634: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbf2d0000  ! 635: SLL_R	sll 	%r20, %r0, %r31
	mov	2, %r12
	.word 0x8f932000  ! 636: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e5a029  ! 638: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e46179  ! 640: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9540000  ! 641: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5619a  ! 643: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e4a1e4  ! 644: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe42043  ! 646: SAVE_I	save	%r16, 0x0001, %r29
	mov	0, %r14
	.word 0xa193a000  ! 648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8395207f  ! 649: WRPR_TNPC_I	wrpr	%r20, 0x007f, %tnpc
	.word 0xb1e4e1c8  ! 651: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb6244000  ! 652: SUB_R	sub 	%r17, %r0, %r27
	.word 0xb9e460e6  ! 655: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4e117  ! 659: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4a19e  ! 660: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe421e1  ! 662: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e521b8  ! 664: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde521d3  ! 667: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4617c  ! 668: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb29cc000  ! 669: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb4b42056  ! 672: ORNcc_I	orncc 	%r16, 0x0056, %r26
	.word 0xb3520000  ! 674: RDPR_PIL	<illegal instruction>
	.word 0xb32dc000  ! 676: SLL_R	sll 	%r23, %r0, %r25
	.word 0xb1520000  ! 678: RDPR_PIL	<illegal instruction>
	.word 0xbde5e05b  ! 679: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8594a07a  ! 680: WRPR_TSTATE_I	wrpr	%r18, 0x007a, %tstate
	.word 0xbbe46002  ! 683: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc2d4000  ! 695: ANDN_R	andn 	%r21, %r0, %r30
	.word 0xb3e461fc  ! 696: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe46159  ! 700: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r14
	.word 0xa193a000  ! 701: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5e19c  ! 715: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e52041  ! 717: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_3, %g1, %r21
	.word 0x8195e199  ! 724: WRPR_TPC_I	wrpr	%r23, 0x0199, %tpc
	.word 0xbfe4a128  ! 731: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4a0c6  ! 732: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4e1f4  ! 739: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4e0a8  ! 740: SAVE_I	save	%r19, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 742: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5520000  ! 746: RDPR_PIL	<illegal instruction>
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40ce0f8  ! 756: AND_I	and 	%r19, 0x00f8, %r26
	.word 0xbbe5a021  ! 757: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5611b  ! 758: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e461ca  ! 760: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5e076  ! 763: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4a095  ! 764: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb89cc000  ! 765: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xb3e4e157  ! 767: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4a1aa  ! 770: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42035  ! 772: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e52172  ! 773: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba3560f4  ! 783: SUBC_I	orn 	%r21, 0x00f4, %r29
	.word 0xb1508000  ! 784: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4a1aa  ! 785: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e13c  ! 786: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbde17d  ! 791: XNORcc_I	xnorcc 	%r23, 0x017d, %r30
	mov	1, %r14
	.word 0xa193a000  ! 794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5e038  ! 803: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e42001  ! 804: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe461ed  ! 805: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5613d  ! 808: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e56176  ! 812: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x859460f2  ! 817: WRPR_TSTATE_I	wrpr	%r17, 0x00f2, %tstate
	.word 0xb53de001  ! 820: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xb7e46016  ! 821: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4612b  ! 822: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8194e0b8  ! 824: WRPR_TPC_I	wrpr	%r19, 0x00b8, %tpc
	.word 0xb5641800  ! 825: MOVcc_R	<illegal instruction>
	.word 0xb5e4a1fc  ! 831: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4216d  ! 833: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb151c000  ! 836: RDPR_TL	<illegal instruction>
	.word 0xb7e420d3  ! 837: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42146  ! 841: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4617d  ! 842: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbebca153  ! 843: XNORcc_I	xnorcc 	%r18, 0x0153, %r31
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e032  ! 850: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5a0b4  ! 852: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe56060  ! 856: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e52193  ! 857: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d95e1db  ! 863: WRPR_PSTATE_I	wrpr	%r23, 0x01db, %pstate
	.word 0xbbe561d9  ! 864: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460a3  ! 870: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5608c  ! 872: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbc2da03a  ! 873: ANDN_I	andn 	%r22, 0x003a, %r30
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4607d  ! 876: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb500000  ! 879: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 881: RDPR_GL	<illegal instruction>
	setx	0x10338, %g1, %o0
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
	.word 0x9195a065  ! 887: WRPR_PIL_I	wrpr	%r22, 0x0065, %pil
	.word 0xbd510000  ! 892: RDPR_TICK	<illegal instruction>
	.word 0xb3e4e052  ! 895: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e461f6  ! 896: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8394a0e2  ! 899: WRPR_TNPC_I	wrpr	%r18, 0x00e2, %tnpc
	.word 0xbc356128  ! 900: ORN_I	orn 	%r21, 0x0128, %r30
	.word 0x8595e093  ! 901: WRPR_TSTATE_I	wrpr	%r23, 0x0093, %tstate
	.word 0xbe2de143  ! 902: ANDN_I	andn 	%r23, 0x0143, %r31
	.word 0xbbe420a9  ! 905: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe420fb  ! 906: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4614f  ! 907: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a0a0  ! 911: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0952016  ! 913: ORcc_I	orcc 	%r20, 0x0016, %r24
	.word 0xb6bc8000  ! 915: XNORcc_R	xnorcc 	%r18, %r0, %r27
	mov	0, %r12
	.word 0x8f932000  ! 917: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbeb52018  ! 921: ORNcc_I	orncc 	%r20, 0x0018, %r31
	setx	0x10, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1ed  ! 926: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e4213b  ! 927: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e42119  ! 929: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1643801  ! 930: MOVcc_I	<illegal instruction>
	.word 0xb3e4a15d  ! 932: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4205b  ! 933: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_1, %g1, %r19
	.word 0xb1e56199  ! 937: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbf520000  ! 940: RDPR_PIL	<illegal instruction>
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1c3  ! 943: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbf520000  ! 944: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a04e  ! 947: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e09c  ! 952: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a171  ! 956: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4e199  ! 958: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb2ad21e8  ! 959: ANDNcc_I	andncc 	%r20, 0x01e8, %r25
	.word 0xb5e4a069  ! 960: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e4a134  ! 964: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb13cc000  ! 970: SRA_R	sra 	%r19, %r0, %r24
	.word 0xbb2d0000  ! 973: SLL_R	sll 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e52159  ! 975: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d9420fe  ! 983: WRPR_PSTATE_I	wrpr	%r16, 0x00fe, %pstate
	.word 0xb7480000  ! 986: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5218f  ! 989: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde52135  ! 990: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198395b  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195b, %hpstate
	.word 0xb81da10a  ! 994: XOR_I	xor 	%r22, 0x010a, %r28
	.word 0xbfe42080  ! 995: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb6348000  ! 996: SUBC_R	orn 	%r18, %r0, %r27
	setx	0x20208, %g1, %o0
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
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4210a  ! 1003: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8194e174  ! 1008: WRPR_TPC_I	wrpr	%r19, 0x0174, %tpc
	.word 0xbfe4a067  ! 1012: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e521be  ! 1014: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4e1c9  ! 1017: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb350c000  ! 1018: RDPR_TT	<illegal instruction>
	.word 0xb9e420a1  ! 1019: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4e04d  ! 1020: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3510000  ! 1022: RDPR_TICK	<illegal instruction>
	.word 0xb17c6401  ! 1023: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbbe5612b  ! 1025: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5e060  ! 1028: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e46111  ! 1033: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e52117  ! 1034: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e52139  ! 1035: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde42030  ! 1036: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb53d9000  ! 1040: SRAX_R	srax	%r22, %r0, %r26
	.word 0xb5e52013  ! 1043: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9518000  ! 1045: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5607f  ! 1048: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 1051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xbd50c000  ! 1054: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5540000  ! 1057: RDPR_GL	<illegal instruction>
	.word 0xbbe42104  ! 1058: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba04c000  ! 1059: ADD_R	add 	%r19, %r0, %r29
	.word 0xb3e5a0ed  ! 1062: SAVE_I	save	%r22, 0x0001, %r25
	setx	data_start_3, %g1, %r17
	.word 0x8594619a  ! 1068: WRPR_TSTATE_I	wrpr	%r17, 0x019a, %tstate
	.word 0xbde4a067  ! 1070: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8395e0aa  ! 1071: WRPR_TNPC_I	wrpr	%r23, 0x00aa, %tnpc
	.word 0xbfe4a0cb  ! 1072: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb150c000  ! 1073: RDPR_TT	<illegal instruction>
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe420e5  ! 1082: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4a023  ! 1086: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0e0  ! 1089: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4a0d9  ! 1093: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb215e01b  ! 1101: OR_I	or 	%r23, 0x001b, %r25
	.word 0xbfe42174  ! 1104: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5a061  ! 1105: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb025a0dc  ! 1108: SUB_I	sub 	%r22, 0x00dc, %r24
	.word 0xb1e4a125  ! 1110: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde56054  ! 1111: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde5e024  ! 1112: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5e04a  ! 1113: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x81942035  ! 1115: WRPR_TPC_I	wrpr	%r16, 0x0035, %tpc
	.word 0xbde5a1cd  ! 1121: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb41ce046  ! 1122: XOR_I	xor 	%r19, 0x0046, %r26
	.word 0x9195e1bf  ! 1123: WRPR_PIL_I	wrpr	%r23, 0x01bf, %pil
	.word 0xb5e56030  ! 1124: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4a012  ! 1125: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5e0d1  ! 1128: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4e108  ! 1129: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4e051  ! 1130: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf500000  ! 1132: RDPR_TPC	<illegal instruction>
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1134: RDPR_TICK	<illegal instruction>
	.word 0xbfe42012  ! 1136: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb2a58000  ! 1137: SUBcc_R	subcc 	%r22, %r0, %r25
	.word 0xb3e4e1fe  ! 1139: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e52168  ! 1140: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8d956109  ! 1141: WRPR_PSTATE_I	wrpr	%r21, 0x0109, %pstate
	.word 0xb2ade076  ! 1142: ANDNcc_I	andncc 	%r23, 0x0076, %r25
	.word 0x8394a151  ! 1143: WRPR_TNPC_I	wrpr	%r18, 0x0151, %tnpc
	.word 0xbf346001  ! 1144: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xb1e5a17d  ! 1145: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e520b5  ! 1147: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r14
	.word 0xa193a000  ! 1151: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5504000  ! 1152: RDPR_TNPC	<illegal instruction>
	.word 0xbb510000  ! 1155: RDPR_TICK	<illegal instruction>
	.word 0xbde56121  ! 1157: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4e0dd  ! 1159: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe4a101  ! 1160: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe5a015  ! 1162: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e520bf  ! 1167: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe5216c  ! 1168: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e461de  ! 1171: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd520000  ! 1173: RDPR_PIL	<illegal instruction>
	.word 0xb9e4e0b9  ! 1174: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde42026  ! 1175: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5540000  ! 1185: RDPR_GL	<illegal instruction>
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2c7001  ! 1189: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb9e52034  ! 1190: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb72c7001  ! 1193: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xba144000  ! 1194: OR_R	or 	%r17, %r0, %r29
	.word 0xbde421f8  ! 1196: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd7da401  ! 1201: MOVR_I	movre	%r22, 0x1, %r30
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983891  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1891, %hpstate
	.word 0xbd3da001  ! 1206: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xb3e4a057  ! 1210: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a066  ! 1215: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982e11  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e11, %hpstate
	.word 0xb5e4e126  ! 1221: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x83946071  ! 1226: WRPR_TNPC_I	wrpr	%r17, 0x0071, %tnpc
	.word 0x8594213e  ! 1228: WRPR_TSTATE_I	wrpr	%r16, 0x013e, %tstate
	.word 0x91956152  ! 1229: WRPR_PIL_I	wrpr	%r21, 0x0152, %pil
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a17e  ! 1234: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5a0eb  ! 1235: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xba04a1ff  ! 1239: ADD_I	add 	%r18, 0x01ff, %r29
	.word 0x8d95e0ff  ! 1240: WRPR_PSTATE_I	wrpr	%r23, 0x00ff, %pstate
	.word 0xbb540000  ! 1243: RDPR_GL	<illegal instruction>
	.word 0xb9e4e1f3  ! 1246: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb4c58000  ! 1249: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xb9e4a1c7  ! 1250: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x83942032  ! 1253: WRPR_TNPC_I	wrpr	%r16, 0x0032, %tnpc
	.word 0xb350c000  ! 1254: RDPR_TT	<illegal instruction>
	.word 0xbde5a095  ! 1256: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8994e0aa  ! 1263: WRPR_TICK_I	wrpr	%r19, 0x00aa, %tick
	.word 0xb7e4a19f  ! 1264: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1ff  ! 1265: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4218d  ! 1269: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e521e0  ! 1271: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x3033a, %g1, %o0
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
	.word 0xb9540000  ! 1280: RDPR_GL	<illegal instruction>
	.word 0xbde5612b  ! 1282: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe4e0b0  ! 1285: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e560bd  ! 1286: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e068  ! 1297: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e521d3  ! 1298: SAVE_I	save	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5a0ed  ! 1302: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb424c000  ! 1304: SUB_R	sub 	%r19, %r0, %r26
	setx	data_start_4, %g1, %r22
	.word 0xbfe4a163  ! 1307: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8d9520f0  ! 1308: WRPR_PSTATE_I	wrpr	%r20, 0x00f0, %pstate
	.word 0xb3643801  ! 1310: MOVcc_I	<illegal instruction>
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe2c4000  ! 1317: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xb1508000  ! 1321: RDPR_TSTATE	<illegal instruction>
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421a2  ! 1326: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x83942126  ! 1327: WRPR_TNPC_I	wrpr	%r16, 0x0126, %tnpc
	.word 0xb7e5a02e  ! 1328: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9480000  ! 1329: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e4617a  ! 1334: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a10b  ! 1335: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb73df001  ! 1336: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xbfe5604f  ! 1337: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x83956065  ! 1340: WRPR_TNPC_I	wrpr	%r21, 0x0065, %tnpc
	.word 0xb5510000  ! 1343: RDPR_TICK	<illegal instruction>
	.word 0xb551c000  ! 1345: RDPR_TL	<illegal instruction>
	.word 0xb9e4a1fe  ! 1346: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 1357: RDPR_TPC	<illegal instruction>
	.word 0xb4348000  ! 1359: ORN_R	orn 	%r18, %r0, %r26
	.word 0xba24a072  ! 1362: SUB_I	sub 	%r18, 0x0072, %r29
	.word 0xb3e520c3  ! 1363: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_7, %g1, %r17
	.word 0xb9e52178  ! 1365: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb510000  ! 1367: RDPR_TICK	<illegal instruction>
	.word 0xb9e4600e  ! 1368: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbe2ca15c  ! 1369: ANDN_I	andn 	%r18, 0x015c, %r31
	.word 0xb9e52171  ! 1371: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e46107  ! 1374: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e460fd  ! 1375: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1378: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5518000  ! 1384: RDPR_PSTATE	<illegal instruction>
	.word 0xb150c000  ! 1385: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 1387: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4a0cd  ! 1396: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4e0c4  ! 1398: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x81942174  ! 1399: WRPR_TPC_I	wrpr	%r16, 0x0174, %tpc
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46126  ! 1403: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8794e134  ! 1404: WRPR_TT_I	wrpr	%r19, 0x0134, %tt
	.word 0xb3e46073  ! 1405: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x899521cb  ! 1406: WRPR_TICK_I	wrpr	%r20, 0x01cb, %tick
	.word 0xb5e46087  ! 1409: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e520a1  ! 1411: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_1, %g1, %r22
	.word 0xbfe5e0dc  ! 1414: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb20d6070  ! 1415: AND_I	and 	%r21, 0x0070, %r25
	.word 0xb750c000  ! 1419: RDPR_TT	<illegal instruction>
	.word 0xbbe4a1b2  ! 1423: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8194e0de  ! 1425: WRPR_TPC_I	wrpr	%r19, 0x00de, %tpc
	mov	0, %r12
	.word 0x8f932000  ! 1427: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5e125  ! 1430: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1504000  ! 1432: RDPR_TNPC	<illegal instruction>
	.word 0x89942064  ! 1433: WRPR_TICK_I	wrpr	%r16, 0x0064, %tick
	.word 0xbaa58000  ! 1436: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xbb520000  ! 1439: RDPR_PIL	<illegal instruction>
	.word 0xb41d610d  ! 1442: XOR_I	xor 	%r21, 0x010d, %r26
	.word 0xb9e5a00e  ! 1443: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4201a  ! 1450: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5e0c9  ! 1452: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e56006  ! 1454: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4a00d  ! 1455: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb73cc000  ! 1456: SRA_R	sra 	%r19, %r0, %r27
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e461bd  ! 1466: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf3c8000  ! 1467: SRA_R	sra 	%r18, %r0, %r31
	.word 0xb7e46059  ! 1468: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a03d  ! 1471: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e561ef  ! 1475: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4e0d6  ! 1476: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb550c000  ! 1477: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	.word 0xb3e4e006  ! 1479: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e46154  ! 1481: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4e131  ! 1485: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_0, %g1, %r22
	.word 0xb350c000  ! 1488: RDPR_TT	<illegal instruction>
	.word 0xb1e52151  ! 1489: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd35d000  ! 1492: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xb83de0f0  ! 1495: XNOR_I	xnor 	%r23, 0x00f0, %r28
	.word 0xb9e42008  ! 1501: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb295e1aa  ! 1506: ORcc_I	orcc 	%r23, 0x01aa, %r25
	.word 0xbde42156  ! 1507: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe560f6  ! 1509: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5a143  ! 1514: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8394a09c  ! 1519: WRPR_TNPC_I	wrpr	%r18, 0x009c, %tnpc
	.word 0xb9e520f8  ! 1520: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e521fc  ! 1521: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5a19b  ! 1524: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7500000  ! 1527: RDPR_TPC	<illegal instruction>
	.word 0xb97d8400  ! 1530: MOVR_R	movre	%r22, %r0, %r28
	.word 0xb3e5e04e  ! 1531: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e46027  ! 1535: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e4a01b  ! 1537: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8395e173  ! 1539: WRPR_TNPC_I	wrpr	%r23, 0x0173, %tnpc
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c3001  ! 1543: SRAX_I	srax	%r16, 0x0001, %r30
	.word 0xb5518000  ! 1544: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e42137  ! 1545: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb0bd21c4  ! 1549: XNORcc_I	xnorcc 	%r20, 0x01c4, %r24
	.word 0xb5e5209a  ! 1553: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b01  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b01, %hpstate
	.word 0xb9e5219f  ! 1556: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4a194  ! 1558: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x9195216e  ! 1561: WRPR_PIL_I	wrpr	%r20, 0x016e, %pil
	.word 0xb3e4a108  ! 1566: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d956123  ! 1572: WRPR_PSTATE_I	wrpr	%r21, 0x0123, %pstate
	.word 0xb1510000  ! 1573: RDPR_TICK	<illegal instruction>
	.word 0x8994e19f  ! 1574: WRPR_TICK_I	wrpr	%r19, 0x019f, %tick
	.word 0xbbe4e13e  ! 1579: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e1ec  ! 1580: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb8840000  ! 1581: ADDcc_R	addcc 	%r16, %r0, %r28
	.word 0xb3e4e0f6  ! 1585: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4a1e3  ! 1586: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4e0eb  ! 1588: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e460c6  ! 1590: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf540000  ! 1593: RDPR_GL	<illegal instruction>
	.word 0xb7508000  ! 1595: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5605c  ! 1598: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4a194  ! 1600: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8795a177  ! 1601: WRPR_TT_I	wrpr	%r22, 0x0177, %tt
	.word 0xbfe56145  ! 1602: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r16
	.word 0x8794a096  ! 1610: WRPR_TT_I	wrpr	%r18, 0x0096, %tt
	.word 0xb9e521b3  ! 1612: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe421db  ! 1614: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4a043  ! 1619: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde461aa  ! 1621: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e52031  ! 1622: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4a072  ! 1624: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe46183  ! 1625: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5a0e6  ! 1627: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e01e  ! 1628: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe420f9  ! 1629: SAVE_I	save	%r16, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 1631: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7480000  ! 1636: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e4e09b  ! 1637: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e561e4  ! 1641: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e0c2  ! 1643: WRPR_TNPC_I	wrpr	%r23, 0x00c2, %tnpc
	.word 0xbcc4a0c8  ! 1646: ADDCcc_I	addccc 	%r18, 0x00c8, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 1651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0x8d942108  ! 1653: WRPR_PSTATE_I	wrpr	%r16, 0x0108, %pstate
	.word 0xb205a014  ! 1655: ADD_I	add 	%r22, 0x0014, %r25
	.word 0xb3e421a1  ! 1656: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4a0ac  ! 1657: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e46073  ! 1662: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e4e0de  ! 1663: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8995a083  ! 1664: WRPR_TICK_I	wrpr	%r22, 0x0083, %tick
	.word 0xbc8c61e9  ! 1666: ANDcc_I	andcc 	%r17, 0x01e9, %r30
	.word 0xb7500000  ! 1667: RDPR_TPC	<illegal instruction>
	.word 0xb0948000  ! 1671: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xb8154000  ! 1672: OR_R	or 	%r21, %r0, %r28
	.word 0x83942092  ! 1676: WRPR_TNPC_I	wrpr	%r16, 0x0092, %tnpc
	.word 0xbde561ba  ! 1678: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde461b3  ! 1680: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7510000  ! 1686: RDPR_TICK	<illegal instruction>
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1692: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e46044  ! 1695: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e561aa  ! 1696: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e051  ! 1697: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3480000  ! 1698: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde420e9  ! 1702: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb40c8000  ! 1705: AND_R	and 	%r18, %r0, %r26
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e560c4  ! 1708: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5614a  ! 1710: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5a193  ! 1712: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb508000  ! 1713: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xbeb58000  ! 1716: SUBCcc_R	orncc 	%r22, %r0, %r31
	.word 0xbbe4a140  ! 1717: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e52181  ! 1718: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x879520e3  ! 1722: WRPR_TT_I	wrpr	%r20, 0x00e3, %tt
	.word 0xb7e5e077  ! 1724: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde56058  ! 1728: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde4e014  ! 1731: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e521c0  ! 1734: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4a03a  ! 1735: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde520e3  ! 1737: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e46194  ! 1738: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbc45a170  ! 1739: ADDC_I	addc 	%r22, 0x0170, %r30
	setx	data_start_6, %g1, %r19
	.word 0xb3e461d5  ! 1743: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7518000  ! 1744: RDPR_PSTATE	<illegal instruction>
	.word 0xb22ca029  ! 1746: ANDN_I	andn 	%r18, 0x0029, %r25
	.word 0xb004a1b9  ! 1752: ADD_I	add 	%r18, 0x01b9, %r24
	.word 0xb3e52006  ! 1753: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e4e101  ! 1755: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb634a0d8  ! 1757: ORN_I	orn 	%r18, 0x00d8, %r27
	.word 0xbb518000  ! 1758: RDPR_PSTATE	<illegal instruction>
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23da198  ! 1761: XNOR_I	xnor 	%r22, 0x0198, %r25
	.word 0xbfe4e150  ! 1763: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4e0b5  ! 1764: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5518000  ! 1766: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 1767: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e56000  ! 1768: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5e001  ! 1770: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb350c000  ! 1771: RDPR_TT	<illegal instruction>
	.word 0xbbe4e18a  ! 1772: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4a19a  ! 1776: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x10139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52006  ! 1781: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e52049  ! 1783: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5219e  ! 1786: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4a1b8  ! 1788: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe520ed  ! 1793: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e520d7  ! 1795: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe5a14f  ! 1796: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x839560cf  ! 1805: WRPR_TNPC_I	wrpr	%r21, 0x00cf, %tnpc
	.word 0xbfe42161  ! 1807: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e421c9  ! 1808: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e560a8  ! 1809: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e4a16c  ! 1810: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4e18b  ! 1812: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde521a6  ! 1813: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x30315, %g1, %o0
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
	.word 0xbd518000  ! 1826: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	.word 0xbde4e0bf  ! 1831: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a168  ! 1832: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5609b  ! 1833: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x899461b4  ! 1834: WRPR_TICK_I	wrpr	%r17, 0x01b4, %tick
	.word 0xbde4a153  ! 1835: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe5a13c  ! 1837: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5a19a  ! 1839: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4a079  ! 1843: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb2a4c000  ! 1847: SUBcc_R	subcc 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xb9e5202a  ! 1852: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbd344000  ! 1853: SRL_R	srl 	%r17, %r0, %r30
	.word 0xbbe5a1f3  ! 1854: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4602b  ! 1857: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e1df  ! 1866: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e521b0  ! 1867: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4a058  ! 1868: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb244a14b  ! 1871: ADDC_I	addc 	%r18, 0x014b, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a49  ! 1872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a49, %hpstate
	.word 0x8595a0b1  ! 1873: WRPR_TSTATE_I	wrpr	%r22, 0x00b1, %tstate
	.word 0xb5e4a1bd  ! 1876: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8994e0ed  ! 1878: WRPR_TICK_I	wrpr	%r19, 0x00ed, %tick
	.word 0xb3510000  ! 1879: RDPR_TICK	<illegal instruction>
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 1883: RDPR_TICK	<illegal instruction>
	.word 0xbcc54000  ! 1885: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xbfe42149  ! 1887: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a188  ! 1889: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8594e1fb  ! 1891: WRPR_TSTATE_I	wrpr	%r19, 0x01fb, %tstate
	.word 0xb550c000  ! 1901: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0x8794a0cd  ! 1903: WRPR_TT_I	wrpr	%r18, 0x00cd, %tt
	.word 0xbeada0a9  ! 1904: ANDNcc_I	andncc 	%r22, 0x00a9, %r31
	.word 0xbb518000  ! 1908: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e1a7  ! 1910: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e42091  ! 1913: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8395e00c  ! 1914: WRPR_TNPC_I	wrpr	%r23, 0x000c, %tnpc
	.word 0xbfe4e177  ! 1917: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5a0dd  ! 1919: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5a1cf  ! 1920: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899560ff  ! 1922: WRPR_TICK_I	wrpr	%r21, 0x00ff, %tick
	setx	data_start_3, %g1, %r19
	.word 0xb3520000  ! 1934: RDPR_PIL	<illegal instruction>
	.word 0xbbe4210e  ! 1939: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e560db  ! 1943: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8595e114  ! 1944: WRPR_TSTATE_I	wrpr	%r23, 0x0114, %tstate
	.word 0xb535a001  ! 1946: SRL_I	srl 	%r22, 0x0001, %r26
	.word 0xb9e56100  ! 1947: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_2, %g1, %r20
	.word 0xb52c1000  ! 1951: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xb9e5609a  ! 1952: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x91956013  ! 1954: WRPR_PIL_I	wrpr	%r21, 0x0013, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xb1500000  ! 1964: RDPR_TPC	<illegal instruction>
	.word 0xb3e5a130  ! 1965: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe560e1  ! 1966: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e52081  ! 1968: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8794a0bc  ! 1969: WRPR_TT_I	wrpr	%r18, 0x00bc, %tt
	.word 0xbbe4211e  ! 1970: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a1ba  ! 1977: WRPR_TICK_I	wrpr	%r22, 0x01ba, %tick
	.word 0xbfe4205b  ! 1979: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb508000  ! 1981: RDPR_TSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1982: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8795e1d2  ! 1986: WRPR_TT_I	wrpr	%r23, 0x01d2, %tt
	.word 0x879520c0  ! 1987: WRPR_TT_I	wrpr	%r20, 0x00c0, %tt
	setx	data_start_5, %g1, %r23
	.word 0xb1e46098  ! 1995: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbc0c4000  ! 1996: AND_R	and 	%r17, %r0, %r30
	.word 0xba0ce047  ! 1997: AND_I	and 	%r19, 0x0047, %r29
	.word 0xb6c50000  ! 1999: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xb3e561b5  ! 2000: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e13c  ! 2003: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde5e140  ! 2004: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb48de1d7  ! 2006: ANDcc_I	andcc 	%r23, 0x01d7, %r26
	.word 0xb1e56131  ! 2010: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_1, %g1, %r22
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc35e141  ! 2017: SUBC_I	orn 	%r23, 0x0141, %r30
	.word 0x85946057  ! 2020: WRPR_TSTATE_I	wrpr	%r17, 0x0057, %tstate
	.word 0xbcb4e115  ! 2021: ORNcc_I	orncc 	%r19, 0x0115, %r30
	.word 0xb1e421fa  ! 2022: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e157  ! 2023: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e56172  ! 2025: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5608d  ! 2027: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe42125  ! 2033: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb0850000  ! 2035: ADDcc_R	addcc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb935c000  ! 2043: SRL_R	srl 	%r23, %r0, %r28
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0f2  ! 2045: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e460ff  ! 2050: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a054  ! 2051: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4e10a  ! 2054: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4a132  ! 2055: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd51c000  ! 2056: RDPR_TL	<illegal instruction>
	.word 0xbde4208a  ! 2058: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5e0f3  ! 2059: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3520000  ! 2060: RDPR_PIL	<illegal instruction>
	.word 0xb5e520df  ! 2061: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x89952179  ! 2062: WRPR_TICK_I	wrpr	%r20, 0x0179, %tick
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 2063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0xbd518000  ! 2064: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4a0eb  ! 2066: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983f51  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f51, %hpstate
	.word 0xb5e561b1  ! 2071: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e520f7  ! 2073: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x10132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e155  ! 2075: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4a0bb  ! 2078: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e521f5  ! 2081: SAVE_I	save	%r20, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb53d8000  ! 2086: SRA_R	sra 	%r22, %r0, %r26
	.word 0xb1e4603f  ! 2087: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e56096  ! 2091: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbd51c000  ! 2092: RDPR_TL	<illegal instruction>
	.word 0xbfe5a139  ! 2095: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe56022  ! 2097: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 2101: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe4a054  ! 2104: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe46031  ! 2105: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e4212b  ! 2109: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e05c  ! 2115: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5a121  ! 2117: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb63560ca  ! 2118: ORN_I	orn 	%r21, 0x00ca, %r27
	.word 0x8394e079  ! 2121: WRPR_TNPC_I	wrpr	%r19, 0x0079, %tnpc
	.word 0xb3e46118  ! 2123: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4e037  ! 2129: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5508000  ! 2131: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a1e9  ! 2132: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x2021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 2134: RDPR_TL	<illegal instruction>
	.word 0x83946032  ! 2142: WRPR_TNPC_I	wrpr	%r17, 0x0032, %tnpc
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca4e1af  ! 2145: SUBcc_I	subcc 	%r19, 0x01af, %r30
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 2147: MOVcc_I	<illegal instruction>
	.word 0xb684c000  ! 2148: ADDcc_R	addcc 	%r19, %r0, %r27
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 2155: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e421ac  ! 2156: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb510000  ! 2166: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e46037  ! 2169: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9508000  ! 2170: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 2173: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4e1ce  ! 2174: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5e008  ! 2176: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5a0cd  ! 2178: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e56057  ! 2179: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe52097  ! 2184: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb004208e  ! 2186: ADD_I	add 	%r16, 0x008e, %r24
	.word 0xb5e4e05f  ! 2187: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8194a10f  ! 2198: WRPR_TPC_I	wrpr	%r18, 0x010f, %tpc
	.word 0xb9e56155  ! 2203: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5a05f  ! 2205: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb500000  ! 2206: RDPR_TPC	<illegal instruction>
	.word 0xb3e52192  ! 2208: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e42167  ! 2210: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb53c9000  ! 2211: SRAX_R	srax	%r18, %r0, %r26
	.word 0xbfe460ec  ! 2213: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8d95208c  ! 2216: WRPR_PSTATE_I	wrpr	%r20, 0x008c, %pstate
	.word 0xb9e5a043  ! 2218: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e561e1  ! 2219: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xb9520000  ! 2221: RDPR_PIL	<illegal instruction>
	.word 0xbb504000  ! 2223: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 2228: RDPR_TNPC	<illegal instruction>
	.word 0xb751c000  ! 2229: RDPR_TL	<illegal instruction>
	.word 0xb7e5e100  ! 2230: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4213b  ! 2239: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb28ce1f2  ! 2240: ANDcc_I	andcc 	%r19, 0x01f2, %r25
	.word 0xb0158000  ! 2242: OR_R	or 	%r22, %r0, %r24
	mov	2, %r12
	.word 0x8f932000  ! 2244: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde4e193  ! 2247: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xba34200d  ! 2249: ORN_I	orn 	%r16, 0x000d, %r29
	.word 0xb3518000  ! 2252: RDPR_PSTATE	<illegal instruction>
	.word 0x8394206f  ! 2258: WRPR_TNPC_I	wrpr	%r16, 0x006f, %tnpc
	.word 0x8394a0c0  ! 2259: WRPR_TNPC_I	wrpr	%r18, 0x00c0, %tnpc
	.word 0xbde42180  ! 2261: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x9195a07f  ! 2262: WRPR_PIL_I	wrpr	%r22, 0x007f, %pil
	.word 0xb5e5a106  ! 2264: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb92de001  ! 2269: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0x8394e02d  ! 2271: WRPR_TNPC_I	wrpr	%r19, 0x002d, %tnpc
	setx	data_start_0, %g1, %r16
	setx	data_start_0, %g1, %r20
	.word 0xbde5e1c5  ! 2277: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5357001  ! 2278: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xb3e5a03a  ! 2279: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x859421bc  ! 2286: WRPR_TSTATE_I	wrpr	%r16, 0x01bc, %tstate
	.word 0xb9e421df  ! 2287: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983fc9  ! 2291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc9, %hpstate
	.word 0xb7e420a0  ! 2293: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb2248000  ! 2295: SUB_R	sub 	%r18, %r0, %r25
	.word 0xb3500000  ! 2296: RDPR_TPC	<illegal instruction>
	.word 0xb7e560ef  ! 2297: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 2305: RDPR_TSTATE	<illegal instruction>
	.word 0xb73c0000  ! 2307: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb9e46010  ! 2312: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4a019  ! 2316: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbcb5a1b9  ! 2317: ORNcc_I	orncc 	%r22, 0x01b9, %r30
	setx	data_start_6, %g1, %r21
	.word 0xb3e42109  ! 2327: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb8b560aa  ! 2330: SUBCcc_I	orncc 	%r21, 0x00aa, %r28
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe521da  ! 2333: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a136  ! 2337: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe561ca  ! 2339: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5607b  ! 2346: SAVE_I	save	%r21, 0x0001, %r26
	mov	0, %r12
	.word 0x8f932000  ! 2348: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1540000  ! 2350: RDPR_GL	<illegal instruction>
	.word 0xb9e5a1d8  ! 2352: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e56182  ! 2354: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4215f  ! 2359: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e52089  ! 2364: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe4e02c  ! 2367: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982d93  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d93, %hpstate
	.word 0xb825a126  ! 2372: SUB_I	sub 	%r22, 0x0126, %r28
	.word 0xb72cc000  ! 2374: SLL_R	sll 	%r19, %r0, %r27
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a190  ! 2377: WRPR_TSTATE_I	wrpr	%r18, 0x0190, %tstate
	mov	2, %r12
	.word 0x8f932000  ! 2384: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e52114  ! 2388: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e4619f  ! 2391: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb934b001  ! 2393: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb9510000  ! 2394: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e0fc  ! 2401: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5a0ed  ! 2402: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56026  ! 2408: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4e147  ! 2412: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5641800  ! 2413: MOVcc_R	<illegal instruction>
	.word 0xb3e4e12b  ! 2414: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb2b50000  ! 2415: SUBCcc_R	orncc 	%r20, %r0, %r25
	.word 0xb9e561a5  ! 2418: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5a0a4  ! 2421: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb92dd000  ! 2422: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb3e5605d  ! 2424: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e52028  ! 2429: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e561e0  ! 2430: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4e0cd  ! 2431: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e5a16c  ! 2432: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf510000  ! 2434: RDPR_TICK	<illegal instruction>
	.word 0xb9518000  ! 2438: RDPR_PSTATE	<illegal instruction>
	.word 0xbde520f2  ! 2441: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9518000  ! 2442: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4a17d  ! 2443: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_0, %g1, %r18
	setx	0x10022, %g1, %o0
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
	.word 0xb1e46183  ! 2456: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4a132  ! 2457: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf518000  ! 2458: RDPR_PSTATE	<illegal instruction>
	.word 0xb9504000  ! 2459: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5208f  ! 2465: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x91956071  ! 2467: WRPR_PIL_I	wrpr	%r21, 0x0071, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r20
	.word 0xbf520000  ! 2476: RDPR_PIL	<illegal instruction>
	.word 0xbde42170  ! 2480: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0a0  ! 2488: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3520000  ! 2495: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 2497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	.word 0xbbe5e0ce  ! 2502: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe4a189  ! 2503: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4e1e3  ! 2504: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe5e1db  ! 2505: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 2510: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe421d1  ! 2512: SAVE_I	save	%r16, 0x0001, %r31
	mov	0, %r14
	.word 0xa193a000  ! 2514: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5a074  ! 2516: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4e0b1  ! 2519: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e461a5  ! 2520: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb750c000  ! 2523: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2524: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2532: RDPR_TPC	<illegal instruction>
	.word 0xb7480000  ! 2540: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e4e1d8  ! 2542: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe561c4  ! 2543: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5214b  ! 2545: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd2d2001  ! 2550: SLL_I	sll 	%r20, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 2551: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e5616c  ! 2553: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a025  ! 2557: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	1, %r12
	.word 0x8f932000  ! 2560: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e4e1a3  ! 2563: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc9d4000  ! 2564: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xb7e52038  ! 2567: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb834e1c6  ! 2571: SUBC_I	orn 	%r19, 0x01c6, %r28
	.word 0xbde5614d  ! 2572: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5612f  ! 2576: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaace19b  ! 2583: ANDNcc_I	andncc 	%r19, 0x019b, %r29
	.word 0x8594e01d  ! 2590: WRPR_TSTATE_I	wrpr	%r19, 0x001d, %tstate
	.word 0xbf518000  ! 2591: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5e07b  ! 2602: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x89946137  ! 2603: WRPR_TICK_I	wrpr	%r17, 0x0137, %tick
	.word 0xbde46020  ! 2605: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5e015  ! 2606: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e521ce  ! 2612: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a09d  ! 2614: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe46084  ! 2615: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb97cc400  ! 2617: MOVR_R	movre	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8954000  ! 2625: ORcc_R	orcc 	%r21, %r0, %r28
	mov	0, %r12
	.word 0x8f932000  ! 2627: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5641800  ! 2629: MOVcc_R	<illegal instruction>
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4210b  ! 2637: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe42050  ! 2639: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4602a  ! 2642: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0e7  ! 2644: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e52112  ! 2646: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8394a056  ! 2649: WRPR_TNPC_I	wrpr	%r18, 0x0056, %tnpc
	.word 0xb5e5609a  ! 2650: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbc35c000  ! 2651: SUBC_R	orn 	%r23, %r0, %r30
	.word 0xbbe4a0cd  ! 2656: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 2662: RDPR_TL	<illegal instruction>
	.word 0xbbe56178  ! 2663: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460e2  ! 2668: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbd540000  ! 2669: RDPR_GL	<illegal instruction>
	.word 0xb9e4a135  ! 2673: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e5a1e0  ! 2675: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4a106  ! 2680: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5a024  ! 2681: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xba85615b  ! 2684: ADDcc_I	addcc 	%r21, 0x015b, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4e0e6  ! 2690: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd518000  ! 2697: RDPR_PSTATE	<illegal instruction>
	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe84211e  ! 2708: ADDcc_I	addcc 	%r16, 0x011e, %r31
	.word 0xb3e5606d  ! 2711: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5a199  ! 2712: SAVE_I	save	%r22, 0x0001, %r29
	setx	data_start_1, %g1, %r22
	.word 0xb81da0ad  ! 2718: XOR_I	xor 	%r22, 0x00ad, %r28
	.word 0xb5e5e00b  ! 2719: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9194e0c7  ! 2726: WRPR_PIL_I	wrpr	%r19, 0x00c7, %pil
	.word 0xb5e52020  ! 2731: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb6156042  ! 2734: OR_I	or 	%r21, 0x0042, %r27
	.word 0xbf3d6001  ! 2738: SRA_I	sra 	%r21, 0x0001, %r31
	mov	0, %r14
	.word 0xa193a000  ! 2739: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4ac8000  ! 2741: ANDNcc_R	andncc 	%r18, %r0, %r26
	setx	0x20213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2747: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e561bb  ! 2748: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956190  ! 2750: WRPR_TNPC_I	wrpr	%r21, 0x0190, %tnpc
	.word 0xb750c000  ! 2752: RDPR_TT	<illegal instruction>
	.word 0xbfe5e0a5  ! 2753: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3504000  ! 2754: RDPR_TNPC	<illegal instruction>
	.word 0xbde5a059  ! 2757: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x87942178  ! 2760: WRPR_TT_I	wrpr	%r16, 0x0178, %tt
	setx	data_start_2, %g1, %r18
	.word 0xb1e42196  ! 2762: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e4a162  ! 2764: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983b09  ! 2767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b09, %hpstate
	.word 0xbfe5e0cc  ! 2769: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4e06b  ! 2771: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb750c000  ! 2772: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 2774: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xbbe4e0bf  ! 2779: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe4e1dd  ! 2780: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd508000  ! 2784: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe52048  ! 2790: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbc858000  ! 2793: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xb7341000  ! 2795: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xb3e560a9  ! 2797: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbd34c000  ! 2801: SRL_R	srl 	%r19, %r0, %r30
	.word 0x8594e15f  ! 2804: WRPR_TSTATE_I	wrpr	%r19, 0x015f, %tstate
	.word 0xb1518000  ! 2812: RDPR_PSTATE	<illegal instruction>
	.word 0xb350c000  ! 2815: RDPR_TT	<illegal instruction>
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0be  ! 2817: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbca40000  ! 2818: SUBcc_R	subcc 	%r16, %r0, %r30
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e53  ! 2821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e53, %hpstate
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56148  ! 2824: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_5, %g1, %r23
	.word 0xbfe4e135  ! 2827: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e520a4  ! 2828: SAVE_I	save	%r20, 0x0001, %r24
	mov	1, %r14
	.word 0xa193a000  ! 2829: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe4e157  ! 2830: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a19f  ! 2834: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5e05d  ! 2837: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_7, %g1, %r21
	.word 0xbfe4a193  ! 2842: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5201d  ! 2843: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3480000  ! 2844: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7e46057  ! 2845: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4a0eb  ! 2848: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1cb  ! 2856: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb151c000  ! 2857: RDPR_TL	<illegal instruction>
	.word 0xb1e4e12f  ! 2858: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5a15a  ! 2860: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5a18b  ! 2862: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5616d  ! 2863: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde4a0d3  ! 2866: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e46010  ! 2870: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8795a1cc  ! 2872: WRPR_TT_I	wrpr	%r22, 0x01cc, %tt
	.word 0xb9e52109  ! 2873: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe4e02c  ! 2874: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r21
	.word 0xbf2dd000  ! 2878: SLLX_R	sllx	%r23, %r0, %r31
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x899560c0  ! 2885: WRPR_TICK_I	wrpr	%r21, 0x00c0, %tick
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2ad0000  ! 2887: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xb9e4a0c8  ! 2889: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 2898: MOVcc_I	<illegal instruction>
	.word 0xbbe461a3  ! 2900: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5a1e9  ! 2901: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5e077  ! 2904: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e42108  ! 2905: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde52097  ! 2908: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf540000  ! 2909: RDPR_GL	rdpr	%-, %r31
	.word 0xb7e52096  ! 2910: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x839461f4  ! 2911: WRPR_TNPC_I	wrpr	%r17, 0x01f4, %tnpc
	.word 0xb5e4e10b  ! 2915: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e420bd  ! 2917: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x89952064  ! 2919: WRPR_TICK_I	wrpr	%r20, 0x0064, %tick
	.word 0xbbe4e1b8  ! 2921: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5e177  ! 2924: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5a010  ! 2926: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe42016  ! 2929: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd518000  ! 2932: RDPR_PSTATE	<illegal instruction>
	.word 0xbb540000  ! 2933: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e52083  ! 2935: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e560c9  ! 2936: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4e1b8  ! 2937: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a162  ! 2938: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a0f7  ! 2940: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb32de001  ! 2943: SLL_I	sll 	%r23, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 2944: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	.word 0xb17c4400  ! 2947: MOVR_R	movre	%r17, %r0, %r24
	.word 0xbaac8000  ! 2948: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xbfe460e5  ! 2949: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5a13c  ! 2956: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb8bce1d8  ! 2958: XNORcc_I	xnorcc 	%r19, 0x01d8, %r28
	.word 0x8794e13a  ! 2959: WRPR_TT_I	wrpr	%r19, 0x013a, %tt
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 2964: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4e0ef  ! 2972: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5602d  ! 2978: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_6, %g1, %r18
	.word 0x839560f8  ! 2983: WRPR_TNPC_I	wrpr	%r21, 0x00f8, %tnpc
	.word 0xb7518000  ! 2984: RDPR_PSTATE	<illegal instruction>
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4605b  ! 3001: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e1c1  ! 3002: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1df  ! 3008: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 3009: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46064  ! 3012: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe46061  ! 3013: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5e0ad  ! 3017: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5a1f9  ! 3018: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4601e  ! 3020: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4e112  ! 3021: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5a0c1  ! 3025: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e5a111  ! 3026: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5e0b3  ! 3027: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a10a  ! 3031: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1dc  ! 3033: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8395e171  ! 3037: WRPR_TNPC_I	wrpr	%r23, 0x0171, %tnpc
	.word 0xb3e4e0a1  ! 3040: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4a096  ! 3041: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb480000  ! 3043: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb1e56198  ! 3044: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5e00e  ! 3045: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5e0e6  ! 3049: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5a170  ! 3050: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e520f5  ! 3052: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e421a1  ! 3053: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe521a6  ! 3055: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8395e078  ! 3059: WRPR_TNPC_I	wrpr	%r23, 0x0078, %tnpc
	.word 0xb7e52141  ! 3061: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5a1aa  ! 3062: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4a0b0  ! 3063: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbd51c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xb5e4a032  ! 3070: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde46027  ! 3072: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe358000  ! 3075: SUBC_R	orn 	%r22, %r0, %r31
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594619f  ! 3082: WRPR_TSTATE_I	wrpr	%r17, 0x019f, %tstate
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e0de  ! 3088: WRPR_TT_I	wrpr	%r19, 0x00de, %tt
	.word 0xb5e56185  ! 3089: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe56062  ! 3091: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5a0d3  ! 3094: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe46161  ! 3098: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e420d4  ! 3099: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd2cd000  ! 3101: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xb9508000  ! 3105: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e00a  ! 3106: WRPR_TPC_I	wrpr	%r19, 0x000a, %tpc
	.word 0xbde4e125  ! 3109: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8994e079  ! 3112: WRPR_TICK_I	wrpr	%r19, 0x0079, %tick
	.word 0xbde5213c  ! 3114: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e123  ! 3122: WRPR_TSTATE_I	wrpr	%r23, 0x0123, %tstate
	.word 0xb9e4a18e  ! 3124: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982809  ! 3125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0809, %hpstate
	.word 0xb3e5216d  ! 3126: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1508000  ! 3127: RDPR_TSTATE	<illegal instruction>
	.word 0xb9518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e13f  ! 3133: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe42118  ! 3134: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e46189  ! 3139: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460fb  ! 3142: WRPR_PSTATE_I	wrpr	%r17, 0x00fb, %pstate
	.word 0xbbe4e1bf  ! 3148: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e42031  ! 3150: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e521f8  ! 3154: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x85952179  ! 3156: WRPR_TSTATE_I	wrpr	%r20, 0x0179, %tstate
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	.word 0xbbe421e3  ! 3162: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb37d2401  ! 3163: MOVR_I	movre	%r20, 0x1, %r25
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3167: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e4a11e  ! 3168: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e4a16e  ! 3169: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e4e06d  ! 3170: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8594a106  ! 3173: WRPR_TSTATE_I	wrpr	%r18, 0x0106, %tstate
	.word 0xb5e421a7  ! 3174: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e420c9  ! 3175: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e460fc  ! 3179: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbec4c000  ! 3180: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xbde5215f  ! 3181: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5e13a  ! 3182: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5a08d  ! 3186: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839421d4  ! 3193: WRPR_TNPC_I	wrpr	%r16, 0x01d4, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 3195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 3198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	.word 0xb5e4a143  ! 3199: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4a156  ! 3202: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0de  ! 3206: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e520e8  ! 3208: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbe0de1cc  ! 3209: AND_I	and 	%r23, 0x01cc, %r31
	.word 0xb7480000  ! 3210: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d94a116  ! 3211: WRPR_PSTATE_I	wrpr	%r18, 0x0116, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983999  ! 3220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1999, %hpstate
	.word 0xbde5e08c  ! 3221: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4e10f  ! 3225: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_5, %g1, %r23
	.word 0xbbe5e1c5  ! 3227: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x1f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a160  ! 3237: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb73d0000  ! 3239: SRA_R	sra 	%r20, %r0, %r27
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e0b3  ! 3243: WRPR_TSTATE_I	wrpr	%r23, 0x00b3, %tstate
	.word 0xbfe4a063  ! 3244: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4214d  ! 3246: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46149  ! 3248: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe5e004  ! 3249: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d4000  ! 3255: SLL_R	sll 	%r21, %r0, %r31
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3261: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982e09  ! 3264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e09, %hpstate
	.word 0xbfe4e170  ! 3266: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e420be  ! 3271: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8194a0f8  ! 3272: WRPR_TPC_I	wrpr	%r18, 0x00f8, %tpc
	.word 0x899520a4  ! 3277: WRPR_TICK_I	wrpr	%r20, 0x00a4, %tick
	.word 0xbfe4a0fd  ! 3278: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe420f7  ! 3280: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819829d1  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0x8995a040  ! 3287: WRPR_TICK_I	wrpr	%r22, 0x0040, %tick
	.word 0xb9e521d5  ! 3290: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde5e067  ! 3291: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4a172  ! 3292: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_0, %g1, %r18
	mov	2, %r12
	.word 0x8f932000  ! 3296: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 3299: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e030  ! 3307: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e521bf  ! 3319: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb151c000  ! 3320: RDPR_TL	<illegal instruction>
	.word 0x8d946119  ! 3323: WRPR_PSTATE_I	wrpr	%r17, 0x0119, %pstate
	.word 0xb9e5e082  ! 3331: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5e0a2  ! 3332: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4a041  ! 3333: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_2, %g1, %r22
	.word 0x91952176  ! 3337: WRPR_PIL_I	wrpr	%r20, 0x0176, %pil
	mov	0, %r12
	.word 0x8f932000  ! 3340: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe4a06d  ! 3341: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8d9421c6  ! 3343: WRPR_PSTATE_I	wrpr	%r16, 0x01c6, %pstate
	.word 0xb334a001  ! 3344: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xb6bc4000  ! 3348: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xb3e5e133  ! 3349: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e561fd  ! 3352: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4209f  ! 3353: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e42067  ! 3355: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e52139  ! 3356: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5a197  ! 3357: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbaadc000  ! 3358: ANDNcc_R	andncc 	%r23, %r0, %r29
	mov	1, %r14
	.word 0xa193a000  ! 3363: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8194211a  ! 3365: WRPR_TPC_I	wrpr	%r16, 0x011a, %tpc
	.word 0xbc0d8000  ! 3366: AND_R	and 	%r22, %r0, %r30
	setx	data_start_4, %g1, %r18
	.word 0xb9504000  ! 3370: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xb7e520db  ! 3374: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e46162  ! 3379: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf518000  ! 3383: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e56041  ! 3384: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r12
	.word 0x8f932000  ! 3389: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3641800  ! 3390: MOVcc_R	<illegal instruction>
	.word 0xb9e52011  ! 3391: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb825e012  ! 3396: SUB_I	sub 	%r23, 0x0012, %r28
	.word 0xb7480000  ! 3400: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e56140  ! 3401: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb551c000  ! 3410: RDPR_TL	<illegal instruction>
	.word 0xb7e421c2  ! 3413: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbb358000  ! 3415: SRL_R	srl 	%r22, %r0, %r29
	mov	2, %r14
	.word 0xa193a000  ! 3416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4a10d  ! 3417: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5a149  ! 3420: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e521be  ! 3423: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf510000  ! 3425: RDPR_TICK	<illegal instruction>
	.word 0xbde461f8  ! 3426: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e521fe  ! 3427: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4e1df  ! 3428: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12cb001  ! 3435: SLLX_I	sllx	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e1f6  ! 3440: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5e137  ! 3442: SAVE_I	save	%r23, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 3443: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 3453: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xb9504000  ! 3459: RDPR_TNPC	<illegal instruction>
	.word 0xb5e420eb  ! 3460: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e055  ! 3463: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e46125  ! 3465: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4e17d  ! 3466: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3540000  ! 3470: RDPR_GL	<illegal instruction>
	.word 0xb9e56119  ! 3474: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7508000  ! 3475: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5e194  ! 3478: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x89942072  ! 3480: WRPR_TICK_I	wrpr	%r16, 0x0072, %tick
	.word 0xb49c603e  ! 3482: XORcc_I	xorcc 	%r17, 0x003e, %r26
	.word 0xb3e56052  ! 3485: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e4a12d  ! 3487: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde521c3  ! 3492: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbb34b001  ! 3493: SRLX_I	srlx	%r18, 0x0001, %r29
	.word 0xb3e4a1ec  ! 3497: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb500000  ! 3498: RDPR_TPC	<illegal instruction>
	.word 0x899521e0  ! 3500: WRPR_TICK_I	wrpr	%r20, 0x01e0, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8795e148  ! 3507: WRPR_TT_I	wrpr	%r23, 0x0148, %tt
	.word 0xbde56190  ! 3509: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e4a139  ! 3510: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe461a9  ! 3512: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e4a1f2  ! 3515: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb480000  ! 3518: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_7, %g1, %r20
	.word 0xb5e52199  ! 3521: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4601c  ! 3527: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 3528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 3529: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd480000  ! 3531: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839521e8  ! 3541: WRPR_TNPC_I	wrpr	%r20, 0x01e8, %tnpc
	.word 0xbfe4e021  ! 3542: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e065  ! 3546: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e5e008  ! 3548: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe4e0a3  ! 3550: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4a0fe  ! 3551: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb61d4000  ! 3552: XOR_R	xor 	%r21, %r0, %r27
	.word 0xbfe46180  ! 3555: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5e132  ! 3557: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf50c000  ! 3562: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 3564: RDPR_TSTATE	<illegal instruction>
	.word 0x87952065  ! 3567: WRPR_TT_I	wrpr	%r20, 0x0065, %tt
	.word 0x879421cc  ! 3570: WRPR_TT_I	wrpr	%r16, 0x01cc, %tt
	.word 0xb951c000  ! 3571: RDPR_TL	<illegal instruction>
	.word 0xb5e5a0cf  ! 3574: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a022  ! 3577: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8995a193  ! 3578: WRPR_TICK_I	wrpr	%r22, 0x0193, %tick
	.word 0xb7e5a1db  ! 3581: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 3587: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e5a1e1  ! 3588: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e4a1b2  ! 3589: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e520d2  ! 3591: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5500000  ! 3592: RDPR_TPC	<illegal instruction>
	.word 0xb7e4602f  ! 3593: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839461c5  ! 3603: WRPR_TNPC_I	wrpr	%r17, 0x01c5, %tnpc
	.word 0xbde4207c  ! 3608: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5614d  ! 3614: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a150  ! 3617: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd641800  ! 3618: MOVcc_R	<illegal instruction>
	.word 0xbbe5a1ea  ! 3619: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf3d3001  ! 3620: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0xb950c000  ! 3622: RDPR_TT	<illegal instruction>
	.word 0x919521b8  ! 3625: WRPR_PIL_I	wrpr	%r20, 0x01b8, %pil
	.word 0x859421cc  ! 3627: WRPR_TSTATE_I	wrpr	%r16, 0x01cc, %tstate
	.word 0xb1e5600e  ! 3628: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e56042  ! 3632: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e56148  ! 3637: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1fc  ! 3651: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8595203f  ! 3652: WRPR_TSTATE_I	wrpr	%r20, 0x003f, %tstate
	.word 0xbd50c000  ! 3656: RDPR_TT	<illegal instruction>
	.word 0xbd2d0000  ! 3664: SLL_R	sll 	%r20, %r0, %r30
	.word 0xb4bdc000  ! 3667: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xb7e4e150  ! 3669: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbe14218a  ! 3672: OR_I	or 	%r16, 0x018a, %r31
	.word 0xbb510000  ! 3673: RDPR_TICK	<illegal instruction>
	.word 0xbf3cd000  ! 3675: SRAX_R	srax	%r19, %r0, %r31
	.word 0xb7e4e0e6  ! 3676: SAVE_I	save	%r19, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3679: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8994200d  ! 3680: WRPR_TICK_I	wrpr	%r16, 0x000d, %tick
	.word 0xb7e461d6  ! 3683: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb02c0000  ! 3684: ANDN_R	andn 	%r16, %r0, %r24
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e056  ! 3688: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc25a1ad  ! 3691: SUB_I	sub 	%r22, 0x01ad, %r30
	.word 0xb3e52024  ! 3692: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb750c000  ! 3696: RDPR_TT	<illegal instruction>
	.word 0xbde5a1ca  ! 3699: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1540000  ! 3700: RDPR_GL	<illegal instruction>
	.word 0xb950c000  ! 3703: RDPR_TT	<illegal instruction>
	.word 0xb351c000  ! 3704: RDPR_TL	<illegal instruction>
	.word 0xb7e4a10e  ! 3705: SAVE_I	save	%r18, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3707: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560eb  ! 3712: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982b59  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	.word 0xb9e46049  ! 3715: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5a14d  ! 3716: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x919561b7  ! 3718: WRPR_PIL_I	wrpr	%r21, 0x01b7, %pil
	.word 0xbf500000  ! 3728: RDPR_TPC	<illegal instruction>
	.word 0xb5e4e019  ! 3737: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421dc  ! 3739: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde56062  ! 3747: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8d95e199  ! 3749: WRPR_PSTATE_I	wrpr	%r23, 0x0199, %pstate
	.word 0x91946065  ! 3750: WRPR_PIL_I	wrpr	%r17, 0x0065, %pil
	.word 0xb9e461b0  ! 3751: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e4604d  ! 3752: SAVE_I	save	%r17, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 3754: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe46120  ! 3758: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9480000  ! 3761: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521ab  ! 3764: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e5601c  ! 3768: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9500000  ! 3769: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3772: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4b58000  ! 3774: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0xb29d8000  ! 3775: XORcc_R	xorcc 	%r22, %r0, %r25
	.word 0xb1540000  ! 3781: RDPR_GL	<illegal instruction>
	.word 0x899560fc  ! 3786: WRPR_TICK_I	wrpr	%r21, 0x00fc, %tick
	.word 0xb9e4e17a  ! 3788: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e520ec  ! 3791: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb624e06b  ! 3795: SUB_I	sub 	%r19, 0x006b, %r27
	.word 0xb92c4000  ! 3796: SLL_R	sll 	%r17, %r0, %r28
	.word 0xb7e4e068  ! 3797: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4600e  ! 3808: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd518000  ! 3812: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e56032  ! 3813: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4e04f  ! 3816: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x87952179  ! 3819: WRPR_TT_I	wrpr	%r20, 0x0179, %tt
	.word 0x8594e1a4  ! 3822: WRPR_TSTATE_I	wrpr	%r19, 0x01a4, %tstate
	.word 0xbd643801  ! 3825: MOVcc_I	<illegal instruction>
	.word 0xbfe4a19e  ! 3826: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd480000  ! 3827: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8194a182  ! 3832: WRPR_TPC_I	wrpr	%r18, 0x0182, %tpc
	.word 0xbde5e058  ! 3833: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9480000  ! 3835: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e56001  ! 3838: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde52045  ! 3840: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e521c9  ! 3843: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb32c8000  ! 3844: SLL_R	sll 	%r18, %r0, %r25
	.word 0xb9641800  ! 3846: MOVcc_R	<illegal instruction>
	.word 0xb5e4a17a  ! 3847: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde46015  ! 3848: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb540000  ! 3849: RDPR_GL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3851: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a13c  ! 3856: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8d942028  ! 3857: WRPR_PSTATE_I	wrpr	%r16, 0x0028, %pstate
	.word 0x8994e1e1  ! 3858: WRPR_TICK_I	wrpr	%r19, 0x01e1, %tick
	mov	0, %r14
	.word 0xa193a000  ! 3859: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde420ee  ! 3860: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9540000  ! 3864: RDPR_GL	<illegal instruction>
	.word 0xbfe5a021  ! 3870: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4209d  ! 3874: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0b5a06c  ! 3877: SUBCcc_I	orncc 	%r22, 0x006c, %r24
	.word 0xbfe5e111  ! 3878: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e42165  ! 3882: SAVE_I	save	%r16, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 3884: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e560da  ! 3886: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_1, %g1, %r19
	.word 0xbfe560e1  ! 3889: SAVE_I	save	%r21, 0x0001, %r31
	mov	1, %r14
	.word 0xa193a000  ! 3891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d95a0a6  ! 3893: WRPR_PSTATE_I	wrpr	%r22, 0x00a6, %pstate
	.word 0xb4340000  ! 3895: ORN_R	orn 	%r16, %r0, %r26
	.word 0xb12c4000  ! 3901: SLL_R	sll 	%r17, %r0, %r24
	.word 0xbde5a178  ! 3903: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5e13b  ! 3906: SAVE_I	save	%r23, 0x0001, %r30
	mov	2, %r12
	.word 0x8f932000  ! 3907: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195e0a8  ! 3908: WRPR_PIL_I	wrpr	%r23, 0x00a8, %pil
	.word 0xbde4e1fd  ! 3909: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde420c5  ! 3914: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 3921: RDPR_TNPC	<illegal instruction>
	.word 0x899421a7  ! 3922: WRPR_TICK_I	wrpr	%r16, 0x01a7, %tick
	.word 0x8994a09c  ! 3923: WRPR_TICK_I	wrpr	%r18, 0x009c, %tick
	.word 0xb5e4e007  ! 3924: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0ad  ! 3928: WRPR_PSTATE_I	wrpr	%r18, 0x00ad, %pstate
	setx	0x10129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946134  ! 3936: WRPR_PSTATE_I	wrpr	%r17, 0x0134, %pstate
	.word 0xbde460e1  ! 3937: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_6, %g1, %r20
	.word 0xbfe5a0a2  ! 3939: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e561f0  ! 3945: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_3, %g1, %r20
	.word 0xb7540000  ! 3953: RDPR_GL	<illegal instruction>
	.word 0xb8348000  ! 3954: SUBC_R	orn 	%r18, %r0, %r28
	.word 0xb5e4e04a  ! 3958: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e52105  ! 3959: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbe9c4000  ! 3960: XORcc_R	xorcc 	%r17, %r0, %r31
	.word 0xb1e52080  ! 3961: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e5a09b  ! 3964: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e560b5  ! 3966: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4a167  ! 3967: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5613a  ! 3969: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8195a105  ! 3971: WRPR_TPC_I	wrpr	%r22, 0x0105, %tpc
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52090  ! 3973: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5540000  ! 3974: RDPR_GL	<illegal instruction>
	.word 0xb5540000  ! 3975: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 3978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xb5e4e09f  ! 3979: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe42063  ! 3980: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5510000  ! 3987: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	.word 0xb1e561ea  ! 3995: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4a004  ! 3997: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e15a  ! 4007: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e4a0ae  ! 4008: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 4010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	.word 0x8d94e0b2  ! 4016: WRPR_PSTATE_I	wrpr	%r19, 0x00b2, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x819828db  ! 4022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08db, %hpstate
	.word 0xb7e56157  ! 4023: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4e101  ! 4025: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8395e166  ! 4031: WRPR_TNPC_I	wrpr	%r23, 0x0166, %tnpc
	setx	data_start_0, %g1, %r23
	.word 0xbf500000  ! 4033: RDPR_TPC	<illegal instruction>
	.word 0xb7520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xbbe420d4  ! 4036: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e460c5  ! 4038: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe52185  ! 4039: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb42c6088  ! 4040: ANDN_I	andn 	%r17, 0x0088, %r26
	.word 0xbb500000  ! 4041: RDPR_TPC	<illegal instruction>
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a021  ! 4044: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4e021  ! 4047: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e460eb  ! 4048: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf540000  ! 4051: RDPR_GL	<illegal instruction>
	.word 0xb9480000  ! 4053: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e560b7  ! 4056: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x2033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 4061: RDPR_TPC	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0xbde52104  ! 4066: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe5e0ad  ! 4067: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x30037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a110  ! 4069: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5540000  ! 4071: RDPR_GL	<illegal instruction>
	.word 0xb1e4e101  ! 4073: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde52138  ! 4074: SAVE_I	save	%r20, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 4078: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4084: RDPR_TT	<illegal instruction>
	.word 0xb68520d9  ! 4094: ADDcc_I	addcc 	%r20, 0x00d9, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 4097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xbde4a0aa  ! 4098: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	.word 0xb3e4e134  ! 4103: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e461af  ! 4105: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a1f7  ! 4107: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb2c3001  ! 4114: SLLX_I	sllx	%r16, 0x0001, %r29
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde52007  ! 4126: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_7, %g1, %r19
	.word 0xb3e460d4  ! 4130: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5e041  ! 4135: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe5a1a3  ! 4136: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x87946039  ! 4139: WRPR_TT_I	wrpr	%r17, 0x0039, %tt
	.word 0xb1e4a08c  ! 4142: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 4144: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e113  ! 4147: WRPR_TPC_I	wrpr	%r23, 0x0113, %tpc
	.word 0xbbe46119  ! 4148: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbeb48000  ! 4151: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xb550c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 4154: RDPR_TT	<illegal instruction>
	.word 0xbfe4e017  ! 4155: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4157: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e4a07f  ! 4159: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd500000  ! 4166: RDPR_TPC	<illegal instruction>
	.word 0xb5540000  ! 4167: RDPR_GL	<illegal instruction>
	.word 0xbde4e1e0  ! 4169: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_2, %g1, %r22
	.word 0xb9e5a00f  ! 4172: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb53cf001  ! 4177: SRAX_I	srax	%r19, 0x0001, %r26
	.word 0xb5e5615d  ! 4179: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4e19d  ! 4183: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb32c0000  ! 4184: SLL_R	sll 	%r16, %r0, %r25
	.word 0xbc3c4000  ! 4185: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb7e5e0ee  ! 4187: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd504000  ! 4188: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5a0ef  ! 4192: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe520a3  ! 4195: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e561ac  ! 4196: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6ac2050  ! 4201: ANDNcc_I	andncc 	%r16, 0x0050, %r27
	.word 0xbbe5206d  ! 4203: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5a1cc  ! 4206: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8994a1fc  ! 4210: WRPR_TICK_I	wrpr	%r18, 0x01fc, %tick
	.word 0xb5e5a18b  ! 4212: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_4, %g1, %r23
	.word 0xbbe4a005  ! 4217: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x879520a4  ! 4218: WRPR_TT_I	wrpr	%r20, 0x00a4, %tt
	.word 0xbbe5e052  ! 4219: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e52095  ! 4224: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5604f  ! 4226: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd504000  ! 4227: RDPR_TNPC	<illegal instruction>
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a127  ! 4229: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 4237: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_0, %g1, %r23
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794219f  ! 4250: WRPR_TT_I	wrpr	%r16, 0x019f, %tt
	.word 0xb1e5a0aa  ! 4254: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 4255: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46084  ! 4262: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e5e174  ! 4265: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e04f  ! 4270: WRPR_TICK_I	wrpr	%r19, 0x004f, %tick
	.word 0xbbe5603f  ! 4271: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4e16b  ! 4272: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbb520000  ! 4273: RDPR_PIL	<illegal instruction>
	.word 0xb1e461c2  ! 4276: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4209d  ! 4277: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e42026  ! 4283: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e4213d  ! 4284: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4a052  ! 4285: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_3, %g1, %r20
	.word 0x8795a1cc  ! 4289: WRPR_TT_I	wrpr	%r22, 0x01cc, %tt
	.word 0xbde4600b  ! 4291: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde520d9  ! 4292: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x204, %g1, %o0
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
	.word 0xbde56159  ! 4297: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952014  ! 4302: WRPR_PSTATE_I	wrpr	%r20, 0x0014, %pstate
	.word 0xbde5202e  ! 4308: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbac50000  ! 4313: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0x8194212b  ! 4319: WRPR_TPC_I	wrpr	%r16, 0x012b, %tpc
	.word 0xb5508000  ! 4320: RDPR_TSTATE	<illegal instruction>
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e02d  ! 4323: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9d4000  ! 4325: XORcc_R	xorcc 	%r21, %r0, %r29
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb63cc000  ! 4332: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0x8194e0c9  ! 4334: WRPR_TPC_I	wrpr	%r19, 0x00c9, %tpc
	.word 0xb7540000  ! 4335: RDPR_GL	<illegal instruction>
	.word 0xb9e5e06b  ! 4336: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4e063  ! 4343: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5a013  ! 4346: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5e14c  ! 4347: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e0ac  ! 4348: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e5a162  ! 4357: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde46043  ! 4360: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x87942124  ! 4363: WRPR_TT_I	wrpr	%r16, 0x0124, %tt
	.word 0xb5e5e152  ! 4365: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d942101  ! 4368: WRPR_PSTATE_I	wrpr	%r16, 0x0101, %pstate
	.word 0xb9e5e1db  ! 4369: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e4216c  ! 4374: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb404a041  ! 4380: ADD_I	add 	%r18, 0x0041, %r26
	.word 0xb5518000  ! 4383: RDPR_PSTATE	<illegal instruction>
	.word 0xb23cc000  ! 4386: XNOR_R	xnor 	%r19, %r0, %r25
	.word 0x91952065  ! 4392: WRPR_PIL_I	wrpr	%r20, 0x0065, %pil
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a16a  ! 4403: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e5202d  ! 4404: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x819421a0  ! 4405: WRPR_TPC_I	wrpr	%r16, 0x01a0, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e4a037  ! 4411: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7480000  ! 4412: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9510000  ! 4414: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e5a02e  ! 4419: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5500000  ! 4421: RDPR_TPC	<illegal instruction>
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982903  ! 4425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0903, %hpstate
	.word 0xbfe4e16a  ! 4427: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8395200e  ! 4428: WRPR_TNPC_I	wrpr	%r20, 0x000e, %tnpc
	.word 0xb5e5619d  ! 4430: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1520000  ! 4432: RDPR_PIL	<illegal instruction>
	.word 0xbde520c3  ! 4434: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbc8d4000  ! 4435: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xb5e4a13e  ! 4438: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb60c8000  ! 4442: AND_R	and 	%r18, %r0, %r27
	.word 0xb3e461b7  ! 4445: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3518000  ! 4446: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e560d9  ! 4447: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb2154000  ! 4449: OR_R	or 	%r21, %r0, %r25
	.word 0xb7e5607a  ! 4450: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7540000  ! 4452: RDPR_GL	<illegal instruction>
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1c8  ! 4457: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe52124  ! 4458: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e5a124  ! 4459: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4a1aa  ! 4460: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e460d5  ! 4462: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb77c0400  ! 4463: MOVR_R	movre	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e56185  ! 4468: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xb3520000  ! 4477: RDPR_PIL	<illegal instruction>
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 4484: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4e139  ! 4485: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x1d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73d0000  ! 4488: SRA_R	sra 	%r20, %r0, %r27
	.word 0xb5e4a013  ! 4489: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd504000  ! 4491: RDPR_TNPC	<illegal instruction>
	.word 0xbde42015  ! 4492: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x10331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bc8000  ! 4496: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xb1e5a125  ! 4499: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e52006  ! 4500: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe4213e  ! 4501: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd508000  ! 4502: RDPR_TSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb00d0000  ! 4509: AND_R	and 	%r20, %r0, %r24
	.word 0xbde521b7  ! 4510: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e56163  ! 4511: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5a05c  ! 4512: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbe35e03d  ! 4515: SUBC_I	orn 	%r23, 0x003d, %r31
	.word 0xb5504000  ! 4516: RDPR_TNPC	<illegal instruction>
	.word 0xb7e56023  ! 4518: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb950c000  ! 4522: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 4523: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 4525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xb6452130  ! 4526: ADDC_I	addc 	%r20, 0x0130, %r27
	setx	data_start_4, %g1, %r23
	.word 0xba04e011  ! 4531: ADD_I	add 	%r19, 0x0011, %r29
	.word 0xb3e4e123  ! 4532: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 4536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	.word 0xbf51c000  ! 4537: RDPR_TL	<illegal instruction>
	.word 0xb034e048  ! 4539: ORN_I	orn 	%r19, 0x0048, %r24
	.word 0xb40dc000  ! 4540: AND_R	and 	%r23, %r0, %r26
	.word 0xbde42027  ! 4542: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8194e13c  ! 4545: WRPR_TPC_I	wrpr	%r19, 0x013c, %tpc
	.word 0xb3500000  ! 4550: RDPR_TPC	<illegal instruction>
	.word 0xb1e561a4  ! 4553: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb29ce195  ! 4554: XORcc_I	xorcc 	%r19, 0x0195, %r25
	setx	data_start_6, %g1, %r19
	setx	data_start_1, %g1, %r17
	.word 0xb9e5a07e  ! 4562: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5217e  ! 4572: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xba448000  ! 4573: ADDC_R	addc 	%r18, %r0, %r29
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5213f  ! 4578: SAVE_I	save	%r20, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 4580: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5e16c  ! 4584: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	.word 0xb1e5601a  ! 4591: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe42089  ! 4593: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde42187  ! 4595: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe560dc  ! 4596: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb0ac21fa  ! 4599: ANDNcc_I	andncc 	%r16, 0x01fa, %r24
	setx	data_start_4, %g1, %r22
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83952116  ! 4617: WRPR_TNPC_I	wrpr	%r20, 0x0116, %tnpc
	.word 0x8194a162  ! 4619: WRPR_TPC_I	wrpr	%r18, 0x0162, %tpc
	.word 0xbde52127  ! 4625: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde561b4  ! 4628: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e52024  ! 4629: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3508000  ! 4630: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e420b3  ! 4631: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e5610d  ! 4632: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe46197  ! 4636: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e56044  ! 4638: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x89952031  ! 4646: WRPR_TICK_I	wrpr	%r20, 0x0031, %tick
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 4650: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e066  ! 4654: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe420d5  ! 4656: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xb1e4e035  ! 4662: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4e151  ! 4665: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb62c8000  ! 4666: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xb9e520e6  ! 4671: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb340000  ! 4672: SRL_R	srl 	%r16, %r0, %r29
	.word 0xb3e421fd  ! 4673: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e460d4  ! 4675: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde520ae  ! 4680: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe42034  ! 4681: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x919560e6  ! 4685: WRPR_PIL_I	wrpr	%r21, 0x00e6, %pil
	.word 0xb02c4000  ! 4687: ANDN_R	andn 	%r17, %r0, %r24
	.word 0xb5e5e0a5  ! 4688: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde5e1c6  ! 4689: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb4448000  ! 4696: ADDC_R	addc 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421e7  ! 4705: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d95e090  ! 4706: WRPR_PSTATE_I	wrpr	%r23, 0x0090, %pstate
	.word 0xbbe42178  ! 4718: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 4720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	.word 0xb1e52183  ! 4722: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5201b  ! 4724: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3350000  ! 4731: SRL_R	srl 	%r20, %r0, %r25
	.word 0xb7e420ef  ! 4733: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e42181  ! 4742: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xba050000  ! 4743: ADD_R	add 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8594e052  ! 4747: WRPR_TSTATE_I	wrpr	%r19, 0x0052, %tstate
	.word 0xb9e42099  ! 4752: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e561ea  ! 4753: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe56041  ! 4760: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e56066  ! 4763: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x81952071  ! 4764: WRPR_TPC_I	wrpr	%r20, 0x0071, %tpc
	.word 0xb1e4a19a  ! 4765: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5510000  ! 4769: RDPR_TICK	<illegal instruction>
	.word 0xb5643801  ! 4772: MOVcc_I	<illegal instruction>
	.word 0xbfe5e178  ! 4776: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5e19b  ! 4777: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8594e01a  ! 4779: WRPR_TSTATE_I	wrpr	%r19, 0x001a, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982d93  ! 4782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d93, %hpstate
	.word 0x8d95e1b5  ! 4783: WRPR_PSTATE_I	wrpr	%r23, 0x01b5, %pstate
	.word 0x899561cf  ! 4785: WRPR_TICK_I	wrpr	%r21, 0x01cf, %tick
	.word 0xbde4e1e3  ! 4786: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9508000  ! 4787: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983841  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1841, %hpstate
	.word 0xb7e56040  ! 4790: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb508000  ! 4797: RDPR_TSTATE	<illegal instruction>
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4802: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 4804: RDPR_TNPC	<illegal instruction>
	.word 0x8d94216e  ! 4806: WRPR_PSTATE_I	wrpr	%r16, 0x016e, %pstate
	.word 0xb9e4a097  ! 4809: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5e1a1  ! 4812: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5a1a7  ! 4813: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x91942043  ! 4814: WRPR_PIL_I	wrpr	%r16, 0x0043, %pil
	.word 0xbde421f0  ! 4818: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x839420b0  ! 4819: WRPR_TNPC_I	wrpr	%r16, 0x00b0, %tnpc
	.word 0xb5e5a138  ! 4821: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5e081  ! 4824: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9641800  ! 4826: MOVcc_R	<illegal instruction>
	.word 0xb73de001  ! 4827: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xbfe42087  ! 4828: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbe1c6117  ! 4831: XOR_I	xor 	%r17, 0x0117, %r31
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e03d  ! 4834: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb89de145  ! 4835: XORcc_I	xorcc 	%r23, 0x0145, %r28
	.word 0xbde561af  ! 4836: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbd2d6001  ! 4837: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xb1e560d6  ! 4838: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb624e129  ! 4839: SUB_I	sub 	%r19, 0x0129, %r27
	.word 0xbde5a107  ! 4840: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5e1ca  ! 4841: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9540000  ! 4844: RDPR_GL	<illegal instruction>
	.word 0xb1510000  ! 4850: RDPR_TICK	<illegal instruction>
	.word 0xbd3dd000  ! 4853: SRAX_R	srax	%r23, %r0, %r30
	.word 0xbcb4c000  ! 4855: ORNcc_R	orncc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c59  ! 4856: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c59, %hpstate
	.word 0xb3e4a199  ! 4857: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e421a4  ! 4864: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb751c000  ! 4868: RDPR_TL	<illegal instruction>
	.word 0xb9e420ef  ! 4873: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983a5b  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5b, %hpstate
	.word 0xbbe5a0c1  ! 4877: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf349000  ! 4878: SRLX_R	srlx	%r18, %r0, %r31
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1d7  ! 4881: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4219d  ! 4882: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4e0dc  ! 4883: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb24520e8  ! 4884: ADDC_I	addc 	%r20, 0x00e8, %r25
	.word 0xb1e5e131  ! 4885: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a07e  ! 4888: WRPR_PSTATE_I	wrpr	%r18, 0x007e, %pstate
	.word 0xb52c9000  ! 4889: SLLX_R	sllx	%r18, %r0, %r26
	.word 0xb7e4a01a  ! 4910: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1343001  ! 4911: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xb9e46067  ! 4912: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4602a  ! 4913: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4a157  ! 4914: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5e0b9  ! 4915: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4616e  ! 4916: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7504000  ! 4917: RDPR_TNPC	<illegal instruction>
	.word 0xb1e46106  ! 4923: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1510000  ! 4925: RDPR_TICK	<illegal instruction>
	.word 0xb3e5217e  ! 4928: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9344000  ! 4929: SRL_R	srl 	%r17, %r0, %r28
	.word 0xb3e5e128  ! 4930: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb150c000  ! 4931: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 4933: RDPR_TPC	<illegal instruction>
	.word 0x899420fe  ! 4934: WRPR_TICK_I	wrpr	%r16, 0x00fe, %tick
	.word 0xb3e52024  ! 4938: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e4615b  ! 4940: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983e81  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e81, %hpstate
	.word 0xb1518000  ! 4944: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5e0ff  ! 4946: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e0ac  ! 4949: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5500000  ! 4950: RDPR_TPC	<illegal instruction>
	.word 0xbbe52175  ! 4951: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e52108  ! 4954: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb0350000  ! 4957: ORN_R	orn 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983849  ! 4964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1849, %hpstate
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e092  ! 4969: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e46023  ! 4971: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e42119  ! 4972: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5520000  ! 4976: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5206d  ! 4981: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x87942174  ! 4983: WRPR_TT_I	wrpr	%r16, 0x0174, %tt
	mov	2, %r14
	.word 0xa193a000  ! 4987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 4989: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf50c000  ! 4992: RDPR_TT	<illegal instruction>
	.word 0xbd51c000  ! 4994: RDPR_TL	<illegal instruction>
	.word 0xbbe4e058  ! 4995: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x919421d5  ! 4997: WRPR_PIL_I	wrpr	%r16, 0x01d5, %pil
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
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c4000  ! 9: STD_R	std	%r31, [%r17 + %r0]
	.word 0xbe248000  ! 10: SUB_R	sub 	%r18, %r0, %r31
	.word 0xf22c0000  ! 11: STB_R	stb	%r25, [%r16 + %r0]
	.word 0x8394e152  ! 12: WRPR_TNPC_I	wrpr	%r19, 0x0152, %tnpc
	.word 0xbd504000  ! 13: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2dc000  ! 23: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfc35e164  ! 24: STH_I	sth	%r30, [%r23 + 0x0164]
	.word 0xf42d8000  ! 29: STB_R	stb	%r26, [%r22 + %r0]
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a123  ! 31: WRPR_TICK_I	wrpr	%r22, 0x0123, %tick
	.word 0xf83ce01a  ! 33: STD_I	std	%r28, [%r19 + 0x001a]
	.word 0xf874e11a  ! 35: STX_I	stx	%r28, [%r19 + 0x011a]
	.word 0xf625609d  ! 36: STW_I	stw	%r27, [%r21 + 0x009d]
	.word 0xf13de050  ! 39: STDF_I	std	%f24, [0x0050, %r23]
	.word 0x85952077  ! 40: WRPR_TSTATE_I	wrpr	%r20, 0x0077, %tstate
	.word 0xf07560a3  ! 41: STX_I	stx	%r24, [%r21 + 0x00a3]
	.word 0xf634e051  ! 42: STH_I	sth	%r27, [%r19 + 0x0051]
	.word 0xf33c6013  ! 45: STDF_I	std	%f25, [0x0013, %r17]
	.word 0xfa75a1b2  ! 46: STX_I	stx	%r29, [%r22 + 0x01b2]
	.word 0xb1500000  ! 47: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfc2420fe  ! 48: STW_I	stw	%r30, [%r16 + 0x00fe]
	.word 0xbb520000  ! 49: RDPR_PIL	<illegal instruction>
	.word 0xfb3c8000  ! 51: STDF_R	std	%f29, [%r0, %r18]
	.word 0xf625e04f  ! 53: STW_I	stw	%r27, [%r23 + 0x004f]
	.word 0xfc3dc000  ! 54: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf82ca03b  ! 58: STB_I	stb	%r28, [%r18 + 0x003b]
	.word 0xfc344000  ! 62: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfd3dc000  ! 65: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf03c8000  ! 66: STD_R	std	%r24, [%r18 + %r0]
	.word 0xb17ca401  ! 67: MOVR_I	movre	%r18, 0x1, %r24
	.word 0xbf518000  ! 70: RDPR_PSTATE	<illegal instruction>
	.word 0xf63c6170  ! 71: STD_I	std	%r27, [%r17 + 0x0170]
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73dc000  ! 76: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf475a196  ! 77: STX_I	stx	%r26, [%r22 + 0x0196]
	.word 0xf6350000  ! 78: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xff3d0000  ! 82: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb1518000  ! 83: RDPR_PSTATE	<illegal instruction>
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 89: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 91: RDPR_TL	<illegal instruction>
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xf22c4000  ! 98: STB_R	stb	%r25, [%r17 + %r0]
	.word 0x8595a03d  ! 99: WRPR_TSTATE_I	wrpr	%r22, 0x003d, %tstate
	.word 0xf6350000  ! 108: STH_R	sth	%r27, [%r20 + %r0]
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23d0000  ! 114: XNOR_R	xnor 	%r20, %r0, %r25
	mov	2, %r12
	.word 0x8f932000  ! 117: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc754000  ! 122: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf23cc000  ! 124: STD_R	std	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0xb9510000  ! 130: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf824a0fa  ! 136: STW_I	stw	%r28, [%r18 + 0x00fa]
	.word 0xfc34a145  ! 138: STH_I	sth	%r30, [%r18 + 0x0145]
	.word 0x899460d6  ! 139: WRPR_TICK_I	wrpr	%r17, 0x00d6, %tick
	.word 0x8395e129  ! 141: WRPR_TNPC_I	wrpr	%r23, 0x0129, %tnpc
	.word 0x8d9561d9  ! 142: WRPR_PSTATE_I	wrpr	%r21, 0x01d9, %pstate
	.word 0xf8250000  ! 143: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf674e081  ! 147: STX_I	stx	%r27, [%r19 + 0x0081]
	.word 0xb3518000  ! 150: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf8258000  ! 151: STW_R	stw	%r28, [%r22 + %r0]
	.word 0x87942071  ! 152: WRPR_TT_I	wrpr	%r16, 0x0071, %tt
	.word 0x8d95202d  ! 155: WRPR_PSTATE_I	wrpr	%r20, 0x002d, %pstate
	.word 0xb0b4a1d4  ! 159: ORNcc_I	orncc 	%r18, 0x01d4, %r24
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf235e19a  ! 163: STH_I	sth	%r25, [%r23 + 0x019a]
	.word 0xb0ad0000  ! 165: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0x9195a090  ! 166: WRPR_PIL_I	wrpr	%r22, 0x0090, %pil
	.word 0xf73d6045  ! 168: STDF_I	std	%f27, [0x0045, %r21]
	.word 0xb0ace0f4  ! 170: ANDNcc_I	andncc 	%r19, 0x00f4, %r24
	.word 0x8d9461b4  ! 174: WRPR_PSTATE_I	wrpr	%r17, 0x01b4, %pstate
	.word 0xf83c2083  ! 177: STD_I	std	%r28, [%r16 + 0x0083]
	.word 0xfb3de169  ! 180: STDF_I	std	%f29, [0x0169, %r23]
	.word 0xfc24217f  ! 181: STW_I	stw	%r30, [%r16 + 0x017f]
	.word 0xf875e1fb  ! 182: STX_I	stx	%r28, [%r23 + 0x01fb]
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859421b7  ! 185: WRPR_TSTATE_I	wrpr	%r16, 0x01b7, %tstate
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81982c43  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	setx	data_start_0, %g1, %r18
	.word 0xb6142161  ! 203: OR_I	or 	%r16, 0x0161, %r27
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983ec3  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec3, %hpstate
	.word 0xf67521ab  ! 209: STX_I	stx	%r27, [%r20 + 0x01ab]
	.word 0x8395214c  ! 210: WRPR_TNPC_I	wrpr	%r20, 0x014c, %tnpc
	setx	data_start_6, %g1, %r17
	.word 0xfb3c8000  ! 214: STDF_R	std	%f29, [%r0, %r18]
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42de1ce  ! 224: STB_I	stb	%r26, [%r23 + 0x01ce]
	.word 0x8194e06e  ! 226: WRPR_TPC_I	wrpr	%r19, 0x006e, %tpc
	.word 0xfc75a044  ! 227: STX_I	stx	%r30, [%r22 + 0x0044]
	.word 0xb7643801  ! 232: MOVcc_I	<illegal instruction>
	.word 0xf83420ff  ! 233: STH_I	sth	%r28, [%r16 + 0x00ff]
	.word 0xb3540000  ! 234: RDPR_GL	rdpr	%-, %r25
	.word 0xf83da067  ! 235: STD_I	std	%r28, [%r22 + 0x0067]
	.word 0xfe2c0000  ! 236: STB_R	stb	%r31, [%r16 + %r0]
	.word 0x919560a7  ! 239: WRPR_PIL_I	wrpr	%r21, 0x00a7, %pil
	.word 0xf4758000  ! 240: STX_R	stx	%r26, [%r22 + %r0]
	setx	data_start_0, %g1, %r18
	.word 0xfb3dc000  ! 245: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfe752028  ! 246: STX_I	stx	%r31, [%r20 + 0x0028]
	.word 0xb6b5e0be  ! 249: SUBCcc_I	orncc 	%r23, 0x00be, %r27
	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0850000  ! 251: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xfe2ce082  ! 252: STB_I	stb	%r31, [%r19 + 0x0082]
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d2020  ! 258: STDF_I	std	%f31, [0x0020, %r20]
	.word 0xf93d0000  ! 262: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfc2d8000  ! 263: STB_R	stb	%r30, [%r22 + %r0]
	.word 0x8195e074  ! 266: WRPR_TPC_I	wrpr	%r23, 0x0074, %tpc
	.word 0xb1508000  ! 267: RDPR_TSTATE	rdpr	%tstate, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf53c204f  ! 275: STDF_I	std	%f26, [0x004f, %r16]
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf4748000  ! 279: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfd3c218c  ! 280: STDF_I	std	%f30, [0x018c, %r16]
	.word 0xf93d0000  ! 285: STDF_R	std	%f28, [%r0, %r20]
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87952042  ! 289: WRPR_TT_I	wrpr	%r20, 0x0042, %tt
	.word 0xf824c000  ! 292: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfe3c611e  ! 293: STD_I	std	%r31, [%r17 + 0x011e]
	.word 0xfa2d21ea  ! 294: STB_I	stb	%r29, [%r20 + 0x01ea]
	.word 0xbe3cc000  ! 298: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xbaad210d  ! 301: ANDNcc_I	andncc 	%r20, 0x010d, %r29
	.word 0xb3500000  ! 303: RDPR_TPC	rdpr	%tpc, %r25
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c4000  ! 307: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfc3d4000  ! 308: STD_R	std	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf835216f  ! 312: STH_I	sth	%r28, [%r20 + 0x016f]
	.word 0xbf7ca401  ! 317: MOVR_I	movre	%r18, 0x1, %r31
	.word 0xbe9421d9  ! 319: ORcc_I	orcc 	%r16, 0x01d9, %r31
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf234616d  ! 321: STH_I	sth	%r25, [%r17 + 0x016d]
	.word 0xf03c6126  ! 322: STD_I	std	%r24, [%r17 + 0x0126]
	.word 0xb5508000  ! 327: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf93d20bd  ! 331: STDF_I	std	%f28, [0x00bd, %r20]
	.word 0xfe34605f  ! 333: STH_I	sth	%r31, [%r17 + 0x005f]
	.word 0xbc1c4000  ! 335: XOR_R	xor 	%r17, %r0, %r30
	.word 0xb5518000  ! 337: RDPR_PSTATE	<illegal instruction>
	.word 0xb2a5a1b9  ! 342: SUBcc_I	subcc 	%r22, 0x01b9, %r25
	.word 0xf13ce0e6  ! 343: STDF_I	std	%f24, [0x00e6, %r19]
	.word 0xf0750000  ! 344: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xbf3ca001  ! 347: SRA_I	sra 	%r18, 0x0001, %r31
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83c60a7  ! 349: STD_I	std	%r28, [%r17 + 0x00a7]
	.word 0xb7518000  ! 353: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbec48000  ! 354: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xfd3d0000  ! 355: STDF_R	std	%f30, [%r0, %r20]
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 358: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	.word 0xf0758000  ! 360: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf83c4000  ! 361: STD_R	std	%r28, [%r17 + %r0]
	.word 0xf224c000  ! 366: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf22c0000  ! 371: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xbb500000  ! 372: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb33da001  ! 373: SRA_I	sra 	%r22, 0x0001, %r25
	.word 0xf42ce119  ! 374: STB_I	stb	%r26, [%r19 + 0x0119]
	.word 0xff3c8000  ! 376: STDF_R	std	%f31, [%r0, %r18]
	setx	0x3030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 379: RDPR_GL	rdpr	%-, %r29
	.word 0xfe3c616c  ! 384: STD_I	std	%r31, [%r17 + 0x016c]
	.word 0xf23d8000  ! 388: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf63c4000  ! 389: STD_R	std	%r27, [%r17 + %r0]
	.word 0xb9504000  ! 390: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb7508000  ! 398: RDPR_TSTATE	<illegal instruction>
	.word 0xf8742025  ! 401: STX_I	stx	%r28, [%r16 + 0x0025]
	.word 0xbd504000  ! 402: RDPR_TNPC	<illegal instruction>
	.word 0xba054000  ! 404: ADD_R	add 	%r21, %r0, %r29
	.word 0xb8840000  ! 405: ADDcc_R	addcc 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62cc000  ! 411: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf83cc000  ! 413: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf73da050  ! 415: STDF_I	std	%f27, [0x0050, %r22]
	mov	0, %r14
	.word 0xa193a000  ! 417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc250000  ! 423: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfa344000  ! 424: STH_R	sth	%r29, [%r17 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 425: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd500000  ! 428: RDPR_TPC	rdpr	%tpc, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0xf62461c4  ! 438: STW_I	stw	%r27, [%r17 + 0x01c4]
	.word 0xf73c612e  ! 439: STDF_I	std	%f27, [0x012e, %r17]
	.word 0xbd3c8000  ! 440: SRA_R	sra 	%r18, %r0, %r30
	.word 0xb8140000  ! 441: OR_R	or 	%r16, %r0, %r28
	.word 0xfb3d4000  ! 446: STDF_R	std	%f29, [%r0, %r21]
	.word 0xbf500000  ! 447: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf875e02d  ! 448: STX_I	stx	%r28, [%r23 + 0x002d]
	.word 0xfe2d4000  ! 451: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xb495c000  ! 458: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xf6742181  ! 461: STX_I	stx	%r27, [%r16 + 0x0181]
	.word 0xfc3c8000  ! 465: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf62d4000  ! 467: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf82c2161  ! 468: STB_I	stb	%r28, [%r16 + 0x0161]
	.word 0xf93de073  ! 477: STDF_I	std	%f28, [0x0073, %r23]
	.word 0xb845c000  ! 478: ADDC_R	addc 	%r23, %r0, %r28
	.word 0xf82c0000  ! 482: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb5508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xfc758000  ! 488: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfd3cc000  ! 491: STDF_R	std	%f30, [%r0, %r19]
	.word 0xbe0ca134  ! 493: AND_I	and 	%r18, 0x0134, %r31
	.word 0xf0254000  ! 497: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf73d4000  ! 500: STDF_R	std	%f27, [%r0, %r21]
	.word 0xb4246152  ! 503: SUB_I	sub 	%r17, 0x0152, %r26
	.word 0xf8340000  ! 511: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xb3500000  ! 512: RDPR_TPC	<illegal instruction>
	.word 0x85952166  ! 514: WRPR_TSTATE_I	wrpr	%r20, 0x0166, %tstate
	.word 0xb3510000  ! 515: RDPR_TICK	rdpr	%tick, %r25
	mov	2, %r12
	.word 0x8f932000  ! 517: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2d0000  ! 519: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc252128  ! 522: STW_I	stw	%r30, [%r20 + 0x0128]
	.word 0xb350c000  ! 524: RDPR_TT	rdpr	%tt, %r25
	.word 0xf83de095  ! 525: STD_I	std	%r28, [%r23 + 0x0095]
	.word 0xb014c000  ! 531: OR_R	or 	%r19, %r0, %r24
	.word 0xb0bce0e7  ! 533: XNORcc_I	xnorcc 	%r19, 0x00e7, %r24
	.word 0x8995216e  ! 534: WRPR_TICK_I	wrpr	%r20, 0x016e, %tick
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d2123  ! 537: STD_I	std	%r29, [%r20 + 0x0123]
	.word 0x8d95a1c9  ! 538: WRPR_PSTATE_I	wrpr	%r22, 0x01c9, %pstate
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674e054  ! 545: STX_I	stx	%r27, [%r19 + 0x0054]
	.word 0xf53d8000  ! 550: STDF_R	std	%f26, [%r0, %r22]
	setx	data_start_6, %g1, %r17
	.word 0xf33d4000  ! 555: STDF_R	std	%f25, [%r0, %r21]
	.word 0xfd3de055  ! 557: STDF_I	std	%f30, [0x0055, %r23]
	.word 0xb151c000  ! 559: RDPR_TL	rdpr	%tl, %r24
	.word 0xf87420ff  ! 561: STX_I	stx	%r28, [%r16 + 0x00ff]
	.word 0xba1ce121  ! 562: XOR_I	xor 	%r19, 0x0121, %r29
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 565: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0xbd508000  ! 570: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfd3d8000  ! 571: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf42dc000  ! 572: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xff3ca105  ! 575: STDF_I	std	%f31, [0x0105, %r18]
	.word 0xf875206a  ! 580: STX_I	stx	%r28, [%r20 + 0x006a]
	.word 0xf025e0ac  ! 583: STW_I	stw	%r24, [%r23 + 0x00ac]
	.word 0xf53da12a  ! 585: STDF_I	std	%f26, [0x012a, %r22]
	.word 0xf224c000  ! 589: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf13d6047  ! 591: STDF_I	std	%f24, [0x0047, %r21]
	.word 0x819420f6  ! 594: WRPR_TPC_I	wrpr	%r16, 0x00f6, %tpc
	mov	0, %r12
	.word 0x8f932000  ! 596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982c5b  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c0000  ! 606: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfe75e127  ! 608: STX_I	stx	%r31, [%r23 + 0x0127]
	.word 0xf02c8000  ! 610: STB_R	stb	%r24, [%r18 + %r0]
	.word 0x8d9560a6  ! 612: WRPR_PSTATE_I	wrpr	%r21, 0x00a6, %pstate
	.word 0xf8342039  ! 613: STH_I	sth	%r28, [%r16 + 0x0039]
	.word 0xf024204f  ! 615: STW_I	stw	%r24, [%r16 + 0x004f]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf13c0000  ! 622: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfa354000  ! 624: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb1520000  ! 625: RDPR_PIL	rdpr	%pil, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xfa34e027  ! 630: STH_I	sth	%r29, [%r19 + 0x0027]
	.word 0xb32d4000  ! 635: SLL_R	sll 	%r21, %r0, %r25
	mov	2, %r12
	.word 0x8f932000  ! 636: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf635a0ae  ! 637: STH_I	sth	%r27, [%r22 + 0x00ae]
	.word 0xb9540000  ! 641: RDPR_GL	rdpr	%-, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf42ca069  ! 647: STB_I	stb	%r26, [%r18 + 0x0069]
	mov	1, %r14
	.word 0xa193a000  ! 648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x839521f8  ! 649: WRPR_TNPC_I	wrpr	%r20, 0x01f8, %tnpc
	.word 0xfa2d6057  ! 650: STB_I	stb	%r29, [%r21 + 0x0057]
	.word 0xbe244000  ! 652: SUB_R	sub 	%r17, %r0, %r31
	.word 0xf03d207f  ! 657: STD_I	std	%r24, [%r20 + 0x007f]
	.word 0xf23cc000  ! 658: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf875a12c  ! 663: STX_I	stx	%r28, [%r22 + 0x012c]
	.word 0xba9c8000  ! 669: XORcc_R	xorcc 	%r18, %r0, %r29
	.word 0xfe34e0e3  ! 671: STH_I	sth	%r31, [%r19 + 0x00e3]
	.word 0xb8b4a0a4  ! 672: ORNcc_I	orncc 	%r18, 0x00a4, %r28
	.word 0xfc35a058  ! 673: STH_I	sth	%r30, [%r22 + 0x0058]
	.word 0xbf520000  ! 674: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf02dc000  ! 675: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb32dc000  ! 676: SLL_R	sll 	%r23, %r0, %r25
	.word 0xb1520000  ! 678: RDPR_PIL	<illegal instruction>
	.word 0x8594602a  ! 680: WRPR_TSTATE_I	wrpr	%r17, 0x002a, %tstate
	.word 0xfc258000  ! 681: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf83d6071  ! 685: STD_I	std	%r28, [%r21 + 0x0071]
	.word 0xfc3cc000  ! 688: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf874c000  ! 689: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xbd480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba2c8000  ! 695: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xf074a150  ! 698: STX_I	stx	%r24, [%r18 + 0x0150]
	.word 0xf4258000  ! 699: STW_R	stw	%r26, [%r22 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 701: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa34a03e  ! 705: STH_I	sth	%r29, [%r18 + 0x003e]
	.word 0xf33c613e  ! 707: STDF_I	std	%f25, [0x013e, %r17]
	.word 0xf874c000  ! 709: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf875a170  ! 710: STX_I	stx	%r28, [%r22 + 0x0170]
	.word 0xf82ce0c2  ! 711: STB_I	stb	%r28, [%r19 + 0x00c2]
	.word 0xfc3de09c  ! 713: STD_I	std	%r30, [%r23 + 0x009c]
	.word 0xfc7421e4  ! 720: STX_I	stx	%r30, [%r16 + 0x01e4]
	setx	data_start_5, %g1, %r16
	.word 0xfc3ca0c5  ! 723: STD_I	std	%r30, [%r18 + 0x00c5]
	.word 0x819461f0  ! 724: WRPR_TPC_I	wrpr	%r17, 0x01f0, %tpc
	.word 0xfc34a19f  ! 726: STH_I	sth	%r30, [%r18 + 0x019f]
	.word 0xfe25a06e  ! 728: STW_I	stw	%r31, [%r22 + 0x006e]
	.word 0xf82de1da  ! 735: STB_I	stb	%r28, [%r23 + 0x01da]
	.word 0xf43c60ec  ! 737: STD_I	std	%r26, [%r17 + 0x00ec]
	mov	0, %r12
	.word 0x8f932000  ! 742: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3520000  ! 746: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf62c8000  ! 748: STB_R	stb	%r27, [%r18 + %r0]
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0d204b  ! 756: AND_I	and 	%r20, 0x004b, %r31
	.word 0xf03520a5  ! 759: STH_I	sth	%r24, [%r20 + 0x00a5]
	.word 0xb89c4000  ! 765: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xf8344000  ! 766: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf6254000  ! 768: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf73d0000  ! 769: STDF_R	std	%f27, [%r0, %r20]
	setx	0x225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2ce0da  ! 774: STB_I	stb	%r30, [%r19 + 0x00da]
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 777: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf73c2115  ! 778: STDF_I	std	%f27, [0x0115, %r16]
	.word 0xfc244000  ! 779: STW_R	stw	%r30, [%r17 + %r0]
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3561bd  ! 783: SUBC_I	orn 	%r21, 0x01bd, %r31
	.word 0xb1508000  ! 784: RDPR_TSTATE	<illegal instruction>
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabca1ea  ! 791: XNORcc_I	xnorcc 	%r18, 0x01ea, %r29
	mov	1, %r14
	.word 0xa193a000  ! 794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff3d2194  ! 796: STDF_I	std	%f31, [0x0194, %r20]
	.word 0xf73c4000  ! 797: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf874a030  ! 798: STX_I	stx	%r28, [%r18 + 0x0030]
	.word 0xfe75a145  ! 800: STX_I	stx	%r31, [%r22 + 0x0145]
	.word 0xfc348000  ! 802: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfa254000  ! 809: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf234c000  ! 811: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf0244000  ! 813: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf0744000  ! 816: STX_R	stx	%r24, [%r17 + %r0]
	.word 0x859421cc  ! 817: WRPR_TSTATE_I	wrpr	%r16, 0x01cc, %tstate
	.word 0xf6250000  ! 819: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xbd3ca001  ! 820: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0x81956090  ! 824: WRPR_TPC_I	wrpr	%r21, 0x0090, %tpc
	.word 0xbf641800  ! 825: MOVcc_R	<illegal instruction>
	.word 0xf634209d  ! 828: STH_I	sth	%r27, [%r16 + 0x009d]
	.word 0xff3d6094  ! 832: STDF_I	std	%f31, [0x0094, %r21]
	.word 0xf62c2038  ! 835: STB_I	stb	%r27, [%r16 + 0x0038]
	.word 0xbb51c000  ! 836: RDPR_TL	rdpr	%tl, %r29
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bde15d  ! 843: XNORcc_I	xnorcc 	%r23, 0x015d, %r28
	.word 0xfe25c000  ! 846: STW_R	stw	%r31, [%r23 + %r0]
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3c4000  ! 849: STDF_R	std	%f30, [%r0, %r17]
	.word 0xff3d20d4  ! 851: STDF_I	std	%f31, [0x00d4, %r20]
	setx	0x2003d, %g1, %o0
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
	.word 0xf22de06d  ! 858: STB_I	stb	%r25, [%r23 + 0x006d]
	.word 0xf0358000  ! 860: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xff3d607a  ! 861: STDF_I	std	%f31, [0x007a, %r21]
	.word 0xf13de123  ! 862: STDF_I	std	%f24, [0x0123, %r23]
	.word 0x8d94a0e3  ! 863: WRPR_PSTATE_I	wrpr	%r18, 0x00e3, %pstate
	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c6107  ! 871: STDF_I	std	%f31, [0x0107, %r17]
	.word 0xbe2de094  ! 873: ANDN_I	andn 	%r23, 0x0094, %r31
	setx	0x3023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3ce0b4  ! 877: STD_I	std	%r31, [%r19 + 0x00b4]
	.word 0xf47560e2  ! 878: STX_I	stx	%r26, [%r21 + 0x00e2]
	.word 0xb7500000  ! 879: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf42da045  ! 880: STB_I	stb	%r26, [%r22 + 0x0045]
	.word 0xb7540000  ! 881: RDPR_GL	<illegal instruction>
	.word 0xf22ce178  ! 882: STB_I	stb	%r25, [%r19 + 0x0178]
	setx	0x10234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919561d4  ! 887: WRPR_PIL_I	wrpr	%r21, 0x01d4, %pil
	.word 0xfa74208c  ! 888: STX_I	stx	%r29, [%r16 + 0x008c]
	.word 0xfe758000  ! 889: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xb7510000  ! 892: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf2350000  ! 893: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfa3cc000  ! 898: STD_R	std	%r29, [%r19 + %r0]
	.word 0x8395203e  ! 899: WRPR_TNPC_I	wrpr	%r20, 0x003e, %tnpc
	.word 0xb635e0e8  ! 900: ORN_I	orn 	%r23, 0x00e8, %r27
	.word 0x85952070  ! 901: WRPR_TSTATE_I	wrpr	%r20, 0x0070, %tstate
	.word 0xba2d2151  ! 902: ANDN_I	andn 	%r20, 0x0151, %r29
	.word 0xf83d4000  ! 903: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfc3c21d9  ! 904: STD_I	std	%r30, [%r16 + 0x01d9]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6952025  ! 913: ORcc_I	orcc 	%r20, 0x0025, %r27
	.word 0xbebc8000  ! 915: XNORcc_R	xnorcc 	%r18, %r0, %r31
	mov	2, %r12
	.word 0x8f932000  ! 917: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf93de113  ! 918: STDF_I	std	%f28, [0x0113, %r23]
	.word 0xb8b4a092  ! 921: ORNcc_I	orncc 	%r18, 0x0092, %r28
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 930: MOVcc_I	<illegal instruction>
	.word 0xfa74a107  ! 931: STX_I	stx	%r29, [%r18 + 0x0107]
	setx	data_start_3, %g1, %r16
	.word 0xbf520000  ! 940: RDPR_PIL	rdpr	%pil, %r31
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 944: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 950: STW_R	stw	%r25, [%r16 + %r0]
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d0000  ! 954: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf83d20c1  ! 955: STD_I	std	%r28, [%r20 + 0x00c1]
	.word 0xb6ace0c3  ! 959: ANDNcc_I	andncc 	%r19, 0x00c3, %r27
	.word 0xf074a0b5  ! 962: STX_I	stx	%r24, [%r18 + 0x00b5]
	.word 0xf83420f8  ! 965: STH_I	sth	%r28, [%r16 + 0x00f8]
	.word 0xf43c8000  ! 968: STD_R	std	%r26, [%r18 + %r0]
	.word 0xff3c61bf  ! 969: STDF_I	std	%f31, [0x01bf, %r17]
	.word 0xb93d8000  ! 970: SRA_R	sra 	%r22, %r0, %r28
	.word 0xf424a045  ! 971: STW_I	stw	%r26, [%r18 + 0x0045]
	.word 0xf275a1c7  ! 972: STX_I	stx	%r25, [%r22 + 0x01c7]
	.word 0xbd2cc000  ! 973: SLL_R	sll 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983e0b  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0b, %hpstate
	.word 0xfc2d8000  ! 979: STB_R	stb	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf83c0000  ! 982: STD_R	std	%r28, [%r16 + %r0]
	.word 0x8d952036  ! 983: WRPR_PSTATE_I	wrpr	%r20, 0x0036, %pstate
	.word 0xb9480000  ! 986: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198384b  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184b, %hpstate
	.word 0xb61d60d5  ! 994: XOR_I	xor 	%r21, 0x00d5, %r27
	.word 0xbe340000  ! 996: SUBC_R	orn 	%r16, %r0, %r31
	setx	0x1002a, %g1, %o0
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
	.word 0xfd3c4000  ! 999: STDF_R	std	%f30, [%r0, %r17]
	setx	0x20330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24c000  ! 1002: STW_R	stw	%r30, [%r19 + %r0]
	.word 0x8195208d  ! 1008: WRPR_TPC_I	wrpr	%r20, 0x008d, %tpc
	.word 0xf2756108  ! 1015: STX_I	stx	%r25, [%r21 + 0x0108]
	.word 0xb150c000  ! 1018: RDPR_TT	rdpr	%tt, %r24
	.word 0xf4246070  ! 1021: STW_I	stw	%r26, [%r17 + 0x0070]
	.word 0xbb510000  ! 1022: RDPR_TICK	<illegal instruction>
	.word 0xbf7d6401  ! 1023: MOVR_I	movre	%r21, 0x1, %r31
	.word 0xf2358000  ! 1024: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf73ca1d3  ! 1027: STDF_I	std	%f27, [0x01d3, %r18]
	.word 0xf0340000  ! 1032: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xbd3cd000  ! 1040: SRAX_R	srax	%r19, %r0, %r30
	.word 0xfa752132  ! 1042: STX_I	stx	%r29, [%r20 + 0x0132]
	.word 0xbb518000  ! 1045: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a8b  ! 1051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	.word 0xf43c4000  ! 1052: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb550c000  ! 1054: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22d0000  ! 1056: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xbf540000  ! 1057: RDPR_GL	<illegal instruction>
	.word 0xb204c000  ! 1059: ADD_R	add 	%r19, %r0, %r25
	setx	data_start_2, %g1, %r20
	.word 0xf824e1b7  ! 1066: STW_I	stw	%r28, [%r19 + 0x01b7]
	.word 0xfd3c4000  ! 1067: STDF_R	std	%f30, [%r0, %r17]
	.word 0x859421dc  ! 1068: WRPR_TSTATE_I	wrpr	%r16, 0x01dc, %tstate
	.word 0x8394a039  ! 1071: WRPR_TNPC_I	wrpr	%r18, 0x0039, %tnpc
	.word 0xb550c000  ! 1073: RDPR_TT	rdpr	%tt, %r26
	.word 0xf83d20b9  ! 1074: STD_I	std	%r28, [%r20 + 0x00b9]
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0256052  ! 1077: STW_I	stw	%r24, [%r21 + 0x0052]
	.word 0xf075a0d9  ! 1079: STX_I	stx	%r24, [%r22 + 0x00d9]
	.word 0xf83c0000  ! 1080: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf6340000  ! 1081: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf424a171  ! 1085: STW_I	stw	%r26, [%r18 + 0x0171]
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf474e017  ! 1090: STX_I	stx	%r26, [%r19 + 0x0017]
	.word 0xf03de05a  ! 1091: STD_I	std	%r24, [%r23 + 0x005a]
	.word 0xf02ca126  ! 1096: STB_I	stb	%r24, [%r18 + 0x0126]
	.word 0xf73c0000  ! 1097: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb61520ae  ! 1101: OR_I	or 	%r20, 0x00ae, %r27
	.word 0xfa2c0000  ! 1107: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb625e119  ! 1108: SUB_I	sub 	%r23, 0x0119, %r27
	.word 0xf624a15a  ! 1109: STW_I	stw	%r27, [%r18 + 0x015a]
	.word 0x81956100  ! 1115: WRPR_TPC_I	wrpr	%r21, 0x0100, %tpc
	.word 0xb81c6016  ! 1122: XOR_I	xor 	%r17, 0x0016, %r28
	.word 0x9194a0e0  ! 1123: WRPR_PIL_I	wrpr	%r18, 0x00e0, %pil
	.word 0xf13c2119  ! 1127: STDF_I	std	%f24, [0x0119, %r16]
	.word 0xbf500000  ! 1132: RDPR_TPC	rdpr	%tpc, %r31
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1134: RDPR_TICK	<illegal instruction>
	.word 0xbea40000  ! 1137: SUBcc_R	subcc 	%r16, %r0, %r31
	.word 0x8d95a0e3  ! 1141: WRPR_PSTATE_I	wrpr	%r22, 0x00e3, %pstate
	.word 0xb0ac6132  ! 1142: ANDNcc_I	andncc 	%r17, 0x0132, %r24
	.word 0x83952035  ! 1143: WRPR_TNPC_I	wrpr	%r20, 0x0035, %tnpc
	.word 0xb7342001  ! 1144: SRL_I	srl 	%r16, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 1151: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7504000  ! 1152: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf424a0d4  ! 1153: STW_I	stw	%r26, [%r18 + 0x00d4]
	.word 0xf0240000  ! 1154: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb7510000  ! 1155: RDPR_TICK	<illegal instruction>
	.word 0xfe2ca1ab  ! 1156: STB_I	stb	%r31, [%r18 + 0x01ab]
	.word 0xfc25c000  ! 1164: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf824e15c  ! 1170: STW_I	stw	%r28, [%r19 + 0x015c]
	.word 0xb5520000  ! 1173: RDPR_PIL	<illegal instruction>
	.word 0xfc2dc000  ! 1176: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf62dc000  ! 1177: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf42c4000  ! 1178: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf73cc000  ! 1181: STDF_R	std	%f27, [%r0, %r19]
	.word 0xb1540000  ! 1185: RDPR_GL	<illegal instruction>
	.word 0xfa35c000  ! 1187: STH_R	sth	%r29, [%r23 + %r0]
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72df001  ! 1189: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xb92cf001  ! 1193: SLLX_I	sllx	%r19, 0x0001, %r28
	.word 0xbe144000  ! 1194: OR_R	or 	%r17, %r0, %r31
	.word 0xfc2ca139  ! 1195: STB_I	stb	%r30, [%r18 + 0x0139]
	.word 0xb77d2401  ! 1201: MOVR_I	movre	%r20, 0x1, %r27
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xf824c000  ! 1205: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xbd3d6001  ! 1206: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xfa2c4000  ! 1207: STB_R	stb	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf824e100  ! 1216: STW_I	stw	%r28, [%r19 + 0x0100]
	ta	T_CHANGE_HPRIV
	.word 0x81982c11  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c11, %hpstate
	.word 0xf23ca155  ! 1222: STD_I	std	%r25, [%r18 + 0x0155]
	.word 0xf63c8000  ! 1223: STD_R	std	%r27, [%r18 + %r0]
	.word 0x8395a0cd  ! 1226: WRPR_TNPC_I	wrpr	%r22, 0x00cd, %tnpc
	.word 0x85946115  ! 1228: WRPR_TSTATE_I	wrpr	%r17, 0x0115, %tstate
	.word 0x9195607a  ! 1229: WRPR_PIL_I	wrpr	%r21, 0x007a, %pil
	.word 0xfa2d20ee  ! 1230: STB_I	stb	%r29, [%r20 + 0x00ee]
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6350000  ! 1237: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xfd3ca0da  ! 1238: STDF_I	std	%f30, [0x00da, %r18]
	.word 0xb80560bf  ! 1239: ADD_I	add 	%r21, 0x00bf, %r28
	.word 0x8d95613f  ! 1240: WRPR_PSTATE_I	wrpr	%r21, 0x013f, %pstate
	.word 0xfc74e164  ! 1241: STX_I	stx	%r30, [%r19 + 0x0164]
	.word 0xb7540000  ! 1243: RDPR_GL	rdpr	%-, %r27
	.word 0xf4248000  ! 1244: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf234e0a2  ! 1247: STH_I	sth	%r25, [%r19 + 0x00a2]
	.word 0xb2c5c000  ! 1249: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0x8395a165  ! 1253: WRPR_TNPC_I	wrpr	%r22, 0x0165, %tnpc
	.word 0xb150c000  ! 1254: RDPR_TT	rdpr	%tt, %r24
	.word 0xfc35a06a  ! 1255: STH_I	sth	%r30, [%r22 + 0x006a]
	.word 0xf6356087  ! 1257: STH_I	sth	%r27, [%r21 + 0x0087]
	.word 0xfb3d4000  ! 1260: STDF_R	std	%f29, [%r0, %r21]
	.word 0x89956087  ! 1263: WRPR_TICK_I	wrpr	%r21, 0x0087, %tick
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 1268: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf674c000  ! 1270: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfc75c000  ! 1272: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfa2d6161  ! 1274: STB_I	stb	%r29, [%r21 + 0x0161]
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 1276: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf02c0000  ! 1278: STB_R	stb	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf540000  ! 1280: RDPR_GL	rdpr	%-, %r31
	.word 0xf4344000  ! 1289: STH_R	sth	%r26, [%r17 + %r0]
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74e170  ! 1293: STX_I	stx	%r29, [%r19 + 0x0170]
	setx	0x30303, %g1, %o0
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
	.word 0xfe258000  ! 1301: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xb6258000  ! 1304: SUB_R	sub 	%r22, %r0, %r27
	setx	data_start_0, %g1, %r22
	.word 0xf03c60e9  ! 1306: STD_I	std	%r24, [%r17 + 0x00e9]
	.word 0x8d95a1e9  ! 1308: WRPR_PSTATE_I	wrpr	%r22, 0x01e9, %pstate
	.word 0xb3643801  ! 1310: MOVcc_I	<illegal instruction>
	setx	0x1010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb82c8000  ! 1317: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xf33d8000  ! 1318: STDF_R	std	%f25, [%r0, %r22]
	.word 0xbb508000  ! 1321: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf874604d  ! 1323: STX_I	stx	%r28, [%r17 + 0x004d]
	.word 0xfe2ca102  ! 1324: STB_I	stb	%r31, [%r18 + 0x0102]
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a1fa  ! 1327: WRPR_TNPC_I	wrpr	%r22, 0x01fa, %tnpc
	.word 0xbf480000  ! 1329: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf474a0c7  ! 1331: STX_I	stx	%r26, [%r18 + 0x00c7]
	.word 0xfa75e05f  ! 1332: STX_I	stx	%r29, [%r23 + 0x005f]
	.word 0xb33c3001  ! 1336: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0x8394a03b  ! 1340: WRPR_TNPC_I	wrpr	%r18, 0x003b, %tnpc
	.word 0xf874a1b6  ! 1341: STX_I	stx	%r28, [%r18 + 0x01b6]
	.word 0xfa740000  ! 1342: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xbb510000  ! 1343: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb951c000  ! 1345: RDPR_TL	<illegal instruction>
	.word 0xf03d4000  ! 1349: STD_R	std	%r24, [%r21 + %r0]
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d601d  ! 1354: STD_I	std	%r31, [%r21 + 0x001d]
	.word 0xbd500000  ! 1357: RDPR_TPC	<illegal instruction>
	.word 0xf274a03a  ! 1358: STX_I	stx	%r25, [%r18 + 0x003a]
	.word 0xb835c000  ! 1359: ORN_R	orn 	%r23, %r0, %r28
	.word 0xfa2c0000  ! 1360: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xbc2521ba  ! 1362: SUB_I	sub 	%r20, 0x01ba, %r30
	setx	data_start_2, %g1, %r21
	.word 0xbf510000  ! 1367: RDPR_TICK	<illegal instruction>
	.word 0xb42c2012  ! 1369: ANDN_I	andn 	%r16, 0x0012, %r26
	.word 0xf73d8000  ! 1372: STDF_R	std	%f27, [%r0, %r22]
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1378: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4352119  ! 1380: STH_I	sth	%r26, [%r20 + 0x0119]
	.word 0xf47421bc  ! 1382: STX_I	stx	%r26, [%r16 + 0x01bc]
	.word 0xbf518000  ! 1384: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb950c000  ! 1385: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 1387: RDPR_TSTATE	<illegal instruction>
	.word 0xf53ce071  ! 1391: STDF_I	std	%f26, [0x0071, %r19]
	.word 0xf474e1a9  ! 1392: STX_I	stx	%r26, [%r19 + 0x01a9]
	.word 0x8195e0ed  ! 1399: WRPR_TPC_I	wrpr	%r23, 0x00ed, %tpc
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e168  ! 1404: WRPR_TT_I	wrpr	%r19, 0x0168, %tt
	.word 0x8994203a  ! 1406: WRPR_TICK_I	wrpr	%r16, 0x003a, %tick
	.word 0xf6752111  ! 1410: STX_I	stx	%r27, [%r20 + 0x0111]
	setx	data_start_1, %g1, %r23
	.word 0xbc0ce0a8  ! 1415: AND_I	and 	%r19, 0x00a8, %r30
	.word 0xf435e163  ! 1416: STH_I	sth	%r26, [%r23 + 0x0163]
	.word 0xb150c000  ! 1419: RDPR_TT	rdpr	%tt, %r24
	.word 0xfb3cc000  ! 1420: STDF_R	std	%f29, [%r0, %r19]
	.word 0x8195e149  ! 1425: WRPR_TPC_I	wrpr	%r23, 0x0149, %tpc
	.word 0xf63ce12b  ! 1426: STD_I	std	%r27, [%r19 + 0x012b]
	mov	0, %r12
	.word 0x8f932000  ! 1427: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1504000  ! 1432: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x899420ab  ! 1433: WRPR_TICK_I	wrpr	%r16, 0x00ab, %tick
	.word 0xb8a54000  ! 1436: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xb1520000  ! 1439: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfc34205a  ! 1441: STH_I	sth	%r30, [%r16 + 0x005a]
	.word 0xba1ca1cd  ! 1442: XOR_I	xor 	%r18, 0x01cd, %r29
	.word 0xfc2d8000  ! 1445: STB_R	stb	%r30, [%r22 + %r0]
	setx	0x10239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c8000  ! 1449: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfb3c606a  ! 1451: STDF_I	std	%f29, [0x006a, %r17]
	.word 0xb53d4000  ! 1456: SRA_R	sra 	%r21, %r0, %r26
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c8000  ! 1459: STB_R	stb	%r31, [%r18 + %r0]
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d20b9  ! 1462: STD_I	std	%r29, [%r20 + 0x00b9]
	.word 0xfc2c20c8  ! 1463: STB_I	stb	%r30, [%r16 + 0x00c8]
	.word 0xf02d4000  ! 1464: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xb93d4000  ! 1467: SRA_R	sra 	%r21, %r0, %r28
	.word 0xfd3de133  ! 1470: STDF_I	std	%f30, [0x0133, %r23]
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3520c3  ! 1474: STH_I	sth	%r30, [%r20 + 0x00c3]
	.word 0xbd50c000  ! 1477: RDPR_TT	rdpr	%tt, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xfb3d20a3  ! 1480: STDF_I	std	%f29, [0x00a3, %r20]
	.word 0xf63c0000  ! 1483: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf53c6088  ! 1484: STDF_I	std	%f26, [0x0088, %r17]
	setx	data_start_1, %g1, %r19
	.word 0xbf50c000  ! 1488: RDPR_TT	rdpr	%tt, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf274219a  ! 1491: STX_I	stx	%r25, [%r16 + 0x019a]
	.word 0xb735d000  ! 1492: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xb43d2144  ! 1495: XNOR_I	xnor 	%r20, 0x0144, %r26
	.word 0xf73cc000  ! 1496: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf225a173  ! 1500: STW_I	stw	%r25, [%r22 + 0x0173]
	.word 0xf074c000  ! 1502: STX_R	stx	%r24, [%r19 + %r0]
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8240000  ! 1504: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xba9520d4  ! 1506: ORcc_I	orcc 	%r20, 0x00d4, %r29
	.word 0x83956050  ! 1519: WRPR_TNPC_I	wrpr	%r21, 0x0050, %tnpc
	.word 0xf63d4000  ! 1525: STD_R	std	%r27, [%r21 + %r0]
	.word 0xb3500000  ! 1527: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf62c6124  ! 1528: STB_I	stb	%r27, [%r17 + 0x0124]
	.word 0xbf7d8400  ! 1530: MOVR_R	movre	%r22, %r0, %r31
	.word 0xfc3c218f  ! 1538: STD_I	std	%r30, [%r16 + 0x018f]
	.word 0x8395a1d2  ! 1539: WRPR_TNPC_I	wrpr	%r22, 0x01d2, %tnpc
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42da1c3  ! 1541: STB_I	stb	%r26, [%r22 + 0x01c3]
	.word 0xb93db001  ! 1543: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xb9518000  ! 1544: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xbabc2032  ! 1549: XNORcc_I	xnorcc 	%r16, 0x0032, %r29
	.word 0xfa74e105  ! 1551: STX_I	stx	%r29, [%r19 + 0x0105]
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	.word 0xfa354000  ! 1559: STH_R	sth	%r29, [%r21 + %r0]
	.word 0x91956187  ! 1561: WRPR_PIL_I	wrpr	%r21, 0x0187, %pil
	.word 0xfe24c000  ! 1565: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfc758000  ! 1567: STX_R	stx	%r30, [%r22 + %r0]
	.word 0x8d95a186  ! 1572: WRPR_PSTATE_I	wrpr	%r22, 0x0186, %pstate
	.word 0xbd510000  ! 1573: RDPR_TICK	rdpr	%tick, %r30
	.word 0x899521bf  ! 1574: WRPR_TICK_I	wrpr	%r20, 0x01bf, %tick
	.word 0xf225c000  ! 1575: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf2344000  ! 1578: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xb6840000  ! 1581: ADDcc_R	addcc 	%r16, %r0, %r27
	.word 0xf33d2059  ! 1587: STDF_I	std	%f25, [0x0059, %r20]
	.word 0xf0256138  ! 1592: STW_I	stw	%r24, [%r21 + 0x0138]
	.word 0xb9540000  ! 1593: RDPR_GL	rdpr	%-, %r28
	.word 0xbb508000  ! 1595: RDPR_TSTATE	<illegal instruction>
	.word 0xfa748000  ! 1596: STX_R	stx	%r29, [%r18 + %r0]
	.word 0x8795e1c0  ! 1601: WRPR_TT_I	wrpr	%r23, 0x01c0, %tt
	.word 0xf82d8000  ! 1604: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf83da1b4  ! 1606: STD_I	std	%r28, [%r22 + 0x01b4]
	setx	data_start_0, %g1, %r23
	.word 0x87952194  ! 1610: WRPR_TT_I	wrpr	%r20, 0x0194, %tt
	.word 0xfe3cc000  ! 1613: STD_R	std	%r31, [%r19 + %r0]
	.word 0xfb3dc000  ! 1618: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf03c4000  ! 1630: STD_R	std	%r24, [%r17 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 1631: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa34c000  ! 1634: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xbd480000  ! 1636: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e19d  ! 1643: WRPR_TNPC_I	wrpr	%r23, 0x019d, %tnpc
	.word 0xb6c4e1fe  ! 1646: ADDCcc_I	addccc 	%r19, 0x01fe, %r27
	.word 0xf82de018  ! 1649: STB_I	stb	%r28, [%r23 + 0x0018]
	.word 0xf2754000  ! 1650: STX_R	stx	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 1651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0x8d95208b  ! 1653: WRPR_PSTATE_I	wrpr	%r20, 0x008b, %pstate
	.word 0xf0346187  ! 1654: STH_I	sth	%r24, [%r17 + 0x0187]
	.word 0xb005a1ad  ! 1655: ADD_I	add 	%r22, 0x01ad, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf22d613c  ! 1659: STB_I	stb	%r25, [%r21 + 0x013c]
	.word 0x8995a14e  ! 1664: WRPR_TICK_I	wrpr	%r22, 0x014e, %tick
	.word 0xfa744000  ! 1665: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xb88ca045  ! 1666: ANDcc_I	andcc 	%r18, 0x0045, %r28
	.word 0xb3500000  ! 1667: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xba950000  ! 1671: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xbe14c000  ! 1672: OR_R	or 	%r19, %r0, %r31
	.word 0xfe2c217e  ! 1675: STB_I	stb	%r31, [%r16 + 0x017e]
	.word 0x83946078  ! 1676: WRPR_TNPC_I	wrpr	%r17, 0x0078, %tnpc
	.word 0xff3da125  ! 1677: STDF_I	std	%f31, [0x0125, %r22]
	.word 0xf03c4000  ! 1681: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf93c21ca  ! 1682: STDF_I	std	%f28, [0x01ca, %r16]
	.word 0xfa3cc000  ! 1685: STD_R	std	%r29, [%r19 + %r0]
	.word 0xb1510000  ! 1686: RDPR_TICK	rdpr	%tick, %r24
	.word 0xfd3c60d8  ! 1687: STDF_I	std	%f30, [0x00d8, %r17]
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1692: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe7460f3  ! 1693: STX_I	stx	%r31, [%r17 + 0x00f3]
	.word 0xbd480000  ! 1698: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf23c6006  ! 1699: STD_I	std	%r25, [%r17 + 0x0006]
	.word 0xf02d0000  ! 1704: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb80cc000  ! 1705: AND_R	and 	%r19, %r0, %r28
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 1711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7508000  ! 1713: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb7500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xbeb40000  ! 1716: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0xfe34c000  ! 1720: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x8794a1cd  ! 1722: WRPR_TT_I	wrpr	%r18, 0x01cd, %tt
	.word 0xf624c000  ! 1723: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfe75a0d8  ! 1725: STX_I	stx	%r31, [%r22 + 0x00d8]
	.word 0xfe75a078  ! 1727: STX_I	stx	%r31, [%r22 + 0x0078]
	.word 0xb844a023  ! 1739: ADDC_I	addc 	%r18, 0x0023, %r28
	setx	data_start_1, %g1, %r22
	.word 0xb7518000  ! 1744: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf4758000  ! 1745: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbe2d2140  ! 1746: ANDN_I	andn 	%r20, 0x0140, %r31
	.word 0xb60420ed  ! 1752: ADD_I	add 	%r16, 0x00ed, %r27
	.word 0xb2356136  ! 1757: ORN_I	orn 	%r21, 0x0136, %r25
	.word 0xbd518000  ! 1758: RDPR_PSTATE	<illegal instruction>
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb83d61db  ! 1761: XNOR_I	xnor 	%r21, 0x01db, %r28
	.word 0xf22c8000  ! 1765: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xbb518000  ! 1766: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1767: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf03c2198  ! 1769: STD_I	std	%r24, [%r16 + 0x0198]
	.word 0xb750c000  ! 1771: RDPR_TT	rdpr	%tt, %r27
	.word 0xf625e001  ! 1773: STW_I	stw	%r27, [%r23 + 0x0001]
	.word 0xf4742080  ! 1774: STX_I	stx	%r26, [%r16 + 0x0080]
	.word 0xf82da1c0  ! 1778: STB_I	stb	%r28, [%r22 + 0x01c0]
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8246154  ! 1791: STW_I	stw	%r28, [%r17 + 0x0154]
	.word 0xf62c61dd  ! 1792: STB_I	stb	%r27, [%r17 + 0x01dd]
	.word 0xf0344000  ! 1797: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf824a1e5  ! 1801: STW_I	stw	%r28, [%r18 + 0x01e5]
	.word 0x83952194  ! 1805: WRPR_TNPC_I	wrpr	%r20, 0x0194, %tnpc
	.word 0xf62c4000  ! 1806: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf8240000  ! 1814: STW_R	stw	%r28, [%r16 + %r0]
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf835a0b4  ! 1817: STH_I	sth	%r28, [%r22 + 0x00b4]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3d0000  ! 1822: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf275c000  ! 1823: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfc3d6161  ! 1825: STD_I	std	%r30, [%r21 + 0x0161]
	.word 0xbf518000  ! 1826: RDPR_PSTATE	rdpr	%pstate, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819839c1  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c1, %hpstate
	.word 0x89956053  ! 1834: WRPR_TICK_I	wrpr	%r21, 0x0053, %tick
	.word 0xfa74a1ce  ! 1842: STX_I	stx	%r29, [%r18 + 0x01ce]
	.word 0xf624e07d  ! 1846: STW_I	stw	%r27, [%r19 + 0x007d]
	.word 0xb2a58000  ! 1847: SUBcc_R	subcc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0xb7350000  ! 1853: SRL_R	srl 	%r20, %r0, %r27
	.word 0xfe3de09e  ! 1858: STD_I	std	%r31, [%r23 + 0x009e]
	.word 0xfe2da15b  ! 1860: STB_I	stb	%r31, [%r22 + 0x015b]
	.word 0xfc35c000  ! 1862: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf434e127  ! 1863: STH_I	sth	%r26, [%r19 + 0x0127]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba45a03b  ! 1871: ADDC_I	addc 	%r22, 0x003b, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983a81  ! 1872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a81, %hpstate
	.word 0x8594e02c  ! 1873: WRPR_TSTATE_I	wrpr	%r19, 0x002c, %tstate
	.word 0xfa34e176  ! 1874: STH_I	sth	%r29, [%r19 + 0x0176]
	.word 0x8994a08d  ! 1878: WRPR_TICK_I	wrpr	%r18, 0x008d, %tick
	.word 0xb5510000  ! 1879: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfa252197  ! 1880: STW_I	stw	%r29, [%r20 + 0x0197]
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 1883: RDPR_TICK	<illegal instruction>
	.word 0xbac5c000  ! 1885: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0xfa3cc000  ! 1886: STD_R	std	%r29, [%r19 + %r0]
	.word 0x85942088  ! 1891: WRPR_TSTATE_I	wrpr	%r16, 0x0088, %tstate
	.word 0xfe750000  ! 1892: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfe2d21eb  ! 1894: STB_I	stb	%r31, [%r20 + 0x01eb]
	.word 0xf02da040  ! 1898: STB_I	stb	%r24, [%r22 + 0x0040]
	.word 0xb550c000  ! 1901: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f8b  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8b, %hpstate
	.word 0x8794607c  ! 1903: WRPR_TT_I	wrpr	%r17, 0x007c, %tt
	.word 0xb6ada1c9  ! 1904: ANDNcc_I	andncc 	%r22, 0x01c9, %r27
	.word 0xbd518000  ! 1908: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0x8394a19a  ! 1914: WRPR_TNPC_I	wrpr	%r18, 0x019a, %tnpc
	.word 0xfe74e06c  ! 1915: STX_I	stx	%r31, [%r19 + 0x006c]
	.word 0xfa744000  ! 1916: STX_R	stx	%r29, [%r17 + %r0]
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a166  ! 1922: WRPR_TICK_I	wrpr	%r22, 0x0166, %tick
	.word 0xf4744000  ! 1929: STX_R	stx	%r26, [%r17 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0xf835c000  ! 1931: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfa2de19d  ! 1933: STB_I	stb	%r29, [%r23 + 0x019d]
	.word 0xbd520000  ! 1934: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf025a067  ! 1937: STW_I	stw	%r24, [%r22 + 0x0067]
	.word 0x8595e0b8  ! 1944: WRPR_TSTATE_I	wrpr	%r23, 0x00b8, %tstate
	.word 0xb734e001  ! 1946: SRL_I	srl 	%r19, 0x0001, %r27
	setx	data_start_2, %g1, %r17
	.word 0xbd2c5000  ! 1951: SLLX_R	sllx	%r17, %r0, %r30
	.word 0x9195205d  ! 1954: WRPR_PIL_I	wrpr	%r20, 0x005d, %pil
	.word 0xf43d4000  ! 1955: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf43da069  ! 1956: STD_I	std	%r26, [%r22 + 0x0069]
	.word 0xf0342183  ! 1957: STH_I	sth	%r24, [%r16 + 0x0183]
	.word 0xfd3de058  ! 1958: STDF_I	std	%f30, [0x0058, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81982981  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	.word 0xbf500000  ! 1964: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x879421d4  ! 1969: WRPR_TT_I	wrpr	%r16, 0x01d4, %tt
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a056  ! 1977: WRPR_TICK_I	wrpr	%r22, 0x0056, %tick
	.word 0xfe75e020  ! 1978: STX_I	stx	%r31, [%r23 + 0x0020]
	.word 0xb7508000  ! 1981: RDPR_TSTATE	rdpr	%tstate, %r27
	mov	2, %r14
	.word 0xa193a000  ! 1982: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf62ca0fd  ! 1984: STB_I	stb	%r27, [%r18 + 0x00fd]
	.word 0x8795e154  ! 1986: WRPR_TT_I	wrpr	%r23, 0x0154, %tt
	.word 0x87956123  ! 1987: WRPR_TT_I	wrpr	%r21, 0x0123, %tt
	.word 0xfa346036  ! 1991: STH_I	sth	%r29, [%r17 + 0x0036]
	setx	data_start_4, %g1, %r21
	.word 0xb20dc000  ! 1996: AND_R	and 	%r23, %r0, %r25
	.word 0xb60c61d5  ! 1997: AND_I	and 	%r17, 0x01d5, %r27
	.word 0xb0c5c000  ! 1999: ADDCcc_R	addccc 	%r23, %r0, %r24
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93dc000  ! 2005: STDF_R	std	%f28, [%r0, %r23]
	.word 0xbe8ca0ca  ! 2006: ANDcc_I	andcc 	%r18, 0x00ca, %r31
	.word 0xfa34a092  ! 2009: STH_I	sth	%r29, [%r18 + 0x0092]
	setx	data_start_5, %g1, %r21
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb434e11b  ! 2017: SUBC_I	orn 	%r19, 0x011b, %r26
	.word 0xfe3ca0ba  ! 2019: STD_I	std	%r31, [%r18 + 0x00ba]
	.word 0x8595e18e  ! 2020: WRPR_TSTATE_I	wrpr	%r23, 0x018e, %tstate
	.word 0xb2b5a0f5  ! 2021: ORNcc_I	orncc 	%r22, 0x00f5, %r25
	.word 0xf13dc000  ! 2024: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf2256054  ! 2026: STW_I	stw	%r25, [%r21 + 0x0054]
	.word 0xf02d8000  ! 2031: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfc35e0df  ! 2032: STH_I	sth	%r30, [%r23 + 0x00df]
	.word 0xf62c0000  ! 2034: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xb284c000  ! 2035: ADDcc_R	addcc 	%r19, %r0, %r25
	.word 0xf42561a1  ! 2036: STW_I	stw	%r26, [%r21 + 0x01a1]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb935c000  ! 2043: SRL_R	srl 	%r23, %r0, %r28
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf275a001  ! 2046: STX_I	stx	%r25, [%r22 + 0x0001]
	.word 0xf82ca16c  ! 2047: STB_I	stb	%r28, [%r18 + 0x016c]
	.word 0xfa754000  ! 2049: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb351c000  ! 2056: RDPR_TL	rdpr	%tl, %r25
	.word 0xbd520000  ! 2060: RDPR_PIL	<illegal instruction>
	.word 0x8995601a  ! 2062: WRPR_TICK_I	wrpr	%r21, 0x001a, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983a59  ! 2063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a59, %hpstate
	.word 0xb7518000  ! 2064: RDPR_PSTATE	rdpr	%pstate, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b83  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b83, %hpstate
	setx	0x209, %g1, %o0
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
	.word 0xf4356126  ! 2076: STH_I	sth	%r26, [%r21 + 0x0126]
	.word 0xf83c0000  ! 2079: STD_R	std	%r28, [%r16 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb3d8000  ! 2086: SRA_R	sra 	%r22, %r0, %r29
	.word 0xfe3dc000  ! 2089: STD_R	std	%r31, [%r23 + %r0]
	.word 0xb151c000  ! 2092: RDPR_TL	rdpr	%tl, %r24
	.word 0xfe24e1b7  ! 2093: STW_I	stw	%r31, [%r19 + 0x01b7]
	.word 0xfb3d2000  ! 2098: STDF_I	std	%f29, [0x0000, %r20]
	.word 0xf23d8000  ! 2099: STD_R	std	%r25, [%r22 + %r0]
	.word 0xfc3c21c8  ! 2100: STD_I	std	%r30, [%r16 + 0x01c8]
	mov	1, %r14
	.word 0xa193a000  ! 2101: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa2c21a8  ! 2103: STB_I	stb	%r29, [%r16 + 0x01a8]
	.word 0xfa754000  ! 2111: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfa75c000  ! 2112: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf634a0fd  ! 2116: STH_I	sth	%r27, [%r18 + 0x00fd]
	.word 0xb6342168  ! 2118: ORN_I	orn 	%r16, 0x0168, %r27
	.word 0xf2740000  ! 2119: STX_R	stx	%r25, [%r16 + %r0]
	.word 0x8394a019  ! 2121: WRPR_TNPC_I	wrpr	%r18, 0x0019, %tnpc
	.word 0xf13d6045  ! 2122: STDF_I	std	%f24, [0x0045, %r21]
	.word 0xfe248000  ! 2128: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xb5508000  ! 2131: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 2134: RDPR_TL	<illegal instruction>
	.word 0xf2250000  ! 2138: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xfe354000  ! 2139: STH_R	sth	%r31, [%r21 + %r0]
	.word 0x8395e010  ! 2142: WRPR_TNPC_I	wrpr	%r23, 0x0010, %tnpc
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbea460ce  ! 2145: SUBcc_I	subcc 	%r17, 0x00ce, %r31
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 2147: MOVcc_I	<illegal instruction>
	.word 0xb0844000  ! 2148: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0xf4748000  ! 2149: STX_R	stx	%r26, [%r18 + %r0]
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13d4000  ! 2151: STDF_R	std	%f24, [%r0, %r21]
	.word 0xfa74e1ed  ! 2153: STX_I	stx	%r29, [%r19 + 0x01ed]
	.word 0xbf480000  ! 2155: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf73dc000  ! 2159: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf53d0000  ! 2162: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf8352193  ! 2164: STH_I	sth	%r28, [%r20 + 0x0193]
	.word 0xf82da02e  ! 2165: STB_I	stb	%r28, [%r22 + 0x002e]
	.word 0xb3510000  ! 2166: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf63ce199  ! 2167: STD_I	std	%r27, [%r19 + 0x0199]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7508000  ! 2170: RDPR_TSTATE	<illegal instruction>
	.word 0xfc35e133  ! 2171: STH_I	sth	%r30, [%r23 + 0x0133]
	.word 0xb1504000  ! 2173: RDPR_TNPC	<illegal instruction>
	.word 0xfc3d8000  ! 2182: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb00420e3  ! 2186: ADD_I	add 	%r16, 0x00e3, %r24
	.word 0xf73d217e  ! 2188: STDF_I	std	%f27, [0x017e, %r20]
	.word 0xfc344000  ! 2193: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf424a179  ! 2195: STW_I	stw	%r26, [%r18 + 0x0179]
	.word 0xf625218c  ! 2196: STW_I	stw	%r27, [%r20 + 0x018c]
	.word 0x8195a1af  ! 2198: WRPR_TPC_I	wrpr	%r22, 0x01af, %tpc
	.word 0xff3c619b  ! 2200: STDF_I	std	%f31, [0x019b, %r17]
	.word 0xf8748000  ! 2201: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfa74e180  ! 2204: STX_I	stx	%r29, [%r19 + 0x0180]
	.word 0xb1500000  ! 2206: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfa748000  ! 2207: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbf3c1000  ! 2211: SRAX_R	srax	%r16, %r0, %r31
	.word 0x8d956055  ! 2216: WRPR_PSTATE_I	wrpr	%r21, 0x0055, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982859  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0xb9520000  ! 2221: RDPR_PIL	rdpr	%pil, %r28
	.word 0xff3c212f  ! 2222: STDF_I	std	%f31, [0x012f, %r16]
	.word 0xbb504000  ! 2223: RDPR_TNPC	<illegal instruction>
	.word 0xf73dc000  ! 2225: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfa75c000  ! 2226: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xfe2d4000  ! 2227: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xb3504000  ! 2228: RDPR_TNPC	<illegal instruction>
	.word 0xbf51c000  ! 2229: RDPR_TL	<illegal instruction>
	.word 0xfd3de1c9  ! 2234: STDF_I	std	%f30, [0x01c9, %r23]
	.word 0xf674e054  ! 2238: STX_I	stx	%r27, [%r19 + 0x0054]
	.word 0xb88ce146  ! 2240: ANDcc_I	andcc 	%r19, 0x0146, %r28
	.word 0xba15c000  ! 2242: OR_R	or 	%r23, %r0, %r29
	.word 0xf2740000  ! 2243: STX_R	stx	%r25, [%r16 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2244: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc35c000  ! 2245: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xb034606b  ! 2249: ORN_I	orn 	%r17, 0x006b, %r24
	.word 0xf424c000  ! 2250: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xbd518000  ! 2252: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0x83956060  ! 2258: WRPR_TNPC_I	wrpr	%r21, 0x0060, %tnpc
	.word 0x8395a1d6  ! 2259: WRPR_TNPC_I	wrpr	%r22, 0x01d6, %tnpc
	.word 0x9195e1b4  ! 2262: WRPR_PIL_I	wrpr	%r23, 0x01b4, %pil
	.word 0xfa2c8000  ! 2268: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xbb2de001  ! 2269: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0x839521f5  ! 2271: WRPR_TNPC_I	wrpr	%r20, 0x01f5, %tnpc
	setx	data_start_2, %g1, %r19
	setx	data_start_3, %g1, %r18
	.word 0xbd35f001  ! 2278: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xf624203a  ! 2281: STW_I	stw	%r27, [%r16 + 0x003a]
	.word 0xfe3cc000  ! 2284: STD_R	std	%r31, [%r19 + %r0]
	.word 0x8594e0da  ! 2286: WRPR_TSTATE_I	wrpr	%r19, 0x00da, %tstate
	.word 0xfa758000  ! 2288: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfe3de1e6  ! 2290: STD_I	std	%r31, [%r23 + 0x01e6]
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 2291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xf0742151  ! 2294: STX_I	stx	%r24, [%r16 + 0x0151]
	.word 0xba244000  ! 2295: SUB_R	sub 	%r17, %r0, %r29
	.word 0xbf500000  ! 2296: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf075a1cd  ! 2298: STX_I	stx	%r24, [%r22 + 0x01cd]
	.word 0xf835c000  ! 2299: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf275c000  ! 2300: STX_R	stx	%r25, [%r23 + %r0]
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 2305: RDPR_TSTATE	<illegal instruction>
	.word 0xff3c0000  ! 2306: STDF_R	std	%f31, [%r0, %r16]
	.word 0xbf3c4000  ! 2307: SRA_R	sra 	%r17, %r0, %r31
	.word 0xfd3d0000  ! 2308: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf474e0c2  ! 2309: STX_I	stx	%r26, [%r19 + 0x00c2]
	.word 0xfc24a138  ! 2310: STW_I	stw	%r30, [%r18 + 0x0138]
	.word 0xb0b560bf  ! 2317: ORNcc_I	orncc 	%r21, 0x00bf, %r24
	.word 0xf03da198  ! 2320: STD_I	std	%r24, [%r22 + 0x0198]
	.word 0xf2750000  ! 2321: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf824a183  ! 2322: STW_I	stw	%r28, [%r18 + 0x0183]
	.word 0xf22de006  ! 2324: STB_I	stb	%r25, [%r23 + 0x0006]
	setx	data_start_6, %g1, %r23
	.word 0xfa2c0000  ! 2326: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfc25e072  ! 2328: STW_I	stw	%r30, [%r23 + 0x0072]
	.word 0xb8b56027  ! 2330: SUBCcc_I	orncc 	%r21, 0x0027, %r28
	setx	0x20213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 2334: STX_R	stx	%r30, [%r16 + %r0]
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2d2117  ! 2338: STB_I	stb	%r31, [%r20 + 0x0117]
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c6030  ! 2342: STD_I	std	%r30, [%r17 + 0x0030]
	.word 0xf42d61bf  ! 2344: STB_I	stb	%r26, [%r21 + 0x01bf]
	mov	1, %r12
	.word 0x8f932000  ! 2348: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3540000  ! 2350: RDPR_GL	rdpr	%-, %r25
	.word 0xf8354000  ! 2353: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xb9518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75614f  ! 2360: STX_I	stx	%r30, [%r21 + 0x014f]
	.word 0xfc25c000  ! 2362: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf275219c  ! 2368: STX_I	stx	%r25, [%r20 + 0x019c]
	.word 0xf63521c6  ! 2370: STH_I	sth	%r27, [%r20 + 0x01c6]
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0xbc2420cc  ! 2372: SUB_I	sub 	%r16, 0x00cc, %r30
	.word 0xb92d0000  ! 2374: SLL_R	sll 	%r20, %r0, %r28
	.word 0xf22d20ea  ! 2375: STB_I	stb	%r25, [%r20 + 0x00ea]
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946115  ! 2377: WRPR_TSTATE_I	wrpr	%r17, 0x0115, %tstate
	.word 0xf63c4000  ! 2378: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfa35e052  ! 2379: STH_I	sth	%r29, [%r23 + 0x0052]
	.word 0xfe2c8000  ! 2380: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf6354000  ! 2381: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfc3d619c  ! 2383: STD_I	std	%r30, [%r21 + 0x019c]
	mov	0, %r12
	.word 0x8f932000  ! 2384: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf82ce1d5  ! 2385: STB_I	stb	%r28, [%r19 + 0x01d5]
	.word 0xff3dc000  ! 2390: STDF_R	std	%f31, [%r0, %r23]
	.word 0xfc3c4000  ! 2392: STD_R	std	%r30, [%r17 + %r0]
	.word 0xbd347001  ! 2393: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xb1510000  ! 2394: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf73dc000  ! 2395: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf02d60f5  ! 2400: STB_I	stb	%r24, [%r21 + 0x00f5]
	.word 0xfc24c000  ! 2403: STW_R	stw	%r30, [%r19 + %r0]
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 2413: MOVcc_R	<illegal instruction>
	.word 0xb2b54000  ! 2415: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0xf33ce0c8  ! 2420: STDF_I	std	%f25, [0x00c8, %r19]
	.word 0xbd2cd000  ! 2422: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xfa25200e  ! 2426: STW_I	stw	%r29, [%r20 + 0x000e]
	.word 0xf674c000  ! 2427: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xbd510000  ! 2434: RDPR_TICK	<illegal instruction>
	.word 0xf8756082  ! 2435: STX_I	stx	%r28, [%r21 + 0x0082]
	.word 0xbd518000  ! 2438: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3c0000  ! 2440: STDF_R	std	%f30, [%r0, %r16]
	.word 0xb7518000  ! 2442: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r17
	setx	0x16, %g1, %o0
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
	.word 0xf43d610d  ! 2452: STD_I	std	%r26, [%r21 + 0x010d]
	.word 0xb7518000  ! 2458: RDPR_PSTATE	<illegal instruction>
	.word 0xbf504000  ! 2459: RDPR_TNPC	<illegal instruction>
	.word 0xfa244000  ! 2460: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xfe7560b6  ! 2461: STX_I	stx	%r31, [%r21 + 0x00b6]
	.word 0xf6740000  ! 2464: STX_R	stx	%r27, [%r16 + %r0]
	.word 0x9195a085  ! 2467: WRPR_PIL_I	wrpr	%r22, 0x0085, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6354000  ! 2469: STH_R	sth	%r27, [%r21 + %r0]
	setx	data_start_1, %g1, %r23
	.word 0xf0758000  ! 2472: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xb5520000  ! 2476: RDPR_PIL	rdpr	%pil, %r26
	.word 0xfa3de004  ! 2479: STD_I	std	%r29, [%r23 + 0x0004]
	.word 0xf03c208d  ! 2482: STD_I	std	%r24, [%r16 + 0x008d]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224e0c9  ! 2486: STW_I	stw	%r25, [%r19 + 0x00c9]
	.word 0xf02dc000  ! 2487: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf474a01e  ! 2489: STX_I	stx	%r26, [%r18 + 0x001e]
	.word 0xf13da093  ! 2490: STDF_I	std	%f24, [0x0093, %r22]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3520000  ! 2495: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfe340000  ! 2496: STH_R	sth	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 2497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xfa248000  ! 2498: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf6742049  ! 2500: STX_I	stx	%r27, [%r16 + 0x0049]
	mov	1, %r14
	.word 0xa193a000  ! 2510: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 2514: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2250000  ! 2515: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf63da178  ! 2517: STD_I	std	%r27, [%r22 + 0x0178]
	.word 0xf63c0000  ! 2521: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb150c000  ! 2523: RDPR_TT	rdpr	%tt, %r24
	mov	1, %r14
	.word 0xa193a000  ! 2524: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf62cc000  ! 2525: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xff3d8000  ! 2528: STDF_R	std	%f31, [%r0, %r22]
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf074e1aa  ! 2530: STX_I	stx	%r24, [%r19 + 0x01aa]
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2532: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf93d0000  ! 2534: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf42d4000  ! 2535: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb7480000  ! 2540: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfe3c4000  ! 2546: STD_R	std	%r31, [%r17 + %r0]
	.word 0xf224c000  ! 2548: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf13cc000  ! 2549: STDF_R	std	%f24, [%r0, %r19]
	.word 0xbb2da001  ! 2550: SLL_I	sll 	%r22, 0x0001, %r29
	mov	2, %r12
	.word 0x8f932000  ! 2551: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc250000  ! 2555: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb3480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0, %r12
	.word 0x8f932000  ! 2560: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb69d4000  ! 2564: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xfe34c000  ! 2565: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe342144  ! 2566: STH_I	sth	%r31, [%r16 + 0x0144]
	.word 0xb8346157  ! 2571: SUBC_I	orn 	%r17, 0x0157, %r28
	.word 0xf53d0000  ! 2575: STDF_R	std	%f26, [%r0, %r20]
	setx	0x3031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d4000  ! 2579: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xfb3d4000  ! 2581: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb4ad61b8  ! 2583: ANDNcc_I	andncc 	%r21, 0x01b8, %r26
	.word 0xf825a18e  ! 2584: STW_I	stw	%r28, [%r22 + 0x018e]
	.word 0xf47460a4  ! 2585: STX_I	stx	%r26, [%r17 + 0x00a4]
	.word 0x85952157  ! 2590: WRPR_TSTATE_I	wrpr	%r20, 0x0157, %tstate
	.word 0xbb518000  ! 2591: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf22c210b  ! 2592: STB_I	stb	%r25, [%r16 + 0x010b]
	.word 0x8995e05a  ! 2603: WRPR_TICK_I	wrpr	%r23, 0x005a, %tick
	.word 0xf82d4000  ! 2609: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf4344000  ! 2611: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xbf7d4400  ! 2617: MOVR_R	movre	%r21, %r0, %r31
	.word 0xf43d8000  ! 2620: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf4258000  ! 2621: STW_R	stw	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0940000  ! 2625: ORcc_R	orcc 	%r16, %r0, %r24
	mov	1, %r12
	.word 0x8f932000  ! 2627: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb641800  ! 2629: MOVcc_R	<illegal instruction>
	.word 0xfd3d4000  ! 2630: STDF_R	std	%f30, [%r0, %r21]
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43cc000  ! 2633: STD_R	std	%r26, [%r19 + %r0]
	.word 0xfe25e1a1  ! 2636: STW_I	stw	%r31, [%r23 + 0x01a1]
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 2647: STW_R	stw	%r27, [%r20 + %r0]
	.word 0x8395e1ee  ! 2649: WRPR_TNPC_I	wrpr	%r23, 0x01ee, %tnpc
	.word 0xb234c000  ! 2651: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xfc3ca066  ! 2657: STD_I	std	%r30, [%r18 + 0x0066]
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 2661: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xb951c000  ! 2662: RDPR_TL	rdpr	%tl, %r28
	.word 0xf874605a  ! 2664: STX_I	stx	%r28, [%r17 + 0x005a]
	.word 0xf6350000  ! 2665: STH_R	sth	%r27, [%r20 + %r0]
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2669: RDPR_GL	<illegal instruction>
	.word 0xf13c8000  ! 2671: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf53d0000  ! 2672: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf73c4000  ! 2674: STDF_R	std	%f27, [%r0, %r17]
	.word 0xfc2ce174  ! 2676: STB_I	stb	%r30, [%r19 + 0x0174]
	.word 0xf275202f  ! 2678: STX_I	stx	%r25, [%r20 + 0x002f]
	.word 0xb485e0a2  ! 2684: ADDcc_I	addcc 	%r23, 0x00a2, %r26
	.word 0xf4750000  ! 2685: STX_R	stx	%r26, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3c8000  ! 2691: STD_R	std	%r31, [%r18 + %r0]
	.word 0xff3d0000  ! 2692: STDF_R	std	%f31, [%r0, %r20]
	.word 0xfc3de075  ! 2693: STD_I	std	%r30, [%r23 + 0x0075]
	.word 0xf635a17f  ! 2695: STH_I	sth	%r27, [%r22 + 0x017f]
	.word 0xb7518000  ! 2697: RDPR_PSTATE	<illegal instruction>
	.word 0xf73c0000  ! 2698: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfc3c200a  ! 2699: STD_I	std	%r30, [%r16 + 0x000a]
	.word 0xfa2d60c0  ! 2701: STB_I	stb	%r29, [%r21 + 0x00c0]
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8852034  ! 2708: ADDcc_I	addcc 	%r20, 0x0034, %r28
	.word 0xfe34a0d3  ! 2710: STH_I	sth	%r31, [%r18 + 0x00d3]
	.word 0xf13d6102  ! 2713: STDF_I	std	%f24, [0x0102, %r21]
	setx	data_start_2, %g1, %r16
	.word 0xb01de082  ! 2718: XOR_I	xor 	%r23, 0x0082, %r24
	.word 0xfd3d4000  ! 2721: STDF_R	std	%f30, [%r0, %r21]
	.word 0xfa74c000  ! 2724: STX_R	stx	%r29, [%r19 + %r0]
	.word 0x9195a023  ! 2726: WRPR_PIL_I	wrpr	%r22, 0x0023, %pil
	.word 0xf33ce107  ! 2727: STDF_I	std	%f25, [0x0107, %r19]
	.word 0xfa758000  ! 2732: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb61420ed  ! 2734: OR_I	or 	%r16, 0x00ed, %r27
	.word 0xfc342042  ! 2735: STH_I	sth	%r30, [%r16 + 0x0042]
	.word 0xb73de001  ! 2738: SRA_I	sra 	%r23, 0x0001, %r27
	mov	0, %r14
	.word 0xa193a000  ! 2739: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb4ac8000  ! 2741: ANDNcc_R	andncc 	%r18, %r0, %r26
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2747: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e10f  ! 2750: WRPR_TNPC_I	wrpr	%r19, 0x010f, %tnpc
	.word 0xb950c000  ! 2752: RDPR_TT	rdpr	%tt, %r28
	.word 0xb3504000  ! 2754: RDPR_TNPC	<illegal instruction>
	.word 0xf475c000  ! 2755: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf53dc000  ! 2758: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfa258000  ! 2759: STW_R	stw	%r29, [%r22 + %r0]
	.word 0x8795a1a3  ! 2760: WRPR_TT_I	wrpr	%r22, 0x01a3, %tt
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 2767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xfd3da036  ! 2768: STDF_I	std	%f30, [0x0036, %r22]
	.word 0xb550c000  ! 2772: RDPR_TT	rdpr	%tt, %r26
	.word 0xb5500000  ! 2774: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xf0354000  ! 2776: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xbd500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xf4356085  ! 2782: STH_I	sth	%r26, [%r21 + 0x0085]
	.word 0xfc2c2137  ! 2783: STB_I	stb	%r30, [%r16 + 0x0137]
	.word 0xbd508000  ! 2784: RDPR_TSTATE	<illegal instruction>
	.word 0xb0854000  ! 2793: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xf42c8000  ! 2794: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xbf351000  ! 2795: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xb334c000  ! 2801: SRL_R	srl 	%r19, %r0, %r25
	.word 0x8595e12b  ! 2804: WRPR_TSTATE_I	wrpr	%r23, 0x012b, %tstate
	.word 0xf83520fb  ! 2806: STH_I	sth	%r28, [%r20 + 0x00fb]
	.word 0xb5518000  ! 2812: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb950c000  ! 2815: RDPR_TT	<illegal instruction>
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0a5c000  ! 2818: SUBcc_R	subcc 	%r23, %r0, %r24
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834a1bb  ! 2820: STH_I	sth	%r28, [%r18 + 0x01bb]
	ta	T_CHANGE_HPRIV
	.word 0x81983a89  ! 2821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a89, %hpstate
	.word 0xf6348000  ! 2822: STH_R	sth	%r27, [%r18 + %r0]
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	mov	1, %r14
	.word 0xa193a000  ! 2829: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc35e10d  ! 2833: STH_I	sth	%r30, [%r23 + 0x010d]
	setx	data_start_6, %g1, %r20
	.word 0xf8240000  ! 2841: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xbd480000  ! 2844: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfe3d8000  ! 2847: STD_R	std	%r31, [%r22 + %r0]
	.word 0xfc74e0a9  ! 2851: STX_I	stx	%r30, [%r19 + 0x00a9]
	.word 0xfc2d20dd  ! 2852: STB_I	stb	%r30, [%r20 + 0x00dd]
	setx	0x1002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 2857: RDPR_TL	<illegal instruction>
	.word 0xf03c213e  ! 2859: STD_I	std	%r24, [%r16 + 0x013e]
	.word 0xf875c000  ! 2861: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfc25a16e  ! 2867: STW_I	stw	%r30, [%r22 + 0x016e]
	.word 0xf6758000  ! 2871: STX_R	stx	%r27, [%r22 + %r0]
	.word 0x879461a5  ! 2872: WRPR_TT_I	wrpr	%r17, 0x01a5, %tt
	setx	data_start_2, %g1, %r16
	.word 0xb72dd000  ! 2878: SLLX_R	sllx	%r23, %r0, %r27
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 2883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8995e121  ! 2885: WRPR_TICK_I	wrpr	%r23, 0x0121, %tick
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0acc000  ! 2887: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xf63da002  ! 2890: STD_I	std	%r27, [%r22 + 0x0002]
	.word 0xf2752192  ! 2894: STX_I	stx	%r25, [%r20 + 0x0192]
	.word 0xf625a04e  ! 2895: STW_I	stw	%r27, [%r22 + 0x004e]
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 2897: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xb1643801  ! 2898: MOVcc_I	<illegal instruction>
	.word 0xf03da195  ! 2903: STD_I	std	%r24, [%r22 + 0x0195]
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2909: RDPR_GL	rdpr	%-, %r31
	.word 0x8395a08c  ! 2911: WRPR_TNPC_I	wrpr	%r22, 0x008c, %tnpc
	.word 0x8995a0ff  ! 2919: WRPR_TICK_I	wrpr	%r22, 0x00ff, %tick
	.word 0xfa2dc000  ! 2920: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfa24c000  ! 2922: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf6348000  ! 2925: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb7518000  ! 2932: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbb540000  ! 2933: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2dc000  ! 2942: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xb32ce001  ! 2943: SLL_I	sll 	%r19, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 2944: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983903  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1903, %hpstate
	.word 0xbf7c0400  ! 2947: MOVR_R	movre	%r16, %r0, %r31
	.word 0xbaac4000  ! 2948: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xfe3d0000  ! 2955: STD_R	std	%r31, [%r20 + %r0]
	.word 0xb6bca130  ! 2958: XNORcc_I	xnorcc 	%r18, 0x0130, %r27
	.word 0x8795a1e1  ! 2959: WRPR_TT_I	wrpr	%r22, 0x01e1, %tt
	.word 0xf625a1ce  ! 2960: STW_I	stw	%r27, [%r22 + 0x01ce]
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 2964: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfe2c4000  ! 2971: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf22cc000  ! 2974: STB_R	stb	%r25, [%r19 + %r0]
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r23
	.word 0xfa350000  ! 2981: STH_R	sth	%r29, [%r20 + %r0]
	.word 0x83942035  ! 2983: WRPR_TNPC_I	wrpr	%r16, 0x0035, %tnpc
	.word 0xb1518000  ! 2984: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf624a0cc  ! 2987: STW_I	stw	%r27, [%r18 + 0x00cc]
	.word 0xf834a143  ! 2988: STH_I	sth	%r28, [%r18 + 0x0143]
	.word 0xf22420ff  ! 2989: STW_I	stw	%r25, [%r16 + 0x00ff]
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24c000  ! 2994: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf435208e  ! 2998: STH_I	sth	%r26, [%r20 + 0x008e]
	.word 0xf42d2096  ! 3003: STB_I	stb	%r26, [%r20 + 0x0096]
	.word 0xf8350000  ! 3004: STH_R	sth	%r28, [%r20 + %r0]
	setx	0x30121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3009: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75c000  ! 3016: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfb3c4000  ! 3023: STDF_R	std	%f29, [%r0, %r17]
	.word 0xfa244000  ! 3029: STW_R	stw	%r29, [%r17 + %r0]
	setx	0x311, %g1, %o0
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
	.word 0x83942184  ! 3037: WRPR_TNPC_I	wrpr	%r16, 0x0184, %tnpc
	.word 0xfc3da02b  ! 3042: STD_I	std	%r30, [%r22 + 0x002b]
	.word 0xb7480000  ! 3043: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf83c0000  ! 3051: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf0250000  ! 3057: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf67560e0  ! 3058: STX_I	stx	%r27, [%r21 + 0x00e0]
	.word 0x8394210d  ! 3059: WRPR_TNPC_I	wrpr	%r16, 0x010d, %tnpc
	.word 0xf73d6131  ! 3064: STDF_I	std	%f27, [0x0131, %r21]
	.word 0xfe244000  ! 3066: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb751c000  ! 3067: RDPR_TL	rdpr	%tl, %r27
	.word 0xfe254000  ! 3069: STW_R	stw	%r31, [%r21 + %r0]
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 3075: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xfa748000  ! 3079: STX_R	stx	%r29, [%r18 + %r0]
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e017  ! 3082: WRPR_TSTATE_I	wrpr	%r23, 0x0017, %tstate
	.word 0xfe35606e  ! 3083: STH_I	sth	%r31, [%r21 + 0x006e]
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87956122  ! 3088: WRPR_TT_I	wrpr	%r21, 0x0122, %tt
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674e1be  ! 3100: STX_I	stx	%r27, [%r19 + 0x01be]
	.word 0xb52d9000  ! 3101: SLLX_R	sllx	%r22, %r0, %r26
	.word 0xf8348000  ! 3102: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfe2c60e0  ! 3104: STB_I	stb	%r31, [%r17 + 0x00e0]
	.word 0xb9508000  ! 3105: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x819560da  ! 3106: WRPR_TPC_I	wrpr	%r21, 0x00da, %tpc
	.word 0xfa352084  ! 3107: STH_I	sth	%r29, [%r20 + 0x0084]
	.word 0xfe2de0ff  ! 3108: STB_I	stb	%r31, [%r23 + 0x00ff]
	.word 0x8995614b  ! 3112: WRPR_TICK_I	wrpr	%r21, 0x014b, %tick
	.word 0xf8254000  ! 3115: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf4754000  ! 3116: STX_R	stx	%r26, [%r21 + %r0]
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2de061  ! 3121: STB_I	stb	%r30, [%r23 + 0x0061]
	.word 0x8595609a  ! 3122: WRPR_TSTATE_I	wrpr	%r21, 0x009a, %tstate
	.word 0xf4254000  ! 3123: STW_R	stw	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982899  ! 3125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xb7508000  ! 3127: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb5518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xf834e03d  ! 3129: STH_I	sth	%r28, [%r19 + 0x003d]
	.word 0xf6358000  ! 3132: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf6248000  ! 3137: STW_R	stw	%r27, [%r18 + %r0]
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952022  ! 3142: WRPR_PSTATE_I	wrpr	%r20, 0x0022, %pstate
	.word 0xfc3cc000  ! 3143: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf6352038  ! 3144: STH_I	sth	%r27, [%r20 + 0x0038]
	.word 0xf23d0000  ! 3147: STD_R	std	%r25, [%r20 + %r0]
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf47421a6  ! 3153: STX_I	stx	%r26, [%r16 + 0x01a6]
	.word 0xfe2dc000  ! 3155: STB_R	stb	%r31, [%r23 + %r0]
	.word 0x859461ac  ! 3156: WRPR_TSTATE_I	wrpr	%r17, 0x01ac, %tstate
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	.word 0xf33de003  ! 3161: STDF_I	std	%f25, [0x0003, %r23]
	.word 0xb97d6401  ! 3163: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xfa254000  ! 3164: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfa2ce0d8  ! 3165: STB_I	stb	%r29, [%r19 + 0x00d8]
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3167: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03d212d  ! 3171: STD_I	std	%r24, [%r20 + 0x012d]
	.word 0xf6744000  ! 3172: STX_R	stx	%r27, [%r17 + %r0]
	.word 0x859520fc  ! 3173: WRPR_TSTATE_I	wrpr	%r20, 0x00fc, %tstate
	.word 0xf63d2120  ! 3178: STD_I	std	%r27, [%r20 + 0x0120]
	.word 0xbec4c000  ! 3180: ADDCcc_R	addccc 	%r19, %r0, %r31
	mov	1, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2d0000  ! 3188: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf62de1cc  ! 3191: STB_I	stb	%r27, [%r23 + 0x01cc]
	.word 0x8395e05d  ! 3193: WRPR_TNPC_I	wrpr	%r23, 0x005d, %tnpc
	.word 0xfa74a085  ! 3194: STX_I	stx	%r29, [%r18 + 0x0085]
	mov	0, %r14
	.word 0xa193a000  ! 3195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982841  ! 3198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	.word 0xf63de0e1  ! 3204: STD_I	std	%r27, [%r23 + 0x00e1]
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80c2119  ! 3209: AND_I	and 	%r16, 0x0119, %r28
	.word 0xbd480000  ! 3210: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d9561fc  ! 3211: WRPR_PSTATE_I	wrpr	%r21, 0x01fc, %pstate
	.word 0xf675a00f  ! 3217: STX_I	stx	%r27, [%r22 + 0x000f]
	.word 0xfc2ca000  ! 3219: STB_I	stb	%r30, [%r18 + 0x0000]
	ta	T_CHANGE_HPRIV
	.word 0x81983949  ! 3220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1949, %hpstate
	.word 0xf03ca103  ! 3224: STD_I	std	%r24, [%r18 + 0x0103]
	setx	data_start_1, %g1, %r20
	.word 0xfa75200d  ! 3228: STX_I	stx	%r29, [%r20 + 0x000d]
	.word 0xf73dc000  ! 3232: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfc742110  ! 3233: STX_I	stx	%r30, [%r16 + 0x0110]
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c8000  ! 3239: SRA_R	sra 	%r18, %r0, %r30
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 3241: STW_R	stw	%r25, [%r21 + %r0]
	.word 0x85946029  ! 3243: WRPR_TSTATE_I	wrpr	%r17, 0x0029, %tstate
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33de05b  ! 3253: STDF_I	std	%f25, [0x005b, %r23]
	.word 0xbf2c8000  ! 3255: SLL_R	sll 	%r18, %r0, %r31
	.word 0xf23420b0  ! 3256: STH_I	sth	%r25, [%r16 + 0x00b0]
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 3261: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe340000  ! 3263: STH_R	sth	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982809  ! 3264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0809, %hpstate
	.word 0xf83de093  ! 3265: STD_I	std	%r28, [%r23 + 0x0093]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x819561c1  ! 3272: WRPR_TPC_I	wrpr	%r21, 0x01c1, %tpc
	.word 0xf27420e1  ! 3276: STX_I	stx	%r25, [%r16 + 0x00e1]
	.word 0x89946050  ! 3277: WRPR_TICK_I	wrpr	%r17, 0x0050, %tick
	.word 0xfc756199  ! 3282: STX_I	stx	%r30, [%r21 + 0x0199]
	.word 0xf6356155  ! 3283: STH_I	sth	%r27, [%r21 + 0x0155]
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0x8994e154  ! 3287: WRPR_TICK_I	wrpr	%r19, 0x0154, %tick
	.word 0xfd3ca12f  ! 3288: STDF_I	std	%f30, [0x012f, %r18]
	setx	data_start_0, %g1, %r18
	mov	0, %r12
	.word 0x8f932000  ! 3296: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 3299: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x2012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25a1b3  ! 3304: STW_I	stw	%r29, [%r22 + 0x01b3]
	setx	0x33f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3d2035  ! 3313: STDF_I	std	%f31, [0x0035, %r20]
	.word 0xf2740000  ! 3318: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb151c000  ! 3320: RDPR_TL	<illegal instruction>
	.word 0xf6758000  ! 3321: STX_R	stx	%r27, [%r22 + %r0]
	.word 0x8d95a116  ! 3323: WRPR_PSTATE_I	wrpr	%r22, 0x0116, %pstate
	.word 0xf03cc000  ! 3326: STD_R	std	%r24, [%r19 + %r0]
	.word 0xfc340000  ! 3334: STH_R	sth	%r30, [%r16 + %r0]
	setx	data_start_0, %g1, %r18
	.word 0xfe3c2053  ! 3336: STD_I	std	%r31, [%r16 + 0x0053]
	.word 0x91942125  ! 3337: WRPR_PIL_I	wrpr	%r16, 0x0125, %pil
	.word 0xf33c4000  ! 3339: STDF_R	std	%f25, [%r0, %r17]
	mov	0, %r12
	.word 0x8f932000  ! 3340: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95e059  ! 3343: WRPR_PSTATE_I	wrpr	%r23, 0x0059, %pstate
	.word 0xbd356001  ! 3344: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xfb3da0fa  ! 3347: STDF_I	std	%f29, [0x00fa, %r22]
	.word 0xb8bd4000  ! 3348: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb6ad0000  ! 3358: ANDNcc_R	andncc 	%r20, %r0, %r27
	.word 0xf2750000  ! 3361: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfc7421b4  ! 3362: STX_I	stx	%r30, [%r16 + 0x01b4]
	mov	2, %r14
	.word 0xa193a000  ! 3363: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x81946097  ! 3365: WRPR_TPC_I	wrpr	%r17, 0x0097, %tpc
	.word 0xbc0d0000  ! 3366: AND_R	and 	%r20, %r0, %r30
	setx	data_start_6, %g1, %r22
	.word 0xb1504000  ! 3370: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf6358000  ! 3371: STH_R	sth	%r27, [%r22 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xf42c8000  ! 3375: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xff3de143  ! 3378: STDF_I	std	%f31, [0x0143, %r23]
	.word 0xf42c6182  ! 3380: STB_I	stb	%r26, [%r17 + 0x0182]
	.word 0xbd518000  ! 3383: RDPR_PSTATE	<illegal instruction>
	.word 0xfe3420e2  ! 3388: STH_I	sth	%r31, [%r16 + 0x00e2]
	mov	0, %r12
	.word 0x8f932000  ! 3389: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3641800  ! 3390: MOVcc_R	<illegal instruction>
	.word 0xbe252125  ! 3396: SUB_I	sub 	%r20, 0x0125, %r31
	.word 0xff3d6124  ! 3397: STDF_I	std	%f31, [0x0124, %r21]
	.word 0xb9480000  ! 3400: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfe75a053  ! 3404: STX_I	stx	%r31, [%r22 + 0x0053]
	.word 0xf63d8000  ! 3405: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf87460b6  ! 3406: STX_I	stx	%r28, [%r17 + 0x00b6]
	.word 0xbd51c000  ! 3410: RDPR_TL	rdpr	%tl, %r30
	.word 0xf42cc000  ! 3411: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfa2c2155  ! 3412: STB_I	stb	%r29, [%r16 + 0x0155]
	.word 0xfa2c60c2  ! 3414: STB_I	stb	%r29, [%r17 + 0x00c2]
	.word 0xbf350000  ! 3415: SRL_R	srl 	%r20, %r0, %r31
	mov	0, %r14
	.word 0xa193a000  ! 3416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf435a009  ! 3419: STH_I	sth	%r26, [%r22 + 0x0009]
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3425: RDPR_TICK	rdpr	%tick, %r29
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2cb001  ! 3435: SLLX_I	sllx	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	2, %r14
	.word 0xa193a000  ! 3443: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d6182  ! 3446: STDF_I	std	%f29, [0x0182, %r21]
	.word 0xf82561b0  ! 3447: STW_I	stw	%r28, [%r21 + 0x01b0]
	.word 0xf2744000  ! 3451: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb6c40000  ! 3453: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xfc3d2080  ! 3454: STD_I	std	%r30, [%r20 + 0x0080]
	.word 0xfb3cc000  ! 3455: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf83cc000  ! 3456: STD_R	std	%r28, [%r19 + %r0]
	.word 0xbb504000  ! 3459: RDPR_TNPC	rdpr	%tnpc, %r29
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8758000  ! 3467: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfe3d21fc  ! 3468: STD_I	std	%r31, [%r20 + 0x01fc]
	.word 0xf63d0000  ! 3469: STD_R	std	%r27, [%r20 + %r0]
	.word 0xb7540000  ! 3470: RDPR_GL	<illegal instruction>
	.word 0xb5508000  ! 3475: RDPR_TSTATE	<illegal instruction>
	.word 0xfa3d8000  ! 3476: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf22c0000  ! 3477: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf53c2089  ! 3479: STDF_I	std	%f26, [0x0089, %r16]
	.word 0x89946149  ! 3480: WRPR_TICK_I	wrpr	%r17, 0x0149, %tick
	.word 0xbe9ce1b7  ! 3482: XORcc_I	xorcc 	%r19, 0x01b7, %r31
	.word 0xf33c6004  ! 3483: STDF_I	std	%f25, [0x0004, %r17]
	.word 0xf6758000  ! 3488: STX_R	stx	%r27, [%r22 + %r0]
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb934f001  ! 3493: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xff3ca0a5  ! 3495: STDF_I	std	%f31, [0x00a5, %r18]
	.word 0xf42d4000  ! 3496: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xbf500000  ! 3498: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xff3ca188  ! 3499: STDF_I	std	%f31, [0x0188, %r18]
	.word 0x899561c6  ! 3500: WRPR_TICK_I	wrpr	%r21, 0x01c6, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8795e1c9  ! 3507: WRPR_TT_I	wrpr	%r23, 0x01c9, %tt
	.word 0xf2254000  ! 3508: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfd3d216b  ! 3511: STDF_I	std	%f30, [0x016b, %r20]
	.word 0xf93c4000  ! 3514: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb7480000  ! 3518: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_6, %g1, %r21
	.word 0xff3da0df  ! 3522: STDF_I	std	%f31, [0x00df, %r22]
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa758000  ! 3525: STX_R	stx	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c09  ! 3528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c09, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 3529: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb480000  ! 3531: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf07560c4  ! 3532: STX_I	stx	%r24, [%r21 + 0x00c4]
	.word 0xfc2dc000  ! 3537: STB_R	stb	%r30, [%r23 + %r0]
	setx	0x21d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2d2012  ! 3540: STB_I	stb	%r31, [%r20 + 0x0012]
	.word 0x8394e143  ! 3541: WRPR_TNPC_I	wrpr	%r19, 0x0143, %tnpc
	.word 0xf23c0000  ! 3549: STD_R	std	%r25, [%r16 + %r0]
	.word 0xbe1d4000  ! 3552: XOR_R	xor 	%r21, %r0, %r31
	.word 0xf03d21e2  ! 3553: STD_I	std	%r24, [%r20 + 0x01e2]
	.word 0xf23c20f6  ! 3554: STD_I	std	%r25, [%r16 + 0x00f6]
	.word 0xf634a1b2  ! 3559: STH_I	sth	%r27, [%r18 + 0x01b2]
	.word 0xb550c000  ! 3562: RDPR_TT	rdpr	%tt, %r26
	.word 0xf02d8000  ! 3563: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xbb508000  ! 3564: RDPR_TSTATE	<illegal instruction>
	.word 0xfa34c000  ! 3565: STH_R	sth	%r29, [%r19 + %r0]
	.word 0x87956148  ! 3567: WRPR_TT_I	wrpr	%r21, 0x0148, %tt
	.word 0x8795217c  ! 3570: WRPR_TT_I	wrpr	%r20, 0x017c, %tt
	.word 0xb351c000  ! 3571: RDPR_TL	rdpr	%tl, %r25
	.word 0x89952130  ! 3578: WRPR_TICK_I	wrpr	%r20, 0x0130, %tick
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8340000  ! 3586: STH_R	sth	%r28, [%r16 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 3587: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd500000  ! 3592: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf62d6085  ! 3595: STB_I	stb	%r27, [%r21 + 0x0085]
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c8000  ! 3599: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfa35c000  ! 3601: STH_R	sth	%r29, [%r23 + %r0]
	.word 0x8394203e  ! 3603: WRPR_TNPC_I	wrpr	%r16, 0x003e, %tnpc
	.word 0xfa744000  ! 3604: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf22d6152  ! 3610: STB_I	stb	%r25, [%r21 + 0x0152]
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d4000  ! 3616: STD_R	std	%r30, [%r21 + %r0]
	.word 0xb3641800  ! 3618: MOVcc_R	<illegal instruction>
	.word 0xb33db001  ! 3620: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xb950c000  ! 3622: RDPR_TT	rdpr	%tt, %r28
	.word 0xf83c2006  ! 3624: STD_I	std	%r28, [%r16 + 0x0006]
	.word 0x919561ea  ! 3625: WRPR_PIL_I	wrpr	%r21, 0x01ea, %pil
	.word 0x8594614a  ! 3627: WRPR_TSTATE_I	wrpr	%r17, 0x014a, %tstate
	.word 0xfe34c000  ! 3634: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf4352145  ! 3639: STH_I	sth	%r26, [%r20 + 0x0145]
	.word 0xfa35e157  ! 3640: STH_I	sth	%r29, [%r23 + 0x0157]
	.word 0xfa750000  ! 3641: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf22d200b  ! 3646: STB_I	stb	%r25, [%r20 + 0x000b]
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24e0ef  ! 3649: STW_I	stw	%r31, [%r19 + 0x00ef]
	.word 0xf234603d  ! 3650: STH_I	sth	%r25, [%r17 + 0x003d]
	.word 0x8594e129  ! 3652: WRPR_TSTATE_I	wrpr	%r19, 0x0129, %tstate
	.word 0xf025a04d  ! 3653: STW_I	stw	%r24, [%r22 + 0x004d]
	.word 0xf23dc000  ! 3655: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb150c000  ! 3656: RDPR_TT	rdpr	%tt, %r24
	.word 0xf62de041  ! 3657: STB_I	stb	%r27, [%r23 + 0x0041]
	.word 0xfe240000  ! 3658: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf8344000  ! 3662: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb92dc000  ! 3664: SLL_R	sll 	%r23, %r0, %r28
	.word 0xf6256002  ! 3666: STW_I	stw	%r27, [%r21 + 0x0002]
	.word 0xb0bd0000  ! 3667: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xfa340000  ! 3670: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xbe14e163  ! 3672: OR_I	or 	%r19, 0x0163, %r31
	.word 0xb1510000  ! 3673: RDPR_TICK	<illegal instruction>
	.word 0xbb3d1000  ! 3675: SRAX_R	srax	%r20, %r0, %r29
	.word 0xfc34c000  ! 3678: STH_R	sth	%r30, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 3679: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8994206c  ! 3680: WRPR_TICK_I	wrpr	%r16, 0x006c, %tick
	.word 0xfa24e17c  ! 3681: STW_I	stw	%r29, [%r19 + 0x017c]
	.word 0xb42d0000  ! 3684: ANDN_R	andn 	%r20, %r0, %r26
	setx	0x10139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc242026  ! 3691: SUB_I	sub 	%r16, 0x0026, %r30
	.word 0xfa24a159  ! 3694: STW_I	stw	%r29, [%r18 + 0x0159]
	.word 0xf275615a  ! 3695: STX_I	stx	%r25, [%r21 + 0x015a]
	.word 0xbf50c000  ! 3696: RDPR_TT	rdpr	%tt, %r31
	.word 0xf13dc000  ! 3698: STDF_R	std	%f24, [%r0, %r23]
	.word 0xb7540000  ! 3700: RDPR_GL	<illegal instruction>
	.word 0xbf50c000  ! 3703: RDPR_TT	<illegal instruction>
	.word 0xb151c000  ! 3704: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3707: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 3709: STX_R	stx	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x819829d1  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0x91942080  ! 3718: WRPR_PIL_I	wrpr	%r16, 0x0080, %pil
	.word 0xf874c000  ! 3719: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf6346059  ! 3723: STH_I	sth	%r27, [%r17 + 0x0059]
	.word 0xf22521bb  ! 3724: STW_I	stw	%r25, [%r20 + 0x01bb]
	.word 0xfe3ce035  ! 3725: STD_I	std	%r31, [%r19 + 0x0035]
	.word 0xb1500000  ! 3728: RDPR_TPC	rdpr	%tpc, %r24
	setx	0x2032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe356053  ! 3740: STH_I	sth	%r31, [%r21 + 0x0053]
	.word 0xfe740000  ! 3741: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf6344000  ! 3742: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf4354000  ! 3744: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfa342065  ! 3748: STH_I	sth	%r29, [%r16 + 0x0065]
	.word 0x8d94a014  ! 3749: WRPR_PSTATE_I	wrpr	%r18, 0x0014, %pstate
	.word 0x91946152  ! 3750: WRPR_PIL_I	wrpr	%r17, 0x0152, %pil
	mov	0, %r12
	.word 0x8f932000  ! 3754: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf22da057  ! 3755: STB_I	stb	%r25, [%r22 + 0x0057]
	.word 0xf2248000  ! 3760: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb9480000  ! 3761: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42ca134  ! 3763: STB_I	stb	%r26, [%r18 + 0x0134]
	.word 0xf0256026  ! 3765: STW_I	stw	%r24, [%r21 + 0x0026]
	.word 0xb5500000  ! 3769: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3772: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcb44000  ! 3774: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0xbc9c8000  ! 3775: XORcc_R	xorcc 	%r18, %r0, %r30
	.word 0xf63560be  ! 3776: STH_I	sth	%r27, [%r21 + 0x00be]
	.word 0xf73c0000  ! 3778: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf235a186  ! 3779: STH_I	sth	%r25, [%r22 + 0x0186]
	.word 0xb7540000  ! 3781: RDPR_GL	rdpr	%-, %r27
	.word 0x899461a3  ! 3786: WRPR_TICK_I	wrpr	%r17, 0x01a3, %tick
	.word 0xf42c4000  ! 3787: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xfa258000  ! 3790: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf82d4000  ! 3792: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfa25a073  ! 3793: STW_I	stw	%r29, [%r22 + 0x0073]
	.word 0xb224610b  ! 3795: SUB_I	sub 	%r17, 0x010b, %r25
	.word 0xb72c0000  ! 3796: SLL_R	sll 	%r16, %r0, %r27
	.word 0xf8748000  ! 3799: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf8340000  ! 3803: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf62da03d  ! 3806: STB_I	stb	%r27, [%r22 + 0x003d]
	.word 0xf22da0e5  ! 3807: STB_I	stb	%r25, [%r22 + 0x00e5]
	.word 0xbf518000  ! 3812: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf33cc000  ! 3815: STDF_R	std	%f25, [%r0, %r19]
	.word 0x8795a008  ! 3819: WRPR_TT_I	wrpr	%r22, 0x0008, %tt
	.word 0x8595601e  ! 3822: WRPR_TSTATE_I	wrpr	%r21, 0x001e, %tstate
	.word 0xb5643801  ! 3825: MOVcc_I	<illegal instruction>
	.word 0xb1480000  ! 3827: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8194e06f  ! 3832: WRPR_TPC_I	wrpr	%r19, 0x006f, %tpc
	.word 0xbb480000  ! 3835: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf83d8000  ! 3841: STD_R	std	%r28, [%r22 + %r0]
	.word 0xfe2d61a8  ! 3842: STB_I	stb	%r31, [%r21 + 0x01a8]
	.word 0xb72d4000  ! 3844: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbf641800  ! 3846: MOVcc_R	<illegal instruction>
	.word 0xb3540000  ! 3849: RDPR_GL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3851: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23d4000  ! 3854: STD_R	std	%r25, [%r21 + %r0]
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94600d  ! 3857: WRPR_PSTATE_I	wrpr	%r17, 0x000d, %pstate
	.word 0x8995e13b  ! 3858: WRPR_TICK_I	wrpr	%r23, 0x013b, %tick
	mov	2, %r14
	.word 0xa193a000  ! 3859: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa3d8000  ! 3863: STD_R	std	%r29, [%r22 + %r0]
	.word 0xbb540000  ! 3864: RDPR_GL	rdpr	%-, %r29
	.word 0xfe3c619b  ! 3865: STD_I	std	%r31, [%r17 + 0x019b]
	.word 0xf074a1a3  ! 3866: STX_I	stx	%r24, [%r18 + 0x01a3]
	.word 0xf224c000  ! 3872: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xff3d600b  ! 3873: STDF_I	std	%f31, [0x000b, %r21]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4b5e019  ! 3877: SUBCcc_I	orncc 	%r23, 0x0019, %r26
	.word 0xf62d8000  ! 3880: STB_R	stb	%r27, [%r22 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 3884: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc35204a  ! 3887: STH_I	sth	%r30, [%r20 + 0x004a]
	setx	data_start_1, %g1, %r16
	.word 0xf13d8000  ! 3890: STDF_R	std	%f24, [%r0, %r22]
	mov	1, %r14
	.word 0xa193a000  ! 3891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d9561b8  ! 3893: WRPR_PSTATE_I	wrpr	%r21, 0x01b8, %pstate
	.word 0xbe344000  ! 3895: ORN_R	orn 	%r17, %r0, %r31
	.word 0xfe2460cc  ! 3898: STW_I	stw	%r31, [%r17 + 0x00cc]
	.word 0xb12c8000  ! 3901: SLL_R	sll 	%r18, %r0, %r24
	.word 0xf82c21e9  ! 3902: STB_I	stb	%r28, [%r16 + 0x01e9]
	.word 0xf43de1be  ! 3904: STD_I	std	%r26, [%r23 + 0x01be]
	.word 0xf424c000  ! 3905: STW_R	stw	%r26, [%r19 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3907: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x919420e9  ! 3908: WRPR_PIL_I	wrpr	%r16, 0x00e9, %pil
	.word 0xfa248000  ! 3910: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf03d615c  ! 3911: STD_I	std	%r24, [%r21 + 0x015c]
	.word 0xfa744000  ! 3912: STX_R	stx	%r29, [%r17 + %r0]
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 3921: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x8995e03c  ! 3922: WRPR_TICK_I	wrpr	%r23, 0x003c, %tick
	.word 0x8994206d  ! 3923: WRPR_TICK_I	wrpr	%r16, 0x006d, %tick
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc758000  ! 3927: STX_R	stx	%r30, [%r22 + %r0]
	.word 0x8d94210b  ! 3928: WRPR_PSTATE_I	wrpr	%r16, 0x010b, %pstate
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02dc000  ! 3932: STB_R	stb	%r24, [%r23 + %r0]
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3d20eb  ! 3934: STDF_I	std	%f30, [0x00eb, %r20]
	.word 0x8d956063  ! 3936: WRPR_PSTATE_I	wrpr	%r21, 0x0063, %pstate
	setx	data_start_0, %g1, %r21
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca0c7  ! 3942: STB_I	stb	%r31, [%r18 + 0x00c7]
	.word 0xf63c8000  ! 3943: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf23520d8  ! 3946: STH_I	sth	%r25, [%r20 + 0x00d8]
	.word 0xf824e131  ! 3947: STW_I	stw	%r28, [%r19 + 0x0131]
	.word 0xf8356119  ! 3948: STH_I	sth	%r28, [%r21 + 0x0119]
	.word 0xff3d4000  ! 3949: STDF_R	std	%f31, [%r0, %r21]
	setx	data_start_6, %g1, %r17
	.word 0xbd540000  ! 3953: RDPR_GL	rdpr	%-, %r30
	.word 0xb8340000  ! 3954: SUBC_R	orn 	%r16, %r0, %r28
	.word 0xf6744000  ! 3955: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xb89d8000  ! 3960: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xf625c000  ! 3963: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xfc342104  ! 3965: STH_I	sth	%r30, [%r16 + 0x0104]
	.word 0xfa3de04b  ! 3970: STD_I	std	%r29, [%r23 + 0x004b]
	.word 0x8194a1e6  ! 3971: WRPR_TPC_I	wrpr	%r18, 0x01e6, %tpc
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 3974: RDPR_GL	rdpr	%-, %r25
	.word 0xb3540000  ! 3975: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 3978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	.word 0xfc2ce180  ! 3984: STB_I	stb	%r30, [%r19 + 0x0180]
	.word 0xb5510000  ! 3987: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfd3d0000  ! 3992: STDF_R	std	%f30, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	.word 0x819839c3  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c3, %hpstate
	.word 0xf83ce135  ! 3996: STD_I	std	%r28, [%r19 + 0x0135]
	.word 0xfa35603b  ! 3998: STH_I	sth	%r29, [%r21 + 0x003b]
	.word 0xfa354000  ! 4001: STH_R	sth	%r29, [%r21 + %r0]
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 4010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0xf02c8000  ! 4012: STB_R	stb	%r24, [%r18 + %r0]
	.word 0x8d94a18e  ! 4016: WRPR_PSTATE_I	wrpr	%r18, 0x018e, %pstate
	.word 0xfc354000  ! 4017: STH_R	sth	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983893  ! 4022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1893, %hpstate
	.word 0xf6356113  ! 4026: STH_I	sth	%r27, [%r21 + 0x0113]
	.word 0x8394e1d6  ! 4031: WRPR_TNPC_I	wrpr	%r19, 0x01d6, %tnpc
	setx	data_start_5, %g1, %r22
	.word 0xb3500000  ! 4033: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb9520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xf634a1f3  ! 4035: STH_I	sth	%r27, [%r18 + 0x01f3]
	.word 0xb42c20eb  ! 4040: ANDN_I	andn 	%r16, 0x00eb, %r26
	.word 0xbb500000  ! 4041: RDPR_TPC	<illegal instruction>
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d0000  ! 4043: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf63d21c0  ! 4045: STD_I	std	%r27, [%r20 + 0x01c0]
	.word 0xf63c207d  ! 4049: STD_I	std	%r27, [%r16 + 0x007d]
	.word 0xfc750000  ! 4050: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb1540000  ! 4051: RDPR_GL	<illegal instruction>
	.word 0xfc2c2089  ! 4052: STB_I	stb	%r30, [%r16 + 0x0089]
	.word 0xb1480000  ! 4053: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf62d0000  ! 4055: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf42cc000  ! 4057: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf4740000  ! 4058: STX_R	stx	%r26, [%r16 + %r0]
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 4061: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xfb3c0000  ! 4064: STDF_R	std	%f29, [%r0, %r16]
	setx	0x1013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 4070: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xb5540000  ! 4071: RDPR_GL	<illegal instruction>
	.word 0xf674e05b  ! 4077: STX_I	stx	%r27, [%r19 + 0x005b]
	mov	2, %r14
	.word 0xa193a000  ! 4078: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d8000  ! 4082: STDF_R	std	%f27, [%r0, %r22]
	setx	0x10018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 4084: RDPR_TT	rdpr	%tt, %r30
	.word 0xf0754000  ! 4087: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfa35e138  ! 4089: STH_I	sth	%r29, [%r23 + 0x0138]
	.word 0xf43ca078  ! 4092: STD_I	std	%r26, [%r18 + 0x0078]
	.word 0xba84e0d7  ! 4094: ADDcc_I	addcc 	%r19, 0x00d7, %r29
	.word 0xf83d8000  ! 4095: STD_R	std	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f01  ! 4097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	.word 0xf83c0000  ! 4104: STD_R	std	%r28, [%r16 + %r0]
	.word 0xfc75201a  ! 4108: STX_I	stx	%r30, [%r20 + 0x001a]
	.word 0xfe75c000  ! 4112: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf8248000  ! 4113: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xbb2c7001  ! 4114: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xf074a14c  ! 4115: STX_I	stx	%r24, [%r18 + 0x014c]
	.word 0xfa758000  ! 4116: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf62560b5  ! 4118: STW_I	stw	%r27, [%r21 + 0x00b5]
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30332, %g1, %o0
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
	setx	data_start_3, %g1, %r16
	.word 0xf73d60d4  ! 4134: STDF_I	std	%f27, [0x00d4, %r21]
	.word 0xfe3d0000  ! 4138: STD_R	std	%r31, [%r20 + %r0]
	.word 0x8795e104  ! 4139: WRPR_TT_I	wrpr	%r23, 0x0104, %tt
	.word 0xf2242185  ! 4141: STW_I	stw	%r25, [%r16 + 0x0185]
	mov	1, %r14
	.word 0xa193a000  ! 4144: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e0ca  ! 4147: WRPR_TPC_I	wrpr	%r19, 0x00ca, %tpc
	.word 0xfa2ce096  ! 4150: STB_I	stb	%r29, [%r19 + 0x0096]
	.word 0xb6b48000  ! 4151: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xf63c20fd  ! 4152: STD_I	std	%r27, [%r16 + 0x00fd]
	.word 0xb750c000  ! 4153: RDPR_TT	rdpr	%tt, %r27
	.word 0xbf50c000  ! 4154: RDPR_TT	<illegal instruction>
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4157: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc24c000  ! 4160: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb5500000  ! 4166: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xbb540000  ! 4167: RDPR_GL	<illegal instruction>
	.word 0xf82d4000  ! 4170: STB_R	stb	%r28, [%r21 + %r0]
	setx	data_start_6, %g1, %r22
	.word 0xf0348000  ! 4176: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xbd3d7001  ! 4177: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xfe3dc000  ! 4178: STD_R	std	%r31, [%r23 + %r0]
	.word 0xfe25a062  ! 4181: STW_I	stw	%r31, [%r22 + 0x0062]
	.word 0xf0248000  ! 4182: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xb72d8000  ! 4184: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb23c8000  ! 4185: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xb7504000  ! 4188: RDPR_TNPC	<illegal instruction>
	.word 0xfe2c8000  ! 4189: STB_R	stb	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8ac20fb  ! 4201: ANDNcc_I	andncc 	%r16, 0x00fb, %r28
	.word 0xf634c000  ! 4202: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf634c000  ! 4205: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfa758000  ! 4207: STX_R	stx	%r29, [%r22 + %r0]
	.word 0x8994e1c6  ! 4210: WRPR_TICK_I	wrpr	%r19, 0x01c6, %tick
	.word 0xf224c000  ! 4211: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf0342183  ! 4213: STH_I	sth	%r24, [%r16 + 0x0183]
	.word 0xf23d8000  ! 4214: STD_R	std	%r25, [%r22 + %r0]
	setx	data_start_4, %g1, %r22
	.word 0x87956124  ! 4218: WRPR_TT_I	wrpr	%r21, 0x0124, %tt
	.word 0xb9504000  ! 4227: RDPR_TNPC	rdpr	%tnpc, %r28
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xf424e09d  ! 4232: STW_I	stw	%r26, [%r19 + 0x009d]
	.word 0xfc3c4000  ! 4235: STD_R	std	%r30, [%r17 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 4237: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r18
	.word 0xf02c0000  ! 4239: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf0248000  ! 4240: STW_R	stw	%r24, [%r18 + %r0]
	setx	0x30002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 4244: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xfb3dc000  ! 4246: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf4750000  ! 4249: STX_R	stx	%r26, [%r20 + %r0]
	.word 0x879560fb  ! 4250: WRPR_TT_I	wrpr	%r21, 0x00fb, %tt
	.word 0xf27561a1  ! 4253: STX_I	stx	%r25, [%r21 + 0x01a1]
	mov	0, %r12
	.word 0x8f932000  ! 4255: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf03d4000  ! 4256: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf33d0000  ! 4258: STDF_R	std	%f25, [%r0, %r20]
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2348000  ! 4263: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994215f  ! 4270: WRPR_TICK_I	wrpr	%r16, 0x015f, %tick
	.word 0xbb520000  ! 4273: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf625e009  ! 4275: STW_I	stw	%r27, [%r23 + 0x0009]
	.word 0xfc348000  ! 4278: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf73d2036  ! 4280: STDF_I	std	%f27, [0x0036, %r20]
	setx	data_start_3, %g1, %r20
	.word 0x8794a1f2  ! 4289: WRPR_TT_I	wrpr	%r18, 0x01f2, %tt
	.word 0xf42561d5  ! 4293: STW_I	stw	%r26, [%r21 + 0x01d5]
	setx	0x1013e, %g1, %o0
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
	.word 0xff3c219f  ! 4298: STDF_I	std	%f31, [0x019f, %r16]
	.word 0xf73c8000  ! 4299: STDF_R	std	%f27, [%r0, %r18]
	.word 0xf2748000  ! 4300: STX_R	stx	%r25, [%r18 + %r0]
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e180  ! 4302: WRPR_PSTATE_I	wrpr	%r19, 0x0180, %pstate
	.word 0xfd3de00c  ! 4306: STDF_I	std	%f30, [0x000c, %r23]
	.word 0xb4c58000  ! 4313: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xf42d0000  ! 4318: STB_R	stb	%r26, [%r20 + %r0]
	.word 0x8195a07e  ! 4319: WRPR_TPC_I	wrpr	%r22, 0x007e, %tpc
	.word 0xb5508000  ! 4320: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	0x2023e, %g1, %o0
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
	.word 0xb29c8000  ! 4325: XORcc_R	xorcc 	%r18, %r0, %r25
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 4329: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xb03d4000  ! 4332: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xf2348000  ! 4333: STH_R	sth	%r25, [%r18 + %r0]
	.word 0x819421fc  ! 4334: WRPR_TPC_I	wrpr	%r16, 0x01fc, %tpc
	.word 0xb9540000  ! 4335: RDPR_GL	rdpr	%-, %r28
	.word 0xf33ca110  ! 4338: STDF_I	std	%f25, [0x0110, %r18]
	.word 0xf6242027  ! 4339: STW_I	stw	%r27, [%r16 + 0x0027]
	.word 0xf03ce1c0  ! 4345: STD_I	std	%r24, [%r19 + 0x01c0]
	.word 0xf22ce00c  ! 4349: STB_I	stb	%r25, [%r19 + 0x000c]
	.word 0xf2246111  ! 4350: STW_I	stw	%r25, [%r17 + 0x0111]
	.word 0xff3ce0bc  ! 4351: STDF_I	std	%f31, [0x00bc, %r19]
	.word 0xf034a0df  ! 4353: STH_I	sth	%r24, [%r18 + 0x00df]
	.word 0xf82c605a  ! 4359: STB_I	stb	%r28, [%r17 + 0x005a]
	.word 0x87942123  ! 4363: WRPR_TT_I	wrpr	%r16, 0x0123, %tt
	.word 0xfc74e14e  ! 4366: STX_I	stx	%r30, [%r19 + 0x014e]
	.word 0x8d95a145  ! 4368: WRPR_PSTATE_I	wrpr	%r22, 0x0145, %pstate
	.word 0xf8350000  ! 4377: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xb005a098  ! 4380: ADD_I	add 	%r22, 0x0098, %r24
	.word 0xfc2d0000  ! 4381: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfd3ce119  ! 4382: STDF_I	std	%f30, [0x0119, %r19]
	.word 0xbb518000  ! 4383: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfc35c000  ! 4384: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xba3c0000  ! 4386: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xf02c0000  ! 4388: STB_R	stb	%r24, [%r16 + %r0]
	.word 0x919521c4  ! 4392: WRPR_PIL_I	wrpr	%r20, 0x01c4, %pil
	.word 0xfc34c000  ! 4399: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfc340000  ! 4400: STH_R	sth	%r30, [%r16 + %r0]
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a19b  ! 4405: WRPR_TPC_I	wrpr	%r18, 0x019b, %tpc
	.word 0xf43521dd  ! 4407: STH_I	sth	%r26, [%r20 + 0x01dd]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb480000  ! 4412: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7510000  ! 4414: RDPR_TICK	<illegal instruction>
	.word 0xf82c0000  ! 4415: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf8748000  ! 4416: STX_R	stx	%r28, [%r18 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 4417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf67520c0  ! 4418: STX_I	stx	%r27, [%r20 + 0x00c0]
	.word 0xb5500000  ! 4421: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e4b  ! 4425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4b, %hpstate
	.word 0x839561e6  ! 4428: WRPR_TNPC_I	wrpr	%r21, 0x01e6, %tnpc
	.word 0xb3520000  ! 4432: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb28c8000  ! 4435: ANDcc_R	andcc 	%r18, %r0, %r25
	.word 0xbe0cc000  ! 4442: AND_R	and 	%r19, %r0, %r31
	.word 0xfc2cc000  ! 4443: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb3518000  ! 4446: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf4244000  ! 4448: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xbc148000  ! 4449: OR_R	or 	%r18, %r0, %r30
	.word 0xbf540000  ! 4452: RDPR_GL	<illegal instruction>
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3c2065  ! 4461: STDF_I	std	%f31, [0x0065, %r16]
	.word 0xbb7d4400  ! 4463: MOVR_R	movre	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc756189  ! 4467: STX_I	stx	%r30, [%r21 + 0x0189]
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3dc000  ! 4470: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf0242108  ! 4471: STW_I	stw	%r24, [%r16 + 0x0108]
	.word 0xf23c8000  ! 4472: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf03c0000  ! 4473: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbd508000  ! 4476: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xbd520000  ! 4477: RDPR_PIL	<illegal instruction>
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc240000  ! 4483: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xbb504000  ! 4484: RDPR_TNPC	rdpr	%tnpc, %r29
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c4000  ! 4488: SRA_R	sra 	%r17, %r0, %r30
	.word 0xbb504000  ! 4491: RDPR_TNPC	<illegal instruction>
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 4495: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xbcbc0000  ! 4496: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xbf508000  ! 4502: RDPR_TSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf33c8000  ! 4504: STDF_R	std	%f25, [%r0, %r18]
	.word 0xfb3ca12d  ! 4505: STDF_I	std	%f29, [0x012d, %r18]
	.word 0xf63561fb  ! 4507: STH_I	sth	%r27, [%r21 + 0x01fb]
	.word 0xf0256039  ! 4508: STW_I	stw	%r24, [%r21 + 0x0039]
	.word 0xba0d8000  ! 4509: AND_R	and 	%r22, %r0, %r29
	.word 0xb235210f  ! 4515: SUBC_I	orn 	%r20, 0x010f, %r25
	.word 0xbf504000  ! 4516: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbd50c000  ! 4522: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4523: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 4525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xbe452144  ! 4526: ADDC_I	addc 	%r20, 0x0144, %r31
	setx	data_start_0, %g1, %r22
	.word 0xf475204d  ! 4528: STX_I	stx	%r26, [%r20 + 0x004d]
	.word 0xba052005  ! 4531: ADD_I	add 	%r20, 0x0005, %r29
	.word 0xf82d0000  ! 4533: STB_R	stb	%r28, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983fcb  ! 4536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcb, %hpstate
	.word 0xb151c000  ! 4537: RDPR_TL	rdpr	%tl, %r24
	.word 0xfa3520bc  ! 4538: STH_I	sth	%r29, [%r20 + 0x00bc]
	.word 0xb6342132  ! 4539: ORN_I	orn 	%r16, 0x0132, %r27
	.word 0xba0c4000  ! 4540: AND_R	and 	%r17, %r0, %r29
	.word 0xf874a0de  ! 4544: STX_I	stx	%r28, [%r18 + 0x00de]
	.word 0x8194a18b  ! 4545: WRPR_TPC_I	wrpr	%r18, 0x018b, %tpc
	.word 0xb3500000  ! 4550: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbe9de0dc  ! 4554: XORcc_I	xorcc 	%r23, 0x00dc, %r31
	.word 0xf82420db  ! 4558: STW_I	stw	%r28, [%r16 + 0x00db]
	setx	data_start_6, %g1, %r19
	setx	data_start_5, %g1, %r18
	.word 0xf73c4000  ! 4563: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf23ca1c3  ! 4564: STD_I	std	%r25, [%r18 + 0x01c3]
	.word 0xb2448000  ! 4573: ADDC_R	addc 	%r18, %r0, %r25
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c0000  ! 4579: STDF_R	std	%f26, [%r0, %r16]
	mov	2, %r14
	.word 0xa193a000  ! 4580: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983acb  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acb, %hpstate
	.word 0xf225e091  ! 4589: STW_I	stw	%r25, [%r23 + 0x0091]
	.word 0xfe750000  ! 4592: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb0ada131  ! 4599: ANDNcc_I	andncc 	%r22, 0x0131, %r24
	.word 0xfc2c60c0  ! 4605: STB_I	stb	%r30, [%r17 + 0x00c0]
	.word 0xfe2c8000  ! 4609: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf4744000  ! 4610: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf23d615c  ! 4611: STD_I	std	%r25, [%r21 + 0x015c]
	setx	data_start_6, %g1, %r23
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe35e116  ! 4616: STH_I	sth	%r31, [%r23 + 0x0116]
	.word 0x83956065  ! 4617: WRPR_TNPC_I	wrpr	%r21, 0x0065, %tnpc
	.word 0x81952097  ! 4619: WRPR_TPC_I	wrpr	%r20, 0x0097, %tpc
	.word 0xff3c21e4  ! 4622: STDF_I	std	%f31, [0x01e4, %r16]
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 4630: RDPR_TSTATE	rdpr	%tstate, %r24
	setx	0x1032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82c8000  ! 4637: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfe2de0bf  ! 4640: STB_I	stb	%r31, [%r23 + 0x00bf]
	.word 0xf23c2013  ! 4642: STD_I	std	%r25, [%r16 + 0x0013]
	.word 0xfa352121  ! 4643: STH_I	sth	%r29, [%r20 + 0x0121]
	.word 0xfa3dc000  ! 4644: STD_R	std	%r29, [%r23 + %r0]
	.word 0x899560b4  ! 4646: WRPR_TICK_I	wrpr	%r21, 0x00b4, %tick
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c4000  ! 4648: STD_R	std	%r25, [%r17 + %r0]
	.word 0xb7510000  ! 4650: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf43c4000  ! 4655: STD_R	std	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 4658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	.word 0xfd3c20b2  ! 4659: STDF_I	std	%f30, [0x00b2, %r16]
	.word 0xf024a0aa  ! 4660: STW_I	stw	%r24, [%r18 + 0x00aa]
	.word 0xf635a1d7  ! 4663: STH_I	sth	%r27, [%r22 + 0x01d7]
	.word 0xbc2d0000  ! 4666: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xf2740000  ! 4669: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb9348000  ! 4672: SRL_R	srl 	%r18, %r0, %r28
	.word 0xf82da186  ! 4678: STB_I	stb	%r28, [%r22 + 0x0186]
	.word 0xf0350000  ! 4683: STH_R	sth	%r24, [%r20 + %r0]
	.word 0x91952008  ! 4685: WRPR_PIL_I	wrpr	%r20, 0x0008, %pil
	.word 0xb82dc000  ! 4687: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xf035e030  ! 4690: STH_I	sth	%r24, [%r23 + 0x0030]
	.word 0xfe2c2169  ! 4692: STB_I	stb	%r31, [%r16 + 0x0169]
	.word 0xf53dc000  ! 4693: STDF_R	std	%f26, [%r0, %r23]
	.word 0xb444c000  ! 4696: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xf23c6083  ! 4699: STD_I	std	%r25, [%r17 + 0x0083]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 4704: STH_R	sth	%r25, [%r20 + %r0]
	.word 0x8d95a0fb  ! 4706: WRPR_PSTATE_I	wrpr	%r22, 0x00fb, %pstate
	.word 0xf424e18f  ! 4708: STW_I	stw	%r26, [%r19 + 0x018f]
	.word 0xfe3c8000  ! 4709: STD_R	std	%r31, [%r18 + %r0]
	.word 0xfe34e000  ! 4710: STH_I	sth	%r31, [%r19 + 0x0000]
	.word 0xfa74c000  ! 4712: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfc3c0000  ! 4713: STD_R	std	%r30, [%r16 + %r0]
	.word 0xfa35c000  ! 4714: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf13cc000  ! 4715: STDF_R	std	%f24, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 4720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	.word 0xb5348000  ! 4731: SRL_R	srl 	%r18, %r0, %r26
	.word 0xff3c0000  ! 4736: STDF_R	std	%f31, [%r0, %r16]
	.word 0xfc3c0000  ! 4738: STD_R	std	%r30, [%r16 + %r0]
	.word 0xbe044000  ! 4743: ADD_R	add 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595e176  ! 4747: WRPR_TSTATE_I	wrpr	%r23, 0x0176, %tstate
	.word 0xf0750000  ! 4750: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfc2420ae  ! 4754: STW_I	stw	%r30, [%r16 + 0x00ae]
	.word 0xfa2460d5  ! 4755: STW_I	stw	%r29, [%r17 + 0x00d5]
	.word 0x8194e1c2  ! 4764: WRPR_TPC_I	wrpr	%r19, 0x01c2, %tpc
	.word 0xb3510000  ! 4769: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf73dc000  ! 4771: STDF_R	std	%f27, [%r0, %r23]
	.word 0xb9643801  ! 4772: MOVcc_I	<illegal instruction>
	.word 0xf93ca1b8  ! 4775: STDF_I	std	%f28, [0x01b8, %r18]
	.word 0x85942165  ! 4779: WRPR_TSTATE_I	wrpr	%r16, 0x0165, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982943  ! 4782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	.word 0x8d9421fa  ! 4783: WRPR_PSTATE_I	wrpr	%r16, 0x01fa, %pstate
	.word 0x8994213c  ! 4785: WRPR_TICK_I	wrpr	%r16, 0x013c, %tick
	.word 0xb3508000  ! 4787: RDPR_TSTATE	rdpr	%tstate, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982dc1  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc1, %hpstate
	.word 0xf4744000  ! 4794: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf425618e  ! 4795: STW_I	stw	%r26, [%r21 + 0x018e]
	.word 0xb9508000  ! 4797: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf83d0000  ! 4800: STD_R	std	%r28, [%r20 + %r0]
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4802: RDPR_TPC	<illegal instruction>
	.word 0xf835a1b9  ! 4803: STH_I	sth	%r28, [%r22 + 0x01b9]
	.word 0xb9504000  ! 4804: RDPR_TNPC	<illegal instruction>
	.word 0xfb3d0000  ! 4805: STDF_R	std	%f29, [%r0, %r20]
	.word 0x8d95e01b  ! 4806: WRPR_PSTATE_I	wrpr	%r23, 0x001b, %pstate
	.word 0x919520dd  ! 4814: WRPR_PIL_I	wrpr	%r20, 0x00dd, %pil
	.word 0xfc244000  ! 4815: STW_R	stw	%r30, [%r17 + %r0]
	.word 0x8395e027  ! 4819: WRPR_TNPC_I	wrpr	%r23, 0x0027, %tnpc
	.word 0xfa242013  ! 4825: STW_I	stw	%r29, [%r16 + 0x0013]
	.word 0xb1641800  ! 4826: MOVcc_R	<illegal instruction>
	.word 0xb13ca001  ! 4827: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xfa7560cc  ! 4829: STX_I	stx	%r29, [%r21 + 0x00cc]
	.word 0xbc1da0b1  ! 4831: XOR_I	xor 	%r22, 0x00b1, %r30
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49de1eb  ! 4835: XORcc_I	xorcc 	%r23, 0x01eb, %r26
	.word 0xbd2de001  ! 4837: SLL_I	sll 	%r23, 0x0001, %r30
	.word 0xb425e127  ! 4839: SUB_I	sub 	%r23, 0x0127, %r26
	.word 0xf43cc000  ! 4842: STD_R	std	%r26, [%r19 + %r0]
	.word 0xbb540000  ! 4844: RDPR_GL	rdpr	%-, %r29
	.word 0xf93d8000  ! 4846: STDF_R	std	%f28, [%r0, %r22]
	.word 0xfe750000  ! 4849: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb5510000  ! 4850: RDPR_TICK	<illegal instruction>
	.word 0xb73c1000  ! 4853: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb8b50000  ! 4855: ORNcc_R	orncc 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 4856: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xfc75617f  ! 4859: STX_I	stx	%r30, [%r21 + 0x017f]
	.word 0xf22ce11d  ! 4862: STB_I	stb	%r25, [%r19 + 0x011d]
	.word 0xf2240000  ! 4863: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf82d4000  ! 4866: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfe3d8000  ! 4867: STD_R	std	%r31, [%r22 + %r0]
	.word 0xbb51c000  ! 4868: RDPR_TL	rdpr	%tl, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xf624a1ce  ! 4876: STW_I	stw	%r27, [%r18 + 0x01ce]
	.word 0xb1349000  ! 4878: SRLX_R	srlx	%r18, %r0, %r24
	setx	0x215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb844a193  ! 4884: ADDC_I	addc 	%r18, 0x0193, %r28
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d956094  ! 4888: WRPR_PSTATE_I	wrpr	%r21, 0x0094, %pstate
	.word 0xbf2cd000  ! 4889: SLLX_R	sllx	%r19, %r0, %r31
	.word 0xf83dc000  ! 4895: STD_R	std	%r28, [%r23 + %r0]
	.word 0xf62d4000  ! 4896: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf22cc000  ! 4902: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf93c0000  ! 4909: STDF_R	std	%f28, [%r0, %r16]
	.word 0xbb34b001  ! 4911: SRLX_I	srlx	%r18, 0x0001, %r29
	.word 0xbb504000  ! 4917: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xbb510000  ! 4925: RDPR_TICK	<illegal instruction>
	.word 0xb5354000  ! 4929: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb350c000  ! 4931: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 4933: RDPR_TPC	<illegal instruction>
	.word 0x8994e0e1  ! 4934: WRPR_TICK_I	wrpr	%r19, 0x00e1, %tick
	.word 0xfa348000  ! 4935: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf83ca103  ! 4939: STD_I	std	%r28, [%r18 + 0x0103]
	ta	T_CHANGE_HPRIV
	.word 0x819839d3  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d3, %hpstate
	.word 0xb9518000  ! 4944: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfe2c0000  ! 4947: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf234a1ac  ! 4948: STH_I	sth	%r25, [%r18 + 0x01ac]
	.word 0xbb500000  ! 4950: RDPR_TPC	<illegal instruction>
	.word 0xf875607d  ! 4952: STX_I	stx	%r28, [%r21 + 0x007d]
	.word 0xf425a1f7  ! 4956: STW_I	stw	%r26, [%r22 + 0x01f7]
	.word 0xb6350000  ! 4957: ORN_R	orn 	%r20, %r0, %r27
	.word 0xf93ca14b  ! 4961: STDF_I	std	%f28, [0x014b, %r18]
	.word 0xf425e001  ! 4963: STW_I	stw	%r26, [%r23 + 0x0001]
	ta	T_CHANGE_HPRIV
	.word 0x81982949  ! 4964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	setx	0x30109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf47461c4  ! 4968: STX_I	stx	%r26, [%r17 + 0x01c4]
	.word 0xfa25e165  ! 4970: STW_I	stw	%r29, [%r23 + 0x0165]
	.word 0xf53dc000  ! 4974: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfa74e1e6  ! 4975: STX_I	stx	%r29, [%r19 + 0x01e6]
	.word 0xbb520000  ! 4976: RDPR_PIL	rdpr	%pil, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x879521d0  ! 4983: WRPR_TT_I	wrpr	%r20, 0x01d0, %tt
	.word 0xf8754000  ! 4984: STX_R	stx	%r28, [%r21 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 4989: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb150c000  ! 4992: RDPR_TT	rdpr	%tt, %r24
	.word 0xb551c000  ! 4994: RDPR_TL	<illegal instruction>
	.word 0x919421c3  ! 4997: WRPR_PIL_I	wrpr	%r16, 0x01c3, %pil
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
	.word 0xf85dc000  ! 2: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf8042024  ! 3: LDUW_I	lduw	[%r16 + 0x0024], %r28
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba240000  ! 10: SUB_R	sub 	%r16, %r0, %r29
	.word 0x8394a08d  ! 12: WRPR_TNPC_I	wrpr	%r18, 0x008d, %tnpc
	.word 0xb7504000  ! 13: RDPR_TNPC	<illegal instruction>
	.word 0xf4142089  ! 18: LDUH_I	lduh	[%r16 + 0x0089], %r26
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d4000  ! 27: LDX_R	ldx	[%r21 + %r0], %r29
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89942156  ! 31: WRPR_TICK_I	wrpr	%r16, 0x0156, %tick
	.word 0xf65c0000  ! 34: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0x859421af  ! 40: WRPR_TSTATE_I	wrpr	%r16, 0x01af, %tstate
	.word 0xfa440000  ! 44: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xbf500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0xb5520000  ! 49: RDPR_PIL	<illegal instruction>
	.word 0xf00cc000  ! 52: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xfa0560ef  ! 55: LDUW_I	lduw	[%r21 + 0x00ef], %r29
	.word 0xfe05c000  ! 57: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf31de06a  ! 60: LDDF_I	ldd	[%r23, 0x006a], %f25
	.word 0xf40d4000  ! 61: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xb17da401  ! 67: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xfa44e0b1  ! 69: LDSW_I	ldsw	[%r19 + 0x00b1], %r29
	.word 0xb1518000  ! 70: RDPR_PSTATE	<illegal instruction>
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8050000  ! 73: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf0550000  ! 75: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf01d8000  ! 79: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf8044000  ! 80: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xb9518000  ! 83: RDPR_PSTATE	<illegal instruction>
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5da1db  ! 86: LDX_I	ldx	[%r22 + 0x01db], %r29
	.word 0xf8454000  ! 88: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xb7504000  ! 89: RDPR_TNPC	<illegal instruction>
	.word 0xfc0c8000  ! 90: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xbf51c000  ! 91: RDPR_TL	<illegal instruction>
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0xfe4d4000  ! 95: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf44da00d  ! 96: LDSB_I	ldsb	[%r22 + 0x000d], %r26
	.word 0x8594a033  ! 99: WRPR_TSTATE_I	wrpr	%r18, 0x0033, %tstate
	.word 0xff1c6189  ! 100: LDDF_I	ldd	[%r17, 0x0189], %f31
	.word 0xf8444000  ! 103: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xfe0d8000  ! 104: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf004e03c  ! 107: LDUW_I	lduw	[%r19 + 0x003c], %r24
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43c8000  ! 114: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xfa4d21ef  ! 115: LDSB_I	ldsb	[%r20 + 0x01ef], %r29
	mov	1, %r12
	.word 0x8f932000  ! 117: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa55e1ca  ! 119: LDSH_I	ldsh	[%r23 + 0x01ca], %r29
	.word 0xf61ce1d5  ! 120: LDD_I	ldd	[%r19 + 0x01d5], %r27
	.word 0xf40d8000  ! 121: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf24c8000  ! 125: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xfe14c000  ! 126: LDUH_R	lduh	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983a41  ! 127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a41, %hpstate
	.word 0xfc5d0000  ! 128: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xb3510000  ! 130: RDPR_TICK	<illegal instruction>
	.word 0xf41d4000  ! 131: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xfc0560a7  ! 132: LDUW_I	lduw	[%r21 + 0x00a7], %r30
	.word 0xf24dc000  ! 133: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf05c20cc  ! 134: LDX_I	ldx	[%r16 + 0x00cc], %r24
	.word 0x8994a130  ! 139: WRPR_TICK_I	wrpr	%r18, 0x0130, %tick
	.word 0x8395215c  ! 141: WRPR_TNPC_I	wrpr	%r20, 0x015c, %tnpc
	.word 0x8d94a03a  ! 142: WRPR_PSTATE_I	wrpr	%r18, 0x003a, %pstate
	.word 0xfa5dc000  ! 146: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xbd518000  ! 150: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a042  ! 152: WRPR_TT_I	wrpr	%r22, 0x0042, %tt
	.word 0xf604a1eb  ! 153: LDUW_I	lduw	[%r18 + 0x01eb], %r27
	.word 0xfa1ce106  ! 154: LDD_I	ldd	[%r19 + 0x0106], %r29
	.word 0x8d9521be  ! 155: WRPR_PSTATE_I	wrpr	%r20, 0x01be, %pstate
	.word 0xf24c616f  ! 156: LDSB_I	ldsb	[%r17 + 0x016f], %r25
	.word 0xf81da083  ! 158: LDD_I	ldd	[%r22 + 0x0083], %r28
	.word 0xb8b4e0d4  ! 159: ORNcc_I	orncc 	%r19, 0x00d4, %r28
	.word 0xf20d205f  ! 160: LDUB_I	ldub	[%r20 + 0x005f], %r25
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbead8000  ! 165: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0x91946056  ! 166: WRPR_PIL_I	wrpr	%r17, 0x0056, %pil
	.word 0xf41420b7  ! 169: LDUH_I	lduh	[%r16 + 0x00b7], %r26
	.word 0xb4aca0a8  ! 170: ANDNcc_I	andncc 	%r18, 0x00a8, %r26
	.word 0xfa5c0000  ! 171: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0x8d942032  ! 174: WRPR_PSTATE_I	wrpr	%r16, 0x0032, %pstate
	.word 0xf21c4000  ! 175: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xfe44c000  ! 176: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf015216c  ! 179: LDUH_I	lduh	[%r20 + 0x016c], %r24
	.word 0xf8148000  ! 183: LDUH_R	lduh	[%r18 + %r0], %r28
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85952190  ! 185: WRPR_TSTATE_I	wrpr	%r20, 0x0190, %tstate
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	setx	data_start_1, %g1, %r21
	.word 0xfd1c8000  ! 194: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf4142087  ! 196: LDUH_I	lduh	[%r16 + 0x0087], %r26
	.word 0xf854c000  ! 198: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xbe1561e8  ! 203: OR_I	or 	%r21, 0x01e8, %r31
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983d03  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d03, %hpstate
	.word 0x8395a0db  ! 210: WRPR_TNPC_I	wrpr	%r22, 0x00db, %tnpc
	setx	data_start_6, %g1, %r20
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e106  ! 226: WRPR_TPC_I	wrpr	%r23, 0x0106, %tpc
	.word 0xf24c2023  ! 230: LDSB_I	ldsb	[%r16 + 0x0023], %r25
	.word 0xb1643801  ! 232: MOVcc_I	<illegal instruction>
	.word 0xbb540000  ! 234: RDPR_GL	<illegal instruction>
	.word 0x91942062  ! 239: WRPR_PIL_I	wrpr	%r16, 0x0062, %pil
	.word 0xf65c0000  ! 242: LDX_R	ldx	[%r16 + %r0], %r27
	setx	data_start_7, %g1, %r17
	.word 0xf855a014  ! 247: LDSH_I	ldsh	[%r22 + 0x0014], %r28
	.word 0xbeb42198  ! 249: SUBCcc_I	orncc 	%r16, 0x0198, %r31
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba848000  ! 251: ADDcc_R	addcc 	%r18, %r0, %r29
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4142009  ! 260: LDUH_I	lduh	[%r16 + 0x0009], %r26
	.word 0x8194e0ad  ! 266: WRPR_TPC_I	wrpr	%r19, 0x00ad, %tpc
	.word 0xb7508000  ! 267: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf40d4000  ! 273: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf005e1e5  ! 274: LDUW_I	lduw	[%r23 + 0x01e5], %r24
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a0f4  ! 289: WRPR_TT_I	wrpr	%r18, 0x00f4, %tt
	.word 0xb43cc000  ! 298: XNOR_R	xnor 	%r19, %r0, %r26
	.word 0xf84dc000  ! 299: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xbeac60b1  ! 301: ANDNcc_I	andncc 	%r17, 0x00b1, %r31
	.word 0xb9500000  ! 303: RDPR_TPC	<illegal instruction>
	setx	0x10131, %g1, %o0
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
	.word 0xf255c000  ! 309: LDSH_R	ldsh	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0dc000  ! 311: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xf6550000  ! 313: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf215a1f7  ! 315: LDUH_I	lduh	[%r22 + 0x01f7], %r25
	.word 0xb37ca401  ! 317: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xba956036  ! 319: ORcc_I	orcc 	%r21, 0x0036, %r29
	setx	0x10239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xfa4de17f  ! 330: LDSB_I	ldsb	[%r23 + 0x017f], %r29
	.word 0xfe04a016  ! 332: LDUW_I	lduw	[%r18 + 0x0016], %r31
	.word 0xb61d8000  ! 335: XOR_R	xor 	%r22, %r0, %r27
	.word 0xbb518000  ! 337: RDPR_PSTATE	<illegal instruction>
	.word 0xf6546093  ! 339: LDSH_I	ldsh	[%r17 + 0x0093], %r27
	.word 0xb4a5e128  ! 342: SUBcc_I	subcc 	%r23, 0x0128, %r26
	.word 0xb53d6001  ! 347: SRA_I	sra 	%r21, 0x0001, %r26
	setx	0x1012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4442070  ! 351: LDSW_I	ldsw	[%r16 + 0x0070], %r26
	.word 0xf41d8000  ! 352: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xb7518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0xbcc44000  ! 354: ADDCcc_R	addccc 	%r17, %r0, %r30
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 358: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	.word 0xf6450000  ! 363: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe448000  ! 367: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf24c2198  ! 368: LDSB_I	ldsb	[%r16 + 0x0198], %r25
	.word 0xbd500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xb93de001  ! 373: SRA_I	sra 	%r23, 0x0001, %r28
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 379: RDPR_GL	<illegal instruction>
	.word 0xf41da166  ! 382: LDD_I	ldd	[%r22 + 0x0166], %r26
	.word 0xfa1d8000  ! 387: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xbf504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xf41d4000  ! 391: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xf2554000  ! 392: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xfb1da1d2  ! 395: LDDF_I	ldd	[%r22, 0x01d2], %f29
	.word 0xb3508000  ! 398: RDPR_TSTATE	<illegal instruction>
	.word 0xf65da081  ! 399: LDX_I	ldx	[%r22 + 0x0081], %r27
	.word 0xbf504000  ! 402: RDPR_TNPC	<illegal instruction>
	.word 0xb4058000  ! 404: ADD_R	add 	%r22, %r0, %r26
	.word 0xb8844000  ! 405: ADDcc_R	addcc 	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd1d0000  ! 408: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xfa4561bc  ! 416: LDSW_I	ldsw	[%r21 + 0x01bc], %r29
	mov	1, %r14
	.word 0xa193a000  ! 417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf015211d  ! 420: LDUH_I	lduh	[%r20 + 0x011d], %r24
	.word 0xf415e1f5  ! 421: LDUH_I	lduh	[%r23 + 0x01f5], %r26
	mov	1, %r14
	.word 0xa193a000  ! 425: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf0050000  ! 426: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xb7500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xf91da134  ! 432: LDDF_I	ldd	[%r22, 0x0134], %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xf04c8000  ! 434: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xfe55e08c  ! 436: LDSH_I	ldsh	[%r23 + 0x008c], %r31
	.word 0xbb3d4000  ! 440: SRA_R	sra 	%r21, %r0, %r29
	.word 0xba154000  ! 441: OR_R	or 	%r21, %r0, %r29
	.word 0xb7500000  ! 447: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf31d4000  ! 452: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf21d0000  ! 454: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xb095c000  ! 458: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xf60ca108  ! 475: LDUB_I	ldub	[%r18 + 0x0108], %r27
	.word 0xbe448000  ! 478: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xf71dc000  ! 479: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xf6454000  ! 484: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb1508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xfc4de03c  ! 486: LDSB_I	ldsb	[%r23 + 0x003c], %r30
	.word 0xf05461ea  ! 490: LDSH_I	ldsh	[%r17 + 0x01ea], %r24
	.word 0xf24de03b  ! 492: LDSB_I	ldsb	[%r23 + 0x003b], %r25
	.word 0xb20ce1f0  ! 493: AND_I	and 	%r19, 0x01f0, %r25
	.word 0xf60420cb  ! 499: LDUW_I	lduw	[%r16 + 0x00cb], %r27
	.word 0xbc2561aa  ! 503: SUB_I	sub 	%r21, 0x01aa, %r30
	.word 0xf054c000  ! 505: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xfc450000  ! 507: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xb5500000  ! 512: RDPR_TPC	<illegal instruction>
	.word 0xf254c000  ! 513: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0x859520a6  ! 514: WRPR_TSTATE_I	wrpr	%r20, 0x00a6, %tstate
	.word 0xbd510000  ! 515: RDPR_TICK	<illegal instruction>
	.word 0xf415a1a3  ! 516: LDUH_I	lduh	[%r22 + 0x01a3], %r26
	mov	1, %r12
	.word 0x8f932000  ! 517: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc4d0000  ! 518: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xb150c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0xf6458000  ! 528: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfe44a1c0  ! 529: LDSW_I	ldsw	[%r18 + 0x01c0], %r31
	.word 0xbc140000  ! 531: OR_R	or 	%r16, %r0, %r30
	.word 0xbabce1c4  ! 533: XNORcc_I	xnorcc 	%r19, 0x01c4, %r29
	.word 0x8995a1eb  ! 534: WRPR_TICK_I	wrpr	%r22, 0x01eb, %tick
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a05e  ! 538: WRPR_PSTATE_I	wrpr	%r18, 0x005e, %pstate
	.word 0xf11d2155  ! 543: LDDF_I	ldd	[%r20, 0x0155], %f24
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2046169  ! 547: LDUW_I	lduw	[%r17 + 0x0169], %r25
	setx	data_start_1, %g1, %r17
	.word 0xb151c000  ! 559: RDPR_TL	<illegal instruction>
	.word 0xfa0d20f3  ! 560: LDUB_I	ldub	[%r20 + 0x00f3], %r29
	.word 0xba1d2123  ! 562: XOR_I	xor 	%r20, 0x0123, %r29
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 565: RDPR_GL	<illegal instruction>
	.word 0xfa558000  ! 566: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf004e0a4  ! 567: LDUW_I	lduw	[%r19 + 0x00a4], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982bdb  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdb, %hpstate
	.word 0xbf508000  ! 570: RDPR_TSTATE	<illegal instruction>
	.word 0xf65d4000  ! 579: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xfe54c000  ! 586: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xfe0ca108  ! 587: LDUB_I	ldub	[%r18 + 0x0108], %r31
	.word 0x8194210f  ! 594: WRPR_TPC_I	wrpr	%r16, 0x010f, %tpc
	.word 0xfa540000  ! 595: LDSH_R	ldsh	[%r16 + %r0], %r29
	mov	2, %r12
	.word 0x8f932000  ! 596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe454000  ! 598: LDSW_R	ldsw	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	.word 0xf4452023  ! 601: LDSW_I	ldsw	[%r20 + 0x0023], %r26
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4ca0e5  ! 604: LDSB_I	ldsb	[%r18 + 0x00e5], %r29
	.word 0x8d952063  ! 612: WRPR_PSTATE_I	wrpr	%r20, 0x0063, %pstate
	.word 0xf2144000  ! 616: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf91c21a7  ! 617: LDDF_I	ldd	[%r16, 0x01a7], %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc54608f  ! 621: LDSH_I	ldsh	[%r17 + 0x008f], %r30
	.word 0xb7520000  ! 625: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a19  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a19, %hpstate
	.word 0xf81c618f  ! 629: LDD_I	ldd	[%r17 + 0x018f], %r28
	.word 0xb52d0000  ! 635: SLL_R	sll 	%r20, %r0, %r26
	mov	2, %r12
	.word 0x8f932000  ! 636: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf45c60d3  ! 639: LDX_I	ldx	[%r17 + 0x00d3], %r26
	.word 0xb5540000  ! 641: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4c6179  ! 645: LDSB_I	ldsb	[%r17 + 0x0179], %r31
	mov	0, %r14
	.word 0xa193a000  ! 648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8394a1e1  ! 649: WRPR_TNPC_I	wrpr	%r18, 0x01e1, %tnpc
	.word 0xbc254000  ! 652: SUB_R	sub 	%r21, %r0, %r30
	.word 0xfc45c000  ! 661: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf04ce1aa  ! 665: LDSB_I	ldsb	[%r19 + 0x01aa], %r24
	.word 0xf0146005  ! 666: LDUH_I	lduh	[%r17 + 0x0005], %r24
	.word 0xb69c0000  ! 669: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xfe5d8000  ! 670: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb4b521cd  ! 672: ORNcc_I	orncc 	%r20, 0x01cd, %r26
	.word 0xbd520000  ! 674: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb12d0000  ! 676: SLL_R	sll 	%r20, %r0, %r24
	.word 0xb5520000  ! 678: RDPR_PIL	<illegal instruction>
	.word 0x8594a0df  ! 680: WRPR_TSTATE_I	wrpr	%r18, 0x00df, %tstate
	.word 0xf31d4000  ! 682: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xfa1cc000  ! 684: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xfa5520e0  ! 687: LDSH_I	ldsh	[%r20 + 0x00e0], %r29
	.word 0xb3480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5d2186  ! 694: LDX_I	ldx	[%r20 + 0x0186], %r30
	.word 0xb82dc000  ! 695: ANDN_R	andn 	%r23, %r0, %r28
	mov	0, %r14
	.word 0xa193a000  ! 701: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe050000  ! 703: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xf81dc000  ! 704: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xf44da08d  ! 706: LDSB_I	ldsb	[%r22 + 0x008d], %r26
	.word 0xf6458000  ! 708: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf71c0000  ! 714: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xf45d20cb  ! 718: LDX_I	ldx	[%r20 + 0x00cb], %r26
	.word 0xf815e177  ! 719: LDUH_I	lduh	[%r23 + 0x0177], %r28
	setx	data_start_7, %g1, %r23
	.word 0xf005e0cb  ! 722: LDUW_I	lduw	[%r23 + 0x00cb], %r24
	.word 0x819420db  ! 724: WRPR_TPC_I	wrpr	%r16, 0x00db, %tpc
	.word 0xf71d0000  ! 727: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf11c604d  ! 733: LDDF_I	ldd	[%r17, 0x004d], %f24
	.word 0xfe4c6159  ! 734: LDSB_I	ldsb	[%r17 + 0x0159], %r31
	mov	0, %r12
	.word 0x8f932000  ! 742: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc048000  ! 743: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfa554000  ! 745: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xbd520000  ! 746: RDPR_PIL	<illegal instruction>
	.word 0xf40561c2  ! 749: LDUW_I	lduw	[%r21 + 0x01c2], %r26
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015e10a  ! 752: LDUH_I	lduh	[%r23 + 0x010a], %r24
	.word 0xfa5d612c  ! 754: LDX_I	ldx	[%r21 + 0x012c], %r29
	.word 0xf44d8000  ! 755: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xb00d61e6  ! 756: AND_I	and 	%r21, 0x01e6, %r24
	.word 0xfa1d61a7  ! 761: LDD_I	ldd	[%r21 + 0x01a7], %r29
	.word 0xb89c8000  ! 765: XORcc_R	xorcc 	%r18, %r0, %r28
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21421e5  ! 776: LDUH_I	lduh	[%r16 + 0x01e5], %r25
	.word 0xf44c4000  ! 780: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xf2144000  ! 781: LDUH_R	lduh	[%r17 + %r0], %r25
	setx	0x3023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb835a1b1  ! 783: SUBC_I	orn 	%r22, 0x01b1, %r28
	.word 0xb7508000  ! 784: RDPR_TSTATE	<illegal instruction>
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf245e1b6  ! 789: LDSW_I	ldsw	[%r23 + 0x01b6], %r25
	.word 0xbcbca01c  ! 791: XNORcc_I	xnorcc 	%r18, 0x001c, %r30
	.word 0xf20da0fc  ! 792: LDUB_I	ldub	[%r22 + 0x00fc], %r25
	mov	1, %r14
	.word 0xa193a000  ! 794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf80c602b  ! 795: LDUB_I	ldub	[%r17 + 0x002b], %r28
	.word 0xf21dc000  ! 801: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf20cc000  ! 806: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xfa5d4000  ! 807: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfc0d201e  ! 810: LDUB_I	ldub	[%r20 + 0x001e], %r30
	.word 0x8595a127  ! 817: WRPR_TSTATE_I	wrpr	%r22, 0x0127, %tstate
	.word 0xb93da001  ! 820: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0x8194205f  ! 824: WRPR_TPC_I	wrpr	%r16, 0x005f, %tpc
	.word 0xbf641800  ! 825: MOVcc_R	<illegal instruction>
	.word 0xf805a160  ! 826: LDUW_I	lduw	[%r22 + 0x0160], %r28
	.word 0xfa440000  ! 829: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf804609f  ! 834: LDUW_I	lduw	[%r17 + 0x009f], %r28
	.word 0xb551c000  ! 836: RDPR_TL	<illegal instruction>
	.word 0xfe15a031  ! 839: LDUH_I	lduh	[%r22 + 0x0031], %r31
	setx	0x2001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabde14f  ! 843: XNORcc_I	xnorcc 	%r23, 0x014f, %r29
	.word 0xfd1c0000  ! 844: LDDF_R	ldd	[%r16, %r0], %f30
	setx	0x3003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf815c000  ! 848: LDUH_R	lduh	[%r23 + %r0], %r28
	setx	0x3023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e022  ! 863: WRPR_PSTATE_I	wrpr	%r19, 0x0022, %pstate
	.word 0xf454c000  ! 865: LDSH_R	ldsh	[%r19 + %r0], %r26
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d8000  ! 868: LDX_R	ldx	[%r22 + %r0], %r27
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb42de02d  ! 873: ANDN_I	andn 	%r23, 0x002d, %r26
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 879: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 881: RDPR_GL	<illegal instruction>
	.word 0xfc5cc000  ! 883: LDX_R	ldx	[%r19 + %r0], %r30
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194602e  ! 887: WRPR_PIL_I	wrpr	%r17, 0x002e, %pil
	.word 0xfa0c601a  ! 890: LDUB_I	ldub	[%r17 + 0x001a], %r29
	.word 0xb5510000  ! 892: RDPR_TICK	<illegal instruction>
	.word 0xfa5de155  ! 894: LDX_I	ldx	[%r23 + 0x0155], %r29
	.word 0x839561e4  ! 899: WRPR_TNPC_I	wrpr	%r21, 0x01e4, %tnpc
	.word 0xb835212c  ! 900: ORN_I	orn 	%r20, 0x012c, %r28
	.word 0x85956101  ! 901: WRPR_TSTATE_I	wrpr	%r21, 0x0101, %tstate
	.word 0xb82d61ae  ! 902: ANDN_I	andn 	%r21, 0x01ae, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc448000  ! 912: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xbe94e067  ! 913: ORcc_I	orcc 	%r19, 0x0067, %r31
	.word 0xb6bdc000  ! 915: XNORcc_R	xnorcc 	%r23, %r0, %r27
	mov	0, %r12
	.word 0x8f932000  ! 917: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf805a0cc  ! 919: LDUW_I	lduw	[%r22 + 0x00cc], %r28
	.word 0xb2b42029  ! 921: ORNcc_I	orncc 	%r16, 0x0029, %r25
	.word 0xf844606a  ! 922: LDSW_I	ldsw	[%r17 + 0x006a], %r28
	.word 0xfc4da1dc  ! 924: LDSB_I	ldsb	[%r22 + 0x01dc], %r30
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf214a1b6  ! 928: LDUH_I	lduh	[%r18 + 0x01b6], %r25
	.word 0xbb643801  ! 930: MOVcc_I	<illegal instruction>
	setx	data_start_1, %g1, %r18
	.word 0xf45ca049  ! 935: LDX_I	ldx	[%r18 + 0x0049], %r26
	.word 0xf24d8000  ! 936: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf05461b9  ! 939: LDSH_I	ldsh	[%r17 + 0x01b9], %r24
	.word 0xb9520000  ! 940: RDPR_PIL	rdpr	%pil, %r28
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 944: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51d0000  ! 949: LDDF_R	ldd	[%r20, %r0], %f26
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d8000  ! 957: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xbaaca118  ! 959: ANDNcc_I	andncc 	%r18, 0x0118, %r29
	.word 0xfc4d0000  ! 961: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xfa0c60cb  ! 966: LDUB_I	ldub	[%r17 + 0x00cb], %r29
	.word 0xb53d8000  ! 970: SRA_R	sra 	%r22, %r0, %r26
	.word 0xb32c0000  ! 973: SLL_R	sll 	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1d4000  ! 976: LDD_R	ldd	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0xfa040000  ! 980: LDUW_R	lduw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94a039  ! 983: WRPR_PSTATE_I	wrpr	%r18, 0x0039, %pstate
	.word 0xf04c4000  ! 985: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xbd480000  ! 986: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x10, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	.word 0x81983a19  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a19, %hpstate
	.word 0xbe1da008  ! 994: XOR_I	xor 	%r22, 0x0008, %r31
	.word 0xb2348000  ! 996: SUBC_R	orn 	%r18, %r0, %r25
	setx	0x2012e, %g1, %o0
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
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf254a1bd  ! 1001: LDSH_I	ldsh	[%r18 + 0x01bd], %r25
	.word 0xfa152022  ! 1004: LDUH_I	lduh	[%r20 + 0x0022], %r29
	.word 0x8194a0f8  ! 1008: WRPR_TPC_I	wrpr	%r18, 0x00f8, %tpc
	.word 0xf214a0d6  ! 1010: LDUH_I	lduh	[%r18 + 0x00d6], %r25
	.word 0xfe042174  ! 1013: LDUW_I	lduw	[%r16 + 0x0174], %r31
	.word 0xbd50c000  ! 1018: RDPR_TT	<illegal instruction>
	.word 0xb3510000  ! 1022: RDPR_TICK	<illegal instruction>
	.word 0xbf7ce401  ! 1023: MOVR_I	movre	%r19, 0x1, %r31
	.word 0xfc15c000  ! 1026: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xfa544000  ! 1030: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfc452063  ! 1031: LDSW_I	ldsw	[%r20 + 0x0063], %r30
	.word 0xf8154000  ! 1037: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xbb3d1000  ! 1040: SRAX_R	srax	%r20, %r0, %r29
	.word 0xf45c4000  ! 1041: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xbf518000  ! 1045: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a01  ! 1051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a01, %hpstate
	.word 0xbd50c000  ! 1054: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf540000  ! 1057: RDPR_GL	<illegal instruction>
	.word 0xbc058000  ! 1059: ADD_R	add 	%r22, %r0, %r30
	.word 0xf64dc000  ! 1061: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf25c8000  ! 1063: LDX_R	ldx	[%r18 + %r0], %r25
	setx	data_start_5, %g1, %r22
	.word 0xf00d8000  ! 1065: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0x85946088  ! 1068: WRPR_TSTATE_I	wrpr	%r17, 0x0088, %tstate
	.word 0xf71de06d  ! 1069: LDDF_I	ldd	[%r23, 0x006d], %f27
	.word 0x83952199  ! 1071: WRPR_TNPC_I	wrpr	%r20, 0x0199, %tnpc
	.word 0xbb50c000  ! 1073: RDPR_TT	<illegal instruction>
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc05a184  ! 1084: LDUW_I	lduw	[%r22 + 0x0184], %r30
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c8000  ! 1100: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xb815e0e0  ! 1101: OR_I	or 	%r23, 0x00e0, %r28
	.word 0xf4458000  ! 1102: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf045210f  ! 1106: LDSW_I	ldsw	[%r20 + 0x010f], %r24
	.word 0xb625612e  ! 1108: SUB_I	sub 	%r21, 0x012e, %r27
	.word 0xfc55c000  ! 1114: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0x8195e0eb  ! 1115: WRPR_TPC_I	wrpr	%r23, 0x00eb, %tpc
	.word 0xf11de05e  ! 1116: LDDF_I	ldd	[%r23, 0x005e], %f24
	.word 0xff1d619e  ! 1118: LDDF_I	ldd	[%r21, 0x019e], %f31
	.word 0xf41d4000  ! 1120: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xb21de056  ! 1122: XOR_I	xor 	%r23, 0x0056, %r25
	.word 0x9194e120  ! 1123: WRPR_PIL_I	wrpr	%r19, 0x0120, %pil
	.word 0xf0450000  ! 1126: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf65de120  ! 1131: LDX_I	ldx	[%r23 + 0x0120], %r27
	.word 0xb9500000  ! 1132: RDPR_TPC	rdpr	%tpc, %r28
	setx	0x10026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1134: RDPR_TICK	<illegal instruction>
	.word 0xf214c000  ! 1135: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xb2a4c000  ! 1137: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0x8d95a1bb  ! 1141: WRPR_PSTATE_I	wrpr	%r22, 0x01bb, %pstate
	.word 0xb2ac612b  ! 1142: ANDNcc_I	andncc 	%r17, 0x012b, %r25
	.word 0x8394e1a6  ! 1143: WRPR_TNPC_I	wrpr	%r19, 0x01a6, %tnpc
	.word 0xb934a001  ! 1144: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xfa5cc000  ! 1146: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf6440000  ! 1149: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xff1d4000  ! 1150: LDDF_R	ldd	[%r21, %r0], %f31
	mov	0, %r14
	.word 0xa193a000  ! 1151: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1504000  ! 1152: RDPR_TNPC	<illegal instruction>
	.word 0xbd510000  ! 1155: RDPR_TICK	<illegal instruction>
	.word 0xfe45c000  ! 1161: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf4546038  ! 1163: LDSH_I	ldsh	[%r17 + 0x0038], %r26
	.word 0xfb1dc000  ! 1169: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xb7520000  ! 1173: RDPR_PIL	<illegal instruction>
	.word 0xf85d0000  ! 1182: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf41d8000  ! 1183: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xf454e00b  ! 1184: LDSH_I	ldsh	[%r19 + 0x000b], %r26
	.word 0xbf540000  ! 1185: RDPR_GL	<illegal instruction>
	.word 0xfe544000  ! 1186: LDSH_R	ldsh	[%r17 + %r0], %r31
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72c3001  ! 1189: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xbb2cb001  ! 1193: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0xb014c000  ! 1194: OR_R	or 	%r19, %r0, %r24
	.word 0xf61d4000  ! 1197: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfd1cc000  ! 1199: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xbb7ce401  ! 1201: MOVR_I	movre	%r19, 0x1, %r29
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0xb93c6001  ! 1206: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xf01c6183  ! 1209: LDD_I	ldd	[%r17 + 0x0183], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf51c2164  ! 1212: LDDF_I	ldd	[%r16, 0x0164], %f26
	.word 0xf84d4000  ! 1213: LDSB_R	ldsb	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0xfb1d8000  ! 1224: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0x8395a137  ! 1226: WRPR_TNPC_I	wrpr	%r22, 0x0137, %tnpc
	.word 0xfc142033  ! 1227: LDUH_I	lduh	[%r16 + 0x0033], %r30
	.word 0x85942012  ! 1228: WRPR_TSTATE_I	wrpr	%r16, 0x0012, %tstate
	.word 0x91952182  ! 1229: WRPR_PIL_I	wrpr	%r20, 0x0182, %pil
	.word 0xf85da044  ! 1231: LDX_I	ldx	[%r22 + 0x0044], %r28
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40cc000  ! 1233: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb004203b  ! 1239: ADD_I	add 	%r16, 0x003b, %r24
	.word 0x8d956154  ! 1240: WRPR_PSTATE_I	wrpr	%r21, 0x0154, %pstate
	.word 0xbd540000  ! 1243: RDPR_GL	<illegal instruction>
	.word 0xf415e009  ! 1248: LDUH_I	lduh	[%r23 + 0x0009], %r26
	.word 0xb6c50000  ! 1249: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xf84420b9  ! 1252: LDSW_I	ldsw	[%r16 + 0x00b9], %r28
	.word 0x8394a02d  ! 1253: WRPR_TNPC_I	wrpr	%r18, 0x002d, %tnpc
	.word 0xb750c000  ! 1254: RDPR_TT	rdpr	%tt, %r27
	.word 0xfc5d4000  ! 1259: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0x899461c9  ! 1263: WRPR_TICK_I	wrpr	%r17, 0x01c9, %tick
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81c4000  ! 1277: LDD_R	ldd	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5540000  ! 1280: RDPR_GL	rdpr	%-, %r26
	.word 0xf65ca10b  ! 1283: LDX_I	ldx	[%r18 + 0x010b], %r27
	.word 0xfd1c8000  ! 1284: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xfa4cc000  ! 1287: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf615a059  ! 1288: LDUH_I	lduh	[%r22 + 0x0059], %r27
	.word 0xfe44c000  ! 1290: LDSW_R	ldsw	[%r19 + %r0], %r31
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc04c000  ! 1294: LDUW_R	lduw	[%r19 + %r0], %r30
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf655203d  ! 1296: LDSH_I	ldsh	[%r20 + 0x003d], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf654a008  ! 1303: LDSH_I	ldsh	[%r18 + 0x0008], %r27
	.word 0xbc24c000  ! 1304: SUB_R	sub 	%r19, %r0, %r30
	setx	data_start_6, %g1, %r22
	.word 0x8d94615e  ! 1308: WRPR_PSTATE_I	wrpr	%r17, 0x015e, %pstate
	.word 0xb3643801  ! 1310: MOVcc_I	<illegal instruction>
	.word 0xfe1da022  ! 1311: LDD_I	ldd	[%r22 + 0x0022], %r31
	.word 0xf445e1d8  ! 1312: LDSW_I	ldsw	[%r23 + 0x01d8], %r26
	.word 0xfe14c000  ! 1313: LDUH_R	lduh	[%r19 + %r0], %r31
	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2054000  ! 1316: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xb62c0000  ! 1317: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xb1508000  ! 1321: RDPR_TSTATE	<illegal instruction>
	.word 0xf614213e  ! 1322: LDUH_I	lduh	[%r16 + 0x013e], %r27
	setx	0x20310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a180  ! 1327: WRPR_TNPC_I	wrpr	%r22, 0x0180, %tnpc
	.word 0xb3480000  ! 1329: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfe5ca1a7  ! 1333: LDX_I	ldx	[%r18 + 0x01a7], %r31
	.word 0xbf3c3001  ! 1336: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xf644e10a  ! 1338: LDSW_I	ldsw	[%r19 + 0x010a], %r27
	.word 0x839461d7  ! 1340: WRPR_TNPC_I	wrpr	%r17, 0x01d7, %tnpc
	.word 0xb1510000  ! 1343: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 1345: RDPR_TL	<illegal instruction>
	.word 0xf0152071  ! 1347: LDUH_I	lduh	[%r20 + 0x0071], %r24
	.word 0xf51c2192  ! 1348: LDDF_I	ldd	[%r16, 0x0192], %f26
	.word 0xf65ce0c9  ! 1351: LDX_I	ldx	[%r19 + 0x00c9], %r27
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5dc000  ! 1356: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xbb500000  ! 1357: RDPR_TPC	<illegal instruction>
	.word 0xba344000  ! 1359: ORN_R	orn 	%r17, %r0, %r29
	.word 0xf44d8000  ! 1361: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xb824a0ca  ! 1362: SUB_I	sub 	%r18, 0x00ca, %r28
	setx	data_start_1, %g1, %r23
	.word 0xb7510000  ! 1367: RDPR_TICK	<illegal instruction>
	.word 0xb62c2066  ! 1369: ANDN_I	andn 	%r16, 0x0066, %r27
	.word 0xfb1d8000  ! 1373: LDDF_R	ldd	[%r22, %r0], %f29
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1378: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf854c000  ! 1383: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb3518000  ! 1384: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb150c000  ! 1385: RDPR_TT	<illegal instruction>
	.word 0xfc552101  ! 1386: LDSH_I	ldsh	[%r20 + 0x0101], %r30
	.word 0xbf508000  ! 1387: RDPR_TSTATE	<illegal instruction>
	.word 0xf05d2078  ! 1393: LDX_I	ldx	[%r20 + 0x0078], %r24
	.word 0x8194205b  ! 1399: WRPR_TPC_I	wrpr	%r16, 0x005b, %tpc
	.word 0xf00de1a6  ! 1400: LDUB_I	ldub	[%r23 + 0x01a6], %r24
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44521d3  ! 1402: LDSW_I	ldsw	[%r20 + 0x01d3], %r26
	.word 0x8794e09f  ! 1404: WRPR_TT_I	wrpr	%r19, 0x009f, %tt
	.word 0x899421f5  ! 1406: WRPR_TICK_I	wrpr	%r16, 0x01f5, %tick
	.word 0xff1c8000  ! 1407: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf2558000  ! 1408: LDSH_R	ldsh	[%r22 + %r0], %r25
	setx	data_start_4, %g1, %r16
	.word 0xb40ca00e  ! 1415: AND_I	and 	%r18, 0x000e, %r26
	.word 0xfc5d4000  ! 1417: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xb950c000  ! 1419: RDPR_TT	<illegal instruction>
	.word 0xf31ca1a9  ! 1421: LDDF_I	ldd	[%r18, 0x01a9], %f25
	.word 0xf21d205b  ! 1424: LDD_I	ldd	[%r20 + 0x005b], %r25
	.word 0x8195617a  ! 1425: WRPR_TPC_I	wrpr	%r21, 0x017a, %tpc
	mov	2, %r12
	.word 0x8f932000  ! 1427: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd504000  ! 1432: RDPR_TNPC	<illegal instruction>
	.word 0x8995a1a5  ! 1433: WRPR_TICK_I	wrpr	%r22, 0x01a5, %tick
	.word 0xff1c2152  ! 1434: LDDF_I	ldd	[%r16, 0x0152], %f31
	.word 0xb6a44000  ! 1436: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb5520000  ! 1439: RDPR_PIL	<illegal instruction>
	.word 0xbc1d608d  ! 1442: XOR_I	xor 	%r21, 0x008d, %r30
	.word 0xfa554000  ! 1446: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfa0dc000  ! 1447: LDUB_R	ldub	[%r23 + %r0], %r29
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d0000  ! 1453: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xb73d4000  ! 1456: SRA_R	sra 	%r21, %r0, %r27
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c0000  ! 1458: LDSB_R	ldsb	[%r16 + %r0], %r24
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91de044  ! 1461: LDDF_I	ldd	[%r23, 0x0044], %f28
	.word 0xfa45c000  ! 1465: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb33c8000  ! 1467: SRA_R	sra 	%r18, %r0, %r25
	setx	0x30105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44da1ed  ! 1473: LDSB_I	ldsb	[%r22 + 0x01ed], %r26
	.word 0xbd50c000  ! 1477: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	setx	data_start_6, %g1, %r16
	.word 0xbd50c000  ! 1488: RDPR_TT	rdpr	%tt, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb359000  ! 1492: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xf91d0000  ! 1493: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf91d60ba  ! 1494: LDDF_I	ldd	[%r21, 0x00ba], %f28
	.word 0xb63d2062  ! 1495: XNOR_I	xnor 	%r20, 0x0062, %r27
	.word 0xf00cc000  ! 1499: LDUB_R	ldub	[%r19 + %r0], %r24
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4520de  ! 1505: LDSW_I	ldsw	[%r20 + 0x00de], %r31
	.word 0xbc952092  ! 1506: ORcc_I	orcc 	%r20, 0x0092, %r30
	.word 0xfc4d8000  ! 1508: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xf45d4000  ! 1510: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xf71d4000  ! 1511: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xf2544000  ! 1513: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf4554000  ! 1518: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0x8394e17d  ! 1519: WRPR_TNPC_I	wrpr	%r19, 0x017d, %tnpc
	.word 0xbb500000  ! 1527: RDPR_TPC	<illegal instruction>
	.word 0xfc5da12d  ! 1529: LDX_I	ldx	[%r22 + 0x012d], %r30
	.word 0xb57c8400  ! 1530: MOVR_R	movre	%r18, %r0, %r26
	.word 0xf80c6138  ! 1533: LDUB_I	ldub	[%r17 + 0x0138], %r28
	.word 0xfd1d8000  ! 1534: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0x839461ba  ! 1539: WRPR_TNPC_I	wrpr	%r17, 0x01ba, %tnpc
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3c7001  ! 1543: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xbd518000  ! 1544: RDPR_PSTATE	<illegal instruction>
	.word 0xf2058000  ! 1546: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xbcbce01a  ! 1549: XNORcc_I	xnorcc 	%r19, 0x001a, %r30
	.word 0xf655e04f  ! 1550: LDSH_I	ldsh	[%r23 + 0x004f], %r27
	.word 0xfe55a077  ! 1554: LDSH_I	ldsh	[%r22 + 0x0077], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xfc54e1fd  ! 1560: LDSH_I	ldsh	[%r19 + 0x01fd], %r30
	.word 0x9194a1de  ! 1561: WRPR_PIL_I	wrpr	%r18, 0x01de, %pil
	.word 0xf40d20e9  ! 1562: LDUB_I	ldub	[%r20 + 0x00e9], %r26
	.word 0xfa0de0d6  ! 1564: LDUB_I	ldub	[%r23 + 0x00d6], %r29
	.word 0x8d94e0d3  ! 1572: WRPR_PSTATE_I	wrpr	%r19, 0x00d3, %pstate
	.word 0xbf510000  ! 1573: RDPR_TICK	<illegal instruction>
	.word 0x8994e0d1  ! 1574: WRPR_TICK_I	wrpr	%r19, 0x00d1, %tick
	.word 0xfe4c4000  ! 1576: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf64d0000  ! 1577: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xb2858000  ! 1581: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xf01c6026  ! 1584: LDD_I	ldd	[%r17 + 0x0026], %r24
	.word 0xf61da0ac  ! 1589: LDD_I	ldd	[%r22 + 0x00ac], %r27
	.word 0xbd540000  ! 1593: RDPR_GL	<illegal instruction>
	.word 0xf71c0000  ! 1594: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xb5508000  ! 1595: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a0c2  ! 1601: WRPR_TT_I	wrpr	%r22, 0x00c2, %tt
	.word 0xfc0d8000  ! 1603: LDUB_R	ldub	[%r22 + %r0], %r30
	setx	data_start_5, %g1, %r19
	.word 0xf655e1f6  ! 1608: LDSH_I	ldsh	[%r23 + 0x01f6], %r27
	.word 0x8795a1f7  ! 1610: WRPR_TT_I	wrpr	%r22, 0x01f7, %tt
	.word 0xf8544000  ! 1611: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xff1dc000  ! 1615: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xff1c6150  ! 1616: LDDF_I	ldd	[%r17, 0x0150], %f31
	.word 0xfe5d8000  ! 1623: LDX_R	ldx	[%r22 + %r0], %r31
	mov	2, %r14
	.word 0xa193a000  ! 1631: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa444000  ! 1632: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf20c6023  ! 1633: LDUB_I	ldub	[%r17 + 0x0023], %r25
	.word 0xf8440000  ! 1635: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xbb480000  ! 1636: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc44e1f8  ! 1639: LDSW_I	ldsw	[%r19 + 0x01f8], %r30
	.word 0xf645e0fc  ! 1640: LDSW_I	ldsw	[%r23 + 0x00fc], %r27
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839420cf  ! 1643: WRPR_TNPC_I	wrpr	%r16, 0x00cf, %tnpc
	.word 0xfa45212b  ! 1644: LDSW_I	ldsw	[%r20 + 0x012b], %r29
	.word 0xb4c4a134  ! 1646: ADDCcc_I	addccc 	%r18, 0x0134, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983f03  ! 1651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f03, %hpstate
	.word 0xf854e1d2  ! 1652: LDSH_I	ldsh	[%r19 + 0x01d2], %r28
	.word 0x8d94e12d  ! 1653: WRPR_PSTATE_I	wrpr	%r19, 0x012d, %pstate
	.word 0xb605a044  ! 1655: ADD_I	add 	%r22, 0x0044, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8995a0c9  ! 1664: WRPR_TICK_I	wrpr	%r22, 0x00c9, %tick
	.word 0xb28da023  ! 1666: ANDcc_I	andcc 	%r22, 0x0023, %r25
	.word 0xb7500000  ! 1667: RDPR_TPC	<illegal instruction>
	.word 0xf11d4000  ! 1669: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf91d8000  ! 1670: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xb6950000  ! 1671: ORcc_R	orcc 	%r20, %r0, %r27
	.word 0xb2158000  ! 1672: OR_R	or 	%r22, %r0, %r25
	.word 0xf85c0000  ! 1673: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0x83942035  ! 1676: WRPR_TNPC_I	wrpr	%r16, 0x0035, %tnpc
	.word 0xff1c8000  ! 1679: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xfa4c614b  ! 1683: LDSB_I	ldsb	[%r17 + 0x014b], %r29
	.word 0xb7510000  ! 1686: RDPR_TICK	<illegal instruction>
	.word 0xfe1d6164  ! 1689: LDD_I	ldd	[%r21 + 0x0164], %r31
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64c8000  ! 1691: LDSB_R	ldsb	[%r18 + %r0], %r27
	mov	2, %r12
	.word 0x8f932000  ! 1692: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf84d0000  ! 1694: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb7480000  ! 1698: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf8540000  ! 1701: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xb60d4000  ! 1705: AND_R	and 	%r21, %r0, %r27
	.word 0xf0552146  ! 1706: LDSH_I	ldsh	[%r20 + 0x0146], %r24
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5508000  ! 1713: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xf455a1ef  ! 1715: LDSH_I	ldsh	[%r22 + 0x01ef], %r26
	.word 0xb4b54000  ! 1716: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xf415a155  ! 1719: LDUH_I	lduh	[%r22 + 0x0155], %r26
	.word 0xfc040000  ! 1721: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0x8795e19e  ! 1722: WRPR_TT_I	wrpr	%r23, 0x019e, %tt
	.word 0xf61c2195  ! 1726: LDD_I	ldd	[%r16 + 0x0195], %r27
	.word 0xfe45a0ac  ! 1730: LDSW_I	ldsw	[%r22 + 0x00ac], %r31
	.word 0xf804c000  ! 1732: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xf61de005  ! 1733: LDD_I	ldd	[%r23 + 0x0005], %r27
	.word 0xbc45203d  ! 1739: ADDC_I	addc 	%r20, 0x003d, %r30
	setx	data_start_5, %g1, %r23
	.word 0xb3518000  ! 1744: RDPR_PSTATE	<illegal instruction>
	.word 0xb02ca11a  ! 1746: ANDN_I	andn 	%r18, 0x011a, %r24
	.word 0xfc14c000  ! 1747: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf05c4000  ! 1749: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf85c8000  ! 1750: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf04c617e  ! 1751: LDSB_I	ldsb	[%r17 + 0x017e], %r24
	.word 0xb20421de  ! 1752: ADD_I	add 	%r16, 0x01de, %r25
	.word 0xfe044000  ! 1754: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf31da04d  ! 1756: LDDF_I	ldd	[%r22, 0x004d], %f25
	.word 0xb63520ac  ! 1757: ORN_I	orn 	%r20, 0x00ac, %r27
	.word 0xb3518000  ! 1758: RDPR_PSTATE	<illegal instruction>
	setx	0x20300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba3ce104  ! 1761: XNOR_I	xnor 	%r19, 0x0104, %r29
	.word 0xfc1c8000  ! 1762: LDD_R	ldd	[%r18 + %r0], %r30
	.word 0xbf518000  ! 1766: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 1767: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd50c000  ! 1771: RDPR_TT	<illegal instruction>
	.word 0xfc044000  ! 1779: LDUW_R	lduw	[%r17 + %r0], %r30
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 1787: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf0144000  ! 1789: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf00dc000  ! 1790: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xfc55a178  ! 1798: LDSH_I	ldsh	[%r22 + 0x0178], %r30
	.word 0xfa1d4000  ! 1800: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xf80cc000  ! 1803: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0x839561a3  ! 1805: WRPR_TNPC_I	wrpr	%r21, 0x01a3, %tnpc
	.word 0xfa4d21b3  ! 1815: LDSB_I	ldsb	[%r20 + 0x01b3], %r29
	setx	0x10335, %g1, %o0
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
	.word 0xf815600d  ! 1819: LDUH_I	lduh	[%r21 + 0x000d], %r28
	.word 0xfa156024  ! 1821: LDUH_I	lduh	[%r21 + 0x0024], %r29
	.word 0xf204c000  ! 1824: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xbf518000  ! 1826: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf405a09b  ! 1827: LDUW_I	lduw	[%r22 + 0x009b], %r26
	.word 0xf8448000  ! 1828: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfc5d8000  ! 1829: LDX_R	ldx	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0x899460de  ! 1834: WRPR_TICK_I	wrpr	%r17, 0x00de, %tick
	.word 0xf00c614e  ! 1838: LDUB_I	ldub	[%r17 + 0x014e], %r24
	.word 0xf80cc000  ! 1840: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xfc55608d  ! 1841: LDSH_I	ldsh	[%r21 + 0x008d], %r30
	.word 0xb2a50000  ! 1847: SUBcc_R	subcc 	%r20, %r0, %r25
	.word 0xf81d4000  ! 1848: LDD_R	ldd	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983d01  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d01, %hpstate
	.word 0xfe0d20af  ! 1850: LDUB_I	ldub	[%r20 + 0x00af], %r31
	.word 0xb3340000  ! 1853: SRL_R	srl 	%r16, %r0, %r25
	.word 0xfa14e0ef  ! 1855: LDUH_I	lduh	[%r19 + 0x00ef], %r29
	.word 0xfd1ca0a2  ! 1856: LDDF_I	ldd	[%r18, 0x00a2], %f30
	.word 0xf24da1ac  ! 1861: LDSB_I	ldsb	[%r22 + 0x01ac], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf64de052  ! 1870: LDSB_I	ldsb	[%r23 + 0x0052], %r27
	.word 0xb244201c  ! 1871: ADDC_I	addc 	%r16, 0x001c, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982fc3  ! 1872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0x8595e14f  ! 1873: WRPR_TSTATE_I	wrpr	%r23, 0x014f, %tstate
	.word 0xf61ce18d  ! 1875: LDD_I	ldd	[%r19 + 0x018d], %r27
	.word 0xf44c8000  ! 1877: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0x8994e18a  ! 1878: WRPR_TICK_I	wrpr	%r19, 0x018a, %tick
	.word 0xb3510000  ! 1879: RDPR_TICK	<illegal instruction>
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d0000  ! 1882: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xbb510000  ! 1883: RDPR_TICK	<illegal instruction>
	.word 0xfd1d0000  ! 1884: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xb4c48000  ! 1885: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xf604617e  ! 1890: LDUW_I	lduw	[%r17 + 0x017e], %r27
	.word 0x8594a0e5  ! 1891: WRPR_TSTATE_I	wrpr	%r18, 0x00e5, %tstate
	.word 0xf71cc000  ! 1897: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xbb50c000  ! 1901: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0x8794e044  ! 1903: WRPR_TT_I	wrpr	%r19, 0x0044, %tt
	.word 0xbaac61d3  ! 1904: ANDNcc_I	andncc 	%r17, 0x01d3, %r29
	.word 0xb5518000  ! 1908: RDPR_PSTATE	<illegal instruction>
	.word 0xf8548000  ! 1909: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf844e18b  ! 1911: LDSW_I	ldsw	[%r19 + 0x018b], %r28
	.word 0x8394e110  ! 1914: WRPR_TNPC_I	wrpr	%r19, 0x0110, %tnpc
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995613a  ! 1922: WRPR_TICK_I	wrpr	%r21, 0x013a, %tick
	.word 0xf65ce001  ! 1926: LDX_I	ldx	[%r19 + 0x0001], %r27
	.word 0xfc140000  ! 1927: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf2156161  ! 1928: LDUH_I	lduh	[%r21 + 0x0161], %r25
	setx	data_start_5, %g1, %r20
	.word 0xbb520000  ! 1934: RDPR_PIL	<illegal instruction>
	.word 0xf11de1ff  ! 1940: LDDF_I	ldd	[%r23, 0x01ff], %f24
	.word 0xf71d208f  ! 1941: LDDF_I	ldd	[%r20, 0x008f], %f27
	.word 0xfa44a047  ! 1942: LDSW_I	ldsw	[%r18 + 0x0047], %r29
	.word 0x8595210d  ! 1944: WRPR_TSTATE_I	wrpr	%r20, 0x010d, %tstate
	.word 0xb5352001  ! 1946: SRL_I	srl 	%r20, 0x0001, %r26
	setx	data_start_5, %g1, %r21
	.word 0xb32c5000  ! 1951: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xfe0d616d  ! 1953: LDUB_I	ldub	[%r21 + 0x016d], %r31
	.word 0x9195608e  ! 1954: WRPR_PIL_I	wrpr	%r21, 0x008e, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982f49  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f49, %hpstate
	.word 0xfa458000  ! 1961: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf81520d0  ! 1962: LDUH_I	lduh	[%r20 + 0x00d0], %r28
	.word 0xbf500000  ! 1964: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf21d6085  ! 1967: LDD_I	ldd	[%r21 + 0x0085], %r25
	.word 0x87946002  ! 1969: WRPR_TT_I	wrpr	%r17, 0x0002, %tt
	.word 0xf81c0000  ! 1973: LDD_R	ldd	[%r16 + %r0], %r28
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 1975: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf20c8000  ! 1976: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0x8995a050  ! 1977: WRPR_TICK_I	wrpr	%r22, 0x0050, %tick
	.word 0xb3508000  ! 1981: RDPR_TSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 1982: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa05c000  ! 1985: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0x879520bd  ! 1986: WRPR_TT_I	wrpr	%r20, 0x00bd, %tt
	.word 0x8795613e  ! 1987: WRPR_TT_I	wrpr	%r21, 0x013e, %tt
	.word 0xf60dc000  ! 1989: LDUB_R	ldub	[%r23 + %r0], %r27
	setx	data_start_3, %g1, %r19
	.word 0xf40d4000  ! 1993: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf6454000  ! 1994: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb60dc000  ! 1996: AND_R	and 	%r23, %r0, %r27
	.word 0xbe0d21bf  ! 1997: AND_I	and 	%r20, 0x01bf, %r31
	.word 0xf65ca15a  ! 1998: LDX_I	ldx	[%r18 + 0x015a], %r27
	.word 0xbcc50000  ! 1999: ADDCcc_R	addccc 	%r20, %r0, %r30
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb28d202a  ! 2006: ANDcc_I	andcc 	%r20, 0x002a, %r25
	.word 0xf4450000  ! 2007: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf51d2032  ! 2008: LDDF_I	ldd	[%r20, 0x0032], %f26
	setx	data_start_1, %g1, %r21
	.word 0xfe148000  ! 2013: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xfa050000  ! 2015: LDUW_R	lduw	[%r20 + %r0], %r29
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe34e147  ! 2017: SUBC_I	orn 	%r19, 0x0147, %r31
	.word 0x8594a156  ! 2020: WRPR_TSTATE_I	wrpr	%r18, 0x0156, %tstate
	.word 0xb0b56197  ! 2021: ORNcc_I	orncc 	%r21, 0x0197, %r24
	.word 0xb0844000  ! 2035: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0xf004204a  ! 2038: LDUW_I	lduw	[%r16 + 0x004a], %r24
	.word 0xf84d4000  ! 2039: LDSB_R	ldsb	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5cc000  ! 2041: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xb135c000  ! 2043: SRL_R	srl 	%r23, %r0, %r24
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01421da  ! 2048: LDUH_I	lduh	[%r16 + 0x01da], %r24
	.word 0xf00cc000  ! 2052: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xbd51c000  ! 2056: RDPR_TL	<illegal instruction>
	.word 0xfc0c4000  ! 2057: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xb1520000  ! 2060: RDPR_PIL	<illegal instruction>
	.word 0x8994602d  ! 2062: WRPR_TICK_I	wrpr	%r17, 0x002d, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983bc1  ! 2063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc1, %hpstate
	.word 0xb1518000  ! 2064: RDPR_PSTATE	<illegal instruction>
	.word 0xf81521ee  ! 2065: LDUH_I	lduh	[%r20 + 0x01ee], %r28
	.word 0xf6142116  ! 2068: LDUH_I	lduh	[%r16 + 0x0116], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982bcb  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcb, %hpstate
	setx	0x10234, %g1, %o0
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
	mov	1, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf20dc000  ! 2084: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xf64ce0a3  ! 2085: LDSB_I	ldsb	[%r19 + 0x00a3], %r27
	.word 0xb73dc000  ! 2086: SRA_R	sra 	%r23, %r0, %r27
	.word 0xf71d0000  ! 2088: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xfc14c000  ! 2090: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xb151c000  ! 2092: RDPR_TL	<illegal instruction>
	.word 0xf0158000  ! 2096: LDUH_R	lduh	[%r22 + %r0], %r24
	mov	0, %r14
	.word 0xa193a000  ! 2101: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa55c000  ! 2106: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf71ca177  ! 2107: LDDF_I	ldd	[%r18, 0x0177], %f27
	.word 0xf645e1c1  ! 2108: LDSW_I	ldsw	[%r23 + 0x01c1], %r27
	.word 0xf8054000  ! 2110: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xfc5ca1b6  ! 2113: LDX_I	ldx	[%r18 + 0x01b6], %r30
	.word 0xf11c8000  ! 2114: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xb235a047  ! 2118: ORN_I	orn 	%r22, 0x0047, %r25
	.word 0x83952082  ! 2121: WRPR_TNPC_I	wrpr	%r20, 0x0082, %tnpc
	.word 0xfc15c000  ! 2124: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xfe548000  ! 2125: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf85cc000  ! 2130: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xbb508000  ! 2131: RDPR_TSTATE	<illegal instruction>
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 2134: RDPR_TL	<illegal instruction>
	.word 0xf605a10c  ! 2135: LDUW_I	lduw	[%r22 + 0x010c], %r27
	.word 0xf005e0b0  ! 2137: LDUW_I	lduw	[%r23 + 0x00b0], %r24
	.word 0xf65d60f7  ! 2140: LDX_I	ldx	[%r21 + 0x00f7], %r27
	.word 0xf01dc000  ! 2141: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0x8394a1cb  ! 2142: WRPR_TNPC_I	wrpr	%r18, 0x01cb, %tnpc
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0a5a0ac  ! 2145: SUBcc_I	subcc 	%r22, 0x00ac, %r24
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 2147: MOVcc_I	<illegal instruction>
	.word 0xb0840000  ! 2148: ADDcc_R	addcc 	%r16, %r0, %r24
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01d4000  ! 2154: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xb9480000  ! 2155: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf64c6017  ! 2157: LDSB_I	ldsb	[%r17 + 0x0017], %r27
	.word 0xf40c2166  ! 2160: LDUB_I	ldub	[%r16 + 0x0166], %r26
	.word 0xf21c4000  ! 2161: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xbf510000  ! 2166: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7508000  ! 2170: RDPR_TSTATE	<illegal instruction>
	.word 0xf05c0000  ! 2172: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xbf504000  ! 2173: RDPR_TNPC	<illegal instruction>
	.word 0xf0546047  ! 2181: LDSH_I	ldsh	[%r17 + 0x0047], %r24
	.word 0xfe1de187  ! 2185: LDD_I	ldd	[%r23 + 0x0187], %r31
	.word 0xb605e007  ! 2186: ADD_I	add 	%r23, 0x0007, %r27
	.word 0xfa5d6021  ! 2189: LDX_I	ldx	[%r21 + 0x0021], %r29
	.word 0xfe458000  ! 2191: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xfe55e158  ! 2194: LDSH_I	ldsh	[%r23 + 0x0158], %r31
	.word 0x819460aa  ! 2198: WRPR_TPC_I	wrpr	%r17, 0x00aa, %tpc
	.word 0xf6050000  ! 2199: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xf20da055  ! 2202: LDUB_I	ldub	[%r22 + 0x0055], %r25
	.word 0xbf500000  ! 2206: RDPR_TPC	<illegal instruction>
	.word 0xf6552034  ! 2209: LDSH_I	ldsh	[%r20 + 0x0034], %r27
	.word 0xb13cd000  ! 2211: SRAX_R	srax	%r19, %r0, %r24
	.word 0xfe0d0000  ! 2215: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0x8d956079  ! 2216: WRPR_PSTATE_I	wrpr	%r21, 0x0079, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x8198288b  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088b, %hpstate
	.word 0xbf520000  ! 2221: RDPR_PIL	<illegal instruction>
	.word 0xb1504000  ! 2223: RDPR_TNPC	<illegal instruction>
	.word 0xf80c8000  ! 2224: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xbb504000  ! 2228: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 2229: RDPR_TL	<illegal instruction>
	.word 0xf0156039  ! 2232: LDUH_I	lduh	[%r21 + 0x0039], %r24
	.word 0xf2146026  ! 2233: LDUH_I	lduh	[%r17 + 0x0026], %r25
	.word 0xb08ce1a4  ! 2240: ANDcc_I	andcc 	%r19, 0x01a4, %r24
	.word 0xb0154000  ! 2242: OR_R	or 	%r21, %r0, %r24
	mov	1, %r12
	.word 0x8f932000  ! 2244: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xff1d8000  ! 2248: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xba35a12c  ! 2249: ORN_I	orn 	%r22, 0x012c, %r29
	.word 0xbf518000  ! 2252: RDPR_PSTATE	<illegal instruction>
	.word 0xf4450000  ! 2255: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0x8395217b  ! 2258: WRPR_TNPC_I	wrpr	%r20, 0x017b, %tnpc
	.word 0x83956158  ! 2259: WRPR_TNPC_I	wrpr	%r21, 0x0158, %tnpc
	.word 0x9195a07d  ! 2262: WRPR_PIL_I	wrpr	%r22, 0x007d, %pil
	.word 0xfc540000  ! 2265: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xbf2de001  ! 2269: SLL_I	sll 	%r23, 0x0001, %r31
	.word 0x839520ed  ! 2271: WRPR_TNPC_I	wrpr	%r20, 0x00ed, %tnpc
	setx	data_start_0, %g1, %r22
	setx	data_start_2, %g1, %r20
	.word 0xf245c000  ! 2275: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb3343001  ! 2278: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xf71ca01a  ! 2283: LDDF_I	ldd	[%r18, 0x001a], %f27
	.word 0xf655e1e8  ! 2285: LDSH_I	ldsh	[%r23 + 0x01e8], %r27
	.word 0x859521c7  ! 2286: WRPR_TSTATE_I	wrpr	%r20, 0x01c7, %tstate
	.word 0xf815610e  ! 2289: LDUH_I	lduh	[%r21 + 0x010e], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b51  ! 2291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xf445c000  ! 2292: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xba25c000  ! 2295: SUB_R	sub 	%r23, %r0, %r29
	.word 0xb1500000  ! 2296: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf60d0000  ! 2301: LDUB_R	ldub	[%r20 + %r0], %r27
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 2305: RDPR_TSTATE	<illegal instruction>
	.word 0xb13c4000  ! 2307: SRA_R	sra 	%r17, %r0, %r24
	.word 0xfe1ca127  ! 2311: LDD_I	ldd	[%r18 + 0x0127], %r31
	.word 0xfe55e0ae  ! 2313: LDSH_I	ldsh	[%r23 + 0x00ae], %r31
	.word 0xfd1c604a  ! 2314: LDDF_I	ldd	[%r17, 0x004a], %f30
	.word 0xb8b521f2  ! 2317: ORNcc_I	orncc 	%r20, 0x01f2, %r28
	.word 0xf014210b  ! 2318: LDUH_I	lduh	[%r16 + 0x010b], %r24
	.word 0xfb1ce168  ! 2323: LDDF_I	ldd	[%r19, 0x0168], %f29
	setx	data_start_7, %g1, %r21
	.word 0xf60c2006  ! 2329: LDUB_I	ldub	[%r16 + 0x0006], %r27
	.word 0xb8b5e066  ! 2330: SUBCcc_I	orncc 	%r23, 0x0066, %r28
	.word 0xf45de1cd  ! 2331: LDX_I	ldx	[%r23 + 0x01cd], %r26
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60460e1  ! 2341: LDUW_I	lduw	[%r17 + 0x00e1], %r27
	.word 0xf605e159  ! 2343: LDUW_I	lduw	[%r23 + 0x0159], %r27
	.word 0xf24d20a9  ! 2347: LDSB_I	ldsb	[%r20 + 0x00a9], %r25
	mov	0, %r12
	.word 0x8f932000  ! 2348: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf444c000  ! 2349: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xb9540000  ! 2350: RDPR_GL	<illegal instruction>
	.word 0xbf518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf615c000  ! 2358: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf05d20d9  ! 2365: LDX_I	ldx	[%r20 + 0x00d9], %r24
	.word 0xf25d0000  ! 2366: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf71d4000  ! 2369: LDDF_R	ldd	[%r21, %r0], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982c9b  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9b, %hpstate
	.word 0xb824a0b4  ! 2372: SUB_I	sub 	%r18, 0x00b4, %r28
	.word 0xb92d0000  ! 2374: SLL_R	sll 	%r20, %r0, %r28
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e155  ! 2377: WRPR_TSTATE_I	wrpr	%r19, 0x0155, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 2384: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf6450000  ! 2389: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xb3353001  ! 2393: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xbf510000  ! 2394: RDPR_TICK	<illegal instruction>
	.word 0xf0440000  ! 2397: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf04c615a  ! 2399: LDSB_I	ldsb	[%r17 + 0x015a], %r24
	setx	0x1021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d0000  ! 2406: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xf91cc000  ! 2407: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xfa144000  ! 2411: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb9641800  ! 2413: MOVcc_R	<illegal instruction>
	.word 0xb8b48000  ! 2415: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xf8046081  ! 2417: LDUW_I	lduw	[%r17 + 0x0081], %r28
	.word 0xfe1c4000  ! 2419: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xbf2c1000  ! 2422: SLLX_R	sllx	%r16, %r0, %r31
	.word 0xfa458000  ! 2423: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xb1510000  ! 2434: RDPR_TICK	<illegal instruction>
	.word 0xb9518000  ! 2438: RDPR_PSTATE	<illegal instruction>
	.word 0xfe5ca1bf  ! 2439: LDX_I	ldx	[%r18 + 0x01bf], %r31
	.word 0xbd518000  ! 2442: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r19
	.word 0xf41d0000  ! 2448: LDD_R	ldd	[%r20 + %r0], %r26
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d8000  ! 2450: LDSB_R	ldsb	[%r22 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe4d2055  ! 2453: LDSB_I	ldsb	[%r20 + 0x0055], %r31
	.word 0xb7518000  ! 2458: RDPR_PSTATE	<illegal instruction>
	.word 0xb1504000  ! 2459: RDPR_TNPC	<illegal instruction>
	.word 0xf04c4000  ! 2463: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0x9194a0f8  ! 2467: WRPR_PIL_I	wrpr	%r18, 0x00f8, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r18
	.word 0xf61dc000  ! 2471: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xfa54c000  ! 2474: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xf71c0000  ! 2475: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xb1520000  ! 2476: RDPR_PIL	<illegal instruction>
	.word 0xf11d4000  ! 2481: LDDF_R	ldd	[%r21, %r0], %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x110, %g1, %o0
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
	.word 0xf40de1e5  ! 2494: LDUB_I	ldub	[%r23 + 0x01e5], %r26
	.word 0xb1520000  ! 2495: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983cc9  ! 2497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc9, %hpstate
	.word 0xfc4dc000  ! 2501: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xf814206e  ! 2506: LDUH_I	lduh	[%r16 + 0x006e], %r28
	.word 0xfc4dc000  ! 2507: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfe04c000  ! 2509: LDUW_R	lduw	[%r19 + %r0], %r31
	mov	0, %r14
	.word 0xa193a000  ! 2510: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc5c8000  ! 2513: LDX_R	ldx	[%r18 + %r0], %r30
	mov	0, %r14
	.word 0xa193a000  ! 2514: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb950c000  ! 2523: RDPR_TT	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2524: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf05c0000  ! 2527: LDX_R	ldx	[%r16 + %r0], %r24
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2532: RDPR_TPC	<illegal instruction>
	.word 0xf21c4000  ! 2536: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xfe14e180  ! 2537: LDUH_I	lduh	[%r19 + 0x0180], %r31
	.word 0xfe0d0000  ! 2538: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xfa140000  ! 2539: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xb7480000  ! 2540: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfe056182  ! 2544: LDUW_I	lduw	[%r21 + 0x0182], %r31
	.word 0xf60421a0  ! 2547: LDUW_I	lduw	[%r16 + 0x01a0], %r27
	.word 0xb72c2001  ! 2550: SLL_I	sll 	%r16, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 2551: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf04ca114  ! 2554: LDSB_I	ldsb	[%r18 + 0x0114], %r24
	.word 0xb5480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	1, %r12
	.word 0x8f932000  ! 2560: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf814e0fe  ! 2562: LDUH_I	lduh	[%r19 + 0x00fe], %r28
	.word 0xbc9c0000  ! 2564: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xf11de1fd  ! 2570: LDDF_I	ldd	[%r23, 0x01fd], %f24
	.word 0xb835a07e  ! 2571: SUBC_I	orn 	%r22, 0x007e, %r28
	.word 0xf64d206b  ! 2573: LDSB_I	ldsb	[%r20 + 0x006b], %r27
	.word 0xf8550000  ! 2574: LDSH_R	ldsh	[%r20 + %r0], %r28
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 2578: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf004c000  ! 2580: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf245e18e  ! 2582: LDSW_I	ldsw	[%r23 + 0x018e], %r25
	.word 0xbeada07e  ! 2583: ANDNcc_I	andncc 	%r22, 0x007e, %r31
	.word 0x8595a0c4  ! 2590: WRPR_TSTATE_I	wrpr	%r22, 0x00c4, %tstate
	.word 0xb1518000  ! 2591: RDPR_PSTATE	<illegal instruction>
	.word 0xf4440000  ! 2594: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfa14e0d3  ! 2595: LDUH_I	lduh	[%r19 + 0x00d3], %r29
	.word 0xf454c000  ! 2596: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xfe048000  ! 2601: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0x8995a1ae  ! 2603: WRPR_TICK_I	wrpr	%r22, 0x01ae, %tick
	.word 0xf815e11d  ! 2608: LDUH_I	lduh	[%r23 + 0x011d], %r28
	.word 0xf24d8000  ! 2610: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xbb7d0400  ! 2617: MOVR_R	movre	%r20, %r0, %r29
	.word 0xf6150000  ! 2618: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf01d4000  ! 2619: LDD_R	ldd	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb495c000  ! 2625: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xf05460c4  ! 2626: LDSH_I	ldsh	[%r17 + 0x00c4], %r24
	mov	1, %r12
	.word 0x8f932000  ! 2627: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4454000  ! 2628: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xb7641800  ! 2629: MOVcc_R	<illegal instruction>
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8550000  ! 2632: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf61d6103  ! 2634: LDD_I	ldd	[%r21 + 0x0103], %r27
	.word 0xfe1ce0bd  ! 2635: LDD_I	ldd	[%r19 + 0x00bd], %r31
	.word 0xfe0c6043  ! 2640: LDUB_I	ldub	[%r17 + 0x0043], %r31
	setx	0x10304, %g1, %o0
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
	.word 0xf71d8000  ! 2645: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0x8395e04b  ! 2649: WRPR_TNPC_I	wrpr	%r23, 0x004b, %tnpc
	.word 0xb035c000  ! 2651: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xf21ca16c  ! 2652: LDD_I	ldd	[%r18 + 0x016c], %r25
	.word 0xf0154000  ! 2653: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xf4146042  ! 2654: LDUH_I	lduh	[%r17 + 0x0042], %r26
	.word 0xff1c0000  ! 2658: LDDF_R	ldd	[%r16, %r0], %f31
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 2662: RDPR_TL	<illegal instruction>
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2669: RDPR_GL	<illegal instruction>
	.word 0xfc15a08d  ! 2677: LDUH_I	lduh	[%r22 + 0x008d], %r30
	.word 0xff1c4000  ! 2682: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf61421cd  ! 2683: LDUH_I	lduh	[%r16 + 0x01cd], %r27
	.word 0xba84a171  ! 2684: ADDcc_I	addcc 	%r18, 0x0171, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0c8000  ! 2687: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xf4540000  ! 2689: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xfb1c0000  ! 2694: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xbf518000  ! 2697: RDPR_PSTATE	<illegal instruction>
	setx	0x1030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454a09c  ! 2703: LDSH_I	ldsh	[%r18 + 0x009c], %r26
	.word 0xf40ce016  ! 2704: LDUB_I	ldub	[%r19 + 0x0016], %r26
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4d2156  ! 2707: LDSB_I	ldsb	[%r20 + 0x0156], %r30
	.word 0xbe84a006  ! 2708: ADDcc_I	addcc 	%r18, 0x0006, %r31
	.word 0xfc0de03f  ! 2709: LDUB_I	ldub	[%r23 + 0x003f], %r30
	setx	data_start_4, %g1, %r19
	.word 0xf414c000  ! 2717: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xbc1c6121  ! 2718: XOR_I	xor 	%r17, 0x0121, %r30
	.word 0xf255a066  ! 2722: LDSH_I	ldsh	[%r22 + 0x0066], %r25
	.word 0xf00c8000  ! 2725: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0x919561ee  ! 2726: WRPR_PIL_I	wrpr	%r21, 0x01ee, %pil
	.word 0xf855a19d  ! 2728: LDSH_I	ldsh	[%r22 + 0x019d], %r28
	.word 0xf80d217b  ! 2729: LDUB_I	ldub	[%r20 + 0x017b], %r28
	.word 0xf6140000  ! 2730: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf71d8000  ! 2733: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xbe14a180  ! 2734: OR_I	or 	%r18, 0x0180, %r31
	.word 0xf25ca17b  ! 2737: LDX_I	ldx	[%r18 + 0x017b], %r25
	.word 0xbd3c6001  ! 2738: SRA_I	sra 	%r17, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 2739: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8450000  ! 2740: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xb2ac8000  ! 2741: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xfc15609c  ! 2744: LDUH_I	lduh	[%r21 + 0x009c], %r30
	setx	0x10218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2747: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a116  ! 2750: WRPR_TNPC_I	wrpr	%r22, 0x0116, %tnpc
	.word 0xf20c2100  ! 2751: LDUB_I	ldub	[%r16 + 0x0100], %r25
	.word 0xb350c000  ! 2752: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 2754: RDPR_TNPC	<illegal instruction>
	.word 0x8795a110  ! 2760: WRPR_TT_I	wrpr	%r22, 0x0110, %tt
	setx	data_start_6, %g1, %r16
	.word 0xf055e175  ! 2763: LDSH_I	ldsh	[%r23 + 0x0175], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983943  ! 2767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1943, %hpstate
	.word 0xfb1d8000  ! 2770: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xbb50c000  ! 2772: RDPR_TT	<illegal instruction>
	.word 0xf414c000  ! 2773: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xb7500000  ! 2774: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xfc55a1b1  ! 2778: LDSH_I	ldsh	[%r22 + 0x01b1], %r30
	.word 0xfc0ce161  ! 2781: LDUB_I	ldub	[%r19 + 0x0161], %r30
	.word 0xbd508000  ! 2784: RDPR_TSTATE	<illegal instruction>
	.word 0xf05da02e  ! 2785: LDX_I	ldx	[%r22 + 0x002e], %r24
	.word 0xfa044000  ! 2788: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf604a09b  ! 2789: LDUW_I	lduw	[%r18 + 0x009b], %r27
	.word 0xf205a0a3  ! 2791: LDUW_I	lduw	[%r22 + 0x00a3], %r25
	.word 0xb884c000  ! 2793: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb1359000  ! 2795: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf91d0000  ! 2796: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf255600e  ! 2799: LDSH_I	ldsh	[%r21 + 0x000e], %r25
	.word 0xbd34c000  ! 2801: SRL_R	srl 	%r19, %r0, %r30
	.word 0x8594e1f0  ! 2804: WRPR_TSTATE_I	wrpr	%r19, 0x01f0, %tstate
	.word 0xfe1c8000  ! 2807: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf41c8000  ! 2808: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xf644c000  ! 2809: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf6050000  ! 2810: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xbd518000  ! 2812: RDPR_PSTATE	<illegal instruction>
	.word 0xf814e0ac  ! 2813: LDUH_I	lduh	[%r19 + 0x00ac], %r28
	.word 0xf055c000  ! 2814: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xb750c000  ! 2815: RDPR_TT	<illegal instruction>
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca5c000  ! 2818: SUBcc_R	subcc 	%r23, %r0, %r30
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b5b  ! 2821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5b, %hpstate
	setx	0x20103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	mov	2, %r14
	.word 0xa193a000  ! 2829: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc15a15e  ! 2831: LDUH_I	lduh	[%r22 + 0x015e], %r30
	.word 0xf6544000  ! 2835: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xfe0d2052  ! 2836: LDUB_I	ldub	[%r20 + 0x0052], %r31
	.word 0xfe4d8000  ! 2838: LDSB_R	ldsb	[%r22 + %r0], %r31
	setx	data_start_1, %g1, %r22
	.word 0xbf480000  ! 2844: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf04ce15b  ! 2853: LDSB_I	ldsb	[%r19 + 0x015b], %r24
	.word 0xfe0de0eb  ! 2854: LDUB_I	ldub	[%r23 + 0x00eb], %r31
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2857: RDPR_TL	<illegal instruction>
	.word 0xf65ca118  ! 2864: LDX_I	ldx	[%r18 + 0x0118], %r27
	.word 0xf61521b5  ! 2865: LDUH_I	lduh	[%r20 + 0x01b5], %r27
	.word 0xfe45600b  ! 2868: LDSW_I	ldsw	[%r21 + 0x000b], %r31
	.word 0xfa04e1af  ! 2869: LDUW_I	lduw	[%r19 + 0x01af], %r29
	.word 0x8794a121  ! 2872: WRPR_TT_I	wrpr	%r18, 0x0121, %tt
	setx	data_start_2, %g1, %r22
	.word 0xf244e134  ! 2876: LDSW_I	ldsw	[%r19 + 0x0134], %r25
	.word 0xf814e0c8  ! 2877: LDUH_I	lduh	[%r19 + 0x00c8], %r28
	.word 0xbf2d1000  ! 2878: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xf01da1d7  ! 2879: LDD_I	ldd	[%r22 + 0x01d7], %r24
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64421f9  ! 2882: LDSW_I	ldsw	[%r16 + 0x01f9], %r27
	mov	2, %r14
	.word 0xa193a000  ! 2883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8994603c  ! 2885: WRPR_TICK_I	wrpr	%r17, 0x003c, %tick
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ac0000  ! 2887: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xfc54e14b  ! 2891: LDSH_I	ldsh	[%r19 + 0x014b], %r30
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 2898: MOVcc_I	<illegal instruction>
	.word 0xf80da0c1  ! 2899: LDUB_I	ldub	[%r22 + 0x00c1], %r28
	.word 0xf4046036  ! 2902: LDUW_I	lduw	[%r17 + 0x0036], %r26
	.word 0xf51d8000  ! 2906: LDDF_R	ldd	[%r22, %r0], %f26
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2909: RDPR_GL	rdpr	%-, %r31
	.word 0x8394a16b  ! 2911: WRPR_TNPC_I	wrpr	%r18, 0x016b, %tnpc
	.word 0xf40c60d8  ! 2912: LDUB_I	ldub	[%r17 + 0x00d8], %r26
	.word 0xfe144000  ! 2916: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0x899420ed  ! 2919: WRPR_TICK_I	wrpr	%r16, 0x00ed, %tick
	.word 0xfd1c8000  ! 2927: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xfe5d2178  ! 2930: LDX_I	ldx	[%r20 + 0x0178], %r31
	.word 0xf45da19d  ! 2931: LDX_I	ldx	[%r22 + 0x019d], %r26
	.word 0xb5518000  ! 2932: RDPR_PSTATE	<illegal instruction>
	.word 0xb7540000  ! 2933: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2de001  ! 2943: SLL_I	sll 	%r23, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 2944: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe0c20c3  ! 2945: LDUB_I	ldub	[%r16 + 0x00c3], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d1b  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	.word 0xb57cc400  ! 2947: MOVR_R	movre	%r19, %r0, %r26
	.word 0xb0ad0000  ! 2948: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xfe14e15b  ! 2951: LDUH_I	lduh	[%r19 + 0x015b], %r31
	.word 0xf91d2104  ! 2953: LDDF_I	ldd	[%r20, 0x0104], %f28
	.word 0xbabc6135  ! 2958: XNORcc_I	xnorcc 	%r17, 0x0135, %r29
	.word 0x879420e6  ! 2959: WRPR_TT_I	wrpr	%r16, 0x00e6, %tt
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1d618b  ! 2962: LDDF_I	ldd	[%r21, 0x018b], %f30
	.word 0xbd504000  ! 2964: RDPR_TNPC	<illegal instruction>
	.word 0xf0050000  ! 2965: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xfa04a09e  ! 2967: LDUW_I	lduw	[%r18 + 0x009e], %r29
	.word 0xfd1da1b2  ! 2969: LDDF_I	ldd	[%r22, 0x01b2], %f30
	.word 0xfc4cc000  ! 2970: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xf815603b  ! 2973: LDUH_I	lduh	[%r21 + 0x003b], %r28
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe05c000  ! 2977: LDUW_R	lduw	[%r23 + %r0], %r31
	setx	data_start_1, %g1, %r19
	.word 0x83952079  ! 2983: WRPR_TNPC_I	wrpr	%r20, 0x0079, %tnpc
	.word 0xb9518000  ! 2984: RDPR_PSTATE	<illegal instruction>
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6144000  ! 2992: LDUH_R	lduh	[%r17 + %r0], %r27
	setx	0x3032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11da199  ! 2995: LDDF_I	ldd	[%r22, 0x0199], %f24
	.word 0xf84d213b  ! 2996: LDSB_I	ldsb	[%r20 + 0x013b], %r28
	.word 0xf4156010  ! 2999: LDUH_I	lduh	[%r21 + 0x0010], %r26
	.word 0xf60c4000  ! 3000: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfe142157  ! 3005: LDUH_I	lduh	[%r16 + 0x0157], %r31
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3009: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c61ab  ! 3015: LDUB_I	ldub	[%r17 + 0x01ab], %r26
	.word 0xf015a03b  ! 3019: LDUH_I	lduh	[%r22 + 0x003b], %r24
	.word 0xf11d20d1  ! 3028: LDDF_I	ldd	[%r20, 0x00d1], %f24
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf455e125  ! 3035: LDSH_I	ldsh	[%r23 + 0x0125], %r26
	.word 0xfe5cc000  ! 3036: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0x83956075  ! 3037: WRPR_TNPC_I	wrpr	%r21, 0x0075, %tnpc
	.word 0xfa0d8000  ! 3038: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf51c4000  ! 3039: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xb7480000  ! 3043: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf71d4000  ! 3048: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0x8394216a  ! 3059: WRPR_TNPC_I	wrpr	%r16, 0x016a, %tnpc
	.word 0xb951c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xf85d2174  ! 3071: LDX_I	ldx	[%r20 + 0x0174], %r28
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1ce10b  ! 3074: LDDF_I	ldd	[%r19, 0x010b], %f31
	.word 0xb4348000  ! 3075: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xf51c0000  ! 3076: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf64460c6  ! 3077: LDSW_I	ldsw	[%r17 + 0x00c6], %r27
	.word 0xf01d4000  ! 3078: LDD_R	ldd	[%r21 + %r0], %r24
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a070  ! 3082: WRPR_TSTATE_I	wrpr	%r18, 0x0070, %tstate
	.word 0xf244e135  ! 3085: LDSW_I	ldsw	[%r19 + 0x0135], %r25
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1c210a  ! 3087: LDDF_I	ldd	[%r16, 0x010a], %f30
	.word 0x87946016  ! 3088: WRPR_TT_I	wrpr	%r17, 0x0016, %tt
	.word 0xf404c000  ! 3092: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf20de177  ! 3093: LDUB_I	ldub	[%r23 + 0x0177], %r25
	setx	0x2032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0c4000  ! 3097: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xb12c5000  ! 3101: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xb1508000  ! 3105: RDPR_TSTATE	<illegal instruction>
	.word 0x8195615c  ! 3106: WRPR_TPC_I	wrpr	%r21, 0x015c, %tpc
	.word 0xf61d4000  ! 3110: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xfa1c0000  ! 3111: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0x8995a0ee  ! 3112: WRPR_TICK_I	wrpr	%r22, 0x00ee, %tick
	.word 0xf21c8000  ! 3113: LDD_R	ldd	[%r18 + %r0], %r25
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1d0000  ! 3120: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0x8595218e  ! 3122: WRPR_TSTATE_I	wrpr	%r20, 0x018e, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983b11  ! 3125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b11, %hpstate
	.word 0xb7508000  ! 3127: RDPR_TSTATE	<illegal instruction>
	.word 0xb9518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xf81de053  ! 3130: LDD_I	ldd	[%r23 + 0x0053], %r28
	.word 0xf044e1ce  ! 3140: LDSW_I	ldsw	[%r19 + 0x01ce], %r24
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e190  ! 3142: WRPR_PSTATE_I	wrpr	%r19, 0x0190, %pstate
	.word 0xf444a175  ! 3145: LDSW_I	ldsw	[%r18 + 0x0175], %r26
	.word 0xfd1ca063  ! 3146: LDDF_I	ldd	[%r18, 0x0063], %f30
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946187  ! 3156: WRPR_TSTATE_I	wrpr	%r17, 0x0187, %tstate
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xbf7da401  ! 3163: MOVR_I	movre	%r22, 0x1, %r31
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3167: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8594a04a  ! 3173: WRPR_TSTATE_I	wrpr	%r18, 0x004a, %tstate
	.word 0xf4546125  ! 3177: LDSH_I	ldsh	[%r17 + 0x0125], %r26
	.word 0xb8c54000  ! 3180: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0xf44d6028  ! 3183: LDSB_I	ldsb	[%r21 + 0x0028], %r26
	.word 0xf65cc000  ! 3184: LDX_R	ldx	[%r19 + %r0], %r27
	mov	0, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0050000  ! 3189: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0x83942107  ! 3193: WRPR_TNPC_I	wrpr	%r16, 0x0107, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 3195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe1c8000  ! 3196: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf205c000  ! 3197: LDUW_R	lduw	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a83  ! 3198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a83, %hpstate
	.word 0xfd1cc000  ! 3201: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xfc1d4000  ! 3203: LDD_R	ldd	[%r21 + %r0], %r30
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80d612e  ! 3209: AND_I	and 	%r21, 0x012e, %r28
	.word 0xbb480000  ! 3210: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8d94e1f8  ! 3211: WRPR_PSTATE_I	wrpr	%r19, 0x01f8, %pstate
	.word 0xfe042079  ! 3212: LDUW_I	lduw	[%r16 + 0x0079], %r31
	.word 0xf71d6048  ! 3213: LDDF_I	ldd	[%r21, 0x0048], %f27
	.word 0xf24c2026  ! 3218: LDSB_I	ldsb	[%r16 + 0x0026], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 3220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	setx	data_start_3, %g1, %r18
	.word 0xf0152182  ! 3229: LDUH_I	lduh	[%r20 + 0x0182], %r24
	.word 0xf51c61b3  ! 3231: LDDF_I	ldd	[%r17, 0x01b3], %f26
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0c4000  ! 3235: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf45ce012  ! 3236: LDX_I	ldx	[%r19 + 0x0012], %r26
	.word 0xf25461a4  ! 3238: LDSH_I	ldsh	[%r17 + 0x01a4], %r25
	.word 0xb73d0000  ! 3239: SRA_R	sra 	%r20, %r0, %r27
	setx	0x2013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1de072  ! 3242: LDDF_I	ldd	[%r23, 0x0072], %f30
	.word 0x85946086  ! 3243: WRPR_TSTATE_I	wrpr	%r17, 0x0086, %tstate
	setx	0x30317, %g1, %o0
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
	.word 0xfa4ce137  ! 3252: LDSB_I	ldsb	[%r19 + 0x0137], %r29
	.word 0xb12c0000  ! 3255: SLL_R	sll 	%r16, %r0, %r24
	.word 0xf41ce17e  ! 3257: LDD_I	ldd	[%r19 + 0x017e], %r26
	.word 0xf80460ef  ! 3258: LDUW_I	lduw	[%r17 + 0x00ef], %r28
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 3260: LDSW_R	ldsw	[%r20 + %r0], %r30
	mov	1, %r14
	.word 0xa193a000  ! 3261: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 3264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0xfe156146  ! 3268: LDUH_I	lduh	[%r21 + 0x0146], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x81952175  ! 3272: WRPR_TPC_I	wrpr	%r20, 0x0175, %tpc
	.word 0xf45dc000  ! 3273: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf655c000  ! 3274: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xf405e1af  ! 3275: LDUW_I	lduw	[%r23 + 0x01af], %r26
	.word 0x8994614f  ! 3277: WRPR_TICK_I	wrpr	%r17, 0x014f, %tick
	.word 0xfa5cc000  ! 3279: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf614e0c9  ! 3281: LDUH_I	lduh	[%r19 + 0x00c9], %r27
	.word 0xfc542084  ! 3284: LDSH_I	ldsh	[%r16 + 0x0084], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	.word 0xf51d4000  ! 3286: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0x89946106  ! 3287: WRPR_TICK_I	wrpr	%r17, 0x0106, %tick
	.word 0xf51dc000  ! 3289: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xfa14c000  ! 3294: LDUH_R	lduh	[%r19 + %r0], %r29
	setx	data_start_2, %g1, %r17
	mov	1, %r12
	.word 0x8f932000  ! 3296: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 3298: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xb5480000  ! 3299: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d20b6  ! 3306: LDSB_I	ldsb	[%r20 + 0x00b6], %r27
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf045606c  ! 3312: LDSW_I	ldsw	[%r21 + 0x006c], %r24
	.word 0xf20d8000  ! 3314: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf2148000  ! 3315: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf84d8000  ! 3316: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf64c8000  ! 3317: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xbf51c000  ! 3320: RDPR_TL	<illegal instruction>
	.word 0x8d95605f  ! 3323: WRPR_PSTATE_I	wrpr	%r21, 0x005f, %pstate
	.word 0xf8046048  ! 3327: LDUW_I	lduw	[%r17 + 0x0048], %r28
	.word 0xff1dc000  ! 3328: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xff1c8000  ! 3329: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf31d8000  ! 3330: LDDF_R	ldd	[%r22, %r0], %f25
	setx	data_start_3, %g1, %r19
	.word 0x9194609e  ! 3337: WRPR_PIL_I	wrpr	%r17, 0x009e, %pil
	mov	1, %r12
	.word 0x8f932000  ! 3340: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d9420b7  ! 3343: WRPR_PSTATE_I	wrpr	%r16, 0x00b7, %pstate
	.word 0xbb346001  ! 3344: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xf60dc000  ! 3345: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf91cc000  ! 3346: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xb2bd8000  ! 3348: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xf60c2161  ! 3354: LDUB_I	ldub	[%r16 + 0x0161], %r27
	.word 0xb0adc000  ! 3358: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xf31d6171  ! 3359: LDDF_I	ldd	[%r21, 0x0171], %f25
	mov	0, %r14
	.word 0xa193a000  ! 3363: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8194e125  ! 3365: WRPR_TPC_I	wrpr	%r19, 0x0125, %tpc
	.word 0xba0d4000  ! 3366: AND_R	and 	%r21, %r0, %r29
	.word 0xfe05e01f  ! 3367: LDUW_I	lduw	[%r23 + 0x001f], %r31
	setx	data_start_0, %g1, %r18
	.word 0xb7504000  ! 3370: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xf0046081  ! 3376: LDUW_I	lduw	[%r17 + 0x0081], %r24
	.word 0xf61c6052  ! 3381: LDD_I	ldd	[%r17 + 0x0052], %r27
	.word 0xf2058000  ! 3382: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xb5518000  ! 3383: RDPR_PSTATE	<illegal instruction>
	.word 0xfc4cc000  ! 3387: LDSB_R	ldsb	[%r19 + %r0], %r30
	mov	1, %r12
	.word 0x8f932000  ! 3389: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7641800  ! 3390: MOVcc_R	<illegal instruction>
	.word 0xf24cc000  ! 3392: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xfe45c000  ! 3394: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf21560c9  ! 3395: LDUH_I	lduh	[%r21 + 0x00c9], %r25
	.word 0xb02520be  ! 3396: SUB_I	sub 	%r20, 0x00be, %r24
	.word 0xfa1c8000  ! 3399: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xb9480000  ! 3400: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb951c000  ! 3410: RDPR_TL	<illegal instruction>
	.word 0xbf344000  ! 3415: SRL_R	srl 	%r17, %r0, %r31
	mov	0, %r14
	.word 0xa193a000  ! 3416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 3425: RDPR_TICK	<illegal instruction>
	.word 0xf8440000  ! 3430: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xf40ca086  ! 3433: LDUB_I	ldub	[%r18 + 0x0086], %r26
	setx	0x30338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52cf001  ! 3435: SLLX_I	sllx	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0c61ad  ! 3439: LDUB_I	ldub	[%r17 + 0x01ad], %r31
	.word 0xf4444000  ! 3441: LDSW_R	ldsw	[%r17 + %r0], %r26
	mov	1, %r14
	.word 0xa193a000  ! 3443: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d2097  ! 3448: LDD_I	ldd	[%r20 + 0x0097], %r31
	.word 0xf455a199  ! 3449: LDSH_I	ldsh	[%r22 + 0x0199], %r26
	.word 0xf61c2104  ! 3452: LDD_I	ldd	[%r16 + 0x0104], %r27
	.word 0xb8c5c000  ! 3453: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xfa0ce013  ! 3457: LDUB_I	ldub	[%r19 + 0x0013], %r29
	.word 0xf64dc000  ! 3458: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xbb504000  ! 3459: RDPR_TNPC	<illegal instruction>
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24da1b3  ! 3464: LDSB_I	ldsb	[%r22 + 0x01b3], %r25
	.word 0xbf540000  ! 3470: RDPR_GL	<illegal instruction>
	.word 0xf31d8000  ! 3471: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf64de0b9  ! 3473: LDSB_I	ldsb	[%r23 + 0x00b9], %r27
	.word 0xb3508000  ! 3475: RDPR_TSTATE	<illegal instruction>
	.word 0x8995e074  ! 3480: WRPR_TICK_I	wrpr	%r23, 0x0074, %tick
	.word 0xfc458000  ! 3481: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xbc9ce0b1  ! 3482: XORcc_I	xorcc 	%r19, 0x00b1, %r30
	.word 0xf404e1b8  ! 3486: LDUW_I	lduw	[%r19 + 0x01b8], %r26
	.word 0xf51d601e  ! 3489: LDDF_I	ldd	[%r21, 0x001e], %f26
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb134f001  ! 3493: SRLX_I	srlx	%r19, 0x0001, %r24
	.word 0xb5500000  ! 3498: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8994216c  ! 3500: WRPR_TICK_I	wrpr	%r16, 0x016c, %tick
	.word 0xfc4d0000  ! 3502: LDSB_R	ldsb	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa158000  ! 3506: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0x8794610e  ! 3507: WRPR_TT_I	wrpr	%r17, 0x010e, %tt
	.word 0xfa4dc000  ! 3513: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfc4c2080  ! 3517: LDSB_I	ldsb	[%r16 + 0x0080], %r30
	.word 0xb7480000  ! 3518: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_7, %g1, %r22
	.word 0xf254c000  ! 3520: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf6452091  ! 3523: LDSW_I	ldsw	[%r20 + 0x0091], %r27
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b09  ! 3528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b09, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 3529: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb480000  ! 3531: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe1d4000  ! 3534: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xfa4da150  ! 3535: LDSB_I	ldsb	[%r22 + 0x0150], %r29
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a02b  ! 3541: WRPR_TNPC_I	wrpr	%r22, 0x002b, %tnpc
	.word 0xfe4c2190  ! 3544: LDSB_I	ldsb	[%r16 + 0x0190], %r31
	.word 0xf24ca045  ! 3547: LDSB_I	ldsb	[%r18 + 0x0045], %r25
	.word 0xb61cc000  ! 3552: XOR_R	xor 	%r19, %r0, %r27
	.word 0xfa1c4000  ! 3558: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf84d4000  ! 3561: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xbd50c000  ! 3562: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 3564: RDPR_TSTATE	<illegal instruction>
	.word 0x879560a8  ! 3567: WRPR_TT_I	wrpr	%r21, 0x00a8, %tt
	.word 0x8795e164  ! 3570: WRPR_TT_I	wrpr	%r23, 0x0164, %tt
	.word 0xb151c000  ! 3571: RDPR_TL	<illegal instruction>
	.word 0xfe4561fe  ! 3573: LDSW_I	ldsw	[%r21 + 0x01fe], %r31
	.word 0xf254c000  ! 3575: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0x8994e0e4  ! 3578: WRPR_TICK_I	wrpr	%r19, 0x00e4, %tick
	.word 0xfa550000  ! 3582: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xfa4ce13d  ! 3583: LDSB_I	ldsb	[%r19 + 0x013d], %r29
	setx	0x20210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0044000  ! 3585: LDUW_R	lduw	[%r17 + %r0], %r24
	mov	1, %r12
	.word 0x8f932000  ! 3587: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd500000  ! 3592: RDPR_TPC	<illegal instruction>
	.word 0xfe55a10e  ! 3596: LDSH_I	ldsh	[%r22 + 0x010e], %r31
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05d8000  ! 3600: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0x8394a055  ! 3603: WRPR_TNPC_I	wrpr	%r18, 0x0055, %tnpc
	setx	0x3021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 3618: MOVcc_R	<illegal instruction>
	.word 0xbb3cb001  ! 3620: SRAX_I	srax	%r18, 0x0001, %r29
	.word 0xfc546047  ! 3621: LDSH_I	ldsh	[%r17 + 0x0047], %r30
	.word 0xb750c000  ! 3622: RDPR_TT	<illegal instruction>
	.word 0xf00d612a  ! 3623: LDUB_I	ldub	[%r21 + 0x012a], %r24
	.word 0x91942149  ! 3625: WRPR_PIL_I	wrpr	%r16, 0x0149, %pil
	.word 0xfc0c0000  ! 3626: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0x8594a1b6  ! 3627: WRPR_TSTATE_I	wrpr	%r18, 0x01b6, %tstate
	.word 0xf85d4000  ! 3630: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf6450000  ! 3633: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf91c8000  ! 3635: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xfc050000  ! 3638: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfd1c0000  ! 3643: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xfa04a1cb  ! 3644: LDUW_I	lduw	[%r18 + 0x01cb], %r29
	.word 0xf0442170  ! 3645: LDSW_I	ldsw	[%r16 + 0x0170], %r24
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85956043  ! 3652: WRPR_TSTATE_I	wrpr	%r21, 0x0043, %tstate
	.word 0xf31da074  ! 3654: LDDF_I	ldd	[%r22, 0x0074], %f25
	.word 0xbf50c000  ! 3656: RDPR_TT	<illegal instruction>
	.word 0xfc554000  ! 3660: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xfc454000  ! 3661: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xb32cc000  ! 3664: SLL_R	sll 	%r19, %r0, %r25
	.word 0xbabd8000  ! 3667: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xfc442050  ! 3668: LDSW_I	ldsw	[%r16 + 0x0050], %r30
	.word 0xf454e1aa  ! 3671: LDSH_I	ldsh	[%r19 + 0x01aa], %r26
	.word 0xb215e1d5  ! 3672: OR_I	or 	%r23, 0x01d5, %r25
	.word 0xb7510000  ! 3673: RDPR_TICK	<illegal instruction>
	.word 0xf45da137  ! 3674: LDX_I	ldx	[%r22 + 0x0137], %r26
	.word 0xb33c9000  ! 3675: SRAX_R	srax	%r18, %r0, %r25
	.word 0xfe5cc000  ! 3677: LDX_R	ldx	[%r19 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 3679: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8995a0cb  ! 3680: WRPR_TICK_I	wrpr	%r22, 0x00cb, %tick
	.word 0xbe2cc000  ! 3684: ANDN_R	andn 	%r19, %r0, %r31
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64c0000  ! 3689: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xb02421c3  ! 3691: SUB_I	sub 	%r16, 0x01c3, %r24
	.word 0xbb50c000  ! 3696: RDPR_TT	rdpr	%tt, %r29
	.word 0xf71d4000  ! 3697: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xb1540000  ! 3700: RDPR_GL	<illegal instruction>
	.word 0xfc5cc000  ! 3701: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xb750c000  ! 3703: RDPR_TT	<illegal instruction>
	.word 0xbf51c000  ! 3704: RDPR_TL	<illegal instruction>
	.word 0xfe556095  ! 3706: LDSH_I	ldsh	[%r21 + 0x0095], %r31
	mov	1, %r12
	.word 0x8f932000  ! 3707: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64c6179  ! 3711: LDSB_I	ldsb	[%r17 + 0x0179], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xfe45a1f2  ! 3717: LDSW_I	ldsw	[%r22 + 0x01f2], %r31
	.word 0x919421bb  ! 3718: WRPR_PIL_I	wrpr	%r16, 0x01bb, %pil
	.word 0xf244c000  ! 3721: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xf805a0a8  ! 3722: LDUW_I	lduw	[%r22 + 0x00a8], %r28
	.word 0xf00d0000  ! 3727: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xb3500000  ! 3728: RDPR_TPC	<illegal instruction>
	.word 0xfe056185  ! 3730: LDUW_I	lduw	[%r21 + 0x0185], %r31
	.word 0xf4046027  ! 3732: LDUW_I	lduw	[%r17 + 0x0027], %r26
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d4000  ! 3743: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfc5dc000  ! 3746: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0x8d94a0b6  ! 3749: WRPR_PSTATE_I	wrpr	%r18, 0x00b6, %pstate
	.word 0x91956165  ! 3750: WRPR_PIL_I	wrpr	%r21, 0x0165, %pil
	.word 0xfe5dc000  ! 3753: LDX_R	ldx	[%r23 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 3754: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf85420a0  ! 3756: LDSH_I	ldsh	[%r16 + 0x00a0], %r28
	.word 0xfc4de0c6  ! 3759: LDSB_I	ldsb	[%r23 + 0x00c6], %r30
	.word 0xb7480000  ! 3761: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d4000  ! 3766: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf854e007  ! 3767: LDSH_I	ldsh	[%r19 + 0x0007], %r28
	.word 0xbd500000  ! 3769: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3772: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfb1d21ba  ! 3773: LDDF_I	ldd	[%r20, 0x01ba], %f29
	.word 0xb0b5c000  ! 3774: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xb29d4000  ! 3775: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xf24c4000  ! 3777: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf64d8000  ! 3780: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xb9540000  ! 3781: RDPR_GL	<illegal instruction>
	.word 0x8994a1a2  ! 3786: WRPR_TICK_I	wrpr	%r18, 0x01a2, %tick
	.word 0xfc448000  ! 3789: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf05d0000  ! 3794: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xbe2560e9  ! 3795: SUB_I	sub 	%r21, 0x00e9, %r31
	.word 0xbd2d8000  ! 3796: SLL_R	sll 	%r22, %r0, %r30
	.word 0xff1de05b  ! 3805: LDDF_I	ldd	[%r23, 0x005b], %f31
	.word 0xb7518000  ! 3812: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf04da163  ! 3814: LDSB_I	ldsb	[%r22 + 0x0163], %r24
	.word 0x8794e06f  ! 3819: WRPR_TT_I	wrpr	%r19, 0x006f, %tt
	.word 0xf6040000  ! 3820: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfe55e111  ! 3821: LDSH_I	ldsh	[%r23 + 0x0111], %r31
	.word 0x8594a02d  ! 3822: WRPR_TSTATE_I	wrpr	%r18, 0x002d, %tstate
	.word 0xf60d21da  ! 3824: LDUB_I	ldub	[%r20 + 0x01da], %r27
	.word 0xbb643801  ! 3825: MOVcc_I	<illegal instruction>
	.word 0xb9480000  ! 3827: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf11cc000  ! 3829: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xf41ca11c  ! 3830: LDD_I	ldd	[%r18 + 0x011c], %r26
	.word 0xf24521a3  ! 3831: LDSW_I	ldsw	[%r20 + 0x01a3], %r25
	.word 0x81946023  ! 3832: WRPR_TPC_I	wrpr	%r17, 0x0023, %tpc
	.word 0xfa45a00b  ! 3834: LDSW_I	ldsw	[%r22 + 0x000b], %r29
	.word 0xb9480000  ! 3835: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf81c4000  ! 3836: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xf71da0ad  ! 3837: LDDF_I	ldd	[%r22, 0x00ad], %f27
	.word 0xb32d4000  ! 3844: SLL_R	sll 	%r21, %r0, %r25
	.word 0xbb641800  ! 3846: MOVcc_R	<illegal instruction>
	.word 0xb5540000  ! 3849: RDPR_GL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3851: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561db  ! 3857: WRPR_PSTATE_I	wrpr	%r21, 0x01db, %pstate
	.word 0x8994e03d  ! 3858: WRPR_TICK_I	wrpr	%r19, 0x003d, %tick
	mov	1, %r14
	.word 0xa193a000  ! 3859: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfb1de1cb  ! 3862: LDDF_I	ldd	[%r23, 0x01cb], %f29
	.word 0xb3540000  ! 3864: RDPR_GL	<illegal instruction>
	.word 0xf01cc000  ! 3867: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf24de0da  ! 3871: LDSB_I	ldsb	[%r23 + 0x00da], %r25
	.word 0xf4150000  ! 3875: LDUH_R	lduh	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbeb4a13e  ! 3877: SUBCcc_I	orncc 	%r18, 0x013e, %r31
	.word 0xfe5c2024  ! 3881: LDX_I	ldx	[%r16 + 0x0024], %r31
	.word 0xf20c2177  ! 3883: LDUB_I	ldub	[%r16 + 0x0177], %r25
	mov	1, %r14
	.word 0xa193a000  ! 3884: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r20
	mov	2, %r14
	.word 0xa193a000  ! 3891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d946109  ! 3893: WRPR_PSTATE_I	wrpr	%r17, 0x0109, %pstate
	.word 0xf51c6186  ! 3894: LDDF_I	ldd	[%r17, 0x0186], %f26
	.word 0xbc344000  ! 3895: ORN_R	orn 	%r17, %r0, %r30
	.word 0xf71c4000  ! 3896: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xb72c0000  ! 3901: SLL_R	sll 	%r16, %r0, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3907: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x91952050  ! 3908: WRPR_PIL_I	wrpr	%r20, 0x0050, %pil
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1c8000  ! 3916: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xfc0da1c2  ! 3917: LDUB_I	ldub	[%r22 + 0x01c2], %r30
	.word 0xf41ca079  ! 3918: LDD_I	ldd	[%r18 + 0x0079], %r26
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 3920: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xbd504000  ! 3921: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x89942088  ! 3922: WRPR_TICK_I	wrpr	%r16, 0x0088, %tick
	.word 0x8995e12e  ! 3923: WRPR_TICK_I	wrpr	%r23, 0x012e, %tick
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05ce04d  ! 3926: LDX_I	ldx	[%r19 + 0x004d], %r24
	.word 0x8d94215a  ! 3928: WRPR_PSTATE_I	wrpr	%r16, 0x015a, %pstate
	.word 0xf00d0000  ! 3929: LDUB_R	ldub	[%r20 + %r0], %r24
	setx	0x10003, %g1, %o0
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
	.word 0xf85d20b3  ! 3935: LDX_I	ldx	[%r20 + 0x00b3], %r28
	.word 0x8d95e058  ! 3936: WRPR_PSTATE_I	wrpr	%r23, 0x0058, %pstate
	setx	data_start_3, %g1, %r16
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf855a01e  ! 3944: LDSH_I	ldsh	[%r22 + 0x001e], %r28
	.word 0xfa1c2011  ! 3950: LDD_I	ldd	[%r16 + 0x0011], %r29
	setx	data_start_1, %g1, %r19
	.word 0xbd540000  ! 3953: RDPR_GL	<illegal instruction>
	.word 0xba34c000  ! 3954: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xf014e0f6  ! 3956: LDUH_I	lduh	[%r19 + 0x00f6], %r24
	.word 0xf41d6071  ! 3957: LDD_I	ldd	[%r21 + 0x0071], %r26
	.word 0xb69d4000  ! 3960: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xfa448000  ! 3962: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0x8195a034  ! 3971: WRPR_TPC_I	wrpr	%r22, 0x0034, %tpc
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 3974: RDPR_GL	<illegal instruction>
	.word 0xbb540000  ! 3975: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b53  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b53, %hpstate
	.word 0xfe5560bd  ! 3977: LDSH_I	ldsh	[%r21 + 0x00bd], %r31
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 3978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xf414a09b  ! 3981: LDUH_I	lduh	[%r18 + 0x009b], %r26
	.word 0xf60dc000  ! 3982: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf04c4000  ! 3985: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf0144000  ! 3986: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xbd510000  ! 3987: RDPR_TICK	<illegal instruction>
	.word 0xf85c8000  ! 3991: LDX_R	ldx	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983c03  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c03, %hpstate
	.word 0xf2544000  ! 3999: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf24c4000  ! 4000: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf8444000  ! 4003: LDSW_R	ldsw	[%r17 + %r0], %r28
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6142198  ! 4006: LDUH_I	lduh	[%r16 + 0x0198], %r27
	.word 0xfa05c000  ! 4009: LDUW_R	lduw	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982bd1  ! 4010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd1, %hpstate
	.word 0xff1cc000  ! 4011: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xf71d61c3  ! 4013: LDDF_I	ldd	[%r21, 0x01c3], %f27
	.word 0xf005c000  ! 4014: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0x8d94e193  ! 4016: WRPR_PSTATE_I	wrpr	%r19, 0x0193, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf60c6137  ! 4020: LDUB_I	ldub	[%r17 + 0x0137], %r27
	.word 0xf45da151  ! 4021: LDX_I	ldx	[%r22 + 0x0151], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983dc3  ! 4022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc3, %hpstate
	.word 0xf84d8000  ! 4024: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xfc444000  ! 4027: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfa0c0000  ! 4030: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0x8394a06f  ! 4031: WRPR_TNPC_I	wrpr	%r18, 0x006f, %tnpc
	setx	data_start_0, %g1, %r16
	.word 0xbf500000  ! 4033: RDPR_TPC	<illegal instruction>
	.word 0xbd520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xbe2da080  ! 4040: ANDN_I	andn 	%r22, 0x0080, %r31
	.word 0xbf500000  ! 4041: RDPR_TPC	<illegal instruction>
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 4051: RDPR_GL	<illegal instruction>
	.word 0xbb480000  ! 4053: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfd1c8000  ! 4054: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf31c21ec  ! 4059: LDDF_I	ldd	[%r16, 0x01ec], %f25
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4061: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r17
	.word 0xf2458000  ! 4065: LDSW_R	ldsw	[%r22 + %r0], %r25
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 4071: RDPR_GL	<illegal instruction>
	.word 0xf91de1be  ! 4075: LDDF_I	ldd	[%r23, 0x01be], %f28
	mov	2, %r14
	.word 0xa193a000  ! 4078: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf445e1be  ! 4081: LDSW_I	ldsw	[%r23 + 0x01be], %r26
	setx	0x3012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 4084: RDPR_TT	<illegal instruction>
	.word 0xfe0461ba  ! 4085: LDUW_I	lduw	[%r17 + 0x01ba], %r31
	.word 0xf6552112  ! 4086: LDSH_I	ldsh	[%r20 + 0x0112], %r27
	.word 0xfc0de1c2  ! 4088: LDUB_I	ldub	[%r23 + 0x01c2], %r30
	.word 0xf41de13a  ! 4090: LDD_I	ldd	[%r23 + 0x013a], %r26
	.word 0xfa4cc000  ! 4093: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xb084a0cc  ! 4094: ADDcc_I	addcc 	%r18, 0x00cc, %r24
	.word 0xfe154000  ! 4096: LDUH_R	lduh	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983ecb  ! 4097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecb, %hpstate
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	.word 0xf04cc000  ! 4109: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf8440000  ! 4110: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xbb2df001  ! 4114: SLLX_I	sllx	%r23, 0x0001, %r29
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa156066  ! 4121: LDUH_I	lduh	[%r21 + 0x0066], %r29
	.word 0xf414e111  ! 4122: LDUH_I	lduh	[%r19 + 0x0111], %r26
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1d21a2  ! 4125: LDD_I	ldd	[%r20 + 0x01a2], %r29
	setx	data_start_2, %g1, %r17
	.word 0xf65d0000  ! 4129: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xfa5ca068  ! 4131: LDX_I	ldx	[%r18 + 0x0068], %r29
	.word 0xf6540000  ! 4132: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0x8795a027  ! 4139: WRPR_TT_I	wrpr	%r22, 0x0027, %tt
	mov	1, %r14
	.word 0xa193a000  ! 4144: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d6137  ! 4146: LDUB_I	ldub	[%r21 + 0x0137], %r29
	.word 0x8194a010  ! 4147: WRPR_TPC_I	wrpr	%r18, 0x0010, %tpc
	.word 0xb0b58000  ! 4151: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xb750c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 4154: RDPR_TT	<illegal instruction>
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4157: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc1ce1bb  ! 4161: LDD_I	ldd	[%r19 + 0x01bb], %r30
	.word 0xf4548000  ! 4162: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xb3500000  ! 4166: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 4167: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xf51c21e0  ! 4173: LDDF_I	ldd	[%r16, 0x01e0], %f26
	.word 0xb13d7001  ! 4177: SRAX_I	srax	%r21, 0x0001, %r24
	.word 0xf0140000  ! 4180: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb32c0000  ! 4184: SLL_R	sll 	%r16, %r0, %r25
	.word 0xb23d0000  ! 4185: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xb5504000  ! 4188: RDPR_TNPC	<illegal instruction>
	.word 0xf044e11d  ! 4194: LDSW_I	ldsw	[%r19 + 0x011d], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2152146  ! 4199: LDUH_I	lduh	[%r20 + 0x0146], %r25
	.word 0xb0ade137  ! 4201: ANDNcc_I	andncc 	%r23, 0x0137, %r24
	.word 0xf41da0fa  ! 4204: LDD_I	ldd	[%r22 + 0x00fa], %r26
	.word 0xfe1da186  ! 4208: LDD_I	ldd	[%r22 + 0x0186], %r31
	.word 0x89952114  ! 4210: WRPR_TICK_I	wrpr	%r20, 0x0114, %tick
	.word 0xf45c0000  ! 4215: LDX_R	ldx	[%r16 + %r0], %r26
	setx	data_start_6, %g1, %r23
	.word 0x8795e16b  ! 4218: WRPR_TT_I	wrpr	%r23, 0x016b, %tt
	.word 0xf31d4000  ! 4220: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf6040000  ! 4225: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xbf504000  ! 4227: RDPR_TNPC	<illegal instruction>
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c8b  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8b, %hpstate
	.word 0xfa0d60e5  ! 4231: LDUB_I	ldub	[%r21 + 0x00e5], %r29
	.word 0xf25c61fa  ! 4234: LDX_I	ldx	[%r17 + 0x01fa], %r25
	mov	1, %r12
	.word 0x8f932000  ! 4237: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r16
	.word 0xf8540000  ! 4241: LDSH_R	ldsh	[%r16 + %r0], %r28
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf254609a  ! 4243: LDSH_I	ldsh	[%r17 + 0x009a], %r25
	.word 0xf64c619d  ! 4248: LDSB_I	ldsb	[%r17 + 0x019d], %r27
	.word 0x8795606f  ! 4250: WRPR_TT_I	wrpr	%r21, 0x006f, %tt
	.word 0xf84d0000  ! 4251: LDSB_R	ldsb	[%r20 + %r0], %r28
	mov	0, %r12
	.word 0x8f932000  ! 4255: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85c2171  ! 4264: LDX_I	ldx	[%r16 + 0x0171], %r28
	.word 0xf85dc000  ! 4267: LDX_R	ldx	[%r23 + %r0], %r28
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994201c  ! 4270: WRPR_TICK_I	wrpr	%r16, 0x001c, %tick
	.word 0xbb520000  ! 4273: RDPR_PIL	<illegal instruction>
	.word 0xf244216c  ! 4274: LDSW_I	ldsw	[%r16 + 0x016c], %r25
	.word 0xf51c2096  ! 4281: LDDF_I	ldd	[%r16, 0x0096], %f26
	.word 0xfa540000  ! 4287: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	data_start_5, %g1, %r17
	.word 0x879521fd  ! 4289: WRPR_TT_I	wrpr	%r20, 0x01fd, %tt
	setx	0xb, %g1, %o0
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
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e132  ! 4302: WRPR_PSTATE_I	wrpr	%r23, 0x0132, %pstate
	.word 0xf51d4000  ! 4303: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xf51ca159  ! 4305: LDDF_I	ldd	[%r18, 0x0159], %f26
	.word 0xfc5c4000  ! 4309: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xf654a123  ! 4310: LDSH_I	ldsh	[%r18 + 0x0123], %r27
	.word 0xfc4de193  ! 4311: LDSB_I	ldsb	[%r23 + 0x0193], %r30
	.word 0xb0c54000  ! 4313: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0xf31d6046  ! 4314: LDDF_I	ldd	[%r21, 0x0046], %f25
	.word 0xf05d60fd  ! 4315: LDX_I	ldx	[%r21 + 0x00fd], %r24
	.word 0xf6556114  ! 4316: LDSH_I	ldsh	[%r21 + 0x0114], %r27
	.word 0x819521a1  ! 4319: WRPR_TPC_I	wrpr	%r20, 0x01a1, %tpc
	.word 0xb3508000  ! 4320: RDPR_TSTATE	<illegal instruction>
	.word 0xf055a02e  ! 4321: LDSH_I	ldsh	[%r22 + 0x002e], %r24
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb29dc000  ! 4325: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xfc5cc000  ! 4326: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfe5d4000  ! 4327: LDX_R	ldx	[%r21 + %r0], %r31
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 4330: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfa1461d2  ! 4331: LDUH_I	lduh	[%r17 + 0x01d2], %r29
	.word 0xb23d8000  ! 4332: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0x81942129  ! 4334: WRPR_TPC_I	wrpr	%r16, 0x0129, %tpc
	.word 0xb9540000  ! 4335: RDPR_GL	<illegal instruction>
	.word 0xf6548000  ! 4337: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xfc15c000  ! 4341: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xfb1c21f0  ! 4342: LDDF_I	ldd	[%r16, 0x01f0], %f29
	.word 0xf0054000  ! 4354: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xf31dc000  ! 4355: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xf84cc000  ! 4356: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf00d604d  ! 4358: LDUB_I	ldub	[%r21 + 0x004d], %r24
	.word 0xfa1c8000  ! 4361: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0x87952171  ! 4363: WRPR_TT_I	wrpr	%r20, 0x0171, %tt
	.word 0xf60c603c  ! 4364: LDUB_I	ldub	[%r17 + 0x003c], %r27
	.word 0xfe440000  ! 4367: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0x8d95e04e  ! 4368: WRPR_PSTATE_I	wrpr	%r23, 0x004e, %pstate
	.word 0xf20c8000  ! 4370: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xfc5c0000  ! 4371: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xfc1da11e  ! 4372: LDD_I	ldd	[%r22 + 0x011e], %r30
	.word 0xf444c000  ! 4375: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfa1c20ab  ! 4378: LDD_I	ldd	[%r16 + 0x00ab], %r29
	.word 0xb404e1cb  ! 4380: ADD_I	add 	%r19, 0x01cb, %r26
	.word 0xb7518000  ! 4383: RDPR_PSTATE	<illegal instruction>
	.word 0xb83c8000  ! 4386: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xf81c2123  ! 4387: LDD_I	ldd	[%r16 + 0x0123], %r28
	.word 0xf81c8000  ! 4389: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0x9195e0dd  ! 4392: WRPR_PIL_I	wrpr	%r23, 0x00dd, %pil
	.word 0xf84c21f4  ! 4395: LDSB_I	ldsb	[%r16 + 0x01f4], %r28
	.word 0xf814c000  ! 4396: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf25ca0c7  ! 4397: LDX_I	ldx	[%r18 + 0x00c7], %r25
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195208f  ! 4405: WRPR_TPC_I	wrpr	%r20, 0x008f, %tpc
	.word 0xf45d210c  ! 4406: LDX_I	ldx	[%r20 + 0x010c], %r26
	.word 0xf40c0000  ! 4408: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfa44213e  ! 4409: LDSW_I	ldsw	[%r16 + 0x013e], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3480000  ! 4412: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3510000  ! 4414: RDPR_TICK	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf6048000  ! 4420: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb7500000  ! 4421: RDPR_TPC	<illegal instruction>
	.word 0xf205a064  ! 4422: LDUW_I	lduw	[%r22 + 0x0064], %r25
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 4425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xfe444000  ! 4426: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0x839461ba  ! 4428: WRPR_TNPC_I	wrpr	%r17, 0x01ba, %tnpc
	.word 0xfa0c2133  ! 4429: LDUB_I	ldub	[%r16 + 0x0133], %r29
	.word 0xbf520000  ! 4432: RDPR_PIL	<illegal instruction>
	.word 0xfc0ce166  ! 4433: LDUB_I	ldub	[%r19 + 0x0166], %r30
	.word 0xbc8c4000  ! 4435: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xfa44e0b3  ! 4437: LDSW_I	ldsw	[%r19 + 0x00b3], %r29
	.word 0xfa44a0db  ! 4439: LDSW_I	ldsw	[%r18 + 0x00db], %r29
	.word 0xfc4ce0fa  ! 4441: LDSB_I	ldsb	[%r19 + 0x00fa], %r30
	.word 0xbc0c4000  ! 4442: AND_R	and 	%r17, %r0, %r30
	.word 0xb1518000  ! 4446: RDPR_PSTATE	<illegal instruction>
	.word 0xb814c000  ! 4449: OR_R	or 	%r19, %r0, %r28
	.word 0xf2154000  ! 4451: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xbd540000  ! 4452: RDPR_GL	<illegal instruction>
	.word 0xf25ca1cb  ! 4455: LDX_I	ldx	[%r18 + 0x01cb], %r25
	setx	0x2002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb17c8400  ! 4463: MOVR_R	movre	%r18, %r0, %r24
	.word 0xf215619c  ! 4464: LDUH_I	lduh	[%r21 + 0x019c], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf805c000  ! 4466: LDUW_R	lduw	[%r23 + %r0], %r28
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01560c8  ! 4475: LDUH_I	lduh	[%r21 + 0x00c8], %r24
	.word 0xbb508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xb1520000  ! 4477: RDPR_PIL	<illegal instruction>
	.word 0xf44dc000  ! 4479: LDSB_R	ldsb	[%r23 + %r0], %r26
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 4484: RDPR_TNPC	<illegal instruction>
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3c8000  ! 4488: SRA_R	sra 	%r18, %r0, %r29
	.word 0xf51c4000  ! 4490: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xbf504000  ! 4491: RDPR_TNPC	<illegal instruction>
	.word 0xf24c0000  ! 4493: LDSB_R	ldsb	[%r16 + %r0], %r25
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6bd4000  ! 4496: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xf20d202b  ! 4497: LDUB_I	ldub	[%r20 + 0x002b], %r25
	.word 0xf20d8000  ! 4498: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xb3508000  ! 4502: RDPR_TSTATE	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb60cc000  ! 4509: AND_R	and 	%r19, %r0, %r27
	.word 0xfa540000  ! 4513: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xb0346025  ! 4515: SUBC_I	orn 	%r17, 0x0025, %r24
	.word 0xbb504000  ! 4516: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfa45219d  ! 4517: LDSW_I	ldsw	[%r20 + 0x019d], %r29
	.word 0xf64c4000  ! 4519: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xf85c6046  ! 4521: LDX_I	ldx	[%r17 + 0x0046], %r28
	.word 0xbf50c000  ! 4522: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 4523: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf61d0000  ! 4524: LDD_R	ldd	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b19  ! 4525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b19, %hpstate
	.word 0xbc456049  ! 4526: ADDC_I	addc 	%r21, 0x0049, %r30
	setx	data_start_7, %g1, %r18
	.word 0xf21420f9  ! 4529: LDUH_I	lduh	[%r16 + 0x00f9], %r25
	.word 0xb205a178  ! 4531: ADD_I	add 	%r22, 0x0178, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 4536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	.word 0xb151c000  ! 4537: RDPR_TL	<illegal instruction>
	.word 0xb23521b8  ! 4539: ORN_I	orn 	%r20, 0x01b8, %r25
	.word 0xbc0d8000  ! 4540: AND_R	and 	%r22, %r0, %r30
	.word 0xfa5c4000  ! 4543: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0x8194e135  ! 4545: WRPR_TPC_I	wrpr	%r19, 0x0135, %tpc
	.word 0xf0040000  ! 4549: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xb1500000  ! 4550: RDPR_TPC	<illegal instruction>
	.word 0xb69d609c  ! 4554: XORcc_I	xorcc 	%r21, 0x009c, %r27
	.word 0xfe1dc000  ! 4555: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xf71da0aa  ! 4556: LDDF_I	ldd	[%r22, 0x00aa], %f27
	setx	data_start_1, %g1, %r18
	setx	data_start_3, %g1, %r20
	.word 0xfa0c2162  ! 4565: LDUB_I	ldub	[%r16 + 0x0162], %r29
	.word 0xf6458000  ! 4566: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf71da146  ! 4567: LDDF_I	ldd	[%r22, 0x0146], %f27
	.word 0xf8554000  ! 4568: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xb6444000  ! 4573: ADDC_R	addc 	%r17, %r0, %r27
	.word 0xf84d208e  ! 4574: LDSB_I	ldsb	[%r20 + 0x008e], %r28
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4580: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc158000  ! 4581: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf84ca1ff  ! 4582: LDSB_I	ldsb	[%r18 + 0x01ff], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0xf84da024  ! 4594: LDSB_I	ldsb	[%r22 + 0x0024], %r28
	.word 0xbcac6175  ! 4599: ANDNcc_I	andncc 	%r17, 0x0175, %r30
	.word 0xfd1d6047  ! 4601: LDDF_I	ldd	[%r21, 0x0047], %f30
	.word 0xf004618e  ! 4604: LDUW_I	lduw	[%r17 + 0x018e], %r24
	.word 0xf2048000  ! 4606: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf8054000  ! 4607: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf40421ee  ! 4608: LDUW_I	lduw	[%r16 + 0x01ee], %r26
	.word 0xfa4d600d  ! 4612: LDSB_I	ldsb	[%r21 + 0x000d], %r29
	setx	data_start_1, %g1, %r19
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e0cb  ! 4617: WRPR_TNPC_I	wrpr	%r23, 0x00cb, %tnpc
	.word 0xf31ce15d  ! 4618: LDDF_I	ldd	[%r19, 0x015d], %f25
	.word 0x8194208d  ! 4619: WRPR_TPC_I	wrpr	%r16, 0x008d, %tpc
	.word 0xf61c8000  ! 4621: LDD_R	ldd	[%r18 + %r0], %r27
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845613d  ! 4627: LDSW_I	ldsw	[%r21 + 0x013d], %r28
	.word 0xbf508000  ! 4630: RDPR_TSTATE	<illegal instruction>
	.word 0xf84de0dd  ! 4633: LDSB_I	ldsb	[%r23 + 0x00dd], %r28
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41460c4  ! 4635: LDUH_I	lduh	[%r17 + 0x00c4], %r26
	.word 0xff1ce08d  ! 4641: LDDF_I	ldd	[%r19, 0x008d], %f31
	.word 0xf6146017  ! 4645: LDUH_I	lduh	[%r17 + 0x0017], %r27
	.word 0x89946099  ! 4646: WRPR_TICK_I	wrpr	%r17, 0x0099, %tick
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 4650: RDPR_TICK	<illegal instruction>
	.word 0xf61da088  ! 4652: LDD_I	ldd	[%r22 + 0x0088], %r27
	.word 0xf25ca15a  ! 4653: LDX_I	ldx	[%r18 + 0x015a], %r25
	.word 0xfa4cc000  ! 4657: LDSB_R	ldsb	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983951  ! 4658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1951, %hpstate
	.word 0xf4148000  ! 4661: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf85d60e4  ! 4664: LDX_I	ldx	[%r21 + 0x00e4], %r28
	.word 0xb22c4000  ! 4666: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xf11c4000  ! 4667: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xbf350000  ! 4672: SRL_R	srl 	%r20, %r0, %r31
	.word 0xfd1ca06d  ! 4676: LDDF_I	ldd	[%r18, 0x006d], %f30
	.word 0xf64ca1ce  ! 4684: LDSB_I	ldsb	[%r18 + 0x01ce], %r27
	.word 0x9194e1df  ! 4685: WRPR_PIL_I	wrpr	%r19, 0x01df, %pil
	.word 0xf4046150  ! 4686: LDUW_I	lduw	[%r17 + 0x0150], %r26
	.word 0xb02dc000  ! 4687: ANDN_R	andn 	%r23, %r0, %r24
	.word 0xf0050000  ! 4691: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf81d2006  ! 4694: LDD_I	ldd	[%r20 + 0x0006], %r28
	.word 0xf245c000  ! 4695: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb444c000  ! 4696: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xf61dc000  ! 4697: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf614c000  ! 4698: LDUH_R	lduh	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a073  ! 4706: WRPR_PSTATE_I	wrpr	%r18, 0x0073, %pstate
	.word 0xf8454000  ! 4707: LDSW_R	ldsw	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982809  ! 4720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0809, %hpstate
	.word 0xfc0c4000  ! 4727: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf24de1e2  ! 4729: LDSB_I	ldsb	[%r23 + 0x01e2], %r25
	.word 0xf60d4000  ! 4730: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xbf344000  ! 4731: SRL_R	srl 	%r17, %r0, %r31
	.word 0xf51d8000  ! 4734: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf25da146  ! 4737: LDX_I	ldx	[%r22 + 0x0146], %r25
	.word 0xfe4d20ec  ! 4739: LDSB_I	ldsb	[%r20 + 0x00ec], %r31
	.word 0xfa45a02a  ! 4741: LDSW_I	ldsw	[%r22 + 0x002a], %r29
	.word 0xb8054000  ! 4743: ADD_R	add 	%r21, %r0, %r28
	.word 0xf65ca1ea  ! 4744: LDX_I	ldx	[%r18 + 0x01ea], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595e047  ! 4747: WRPR_TSTATE_I	wrpr	%r23, 0x0047, %tstate
	.word 0xf814a179  ! 4748: LDUH_I	lduh	[%r18 + 0x0179], %r28
	.word 0xf004a0c2  ! 4758: LDUW_I	lduw	[%r18 + 0x00c2], %r24
	.word 0xf455602a  ! 4761: LDSH_I	ldsh	[%r21 + 0x002a], %r26
	.word 0x81946003  ! 4764: WRPR_TPC_I	wrpr	%r17, 0x0003, %tpc
	.word 0xf6146052  ! 4766: LDUH_I	lduh	[%r17 + 0x0052], %r27
	.word 0xfc5de1df  ! 4768: LDX_I	ldx	[%r23 + 0x01df], %r30
	.word 0xb9510000  ! 4769: RDPR_TICK	<illegal instruction>
	.word 0xb3643801  ! 4772: MOVcc_I	<illegal instruction>
	.word 0xfa140000  ! 4773: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xf245c000  ! 4774: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xfe1c8000  ! 4778: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0x8595a0fa  ! 4779: WRPR_TSTATE_I	wrpr	%r22, 0x00fa, %tstate
	.word 0xf855c000  ! 4780: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xfc14205e  ! 4781: LDUH_I	lduh	[%r16 + 0x005e], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982b59  ! 4782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	.word 0x8d95e124  ! 4783: WRPR_PSTATE_I	wrpr	%r23, 0x0124, %pstate
	.word 0xf01d8000  ! 4784: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0x8994e05c  ! 4785: WRPR_TICK_I	wrpr	%r19, 0x005c, %tick
	.word 0xb7508000  ! 4787: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983dd1  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd1, %hpstate
	.word 0xf614a0d2  ! 4793: LDUH_I	lduh	[%r18 + 0x00d2], %r27
	.word 0xfe154000  ! 4796: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xb5508000  ! 4797: RDPR_TSTATE	<illegal instruction>
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 4802: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 4804: RDPR_TNPC	<illegal instruction>
	.word 0x8d946042  ! 4806: WRPR_PSTATE_I	wrpr	%r17, 0x0042, %pstate
	.word 0xf71c8000  ! 4808: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xfa45e1ab  ! 4811: LDSW_I	ldsw	[%r23 + 0x01ab], %r29
	.word 0x91952057  ! 4814: WRPR_PIL_I	wrpr	%r20, 0x0057, %pil
	.word 0xfe5c8000  ! 4817: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0x839561de  ! 4819: WRPR_TNPC_I	wrpr	%r21, 0x01de, %tnpc
	.word 0xf444a144  ! 4820: LDSW_I	ldsw	[%r18 + 0x0144], %r26
	.word 0xfa040000  ! 4822: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb3641800  ! 4826: MOVcc_R	<illegal instruction>
	.word 0xbd3d2001  ! 4827: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xf8144000  ! 4830: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xb41d2168  ! 4831: XOR_I	xor 	%r20, 0x0168, %r26
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45d4000  ! 4833: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xbe9c20e3  ! 4835: XORcc_I	xorcc 	%r16, 0x00e3, %r31
	.word 0xb52ce001  ! 4837: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb824a0c9  ! 4839: SUB_I	sub 	%r18, 0x00c9, %r28
	.word 0xb3540000  ! 4844: RDPR_GL	<illegal instruction>
	.word 0xfc050000  ! 4847: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf44d8000  ! 4848: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xb3510000  ! 4850: RDPR_TICK	<illegal instruction>
	.word 0xfc5d8000  ! 4851: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xb93cd000  ! 4853: SRAX_R	srax	%r19, %r0, %r28
	.word 0xbab44000  ! 4855: ORNcc_R	orncc 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 4856: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0xf6458000  ! 4865: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xb751c000  ! 4868: RDPR_TL	<illegal instruction>
	.word 0xf0148000  ! 4870: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf6554000  ! 4871: LDSH_R	ldsh	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xf805616a  ! 4875: LDUW_I	lduw	[%r21 + 0x016a], %r28
	.word 0xb5351000  ! 4878: SRLX_R	srlx	%r20, %r0, %r26
	setx	0x20132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6450000  ! 4880: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xbe45200a  ! 4884: ADDC_I	addc 	%r20, 0x000a, %r31
	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e156  ! 4888: WRPR_PSTATE_I	wrpr	%r19, 0x0156, %pstate
	.word 0xbd2dd000  ! 4889: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xf605a0a7  ! 4891: LDUW_I	lduw	[%r22 + 0x00a7], %r27
	.word 0xfc0de009  ! 4892: LDUB_I	ldub	[%r23 + 0x0009], %r30
	.word 0xf84c4000  ! 4897: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf05da0f3  ! 4898: LDX_I	ldx	[%r22 + 0x00f3], %r24
	.word 0xf2040000  ! 4899: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xfa55e0c9  ! 4900: LDSH_I	ldsh	[%r23 + 0x00c9], %r29
	.word 0xfe454000  ! 4901: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfe0c4000  ! 4908: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xb5353001  ! 4911: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xb9504000  ! 4917: RDPR_TNPC	<illegal instruction>
	.word 0xf455c000  ! 4919: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xf6550000  ! 4920: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xbb510000  ! 4925: RDPR_TICK	<illegal instruction>
	.word 0xf05c4000  ! 4926: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf045a08c  ! 4927: LDSW_I	ldsw	[%r22 + 0x008c], %r24
	.word 0xb7348000  ! 4929: SRL_R	srl 	%r18, %r0, %r27
	.word 0xb150c000  ! 4931: RDPR_TT	<illegal instruction>
	.word 0xfe556038  ! 4932: LDSH_I	ldsh	[%r21 + 0x0038], %r31
	.word 0xb9500000  ! 4933: RDPR_TPC	<illegal instruction>
	.word 0x8994e044  ! 4934: WRPR_TICK_I	wrpr	%r19, 0x0044, %tick
	.word 0xfa550000  ! 4936: LDSH_R	ldsh	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982bdb  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdb, %hpstate
	.word 0xb9518000  ! 4944: RDPR_PSTATE	<illegal instruction>
	.word 0xbd500000  ! 4950: RDPR_TPC	<illegal instruction>
	.word 0xb2348000  ! 4957: ORN_R	orn 	%r18, %r0, %r25
	.word 0xf00c206c  ! 4959: LDUB_I	ldub	[%r16 + 0x006c], %r24
	.word 0xfd1d4000  ! 4960: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf6550000  ! 4962: LDSH_R	ldsh	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 4964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	.word 0xfe14c000  ! 4965: LDUH_R	lduh	[%r19 + %r0], %r31
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84ca1c5  ! 4967: LDSB_I	ldsb	[%r18 + 0x01c5], %r28
	.word 0xf81cc000  ! 4973: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xbb520000  ! 4976: RDPR_PIL	<illegal instruction>
	.word 0xf2048000  ! 4977: LDUW_R	lduw	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf614a064  ! 4979: LDUH_I	lduh	[%r18 + 0x0064], %r27
	.word 0xfe4da194  ! 4982: LDSB_I	ldsb	[%r22 + 0x0194], %r31
	.word 0x8794215e  ! 4983: WRPR_TT_I	wrpr	%r16, 0x015e, %tt
	.word 0xfe15e1ed  ! 4985: LDUH_I	lduh	[%r23 + 0x01ed], %r31
	.word 0xf40561ed  ! 4986: LDUW_I	lduw	[%r21 + 0x01ed], %r26
	mov	1, %r14
	.word 0xa193a000  ! 4987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe1ce045  ! 4988: LDD_I	ldd	[%r19 + 0x0045], %r31
	mov	0, %r12
	.word 0x8f932000  ! 4989: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf50c000  ! 4992: RDPR_TT	<illegal instruction>
	.word 0xf51de1f9  ! 4993: LDDF_I	ldd	[%r23, 0x01f9], %f26
	.word 0xb551c000  ! 4994: RDPR_TL	<illegal instruction>
	.word 0xf61c21fd  ! 4996: LDD_I	ldd	[%r16 + 0x01fd], %r27
	.word 0x91956089  ! 4997: WRPR_PIL_I	wrpr	%r21, 0x0089, %pil
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1aa0820  ! 4: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00560  ! 5: FSQRTq	fsqrt	
	.word 0xb9a81820  ! 6: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	0x3001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba25c000  ! 10: SUB_R	sub 	%r23, %r0, %r29
	.word 0x8395a001  ! 12: WRPR_TNPC_I	wrpr	%r22, 0x0001, %tnpc
	.word 0xb9504000  ! 13: RDPR_TNPC	<illegal instruction>
	.word 0xbba94820  ! 15: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a54920  ! 19: FMULs	fmuls	%f21, %f0, %f27
	setx	0x30029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 22: FMOVs	fmovs	%f0, %f27
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952164  ! 31: WRPR_TICK_I	wrpr	%r20, 0x0164, %tick
	.word 0xbfa4c960  ! 32: FMULq	dis not found

	.word 0x8595a07e  ! 40: WRPR_TSTATE_I	wrpr	%r22, 0x007e, %tstate
	.word 0xbda5c8a0  ! 43: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb3500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0xb1520000  ! 49: RDPR_PIL	<illegal instruction>
	.word 0xb1a90820  ! 56: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbba81820  ! 63: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbb7ce401  ! 67: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xbfab8820  ! 68: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb5518000  ! 70: RDPR_PSTATE	<illegal instruction>
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a409c0  ! 74: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb5a98820  ! 81: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3518000  ! 83: RDPR_PSTATE	<illegal instruction>
	setx	0x20115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda58920  ! 85: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb9a80820  ! 87: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1504000  ! 89: RDPR_TNPC	<illegal instruction>
	.word 0xb351c000  ! 91: RDPR_TL	<illegal instruction>
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0xbba9c820  ! 97: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0x8595e0b1  ! 99: WRPR_TSTATE_I	wrpr	%r23, 0x00b1, %tstate
	.word 0xbfa00540  ! 101: FSQRTd	fsqrt	
	.word 0xbbaa0820  ! 102: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80c20  ! 105: FMOVRLZ	dis not found

	.word 0xb7a488c0  ! 106: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb9a5c840  ! 109: FADDd	faddd	%f54, %f0, %f28
	.word 0xb5a90820  ! 112: FMOVLEU	fmovs	%fcc1, %f0, %f26
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23d4000  ! 114: XNOR_R	xnor 	%r21, %r0, %r25
	mov	2, %r12
	.word 0x8f932000  ! 117: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7aac820  ! 118: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a58820  ! 123: FADDs	fadds	%f22, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x819829d9  ! 127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0xb3a489a0  ! 129: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb7510000  ! 130: RDPR_TICK	<illegal instruction>
	.word 0xb7a40960  ! 135: FMULq	dis not found

	.word 0x8994a0ad  ! 139: WRPR_TICK_I	wrpr	%r18, 0x00ad, %tick
	.word 0x8394211e  ! 141: WRPR_TNPC_I	wrpr	%r16, 0x011e, %tnpc
	.word 0x8d9521d9  ! 142: WRPR_PSTATE_I	wrpr	%r20, 0x01d9, %pstate
	.word 0xb9a98820  ! 145: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1518000  ! 150: RDPR_PSTATE	<illegal instruction>
	.word 0x8794a097  ! 152: WRPR_TT_I	wrpr	%r18, 0x0097, %tt
	.word 0x8d956115  ! 155: WRPR_PSTATE_I	wrpr	%r21, 0x0115, %pstate
	.word 0xb8b5e1f1  ! 159: ORNcc_I	orncc 	%r23, 0x01f1, %r28
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ac4000  ! 165: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0x9194a027  ! 166: WRPR_PIL_I	wrpr	%r18, 0x0027, %pil
	.word 0xb4ac2124  ! 170: ANDNcc_I	andncc 	%r16, 0x0124, %r26
	.word 0xb5a80820  ! 172: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x8d95a1d2  ! 174: WRPR_PSTATE_I	wrpr	%r22, 0x01d2, %pstate
	setx	0x3001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946062  ! 185: WRPR_TSTATE_I	wrpr	%r17, 0x0062, %tstate
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xb9a548e0  ! 189: FSUBq	dis not found

	.word 0xb1a4c8a0  ! 190: FSUBs	fsubs	%f19, %f0, %f24
	setx	data_start_1, %g1, %r18
	.word 0xb7a4c820  ! 193: FADDs	fadds	%f19, %f0, %f27
	.word 0xb5a81c20  ! 195: FMOVRGEZ	dis not found

	.word 0xb7a81c20  ! 200: FMOVRGEZ	dis not found

	.word 0xb9a588c0  ! 201: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xba15e1d6  ! 203: OR_I	or 	%r23, 0x01d6, %r29
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xbda00040  ! 206: FMOVd	fmovd	%f0, %f30
	.word 0x83942011  ! 210: WRPR_TNPC_I	wrpr	%r16, 0x0011, %tnpc
	setx	data_start_3, %g1, %r22
	.word 0xb5aa8820  ! 216: FMOVG	fmovs	%fcc1, %f0, %f26
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 219: FMOVLE	fmovs	%fcc1, %f0, %f31
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 222: FMOVG	fmovs	%fcc1, %f0, %f25
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819561ed  ! 226: WRPR_TPC_I	wrpr	%r21, 0x01ed, %tpc
	.word 0xb7a40940  ! 228: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb5a81c20  ! 231: FMOVRGEZ	dis not found

	.word 0xb7643801  ! 232: MOVcc_I	<illegal instruction>
	.word 0xb9540000  ! 234: RDPR_GL	<illegal instruction>
	.word 0xbda98820  ! 237: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa489a0  ! 238: FDIVs	fdivs	%f18, %f0, %f31
	.word 0x9195e056  ! 239: WRPR_PIL_I	wrpr	%r23, 0x0056, %pil
	setx	data_start_1, %g1, %r23
	.word 0xbfa5c860  ! 248: FADDq	dis not found

	.word 0xbcb461e4  ! 249: SUBCcc_I	orncc 	%r17, 0x01e4, %r30
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0840000  ! 251: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xbfab4820  ! 253: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a50920  ! 259: FMULs	fmuls	%f20, %f0, %f27
	.word 0x8195e152  ! 266: WRPR_TPC_I	wrpr	%r23, 0x0152, %tpc
	.word 0xb9508000  ! 267: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a44860  ! 270: FADDq	dis not found

	.word 0xb9a4c9a0  ! 272: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb9ab4820  ! 277: FMOVCC	fmovs	%fcc1, %f0, %f28
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a509e0  ! 281: FDIVq	dis not found

	.word 0xb5a84820  ! 282: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80c20  ! 284: FMOVRLZ	dis not found

	.word 0xbda409a0  ! 286: FDIVs	fdivs	%f16, %f0, %f30
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942002  ! 289: WRPR_TT_I	wrpr	%r16, 0x0002, %tt
	.word 0xbfa80c20  ! 291: FMOVRLZ	dis not found

	.word 0xbda80820  ! 295: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb1a8c820  ! 297: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb83cc000  ! 298: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xb8ad611e  ! 301: ANDNcc_I	andncc 	%r21, 0x011e, %r28
	.word 0xbda48860  ! 302: FADDq	dis not found

	.word 0xbd500000  ! 303: RDPR_TPC	<illegal instruction>
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 306: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbdabc820  ! 316: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb17c6401  ! 317: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbe95e036  ! 319: ORcc_I	orcc 	%r23, 0x0036, %r31
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54960  ! 323: FMULq	dis not found

	.word 0xb5a4c820  ! 325: FADDs	fadds	%f19, %f0, %f26
	.word 0xbba4c9a0  ! 326: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xb9508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a5c920  ! 328: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb3a5c8e0  ! 334: FSUBq	dis not found

	.word 0xbe1c4000  ! 335: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb7a509c0  ! 336: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xbb518000  ! 337: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa00520  ! 341: FSQRTs	fsqrt	
	.word 0xbea4e106  ! 342: SUBcc_I	subcc 	%r19, 0x0106, %r31
	.word 0xb9a5c9e0  ! 345: FDIVq	dis not found

	.word 0xbd3ca001  ! 347: SRA_I	sra 	%r18, 0x0001, %r30
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0xbcc58000  ! 354: ADDCcc_R	addccc 	%r22, %r0, %r30
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 358: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0xbda81420  ! 362: FMOVRNZ	dis not found

	.word 0xb5500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xbd3ce001  ! 373: SRA_I	sra 	%r19, 0x0001, %r30
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 379: RDPR_GL	<illegal instruction>
	.word 0xb9a81420  ! 380: FMOVRNZ	dis not found

	.word 0xb5504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 398: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 402: RDPR_TNPC	<illegal instruction>
	.word 0xb9a9c820  ! 403: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbe05c000  ! 404: ADD_R	add 	%r23, %r0, %r31
	.word 0xbe844000  ! 405: ADDcc_R	addcc 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00040  ! 409: FMOVd	fmovd	%f0, %f30
	.word 0xb7a80c20  ! 412: FMOVRLZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 425: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a8c820  ! 427: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb7a408e0  ! 431: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983bc1  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc1, %hpstate
	.word 0xb5a81420  ! 435: FMOVRNZ	dis not found

	.word 0xb73d0000  ! 440: SRA_R	sra 	%r20, %r0, %r27
	.word 0xba158000  ! 441: OR_R	or 	%r22, %r0, %r29
	.word 0xb3a88820  ! 442: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a44840  ! 445: FADDd	faddd	%f48, %f0, %f58
	.word 0xb9500000  ! 447: RDPR_TPC	<illegal instruction>
	.word 0xb9a5c860  ! 450: FADDq	dis not found

	.word 0xb3aa8820  ! 453: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbda5c9e0  ! 455: FDIVq	dis not found

	.word 0xb5aa8820  ! 457: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xba954000  ! 458: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xb9a509c0  ! 459: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbba408c0  ! 460: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbba80c20  ! 462: FMOVRLZ	dis not found

	.word 0xb5a00520  ! 463: FSQRTs	fsqrt	
	.word 0xb1a54920  ! 464: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb7aac820  ! 471: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfaa8820  ! 472: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a88820  ! 473: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81c20  ! 474: FMOVRGEZ	dis not found

	.word 0xb3ab8820  ! 476: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb8444000  ! 478: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xbda80c20  ! 483: FMOVRLZ	dis not found

	.word 0xbb508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a5c9a0  ! 487: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb3a80420  ! 489: FMOVRZ	dis not found

	.word 0xb40ca11d  ! 493: AND_I	and 	%r18, 0x011d, %r26
	.word 0xbda548e0  ! 495: FSUBq	dis not found

	.word 0xb7aa4820  ! 496: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 501: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81420  ! 502: FMOVRNZ	dis not found

	.word 0xb025e002  ! 503: SUB_I	sub 	%r23, 0x0002, %r24
	.word 0xb3a00540  ! 504: FSQRTd	fsqrt	
	.word 0xbfabc820  ! 506: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a50960  ! 509: FMULq	dis not found

	.word 0xb7a80420  ! 510: FMOVRZ	dis not found

	.word 0xbb500000  ! 512: RDPR_TPC	<illegal instruction>
	.word 0x8594e1df  ! 514: WRPR_TSTATE_I	wrpr	%r19, 0x01df, %tstate
	.word 0xb9510000  ! 515: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 517: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a489c0  ! 521: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xb550c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0xbda448a0  ! 526: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb5a00540  ! 527: FSQRTd	fsqrt	
	.word 0xb4140000  ! 531: OR_R	or 	%r16, %r0, %r26
	.word 0xb9a409e0  ! 532: FDIVq	dis not found

	.word 0xbebc608a  ! 533: XNORcc_I	xnorcc 	%r17, 0x008a, %r31
	.word 0x8994e126  ! 534: WRPR_TICK_I	wrpr	%r19, 0x0126, %tick
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946047  ! 538: WRPR_PSTATE_I	wrpr	%r17, 0x0047, %pstate
	.word 0xbdaac820  ! 540: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa408a0  ! 541: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbba508e0  ! 542: FSUBq	dis not found

	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a549e0  ! 548: FDIVq	dis not found

	.word 0xb1a00540  ! 552: FSQRTd	fsqrt	
	setx	data_start_0, %g1, %r17
	.word 0xbd51c000  ! 559: RDPR_TL	<illegal instruction>
	.word 0xb61ca148  ! 562: XOR_I	xor 	%r18, 0x0148, %r27
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 565: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xbfa5c9c0  ! 569: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb5508000  ! 570: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a90820  ! 573: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a98820  ! 574: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00540  ! 582: FSQRTd	fsqrt	
	.word 0xbda489c0  ! 592: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb3a40960  ! 593: FMULq	dis not found

	.word 0x819520b8  ! 594: WRPR_TPC_I	wrpr	%r20, 0x00b8, %tpc
	mov	2, %r12
	.word 0x8f932000  ! 596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a80820  ! 597: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	.word 0xbfa84820  ! 602: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	0x1001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 605: FSQRTs	fsqrt	
	.word 0xbfa84820  ! 607: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbfaa4820  ! 611: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x8d95a05a  ! 612: WRPR_PSTATE_I	wrpr	%r22, 0x005a, %pstate
	.word 0xb9a40840  ! 614: FADDd	faddd	%f16, %f0, %f28
	.word 0xb3a588e0  ! 618: FSUBq	dis not found

	.word 0xb7a48820  ! 619: FADDs	fadds	%f18, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a588e0  ! 623: FSUBq	dis not found

	.word 0xbf520000  ! 625: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c51  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c51, %hpstate
	.word 0xbda00520  ! 627: FSQRTs	fsqrt	
	.word 0xb5aac820  ! 631: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb72dc000  ! 635: SLL_R	sll 	%r23, %r0, %r27
	mov	1, %r12
	.word 0x8f932000  ! 636: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf540000  ! 641: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	1, %r14
	.word 0xa193a000  ! 648: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8395e0e8  ! 649: WRPR_TNPC_I	wrpr	%r23, 0x00e8, %tnpc
	.word 0xbe25c000  ! 652: SUB_R	sub 	%r23, %r0, %r31
	.word 0xb7a4c9e0  ! 653: FDIVq	dis not found

	.word 0xb5a00020  ! 654: FMOVs	fmovs	%f0, %f26
	.word 0xb3a81c20  ! 656: FMOVRGEZ	dis not found

	.word 0xb29cc000  ! 669: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xbab421de  ! 672: ORNcc_I	orncc 	%r16, 0x01de, %r29
	.word 0xb3520000  ! 674: RDPR_PIL	<illegal instruction>
	.word 0xb92c0000  ! 676: SLL_R	sll 	%r16, %r0, %r28
	.word 0xb5ab4820  ! 677: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb7520000  ! 678: RDPR_PIL	<illegal instruction>
	.word 0x8594a1e8  ! 680: WRPR_TSTATE_I	wrpr	%r18, 0x01e8, %tstate
	.word 0xb9a80420  ! 686: FMOVRZ	dis not found

	.word 0xb9a40940  ! 690: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb3480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5a81820  ! 692: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb22dc000  ! 695: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xb5a84820  ! 697: FMOVE	fmovs	%fcc1, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 701: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9ab4820  ! 702: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81420  ! 712: FMOVRNZ	dis not found

	.word 0xbfa00520  ! 716: FSQRTs	fsqrt	
	setx	data_start_2, %g1, %r18
	.word 0x8194a01f  ! 724: WRPR_TPC_I	wrpr	%r18, 0x001f, %tpc
	.word 0xbbaa4820  ! 725: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 729: FMOVRLZ	dis not found

	.word 0xb5a44920  ! 730: FMULs	fmuls	%f17, %f0, %f26
	.word 0xbfa00520  ! 736: FSQRTs	fsqrt	
	.word 0xb5a80c20  ! 738: FMOVRLZ	dis not found

	.word 0xb1aa0820  ! 741: FMOVA	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f932000  ! 742: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a54960  ! 744: FMULq	dis not found

	.word 0xbd520000  ! 746: RDPR_PIL	<illegal instruction>
	.word 0xb7a4c8c0  ! 747: FSUBd	fsubd	%f50, %f0, %f58
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 751: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab4820  ! 753: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb80d608a  ! 756: AND_I	and 	%r21, 0x008a, %r28
	.word 0xb9a449e0  ! 762: FDIVq	dis not found

	.word 0xba9c8000  ! 765: XORcc_R	xorcc 	%r18, %r0, %r29
	setx	0x10031, %g1, %o0
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
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb834614c  ! 783: SUBC_I	orn 	%r17, 0x014c, %r28
	.word 0xb3508000  ! 784: RDPR_TSTATE	<illegal instruction>
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a48940  ! 790: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb4bde1af  ! 791: XNORcc_I	xnorcc 	%r23, 0x01af, %r26
	.word 0xb5a44860  ! 793: FADDq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda589e0  ! 799: FDIVq	dis not found

	.word 0xb3aa8820  ! 814: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a8c820  ! 815: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8594a120  ! 817: WRPR_TSTATE_I	wrpr	%r18, 0x0120, %tstate
	.word 0xbba58940  ! 818: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb13ca001  ! 820: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xb9a508a0  ! 823: FSUBs	fsubs	%f20, %f0, %f28
	.word 0x8195a162  ! 824: WRPR_TPC_I	wrpr	%r22, 0x0162, %tpc
	.word 0xb9641800  ! 825: MOVcc_R	<illegal instruction>
	.word 0xbfa81820  ! 827: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1abc820  ! 830: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb151c000  ! 836: RDPR_TL	<illegal instruction>
	.word 0xbfa84820  ! 838: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	0x2013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bda0d5  ! 843: XNORcc_I	xnorcc 	%r22, 0x00d5, %r28
	.word 0xb9a548a0  ! 845: FSUBs	fsubs	%f21, %f0, %f28
	setx	0x10, %g1, %o0
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
	.word 0xb5a48840  ! 854: FADDd	faddd	%f18, %f0, %f26
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9e0  ! 859: FDIVq	dis not found

	.word 0x8d95e112  ! 863: WRPR_PSTATE_I	wrpr	%r23, 0x0112, %pstate
	setx	0x3012f, %g1, %o0
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
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb22ce127  ! 873: ANDN_I	andn 	%r19, 0x0127, %r25
	.word 0xb7a588c0  ! 874: FSUBd	fsubd	%f22, %f0, %f58
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 879: RDPR_TPC	<illegal instruction>
	.word 0xbf540000  ! 881: RDPR_GL	<illegal instruction>
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a58820  ! 885: FADDs	fadds	%f22, %f0, %f28
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919521e5  ! 887: WRPR_PIL_I	wrpr	%r20, 0x01e5, %pil
	.word 0xb7a98820  ! 891: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbd510000  ! 892: RDPR_TICK	<illegal instruction>
	.word 0xbfa4c940  ! 897: FMULd	fmuld	%f50, %f0, %f62
	.word 0x8395e15e  ! 899: WRPR_TNPC_I	wrpr	%r23, 0x015e, %tnpc
	.word 0xbe35a01d  ! 900: ORN_I	orn 	%r22, 0x001d, %r31
	.word 0x8595a135  ! 901: WRPR_TSTATE_I	wrpr	%r22, 0x0135, %tstate
	.word 0xb62de1ce  ! 902: ANDN_I	andn 	%r23, 0x01ce, %r27
	.word 0xb5a00520  ! 908: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7aa8820  ! 910: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb694e059  ! 913: ORcc_I	orcc 	%r19, 0x0059, %r27
	.word 0xb1a5c860  ! 914: FADDq	dis not found

	.word 0xb8bcc000  ! 915: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xbbab8820  ! 916: FMOVPOS	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f932000  ! 917: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbdabc820  ! 920: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbab561c7  ! 921: ORNcc_I	orncc 	%r21, 0x01c7, %r29
	.word 0xb5a44820  ! 923: FADDs	fadds	%f17, %f0, %f26
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 930: MOVcc_I	<illegal instruction>
	setx	data_start_1, %g1, %r22
	.word 0xb3a00520  ! 938: FSQRTs	fsqrt	
	.word 0xbd520000  ! 940: RDPR_PIL	<illegal instruction>
	setx	0x20214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a40860  ! 942: FADDq	dis not found

	.word 0xb3520000  ! 944: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00540  ! 946: FSQRTd	fsqrt	
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 951: FMOVRLZ	dis not found

	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaaca18f  ! 959: ANDNcc_I	andncc 	%r18, 0x018f, %r29
	.word 0xb1a80820  ! 963: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab0820  ! 967: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb73c0000  ! 970: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb72d8000  ! 973: SLL_R	sll 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x8198290b  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090b, %hpstate
	.word 0xbfa8c820  ! 978: FMOVL	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94e017  ! 983: WRPR_PSTATE_I	wrpr	%r19, 0x0017, %pstate
	.word 0xb1a5c9e0  ! 984: FDIVq	dis not found

	.word 0xbf480000  ! 986: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfa509c0  ! 987: FDIVd	fdivd	%f20, %f0, %f62
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xbfa44940  ! 993: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbc1c20d9  ! 994: XOR_I	xor 	%r16, 0x00d9, %r30
	.word 0xbc35c000  ! 996: SUBC_R	orn 	%r23, %r0, %r30
	setx	0x20016, %g1, %o0
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
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 1005: FSQRTq	fsqrt	
	.word 0xb7a4c840  ! 1006: FADDd	faddd	%f50, %f0, %f58
	.word 0xbda44960  ! 1007: FMULq	dis not found

	.word 0x81952079  ! 1008: WRPR_TPC_I	wrpr	%r20, 0x0079, %tpc
	.word 0xb7a90820  ! 1009: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c9c0  ! 1011: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xbba54860  ! 1016: FADDq	dis not found

	.word 0xb750c000  ! 1018: RDPR_TT	<illegal instruction>
	.word 0xbf510000  ! 1022: RDPR_TICK	<illegal instruction>
	.word 0xb57ce401  ! 1023: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb1a00540  ! 1029: FSQRTd	fsqrt	
	.word 0xb5a81420  ! 1038: FMOVRNZ	dis not found

	.word 0xbfa94820  ! 1039: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbd3c5000  ! 1040: SRAX_R	srax	%r17, %r0, %r30
	.word 0xb1a4c8a0  ! 1044: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb5518000  ! 1045: RDPR_PSTATE	<illegal instruction>
	.word 0xb9ab8820  ! 1046: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3ab0820  ! 1047: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c960  ! 1049: FMULq	dis not found

	.word 0xb5a54960  ! 1050: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983acb  ! 1051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acb, %hpstate
	.word 0xb3aa4820  ! 1053: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb950c000  ! 1054: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9540000  ! 1057: RDPR_GL	<illegal instruction>
	.word 0xb4058000  ! 1059: ADD_R	add 	%r22, %r0, %r26
	.word 0xb7a81820  ! 1060: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	setx	data_start_2, %g1, %r17
	.word 0x8594e0c1  ! 1068: WRPR_TSTATE_I	wrpr	%r19, 0x00c1, %tstate
	.word 0x8394e090  ! 1071: WRPR_TNPC_I	wrpr	%r19, 0x0090, %tnpc
	.word 0xb150c000  ! 1073: RDPR_TT	<illegal instruction>
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba508a0  ! 1076: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa50840  ! 1078: FADDd	faddd	%f20, %f0, %f62
	.word 0xbfa4c8e0  ! 1083: FSUBq	dis not found

	.word 0xb9a5c8e0  ! 1087: FSUBq	dis not found

	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba408c0  ! 1092: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbfa40960  ! 1094: FMULq	dis not found

	.word 0xbda5c8c0  ! 1095: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb3a00520  ! 1098: FSQRTs	fsqrt	
	.word 0xbda40840  ! 1099: FADDd	faddd	%f16, %f0, %f30
	.word 0xba14a1cc  ! 1101: OR_I	or 	%r18, 0x01cc, %r29
	.word 0xb7ab8820  ! 1103: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb624e123  ! 1108: SUB_I	sub 	%r19, 0x0123, %r27
	.word 0x8195e0c5  ! 1115: WRPR_TPC_I	wrpr	%r23, 0x00c5, %tpc
	.word 0xb9a50920  ! 1117: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb3a508c0  ! 1119: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb01ca090  ! 1122: XOR_I	xor 	%r18, 0x0090, %r24
	.word 0x919561de  ! 1123: WRPR_PIL_I	wrpr	%r21, 0x01de, %pil
	.word 0xb3500000  ! 1132: RDPR_TPC	<illegal instruction>
	setx	0x30237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1134: RDPR_TICK	<illegal instruction>
	.word 0xbca40000  ! 1137: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xbba94820  ! 1138: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x8d956117  ! 1141: WRPR_PSTATE_I	wrpr	%r21, 0x0117, %pstate
	.word 0xb8ad211a  ! 1142: ANDNcc_I	andncc 	%r20, 0x011a, %r28
	.word 0x83956164  ! 1143: WRPR_TNPC_I	wrpr	%r21, 0x0164, %tnpc
	.word 0xbd34a001  ! 1144: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xb1a84820  ! 1148: FMOVE	fmovs	%fcc1, %f0, %f24
	mov	2, %r14
	.word 0xa193a000  ! 1151: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7504000  ! 1152: RDPR_TNPC	<illegal instruction>
	.word 0xbd510000  ! 1155: RDPR_TICK	<illegal instruction>
	.word 0xb5aa4820  ! 1158: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80c20  ! 1165: FMOVRLZ	dis not found

	.word 0xb3a80820  ! 1166: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 1172: FSQRTs	fsqrt	
	.word 0xb9520000  ! 1173: RDPR_PIL	<illegal instruction>
	.word 0xb1a409c0  ! 1179: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xbda4c840  ! 1180: FADDd	faddd	%f50, %f0, %f30
	.word 0xb3540000  ! 1185: RDPR_GL	<illegal instruction>
	setx	0x2022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72db001  ! 1189: SLLX_I	sllx	%r22, 0x0001, %r27
	.word 0xb1a50840  ! 1191: FADDd	faddd	%f20, %f0, %f24
	.word 0xb9a80c20  ! 1192: FMOVRLZ	dis not found

	.word 0xbb2db001  ! 1193: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb815c000  ! 1194: OR_R	or 	%r23, %r0, %r28
	.word 0xb3a80420  ! 1198: FMOVRZ	dis not found

	.word 0xb9a44940  ! 1200: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb97ce401  ! 1201: MOVR_I	movre	%r19, 0x1, %r28
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8e0  ! 1203: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982dd1  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd1, %hpstate
	.word 0xb73c2001  ! 1206: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xb9aa8820  ! 1208: FMOVG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a5c840  ! 1214: FADDd	faddd	%f54, %f0, %f56
	.word 0xb3a48860  ! 1217: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982919  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	.word 0xb3a94820  ! 1219: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00040  ! 1220: FMOVd	fmovd	%f0, %f28
	.word 0xb7ab4820  ! 1225: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0x8395a037  ! 1226: WRPR_TNPC_I	wrpr	%r22, 0x0037, %tnpc
	.word 0x8595e1cf  ! 1228: WRPR_TSTATE_I	wrpr	%r23, 0x01cf, %tstate
	.word 0x9195a09e  ! 1229: WRPR_PIL_I	wrpr	%r22, 0x009e, %pil
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 1236: FSQRTs	fsqrt	
	.word 0xba0561eb  ! 1239: ADD_I	add 	%r21, 0x01eb, %r29
	.word 0x8d9561e2  ! 1240: WRPR_PSTATE_I	wrpr	%r21, 0x01e2, %pstate
	.word 0xbfa58920  ! 1242: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbd540000  ! 1243: RDPR_GL	<illegal instruction>
	.word 0xb1a88820  ! 1245: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb8c44000  ! 1249: ADDCcc_R	addccc 	%r17, %r0, %r28
	.word 0xb5aac820  ! 1251: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x839420c0  ! 1253: WRPR_TNPC_I	wrpr	%r16, 0x00c0, %tnpc
	.word 0xbb50c000  ! 1254: RDPR_TT	<illegal instruction>
	.word 0xb5a00520  ! 1258: FSQRTs	fsqrt	
	.word 0xb9a588a0  ! 1261: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb7a00040  ! 1262: FMOVd	fmovd	%f0, %f58
	.word 0x8995a129  ! 1263: WRPR_TICK_I	wrpr	%r22, 0x0129, %tick
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c960  ! 1267: FMULq	dis not found

	.word 0xbda00020  ! 1273: FMOVs	fmovs	%f0, %f30
	setx	0x10017, %g1, %o0
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
	.word 0xbd540000  ! 1280: RDPR_GL	<illegal instruction>
	.word 0xbfa00040  ! 1281: FMOVd	fmovd	%f0, %f62
	.word 0xb1a8c820  ! 1291: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	0x30e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30017, %g1, %o0
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
	.word 0xb7ab4820  ! 1300: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb6254000  ! 1304: SUB_R	sub 	%r21, %r0, %r27
	setx	data_start_4, %g1, %r22
	.word 0x8d95e150  ! 1308: WRPR_PSTATE_I	wrpr	%r23, 0x0150, %pstate
	.word 0xb5ab8820  ! 1309: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbd643801  ! 1310: MOVcc_I	<illegal instruction>
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 1315: FMOVs	fmovs	%f0, %f27
	.word 0xb22c0000  ! 1317: ANDN_R	andn 	%r16, %r0, %r25
	.word 0xbfa508e0  ! 1319: FSUBq	dis not found

	.word 0xbda5c820  ! 1320: FADDs	fadds	%f23, %f0, %f30
	.word 0xbb508000  ! 1321: RDPR_TSTATE	<illegal instruction>
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e162  ! 1327: WRPR_TNPC_I	wrpr	%r19, 0x0162, %tnpc
	.word 0xbd480000  ! 1329: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbba408e0  ! 1330: FSUBq	dis not found

	.word 0xbf3db001  ! 1336: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0xbdab4820  ! 1339: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0x8394e0f4  ! 1340: WRPR_TNPC_I	wrpr	%r19, 0x00f4, %tnpc
	.word 0xb5510000  ! 1343: RDPR_TICK	<illegal instruction>
	.word 0xbfa549c0  ! 1344: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb551c000  ! 1345: RDPR_TL	<illegal instruction>
	.word 0xb1aac820  ! 1350: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	0x10201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a488c0  ! 1353: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbda489e0  ! 1355: FDIVq	dis not found

	.word 0xbf500000  ! 1357: RDPR_TPC	<illegal instruction>
	.word 0xb0340000  ! 1359: ORN_R	orn 	%r16, %r0, %r24
	.word 0xb625e118  ! 1362: SUB_I	sub 	%r23, 0x0118, %r27
	setx	data_start_3, %g1, %r17
	.word 0xbfa00020  ! 1366: FMOVs	fmovs	%f0, %f31
	.word 0xb7510000  ! 1367: RDPR_TICK	<illegal instruction>
	.word 0xbc2ca167  ! 1369: ANDN_I	andn 	%r18, 0x0167, %r30
	.word 0xb7a409e0  ! 1370: FDIVq	dis not found

	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 1377: FMOVVS	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f932000  ! 1378: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbdab0820  ! 1379: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbba549a0  ! 1381: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb3518000  ! 1384: RDPR_PSTATE	<illegal instruction>
	.word 0xb150c000  ! 1385: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 1387: RDPR_TSTATE	<illegal instruction>
	.word 0xbbab8820  ! 1388: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda5c840  ! 1389: FADDd	faddd	%f54, %f0, %f30
	.word 0xb5a00520  ! 1390: FSQRTs	fsqrt	
	.word 0xbda448e0  ! 1394: FSUBq	dis not found

	.word 0xb7a81820  ! 1395: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3a508c0  ! 1397: FSUBd	fsubd	%f20, %f0, %f56
	.word 0x8194e1e7  ! 1399: WRPR_TPC_I	wrpr	%r19, 0x01e7, %tpc
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e16d  ! 1404: WRPR_TT_I	wrpr	%r19, 0x016d, %tt
	.word 0x8995a08b  ! 1406: WRPR_TICK_I	wrpr	%r22, 0x008b, %tick
	.word 0xbda00540  ! 1412: FSQRTd	fsqrt	
	setx	data_start_3, %g1, %r18
	.word 0xb20c21b7  ! 1415: AND_I	and 	%r16, 0x01b7, %r25
	.word 0xb9a448c0  ! 1418: FSUBd	fsubd	%f48, %f0, %f28
	.word 0xbf50c000  ! 1419: RDPR_TT	<illegal instruction>
	.word 0xbba00560  ! 1422: FSQRTq	fsqrt	
	.word 0x8194a1d4  ! 1425: WRPR_TPC_I	wrpr	%r18, 0x01d4, %tpc
	mov	2, %r12
	.word 0x8f932000  ! 1427: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a4c840  ! 1428: FADDd	faddd	%f50, %f0, %f28
	.word 0xbba9c820  ! 1429: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a448a0  ! 1431: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xb3504000  ! 1432: RDPR_TNPC	<illegal instruction>
	.word 0x899560c2  ! 1433: WRPR_TICK_I	wrpr	%r21, 0x00c2, %tick
	.word 0xb7aac820  ! 1435: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb4a50000  ! 1436: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xbda8c820  ! 1437: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb1a81820  ! 1438: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbf520000  ! 1439: RDPR_PIL	<illegal instruction>
	.word 0xb1a5c8c0  ! 1440: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xbc1ce017  ! 1442: XOR_I	xor 	%r19, 0x0017, %r30
	.word 0xb3a00560  ! 1444: FSQRTq	fsqrt	
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3dc000  ! 1456: SRA_R	sra 	%r23, %r0, %r31
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73cc000  ! 1467: SRA_R	sra 	%r19, %r0, %r27
	.word 0xb3a00540  ! 1469: FSQRTd	fsqrt	
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1477: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983b91  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b91, %hpstate
	.word 0xbfab8820  ! 1482: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a5c960  ! 1486: FMULq	dis not found

	setx	data_start_6, %g1, %r20
	.word 0xbd50c000  ! 1488: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd34d000  ! 1492: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xba3d2165  ! 1495: XNOR_I	xnor 	%r20, 0x0165, %r29
	.word 0xbda88820  ! 1497: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a48860  ! 1498: FADDq	dis not found

	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe95218a  ! 1506: ORcc_I	orcc 	%r20, 0x018a, %r31
	.word 0xbda00560  ! 1512: FSQRTq	fsqrt	
	.word 0xb9a00040  ! 1515: FMOVd	fmovd	%f0, %f28
	.word 0xbda58940  ! 1516: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb5a40940  ! 1517: FMULd	fmuld	%f16, %f0, %f26
	.word 0x839520f0  ! 1519: WRPR_TNPC_I	wrpr	%r20, 0x00f0, %tnpc
	.word 0xb3a48860  ! 1522: FADDq	dis not found

	.word 0xbba5c860  ! 1523: FADDq	dis not found

	.word 0xb3a81420  ! 1526: FMOVRNZ	dis not found

	.word 0xb3500000  ! 1527: RDPR_TPC	<illegal instruction>
	.word 0xb17c4400  ! 1530: MOVR_R	movre	%r17, %r0, %r24
	.word 0xb3a44940  ! 1532: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb5a81420  ! 1536: FMOVRNZ	dis not found

	.word 0x8394e165  ! 1539: WRPR_TNPC_I	wrpr	%r19, 0x0165, %tnpc
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a408a0  ! 1542: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xb33df001  ! 1543: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb3518000  ! 1544: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa94820  ! 1547: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba5c8a0  ! 1548: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb6bd606e  ! 1549: XNORcc_I	xnorcc 	%r21, 0x006e, %r27
	.word 0xb5a80c20  ! 1552: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983adb  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1adb, %hpstate
	.word 0xb7a58860  ! 1557: FADDq	dis not found

	.word 0x9195e127  ! 1561: WRPR_PIL_I	wrpr	%r23, 0x0127, %pil
	.word 0xbda8c820  ! 1563: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00560  ! 1568: FSQRTq	fsqrt	
	.word 0xb1a98820  ! 1569: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba00520  ! 1570: FSQRTs	fsqrt	
	.word 0xbfa4c8c0  ! 1571: FSUBd	fsubd	%f50, %f0, %f62
	.word 0x8d94e1c7  ! 1572: WRPR_PSTATE_I	wrpr	%r19, 0x01c7, %pstate
	.word 0xb5510000  ! 1573: RDPR_TICK	<illegal instruction>
	.word 0x89942071  ! 1574: WRPR_TICK_I	wrpr	%r16, 0x0071, %tick
	.word 0xb6850000  ! 1581: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb7a48960  ! 1582: FMULq	dis not found

	.word 0xbba8c820  ! 1583: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80820  ! 1591: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9540000  ! 1593: RDPR_GL	<illegal instruction>
	.word 0xb7508000  ! 1595: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a4c820  ! 1597: FADDs	fadds	%f19, %f0, %f28
	.word 0xb3a00020  ! 1599: FMOVs	fmovs	%f0, %f25
	.word 0x879521ae  ! 1601: WRPR_TT_I	wrpr	%r20, 0x01ae, %tt
	.word 0xb7a80c20  ! 1605: FMOVRLZ	dis not found

	setx	data_start_3, %g1, %r23
	.word 0xbba54860  ! 1609: FADDq	dis not found

	.word 0x8795212d  ! 1610: WRPR_TT_I	wrpr	%r20, 0x012d, %tt
	.word 0xb7a00040  ! 1617: FMOVd	fmovd	%f0, %f58
	.word 0xb7a5c940  ! 1620: FMULd	fmuld	%f54, %f0, %f58
	.word 0xb5aac820  ! 1626: FMOVGE	fmovs	%fcc1, %f0, %f26
	mov	0, %r14
	.word 0xa193a000  ! 1631: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd480000  ! 1636: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9a50860  ! 1638: FADDq	dis not found

	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a1bd  ! 1643: WRPR_TNPC_I	wrpr	%r18, 0x01bd, %tnpc
	.word 0xb3aa0820  ! 1645: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbec5a08a  ! 1646: ADDCcc_I	addccc 	%r22, 0x008a, %r31
	.word 0xbba80c20  ! 1647: FMOVRLZ	dis not found

	.word 0xbba80420  ! 1648: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983913  ! 1651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1913, %hpstate
	.word 0x8d942061  ! 1653: WRPR_PSTATE_I	wrpr	%r16, 0x0061, %pstate
	.word 0xb604e06d  ! 1655: ADD_I	add 	%r19, 0x006d, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a90820  ! 1660: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa8820  ! 1661: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8995e00e  ! 1664: WRPR_TICK_I	wrpr	%r23, 0x000e, %tick
	.word 0xba8c6048  ! 1666: ANDcc_I	andcc 	%r17, 0x0048, %r29
	.word 0xb9500000  ! 1667: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 1668: FSQRTq	fsqrt	
	.word 0xb8958000  ! 1671: ORcc_R	orcc 	%r22, %r0, %r28
	.word 0xb6140000  ! 1672: OR_R	or 	%r16, %r0, %r27
	.word 0xb1a508c0  ! 1674: FSUBd	fsubd	%f20, %f0, %f24
	.word 0x8395a133  ! 1676: WRPR_TNPC_I	wrpr	%r22, 0x0133, %tnpc
	.word 0xb7a81420  ! 1684: FMOVRNZ	dis not found

	.word 0xb1510000  ! 1686: RDPR_TICK	<illegal instruction>
	.word 0xb1a98820  ! 1688: FMOVNEG	fmovs	%fcc1, %f0, %f24
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1692: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3480000  ! 1698: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7a50840  ! 1700: FADDd	faddd	%f20, %f0, %f58
	.word 0xbfa00040  ! 1703: FMOVd	fmovd	%f0, %f62
	.word 0xb80d0000  ! 1705: AND_R	and 	%r20, %r0, %r28
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa40860  ! 1709: FADDq	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 1711: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9508000  ! 1713: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 1714: RDPR_TPC	<illegal instruction>
	.word 0xbcb44000  ! 1716: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0x8794216c  ! 1722: WRPR_TT_I	wrpr	%r16, 0x016c, %tt
	.word 0xb9a94820  ! 1729: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbda90820  ! 1736: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb6452189  ! 1739: ADDC_I	addc 	%r20, 0x0189, %r27
	.word 0xb3a4c960  ! 1740: FMULq	dis not found

	setx	data_start_4, %g1, %r23
	.word 0xb9a508e0  ! 1742: FSUBq	dis not found

	.word 0xb3518000  ! 1744: RDPR_PSTATE	<illegal instruction>
	.word 0xbe2d6077  ! 1746: ANDN_I	andn 	%r21, 0x0077, %r31
	.word 0xb7a00520  ! 1748: FSQRTs	fsqrt	
	.word 0xb4056101  ! 1752: ADD_I	add 	%r21, 0x0101, %r26
	.word 0xb035214c  ! 1757: ORN_I	orn 	%r20, 0x014c, %r24
	.word 0xbb518000  ! 1758: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a448c0  ! 1759: FSUBd	fsubd	%f48, %f0, %f24
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe3ca01b  ! 1761: XNOR_I	xnor 	%r18, 0x001b, %r31
	.word 0xb3518000  ! 1766: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 1767: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb50c000  ! 1771: RDPR_TT	<illegal instruction>
	.word 0xb9a00020  ! 1775: FMOVs	fmovs	%f0, %f28
	.word 0xb7a5c8a0  ! 1777: FSUBs	fsubs	%f23, %f0, %f27
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 1782: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a8c820  ! 1784: FMOVL	fmovs	%fcc1, %f0, %f27
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a448c0  ! 1794: FSUBd	fsubd	%f48, %f0, %f28
	.word 0xb3a44920  ! 1799: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb1a54820  ! 1802: FADDs	fadds	%f21, %f0, %f24
	.word 0xb1abc820  ! 1804: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0x83956171  ! 1805: WRPR_TNPC_I	wrpr	%r21, 0x0171, %tnpc
	.word 0xb5a5c940  ! 1811: FMULd	fmuld	%f54, %f0, %f26
	setx	0x6, %g1, %o0
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
	.word 0xbda589a0  ! 1820: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xb9518000  ! 1826: RDPR_PSTATE	rdpr	%pstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983b19  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b19, %hpstate
	.word 0x899461c3  ! 1834: WRPR_TICK_I	wrpr	%r17, 0x01c3, %tick
	.word 0xb3a00040  ! 1836: FMOVd	fmovd	%f0, %f56
	.word 0xb5a00040  ! 1844: FMOVd	fmovd	%f0, %f26
	.word 0xb5a588a0  ! 1845: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xbca4c000  ! 1847: SUBcc_R	subcc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b9b  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9b, %hpstate
	.word 0xb7aa8820  ! 1851: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9358000  ! 1853: SRL_R	srl 	%r22, %r0, %r28
	.word 0xb7a81820  ! 1859: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb1aa4820  ! 1864: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a5c860  ! 1865: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb045e1d9  ! 1871: ADDC_I	addc 	%r23, 0x01d9, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982919  ! 1872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	.word 0x859461f7  ! 1873: WRPR_TSTATE_I	wrpr	%r17, 0x01f7, %tstate
	.word 0x8994e128  ! 1878: WRPR_TICK_I	wrpr	%r19, 0x0128, %tick
	.word 0xbb510000  ! 1879: RDPR_TICK	<illegal instruction>
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 1883: RDPR_TICK	<illegal instruction>
	.word 0xbec50000  ! 1885: ADDCcc_R	addccc 	%r20, %r0, %r31
	.word 0xb5ab4820  ! 1888: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0x8595e1c9  ! 1891: WRPR_TSTATE_I	wrpr	%r23, 0x01c9, %tstate
	.word 0xb9a40860  ! 1893: FADDq	dis not found

	.word 0xbba80820  ! 1895: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfab4820  ! 1896: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a409a0  ! 1899: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xbfa44840  ! 1900: FADDd	faddd	%f48, %f0, %f62
	.word 0xbb50c000  ! 1901: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0x8795e128  ! 1903: WRPR_TT_I	wrpr	%r23, 0x0128, %tt
	.word 0xb8ad6071  ! 1904: ANDNcc_I	andncc 	%r21, 0x0071, %r28
	.word 0xb3a489a0  ! 1905: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb9aa0820  ! 1906: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00520  ! 1907: FSQRTs	fsqrt	
	.word 0xb5518000  ! 1908: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa81c20  ! 1912: FMOVRGEZ	dis not found

	.word 0x839521ac  ! 1914: WRPR_TNPC_I	wrpr	%r20, 0x01ac, %tnpc
	.word 0xb9a98820  ! 1918: FMOVNEG	fmovs	%fcc1, %f0, %f28
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a100  ! 1922: WRPR_TICK_I	wrpr	%r22, 0x0100, %tick
	.word 0xb1a4c820  ! 1923: FADDs	fadds	%f19, %f0, %f24
	.word 0xb7abc820  ! 1924: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa50840  ! 1925: FADDd	faddd	%f20, %f0, %f62
	setx	data_start_1, %g1, %r23
	.word 0xb3a80420  ! 1932: FMOVRZ	dis not found

	.word 0xbd520000  ! 1934: RDPR_PIL	<illegal instruction>
	.word 0xb9a5c920  ! 1935: FMULs	fmuls	%f23, %f0, %f28
	.word 0xb5a9c820  ! 1936: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a94820  ! 1938: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0x8595a0a2  ! 1944: WRPR_TSTATE_I	wrpr	%r22, 0x00a2, %tstate
	.word 0xb7a98820  ! 1945: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbd342001  ! 1946: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xb5a81c20  ! 1948: FMOVRGEZ	dis not found

	.word 0xbbab0820  ! 1949: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r23
	.word 0xb52cd000  ! 1951: SLLX_R	sllx	%r19, %r0, %r26
	.word 0x9195e1aa  ! 1954: WRPR_PIL_I	wrpr	%r23, 0x01aa, %pil
	.word 0xbba81420  ! 1959: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	.word 0xb1a81c20  ! 1963: FMOVRGEZ	dis not found

	.word 0xb3500000  ! 1964: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8794e0c0  ! 1969: WRPR_TT_I	wrpr	%r19, 0x00c0, %tt
	.word 0xb3a8c820  ! 1971: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a40840  ! 1972: FADDd	faddd	%f16, %f0, %f24
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e005  ! 1977: WRPR_TICK_I	wrpr	%r19, 0x0005, %tick
	.word 0xb1a54820  ! 1980: FADDs	fadds	%f21, %f0, %f24
	.word 0xb5508000  ! 1981: RDPR_TSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1982: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a81420  ! 1983: FMOVRNZ	dis not found

	.word 0x87942152  ! 1986: WRPR_TT_I	wrpr	%r16, 0x0152, %tt
	.word 0x879461f7  ! 1987: WRPR_TT_I	wrpr	%r17, 0x01f7, %tt
	.word 0xbfa509e0  ! 1988: FDIVq	dis not found

	.word 0xbdaa0820  ! 1990: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	data_start_5, %g1, %r18
	.word 0xb40d4000  ! 1996: AND_R	and 	%r21, %r0, %r26
	.word 0xb80d20c2  ! 1997: AND_I	and 	%r20, 0x00c2, %r28
	.word 0xbac54000  ! 1999: ADDCcc_R	addccc 	%r21, %r0, %r29
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa58840  ! 2002: FADDd	faddd	%f22, %f0, %f62
	.word 0xb48ce0b3  ! 2006: ANDcc_I	andcc 	%r19, 0x00b3, %r26
	.word 0xb3a5c840  ! 2011: FADDd	faddd	%f54, %f0, %f56
	setx	data_start_6, %g1, %r17
	.word 0xbda00040  ! 2014: FMOVd	fmovd	%f0, %f30
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc34a0d1  ! 2017: SUBC_I	orn 	%r18, 0x00d1, %r30
	.word 0xb3a5c860  ! 2018: FADDq	dis not found

	.word 0x859520f4  ! 2020: WRPR_TSTATE_I	wrpr	%r20, 0x00f4, %tstate
	.word 0xb0b4a1e8  ! 2021: ORNcc_I	orncc 	%r18, 0x01e8, %r24
	.word 0xb5a80820  ! 2028: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3a54860  ! 2029: FADDq	dis not found

	.word 0xbba589c0  ! 2030: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbc850000  ! 2035: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xbda509e0  ! 2037: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a5c920  ! 2042: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbf354000  ! 2043: SRL_R	srl 	%r21, %r0, %r31
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a408a0  ! 2053: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xbd51c000  ! 2056: RDPR_TL	<illegal instruction>
	.word 0xb9520000  ! 2060: RDPR_PIL	<illegal instruction>
	.word 0x899560cf  ! 2062: WRPR_TICK_I	wrpr	%r21, 0x00cf, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 2063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	.word 0xb5518000  ! 2064: RDPR_PSTATE	<illegal instruction>
	.word 0xb3ab4820  ! 2067: FMOVCC	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	.word 0xbfa408c0  ! 2070: FSUBd	fsubd	%f16, %f0, %f62
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 2077: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00020  ! 2080: FMOVs	fmovs	%f0, %f28
	mov	0, %r12
	.word 0x8f932000  ! 2082: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a58960  ! 2083: FMULq	dis not found

	.word 0xbf3c4000  ! 2086: SRA_R	sra 	%r17, %r0, %r31
	.word 0xbf51c000  ! 2092: RDPR_TL	<illegal instruction>
	.word 0xb3a4c820  ! 2094: FADDs	fadds	%f19, %f0, %f25
	mov	2, %r14
	.word 0xa193a000  ! 2101: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba48940  ! 2102: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb4346050  ! 2118: ORN_I	orn 	%r17, 0x0050, %r26
	.word 0xb7a44820  ! 2120: FADDs	fadds	%f17, %f0, %f27
	.word 0x8395a0a1  ! 2121: WRPR_TNPC_I	wrpr	%r22, 0x00a1, %tnpc
	.word 0xb5a509a0  ! 2126: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb7a5c8c0  ! 2127: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb9508000  ! 2131: RDPR_TSTATE	<illegal instruction>
	setx	0x10223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 2134: RDPR_TL	<illegal instruction>
	.word 0xb9a408e0  ! 2136: FSUBq	dis not found

	.word 0x83952106  ! 2142: WRPR_TNPC_I	wrpr	%r20, 0x0106, %tnpc
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a588e0  ! 2144: FSUBq	dis not found

	.word 0xbaa4e096  ! 2145: SUBcc_I	subcc 	%r19, 0x0096, %r29
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 2147: MOVcc_I	<illegal instruction>
	.word 0xb4844000  ! 2148: ADDcc_R	addcc 	%r17, %r0, %r26
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 2152: FMOVs	fmovs	%f0, %f31
	.word 0xb3480000  ! 2155: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbba589a0  ! 2158: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbba44940  ! 2163: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb3510000  ! 2166: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7508000  ! 2170: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 2173: RDPR_TNPC	<illegal instruction>
	.word 0xbfa4c940  ! 2175: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbda00020  ! 2177: FMOVs	fmovs	%f0, %f30
	.word 0xb5a44960  ! 2180: FMULq	dis not found

	.word 0xbfa94820  ! 2183: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbe0560a4  ! 2186: ADD_I	add 	%r21, 0x00a4, %r31
	.word 0xb3a408a0  ! 2190: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xb1a00040  ! 2192: FMOVd	fmovd	%f0, %f24
	.word 0xbfa54920  ! 2197: FMULs	fmuls	%f21, %f0, %f31
	.word 0x8194e0bd  ! 2198: WRPR_TPC_I	wrpr	%r19, 0x00bd, %tpc
	.word 0xb5500000  ! 2206: RDPR_TPC	<illegal instruction>
	.word 0xb13c5000  ! 2211: SRAX_R	srax	%r17, %r0, %r24
	.word 0xbda80c20  ! 2212: FMOVRLZ	dis not found

	.word 0xb5ab0820  ! 2214: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0x8d94216b  ! 2216: WRPR_PSTATE_I	wrpr	%r16, 0x016b, %pstate
	.word 0xb9a00520  ! 2217: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982b93  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0xbd520000  ! 2221: RDPR_PIL	<illegal instruction>
	.word 0xb3504000  ! 2223: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 2228: RDPR_TNPC	<illegal instruction>
	.word 0xb351c000  ! 2229: RDPR_TL	<illegal instruction>
	.word 0xb9aa0820  ! 2231: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a94820  ! 2235: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab4820  ! 2236: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a40840  ! 2237: FADDd	faddd	%f16, %f0, %f56
	.word 0xbe8d213e  ! 2240: ANDcc_I	andcc 	%r20, 0x013e, %r31
	.word 0xbda5c860  ! 2241: FADDq	dis not found

	.word 0xba158000  ! 2242: OR_R	or 	%r22, %r0, %r29
	mov	0, %r12
	.word 0x8f932000  ! 2244: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9ab8820  ! 2246: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb8352154  ! 2249: ORN_I	orn 	%r20, 0x0154, %r28
	.word 0xb1a449a0  ! 2251: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb5518000  ! 2252: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa448e0  ! 2253: FSUBq	dis not found

	.word 0xb9a448e0  ! 2254: FSUBq	dis not found

	.word 0xb5a00040  ! 2256: FMOVd	fmovd	%f0, %f26
	.word 0xbfa509a0  ! 2257: FDIVs	fdivs	%f20, %f0, %f31
	.word 0x839461d8  ! 2258: WRPR_TNPC_I	wrpr	%r17, 0x01d8, %tnpc
	.word 0x8395615a  ! 2259: WRPR_TNPC_I	wrpr	%r21, 0x015a, %tnpc
	.word 0xbdabc820  ! 2260: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0x91942141  ! 2262: WRPR_PIL_I	wrpr	%r16, 0x0141, %pil
	.word 0xb5a81c20  ! 2263: FMOVRGEZ	dis not found

	.word 0xb1a549e0  ! 2266: FDIVq	dis not found

	.word 0xbda81c20  ! 2267: FMOVRGEZ	dis not found

	.word 0xb52d2001  ! 2269: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xbfaa8820  ! 2270: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8394e102  ! 2271: WRPR_TNPC_I	wrpr	%r19, 0x0102, %tnpc
	setx	data_start_4, %g1, %r21
	.word 0xb7a00020  ! 2273: FMOVs	fmovs	%f0, %f27
	setx	data_start_6, %g1, %r17
	.word 0xb9a00540  ! 2276: FSQRTd	fsqrt	
	.word 0xb5343001  ! 2278: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb9a5c840  ! 2280: FADDd	faddd	%f54, %f0, %f28
	.word 0xb7a589e0  ! 2282: FDIVq	dis not found

	.word 0x8594a034  ! 2286: WRPR_TSTATE_I	wrpr	%r18, 0x0034, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983a43  ! 2291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a43, %hpstate
	.word 0xb2254000  ! 2295: SUB_R	sub 	%r21, %r0, %r25
	.word 0xbf500000  ! 2296: RDPR_TPC	<illegal instruction>
	.word 0xbbab8820  ! 2302: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81820  ! 2303: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 2305: RDPR_TSTATE	<illegal instruction>
	.word 0xb93d4000  ! 2307: SRA_R	sra 	%r21, %r0, %r28
	.word 0xbfa80820  ! 2315: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbeb4a0e0  ! 2317: ORNcc_I	orncc 	%r18, 0x00e0, %r31
	.word 0xbba5c820  ! 2319: FADDs	fadds	%f23, %f0, %f29
	setx	data_start_0, %g1, %r17
	.word 0xb6b4604b  ! 2330: SUBCcc_I	orncc 	%r17, 0x004b, %r27
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 2336: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa588e0  ! 2345: FSUBq	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 2348: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1540000  ! 2350: RDPR_GL	<illegal instruction>
	.word 0xb5a88820  ! 2351: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a80820  ! 2356: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 2361: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb7a80420  ! 2363: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983ec3  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec3, %hpstate
	.word 0xb824e08b  ! 2372: SUB_I	sub 	%r19, 0x008b, %r28
	.word 0xb1a90820  ! 2373: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb92d0000  ! 2374: SLL_R	sll 	%r20, %r0, %r28
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e151  ! 2377: WRPR_TSTATE_I	wrpr	%r19, 0x0151, %tstate
	.word 0xbfa90820  ! 2382: FMOVLEU	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0x8f932000  ! 2384: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a58920  ! 2386: FMULs	fmuls	%f22, %f0, %f25
	.word 0xbba589e0  ! 2387: FDIVq	dis not found

	.word 0xb7353001  ! 2393: SRLX_I	srlx	%r20, 0x0001, %r27
	.word 0xbd510000  ! 2394: RDPR_TICK	<illegal instruction>
	.word 0xbfa50820  ! 2396: FADDs	fadds	%f20, %f0, %f31
	.word 0xbfa58820  ! 2398: FADDs	fadds	%f22, %f0, %f31
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 2405: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a448e0  ! 2409: FSUBq	dis not found

	.word 0xb7a54920  ! 2410: FMULs	fmuls	%f21, %f0, %f27
	.word 0xbf641800  ! 2413: MOVcc_R	<illegal instruction>
	.word 0xb4b58000  ! 2415: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0xbba48820  ! 2416: FADDs	fadds	%f18, %f0, %f29
	.word 0xb12cd000  ! 2422: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xb7a8c820  ! 2425: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81820  ! 2428: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba88820  ! 2433: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9510000  ! 2434: RDPR_TICK	<illegal instruction>
	.word 0xb5a00540  ! 2436: FSQRTd	fsqrt	
	.word 0xbda00540  ! 2437: FSQRTd	fsqrt	
	.word 0xb3518000  ! 2438: RDPR_PSTATE	<illegal instruction>
	.word 0xbd518000  ! 2442: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a80820  ! 2444: FMOVN	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r16
	.word 0xbfa508e0  ! 2446: FSUBq	dis not found

	.word 0xb9ab8820  ! 2447: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x30014, %g1, %o0
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
	.word 0xbbabc820  ! 2454: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81420  ! 2455: FMOVRNZ	dis not found

	.word 0xb7518000  ! 2458: RDPR_PSTATE	<illegal instruction>
	.word 0xb5504000  ! 2459: RDPR_TNPC	<illegal instruction>
	.word 0xb9a50820  ! 2462: FADDs	fadds	%f20, %f0, %f28
	.word 0xb7a4c8c0  ! 2466: FSUBd	fsubd	%f50, %f0, %f58
	.word 0x919560be  ! 2467: WRPR_PIL_I	wrpr	%r21, 0x00be, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r22
	.word 0xb5ab4820  ! 2473: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3520000  ! 2476: RDPR_PIL	<illegal instruction>
	.word 0xbfa489e0  ! 2477: FDIVq	dis not found

	.word 0xbba5c8e0  ! 2478: FSUBq	dis not found

	.word 0xbda40940  ! 2483: FMULd	fmuld	%f16, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x3011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2491: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a8c820  ! 2492: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5520000  ! 2495: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c81  ! 2497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c81, %hpstate
	.word 0xbda80820  ! 2499: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb1a44960  ! 2508: FMULq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 2510: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda88820  ! 2511: FMOVLE	fmovs	%fcc1, %f0, %f30
	mov	1, %r14
	.word 0xa193a000  ! 2514: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a81420  ! 2518: FMOVRNZ	dis not found

	.word 0xb5a489e0  ! 2522: FDIVq	dis not found

	.word 0xbb50c000  ! 2523: RDPR_TT	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2524: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a00540  ! 2526: FSQRTd	fsqrt	
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 2532: RDPR_TPC	<illegal instruction>
	.word 0xbfa54960  ! 2533: FMULq	dis not found

	.word 0xb9480000  ! 2540: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbfa00560  ! 2541: FSQRTq	fsqrt	
	.word 0xb32ca001  ! 2550: SLL_I	sll 	%r18, 0x0001, %r25
	mov	0, %r12
	.word 0x8f932000  ! 2551: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a9c820  ! 2552: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbdab8820  ! 2556: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9480000  ! 2558: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda00520  ! 2559: FSQRTs	fsqrt	
	mov	0, %r12
	.word 0x8f932000  ! 2560: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5aa8820  ! 2561: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb89d8000  ! 2564: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb7a4c860  ! 2568: FADDq	dis not found

	.word 0xb7a81420  ! 2569: FMOVRNZ	dis not found

	.word 0xbe3421df  ! 2571: SUBC_I	orn 	%r16, 0x01df, %r31
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ac6081  ! 2583: ANDNcc_I	andncc 	%r17, 0x0081, %r26
	.word 0xbdaac820  ! 2586: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a90820  ! 2587: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbdaac820  ! 2588: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a54860  ! 2589: FADDq	dis not found

	.word 0x859560e3  ! 2590: WRPR_TSTATE_I	wrpr	%r21, 0x00e3, %tstate
	.word 0xb9518000  ! 2591: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a00040  ! 2593: FMOVd	fmovd	%f0, %f56
	.word 0xb3a48920  ! 2597: FMULs	fmuls	%f18, %f0, %f25
	.word 0xb5a80820  ! 2598: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbfaac820  ! 2599: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 2600: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0x8995e16a  ! 2603: WRPR_TICK_I	wrpr	%r23, 0x016a, %tick
	.word 0xbba48960  ! 2604: FMULq	dis not found

	.word 0xb7a409a0  ! 2607: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb1a88820  ! 2613: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a489e0  ! 2616: FDIVq	dis not found

	.word 0xb77dc400  ! 2617: MOVR_R	movre	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00520  ! 2623: FSQRTs	fsqrt	
	.word 0xb7a00560  ! 2624: FSQRTq	fsqrt	
	.word 0xb8940000  ! 2625: ORcc_R	orcc 	%r16, %r0, %r28
	mov	2, %r12
	.word 0x8f932000  ! 2627: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1641800  ! 2629: MOVcc_R	<illegal instruction>
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba48960  ! 2638: FMULq	dis not found

	setx	0x1002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 2648: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x8395a0fb  ! 2649: WRPR_TNPC_I	wrpr	%r22, 0x00fb, %tnpc
	.word 0xb434c000  ! 2651: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xb9ab8820  ! 2655: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44960  ! 2660: FMULq	dis not found

	.word 0xb951c000  ! 2662: RDPR_TL	<illegal instruction>
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2667: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb7540000  ! 2669: RDPR_GL	<illegal instruction>
	.word 0xb9a9c820  ! 2670: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbba9c820  ! 2679: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbe8560ee  ! 2684: ADDcc_I	addcc 	%r21, 0x00ee, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba488e0  ! 2688: FSUBq	dis not found

	.word 0xb7a5c9e0  ! 2696: FDIVq	dis not found

	.word 0xb9518000  ! 2697: RDPR_PSTATE	<illegal instruction>
	.word 0xbba4c820  ! 2700: FADDs	fadds	%f19, %f0, %f29
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a589c0  ! 2706: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb485e16b  ! 2708: ADDcc_I	addcc 	%r23, 0x016b, %r26
	setx	data_start_5, %g1, %r18
	.word 0xb9a80820  ! 2715: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00040  ! 2716: FMOVd	fmovd	%f0, %f24
	.word 0xb21d20e0  ! 2718: XOR_I	xor 	%r20, 0x00e0, %r25
	.word 0xb9a81c20  ! 2720: FMOVRGEZ	dis not found

	.word 0xb1aac820  ! 2723: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x9195e0cc  ! 2726: WRPR_PIL_I	wrpr	%r23, 0x00cc, %pil
	.word 0xb4152154  ! 2734: OR_I	or 	%r20, 0x0154, %r26
	.word 0xb9a8c820  ! 2736: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb13ca001  ! 2738: SRA_I	sra 	%r18, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 2739: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8acc000  ! 2741: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xb5a00540  ! 2742: FSQRTd	fsqrt	
	.word 0xb9aa4820  ! 2743: FMOVNE	fmovs	%fcc1, %f0, %f28
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 2746: FSQRTd	fsqrt	
	mov	0, %r12
	.word 0x8f932000  ! 2747: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a113  ! 2750: WRPR_TNPC_I	wrpr	%r22, 0x0113, %tnpc
	.word 0xbb50c000  ! 2752: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 2754: RDPR_TNPC	<illegal instruction>
	.word 0xb7a81820  ! 2756: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x8795a10b  ! 2760: WRPR_TT_I	wrpr	%r22, 0x010b, %tt
	setx	data_start_0, %g1, %r16
	.word 0xb7a58860  ! 2765: FADDq	dis not found

	.word 0xb7a9c820  ! 2766: FMOVVS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983a13  ! 2767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a13, %hpstate
	.word 0xb550c000  ! 2772: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 2774: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 2775: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 2784: RDPR_TSTATE	<illegal instruction>
	.word 0xbda588c0  ! 2786: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb7a48920  ! 2787: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb1a00520  ! 2792: FSQRTs	fsqrt	
	.word 0xbe850000  ! 2793: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xb135d000  ! 2795: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xb1ab8820  ! 2798: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbfaac820  ! 2800: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5350000  ! 2801: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb1a9c820  ! 2802: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa8820  ! 2803: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x85956032  ! 2804: WRPR_TSTATE_I	wrpr	%r21, 0x0032, %tstate
	.word 0xb3a5c820  ! 2805: FADDs	fadds	%f23, %f0, %f25
	.word 0xb3a4c940  ! 2811: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb5518000  ! 2812: RDPR_PSTATE	<illegal instruction>
	.word 0xbb50c000  ! 2815: RDPR_TT	<illegal instruction>
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4a4c000  ! 2818: SUBcc_R	subcc 	%r19, %r0, %r26
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 2821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 2825: FMOVN	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r18
	mov	0, %r14
	.word 0xa193a000  ! 2829: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a81820  ! 2832: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbba00040  ! 2839: FMOVd	fmovd	%f0, %f60
	setx	data_start_3, %g1, %r18
	.word 0xbf480000  ! 2844: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbfa98820  ! 2846: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00520  ! 2849: FSQRTs	fsqrt	
	.word 0xbba80420  ! 2850: FMOVRZ	dis not found

	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 2857: RDPR_TL	<illegal instruction>
	.word 0x879460eb  ! 2872: WRPR_TT_I	wrpr	%r17, 0x00eb, %tt
	setx	data_start_5, %g1, %r18
	.word 0xbb2dd000  ! 2878: SLLX_R	sllx	%r23, %r0, %r29
	.word 0xb7a00540  ! 2880: FSQRTd	fsqrt	
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2883: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba4c9e0  ! 2884: FDIVq	dis not found

	.word 0x8994616e  ! 2885: WRPR_TICK_I	wrpr	%r17, 0x016e, %tick
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4ad0000  ! 2887: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb3a80820  ! 2888: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a81420  ! 2892: FMOVRNZ	dis not found

	.word 0xb3a48940  ! 2893: FMULd	fmuld	%f18, %f0, %f56
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 2898: MOVcc_I	<illegal instruction>
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2909: RDPR_GL	rdpr	%-, %r31
	.word 0x8394a080  ! 2911: WRPR_TNPC_I	wrpr	%r18, 0x0080, %tnpc
	.word 0xb9a81c20  ! 2913: FMOVRGEZ	dis not found

	.word 0xbfa5c920  ! 2914: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb7a00560  ! 2918: FSQRTq	fsqrt	
	.word 0x8994e0c7  ! 2919: WRPR_TICK_I	wrpr	%r19, 0x00c7, %tick
	.word 0xb1a80820  ! 2923: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a94820  ! 2928: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbd518000  ! 2932: RDPR_PSTATE	<illegal instruction>
	.word 0xb7540000  ! 2933: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda58920  ! 2939: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb9a8c820  ! 2941: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb72de001  ! 2943: SLL_I	sll 	%r23, 0x0001, %r27
	mov	0, %r14
	.word 0xa193a000  ! 2944: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982fd9  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xbb7d8400  ! 2947: MOVR_R	movre	%r22, %r0, %r29
	.word 0xbcac0000  ! 2948: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xb5a548c0  ! 2950: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb1a90820  ! 2952: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a90820  ! 2954: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c840  ! 2957: FADDd	faddd	%f54, %f0, %f28
	.word 0xb0bda190  ! 2958: XNORcc_I	xnorcc 	%r22, 0x0190, %r24
	.word 0x8794e198  ! 2959: WRPR_TT_I	wrpr	%r19, 0x0198, %tt
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa58860  ! 2963: FADDq	dis not found

	.word 0xbf504000  ! 2964: RDPR_TNPC	<illegal instruction>
	.word 0xb1a88820  ! 2966: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a50920  ! 2968: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb9a489c0  ! 2975: FDIVd	fdivd	%f18, %f0, %f28
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xb9a84820  ! 2980: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00040  ! 2982: FMOVd	fmovd	%f0, %f58
	.word 0x8394614d  ! 2983: WRPR_TNPC_I	wrpr	%r17, 0x014d, %tnpc
	.word 0xb5518000  ! 2984: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a58960  ! 2985: FMULq	dis not found

	.word 0xb1a98820  ! 2986: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba00520  ! 2990: FSQRTs	fsqrt	
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 2997: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a54840  ! 3006: FADDd	faddd	%f52, %f0, %f24
	setx	0x209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3009: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 3011: FSQRTq	fsqrt	
	.word 0xb7a94820  ! 3014: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a5c940  ! 3022: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb9a9c820  ! 3024: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x1003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 3034: FDIVq	dis not found

	.word 0x839560bf  ! 3037: WRPR_TNPC_I	wrpr	%r21, 0x00bf, %tnpc
	.word 0xbb480000  ! 3043: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbda48920  ! 3046: FMULs	fmuls	%f18, %f0, %f30
	.word 0xb3a4c860  ! 3047: FADDq	dis not found

	.word 0xb1a88820  ! 3054: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7ab4820  ! 3056: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0x8395a16d  ! 3059: WRPR_TNPC_I	wrpr	%r22, 0x016d, %tnpc
	.word 0xb5a448c0  ! 3060: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb7a589a0  ! 3065: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb551c000  ! 3067: RDPR_TL	<illegal instruction>
	.word 0xb9a448e0  ! 3068: FSUBq	dis not found

	setx	0x33f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6344000  ! 3075: SUBC_R	orn 	%r17, %r0, %r27
	.word 0xb1a00540  ! 3080: FSQRTd	fsqrt	
	setx	0x121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946192  ! 3082: WRPR_TSTATE_I	wrpr	%r17, 0x0192, %tstate
	.word 0xb7aac820  ! 3084: FMOVGE	fmovs	%fcc1, %f0, %f27
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879420eb  ! 3088: WRPR_TT_I	wrpr	%r16, 0x00eb, %tt
	.word 0xbba509c0  ! 3090: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xbdab8820  ! 3095: FMOVPOS	fmovs	%fcc1, %f0, %f30
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32d1000  ! 3101: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xbfa448c0  ! 3103: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb9508000  ! 3105: RDPR_TSTATE	<illegal instruction>
	.word 0x81946148  ! 3106: WRPR_TPC_I	wrpr	%r17, 0x0148, %tpc
	.word 0x899460a8  ! 3112: WRPR_TICK_I	wrpr	%r17, 0x00a8, %tick
	.word 0xbda88820  ! 3117: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80420  ! 3118: FMOVRZ	dis not found

	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a0b4  ! 3122: WRPR_TSTATE_I	wrpr	%r22, 0x00b4, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 3125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	.word 0xb9508000  ! 3127: RDPR_TSTATE	<illegal instruction>
	.word 0xbb518000  ! 3128: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa489c0  ! 3131: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb1a80420  ! 3135: FMOVRZ	dis not found

	.word 0xb5a90820  ! 3136: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a48940  ! 3138: FMULd	fmuld	%f18, %f0, %f26
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e19c  ! 3142: WRPR_PSTATE_I	wrpr	%r23, 0x019c, %pstate
	.word 0xb9a588a0  ! 3149: FSUBs	fsubs	%f22, %f0, %f28
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba48940  ! 3152: FMULd	fmuld	%f18, %f0, %f60
	.word 0x8594e010  ! 3156: WRPR_TSTATE_I	wrpr	%r19, 0x0010, %tstate
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 3158: FMOVNEG	fmovs	%fcc1, %f0, %f28
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	.word 0xbb7c6401  ! 3163: MOVR_I	movre	%r17, 0x1, %r29
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3167: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8595a167  ! 3173: WRPR_TSTATE_I	wrpr	%r22, 0x0167, %tstate
	.word 0xb7a80820  ! 3176: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb2c4c000  ! 3180: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xb9a448c0  ! 3185: FSUBd	fsubd	%f48, %f0, %f28
	mov	0, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a80820  ! 3190: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbbaac820  ! 3192: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0x8395a161  ! 3193: WRPR_TNPC_I	wrpr	%r22, 0x0161, %tnpc
	mov	2, %r14
	.word 0xa193a000  ! 3195: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982849  ! 3198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0849, %hpstate
	.word 0xb1a8c820  ! 3200: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 3207: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb80da139  ! 3209: AND_I	and 	%r22, 0x0139, %r28
	.word 0xb7480000  ! 3210: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d956188  ! 3211: WRPR_PSTATE_I	wrpr	%r21, 0x0188, %pstate
	.word 0xb7a58860  ! 3214: FADDq	dis not found

	.word 0xb9aa0820  ! 3215: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb9a44860  ! 3216: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 3220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xb7aac820  ! 3222: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a40820  ! 3223: FADDs	fadds	%f16, %f0, %f25
	setx	data_start_6, %g1, %r16
	.word 0xbda00560  ! 3230: FSQRTq	fsqrt	
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3d8000  ! 3239: SRA_R	sra 	%r22, %r0, %r29
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e0a8  ! 3243: WRPR_TSTATE_I	wrpr	%r19, 0x00a8, %tstate
	.word 0xb1a00040  ! 3245: FMOVd	fmovd	%f0, %f24
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3251: FSQRTd	fsqrt	
	.word 0xbfa489c0  ! 3254: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xbf2c8000  ! 3255: SLL_R	sll 	%r18, %r0, %r31
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3261: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983e91  ! 3264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e91, %hpstate
	.word 0xbba4c840  ! 3267: FADDd	faddd	%f50, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a58860  ! 3270: FADDq	dis not found

	.word 0x8195a11d  ! 3272: WRPR_TPC_I	wrpr	%r22, 0x011d, %tpc
	.word 0x899560e0  ! 3277: WRPR_TICK_I	wrpr	%r21, 0x00e0, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982801  ! 3285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0801, %hpstate
	.word 0x899421f1  ! 3287: WRPR_TICK_I	wrpr	%r16, 0x01f1, %tick
	.word 0xbfa589e0  ! 3293: FDIVq	dis not found

	setx	data_start_4, %g1, %r22
	mov	2, %r12
	.word 0x8f932000  ! 3296: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 3299: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5a00040  ! 3300: FMOVd	fmovd	%f0, %f26
	.word 0xb3a00540  ! 3301: FSQRTd	fsqrt	
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba489c0  ! 3303: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xbda548c0  ! 3305: FSUBd	fsubd	%f52, %f0, %f30
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 3309: FSQRTd	fsqrt	
	.word 0xb7a489a0  ! 3310: FDIVs	fdivs	%f18, %f0, %f27
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 3320: RDPR_TL	<illegal instruction>
	.word 0xb9a488e0  ! 3322: FSUBq	dis not found

	.word 0x8d95a024  ! 3323: WRPR_PSTATE_I	wrpr	%r22, 0x0024, %pstate
	.word 0xb9a448e0  ! 3324: FSUBq	dis not found

	.word 0xb9ab8820  ! 3325: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	data_start_7, %g1, %r19
	.word 0x9195a0df  ! 3337: WRPR_PIL_I	wrpr	%r22, 0x00df, %pil
	.word 0xbfa508a0  ! 3338: FSUBs	fsubs	%f20, %f0, %f31
	mov	0, %r12
	.word 0x8f932000  ! 3340: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a00540  ! 3342: FSQRTd	fsqrt	
	.word 0x8d94604e  ! 3343: WRPR_PSTATE_I	wrpr	%r17, 0x004e, %pstate
	.word 0xb934e001  ! 3344: SRL_I	srl 	%r19, 0x0001, %r28
	.word 0xbebcc000  ! 3348: XNORcc_R	xnorcc 	%r19, %r0, %r31
	.word 0xb9a80420  ! 3350: FMOVRZ	dis not found

	.word 0xb1a90820  ! 3351: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb0ac8000  ! 3358: ANDNcc_R	andncc 	%r18, %r0, %r24
	.word 0xb3a509a0  ! 3360: FDIVs	fdivs	%f20, %f0, %f25
	mov	2, %r14
	.word 0xa193a000  ! 3363: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a5c8e0  ! 3364: FSUBq	dis not found

	.word 0x8195e19a  ! 3365: WRPR_TPC_I	wrpr	%r23, 0x019a, %tpc
	.word 0xbc0cc000  ! 3366: AND_R	and 	%r19, %r0, %r30
	.word 0xbda50860  ! 3368: FADDq	dis not found

	setx	data_start_3, %g1, %r17
	.word 0xb3504000  ! 3370: RDPR_TNPC	<illegal instruction>
	.word 0xbba81420  ! 3372: FMOVRNZ	dis not found

	setx	data_start_5, %g1, %r17
	.word 0xbfa80820  ! 3377: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb5518000  ! 3383: RDPR_PSTATE	<illegal instruction>
	.word 0xb1ab0820  ! 3385: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00520  ! 3386: FSQRTs	fsqrt	
	mov	1, %r12
	.word 0x8f932000  ! 3389: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3641800  ! 3390: MOVcc_R	<illegal instruction>
	.word 0xbfa449c0  ! 3393: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb62520ed  ! 3396: SUB_I	sub 	%r20, 0x00ed, %r27
	.word 0xb9a4c9e0  ! 3398: FDIVq	dis not found

	.word 0xb9480000  ! 3400: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9a449e0  ! 3402: FDIVq	dis not found

	.word 0xbda58860  ! 3403: FADDq	dis not found

	.word 0xb7a408a0  ! 3407: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbfa88820  ! 3408: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00540  ! 3409: FSQRTd	fsqrt	
	.word 0xb351c000  ! 3410: RDPR_TL	<illegal instruction>
	.word 0xb5344000  ! 3415: SRL_R	srl 	%r17, %r0, %r26
	mov	2, %r14
	.word 0xa193a000  ! 3416: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda589c0  ! 3418: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xbbab0820  ! 3421: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3424: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb1510000  ! 3425: RDPR_TICK	<illegal instruction>
	.word 0xb7ab8820  ! 3429: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba449a0  ! 3431: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb9a4c9e0  ! 3432: FDIVq	dis not found

	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12d7001  ! 3435: SLLX_I	sllx	%r21, 0x0001, %r24
	.word 0xb3ab4820  ! 3436: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c8a0  ! 3437: FSUBs	fsubs	%f19, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	2, %r14
	.word 0xa193a000  ! 3443: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba98820  ! 3444: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 3450: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb4c5c000  ! 3453: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xbb504000  ! 3459: RDPR_TNPC	<illegal instruction>
	.word 0xb7a449c0  ! 3461: FDIVd	fdivd	%f48, %f0, %f58
	setx	0x114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 3470: RDPR_GL	<illegal instruction>
	.word 0xb9a81820  ! 3472: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb1508000  ! 3475: RDPR_TSTATE	<illegal instruction>
	.word 0x8995202a  ! 3480: WRPR_TICK_I	wrpr	%r20, 0x002a, %tick
	.word 0xb89d608f  ! 3482: XORcc_I	xorcc 	%r21, 0x008f, %r28
	.word 0xbda98820  ! 3484: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb7abc820  ! 3490: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb35f001  ! 3493: SRLX_I	srlx	%r23, 0x0001, %r29
	.word 0xbba40960  ! 3494: FMULq	dis not found

	.word 0xb9500000  ! 3498: RDPR_TPC	<illegal instruction>
	.word 0x89946172  ! 3500: WRPR_TICK_I	wrpr	%r17, 0x0172, %tick
	.word 0xb9a00560  ! 3501: FSQRTq	fsqrt	
	.word 0xb3a90820  ! 3503: FMOVLEU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a50840  ! 3505: FADDd	faddd	%f20, %f0, %f58
	.word 0x879521e1  ! 3507: WRPR_TT_I	wrpr	%r20, 0x01e1, %tt
	.word 0xb5a81820  ! 3516: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb480000  ! 3518: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_5, %g1, %r21
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda508e0  ! 3526: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x819839c9  ! 3528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c9, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 3529: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a409e0  ! 3530: FDIVq	dis not found

	.word 0xbb480000  ! 3531: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb1a44940  ! 3533: FMULd	fmuld	%f48, %f0, %f24
	.word 0xb5a5c8c0  ! 3536: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb9a80820  ! 3538: FMOVN	fmovs	%fcc1, %f0, %f28
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e1b2  ! 3541: WRPR_TNPC_I	wrpr	%r19, 0x01b2, %tnpc
	.word 0xb1a48920  ! 3543: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb3a5c920  ! 3545: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbe1c0000  ! 3552: XOR_R	xor 	%r16, %r0, %r31
	.word 0xbdab4820  ! 3556: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a448e0  ! 3560: FSUBq	dis not found

	.word 0xbf50c000  ! 3562: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 3564: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a40820  ! 3566: FADDs	fadds	%f16, %f0, %f24
	.word 0x879561c3  ! 3567: WRPR_TT_I	wrpr	%r21, 0x01c3, %tt
	.word 0xb1aac820  ! 3568: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a5c8a0  ! 3569: FSUBs	fsubs	%f23, %f0, %f25
	.word 0x8795619f  ! 3570: WRPR_TT_I	wrpr	%r21, 0x019f, %tt
	.word 0xbf51c000  ! 3571: RDPR_TL	<illegal instruction>
	.word 0xb1a80c20  ! 3572: FMOVRLZ	dis not found

	.word 0xbba9c820  ! 3576: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0x8995e052  ! 3578: WRPR_TICK_I	wrpr	%r23, 0x0052, %tick
	.word 0xbda81420  ! 3579: FMOVRNZ	dis not found

	.word 0xbfa5c8c0  ! 3580: FSUBd	fsubd	%f54, %f0, %f62
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 3587: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a94820  ! 3590: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbf500000  ! 3592: RDPR_TPC	<illegal instruction>
	.word 0xbdab4820  ! 3594: FMOVCC	fmovs	%fcc1, %f0, %f30
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 3598: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda80820  ! 3602: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0x839561e2  ! 3603: WRPR_TNPC_I	wrpr	%r21, 0x01e2, %tnpc
	.word 0xbda4c9a0  ! 3605: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb1a489e0  ! 3606: FDIVq	dis not found

	.word 0xb7a81c20  ! 3607: FMOVRGEZ	dis not found

	.word 0xb9a44820  ! 3609: FADDs	fadds	%f17, %f0, %f28
	.word 0xb9a81820  ! 3611: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb9a58920  ! 3612: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb9a81c20  ! 3613: FMOVRGEZ	dis not found

	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 3618: MOVcc_R	<illegal instruction>
	.word 0xbb3db001  ! 3620: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xb750c000  ! 3622: RDPR_TT	<illegal instruction>
	.word 0x9195e1a3  ! 3625: WRPR_PIL_I	wrpr	%r23, 0x01a3, %pil
	.word 0x85946041  ! 3627: WRPR_TSTATE_I	wrpr	%r17, 0x0041, %tstate
	.word 0xb3ab0820  ! 3629: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a448a0  ! 3631: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xbfa80820  ! 3636: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a54860  ! 3642: FADDq	dis not found

	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54960  ! 3648: FMULq	dis not found

	.word 0x8594a13e  ! 3652: WRPR_TSTATE_I	wrpr	%r18, 0x013e, %tstate
	.word 0xbf50c000  ! 3656: RDPR_TT	<illegal instruction>
	.word 0xb1a449e0  ! 3659: FDIVq	dis not found

	.word 0xb9a488e0  ! 3663: FSUBq	dis not found

	.word 0xbf2d8000  ! 3664: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb5a84820  ! 3665: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb4bd0000  ! 3667: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xb215e15a  ! 3672: OR_I	or 	%r23, 0x015a, %r25
	.word 0xb3510000  ! 3673: RDPR_TICK	<illegal instruction>
	.word 0xb93cd000  ! 3675: SRAX_R	srax	%r19, %r0, %r28
	mov	1, %r12
	.word 0x8f932000  ! 3679: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x89946039  ! 3680: WRPR_TICK_I	wrpr	%r17, 0x0039, %tick
	.word 0xb3a84820  ! 3682: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbe2c4000  ! 3684: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xb7aa4820  ! 3685: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa4820  ! 3686: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda589e0  ! 3690: FDIVq	dis not found

	.word 0xb625e11f  ! 3691: SUB_I	sub 	%r23, 0x011f, %r27
	.word 0xbba40920  ! 3693: FMULs	fmuls	%f16, %f0, %f29
	.word 0xbd50c000  ! 3696: RDPR_TT	<illegal instruction>
	.word 0xb9540000  ! 3700: RDPR_GL	<illegal instruction>
	.word 0xbba50840  ! 3702: FADDd	faddd	%f20, %f0, %f60
	.word 0xb550c000  ! 3703: RDPR_TT	<illegal instruction>
	.word 0xb551c000  ! 3704: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3707: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 3710: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982ac9  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0xb5a488e0  ! 3714: FSUBq	dis not found

	.word 0x919520f8  ! 3718: WRPR_PIL_I	wrpr	%r20, 0x00f8, %pil
	.word 0xb1a449e0  ! 3720: FDIVq	dis not found

	.word 0xb9a90820  ! 3726: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb3500000  ! 3728: RDPR_TPC	<illegal instruction>
	.word 0xbbab0820  ! 3729: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa98820  ! 3731: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa4820  ! 3733: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa0820  ! 3734: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a50960  ! 3735: FMULq	dis not found

	.word 0xb7a94820  ! 3736: FMOVCS	fmovs	%fcc1, %f0, %f27
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 3745: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8d9560aa  ! 3749: WRPR_PSTATE_I	wrpr	%r21, 0x00aa, %pstate
	.word 0x9194e16e  ! 3750: WRPR_PIL_I	wrpr	%r19, 0x016e, %pil
	mov	1, %r12
	.word 0x8f932000  ! 3754: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa54920  ! 3757: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb3480000  ! 3761: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 3769: RDPR_TPC	<illegal instruction>
	.word 0xb7a00540  ! 3770: FSQRTd	fsqrt	
	.word 0xb7a00520  ! 3771: FSQRTs	fsqrt	
	mov	1, %r12
	.word 0x8f932000  ! 3772: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbab54000  ! 3774: SUBCcc_R	orncc 	%r21, %r0, %r29
	.word 0xba9c0000  ! 3775: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xbd540000  ! 3781: RDPR_GL	<illegal instruction>
	.word 0xb3a4c820  ! 3782: FADDs	fadds	%f19, %f0, %f25
	.word 0xbbaa8820  ! 3783: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00520  ! 3784: FSQRTs	fsqrt	
	.word 0xb1a80c20  ! 3785: FMOVRLZ	dis not found

	.word 0x8995a0e3  ! 3786: WRPR_TICK_I	wrpr	%r22, 0x00e3, %tick
	.word 0xbe25212b  ! 3795: SUB_I	sub 	%r20, 0x012b, %r31
	.word 0xbf2c8000  ! 3796: SLL_R	sll 	%r18, %r0, %r31
	.word 0xb7a90820  ! 3798: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 3800: FSQRTs	fsqrt	
	.word 0xbba50940  ! 3801: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb1a81420  ! 3802: FMOVRNZ	dis not found

	.word 0xbbabc820  ! 3804: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb3ab0820  ! 3809: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda80420  ! 3810: FMOVRZ	dis not found

	.word 0xbba80820  ! 3811: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3518000  ! 3812: RDPR_PSTATE	<illegal instruction>
	.word 0xbdab8820  ! 3817: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfab4820  ! 3818: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0x8795a0db  ! 3819: WRPR_TT_I	wrpr	%r22, 0x00db, %tt
	.word 0x859421eb  ! 3822: WRPR_TSTATE_I	wrpr	%r16, 0x01eb, %tstate
	.word 0xbfa98820  ! 3823: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5643801  ! 3825: MOVcc_I	<illegal instruction>
	.word 0xb1480000  ! 3827: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9a44820  ! 3828: FADDs	fadds	%f17, %f0, %f28
	.word 0x81952000  ! 3832: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb9480000  ! 3835: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7a00560  ! 3839: FSQRTq	fsqrt	
	.word 0xb52c8000  ! 3844: SLL_R	sll 	%r18, %r0, %r26
	.word 0xb7ab0820  ! 3845: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb1641800  ! 3846: MOVcc_R	<illegal instruction>
	.word 0xb9540000  ! 3849: RDPR_GL	<illegal instruction>
	.word 0xb7a489e0  ! 3850: FDIVq	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 3851: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a588e0  ! 3852: FSUBq	dis not found

	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94202b  ! 3857: WRPR_PSTATE_I	wrpr	%r16, 0x002b, %pstate
	.word 0x8994a146  ! 3858: WRPR_TICK_I	wrpr	%r18, 0x0146, %tick
	mov	2, %r14
	.word 0xa193a000  ! 3859: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a80420  ! 3861: FMOVRZ	dis not found

	.word 0xbd540000  ! 3864: RDPR_GL	<illegal instruction>
	.word 0xb3a448e0  ! 3868: FSUBq	dis not found

	.word 0xb7a81c20  ! 3869: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8b5a122  ! 3877: SUBCcc_I	orncc 	%r22, 0x0122, %r28
	.word 0xbfaa8820  ! 3879: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	1, %r14
	.word 0xa193a000  ! 3884: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5a5c9e0  ! 3885: FDIVq	dis not found

	setx	data_start_6, %g1, %r22
	mov	1, %r14
	.word 0xa193a000  ! 3891: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa81420  ! 3892: FMOVRNZ	dis not found

	.word 0x8d9560a8  ! 3893: WRPR_PSTATE_I	wrpr	%r21, 0x00a8, %pstate
	.word 0xb6354000  ! 3895: ORN_R	orn 	%r21, %r0, %r27
	.word 0xb3a408a0  ! 3897: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbfa84820  ! 3899: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a5c9e0  ! 3900: FDIVq	dis not found

	.word 0xb72d8000  ! 3901: SLL_R	sll 	%r22, %r0, %r27
	mov	0, %r12
	.word 0x8f932000  ! 3907: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9195e0d1  ! 3908: WRPR_PIL_I	wrpr	%r23, 0x00d1, %pil
	setx	0x10227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 3915: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 3921: RDPR_TNPC	<illegal instruction>
	.word 0x8994602e  ! 3922: WRPR_TICK_I	wrpr	%r17, 0x002e, %tick
	.word 0x89952033  ! 3923: WRPR_TICK_I	wrpr	%r20, 0x0033, %tick
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95605a  ! 3928: WRPR_PSTATE_I	wrpr	%r21, 0x005a, %pstate
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 3931: FMOVRNZ	dis not found

	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9520d3  ! 3936: WRPR_PSTATE_I	wrpr	%r20, 0x00d3, %pstate
	setx	data_start_3, %g1, %r19
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a549c0  ! 3941: FDIVd	fdivd	%f52, %f0, %f28
	setx	data_start_0, %g1, %r22
	.word 0xb5a58940  ! 3952: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb1540000  ! 3953: RDPR_GL	<illegal instruction>
	.word 0xb0340000  ! 3954: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xba9c0000  ! 3960: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xbba81c20  ! 3968: FMOVRGEZ	dis not found

	.word 0x8194e025  ! 3971: WRPR_TPC_I	wrpr	%r19, 0x0025, %tpc
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 3974: RDPR_GL	<illegal instruction>
	.word 0xbf540000  ! 3975: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 3978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xb9a4c9a0  ! 3983: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xbb510000  ! 3987: RDPR_TICK	<illegal instruction>
	.word 0xbfa4c820  ! 3988: FADDs	fadds	%f19, %f0, %f31
	.word 0xb3ab0820  ! 3989: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba509e0  ! 3990: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xb3a5c9c0  ! 3994: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xbfa58920  ! 4002: FMULs	fmuls	%f22, %f0, %f31
	setx	0x11a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 4005: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 4010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	.word 0xb9a54940  ! 4015: FMULd	fmuld	%f52, %f0, %f28
	.word 0x8d95a0c5  ! 4016: WRPR_PSTATE_I	wrpr	%r22, 0x00c5, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a90820  ! 4019: FMOVLEU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 4022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xbfa00020  ! 4028: FMOVs	fmovs	%f0, %f31
	.word 0xb3a5c8e0  ! 4029: FSUBq	dis not found

	.word 0x8395e0e1  ! 4031: WRPR_TNPC_I	wrpr	%r23, 0x00e1, %tnpc
	setx	data_start_7, %g1, %r23
	.word 0xbd500000  ! 4033: RDPR_TPC	<illegal instruction>
	.word 0xbd520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xb9abc820  ! 4037: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xba2c20e7  ! 4040: ANDN_I	andn 	%r16, 0x00e7, %r29
	.word 0xb3500000  ! 4041: RDPR_TPC	<illegal instruction>
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a509a0  ! 4046: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb1540000  ! 4051: RDPR_GL	<illegal instruction>
	.word 0xb5480000  ! 4053: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4061: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xb9a588e0  ! 4063: FSUBq	dis not found

	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 4071: RDPR_GL	<illegal instruction>
	.word 0xb9aa8820  ! 4072: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50920  ! 4076: FMULs	fmuls	%f20, %f0, %f31
	mov	1, %r14
	.word 0xa193a000  ! 4078: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9e0  ! 4080: FDIVq	dis not found

	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 4084: RDPR_TT	<illegal instruction>
	.word 0xb3a50960  ! 4091: FMULq	dis not found

	.word 0xb485e069  ! 4094: ADDcc_I	addcc 	%r23, 0x0069, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 4097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 4100: FMOVLE	fmovs	%fcc1, %f0, %f30
	setx	data_start_3, %g1, %r20
	.word 0xbfa40920  ! 4102: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb1aa4820  ! 4106: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab8820  ! 4111: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb92df001  ! 4114: SLLX_I	sllx	%r23, 0x0001, %r28
	.word 0xbda90820  ! 4117: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a509a0  ! 4123: FDIVs	fdivs	%f20, %f0, %f24
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 4127: FADDs	fadds	%f22, %f0, %f25
	setx	data_start_2, %g1, %r21
	.word 0xbba58960  ! 4133: FMULq	dis not found

	.word 0xb5a98820  ! 4137: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0x879560ef  ! 4139: WRPR_TT_I	wrpr	%r21, 0x00ef, %tt
	.word 0xb1a5c860  ! 4140: FADDq	dis not found

	.word 0xb5a58960  ! 4143: FMULq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 4144: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e1b0  ! 4147: WRPR_TPC_I	wrpr	%r19, 0x01b0, %tpc
	.word 0xb3a5c820  ! 4149: FADDs	fadds	%f23, %f0, %f25
	.word 0xbcb40000  ! 4151: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xbd50c000  ! 4153: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 4154: RDPR_TT	<illegal instruction>
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4157: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1abc820  ! 4158: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00560  ! 4163: FSQRTq	fsqrt	
	.word 0xbfa00560  ! 4164: FSQRTq	fsqrt	
	.word 0xbfa48840  ! 4165: FADDd	faddd	%f18, %f0, %f62
	.word 0xbf500000  ! 4166: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 4167: RDPR_GL	<illegal instruction>
	.word 0xbba50960  ! 4168: FMULq	dis not found

	setx	data_start_6, %g1, %r16
	.word 0xbbab8820  ! 4174: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81420  ! 4175: FMOVRNZ	dis not found

	.word 0xb93cb001  ! 4177: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xb52c4000  ! 4184: SLL_R	sll 	%r17, %r0, %r26
	.word 0xbe3c0000  ! 4185: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xbfa58940  ! 4186: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb3504000  ! 4188: RDPR_TNPC	<illegal instruction>
	.word 0xb3a44820  ! 4190: FADDs	fadds	%f17, %f0, %f25
	.word 0xbfa509e0  ! 4191: FDIVq	dis not found

	.word 0xb3a80c20  ! 4193: FMOVRLZ	dis not found

	.word 0xb7a489e0  ! 4197: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda449e0  ! 4200: FDIVq	dis not found

	.word 0xb6ad2165  ! 4201: ANDNcc_I	andncc 	%r20, 0x0165, %r27
	.word 0xbba50960  ! 4209: FMULq	dis not found

	.word 0x89946156  ! 4210: WRPR_TICK_I	wrpr	%r17, 0x0156, %tick
	setx	data_start_0, %g1, %r19
	.word 0x87956070  ! 4218: WRPR_TT_I	wrpr	%r21, 0x0070, %tt
	.word 0xbba5c840  ! 4221: FADDd	faddd	%f54, %f0, %f60
	.word 0xb9a94820  ! 4222: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a5c920  ! 4223: FMULs	fmuls	%f23, %f0, %f24
	.word 0xbf504000  ! 4227: RDPR_TNPC	<illegal instruction>
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983951  ! 4230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1951, %hpstate
	.word 0xbda48940  ! 4233: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb5ab8820  ! 4236: FMOVPOS	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 4237: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_4, %g1, %r18
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4245: FSQRTd	fsqrt	
	.word 0xbda00560  ! 4247: FSQRTq	fsqrt	
	.word 0x879521e6  ! 4250: WRPR_TT_I	wrpr	%r20, 0x01e6, %tt
	.word 0xb9a4c920  ! 4252: FMULs	fmuls	%f19, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 4255: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa5c8a0  ! 4257: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb5a00560  ! 4259: FSQRTq	fsqrt	
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 4261: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba00020  ! 4266: FMOVs	fmovs	%f0, %f29
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c860  ! 4269: FADDq	dis not found

	.word 0x8994e085  ! 4270: WRPR_TICK_I	wrpr	%r19, 0x0085, %tick
	.word 0xb7520000  ! 4273: RDPR_PIL	<illegal instruction>
	.word 0xb3a508e0  ! 4279: FSUBq	dis not found

	.word 0xb5a9c820  ! 4282: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1aa4820  ! 4286: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	data_start_5, %g1, %r20
	.word 0x879420b1  ! 4289: WRPR_TT_I	wrpr	%r16, 0x00b1, %tt
	.word 0xb3a408e0  ! 4290: FSUBq	dis not found

	setx	0x20317, %g1, %o0
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
	.word 0xb1a54860  ! 4296: FADDq	dis not found

	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a1d7  ! 4302: WRPR_PSTATE_I	wrpr	%r18, 0x01d7, %pstate
	.word 0xb3a4c840  ! 4304: FADDd	faddd	%f50, %f0, %f56
	.word 0xb7a81c20  ! 4307: FMOVRGEZ	dis not found

	.word 0xbfaa0820  ! 4312: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbec40000  ! 4313: ADDCcc_R	addccc 	%r16, %r0, %r31
	.word 0xbba508a0  ! 4317: FSUBs	fsubs	%f20, %f0, %f29
	.word 0x819460d3  ! 4319: WRPR_TPC_I	wrpr	%r17, 0x00d3, %tpc
	.word 0xbf508000  ! 4320: RDPR_TSTATE	<illegal instruction>
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb29d8000  ! 4325: XORcc_R	xorcc 	%r22, %r0, %r25
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb23cc000  ! 4332: XNOR_R	xnor 	%r19, %r0, %r25
	.word 0x8195e144  ! 4334: WRPR_TPC_I	wrpr	%r23, 0x0144, %tpc
	.word 0xb3540000  ! 4335: RDPR_GL	<illegal instruction>
	.word 0xbfabc820  ! 4340: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbfaa4820  ! 4344: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda81c20  ! 4352: FMOVRGEZ	dis not found

	.word 0xbba80c20  ! 4362: FMOVRLZ	dis not found

	.word 0x879561fe  ! 4363: WRPR_TT_I	wrpr	%r21, 0x01fe, %tt
	.word 0x8d95e05a  ! 4368: WRPR_PSTATE_I	wrpr	%r23, 0x005a, %pstate
	.word 0xbda408a0  ! 4373: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xbfa4c920  ! 4376: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb7a80420  ! 4379: FMOVRZ	dis not found

	.word 0xbc0461f1  ! 4380: ADD_I	add 	%r17, 0x01f1, %r30
	.word 0xb1518000  ! 4383: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa90820  ! 4385: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbc3c4000  ! 4386: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xbba4c960  ! 4390: FMULq	dis not found

	.word 0xbda81420  ! 4391: FMOVRNZ	dis not found

	.word 0x9195209f  ! 4392: WRPR_PIL_I	wrpr	%r20, 0x009f, %pil
	.word 0xb1abc820  ! 4393: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3abc820  ! 4394: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbda00540  ! 4398: FSQRTd	fsqrt	
	.word 0xb3a81820  ! 4401: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x2033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e1ff  ! 4405: WRPR_TPC_I	wrpr	%r23, 0x01ff, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb480000  ! 4412: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9a80820  ! 4413: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3510000  ! 4414: RDPR_TICK	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4417: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3500000  ! 4421: RDPR_TPC	<illegal instruction>
	.word 0xb7a81c20  ! 4423: FMOVRGEZ	dis not found

	setx	0x300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 4425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	.word 0x8394e167  ! 4428: WRPR_TNPC_I	wrpr	%r19, 0x0167, %tnpc
	.word 0xb3aa8820  ! 4431: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbb520000  ! 4432: RDPR_PIL	<illegal instruction>
	.word 0xb48d4000  ! 4435: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xb9a50960  ! 4436: FMULq	dis not found

	.word 0xbba5c8a0  ! 4440: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xbc0c4000  ! 4442: AND_R	and 	%r17, %r0, %r30
	.word 0xb9a81820  ! 4444: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb7518000  ! 4446: RDPR_PSTATE	<illegal instruction>
	.word 0xb4140000  ! 4449: OR_R	or 	%r16, %r0, %r26
	.word 0xb9540000  ! 4452: RDPR_GL	<illegal instruction>
	.word 0xb1a00540  ! 4453: FSQRTd	fsqrt	
	.word 0xb5a489e0  ! 4454: FDIVq	dis not found

	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7d4400  ! 4463: MOVR_R	movre	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 4474: FMOVRNZ	dis not found

	.word 0xb1508000  ! 4476: RDPR_TSTATE	<illegal instruction>
	.word 0xbb520000  ! 4477: RDPR_PIL	<illegal instruction>
	.word 0xb7a589e0  ! 4478: FDIVq	dis not found

	.word 0xbfa5c940  ! 4480: FMULd	fmuld	%f54, %f0, %f62
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 4484: RDPR_TNPC	<illegal instruction>
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 4487: FSQRTq	fsqrt	
	.word 0xbb3c0000  ! 4488: SRA_R	sra 	%r16, %r0, %r29
	.word 0xb1504000  ! 4491: RDPR_TNPC	<illegal instruction>
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 4496: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xb1508000  ! 4502: RDPR_TSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 4503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a508c0  ! 4506: FSUBd	fsubd	%f20, %f0, %f28
	.word 0xb00d8000  ! 4509: AND_R	and 	%r22, %r0, %r24
	.word 0xbfa40960  ! 4514: FMULq	dis not found

	.word 0xbc3561d2  ! 4515: SUBC_I	orn 	%r21, 0x01d2, %r30
	.word 0xbb504000  ! 4516: RDPR_TNPC	<illegal instruction>
	.word 0xb9a80c20  ! 4520: FMOVRLZ	dis not found

	.word 0xbf50c000  ! 4522: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 4523: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982c5b  ! 4525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0xb24421fa  ! 4526: ADDC_I	addc 	%r16, 0x01fa, %r25
	setx	data_start_7, %g1, %r20
	.word 0xb1a00520  ! 4530: FSQRTs	fsqrt	
	.word 0xb6042129  ! 4531: ADD_I	add 	%r16, 0x0129, %r27
	.word 0xb1aa8820  ! 4534: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a4c940  ! 4535: FMULd	fmuld	%f50, %f0, %f56
	ta	T_CHANGE_HPRIV
	.word 0x81983f51  ! 4536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f51, %hpstate
	.word 0xbb51c000  ! 4537: RDPR_TL	<illegal instruction>
	.word 0xb634a02a  ! 4539: ORN_I	orn 	%r18, 0x002a, %r27
	.word 0xb20dc000  ! 4540: AND_R	and 	%r23, %r0, %r25
	.word 0xbba58940  ! 4541: FMULd	fmuld	%f22, %f0, %f60
	.word 0x8194e182  ! 4545: WRPR_TPC_I	wrpr	%r19, 0x0182, %tpc
	.word 0xb5a54860  ! 4546: FADDq	dis not found

	.word 0xbfaac820  ! 4547: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00560  ! 4548: FSQRTq	fsqrt	
	.word 0xb1500000  ! 4550: RDPR_TPC	<illegal instruction>
	.word 0xb9ab8820  ! 4551: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a588a0  ! 4552: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb69c217c  ! 4554: XORcc_I	xorcc 	%r16, 0x017c, %r27
	.word 0xb7a80420  ! 4557: FMOVRZ	dis not found

	setx	data_start_5, %g1, %r21
	setx	data_start_5, %g1, %r23
	.word 0xbda9c820  ! 4561: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80420  ! 4569: FMOVRZ	dis not found

	.word 0xb1a9c820  ! 4570: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbda44820  ! 4571: FADDs	fadds	%f17, %f0, %f30
	.word 0xb645c000  ! 4573: ADDC_R	addc 	%r23, %r0, %r27
	.word 0xb7a4c9e0  ! 4575: FDIVq	dis not found

	.word 0xbba90820  ! 4576: FMOVLEU	fmovs	%fcc1, %f0, %f29
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4580: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a80820  ! 4583: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3a5c8a0  ! 4585: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb1a509a0  ! 4586: FDIVs	fdivs	%f20, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983a41  ! 4587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a41, %hpstate
	.word 0xb5a00560  ! 4588: FSQRTq	fsqrt	
	.word 0xbbaac820  ! 4590: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda448e0  ! 4597: FSUBq	dis not found

	.word 0xbfa00560  ! 4598: FSQRTq	fsqrt	
	.word 0xb4ade0ab  ! 4599: ANDNcc_I	andncc 	%r23, 0x00ab, %r26
	.word 0xb9a4c8e0  ! 4600: FSUBq	dis not found

	.word 0xb9a48920  ! 4602: FMULs	fmuls	%f18, %f0, %f28
	.word 0xbda40920  ! 4603: FMULs	fmuls	%f16, %f0, %f30
	setx	data_start_2, %g1, %r23
	.word 0xb3a98820  ! 4614: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394611b  ! 4617: WRPR_TNPC_I	wrpr	%r17, 0x011b, %tnpc
	.word 0x8195a10a  ! 4619: WRPR_TPC_I	wrpr	%r22, 0x010a, %tpc
	.word 0xbda5c9a0  ! 4620: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb5a4c8c0  ! 4623: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xbba48960  ! 4624: FMULq	dis not found

	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 4630: RDPR_TSTATE	<illegal instruction>
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 4639: FMOVs	fmovs	%f0, %f25
	.word 0x899520d1  ! 4646: WRPR_TICK_I	wrpr	%r20, 0x00d1, %tick
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 4649: FMOVRGEZ	dis not found

	.word 0xb7510000  ! 4650: RDPR_TICK	<illegal instruction>
	.word 0xb1a58840  ! 4651: FADDd	faddd	%f22, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982c09  ! 4658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c09, %hpstate
	.word 0xb42c8000  ! 4666: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xbda5c9a0  ! 4668: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb9a9c820  ! 4670: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbd34c000  ! 4672: SRL_R	srl 	%r19, %r0, %r30
	.word 0xb1a408c0  ! 4674: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb1a509a0  ! 4677: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb1a98820  ! 4679: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a54820  ! 4682: FADDs	fadds	%f21, %f0, %f26
	.word 0x91946160  ! 4685: WRPR_PIL_I	wrpr	%r17, 0x0160, %pil
	.word 0xba2d4000  ! 4687: ANDN_R	andn 	%r21, %r0, %r29
	.word 0xb0450000  ! 4696: ADDC_R	addc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 4702: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb5ab4820  ! 4703: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0x8d956002  ! 4706: WRPR_PSTATE_I	wrpr	%r21, 0x0002, %pstate
	.word 0xb1a4c9e0  ! 4711: FDIVq	dis not found

	.word 0xb1ab0820  ! 4716: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a548e0  ! 4717: FSUBq	dis not found

	.word 0xb5a54940  ! 4719: FMULd	fmuld	%f52, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x8198390b  ! 4720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190b, %hpstate
	.word 0xb5a80c20  ! 4721: FMOVRLZ	dis not found

	.word 0xb7a00520  ! 4723: FSQRTs	fsqrt	
	.word 0xbdaac820  ! 4725: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a54940  ! 4726: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb5a98820  ! 4728: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb335c000  ! 4731: SRL_R	srl 	%r23, %r0, %r25
	.word 0xb7ab0820  ! 4732: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a4c8e0  ! 4735: FSUBq	dis not found

	.word 0xbda448a0  ! 4740: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb805c000  ! 4743: ADD_R	add 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a509a0  ! 4746: FDIVs	fdivs	%f20, %f0, %f27
	.word 0x85956071  ! 4747: WRPR_TSTATE_I	wrpr	%r21, 0x0071, %tstate
	.word 0xb3a80820  ! 4749: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba81420  ! 4751: FMOVRNZ	dis not found

	.word 0xb3a58960  ! 4756: FMULq	dis not found

	.word 0xbfa00020  ! 4757: FMOVs	fmovs	%f0, %f31
	.word 0xb1a88820  ! 4759: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba58840  ! 4762: FADDd	faddd	%f22, %f0, %f60
	.word 0x8195a15f  ! 4764: WRPR_TPC_I	wrpr	%r22, 0x015f, %tpc
	.word 0xb3a4c8a0  ! 4767: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbb510000  ! 4769: RDPR_TICK	<illegal instruction>
	.word 0xb1a5c8c0  ! 4770: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb5643801  ! 4772: MOVcc_I	<illegal instruction>
	.word 0x8595a1b9  ! 4779: WRPR_TSTATE_I	wrpr	%r22, 0x01b9, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 4782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0x8d95a11f  ! 4783: WRPR_PSTATE_I	wrpr	%r22, 0x011f, %pstate
	.word 0x899421c1  ! 4785: WRPR_TICK_I	wrpr	%r16, 0x01c1, %tick
	.word 0xb7508000  ! 4787: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a8c820  ! 4788: FMOVL	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xb5a58960  ! 4791: FMULq	dis not found

	.word 0xbfaa0820  ! 4792: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbf508000  ! 4797: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a549e0  ! 4798: FDIVq	dis not found

	.word 0xbdaa4820  ! 4799: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4802: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 4804: RDPR_TNPC	<illegal instruction>
	.word 0x8d946064  ! 4806: WRPR_PSTATE_I	wrpr	%r17, 0x0064, %pstate
	.word 0xb1a44940  ! 4807: FMULd	fmuld	%f48, %f0, %f24
	.word 0xbda81c20  ! 4810: FMOVRGEZ	dis not found

	.word 0x919561bc  ! 4814: WRPR_PIL_I	wrpr	%r21, 0x01bc, %pil
	.word 0xbba58960  ! 4816: FMULq	dis not found

	.word 0x8395a0bb  ! 4819: WRPR_TNPC_I	wrpr	%r22, 0x00bb, %tnpc
	.word 0xbfab4820  ! 4823: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9641800  ! 4826: MOVcc_R	<illegal instruction>
	.word 0xbd3c6001  ! 4827: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xb81ce1e7  ! 4831: XOR_I	xor 	%r19, 0x01e7, %r28
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb49de0db  ! 4835: XORcc_I	xorcc 	%r23, 0x00db, %r26
	.word 0xbb2de001  ! 4837: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0xbc25e15e  ! 4839: SUB_I	sub 	%r23, 0x015e, %r30
	.word 0xb5a00560  ! 4843: FSQRTq	fsqrt	
	.word 0xb7540000  ! 4844: RDPR_GL	<illegal instruction>
	.word 0xbda00020  ! 4845: FMOVs	fmovs	%f0, %f30
	.word 0xbb510000  ! 4850: RDPR_TICK	<illegal instruction>
	.word 0xbbaa8820  ! 4852: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb93c5000  ! 4853: SRAX_R	srax	%r17, %r0, %r28
	.word 0xb3aac820  ! 4854: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb0b54000  ! 4855: ORNcc_R	orncc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983951  ! 4856: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1951, %hpstate
	.word 0xb7a549c0  ! 4858: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb3a488c0  ! 4860: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb5a58960  ! 4861: FMULq	dis not found

	.word 0xb951c000  ! 4868: RDPR_TL	<illegal instruction>
	.word 0xb1a54920  ! 4869: FMULs	fmuls	%f21, %f0, %f24
	.word 0xbda98820  ! 4872: FMOVNEG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982f53  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f53, %hpstate
	.word 0xb335d000  ! 4878: SRLX_R	srlx	%r23, %r0, %r25
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc45e00a  ! 4884: ADDC_I	addc 	%r23, 0x000a, %r30
	setx	0x1013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4887: FSQRTq	fsqrt	
	.word 0x8d9521da  ! 4888: WRPR_PSTATE_I	wrpr	%r20, 0x01da, %pstate
	.word 0xbb2cd000  ! 4889: SLLX_R	sllx	%r19, %r0, %r29
	.word 0xbda8c820  ! 4890: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00540  ! 4893: FSQRTd	fsqrt	
	.word 0xb1a54920  ! 4894: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb3ab0820  ! 4903: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c8c0  ! 4904: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb9a81820  ! 4905: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbba50960  ! 4906: FMULq	dis not found

	.word 0xbba489e0  ! 4907: FDIVq	dis not found

	.word 0xb9357001  ! 4911: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0xbd504000  ! 4917: RDPR_TNPC	<illegal instruction>
	.word 0xb7a5c820  ! 4918: FADDs	fadds	%f23, %f0, %f27
	.word 0xb7a44860  ! 4921: FADDq	dis not found

	.word 0xb3ab4820  ! 4922: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba58920  ! 4924: FMULs	fmuls	%f22, %f0, %f29
	.word 0xbd510000  ! 4925: RDPR_TICK	<illegal instruction>
	.word 0xbf348000  ! 4929: SRL_R	srl 	%r18, %r0, %r31
	.word 0xb150c000  ! 4931: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 4933: RDPR_TPC	<illegal instruction>
	.word 0x8994e198  ! 4934: WRPR_TICK_I	wrpr	%r19, 0x0198, %tick
	.word 0xb3a5c940  ! 4937: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbba00560  ! 4941: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x819838d9  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d9, %hpstate
	.word 0xb3aa0820  ! 4943: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb5518000  ! 4944: RDPR_PSTATE	<illegal instruction>
	.word 0xbda58840  ! 4945: FADDd	faddd	%f22, %f0, %f30
	.word 0xbb500000  ! 4950: RDPR_TPC	<illegal instruction>
	.word 0xbba48860  ! 4953: FADDq	dis not found

	.word 0xbba488c0  ! 4955: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbe354000  ! 4957: ORN_R	orn 	%r21, %r0, %r31
	.word 0xbfa00520  ! 4958: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 4964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4976: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c920  ! 4980: FMULs	fmuls	%f19, %f0, %f30
	.word 0x8795601c  ! 4983: WRPR_TT_I	wrpr	%r21, 0x001c, %tt
	mov	0, %r14
	.word 0xa193a000  ! 4987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 4989: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda80c20  ! 4990: FMOVRLZ	dis not found

	.word 0xb3a00560  ! 4991: FSQRTq	fsqrt	
	.word 0xbf50c000  ! 4992: RDPR_TT	<illegal instruction>
	.word 0xbd51c000  ! 4994: RDPR_TL	<illegal instruction>
	.word 0x9195e185  ! 4997: WRPR_PIL_I	wrpr	%r23, 0x0185, %pil
	.word 0xbba409a0  ! 4998: FDIVs	fdivs	%f16, %f0, %f29

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

	.xword	0x193161d09af464d6
	.xword	0x3f534082650871a9
	.xword	0xf7f41a527b297f4e
	.xword	0x9a5b1838f5accec9
	.xword	0x2006097f7386d921
	.xword	0x77825a391bc4bbfb
	.xword	0xd888df2c33435547
	.xword	0x8a509da67de942f8
	.xword	0x23082f7d92382c96
	.xword	0x77bf389da21cfd75
	.xword	0xee3b809701fb75f8
	.xword	0x736ee838723e2b06
	.xword	0xdfbd9d5d5b1efb73
	.xword	0xf8f2abff1812e81b
	.xword	0x9f8555b17371a99d
	.xword	0x6448701fe2246054
	.xword	0xba56b04dcc0dfb3a
	.xword	0x93198c37bdd59dee
	.xword	0xc58acecd0b72ca6e
	.xword	0xc8355e2dbeb52c27
	.xword	0xdee7e7e7b8e54a42
	.xword	0x37fe12ec36cf2ef3
	.xword	0xc077f7df763ba959
	.xword	0xd7e24ac5bede3726
	.xword	0xdaaedb9f97b73a1f
	.xword	0x02d3de5761787d26
	.xword	0xeb1af521de0eeaa8
	.xword	0xdd88b794047d53d6
	.xword	0x6b12aa5536d8d82e
	.xword	0xe6b4d6d64e048ca1
	.xword	0xc998b8908a3affdd
	.xword	0xd9c7067f04ecd213
	.xword	0x856b0fc392770b93
	.xword	0xa07c95557d86fd42
	.xword	0x1f54f41ce5453f1c
	.xword	0x0e9678d12e5b174b
	.xword	0xdfa707e09bb91046
	.xword	0xeac02d2fbca43aff
	.xword	0x1dbbe3fad4cd35bb
	.xword	0x1dc3094b615fed79
	.xword	0x28d8640867bfd208
	.xword	0xd6f044c36914e0c4
	.xword	0xfe18adb9ecf2bdd2
	.xword	0xa76fa0537f4fea0c
	.xword	0x2705f8c54471d3c0
	.xword	0x3a82af4e99ca435c
	.xword	0xfd59b6ce1cc7a9c5
	.xword	0x8e1a4ffcf5b67574
	.xword	0x3e4b0d828b7ca270
	.xword	0x61bd71170abdc9b9
	.xword	0x070231cc7a069416
	.xword	0x5aa32339e5789394
	.xword	0x1f12434bf611a9d1
	.xword	0x5e58826ce69ed74b
	.xword	0x13800f4b9a3ca689
	.xword	0xc89070302c32bd36
	.xword	0x6b4ae42b2f63232e
	.xword	0x6e541a9d42670375
	.xword	0x96deb57b53f8ee57
	.xword	0xb5f6b3add7b81250
	.xword	0xc37ff61fa29cc30a
	.xword	0x5091c2b124e0078b
	.xword	0xf1bf17a34365807c
	.xword	0x37b0ac4e2db61262
	.xword	0xea3e24cddb6c7a97
	.xword	0xa4a4d11c522d0b71
	.xword	0xa2b800f5ab6b68e4
	.xword	0x4f166ac793d1c34e
	.xword	0x490f1fd5fecbddde
	.xword	0xaa1dd4d7be512303
	.xword	0x4e2c5f524b091721
	.xword	0x5167ed880334d04a
	.xword	0x0191e3bf858d2bb6
	.xword	0x244360e672c8e3d6
	.xword	0x72065bef27a5a8cb
	.xword	0x28d9bea40270cb13
	.xword	0xaa0d851a88d3e379
	.xword	0x28da81a3cdc9ed9c
	.xword	0x55cb5d518a3acec2
	.xword	0xbbb295020abcda93
	.xword	0xa6c13cd760d3be7b
	.xword	0xd4c5ec4e21f5bba4
	.xword	0x9494d677837c108e
	.xword	0xeda68021a1813b49
	.xword	0xbd4bde939f266c93
	.xword	0xf6f7d4cc5a1ab024
	.xword	0xe9d84efb26e83f70
	.xword	0x9f917b01a75b4d52
	.xword	0x7465fc18a36ed65b
	.xword	0xf8da0dc06453b526
	.xword	0xa709746cd06e6555
	.xword	0x4a2ab936f259bd7e
	.xword	0x2e1ed2c5e2a900fe
	.xword	0xa2e5c8f570dab09e
	.xword	0xb00f84c02890abd9
	.xword	0x5f388960299699c0
	.xword	0xfdcc142fb1e1a4ee
	.xword	0xc70d96b8ee74f718
	.xword	0xa0a0095ce60fca4b
	.xword	0x526fc5948b19d96a
	.xword	0x63ed251bc4e8f79c
	.xword	0xf6c7e8c680ac8eb2
	.xword	0xc7299987081d6dff
	.xword	0xb1ab2accf1ceba57
	.xword	0xa95a106365d093f5
	.xword	0xea2db04a41f7b92f
	.xword	0xfbebb1f28a3eb332
	.xword	0x47a53e42ce91296a
	.xword	0x3e278f4a4f08ad63
	.xword	0x2d7d7c3772c25a90
	.xword	0x9484f80665c6b496
	.xword	0x67186f5eba5485f6
	.xword	0x52ed968b658284ac
	.xword	0xc20deaf5c12e1e64
	.xword	0xf8aa65288e0a978b
	.xword	0x6fa73f755286fcda
	.xword	0x1991733754c1a8b4
	.xword	0x5789e9a4c2fde85b
	.xword	0x91b078f264560be4
	.xword	0x7ac72764f4f6ac51
	.xword	0xbb151de538caf336
	.xword	0x2e1f2d85cf26335a
	.xword	0xa22ef630f7015f4a
	.xword	0x31bde7ee437b0f35
	.xword	0x6f608e09e40ff8ee
	.xword	0x801b2433ee34bec4
	.xword	0x244da0a27937ad10
	.xword	0x8742f689921fa0d3
	.xword	0x01e01b8139f58e7d
	.xword	0x7123d0ab1072ed8c
	.xword	0x160c4b988fe60af3
	.xword	0x5f72cd636a80d673
	.xword	0xf5fc7aba37a795ec
	.xword	0xe6ef4a3c7bad540a
	.xword	0x922c224cc2f3a933
	.xword	0x0613fc5d794578ad
	.xword	0xee56b7e1a352fc3e
	.xword	0x8f90e9649a18d7d4
	.xword	0x38de8025e4cb28cc
	.xword	0x6c21aaa28a9c871c
	.xword	0x9cd04f059f8a4163
	.xword	0x5969c9a7838db49e
	.xword	0xbb0fb19a1a43df5d
	.xword	0x382dd926b08d654d
	.xword	0xa12f6318c5d1dccb
	.xword	0xa4cad37194690f63
	.xword	0xa00895dcdbc542ab
	.xword	0x6b3056a34dd11502
	.xword	0xa377feff5c8d0064
	.xword	0xacd4e4b25dcdfdef
	.xword	0x8ad4e0a6f521f71d
	.xword	0x90d26de87bf60e8c
	.xword	0x9b16549081ac0a9a
	.xword	0x6ce81edbdd38a165
	.xword	0xd6d6337098ad1d22
	.xword	0x51e79a12e75f3053
	.xword	0x7a8e84b853dc887a
	.xword	0x4dc4515b87906e75
	.xword	0x2e95d6f1e8ff3532
	.xword	0xf5850be662c4a36a
	.xword	0x8ea1e0931bc224b5
	.xword	0x2fec4e175f318d11
	.xword	0x3b9b78401c73a6ff
	.xword	0x6c85c542003b6b4d
	.xword	0xf139703a2516f785
	.xword	0x7a7f651023828f2d
	.xword	0x932386acf5835e90
	.xword	0x3eb9d5eec9d6e3a0
	.xword	0x72acf52d840cb496
	.xword	0x7ba2cd33b70177c1
	.xword	0xfcab3ba8316ca116
	.xword	0xf36526208cae8b13
	.xword	0x3d9782bb9ff56a9b
	.xword	0x54e87545fc318743
	.xword	0x163834e59eb623f1
	.xword	0x715537894f924011
	.xword	0x49c3dc50053a434a
	.xword	0x26c4e82a74288419
	.xword	0x2060ebcc58b70b3d
	.xword	0x99f4d1a471c82d58
	.xword	0xdddc3d46a7af091f
	.xword	0x917df68f45fa9cac
	.xword	0x2595daa312a076d5
	.xword	0x4b2534913a05f104
	.xword	0x38d7b40f95f0d636
	.xword	0x2524e4afe56e6223
	.xword	0xb577794cd3953959
	.xword	0x0da55663aebc6c30
	.xword	0x0e2242b265406cca
	.xword	0x2cb30ca157b3f3b2
	.xword	0x1161f1602bed139e
	.xword	0xb269f472018f66de
	.xword	0xc6b49842eacebaf3
	.xword	0x5cfdf5b2a84264d5
	.xword	0xfbc02041ef64f084
	.xword	0xf677a6e9bd39e801
	.xword	0xc5e2f277208dbfc6
	.xword	0x08c40b0c158e6b6a
	.xword	0x37244b6b3a3ce503
	.xword	0x5bbe706d2468872d
	.xword	0x676373957bcee838
	.xword	0x146ffbd4db2c532e
	.xword	0x28ef51a22f1cda5f
	.xword	0xf5e89bf290255f4a
	.xword	0x6c1926dd73291034
	.xword	0xc44ffbb5ea3a6d50
	.xword	0xadc4e50890fbd6ad
	.xword	0x7632c794c7865429
	.xword	0xdaf4f88634178b0b
	.xword	0x272202afac393635
	.xword	0x043d88f1c5da7844
	.xword	0xb613d3ade3ec6bf9
	.xword	0xb8b066bf3a4566eb
	.xword	0xb8ba07e56ed49f2b
	.xword	0x7cdd58b96995a756
	.xword	0x9cae4ce0d0d4cea9
	.xword	0xa4a12181d4226c44
	.xword	0xb29223ac684cff98
	.xword	0x91ac1a7936d0e44d
	.xword	0xf7caba0e5a9615f9
	.xword	0xfc2641d25944366d
	.xword	0x94a1496f2c339c82
	.xword	0xd36002508e14ace9
	.xword	0x3cd67df05642ba95
	.xword	0xee59c0e09c79435f
	.xword	0x729adf4d1be02611
	.xword	0x53c4efa4b99b6a2d
	.xword	0xfa40b0bcc908718b
	.xword	0xc85acc7ad37c478d
	.xword	0x9d7fc15430c95f81
	.xword	0x4e23128c82c2e56f
	.xword	0x870a624bdda50ae7
	.xword	0xba964c9ea3d29565
	.xword	0xfa0128e10f19a064
	.xword	0x24bf18666e7a1a0e
	.xword	0x131b1fc62eada7f9
	.xword	0xaa0e14325510a11a
	.xword	0x6ce554c0dd75d688
	.xword	0x76338eb2869e8c38
	.xword	0x3f70f80040f7a375
	.xword	0x36720a7b3fbe82da
	.xword	0xafdffe73bb9482e0
	.xword	0x7a49050842dcfec2
	.xword	0xa59dbd0c5a815aa6
	.xword	0xc10e1489b63f9d1e
	.xword	0x61aa4fd878e2ecb3
	.xword	0xebca0fc92c677e0c
	.xword	0xbe643d7c860a661a
	.xword	0x96e789894c1eb4a5
	.xword	0xc1ab7a9eb6eee261
	.xword	0x369285d2a35c0374
	.xword	0xe0124c4c211a277e
	.xword	0x7e369e33781db97e
	.xword	0x3e16949b49b5a6e6
	.xword	0xaa93bbe42fae614d
	.xword	0xf2deea134f8190a3
	.align 0x2000
	.data
data_start_1:

	.xword	0x6418bb479244bc7f
	.xword	0x1b863fcf25ee8574
	.xword	0x6c7f1832e5856b6a
	.xword	0xfe025625e83be2d8
	.xword	0xcb6f854fda550e60
	.xword	0x83fbca2ff29c97c2
	.xword	0x1330bf69c90e2ab3
	.xword	0xdb9764888b1c427d
	.xword	0x2e159aece94d4e08
	.xword	0x2279824737044cc8
	.xword	0x66df564bef1a8882
	.xword	0x1c0eb12793feefdf
	.xword	0xcc6f57a5a8e20379
	.xword	0xd81904338a5fdbaa
	.xword	0x94bcc80253a0c5d4
	.xword	0x2356555bf4b21271
	.xword	0x87e77057d9cacd72
	.xword	0xc65bc1a990b70310
	.xword	0x49da9209815da768
	.xword	0x9ee96372f979890c
	.xword	0x773bfda1c8d44b54
	.xword	0x305351a72f1edf3a
	.xword	0xed761077d8990ea4
	.xword	0xd6502ccef8daf46b
	.xword	0x1d3386b4d11a0c3e
	.xword	0xc99327a3c62ff1f2
	.xword	0x073ad15b9a2f1b15
	.xword	0x1b8e21a2b47f88e4
	.xword	0xe5d1cc84d5dcc359
	.xword	0xf81ee3625ad3bb70
	.xword	0xc35f4003c4c71017
	.xword	0xab044cd674e8f98d
	.xword	0x59702c8cb0e5b2c5
	.xword	0x22211d4bd6746513
	.xword	0x7f9ba790ad73cbf0
	.xword	0x10cf4dfb184d2966
	.xword	0xab8c27b9055965da
	.xword	0x7eb88fb3e5eb9f86
	.xword	0x1921668e3147cb74
	.xword	0x84edcfa9c4e66657
	.xword	0x8b7f94c3848641c0
	.xword	0xb1965c14a6dfc69d
	.xword	0x447d002eecaf8053
	.xword	0x54a930f89fcfb611
	.xword	0xd1cd55a1665520c3
	.xword	0x786eedd291125e60
	.xword	0x82ba874e7980fcf6
	.xword	0x8abfd0b5b521fce4
	.xword	0x790952c4031eb4b7
	.xword	0xa821d75fb6b3b7d5
	.xword	0x70f7673e0faa7573
	.xword	0xd217aaf5da686d3c
	.xword	0xe229eca691a34ad5
	.xword	0xcd54b9c1227b59d0
	.xword	0x0f2973f2c6397b9e
	.xword	0xd1a0a67278b87a12
	.xword	0x94d8866b380153eb
	.xword	0x0950e8c977ee625d
	.xword	0x943c23fd4393d6e8
	.xword	0x6a0143fbd380be03
	.xword	0x5de28b21b0948070
	.xword	0x6c4392821c957d9e
	.xword	0x7074b3cf23b1dd5e
	.xword	0x9c31349cd248b12b
	.xword	0xdd952cdb55a2535d
	.xword	0xaa7466c0c9b647f3
	.xword	0x8092e25eafb712d2
	.xword	0x87eb4ff7839e8475
	.xword	0x5e16bdd1b18f7b1b
	.xword	0xfd8409603f1a00f4
	.xword	0x3f8e200dd9acd76d
	.xword	0xd023893dd3ee399f
	.xword	0xb45a0ddf18bc596e
	.xword	0x9f4d543e2d819be1
	.xword	0xd0183694f1e31025
	.xword	0x45844630ed8a6cc0
	.xword	0xe28d47925a8de15c
	.xword	0x4474ffb9c6c2bb67
	.xword	0xf49b43c9ba046a35
	.xword	0x5656124f992fe5a0
	.xword	0x56d98a57efe035b4
	.xword	0x2c0212473bd49ef2
	.xword	0x744889d91cba44bb
	.xword	0xf8654a7e3edcccba
	.xword	0xe50f72febf908ce0
	.xword	0xa80bd0f10c9c519a
	.xword	0x226d74da5f823720
	.xword	0x70d0f41b58698a34
	.xword	0x5226bd316a29ebc9
	.xword	0x747e42efece1787b
	.xword	0x75b27f45fce453fc
	.xword	0x0d50402c2f0ec1aa
	.xword	0x3b4fca530e32ff8f
	.xword	0x065b36f25cada6dd
	.xword	0x7eb11bfe7d3e557e
	.xword	0x18ba51f1d0a9fb3b
	.xword	0x1811b914a333fede
	.xword	0xb7adca2e9281d0ee
	.xword	0xc1cf7f0d15b65b96
	.xword	0xa07a46baa47a60a8
	.xword	0xc19e01e41a4e257e
	.xword	0x596bc89fcf06ff97
	.xword	0x21d571e5ece58209
	.xword	0x2dc0282da74a1b5f
	.xword	0xacf3a153fc9680fc
	.xword	0xab21cb2bb97e076a
	.xword	0x3d83fd161d1be887
	.xword	0x02b2567c80dea9a5
	.xword	0xf3a6e8c080144dda
	.xword	0xf826597de63d06dd
	.xword	0x2db780cc9094ef30
	.xword	0x47284ec430d0db55
	.xword	0xd8c443cba6b57c38
	.xword	0x8967f7d9318e28d5
	.xword	0xcdd44d5a625d7b19
	.xword	0x0791f6f449dc93d2
	.xword	0x217333f7f477e6e0
	.xword	0x29796d409fae7abc
	.xword	0x64278e190675d75e
	.xword	0x8804c91dd81dfd0c
	.xword	0xe853622656a6dfd6
	.xword	0xfe88277643a037fc
	.xword	0xd72161e709a158ca
	.xword	0xe1332051d6f4b90c
	.xword	0x27d93f1e71d2ee09
	.xword	0x0c43b7cd16d57c74
	.xword	0x446dd0e24b377f35
	.xword	0x85b4c5659b630e66
	.xword	0x7e882bae1033da74
	.xword	0x07c5fa48c6e994c6
	.xword	0x6eb9df3ea145da08
	.xword	0xe479709355e517f9
	.xword	0x1164717e041fbe85
	.xword	0x5d092065aff3f6e3
	.xword	0x54980c8f889e9f40
	.xword	0x19eb1c81e9a73a9f
	.xword	0xb2a5ae8725ca9be4
	.xword	0xfd5eed2c610759cf
	.xword	0x5012eaa536b105dd
	.xword	0x760a47fa72e31317
	.xword	0xb4b7e27431febdeb
	.xword	0x141afb0b77fdba56
	.xword	0x314c2c9fe02cbc83
	.xword	0x4ee02aae708ba44c
	.xword	0xc527b921a5afd43b
	.xword	0x66144c83448abc87
	.xword	0xfd664f6dfbd6e11f
	.xword	0x5c26c5d99bcf69dc
	.xword	0x5e515bf1cb90224d
	.xword	0xbaa6e3e9d7f884ae
	.xword	0xbe8db60553ff90b3
	.xword	0x36f67803f1c1d5cd
	.xword	0xbf01647b9c3f8ad3
	.xword	0x1fe3996a2b587034
	.xword	0xcd5d03e8ec2920da
	.xword	0x5bfc5acc3d968935
	.xword	0x76caae723fd2271d
	.xword	0xcb875238ec18d653
	.xword	0xbca7c0d7e6289e8b
	.xword	0xbb66ad723f4bdca7
	.xword	0xd7ef2e32e33b601a
	.xword	0x15d4ea297566548e
	.xword	0x02e819030dd1a4b6
	.xword	0xe04bbb6d31cb1252
	.xword	0xc2d099462f4a65af
	.xword	0x5239f4b4fdc00f0c
	.xword	0x30c9d68998279ce7
	.xword	0xd3bdf17bdf472e0b
	.xword	0xec34d1407c156425
	.xword	0x939795cf90bce08f
	.xword	0x7e4b1ef553a40755
	.xword	0x2a001d031c5b0734
	.xword	0x4c4876f85deff32e
	.xword	0x1cb3db3828f33da6
	.xword	0xcef46c1e557eec83
	.xword	0x5843602689181155
	.xword	0x3e9f6fc3f83c21b1
	.xword	0x037391ffe0aa5bcf
	.xword	0x5182585966e199fd
	.xword	0x2e6d7dd9c976bd3f
	.xword	0x2158a57614b95601
	.xword	0x773ad879666776e0
	.xword	0x4210fae57193df3f
	.xword	0xd245354a144ab125
	.xword	0x117bfc8e3dbe255b
	.xword	0x2eb034628edf06ef
	.xword	0x909e70933ba0bce2
	.xword	0xf51415e0d9c34f87
	.xword	0x2b3af306a6806870
	.xword	0x0a7d7a6d7df40dcb
	.xword	0xc25a96dbf94537ad
	.xword	0xdf784e3259b69ac5
	.xword	0x78f75bd985f9ecf0
	.xword	0x1a4d428710354673
	.xword	0x3d037751e2dd6aae
	.xword	0x61fce3a6b0b9a324
	.xword	0x4e4f79c082b894e7
	.xword	0xfff29d6d15149386
	.xword	0xaba1eaca5a9a80ca
	.xword	0xf76cad0f8a10f258
	.xword	0x91398096fc7a774f
	.xword	0x71149d5ed8f2ef18
	.xword	0x136f2524253f5db6
	.xword	0x25b215b817af3a75
	.xword	0x4194f0c61b9b6ede
	.xword	0x78b47f251cbb8e48
	.xword	0xa0972b97ad597ec2
	.xword	0x886f39e2b47d1164
	.xword	0x40a1fd32a7b9c159
	.xword	0x3c2d5351627bd1f3
	.xword	0x23bf793f8a7b965e
	.xword	0xa232c33c37950f51
	.xword	0xca717b833d0035b1
	.xword	0xd4fc9a1916ce82e5
	.xword	0x5cc8d8c1c945696d
	.xword	0xe4ffe9ca22a7eabd
	.xword	0x26993608c7f0e0c2
	.xword	0x3f784c30ca1ec0e2
	.xword	0x468a3f2968524ee7
	.xword	0xeba57e74ff95ca60
	.xword	0x49056c93a8d2b487
	.xword	0x5befdcbc612916f9
	.xword	0x77e239e8685b0d47
	.xword	0xc0e079bd577bd230
	.xword	0x89b7d738a015f37b
	.xword	0x17c627c54d1812ba
	.xword	0x939ccd9774f607eb
	.xword	0xc932cbf602f03a59
	.xword	0x100667dcd1f7d6f4
	.xword	0x08639422223cf1b8
	.xword	0x88ad013233620335
	.xword	0xa1f4dbd3efb071b4
	.xword	0x88bdd7c8fd234a55
	.xword	0x70c247cbedc812df
	.xword	0x23aac53b236181ba
	.xword	0xbab47068fe5c7d74
	.xword	0x993f107423514c65
	.xword	0xb33eda1941590d44
	.xword	0xf4976a61fc3f5730
	.xword	0x02f6e88111280755
	.xword	0x1bd08b284a9bd369
	.xword	0xbc35d2d64e13307b
	.xword	0x99ee163de88c1b85
	.xword	0x2389642541814927
	.xword	0xc1049f1f54e11b5e
	.xword	0x57c734d3e097f621
	.xword	0x9d5fde9c1be142ec
	.xword	0xf429e6ab59ce1466
	.xword	0xa72c56194b47f7b7
	.xword	0xbd4cbcf5c03ab13c
	.xword	0x4142aeef275543b2
	.xword	0x65dcd545577e745f
	.xword	0xee292c3e408528c6
	.xword	0x371ee0639622cd71
	.xword	0xfb17c15b7c11f28c
	.xword	0xaa2ff3fb03feab13
	.align 0x4000
	.data
data_start_2:

	.xword	0x89ca988b27d8c421
	.xword	0xe8ee402774212b17
	.xword	0xc1c36bff217b6da3
	.xword	0x0b8d9238840344e0
	.xword	0x1835a07a10a5ab99
	.xword	0x2c160719cd3e6048
	.xword	0x3f970699c5d5dafe
	.xword	0x389d88e09b94b8cf
	.xword	0x8962b17ba6924f92
	.xword	0x0a7df83843c3beda
	.xword	0xfaa37538bf8108a3
	.xword	0x28c6900c6eac9c16
	.xword	0x5594f1cfe60429eb
	.xword	0x5cb6813142e44b7a
	.xword	0x68b117ecea7605c3
	.xword	0x6b30901f5bb84419
	.xword	0xebea0bdb9629f6c6
	.xword	0xee526c0200d0b02d
	.xword	0xc56708a5302f8597
	.xword	0x32f2daa1ccd9810a
	.xword	0xd4d110670acc9c00
	.xword	0xe1fda15ce8fd5acb
	.xword	0xbfa09024c67b4ec8
	.xword	0x58249d8d0f594a72
	.xword	0x118b42512843d4d1
	.xword	0xb5a3754429f9c297
	.xword	0x052ffc1baf94f33d
	.xword	0xdf398f91f3faf853
	.xword	0x3bc8c1ed31fef30d
	.xword	0x4735c994f31a6b4d
	.xword	0x89b5afba93f6d76f
	.xword	0x5c8b4bfeab23ef25
	.xword	0x0d32530a90974970
	.xword	0xed4cc8446693318e
	.xword	0x08b12fa6a7cafaf4
	.xword	0xe5393b2d7d802d95
	.xword	0xd89ec640cfcb341e
	.xword	0x1b56fe5e981d27e1
	.xword	0x45402e064a4e98c4
	.xword	0x82c4d7be35123119
	.xword	0x961752ed2106a388
	.xword	0x8ca764b70060ae33
	.xword	0x46991b0450c7b73f
	.xword	0x8a514801d31f08d5
	.xword	0xb39050521eb21408
	.xword	0x16e6bb3712ef44a4
	.xword	0x3082bc56b07f79f8
	.xword	0xc3191a35a75f6c55
	.xword	0x3a3fcdc4d98a2bf2
	.xword	0xc46fa1d5f9d5864e
	.xword	0xc14e0e94d75392cb
	.xword	0xe8d704d7727ebbd2
	.xword	0x2c73a0e6b1ef292e
	.xword	0x6f26c1dc4f658419
	.xword	0x3526b6a8db94a842
	.xword	0x9145aaec27f2892e
	.xword	0x1d0f6f2a3549b596
	.xword	0x83ac5ef24cc83b3c
	.xword	0x02574b8b984300c6
	.xword	0x4deeb6d19604f12c
	.xword	0xb38e6d385ba357d5
	.xword	0x9f7bd02d7e40eedc
	.xword	0xba23f211bc18197f
	.xword	0xf0b3f0fd2c19a01b
	.xword	0x324217a9d79689a8
	.xword	0xd140d0c4296ce266
	.xword	0x68c8234f3c1e11fb
	.xword	0xc01c52be3c6e78f5
	.xword	0x19cf3924493ef55f
	.xword	0xb4f6b1fc06e2c30e
	.xword	0x96f7bbbd99d220ed
	.xword	0x0a6645af997ed1ad
	.xword	0xc92accb174ba9ec1
	.xword	0x0f0052bbafd08880
	.xword	0xf47ff1289869404c
	.xword	0x25d2e9e800990780
	.xword	0xa0b7b6f34fcbb29a
	.xword	0x9d7c805f48966ed8
	.xword	0xcb19bc1338082942
	.xword	0xbc6ecb85fea4bffa
	.xword	0xc95152cd8a496f86
	.xword	0xe0028eeaf96b87a6
	.xword	0x97568486541d27bd
	.xword	0x2968bbd9fd6303de
	.xword	0xb7bf26c399ab4269
	.xword	0xe0820cef0a3e7e31
	.xword	0xb65448d44846d97e
	.xword	0x9689b413602419cf
	.xword	0x7aece42893bb1553
	.xword	0x702f1a6681f7d4d6
	.xword	0x40e863c8676e9f6d
	.xword	0xe3e9cab78adc0796
	.xword	0xd99f74a5f6e542d8
	.xword	0x2cbd3185e1cb4558
	.xword	0xdcf315c36062ac4b
	.xword	0x58fda13d69666a6e
	.xword	0x43cc007fe6f5a8bf
	.xword	0xe44c2171da256b1c
	.xword	0x10b2ee7d2f5746b7
	.xword	0xf8725c2df1125a2e
	.xword	0x14f1b595de261544
	.xword	0x9b706538cfa6333c
	.xword	0xe6591e5b3d64a43e
	.xword	0xe7f20dbdaf69c5a4
	.xword	0xfd48a4d3ac77cad3
	.xword	0xe572d5bfb847f985
	.xword	0x25365e2716fd6718
	.xword	0x6ee1226e5fcb42a5
	.xword	0xcc493fb39d7dbae3
	.xword	0xfdc61d519db46275
	.xword	0x79b7e039950e8aca
	.xword	0xda11703d7e183634
	.xword	0x0e2b8d0b495e0bef
	.xword	0xdb79effe92c0fad1
	.xword	0xd652e75ecd153ffc
	.xword	0x84b710c8b92d870d
	.xword	0xbb2dc0d69e56d94a
	.xword	0x3a5a49c700e501e6
	.xword	0x8888fea110e1c97c
	.xword	0x92013dffdbe8cd04
	.xword	0x38550908ef4262be
	.xword	0xe3b81b05b3b5df5d
	.xword	0x2a2e61791e2ec19f
	.xword	0x9d5a124e895dbddc
	.xword	0xd56f705a5f90efe8
	.xword	0x42cef98a5ad03cc1
	.xword	0x1d1df858f9cfe060
	.xword	0xdc7bb5150e172862
	.xword	0x06bef93466661a3b
	.xword	0xbfc51c1b35dfae9a
	.xword	0x02e6007c4289b117
	.xword	0x6bb06a7bde03cc8e
	.xword	0xc21d59d8786751d3
	.xword	0xc58338596c0fa2cd
	.xword	0xdf0080c00b8663f5
	.xword	0x1cf4b1ee0672527e
	.xword	0x594672960d66e6ab
	.xword	0x0995bac0d00a1d2f
	.xword	0xa9aeea4ced9ccf97
	.xword	0x3bf20db6974e8fc0
	.xword	0xb77ce3187466e0e7
	.xword	0xa54501ceac762f20
	.xword	0x7917b28c06723862
	.xword	0xa789f3fdcfbdd72d
	.xword	0x1f47d9a2564673bb
	.xword	0xe2498e18f57e193b
	.xword	0x4cdf21156ff2bacc
	.xword	0xde5e345a020f941b
	.xword	0x1d7293979bf968ec
	.xword	0xaea17e98f5226fc2
	.xword	0x70bb749f709abd7d
	.xword	0xf82405bc93574cdb
	.xword	0xd56c16f4a5fea8e6
	.xword	0x1ece43ae794cf7a1
	.xword	0xa293289f26d26804
	.xword	0x40634b8d64071367
	.xword	0xf14714007d749f45
	.xword	0x602e64359319840c
	.xword	0xf79c2108f00a25ee
	.xword	0x535449f302b8ea68
	.xword	0x754c0a9906d81f12
	.xword	0xa745eeed8f44d21d
	.xword	0x4a4a79f65f1cfaa9
	.xword	0x9e64ebe492f25cc8
	.xword	0x25c15af1aa315499
	.xword	0xae068f0fe46b722a
	.xword	0xf35937bba49c1a6e
	.xword	0x66fb2c4108978acd
	.xword	0xf9b1c0e41c5b34d2
	.xword	0xe6f238be3845fa15
	.xword	0xf51da08b741a25f3
	.xword	0x1069e8e1e9ddb75a
	.xword	0x3282f42a0088975a
	.xword	0x186d4883f31fee4a
	.xword	0x9cf928571e538bd6
	.xword	0x05b2068b14387c66
	.xword	0xf9d1b3e7babc4444
	.xword	0x7223dc317190e30e
	.xword	0x9f9e3d73708cfd03
	.xword	0x13528f5dc502b9c4
	.xword	0xf642b7296af62c6f
	.xword	0xfec391e8c691dd20
	.xword	0x2406d1f5d15d4d3a
	.xword	0x2b55993242438cd0
	.xword	0x6c3c5ccafe14b30a
	.xword	0xbc190ebb15f1389f
	.xword	0x94d3e982f384e884
	.xword	0xd66ce3fb89e8dad6
	.xword	0xf2451c4975fbaea2
	.xword	0x48a088dc6df90cd9
	.xword	0x42857cd58628818d
	.xword	0x3865af821b800aa2
	.xword	0x82b8e6344a371fbd
	.xword	0x5a7b916536e43699
	.xword	0x3990df9f5aadc24c
	.xword	0xb266fb278f319eb1
	.xword	0x3875b0c0a8ebbe48
	.xword	0x0e108327d61d4271
	.xword	0xe04f74ce9f68c179
	.xword	0xf06798054671c6cb
	.xword	0x9c35e72a5300feac
	.xword	0x11182e8e3782b3ad
	.xword	0xd072c4758914f463
	.xword	0x623387ef454a74b8
	.xword	0x2f7bc29da25a56f1
	.xword	0xaa203471af131d04
	.xword	0xc3362851db570267
	.xword	0x601f996d2c915f85
	.xword	0x79b4af832292a2d1
	.xword	0xb45e1880df8d6190
	.xword	0x85302819483ce740
	.xword	0xa23b14f2caee336f
	.xword	0xf929972409d2659e
	.xword	0xbf8073ad293aefbf
	.xword	0xda533c55dca23c1d
	.xword	0x840cbb41e83a616b
	.xword	0xa2aaaf62ba088786
	.xword	0xf07678d5e43cffbc
	.xword	0x3af00733d9dd0933
	.xword	0xce35049ab2c41666
	.xword	0xa8496f53abb91046
	.xword	0xd110f596d85aa73b
	.xword	0x06031aef166d2d7a
	.xword	0xcb93a3110d6d5fec
	.xword	0xa8492b0115f0165d
	.xword	0x59e3c1d846d4edcf
	.xword	0xb615f2d6950f63c7
	.xword	0xe3fd1b9a8492e418
	.xword	0xeff5ed3a6c33d6e8
	.xword	0xf28525f98003284b
	.xword	0x83e0e60473711d4b
	.xword	0x47f104a69c23f373
	.xword	0xea4b4c7bedf65169
	.xword	0x7517b7aba60ce845
	.xword	0xbe32d9b0e2318d0c
	.xword	0x6a9e58ac982e1dfa
	.xword	0x42da9bdc9aaba7f4
	.xword	0xcececa3deb7288d2
	.xword	0x2b253505b632dece
	.xword	0x7d22fa9a9a5e65aa
	.xword	0xee475895bd8f28f0
	.xword	0xa2a3cd04075baf6a
	.xword	0xf807058edcdc6571
	.xword	0x458b868307f10d27
	.xword	0xbd71c8b1f4a0742f
	.xword	0xb284d5965fac010a
	.xword	0xaebf63e01862d87d
	.xword	0xd7d08512b1685277
	.xword	0x792cd093fbb66ec1
	.xword	0xd1ab051e16ff4ede
	.xword	0x891863a4ae222706
	.xword	0xe7e0f8a3dc723136
	.xword	0x058fed242894fe2a
	.xword	0x056636cde7b27800
	.xword	0xfd3e338a9c6ace2e
	.xword	0x71127220f01d4e29
	.align 0x8000
	.data
data_start_3:

	.xword	0x8b0eb98b9f61bde8
	.xword	0x3161278379cd1dae
	.xword	0xe283a5105700cd62
	.xword	0x3e5c8ce09a974e4c
	.xword	0xd982cda70f95a0e3
	.xword	0x7fec088136ead11e
	.xword	0x1b726a034aaa30d1
	.xword	0xab4f81b9b6952b8c
	.xword	0x05c8f2645d6c111d
	.xword	0x619e6fceafde95da
	.xword	0x1e79f2e97c2b2890
	.xword	0xdb3c26dce77d67f9
	.xword	0xf325c695f7389c40
	.xword	0x4bd7b5a21c9817e9
	.xword	0xffde621363d54cb6
	.xword	0x8c9dbc44558c2cff
	.xword	0xbe535cb0522e292f
	.xword	0xc8b35c8e83f64b20
	.xword	0x12dc796b2b3713b5
	.xword	0x06e613b88b88d88e
	.xword	0xd5b7f048ca7c0522
	.xword	0x37971ef51fbf54d9
	.xword	0xb2a3b1a8138b3cce
	.xword	0xc3eff7114e417f1e
	.xword	0x5f8eea79c0fbb772
	.xword	0x19b1980323051e27
	.xword	0xcbba68c4eb367a8c
	.xword	0xf0d2679fa27120d3
	.xword	0x126d740a76734a91
	.xword	0x407cb356d733afda
	.xword	0xb4c78d4bacab0021
	.xword	0x6a809114f00d9354
	.xword	0x59bd8b1083fcc67d
	.xword	0x0fb96bc948e7a690
	.xword	0xa3a29e7c37db21bd
	.xword	0xa5cb9148a0a9a675
	.xword	0xcb0149417635fe0e
	.xword	0x4472dd1ad65e11a7
	.xword	0x07f896351f1d39d3
	.xword	0x186ef84f9e666360
	.xword	0x5c753994fd65f3ef
	.xword	0x32084100ae724192
	.xword	0x0e64fc3225259349
	.xword	0x416d18629074fe02
	.xword	0xecd65c2cd13bcf26
	.xword	0x90d3296e13d238dc
	.xword	0xb78e2e6c188f8850
	.xword	0x5dc93d53c470e0fa
	.xword	0xc97f9a7e706f5cd1
	.xword	0x091cabffa5eb22e7
	.xword	0xbf28a34a973ad92a
	.xword	0x0ca86fb494e83e44
	.xword	0x65a41ffc6d3152ae
	.xword	0x18b68f89c70f11b2
	.xword	0x0241003e77fa7760
	.xword	0xf755f2fd93ad0da3
	.xword	0x9e75e40e4ed97d2b
	.xword	0x916479e26e0730fe
	.xword	0x111350d82eb6939e
	.xword	0x656e0a0dff93decd
	.xword	0x23a868d8a4215f7f
	.xword	0x44e3c814429f698c
	.xword	0xcad8cefa468fc4d1
	.xword	0x3c1b68770ef19817
	.xword	0x06c4fe735f84a1b8
	.xword	0x03d4ea516e737771
	.xword	0x242a0014535f4115
	.xword	0x1d741398d66e3fae
	.xword	0xc607f84971739ad4
	.xword	0x0fdb540869a323d3
	.xword	0x820495bf19f70912
	.xword	0x183ccc6d01e284e3
	.xword	0x07a4b5623f600a40
	.xword	0x8bd825beebf2e2e0
	.xword	0x63c1cdf82ee9a615
	.xword	0x4f98963bf95d6761
	.xword	0xec2aef5e8ad10363
	.xword	0x5e9eb537ae100e31
	.xword	0x469b529cf9a94a44
	.xword	0x51bbd79d90345eb9
	.xword	0xab5b8b1d0cdba097
	.xword	0xc01727963f770134
	.xword	0x0e03a907a26bcf75
	.xword	0xb6417fb79e904b38
	.xword	0x361962966b9263f9
	.xword	0xe3586f27d6088395
	.xword	0xb55dd836511a7915
	.xword	0x42bedbae0a5c85ef
	.xword	0xba8985bb787f62ab
	.xword	0x070838107d3c6c08
	.xword	0x805584ba22f4db44
	.xword	0x3bdafd256466b29f
	.xword	0x6b553292eeea3959
	.xword	0xaa544e215f5bf0e2
	.xword	0xe4d748109e3b101f
	.xword	0x03996e288a86f258
	.xword	0xa6f4127403a990fc
	.xword	0xed954724202c514c
	.xword	0xb08692c8bdb9ff2c
	.xword	0x4abd90812197376e
	.xword	0x59d068d83c6d3c4c
	.xword	0x21fcc68701bf013a
	.xword	0x103ace31c5de98e5
	.xword	0xa274b89b8bc5eea6
	.xword	0x0b35f8c49dfa0ae1
	.xword	0xe56f1f7a4a2d7d55
	.xword	0x41979857c6296ea0
	.xword	0x58e4e53003fe6e5b
	.xword	0x327b90c297c2207e
	.xword	0x47431363e8286d91
	.xword	0x942a2e13bd33bf1f
	.xword	0x534f90526afa6b0d
	.xword	0x98f582fe00872c5c
	.xword	0xf69b59a125594422
	.xword	0x25c57dcfe0757586
	.xword	0xaf6dcdd5245b1a8f
	.xword	0xdceb1e2e0d8c35e7
	.xword	0x75572da00524a93a
	.xword	0xd4ee705e4f3cf6c9
	.xword	0x237820cafac60d7e
	.xword	0x1739c3968f2663f2
	.xword	0x8cc1d2a5fdc813ee
	.xword	0x0a4f329dff9c0eaf
	.xword	0x3079f6e11a6597d2
	.xword	0x1b39c56c5b7d9b45
	.xword	0xf88182e9938e1eef
	.xword	0x47e455eb66ebf3a5
	.xword	0x0a5c02e911ac78f1
	.xword	0xa55e4fe1cf539ac7
	.xword	0x0a9778bf31953496
	.xword	0x8e5455642475df29
	.xword	0xbf331cd77b88e812
	.xword	0x129331ef1deef646
	.xword	0x39fceaad9602c5f9
	.xword	0x79f9422624ed724f
	.xword	0x1657f629a09e161f
	.xword	0xbf131b3df6851bea
	.xword	0xad1673a45a4ccb7c
	.xword	0xae4653fadcd3645b
	.xword	0x1d7ec9420382d980
	.xword	0xeff36a5beb86eda2
	.xword	0xed4e0a19618f22a7
	.xword	0xf87a33b2071d97ca
	.xword	0x5251d2b2fd0359ba
	.xword	0xe3444dd439b02bb7
	.xword	0xdf20f473a351117c
	.xword	0x5d6b8bde3f27b87b
	.xword	0xf7f39b869edffb6a
	.xword	0x095d73e46245d9dd
	.xword	0xb5c4548489e3d6a5
	.xword	0x314738e1cb65053d
	.xword	0x67f62933a55f78de
	.xword	0x6f102fdfba428ed2
	.xword	0x90966b88fb6b5267
	.xword	0xd6c159168ba4283d
	.xword	0x27afc0d725665dc4
	.xword	0x4aafe24dc41dadd7
	.xword	0xd64c84732fa2638b
	.xword	0x56a51311181b3b8a
	.xword	0xa9284909ad138a1e
	.xword	0xdef24d3698764ac1
	.xword	0xaac0e9d86c1d7604
	.xword	0xfe2578c6a6dc5479
	.xword	0x1e365ed191047538
	.xword	0x066008cd2da84670
	.xword	0x0d84a0233a31774c
	.xword	0xb661c6edef130b04
	.xword	0xb3395fb0c8f022c3
	.xword	0x7a1a2376bbb1b311
	.xword	0x96859ef728bdcd5d
	.xword	0x4208c079a14d3bc6
	.xword	0x5985239f70be6571
	.xword	0xe90ae10d5c04f52b
	.xword	0x9d569eb101ae6fef
	.xword	0xa502edcd007795a8
	.xword	0x37889b91fe2fa7ea
	.xword	0xa652bb76d2831044
	.xword	0x961d2bfb70a63f1f
	.xword	0xe6988a9be8f06393
	.xword	0xe4d02e0f259eb420
	.xword	0xfab18a3054730e4b
	.xword	0x0108001ba5f021ba
	.xword	0x4b843a69eb0f6eab
	.xword	0x373bfc862a52d60b
	.xword	0x29601e0f4c21bccf
	.xword	0xdb78e14061840cb7
	.xword	0x5fecbc27c63c84a5
	.xword	0x23abb02e8422f7c4
	.xword	0x8a8ca2340ace4439
	.xword	0xc37e89aeb4a3106d
	.xword	0xe3fb8ff866672ad1
	.xword	0x766dbb2b89bd1df6
	.xword	0x857c4c570d0161cf
	.xword	0x13298ec4bea4eeda
	.xword	0xdc008b3100613a0d
	.xword	0x46fb399ea323c9b0
	.xword	0x1ec50fcdeebcd0c2
	.xword	0x0a701801841dbbcf
	.xword	0x2303b3da0d119502
	.xword	0x9d5ab4d82db4fde7
	.xword	0x6021792c93efe1be
	.xword	0xedcc80c2878a48b8
	.xword	0x9b779ac6304b3fd4
	.xword	0xe12e17fb73841ec2
	.xword	0x738abbbc84be8001
	.xword	0x2cecdbc27d0a585c
	.xword	0x3bcad82de7ff8ac2
	.xword	0x9877b45809fcdbcd
	.xword	0x8179b22da1fb59f7
	.xword	0x394097c11ce262ec
	.xword	0x8bada4b27391a843
	.xword	0x649bbd3741698b81
	.xword	0xc910c3a8c3ef7350
	.xword	0xec22a893cbe323ba
	.xword	0xe0ab3a3f75db39b8
	.xword	0x285160a534a81c8b
	.xword	0xaf1ba6e10570409e
	.xword	0xe33217a0b8345771
	.xword	0xf5714767b7eee4d1
	.xword	0xb8441ded4309616e
	.xword	0x79987aff3c630973
	.xword	0x4d9910689c2d3851
	.xword	0xe622173a226292b1
	.xword	0x788cf5750b7defb9
	.xword	0x5e9ca16d6fa40b18
	.xword	0xc93b2ea33dbba383
	.xword	0xb0c3ee25932296f7
	.xword	0x43c635839fa33931
	.xword	0xcf439a80de6640f2
	.xword	0xd3f9372bdf8fbbed
	.xword	0x95662e5e40961620
	.xword	0xac6cdfd679d931df
	.xword	0xb15b6949b689fb4e
	.xword	0x49e25560387c4e13
	.xword	0x4e32d8035228a877
	.xword	0x2837263f7f6a9083
	.xword	0x3a68f63bea1915b4
	.xword	0xeb20bab4c1292049
	.xword	0xbea9f241a28f31cb
	.xword	0xe85b8ed2aa7b915c
	.xword	0x007383962749f95c
	.xword	0xc0cc7cebf35c9e43
	.xword	0x48198e6d35949133
	.xword	0xd458075028984130
	.xword	0x8087d961d04f1d75
	.xword	0x762ffa727af804ff
	.xword	0xba731e1394a9f902
	.xword	0xcc6d5894ed51f579
	.xword	0x3eaea909df84182c
	.xword	0x6a3a106a62bf101b
	.xword	0xcdb5d72a32c46aa6
	.xword	0xe0a0e28c5a843cf5
	.xword	0xab7b9a19aec7c05b
	.xword	0x8cab933d1e85932b
	.xword	0x8b5d302ce9526d05
	.xword	0xa048c0e5dc40a91d
	.align 0x10000
	.data
data_start_4:

	.xword	0xd2b655d3cfb3c348
	.xword	0x7b1559b9e3293a57
	.xword	0x260d82bff72e10a2
	.xword	0x32986512a0eb4e82
	.xword	0xd2dfac378e206115
	.xword	0x5cef623e294d0780
	.xword	0xaa53f384bacfb8bc
	.xword	0x8db38a83d4147dd6
	.xword	0xecc7f3da26e8a61d
	.xword	0xccbfc72bb5927795
	.xword	0x1fa55f94dd2570fb
	.xword	0x9df153eeb3bae0ae
	.xword	0x117296ad2ea17df2
	.xword	0x5dea07165fc8603f
	.xword	0x0ae819f3fe8b9c54
	.xword	0xe7307e0ff7be19aa
	.xword	0x2077ebd337fe0370
	.xword	0xe6095a89a224b726
	.xword	0x6aa82243e9a46e84
	.xword	0x22ab8ab02ff97f51
	.xword	0x3dd47b05c4b6806e
	.xword	0xa92e26daa2238d66
	.xword	0xba86048c04c2200e
	.xword	0xd88d81420380786f
	.xword	0x407c6aecfd56e2c2
	.xword	0xd7fd69cb0f4a0a19
	.xword	0x79d7574c533d5d48
	.xword	0xf5cdb715c58584a5
	.xword	0x6f9b735f314b9a78
	.xword	0x1a1bcab6adf07a83
	.xword	0xce582ebe2809abfe
	.xword	0x88fc346e93080c26
	.xword	0x0e040fc0a9d6d1b9
	.xword	0x92890e53582c9ffe
	.xword	0x22ee7ed09219f46e
	.xword	0xcb0bcf6a3bdec120
	.xword	0x5507048efefda3fb
	.xword	0xf09cb8c7a87652dc
	.xword	0xb48a6c2357ba2068
	.xword	0xb0662f6207ae6766
	.xword	0x4f1a651bec99a159
	.xword	0xb6ffb62b2b2a61d9
	.xword	0xdb34e2405fa072f4
	.xword	0x31ad143e7460ac3f
	.xword	0x6a595902196fa084
	.xword	0xaef51d11c1fa397b
	.xword	0x11acc0fca0f79fae
	.xword	0x65698c2cd81a95d0
	.xword	0x4fc2368925a7f8bd
	.xword	0x111ed73a80697365
	.xword	0xf268fbf8244d1fbc
	.xword	0x85c78339a91854c0
	.xword	0xf1c88a9305a8d6fe
	.xword	0xfcd01fb89aef7dc3
	.xword	0xf75a0d8d48ba3605
	.xword	0xd90715955026732c
	.xword	0x8a5d0d72a0e4d446
	.xword	0x4f6d5a9a8b6117f3
	.xword	0x6150164a12e671b6
	.xword	0x0e0a91b8e4bdd33d
	.xword	0x054469e64a083f32
	.xword	0xa5a1435d9f2941c2
	.xword	0x1bd7792afeae6e5d
	.xword	0x7bd9461d6e26b519
	.xword	0xba47df2775fdc695
	.xword	0x8f47b6885ec42f9a
	.xword	0x4022f4701a5f61d9
	.xword	0xff13ffa84c8cb6e9
	.xword	0x86bbc33cfa5fb33e
	.xword	0x1db6a2a5323f7e5f
	.xword	0xc923c55827f56299
	.xword	0xd7ef660ab6bd0e2b
	.xword	0x1e7dc1efddd9ce4c
	.xword	0x6ba26607605ee8ce
	.xword	0xe3c1b3bf32f878db
	.xword	0x5371c6af89924580
	.xword	0xe5a9ea5c37cd8442
	.xword	0x9983112e52a12460
	.xword	0xff6ea34aeddcc36c
	.xword	0x6cbcf1796ce06183
	.xword	0xbb7fa44eb4dc740e
	.xword	0xcfc2156f7672b780
	.xword	0xaa5328d6f13c6072
	.xword	0x2f259cf6da4abcbc
	.xword	0x549d0a1fe525fd87
	.xword	0xc16553576d26c94d
	.xword	0x24cdaca0c1224af0
	.xword	0xe152c8693891604d
	.xword	0x2ba25e3055dd8978
	.xword	0x86d865e6215e7837
	.xword	0x003f9b003c5857d7
	.xword	0xcde2904e45f24d00
	.xword	0x88c14b865d83aa10
	.xword	0x2f6af4a12407ad38
	.xword	0x2ce057545d551f89
	.xword	0xf7694404aa7c0966
	.xword	0xe2e2d2f0d1c08bb6
	.xword	0x5df3d54e0e23415f
	.xword	0xc69f3d18d7cc99fa
	.xword	0x79bca84a107f56e5
	.xword	0xab0d7e6fa839f541
	.xword	0x4cd8bf9bce378156
	.xword	0x980020b7f54add6f
	.xword	0xa668df9c96e4b526
	.xword	0x7d8a8c13bf71a8b4
	.xword	0x21f15ef3fc6cd1b1
	.xword	0x6e49bfc832e72699
	.xword	0x68831566b3ca54e0
	.xword	0x790e2a7f2388489a
	.xword	0xd108ffd052ba1777
	.xword	0xb9ca964d087bd4b4
	.xword	0xddc44913e60f4e08
	.xword	0xbdab95d9b31a0241
	.xword	0xd56675da8a46ec9c
	.xword	0xce7e2a38c6f64393
	.xword	0x17b9fefd5a0a7d00
	.xword	0x311e9f42b4ed7e01
	.xword	0x0283bcbbb2cbfafe
	.xword	0x9607e385220cc00d
	.xword	0xe2f9c0885bd7c876
	.xword	0xefdf74341173af16
	.xword	0x650d88019bc346f2
	.xword	0x830981f727197db3
	.xword	0x54d87223c6c7ad2a
	.xword	0x72af4c4244df942d
	.xword	0x58cbaa882dd163f3
	.xword	0xe76b941abd5a56cb
	.xword	0x9a79e432201a52b4
	.xword	0xdae3244fd72ece87
	.xword	0xb3e752093fd97fcb
	.xword	0x29d926319350b5e5
	.xword	0x834d26f36a08dd0e
	.xword	0x7cf79591f38974e5
	.xword	0x393873082bd429b2
	.xword	0xa7b7f2bc7193b895
	.xword	0x19d111cebd3c1863
	.xword	0x2e3592fc50fc58a2
	.xword	0x26e2c48155473957
	.xword	0xc8be6ab0e3288e48
	.xword	0xc710477d608a3484
	.xword	0x4ea8c25abde30799
	.xword	0x96d2b9abc313919b
	.xword	0x38f2a9f179b38e6e
	.xword	0x484577a8afccaee6
	.xword	0x86ce413abc7dff11
	.xword	0x662b4fd582907917
	.xword	0x2d478bef6c5a73dd
	.xword	0x7662644f148c2705
	.xword	0xa982f27c1fd6eb7c
	.xword	0xf2d9249f704399d5
	.xword	0xc0fe5f1ed768cf79
	.xword	0xa6c58b6aba960c1d
	.xword	0xeb285619f02c8b7b
	.xword	0x4497a2cfd9684a93
	.xword	0x4e0d5ab53beecf6f
	.xword	0xace3d12c2c29d447
	.xword	0xd8b6c5f2660c8691
	.xword	0x1d5cc92b98e1864f
	.xword	0x1c055419ccdaf355
	.xword	0xc7a306d1bcf7fa7b
	.xword	0xbaa5d49a157af1a0
	.xword	0xfdf80b9600f0079b
	.xword	0x044ff9fff282b219
	.xword	0x0376f26385786a7c
	.xword	0x6434cf51e00abc69
	.xword	0xf500417b1f3ce56b
	.xword	0xde7c8e245073f855
	.xword	0x96d13d5496ce28fe
	.xword	0x3302de7887e3de28
	.xword	0x7e196a2c6e8007a8
	.xword	0x1944fa99f4d26655
	.xword	0xce12fa8bb10a1725
	.xword	0xc29472555c455798
	.xword	0xaa6db6017c5be58d
	.xword	0x82f2d089a1ce76c8
	.xword	0x70a986430ff82969
	.xword	0x43734342bfc40de0
	.xword	0xc5deba9eb58173de
	.xword	0x4b1d19efc3ae29c3
	.xword	0x7aefa616deb2cca7
	.xword	0xe03880026da5ad9b
	.xword	0x57690cf72de769ae
	.xword	0x3c184abc01e65223
	.xword	0xd5f6663f545b8964
	.xword	0xb71269d9f1cd0905
	.xword	0xcfe61e3de4c03f15
	.xword	0x5a76e9b7a179f18a
	.xword	0x070cbdc308fc729d
	.xword	0x08fb7fb199ae2d8a
	.xword	0xd35d45fed923ce57
	.xword	0x22dc3cd6880f7aca
	.xword	0x8f0f464a3ea0a9df
	.xword	0x18a9aa20efd44cf7
	.xword	0x84a257e12b0f2c3f
	.xword	0x9a58f1d923a1d7f4
	.xword	0x7c97d47081a9a961
	.xword	0x328ebeac0e54f474
	.xword	0x676abaf018c56c6c
	.xword	0x2462a70b3f1a8817
	.xword	0x277a3f17b746b6dd
	.xword	0x7405b4e8e42b99dd
	.xword	0x13fdffc869d13785
	.xword	0xa6f15e9bd84a89d0
	.xword	0xd991e5f82d303df7
	.xword	0x630a3cf262f4cb02
	.xword	0xe465b6995aea7957
	.xword	0x72be31f36e846dad
	.xword	0xfabecccbe2bcf416
	.xword	0x358f184685b536ea
	.xword	0x5dfdc53e2dfbd514
	.xword	0x837d24349751b974
	.xword	0x7659c52f8ddf38b8
	.xword	0x986ceb3e319a8cc8
	.xword	0x112b7b87dd13274a
	.xword	0xec5cf8fe5a2e8427
	.xword	0x5e96c9dbb6818a1e
	.xword	0x86607d090d90bf11
	.xword	0x631ce2e495682614
	.xword	0x91046761c1f04821
	.xword	0xec54341bb035381e
	.xword	0x1557227054acb7ed
	.xword	0xea5e531467cb5f08
	.xword	0x75bbab1ad83c0549
	.xword	0x579701be18f04748
	.xword	0x6ce35e4064a61151
	.xword	0xbf8d72795a5c8338
	.xword	0xbc291d8275c856f3
	.xword	0xd494183b6c4a73fe
	.xword	0x051f6bd9b6f9c6f6
	.xword	0xe5bbef2022ff4a01
	.xword	0xe12cd709b596543b
	.xword	0x32f61cea992f7056
	.xword	0x22b60adc2775ad3c
	.xword	0x26a9dbd3365dfe78
	.xword	0xbe9a52279a51e062
	.xword	0x5711bcde10e6d552
	.xword	0xfd5701680e8a504b
	.xword	0x869488a2313312a5
	.xword	0x0424f401e1c1059e
	.xword	0xaae885d7a68da444
	.xword	0x4e6ca07f1dde41f6
	.xword	0x9c382ff73d63160e
	.xword	0xfbb8729c4cf7b438
	.xword	0xf731ba87415e06a6
	.xword	0x19aea60e3c808551
	.xword	0x84157f22ec2e4a44
	.xword	0x836731f5c79ce170
	.xword	0xdd1d4011f6f21d63
	.xword	0x6f616f27a902e928
	.xword	0x6cb59f35a4305479
	.xword	0x233b240a53e0ed56
	.xword	0x223fe3bcf955d27c
	.xword	0xb6db02ddd621ab99
	.xword	0x16d6fd25e99ce48e
	.xword	0xd9e8d672044fa1f2
	.xword	0x5add3214361f2d8b
	.align 0x20000
	.data
data_start_5:

	.xword	0x0c7244cf7ad8e6ac
	.xword	0xc326b1f0c72a4d7d
	.xword	0xda08582adf827ada
	.xword	0xef863e9a1f7284d0
	.xword	0xea7c6362028f7583
	.xword	0x3a4dff468dfb568b
	.xword	0xf21ff016a4325905
	.xword	0x8fa342f39d048b52
	.xword	0xf7c446d0dbaf6f23
	.xword	0x7cf5f265bdce04a2
	.xword	0x084ef2b9579f2298
	.xword	0x3424055685fb3a35
	.xword	0x91ac76f417e996bf
	.xword	0xb61dc4f00ebd67ce
	.xword	0x417e0d7b5a22e172
	.xword	0xec628293bab1cc08
	.xword	0x456100a2d7e64f80
	.xword	0x55ca9295e7dfa958
	.xword	0x21e7aeaf3f5d33f1
	.xword	0xaf21bc7dcc408b20
	.xword	0x64702c32ccf0303e
	.xword	0x049cb25b9fd88865
	.xword	0x62473bbe064cd2dc
	.xword	0xf44d4dd3fcf6bd84
	.xword	0x639e28dadc38469e
	.xword	0xc528949cedee2391
	.xword	0xfc7bdeca60b8d610
	.xword	0x66c91b66dc2b9d68
	.xword	0x01de6a4bd866067e
	.xword	0xd82bc433b6dbb44b
	.xword	0xcfe4e0d7c998f9f6
	.xword	0x1b1bccd07af57bd3
	.xword	0x3543e2b2ee3e4e91
	.xword	0x7805acfd33bdab9d
	.xword	0xd7a3ada19c6c076e
	.xword	0x5fe5f10ce52e5dca
	.xword	0x55b5f2d91ba8fe02
	.xword	0x0f984ad82e574439
	.xword	0x8f0c7b37936a6ec9
	.xword	0x76af3426430fca27
	.xword	0xa98da91a768f9904
	.xword	0xdc420eed1f853759
	.xword	0xdc1a33fa67f24061
	.xword	0x8df5481ffdbe04ac
	.xword	0x242c771e6254cb1e
	.xword	0x48ec92305a039106
	.xword	0xc72bbb3a14582757
	.xword	0x568e599f933cfd02
	.xword	0x6aece150fb8b3c5f
	.xword	0x95af681199fb54e4
	.xword	0x2e126fa330747703
	.xword	0xe54af4e335c0ead2
	.xword	0x3bd3933b468f9838
	.xword	0xb2c775fa6425501e
	.xword	0x6e617e8014a8c8b2
	.xword	0x4cad92cb71e27d60
	.xword	0x9db631b227b03020
	.xword	0x04bf8895cd498922
	.xword	0x520e48e204b0e2c4
	.xword	0x918b47210b2b01f3
	.xword	0x9ef5862c328252d5
	.xword	0x1e7fd767dacab4b2
	.xword	0x1c83052164433a72
	.xword	0xd3217d8ef26bedc1
	.xword	0x8772bc1e3692bd6d
	.xword	0xf33a6e2b39d74630
	.xword	0xe419342b33d33f2d
	.xword	0xad98a4f1d72411dd
	.xword	0x625df9b073df6560
	.xword	0x40138d30cee99db7
	.xword	0x8ded1abee5612444
	.xword	0xc11dc31c5b8b291d
	.xword	0x446d54acd7fdae80
	.xword	0x921b23fe1720f8f9
	.xword	0xac98dc89df09aab5
	.xword	0xb83f4bf849cdc64d
	.xword	0x41de9439a618472d
	.xword	0xebf5b01d8f942a93
	.xword	0xb9b8559aca226a02
	.xword	0x91be4cac06bb02d3
	.xword	0xaf9e70c517253cde
	.xword	0x892a27ca01bd5a90
	.xword	0x9271432687e009cd
	.xword	0xa6813d758018f096
	.xword	0x6f32d012618f2815
	.xword	0x4de418df4cc77067
	.xword	0x1760706e6870b2a5
	.xword	0xf007d9973d1c5267
	.xword	0x1d29902e1a8875ca
	.xword	0xbb18d6f62b2dec6d
	.xword	0x784f70c56a18c815
	.xword	0xdb9be81e1ed6b042
	.xword	0x042061424a9232fe
	.xword	0x2489600511bb8b69
	.xword	0x4e8b171d183fed2a
	.xword	0x7b3be4b88a59210a
	.xword	0x3ed09a8df95e68b2
	.xword	0x98310b4cbd64c99d
	.xword	0x53bf91136813d2f6
	.xword	0x05de8ffd80e3e40d
	.xword	0x2b4a07e2f5a0dab5
	.xword	0xe74a25338030c4a9
	.xword	0x634e05a2910902f3
	.xword	0x99ff6042e59f39f8
	.xword	0xa14ca3b6680df6de
	.xword	0x2e0a06da1ed4175e
	.xword	0x3601089f0a55dcff
	.xword	0x09b4942d6873c348
	.xword	0x77d0e32c43162977
	.xword	0x8fd11a197460984f
	.xword	0x33633d8a8ce48115
	.xword	0x23242660dbb7dea8
	.xword	0xd9a06d14be34cc7b
	.xword	0x8fc186631e3f1ce1
	.xword	0xeb355dfebf2ca90f
	.xword	0x0277c34ed9b8a065
	.xword	0xb2a8b5084cbb5032
	.xword	0x76521de16200ffcb
	.xword	0x7593e611311bf64e
	.xword	0x614050d7dbd982a0
	.xword	0x9cbbe544d671bc35
	.xword	0xdaf832c637294e84
	.xword	0xfceffdc9d2351135
	.xword	0xf286e02bef9e9178
	.xword	0x875165c448596db1
	.xword	0xe7ae2ba26a3b7361
	.xword	0x5836dfebdd7f0d60
	.xword	0x8dfdf822cba8d099
	.xword	0xfc7fe9ad94404c3c
	.xword	0x37ba65bb3ea6e12b
	.xword	0xf548bdc607f92be2
	.xword	0x78107e94f28fba76
	.xword	0x8d82e3688f375f2a
	.xword	0x9ec5cd1bdd2f770b
	.xword	0xdef9de977899bf81
	.xword	0xfc49114e332bd376
	.xword	0x26ca19f19bd17b06
	.xword	0x6024d70be4b25263
	.xword	0x14efb7daf526297e
	.xword	0x25b11e81c41bfa4c
	.xword	0x4cc4777da1002573
	.xword	0xdb5bff5b6b714cb3
	.xword	0x15bc7286e698c0a7
	.xword	0xc0cecca434bacae0
	.xword	0xcb4e508aa2a35d89
	.xword	0xce2efef47f63d21c
	.xword	0x4b2f2829dd59508f
	.xword	0xbab9bdb6182f105e
	.xword	0x034b224456f4066c
	.xword	0x4ce5d3c6c3588f61
	.xword	0x40ddbd03ff0efd29
	.xword	0xc9811a347f5a824f
	.xword	0x163813a55a8a79eb
	.xword	0x8d6b74e422eaf674
	.xword	0x30301bee244b77e1
	.xword	0x1b1eaf7627312b4a
	.xword	0x347247ad05723f3f
	.xword	0x660b309f28cf3ebc
	.xword	0x6ce4ca4955eff21e
	.xword	0x8c3221fb41710ea3
	.xword	0xe87bc0372b49d450
	.xword	0x09e67a810dad8872
	.xword	0x8d981abb328cfc84
	.xword	0x504d2df278eb6946
	.xword	0x78568ba52ab5383b
	.xword	0xcc6caf882e991df4
	.xword	0xcf9c3b0751f6babf
	.xword	0xdb7f5c82b3095300
	.xword	0x7336f209e33b0380
	.xword	0xbae55c08b4933dff
	.xword	0xebbfc3a140ec1519
	.xword	0x156ae030069d878e
	.xword	0x4bdd390f72cf7831
	.xword	0x011c6b6c5d3b43af
	.xword	0x74b65a2f2b318ec5
	.xword	0xe492b03702911219
	.xword	0x4e097efbea90d97f
	.xword	0x65f6233c99b056c1
	.xword	0x76e5ae75899ef32a
	.xword	0xe4ee5eac458105e2
	.xword	0x221152dc64fa03dc
	.xword	0xcdf769d613a37c43
	.xword	0xfa5365acdb365668
	.xword	0x662cf6aef7c92459
	.xword	0x58f94c9a6168190e
	.xword	0x04396db3e398cc06
	.xword	0x8c79b8d77157ffe0
	.xword	0x8a1e17e88148e274
	.xword	0x0008cbd48c4eb2f4
	.xword	0x2b80072a9d15391e
	.xword	0x49c9f3976aa1d5e2
	.xword	0x45af60ec93931f83
	.xword	0x7c571559c4a374d0
	.xword	0x03844b17be5d1141
	.xword	0xb083e5efd00cd4da
	.xword	0x941fb638175f15ba
	.xword	0xa77888ebe357d654
	.xword	0x09d870daf4b817c4
	.xword	0x469b3c5d444f0402
	.xword	0x20dd5a47ec04f149
	.xword	0xa22b406a85fab832
	.xword	0x05aa68d0def4b50b
	.xword	0x3721235c6d2b5912
	.xword	0x4c34e11186d42a95
	.xword	0x7c0716c45b0ad9e6
	.xword	0x8e5e09472cdb572c
	.xword	0x4fe4aa92fd46504b
	.xword	0x657685c8722bd3fc
	.xword	0xa30b8fa329777f1b
	.xword	0x7b84fd36f0c3499c
	.xword	0xb9859f497d0df3a2
	.xword	0x539f20fb86553b3c
	.xword	0x612f3a35dfa425cc
	.xword	0x3ca3ffc7fc8bafda
	.xword	0x61dba10272fbf925
	.xword	0x98aa0a48fef49085
	.xword	0x4cc5f7aa54a40ed2
	.xword	0xb2ced9e50a788975
	.xword	0xd43af1fbd1c7bdaa
	.xword	0xee2d9a944e95f898
	.xword	0xa0616443610bdb5f
	.xword	0x100ea2a3b15074e5
	.xword	0x7929a81dc5b9b1c9
	.xword	0xe21145910279ed9c
	.xword	0x56945e1af1a69fae
	.xword	0xcf8ddf814ae6c717
	.xword	0x71cbfc25a4cce7ba
	.xword	0xfba72817a5f4e45a
	.xword	0x24714a982b88ac2c
	.xword	0x42a3b5099951eeaa
	.xword	0x64fd51ed51c73b23
	.xword	0x6e174998732eb1b4
	.xword	0x15b51b1a2f7a9111
	.xword	0xf86d0ea1b116c1c1
	.xword	0x1c97d04f5896bc43
	.xword	0x623066f7dd220246
	.xword	0x02ab6c2c1d8d2000
	.xword	0x8766c28dffbd360b
	.xword	0x859feb1769327949
	.xword	0xa6129bce7ea57622
	.xword	0x03ccef56fec85bdf
	.xword	0x8a884e04704715ad
	.xword	0x939f09169d2028b2
	.xword	0x4010ba48c4eb41ca
	.xword	0xba0aa0e2af1f23c0
	.xword	0xe6f3f84eea562550
	.xword	0xc7c29a673cdc42a7
	.xword	0x57f57e9785359618
	.xword	0xf02e9dce5492371a
	.xword	0x6b09eb7622dc2555
	.xword	0xabebb69368b4b478
	.xword	0x1dc22e607ddb487d
	.xword	0xbedffb78a8027387
	.xword	0x0b0733de824f1213
	.xword	0xc60ee55910eb899b
	.xword	0xe01097095acbf5bb
	.align 0x40000
	.data
data_start_6:

	.xword	0xe3c94292a2a2ee8b
	.xword	0xd4533b9e7db404d3
	.xword	0x5977a7762a9bea63
	.xword	0x32e32f9fd6c04c99
	.xword	0x4c10ac5e6d0f7f26
	.xword	0x39dc96c9b255268d
	.xword	0x503e67a0bec0fb1b
	.xword	0x0edc4ef8c11b9b61
	.xword	0xb0a4cec65fc414ef
	.xword	0xf63a912e540bc9bc
	.xword	0x48302ca614d5a957
	.xword	0x582e66a3b1ca37d1
	.xword	0xe37e377672d6bf7c
	.xword	0xd29d979b6227882f
	.xword	0xf5fc93d4f01243a6
	.xword	0x5bd78c808cdb4307
	.xword	0x15c57ab4dfcfedfa
	.xword	0x1834c8d16ccd841e
	.xword	0x7c313d631aa1c2d6
	.xword	0xdf5ecae67dad22f1
	.xword	0xb8971e3ed21628b9
	.xword	0x19418fa6ed1bee70
	.xword	0x3f6782d94fec58cd
	.xword	0x46914857c660179b
	.xword	0xaa67343a37e6b26e
	.xword	0x49056cf6684173d5
	.xword	0x9867e4cbb5765fe1
	.xword	0x1620d4701624362e
	.xword	0x2c88f79c0f3dfb7c
	.xword	0xd18566f9a8c8ac19
	.xword	0xbe868bb1b1310e75
	.xword	0x92443fff600bf1b0
	.xword	0x40211def9f304b2b
	.xword	0xf19f97c948389c25
	.xword	0x976ba1c56ffe57eb
	.xword	0x0c105deed70c5efb
	.xword	0xba812213e5dc381c
	.xword	0xbad94614d0dd4691
	.xword	0x5335f09b05c79f9d
	.xword	0x465d386b938124cd
	.xword	0x284b355fb7089946
	.xword	0x6d9b13680eacecdc
	.xword	0xe2ab90cb9522d1b3
	.xword	0x9e0e5386ca396fee
	.xword	0x8398a90c07051383
	.xword	0xdcf7fac2354ae8b9
	.xword	0x6a2552127e88dd37
	.xword	0x47cb493e852114f2
	.xword	0x00dfd2a5b0a6868a
	.xword	0xd636f702a33168db
	.xword	0x90f865ad04f321a4
	.xword	0xf8fa11f409cff4c8
	.xword	0x21501eceb56a7408
	.xword	0xfcf97c60f276ef15
	.xword	0xadd068608773c33c
	.xword	0x7adf27f3e12ce296
	.xword	0x8b8333414ec771b5
	.xword	0xc7c4e0735003bc81
	.xword	0xaac874bf435b9eb5
	.xword	0x00f25ddf11c6f1b8
	.xword	0x31cb40d370e11a97
	.xword	0xd21e67a6be676c84
	.xword	0xa057a827105dd65a
	.xword	0x4883f7515459af0e
	.xword	0xaeec4d3b6600dbf9
	.xword	0xa68e52b59f5b3a1d
	.xword	0x261cd58031560d83
	.xword	0x5f36f604399c7280
	.xword	0x4f0f04026e722d07
	.xword	0x826a25f5a80a8416
	.xword	0x39272148bf92311f
	.xword	0x9c74d95e5ac405c4
	.xword	0xb77c8cd93a8a823c
	.xword	0x7bf0a6ad1b5e719d
	.xword	0xda10faa4c8670e86
	.xword	0x4d9ee9148dc91bd9
	.xword	0x364e8551e61b3c6b
	.xword	0x2deab77a7658a59c
	.xword	0xa03108b29489b050
	.xword	0x177dee633f4c3d3e
	.xword	0x129a20d68eb719b7
	.xword	0xc05d61412a49eea2
	.xword	0xf3455ec6f16caa67
	.xword	0x8eff6a5f965f7e87
	.xword	0x4c8beee5079f65a2
	.xword	0xe3c0e10abaf3075c
	.xword	0x3e5911ce65f1cec2
	.xword	0xc9a7e9d8e3b8b68e
	.xword	0xa0403a20f6d24742
	.xword	0xe537b82a6ed83b79
	.xword	0x8a756a0abd36829c
	.xword	0x66ce0f3592220d37
	.xword	0x96086492152838c3
	.xword	0xae3ef7d783baac1b
	.xword	0xfe431455c3eac1f7
	.xword	0xa160a07df5821fd9
	.xword	0x79504b33b6ce1c85
	.xword	0x4dac9f8cc6953c0a
	.xword	0x374ac8375c1b7427
	.xword	0x75fce6505ddadc9e
	.xword	0x385d603abf61b312
	.xword	0xbc0462c39c949822
	.xword	0x6611a9249e8a3c87
	.xword	0x080b46679e5adb65
	.xword	0xae70162cf8667001
	.xword	0xeda4469653890c8c
	.xword	0x9e6020f958835dfb
	.xword	0xd53ea3a7e44c4fad
	.xword	0xef9011f28f412b21
	.xword	0x126d9bf8334bc5d0
	.xword	0xfe3d40aa6f411e6a
	.xword	0xd05204b86a38b548
	.xword	0x015f6e11d1f0b8b1
	.xword	0xfe0dd119e42739b2
	.xword	0x5bdb1e0390d86d73
	.xword	0x5e7913b3f2e82a7e
	.xword	0x09327ca5bc76c46a
	.xword	0x8194b2f0fd71e6ed
	.xword	0xec777c5f202a8b38
	.xword	0xc0a433458bbe4b7d
	.xword	0x6886cbb6ff63c9f8
	.xword	0x1ff94abc874e0e11
	.xword	0x2a15114efd3278a9
	.xword	0x4ea93a5df512b757
	.xword	0x6dd20ffc31430b87
	.xword	0x12465be7d7ee1565
	.xword	0x5e0b3ef7a9047c96
	.xword	0x9ab0f2d5633d8c37
	.xword	0x974792e1b03854f9
	.xword	0x59af3d1f12ff7051
	.xword	0x712c04133877e7d8
	.xword	0xf16221a3caa89c9a
	.xword	0xf8306587b8091bb2
	.xword	0x4d88d7df859f298c
	.xword	0xa35dc19ae622480d
	.xword	0x371a5e350dd667c4
	.xword	0x7c3ba9c8e15ab6f7
	.xword	0x5be97e41887b0d28
	.xword	0x02a2f264bbb789ac
	.xword	0x3d853f0f7de88b42
	.xword	0xb6a0448143bc8f07
	.xword	0x8cc166675d772552
	.xword	0xa66ec19471250519
	.xword	0xffc73936805b86a4
	.xword	0x2b134ca96a57eec9
	.xword	0x7d3233ce5c411775
	.xword	0x7d130878f7b6f33b
	.xword	0x2ce8e4c447d0633f
	.xword	0x64c856352ae4cb80
	.xword	0xc388e9e3a578f975
	.xword	0xf9cf497175e074c2
	.xword	0x646884ba67bc95e1
	.xword	0xa58511aab3847c78
	.xword	0x89cd3be757fa6f12
	.xword	0xbf8f786b3674cfa0
	.xword	0x88c585b4f0ec855c
	.xword	0xd40addadb6a42f3b
	.xword	0x169acabad161004b
	.xword	0xfee8c1056c612c72
	.xword	0xe6a7f2bc7dfdfcc5
	.xword	0xf8739a83d293ea36
	.xword	0xcd44a45700680e10
	.xword	0xc6b29bbb870a50c9
	.xword	0xd1396f52ba205696
	.xword	0x7160b4669fa16d17
	.xword	0x559b45f1d12cf6d9
	.xword	0x0ad006b6bf24b25c
	.xword	0x4b548e9df8c65174
	.xword	0xd4a28b6a9f8102a0
	.xword	0x2fda2a1281a62efc
	.xword	0x57d514e7885707af
	.xword	0x118d36ec8818cfab
	.xword	0xfae3ce431541611d
	.xword	0xc3ce2327afda88d9
	.xword	0xf296fd8f82d09e68
	.xword	0x18d61cf72bddbc66
	.xword	0x505fee07a04ecacc
	.xword	0x6998cff911fff2b2
	.xword	0x21f54220e5b3b25c
	.xword	0xc0cd8057555a5465
	.xword	0xd100bc7d4485e5f9
	.xword	0x6344aa3a20645762
	.xword	0x2d5c7b6fd70c896b
	.xword	0x835df023d7cc8aae
	.xword	0xeccfc6c8726191a5
	.xword	0xfa8e0899307fcad8
	.xword	0xacc2af7a6402b046
	.xword	0x3d8bfc513e77ba89
	.xword	0x9919a4b628451811
	.xword	0x3416c6ef47955413
	.xword	0xc41453a0cdb488f7
	.xword	0xe3cd36546a81290c
	.xword	0xc09a09fd8cba54c8
	.xword	0x8320b60bb7440b5b
	.xword	0x7a654443bf09c949
	.xword	0x9f4d24344cee8143
	.xword	0x90f9eac06ea6e0e8
	.xword	0x2d6fcbe787064021
	.xword	0x967c82578ac35edd
	.xword	0xdc6510501c7b60d8
	.xword	0x43427f5b3414836e
	.xword	0x4f3b0887f338cf5a
	.xword	0x7b66cff316ee352e
	.xword	0xa1d065b0b0d8a6b7
	.xword	0x76a075f049f3a5c8
	.xword	0x2cd949bca18aecad
	.xword	0x63c2454c49e9b0ee
	.xword	0xd02aba5448181700
	.xword	0xc513e2b7ee444a60
	.xword	0x293c4425cfd804ec
	.xword	0x116d40fe5d5f9587
	.xword	0x0434085024373361
	.xword	0x8294da73ebd3f033
	.xword	0xfa1fc3f05dbf6972
	.xword	0x5ed031e627facc7c
	.xword	0x7b0ae7bf0b512175
	.xword	0x2d79ec875eb2efca
	.xword	0x4801bd7a7c9b0a0c
	.xword	0x668519c8e748f13d
	.xword	0x70d1c66186a4c607
	.xword	0x82a301f854a1e79f
	.xword	0x5ee26c78f975807c
	.xword	0xdd96fe746892d16a
	.xword	0x8e9b4b1a46736b02
	.xword	0x2f953407bdf74090
	.xword	0xd4daa69bd50b8698
	.xword	0xb5766e58eecb9123
	.xword	0x88dbbc1e1dad5392
	.xword	0xbcfd25a62ed5b60e
	.xword	0x13beb84eb5714a57
	.xword	0xaaf41bba70b27765
	.xword	0x4cbcb03cc32a71cf
	.xword	0x222ad246a305b0ca
	.xword	0xe5c6128506ae0cc4
	.xword	0xac98bc8e544ab98e
	.xword	0x274c18f799a8968a
	.xword	0xd9bd24a213091a8f
	.xword	0xbf51b54c2c1c15a4
	.xword	0x2baa528022ff87fd
	.xword	0x99eb2a39eb29f6ea
	.xword	0x5c8aacde1ade678c
	.xword	0xa44fe2d18793b749
	.xword	0x4f3c4acba79d8489
	.xword	0xfdeeab062c441975
	.xword	0xae979c50b442a9cb
	.xword	0xc6b9bfd1fc844682
	.xword	0x42dd82911fa67e0b
	.xword	0xe822b7d9f6bff9b6
	.xword	0x2882a1602f500989
	.xword	0x8b7b5a57b4b0004e
	.xword	0x70076ecdc7af8fca
	.xword	0x2b3be2c555c5fec7
	.xword	0x7ed9f033505b0972
	.xword	0x43bb6e7a4756d2de
	.xword	0xda5ba88aa07b05d7
	.xword	0x191b0795f13a89e8
	.align 0x80000
	.data
data_start_7:

	.xword	0x561f7160f58b9c26
	.xword	0xead4bbd716752c34
	.xword	0xeeb847bebaae3ad2
	.xword	0xa7ea7d9668f75022
	.xword	0x15f8967d5571997c
	.xword	0x07d4b8c425101db7
	.xword	0xdb48f343796d5c8b
	.xword	0xfee0ad4b3a9e7ea1
	.xword	0x9ab4c5342a618bf3
	.xword	0xf12c89c701d9f0e5
	.xword	0x99fa61da32dc353e
	.xword	0xf881b999b9eccefe
	.xword	0xeb492b1ec35bacd5
	.xword	0x96b4de8c5becece8
	.xword	0xfd4c80c10068b2bc
	.xword	0xd8bc1bf0e586b72d
	.xword	0x1aaff608ff57124b
	.xword	0xb4e4ee51f2c9f1d6
	.xword	0xcd2e4a5182e69f5c
	.xword	0x5bcddc3d2e91057b
	.xword	0xda06ac74d4e648f4
	.xword	0xba190eac95749b83
	.xword	0xf336abeb59a1a7f2
	.xword	0x7fe64e39c569eb0a
	.xword	0xc7e6976d3594f83f
	.xword	0x055e15bbb6bcf6f2
	.xword	0x94d5f6c6beb0d7ea
	.xword	0x1c1ca50c4149d238
	.xword	0xbb584e7e343e2514
	.xword	0x7080780dd68efe74
	.xword	0x91b73ade1cf59158
	.xword	0xce1022627ddbf8df
	.xword	0x36a76bf5c93c492f
	.xword	0x1370629a108a9ff7
	.xword	0x7a941324d9e460af
	.xword	0xbe6e91f44a31b770
	.xword	0xc93a29224cf43fe0
	.xword	0x5ce3b1030ecb8d74
	.xword	0xeaebecb098971091
	.xword	0xd1f17e6c49959fbb
	.xword	0xbac453ad5db2603b
	.xword	0x3a3cdbaad613270d
	.xword	0x5ede0da6eb55473f
	.xword	0x541816c64e67ae1a
	.xword	0x0c49cfa65062e773
	.xword	0xcb675f06427c61c5
	.xword	0x7831c8e5767ccc87
	.xword	0x8813dd850dce22d1
	.xword	0x7cf79a6c290aaff3
	.xword	0x184f7873e885a960
	.xword	0x97cc34d8731f006c
	.xword	0x200cc0c3c56fe999
	.xword	0x4135fa554e5c79aa
	.xword	0xa4501be11aaa115c
	.xword	0x63474ea7aab60118
	.xword	0xf2f387af6463afb6
	.xword	0xb34eb6b85fac2b63
	.xword	0x3db716d0817324ce
	.xword	0x0d47d74a2cc8d9e4
	.xword	0x421852d5a82d0b86
	.xword	0xb0441c4179fb755f
	.xword	0xa6a07ff1514c3ece
	.xword	0x26ffce02243242cb
	.xword	0xaeb830f423670a6c
	.xword	0x5984aba54892601d
	.xword	0x72614c12bec5bb64
	.xword	0xe9985f57bbfd39e9
	.xword	0x60414ed83e5cdad9
	.xword	0x1eae7daea8bbaf07
	.xword	0xb7a8dfbb3dadb940
	.xword	0x96adb91a18b04bba
	.xword	0xabe79661ce638b77
	.xword	0x243c6a6be8d01e00
	.xword	0x8c1fe08f44757de3
	.xword	0xdb5c1e1fd3659c11
	.xword	0x5b6e1f936f8d743d
	.xword	0x0f856c766f88b7c8
	.xword	0x836d0a771d0eb86e
	.xword	0xb164a8bf6ce78f40
	.xword	0xaefdbdfa2e16d5cf
	.xword	0xe9317fa1f0076544
	.xword	0x58c2f355705ab711
	.xword	0x4dbe2bdc6eadb12e
	.xword	0x89e2852a3f5aa0bd
	.xword	0x5d9f7aa4fd1f5d86
	.xword	0x890e9450a337c59f
	.xword	0x24d6ff9ecfe1e0ae
	.xword	0xcc71369128964ee5
	.xword	0xe262dc6db9f50c22
	.xword	0x9f8cffac73a6293e
	.xword	0xa529c02b7ed9410b
	.xword	0xf6efa64e778d4a7c
	.xword	0x8a831d630998a959
	.xword	0x6a58c684ddd19653
	.xword	0x89dbbf72d467c670
	.xword	0x1db26aede8ff5489
	.xword	0xeb350161770cf9c8
	.xword	0x5e6dbeea99e9f084
	.xword	0x24d8f514f864dc7c
	.xword	0x2a9a7587ee95f001
	.xword	0xfb6d8dcc88ca6e31
	.xword	0x438961682f2f0410
	.xword	0xb55bac5e5e0aea8a
	.xword	0x8050359d43e69d2b
	.xword	0x6bf37fb25b389d2f
	.xword	0xf88dc1c0141f9eb3
	.xword	0xc50f5e53c6e735e6
	.xword	0xa4f1557e289096b0
	.xword	0x84c8e479ab72cdd0
	.xword	0x441020909375422a
	.xword	0xd41c44c1c4ab3876
	.xword	0x6e9ad400e7896843
	.xword	0x367f51e592c2e1f8
	.xword	0xafd3973ce3b4518e
	.xword	0x7efd251dec92a166
	.xword	0x3824ad31980f7c39
	.xword	0x147ff56182e09f92
	.xword	0x724292938deb67c3
	.xword	0xafe2d19f86d56fec
	.xword	0x799794ee42088006
	.xword	0x50db0eb56cd311bf
	.xword	0x8b4c4e13a50b13d4
	.xword	0xdc1199099dedca9c
	.xword	0x3b546687beb77c92
	.xword	0xbee5f054001133aa
	.xword	0xdc895a744e59ebaf
	.xword	0x590a5e7d7e204737
	.xword	0xd6f7dad6a5e3624c
	.xword	0x6d066e2c4f7f539a
	.xword	0x6c19d4268397cd70
	.xword	0x011d98b45220f574
	.xword	0x8d714547da5899bd
	.xword	0x0bd3bbff38b7382d
	.xword	0xb93689bf030adeb5
	.xword	0xd889c30709f8334e
	.xword	0x4c05ca5f6c54de53
	.xword	0x680a4603db0fb900
	.xword	0x14e9ce024679bc23
	.xword	0x1f02f4557607f67e
	.xword	0x65ef58d359dccc9b
	.xword	0x37be82801266dac3
	.xword	0xa929739f9811c92f
	.xword	0xe2443a66936bb0ee
	.xword	0x05acd0ac174600d2
	.xword	0x24cb4314883ebdde
	.xword	0x18aeb26cbb92ba10
	.xword	0x5564d97d5d54cd3c
	.xword	0x5b93b3acbf3d07c0
	.xword	0x4bf0a73449d478db
	.xword	0x0ab6867bffb07464
	.xword	0x9ed37e996c7daf23
	.xword	0x01a5f11ee9c613db
	.xword	0xd98f9d60f25c4508
	.xword	0x08454a2b5c269b3b
	.xword	0x2239591ccd3dd793
	.xword	0xc1bb9944f3a3bd89
	.xword	0xe250214f559eb528
	.xword	0x91775e087974671a
	.xword	0xaa52cf2d05aa0eb3
	.xword	0xf090b2eef2c8d3a9
	.xword	0x6952c9525e7a6947
	.xword	0xb1e42aeda18efd40
	.xword	0xa8844180e0a0e0ac
	.xword	0x3899c41010e3bf05
	.xword	0x80c52cbc84aef992
	.xword	0xd23d71781d427551
	.xword	0xe7025f857ccfa692
	.xword	0xb02253cc7b40565f
	.xword	0x1d2f1f4bea5c55d3
	.xword	0x722bb37ea875d9b3
	.xword	0xe77ef55841ed2a36
	.xword	0xa70a43ac381ae7af
	.xword	0x2ba2726bb65ec742
	.xword	0xbe51fd4d6550e8ab
	.xword	0xfef4a6fcae3723a7
	.xword	0x4e156c9aabb3c0e1
	.xword	0x4ead3f6c51c14979
	.xword	0x90badad42008a11d
	.xword	0xc552892d4c369c4a
	.xword	0x848c6f5bb2f4f541
	.xword	0x439d3b7222d6f3cf
	.xword	0x4d20e056cc7332e7
	.xword	0x3e5575f542a3a254
	.xword	0x95bacd213160b2ef
	.xword	0x1f6221d178a13f23
	.xword	0x865953de0393fd6c
	.xword	0x1ca3207b149fa4cc
	.xword	0xb50355f29613bfa6
	.xword	0x2bcd71faea9edb9e
	.xword	0xfa298dd5d6d5a54e
	.xword	0xcf38e7639a5c147f
	.xword	0x1325cdbd4392372f
	.xword	0x0945c5609d3b77ec
	.xword	0x9f801fe27d2e8245
	.xword	0xf236a2781609d4f6
	.xword	0x287300acc85f19ad
	.xword	0x00a41bf71ea015b9
	.xword	0x7e8921c913bd2606
	.xword	0xa6349ead3bab5ccc
	.xword	0x0c8cdd7f987c4f74
	.xword	0xeb4a93a8026320a5
	.xword	0x1de7c82baceef284
	.xword	0xd33d5762281ce583
	.xword	0x7d13457c5e111912
	.xword	0x723bd8e65353d51c
	.xword	0x59ed862d414641b7
	.xword	0xf06ab5f8abf9550b
	.xword	0x4a07c2d785f9c26c
	.xword	0xa3a81f0d86cb52b0
	.xword	0xd47e905248047e65
	.xword	0xc89dadaaec94193f
	.xword	0x72d17aae067bff57
	.xword	0xb2452cc8b3cd4874
	.xword	0x885fe8f48e4775b2
	.xword	0xfa03cfb7137017d3
	.xword	0x6aa1ab4b1f5b4bbb
	.xword	0x32e964ef6825b4cc
	.xword	0x05a78f13c1faa1c4
	.xword	0x11b1059ceb9d5ee7
	.xword	0x5a53c676c76d19f9
	.xword	0x77d487a1c98b7194
	.xword	0x62001a0c41981379
	.xword	0x598aa7dc1047cc09
	.xword	0xc06fd65024fc3edf
	.xword	0x8a12ead7cc7b413b
	.xword	0xf6665f9133a25433
	.xword	0x691b724df169a359
	.xword	0x7a8700cb3720750f
	.xword	0x8413c7f6406fe9f4
	.xword	0x2fd3f7570dd83058
	.xword	0xbe961ae4eead22c5
	.xword	0xb08ed015346ae199
	.xword	0x2eb2d51aa66602f6
	.xword	0x931a8825274ccdc1
	.xword	0x81acef448ecb11b4
	.xword	0x841355aa5989c5b0
	.xword	0x41d87439c900b4b5
	.xword	0xb6b6fd24f50fc25f
	.xword	0x81941415e5e9d135
	.xword	0x08d058263cf403c4
	.xword	0x3b62a7e4f4770db4
	.xword	0x091839a019d5757c
	.xword	0x473b735a5286ae81
	.xword	0x01d20b38a7b83b98
	.xword	0x7cb933ee7b1bb13a
	.xword	0xff08568dbf600a12
	.xword	0x2eef46e7f9b107bc
	.xword	0x7adbb165d377fdf8
	.xword	0x591f69b098a882f1
	.xword	0x62016047ec9fdc35
	.xword	0x0bc2daa25c58f949
	.xword	0x2cc675a6e154dc1c
	.xword	0x15aa7f7a57650c34
	.xword	0xf690e7f408f4dee1
	.xword	0xee5da3de3f614ff1
	.xword	0x67a03bd054080de2



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
