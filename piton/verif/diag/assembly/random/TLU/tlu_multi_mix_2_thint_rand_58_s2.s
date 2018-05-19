// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_58_s2.s
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
   random seed:	711030563
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

	setx 0xd1bba38880b7a8ec, %g1, %g0
	setx 0xe57206fc0b795409, %g1, %g1
	setx 0x5742fc76e3cc82a0, %g1, %g2
	setx 0xa548b4341069418d, %g1, %g3
	setx 0x68ac3865774ce077, %g1, %g4
	setx 0xf88bfab8389131f2, %g1, %g5
	setx 0x753cfa2a3c6e572a, %g1, %g6
	setx 0x985c5afcabb3180e, %g1, %g7
	setx 0xfc86996cacd4fc15, %g1, %r16
	setx 0xb3c44d6e22428da7, %g1, %r17
	setx 0x21d59829df108b4c, %g1, %r18
	setx 0x887fa899534d4e79, %g1, %r19
	setx 0x9a23afbfbc4f4bb5, %g1, %r20
	setx 0xf51b31320f275b30, %g1, %r21
	setx 0xa50b29d97d26eb49, %g1, %r22
	setx 0x2cbba25c068aac58, %g1, %r23
	setx 0x74fbc5c8eff1ac3b, %g1, %r24
	setx 0xf9ddc465f12a4676, %g1, %r25
	setx 0xcdbe6d339604fb04, %g1, %r26
	setx 0x287e48dd2489ecae, %g1, %r27
	setx 0x84da133b65761869, %g1, %r28
	setx 0x5f78c1cff7ed57ae, %g1, %r29
	setx 0x87125665faae9783, %g1, %r30
	setx 0x498940cb7109df04, %g1, %r31
	save
	setx 0x75e30e026229f97e, %g1, %r16
	setx 0x6d0d154046ce906d, %g1, %r17
	setx 0x03b0b5b892b653d4, %g1, %r18
	setx 0x231546270f4f8c4b, %g1, %r19
	setx 0xfb19e5cd4cda1242, %g1, %r20
	setx 0x330640cdcb19eba0, %g1, %r21
	setx 0x8b07f94b57aa19d4, %g1, %r22
	setx 0xd544238df5043b89, %g1, %r23
	setx 0xc6254366ae393c47, %g1, %r24
	setx 0x0c4e497e4521656c, %g1, %r25
	setx 0x7d8bf4cbdccf05bd, %g1, %r26
	setx 0xcc3a9e682da2a811, %g1, %r27
	setx 0x09968a0c30bf2a80, %g1, %r28
	setx 0x0fb7ee420934711d, %g1, %r29
	setx 0x3cd2a9054c4a4f53, %g1, %r30
	setx 0xd4cc879d19bf20e5, %g1, %r31
	save
	setx 0xace2ab59c71da3e7, %g1, %r16
	setx 0x4487e676010399a2, %g1, %r17
	setx 0x0b28dd2213fa7642, %g1, %r18
	setx 0x802c9f48041b734a, %g1, %r19
	setx 0xb8c54f49f7ec429c, %g1, %r20
	setx 0x60030d5725f1c008, %g1, %r21
	setx 0x5adbd12d0c3f8d13, %g1, %r22
	setx 0x7f3e33677f4a0b87, %g1, %r23
	setx 0xd4f7659939142dd5, %g1, %r24
	setx 0xb0a3824838353749, %g1, %r25
	setx 0xa1d488522a27aeb7, %g1, %r26
	setx 0x269766fbfb16e339, %g1, %r27
	setx 0x028a699ad8dbaa51, %g1, %r28
	setx 0xe2d76b8d3fbf5921, %g1, %r29
	setx 0xda5b3c93bdd01b3a, %g1, %r30
	setx 0x694b15295fdc48a1, %g1, %r31
	save
	setx 0x4757991d1dfedd1a, %g1, %r16
	setx 0x4076a4226c4e4159, %g1, %r17
	setx 0x5057a7f8c1a5fe3c, %g1, %r18
	setx 0xe3cddb53b41a6ff6, %g1, %r19
	setx 0x91928538fa050dc5, %g1, %r20
	setx 0xb08a591065e313e7, %g1, %r21
	setx 0x4ba10088f0d413fb, %g1, %r22
	setx 0x443710df885be6da, %g1, %r23
	setx 0xb287e628ec7da54f, %g1, %r24
	setx 0x19278993eff2151a, %g1, %r25
	setx 0xf746cb89275de54c, %g1, %r26
	setx 0x335f969c82eb527c, %g1, %r27
	setx 0x29c6f4241a7f8d6d, %g1, %r28
	setx 0x153fd5694348eb1f, %g1, %r29
	setx 0xdcd9b428fb8c38f8, %g1, %r30
	setx 0x98e322a7ae9d444b, %g1, %r31
	save
	setx 0xc833658ed39acffb, %g1, %r16
	setx 0xdaf9fefb10ac28d7, %g1, %r17
	setx 0xf005b84db6ec1081, %g1, %r18
	setx 0x369667a3b89df406, %g1, %r19
	setx 0x01b004bdac7beeb8, %g1, %r20
	setx 0x74fe04c7487eac6f, %g1, %r21
	setx 0xf23daeecfd339845, %g1, %r22
	setx 0x5d94541354a10755, %g1, %r23
	setx 0xfb57a6066381ef69, %g1, %r24
	setx 0xfdadbf1fe40967f1, %g1, %r25
	setx 0x3ac62ee45a651b25, %g1, %r26
	setx 0xeb1082fb46c8f7f8, %g1, %r27
	setx 0xb4852171ae3aaa24, %g1, %r28
	setx 0xf012e129eeaa1cc9, %g1, %r29
	setx 0x923b75f4902dad05, %g1, %r30
	setx 0x093a9c599af30d55, %g1, %r31
	save
	setx 0xb2cbad90d6a2931d, %g1, %r16
	setx 0x8c0091308433192a, %g1, %r17
	setx 0x2303902232e5c039, %g1, %r18
	setx 0x3f1c294bdddc2237, %g1, %r19
	setx 0x5f2d2c7236c6d9e7, %g1, %r20
	setx 0x62bfe1e2a7f9890d, %g1, %r21
	setx 0x43da9bc12e99efa1, %g1, %r22
	setx 0x7418cf9192814b4d, %g1, %r23
	setx 0x4519c004df6f9beb, %g1, %r24
	setx 0x700d0a089097ad20, %g1, %r25
	setx 0xf2a44ae491aeab0b, %g1, %r26
	setx 0xab10abf898e65d27, %g1, %r27
	setx 0xfd9a8ceca3f5ccb0, %g1, %r28
	setx 0xa2d1e2b3ea5d0f2d, %g1, %r29
	setx 0xc704b70f7c428e38, %g1, %r30
	setx 0x48dbe8bd97733a45, %g1, %r31
	save
	setx 0x9394e1798f6c2273, %g1, %r16
	setx 0xc468eaf3574564e9, %g1, %r17
	setx 0x5ffe6bad695f03eb, %g1, %r18
	setx 0x5f4ea40bc39a56b1, %g1, %r19
	setx 0xebc3eac9526149c2, %g1, %r20
	setx 0x509b9531e0450602, %g1, %r21
	setx 0x9cd61d628136bdec, %g1, %r22
	setx 0x0365ec5cd7213d78, %g1, %r23
	setx 0x6c9d06299ab189d5, %g1, %r24
	setx 0x0e09feca07767a9d, %g1, %r25
	setx 0x8c254e123d68beeb, %g1, %r26
	setx 0x27a3ff7df0cc0d06, %g1, %r27
	setx 0xf04b10c270dfc03a, %g1, %r28
	setx 0x29cf30317fa2504b, %g1, %r29
	setx 0xad09a9198bb2a797, %g1, %r30
	setx 0x41a1dd45eed569c9, %g1, %r31
	save
	setx 0x5c812f97c341e228, %g1, %r16
	setx 0x198264e892c3ae4c, %g1, %r17
	setx 0x8dbdd2571ef70ed5, %g1, %r18
	setx 0x31f8ee672052fc86, %g1, %r19
	setx 0xcf1f12155a84a56b, %g1, %r20
	setx 0x812d022fed2439a8, %g1, %r21
	setx 0xee06bee47cd5bc48, %g1, %r22
	setx 0x640e7934f1293c21, %g1, %r23
	setx 0x421bb3ead4e59191, %g1, %r24
	setx 0x9162e0a7f49c924b, %g1, %r25
	setx 0xad39d305731c47b4, %g1, %r26
	setx 0xaf5bbf855543d108, %g1, %r27
	setx 0x2d7b55426774e060, %g1, %r28
	setx 0x78160577ebf5926c, %g1, %r29
	setx 0x67e0ec3cfacba7f1, %g1, %r30
	setx 0xe60d41cbf3ba4428, %g1, %r31
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
	.word 0xb9e4e0ff  ! 1: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e4610e  ! 3: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf50c000  ! 4: RDPR_TT	<illegal instruction>
	.word 0xb9e4e01b  ! 7: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1f6  ! 10: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb92df001  ! 11: SLLX_I	sllx	%r23, 0x0001, %r28
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5213f  ! 17: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e560e8  ! 22: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e4a1d0  ! 26: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4a063  ! 27: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4e074  ! 30: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e52197  ! 33: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5e154  ! 40: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb22c4000  ! 42: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb1e5e1cd  ! 46: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5201a  ! 54: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4217f  ! 55: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5a0bb  ! 57: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x85946180  ! 60: WRPR_TSTATE_I	wrpr	%r17, 0x0180, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xb2842158  ! 68: ADDcc_I	addcc 	%r16, 0x0158, %r25
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0d2  ! 71: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_6, %g1, %r19
	.word 0xb5508000  ! 73: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e42039  ! 74: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4e1ea  ! 78: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x121, %g1, %o0
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
	.word 0xb9480000  ! 81: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e52190  ! 84: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4e01c  ! 85: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982e8b  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	setx	data_start_5, %g1, %r20
	.word 0xbabce01e  ! 89: XNORcc_I	xnorcc 	%r19, 0x001e, %r29
	.word 0xb1504000  ! 95: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198385b  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 99: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e4a1b7  ! 101: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5e0e4  ! 102: SAVE_I	save	%r23, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 104: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a00c  ! 105: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb8a560dd  ! 106: SUBcc_I	subcc 	%r21, 0x00dd, %r28
	setx	data_start_4, %g1, %r17
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0d0  ! 115: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4e0c6  ! 119: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe461a8  ! 124: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb134a001  ! 131: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xb9e5a1ec  ! 132: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e05d  ! 133: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9518000  ! 137: RDPR_PSTATE	<illegal instruction>
	.word 0xb0056019  ! 138: ADD_I	add 	%r21, 0x0019, %r24
	.word 0xbc9dc000  ! 141: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xbfe5a1f8  ! 142: SAVE_I	save	%r22, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe52088  ! 158: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 163: RDPR_GL	<illegal instruction>
	.word 0xb7e52120  ! 164: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8395e1ca  ! 167: WRPR_TNPC_I	wrpr	%r23, 0x01ca, %tnpc
	.word 0xb3e52116  ! 168: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe52059  ! 170: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8595a075  ! 172: WRPR_TSTATE_I	wrpr	%r22, 0x0075, %tstate
	.word 0x8795e136  ! 173: WRPR_TT_I	wrpr	%r23, 0x0136, %tt
	.word 0x8d95a04f  ! 178: WRPR_PSTATE_I	wrpr	%r22, 0x004f, %pstate
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xb8a58000  ! 185: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0x89942189  ! 191: WRPR_TICK_I	wrpr	%r16, 0x0189, %tick
	.word 0xb3e5a1b0  ! 193: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb510000  ! 195: RDPR_TICK	<illegal instruction>
	.word 0xbfe5216a  ! 197: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e46138  ! 198: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5a0d0  ! 204: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a092  ! 208: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e46153  ! 213: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_0, %g1, %r20
	mov	2, %r14
	.word 0xa193a000  ! 218: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4605f  ! 221: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7508000  ! 225: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4e08e  ! 230: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb624a040  ! 232: SUB_I	sub 	%r18, 0x0040, %r27
	.word 0xb93d6001  ! 233: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xbbe4a178  ! 234: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb550c000  ! 235: RDPR_TT	<illegal instruction>
	.word 0xb5e4e0aa  ! 236: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb09ca18b  ! 242: XORcc_I	xorcc 	%r18, 0x018b, %r24
	.word 0xb7e461b0  ! 245: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0xbde4e1bf  ! 256: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb13ce001  ! 259: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xbbe4201a  ! 263: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9504000  ! 264: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e0a9  ! 265: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e0b9  ! 267: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e520b2  ! 274: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4a161  ! 277: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5608e  ! 280: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5e06c  ! 285: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5e1b4  ! 286: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe5e033  ! 287: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe46181  ! 289: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x9194a13e  ! 291: WRPR_PIL_I	wrpr	%r18, 0x013e, %pil
	.word 0xb1e560e0  ! 294: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_7, %g1, %r20
	.word 0xb5520000  ! 297: RDPR_PIL	<illegal instruction>
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 301: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e0a2  ! 303: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4a091  ! 304: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7520000  ! 305: RDPR_PIL	<illegal instruction>
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 308: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8c561e4  ! 311: ADDCcc_I	addccc 	%r21, 0x01e4, %r28
	.word 0xb1540000  ! 313: RDPR_GL	<illegal instruction>
	.word 0xb7e4e1fc  ! 317: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4a009  ! 319: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb350c000  ! 322: RDPR_TT	<illegal instruction>
	.word 0xb5e560ef  ! 325: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20111, %g1, %o0
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
	.word 0xb3e521ba  ! 335: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e56139  ! 336: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e46163  ! 338: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xbb520000  ! 348: RDPR_PIL	<illegal instruction>
	.word 0xbf34d000  ! 349: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xb5e520dd  ! 355: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5508000  ! 357: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe520ce  ! 361: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_5, %g1, %r22
	.word 0xb1e5610a  ! 363: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbb7d6401  ! 366: MOVR_I	movre	%r21, 0x1, %r29
	.word 0xbd500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb3e5e160  ! 370: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5641800  ! 371: MOVcc_R	<illegal instruction>
	.word 0xb3e4a183  ! 372: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5e1e5  ! 378: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	.word 0xb3e5a173  ! 384: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbe240000  ! 386: SUB_R	sub 	%r16, %r0, %r31
	.word 0xb3e46123  ! 387: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb404e1f0  ! 389: ADD_I	add 	%r19, 0x01f0, %r26
	.word 0xbbe56156  ! 390: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe4e143  ! 392: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e420c6  ! 396: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb551c000  ! 397: RDPR_TL	<illegal instruction>
	.word 0x8994609b  ! 400: WRPR_TICK_I	wrpr	%r17, 0x009b, %tick
	.word 0x8795217f  ! 406: WRPR_TT_I	wrpr	%r20, 0x017f, %tt
	.word 0xbfe56032  ! 411: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e52132  ! 412: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbd50c000  ! 414: RDPR_TT	<illegal instruction>
	.word 0xbd518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0x9195a1c5  ! 418: WRPR_PIL_I	wrpr	%r22, 0x01c5, %pil
	.word 0xb7e5a1c6  ! 421: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5a161  ! 422: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e561be  ! 423: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x1030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4e0b6  ! 441: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbf2cd000  ! 442: SLLX_R	sllx	%r19, %r0, %r31
	.word 0xb3e5e16c  ! 443: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4e165  ! 445: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4a13d  ! 453: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0c6  ! 455: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42050  ! 459: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e560f6  ! 460: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x3011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30007, %g1, %o0
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
	.word 0xb3e46061  ! 465: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde421b0  ! 469: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_1, %g1, %r20
	.word 0xbe840000  ! 477: ADDcc_R	addcc 	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e421fb  ! 482: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5619b  ! 487: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4a13e  ! 490: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5219e  ! 492: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942192  ! 496: WRPR_TPC_I	wrpr	%r16, 0x0192, %tpc
	.word 0xbfe4a163  ! 498: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5e099  ! 501: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xb5e4218f  ! 504: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb01d2005  ! 506: XOR_I	xor 	%r20, 0x0005, %r24
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	.word 0xb150c000  ! 510: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 511: RDPR_PIL	<illegal instruction>
	.word 0xb1e4a0c8  ! 516: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb4a4209c  ! 517: SUBcc_I	subcc 	%r16, 0x009c, %r26
	.word 0xbd7cc400  ! 519: MOVR_R	movre	%r19, %r0, %r30
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5602b  ! 528: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e52117  ! 530: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5209d  ! 531: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe460a9  ! 536: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4201d  ! 538: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x8198280b  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
	.word 0xb9518000  ! 544: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5e056  ! 545: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0c4  ! 549: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5a0a7  ! 550: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbe14c000  ! 551: OR_R	or 	%r19, %r0, %r31
	.word 0x8995e0c0  ! 552: WRPR_TICK_I	wrpr	%r23, 0x00c0, %tick
	.word 0xb3e46137  ! 554: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4a068  ! 557: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbe45615d  ! 558: ADDC_I	addc 	%r21, 0x015d, %r31
	.word 0xb1e5e1e9  ! 560: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x899420eb  ! 561: WRPR_TICK_I	wrpr	%r16, 0x00eb, %tick
	.word 0xbeb50000  ! 562: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xbde560c1  ! 563: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8795219b  ! 567: WRPR_TT_I	wrpr	%r20, 0x019b, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983e49  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e49, %hpstate
	.word 0xbe856171  ! 570: ADDcc_I	addcc 	%r21, 0x0171, %r31
	.word 0xbbe4e0ae  ! 572: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e521db  ! 574: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5a1b9  ! 578: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbeb5c000  ! 580: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xb5e4e051  ! 582: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf540000  ! 584: RDPR_GL	<illegal instruction>
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 589: RDPR_TICK	<illegal instruction>
	.word 0xb5350000  ! 591: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb7e4212c  ! 593: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1540000  ! 594: RDPR_GL	<illegal instruction>
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e1b8  ! 597: WRPR_PSTATE_I	wrpr	%r19, 0x01b8, %pstate
	.word 0xb9e5e181  ! 606: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_4, %g1, %r16
	.word 0x8794e1c9  ! 611: WRPR_TT_I	wrpr	%r19, 0x01c9, %tt
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e460b7  ! 614: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde520cf  ! 617: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf518000  ! 618: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e421e4  ! 620: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4a1e4  ! 623: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5a186  ! 626: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb80c4000  ! 632: AND_R	and 	%r17, %r0, %r28
	.word 0xb5518000  ! 634: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5e16e  ! 637: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe4e0ee  ! 641: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e5a13e  ! 642: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5a0e5  ! 644: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5a0b6  ! 645: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e52062  ! 650: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4218a  ! 651: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e108  ! 656: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e42193  ! 658: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5a074  ! 660: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbab54000  ! 664: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0x8994e058  ! 665: WRPR_TICK_I	wrpr	%r19, 0x0058, %tick
	.word 0xb9e5a1a0  ! 666: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb8b5e199  ! 667: SUBCcc_I	orncc 	%r23, 0x0199, %r28
	.word 0xbbe46006  ! 669: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8594e030  ! 672: WRPR_TSTATE_I	wrpr	%r19, 0x0030, %tstate
	.word 0xbfe5e04a  ! 673: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e5a177  ! 675: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33c5000  ! 677: SRAX_R	srax	%r17, %r0, %r25
	setx	data_start_2, %g1, %r16
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe56000  ! 681: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x899520f1  ! 682: WRPR_TICK_I	wrpr	%r20, 0x00f1, %tick
	.word 0xb6bc0000  ! 684: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0xb7e4a1d0  ! 685: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0ea  ! 687: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd50c000  ! 689: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52005  ! 697: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde46180  ! 698: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5a181  ! 699: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe42104  ! 705: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5610e  ! 709: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb2350000  ! 712: SUBC_R	orn 	%r20, %r0, %r25
	.word 0xb7e421b6  ! 713: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a181  ! 719: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3520000  ! 720: RDPR_PIL	<illegal instruction>
	setx	0x13c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4606a  ! 725: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb550c000  ! 730: RDPR_TT	<illegal instruction>
	.word 0xb1e561db  ! 733: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e46014  ! 735: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5e048  ! 736: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983953  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1953, %hpstate
	.word 0xb5e5200b  ! 738: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5603e  ! 744: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb2ad4000  ! 749: ANDNcc_R	andncc 	%r21, %r0, %r25
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 754: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xbfe46095  ! 759: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e4204a  ! 760: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe42075  ! 761: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e113  ! 763: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe560bd  ! 766: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x83942122  ! 767: WRPR_TNPC_I	wrpr	%r16, 0x0122, %tnpc
	setx	data_start_6, %g1, %r22
	setx	0x110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794200a  ! 771: WRPR_TT_I	wrpr	%r16, 0x000a, %tt
	.word 0xb7e5e170  ! 779: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e5a1a8  ! 782: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe56106  ! 784: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe52146  ! 786: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983ac1  ! 787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac1, %hpstate
	.word 0xbb480000  ! 789: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3e5216c  ! 792: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbc1ca0e2  ! 793: XOR_I	xor 	%r18, 0x00e2, %r30
	.word 0xb1e4e026  ! 794: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0bc2182  ! 797: XNORcc_I	xnorcc 	%r16, 0x0182, %r24
	mov	1, %r14
	.word 0xa193a000  ! 798: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe4202c  ! 799: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 806: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4208d  ! 807: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe4e067  ! 814: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4e1c7  ! 817: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e56190  ! 818: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5e05e  ! 822: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8394205c  ! 823: WRPR_TNPC_I	wrpr	%r16, 0x005c, %tnpc
	.word 0xb1e460a1  ! 827: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x1002b, %g1, %o0
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
	.word 0xb1e52188  ! 837: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1510000  ! 839: RDPR_TICK	<illegal instruction>
	.word 0x83956077  ! 841: WRPR_TNPC_I	wrpr	%r21, 0x0077, %tnpc
	.word 0xb9518000  ! 844: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e421e0  ! 845: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xba0c218c  ! 846: AND_I	and 	%r16, 0x018c, %r29
	.word 0xb1480000  ! 848: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9e420dd  ! 850: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4619a  ! 853: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8795e1e6  ! 857: WRPR_TT_I	wrpr	%r23, 0x01e6, %tt
	.word 0xbde4e0bc  ! 860: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e520cb  ! 864: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb62560e9  ! 865: SUB_I	sub 	%r21, 0x00e9, %r27
	.word 0xb9e4a13c  ! 866: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9510000  ! 869: RDPR_TICK	<illegal instruction>
	.word 0xb9e5e0c9  ! 871: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e56126  ! 872: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde56129  ! 875: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbaada0ec  ! 878: ANDNcc_I	andncc 	%r22, 0x00ec, %r29
	mov	0, %r12
	.word 0x8f932000  ! 882: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e460ec  ! 885: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4e016  ! 889: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb334a001  ! 896: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xbd518000  ! 897: RDPR_PSTATE	<illegal instruction>
	.word 0xbf500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xb7e5e06a  ! 905: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e0bd  ! 908: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e560d5  ! 910: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_4, %g1, %r23
	.word 0x8d946034  ! 912: WRPR_PSTATE_I	wrpr	%r17, 0x0034, %pstate
	.word 0xb1e5e07e  ! 913: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xba440000  ! 914: ADDC_R	addc 	%r16, %r0, %r29
	setx	0x10110, %g1, %o0
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
	.word 0xb3e5e01f  ! 917: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5a04b  ! 920: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e520c7  ! 921: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe561ef  ! 924: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10131, %g1, %o0
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
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a11b  ! 929: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd342001  ! 930: SRL_I	srl 	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e4e1fe  ! 933: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e46019  ! 938: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5a13c  ! 942: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e460a6  ! 945: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5609d  ! 948: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb43d4000  ! 949: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb1e4e1e2  ! 950: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde461f1  ! 952: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb03ca1d5  ! 954: XNOR_I	xnor 	%r18, 0x01d5, %r24
	.word 0xbf540000  ! 955: RDPR_GL	<illegal instruction>
	.word 0xb550c000  ! 962: RDPR_TT	<illegal instruction>
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e18b  ! 968: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956168  ! 970: WRPR_PSTATE_I	wrpr	%r21, 0x0168, %pstate
	.word 0xb7e5e076  ! 971: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4e1ca  ! 972: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb500000  ! 973: RDPR_TPC	<illegal instruction>
	.word 0xb9e5a1db  ! 974: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5a102  ! 978: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e420b8  ! 979: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb815a044  ! 984: OR_I	or 	%r22, 0x0044, %r28
	.word 0xb3e561b7  ! 985: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 986: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe4a140  ! 991: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbb504000  ! 992: RDPR_TNPC	<illegal instruction>
	.word 0xbbe42038  ! 994: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5e14f  ! 995: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983bd1  ! 997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd1, %hpstate
	.word 0x8595a19f  ! 999: WRPR_TSTATE_I	wrpr	%r22, 0x019f, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983949  ! 1000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1949, %hpstate
	.word 0xb3518000  ! 1001: RDPR_PSTATE	<illegal instruction>
	.word 0xb6a50000  ! 1005: SUBcc_R	subcc 	%r20, %r0, %r27
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e1b4  ! 1015: WRPR_TSTATE_I	wrpr	%r19, 0x01b4, %tstate
	.word 0xbfe52001  ! 1017: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4e0f9  ! 1018: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8994a181  ! 1020: WRPR_TICK_I	wrpr	%r18, 0x0181, %tick
	.word 0xb3e4a179  ! 1021: SAVE_I	save	%r18, 0x0001, %r25
	mov	0, %r12
	.word 0x8f932000  ! 1022: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2858000  ! 1023: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xbbe4e142  ! 1024: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb6bc8000  ! 1026: XNORcc_R	xnorcc 	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a087  ! 1035: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb8a5a18d  ! 1040: SUBcc_I	subcc 	%r22, 0x018d, %r28
	.word 0xb1e5e1ee  ! 1042: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4a1cb  ! 1046: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e460c5  ! 1052: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb520000  ! 1053: RDPR_PIL	<illegal instruction>
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0x879460c2  ! 1057: WRPR_TT_I	wrpr	%r17, 0x00c2, %tt
	.word 0xbbe421a4  ! 1059: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4616f  ! 1061: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4a13c  ! 1064: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e421d3  ! 1067: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982a83  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	.word 0xbbe421f0  ! 1077: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42001  ! 1081: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe56091  ! 1082: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7518000  ! 1084: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e42130  ! 1088: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5e13a  ! 1090: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5508000  ! 1091: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a16e  ! 1094: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7518000  ! 1097: RDPR_PSTATE	<illegal instruction>
	.word 0x8194604b  ! 1100: WRPR_TPC_I	wrpr	%r17, 0x004b, %tpc
	.word 0xb3e5209b  ! 1104: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5a12e  ! 1105: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5a19d  ! 1107: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x91946088  ! 1110: WRPR_PIL_I	wrpr	%r17, 0x0088, %pil
	.word 0xb5e420d3  ! 1111: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbaa4e0c3  ! 1112: SUBcc_I	subcc 	%r19, 0x00c3, %r29
	.word 0xbfe42121  ! 1117: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1121: RDPR_TICK	<illegal instruction>
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 1128: RDPR_GL	<illegal instruction>
	.word 0xbd50c000  ! 1137: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d8b  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8b, %hpstate
	.word 0xb9e52058  ! 1143: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1148: MOVcc_I	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xbb51c000  ! 1150: RDPR_TL	<illegal instruction>
	.word 0xb3e561e8  ! 1151: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1508000  ! 1155: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 1157: RDPR_TT	<illegal instruction>
	.word 0xb0ad8000  ! 1159: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xb5e56093  ! 1161: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5a1fd  ! 1167: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde52054  ! 1168: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5e100  ! 1169: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e460f1  ! 1171: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9480000  ! 1174: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e5e0e6  ! 1176: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8595213f  ! 1177: WRPR_TSTATE_I	wrpr	%r20, 0x013f, %tstate
	setx	0x1010e, %g1, %o0
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
	.word 0xbd518000  ! 1185: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5e06d  ! 1187: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e521ad  ! 1189: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982e03  ! 1190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e03, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 1195: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb805c000  ! 1196: ADD_R	add 	%r23, %r0, %r28
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2d7001  ! 1199: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0x859521d4  ! 1201: WRPR_TSTATE_I	wrpr	%r20, 0x01d4, %tstate
	.word 0xb7e5215c  ! 1202: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe52105  ! 1205: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb520000  ! 1206: RDPR_PIL	<illegal instruction>
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52115  ! 1209: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8995a0c8  ! 1213: WRPR_TICK_I	wrpr	%r22, 0x00c8, %tick
	.word 0xb7e5a169  ! 1214: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4e081  ! 1218: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba9dc000  ! 1220: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0x91942110  ! 1221: WRPR_PIL_I	wrpr	%r16, 0x0110, %pil
	.word 0xb5520000  ! 1222: RDPR_PIL	<illegal instruction>
	.word 0xb5e4a088  ! 1223: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e52116  ! 1225: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e01a  ! 1229: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8794e002  ! 1232: WRPR_TT_I	wrpr	%r19, 0x0002, %tt
	.word 0xbde5e17c  ! 1236: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe56142  ! 1238: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r16
	.word 0xb534d000  ! 1245: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xb21ce18d  ! 1254: XOR_I	xor 	%r19, 0x018d, %r25
	.word 0xb9e460f1  ! 1255: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8994e176  ! 1257: WRPR_TICK_I	wrpr	%r19, 0x0176, %tick
	.word 0xb7e5216e  ! 1258: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbc3d21bb  ! 1259: XNOR_I	xnor 	%r20, 0x01bb, %r30
	.word 0xb9641800  ! 1260: MOVcc_R	<illegal instruction>
	.word 0xb9e560e1  ! 1261: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e1a3  ! 1264: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e17f  ! 1265: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4e136  ! 1266: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe46105  ! 1267: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8794a075  ! 1268: WRPR_TT_I	wrpr	%r18, 0x0075, %tt
	.word 0xb5510000  ! 1272: RDPR_TICK	<illegal instruction>
	.word 0xb751c000  ! 1273: RDPR_TL	<illegal instruction>
	.word 0xb1e5e1f2  ! 1274: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5a0ad  ! 1275: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x30032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42047  ! 1278: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x9194602d  ! 1279: WRPR_PIL_I	wrpr	%r17, 0x002d, %pil
	.word 0xb3508000  ! 1282: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4609e  ! 1288: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5a010  ! 1289: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 1293: RDPR_PIL	<illegal instruction>
	.word 0xbfe5e1d5  ! 1296: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e4e055  ! 1300: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5613d  ! 1301: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf7d0400  ! 1306: MOVR_R	movre	%r20, %r0, %r31
	.word 0xbbe5a0f5  ! 1307: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983a13  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a13, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 1318: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 1319: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5e160  ! 1320: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5e07d  ! 1321: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5e0aa  ! 1323: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x85942086  ! 1325: WRPR_TSTATE_I	wrpr	%r16, 0x0086, %tstate
	.word 0xbfe5a0dd  ! 1326: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5e19f  ! 1329: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb40d8000  ! 1330: AND_R	and 	%r22, %r0, %r26
	.word 0x9195a028  ! 1332: WRPR_PIL_I	wrpr	%r22, 0x0028, %pil
	.word 0xb6c50000  ! 1334: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xb1e4e009  ! 1335: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e521a7  ! 1342: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e560d6  ! 1349: SAVE_I	save	%r21, 0x0001, %r25
	mov	1, %r12
	.word 0x8f932000  ! 1350: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8b50000  ! 1352: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xbfe4211d  ! 1354: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_4, %g1, %r23
	.word 0xbf480000  ! 1357: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb23c0000  ! 1358: XNOR_R	xnor 	%r16, %r0, %r25
	.word 0xbfe4e16e  ! 1362: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e56052  ! 1363: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a14a  ! 1367: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1369: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e10c  ! 1372: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e521ab  ! 1375: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe56018  ! 1376: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e46011  ! 1379: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8194e074  ! 1381: WRPR_TPC_I	wrpr	%r19, 0x0074, %tpc
	.word 0xb9e5610d  ! 1383: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1386: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4200b  ! 1388: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8794a0ef  ! 1394: WRPR_TT_I	wrpr	%r18, 0x00ef, %tt
	.word 0xbbe56002  ! 1396: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b13  ! 1414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b13, %hpstate
	.word 0xb5e5a131  ! 1415: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e4207f  ! 1417: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4a195  ! 1419: SAVE_I	save	%r18, 0x0001, %r26
	mov	0, %r14
	.word 0xa193a000  ! 1420: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe4e128  ! 1423: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5e065  ! 1427: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e42142  ! 1430: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5540000  ! 1437: RDPR_GL	<illegal instruction>
	.word 0xb9e5a0c3  ! 1438: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3641800  ! 1440: MOVcc_R	<illegal instruction>
	setx	0x10234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bde034  ! 1442: XNORcc_I	xnorcc 	%r23, 0x0034, %r28
	mov	1, %r12
	.word 0x8f932000  ! 1444: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e420fc  ! 1452: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983989  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1989, %hpstate
	.word 0xb23461d5  ! 1456: SUBC_I	orn 	%r17, 0x01d5, %r25
	.word 0xb9e5a1ec  ! 1457: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e46158  ! 1461: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4609c  ! 1468: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e46164  ! 1470: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e420fc  ! 1473: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1e7  ! 1487: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56111  ! 1493: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5a159  ! 1494: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e56199  ! 1500: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8594e07a  ! 1502: WRPR_TSTATE_I	wrpr	%r19, 0x007a, %tstate
	mov	1, %r14
	.word 0xa193a000  ! 1503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e460c4  ! 1504: SAVE_I	save	%r17, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 1507: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 1508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0x8195a199  ! 1511: WRPR_TPC_I	wrpr	%r22, 0x0199, %tpc
	.word 0xb9508000  ! 1513: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e42028  ! 1516: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbf2d3001  ! 1518: SLLX_I	sllx	%r20, 0x0001, %r31
	.word 0xb5e5609c  ! 1520: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x839561fd  ! 1522: WRPR_TNPC_I	wrpr	%r21, 0x01fd, %tnpc
	.word 0xb1341000  ! 1526: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb3520000  ! 1532: RDPR_PIL	<illegal instruction>
	.word 0xbbe420b8  ! 1534: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 1541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde560fb  ! 1543: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e42030  ! 1546: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xba3da0fc  ! 1547: XNOR_I	xnor 	%r22, 0x00fc, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982883  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1ab  ! 1554: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8d94e107  ! 1557: WRPR_PSTATE_I	wrpr	%r19, 0x0107, %pstate
	setx	data_start_7, %g1, %r16
	.word 0xbbe460ca  ! 1562: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e520b9  ! 1563: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb8b421eb  ! 1565: ORNcc_I	orncc 	%r16, 0x01eb, %r28
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421ff  ! 1570: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8394e0f8  ! 1577: WRPR_TNPC_I	wrpr	%r19, 0x00f8, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 1579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e4609c  ! 1580: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5e078  ! 1581: SAVE_I	save	%r23, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 1583: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e52070  ! 1588: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_1, %g1, %r19
	.word 0xb7e5e0b4  ! 1593: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e42115  ! 1594: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb77d4400  ! 1595: MOVR_R	movre	%r21, %r0, %r27
	.word 0xbfe4e0e2  ! 1596: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4215e  ! 1597: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e42039  ! 1599: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe46122  ! 1601: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x9195a0c8  ! 1606: WRPR_PIL_I	wrpr	%r22, 0x00c8, %pil
	.word 0xb7e4e1c4  ! 1608: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e461be  ! 1609: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe52020  ! 1610: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4a06a  ! 1612: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4e1f7  ! 1613: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde560b7  ! 1615: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb950c000  ! 1630: RDPR_TT	<illegal instruction>
	.word 0xb3e4e0a5  ! 1631: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4a01b  ! 1632: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe561f7  ! 1634: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5200a  ! 1640: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb751c000  ! 1641: RDPR_TL	<illegal instruction>
	.word 0xbde4a16a  ! 1643: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5a15c  ! 1645: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb734a001  ! 1649: SRL_I	srl 	%r18, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 1650: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7500000  ! 1652: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 1661: RDPR_GL	<illegal instruction>
	.word 0xb1e4e1a6  ! 1662: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e421c2  ! 1665: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e42026  ! 1669: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x819460f8  ! 1670: WRPR_TPC_I	wrpr	%r17, 0x00f8, %tpc
	.word 0xbbe5a0d0  ! 1671: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4611d  ! 1673: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe561ca  ! 1674: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4e0d3  ! 1676: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x899560dd  ! 1679: WRPR_TICK_I	wrpr	%r21, 0x00dd, %tick
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 1684: RDPR_PSTATE	<illegal instruction>
	.word 0xbd510000  ! 1685: RDPR_TICK	<illegal instruction>
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 1690: RDPR_TNPC	<illegal instruction>
	setx	0x1000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e461d6  ! 1694: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a1bc  ! 1697: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x819829db  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09db, %hpstate
	.word 0xb624215b  ! 1704: SUB_I	sub 	%r16, 0x015b, %r27
	.word 0xb351c000  ! 1705: RDPR_TL	<illegal instruction>
	.word 0xb62d0000  ! 1706: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xb9510000  ! 1709: RDPR_TICK	<illegal instruction>
	.word 0xb3e461b3  ! 1711: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4203c  ! 1713: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd7ca401  ! 1718: MOVR_I	movre	%r18, 0x1, %r30
	.word 0xb5518000  ! 1727: RDPR_PSTATE	<illegal instruction>
	.word 0xbe1d21dc  ! 1729: XOR_I	xor 	%r20, 0x01dc, %r31
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 1738: MOVcc_R	<illegal instruction>
	.word 0xb3480000  ! 1739: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb34b001  ! 1740: SRLX_I	srlx	%r18, 0x0001, %r29
	.word 0x8d94a164  ! 1744: WRPR_PSTATE_I	wrpr	%r18, 0x0164, %pstate
	.word 0xbb7cc400  ! 1745: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb5343001  ! 1747: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb9e5e096  ! 1750: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2c4a094  ! 1751: ADDCcc_I	addccc 	%r18, 0x0094, %r25
	.word 0xb9e4e16d  ! 1752: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1504000  ! 1754: RDPR_TNPC	<illegal instruction>
	setx	0x30308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e560e3  ! 1764: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbcc54000  ! 1766: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xbde561ea  ! 1768: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5e009  ! 1773: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4e109  ! 1774: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_6, %g1, %r19
	.word 0xb9e561ea  ! 1779: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e057  ! 1782: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e045  ! 1787: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x30310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e521c8  ! 1790: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde461a5  ! 1793: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8995e109  ! 1795: WRPR_TICK_I	wrpr	%r23, 0x0109, %tick
	.word 0xb9e4a17a  ! 1797: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb13d5000  ! 1799: SRAX_R	srax	%r21, %r0, %r24
	.word 0x8594a1dd  ! 1800: WRPR_TSTATE_I	wrpr	%r18, 0x01dd, %tstate
	.word 0xbde520fb  ! 1804: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4a098  ! 1806: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb51c000  ! 1808: RDPR_TL	<illegal instruction>
	.word 0xbd2dd000  ! 1811: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xbde4615e  ! 1813: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56019  ! 1825: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8195a0d4  ! 1828: WRPR_TPC_I	wrpr	%r22, 0x00d4, %tpc
	.word 0xb9e560b2  ! 1829: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e52072  ! 1830: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4605d  ! 1832: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4215b  ! 1835: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 1838: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3e5616d  ! 1840: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3540000  ! 1844: RDPR_GL	<illegal instruction>
	.word 0xb6340000  ! 1846: SUBC_R	orn 	%r16, %r0, %r27
	.word 0xb5e521d2  ! 1849: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e520ed  ! 1850: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb88d6189  ! 1852: ANDcc_I	andcc 	%r21, 0x0189, %r28
	mov	1, %r14
	.word 0xa193a000  ! 1856: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc35a194  ! 1863: ORN_I	orn 	%r22, 0x0194, %r30
	.word 0xb1e5a18d  ! 1866: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5216d  ! 1867: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8794e150  ! 1869: WRPR_TT_I	wrpr	%r19, 0x0150, %tt
	.word 0x839421e9  ! 1871: WRPR_TNPC_I	wrpr	%r16, 0x01e9, %tnpc
	.word 0xb5e4a030  ! 1872: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe52143  ! 1874: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a005  ! 1877: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5a0e5  ! 1879: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5e172  ! 1881: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb345000  ! 1884: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb3e52020  ! 1887: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb504000  ! 1891: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb7e5a12d  ! 1893: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4606a  ! 1896: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42035  ! 1898: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e42071  ! 1903: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb6c4c000  ! 1904: ADDCcc_R	addccc 	%r19, %r0, %r27
	.word 0xbe142032  ! 1910: OR_I	or 	%r16, 0x0032, %r31
	.word 0xb82ce008  ! 1914: ANDN_I	andn 	%r19, 0x0008, %r28
	.word 0xb3e4600d  ! 1915: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4e149  ! 1916: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e46113  ! 1917: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e5a1a1  ! 1918: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7353001  ! 1924: SRLX_I	srlx	%r20, 0x0001, %r27
	.word 0x89956029  ! 1932: WRPR_TICK_I	wrpr	%r21, 0x0029, %tick
	.word 0xb7500000  ! 1933: RDPR_TPC	<illegal instruction>
	.word 0xb2854000  ! 1934: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xb3e521e1  ! 1935: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4e1e8  ! 1937: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e461b6  ! 1940: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x9195e01b  ! 1941: WRPR_PIL_I	wrpr	%r23, 0x001b, %pil
	.word 0x8794216c  ! 1944: WRPR_TT_I	wrpr	%r16, 0x016c, %tt
	.word 0xb5e460e0  ! 1948: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_0, %g1, %r22
	.word 0xb3480000  ! 1953: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x879460a4  ! 1954: WRPR_TT_I	wrpr	%r17, 0x00a4, %tt
	.word 0xb7504000  ! 1957: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56155  ! 1960: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4a09d  ! 1963: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbe8cc000  ! 1964: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xbd50c000  ! 1966: RDPR_TT	<illegal instruction>
	.word 0xbbe42003  ! 1971: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb751c000  ! 1981: RDPR_TL	<illegal instruction>
	.word 0xb6b520d2  ! 1982: SUBCcc_I	orncc 	%r20, 0x00d2, %r27
	.word 0xbfe4a0a4  ! 1983: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e4a136  ! 1985: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb63cc000  ! 1986: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xb3e5a1ad  ! 1990: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb6ac8000  ! 1991: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xbb540000  ! 2003: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 2005: RDPR_TPC	<illegal instruction>
	.word 0xb5e461b9  ! 2007: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4a03e  ! 2010: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8795e18e  ! 2012: WRPR_TT_I	wrpr	%r23, 0x018e, %tt
	.word 0xb9e4a137  ! 2013: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4e107  ! 2015: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe460e6  ! 2020: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5a10d  ! 2029: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 2035: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4a14d  ! 2036: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e52060  ! 2039: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8394a1df  ! 2043: WRPR_TNPC_I	wrpr	%r18, 0x01df, %tnpc
	.word 0xb3480000  ! 2045: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb150c000  ! 2050: RDPR_TT	<illegal instruction>
	.word 0xbbe560b7  ! 2052: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb13cf001  ! 2057: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xb7e46044  ! 2059: SAVE_I	save	%r17, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 2065: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4a175  ! 2067: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbcada08e  ! 2068: ANDNcc_I	andncc 	%r22, 0x008e, %r30
	.word 0xb9e46058  ! 2069: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3510000  ! 2070: RDPR_TICK	<illegal instruction>
	.word 0xb9e4209b  ! 2071: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb0048000  ! 2072: ADD_R	add 	%r18, %r0, %r24
	.word 0xbbe46009  ! 2074: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb500000  ! 2075: RDPR_TPC	<illegal instruction>
	.word 0xb7e4214c  ! 2082: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe5a1fa  ! 2083: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe56079  ! 2084: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb8254000  ! 2085: SUB_R	sub 	%r21, %r0, %r28
	mov	0, %r14
	.word 0xa193a000  ! 2086: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe461a7  ! 2090: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb08d0000  ! 2091: ANDcc_R	andcc 	%r20, %r0, %r24
	.word 0x819521f3  ! 2094: WRPR_TPC_I	wrpr	%r20, 0x01f3, %tpc
	.word 0xb3e5a1ac  ! 2095: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x859520a0  ! 2099: WRPR_TSTATE_I	wrpr	%r20, 0x00a0, %tstate
	.word 0xb5e461d9  ! 2100: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2107: RDPR_PSTATE	<illegal instruction>
	.word 0xbf518000  ! 2111: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r16
	.word 0xbfe521ca  ! 2113: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e5a1ba  ! 2117: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a156  ! 2124: WRPR_PIL_I	wrpr	%r18, 0x0156, %pil
	.word 0xb7e5e17f  ! 2131: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb751c000  ! 2133: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c8b  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8b, %hpstate
	.word 0xb9540000  ! 2140: RDPR_GL	<illegal instruction>
	setx	0x28, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e42134  ! 2147: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a149  ! 2148: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e421b0  ! 2150: SAVE_I	save	%r16, 0x0001, %r26
	mov	0, %r12
	.word 0x8f932000  ! 2151: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4a194  ! 2160: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3500000  ! 2163: RDPR_TPC	<illegal instruction>
	.word 0xb0b4a024  ! 2166: ORNcc_I	orncc 	%r18, 0x0024, %r24
	.word 0x8195a0fd  ! 2168: WRPR_TPC_I	wrpr	%r22, 0x00fd, %tpc
	.word 0xbbe460ed  ! 2169: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb4244000  ! 2172: SUB_R	sub 	%r17, %r0, %r26
	.word 0xb3e4a1f9  ! 2173: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe4a191  ! 2174: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 2175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0xbab42001  ! 2176: ORNcc_I	orncc 	%r16, 0x0001, %r29
	.word 0xb1e4217f  ! 2179: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e0fa  ! 2183: WRPR_TPC_I	wrpr	%r19, 0x00fa, %tpc
	.word 0x8195a1a2  ! 2184: WRPR_TPC_I	wrpr	%r22, 0x01a2, %tpc
	.word 0xb3e4213a  ! 2188: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf518000  ! 2190: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4a184  ! 2193: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983801  ! 2198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1801, %hpstate
	.word 0xb5e460b1  ! 2200: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe561f3  ! 2203: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e045  ! 2209: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd480000  ! 2212: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb5e461c5  ! 2213: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6c52160  ! 2214: ADDCcc_I	addccc 	%r20, 0x0160, %r27
	.word 0xbbe4e013  ! 2223: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e1ca  ! 2226: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb151c000  ! 2229: RDPR_TL	<illegal instruction>
	.word 0xb7e4a19e  ! 2230: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2233: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e42199  ! 2234: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbd2cc000  ! 2236: SLL_R	sll 	%r19, %r0, %r30
	.word 0xb7e4a08f  ! 2238: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4201c  ! 2245: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5504000  ! 2247: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5a191  ! 2250: SAVE_I	save	%r22, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 2251: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde521f3  ! 2253: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8795a1ac  ! 2257: WRPR_TT_I	wrpr	%r22, 0x01ac, %tt
	.word 0xb1e5a017  ! 2258: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb685a01a  ! 2260: ADDcc_I	addcc 	%r22, 0x001a, %r27
	.word 0xb5518000  ! 2261: RDPR_PSTATE	<illegal instruction>
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4613d  ! 2266: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a1a5  ! 2269: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0d4  ! 2279: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e56079  ! 2287: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb57d0400  ! 2290: MOVR_R	movre	%r20, %r0, %r26
	.word 0x87952027  ! 2291: WRPR_TT_I	wrpr	%r20, 0x0027, %tt
	.word 0xbbe560e6  ! 2293: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x20320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46192  ! 2304: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d94e17a  ! 2307: WRPR_PSTATE_I	wrpr	%r19, 0x017a, %pstate
	setx	0x30219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe1d0000  ! 2311: XOR_R	xor 	%r20, %r0, %r31
	.word 0xb550c000  ! 2312: RDPR_TT	<illegal instruction>
	.word 0xb8bd8000  ! 2313: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xb8344000  ! 2315: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xb5e42127  ! 2317: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4e0ba  ! 2321: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8994618e  ! 2327: WRPR_TICK_I	wrpr	%r17, 0x018e, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 2330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	.word 0xb61c4000  ! 2333: XOR_R	xor 	%r17, %r0, %r27
	.word 0xbe0c20f1  ! 2336: AND_I	and 	%r16, 0x00f1, %r31
	.word 0xb5e5602d  ! 2338: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb0142145  ! 2341: OR_I	or 	%r16, 0x0145, %r24
	.word 0xbde5202b  ! 2342: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd504000  ! 2346: RDPR_TNPC	<illegal instruction>
	.word 0xb8340000  ! 2349: SUBC_R	orn 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe46112  ! 2351: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde560da  ! 2355: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983d83  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d83, %hpstate
	.word 0xb1e4213f  ! 2363: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe52128  ! 2370: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb504000  ! 2371: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a0fb  ! 2374: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb540000  ! 2376: RDPR_GL	<illegal instruction>
	.word 0x9194e080  ! 2378: WRPR_PIL_I	wrpr	%r19, 0x0080, %pil
	.word 0xb9518000  ! 2383: RDPR_PSTATE	<illegal instruction>
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8150000  ! 2390: OR_R	or 	%r20, %r0, %r28
	.word 0xbc842073  ! 2393: ADDcc_I	addcc 	%r16, 0x0073, %r30
	.word 0xb9e4a0d8  ! 2394: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e5e108  ! 2397: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5a0f9  ! 2400: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a025  ! 2406: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde520dc  ! 2407: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb351c000  ! 2410: RDPR_TL	<illegal instruction>
	.word 0xbac54000  ! 2413: ADDCcc_R	addccc 	%r21, %r0, %r29
	.word 0xb7e561ac  ! 2414: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e56132  ! 2416: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe4a085  ! 2417: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8394e081  ! 2420: WRPR_TNPC_I	wrpr	%r19, 0x0081, %tnpc
	.word 0xb1e5e0e9  ! 2422: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e42190  ! 2426: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5510000  ! 2433: RDPR_TICK	<illegal instruction>
	.word 0x919460fd  ! 2435: WRPR_PIL_I	wrpr	%r17, 0x00fd, %pil
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 2439: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a1d9  ! 2440: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe52098  ! 2444: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb950c000  ! 2445: RDPR_TT	<illegal instruction>
	.word 0xb9e5e0fe  ! 2446: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4603c  ! 2447: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e52032  ! 2449: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb12de001  ! 2450: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xb9504000  ! 2451: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819839c1  ! 2452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c1, %hpstate
	.word 0xbec58000  ! 2454: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0x8394a0d7  ! 2460: WRPR_TNPC_I	wrpr	%r18, 0x00d7, %tnpc
	.word 0xb3508000  ! 2462: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5e036  ! 2467: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8d95613d  ! 2469: WRPR_PSTATE_I	wrpr	%r21, 0x013d, %pstate
	.word 0xbfe460c9  ! 2470: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5a15a  ! 2471: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e561af  ! 2472: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e561f1  ! 2477: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb625c000  ! 2479: SUB_R	sub 	%r23, %r0, %r27
	.word 0xb9e4a07a  ! 2480: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879521dd  ! 2484: WRPR_TT_I	wrpr	%r20, 0x01dd, %tt
	.word 0xbde4a068  ! 2487: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e520df  ! 2488: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e52149  ! 2491: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1510000  ! 2492: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 2495: RDPR_TL	<illegal instruction>
	.word 0xbbe42006  ! 2498: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4a1c7  ! 2502: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5a09d  ! 2509: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbb2d5000  ! 2510: SLLX_R	sllx	%r21, %r0, %r29
	.word 0xb3e4a17e  ! 2511: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde5207b  ! 2514: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb6140000  ! 2520: OR_R	or 	%r16, %r0, %r27
	.word 0xb53c5000  ! 2521: SRAX_R	srax	%r17, %r0, %r26
	.word 0xbde4a1a2  ! 2522: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe054000  ! 2529: ADD_R	add 	%r21, %r0, %r31
	.word 0xbfe5219c  ! 2533: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb534b001  ! 2535: SRLX_I	srlx	%r18, 0x0001, %r26
	.word 0xb7e5a0a0  ! 2541: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb405a002  ! 2544: ADD_I	add 	%r22, 0x0002, %r26
	.word 0xb9e42119  ! 2545: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5a147  ! 2548: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4e039  ! 2550: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb151c000  ! 2551: RDPR_TL	<illegal instruction>
	.word 0xb3e5611a  ! 2552: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5a17c  ! 2563: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5e124  ! 2567: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 2576: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5e136  ! 2578: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e42149  ! 2579: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e561d5  ! 2580: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb2d0000  ! 2584: SLL_R	sll 	%r20, %r0, %r29
	.word 0xb3508000  ! 2593: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe56100  ! 2594: SAVE_I	save	%r21, 0x0001, %r31
	mov	1, %r12
	.word 0x8f932000  ! 2596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1508000  ! 2598: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5a162  ! 2600: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde461fb  ! 2604: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_5, %g1, %r18
	.word 0xb1e4e06d  ! 2610: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x2003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2621: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x91952050  ! 2625: WRPR_PIL_I	wrpr	%r20, 0x0050, %pil
	.word 0xba356120  ! 2632: ORN_I	orn 	%r21, 0x0120, %r29
	.word 0x8994208e  ! 2637: WRPR_TICK_I	wrpr	%r16, 0x008e, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42180  ! 2644: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5e1e3  ! 2645: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x87952148  ! 2647: WRPR_TT_I	wrpr	%r20, 0x0148, %tt
	.word 0xb7345000  ! 2648: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xbfe5a191  ! 2652: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x859560e1  ! 2658: WRPR_TSTATE_I	wrpr	%r21, 0x00e1, %tstate
	.word 0xb7e4e1cc  ! 2665: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb2954000  ! 2666: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xbde5211b  ! 2668: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4a024  ! 2669: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b4e027  ! 2674: ORNcc_I	orncc 	%r19, 0x0027, %r27
	setx	data_start_6, %g1, %r21
	.word 0xbb540000  ! 2677: RDPR_GL	<illegal instruction>
	.word 0xb3e4a0f9  ! 2680: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8995a040  ! 2681: WRPR_TICK_I	wrpr	%r22, 0x0040, %tick
	.word 0xb1e5608d  ! 2683: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde461fb  ! 2685: SAVE_I	save	%r17, 0x0001, %r30
	mov	2, %r12
	.word 0x8f932000  ! 2694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde4e083  ! 2697: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9510000  ! 2702: RDPR_TICK	<illegal instruction>
	.word 0xbde52185  ! 2703: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5a105  ! 2704: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a18d  ! 2706: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd520000  ! 2707: RDPR_PIL	<illegal instruction>
	.word 0xb9e46190  ! 2712: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb4c4e07d  ! 2714: ADDCcc_I	addccc 	%r19, 0x007d, %r26
	.word 0x8395604d  ! 2717: WRPR_TNPC_I	wrpr	%r21, 0x004d, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x8198289b  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089b, %hpstate
	.word 0xb3e4202d  ! 2723: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_1, %g1, %r22
	.word 0xbde4a069  ! 2732: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4e123  ! 2733: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_3, %g1, %r21
	.word 0xb1e4a108  ! 2740: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e5a1ea  ! 2745: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5e085  ! 2746: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb094c000  ! 2747: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xb1e4e1be  ! 2751: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_4, %g1, %r18
	.word 0xb3e4e1c8  ! 2756: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x3010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe421e1  ! 2759: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe8c8000  ! 2762: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb7e460fc  ! 2763: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb751c000  ! 2765: RDPR_TL	<illegal instruction>
	.word 0xb695e100  ! 2766: ORcc_I	orcc 	%r23, 0x0100, %r27
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	.word 0xb21c6172  ! 2773: XOR_I	xor 	%r17, 0x0172, %r25
	.word 0x8994604b  ! 2775: WRPR_TICK_I	wrpr	%r17, 0x004b, %tick
	.word 0xbde56161  ! 2776: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982f81  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	.word 0xb82d600d  ! 2781: ANDN_I	andn 	%r21, 0x000d, %r28
	.word 0xbde4e06e  ! 2783: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e520b8  ! 2784: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf351000  ! 2787: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xb7e460f7  ! 2788: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb93ce001  ! 2790: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0x91946053  ! 2792: WRPR_PIL_I	wrpr	%r17, 0x0053, %pil
	.word 0xbde4a0c1  ! 2796: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde421a8  ! 2800: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4a18b  ! 2801: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4a04f  ! 2803: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 2806: RDPR_TT	<illegal instruction>
	.word 0xb7e4a1a3  ! 2808: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc9c0000  ! 2811: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb1e5211c  ! 2814: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7520000  ! 2818: RDPR_PIL	<illegal instruction>
	.word 0xbfe5615d  ! 2820: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4a064  ! 2821: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5a1de  ! 2822: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e4e109  ! 2823: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e4e187  ! 2825: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde56091  ! 2827: SAVE_I	save	%r21, 0x0001, %r30
	setx	data_start_2, %g1, %r22
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4216b  ! 2844: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb0256003  ! 2847: SUB_I	sub 	%r21, 0x0003, %r24
	.word 0xbb520000  ! 2851: RDPR_PIL	<illegal instruction>
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e52063  ! 2853: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x81952101  ! 2855: WRPR_TPC_I	wrpr	%r20, 0x0101, %tpc
	.word 0xb9e460c9  ! 2857: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5e0f3  ! 2861: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe561d4  ! 2863: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7518000  ! 2865: RDPR_PSTATE	<illegal instruction>
	.word 0xbf500000  ! 2866: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 2868: RDPR_TSTATE	<illegal instruction>
	.word 0xb9510000  ! 2870: RDPR_TICK	<illegal instruction>
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 2872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xbbe52064  ! 2875: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb734e001  ! 2883: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xb9504000  ! 2884: RDPR_TNPC	<illegal instruction>
	.word 0xb7e461f8  ! 2891: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4618f  ! 2892: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56034  ! 2898: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e56085  ! 2903: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e4a0db  ! 2905: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x2000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e421e4  ! 2909: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e560e3  ! 2914: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e142  ! 2915: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5540000  ! 2917: RDPR_GL	<illegal instruction>
	.word 0xbd3d3001  ! 2918: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xbfe5a126  ! 2919: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e52108  ! 2920: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e461a2  ! 2922: SAVE_I	save	%r17, 0x0001, %r26
	mov	0, %r14
	.word 0xa193a000  ! 2924: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	.word 0xbfe52004  ! 2926: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9508000  ! 2927: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e17a  ! 2928: WRPR_TT_I	wrpr	%r19, 0x017a, %tt
	.word 0xbbe4e023  ! 2930: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5a019  ! 2932: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb13ce001  ! 2934: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xbfe4a0de  ! 2937: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbf520000  ! 2939: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a119  ! 2941: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4e1d7  ! 2942: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8595a1cf  ! 2945: WRPR_TSTATE_I	wrpr	%r22, 0x01cf, %tstate
	.word 0x8394616a  ! 2948: WRPR_TNPC_I	wrpr	%r17, 0x016a, %tnpc
	.word 0xbe8c8000  ! 2951: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb48d4000  ! 2952: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xb1e4615e  ! 2953: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9480000  ! 2960: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7e46159  ! 2962: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe46135  ! 2963: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7518000  ! 2964: RDPR_PSTATE	<illegal instruction>
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46007  ! 2968: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7518000  ! 2970: RDPR_PSTATE	<illegal instruction>
	.word 0xbde52189  ! 2978: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4e0de  ! 2979: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5a1de  ! 2983: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e52084  ! 2984: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe461fd  ! 2985: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4e1c1  ! 2986: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4a0fc  ! 2988: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e460da  ! 2992: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x839520cf  ! 2993: WRPR_TNPC_I	wrpr	%r20, 0x00cf, %tnpc
	.word 0xbfe56018  ! 2994: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5a052  ! 2996: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x879461a4  ! 2997: WRPR_TT_I	wrpr	%r17, 0x01a4, %tt
	.word 0xbd2d3001  ! 2999: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xb351c000  ! 3002: RDPR_TL	<illegal instruction>
	.word 0xb32c6001  ! 3003: SLL_I	sll 	%r17, 0x0001, %r25
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 3013: RDPR_TICK	<illegal instruction>
	.word 0xb7e460aa  ! 3014: SAVE_I	save	%r17, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3018: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e56026  ! 3022: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb53cf001  ! 3023: SRAX_I	srax	%r19, 0x0001, %r26
	.word 0x919420c2  ! 3025: WRPR_PIL_I	wrpr	%r16, 0x00c2, %pil
	.word 0xbfe420ec  ! 3027: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb351c000  ! 3033: RDPR_TL	<illegal instruction>
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1ea  ! 3041: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4e0d2  ! 3043: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4217d  ! 3049: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb72c8000  ! 3050: SLL_R	sll 	%r18, %r0, %r27
	.word 0xbb518000  ! 3051: RDPR_PSTATE	<illegal instruction>
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe560fc  ! 3053: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 3056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0xbbe4611d  ! 3058: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4a0be  ! 3059: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4a0ca  ! 3062: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0xb7e46138  ! 3074: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x919561b4  ! 3075: WRPR_PIL_I	wrpr	%r21, 0x01b4, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982d1b  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982acb  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 3080: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e561ab  ! 3085: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e5e015  ! 3089: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4a180  ! 3092: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbc3c61c2  ! 3095: XNOR_I	xnor 	%r17, 0x01c2, %r30
	.word 0xbde5205c  ! 3101: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e421c5  ! 3102: SAVE_I	save	%r16, 0x0001, %r28
	mov	2, %r14
	.word 0xa193a000  ! 3106: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e4a046  ! 3108: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r21
	.word 0xb7e5e145  ! 3113: SAVE_I	save	%r23, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 3116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6950000  ! 3118: ORcc_R	orcc 	%r20, %r0, %r27
	.word 0xb3518000  ! 3119: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e06b  ! 3126: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbc8de056  ! 3127: ANDcc_I	andcc 	%r23, 0x0056, %r30
	setx	data_start_6, %g1, %r23
	.word 0xb1e5a0fa  ! 3129: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe52168  ! 3130: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5354000  ! 3133: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb5e5e151  ! 3141: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5e065  ! 3148: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_5, %g1, %r23
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 3151: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xb8054000  ! 3156: ADD_R	add 	%r21, %r0, %r28
	.word 0xbbe5e14c  ! 3160: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 3165: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa58000  ! 3168: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xb7e4a152  ! 3169: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982acb  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	.word 0x89946030  ! 3175: WRPR_TICK_I	wrpr	%r17, 0x0030, %tick
	.word 0xbbe5a133  ! 3181: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4e0be  ! 3182: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x10003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a8b  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8b, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5205d  ! 3190: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde560f3  ! 3198: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb635a1e9  ! 3199: SUBC_I	orn 	%r22, 0x01e9, %r27
	.word 0xb3e5a18b  ! 3201: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e023  ! 3204: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5e0d0  ! 3206: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x859561cc  ! 3207: WRPR_TSTATE_I	wrpr	%r21, 0x01cc, %tstate
	mov	0, %r14
	.word 0xa193a000  ! 3210: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8995a1ff  ! 3212: WRPR_TICK_I	wrpr	%r22, 0x01ff, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xb135a001  ! 3218: SRL_I	srl 	%r22, 0x0001, %r24
	.word 0xb8b48000  ! 3222: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xbfe420d1  ! 3224: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e56171  ! 3232: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde460de  ! 3233: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e52148  ! 3235: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5e014  ! 3239: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9504000  ! 3240: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5614d  ! 3244: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e521e4  ! 3247: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e42084  ! 3252: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a461ed  ! 3255: SUBcc_I	subcc 	%r17, 0x01ed, %r24
	.word 0xb9e4a1f3  ! 3260: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb2244000  ! 3262: SUB_R	sub 	%r17, %r0, %r25
	.word 0xb7e420a7  ! 3268: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5617c  ! 3270: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e42097  ! 3271: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4e00f  ! 3272: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x859421a7  ! 3273: WRPR_TSTATE_I	wrpr	%r16, 0x01a7, %tstate
	.word 0xb1e5a0b4  ! 3275: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e1b2  ! 3278: WRPR_PIL_I	wrpr	%r23, 0x01b2, %pil
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e521e4  ! 3288: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde5e059  ! 3293: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb6b5a070  ! 3295: SUBCcc_I	orncc 	%r22, 0x0070, %r27
	.word 0xb7e4e1dd  ! 3297: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_5, %g1, %r18
	setx	0x3031b, %g1, %o0
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
	.word 0xb7e4e16c  ! 3303: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 3306: RDPR_TT	<illegal instruction>
	.word 0x879460c3  ! 3309: WRPR_TT_I	wrpr	%r17, 0x00c3, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 3310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0xb5e5a062  ! 3311: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf50c000  ! 3312: RDPR_TT	<illegal instruction>
	.word 0xbbe4208a  ! 3314: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4a1da  ! 3318: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e0d2  ! 3320: WRPR_PSTATE_I	wrpr	%r19, 0x00d2, %pstate
	.word 0xbde46055  ! 3321: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4a109  ! 3327: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4e1a8  ! 3330: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe420ca  ! 3331: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8994a191  ! 3333: WRPR_TICK_I	wrpr	%r18, 0x0191, %tick
	.word 0xb9480000  ! 3334: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xba3c0000  ! 3336: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xbc0dc000  ! 3343: AND_R	and 	%r23, %r0, %r30
	.word 0xb5e4213d  ! 3347: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8195206f  ! 3348: WRPR_TPC_I	wrpr	%r20, 0x006f, %tpc
	.word 0xb7e46088  ! 3351: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_3, %g1, %r20
	.word 0xb1e4e0c5  ! 3356: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_6, %g1, %r19
	.word 0xb5e4a19d  ! 3358: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x89956155  ! 3359: WRPR_TICK_I	wrpr	%r21, 0x0155, %tick
	.word 0xb5e4e17b  ! 3361: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8594e093  ! 3364: WRPR_TSTATE_I	wrpr	%r19, 0x0093, %tstate
	.word 0xbbe4e03f  ! 3372: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e46053  ! 3374: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde520f9  ! 3377: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x87946170  ! 3378: WRPR_TT_I	wrpr	%r17, 0x0170, %tt
	.word 0xb1e5e172  ! 3383: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8594209e  ! 3384: WRPR_TSTATE_I	wrpr	%r16, 0x009e, %tstate
	.word 0xb3e5215c  ! 3385: SAVE_I	save	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983859  ! 3387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1859, %hpstate
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a012  ! 3390: WRPR_TPC_I	wrpr	%r18, 0x0012, %tpc
	.word 0x8994216f  ! 3391: WRPR_TICK_I	wrpr	%r16, 0x016f, %tick
	.word 0xbe148000  ! 3395: OR_R	or 	%r18, %r0, %r31
	.word 0xbf3d0000  ! 3397: SRA_R	sra 	%r20, %r0, %r31
	.word 0xb81c61c9  ! 3400: XOR_I	xor 	%r17, 0x01c9, %r28
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1d0  ! 3405: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5e0e9  ! 3406: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd540000  ! 3408: RDPR_GL	<illegal instruction>
	.word 0xb5e5e0a8  ! 3410: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e5216e  ! 3412: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e5e158  ! 3419: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e52171  ! 3421: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4044000  ! 3423: ADD_R	add 	%r17, %r0, %r26
	.word 0xbbe56097  ! 3425: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e4615e  ! 3429: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e4e1e2  ! 3430: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbd480000  ! 3434: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46108  ! 3437: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4a1dc  ! 3438: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e421d2  ! 3444: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xb7e42032  ! 3447: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4e108  ! 3450: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4e1ee  ! 3454: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x37, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0x8194e028  ! 3463: WRPR_TPC_I	wrpr	%r19, 0x0028, %tpc
	.word 0xb5e4a0f5  ! 3464: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe4a1f3  ! 3465: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e56137  ! 3469: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbec48000  ! 3474: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0x8394a01e  ! 3475: WRPR_TNPC_I	wrpr	%r18, 0x001e, %tnpc
	setx	0x20316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4218d  ! 3481: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4615c  ! 3482: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4e161  ! 3485: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x91946183  ! 3491: WRPR_PIL_I	wrpr	%r17, 0x0183, %pil
	.word 0xbab54000  ! 3492: SUBCcc_R	orncc 	%r21, %r0, %r29
	.word 0xbde4e198  ! 3494: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1510000  ! 3495: RDPR_TICK	<illegal instruction>
	.word 0xb5e5611f  ! 3499: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e56138  ! 3500: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb92dd000  ! 3507: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb1e5e1a2  ! 3509: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46055  ! 3512: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5e1b4  ! 3513: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e42026  ! 3519: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5a160  ! 3522: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x91952133  ! 3524: WRPR_PIL_I	wrpr	%r20, 0x0133, %pil
	.word 0xb20c8000  ! 3526: AND_R	and 	%r18, %r0, %r25
	.word 0xb1518000  ! 3530: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4e0fe  ! 3532: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e560e8  ! 3533: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x9194209f  ! 3535: WRPR_PIL_I	wrpr	%r16, 0x009f, %pil
	.word 0xb5518000  ! 3536: RDPR_PSTATE	<illegal instruction>
	.word 0xb0b4c000  ! 3540: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xbde4a1f7  ! 3541: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	mov	0, %r12
	.word 0x8f932000  ! 3546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e56099  ! 3548: SAVE_I	save	%r21, 0x0001, %r28
	mov	2, %r14
	.word 0xa193a000  ! 3549: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e461b0  ! 3552: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1508000  ! 3554: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4a003  ! 3555: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5e1ff  ! 3556: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5e082  ! 3558: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e0e4  ! 3566: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe4e0f8  ! 3570: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4e1c5  ! 3576: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba84e14d  ! 3577: ADDcc_I	addcc 	%r19, 0x014d, %r29
	.word 0x8194e18a  ! 3581: WRPR_TPC_I	wrpr	%r19, 0x018a, %tpc
	.word 0xb3e4a017  ! 3582: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e52101  ! 3585: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb844615b  ! 3588: ADDC_I	addc 	%r17, 0x015b, %r28
	.word 0xb5e560c7  ! 3593: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4a188  ! 3595: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8195604b  ! 3597: WRPR_TPC_I	wrpr	%r21, 0x004b, %tpc
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 3599: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e52100  ! 3600: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5e07e  ! 3603: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd51c000  ! 3605: RDPR_TL	<illegal instruction>
	.word 0xbfe5e0b5  ! 3606: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb445a13d  ! 3607: ADDC_I	addc 	%r22, 0x013d, %r26
	.word 0xb1e560e4  ! 3609: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1dc  ! 3617: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x9195e105  ! 3618: WRPR_PIL_I	wrpr	%r23, 0x0105, %pil
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4219d  ! 3622: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_7, %g1, %r18
	.word 0xbf510000  ! 3624: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xb9e5a0bc  ! 3627: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb68de189  ! 3628: ANDcc_I	andcc 	%r23, 0x0189, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8395a1ca  ! 3633: WRPR_TNPC_I	wrpr	%r22, 0x01ca, %tnpc
	setx	data_start_2, %g1, %r18
	.word 0xbfe56045  ! 3636: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4a1b7  ! 3637: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 3642: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d94e014  ! 3643: WRPR_PSTATE_I	wrpr	%r19, 0x0014, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4600e  ! 3651: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4e0fa  ! 3652: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbb518000  ! 3654: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4a04e  ! 3657: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5e08f  ! 3659: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x819829cb  ! 3664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cb, %hpstate
	.word 0xbde5208e  ! 3670: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8395e12d  ! 3671: WRPR_TNPC_I	wrpr	%r23, 0x012d, %tnpc
	setx	0x10000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42113  ! 3683: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e5e124  ! 3684: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbc9cc000  ! 3687: XORcc_R	xorcc 	%r19, %r0, %r30
	.word 0xb23c0000  ! 3688: XNOR_R	xnor 	%r16, %r0, %r25
	.word 0x8594e18f  ! 3690: WRPR_TSTATE_I	wrpr	%r19, 0x018f, %tstate
	.word 0x9195e103  ! 3692: WRPR_PIL_I	wrpr	%r23, 0x0103, %pil
	mov	0, %r12
	.word 0x8f932000  ! 3693: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3510000  ! 3695: RDPR_TICK	<illegal instruction>
	.word 0xb950c000  ! 3697: RDPR_TT	<illegal instruction>
	.word 0x899421e2  ! 3699: WRPR_TICK_I	wrpr	%r16, 0x01e2, %tick
	.word 0xb1e4e001  ! 3700: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e420c0  ! 3703: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5a016  ! 3704: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe42078  ! 3706: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e521b1  ! 3712: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe42081  ! 3715: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4a1e1  ! 3717: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4200d  ! 3718: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb8248000  ! 3719: SUB_R	sub 	%r18, %r0, %r28
	setx	0x10218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e16b  ! 3722: WRPR_TPC_I	wrpr	%r23, 0x016b, %tpc
	.word 0xbfe520c3  ! 3724: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5e0ff  ! 3727: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4e08c  ! 3730: SAVE_I	save	%r19, 0x0001, %r26
	mov	1, %r12
	.word 0x8f932000  ! 3734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde561fb  ! 3735: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8194213e  ! 3736: WRPR_TPC_I	wrpr	%r16, 0x013e, %tpc
	.word 0xbbe56096  ! 3737: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421db  ! 3741: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf480000  ! 3742: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e561ce  ! 3744: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe56068  ! 3751: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1510000  ! 3759: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3761: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe4210e  ! 3762: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd480000  ! 3765: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9e5618b  ! 3771: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8995a10a  ! 3775: WRPR_TICK_I	wrpr	%r22, 0x010a, %tick
	.word 0xbfe561d9  ! 3777: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e1e6  ! 3778: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8594e13a  ! 3782: WRPR_TSTATE_I	wrpr	%r19, 0x013a, %tstate
	.word 0xb6bc4000  ! 3795: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xbbe46102  ! 3796: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e421cb  ! 3798: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8395e166  ! 3801: WRPR_TNPC_I	wrpr	%r23, 0x0166, %tnpc
	.word 0xba34c000  ! 3802: SUBC_R	orn 	%r19, %r0, %r29
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a03b  ! 3804: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x839561fd  ! 3807: WRPR_TNPC_I	wrpr	%r21, 0x01fd, %tnpc
	.word 0xb1e52134  ! 3810: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4a1f3  ! 3813: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe521ff  ! 3820: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe46188  ! 3826: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1ce  ! 3831: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e461f9  ! 3835: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e096  ! 3836: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5e08c  ! 3838: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5a0de  ! 3843: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb4c40000  ! 3846: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xb5e46146  ! 3847: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5a035  ! 3848: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e52139  ! 3850: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5613a  ! 3853: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5a0fc  ! 3855: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb21c0000  ! 3856: XOR_R	xor 	%r16, %r0, %r25
	.word 0xb7e4606c  ! 3858: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb9e4a11d  ! 3863: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x9194e01b  ! 3864: WRPR_PIL_I	wrpr	%r19, 0x001b, %pil
	.word 0xb7e52008  ! 3866: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7518000  ! 3869: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4e0a1  ! 3871: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf540000  ! 3872: RDPR_GL	<illegal instruction>
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0cd  ! 3876: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e560a4  ! 3878: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf540000  ! 3882: RDPR_GL	<illegal instruction>
	.word 0xb9520000  ! 3885: RDPR_PIL	<illegal instruction>
	.word 0xb5504000  ! 3886: RDPR_TNPC	<illegal instruction>
	.word 0xb4bc4000  ! 3888: XNORcc_R	xnorcc 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f5b  ! 3891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0xbbe5a07f  ! 3892: SAVE_I	save	%r22, 0x0001, %r29
	mov	2, %r12
	.word 0x8f932000  ! 3893: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbaac8000  ! 3894: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xb9540000  ! 3896: RDPR_GL	<illegal instruction>
	.word 0xb7e421f3  ! 3899: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe561e1  ! 3901: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5480000  ! 3904: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xba2cc000  ! 3907: ANDN_R	andn 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e46034  ! 3909: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb4348000  ! 3911: ORN_R	orn 	%r18, %r0, %r26
	.word 0xbfe42039  ! 3914: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5510000  ! 3915: RDPR_TICK	<illegal instruction>
	.word 0xb1e4e108  ! 3917: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x10202, %g1, %o0
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
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919520b8  ! 3927: WRPR_PIL_I	wrpr	%r20, 0x00b8, %pil
	.word 0xbf480000  ! 3932: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e4613b  ! 3934: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e5a1df  ! 3935: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e42143  ! 3936: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e1b4  ! 3938: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb151c000  ! 3939: RDPR_TL	<illegal instruction>
	.word 0xbde5e0a2  ! 3940: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7510000  ! 3941: RDPR_TICK	<illegal instruction>
	.word 0xb72d2001  ! 3942: SLL_I	sll 	%r20, 0x0001, %r27
	.word 0xbbe5608c  ! 3943: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb8a5c000  ! 3945: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xb6b48000  ! 3951: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0xb4bc8000  ! 3958: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xbbe4613c  ! 3960: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a075  ! 3965: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4a096  ! 3968: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd3cc000  ! 3970: SRA_R	sra 	%r19, %r0, %r30
	.word 0xb61c2194  ! 3971: XOR_I	xor 	%r16, 0x0194, %r27
	.word 0xbfe460f6  ! 3973: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_6, %g1, %r16
	.word 0xb5e46064  ! 3983: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8595a0e8  ! 3985: WRPR_TSTATE_I	wrpr	%r22, 0x00e8, %tstate
	.word 0xbfe521e7  ! 3988: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb88d6102  ! 3991: ANDcc_I	andcc 	%r21, 0x0102, %r28
	.word 0xbbe5207a  ! 3992: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4a152  ! 3994: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4a0e9  ! 3995: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4e1ac  ! 4002: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4a1c2  ! 4003: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d95a162  ! 4005: WRPR_PSTATE_I	wrpr	%r22, 0x0162, %pstate
	.word 0xb1e4a05b  ! 4009: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942133  ! 4016: WRPR_PSTATE_I	wrpr	%r16, 0x0133, %pstate
	.word 0x89956156  ! 4020: WRPR_TICK_I	wrpr	%r21, 0x0156, %tick
	.word 0xbc046005  ! 4021: ADD_I	add 	%r17, 0x0005, %r30
	.word 0xbde5e1fd  ! 4025: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4a14b  ! 4027: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb500000  ! 4028: RDPR_TPC	<illegal instruction>
	.word 0xb1e420a9  ! 4029: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e521a3  ! 4030: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d952153  ! 4031: WRPR_PSTATE_I	wrpr	%r20, 0x0153, %pstate
	.word 0xb1e5e1fe  ! 4033: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xb1e4e03f  ! 4039: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e56040  ! 4041: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4610c  ! 4044: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_5, %g1, %r19
	.word 0xbbe460e5  ! 4052: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5520000  ! 4057: RDPR_PIL	<illegal instruction>
	.word 0xbde4a198  ! 4059: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x839561b1  ! 4060: WRPR_TNPC_I	wrpr	%r21, 0x01b1, %tnpc
	.word 0xb3e4a18f  ! 4061: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4e03f  ! 4063: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe521d3  ! 4067: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde4e031  ! 4070: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3518000  ! 4071: RDPR_PSTATE	<illegal instruction>
	.word 0xb73c7001  ! 4072: SRAX_I	srax	%r17, 0x0001, %r27
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 4077: RDPR_TL	<illegal instruction>
	.word 0xb7e46145  ! 4082: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb63420cf  ! 4084: ORN_I	orn 	%r16, 0x00cf, %r27
	.word 0xb3e460d0  ! 4085: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbea5c000  ! 4086: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xb9e420fb  ! 4087: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e420f5  ! 4088: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983b11  ! 4091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b11, %hpstate
	.word 0xb9518000  ! 4093: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5609a  ! 4094: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5e044  ! 4096: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_3, %g1, %r17
	.word 0xbde4a1a9  ! 4099: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982f1b  ! 4100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1b, %hpstate
	.word 0xb1e4206a  ! 4102: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4a1e9  ! 4104: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e56159  ! 4106: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5e0a2  ! 4108: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf51c000  ! 4113: RDPR_TL	<illegal instruction>
	.word 0xb4a560aa  ! 4114: SUBcc_I	subcc 	%r21, 0x00aa, %r26
	mov	2, %r14
	.word 0xa193a000  ! 4118: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r18
	.word 0xb3e520a6  ! 4121: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5a021  ! 4123: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5201b  ! 4124: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8194a0f4  ! 4125: WRPR_TPC_I	wrpr	%r18, 0x00f4, %tpc
	.word 0xbfe56034  ! 4127: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_0, %g1, %r17
	.word 0xbbe56008  ! 4130: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4a192  ! 4131: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4e168  ! 4135: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb2cd000  ! 4138: SLLX_R	sllx	%r19, %r0, %r29
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e0ff  ! 4144: WRPR_PSTATE_I	wrpr	%r23, 0x00ff, %pstate
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e071  ! 4153: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb12de001  ! 4156: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xbde561a1  ! 4157: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e52144  ! 4159: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7520000  ! 4162: RDPR_PIL	<illegal instruction>
	.word 0xb1e56141  ! 4166: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1518000  ! 4170: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5e0b5  ! 4171: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xba2c4000  ! 4173: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xb5e4e12b  ! 4174: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4180: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb540000  ! 4186: RDPR_GL	<illegal instruction>
	.word 0xbb510000  ! 4188: RDPR_TICK	<illegal instruction>
	.word 0xbf518000  ! 4189: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 4191: RDPR_TL	<illegal instruction>
	.word 0xb5e4609c  ! 4193: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e56153  ! 4197: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5a1a7  ! 4199: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4e153  ! 4200: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e520bb  ! 4202: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e42084  ! 4206: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5612e  ! 4213: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9540000  ! 4214: RDPR_GL	<illegal instruction>
	.word 0xbcaca117  ! 4215: ANDNcc_I	andncc 	%r18, 0x0117, %r30
	.word 0xb3e421d8  ! 4220: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb00c6021  ! 4221: AND_I	and 	%r17, 0x0021, %r24
	.word 0xb5e46117  ! 4222: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9518000  ! 4223: RDPR_PSTATE	<illegal instruction>
	.word 0xb23c4000  ! 4226: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0xbbe4206f  ! 4227: SAVE_I	save	%r16, 0x0001, %r29
	mov	2, %r12
	.word 0x8f932000  ! 4229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982e59  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983993  ! 4233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1993, %hpstate
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc840000  ! 4237: ADDcc_R	addcc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982c81  ! 4238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
	.word 0xb7e561e2  ! 4239: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4616e  ! 4241: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe4e065  ! 4242: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e42186  ! 4243: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0x8d94a002  ! 4245: WRPR_PSTATE_I	wrpr	%r18, 0x0002, %pstate
	.word 0xbde46172  ! 4249: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb518000  ! 4250: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4a188  ! 4251: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde42044  ! 4252: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e054  ! 4254: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5a19a  ! 4260: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e044  ! 4266: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4a0eb  ! 4267: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5e106  ! 4269: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e520e2  ! 4270: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb551c000  ! 4274: RDPR_TL	<illegal instruction>
	.word 0xbcc521ac  ! 4279: ADDCcc_I	addccc 	%r20, 0x01ac, %r30
	.word 0xbbe52041  ! 4280: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1504000  ! 4282: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 4284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	.word 0xb5e521d1  ! 4285: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbac56026  ! 4287: ADDCcc_I	addccc 	%r21, 0x0026, %r29
	.word 0x8d94a136  ! 4288: WRPR_PSTATE_I	wrpr	%r18, 0x0136, %pstate
	.word 0xb1e4a137  ! 4291: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5616c  ! 4294: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde461d4  ! 4295: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e5a0c9  ! 4296: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e460b2  ! 4297: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4604d  ! 4301: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4e0a2  ! 4304: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4e11c  ! 4305: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb225c000  ! 4307: SUB_R	sub 	%r23, %r0, %r25
	.word 0xb5e4e056  ! 4309: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbb7d8400  ! 4312: MOVR_R	movre	%r22, %r0, %r29
	.word 0xbde5a1dd  ! 4317: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4202a  ! 4318: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde56106  ! 4321: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e4e0d0  ! 4322: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe42114  ! 4323: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd518000  ! 4333: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x30018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba3da037  ! 4339: XNOR_I	xnor 	%r22, 0x0037, %r29
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4345: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5202b  ! 4346: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1520000  ! 4347: RDPR_PIL	<illegal instruction>
	.word 0x8195a0b6  ! 4356: WRPR_TPC_I	wrpr	%r22, 0x00b6, %tpc
	.word 0xb5350000  ! 4358: SRL_R	srl 	%r20, %r0, %r26
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e108  ! 4361: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4a1eb  ! 4363: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe421a6  ! 4364: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e027  ! 4372: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a10d  ! 4375: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0ed  ! 4384: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e5a0eb  ! 4385: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5209a  ! 4386: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e4e144  ! 4390: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9194a120  ! 4392: WRPR_PIL_I	wrpr	%r18, 0x0120, %pil
	.word 0xb5e4a1d4  ! 4393: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1508000  ! 4394: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4e07b  ! 4395: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x30211, %g1, %o0
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
	.word 0xb1e4a0c1  ! 4399: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e52182  ! 4403: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8995e063  ! 4404: WRPR_TICK_I	wrpr	%r23, 0x0063, %tick
	setx	data_start_1, %g1, %r20
	.word 0xb9e4a16c  ! 4408: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4e016  ! 4412: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d956032  ! 4413: WRPR_PSTATE_I	wrpr	%r21, 0x0032, %pstate
	.word 0xbb518000  ! 4414: RDPR_PSTATE	<illegal instruction>
	.word 0x8594e190  ! 4418: WRPR_TSTATE_I	wrpr	%r19, 0x0190, %tstate
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e521d1  ! 4420: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e4e1d4  ! 4421: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e0f8  ! 4422: SAVE_I	save	%r19, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 4423: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e42044  ! 4427: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8195614b  ! 4429: WRPR_TPC_I	wrpr	%r21, 0x014b, %tpc
	.word 0xb3e460ca  ! 4430: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbd2c4000  ! 4433: SLL_R	sll 	%r17, %r0, %r30
	.word 0xb0456012  ! 4444: ADDC_I	addc 	%r21, 0x0012, %r24
	.word 0xbb540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xb7540000  ! 4448: RDPR_GL	<illegal instruction>
	.word 0xb9e561a9  ! 4449: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_6, %g1, %r21
	.word 0x9194a06c  ! 4451: WRPR_PIL_I	wrpr	%r18, 0x006c, %pil
	.word 0xb9e5a02e  ! 4455: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb085c000  ! 4456: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xb1e5a07b  ! 4458: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xbbe521d8  ! 4463: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a17f  ! 4469: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e520cd  ! 4472: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3504000  ! 4473: RDPR_TNPC	<illegal instruction>
	.word 0xb835c000  ! 4474: SUBC_R	orn 	%r23, %r0, %r28
	.word 0xb5508000  ! 4475: RDPR_TSTATE	<illegal instruction>
	.word 0xb02d0000  ! 4477: ANDN_R	andn 	%r20, %r0, %r24
	.word 0xbde5218b  ! 4478: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4608c  ! 4489: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9d2135  ! 4495: XORcc_I	xorcc 	%r20, 0x0135, %r29
	.word 0xb9e4a079  ! 4498: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 4499: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3510000  ! 4501: RDPR_TICK	<illegal instruction>
	.word 0xb5e4619d  ! 4502: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e46008  ! 4504: SAVE_I	save	%r17, 0x0001, %r26
	mov	2, %r12
	.word 0x8f932000  ! 4506: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e5e115  ! 4509: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe46117  ! 4510: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4512: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_4, %g1, %r23
	.word 0xb5480000  ! 4517: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e52063  ! 4518: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8394211a  ! 4521: WRPR_TNPC_I	wrpr	%r16, 0x011a, %tnpc
	.word 0xb7e5e0d9  ! 4523: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 4528: RDPR_TL	<illegal instruction>
	.word 0xbbe420af  ! 4529: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5a07d  ! 4530: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde561f8  ! 4534: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe42136  ! 4536: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd480000  ! 4539: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1e520b1  ! 4540: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde461c8  ! 4544: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e46103  ! 4549: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e56147  ! 4550: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb6042196  ! 4553: ADD_I	add 	%r16, 0x0196, %r27
	setx	data_start_2, %g1, %r23
	.word 0x8d94e1cf  ! 4558: WRPR_PSTATE_I	wrpr	%r19, 0x01cf, %pstate
	mov	2, %r14
	.word 0xa193a000  ! 4559: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb33da001  ! 4561: SRA_I	sra 	%r22, 0x0001, %r25
	.word 0xbb51c000  ! 4565: RDPR_TL	<illegal instruction>
	.word 0xb3e561f6  ! 4566: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 4569: RDPR_PSTATE	<illegal instruction>
	setx	0x20117, %g1, %o0
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
	.word 0xb7347001  ! 4583: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xb7e4e0a9  ! 4588: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe4a11c  ! 4594: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5e1c6  ! 4597: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5a178  ! 4598: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e52016  ! 4601: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e46010  ! 4604: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8195a195  ! 4610: WRPR_TPC_I	wrpr	%r22, 0x0195, %tpc
	.word 0x8594605c  ! 4611: WRPR_TSTATE_I	wrpr	%r17, 0x005c, %tstate
	.word 0xb3e4a1a0  ! 4612: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb150c000  ! 4615: RDPR_TT	<illegal instruction>
	.word 0xbde4e06d  ! 4616: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_2, %g1, %r17
	.word 0xb9e4e08a  ! 4624: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421f8  ! 4628: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd510000  ! 4630: RDPR_TICK	<illegal instruction>
	.word 0xb6444000  ! 4641: ADDC_R	addc 	%r17, %r0, %r27
	.word 0xbc458000  ! 4642: ADDC_R	addc 	%r22, %r0, %r30
	setx	0x2011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde421e7  ! 4647: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e561e9  ! 4648: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e184  ! 4651: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc8cc000  ! 4653: ANDcc_R	andcc 	%r19, %r0, %r30
	setx	data_start_1, %g1, %r16
	.word 0xbfe52100  ! 4661: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5355000  ! 4663: SRLX_R	srlx	%r21, %r0, %r26
	.word 0xb1e4e082  ! 4665: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe46113  ! 4667: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5205a  ! 4668: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe46145  ! 4681: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4608e  ! 4684: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	.word 0x8794a166  ! 4688: WRPR_TT_I	wrpr	%r18, 0x0166, %tt
	.word 0xb57de401  ! 4689: MOVR_I	movre	%r23, 0x1, %r26
	.word 0xb0856006  ! 4690: ADDcc_I	addcc 	%r21, 0x0006, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982e41  ! 4692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xbfe561b7  ! 4694: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e021  ! 4696: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd518000  ! 4702: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e42114  ! 4703: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4a16f  ! 4706: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x879460c2  ! 4710: WRPR_TT_I	wrpr	%r17, 0x00c2, %tt
	.word 0xbfe46136  ! 4712: SAVE_I	save	%r17, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 4713: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe460eb  ! 4716: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8794a07c  ! 4721: WRPR_TT_I	wrpr	%r18, 0x007c, %tt
	.word 0xb1e4a02e  ! 4730: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4a0ed  ! 4732: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbeb5a1de  ! 4733: SUBCcc_I	orncc 	%r22, 0x01de, %r31
	.word 0xb9e56006  ! 4740: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x899421ff  ! 4743: WRPR_TICK_I	wrpr	%r16, 0x01ff, %tick
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 4757: RDPR_TNPC	<illegal instruction>
	.word 0xb1e461d3  ! 4758: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbe8c61c4  ! 4759: ANDcc_I	andcc 	%r17, 0x01c4, %r31
	.word 0xbfe421a0  ! 4761: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8d9520cf  ! 4762: WRPR_PSTATE_I	wrpr	%r20, 0x00cf, %pstate
	.word 0xb3e4617b  ! 4768: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4a017  ! 4773: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4200c  ! 4776: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4e143  ! 4778: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e52096  ! 4780: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e42197  ! 4783: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5643801  ! 4784: MOVcc_I	<illegal instruction>
	.word 0xb5e4618e  ! 4785: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e5e0b2  ! 4786: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4a089  ! 4788: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5e1a8  ! 4789: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8195e0e5  ! 4790: WRPR_TPC_I	wrpr	%r23, 0x00e5, %tpc
	mov	0, %r14
	.word 0xa193a000  ! 4793: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r14
	.word 0xa193a000  ! 4794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e561a7  ! 4796: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0xb7e4216b  ! 4798: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xba348000  ! 4808: ORN_R	orn 	%r18, %r0, %r29
	.word 0xb9e520d2  ! 4809: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe460fe  ! 4811: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4219b  ! 4812: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d95a0b1  ! 4814: WRPR_PSTATE_I	wrpr	%r22, 0x00b1, %pstate
	.word 0x8794e0ce  ! 4815: WRPR_TT_I	wrpr	%r19, 0x00ce, %tt
	.word 0xb3e5a11e  ! 4817: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4a006  ! 4820: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e561b8  ! 4821: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8195e1d1  ! 4822: WRPR_TPC_I	wrpr	%r23, 0x01d1, %tpc
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e461a7  ! 4827: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4219a  ! 4829: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3508000  ! 4831: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 4832: RDPR_TT	<illegal instruction>
	.word 0xb3e52065  ! 4837: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x859560d0  ! 4841: WRPR_TSTATE_I	wrpr	%r21, 0x00d0, %tstate
	.word 0xb335b001  ! 4845: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xbde4e0af  ! 4848: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1520000  ! 4849: RDPR_PIL	<illegal instruction>
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde56046  ! 4852: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe420ff  ! 4854: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x899421f1  ! 4856: WRPR_TICK_I	wrpr	%r16, 0x01f1, %tick
	.word 0xb8944000  ! 4859: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0x91942175  ! 4860: WRPR_PIL_I	wrpr	%r16, 0x0175, %pil
	.word 0xb03ce0f7  ! 4862: XNOR_I	xnor 	%r19, 0x00f7, %r24
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a1ee  ! 4867: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4a172  ! 4869: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe461bf  ! 4878: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbc144000  ! 4880: OR_R	or 	%r17, %r0, %r30
	.word 0xb7e5a09d  ! 4884: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbf540000  ! 4887: RDPR_GL	<illegal instruction>
	setx	0x2012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5212a  ! 4891: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7480000  ! 4899: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a08b  ! 4907: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4213a  ! 4909: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x899461f3  ! 4911: WRPR_TICK_I	wrpr	%r17, 0x01f3, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982bd9  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd9, %hpstate
	.word 0xb214e047  ! 4916: OR_I	or 	%r19, 0x0047, %r25
	.word 0xbfe4e139  ! 4923: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4602f  ! 4924: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3508000  ! 4925: RDPR_TSTATE	<illegal instruction>
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e42062  ! 4927: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e19e  ! 4928: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e5600b  ! 4931: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb6b4e101  ! 4937: SUBCcc_I	orncc 	%r19, 0x0101, %r27
	.word 0xbde5a0c7  ! 4938: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4e17b  ! 4942: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf7c8400  ! 4943: MOVR_R	movre	%r18, %r0, %r31
	.word 0xb5e520de  ! 4944: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xba9c4000  ! 4949: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xb5e52081  ! 4952: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8d9520f0  ! 4953: WRPR_PSTATE_I	wrpr	%r20, 0x00f0, %pstate
	.word 0xb7e520a0  ! 4955: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5613b  ! 4956: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde4e10d  ! 4964: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e42078  ! 4965: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe421b7  ! 4972: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5e052  ! 4973: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5a116  ! 4979: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb4c54000  ! 4982: ADDCcc_R	addccc 	%r21, %r0, %r26
	.word 0xb7e42196  ! 4983: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8395e19a  ! 4984: WRPR_TNPC_I	wrpr	%r23, 0x019a, %tnpc
	setx	data_start_0, %g1, %r16
	.word 0xb1e5a14c  ! 4989: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4a1a5  ! 4990: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4a036  ! 4991: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf50c000  ! 4993: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 4994: RDPR_TSTATE	<illegal instruction>
	.word 0x87952067  ! 4995: WRPR_TT_I	wrpr	%r20, 0x0067, %tt
	.word 0xbde5a0ea  ! 4997: SAVE_I	save	%r22, 0x0001, %r30
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
	.word 0xb350c000  ! 4: RDPR_TT	rdpr	%tt, %r25
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d2172  ! 9: STDF_I	std	%f25, [0x0172, %r20]
	.word 0xb92df001  ! 11: SLLX_I	sllx	%r23, 0x0001, %r28
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674e135  ! 14: STX_I	stx	%r27, [%r19 + 0x0135]
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75a194  ! 16: STX_I	stx	%r31, [%r22 + 0x0194]
	.word 0xf03cc000  ! 19: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf0748000  ! 20: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf234c000  ! 21: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfc2c204f  ! 24: STB_I	stb	%r30, [%r16 + 0x004f]
	.word 0xf6742054  ! 31: STX_I	stx	%r27, [%r16 + 0x0054]
	.word 0xfc3420ae  ! 34: STH_I	sth	%r30, [%r16 + 0x00ae]
	.word 0xf274a046  ! 37: STX_I	stx	%r25, [%r18 + 0x0046]
	.word 0xf53de0f9  ! 41: STDF_I	std	%f26, [0x00f9, %r23]
	.word 0xba2c8000  ! 42: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xfe252059  ! 44: STW_I	stw	%r31, [%r20 + 0x0059]
	.word 0xfc2cc000  ! 45: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf4748000  ! 47: STX_R	stx	%r26, [%r18 + %r0]
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595209c  ! 60: WRPR_TSTATE_I	wrpr	%r20, 0x009c, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0xff3ca012  ! 66: STDF_I	std	%f31, [0x0012, %r18]
	.word 0xb28521e9  ! 68: ADDcc_I	addcc 	%r20, 0x01e9, %r25
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf824a001  ! 70: STW_I	stw	%r28, [%r18 + 0x0001]
	setx	data_start_0, %g1, %r17
	.word 0xbf508000  ! 73: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfa2cc000  ! 76: STB_R	stb	%r29, [%r19 + %r0]
	setx	0x20302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 81: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf23d0000  ! 82: STD_R	std	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	setx	data_start_0, %g1, %r22
	.word 0xbebca1dd  ! 89: XNORcc_I	xnorcc 	%r18, 0x01dd, %r31
	.word 0xf43c6187  ! 90: STD_I	std	%r26, [%r17 + 0x0187]
	.word 0xf6348000  ! 91: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf23d0000  ! 92: STD_R	std	%r25, [%r20 + %r0]
	.word 0xbf504000  ! 95: RDPR_TNPC	rdpr	%tnpc, %r31
	ta	T_CHANGE_HPRIV
	.word 0x8198380b  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 99: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf62d8000  ! 100: STB_R	stb	%r27, [%r22 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 104: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0a5a077  ! 106: SUBcc_I	subcc 	%r22, 0x0077, %r24
	setx	data_start_1, %g1, %r21
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62561a9  ! 111: STW_I	stw	%r27, [%r21 + 0x01a9]
	.word 0xf62de1a8  ! 112: STB_I	stb	%r27, [%r23 + 0x01a8]
	.word 0xfa2c8000  ! 114: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf02cc000  ! 121: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf23520d9  ! 123: STH_I	sth	%r25, [%r20 + 0x00d9]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf342001  ! 131: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0xf82d4000  ! 134: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xb3518000  ! 137: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb6042085  ! 138: ADD_I	add 	%r16, 0x0085, %r27
	.word 0xf73c0000  ! 139: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf73dc000  ! 140: STDF_R	std	%f27, [%r0, %r23]
	.word 0xb69cc000  ! 141: XORcc_R	xorcc 	%r19, %r0, %r27
	.word 0xf83d8000  ! 144: STD_R	std	%r28, [%r22 + %r0]
	.word 0xfc356132  ! 151: STH_I	sth	%r30, [%r21 + 0x0132]
	.word 0xf02d4000  ! 154: STB_R	stb	%r24, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa3ce01e  ! 156: STD_I	std	%r29, [%r19 + 0x001e]
	.word 0xfc2d4000  ! 157: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf4740000  ! 160: STX_R	stx	%r26, [%r16 + %r0]
	setx	0x2002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 163: RDPR_GL	rdpr	%-, %r24
	.word 0x8395e126  ! 167: WRPR_TNPC_I	wrpr	%r23, 0x0126, %tnpc
	.word 0x859561bd  ! 172: WRPR_TSTATE_I	wrpr	%r21, 0x01bd, %tstate
	.word 0x879420c2  ! 173: WRPR_TT_I	wrpr	%r16, 0x00c2, %tt
	.word 0x8d95a129  ! 178: WRPR_PSTATE_I	wrpr	%r22, 0x0129, %pstate
	.word 0xf03ce024  ! 179: STD_I	std	%r24, [%r19 + 0x0024]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	.word 0x81983c91  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c91, %hpstate
	.word 0xbea48000  ! 185: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xfa246110  ! 187: STW_I	stw	%r29, [%r17 + 0x0110]
	.word 0x8995a127  ! 191: WRPR_TICK_I	wrpr	%r22, 0x0127, %tick
	.word 0xf22c8000  ! 192: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xb9510000  ! 195: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf62de148  ! 202: STB_I	stb	%r27, [%r23 + 0x0148]
	.word 0xb3508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0xf23c2043  ! 209: STD_I	std	%r25, [%r16 + 0x0043]
	.word 0xf0758000  ! 212: STX_R	stx	%r24, [%r22 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xfe75c000  ! 216: STX_R	stx	%r31, [%r23 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 218: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf82c0000  ! 220: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb5508000  ! 225: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf82da018  ! 226: STB_I	stb	%r28, [%r22 + 0x0018]
	.word 0xfa3c2025  ! 228: STD_I	std	%r29, [%r16 + 0x0025]
	.word 0xf62cc000  ! 229: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xbe25e125  ! 232: SUB_I	sub 	%r23, 0x0125, %r31
	.word 0xb33c6001  ! 233: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xb750c000  ! 235: RDPR_TT	rdpr	%tt, %r27
	.word 0xf0348000  ! 238: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf33ca07a  ! 239: STDF_I	std	%f25, [0x007a, %r18]
	.word 0xf2358000  ! 241: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xba9c20eb  ! 242: XORcc_I	xorcc 	%r16, 0x00eb, %r29
	.word 0xf93dc000  ! 244: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb3520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0xfd3d2182  ! 249: STDF_I	std	%f30, [0x0182, %r20]
	.word 0xf33c0000  ! 250: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfd3dc000  ! 252: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf07561e9  ! 254: STX_I	stx	%r24, [%r21 + 0x01e9]
	.word 0xb93ca001  ! 259: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xf03dc000  ! 261: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb9504000  ! 264: RDPR_TNPC	<illegal instruction>
	.word 0xf82dc000  ! 270: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf02c6143  ! 271: STB_I	stb	%r24, [%r17 + 0x0143]
	.word 0xfa2d615e  ! 281: STB_I	stb	%r29, [%r21 + 0x015e]
	.word 0xf23561e2  ! 290: STH_I	sth	%r25, [%r21 + 0x01e2]
	.word 0x91952005  ! 291: WRPR_PIL_I	wrpr	%r20, 0x0005, %pil
	.word 0xf4348000  ! 293: STH_R	sth	%r26, [%r18 + %r0]
	setx	data_start_6, %g1, %r21
	.word 0xb3520000  ! 297: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfa35a1bc  ! 298: STH_I	sth	%r29, [%r22 + 0x01bc]
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 301: RDPR_PSTATE	<illegal instruction>
	.word 0xb1520000  ! 305: RDPR_PIL	<illegal instruction>
	.word 0xf2350000  ! 306: STH_R	sth	%r25, [%r20 + %r0]
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 308: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6c5e1fd  ! 311: ADDCcc_I	addccc 	%r23, 0x01fd, %r27
	.word 0xbb540000  ! 313: RDPR_GL	rdpr	%-, %r29
	.word 0xfe3dc000  ! 314: STD_R	std	%r31, [%r23 + %r0]
	.word 0xfa754000  ! 316: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb550c000  ! 322: RDPR_TT	<illegal instruction>
	.word 0xf23ce1e3  ! 324: STD_I	std	%r25, [%r19 + 0x01e3]
	setx	0x3021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82c8000  ! 330: STB_R	stb	%r28, [%r18 + %r0]
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22dc000  ! 332: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf02ce155  ! 334: STB_I	stb	%r24, [%r19 + 0x0155]
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xf075c000  ! 344: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf13d4000  ! 347: STDF_R	std	%f24, [%r0, %r21]
	.word 0xb1520000  ! 348: RDPR_PIL	<illegal instruction>
	.word 0xb734d000  ! 349: SRLX_R	srlx	%r19, %r0, %r27
	.word 0xf02de035  ! 356: STB_I	stb	%r24, [%r23 + 0x0035]
	.word 0xbd508000  ! 357: RDPR_TSTATE	<illegal instruction>
	.word 0xfb3dc000  ! 358: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfe750000  ! 359: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf834e128  ! 360: STH_I	sth	%r28, [%r19 + 0x0128]
	setx	data_start_6, %g1, %r21
	.word 0xbb7c6401  ! 366: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xbb500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbd641800  ! 371: MOVcc_R	<illegal instruction>
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	.word 0xf03dc000  ! 381: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf82ce083  ! 383: STB_I	stb	%r28, [%r19 + 0x0083]
	.word 0xb0248000  ! 386: SUB_R	sub 	%r18, %r0, %r24
	.word 0xf82c2088  ! 388: STB_I	stb	%r28, [%r16 + 0x0088]
	.word 0xb204a196  ! 389: ADD_I	add 	%r18, 0x0196, %r25
	.word 0xfd3c4000  ! 391: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfd3d8000  ! 395: STDF_R	std	%f30, [%r0, %r22]
	.word 0xb151c000  ! 397: RDPR_TL	<illegal instruction>
	.word 0xf22da02e  ! 399: STB_I	stb	%r25, [%r22 + 0x002e]
	.word 0x8994a039  ! 400: WRPR_TICK_I	wrpr	%r18, 0x0039, %tick
	.word 0xfc240000  ! 404: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xf635c000  ! 405: STH_R	sth	%r27, [%r23 + %r0]
	.word 0x8794a193  ! 406: WRPR_TT_I	wrpr	%r18, 0x0193, %tt
	.word 0xb150c000  ! 414: RDPR_TT	rdpr	%tt, %r24
	.word 0xf8354000  ! 415: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf73d8000  ! 416: STDF_R	std	%f27, [%r0, %r22]
	.word 0xb9518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0x9194e0bf  ! 418: WRPR_PIL_I	wrpr	%r19, 0x00bf, %pil
	.word 0xf67421ed  ! 419: STX_I	stx	%r27, [%r16 + 0x01ed]
	.word 0xf8250000  ! 420: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfc240000  ! 425: STW_R	stw	%r30, [%r16 + %r0]
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 431: STH_R	sth	%r31, [%r19 + %r0]
	setx	data_start_1, %g1, %r19
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3dc000  ! 437: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf82d8000  ! 439: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xb7504000  ! 440: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb92d5000  ! 442: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xbd508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0xf82c4000  ! 447: STB_R	stb	%r28, [%r17 + %r0]
	setx	0x30008, %g1, %o0
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
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0xfc754000  ! 473: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xb2844000  ! 477: ADDcc_R	addcc 	%r17, %r0, %r25
	.word 0xf33d2034  ! 479: STDF_I	std	%f25, [0x0034, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034202c  ! 485: STH_I	sth	%r24, [%r16 + 0x002c]
	.word 0xf2240000  ! 489: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf225c000  ! 493: STW_R	stw	%r25, [%r23 + %r0]
	setx	0x2e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 495: STW_R	stw	%r29, [%r23 + %r0]
	.word 0x8194a092  ! 496: WRPR_TPC_I	wrpr	%r18, 0x0092, %tpc
	.word 0xf8244000  ! 500: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb3500000  ! 502: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb21c20c7  ! 506: XOR_I	xor 	%r16, 0x00c7, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c51  ! 507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0xfe358000  ! 508: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xbf50c000  ! 510: RDPR_TT	rdpr	%tt, %r31
	.word 0xb7520000  ! 511: RDPR_PIL	<illegal instruction>
	.word 0xf8258000  ! 515: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xbea46183  ! 517: SUBcc_I	subcc 	%r17, 0x0183, %r31
	.word 0xb77c0400  ! 519: MOVR_R	movre	%r16, %r0, %r27
	.word 0xfc248000  ! 521: STW_R	stw	%r30, [%r18 + %r0]
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025210e  ! 523: STW_I	stw	%r24, [%r20 + 0x010e]
	.word 0xf33ce101  ! 529: STDF_I	std	%f25, [0x0101, %r19]
	.word 0xfa2c0000  ! 532: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf22de186  ! 533: STB_I	stb	%r25, [%r23 + 0x0186]
	.word 0xf4740000  ! 535: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf434a069  ! 537: STH_I	sth	%r26, [%r18 + 0x0069]
	.word 0xf0346004  ! 540: STH_I	sth	%r24, [%r17 + 0x0004]
	ta	T_CHANGE_HPRIV
	.word 0x81983b83  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b83, %hpstate
	.word 0xfe24e05d  ! 542: STW_I	stw	%r31, [%r19 + 0x005d]
	.word 0xfe246151  ! 543: STW_I	stw	%r31, [%r17 + 0x0151]
	.word 0xbd518000  ! 544: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfe254000  ! 546: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfc2ca102  ! 547: STB_I	stb	%r30, [%r18 + 0x0102]
	setx	0x2012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6140000  ! 551: OR_R	or 	%r16, %r0, %r27
	.word 0x89942189  ! 552: WRPR_TICK_I	wrpr	%r16, 0x0189, %tick
	.word 0xfe3461ad  ! 553: STH_I	sth	%r31, [%r17 + 0x01ad]
	.word 0xf62c2028  ! 555: STB_I	stb	%r27, [%r16 + 0x0028]
	.word 0xb444219d  ! 558: ADDC_I	addc 	%r16, 0x019d, %r26
	.word 0xfb3d0000  ! 559: STDF_R	std	%f29, [%r0, %r20]
	.word 0x899520d0  ! 561: WRPR_TICK_I	wrpr	%r20, 0x00d0, %tick
	.word 0xbcb54000  ! 562: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xfa24215c  ! 566: STW_I	stw	%r29, [%r16 + 0x015c]
	.word 0x87946186  ! 567: WRPR_TT_I	wrpr	%r17, 0x0186, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	.word 0xb885a179  ! 570: ADDcc_I	addcc 	%r22, 0x0179, %r28
	.word 0xfa2d61b8  ! 571: STB_I	stb	%r29, [%r21 + 0x01b8]
	.word 0xbab48000  ! 580: ORNcc_R	orncc 	%r18, %r0, %r29
	.word 0xb7540000  ! 584: RDPR_GL	rdpr	%-, %r27
	.word 0xfa2d0000  ! 586: STB_R	stb	%r29, [%r20 + %r0]
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 589: RDPR_TICK	<illegal instruction>
	.word 0xbd350000  ! 591: SRL_R	srl 	%r20, %r0, %r30
	.word 0xb1540000  ! 594: RDPR_GL	<illegal instruction>
	.word 0xf33dc000  ! 595: STDF_R	std	%f25, [%r0, %r23]
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952187  ! 597: WRPR_PSTATE_I	wrpr	%r20, 0x0187, %pstate
	.word 0xf6750000  ! 599: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf0248000  ! 604: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf2754000  ! 605: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa35a1a1  ! 607: STH_I	sth	%r29, [%r22 + 0x01a1]
	setx	data_start_6, %g1, %r20
	.word 0xfa24c000  ! 610: STW_R	stw	%r29, [%r19 + %r0]
	.word 0x8794a10f  ! 611: WRPR_TT_I	wrpr	%r18, 0x010f, %tt
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 618: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xff3cc000  ! 619: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf074e1bb  ! 624: STX_I	stx	%r24, [%r19 + 0x01bb]
	.word 0xfa2c20e9  ! 629: STB_I	stb	%r29, [%r16 + 0x00e9]
	.word 0xbe0c8000  ! 632: AND_R	and 	%r18, %r0, %r31
	.word 0xb7518000  ! 634: RDPR_PSTATE	<illegal instruction>
	.word 0xf53da1a8  ! 635: STDF_I	std	%f26, [0x01a8, %r22]
	.word 0xf425a1e3  ! 639: STW_I	stw	%r26, [%r22 + 0x01e3]
	.word 0xf63c8000  ! 640: STD_R	std	%r27, [%r18 + %r0]
	.word 0xfc752106  ! 646: STX_I	stx	%r30, [%r20 + 0x0106]
	.word 0xf43c8000  ! 647: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf02da130  ! 657: STB_I	stb	%r24, [%r22 + 0x0130]
	.word 0xf53c21f6  ! 661: STDF_I	std	%f26, [0x01f6, %r16]
	.word 0xf274c000  ! 662: STX_R	stx	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbab5c000  ! 664: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0x8994a07b  ! 665: WRPR_TICK_I	wrpr	%r18, 0x007b, %tick
	.word 0xbcb4e0ef  ! 667: SUBCcc_I	orncc 	%r19, 0x00ef, %r30
	.word 0xf475c000  ! 668: STX_R	stx	%r26, [%r23 + %r0]
	.word 0x8595a1f6  ! 672: WRPR_TSTATE_I	wrpr	%r22, 0x01f6, %tstate
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb93d1000  ! 677: SRAX_R	srax	%r20, %r0, %r28
	setx	data_start_7, %g1, %r23
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e071  ! 682: WRPR_TICK_I	wrpr	%r19, 0x0071, %tick
	.word 0xb0bc4000  ! 684: XNORcc_R	xnorcc 	%r17, %r0, %r24
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 689: RDPR_TT	rdpr	%tt, %r26
	.word 0xfc24a0a6  ! 690: STW_I	stw	%r30, [%r18 + 0x00a6]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3de151  ! 701: STD_I	std	%r29, [%r23 + 0x0151]
	.word 0xf835a02d  ! 702: STH_I	sth	%r28, [%r22 + 0x002d]
	.word 0xf13c8000  ! 704: STDF_R	std	%f24, [%r0, %r18]
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93c0000  ! 710: STDF_R	std	%f28, [%r0, %r16]
	.word 0xbe354000  ! 712: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xff3d0000  ! 715: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf874215e  ! 718: STX_I	stx	%r28, [%r16 + 0x015e]
	.word 0xb9520000  ! 720: RDPR_PIL	<illegal instruction>
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3ce04b  ! 727: STDF_I	std	%f29, [0x004b, %r19]
	.word 0xfe2c6051  ! 728: STB_I	stb	%r31, [%r17 + 0x0051]
	.word 0xfa3c214e  ! 729: STD_I	std	%r29, [%r16 + 0x014e]
	.word 0xb750c000  ! 730: RDPR_TT	<illegal instruction>
	.word 0xf22d8000  ! 734: STB_R	stb	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d59  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d59, %hpstate
	.word 0xfa258000  ! 743: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf235a1f2  ! 746: STH_I	sth	%r25, [%r22 + 0x01f2]
	.word 0xf53ca0f7  ! 748: STDF_I	std	%f26, [0x00f7, %r18]
	.word 0xb4adc000  ! 749: ANDNcc_R	andncc 	%r23, %r0, %r26
	setx	0x1023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 754: RDPR_TL	rdpr	%tl, %r29
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839421ef  ! 767: WRPR_TNPC_I	wrpr	%r16, 0x01ef, %tnpc
	setx	data_start_4, %g1, %r21
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879560e8  ! 771: WRPR_TT_I	wrpr	%r21, 0x00e8, %tt
	.word 0xfe2d0000  ! 777: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfe34c000  ! 785: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	.word 0xb9480000  ! 789: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf434c000  ! 791: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb61ce140  ! 793: XOR_I	xor 	%r19, 0x0140, %r27
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bce181  ! 797: XNORcc_I	xnorcc 	%r19, 0x0181, %r28
	mov	2, %r14
	.word 0xa193a000  ! 798: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c0000  ! 802: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf435c000  ! 805: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xbf518000  ! 806: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf93d61f1  ! 809: STDF_I	std	%f28, [0x01f1, %r21]
	.word 0xfe24e0b1  ! 810: STW_I	stw	%r31, [%r19 + 0x00b1]
	.word 0xf6740000  ! 811: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf62460e2  ! 816: STW_I	stw	%r27, [%r17 + 0x00e2]
	.word 0xf835209e  ! 819: STH_I	sth	%r28, [%r20 + 0x009e]
	.word 0x8395e0c9  ! 823: WRPR_TNPC_I	wrpr	%r23, 0x00c9, %tnpc
	.word 0xf03560a0  ! 824: STH_I	sth	%r24, [%r21 + 0x00a0]
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
	.word 0xfe740000  ! 833: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf0744000  ! 835: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf73d210d  ! 838: STDF_I	std	%f27, [0x010d, %r20]
	.word 0xb9510000  ! 839: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf0748000  ! 840: STX_R	stx	%r24, [%r18 + %r0]
	.word 0x8395a10e  ! 841: WRPR_TNPC_I	wrpr	%r22, 0x010e, %tnpc
	.word 0xf674c000  ! 842: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xbd518000  ! 844: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xba0c2168  ! 846: AND_I	and 	%r16, 0x0168, %r29
	.word 0xb5480000  ! 848: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf4344000  ! 852: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf62de0b2  ! 854: STB_I	stb	%r27, [%r23 + 0x00b2]
	.word 0xf23d6051  ! 856: STD_I	std	%r25, [%r21 + 0x0051]
	.word 0x8794a1ab  ! 857: WRPR_TT_I	wrpr	%r18, 0x01ab, %tt
	.word 0xf62ce12b  ! 859: STB_I	stb	%r27, [%r19 + 0x012b]
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc25a0b6  ! 865: SUB_I	sub 	%r22, 0x00b6, %r30
	.word 0xf075c000  ! 867: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf0752077  ! 868: STX_I	stx	%r24, [%r20 + 0x0077]
	.word 0xb1510000  ! 869: RDPR_TICK	rdpr	%tick, %r24
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8ad20d0  ! 878: ANDNcc_I	andncc 	%r20, 0x00d0, %r28
	.word 0xfe2dc000  ! 879: STB_R	stb	%r31, [%r23 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 882: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa348000  ! 887: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf4358000  ! 890: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfe3cc000  ! 895: STD_R	std	%r31, [%r19 + %r0]
	.word 0xbb34e001  ! 896: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xb3518000  ! 897: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xbf500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xfe3c20c6  ! 907: STD_I	std	%r31, [%r16 + 0x00c6]
	setx	data_start_4, %g1, %r18
	.word 0x8d95e179  ! 912: WRPR_PSTATE_I	wrpr	%r23, 0x0179, %pstate
	.word 0xb4454000  ! 914: ADDC_R	addc 	%r21, %r0, %r26
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4342014  ! 919: STH_I	sth	%r26, [%r16 + 0x0014]
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d4000  ! 927: STB_R	stb	%r29, [%r21 + %r0]
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb335e001  ! 930: SRL_I	srl 	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf625210b  ! 934: STW_I	stw	%r27, [%r20 + 0x010b]
	.word 0xf62d61ac  ! 937: STB_I	stb	%r27, [%r21 + 0x01ac]
	.word 0xfe75e15d  ! 939: STX_I	stx	%r31, [%r23 + 0x015d]
	.word 0xf22d2054  ! 940: STB_I	stb	%r25, [%r20 + 0x0054]
	.word 0xfc250000  ! 944: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb63c4000  ! 949: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xfa75a07a  ! 951: STX_I	stx	%r29, [%r22 + 0x007a]
	.word 0xb43ca168  ! 954: XNOR_I	xnor 	%r18, 0x0168, %r26
	.word 0xb3540000  ! 955: RDPR_GL	rdpr	%-, %r25
	.word 0xb350c000  ! 962: RDPR_TT	<illegal instruction>
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa246084  ! 964: STW_I	stw	%r29, [%r17 + 0x0084]
	.word 0xff3c2030  ! 967: STDF_I	std	%f31, [0x0030, %r16]
	.word 0xb5508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e19c  ! 970: WRPR_PSTATE_I	wrpr	%r23, 0x019c, %pstate
	.word 0xbd500000  ! 973: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf03cc000  ! 975: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf67521fe  ! 976: STX_I	stx	%r27, [%r20 + 0x01fe]
	.word 0xf075e17c  ! 977: STX_I	stx	%r24, [%r23 + 0x017c]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6152009  ! 984: OR_I	or 	%r20, 0x0009, %r27
	mov	0, %r14
	.word 0xa193a000  ! 986: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf63d4000  ! 988: STD_R	std	%r27, [%r21 + %r0]
	.word 0xf0344000  ! 990: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xbf504000  ! 992: RDPR_TNPC	rdpr	%tnpc, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982b91  ! 997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	.word 0xfe25a10a  ! 998: STW_I	stw	%r31, [%r22 + 0x010a]
	.word 0x8595208c  ! 999: WRPR_TSTATE_I	wrpr	%r20, 0x008c, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982ad3  ! 1000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad3, %hpstate
	.word 0xb5518000  ! 1001: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfe2c4000  ! 1004: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb6a50000  ! 1005: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xfa25e065  ! 1010: STW_I	stw	%r29, [%r23 + 0x0065]
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa758000  ! 1014: STX_R	stx	%r29, [%r22 + %r0]
	.word 0x8595a104  ! 1015: WRPR_TSTATE_I	wrpr	%r22, 0x0104, %tstate
	.word 0x89946120  ! 1020: WRPR_TICK_I	wrpr	%r17, 0x0120, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1022: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2850000  ! 1023: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xb2bc4000  ! 1026: XNORcc_R	xnorcc 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6748000  ! 1031: STX_R	stx	%r27, [%r18 + %r0]
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbca4e0f6  ! 1040: SUBcc_I	subcc 	%r19, 0x00f6, %r30
	.word 0xf2748000  ! 1041: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf33dc000  ! 1043: STDF_R	std	%f25, [%r0, %r23]
	.word 0xb3520000  ! 1053: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf93de0f0  ! 1054: STDF_I	std	%f28, [0x00f0, %r23]
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	.word 0x87952176  ! 1057: WRPR_TT_I	wrpr	%r20, 0x0176, %tt
	.word 0xfa24c000  ! 1060: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf82c20c3  ! 1063: STB_I	stb	%r28, [%r16 + 0x00c3]
	ta	T_CHANGE_HPRIV
	.word 0x81982e8b  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	.word 0xf034e09c  ! 1073: STH_I	sth	%r24, [%r19 + 0x009c]
	.word 0xf2754000  ! 1074: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfc24e100  ! 1080: STW_I	stw	%r30, [%r19 + 0x0100]
	.word 0xf2348000  ! 1083: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xbb518000  ! 1084: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf73c4000  ! 1085: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb7508000  ! 1091: RDPR_TSTATE	<illegal instruction>
	.word 0xbb518000  ! 1097: RDPR_PSTATE	<illegal instruction>
	.word 0xff3da1a6  ! 1098: STDF_I	std	%f31, [0x01a6, %r22]
	.word 0xf13de0b2  ! 1099: STDF_I	std	%f24, [0x00b2, %r23]
	.word 0x81942000  ! 1100: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2c604d  ! 1109: STB_I	stb	%r30, [%r17 + 0x004d]
	.word 0x9195e174  ! 1110: WRPR_PIL_I	wrpr	%r23, 0x0174, %pil
	.word 0xb2a4e0f3  ! 1112: SUBcc_I	subcc 	%r19, 0x00f3, %r25
	.word 0xfe3d0000  ! 1119: STD_R	std	%r31, [%r20 + %r0]
	setx	0x1022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 1121: RDPR_TICK	rdpr	%tick, %r24
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d604b  ! 1125: STD_I	std	%r31, [%r21 + 0x004b]
	.word 0xb1540000  ! 1128: RDPR_GL	<illegal instruction>
	.word 0xfc2d2152  ! 1129: STB_I	stb	%r30, [%r20 + 0x0152]
	.word 0xf22ce163  ! 1130: STB_I	stb	%r25, [%r19 + 0x0163]
	.word 0xf4342012  ! 1131: STH_I	sth	%r26, [%r16 + 0x0012]
	.word 0xfc24612d  ! 1135: STW_I	stw	%r30, [%r17 + 0x012d]
	.word 0xb150c000  ! 1137: RDPR_TT	<illegal instruction>
	.word 0xfa2de1c7  ! 1138: STB_I	stb	%r29, [%r23 + 0x01c7]
	.word 0xfe2c0000  ! 1140: STB_R	stb	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 1148: MOVcc_I	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xb351c000  ! 1150: RDPR_TL	rdpr	%tl, %r25
	.word 0xfa24204d  ! 1152: STW_I	stw	%r29, [%r16 + 0x004d]
	.word 0xbd508000  ! 1155: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 1157: RDPR_TT	<illegal instruction>
	.word 0xb8adc000  ! 1159: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xfe256056  ! 1164: STW_I	stw	%r31, [%r21 + 0x0056]
	.word 0xf43561db  ! 1166: STH_I	sth	%r26, [%r21 + 0x01db]
	.word 0xf6244000  ! 1172: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf0348000  ! 1173: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xbb480000  ! 1174: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8594a09a  ! 1177: WRPR_TSTATE_I	wrpr	%r18, 0x009a, %tstate
	.word 0xf82c8000  ! 1179: STB_R	stb	%r28, [%r18 + %r0]
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 1185: RDPR_PSTATE	rdpr	%pstate, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 1190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0xf435c000  ! 1191: STH_R	sth	%r26, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 1195: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc04c000  ! 1196: ADD_R	add 	%r19, %r0, %r30
	.word 0xfb3ce101  ! 1197: STDF_I	std	%f29, [0x0101, %r19]
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32cb001  ! 1199: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0x8594a04a  ! 1201: WRPR_TSTATE_I	wrpr	%r18, 0x004a, %tstate
	.word 0xfc344000  ! 1203: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbd520000  ! 1206: RDPR_PIL	rdpr	%pil, %r30
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899560fb  ! 1213: WRPR_TICK_I	wrpr	%r21, 0x00fb, %tick
	.word 0xbc9c0000  ! 1220: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0x919520e0  ! 1221: WRPR_PIL_I	wrpr	%r20, 0x00e0, %pil
	.word 0xb9520000  ! 1222: RDPR_PIL	rdpr	%pil, %r28
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 1230: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf22d4000  ! 1231: STB_R	stb	%r25, [%r21 + %r0]
	.word 0x8795a18e  ! 1232: WRPR_TT_I	wrpr	%r22, 0x018e, %tt
	.word 0xfe24c000  ! 1233: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe240000  ! 1234: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfa2d200e  ! 1241: STB_I	stb	%r29, [%r20 + 0x000e]
	.word 0xf02ce0d8  ! 1242: STB_I	stb	%r24, [%r19 + 0x00d8]
	setx	data_start_6, %g1, %r22
	.word 0xf43cc000  ! 1244: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb1351000  ! 1245: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xf434c000  ! 1246: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf02d606d  ! 1247: STB_I	stb	%r24, [%r21 + 0x006d]
	.word 0xf63da1e6  ! 1249: STD_I	std	%r27, [%r22 + 0x01e6]
	.word 0xf675a1aa  ! 1250: STX_I	stx	%r27, [%r22 + 0x01aa]
	.word 0xff3de07f  ! 1252: STDF_I	std	%f31, [0x007f, %r23]
	.word 0xb61ca04d  ! 1254: XOR_I	xor 	%r18, 0x004d, %r27
	.word 0xf2254000  ! 1256: STW_R	stw	%r25, [%r21 + %r0]
	.word 0x8995a195  ! 1257: WRPR_TICK_I	wrpr	%r22, 0x0195, %tick
	.word 0xb23ca059  ! 1259: XNOR_I	xnor 	%r18, 0x0059, %r25
	.word 0xb7641800  ! 1260: MOVcc_R	<illegal instruction>
	.word 0x87946065  ! 1268: WRPR_TT_I	wrpr	%r17, 0x0065, %tt
	.word 0xf43c0000  ! 1269: STD_R	std	%r26, [%r16 + %r0]
	.word 0xb1510000  ! 1272: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb951c000  ! 1273: RDPR_TL	<illegal instruction>
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d2137  ! 1277: STD_I	std	%r26, [%r20 + 0x0137]
	.word 0x9194614c  ! 1279: WRPR_PIL_I	wrpr	%r17, 0x014c, %pil
	.word 0xbd508000  ! 1282: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	2, %r12
	.word 0x8f932000  ! 1284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf83d205c  ! 1286: STD_I	std	%r28, [%r20 + 0x005c]
	.word 0xf43d8000  ! 1287: STD_R	std	%r26, [%r22 + %r0]
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 1293: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf82d4000  ! 1294: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf03da0c4  ! 1299: STD_I	std	%r24, [%r22 + 0x00c4]
	.word 0xf53ca066  ! 1302: STDF_I	std	%f26, [0x0066, %r18]
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24e0eb  ! 1304: STW_I	stw	%r29, [%r19 + 0x00eb]
	.word 0xfc2ce039  ! 1305: STB_I	stb	%r30, [%r19 + 0x0039]
	.word 0xb57dc400  ! 1306: MOVR_R	movre	%r23, %r0, %r26
	.word 0xf674a011  ! 1310: STX_I	stx	%r27, [%r18 + 0x0011]
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 1318: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb508000  ! 1319: RDPR_TSTATE	rdpr	%tstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595a0d6  ! 1325: WRPR_TSTATE_I	wrpr	%r22, 0x00d6, %tstate
	.word 0xb00d4000  ! 1330: AND_R	and 	%r21, %r0, %r24
	.word 0x91952014  ! 1332: WRPR_PIL_I	wrpr	%r20, 0x0014, %pil
	.word 0xf8258000  ! 1333: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xbec50000  ! 1334: ADDCcc_R	addccc 	%r20, %r0, %r31
	.word 0xfc2d4000  ! 1339: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf33cc000  ! 1341: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf02c61ce  ! 1344: STB_I	stb	%r24, [%r17 + 0x01ce]
	.word 0xf53c608d  ! 1345: STDF_I	std	%f26, [0x008d, %r17]
	.word 0xfe75e11e  ! 1347: STX_I	stx	%r31, [%r23 + 0x011e]
	mov	2, %r12
	.word 0x8f932000  ! 1350: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2b50000  ! 1352: SUBCcc_R	orncc 	%r20, %r0, %r25
	setx	data_start_4, %g1, %r20
	.word 0xfe74202c  ! 1356: STX_I	stx	%r31, [%r16 + 0x002c]
	.word 0xb1480000  ! 1357: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xba3c0000  ! 1358: XNOR_R	xnor 	%r16, %r0, %r29
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1369: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 1374: STX_R	stx	%r24, [%r17 + %r0]
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a078  ! 1381: WRPR_TPC_I	wrpr	%r18, 0x0078, %tpc
	mov	1, %r14
	.word 0xa193a000  ! 1386: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf4358000  ! 1391: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf835605b  ! 1393: STH_I	sth	%r28, [%r21 + 0x005b]
	.word 0x8795a02f  ! 1394: WRPR_TT_I	wrpr	%r22, 0x002f, %tt
	.word 0xf33da0be  ! 1395: STDF_I	std	%f25, [0x00be, %r22]
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 1403: STX_R	stx	%r28, [%r19 + %r0]
	setx	data_start_7, %g1, %r21
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63d4000  ! 1411: STD_R	std	%r27, [%r21 + %r0]
	.word 0xfe75c000  ! 1413: STX_R	stx	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983b4b  ! 1414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4b, %hpstate
	.word 0xf63de120  ! 1416: STD_I	std	%r27, [%r23 + 0x0120]
	.word 0xfa350000  ! 1418: STH_R	sth	%r29, [%r20 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 1420: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf63dc000  ! 1425: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf22d20c5  ! 1426: STB_I	stb	%r25, [%r20 + 0x00c5]
	.word 0xf2740000  ! 1431: STX_R	stx	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2258000  ! 1433: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xfe354000  ! 1435: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xb1540000  ! 1437: RDPR_GL	rdpr	%-, %r24
	.word 0xbd641800  ! 1440: MOVcc_R	<illegal instruction>
	setx	0x319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabc2115  ! 1442: XNORcc_I	xnorcc 	%r16, 0x0115, %r29
	mov	2, %r12
	.word 0x8f932000  ! 1444: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf13cc000  ! 1447: STDF_R	std	%f24, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xfa244000  ! 1455: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xba35e083  ! 1456: SUBC_I	orn 	%r23, 0x0083, %r29
	.word 0xfa252027  ! 1459: STW_I	stw	%r29, [%r20 + 0x0027]
	setx	0x10302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c2058  ! 1464: STD_I	std	%r25, [%r16 + 0x0058]
	.word 0xf8350000  ! 1465: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfe35202c  ! 1469: STH_I	sth	%r31, [%r20 + 0x002c]
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73c0000  ! 1474: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf2346198  ! 1475: STH_I	sth	%r25, [%r17 + 0x0198]
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 1477: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfe34a153  ! 1481: STH_I	sth	%r31, [%r18 + 0x0153]
	.word 0xf475c000  ! 1483: STX_R	stx	%r26, [%r23 + %r0]
	setx	data_start_6, %g1, %r20
	.word 0xf6740000  ! 1485: STX_R	stx	%r27, [%r16 + %r0]
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa35215e  ! 1488: STH_I	sth	%r29, [%r20 + 0x015e]
	.word 0xf43c8000  ! 1490: STD_R	std	%r26, [%r18 + %r0]
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43da1d4  ! 1495: STD_I	std	%r26, [%r22 + 0x01d4]
	.word 0xfe3cc000  ! 1499: STD_R	std	%r31, [%r19 + %r0]
	.word 0xfb3da05e  ! 1501: STDF_I	std	%f29, [0x005e, %r22]
	.word 0x8595a0b7  ! 1502: WRPR_TSTATE_I	wrpr	%r22, 0x00b7, %tstate
	mov	1, %r14
	.word 0xa193a000  ! 1503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf43de137  ! 1506: STD_I	std	%r26, [%r23 + 0x0137]
	mov	2, %r14
	.word 0xa193a000  ! 1507: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 1508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	.word 0x8194e01f  ! 1511: WRPR_TPC_I	wrpr	%r19, 0x001f, %tpc
	.word 0xb9508000  ! 1513: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xbf2df001  ! 1518: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0x8394e127  ! 1522: WRPR_TNPC_I	wrpr	%r19, 0x0127, %tnpc
	.word 0xb135d000  ! 1526: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xf435c000  ! 1528: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xbd520000  ! 1532: RDPR_PIL	rdpr	%pil, %r30
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b41  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	.word 0xfe3c212b  ! 1539: STD_I	std	%r31, [%r16 + 0x012b]
	.word 0xfe344000  ! 1540: STH_R	sth	%r31, [%r17 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc3c21c2  ! 1547: XNOR_I	xnor 	%r16, 0x01c2, %r30
	.word 0xf42de081  ! 1550: STB_I	stb	%r26, [%r23 + 0x0081]
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e1e4  ! 1557: WRPR_PSTATE_I	wrpr	%r19, 0x01e4, %pstate
	setx	data_start_0, %g1, %r17
	.word 0xb6b5a18f  ! 1565: ORNcc_I	orncc 	%r22, 0x018f, %r27
	.word 0xfe344000  ! 1567: STH_R	sth	%r31, [%r17 + %r0]
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63460a2  ! 1571: STH_I	sth	%r27, [%r17 + 0x00a2]
	.word 0xf434c000  ! 1573: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfc3d8000  ! 1574: STD_R	std	%r30, [%r22 + %r0]
	.word 0x8395e08c  ! 1577: WRPR_TNPC_I	wrpr	%r23, 0x008c, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 1579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 1583: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe2cc000  ! 1586: STB_R	stb	%r31, [%r19 + %r0]
	setx	data_start_2, %g1, %r16
	.word 0xb77c0400  ! 1595: MOVR_R	movre	%r16, %r0, %r27
	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e081  ! 1606: WRPR_PIL_I	wrpr	%r19, 0x0081, %pil
	.word 0xf6344000  ! 1607: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf33c0000  ! 1620: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf02dc000  ! 1624: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf73ca09b  ! 1629: STDF_I	std	%f27, [0x009b, %r18]
	.word 0xb950c000  ! 1630: RDPR_TT	rdpr	%tt, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3c4000  ! 1636: STD_R	std	%r31, [%r17 + %r0]
	.word 0xfb3d60b3  ! 1637: STDF_I	std	%f29, [0x00b3, %r21]
	setx	0x3020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 1641: RDPR_TL	<illegal instruction>
	.word 0xf23d8000  ! 1644: STD_R	std	%r25, [%r22 + %r0]
	.word 0xfa354000  ! 1648: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xbd346001  ! 1649: SRL_I	srl 	%r17, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1650: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfb3de0bf  ! 1651: STDF_I	std	%f29, [0x00bf, %r23]
	.word 0xb1500000  ! 1652: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf82d8000  ! 1655: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf4254000  ! 1656: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfa250000  ! 1657: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb9540000  ! 1661: RDPR_GL	<illegal instruction>
	.word 0xf8258000  ! 1666: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xff3d4000  ! 1668: STDF_R	std	%f31, [%r0, %r21]
	.word 0x81946146  ! 1670: WRPR_TPC_I	wrpr	%r17, 0x0146, %tpc
	.word 0x899420ab  ! 1679: WRPR_TICK_I	wrpr	%r16, 0x00ab, %tick
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 1684: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb1510000  ! 1685: RDPR_TICK	<illegal instruction>
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c6119  ! 1687: STD_I	std	%r25, [%r17 + 0x0119]
	.word 0xfc34c000  ! 1688: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfb3c8000  ! 1689: STDF_R	std	%f29, [%r0, %r18]
	.word 0xb3504000  ! 1690: RDPR_TNPC	<illegal instruction>
	.word 0xfa2da153  ! 1692: STB_I	stb	%r29, [%r22 + 0x0153]
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93c4000  ! 1696: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf73c8000  ! 1701: STDF_R	std	%f27, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0xf93d0000  ! 1703: STDF_R	std	%f28, [%r0, %r20]
	.word 0xbc242062  ! 1704: SUB_I	sub 	%r16, 0x0062, %r30
	.word 0xb351c000  ! 1705: RDPR_TL	rdpr	%tl, %r25
	.word 0xb42dc000  ! 1706: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xf435a0a0  ! 1707: STH_I	sth	%r26, [%r22 + 0x00a0]
	.word 0xb5510000  ! 1709: RDPR_TICK	<illegal instruction>
	.word 0xf33c4000  ! 1712: STDF_R	std	%f25, [%r0, %r17]
	.word 0xfa74e0a7  ! 1716: STX_I	stx	%r29, [%r19 + 0x00a7]
	.word 0xf23d2051  ! 1717: STD_I	std	%r25, [%r20 + 0x0051]
	.word 0xb77ce401  ! 1718: MOVR_I	movre	%r19, 0x1, %r27
	.word 0xfc74c000  ! 1719: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfc25c000  ! 1722: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfa340000  ! 1726: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb7518000  ! 1727: RDPR_PSTATE	<illegal instruction>
	.word 0xba1d6141  ! 1729: XOR_I	xor 	%r21, 0x0141, %r29
	.word 0xf47461ea  ! 1735: STX_I	stx	%r26, [%r17 + 0x01ea]
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 1738: MOVcc_R	<illegal instruction>
	.word 0xb7480000  ! 1739: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf353001  ! 1740: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xfa2520d3  ! 1742: STW_I	stw	%r29, [%r20 + 0x00d3]
	.word 0x8d94a128  ! 1744: WRPR_PSTATE_I	wrpr	%r18, 0x0128, %pstate
	.word 0xb17c4400  ! 1745: MOVR_R	movre	%r17, %r0, %r24
	.word 0xb134f001  ! 1747: SRLX_I	srlx	%r19, 0x0001, %r24
	.word 0xf93c0000  ! 1748: STDF_R	std	%f28, [%r0, %r16]
	.word 0xb6c56195  ! 1751: ADDCcc_I	addccc 	%r21, 0x0195, %r27
	.word 0xb1504000  ! 1754: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfc3521c7  ! 1755: STH_I	sth	%r30, [%r20 + 0x01c7]
	.word 0xf62461d2  ! 1758: STW_I	stw	%r27, [%r17 + 0x01d2]
	.word 0xfc74c000  ! 1759: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf2254000  ! 1760: STW_R	stw	%r25, [%r21 + %r0]
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca1c3  ! 1762: STB_I	stb	%r31, [%r18 + 0x01c3]
	.word 0xf875c000  ! 1763: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbcc4c000  ! 1766: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xfe354000  ! 1770: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xfe258000  ! 1771: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf6244000  ! 1772: STW_R	stw	%r27, [%r17 + %r0]
	setx	data_start_0, %g1, %r23
	.word 0xf23520f6  ! 1780: STH_I	sth	%r25, [%r20 + 0x00f6]
	setx	0x10302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 1785: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf425c000  ! 1786: STW_R	stw	%r26, [%r23 + %r0]
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 1789: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf8246195  ! 1792: STW_I	stw	%r28, [%r17 + 0x0195]
	.word 0x899520e2  ! 1795: WRPR_TICK_I	wrpr	%r20, 0x00e2, %tick
	.word 0xfc3d2140  ! 1796: STD_I	std	%r30, [%r20 + 0x0140]
	.word 0xf42561de  ! 1798: STW_I	stw	%r26, [%r21 + 0x01de]
	.word 0xb13d9000  ! 1799: SRAX_R	srax	%r22, %r0, %r24
	.word 0x8595a13b  ! 1800: WRPR_TSTATE_I	wrpr	%r22, 0x013b, %tstate
	.word 0xf234a057  ! 1802: STH_I	sth	%r25, [%r18 + 0x0057]
	.word 0xf4348000  ! 1807: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb751c000  ! 1808: RDPR_TL	rdpr	%tl, %r27
	.word 0xfe3d0000  ! 1809: STD_R	std	%r31, [%r20 + %r0]
	.word 0xb92c5000  ! 1811: SLLX_R	sllx	%r17, %r0, %r28
	.word 0xf73c4000  ! 1815: STDF_R	std	%f27, [%r0, %r17]
	.word 0xfe2da01d  ! 1816: STB_I	stb	%r31, [%r22 + 0x001d]
	.word 0xf82c60f5  ! 1817: STB_I	stb	%r28, [%r17 + 0x00f5]
	.word 0xfa74e124  ! 1820: STX_I	stx	%r29, [%r19 + 0x0124]
	.word 0xfa24a18c  ! 1821: STW_I	stw	%r29, [%r18 + 0x018c]
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d0000  ! 1826: STD_R	std	%r28, [%r20 + %r0]
	.word 0x8195a182  ! 1828: WRPR_TPC_I	wrpr	%r22, 0x0182, %tpc
	.word 0xf224e067  ! 1833: STW_I	stw	%r25, [%r19 + 0x0067]
	.word 0xf33d4000  ! 1834: STDF_R	std	%f25, [%r0, %r21]
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 1837: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xbb480000  ! 1838: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf035c000  ! 1841: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xfc2ce134  ! 1843: STB_I	stb	%r30, [%r19 + 0x0134]
	.word 0xbb540000  ! 1844: RDPR_GL	<illegal instruction>
	.word 0xb2358000  ! 1846: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xf03c2162  ! 1848: STD_I	std	%r24, [%r16 + 0x0162]
	.word 0xbc8ca195  ! 1852: ANDcc_I	andcc 	%r18, 0x0195, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1856: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe2de155  ! 1857: STB_I	stb	%r31, [%r23 + 0x0155]
	.word 0xf425a087  ! 1861: STW_I	stw	%r26, [%r22 + 0x0087]
	.word 0xb434e1ac  ! 1863: ORN_I	orn 	%r19, 0x01ac, %r26
	.word 0xfb3d20a8  ! 1864: STDF_I	std	%f29, [0x00a8, %r20]
	.word 0xf275600d  ! 1868: STX_I	stx	%r25, [%r21 + 0x000d]
	.word 0x8795a0c2  ! 1869: WRPR_TT_I	wrpr	%r22, 0x00c2, %tt
	.word 0x8395a06e  ! 1871: WRPR_TNPC_I	wrpr	%r22, 0x006e, %tnpc
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa356005  ! 1880: STH_I	sth	%r29, [%r21 + 0x0005]
	.word 0xbd351000  ! 1884: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xf4250000  ! 1890: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xb9504000  ! 1891: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf93c2144  ! 1892: STDF_I	std	%f28, [0x0144, %r16]
	.word 0xfa754000  ! 1894: STX_R	stx	%r29, [%r21 + %r0]
	setx	0x33d, %g1, %o0
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
	.word 0xf67461d0  ! 1900: STX_I	stx	%r27, [%r17 + 0x01d0]
	.word 0xb4c50000  ! 1904: ADDCcc_R	addccc 	%r20, %r0, %r26
	.word 0xfb3de155  ! 1907: STDF_I	std	%f29, [0x0155, %r23]
	.word 0xf83561e2  ! 1908: STH_I	sth	%r28, [%r21 + 0x01e2]
	.word 0xfc34e0ce  ! 1909: STH_I	sth	%r30, [%r19 + 0x00ce]
	.word 0xbc15e11d  ! 1910: OR_I	or 	%r23, 0x011d, %r30
	.word 0xf025c000  ! 1912: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb22de0db  ! 1914: ANDN_I	andn 	%r23, 0x00db, %r25
	.word 0xf434c000  ! 1919: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfa2d6037  ! 1921: STB_I	stb	%r29, [%r21 + 0x0037]
	.word 0xf13d4000  ! 1922: STDF_R	std	%f24, [%r0, %r21]
	.word 0xfa2d0000  ! 1923: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbd357001  ! 1924: SRLX_I	srlx	%r21, 0x0001, %r30
	.word 0xfa74c000  ! 1927: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfa348000  ! 1930: STH_R	sth	%r29, [%r18 + %r0]
	.word 0x8995e1a6  ! 1932: WRPR_TICK_I	wrpr	%r23, 0x01a6, %tick
	.word 0xb3500000  ! 1933: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbc858000  ! 1934: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xfc756194  ! 1938: STX_I	stx	%r30, [%r21 + 0x0194]
	.word 0x919420ea  ! 1941: WRPR_PIL_I	wrpr	%r16, 0x00ea, %pil
	.word 0x87956144  ! 1944: WRPR_TT_I	wrpr	%r21, 0x0144, %tt
	.word 0xfe25e1d8  ! 1945: STW_I	stw	%r31, [%r23 + 0x01d8]
	.word 0xf62d8000  ! 1947: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfa34612c  ! 1951: STH_I	sth	%r29, [%r17 + 0x012c]
	setx	data_start_0, %g1, %r17
	.word 0xb7480000  ! 1953: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x879560b1  ! 1954: WRPR_TT_I	wrpr	%r21, 0x00b1, %tt
	.word 0xf2354000  ! 1956: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xb9504000  ! 1957: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfb3c0000  ! 1961: STDF_R	std	%f29, [%r0, %r16]
	.word 0xb48c4000  ! 1964: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xb150c000  ! 1966: RDPR_TT	rdpr	%tt, %r24
	.word 0xf224a0b0  ! 1973: STW_I	stw	%r25, [%r18 + 0x00b0]
	.word 0xf02d6076  ! 1975: STB_I	stb	%r24, [%r21 + 0x0076]
	.word 0xf93ca112  ! 1978: STDF_I	std	%f28, [0x0112, %r18]
	.word 0xf0354000  ! 1979: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfa2d4000  ! 1980: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xb151c000  ! 1981: RDPR_TL	<illegal instruction>
	.word 0xb0b46026  ! 1982: SUBCcc_I	orncc 	%r17, 0x0026, %r24
	.word 0xb03c4000  ! 1986: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xf2244000  ! 1988: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xb2ad4000  ! 1991: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xf62c4000  ! 1995: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf23cc000  ! 1996: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf62d4000  ! 1998: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf62c2016  ! 1999: STB_I	stb	%r27, [%r16 + 0x0016]
	.word 0xf23c4000  ! 2000: STD_R	std	%r25, [%r17 + %r0]
	.word 0xb3540000  ! 2003: RDPR_GL	<illegal instruction>
	.word 0xf624c000  ! 2004: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xbd500000  ! 2005: RDPR_TPC	<illegal instruction>
	.word 0xfd3d0000  ! 2006: STDF_R	std	%f30, [%r0, %r20]
	.word 0xfc2d8000  ! 2008: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf23520c7  ! 2011: STH_I	sth	%r25, [%r20 + 0x00c7]
	.word 0x87946000  ! 2012: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xf024c000  ! 2016: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf03ce177  ! 2022: STD_I	std	%r24, [%r19 + 0x0177]
	.word 0xf4352136  ! 2025: STH_I	sth	%r26, [%r20 + 0x0136]
	.word 0xf834e13a  ! 2028: STH_I	sth	%r28, [%r19 + 0x013a]
	.word 0xf22c60e5  ! 2031: STB_I	stb	%r25, [%r17 + 0x00e5]
	setx	0x3000b, %g1, %o0
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
	.word 0xbf518000  ! 2035: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf62de0bc  ! 2037: STB_I	stb	%r27, [%r23 + 0x00bc]
	.word 0xf63d8000  ! 2042: STD_R	std	%r27, [%r22 + %r0]
	.word 0x8394a07f  ! 2043: WRPR_TNPC_I	wrpr	%r18, 0x007f, %tnpc
	.word 0xb3480000  ! 2045: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa348000  ! 2046: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfc2c617b  ! 2049: STB_I	stb	%r30, [%r17 + 0x017b]
	.word 0xb550c000  ! 2050: RDPR_TT	<illegal instruction>
	.word 0xf22d4000  ! 2053: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xfd3de16e  ! 2054: STDF_I	std	%f30, [0x016e, %r23]
	.word 0xfa3cc000  ! 2055: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf13d603e  ! 2056: STDF_I	std	%f24, [0x003e, %r21]
	.word 0xb33d7001  ! 2057: SRAX_I	srax	%r21, 0x0001, %r25
	.word 0xf02de0ef  ! 2058: STB_I	stb	%r24, [%r23 + 0x00ef]
	.word 0xf23d6112  ! 2062: STD_I	std	%r25, [%r21 + 0x0112]
	.word 0xf43d0000  ! 2064: STD_R	std	%r26, [%r20 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 2065: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc742117  ! 2066: STX_I	stx	%r30, [%r16 + 0x0117]
	.word 0xb2ada153  ! 2068: ANDNcc_I	andncc 	%r22, 0x0153, %r25
	.word 0xbf510000  ! 2070: RDPR_TICK	rdpr	%tick, %r31
	.word 0xba058000  ! 2072: ADD_R	add 	%r22, %r0, %r29
	.word 0xb9500000  ! 2075: RDPR_TPC	<illegal instruction>
	.word 0xf2358000  ! 2079: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfa344000  ! 2080: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb2258000  ! 2085: SUB_R	sub 	%r22, %r0, %r25
	mov	1, %r14
	.word 0xa193a000  ! 2086: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb28d0000  ! 2091: ANDcc_R	andcc 	%r20, %r0, %r25
	.word 0x8194a1a1  ! 2094: WRPR_TPC_I	wrpr	%r18, 0x01a1, %tpc
	.word 0x8595a13c  ! 2099: WRPR_TSTATE_I	wrpr	%r22, 0x013c, %tstate
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3cc000  ! 2104: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbb518000  ! 2107: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xb1518000  ! 2111: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r23
	.word 0xf67520b2  ! 2118: STX_I	stx	%r27, [%r20 + 0x00b2]
	.word 0xf074e063  ! 2120: STX_I	stx	%r24, [%r19 + 0x0063]
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a1c1  ! 2124: WRPR_PIL_I	wrpr	%r18, 0x01c1, %pil
	.word 0xf225c000  ! 2129: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xbb51c000  ! 2133: RDPR_TL	rdpr	%tl, %r29
	.word 0xf82d8000  ! 2136: STB_R	stb	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f99  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f99, %hpstate
	.word 0xf0350000  ! 2139: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xbb540000  ! 2140: RDPR_GL	rdpr	%-, %r29
	.word 0xfe3d0000  ! 2141: STD_R	std	%r31, [%r20 + %r0]
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13dc000  ! 2143: STDF_R	std	%f24, [%r0, %r23]
	.word 0xfb3cc000  ! 2149: STDF_R	std	%f29, [%r0, %r19]
	mov	2, %r12
	.word 0x8f932000  ! 2151: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf63dc000  ! 2157: STD_R	std	%r27, [%r23 + %r0]
	.word 0xbb500000  ! 2163: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb4b461ff  ! 2166: ORNcc_I	orncc 	%r17, 0x01ff, %r26
	.word 0x8195217f  ! 2168: WRPR_TPC_I	wrpr	%r20, 0x017f, %tpc
	.word 0xbe244000  ! 2172: SUB_R	sub 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 2175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xbab5a09e  ! 2176: ORNcc_I	orncc 	%r22, 0x009e, %r29
	.word 0xf835e08f  ! 2180: STH_I	sth	%r28, [%r23 + 0x008f]
	.word 0xf624e0b8  ! 2181: STW_I	stw	%r27, [%r19 + 0x00b8]
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e0ee  ! 2183: WRPR_TPC_I	wrpr	%r23, 0x00ee, %tpc
	.word 0x8195618f  ! 2184: WRPR_TPC_I	wrpr	%r21, 0x018f, %tpc
	.word 0xfc75e1f4  ! 2185: STX_I	stx	%r30, [%r23 + 0x01f4]
	.word 0xb5518000  ! 2190: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf074e0b6  ! 2191: STX_I	stx	%r24, [%r19 + 0x00b6]
	.word 0xfa752179  ! 2192: STX_I	stx	%r29, [%r20 + 0x0179]
	.word 0xf23d4000  ! 2194: STD_R	std	%r25, [%r21 + %r0]
	.word 0xfd3ce0ee  ! 2197: STDF_I	std	%f30, [0x00ee, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81982d83  ! 2198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0xf22ce0be  ! 2201: STB_I	stb	%r25, [%r19 + 0x00be]
	.word 0xf075207a  ! 2205: STX_I	stx	%r24, [%r20 + 0x007a]
	.word 0xb9480000  ! 2212: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb2c5e11f  ! 2214: ADDCcc_I	addccc 	%r23, 0x011f, %r25
	.word 0xfe2c8000  ! 2215: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf82de165  ! 2219: STB_I	stb	%r28, [%r23 + 0x0165]
	.word 0xf834e086  ! 2220: STH_I	sth	%r28, [%r19 + 0x0086]
	.word 0xfa2d2017  ! 2227: STB_I	stb	%r29, [%r20 + 0x0017]
	.word 0xfc25a1d9  ! 2228: STW_I	stw	%r30, [%r22 + 0x01d9]
	.word 0xb751c000  ! 2229: RDPR_TL	<illegal instruction>
	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 2233: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb92d8000  ! 2236: SLL_R	sll 	%r22, %r0, %r28
	.word 0xb3504000  ! 2247: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfe3460a7  ! 2248: STH_I	sth	%r31, [%r17 + 0x00a7]
	mov	1, %r12
	.word 0x8f932000  ! 2251: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8794e01b  ! 2257: WRPR_TT_I	wrpr	%r19, 0x001b, %tt
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb485a198  ! 2260: ADDcc_I	addcc 	%r22, 0x0198, %r26
	.word 0xbf518000  ! 2261: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 2268: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf33cc000  ! 2270: STDF_R	std	%f25, [%r0, %r19]
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c0000  ! 2280: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfd3d4000  ! 2283: STDF_R	std	%f30, [%r0, %r21]
	.word 0xfa3dc000  ! 2284: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfc2d20b1  ! 2285: STB_I	stb	%r30, [%r20 + 0x00b1]
	.word 0xf074e057  ! 2288: STX_I	stx	%r24, [%r19 + 0x0057]
	.word 0xf025e104  ! 2289: STW_I	stw	%r24, [%r23 + 0x0104]
	.word 0xb17c4400  ! 2290: MOVR_R	movre	%r17, %r0, %r24
	.word 0x8795201e  ! 2291: WRPR_TT_I	wrpr	%r20, 0x001e, %tt
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 2297: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf824206c  ! 2298: STW_I	stw	%r28, [%r16 + 0x006c]
	.word 0xf33d8000  ! 2303: STDF_R	std	%f25, [%r0, %r22]
	.word 0xf675e1d3  ! 2305: STX_I	stx	%r27, [%r23 + 0x01d3]
	.word 0x8d94e0e8  ! 2307: WRPR_PSTATE_I	wrpr	%r19, 0x00e8, %pstate
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb81d8000  ! 2311: XOR_R	xor 	%r22, %r0, %r28
	.word 0xb950c000  ! 2312: RDPR_TT	rdpr	%tt, %r28
	.word 0xb0bc0000  ! 2313: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xba344000  ! 2315: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xf33ce18a  ! 2318: STDF_I	std	%f25, [0x018a, %r19]
	.word 0xf83ce177  ! 2319: STD_I	std	%r28, [%r19 + 0x0177]
	.word 0xf93c612e  ! 2322: STDF_I	std	%f28, [0x012e, %r17]
	.word 0xfa35619b  ! 2323: STH_I	sth	%r29, [%r21 + 0x019b]
	.word 0x8995a047  ! 2327: WRPR_TICK_I	wrpr	%r22, 0x0047, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982d41  ! 2330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d41, %hpstate
	.word 0xf474e0ad  ! 2331: STX_I	stx	%r26, [%r19 + 0x00ad]
	.word 0xbc1c0000  ! 2333: XOR_R	xor 	%r16, %r0, %r30
	.word 0xb40c2182  ! 2336: AND_I	and 	%r16, 0x0182, %r26
	.word 0xfe740000  ! 2337: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xb415e0a2  ! 2341: OR_I	or 	%r23, 0x00a2, %r26
	.word 0xfe25e006  ! 2345: STW_I	stw	%r31, [%r23 + 0x0006]
	.word 0xbf504000  ! 2346: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb4340000  ! 2349: SUBC_R	orn 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 2358: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf4358000  ! 2359: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf53d8000  ! 2360: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfc746029  ! 2361: STX_I	stx	%r30, [%r17 + 0x0029]
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xfc2c0000  ! 2364: STB_R	stb	%r30, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 2371: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xfe2ce177  ! 2372: STB_I	stb	%r31, [%r19 + 0x0177]
	.word 0xb7540000  ! 2376: RDPR_GL	<illegal instruction>
	.word 0xf62ca10c  ! 2377: STB_I	stb	%r27, [%r18 + 0x010c]
	.word 0x9195e0ef  ! 2378: WRPR_PIL_I	wrpr	%r23, 0x00ef, %pil
	.word 0xbf518000  ! 2383: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43c8000  ! 2386: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf674a1fe  ! 2387: STX_I	stx	%r27, [%r18 + 0x01fe]
	.word 0xf13c0000  ! 2389: STDF_R	std	%f24, [%r0, %r16]
	.word 0xba158000  ! 2390: OR_R	or 	%r22, %r0, %r29
	.word 0xff3da136  ! 2392: STDF_I	std	%f31, [0x0136, %r22]
	.word 0xb88420eb  ! 2393: ADDcc_I	addcc 	%r16, 0x00eb, %r28
	.word 0xf274a1d6  ! 2395: STX_I	stx	%r25, [%r18 + 0x01d6]
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83c208f  ! 2405: STD_I	std	%r28, [%r16 + 0x008f]
	.word 0xb151c000  ! 2410: RDPR_TL	rdpr	%tl, %r24
	.word 0xb0c58000  ! 2413: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xf0246004  ! 2415: STW_I	stw	%r24, [%r17 + 0x0004]
	.word 0x83952064  ! 2420: WRPR_TNPC_I	wrpr	%r20, 0x0064, %tnpc
	.word 0xf43ca18a  ! 2421: STD_I	std	%r26, [%r18 + 0x018a]
	.word 0xf43d0000  ! 2423: STD_R	std	%r26, [%r20 + %r0]
	.word 0xfc25619b  ! 2424: STW_I	stw	%r30, [%r21 + 0x019b]
	.word 0xf53cc000  ! 2425: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf53c4000  ! 2430: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf835a12a  ! 2432: STH_I	sth	%r28, [%r22 + 0x012a]
	.word 0xb9510000  ! 2433: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe3c0000  ! 2434: STD_R	std	%r31, [%r16 + %r0]
	.word 0x9194e016  ! 2435: WRPR_PIL_I	wrpr	%r19, 0x0016, %pil
	.word 0xfc2da1c4  ! 2437: STB_I	stb	%r30, [%r22 + 0x01c4]
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 2439: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbd50c000  ! 2445: RDPR_TT	rdpr	%tt, %r30
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52c2001  ! 2450: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb7504000  ! 2451: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ad1  ! 2452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad1, %hpstate
	.word 0xbcc50000  ! 2454: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xf53c609d  ! 2458: STDF_I	std	%f26, [0x009d, %r17]
	.word 0x8394e085  ! 2460: WRPR_TNPC_I	wrpr	%r19, 0x0085, %tnpc
	.word 0xb9508000  ! 2462: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf93de01f  ! 2464: STDF_I	std	%f28, [0x001f, %r23]
	.word 0xf035a06d  ! 2466: STH_I	sth	%r24, [%r22 + 0x006d]
	.word 0x8d95a01c  ! 2469: WRPR_PSTATE_I	wrpr	%r22, 0x001c, %pstate
	.word 0xf8740000  ! 2478: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xb225c000  ! 2479: SUB_R	sub 	%r23, %r0, %r25
	.word 0xfe358000  ! 2481: STH_R	sth	%r31, [%r22 + %r0]
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795a1c9  ! 2484: WRPR_TT_I	wrpr	%r22, 0x01c9, %tt
	.word 0xf33d0000  ! 2486: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf42461e3  ! 2489: STW_I	stw	%r26, [%r17 + 0x01e3]
	.word 0xf73cc000  ! 2490: STDF_R	std	%f27, [%r0, %r19]
	.word 0xbf510000  ! 2492: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf93ce049  ! 2493: STDF_I	std	%f28, [0x0049, %r19]
	.word 0xf02d0000  ! 2494: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb351c000  ! 2495: RDPR_TL	<illegal instruction>
	.word 0xf63ca125  ! 2496: STD_I	std	%r27, [%r18 + 0x0125]
	.word 0xfa744000  ! 2504: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf075a069  ! 2505: STX_I	stx	%r24, [%r22 + 0x0069]
	.word 0xbd2cd000  ! 2510: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xba15c000  ! 2520: OR_R	or 	%r23, %r0, %r29
	.word 0xb33dd000  ! 2521: SRAX_R	srax	%r23, %r0, %r25
	.word 0xf93ca154  ! 2524: STDF_I	std	%f28, [0x0154, %r18]
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf475e061  ! 2528: STX_I	stx	%r26, [%r23 + 0x0061]
	.word 0xb8040000  ! 2529: ADD_R	add 	%r16, %r0, %r28
	.word 0xfe75e162  ! 2532: STX_I	stx	%r31, [%r23 + 0x0162]
	.word 0xb9353001  ! 2535: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xf02c8000  ! 2536: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfe2ca002  ! 2537: STB_I	stb	%r31, [%r18 + 0x0002]
	.word 0xf0340000  ! 2540: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf0354000  ! 2542: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xb80520f2  ! 2544: ADD_I	add 	%r20, 0x00f2, %r28
	.word 0xf02de026  ! 2547: STB_I	stb	%r24, [%r23 + 0x0026]
	.word 0xb751c000  ! 2551: RDPR_TL	<illegal instruction>
	.word 0xf834c000  ! 2553: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf8748000  ! 2554: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf62c61d3  ! 2556: STB_I	stb	%r27, [%r17 + 0x01d3]
	.word 0xfa3d8000  ! 2557: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf2346156  ! 2560: STH_I	sth	%r25, [%r17 + 0x0156]
	.word 0xfe24e09f  ! 2561: STW_I	stw	%r31, [%r19 + 0x009f]
	.word 0xff3de00e  ! 2562: STDF_I	std	%f31, [0x000e, %r23]
	.word 0xf8258000  ! 2564: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfb3ce08c  ! 2565: STDF_I	std	%f29, [0x008c, %r19]
	.word 0xfa754000  ! 2569: STX_R	stx	%r29, [%r21 + %r0]
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe7560e3  ! 2573: STX_I	stx	%r31, [%r21 + 0x00e3]
	.word 0xb3518000  ! 2576: RDPR_PSTATE	<illegal instruction>
	.word 0xf73d2049  ! 2577: STDF_I	std	%f27, [0x0049, %r20]
	.word 0xfc25e0c0  ! 2581: STW_I	stw	%r30, [%r23 + 0x00c0]
	.word 0xfc250000  ! 2583: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb12d8000  ! 2584: SLL_R	sll 	%r22, %r0, %r24
	.word 0xfb3c0000  ! 2586: STDF_R	std	%f29, [%r0, %r16]
	.word 0xfa3d0000  ! 2588: STD_R	std	%r29, [%r20 + %r0]
	.word 0xfc2460e1  ! 2589: STW_I	stw	%r30, [%r17 + 0x00e1]
	.word 0xf67420f4  ! 2590: STX_I	stx	%r27, [%r16 + 0x00f4]
	.word 0xfa25c000  ! 2592: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xb3508000  ! 2593: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5508000  ! 2598: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	data_start_7, %g1, %r21
	.word 0xf42dc000  ! 2611: STB_R	stb	%r26, [%r23 + %r0]
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33da1b3  ! 2618: STDF_I	std	%f25, [0x01b3, %r22]
	mov	0, %r14
	.word 0xa193a000  ! 2621: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf83c0000  ! 2622: STD_R	std	%r28, [%r16 + %r0]
	.word 0x919420fc  ! 2625: WRPR_PIL_I	wrpr	%r16, 0x00fc, %pil
	.word 0xb034e184  ! 2632: ORN_I	orn 	%r19, 0x0184, %r24
	.word 0xf424e196  ! 2635: STW_I	stw	%r26, [%r19 + 0x0196]
	.word 0xfc244000  ! 2636: STW_R	stw	%r30, [%r17 + %r0]
	.word 0x8995208f  ! 2637: WRPR_TICK_I	wrpr	%r20, 0x008f, %tick
	.word 0xf874c000  ! 2639: STX_R	stx	%r28, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e06e  ! 2647: WRPR_TT_I	wrpr	%r19, 0x006e, %tt
	.word 0xbf35d000  ! 2648: SRLX_R	srlx	%r23, %r0, %r31
	.word 0xfb3d6046  ! 2654: STDF_I	std	%f29, [0x0046, %r21]
	.word 0xfa3dc000  ! 2656: STD_R	std	%r29, [%r23 + %r0]
	.word 0xff3d607b  ! 2657: STDF_I	std	%f31, [0x007b, %r21]
	.word 0x859560c3  ! 2658: WRPR_TSTATE_I	wrpr	%r21, 0x00c3, %tstate
	.word 0xf53d0000  ! 2660: STDF_R	std	%f26, [%r0, %r20]
	.word 0xb6944000  ! 2666: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xf13d219e  ! 2671: STDF_I	std	%f24, [0x019e, %r20]
	setx	0x3031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6b4e1ff  ! 2674: ORNcc_I	orncc 	%r19, 0x01ff, %r27
	.word 0xf674c000  ! 2675: STX_R	stx	%r27, [%r19 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xb5540000  ! 2677: RDPR_GL	rdpr	%-, %r26
	.word 0x8995e175  ! 2681: WRPR_TICK_I	wrpr	%r23, 0x0175, %tick
	.word 0xf33d61a4  ! 2682: STDF_I	std	%f25, [0x01a4, %r21]
	.word 0xfe2ce144  ! 2684: STB_I	stb	%r31, [%r19 + 0x0144]
	.word 0xf33cc000  ! 2687: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf43dc000  ! 2692: STD_R	std	%r26, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 2694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa740000  ! 2695: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf93dc000  ! 2696: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf63ce1d3  ! 2698: STD_I	std	%r27, [%r19 + 0x01d3]
	.word 0xf4350000  ! 2699: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xbb510000  ! 2702: RDPR_TICK	rdpr	%tick, %r29
	setx	0x2031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 2707: RDPR_PIL	<illegal instruction>
	.word 0xfe342159  ! 2708: STH_I	sth	%r31, [%r16 + 0x0159]
	.word 0xbac460b3  ! 2714: ADDCcc_I	addccc 	%r17, 0x00b3, %r29
	.word 0xf22d8000  ! 2715: STB_R	stb	%r25, [%r22 + %r0]
	.word 0x839520fb  ! 2717: WRPR_TNPC_I	wrpr	%r20, 0x00fb, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x819829d9  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0xfc34a0b4  ! 2722: STH_I	sth	%r30, [%r18 + 0x00b4]
	.word 0xfa744000  ! 2725: STX_R	stx	%r29, [%r17 + %r0]
	setx	data_start_1, %g1, %r19
	.word 0xf4250000  ! 2731: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfe35a0b7  ! 2735: STH_I	sth	%r31, [%r22 + 0x00b7]
	setx	data_start_3, %g1, %r19
	.word 0xf834c000  ! 2743: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xbe944000  ! 2747: ORcc_R	orcc 	%r17, %r0, %r31
	setx	data_start_2, %g1, %r17
	.word 0xf22c614b  ! 2755: STB_I	stb	%r25, [%r17 + 0x014b]
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88d0000  ! 2762: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xfe25a1fb  ! 2764: STW_I	stw	%r31, [%r22 + 0x01fb]
	.word 0xbb51c000  ! 2765: RDPR_TL	rdpr	%tl, %r29
	.word 0xb895202e  ! 2766: ORcc_I	orcc 	%r20, 0x002e, %r28
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xfa2d4000  ! 2770: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xfe25619d  ! 2771: STW_I	stw	%r31, [%r21 + 0x019d]
	.word 0xbe1c204d  ! 2773: XOR_I	xor 	%r16, 0x004d, %r31
	.word 0xfa244000  ! 2774: STW_R	stw	%r29, [%r17 + %r0]
	.word 0x89952083  ! 2775: WRPR_TICK_I	wrpr	%r20, 0x0083, %tick
	.word 0xf23c204f  ! 2777: STD_I	std	%r25, [%r16 + 0x004f]
	.word 0xfe7560ba  ! 2779: STX_I	stx	%r31, [%r21 + 0x00ba]
	ta	T_CHANGE_HPRIV
	.word 0x81982ac9  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0xb22d6026  ! 2781: ANDN_I	andn 	%r21, 0x0026, %r25
	.word 0xb7355000  ! 2787: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xbf3c6001  ! 2790: SRA_I	sra 	%r17, 0x0001, %r31
	.word 0x9194a0c4  ! 2792: WRPR_PIL_I	wrpr	%r18, 0x00c4, %pil
	.word 0xf23ce012  ! 2797: STD_I	std	%r25, [%r19 + 0x0012]
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c2166  ! 2805: STD_I	std	%r25, [%r16 + 0x0166]
	.word 0xb950c000  ! 2806: RDPR_TT	rdpr	%tt, %r28
	setx	0x20108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69dc000  ! 2811: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xf835c000  ! 2815: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xbb520000  ! 2818: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r23
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 2835: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf425a146  ! 2837: STW_I	stw	%r26, [%r22 + 0x0146]
	.word 0xf824a097  ! 2841: STW_I	stw	%r28, [%r18 + 0x0097]
	.word 0xfe74c000  ! 2842: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfe75e189  ! 2845: STX_I	stx	%r31, [%r23 + 0x0189]
	.word 0xb02520f8  ! 2847: SUB_I	sub 	%r20, 0x00f8, %r24
	.word 0xf83da0a0  ! 2850: STD_I	std	%r28, [%r22 + 0x00a0]
	.word 0xb1520000  ! 2851: RDPR_PIL	<illegal instruction>
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819420d4  ! 2855: WRPR_TPC_I	wrpr	%r16, 0x00d4, %tpc
	.word 0xfc2d8000  ! 2856: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfe3461e3  ! 2858: STH_I	sth	%r31, [%r17 + 0x01e3]
	.word 0xfa3ca1ad  ! 2862: STD_I	std	%r29, [%r18 + 0x01ad]
	.word 0xb7518000  ! 2865: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbd500000  ! 2866: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 2868: RDPR_TSTATE	<illegal instruction>
	.word 0xb7510000  ! 2870: RDPR_TICK	<illegal instruction>
	setx	0x10214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 2872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xf674c000  ! 2874: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf02ce0f4  ! 2876: STB_I	stb	%r24, [%r19 + 0x00f4]
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb735e001  ! 2883: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0xb1504000  ! 2884: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf4254000  ! 2888: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfb3de0f9  ! 2889: STDF_I	std	%f29, [0x00f9, %r23]
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c4000  ! 2901: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf43d21aa  ! 2907: STD_I	std	%r26, [%r20 + 0x01aa]
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c2056  ! 2916: STD_I	std	%r30, [%r16 + 0x0056]
	.word 0xb5540000  ! 2917: RDPR_GL	rdpr	%-, %r26
	.word 0xbd3d7001  ! 2918: SRAX_I	srax	%r21, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2924: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982859  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0xbd508000  ! 2927: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x879420cb  ! 2928: WRPR_TT_I	wrpr	%r16, 0x00cb, %tt
	.word 0xfc35616f  ! 2929: STH_I	sth	%r30, [%r21 + 0x016f]
	.word 0xb13d6001  ! 2934: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xbf520000  ! 2939: RDPR_PIL	rdpr	%pil, %r31
	.word 0x8594e113  ! 2945: WRPR_TSTATE_I	wrpr	%r19, 0x0113, %tstate
	.word 0x8395e00a  ! 2948: WRPR_TNPC_I	wrpr	%r23, 0x000a, %tnpc
	.word 0xb28cc000  ! 2951: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xbe8cc000  ! 2952: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xf22c208f  ! 2955: STB_I	stb	%r25, [%r16 + 0x008f]
	.word 0xfe3dc000  ! 2957: STD_R	std	%r31, [%r23 + %r0]
	.word 0xbb480000  ! 2960: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf474c000  ! 2961: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xbd518000  ! 2964: RDPR_PSTATE	<illegal instruction>
	setx	0x1002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24a131  ! 2969: STW_I	stw	%r31, [%r18 + 0x0131]
	.word 0xb3518000  ! 2970: RDPR_PSTATE	<illegal instruction>
	.word 0xfe2d0000  ! 2977: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf225a1e2  ! 2981: STW_I	stw	%r25, [%r22 + 0x01e2]
	.word 0xfc346130  ! 2987: STH_I	sth	%r30, [%r17 + 0x0130]
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a1f2  ! 2993: WRPR_TNPC_I	wrpr	%r22, 0x01f2, %tnpc
	.word 0xfc2421df  ! 2995: STW_I	stw	%r30, [%r16 + 0x01df]
	.word 0x87946097  ! 2997: WRPR_TT_I	wrpr	%r17, 0x0097, %tt
	.word 0xf82c0000  ! 2998: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb92cb001  ! 2999: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xb351c000  ! 3002: RDPR_TL	rdpr	%tl, %r25
	.word 0xbb2d6001  ! 3003: SLL_I	sll 	%r21, 0x0001, %r29
	setx	0x2022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 3005: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf42d210c  ! 3006: STB_I	stb	%r26, [%r20 + 0x010c]
	.word 0xf42ce073  ! 3008: STB_I	stb	%r26, [%r19 + 0x0073]
	.word 0xf42c2012  ! 3010: STB_I	stb	%r26, [%r16 + 0x0012]
	.word 0xf62dc000  ! 3011: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xbd510000  ! 3013: RDPR_TICK	<illegal instruction>
	.word 0xf6250000  ! 3017: STW_R	stw	%r27, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3018: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb13d3001  ! 3023: SRAX_I	srax	%r20, 0x0001, %r24
	.word 0x919421ad  ! 3025: WRPR_PIL_I	wrpr	%r16, 0x01ad, %pil
	.word 0xfe74a158  ! 3031: STX_I	stx	%r31, [%r18 + 0x0158]
	.word 0xbd51c000  ! 3033: RDPR_TL	rdpr	%tl, %r30
	.word 0xfd3d0000  ! 3034: STDF_R	std	%f30, [%r0, %r20]
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23d8000  ! 3037: STD_R	std	%r25, [%r22 + %r0]
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc7560c4  ! 3040: STX_I	stx	%r30, [%r21 + 0x00c4]
	.word 0xfe2c609a  ! 3042: STB_I	stb	%r31, [%r17 + 0x009a]
	.word 0xf82c4000  ! 3045: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf2744000  ! 3046: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xbd2cc000  ! 3050: SLL_R	sll 	%r19, %r0, %r30
	.word 0xbd518000  ! 3051: RDPR_PSTATE	rdpr	%pstate, %r30
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf025c000  ! 3055: STW_R	stw	%r24, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e53  ! 3056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e53, %hpstate
	.word 0xf2740000  ! 3057: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf22d6197  ! 3070: STB_I	stb	%r25, [%r21 + 0x0197]
	ta	T_CHANGE_HPRIV
	.word 0x81983fd1  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd1, %hpstate
	.word 0x9195207d  ! 3075: WRPR_PIL_I	wrpr	%r20, 0x007d, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x819839d3  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d3, %hpstate
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 3080: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc74e0ea  ! 3082: STX_I	stx	%r30, [%r19 + 0x00ea]
	.word 0xf8356076  ! 3084: STH_I	sth	%r28, [%r21 + 0x0076]
	.word 0xf33da11f  ! 3086: STDF_I	std	%f25, [0x011f, %r22]
	.word 0xbc3d207e  ! 3095: XNOR_I	xnor 	%r20, 0x007e, %r30
	.word 0xfc24a07d  ! 3098: STW_I	stw	%r30, [%r18 + 0x007d]
	.word 0xfe256064  ! 3104: STW_I	stw	%r31, [%r21 + 0x0064]
	mov	1, %r14
	.word 0xa193a000  ! 3106: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r17
	.word 0xf2242069  ! 3114: STW_I	stw	%r25, [%r16 + 0x0069]
	mov	1, %r14
	.word 0xa193a000  ! 3116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb295c000  ! 3118: ORcc_R	orcc 	%r23, %r0, %r25
	.word 0xbd518000  ! 3119: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf024e116  ! 3121: STW_I	stw	%r24, [%r19 + 0x0116]
	.word 0xf6242157  ! 3122: STW_I	stw	%r27, [%r16 + 0x0157]
	.word 0xf425a1de  ! 3123: STW_I	stw	%r26, [%r22 + 0x01de]
	.word 0xf0754000  ! 3124: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfb3de1eb  ! 3125: STDF_I	std	%f29, [0x01eb, %r23]
	.word 0xb88c211a  ! 3127: ANDcc_I	andcc 	%r16, 0x011a, %r28
	setx	data_start_7, %g1, %r20
	.word 0xf8758000  ! 3131: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfc25a146  ! 3132: STW_I	stw	%r30, [%r22 + 0x0146]
	.word 0xb734c000  ! 3133: SRL_R	srl 	%r19, %r0, %r27
	.word 0xf074c000  ! 3134: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf4240000  ! 3135: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfb3d4000  ! 3139: STDF_R	std	%f29, [%r0, %r21]
	.word 0xfe3c0000  ! 3142: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfa3c0000  ! 3145: STD_R	std	%r29, [%r16 + %r0]
	setx	data_start_3, %g1, %r19
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 3151: RDPR_TSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xf73c2188  ! 3153: STDF_I	std	%f27, [0x0188, %r16]
	.word 0xf42cc000  ! 3154: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xb405c000  ! 3156: ADD_R	add 	%r23, %r0, %r26
	.word 0xfa3d4000  ! 3159: STD_R	std	%r29, [%r21 + %r0]
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 3165: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbea58000  ! 3168: SUBcc_R	subcc 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982fdb  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
	.word 0x8995e127  ! 3175: WRPR_TICK_I	wrpr	%r23, 0x0127, %tick
	.word 0xfa2c4000  ! 3178: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf82ce0f3  ! 3180: STB_I	stb	%r28, [%r19 + 0x00f3]
	setx	0x3013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8250000  ! 3189: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfe358000  ! 3191: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf47561ca  ! 3195: STX_I	stx	%r26, [%r21 + 0x01ca]
	.word 0xff3c8000  ! 3196: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf63ca049  ! 3197: STD_I	std	%r27, [%r18 + 0x0049]
	.word 0xb235e0e2  ! 3199: SUBC_I	orn 	%r23, 0x00e2, %r25
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e0e8  ! 3207: WRPR_TSTATE_I	wrpr	%r23, 0x00e8, %tstate
	mov	1, %r14
	.word 0xa193a000  ! 3210: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8995a05c  ! 3212: WRPR_TICK_I	wrpr	%r22, 0x005c, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982e19  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xfa746160  ! 3215: STX_I	stx	%r29, [%r17 + 0x0160]
	.word 0xbb34a001  ! 3218: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xb0b50000  ! 3222: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xfc3d61af  ! 3227: STD_I	std	%r30, [%r21 + 0x01af]
	.word 0xf53c604f  ! 3230: STDF_I	std	%f26, [0x004f, %r17]
	.word 0xbf504000  ! 3240: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf834c000  ! 3242: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfa356107  ! 3245: STH_I	sth	%r29, [%r21 + 0x0107]
	.word 0xfc74e01f  ! 3246: STX_I	stx	%r30, [%r19 + 0x001f]
	.word 0xfa2d8000  ! 3250: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf13d2046  ! 3251: STDF_I	std	%f24, [0x0046, %r20]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a4e17b  ! 3255: SUBcc_I	subcc 	%r19, 0x017b, %r28
	.word 0xf62d20d2  ! 3256: STB_I	stb	%r27, [%r20 + 0x00d2]
	.word 0xf93c4000  ! 3259: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf0350000  ! 3261: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xbe250000  ! 3262: SUB_R	sub 	%r20, %r0, %r31
	.word 0xf0742163  ! 3263: STX_I	stx	%r24, [%r16 + 0x0163]
	.word 0xf63d0000  ! 3266: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfc25c000  ! 3269: STW_R	stw	%r30, [%r23 + %r0]
	.word 0x8595a1e4  ! 3273: WRPR_TSTATE_I	wrpr	%r22, 0x01e4, %tstate
	.word 0xf825e098  ! 3274: STW_I	stw	%r28, [%r23 + 0x0098]
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a07e  ! 3278: WRPR_PIL_I	wrpr	%r22, 0x007e, %pil
	.word 0xf4350000  ! 3280: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf224e103  ! 3282: STW_I	stw	%r25, [%r19 + 0x0103]
	.word 0xfc346078  ! 3283: STH_I	sth	%r30, [%r17 + 0x0078]
	.word 0xf42c8000  ! 3284: STB_R	stb	%r26, [%r18 + %r0]
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 3289: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfa3c4000  ! 3291: STD_R	std	%r29, [%r17 + %r0]
	.word 0xbeb4a0fe  ! 3295: SUBCcc_I	orncc 	%r18, 0x00fe, %r31
	setx	data_start_1, %g1, %r16
	setx	0x20314, %g1, %o0
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
	setx	0x30021, %g1, %o0
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
	.word 0xbd50c000  ! 3306: RDPR_TT	rdpr	%tt, %r30
	.word 0x879421c0  ! 3309: WRPR_TT_I	wrpr	%r16, 0x01c0, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983e8b  ! 3310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8b, %hpstate
	.word 0xbf50c000  ! 3312: RDPR_TT	rdpr	%tt, %r31
	.word 0xf22d605f  ! 3313: STB_I	stb	%r25, [%r21 + 0x005f]
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e173  ! 3320: WRPR_PSTATE_I	wrpr	%r23, 0x0173, %pstate
	.word 0xf82dc000  ! 3322: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfc2c60f0  ! 3323: STB_I	stb	%r30, [%r17 + 0x00f0]
	.word 0xf2744000  ! 3326: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfa3cc000  ! 3329: STD_R	std	%r29, [%r19 + %r0]
	.word 0x8995e1e5  ! 3333: WRPR_TICK_I	wrpr	%r23, 0x01e5, %tick
	.word 0xb5480000  ! 3334: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb83d0000  ! 3336: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xf22da074  ! 3340: STB_I	stb	%r25, [%r22 + 0x0074]
	.word 0xb00c8000  ! 3343: AND_R	and 	%r18, %r0, %r24
	.word 0xf02ca09c  ! 3344: STB_I	stb	%r24, [%r18 + 0x009c]
	.word 0xf13da0f0  ! 3345: STDF_I	std	%f24, [0x00f0, %r22]
	.word 0x8194e0ce  ! 3348: WRPR_TPC_I	wrpr	%r19, 0x00ce, %tpc
	.word 0xf224203e  ! 3350: STW_I	stw	%r25, [%r16 + 0x003e]
	setx	data_start_2, %g1, %r17
	.word 0xf22d0000  ! 3355: STB_R	stb	%r25, [%r20 + %r0]
	setx	data_start_2, %g1, %r17
	.word 0x89946034  ! 3359: WRPR_TICK_I	wrpr	%r17, 0x0034, %tick
	.word 0xf635609e  ! 3360: STH_I	sth	%r27, [%r21 + 0x009e]
	.word 0xf63de126  ! 3362: STD_I	std	%r27, [%r23 + 0x0126]
	.word 0x8595610e  ! 3364: WRPR_TSTATE_I	wrpr	%r21, 0x010e, %tstate
	.word 0xfa25a19c  ! 3366: STW_I	stw	%r29, [%r22 + 0x019c]
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d61a9  ! 3376: STD_I	std	%r26, [%r21 + 0x01a9]
	.word 0x8794e023  ! 3378: WRPR_TT_I	wrpr	%r19, 0x0023, %tt
	.word 0x8595a08f  ! 3384: WRPR_TSTATE_I	wrpr	%r22, 0x008f, %tstate
	.word 0xf875e181  ! 3386: STX_I	stx	%r28, [%r23 + 0x0181]
	ta	T_CHANGE_HPRIV
	.word 0x81983a89  ! 3387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a89, %hpstate
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e0dc  ! 3390: WRPR_TPC_I	wrpr	%r23, 0x00dc, %tpc
	.word 0x899560ad  ! 3391: WRPR_TICK_I	wrpr	%r21, 0x00ad, %tick
	.word 0xb4148000  ! 3395: OR_R	or 	%r18, %r0, %r26
	.word 0xb93c4000  ! 3397: SRA_R	sra 	%r17, %r0, %r28
	.word 0xfe3521b3  ! 3399: STH_I	sth	%r31, [%r20 + 0x01b3]
	.word 0xb61ce07e  ! 3400: XOR_I	xor 	%r19, 0x007e, %r27
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c21c3  ! 3407: STD_I	std	%r30, [%r16 + 0x01c3]
	.word 0xbf540000  ! 3408: RDPR_GL	rdpr	%-, %r31
	.word 0xf93d8000  ! 3415: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf834c000  ! 3417: STH_R	sth	%r28, [%r19 + %r0]
	setx	0x30126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4050000  ! 3423: ADD_R	add 	%r20, %r0, %r26
	.word 0xfc3ca0cc  ! 3424: STD_I	std	%r30, [%r18 + 0x00cc]
	.word 0xf33d4000  ! 3426: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf43c8000  ! 3427: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf4246190  ! 3432: STW_I	stw	%r26, [%r17 + 0x0190]
	.word 0xbd480000  ! 3434: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x10320, %g1, %o0
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
	.word 0xf42de108  ! 3440: STB_I	stb	%r26, [%r23 + 0x0108]
	.word 0xf13c61bd  ! 3441: STDF_I	std	%f24, [0x01bd, %r17]
	.word 0xb7520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xfc74a147  ! 3451: STX_I	stx	%r30, [%r18 + 0x0147]
	.word 0xf22ca0b0  ! 3453: STB_I	stb	%r25, [%r18 + 0x00b0]
	.word 0xfa3d613d  ! 3456: STD_I	std	%r29, [%r21 + 0x013d]
	.word 0xf4256036  ! 3459: STW_I	stw	%r26, [%r21 + 0x0036]
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xf22c0000  ! 3462: STB_R	stb	%r25, [%r16 + %r0]
	.word 0x8194e0e6  ! 3463: WRPR_TPC_I	wrpr	%r19, 0x00e6, %tpc
	.word 0xf62c20af  ! 3467: STB_I	stb	%r27, [%r16 + 0x00af]
	.word 0xf63c4000  ! 3468: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfc25603c  ! 3471: STW_I	stw	%r30, [%r21 + 0x003c]
	.word 0xb0c50000  ! 3474: ADDCcc_R	addccc 	%r20, %r0, %r24
	.word 0x8394e1b1  ! 3475: WRPR_TNPC_I	wrpr	%r19, 0x01b1, %tnpc
	.word 0xf6258000  ! 3477: STW_R	stw	%r27, [%r22 + %r0]
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf035e059  ! 3483: STH_I	sth	%r24, [%r23 + 0x0059]
	.word 0xf33c8000  ! 3488: STDF_R	std	%f25, [%r0, %r18]
	.word 0xf22420e8  ! 3489: STW_I	stw	%r25, [%r16 + 0x00e8]
	.word 0x9195a012  ! 3491: WRPR_PIL_I	wrpr	%r22, 0x0012, %pil
	.word 0xb2b40000  ! 3492: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xb1510000  ! 3495: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf2758000  ! 3503: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xbf2dd000  ! 3507: SLLX_R	sllx	%r23, %r0, %r31
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c4000  ! 3511: STD_R	std	%r30, [%r17 + %r0]
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62ca137  ! 3518: STB_I	stb	%r27, [%r18 + 0x0137]
	.word 0x9195e090  ! 3524: WRPR_PIL_I	wrpr	%r23, 0x0090, %pil
	.word 0xba0c4000  ! 3526: AND_R	and 	%r17, %r0, %r29
	.word 0xf73c4000  ! 3527: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf634e114  ! 3528: STH_I	sth	%r27, [%r19 + 0x0114]
	.word 0xfe3c4000  ! 3529: STD_R	std	%r31, [%r17 + %r0]
	.word 0xb1518000  ! 3530: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfa348000  ! 3531: STH_R	sth	%r29, [%r18 + %r0]
	.word 0x9194e04a  ! 3535: WRPR_PIL_I	wrpr	%r19, 0x004a, %pil
	.word 0xb1518000  ! 3536: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xbcb48000  ! 3540: SUBCcc_R	orncc 	%r18, %r0, %r30
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	mov	2, %r12
	.word 0x8f932000  ! 3546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf224c000  ! 3547: STW_R	stw	%r25, [%r19 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 3549: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3508000  ! 3554: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf875a18a  ! 3562: STX_I	stx	%r28, [%r22 + 0x018a]
	.word 0xf675a0aa  ! 3563: STX_I	stx	%r27, [%r22 + 0x00aa]
	.word 0xf83ce0c4  ! 3567: STD_I	std	%r28, [%r19 + 0x00c4]
	.word 0xbe84a0d6  ! 3577: ADDcc_I	addcc 	%r18, 0x00d6, %r31
	.word 0xf03c209f  ! 3579: STD_I	std	%r24, [%r16 + 0x009f]
	.word 0x8195213f  ! 3581: WRPR_TPC_I	wrpr	%r20, 0x013f, %tpc
	.word 0xf82de1fb  ! 3584: STB_I	stb	%r28, [%r23 + 0x01fb]
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0452119  ! 3588: ADDC_I	addc 	%r20, 0x0119, %r24
	.word 0xf0740000  ! 3590: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf024211f  ! 3591: STW_I	stw	%r24, [%r16 + 0x011f]
	.word 0x8194e120  ! 3597: WRPR_TPC_I	wrpr	%r19, 0x0120, %tpc
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 3599: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf13c21a3  ! 3602: STDF_I	std	%f24, [0x01a3, %r16]
	.word 0xb551c000  ! 3605: RDPR_TL	<illegal instruction>
	.word 0xb04460a9  ! 3607: ADDC_I	addc 	%r17, 0x00a9, %r24
	.word 0xfa2d8000  ! 3611: STB_R	stb	%r29, [%r22 + %r0]
	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a041  ! 3618: WRPR_PIL_I	wrpr	%r22, 0x0041, %pil
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xb9510000  ! 3624: RDPR_TICK	rdpr	%tick, %r28
	setx	data_start_6, %g1, %r22
	.word 0xbc8de1f4  ! 3628: ANDcc_I	andcc 	%r23, 0x01f4, %r30
	.word 0xf22de022  ! 3630: STB_I	stb	%r25, [%r23 + 0x0022]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x839561df  ! 3633: WRPR_TNPC_I	wrpr	%r21, 0x01df, %tnpc
	setx	data_start_6, %g1, %r21
	setx	0x30014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 3642: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d95a074  ! 3643: WRPR_PSTATE_I	wrpr	%r22, 0x0074, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb518000  ! 3654: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfa2dc000  ! 3660: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf4340000  ! 3661: STH_R	sth	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ddb  ! 3664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	.word 0x839561f0  ! 3671: WRPR_TNPC_I	wrpr	%r21, 0x01f0, %tnpc
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 3682: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf73dc000  ! 3686: STDF_R	std	%f27, [%r0, %r23]
	.word 0xb49d0000  ! 3687: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xb43c4000  ! 3688: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xf03521ab  ! 3689: STH_I	sth	%r24, [%r20 + 0x01ab]
	.word 0x8594e156  ! 3690: WRPR_TSTATE_I	wrpr	%r19, 0x0156, %tstate
	.word 0x91942111  ! 3692: WRPR_PIL_I	wrpr	%r16, 0x0111, %pil
	mov	2, %r12
	.word 0x8f932000  ! 3693: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf874c000  ! 3694: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb9510000  ! 3695: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb950c000  ! 3697: RDPR_TT	<illegal instruction>
	.word 0x8995a079  ! 3699: WRPR_TICK_I	wrpr	%r22, 0x0079, %tick
	.word 0xfa74e014  ! 3701: STX_I	stx	%r29, [%r19 + 0x0014]
	.word 0xf275e1f2  ! 3702: STX_I	stx	%r25, [%r23 + 0x01f2]
	.word 0xf22da09f  ! 3705: STB_I	stb	%r25, [%r22 + 0x009f]
	.word 0xfb3d4000  ! 3709: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf02c4000  ! 3711: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb2250000  ! 3719: SUB_R	sub 	%r20, %r0, %r25
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a077  ! 3722: WRPR_TPC_I	wrpr	%r18, 0x0077, %tpc
	.word 0xfa340000  ! 3723: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf4246125  ! 3725: STW_I	stw	%r26, [%r17 + 0x0125]
	.word 0xfe248000  ! 3729: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfc252183  ! 3732: STW_I	stw	%r30, [%r20 + 0x0183]
	.word 0xf63d0000  ! 3733: STD_R	std	%r27, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x819461fa  ! 3736: WRPR_TPC_I	wrpr	%r17, 0x01fa, %tpc
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 3742: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfd3c213d  ! 3748: STDF_I	std	%f30, [0x013d, %r16]
	setx	0x3010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 3759: RDPR_TICK	rdpr	%tick, %r30
	mov	1, %r12
	.word 0x8f932000  ! 3761: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd480000  ! 3765: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf82421e9  ! 3766: STW_I	stw	%r28, [%r16 + 0x01e9]
	.word 0xf874e199  ! 3767: STX_I	stx	%r28, [%r19 + 0x0199]
	.word 0x89942086  ! 3775: WRPR_TICK_I	wrpr	%r16, 0x0086, %tick
	.word 0xf6354000  ! 3776: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf63da17a  ! 3779: STD_I	std	%r27, [%r22 + 0x017a]
	.word 0xf33ce1f1  ! 3780: STDF_I	std	%f25, [0x01f1, %r19]
	.word 0x8595e175  ! 3782: WRPR_TSTATE_I	wrpr	%r23, 0x0175, %tstate
	.word 0xf8758000  ! 3783: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf22d20d2  ! 3785: STB_I	stb	%r25, [%r20 + 0x00d2]
	.word 0xf13c216e  ! 3789: STDF_I	std	%f24, [0x016e, %r16]
	.word 0xf6340000  ! 3794: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xb4bc8000  ! 3795: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xfa3d8000  ! 3799: STD_R	std	%r29, [%r22 + %r0]
	.word 0x8394a111  ! 3801: WRPR_TNPC_I	wrpr	%r18, 0x0111, %tnpc
	.word 0xbc358000  ! 3802: SUBC_R	orn 	%r22, %r0, %r30
	setx	0x10119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839421f7  ! 3807: WRPR_TNPC_I	wrpr	%r16, 0x01f7, %tnpc
	.word 0xfc344000  ! 3808: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf2250000  ! 3811: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf234c000  ! 3818: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf43d4000  ! 3821: STD_R	std	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 3833: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf42c602b  ! 3834: STB_I	stb	%r26, [%r17 + 0x002b]
	.word 0xf834e1e7  ! 3837: STH_I	sth	%r28, [%r19 + 0x01e7]
	.word 0xf93d4000  ! 3842: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf03dc000  ! 3844: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb0c44000  ! 3846: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xf274c000  ! 3851: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf4248000  ! 3852: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb61d0000  ! 3856: XOR_R	xor 	%r20, %r0, %r27
	.word 0xf43d205b  ! 3857: STD_I	std	%r26, [%r20 + 0x005b]
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	.word 0x9194e01f  ! 3864: WRPR_PIL_I	wrpr	%r19, 0x001f, %pil
	.word 0xfe3d4000  ! 3865: STD_R	std	%r31, [%r21 + %r0]
	.word 0xf23c4000  ! 3867: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf73dc000  ! 3868: STDF_R	std	%f27, [%r0, %r23]
	.word 0xbd518000  ! 3869: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb1540000  ! 3872: RDPR_GL	<illegal instruction>
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf234200c  ! 3879: STH_I	sth	%r25, [%r16 + 0x000c]
	.word 0xfc254000  ! 3880: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf2240000  ! 3881: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xb7540000  ! 3882: RDPR_GL	<illegal instruction>
	.word 0xb5520000  ! 3885: RDPR_PIL	<illegal instruction>
	.word 0xb3504000  ! 3886: RDPR_TNPC	<illegal instruction>
	.word 0xbabd4000  ! 3888: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xf13c2177  ! 3889: STDF_I	std	%f24, [0x0177, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81983f4b  ! 3891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 3893: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbcad4000  ! 3894: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xb9540000  ! 3896: RDPR_GL	rdpr	%-, %r28
	.word 0xf6240000  ! 3898: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfa750000  ! 3902: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb5480000  ! 3904: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf6240000  ! 3905: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf02c4000  ! 3906: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb42c8000  ! 3907: ANDN_R	andn 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0350000  ! 3911: ORN_R	orn 	%r20, %r0, %r24
	.word 0xbf510000  ! 3915: RDPR_TICK	<illegal instruction>
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03d61d0  ! 3922: STD_I	std	%r24, [%r21 + 0x01d0]
	.word 0xf2750000  ! 3923: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfe342064  ! 3924: STH_I	sth	%r31, [%r16 + 0x0064]
	.word 0x9195a0ae  ! 3927: WRPR_PIL_I	wrpr	%r22, 0x00ae, %pil
	.word 0xf73c4000  ! 3931: STDF_R	std	%f27, [%r0, %r17]
	.word 0xb1480000  ! 3932: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfe75e18c  ! 3933: STX_I	stx	%r31, [%r23 + 0x018c]
	.word 0xbb51c000  ! 3939: RDPR_TL	rdpr	%tl, %r29
	.word 0xbb510000  ! 3941: RDPR_TICK	<illegal instruction>
	.word 0xb12d6001  ! 3942: SLL_I	sll 	%r21, 0x0001, %r24
	.word 0xf23c4000  ! 3944: STD_R	std	%r25, [%r17 + %r0]
	.word 0xbea58000  ! 3945: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xf875606c  ! 3947: STX_I	stx	%r28, [%r21 + 0x006c]
	.word 0xf82cc000  ! 3949: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xb2b40000  ! 3951: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xf02c60ea  ! 3957: STB_I	stb	%r24, [%r17 + 0x00ea]
	.word 0xbebd0000  ! 3958: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xfe74218f  ! 3959: STX_I	stx	%r31, [%r16 + 0x018f]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6350000  ! 3967: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xbb3c8000  ! 3970: SRA_R	sra 	%r18, %r0, %r29
	.word 0xba1c21d0  ! 3971: XOR_I	xor 	%r16, 0x01d0, %r29
	setx	data_start_6, %g1, %r17
	.word 0xf224a19f  ! 3981: STW_I	stw	%r25, [%r18 + 0x019f]
	.word 0xf63dc000  ! 3982: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfc2c61d7  ! 3984: STB_I	stb	%r30, [%r17 + 0x01d7]
	.word 0x8594e0ce  ! 3985: WRPR_TSTATE_I	wrpr	%r19, 0x00ce, %tstate
	.word 0xfe354000  ! 3987: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xfb3c4000  ! 3990: STDF_R	std	%f29, [%r0, %r17]
	.word 0xb28da006  ! 3991: ANDcc_I	andcc 	%r22, 0x0006, %r25
	.word 0xf63cc000  ! 3993: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf6340000  ! 3997: STH_R	sth	%r27, [%r16 + %r0]
	.word 0x8d95a199  ! 4005: WRPR_PSTATE_I	wrpr	%r22, 0x0199, %pstate
	.word 0xf0754000  ! 4006: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf73ce100  ! 4007: STDF_I	std	%f27, [0x0100, %r19]
	.word 0xf2348000  ! 4011: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x1021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a161  ! 4016: WRPR_PSTATE_I	wrpr	%r18, 0x0161, %pstate
	.word 0xfc24e052  ! 4017: STW_I	stw	%r30, [%r19 + 0x0052]
	.word 0x899520b7  ! 4020: WRPR_TICK_I	wrpr	%r20, 0x00b7, %tick
	.word 0xbe05a0af  ! 4021: ADD_I	add 	%r22, 0x00af, %r31
	.word 0xf13c60b5  ! 4023: STDF_I	std	%f24, [0x00b5, %r17]
	.word 0xb1500000  ! 4028: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8d94e11e  ! 4031: WRPR_PSTATE_I	wrpr	%r19, 0x011e, %pstate
	.word 0xb5520000  ! 4034: RDPR_PIL	rdpr	%pil, %r26
	.word 0xfd3c21c6  ! 4035: STDF_I	std	%f30, [0x01c6, %r16]
	.word 0xf4354000  ! 4037: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfa2d8000  ! 4045: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf13c0000  ! 4047: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf33ca10d  ! 4048: STDF_I	std	%f25, [0x010d, %r18]
	setx	data_start_3, %g1, %r17
	.word 0xf4740000  ! 4050: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf475c000  ! 4054: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf83c0000  ! 4055: STD_R	std	%r28, [%r16 + %r0]
	.word 0xfa2d0000  ! 4056: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbb520000  ! 4057: RDPR_PIL	<illegal instruction>
	.word 0x83952091  ! 4060: WRPR_TNPC_I	wrpr	%r20, 0x0091, %tnpc
	.word 0xf43dc000  ! 4062: STD_R	std	%r26, [%r23 + %r0]
	.word 0xb9518000  ! 4071: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb13d7001  ! 4072: SRAX_I	srax	%r21, 0x0001, %r24
	.word 0xfb3de07d  ! 4075: STDF_I	std	%f29, [0x007d, %r23]
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 4077: RDPR_TL	<illegal instruction>
	.word 0xfd3c4000  ! 4081: STDF_R	std	%f30, [%r0, %r17]
	.word 0xb63561b5  ! 4084: ORN_I	orn 	%r21, 0x01b5, %r27
	.word 0xb2a44000  ! 4086: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xfc3c6120  ! 4089: STD_I	std	%r30, [%r17 + 0x0120]
	.word 0xf63d2019  ! 4090: STD_I	std	%r27, [%r20 + 0x0019]
	ta	T_CHANGE_HPRIV
	.word 0x81983993  ! 4091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1993, %hpstate
	.word 0xb5518000  ! 4093: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 4100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	.word 0xf23d2154  ! 4101: STD_I	std	%r25, [%r20 + 0x0154]
	.word 0xb551c000  ! 4113: RDPR_TL	rdpr	%tl, %r26
	.word 0xb4a46053  ! 4114: SUBcc_I	subcc 	%r17, 0x0053, %r26
	.word 0xfc3ce0aa  ! 4117: STD_I	std	%r30, [%r19 + 0x00aa]
	mov	1, %r14
	.word 0xa193a000  ! 4118: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_3, %g1, %r22
	.word 0x8195a0b1  ! 4125: WRPR_TPC_I	wrpr	%r22, 0x00b1, %tpc
	setx	data_start_4, %g1, %r22
	.word 0xfc3de092  ! 4133: STD_I	std	%r30, [%r23 + 0x0092]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf62d4000  ! 4136: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf275a1c4  ! 4137: STX_I	stx	%r25, [%r22 + 0x01c4]
	.word 0xb72c9000  ! 4138: SLLX_R	sllx	%r18, %r0, %r27
	.word 0xf63ca0a4  ! 4139: STD_I	std	%r27, [%r18 + 0x00a4]
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc248000  ! 4143: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x8d94e1f5  ! 4144: WRPR_PSTATE_I	wrpr	%r19, 0x01f5, %pstate
	.word 0xfe2c60bd  ! 4145: STB_I	stb	%r31, [%r17 + 0x00bd]
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2ce1f0  ! 4151: STB_I	stb	%r31, [%r19 + 0x01f0]
	.word 0xff3cc000  ! 4152: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf63d0000  ! 4154: STD_R	std	%r27, [%r20 + %r0]
	.word 0xb92da001  ! 4156: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0xf33d4000  ! 4158: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf53d4000  ! 4161: STDF_R	std	%f26, [%r0, %r21]
	.word 0xb5520000  ! 4162: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf8350000  ! 4163: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfa3d4000  ! 4167: STD_R	std	%r29, [%r21 + %r0]
	.word 0xb1518000  ! 4170: RDPR_PSTATE	<illegal instruction>
	.word 0xb02d8000  ! 4173: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xfa35c000  ! 4175: STH_R	sth	%r29, [%r23 + %r0]
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4180: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc342078  ! 4181: STH_I	sth	%r30, [%r16 + 0x0078]
	.word 0xf0752063  ! 4182: STX_I	stx	%r24, [%r20 + 0x0063]
	.word 0xf73de11f  ! 4183: STDF_I	std	%f27, [0x011f, %r23]
	.word 0xf83d60fa  ! 4184: STD_I	std	%r28, [%r21 + 0x00fa]
	.word 0xb1540000  ! 4186: RDPR_GL	rdpr	%-, %r24
	.word 0xf62ce058  ! 4187: STB_I	stb	%r27, [%r19 + 0x0058]
	.word 0xb5510000  ! 4188: RDPR_TICK	<illegal instruction>
	.word 0xb9518000  ! 4189: RDPR_PSTATE	<illegal instruction>
	.word 0xbd51c000  ! 4191: RDPR_TL	<illegal instruction>
	.word 0xfc25e069  ! 4196: STW_I	stw	%r30, [%r23 + 0x0069]
	.word 0xfa24a1d0  ! 4198: STW_I	stw	%r29, [%r18 + 0x01d0]
	.word 0xfa756181  ! 4201: STX_I	stx	%r29, [%r21 + 0x0181]
	.word 0xfa2da0b9  ! 4205: STB_I	stb	%r29, [%r22 + 0x00b9]
	.word 0xf22c2035  ! 4208: STB_I	stb	%r25, [%r16 + 0x0035]
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d0000  ! 4211: STD_R	std	%r30, [%r20 + %r0]
	.word 0xb1540000  ! 4214: RDPR_GL	rdpr	%-, %r24
	.word 0xb6ad2106  ! 4215: ANDNcc_I	andncc 	%r20, 0x0106, %r27
	.word 0xfb3dc000  ! 4216: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf62d0000  ! 4217: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfb3dc000  ! 4218: STDF_R	std	%f29, [%r0, %r23]
	.word 0xfa25c000  ! 4219: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xb20d2009  ! 4221: AND_I	and 	%r20, 0x0009, %r25
	.word 0xb1518000  ! 4223: RDPR_PSTATE	<illegal instruction>
	.word 0xbe3dc000  ! 4226: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xf4746160  ! 4228: STX_I	stx	%r26, [%r17 + 0x0160]
	mov	1, %r12
	.word 0x8f932000  ! 4229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81983d19  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d19, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983ccb  ! 4233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ccb, %hpstate
	.word 0xf82461c5  ! 4234: STW_I	stw	%r28, [%r17 + 0x01c5]
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3c0000  ! 4236: STDF_R	std	%f30, [%r0, %r16]
	.word 0xb884c000  ! 4237: ADDcc_R	addcc 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 4238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	.word 0xfa740000  ! 4240: STX_R	stx	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0x8d94a033  ! 4245: WRPR_PSTATE_I	wrpr	%r18, 0x0033, %pstate
	.word 0xf82d617b  ! 4248: STB_I	stb	%r28, [%r21 + 0x017b]
	.word 0xb5518000  ! 4250: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfe746125  ! 4253: STX_I	stx	%r31, [%r17 + 0x0125]
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 4265: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb951c000  ! 4274: RDPR_TL	<illegal instruction>
	.word 0xfb3c20df  ! 4276: STDF_I	std	%f29, [0x00df, %r16]
	.word 0xbcc4a15d  ! 4279: ADDCcc_I	addccc 	%r18, 0x015d, %r30
	.word 0xff3c0000  ! 4281: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb5504000  ! 4282: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b11  ! 4284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b11, %hpstate
	.word 0xf53ca1df  ! 4286: STDF_I	std	%f26, [0x01df, %r18]
	.word 0xb2c46037  ! 4287: ADDCcc_I	addccc 	%r17, 0x0037, %r25
	.word 0x8d94a00b  ! 4288: WRPR_PSTATE_I	wrpr	%r18, 0x000b, %pstate
	.word 0xf0240000  ! 4289: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf025a0c2  ! 4290: STW_I	stw	%r24, [%r22 + 0x00c2]
	.word 0xfd3d4000  ! 4293: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf2740000  ! 4298: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf025a16a  ! 4299: STW_I	stw	%r24, [%r22 + 0x016a]
	.word 0xfd3ca004  ! 4300: STDF_I	std	%f30, [0x0004, %r18]
	.word 0xf2754000  ! 4302: STX_R	stx	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2258000  ! 4307: SUB_R	sub 	%r22, %r0, %r25
	.word 0xfc354000  ! 4310: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb57d4400  ! 4312: MOVR_R	movre	%r21, %r0, %r26
	.word 0xfc350000  ! 4315: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf07561cc  ! 4324: STX_I	stx	%r24, [%r21 + 0x01cc]
	.word 0xfc75a02c  ! 4327: STX_I	stx	%r30, [%r22 + 0x002c]
	.word 0xfe24a0eb  ! 4329: STW_I	stw	%r31, [%r18 + 0x00eb]
	.word 0xf2256007  ! 4331: STW_I	stw	%r25, [%r21 + 0x0007]
	.word 0xbf518000  ! 4333: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfe754000  ! 4335: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf424e16d  ! 4336: STW_I	stw	%r26, [%r19 + 0x016d]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3d6047  ! 4339: XNOR_I	xnor 	%r21, 0x0047, %r30
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82c0000  ! 4341: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfe3d21c5  ! 4342: STD_I	std	%r31, [%r20 + 0x01c5]
	.word 0xfa2460fa  ! 4344: STW_I	stw	%r29, [%r17 + 0x00fa]
	.word 0xbf508000  ! 4345: RDPR_TSTATE	<illegal instruction>
	.word 0xb3520000  ! 4347: RDPR_PIL	<illegal instruction>
	.word 0xf62c4000  ! 4352: STB_R	stb	%r27, [%r17 + %r0]
	.word 0x8194a1c8  ! 4356: WRPR_TPC_I	wrpr	%r18, 0x01c8, %tpc
	.word 0xbb34c000  ! 4358: SRL_R	srl 	%r19, %r0, %r29
	setx	0x20003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3da083  ! 4360: STD_I	std	%r30, [%r22 + 0x0083]
	.word 0xfc3d0000  ! 4365: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfe3de03b  ! 4366: STD_I	std	%r31, [%r23 + 0x003b]
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 4369: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf62d4000  ! 4371: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfc358000  ! 4376: STH_R	sth	%r30, [%r22 + %r0]
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c2140  ! 4378: STB_I	stb	%r30, [%r16 + 0x0140]
	.word 0xf635a0d8  ! 4379: STH_I	sth	%r27, [%r22 + 0x00d8]
	.word 0xf0254000  ! 4380: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf0348000  ! 4381: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf42c2133  ! 4383: STB_I	stb	%r26, [%r16 + 0x0133]
	.word 0xf33d4000  ! 4387: STDF_R	std	%f25, [%r0, %r21]
	.word 0xfc240000  ! 4391: STW_R	stw	%r30, [%r16 + %r0]
	.word 0x91942167  ! 4392: WRPR_PIL_I	wrpr	%r16, 0x0167, %pil
	.word 0xbb508000  ! 4394: RDPR_TSTATE	rdpr	%tstate, %r29
	setx	0x312, %g1, %o0
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
	.word 0x8994a0c3  ! 4404: WRPR_TICK_I	wrpr	%r18, 0x00c3, %tick
	setx	data_start_6, %g1, %r20
	.word 0xfa2c0000  ! 4406: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfc3ce193  ! 4411: STD_I	std	%r30, [%r19 + 0x0193]
	.word 0x8d94e14c  ! 4413: WRPR_PSTATE_I	wrpr	%r19, 0x014c, %pstate
	.word 0xb7518000  ! 4414: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfa25e1de  ! 4415: STW_I	stw	%r29, [%r23 + 0x01de]
	.word 0xfc3d0000  ! 4416: STD_R	std	%r30, [%r20 + %r0]
	.word 0x859460cc  ! 4418: WRPR_TSTATE_I	wrpr	%r17, 0x00cc, %tstate
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4423: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8195609d  ! 4429: WRPR_TPC_I	wrpr	%r21, 0x009d, %tpc
	.word 0xbf2c0000  ! 4433: SLL_R	sll 	%r16, %r0, %r31
	.word 0xf634e064  ! 4434: STH_I	sth	%r27, [%r19 + 0x0064]
	.word 0xf53c2122  ! 4435: STDF_I	std	%f26, [0x0122, %r16]
	.word 0xf43c6154  ! 4438: STD_I	std	%r26, [%r17 + 0x0154]
	.word 0xf53de0e2  ! 4439: STDF_I	std	%f26, [0x00e2, %r23]
	.word 0xfa2ce160  ! 4440: STB_I	stb	%r29, [%r19 + 0x0160]
	.word 0xb444e1c2  ! 4444: ADDC_I	addc 	%r19, 0x01c2, %r26
	.word 0xf83d614a  ! 4446: STD_I	std	%r28, [%r21 + 0x014a]
	.word 0xbd540000  ! 4447: RDPR_GL	rdpr	%-, %r30
	.word 0xb1540000  ! 4448: RDPR_GL	<illegal instruction>
	setx	data_start_5, %g1, %r16
	.word 0x919461d5  ! 4451: WRPR_PIL_I	wrpr	%r17, 0x01d5, %pil
	.word 0xff3da16e  ! 4453: STDF_I	std	%f31, [0x016e, %r22]
	.word 0xba844000  ! 4456: ADDcc_R	addcc 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982899  ! 4461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xf424e1af  ! 4462: STW_I	stw	%r26, [%r19 + 0x01af]
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 4473: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb834c000  ! 4474: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xb7508000  ! 4475: RDPR_TSTATE	<illegal instruction>
	.word 0xb02c8000  ! 4477: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xfe244000  ! 4480: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfe3420f5  ! 4490: STH_I	sth	%r31, [%r16 + 0x00f5]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc9d21d3  ! 4495: XORcc_I	xorcc 	%r20, 0x01d3, %r30
	mov	2, %r12
	.word 0x8f932000  ! 4499: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7510000  ! 4501: RDPR_TICK	rdpr	%tick, %r27
	mov	1, %r12
	.word 0x8f932000  ! 4506: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf42ca0cd  ! 4507: STB_I	stb	%r26, [%r18 + 0x00cd]
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 4512: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfd3d0000  ! 4513: STDF_R	std	%f30, [%r0, %r20]
	setx	data_start_0, %g1, %r21
	.word 0xf42c61f4  ! 4515: STB_I	stb	%r26, [%r17 + 0x01f4]
	.word 0xbb480000  ! 4517: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8394e112  ! 4521: WRPR_TNPC_I	wrpr	%r19, 0x0112, %tnpc
	.word 0xfe2d0000  ! 4522: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf8752168  ! 4524: STX_I	stx	%r28, [%r20 + 0x0168]
	.word 0xfa2d8000  ! 4526: STB_R	stb	%r29, [%r22 + %r0]
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 4528: RDPR_TL	rdpr	%tl, %r30
	.word 0xfd3d4000  ! 4537: STDF_R	std	%f30, [%r0, %r21]
	.word 0xb7480000  ! 4539: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc3da159  ! 4543: STD_I	std	%r30, [%r22 + 0x0159]
	.word 0xf6748000  ! 4546: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf02d60c7  ! 4548: STB_I	stb	%r24, [%r21 + 0x00c7]
	.word 0xb805e0ea  ! 4553: ADD_I	add 	%r23, 0x00ea, %r28
	setx	data_start_5, %g1, %r23
	.word 0xfd3dc000  ! 4557: STDF_R	std	%f30, [%r0, %r23]
	.word 0x8d94a151  ! 4558: WRPR_PSTATE_I	wrpr	%r18, 0x0151, %pstate
	mov	0, %r14
	.word 0xa193a000  ! 4559: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb53d2001  ! 4561: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xf4354000  ! 4562: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfb3d0000  ! 4564: STDF_R	std	%f29, [%r0, %r20]
	.word 0xb151c000  ! 4565: RDPR_TL	rdpr	%tl, %r24
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 4569: RDPR_PSTATE	<illegal instruction>
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3d8000  ! 4573: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfe74a139  ! 4575: STX_I	stx	%r31, [%r18 + 0x0139]
	.word 0xfb3da061  ! 4576: STDF_I	std	%f29, [0x0061, %r22]
	.word 0xfb3d4000  ! 4581: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb1347001  ! 4583: SRLX_I	srlx	%r17, 0x0001, %r24
	.word 0xfb3c60ca  ! 4589: STDF_I	std	%f29, [0x00ca, %r17]
	.word 0xff3da106  ! 4590: STDF_I	std	%f31, [0x0106, %r22]
	.word 0xfa34e1e4  ! 4595: STH_I	sth	%r29, [%r19 + 0x01e4]
	.word 0xf8348000  ! 4596: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf6754000  ! 4603: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf275e119  ! 4609: STX_I	stx	%r25, [%r23 + 0x0119]
	.word 0x8194e168  ! 4610: WRPR_TPC_I	wrpr	%r19, 0x0168, %tpc
	.word 0x8595e1a9  ! 4611: WRPR_TSTATE_I	wrpr	%r23, 0x01a9, %tstate
	.word 0xf03d4000  ! 4613: STD_R	std	%r24, [%r21 + %r0]
	.word 0xb550c000  ! 4615: RDPR_TT	rdpr	%tt, %r26
	.word 0xfe7461f2  ! 4617: STX_I	stx	%r31, [%r17 + 0x01f2]
	setx	data_start_2, %g1, %r21
	.word 0xfa3d4000  ! 4623: STD_R	std	%r29, [%r21 + %r0]
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 4630: RDPR_TICK	<illegal instruction>
	.word 0xfe3ce079  ! 4631: STD_I	std	%r31, [%r19 + 0x0079]
	.word 0xfa3c4000  ! 4632: STD_R	std	%r29, [%r17 + %r0]
	.word 0xfc3c8000  ! 4637: STD_R	std	%r30, [%r18 + %r0]
	.word 0xbe440000  ! 4641: ADDC_R	addc 	%r16, %r0, %r31
	.word 0xb8440000  ! 4642: ADDC_R	addc 	%r16, %r0, %r28
	.word 0xf4240000  ! 4645: STW_R	stw	%r26, [%r16 + %r0]
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08dc000  ! 4653: ANDcc_R	andcc 	%r23, %r0, %r24
	.word 0xf225c000  ! 4654: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfe35a12c  ! 4656: STH_I	sth	%r31, [%r22 + 0x012c]
	.word 0xf6340000  ! 4659: STH_R	sth	%r27, [%r16 + %r0]
	setx	data_start_4, %g1, %r17
	.word 0xbd355000  ! 4663: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xf03c6097  ! 4670: STD_I	std	%r24, [%r17 + 0x0097]
	.word 0xf42460d7  ! 4676: STW_I	stw	%r26, [%r17 + 0x00d7]
	.word 0xf2240000  ! 4677: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf824a09d  ! 4682: STW_I	stw	%r28, [%r18 + 0x009d]
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0x8795a127  ! 4688: WRPR_TT_I	wrpr	%r22, 0x0127, %tt
	.word 0xbf7da401  ! 4689: MOVR_I	movre	%r22, 0x1, %r31
	.word 0xb484a1f4  ! 4690: ADDcc_I	addcc 	%r18, 0x01f4, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a83  ! 4692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a83, %hpstate
	.word 0xfd3de02f  ! 4693: STDF_I	std	%f30, [0x002f, %r23]
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ca11e  ! 4700: STD_I	std	%r30, [%r18 + 0x011e]
	.word 0xbd518000  ! 4702: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfc746120  ! 4707: STX_I	stx	%r30, [%r17 + 0x0120]
	.word 0xf224e1aa  ! 4708: STW_I	stw	%r25, [%r19 + 0x01aa]
	.word 0x8795a0e0  ! 4710: WRPR_TT_I	wrpr	%r22, 0x00e0, %tt
	mov	0, %r12
	.word 0x8f932000  ! 4713: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe24e0b4  ! 4714: STW_I	stw	%r31, [%r19 + 0x00b4]
	.word 0xfc74e02c  ! 4715: STX_I	stx	%r30, [%r19 + 0x002c]
	.word 0xf42d6080  ! 4719: STB_I	stb	%r26, [%r21 + 0x0080]
	.word 0x8794a06b  ! 4721: WRPR_TT_I	wrpr	%r18, 0x006b, %tt
	.word 0xf42de1f8  ! 4722: STB_I	stb	%r26, [%r23 + 0x01f8]
	.word 0xfc2c0000  ! 4723: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfe34c000  ! 4729: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf274e0c9  ! 4731: STX_I	stx	%r25, [%r19 + 0x00c9]
	.word 0xbeb42160  ! 4733: SUBCcc_I	orncc 	%r16, 0x0160, %r31
	.word 0xf42c60f0  ! 4734: STB_I	stb	%r26, [%r17 + 0x00f0]
	.word 0xfc75a098  ! 4736: STX_I	stx	%r30, [%r22 + 0x0098]
	.word 0x8994a0b8  ! 4743: WRPR_TICK_I	wrpr	%r18, 0x00b8, %tick
	.word 0xfa35611e  ! 4744: STH_I	sth	%r29, [%r21 + 0x011e]
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c8000  ! 4755: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf4752031  ! 4756: STX_I	stx	%r26, [%r20 + 0x0031]
	.word 0xbd504000  ! 4757: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbc8da158  ! 4759: ANDcc_I	andcc 	%r22, 0x0158, %r30
	.word 0x8d9421a4  ! 4762: WRPR_PSTATE_I	wrpr	%r16, 0x01a4, %pstate
	.word 0xf434c000  ! 4763: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf2740000  ! 4764: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfa3d6128  ! 4772: STD_I	std	%r29, [%r21 + 0x0128]
	.word 0xb7643801  ! 4784: MOVcc_I	<illegal instruction>
	.word 0x8195e1c2  ! 4790: WRPR_TPC_I	wrpr	%r23, 0x01c2, %tpc
	.word 0xfc248000  ! 4792: STW_R	stw	%r30, [%r18 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 4793: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 4794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf83d6001  ! 4795: STD_I	std	%r28, [%r21 + 0x0001]
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	.word 0xfc242042  ! 4799: STW_I	stw	%r30, [%r16 + 0x0042]
	.word 0xf62de097  ! 4803: STB_I	stb	%r27, [%r23 + 0x0097]
	.word 0xb6344000  ! 4808: ORN_R	orn 	%r17, %r0, %r27
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e0ae  ! 4814: WRPR_PSTATE_I	wrpr	%r23, 0x00ae, %pstate
	.word 0x8795210b  ! 4815: WRPR_TT_I	wrpr	%r20, 0x010b, %tt
	.word 0xff3c0000  ! 4819: STDF_R	std	%f31, [%r0, %r16]
	.word 0x8194a185  ! 4822: WRPR_TPC_I	wrpr	%r18, 0x0185, %tpc
	setx	0x1030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 4824: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf625c000  ! 4825: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xbd508000  ! 4831: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xbd50c000  ! 4832: RDPR_TT	<illegal instruction>
	.word 0xfa3460d5  ! 4840: STH_I	sth	%r29, [%r17 + 0x00d5]
	.word 0x85946168  ! 4841: WRPR_TSTATE_I	wrpr	%r17, 0x0168, %tstate
	.word 0xb1347001  ! 4845: SRLX_I	srlx	%r17, 0x0001, %r24
	.word 0xb7520000  ! 4849: RDPR_PIL	rdpr	%pil, %r27
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e15e  ! 4856: WRPR_TICK_I	wrpr	%r23, 0x015e, %tick
	.word 0xfe2de062  ! 4857: STB_I	stb	%r31, [%r23 + 0x0062]
	.word 0xfe25e111  ! 4858: STW_I	stw	%r31, [%r23 + 0x0111]
	.word 0xb894c000  ! 4859: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0x9194215f  ! 4860: WRPR_PIL_I	wrpr	%r16, 0x015f, %pil
	.word 0xb03de09b  ! 4862: XNOR_I	xnor 	%r23, 0x009b, %r24
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 4868: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf6340000  ! 4871: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf63d215c  ! 4873: STD_I	std	%r27, [%r20 + 0x015c]
	.word 0xf235e15a  ! 4875: STH_I	sth	%r25, [%r23 + 0x015a]
	.word 0xfc75c000  ! 4877: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb4148000  ! 4880: OR_R	or 	%r18, %r0, %r26
	.word 0xfe348000  ! 4881: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf33cc000  ! 4882: STDF_R	std	%f25, [%r0, %r19]
	.word 0xfe3c0000  ! 4883: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfc24219d  ! 4885: STW_I	stw	%r30, [%r16 + 0x019d]
	.word 0xb7540000  ! 4887: RDPR_GL	rdpr	%-, %r27
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02ce128  ! 4890: STB_I	stb	%r24, [%r19 + 0x0128]
	.word 0xf875c000  ! 4892: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf875c000  ! 4893: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfa7420e7  ! 4897: STX_I	stx	%r29, [%r16 + 0x00e7]
	.word 0xfc2d4000  ! 4898: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xb3480000  ! 4899: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf435e06d  ! 4901: STH_I	sth	%r26, [%r23 + 0x006d]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2244000  ! 4906: STW_R	stw	%r25, [%r17 + %r0]
	.word 0x8994610a  ! 4911: WRPR_TICK_I	wrpr	%r17, 0x010a, %tick
	.word 0xfa34a1f3  ! 4912: STH_I	sth	%r29, [%r18 + 0x01f3]
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	.word 0xf62c8000  ! 4914: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xbc14a1bc  ! 4916: OR_I	or 	%r18, 0x01bc, %r30
	.word 0xf73da0a9  ! 4920: STDF_I	std	%f27, [0x00a9, %r22]
	.word 0xf22c8000  ! 4922: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xb5508000  ! 4925: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa244000  ! 4932: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf2254000  ! 4933: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf43cc000  ! 4936: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb0b4e118  ! 4937: SUBCcc_I	orncc 	%r19, 0x0118, %r24
	.word 0xfa2c617d  ! 4941: STB_I	stb	%r29, [%r17 + 0x017d]
	.word 0xb57c0400  ! 4943: MOVR_R	movre	%r16, %r0, %r26
	.word 0xfa744000  ! 4948: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xba9cc000  ! 4949: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xfb3c6104  ! 4951: STDF_I	std	%f29, [0x0104, %r17]
	.word 0x8d94a055  ! 4953: WRPR_PSTATE_I	wrpr	%r18, 0x0055, %pstate
	.word 0xf035c000  ! 4957: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf0240000  ! 4966: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf22da0a1  ! 4969: STB_I	stb	%r25, [%r22 + 0x00a1]
	.word 0xf62d0000  ! 4975: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb4c58000  ! 4982: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0x83956144  ! 4984: WRPR_TNPC_I	wrpr	%r21, 0x0144, %tnpc
	.word 0xfb3dc000  ! 4985: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf73c0000  ! 4987: STDF_R	std	%f27, [%r0, %r16]
	setx	data_start_6, %g1, %r21
	.word 0xf624c000  ! 4992: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xb950c000  ! 4993: RDPR_TT	rdpr	%tt, %r28
	.word 0xb7508000  ! 4994: RDPR_TSTATE	<illegal instruction>
	.word 0x879520f0  ! 4995: WRPR_TT_I	wrpr	%r20, 0x00f0, %tt
	.word 0xfe75204b  ! 4998: STX_I	stx	%r31, [%r20 + 0x004b]
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
	.word 0xb350c000  ! 4: RDPR_TT	<illegal instruction>
	.word 0xf40d8000  ! 5: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf80521bd  ! 6: LDUW_I	lduw	[%r20 + 0x01bd], %r28
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12cf001  ! 11: SLLX_I	sllx	%r19, 0x0001, %r24
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc04a08b  ! 23: LDUW_I	lduw	[%r18 + 0x008b], %r30
	.word 0xfc0cc000  ! 29: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf615c000  ! 32: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf45ca166  ! 35: LDX_I	ldx	[%r18 + 0x0166], %r26
	.word 0xf05ca183  ! 36: LDX_I	ldx	[%r18 + 0x0183], %r24
	.word 0xf24d8000  ! 38: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xb82c0000  ! 42: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xf51cc000  ! 43: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf215615a  ! 48: LDUH_I	lduh	[%r21 + 0x015a], %r25
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60dc000  ! 51: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf60c20e7  ! 52: LDUB_I	ldub	[%r16 + 0x00e7], %r27
	.word 0xf2158000  ! 58: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0x85946096  ! 60: WRPR_TSTATE_I	wrpr	%r17, 0x0096, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xfa4c6167  ! 62: LDSB_I	ldsb	[%r17 + 0x0167], %r29
	.word 0xf64561ab  ! 64: LDSW_I	ldsw	[%r21 + 0x01ab], %r27
	.word 0xf8148000  ! 65: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf245c000  ! 67: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb285e19d  ! 68: ADDcc_I	addcc 	%r23, 0x019d, %r25
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	.word 0xb3508000  ! 73: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf8048000  ! 77: LDUW_R	lduw	[%r18 + %r0], %r28
	setx	0x2012e, %g1, %o0
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
	.word 0xb1480000  ! 81: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa5ce153  ! 83: LDX_I	ldx	[%r19 + 0x0153], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982a59  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a59, %hpstate
	setx	data_start_4, %g1, %r20
	.word 0xfa0ca0a1  ! 88: LDUB_I	ldub	[%r18 + 0x00a1], %r29
	.word 0xb8bda1b8  ! 89: XNORcc_I	xnorcc 	%r22, 0x01b8, %r28
	.word 0xf40c0000  ! 93: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xb1504000  ! 95: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfc0de1f1  ! 96: LDUB_I	ldub	[%r23 + 0x01f1], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b91  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b91, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 99: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r14
	.word 0xa193a000  ! 104: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb0a561b5  ! 106: SUBcc_I	subcc 	%r21, 0x01b5, %r24
	setx	data_start_7, %g1, %r18
	.word 0xfe5de11a  ! 109: LDX_I	ldx	[%r23 + 0x011a], %r31
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4044000  ! 113: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf61c21f3  ! 117: LDD_I	ldd	[%r16 + 0x01f3], %r27
	.word 0xf045c000  ! 118: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf01c6181  ! 120: LDD_I	ldd	[%r17 + 0x0181], %r24
	.word 0xf01ca1cc  ! 122: LDD_I	ldd	[%r18 + 0x01cc], %r24
	.word 0xfc5da0db  ! 125: LDX_I	ldx	[%r22 + 0x00db], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1da0c1  ! 130: LDD_I	ldd	[%r22 + 0x00c1], %r31
	.word 0xbd346001  ! 131: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xfa148000  ! 135: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf45d60f3  ! 136: LDX_I	ldx	[%r21 + 0x00f3], %r26
	.word 0xb3518000  ! 137: RDPR_PSTATE	<illegal instruction>
	.word 0xba05a1d2  ! 138: ADD_I	add 	%r22, 0x01d2, %r29
	.word 0xba9dc000  ! 141: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xfe154000  ! 143: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xfc54a061  ! 147: LDSH_I	ldsh	[%r18 + 0x0061], %r30
	.word 0xfe15619c  ! 148: LDUH_I	lduh	[%r21 + 0x019c], %r31
	.word 0xf6054000  ! 150: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf91de071  ! 152: LDDF_I	ldd	[%r23, 0x0071], %f28
	.word 0xf8554000  ! 153: LDSH_R	ldsh	[%r21 + %r0], %r28
	mov	0, %r12
	.word 0x8f932000  ! 155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 163: RDPR_GL	<illegal instruction>
	.word 0xf255e061  ! 165: LDSH_I	ldsh	[%r23 + 0x0061], %r25
	.word 0xfd1ce16f  ! 166: LDDF_I	ldd	[%r19, 0x016f], %f30
	.word 0x839561b8  ! 167: WRPR_TNPC_I	wrpr	%r21, 0x01b8, %tnpc
	.word 0xfc14a1f1  ! 169: LDUH_I	lduh	[%r18 + 0x01f1], %r30
	.word 0xf84c61e7  ! 171: LDSB_I	ldsb	[%r17 + 0x01e7], %r28
	.word 0x8594a0b5  ! 172: WRPR_TSTATE_I	wrpr	%r18, 0x00b5, %tstate
	.word 0x8794a049  ! 173: WRPR_TT_I	wrpr	%r18, 0x0049, %tt
	.word 0xfc55c000  ! 174: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf615e010  ! 176: LDUH_I	lduh	[%r23 + 0x0010], %r27
	.word 0x8d9420d7  ! 178: WRPR_PSTATE_I	wrpr	%r16, 0x00d7, %pstate
	.word 0xf85c4000  ! 181: LDX_R	ldx	[%r17 + %r0], %r28
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xf41da04c  ! 184: LDD_I	ldd	[%r22 + 0x004c], %r26
	.word 0xbca44000  ! 185: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xf0140000  ! 189: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfb1c2017  ! 190: LDDF_I	ldd	[%r16, 0x0017], %f29
	.word 0x899521fa  ! 191: WRPR_TICK_I	wrpr	%r20, 0x01fa, %tick
	.word 0xb3510000  ! 195: RDPR_TICK	<illegal instruction>
	.word 0xfa5c4000  ! 200: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xfa0561b1  ! 205: LDUW_I	lduw	[%r21 + 0x01b1], %r29
	.word 0xbf508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0xfa052115  ! 214: LDUW_I	lduw	[%r20 + 0x0115], %r29
	setx	data_start_1, %g1, %r20
	mov	0, %r14
	.word 0xa193a000  ! 218: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf25cc000  ! 224: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xb9508000  ! 225: RDPR_TSTATE	<illegal instruction>
	.word 0xb42521a0  ! 232: SUB_I	sub 	%r20, 0x01a0, %r26
	.word 0xb53da001  ! 233: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb950c000  ! 235: RDPR_TT	<illegal instruction>
	.word 0xf245e1ae  ! 240: LDSW_I	ldsw	[%r23 + 0x01ae], %r25
	.word 0xb89ce1da  ! 242: XORcc_I	xorcc 	%r19, 0x01da, %r28
	.word 0xb3520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0xfe45c000  ! 253: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf8550000  ! 255: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf11dc000  ! 257: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf24d612c  ! 258: LDSB_I	ldsb	[%r21 + 0x012c], %r25
	.word 0xb53d6001  ! 259: SRA_I	sra 	%r21, 0x0001, %r26
	.word 0xb7504000  ! 264: RDPR_TNPC	<illegal instruction>
	.word 0xfe15a070  ! 266: LDUH_I	lduh	[%r22 + 0x0070], %r31
	.word 0xfc14a088  ! 268: LDUH_I	lduh	[%r18 + 0x0088], %r30
	.word 0xfc156113  ! 269: LDUH_I	lduh	[%r21 + 0x0113], %r30
	.word 0xf65ce1c6  ! 272: LDX_I	ldx	[%r19 + 0x01c6], %r27
	.word 0xf25c4000  ! 273: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf31c6045  ! 275: LDDF_I	ldd	[%r17, 0x0045], %f25
	.word 0xfa4da17d  ! 276: LDSB_I	ldsb	[%r22 + 0x017d], %r29
	.word 0xfc1420bd  ! 279: LDUH_I	lduh	[%r16 + 0x00bd], %r30
	.word 0xfb1dc000  ! 283: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xfc1c610c  ! 288: LDD_I	ldd	[%r17 + 0x010c], %r30
	.word 0x9194a0c1  ! 291: WRPR_PIL_I	wrpr	%r18, 0x00c1, %pil
	.word 0xf20421a7  ! 292: LDUW_I	lduw	[%r16 + 0x01a7], %r25
	setx	data_start_6, %g1, %r20
	.word 0xf245211e  ! 296: LDSW_I	ldsw	[%r20 + 0x011e], %r25
	.word 0xb7520000  ! 297: RDPR_PIL	<illegal instruction>
	.word 0xff1cc000  ! 299: LDDF_R	ldd	[%r19, %r0], %f31
	setx	0x20313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 301: RDPR_PSTATE	<illegal instruction>
	.word 0xb9520000  ! 305: RDPR_PIL	<illegal instruction>
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 308: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf64420d4  ! 309: LDSW_I	ldsw	[%r16 + 0x00d4], %r27
	.word 0xbac4a072  ! 311: ADDCcc_I	addccc 	%r18, 0x0072, %r29
	.word 0xb1540000  ! 313: RDPR_GL	<illegal instruction>
	.word 0xfe4c619a  ! 320: LDSB_I	ldsb	[%r17 + 0x019a], %r31
	.word 0xf44dc000  ! 321: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xb950c000  ! 322: RDPR_TT	<illegal instruction>
	.word 0xf25dc000  ! 326: LDX_R	ldx	[%r23 + %r0], %r25
	setx	0x2022c, %g1, %o0
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
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91cc000  ! 340: LDDF_R	ldd	[%r19, %r0], %f28
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf044a119  ! 342: LDSW_I	ldsw	[%r18 + 0x0119], %r24
	setx	data_start_1, %g1, %r18
	.word 0xf214a0b8  ! 346: LDUH_I	lduh	[%r18 + 0x00b8], %r25
	.word 0xbd520000  ! 348: RDPR_PIL	<illegal instruction>
	.word 0xb1359000  ! 349: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf00d2121  ! 350: LDUB_I	ldub	[%r20 + 0x0121], %r24
	.word 0xfe55a0a6  ! 351: LDSH_I	ldsh	[%r22 + 0x00a6], %r31
	.word 0xfe1c0000  ! 352: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xb9508000  ! 357: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r18
	.word 0xf215c000  ! 365: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xb17c2401  ! 366: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xf80c0000  ! 367: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf25dc000  ! 368: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xb9500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb9641800  ! 371: MOVcc_R	<illegal instruction>
	.word 0xf84c0000  ! 373: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf0052090  ! 374: LDUW_I	lduw	[%r20 + 0x0090], %r24
	.word 0xf2146180  ! 375: LDUH_I	lduh	[%r17 + 0x0180], %r25
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xb0250000  ! 386: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb204a031  ! 389: ADD_I	add 	%r18, 0x0031, %r25
	.word 0xfc054000  ! 394: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xbb51c000  ! 397: RDPR_TL	<illegal instruction>
	.word 0x899560b5  ! 400: WRPR_TICK_I	wrpr	%r21, 0x00b5, %tick
	.word 0xf25c0000  ! 401: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0x8794e094  ! 406: WRPR_TT_I	wrpr	%r19, 0x0094, %tt
	.word 0xfe540000  ! 407: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf045e0ff  ! 408: LDSW_I	ldsw	[%r23 + 0x00ff], %r24
	.word 0xf60d8000  ! 409: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xbd50c000  ! 414: RDPR_TT	<illegal instruction>
	.word 0xbb518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0x919420bd  ! 418: WRPR_PIL_I	wrpr	%r16, 0x00bd, %pil
	setx	0x3030a, %g1, %o0
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
	.word 0xfc45a0b5  ! 429: LDSW_I	ldsw	[%r22 + 0x00b5], %r30
	.word 0xfc0dc000  ! 432: LDUB_R	ldub	[%r23 + %r0], %r30
	setx	data_start_6, %g1, %r23
	.word 0xf01dc000  ! 434: LDD_R	ldd	[%r23 + %r0], %r24
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0150000  ! 436: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb1504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0xbd2c9000  ! 442: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xb7508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0xf45d6056  ! 446: LDX_I	ldx	[%r21 + 0x0056], %r26
	.word 0xfe0d2055  ! 450: LDUB_I	ldub	[%r20 + 0x0055], %r31
	.word 0xfc1d8000  ! 451: LDD_R	ldd	[%r22 + %r0], %r30
	setx	0x20304, %g1, %o0
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
	setx	0x2010c, %g1, %o0
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
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	.word 0xfe154000  ! 472: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xfa1ca15d  ! 474: LDD_I	ldd	[%r18 + 0x015d], %r29
	.word 0xb8850000  ! 477: ADDcc_R	addcc 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf60c2043  ! 483: LDUB_I	ldub	[%r16 + 0x0043], %r27
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 488: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf84c60a8  ! 491: LDSB_I	ldsb	[%r17 + 0x00a8], %r28
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942051  ! 496: WRPR_TPC_I	wrpr	%r16, 0x0051, %tpc
	.word 0xf44cc000  ! 497: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xb1500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xfe54c000  ! 503: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xfb1de1d4  ! 505: LDDF_I	ldd	[%r23, 0x01d4], %f29
	.word 0xb41c21ea  ! 506: XOR_I	xor 	%r16, 0x01ea, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983bcb  ! 507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bcb, %hpstate
	.word 0xb350c000  ! 510: RDPR_TT	rdpr	%tt, %r25
	.word 0xb3520000  ! 511: RDPR_PIL	<illegal instruction>
	.word 0xf6558000  ! 514: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xbaa46186  ! 517: SUBcc_I	subcc 	%r17, 0x0186, %r29
	.word 0xb37d8400  ! 519: MOVR_R	movre	%r22, %r0, %r25
	.word 0xfc450000  ! 520: LDSW_R	ldsw	[%r20 + %r0], %r30
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c8000  ! 524: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfa0c8000  ! 526: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf80c8000  ! 539: LDUB_R	ldub	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983e81  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e81, %hpstate
	.word 0xbb518000  ! 544: RDPR_PSTATE	<illegal instruction>
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6144000  ! 551: OR_R	or 	%r17, %r0, %r27
	.word 0x89942173  ! 552: WRPR_TICK_I	wrpr	%r16, 0x0173, %tick
	.word 0xf61c60bd  ! 556: LDD_I	ldd	[%r17 + 0x00bd], %r27
	.word 0xb845a1ca  ! 558: ADDC_I	addc 	%r22, 0x01ca, %r28
	.word 0x899561ab  ! 561: WRPR_TICK_I	wrpr	%r21, 0x01ab, %tick
	.word 0xb6b40000  ! 562: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xfe4c6087  ! 565: LDSB_I	ldsb	[%r17 + 0x0087], %r31
	.word 0x87946004  ! 567: WRPR_TT_I	wrpr	%r17, 0x0004, %tt
	.word 0xfb1cc000  ! 568: LDDF_R	ldd	[%r19, %r0], %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0xb8856112  ! 570: ADDcc_I	addcc 	%r21, 0x0112, %r28
	.word 0xf11ce09a  ! 573: LDDF_I	ldd	[%r19, 0x009a], %f24
	.word 0xf80d4000  ! 575: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xfe154000  ! 576: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf64d21f9  ! 579: LDSB_I	ldsb	[%r20 + 0x01f9], %r27
	.word 0xb6b48000  ! 580: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0xfe05607f  ! 581: LDUW_I	lduw	[%r21 + 0x007f], %r31
	.word 0xb5540000  ! 584: RDPR_GL	<illegal instruction>
	.word 0xf814c000  ! 585: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf40de056  ! 587: LDUB_I	ldub	[%r23 + 0x0056], %r26
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 589: RDPR_TICK	<illegal instruction>
	.word 0xf25d613c  ! 590: LDX_I	ldx	[%r21 + 0x013c], %r25
	.word 0xbf34c000  ! 591: SRL_R	srl 	%r19, %r0, %r31
	.word 0xf204a10a  ! 592: LDUW_I	lduw	[%r18 + 0x010a], %r25
	.word 0xbf540000  ! 594: RDPR_GL	<illegal instruction>
	setx	0x3011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d942024  ! 597: WRPR_PSTATE_I	wrpr	%r16, 0x0024, %pstate
	.word 0xf4052052  ! 601: LDUW_I	lduw	[%r20 + 0x0052], %r26
	.word 0xf91dc000  ! 602: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xfe4da0a6  ! 608: LDSB_I	ldsb	[%r22 + 0x00a6], %r31
	setx	data_start_1, %g1, %r19
	.word 0x8795e18e  ! 611: WRPR_TT_I	wrpr	%r23, 0x018e, %tt
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0440000  ! 613: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf205a02f  ! 615: LDUW_I	lduw	[%r22 + 0x002f], %r25
	.word 0xb3518000  ! 618: RDPR_PSTATE	<illegal instruction>
	.word 0xf91d613d  ! 625: LDDF_I	ldd	[%r21, 0x013d], %f28
	.word 0xfa1c8000  ! 627: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xf44da0ce  ! 630: LDSB_I	ldsb	[%r22 + 0x00ce], %r26
	.word 0xb60dc000  ! 632: AND_R	and 	%r23, %r0, %r27
	.word 0xb9518000  ! 634: RDPR_PSTATE	<illegal instruction>
	.word 0xf11cc000  ! 638: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xf005e087  ! 643: LDUW_I	lduw	[%r23 + 0x0087], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4b44000  ! 664: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0x8994e0f9  ! 665: WRPR_TICK_I	wrpr	%r19, 0x00f9, %tick
	.word 0xb2b4611c  ! 667: SUBCcc_I	orncc 	%r17, 0x011c, %r25
	.word 0x8595e06b  ! 672: WRPR_TSTATE_I	wrpr	%r23, 0x006b, %tstate
	.word 0xf21d8000  ! 674: LDD_R	ldd	[%r22 + %r0], %r25
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3dd000  ! 677: SRAX_R	srax	%r23, %r0, %r31
	setx	data_start_7, %g1, %r23
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995618e  ! 682: WRPR_TICK_I	wrpr	%r21, 0x018e, %tick
	.word 0xbabd8000  ! 684: XNORcc_R	xnorcc 	%r22, %r0, %r29
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc45e178  ! 688: LDSW_I	ldsw	[%r23 + 0x0178], %r30
	.word 0xb950c000  ! 689: RDPR_TT	<illegal instruction>
	.word 0xfc5c6171  ! 691: LDX_I	ldx	[%r17 + 0x0171], %r30
	.word 0xfa1ce02e  ! 692: LDD_I	ldd	[%r19 + 0x002e], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c0000  ! 696: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf0554000  ! 703: LDSH_R	ldsh	[%r21 + %r0], %r24
	setx	0x32f, %g1, %o0
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
	.word 0xba34c000  ! 712: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xb1520000  ! 720: RDPR_PIL	<illegal instruction>
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc54e037  ! 724: LDSH_I	ldsh	[%r19 + 0x0037], %r30
	.word 0xbb50c000  ! 730: RDPR_TT	<illegal instruction>
	.word 0xf21c6043  ! 732: LDD_I	ldd	[%r17 + 0x0043], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982a09  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a09, %hpstate
	.word 0xf445219a  ! 739: LDSW_I	ldsw	[%r20 + 0x019a], %r26
	.word 0xf655e1aa  ! 741: LDSH_I	ldsh	[%r23 + 0x01aa], %r27
	.word 0xf2440000  ! 745: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xb4adc000  ! 749: ANDNcc_R	andncc 	%r23, %r0, %r26
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00c2083  ! 753: LDUB_I	ldub	[%r16 + 0x0083], %r24
	.word 0xb351c000  ! 754: RDPR_TL	<illegal instruction>
	.word 0xf80da0cc  ! 755: LDUB_I	ldub	[%r22 + 0x00cc], %r28
	.word 0xf85d0000  ! 756: LDX_R	ldx	[%r20 + %r0], %r28
	setx	data_start_3, %g1, %r18
	.word 0xf0552025  ! 758: LDSH_I	ldsh	[%r20 + 0x0025], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8395e118  ! 767: WRPR_TNPC_I	wrpr	%r23, 0x0118, %tnpc
	setx	data_start_3, %g1, %r18
	.word 0xf0544000  ! 769: LDSH_R	ldsh	[%r17 + %r0], %r24
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a1fd  ! 771: WRPR_TT_I	wrpr	%r18, 0x01fd, %tt
	.word 0xfe4cc000  ! 774: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf31d8000  ! 775: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf655a10d  ! 776: LDSH_I	ldsh	[%r22 + 0x010d], %r27
	.word 0xf245203e  ! 781: LDSW_I	ldsw	[%r20 + 0x003e], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xf04c20f3  ! 788: LDSB_I	ldsb	[%r16 + 0x00f3], %r24
	.word 0xbf480000  ! 789: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf81cc000  ! 790: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xb01c2068  ! 793: XOR_I	xor 	%r16, 0x0068, %r24
	setx	0x2000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d2068  ! 796: LDSB_I	ldsb	[%r20 + 0x0068], %r31
	.word 0xbcbd2009  ! 797: XNORcc_I	xnorcc 	%r20, 0x0009, %r30
	mov	0, %r14
	.word 0xa193a000  ! 798: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1da1e2  ! 803: LDDF_I	ldd	[%r22, 0x01e2], %f29
	.word 0xfe04e0be  ! 804: LDUW_I	lduw	[%r19 + 0x00be], %r31
	.word 0xb5518000  ! 806: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfc0dc000  ! 815: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf6154000  ! 820: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf254c000  ! 821: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0x8395610b  ! 823: WRPR_TNPC_I	wrpr	%r21, 0x010b, %tnpc
	.word 0xf44d4000  ! 825: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xfe0c4000  ! 829: LDUB_R	ldub	[%r17 + %r0], %r31
	setx	0x1032d, %g1, %o0
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
	.word 0xf91c209f  ! 836: LDDF_I	ldd	[%r16, 0x009f], %f28
	.word 0xbd510000  ! 839: RDPR_TICK	<illegal instruction>
	.word 0x8394e196  ! 841: WRPR_TNPC_I	wrpr	%r19, 0x0196, %tnpc
	.word 0xf01d610b  ! 843: LDD_I	ldd	[%r21 + 0x010b], %r24
	.word 0xbb518000  ! 844: RDPR_PSTATE	<illegal instruction>
	.word 0xb00d218a  ! 846: AND_I	and 	%r20, 0x018a, %r24
	.word 0xf65521c9  ! 847: LDSH_I	ldsh	[%r20 + 0x01c9], %r27
	.word 0xb9480000  ! 848: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf91ce059  ! 855: LDDF_I	ldd	[%r19, 0x0059], %f28
	.word 0x87946034  ! 857: WRPR_TT_I	wrpr	%r17, 0x0034, %tt
	.word 0xf01ca0d8  ! 861: LDD_I	ldd	[%r18 + 0x00d8], %r24
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb224609b  ! 865: SUB_I	sub 	%r17, 0x009b, %r25
	.word 0xbf510000  ! 869: RDPR_TICK	<illegal instruction>
	.word 0xfb1ca1c0  ! 874: LDDF_I	ldd	[%r18, 0x01c0], %f29
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf055e176  ! 877: LDSH_I	ldsh	[%r23 + 0x0176], %r24
	.word 0xbaad2195  ! 878: ANDNcc_I	andncc 	%r20, 0x0195, %r29
	.word 0xfc15e1c3  ! 881: LDUH_I	lduh	[%r23 + 0x01c3], %r30
	mov	0, %r12
	.word 0x8f932000  ! 882: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa4d8000  ! 883: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf64ca198  ! 884: LDSB_I	ldsb	[%r18 + 0x0198], %r27
	.word 0xfc0c8000  ! 893: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xb1346001  ! 896: SRL_I	srl 	%r17, 0x0001, %r24
	.word 0xb9518000  ! 897: RDPR_PSTATE	<illegal instruction>
	.word 0xf11da103  ! 903: LDDF_I	ldd	[%r22, 0x0103], %f24
	.word 0xb9500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xfc550000  ! 906: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf245c000  ! 909: LDSW_R	ldsw	[%r23 + %r0], %r25
	setx	data_start_7, %g1, %r20
	.word 0x8d95e05f  ! 912: WRPR_PSTATE_I	wrpr	%r23, 0x005f, %pstate
	.word 0xb6440000  ! 914: ADDC_R	addc 	%r16, %r0, %r27
	setx	0x2010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe04c000  ! 918: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf204a17a  ! 922: LDUW_I	lduw	[%r18 + 0x017a], %r25
	setx	0x30223, %g1, %o0
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
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf34e001  ! 930: SRL_I	srl 	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80c615e  ! 941: LDUB_I	ldub	[%r17 + 0x015e], %r28
	.word 0xfe550000  ! 947: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xb83d8000  ! 949: XNOR_R	xnor 	%r22, %r0, %r28
	.word 0xf445c000  ! 953: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xb43de1a2  ! 954: XNOR_I	xnor 	%r23, 0x01a2, %r26
	.word 0xb5540000  ! 955: RDPR_GL	<illegal instruction>
	.word 0xf91d0000  ! 957: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf245615c  ! 959: LDSW_I	ldsw	[%r21 + 0x015c], %r25
	.word 0xf25c8000  ! 960: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf80420fe  ! 961: LDUW_I	lduw	[%r16 + 0x00fe], %r28
	.word 0xb550c000  ! 962: RDPR_TT	<illegal instruction>
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc14a104  ! 965: LDUH_I	lduh	[%r18 + 0x0104], %r30
	.word 0xb5508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e136  ! 970: WRPR_PSTATE_I	wrpr	%r19, 0x0136, %pstate
	.word 0xb1500000  ! 973: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d2122  ! 982: LDUB_I	ldub	[%r20 + 0x0122], %r28
	.word 0xb014a1dd  ! 984: OR_I	or 	%r18, 0x01dd, %r24
	mov	2, %r14
	.word 0xa193a000  ! 986: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5504000  ! 992: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf65c4000  ! 993: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf815a093  ! 996: LDUH_I	lduh	[%r22 + 0x0093], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983e09  ! 997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e09, %hpstate
	.word 0x8595a103  ! 999: WRPR_TSTATE_I	wrpr	%r22, 0x0103, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 1000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xb1518000  ! 1001: RDPR_PSTATE	<illegal instruction>
	.word 0xf40521d8  ! 1002: LDUW_I	lduw	[%r20 + 0x01d8], %r26
	.word 0xf0452125  ! 1003: LDSW_I	ldsw	[%r20 + 0x0125], %r24
	.word 0xb4a4c000  ! 1005: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xf60d4000  ! 1006: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfc554000  ! 1007: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf84d4000  ! 1008: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf6048000  ! 1009: LDUW_R	lduw	[%r18 + %r0], %r27
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0c2110  ! 1013: LDUB_I	ldub	[%r16 + 0x0110], %r31
	.word 0x859460a5  ! 1015: WRPR_TSTATE_I	wrpr	%r17, 0x00a5, %tstate
	.word 0xf65521a9  ! 1016: LDSH_I	ldsh	[%r20 + 0x01a9], %r27
	.word 0xfa05a0b8  ! 1019: LDUW_I	lduw	[%r22 + 0x00b8], %r29
	.word 0x8994a0b3  ! 1020: WRPR_TICK_I	wrpr	%r18, 0x00b3, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1022: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc850000  ! 1023: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xb0bd8000  ! 1026: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xf414c000  ! 1027: LDUH_R	lduh	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf415c000  ! 1029: LDUH_R	lduh	[%r23 + %r0], %r26
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf654e078  ! 1036: LDSH_I	ldsh	[%r19 + 0x0078], %r27
	.word 0xf8056042  ! 1037: LDUW_I	lduw	[%r21 + 0x0042], %r28
	.word 0xb6a52102  ! 1040: SUBcc_I	subcc 	%r20, 0x0102, %r27
	.word 0xf85d61b8  ! 1048: LDX_I	ldx	[%r21 + 0x01b8], %r28
	.word 0xf80c610a  ! 1049: LDUB_I	ldub	[%r17 + 0x010a], %r28
	.word 0xf24cc000  ! 1051: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xb5520000  ! 1053: RDPR_PIL	<illegal instruction>
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0x87946036  ! 1057: WRPR_TT_I	wrpr	%r17, 0x0036, %tt
	.word 0xfc55c000  ! 1058: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf014c000  ! 1062: LDUH_R	lduh	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982f91  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f91, %hpstate
	.word 0xf85d4000  ! 1070: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf41c0000  ! 1076: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf004c000  ! 1078: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xbb518000  ! 1084: RDPR_PSTATE	<illegal instruction>
	.word 0xf6450000  ! 1086: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe1d0000  ! 1087: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xf64de14a  ! 1089: LDSB_I	ldsb	[%r23 + 0x014a], %r27
	.word 0xb3508000  ! 1091: RDPR_TSTATE	<illegal instruction>
	.word 0xfc548000  ! 1093: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfe140000  ! 1095: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb7518000  ! 1097: RDPR_PSTATE	<illegal instruction>
	.word 0x81952147  ! 1100: WRPR_TPC_I	wrpr	%r20, 0x0147, %tpc
	.word 0xfa4cc000  ! 1103: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xfe5c4000  ! 1106: LDX_R	ldx	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194a0bf  ! 1110: WRPR_PIL_I	wrpr	%r18, 0x00bf, %pil
	.word 0xb2a5a011  ! 1112: SUBcc_I	subcc 	%r22, 0x0011, %r25
	.word 0xf2448000  ! 1113: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfe5d2124  ! 1114: LDX_I	ldx	[%r20 + 0x0124], %r31
	.word 0xf81c8000  ! 1116: LDD_R	ldd	[%r18 + %r0], %r28
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 1121: RDPR_TICK	<illegal instruction>
	.word 0xf60d0000  ! 1123: LDUB_R	ldub	[%r20 + %r0], %r27
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21da19d  ! 1126: LDD_I	ldd	[%r22 + 0x019d], %r25
	.word 0xb7540000  ! 1128: RDPR_GL	<illegal instruction>
	.word 0xfa046118  ! 1132: LDUW_I	lduw	[%r17 + 0x0118], %r29
	.word 0xf61da144  ! 1134: LDD_I	ldd	[%r22 + 0x0144], %r27
	.word 0xbd50c000  ! 1137: RDPR_TT	<illegal instruction>
	.word 0xf404e150  ! 1139: LDUW_I	lduw	[%r19 + 0x0150], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983853  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1853, %hpstate
	.word 0xf40cc000  ! 1144: LDUB_R	ldub	[%r19 + %r0], %r26
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 1148: MOVcc_I	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xb151c000  ! 1150: RDPR_TL	<illegal instruction>
	.word 0xfa1d4000  ! 1154: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xb1508000  ! 1155: RDPR_TSTATE	<illegal instruction>
	.word 0xf51d608d  ! 1156: LDDF_I	ldd	[%r21, 0x008d], %f26
	.word 0xb350c000  ! 1157: RDPR_TT	<illegal instruction>
	.word 0xff1dc000  ! 1158: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xb2acc000  ! 1159: ANDNcc_R	andncc 	%r19, %r0, %r25
	.word 0xf80c8000  ! 1162: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xfc1de12f  ! 1165: LDD_I	ldd	[%r23 + 0x012f], %r30
	.word 0xf2558000  ! 1170: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xbb480000  ! 1174: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8595a04f  ! 1177: WRPR_TSTATE_I	wrpr	%r22, 0x004f, %tstate
	setx	0x208, %g1, %o0
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
	.word 0xbd518000  ! 1185: RDPR_PSTATE	<illegal instruction>
	.word 0xf84cc000  ! 1186: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xfc448000  ! 1188: LDSW_R	ldsw	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982a1b  ! 1190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0xfe4d61a0  ! 1192: LDSB_I	ldsb	[%r21 + 0x01a0], %r31
	.word 0xf51d4000  ! 1193: LDDF_R	ldd	[%r21, %r0], %f26
	mov	1, %r12
	.word 0x8f932000  ! 1195: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc05c000  ! 1196: ADD_R	add 	%r23, %r0, %r30
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52df001  ! 1199: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0x8594e0e4  ! 1201: WRPR_TSTATE_I	wrpr	%r19, 0x00e4, %tstate
	.word 0xb1520000  ! 1206: RDPR_PIL	<illegal instruction>
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf654e1bb  ! 1212: LDSH_I	ldsh	[%r19 + 0x01bb], %r27
	.word 0x899561c9  ! 1213: WRPR_TICK_I	wrpr	%r21, 0x01c9, %tick
	.word 0xfc0dc000  ! 1215: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfa1c8000  ! 1216: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xf85d612b  ! 1217: LDX_I	ldx	[%r21 + 0x012b], %r28
	.word 0xb69dc000  ! 1220: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0x9195219c  ! 1221: WRPR_PIL_I	wrpr	%r20, 0x019c, %pil
	.word 0xb5520000  ! 1222: RDPR_PIL	<illegal instruction>
	.word 0xfd1c0000  ! 1224: LDDF_R	ldd	[%r16, %r0], %f30
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942171  ! 1232: WRPR_TT_I	wrpr	%r16, 0x0171, %tt
	.word 0xf8146091  ! 1237: LDUH_I	lduh	[%r17 + 0x0091], %r28
	.word 0xfc55a11c  ! 1239: LDSH_I	ldsh	[%r22 + 0x011c], %r30
	.word 0xfc554000  ! 1240: LDSH_R	ldsh	[%r21 + %r0], %r30
	setx	data_start_2, %g1, %r21
	.word 0xb9355000  ! 1245: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xfc454000  ! 1251: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf81de02b  ! 1253: LDD_I	ldd	[%r23 + 0x002b], %r28
	.word 0xb41d617e  ! 1254: XOR_I	xor 	%r21, 0x017e, %r26
	.word 0x8995a01c  ! 1257: WRPR_TICK_I	wrpr	%r22, 0x001c, %tick
	.word 0xb03c603f  ! 1259: XNOR_I	xnor 	%r17, 0x003f, %r24
	.word 0xbd641800  ! 1260: MOVcc_R	<illegal instruction>
	.word 0xfc440000  ! 1262: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0x8795211c  ! 1268: WRPR_TT_I	wrpr	%r20, 0x011c, %tt
	.word 0xb7510000  ! 1272: RDPR_TICK	<illegal instruction>
	.word 0xb351c000  ! 1273: RDPR_TL	<illegal instruction>
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a147  ! 1279: WRPR_PIL_I	wrpr	%r18, 0x0147, %pil
	.word 0xf455a0f3  ! 1280: LDSH_I	ldsh	[%r22 + 0x00f3], %r26
	.word 0xf65cc000  ! 1281: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xbf508000  ! 1282: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 1284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf21c0000  ! 1285: LDD_R	ldd	[%r16 + %r0], %r25
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 1293: RDPR_PIL	<illegal instruction>
	.word 0xfe4cc000  ! 1295: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf00c6133  ! 1297: LDUB_I	ldub	[%r17 + 0x0133], %r24
	.word 0xfe456040  ! 1298: LDSW_I	ldsw	[%r21 + 0x0040], %r31
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb17cc400  ! 1306: MOVR_R	movre	%r19, %r0, %r24
	.word 0xfe04a160  ! 1308: LDUW_I	lduw	[%r18 + 0x0160], %r31
	.word 0xf8148000  ! 1309: LDUH_R	lduh	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	.word 0xf4454000  ! 1316: LDSW_R	ldsw	[%r21 + %r0], %r26
	mov	0, %r12
	.word 0x8f932000  ! 1318: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3508000  ! 1319: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8595a1d7  ! 1325: WRPR_TSTATE_I	wrpr	%r22, 0x01d7, %tstate
	.word 0xf2050000  ! 1327: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xbe0dc000  ! 1330: AND_R	and 	%r23, %r0, %r31
	.word 0xf4546195  ! 1331: LDSH_I	ldsh	[%r17 + 0x0195], %r26
	.word 0x9194615f  ! 1332: WRPR_PIL_I	wrpr	%r17, 0x015f, %pil
	.word 0xb6c44000  ! 1334: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xfa4da002  ! 1337: LDSB_I	ldsb	[%r22 + 0x0002], %r29
	.word 0xfe5c6172  ! 1338: LDX_I	ldx	[%r17 + 0x0172], %r31
	.word 0xfb1c8000  ! 1340: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xfe44a10e  ! 1343: LDSW_I	ldsw	[%r18 + 0x010e], %r31
	.word 0xf0154000  ! 1348: LDUH_R	lduh	[%r21 + %r0], %r24
	mov	1, %r12
	.word 0x8f932000  ! 1350: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8052178  ! 1351: LDUW_I	lduw	[%r20 + 0x0178], %r28
	.word 0xb8b4c000  ! 1352: SUBCcc_R	orncc 	%r19, %r0, %r28
	setx	data_start_3, %g1, %r19
	.word 0xb9480000  ! 1357: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb83d4000  ! 1358: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xfd1d4000  ! 1360: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf61cc000  ! 1361: LDD_R	ldd	[%r19 + %r0], %r27
	setx	0x329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d8000  ! 1365: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf8446094  ! 1366: LDSW_I	ldsw	[%r17 + 0x0094], %r28
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1369: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf60c21b4  ! 1370: LDUB_I	ldub	[%r16 + 0x01b4], %r27
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45da0d0  ! 1373: LDX_I	ldx	[%r22 + 0x00d0], %r26
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a168  ! 1381: WRPR_TPC_I	wrpr	%r18, 0x0168, %tpc
	.word 0xfe1cc000  ! 1382: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf04d20fe  ! 1384: LDSB_I	ldsb	[%r20 + 0x00fe], %r24
	.word 0xf11c4000  ! 1385: LDDF_R	ldd	[%r17, %r0], %f24
	mov	1, %r14
	.word 0xa193a000  ! 1386: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2556115  ! 1389: LDSH_I	ldsh	[%r21 + 0x0115], %r25
	.word 0xfb1d612c  ! 1390: LDDF_I	ldd	[%r21, 0x012c], %f29
	.word 0xf415c000  ! 1392: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0x87952183  ! 1394: WRPR_TT_I	wrpr	%r20, 0x0183, %tt
	.word 0xfc1ca1c6  ! 1398: LDD_I	ldd	[%r18 + 0x01c6], %r30
	.word 0xf31c60dd  ! 1399: LDDF_I	ldd	[%r17, 0x00dd], %f25
	.word 0xf015c000  ! 1400: LDUH_R	lduh	[%r23 + %r0], %r24
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0c4000  ! 1404: LDUB_R	ldub	[%r17 + %r0], %r30
	setx	data_start_0, %g1, %r17
	.word 0xf4148000  ! 1409: LDUH_R	lduh	[%r18 + %r0], %r26
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982959  ! 1414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 1420: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5de1cb  ! 1434: LDX_I	ldx	[%r23 + 0x01cb], %r31
	.word 0xb3540000  ! 1437: RDPR_GL	<illegal instruction>
	.word 0xb9641800  ! 1440: MOVcc_R	<illegal instruction>
	setx	0x20124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8bca11d  ! 1442: XNORcc_I	xnorcc 	%r18, 0x011d, %r28
	mov	1, %r12
	.word 0x8f932000  ! 1444: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfb1c6111  ! 1445: LDDF_I	ldd	[%r17, 0x0111], %f29
	.word 0xf81d0000  ! 1449: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf6058000  ! 1450: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf2154000  ! 1453: LDUH_R	lduh	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982e13  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e13, %hpstate
	.word 0xbc34608a  ! 1456: SUBC_I	orn 	%r17, 0x008a, %r30
	.word 0xfb1d2195  ! 1460: LDDF_I	ldd	[%r20, 0x0195], %f29
	setx	0x30211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1c614e  ! 1467: LDD_I	ldd	[%r17 + 0x014e], %r31
	.word 0xfc4ca0b3  ! 1471: LDSB_I	ldsb	[%r18 + 0x00b3], %r30
	setx	0x30023, %g1, %o0
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
	.word 0xf04d8000  ! 1480: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf44d8000  ! 1482: LDSB_R	ldsb	[%r22 + %r0], %r26
	setx	data_start_7, %g1, %r23
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1dc000  ! 1489: LDD_R	ldd	[%r23 + %r0], %r31
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf405a084  ! 1492: LDUW_I	lduw	[%r22 + 0x0084], %r26
	.word 0x8595e0c7  ! 1502: WRPR_TSTATE_I	wrpr	%r23, 0x00c7, %tstate
	mov	0, %r14
	.word 0xa193a000  ! 1503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 1507: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 1508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0x81946163  ! 1511: WRPR_TPC_I	wrpr	%r17, 0x0163, %tpc
	.word 0xb1508000  ! 1513: RDPR_TSTATE	<illegal instruction>
	.word 0xfe15a093  ! 1514: LDUH_I	lduh	[%r22 + 0x0093], %r31
	.word 0xbb2cb001  ! 1518: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0x83942048  ! 1522: WRPR_TNPC_I	wrpr	%r16, 0x0048, %tnpc
	.word 0xf41d6084  ! 1525: LDD_I	ldd	[%r21 + 0x0084], %r26
	.word 0xb5351000  ! 1526: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xf21c607d  ! 1527: LDD_I	ldd	[%r17 + 0x007d], %r25
	.word 0xfe0d4000  ! 1529: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xb1520000  ! 1532: RDPR_PIL	<illegal instruction>
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 1541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf21d4000  ! 1542: LDD_R	ldd	[%r21 + %r0], %r25
	.word 0xf00d8000  ! 1544: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xfa0d2077  ! 1545: LDUB_I	ldub	[%r20 + 0x0077], %r29
	.word 0xb03d6101  ! 1547: XNOR_I	xnor 	%r21, 0x0101, %r24
	.word 0xf60de1ca  ! 1548: LDUB_I	ldub	[%r23 + 0x01ca], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983941  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1941, %hpstate
	.word 0xfe5c0000  ! 1552: LDX_R	ldx	[%r16 + %r0], %r31
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5d8000  ! 1556: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0x8d9420c1  ! 1557: WRPR_PSTATE_I	wrpr	%r16, 0x00c1, %pstate
	.word 0xf8550000  ! 1558: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf0444000  ! 1559: LDSW_R	ldsw	[%r17 + %r0], %r24
	setx	data_start_1, %g1, %r23
	.word 0xfd1c615e  ! 1564: LDDF_I	ldd	[%r17, 0x015e], %f30
	.word 0xbab460f5  ! 1565: ORNcc_I	orncc 	%r17, 0x00f5, %r29
	.word 0xf71c616b  ! 1568: LDDF_I	ldd	[%r17, 0x016b], %f27
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845c000  ! 1575: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xfa45a1be  ! 1576: LDSW_I	ldsw	[%r22 + 0x01be], %r29
	.word 0x8395a192  ! 1577: WRPR_TNPC_I	wrpr	%r22, 0x0192, %tnpc
	.word 0xfc55a04d  ! 1578: LDSH_I	ldsh	[%r22 + 0x004d], %r30
	mov	2, %r14
	.word 0xa193a000  ! 1579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa148000  ! 1582: LDUH_R	lduh	[%r18 + %r0], %r29
	mov	0, %r12
	.word 0x8f932000  ! 1583: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf45d2071  ! 1587: LDX_I	ldx	[%r20 + 0x0071], %r26
	setx	data_start_7, %g1, %r23
	.word 0xf0048000  ! 1590: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xfc4d8000  ! 1591: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xf045e0bf  ! 1592: LDSW_I	ldsw	[%r23 + 0x00bf], %r24
	.word 0xb17c0400  ! 1595: MOVR_R	movre	%r16, %r0, %r24
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71c0000  ! 1602: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xf01c0000  ! 1604: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf604e0f0  ! 1605: LDUW_I	lduw	[%r19 + 0x00f0], %r27
	.word 0x9195a1cf  ! 1606: WRPR_PIL_I	wrpr	%r22, 0x01cf, %pil
	.word 0xf44de1f6  ! 1611: LDSB_I	ldsb	[%r23 + 0x01f6], %r26
	.word 0xf01c61ce  ! 1614: LDD_I	ldd	[%r17 + 0x01ce], %r24
	.word 0xfc44a14e  ! 1616: LDSW_I	ldsw	[%r18 + 0x014e], %r30
	.word 0xf44d4000  ! 1619: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xfc1c0000  ! 1621: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf055e146  ! 1622: LDSH_I	ldsh	[%r23 + 0x0146], %r24
	.word 0xf0440000  ! 1626: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf91d0000  ! 1627: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xbd50c000  ! 1630: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc05215e  ! 1635: LDUW_I	lduw	[%r20 + 0x015e], %r30
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00dc000  ! 1639: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xbf51c000  ! 1641: RDPR_TL	<illegal instruction>
	.word 0xf11da1bf  ! 1642: LDDF_I	ldd	[%r22, 0x01bf], %f24
	.word 0xf71c4000  ! 1647: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xb5342001  ! 1649: SRL_I	srl 	%r16, 0x0001, %r26
	mov	2, %r14
	.word 0xa193a000  ! 1650: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1500000  ! 1652: RDPR_TPC	<illegal instruction>
	.word 0xf64da1a7  ! 1660: LDSB_I	ldsb	[%r22 + 0x01a7], %r27
	.word 0xb5540000  ! 1661: RDPR_GL	<illegal instruction>
	.word 0xf80d2144  ! 1664: LDUB_I	ldub	[%r20 + 0x0144], %r28
	.word 0xf61c0000  ! 1667: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0x8195a189  ! 1670: WRPR_TPC_I	wrpr	%r22, 0x0189, %tpc
	.word 0xfe0d8000  ! 1672: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf60c4000  ! 1678: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0x899520f7  ! 1679: WRPR_TICK_I	wrpr	%r20, 0x00f7, %tick
	.word 0xff1da0ee  ! 1681: LDDF_I	ldd	[%r22, 0x00ee], %f31
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d4000  ! 1683: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbb518000  ! 1684: RDPR_PSTATE	<illegal instruction>
	.word 0xbb510000  ! 1685: RDPR_TICK	<illegal instruction>
	setx	0x29, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 1690: RDPR_TNPC	<illegal instruction>
	.word 0xfe1461d5  ! 1691: LDUH_I	lduh	[%r17 + 0x01d5], %r31
	setx	0x10315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 1698: LDSW_R	ldsw	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x819838d1  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d1, %hpstate
	.word 0xb82420fe  ! 1704: SUB_I	sub 	%r16, 0x00fe, %r28
	.word 0xb751c000  ! 1705: RDPR_TL	<illegal instruction>
	.word 0xb82dc000  ! 1706: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xf8050000  ! 1708: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xbd510000  ! 1709: RDPR_TICK	<illegal instruction>
	.word 0xfa4d21ec  ! 1710: LDSB_I	ldsb	[%r20 + 0x01ec], %r29
	.word 0xb37c2401  ! 1718: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xf84c4000  ! 1723: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf41da172  ! 1725: LDD_I	ldd	[%r22 + 0x0172], %r26
	.word 0xb7518000  ! 1727: RDPR_PSTATE	<illegal instruction>
	.word 0xfc5c61f5  ! 1728: LDX_I	ldx	[%r17 + 0x01f5], %r30
	.word 0xbe1ce0f4  ! 1729: XOR_I	xor 	%r19, 0x00f4, %r31
	.word 0xf6050000  ! 1732: LDUW_R	lduw	[%r20 + %r0], %r27
	setx	0x1000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41cc000  ! 1737: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb1641800  ! 1738: MOVcc_R	<illegal instruction>
	.word 0xb7480000  ! 1739: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7343001  ! 1740: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xf255612b  ! 1741: LDSH_I	ldsh	[%r21 + 0x012b], %r25
	.word 0x8d95a0a6  ! 1744: WRPR_PSTATE_I	wrpr	%r22, 0x00a6, %pstate
	.word 0xb17cc400  ! 1745: MOVR_R	movre	%r19, %r0, %r24
	.word 0xb9347001  ! 1747: SRLX_I	srlx	%r17, 0x0001, %r28
	.word 0xf21de117  ! 1749: LDD_I	ldd	[%r23 + 0x0117], %r25
	.word 0xb2c521b7  ! 1751: ADDCcc_I	addccc 	%r20, 0x01b7, %r25
	.word 0xf854c000  ! 1753: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xbd504000  ! 1754: RDPR_TNPC	<illegal instruction>
	.word 0xfa05616c  ! 1756: LDUW_I	lduw	[%r21 + 0x016c], %r29
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4c58000  ! 1766: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xf84d4000  ! 1767: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfc554000  ! 1775: LDSH_R	ldsh	[%r21 + %r0], %r30
	setx	data_start_0, %g1, %r20
	.word 0xff1dc000  ! 1778: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 1791: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0x8995e1f7  ! 1795: WRPR_TICK_I	wrpr	%r23, 0x01f7, %tick
	.word 0xb13dd000  ! 1799: SRAX_R	srax	%r23, %r0, %r24
	.word 0x85942175  ! 1800: WRPR_TSTATE_I	wrpr	%r16, 0x0175, %tstate
	.word 0xfe15a00d  ! 1801: LDUH_I	lduh	[%r22 + 0x000d], %r31
	.word 0xbd51c000  ! 1808: RDPR_TL	rdpr	%tl, %r30
	.word 0xf014a068  ! 1810: LDUH_I	lduh	[%r18 + 0x0068], %r24
	.word 0xb92d5000  ! 1811: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xf205e114  ! 1812: LDUW_I	lduw	[%r23 + 0x0114], %r25
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64c2048  ! 1823: LDSB_I	ldsb	[%r16 + 0x0048], %r27
	.word 0x8194e040  ! 1828: WRPR_TPC_I	wrpr	%r19, 0x0040, %tpc
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 1838: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc0ce0b1  ! 1839: LDUB_I	ldub	[%r19 + 0x00b1], %r30
	.word 0xfe1c0000  ! 1842: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xb5540000  ! 1844: RDPR_GL	<illegal instruction>
	.word 0xb2348000  ! 1846: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xf24d8000  ! 1851: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xba8da11d  ! 1852: ANDcc_I	andcc 	%r22, 0x011d, %r29
	.word 0xf65cc000  ! 1853: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf41c6173  ! 1854: LDD_I	ldd	[%r17 + 0x0173], %r26
	mov	0, %r14
	.word 0xa193a000  ! 1856: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf005c000  ! 1858: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfa05e129  ! 1859: LDUW_I	lduw	[%r23 + 0x0129], %r29
	.word 0xb435601d  ! 1863: ORN_I	orn 	%r21, 0x001d, %r26
	.word 0x8794e15d  ! 1869: WRPR_TT_I	wrpr	%r19, 0x015d, %tt
	.word 0xff1ce1eb  ! 1870: LDDF_I	ldd	[%r19, 0x01eb], %f31
	.word 0x83952038  ! 1871: WRPR_TNPC_I	wrpr	%r20, 0x0038, %tnpc
	.word 0xfa5d8000  ! 1873: LDX_R	ldx	[%r22 + %r0], %r29
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe45618a  ! 1876: LDSW_I	ldsw	[%r21 + 0x018a], %r31
	.word 0xf6048000  ! 1878: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb9341000  ! 1884: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xf41c60f7  ! 1886: LDD_I	ldd	[%r17 + 0x00f7], %r26
	.word 0xf2140000  ! 1889: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xbf504000  ! 1891: RDPR_TNPC	<illegal instruction>
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c61be  ! 1901: LDSB_I	ldsb	[%r17 + 0x01be], %r24
	.word 0xb8c44000  ! 1904: ADDCcc_R	addccc 	%r17, %r0, %r28
	.word 0xfb1ca02a  ! 1906: LDDF_I	ldd	[%r18, 0x002a], %f29
	.word 0xb014209a  ! 1910: OR_I	or 	%r16, 0x009a, %r24
	.word 0xbc2de1c7  ! 1914: ANDN_I	andn 	%r23, 0x01c7, %r30
	.word 0xbf35b001  ! 1924: SRLX_I	srlx	%r22, 0x0001, %r31
	.word 0xfa046049  ! 1926: LDUW_I	lduw	[%r17 + 0x0049], %r29
	.word 0xfa450000  ! 1928: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0x8995a180  ! 1932: WRPR_TICK_I	wrpr	%r22, 0x0180, %tick
	.word 0xbf500000  ! 1933: RDPR_TPC	<illegal instruction>
	.word 0xbe858000  ! 1934: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0x919461b2  ! 1941: WRPR_PIL_I	wrpr	%r17, 0x01b2, %pil
	.word 0x879460db  ! 1944: WRPR_TT_I	wrpr	%r17, 0x00db, %tt
	.word 0xf84cc000  ! 1949: LDSB_R	ldsb	[%r19 + %r0], %r28
	setx	data_start_5, %g1, %r22
	.word 0xbf480000  ! 1953: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x879560af  ! 1954: WRPR_TT_I	wrpr	%r21, 0x00af, %tt
	.word 0xbf504000  ! 1957: RDPR_TNPC	<illegal instruction>
	.word 0xf8542156  ! 1958: LDSH_I	ldsh	[%r16 + 0x0156], %r28
	.word 0xb08cc000  ! 1964: ANDcc_R	andcc 	%r19, %r0, %r24
	.word 0xbd50c000  ! 1966: RDPR_TT	<illegal instruction>
	.word 0xf61ce1a5  ! 1968: LDD_I	ldd	[%r19 + 0x01a5], %r27
	.word 0xf2044000  ! 1969: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xf64c4000  ! 1970: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfe556120  ! 1976: LDSH_I	ldsh	[%r21 + 0x0120], %r31
	.word 0xfc5ce1d3  ! 1977: LDX_I	ldx	[%r19 + 0x01d3], %r30
	.word 0xbb51c000  ! 1981: RDPR_TL	<illegal instruction>
	.word 0xbab4e1f6  ! 1982: SUBCcc_I	orncc 	%r19, 0x01f6, %r29
	.word 0xba3d0000  ! 1986: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xf44d20d8  ! 1987: LDSB_I	ldsb	[%r20 + 0x00d8], %r26
	.word 0xb4acc000  ! 1991: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xfc150000  ! 1994: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfe4c6021  ! 1997: LDSB_I	ldsb	[%r17 + 0x0021], %r31
	.word 0xf80ca09c  ! 2001: LDUB_I	ldub	[%r18 + 0x009c], %r28
	.word 0xb7540000  ! 2003: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 2005: RDPR_TPC	<illegal instruction>
	.word 0xf415e1ec  ! 2009: LDUH_I	lduh	[%r23 + 0x01ec], %r26
	.word 0x8795608c  ! 2012: WRPR_TT_I	wrpr	%r21, 0x008c, %tt
	.word 0xf054c000  ! 2018: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xf41421e9  ! 2019: LDUH_I	lduh	[%r16 + 0x01e9], %r26
	.word 0xf11d4000  ! 2021: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf80d6157  ! 2024: LDUB_I	ldub	[%r21 + 0x0157], %r28
	setx	0x129, %g1, %o0
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
	.word 0xb1518000  ! 2035: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfa0d2009  ! 2038: LDUB_I	ldub	[%r20 + 0x0009], %r29
	.word 0xf44de0f3  ! 2041: LDSB_I	ldsb	[%r23 + 0x00f3], %r26
	.word 0x8395a0f3  ! 2043: WRPR_TNPC_I	wrpr	%r22, 0x00f3, %tnpc
	.word 0xb7480000  ! 2045: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb950c000  ! 2050: RDPR_TT	<illegal instruction>
	.word 0xfa052067  ! 2051: LDUW_I	lduw	[%r20 + 0x0067], %r29
	.word 0xb93df001  ! 2057: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xfc4ce0a7  ! 2061: LDSB_I	ldsb	[%r19 + 0x00a7], %r30
	mov	1, %r12
	.word 0x8f932000  ! 2065: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2ade10c  ! 2068: ANDNcc_I	andncc 	%r23, 0x010c, %r25
	.word 0xbf510000  ! 2070: RDPR_TICK	rdpr	%tick, %r31
	.word 0xba048000  ! 2072: ADD_R	add 	%r18, %r0, %r29
	.word 0xb5500000  ! 2075: RDPR_TPC	<illegal instruction>
	.word 0xb0248000  ! 2085: SUB_R	sub 	%r18, %r0, %r24
	mov	2, %r14
	.word 0xa193a000  ! 2086: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d60e0  ! 2088: LDSB_I	ldsb	[%r21 + 0x00e0], %r31
	.word 0xfe5c6123  ! 2089: LDX_I	ldx	[%r17 + 0x0123], %r31
	.word 0xbe8c0000  ! 2091: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xfa55e1f7  ! 2092: LDSH_I	ldsh	[%r23 + 0x01f7], %r29
	.word 0xf21d2061  ! 2093: LDD_I	ldd	[%r20 + 0x0061], %r25
	.word 0x8194a1f7  ! 2094: WRPR_TPC_I	wrpr	%r18, 0x01f7, %tpc
	.word 0xf6448000  ! 2096: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xfa1d612c  ! 2097: LDD_I	ldd	[%r21 + 0x012c], %r29
	.word 0xf24ca1a4  ! 2098: LDSB_I	ldsb	[%r18 + 0x01a4], %r25
	.word 0x8594a1fc  ! 2099: WRPR_TSTATE_I	wrpr	%r18, 0x01fc, %tstate
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45da1cc  ! 2102: LDX_I	ldx	[%r22 + 0x01cc], %r26
	.word 0xff1d60d5  ! 2105: LDDF_I	ldd	[%r21, 0x00d5], %f31
	.word 0xbf518000  ! 2107: RDPR_PSTATE	<illegal instruction>
	.word 0xf805e1ba  ! 2108: LDUW_I	lduw	[%r23 + 0x01ba], %r28
	.word 0xf0450000  ! 2110: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xb1518000  ! 2111: RDPR_PSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r19
	.word 0xf2554000  ! 2116: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf45c21d7  ! 2119: LDX_I	ldx	[%r16 + 0x01d7], %r26
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0ca00d  ! 2123: LDUB_I	ldub	[%r18 + 0x000d], %r30
	.word 0x9194e07c  ! 2124: WRPR_PIL_I	wrpr	%r19, 0x007c, %pil
	.word 0xfc4d60f9  ! 2126: LDSB_I	ldsb	[%r21 + 0x00f9], %r30
	.word 0xb151c000  ! 2133: RDPR_TL	<illegal instruction>
	.word 0xf854c000  ! 2134: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf80d8000  ! 2137: LDUB_R	ldub	[%r22 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982bd9  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd9, %hpstate
	.word 0xb1540000  ! 2140: RDPR_GL	<illegal instruction>
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25cc000  ! 2144: LDX_R	ldx	[%r19 + %r0], %r25
	mov	2, %r12
	.word 0x8f932000  ! 2151: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8554000  ! 2153: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xf2058000  ! 2162: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xb1500000  ! 2163: RDPR_TPC	<illegal instruction>
	.word 0xfa14a0b1  ! 2165: LDUH_I	lduh	[%r18 + 0x00b1], %r29
	.word 0xb8b5a167  ! 2166: ORNcc_I	orncc 	%r22, 0x0167, %r28
	.word 0xfe1c0000  ! 2167: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0x8194a09b  ! 2168: WRPR_TPC_I	wrpr	%r18, 0x009b, %tpc
	.word 0xf25c8000  ! 2170: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xb625c000  ! 2172: SUB_R	sub 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a49  ! 2175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a49, %hpstate
	.word 0xb2b5a1a6  ! 2176: ORNcc_I	orncc 	%r22, 0x01a6, %r25
	.word 0xf804e0b0  ! 2177: LDUW_I	lduw	[%r19 + 0x00b0], %r28
	.word 0xfc0561db  ! 2178: LDUW_I	lduw	[%r21 + 0x01db], %r30
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81946012  ! 2183: WRPR_TPC_I	wrpr	%r17, 0x0012, %tpc
	.word 0x8194a0f0  ! 2184: WRPR_TPC_I	wrpr	%r18, 0x00f0, %tpc
	.word 0xf2144000  ! 2186: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xfd1c0000  ! 2187: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xb5518000  ! 2190: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982813  ! 2198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0813, %hpstate
	.word 0xf41461d5  ! 2202: LDUH_I	lduh	[%r17 + 0x01d5], %r26
	.word 0xf51de078  ! 2206: LDDF_I	ldd	[%r23, 0x0078], %f26
	.word 0xf005e130  ! 2208: LDUW_I	lduw	[%r23 + 0x0130], %r24
	.word 0xf51c2164  ! 2210: LDDF_I	ldd	[%r16, 0x0164], %f26
	.word 0xf4558000  ! 2211: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xb1480000  ! 2212: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb2c5209a  ! 2214: ADDCcc_I	addccc 	%r20, 0x009a, %r25
	.word 0xf61c0000  ! 2216: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf854e180  ! 2224: LDSH_I	ldsh	[%r19 + 0x0180], %r28
	.word 0xf40cc000  ! 2225: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb351c000  ! 2229: RDPR_TL	<illegal instruction>
	setx	0x3031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 2233: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf2d0000  ! 2236: SLL_R	sll 	%r20, %r0, %r31
	.word 0xf615e113  ! 2239: LDUH_I	lduh	[%r23 + 0x0113], %r27
	.word 0xf51c8000  ! 2240: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf6044000  ! 2242: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xfe5d6149  ! 2243: LDX_I	ldx	[%r21 + 0x0149], %r31
	.word 0xf40461da  ! 2244: LDUW_I	lduw	[%r17 + 0x01da], %r26
	.word 0xb3504000  ! 2247: RDPR_TNPC	<illegal instruction>
	.word 0xfe1d61cf  ! 2249: LDD_I	ldd	[%r21 + 0x01cf], %r31
	mov	0, %r12
	.word 0x8f932000  ! 2251: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf0158000  ! 2252: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf005e055  ! 2255: LDUW_I	lduw	[%r23 + 0x0055], %r24
	.word 0x8794603a  ! 2257: WRPR_TT_I	wrpr	%r17, 0x003a, %tt
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba8521b3  ! 2260: ADDcc_I	addcc 	%r20, 0x01b3, %r29
	.word 0xb7518000  ! 2261: RDPR_PSTATE	rdpr	%pstate, %r27
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60420cd  ! 2265: LDUW_I	lduw	[%r16 + 0x00cd], %r27
	.word 0xf60d8000  ! 2267: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xfe5c0000  ! 2272: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xfe4c4000  ! 2273: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf0058000  ! 2275: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xfc0ca0e4  ! 2276: LDUB_I	ldub	[%r18 + 0x00e4], %r30
	setx	0x30027, %g1, %o0
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
	.word 0xfa144000  ! 2281: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf445e032  ! 2282: LDSW_I	ldsw	[%r23 + 0x0032], %r26
	.word 0xf81dc000  ! 2286: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xbf7d4400  ! 2290: MOVR_R	movre	%r21, %r0, %r31
	.word 0x8794e062  ! 2291: WRPR_TT_I	wrpr	%r19, 0x0062, %tt
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0d8000  ! 2295: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf045a1f3  ! 2296: LDSW_I	ldsw	[%r22 + 0x01f3], %r24
	.word 0xf01c21ac  ! 2299: LDD_I	ldd	[%r16 + 0x01ac], %r24
	.word 0xfe4521b0  ! 2300: LDSW_I	ldsw	[%r20 + 0x01b0], %r31
	.word 0xfc1c4000  ! 2302: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xf24da0c2  ! 2306: LDSB_I	ldsb	[%r22 + 0x00c2], %r25
	.word 0x8d942092  ! 2307: WRPR_PSTATE_I	wrpr	%r16, 0x0092, %pstate
	setx	0x30113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc05c000  ! 2310: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xba1cc000  ! 2311: XOR_R	xor 	%r19, %r0, %r29
	.word 0xb150c000  ! 2312: RDPR_TT	<illegal instruction>
	.word 0xb0bc4000  ! 2313: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xf45c0000  ! 2314: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xba354000  ! 2315: SUBC_R	orn 	%r21, %r0, %r29
	.word 0xf605e1b2  ! 2316: LDUW_I	lduw	[%r23 + 0x01b2], %r27
	.word 0xf41c8000  ! 2320: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0x89952026  ! 2327: WRPR_TICK_I	wrpr	%r20, 0x0026, %tick
	.word 0xfe0461db  ! 2329: LDUW_I	lduw	[%r17 + 0x01db], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982949  ! 2330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	.word 0xb81d0000  ! 2333: XOR_R	xor 	%r20, %r0, %r28
	.word 0xf45c603a  ! 2334: LDX_I	ldx	[%r17 + 0x003a], %r26
	.word 0xf04c4000  ! 2335: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xb00ce1ec  ! 2336: AND_I	and 	%r19, 0x01ec, %r24
	.word 0xfe44a003  ! 2340: LDSW_I	ldsw	[%r18 + 0x0003], %r31
	.word 0xbe1560bc  ! 2341: OR_I	or 	%r21, 0x00bc, %r31
	.word 0xf05da112  ! 2344: LDX_I	ldx	[%r22 + 0x0112], %r24
	.word 0xbf504000  ! 2346: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf11c6068  ! 2347: LDDF_I	ldd	[%r17, 0x0068], %f24
	.word 0xbc358000  ! 2349: SUBC_R	orn 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf604209e  ! 2352: LDUW_I	lduw	[%r16 + 0x009e], %r27
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1c4000  ! 2354: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf51da074  ! 2356: LDDF_I	ldd	[%r22, 0x0074], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982e0b  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0b, %hpstate
	.word 0xf85cc000  ! 2365: LDX_R	ldx	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf64cc000  ! 2367: LDSB_R	ldsb	[%r19 + %r0], %r27
	setx	0x30112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1c2008  ! 2369: LDD_I	ldd	[%r16 + 0x0008], %r29
	.word 0xb5504000  ! 2371: RDPR_TNPC	<illegal instruction>
	.word 0xf91c61c2  ! 2375: LDDF_I	ldd	[%r17, 0x01c2], %f28
	.word 0xb5540000  ! 2376: RDPR_GL	<illegal instruction>
	.word 0x91952065  ! 2378: WRPR_PIL_I	wrpr	%r20, 0x0065, %pil
	.word 0xf4440000  ! 2380: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf0456043  ! 2381: LDSW_I	ldsw	[%r21 + 0x0043], %r24
	.word 0xf204c000  ! 2382: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xb9518000  ! 2383: RDPR_PSTATE	rdpr	%pstate, %r28
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71ca052  ! 2388: LDDF_I	ldd	[%r18, 0x0052], %f27
	.word 0xba150000  ! 2390: OR_R	or 	%r20, %r0, %r29
	.word 0xb684a092  ! 2393: ADDcc_I	addcc 	%r18, 0x0092, %r27
	.word 0xf80c216c  ! 2399: LDUB_I	ldub	[%r16 + 0x016c], %r28
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa452162  ! 2408: LDSW_I	ldsw	[%r20 + 0x0162], %r29
	.word 0xb951c000  ! 2410: RDPR_TL	<illegal instruction>
	.word 0xf8050000  ! 2411: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf81c60be  ! 2412: LDD_I	ldd	[%r17 + 0x00be], %r28
	.word 0xb4c40000  ! 2413: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xf91de1ce  ! 2418: LDDF_I	ldd	[%r23, 0x01ce], %f28
	.word 0xf055613f  ! 2419: LDSH_I	ldsh	[%r21 + 0x013f], %r24
	.word 0x839561d1  ! 2420: WRPR_TNPC_I	wrpr	%r21, 0x01d1, %tnpc
	.word 0xf11ce00e  ! 2428: LDDF_I	ldd	[%r19, 0x000e], %f24
	.word 0xf20cc000  ! 2431: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xb7510000  ! 2433: RDPR_TICK	<illegal instruction>
	.word 0x9194a079  ! 2435: WRPR_PIL_I	wrpr	%r18, 0x0079, %pil
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 2439: RDPR_TNPC	<illegal instruction>
	.word 0xfa54c000  ! 2443: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xbd50c000  ! 2445: RDPR_TT	<illegal instruction>
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12ca001  ! 2450: SLL_I	sll 	%r18, 0x0001, %r24
	.word 0xbf504000  ! 2451: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e89  ! 2452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e89, %hpstate
	.word 0xf31dc000  ! 2453: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xbec58000  ! 2454: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0xf4150000  ! 2455: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xf71ce0d0  ! 2459: LDDF_I	ldd	[%r19, 0x00d0], %f27
	.word 0x8395e093  ! 2460: WRPR_TNPC_I	wrpr	%r23, 0x0093, %tnpc
	.word 0xf84ce0e0  ! 2461: LDSB_I	ldsb	[%r19 + 0x00e0], %r28
	.word 0xb1508000  ! 2462: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94614a  ! 2469: WRPR_PSTATE_I	wrpr	%r17, 0x014a, %pstate
	.word 0xf05c8000  ! 2474: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xf2458000  ! 2475: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xfa5da0c0  ! 2476: LDX_I	ldx	[%r22 + 0x00c0], %r29
	.word 0xb424c000  ! 2479: SUB_R	sub 	%r19, %r0, %r26
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5de11b  ! 2483: LDX_I	ldx	[%r23 + 0x011b], %r29
	.word 0x879521fd  ! 2484: WRPR_TT_I	wrpr	%r20, 0x01fd, %tt
	.word 0xb7510000  ! 2492: RDPR_TICK	rdpr	%tick, %r27
	.word 0xb351c000  ! 2495: RDPR_TL	<illegal instruction>
	.word 0xf00c612f  ! 2497: LDUB_I	ldub	[%r17 + 0x012f], %r24
	.word 0xf21c2198  ! 2501: LDD_I	ldd	[%r16 + 0x0198], %r25
	.word 0xf80da19f  ! 2506: LDUB_I	ldub	[%r22 + 0x019f], %r28
	.word 0xf41cc000  ! 2507: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xb92cd000  ! 2510: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xf20ce08e  ! 2513: LDUB_I	ldub	[%r19 + 0x008e], %r25
	.word 0xf71dc000  ! 2515: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xfa45c000  ! 2516: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf41d2019  ! 2518: LDD_I	ldd	[%r20 + 0x0019], %r26
	.word 0xf41d615a  ! 2519: LDD_I	ldd	[%r21 + 0x015a], %r26
	.word 0xb6150000  ! 2520: OR_R	or 	%r20, %r0, %r27
	.word 0xb73d9000  ! 2521: SRAX_R	srax	%r22, %r0, %r27
	setx	0x20129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4040000  ! 2529: ADD_R	add 	%r16, %r0, %r26
	.word 0xfc1d0000  ! 2530: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf51dc000  ! 2531: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xb7357001  ! 2535: SRLX_I	srlx	%r21, 0x0001, %r27
	.word 0xf25c4000  ! 2538: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xb205213a  ! 2544: ADD_I	add 	%r20, 0x013a, %r25
	.word 0xb551c000  ! 2551: RDPR_TL	<illegal instruction>
	.word 0xf11dc000  ! 2558: LDDF_R	ldd	[%r23, %r0], %f24
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31ca068  ! 2572: LDDF_I	ldd	[%r18, 0x0068], %f25
	.word 0xf05da190  ! 2574: LDX_I	ldx	[%r22 + 0x0190], %r24
	.word 0xfa0c8000  ! 2575: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xb7518000  ! 2576: RDPR_PSTATE	<illegal instruction>
	.word 0xb32cc000  ! 2584: SLL_R	sll 	%r19, %r0, %r25
	.word 0xf244c000  ! 2587: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xbf508000  ! 2593: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb508000  ! 2598: RDPR_TSTATE	<illegal instruction>
	.word 0xf614c000  ! 2599: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xfd1dc000  ! 2601: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf045c000  ! 2602: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf24c4000  ! 2603: LDSB_R	ldsb	[%r17 + %r0], %r25
	setx	data_start_2, %g1, %r20
	.word 0xfc1dc000  ! 2606: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf05da0e2  ! 2609: LDX_I	ldx	[%r22 + 0x00e2], %r24
	.word 0xf11d4000  ! 2612: LDDF_R	ldd	[%r21, %r0], %f24
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d4000  ! 2617: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf645e0b3  ! 2619: LDSW_I	ldsw	[%r23 + 0x00b3], %r27
	.word 0xfe0d8000  ! 2620: LDUB_R	ldub	[%r22 + %r0], %r31
	mov	1, %r14
	.word 0xa193a000  ! 2621: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf81dc000  ! 2623: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xfa1cc000  ! 2624: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0x9195e1dc  ! 2625: WRPR_PIL_I	wrpr	%r23, 0x01dc, %pil
	.word 0xfa1d8000  ! 2626: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xf41ce16a  ! 2631: LDD_I	ldd	[%r19 + 0x016a], %r26
	.word 0xb034a115  ! 2632: ORN_I	orn 	%r18, 0x0115, %r24
	.word 0xf005601d  ! 2633: LDUW_I	lduw	[%r21 + 0x001d], %r24
	.word 0xfc1ca007  ! 2634: LDD_I	ldd	[%r18 + 0x0007], %r30
	.word 0x899420ef  ! 2637: WRPR_TICK_I	wrpr	%r16, 0x00ef, %tick
	.word 0xf84dc000  ! 2638: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf00c4000  ! 2640: LDUB_R	ldub	[%r17 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87956112  ! 2647: WRPR_TT_I	wrpr	%r21, 0x0112, %tt
	.word 0xb1355000  ! 2648: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xfa544000  ! 2655: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0x8594a13b  ! 2658: WRPR_TSTATE_I	wrpr	%r18, 0x013b, %tstate
	.word 0xfa544000  ! 2662: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf6044000  ! 2663: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf2554000  ! 2664: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xb0954000  ! 2666: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xf00ce006  ! 2667: LDUB_I	ldub	[%r19 + 0x0006], %r24
	.word 0xf005a06a  ! 2670: LDUW_I	lduw	[%r22 + 0x006a], %r24
	.word 0xfc0ca008  ! 2672: LDUB_I	ldub	[%r18 + 0x0008], %r30
	setx	0x10102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8b4a03f  ! 2674: ORNcc_I	orncc 	%r18, 0x003f, %r28
	setx	data_start_1, %g1, %r23
	.word 0xbd540000  ! 2677: RDPR_GL	<illegal instruction>
	.word 0xfe1d2098  ! 2678: LDD_I	ldd	[%r20 + 0x0098], %r31
	.word 0x8995600b  ! 2681: WRPR_TICK_I	wrpr	%r21, 0x000b, %tick
	.word 0xf854604a  ! 2688: LDSH_I	ldsh	[%r17 + 0x004a], %r28
	.word 0xf2454000  ! 2690: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf44cc000  ! 2691: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf204605b  ! 2693: LDUW_I	lduw	[%r17 + 0x005b], %r25
	mov	0, %r12
	.word 0x8f932000  ! 2694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa15c000  ! 2700: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xb7510000  ! 2702: RDPR_TICK	<illegal instruction>
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2707: RDPR_PIL	<illegal instruction>
	.word 0xfa5dc000  ! 2710: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf71c21c2  ! 2711: LDDF_I	ldd	[%r16, 0x01c2], %f27
	.word 0xf00d0000  ! 2713: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xbcc460db  ! 2714: ADDCcc_I	addccc 	%r17, 0x00db, %r30
	.word 0xf655e179  ! 2716: LDSH_I	ldsh	[%r23 + 0x0179], %r27
	.word 0x839461b7  ! 2717: WRPR_TNPC_I	wrpr	%r17, 0x01b7, %tnpc
	.word 0xf204a059  ! 2718: LDUW_I	lduw	[%r18 + 0x0059], %r25
	.word 0xfd1cc000  ! 2720: LDDF_R	ldd	[%r19, %r0], %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982e09  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e09, %hpstate
	.word 0xf11ca086  ! 2724: LDDF_I	ldd	[%r18, 0x0086], %f24
	.word 0xf2548000  ! 2727: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf81c4000  ! 2728: LDD_R	ldd	[%r17 + %r0], %r28
	setx	data_start_4, %g1, %r16
	setx	data_start_2, %g1, %r17
	.word 0xf25d6008  ! 2741: LDX_I	ldx	[%r21 + 0x0008], %r25
	.word 0xf4540000  ! 2742: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xbc954000  ! 2747: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xfe0421e9  ! 2753: LDUW_I	lduw	[%r16 + 0x01e9], %r31
	setx	data_start_6, %g1, %r17
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08d4000  ! 2762: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xbd51c000  ! 2765: RDPR_TL	<illegal instruction>
	.word 0xb294e11b  ! 2766: ORcc_I	orcc 	%r19, 0x011b, %r25
	setx	0x3030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xb41c21b1  ! 2773: XOR_I	xor 	%r16, 0x01b1, %r26
	.word 0x8994e046  ! 2775: WRPR_TICK_I	wrpr	%r19, 0x0046, %tick
	.word 0xf444c000  ! 2778: LDSW_R	ldsw	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983e11  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e11, %hpstate
	.word 0xb62de1e0  ! 2781: ANDN_I	andn 	%r23, 0x01e0, %r27
	.word 0xfd1c0000  ! 2782: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xfe5d207c  ! 2785: LDX_I	ldx	[%r20 + 0x007c], %r31
	.word 0xfc558000  ! 2786: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xbb345000  ! 2787: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb53d6001  ! 2790: SRA_I	sra 	%r21, 0x0001, %r26
	.word 0xf4144000  ! 2791: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0x9195a1ce  ! 2792: WRPR_PIL_I	wrpr	%r22, 0x01ce, %pil
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 2806: RDPR_TT	<illegal instruction>
	.word 0xfc5461cb  ! 2809: LDSH_I	ldsh	[%r17 + 0x01cb], %r30
	setx	0x20036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc9d0000  ! 2811: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0xfa450000  ! 2812: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xfc1de10f  ! 2813: LDD_I	ldd	[%r23 + 0x010f], %r30
	.word 0xf854c000  ! 2817: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xbb520000  ! 2818: RDPR_PIL	<illegal instruction>
	.word 0xf05d0000  ! 2829: LDX_R	ldx	[%r20 + %r0], %r24
	setx	data_start_5, %g1, %r18
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8144000  ! 2838: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfe0c0000  ! 2839: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xfe14c000  ! 2843: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf4546145  ! 2846: LDSH_I	ldsh	[%r17 + 0x0145], %r26
	.word 0xb424a004  ! 2847: SUB_I	sub 	%r18, 0x0004, %r26
	.word 0xbb520000  ! 2851: RDPR_PIL	<illegal instruction>
	setx	0x27, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d0000  ! 2854: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0x819421f3  ! 2855: WRPR_TPC_I	wrpr	%r16, 0x01f3, %tpc
	.word 0xf31c60d0  ! 2860: LDDF_I	ldd	[%r17, 0x00d0], %f25
	.word 0xbd518000  ! 2865: RDPR_PSTATE	<illegal instruction>
	.word 0xb7500000  ! 2866: RDPR_TPC	<illegal instruction>
	.word 0xfb1d8000  ! 2867: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xbb508000  ! 2868: RDPR_TSTATE	<illegal instruction>
	.word 0xbf510000  ! 2870: RDPR_TICK	<illegal instruction>
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c19  ! 2872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c19, %hpstate
	.word 0xfe1c8000  ! 2877: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf20c8000  ! 2879: LDUB_R	ldub	[%r18 + %r0], %r25
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c2085  ! 2882: LDD_I	ldd	[%r16 + 0x0085], %r26
	.word 0xb334a001  ! 2883: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xbb504000  ! 2884: RDPR_TNPC	<illegal instruction>
	.word 0xf2540000  ! 2885: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xfe156159  ! 2893: LDUH_I	lduh	[%r21 + 0x0159], %r31
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81de156  ! 2895: LDD_I	ldd	[%r23 + 0x0156], %r28
	.word 0xf64c20e7  ! 2896: LDSB_I	ldsb	[%r16 + 0x00e7], %r27
	.word 0xfc5ca0b3  ! 2897: LDX_I	ldx	[%r18 + 0x00b3], %r30
	.word 0xfc4cc000  ! 2900: LDSB_R	ldsb	[%r19 + %r0], %r30
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71ca0cb  ! 2910: LDDF_I	ldd	[%r18, 0x00cb], %f27
	.word 0xfe4d2162  ! 2913: LDSB_I	ldsb	[%r20 + 0x0162], %r31
	.word 0xbd540000  ! 2917: RDPR_GL	<illegal instruction>
	.word 0xb93df001  ! 2918: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xfc1560b9  ! 2921: LDUH_I	lduh	[%r21 + 0x00b9], %r30
	.word 0xf25de078  ! 2923: LDX_I	ldx	[%r23 + 0x0078], %r25
	mov	2, %r14
	.word 0xa193a000  ! 2924: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xbb508000  ! 2927: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a061  ! 2928: WRPR_TT_I	wrpr	%r18, 0x0061, %tt
	.word 0xfc15c000  ! 2931: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xfe448000  ! 2933: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xbf3da001  ! 2934: SRA_I	sra 	%r22, 0x0001, %r31
	.word 0xf605c000  ! 2938: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xb3520000  ! 2939: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf244e1f9  ! 2940: LDSW_I	ldsw	[%r19 + 0x01f9], %r25
	.word 0xf655c000  ! 2943: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xf20cc000  ! 2944: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0x8595e099  ! 2945: WRPR_TSTATE_I	wrpr	%r23, 0x0099, %tstate
	.word 0xf645e1a8  ! 2946: LDSW_I	ldsw	[%r23 + 0x01a8], %r27
	.word 0x8394e05b  ! 2948: WRPR_TNPC_I	wrpr	%r19, 0x005b, %tnpc
	.word 0xf44560dd  ! 2950: LDSW_I	ldsw	[%r21 + 0x00dd], %r26
	.word 0xbe8d4000  ! 2951: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xb28dc000  ! 2952: ANDcc_R	andcc 	%r23, %r0, %r25
	.word 0xf814210d  ! 2954: LDUH_I	lduh	[%r16 + 0x010d], %r28
	.word 0xf44da1ba  ! 2958: LDSB_I	ldsb	[%r22 + 0x01ba], %r26
	.word 0xb5480000  ! 2960: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5518000  ! 2964: RDPR_PSTATE	<illegal instruction>
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84c0000  ! 2966: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb9518000  ! 2970: RDPR_PSTATE	<illegal instruction>
	.word 0xf61cc000  ! 2971: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xf854a135  ! 2973: LDSH_I	ldsh	[%r18 + 0x0135], %r28
	.word 0xfd1dc000  ! 2976: LDDF_R	ldd	[%r23, %r0], %f30
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d21b9  ! 2991: LDDF_I	ldd	[%r20, 0x01b9], %f24
	.word 0x8394205c  ! 2993: WRPR_TNPC_I	wrpr	%r16, 0x005c, %tnpc
	.word 0x8795218b  ! 2997: WRPR_TT_I	wrpr	%r20, 0x018b, %tt
	.word 0xbf2db001  ! 2999: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xf51d4000  ! 3001: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xbf51c000  ! 3002: RDPR_TL	<illegal instruction>
	.word 0xbf2c2001  ! 3003: SLL_I	sll 	%r16, 0x0001, %r31
	setx	0x13f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 3013: RDPR_TICK	<illegal instruction>
	.word 0xfe5ca05b  ! 3015: LDX_I	ldx	[%r18 + 0x005b], %r31
	.word 0xf85d202b  ! 3016: LDX_I	ldx	[%r20 + 0x002b], %r28
	mov	0, %r12
	.word 0x8f932000  ! 3018: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8556001  ! 3019: LDSH_I	ldsh	[%r21 + 0x0001], %r28
	.word 0xf11c0000  ! 3021: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xbd3c3001  ! 3023: SRAX_I	srax	%r16, 0x0001, %r30
	.word 0xf20c202b  ! 3024: LDUB_I	ldub	[%r16 + 0x002b], %r25
	.word 0x9194a11e  ! 3025: WRPR_PIL_I	wrpr	%r18, 0x011e, %pil
	.word 0xf25d8000  ! 3026: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf805c000  ! 3030: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xb351c000  ! 3033: RDPR_TL	<illegal instruction>
	.word 0xf4540000  ! 3035: LDSH_R	ldsh	[%r16 + %r0], %r26
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00cc000  ! 3044: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf044a13a  ! 3048: LDSW_I	ldsw	[%r18 + 0x013a], %r24
	.word 0xbb2c8000  ! 3050: SLL_R	sll 	%r18, %r0, %r29
	.word 0xb5518000  ! 3051: RDPR_PSTATE	<illegal instruction>
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c49  ! 3056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0xfc44e0dd  ! 3060: LDSW_I	ldsw	[%r19 + 0x00dd], %r30
	.word 0xf0554000  ! 3064: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xf8448000  ! 3069: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfe5ce112  ! 3071: LDX_I	ldx	[%r19 + 0x0112], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xfa1c0000  ! 3073: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0x9195a1c1  ! 3075: WRPR_PIL_I	wrpr	%r22, 0x01c1, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982cd3  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0xf2140000  ! 3077: LDUH_R	lduh	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 3080: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4144000  ! 3083: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xfa55e030  ! 3088: LDSH_I	ldsh	[%r23 + 0x0030], %r29
	.word 0xf81c2028  ! 3090: LDD_I	ldd	[%r16 + 0x0028], %r28
	.word 0xf0158000  ! 3091: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf015c000  ! 3093: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xbe3d21ca  ! 3095: XNOR_I	xnor 	%r20, 0x01ca, %r31
	.word 0xf0048000  ! 3103: LDUW_R	lduw	[%r18 + %r0], %r24
	mov	1, %r14
	.word 0xa193a000  ! 3106: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf414c000  ! 3107: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xf61c4000  ! 3109: LDD_R	ldd	[%r17 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf204a05d  ! 3111: LDUW_I	lduw	[%r18 + 0x005d], %r25
	setx	data_start_6, %g1, %r21
	.word 0xfe0c61fb  ! 3115: LDUB_I	ldub	[%r17 + 0x01fb], %r31
	mov	1, %r14
	.word 0xa193a000  ! 3116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc954000  ! 3118: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xb5518000  ! 3119: RDPR_PSTATE	<illegal instruction>
	.word 0xf51da073  ! 3120: LDDF_I	ldd	[%r22, 0x0073], %f26
	.word 0xb48d21b5  ! 3127: ANDcc_I	andcc 	%r20, 0x01b5, %r26
	setx	data_start_6, %g1, %r22
	.word 0xb734c000  ! 3133: SRL_R	srl 	%r19, %r0, %r27
	.word 0xf604214e  ! 3137: LDUW_I	lduw	[%r16 + 0x014e], %r27
	.word 0xf00dc000  ! 3138: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xfe0d8000  ! 3140: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf045e02b  ! 3144: LDSW_I	ldsw	[%r23 + 0x002b], %r24
	.word 0xf25560da  ! 3146: LDSH_I	ldsh	[%r21 + 0x00da], %r25
	setx	data_start_5, %g1, %r22
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 3151: RDPR_TSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r16
	.word 0xf25de16f  ! 3155: LDX_I	ldx	[%r23 + 0x016f], %r25
	.word 0xba048000  ! 3156: ADD_R	add 	%r18, %r0, %r29
	.word 0xf0054000  ! 3158: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xf21c60ca  ! 3161: LDD_I	ldd	[%r17 + 0x00ca], %r25
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa158000  ! 3163: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf40c4000  ! 3164: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xbb540000  ! 3165: RDPR_GL	<illegal instruction>
	.word 0xf04d6186  ! 3166: LDSB_I	ldsb	[%r21 + 0x0186], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2a48000  ! 3168: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xfc540000  ! 3170: LDSH_R	ldsh	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xf91dc000  ! 3172: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf845a153  ! 3174: LDSW_I	ldsw	[%r22 + 0x0153], %r28
	.word 0x8994e165  ! 3175: WRPR_TICK_I	wrpr	%r19, 0x0165, %tick
	.word 0xfa44c000  ! 3177: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf8548000  ! 3179: LDSH_R	ldsh	[%r18 + %r0], %r28
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	.word 0xf4142158  ! 3186: LDUH_I	lduh	[%r16 + 0x0158], %r26
	mov	0, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfd1dc000  ! 3188: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xbe3561f3  ! 3199: SUBC_I	orn 	%r21, 0x01f3, %r31
	.word 0xf05d4000  ! 3200: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xfe5d6173  ! 3202: LDX_I	ldx	[%r21 + 0x0173], %r31
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf844a0a8  ! 3205: LDSW_I	ldsw	[%r18 + 0x00a8], %r28
	.word 0x8595a048  ! 3207: WRPR_TSTATE_I	wrpr	%r22, 0x0048, %tstate
	.word 0xf215607c  ! 3208: LDUH_I	lduh	[%r21 + 0x007c], %r25
	mov	0, %r14
	.word 0xa193a000  ! 3210: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8994608e  ! 3212: WRPR_TICK_I	wrpr	%r17, 0x008e, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982c9b  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9b, %hpstate
	.word 0xbb346001  ! 3218: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xfe44a014  ! 3220: LDSW_I	ldsw	[%r18 + 0x0014], %r31
	.word 0xb6b5c000  ! 3222: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xfe4d607c  ! 3223: LDSB_I	ldsb	[%r21 + 0x007c], %r31
	.word 0xf21d8000  ! 3225: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xfa4dc000  ! 3226: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfa1d2180  ! 3228: LDD_I	ldd	[%r20 + 0x0180], %r29
	.word 0xfc1d216b  ! 3231: LDD_I	ldd	[%r20 + 0x016b], %r30
	.word 0xf4550000  ! 3236: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf644c000  ! 3238: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xb5504000  ! 3240: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc44c000  ! 3243: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf61da0e5  ! 3248: LDD_I	ldd	[%r22 + 0x00e5], %r27
	.word 0xf854e1ce  ! 3249: LDSH_I	ldsh	[%r19 + 0x01ce], %r28
	.word 0xf2448000  ! 3253: LDSW_R	ldsw	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a420d3  ! 3255: SUBcc_I	subcc 	%r16, 0x00d3, %r27
	.word 0xb024c000  ! 3262: SUB_R	sub 	%r19, %r0, %r24
	.word 0xf45d21d5  ! 3264: LDX_I	ldx	[%r20 + 0x01d5], %r26
	.word 0xfe4d61d6  ! 3265: LDSB_I	ldsb	[%r21 + 0x01d6], %r31
	.word 0x8595e0d6  ! 3273: WRPR_TSTATE_I	wrpr	%r23, 0x00d6, %tstate
	setx	0x3013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952123  ! 3278: WRPR_PIL_I	wrpr	%r20, 0x0123, %pil
	.word 0xf51d215a  ! 3279: LDDF_I	ldd	[%r20, 0x015a], %f26
	setx	0x30309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf405c000  ! 3292: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xfd1c8000  ! 3294: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xb4b5a07c  ! 3295: SUBCcc_I	orncc 	%r22, 0x007c, %r26
	.word 0xfc5c8000  ! 3296: LDX_R	ldx	[%r18 + %r0], %r30
	setx	data_start_5, %g1, %r17
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0142011  ! 3300: LDUH_I	lduh	[%r16 + 0x0011], %r24
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 3306: RDPR_TT	<illegal instruction>
	.word 0xf654c000  ! 3307: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0x879460fa  ! 3309: WRPR_TT_I	wrpr	%r17, 0x00fa, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982c03  ! 3310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c03, %hpstate
	.word 0xbb50c000  ! 3312: RDPR_TT	rdpr	%tt, %r29
	.word 0xfd1c4000  ! 3315: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xf40c60a6  ! 3316: LDUB_I	ldub	[%r17 + 0x00a6], %r26
	.word 0xf61c61c6  ! 3317: LDD_I	ldd	[%r17 + 0x01c6], %r27
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952188  ! 3320: WRPR_PSTATE_I	wrpr	%r20, 0x0188, %pstate
	.word 0xf25ce0ff  ! 3324: LDX_I	ldx	[%r19 + 0x00ff], %r25
	.word 0xfc44c000  ! 3325: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf01c4000  ! 3332: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0x8994206a  ! 3333: WRPR_TICK_I	wrpr	%r16, 0x006a, %tick
	.word 0xb3480000  ! 3334: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb03dc000  ! 3336: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xf61c20e6  ! 3337: LDD_I	ldd	[%r16 + 0x00e6], %r27
	.word 0xf01de177  ! 3339: LDD_I	ldd	[%r23 + 0x0177], %r24
	.word 0xb40d8000  ! 3343: AND_R	and 	%r22, %r0, %r26
	.word 0x8195a113  ! 3348: WRPR_TPC_I	wrpr	%r22, 0x0113, %tpc
	.word 0xf80420f0  ! 3353: LDUW_I	lduw	[%r16 + 0x00f0], %r28
	setx	data_start_6, %g1, %r22
	setx	data_start_6, %g1, %r22
	.word 0x8995a005  ! 3359: WRPR_TICK_I	wrpr	%r22, 0x0005, %tick
	.word 0xfe048000  ! 3363: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0x85942102  ! 3364: WRPR_TSTATE_I	wrpr	%r16, 0x0102, %tstate
	.word 0xf0540000  ! 3365: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf31c8000  ! 3367: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xfd1dc000  ! 3369: LDDF_R	ldd	[%r23, %r0], %f30
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942100  ! 3378: WRPR_TT_I	wrpr	%r16, 0x0100, %tt
	.word 0xf6550000  ! 3381: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0x8595e02e  ! 3384: WRPR_TSTATE_I	wrpr	%r23, 0x002e, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d11  ! 3387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d11, %hpstate
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952167  ! 3390: WRPR_TPC_I	wrpr	%r20, 0x0167, %tpc
	.word 0x8995605a  ! 3391: WRPR_TICK_I	wrpr	%r21, 0x005a, %tick
	.word 0xf51d2020  ! 3393: LDDF_I	ldd	[%r20, 0x0020], %f26
	.word 0xb4144000  ! 3395: OR_R	or 	%r17, %r0, %r26
	.word 0xf244e172  ! 3396: LDSW_I	ldsw	[%r19 + 0x0172], %r25
	.word 0xbf3d8000  ! 3397: SRA_R	sra 	%r22, %r0, %r31
	.word 0xbe1c6146  ! 3400: XOR_I	xor 	%r17, 0x0146, %r31
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d2118  ! 3404: LDDF_I	ldd	[%r20, 0x0118], %f28
	.word 0xb3540000  ! 3408: RDPR_GL	rdpr	%-, %r25
	.word 0xf20de13e  ! 3411: LDUB_I	ldub	[%r23 + 0x013e], %r25
	.word 0xfa0ce1f3  ! 3413: LDUB_I	ldub	[%r19 + 0x01f3], %r29
	.word 0xf244e0d2  ! 3418: LDSW_I	ldsw	[%r19 + 0x00d2], %r25
	.word 0xfc45602e  ! 3420: LDSW_I	ldsw	[%r21 + 0x002e], %r30
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4054000  ! 3423: ADD_R	add 	%r21, %r0, %r26
	.word 0xb7480000  ! 3434: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04e02b  ! 3442: LDUW_I	lduw	[%r19 + 0x002b], %r29
	.word 0xf0142102  ! 3443: LDUH_I	lduh	[%r16 + 0x0102], %r24
	.word 0xbd520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xf04c6051  ! 3448: LDSB_I	ldsb	[%r17 + 0x0051], %r24
	.word 0xf604a14a  ! 3449: LDUW_I	lduw	[%r18 + 0x014a], %r27
	.word 0xf40d0000  ! 3455: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xfa45e021  ! 3458: LDSW_I	ldsw	[%r23 + 0x0021], %r29
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	.word 0x81946132  ! 3463: WRPR_TPC_I	wrpr	%r17, 0x0132, %tpc
	.word 0xf255c000  ! 3466: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf64ca181  ! 3472: LDSB_I	ldsb	[%r18 + 0x0181], %r27
	.word 0xbcc54000  ! 3474: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0x8395203b  ! 3475: WRPR_TNPC_I	wrpr	%r20, 0x003b, %tnpc
	.word 0xfa150000  ! 3478: LDUH_R	lduh	[%r20 + %r0], %r29
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e0a4  ! 3491: WRPR_PIL_I	wrpr	%r23, 0x00a4, %pil
	.word 0xb8b44000  ! 3492: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xfe14a16e  ! 3493: LDUH_I	lduh	[%r18 + 0x016e], %r31
	.word 0xb7510000  ! 3495: RDPR_TICK	<illegal instruction>
	.word 0xf80c20c5  ! 3502: LDUB_I	ldub	[%r16 + 0x00c5], %r28
	.word 0xf21dc000  ! 3504: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf84de0dc  ! 3505: LDSB_I	ldsb	[%r23 + 0x00dc], %r28
	.word 0xfc058000  ! 3506: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xb72d5000  ! 3507: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xfa5d60dc  ! 3508: LDX_I	ldx	[%r21 + 0x00dc], %r29
	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa140000  ! 3514: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfe4c0000  ! 3515: LDSB_R	ldsb	[%r16 + %r0], %r31
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 3521: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0x9195a0ae  ! 3524: WRPR_PIL_I	wrpr	%r22, 0x00ae, %pil
	.word 0xbe0dc000  ! 3526: AND_R	and 	%r23, %r0, %r31
	.word 0xb1518000  ! 3530: RDPR_PSTATE	<illegal instruction>
	.word 0xf01d4000  ! 3534: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0x919460b4  ! 3535: WRPR_PIL_I	wrpr	%r17, 0x00b4, %pil
	.word 0xb1518000  ! 3536: RDPR_PSTATE	<illegal instruction>
	.word 0xfe4c61f3  ! 3537: LDSB_I	ldsb	[%r17 + 0x01f3], %r31
	.word 0xb8b48000  ! 3540: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xf61c0000  ! 3542: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xf814607e  ! 3543: LDUH_I	lduh	[%r17 + 0x007e], %r28
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	mov	0, %r12
	.word 0x8f932000  ! 3546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r14
	.word 0xa193a000  ! 3549: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf31c21cc  ! 3550: LDDF_I	ldd	[%r16, 0x01cc], %f25
	.word 0xf255a11c  ! 3551: LDSH_I	ldsh	[%r22 + 0x011c], %r25
	.word 0xb7508000  ! 3554: RDPR_TSTATE	<illegal instruction>
	.word 0xf21ce159  ! 3557: LDD_I	ldd	[%r19 + 0x0159], %r25
	.word 0xf8054000  ! 3565: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf4044000  ! 3568: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf604e06a  ! 3571: LDUW_I	lduw	[%r19 + 0x006a], %r27
	.word 0xf44ca062  ! 3572: LDSB_I	ldsb	[%r18 + 0x0062], %r26
	.word 0xff1cc000  ! 3575: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb084a133  ! 3577: ADDcc_I	addcc 	%r18, 0x0133, %r24
	.word 0xf245e0c4  ! 3578: LDSW_I	ldsw	[%r23 + 0x00c4], %r25
	.word 0xf41c2129  ! 3580: LDD_I	ldd	[%r16 + 0x0129], %r26
	.word 0x8194612d  ! 3581: WRPR_TPC_I	wrpr	%r17, 0x012d, %tpc
	.word 0xfc1520fd  ! 3583: LDUH_I	lduh	[%r20 + 0x00fd], %r30
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc452148  ! 3588: ADDC_I	addc 	%r20, 0x0148, %r30
	.word 0xfe4421a3  ! 3592: LDSW_I	ldsw	[%r16 + 0x01a3], %r31
	.word 0x8194a0a3  ! 3597: WRPR_TPC_I	wrpr	%r18, 0x00a3, %tpc
	setx	0x315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 3599: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf81c61ed  ! 3604: LDD_I	ldd	[%r17 + 0x01ed], %r28
	.word 0xb351c000  ! 3605: RDPR_TL	<illegal instruction>
	.word 0xba45214b  ! 3607: ADDC_I	addc 	%r20, 0x014b, %r29
	.word 0xf31de073  ! 3613: LDDF_I	ldd	[%r23, 0x0073], %f25
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e172  ! 3618: WRPR_PIL_I	wrpr	%r19, 0x0172, %pil
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01520f7  ! 3620: LDUH_I	lduh	[%r20 + 0x00f7], %r24
	setx	data_start_1, %g1, %r21
	.word 0xbf510000  ! 3624: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xb68c2062  ! 3628: ANDcc_I	andcc 	%r16, 0x0062, %r27
	.word 0xf6148000  ! 3629: LDUH_R	lduh	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf21c0000  ! 3632: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0x8394612c  ! 3633: WRPR_TNPC_I	wrpr	%r17, 0x012c, %tnpc
	setx	data_start_3, %g1, %r17
	.word 0xf444617b  ! 3635: LDSW_I	ldsw	[%r17 + 0x017b], %r26
	.word 0xf41d602f  ! 3638: LDD_I	ldd	[%r21 + 0x002f], %r26
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41420bd  ! 3640: LDUH_I	lduh	[%r16 + 0x00bd], %r26
	.word 0xf8548000  ! 3641: LDSH_R	ldsh	[%r18 + %r0], %r28
	mov	0, %r12
	.word 0x8f932000  ! 3642: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d94a01f  ! 3643: WRPR_PSTATE_I	wrpr	%r18, 0x001f, %pstate
	.word 0xfe1d0000  ! 3644: LDD_R	ldd	[%r20 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf40d4000  ! 3650: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfa4461ca  ! 3653: LDSW_I	ldsw	[%r17 + 0x01ca], %r29
	.word 0xbb518000  ! 3654: RDPR_PSTATE	<illegal instruction>
	.word 0xf25d4000  ! 3658: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfa4de14c  ! 3662: LDSB_I	ldsb	[%r23 + 0x014c], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b49  ! 3664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b49, %hpstate
	.word 0xfa54c000  ! 3666: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xf04561b4  ! 3668: LDSW_I	ldsw	[%r21 + 0x01b4], %r24
	.word 0xfc44c000  ! 3669: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0x8394619f  ! 3671: WRPR_TNPC_I	wrpr	%r17, 0x019f, %tnpc
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04e1a1  ! 3676: LDUW_I	lduw	[%r19 + 0x01a1], %r29
	.word 0xf4452012  ! 3678: LDSW_I	ldsw	[%r20 + 0x0012], %r26
	.word 0xf45d4000  ! 3680: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xf51da07f  ! 3685: LDDF_I	ldd	[%r22, 0x007f], %f26
	.word 0xbc9d8000  ! 3687: XORcc_R	xorcc 	%r22, %r0, %r30
	.word 0xb03cc000  ! 3688: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0x8594e1f1  ! 3690: WRPR_TSTATE_I	wrpr	%r19, 0x01f1, %tstate
	.word 0xf205c000  ! 3691: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0x9194e105  ! 3692: WRPR_PIL_I	wrpr	%r19, 0x0105, %pil
	mov	0, %r12
	.word 0x8f932000  ! 3693: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd510000  ! 3695: RDPR_TICK	<illegal instruction>
	.word 0xb150c000  ! 3697: RDPR_TT	<illegal instruction>
	.word 0xff1c6011  ! 3698: LDDF_I	ldd	[%r17, 0x0011], %f31
	.word 0x89946138  ! 3699: WRPR_TICK_I	wrpr	%r17, 0x0138, %tick
	.word 0xf815a0d1  ! 3707: LDUH_I	lduh	[%r22 + 0x00d1], %r28
	.word 0xfc0d21d5  ! 3708: LDUB_I	ldub	[%r20 + 0x01d5], %r30
	.word 0xf20c2097  ! 3713: LDUB_I	ldub	[%r16 + 0x0097], %r25
	.word 0xf054a026  ! 3716: LDSH_I	ldsh	[%r18 + 0x0026], %r24
	.word 0xb625c000  ! 3719: SUB_R	sub 	%r23, %r0, %r27
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819520b4  ! 3722: WRPR_TPC_I	wrpr	%r20, 0x00b4, %tpc
	.word 0xf244c000  ! 3726: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xf40c6025  ! 3731: LDUB_I	ldub	[%r17 + 0x0025], %r26
	mov	0, %r12
	.word 0x8f932000  ! 3734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x819560ea  ! 3736: WRPR_TPC_I	wrpr	%r21, 0x00ea, %tpc
	.word 0xf6148000  ! 3738: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xf2458000  ! 3739: LDSW_R	ldsw	[%r22 + %r0], %r25
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 3742: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf64cc000  ! 3743: LDSB_R	ldsb	[%r19 + %r0], %r27
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf644210c  ! 3757: LDSW_I	ldsw	[%r16 + 0x010c], %r27
	.word 0xfe0d609c  ! 3758: LDUB_I	ldub	[%r21 + 0x009c], %r31
	.word 0xb9510000  ! 3759: RDPR_TICK	<illegal instruction>
	.word 0xf045e0f5  ! 3760: LDSW_I	ldsw	[%r23 + 0x00f5], %r24
	mov	0, %r12
	.word 0x8f932000  ! 3761: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb480000  ! 3765: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf45c4000  ! 3769: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xfc4c8000  ! 3770: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf4556023  ! 3773: LDSH_I	ldsh	[%r21 + 0x0023], %r26
	.word 0x8994e148  ! 3775: WRPR_TICK_I	wrpr	%r19, 0x0148, %tick
	.word 0x8594a0cc  ! 3782: WRPR_TSTATE_I	wrpr	%r18, 0x00cc, %tstate
	.word 0xfe550000  ! 3784: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf654a0f9  ! 3786: LDSH_I	ldsh	[%r18 + 0x00f9], %r27
	.word 0xfe4d4000  ! 3788: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xfc0421b9  ! 3790: LDUW_I	lduw	[%r16 + 0x01b9], %r30
	.word 0xfc4ce031  ! 3792: LDSB_I	ldsb	[%r19 + 0x0031], %r30
	.word 0xb2bc4000  ! 3795: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xf81dc000  ! 3797: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0x8395205c  ! 3801: WRPR_TNPC_I	wrpr	%r20, 0x005c, %tnpc
	.word 0xba340000  ! 3802: SUBC_R	orn 	%r16, %r0, %r29
	setx	0x2001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c6079  ! 3805: LDSB_I	ldsb	[%r17 + 0x0079], %r24
	.word 0x8395600a  ! 3807: WRPR_TNPC_I	wrpr	%r21, 0x000a, %tnpc
	.word 0xfc0d0000  ! 3809: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xf25d8000  ! 3816: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf20c0000  ! 3819: LDUB_R	ldub	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe45c000  ! 3825: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf854a144  ! 3828: LDSH_I	ldsh	[%r18 + 0x0144], %r28
	.word 0xf71cc000  ! 3829: LDDF_R	ldd	[%r19, %r0], %f27
	setx	0x10204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1d4000  ! 3832: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf24c0000  ! 3839: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xbac50000  ! 3846: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xf61cc000  ! 3849: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xb41c4000  ! 3856: XOR_R	xor 	%r17, %r0, %r26
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0x9195e18c  ! 3864: WRPR_PIL_I	wrpr	%r23, 0x018c, %pil
	.word 0xb1518000  ! 3869: RDPR_PSTATE	<illegal instruction>
	.word 0xf045e11e  ! 3870: LDSW_I	ldsw	[%r23 + 0x011e], %r24
	.word 0xb1540000  ! 3872: RDPR_GL	<illegal instruction>
	.word 0xfc454000  ! 3873: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xfe14e1be  ! 3874: LDUH_I	lduh	[%r19 + 0x01be], %r31
	setx	0x1033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc042022  ! 3877: LDUW_I	lduw	[%r16 + 0x0022], %r30
	.word 0xbd540000  ! 3882: RDPR_GL	<illegal instruction>
	.word 0xf51c4000  ! 3883: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xb3520000  ! 3885: RDPR_PIL	<illegal instruction>
	.word 0xbd504000  ! 3886: RDPR_TNPC	<illegal instruction>
	.word 0xbabd0000  ! 3888: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xfe4d2015  ! 3890: LDSB_I	ldsb	[%r20 + 0x0015], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 3891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	mov	1, %r12
	.word 0x8f932000  ! 3893: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8ad4000  ! 3894: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xfa5d8000  ! 3895: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xb7540000  ! 3896: RDPR_GL	<illegal instruction>
	.word 0xfa542195  ! 3897: LDSH_I	ldsh	[%r16 + 0x0195], %r29
	.word 0xfe05c000  ! 3903: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xb9480000  ! 3904: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb02d8000  ! 3907: ANDN_R	andn 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4546172  ! 3910: LDSH_I	ldsh	[%r17 + 0x0172], %r26
	.word 0xb235c000  ! 3911: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb7510000  ! 3915: RDPR_TICK	<illegal instruction>
	.word 0xfa550000  ! 3916: LDSH_R	ldsh	[%r20 + %r0], %r29
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20037, %g1, %o0
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
	.word 0xfe1da063  ! 3921: LDD_I	ldd	[%r22 + 0x0063], %r31
	.word 0xfc4c8000  ! 3925: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0x9194208d  ! 3927: WRPR_PIL_I	wrpr	%r16, 0x008d, %pil
	.word 0xf05c8000  ! 3928: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xfc4c8000  ! 3929: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf04c6133  ! 3930: LDSB_I	ldsb	[%r17 + 0x0133], %r24
	.word 0xb1480000  ! 3932: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf8058000  ! 3937: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xb551c000  ! 3939: RDPR_TL	<illegal instruction>
	.word 0xbd510000  ! 3941: RDPR_TICK	<illegal instruction>
	.word 0xb12c2001  ! 3942: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xb8a50000  ! 3945: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xf0142143  ! 3948: LDUH_I	lduh	[%r16 + 0x0143], %r24
	.word 0xb8b44000  ! 3951: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xfa55c000  ! 3952: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf204210d  ! 3954: LDUW_I	lduw	[%r16 + 0x010d], %r25
	.word 0xfa0ca141  ! 3955: LDUB_I	ldub	[%r18 + 0x0141], %r29
	.word 0xf0058000  ! 3956: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xbebd4000  ! 3958: XNORcc_R	xnorcc 	%r21, %r0, %r31
	setx	data_start_3, %g1, %r19
	.word 0xf21ce047  ! 3962: LDD_I	ldd	[%r19 + 0x0047], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa046065  ! 3964: LDUW_I	lduw	[%r17 + 0x0065], %r29
	.word 0xf04c21fb  ! 3966: LDSB_I	ldsb	[%r16 + 0x01fb], %r24
	.word 0xfc0c8000  ! 3969: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xbd3d8000  ! 3970: SRA_R	sra 	%r22, %r0, %r30
	.word 0xb21c6072  ! 3971: XOR_I	xor 	%r17, 0x0072, %r25
	.word 0xfa05a14f  ! 3974: LDUW_I	lduw	[%r22 + 0x014f], %r29
	setx	data_start_5, %g1, %r22
	.word 0x85942047  ! 3985: WRPR_TSTATE_I	wrpr	%r16, 0x0047, %tstate
	.word 0xf40d21e1  ! 3986: LDUB_I	ldub	[%r20 + 0x01e1], %r26
	.word 0xf05dc000  ! 3989: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xb68d606a  ! 3991: ANDcc_I	andcc 	%r21, 0x006a, %r27
	.word 0xfd1d60d3  ! 3996: LDDF_I	ldd	[%r21, 0x00d3], %f30
	.word 0xf91d8000  ! 4000: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf2054000  ! 4004: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x8d95205b  ! 4005: WRPR_PSTATE_I	wrpr	%r20, 0x005b, %pstate
	.word 0xf25c4000  ! 4008: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf8558000  ! 4012: LDSH_R	ldsh	[%r22 + %r0], %r28
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561a4  ! 4016: WRPR_PSTATE_I	wrpr	%r21, 0x01a4, %pstate
	.word 0xf054a0c8  ! 4018: LDSH_I	ldsh	[%r18 + 0x00c8], %r24
	.word 0xf8454000  ! 4019: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0x89942074  ! 4020: WRPR_TICK_I	wrpr	%r16, 0x0074, %tick
	.word 0xb404e153  ! 4021: ADD_I	add 	%r19, 0x0153, %r26
	.word 0xfa450000  ! 4024: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xb3500000  ! 4028: RDPR_TPC	<illegal instruction>
	.word 0x8d952080  ! 4031: WRPR_PSTATE_I	wrpr	%r20, 0x0080, %pstate
	.word 0xf2544000  ! 4032: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xb5520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xfa042111  ! 4038: LDUW_I	lduw	[%r16 + 0x0111], %r29
	.word 0xf854e1eb  ! 4040: LDSH_I	ldsh	[%r19 + 0x01eb], %r28
	.word 0xf0154000  ! 4043: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xf8554000  ! 4046: LDSH_R	ldsh	[%r21 + %r0], %r28
	setx	data_start_6, %g1, %r23
	.word 0xbf520000  ! 4057: RDPR_PIL	<illegal instruction>
	.word 0xfc54217f  ! 4058: LDSH_I	ldsh	[%r16 + 0x017f], %r30
	.word 0x839421d2  ! 4060: WRPR_TNPC_I	wrpr	%r16, 0x01d2, %tnpc
	.word 0xfb1c0000  ! 4066: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xf214c000  ! 4069: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xb3518000  ! 4071: RDPR_PSTATE	<illegal instruction>
	.word 0xb93df001  ! 4072: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xfa0c60af  ! 4073: LDUB_I	ldub	[%r17 + 0x00af], %r29
	.word 0xf25c4000  ! 4074: LDX_R	ldx	[%r17 + %r0], %r25
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 4077: RDPR_TL	<illegal instruction>
	.word 0xfc5561da  ! 4078: LDSH_I	ldsh	[%r21 + 0x01da], %r30
	.word 0xf85c8000  ! 4083: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb235a0f5  ! 4084: ORN_I	orn 	%r22, 0x00f5, %r25
	.word 0xbaa4c000  ! 4086: SUBcc_R	subcc 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983a01  ! 4091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a01, %hpstate
	.word 0xff1c617a  ! 4092: LDDF_I	ldd	[%r17, 0x017a], %f31
	.word 0xbd518000  ! 4093: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	.word 0x81983881  ! 4100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1881, %hpstate
	.word 0xf00de148  ! 4105: LDUB_I	ldub	[%r23 + 0x0148], %r24
	.word 0xfc15a0e2  ! 4109: LDUH_I	lduh	[%r22 + 0x00e2], %r30
	.word 0xf44d4000  ! 4110: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xfe0d4000  ! 4111: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xfa4ca18e  ! 4112: LDSB_I	ldsb	[%r18 + 0x018e], %r29
	.word 0xbd51c000  ! 4113: RDPR_TL	<illegal instruction>
	.word 0xb0a52088  ! 4114: SUBcc_I	subcc 	%r20, 0x0088, %r24
	mov	2, %r14
	.word 0xa193a000  ! 4118: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa4c21c5  ! 4119: LDSB_I	ldsb	[%r16 + 0x01c5], %r29
	setx	data_start_7, %g1, %r19
	.word 0xfd1d4000  ! 4122: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0x81942110  ! 4125: WRPR_TPC_I	wrpr	%r16, 0x0110, %tpc
	.word 0xf51ce0fc  ! 4126: LDDF_I	ldd	[%r19, 0x00fc], %f26
	setx	data_start_7, %g1, %r19
	.word 0xf8158000  ! 4132: LDUH_R	lduh	[%r22 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb32dd000  ! 4138: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xf80de045  ! 4141: LDUB_I	ldub	[%r23 + 0x0045], %r28
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e1df  ! 4144: WRPR_PSTATE_I	wrpr	%r23, 0x01df, %pstate
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2558000  ! 4147: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf6156041  ! 4149: LDUH_I	lduh	[%r21 + 0x0041], %r27
	.word 0xfe4dc000  ! 4155: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xb52d6001  ! 4156: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xb9520000  ! 4162: RDPR_PIL	<illegal instruction>
	.word 0xf04d4000  ! 4164: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf81cc000  ! 4169: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xbb518000  ! 4170: RDPR_PSTATE	<illegal instruction>
	.word 0xf805603c  ! 4172: LDUW_I	lduw	[%r21 + 0x003c], %r28
	.word 0xb22c4000  ! 4173: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xf45c2169  ! 4176: LDX_I	ldx	[%r16 + 0x0169], %r26
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4180: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe4ce08d  ! 4185: LDSB_I	ldsb	[%r19 + 0x008d], %r31
	.word 0xb9540000  ! 4186: RDPR_GL	<illegal instruction>
	.word 0xb1510000  ! 4188: RDPR_TICK	<illegal instruction>
	.word 0xb7518000  ! 4189: RDPR_PSTATE	<illegal instruction>
	.word 0xb751c000  ! 4191: RDPR_TL	<illegal instruction>
	.word 0xf6150000  ! 4194: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf00cc000  ! 4195: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf91c6042  ! 4203: LDDF_I	ldd	[%r17, 0x0042], %f28
	.word 0xfd1c8000  ! 4204: LDDF_R	ldd	[%r18, %r0], %f30
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 4214: RDPR_GL	<illegal instruction>
	.word 0xb4aca1a9  ! 4215: ANDNcc_I	andncc 	%r18, 0x01a9, %r26
	.word 0xb00d21eb  ! 4221: AND_I	and 	%r20, 0x01eb, %r24
	.word 0xb3518000  ! 4223: RDPR_PSTATE	<illegal instruction>
	.word 0xfa4de08e  ! 4224: LDSB_I	ldsb	[%r23 + 0x008e], %r29
	.word 0xb23c0000  ! 4226: XNOR_R	xnor 	%r16, %r0, %r25
	mov	1, %r12
	.word 0x8f932000  ! 4229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	.word 0xfa45618d  ! 4232: LDSW_I	ldsw	[%r21 + 0x018d], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b09  ! 4233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b09, %hpstate
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb084c000  ! 4237: ADDcc_R	addcc 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982a89  ! 4238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983941  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1941, %hpstate
	.word 0x8d95616f  ! 4245: WRPR_PSTATE_I	wrpr	%r21, 0x016f, %pstate
	.word 0xf91d6196  ! 4246: LDDF_I	ldd	[%r21, 0x0196], %f28
	.word 0xfe1c603f  ! 4247: LDD_I	ldd	[%r17 + 0x003f], %r31
	.word 0xb7518000  ! 4250: RDPR_PSTATE	<illegal instruction>
	.word 0xf05461b7  ! 4255: LDSH_I	ldsh	[%r17 + 0x01b7], %r24
	.word 0xfc1dc000  ! 4258: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf65521af  ! 4261: LDSH_I	ldsh	[%r20 + 0x01af], %r27
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c21a6  ! 4263: LDUB_I	ldub	[%r16 + 0x01a6], %r25
	.word 0xf31d618e  ! 4264: LDDF_I	ldd	[%r21, 0x018e], %f25
	.word 0xf8446071  ! 4272: LDSW_I	ldsw	[%r17 + 0x0071], %r28
	.word 0xb351c000  ! 4274: RDPR_TL	<illegal instruction>
	.word 0xf01d6084  ! 4277: LDD_I	ldd	[%r21 + 0x0084], %r24
	.word 0xb8c4600f  ! 4279: ADDCcc_I	addccc 	%r17, 0x000f, %r28
	.word 0xb7504000  ! 4282: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c4b  ! 4284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4b, %hpstate
	.word 0xb0c5e1d1  ! 4287: ADDCcc_I	addccc 	%r23, 0x01d1, %r24
	.word 0x8d95a023  ! 4288: WRPR_PSTATE_I	wrpr	%r22, 0x0023, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe258000  ! 4307: SUB_R	sub 	%r22, %r0, %r31
	.word 0xbd7c8400  ! 4312: MOVR_R	movre	%r18, %r0, %r30
	.word 0xf2440000  ! 4313: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf244a0d0  ! 4314: LDSW_I	ldsw	[%r18 + 0x00d0], %r25
	.word 0xfe4d0000  ! 4316: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf244a1c4  ! 4319: LDSW_I	ldsw	[%r18 + 0x01c4], %r25
	.word 0xf0146077  ! 4320: LDUH_I	lduh	[%r17 + 0x0077], %r24
	.word 0xf64dc000  ! 4325: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xfc1ca1e2  ! 4326: LDD_I	ldd	[%r18 + 0x01e2], %r30
	.word 0xfb1d0000  ! 4328: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xfe542107  ! 4330: LDSH_I	ldsh	[%r16 + 0x0107], %r31
	.word 0xb1518000  ! 4333: RDPR_PSTATE	rdpr	%pstate, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x12a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba3d2143  ! 4339: XNOR_I	xnor 	%r20, 0x0143, %r29
	setx	0x20307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 4345: RDPR_TSTATE	<illegal instruction>
	.word 0xb5520000  ! 4347: RDPR_PIL	<illegal instruction>
	.word 0xf4140000  ! 4349: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfa1dc000  ! 4350: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xfc4561d3  ! 4351: LDSW_I	ldsw	[%r21 + 0x01d3], %r30
	.word 0xf21ca1d8  ! 4354: LDD_I	ldd	[%r18 + 0x01d8], %r25
	.word 0xf25d0000  ! 4355: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0x819420e3  ! 4356: WRPR_TPC_I	wrpr	%r16, 0x00e3, %tpc
	.word 0xfe054000  ! 4357: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xbd34c000  ! 4358: SRL_R	srl 	%r19, %r0, %r30
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf60c8000  ! 4368: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf00c8000  ! 4370: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf8152063  ! 4373: LDUH_I	lduh	[%r20 + 0x0063], %r28
	.word 0xf8142148  ! 4374: LDUH_I	lduh	[%r16 + 0x0148], %r28
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe442070  ! 4382: LDSW_I	ldsw	[%r16 + 0x0070], %r31
	.word 0xf8454000  ! 4389: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0x91956122  ! 4392: WRPR_PIL_I	wrpr	%r21, 0x0122, %pil
	.word 0xb9508000  ! 4394: RDPR_TSTATE	<illegal instruction>
	.word 0xfd1ca01f  ! 4396: LDDF_I	ldd	[%r18, 0x001f], %f30
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4da172  ! 4400: LDSB_I	ldsb	[%r22 + 0x0172], %r29
	.word 0xfa0d4000  ! 4402: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0x8995e08f  ! 4404: WRPR_TICK_I	wrpr	%r23, 0x008f, %tick
	setx	data_start_6, %g1, %r21
	.word 0xf01d4000  ! 4407: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xf45d4000  ! 4409: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xfa1d4000  ! 4410: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0x8d94a139  ! 4413: WRPR_PSTATE_I	wrpr	%r18, 0x0139, %pstate
	.word 0xb9518000  ! 4414: RDPR_PSTATE	<illegal instruction>
	.word 0x8595619f  ! 4418: WRPR_TSTATE_I	wrpr	%r21, 0x019f, %tstate
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4423: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf615a1f0  ! 4426: LDUH_I	lduh	[%r22 + 0x01f0], %r27
	.word 0xf814a17d  ! 4428: LDUH_I	lduh	[%r18 + 0x017d], %r28
	.word 0x819421c4  ! 4429: WRPR_TPC_I	wrpr	%r16, 0x01c4, %tpc
	.word 0xf24c212b  ! 4432: LDSB_I	ldsb	[%r16 + 0x012b], %r25
	.word 0xbf2dc000  ! 4433: SLL_R	sll 	%r23, %r0, %r31
	.word 0xfe15602a  ! 4436: LDUH_I	lduh	[%r21 + 0x002a], %r31
	.word 0xfd1de1a9  ! 4437: LDDF_I	ldd	[%r23, 0x01a9], %f30
	.word 0xbe44609b  ! 4444: ADDC_I	addc 	%r17, 0x009b, %r31
	.word 0xbf540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xbf540000  ! 4448: RDPR_GL	rdpr	%-, %r31
	setx	data_start_1, %g1, %r23
	.word 0x9194e120  ! 4451: WRPR_PIL_I	wrpr	%r19, 0x0120, %pil
	.word 0xfa142083  ! 4452: LDUH_I	lduh	[%r16 + 0x0083], %r29
	.word 0xfc54c000  ! 4454: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xb485c000  ! 4456: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xf415c000  ! 4457: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf71dc000  ! 4459: LDDF_R	ldd	[%r23, %r0], %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 4461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xfc5da16d  ! 4465: LDX_I	ldx	[%r22 + 0x016d], %r30
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf215619a  ! 4468: LDUH_I	lduh	[%r21 + 0x019a], %r25
	.word 0xb3504000  ! 4473: RDPR_TNPC	<illegal instruction>
	.word 0xbc35c000  ! 4474: SUBC_R	orn 	%r23, %r0, %r30
	.word 0xb9508000  ! 4475: RDPR_TSTATE	<illegal instruction>
	.word 0xf2448000  ! 4476: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xb62c8000  ! 4477: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xfe4420a0  ! 4479: LDSW_I	ldsw	[%r16 + 0x00a0], %r31
	.word 0xf45dc000  ! 4482: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfa15a017  ! 4483: LDUH_I	lduh	[%r22 + 0x0017], %r29
	.word 0xfa05a04f  ! 4484: LDUW_I	lduw	[%r22 + 0x004f], %r29
	.word 0xfa4d4000  ! 4485: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf91d4000  ! 4487: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xfc156116  ! 4492: LDUH_I	lduh	[%r21 + 0x0116], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69c21dc  ! 4495: XORcc_I	xorcc 	%r16, 0x01dc, %r27
	.word 0xf6154000  ! 4496: LDUH_R	lduh	[%r21 + %r0], %r27
	mov	1, %r12
	.word 0x8f932000  ! 4499: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf64d6009  ! 4500: LDSB_I	ldsb	[%r21 + 0x0009], %r27
	.word 0xb5510000  ! 4501: RDPR_TICK	<illegal instruction>
	.word 0xf80ca03e  ! 4505: LDUB_I	ldub	[%r18 + 0x003e], %r28
	mov	1, %r12
	.word 0x8f932000  ! 4506: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf60ce0af  ! 4508: LDUB_I	ldub	[%r19 + 0x00af], %r27
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 4512: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_5, %g1, %r23
	.word 0xf81d8000  ! 4516: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xb9480000  ! 4517: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa1ca148  ! 4519: LDD_I	ldd	[%r18 + 0x0148], %r29
	.word 0xf0440000  ! 4520: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0x8394a001  ! 4521: WRPR_TNPC_I	wrpr	%r18, 0x0001, %tnpc
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 4528: RDPR_TL	<illegal instruction>
	.word 0xf64d210b  ! 4532: LDSB_I	ldsb	[%r20 + 0x010b], %r27
	.word 0xbd480000  ! 4539: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf4540000  ! 4541: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf84cc000  ! 4542: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xfc0d21a3  ! 4545: LDUB_I	ldub	[%r20 + 0x01a3], %r30
	.word 0xfc0ca1c7  ! 4547: LDUB_I	ldub	[%r18 + 0x01c7], %r30
	.word 0xf455a046  ! 4551: LDSH_I	ldsh	[%r22 + 0x0046], %r26
	.word 0xb804e10a  ! 4553: ADD_I	add 	%r19, 0x010a, %r28
	.word 0xf00cc000  ! 4554: LDUB_R	ldub	[%r19 + %r0], %r24
	setx	data_start_7, %g1, %r18
	.word 0x8d95a0e2  ! 4558: WRPR_PSTATE_I	wrpr	%r22, 0x00e2, %pstate
	mov	2, %r14
	.word 0xa193a000  ! 4559: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf25de138  ! 4560: LDX_I	ldx	[%r23 + 0x0138], %r25
	.word 0xb73de001  ! 4561: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xbf51c000  ! 4565: RDPR_TL	<illegal instruction>
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 4569: RDPR_PSTATE	<illegal instruction>
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5de1cc  ! 4577: LDX_I	ldx	[%r23 + 0x01cc], %r30
	.word 0xf2140000  ! 4579: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xbf35f001  ! 4583: SRLX_I	srlx	%r23, 0x0001, %r31
	.word 0xfd1c0000  ! 4584: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xf31c2110  ! 4592: LDDF_I	ldd	[%r16, 0x0110], %f25
	.word 0xf8544000  ! 4599: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfc45a0ee  ! 4600: LDSW_I	ldsw	[%r22 + 0x00ee], %r30
	.word 0xf81c2098  ! 4605: LDD_I	ldd	[%r16 + 0x0098], %r28
	.word 0xf454612f  ! 4608: LDSH_I	ldsh	[%r17 + 0x012f], %r26
	.word 0x8194e1de  ! 4610: WRPR_TPC_I	wrpr	%r19, 0x01de, %tpc
	.word 0x85956049  ! 4611: WRPR_TSTATE_I	wrpr	%r21, 0x0049, %tstate
	.word 0xb550c000  ! 4615: RDPR_TT	<illegal instruction>
	.word 0xfc5de198  ! 4619: LDX_I	ldx	[%r23 + 0x0198], %r30
	setx	data_start_5, %g1, %r17
	.word 0xf6154000  ! 4622: LDUH_R	lduh	[%r21 + %r0], %r27
	setx	0x10339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc456180  ! 4629: LDSW_I	ldsw	[%r21 + 0x0180], %r30
	.word 0xbb510000  ! 4630: RDPR_TICK	<illegal instruction>
	.word 0xf4548000  ! 4633: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfa0c21c2  ! 4635: LDUB_I	ldub	[%r16 + 0x01c2], %r29
	.word 0xf4458000  ! 4636: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf60de1d0  ! 4638: LDUB_I	ldub	[%r23 + 0x01d0], %r27
	.word 0xf4440000  ! 4639: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xb8444000  ! 4641: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xb4450000  ! 4642: ADDC_R	addc 	%r20, %r0, %r26
	.word 0xf8558000  ! 4644: LDSH_R	ldsh	[%r22 + %r0], %r28
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc15a1a1  ! 4649: LDUH_I	lduh	[%r22 + 0x01a1], %r30
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb68d8000  ! 4653: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xff1d8000  ! 4657: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xf40de0d9  ! 4658: LDUB_I	ldub	[%r23 + 0x00d9], %r26
	setx	data_start_2, %g1, %r19
	.word 0xfe54610a  ! 4662: LDSH_I	ldsh	[%r17 + 0x010a], %r31
	.word 0xb9355000  ! 4663: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xf91d0000  ! 4664: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf60c8000  ! 4666: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xfc5c61a3  ! 4669: LDX_I	ldx	[%r17 + 0x01a3], %r30
	.word 0xf4548000  ! 4671: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfa5561b9  ! 4672: LDSH_I	ldsh	[%r21 + 0x01b9], %r29
	.word 0xf04d0000  ! 4675: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfe54c000  ! 4680: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xfe546116  ! 4685: LDSH_I	ldsh	[%r17 + 0x0116], %r31
	setx	0x36, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	.word 0x87952144  ! 4688: WRPR_TT_I	wrpr	%r20, 0x0144, %tt
	.word 0xb37ce401  ! 4689: MOVR_I	movre	%r19, 0x1, %r25
	.word 0xb285e1e6  ! 4690: ADDcc_I	addcc 	%r23, 0x01e6, %r25
	.word 0xf445e094  ! 4691: LDSW_I	ldsw	[%r23 + 0x0094], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 4692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf814a15e  ! 4697: LDUH_I	lduh	[%r18 + 0x015e], %r28
	.word 0xfa5c8000  ! 4701: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xbf518000  ! 4702: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0520dd  ! 4709: LDUW_I	lduw	[%r20 + 0x00dd], %r30
	.word 0x8794a05e  ! 4710: WRPR_TT_I	wrpr	%r18, 0x005e, %tt
	mov	2, %r12
	.word 0x8f932000  ! 4713: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfb1d8000  ! 4717: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0x8794210d  ! 4721: WRPR_TT_I	wrpr	%r16, 0x010d, %tt
	.word 0xfc0ce15a  ! 4724: LDUB_I	ldub	[%r19 + 0x015a], %r30
	.word 0xf41420f4  ! 4725: LDUH_I	lduh	[%r16 + 0x00f4], %r26
	.word 0xf25c8000  ! 4727: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xb8b420e8  ! 4733: SUBCcc_I	orncc 	%r16, 0x00e8, %r28
	.word 0xf0444000  ! 4735: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf20c8000  ! 4738: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xfa55205d  ! 4741: LDSH_I	ldsh	[%r20 + 0x005d], %r29
	.word 0x8995607a  ! 4743: WRPR_TICK_I	wrpr	%r21, 0x007a, %tick
	.word 0xf81cc000  ! 4745: LDD_R	ldd	[%r19 + %r0], %r28
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8148000  ! 4747: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfa1560d8  ! 4748: LDUH_I	lduh	[%r21 + 0x00d8], %r29
	.word 0xf845e0b3  ! 4749: LDSW_I	ldsw	[%r23 + 0x00b3], %r28
	.word 0xfa148000  ! 4751: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xfe44a09f  ! 4754: LDSW_I	ldsw	[%r18 + 0x009f], %r31
	.word 0xb5504000  ! 4757: RDPR_TNPC	<illegal instruction>
	.word 0xba8d6118  ! 4759: ANDcc_I	andcc 	%r21, 0x0118, %r29
	.word 0xfa05a036  ! 4760: LDUW_I	lduw	[%r22 + 0x0036], %r29
	.word 0x8d9521cc  ! 4762: WRPR_PSTATE_I	wrpr	%r20, 0x01cc, %pstate
	.word 0xfe0da164  ! 4765: LDUB_I	ldub	[%r22 + 0x0164], %r31
	.word 0xfa04a17d  ! 4767: LDUW_I	lduw	[%r18 + 0x017d], %r29
	.word 0xfc5dc000  ! 4769: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf445c000  ! 4771: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf20d4000  ! 4779: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xfa540000  ! 4781: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf60dc000  ! 4782: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xb5643801  ! 4784: MOVcc_I	<illegal instruction>
	.word 0x8195a1ec  ! 4790: WRPR_TPC_I	wrpr	%r22, 0x01ec, %tpc
	.word 0xfa5c6076  ! 4791: LDX_I	ldx	[%r17 + 0x0076], %r29
	mov	1, %r14
	.word 0xa193a000  ! 4793: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 4794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983e51  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e51, %hpstate
	.word 0xfe5c61bf  ! 4800: LDX_I	ldx	[%r17 + 0x01bf], %r31
	.word 0xba348000  ! 4808: ORN_R	orn 	%r18, %r0, %r29
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a15c  ! 4814: WRPR_PSTATE_I	wrpr	%r22, 0x015c, %pstate
	.word 0x8795e0e0  ! 4815: WRPR_TT_I	wrpr	%r23, 0x00e0, %tt
	.word 0xf21da181  ! 4816: LDD_I	ldd	[%r22 + 0x0181], %r25
	.word 0x81946096  ! 4822: WRPR_TPC_I	wrpr	%r17, 0x0096, %tpc
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6150000  ! 4830: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xbf508000  ! 4831: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 4832: RDPR_TT	<illegal instruction>
	.word 0xf4544000  ! 4833: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfc5d0000  ! 4834: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0x8595a080  ! 4841: WRPR_TSTATE_I	wrpr	%r22, 0x0080, %tstate
	.word 0xf25c2156  ! 4842: LDX_I	ldx	[%r16 + 0x0156], %r25
	.word 0xb134f001  ! 4845: SRLX_I	srlx	%r19, 0x0001, %r24
	.word 0xf44cc000  ! 4846: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xb5520000  ! 4849: RDPR_PIL	<illegal instruction>
	.word 0xf6554000  ! 4850: LDSH_R	ldsh	[%r21 + %r0], %r27
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4158000  ! 4853: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0x899421bd  ! 4856: WRPR_TICK_I	wrpr	%r16, 0x01bd, %tick
	.word 0xb4958000  ! 4859: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0x9195a1ba  ! 4860: WRPR_PIL_I	wrpr	%r22, 0x01ba, %pil
	.word 0xb23da06c  ! 4862: XNOR_I	xnor 	%r22, 0x006c, %r25
	.word 0xf41ca0f6  ! 4863: LDD_I	ldd	[%r18 + 0x00f6], %r26
	setx	0x10313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0542184  ! 4870: LDSH_I	ldsh	[%r16 + 0x0184], %r24
	.word 0xf04461cd  ! 4874: LDSW_I	ldsw	[%r17 + 0x01cd], %r24
	.word 0xb8144000  ! 4880: OR_R	or 	%r17, %r0, %r28
	.word 0xf445c000  ! 4886: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xbf540000  ! 4887: RDPR_GL	<illegal instruction>
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe54214b  ! 4895: LDSH_I	ldsh	[%r16 + 0x014b], %r31
	.word 0xb5480000  ! 4899: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf454e0c2  ! 4900: LDSH_I	ldsh	[%r19 + 0x00c2], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80dc000  ! 4904: LDUB_R	ldub	[%r23 + %r0], %r28
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65c6010  ! 4910: LDX_I	ldx	[%r17 + 0x0010], %r27
	.word 0x8995616f  ! 4911: WRPR_TICK_I	wrpr	%r21, 0x016f, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983959  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1959, %hpstate
	.word 0xb614e009  ! 4916: OR_I	or 	%r19, 0x0009, %r27
	.word 0xf8044000  ! 4918: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf91c8000  ! 4921: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xbf508000  ! 4925: RDPR_TSTATE	<illegal instruction>
	setx	0x20002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1ca12d  ! 4930: LDD_I	ldd	[%r18 + 0x012d], %r30
	.word 0xf25dc000  ! 4935: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xb8b5607d  ! 4937: SUBCcc_I	orncc 	%r21, 0x007d, %r28
	.word 0xfe04201f  ! 4939: LDUW_I	lduw	[%r16 + 0x001f], %r31
	.word 0xfa0cc000  ! 4940: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xbf7c4400  ! 4943: MOVR_R	movre	%r17, %r0, %r31
	.word 0xbe9c0000  ! 4949: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0x8d94a018  ! 4953: WRPR_PSTATE_I	wrpr	%r18, 0x0018, %pstate
	.word 0xf84c4000  ! 4958: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xfc5de0e7  ! 4959: LDX_I	ldx	[%r23 + 0x00e7], %r30
	.word 0xf4154000  ! 4963: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xf05dc000  ! 4968: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfa0c0000  ! 4970: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xf85c0000  ! 4971: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf91c0000  ! 4976: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfe5c2128  ! 4977: LDX_I	ldx	[%r16 + 0x0128], %r31
	.word 0xf40de1c8  ! 4981: LDUB_I	ldub	[%r23 + 0x01c8], %r26
	.word 0xb2c40000  ! 4982: ADDCcc_R	addccc 	%r16, %r0, %r25
	.word 0x839561e4  ! 4984: WRPR_TNPC_I	wrpr	%r21, 0x01e4, %tnpc
	.word 0xf414c000  ! 4986: LDUH_R	lduh	[%r19 + %r0], %r26
	setx	data_start_6, %g1, %r20
	.word 0xb950c000  ! 4993: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 4994: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e10d  ! 4995: WRPR_TT_I	wrpr	%r19, 0x010d, %tt
	.word 0xf20ca08c  ! 4996: LDUB_I	ldub	[%r18 + 0x008c], %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbfa40820  ! 2: FADDs	fadds	%f16, %f0, %f31
	.word 0xb350c000  ! 4: RDPR_TT	<illegal instruction>
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2df001  ! 11: SLLX_I	sllx	%r23, 0x0001, %r31
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a448a0  ! 13: FSUBs	fsubs	%f17, %f0, %f24
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44960  ! 18: FMULq	dis not found

	.word 0xb7a98820  ! 25: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a88820  ! 28: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbda5c860  ! 39: FADDq	dis not found

	.word 0xbc2d0000  ! 42: ANDN_R	andn 	%r20, %r0, %r30
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda50860  ! 50: FADDq	dis not found

	.word 0xb3a80820  ! 53: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a488e0  ! 56: FSUBq	dis not found

	.word 0xb7a4c860  ! 59: FADDq	dis not found

	.word 0x859521ff  ! 60: WRPR_TSTATE_I	wrpr	%r20, 0x01ff, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983bdb  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bdb, %hpstate
	.word 0xbfa4c920  ! 63: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb684a0b5  ! 68: ADDcc_I	addcc 	%r18, 0x00b5, %r27
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	.word 0xb5508000  ! 73: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a54820  ! 75: FADDs	fadds	%f21, %f0, %f27
	setx	0x10322, %g1, %o0
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
	.word 0xb9480000  ! 81: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	ta	T_CHANGE_HPRIV
	.word 0x819838d3  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d3, %hpstate
	setx	data_start_1, %g1, %r16
	.word 0xb8bce1d6  ! 89: XNORcc_I	xnorcc 	%r19, 0x01d6, %r28
	.word 0xb1a00560  ! 94: FSQRTq	fsqrt	
	.word 0xbf504000  ! 95: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982f5b  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	mov	2, %r12
	.word 0x8f932000  ! 99: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a408a0  ! 103: FSUBs	fsubs	%f16, %f0, %f25
	mov	0, %r14
	.word 0xa193a000  ! 104: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbea5e08a  ! 106: SUBcc_I	subcc 	%r23, 0x008a, %r31
	setx	data_start_5, %g1, %r22
	.word 0xb3a90820  ! 108: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 116: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbdaac820  ! 126: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00540  ! 127: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba5c860  ! 129: FADDq	dis not found

	.word 0xb5346001  ! 131: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xb9518000  ! 137: RDPR_PSTATE	<illegal instruction>
	.word 0xbe046113  ! 138: ADD_I	add 	%r17, 0x0113, %r31
	.word 0xb49cc000  ! 141: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xbda00560  ! 145: FSQRTq	fsqrt	
	.word 0xbbab0820  ! 146: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbdab4820  ! 149: FMOVCC	fmovs	%fcc1, %f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 155: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a548e0  ! 159: FSUBq	dis not found

	.word 0xb9a80820  ! 161: FMOVN	fmovs	%fcc1, %f0, %f28
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 163: RDPR_GL	<illegal instruction>
	.word 0x8394a1b1  ! 167: WRPR_TNPC_I	wrpr	%r18, 0x01b1, %tnpc
	.word 0x8595a13c  ! 172: WRPR_TSTATE_I	wrpr	%r22, 0x013c, %tstate
	.word 0x879460d2  ! 173: WRPR_TT_I	wrpr	%r17, 0x00d2, %tt
	.word 0xb7a5c9e0  ! 175: FDIVq	dis not found

	.word 0xbfaa0820  ! 177: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0x8d95a16f  ! 178: WRPR_PSTATE_I	wrpr	%r22, 0x016f, %pstate
	.word 0xbba80c20  ! 180: FMOVRLZ	dis not found

	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81982c43  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	.word 0xb4a5c000  ! 185: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xb5a54820  ! 186: FADDs	fadds	%f21, %f0, %f26
	.word 0xb9aa8820  ! 188: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0x89946149  ! 191: WRPR_TICK_I	wrpr	%r17, 0x0149, %tick
	.word 0xbfa84820  ! 194: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbf510000  ! 195: RDPR_TICK	<illegal instruction>
	.word 0xb3a549a0  ! 196: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb3a449c0  ! 199: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb1a00520  ! 201: FSQRTs	fsqrt	
	.word 0xb9ab8820  ! 203: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a408c0  ! 206: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb9508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a90820  ! 210: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a4c940  ! 211: FMULd	fmuld	%f50, %f0, %f56
	setx	data_start_4, %g1, %r19
	.word 0xb1a80c20  ! 217: FMOVRLZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 218: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbab0820  ! 219: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbdab0820  ! 222: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbba81820  ! 223: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9508000  ! 225: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a58820  ! 227: FADDs	fadds	%f22, %f0, %f28
	.word 0xb5a50840  ! 231: FADDd	faddd	%f20, %f0, %f26
	.word 0xba25e014  ! 232: SUB_I	sub 	%r23, 0x0014, %r29
	.word 0xb13d2001  ! 233: SRA_I	sra 	%r20, 0x0001, %r24
	.word 0xb150c000  ! 235: RDPR_TT	<illegal instruction>
	.word 0xb5aa0820  ! 237: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb09da1da  ! 242: XORcc_I	xorcc 	%r22, 0x01da, %r24
	.word 0xb1aa4820  ! 243: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80820  ! 246: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50860  ! 247: FADDq	dis not found

	.word 0xb3520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0xb5a80820  ! 251: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb53da001  ! 259: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xbba81420  ! 260: FMOVRNZ	dis not found

	.word 0xb5a00520  ! 262: FSQRTs	fsqrt	
	.word 0xb1504000  ! 264: RDPR_TNPC	<illegal instruction>
	.word 0xbba80420  ! 278: FMOVRZ	dis not found

	.word 0xb7a54820  ! 282: FADDs	fadds	%f21, %f0, %f27
	.word 0xbbaa4820  ! 284: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0x919460f6  ! 291: WRPR_PIL_I	wrpr	%r17, 0x00f6, %pil
	setx	data_start_0, %g1, %r19
	.word 0xbf520000  ! 297: RDPR_PIL	<illegal instruction>
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 301: RDPR_PSTATE	<illegal instruction>
	.word 0xbda80820  ! 302: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb1520000  ! 305: RDPR_PIL	<illegal instruction>
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 308: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a81c20  ! 310: FMOVRGEZ	dis not found

	.word 0xbec4a0a5  ! 311: ADDCcc_I	addccc 	%r18, 0x00a5, %r31
	.word 0xb3a81c20  ! 312: FMOVRGEZ	dis not found

	.word 0xb7540000  ! 313: RDPR_GL	<illegal instruction>
	.word 0xbda81420  ! 315: FMOVRNZ	dis not found

	.word 0xbba80420  ! 318: FMOVRZ	dis not found

	.word 0xbd50c000  ! 322: RDPR_TT	<illegal instruction>
	.word 0xb7a488e0  ! 323: FSUBq	dis not found

	.word 0xbba81420  ! 327: FMOVRNZ	dis not found

	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031c, %g1, %o0
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
	.word 0xbfa8c820  ! 333: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbfab4820  ! 337: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbba84820  ! 339: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	0x30335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb5a9c820  ! 345: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9520000  ! 348: RDPR_PIL	<illegal instruction>
	.word 0xbd351000  ! 349: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xb1a8c820  ! 353: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5a98820  ! 354: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3508000  ! 357: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xb9aa4820  ! 364: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb57ca401  ! 366: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xbf500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb9641800  ! 371: MOVcc_R	<illegal instruction>
	.word 0xbba80c20  ! 376: FMOVRLZ	dis not found

	.word 0xb5a48860  ! 377: FADDq	dis not found

	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	.word 0xbfa449a0  ! 382: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xbfa9c820  ! 385: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb2240000  ! 386: SUB_R	sub 	%r16, %r0, %r25
	.word 0xb0052116  ! 389: ADD_I	add 	%r20, 0x0116, %r24
	.word 0xb5abc820  ! 393: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb751c000  ! 397: RDPR_TL	<illegal instruction>
	.word 0xbda5c820  ! 398: FADDs	fadds	%f23, %f0, %f30
	.word 0x899421fe  ! 400: WRPR_TICK_I	wrpr	%r16, 0x01fe, %tick
	.word 0xbfa00020  ! 402: FMOVs	fmovs	%f0, %f31
	.word 0xbfa408e0  ! 403: FSUBq	dis not found

	.word 0x8794a1db  ! 406: WRPR_TT_I	wrpr	%r18, 0x01db, %tt
	.word 0xbfa80820  ! 410: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb3a588a0  ! 413: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb750c000  ! 414: RDPR_TT	<illegal instruction>
	.word 0xb5518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0x9194e19f  ! 418: WRPR_PIL_I	wrpr	%r19, 0x019f, %pil
	.word 0xb1a00520  ! 424: FSQRTs	fsqrt	
	setx	0x20333, %g1, %o0
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
	.word 0xb3a80420  ! 428: FMOVRZ	dis not found

	.word 0xb5a58860  ! 430: FADDq	dis not found

	setx	data_start_4, %g1, %r22
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 438: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbd504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0xbf2c5000  ! 442: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xb5508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a54920  ! 448: FMULs	fmuls	%f21, %f0, %f28
	.word 0xbda40960  ! 449: FMULq	dis not found

	.word 0xb7a90820  ! 452: FMOVLEU	fmovs	%fcc1, %f0, %f27
	setx	0x1022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 456: FDIVd	fdivd	%f54, %f0, %f58
	setx	0x3021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 458: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab8820  ! 461: FMOVPOS	fmovs	%fcc1, %f0, %f28
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 466: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00020  ! 467: FMOVs	fmovs	%f0, %f28
	.word 0xb9a88820  ! 468: FMOVLE	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r19
	.word 0xbfa54940  ! 471: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb9a80420  ! 475: FMOVRZ	dis not found

	.word 0xbfa81c20  ! 476: FMOVRGEZ	dis not found

	.word 0xb4850000  ! 477: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xb1a5c960  ! 478: FMULq	dis not found

	.word 0xb7a44920  ! 480: FMULs	fmuls	%f17, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 486: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e1cb  ! 496: WRPR_TPC_I	wrpr	%r23, 0x01cb, %tpc
	.word 0xbdaa4820  ! 499: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbf500000  ! 502: RDPR_TPC	<illegal instruction>
	.word 0xb61de03c  ! 506: XOR_I	xor 	%r23, 0x003c, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	.word 0xb1a5c8a0  ! 509: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xbf50c000  ! 510: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 511: RDPR_PIL	<illegal instruction>
	.word 0xbfa81c20  ! 512: FMOVRGEZ	dis not found

	.word 0xbda8c820  ! 513: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb8a5e18f  ! 517: SUBcc_I	subcc 	%r23, 0x018f, %r28
	.word 0xbfa00520  ! 518: FSQRTs	fsqrt	
	.word 0xb37d0400  ! 519: MOVR_R	movre	%r20, %r0, %r25
	setx	0x10137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 525: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 527: FMOVRLZ	dis not found

	.word 0xbba40860  ! 534: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xbb518000  ! 544: RDPR_PSTATE	<illegal instruction>
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8150000  ! 551: OR_R	or 	%r20, %r0, %r28
	.word 0x899520f3  ! 552: WRPR_TICK_I	wrpr	%r20, 0x00f3, %tick
	.word 0xb245a091  ! 558: ADDC_I	addc 	%r22, 0x0091, %r25
	.word 0x8994e0b0  ! 561: WRPR_TICK_I	wrpr	%r19, 0x00b0, %tick
	.word 0xb2b58000  ! 562: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xb9ab4820  ! 564: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x879561a5  ! 567: WRPR_TT_I	wrpr	%r21, 0x01a5, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982e41  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xb684208b  ! 570: ADDcc_I	addcc 	%r16, 0x008b, %r27
	.word 0xbda98820  ! 577: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb0b4c000  ! 580: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xbba00020  ! 583: FMOVs	fmovs	%f0, %f29
	.word 0xbb540000  ! 584: RDPR_GL	<illegal instruction>
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 589: RDPR_TICK	<illegal instruction>
	.word 0xb7344000  ! 591: SRL_R	srl 	%r17, %r0, %r27
	.word 0xbf540000  ! 594: RDPR_GL	<illegal instruction>
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e156  ! 597: WRPR_PSTATE_I	wrpr	%r19, 0x0156, %pstate
	.word 0xb1a449a0  ! 598: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xbba80c20  ! 600: FMOVRLZ	dis not found

	.word 0xb9a00020  ! 603: FMOVs	fmovs	%f0, %f28
	setx	data_start_3, %g1, %r23
	.word 0x879520f2  ! 611: WRPR_TT_I	wrpr	%r20, 0x00f2, %tt
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9e0  ! 616: FDIVq	dis not found

	.word 0xbf518000  ! 618: RDPR_PSTATE	<illegal instruction>
	.word 0xbda5c9e0  ! 621: FDIVq	dis not found

	.word 0xb5a00540  ! 622: FSQRTd	fsqrt	
	.word 0xb3a00020  ! 628: FMOVs	fmovs	%f0, %f25
	.word 0xb3ab8820  ! 631: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbc0cc000  ! 632: AND_R	and 	%r19, %r0, %r30
	.word 0xbba40840  ! 633: FADDd	faddd	%f16, %f0, %f60
	.word 0xb7518000  ! 634: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a5c9a0  ! 636: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb1a548c0  ! 648: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb3a84820  ! 649: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb7ab0820  ! 652: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a9c820  ! 653: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81c20  ! 654: FMOVRGEZ	dis not found

	.word 0xbda448a0  ! 655: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb5a409c0  ! 659: FDIVd	fdivd	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0b40000  ! 664: ORNcc_R	orncc 	%r16, %r0, %r24
	.word 0x89946197  ! 665: WRPR_TICK_I	wrpr	%r17, 0x0197, %tick
	.word 0xb4b520d0  ! 667: SUBCcc_I	orncc 	%r20, 0x00d0, %r26
	.word 0xb1a58940  ! 670: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb9a5c9a0  ! 671: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x8595e0b3  ! 672: WRPR_TSTATE_I	wrpr	%r23, 0x00b3, %tstate
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3cd000  ! 677: SRAX_R	srax	%r19, %r0, %r31
	.word 0xbdabc820  ! 678: FMOVVC	fmovs	%fcc1, %f0, %f30
	setx	data_start_3, %g1, %r20
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e03a  ! 682: WRPR_TICK_I	wrpr	%r23, 0x003a, %tick
	.word 0xb7ab8820  ! 683: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb8bc0000  ! 684: XNORcc_R	xnorcc 	%r16, %r0, %r28
	setx	0x20029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 689: RDPR_TT	<illegal instruction>
	.word 0xbba409c0  ! 693: FDIVd	fdivd	%f16, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 700: FMOVd	fmovd	%f0, %f30
	.word 0xbfa8c820  ! 706: FMOVL	fmovs	%fcc1, %f0, %f31
	setx	0x3020e, %g1, %o0
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
	.word 0xb5a84820  ! 711: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbc344000  ! 712: SUBC_R	orn 	%r17, %r0, %r30
	.word 0xb3a5c8e0  ! 714: FSUBq	dis not found

	.word 0xb5a58960  ! 716: FMULq	dis not found

	.word 0xbfa58860  ! 717: FADDq	dis not found

	.word 0xbd520000  ! 720: RDPR_PIL	<illegal instruction>
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba588c0  ! 722: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb3aa0820  ! 723: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab8820  ! 726: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbf50c000  ! 730: RDPR_TT	<illegal instruction>
	.word 0xbbabc820  ! 731: FMOVVC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982b91  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	.word 0xb5a00560  ! 740: FSQRTq	fsqrt	
	.word 0xb5a5c820  ! 742: FADDs	fadds	%f23, %f0, %f26
	.word 0xb1a00040  ! 747: FMOVd	fmovd	%f0, %f24
	.word 0xb8ad0000  ! 749: ANDNcc_R	andncc 	%r20, %r0, %r28
	.word 0xbda50940  ! 750: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb1a90820  ! 751: FMOVLEU	fmovs	%fcc1, %f0, %f24
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 754: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a54860  ! 764: FADDq	dis not found

	.word 0xbfa00560  ! 765: FSQRTq	fsqrt	
	.word 0x8395e1c9  ! 767: WRPR_TNPC_I	wrpr	%r23, 0x01c9, %tnpc
	setx	data_start_3, %g1, %r19
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879521ff  ! 771: WRPR_TT_I	wrpr	%r20, 0x01ff, %tt
	.word 0xbda00540  ! 772: FSQRTd	fsqrt	
	.word 0xb1a4c940  ! 773: FMULd	fmuld	%f50, %f0, %f24
	.word 0xbda44840  ! 778: FADDd	faddd	%f48, %f0, %f30
	.word 0xbfaa0820  ! 780: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48860  ! 783: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0xbd480000  ! 789: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb21d21d1  ! 793: XOR_I	xor 	%r20, 0x01d1, %r25
	setx	0x20213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbabc2124  ! 797: XNORcc_I	xnorcc 	%r16, 0x0124, %r29
	mov	2, %r14
	.word 0xa193a000  ! 798: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 801: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5518000  ! 806: RDPR_PSTATE	<illegal instruction>
	.word 0xbba88820  ! 808: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbfabc820  ! 812: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 813: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x839421e7  ! 823: WRPR_TNPC_I	wrpr	%r16, 0x01e7, %tnpc
	.word 0xbfa589e0  ! 826: FDIVq	dis not found

	.word 0xb1a94820  ! 828: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	0x3012b, %g1, %o0
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
	.word 0xb1a489e0  ! 832: FDIVq	dis not found

	.word 0xbfa509e0  ! 834: FDIVq	dis not found

	.word 0xb5510000  ! 839: RDPR_TICK	<illegal instruction>
	.word 0x83946019  ! 841: WRPR_TNPC_I	wrpr	%r17, 0x0019, %tnpc
	.word 0xb1518000  ! 844: RDPR_PSTATE	<illegal instruction>
	.word 0xbe0ca047  ! 846: AND_I	and 	%r18, 0x0047, %r31
	.word 0xb7480000  ! 848: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbab8820  ! 849: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a9c820  ! 851: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x8795217b  ! 857: WRPR_TT_I	wrpr	%r20, 0x017b, %tt
	.word 0xb5a81820  ! 858: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1a549c0  ! 862: FDIVd	fdivd	%f52, %f0, %f24
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb024a141  ! 865: SUB_I	sub 	%r18, 0x0141, %r24
	.word 0xbd510000  ! 869: RDPR_TICK	<illegal instruction>
	.word 0xb7a44940  ! 870: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb3a00560  ! 873: FSQRTq	fsqrt	
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeace147  ! 878: ANDNcc_I	andncc 	%r19, 0x0147, %r31
	.word 0xb3a58840  ! 880: FADDd	faddd	%f22, %f0, %f56
	mov	1, %r12
	.word 0x8f932000  ! 882: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba00520  ! 886: FSQRTs	fsqrt	
	.word 0xb1a94820  ! 888: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a9c820  ! 891: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a58920  ! 892: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb1aac820  ! 894: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbb35e001  ! 896: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xb7518000  ! 897: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa54920  ! 898: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb3ab8820  ! 899: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a98820  ! 900: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a9c820  ! 901: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a58920  ! 902: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb7500000  ! 904: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r19
	.word 0x8d9520c4  ! 912: WRPR_PSTATE_I	wrpr	%r20, 0x00c4, %pstate
	.word 0xb845c000  ! 914: ADDC_R	addc 	%r23, %r0, %r28
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 923: FMOVRGEZ	dis not found

	setx	0x107, %g1, %o0
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
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5346001  ! 930: SRL_I	srl 	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba81420  ! 932: FMOVRNZ	dis not found

	.word 0xb9a48920  ! 935: FMULs	fmuls	%f18, %f0, %f28
	.word 0xbfa81c20  ! 936: FMOVRGEZ	dis not found

	.word 0xbba00040  ! 943: FMOVd	fmovd	%f0, %f60
	.word 0xb3a00520  ! 946: FSQRTs	fsqrt	
	.word 0xb03dc000  ! 949: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xbe3c604e  ! 954: XNOR_I	xnor 	%r17, 0x004e, %r31
	.word 0xbf540000  ! 955: RDPR_GL	<illegal instruction>
	.word 0xb5a408c0  ! 956: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xb7a5c8a0  ! 958: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xbd50c000  ! 962: RDPR_TT	<illegal instruction>
	setx	0x10128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 966: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbb508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a0f7  ! 970: WRPR_PSTATE_I	wrpr	%r18, 0x00f7, %pstate
	.word 0xbd500000  ! 973: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9c0  ! 983: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb615a01c  ! 984: OR_I	or 	%r22, 0x001c, %r27
	mov	1, %r14
	.word 0xa193a000  ! 986: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r14
	.word 0xa193a000  ! 987: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa84820  ! 989: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb9504000  ! 992: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983919  ! 997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1919, %hpstate
	.word 0x859421be  ! 999: WRPR_TSTATE_I	wrpr	%r16, 0x01be, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 1000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xbf518000  ! 1001: RDPR_PSTATE	<illegal instruction>
	.word 0xbaa44000  ! 1005: SUBcc_R	subcc 	%r17, %r0, %r29
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 1012: FSQRTd	fsqrt	
	.word 0x859561c4  ! 1015: WRPR_TSTATE_I	wrpr	%r21, 0x01c4, %tstate
	.word 0x8994a01d  ! 1020: WRPR_TICK_I	wrpr	%r18, 0x001d, %tick
	mov	2, %r12
	.word 0x8f932000  ! 1022: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb8850000  ! 1023: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xbdabc820  ! 1025: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbebcc000  ! 1026: XNORcc_R	xnorcc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a88820  ! 1030: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 1032: FMOVN	fmovs	%fcc1, %f0, %f25
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 1034: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c9e0  ! 1038: FDIVq	dis not found

	.word 0xb7a81c20  ! 1039: FMOVRGEZ	dis not found

	.word 0xbea4a13e  ! 1040: SUBcc_I	subcc 	%r18, 0x013e, %r31
	.word 0xb3a50960  ! 1044: FMULq	dis not found

	.word 0xb7a40860  ! 1045: FADDq	dis not found

	.word 0xb3a409e0  ! 1047: FDIVq	dis not found

	.word 0xb5a40920  ! 1050: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb1520000  ! 1053: RDPR_PIL	<illegal instruction>
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	.word 0x8795e169  ! 1057: WRPR_TT_I	wrpr	%r23, 0x0169, %tt
	.word 0xbba00560  ! 1065: FSQRTq	fsqrt	
	.word 0xb5a81c20  ! 1066: FMOVRGEZ	dis not found

	.word 0xb9a00540  ! 1068: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982d11  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d11, %hpstate
	.word 0xb9a48960  ! 1071: FMULq	dis not found

	.word 0xbba94820  ! 1072: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 1075: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa0820  ! 1079: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbb518000  ! 1084: RDPR_PSTATE	<illegal instruction>
	.word 0xbb508000  ! 1091: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a80820  ! 1092: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa0820  ! 1096: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3518000  ! 1097: RDPR_PSTATE	<illegal instruction>
	.word 0x8195a1b5  ! 1100: WRPR_TPC_I	wrpr	%r22, 0x01b5, %tpc
	.word 0xbfaa0820  ! 1101: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a98820  ! 1102: FMOVNEG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x91946037  ! 1110: WRPR_PIL_I	wrpr	%r17, 0x0037, %pil
	.word 0xb8a4203f  ! 1112: SUBcc_I	subcc 	%r16, 0x003f, %r28
	.word 0xbfa58860  ! 1115: FADDq	dis not found

	.word 0xb7a58820  ! 1118: FADDs	fadds	%f22, %f0, %f27
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 1121: RDPR_TICK	<illegal instruction>
	.word 0xb3a4c9e0  ! 1122: FDIVq	dis not found

	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 1127: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbd540000  ! 1128: RDPR_GL	<illegal instruction>
	.word 0xbbaa0820  ! 1133: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c960  ! 1136: FMULq	dis not found

	.word 0xb950c000  ! 1137: RDPR_TT	<illegal instruction>
	.word 0xb7aa0820  ! 1141: FMOVA	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982cd1  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd1, %hpstate
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 1146: FADDd	faddd	%f18, %f0, %f56
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 1148: MOVcc_I	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xbd51c000  ! 1150: RDPR_TL	<illegal instruction>
	.word 0xb5a90820  ! 1153: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbb508000  ! 1155: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 1157: RDPR_TT	<illegal instruction>
	.word 0xb8adc000  ! 1159: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xbfaa4820  ! 1160: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a54820  ! 1163: FADDs	fadds	%f21, %f0, %f24
	.word 0xbb480000  ! 1174: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9aa4820  ! 1175: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0x8595e137  ! 1177: WRPR_TSTATE_I	wrpr	%r23, 0x0137, %tstate
	.word 0xb5a81420  ! 1178: FMOVRNZ	dis not found

	.word 0xb1ab0820  ! 1180: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	0x20039, %g1, %o0
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
	.word 0xbbaa8820  ! 1183: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00560  ! 1184: FSQRTq	fsqrt	
	.word 0xbb518000  ! 1185: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x819839d9  ! 1190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d9, %hpstate
	.word 0xbfa80820  ! 1194: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0x8f932000  ! 1195: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb6050000  ! 1196: ADD_R	add 	%r20, %r0, %r27
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2cf001  ! 1199: SLLX_I	sllx	%r19, 0x0001, %r31
	.word 0xb5a00520  ! 1200: FSQRTs	fsqrt	
	.word 0x8594a18d  ! 1201: WRPR_TSTATE_I	wrpr	%r18, 0x018d, %tstate
	.word 0xbba00540  ! 1204: FSQRTd	fsqrt	
	.word 0xbf520000  ! 1206: RDPR_PIL	<illegal instruction>
	setx	0x3000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c920  ! 1208: FMULs	fmuls	%f19, %f0, %f27
	.word 0xbda509a0  ! 1210: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb9a58840  ! 1211: FADDd	faddd	%f22, %f0, %f28
	.word 0x8994a07b  ! 1213: WRPR_TICK_I	wrpr	%r18, 0x007b, %tick
	.word 0xb3a00520  ! 1219: FSQRTs	fsqrt	
	.word 0xb49d4000  ! 1220: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0x919460c6  ! 1221: WRPR_PIL_I	wrpr	%r17, 0x00c6, %pil
	.word 0xb1520000  ! 1222: RDPR_PIL	<illegal instruction>
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 1227: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a489c0  ! 1228: FDIVd	fdivd	%f18, %f0, %f56
	.word 0x8795e1bb  ! 1232: WRPR_TT_I	wrpr	%r23, 0x01bb, %tt
	.word 0xbda84820  ! 1235: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	data_start_5, %g1, %r16
	.word 0xbf35d000  ! 1245: SRLX_R	srlx	%r23, %r0, %r31
	.word 0xb3a00020  ! 1248: FMOVs	fmovs	%f0, %f25
	.word 0xbc1da168  ! 1254: XOR_I	xor 	%r22, 0x0168, %r30
	.word 0x8994a156  ! 1257: WRPR_TICK_I	wrpr	%r18, 0x0156, %tick
	.word 0xba3c21ff  ! 1259: XNOR_I	xnor 	%r16, 0x01ff, %r29
	.word 0xb5641800  ! 1260: MOVcc_R	<illegal instruction>
	.word 0xb3a00560  ! 1263: FSQRTq	fsqrt	
	.word 0x8794e0e7  ! 1268: WRPR_TT_I	wrpr	%r19, 0x00e7, %tt
	.word 0xb9a00020  ! 1270: FMOVs	fmovs	%f0, %f28
	.word 0xb7a5c940  ! 1271: FMULd	fmuld	%f54, %f0, %f58
	.word 0xbd510000  ! 1272: RDPR_TICK	<illegal instruction>
	.word 0xb351c000  ! 1273: RDPR_TL	<illegal instruction>
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919420d2  ! 1279: WRPR_PIL_I	wrpr	%r16, 0x00d2, %pil
	.word 0xb7508000  ! 1282: RDPR_TSTATE	<illegal instruction>
	.word 0xbba81420  ! 1283: FMOVRNZ	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 1284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a54840  ! 1290: FADDd	faddd	%f52, %f0, %f24
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c820  ! 1292: FADDs	fadds	%f19, %f0, %f31
	.word 0xb1520000  ! 1293: RDPR_PIL	<illegal instruction>
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd7d0400  ! 1306: MOVR_R	movre	%r20, %r0, %r30
	.word 0xb7a98820  ! 1311: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81420  ! 1312: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xb5a94820  ! 1314: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80c20  ! 1315: FMOVRLZ	dis not found

	.word 0xb1aa4820  ! 1317: FMOVNE	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f932000  ! 1318: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd508000  ! 1319: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a4c8c0  ! 1324: FSUBd	fsubd	%f50, %f0, %f24
	.word 0x859421e0  ! 1325: WRPR_TSTATE_I	wrpr	%r16, 0x01e0, %tstate
	.word 0xbba84820  ! 1328: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb00cc000  ! 1330: AND_R	and 	%r19, %r0, %r24
	.word 0x91946105  ! 1332: WRPR_PIL_I	wrpr	%r17, 0x0105, %pil
	.word 0xb6c58000  ! 1334: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xb1a548c0  ! 1336: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb3a88820  ! 1346: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0x8f932000  ! 1350: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb2b48000  ! 1352: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb5aa0820  ! 1353: FMOVA	fmovs	%fcc1, %f0, %f26
	setx	data_start_3, %g1, %r22
	.word 0xb3480000  ! 1357: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb43d0000  ! 1358: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xbfa00520  ! 1359: FSQRTs	fsqrt	
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1369: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 1378: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a9c820  ! 1380: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8195e08f  ! 1381: WRPR_TPC_I	wrpr	%r23, 0x008f, %tpc
	mov	1, %r14
	.word 0xa193a000  ! 1386: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a48960  ! 1387: FMULq	dis not found

	.word 0x8795e1ea  ! 1394: WRPR_TT_I	wrpr	%r23, 0x01ea, %tt
	.word 0xb5a489a0  ! 1397: FDIVs	fdivs	%f18, %f0, %f26
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 1402: FMOVRZ	dis not found

	.word 0xbbaa0820  ! 1405: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa448c0  ! 1406: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb9a8c820  ! 1407: FMOVL	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r17
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 1412: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982893  ! 1414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0893, %hpstate
	mov	2, %r14
	.word 0xa193a000  ! 1420: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a81420  ! 1421: FMOVRNZ	dis not found

	.word 0xbba00560  ! 1422: FSQRTq	fsqrt	
	.word 0xb9a4c960  ! 1424: FMULq	dis not found

	.word 0xb1a549e0  ! 1428: FDIVq	dis not found

	.word 0xb7a50960  ! 1429: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a5c9a0  ! 1436: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb5540000  ! 1437: RDPR_GL	<illegal instruction>
	.word 0xb5a448e0  ! 1439: FSUBq	dis not found

	.word 0xbb641800  ! 1440: MOVcc_R	<illegal instruction>
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bda1ea  ! 1442: XNORcc_I	xnorcc 	%r22, 0x01ea, %r26
	.word 0xb7a5c9e0  ! 1443: FDIVq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 1444: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a408a0  ! 1446: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb3a548c0  ! 1448: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xb3a8c820  ! 1451: FMOVL	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982ad3  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad3, %hpstate
	.word 0xb234e0b1  ! 1456: SUBC_I	orn 	%r19, 0x00b1, %r25
	.word 0xbba48920  ! 1458: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb3a58860  ! 1462: FADDq	dis not found

	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 1466: FMOVRNZ	dis not found

	setx	0x2032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 1478: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbba00560  ! 1479: FSQRTq	fsqrt	
	setx	data_start_6, %g1, %r19
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 1496: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbbaa4820  ! 1497: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbba80820  ! 1498: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0x8595216b  ! 1502: WRPR_TSTATE_I	wrpr	%r20, 0x016b, %tstate
	mov	2, %r14
	.word 0xa193a000  ! 1503: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a54920  ! 1505: FMULs	fmuls	%f21, %f0, %f27
	mov	0, %r14
	.word 0xa193a000  ! 1507: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 1508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	.word 0xbba98820  ! 1509: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbda81c20  ! 1510: FMOVRGEZ	dis not found

	.word 0x819561b9  ! 1511: WRPR_TPC_I	wrpr	%r21, 0x01b9, %tpc
	.word 0xb9a84820  ! 1512: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3508000  ! 1513: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa4c860  ! 1515: FADDq	dis not found

	.word 0xbfa4c960  ! 1517: FMULq	dis not found

	.word 0xbb2df001  ! 1518: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xbda84820  ! 1519: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80420  ! 1521: FMOVRZ	dis not found

	.word 0x83952187  ! 1522: WRPR_TNPC_I	wrpr	%r20, 0x0187, %tnpc
	.word 0xb1a00540  ! 1523: FSQRTd	fsqrt	
	.word 0xbdabc820  ! 1524: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbd341000  ! 1526: SRLX_R	srlx	%r16, %r0, %r30
	.word 0xb1aac820  ! 1530: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a548a0  ! 1531: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb1520000  ! 1532: RDPR_PIL	<illegal instruction>
	.word 0xb7a54840  ! 1533: FADDd	faddd	%f52, %f0, %f58
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c53  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c53, %hpstate
	.word 0xb1a58960  ! 1537: FMULq	dis not found

	.word 0xbba00540  ! 1538: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0x8f932000  ! 1541: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc3c609c  ! 1547: XNOR_I	xnor 	%r17, 0x009c, %r30
	.word 0xbda84820  ! 1549: FMOVE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982b4b  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4b, %hpstate
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 1555: FMOVRZ	dis not found

	.word 0x8d94a1f0  ! 1557: WRPR_PSTATE_I	wrpr	%r18, 0x01f0, %pstate
	.word 0xb5a409c0  ! 1560: FDIVd	fdivd	%f16, %f0, %f26
	setx	data_start_6, %g1, %r23
	.word 0xb4b560f0  ! 1565: ORNcc_I	orncc 	%r21, 0x00f0, %r26
	.word 0xb1a48920  ! 1566: FMULs	fmuls	%f18, %f0, %f24
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 1572: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0x8394e186  ! 1577: WRPR_TNPC_I	wrpr	%r19, 0x0186, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 1579: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 1583: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbab8820  ! 1584: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a508c0  ! 1585: FSUBd	fsubd	%f20, %f0, %f26
	setx	data_start_5, %g1, %r21
	.word 0xbd7d0400  ! 1595: MOVR_R	movre	%r20, %r0, %r30
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c960  ! 1600: FMULq	dis not found

	.word 0xb9a5c9a0  ! 1603: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x9194a13d  ! 1606: WRPR_PIL_I	wrpr	%r18, 0x013d, %pil
	.word 0xb9a9c820  ! 1617: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a549e0  ! 1618: FDIVq	dis not found

	.word 0xb7a40860  ! 1623: FADDq	dis not found

	.word 0xb9a80420  ! 1625: FMOVRZ	dis not found

	.word 0xbba8c820  ! 1628: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb150c000  ! 1630: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 1641: RDPR_TL	<illegal instruction>
	.word 0xb1a5c820  ! 1646: FADDs	fadds	%f23, %f0, %f24
	.word 0xb735a001  ! 1649: SRL_I	srl 	%r22, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 1650: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1500000  ! 1652: RDPR_TPC	<illegal instruction>
	.word 0xbba00020  ! 1653: FMOVs	fmovs	%f0, %f29
	.word 0xb3a54840  ! 1654: FADDd	faddd	%f52, %f0, %f56
	.word 0xbda44820  ! 1658: FADDs	fadds	%f17, %f0, %f30
	.word 0xb7a448a0  ! 1659: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xb3540000  ! 1661: RDPR_GL	<illegal instruction>
	.word 0xbfab0820  ! 1663: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x819520bf  ! 1670: WRPR_TPC_I	wrpr	%r20, 0x00bf, %tpc
	.word 0xb3a81420  ! 1675: FMOVRNZ	dis not found

	.word 0xbfa00560  ! 1677: FSQRTq	fsqrt	
	.word 0x8994a089  ! 1679: WRPR_TICK_I	wrpr	%r18, 0x0089, %tick
	.word 0xb1a80820  ! 1680: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 1684: RDPR_PSTATE	<illegal instruction>
	.word 0xb1510000  ! 1685: RDPR_TICK	<illegal instruction>
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 1690: RDPR_TNPC	<illegal instruction>
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 1695: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c9c0  ! 1699: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xb5a54960  ! 1700: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0xb8242193  ! 1704: SUB_I	sub 	%r16, 0x0193, %r28
	.word 0xb751c000  ! 1705: RDPR_TL	<illegal instruction>
	.word 0xb62d8000  ! 1706: ANDN_R	andn 	%r22, %r0, %r27
	.word 0xb1510000  ! 1709: RDPR_TICK	<illegal instruction>
	.word 0xbfa80420  ! 1714: FMOVRZ	dis not found

	.word 0xb3a88820  ! 1715: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbf7d2401  ! 1718: MOVR_I	movre	%r20, 0x1, %r31
	.word 0xbfaa8820  ! 1720: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80820  ! 1721: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a81420  ! 1724: FMOVRNZ	dis not found

	.word 0xbd518000  ! 1727: RDPR_PSTATE	<illegal instruction>
	.word 0xb01d61a6  ! 1729: XOR_I	xor 	%r21, 0x01a6, %r24
	.word 0xbda5c8c0  ! 1730: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb1a00520  ! 1731: FSQRTs	fsqrt	
	.word 0xb5a80420  ! 1733: FMOVRZ	dis not found

	.word 0xbfa84820  ! 1734: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 1738: MOVcc_R	<illegal instruction>
	.word 0xbd480000  ! 1739: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb735f001  ! 1740: SRLX_I	srlx	%r23, 0x0001, %r27
	.word 0xbba40860  ! 1743: FADDq	dis not found

	.word 0x8d94617b  ! 1744: WRPR_PSTATE_I	wrpr	%r17, 0x017b, %pstate
	.word 0xbf7d4400  ! 1745: MOVR_R	movre	%r21, %r0, %r31
	.word 0xb3ab0820  ! 1746: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9357001  ! 1747: SRLX_I	srlx	%r21, 0x0001, %r28
	.word 0xb0c56068  ! 1751: ADDCcc_I	addccc 	%r21, 0x0068, %r24
	.word 0xb7504000  ! 1754: RDPR_TNPC	<illegal instruction>
	.word 0xbba549a0  ! 1757: FDIVs	fdivs	%f21, %f0, %f29
	setx	0x30336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 1765: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb8c44000  ! 1766: ADDCcc_R	addccc 	%r17, %r0, %r28
	.word 0xbba588e0  ! 1769: FSUBq	dis not found

	setx	data_start_7, %g1, %r23
	.word 0xb9aa0820  ! 1777: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba00540  ! 1781: FSQRTd	fsqrt	
	.word 0xbba80820  ! 1783: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	0x1000f, %g1, %o0
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
	.word 0xb9a589c0  ! 1794: FDIVd	fdivd	%f22, %f0, %f28
	.word 0x8994e0e7  ! 1795: WRPR_TICK_I	wrpr	%r19, 0x00e7, %tick
	.word 0xb53dd000  ! 1799: SRAX_R	srax	%r23, %r0, %r26
	.word 0x859521e6  ! 1800: WRPR_TSTATE_I	wrpr	%r20, 0x01e6, %tstate
	.word 0xbfa80420  ! 1803: FMOVRZ	dis not found

	.word 0xb5a44820  ! 1805: FADDs	fadds	%f17, %f0, %f26
	.word 0xb551c000  ! 1808: RDPR_TL	<illegal instruction>
	.word 0xbd2d5000  ! 1811: SLLX_R	sllx	%r21, %r0, %r30
	.word 0xb7a449c0  ! 1814: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xbdabc820  ! 1818: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c9c0  ! 1819: FDIVd	fdivd	%f50, %f0, %f62
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1824: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbfa449e0  ! 1827: FDIVq	dis not found

	.word 0x8194a0ae  ! 1828: WRPR_TPC_I	wrpr	%r18, 0x00ae, %tpc
	.word 0xb5a44820  ! 1831: FADDs	fadds	%f17, %f0, %f26
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1838: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5540000  ! 1844: RDPR_GL	<illegal instruction>
	.word 0xb1aa4820  ! 1845: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb6350000  ! 1846: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xb3a44960  ! 1847: FMULq	dis not found

	.word 0xb48ca093  ! 1852: ANDcc_I	andcc 	%r18, 0x0093, %r26
	.word 0xb3a90820  ! 1855: FMOVLEU	fmovs	%fcc1, %f0, %f25
	mov	2, %r14
	.word 0xa193a000  ! 1856: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7abc820  ! 1860: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa81420  ! 1862: FMOVRNZ	dis not found

	.word 0xb4346126  ! 1863: ORN_I	orn 	%r17, 0x0126, %r26
	.word 0xb3a489e0  ! 1865: FDIVq	dis not found

	.word 0x8794a014  ! 1869: WRPR_TT_I	wrpr	%r18, 0x0014, %tt
	.word 0x8394e06a  ! 1871: WRPR_TNPC_I	wrpr	%r19, 0x006a, %tnpc
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 1882: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a549a0  ! 1883: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbd359000  ! 1884: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xb3a80820  ! 1885: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa4820  ! 1888: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9504000  ! 1891: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbda58960  ! 1895: FMULq	dis not found

	setx	0x10300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 1902: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb6c44000  ! 1904: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xb7a80c20  ! 1905: FMOVRLZ	dis not found

	.word 0xba15e00c  ! 1910: OR_I	or 	%r23, 0x000c, %r29
	.word 0xb7a449a0  ! 1911: FDIVs	fdivs	%f17, %f0, %f27
	.word 0xb1a449e0  ! 1913: FDIVq	dis not found

	.word 0xb42d6002  ! 1914: ANDN_I	andn 	%r21, 0x0002, %r26
	.word 0xbba4c8a0  ! 1920: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xb3353001  ! 1924: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb3a5c8c0  ! 1925: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xbfa488e0  ! 1929: FSUBq	dis not found

	.word 0xb3a80820  ! 1931: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0x89946182  ! 1932: WRPR_TICK_I	wrpr	%r17, 0x0182, %tick
	.word 0xb7500000  ! 1933: RDPR_TPC	<illegal instruction>
	.word 0xba84c000  ! 1934: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xbfa9c820  ! 1936: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa98820  ! 1939: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x9195a051  ! 1941: WRPR_PIL_I	wrpr	%r22, 0x0051, %pil
	.word 0xb1a589a0  ! 1942: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xb3ab0820  ! 1943: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x87946111  ! 1944: WRPR_TT_I	wrpr	%r17, 0x0111, %tt
	.word 0xb1a588e0  ! 1946: FSUBq	dis not found

	.word 0xbfaa8820  ! 1950: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	data_start_0, %g1, %r21
	.word 0xbf480000  ! 1953: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8795a1f1  ! 1954: WRPR_TT_I	wrpr	%r22, 0x01f1, %tt
	.word 0xbfa40860  ! 1955: FADDq	dis not found

	.word 0xb3504000  ! 1957: RDPR_TNPC	<illegal instruction>
	.word 0xbba81420  ! 1959: FMOVRNZ	dis not found

	.word 0xbda00540  ! 1962: FSQRTd	fsqrt	
	.word 0xb88d4000  ! 1964: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xb5a5c8a0  ! 1965: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xbf50c000  ! 1966: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 1967: FSQRTs	fsqrt	
	.word 0xb5abc820  ! 1972: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba40840  ! 1974: FADDd	faddd	%f16, %f0, %f60
	.word 0xb351c000  ! 1981: RDPR_TL	<illegal instruction>
	.word 0xb6b52000  ! 1982: SUBCcc_I	orncc 	%r20, 0x0000, %r27
	.word 0xb7a40860  ! 1984: FADDq	dis not found

	.word 0xbc3c0000  ! 1986: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xb9a80820  ! 1989: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb4ac8000  ! 1991: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xbfaac820  ! 1992: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbdab0820  ! 1993: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a509c0  ! 2002: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb1540000  ! 2003: RDPR_GL	<illegal instruction>
	.word 0xb1500000  ! 2005: RDPR_TPC	<illegal instruction>
	.word 0x8794a1da  ! 2012: WRPR_TT_I	wrpr	%r18, 0x01da, %tt
	.word 0xbba80c20  ! 2014: FMOVRLZ	dis not found

	.word 0xb3a58920  ! 2017: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb5a509a0  ! 2023: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb3a50840  ! 2026: FADDd	faddd	%f20, %f0, %f56
	.word 0xbda4c8c0  ! 2027: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb5a98820  ! 2030: FMOVNEG	fmovs	%fcc1, %f0, %f26
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 2034: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3518000  ! 2035: RDPR_PSTATE	<illegal instruction>
	.word 0xbba81820  ! 2040: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x83942002  ! 2043: WRPR_TNPC_I	wrpr	%r16, 0x0002, %tnpc
	.word 0xb1a48860  ! 2044: FADDq	dis not found

	.word 0xb7480000  ! 2045: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbda00520  ! 2047: FSQRTs	fsqrt	
	.word 0xb3a00560  ! 2048: FSQRTq	fsqrt	
	.word 0xb150c000  ! 2050: RDPR_TT	<illegal instruction>
	.word 0xb33d3001  ! 2057: SRAX_I	srax	%r20, 0x0001, %r25
	.word 0xbfabc820  ! 2060: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a40840  ! 2063: FADDd	faddd	%f16, %f0, %f26
	mov	0, %r12
	.word 0x8f932000  ! 2065: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4aca0d1  ! 2068: ANDNcc_I	andncc 	%r18, 0x00d1, %r26
	.word 0xb5510000  ! 2070: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb404c000  ! 2072: ADD_R	add 	%r19, %r0, %r26
	.word 0xbfa80c20  ! 2073: FMOVRLZ	dis not found

	.word 0xb7500000  ! 2075: RDPR_TPC	<illegal instruction>
	.word 0xb1a81c20  ! 2076: FMOVRGEZ	dis not found

	.word 0xbba80820  ! 2077: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfaa0820  ! 2078: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a88820  ! 2081: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb2258000  ! 2085: SUB_R	sub 	%r22, %r0, %r25
	mov	2, %r14
	.word 0xa193a000  ! 2086: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88d8000  ! 2091: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0x8194e145  ! 2094: WRPR_TPC_I	wrpr	%r19, 0x0145, %tpc
	.word 0x859421ed  ! 2099: WRPR_TSTATE_I	wrpr	%r16, 0x01ed, %tstate
	setx	0x30031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a58940  ! 2103: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb5a00520  ! 2106: FSQRTs	fsqrt	
	.word 0xb5518000  ! 2107: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a94820  ! 2109: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb7518000  ! 2111: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xbfa48960  ! 2114: FMULq	dis not found

	.word 0xb7a509e0  ! 2115: FDIVq	dis not found

	.word 0xb3a54940  ! 2121: FMULd	fmuld	%f52, %f0, %f56
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952097  ! 2124: WRPR_PIL_I	wrpr	%r20, 0x0097, %pil
	.word 0xb9a549a0  ! 2125: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb7aac820  ! 2127: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48820  ! 2128: FADDs	fadds	%f18, %f0, %f26
	.word 0xb9a00540  ! 2130: FSQRTd	fsqrt	
	.word 0xbfa50920  ! 2132: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb751c000  ! 2133: RDPR_TL	<illegal instruction>
	.word 0xbfa00520  ! 2135: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0xb1540000  ! 2140: RDPR_GL	<illegal instruction>
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 2145: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbfabc820  ! 2146: FMOVVC	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0x8f932000  ! 2151: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a81820  ! 2152: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbfa5c960  ! 2154: FMULq	dis not found

	.word 0xb9a4c8a0  ! 2155: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xbda449a0  ! 2156: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xb9a88820  ! 2158: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbdaac820  ! 2159: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80820  ! 2161: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbb500000  ! 2163: RDPR_TPC	<illegal instruction>
	.word 0xb9a9c820  ! 2164: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb4b5e19d  ! 2166: ORNcc_I	orncc 	%r23, 0x019d, %r26
	.word 0x8195e054  ! 2168: WRPR_TPC_I	wrpr	%r23, 0x0054, %tpc
	.word 0xb1ab8820  ! 2171: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbe254000  ! 2172: SUB_R	sub 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983a43  ! 2175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a43, %hpstate
	.word 0xbcb52075  ! 2176: ORNcc_I	orncc 	%r20, 0x0075, %r30
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e15c  ! 2183: WRPR_TPC_I	wrpr	%r23, 0x015c, %tpc
	.word 0x819520e4  ! 2184: WRPR_TPC_I	wrpr	%r20, 0x00e4, %tpc
	.word 0xbba40840  ! 2189: FADDd	faddd	%f16, %f0, %f60
	.word 0xb1518000  ! 2190: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a94820  ! 2195: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a48920  ! 2196: FMULs	fmuls	%f18, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x8198388b  ! 2198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188b, %hpstate
	.word 0xbda90820  ! 2199: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbda88820  ! 2204: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00540  ! 2207: FSQRTd	fsqrt	
	.word 0xbd480000  ! 2212: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb4c4208d  ! 2214: ADDCcc_I	addccc 	%r16, 0x008d, %r26
	.word 0xb7a449c0  ! 2217: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xbfa81420  ! 2218: FMOVRNZ	dis not found

	.word 0xbfa80820  ! 2221: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb3a54840  ! 2222: FADDd	faddd	%f52, %f0, %f56
	.word 0xbb51c000  ! 2229: RDPR_TL	<illegal instruction>
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda489c0  ! 2232: FDIVd	fdivd	%f18, %f0, %f30
	mov	2, %r14
	.word 0xa193a000  ! 2233: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a4c920  ! 2235: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbb2cc000  ! 2236: SLL_R	sll 	%r19, %r0, %r29
	.word 0xbbabc820  ! 2237: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa589a0  ! 2241: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb1a508e0  ! 2246: FSUBq	dis not found

	.word 0xb9504000  ! 2247: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 2251: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5abc820  ! 2254: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a589a0  ! 2256: FDIVs	fdivs	%f22, %f0, %f24
	.word 0x8795e160  ! 2257: WRPR_TT_I	wrpr	%r23, 0x0160, %tt
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe84219a  ! 2260: ADDcc_I	addcc 	%r16, 0x019a, %r31
	.word 0xbf518000  ! 2261: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a44960  ! 2262: FMULq	dis not found

	.word 0xbfa00560  ! 2263: FSQRTq	fsqrt	
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a448e0  ! 2271: FSUBq	dis not found

	.word 0xb7a40920  ! 2274: FMULs	fmuls	%f16, %f0, %f27
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb57d0400  ! 2290: MOVR_R	movre	%r20, %r0, %r26
	.word 0x8795e19b  ! 2291: WRPR_TT_I	wrpr	%r23, 0x019b, %tt
	.word 0xb1a9c820  ! 2292: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2301: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0x8d95a02b  ! 2307: WRPR_PSTATE_I	wrpr	%r22, 0x002b, %pstate
	setx	0x30124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 2309: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbc1d8000  ! 2311: XOR_R	xor 	%r22, %r0, %r30
	.word 0xb950c000  ! 2312: RDPR_TT	<illegal instruction>
	.word 0xb0bd8000  ! 2313: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xbe348000  ! 2315: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xb9ab4820  ! 2324: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a94820  ! 2325: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba48860  ! 2326: FADDq	dis not found

	.word 0x89956199  ! 2327: WRPR_TICK_I	wrpr	%r21, 0x0199, %tick
	.word 0xb7a40920  ! 2328: FMULs	fmuls	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 2330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	.word 0xbfa54940  ! 2332: FMULd	fmuld	%f52, %f0, %f62
	.word 0xba1cc000  ! 2333: XOR_R	xor 	%r19, %r0, %r29
	.word 0xb00d20d9  ! 2336: AND_I	and 	%r20, 0x00d9, %r24
	.word 0xbfaa4820  ! 2339: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb8156011  ! 2341: OR_I	or 	%r21, 0x0011, %r28
	.word 0xb5a00540  ! 2343: FSQRTd	fsqrt	
	.word 0xb7504000  ! 2346: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb1a81420  ! 2348: FMOVRNZ	dis not found

	.word 0xbc34c000  ! 2349: SUBC_R	orn 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c920  ! 2357: FMULs	fmuls	%f19, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983b03  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b03, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2371: RDPR_TNPC	<illegal instruction>
	.word 0xbdab4820  ! 2373: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbd540000  ! 2376: RDPR_GL	<illegal instruction>
	.word 0x91946150  ! 2378: WRPR_PIL_I	wrpr	%r17, 0x0150, %pil
	.word 0xb7a88820  ! 2379: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9518000  ! 2383: RDPR_PSTATE	<illegal instruction>
	setx	0x12c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9c0  ! 2385: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbe150000  ! 2390: OR_R	or 	%r20, %r0, %r31
	.word 0xb1a00560  ! 2391: FSQRTq	fsqrt	
	.word 0xb0846125  ! 2393: ADDcc_I	addcc 	%r17, 0x0125, %r24
	.word 0xbda48940  ! 2396: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb1a50840  ! 2398: FADDd	faddd	%f20, %f0, %f24
	.word 0xb3a449c0  ! 2401: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb3a4c860  ! 2402: FADDq	dis not found

	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 2404: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00560  ! 2409: FSQRTq	fsqrt	
	.word 0xb751c000  ! 2410: RDPR_TL	<illegal instruction>
	.word 0xbcc54000  ! 2413: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0x839560bb  ! 2420: WRPR_TNPC_I	wrpr	%r21, 0x00bb, %tnpc
	.word 0xb9a589a0  ! 2427: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb9a00540  ! 2429: FSQRTd	fsqrt	
	.word 0xb3510000  ! 2433: RDPR_TICK	<illegal instruction>
	.word 0x9194a096  ! 2435: WRPR_PIL_I	wrpr	%r18, 0x0096, %pil
	.word 0xbda48960  ! 2436: FMULq	dis not found

	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2439: RDPR_TNPC	<illegal instruction>
	.word 0xb3a50940  ! 2441: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbda44920  ! 2442: FMULs	fmuls	%f17, %f0, %f30
	.word 0xbb50c000  ! 2445: RDPR_TT	<illegal instruction>
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2ce001  ! 2450: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xb3504000  ! 2451: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198299b  ! 2452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0xb6c48000  ! 2454: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb7a84820  ! 2456: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a44860  ! 2457: FADDq	dis not found

	.word 0x8395a187  ! 2460: WRPR_TNPC_I	wrpr	%r22, 0x0187, %tnpc
	.word 0xbb508000  ! 2462: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00560  ! 2463: FSQRTq	fsqrt	
	.word 0xb3a80420  ! 2465: FMOVRZ	dis not found

	.word 0xb3a509e0  ! 2468: FDIVq	dis not found

	.word 0x8d94e020  ! 2469: WRPR_PSTATE_I	wrpr	%r19, 0x0020, %pstate
	.word 0xb5a81820  ! 2473: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbc240000  ! 2479: SUB_R	sub 	%r16, %r0, %r30
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942116  ! 2484: WRPR_TT_I	wrpr	%r16, 0x0116, %tt
	.word 0xb5ab0820  ! 2485: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbb510000  ! 2492: RDPR_TICK	<illegal instruction>
	.word 0xb551c000  ! 2495: RDPR_TL	<illegal instruction>
	.word 0xbdab4820  ! 2499: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba48960  ! 2500: FMULq	dis not found

	.word 0xb7a54920  ! 2503: FMULs	fmuls	%f21, %f0, %f27
	.word 0xbda98820  ! 2508: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb92d5000  ! 2510: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xbfa81c20  ! 2512: FMOVRGEZ	dis not found

	.word 0xb5a4c820  ! 2517: FADDs	fadds	%f19, %f0, %f26
	.word 0xba154000  ! 2520: OR_R	or 	%r21, %r0, %r29
	.word 0xb13c9000  ! 2521: SRAX_R	srax	%r18, %r0, %r24
	.word 0xb9a44960  ! 2523: FMULq	dis not found

	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 2526: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbba44920  ! 2527: FMULs	fmuls	%f17, %f0, %f29
	.word 0xb205c000  ! 2529: ADD_R	add 	%r23, %r0, %r25
	.word 0xb9a4c960  ! 2534: FMULq	dis not found

	.word 0xb535b001  ! 2535: SRLX_I	srlx	%r22, 0x0001, %r26
	.word 0xb1a80420  ! 2539: FMOVRZ	dis not found

	.word 0xbba90820  ! 2543: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb80561a6  ! 2544: ADD_I	add 	%r21, 0x01a6, %r28
	.word 0xb9a548c0  ! 2546: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb9a00020  ! 2549: FMOVs	fmovs	%f0, %f28
	.word 0xb151c000  ! 2551: RDPR_TL	<illegal instruction>
	.word 0xb9a00040  ! 2555: FMOVd	fmovd	%f0, %f28
	.word 0xb9a00520  ! 2559: FSQRTs	fsqrt	
	.word 0xb7a98820  ! 2566: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48820  ! 2568: FADDs	fadds	%f18, %f0, %f26
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 2571: FSQRTq	fsqrt	
	.word 0xbd518000  ! 2576: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a81420  ! 2582: FMOVRNZ	dis not found

	.word 0xbb2d0000  ! 2584: SLL_R	sll 	%r20, %r0, %r29
	.word 0xb3aac820  ! 2585: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a8c820  ! 2591: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbf508000  ! 2593: RDPR_TSTATE	<illegal instruction>
	.word 0xbda589e0  ! 2595: FDIVq	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 2596: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	1, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb508000  ! 2598: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xb3a80c20  ! 2607: FMOVRLZ	dis not found

	.word 0xb3a80c20  ! 2608: FMOVRLZ	dis not found

	.word 0xb3a5c9e0  ! 2613: FDIVq	dis not found

	.word 0xb9a80c20  ! 2614: FMOVRLZ	dis not found

	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 2616: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	mov	1, %r14
	.word 0xa193a000  ! 2621: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x9195a005  ! 2625: WRPR_PIL_I	wrpr	%r22, 0x0005, %pil
	.word 0xb9a589a0  ! 2627: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbbabc820  ! 2628: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81c20  ! 2629: FMOVRGEZ	dis not found

	.word 0xb7a5c940  ! 2630: FMULd	fmuld	%f54, %f0, %f58
	.word 0xba346138  ! 2632: ORN_I	orn 	%r17, 0x0138, %r29
	.word 0x899421be  ! 2637: WRPR_TICK_I	wrpr	%r16, 0x01be, %tick
	.word 0xb9a00040  ! 2641: FMOVd	fmovd	%f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 2646: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0x879461ba  ! 2647: WRPR_TT_I	wrpr	%r17, 0x01ba, %tt
	.word 0xb1349000  ! 2648: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xbda9c820  ! 2649: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a509a0  ! 2650: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xbda449a0  ! 2651: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xb9a40920  ! 2653: FMULs	fmuls	%f16, %f0, %f28
	.word 0x859520a3  ! 2658: WRPR_TSTATE_I	wrpr	%r20, 0x00a3, %tstate
	.word 0xb3aa8820  ! 2659: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a549a0  ! 2661: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xb295c000  ! 2666: ORcc_R	orcc 	%r23, %r0, %r25
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb4e12f  ! 2674: ORNcc_I	orncc 	%r19, 0x012f, %r31
	setx	data_start_1, %g1, %r17
	.word 0xb5540000  ! 2677: RDPR_GL	<illegal instruction>
	.word 0xb7abc820  ! 2679: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0x8994a009  ! 2681: WRPR_TICK_I	wrpr	%r18, 0x0009, %tick
	.word 0xb7a58860  ! 2686: FADDq	dis not found

	.word 0xb1a4c8c0  ! 2689: FSUBd	fsubd	%f50, %f0, %f24
	mov	1, %r12
	.word 0x8f932000  ! 2694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a00040  ! 2701: FMOVd	fmovd	%f0, %f28
	.word 0xb9510000  ! 2702: RDPR_TICK	<illegal instruction>
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2707: RDPR_PIL	<illegal instruction>
	.word 0xb1aa8820  ! 2709: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbac4e0aa  ! 2714: ADDCcc_I	addccc 	%r19, 0x00aa, %r29
	.word 0x8394a0ef  ! 2717: WRPR_TNPC_I	wrpr	%r18, 0x00ef, %tnpc
	.word 0xb7a44840  ! 2719: FADDd	faddd	%f48, %f0, %f58
	ta	T_CHANGE_HPRIV
	.word 0x81982d59  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0xb1aac820  ! 2726: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r16
	.word 0xb1a48940  ! 2730: FMULd	fmuld	%f18, %f0, %f24
	.word 0xbda40940  ! 2734: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb5a4c960  ! 2736: FMULq	dis not found

	.word 0xb1a84820  ! 2737: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa4820  ! 2738: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	data_start_5, %g1, %r23
	.word 0xb9a81420  ! 2744: FMOVRNZ	dis not found

	.word 0xb495c000  ! 2747: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xb9a00520  ! 2748: FSQRTs	fsqrt	
	.word 0xb7a50940  ! 2749: FMULd	fmuld	%f20, %f0, %f58
	.word 0xb7aa4820  ! 2750: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a408e0  ! 2752: FSUBq	dis not found

	setx	data_start_4, %g1, %r16
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa44820  ! 2758: FADDs	fadds	%f17, %f0, %f31
	.word 0xb1aa0820  ! 2760: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbba5c820  ! 2761: FADDs	fadds	%f23, %f0, %f29
	.word 0xbc8d0000  ! 2762: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xb751c000  ! 2765: RDPR_TL	<illegal instruction>
	.word 0xb09561a3  ! 2766: ORcc_I	orcc 	%r21, 0x01a3, %r24
	setx	0x2013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a44860  ! 2768: FADDq	dis not found

	setx	data_start_2, %g1, %r17
	.word 0xb1a488c0  ! 2772: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xb01da168  ! 2773: XOR_I	xor 	%r22, 0x0168, %r24
	.word 0x8995214c  ! 2775: WRPR_TICK_I	wrpr	%r20, 0x014c, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982e09  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e09, %hpstate
	.word 0xba2c60ca  ! 2781: ANDN_I	andn 	%r17, 0x00ca, %r29
	.word 0xb5345000  ! 2787: SRLX_R	srlx	%r17, %r0, %r26
	.word 0xbdaac820  ! 2789: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb73c2001  ! 2790: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0x91956136  ! 2792: WRPR_PIL_I	wrpr	%r21, 0x0136, %pil
	.word 0xbba549a0  ! 2793: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb3a84820  ! 2794: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a40960  ! 2795: FMULq	dis not found

	.word 0xb3a00040  ! 2798: FMOVd	fmovd	%f0, %f56
	.word 0xb7a90820  ! 2799: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a80820  ! 2802: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 2806: RDPR_TT	<illegal instruction>
	.word 0xb7a80820  ! 2807: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9cc000  ! 2811: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xbda80420  ! 2816: FMOVRZ	dis not found

	.word 0xb3520000  ! 2818: RDPR_PIL	<illegal instruction>
	.word 0xb5a9c820  ! 2819: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c9e0  ! 2824: FDIVq	dis not found

	.word 0xb5a588a0  ! 2826: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xbda90820  ! 2828: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	data_start_6, %g1, %r19
	.word 0xb9a4c860  ! 2831: FADDq	dis not found

	.word 0xb5a81420  ! 2832: FMOVRNZ	dis not found

	.word 0xb9a9c820  ! 2833: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda48920  ! 2836: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbda00020  ! 2840: FMOVs	fmovs	%f0, %f30
	.word 0xb625a032  ! 2847: SUB_I	sub 	%r22, 0x0032, %r27
	.word 0xb5abc820  ! 2848: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00560  ! 2849: FSQRTq	fsqrt	
	.word 0xbf520000  ! 2851: RDPR_PIL	<illegal instruction>
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81946124  ! 2855: WRPR_TPC_I	wrpr	%r17, 0x0124, %tpc
	.word 0xbda00540  ! 2859: FSQRTd	fsqrt	
	.word 0xb5abc820  ! 2864: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7518000  ! 2865: RDPR_PSTATE	<illegal instruction>
	.word 0xbb500000  ! 2866: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 2868: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00560  ! 2869: FSQRTq	fsqrt	
	.word 0xb5510000  ! 2870: RDPR_TICK	<illegal instruction>
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 2872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xb1a98820  ! 2873: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba00020  ! 2878: FMOVs	fmovs	%f0, %f29
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54860  ! 2881: FADDq	dis not found

	.word 0xbf34e001  ! 2883: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xbb504000  ! 2884: RDPR_TNPC	<illegal instruction>
	.word 0xbba50860  ! 2886: FADDq	dis not found

	.word 0xb3a80820  ! 2887: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb1a84820  ! 2890: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0x1022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 2899: FSQRTq	fsqrt	
	.word 0xb7a9c820  ! 2902: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba488a0  ! 2904: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb1a00540  ! 2906: FSQRTd	fsqrt	
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 2911: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a94820  ! 2912: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbd540000  ! 2917: RDPR_GL	<illegal instruction>
	.word 0xb53d3001  ! 2918: SRAX_I	srax	%r20, 0x0001, %r26
	mov	0, %r14
	.word 0xa193a000  ! 2924: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983ed1  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed1, %hpstate
	.word 0xb3508000  ! 2927: RDPR_TSTATE	<illegal instruction>
	.word 0x879560bc  ! 2928: WRPR_TT_I	wrpr	%r21, 0x00bc, %tt
	.word 0xb73d2001  ! 2934: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xbba00520  ! 2935: FSQRTs	fsqrt	
	.word 0xb5a81820  ! 2936: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbd520000  ! 2939: RDPR_PIL	<illegal instruction>
	.word 0x8594e174  ! 2945: WRPR_TSTATE_I	wrpr	%r19, 0x0174, %tstate
	.word 0xbba48860  ! 2947: FADDq	dis not found

	.word 0x839561a4  ! 2948: WRPR_TNPC_I	wrpr	%r21, 0x01a4, %tnpc
	.word 0xbba88820  ! 2949: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xba8d8000  ! 2951: ANDcc_R	andcc 	%r22, %r0, %r29
	.word 0xbe8dc000  ! 2952: ANDcc_R	andcc 	%r23, %r0, %r31
	.word 0xbdaac820  ! 2956: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a98820  ! 2959: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1480000  ! 2960: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbd518000  ! 2964: RDPR_PSTATE	<illegal instruction>
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 2967: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1518000  ! 2970: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a449e0  ! 2972: FDIVq	dis not found

	.word 0xbda50920  ! 2974: FMULs	fmuls	%f20, %f0, %f30
	.word 0xbdaa4820  ! 2975: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbda48960  ! 2980: FMULq	dis not found

	.word 0xb5a48860  ! 2982: FADDq	dis not found

	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 2990: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x839560cf  ! 2993: WRPR_TNPC_I	wrpr	%r21, 0x00cf, %tnpc
	.word 0x8794a122  ! 2997: WRPR_TT_I	wrpr	%r18, 0x0122, %tt
	.word 0xbb2db001  ! 2999: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb5a54840  ! 3000: FADDd	faddd	%f52, %f0, %f26
	.word 0xb951c000  ! 3002: RDPR_TL	<illegal instruction>
	.word 0xb72ce001  ! 3003: SLL_I	sll 	%r19, 0x0001, %r27
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 3007: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa488a0  ! 3009: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb1a81820  ! 3012: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb1510000  ! 3013: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 3018: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a40920  ! 3020: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb73c3001  ! 3023: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0x9195e137  ! 3025: WRPR_PIL_I	wrpr	%r23, 0x0137, %pil
	.word 0xb9ab8820  ! 3028: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a48960  ! 3029: FMULq	dis not found

	.word 0xb5a50920  ! 3032: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb351c000  ! 3033: RDPR_TL	<illegal instruction>
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 3039: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb3a84820  ! 3047: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb32cc000  ! 3050: SLL_R	sll 	%r19, %r0, %r25
	.word 0xb3518000  ! 3051: RDPR_PSTATE	<illegal instruction>
	setx	0x2013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 3054: FMOVLEU	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983cdb  ! 3056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cdb, %hpstate
	.word 0xb3a508e0  ! 3061: FSUBq	dis not found

	.word 0xbba80c20  ! 3063: FMOVRLZ	dis not found

	.word 0xb1a81820  ! 3065: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3ab0820  ! 3066: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a4c860  ! 3067: FADDq	dis not found

	.word 0xbda00020  ! 3068: FMOVs	fmovs	%f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	.word 0x91956076  ! 3075: WRPR_PIL_I	wrpr	%r21, 0x0076, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983b1b  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f5b  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5b, %hpstate
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 3080: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a00020  ! 3081: FMOVs	fmovs	%f0, %f27
	.word 0xbba9c820  ! 3087: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a98820  ! 3094: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb03c6021  ! 3095: XNOR_I	xnor 	%r17, 0x0021, %r24
	.word 0xbda00040  ! 3096: FMOVd	fmovd	%f0, %f30
	.word 0xbfa90820  ! 3097: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a5c8c0  ! 3099: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xbba588a0  ! 3100: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xbfa98820  ! 3105: FMOVNEG	fmovs	%fcc1, %f0, %f31
	mov	2, %r14
	.word 0xa193a000  ! 3106: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r23
	mov	0, %r14
	.word 0xa193a000  ! 3116: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda5c8c0  ! 3117: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb4954000  ! 3118: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0xb3518000  ! 3119: RDPR_PSTATE	<illegal instruction>
	.word 0xb48d208a  ! 3127: ANDcc_I	andcc 	%r20, 0x008a, %r26
	setx	data_start_3, %g1, %r22
	.word 0xbf358000  ! 3133: SRL_R	srl 	%r22, %r0, %r31
	.word 0xbfa48860  ! 3136: FADDq	dis not found

	.word 0xb3a58940  ! 3143: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbfa4c9a0  ! 3147: FDIVs	fdivs	%f19, %f0, %f31
	setx	data_start_0, %g1, %r20
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 3151: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r23
	.word 0xba044000  ! 3156: ADD_R	add 	%r17, %r0, %r29
	.word 0xbba58840  ! 3157: FADDd	faddd	%f22, %f0, %f60
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 3165: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a4c000  ! 3168: SUBcc_R	subcc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982d19  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d19, %hpstate
	.word 0xbba58860  ! 3173: FADDq	dis not found

	.word 0x89956179  ! 3175: WRPR_TICK_I	wrpr	%r21, 0x0179, %tick
	.word 0xb7a549e0  ! 3176: FDIVq	dis not found

	setx	0x2003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	.word 0xbda489c0  ! 3185: FDIVd	fdivd	%f18, %f0, %f30
	mov	1, %r12
	.word 0x8f932000  ! 3187: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbdaa4820  ! 3192: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 3193: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7a80820  ! 3194: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb63461d1  ! 3199: SUBC_I	orn 	%r17, 0x01d1, %r27
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a065  ! 3207: WRPR_TSTATE_I	wrpr	%r22, 0x0065, %tstate
	.word 0xbda5c860  ! 3209: FADDq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 3210: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a98820  ! 3211: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0x8995e18a  ! 3212: WRPR_TICK_I	wrpr	%r23, 0x018a, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983bd1  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd1, %hpstate
	.word 0xbda00040  ! 3214: FMOVd	fmovd	%f0, %f30
	.word 0xb9a8c820  ! 3216: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00560  ! 3217: FSQRTq	fsqrt	
	.word 0xbf356001  ! 3218: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xb9abc820  ! 3219: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbda4c860  ! 3221: FADDq	dis not found

	.word 0xb6b58000  ! 3222: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xb5a4c8c0  ! 3229: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xbdabc820  ! 3234: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa44820  ! 3237: FADDs	fadds	%f17, %f0, %f31
	.word 0xbb504000  ! 3240: RDPR_TNPC	<illegal instruction>
	.word 0xbfaac820  ! 3241: FMOVGE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a5e0ee  ! 3255: SUBcc_I	subcc 	%r23, 0x00ee, %r24
	.word 0xb3a00540  ! 3257: FSQRTd	fsqrt	
	.word 0xbda90820  ! 3258: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb6248000  ! 3262: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbba8c820  ! 3267: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0x85942074  ! 3273: WRPR_TSTATE_I	wrpr	%r16, 0x0074, %tstate
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3277: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x9194e0ca  ! 3278: WRPR_PIL_I	wrpr	%r19, 0x00ca, %pil
	.word 0xbdaa8820  ! 3281: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3286: FSQRTd	fsqrt	
	.word 0xb3a81c20  ! 3287: FMOVRGEZ	dis not found

	.word 0xb9a80820  ! 3290: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb8b46022  ! 3295: SUBCcc_I	orncc 	%r17, 0x0022, %r28
	setx	data_start_7, %g1, %r17
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 3301: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x10025, %g1, %o0
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
	setx	0x2030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 3306: RDPR_TT	<illegal instruction>
	.word 0xb9a90820  ! 3308: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x879561c6  ! 3309: WRPR_TT_I	wrpr	%r21, 0x01c6, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819839c1  ! 3310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c1, %hpstate
	.word 0xbb50c000  ! 3312: RDPR_TT	<illegal instruction>
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946105  ! 3320: WRPR_PSTATE_I	wrpr	%r17, 0x0105, %pstate
	.word 0xb1a80c20  ! 3328: FMOVRLZ	dis not found

	.word 0x8995e0fd  ! 3333: WRPR_TICK_I	wrpr	%r23, 0x00fd, %tick
	.word 0xb7480000  ! 3334: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba00540  ! 3335: FSQRTd	fsqrt	
	.word 0xb43d8000  ! 3336: XNOR_R	xnor 	%r22, %r0, %r26
	.word 0xb9a8c820  ! 3338: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a589e0  ! 3341: FDIVq	dis not found

	.word 0xb3a5c8a0  ! 3342: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb60d8000  ! 3343: AND_R	and 	%r22, %r0, %r27
	.word 0xb5a80820  ! 3346: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x8195206d  ! 3348: WRPR_TPC_I	wrpr	%r20, 0x006d, %tpc
	.word 0xb5a449a0  ! 3349: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xbda5c840  ! 3352: FADDd	faddd	%f54, %f0, %f30
	setx	data_start_5, %g1, %r19
	setx	data_start_7, %g1, %r19
	.word 0x8994610d  ! 3359: WRPR_TICK_I	wrpr	%r17, 0x010d, %tick
	.word 0x85956062  ! 3364: WRPR_TSTATE_I	wrpr	%r21, 0x0062, %tstate
	.word 0xbda94820  ! 3368: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbda589c0  ! 3370: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xb5aa0820  ! 3371: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a548a0  ! 3373: FSUBs	fsubs	%f21, %f0, %f28
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87942009  ! 3378: WRPR_TT_I	wrpr	%r16, 0x0009, %tt
	.word 0xbba54840  ! 3379: FADDd	faddd	%f52, %f0, %f60
	.word 0xbba5c8e0  ! 3380: FSUBq	dis not found

	.word 0xb3a00020  ! 3382: FMOVs	fmovs	%f0, %f25
	.word 0x859521e4  ! 3384: WRPR_TSTATE_I	wrpr	%r20, 0x01e4, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 3387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0xbda94820  ! 3388: FMOVCS	fmovs	%fcc1, %f0, %f30
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194215e  ! 3390: WRPR_TPC_I	wrpr	%r16, 0x015e, %tpc
	.word 0x8994e113  ! 3391: WRPR_TICK_I	wrpr	%r19, 0x0113, %tick
	.word 0xbba5c820  ! 3392: FADDs	fadds	%f23, %f0, %f29
	.word 0xb3a50860  ! 3394: FADDq	dis not found

	.word 0xb4158000  ! 3395: OR_R	or 	%r22, %r0, %r26
	.word 0xb13c8000  ! 3397: SRA_R	sra 	%r18, %r0, %r24
	.word 0xb9a94820  ! 3398: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbe1ca07d  ! 3400: XOR_I	xor 	%r18, 0x007d, %r31
	setx	0x30109, %g1, %o0
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
	.word 0xb9a98820  ! 3403: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbb540000  ! 3408: RDPR_GL	<illegal instruction>
	.word 0xb9a449a0  ! 3409: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb1a58960  ! 3414: FMULq	dis not found

	.word 0xbfa44820  ! 3416: FADDs	fadds	%f17, %f0, %f31
	setx	0x2011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8050000  ! 3423: ADD_R	add 	%r20, %r0, %r28
	.word 0xb7a54960  ! 3428: FMULq	dis not found

	.word 0xbda00520  ! 3431: FSQRTs	fsqrt	
	.word 0xb1a81420  ! 3433: FMOVRNZ	dis not found

	.word 0xb1480000  ! 3434: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x10319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 3436: FMOVs	fmovs	%f0, %f31
	setx	0x30314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 3445: RDPR_PIL	<illegal instruction>
	.word 0xb1a408e0  ! 3446: FSUBq	dis not found

	.word 0xbda80c20  ! 3452: FMOVRLZ	dis not found

	.word 0xb1a4c8e0  ! 3457: FSUBq	dis not found

	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0x8195a179  ! 3463: WRPR_TPC_I	wrpr	%r22, 0x0179, %tpc
	.word 0xbfa80c20  ! 3470: FMOVRLZ	dis not found

	.word 0xbfa8c820  ! 3473: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbcc44000  ! 3474: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0x8394e16c  ! 3475: WRPR_TNPC_I	wrpr	%r19, 0x016c, %tnpc
	.word 0xb7a548e0  ! 3476: FSUBq	dis not found

	setx	0x10003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3480: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab8820  ! 3484: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa90820  ! 3486: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a8c820  ! 3487: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfaa4820  ! 3490: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x9194a02a  ! 3491: WRPR_PIL_I	wrpr	%r18, 0x002a, %pil
	.word 0xbeb50000  ! 3492: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xbf510000  ! 3495: RDPR_TICK	<illegal instruction>
	.word 0xbba489e0  ! 3496: FDIVq	dis not found

	.word 0xb1a508c0  ! 3497: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb3aa4820  ! 3498: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a549c0  ! 3501: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb52c5000  ! 3507: SLLX_R	sllx	%r17, %r0, %r26
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3516: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 3520: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbfa81420  ! 3523: FMOVRNZ	dis not found

	.word 0x919461a8  ! 3524: WRPR_PIL_I	wrpr	%r17, 0x01a8, %pil
	.word 0xbfa9c820  ! 3525: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb00c0000  ! 3526: AND_R	and 	%r16, %r0, %r24
	.word 0xb1518000  ! 3530: RDPR_PSTATE	<illegal instruction>
	.word 0x919560c4  ! 3535: WRPR_PIL_I	wrpr	%r21, 0x00c4, %pil
	.word 0xb7518000  ! 3536: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a408a0  ! 3538: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb3a54840  ! 3539: FADDd	faddd	%f52, %f0, %f56
	.word 0xbcb40000  ! 3540: SUBCcc_R	orncc 	%r16, %r0, %r30
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	mov	1, %r12
	.word 0x8f932000  ! 3546: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	2, %r14
	.word 0xa193a000  ! 3549: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba80820  ! 3553: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbf508000  ! 3554: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a48860  ! 3559: FADDq	dis not found

	.word 0xbba81c20  ! 3560: FMOVRGEZ	dis not found

	.word 0xb1a80420  ! 3561: FMOVRZ	dis not found

	.word 0xb9a548e0  ! 3564: FSUBq	dis not found

	.word 0xb5a84820  ! 3569: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbba80420  ! 3573: FMOVRZ	dis not found

	.word 0xbda80c20  ! 3574: FMOVRLZ	dis not found

	.word 0xbc8460a0  ! 3577: ADDcc_I	addcc 	%r17, 0x00a0, %r30
	.word 0x819421e4  ! 3581: WRPR_TPC_I	wrpr	%r16, 0x01e4, %tpc
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a489c0  ! 3587: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb04421eb  ! 3588: ADDC_I	addc 	%r16, 0x01eb, %r24
	.word 0xbfa588c0  ! 3589: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xbdab0820  ! 3594: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a548a0  ! 3596: FSUBs	fsubs	%f21, %f0, %f27
	.word 0x81956169  ! 3597: WRPR_TPC_I	wrpr	%r21, 0x0169, %tpc
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 3599: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbfab8820  ! 3601: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbd51c000  ! 3605: RDPR_TL	<illegal instruction>
	.word 0xba45e07c  ! 3607: ADDC_I	addc 	%r23, 0x007c, %r29
	.word 0xbda00020  ! 3608: FMOVs	fmovs	%f0, %f30
	.word 0xbbaa4820  ! 3610: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81420  ! 3612: FMOVRNZ	dis not found

	.word 0xb5a81820  ! 3614: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a44920  ! 3616: FMULs	fmuls	%f17, %f0, %f28
	.word 0x9194a008  ! 3618: WRPR_PIL_I	wrpr	%r18, 0x0008, %pil
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a508e0  ! 3621: FSUBq	dis not found

	setx	data_start_7, %g1, %r17
	.word 0xbd510000  ! 3624: RDPR_TICK	<illegal instruction>
	setx	data_start_2, %g1, %r16
	.word 0xb7a40920  ! 3626: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb28ce059  ! 3628: ANDcc_I	andcc 	%r19, 0x0059, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8394613d  ! 3633: WRPR_TNPC_I	wrpr	%r17, 0x013d, %tnpc
	setx	data_start_4, %g1, %r16
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 3642: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d9421b5  ! 3643: WRPR_PSTATE_I	wrpr	%r16, 0x01b5, %pstate
	.word 0xbfa90820  ! 3645: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a81c20  ! 3647: FMOVRGEZ	dis not found

	.word 0xbba448a0  ! 3648: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbba50920  ! 3649: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb5518000  ! 3654: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a508c0  ! 3655: FSUBd	fsubd	%f20, %f0, %f28
	.word 0xbfa80820  ! 3656: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00040  ! 3663: FMOVd	fmovd	%f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983911  ! 3664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1911, %hpstate
	.word 0xb9a80420  ! 3665: FMOVRZ	dis not found

	.word 0xb7a40920  ! 3667: FMULs	fmuls	%f16, %f0, %f27
	.word 0x839521a4  ! 3671: WRPR_TNPC_I	wrpr	%r20, 0x01a4, %tnpc
	.word 0xbfa48940  ! 3672: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb3a588e0  ! 3673: FSUBq	dis not found

	.word 0xb1a449c0  ! 3674: FDIVd	fdivd	%f48, %f0, %f24
	setx	0x32f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 3677: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xbda5c9a0  ! 3679: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xbba48820  ! 3681: FADDs	fadds	%f18, %f0, %f29
	.word 0xb69cc000  ! 3687: XORcc_R	xorcc 	%r19, %r0, %r27
	.word 0xba3c4000  ! 3688: XNOR_R	xnor 	%r17, %r0, %r29
	.word 0x859561e3  ! 3690: WRPR_TSTATE_I	wrpr	%r21, 0x01e3, %tstate
	.word 0x91952020  ! 3692: WRPR_PIL_I	wrpr	%r20, 0x0020, %pil
	mov	2, %r12
	.word 0x8f932000  ! 3693: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9510000  ! 3695: RDPR_TICK	<illegal instruction>
	.word 0xbfa80820  ! 3696: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbf50c000  ! 3697: RDPR_TT	<illegal instruction>
	.word 0x8994a097  ! 3699: WRPR_TICK_I	wrpr	%r18, 0x0097, %tick
	.word 0xbfab0820  ! 3710: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a408e0  ! 3714: FSUBq	dis not found

	.word 0xb4254000  ! 3719: SUB_R	sub 	%r21, %r0, %r26
	.word 0xbba80820  ! 3720: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	0x30319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e18f  ! 3722: WRPR_TPC_I	wrpr	%r23, 0x018f, %tpc
	.word 0xb3aa4820  ! 3728: FMOVNE	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 3734: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8194a1f2  ! 3736: WRPR_TPC_I	wrpr	%r18, 0x01f2, %tpc
	setx	0x30117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 3742: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1a508c0  ! 3745: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbda488a0  ! 3746: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb9a00520  ! 3747: FSQRTs	fsqrt	
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a50920  ! 3750: FMULs	fmuls	%f20, %f0, %f27
	.word 0xb9a00040  ! 3752: FMOVd	fmovd	%f0, %f28
	.word 0xb7a40840  ! 3753: FADDd	faddd	%f16, %f0, %f58
	.word 0xb5a00560  ! 3754: FSQRTq	fsqrt	
	.word 0xb5a9c820  ! 3755: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba90820  ! 3756: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3510000  ! 3759: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 3761: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa54840  ! 3763: FADDd	faddd	%f52, %f0, %f62
	.word 0xb9a00520  ! 3764: FSQRTs	fsqrt	
	.word 0xb3480000  ! 3765: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7a448c0  ! 3768: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb9a549e0  ! 3772: FDIVq	dis not found

	.word 0xb5a84820  ! 3774: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8995a17c  ! 3775: WRPR_TICK_I	wrpr	%r22, 0x017c, %tick
	.word 0xb3aa8820  ! 3781: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x85952000  ! 3782: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb5a00020  ! 3787: FMOVs	fmovs	%f0, %f26
	.word 0xb5a408e0  ! 3791: FSUBq	dis not found

	.word 0xb1a4c8a0  ! 3793: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb6bc8000  ! 3795: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xb7a8c820  ! 3800: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x839560c3  ! 3801: WRPR_TNPC_I	wrpr	%r21, 0x00c3, %tnpc
	.word 0xb6344000  ! 3802: SUBC_R	orn 	%r17, %r0, %r27
	setx	0x322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 3806: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x839560cb  ! 3807: WRPR_TNPC_I	wrpr	%r21, 0x00cb, %tnpc
	.word 0xb5ab4820  ! 3812: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80c20  ! 3814: FMOVRLZ	dis not found

	.word 0xb7a00540  ! 3815: FSQRTd	fsqrt	
	.word 0xb7a00040  ! 3817: FMOVd	fmovd	%f0, %f58
	.word 0xb9a00020  ! 3822: FMOVs	fmovs	%f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80420  ! 3824: FMOVRZ	dis not found

	.word 0xb7a509e0  ! 3827: FDIVq	dis not found

	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 3840: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00520  ! 3841: FSQRTs	fsqrt	
	.word 0xb3a80c20  ! 3845: FMOVRLZ	dis not found

	.word 0xb0c48000  ! 3846: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xbba94820  ! 3854: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb01dc000  ! 3856: XOR_R	xor 	%r23, %r0, %r24
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48960  ! 3860: FMULq	dis not found

	.word 0xb7a54840  ! 3861: FADDd	faddd	%f52, %f0, %f58
	setx	data_start_7, %g1, %r16
	.word 0x9195e03c  ! 3864: WRPR_PIL_I	wrpr	%r23, 0x003c, %pil
	.word 0xb9518000  ! 3869: RDPR_PSTATE	<illegal instruction>
	.word 0xb1540000  ! 3872: RDPR_GL	<illegal instruction>
	setx	0x10005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 3882: RDPR_GL	<illegal instruction>
	.word 0xb3a5c940  ! 3884: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb5520000  ! 3885: RDPR_PIL	<illegal instruction>
	.word 0xb9504000  ! 3886: RDPR_TNPC	<illegal instruction>
	.word 0xbba4c920  ! 3887: FMULs	fmuls	%f19, %f0, %f29
	.word 0xbcbc4000  ! 3888: XNORcc_R	xnorcc 	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983d93  ! 3891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d93, %hpstate
	mov	0, %r12
	.word 0x8f932000  ! 3893: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb4ac0000  ! 3894: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xb3540000  ! 3896: RDPR_GL	<illegal instruction>
	.word 0xb1aa0820  ! 3900: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbf480000  ! 3904: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb22dc000  ! 3907: ANDN_R	andn 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe348000  ! 3911: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb3a5c920  ! 3912: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbfa5c9c0  ! 3913: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb9510000  ! 3915: RDPR_TICK	<illegal instruction>
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa409a0  ! 3926: FDIVs	fdivs	%f16, %f0, %f31
	.word 0x9195a024  ! 3927: WRPR_PIL_I	wrpr	%r22, 0x0024, %pil
	.word 0xbb480000  ! 3932: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb551c000  ! 3939: RDPR_TL	<illegal instruction>
	.word 0xbb510000  ! 3941: RDPR_TICK	<illegal instruction>
	.word 0xb52c2001  ! 3942: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xbaa5c000  ! 3945: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb5a80820  ! 3946: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1a449e0  ! 3950: FDIVq	dis not found

	.word 0xbab4c000  ! 3951: ORNcc_R	orncc 	%r19, %r0, %r29
	.word 0xbda58960  ! 3953: FMULq	dis not found

	.word 0xbebd0000  ! 3958: XNORcc_R	xnorcc 	%r20, %r0, %r31
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb53d8000  ! 3970: SRA_R	sra 	%r22, %r0, %r26
	.word 0xb61ca190  ! 3971: XOR_I	xor 	%r18, 0x0190, %r27
	.word 0xb1a00540  ! 3972: FSQRTd	fsqrt	
	.word 0xb3a4c8a0  ! 3975: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbfa40940  ! 3976: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb9a94820  ! 3977: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r18
	.word 0xb1aa8820  ! 3979: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a5c9c0  ! 3980: FDIVd	fdivd	%f54, %f0, %f26
	.word 0x8595e1d6  ! 3985: WRPR_TSTATE_I	wrpr	%r23, 0x01d6, %tstate
	.word 0xb28c20af  ! 3991: ANDcc_I	andcc 	%r16, 0x00af, %r25
	.word 0xb5a58920  ! 3998: FMULs	fmuls	%f22, %f0, %f26
	.word 0xb7a9c820  ! 3999: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81c20  ! 4001: FMOVRGEZ	dis not found

	.word 0x8d94e064  ! 4005: WRPR_PSTATE_I	wrpr	%r19, 0x0064, %pstate
	.word 0xb5a94820  ! 4010: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a9c820  ! 4013: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4015: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8d9460e4  ! 4016: WRPR_PSTATE_I	wrpr	%r17, 0x00e4, %pstate
	.word 0x8994a0fa  ! 4020: WRPR_TICK_I	wrpr	%r18, 0x00fa, %tick
	.word 0xb0046007  ! 4021: ADD_I	add 	%r17, 0x0007, %r24
	.word 0xbda00560  ! 4022: FSQRTq	fsqrt	
	.word 0xbfa80820  ! 4026: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1500000  ! 4028: RDPR_TPC	<illegal instruction>
	.word 0x8d95a18d  ! 4031: WRPR_PSTATE_I	wrpr	%r22, 0x018d, %pstate
	.word 0xb9520000  ! 4034: RDPR_PIL	<illegal instruction>
	.word 0xbfa90820  ! 4036: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a81820  ! 4042: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	setx	data_start_7, %g1, %r19
	.word 0xbfa8c820  ! 4051: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a589c0  ! 4053: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb1520000  ! 4057: RDPR_PIL	<illegal instruction>
	.word 0x8395a065  ! 4060: WRPR_TNPC_I	wrpr	%r22, 0x0065, %tnpc
	.word 0xbba4c860  ! 4064: FADDq	dis not found

	.word 0xb9a40840  ! 4065: FADDd	faddd	%f16, %f0, %f28
	.word 0xbbabc820  ! 4068: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb9518000  ! 4071: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3c7001  ! 4072: SRAX_I	srax	%r17, 0x0001, %r31
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 4077: RDPR_TL	<illegal instruction>
	.word 0xb5a9c820  ! 4079: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a40920  ! 4080: FMULs	fmuls	%f16, %f0, %f25
	.word 0xbc34e163  ! 4084: ORN_I	orn 	%r19, 0x0163, %r30
	.word 0xb6a4c000  ! 4086: SUBcc_R	subcc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 4091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xbf518000  ! 4093: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa98820  ! 4095: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab0820  ! 4097: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983a9b  ! 4100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9b, %hpstate
	.word 0xb1a98820  ! 4103: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a90820  ! 4107: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb151c000  ! 4113: RDPR_TL	<illegal instruction>
	.word 0xbca5605b  ! 4114: SUBcc_I	subcc 	%r21, 0x005b, %r30
	.word 0xb3a80420  ! 4115: FMOVRZ	dis not found

	.word 0xb3a409c0  ! 4116: FDIVd	fdivd	%f16, %f0, %f56
	mov	2, %r14
	.word 0xa193a000  ! 4118: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r20
	.word 0x819521e2  ! 4125: WRPR_TPC_I	wrpr	%r20, 0x01e2, %tpc
	setx	data_start_4, %g1, %r22
	.word 0xb3a5c8a0  ! 4129: FSUBs	fsubs	%f23, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf2d1000  ! 4138: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xbfabc820  ! 4140: FMOVVC	fmovs	%fcc1, %f0, %f31
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d946048  ! 4144: WRPR_PSTATE_I	wrpr	%r17, 0x0048, %pstate
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4148: FSQRTd	fsqrt	
	.word 0xb1a4c960  ! 4150: FMULq	dis not found

	.word 0xb12c2001  ! 4156: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xbda448c0  ! 4160: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbb520000  ! 4162: RDPR_PIL	<illegal instruction>
	.word 0xbfa00520  ! 4165: FSQRTs	fsqrt	
	.word 0xbba84820  ! 4168: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb1518000  ! 4170: RDPR_PSTATE	<illegal instruction>
	.word 0xbe2d8000  ! 4173: ANDN_R	andn 	%r22, %r0, %r31
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4178: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5aac820  ! 4179: FMOVGE	fmovs	%fcc1, %f0, %f26
	mov	2, %r14
	.word 0xa193a000  ! 4180: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1540000  ! 4186: RDPR_GL	<illegal instruction>
	.word 0xb7510000  ! 4188: RDPR_TICK	<illegal instruction>
	.word 0xb7518000  ! 4189: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa44860  ! 4190: FADDq	dis not found

	.word 0xb351c000  ! 4191: RDPR_TL	<illegal instruction>
	.word 0xb3a80820  ! 4192: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb3a449c0  ! 4207: FDIVd	fdivd	%f48, %f0, %f56
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c920  ! 4210: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb5a44940  ! 4212: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb3540000  ! 4214: RDPR_GL	<illegal instruction>
	.word 0xbcada1cd  ! 4215: ANDNcc_I	andncc 	%r22, 0x01cd, %r30
	.word 0xb60ce1ce  ! 4221: AND_I	and 	%r19, 0x01ce, %r27
	.word 0xb5518000  ! 4223: RDPR_PSTATE	<illegal instruction>
	.word 0xbda4c9e0  ! 4225: FDIVq	dis not found

	.word 0xb03d8000  ! 4226: XNOR_R	xnor 	%r22, %r0, %r24
	mov	2, %r12
	.word 0x8f932000  ! 4229: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a84820  ! 4230: FMOVE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982ec9  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a9b  ! 4233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	setx	0x3022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc84c000  ! 4237: ADDcc_R	addcc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983fc9  ! 4238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc9, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983819  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1819, %hpstate
	.word 0x8d95a1c2  ! 4245: WRPR_PSTATE_I	wrpr	%r22, 0x01c2, %pstate
	.word 0xb1518000  ! 4250: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a90820  ! 4256: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c9c0  ! 4257: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb3a5c8e0  ! 4259: FSUBq	dis not found

	setx	0x10302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a588a0  ! 4268: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb1ab0820  ! 4271: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00040  ! 4273: FMOVd	fmovd	%f0, %f28
	.word 0xb751c000  ! 4274: RDPR_TL	<illegal instruction>
	.word 0xb5a00020  ! 4275: FMOVs	fmovs	%f0, %f26
	.word 0xb9a588a0  ! 4278: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xbec4e1c5  ! 4279: ADDCcc_I	addccc 	%r19, 0x01c5, %r31
	.word 0xbd504000  ! 4282: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00560  ! 4283: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982b1b  ! 4284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1b, %hpstate
	.word 0xbec5e1da  ! 4287: ADDCcc_I	addccc 	%r23, 0x01da, %r31
	.word 0x8d9521ca  ! 4288: WRPR_PSTATE_I	wrpr	%r20, 0x01ca, %pstate
	.word 0xbda00520  ! 4292: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a589e0  ! 4306: FDIVq	dis not found

	.word 0xb2250000  ! 4307: SUB_R	sub 	%r20, %r0, %r25
	.word 0xb7a54960  ! 4308: FMULq	dis not found

	.word 0xb1a84820  ! 4311: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb37cc400  ! 4312: MOVR_R	movre	%r19, %r0, %r25
	.word 0xb1a8c820  ! 4332: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbf518000  ! 4333: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a81420  ! 4334: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba3de0cb  ! 4339: XNOR_I	xnor 	%r23, 0x00cb, %r29
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 4343: FSQRTd	fsqrt	
	.word 0xbf508000  ! 4345: RDPR_TSTATE	<illegal instruction>
	.word 0xbd520000  ! 4347: RDPR_PIL	<illegal instruction>
	.word 0xbda90820  ! 4348: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1aa4820  ! 4353: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x81942020  ! 4356: WRPR_TPC_I	wrpr	%r16, 0x0020, %tpc
	.word 0xb9340000  ! 4358: SRL_R	srl 	%r16, %r0, %r28
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8e0  ! 4362: FSUBq	dis not found

	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 4388: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0x9194608b  ! 4392: WRPR_PIL_I	wrpr	%r17, 0x008b, %pil
	.word 0xbb508000  ! 4394: RDPR_TSTATE	<illegal instruction>
	setx	0x1010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a54840  ! 4401: FADDd	faddd	%f52, %f0, %f28
	.word 0x8995a168  ! 4404: WRPR_TICK_I	wrpr	%r22, 0x0168, %tick
	setx	data_start_3, %g1, %r20
	.word 0x8d94a192  ! 4413: WRPR_PSTATE_I	wrpr	%r18, 0x0192, %pstate
	.word 0xb1518000  ! 4414: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a489e0  ! 4417: FDIVq	dis not found

	.word 0x8594617c  ! 4418: WRPR_TSTATE_I	wrpr	%r17, 0x017c, %tstate
	setx	0x2013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4423: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a94820  ! 4424: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa84820  ! 4425: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0x819521e8  ! 4429: WRPR_TPC_I	wrpr	%r20, 0x01e8, %tpc
	.word 0xbfa00560  ! 4431: FSQRTq	fsqrt	
	.word 0xb12d8000  ! 4433: SLL_R	sll 	%r22, %r0, %r24
	.word 0xbfa9c820  ! 4441: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a40840  ! 4442: FADDd	faddd	%f16, %f0, %f24
	.word 0xb1a88820  ! 4443: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbe452117  ! 4444: ADDC_I	addc 	%r20, 0x0117, %r31
	.word 0xbfa58940  ! 4445: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbb540000  ! 4447: RDPR_GL	<illegal instruction>
	.word 0xb7540000  ! 4448: RDPR_GL	rdpr	%-, %r27
	setx	data_start_6, %g1, %r17
	.word 0x919420df  ! 4451: WRPR_PIL_I	wrpr	%r16, 0x00df, %pil
	.word 0xb0854000  ! 4456: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xb3a00520  ! 4460: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983cd9  ! 4461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd9, %hpstate
	.word 0xb9a9c820  ! 4464: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	0x1010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a549e0  ! 4467: FDIVq	dis not found

	.word 0xbfaac820  ! 4470: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00560  ! 4471: FSQRTq	fsqrt	
	.word 0xb7504000  ! 4473: RDPR_TNPC	<illegal instruction>
	.word 0xb0340000  ! 4474: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xb3508000  ! 4475: RDPR_TSTATE	<illegal instruction>
	.word 0xb02d0000  ! 4477: ANDN_R	andn 	%r20, %r0, %r24
	.word 0xb7a5c820  ! 4481: FADDs	fadds	%f23, %f0, %f27
	.word 0xb1a81420  ! 4486: FMOVRNZ	dis not found

	.word 0xb7a8c820  ! 4488: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbfa8c820  ! 4491: FMOVL	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb89ca0ce  ! 4495: XORcc_I	xorcc 	%r18, 0x00ce, %r28
	.word 0xb7a80820  ! 4497: FMOVN	fmovs	%fcc1, %f0, %f27
	mov	1, %r12
	.word 0x8f932000  ! 4499: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5510000  ! 4501: RDPR_TICK	<illegal instruction>
	.word 0xbba449e0  ! 4503: FDIVq	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 4506: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 4512: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r19
	.word 0xb7480000  ! 4517: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x839460f7  ! 4521: WRPR_TNPC_I	wrpr	%r17, 0x00f7, %tnpc
	.word 0xb3a80420  ! 4525: FMOVRZ	dis not found

	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 4528: RDPR_TL	<illegal instruction>
	.word 0xbfa4c8c0  ! 4531: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb1a00520  ! 4533: FSQRTs	fsqrt	
	.word 0xbba80420  ! 4535: FMOVRZ	dis not found

	.word 0xb9a00520  ! 4538: FSQRTs	fsqrt	
	.word 0xbb480000  ! 4539: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbba00040  ! 4552: FMOVd	fmovd	%f0, %f60
	.word 0xba04e01b  ! 4553: ADD_I	add 	%r19, 0x001b, %r29
	setx	data_start_6, %g1, %r17
	.word 0xb3a00040  ! 4556: FMOVd	fmovd	%f0, %f56
	.word 0x8d95615c  ! 4558: WRPR_PSTATE_I	wrpr	%r21, 0x015c, %pstate
	mov	1, %r14
	.word 0xa193a000  ! 4559: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb93ce001  ! 4561: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xbba88820  ! 4563: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbb51c000  ! 4565: RDPR_TL	<illegal instruction>
	.word 0xb7a00520  ! 4567: FSQRTs	fsqrt	
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 4569: RDPR_PSTATE	<illegal instruction>
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 4571: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c960  ! 4574: FMULq	dis not found

	.word 0xb5abc820  ! 4578: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7ab4820  ! 4580: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb7aac820  ! 4582: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb735f001  ! 4583: SRLX_I	srlx	%r23, 0x0001, %r27
	.word 0xb1a00520  ! 4585: FSQRTs	fsqrt	
	.word 0xbda90820  ! 4586: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbba81420  ! 4587: FMOVRNZ	dis not found

	.word 0xb3aa0820  ! 4591: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c8e0  ! 4593: FSUBq	dis not found

	.word 0xbbabc820  ! 4602: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c840  ! 4606: FADDd	faddd	%f50, %f0, %f24
	.word 0xb3a589e0  ! 4607: FDIVq	dis not found

	.word 0x8194e1f5  ! 4610: WRPR_TPC_I	wrpr	%r19, 0x01f5, %tpc
	.word 0x859461ed  ! 4611: WRPR_TSTATE_I	wrpr	%r17, 0x01ed, %tstate
	.word 0xb1a00040  ! 4614: FMOVd	fmovd	%f0, %f24
	.word 0xb750c000  ! 4615: RDPR_TT	<illegal instruction>
	.word 0xb7a589a0  ! 4618: FDIVs	fdivs	%f22, %f0, %f27
	setx	data_start_6, %g1, %r21
	.word 0xbda44940  ! 4621: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb7a54940  ! 4625: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb1a508e0  ! 4626: FSUBq	dis not found

	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 4630: RDPR_TICK	<illegal instruction>
	.word 0xbba54840  ! 4634: FADDd	faddd	%f52, %f0, %f60
	.word 0xbda508c0  ! 4640: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xb4440000  ! 4641: ADDC_R	addc 	%r16, %r0, %r26
	.word 0xb245c000  ! 4642: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xbbaac820  ! 4643: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 4650: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb08d4000  ! 4653: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xb1a81420  ! 4655: FMOVRNZ	dis not found

	setx	data_start_4, %g1, %r21
	.word 0xb3345000  ! 4663: SRLX_R	srlx	%r17, %r0, %r25
	.word 0xbba589c0  ! 4673: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbba449c0  ! 4674: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbfa50840  ! 4678: FADDd	faddd	%f20, %f0, %f62
	.word 0xb9a54940  ! 4679: FMULd	fmuld	%f52, %f0, %f28
	.word 0xbba00540  ! 4683: FSQRTd	fsqrt	
	setx	0x11f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0x879520e9  ! 4688: WRPR_TT_I	wrpr	%r20, 0x00e9, %tt
	.word 0xbb7c2401  ! 4689: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xba84e14d  ! 4690: ADDcc_I	addcc 	%r19, 0x014d, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 4692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 4698: FMOVRZ	dis not found

	.word 0xb5a5c820  ! 4699: FADDs	fadds	%f23, %f0, %f26
	.word 0xbb518000  ! 4702: RDPR_PSTATE	<illegal instruction>
	.word 0xbba58960  ! 4704: FMULq	dis not found

	.word 0xb9a00520  ! 4705: FSQRTs	fsqrt	
	.word 0x8795e1bc  ! 4710: WRPR_TT_I	wrpr	%r23, 0x01bc, %tt
	.word 0xb5a40840  ! 4711: FADDd	faddd	%f16, %f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 4713: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba81c20  ! 4718: FMOVRGEZ	dis not found

	.word 0xbda50940  ! 4720: FMULd	fmuld	%f20, %f0, %f30
	.word 0x8794e078  ! 4721: WRPR_TT_I	wrpr	%r19, 0x0078, %tt
	.word 0xb9a58940  ! 4726: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb9ab4820  ! 4728: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbcb4e1c9  ! 4733: SUBCcc_I	orncc 	%r19, 0x01c9, %r30
	.word 0xb5a54920  ! 4737: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbbaa4820  ! 4739: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00020  ! 4742: FMOVs	fmovs	%f0, %f31
	.word 0x8995e07f  ! 4743: WRPR_TICK_I	wrpr	%r23, 0x007f, %tick
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8e0  ! 4750: FSUBq	dis not found

	.word 0xb1ab0820  ! 4752: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbba4c8e0  ! 4753: FSUBq	dis not found

	.word 0xb5504000  ! 4757: RDPR_TNPC	<illegal instruction>
	.word 0xb08ca092  ! 4759: ANDcc_I	andcc 	%r18, 0x0092, %r24
	.word 0x8d942165  ! 4762: WRPR_PSTATE_I	wrpr	%r16, 0x0165, %pstate
	.word 0xb3a00040  ! 4766: FMOVd	fmovd	%f0, %f56
	.word 0xb5a489c0  ! 4770: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbfa00520  ! 4774: FSQRTs	fsqrt	
	.word 0xbda81c20  ! 4775: FMOVRGEZ	dis not found

	.word 0xbba80c20  ! 4777: FMOVRLZ	dis not found

	.word 0xbb643801  ! 4784: MOVcc_I	<illegal instruction>
	.word 0xb3a588c0  ! 4787: FSUBd	fsubd	%f22, %f0, %f56
	.word 0x81956053  ! 4790: WRPR_TPC_I	wrpr	%r21, 0x0053, %tpc
	mov	2, %r14
	.word 0xa193a000  ! 4793: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r14
	.word 0xa193a000  ! 4794: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0xbbaa0820  ! 4801: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81820  ! 4802: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a54920  ! 4804: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb7a00020  ! 4805: FMOVs	fmovs	%f0, %f27
	.word 0xbba409c0  ! 4806: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb7a548a0  ! 4807: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb4358000  ! 4808: ORN_R	orn 	%r22, %r0, %r26
	setx	0x2013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4813: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8d94a11f  ! 4814: WRPR_PSTATE_I	wrpr	%r18, 0x011f, %pstate
	.word 0x8795206e  ! 4815: WRPR_TT_I	wrpr	%r20, 0x006e, %tt
	.word 0xb3a48920  ! 4818: FMULs	fmuls	%f18, %f0, %f25
	.word 0x8195a07f  ! 4822: WRPR_TPC_I	wrpr	%r22, 0x007f, %tpc
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa44940  ! 4826: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbda40920  ! 4828: FMULs	fmuls	%f16, %f0, %f30
	.word 0xbd508000  ! 4831: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 4832: RDPR_TT	<illegal instruction>
	.word 0xb7a408a0  ! 4835: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbdaac820  ! 4836: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb1aac820  ! 4838: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbba5c920  ! 4839: FMULs	fmuls	%f23, %f0, %f29
	.word 0x859561a4  ! 4841: WRPR_TSTATE_I	wrpr	%r21, 0x01a4, %tstate
	.word 0xb5aac820  ! 4843: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa48940  ! 4844: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbb343001  ! 4845: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xbda90820  ! 4847: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3520000  ! 4849: RDPR_PIL	<illegal instruction>
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4855: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0x8994e1ba  ! 4856: WRPR_TICK_I	wrpr	%r19, 0x01ba, %tick
	.word 0xb6954000  ! 4859: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0x9195e0f3  ! 4860: WRPR_PIL_I	wrpr	%r23, 0x00f3, %pil
	.word 0xbda54860  ! 4861: FADDq	dis not found

	.word 0xb83c21e8  ! 4862: XNOR_I	xnor 	%r16, 0x01e8, %r28
	.word 0xb9a80820  ! 4864: FMOVN	fmovs	%fcc1, %f0, %f28
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 4866: FMOVRNZ	dis not found

	.word 0xb1a4c840  ! 4872: FADDd	faddd	%f50, %f0, %f24
	.word 0xb3a4c8a0  ! 4876: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb3aa0820  ! 4879: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb2148000  ! 4880: OR_R	or 	%r18, %r0, %r25
	.word 0xb5540000  ! 4887: RDPR_GL	<illegal instruction>
	setx	0x20328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 4889: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb7aa0820  ! 4894: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9a84820  ! 4896: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3480000  ! 4899: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7a80820  ! 4902: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 4908: FSQRTs	fsqrt	
	.word 0x8995e0c2  ! 4911: WRPR_TICK_I	wrpr	%r23, 0x00c2, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81982899  ! 4913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xbda4c8c0  ! 4915: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb015e064  ! 4916: OR_I	or 	%r23, 0x0064, %r24
	.word 0xb9ab8820  ! 4917: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81820  ! 4919: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb508000  ! 4925: RDPR_TSTATE	<illegal instruction>
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 4929: FMOVRLZ	dis not found

	.word 0xbda80420  ! 4934: FMOVRZ	dis not found

	.word 0xbeb4a096  ! 4937: SUBCcc_I	orncc 	%r18, 0x0096, %r31
	.word 0xb37c4400  ! 4943: MOVR_R	movre	%r17, %r0, %r25
	.word 0xb7a80c20  ! 4945: FMOVRLZ	dis not found

	.word 0xb9a4c8a0  ! 4946: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb3a80820  ! 4947: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbc9d4000  ! 4949: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xb7a48920  ! 4950: FMULs	fmuls	%f18, %f0, %f27
	.word 0x8d9460bd  ! 4953: WRPR_PSTATE_I	wrpr	%r17, 0x00bd, %pstate
	.word 0xb3a58940  ! 4954: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb9a80420  ! 4960: FMOVRZ	dis not found

	.word 0xb9a00540  ! 4961: FSQRTd	fsqrt	
	.word 0xb9a449c0  ! 4962: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xbda00020  ! 4967: FMOVs	fmovs	%f0, %f30
	.word 0xb9a00520  ! 4974: FSQRTs	fsqrt	
	.word 0xbba9c820  ! 4978: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab4820  ! 4980: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb0c50000  ! 4982: ADDCcc_R	addccc 	%r20, %r0, %r24
	.word 0x8395219c  ! 4984: WRPR_TNPC_I	wrpr	%r20, 0x019c, %tnpc
	setx	data_start_2, %g1, %r18
	.word 0xb750c000  ! 4993: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 4994: RDPR_TSTATE	<illegal instruction>
	.word 0x87946174  ! 4995: WRPR_TT_I	wrpr	%r17, 0x0174, %tt

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

	.xword	0x08d3993ae49969c3
	.xword	0x77193525724c085a
	.xword	0xfdf74a4f6ed2283f
	.xword	0xfc8d1458901b17a2
	.xword	0x4a5ea95cf7535232
	.xword	0x605c8be689e2fe20
	.xword	0x02d5d0cc7a7a592f
	.xword	0xc004ad1ae9247d03
	.xword	0x422be815b552f58d
	.xword	0x00b168b7cd88150f
	.xword	0x65d01b77bc6614b7
	.xword	0x71ed973cbc549a72
	.xword	0x557c4137b1bdc32e
	.xword	0xbf84da3e3b529985
	.xword	0x4f5fc2d8762d400d
	.xword	0x0d04dfe9cd38d659
	.xword	0xcb564862281787d3
	.xword	0x4f0ddd0d9a05844f
	.xword	0x7d6c4890fda280ad
	.xword	0x845d1160cb2b9cc5
	.xword	0x9a084a45bb9173af
	.xword	0x535d82d77fe5bedc
	.xword	0xda57752fd6ea4fb6
	.xword	0x53ae5d93967ca47b
	.xword	0xeba79d5edf7a856c
	.xword	0x97c8d5ba831aa36c
	.xword	0x8cb2cb493003cbea
	.xword	0x134bc64bea1994b0
	.xword	0x79dd3102412b24d9
	.xword	0xe0312efd15d1d66f
	.xword	0xa5ce14e82b779555
	.xword	0xe6d6d26fcbde7257
	.xword	0x31d4bca72955a1c5
	.xword	0xc0ccd4947b9c4954
	.xword	0x3c254c294d05ef16
	.xword	0xfa1a171853f48638
	.xword	0x66cf7bd857c67561
	.xword	0x2c636dedecf11d09
	.xword	0xe9424eaedfbcff81
	.xword	0xfac31421e1d37223
	.xword	0xe0638a6986f70dbc
	.xword	0xb2a6321a677f2ae7
	.xword	0xc70a210b09232b7b
	.xword	0x11dd3f49103bf6e9
	.xword	0xa482dba5718f953f
	.xword	0x184fe5dcc454ecc8
	.xword	0x996e63b3924df60c
	.xword	0x82a5cbb840a29914
	.xword	0x728213e36843f00d
	.xword	0xcf14732bc569f24c
	.xword	0x68961ca32f101c23
	.xword	0xba9f78a2496ebb90
	.xword	0x6a8999c00368da0a
	.xword	0x2698ac9d511267d2
	.xword	0xc2eb1cbfe01931cc
	.xword	0x269f5d276527aa09
	.xword	0xa0000c9830da62d6
	.xword	0x6aa978e854c405b3
	.xword	0x43dc722bdf423451
	.xword	0x58ac2512409fb6a6
	.xword	0x77d033fb5a7dd9ef
	.xword	0x46a8b8935a7171b4
	.xword	0x6f7c8a83566d68b8
	.xword	0xd2658dd77af815c1
	.xword	0x402d53b7aa69963e
	.xword	0xca4d6316ca7fa029
	.xword	0x48f5123568be359a
	.xword	0x9271be6f02ae42dc
	.xword	0x1026aad533e7fa46
	.xword	0x2a52f72790ee9618
	.xword	0x42d4816dc0a3bbd4
	.xword	0x074f8cac03964f7a
	.xword	0x9e1a126e2f2f59aa
	.xword	0x191c987e2bc12ac1
	.xword	0x5516bc4a475b9329
	.xword	0x20aa106b9d808cf8
	.xword	0xe0c826856cd5950d
	.xword	0x3e42454721955da9
	.xword	0x424dd673f7cf9c8a
	.xword	0x24f6fdef9fe11515
	.xword	0x9014b92e8bcd3fde
	.xword	0xf3fdefa7a542e5bd
	.xword	0x34aab05789bdfb46
	.xword	0x2611de5823ae94e1
	.xword	0x814835d6fc08ad9f
	.xword	0x3a420c86602f8587
	.xword	0x3bcae07bdc64d1ee
	.xword	0x160937230ee959cf
	.xword	0xf44c58f6ea47edff
	.xword	0x1c52e6d2f1e6997b
	.xword	0xa5a6f5c77382a7a5
	.xword	0x30cd23b6203072f3
	.xword	0xc871a29798626c78
	.xword	0x9254b034f6ef03ae
	.xword	0x223bcd784538ee36
	.xword	0xd511885c544c0580
	.xword	0xbff56bab99265a53
	.xword	0x2faaad90e76c0498
	.xword	0x02e7abf72649e5f9
	.xword	0xbc56221485446291
	.xword	0x898352b21f353306
	.xword	0xfa99a7de04b22784
	.xword	0x7fb8a166ebb52467
	.xword	0xb152c0535d8fa502
	.xword	0xbe8fdc103a83e2d0
	.xword	0x552a85c2cbe2a279
	.xword	0x8ec15443f5e0064e
	.xword	0x7a82440a9fa3798c
	.xword	0xde5c2b65f9f7cf42
	.xword	0x6cd65d6c7fd28640
	.xword	0x4a063aaba2485b79
	.xword	0xb9d95e8b6183ae99
	.xword	0xdeb91f7e32bf3a51
	.xword	0x0d9ae586692e684e
	.xword	0xa44d9357c2d6f919
	.xword	0x69da7613826e873a
	.xword	0xba9e734619f8ef04
	.xword	0x7825266948a17d9b
	.xword	0xf8076b80826af686
	.xword	0xcdf58682b75683f2
	.xword	0x944776bc313c5cde
	.xword	0xc38767d47ccacc79
	.xword	0xcb009bbad814abd0
	.xword	0x0044cabc5a8d55a1
	.xword	0x636f26517e018771
	.xword	0x42a02075118c997a
	.xword	0xbb87b2f12fa96a25
	.xword	0xf3b5a87849e94100
	.xword	0x4e773206f5e2e229
	.xword	0x897079d5bd24b1f4
	.xword	0x1b747882cd4087e4
	.xword	0x9b1e02514784b331
	.xword	0x357a6aecb6544ebc
	.xword	0x6e610841436b5c8b
	.xword	0x1d2eba788ac83e8d
	.xword	0x4b3689e29abc477b
	.xword	0x5d9d3b0e0c1208b8
	.xword	0x2bd8c07151fd4293
	.xword	0xef17b2abb863ff6d
	.xword	0x36dbbca1d7c2dd24
	.xword	0x7fee5410b1fad92f
	.xword	0xdf44d974b95041f7
	.xword	0xe5ff37be4830044a
	.xword	0x67fa788e86357253
	.xword	0x8f004c51641e22ea
	.xword	0x6b31086e1c000fd3
	.xword	0xa88bf420baeddea8
	.xword	0x4edaa99a4a7133dc
	.xword	0x789865c2f3ccb5b7
	.xword	0x86e0825880b7607b
	.xword	0xe803f22f1d268a1d
	.xword	0x7368eeb1ca050aca
	.xword	0xd048bfbbf5c049d3
	.xword	0x9427082c9bcef15a
	.xword	0x553426f4a99530c8
	.xword	0x5b3fbbc31aaecfc0
	.xword	0x61a56222cc741881
	.xword	0x513ae3ac7bdb92de
	.xword	0x4e65d2489330a950
	.xword	0xee86128b06b5d2f8
	.xword	0x35839fe04973efcc
	.xword	0xc736e680f52c4705
	.xword	0xc17b76acb802cb7d
	.xword	0x9fe26780f758d79e
	.xword	0xda2d96110b895ba7
	.xword	0x204689bcf58b3088
	.xword	0x39ecd8b0ea7c768f
	.xword	0xac324471660ff94d
	.xword	0x31effbb657321f60
	.xword	0xcc41a94c3fdfaebb
	.xword	0x6d7f998a11ceb857
	.xword	0x9c02458c9a79eff4
	.xword	0xefd7f18b7e1cfc21
	.xword	0x55e57784127da661
	.xword	0x9dce4e8dbe0a0e54
	.xword	0xb5bc668aab6a994a
	.xword	0x070ff41f09232a4d
	.xword	0xf5872b7ff38c081d
	.xword	0x6e70f0c25a9c2101
	.xword	0xe1c67125b43e74c0
	.xword	0x0923224a1b5dd38d
	.xword	0x9507fce0125da804
	.xword	0x66b899d2ba73578b
	.xword	0xa9cfdf24b31348c3
	.xword	0x973ed5a88d479bd5
	.xword	0x538cd19a7f73d57f
	.xword	0xc6646991e7e71c35
	.xword	0x149a65106191fc8f
	.xword	0x81b4ab803275346d
	.xword	0xee6765c88ba3eee8
	.xword	0xec3a53fa4dd89486
	.xword	0xc331e3dc726cfed7
	.xword	0xbfe2596beafc90d5
	.xword	0x89c77410bbf7e42b
	.xword	0x495d5bd64698df89
	.xword	0x3e3c24915f3d551b
	.xword	0xb762fe15d2ed8287
	.xword	0x01525fc949c26ca0
	.xword	0x86f0b9fd510c266f
	.xword	0x53735de62b586c7c
	.xword	0x0b5223ed66f2fd18
	.xword	0x997e10e9b6e77cbd
	.xword	0x6701abb31c16939b
	.xword	0xfd55ffbbb8cd8f5c
	.xword	0xd047808328f85a7f
	.xword	0xf0a48e2dfe7dade8
	.xword	0xf4431c0104d06bb6
	.xword	0x74b6981da25e6a1b
	.xword	0xbe79535c985e20a5
	.xword	0xd5e9cc2aa2f54be2
	.xword	0x35409af558682b41
	.xword	0xc4ad32eab1b95907
	.xword	0x6e72fd1c0e4a174a
	.xword	0xcd29d942cfd903b2
	.xword	0x62f38570a54e2acc
	.xword	0x96e176eed64f6ec7
	.xword	0x96af15a02342314b
	.xword	0xc8e25ac6b7179b8a
	.xword	0xea4ef90936a81563
	.xword	0x70d688304ef33962
	.xword	0xe90d02d0a02f21a6
	.xword	0xc01a85f81340aac5
	.xword	0xa33985371f01135d
	.xword	0xc940262acd6739f3
	.xword	0x2200ac62e89bed2a
	.xword	0x19a4c41efd9349f7
	.xword	0x85b9f8156ce02ea2
	.xword	0x0fd68f85ee123eb2
	.xword	0x9db7372980f7a823
	.xword	0x0e6d60f36e84cea4
	.xword	0x8e3dfd8fd89ffb6f
	.xword	0xf11b7a422e28fbd4
	.xword	0x653ec6a3b937d02f
	.xword	0xeb3882ccbe48c32f
	.xword	0x45d62ecbc3d92fc6
	.xword	0x5b3601f91019c817
	.xword	0xe30ae996f8b036c5
	.xword	0xad392f48281b02c3
	.xword	0x73c031fa98ac2ca4
	.xword	0x31977273c189b54b
	.xword	0xe1f5e890ea26696f
	.xword	0x2cb670b4b33125c1
	.xword	0x015434e360e9de61
	.xword	0x7e387a25d653b08e
	.xword	0xa0f75f30fa43e502
	.xword	0x3953fd49af2fec1a
	.xword	0x7ac52e5006f13852
	.xword	0x0834b8f0f65746fc
	.xword	0x49a7f59b2b97dc17
	.xword	0x447eefac867903a2
	.xword	0xc749b2b097e10043
	.xword	0x73a82866c27025c8
	.xword	0x635e031ccef60567
	.xword	0x47f6cb26c4c9880a
	.xword	0xaa5bbe894e0f2d95
	.xword	0x7aad6a7ee3d8c840
	.align 0x2000
	.data
data_start_1:

	.xword	0x51d8f4ccb0b2dac7
	.xword	0x28af28d25e6d03c1
	.xword	0x64f1369f9fd864ba
	.xword	0xc42dc40152042d3e
	.xword	0x75c0ceb4b9bf1aac
	.xword	0x4628058089d43406
	.xword	0xfcfa90fc6c441466
	.xword	0x7016056d21bd22fa
	.xword	0x31a33816cff257e8
	.xword	0xbca9f0919e09d574
	.xword	0x3bb344a3aee89cbc
	.xword	0x192cea0a61a8b69d
	.xword	0x9d1d7975a2218122
	.xword	0xa38c9cbb9ecd610b
	.xword	0x721289821321a875
	.xword	0x191c41b0466005dd
	.xword	0xcf1a0c7006906c21
	.xword	0xe77a4ddd1ecbe448
	.xword	0xd9e5ce5e05ee3df1
	.xword	0x0e4a4878d294ddea
	.xword	0xef66561ffd411ed4
	.xword	0x69d7436db5c0baaf
	.xword	0x9f871c3c7006beb9
	.xword	0x8ab7e88d806e00f1
	.xword	0x4f3cd84b019248bf
	.xword	0xbb93903b2441e5ec
	.xword	0x0fc6d4bc2e717c95
	.xword	0x071e0f7c39d35a46
	.xword	0xf11eddb580811c04
	.xword	0xff9ac5ddb0ea6ecc
	.xword	0x7f48033a8262ba58
	.xword	0xcb78f58f14a90e88
	.xword	0xaae50a73482220dd
	.xword	0x3c127e178bbc04a4
	.xword	0x11577adfff7d9350
	.xword	0xb942e5ef63c85bf0
	.xword	0xb7f7b101cb4dbc56
	.xword	0x6e09a0efce0e4d6a
	.xword	0x9e9709e624ba410b
	.xword	0xc8eab167face880c
	.xword	0x51a435f2928d2d6d
	.xword	0x89ce55d7121e95f4
	.xword	0x9833404f053920f5
	.xword	0xe6bfe262db756c83
	.xword	0x534fad42ba0334e0
	.xword	0x5a667c9e86438513
	.xword	0x197eb63ca846d065
	.xword	0xefc1ca4b18f4cc1c
	.xword	0x31f0add8e5b020d2
	.xword	0x802c928622fe1f8a
	.xword	0x2673b3c8798af7ba
	.xword	0xb000084690e84277
	.xword	0xd918e2752bb92b14
	.xword	0xe9863cce79f12af5
	.xword	0xb385b51248380175
	.xword	0x2382efb500f413f3
	.xword	0x13e387dc43aa7371
	.xword	0x5ad10f81506245e6
	.xword	0x4208a32917602bbf
	.xword	0xdaa4afc25bfcf59e
	.xword	0xa77c726d0183b957
	.xword	0x2eddc8fdca66dc14
	.xword	0x2097a1f5e6f79626
	.xword	0x7e6081e288e427bf
	.xword	0xd0acc37445cb56c8
	.xword	0xc317aaa14228a073
	.xword	0xd5a6df92a2b37abe
	.xword	0x7b2d9a21d18c73ff
	.xword	0x64bc0c6ba53055e5
	.xword	0x398b7c84bab35012
	.xword	0x6c6f0bb0241c36dd
	.xword	0x337df7a54667fe53
	.xword	0xd6aaa292029087e8
	.xword	0x851073e6f3a0394b
	.xword	0xddb2a0bef07278e6
	.xword	0x2a598fb9377c481c
	.xword	0x8156cd37173276e6
	.xword	0xdb3367ed559a6aa1
	.xword	0x65a8675eb03d6678
	.xword	0x28c3d5e730699453
	.xword	0x5969d8efb266ba1c
	.xword	0x911917db42dd91a0
	.xword	0x2c674e341ff56b74
	.xword	0x99c9a14db1fc7233
	.xword	0x3910605914f58c0d
	.xword	0x279d0bacf94a9e5e
	.xword	0xf7a8d983c14c9ddb
	.xword	0xa0dc15ed39a18273
	.xword	0xfb96c552ad683b01
	.xword	0x5accf466b268c616
	.xword	0xca3f1adcfba3391e
	.xword	0xb4a042e3a8d5af68
	.xword	0x9d6d4ef795ff9f34
	.xword	0x5816155d1e42ec5f
	.xword	0x51dfd8e63c0c38cc
	.xword	0x348733502a5b06f8
	.xword	0x4a6adbf47506baa4
	.xword	0x08cdcb28b9830108
	.xword	0xfcb20fdfa9e08731
	.xword	0x3257758f4b4382dd
	.xword	0xa258bcd06d9ac684
	.xword	0xf15f046d4672914f
	.xword	0x8a76f88993e864c4
	.xword	0xdc14c77d4d7ba1f2
	.xword	0xb2cb578a581a63c2
	.xword	0x182d628af7266f22
	.xword	0x24a33dce8108a6f3
	.xword	0x7018713ba677f9d8
	.xword	0xa2a424e4f64b40ad
	.xword	0x01e37195e92d031f
	.xword	0x4a84b6b90943b288
	.xword	0x9a84ea9c597f82a2
	.xword	0x765480e02afd1ec5
	.xword	0xbabdbd230c429751
	.xword	0x6b61a23f5bae7f60
	.xword	0x4b4d8eda5f792772
	.xword	0xeb4394e178d02da8
	.xword	0xc936693a4b23d0c2
	.xword	0xbf753fe3fc6710ab
	.xword	0xf31b26e0fadaa73b
	.xword	0xbc4de05c029f9d48
	.xword	0x2f1729e4c3b7ed92
	.xword	0x9191f213af7ba817
	.xword	0x8ba7a103992dca30
	.xword	0x62a2f43f4c6435ef
	.xword	0x3798f4c7d02e8484
	.xword	0x9c4efe4fe8236e39
	.xword	0x10f31996fb1cdfaf
	.xword	0x27ba533f09da1ba0
	.xword	0xfeeae60ffbde5c7e
	.xword	0xe99523ebfa058b18
	.xword	0x196316ad589805be
	.xword	0xf3c0155de8ecc504
	.xword	0x5c0477d2f65bd7ec
	.xword	0xee83d7528fe289e3
	.xword	0x0751e92ed7899ed4
	.xword	0x7b11eb88a814084a
	.xword	0x0cb931ee3cdf7308
	.xword	0x1277354876fae4b5
	.xword	0x335d5d64186a946f
	.xword	0x8a6fe357cdc26db1
	.xword	0x0ecd99a317dc32d9
	.xword	0x8097f68b43039ee7
	.xword	0x56c37f52203ab93c
	.xword	0x03cf46a1941f901a
	.xword	0xbb92a0048f0e9c19
	.xword	0x69c1dd34a76829bb
	.xword	0x99311338e258e3b0
	.xword	0xb3b6fe20ec0ec140
	.xword	0xf223985780700bd5
	.xword	0x40fafafda5018fc6
	.xword	0x55bf8765383de0b8
	.xword	0xcecb8cefea1638a2
	.xword	0xbd8fe3443001e35f
	.xword	0x5c5e7f5406542d6d
	.xword	0x1408febc1f87b103
	.xword	0x70efc957844efddd
	.xword	0xdf0a20a7e7e4dc4f
	.xword	0x398465e8505ebfa8
	.xword	0x7071dccd0abaf7b4
	.xword	0x689ae9a19f2e2cd8
	.xword	0x334fc08a66e0173b
	.xword	0x38354c79c8fe6553
	.xword	0xe27c78f4a21b665f
	.xword	0x882925df1ea864cc
	.xword	0xd093d90a55370e4d
	.xword	0x581532d1867e5ef5
	.xword	0xd8c901f45a9c657b
	.xword	0x23f00bb7c6a48703
	.xword	0xf0a86afa18850f9f
	.xword	0xd54514043c8c035e
	.xword	0x47fbb79f10f8bc61
	.xword	0xf139cdc16175e128
	.xword	0xae270d30e71855dd
	.xword	0x8e2d108dc8bdfdee
	.xword	0x0fa5262aead4ae8e
	.xword	0x0522e66b48635170
	.xword	0x48361e540037ace0
	.xword	0x5d152e3d3934b2da
	.xword	0x16198a1054fd7bb2
	.xword	0x585fba37e75ba604
	.xword	0x49c5adccef8a312d
	.xword	0x487e6452d3a659f0
	.xword	0x71a8d2535b6b479e
	.xword	0x3338e2d68beee99f
	.xword	0x9d8de9c9880b9cd2
	.xword	0xcefe5767781440cb
	.xword	0x8a25575bab7247bc
	.xword	0x42b180c276837ad8
	.xword	0xe8d18b6858a05125
	.xword	0x20fb6ccb4905bff5
	.xword	0xdee0d8e680e514d3
	.xword	0xcd64a4daca76a0f7
	.xword	0x7e9e29c345b34c05
	.xword	0x88eeef0a0d14ec17
	.xword	0x1c539aca034f47cb
	.xword	0x1dadbdb6db2af0fb
	.xword	0x544d0b264f63cc28
	.xword	0xeb73b2825455b298
	.xword	0x8d7b6aba9b10b122
	.xword	0xc2ba8986fbd8df1e
	.xword	0xb4f5347041f17655
	.xword	0x73d686d89794699f
	.xword	0x0d1f0040ce68f2c4
	.xword	0x28f52acab8e5527d
	.xword	0xd465ef48597c108b
	.xword	0x93ae5595f2156278
	.xword	0xfd0c38389133e084
	.xword	0x5a8b3dcf11c11ea3
	.xword	0x6f92648ea3c124bc
	.xword	0x05ff1e5b82f47708
	.xword	0x3ab5c83e41f5a41d
	.xword	0x6be61f9a2870eb42
	.xword	0xb69bd151df721dc3
	.xword	0x8414edd0d1bf5500
	.xword	0xd090deac7578e59a
	.xword	0x6c2e55a74b6d046f
	.xword	0xe8aedca7179cdd77
	.xword	0x1dc343cc4563a834
	.xword	0xd57e89cc9e3c9fe4
	.xword	0xacca391ecc877397
	.xword	0x48ce26b220c71d81
	.xword	0xf6f2de70fa90a630
	.xword	0x4314b7fdbc621db7
	.xword	0x52728406af03442a
	.xword	0x38f95c4bbf98e882
	.xword	0xf635b4e76c4a4b76
	.xword	0x8d4f756b15b96201
	.xword	0xcc0f8e86578f9d73
	.xword	0x19204b57d08fc53d
	.xword	0xb228e4baa696383a
	.xword	0x5ec9115df9272af9
	.xword	0xdd33cdc4248ed22d
	.xword	0xbfc228a189a2263f
	.xword	0x398348ef24a35cc7
	.xword	0xf9602fe9421230e7
	.xword	0xeabb4f7460175d5d
	.xword	0x43ac7a508954daa6
	.xword	0x7eb49a8dbb6e5c57
	.xword	0x9341554c50b8c5c2
	.xword	0x4fbd941e45db8b11
	.xword	0xa8ace10cd6787881
	.xword	0xf2cc1a46f886c08a
	.xword	0x629d3897d71bb322
	.xword	0xc8e86a2017a2eef3
	.xword	0x5edc17489f417ee5
	.xword	0xf83757148fe1a02e
	.xword	0xe8f092005f4ff9a6
	.xword	0xb5a945a8bd4e7ff9
	.xword	0x5fcf26751a064b8e
	.xword	0xc0ef850fd9f70586
	.xword	0x000131cc0e9dd144
	.xword	0x4963a81ca5bf0928
	.xword	0xdcee4d2c4421a381
	.xword	0xe727525a435f8221
	.xword	0xc607be54126e8eff
	.align 0x4000
	.data
data_start_2:

	.xword	0xda4162c27f8906bc
	.xword	0x8cd1881154377507
	.xword	0x6517ba4a963cea00
	.xword	0x4cd2619c55466f3a
	.xword	0x175622315fb12879
	.xword	0xd22b3284ed1f3ddd
	.xword	0x29e5fc99cc38aa20
	.xword	0x92b36dc1b5ab7751
	.xword	0x026c4fcc3aac1da2
	.xword	0x3911ac497d39b535
	.xword	0x6d396567d527ef04
	.xword	0x88c92255355e9472
	.xword	0x9a627467e893daed
	.xword	0x5d146b7d1369cb75
	.xword	0x5c1c15c9549ef2b7
	.xword	0xa004db195803ceaf
	.xword	0x2dd279f0dff5b384
	.xword	0x61453eecc15ed456
	.xword	0x5fe89974680a0cf9
	.xword	0x2ff541b7e656852f
	.xword	0x69a0ffdf84c6e959
	.xword	0xba36304bdfcdd8e8
	.xword	0x818eb17dec62da9d
	.xword	0x17ed0ef5aa9b3ba8
	.xword	0xe3c31915a5ac5588
	.xword	0x63fe2fedf0026997
	.xword	0x769b62c4982c7d6a
	.xword	0x3f0d53f362b00acd
	.xword	0x1b7bf53df17445c5
	.xword	0xa59e50b966195e9c
	.xword	0x6c19101d14855348
	.xword	0x8eb33be4be25e89b
	.xword	0x527fe1441560cf17
	.xword	0x63125ed04e82a43c
	.xword	0xda7defdafc6fc448
	.xword	0x71aa244909b3a88f
	.xword	0x0a5ab2fd10d47643
	.xword	0xb0b059545115b546
	.xword	0x7f685d3363bc57da
	.xword	0x1a5689af6b9b2c6f
	.xword	0x5c02cadccc5f77ff
	.xword	0xed3d218ab448cdb9
	.xword	0xbdc9f5f007369ae8
	.xword	0x844ee02f7207183e
	.xword	0x1af514499928b5db
	.xword	0x242936da8552ec09
	.xword	0x8346c52b867cbe62
	.xword	0x7d048243e3ea60be
	.xword	0x7366458e95b9dc58
	.xword	0x9462f13c43c3a763
	.xword	0x50e2031408db3c77
	.xword	0x8bd540a573cb4757
	.xword	0xfd607a7df7080b1b
	.xword	0xf74b2a2ce60b9aca
	.xword	0xae858c52ef102996
	.xword	0xfe9a8c64a65e8237
	.xword	0xe178db35f104e5c0
	.xword	0x595efaad990fe521
	.xword	0x95aa81031dd8b5a9
	.xword	0x135e6081a93d4264
	.xword	0x1ae72b19177eeabe
	.xword	0x853011669ed93aad
	.xword	0xb3d07dd664ff72ac
	.xword	0x5b7428d69dc6926a
	.xword	0x0f8b92a0c1b77191
	.xword	0x47e0c2e4e461c439
	.xword	0xbe31553dd61263a3
	.xword	0xde833f7053c8c688
	.xword	0x40f3bb09d723f220
	.xword	0xa3470f80c36baa58
	.xword	0xe454049c01bfaf6a
	.xword	0x3b4d8b497464a4fb
	.xword	0x84ac5e6b9ee806b5
	.xword	0xff42cb5e739825ca
	.xword	0xbc78b1816c2f62b5
	.xword	0xe5eacc3fdee62cce
	.xword	0xd5b1d52958a2a1fc
	.xword	0xb1ddc1a2b006bbfb
	.xword	0x2ed54cdd23f4c94b
	.xword	0xebef864796ed766b
	.xword	0x9e56e72b5cd11cc9
	.xword	0xa158a208e137dcc7
	.xword	0xf33877b75d2c0a51
	.xword	0x3cd10c2147c6049b
	.xword	0x3f2234e7032d11b0
	.xword	0x9807483e5837d7da
	.xword	0xcbbf4de2fb79e900
	.xword	0x7f721aa894a2595b
	.xword	0x41fe7ce014a94086
	.xword	0x79d98038a5a67134
	.xword	0x85031df6ca13830d
	.xword	0x8c1e3471e17a9cfc
	.xword	0x38b03bf6642f36d2
	.xword	0xf964d53cf3a97d36
	.xword	0xda57affc8358b07a
	.xword	0x60dc19dc903faab7
	.xword	0xd2be5c71fafcb303
	.xword	0x4b7e71316a1491ec
	.xword	0xfe279bb77f3c58ff
	.xword	0xc6034793f697d9d0
	.xword	0xfbc6ea1f62493db0
	.xword	0x4d77658b84d473db
	.xword	0xde414ab99c6434d0
	.xword	0x0297b20b7c6c264a
	.xword	0xd908302d2ddd4151
	.xword	0x430bc2820ebab363
	.xword	0x7e99d3603fcedf85
	.xword	0x218709c5f15e9984
	.xword	0x3d45be8c9f7d4312
	.xword	0x531fa2d6060e8fe7
	.xword	0x849dc5acfef7a6ba
	.xword	0x9e4c6c8ba158a895
	.xword	0x42cb446cda741580
	.xword	0x136a231ffd67d0bb
	.xword	0xeb726da5b42affc3
	.xword	0xd012224625e00b85
	.xword	0x4cd028227fe46100
	.xword	0x57ce258d613c35a7
	.xword	0xd30f27ee80e3587a
	.xword	0x02fb53ea4c775b6d
	.xword	0x0f7fcff01d3c3c71
	.xword	0xfd3f738028d35f4b
	.xword	0x9155bc02029a03bc
	.xword	0x96461beb9d96b3f9
	.xword	0xa33f197f3656e04e
	.xword	0x377aa0b6baa1a979
	.xword	0x99021190cb3d063c
	.xword	0x93652d5aa83e714c
	.xword	0x35ae20619ac7f0a2
	.xword	0xd352b183fbc320f3
	.xword	0xbbaf4663c3176f08
	.xword	0x3065289ed8fd5b79
	.xword	0xcbae28c9f4698cbe
	.xword	0x64479feebd749c32
	.xword	0x692bf956d3fc2fbd
	.xword	0x0c5c7aa8ee1cbf26
	.xword	0x28851f19674f9b75
	.xword	0x9b78e39c38fb5bf6
	.xword	0xf3b22fe5463c3d3f
	.xword	0xd11aeb584bdbb4f3
	.xword	0x07059bfc47b962c1
	.xword	0xb1e922a02a067159
	.xword	0x0dd1be0e0eb09e0f
	.xword	0x75fb3e6ef1817827
	.xword	0x25e76ecdc5020855
	.xword	0xa5a646283cd6d285
	.xword	0xc284ab3f41478907
	.xword	0xe6664ad126e62502
	.xword	0x17afef1d5736a894
	.xword	0x59fd74c75585a8e2
	.xword	0x9437567d184847f0
	.xword	0x0049246c0077ba40
	.xword	0xa33a3ee91021b37a
	.xword	0x67174ce5701f9ee8
	.xword	0x72a7549171583d0c
	.xword	0x95f79a4647477be6
	.xword	0x588933f661e384ca
	.xword	0x9322a54de4eb88b1
	.xword	0xadcb86faf212b087
	.xword	0x6947cc2f5ad2468b
	.xword	0xa2a170a818ee64dc
	.xword	0x9ba690378be9f71c
	.xword	0x6e70749736da6e88
	.xword	0x24e39e5630c0f90a
	.xword	0x588d0dd3278986e5
	.xword	0x08753aabedbd6aae
	.xword	0xafee3116566b7f62
	.xword	0x40767f60e905a2d7
	.xword	0x431590b702df6b75
	.xword	0x71c022f0336b79f2
	.xword	0xd1cc74835e35e3ad
	.xword	0x03b5bab7edc2ef05
	.xword	0x4285172f8bfc96fe
	.xword	0xe7fe5bb79b882756
	.xword	0x636140f8ccbdca73
	.xword	0xc37af1de2204746d
	.xword	0x6dc7ce8132b08958
	.xword	0x4af09f8d56adccc1
	.xword	0xe30f1c7b5a588322
	.xword	0x0c95c54c49b3804c
	.xword	0xae2faf4af78c4583
	.xword	0xcdb3c48e0b7bff89
	.xword	0xb5a125334d751a77
	.xword	0xd4c7ce320905b759
	.xword	0xf582677bc7f6c9a3
	.xword	0x446bc86d7df5e1f9
	.xword	0xf742ad1440d75ae6
	.xword	0x9e4c9456510c397f
	.xword	0xf291afaa7fcd1bd9
	.xword	0xd5a0d9455a6365fc
	.xword	0xde93ddb8f7fcad14
	.xword	0xfc452471fb84e7e3
	.xword	0x79fdf00b27525571
	.xword	0x2bf501e1553b7e9f
	.xword	0xb20865881d4b2193
	.xword	0x1e5c81f098347820
	.xword	0xe8adcf09ac22db40
	.xword	0x265b8d34d73399e5
	.xword	0x4ba8cc35c43a9498
	.xword	0xf051c28732605051
	.xword	0x7cc524a60ed2962b
	.xword	0x12f4d0bcb3681de2
	.xword	0x0baacfc38710f2e3
	.xword	0xa309c5fa346a4005
	.xword	0xca88de34d5da40b7
	.xword	0xd29f0860238b5a1a
	.xword	0xe7ddf5398235573f
	.xword	0x95f23738a4d23d7a
	.xword	0x0b17bc0e1ade1f9a
	.xword	0x1fd839068d7196fe
	.xword	0x5dcb822f52197396
	.xword	0x025bb012167cfbdc
	.xword	0x2649e514ad38a13a
	.xword	0xb0c3cf2590e669e7
	.xword	0x706b56502b54b3d9
	.xword	0x3ad60c463388c27b
	.xword	0x0fa867b81b09797c
	.xword	0x365e00ae2a7e2c54
	.xword	0xda23406b34732348
	.xword	0xf02431710595abda
	.xword	0xbce70234d114a38d
	.xword	0x2a955566c553aaa4
	.xword	0x6f8acafe793e1834
	.xword	0x86f644996c7cfbf9
	.xword	0x60d65adfb73fb863
	.xword	0xc5cf2a9d9a2a4cc0
	.xword	0x57ee5b0a91d70b54
	.xword	0xc1a59cd841ff23b7
	.xword	0x9ee394487fbdc364
	.xword	0x5c9a3748f41c2ca3
	.xword	0x59b1a0fa11eb1f1b
	.xword	0x2eff292973c463cb
	.xword	0x60f200cd5947c3f3
	.xword	0x8d39134cfdae1496
	.xword	0x020f9ba3f621aa54
	.xword	0x697dad23371f1813
	.xword	0x44dcdd260c420fde
	.xword	0x01f47ee10bda58e7
	.xword	0xcb91199c25e8f4b8
	.xword	0xdf596c08134b92dc
	.xword	0xbda08439c1a54939
	.xword	0xf24437209d71ee31
	.xword	0xece2f8f4769ad55b
	.xword	0x410eff6f8dde4347
	.xword	0x57121285509a2635
	.xword	0xf3c4c70637698ce6
	.xword	0xc26867480468b15f
	.xword	0x372732b1340a8282
	.xword	0x903f00af6ec26dcd
	.xword	0x97ab6bd3f0faf2b1
	.xword	0x7c9daccc16d40ebf
	.xword	0x0ec5331ab1ff4a50
	.xword	0xbe3df0315e6c3cb2
	.xword	0x308e570507c0884e
	.xword	0x5c9ac96d0a4ff65c
	.xword	0xfdddb441c322d007
	.align 0x8000
	.data
data_start_3:

	.xword	0x948e44b97e728762
	.xword	0x5f0d744098517a49
	.xword	0x41d81ebbc6ec87f8
	.xword	0x60968943c2aa2c06
	.xword	0x9628f77e4dc42573
	.xword	0xa2a6db06b944039b
	.xword	0xdbe2b7e56a0b6c50
	.xword	0x739a4bcfa3b8ba82
	.xword	0x8131f8ccdb01d1ca
	.xword	0x7120ff81c62d3efc
	.xword	0xf606d40e856d541b
	.xword	0x492517ee47a80947
	.xword	0xd179b4ace1439733
	.xword	0xf3af90963c28ef0f
	.xword	0x20d45d2a35a1adcc
	.xword	0x5d0905765292feb8
	.xword	0xef4c2b33b31af83f
	.xword	0x1fa420b9c5608b36
	.xword	0x90e6c6bcdc1ad8b7
	.xword	0x548b6b4a1149f12a
	.xword	0x3e8c87d636a880e4
	.xword	0xa2c58ea868f136bc
	.xword	0xb2165c7beb01f82a
	.xword	0x9d7bcc92d39e4118
	.xword	0x54560f99491e2af7
	.xword	0xb1eea81b4cb77774
	.xword	0x7037f34889869bef
	.xword	0x8a65d691659a4bdb
	.xword	0x1d832a62feab1e85
	.xword	0xc231e2f5973c75cc
	.xword	0xb4e074679d072063
	.xword	0xba4f96fc3e262f96
	.xword	0x608a2e74d618a2de
	.xword	0x33401569887abfe7
	.xword	0x73ba67296b6ae780
	.xword	0x8c0b50eadfa5f0b4
	.xword	0xe567e8ee1b33969c
	.xword	0x68a79c1958d58376
	.xword	0x67e8241021f0fe0d
	.xword	0xcb3b0b979f7c0da1
	.xword	0x5674b2fbae498b1b
	.xword	0x900a1c3438046caf
	.xword	0x5f8783d8ec6bbb1a
	.xword	0x1b07e49ffa314440
	.xword	0xbfa112b1c3aaa185
	.xword	0x4281710da85c3689
	.xword	0x28f5e7c0a6097261
	.xword	0xfd0a8493c328bf79
	.xword	0xa74c709e3638ba99
	.xword	0x2802582d1d5584d0
	.xword	0x53b9a40478b4d457
	.xword	0xeaddcd1cc940363e
	.xword	0xa55e94160cd53a72
	.xword	0x5fb13291ea55f64b
	.xword	0xc806717355e3725e
	.xword	0x0610038194b84895
	.xword	0xb25eff09c6d6628b
	.xword	0x6caffd44bf0aa585
	.xword	0x2c9c142d1684449c
	.xword	0x1fcc5c45543f2d9c
	.xword	0xb82c2f46387dfad1
	.xword	0x6d0ace5b3b25e211
	.xword	0xac08c09e38ab9a8e
	.xword	0x2618cde55b6deed3
	.xword	0x9853245694a94a40
	.xword	0xdccac627b3656727
	.xword	0x672df7e36bb15a4a
	.xword	0x4728103861754efa
	.xword	0x150cae2fe6123767
	.xword	0x0d0b49eb555dd497
	.xword	0xad65a78710ce9d59
	.xword	0x4792a6fbf4514855
	.xword	0x3c2786b511b23a98
	.xword	0x151c94d9f93d2fd5
	.xword	0x41476c3ccd595f1f
	.xword	0x6f23540805e1075c
	.xword	0xb1c8e74b3617b4c3
	.xword	0x581a6ec83fbf236e
	.xword	0x7c0e652cd8b25f4e
	.xword	0x6836b9b0196a1d90
	.xword	0x0932a832c6bcc0ac
	.xword	0x3656af6d6d6f8069
	.xword	0x492ede8dd30a6740
	.xword	0xd2113d017c25c3b3
	.xword	0x568ff1c9dd03497c
	.xword	0xba64bb3c24a7d1d0
	.xword	0x115cbf3e0d2e828d
	.xword	0x387c045ab2d52dce
	.xword	0x1e16bcb8c5ec57a3
	.xword	0xffc78eb549e8fbc6
	.xword	0xf520e083d9cfef6a
	.xword	0x1148b9941622855a
	.xword	0x27fd8d5b01d89535
	.xword	0xd9a4bf8bcc4f5ce4
	.xword	0xbd827b33aa5a0bcf
	.xword	0xcada526017b103c2
	.xword	0x14a07c05f7ab2690
	.xword	0xa4634c98cbb19555
	.xword	0x63ad55997e6390a1
	.xword	0x2a98b73bfad7b4f1
	.xword	0x1ce42344b4365ebb
	.xword	0x7f215d482f4e2c83
	.xword	0xe8682ffe545fa10e
	.xword	0x8198c722221b1372
	.xword	0xc89d3af1c5d613c1
	.xword	0x270f05e7204eb6e5
	.xword	0x61512e6707cc0862
	.xword	0xfdd2b78e302aa6bd
	.xword	0x712d53ff710fad34
	.xword	0xd591bd11f0c29f2c
	.xword	0xe22602ed24623218
	.xword	0x0ccc281bac2ec8ad
	.xword	0xc40eb2b9c4e81a7a
	.xword	0x56fc86d2c323827d
	.xword	0x3a672971c498786a
	.xword	0xd6a7b766e5679a94
	.xword	0x378c79ec1118c730
	.xword	0x60c18cefffa9d6f6
	.xword	0xf9396bcce233f6c2
	.xword	0x337a576515551310
	.xword	0xf69bf7cac6259090
	.xword	0x0ba1f7cd15bb94bc
	.xword	0xe8a32a89d40d2217
	.xword	0xdfa73cdb2b309039
	.xword	0xf74f7796826b497b
	.xword	0x5354b33f677467c1
	.xword	0x445a48083eaeab96
	.xword	0x54b6dd41c47f604a
	.xword	0x61579eaf687e4d1c
	.xword	0x4d40c1f92f992834
	.xword	0x7efb659831f5a4ba
	.xword	0x10205b67ec6a6a94
	.xword	0xec71f3f6b2ac03ee
	.xword	0x9c9df5c5b8a4538a
	.xword	0xb200b81fd2566dc3
	.xword	0x548ac0de58c334ce
	.xword	0x8d362b10511ba56f
	.xword	0x69b38b7158fc88c1
	.xword	0x8ff1468dfa3b1f43
	.xword	0x530c6f1cb246436d
	.xword	0xc78cd758fef75a44
	.xword	0xf873651988f3411e
	.xword	0x978f0737fa8a8bf1
	.xword	0xd19c08f31db4f3bf
	.xword	0xd7502a89b1427e65
	.xword	0x62904f33fc4650e0
	.xword	0x6455293dc1f85f99
	.xword	0x63b772b0752f307d
	.xword	0xdc988c20468e7b7e
	.xword	0x546c7b9279f5fe18
	.xword	0xeaa471e2bbad33b5
	.xword	0x0de44d4fc48df291
	.xword	0x9ea954834c745b9e
	.xword	0x35f37090f7642796
	.xword	0x9f3551736daa2466
	.xword	0x6086f5059fb564c2
	.xword	0x0516d342ce9400bd
	.xword	0x4a0f46e700f86d9c
	.xword	0x55b31b064b7c0120
	.xword	0x7b2c506dc303af75
	.xword	0x3a720296b10691dd
	.xword	0xbf1e63a160fb16ab
	.xword	0xcd1b8aaba3e50cac
	.xword	0x0e038fc68353fa83
	.xword	0xfa47444827d725d9
	.xword	0x798b0c1e698e440e
	.xword	0x7a2dc067b6424c10
	.xword	0xa65d366409f77252
	.xword	0xf5b6cc791075f71d
	.xword	0x288529590809b274
	.xword	0xce7c5c645cc09646
	.xword	0xe698d9f85aa10f92
	.xword	0x35cdfff5a44c5ec7
	.xword	0x4c8e05954da281cc
	.xword	0xed81a4dce49ba19c
	.xword	0x987a0772bbbb6d3f
	.xword	0x454ed3bc6a7f6ede
	.xword	0x3aa7a95de1b6aa0d
	.xword	0xe4f50c2b2656d93c
	.xword	0xef97339f8fb17407
	.xword	0xd7544a7af2782135
	.xword	0xe18bb5b5e267a8a3
	.xword	0x2c1c99a63b530d4e
	.xword	0x6e4ce90c94358774
	.xword	0x7117b3066d38d601
	.xword	0x877bc8d151ebf68d
	.xword	0xfc50268ec9e0bbeb
	.xword	0xd5cc3c67cd2fc06f
	.xword	0x65ffe4846724d2b5
	.xword	0x5f343055a37715b3
	.xword	0x19aad3ac2be81382
	.xword	0x27782a18abdab6f4
	.xword	0x2c7dec2920dfab27
	.xword	0xd5c02186537d21e6
	.xword	0x0e6e7670ce0f24e9
	.xword	0xd9474171a8e655fd
	.xword	0xf07839245d77c8ec
	.xword	0xf20eaee2c23078b2
	.xword	0xe499b1d200ceaa2e
	.xword	0xcb38c435cb38ac47
	.xword	0x94e407b0b1a2e04e
	.xword	0xe39e3afba590e16e
	.xword	0x35718b62bf6a9c36
	.xword	0x786ab6f28bbd55cf
	.xword	0x7be9c2698775b6d5
	.xword	0x68a6ddfc6317b1a6
	.xword	0xce50af85bae86f13
	.xword	0x189c19f905611136
	.xword	0x0829495fc9100273
	.xword	0xd3dfd2489a0a4278
	.xword	0xe18507d28309330e
	.xword	0xdfaa5ec3d552c2fb
	.xword	0xbcda2b99e6f3f9e4
	.xword	0x5ff3ff333ce12fea
	.xword	0x75348291c27b139e
	.xword	0xe0357acc9cb59c28
	.xword	0x1d46f45246fb4119
	.xword	0x6381215419a402b2
	.xword	0x27a2c89e39bd0072
	.xword	0xc9de2899488c32b5
	.xword	0xdc9d48846a83efad
	.xword	0x8ad80b1a3de55edc
	.xword	0x5620589db2d285a4
	.xword	0xb6d801d952992678
	.xword	0x22132793a4d88b8f
	.xword	0xd46edc68c32a52e6
	.xword	0xe5fcc189d2a37c93
	.xword	0x4a185a4113215a32
	.xword	0x2acb3081802215f6
	.xword	0x06bf128598b0a443
	.xword	0x022efa708981e1fc
	.xword	0x8ac7dae298f9d2fe
	.xword	0x090d820e81fc252f
	.xword	0xcb969a05925f0594
	.xword	0x7704f34b8279093d
	.xword	0xdb01904c6fccefa1
	.xword	0xa2106460121ae911
	.xword	0xbacfdf36b246be96
	.xword	0xd7c8ceca82e93818
	.xword	0x564d6d4e06467db4
	.xword	0xeca14a7f6e683d0d
	.xword	0x7626f2d6974ba448
	.xword	0xd76bcd6bd7955fbe
	.xword	0x3ad44b208beaa7c8
	.xword	0xd55cd5a32e72df3b
	.xword	0xca80bd4869fd3a12
	.xword	0x99197977aa3dede6
	.xword	0x6e744c836b34e18f
	.xword	0xbf332619ff37c2f3
	.xword	0x39852ae600389eaf
	.xword	0x8ee1663159436110
	.xword	0x10ff705f1df2a019
	.xword	0xa8c7d3f596e99812
	.xword	0xb14245286c0ccb19
	.xword	0x3a8a314edcd6c2f4
	.xword	0xb68d1445f7b2cc39
	.align 0x10000
	.data
data_start_4:

	.xword	0x41ce65ef9df235a8
	.xword	0xa8bbab2941a25c3f
	.xword	0x71d2134203e27a04
	.xword	0xf2d3c12004af4bdd
	.xword	0x6c17184fdf261bf0
	.xword	0x018b942503d2a4aa
	.xword	0xa9e89a1fa258d746
	.xword	0x71925a5bf0072518
	.xword	0xff19e2bd8ab04549
	.xword	0x08ff7a99b1df0ee7
	.xword	0x5001bace12ba2255
	.xword	0xb0b8fd0e128ddbad
	.xword	0xcebdc53f450fba09
	.xword	0x246d2aaa6cbf6caf
	.xword	0xb51d9c11c2ebc7fd
	.xword	0x965356ff22ab909f
	.xword	0xdbdbc4e1064f60cf
	.xword	0xbc7bfe59ef8242a5
	.xword	0x9e621fd683defe62
	.xword	0xceee3bd4ace9647c
	.xword	0x1b2946e4173d1730
	.xword	0xdb1d30cb5ac4bb12
	.xword	0xea3826ee7926a55c
	.xword	0x66711aa8a49a590f
	.xword	0x1721df462e801984
	.xword	0x06125af934cdb1fd
	.xword	0x812090bb3e47d49f
	.xword	0x4d7060f55f11fcf8
	.xword	0xce51a56ae0dc6a25
	.xword	0x7be0c692de03e118
	.xword	0x16daae4f501462d6
	.xword	0x8d040152c4730b6a
	.xword	0x99c360f83f6b89db
	.xword	0x87da219b103e160b
	.xword	0x8f1241d64747c4bf
	.xword	0x9ca6c01b1a5a84c7
	.xword	0xf5977894117214d8
	.xword	0x0abf9dd9586c2505
	.xword	0x2fbcd024112dae85
	.xword	0x27a6179103e95a03
	.xword	0xcee4b6fed83511e0
	.xword	0xb31f0b101b906857
	.xword	0xd797a9fcbfe9e5fa
	.xword	0xb55be76ab8ecb8a0
	.xword	0x701dfe7bf42223ba
	.xword	0xc49d0d2080191ba3
	.xword	0xcc738c4b37f5313e
	.xword	0x6a1a57f6cb0c8482
	.xword	0x2ad854d03c247ece
	.xword	0x07331dd339ca7d3d
	.xword	0xcbfbc56ed08bce3c
	.xword	0xce8d18c82530e905
	.xword	0x9650a2298a48092a
	.xword	0xe8089cf2e876d478
	.xword	0xd65d04d66445039a
	.xword	0x537c7649f58c3b94
	.xword	0xbd892e2e2707dacb
	.xword	0x12e5f6cc10f8fda8
	.xword	0x4f9feec235d4573c
	.xword	0x5096eafe3fa3c624
	.xword	0x156a3787511ca938
	.xword	0xfab336d6a9906306
	.xword	0x675acf302cdb55f2
	.xword	0xa354bb4aed2d05b1
	.xword	0xc6d2f9aceb142efc
	.xword	0xf946739f37c47cde
	.xword	0xec6255ebc1fc8363
	.xword	0x4b7445811d1f8899
	.xword	0x809c99c48048a75a
	.xword	0xf4448ba9de424901
	.xword	0x87af9d6d0b6eb35d
	.xword	0xc5b752667d2e169d
	.xword	0xf5bb6939454cd456
	.xword	0xe143d7bb2d475399
	.xword	0xec58223c2c7f8a2f
	.xword	0xa91da0e2ce7e0a71
	.xword	0x8c3ddaf20bad7b4f
	.xword	0x80f30ff9fe75d3ad
	.xword	0xdba6376b1b20f328
	.xword	0x27941ae21291fcab
	.xword	0x021850f21959031f
	.xword	0xadcab67e59ea986e
	.xword	0x1120cf122d53e42f
	.xword	0xcd92db6909c2539a
	.xword	0xcfdcadff6003ee18
	.xword	0x231e31e9b9328820
	.xword	0x51644c73d760430b
	.xword	0x017dc1fb3f33ada0
	.xword	0x0837a5d28605aa4a
	.xword	0x184839d01b58f35b
	.xword	0x383100f3c9d75ed3
	.xword	0x95e3cd77e19c18e2
	.xword	0x7ef19ea3c2c514ab
	.xword	0x84d121e4efc399f0
	.xword	0xde8b4b58128a1f90
	.xword	0x24461d116928452d
	.xword	0xd52a789f2696dbd7
	.xword	0x7ddfc2a71cb10722
	.xword	0x13101ab4093421c2
	.xword	0x075f0ac57229779e
	.xword	0x0206d8e08a0c5d8d
	.xword	0xa15da086bb0a80ac
	.xword	0x93e55474b4b1090c
	.xword	0xbc1aec702cd33ceb
	.xword	0x299d283a3b702da3
	.xword	0x25e8c4b4446c65ea
	.xword	0x6eca1bb262f3a539
	.xword	0x0bba3d491058c262
	.xword	0x9e228b16df31f2fb
	.xword	0xb6e936a46d522737
	.xword	0x63fbc67d5c1bec44
	.xword	0x223e6b598c28beb5
	.xword	0x7a1283e5fc57be1b
	.xword	0xfa92db5d0c3511f4
	.xword	0xa81df8dfeb90748b
	.xword	0x8d77b6b35ed4eda0
	.xword	0x92c18f712cac169d
	.xword	0xeda846f40e2ab312
	.xword	0x6d3d50c001145f21
	.xword	0x1656d58f691e3f3d
	.xword	0x71b7556f15d9a3ab
	.xword	0x1f932cdd4337ff8e
	.xword	0xa651ca16efdc89c7
	.xword	0xcda24597cd9b3182
	.xword	0x30d1158dc17b101a
	.xword	0xb68daf58ac20dd40
	.xword	0xe03177e33a1ba44c
	.xword	0x68697b92b877bb0a
	.xword	0xa334e61f9bf577ed
	.xword	0xe7deb897e4ef5859
	.xword	0xaac5ea65b1307819
	.xword	0x67282ffb927dc6e4
	.xword	0x4bcb5fe0dac49e0a
	.xword	0x8052e766d603d9ef
	.xword	0xf4d7f9475bae622b
	.xword	0xa33af61a0e0f3382
	.xword	0xb8bc65dbb65d5cad
	.xword	0xb197ac0bb85355e1
	.xword	0xed9bcfa6f3c96948
	.xword	0x9ca2d55c2ba20fa7
	.xword	0xbd1a98e26e894326
	.xword	0x131710e22ee081a0
	.xword	0x7eed792d6fb79293
	.xword	0x7e1988cb732b1022
	.xword	0xc4ad3c271035f106
	.xword	0x2325c43bf836b2ed
	.xword	0xfd16bd18e204078f
	.xword	0x75eef80a8f45a3b7
	.xword	0x8e3a6b3d4ad2309b
	.xword	0xb4ea9dc819f8868f
	.xword	0x40848f43a94b7ff0
	.xword	0x9a67d6eaa5ff6dce
	.xword	0x79f1797f962e8bac
	.xword	0x6597b87473b72bcf
	.xword	0xd935483ee299858d
	.xword	0xc5c1b8c4b744c0fb
	.xword	0x248acf5200468771
	.xword	0x17ddd11f9f611f2b
	.xword	0x78c5eee3692c61f8
	.xword	0xb4275c4d71c654ba
	.xword	0x65cc4c18f452b815
	.xword	0xb0fd977e8d0349df
	.xword	0xc4a97f617dad2315
	.xword	0x80c43f2fe9f41c5a
	.xword	0x07986ea5c9660d50
	.xword	0x068f6745a64a81e4
	.xword	0x13d510bf68ba9ca6
	.xword	0xe99f38a16fa1a76a
	.xword	0xc55c9563f9bf8ba6
	.xword	0x0a8f6793b2e827a7
	.xword	0x06cb40ec7e349222
	.xword	0x801518a59510ff1b
	.xword	0x39b1c6b573a05424
	.xword	0x512799d6f07c8715
	.xword	0x9d88f73517cced19
	.xword	0x2be8150db61990e7
	.xword	0x273f9157629e707e
	.xword	0xaa3746129ea17ef3
	.xword	0x935ee05cdbf1c809
	.xword	0xa5663fee67dc3490
	.xword	0x35f1568dc12cad10
	.xword	0x8635f3a7d2df44c3
	.xword	0x9597222e9a227959
	.xword	0xe3f8925654d4510a
	.xword	0x7f5810dacbc57b50
	.xword	0x064f98c589161e64
	.xword	0x4f667a3cc8bb6a2b
	.xword	0x7c9f5b9bde8df3c0
	.xword	0x59b5de4b19dfd5e0
	.xword	0xe01597406df7347d
	.xword	0xdb20af843c7d4897
	.xword	0xaf20e71c2ca2344e
	.xword	0xb89e17eb8b799b58
	.xword	0x76fc8d8d5f1531ca
	.xword	0x0bc5809d4870988d
	.xword	0x453d4c6e66c0c1b5
	.xword	0x95285db4ce47a028
	.xword	0x4619ad26fc59fcf1
	.xword	0x80ee89fc8be3dbdc
	.xword	0x4c8ee7ed49f0c04d
	.xword	0x51f61b9938ebcf73
	.xword	0xa983c66edbfbb9f9
	.xword	0x92dad325f3211184
	.xword	0x3214f70025638ae0
	.xword	0xfb74340099cf9021
	.xword	0x34501843539bb042
	.xword	0x59ba250ed7f46f0f
	.xword	0xb53d35b82bb6ce7b
	.xword	0xec8a4b60f4bf1558
	.xword	0xa5e2932aa44f476c
	.xword	0x0c2f191e810dd0cc
	.xword	0xe7ad9fa6e8140e90
	.xword	0xd1abb79fc32f4d14
	.xword	0x95e96d467e235f0c
	.xword	0xd1b1358ae809277d
	.xword	0x7373a56e82cd8e0c
	.xword	0x8bcd48ea08aa53db
	.xword	0x589f9e21be86e05f
	.xword	0x33d9c1de3310d907
	.xword	0x4822f0e7d29cc73a
	.xword	0x6fe64aef85b1f71d
	.xword	0xb968d71027d66235
	.xword	0x1671c124d35b6a5d
	.xword	0x2130c9672af9bc92
	.xword	0xc1f860a9e725a524
	.xword	0xb905a4d9feb6ac6b
	.xword	0xf151075c14b31a21
	.xword	0xbe3a852b0a063397
	.xword	0xd2c7ff6554a0c9c8
	.xword	0xd8f8d82d7f917136
	.xword	0xc69dd1e955a24ea3
	.xword	0x9416ac9e2a324a39
	.xword	0xd4582c63f8f3b48a
	.xword	0x0ba23e3bc8d2631f
	.xword	0xaeeb04dfe5c1a691
	.xword	0x71e54cca7837215d
	.xword	0xd0033fcbe676a71b
	.xword	0xbfbec2e4acf01614
	.xword	0x15fbfc180b9cf3ae
	.xword	0x9729466b34c99c18
	.xword	0x0c72f68e111e19db
	.xword	0xb1a12b79d6fb8c7f
	.xword	0x160828af83507aa6
	.xword	0x85e6b1abc1912130
	.xword	0xeb54254651f5aacb
	.xword	0x33a91b5466487479
	.xword	0xb1d16825a4864f77
	.xword	0x755ddf2d862b43fe
	.xword	0x94e515f15ab74abe
	.xword	0x4250f2f751f11b40
	.xword	0x21f0c1a7bcef1f04
	.xword	0xe7a6c72a3f6c45e6
	.xword	0xd2e36f4b8d503f8c
	.xword	0x9d5e6c6c8fc78244
	.xword	0x8a7c946cdf71fc80
	.xword	0x584fbfd8edbc3c35
	.align 0x20000
	.data
data_start_5:

	.xword	0xfc61af444c00b7e1
	.xword	0x11b62b04eefce789
	.xword	0xc33479b3adb86176
	.xword	0xe1f19b564dd08c3d
	.xword	0x458ccdd7a3411fd6
	.xword	0x2202d806b9ecf440
	.xword	0xa436b1369776ecf4
	.xword	0x7aaaab1659fc8352
	.xword	0x30f202327b62730e
	.xword	0x7363db95e79b7898
	.xword	0x32c59331f3fe2246
	.xword	0xab4408eeabc54f94
	.xword	0xf32d7c48cd6909da
	.xword	0xf03b27a517934857
	.xword	0x90724e82cbe32b0e
	.xword	0x806ad3e7f9227dbd
	.xword	0x78a9703883bf7e07
	.xword	0xb3d652ea052cd12b
	.xword	0x2efb5a31254abaef
	.xword	0xdf8b7d7f1d918c58
	.xword	0x44bdff618a927a1d
	.xword	0xfd52901e20d08155
	.xword	0xe974e264179f4519
	.xword	0x7c9f77f4ea718be1
	.xword	0xa7ed86eda87e9866
	.xword	0x95fa83f812d1d7d8
	.xword	0x283f5bafc8dac405
	.xword	0x563b987741c3a1fd
	.xword	0x4c11966cea4cb8e8
	.xword	0xc8cab3283132a206
	.xword	0x1c31501b57ebd030
	.xword	0xc6310a76b6584246
	.xword	0x0a12b85f7a584109
	.xword	0xdb6c57161744f3f3
	.xword	0x87c2242e55e1d5f5
	.xword	0x1f4c419ee25b1717
	.xword	0x5e7df0f26536251b
	.xword	0xb3278de6abd2ee00
	.xword	0x855e67d324f556ea
	.xword	0x772a456b5d5366e3
	.xword	0x4699cc6a6c02943e
	.xword	0xc0a0bfeb813066e1
	.xword	0x5e68df088baed89f
	.xword	0xad8812574c7a7d8a
	.xword	0x4ac3501451c20756
	.xword	0x0b82202b5d977227
	.xword	0xe3db46366cc98bf5
	.xword	0xf6da55c992248dfd
	.xword	0xb875c4c26f36ec5c
	.xword	0x61c15ee64f8ef186
	.xword	0x7f534f745e337416
	.xword	0xe1e447008774c42f
	.xword	0x19ad0ba4a67b62d9
	.xword	0x65ee893dcb3be363
	.xword	0x44694e3d01e6c3ac
	.xword	0xa91fb3ec007ae8d3
	.xword	0x78c3acb8a667e0af
	.xword	0xfa1ad2a885289c4a
	.xword	0x5d231f3b846d3d91
	.xword	0x4b194bad6223aa4c
	.xword	0xf1e30e7c33296f4b
	.xword	0xb7febe5d076fcf17
	.xword	0xe3410fa45d3b1163
	.xword	0x1e5fd5f38037a116
	.xword	0xc5cf80a0027c4677
	.xword	0x2c1cf0057e9fe0ca
	.xword	0x480fc12a0119ec57
	.xword	0xd8bf6d5cb5b128b5
	.xword	0x12cca80d1eccc5b9
	.xword	0x1575879be09ac373
	.xword	0xf2eb679dc067e449
	.xword	0x6c5535840524d8b7
	.xword	0x75d07d965472bba1
	.xword	0xe77ef55dc3808d0f
	.xword	0x0557cd15d7a24819
	.xword	0x8432e808cf189180
	.xword	0xb5389e53c48ecc99
	.xword	0x66ded024d50a844a
	.xword	0xfc41fe9c09979d54
	.xword	0x394b48b78e6e94ad
	.xword	0x61526f52543f4926
	.xword	0x080600b21726588f
	.xword	0x4323e280e00f83a9
	.xword	0x58ed959be847d73d
	.xword	0xf3124beafa368fcf
	.xword	0x1f061eea15e0a391
	.xword	0x2d9ec8d16c7d64c1
	.xword	0xbd25aa99295396ed
	.xword	0xc5969586f86aabd5
	.xword	0x0250969f22049bb6
	.xword	0x747df25a1fe004d0
	.xword	0x77ee17634f253504
	.xword	0xf7e00f09481e2282
	.xword	0xbf0793520501c8f0
	.xword	0x4eee9dc2f9a80e41
	.xword	0xd30fed8bd2a85a85
	.xword	0xcc8c149c4dd22c06
	.xword	0x11b05c03340fc181
	.xword	0x15cecc7161ffae60
	.xword	0x080498d476b1e13b
	.xword	0x7a35830b940ab0dc
	.xword	0xab640df65af339e2
	.xword	0x527c9a54f1b5c8dc
	.xword	0xfd0410433eb9451e
	.xword	0xc90a2d89255b7c03
	.xword	0x67877cc31a4931e6
	.xword	0x6639b815b33b0ad8
	.xword	0xde64bb0b59e434fa
	.xword	0x0a3d9d84ee39534c
	.xword	0x700097fac0715956
	.xword	0x2a5761d5bd84107a
	.xword	0xc280698d87d4c453
	.xword	0xe91390440243b620
	.xword	0x5309694acae9cd42
	.xword	0x3cecb6d5b9186f77
	.xword	0xc550ec6e0902b7a2
	.xword	0x17211afc43e476d5
	.xword	0xd1a2106ef8755298
	.xword	0xe896370609818d99
	.xword	0x22a0f2584e03924d
	.xword	0xe2080943c223321e
	.xword	0x6043d207f736ebb9
	.xword	0xd6afacfd34dea62f
	.xword	0x12e97beb98eb4f22
	.xword	0x70bb19a2d78176f2
	.xword	0x93ce1deb857e19fc
	.xword	0x06e541b6ec124931
	.xword	0xa042d6d9feb8cd4e
	.xword	0xad58d3cce159809f
	.xword	0x672b88b67b3098af
	.xword	0x53b0d1e0f2a0afac
	.xword	0x765671b5e01156df
	.xword	0x09dab83ec69b6fce
	.xword	0x58db43408956045f
	.xword	0xdb35b712ce2e2a68
	.xword	0xd79ba7debe63e81e
	.xword	0xc1b062cca5a44587
	.xword	0xd914ec633a21aa5d
	.xword	0x76589c9a6391e219
	.xword	0x9ea4e6a4bbb47b47
	.xword	0x23c7c191caa897ac
	.xword	0x6e51434f535c5d60
	.xword	0x122a704331cfb6d4
	.xword	0xf40999c5eb800860
	.xword	0x48e365dc6dd37a7f
	.xword	0xc6cd8a7cadd211d2
	.xword	0x5f5dbd6565698be3
	.xword	0x1fd698d01a2ca819
	.xword	0x554a64aef3718ade
	.xword	0x6d0e56d551a79ba4
	.xword	0x91a0d0ce388e0487
	.xword	0xa412a474441ab3da
	.xword	0xac389744610aae7c
	.xword	0x5d7a0c8359765a87
	.xword	0x8d1b1ae0559b59c2
	.xword	0x703afc59eb9e89dc
	.xword	0xfe61037a011a42e9
	.xword	0xee66e2c66d1cd736
	.xword	0xcd30c489360542ac
	.xword	0xe25b73c889213e33
	.xword	0x14e6e5db387c1aa7
	.xword	0x305020b7f73bf6de
	.xword	0x56adaee87c0354cc
	.xword	0xefd1b8289f769cab
	.xword	0xc227277168b88062
	.xword	0xfa864203d18418ab
	.xword	0x4699b3ab6236386b
	.xword	0xca7eb48c2a10fd05
	.xword	0x02b6c34a7ddf0ca5
	.xword	0x9ac5dd9cf9a23bb8
	.xword	0x410fdbf0e54852b3
	.xword	0xbfa5e3a2e3680141
	.xword	0xcad2ef72cd59fdcf
	.xword	0xe95f2070b8a5caea
	.xword	0x0829225718643679
	.xword	0x26b741b7fa363436
	.xword	0x1200bc01fec42569
	.xword	0xaae1fc9e29abf286
	.xword	0xa75896ee15d5f54c
	.xword	0x839abb113e8bacc4
	.xword	0x28aa4ce872edb037
	.xword	0x789be1195b2640d4
	.xword	0xf1aa9903b7234c3f
	.xword	0x87217d9e38caa2fb
	.xword	0xf1330744baea2a48
	.xword	0xbdb4ac36570f74a4
	.xword	0x8350c5093f09f05e
	.xword	0x3e1d4c9659c7670e
	.xword	0x0fa96c328823a975
	.xword	0x2be9c43b20ed8bcc
	.xword	0x1b197d36c85bf6c3
	.xword	0xaa36df5afb78cdf9
	.xword	0x3a704f189ffa2def
	.xword	0xfcc0c4203c73d6cb
	.xword	0xdef4753d33528bfd
	.xword	0xc6abe275ba43b2da
	.xword	0xe9975a6292ee83f1
	.xword	0xcdf64a75436fa5a2
	.xword	0x15d147d3bf407d55
	.xword	0x952a5c71f511fbaf
	.xword	0x87502cd00556f591
	.xword	0x6698006baa3a2117
	.xword	0x72cfffbba4a4cd82
	.xword	0x3a5e06f702c18ae2
	.xword	0x7dbebd39863c873a
	.xword	0xd735fdbd7d0faaba
	.xword	0x2c048005cd465372
	.xword	0xbe170aed72d9ab47
	.xword	0x35d4878a2e6fe150
	.xword	0xe32db9db88db5a7b
	.xword	0xa870bd451cc17da6
	.xword	0x8828c63c11f1aa62
	.xword	0x37a84450eeb57a4d
	.xword	0x9c0b022a9fbf5f94
	.xword	0xe8f78627df4524c5
	.xword	0x69575c0bc6c813ac
	.xword	0x5e43b540e3990bb1
	.xword	0xf24332e47472d5a2
	.xword	0x9d69db563a504bba
	.xword	0xdfe5e13b0464202f
	.xword	0x17dceee321831a22
	.xword	0x28fa8a84777e1945
	.xword	0x0b9197612faa9fa3
	.xword	0x54dc54bc75a879ab
	.xword	0xbe8c5b7d95a2f198
	.xword	0x51b64c1a58f56cac
	.xword	0x98fb703241d4ac41
	.xword	0xdbab172b170ed06f
	.xword	0xa5b47998123bccbc
	.xword	0xd77c53497a5554f0
	.xword	0x5775401e1959f056
	.xword	0x3d335779f86aba03
	.xword	0x5e96e90098699582
	.xword	0x15a761da18f588e4
	.xword	0x3f19ed2e24ec7b6b
	.xword	0xd0f6f878b9684d93
	.xword	0xf69d2651d52a0910
	.xword	0xfa1e128fadb1c3a9
	.xword	0x20104e3f7040cde4
	.xword	0x2a65e8d5dc0e15a7
	.xword	0x041e9d920d928ec5
	.xword	0x25c798c6c3f2aa4f
	.xword	0xe534883df4919656
	.xword	0x59dc8de1bbeec6e6
	.xword	0xa21e11a64654b9fb
	.xword	0xf0ab201d422ba664
	.xword	0x78ff832857400534
	.xword	0xe7deee0b8a92509d
	.xword	0x0edee1bbde5efd37
	.xword	0x7c10428b08529cac
	.xword	0x598f4ce17f61fc5a
	.xword	0xb7e2c9827a47fcab
	.xword	0x0f3f8bb8dea9a53b
	.xword	0x6d98fa10e0c3f436
	.xword	0xe1eb2b1fc5be6dd2
	.xword	0x72c1516ed4a0baec
	.align 0x40000
	.data
data_start_6:

	.xword	0xf23f6b7f00323b60
	.xword	0x0a00f92f3093a8a8
	.xword	0x7cddeb62704b47f9
	.xword	0x3a3271211897cf13
	.xword	0xadb769abd215f4d6
	.xword	0x02b0946902d14948
	.xword	0x288c1d313062b061
	.xword	0x5871e68597811dcd
	.xword	0x36387b175c10cbda
	.xword	0xc907ed4f1730142c
	.xword	0xc5d7a7b32a27754b
	.xword	0x7e5779d3ebc904de
	.xword	0x8b5a8ae37cfecf16
	.xword	0x3bb04385db7ee991
	.xword	0xdb415f2b81f8878f
	.xword	0x9f324a3b4f6f0a50
	.xword	0x5c11fbf41118f7c0
	.xword	0xbdd44f6c1afa9309
	.xword	0x65844d5ef446313c
	.xword	0x6112a3daeba98d6b
	.xword	0x05c027d422454b46
	.xword	0xf19133c4804fa75d
	.xword	0x9cddfabfd60d5b25
	.xword	0xe9d5cac0e515ee87
	.xword	0x34d5d60887c90107
	.xword	0xf5e870229fbe20cb
	.xword	0x445647b0f8d1b19b
	.xword	0xef4defc5b4df57b0
	.xword	0xe261ebad2b16f364
	.xword	0x555cd74e0b83de6f
	.xword	0x59b0a600f12f07fa
	.xword	0xfe8b99ece408ed46
	.xword	0xbbb379bf2186c3b1
	.xword	0x55b2508a7d846e0d
	.xword	0xd1e2dbaa4fc571a9
	.xword	0x421e5364b9489c75
	.xword	0x31052f4c1825ede3
	.xword	0x2648cff6d64050e1
	.xword	0xd6a9388ea22fe0b5
	.xword	0xcce6394a1554f67e
	.xword	0x3f829a794435daa0
	.xword	0x3a7a0aca16d810f5
	.xword	0xeccb9385c4663515
	.xword	0xeffa394aad40a03c
	.xword	0x55a5b9fb143e5034
	.xword	0x90f7c4a07e72588d
	.xword	0xff1bbf45b5613812
	.xword	0xfeee36d8f94d09ce
	.xword	0x7bebdaca17486cbf
	.xword	0xf4837cd1a7e3c8bf
	.xword	0x657066dcbbc85c1b
	.xword	0xcc55c42a2c2af007
	.xword	0x436c43b1d753632e
	.xword	0xe223809fc3663f61
	.xword	0x110d3b189f1dfb69
	.xword	0x233dde80f6799c7f
	.xword	0xa7064eb7625c87dc
	.xword	0x449ce3af2a7752ac
	.xword	0xd6787c80d372fb2a
	.xword	0x4721bd0151ec79a0
	.xword	0xcfdbdf1636ef366f
	.xword	0xd9d03e196c0ada97
	.xword	0x7ff5b2d515e7a6c3
	.xword	0x326d3f47b80773f1
	.xword	0x7827b6b64b6080d3
	.xword	0xbac714c8daa9ceef
	.xword	0x7213e07e64fc1459
	.xword	0xcfe042190fe8ad79
	.xword	0xc3e0969f47390ae4
	.xword	0x5ad35e4e28aa3c54
	.xword	0x05fd28537e60dccf
	.xword	0x599c874a921c51b4
	.xword	0x2c57883d8f623b23
	.xword	0x04de3b0d68d7a581
	.xword	0xb7bd856509de1f30
	.xword	0x01b8e099762c803b
	.xword	0xa57eab3ed112350c
	.xword	0xd8a754fbeb3b89ee
	.xword	0xeb6be6edc86632a4
	.xword	0x0e714ca4ae6c1f38
	.xword	0x74381c863867e2c2
	.xword	0x643d7ede8a086c5e
	.xword	0x5bd1678a5c817b49
	.xword	0x35fdba32d962df3c
	.xword	0x08c726656c8e51d5
	.xword	0x1b58ca32f4322c70
	.xword	0x4ccdeea7769e67b3
	.xword	0xa256b3f20b75c434
	.xword	0x2bf60a78f346c62b
	.xword	0xd5988493e461da31
	.xword	0x9535113e4299e17b
	.xword	0x04255ac0930c8dfd
	.xword	0x533a4b2961f2dadc
	.xword	0xffe9414f391b27d9
	.xword	0x9cf7d8ef1fcaa83c
	.xword	0x30db1db31a7a4bf2
	.xword	0x2bde3894243697fa
	.xword	0x3f5cc131d0e3a008
	.xword	0x55693e0ed4b91ee8
	.xword	0x3aa0e7d03a639d5e
	.xword	0x4b698c9af4e9ddd5
	.xword	0x0dae4176050a9087
	.xword	0xb476d191326cced9
	.xword	0x3c9f7ea5a5421421
	.xword	0xf929b567b1c50a2d
	.xword	0xc2827f7149f5413b
	.xword	0x0c75bc04bda7386d
	.xword	0x38cf4d9fc5a2c3c7
	.xword	0x330cc056cba71c9a
	.xword	0x1c9fe386b22df74c
	.xword	0xe049c11e8db9ba90
	.xword	0x2bbae0d3d6b3678d
	.xword	0x3b19ab715943e923
	.xword	0x30a019a253d83151
	.xword	0xabb63000c4115be6
	.xword	0x15833a7ecdef2ba0
	.xword	0xe628ed2a0b73702d
	.xword	0x88b0dca67a705ec4
	.xword	0x66864649497f5161
	.xword	0xc0493b4aec58be58
	.xword	0xda80e3d3858f982b
	.xword	0x45561928ce4aaa51
	.xword	0xa54852c6e3a52b3c
	.xword	0xe1301cca5ba05f4b
	.xword	0x542ed0e4461ed4f5
	.xword	0xf7f13d383c07c946
	.xword	0x66e0e218adf030ec
	.xword	0xb9f06638cc9115a0
	.xword	0xe68d2e160dc6c0c7
	.xword	0x5e550ca16bcd0b55
	.xword	0xc4360e5dc21d8b22
	.xword	0xd8ec92a7fbcc5462
	.xword	0xa48c4ffea60f606d
	.xword	0xffeef71e7dc1678d
	.xword	0x359ca94f4244dcf1
	.xword	0x5796f456dabe3b2c
	.xword	0x6126935e8f74eaef
	.xword	0x4734baf51eb3ab16
	.xword	0x887973b2b53332d3
	.xword	0x7f6eee74073237bc
	.xword	0xf9881e5146692450
	.xword	0x194f616f1741d56e
	.xword	0xad7b0c5443010f37
	.xword	0xa37100844bb7ba79
	.xword	0x462664564df9f413
	.xword	0x12447f82d0dc0c2b
	.xword	0xf49bd7659a2e347a
	.xword	0x7626b1ef7c49527e
	.xword	0xba493317be1dc410
	.xword	0x3a578136ebd2b467
	.xword	0xda3ba76d2828ea40
	.xword	0x826493142a5d9a94
	.xword	0x1e08c3d889619bc8
	.xword	0x29ad231c1ffb7e69
	.xword	0x295aac867c653693
	.xword	0x974721e9f5426c8b
	.xword	0xdfbe573c7bf493af
	.xword	0x23b3e1b5206dbd6e
	.xword	0x53aca8933c34445f
	.xword	0x2e15d5efa444608d
	.xword	0xfa6f2589a5e38543
	.xword	0xae03b3177e8fd76c
	.xword	0x4737c815d9ede56f
	.xword	0xc99be976c5a7a6c4
	.xword	0xfc353170390cc7b4
	.xword	0x88ebb2378ae8941e
	.xword	0xf28cdae0cd8bedf0
	.xword	0x479b1cbef6e7ddb6
	.xword	0x0ceab4b19114763f
	.xword	0x2b8157961d36cf43
	.xword	0xcb5f611f65e33717
	.xword	0xb0ec980ed2ff8335
	.xword	0x596eb1bf04e83e5e
	.xword	0x34d9f73fe4743109
	.xword	0x1616676fd390c177
	.xword	0xd5b4cf5bf039b638
	.xword	0x971bd6adc8ac1cc6
	.xword	0xcbb63bc93dcff23c
	.xword	0x33187bd0e5256d6d
	.xword	0x34b46599ac340e52
	.xword	0xe6848c9ce3bf5211
	.xword	0x9da1d7f4dbd81717
	.xword	0x9122fdb5d6f38f47
	.xword	0x2f99d5fdb42508f2
	.xword	0x5728e62f47735598
	.xword	0xa28f130b674ce12e
	.xword	0x21aaa3b1a4384302
	.xword	0xe203715fe65fc092
	.xword	0x0dbf5fb44b07154a
	.xword	0x972cc8ece46201be
	.xword	0x85c2908255784dea
	.xword	0x304ce972fe8dbc10
	.xword	0x2eeff3fafaf46d36
	.xword	0x6f64ed92edddd4c0
	.xword	0x4db36fa47bc4c1fb
	.xword	0x6f597418b6909a52
	.xword	0xd088b5d585b27ecd
	.xword	0x4de3a46f35cebab9
	.xword	0x9972911a3de21376
	.xword	0x9ba8a541d273de53
	.xword	0x0fc1c7fe2a2b1657
	.xword	0xdd1495c0d7fb9bf0
	.xword	0xb7942161788d03b1
	.xword	0xde926f50d98f7407
	.xword	0xa2c0c365c35e04dd
	.xword	0xc88d2b749aebd1a5
	.xword	0x3ac9384db5898daf
	.xword	0x98bf8b315c1bb73a
	.xword	0x9aeafead45c7b11a
	.xword	0x234eeca5f6ea9e3b
	.xword	0x932648d013505ef7
	.xword	0x2aa292643538a553
	.xword	0x15e093e96aac327e
	.xword	0x31b3a4b96761e74f
	.xword	0xb36cf84d45d83332
	.xword	0x0c8d4ba2aa9eb77e
	.xword	0xb99fb2be45e34a51
	.xword	0x1d52324247902350
	.xword	0x30699b165a36cff2
	.xword	0xf2cdeb3340af4272
	.xword	0xcff17cd3f8a0b33d
	.xword	0x14c1cbaa5e4dcd46
	.xword	0xcde1ccf4451276b6
	.xword	0x6bc76e0eba69cf40
	.xword	0x7e0042b0e8504e16
	.xword	0xd4db48ca384a9eac
	.xword	0x6896460ec8af5817
	.xword	0x5bb9bd8ead834c16
	.xword	0xd95cae7b0cee6d4d
	.xword	0x93146a377120842a
	.xword	0x4d1c17451b221018
	.xword	0xe759ceacb8ab4f48
	.xword	0x783a2359a7cd303e
	.xword	0x24b20d0579af029e
	.xword	0x3f8df03dd54cc4a0
	.xword	0xda2eb0061ea4e911
	.xword	0x54301f624f506f08
	.xword	0x470597e34f394dc7
	.xword	0x846d4f989d8cef78
	.xword	0x63f8c29d6434b481
	.xword	0x45e11619daa32ec3
	.xword	0xb7c925d71ab5611a
	.xword	0x608f8ab8adcad89e
	.xword	0xb2cdb749ef36353f
	.xword	0x436d4952b58493f8
	.xword	0xa409b1b342419a72
	.xword	0x39a20bcff36002f3
	.xword	0x4140cea9e96caf5d
	.xword	0x43519b54f84b78c4
	.xword	0x8e21415817de632e
	.xword	0x5fafedc261a5d0b9
	.xword	0xf5a924e667200768
	.xword	0x6efb513970b82ef8
	.xword	0x2e43fca3b4b0b298
	.xword	0x932b44fab5267258
	.xword	0xceefabdff07e2cc5
	.align 0x80000
	.data
data_start_7:

	.xword	0x6e12073d13ccaf72
	.xword	0xe8d55dc279d1939b
	.xword	0x244ddddd6eee9581
	.xword	0xfef61de5e5631589
	.xword	0x25061332e032e15b
	.xword	0xbcf39dc4be893afe
	.xword	0xa6aa873865e15465
	.xword	0x08d059dfb82c0646
	.xword	0x21725eb982f9eb24
	.xword	0xf30f724b8472796e
	.xword	0x1d5f6468a7b6cef5
	.xword	0xbd3515ecc373cc28
	.xword	0x913304cd6ed4b40f
	.xword	0xe2264d5bf10d5d64
	.xword	0x837e10c99ae6bfaa
	.xword	0x809528a2b39bf1a5
	.xword	0x2dda2c5e49df0999
	.xword	0x668ac12b7c3efd4d
	.xword	0x8bc47f0907ae7ada
	.xword	0xfdb59e83288f88d2
	.xword	0xa9c6e423a2d647ea
	.xword	0xb0f4e7a3e9607713
	.xword	0xbe4e3928cb0d7448
	.xword	0x032e40641b3261ae
	.xword	0x1637fc27f915d078
	.xword	0x4db25d7bec8f257e
	.xword	0x22691bcdc811d684
	.xword	0xccc47c2f4abe5b00
	.xword	0x004ed34d0a0e4147
	.xword	0xa5b8ee62ed5590a5
	.xword	0x5ae4f8bc6ec91175
	.xword	0x58e2f23cba12becb
	.xword	0xeac997add5edd4a5
	.xword	0x38a94a4c0f8d6ee5
	.xword	0x1d876460dfb9b8ed
	.xword	0x54f6874142b96cb9
	.xword	0xeef4b4ee6abe9138
	.xword	0xb3372f260a13d8b4
	.xword	0xa4c3355f6cd3f7de
	.xword	0xf151684a86e52d9e
	.xword	0x597cf296edcc0fe1
	.xword	0xc9c23189a1050923
	.xword	0x9e5076989280a93f
	.xword	0xc95c4177fe79077f
	.xword	0x4a4ceac2d1d33123
	.xword	0x3c8132d917a69da4
	.xword	0x73f2e70f899272b2
	.xword	0x650b63a44e635747
	.xword	0x941b1bdcb551afc8
	.xword	0x74517945d3fb82db
	.xword	0xf2d3df0c9c76a0ff
	.xword	0x3c9fecdc650f3fa2
	.xword	0xa4b6601fd41c89f9
	.xword	0x4a0246cea893e6b8
	.xword	0xfa3214037a87f0ea
	.xword	0xdd8876e164f6dd77
	.xword	0xd76f2b4c8aa04103
	.xword	0x3495c368f70ec5d7
	.xword	0x4b8360166dae92b2
	.xword	0x9e479bbe9ec3c268
	.xword	0xfb3f72cc76cdc3f1
	.xword	0x691f7609d1dc0712
	.xword	0x35f8a2a02f85772a
	.xword	0x567a4655cc7e5b0e
	.xword	0x6848d94a1b244f70
	.xword	0x07b00b49c1a37673
	.xword	0x5eb98ba57910d8b4
	.xword	0x1fac219e6638cc37
	.xword	0x02c1636d62e614ca
	.xword	0xc64f88698423835d
	.xword	0x5498b04aebc4bc0a
	.xword	0xe51e0a129e355a94
	.xword	0xa690fcc985353fa1
	.xword	0x252b200ec42e38a1
	.xword	0x8e06fb5e611886f2
	.xword	0xcd4e7dc91b65f60b
	.xword	0x7fa1891e54012016
	.xword	0x1905e6bd856b4844
	.xword	0x1e40039c867e7c5f
	.xword	0x0cd95f0acc959d97
	.xword	0x76ec0ec6d8a74b24
	.xword	0xb157bf7757804497
	.xword	0xc97bef5c1c455334
	.xword	0x92245474c6249d0a
	.xword	0xfd9200c9ee88394e
	.xword	0x4ba52d91d0becad0
	.xword	0x4a1e09696860e323
	.xword	0xd0810472508cf766
	.xword	0xe185f97fd03089be
	.xword	0x0771355ea82ea84a
	.xword	0x3d2d1a9e51b390bf
	.xword	0xfe885031e6d5a7b6
	.xword	0x12f3507a0cf4012c
	.xword	0x776ba064bf9e2615
	.xword	0x8b64c01ad978e6e2
	.xword	0x8dcaab6d87cc90ba
	.xword	0x040de8548d03cb26
	.xword	0x054c3e8dfa878581
	.xword	0x34e68970877aa79b
	.xword	0x3ddc5e6df02b9394
	.xword	0x7b81224c3eb995b1
	.xword	0x70f3ee220ad34f8d
	.xword	0x9ff6990b0a7d29fd
	.xword	0xb999ac723f9d5e3e
	.xword	0xe9c718467777f073
	.xword	0x8aefa5352321db17
	.xword	0x8003172db57e5cb7
	.xword	0xaba71e22407b325c
	.xword	0x6385d7430e191b72
	.xword	0x9164efadf74d3151
	.xword	0x916a6a3ebf935707
	.xword	0x18bd5d7394a06309
	.xword	0x2677b356bfa0c159
	.xword	0xedb61c8a4c82eebf
	.xword	0x0e3ac61fac16f8f8
	.xword	0xb1b3719ec0fdba20
	.xword	0xca521f9d380177ea
	.xword	0x73b4613afcb67788
	.xword	0xd349ae0fc65d079d
	.xword	0xee7071ae04d91f65
	.xword	0x8238cd70f1f4b038
	.xword	0x2de9461fb303bcfa
	.xword	0x0c35b1c96f84affb
	.xword	0x3efec8324764c0b3
	.xword	0x7dc3cdea0b1fcebc
	.xword	0x6d3d173e26bbc8e2
	.xword	0x468e339e991973fe
	.xword	0xf216d6b0177b2bbf
	.xword	0x015b609e60232a01
	.xword	0x26dabca2ae897abc
	.xword	0xc86174d7fc03b003
	.xword	0xc7ffcacb626165ea
	.xword	0xcb57ae2bdd3296eb
	.xword	0xf7410f4bc23f805b
	.xword	0x00951bbb3e1e8b36
	.xword	0xd3ded548d18432a7
	.xword	0x0025e18332f983a4
	.xword	0x2f384684a7d22920
	.xword	0x1075f251b0fc1301
	.xword	0x752ba270a79dba85
	.xword	0xe29c1ced5a794e2f
	.xword	0x718bd6331eb43d5e
	.xword	0xe247ee6903262369
	.xword	0x74fa04f37d85902f
	.xword	0xedf089deff23e4d3
	.xword	0x8f1445d1925572cb
	.xword	0x837817d901bb7055
	.xword	0xd5db484671488751
	.xword	0x502429cd69673d92
	.xword	0x9f05b388272d6bad
	.xword	0x71c4474fd52854f1
	.xword	0x07c7403932e62a51
	.xword	0x6eb1f8b8bfa92e2c
	.xword	0xb2a09c93f48f1587
	.xword	0x1e5f563cca51e71b
	.xword	0x69d107f25569e195
	.xword	0x2affc0434c84e0ea
	.xword	0x08a2eb3e094c7d7f
	.xword	0x49341d63e4213ee6
	.xword	0x906e3d6555fad50b
	.xword	0x03dc5f60f8bed6de
	.xword	0x33fd0550a320ad7e
	.xword	0xf3d7f7ec0237946f
	.xword	0x53402928b7a1f10f
	.xword	0xc72227da8cbda858
	.xword	0x9542114abc3d6073
	.xword	0x16b323fa2c80931a
	.xword	0x7ec694c330457d1a
	.xword	0x531be07fae3129e0
	.xword	0x069b84848853b7d3
	.xword	0x7622ec318aa3cdac
	.xword	0x4927c5aa925c723f
	.xword	0x40bd2d28ed0e7c14
	.xword	0xaae1ecbf1d519b15
	.xword	0x7c610faf7f825794
	.xword	0xb42ad17a8b4e2bf4
	.xword	0xadde331d3f222599
	.xword	0x2147ab601dad837c
	.xword	0x66800644c165c2f5
	.xword	0x143868811ff57f7f
	.xword	0x3d99512ca0e347b8
	.xword	0xee8f9c0aa124bd46
	.xword	0x3e44ed24f1105032
	.xword	0xe4c73d59d931f0ab
	.xword	0xb269f84fa9b16cb1
	.xword	0x65ff6ee96ddefed5
	.xword	0x60e8190be6fe0fdf
	.xword	0x2e5c077a0e83f6ef
	.xword	0x21e4e93b702fc9ac
	.xword	0x0affe37c0832c701
	.xword	0x9b72410bbaf3247e
	.xword	0x940b8775bd247273
	.xword	0x22c4b96c286aef2c
	.xword	0xb5d643175737a3c2
	.xword	0x7cd6035983fee99d
	.xword	0xbb23fc4b5ee08e9e
	.xword	0xcb04ab3676f87226
	.xword	0x7f4d89a777bc67b8
	.xword	0x1246738f88709fc7
	.xword	0x969d2f4a0fea58aa
	.xword	0x9ad863e8a4b77bbf
	.xword	0xeebf4d13f6773987
	.xword	0x4e6d17eca39c3fa9
	.xword	0xcda6569f5df853f5
	.xword	0x0a7960f1114fcd87
	.xword	0xe42162b2ad852672
	.xword	0x1387fa6ae8c77ba2
	.xword	0xedcb18bca9656a92
	.xword	0xd12ab00a05cdbd51
	.xword	0x81d12bf902b3dbdc
	.xword	0x4766e8307f3060f9
	.xword	0x1d71d721f920656e
	.xword	0x611c51a1fccfab35
	.xword	0xb8e78b0ead42ed40
	.xword	0xae8913eaa4ebeef8
	.xword	0x11c4ab9d7000f899
	.xword	0x23d7ff28510c6659
	.xword	0x11b563c91a92f4e5
	.xword	0x15ef6b696b603c33
	.xword	0xc39c686560c91933
	.xword	0xcf38beccdfd9514f
	.xword	0xcb347199a2a0b9f0
	.xword	0x0487e8c4c9d3058a
	.xword	0x13e663288c9ed29b
	.xword	0xa2144ab17c7bafa5
	.xword	0xd79a6be69c658ac3
	.xword	0x3655e06592b78912
	.xword	0x5357a90a8c610a6f
	.xword	0x2105c798d9bac87b
	.xword	0x23dea6c733e0b3e9
	.xword	0x4bff33da6c584653
	.xword	0xde2f561dfcfc989d
	.xword	0x1237542b138f039b
	.xword	0xf3a474fb92074817
	.xword	0x61a037f69a785973
	.xword	0x89f950302c1aa780
	.xword	0x335f13eea5216c36
	.xword	0xdbeb374eaf4c6c77
	.xword	0xe5039dc7fa3c6aa4
	.xword	0x926cb36bb0156977
	.xword	0xfc8b938d17f32575
	.xword	0x217125a653055236
	.xword	0x5688304566fe84ee
	.xword	0xa0019297190c47f2
	.xword	0x2505dc1eab5af0e5
	.xword	0x4973c20e575dac7e
	.xword	0x2f30d692b248632b
	.xword	0x07aa4a65473f462e
	.xword	0x7cedeb6e66a67b4a
	.xword	0x649df6913f6b0e08
	.xword	0x36a682c000d02bdb
	.xword	0xf23d2083db2455bc
	.xword	0x124ad04c6fb363f0
	.xword	0xef07acd35d8b634b
	.xword	0x30baa129f6e079e2
	.xword	0x5afbc114d94886b1



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
