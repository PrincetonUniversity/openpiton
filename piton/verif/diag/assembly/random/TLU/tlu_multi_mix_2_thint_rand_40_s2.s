// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_40_s2.s
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
   random seed:	762381453
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

	setx 0xf214b799a5b05dfd, %g1, %g0
	setx 0x5ee55b4c5edf0084, %g1, %g1
	setx 0x130cc856701a84d0, %g1, %g2
	setx 0x940f6f3c80b0ef68, %g1, %g3
	setx 0xa0e490c049d63969, %g1, %g4
	setx 0xcf3b3cd93ade5f3b, %g1, %g5
	setx 0x19bcdfbffd94d78a, %g1, %g6
	setx 0xab2f0ebe43f50476, %g1, %g7
	setx 0x8eba971a46a34b2a, %g1, %r16
	setx 0x97fd543895c79f60, %g1, %r17
	setx 0x9a1d6d337c1bbb99, %g1, %r18
	setx 0xa6c01e0d52434d0a, %g1, %r19
	setx 0xb2a07c62131e37cc, %g1, %r20
	setx 0xe303199e2a6aa59f, %g1, %r21
	setx 0x19d362519c7bde2f, %g1, %r22
	setx 0xe986e386e9832d23, %g1, %r23
	setx 0x6d130036dba55a93, %g1, %r24
	setx 0xd7b19d1889271798, %g1, %r25
	setx 0x56282abc0f068284, %g1, %r26
	setx 0x19e292720adf4cf6, %g1, %r27
	setx 0xedd741befc0d0685, %g1, %r28
	setx 0xe9bd4e9473a29682, %g1, %r29
	setx 0xd84ba87e1427e66e, %g1, %r30
	setx 0x41e140205636974b, %g1, %r31
	save
	setx 0x4600876648eb6587, %g1, %r16
	setx 0xd3f25329de80669c, %g1, %r17
	setx 0xf0b012ab52608e0f, %g1, %r18
	setx 0xc461c4dce16b9ff1, %g1, %r19
	setx 0x7313ca602b4baea3, %g1, %r20
	setx 0xa20ae8031eb774ca, %g1, %r21
	setx 0xd8126071dea4a515, %g1, %r22
	setx 0x914c0eb06aba6145, %g1, %r23
	setx 0xef2fc62b5c101856, %g1, %r24
	setx 0x253005d8bd8dcfd2, %g1, %r25
	setx 0xc02a1f310b39793d, %g1, %r26
	setx 0xa24446bce43c1c50, %g1, %r27
	setx 0xf21c090d73772d44, %g1, %r28
	setx 0x66680648482933fc, %g1, %r29
	setx 0xa082236a244d5e95, %g1, %r30
	setx 0xade2e7196f9f0927, %g1, %r31
	save
	setx 0xaf6cbe70afa1fc63, %g1, %r16
	setx 0x320bdb541e30c84b, %g1, %r17
	setx 0x5e2ce44bc95736fc, %g1, %r18
	setx 0xd26c53a71bc0060a, %g1, %r19
	setx 0xc3edea111ce6e9d8, %g1, %r20
	setx 0x8d9e7e1d55497b7a, %g1, %r21
	setx 0xebb18fa0272c7e1a, %g1, %r22
	setx 0x4843d8426546b5c4, %g1, %r23
	setx 0xea0c3a2e269433dd, %g1, %r24
	setx 0x42e83b780241b373, %g1, %r25
	setx 0x6109156bfbff10ce, %g1, %r26
	setx 0x828f9132ffd0d23e, %g1, %r27
	setx 0x6502ebf7c4884caf, %g1, %r28
	setx 0x4c91b0b72c853190, %g1, %r29
	setx 0x7c37def0fff017e3, %g1, %r30
	setx 0x5a41279592f18326, %g1, %r31
	save
	setx 0x7aec871f04c709d8, %g1, %r16
	setx 0xb8b214168baddc16, %g1, %r17
	setx 0x45ba0921225d3192, %g1, %r18
	setx 0xea0c0c135599a814, %g1, %r19
	setx 0xa997f8951194610c, %g1, %r20
	setx 0x87caee4ac593975d, %g1, %r21
	setx 0xabb0c16004a30430, %g1, %r22
	setx 0xac4c59e39c5254a9, %g1, %r23
	setx 0x8960ae748fe109e3, %g1, %r24
	setx 0x45cfb9f3ef0178ea, %g1, %r25
	setx 0x5c9e8973853e3b4c, %g1, %r26
	setx 0xa35da783f866e490, %g1, %r27
	setx 0x06bf0d9d9f4abbb6, %g1, %r28
	setx 0x8c6060a43cef2396, %g1, %r29
	setx 0xefb08a53c3ea676c, %g1, %r30
	setx 0x6e0f0509d24e0417, %g1, %r31
	save
	setx 0xae75bc107d0c37c1, %g1, %r16
	setx 0xfebe9ccb98fe5afd, %g1, %r17
	setx 0xf3a8b83697a0f86b, %g1, %r18
	setx 0xf1b67beaa9a6b754, %g1, %r19
	setx 0x1a14ab3b0ca9dc82, %g1, %r20
	setx 0x662dd43ef1cb4e46, %g1, %r21
	setx 0xc78feefd75c70641, %g1, %r22
	setx 0x910349fc67b5b49a, %g1, %r23
	setx 0x569b29856809f6fb, %g1, %r24
	setx 0x5280b1c387907dd3, %g1, %r25
	setx 0x7af6348f2bfea51f, %g1, %r26
	setx 0x6eb7ec0ab9e8dd88, %g1, %r27
	setx 0xda0d79cf14ca9bf5, %g1, %r28
	setx 0xfeca54725384c84b, %g1, %r29
	setx 0x3b07ede8574cbd33, %g1, %r30
	setx 0x4997d7dc9c930f18, %g1, %r31
	save
	setx 0x4e7bd8ea8bada3d7, %g1, %r16
	setx 0x1dac23968d528cc3, %g1, %r17
	setx 0x8782c4ffb3cbaa3f, %g1, %r18
	setx 0x82f14be376458de7, %g1, %r19
	setx 0x83621ac5ad1c7c4c, %g1, %r20
	setx 0x06bca9eebf864fe5, %g1, %r21
	setx 0x46dc385cf2ca5f4f, %g1, %r22
	setx 0xac9b1895e6fb265e, %g1, %r23
	setx 0xec5807772d8741f2, %g1, %r24
	setx 0xc45fadb0103d8ea0, %g1, %r25
	setx 0x5bcc02d8419ccd1b, %g1, %r26
	setx 0x54a14c3819ed187b, %g1, %r27
	setx 0x014d45051e88b699, %g1, %r28
	setx 0xd440850f1d96287e, %g1, %r29
	setx 0x785e47c420e93b68, %g1, %r30
	setx 0x722be45d34f4689f, %g1, %r31
	save
	setx 0xa892dc48c874cfaa, %g1, %r16
	setx 0x91bf2316e6b7f4a4, %g1, %r17
	setx 0xd398f82a9389fb55, %g1, %r18
	setx 0xf5a22e500363204b, %g1, %r19
	setx 0x55b2e7bdcb32be22, %g1, %r20
	setx 0x8870aeba51977af4, %g1, %r21
	setx 0x60c8c6490f683145, %g1, %r22
	setx 0xb24dca37ca945001, %g1, %r23
	setx 0xb00f414c5ce38205, %g1, %r24
	setx 0x7c2d6d2a1b61fb33, %g1, %r25
	setx 0x20493bdb68aa1b36, %g1, %r26
	setx 0xed669561d45707fe, %g1, %r27
	setx 0xe77c03f20a031db7, %g1, %r28
	setx 0x932399cc5a84788b, %g1, %r29
	setx 0x2b8da4f7fb3efb1d, %g1, %r30
	setx 0xd323ad22fd6bfa4e, %g1, %r31
	save
	setx 0x87a741cf985c6d1c, %g1, %r16
	setx 0x2d3d318434e88fb5, %g1, %r17
	setx 0x266219ecbaaa0a1b, %g1, %r18
	setx 0x2745aeb5d8cfc746, %g1, %r19
	setx 0x5b0fd3ea749bc1ee, %g1, %r20
	setx 0x077775d2b7920a51, %g1, %r21
	setx 0xdfc64f9c1a7f7e45, %g1, %r22
	setx 0xf23c6d6be29b5a8f, %g1, %r23
	setx 0x54dff01ae615ed9f, %g1, %r24
	setx 0x26acbc64a101765c, %g1, %r25
	setx 0x2aa266392ec0192d, %g1, %r26
	setx 0x2b21df7d30746abd, %g1, %r27
	setx 0xfc34bbaf07b49a34, %g1, %r28
	setx 0x7e83c4211bebb44c, %g1, %r29
	setx 0xad71f3751b89d208, %g1, %r30
	setx 0xc9a1263e5ae78ae2, %g1, %r31
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
	.word 0xbfe56032  ! 2: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb6854000  ! 3: ADDcc_R	addcc 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xb3e5a1ea  ! 6: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb6c56008  ! 7: ADDCcc_I	addccc 	%r21, 0x0008, %r27
	.word 0xbfe5e1be  ! 8: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e42182  ! 12: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8394e16a  ! 13: WRPR_TNPC_I	wrpr	%r19, 0x016a, %tnpc
	.word 0xbf50c000  ! 15: RDPR_TT	<illegal instruction>
	.word 0xb1e4a143  ! 19: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8194a068  ! 20: WRPR_TPC_I	wrpr	%r18, 0x0068, %tpc
	mov	0, %r12
	.word 0x8f932000  ! 22: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf520000  ! 24: RDPR_PIL	<illegal instruction>
	.word 0xb1e421de  ! 25: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5a0d6  ! 28: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe42137  ! 31: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5500000  ! 33: RDPR_TPC	<illegal instruction>
	.word 0xb3e46001  ! 34: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe520b6  ! 37: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d95e071  ! 39: WRPR_PSTATE_I	wrpr	%r23, 0x0071, %pstate
	.word 0xb0042038  ! 40: ADD_I	add 	%r16, 0x0038, %r24
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe8d61a4  ! 50: ANDcc_I	andcc 	%r21, 0x01a4, %r31
	.word 0xb5504000  ! 52: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 53: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e4e0b4  ! 56: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb61ce0ea  ! 57: XOR_I	xor 	%r19, 0x00ea, %r27
	.word 0xbde5a08a  ! 58: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e421b9  ! 59: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5e105  ! 63: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x91946135  ! 64: WRPR_PIL_I	wrpr	%r17, 0x0135, %pil
	.word 0xb5e5a022  ! 66: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e56196  ! 70: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x38, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899420b1  ! 73: WRPR_TICK_I	wrpr	%r16, 0x00b1, %tick
	.word 0xb7e5e11a  ! 74: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5219b  ! 75: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9518000  ! 76: RDPR_PSTATE	<illegal instruction>
	.word 0xb3643801  ! 78: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a1e2  ! 83: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5617e  ! 86: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e561d7  ! 88: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4e088  ! 90: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a036  ! 92: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e420bd  ! 98: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbe9d4000  ! 99: XORcc_R	xorcc 	%r21, %r0, %r31
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4217b  ! 103: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e52139  ! 108: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e460e2  ! 109: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e42134  ! 110: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb015c000  ! 111: OR_R	or 	%r23, %r0, %r24
	mov	1, %r12
	.word 0x8f932000  ! 114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe5a046  ! 116: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0xb5e4e1c4  ! 127: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x839561d1  ! 128: WRPR_TNPC_I	wrpr	%r21, 0x01d1, %tnpc
	.word 0xb3e4a179  ! 135: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e1e9  ! 137: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe5e19b  ! 138: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x859461a3  ! 139: WRPR_TSTATE_I	wrpr	%r17, 0x01a3, %tstate
	.word 0xb02d8000  ! 140: ANDN_R	andn 	%r22, %r0, %r24
	.word 0x89942183  ! 141: WRPR_TICK_I	wrpr	%r16, 0x0183, %tick
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e08d  ! 146: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x899460bd  ! 147: WRPR_TICK_I	wrpr	%r17, 0x00bd, %tick
	.word 0xb0c58000  ! 150: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0x83942142  ! 152: WRPR_TNPC_I	wrpr	%r16, 0x0142, %tnpc
	.word 0xb1e5a17d  ! 164: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 166: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x91946110  ! 169: WRPR_PIL_I	wrpr	%r17, 0x0110, %pil
	.word 0xb3e5e078  ! 172: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5610b  ! 173: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8994a1ff  ! 174: WRPR_TICK_I	wrpr	%r18, 0x01ff, %tick
	.word 0xbbe5a016  ! 175: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a1ad  ! 177: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8994e018  ! 179: WRPR_TICK_I	wrpr	%r19, 0x0018, %tick
	.word 0xbde4a067  ! 181: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5e00e  ! 182: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x10231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a00b  ! 188: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5200e  ! 194: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e461db  ! 198: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x819521ea  ! 199: WRPR_TPC_I	wrpr	%r20, 0x01ea, %tpc
	.word 0xb9e46104  ! 201: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x9195608b  ! 204: WRPR_PIL_I	wrpr	%r21, 0x008b, %pil
	.word 0xb150c000  ! 207: RDPR_TT	<illegal instruction>
	.word 0xbde5a14e  ! 208: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe420a8  ! 209: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e4e0a5  ! 212: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe46150  ! 215: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4a07d  ! 217: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde46000  ! 220: SAVE_I	save	%r17, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb93c6001  ! 225: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0x8995a05e  ! 227: WRPR_TICK_I	wrpr	%r22, 0x005e, %tick
	.word 0xbb510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xb1e4216a  ! 229: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbf480000  ! 234: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7e4e112  ! 237: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbeac2167  ! 239: ANDNcc_I	andncc 	%r16, 0x0167, %r31
	.word 0xbbe5217c  ! 240: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb151c000  ! 243: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 250: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde46047  ! 251: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4a017  ! 256: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e56076  ! 260: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb518000  ! 261: RDPR_PSTATE	<illegal instruction>
	.word 0xb8844000  ! 263: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xb7e4600c  ! 266: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb0344000  ! 267: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xb9e42156  ! 268: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5e1bc  ! 271: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe461ca  ! 272: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e149  ! 273: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e4a115  ! 274: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983edb  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edb, %hpstate
	.word 0xb9520000  ! 277: RDPR_PIL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e52142  ! 281: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 290: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a043  ! 291: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e460b3  ! 296: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb6a4a181  ! 299: SUBcc_I	subcc 	%r18, 0x0181, %r27
	.word 0xb1508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4e062  ! 303: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x30329, %g1, %o0
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
	.word 0xbbe5e003  ! 312: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe42165  ! 313: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5e0c6  ! 314: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe850000  ! 319: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xb3e4e012  ! 321: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8394a06d  ! 323: WRPR_TNPC_I	wrpr	%r18, 0x006d, %tnpc
	.word 0xbde4a0af  ! 329: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb424e13b  ! 334: SUB_I	sub 	%r19, 0x013b, %r26
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 349: RDPR_TPC	<illegal instruction>
	.word 0xbb359000  ! 351: SRLX_R	srlx	%r22, %r0, %r29
	.word 0x8995604c  ! 352: WRPR_TICK_I	wrpr	%r21, 0x004c, %tick
	.word 0xbb3c7001  ! 353: SRAX_I	srax	%r17, 0x0001, %r29
	.word 0xb934e001  ! 360: SRL_I	srl 	%r19, 0x0001, %r28
	.word 0xb9518000  ! 365: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe42072  ! 369: SAVE_I	save	%r16, 0x0001, %r31
	mov	2, %r12
	.word 0x8f932000  ! 371: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795a1bd  ! 373: WRPR_TT_I	wrpr	%r22, 0x01bd, %tt
	.word 0xbfe5a160  ! 378: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a0dd  ! 383: WRPR_PIL_I	wrpr	%r22, 0x00dd, %pil
	.word 0xb3520000  ! 384: RDPR_PIL	<illegal instruction>
	.word 0xbd540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0xb1e46052  ! 388: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4a0e8  ! 389: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbe9c0000  ! 393: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xb351c000  ! 395: RDPR_TL	<illegal instruction>
	.word 0x8395e10e  ! 397: WRPR_TNPC_I	wrpr	%r23, 0x010e, %tnpc
	.word 0xb3e4e126  ! 399: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4e09c  ! 400: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e42147  ! 402: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8194a007  ! 404: WRPR_TPC_I	wrpr	%r18, 0x0007, %tpc
	.word 0xb72c5000  ! 405: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xbde560d7  ! 410: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5a131  ! 411: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e420e8  ! 421: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbd504000  ! 422: RDPR_TNPC	<illegal instruction>
	.word 0x859560a2  ! 425: WRPR_TSTATE_I	wrpr	%r21, 0x00a2, %tstate
	setx	0x20032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 440: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xbde520b2  ! 441: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde5a143  ! 442: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb751c000  ! 443: RDPR_TL	<illegal instruction>
	.word 0x8994a0d9  ! 444: WRPR_TICK_I	wrpr	%r18, 0x00d9, %tick
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42119  ! 447: SAVE_I	save	%r16, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3032a, %g1, %o0
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
	.word 0x8994618c  ! 456: WRPR_TICK_I	wrpr	%r17, 0x018c, %tick
	.word 0xb81c21e0  ! 458: XOR_I	xor 	%r16, 0x01e0, %r28
	.word 0xb3e5e082  ! 460: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5e185  ! 469: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb09ca142  ! 475: XORcc_I	xorcc 	%r18, 0x0142, %r24
	.word 0x8395a13f  ! 477: WRPR_TNPC_I	wrpr	%r22, 0x013f, %tnpc
	.word 0xbde561ce  ! 478: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde5605b  ! 480: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe521c5  ! 482: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7500000  ! 484: RDPR_TPC	<illegal instruction>
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0ba  ! 487: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4203d  ! 488: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e16d  ! 489: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8595e14e  ! 492: WRPR_TSTATE_I	wrpr	%r23, 0x014e, %tstate
	.word 0xb3e521c6  ! 494: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460c6  ! 500: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e561fb  ! 503: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1cb  ! 506: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb641800  ! 507: MOVcc_R	<illegal instruction>
	.word 0x8395a0f9  ! 510: WRPR_TNPC_I	wrpr	%r22, 0x00f9, %tnpc
	.word 0xb751c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xbd50c000  ! 513: RDPR_TT	<illegal instruction>
	.word 0x8994a1d1  ! 515: WRPR_TICK_I	wrpr	%r18, 0x01d1, %tick
	.word 0xbb518000  ! 517: RDPR_PSTATE	<illegal instruction>
	setx	0x201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xbbe42169  ! 525: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb351c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0xbcbca1e0  ! 530: XNORcc_I	xnorcc 	%r18, 0x01e0, %r30
	.word 0xbb500000  ! 532: RDPR_TPC	<illegal instruction>
	.word 0xb3e46094  ! 533: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb0240000  ! 536: SUB_R	sub 	%r16, %r0, %r24
	.word 0xb151c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xb5e460e8  ! 539: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0xb9e52123  ! 548: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e420cf  ! 549: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbe0cc000  ! 551: AND_R	and 	%r19, %r0, %r31
	.word 0xbbe4206c  ! 552: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5605f  ! 553: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e4a0f1  ! 555: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4615e  ! 556: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb0b58000  ! 561: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xbfe5a1ea  ! 563: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a167  ! 569: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d94e00a  ! 573: WRPR_PSTATE_I	wrpr	%r19, 0x000a, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81982cc3  ! 576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0xb5e4a149  ! 579: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a09a  ! 580: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5211d  ! 581: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5e070  ! 582: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4e031  ! 583: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4e089  ! 594: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb504000  ! 595: RDPR_TNPC	<illegal instruction>
	.word 0xbebce1b7  ! 597: XNORcc_I	xnorcc 	%r19, 0x01b7, %r31
	.word 0xba9c6060  ! 602: XORcc_I	xorcc 	%r17, 0x0060, %r29
	.word 0xbbe5204f  ! 611: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5a1ed  ! 612: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe34a1f8  ! 618: SUBC_I	orn 	%r18, 0x01f8, %r31
	.word 0xb5510000  ! 622: RDPR_TICK	<illegal instruction>
	.word 0xbc0dc000  ! 624: AND_R	and 	%r23, %r0, %r30
	.word 0xb5e5a1e4  ! 626: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbea4e17d  ! 627: SUBcc_I	subcc 	%r19, 0x017d, %r31
	.word 0xb1e4e1fb  ! 628: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbf504000  ! 629: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e1d9  ! 634: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4a064  ! 635: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e421eb  ! 636: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e46118  ! 641: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd3cf001  ! 654: SRAX_I	srax	%r19, 0x0001, %r30
	.word 0xbde561d2  ! 655: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb3e4a192  ! 660: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e56038  ! 664: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e560d7  ! 669: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5e1cc  ! 672: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a134  ! 675: SAVE_I	save	%r18, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 676: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe4e0a1  ! 677: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x3000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e42080  ! 681: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46052  ! 687: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a1b5  ! 689: SAVE_I	save	%r18, 0x0001, %r24
	mov	1, %r14
	.word 0xa193a000  ! 692: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e5a17a  ! 693: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5607b  ! 700: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe56169  ! 701: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4a17c  ! 704: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb750c000  ! 705: RDPR_TT	<illegal instruction>
	.word 0xbde5e14d  ! 706: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_2, %g1, %r17
	.word 0xbbe5614b  ! 710: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e42188  ! 712: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 717: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 720: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xb5e421f4  ! 724: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a05c  ! 737: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a139  ! 743: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5215f  ! 750: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb8346178  ! 751: ORN_I	orn 	%r17, 0x0178, %r28
	.word 0x919560f1  ! 752: WRPR_PIL_I	wrpr	%r21, 0x00f1, %pil
	.word 0xb1e520e9  ! 753: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983981  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1981, %hpstate
	.word 0xb1e5a197  ! 759: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5a030  ! 762: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e019  ! 770: WRPR_TSTATE_I	wrpr	%r23, 0x0019, %tstate
	.word 0xb0340000  ! 775: ORN_R	orn 	%r16, %r0, %r24
	.word 0xb1e4e1c3  ! 781: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5a0c6  ! 785: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe521ce  ! 788: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e049  ! 791: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0eb  ! 794: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e4e0d6  ! 799: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde561da  ! 802: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbd51c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xb951c000  ! 804: RDPR_TL	<illegal instruction>
	.word 0xbfe4213d  ! 805: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe46125  ! 807: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xb7e521de  ! 818: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_0, %g1, %r17
	.word 0xb5e4e00a  ! 823: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4617d  ! 824: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9540000  ! 825: RDPR_GL	<illegal instruction>
	.word 0xb3e4e034  ! 832: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4a124  ! 834: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e42037  ! 839: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5a0b3  ! 841: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e56133  ! 843: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_6, %g1, %r20
	setx	data_start_0, %g1, %r20
	.word 0x8994619e  ! 853: WRPR_TICK_I	wrpr	%r17, 0x019e, %tick
	.word 0xbfe421a3  ! 855: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e42078  ! 856: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe5207e  ! 860: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e421dc  ! 864: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5a103  ! 865: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x3013c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e460a6  ! 877: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4e142  ! 878: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4a1b8  ! 881: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde46050  ! 884: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e072  ! 888: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x1001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e169  ! 895: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e4205a  ! 899: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4e020  ! 905: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde561c1  ! 907: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1520000  ! 908: RDPR_PIL	<illegal instruction>
	.word 0xb1e5614a  ! 909: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4e153  ! 912: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd500000  ! 914: RDPR_TPC	<illegal instruction>
	.word 0xb3e46100  ! 915: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4215f  ! 917: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e56120  ! 920: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983891  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1891, %hpstate
	.word 0xbd540000  ! 926: RDPR_GL	<illegal instruction>
	.word 0xb1e56128  ! 933: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb044c000  ! 935: ADDC_R	addc 	%r19, %r0, %r24
	.word 0xb7520000  ! 936: RDPR_PIL	<illegal instruction>
	.word 0xb9e56054  ! 938: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb4348000  ! 939: SUBC_R	orn 	%r18, %r0, %r26
	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72d5000  ! 941: SLLX_R	sllx	%r21, %r0, %r27
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56031  ! 948: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb57cc400  ! 950: MOVR_R	movre	%r19, %r0, %r26
	.word 0xbde4e022  ! 951: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x9194a1bf  ! 952: WRPR_PIL_I	wrpr	%r18, 0x01bf, %pil
	.word 0xbf508000  ! 955: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4a096  ! 956: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a187  ! 960: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e561fa  ! 967: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e461ef  ! 970: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4a1b2  ! 971: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5e060  ! 974: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x32f, %g1, %o0
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
	.word 0xb7e4e0bc  ! 985: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbb510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e034  ! 989: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a04c  ! 992: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe521ff  ! 993: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_0, %g1, %r21
	.word 0xb2bd2123  ! 1000: XNORcc_I	xnorcc 	%r20, 0x0123, %r25
	.word 0xb0b50000  ! 1002: ORNcc_R	orncc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983899  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1899, %hpstate
	.word 0xb1510000  ! 1012: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a077  ! 1014: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4e113  ! 1016: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e5e01e  ! 1020: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5a11d  ! 1024: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4e1b0  ! 1028: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4218c  ! 1032: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe5e152  ! 1033: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4e119  ! 1035: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1504000  ! 1036: RDPR_TNPC	<illegal instruction>
	.word 0xba0d6193  ! 1037: AND_I	and 	%r21, 0x0193, %r29
	.word 0xbbe4214b  ! 1038: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x9195e1fe  ! 1039: WRPR_PIL_I	wrpr	%r23, 0x01fe, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983c49  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c49, %hpstate
	.word 0xbde5e1f7  ! 1042: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8d94a0fb  ! 1045: WRPR_PSTATE_I	wrpr	%r18, 0x00fb, %pstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4e01f  ! 1050: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4a0f6  ! 1054: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e42040  ! 1055: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e5a074  ! 1057: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e56048  ! 1060: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e52117  ! 1062: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e421ed  ! 1063: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x2003e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a03b  ! 1068: WRPR_PSTATE_I	wrpr	%r18, 0x003b, %pstate
	.word 0xbf480000  ! 1071: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	1, %r14
	.word 0xa193a000  ! 1072: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5e003  ! 1073: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x2022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1075: RDPR_TICK	<illegal instruction>
	.word 0xb135f001  ! 1077: SRLX_I	srlx	%r23, 0x0001, %r24
	.word 0xb5e5e033  ! 1078: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e560bc  ! 1084: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe56107  ! 1086: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb335e001  ! 1091: SRL_I	srl 	%r23, 0x0001, %r25
	setx	data_start_4, %g1, %r19
	.word 0x8194a02a  ! 1096: WRPR_TPC_I	wrpr	%r18, 0x002a, %tpc
	.word 0xbde5a017  ! 1097: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb72cf001  ! 1098: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xbc250000  ! 1102: SUB_R	sub 	%r20, %r0, %r30
	.word 0xbc34e04f  ! 1103: ORN_I	orn 	%r19, 0x004f, %r30
	.word 0xbfe4a0a4  ! 1108: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4e1d6  ! 1109: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe42088  ! 1110: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde460d4  ! 1111: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb33cc000  ! 1114: SRA_R	sra 	%r19, %r0, %r25
	.word 0xb3518000  ! 1115: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e560a6  ! 1116: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a079  ! 1118: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5350000  ! 1120: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb3e5e004  ! 1126: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe560c8  ! 1127: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5e16d  ! 1129: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb540000  ! 1130: RDPR_GL	<illegal instruction>
	.word 0xb60c4000  ! 1133: AND_R	and 	%r17, %r0, %r27
	.word 0xb7520000  ! 1134: RDPR_PIL	<illegal instruction>
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4617c  ! 1143: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e5a080  ! 1148: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf540000  ! 1149: RDPR_GL	<illegal instruction>
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 1152: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 1154: RDPR_TNPC	<illegal instruction>
	.word 0xbc9d8000  ! 1155: XORcc_R	xorcc 	%r22, %r0, %r30
	.word 0xb9e4610e  ! 1156: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0b9  ! 1159: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1162: RDPR_TPC	<illegal instruction>
	.word 0xb9e4213a  ! 1163: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4a151  ! 1164: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x9194218c  ! 1169: WRPR_PIL_I	wrpr	%r16, 0x018c, %pil
	.word 0xb5e56084  ! 1173: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8d9521da  ! 1174: WRPR_PSTATE_I	wrpr	%r20, 0x01da, %pstate
	.word 0xbbe5218a  ! 1175: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e5e192  ! 1176: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9508000  ! 1177: RDPR_TSTATE	<illegal instruction>
	setx	0x2033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72d7001  ! 1183: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0xb62da116  ! 1186: ANDN_I	andn 	%r22, 0x0116, %r27
	.word 0xb5e560bd  ! 1194: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983bd1  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd1, %hpstate
	.word 0x8594601d  ! 1197: WRPR_TSTATE_I	wrpr	%r17, 0x001d, %tstate
	.word 0xb3e42032  ! 1202: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xba244000  ! 1206: SUB_R	sub 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982909  ! 1209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0909, %hpstate
	.word 0x81946134  ! 1210: WRPR_TPC_I	wrpr	%r17, 0x0134, %tpc
	.word 0x8794e066  ! 1212: WRPR_TT_I	wrpr	%r19, 0x0066, %tt
	.word 0xb3e421ce  ! 1213: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde461d8  ! 1215: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb93d8000  ! 1217: SRA_R	sra 	%r22, %r0, %r28
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5203a  ! 1223: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a19d  ! 1225: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839461fa  ! 1230: WRPR_TNPC_I	wrpr	%r17, 0x01fa, %tnpc
	.word 0xbfe560b2  ! 1233: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e560dd  ! 1234: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5e080  ! 1236: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe4a121  ! 1239: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7540000  ! 1241: RDPR_GL	<illegal instruction>
	.word 0x9194a1b1  ! 1243: WRPR_PIL_I	wrpr	%r18, 0x01b1, %pil
	.word 0xbbe4e181  ! 1251: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5a1f8  ! 1252: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8194a057  ! 1254: WRPR_TPC_I	wrpr	%r18, 0x0057, %tpc
	.word 0xb7e4a08b  ! 1255: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4a077  ! 1256: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e460d6  ! 1257: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e520d1  ! 1258: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5a068  ! 1260: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_1, %g1, %r23
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e461b1  ! 1268: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e460f8  ! 1272: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e46185  ! 1275: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e190  ! 1281: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb550c000  ! 1283: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 1285: RDPR_TT	<illegal instruction>
	setx	0x30202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e560f5  ! 1292: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e4613d  ! 1293: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e42103  ! 1295: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8d94a13c  ! 1300: WRPR_PSTATE_I	wrpr	%r18, 0x013c, %pstate
	.word 0xb21dc000  ! 1304: XOR_R	xor 	%r23, %r0, %r25
	setx	data_start_6, %g1, %r21
	.word 0xb9e4e0e3  ! 1307: SAVE_I	save	%r19, 0x0001, %r28
	mov	1, %r14
	.word 0xa193a000  ! 1310: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9e461df  ! 1312: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe4604c  ! 1314: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5a116  ! 1316: SAVE_I	save	%r22, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 1317: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982a91  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0xb3e5e199  ! 1319: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb235c000  ! 1321: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb7e5e111  ! 1327: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x2000c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a09a  ! 1329: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4e09f  ! 1331: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4e003  ! 1335: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5a1a9  ! 1338: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x859521c6  ! 1339: WRPR_TSTATE_I	wrpr	%r20, 0x01c6, %tstate
	.word 0xbbe4e0b3  ! 1343: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r19
	.word 0xbbe4e185  ! 1345: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e461c6  ! 1346: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x879561dd  ! 1347: WRPR_TT_I	wrpr	%r21, 0x01dd, %tt
	.word 0xbbe461b6  ! 1350: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8d9521c7  ! 1353: WRPR_PSTATE_I	wrpr	%r20, 0x01c7, %pstate
	.word 0xb5e4a113  ! 1354: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4219d  ! 1358: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf50c000  ! 1363: RDPR_TT	<illegal instruction>
	.word 0xb5e421ea  ! 1367: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf508000  ! 1370: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe5e164  ! 1371: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 1374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0xbfe4e07d  ! 1378: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4e0d9  ! 1384: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe56174  ! 1385: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4a186  ! 1386: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5213f  ! 1387: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb8c5a191  ! 1388: ADDCcc_I	addccc 	%r22, 0x0191, %r28
	.word 0xb3e4e195  ! 1393: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e05d  ! 1399: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e46189  ! 1401: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e46025  ! 1404: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb540000  ! 1405: RDPR_GL	<illegal instruction>
	.word 0xb3e5e0a1  ! 1406: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e460c9  ! 1408: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5e1e1  ! 1410: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1504000  ! 1411: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5a1ab  ! 1412: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819828db  ! 1415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08db, %hpstate
	.word 0xb1e521b6  ! 1417: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbf50c000  ! 1422: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 1423: RDPR_TNPC	<illegal instruction>
	.word 0xb52cb001  ! 1424: SLLX_I	sllx	%r18, 0x0001, %r26
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4609b  ! 1429: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4a03e  ! 1433: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5a1b7  ! 1434: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb6940000  ! 1436: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xbde5610a  ! 1437: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbcc4a02e  ! 1438: ADDCcc_I	addccc 	%r18, 0x002e, %r30
	.word 0xb3e420f5  ! 1443: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb72ce001  ! 1448: SLL_I	sll 	%r19, 0x0001, %r27
	setx	0x3001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1c8  ! 1450: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf340000  ! 1454: SRL_R	srl 	%r16, %r0, %r31
	mov	1, %r14
	.word 0xa193a000  ! 1458: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbe5e086  ! 1460: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd518000  ! 1464: RDPR_PSTATE	<illegal instruction>
	.word 0xb0858000  ! 1466: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0xb7e561ab  ! 1469: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e420cb  ! 1470: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e560df  ! 1473: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e420af  ! 1477: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5a1e8  ! 1484: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb0a5e1c4  ! 1487: SUBcc_I	subcc 	%r23, 0x01c4, %r24
	.word 0xb7e5609f  ! 1488: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8795e10f  ! 1489: WRPR_TT_I	wrpr	%r23, 0x010f, %tt
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7da401  ! 1495: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb150c000  ! 1497: RDPR_TT	<illegal instruction>
	.word 0xb1e5613f  ! 1499: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb014607b  ! 1503: OR_I	or 	%r17, 0x007b, %r24
	.word 0xb7e4617e  ! 1507: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb0858000  ! 1508: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0xb3e4a0c7  ! 1509: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e420da  ! 1511: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3510000  ! 1513: RDPR_TICK	<illegal instruction>
	.word 0x8795e04d  ! 1518: WRPR_TT_I	wrpr	%r23, 0x004d, %tt
	.word 0xb5e5e12c  ! 1521: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb92d1000  ! 1523: SLLX_R	sllx	%r20, %r0, %r28
	.word 0xbca5a0f8  ! 1524: SUBcc_I	subcc 	%r22, 0x00f8, %r30
	.word 0x839521ed  ! 1525: WRPR_TNPC_I	wrpr	%r20, 0x01ed, %tnpc
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a079  ! 1529: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5e1f1  ! 1530: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8394e033  ! 1533: WRPR_TNPC_I	wrpr	%r19, 0x0033, %tnpc
	.word 0xb41de05f  ! 1535: XOR_I	xor 	%r23, 0x005f, %r26
	.word 0x85956039  ! 1536: WRPR_TSTATE_I	wrpr	%r21, 0x0039, %tstate
	.word 0xb1e46023  ! 1537: SAVE_I	save	%r17, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 1540: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 1542: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9508000  ! 1543: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe5a154  ! 1544: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e5a104  ! 1548: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb951c000  ! 1553: RDPR_TL	<illegal instruction>
	setx	data_start_2, %g1, %r18
	.word 0xbde42077  ! 1556: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4603c  ! 1557: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe56139  ! 1560: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8d95e014  ! 1562: WRPR_PSTATE_I	wrpr	%r23, 0x0014, %pstate
	.word 0xb0154000  ! 1565: OR_R	or 	%r21, %r0, %r24
	.word 0x8995210b  ! 1567: WRPR_TICK_I	wrpr	%r20, 0x010b, %tick
	setx	0x3001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1a9  ! 1572: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5e058  ! 1575: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe56031  ! 1576: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1578: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5604f  ! 1579: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb21c4000  ! 1580: XOR_R	xor 	%r17, %r0, %r25
	setx	0x227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a08a  ! 1584: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xb1e4e002  ! 1588: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd518000  ! 1591: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e461ec  ! 1593: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1596: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe56027  ! 1598: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb13d7001  ! 1600: SRAX_I	srax	%r21, 0x0001, %r24
	.word 0xbd510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0x81942073  ! 1607: WRPR_TPC_I	wrpr	%r16, 0x0073, %tpc
	.word 0x859420ca  ! 1612: WRPR_TSTATE_I	wrpr	%r16, 0x00ca, %tstate
	.word 0xbc052163  ! 1613: ADD_I	add 	%r20, 0x0163, %r30
	.word 0xb7e4a13d  ! 1614: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4e1bc  ! 1615: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e42163  ! 1620: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb29ce1af  ! 1625: XORcc_I	xorcc 	%r19, 0x01af, %r25
	.word 0xb935a001  ! 1626: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0xb9e4a1b4  ! 1627: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbc0d4000  ! 1630: AND_R	and 	%r21, %r0, %r30
	.word 0xb1e4a0a2  ! 1631: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e460b6  ! 1632: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e421ce  ! 1633: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5a019  ! 1634: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf508000  ! 1638: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe46081  ! 1639: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb62c0000  ! 1641: ANDN_R	andn 	%r16, %r0, %r27
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7da401  ! 1648: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb1e5e1df  ! 1649: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbc944000  ! 1653: ORcc_R	orcc 	%r17, %r0, %r30
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbcbd2070  ! 1656: XNORcc_I	xnorcc 	%r20, 0x0070, %r30
	.word 0xb1e5a187  ! 1657: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e52037  ! 1659: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5a0f4  ! 1663: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9520000  ! 1666: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e421e4  ! 1670: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf50c000  ! 1672: RDPR_TT	<illegal instruction>
	.word 0xb3e4e084  ! 1685: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbeb4a1ff  ! 1686: SUBCcc_I	orncc 	%r18, 0x01ff, %r31
	.word 0xb7e560db  ! 1687: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4e038  ! 1689: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5480000  ! 1690: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e5a0c3  ! 1691: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbd500000  ! 1692: RDPR_TPC	<illegal instruction>
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195613c  ! 1696: WRPR_PIL_I	wrpr	%r21, 0x013c, %pil
	.word 0xb3500000  ! 1697: RDPR_TPC	<illegal instruction>
	.word 0xb3518000  ! 1698: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5a11c  ! 1700: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8195207e  ! 1706: WRPR_TPC_I	wrpr	%r20, 0x007e, %tpc
	.word 0xb9500000  ! 1707: RDPR_TPC	<illegal instruction>
	setx	0x2013d, %g1, %o0
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
	.word 0xb5540000  ! 1716: RDPR_GL	<illegal instruction>
	.word 0xbf518000  ! 1717: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe5e0a2  ! 1722: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4e024  ! 1724: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe560f4  ! 1725: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb4c48000  ! 1728: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xbca48000  ! 1734: SUBcc_R	subcc 	%r18, %r0, %r30
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe42046  ! 1736: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4201b  ! 1742: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_3, %g1, %r20
	.word 0x8595618e  ! 1750: WRPR_TSTATE_I	wrpr	%r21, 0x018e, %tstate
	.word 0xb9e42006  ! 1751: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_4, %g1, %r20
	.word 0xb83da10c  ! 1754: XNOR_I	xnor 	%r22, 0x010c, %r28
	.word 0xb57d4400  ! 1756: MOVR_R	movre	%r21, %r0, %r26
	.word 0xbe1d2162  ! 1759: XOR_I	xor 	%r20, 0x0162, %r31
	.word 0xb3e4e18c  ! 1761: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5a193  ! 1763: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbb355000  ! 1766: SRLX_R	srlx	%r21, %r0, %r29
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89942176  ! 1780: WRPR_TICK_I	wrpr	%r16, 0x0176, %tick
	setx	data_start_3, %g1, %r18
	.word 0xbde42052  ! 1792: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb22dc000  ! 1793: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xbde4a1d0  ! 1798: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5500000  ! 1799: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e1f4  ! 1800: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe421ff  ! 1801: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe56078  ! 1805: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb7c0400  ! 1806: MOVR_R	movre	%r16, %r0, %r29
	mov	0, %r14
	.word 0xa193a000  ! 1807: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde52185  ! 1808: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde56140  ! 1809: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e4e023  ! 1815: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e46139  ! 1816: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf350000  ! 1817: SRL_R	srl 	%r20, %r0, %r31
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1de  ! 1821: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1d1  ! 1824: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e4a0d1  ! 1826: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4a1d7  ! 1828: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	.word 0xb5e5e0a9  ! 1836: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e5a138  ! 1842: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x9195614d  ! 1843: WRPR_PIL_I	wrpr	%r21, 0x014d, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0xb5e460e7  ! 1851: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e42036  ! 1854: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5e15b  ! 1855: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf510000  ! 1856: RDPR_TICK	<illegal instruction>
	.word 0xb3e42086  ! 1858: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e46034  ! 1869: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a121  ! 1873: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5605b  ! 1875: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5214c  ! 1884: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 1885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xb7e5a073  ! 1886: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4e109  ! 1888: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5e082  ! 1889: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x81946001  ! 1892: WRPR_TPC_I	wrpr	%r17, 0x0001, %tpc
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859420ec  ! 1894: WRPR_TSTATE_I	wrpr	%r16, 0x00ec, %tstate
	.word 0xb7e4e11b  ! 1895: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4e025  ! 1896: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_7, %g1, %r21
	.word 0xbc248000  ! 1899: SUB_R	sub 	%r18, %r0, %r30
	.word 0xb8a5c000  ! 1904: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xbfe4e1f1  ! 1905: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb0b560eb  ! 1906: ORNcc_I	orncc 	%r21, 0x00eb, %r24
	.word 0x8595215e  ! 1908: WRPR_TSTATE_I	wrpr	%r20, 0x015e, %tstate
	.word 0xb8ac4000  ! 1919: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xb9e42138  ! 1929: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4205e  ! 1930: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e42015  ! 1933: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5a169  ! 1934: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xba0da1e6  ! 1935: AND_I	and 	%r22, 0x01e6, %r29
	.word 0xbfe521de  ! 1936: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b91  ! 1940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b91, %hpstate
	.word 0xbbe521ed  ! 1941: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf520000  ! 1944: RDPR_PIL	<illegal instruction>
	.word 0xbfe5a100  ! 1947: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e5215c  ! 1948: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3518000  ! 1949: RDPR_PSTATE	<illegal instruction>
	.word 0xb0bde074  ! 1950: XNORcc_I	xnorcc 	%r23, 0x0074, %r24
	.word 0xb9e4605a  ! 1952: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf3c3001  ! 1955: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xb7e4a182  ! 1959: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd480000  ! 1960: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e461d1  ! 1962: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe56061  ! 1963: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1504000  ! 1964: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 1965: RDPR_TL	<illegal instruction>
	.word 0xb0b50000  ! 1966: SUBCcc_R	orncc 	%r20, %r0, %r24
	setx	data_start_3, %g1, %r23
	.word 0xb1e4e1cc  ! 1979: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e421ed  ! 1981: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e165  ! 1987: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5a15d  ! 1988: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8395a0e3  ! 1989: WRPR_TNPC_I	wrpr	%r22, 0x00e3, %tnpc
	.word 0xb5504000  ! 1990: RDPR_TNPC	<illegal instruction>
	.word 0xbe348000  ! 1991: ORN_R	orn 	%r18, %r0, %r31
	.word 0xbbe46087  ! 1993: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e045  ! 1994: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_6, %g1, %r18
	.word 0xbbe4e1f0  ! 1999: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5a1b1  ! 2000: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x919561d7  ! 2007: WRPR_PIL_I	wrpr	%r21, 0x01d7, %pil
	.word 0xbd504000  ! 2008: RDPR_TNPC	<illegal instruction>
	.word 0xbde4a12f  ! 2012: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb6b4a03e  ! 2013: SUBCcc_I	orncc 	%r18, 0x003e, %r27
	.word 0xb5e5a15f  ! 2014: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe42180  ! 2017: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4e188  ! 2019: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x839421cf  ! 2021: WRPR_TNPC_I	wrpr	%r16, 0x01cf, %tnpc
	.word 0xb350c000  ! 2022: RDPR_TT	<illegal instruction>
	.word 0xb5e4a0fd  ! 2024: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0140000  ! 2028: OR_R	or 	%r16, %r0, %r24
	.word 0xbde5e01d  ! 2030: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5618d  ! 2031: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983cc1  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc1, %hpstate
	.word 0xb9e42168  ! 2034: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8995e089  ! 2036: WRPR_TICK_I	wrpr	%r23, 0x0089, %tick
	.word 0xbbe5a1a5  ! 2037: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9480000  ! 2038: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9e5a057  ! 2045: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8d9421aa  ! 2046: WRPR_PSTATE_I	wrpr	%r16, 0x01aa, %pstate
	setx	0x11a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb284e042  ! 2052: ADDcc_I	addcc 	%r19, 0x0042, %r25
	.word 0xb9e56112  ! 2053: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d83  ! 2054: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0xb7e420b4  ! 2055: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8394207e  ! 2056: WRPR_TNPC_I	wrpr	%r16, 0x007e, %tnpc
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e56019  ! 2059: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb8a44000  ! 2060: SUBcc_R	subcc 	%r17, %r0, %r28
	mov	1, %r12
	.word 0x8f932000  ! 2061: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e4e1a5  ! 2062: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4e0d3  ! 2066: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4a16a  ! 2071: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e56127  ! 2072: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5617f  ! 2078: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e460df  ! 2079: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5a038  ! 2085: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x899561cb  ! 2089: WRPR_TICK_I	wrpr	%r21, 0x01cb, %tick
	.word 0xb0354000  ! 2090: ORN_R	orn 	%r21, %r0, %r24
	.word 0xb285c000  ! 2092: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xb9e5a086  ! 2093: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5206d  ! 2094: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2100: RDPR_PIL	<illegal instruction>
	.word 0xb350c000  ! 2103: RDPR_TT	<illegal instruction>
	.word 0xb5520000  ! 2104: RDPR_PIL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2105: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	.word 0xbbe46124  ! 2110: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 2112: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e5a1bd  ! 2113: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b4b  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4b, %hpstate
	setx	data_start_4, %g1, %r22
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd35f001  ! 2126: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xb951c000  ! 2127: RDPR_TL	<illegal instruction>
	.word 0x8d94a0bc  ! 2131: WRPR_PSTATE_I	wrpr	%r18, 0x00bc, %pstate
	.word 0xba35212b  ! 2132: ORN_I	orn 	%r20, 0x012b, %r29
	.word 0xbebd203b  ! 2133: XNORcc_I	xnorcc 	%r20, 0x003b, %r31
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e175  ! 2137: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4e1b1  ! 2138: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbf2d9000  ! 2143: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xb7540000  ! 2147: RDPR_GL	<illegal instruction>
	.word 0x83942023  ! 2148: WRPR_TNPC_I	wrpr	%r16, 0x0023, %tnpc
	.word 0xbd51c000  ! 2150: RDPR_TL	<illegal instruction>
	.word 0xb7e56113  ! 2153: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4e183  ! 2157: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd7ce401  ! 2159: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xbe3cc000  ! 2160: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xbfe520ce  ! 2161: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7540000  ! 2163: RDPR_GL	<illegal instruction>
	.word 0xb9e4e1e4  ! 2164: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4e1b3  ! 2165: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb62d618e  ! 2170: ANDN_I	andn 	%r21, 0x018e, %r27
	setx	0x20019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a120  ! 2174: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe5a1ab  ! 2180: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e461d2  ! 2181: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb17de401  ! 2185: MOVR_I	movre	%r23, 0x1, %r24
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e198  ! 2190: WRPR_TICK_I	wrpr	%r19, 0x0198, %tick
	.word 0xb9e4a0fc  ! 2193: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_6, %g1, %r16
	setx	0x12f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2197: RDPR_PIL	<illegal instruction>
	.word 0xbbe461f9  ! 2200: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e420a9  ! 2201: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x899560e4  ! 2205: WRPR_TICK_I	wrpr	%r21, 0x00e4, %tick
	.word 0xb5e5e0e7  ! 2206: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe560c3  ! 2208: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4a092  ! 2209: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb551c000  ! 2210: RDPR_TL	<illegal instruction>
	.word 0xb5e4e080  ! 2216: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf508000  ! 2217: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e560b0  ! 2218: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x89946180  ! 2219: WRPR_TICK_I	wrpr	%r17, 0x0180, %tick
	.word 0xbde5a145  ! 2226: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e460a1  ! 2229: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e561b3  ! 2231: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4610c  ! 2238: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9540000  ! 2239: RDPR_GL	<illegal instruction>
	.word 0xb9518000  ! 2240: RDPR_PSTATE	<illegal instruction>
	.word 0xb48c6112  ! 2243: ANDcc_I	andcc 	%r17, 0x0112, %r26
	.word 0xb5e560a5  ! 2244: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e46056  ! 2247: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7518000  ! 2248: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4e1e3  ! 2255: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb551c000  ! 2257: RDPR_TL	<illegal instruction>
	.word 0xb3e4a137  ! 2260: SAVE_I	save	%r18, 0x0001, %r25
	mov	1, %r12
	.word 0x8f932000  ! 2263: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e561cc  ! 2264: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe420d5  ! 2266: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd51c000  ! 2267: RDPR_TL	<illegal instruction>
	.word 0xbbe4e07a  ! 2269: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd510000  ! 2271: RDPR_TICK	<illegal instruction>
	.word 0xbde5211a  ! 2274: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e52030  ! 2281: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e0a8  ! 2283: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe5a04a  ! 2284: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e52127  ! 2288: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56027  ! 2293: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbf504000  ! 2295: RDPR_TNPC	<illegal instruction>
	.word 0xb7e46168  ! 2298: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4e165  ! 2301: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4e176  ! 2302: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e016  ! 2310: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3ce001  ! 2320: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xb3e4613c  ! 2321: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e4e1f0  ! 2323: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e52104  ! 2324: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4a0dc  ! 2325: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e5e140  ! 2326: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb352001  ! 2327: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xb7e4e10c  ! 2328: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5e075  ! 2330: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe4e04a  ! 2332: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8395a1f7  ! 2334: WRPR_TNPC_I	wrpr	%r22, 0x01f7, %tnpc
	mov	1, %r14
	.word 0xa193a000  ! 2335: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983b53  ! 2338: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b53, %hpstate
	.word 0xbf500000  ! 2340: RDPR_TPC	<illegal instruction>
	.word 0x8394e1af  ! 2341: WRPR_TNPC_I	wrpr	%r19, 0x01af, %tnpc
	mov	1, %r14
	.word 0xa193a000  ! 2343: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8794e011  ! 2346: WRPR_TT_I	wrpr	%r19, 0x0011, %tt
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195200d  ! 2351: WRPR_TPC_I	wrpr	%r20, 0x000d, %tpc
	.word 0xb3508000  ! 2353: RDPR_TSTATE	<illegal instruction>
	.word 0xbd518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r21
	setx	0x20137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52122  ! 2361: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe56068  ! 2367: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 2369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xb1540000  ! 2370: RDPR_GL	<illegal instruction>
	setx	0x1010b, %g1, %o0
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
	.word 0xbfe5615e  ! 2374: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3508000  ! 2376: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe5a12e  ! 2377: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7504000  ! 2382: RDPR_TNPC	<illegal instruction>
	.word 0xbde4a17c  ! 2386: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 2392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0x83952147  ! 2397: WRPR_TNPC_I	wrpr	%r20, 0x0147, %tnpc
	mov	2, %r12
	.word 0x8f932000  ! 2400: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e560dd  ! 2401: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5e022  ! 2403: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0xb3e4614f  ! 2409: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9480000  ! 2413: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb635a0d7  ! 2418: ORN_I	orn 	%r22, 0x00d7, %r27
	.word 0xb3e4e035  ! 2420: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf508000  ! 2426: RDPR_TSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2429: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3de001  ! 2439: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb7e520b2  ! 2443: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e561c3  ! 2444: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde560e3  ! 2446: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4e0d9  ! 2447: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5a046  ! 2448: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7520000  ! 2450: RDPR_PIL	<illegal instruction>
	.word 0xb550c000  ! 2454: RDPR_TT	<illegal instruction>
	.word 0xb7510000  ! 2456: RDPR_TICK	<illegal instruction>
	.word 0xbbe4a062  ! 2462: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb6258000  ! 2465: SUB_R	sub 	%r22, %r0, %r27
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 2472: RDPR_PSTATE	<illegal instruction>
	.word 0xbe044000  ! 2474: ADD_R	add 	%r17, %r0, %r31
	.word 0xb9e4a192  ! 2476: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8594203c  ! 2477: WRPR_TSTATE_I	wrpr	%r16, 0x003c, %tstate
	.word 0xbb480000  ! 2478: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7e5201c  ! 2481: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x8198398b  ! 2484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
	.word 0xb9e52165  ! 2487: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e56068  ! 2489: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 2490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	.word 0xb9e521de  ! 2494: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbe0c6051  ! 2497: AND_I	and 	%r17, 0x0051, %r31
	.word 0xb5e421ac  ! 2501: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4214b  ! 2505: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4e05f  ! 2513: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1480000  ! 2515: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_7, %g1, %r17
	.word 0xb5e461db  ! 2519: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x9194a1e7  ! 2523: WRPR_PIL_I	wrpr	%r18, 0x01e7, %pil
	setx	0x1022d, %g1, %o0
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
	.word 0x8595a0be  ! 2531: WRPR_TSTATE_I	wrpr	%r22, 0x00be, %tstate
	.word 0x83946038  ! 2532: WRPR_TNPC_I	wrpr	%r17, 0x0038, %tnpc
	.word 0xbfe5e1d9  ! 2534: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4e1ba  ! 2535: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_0, %g1, %r18
	.word 0x8795e0d5  ! 2541: WRPR_TT_I	wrpr	%r23, 0x00d5, %tt
	.word 0xb7e5217d  ! 2542: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4603d  ! 2543: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5216d  ! 2544: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe521fc  ! 2545: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe5e0fe  ! 2551: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb508000  ! 2553: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4e133  ! 2560: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e52157  ! 2565: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde52035  ! 2566: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5210f  ! 2572: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e13b  ! 2576: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e52134  ! 2577: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5e0a9  ! 2581: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e521c1  ! 2582: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e52136  ! 2583: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8795a0fa  ! 2586: WRPR_TT_I	wrpr	%r22, 0x00fa, %tt
	.word 0xbbe52126  ! 2592: SAVE_I	save	%r20, 0x0001, %r29
	mov	0, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbde5a16e  ! 2600: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8d9561bd  ! 2603: WRPR_PSTATE_I	wrpr	%r21, 0x01bd, %pstate
	.word 0xb5e4e054  ! 2604: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e4a0d4  ! 2606: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8195a060  ! 2607: WRPR_TPC_I	wrpr	%r22, 0x0060, %tpc
	.word 0xb3520000  ! 2608: RDPR_PIL	<illegal instruction>
	.word 0xb5504000  ! 2610: RDPR_TNPC	<illegal instruction>
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2614: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e03b  ! 2618: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe461d0  ! 2619: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982b9b  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
	.word 0xbd510000  ! 2622: RDPR_TICK	<illegal instruction>
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1351000  ! 2624: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xbfe4a0ec  ! 2636: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5212c  ! 2642: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xba350000  ! 2646: ORN_R	orn 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a0aa  ! 2649: SAVE_I	save	%r18, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 2652: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfe5e187  ! 2663: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5609c  ! 2666: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4a153  ! 2670: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4a0b6  ! 2673: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5e11d  ! 2674: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe4209f  ! 2678: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42160  ! 2679: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4e085  ! 2680: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7510000  ! 2685: RDPR_TICK	<illegal instruction>
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e08c  ! 2688: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56036  ! 2694: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e5a1b7  ! 2697: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	setx	data_start_0, %g1, %r22
	.word 0xb5e52067  ! 2703: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5a0ea  ! 2704: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4a082  ! 2706: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e197  ! 2710: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e52065  ! 2714: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde461a9  ! 2718: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5510000  ! 2722: RDPR_TICK	<illegal instruction>
	.word 0xbbe46106  ! 2724: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e5e167  ! 2729: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5a016  ! 2732: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e4e193  ! 2735: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5a1d8  ! 2736: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e560df  ! 2737: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0a1  ! 2740: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbb540000  ! 2741: RDPR_GL	<illegal instruction>
	.word 0xbbe4a1c6  ! 2746: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1518000  ! 2748: RDPR_PSTATE	<illegal instruction>
	.word 0xbde520c3  ! 2749: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e42069  ! 2750: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5e1c3  ! 2754: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c81  ! 2755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c81, %hpstate
	setx	data_start_3, %g1, %r18
	setx	0x1030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 2764: RDPR_GL	<illegal instruction>
	.word 0xb5e42128  ! 2768: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb350c000  ! 2776: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xbde42014  ! 2779: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r21
	.word 0xb3504000  ! 2783: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 2787: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5e038  ! 2788: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb951c000  ! 2791: RDPR_TL	<illegal instruction>
	.word 0x879460dd  ! 2792: WRPR_TT_I	wrpr	%r17, 0x00dd, %tt
	.word 0xbde42111  ! 2793: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e460d0  ! 2794: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e521ee  ! 2796: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e420f2  ! 2798: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5614b  ! 2800: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5610e  ! 2801: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb825610b  ! 2802: SUB_I	sub 	%r21, 0x010b, %r28
	.word 0xb7e4e188  ! 2805: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5a181  ! 2809: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb551c000  ! 2812: RDPR_TL	<illegal instruction>
	.word 0x919460d5  ! 2815: WRPR_PIL_I	wrpr	%r17, 0x00d5, %pil
	.word 0x8994e183  ! 2816: WRPR_TICK_I	wrpr	%r19, 0x0183, %tick
	.word 0xbfe5a12d  ! 2817: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 2820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xb7e5a16a  ! 2821: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5a1bb  ! 2823: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5508000  ! 2826: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe52072  ! 2827: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 2835: RDPR_TNPC	<illegal instruction>
	.word 0xbfe42153  ! 2836: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e5a061  ! 2841: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5e118  ! 2844: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a107  ! 2846: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe4a1cb  ! 2849: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8d95a11b  ! 2852: WRPR_PSTATE_I	wrpr	%r22, 0x011b, %pstate
	.word 0x8994a1a5  ! 2853: WRPR_TICK_I	wrpr	%r18, 0x01a5, %tick
	.word 0xb7e5e1a3  ! 2854: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5e1ad  ! 2857: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e520f2  ! 2861: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe46055  ! 2863: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e4a1b1  ! 2866: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb550c000  ! 2867: RDPR_TT	<illegal instruction>
	.word 0xb7e5e1bc  ! 2871: SAVE_I	save	%r23, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 2875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb73c5000  ! 2881: SRAX_R	srax	%r17, %r0, %r27
	.word 0xbf7c8400  ! 2882: MOVR_R	movre	%r18, %r0, %r31
	.word 0xb5e4e16b  ! 2883: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbe04608e  ! 2885: ADD_I	add 	%r17, 0x008e, %r31
	.word 0xbb35a001  ! 2890: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xbde5e07c  ! 2894: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3508000  ! 2895: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5e0d2  ! 2896: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e521c7  ! 2898: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5a0c6  ! 2899: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5e1b3  ! 2900: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x899420e5  ! 2905: WRPR_TICK_I	wrpr	%r16, 0x00e5, %tick
	.word 0xb3e4215e  ! 2907: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x9194205f  ! 2908: WRPR_PIL_I	wrpr	%r16, 0x005f, %pil
	.word 0xbde520f2  ! 2909: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3500000  ! 2910: RDPR_TPC	<illegal instruction>
	.word 0xb1e4a1dd  ! 2911: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5206f  ! 2915: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe4a0f8  ! 2916: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe421fd  ! 2917: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	.word 0xbfe5a00f  ! 2929: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e56095  ! 2933: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb03c4000  ! 2937: XNOR_R	xnor 	%r17, %r0, %r24
	setx	data_start_7, %g1, %r23
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	.word 0xb33c6001  ! 2941: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0x83946168  ! 2947: WRPR_TNPC_I	wrpr	%r17, 0x0168, %tnpc
	.word 0xb53d8000  ! 2948: SRA_R	sra 	%r22, %r0, %r26
	mov	0, %r14
	.word 0xa193a000  ! 2953: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2959: RDPR_GL	<illegal instruction>
	.word 0xb1510000  ! 2960: RDPR_TICK	<illegal instruction>
	.word 0xbde4a06c  ! 2961: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5510000  ! 2962: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a1e1  ! 2963: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb550c000  ! 2964: RDPR_TT	<illegal instruction>
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde520b7  ! 2968: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4a059  ! 2970: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbec5617e  ! 2971: ADDCcc_I	addccc 	%r21, 0x017e, %r31
	.word 0xb9e520ad  ! 2973: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e5a136  ! 2975: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9500000  ! 2977: RDPR_TPC	<illegal instruction>
	.word 0xbfe4a0bf  ! 2981: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e52042  ! 2982: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbe1ca17f  ! 2984: XOR_I	xor 	%r18, 0x017f, %r31
	.word 0xb3e42027  ! 2987: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e42186  ! 2990: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbb7c4400  ! 2992: MOVR_R	movre	%r17, %r0, %r29
	.word 0xbbe46120  ! 2994: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5217e  ! 2998: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e141  ! 3000: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1b1  ! 3005: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4e092  ! 3006: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbac560ed  ! 3007: ADDCcc_I	addccc 	%r21, 0x00ed, %r29
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 3009: RDPR_TICK	<illegal instruction>
	.word 0xb1e5a1c6  ! 3016: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb42ca0dd  ! 3019: ANDN_I	andn 	%r18, 0x00dd, %r26
	.word 0xb5e42109  ! 3021: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x85952104  ! 3022: WRPR_TSTATE_I	wrpr	%r20, 0x0104, %tstate
	.word 0xbde4a059  ! 3023: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe5e1ec  ! 3024: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5607e  ! 3029: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a05f  ! 3033: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e10f  ! 3036: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e46137  ! 3037: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4a0ee  ! 3047: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5480000  ! 3051: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x919561be  ! 3055: WRPR_PIL_I	wrpr	%r21, 0x01be, %pil
	.word 0xbde460f9  ! 3057: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8d956054  ! 3058: WRPR_PSTATE_I	wrpr	%r21, 0x0054, %pstate
	.word 0xb0242063  ! 3062: SUB_I	sub 	%r16, 0x0063, %r24
	setx	0x10219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 3066: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbe4e17c  ! 3070: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5a0dc  ! 3073: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe421f9  ! 3077: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5e061  ! 3078: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e5a178  ! 3080: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd520000  ! 3085: RDPR_PIL	<illegal instruction>
	.word 0x8194e101  ! 3089: WRPR_TPC_I	wrpr	%r19, 0x0101, %tpc
	.word 0xb5e5a12c  ! 3095: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x919561b0  ! 3098: WRPR_PIL_I	wrpr	%r21, 0x01b0, %pil
	.word 0xbfe56006  ! 3103: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5a1ff  ! 3110: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e56057  ! 3112: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x2001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1c4  ! 3123: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe56080  ! 3124: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5a116  ! 3127: SAVE_I	save	%r22, 0x0001, %r26
	setx	data_start_3, %g1, %r18
	.word 0xbf518000  ! 3130: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e4e050  ! 3131: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983903  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1903, %hpstate
	.word 0xbb540000  ! 3135: RDPR_GL	<illegal instruction>
	.word 0xbbe56195  ! 3137: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5a1ba  ! 3140: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5a06e  ! 3142: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4e156  ! 3147: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4e0f0  ! 3148: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a11f  ! 3151: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4603a  ! 3154: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf51c000  ! 3156: RDPR_TL	<illegal instruction>
	.word 0xb9480000  ! 3157: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5e5206e  ! 3158: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e561a1  ! 3160: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5207d  ! 3166: SAVE_I	save	%r20, 0x0001, %r27
	mov	1, %r12
	.word 0x8f932000  ! 3168: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e4a131  ! 3169: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d9521c2  ! 3170: WRPR_PSTATE_I	wrpr	%r20, 0x01c2, %pstate
	.word 0xb4352158  ! 3177: SUBC_I	orn 	%r20, 0x0158, %r26
	.word 0xbbe4a19a  ! 3178: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1504000  ! 3179: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983889  ! 3181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1889, %hpstate
	.word 0xb1504000  ! 3183: RDPR_TNPC	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xb7504000  ! 3198: RDPR_TNPC	<illegal instruction>
	.word 0xb5e56137  ! 3202: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a133  ! 3204: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf3d8000  ! 3205: SRA_R	sra 	%r22, %r0, %r31
	.word 0xb7e5613b  ! 3210: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xbde421d3  ! 3214: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5a12a  ! 3215: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b44000  ! 3221: ORNcc_R	orncc 	%r17, %r0, %r25
	.word 0xb3e420ab  ! 3224: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbaac0000  ! 3226: ANDNcc_R	andncc 	%r16, %r0, %r29
	setx	0x10020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0ce  ! 3229: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_5, %g1, %r23
	.word 0xbde4a166  ! 3238: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1510000  ! 3242: RDPR_TICK	<illegal instruction>
	.word 0xb7347001  ! 3243: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xbfe46178  ! 3245: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e4a189  ! 3246: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7480000  ! 3247: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9e5e1c8  ! 3248: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e52131  ! 3261: SAVE_I	save	%r20, 0x0001, %r24
	mov	2, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7e5a05d  ! 3263: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5a113  ! 3265: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e4a01d  ! 3266: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5e0d4  ! 3267: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9510000  ! 3270: RDPR_TICK	<illegal instruction>
	.word 0xb6acc000  ! 3272: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xb1e4a0c0  ! 3279: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e421f8  ! 3281: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4612f  ! 3294: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb61ce11a  ! 3297: XOR_I	xor 	%r19, 0x011a, %r27
	.word 0xbfe4605a  ! 3300: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e421ff  ! 3304: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5a13e  ! 3305: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5a1be  ! 3307: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a17d  ! 3316: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe42188  ! 3321: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb0c5a060  ! 3323: ADDCcc_I	addccc 	%r22, 0x0060, %r24
	.word 0xbfe4e1f9  ! 3324: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4e085  ! 3325: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb48d61bf  ! 3326: ANDcc_I	andcc 	%r21, 0x01bf, %r26
	setx	data_start_0, %g1, %r23
	.word 0xba05c000  ! 3328: ADD_R	add 	%r23, %r0, %r29
	.word 0xb5e5e1ae  ! 3331: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb8bc61bd  ! 3335: XNORcc_I	xnorcc 	%r17, 0x01bd, %r28
	.word 0xb7e4e0fd  ! 3339: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e46158  ! 3341: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5a053  ! 3342: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb350c000  ! 3344: RDPR_TT	<illegal instruction>
	.word 0xb1e56017  ! 3351: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xba158000  ! 3352: OR_R	or 	%r22, %r0, %r29
	.word 0xbfe46162  ! 3355: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e42008  ! 3356: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x10330, %g1, %o0
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
	.word 0xb5e5e166  ! 3363: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4611b  ! 3369: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8795606c  ! 3372: WRPR_TT_I	wrpr	%r21, 0x006c, %tt
	.word 0xb3e4a103  ! 3377: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde5a083  ! 3380: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbf520000  ! 3384: RDPR_PIL	<illegal instruction>
	.word 0xbf508000  ! 3385: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4e100  ! 3386: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb551c000  ! 3388: RDPR_TL	<illegal instruction>
	.word 0xb83420e5  ! 3389: SUBC_I	orn 	%r16, 0x00e5, %r28
	.word 0xb3e4e0bc  ! 3390: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e561c4  ! 3392: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1fd  ! 3398: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e4a0e4  ! 3399: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8395e009  ! 3402: WRPR_TNPC_I	wrpr	%r23, 0x0009, %tnpc
	.word 0xb2b520c2  ! 3406: ORNcc_I	orncc 	%r20, 0x00c2, %r25
	.word 0xbde4e00e  ! 3410: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5a047  ! 3411: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde521cc  ! 3415: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe46018  ! 3416: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_2, %g1, %r16
	.word 0xb734e001  ! 3421: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xbde420a7  ! 3423: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb551c000  ! 3424: RDPR_TL	<illegal instruction>
	.word 0xb9e5e155  ! 3426: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5a143  ! 3429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4e0ab  ! 3432: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde42173  ! 3435: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe52164  ! 3437: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4e110  ! 3444: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a07f  ! 3447: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbd641800  ! 3448: MOVcc_R	<illegal instruction>
	setx	data_start_0, %g1, %r22
	.word 0xbfe5a14f  ! 3455: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983a5b  ! 3456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5b, %hpstate
	.word 0xbde4a0e2  ! 3463: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x839421b1  ! 3465: WRPR_TNPC_I	wrpr	%r16, 0x01b1, %tnpc
	.word 0xb7504000  ! 3469: RDPR_TNPC	<illegal instruction>
	.word 0xbbe561b9  ! 3473: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4603a  ! 3475: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5212f  ! 3478: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde460fc  ! 3481: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde421da  ! 3482: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xb3508000  ! 3490: RDPR_TSTATE	<illegal instruction>
	.word 0x819461a2  ! 3491: WRPR_TPC_I	wrpr	%r17, 0x01a2, %tpc
	.word 0xb1e421e7  ! 3494: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe4210e  ! 3499: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e5605c  ! 3500: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e461dc  ! 3503: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e8b  ! 3505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	.word 0xb6bc6022  ! 3506: XNORcc_I	xnorcc 	%r17, 0x0022, %r27
	.word 0xb7e4e0e4  ! 3508: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde420e7  ! 3509: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5e091  ! 3510: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbb504000  ! 3512: RDPR_TNPC	<illegal instruction>
	.word 0xb3e46073  ! 3514: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5508000  ! 3517: RDPR_TSTATE	<illegal instruction>
	.word 0xbebc4000  ! 3520: XNORcc_R	xnorcc 	%r17, %r0, %r31
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3538: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 3539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a063  ! 3542: SAVE_I	save	%r18, 0x0001, %r29
	mov	1, %r12
	.word 0x8f932000  ! 3544: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe5208d  ! 3545: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf518000  ! 3547: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde56078  ! 3558: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4605e  ! 3565: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5e198  ! 3567: SAVE_I	save	%r23, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 3569: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5e461fb  ! 3574: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4a14f  ! 3577: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 3578: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde5e079  ! 3580: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbeb5602f  ! 3583: SUBCcc_I	orncc 	%r21, 0x002f, %r31
	.word 0x8d94e039  ! 3584: WRPR_PSTATE_I	wrpr	%r19, 0x0039, %pstate
	.word 0xbea460f4  ! 3587: SUBcc_I	subcc 	%r17, 0x00f4, %r31
	.word 0xb9e56154  ! 3588: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 3591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0xb5e5e17e  ! 3593: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb93ce001  ! 3595: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xbe84c000  ! 3596: ADDcc_R	addcc 	%r19, %r0, %r31
	.word 0xb7e560d2  ! 3597: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7518000  ! 3598: RDPR_PSTATE	<illegal instruction>
	.word 0xb3500000  ! 3600: RDPR_TPC	<illegal instruction>
	.word 0xbbe4a0c4  ! 3602: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e5a1d4  ! 3610: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb510000  ! 3615: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3616: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a10f  ! 3626: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x859461bf  ! 3627: WRPR_TSTATE_I	wrpr	%r17, 0x01bf, %tstate
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e521bf  ! 3629: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4a14a  ! 3631: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e56111  ! 3634: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb57d6401  ! 3638: MOVR_I	movre	%r21, 0x1, %r26
	.word 0xb9e5e196  ! 3639: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbabd613a  ! 3640: XNORcc_I	xnorcc 	%r21, 0x013a, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5e01b  ! 3643: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5a05e  ! 3644: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 3648: RDPR_TL	<illegal instruction>
	.word 0xb1e461b8  ! 3652: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5a051  ! 3654: SAVE_I	save	%r22, 0x0001, %r29
	mov	0, %r14
	.word 0xa193a000  ! 3655: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc94a0ee  ! 3658: ORcc_I	orcc 	%r18, 0x00ee, %r30
	.word 0x9194e119  ! 3664: WRPR_PIL_I	wrpr	%r19, 0x0119, %pil
	.word 0xbfe5a070  ! 3665: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8d94e1e9  ! 3671: WRPR_PSTATE_I	wrpr	%r19, 0x01e9, %pstate
	mov	1, %r12
	.word 0x8f932000  ! 3673: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf518000  ! 3680: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e561fa  ! 3686: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbf50c000  ! 3692: RDPR_TT	<illegal instruction>
	.word 0xbc15e03f  ! 3693: OR_I	or 	%r23, 0x003f, %r30
	.word 0xb5e5a168  ! 3699: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe5e0dd  ! 3701: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e42050  ! 3702: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5e046  ! 3703: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983f13  ! 3707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f13, %hpstate
	.word 0xb6b48000  ! 3713: SUBCcc_R	orncc 	%r18, %r0, %r27
	setx	0x20014, %g1, %o0
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
	.word 0xb7e460db  ! 3717: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5510000  ! 3719: RDPR_TICK	<illegal instruction>
	.word 0xb9e5e169  ! 3720: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e560ae  ! 3722: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 3725: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbbe5618d  ! 3728: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e0fb  ! 3735: WRPR_TSTATE_I	wrpr	%r19, 0x00fb, %tstate
	.word 0xb9540000  ! 3739: RDPR_GL	<illegal instruction>
	.word 0xb884e164  ! 3741: ADDcc_I	addcc 	%r19, 0x0164, %r28
	.word 0xb9e5a021  ! 3743: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb48d8000  ! 3745: ANDcc_R	andcc 	%r22, %r0, %r26
	.word 0xbbe5a1b3  ! 3749: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a13f  ! 3751: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8995216f  ! 3752: WRPR_TICK_I	wrpr	%r20, 0x016f, %tick
	.word 0xb7508000  ! 3754: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e072  ! 3755: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4215c  ! 3761: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe4e1da  ! 3762: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4a02e  ! 3763: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 3766: RDPR_PIL	<illegal instruction>
	.word 0xbb50c000  ! 3767: RDPR_TT	<illegal instruction>
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4618e  ! 3769: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4a0f8  ! 3770: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e52068  ! 3774: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a114  ! 3776: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_1, %g1, %r18
	.word 0xbd518000  ! 3782: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5e057  ! 3783: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4209e  ! 3790: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e460f4  ! 3791: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb8a50000  ! 3792: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xbfe4e03a  ! 3793: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4e024  ! 3799: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e521b6  ! 3806: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e5e19e  ! 3807: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x2003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a03f  ! 3814: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x819839d1  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d1, %hpstate
	.word 0xbbe5e093  ! 3819: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7480000  ! 3823: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbde46075  ! 3824: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_0, %g1, %r16
	.word 0xb9e4a1f1  ! 3828: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe52073  ! 3829: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8d95a00f  ! 3830: WRPR_PSTATE_I	wrpr	%r22, 0x000f, %pstate
	.word 0xbbe5e19f  ! 3831: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3480000  ! 3833: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1540000  ! 3835: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 3838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	.word 0x8395a14d  ! 3843: WRPR_TNPC_I	wrpr	%r22, 0x014d, %tnpc
	.word 0x8795e081  ! 3844: WRPR_TT_I	wrpr	%r23, 0x0081, %tt
	.word 0xb7e4a16a  ! 3847: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf50c000  ! 3851: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 3857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xbfe4a1ba  ! 3858: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5e041  ! 3860: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbebd0000  ! 3861: XNORcc_R	xnorcc 	%r20, %r0, %r31
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e13a  ! 3866: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf50c000  ! 3867: RDPR_TT	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8594e033  ! 3874: WRPR_TSTATE_I	wrpr	%r19, 0x0033, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 3878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0xb7e5e1fd  ! 3879: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e46028  ! 3886: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe52094  ! 3892: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xbfe4e028  ! 3894: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd3c0000  ! 3895: SRA_R	sra 	%r16, %r0, %r30
	.word 0xbde46155  ! 3898: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 3900: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e171  ! 3905: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9504000  ! 3908: RDPR_TNPC	<illegal instruction>
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a02e  ! 3916: WRPR_TICK_I	wrpr	%r22, 0x002e, %tick
	.word 0xb1e4e19c  ! 3919: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e174  ! 3929: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4a00c  ! 3930: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4a0f0  ! 3931: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe521c7  ! 3933: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb00461aa  ! 3936: ADD_I	add 	%r17, 0x01aa, %r24
	.word 0xbde46108  ! 3939: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5a10d  ! 3940: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde460eb  ! 3943: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e1e4  ! 3945: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e15e  ! 3948: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e421b7  ! 3951: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e46016  ! 3957: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbc142021  ! 3960: OR_I	or 	%r16, 0x0021, %r30
	.word 0xb7e4e1f7  ! 3963: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x30209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 3966: RDPR_TNPC	<illegal instruction>
	.word 0xb1e56127  ! 3967: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5a01c  ! 3968: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x81942037  ! 3971: WRPR_TPC_I	wrpr	%r16, 0x0037, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982ed9  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed9, %hpstate
	.word 0xb9e521b4  ! 3977: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e4608d  ! 3978: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8194e187  ! 3979: WRPR_TPC_I	wrpr	%r19, 0x0187, %tpc
	.word 0xbfe42072  ! 3980: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb20de103  ! 3981: AND_I	and 	%r23, 0x0103, %r25
	.word 0xbfe520c9  ! 3983: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e121  ! 3984: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb2b4e130  ! 3985: SUBCcc_I	orncc 	%r19, 0x0130, %r25
	.word 0x91952100  ! 3987: WRPR_PIL_I	wrpr	%r20, 0x0100, %pil
	.word 0x8595e157  ! 3988: WRPR_TSTATE_I	wrpr	%r23, 0x0157, %tstate
	.word 0xbb50c000  ! 3994: RDPR_TT	<illegal instruction>
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 4000: MOVcc_I	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xb8bd4000  ! 4004: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb5e5a01c  ! 4011: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a048  ! 4013: WRPR_TPC_I	wrpr	%r18, 0x0048, %tpc
	.word 0x839460ef  ! 4019: WRPR_TNPC_I	wrpr	%r17, 0x00ef, %tnpc
	.word 0xb7500000  ! 4020: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 4023: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5e1a7  ! 4026: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_3, %g1, %r19
	.word 0xb7e4a0ff  ! 4029: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb92d6001  ! 4031: SLL_I	sll 	%r21, 0x0001, %r28
	setx	0x20126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a01c  ! 4036: WRPR_TNPC_I	wrpr	%r22, 0x001c, %tnpc
	setx	0x223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 4038: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e461b8  ! 4039: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e42124  ! 4041: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4206a  ! 4043: SAVE_I	save	%r16, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 4045: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5a197  ! 4048: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e46075  ! 4053: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb735b001  ! 4054: SRLX_I	srlx	%r22, 0x0001, %r27
	.word 0xb950c000  ! 4055: RDPR_TT	<illegal instruction>
	.word 0xba04e046  ! 4056: ADD_I	add 	%r19, 0x0046, %r29
	.word 0xb7510000  ! 4057: RDPR_TICK	<illegal instruction>
	.word 0xb435e175  ! 4058: ORN_I	orn 	%r23, 0x0175, %r26
	.word 0xb494e19f  ! 4065: ORcc_I	orcc 	%r19, 0x019f, %r26
	.word 0xbfe5619a  ! 4066: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4e0a4  ! 4067: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb435a0ce  ! 4069: SUBC_I	orn 	%r22, 0x00ce, %r26
	setx	data_start_0, %g1, %r21
	.word 0xb9e4e01c  ! 4072: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	setx	0x20016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4609e  ! 4080: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e175  ! 4082: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5613a  ! 4087: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8595a0ab  ! 4089: WRPR_TSTATE_I	wrpr	%r22, 0x00ab, %tstate
	.word 0xb150c000  ! 4091: RDPR_TT	<illegal instruction>
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e031  ! 4105: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb3d9000  ! 4106: SRAX_R	srax	%r22, %r0, %r29
	.word 0x85956052  ! 4108: WRPR_TSTATE_I	wrpr	%r21, 0x0052, %tstate
	.word 0x83952046  ! 4109: WRPR_TNPC_I	wrpr	%r20, 0x0046, %tnpc
	.word 0xb7500000  ! 4112: RDPR_TPC	<illegal instruction>
	.word 0xbfe4a018  ! 4113: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe4a138  ! 4119: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbf50c000  ! 4124: RDPR_TT	<illegal instruction>
	.word 0xbd518000  ! 4127: RDPR_PSTATE	<illegal instruction>
	.word 0x8394e010  ! 4128: WRPR_TNPC_I	wrpr	%r19, 0x0010, %tnpc
	.word 0xbac5a11b  ! 4130: ADDCcc_I	addccc 	%r22, 0x011b, %r29
	.word 0xbbe421c6  ! 4131: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e00f  ! 4142: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbd500000  ! 4144: RDPR_TPC	<illegal instruction>
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e460f1  ! 4148: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x899521c1  ! 4149: WRPR_TICK_I	wrpr	%r20, 0x01c1, %tick
	.word 0xb5480000  ! 4152: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_0, %g1, %r16
	.word 0xb635c000  ! 4161: SUBC_R	orn 	%r23, %r0, %r27
	.word 0xb7e5e070  ! 4164: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb68dc000  ! 4166: ANDcc_R	andcc 	%r23, %r0, %r27
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 4174: RDPR_TICK	<illegal instruction>
	setx	0x332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a10c  ! 4178: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0a4  ! 4183: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe4215e  ! 4185: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb80d4000  ! 4186: AND_R	and 	%r21, %r0, %r28
	.word 0x8d94a00c  ! 4190: WRPR_PSTATE_I	wrpr	%r18, 0x000c, %pstate
	.word 0xbfe5e1ec  ! 4192: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4a0f4  ! 4194: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe52141  ! 4196: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf508000  ! 4198: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e460a4  ! 4200: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb09d60b8  ! 4215: XORcc_I	xorcc 	%r21, 0x00b8, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983a09  ! 4216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a09, %hpstate
	.word 0xb7e4211c  ! 4219: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3500000  ! 4222: RDPR_TPC	<illegal instruction>
	.word 0xb7e520e8  ! 4223: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 4225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xb9e46028  ! 4229: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_3, %g1, %r17
	.word 0xbde5e18b  ! 4231: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e461b4  ! 4233: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5e048  ! 4234: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	.word 0xbde5e001  ! 4238: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde56093  ! 4239: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5e055  ! 4243: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4a0d3  ! 4245: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e12f  ! 4247: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5a1dd  ! 4251: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbe9c8000  ! 4252: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xbb643801  ! 4253: MOVcc_I	<illegal instruction>
	.word 0x8994206d  ! 4255: WRPR_TICK_I	wrpr	%r16, 0x006d, %tick
	.word 0xbbe56146  ! 4256: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7510000  ! 4258: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a1ec  ! 4259: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb2148000  ! 4261: OR_R	or 	%r18, %r0, %r25
	setx	data_start_3, %g1, %r23
	.word 0xb3e52124  ! 4267: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e5e13a  ! 4269: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e4200d  ! 4272: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e56179  ! 4273: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a05e  ! 4274: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8594618f  ! 4277: WRPR_TSTATE_I	wrpr	%r17, 0x018f, %tstate
	.word 0x8794208c  ! 4281: WRPR_TT_I	wrpr	%r16, 0x008c, %tt
	.word 0xbf51c000  ! 4282: RDPR_TL	<illegal instruction>
	.word 0xb7e4a191  ! 4283: SAVE_I	save	%r18, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 4285: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e4a125  ! 4287: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb97ca401  ! 4288: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xb7e5e1a0  ! 4291: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb17da401  ! 4295: MOVR_I	movre	%r22, 0x1, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982bd9  ! 4296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd9, %hpstate
	.word 0xbfe42037  ! 4298: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5353001  ! 4301: SRLX_I	srlx	%r20, 0x0001, %r26
	mov	0, %r14
	.word 0xa193a000  ! 4302: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e04c  ! 4304: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4607e  ! 4312: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e003  ! 4315: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5a12e  ! 4317: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe5a1a2  ! 4320: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xbb510000  ! 4322: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e047  ! 4326: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3510000  ! 4329: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a063  ! 4333: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd51c000  ! 4337: RDPR_TL	<illegal instruction>
	.word 0xb7e42000  ! 4339: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e42063  ! 4345: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 4346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899461a6  ! 4352: WRPR_TICK_I	wrpr	%r17, 0x01a6, %tick
	.word 0xbfe4e150  ! 4356: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe46041  ! 4357: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf510000  ! 4358: RDPR_TICK	<illegal instruction>
	.word 0xb2bd6020  ! 4359: XNORcc_I	xnorcc 	%r21, 0x0020, %r25
	.word 0xb284a0c7  ! 4365: ADDcc_I	addcc 	%r18, 0x00c7, %r25
	.word 0xba9d61b8  ! 4367: XORcc_I	xorcc 	%r21, 0x01b8, %r29
	.word 0x87956075  ! 4368: WRPR_TT_I	wrpr	%r21, 0x0075, %tt
	.word 0xb5e42082  ! 4369: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9520000  ! 4371: RDPR_PIL	<illegal instruction>
	.word 0x8d94a151  ! 4372: WRPR_PSTATE_I	wrpr	%r18, 0x0151, %pstate
	.word 0xb7510000  ! 4377: RDPR_TICK	<illegal instruction>
	.word 0xb3e4602a  ! 4378: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde4e062  ! 4380: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e421b8  ! 4384: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5e022  ! 4390: SAVE_I	save	%r23, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 4391: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e460dd  ! 4394: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5a074  ! 4395: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e52165  ! 4396: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_6, %g1, %r23
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a01d  ! 4400: WRPR_PIL_I	wrpr	%r18, 0x001d, %pil
	.word 0x9195217f  ! 4402: WRPR_PIL_I	wrpr	%r20, 0x017f, %pil
	.word 0xb7355000  ! 4405: SRLX_R	srlx	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	setx	data_start_7, %g1, %r22
	.word 0xb1e4e007  ! 4411: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983b91  ! 4413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b91, %hpstate
	.word 0xb151c000  ! 4418: RDPR_TL	<illegal instruction>
	.word 0x8394a125  ! 4419: WRPR_TNPC_I	wrpr	%r18, 0x0125, %tnpc
	.word 0xbb540000  ! 4421: RDPR_GL	<illegal instruction>
	.word 0xba8461ea  ! 4424: ADDcc_I	addcc 	%r17, 0x01ea, %r29
	.word 0xb3e46091  ! 4427: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4617b  ! 4429: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4a05a  ! 4433: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x87956111  ! 4435: WRPR_TT_I	wrpr	%r21, 0x0111, %tt
	.word 0xb7e420fc  ! 4436: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e4e055  ! 4437: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe520c8  ! 4438: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983b4b  ! 4439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4b, %hpstate
	.word 0xb3540000  ! 4441: RDPR_GL	<illegal instruction>
	.word 0xb351c000  ! 4446: RDPR_TL	<illegal instruction>
	.word 0x8d94e00a  ! 4449: WRPR_PSTATE_I	wrpr	%r19, 0x000a, %pstate
	setx	data_start_0, %g1, %r23
	.word 0xb3359000  ! 4453: SRLX_R	srlx	%r22, %r0, %r25
	mov	2, %r12
	.word 0x8f932000  ! 4454: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x8198298b  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0xbde5216c  ! 4463: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5e024  ! 4464: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb350c000  ! 4469: RDPR_TT	<illegal instruction>
	.word 0x8994a040  ! 4471: WRPR_TICK_I	wrpr	%r18, 0x0040, %tick
	.word 0xb9e421d2  ! 4472: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbf50c000  ! 4476: RDPR_TT	<illegal instruction>
	.word 0xbde4e036  ! 4477: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x859561f8  ! 4479: WRPR_TSTATE_I	wrpr	%r21, 0x01f8, %tstate
	.word 0xb3e521bf  ! 4481: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde4e1d3  ! 4482: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e421f4  ! 4483: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e46175  ! 4487: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e461da  ! 4493: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4617e  ! 4497: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4e0c3  ! 4499: SAVE_I	save	%r19, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3e5e0be  ! 4503: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5a1f0  ! 4504: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_4, %g1, %r19
	.word 0xb3508000  ! 4507: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4e138  ! 4511: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e460c6  ! 4512: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe520aa  ! 4514: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_7, %g1, %r18
	.word 0xbd508000  ! 4520: RDPR_TSTATE	<illegal instruction>
	.word 0xb1540000  ! 4521: RDPR_GL	<illegal instruction>
	.word 0xb550c000  ! 4522: RDPR_TT	<illegal instruction>
	setx	data_start_2, %g1, %r16
	.word 0xb085200d  ! 4527: ADDcc_I	addcc 	%r20, 0x000d, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a129  ! 4531: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e1e3  ! 4532: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8394a154  ! 4534: WRPR_TNPC_I	wrpr	%r18, 0x0154, %tnpc
	.word 0xb7480000  ! 4536: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3e4a0f2  ! 4539: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e5a0d4  ! 4540: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4a0d3  ! 4541: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5e036  ! 4544: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982c51  ! 4545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0xbb50c000  ! 4546: RDPR_TT	<illegal instruction>
	.word 0xb1e521e6  ! 4556: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5a07e  ! 4557: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8794617e  ! 4558: WRPR_TT_I	wrpr	%r17, 0x017e, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983a91  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a91, %hpstate
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1a2  ! 4565: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5619d  ! 4567: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbe158000  ! 4569: OR_R	or 	%r22, %r0, %r31
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba440000  ! 4572: ADDC_R	addc 	%r16, %r0, %r29
	setx	data_start_2, %g1, %r17
	.word 0xbbe56188  ! 4575: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983b0b  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0b, %hpstate
	.word 0xb3e5a125  ! 4580: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9540000  ! 4584: RDPR_GL	<illegal instruction>
	.word 0xb7e5214a  ! 4586: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe420be  ! 4587: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd500000  ! 4590: RDPR_TPC	<illegal instruction>
	setx	0x30328, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a01e  ! 4599: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb28ce111  ! 4601: ANDcc_I	andcc 	%r19, 0x0111, %r25
	.word 0xbbe52052  ! 4604: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5a062  ! 4609: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb950c000  ! 4618: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 4625: RDPR_TPC	<illegal instruction>
	.word 0xbde5a068  ! 4627: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1480000  ! 4640: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_5, %g1, %r21
	.word 0xb1e5e1ae  ! 4646: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4a04e  ! 4649: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e02c  ! 4650: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x91956016  ! 4653: WRPR_PIL_I	wrpr	%r21, 0x0016, %pil
	.word 0xb9e5e0c7  ! 4655: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e56032  ! 4656: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde4e183  ! 4657: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe52063  ! 4658: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbe3561a7  ! 4662: ORN_I	orn 	%r21, 0x01a7, %r31
	.word 0xb5e460ec  ! 4665: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbeb560a6  ! 4669: ORNcc_I	orncc 	%r21, 0x00a6, %r31
	.word 0xbd2d0000  ! 4671: SLL_R	sll 	%r20, %r0, %r30
	.word 0xbfe5a17b  ! 4672: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1508000  ! 4674: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 4676: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983f19  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f19, %hpstate
	.word 0xbbe52108  ! 4678: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb751c000  ! 4684: RDPR_TL	<illegal instruction>
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a170  ! 4687: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde46082  ! 4689: SAVE_I	save	%r17, 0x0001, %r30
	mov	2, %r12
	.word 0x8f932000  ! 4690: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e42073  ! 4692: SAVE_I	save	%r16, 0x0001, %r25
	setx	data_start_7, %g1, %r17
	mov	1, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3480000  ! 4698: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde4a19a  ! 4701: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde521e0  ! 4702: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e5a100  ! 4703: SAVE_I	save	%r22, 0x0001, %r26
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e0c8  ! 4705: WRPR_TNPC_I	wrpr	%r19, 0x00c8, %tnpc
	.word 0xbbe5e019  ! 4707: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb73d1000  ! 4708: SRAX_R	srax	%r20, %r0, %r27
	.word 0xb3e4a13c  ! 4712: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e46014  ! 4721: SAVE_I	save	%r17, 0x0001, %r27
	mov	0, %r14
	.word 0xa193a000  ! 4724: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9e42173  ! 4727: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe461ea  ! 4729: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8995209d  ! 4730: WRPR_TICK_I	wrpr	%r20, 0x009d, %tick
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4209d  ! 4732: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe521a3  ! 4733: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde561e4  ! 4734: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53cf001  ! 4739: SRAX_I	srax	%r19, 0x0001, %r26
	.word 0xbde4a024  ! 4741: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956083  ! 4746: WRPR_TNPC_I	wrpr	%r21, 0x0083, %tnpc
	.word 0x8395602d  ! 4749: WRPR_TNPC_I	wrpr	%r21, 0x002d, %tnpc
	.word 0xbfe5213c  ! 4753: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e5a185  ! 4755: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde421ff  ! 4761: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6042168  ! 4763: ADD_I	add 	%r16, 0x0168, %r27
	.word 0xb1e5e164  ! 4764: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5a002  ! 4765: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x81956056  ! 4768: WRPR_TPC_I	wrpr	%r21, 0x0056, %tpc
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb835e059  ! 4772: ORN_I	orn 	%r23, 0x0059, %r28
	.word 0xb5e460f5  ! 4773: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5a15a  ! 4774: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4e166  ! 4777: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e42123  ! 4782: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe4e113  ! 4792: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9508000  ! 4795: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e107  ! 4805: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e4e128  ! 4809: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbd508000  ! 4811: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5a15f  ! 4814: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb62420e1  ! 4816: SUB_I	sub 	%r16, 0x00e1, %r27
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4821: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe5e1c0  ! 4823: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91946138  ! 4827: WRPR_PIL_I	wrpr	%r17, 0x0138, %pil
	.word 0xbde56093  ! 4830: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1518000  ! 4831: RDPR_PSTATE	<illegal instruction>
	.word 0xbd643801  ! 4835: MOVcc_I	<illegal instruction>
	.word 0x8594e08e  ! 4836: WRPR_TSTATE_I	wrpr	%r19, 0x008e, %tstate
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	.word 0xbbe5e005  ! 4842: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf510000  ! 4844: RDPR_TICK	<illegal instruction>
	.word 0xb7e4a088  ! 4845: SAVE_I	save	%r18, 0x0001, %r27
	setx	data_start_5, %g1, %r17
	.word 0xbde520f9  ! 4848: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83956079  ! 4854: WRPR_TNPC_I	wrpr	%r21, 0x0079, %tnpc
	.word 0x839421da  ! 4857: WRPR_TNPC_I	wrpr	%r16, 0x01da, %tnpc
	.word 0xb7e5a12e  ! 4858: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795612f  ! 4860: WRPR_TT_I	wrpr	%r21, 0x012f, %tt
	setx	0x30009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4866: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a126  ! 4875: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_4, %g1, %r22
	.word 0xb9e4211e  ! 4880: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb480000  ! 4884: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982943  ! 4885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	.word 0xb3e461d8  ! 4887: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x81942129  ! 4891: WRPR_TPC_I	wrpr	%r16, 0x0129, %tpc
	.word 0xb20dc000  ! 4893: AND_R	and 	%r23, %r0, %r25
	.word 0xb73d5000  ! 4896: SRAX_R	srax	%r21, %r0, %r27
	.word 0xb805a1d7  ! 4897: ADD_I	add 	%r22, 0x01d7, %r28
	.word 0x8d95a1a7  ! 4899: WRPR_PSTATE_I	wrpr	%r22, 0x01a7, %pstate
	.word 0xbfe520b7  ! 4901: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e52139  ! 4904: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde56128  ! 4905: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5a02f  ! 4907: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf50c000  ! 4912: RDPR_TT	<illegal instruction>
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983fc3  ! 4917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc3, %hpstate
	.word 0xbfe5e1d5  ! 4923: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8995e1d8  ! 4925: WRPR_TICK_I	wrpr	%r23, 0x01d8, %tick
	.word 0xbfe5e189  ! 4928: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb500000  ! 4930: RDPR_TPC	<illegal instruction>
	.word 0xbfe5603a  ! 4932: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x20021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a174  ! 4934: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8994202c  ! 4944: WRPR_TICK_I	wrpr	%r16, 0x002c, %tick
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e52143  ! 4948: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5a16f  ! 4953: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb57ca401  ! 4956: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xbfe421c0  ! 4959: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7510000  ! 4962: RDPR_TICK	<illegal instruction>
	setx	0x128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1bd  ! 4964: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e04a  ! 4966: WRPR_TNPC_I	wrpr	%r19, 0x004a, %tnpc
	.word 0xb951c000  ! 4970: RDPR_TL	<illegal instruction>
	.word 0xb9518000  ! 4977: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e13a  ! 4984: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4a0c2  ! 4987: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4610d  ! 4990: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8395a177  ! 4991: WRPR_TNPC_I	wrpr	%r22, 0x0177, %tnpc
	.word 0xb1504000  ! 4993: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
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
	.word 0xfc754000  ! 1: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xbc858000  ! 3: ADDcc_R	addcc 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	.word 0xbcc4612c  ! 7: ADDCcc_I	addccc 	%r17, 0x012c, %r30
	.word 0xfa3c8000  ! 10: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf42cc000  ! 11: STB_R	stb	%r26, [%r19 + %r0]
	.word 0x8395e155  ! 13: WRPR_TNPC_I	wrpr	%r23, 0x0155, %tnpc
	.word 0xf62ce1e0  ! 14: STB_I	stb	%r27, [%r19 + 0x01e0]
	.word 0xb950c000  ! 15: RDPR_TT	rdpr	%tt, %r28
	.word 0xf22c8000  ! 17: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf2258000  ! 18: STW_R	stw	%r25, [%r22 + %r0]
	.word 0x8195a0b0  ! 20: WRPR_TPC_I	wrpr	%r22, 0x00b0, %tpc
	mov	1, %r12
	.word 0x8f932000  ! 22: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf034e140  ! 23: STH_I	sth	%r24, [%r19 + 0x0140]
	.word 0xb9520000  ! 24: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfe2d4000  ! 29: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf33c21fc  ! 32: STDF_I	std	%f25, [0x01fc, %r16]
	.word 0xb7500000  ! 33: RDPR_TPC	<illegal instruction>
	.word 0x8d942189  ! 39: WRPR_PSTATE_I	wrpr	%r16, 0x0189, %pstate
	.word 0xb804e17f  ! 40: ADD_I	add 	%r19, 0x017f, %r28
	setx	0x20119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22de05e  ! 46: STB_I	stb	%r25, [%r23 + 0x005e]
	.word 0xfe2c610a  ! 48: STB_I	stb	%r31, [%r17 + 0x010a]
	.word 0xf8748000  ! 49: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb68d616b  ! 50: ANDcc_I	andcc 	%r21, 0x016b, %r27
	.word 0xb5504000  ! 52: RDPR_TNPC	rdpr	%tnpc, %r26
	mov	1, %r14
	.word 0xa193a000  ! 53: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe25a0c3  ! 54: STW_I	stw	%r31, [%r22 + 0x00c3]
	.word 0xbe1ca1fc  ! 57: XOR_I	xor 	%r18, 0x01fc, %r31
	.word 0xf6740000  ! 60: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfe2d8000  ! 61: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf2246141  ! 62: STW_I	stw	%r25, [%r17 + 0x0141]
	.word 0x9195e13f  ! 64: WRPR_PIL_I	wrpr	%r23, 0x013f, %pil
	.word 0xf03d4000  ! 69: STD_R	std	%r24, [%r21 + %r0]
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899561c1  ! 73: WRPR_TICK_I	wrpr	%r21, 0x01c1, %tick
	.word 0xb3518000  ! 76: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf22c4000  ! 77: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xb1643801  ! 78: MOVcc_I	<illegal instruction>
	.word 0xf425a0d8  ! 79: STW_I	stw	%r26, [%r22 + 0x00d8]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf225e131  ! 82: STW_I	stw	%r25, [%r23 + 0x0131]
	.word 0xf03d60d6  ! 93: STD_I	std	%r24, [%r21 + 0x00d6]
	.word 0xf025a12b  ! 95: STW_I	stw	%r24, [%r22 + 0x012b]
	.word 0xfa3520f2  ! 97: STH_I	sth	%r29, [%r20 + 0x00f2]
	.word 0xb69dc000  ! 99: XORcc_R	xorcc 	%r23, %r0, %r27
	setx	0x2011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 106: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf434617c  ! 107: STH_I	sth	%r26, [%r17 + 0x017c]
	.word 0xb015c000  ! 111: OR_R	or 	%r23, %r0, %r24
	.word 0xf875c000  ! 112: STX_R	stx	%r28, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	.word 0x8198388b  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a51  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a51, %hpstate
	.word 0x8394616d  ! 128: WRPR_TNPC_I	wrpr	%r17, 0x016d, %tnpc
	.word 0xf83ca0d5  ! 129: STD_I	std	%r28, [%r18 + 0x00d5]
	.word 0xfc3da0aa  ! 130: STD_I	std	%r30, [%r22 + 0x00aa]
	.word 0xf0244000  ! 131: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf2742103  ! 134: STX_I	stx	%r25, [%r16 + 0x0103]
	.word 0x859461d8  ! 139: WRPR_TSTATE_I	wrpr	%r17, 0x01d8, %tstate
	.word 0xb62c0000  ! 140: ANDN_R	andn 	%r16, %r0, %r27
	.word 0x899560e8  ! 141: WRPR_TICK_I	wrpr	%r21, 0x00e8, %tick
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994210b  ! 147: WRPR_TICK_I	wrpr	%r16, 0x010b, %tick
	.word 0xfc75c000  ! 148: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb4c48000  ! 150: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xf6240000  ! 151: STW_R	stw	%r27, [%r16 + %r0]
	.word 0x839561d2  ! 152: WRPR_TNPC_I	wrpr	%r21, 0x01d2, %tnpc
	.word 0xfc3561e6  ! 153: STH_I	sth	%r30, [%r21 + 0x01e6]
	.word 0xfc348000  ! 156: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf82c0000  ! 157: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf02d4000  ! 165: STB_R	stb	%r24, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 166: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8248000  ! 167: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x919520d7  ! 169: WRPR_PIL_I	wrpr	%r20, 0x00d7, %pil
	.word 0x8994a0a8  ! 174: WRPR_TICK_I	wrpr	%r18, 0x00a8, %tick
	.word 0x8994e0a1  ! 179: WRPR_TICK_I	wrpr	%r19, 0x00a1, %tick
	setx	0x30232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf434e0d8  ! 184: STH_I	sth	%r26, [%r19 + 0x00d8]
	.word 0xfa3c61e5  ! 187: STD_I	std	%r29, [%r17 + 0x01e5]
	setx	0x1001f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d6171  ! 190: STD_I	std	%r30, [%r21 + 0x0171]
	.word 0xf674e110  ! 191: STX_I	stx	%r27, [%r19 + 0x0110]
	.word 0xf234a023  ! 192: STH_I	sth	%r25, [%r18 + 0x0023]
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952154  ! 199: WRPR_TPC_I	wrpr	%r20, 0x0154, %tpc
	.word 0xf63560ac  ! 200: STH_I	sth	%r27, [%r21 + 0x00ac]
	.word 0xf33d4000  ! 202: STDF_R	std	%f25, [%r0, %r21]
	.word 0x91946027  ! 204: WRPR_PIL_I	wrpr	%r17, 0x0027, %pil
	.word 0xf62cc000  ! 206: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xb550c000  ! 207: RDPR_TT	rdpr	%tt, %r26
	.word 0xf42dc000  ! 213: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfd3de1fa  ! 214: STDF_I	std	%f30, [0x01fa, %r23]
	.word 0xf4758000  ! 218: STX_R	stx	%r26, [%r22 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb13ce001  ! 225: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xfe3da1dd  ! 226: STD_I	std	%r31, [%r22 + 0x01dd]
	.word 0x8994608e  ! 227: WRPR_TICK_I	wrpr	%r17, 0x008e, %tick
	.word 0xb9510000  ! 228: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfd3dc000  ! 230: STDF_R	std	%f30, [%r0, %r23]
	.word 0xb5480000  ! 234: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf03d8000  ! 236: STD_R	std	%r24, [%r22 + %r0]
	.word 0xf035a1ec  ! 238: STH_I	sth	%r24, [%r22 + 0x01ec]
	.word 0xb0ade001  ! 239: ANDNcc_I	andncc 	%r23, 0x0001, %r24
	.word 0xf234a06f  ! 241: STH_I	sth	%r25, [%r18 + 0x006f]
	.word 0xbd51c000  ! 243: RDPR_TL	rdpr	%tl, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe3da042  ! 246: STD_I	std	%r31, [%r22 + 0x0042]
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 250: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf625a0de  ! 253: STW_I	stw	%r27, [%r22 + 0x00de]
	.word 0xf0348000  ! 255: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf93c61cd  ! 258: STDF_I	std	%f28, [0x01cd, %r17]
	.word 0xfe3d4000  ! 259: STD_R	std	%r31, [%r21 + %r0]
	.word 0xbf518000  ! 261: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb2858000  ! 263: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xbe350000  ! 267: SUBC_R	orn 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983cd3  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
	.word 0xb9520000  ! 277: RDPR_PIL	rdpr	%pil, %r28
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 285: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb5504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xfb3d0000  ! 287: STDF_R	std	%f29, [%r0, %r20]
	.word 0xb3508000  ! 290: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0a560ef  ! 299: SUBcc_I	subcc 	%r21, 0x00ef, %r24
	.word 0xb7508000  ! 300: RDPR_TSTATE	<illegal instruction>
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0252180  ! 308: STW_I	stw	%r24, [%r20 + 0x0180]
	.word 0xfe2de11e  ! 309: STB_I	stb	%r31, [%r23 + 0x011e]
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8754000  ! 317: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf42c60c7  ! 318: STB_I	stb	%r26, [%r17 + 0x00c7]
	.word 0xb0844000  ! 319: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0x839420cd  ! 323: WRPR_TNPC_I	wrpr	%r16, 0x00cd, %tnpc
	.word 0xf024a1ad  ! 325: STW_I	stw	%r24, [%r18 + 0x01ad]
	.word 0xfe2d8000  ! 326: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf8248000  ! 330: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xfe356190  ! 333: STH_I	sth	%r31, [%r21 + 0x0190]
	.word 0xb224a1d0  ! 334: SUB_I	sub 	%r18, 0x01d0, %r25
	.word 0xfe34a124  ! 337: STH_I	sth	%r31, [%r18 + 0x0124]
	.word 0xf825a112  ! 341: STW_I	stw	%r28, [%r22 + 0x0112]
	setx	0x1013d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 349: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb7345000  ! 351: SRLX_R	srlx	%r17, %r0, %r27
	.word 0x899421ac  ! 352: WRPR_TICK_I	wrpr	%r16, 0x01ac, %tick
	.word 0xb73c7001  ! 353: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0xf425a1a6  ! 354: STW_I	stw	%r26, [%r22 + 0x01a6]
	.word 0xfa24a0c6  ! 355: STW_I	stw	%r29, [%r18 + 0x00c6]
	.word 0xfc2cc000  ! 359: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xbb356001  ! 360: SRL_I	srl 	%r21, 0x0001, %r29
	.word 0xf03c8000  ! 361: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfb3c4000  ! 364: STDF_R	std	%f29, [%r0, %r17]
	.word 0xbb518000  ! 365: RDPR_PSTATE	rdpr	%pstate, %r29
	mov	1, %r12
	.word 0x8f932000  ! 371: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8794e01a  ! 373: WRPR_TT_I	wrpr	%r19, 0x001a, %tt
	.word 0xf02d0000  ! 376: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf4746157  ! 377: STX_I	stx	%r26, [%r17 + 0x0157]
	.word 0xf635e046  ! 379: STH_I	sth	%r27, [%r23 + 0x0046]
	.word 0xf2758000  ! 380: STX_R	stx	%r25, [%r22 + %r0]
	setx	0x20209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194e1ed  ! 383: WRPR_PIL_I	wrpr	%r19, 0x01ed, %pil
	.word 0xbb520000  ! 384: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb1540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0xb49d4000  ! 393: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xfb3d4000  ! 394: STDF_R	std	%f29, [%r0, %r21]
	.word 0xb551c000  ! 395: RDPR_TL	<illegal instruction>
	.word 0x83942062  ! 397: WRPR_TNPC_I	wrpr	%r16, 0x0062, %tnpc
	.word 0x81942120  ! 404: WRPR_TPC_I	wrpr	%r16, 0x0120, %tpc
	.word 0xb32c5000  ! 405: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xfa350000  ! 408: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf02cc000  ! 412: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf025214b  ! 415: STW_I	stw	%r24, [%r20 + 0x014b]
	.word 0xf63c8000  ! 417: STD_R	std	%r27, [%r18 + %r0]
	.word 0xb7504000  ! 422: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x85946165  ! 425: WRPR_TSTATE_I	wrpr	%r17, 0x0165, %tstate
	.word 0xf4744000  ! 426: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf424618d  ! 427: STW_I	stw	%r26, [%r17 + 0x018d]
	.word 0xfc35e133  ! 428: STH_I	sth	%r30, [%r23 + 0x0133]
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83d4000  ! 431: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe3421bc  ! 433: STH_I	sth	%r31, [%r16 + 0x01bc]
	.word 0xfc2de085  ! 435: STB_I	stb	%r30, [%r23 + 0x0085]
	.word 0xf13da19e  ! 437: STDF_I	std	%f24, [0x019e, %r22]
	.word 0xb235c000  ! 440: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xbf51c000  ! 443: RDPR_TL	rdpr	%tl, %r31
	.word 0x899460ba  ! 444: WRPR_TICK_I	wrpr	%r17, 0x00ba, %tick
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22ce12f  ! 454: STB_I	stb	%r25, [%r19 + 0x012f]
	.word 0x8995204d  ! 456: WRPR_TICK_I	wrpr	%r20, 0x004d, %tick
	.word 0xb21ce048  ! 458: XOR_I	xor 	%r19, 0x0048, %r25
	.word 0xfe2d0000  ! 462: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf42ce0b0  ! 463: STB_I	stb	%r26, [%r19 + 0x00b0]
	.word 0xf03de1ef  ! 467: STD_I	std	%r24, [%r23 + 0x01ef]
	.word 0xb3480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc3ca18a  ! 473: STD_I	std	%r30, [%r18 + 0x018a]
	.word 0xf62d61e8  ! 474: STB_I	stb	%r27, [%r21 + 0x01e8]
	.word 0xb89da164  ! 475: XORcc_I	xorcc 	%r22, 0x0164, %r28
	.word 0x83952030  ! 477: WRPR_TNPC_I	wrpr	%r20, 0x0030, %tnpc
	.word 0xfc744000  ! 479: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xfb3c0000  ! 483: STDF_R	std	%f29, [%r0, %r16]
	.word 0xbd500000  ! 484: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf23c0000  ! 485: STD_R	std	%r25, [%r16 + %r0]
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82dc000  ! 490: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf02c0000  ! 491: STB_R	stb	%r24, [%r16 + %r0]
	.word 0x859520c6  ! 492: WRPR_TSTATE_I	wrpr	%r20, 0x00c6, %tstate
	.word 0xfa24c000  ! 493: STW_R	stw	%r29, [%r19 + %r0]
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d41  ! 504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d41, %hpstate
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 507: MOVcc_R	<illegal instruction>
	.word 0x8395a065  ! 510: WRPR_TNPC_I	wrpr	%r22, 0x0065, %tnpc
	.word 0xb551c000  ! 511: RDPR_TL	rdpr	%tl, %r26
	.word 0xf425e088  ! 512: STW_I	stw	%r26, [%r23 + 0x0088]
	.word 0xb350c000  ! 513: RDPR_TT	<illegal instruction>
	.word 0x8995e16e  ! 515: WRPR_TICK_I	wrpr	%r23, 0x016e, %tick
	.word 0xb5518000  ! 517: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xf275a08a  ! 524: STX_I	stx	%r25, [%r22 + 0x008a]
	.word 0xb351c000  ! 526: RDPR_TL	rdpr	%tl, %r25
	.word 0xb6bde19a  ! 530: XNORcc_I	xnorcc 	%r23, 0x019a, %r27
	.word 0xbf500000  ! 532: RDPR_TPC	<illegal instruction>
	.word 0xf8750000  ! 535: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xb825c000  ! 536: SUB_R	sub 	%r23, %r0, %r28
	.word 0xb151c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xfa34a153  ! 541: STH_I	sth	%r29, [%r18 + 0x0153]
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982f13  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0xf675a104  ! 544: STX_I	stx	%r27, [%r22 + 0x0104]
	.word 0xb20d8000  ! 551: AND_R	and 	%r22, %r0, %r25
	.word 0xfe740000  ! 554: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xbeb40000  ! 561: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xf43c60d1  ! 562: STD_I	std	%r26, [%r17 + 0x00d1]
	.word 0xf634c000  ! 566: STH_R	sth	%r27, [%r19 + %r0]
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 568: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfb3c4000  ! 572: STDF_R	std	%f29, [%r0, %r17]
	.word 0x8d95e064  ! 573: WRPR_PSTATE_I	wrpr	%r23, 0x0064, %pstate
	.word 0xf23dc000  ! 575: STD_R	std	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xf234a1b5  ! 577: STH_I	sth	%r25, [%r18 + 0x01b5]
	.word 0xfa3da1f3  ! 585: STD_I	std	%r29, [%r22 + 0x01f3]
	.word 0xf53de105  ! 586: STDF_I	std	%f26, [0x0105, %r23]
	.word 0xf42c20c4  ! 592: STB_I	stb	%r26, [%r16 + 0x00c4]
	.word 0xb7504000  ! 595: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfa248000  ! 596: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xb6bc6156  ! 597: XNORcc_I	xnorcc 	%r17, 0x0156, %r27
	.word 0xf73d21d9  ! 598: STDF_I	std	%f27, [0x01d9, %r20]
	.word 0xb29d20a6  ! 602: XORcc_I	xorcc 	%r20, 0x00a6, %r25
	.word 0xf53c214e  ! 608: STDF_I	std	%f26, [0x014e, %r16]
	.word 0xf835617f  ! 610: STH_I	sth	%r28, [%r21 + 0x017f]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa25a1c0  ! 616: STW_I	stw	%r29, [%r22 + 0x01c0]
	.word 0xb635e069  ! 618: SUBC_I	orn 	%r23, 0x0069, %r27
	.word 0xb9510000  ! 622: RDPR_TICK	<illegal instruction>
	.word 0xf235a003  ! 623: STH_I	sth	%r25, [%r22 + 0x0003]
	.word 0xba0c4000  ! 624: AND_R	and 	%r17, %r0, %r29
	.word 0xf43da0ca  ! 625: STD_I	std	%r26, [%r22 + 0x00ca]
	.word 0xbca5e1f2  ! 627: SUBcc_I	subcc 	%r23, 0x01f2, %r30
	.word 0xb7504000  ! 629: RDPR_TNPC	<illegal instruction>
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02420da  ! 639: STW_I	stw	%r24, [%r16 + 0x00da]
	.word 0xf63c4000  ! 643: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf074e065  ! 644: STX_I	stx	%r24, [%r19 + 0x0065]
	.word 0xfc7520ac  ! 648: STX_I	stx	%r30, [%r20 + 0x00ac]
	.word 0xf93c8000  ! 650: STDF_R	std	%f28, [%r0, %r18]
	.word 0xf6254000  ! 653: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xb53c3001  ! 654: SRAX_I	srax	%r16, 0x0001, %r26
	.word 0xf03dc000  ! 656: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb9500000  ! 659: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xf2752030  ! 661: STX_I	stx	%r25, [%r20 + 0x0030]
	.word 0xf625c000  ! 666: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf53ce154  ! 668: STDF_I	std	%f26, [0x0154, %r19]
	setx	0x20227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 676: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x11d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3da0a4  ! 679: STD_I	std	%r30, [%r22 + 0x00a4]
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 685: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf0346146  ! 686: STH_I	sth	%r24, [%r17 + 0x0146]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4258000  ! 691: STW_R	stw	%r26, [%r22 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 692: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfb3c4000  ! 694: STDF_R	std	%f29, [%r0, %r17]
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3da09d  ! 703: STD_I	std	%r31, [%r22 + 0x009d]
	.word 0xb550c000  ! 705: RDPR_TT	rdpr	%tt, %r26
	setx	data_start_5, %g1, %r23
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 717: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf275204a  ! 718: STX_I	stx	%r25, [%r20 + 0x004a]
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 720: RDPR_TICK	rdpr	%tick, %r30
	setx	data_start_1, %g1, %r16
	.word 0xfa244000  ! 727: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xfc2cc000  ! 729: STB_R	stb	%r30, [%r19 + %r0]
	setx	0x30201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 733: STW_R	stw	%r26, [%r17 + %r0]
	setx	0x1020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 739: STB_R	stb	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf625e0ba  ! 742: STW_I	stw	%r27, [%r23 + 0x00ba]
	.word 0xff3c61a6  ! 744: STDF_I	std	%f31, [0x01a6, %r17]
	setx	0x10119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3c6177  ! 747: STD_I	std	%r31, [%r17 + 0x0177]
	.word 0xff3c8000  ! 748: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf43c4000  ! 749: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb634e1a0  ! 751: ORN_I	orn 	%r19, 0x01a0, %r27
	.word 0x91942023  ! 752: WRPR_PIL_I	wrpr	%r16, 0x0023, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe7460ae  ! 755: STX_I	stx	%r31, [%r17 + 0x00ae]
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xf424e16d  ! 760: STW_I	stw	%r26, [%r19 + 0x016d]
	.word 0xf63d8000  ! 761: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf42da060  ! 763: STB_I	stb	%r26, [%r22 + 0x0060]
	.word 0xbd508000  ! 765: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8595e16a  ! 770: WRPR_TSTATE_I	wrpr	%r23, 0x016a, %tstate
	.word 0xfa750000  ! 774: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb4344000  ! 775: ORN_R	orn 	%r17, %r0, %r26
	.word 0xfd3d4000  ! 776: STDF_R	std	%f30, [%r0, %r21]
	.word 0xfa74a035  ! 777: STX_I	stx	%r29, [%r18 + 0x0035]
	.word 0xf73d4000  ! 782: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf6358000  ! 783: STH_R	sth	%r27, [%r22 + %r0]
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d207e  ! 797: STDF_I	std	%f27, [0x007e, %r20]
	.word 0xf4254000  ! 798: STW_R	stw	%r26, [%r21 + %r0]
	setx	0x2010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 803: RDPR_TL	rdpr	%tl, %r27
	.word 0xb351c000  ! 804: RDPR_TL	<illegal instruction>
	.word 0xf93d0000  ! 806: STDF_R	std	%f28, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3cc000  ! 809: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbf510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xf07561cd  ! 812: STX_I	stx	%r24, [%r21 + 0x01cd]
	.word 0xf63de053  ! 816: STD_I	std	%r27, [%r23 + 0x0053]
	.word 0xfc340000  ! 817: STH_R	sth	%r30, [%r16 + %r0]
	setx	data_start_1, %g1, %r18
	.word 0xb5540000  ! 825: RDPR_GL	<illegal instruction>
	.word 0xfd3d21b5  ! 826: STDF_I	std	%f30, [0x01b5, %r20]
	.word 0xfe3c606c  ! 828: STD_I	std	%r31, [%r17 + 0x006c]
	.word 0xf2756137  ! 837: STX_I	stx	%r25, [%r21 + 0x0137]
	.word 0xf62c21e3  ! 840: STB_I	stb	%r27, [%r16 + 0x01e3]
	.word 0xf83d4000  ! 842: STD_R	std	%r28, [%r21 + %r0]
	setx	data_start_5, %g1, %r22
	setx	data_start_7, %g1, %r21
	.word 0xf8350000  ! 847: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf13d8000  ! 849: STDF_R	std	%f24, [%r0, %r22]
	.word 0x8994a107  ! 853: WRPR_TICK_I	wrpr	%r18, 0x0107, %tick
	.word 0xf03c0000  ! 857: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf02c4000  ! 868: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf62d8000  ! 869: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfa34c000  ! 870: STH_R	sth	%r29, [%r19 + %r0]
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73cc000  ! 880: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf42d8000  ! 883: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfa74c000  ! 887: STX_R	stx	%r29, [%r19 + %r0]
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8244000  ! 892: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf0340000  ! 896: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xfa2d217c  ! 901: STB_I	stb	%r29, [%r20 + 0x017c]
	.word 0xf0240000  ! 903: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfe256055  ! 904: STW_I	stw	%r31, [%r21 + 0x0055]
	.word 0xb1520000  ! 908: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf874614e  ! 911: STX_I	stx	%r28, [%r17 + 0x014e]
	.word 0xb1500000  ! 914: RDPR_TPC	<illegal instruction>
	.word 0xf274e06d  ! 923: STX_I	stx	%r25, [%r19 + 0x006d]
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0xb1540000  ! 926: RDPR_GL	rdpr	%-, %r24
	.word 0xfc2cc000  ! 927: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf13de0f4  ! 929: STDF_I	std	%f24, [0x00f4, %r23]
	.word 0xf0358000  ! 932: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xb2440000  ! 935: ADDC_R	addc 	%r16, %r0, %r25
	.word 0xbf520000  ! 936: RDPR_PIL	rdpr	%pil, %r31
	.word 0xfc748000  ! 937: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xba348000  ! 939: SUBC_R	orn 	%r18, %r0, %r29
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb92c1000  ! 941: SLLX_R	sllx	%r16, %r0, %r28
	.word 0xfe2d8000  ! 945: STB_R	stb	%r31, [%r22 + %r0]
	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6354000  ! 949: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xbd7dc400  ! 950: MOVR_R	movre	%r23, %r0, %r30
	.word 0x9194a1da  ! 952: WRPR_PIL_I	wrpr	%r18, 0x01da, %pil
	.word 0xf6754000  ! 953: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf33d21bd  ! 954: STDF_I	std	%f25, [0x01bd, %r20]
	.word 0xb7508000  ! 955: RDPR_TSTATE	rdpr	%tstate, %r27
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3de172  ! 965: STDF_I	std	%f30, [0x0172, %r23]
	.word 0xfb3de0fc  ! 968: STDF_I	std	%f29, [0x00fc, %r23]
	.word 0xf8240000  ! 972: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf875207e  ! 973: STX_I	stx	%r28, [%r20 + 0x007e]
	.word 0xfb3d607b  ! 977: STDF_I	std	%f29, [0x007b, %r21]
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2d61b8  ! 983: STB_I	stb	%r31, [%r21 + 0x01b8]
	.word 0xbd510000  ! 986: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfc2c4000  ! 991: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xff3c60b1  ! 997: STDF_I	std	%f31, [0x00b1, %r17]
	setx	data_start_4, %g1, %r17
	.word 0xb2bce163  ! 1000: XNORcc_I	xnorcc 	%r19, 0x0163, %r25
	.word 0xbab4c000  ! 1002: ORNcc_R	orncc 	%r19, %r0, %r29
	.word 0xf82ca025  ! 1004: STB_I	stb	%r28, [%r18 + 0x0025]
	.word 0xfe2d6088  ! 1006: STB_I	stb	%r31, [%r21 + 0x0088]
	ta	T_CHANGE_HPRIV
	.word 0x81983d01  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d01, %hpstate
	.word 0xfe258000  ! 1010: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf034a09e  ! 1011: STH_I	sth	%r24, [%r18 + 0x009e]
	.word 0xb9510000  ! 1012: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfc344000  ! 1017: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf62c8000  ! 1021: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf62ce154  ! 1022: STB_I	stb	%r27, [%r19 + 0x0154]
	.word 0xf93ca18a  ! 1023: STDF_I	std	%f28, [0x018a, %r18]
	.word 0xf63d0000  ! 1029: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfe35a0ec  ! 1031: STH_I	sth	%r31, [%r22 + 0x00ec]
	.word 0xbb504000  ! 1036: RDPR_TNPC	<illegal instruction>
	.word 0xb40ce0ad  ! 1037: AND_I	and 	%r19, 0x00ad, %r26
	.word 0x91946034  ! 1039: WRPR_PIL_I	wrpr	%r17, 0x0034, %pil
	ta	T_CHANGE_HPRIV
	.word 0x819839c9  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c9, %hpstate
	.word 0xfe358000  ! 1044: STH_R	sth	%r31, [%r22 + %r0]
	.word 0x8d95a0a3  ! 1045: WRPR_PSTATE_I	wrpr	%r22, 0x00a3, %pstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf03dc000  ! 1052: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf82dc000  ! 1053: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf475e01b  ! 1061: STX_I	stx	%r26, [%r23 + 0x001b]
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3cc000  ! 1065: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf475e19e  ! 1066: STX_I	stx	%r26, [%r23 + 0x019e]
	.word 0x8d95a016  ! 1068: WRPR_PSTATE_I	wrpr	%r22, 0x0016, %pstate
	.word 0xf23cc000  ! 1069: STD_R	std	%r25, [%r19 + %r0]
	.word 0xfc3d2087  ! 1070: STD_I	std	%r30, [%r20 + 0x0087]
	.word 0xb9480000  ! 1071: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	1, %r14
	.word 0xa193a000  ! 1072: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1075: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf83521cc  ! 1076: STH_I	sth	%r28, [%r20 + 0x01cc]
	.word 0xb1357001  ! 1077: SRLX_I	srlx	%r21, 0x0001, %r24
	.word 0xfc34c000  ! 1082: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf82ce040  ! 1085: STB_I	stb	%r28, [%r19 + 0x0040]
	.word 0xf234c000  ! 1088: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfd3da0a9  ! 1090: STDF_I	std	%f30, [0x00a9, %r22]
	.word 0xb9342001  ! 1091: SRL_I	srl 	%r16, 0x0001, %r28
	setx	data_start_5, %g1, %r18
	.word 0xfc2de0df  ! 1095: STB_I	stb	%r30, [%r23 + 0x00df]
	.word 0x8194a090  ! 1096: WRPR_TPC_I	wrpr	%r18, 0x0090, %tpc
	.word 0xbd2d7001  ! 1098: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0xf93c602b  ! 1099: STDF_I	std	%f28, [0x002b, %r17]
	.word 0xf43ce0a9  ! 1100: STD_I	std	%r26, [%r19 + 0x00a9]
	.word 0xb6244000  ! 1102: SUB_R	sub 	%r17, %r0, %r27
	.word 0xbe346014  ! 1103: ORN_I	orn 	%r17, 0x0014, %r31
	.word 0xf03c4000  ! 1105: STD_R	std	%r24, [%r17 + %r0]
	.word 0xfd3d2038  ! 1106: STDF_I	std	%f30, [0x0038, %r20]
	.word 0xb53cc000  ! 1114: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb1518000  ! 1115: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb3350000  ! 1120: SRL_R	srl 	%r20, %r0, %r25
	.word 0xfc344000  ! 1125: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfa240000  ! 1128: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xbb540000  ! 1130: RDPR_GL	<illegal instruction>
	.word 0xb80c8000  ! 1133: AND_R	and 	%r18, %r0, %r28
	.word 0xb9520000  ! 1134: RDPR_PIL	<illegal instruction>
	.word 0xfc756161  ! 1135: STX_I	stx	%r30, [%r21 + 0x0161]
	.word 0xf42560f8  ! 1136: STW_I	stw	%r26, [%r21 + 0x00f8]
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c0000  ! 1144: STD_R	std	%r25, [%r16 + %r0]
	.word 0xfc3d4000  ! 1146: STD_R	std	%r30, [%r21 + %r0]
	.word 0xb7540000  ! 1149: RDPR_GL	<illegal instruction>
	setx	0x30026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1152: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 1154: RDPR_TNPC	<illegal instruction>
	.word 0xbc9c0000  ! 1155: XORcc_R	xorcc 	%r16, %r0, %r30
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1162: RDPR_TPC	<illegal instruction>
	.word 0xfc358000  ! 1165: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf434c000  ! 1167: STH_R	sth	%r26, [%r19 + %r0]
	.word 0x9195602d  ! 1169: WRPR_PIL_I	wrpr	%r21, 0x002d, %pil
	.word 0xfe356007  ! 1170: STH_I	sth	%r31, [%r21 + 0x0007]
	.word 0x8d956180  ! 1174: WRPR_PSTATE_I	wrpr	%r21, 0x0180, %pstate
	.word 0xbb508000  ! 1177: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf0744000  ! 1180: STX_R	stx	%r24, [%r17 + %r0]
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb72db001  ! 1183: SLLX_I	sllx	%r22, 0x0001, %r27
	.word 0xbc2c2002  ! 1186: ANDN_I	andn 	%r16, 0x0002, %r30
	.word 0xfe3c4000  ! 1187: STD_R	std	%r31, [%r17 + %r0]
	.word 0xfe7520b4  ! 1192: STX_I	stx	%r31, [%r20 + 0x00b4]
	.word 0xf63ce199  ! 1193: STD_I	std	%r27, [%r19 + 0x0199]
	ta	T_CHANGE_HPRIV
	.word 0x81983e19  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e19, %hpstate
	.word 0x859561c1  ! 1197: WRPR_TSTATE_I	wrpr	%r21, 0x01c1, %tstate
	.word 0xf874a08f  ! 1199: STX_I	stx	%r28, [%r18 + 0x008f]
	.word 0xf93d0000  ! 1201: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf13d0000  ! 1204: STDF_R	std	%f24, [%r0, %r20]
	.word 0xf87461ae  ! 1205: STX_I	stx	%r28, [%r17 + 0x01ae]
	.word 0xb0250000  ! 1206: SUB_R	sub 	%r20, %r0, %r24
	.word 0xfe254000  ! 1207: STW_R	stw	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983d11  ! 1209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d11, %hpstate
	.word 0x8195a185  ! 1210: WRPR_TPC_I	wrpr	%r22, 0x0185, %tpc
	.word 0x87952096  ! 1212: WRPR_TT_I	wrpr	%r20, 0x0096, %tt
	.word 0xf8750000  ! 1214: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xbf3c0000  ! 1217: SRA_R	sra 	%r16, %r0, %r31
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa7460c8  ! 1227: STX_I	stx	%r29, [%r17 + 0x00c8]
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e1ca  ! 1230: WRPR_TNPC_I	wrpr	%r23, 0x01ca, %tnpc
	.word 0xfa3c2113  ! 1235: STD_I	std	%r29, [%r16 + 0x0113]
	.word 0xb9540000  ! 1241: RDPR_GL	rdpr	%-, %r28
	.word 0x9194e097  ! 1243: WRPR_PIL_I	wrpr	%r19, 0x0097, %pil
	.word 0xf23ce1c1  ! 1244: STD_I	std	%r25, [%r19 + 0x01c1]
	.word 0xf73c4000  ! 1249: STDF_R	std	%f27, [%r0, %r17]
	.word 0xfa340000  ! 1250: STH_R	sth	%r29, [%r16 + %r0]
	.word 0x819421fa  ! 1254: WRPR_TPC_I	wrpr	%r16, 0x01fa, %tpc
	.word 0xf0750000  ! 1259: STX_R	stx	%r24, [%r20 + %r0]
	setx	data_start_0, %g1, %r19
	setx	0x20224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74a040  ! 1269: STX_I	stx	%r31, [%r18 + 0x0040]
	.word 0xfc35e0ee  ! 1271: STH_I	sth	%r30, [%r23 + 0x00ee]
	.word 0xf83d21d0  ! 1278: STD_I	std	%r28, [%r20 + 0x01d0]
	.word 0xf035a074  ! 1280: STH_I	sth	%r24, [%r22 + 0x0074]
	.word 0xf73c6152  ! 1282: STDF_I	std	%f27, [0x0152, %r17]
	.word 0xb150c000  ! 1283: RDPR_TT	rdpr	%tt, %r24
	.word 0xbf50c000  ! 1285: RDPR_TT	<illegal instruction>
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c60ef  ! 1290: STDF_I	std	%f29, [0x00ef, %r17]
	.word 0xf73c0000  ! 1294: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfd3d21cd  ! 1297: STDF_I	std	%f30, [0x01cd, %r20]
	.word 0x8d95a0b0  ! 1300: WRPR_PSTATE_I	wrpr	%r22, 0x00b0, %pstate
	.word 0xfa7460a9  ! 1301: STX_I	stx	%r29, [%r17 + 0x00a9]
	.word 0xf2256171  ! 1302: STW_I	stw	%r25, [%r21 + 0x0171]
	.word 0xb41c0000  ! 1304: XOR_R	xor 	%r16, %r0, %r26
	setx	data_start_2, %g1, %r21
	.word 0xfc24a1de  ! 1309: STW_I	stw	%r30, [%r18 + 0x01de]
	mov	1, %r14
	.word 0xa193a000  ! 1310: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa340000  ! 1315: STH_R	sth	%r29, [%r16 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 1317: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983b93  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b93, %hpstate
	.word 0xb8340000  ! 1321: ORN_R	orn 	%r16, %r0, %r28
	.word 0xfb3c4000  ! 1326: STDF_R	std	%f29, [%r0, %r17]
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82da0c9  ! 1333: STB_I	stb	%r28, [%r22 + 0x00c9]
	.word 0xfd3c0000  ! 1336: STDF_R	std	%f30, [%r0, %r16]
	.word 0x8594e0e7  ! 1339: WRPR_TSTATE_I	wrpr	%r19, 0x00e7, %tstate
	.word 0xfa3d4000  ! 1341: STD_R	std	%r29, [%r21 + %r0]
	.word 0xfd3da03f  ! 1342: STDF_I	std	%f30, [0x003f, %r22]
	setx	data_start_2, %g1, %r17
	.word 0x8794e1f1  ! 1347: WRPR_TT_I	wrpr	%r19, 0x01f1, %tt
	.word 0xfd3c8000  ! 1351: STDF_R	std	%f30, [%r0, %r18]
	.word 0x8d94e075  ! 1353: WRPR_PSTATE_I	wrpr	%r19, 0x0075, %pstate
	.word 0xfc2c4000  ! 1360: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf82560bd  ! 1362: STW_I	stw	%r28, [%r21 + 0x00bd]
	.word 0xb950c000  ! 1363: RDPR_TT	rdpr	%tt, %r28
	.word 0xf635e063  ! 1368: STH_I	sth	%r27, [%r23 + 0x0063]
	.word 0xb5508000  ! 1370: RDPR_TSTATE	<illegal instruction>
	.word 0xf42ca03b  ! 1372: STB_I	stb	%r26, [%r18 + 0x003b]
	.word 0xf13de1aa  ! 1373: STDF_I	std	%f24, [0x01aa, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81982803  ! 1374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0xfa35a180  ! 1380: STH_I	sth	%r29, [%r22 + 0x0180]
	.word 0xb8c4a097  ! 1388: ADDCcc_I	addccc 	%r18, 0x0097, %r28
	.word 0xf224e19f  ! 1391: STW_I	stw	%r25, [%r19 + 0x019f]
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2461a6  ! 1398: STW_I	stw	%r29, [%r17 + 0x01a6]
	.word 0xbb540000  ! 1405: RDPR_GL	rdpr	%-, %r29
	.word 0xb9504000  ! 1411: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 1415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xf835e1d7  ! 1419: STH_I	sth	%r28, [%r23 + 0x01d7]
	.word 0xf22421c1  ! 1421: STW_I	stw	%r25, [%r16 + 0x01c1]
	.word 0xb150c000  ! 1422: RDPR_TT	rdpr	%tt, %r24
	.word 0xbd504000  ! 1423: RDPR_TNPC	<illegal instruction>
	.word 0xbf2c3001  ! 1424: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xf93d8000  ! 1425: STDF_R	std	%f28, [%r0, %r22]
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 1431: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf43421be  ! 1435: STH_I	sth	%r26, [%r16 + 0x01be]
	.word 0xba950000  ! 1436: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xbec5a1e6  ! 1438: ADDCcc_I	addccc 	%r22, 0x01e6, %r31
	.word 0xf634e03a  ! 1439: STH_I	sth	%r27, [%r19 + 0x003a]
	.word 0xfa3c2023  ! 1444: STD_I	std	%r29, [%r16 + 0x0023]
	.word 0xf474c000  ! 1445: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xb32d6001  ! 1448: SLL_I	sll 	%r21, 0x0001, %r25
	setx	0x25, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 1453: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb9354000  ! 1454: SRL_R	srl 	%r21, %r0, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1458: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf53c0000  ! 1463: STDF_R	std	%f26, [%r0, %r16]
	.word 0xbf518000  ! 1464: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xba84c000  ! 1466: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xf034e1a1  ! 1467: STH_I	sth	%r24, [%r19 + 0x01a1]
	.word 0xf634a0e3  ! 1472: STH_I	sth	%r27, [%r18 + 0x00e3]
	.word 0xf624c000  ! 1474: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xff3c2008  ! 1475: STDF_I	std	%f31, [0x0008, %r16]
	.word 0xfb3ca162  ! 1478: STDF_I	std	%f29, [0x0162, %r18]
	.word 0xb8a4a1e4  ! 1487: SUBcc_I	subcc 	%r18, 0x01e4, %r28
	.word 0x87956188  ! 1489: WRPR_TT_I	wrpr	%r21, 0x0188, %tt
	.word 0xf43460c8  ! 1490: STH_I	sth	%r26, [%r17 + 0x00c8]
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd7c6401  ! 1495: MOVR_I	movre	%r17, 0x1, %r30
	.word 0xf42c0000  ! 1496: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb350c000  ! 1497: RDPR_TT	rdpr	%tt, %r25
	.word 0xfa344000  ! 1500: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfc3d2014  ! 1501: STD_I	std	%r30, [%r20 + 0x0014]
	.word 0xb81421f0  ! 1503: OR_I	or 	%r16, 0x01f0, %r28
	.word 0xf434c000  ! 1504: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfc75205d  ! 1505: STX_I	stx	%r30, [%r20 + 0x005d]
	.word 0xf43d0000  ! 1506: STD_R	std	%r26, [%r20 + %r0]
	.word 0xba848000  ! 1508: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xf82421f5  ! 1510: STW_I	stw	%r28, [%r16 + 0x01f5]
	.word 0xb1510000  ! 1513: RDPR_TICK	<illegal instruction>
	.word 0xfe7420fe  ! 1515: STX_I	stx	%r31, [%r16 + 0x00fe]
	.word 0x8794e0a1  ! 1518: WRPR_TT_I	wrpr	%r19, 0x00a1, %tt
	.word 0xfe256198  ! 1519: STW_I	stw	%r31, [%r21 + 0x0198]
	.word 0xf63dc000  ! 1520: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf03d6015  ! 1522: STD_I	std	%r24, [%r21 + 0x0015]
	.word 0xb32dd000  ! 1523: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xb2a420a8  ! 1524: SUBcc_I	subcc 	%r16, 0x00a8, %r25
	.word 0x8394a147  ! 1525: WRPR_TNPC_I	wrpr	%r18, 0x0147, %tnpc
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 1527: STW_R	stw	%r25, [%r21 + %r0]
	.word 0x83942099  ! 1533: WRPR_TNPC_I	wrpr	%r16, 0x0099, %tnpc
	.word 0xfe750000  ! 1534: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb81d218d  ! 1535: XOR_I	xor 	%r20, 0x018d, %r28
	.word 0x8594e150  ! 1536: WRPR_TSTATE_I	wrpr	%r19, 0x0150, %tstate
	.word 0xf034a1b9  ! 1539: STH_I	sth	%r24, [%r18 + 0x01b9]
	mov	0, %r14
	.word 0xa193a000  ! 1540: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 1542: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 1543: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf4240000  ! 1546: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfd3c0000  ! 1549: STDF_R	std	%f30, [%r0, %r16]
	.word 0xff3d2044  ! 1552: STDF_I	std	%f31, [0x0044, %r20]
	.word 0xbd51c000  ! 1553: RDPR_TL	<illegal instruction>
	setx	data_start_1, %g1, %r18
	.word 0xfe2c8000  ! 1558: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf035c000  ! 1561: STH_R	sth	%r24, [%r23 + %r0]
	.word 0x8d94e186  ! 1562: WRPR_PSTATE_I	wrpr	%r19, 0x0186, %pstate
	.word 0xbc140000  ! 1565: OR_R	or 	%r16, %r0, %r30
	.word 0xfe2de170  ! 1566: STB_I	stb	%r31, [%r23 + 0x0170]
	.word 0x8994617d  ! 1567: WRPR_TICK_I	wrpr	%r17, 0x017d, %tick
	setx	0x2013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 1571: STB_R	stb	%r24, [%r16 + %r0]
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1578: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb61dc000  ! 1580: XOR_R	xor 	%r23, %r0, %r27
	setx	0x1002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d2034  ! 1585: STB_I	stb	%r25, [%r20 + 0x0034]
	.word 0xb1500000  ! 1587: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf4258000  ! 1589: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xbd518000  ! 1591: RDPR_PSTATE	<illegal instruction>
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 1596: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3cf001  ! 1600: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0xb9510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0xf024c000  ! 1603: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfe3d4000  ! 1605: STD_R	std	%r31, [%r21 + %r0]
	.word 0x819560ef  ! 1607: WRPR_TPC_I	wrpr	%r21, 0x00ef, %tpc
	.word 0xf82c4000  ! 1610: STB_R	stb	%r28, [%r17 + %r0]
	.word 0x8594e0aa  ! 1612: WRPR_TSTATE_I	wrpr	%r19, 0x00aa, %tstate
	.word 0xb405a076  ! 1613: ADD_I	add 	%r22, 0x0076, %r26
	.word 0xfa3d8000  ! 1622: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf0258000  ! 1624: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xb89d6151  ! 1625: XORcc_I	xorcc 	%r21, 0x0151, %r28
	.word 0xbf35a001  ! 1626: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xfc3c20fe  ! 1628: STD_I	std	%r30, [%r16 + 0x00fe]
	.word 0xb40d4000  ! 1630: AND_R	and 	%r21, %r0, %r26
	.word 0xbf508000  ! 1638: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbe2cc000  ! 1641: ANDN_R	andn 	%r19, %r0, %r31
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7da401  ! 1648: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xf03c8000  ! 1650: STD_R	std	%r24, [%r18 + %r0]
	.word 0xb694c000  ! 1653: ORcc_R	orcc 	%r19, %r0, %r27
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 1655: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xbcbce08f  ! 1656: XNORcc_I	xnorcc 	%r19, 0x008f, %r30
	.word 0xf63cc000  ! 1662: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfd3d61e3  ! 1664: STDF_I	std	%f30, [0x01e3, %r21]
	.word 0xb3520000  ! 1666: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf474e017  ! 1671: STX_I	stx	%r26, [%r19 + 0x0017]
	.word 0xb150c000  ! 1672: RDPR_TT	<illegal instruction>
	.word 0xf43da092  ! 1674: STD_I	std	%r26, [%r22 + 0x0092]
	.word 0xf4758000  ! 1678: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf62de1b4  ! 1680: STB_I	stb	%r27, [%r23 + 0x01b4]
	.word 0xf43c8000  ! 1682: STD_R	std	%r26, [%r18 + %r0]
	.word 0xbab461c1  ! 1686: SUBCcc_I	orncc 	%r17, 0x01c1, %r29
	.word 0xfa248000  ! 1688: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xb7480000  ! 1690: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5500000  ! 1692: RDPR_TPC	<illegal instruction>
	setx	0x33c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e00f  ! 1696: WRPR_PIL_I	wrpr	%r23, 0x000f, %pil
	.word 0xb1500000  ! 1697: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbb518000  ! 1698: RDPR_PSTATE	<illegal instruction>
	.word 0xf23d4000  ! 1701: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf03d612d  ! 1702: STD_I	std	%r24, [%r21 + 0x012d]
	.word 0xfb3d4000  ! 1705: STDF_R	std	%f29, [%r0, %r21]
	.word 0x8194a043  ! 1706: WRPR_TPC_I	wrpr	%r18, 0x0043, %tpc
	.word 0xbb500000  ! 1707: RDPR_TPC	rdpr	%tpc, %r29
	setx	0xc, %g1, %o0
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
	.word 0xfa350000  ! 1711: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfa248000  ! 1714: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xb9540000  ! 1716: RDPR_GL	<illegal instruction>
	.word 0xb5518000  ! 1717: RDPR_PSTATE	<illegal instruction>
	.word 0xf23d8000  ! 1718: STD_R	std	%r25, [%r22 + %r0]
	.word 0xbcc54000  ! 1728: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xfc254000  ! 1731: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf4740000  ! 1733: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb4a4c000  ! 1734: SUBcc_R	subcc 	%r19, %r0, %r26
	setx	0x20109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2461a4  ! 1737: STW_I	stw	%r29, [%r17 + 0x01a4]
	.word 0xf83d8000  ! 1740: STD_R	std	%r28, [%r22 + %r0]
	setx	data_start_7, %g1, %r17
	.word 0xfa2420eb  ! 1744: STW_I	stw	%r29, [%r16 + 0x00eb]
	.word 0xf33c618e  ! 1745: STDF_I	std	%f25, [0x018e, %r17]
	.word 0xf674a069  ! 1748: STX_I	stx	%r27, [%r18 + 0x0069]
	.word 0x8595611d  ! 1750: WRPR_TSTATE_I	wrpr	%r21, 0x011d, %tstate
	setx	data_start_6, %g1, %r16
	.word 0xf8258000  ! 1753: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xb63c21fd  ! 1754: XNOR_I	xnor 	%r16, 0x01fd, %r27
	.word 0xb77d8400  ! 1756: MOVR_R	movre	%r22, %r0, %r27
	.word 0xf42c6040  ! 1757: STB_I	stb	%r26, [%r17 + 0x0040]
	.word 0xb01ce0f3  ! 1759: XOR_I	xor 	%r19, 0x00f3, %r24
	.word 0xf43d4000  ! 1760: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf425e0e3  ! 1762: STW_I	stw	%r26, [%r23 + 0x00e3]
	.word 0xfe34a0eb  ! 1764: STH_I	sth	%r31, [%r18 + 0x00eb]
	.word 0xf825c000  ! 1765: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xb3359000  ! 1766: SRLX_R	srlx	%r22, %r0, %r25
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42cc000  ! 1771: STB_R	stb	%r26, [%r19 + %r0]
	setx	0x2021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe75e000  ! 1776: STX_I	stx	%r31, [%r23 + 0x0000]
	.word 0xf23dc000  ! 1778: STD_R	std	%r25, [%r23 + %r0]
	.word 0x8994a00e  ! 1780: WRPR_TICK_I	wrpr	%r18, 0x000e, %tick
	.word 0xfc2d0000  ! 1783: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf0754000  ! 1784: STX_R	stx	%r24, [%r21 + %r0]
	setx	data_start_1, %g1, %r20
	.word 0xfe2c4000  ! 1791: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb82c4000  ! 1793: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xb1500000  ! 1799: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfa250000  ! 1802: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf4356105  ! 1803: STH_I	sth	%r26, [%r21 + 0x0105]
	.word 0xbd7cc400  ! 1806: MOVR_R	movre	%r19, %r0, %r30
	mov	0, %r14
	.word 0xa193a000  ! 1807: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff3c4000  ! 1811: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf03d0000  ! 1812: STD_R	std	%r24, [%r20 + %r0]
	.word 0xfc3d4000  ! 1813: STD_R	std	%r30, [%r21 + %r0]
	.word 0xb1340000  ! 1817: SRL_R	srl 	%r16, %r0, %r24
	setx	0x2023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d613e  ! 1820: STD_I	std	%r30, [%r21 + 0x013e]
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa254000  ! 1829: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfc3c8000  ! 1831: STD_R	std	%r30, [%r18 + %r0]
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	.word 0xfe2d4000  ! 1835: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xfe354000  ! 1837: STH_R	sth	%r31, [%r21 + %r0]
	.word 0x9195e1f1  ! 1843: WRPR_PIL_I	wrpr	%r23, 0x01f1, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982b19  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0xbb510000  ! 1856: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf4250000  ! 1859: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf53d2105  ! 1861: STDF_I	std	%f26, [0x0105, %r20]
	.word 0xf23d0000  ! 1865: STD_R	std	%r25, [%r20 + %r0]
	.word 0xf93ce1d3  ! 1866: STDF_I	std	%f28, [0x01d3, %r19]
	.word 0xfa348000  ! 1867: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xff3d0000  ! 1870: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf62dc000  ! 1871: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xfc74a0f9  ! 1872: STX_I	stx	%r30, [%r18 + 0x00f9]
	.word 0xf4258000  ! 1877: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xfc346160  ! 1879: STH_I	sth	%r30, [%r17 + 0x0160]
	.word 0xfd3cc000  ! 1882: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf42c0000  ! 1883: STB_R	stb	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 1885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xf53c0000  ! 1891: STDF_R	std	%f26, [%r0, %r16]
	.word 0x8194e129  ! 1892: WRPR_TPC_I	wrpr	%r19, 0x0129, %tpc
	setx	0x20100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a1fe  ! 1894: WRPR_TSTATE_I	wrpr	%r18, 0x01fe, %tstate
	setx	data_start_5, %g1, %r21
	.word 0xb0258000  ! 1899: SUB_R	sub 	%r22, %r0, %r24
	.word 0xf83cc000  ! 1901: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf43de0ae  ! 1902: STD_I	std	%r26, [%r23 + 0x00ae]
	.word 0xb6a48000  ! 1904: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xb8b52166  ! 1906: ORNcc_I	orncc 	%r20, 0x0166, %r28
	.word 0x85942186  ! 1908: WRPR_TSTATE_I	wrpr	%r16, 0x0186, %tstate
	.word 0xf0250000  ! 1910: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xfe2dc000  ! 1911: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xfe25c000  ! 1912: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfb3d60fb  ! 1914: STDF_I	std	%f29, [0x00fb, %r21]
	.word 0xff3da141  ! 1917: STDF_I	std	%f31, [0x0141, %r22]
	.word 0xfe35a0b5  ! 1918: STH_I	sth	%r31, [%r22 + 0x00b5]
	.word 0xb4acc000  ! 1919: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xf2754000  ! 1925: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf225e058  ! 1932: STW_I	stw	%r25, [%r23 + 0x0058]
	.word 0xbc0c61f2  ! 1935: AND_I	and 	%r17, 0x01f2, %r30
	.word 0xfc2c217b  ! 1937: STB_I	stb	%r30, [%r16 + 0x017b]
	ta	T_CHANGE_HPRIV
	.word 0x81982b11  ! 1940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b11, %hpstate
	.word 0xb3520000  ! 1944: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfb3d4000  ! 1945: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf8740000  ! 1946: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xb7518000  ! 1949: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb6bd607a  ! 1950: XNORcc_I	xnorcc 	%r21, 0x007a, %r27
	.word 0xbb3db001  ! 1955: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xf93d0000  ! 1958: STDF_R	std	%f28, [%r0, %r20]
	.word 0xb1480000  ! 1960: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbb504000  ! 1964: RDPR_TNPC	<illegal instruction>
	.word 0xb151c000  ! 1965: RDPR_TL	<illegal instruction>
	.word 0xbab50000  ! 1966: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xff3ca082  ! 1968: STDF_I	std	%f31, [0x0082, %r18]
	.word 0xf2746012  ! 1969: STX_I	stx	%r25, [%r17 + 0x0012]
	.word 0xf43ca1db  ! 1971: STD_I	std	%r26, [%r18 + 0x01db]
	setx	data_start_7, %g1, %r22
	.word 0xf835a106  ! 1976: STH_I	sth	%r28, [%r22 + 0x0106]
	.word 0xf62c6020  ! 1977: STB_I	stb	%r27, [%r17 + 0x0020]
	.word 0xf82d4000  ! 1983: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfa3d8000  ! 1985: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf0744000  ! 1986: STX_R	stx	%r24, [%r17 + %r0]
	.word 0x8395a179  ! 1989: WRPR_TNPC_I	wrpr	%r22, 0x0179, %tnpc
	.word 0xb1504000  ! 1990: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb4340000  ! 1991: ORN_R	orn 	%r16, %r0, %r26
	.word 0xf875c000  ! 1995: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf875210a  ! 1996: STX_I	stx	%r28, [%r20 + 0x010a]
	setx	data_start_2, %g1, %r21
	.word 0xf33c2116  ! 2001: STDF_I	std	%f25, [0x0116, %r16]
	.word 0xfb3d61c0  ! 2002: STDF_I	std	%f29, [0x01c0, %r21]
	.word 0xf23461ff  ! 2004: STH_I	sth	%r25, [%r17 + 0x01ff]
	.word 0x9195a13b  ! 2007: WRPR_PIL_I	wrpr	%r22, 0x013b, %pil
	.word 0xb7504000  ! 2008: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfe74a054  ! 2010: STX_I	stx	%r31, [%r18 + 0x0054]
	.word 0xb6b5600d  ! 2013: SUBCcc_I	orncc 	%r21, 0x000d, %r27
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 2018: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xfc2ce050  ! 2020: STB_I	stb	%r30, [%r19 + 0x0050]
	.word 0x8394a1e2  ! 2021: WRPR_TNPC_I	wrpr	%r18, 0x01e2, %tnpc
	.word 0xb950c000  ! 2022: RDPR_TT	rdpr	%tt, %r28
	.word 0xb015c000  ! 2028: OR_R	or 	%r23, %r0, %r24
	.word 0xfe2520f5  ! 2032: STW_I	stw	%r31, [%r20 + 0x00f5]
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0x8994e142  ! 2036: WRPR_TICK_I	wrpr	%r19, 0x0142, %tick
	.word 0xb1480000  ! 2038: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf33c4000  ! 2043: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf4248000  ! 2044: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x8d94a1b2  ! 2046: WRPR_PSTATE_I	wrpr	%r18, 0x01b2, %pstate
	.word 0xf034a1f6  ! 2047: STH_I	sth	%r24, [%r18 + 0x01f6]
	.word 0xf2348000  ! 2049: STH_R	sth	%r25, [%r18 + %r0]
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb484208a  ! 2052: ADDcc_I	addcc 	%r16, 0x008a, %r26
	ta	T_CHANGE_HPRIV
	.word 0x819828d1  ! 2054: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d1, %hpstate
	.word 0x8394e138  ! 2056: WRPR_TNPC_I	wrpr	%r19, 0x0138, %tnpc
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d6098  ! 2058: STDF_I	std	%f27, [0x0098, %r21]
	.word 0xb8a54000  ! 2060: SUBcc_R	subcc 	%r21, %r0, %r28
	mov	2, %r12
	.word 0x8f932000  ! 2061: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf22d4000  ! 2065: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xfe2c2127  ! 2068: STB_I	stb	%r31, [%r16 + 0x0127]
	.word 0xfc25615a  ! 2069: STW_I	stw	%r30, [%r21 + 0x015a]
	.word 0xf6348000  ! 2074: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf2358000  ! 2077: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfe34c000  ! 2082: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf825c000  ! 2083: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf0242156  ! 2084: STW_I	stw	%r24, [%r16 + 0x0156]
	.word 0xfa74202a  ! 2086: STX_I	stx	%r29, [%r16 + 0x002a]
	.word 0xf73dc000  ! 2088: STDF_R	std	%f27, [%r0, %r23]
	.word 0x8994a000  ! 2089: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xba35c000  ! 2090: ORN_R	orn 	%r23, %r0, %r29
	.word 0xf22cc000  ! 2091: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xbc848000  ! 2092: ADDcc_R	addcc 	%r18, %r0, %r30
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 2096: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf274c000  ! 2097: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xb3520000  ! 2100: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf83520e7  ! 2102: STH_I	sth	%r28, [%r20 + 0x00e7]
	.word 0xb750c000  ! 2103: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 2104: RDPR_PIL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 2105: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834e03e  ! 2108: STH_I	sth	%r28, [%r19 + 0x003e]
	setx	data_start_5, %g1, %r17
	.word 0xf4354000  ! 2111: STH_R	sth	%r26, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 2112: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73dc000  ! 2118: STDF_R	std	%f27, [%r0, %r23]
	ta	T_CHANGE_HPRIV
	.word 0x81983bcb  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bcb, %hpstate
	setx	data_start_7, %g1, %r16
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb134b001  ! 2126: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb951c000  ! 2127: RDPR_TL	rdpr	%tl, %r28
	.word 0x8d95e1dd  ! 2131: WRPR_PSTATE_I	wrpr	%r23, 0x01dd, %pstate
	.word 0xbe342150  ! 2132: ORN_I	orn 	%r16, 0x0150, %r31
	.word 0xbabca152  ! 2133: XNORcc_I	xnorcc 	%r18, 0x0152, %r29
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74208e  ! 2141: STX_I	stx	%r31, [%r16 + 0x008e]
	.word 0xf2348000  ! 2142: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xb32c9000  ! 2143: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xb3540000  ! 2147: RDPR_GL	rdpr	%-, %r25
	.word 0x83952099  ! 2148: WRPR_TNPC_I	wrpr	%r20, 0x0099, %tnpc
	.word 0xb151c000  ! 2150: RDPR_TL	rdpr	%tl, %r24
	.word 0xf13c21c5  ! 2152: STDF_I	std	%f24, [0x01c5, %r16]
	.word 0xf4350000  ! 2156: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfe2ce0f4  ! 2158: STB_I	stb	%r31, [%r19 + 0x00f4]
	.word 0xb17c6401  ! 2159: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xb23d8000  ! 2160: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xb9540000  ! 2163: RDPR_GL	<illegal instruction>
	.word 0xf6342172  ! 2169: STH_I	sth	%r27, [%r16 + 0x0172]
	.word 0xbe2d61ef  ! 2170: ANDN_I	andn 	%r21, 0x01ef, %r31
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d4000  ! 2175: STDF_R	std	%f27, [%r0, %r21]
	.word 0xfe74e0b8  ! 2178: STX_I	stx	%r31, [%r19 + 0x00b8]
	.word 0xfc25a0f1  ! 2179: STW_I	stw	%r30, [%r22 + 0x00f1]
	.word 0xfa748000  ! 2183: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbd7ca401  ! 2185: MOVR_I	movre	%r18, 0x1, %r30
	.word 0xf62dc000  ! 2186: STB_R	stb	%r27, [%r23 + %r0]
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe25a144  ! 2189: STW_I	stw	%r31, [%r22 + 0x0144]
	.word 0x8995207f  ! 2190: WRPR_TICK_I	wrpr	%r20, 0x007f, %tick
	.word 0xfa242103  ! 2191: STW_I	stw	%r29, [%r16 + 0x0103]
	setx	data_start_6, %g1, %r23
	setx	0x1020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2197: RDPR_PIL	rdpr	%pil, %r28
	.word 0x8995e11e  ! 2205: WRPR_TICK_I	wrpr	%r23, 0x011e, %tick
	.word 0xb751c000  ! 2210: RDPR_TL	rdpr	%tl, %r27
	.word 0xf02c8000  ! 2214: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xbb508000  ! 2217: RDPR_TSTATE	<illegal instruction>
	.word 0x899420bd  ! 2219: WRPR_TICK_I	wrpr	%r16, 0x00bd, %tick
	.word 0xf83d0000  ! 2221: STD_R	std	%r28, [%r20 + %r0]
	.word 0xf4244000  ! 2225: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf87560f7  ! 2227: STX_I	stx	%r28, [%r21 + 0x00f7]
	.word 0xfe2d2120  ! 2233: STB_I	stb	%r31, [%r20 + 0x0120]
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2239: RDPR_GL	rdpr	%-, %r26
	.word 0xb7518000  ! 2240: RDPR_PSTATE	<illegal instruction>
	.word 0xf6350000  ! 2241: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb88d615a  ! 2243: ANDcc_I	andcc 	%r21, 0x015a, %r28
	.word 0xfa750000  ! 2245: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xbb518000  ! 2248: RDPR_PSTATE	<illegal instruction>
	.word 0xf2358000  ! 2252: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf13da08e  ! 2253: STDF_I	std	%f24, [0x008e, %r22]
	.word 0xf4352149  ! 2254: STH_I	sth	%r26, [%r20 + 0x0149]
	.word 0xf8244000  ! 2256: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb951c000  ! 2257: RDPR_TL	<illegal instruction>
	.word 0xfe25e125  ! 2259: STW_I	stw	%r31, [%r23 + 0x0125]
	.word 0xf53c60c1  ! 2261: STDF_I	std	%f26, [0x00c1, %r17]
	.word 0xfe3cc000  ! 2262: STD_R	std	%r31, [%r19 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2263: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd51c000  ! 2267: RDPR_TL	rdpr	%tl, %r30
	.word 0xbb510000  ! 2271: RDPR_TICK	<illegal instruction>
	.word 0xfe34e0be  ! 2275: STH_I	sth	%r31, [%r19 + 0x00be]
	setx	0x10010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc248000  ! 2290: STW_R	stw	%r30, [%r18 + %r0]
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2242001  ! 2294: STW_I	stw	%r25, [%r16 + 0x0001]
	.word 0xb9504000  ! 2295: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf23c8000  ! 2300: STD_R	std	%r25, [%r18 + %r0]
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22ca01f  ! 2308: STB_I	stb	%r25, [%r18 + 0x001f]
	.word 0xfe354000  ! 2312: STH_R	sth	%r31, [%r21 + %r0]
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82c4000  ! 2316: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfe3d60e1  ! 2317: STD_I	std	%r31, [%r21 + 0x00e1]
	.word 0xb33de001  ! 2320: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xb735a001  ! 2327: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0x8395e177  ! 2334: WRPR_TNPC_I	wrpr	%r23, 0x0177, %tnpc
	mov	2, %r14
	.word 0xa193a000  ! 2335: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfd3c2057  ! 2336: STDF_I	std	%f30, [0x0057, %r16]
	ta	T_CHANGE_HPRIV
	.word 0x81982b03  ! 2338: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b03, %hpstate
	.word 0xb7500000  ! 2340: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x83956060  ! 2341: WRPR_TNPC_I	wrpr	%r21, 0x0060, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 2343: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf424c000  ! 2345: STW_R	stw	%r26, [%r19 + %r0]
	.word 0x8795a065  ! 2346: WRPR_TT_I	wrpr	%r22, 0x0065, %tt
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 2349: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfd3c8000  ! 2350: STDF_R	std	%f30, [%r0, %r18]
	.word 0x819460db  ! 2351: WRPR_TPC_I	wrpr	%r17, 0x00db, %tpc
	.word 0xb1508000  ! 2353: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf2258000  ! 2354: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb7518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	.word 0xff3d4000  ! 2357: STDF_R	std	%f31, [%r0, %r21]
	setx	data_start_4, %g1, %r23
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c0000  ! 2365: STD_R	std	%r27, [%r16 + %r0]
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e09  ! 2369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e09, %hpstate
	.word 0xbd540000  ! 2370: RDPR_GL	rdpr	%-, %r30
	setx	0x20134, %g1, %o0
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
	.word 0xb7508000  ! 2376: RDPR_TSTATE	<illegal instruction>
	.word 0xfe2521b3  ! 2378: STW_I	stw	%r31, [%r20 + 0x01b3]
	.word 0xf53da0cf  ! 2381: STDF_I	std	%f26, [0x00cf, %r22]
	.word 0xb7504000  ! 2382: RDPR_TNPC	<illegal instruction>
	.word 0xf4758000  ! 2385: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf8242153  ! 2388: STW_I	stw	%r28, [%r16 + 0x0153]
	ta	T_CHANGE_HPRIV
	.word 0x81982f41  ! 2392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	.word 0xf874c000  ! 2393: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf8358000  ! 2396: STH_R	sth	%r28, [%r22 + %r0]
	.word 0x839560b0  ! 2397: WRPR_TNPC_I	wrpr	%r21, 0x00b0, %tnpc
	mov	2, %r12
	.word 0x8f932000  ! 2400: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf22ca0d5  ! 2406: STB_I	stb	%r25, [%r18 + 0x00d5]
	ta	T_CHANGE_HPRIV
	.word 0x81982a0b  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0xf22d6123  ! 2410: STB_I	stb	%r25, [%r21 + 0x0123]
	.word 0xf235c000  ! 2411: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfd3cc000  ! 2412: STDF_R	std	%f30, [%r0, %r19]
	.word 0xb9480000  ! 2413: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf33d4000  ! 2414: STDF_R	std	%f25, [%r0, %r21]
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc34a160  ! 2418: ORN_I	orn 	%r18, 0x0160, %r30
	.word 0xf0354000  ! 2424: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfa3ce084  ! 2425: STD_I	std	%r29, [%r19 + 0x0084]
	.word 0xb5508000  ! 2426: RDPR_TSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 2429: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6758000  ! 2431: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfa3dc000  ! 2433: STD_R	std	%r29, [%r23 + %r0]
	.word 0xb73ce001  ! 2439: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xfe244000  ! 2441: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xbf520000  ! 2450: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf42d6123  ! 2452: STB_I	stb	%r26, [%r21 + 0x0123]
	.word 0xb150c000  ! 2454: RDPR_TT	<illegal instruction>
	.word 0xb3510000  ! 2456: RDPR_TICK	<illegal instruction>
	.word 0xf6244000  ! 2460: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xbc254000  ! 2465: SUB_R	sub 	%r21, %r0, %r30
	.word 0xf13cc000  ! 2469: STDF_R	std	%f24, [%r0, %r19]
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2472: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb4048000  ! 2474: ADD_R	add 	%r18, %r0, %r26
	.word 0xf93c0000  ! 2475: STDF_R	std	%f28, [%r0, %r16]
	.word 0x859561fb  ! 2477: WRPR_TSTATE_I	wrpr	%r21, 0x01fb, %tstate
	.word 0xb9480000  ! 2478: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa2dc000  ! 2482: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf425a1db  ! 2483: STW_I	stw	%r26, [%r22 + 0x01db]
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 2484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0xf8748000  ! 2485: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf275e1bf  ! 2488: STX_I	stx	%r25, [%r23 + 0x01bf]
	ta	T_CHANGE_HPRIV
	.word 0x81983f43  ! 2490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f43, %hpstate
	.word 0xf8358000  ! 2493: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xbe0d219f  ! 2497: AND_I	and 	%r20, 0x019f, %r31
	.word 0xf6344000  ! 2500: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf074e0e5  ! 2502: STX_I	stx	%r24, [%r19 + 0x00e5]
	.word 0xf634e192  ! 2504: STH_I	sth	%r27, [%r19 + 0x0192]
	.word 0xf0248000  ! 2507: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf53cc000  ! 2510: STDF_R	std	%f26, [%r0, %r19]
	.word 0xbb480000  ! 2515: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_4, %g1, %r21
	.word 0xf03ca050  ! 2521: STD_I	std	%r24, [%r18 + 0x0050]
	.word 0x919560df  ! 2523: WRPR_PIL_I	wrpr	%r21, 0x00df, %pil
	setx	0x25, %g1, %o0
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
	.word 0x8595e062  ! 2531: WRPR_TSTATE_I	wrpr	%r23, 0x0062, %tstate
	.word 0x8394200e  ! 2532: WRPR_TNPC_I	wrpr	%r16, 0x000e, %tnpc
	.word 0xf235e072  ! 2537: STH_I	sth	%r25, [%r23 + 0x0072]
	setx	data_start_6, %g1, %r18
	.word 0x8794a08a  ! 2541: WRPR_TT_I	wrpr	%r18, 0x008a, %tt
	.word 0xf23c2176  ! 2546: STD_I	std	%r25, [%r16 + 0x0176]
	.word 0xf93de042  ! 2549: STDF_I	std	%f28, [0x0042, %r23]
	.word 0xf824a19e  ! 2552: STW_I	stw	%r28, [%r18 + 0x019e]
	.word 0xb5508000  ! 2553: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfa34a0f2  ! 2556: STH_I	sth	%r29, [%r18 + 0x00f2]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc742039  ! 2559: STX_I	stx	%r30, [%r16 + 0x0039]
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 2578: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf8342017  ! 2585: STH_I	sth	%r28, [%r16 + 0x0017]
	.word 0x8795e182  ! 2586: WRPR_TT_I	wrpr	%r23, 0x0182, %tt
	.word 0xf03561c3  ! 2591: STH_I	sth	%r24, [%r21 + 0x01c3]
	.word 0xf4748000  ! 2596: STX_R	stx	%r26, [%r18 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94e0c9  ! 2603: WRPR_PSTATE_I	wrpr	%r19, 0x00c9, %pstate
	.word 0x8195a034  ! 2607: WRPR_TPC_I	wrpr	%r22, 0x0034, %tpc
	.word 0xbf520000  ! 2608: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf93c4000  ! 2609: STDF_R	std	%f28, [%r0, %r17]
	.word 0xbd504000  ! 2610: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0x3032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 2612: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf83c6013  ! 2613: STD_I	std	%r28, [%r17 + 0x0013]
	.word 0xb7518000  ! 2614: RDPR_PSTATE	<illegal instruction>
	.word 0xf034e19b  ! 2615: STH_I	sth	%r24, [%r19 + 0x019b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xb9510000  ! 2622: RDPR_TICK	rdpr	%tick, %r28
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd355000  ! 2624: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xf22de0d5  ! 2630: STB_I	stb	%r25, [%r23 + 0x00d5]
	.word 0xff3dc000  ! 2633: STDF_R	std	%f31, [%r0, %r23]
	.word 0xf22c4000  ! 2637: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfa3d2031  ! 2638: STD_I	std	%r29, [%r20 + 0x0031]
	.word 0xf03ce1a4  ! 2640: STD_I	std	%r24, [%r19 + 0x01a4]
	.word 0xf835a045  ! 2641: STH_I	sth	%r28, [%r22 + 0x0045]
	.word 0xba35c000  ! 2646: ORN_R	orn 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2256113  ! 2648: STW_I	stw	%r25, [%r21 + 0x0113]
	.word 0xfc342156  ! 2650: STH_I	sth	%r30, [%r16 + 0x0156]
	.word 0xfa758000  ! 2651: STX_R	stx	%r29, [%r22 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 2652: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc758000  ! 2658: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf13cc000  ! 2665: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfc7420e9  ! 2667: STX_I	stx	%r30, [%r16 + 0x00e9]
	.word 0xf63da18c  ! 2675: STD_I	std	%r27, [%r22 + 0x018c]
	.word 0xf074c000  ! 2681: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfe3da113  ! 2682: STD_I	std	%r31, [%r22 + 0x0113]
	.word 0xfc2d0000  ! 2683: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xbf510000  ! 2685: RDPR_TICK	rdpr	%tick, %r31
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42da0cf  ! 2692: STB_I	stb	%r26, [%r22 + 0x00cf]
	.word 0xf23d0000  ! 2698: STD_R	std	%r25, [%r20 + %r0]
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	setx	data_start_4, %g1, %r16
	setx	0x30320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 2711: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf874e0da  ! 2713: STX_I	stx	%r28, [%r19 + 0x00da]
	.word 0xf43c8000  ! 2715: STD_R	std	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf225a1e6  ! 2717: STW_I	stw	%r25, [%r22 + 0x01e6]
	.word 0xfa34a08a  ! 2719: STH_I	sth	%r29, [%r18 + 0x008a]
	.word 0xbd510000  ! 2722: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfc2c4000  ! 2725: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf635e13a  ! 2726: STH_I	sth	%r27, [%r23 + 0x013a]
	.word 0xf53da179  ! 2733: STDF_I	std	%f26, [0x0179, %r22]
	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2741: RDPR_GL	<illegal instruction>
	.word 0xfc758000  ! 2742: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfb3d8000  ! 2743: STDF_R	std	%f29, [%r0, %r22]
	.word 0xb3518000  ! 2748: RDPR_PSTATE	<illegal instruction>
	.word 0xfa2d600b  ! 2752: STB_I	stb	%r29, [%r21 + 0x000b]
	.word 0xf83c6107  ! 2753: STD_I	std	%r28, [%r17 + 0x0107]
	ta	T_CHANGE_HPRIV
	.word 0x81983a41  ! 2755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a41, %hpstate
	.word 0xf33c6011  ! 2756: STDF_I	std	%f25, [0x0011, %r17]
	setx	data_start_5, %g1, %r18
	setx	0x20135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa35a0eb  ! 2761: STH_I	sth	%r29, [%r22 + 0x00eb]
	.word 0xfa2d8000  ! 2763: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xb5540000  ! 2764: RDPR_GL	rdpr	%-, %r26
	.word 0xfa3de0b9  ! 2765: STD_I	std	%r29, [%r23 + 0x00b9]
	.word 0xfa25e0ab  ! 2767: STW_I	stw	%r29, [%r23 + 0x00ab]
	.word 0xf82c212b  ! 2769: STB_I	stb	%r28, [%r16 + 0x012b]
	.word 0xf4750000  ! 2773: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xb150c000  ! 2776: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 2777: RDPR_TPC	<illegal instruction>
	.word 0xf33d4000  ! 2778: STDF_R	std	%f25, [%r0, %r21]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r22
	.word 0xb5504000  ! 2783: RDPR_TNPC	<illegal instruction>
	.word 0xf075a05a  ! 2784: STX_I	stx	%r24, [%r22 + 0x005a]
	.word 0xbf508000  ! 2787: RDPR_TSTATE	<illegal instruction>
	.word 0xb351c000  ! 2791: RDPR_TL	<illegal instruction>
	.word 0x879560a3  ! 2792: WRPR_TT_I	wrpr	%r21, 0x00a3, %tt
	.word 0xbe24a18c  ! 2802: SUB_I	sub 	%r18, 0x018c, %r31
	.word 0xfc75e042  ! 2807: STX_I	stx	%r30, [%r23 + 0x0042]
	.word 0xb351c000  ! 2812: RDPR_TL	rdpr	%tl, %r25
	.word 0x919520d4  ! 2815: WRPR_PIL_I	wrpr	%r20, 0x00d4, %pil
	.word 0x8995a174  ! 2816: WRPR_TICK_I	wrpr	%r22, 0x0174, %tick
	ta	T_CHANGE_HPRIV
	.word 0x8198380b  ! 2820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180b, %hpstate
	.word 0xf2256021  ! 2825: STW_I	stw	%r25, [%r21 + 0x0021]
	.word 0xbf508000  ! 2826: RDPR_TSTATE	rdpr	%tstate, %r31
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23ce10b  ! 2830: STD_I	std	%r25, [%r19 + 0x010b]
	.word 0xb9504000  ! 2835: RDPR_TNPC	<illegal instruction>
	.word 0xf8742105  ! 2837: STX_I	stx	%r28, [%r16 + 0x0105]
	.word 0xf63d4000  ! 2839: STD_R	std	%r27, [%r21 + %r0]
	setx	0x10321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13c4000  ! 2847: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf0256192  ! 2850: STW_I	stw	%r24, [%r21 + 0x0192]
	.word 0x8d95a003  ! 2852: WRPR_PSTATE_I	wrpr	%r22, 0x0003, %pstate
	.word 0x8995e0ad  ! 2853: WRPR_TICK_I	wrpr	%r23, 0x00ad, %tick
	.word 0xf6240000  ! 2856: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf8344000  ! 2858: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf62c0000  ! 2859: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf8244000  ! 2860: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xfc3c4000  ! 2864: STD_R	std	%r30, [%r17 + %r0]
	.word 0xff3ca006  ! 2865: STDF_I	std	%f31, [0x0006, %r18]
	.word 0xbf50c000  ! 2867: RDPR_TT	rdpr	%tt, %r31
	mov	2, %r12
	.word 0x8f932000  ! 2875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe74e1e8  ! 2878: STX_I	stx	%r31, [%r19 + 0x01e8]
	.word 0xf83ce1a6  ! 2879: STD_I	std	%r28, [%r19 + 0x01a6]
	.word 0xf03c4000  ! 2880: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb33d1000  ! 2881: SRAX_R	srax	%r20, %r0, %r25
	.word 0xbb7dc400  ! 2882: MOVR_R	movre	%r23, %r0, %r29
	.word 0xf33cc000  ! 2884: STDF_R	std	%f25, [%r0, %r19]
	.word 0xba05e154  ! 2885: ADD_I	add 	%r23, 0x0154, %r29
	.word 0xf4240000  ! 2887: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbf35e001  ! 2890: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xfa7521e2  ! 2891: STX_I	stx	%r29, [%r20 + 0x01e2]
	.word 0xfc254000  ! 2892: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xfa3560fe  ! 2893: STH_I	sth	%r29, [%r21 + 0x00fe]
	.word 0xbb508000  ! 2895: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xfc75a022  ! 2897: STX_I	stx	%r30, [%r22 + 0x0022]
	.word 0x89956164  ! 2905: WRPR_TICK_I	wrpr	%r21, 0x0164, %tick
	.word 0x9195e0a4  ! 2908: WRPR_PIL_I	wrpr	%r23, 0x00a4, %pil
	.word 0xb1500000  ! 2910: RDPR_TPC	rdpr	%tpc, %r24
	setx	0x30238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf83c61f1  ! 2918: STD_I	std	%r28, [%r17 + 0x01f1]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	.word 0xfc3461c8  ! 2927: STH_I	sth	%r30, [%r17 + 0x01c8]
	.word 0xfb3ce008  ! 2930: STDF_I	std	%f29, [0x0008, %r19]
	.word 0xf4758000  ! 2935: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb63d8000  ! 2937: XNOR_R	xnor 	%r22, %r0, %r27
	setx	data_start_4, %g1, %r22
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	.word 0xbd3ca001  ! 2941: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0xf2754000  ! 2943: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf424c000  ! 2946: STW_R	stw	%r26, [%r19 + %r0]
	.word 0x8395a0fd  ! 2947: WRPR_TNPC_I	wrpr	%r22, 0x00fd, %tnpc
	.word 0xb53cc000  ! 2948: SRA_R	sra 	%r19, %r0, %r26
	.word 0xf635c000  ! 2949: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf83c0000  ! 2950: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf8254000  ! 2952: STW_R	stw	%r28, [%r21 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 2953: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf03d8000  ! 2954: STD_R	std	%r24, [%r22 + %r0]
	setx	0x32b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa24206e  ! 2957: STW_I	stw	%r29, [%r16 + 0x006e]
	.word 0xfa748000  ! 2958: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbb540000  ! 2959: RDPR_GL	rdpr	%-, %r29
	.word 0xb3510000  ! 2960: RDPR_TICK	<illegal instruction>
	.word 0xb3510000  ! 2962: RDPR_TICK	<illegal instruction>
	.word 0xbb50c000  ! 2964: RDPR_TT	<illegal instruction>
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbac520ee  ! 2971: ADDCcc_I	addccc 	%r20, 0x00ee, %r29
	.word 0xf43d614d  ! 2972: STD_I	std	%r26, [%r21 + 0x014d]
	.word 0xbf500000  ! 2977: RDPR_TPC	<illegal instruction>
	.word 0xf27420ff  ! 2978: STX_I	stx	%r25, [%r16 + 0x00ff]
	.word 0xb21ce01a  ! 2984: XOR_I	xor 	%r19, 0x001a, %r25
	.word 0xf2258000  ! 2985: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf4748000  ! 2989: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xbd7d0400  ! 2992: MOVR_R	movre	%r20, %r0, %r30
	.word 0xf2246117  ! 2993: STW_I	stw	%r25, [%r17 + 0x0117]
	.word 0xf93de1ac  ! 2997: STDF_I	std	%f28, [0x01ac, %r23]
	setx	0x127, %g1, %o0
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
	.word 0xbac460c7  ! 3007: ADDCcc_I	addccc 	%r17, 0x00c7, %r29
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 3009: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfa2ca0e4  ! 3014: STB_I	stb	%r29, [%r18 + 0x00e4]
	.word 0xfc3ca029  ! 3015: STD_I	std	%r30, [%r18 + 0x0029]
	.word 0xbe2ce021  ! 3019: ANDN_I	andn 	%r19, 0x0021, %r31
	.word 0x85952099  ! 3022: WRPR_TSTATE_I	wrpr	%r20, 0x0099, %tstate
	.word 0xf2350000  ! 3025: STH_R	sth	%r25, [%r20 + %r0]
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 3051: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfb3cc000  ! 3053: STDF_R	std	%f29, [%r0, %r19]
	.word 0x91956112  ! 3055: WRPR_PIL_I	wrpr	%r21, 0x0112, %pil
	.word 0x8d9521cf  ! 3058: WRPR_PSTATE_I	wrpr	%r20, 0x01cf, %pstate
	.word 0xf13da056  ! 3060: STDF_I	std	%f24, [0x0056, %r22]
	.word 0xb824a006  ! 3062: SUB_I	sub 	%r18, 0x0006, %r28
	setx	0x2000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c4000  ! 3065: STDF_R	std	%f26, [%r0, %r17]
	.word 0xbd480000  ! 3066: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa3d8000  ! 3068: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfb3dc000  ! 3071: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf475c000  ! 3072: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xfc74c000  ! 3074: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfb3d2067  ! 3082: STDF_I	std	%f29, [0x0067, %r20]
	.word 0xfe752193  ! 3084: STX_I	stx	%r31, [%r20 + 0x0193]
	.word 0xbd520000  ! 3085: RDPR_PIL	<illegal instruction>
	.word 0xfe2da1bf  ! 3086: STB_I	stb	%r31, [%r22 + 0x01bf]
	.word 0xf424c000  ! 3088: STW_R	stw	%r26, [%r19 + %r0]
	.word 0x81942195  ! 3089: WRPR_TPC_I	wrpr	%r16, 0x0195, %tpc
	.word 0xf63de1b3  ! 3090: STD_I	std	%r27, [%r23 + 0x01b3]
	.word 0xfd3da16a  ! 3093: STDF_I	std	%f30, [0x016a, %r22]
	.word 0xf82d217a  ! 3094: STB_I	stb	%r28, [%r20 + 0x017a]
	.word 0xf075a01e  ! 3097: STX_I	stx	%r24, [%r22 + 0x001e]
	.word 0x9194e025  ! 3098: WRPR_PIL_I	wrpr	%r19, 0x0025, %pil
	.word 0xf22c2026  ! 3107: STB_I	stb	%r25, [%r16 + 0x0026]
	.word 0xf63cc000  ! 3108: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf33d4000  ! 3109: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf63c0000  ! 3111: STD_R	std	%r27, [%r16 + %r0]
	.word 0xfc3d0000  ! 3114: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf93d4000  ! 3118: STDF_R	std	%f28, [%r0, %r21]
	.word 0xfe25e16b  ! 3119: STW_I	stw	%r31, [%r23 + 0x016b]
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 3121: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf73c60f5  ! 3125: STDF_I	std	%f27, [0x00f5, %r17]
	setx	data_start_3, %g1, %r19
	.word 0xbb518000  ! 3130: RDPR_PSTATE	rdpr	%pstate, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xfc3c0000  ! 3133: STD_R	std	%r30, [%r16 + %r0]
	.word 0xb1540000  ! 3135: RDPR_GL	rdpr	%-, %r24
	.word 0xfa3d8000  ! 3144: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf93ca083  ! 3153: STDF_I	std	%f28, [0x0083, %r18]
	.word 0xb751c000  ! 3156: RDPR_TL	rdpr	%tl, %r27
	.word 0xbd480000  ! 3157: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf035c000  ! 3163: STH_R	sth	%r24, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 3168: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d9561d8  ! 3170: WRPR_PSTATE_I	wrpr	%r21, 0x01d8, %pstate
	.word 0xfa258000  ! 3172: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfc2c60ea  ! 3175: STB_I	stb	%r30, [%r17 + 0x00ea]
	.word 0xbe35a08f  ! 3177: SUBC_I	orn 	%r22, 0x008f, %r31
	.word 0xb5504000  ! 3179: RDPR_TNPC	rdpr	%tnpc, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e49  ! 3181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0xb3504000  ! 3183: RDPR_TNPC	rdpr	%tnpc, %r25
	mov	1, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d0000  ! 3192: STD_R	std	%r30, [%r20 + %r0]
	setx	data_start_2, %g1, %r22
	.word 0xf43ce1a7  ! 3196: STD_I	std	%r26, [%r19 + 0x01a7]
	.word 0xb1504000  ! 3198: RDPR_TNPC	rdpr	%tnpc, %r24
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb13d0000  ! 3205: SRA_R	sra 	%r20, %r0, %r24
	.word 0xf63d60de  ! 3207: STD_I	std	%r27, [%r21 + 0x00de]
	.word 0xf8744000  ! 3209: STX_R	stx	%r28, [%r17 + %r0]
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d99  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d99, %hpstate
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63da0fb  ! 3219: STD_I	std	%r27, [%r22 + 0x00fb]
	.word 0xbab4c000  ! 3221: ORNcc_R	orncc 	%r19, %r0, %r29
	.word 0xfe74a084  ! 3223: STX_I	stx	%r31, [%r18 + 0x0084]
	.word 0xb8ac8000  ! 3226: ANDNcc_R	andncc 	%r18, %r0, %r28
	setx	0x1030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	.word 0xf63c6197  ! 3240: STD_I	std	%r27, [%r17 + 0x0197]
	.word 0xfe254000  ! 3241: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xb5510000  ! 3242: RDPR_TICK	rdpr	%tick, %r26
	.word 0xbb34f001  ! 3243: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xfc34e122  ! 3244: STH_I	sth	%r30, [%r19 + 0x0122]
	.word 0xb3480000  ! 3247: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfb3c0000  ! 3253: STDF_R	std	%f29, [%r0, %r16]
	mov	1, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9510000  ! 3270: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf434a177  ! 3271: STH_I	sth	%r26, [%r18 + 0x0177]
	.word 0xb2ad4000  ! 3272: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xf02d0000  ! 3274: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf13ca0ec  ! 3275: STDF_I	std	%f24, [0x00ec, %r18]
	.word 0xf234c000  ! 3282: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xff3d0000  ! 3284: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf8344000  ! 3289: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xfe2d4000  ! 3291: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xbb508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xba1da01b  ! 3297: XOR_I	xor 	%r22, 0x001b, %r29
	.word 0xfb3d4000  ! 3298: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf63c4000  ! 3301: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf83d4000  ! 3306: STD_R	std	%r28, [%r21 + %r0]
	.word 0xfe3c20ab  ! 3310: STD_I	std	%r31, [%r16 + 0x00ab]
	.word 0xfe35a098  ! 3311: STH_I	sth	%r31, [%r22 + 0x0098]
	.word 0xfa344000  ! 3315: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf4352169  ! 3319: STH_I	sth	%r26, [%r20 + 0x0169]
	.word 0xb2c42136  ! 3323: ADDCcc_I	addccc 	%r16, 0x0136, %r25
	.word 0xb08c6143  ! 3326: ANDcc_I	andcc 	%r17, 0x0143, %r24
	setx	data_start_4, %g1, %r23
	.word 0xbe04c000  ! 3328: ADD_R	add 	%r19, %r0, %r31
	.word 0xf23da0ab  ! 3333: STD_I	std	%r25, [%r22 + 0x00ab]
	.word 0xb6bc20a2  ! 3335: XNORcc_I	xnorcc 	%r16, 0x00a2, %r27
	.word 0xfc244000  ! 3336: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xfa2c4000  ! 3338: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf034a060  ! 3340: STH_I	sth	%r24, [%r18 + 0x0060]
	.word 0xb550c000  ! 3344: RDPR_TT	<illegal instruction>
	.word 0xf0740000  ! 3345: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xfc3d4000  ! 3346: STD_R	std	%r30, [%r21 + %r0]
	.word 0xfa3cc000  ! 3350: STD_R	std	%r29, [%r19 + %r0]
	.word 0xb6154000  ! 3352: OR_R	or 	%r21, %r0, %r27
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d4000  ! 3361: STD_R	std	%r26, [%r21 + %r0]
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa74a0f4  ! 3370: STX_I	stx	%r29, [%r18 + 0x00f4]
	.word 0xfa35a16e  ! 3371: STH_I	sth	%r29, [%r22 + 0x016e]
	.word 0x8794e087  ! 3372: WRPR_TT_I	wrpr	%r19, 0x0087, %tt
	.word 0xf82c4000  ! 3374: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf82c61f4  ! 3378: STB_I	stb	%r28, [%r17 + 0x01f4]
	.word 0xfe35c000  ! 3381: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf43c2132  ! 3382: STD_I	std	%r26, [%r16 + 0x0132]
	.word 0xbf520000  ! 3384: RDPR_PIL	rdpr	%pil, %r31
	.word 0xb7508000  ! 3385: RDPR_TSTATE	<illegal instruction>
	.word 0xfe74e0b7  ! 3387: STX_I	stx	%r31, [%r19 + 0x00b7]
	.word 0xb151c000  ! 3388: RDPR_TL	<illegal instruction>
	.word 0xba34200b  ! 3389: SUBC_I	orn 	%r16, 0x000b, %r29
	.word 0xfe3dc000  ! 3391: STD_R	std	%r31, [%r23 + %r0]
	setx	0x10224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc348000  ! 3400: STH_R	sth	%r30, [%r18 + %r0]
	.word 0x8394616f  ! 3402: WRPR_TNPC_I	wrpr	%r17, 0x016f, %tnpc
	.word 0xf93c2140  ! 3405: STDF_I	std	%f28, [0x0140, %r16]
	.word 0xb6b5e09b  ! 3406: ORNcc_I	orncc 	%r23, 0x009b, %r27
	.word 0xf62ce199  ! 3413: STB_I	stb	%r27, [%r19 + 0x0199]
	setx	data_start_4, %g1, %r23
	.word 0xb134a001  ! 3421: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xf33d6181  ! 3422: STDF_I	std	%f25, [0x0181, %r21]
	.word 0xb751c000  ! 3424: RDPR_TL	rdpr	%tl, %r27
	.word 0xf0744000  ! 3427: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf03ca11c  ! 3434: STD_I	std	%r24, [%r18 + 0x011c]
	.word 0xb9641800  ! 3448: MOVcc_R	<illegal instruction>
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81982889  ! 3456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0xff3ce0c4  ! 3457: STDF_I	std	%f31, [0x00c4, %r19]
	.word 0xf074e116  ! 3460: STX_I	stx	%r24, [%r19 + 0x0116]
	.word 0xf53d21ff  ! 3461: STDF_I	std	%f26, [0x01ff, %r20]
	.word 0x8394a0f4  ! 3465: WRPR_TNPC_I	wrpr	%r18, 0x00f4, %tnpc
	.word 0xf6250000  ! 3466: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb3504000  ! 3469: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf62de131  ! 3470: STB_I	stb	%r27, [%r23 + 0x0131]
	.word 0xfc35a144  ! 3477: STH_I	sth	%r30, [%r22 + 0x0144]
	.word 0xfb3ce133  ! 3480: STDF_I	std	%f29, [0x0133, %r19]
	.word 0xb7510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xfe2ce130  ! 3488: STB_I	stb	%r31, [%r19 + 0x0130]
	.word 0xb9508000  ! 3490: RDPR_TSTATE	<illegal instruction>
	.word 0x81952161  ! 3491: WRPR_TPC_I	wrpr	%r20, 0x0161, %tpc
	.word 0xfe742116  ! 3493: STX_I	stx	%r31, [%r16 + 0x0116]
	.word 0xf0354000  ! 3496: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf73cc000  ! 3502: STDF_R	std	%f27, [%r0, %r19]
	ta	T_CHANGE_HPRIV
	.word 0x81982c1b  ! 3505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1b, %hpstate
	.word 0xb4bce1a3  ! 3506: XNORcc_I	xnorcc 	%r19, 0x01a3, %r26
	.word 0xb7504000  ! 3512: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfa744000  ! 3515: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xb1508000  ! 3517: RDPR_TSTATE	<illegal instruction>
	.word 0xbcbc8000  ! 3520: XNORcc_R	xnorcc 	%r18, %r0, %r30
	.word 0xf42d21c8  ! 3521: STB_I	stb	%r26, [%r20 + 0x01c8]
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43c8000  ! 3529: STD_R	std	%r26, [%r18 + %r0]
	.word 0xfe24a118  ! 3534: STW_I	stw	%r31, [%r18 + 0x0118]
	.word 0xf224e19c  ! 3535: STW_I	stw	%r25, [%r19 + 0x019c]
	.word 0xf22d4000  ! 3536: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf73dc000  ! 3537: STDF_R	std	%f27, [%r0, %r23]
	.word 0xbb518000  ! 3538: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a03  ! 3539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a03, %hpstate
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 3544: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1518000  ! 3547: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf82520c4  ! 3550: STW_I	stw	%r28, [%r20 + 0x00c4]
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r14
	.word 0xa193a000  ! 3569: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf43c0000  ! 3572: STD_R	std	%r26, [%r16 + %r0]
	.word 0xf0746040  ! 3576: STX_I	stx	%r24, [%r17 + 0x0040]
	mov	2, %r12
	.word 0x8f932000  ! 3578: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf43cc000  ! 3582: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb0b5e10d  ! 3583: SUBCcc_I	orncc 	%r23, 0x010d, %r24
	.word 0x8d9561a4  ! 3584: WRPR_PSTATE_I	wrpr	%r21, 0x01a4, %pstate
	.word 0xb8a420d7  ! 3587: SUBcc_I	subcc 	%r16, 0x00d7, %r28
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b03  ! 3591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b03, %hpstate
	.word 0xfd3d0000  ! 3592: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf33d8000  ! 3594: STDF_R	std	%f25, [%r0, %r22]
	.word 0xbb3d2001  ! 3595: SRA_I	sra 	%r20, 0x0001, %r29
	.word 0xbe858000  ! 3596: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0xb7518000  ! 3598: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbb500000  ! 3600: RDPR_TPC	<illegal instruction>
	.word 0xf0240000  ! 3607: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfa34e075  ! 3612: STH_I	sth	%r29, [%r19 + 0x0075]
	.word 0xfc7420a9  ! 3613: STX_I	stx	%r30, [%r16 + 0x00a9]
	.word 0xb3510000  ! 3615: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3616: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf6254000  ! 3617: STW_R	stw	%r27, [%r21 + %r0]
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03c8000  ! 3621: STD_R	std	%r24, [%r18 + %r0]
	.word 0x859421d6  ! 3627: WRPR_TSTATE_I	wrpr	%r16, 0x01d6, %tstate
	setx	0x1022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce011  ! 3632: STD_I	std	%r30, [%r19 + 0x0011]
	setx	0x30031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb57da401  ! 3638: MOVR_I	movre	%r22, 0x1, %r26
	.word 0xb6bd60f1  ! 3640: XNORcc_I	xnorcc 	%r21, 0x00f1, %r27
	.word 0xfe3d4000  ! 3641: STD_R	std	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf874c000  ! 3645: STX_R	stx	%r28, [%r19 + %r0]
	setx	0x33, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 3648: RDPR_TL	rdpr	%tl, %r30
	.word 0xf42ce0ed  ! 3649: STB_I	stb	%r26, [%r19 + 0x00ed]
	.word 0xf625c000  ! 3650: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf635e0b8  ! 3651: STH_I	sth	%r27, [%r23 + 0x00b8]
	.word 0xf2340000  ! 3653: STH_R	sth	%r25, [%r16 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 3655: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6942056  ! 3658: ORcc_I	orcc 	%r16, 0x0056, %r27
	.word 0xf2744000  ! 3659: STX_R	stx	%r25, [%r17 + %r0]
	.word 0x91946159  ! 3664: WRPR_PIL_I	wrpr	%r17, 0x0159, %pil
	.word 0xfe74e1bb  ! 3669: STX_I	stx	%r31, [%r19 + 0x01bb]
	.word 0x8d946162  ! 3671: WRPR_PSTATE_I	wrpr	%r17, 0x0162, %pstate
	.word 0xf43c6140  ! 3672: STD_I	std	%r26, [%r17 + 0x0140]
	mov	2, %r12
	.word 0x8f932000  ! 3673: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd518000  ! 3680: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfa24c000  ! 3681: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf23d60aa  ! 3682: STD_I	std	%r25, [%r21 + 0x00aa]
	.word 0xfc34c000  ! 3684: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf62d0000  ! 3687: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf03d20f5  ! 3688: STD_I	std	%r24, [%r20 + 0x00f5]
	.word 0xf674c000  ! 3689: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfa2de0ba  ! 3691: STB_I	stb	%r29, [%r23 + 0x00ba]
	.word 0xb150c000  ! 3692: RDPR_TT	<illegal instruction>
	.word 0xb415200e  ! 3693: OR_I	or 	%r20, 0x000e, %r26
	.word 0xf4748000  ! 3697: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf13cc000  ! 3700: STDF_R	std	%f24, [%r0, %r19]
	.word 0xf63561a8  ! 3704: STH_I	sth	%r27, [%r21 + 0x01a8]
	ta	T_CHANGE_HPRIV
	.word 0x81983a9b  ! 3707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9b, %hpstate
	.word 0xf62cc000  ! 3711: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xb0b54000  ! 3713: SUBCcc_R	orncc 	%r21, %r0, %r24
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4740000  ! 3718: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb7510000  ! 3719: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf075c000  ! 3723: STX_R	stx	%r24, [%r23 + %r0]
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 3725: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa24e04a  ! 3727: STW_I	stw	%r29, [%r19 + 0x004a]
	.word 0xf635a0b8  ! 3730: STH_I	sth	%r27, [%r22 + 0x00b8]
	.word 0xfc34619b  ! 3732: STH_I	sth	%r30, [%r17 + 0x019b]
	setx	0x1022f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 3734: STX_R	stx	%r31, [%r22 + %r0]
	.word 0x85942162  ! 3735: WRPR_TSTATE_I	wrpr	%r16, 0x0162, %tstate
	.word 0xbd540000  ! 3739: RDPR_GL	rdpr	%-, %r30
	.word 0xba84e1f4  ! 3741: ADDcc_I	addcc 	%r19, 0x01f4, %r29
	.word 0xf42c20b6  ! 3742: STB_I	stb	%r26, [%r16 + 0x00b6]
	.word 0xb68d4000  ! 3745: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xfe744000  ! 3746: STX_R	stx	%r31, [%r17 + %r0]
	.word 0x89956147  ! 3752: WRPR_TICK_I	wrpr	%r21, 0x0147, %tick
	.word 0xfa258000  ! 3753: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xb9508000  ! 3754: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf4258000  ! 3757: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf2758000  ! 3758: STX_R	stx	%r25, [%r22 + %r0]
	setx	0x206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d6194  ! 3764: STDF_I	std	%f29, [0x0194, %r21]
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 3766: RDPR_PIL	rdpr	%pil, %r25
	.word 0xbd50c000  ! 3767: RDPR_TT	<illegal instruction>
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 3771: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf03c8000  ! 3773: STD_R	std	%r24, [%r18 + %r0]
	setx	0x20104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2d60de  ! 3777: STB_I	stb	%r31, [%r21 + 0x00de]
	.word 0xf075e0ab  ! 3780: STX_I	stx	%r24, [%r23 + 0x00ab]
	setx	data_start_4, %g1, %r17
	.word 0xb9518000  ! 3782: RDPR_PSTATE	<illegal instruction>
	.word 0xfc348000  ! 3784: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf635a1f5  ! 3786: STH_I	sth	%r27, [%r22 + 0x01f5]
	.word 0xf2754000  ! 3788: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xbea50000  ! 3792: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xfb3d4000  ! 3795: STDF_R	std	%f29, [%r0, %r21]
	.word 0xf02ce08d  ! 3796: STB_I	stb	%r24, [%r19 + 0x008d]
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3d8000  ! 3810: STDF_R	std	%f29, [%r0, %r22]
	.word 0xfc3d0000  ! 3812: STD_R	std	%r30, [%r20 + %r0]
	.word 0xfb3c6166  ! 3815: STDF_I	std	%f29, [0x0166, %r17]
	ta	T_CHANGE_HPRIV
	.word 0x8198385b  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185b, %hpstate
	.word 0xf93d0000  ! 3821: STDF_R	std	%f28, [%r0, %r20]
	.word 0xb7480000  ! 3823: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_3, %g1, %r17
	.word 0xfc750000  ! 3827: STX_R	stx	%r30, [%r20 + %r0]
	.word 0x8d94e17f  ! 3830: WRPR_PSTATE_I	wrpr	%r19, 0x017f, %pstate
	.word 0xb9480000  ! 3833: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf6744000  ! 3834: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xb5540000  ! 3835: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 3838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xfc2ca1b1  ! 3839: STB_I	stb	%r30, [%r18 + 0x01b1]
	.word 0xfc2c60f6  ! 3841: STB_I	stb	%r30, [%r17 + 0x00f6]
	.word 0x83956127  ! 3843: WRPR_TNPC_I	wrpr	%r21, 0x0127, %tnpc
	.word 0x8795a025  ! 3844: WRPR_TT_I	wrpr	%r22, 0x0025, %tt
	.word 0xf8240000  ! 3848: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xbd50c000  ! 3851: RDPR_TT	rdpr	%tt, %r30
	.word 0xf225c000  ! 3854: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf13da030  ! 3856: STDF_I	std	%f24, [0x0030, %r22]
	ta	T_CHANGE_HPRIV
	.word 0x81983f83  ! 3857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xb0bd0000  ! 3861: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xf23de166  ! 3862: STD_I	std	%r25, [%r23 + 0x0166]
	.word 0xfd3d6194  ! 3863: STDF_I	std	%f30, [0x0194, %r21]
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 3867: RDPR_TT	rdpr	%tt, %r26
	.word 0xf234c000  ! 3871: STH_R	sth	%r25, [%r19 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 3873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85956103  ! 3874: WRPR_TSTATE_I	wrpr	%r21, 0x0103, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x8198299b  ! 3878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0xf8252170  ! 3881: STW_I	stw	%r28, [%r20 + 0x0170]
	.word 0xf4740000  ! 3882: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xfc2c6185  ! 3883: STB_I	stb	%r30, [%r17 + 0x0185]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf025e121  ! 3890: STW_I	stw	%r24, [%r23 + 0x0121]
	.word 0xfe2ce1d1  ! 3891: STB_I	stb	%r31, [%r19 + 0x01d1]
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	.word 0xb33c4000  ! 3895: SRA_R	sra 	%r17, %r0, %r25
	.word 0xf03dc000  ! 3897: STD_R	std	%r24, [%r23 + %r0]
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 3900: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf8248000  ! 3901: STW_R	stw	%r28, [%r18 + %r0]
	setx	0x215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0350000  ! 3907: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb5504000  ! 3908: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfe2c6125  ! 3912: STB_I	stb	%r31, [%r17 + 0x0125]
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 3914: STW_R	stw	%r29, [%r16 + %r0]
	.word 0x89956069  ! 3916: WRPR_TICK_I	wrpr	%r21, 0x0069, %tick
	.word 0xf93ca073  ! 3917: STDF_I	std	%f28, [0x0073, %r18]
	.word 0xf4240000  ! 3920: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfb3d8000  ! 3926: STDF_R	std	%f29, [%r0, %r22]
	.word 0xba056057  ! 3936: ADD_I	add 	%r21, 0x0057, %r29
	.word 0xfe750000  ! 3941: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf02c21dd  ! 3946: STB_I	stb	%r24, [%r16 + 0x01dd]
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc35a13a  ! 3952: STH_I	sth	%r30, [%r22 + 0x013a]
	setx	0x13d, %g1, %o0
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
	.word 0xbc14a05d  ! 3960: OR_I	or 	%r18, 0x005d, %r30
	setx	0x3d, %g1, %o0
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
	.word 0xbd504000  ! 3966: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x8194204c  ! 3971: WRPR_TPC_I	wrpr	%r16, 0x004c, %tpc
	.word 0xfa7420a7  ! 3972: STX_I	stx	%r29, [%r16 + 0x00a7]
	ta	T_CHANGE_HPRIV
	.word 0x81983f09  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f09, %hpstate
	.word 0xf03c8000  ! 3974: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfe3c60a2  ! 3976: STD_I	std	%r31, [%r17 + 0x00a2]
	.word 0x819520e6  ! 3979: WRPR_TPC_I	wrpr	%r20, 0x00e6, %tpc
	.word 0xba0ca00d  ! 3981: AND_I	and 	%r18, 0x000d, %r29
	.word 0xbeb520be  ! 3985: SUBCcc_I	orncc 	%r20, 0x00be, %r31
	.word 0x9195e056  ! 3987: WRPR_PIL_I	wrpr	%r23, 0x0056, %pil
	.word 0x8595a092  ! 3988: WRPR_TSTATE_I	wrpr	%r22, 0x0092, %tstate
	.word 0xfa354000  ! 3990: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb350c000  ! 3994: RDPR_TT	rdpr	%tt, %r25
	setx	0x13e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 3996: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xb5643801  ! 4000: MOVcc_I	<illegal instruction>
	setx	data_start_7, %g1, %r19
	.word 0xbebd0000  ! 4004: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xf235e010  ! 4006: STH_I	sth	%r25, [%r23 + 0x0010]
	.word 0xfe754000  ! 4007: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf62560a0  ! 4009: STW_I	stw	%r27, [%r21 + 0x00a0]
	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a0a8  ! 4013: WRPR_TPC_I	wrpr	%r18, 0x00a8, %tpc
	.word 0xff3c8000  ! 4015: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfa2560f5  ! 4017: STW_I	stw	%r29, [%r21 + 0x00f5]
	.word 0x83952098  ! 4019: WRPR_TNPC_I	wrpr	%r20, 0x0098, %tnpc
	.word 0xb7500000  ! 4020: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb7508000  ! 4023: RDPR_TSTATE	<illegal instruction>
	.word 0xfa3c8000  ! 4025: STD_R	std	%r29, [%r18 + %r0]
	setx	data_start_2, %g1, %r19
	.word 0xf93de0a3  ! 4028: STDF_I	std	%f28, [0x00a3, %r23]
	.word 0xf02c4000  ! 4030: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb12c6001  ! 4031: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xfe24a185  ! 4032: STW_I	stw	%r31, [%r18 + 0x0185]
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520cd  ! 4036: WRPR_TNPC_I	wrpr	%r20, 0x00cd, %tnpc
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 4038: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf02520bf  ! 4040: STW_I	stw	%r24, [%r20 + 0x00bf]
	.word 0xfd3c60b4  ! 4042: STDF_I	std	%f30, [0x00b4, %r17]
	.word 0xfc348000  ! 4044: STH_R	sth	%r30, [%r18 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 4045: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf235c000  ! 4049: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfa2cc000  ! 4052: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb3357001  ! 4054: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xbb50c000  ! 4055: RDPR_TT	rdpr	%tt, %r29
	.word 0xb00521e6  ! 4056: ADD_I	add 	%r20, 0x01e6, %r24
	.word 0xbf510000  ! 4057: RDPR_TICK	<illegal instruction>
	.word 0xbc35e1db  ! 4058: ORN_I	orn 	%r23, 0x01db, %r30
	.word 0xfb3d212d  ! 4060: STDF_I	std	%f29, [0x012d, %r20]
	.word 0xf63de1e5  ! 4061: STD_I	std	%r27, [%r23 + 0x01e5]
	.word 0xb695e0e7  ! 4065: ORcc_I	orcc 	%r23, 0x00e7, %r27
	.word 0xbc352115  ! 4069: SUBC_I	orn 	%r20, 0x0115, %r30
	setx	data_start_3, %g1, %r16
	setx	0x2010e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2344000  ! 4083: STH_R	sth	%r25, [%r17 + %r0]
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a0d7  ! 4089: WRPR_TSTATE_I	wrpr	%r18, 0x00d7, %tstate
	.word 0xfd3d2130  ! 4090: STDF_I	std	%f30, [0x0130, %r20]
	.word 0xb750c000  ! 4091: RDPR_TT	rdpr	%tt, %r27
	.word 0xf82dc000  ! 4094: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf2240000  ! 4096: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf53cc000  ! 4100: STDF_R	std	%f26, [%r0, %r19]
	.word 0xf33cc000  ! 4102: STDF_R	std	%f25, [%r0, %r19]
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 4104: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbb3c5000  ! 4106: SRAX_R	srax	%r17, %r0, %r29
	.word 0x8595e075  ! 4108: WRPR_TSTATE_I	wrpr	%r23, 0x0075, %tstate
	.word 0x8395a1f0  ! 4109: WRPR_TNPC_I	wrpr	%r22, 0x01f0, %tnpc
	.word 0xfe2c6100  ! 4110: STB_I	stb	%r31, [%r17 + 0x0100]
	.word 0xb7500000  ! 4112: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfc3d4000  ! 4114: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf224c000  ! 4117: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfa350000  ! 4120: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xb950c000  ! 4124: RDPR_TT	<illegal instruction>
	.word 0xfb3dc000  ! 4126: STDF_R	std	%f29, [%r0, %r23]
	.word 0xb1518000  ! 4127: RDPR_PSTATE	<illegal instruction>
	.word 0x8395e02d  ! 4128: WRPR_TNPC_I	wrpr	%r23, 0x002d, %tnpc
	.word 0xfc748000  ! 4129: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xb2c5604c  ! 4130: ADDCcc_I	addccc 	%r21, 0x004c, %r25
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d6067  ! 4134: STDF_I	std	%f27, [0x0067, %r21]
	.word 0xf0244000  ! 4137: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb5500000  ! 4144: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x1002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994603b  ! 4149: WRPR_TICK_I	wrpr	%r17, 0x003b, %tick
	.word 0xb1480000  ! 4152: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf235e10d  ! 4153: STH_I	sth	%r25, [%r23 + 0x010d]
	.word 0xf82d0000  ! 4155: STB_R	stb	%r28, [%r20 + %r0]
	setx	data_start_1, %g1, %r16
	.word 0xb2340000  ! 4161: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xf23c4000  ! 4163: STD_R	std	%r25, [%r17 + %r0]
	.word 0xb68c4000  ! 4166: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xfa240000  ! 4167: STW_R	stw	%r29, [%r16 + %r0]
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43d61a3  ! 4170: STD_I	std	%r26, [%r21 + 0x01a3]
	.word 0xf93d0000  ! 4171: STDF_R	std	%f28, [%r0, %r20]
	.word 0xbd510000  ! 4174: RDPR_TICK	<illegal instruction>
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf835e1d7  ! 4181: STH_I	sth	%r28, [%r23 + 0x01d7]
	.word 0xfd3c2155  ! 4182: STDF_I	std	%f30, [0x0155, %r16]
	.word 0xb00c4000  ! 4186: AND_R	and 	%r17, %r0, %r24
	.word 0xf22c0000  ! 4188: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf0344000  ! 4189: STH_R	sth	%r24, [%r17 + %r0]
	.word 0x8d94a1ec  ! 4190: WRPR_PSTATE_I	wrpr	%r18, 0x01ec, %pstate
	.word 0xf2248000  ! 4191: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xfc754000  ! 4193: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xbf508000  ! 4198: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf13ce1a4  ! 4199: STDF_I	std	%f24, [0x01a4, %r19]
	.word 0xf8240000  ! 4201: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf474a08f  ! 4203: STX_I	stx	%r26, [%r18 + 0x008f]
	.word 0xfc2d8000  ! 4206: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfc25c000  ! 4209: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfa35a153  ! 4214: STH_I	sth	%r29, [%r22 + 0x0153]
	.word 0xb89c6026  ! 4215: XORcc_I	xorcc 	%r17, 0x0026, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 4216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0xf03d209c  ! 4218: STD_I	std	%r24, [%r20 + 0x009c]
	.word 0xf03c4000  ! 4221: STD_R	std	%r24, [%r17 + %r0]
	.word 0xbf500000  ! 4222: RDPR_TPC	rdpr	%tpc, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983d91  ! 4225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
	.word 0xf274c000  ! 4227: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf73ce185  ! 4228: STDF_I	std	%f27, [0x0185, %r19]
	setx	data_start_1, %g1, %r21
	.word 0xf62461b8  ! 4232: STW_I	stw	%r27, [%r17 + 0x01b8]
	setx	0x10017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	.word 0xfe34a1a5  ! 4241: STH_I	sth	%r31, [%r18 + 0x01a5]
	.word 0xfe2461b5  ! 4249: STW_I	stw	%r31, [%r17 + 0x01b5]
	.word 0xbe9d8000  ! 4252: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb7643801  ! 4253: MOVcc_I	<illegal instruction>
	.word 0x8995e141  ! 4255: WRPR_TICK_I	wrpr	%r23, 0x0141, %tick
	.word 0xb3510000  ! 4258: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb8154000  ! 4261: OR_R	or 	%r21, %r0, %r28
	.word 0xff3ca12d  ! 4262: STDF_I	std	%f31, [0x012d, %r18]
	setx	data_start_4, %g1, %r20
	.word 0xf835a0e5  ! 4268: STH_I	sth	%r28, [%r22 + 0x00e5]
	.word 0xfe3c60fd  ! 4270: STD_I	std	%r31, [%r17 + 0x00fd]
	.word 0x859561db  ! 4277: WRPR_TSTATE_I	wrpr	%r21, 0x01db, %tstate
	.word 0x879420f7  ! 4281: WRPR_TT_I	wrpr	%r16, 0x00f7, %tt
	.word 0xb551c000  ! 4282: RDPR_TL	rdpr	%tl, %r26
	mov	2, %r12
	.word 0x8f932000  ! 4285: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb7c2401  ! 4288: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xf434a075  ! 4289: STH_I	sth	%r26, [%r18 + 0x0075]
	.word 0xf8350000  ! 4292: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf4342045  ! 4293: STH_I	sth	%r26, [%r16 + 0x0045]
	.word 0xb57da401  ! 4295: MOVR_I	movre	%r22, 0x1, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a19  ! 4296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a19, %hpstate
	.word 0xf834a190  ! 4297: STH_I	sth	%r28, [%r18 + 0x0190]
	.word 0xf6348000  ! 4299: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb3357001  ! 4301: SRLX_I	srlx	%r21, 0x0001, %r25
	mov	1, %r14
	.word 0xa193a000  ! 4302: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce10a  ! 4306: STD_I	std	%r30, [%r19 + 0x010a]
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33cc000  ! 4309: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf2752188  ! 4311: STX_I	stx	%r25, [%r20 + 0x0188]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982999  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0xb5510000  ! 4322: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf83c617d  ! 4325: STD_I	std	%r28, [%r17 + 0x017d]
	.word 0xb3510000  ! 4329: RDPR_TICK	<illegal instruction>
	.word 0xf435a014  ! 4330: STH_I	sth	%r26, [%r22 + 0x0014]
	.word 0xfe348000  ! 4334: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf225a1d3  ! 4336: STW_I	stw	%r25, [%r22 + 0x01d3]
	.word 0xb351c000  ! 4337: RDPR_TL	<illegal instruction>
	.word 0xf22c2158  ! 4341: STB_I	stb	%r25, [%r16 + 0x0158]
	ta	T_CHANGE_HPRIV
	.word 0x81982d5b  ! 4346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xf875c000  ! 4347: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfe3d6038  ! 4348: STD_I	std	%r31, [%r21 + 0x0038]
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22dc000  ! 4350: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf634203e  ! 4351: STH_I	sth	%r27, [%r16 + 0x003e]
	.word 0x899560f5  ! 4352: WRPR_TICK_I	wrpr	%r21, 0x00f5, %tick
	.word 0xf2344000  ! 4355: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xbd510000  ! 4358: RDPR_TICK	rdpr	%tick, %r30
	.word 0xbcbce002  ! 4359: XNORcc_I	xnorcc 	%r19, 0x0002, %r30
	.word 0xfc74a03b  ! 4361: STX_I	stx	%r30, [%r18 + 0x003b]
	.word 0xbe85a096  ! 4365: ADDcc_I	addcc 	%r22, 0x0096, %r31
	.word 0xbc9d6027  ! 4367: XORcc_I	xorcc 	%r21, 0x0027, %r30
	.word 0x8794616f  ! 4368: WRPR_TT_I	wrpr	%r17, 0x016f, %tt
	.word 0xff3d0000  ! 4370: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb3520000  ! 4371: RDPR_PIL	rdpr	%pil, %r25
	.word 0x8d9421e8  ! 4372: WRPR_PSTATE_I	wrpr	%r16, 0x01e8, %pstate
	.word 0xf03c4000  ! 4374: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb7510000  ! 4377: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf23d61af  ! 4379: STD_I	std	%r25, [%r21 + 0x01af]
	.word 0xfa2d2148  ! 4382: STB_I	stb	%r29, [%r20 + 0x0148]
	.word 0xfe254000  ! 4388: STW_R	stw	%r31, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 4391: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r21
	setx	0x207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952019  ! 4400: WRPR_PIL_I	wrpr	%r20, 0x0019, %pil
	.word 0xf03d60a7  ! 4401: STD_I	std	%r24, [%r21 + 0x00a7]
	.word 0x9195e13f  ! 4402: WRPR_PIL_I	wrpr	%r23, 0x013f, %pil
	.word 0xb9349000  ! 4405: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xfc354000  ! 4406: STH_R	sth	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982a83  ! 4409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	setx	data_start_0, %g1, %r23
	.word 0xf63c0000  ! 4412: STD_R	std	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982951  ! 4413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0951, %hpstate
	.word 0xf53d6163  ! 4415: STDF_I	std	%f26, [0x0163, %r21]
	.word 0xfe754000  ! 4417: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xb351c000  ! 4418: RDPR_TL	rdpr	%tl, %r25
	.word 0x8395a179  ! 4419: WRPR_TNPC_I	wrpr	%r22, 0x0179, %tnpc
	.word 0xbd540000  ! 4421: RDPR_GL	rdpr	%-, %r30
	.word 0xf424209d  ! 4423: STW_I	stw	%r26, [%r16 + 0x009d]
	.word 0xb2852129  ! 4424: ADDcc_I	addcc 	%r20, 0x0129, %r25
	.word 0xfc2c0000  ! 4426: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf53c2059  ! 4431: STDF_I	std	%f26, [0x0059, %r16]
	.word 0xfa74c000  ! 4434: STX_R	stx	%r29, [%r19 + %r0]
	.word 0x8795e077  ! 4435: WRPR_TT_I	wrpr	%r23, 0x0077, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983d01  ! 4439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d01, %hpstate
	.word 0xb7540000  ! 4441: RDPR_GL	rdpr	%-, %r27
	.word 0xf83dc000  ! 4443: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfc3de0e8  ! 4445: STD_I	std	%r30, [%r23 + 0x00e8]
	.word 0xb151c000  ! 4446: RDPR_TL	<illegal instruction>
	.word 0xf675e03d  ! 4448: STX_I	stx	%r27, [%r23 + 0x003d]
	.word 0x8d95a0a1  ! 4449: WRPR_PSTATE_I	wrpr	%r22, 0x00a1, %pstate
	setx	data_start_6, %g1, %r18
	.word 0xb1359000  ! 4453: SRLX_R	srlx	%r22, %r0, %r24
	mov	2, %r12
	.word 0x8f932000  ! 4454: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983b1b  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1b, %hpstate
	.word 0xf0750000  ! 4462: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf6352147  ! 4467: STH_I	sth	%r27, [%r20 + 0x0147]
	.word 0xf42d0000  ! 4468: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xb150c000  ! 4469: RDPR_TT	rdpr	%tt, %r24
	.word 0x899461e2  ! 4471: WRPR_TICK_I	wrpr	%r17, 0x01e2, %tick
	.word 0xf834c000  ! 4473: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xb950c000  ! 4476: RDPR_TT	rdpr	%tt, %r28
	.word 0x8594a02e  ! 4479: WRPR_TSTATE_I	wrpr	%r18, 0x002e, %tstate
	.word 0xfa24e1de  ! 4480: STW_I	stw	%r29, [%r19 + 0x01de]
	.word 0xf43d4000  ! 4485: STD_R	std	%r26, [%r21 + %r0]
	.word 0xfa3c0000  ! 4486: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfa748000  ! 4489: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf22d6032  ! 4492: STB_I	stb	%r25, [%r21 + 0x0032]
	.word 0xfc2d0000  ! 4494: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf475c000  ! 4496: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xfe352103  ! 4498: STH_I	sth	%r31, [%r20 + 0x0103]
	mov	2, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf2750000  ! 4505: STX_R	stx	%r25, [%r20 + %r0]
	setx	data_start_6, %g1, %r19
	.word 0xb3508000  ! 4507: RDPR_TSTATE	rdpr	%tstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa75c000  ! 4509: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xfe25e10a  ! 4510: STW_I	stw	%r31, [%r23 + 0x010a]
	.word 0xfb3de169  ! 4513: STDF_I	std	%f29, [0x0169, %r23]
	setx	data_start_5, %g1, %r17
	.word 0xff3c6177  ! 4518: STDF_I	std	%f31, [0x0177, %r17]
	.word 0xb3508000  ! 4520: RDPR_TSTATE	<illegal instruction>
	.word 0xb5540000  ! 4521: RDPR_GL	<illegal instruction>
	.word 0xb550c000  ! 4522: RDPR_TT	<illegal instruction>
	.word 0xf03d4000  ! 4524: STD_R	std	%r24, [%r21 + %r0]
	setx	data_start_1, %g1, %r16
	.word 0xba85a090  ! 4527: ADDcc_I	addcc 	%r22, 0x0090, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8394a010  ! 4534: WRPR_TNPC_I	wrpr	%r18, 0x0010, %tnpc
	.word 0xf02560e8  ! 4535: STW_I	stw	%r24, [%r21 + 0x00e8]
	.word 0xb5480000  ! 4536: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf63c212f  ! 4537: STD_I	std	%r27, [%r16 + 0x012f]
	ta	T_CHANGE_HPRIV
	.word 0x81982e89  ! 4545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e89, %hpstate
	.word 0xb550c000  ! 4546: RDPR_TT	rdpr	%tt, %r26
	.word 0xfc740000  ! 4547: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf475a1e0  ! 4549: STX_I	stx	%r26, [%r22 + 0x01e0]
	.word 0xfe2d8000  ! 4554: STB_R	stb	%r31, [%r22 + %r0]
	.word 0x879521ed  ! 4558: WRPR_TT_I	wrpr	%r20, 0x01ed, %tt
	.word 0xfc3c21b5  ! 4559: STD_I	std	%r30, [%r16 + 0x01b5]
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4158000  ! 4569: OR_R	or 	%r22, %r0, %r26
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba45c000  ! 4572: ADDC_R	addc 	%r23, %r0, %r29
	setx	data_start_1, %g1, %r19
	.word 0xf0344000  ! 4574: STH_R	sth	%r24, [%r17 + %r0]
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	.word 0x81983c59  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c59, %hpstate
	.word 0xfa740000  ! 4578: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf82561af  ! 4582: STW_I	stw	%r28, [%r21 + 0x01af]
	.word 0xb1540000  ! 4584: RDPR_GL	rdpr	%-, %r24
	.word 0xbb500000  ! 4590: RDPR_TPC	<illegal instruction>
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3cc000  ! 4594: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf8242176  ! 4595: STW_I	stw	%r28, [%r16 + 0x0176]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb48de198  ! 4601: ANDcc_I	andcc 	%r23, 0x0198, %r26
	.word 0xff3d8000  ! 4603: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf22de157  ! 4606: STB_I	stb	%r25, [%r23 + 0x0157]
	.word 0xf93c8000  ! 4611: STDF_R	std	%f28, [%r0, %r18]
	.word 0xbd50c000  ! 4618: RDPR_TT	rdpr	%tt, %r30
	.word 0xfe254000  ! 4621: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf43d8000  ! 4624: STD_R	std	%r26, [%r22 + %r0]
	.word 0xb7500000  ! 4625: RDPR_TPC	<illegal instruction>
	.word 0xf0340000  ! 4631: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xfe242085  ! 4632: STW_I	stw	%r31, [%r16 + 0x0085]
	.word 0xf43d20b0  ! 4638: STD_I	std	%r26, [%r20 + 0x00b0]
	.word 0xbb480000  ! 4640: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_3, %g1, %r17
	.word 0xf0740000  ! 4643: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf435a16c  ! 4647: STH_I	sth	%r26, [%r22 + 0x016c]
	.word 0xfc3d0000  ! 4651: STD_R	std	%r30, [%r20 + %r0]
	.word 0x9194a0c0  ! 4653: WRPR_PIL_I	wrpr	%r18, 0x00c0, %pil
	.word 0xf63c61b1  ! 4659: STD_I	std	%r27, [%r17 + 0x01b1]
	.word 0xba35e0b4  ! 4662: ORN_I	orn 	%r23, 0x00b4, %r29
	.word 0xf6348000  ! 4664: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf02c4000  ! 4667: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xbab460a6  ! 4669: ORNcc_I	orncc 	%r17, 0x00a6, %r29
	.word 0xf034a08b  ! 4670: STH_I	sth	%r24, [%r18 + 0x008b]
	.word 0xb32d4000  ! 4671: SLL_R	sll 	%r21, %r0, %r25
	.word 0xbb508000  ! 4674: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbd504000  ! 4676: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982fc3  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0xfe3d4000  ! 4682: STD_R	std	%r31, [%r21 + %r0]
	.word 0xb351c000  ! 4684: RDPR_TL	rdpr	%tl, %r25
	.word 0xfd3de021  ! 4685: STDF_I	std	%f30, [0x0021, %r23]
	setx	0x30239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4690: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r23
	mov	2, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc348000  ! 4697: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xb3480000  ! 4698: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf425a032  ! 4699: STW_I	stw	%r26, [%r22 + 0x0032]
	setx	0x30206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a108  ! 4705: WRPR_TNPC_I	wrpr	%r18, 0x0108, %tnpc
	.word 0xb13d5000  ! 4708: SRAX_R	srax	%r21, %r0, %r24
	.word 0xf275a1ea  ! 4713: STX_I	stx	%r25, [%r22 + 0x01ea]
	.word 0xf02de0df  ! 4715: STB_I	stb	%r24, [%r23 + 0x00df]
	.word 0xfa258000  ! 4717: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf53dc000  ! 4718: STDF_R	std	%f26, [%r0, %r23]
	.word 0xf47461c3  ! 4720: STX_I	stx	%r26, [%r17 + 0x01c3]
	mov	0, %r14
	.word 0xa193a000  ! 4724: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc258000  ! 4725: STW_R	stw	%r30, [%r22 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 4726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952194  ! 4730: WRPR_TICK_I	wrpr	%r20, 0x0194, %tick
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3c8000  ! 4735: STD_R	std	%r30, [%r18 + %r0]
	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf3d3001  ! 4739: SRAX_I	srax	%r20, 0x0001, %r31
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 4743: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x8394a1d5  ! 4746: WRPR_TNPC_I	wrpr	%r18, 0x01d5, %tnpc
	.word 0x8395a081  ! 4749: WRPR_TNPC_I	wrpr	%r22, 0x0081, %tnpc
	.word 0xf73d4000  ! 4751: STDF_R	std	%f27, [%r0, %r21]
	.word 0xf4258000  ! 4752: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf47561a2  ! 4757: STX_I	stx	%r26, [%r21 + 0x01a2]
	.word 0xf674c000  ! 4758: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf22de094  ! 4759: STB_I	stb	%r25, [%r23 + 0x0094]
	.word 0xf2344000  ! 4760: STH_R	sth	%r25, [%r17 + %r0]
	setx	0x328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6056031  ! 4763: ADD_I	add 	%r21, 0x0031, %r27
	.word 0x8194e032  ! 4768: WRPR_TPC_I	wrpr	%r19, 0x0032, %tpc
	.word 0xfe3421ee  ! 4770: STH_I	sth	%r31, [%r16 + 0x01ee]
	setx	0x200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe34e0ed  ! 4772: ORN_I	orn 	%r19, 0x00ed, %r31
	.word 0xfa75a106  ! 4778: STX_I	stx	%r29, [%r22 + 0x0106]
	.word 0xfa74e0dd  ! 4779: STX_I	stx	%r29, [%r19 + 0x00dd]
	.word 0xf93ca18b  ! 4781: STDF_I	std	%f28, [0x018b, %r18]
	.word 0xfa240000  ! 4783: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf23c2031  ! 4785: STD_I	std	%r25, [%r16 + 0x0031]
	.word 0xf4748000  ! 4786: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfd3da141  ! 4787: STDF_I	std	%f30, [0x0141, %r22]
	.word 0xfe3d8000  ! 4788: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf6340000  ! 4789: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf22c0000  ! 4791: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xbb508000  ! 4795: RDPR_TSTATE	rdpr	%tstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4742089  ! 4799: STX_I	stx	%r26, [%r16 + 0x0089]
	.word 0xff3c21ed  ! 4801: STDF_I	std	%f31, [0x01ed, %r16]
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 4811: RDPR_TSTATE	<illegal instruction>
	.word 0xf13c6040  ! 4815: STDF_I	std	%f24, [0x0040, %r17]
	.word 0xb82520ed  ! 4816: SUB_I	sub 	%r20, 0x00ed, %r28
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc752159  ! 4819: STX_I	stx	%r30, [%r20 + 0x0159]
	.word 0xf4748000  ! 4820: STX_R	stx	%r26, [%r18 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 4821: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf02d6115  ! 4825: STB_I	stb	%r24, [%r21 + 0x0115]
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a0bd  ! 4827: WRPR_PIL_I	wrpr	%r22, 0x00bd, %pil
	.word 0xf73d60c1  ! 4828: STDF_I	std	%f27, [0x00c1, %r21]
	.word 0xfa2d0000  ! 4829: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbd518000  ! 4831: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb3643801  ! 4835: MOVcc_I	<illegal instruction>
	.word 0x8594215f  ! 4836: WRPR_TSTATE_I	wrpr	%r16, 0x015f, %tstate
	setx	0x117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	.word 0xbb510000  ! 4844: RDPR_TICK	rdpr	%tick, %r29
	setx	data_start_6, %g1, %r21
	.word 0xf635e060  ! 4847: STH_I	sth	%r27, [%r23 + 0x0060]
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a05d  ! 4854: WRPR_TNPC_I	wrpr	%r18, 0x005d, %tnpc
	.word 0xf33c0000  ! 4856: STDF_R	std	%f25, [%r0, %r16]
	.word 0x839520e0  ! 4857: WRPR_TNPC_I	wrpr	%r20, 0x00e0, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x87946002  ! 4860: WRPR_TT_I	wrpr	%r17, 0x0002, %tt
	.word 0xfe344000  ! 4862: STH_R	sth	%r31, [%r17 + %r0]
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 4866: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3461a4  ! 4870: STH_I	sth	%r30, [%r17 + 0x01a4]
	.word 0xfa248000  ! 4871: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf93c8000  ! 4872: STDF_R	std	%f28, [%r0, %r18]
	.word 0xf13d0000  ! 4877: STDF_R	std	%f24, [%r0, %r20]
	setx	data_start_3, %g1, %r22
	.word 0xf82de129  ! 4883: STB_I	stb	%r28, [%r23 + 0x0129]
	.word 0xb7480000  ! 4884: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983a8b  ! 4885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8b, %hpstate
	.word 0xf635a1dc  ! 4888: STH_I	sth	%r27, [%r22 + 0x01dc]
	.word 0xf634a13d  ! 4889: STH_I	sth	%r27, [%r18 + 0x013d]
	.word 0x8195e104  ! 4891: WRPR_TPC_I	wrpr	%r23, 0x0104, %tpc
	.word 0xf0240000  ! 4892: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb00c4000  ! 4893: AND_R	and 	%r17, %r0, %r24
	.word 0xbd3d1000  ! 4896: SRAX_R	srax	%r20, %r0, %r30
	.word 0xb204a09c  ! 4897: ADD_I	add 	%r18, 0x009c, %r25
	.word 0x8d9420ed  ! 4899: WRPR_PSTATE_I	wrpr	%r16, 0x00ed, %pstate
	.word 0xff3ca094  ! 4909: STDF_I	std	%f31, [0x0094, %r18]
	.word 0xbd50c000  ! 4912: RDPR_TT	rdpr	%tt, %r30
	setx	0x20337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 4917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	.word 0xf42c8000  ! 4919: STB_R	stb	%r26, [%r18 + %r0]
	.word 0x899521ce  ! 4925: WRPR_TICK_I	wrpr	%r20, 0x01ce, %tick
	.word 0xf63dc000  ! 4926: STD_R	std	%r27, [%r23 + %r0]
	.word 0xb3500000  ! 4930: RDPR_TPC	rdpr	%tpc, %r25
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0248000  ! 4938: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf434c000  ! 4939: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf63da0ac  ! 4940: STD_I	std	%r27, [%r22 + 0x00ac]
	.word 0x8995e041  ! 4944: WRPR_TICK_I	wrpr	%r23, 0x0041, %tick
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe740000  ! 4947: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfc248000  ! 4950: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf2744000  ! 4951: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfe3c2113  ! 4952: STD_I	std	%r31, [%r16 + 0x0113]
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb37c2401  ! 4956: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xbd510000  ! 4962: RDPR_TICK	rdpr	%tick, %r30
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839460cc  ! 4966: WRPR_TNPC_I	wrpr	%r17, 0x00cc, %tnpc
	.word 0xf0740000  ! 4967: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xb551c000  ! 4970: RDPR_TL	rdpr	%tl, %r26
	.word 0xfe3c8000  ! 4971: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb5518000  ! 4977: RDPR_PSTATE	<illegal instruction>
	.word 0xfd3d2196  ! 4979: STDF_I	std	%f30, [0x0196, %r20]
	.word 0xf275e04f  ! 4980: STX_I	stx	%r25, [%r23 + 0x004f]
	.word 0xfa2de13e  ! 4983: STB_I	stb	%r29, [%r23 + 0x013e]
	.word 0x83946185  ! 4991: WRPR_TNPC_I	wrpr	%r17, 0x0185, %tnpc
	.word 0xb1504000  ! 4993: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf22c0000  ! 4994: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf82c4000  ! 4996: STB_R	stb	%r28, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
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
	.word 0xb4854000  ! 3: ADDcc_R	addcc 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983d81  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d81, %hpstate
	.word 0xf25c8000  ! 5: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xb4c4a0ea  ! 7: ADDCcc_I	addccc 	%r18, 0x00ea, %r26
	.word 0xfc0c0000  ! 9: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0x839561a7  ! 13: WRPR_TNPC_I	wrpr	%r21, 0x01a7, %tnpc
	.word 0xb150c000  ! 15: RDPR_TT	<illegal instruction>
	.word 0xf0444000  ! 16: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0x8195201c  ! 20: WRPR_TPC_I	wrpr	%r20, 0x001c, %tpc
	mov	1, %r12
	.word 0x8f932000  ! 22: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3520000  ! 24: RDPR_PIL	<illegal instruction>
	.word 0xf61c60d9  ! 26: LDD_I	ldd	[%r17 + 0x00d9], %r27
	.word 0xfa1d0000  ! 30: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xbb500000  ! 33: RDPR_TPC	<illegal instruction>
	.word 0xfc154000  ! 36: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf2452081  ! 38: LDSW_I	ldsw	[%r20 + 0x0081], %r25
	.word 0x8d94e15a  ! 39: WRPR_PSTATE_I	wrpr	%r19, 0x015a, %pstate
	.word 0xbe04e00c  ! 40: ADD_I	add 	%r19, 0x000c, %r31
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c4000  ! 45: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xba8ca1c8  ! 50: ANDcc_I	andcc 	%r18, 0x01c8, %r29
	.word 0xf65de0cc  ! 51: LDX_I	ldx	[%r23 + 0x00cc], %r27
	.word 0xb7504000  ! 52: RDPR_TNPC	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 53: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb41d20dc  ! 57: XOR_I	xor 	%r20, 0x00dc, %r26
	.word 0x9195e001  ! 64: WRPR_PIL_I	wrpr	%r23, 0x0001, %pil
	.word 0xfa14216e  ! 65: LDUH_I	lduh	[%r16 + 0x016e], %r29
	.word 0xfd1c0000  ! 68: LDDF_R	ldd	[%r16, %r0], %f30
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a14b  ! 73: WRPR_TICK_I	wrpr	%r18, 0x014b, %tick
	.word 0xbf518000  ! 76: RDPR_PSTATE	<illegal instruction>
	.word 0xb5643801  ! 78: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf51c4000  ! 84: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfc44a079  ! 87: LDSW_I	ldsw	[%r18 + 0x0079], %r30
	.word 0xff1dc000  ! 91: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xb69cc000  ! 99: XORcc_R	xorcc 	%r19, %r0, %r27
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf205c000  ! 101: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xb6148000  ! 111: OR_R	or 	%r18, %r0, %r27
	mov	1, %r12
	.word 0x8f932000  ! 114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf51c0000  ! 115: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf4554000  ! 118: LDSH_R	ldsh	[%r21 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983b53  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b53, %hpstate
	.word 0xf21d60d3  ! 122: LDD_I	ldd	[%r21 + 0x00d3], %r25
	.word 0xfa04200f  ! 123: LDUW_I	lduw	[%r16 + 0x000f], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xfa4cc000  ! 126: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0x8395e0dd  ! 128: WRPR_TNPC_I	wrpr	%r23, 0x00dd, %tnpc
	.word 0xfc54c000  ! 133: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf44d4000  ! 136: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0x8594a0a8  ! 139: WRPR_TSTATE_I	wrpr	%r18, 0x00a8, %tstate
	.word 0xb42dc000  ! 140: ANDN_R	andn 	%r23, %r0, %r26
	.word 0x8994e135  ! 141: WRPR_TICK_I	wrpr	%r19, 0x0135, %tick
	.word 0xf0152064  ! 143: LDUH_I	lduh	[%r20 + 0x0064], %r24
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf404a164  ! 145: LDUW_I	lduw	[%r18 + 0x0164], %r26
	.word 0x8995a1e5  ! 147: WRPR_TICK_I	wrpr	%r22, 0x01e5, %tick
	.word 0xb8c40000  ! 150: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0x83952061  ! 152: WRPR_TNPC_I	wrpr	%r20, 0x0061, %tnpc
	.word 0xfc4c2031  ! 154: LDSB_I	ldsb	[%r16 + 0x0031], %r30
	.word 0xf51da0f2  ! 155: LDDF_I	ldd	[%r22, 0x00f2], %f26
	.word 0xf11da090  ! 158: LDDF_I	ldd	[%r22, 0x0090], %f24
	.word 0xf2148000  ! 160: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf65c4000  ! 162: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf04cc000  ! 163: LDSB_R	ldsb	[%r19 + %r0], %r24
	mov	1, %r12
	.word 0x8f932000  ! 166: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe14c000  ! 168: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0x9194e0ab  ! 169: WRPR_PIL_I	wrpr	%r19, 0x00ab, %pil
	.word 0xfc1cc000  ! 170: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xfc15e02c  ! 171: LDUH_I	lduh	[%r23 + 0x002c], %r30
	.word 0x8994618b  ! 174: WRPR_TICK_I	wrpr	%r17, 0x018b, %tick
	.word 0xfc4ce0b1  ! 178: LDSB_I	ldsb	[%r19 + 0x00b1], %r30
	.word 0x899421b1  ! 179: WRPR_TICK_I	wrpr	%r16, 0x01b1, %tick
	.word 0xfc0ca1f2  ! 180: LDUB_I	ldub	[%r18 + 0x01f2], %r30
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf415e1bf  ! 185: LDUH_I	lduh	[%r23 + 0x01bf], %r26
	.word 0xf80d4000  ! 186: LDUB_R	ldub	[%r21 + %r0], %r28
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a027  ! 199: WRPR_TPC_I	wrpr	%r18, 0x0027, %tpc
	.word 0xf81d4000  ! 203: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0x9194e062  ! 204: WRPR_PIL_I	wrpr	%r19, 0x0062, %pil
	.word 0xf2544000  ! 205: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xbb50c000  ! 207: RDPR_TT	<illegal instruction>
	.word 0xfc458000  ! 210: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xf854a02e  ! 216: LDSH_I	ldsh	[%r18 + 0x002e], %r28
	.word 0xf24d60d7  ! 219: LDSB_I	ldsb	[%r21 + 0x00d7], %r25
	.word 0xf2144000  ! 221: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xfa55e1d1  ! 222: LDSH_I	ldsh	[%r23 + 0x01d1], %r29
	mov	2, %r12
	.word 0x8f932000  ! 223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb3ca001  ! 225: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0x8995e14b  ! 227: WRPR_TICK_I	wrpr	%r23, 0x014b, %tick
	.word 0xb1510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xfc440000  ! 232: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xb5480000  ! 234: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb0ade116  ! 239: ANDNcc_I	andncc 	%r23, 0x0116, %r24
	.word 0xb751c000  ! 243: RDPR_TL	<illegal instruction>
	.word 0xf25da091  ! 244: LDX_I	ldx	[%r22 + 0x0091], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe1d2051  ! 247: LDD_I	ldd	[%r20 + 0x0051], %r31
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 250: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf45de1a4  ! 254: LDX_I	ldx	[%r23 + 0x01a4], %r26
	.word 0xfc146167  ! 257: LDUH_I	lduh	[%r17 + 0x0167], %r30
	.word 0xb1518000  ! 261: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf8156066  ! 262: LDUH_I	lduh	[%r21 + 0x0066], %r28
	.word 0xb0844000  ! 263: ADDcc_R	addcc 	%r17, %r0, %r24
	.word 0xf71d21d3  ! 264: LDDF_I	ldd	[%r20, 0x01d3], %f27
	.word 0xb235c000  ! 267: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xf014e138  ! 269: LDUH_I	lduh	[%r19 + 0x0138], %r24
	.word 0xf84ca027  ! 275: LDSB_I	ldsb	[%r18 + 0x0027], %r28
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xb1520000  ! 277: RDPR_PIL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x31f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11c6059  ! 284: LDDF_I	ldd	[%r17, 0x0059], %f24
	.word 0xbb504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xf4544000  ! 289: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb1508000  ! 290: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xf4442065  ! 293: LDSW_I	ldsw	[%r16 + 0x0065], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf71c4000  ! 295: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xfc54a110  ! 297: LDSH_I	ldsh	[%r18 + 0x0110], %r30
	.word 0xbea56162  ! 299: SUBcc_I	subcc 	%r21, 0x0162, %r31
	.word 0xb7508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xfa050000  ! 301: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf20d603c  ! 304: LDUB_I	ldub	[%r21 + 0x003c], %r25
	.word 0xf21c8000  ! 306: LDD_R	ldd	[%r18 + %r0], %r25
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31ce162  ! 310: LDDF_I	ldd	[%r19, 0x0162], %f25
	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba84c000  ! 319: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xfe058000  ! 322: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0x83946046  ! 323: WRPR_TNPC_I	wrpr	%r17, 0x0046, %tnpc
	.word 0xf45da0d6  ! 328: LDX_I	ldx	[%r22 + 0x00d6], %r26
	.word 0xf85c0000  ! 332: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xbe25a00c  ! 334: SUB_I	sub 	%r22, 0x000c, %r31
	.word 0xfa0c8000  ! 335: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xfa4d0000  ! 340: LDSB_R	ldsb	[%r20 + %r0], %r29
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45dc000  ! 343: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfd1c8000  ! 345: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf00d60bf  ! 348: LDUB_I	ldub	[%r21 + 0x00bf], %r24
	.word 0xb7500000  ! 349: RDPR_TPC	<illegal instruction>
	.word 0xfa5d4000  ! 350: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xb9351000  ! 351: SRLX_R	srlx	%r20, %r0, %r28
	.word 0x89942057  ! 352: WRPR_TICK_I	wrpr	%r16, 0x0057, %tick
	.word 0xbb3cf001  ! 353: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xf204e1a1  ! 357: LDUW_I	lduw	[%r19 + 0x01a1], %r25
	.word 0xf805c000  ! 358: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xb134e001  ! 360: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xfc1d0000  ! 362: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xbb518000  ! 365: RDPR_PSTATE	<illegal instruction>
	.word 0xf11ce1ae  ! 366: LDDF_I	ldd	[%r19, 0x01ae], %f24
	.word 0xfe4d2055  ! 367: LDSB_I	ldsb	[%r20 + 0x0055], %r31
	mov	1, %r12
	.word 0x8f932000  ! 371: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf415e1bf  ! 372: LDUH_I	lduh	[%r23 + 0x01bf], %r26
	.word 0x8794a066  ! 373: WRPR_TT_I	wrpr	%r18, 0x0066, %tt
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919420ec  ! 383: WRPR_PIL_I	wrpr	%r16, 0x00ec, %pil
	.word 0xbf520000  ! 384: RDPR_PIL	<illegal instruction>
	.word 0xf41ce0aa  ! 386: LDD_I	ldd	[%r19 + 0x00aa], %r26
	.word 0xb1540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0xf45d6038  ! 390: LDX_I	ldx	[%r21 + 0x0038], %r26
	.word 0xf20561ee  ! 391: LDUW_I	lduw	[%r21 + 0x01ee], %r25
	.word 0xbe9dc000  ! 393: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xb151c000  ! 395: RDPR_TL	<illegal instruction>
	.word 0xfc5421e5  ! 396: LDSH_I	ldsh	[%r16 + 0x01e5], %r30
	.word 0x839560a7  ! 397: WRPR_TNPC_I	wrpr	%r21, 0x00a7, %tnpc
	.word 0xf01ca01a  ! 398: LDD_I	ldd	[%r18 + 0x001a], %r24
	.word 0x819420f5  ! 404: WRPR_TPC_I	wrpr	%r16, 0x00f5, %tpc
	.word 0xb12dd000  ! 405: SLLX_R	sllx	%r23, %r0, %r24
	.word 0xfd1d0000  ! 406: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xf91c0000  ! 418: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfa04c000  ! 419: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0xf40c4000  ! 420: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb5504000  ! 422: RDPR_TNPC	<illegal instruction>
	.word 0x8594206c  ! 425: WRPR_TSTATE_I	wrpr	%r16, 0x006c, %tstate
	setx	0x3032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4448000  ! 430: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf65c4000  ! 432: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xb6340000  ! 440: SUBC_R	orn 	%r16, %r0, %r27
	.word 0xbd51c000  ! 443: RDPR_TL	rdpr	%tl, %r30
	.word 0x89952107  ! 444: WRPR_TICK_I	wrpr	%r20, 0x0107, %tick
	setx	0x20004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d219b  ! 446: LDX_I	ldx	[%r20 + 0x019b], %r31
	.word 0xfa45c000  ! 448: LDSW_R	ldsw	[%r23 + %r0], %r29
	mov	1, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952185  ! 456: WRPR_TICK_I	wrpr	%r20, 0x0185, %tick
	.word 0xf855e12c  ! 457: LDSH_I	ldsh	[%r23 + 0x012c], %r28
	.word 0xbc1da015  ! 458: XOR_I	xor 	%r22, 0x0015, %r30
	.word 0xf11ce1af  ! 459: LDDF_I	ldd	[%r19, 0x01af], %f24
	.word 0xfc444000  ! 461: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfa0d8000  ! 465: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf84d21ba  ! 466: LDSB_I	ldsb	[%r20 + 0x01ba], %r28
	.word 0xf8158000  ! 468: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb9480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf04c4000  ! 471: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf0148000  ! 472: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xbc9ce0dc  ! 475: XORcc_I	xorcc 	%r19, 0x00dc, %r30
	.word 0x8394a086  ! 477: WRPR_TNPC_I	wrpr	%r18, 0x0086, %tnpc
	.word 0xb3500000  ! 484: RDPR_TPC	<illegal instruction>
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a10f  ! 492: WRPR_TSTATE_I	wrpr	%r18, 0x010f, %tstate
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc14e133  ! 496: LDUH_I	lduh	[%r19 + 0x0133], %r30
	.word 0xfa5d8000  ! 499: LDX_R	ldx	[%r22 + %r0], %r29
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b43  ! 504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b43, %hpstate
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 507: MOVcc_R	<illegal instruction>
	.word 0xf044e1f8  ! 508: LDSW_I	ldsw	[%r19 + 0x01f8], %r24
	.word 0x8395616a  ! 510: WRPR_TNPC_I	wrpr	%r21, 0x016a, %tnpc
	.word 0xb351c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xbb50c000  ! 513: RDPR_TT	<illegal instruction>
	.word 0xfc14c000  ! 514: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0x8994e0d1  ! 515: WRPR_TICK_I	wrpr	%r19, 0x00d1, %tick
	.word 0xf71d0000  ! 516: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xbd518000  ! 517: RDPR_PSTATE	<illegal instruction>
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d201c  ! 519: LDSB_I	ldsb	[%r20 + 0x001c], %r29
	setx	data_start_4, %g1, %r19
	.word 0xf654e0f0  ! 522: LDSH_I	ldsh	[%r19 + 0x00f0], %r27
	.word 0xf00ce10c  ! 523: LDUB_I	ldub	[%r19 + 0x010c], %r24
	.word 0xb551c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0xf01d2146  ! 529: LDD_I	ldd	[%r20 + 0x0146], %r24
	.word 0xb8bd208f  ! 530: XNORcc_I	xnorcc 	%r20, 0x008f, %r28
	.word 0xfc540000  ! 531: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xbf500000  ! 532: RDPR_TPC	<illegal instruction>
	.word 0xf31c0000  ! 534: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xb225c000  ! 536: SUB_R	sub 	%r23, %r0, %r25
	.word 0xbf51c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xfc0de156  ! 538: LDUB_I	ldub	[%r23 + 0x0156], %r30
	.word 0xfe1d8000  ! 540: LDD_R	ldd	[%r22 + %r0], %r31
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xf2554000  ! 545: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf4050000  ! 546: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xbe0d4000  ! 551: AND_R	and 	%r21, %r0, %r31
	.word 0xbab58000  ! 561: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xf05d21b5  ! 564: LDX_I	ldx	[%r20 + 0x01b5], %r24
	.word 0xfc1cc000  ! 565: LDD_R	ldd	[%r19 + %r0], %r30
	setx	0x30004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04cc000  ! 570: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf4044000  ! 571: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0x8d94a07f  ! 573: WRPR_PSTATE_I	wrpr	%r18, 0x007f, %pstate
	.word 0xf31c204b  ! 574: LDDF_I	ldd	[%r16, 0x004b], %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xf25d4000  ! 578: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfd1c2083  ! 588: LDDF_I	ldd	[%r16, 0x0083], %f30
	.word 0xf71c4000  ! 591: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf84cc000  ! 593: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xbd504000  ! 595: RDPR_TNPC	<illegal instruction>
	.word 0xbcbc21ed  ! 597: XNORcc_I	xnorcc 	%r16, 0x01ed, %r30
	.word 0xfa54e1f5  ! 600: LDSH_I	ldsh	[%r19 + 0x01f5], %r29
	.word 0xb49ca0ee  ! 602: XORcc_I	xorcc 	%r18, 0x00ee, %r26
	.word 0xfa056044  ! 603: LDUW_I	lduw	[%r21 + 0x0044], %r29
	.word 0xfa0d8000  ! 604: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfa15c000  ! 609: LDUH_R	lduh	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf05d61ca  ! 614: LDX_I	ldx	[%r21 + 0x01ca], %r24
	.word 0xf51d610a  ! 615: LDDF_I	ldd	[%r21, 0x010a], %f26
	.word 0xb2356018  ! 618: SUBC_I	orn 	%r21, 0x0018, %r25
	.word 0xfc4d4000  ! 619: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf01d0000  ! 621: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xbb510000  ! 622: RDPR_TICK	<illegal instruction>
	.word 0xbe0d8000  ! 624: AND_R	and 	%r22, %r0, %r31
	.word 0xb0a42174  ! 627: SUBcc_I	subcc 	%r16, 0x0174, %r24
	.word 0xbd504000  ! 629: RDPR_TNPC	<illegal instruction>
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc45c000  ! 631: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf65d4000  ! 632: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf615a1d7  ! 638: LDUH_I	lduh	[%r22 + 0x01d7], %r27
	.word 0xf845607a  ! 640: LDSW_I	ldsw	[%r21 + 0x007a], %r28
	.word 0xfa144000  ! 645: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xfe0d4000  ! 647: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xfa04e065  ! 649: LDUW_I	lduw	[%r19 + 0x0065], %r29
	.word 0xf254c000  ! 651: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xb53df001  ! 654: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xfe0cc000  ! 657: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf814c000  ! 658: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xb3500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xfe14c000  ! 663: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf01c206c  ! 667: LDD_I	ldd	[%r16 + 0x006c], %r24
	.word 0xf11de0d2  ! 671: LDDF_I	ldd	[%r23, 0x00d2], %f24
	.word 0xf044c000  ! 673: LDSW_R	ldsw	[%r19 + %r0], %r24
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 676: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x35, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40d0000  ! 684: LDUB_R	ldub	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf41d0000  ! 690: LDD_R	ldd	[%r20 + %r0], %r26
	mov	0, %r14
	.word 0xa193a000  ! 692: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf04ce0c0  ! 695: LDSB_I	ldsb	[%r19 + 0x00c0], %r24
	setx	0x20d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 705: RDPR_TT	<illegal instruction>
	setx	data_start_5, %g1, %r23
	.word 0xf214a0a6  ! 711: LDUH_I	lduh	[%r18 + 0x00a6], %r25
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20ce0ab  ! 715: LDUB_I	ldub	[%r19 + 0x00ab], %r25
	mov	0, %r14
	.word 0xa193a000  ! 717: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 720: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xf31c6162  ! 725: LDDF_I	ldd	[%r17, 0x0162], %f25
	.word 0xf84d8000  ! 728: LDSB_R	ldsb	[%r22 + %r0], %r28
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21c4000  ! 732: LDD_R	ldd	[%r17 + %r0], %r25
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 736: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf40de175  ! 740: LDUB_I	ldub	[%r23 + 0x0175], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c21a6  ! 746: LDX_I	ldx	[%r16 + 0x01a6], %r30
	.word 0xbe34e098  ! 751: ORN_I	orn 	%r19, 0x0098, %r31
	.word 0x9194e032  ! 752: WRPR_PIL_I	wrpr	%r19, 0x0032, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf60dc000  ! 757: LDUB_R	ldub	[%r23 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f51  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f51, %hpstate
	.word 0xfa040000  ! 764: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb7508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0xfa0d617a  ! 769: LDUB_I	ldub	[%r21 + 0x017a], %r29
	.word 0x8595a1ab  ! 770: WRPR_TSTATE_I	wrpr	%r22, 0x01ab, %tstate
	.word 0xfc454000  ! 771: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf644c000  ! 772: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xb6340000  ! 775: ORN_R	orn 	%r16, %r0, %r27
	.word 0xf00d0000  ! 778: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf11d2046  ! 786: LDDF_I	ldd	[%r20, 0x0046], %f24
	.word 0xfe0dc000  ! 787: LDUB_R	ldub	[%r23 + %r0], %r31
	setx	0x2013f, %g1, %o0
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
	setx	0x20213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xb351c000  ! 804: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf854a132  ! 810: LDSH_I	ldsh	[%r18 + 0x0132], %r28
	.word 0xb5510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xf25d0000  ! 813: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf25d2182  ! 815: LDX_I	ldx	[%r20 + 0x0182], %r25
	setx	data_start_5, %g1, %r17
	.word 0xf615a0f1  ! 821: LDUH_I	lduh	[%r22 + 0x00f1], %r27
	.word 0xfe05c000  ! 822: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xbf540000  ! 825: RDPR_GL	<illegal instruction>
	.word 0xf054208a  ! 827: LDSH_I	ldsh	[%r16 + 0x008a], %r24
	.word 0xf40c8000  ! 830: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xfe1c8000  ! 835: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xfc4cc000  ! 838: LDSB_R	ldsb	[%r19 + %r0], %r30
	setx	data_start_0, %g1, %r23
	setx	data_start_2, %g1, %r23
	.word 0xfe548000  ! 850: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf044c000  ! 851: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0x8994214f  ! 853: WRPR_TICK_I	wrpr	%r16, 0x014f, %tick
	.word 0xfe5d8000  ! 854: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xff1ce060  ! 862: LDDF_I	ldd	[%r19, 0x0060], %f31
	.word 0xf804a15b  ! 871: LDUW_I	lduw	[%r18 + 0x015b], %r28
	.word 0xf44dc000  ! 873: LDSB_R	ldsb	[%r23 + %r0], %r26
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65d215a  ! 875: LDX_I	ldx	[%r20 + 0x015a], %r27
	.word 0xf045a09b  ! 876: LDSW_I	ldsw	[%r22 + 0x009b], %r24
	.word 0xfd1ca054  ! 882: LDDF_I	ldd	[%r18, 0x0054], %f30
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0ce06e  ! 897: LDUB_I	ldub	[%r19 + 0x006e], %r31
	.word 0xfc0d8000  ! 902: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xfb1da15b  ! 906: LDDF_I	ldd	[%r22, 0x015b], %f29
	.word 0xb5520000  ! 908: RDPR_PIL	<illegal instruction>
	.word 0xf05d61b9  ! 910: LDX_I	ldx	[%r21 + 0x01b9], %r24
	.word 0xfe548000  ! 913: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xb5500000  ! 914: RDPR_TPC	<illegal instruction>
	.word 0xfc15c000  ! 916: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xfa1421f5  ! 922: LDUH_I	lduh	[%r16 + 0x01f5], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xf805e191  ! 925: LDUW_I	lduw	[%r23 + 0x0191], %r28
	.word 0xb1540000  ! 926: RDPR_GL	<illegal instruction>
	.word 0xfe0c60ba  ! 934: LDUB_I	ldub	[%r17 + 0x00ba], %r31
	.word 0xbc440000  ! 935: ADDC_R	addc 	%r16, %r0, %r30
	.word 0xbd520000  ! 936: RDPR_PIL	rdpr	%pil, %r30
	.word 0xbe34c000  ! 939: SUBC_R	orn 	%r19, %r0, %r31
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52d1000  ! 941: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xfc5d4000  ! 942: LDX_R	ldx	[%r21 + %r0], %r30
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd7d0400  ! 950: MOVR_R	movre	%r20, %r0, %r30
	.word 0x91946178  ! 952: WRPR_PIL_I	wrpr	%r17, 0x0178, %pil
	.word 0xb5508000  ! 955: RDPR_TSTATE	<illegal instruction>
	.word 0xf20de122  ! 957: LDUB_I	ldub	[%r23 + 0x0122], %r25
	setx	0x227, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 961: LDUH_R	lduh	[%r16 + %r0], %r25
	setx	0x320, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85c4000  ! 963: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf65ca182  ! 966: LDX_I	ldx	[%r18 + 0x0182], %r27
	.word 0xfe054000  ! 969: LDUW_R	lduw	[%r21 + %r0], %r31
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5ce106  ! 979: LDX_I	ldx	[%r19 + 0x0106], %r29
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf815a12d  ! 981: LDUH_I	lduh	[%r22 + 0x012d], %r28
	.word 0xfe4d4000  ! 984: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xbd510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xfc0cc000  ! 987: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xfc54203a  ! 988: LDSH_I	ldsh	[%r16 + 0x003a], %r30
	.word 0xf71d4000  ! 990: LDDF_R	ldd	[%r21, %r0], %f27
	setx	data_start_7, %g1, %r23
	.word 0xf01da09c  ! 999: LDD_I	ldd	[%r22 + 0x009c], %r24
	.word 0xbcbc2021  ! 1000: XNORcc_I	xnorcc 	%r16, 0x0021, %r30
	.word 0xb2b50000  ! 1002: ORNcc_R	orncc 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983e43  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e43, %hpstate
	.word 0xb7510000  ! 1012: RDPR_TICK	<illegal instruction>
	.word 0xfa054000  ! 1013: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xf0450000  ! 1030: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xbf504000  ! 1036: RDPR_TNPC	<illegal instruction>
	.word 0xba0d2016  ! 1037: AND_I	and 	%r20, 0x0016, %r29
	.word 0x91956006  ! 1039: WRPR_PIL_I	wrpr	%r21, 0x0006, %pil
	.word 0xf2044000  ! 1040: LDUW_R	lduw	[%r17 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983949  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1949, %hpstate
	.word 0x8d94e06a  ! 1045: WRPR_PSTATE_I	wrpr	%r19, 0x006a, %pstate
	.word 0xf2056053  ! 1047: LDUW_I	lduw	[%r21 + 0x0053], %r25
	.word 0xf0554000  ! 1048: LDSH_R	ldsh	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf214a014  ! 1051: LDUH_I	lduh	[%r18 + 0x0014], %r25
	.word 0xfc1d4000  ! 1059: LDD_R	ldd	[%r21 + %r0], %r30
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95613b  ! 1068: WRPR_PSTATE_I	wrpr	%r21, 0x013b, %pstate
	.word 0xbb480000  ! 1071: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	1, %r14
	.word 0xa193a000  ! 1072: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 1075: RDPR_TICK	<illegal instruction>
	.word 0xb5353001  ! 1077: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xf61c0000  ! 1079: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xfa05e007  ! 1080: LDUW_I	lduw	[%r23 + 0x0007], %r29
	.word 0xf64521c5  ! 1081: LDSW_I	ldsw	[%r20 + 0x01c5], %r27
	.word 0xf40cc000  ! 1087: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb535e001  ! 1091: SRL_I	srl 	%r23, 0x0001, %r26
	setx	data_start_0, %g1, %r22
	.word 0xf4058000  ! 1093: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfc1d4000  ! 1094: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0x8194e13c  ! 1096: WRPR_TPC_I	wrpr	%r19, 0x013c, %tpc
	.word 0xbf2df001  ! 1098: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0xbc258000  ! 1102: SUB_R	sub 	%r22, %r0, %r30
	.word 0xb0346199  ! 1103: ORN_I	orn 	%r17, 0x0199, %r24
	.word 0xfe4d0000  ! 1104: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf64c215b  ! 1112: LDSB_I	ldsb	[%r16 + 0x015b], %r27
	.word 0xf6544000  ! 1113: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb13d0000  ! 1114: SRA_R	sra 	%r20, %r0, %r24
	.word 0xb5518000  ! 1115: RDPR_PSTATE	<illegal instruction>
	.word 0xf71c8000  ! 1117: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xb5348000  ! 1120: SRL_R	srl 	%r18, %r0, %r26
	.word 0xf84c0000  ! 1123: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb9540000  ! 1130: RDPR_GL	<illegal instruction>
	.word 0xf804c000  ! 1131: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xfc0c61ad  ! 1132: LDUB_I	ldub	[%r17 + 0x01ad], %r30
	.word 0xbc0c4000  ! 1133: AND_R	and 	%r17, %r0, %r30
	.word 0xbd520000  ! 1134: RDPR_PIL	<illegal instruction>
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2050000  ! 1140: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xff1c8000  ! 1141: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf40d8000  ! 1142: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfe05a0cd  ! 1145: LDUW_I	lduw	[%r22 + 0x00cd], %r31
	.word 0xf85d8000  ! 1147: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb3540000  ! 1149: RDPR_GL	<illegal instruction>
	setx	0x303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 1152: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 1154: RDPR_TNPC	<illegal instruction>
	.word 0xba9c8000  ! 1155: XORcc_R	xorcc 	%r18, %r0, %r29
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1162: RDPR_TPC	<illegal instruction>
	.word 0xf254616b  ! 1166: LDSH_I	ldsh	[%r17 + 0x016b], %r25
	.word 0x919460bb  ! 1169: WRPR_PIL_I	wrpr	%r17, 0x00bb, %pil
	.word 0x8d952106  ! 1174: WRPR_PSTATE_I	wrpr	%r20, 0x0106, %pstate
	.word 0xb3508000  ! 1177: RDPR_TSTATE	<illegal instruction>
	.word 0xf254609f  ! 1179: LDSH_I	ldsh	[%r17 + 0x009f], %r25
	.word 0xfa4de00f  ! 1181: LDSB_I	ldsb	[%r23 + 0x000f], %r29
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32cf001  ! 1183: SLLX_I	sllx	%r19, 0x0001, %r25
	.word 0xfc0d8000  ! 1184: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb02d6163  ! 1186: ANDN_I	andn 	%r21, 0x0163, %r24
	.word 0xf21d0000  ! 1189: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xf11d21cf  ! 1190: LDDF_I	ldd	[%r20, 0x01cf], %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982b11  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b11, %hpstate
	.word 0xfe558000  ! 1196: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0x8595a14f  ! 1197: WRPR_TSTATE_I	wrpr	%r22, 0x014f, %tstate
	.word 0xf2440000  ! 1198: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xfe14a181  ! 1200: LDUH_I	lduh	[%r18 + 0x0181], %r31
	.word 0xb2240000  ! 1206: SUB_R	sub 	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982f81  ! 1209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	.word 0x8194613f  ! 1210: WRPR_TPC_I	wrpr	%r17, 0x013f, %tpc
	.word 0x8795201d  ! 1212: WRPR_TT_I	wrpr	%r20, 0x001d, %tt
	.word 0xbb3c8000  ! 1217: SRA_R	sra 	%r18, %r0, %r29
	.word 0xfc1d0000  ! 1218: LDD_R	ldd	[%r20 + %r0], %r30
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa050000  ! 1226: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xfe5dc000  ! 1228: LDX_R	ldx	[%r23 + %r0], %r31
	setx	0x10035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394608f  ! 1230: WRPR_TNPC_I	wrpr	%r17, 0x008f, %tnpc
	.word 0xfc544000  ! 1231: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfa058000  ! 1232: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf81d0000  ! 1238: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xbd540000  ! 1241: RDPR_GL	<illegal instruction>
	.word 0x91956052  ! 1243: WRPR_PIL_I	wrpr	%r21, 0x0052, %pil
	.word 0xfc048000  ! 1245: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfa5c0000  ! 1246: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf81da091  ! 1247: LDD_I	ldd	[%r22 + 0x0091], %r28
	.word 0xf44461a7  ! 1248: LDSW_I	ldsw	[%r17 + 0x01a7], %r26
	.word 0xf20d21e6  ! 1253: LDUB_I	ldub	[%r20 + 0x01e6], %r25
	.word 0x8195a09d  ! 1254: WRPR_TPC_I	wrpr	%r22, 0x009d, %tpc
	setx	data_start_2, %g1, %r22
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8550000  ! 1267: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf404c000  ! 1276: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf11dc000  ! 1277: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xfc4461d4  ! 1279: LDSW_I	ldsw	[%r17 + 0x01d4], %r30
	.word 0xbd50c000  ! 1283: RDPR_TT	<illegal instruction>
	.word 0xfa15c000  ! 1284: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xb550c000  ! 1285: RDPR_TT	<illegal instruction>
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d608b  ! 1296: LDSB_I	ldsb	[%r21 + 0x008b], %r28
	.word 0xfe544000  ! 1298: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf11da062  ! 1299: LDDF_I	ldd	[%r22, 0x0062], %f24
	.word 0x8d94e164  ! 1300: WRPR_PSTATE_I	wrpr	%r19, 0x0164, %pstate
	.word 0xf845613a  ! 1303: LDSW_I	ldsw	[%r21 + 0x013a], %r28
	.word 0xbc1d8000  ! 1304: XOR_R	xor 	%r22, %r0, %r30
	setx	data_start_1, %g1, %r17
	.word 0xf44c4000  ! 1308: LDSB_R	ldsb	[%r17 + %r0], %r26
	mov	1, %r14
	.word 0xa193a000  ! 1310: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf044a00a  ! 1311: LDSW_I	ldsw	[%r18 + 0x000a], %r24
	.word 0xf85cc000  ! 1313: LDX_R	ldx	[%r19 + %r0], %r28
	mov	2, %r14
	.word 0xa193a000  ! 1317: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982a4b  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4b, %hpstate
	.word 0xfc0d8000  ! 1320: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xbe344000  ! 1321: ORN_R	orn 	%r17, %r0, %r31
	.word 0xfc1cc000  ! 1322: LDD_R	ldd	[%r19 + %r0], %r30
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 1332: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0x8595a139  ! 1339: WRPR_TSTATE_I	wrpr	%r22, 0x0139, %tstate
	.word 0xf8052185  ! 1340: LDUW_I	lduw	[%r20 + 0x0185], %r28
	setx	data_start_0, %g1, %r19
	.word 0x8794613a  ! 1347: WRPR_TT_I	wrpr	%r17, 0x013a, %tt
	.word 0xf65de038  ! 1349: LDX_I	ldx	[%r23 + 0x0038], %r27
	.word 0xf0142152  ! 1352: LDUH_I	lduh	[%r16 + 0x0152], %r24
	.word 0x8d94a0a3  ! 1353: WRPR_PSTATE_I	wrpr	%r18, 0x00a3, %pstate
	.word 0xfc1c6160  ! 1359: LDD_I	ldd	[%r17 + 0x0160], %r30
	.word 0xfa4d2168  ! 1361: LDSB_I	ldsb	[%r20 + 0x0168], %r29
	.word 0xb350c000  ! 1363: RDPR_TT	<illegal instruction>
	.word 0xf84d21db  ! 1369: LDSB_I	ldsb	[%r20 + 0x01db], %r28
	.word 0xb3508000  ! 1370: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e09  ! 1374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e09, %hpstate
	.word 0xfe1c6099  ! 1376: LDD_I	ldd	[%r17 + 0x0099], %r31
	.word 0xfc14c000  ! 1377: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf24c0000  ! 1379: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe1d200f  ! 1381: LDD_I	ldd	[%r20 + 0x000f], %r31
	.word 0xbcc4e0a7  ! 1388: ADDCcc_I	addccc 	%r19, 0x00a7, %r30
	.word 0xf0446183  ! 1394: LDSW_I	ldsw	[%r17 + 0x0183], %r24
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf054e14b  ! 1400: LDSH_I	ldsh	[%r19 + 0x014b], %r24
	.word 0xbb540000  ! 1405: RDPR_GL	<illegal instruction>
	.word 0xf044a0b7  ! 1407: LDSW_I	ldsw	[%r18 + 0x00b7], %r24
	.word 0xb3504000  ! 1411: RDPR_TNPC	<illegal instruction>
	.word 0xfa5d0000  ! 1414: LDX_R	ldx	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 1415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0xf654e10c  ! 1420: LDSH_I	ldsh	[%r19 + 0x010c], %r27
	.word 0xbd50c000  ! 1422: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 1423: RDPR_TNPC	<illegal instruction>
	.word 0xb32c3001  ! 1424: SLLX_I	sllx	%r16, 0x0001, %r25
	setx	0x2000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf614e1bc  ! 1428: LDUH_I	lduh	[%r19 + 0x01bc], %r27
	.word 0xf2448000  ! 1432: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xb894c000  ! 1436: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0xb0c5e00e  ! 1438: ADDCcc_I	addccc 	%r23, 0x000e, %r24
	.word 0xfa0da0b8  ! 1442: LDUB_I	ldub	[%r22 + 0x00b8], %r29
	.word 0xbb2d2001  ! 1448: SLL_I	sll 	%r20, 0x0001, %r29
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe55e002  ! 1452: LDSH_I	ldsh	[%r23 + 0x0002], %r31
	.word 0xb9340000  ! 1454: SRL_R	srl 	%r16, %r0, %r28
	.word 0xfe05a10a  ! 1455: LDUW_I	lduw	[%r22 + 0x010a], %r31
	.word 0xff1ca000  ! 1456: LDDF_I	ldd	[%r18, 0x0000], %f31
	.word 0xfa4460ad  ! 1457: LDSW_I	ldsw	[%r17 + 0x00ad], %r29
	mov	2, %r14
	.word 0xa193a000  ! 1458: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfd1cc000  ! 1461: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf85461c5  ! 1462: LDSH_I	ldsh	[%r17 + 0x01c5], %r28
	.word 0xb9518000  ! 1464: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf40cc000  ! 1465: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb0854000  ! 1466: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xfc44e176  ! 1468: LDSW_I	ldsw	[%r19 + 0x0176], %r30
	.word 0xf40dc000  ! 1471: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xfc5421b9  ! 1476: LDSH_I	ldsh	[%r16 + 0x01b9], %r30
	.word 0xf8158000  ! 1479: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xfe444000  ! 1481: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xff1d60c5  ! 1482: LDDF_I	ldd	[%r21, 0x00c5], %f31
	.word 0xfe1c21b8  ! 1483: LDD_I	ldd	[%r16 + 0x01b8], %r31
	.word 0xf0558000  ! 1485: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb4a5a17b  ! 1487: SUBcc_I	subcc 	%r22, 0x017b, %r26
	.word 0x87942184  ! 1489: WRPR_TT_I	wrpr	%r16, 0x0184, %tt
	.word 0xf44d60ea  ! 1491: LDSB_I	ldsb	[%r21 + 0x00ea], %r26
	.word 0xfa1ca065  ! 1493: LDD_I	ldd	[%r18 + 0x0065], %r29
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf7d2401  ! 1495: MOVR_I	movre	%r20, 0x1, %r31
	.word 0xbf50c000  ! 1497: RDPR_TT	<illegal instruction>
	.word 0xf4444000  ! 1498: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfb1d0000  ! 1502: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xba15614e  ! 1503: OR_I	or 	%r21, 0x014e, %r29
	.word 0xb2858000  ! 1508: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xf05d20e3  ! 1512: LDX_I	ldx	[%r20 + 0x00e3], %r24
	.word 0xb7510000  ! 1513: RDPR_TICK	<illegal instruction>
	.word 0xfc0c6038  ! 1517: LDUB_I	ldub	[%r17 + 0x0038], %r30
	.word 0x8795e136  ! 1518: WRPR_TT_I	wrpr	%r23, 0x0136, %tt
	.word 0xb92dd000  ! 1523: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb8a56083  ! 1524: SUBcc_I	subcc 	%r21, 0x0083, %r28
	.word 0x839461b0  ! 1525: WRPR_TNPC_I	wrpr	%r17, 0x01b0, %tnpc
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc45c000  ! 1531: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0x8394a15a  ! 1533: WRPR_TNPC_I	wrpr	%r18, 0x015a, %tnpc
	.word 0xbe1da046  ! 1535: XOR_I	xor 	%r22, 0x0046, %r31
	.word 0x8595a1c7  ! 1536: WRPR_TSTATE_I	wrpr	%r22, 0x01c7, %tstate
	mov	0, %r14
	.word 0xa193a000  ! 1540: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	2, %r12
	.word 0x8f932000  ! 1542: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd508000  ! 1543: RDPR_TSTATE	<illegal instruction>
	.word 0xf20d0000  ! 1545: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfc5c2077  ! 1547: LDX_I	ldx	[%r16 + 0x0077], %r30
	.word 0xf40c60e1  ! 1550: LDUB_I	ldub	[%r17 + 0x00e1], %r26
	.word 0xf6458000  ! 1551: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xb951c000  ! 1553: RDPR_TL	<illegal instruction>
	setx	data_start_5, %g1, %r23
	.word 0x8d9421ca  ! 1562: WRPR_PSTATE_I	wrpr	%r16, 0x01ca, %pstate
	.word 0xf2056124  ! 1564: LDUW_I	lduw	[%r21 + 0x0124], %r25
	.word 0xb6150000  ! 1565: OR_R	or 	%r20, %r0, %r27
	.word 0x8995e156  ! 1567: WRPR_TICK_I	wrpr	%r23, 0x0156, %tick
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0560c2  ! 1569: LDUW_I	lduw	[%r21 + 0x00c2], %r31
	setx	0x30339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 1578: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb81c4000  ! 1580: XOR_R	xor 	%r17, %r0, %r28
	setx	0x3011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xf405606a  ! 1590: LDUW_I	lduw	[%r21 + 0x006a], %r26
	.word 0xbb518000  ! 1591: RDPR_PSTATE	<illegal instruction>
	.word 0xf61ce066  ! 1592: LDD_I	ldd	[%r19 + 0x0066], %r27
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1596: RDPR_PSTATE	<illegal instruction>
	.word 0xf4446131  ! 1597: LDSW_I	ldsw	[%r17 + 0x0131], %r26
	.word 0xb93cf001  ! 1600: SRAX_I	srax	%r19, 0x0001, %r28
	.word 0xf51d4000  ! 1601: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xb3510000  ! 1602: RDPR_TICK	<illegal instruction>
	.word 0xf604c000  ! 1604: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf255c000  ! 1606: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0x8194e180  ! 1607: WRPR_TPC_I	wrpr	%r19, 0x0180, %tpc
	.word 0xfd1d2076  ! 1611: LDDF_I	ldd	[%r20, 0x0076], %f30
	.word 0x859560de  ! 1612: WRPR_TSTATE_I	wrpr	%r21, 0x00de, %tstate
	.word 0xba04e08c  ! 1613: ADD_I	add 	%r19, 0x008c, %r29
	.word 0xfa440000  ! 1616: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf4548000  ! 1617: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfa0d219a  ! 1621: LDUB_I	ldub	[%r20 + 0x019a], %r29
	.word 0xb09d206b  ! 1625: XORcc_I	xorcc 	%r20, 0x006b, %r24
	.word 0xbf34e001  ! 1626: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xf4058000  ! 1629: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xb00cc000  ! 1630: AND_R	and 	%r19, %r0, %r24
	.word 0xf2548000  ! 1635: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xbd508000  ! 1638: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf80420a3  ! 1640: LDUW_I	lduw	[%r16 + 0x00a3], %r28
	.word 0xb02c0000  ! 1641: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xf71da0ea  ! 1642: LDDF_I	ldd	[%r22, 0x00ea], %f27
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d4000  ! 1644: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf44ca1cf  ! 1646: LDSB_I	ldsb	[%r18 + 0x01cf], %r26
	setx	0x31a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb97ce401  ! 1648: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xf00d4000  ! 1652: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xb4954000  ! 1653: ORcc_R	orcc 	%r21, %r0, %r26
	setx	0x30019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bda0cc  ! 1656: XNORcc_I	xnorcc 	%r22, 0x00cc, %r26
	.word 0xfd1de1f2  ! 1660: LDDF_I	ldd	[%r23, 0x01f2], %f30
	.word 0xf81c0000  ! 1665: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0xb7520000  ! 1666: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4144000  ! 1668: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xb550c000  ! 1672: RDPR_TT	<illegal instruction>
	.word 0xf40d8000  ! 1673: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf80c4000  ! 1676: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xfe44c000  ! 1677: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf6044000  ! 1679: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf81d20f7  ! 1681: LDD_I	ldd	[%r20 + 0x00f7], %r28
	.word 0xfa54a080  ! 1683: LDSH_I	ldsh	[%r18 + 0x0080], %r29
	.word 0xb0b460fe  ! 1686: SUBCcc_I	orncc 	%r17, 0x00fe, %r24
	.word 0xbd480000  ! 1690: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1500000  ! 1692: RDPR_TPC	<illegal instruction>
	.word 0xf0140000  ! 1693: LDUH_R	lduh	[%r16 + %r0], %r24
	setx	0x13c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91952020  ! 1696: WRPR_PIL_I	wrpr	%r20, 0x0020, %pil
	.word 0xbb500000  ! 1697: RDPR_TPC	<illegal instruction>
	.word 0xbb518000  ! 1698: RDPR_PSTATE	<illegal instruction>
	.word 0xf454611c  ! 1699: LDSH_I	ldsh	[%r17 + 0x011c], %r26
	.word 0xf014a103  ! 1703: LDUH_I	lduh	[%r18 + 0x0103], %r24
	.word 0xf05c6003  ! 1704: LDX_I	ldx	[%r17 + 0x0003], %r24
	.word 0x8195a1d4  ! 1706: WRPR_TPC_I	wrpr	%r22, 0x01d4, %tpc
	.word 0xb1500000  ! 1707: RDPR_TPC	<illegal instruction>
	.word 0xf40c603e  ! 1708: LDUB_I	ldub	[%r17 + 0x003e], %r26
	setx	0x20b, %g1, %o0
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
	.word 0xbd540000  ! 1716: RDPR_GL	<illegal instruction>
	.word 0xb5518000  ! 1717: RDPR_PSTATE	<illegal instruction>
	.word 0xf25461ec  ! 1721: LDSH_I	ldsh	[%r17 + 0x01ec], %r25
	.word 0xf44dc000  ! 1727: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xb2c44000  ! 1728: ADDCcc_R	addccc 	%r17, %r0, %r25
	.word 0xfe442174  ! 1729: LDSW_I	ldsw	[%r16 + 0x0174], %r31
	.word 0xfa5dc000  ! 1730: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xb2a40000  ! 1734: SUBcc_R	subcc 	%r16, %r0, %r25
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51d8000  ! 1738: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf61d2120  ! 1739: LDD_I	ldd	[%r20 + 0x0120], %r27
	.word 0xf40de139  ! 1741: LDUB_I	ldub	[%r23 + 0x0139], %r26
	setx	data_start_4, %g1, %r21
	.word 0x8594e1ef  ! 1750: WRPR_TSTATE_I	wrpr	%r19, 0x01ef, %tstate
	setx	data_start_5, %g1, %r19
	.word 0xb83c21d9  ! 1754: XNOR_I	xnor 	%r16, 0x01d9, %r28
	.word 0xb17d0400  ! 1756: MOVR_R	movre	%r20, %r0, %r24
	.word 0xbe1d60b4  ! 1759: XOR_I	xor 	%r21, 0x00b4, %r31
	.word 0xb1359000  ! 1766: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xfc54e0c5  ! 1767: LDSH_I	ldsh	[%r19 + 0x00c5], %r30
	.word 0xfe044000  ! 1768: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf6040000  ! 1769: LDUW_R	lduw	[%r16 + %r0], %r27
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf845208a  ! 1777: LDSW_I	ldsw	[%r20 + 0x008a], %r28
	.word 0x8994e05e  ! 1780: WRPR_TICK_I	wrpr	%r19, 0x005e, %tick
	.word 0xf405e13a  ! 1781: LDUW_I	lduw	[%r23 + 0x013a], %r26
	.word 0xfe1ca0f7  ! 1782: LDD_I	ldd	[%r18 + 0x00f7], %r31
	.word 0xf0450000  ! 1788: LDSW_R	ldsw	[%r20 + %r0], %r24
	setx	data_start_3, %g1, %r22
	.word 0xb62d0000  ! 1793: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xf215a1a5  ! 1794: LDUH_I	lduh	[%r22 + 0x01a5], %r25
	.word 0xf215e18f  ! 1797: LDUH_I	lduh	[%r23 + 0x018f], %r25
	.word 0xbf500000  ! 1799: RDPR_TPC	<illegal instruction>
	.word 0xf64ce083  ! 1804: LDSB_I	ldsb	[%r19 + 0x0083], %r27
	.word 0xb97dc400  ! 1806: MOVR_R	movre	%r23, %r0, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1807: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa1c606f  ! 1814: LDD_I	ldd	[%r17 + 0x006f], %r29
	.word 0xb7348000  ! 1817: SRL_R	srl 	%r18, %r0, %r27
	setx	0x33d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xf04c4000  ! 1840: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0x9195618c  ! 1843: WRPR_PIL_I	wrpr	%r21, 0x018c, %pil
	.word 0xfe0d8000  ! 1845: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf255c000  ! 1847: LDSH_R	ldsh	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xf81c8000  ! 1849: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf814e14b  ! 1850: LDUH_I	lduh	[%r19 + 0x014b], %r28
	.word 0xf91d8000  ! 1852: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xf65d4000  ! 1853: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xb1510000  ! 1856: RDPR_TICK	<illegal instruction>
	.word 0xfe050000  ! 1863: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xf64c6147  ! 1864: LDSB_I	ldsb	[%r17 + 0x0147], %r27
	.word 0xf41d6091  ! 1874: LDD_I	ldd	[%r21 + 0x0091], %r26
	.word 0xfc45c000  ! 1878: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf24d8000  ! 1881: LDSB_R	ldsb	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983e83  ! 1885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e83, %hpstate
	.word 0xf80dc000  ! 1890: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0x8195a03c  ! 1892: WRPR_TPC_I	wrpr	%r22, 0x003c, %tpc
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595214e  ! 1894: WRPR_TSTATE_I	wrpr	%r20, 0x014e, %tstate
	setx	data_start_1, %g1, %r16
	.word 0xb2258000  ! 1899: SUB_R	sub 	%r22, %r0, %r25
	.word 0xf6056080  ! 1900: LDUW_I	lduw	[%r21 + 0x0080], %r27
	.word 0xfe1de1ff  ! 1903: LDD_I	ldd	[%r23 + 0x01ff], %r31
	.word 0xb0a54000  ! 1904: SUBcc_R	subcc 	%r21, %r0, %r24
	.word 0xbcb5a014  ! 1906: ORNcc_I	orncc 	%r22, 0x0014, %r30
	.word 0x85942055  ! 1908: WRPR_TSTATE_I	wrpr	%r16, 0x0055, %tstate
	.word 0xf615e031  ! 1909: LDUH_I	lduh	[%r23 + 0x0031], %r27
	.word 0xfa558000  ! 1913: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf4154000  ! 1916: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xb0adc000  ! 1919: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xfe0c2126  ! 1920: LDUB_I	ldub	[%r16 + 0x0126], %r31
	.word 0xf8056178  ! 1922: LDUW_I	lduw	[%r21 + 0x0178], %r28
	.word 0xf20c4000  ! 1923: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xf81da137  ! 1926: LDD_I	ldd	[%r22 + 0x0137], %r28
	.word 0xfa4c20c9  ! 1928: LDSB_I	ldsb	[%r16 + 0x00c9], %r29
	.word 0xb60c616c  ! 1935: AND_I	and 	%r17, 0x016c, %r27
	.word 0xfe5c0000  ! 1939: LDX_R	ldx	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x8198294b  ! 1940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094b, %hpstate
	.word 0xf01cc000  ! 1943: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xbb520000  ! 1944: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 1949: RDPR_PSTATE	<illegal instruction>
	.word 0xbebc6190  ! 1950: XNORcc_I	xnorcc 	%r17, 0x0190, %r31
	.word 0xf24de0ae  ! 1951: LDSB_I	ldsb	[%r23 + 0x00ae], %r25
	.word 0xfa44e177  ! 1953: LDSW_I	ldsw	[%r19 + 0x0177], %r29
	.word 0xf60c0000  ! 1954: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xbd3df001  ! 1955: SRAX_I	srax	%r23, 0x0001, %r30
	.word 0xf80c0000  ! 1957: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xb3480000  ! 1960: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfb1de1d9  ! 1961: LDDF_I	ldd	[%r23, 0x01d9], %f29
	.word 0xb3504000  ! 1964: RDPR_TNPC	<illegal instruction>
	.word 0xb751c000  ! 1965: RDPR_TL	<illegal instruction>
	.word 0xb4b54000  ! 1966: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xfa44618e  ! 1970: LDSW_I	ldsw	[%r17 + 0x018e], %r29
	.word 0xf4444000  ! 1972: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfc046112  ! 1974: LDUW_I	lduw	[%r17 + 0x0112], %r30
	setx	data_start_1, %g1, %r16
	.word 0xf2450000  ! 1980: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xf65d4000  ! 1984: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0x8394a185  ! 1989: WRPR_TNPC_I	wrpr	%r18, 0x0185, %tnpc
	.word 0xbf504000  ! 1990: RDPR_TNPC	<illegal instruction>
	.word 0xb2344000  ! 1991: ORN_R	orn 	%r17, %r0, %r25
	.word 0xf60520ed  ! 1997: LDUW_I	lduw	[%r20 + 0x00ed], %r27
	setx	data_start_1, %g1, %r21
	.word 0x9194a1dd  ! 2007: WRPR_PIL_I	wrpr	%r18, 0x01dd, %pil
	.word 0xb5504000  ! 2008: RDPR_TNPC	<illegal instruction>
	.word 0xf8048000  ! 2009: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xb4b56143  ! 2013: SUBCcc_I	orncc 	%r21, 0x0143, %r26
	.word 0xf21d0000  ! 2015: LDD_R	ldd	[%r20 + %r0], %r25
	setx	0x30b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e16b  ! 2021: WRPR_TNPC_I	wrpr	%r23, 0x016b, %tnpc
	.word 0xb750c000  ! 2022: RDPR_TT	<illegal instruction>
	.word 0xf31ce0de  ! 2025: LDDF_I	ldd	[%r19, 0x00de], %f25
	.word 0xf11d4000  ! 2026: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xb415c000  ! 2028: OR_R	or 	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983d51  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d51, %hpstate
	.word 0xf6148000  ! 2035: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0x8995e0e5  ! 2036: WRPR_TICK_I	wrpr	%r23, 0x00e5, %tick
	.word 0xb1480000  ! 2038: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf2540000  ! 2039: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf654c000  ! 2040: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xfe0cc000  ! 2042: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0x8d952080  ! 2046: WRPR_PSTATE_I	wrpr	%r20, 0x0080, %pstate
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4d8000  ! 2051: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xb285a18f  ! 2052: ADDcc_I	addcc 	%r22, 0x018f, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983899  ! 2054: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1899, %hpstate
	.word 0x8395a18f  ! 2056: WRPR_TNPC_I	wrpr	%r22, 0x018f, %tnpc
	setx	0x11a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6a4c000  ! 2060: SUBcc_R	subcc 	%r19, %r0, %r27
	mov	2, %r12
	.word 0x8f932000  ! 2061: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf04cc000  ! 2070: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf254e118  ! 2075: LDSH_I	ldsh	[%r19 + 0x0118], %r25
	.word 0xfa54c000  ! 2081: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0x8995e0cb  ! 2089: WRPR_TICK_I	wrpr	%r23, 0x00cb, %tick
	.word 0xb4340000  ! 2090: ORN_R	orn 	%r16, %r0, %r26
	.word 0xbc85c000  ! 2092: ADDcc_R	addcc 	%r23, %r0, %r30
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2100: RDPR_PIL	<illegal instruction>
	.word 0xf61da1e7  ! 2101: LDD_I	ldd	[%r22 + 0x01e7], %r27
	.word 0xb950c000  ! 2103: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 2104: RDPR_PIL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2105: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31d61c7  ! 2107: LDDF_I	ldd	[%r21, 0x01c7], %f25
	setx	data_start_5, %g1, %r21
	mov	2, %r12
	.word 0x8f932000  ! 2112: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc1d20cf  ! 2114: LDD_I	ldd	[%r20 + 0x00cf], %r30
	.word 0xf20d0000  ! 2115: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfe44216c  ! 2116: LDSW_I	ldsw	[%r16 + 0x016c], %r31
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a11  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a11, %hpstate
	setx	data_start_3, %g1, %r17
	.word 0xf80ce147  ! 2121: LDUB_I	ldub	[%r19 + 0x0147], %r28
	.word 0xfa4d4000  ! 2122: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf41d6045  ! 2123: LDD_I	ldd	[%r21 + 0x0045], %r26
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf65c4000  ! 2125: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xbd35b001  ! 2126: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xb351c000  ! 2127: RDPR_TL	<illegal instruction>
	.word 0xf6154000  ! 2130: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0x8d95a1d0  ! 2131: WRPR_PSTATE_I	wrpr	%r22, 0x01d0, %pstate
	.word 0xb834e1c3  ! 2132: ORN_I	orn 	%r19, 0x01c3, %r28
	.word 0xbabca08f  ! 2133: XNORcc_I	xnorcc 	%r18, 0x008f, %r29
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5d4000  ! 2135: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf6140000  ! 2139: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xbb2cd000  ! 2143: SLLX_R	sllx	%r19, %r0, %r29
	.word 0xb7540000  ! 2147: RDPR_GL	<illegal instruction>
	.word 0x8395a0a5  ! 2148: WRPR_TNPC_I	wrpr	%r22, 0x00a5, %tnpc
	.word 0xfe450000  ! 2149: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xb151c000  ! 2150: RDPR_TL	<illegal instruction>
	.word 0xfa54c000  ! 2154: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xb57ca401  ! 2159: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xb23d4000  ! 2160: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xf25ce059  ! 2162: LDX_I	ldx	[%r19 + 0x0059], %r25
	.word 0xbf540000  ! 2163: RDPR_GL	<illegal instruction>
	.word 0xfe5520b1  ! 2166: LDSH_I	ldsh	[%r20 + 0x00b1], %r31
	.word 0xb02de00b  ! 2170: ANDN_I	andn 	%r23, 0x000b, %r24
	setx	0x2013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24cc000  ! 2172: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xf8148000  ! 2173: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf01dc000  ! 2182: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xb57ca401  ! 2185: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xf71c8000  ! 2187: LDDF_R	ldd	[%r18, %r0], %f27
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e1dd  ! 2190: WRPR_TICK_I	wrpr	%r23, 0x01dd, %tick
	.word 0xf11cc000  ! 2192: LDDF_R	ldd	[%r19, %r0], %f24
	setx	data_start_6, %g1, %r16
	.word 0xf6440000  ! 2195: LDSW_R	ldsw	[%r16 + %r0], %r27
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 2197: RDPR_PIL	<illegal instruction>
	.word 0xf4154000  ! 2198: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xfe154000  ! 2199: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf40c0000  ! 2204: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0x8995a157  ! 2205: WRPR_TICK_I	wrpr	%r22, 0x0157, %tick
	.word 0xf24421a8  ! 2207: LDSW_I	ldsw	[%r16 + 0x01a8], %r25
	.word 0xb951c000  ! 2210: RDPR_TL	<illegal instruction>
	.word 0xf25d4000  ! 2211: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf81d4000  ! 2212: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xf455c000  ! 2215: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xbf508000  ! 2217: RDPR_TSTATE	<illegal instruction>
	.word 0x8995a108  ! 2219: WRPR_TICK_I	wrpr	%r22, 0x0108, %tick
	.word 0xf414e1ff  ! 2224: LDUH_I	lduh	[%r19 + 0x01ff], %r26
	.word 0xfc4c6193  ! 2232: LDSB_I	ldsb	[%r17 + 0x0193], %r30
	.word 0xf25461a1  ! 2234: LDSH_I	ldsh	[%r17 + 0x01a1], %r25
	setx	0x30037, %g1, %o0
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
	.word 0xb1540000  ! 2239: RDPR_GL	<illegal instruction>
	.word 0xb5518000  ! 2240: RDPR_PSTATE	<illegal instruction>
	.word 0xf45561cd  ! 2242: LDSH_I	ldsh	[%r21 + 0x01cd], %r26
	.word 0xbc8da077  ! 2243: ANDcc_I	andcc 	%r22, 0x0077, %r30
	.word 0xb5518000  ! 2248: RDPR_PSTATE	<illegal instruction>
	.word 0xfa0460a8  ! 2249: LDUW_I	lduw	[%r17 + 0x00a8], %r29
	.word 0xfa154000  ! 2251: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb351c000  ! 2257: RDPR_TL	<illegal instruction>
	.word 0xfe440000  ! 2258: LDSW_R	ldsw	[%r16 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 2263: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb551c000  ! 2267: RDPR_TL	<illegal instruction>
	.word 0xf01460b3  ! 2268: LDUH_I	lduh	[%r17 + 0x00b3], %r24
	.word 0xb9510000  ! 2271: RDPR_TICK	<illegal instruction>
	.word 0xf4048000  ! 2272: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf2546098  ! 2277: LDSH_I	ldsh	[%r17 + 0x0098], %r25
	.word 0xf21c60cc  ! 2279: LDD_I	ldd	[%r17 + 0x00cc], %r25
	.word 0xf0446053  ! 2280: LDSW_I	ldsw	[%r17 + 0x0053], %r24
	.word 0xf40da1df  ! 2285: LDUB_I	ldub	[%r22 + 0x01df], %r26
	.word 0xf605a0f6  ! 2286: LDUW_I	lduw	[%r22 + 0x00f6], %r27
	.word 0xfa4520f0  ! 2287: LDSW_I	ldsw	[%r20 + 0x00f0], %r29
	setx	0x30119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2150000  ! 2291: LDUH_R	lduh	[%r20 + %r0], %r25
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 2295: RDPR_TNPC	<illegal instruction>
	.word 0xf244a13c  ! 2296: LDSW_I	ldsw	[%r18 + 0x013c], %r25
	.word 0xfa544000  ! 2303: LDSH_R	ldsh	[%r17 + %r0], %r29
	setx	0x10019, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 2307: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfc54e125  ! 2309: LDSH_I	ldsh	[%r19 + 0x0125], %r30
	.word 0xfc4cc000  ! 2311: LDSB_R	ldsb	[%r19 + %r0], %r30
	setx	0x325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc552074  ! 2319: LDSH_I	ldsh	[%r20 + 0x0074], %r30
	.word 0xb93c6001  ! 2320: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xfe1d8000  ! 2322: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xb1342001  ! 2327: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xff1c4000  ! 2329: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf4158000  ! 2331: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0x839460ed  ! 2334: WRPR_TNPC_I	wrpr	%r17, 0x00ed, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 2335: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc4da197  ! 2337: LDSB_I	ldsb	[%r22 + 0x0197], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983a49  ! 2338: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a49, %hpstate
	.word 0xfe1c21e3  ! 2339: LDD_I	ldd	[%r16 + 0x01e3], %r31
	.word 0xbd500000  ! 2340: RDPR_TPC	<illegal instruction>
	.word 0x8395e0d3  ! 2341: WRPR_TNPC_I	wrpr	%r23, 0x00d3, %tnpc
	.word 0xfb1c4000  ! 2342: LDDF_R	ldd	[%r17, %r0], %f29
	mov	1, %r14
	.word 0xa193a000  ! 2343: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8795a169  ! 2346: WRPR_TT_I	wrpr	%r22, 0x0169, %tt
	.word 0xf71de1d0  ! 2347: LDDF_I	ldd	[%r23, 0x01d0], %f27
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e0fb  ! 2351: WRPR_TPC_I	wrpr	%r23, 0x00fb, %tpc
	.word 0xfb1c4000  ! 2352: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xb1508000  ! 2353: RDPR_TSTATE	<illegal instruction>
	.word 0xb7518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	.word 0xfe5c60ee  ! 2356: LDX_I	ldx	[%r17 + 0x00ee], %r31
	setx	data_start_4, %g1, %r20
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20da07e  ! 2362: LDUB_I	ldub	[%r22 + 0x007e], %r25
	.word 0xfa0460ef  ! 2363: LDUW_I	lduw	[%r17 + 0x00ef], %r29
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983acb  ! 2369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acb, %hpstate
	.word 0xb1540000  ! 2370: RDPR_GL	<illegal instruction>
	setx	0x10324, %g1, %o0
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
	.word 0xb9508000  ! 2376: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1c4000  ! 2380: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xbd504000  ! 2382: RDPR_TNPC	<illegal instruction>
	.word 0xf205e1b1  ! 2384: LDUW_I	lduw	[%r23 + 0x01b1], %r25
	.word 0xf41cc000  ! 2389: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xfc4cc000  ! 2390: LDSB_R	ldsb	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 2392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xf01de18a  ! 2395: LDD_I	ldd	[%r23 + 0x018a], %r24
	.word 0x839520e4  ! 2397: WRPR_TNPC_I	wrpr	%r20, 0x00e4, %tnpc
	.word 0xf2450000  ! 2398: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xf00d4000  ! 2399: LDUB_R	ldub	[%r21 + %r0], %r24
	mov	1, %r12
	.word 0x8f932000  ! 2400: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc1cc000  ! 2404: LDD_R	ldd	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982e9b  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0xf65ca181  ! 2408: LDX_I	ldx	[%r18 + 0x0181], %r27
	.word 0xb9480000  ! 2413: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf20d0000  ! 2416: LDUB_R	ldub	[%r20 + %r0], %r25
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb634a0f4  ! 2418: ORN_I	orn 	%r18, 0x00f4, %r27
	.word 0xfa05a023  ! 2421: LDUW_I	lduw	[%r22 + 0x0023], %r29
	.word 0xf6444000  ! 2422: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xf44d21ec  ! 2423: LDSB_I	ldsb	[%r20 + 0x01ec], %r26
	.word 0xbf508000  ! 2426: RDPR_TSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2429: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc450000  ! 2432: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf11d0000  ! 2435: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xbb3de001  ! 2439: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xfa0ca10c  ! 2440: LDUB_I	ldub	[%r18 + 0x010c], %r29
	.word 0xf455600f  ! 2442: LDSH_I	ldsh	[%r21 + 0x000f], %r26
	.word 0xf254e071  ! 2445: LDSH_I	ldsh	[%r19 + 0x0071], %r25
	.word 0xfb1c4000  ! 2449: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xb7520000  ! 2450: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf31d61bd  ! 2453: LDDF_I	ldd	[%r21, 0x01bd], %f25
	.word 0xbf50c000  ! 2454: RDPR_TT	<illegal instruction>
	.word 0xb7510000  ! 2456: RDPR_TICK	<illegal instruction>
	.word 0xf245213b  ! 2458: LDSW_I	ldsw	[%r20 + 0x013b], %r25
	.word 0xfc5dc000  ! 2459: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf2140000  ! 2461: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xb6248000  ! 2465: SUB_R	sub 	%r18, %r0, %r27
	.word 0xfa552179  ! 2466: LDSH_I	ldsh	[%r20 + 0x0179], %r29
	.word 0xf91dc000  ! 2467: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf244e131  ! 2470: LDSW_I	ldsw	[%r19 + 0x0131], %r25
	setx	0x1, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 2472: RDPR_PSTATE	<illegal instruction>
	.word 0xf21dc000  ! 2473: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xb4048000  ! 2474: ADD_R	add 	%r18, %r0, %r26
	.word 0x8594601c  ! 2477: WRPR_TSTATE_I	wrpr	%r17, 0x001c, %tstate
	.word 0xb3480000  ! 2478: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa5cc000  ! 2479: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf2148000  ! 2480: LDUH_R	lduh	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983c41  ! 2484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c41, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982b49  ! 2490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b49, %hpstate
	.word 0xf05d8000  ! 2496: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xb60c60d0  ! 2497: AND_I	and 	%r17, 0x00d0, %r27
	.word 0xff1ce00e  ! 2498: LDDF_I	ldd	[%r19, 0x000e], %f31
	.word 0xf61d8000  ! 2499: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xf205c000  ! 2508: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf054e00e  ! 2509: LDSH_I	ldsh	[%r19 + 0x000e], %r24
	.word 0xf65de086  ! 2512: LDX_I	ldx	[%r23 + 0x0086], %r27
	.word 0xf65c8000  ! 2514: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xbf480000  ! 2515: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_0, %g1, %r19
	.word 0x9194a1fc  ! 2523: WRPR_PIL_I	wrpr	%r18, 0x01fc, %pil
	.word 0xf41c8000  ! 2524: LDD_R	ldd	[%r18 + %r0], %r26
	setx	0x334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d4000  ! 2527: LDDF_R	ldd	[%r21, %r0], %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4440000  ! 2529: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf61d8000  ! 2530: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0x8594215e  ! 2531: WRPR_TSTATE_I	wrpr	%r16, 0x015e, %tstate
	.word 0x8395e066  ! 2532: WRPR_TNPC_I	wrpr	%r23, 0x0066, %tnpc
	.word 0xf31d8000  ! 2533: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf455e0bb  ! 2536: LDSH_I	ldsh	[%r23 + 0x00bb], %r26
	setx	data_start_3, %g1, %r16
	.word 0x8795e11f  ! 2541: WRPR_TT_I	wrpr	%r23, 0x011f, %tt
	.word 0xf004c000  ! 2550: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xb7508000  ! 2553: RDPR_TSTATE	<illegal instruction>
	.word 0xf6442131  ! 2555: LDSW_I	ldsw	[%r16 + 0x0131], %r27
	.word 0xf2544000  ! 2557: LDSH_R	ldsh	[%r17 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xff1dc000  ! 2564: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xfa05c000  ! 2567: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xf2044000  ! 2569: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xf20c6064  ! 2571: LDUB_I	ldub	[%r17 + 0x0064], %r25
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 2575: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf604e160  ! 2579: LDUW_I	lduw	[%r19 + 0x0160], %r27
	.word 0x879461a0  ! 2586: WRPR_TT_I	wrpr	%r17, 0x01a0, %tt
	.word 0xf445c000  ! 2590: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf41de0ec  ! 2593: LDD_I	ldd	[%r23 + 0x00ec], %r26
	.word 0xf605c000  ! 2594: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xfe1d8000  ! 2595: LDD_R	ldd	[%r22 + %r0], %r31
	mov	0, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe0ca0f4  ! 2599: LDUB_I	ldub	[%r18 + 0x00f4], %r31
	.word 0xf2554000  ! 2601: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf64c6034  ! 2602: LDSB_I	ldsb	[%r17 + 0x0034], %r27
	.word 0x8d94a1cf  ! 2603: WRPR_PSTATE_I	wrpr	%r18, 0x01cf, %pstate
	.word 0xfc5c4000  ! 2605: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0x8194a0d9  ! 2607: WRPR_TPC_I	wrpr	%r18, 0x00d9, %tpc
	.word 0xbf520000  ! 2608: RDPR_PIL	rdpr	%pil, %r31
	.word 0xb5504000  ! 2610: RDPR_TNPC	<illegal instruction>
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 2614: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xb3510000  ! 2622: RDPR_TICK	<illegal instruction>
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9349000  ! 2624: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xfe446026  ! 2627: LDSW_I	ldsw	[%r17 + 0x0026], %r31
	.word 0xfc4c20d3  ! 2628: LDSB_I	ldsb	[%r16 + 0x00d3], %r30
	.word 0xf0048000  ! 2629: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf6440000  ! 2632: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xfe448000  ! 2634: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfa0d4000  ! 2644: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xba358000  ! 2646: ORN_R	orn 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r14
	.word 0xa193a000  ! 2652: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf404c000  ! 2653: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf01d4000  ! 2654: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xf254c000  ! 2657: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf6050000  ! 2659: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xf91cc000  ! 2661: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xf65d4000  ! 2668: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf055a067  ! 2671: LDSH_I	ldsh	[%r22 + 0x0067], %r24
	.word 0xf44de10d  ! 2672: LDSB_I	ldsb	[%r23 + 0x010d], %r26
	.word 0xf8046146  ! 2676: LDUW_I	lduw	[%r17 + 0x0146], %r28
	.word 0xbf510000  ! 2685: RDPR_TICK	rdpr	%tick, %r31
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa154000  ! 2691: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf04de0cf  ! 2696: LDSB_I	ldsb	[%r23 + 0x00cf], %r24
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	setx	data_start_2, %g1, %r19
	setx	0x10024, %g1, %o0
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
	.word 0xfe0ca055  ! 2720: LDUB_I	ldub	[%r18 + 0x0055], %r31
	.word 0xb1510000  ! 2722: RDPR_TICK	<illegal instruction>
	.word 0xfe1c4000  ! 2730: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf4144000  ! 2734: LDUH_R	lduh	[%r17 + %r0], %r26
	setx	0x20323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2741: RDPR_GL	<illegal instruction>
	.word 0xf8544000  ! 2744: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfb1d8000  ! 2745: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xb1518000  ! 2748: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e83  ! 2755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e83, %hpstate
	setx	data_start_7, %g1, %r16
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45da09c  ! 2759: LDX_I	ldx	[%r22 + 0x009c], %r26
	.word 0xf71ca170  ! 2760: LDDF_I	ldd	[%r18, 0x0170], %f27
	.word 0xb1540000  ! 2764: RDPR_GL	<illegal instruction>
	.word 0xf45d0000  ! 2770: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf61d602f  ! 2772: LDD_I	ldd	[%r21 + 0x002f], %r27
	.word 0xfc5d4000  ! 2774: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xb750c000  ! 2776: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 2777: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r20
	.word 0xbb504000  ! 2783: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 2787: RDPR_TSTATE	<illegal instruction>
	.word 0xf4140000  ! 2789: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xb951c000  ! 2791: RDPR_TL	<illegal instruction>
	.word 0x87946057  ! 2792: WRPR_TT_I	wrpr	%r17, 0x0057, %tt
	.word 0xf6458000  ! 2795: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfa4c8000  ! 2799: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xb625a13d  ! 2802: SUB_I	sub 	%r22, 0x013d, %r27
	.word 0xf45c4000  ! 2803: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xfa45e029  ! 2804: LDSW_I	ldsw	[%r23 + 0x0029], %r29
	.word 0xbb51c000  ! 2812: RDPR_TL	<illegal instruction>
	.word 0xf31c60ed  ! 2813: LDDF_I	ldd	[%r17, 0x00ed], %f25
	.word 0xfc5de108  ! 2814: LDX_I	ldx	[%r23 + 0x0108], %r30
	.word 0x91946080  ! 2815: WRPR_PIL_I	wrpr	%r17, 0x0080, %pil
	.word 0x8995e029  ! 2816: WRPR_TICK_I	wrpr	%r23, 0x0029, %tick
	.word 0xf60ca1b2  ! 2818: LDUB_I	ldub	[%r18 + 0x01b2], %r27
	.word 0xfc448000  ! 2819: LDSW_R	ldsw	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c4b  ! 2820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4b, %hpstate
	.word 0xf45da1ed  ! 2824: LDX_I	ldx	[%r22 + 0x01ed], %r26
	.word 0xb7508000  ! 2826: RDPR_TSTATE	rdpr	%tstate, %r27
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1d20bb  ! 2829: LDDF_I	ldd	[%r20, 0x00bb], %f31
	.word 0xfc450000  ! 2832: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfc1c600c  ! 2833: LDD_I	ldd	[%r17 + 0x000c], %r30
	.word 0xf20c214c  ! 2834: LDUB_I	ldub	[%r16 + 0x014c], %r25
	.word 0xbd504000  ! 2835: RDPR_TNPC	<illegal instruction>
	.word 0xfc046112  ! 2840: LDUW_I	lduw	[%r17 + 0x0112], %r30
	.word 0xfc55c000  ! 2842: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf21ca16b  ! 2843: LDD_I	ldd	[%r18 + 0x016b], %r25
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25c2114  ! 2848: LDX_I	ldx	[%r16 + 0x0114], %r25
	.word 0x8d95a0b0  ! 2852: WRPR_PSTATE_I	wrpr	%r22, 0x00b0, %pstate
	.word 0x8995a17a  ! 2853: WRPR_TICK_I	wrpr	%r22, 0x017a, %tick
	.word 0xbd50c000  ! 2867: RDPR_TT	rdpr	%tt, %r30
	.word 0xf91c4000  ! 2869: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf015209e  ! 2870: LDUH_I	lduh	[%r20 + 0x009e], %r24
	mov	0, %r12
	.word 0x8f932000  ! 2875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf454e14d  ! 2877: LDSH_I	ldsh	[%r19 + 0x014d], %r26
	.word 0xb53d5000  ! 2881: SRAX_R	srax	%r21, %r0, %r26
	.word 0xb97c8400  ! 2882: MOVR_R	movre	%r18, %r0, %r28
	.word 0xba042000  ! 2885: ADD_I	add 	%r16, 0x0000, %r29
	.word 0xfa05e127  ! 2886: LDUW_I	lduw	[%r23 + 0x0127], %r29
	.word 0xf84c0000  ! 2888: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb5356001  ! 2890: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xb1508000  ! 2895: RDPR_TSTATE	<illegal instruction>
	.word 0xff1dc000  ! 2903: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0x8995211c  ! 2905: WRPR_TICK_I	wrpr	%r20, 0x011c, %tick
	.word 0xf31c0000  ! 2906: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0x91952173  ! 2908: WRPR_PIL_I	wrpr	%r20, 0x0173, %pil
	.word 0xbf500000  ! 2910: RDPR_TPC	<illegal instruction>
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45d60b1  ! 2914: LDX_I	ldx	[%r21 + 0x00b1], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x3013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51c0000  ! 2922: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf04da172  ! 2923: LDSB_I	ldsb	[%r22 + 0x0172], %r24
	.word 0xf8040000  ! 2924: LDUW_R	lduw	[%r16 + %r0], %r28
	setx	data_start_4, %g1, %r19
	.word 0xfe150000  ! 2931: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xfa44e12d  ! 2932: LDSW_I	ldsw	[%r19 + 0x012d], %r29
	.word 0xfc144000  ! 2936: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xba3c8000  ! 2937: XNOR_R	xnor 	%r18, %r0, %r29
	setx	data_start_5, %g1, %r16
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	.word 0xb93ce001  ! 2941: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xfa4d8000  ! 2945: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0x8395e083  ! 2947: WRPR_TNPC_I	wrpr	%r23, 0x0083, %tnpc
	.word 0xb93d4000  ! 2948: SRA_R	sra 	%r21, %r0, %r28
	.word 0xfe0c4000  ! 2951: LDUB_R	ldub	[%r17 + %r0], %r31
	mov	1, %r14
	.word 0xa193a000  ! 2953: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf215219c  ! 2956: LDUH_I	lduh	[%r20 + 0x019c], %r25
	.word 0xbd540000  ! 2959: RDPR_GL	<illegal instruction>
	.word 0xb9510000  ! 2960: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 2962: RDPR_TICK	<illegal instruction>
	.word 0xb350c000  ! 2964: RDPR_TT	<illegal instruction>
	setx	0x3032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1ce0b2  ! 2966: LDD_I	ldd	[%r19 + 0x00b2], %r29
	.word 0xf20d219a  ! 2969: LDUB_I	ldub	[%r20 + 0x019a], %r25
	.word 0xbac4204c  ! 2971: ADDCcc_I	addccc 	%r16, 0x004c, %r29
	.word 0xbb500000  ! 2977: RDPR_TPC	<illegal instruction>
	.word 0xf05d8000  ! 2979: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf11dc000  ! 2983: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xbc1da109  ! 2984: XOR_I	xor 	%r22, 0x0109, %r30
	.word 0xf01ca0b0  ! 2986: LDD_I	ldd	[%r18 + 0x00b0], %r24
	.word 0xf61d8000  ! 2991: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xb17d4400  ! 2992: MOVR_R	movre	%r21, %r0, %r24
	.word 0xf6054000  ! 2995: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf2140000  ! 2999: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xfe05e0e8  ! 3002: LDUW_I	lduw	[%r23 + 0x00e8], %r31
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6c520a7  ! 3007: ADDCcc_I	addccc 	%r20, 0x00a7, %r27
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 3009: RDPR_TICK	<illegal instruction>
	.word 0xf40d4000  ! 3010: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfa1c0000  ! 3013: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xfd1ca078  ! 3018: LDDF_I	ldd	[%r18, 0x0078], %f30
	.word 0xbc2ca196  ! 3019: ANDN_I	andn 	%r18, 0x0196, %r30
	.word 0x8594e077  ! 3022: WRPR_TSTATE_I	wrpr	%r19, 0x0077, %tstate
	setx	0x2002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc540000  ! 3027: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf60c4000  ! 3028: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf00de113  ! 3030: LDUB_I	ldub	[%r23 + 0x0113], %r24
	.word 0xf84d4000  ! 3032: LDSB_R	ldsb	[%r21 + %r0], %r28
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf805c000  ! 3038: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfe1cc000  ! 3039: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xf61c0000  ! 3044: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xfc14a141  ! 3046: LDUH_I	lduh	[%r18 + 0x0141], %r30
	.word 0xb5480000  ! 3051: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x9195a090  ! 3055: WRPR_PIL_I	wrpr	%r22, 0x0090, %pil
	.word 0xf65d0000  ! 3056: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0x8d942170  ! 3058: WRPR_PSTATE_I	wrpr	%r16, 0x0170, %pstate
	.word 0xfa0c8000  ! 3059: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf6148000  ! 3061: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xb6246169  ! 3062: SUB_I	sub 	%r17, 0x0169, %r27
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 3066: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf64c612f  ! 3069: LDSB_I	ldsb	[%r17 + 0x012f], %r27
	.word 0xfc15a174  ! 3076: LDUH_I	lduh	[%r22 + 0x0174], %r30
	.word 0xf2544000  ! 3079: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf41c214b  ! 3081: LDD_I	ldd	[%r16 + 0x014b], %r26
	.word 0xf21d8000  ! 3083: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xbb520000  ! 3085: RDPR_PIL	<illegal instruction>
	.word 0xfe0c2172  ! 3087: LDUB_I	ldub	[%r16 + 0x0172], %r31
	.word 0x81942058  ! 3089: WRPR_TPC_I	wrpr	%r16, 0x0058, %tpc
	.word 0xfe5c4000  ! 3091: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0x9195a022  ! 3098: WRPR_PIL_I	wrpr	%r22, 0x0022, %pil
	.word 0xfa5d0000  ! 3100: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xf65cc000  ! 3101: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf0458000  ! 3105: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf2150000  ! 3115: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfc55600a  ! 3116: LDSH_I	ldsh	[%r21 + 0x000a], %r30
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	.word 0xbb518000  ! 3130: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e4b  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4b, %hpstate
	.word 0xff1c210d  ! 3134: LDDF_I	ldd	[%r16, 0x010d], %f31
	.word 0xbd540000  ! 3135: RDPR_GL	<illegal instruction>
	.word 0xfc54e1d3  ! 3138: LDSH_I	ldsh	[%r19 + 0x01d3], %r30
	.word 0xfe4d8000  ! 3139: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xf84cc000  ! 3141: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf6156093  ! 3149: LDUH_I	lduh	[%r21 + 0x0093], %r27
	.word 0xfc5520cc  ! 3155: LDSH_I	ldsh	[%r20 + 0x00cc], %r30
	.word 0xbd51c000  ! 3156: RDPR_TL	<illegal instruction>
	.word 0xb7480000  ! 3157: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc4c8000  ! 3161: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf01cc000  ! 3164: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf60d0000  ! 3167: LDUB_R	ldub	[%r20 + %r0], %r27
	mov	2, %r12
	.word 0x8f932000  ! 3168: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d942046  ! 3170: WRPR_PSTATE_I	wrpr	%r16, 0x0046, %pstate
	.word 0xf044c000  ! 3171: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xf214611e  ! 3173: LDUH_I	lduh	[%r17 + 0x011e], %r25
	.word 0xfe1c6111  ! 3174: LDD_I	ldd	[%r17 + 0x0111], %r31
	.word 0xfd1d4000  ! 3176: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xb834e1bd  ! 3177: SUBC_I	orn 	%r19, 0x01bd, %r28
	.word 0xbd504000  ! 3179: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e53  ! 3181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e53, %hpstate
	.word 0xfc0d8000  ! 3182: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb9504000  ! 3183: RDPR_TNPC	<illegal instruction>
	.word 0xf84d8000  ! 3184: LDSB_R	ldsb	[%r22 + %r0], %r28
	mov	2, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc4c0000  ! 3186: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf65d4000  ! 3187: LDX_R	ldx	[%r21 + %r0], %r27
	setx	0x1013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21d4000  ! 3190: LDD_R	ldd	[%r21 + %r0], %r25
	.word 0xf4044000  ! 3191: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf20d60a2  ! 3193: LDUB_I	ldub	[%r21 + 0x00a2], %r25
	setx	data_start_0, %g1, %r17
	.word 0xf11d607a  ! 3197: LDDF_I	ldd	[%r21, 0x007a], %f24
	.word 0xb5504000  ! 3198: RDPR_TNPC	<illegal instruction>
	.word 0xf2554000  ! 3200: LDSH_R	ldsh	[%r21 + %r0], %r25
	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53c4000  ! 3205: SRA_R	sra 	%r17, %r0, %r26
	.word 0xfa4d20c6  ! 3206: LDSB_I	ldsb	[%r20 + 0x00c6], %r29
	.word 0xf60d606e  ! 3208: LDUB_I	ldub	[%r21 + 0x006e], %r27
	setx	0x302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c8000  ! 3217: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfc45a090  ! 3218: LDSW_I	ldsw	[%r22 + 0x0090], %r30
	.word 0xb6b44000  ! 3221: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xf4442079  ! 3222: LDSW_I	ldsw	[%r16 + 0x0079], %r26
	.word 0xb0acc000  ! 3226: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xf0548000  ! 3227: LDSH_R	ldsh	[%r18 + %r0], %r24
	setx	0x30118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64de193  ! 3234: LDSB_I	ldsb	[%r23 + 0x0193], %r27
	setx	data_start_4, %g1, %r23
	.word 0xf8540000  ! 3236: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xbd510000  ! 3242: RDPR_TICK	<illegal instruction>
	.word 0xb9353001  ! 3243: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xb9480000  ! 3247: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfc1d614c  ! 3249: LDD_I	ldd	[%r21 + 0x014c], %r30
	.word 0xf4456146  ! 3250: LDSW_I	ldsw	[%r21 + 0x0146], %r26
	.word 0xf414a051  ! 3251: LDUH_I	lduh	[%r18 + 0x0051], %r26
	.word 0xfc5c0000  ! 3252: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xf00c8000  ! 3254: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xfc054000  ! 3256: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xfa140000  ! 3258: LDUH_R	lduh	[%r16 + %r0], %r29
	mov	1, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc4461f4  ! 3264: LDSW_I	ldsw	[%r17 + 0x01f4], %r30
	.word 0xf214e1ab  ! 3268: LDUH_I	lduh	[%r19 + 0x01ab], %r25
	.word 0xfe4da02d  ! 3269: LDSB_I	ldsb	[%r22 + 0x002d], %r31
	.word 0xbd510000  ! 3270: RDPR_TICK	<illegal instruction>
	.word 0xb2ac4000  ! 3272: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0xf204c000  ! 3276: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf05c8000  ! 3278: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xf40d0000  ! 3280: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf31d4000  ! 3283: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xfe4cc000  ! 3285: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf31cc000  ! 3288: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xbd508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xfc040000  ! 3293: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf81da029  ! 3295: LDD_I	ldd	[%r22 + 0x0029], %r28
	.word 0xf0158000  ! 3296: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb61d211e  ! 3297: XOR_I	xor 	%r20, 0x011e, %r27
	.word 0xfa5c8000  ! 3299: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf255611e  ! 3302: LDSH_I	ldsh	[%r21 + 0x011e], %r25
	.word 0xf04460f7  ! 3303: LDSW_I	ldsw	[%r17 + 0x00f7], %r24
	.word 0xf61c60a9  ! 3308: LDD_I	ldd	[%r17 + 0x00a9], %r27
	.word 0xfb1c4000  ! 3309: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf60460e7  ! 3314: LDUW_I	lduw	[%r17 + 0x00e7], %r27
	.word 0xfc4c8000  ! 3317: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf815a165  ! 3320: LDUH_I	lduh	[%r22 + 0x0165], %r28
	.word 0xbac560ef  ! 3323: ADDCcc_I	addccc 	%r21, 0x00ef, %r29
	.word 0xb48ce105  ! 3326: ANDcc_I	andcc 	%r19, 0x0105, %r26
	setx	data_start_5, %g1, %r17
	.word 0xb604c000  ! 3328: ADD_R	add 	%r19, %r0, %r27
	.word 0xf8044000  ! 3329: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xfa1c21b5  ! 3332: LDD_I	ldd	[%r16 + 0x01b5], %r29
	.word 0xf25d0000  ! 3334: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xbcbda0e5  ! 3335: XNORcc_I	xnorcc 	%r22, 0x00e5, %r30
	.word 0xf014e14f  ! 3343: LDUH_I	lduh	[%r19 + 0x014f], %r24
	.word 0xbd50c000  ! 3344: RDPR_TT	<illegal instruction>
	.word 0xf84c21cc  ! 3347: LDSB_I	ldsb	[%r16 + 0x01cc], %r28
	.word 0xfc0c4000  ! 3348: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xb2150000  ! 3352: OR_R	or 	%r20, %r0, %r25
	.word 0xf6140000  ! 3354: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xfe4d0000  ! 3357: LDSB_R	ldsb	[%r20 + %r0], %r31
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4c6087  ! 3360: LDSB_I	ldsb	[%r17 + 0x0087], %r30
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795613d  ! 3372: WRPR_TT_I	wrpr	%r21, 0x013d, %tt
	.word 0xfa54e0cd  ! 3373: LDSH_I	ldsh	[%r19 + 0x00cd], %r29
	.word 0xf044c000  ! 3375: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xfe0ca1c6  ! 3376: LDUB_I	ldub	[%r18 + 0x01c6], %r31
	.word 0xf64c61d1  ! 3379: LDSB_I	ldsb	[%r17 + 0x01d1], %r27
	.word 0xf25d8000  ! 3383: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xb7520000  ! 3384: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb3508000  ! 3385: RDPR_TSTATE	<illegal instruction>
	.word 0xbb51c000  ! 3388: RDPR_TL	<illegal instruction>
	.word 0xba3521de  ! 3389: SUBC_I	orn 	%r20, 0x01de, %r29
	.word 0xfe45c000  ! 3393: LDSW_R	ldsw	[%r23 + %r0], %r31
	setx	0x324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0c8000  ! 3397: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xfc1c60df  ! 3401: LDD_I	ldd	[%r17 + 0x00df], %r30
	.word 0x8394e0fb  ! 3402: WRPR_TNPC_I	wrpr	%r19, 0x00fb, %tnpc
	.word 0xf415a0d9  ! 3404: LDUH_I	lduh	[%r22 + 0x00d9], %r26
	.word 0xb4b561d4  ! 3406: ORNcc_I	orncc 	%r21, 0x01d4, %r26
	.word 0xf25d0000  ! 3408: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xfe54a0a3  ! 3414: LDSH_I	ldsh	[%r18 + 0x00a3], %r31
	.word 0xf60de01d  ! 3417: LDUB_I	ldub	[%r23 + 0x001d], %r27
	.word 0xfe0c20d3  ! 3418: LDUB_I	ldub	[%r16 + 0x00d3], %r31
	setx	data_start_5, %g1, %r19
	.word 0xb9342001  ! 3421: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xbb51c000  ! 3424: RDPR_TL	<illegal instruction>
	.word 0xfc4d2134  ! 3438: LDSB_I	ldsb	[%r20 + 0x0134], %r30
	.word 0xfc5460e5  ! 3441: LDSH_I	ldsh	[%r17 + 0x00e5], %r30
	.word 0xf8058000  ! 3443: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xbb641800  ! 3448: MOVcc_R	<illegal instruction>
	setx	data_start_5, %g1, %r17
	.word 0xf61420ee  ! 3452: LDUH_I	lduh	[%r16 + 0x00ee], %r27
	.word 0xf00c20a1  ! 3453: LDUB_I	ldub	[%r16 + 0x00a1], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f11  ! 3456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f11, %hpstate
	.word 0xf005c000  ! 3464: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0x8395a030  ! 3465: WRPR_TNPC_I	wrpr	%r22, 0x0030, %tnpc
	.word 0xfe5560e2  ! 3468: LDSH_I	ldsh	[%r21 + 0x00e2], %r31
	.word 0xb1504000  ! 3469: RDPR_TNPC	<illegal instruction>
	.word 0xf71cc000  ! 3474: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xfe4d0000  ! 3479: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf0448000  ! 3483: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xb9510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xfa0ca11d  ! 3486: LDUB_I	ldub	[%r18 + 0x011d], %r29
	.word 0xb7508000  ! 3490: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e109  ! 3491: WRPR_TPC_I	wrpr	%r19, 0x0109, %tpc
	.word 0xfe15e16a  ! 3492: LDUH_I	lduh	[%r23 + 0x016a], %r31
	.word 0xfe1dc000  ! 3497: LDD_R	ldd	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f4b  ! 3505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
	.word 0xb0bd20c2  ! 3506: XNORcc_I	xnorcc 	%r20, 0x00c2, %r24
	.word 0xbd504000  ! 3512: RDPR_TNPC	<illegal instruction>
	.word 0xfc45a127  ! 3513: LDSW_I	ldsw	[%r22 + 0x0127], %r30
	.word 0xbb508000  ! 3517: RDPR_TSTATE	<illegal instruction>
	.word 0xb4bc4000  ! 3520: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xf64c20a9  ! 3522: LDSB_I	ldsb	[%r16 + 0x00a9], %r27
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61521e3  ! 3526: LDUH_I	lduh	[%r20 + 0x01e3], %r27
	.word 0xfc45e176  ! 3528: LDSW_I	ldsw	[%r23 + 0x0176], %r30
	.word 0xf80c60de  ! 3533: LDUB_I	ldub	[%r17 + 0x00de], %r28
	.word 0xbb518000  ! 3538: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198389b  ! 3539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189b, %hpstate
	setx	0x20213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 3544: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc0521ab  ! 3546: LDUW_I	lduw	[%r20 + 0x01ab], %r30
	.word 0xb5518000  ! 3547: RDPR_PSTATE	<illegal instruction>
	.word 0xfe1c4000  ! 3548: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xff1c0000  ! 3549: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf65da19d  ! 3551: LDX_I	ldx	[%r22 + 0x019d], %r27
	.word 0xfe1c4000  ! 3552: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xf855c000  ! 3553: LDSH_R	ldsh	[%r23 + %r0], %r28
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1dc000  ! 3557: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xfe0d4000  ! 3560: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf254e0ea  ! 3562: LDSH_I	ldsh	[%r19 + 0x00ea], %r25
	.word 0xf01c8000  ! 3563: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfc550000  ! 3564: LDSH_R	ldsh	[%r20 + %r0], %r30
	mov	2, %r14
	.word 0xa193a000  ! 3569: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe14c000  ! 3570: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf4440000  ! 3575: LDSW_R	ldsw	[%r16 + %r0], %r26
	mov	2, %r12
	.word 0x8f932000  ! 3578: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf2550000  ! 3579: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xb8b56175  ! 3583: SUBCcc_I	orncc 	%r21, 0x0175, %r28
	.word 0x8d9521c2  ! 3584: WRPR_PSTATE_I	wrpr	%r20, 0x01c2, %pstate
	.word 0xfc4de1c5  ! 3585: LDSB_I	ldsb	[%r23 + 0x01c5], %r30
	.word 0xb0a5a1dd  ! 3587: SUBcc_I	subcc 	%r22, 0x01dd, %r24
	setx	0x20122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 3591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	.word 0xbd3ce001  ! 3595: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xba844000  ! 3596: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xb3518000  ! 3598: RDPR_PSTATE	<illegal instruction>
	.word 0xfb1d4000  ! 3599: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xb1500000  ! 3600: RDPR_TPC	<illegal instruction>
	.word 0xf05d8000  ! 3604: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf31d4000  ! 3606: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xfb1de1d5  ! 3611: LDDF_I	ldd	[%r23, 0x01d5], %f29
	.word 0xf64c61fd  ! 3614: LDSB_I	ldsb	[%r17 + 0x01fd], %r27
	.word 0xb3510000  ! 3615: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 3616: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc5c0000  ! 3618: LDX_R	ldx	[%r16 + %r0], %r30
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf444e091  ! 3623: LDSW_I	ldsw	[%r19 + 0x0091], %r26
	.word 0xfe0c0000  ! 3625: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0x8594208d  ! 3627: WRPR_TSTATE_I	wrpr	%r16, 0x008d, %tstate
	setx	0x1000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05d214e  ! 3630: LDX_I	ldx	[%r20 + 0x014e], %r24
	.word 0xfa45e051  ! 3633: LDSW_I	ldsw	[%r23 + 0x0051], %r29
	.word 0xf0150000  ! 3635: LDUH_R	lduh	[%r20 + %r0], %r24
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 3637: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xb97c2401  ! 3638: MOVR_I	movre	%r16, 0x1, %r28
	.word 0xbebda06b  ! 3640: XNORcc_I	xnorcc 	%r22, 0x006b, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe14601c  ! 3646: LDUH_I	lduh	[%r17 + 0x001c], %r31
	setx	0x10131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 3648: RDPR_TL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 3655: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfa1d60bd  ! 3656: LDD_I	ldd	[%r21 + 0x00bd], %r29
	.word 0xb29420b2  ! 3658: ORcc_I	orcc 	%r16, 0x00b2, %r25
	.word 0xfe44a04a  ! 3662: LDSW_I	ldsw	[%r18 + 0x004a], %r31
	.word 0x9194a109  ! 3664: WRPR_PIL_I	wrpr	%r18, 0x0109, %pil
	.word 0xfc1d6057  ! 3668: LDD_I	ldd	[%r21 + 0x0057], %r30
	.word 0x8d9560e3  ! 3671: WRPR_PSTATE_I	wrpr	%r21, 0x00e3, %pstate
	mov	1, %r12
	.word 0x8f932000  ! 3673: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf01d614f  ! 3675: LDD_I	ldd	[%r21 + 0x014f], %r24
	.word 0xf004c000  ! 3676: LDUW_R	lduw	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc048000  ! 3678: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xf80c2091  ! 3679: LDUB_I	ldub	[%r16 + 0x0091], %r28
	.word 0xb9518000  ! 3680: RDPR_PSTATE	<illegal instruction>
	.word 0xfa55c000  ! 3683: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfa0dc000  ! 3685: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xbd50c000  ! 3692: RDPR_TT	<illegal instruction>
	.word 0xb015a0eb  ! 3693: OR_I	or 	%r22, 0x00eb, %r24
	.word 0xf00ca00f  ! 3698: LDUB_I	ldub	[%r18 + 0x000f], %r24
	.word 0xf205c000  ! 3705: LDUW_R	lduw	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982953  ! 3707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0953, %hpstate
	.word 0xfc45a144  ! 3708: LDSW_I	ldsw	[%r22 + 0x0144], %r30
	.word 0xf0548000  ! 3710: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb4b4c000  ! 3713: SUBCcc_R	orncc 	%r19, %r0, %r26
	setx	0x10028, %g1, %o0
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
	.word 0xb3510000  ! 3719: RDPR_TICK	<illegal instruction>
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 3725: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf615e0bd  ! 3726: LDUH_I	lduh	[%r23 + 0x00bd], %r27
	.word 0xfb1c0000  ! 3731: LDDF_R	ldd	[%r16, %r0], %f29
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e085  ! 3735: WRPR_TSTATE_I	wrpr	%r19, 0x0085, %tstate
	.word 0xf804e1df  ! 3737: LDUW_I	lduw	[%r19 + 0x01df], %r28
	.word 0xf80c2044  ! 3738: LDUB_I	ldub	[%r16 + 0x0044], %r28
	.word 0xb5540000  ! 3739: RDPR_GL	<illegal instruction>
	.word 0xb085e0c1  ! 3741: ADDcc_I	addcc 	%r23, 0x00c1, %r24
	.word 0xb08d8000  ! 3745: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xfa1c2029  ! 3748: LDD_I	ldd	[%r16 + 0x0029], %r29
	.word 0xf04da121  ! 3750: LDSB_I	ldsb	[%r22 + 0x0121], %r24
	.word 0x8994a0d4  ! 3752: WRPR_TICK_I	wrpr	%r18, 0x00d4, %tick
	.word 0xbb508000  ! 3754: RDPR_TSTATE	<illegal instruction>
	.word 0xf04da00c  ! 3759: LDSB_I	ldsb	[%r22 + 0x000c], %r24
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 3766: RDPR_PIL	<illegal instruction>
	.word 0xb750c000  ! 3767: RDPR_TT	<illegal instruction>
	setx	0x1033d, %g1, %o0
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
	setx	data_start_6, %g1, %r23
	.word 0xb7518000  ! 3782: RDPR_PSTATE	<illegal instruction>
	.word 0xf41dc000  ! 3785: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xfc5d0000  ! 3787: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xfe04e08c  ! 3789: LDUW_I	lduw	[%r19 + 0x008c], %r31
	.word 0xb2a4c000  ! 3792: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xf6448000  ! 3798: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf85ce112  ! 3800: LDX_I	ldx	[%r19 + 0x0112], %r28
	.word 0xf64d8000  ! 3801: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xfe1c6145  ! 3804: LDD_I	ldd	[%r17 + 0x0145], %r31
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0158000  ! 3813: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xff1d4000  ! 3816: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xf404c000  ! 3817: LDUW_R	lduw	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982e19  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xfe4ce015  ! 3820: LDSB_I	ldsb	[%r19 + 0x0015], %r31
	.word 0xf51da0a3  ! 3822: LDDF_I	ldd	[%r22, 0x00a3], %f26
	.word 0xbd480000  ! 3823: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc4d4000  ! 3825: LDSB_R	ldsb	[%r21 + %r0], %r30
	setx	data_start_7, %g1, %r20
	.word 0x8d94a09c  ! 3830: WRPR_PSTATE_I	wrpr	%r18, 0x009c, %pstate
	.word 0xb5480000  ! 3833: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb3540000  ! 3835: RDPR_GL	<illegal instruction>
	.word 0xf0448000  ! 3836: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xfd1d2179  ! 3837: LDDF_I	ldd	[%r20, 0x0179], %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983a09  ! 3838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a09, %hpstate
	.word 0x83942020  ! 3843: WRPR_TNPC_I	wrpr	%r16, 0x0020, %tnpc
	.word 0x8795a091  ! 3844: WRPR_TT_I	wrpr	%r22, 0x0091, %tt
	.word 0xf84d210c  ! 3845: LDSB_I	ldsb	[%r20 + 0x010c], %r28
	.word 0xf21d2070  ! 3849: LDD_I	ldd	[%r20 + 0x0070], %r25
	.word 0xb750c000  ! 3851: RDPR_TT	<illegal instruction>
	.word 0xf6154000  ! 3852: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xfc0c2093  ! 3855: LDUB_I	ldub	[%r16 + 0x0093], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982f03  ! 3857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f03, %hpstate
	.word 0xb6bc0000  ! 3861: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0xfd1c6008  ! 3864: LDDF_I	ldd	[%r17, 0x0008], %f30
	setx	0x10309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 3867: RDPR_TT	<illegal instruction>
	.word 0xfc5d8000  ! 3872: LDX_R	ldx	[%r22 + %r0], %r30
	mov	2, %r14
	.word 0xa193a000  ! 3873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8594e1f5  ! 3874: WRPR_TSTATE_I	wrpr	%r19, 0x01f5, %tstate
	.word 0xf25d20cb  ! 3875: LDX_I	ldx	[%r20 + 0x00cb], %r25
	.word 0xf455a0e4  ! 3876: LDSH_I	ldsh	[%r22 + 0x00e4], %r26
	.word 0xfe044000  ! 3877: LDUW_R	lduw	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x819839d3  ! 3878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d3, %hpstate
	.word 0xfe44213d  ! 3880: LDSW_I	ldsw	[%r16 + 0x013d], %r31
	.word 0xfb1c21b1  ! 3884: LDDF_I	ldd	[%r16, 0x01b1], %f29
	.word 0xf81c21d2  ! 3885: LDD_I	ldd	[%r16 + 0x01d2], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45c213f  ! 3889: LDX_I	ldx	[%r16 + 0x013f], %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	.word 0xb33d0000  ! 3895: SRA_R	sra 	%r20, %r0, %r25
	.word 0xfc0c8000  ! 3896: LDUB_R	ldub	[%r18 + %r0], %r30
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 3900: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf00ce18b  ! 3903: LDUB_I	ldub	[%r19 + 0x018b], %r24
	setx	0x3032c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf61dc000  ! 3906: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xb3504000  ! 3908: RDPR_TNPC	<illegal instruction>
	.word 0xf40d6136  ! 3909: LDUB_I	ldub	[%r21 + 0x0136], %r26
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89956182  ! 3916: WRPR_TICK_I	wrpr	%r21, 0x0182, %tick
	.word 0xf31da139  ! 3921: LDDF_I	ldd	[%r22, 0x0139], %f25
	.word 0xf444c000  ! 3924: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf81c6036  ! 3928: LDD_I	ldd	[%r17 + 0x0036], %r28
	.word 0xf01d214a  ! 3932: LDD_I	ldd	[%r20 + 0x014a], %r24
	.word 0xf40d0000  ! 3934: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb2056142  ! 3936: ADD_I	add 	%r21, 0x0142, %r25
	.word 0xf40ca1a4  ! 3944: LDUB_I	ldub	[%r18 + 0x01a4], %r26
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6144000  ! 3953: LDUH_R	lduh	[%r17 + %r0], %r27
	setx	0x20337, %g1, %o0
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
	.word 0xfc1d0000  ! 3959: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xb21421e3  ! 3960: OR_I	or 	%r16, 0x01e3, %r25
	.word 0xf4158000  ! 3961: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf4140000  ! 3962: LDUH_R	lduh	[%r16 + %r0], %r26
	setx	0x2002d, %g1, %o0
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
	.word 0xb9504000  ! 3966: RDPR_TNPC	<illegal instruction>
	.word 0xfe1c614d  ! 3969: LDD_I	ldd	[%r17 + 0x014d], %r31
	.word 0x819421c7  ! 3971: WRPR_TPC_I	wrpr	%r16, 0x01c7, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0xf65da058  ! 3975: LDX_I	ldx	[%r22 + 0x0058], %r27
	.word 0x8194a091  ! 3979: WRPR_TPC_I	wrpr	%r18, 0x0091, %tpc
	.word 0xb20d211d  ! 3981: AND_I	and 	%r20, 0x011d, %r25
	.word 0xb2b4e077  ! 3985: SUBCcc_I	orncc 	%r19, 0x0077, %r25
	.word 0x9194a1cf  ! 3987: WRPR_PIL_I	wrpr	%r18, 0x01cf, %pil
	.word 0x85942120  ! 3988: WRPR_TSTATE_I	wrpr	%r16, 0x0120, %tstate
	.word 0xf40cc000  ! 3992: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xbd50c000  ! 3994: RDPR_TT	<illegal instruction>
	setx	0x10329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0544000  ! 3998: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xb5643801  ! 4000: MOVcc_I	<illegal instruction>
	setx	data_start_1, %g1, %r21
	.word 0xbabc4000  ! 4004: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xf85d8000  ! 4005: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xfa0cc000  ! 4008: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xfe1de12a  ! 4010: LDD_I	ldd	[%r23 + 0x012a], %r31
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819420cf  ! 4013: WRPR_TPC_I	wrpr	%r16, 0x00cf, %tpc
	.word 0xfe0c6163  ! 4014: LDUB_I	ldub	[%r17 + 0x0163], %r31
	.word 0xfc4da083  ! 4016: LDSB_I	ldsb	[%r22 + 0x0083], %r30
	.word 0x839520db  ! 4019: WRPR_TNPC_I	wrpr	%r20, 0x00db, %tnpc
	.word 0xbf500000  ! 4020: RDPR_TPC	<illegal instruction>
	.word 0xf045a015  ! 4022: LDSW_I	ldsw	[%r22 + 0x0015], %r24
	.word 0xb3508000  ! 4023: RDPR_TSTATE	<illegal instruction>
	.word 0xf11dc000  ! 4024: LDDF_R	ldd	[%r23, %r0], %f24
	setx	data_start_2, %g1, %r20
	.word 0xb32da001  ! 4031: SLL_I	sll 	%r22, 0x0001, %r25
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45d20df  ! 4034: LDX_I	ldx	[%r20 + 0x00df], %r26
	.word 0x8395e190  ! 4036: WRPR_TNPC_I	wrpr	%r23, 0x0190, %tnpc
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 4038: RDPR_PSTATE	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 4045: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf604a087  ! 4046: LDUW_I	lduw	[%r18 + 0x0087], %r27
	.word 0xfe45c000  ! 4050: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xb134b001  ! 4054: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb350c000  ! 4055: RDPR_TT	<illegal instruction>
	.word 0xb4056156  ! 4056: ADD_I	add 	%r21, 0x0156, %r26
	.word 0xbb510000  ! 4057: RDPR_TICK	<illegal instruction>
	.word 0xb635a05d  ! 4058: ORN_I	orn 	%r22, 0x005d, %r27
	.word 0xf31d2040  ! 4062: LDDF_I	ldd	[%r20, 0x0040], %f25
	.word 0xf8154000  ! 4064: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xbc946034  ! 4065: ORcc_I	orcc 	%r17, 0x0034, %r30
	.word 0xb035e1b0  ! 4069: SUBC_I	orn 	%r23, 0x01b0, %r24
	.word 0xfe0c4000  ! 4070: LDUB_R	ldub	[%r17 + %r0], %r31
	setx	data_start_5, %g1, %r17
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0xfc55e19c  ! 4076: LDSH_I	ldsh	[%r23 + 0x019c], %r30
	.word 0xf655e1e8  ! 4077: LDSH_I	ldsh	[%r23 + 0x01e8], %r27
	.word 0xfc1d6135  ! 4078: LDD_I	ldd	[%r21 + 0x0135], %r30
	setx	0x20120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf015a166  ! 4081: LDUH_I	lduh	[%r22 + 0x0166], %r24
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf31c0000  ! 4085: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf8046093  ! 4086: LDUW_I	lduw	[%r17 + 0x0093], %r28
	.word 0x8595617d  ! 4089: WRPR_TSTATE_I	wrpr	%r21, 0x017d, %tstate
	.word 0xb950c000  ! 4091: RDPR_TT	<illegal instruction>
	.word 0xf85ce149  ! 4093: LDX_I	ldx	[%r19 + 0x0149], %r28
	.word 0xf8154000  ! 4098: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xfe5da0c6  ! 4099: LDX_I	ldx	[%r22 + 0x00c6], %r31
	setx	0x10016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 4106: SRAX_R	srax	%r16, %r0, %r30
	.word 0x85952092  ! 4108: WRPR_TSTATE_I	wrpr	%r20, 0x0092, %tstate
	.word 0x839421ff  ! 4109: WRPR_TNPC_I	wrpr	%r16, 0x01ff, %tnpc
	.word 0xf655a186  ! 4111: LDSH_I	ldsh	[%r22 + 0x0186], %r27
	.word 0xbb500000  ! 4112: RDPR_TPC	<illegal instruction>
	.word 0xfd1c8000  ! 4115: LDDF_R	ldd	[%r18, %r0], %f30
	.word 0xf61ce02a  ! 4118: LDD_I	ldd	[%r19 + 0x002a], %r27
	.word 0xfc550000  ! 4121: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf80c8000  ! 4122: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf855c000  ! 4123: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xb750c000  ! 4124: RDPR_TT	<illegal instruction>
	.word 0xb7518000  ! 4127: RDPR_PSTATE	<illegal instruction>
	.word 0x8394208f  ! 4128: WRPR_TNPC_I	wrpr	%r16, 0x008f, %tnpc
	.word 0xb4c5616a  ! 4130: ADDCcc_I	addccc 	%r21, 0x016a, %r26
	.word 0xfc04e197  ! 4132: LDUW_I	lduw	[%r19 + 0x0197], %r30
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91d0000  ! 4138: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xb5500000  ! 4144: RDPR_TPC	<illegal instruction>
	setx	0x20304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf854a1a6  ! 4146: LDSH_I	ldsh	[%r18 + 0x01a6], %r28
	.word 0x8994e124  ! 4149: WRPR_TICK_I	wrpr	%r19, 0x0124, %tick
	.word 0xf61d0000  ! 4150: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xb9480000  ! 4152: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	data_start_0, %g1, %r23
	.word 0xf91d20d5  ! 4157: LDDF_I	ldd	[%r20, 0x00d5], %f28
	.word 0xb6348000  ! 4161: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xbc8c8000  ! 4166: ANDcc_R	andcc 	%r18, %r0, %r30
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4548000  ! 4173: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xb3510000  ! 4174: RDPR_TICK	<illegal instruction>
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80c8000  ! 4176: LDUB_R	ldub	[%r18 + %r0], %r28
	setx	0x30006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 4180: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfe548000  ! 4184: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xbc0dc000  ! 4186: AND_R	and 	%r23, %r0, %r30
	.word 0xf0058000  ! 4187: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0x8d9420d5  ! 4190: WRPR_PSTATE_I	wrpr	%r16, 0x00d5, %pstate
	.word 0xf444c000  ! 4195: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xb7508000  ! 4198: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf4444000  ! 4204: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfa4c4000  ! 4208: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xfc14e12f  ! 4211: LDUH_I	lduh	[%r19 + 0x012f], %r30
	.word 0xfc1ce19d  ! 4212: LDD_I	ldd	[%r19 + 0x019d], %r30
	.word 0xfa4c4000  ! 4213: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xba9c2050  ! 4215: XORcc_I	xorcc 	%r16, 0x0050, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982a53  ! 4216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a53, %hpstate
	.word 0xfe5c20b6  ! 4217: LDX_I	ldx	[%r16 + 0x00b6], %r31
	.word 0xbd500000  ! 4222: RDPR_TPC	rdpr	%tpc, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 4225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	data_start_3, %g1, %r22
	setx	0x327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xf25c60b6  ! 4244: LDX_I	ldx	[%r17 + 0x00b6], %r25
	.word 0xf25d0000  ! 4248: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xba9d8000  ! 4252: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xb9643801  ! 4253: MOVcc_I	<illegal instruction>
	.word 0xf45cc000  ! 4254: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0x8995201e  ! 4255: WRPR_TICK_I	wrpr	%r20, 0x001e, %tick
	.word 0xbb510000  ! 4258: RDPR_TICK	<illegal instruction>
	.word 0xfe05e1d4  ! 4260: LDUW_I	lduw	[%r23 + 0x01d4], %r31
	.word 0xbe150000  ! 4261: OR_R	or 	%r20, %r0, %r31
	setx	data_start_4, %g1, %r19
	.word 0xfc45a0ae  ! 4265: LDSW_I	ldsw	[%r22 + 0x00ae], %r30
	.word 0xf81d6028  ! 4266: LDD_I	ldd	[%r21 + 0x0028], %r28
	.word 0xf64d21e3  ! 4275: LDSB_I	ldsb	[%r20 + 0x01e3], %r27
	.word 0x8595e120  ! 4277: WRPR_TSTATE_I	wrpr	%r23, 0x0120, %tstate
	.word 0x8795a1c6  ! 4281: WRPR_TT_I	wrpr	%r22, 0x01c6, %tt
	.word 0xb951c000  ! 4282: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 4285: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb77c2401  ! 4288: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xfa55a0af  ! 4290: LDSH_I	ldsh	[%r22 + 0x00af], %r29
	.word 0xf605c000  ! 4294: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xbf7c6401  ! 4295: MOVR_I	movre	%r17, 0x1, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982bc3  ! 4296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0xbd35b001  ! 4301: SRLX_I	srlx	%r22, 0x0001, %r30
	mov	0, %r14
	.word 0xa193a000  ! 4302: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8558000  ! 4308: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf054600a  ! 4310: LDSH_I	ldsh	[%r17 + 0x000a], %r24
	.word 0xfc1ce161  ! 4313: LDD_I	ldd	[%r19 + 0x0161], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe54619e  ! 4318: LDSH_I	ldsh	[%r17 + 0x019e], %r31
	.word 0xfa454000  ! 4319: LDSW_R	ldsw	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x819829d9  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0xb5510000  ! 4322: RDPR_TICK	<illegal instruction>
	.word 0xf25c8000  ! 4324: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xbf510000  ! 4329: RDPR_TICK	<illegal instruction>
	.word 0xf6544000  ! 4335: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xb951c000  ! 4337: RDPR_TL	<illegal instruction>
	.word 0xf84c21f8  ! 4338: LDSB_I	ldsb	[%r16 + 0x01f8], %r28
	.word 0xf81de031  ! 4343: LDD_I	ldd	[%r23 + 0x0031], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 4346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89956135  ! 4352: WRPR_TICK_I	wrpr	%r21, 0x0135, %tick
	.word 0xfc1520a1  ! 4354: LDUH_I	lduh	[%r20 + 0x00a1], %r30
	.word 0xbf510000  ! 4358: RDPR_TICK	<illegal instruction>
	.word 0xbabce058  ! 4359: XNORcc_I	xnorcc 	%r19, 0x0058, %r29
	.word 0xfd1de0d8  ! 4363: LDDF_I	ldd	[%r23, 0x00d8], %f30
	.word 0xbc85e1c7  ! 4365: ADDcc_I	addcc 	%r23, 0x01c7, %r30
	.word 0xfc5cc000  ! 4366: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xb69c206d  ! 4367: XORcc_I	xorcc 	%r16, 0x006d, %r27
	.word 0x87946127  ! 4368: WRPR_TT_I	wrpr	%r17, 0x0127, %tt
	.word 0xb9520000  ! 4371: RDPR_PIL	<illegal instruction>
	.word 0x8d94a120  ! 4372: WRPR_PSTATE_I	wrpr	%r18, 0x0120, %pstate
	.word 0xbb510000  ! 4377: RDPR_TICK	<illegal instruction>
	.word 0xfc540000  ! 4386: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf25561f5  ! 4387: LDSH_I	ldsh	[%r21 + 0x01f5], %r25
	.word 0xfe5c60ba  ! 4389: LDX_I	ldx	[%r17 + 0x00ba], %r31
	mov	2, %r12
	.word 0x8f932000  ! 4391: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf444211a  ! 4392: LDSW_I	ldsw	[%r16 + 0x011a], %r26
	.word 0xf6150000  ! 4393: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	data_start_4, %g1, %r17
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919521ef  ! 4400: WRPR_PIL_I	wrpr	%r20, 0x01ef, %pil
	.word 0x9195a12a  ! 4402: WRPR_PIL_I	wrpr	%r22, 0x012a, %pil
	.word 0xf214612a  ! 4404: LDUH_I	lduh	[%r17 + 0x012a], %r25
	.word 0xb534d000  ! 4405: SRLX_R	srlx	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 4409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	.word 0x81983e89  ! 4413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e89, %hpstate
	.word 0xf205a0b8  ! 4414: LDUW_I	lduw	[%r22 + 0x00b8], %r25
	.word 0xbd51c000  ! 4418: RDPR_TL	<illegal instruction>
	.word 0x8395a0f0  ! 4419: WRPR_TNPC_I	wrpr	%r22, 0x00f0, %tnpc
	.word 0xf24c61b0  ! 4420: LDSB_I	ldsb	[%r17 + 0x01b0], %r25
	.word 0xb3540000  ! 4421: RDPR_GL	<illegal instruction>
	.word 0xf244a15f  ! 4422: LDSW_I	ldsw	[%r18 + 0x015f], %r25
	.word 0xb2852097  ! 4424: ADDcc_I	addcc 	%r20, 0x0097, %r25
	.word 0xfa1c0000  ! 4430: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xfd1dc000  ! 4432: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0x8795215a  ! 4435: WRPR_TT_I	wrpr	%r20, 0x015a, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982891  ! 4439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0xf84d8000  ! 4440: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb7540000  ! 4441: RDPR_GL	<illegal instruction>
	.word 0xfe54a183  ! 4442: LDSH_I	ldsh	[%r18 + 0x0183], %r31
	.word 0xfe14e1c8  ! 4444: LDUH_I	lduh	[%r19 + 0x01c8], %r31
	.word 0xbd51c000  ! 4446: RDPR_TL	<illegal instruction>
	.word 0xf444c000  ! 4447: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0x8d9461b7  ! 4449: WRPR_PSTATE_I	wrpr	%r17, 0x01b7, %pstate
	setx	data_start_3, %g1, %r19
	.word 0xb535d000  ! 4453: SRLX_R	srlx	%r23, %r0, %r26
	mov	2, %r12
	.word 0x8f932000  ! 4454: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x81983d0b  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xf05561b1  ! 4459: LDSH_I	ldsh	[%r21 + 0x01b1], %r24
	.word 0xfe452030  ! 4461: LDSW_I	ldsw	[%r20 + 0x0030], %r31
	.word 0xfc4c0000  ! 4465: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf61c0000  ! 4466: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xb950c000  ! 4469: RDPR_TT	<illegal instruction>
	.word 0xfc058000  ! 4470: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0x8995204f  ! 4471: WRPR_TICK_I	wrpr	%r20, 0x004f, %tick
	.word 0xf8442175  ! 4474: LDSW_I	ldsw	[%r16 + 0x0175], %r28
	.word 0xb150c000  ! 4476: RDPR_TT	<illegal instruction>
	.word 0x8594604b  ! 4479: WRPR_TSTATE_I	wrpr	%r17, 0x004b, %tstate
	.word 0xfa45207d  ! 4484: LDSW_I	ldsw	[%r20 + 0x007d], %r29
	.word 0xf204a17e  ! 4490: LDUW_I	lduw	[%r18 + 0x017e], %r25
	.word 0xf8054000  ! 4500: LDUW_R	lduw	[%r21 + %r0], %r28
	mov	2, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_1, %g1, %r19
	.word 0xb9508000  ! 4507: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1d202a  ! 4515: LDD_I	ldd	[%r20 + 0x002a], %r31
	.word 0xfe5ca15b  ! 4516: LDX_I	ldx	[%r18 + 0x015b], %r31
	setx	data_start_5, %g1, %r20
	.word 0xfe554000  ! 4519: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb5508000  ! 4520: RDPR_TSTATE	<illegal instruction>
	.word 0xbf540000  ! 4521: RDPR_GL	<illegal instruction>
	.word 0xbb50c000  ! 4522: RDPR_TT	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xbe852179  ! 4527: ADDcc_I	addcc 	%r20, 0x0179, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1c8000  ! 4529: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfa044000  ! 4530: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xfe158000  ! 4533: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0x8394204d  ! 4534: WRPR_TNPC_I	wrpr	%r16, 0x004d, %tnpc
	.word 0xbb480000  ! 4536: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe440000  ! 4542: LDSW_R	ldsw	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983901  ! 4545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1901, %hpstate
	.word 0xb550c000  ! 4546: RDPR_TT	<illegal instruction>
	.word 0xf80d8000  ! 4550: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xfc4d2119  ! 4552: LDSB_I	ldsb	[%r20 + 0x0119], %r30
	.word 0x8794e04f  ! 4558: WRPR_TT_I	wrpr	%r19, 0x004f, %tt
	ta	T_CHANGE_HPRIV
	.word 0x819839c9  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c9, %hpstate
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05c0000  ! 4563: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xf2440000  ! 4564: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xfe0c6119  ! 4566: LDUB_I	ldub	[%r17 + 0x0119], %r31
	.word 0xb2148000  ! 4569: OR_R	or 	%r18, %r0, %r25
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2444000  ! 4572: ADDC_R	addc 	%r17, %r0, %r25
	setx	data_start_3, %g1, %r17
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	.word 0x8198399b  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199b, %hpstate
	.word 0xf84c8000  ! 4581: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xb3540000  ! 4584: RDPR_GL	<illegal instruction>
	.word 0xf84c0000  ! 4588: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf41c4000  ! 4589: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xb7500000  ! 4590: RDPR_TPC	<illegal instruction>
	setx	0x10207, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf04de178  ! 4598: LDSB_I	ldsb	[%r23 + 0x0178], %r24
	.word 0xb28da053  ! 4601: ANDcc_I	andcc 	%r22, 0x0053, %r25
	.word 0xf00cc000  ! 4602: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xfc148000  ! 4608: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf61de0b3  ! 4612: LDD_I	ldd	[%r23 + 0x00b3], %r27
	.word 0xf51de10b  ! 4613: LDDF_I	ldd	[%r23, 0x010b], %f26
	.word 0xf84cc000  ! 4614: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf40d8000  ! 4615: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xff1da1cd  ! 4616: LDDF_I	ldd	[%r22, 0x01cd], %f31
	.word 0xf81da19e  ! 4617: LDD_I	ldd	[%r22 + 0x019e], %r28
	.word 0xb550c000  ! 4618: RDPR_TT	<illegal instruction>
	.word 0xfe052053  ! 4622: LDUW_I	lduw	[%r20 + 0x0053], %r31
	.word 0xf8158000  ! 4623: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb1500000  ! 4625: RDPR_TPC	<illegal instruction>
	.word 0xf20de0af  ! 4628: LDUB_I	ldub	[%r23 + 0x00af], %r25
	.word 0xf204e1e1  ! 4634: LDUW_I	lduw	[%r19 + 0x01e1], %r25
	.word 0xf04c6006  ! 4636: LDSB_I	ldsb	[%r17 + 0x0006], %r24
	.word 0xf24460e4  ! 4637: LDSW_I	ldsw	[%r17 + 0x00e4], %r25
	.word 0xb9480000  ! 4640: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf6440000  ! 4641: LDSW_R	ldsw	[%r16 + %r0], %r27
	setx	data_start_0, %g1, %r18
	.word 0xf8058000  ! 4645: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0x91952145  ! 4653: WRPR_PIL_I	wrpr	%r20, 0x0145, %pil
	.word 0xf05d4000  ! 4654: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf84c209a  ! 4660: LDSB_I	ldsb	[%r16 + 0x009a], %r28
	.word 0xfc146055  ! 4661: LDUH_I	lduh	[%r17 + 0x0055], %r30
	.word 0xba34a199  ! 4662: ORN_I	orn 	%r18, 0x0199, %r29
	.word 0xfa5c0000  ! 4663: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfc0c2099  ! 4666: LDUB_I	ldub	[%r16 + 0x0099], %r30
	.word 0xfe45a08e  ! 4668: LDSW_I	ldsw	[%r22 + 0x008e], %r31
	.word 0xb6b42025  ! 4669: ORNcc_I	orncc 	%r16, 0x0025, %r27
	.word 0xb12d4000  ! 4671: SLL_R	sll 	%r21, %r0, %r24
	.word 0xbd508000  ! 4674: RDPR_TSTATE	<illegal instruction>
	.word 0xfc54e0ca  ! 4675: LDSH_I	ldsh	[%r19 + 0x00ca], %r30
	.word 0xb9504000  ! 4676: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198395b  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195b, %hpstate
	.word 0xf21cc000  ! 4680: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xf04d6044  ! 4681: LDSB_I	ldsb	[%r21 + 0x0044], %r24
	.word 0xf6558000  ! 4683: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xb751c000  ! 4684: RDPR_TL	<illegal instruction>
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 4690: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_6, %g1, %r21
	mov	0, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf444c000  ! 4695: LDSW_R	ldsw	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9480000  ! 4698: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfe4de1f9  ! 4700: LDSB_I	ldsb	[%r23 + 0x01f9], %r31
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a13f  ! 4705: WRPR_TNPC_I	wrpr	%r18, 0x013f, %tnpc
	.word 0xbd3c5000  ! 4708: SRAX_R	srax	%r17, %r0, %r30
	.word 0xf45cc000  ! 4710: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf2450000  ! 4711: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xf11d20d5  ! 4716: LDDF_I	ldd	[%r20, 0x00d5], %f24
	.word 0xfd1dc000  ! 4722: LDDF_R	ldd	[%r23, %r0], %f30
	mov	1, %r14
	.word 0xa193a000  ! 4724: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r12
	.word 0x8f932000  ! 4726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994613c  ! 4730: WRPR_TICK_I	wrpr	%r17, 0x013c, %tick
	setx	0x20104, %g1, %o0
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
	.word 0xbb3cf001  ! 4739: SRAX_I	srax	%r19, 0x0001, %r29
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf014c000  ! 4744: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0x8394e0dd  ! 4746: WRPR_TNPC_I	wrpr	%r19, 0x00dd, %tnpc
	.word 0xf8050000  ! 4747: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf814e15b  ! 4748: LDUH_I	lduh	[%r19 + 0x015b], %r28
	.word 0x8395a163  ! 4749: WRPR_TNPC_I	wrpr	%r22, 0x0163, %tnpc
	.word 0xfe4d4000  ! 4750: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf65d203f  ! 4754: LDX_I	ldx	[%r20 + 0x003f], %r27
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb604a127  ! 4763: ADD_I	add 	%r18, 0x0127, %r27
	.word 0xf81c21bc  ! 4766: LDD_I	ldd	[%r16 + 0x01bc], %r28
	.word 0x8194a162  ! 4768: WRPR_TPC_I	wrpr	%r18, 0x0162, %tpc
	.word 0xfa5d4000  ! 4769: LDX_R	ldx	[%r21 + %r0], %r29
	setx	0x3033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb635a169  ! 4772: ORN_I	orn 	%r22, 0x0169, %r27
	.word 0xf2548000  ! 4775: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf64c209c  ! 4784: LDSB_I	ldsb	[%r16 + 0x009c], %r27
	.word 0xf81da1ab  ! 4793: LDD_I	ldd	[%r22 + 0x01ab], %r28
	.word 0xb3508000  ! 4795: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf31da18d  ! 4797: LDDF_I	ldd	[%r22, 0x018d], %f25
	.word 0xfe5c6175  ! 4798: LDX_I	ldx	[%r17 + 0x0175], %r31
	.word 0xff1dc000  ! 4800: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0x1000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45de06e  ! 4804: LDX_I	ldx	[%r23 + 0x006e], %r26
	.word 0xf85d0000  ! 4806: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xfe4d0000  ! 4807: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf4558000  ! 4810: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xb5508000  ! 4811: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1420c4  ! 4813: LDUH_I	lduh	[%r16 + 0x00c4], %r31
	.word 0xbc2460b9  ! 4816: SUB_I	sub 	%r17, 0x00b9, %r30
	setx	0x3022b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4821: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf404c000  ! 4822: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf654a147  ! 4824: LDSH_I	ldsh	[%r18 + 0x0147], %r27
	setx	0x10302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x91956061  ! 4827: WRPR_PIL_I	wrpr	%r21, 0x0061, %pil
	.word 0xb5518000  ! 4831: RDPR_PSTATE	<illegal instruction>
	.word 0xf61c218f  ! 4834: LDD_I	ldd	[%r16 + 0x018f], %r27
	.word 0xb3643801  ! 4835: MOVcc_I	<illegal instruction>
	.word 0x859421c6  ! 4836: WRPR_TSTATE_I	wrpr	%r16, 0x01c6, %tstate
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80c8000  ! 4839: LDUB_R	ldub	[%r18 + %r0], %r28
	setx	data_start_2, %g1, %r23
	.word 0xbd510000  ! 4844: RDPR_TICK	<illegal instruction>
	setx	data_start_0, %g1, %r20
	.word 0xfc144000  ! 4849: LDUH_R	lduh	[%r17 + %r0], %r30
	setx	0x2c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394603f  ! 4854: WRPR_TNPC_I	wrpr	%r17, 0x003f, %tnpc
	.word 0xf11d4000  ! 4855: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0x83956031  ! 4857: WRPR_TNPC_I	wrpr	%r21, 0x0031, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x87952075  ! 4860: WRPR_TT_I	wrpr	%r20, 0x0075, %tt
	setx	0x1012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc454000  ! 4864: LDSW_R	ldsw	[%r21 + %r0], %r30
	mov	0, %r12
	.word 0x8f932000  ! 4866: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85ce1e9  ! 4869: LDX_I	ldx	[%r19 + 0x01e9], %r28
	.word 0xfa4c4000  ! 4874: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf254e1c1  ! 4876: LDSH_I	ldsh	[%r19 + 0x01c1], %r25
	setx	data_start_2, %g1, %r23
	.word 0xf31c60ae  ! 4879: LDDF_I	ldd	[%r17, 0x00ae], %f25
	.word 0xf85ce17c  ! 4881: LDX_I	ldx	[%r19 + 0x017c], %r28
	.word 0xbb480000  ! 4884: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982e83  ! 4885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0xf20460ed  ! 4886: LDUW_I	lduw	[%r17 + 0x00ed], %r25
	.word 0x81952199  ! 4891: WRPR_TPC_I	wrpr	%r20, 0x0199, %tpc
	.word 0xb40dc000  ! 4893: AND_R	and 	%r23, %r0, %r26
	.word 0xf4044000  ! 4894: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xfe440000  ! 4895: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xb13c1000  ! 4896: SRAX_R	srax	%r16, %r0, %r24
	.word 0xbe04e020  ! 4897: ADD_I	add 	%r19, 0x0020, %r31
	.word 0xf4440000  ! 4898: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0x8d942085  ! 4899: WRPR_PSTATE_I	wrpr	%r16, 0x0085, %pstate
	.word 0xf21420cf  ! 4902: LDUH_I	lduh	[%r16 + 0x00cf], %r25
	.word 0xf84d8000  ! 4903: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf8040000  ! 4908: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf40c4000  ! 4910: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb750c000  ! 4912: RDPR_TT	<illegal instruction>
	.word 0xfe556051  ! 4913: LDSH_I	ldsh	[%r21 + 0x0051], %r31
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982943  ! 4917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	.word 0xfc4d2113  ! 4920: LDSB_I	ldsb	[%r20 + 0x0113], %r30
	.word 0xf01ca0ed  ! 4922: LDD_I	ldd	[%r18 + 0x00ed], %r24
	.word 0x8994a0bd  ! 4925: WRPR_TICK_I	wrpr	%r18, 0x00bd, %tick
	.word 0xf0558000  ! 4927: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb5500000  ! 4930: RDPR_TPC	<illegal instruction>
	setx	0x2023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1c207e  ! 4935: LDD_I	ldd	[%r16 + 0x007e], %r31
	.word 0xf20d619f  ! 4937: LDUB_I	ldub	[%r21 + 0x019f], %r25
	.word 0xfe4d60d2  ! 4941: LDSB_I	ldsb	[%r21 + 0x00d2], %r31
	.word 0xfe1d8000  ! 4943: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0x8995e019  ! 4944: WRPR_TICK_I	wrpr	%r23, 0x0019, %tick
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40c0000  ! 4949: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfb1c4000  ! 4954: LDDF_R	ldd	[%r17, %r0], %f29
	setx	0x30123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf7c6401  ! 4956: MOVR_I	movre	%r17, 0x1, %r31
	.word 0xfc5d6088  ! 4960: LDX_I	ldx	[%r21 + 0x0088], %r30
	.word 0xb7510000  ! 4962: RDPR_TICK	<illegal instruction>
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x33c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394616c  ! 4966: WRPR_TNPC_I	wrpr	%r17, 0x016c, %tnpc
	.word 0xf6056162  ! 4968: LDUW_I	lduw	[%r21 + 0x0162], %r27
	.word 0xb551c000  ! 4970: RDPR_TL	<illegal instruction>
	.word 0xfc4d21e2  ! 4972: LDSB_I	ldsb	[%r20 + 0x01e2], %r30
	.word 0xf85da0fb  ! 4974: LDX_I	ldx	[%r22 + 0x00fb], %r28
	.word 0xf64d8000  ! 4975: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xf6450000  ! 4976: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xb1518000  ! 4977: RDPR_PSTATE	<illegal instruction>
	.word 0xfa54e177  ! 4982: LDSH_I	ldsh	[%r19 + 0x0177], %r29
	.word 0xf0158000  ! 4985: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf055c000  ! 4989: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0x8394a0a5  ! 4991: WRPR_TNPC_I	wrpr	%r18, 0x00a5, %tnpc
	.word 0xfc0c6194  ! 4992: LDUB_I	ldub	[%r17 + 0x0194], %r30
	.word 0xb9504000  ! 4993: RDPR_TNPC	<illegal instruction>
	.word 0xf64c21e2  ! 4998: LDSB_I	ldsb	[%r16 + 0x01e2], %r27
	ta	T_CHANGE_HPRIV
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb2850000  ! 3: ADDcc_R	addcc 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983b19  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b19, %hpstate
	.word 0xb4c56062  ! 7: ADDCcc_I	addccc 	%r21, 0x0062, %r26
	.word 0x8395e099  ! 13: WRPR_TNPC_I	wrpr	%r23, 0x0099, %tnpc
	.word 0xb350c000  ! 15: RDPR_TT	<illegal instruction>
	.word 0x81946028  ! 20: WRPR_TPC_I	wrpr	%r17, 0x0028, %tpc
	.word 0xbda50920  ! 21: FMULs	fmuls	%f20, %f0, %f30
	mov	1, %r12
	.word 0x8f932000  ! 22: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1520000  ! 24: RDPR_PIL	<illegal instruction>
	.word 0xbda81820  ! 27: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb1500000  ! 33: RDPR_TPC	<illegal instruction>
	.word 0xb7a00040  ! 35: FMOVd	fmovd	%f0, %f58
	.word 0x8d942115  ! 39: WRPR_PSTATE_I	wrpr	%r16, 0x0115, %pstate
	.word 0xb2046173  ! 40: ADD_I	add 	%r17, 0x0173, %r25
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba40820  ! 42: FADDs	fadds	%f16, %f0, %f29
	.word 0xb1a80420  ! 43: FMOVRZ	dis not found

	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a489a0  ! 47: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb88de0b5  ! 50: ANDcc_I	andcc 	%r23, 0x00b5, %r28
	.word 0xb1504000  ! 52: RDPR_TNPC	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 53: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a9c820  ! 55: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb61da001  ! 57: XOR_I	xor 	%r22, 0x0001, %r27
	.word 0x9194e0cb  ! 64: WRPR_PIL_I	wrpr	%r19, 0x00cb, %pil
	.word 0xb7a508a0  ! 67: FSUBs	fsubs	%f20, %f0, %f27
	setx	0x1002f, %g1, %o0
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
	.word 0x89956133  ! 73: WRPR_TICK_I	wrpr	%r21, 0x0133, %tick
	.word 0xbb518000  ! 76: RDPR_PSTATE	<illegal instruction>
	.word 0xb7643801  ! 78: MOVcc_I	<illegal instruction>
	.word 0xb5aa0820  ! 80: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a50860  ! 85: FADDq	dis not found

	.word 0xbfa8c820  ! 89: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81420  ! 94: FMOVRNZ	dis not found

	.word 0xb3a488c0  ! 96: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xba9dc000  ! 99: XORcc_R	xorcc 	%r23, %r0, %r29
	setx	0x30207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a448a0  ! 102: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xbfa48960  ! 104: FMULq	dis not found

	.word 0xb5ab8820  ! 105: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb8158000  ! 111: OR_R	or 	%r22, %r0, %r28
	.word 0xb5a488a0  ! 113: FSUBs	fsubs	%f18, %f0, %f26
	mov	2, %r12
	.word 0x8f932000  ! 114: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a84820  ! 117: FMOVE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982fd3  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0xb5a58920  ! 120: FMULs	fmuls	%f22, %f0, %f26
	.word 0xbfa409e0  ! 121: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	.word 0xbfa98820  ! 125: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x83942034  ! 128: WRPR_TNPC_I	wrpr	%r16, 0x0034, %tnpc
	.word 0xbfa80820  ! 132: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0x8594217b  ! 139: WRPR_TSTATE_I	wrpr	%r16, 0x017b, %tstate
	.word 0xb82c8000  ! 140: ANDN_R	andn 	%r18, %r0, %r28
	.word 0x8995e0e2  ! 141: WRPR_TICK_I	wrpr	%r23, 0x00e2, %tick
	.word 0xbba98820  ! 142: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x1033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89942122  ! 147: WRPR_TICK_I	wrpr	%r16, 0x0122, %tick
	.word 0xb1a98820  ! 149: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbec40000  ! 150: ADDCcc_R	addccc 	%r16, %r0, %r31
	.word 0x83946109  ! 152: WRPR_TNPC_I	wrpr	%r17, 0x0109, %tnpc
	.word 0xb1a509e0  ! 159: FDIVq	dis not found

	.word 0xb5abc820  ! 161: FMOVVC	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 166: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x9194a1be  ! 169: WRPR_PIL_I	wrpr	%r18, 0x01be, %pil
	.word 0x8995a031  ! 174: WRPR_TICK_I	wrpr	%r22, 0x0031, %tick
	.word 0xb1a00520  ! 176: FSQRTs	fsqrt	
	.word 0x8995a0cb  ! 179: WRPR_TICK_I	wrpr	%r22, 0x00cb, %tick
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 195: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a98820  ! 196: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbda40940  ! 197: FMULd	fmuld	%f16, %f0, %f30
	.word 0x81956018  ! 199: WRPR_TPC_I	wrpr	%r21, 0x0018, %tpc
	.word 0x919520a6  ! 204: WRPR_PIL_I	wrpr	%r20, 0x00a6, %pil
	.word 0xb350c000  ! 207: RDPR_TT	<illegal instruction>
	.word 0xb3a409e0  ! 211: FDIVq	dis not found

	mov	2, %r12
	.word 0x8f932000  ! 223: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a54840  ! 224: FADDd	faddd	%f52, %f0, %f56
	.word 0xb53ca001  ! 225: SRA_I	sra 	%r18, 0x0001, %r26
	.word 0x8995a0fc  ! 227: WRPR_TICK_I	wrpr	%r22, 0x00fc, %tick
	.word 0xb9510000  ! 228: RDPR_TICK	<illegal instruction>
	.word 0xbfa80820  ! 231: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c9e0  ! 233: FDIVq	dis not found

	.word 0xbb480000  ! 234: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7a5c9a0  ! 235: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb0ad207c  ! 239: ANDNcc_I	andncc 	%r20, 0x007c, %r24
	.word 0xb3a81c20  ! 242: FMOVRGEZ	dis not found

	.word 0xb551c000  ! 243: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a4c9a0  ! 248: FDIVs	fdivs	%f19, %f0, %f27
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 250: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7aa4820  ! 252: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1518000  ! 261: RDPR_PSTATE	<illegal instruction>
	.word 0xb0850000  ! 263: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xb5a00560  ! 265: FSQRTq	fsqrt	
	.word 0xbc344000  ! 267: SUBC_R	orn 	%r17, %r0, %r30
	.word 0xb5a00040  ! 270: FMOVd	fmovd	%f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982911  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0xbf520000  ! 277: RDPR_PIL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 278: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 280: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80420  ! 282: FMOVRZ	dis not found

	.word 0xbfa44940  ! 283: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb5504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xbda5c820  ! 288: FADDs	fadds	%f23, %f0, %f30
	.word 0xb9508000  ! 290: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a5c940  ! 298: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbea5a1ca  ! 299: SUBcc_I	subcc 	%r22, 0x01ca, %r31
	.word 0xbd508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa84820  ! 302: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba48920  ! 305: FMULs	fmuls	%f18, %f0, %f29
	setx	0x220, %g1, %o0
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
	.word 0xb9a80420  ! 315: FMOVRZ	dis not found

	.word 0xb5a98820  ! 316: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb2854000  ! 319: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xbda98820  ! 320: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0x83942110  ! 323: WRPR_TNPC_I	wrpr	%r16, 0x0110, %tnpc
	.word 0xb3a4c920  ! 324: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbba58960  ! 327: FMULq	dis not found

	.word 0xb7a509a0  ! 331: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xb2246034  ! 334: SUB_I	sub 	%r17, 0x0034, %r25
	.word 0xb7a90820  ! 336: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00040  ! 338: FMOVd	fmovd	%f0, %f56
	.word 0xb9a81c20  ! 339: FMOVRGEZ	dis not found

	setx	0x13a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a44840  ! 344: FADDd	faddd	%f48, %f0, %f56
	.word 0xb7a80c20  ! 346: FMOVRLZ	dis not found

	.word 0xbfa81820  ! 347: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3500000  ! 349: RDPR_TPC	<illegal instruction>
	.word 0xb7341000  ! 351: SRLX_R	srlx	%r16, %r0, %r27
	.word 0x899461a1  ! 352: WRPR_TICK_I	wrpr	%r17, 0x01a1, %tick
	.word 0xb13d3001  ! 353: SRAX_I	srax	%r20, 0x0001, %r24
	.word 0xbba50940  ! 356: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb134e001  ! 360: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xb9a80820  ! 363: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3518000  ! 365: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a40860  ! 368: FADDq	dis not found

	.word 0xb9a00040  ! 370: FMOVd	fmovd	%f0, %f28
	mov	1, %r12
	.word 0x8f932000  ! 371: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795a03f  ! 373: WRPR_TT_I	wrpr	%r22, 0x003f, %tt
	.word 0xb1a509e0  ! 374: FDIVq	dis not found

	.word 0xb3a88820  ! 375: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a8c820  ! 381: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	0x10004, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195212d  ! 383: WRPR_PIL_I	wrpr	%r20, 0x012d, %pil
	.word 0xbb520000  ! 384: RDPR_PIL	<illegal instruction>
	.word 0xb1a40860  ! 385: FADDq	dis not found

	.word 0xb9540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0xb9a48960  ! 392: FMULq	dis not found

	.word 0xb49c4000  ! 393: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xbb51c000  ! 395: RDPR_TL	<illegal instruction>
	.word 0x8394e0a8  ! 397: WRPR_TNPC_I	wrpr	%r19, 0x00a8, %tnpc
	.word 0xb9a549e0  ! 401: FDIVq	dis not found

	.word 0xbfa00540  ! 403: FSQRTd	fsqrt	
	.word 0x819460d2  ! 404: WRPR_TPC_I	wrpr	%r17, 0x00d2, %tpc
	.word 0xb72d1000  ! 405: SLLX_R	sllx	%r20, %r0, %r27
	.word 0xb9a4c840  ! 407: FADDd	faddd	%f50, %f0, %f28
	.word 0xbba80820  ! 409: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb9a4c9e0  ! 413: FDIVq	dis not found

	.word 0xbda84820  ! 414: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a40920  ! 416: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb3504000  ! 422: RDPR_TNPC	<illegal instruction>
	.word 0xbfa4c9c0  ! 423: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbfaa8820  ! 424: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8595a1ed  ! 425: WRPR_TSTATE_I	wrpr	%r22, 0x01ed, %tstate
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c820  ! 434: FADDs	fadds	%f19, %f0, %f26
	.word 0xbba81420  ! 436: FMOVRNZ	dis not found

	.word 0xb3a50920  ! 438: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb9a81820  ! 439: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xba358000  ! 440: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xb951c000  ! 443: RDPR_TL	<illegal instruction>
	.word 0x8994e123  ! 444: WRPR_TICK_I	wrpr	%r19, 0x0123, %tick
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 449: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10209, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 452: FMOVRZ	dis not found

	.word 0xbfa4c9e0  ! 453: FDIVq	dis not found

	.word 0xb7a00040  ! 455: FMOVd	fmovd	%f0, %f58
	.word 0x8994201c  ! 456: WRPR_TICK_I	wrpr	%r16, 0x001c, %tick
	.word 0xb61ce120  ! 458: XOR_I	xor 	%r19, 0x0120, %r27
	.word 0xb5a00520  ! 464: FSQRTs	fsqrt	
	.word 0xbf480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xba9de1d5  ! 475: XORcc_I	xorcc 	%r23, 0x01d5, %r29
	.word 0xbba00020  ! 476: FMOVs	fmovs	%f0, %f29
	.word 0x8394a0fd  ! 477: WRPR_TNPC_I	wrpr	%r18, 0x00fd, %tnpc
	.word 0xbdabc820  ! 481: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1500000  ! 484: RDPR_TPC	<illegal instruction>
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859460a2  ! 492: WRPR_TSTATE_I	wrpr	%r17, 0x00a2, %tstate
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48920  ! 497: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb1aa8820  ! 498: FMOVG	fmovs	%fcc1, %f0, %f24
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 502: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983c11  ! 504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c11, %hpstate
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 507: MOVcc_R	<illegal instruction>
	.word 0xb1a94820  ! 509: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0x83946050  ! 510: WRPR_TNPC_I	wrpr	%r17, 0x0050, %tnpc
	.word 0xbf51c000  ! 511: RDPR_TL	<illegal instruction>
	.word 0xbf50c000  ! 513: RDPR_TT	<illegal instruction>
	.word 0x8994a0f9  ! 515: WRPR_TICK_I	wrpr	%r18, 0x00f9, %tick
	.word 0xb3518000  ! 517: RDPR_PSTATE	<illegal instruction>
	setx	0x2031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c860  ! 520: FADDq	dis not found

	setx	data_start_3, %g1, %r18
	.word 0xb351c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0xb1a80420  ! 527: FMOVRZ	dis not found

	.word 0xb9a81c20  ! 528: FMOVRGEZ	dis not found

	.word 0xb4bca025  ! 530: XNORcc_I	xnorcc 	%r18, 0x0025, %r26
	.word 0xb5500000  ! 532: RDPR_TPC	<illegal instruction>
	.word 0xb4240000  ! 536: SUB_R	sub 	%r16, %r0, %r26
	.word 0xbd51c000  ! 537: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xbda5c940  ! 547: FMULd	fmuld	%f54, %f0, %f30
	.word 0xb5a489e0  ! 550: FDIVq	dis not found

	.word 0xb00dc000  ! 551: AND_R	and 	%r23, %r0, %r24
	.word 0xbbab0820  ! 557: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa81c20  ! 558: FMOVRGEZ	dis not found

	.word 0xbda5c9c0  ! 559: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb5a5c8e0  ! 560: FSUBq	dis not found

	.word 0xbcb5c000  ! 561: ORNcc_R	orncc 	%r23, %r0, %r30
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9561a5  ! 573: WRPR_PSTATE_I	wrpr	%r21, 0x01a5, %pstate
	ta	T_CHANGE_HPRIV
	.word 0x81983c09  ! 576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c09, %hpstate
	.word 0xb1aa4820  ! 584: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c8a0  ! 587: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb1a5c820  ! 589: FADDs	fadds	%f23, %f0, %f24
	.word 0xb3a88820  ! 590: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb9504000  ! 595: RDPR_TNPC	<illegal instruction>
	.word 0xb6bca1ce  ! 597: XNORcc_I	xnorcc 	%r18, 0x01ce, %r27
	.word 0xb5a54940  ! 599: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb7a94820  ! 601: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb69c20f6  ! 602: XORcc_I	xorcc 	%r16, 0x00f6, %r27
	.word 0xbfa00560  ! 605: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 606: FSQRTs	fsqrt	
	.word 0xbba98820  ! 607: FMOVNEG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa509a0  ! 617: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb4342152  ! 618: SUBC_I	orn 	%r16, 0x0152, %r26
	.word 0xb1aa0820  ! 620: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1510000  ! 622: RDPR_TICK	<illegal instruction>
	.word 0xbc0d4000  ! 624: AND_R	and 	%r21, %r0, %r30
	.word 0xb4a5e120  ! 627: SUBcc_I	subcc 	%r23, 0x0120, %r26
	.word 0xbf504000  ! 629: RDPR_TNPC	rdpr	%tnpc, %r31
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 633: FMOVRNZ	dis not found

	.word 0xbda4c820  ! 637: FADDs	fadds	%f19, %f0, %f30
	.word 0xb3a9c820  ! 642: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda508c0  ! 646: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xbba80420  ! 652: FMOVRZ	dis not found

	.word 0xb73d7001  ! 654: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0xb9500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb9a9c820  ! 662: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbba80820  ! 665: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbba81420  ! 670: FMOVRNZ	dis not found

	setx	0x30235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 676: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9a0  ! 680: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb9a5c9c0  ! 682: FDIVd	fdivd	%f54, %f0, %f28
	setx	0x20328, %g1, %o0
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
	mov	1, %r14
	.word 0xa193a000  ! 692: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a4c9c0  ! 696: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xbda489a0  ! 697: FDIVs	fdivs	%f18, %f0, %f30
	setx	0x3021c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 699: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb3a5c940  ! 702: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbd50c000  ! 705: RDPR_TT	<illegal instruction>
	setx	data_start_6, %g1, %r23
	.word 0xb7a80820  ! 708: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c9a0  ! 709: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb9a84820  ! 713: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda50960  ! 716: FMULq	dis not found

	mov	2, %r14
	.word 0xa193a000  ! 717: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5510000  ! 720: RDPR_TICK	<illegal instruction>
	.word 0xb5a80820  ! 721: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3aac820  ! 722: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	data_start_5, %g1, %r18
	.word 0xb3a80820  ! 726: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	setx	0x10316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a48940  ! 731: FMULd	fmuld	%f18, %f0, %f56
	.word 0xb5a4c9a0  ! 734: FDIVs	fdivs	%f19, %f0, %f26
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 738: FMOVGE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb635619b  ! 751: ORN_I	orn 	%r21, 0x019b, %r27
	.word 0x9194e13c  ! 752: WRPR_PIL_I	wrpr	%r19, 0x013c, %pil
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba88820  ! 756: FMOVLE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81983adb  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1adb, %hpstate
	.word 0xbd508000  ! 765: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a88820  ! 766: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba00040  ! 767: FMOVd	fmovd	%f0, %f60
	.word 0xbba5c8a0  ! 768: FSUBs	fsubs	%f23, %f0, %f29
	.word 0x8594e1bc  ! 770: WRPR_TSTATE_I	wrpr	%r19, 0x01bc, %tstate
	.word 0xbba408a0  ! 773: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb0350000  ! 775: ORN_R	orn 	%r20, %r0, %r24
	.word 0xbbaa8820  ! 779: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00520  ! 780: FSQRTs	fsqrt	
	.word 0xbfa90820  ! 784: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 790: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00020  ! 792: FMOVs	fmovs	%f0, %f24
	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba589a0  ! 795: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbdab0820  ! 796: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a4c9c0  ! 800: FDIVd	fdivd	%f50, %f0, %f58
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xbf51c000  ! 804: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xb7a5c940  ! 814: FMULd	fmuld	%f54, %f0, %f58
	setx	data_start_0, %g1, %r18
	.word 0xbfa549a0  ! 820: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xb7540000  ! 825: RDPR_GL	<illegal instruction>
	.word 0xb3a589a0  ! 829: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xb9ab4820  ! 831: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00560  ! 833: FSQRTq	fsqrt	
	.word 0xb7a80820  ! 836: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r21
	.word 0xb3a8c820  ! 845: FMOVL	fmovs	%fcc1, %f0, %f25
	setx	data_start_0, %g1, %r21
	.word 0xb1a00040  ! 848: FMOVd	fmovd	%f0, %f24
	.word 0xbba588a0  ! 852: FSUBs	fsubs	%f22, %f0, %f29
	.word 0x899521ce  ! 853: WRPR_TICK_I	wrpr	%r20, 0x01ce, %tick
	.word 0xb5ab0820  ! 858: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a488e0  ! 859: FSUBq	dis not found

	.word 0xb9a00540  ! 861: FSQRTd	fsqrt	
	.word 0xb1aa4820  ! 863: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00560  ! 866: FSQRTq	fsqrt	
	.word 0xbfa81420  ! 867: FMOVRNZ	dis not found

	.word 0xbdaa0820  ! 872: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	0x1000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 879: FSQRTq	fsqrt	
	.word 0xbba5c8e0  ! 885: FSUBq	dis not found

	.word 0xbfa81c20  ! 886: FMOVRGEZ	dis not found

	.word 0xb5aa0820  ! 889: FMOVA	fmovs	%fcc1, %f0, %f26
	setx	0x3002e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8e0  ! 891: FSUBq	dis not found

	.word 0xbfa40860  ! 893: FADDq	dis not found

	.word 0xbdab4820  ! 894: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a84820  ! 898: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a5c820  ! 900: FADDs	fadds	%f23, %f0, %f24
	.word 0xb9520000  ! 908: RDPR_PIL	<illegal instruction>
	.word 0xb3500000  ! 914: RDPR_TPC	<illegal instruction>
	.word 0xbda448c0  ! 918: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbfa94820  ! 919: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a40940  ! 921: FMULd	fmuld	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	.word 0x81982adb  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adb, %hpstate
	.word 0xbb540000  ! 926: RDPR_GL	<illegal instruction>
	.word 0xb5a54960  ! 928: FMULq	dis not found

	.word 0xbba488c0  ! 930: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbfab0820  ! 931: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb844c000  ! 935: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xb1520000  ! 936: RDPR_PIL	<illegal instruction>
	.word 0xbc348000  ! 939: SUBC_R	orn 	%r18, %r0, %r30
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2d1000  ! 941: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xb3a5c940  ! 943: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb3a00040  ! 944: FMOVd	fmovd	%f0, %f56
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 947: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb17d8400  ! 950: MOVR_R	movre	%r22, %r0, %r24
	.word 0x9194e08e  ! 952: WRPR_PIL_I	wrpr	%r19, 0x008e, %pil
	.word 0xb3508000  ! 955: RDPR_TSTATE	<illegal instruction>
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 959: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a449e0  ! 964: FDIVq	dis not found

	.word 0xb7a81420  ! 975: FMOVRNZ	dis not found

	.word 0xb1ab8820  ! 976: FMOVPOS	fmovs	%fcc1, %f0, %f24
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 982: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5510000  ! 986: RDPR_TICK	<illegal instruction>
	.word 0xbfa90820  ! 994: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbba80820  ! 995: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbba00040  ! 996: FMOVd	fmovd	%f0, %f60
	setx	data_start_5, %g1, %r22
	.word 0xb4bc608b  ! 1000: XNORcc_I	xnorcc 	%r17, 0x008b, %r26
	.word 0xbda409a0  ! 1001: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xb0b54000  ! 1002: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xbda549e0  ! 1003: FDIVq	dis not found

	.word 0xb9aa4820  ! 1005: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a9c820  ! 1007: FMOVVS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0xb1a40840  ! 1009: FADDd	faddd	%f16, %f0, %f24
	.word 0xb1510000  ! 1012: RDPR_TICK	<illegal instruction>
	.word 0xbfa81820  ! 1015: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbda80420  ! 1018: FMOVRZ	dis not found

	.word 0xb3a00540  ! 1019: FSQRTd	fsqrt	
	.word 0xbfa98820  ! 1025: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba54940  ! 1026: FMULd	fmuld	%f52, %f0, %f60
	.word 0xb1a588e0  ! 1027: FSUBq	dis not found

	.word 0xbdabc820  ! 1034: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbb504000  ! 1036: RDPR_TNPC	<illegal instruction>
	.word 0xb00ce07d  ! 1037: AND_I	and 	%r19, 0x007d, %r24
	.word 0x9195a185  ! 1039: WRPR_PIL_I	wrpr	%r22, 0x0185, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983999  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1999, %hpstate
	.word 0xbba548a0  ! 1043: FSUBs	fsubs	%f21, %f0, %f29
	.word 0x8d94a1e4  ! 1045: WRPR_PSTATE_I	wrpr	%r18, 0x01e4, %pstate
	.word 0xb7a4c820  ! 1046: FADDs	fadds	%f19, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a4c9e0  ! 1056: FDIVq	dis not found

	.word 0xb7aa0820  ! 1058: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x30208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 1067: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x8d94210a  ! 1068: WRPR_PSTATE_I	wrpr	%r16, 0x010a, %pstate
	.word 0xb1480000  ! 1071: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	1, %r14
	.word 0xa193a000  ! 1072: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1075: RDPR_TICK	<illegal instruction>
	.word 0xbd347001  ! 1077: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xb1a00560  ! 1083: FSQRTq	fsqrt	
	.word 0xb3a00020  ! 1089: FMOVs	fmovs	%f0, %f25
	.word 0xbb35e001  ! 1091: SRL_I	srl 	%r23, 0x0001, %r29
	setx	data_start_4, %g1, %r20
	.word 0x8195a1c8  ! 1096: WRPR_TPC_I	wrpr	%r22, 0x01c8, %tpc
	.word 0xbb2df001  ! 1098: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb3a8c820  ! 1101: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xba25c000  ! 1102: SUB_R	sub 	%r23, %r0, %r29
	.word 0xbc35e12d  ! 1103: ORN_I	orn 	%r23, 0x012d, %r30
	.word 0xb1a81c20  ! 1107: FMOVRGEZ	dis not found

	.word 0xbb3cc000  ! 1114: SRA_R	sra 	%r19, %r0, %r29
	.word 0xb9518000  ! 1115: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa88820  ! 1119: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbd358000  ! 1120: SRL_R	srl 	%r22, %r0, %r30
	.word 0xb5a00540  ! 1121: FSQRTd	fsqrt	
	.word 0xbba589c0  ! 1122: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb5a80820  ! 1124: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3540000  ! 1130: RDPR_GL	<illegal instruction>
	.word 0xb60dc000  ! 1133: AND_R	and 	%r23, %r0, %r27
	.word 0xb3520000  ! 1134: RDPR_PIL	<illegal instruction>
	.word 0xb3a00040  ! 1137: FMOVd	fmovd	%f0, %f56
	setx	0x100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 1139: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbf540000  ! 1149: RDPR_GL	<illegal instruction>
	.word 0xbba00560  ! 1150: FSQRTq	fsqrt	
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 1152: RDPR_TPC	<illegal instruction>
	.word 0xbba00540  ! 1153: FSQRTd	fsqrt	
	.word 0xb5504000  ! 1154: RDPR_TNPC	<illegal instruction>
	.word 0xb89d4000  ! 1155: XORcc_R	xorcc 	%r21, %r0, %r28
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 1158: FMOVNE	fmovs	%fcc1, %f0, %f31
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba50840  ! 1161: FADDd	faddd	%f20, %f0, %f60
	.word 0xbb500000  ! 1162: RDPR_TPC	<illegal instruction>
	.word 0xb7a409e0  ! 1168: FDIVq	dis not found

	.word 0x91956163  ! 1169: WRPR_PIL_I	wrpr	%r21, 0x0163, %pil
	.word 0xb1a58840  ! 1171: FADDd	faddd	%f22, %f0, %f24
	.word 0xbda40840  ! 1172: FADDd	faddd	%f16, %f0, %f30
	.word 0x8d94a164  ! 1174: WRPR_PSTATE_I	wrpr	%r18, 0x0164, %pstate
	.word 0xb3508000  ! 1177: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa54960  ! 1178: FMULq	dis not found

	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52cf001  ! 1183: SLLX_I	sllx	%r19, 0x0001, %r26
	.word 0xb5a5c920  ! 1185: FMULs	fmuls	%f23, %f0, %f26
	.word 0xbc2de11a  ! 1186: ANDN_I	andn 	%r23, 0x011a, %r30
	.word 0xb3a54920  ! 1188: FMULs	fmuls	%f21, %f0, %f25
	.word 0xbdabc820  ! 1191: FMOVVC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x8198281b  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0x859460f7  ! 1197: WRPR_TSTATE_I	wrpr	%r17, 0x00f7, %tstate
	.word 0xb1a54860  ! 1203: FADDq	dis not found

	.word 0xba258000  ! 1206: SUB_R	sub 	%r22, %r0, %r29
	.word 0xb7a98820  ! 1208: FMOVNEG	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982c83  ! 1209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0x8194a0eb  ! 1210: WRPR_TPC_I	wrpr	%r18, 0x00eb, %tpc
	.word 0xb7a4c840  ! 1211: FADDd	faddd	%f50, %f0, %f58
	.word 0x8795617d  ! 1212: WRPR_TT_I	wrpr	%r21, 0x017d, %tt
	.word 0xb7a549c0  ! 1216: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb93cc000  ! 1217: SRA_R	sra 	%r19, %r0, %r28
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a549a0  ! 1220: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbba00040  ! 1221: FMOVd	fmovd	%f0, %f60
	.word 0xbba9c820  ! 1222: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab4820  ! 1224: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e0d6  ! 1230: WRPR_TNPC_I	wrpr	%r19, 0x00d6, %tnpc
	.word 0xbda8c820  ! 1237: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7ab4820  ! 1240: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb3540000  ! 1241: RDPR_GL	<illegal instruction>
	.word 0xbda00540  ! 1242: FSQRTd	fsqrt	
	.word 0x919460c1  ! 1243: WRPR_PIL_I	wrpr	%r17, 0x00c1, %pil
	.word 0x81946099  ! 1254: WRPR_TPC_I	wrpr	%r17, 0x0099, %tpc
	setx	data_start_3, %g1, %r20
	.word 0xb5a4c820  ! 1262: FADDs	fadds	%f19, %f0, %f26
	.word 0xb7a00520  ! 1263: FSQRTs	fsqrt	
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a48820  ! 1265: FADDs	fadds	%f18, %f0, %f25
	.word 0xbda80c20  ! 1266: FMOVRLZ	dis not found

	.word 0xb3a84820  ! 1270: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00560  ! 1273: FSQRTq	fsqrt	
	.word 0xbfa94820  ! 1274: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbf50c000  ! 1283: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 1285: RDPR_TT	<illegal instruction>
	.word 0xbfa80820  ! 1286: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80c20  ! 1287: FMOVRLZ	dis not found

	.word 0xb9a00020  ! 1288: FMOVs	fmovs	%f0, %f28
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 1291: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0x8d9520b9  ! 1300: WRPR_PSTATE_I	wrpr	%r20, 0x00b9, %pstate
	.word 0xb41c8000  ! 1304: XOR_R	xor 	%r18, %r0, %r26
	setx	data_start_1, %g1, %r19
	.word 0xbbab8820  ! 1306: FMOVPOS	fmovs	%fcc1, %f0, %f29
	mov	1, %r14
	.word 0xa193a000  ! 1310: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	1, %r14
	.word 0xa193a000  ! 1317: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81983c91  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c91, %hpstate
	.word 0xb835c000  ! 1321: ORN_R	orn 	%r23, %r0, %r28
	.word 0xbba589a0  ! 1323: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb3a4c8a0  ! 1324: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbfa98820  ! 1325: FMOVNEG	fmovs	%fcc1, %f0, %f31
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 1330: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a448a0  ! 1334: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbda80820  ! 1337: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0x8595e1de  ! 1339: WRPR_TSTATE_I	wrpr	%r23, 0x01de, %tstate
	setx	data_start_1, %g1, %r17
	.word 0x8794615a  ! 1347: WRPR_TT_I	wrpr	%r17, 0x015a, %tt
	.word 0xb9a80820  ! 1348: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x8d952165  ! 1353: WRPR_PSTATE_I	wrpr	%r20, 0x0165, %pstate
	.word 0xb1a4c940  ! 1355: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb5a80820  ! 1356: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00520  ! 1357: FSQRTs	fsqrt	
	.word 0xb550c000  ! 1363: RDPR_TT	<illegal instruction>
	.word 0xb5a549e0  ! 1364: FDIVq	dis not found

	.word 0xb7ab8820  ! 1365: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa509e0  ! 1366: FDIVq	dis not found

	.word 0xb9508000  ! 1370: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f93  ! 1374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0xb9a589c0  ! 1375: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb9a00560  ! 1382: FSQRTq	fsqrt	
	.word 0xbfa81420  ! 1383: FMOVRNZ	dis not found

	.word 0xb8c52083  ! 1388: ADDCcc_I	addccc 	%r20, 0x0083, %r28
	.word 0xbba5c960  ! 1389: FMULq	dis not found

	.word 0xbfa98820  ! 1390: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a4c960  ! 1392: FMULq	dis not found

	.word 0xb7a9c820  ! 1395: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa5c9c0  ! 1396: FDIVd	fdivd	%f54, %f0, %f62
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 1402: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a44920  ! 1403: FMULs	fmuls	%f17, %f0, %f27
	.word 0xb3540000  ! 1405: RDPR_GL	<illegal instruction>
	.word 0xb1a48860  ! 1409: FADDq	dis not found

	.word 0xb5504000  ! 1411: RDPR_TNPC	<illegal instruction>
	.word 0xb1a94820  ! 1413: FMOVCS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 1415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xb7a00520  ! 1416: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 1418: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbb50c000  ! 1422: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 1423: RDPR_TNPC	<illegal instruction>
	.word 0xb52cf001  ! 1424: SLLX_I	sllx	%r19, 0x0001, %r26
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 1427: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a81420  ! 1430: FMOVRNZ	dis not found

	.word 0xbe940000  ! 1436: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xbcc4e1d5  ! 1438: ADDCcc_I	addccc 	%r19, 0x01d5, %r30
	.word 0xbba50960  ! 1440: FMULq	dis not found

	.word 0xb7a80820  ! 1441: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbfa8c820  ! 1446: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00520  ! 1447: FSQRTs	fsqrt	
	.word 0xb52de001  ! 1448: SLL_I	sll 	%r23, 0x0001, %r26
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 1451: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1350000  ! 1454: SRL_R	srl 	%r20, %r0, %r24
	mov	2, %r14
	.word 0xa193a000  ! 1458: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a409c0  ! 1459: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xbd518000  ! 1464: RDPR_PSTATE	<illegal instruction>
	.word 0xbc844000  ! 1466: ADDcc_R	addcc 	%r17, %r0, %r30
	.word 0xb5a4c860  ! 1480: FADDq	dis not found

	.word 0xb7a00520  ! 1486: FSQRTs	fsqrt	
	.word 0xb2a4e0e1  ! 1487: SUBcc_I	subcc 	%r19, 0x00e1, %r25
	.word 0x8795a01a  ! 1489: WRPR_TT_I	wrpr	%r22, 0x001a, %tt
	.word 0xb3a80820  ! 1492: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	setx	0x10121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb17da401  ! 1495: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xb350c000  ! 1497: RDPR_TT	<illegal instruction>
	.word 0xb414601f  ! 1503: OR_I	or 	%r17, 0x001f, %r26
	.word 0xba848000  ! 1508: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xb1510000  ! 1513: RDPR_TICK	<illegal instruction>
	.word 0xb9a8c820  ! 1514: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa8820  ! 1516: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0x879521fe  ! 1518: WRPR_TT_I	wrpr	%r20, 0x01fe, %tt
	.word 0xb72cd000  ! 1523: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xbca5e0fb  ! 1524: SUBcc_I	subcc 	%r23, 0x00fb, %r30
	.word 0x8395e0d6  ! 1525: WRPR_TNPC_I	wrpr	%r23, 0x00d6, %tnpc
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 1528: FSQRTd	fsqrt	
	.word 0xb9a00560  ! 1532: FSQRTq	fsqrt	
	.word 0x83946055  ! 1533: WRPR_TNPC_I	wrpr	%r17, 0x0055, %tnpc
	.word 0xb21d6059  ! 1535: XOR_I	xor 	%r21, 0x0059, %r25
	.word 0x85956001  ! 1536: WRPR_TSTATE_I	wrpr	%r21, 0x0001, %tstate
	.word 0xbdaa0820  ! 1538: FMOVA	fmovs	%fcc1, %f0, %f30
	mov	2, %r14
	.word 0xa193a000  ! 1540: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9aa4820  ! 1541: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0x8f932000  ! 1542: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 1543: RDPR_TSTATE	<illegal instruction>
	.word 0xb751c000  ! 1553: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r20
	.word 0xb1ab0820  ! 1555: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa4820  ! 1559: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x8d95e03f  ! 1562: WRPR_PSTATE_I	wrpr	%r23, 0x003f, %pstate
	.word 0xbda489c0  ! 1563: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb8150000  ! 1565: OR_R	or 	%r20, %r0, %r28
	.word 0x899420c1  ! 1567: WRPR_TICK_I	wrpr	%r16, 0x00c1, %tick
	setx	0x30323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1570: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda5c9e0  ! 1573: FDIVq	dis not found

	.word 0xb9a90820  ! 1574: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	0x1021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 1578: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb21d8000  ! 1580: XOR_R	xor 	%r22, %r0, %r25
	.word 0xb1a80c20  ! 1581: FMOVRLZ	dis not found

	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c840  ! 1583: FADDd	faddd	%f50, %f0, %f24
	.word 0xb1ab0820  ! 1586: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbf500000  ! 1587: RDPR_TPC	<illegal instruction>
	.word 0xb7518000  ! 1591: RDPR_PSTATE	<illegal instruction>
	.word 0xbfab0820  ! 1594: FMOVGU	fmovs	%fcc1, %f0, %f31
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1596: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa5c8c0  ! 1599: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xb73c7001  ! 1600: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0xb7510000  ! 1602: RDPR_TICK	rdpr	%tick, %r27
	.word 0x8194e079  ! 1607: WRPR_TPC_I	wrpr	%r19, 0x0079, %tpc
	.word 0xbfa9c820  ! 1608: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda90820  ! 1609: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0x8595e0ab  ! 1612: WRPR_TSTATE_I	wrpr	%r23, 0x00ab, %tstate
	.word 0xb204a1ef  ! 1613: ADD_I	add 	%r18, 0x01ef, %r25
	.word 0xbba408a0  ! 1618: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb3a4c940  ! 1619: FMULd	fmuld	%f50, %f0, %f56
	.word 0xbfab0820  ! 1623: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbc9d60be  ! 1625: XORcc_I	xorcc 	%r21, 0x00be, %r30
	.word 0xb5342001  ! 1626: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xb20d8000  ! 1630: AND_R	and 	%r22, %r0, %r25
	.word 0xbbaa8820  ! 1636: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7aa0820  ! 1637: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9508000  ! 1638: RDPR_TSTATE	<illegal instruction>
	.word 0xb22d0000  ! 1641: ANDN_R	andn 	%r20, %r0, %r25
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1645: FMOVN	fmovs	%fcc1, %f0, %f31
	setx	0x1031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb37de401  ! 1648: MOVR_I	movre	%r23, 0x1, %r25
	.word 0xbfa48960  ! 1651: FMULq	dis not found

	.word 0xb0940000  ! 1653: ORcc_R	orcc 	%r16, %r0, %r24
	setx	0x2023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4bca095  ! 1656: XNORcc_I	xnorcc 	%r18, 0x0095, %r26
	.word 0xb9a00540  ! 1658: FSQRTd	fsqrt	
	.word 0xb1a80420  ! 1661: FMOVRZ	dis not found

	.word 0xb9520000  ! 1666: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a98820  ! 1669: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbd50c000  ! 1672: RDPR_TT	<illegal instruction>
	.word 0xb9a00560  ! 1675: FSQRTq	fsqrt	
	.word 0xb7a409e0  ! 1684: FDIVq	dis not found

	.word 0xb2b56151  ! 1686: SUBCcc_I	orncc 	%r21, 0x0151, %r25
	.word 0xb5480000  ! 1690: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb1500000  ! 1692: RDPR_TPC	<illegal instruction>
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 1695: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x919561b3  ! 1696: WRPR_PIL_I	wrpr	%r21, 0x01b3, %pil
	.word 0xb9500000  ! 1697: RDPR_TPC	<illegal instruction>
	.word 0xb5518000  ! 1698: RDPR_PSTATE	<illegal instruction>
	.word 0x8194210f  ! 1706: WRPR_TPC_I	wrpr	%r16, 0x010f, %tpc
	.word 0xb3500000  ! 1707: RDPR_TPC	<illegal instruction>
	setx	0x30016, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 1712: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a4c9e0  ! 1713: FDIVq	dis not found

	.word 0xb1a509c0  ! 1715: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbf540000  ! 1716: RDPR_GL	<illegal instruction>
	.word 0xbd518000  ! 1717: RDPR_PSTATE	<illegal instruction>
	.word 0xb9ab8820  ! 1719: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00560  ! 1720: FSQRTq	fsqrt	
	.word 0xb5a5c940  ! 1723: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb5a81820  ! 1726: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb0c48000  ! 1728: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xb1a48960  ! 1732: FMULq	dis not found

	.word 0xb2a5c000  ! 1734: SUBcc_R	subcc 	%r23, %r0, %r25
	setx	0x12b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	.word 0xb7a489e0  ! 1746: FDIVq	dis not found

	.word 0xb1a549e0  ! 1747: FDIVq	dis not found

	.word 0xbda00520  ! 1749: FSQRTs	fsqrt	
	.word 0x859460c1  ! 1750: WRPR_TSTATE_I	wrpr	%r17, 0x00c1, %tstate
	setx	data_start_6, %g1, %r18
	.word 0xb03de127  ! 1754: XNOR_I	xnor 	%r23, 0x0127, %r24
	.word 0xbba5c8a0  ! 1755: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb17c8400  ! 1756: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbda4c8a0  ! 1758: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xba1c21f8  ! 1759: XOR_I	xor 	%r16, 0x01f8, %r29
	.word 0xb3341000  ! 1766: SRLX_R	srlx	%r16, %r0, %r25
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 1772: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a94820  ! 1773: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbba00560  ! 1774: FSQRTq	fsqrt	
	setx	0x3000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa50840  ! 1779: FADDd	faddd	%f20, %f0, %f62
	.word 0x8994e1f5  ! 1780: WRPR_TICK_I	wrpr	%r19, 0x01f5, %tick
	.word 0xbda5c8a0  ! 1785: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb9a8c820  ! 1786: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbba488c0  ! 1787: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb7a00040  ! 1789: FMOVd	fmovd	%f0, %f58
	setx	data_start_2, %g1, %r16
	.word 0xba2dc000  ! 1793: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xb7ab8820  ! 1795: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa44840  ! 1796: FADDd	faddd	%f48, %f0, %f62
	.word 0xbd500000  ! 1799: RDPR_TPC	<illegal instruction>
	.word 0xbb7d0400  ! 1806: MOVR_R	movre	%r20, %r0, %r29
	mov	0, %r14
	.word 0xa193a000  ! 1807: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbdab4820  ! 1810: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb934c000  ! 1817: SRL_R	srl 	%r19, %r0, %r28
	.word 0xb5aac820  ! 1818: FMOVGE	fmovs	%fcc1, %f0, %f26
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 1822: FMOVs	fmovs	%f0, %f31
	setx	0x20116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1825: FSQRTq	fsqrt	
	.word 0xb5a508a0  ! 1827: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xb3a81820  ! 1830: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x30023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	.word 0xbdaa0820  ! 1834: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 1838: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81c20  ! 1839: FMOVRGEZ	dis not found

	.word 0xb5aa0820  ! 1841: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x91946025  ! 1843: WRPR_PIL_I	wrpr	%r17, 0x0025, %pil
	.word 0xb3a8c820  ! 1844: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3a98820  ! 1846: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81983ed9  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed9, %hpstate
	.word 0xb5510000  ! 1856: RDPR_TICK	<illegal instruction>
	.word 0xb9a5c9a0  ! 1857: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbda8c820  ! 1860: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c9c0  ! 1862: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbfa48920  ! 1868: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb9a00020  ! 1876: FMOVs	fmovs	%f0, %f28
	.word 0xb3a00020  ! 1880: FMOVs	fmovs	%f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982ec1  ! 1885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec1, %hpstate
	.word 0xb5a80420  ! 1887: FMOVRZ	dis not found

	.word 0x819561ae  ! 1892: WRPR_TPC_I	wrpr	%r21, 0x01ae, %tpc
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a098  ! 1894: WRPR_TSTATE_I	wrpr	%r22, 0x0098, %tstate
	.word 0xb5a48940  ! 1897: FMULd	fmuld	%f18, %f0, %f26
	setx	data_start_0, %g1, %r23
	.word 0xb424c000  ! 1899: SUB_R	sub 	%r19, %r0, %r26
	.word 0xbea4c000  ! 1904: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xbeb560eb  ! 1906: ORNcc_I	orncc 	%r21, 0x00eb, %r31
	.word 0xb7a449e0  ! 1907: FDIVq	dis not found

	.word 0x8594e1d8  ! 1908: WRPR_TSTATE_I	wrpr	%r19, 0x01d8, %tstate
	.word 0xb3a40820  ! 1915: FADDs	fadds	%f16, %f0, %f25
	.word 0xb6ad4000  ! 1919: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb9a94820  ! 1921: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba80c20  ! 1924: FMOVRLZ	dis not found

	.word 0xb3aac820  ! 1927: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a4c960  ! 1931: FMULq	dis not found

	.word 0xb00de1f6  ! 1935: AND_I	and 	%r23, 0x01f6, %r24
	.word 0xb9a9c820  ! 1938: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983dd3  ! 1940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd3, %hpstate
	.word 0xbda4c960  ! 1942: FMULq	dis not found

	.word 0xb7520000  ! 1944: RDPR_PIL	<illegal instruction>
	.word 0xb7518000  ! 1949: RDPR_PSTATE	<illegal instruction>
	.word 0xb4bde109  ! 1950: XNORcc_I	xnorcc 	%r23, 0x0109, %r26
	.word 0xb33d3001  ! 1955: SRAX_I	srax	%r20, 0x0001, %r25
	.word 0xbba589a0  ! 1956: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb1480000  ! 1960: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb5504000  ! 1964: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 1965: RDPR_TL	<illegal instruction>
	.word 0xb4b4c000  ! 1966: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb7a94820  ! 1967: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5ab4820  ! 1973: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	data_start_0, %g1, %r20
	.word 0xbba80820  ! 1978: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbbab8820  ! 1982: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8394a184  ! 1989: WRPR_TNPC_I	wrpr	%r18, 0x0184, %tnpc
	.word 0xbb504000  ! 1990: RDPR_TNPC	<illegal instruction>
	.word 0xb8348000  ! 1991: ORN_R	orn 	%r18, %r0, %r28
	.word 0xbfa4c9c0  ! 1992: FDIVd	fdivd	%f50, %f0, %f62
	setx	data_start_4, %g1, %r22
	.word 0xb9a4c9e0  ! 2003: FDIVq	dis not found

	.word 0xb5a81c20  ! 2005: FMOVRGEZ	dis not found

	.word 0xbdaa4820  ! 2006: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x9195a12a  ! 2007: WRPR_PIL_I	wrpr	%r22, 0x012a, %pil
	.word 0xbf504000  ! 2008: RDPR_TNPC	<illegal instruction>
	.word 0xb5ab0820  ! 2011: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb0b4e07c  ! 2013: SUBCcc_I	orncc 	%r19, 0x007c, %r24
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e153  ! 2021: WRPR_TNPC_I	wrpr	%r19, 0x0153, %tnpc
	.word 0xb350c000  ! 2022: RDPR_TT	<illegal instruction>
	.word 0xb9a80c20  ! 2023: FMOVRLZ	dis not found

	.word 0xb5a00520  ! 2027: FSQRTs	fsqrt	
	.word 0xb015c000  ! 2028: OR_R	or 	%r23, %r0, %r24
	.word 0xbba84820  ! 2029: FMOVE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982f99  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0x8994200b  ! 2036: WRPR_TICK_I	wrpr	%r16, 0x000b, %tick
	.word 0xb7480000  ! 2038: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3a00560  ! 2041: FSQRTq	fsqrt	
	.word 0x8d9561d8  ! 2046: WRPR_PSTATE_I	wrpr	%r21, 0x01d8, %pstate
	.word 0xb3a409a0  ! 2048: FDIVs	fdivs	%f16, %f0, %f25
	setx	0x30035, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb885e18d  ! 2052: ADDcc_I	addcc 	%r23, 0x018d, %r28
	ta	T_CHANGE_HPRIV
	.word 0x819828cb  ! 2054: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0x8395e04f  ! 2056: WRPR_TNPC_I	wrpr	%r23, 0x004f, %tnpc
	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb4a40000  ! 2060: SUBcc_R	subcc 	%r16, %r0, %r26
	mov	2, %r12
	.word 0x8f932000  ! 2061: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3aa8820  ! 2063: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 2064: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb5a5c9a0  ! 2067: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xbba448c0  ! 2073: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb9a44920  ! 2076: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb7a00040  ! 2080: FMOVd	fmovd	%f0, %f58
	.word 0xbba50920  ! 2087: FMULs	fmuls	%f20, %f0, %f29
	.word 0x89942121  ! 2089: WRPR_TICK_I	wrpr	%r16, 0x0121, %tick
	.word 0xb0340000  ! 2090: ORN_R	orn 	%r16, %r0, %r24
	.word 0xb284c000  ! 2092: ADDcc_R	addcc 	%r19, %r0, %r25
	setx	0x20228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 2098: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a5c960  ! 2099: FMULq	dis not found

	.word 0xbd520000  ! 2100: RDPR_PIL	<illegal instruction>
	.word 0xb550c000  ! 2103: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 2104: RDPR_PIL	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 2105: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	mov	2, %r12
	.word 0x8f932000  ! 2112: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982819  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0819, %hpstate
	setx	data_start_6, %g1, %r18
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf347001  ! 2126: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xbb51c000  ! 2127: RDPR_TL	<illegal instruction>
	.word 0xb3a00560  ! 2128: FSQRTq	fsqrt	
	.word 0xb1a80c20  ! 2129: FMOVRLZ	dis not found

	.word 0x8d94615d  ! 2131: WRPR_PSTATE_I	wrpr	%r17, 0x015d, %pstate
	.word 0xb434a026  ! 2132: ORN_I	orn 	%r18, 0x0026, %r26
	.word 0xb8bda0f8  ! 2133: XNORcc_I	xnorcc 	%r22, 0x00f8, %r28
	setx	0x3010f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 2136: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81820  ! 2140: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb12c1000  ! 2143: SLLX_R	sllx	%r16, %r0, %r24
	.word 0xb9a00020  ! 2144: FMOVs	fmovs	%f0, %f28
	.word 0xbfa00020  ! 2145: FMOVs	fmovs	%f0, %f31
	.word 0xb1abc820  ! 2146: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9540000  ! 2147: RDPR_GL	<illegal instruction>
	.word 0x8394e010  ! 2148: WRPR_TNPC_I	wrpr	%r19, 0x0010, %tnpc
	.word 0xbb51c000  ! 2150: RDPR_TL	<illegal instruction>
	.word 0xbda81c20  ! 2151: FMOVRGEZ	dis not found

	.word 0xb3a548e0  ! 2155: FSUBq	dis not found

	.word 0xb77d2401  ! 2159: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xbc3dc000  ! 2160: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb1540000  ! 2163: RDPR_GL	<illegal instruction>
	.word 0xbfa00520  ! 2167: FSQRTs	fsqrt	
	.word 0xb3a409a0  ! 2168: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xba2da1d3  ! 2170: ANDN_I	andn 	%r22, 0x01d3, %r29
	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9c0  ! 2176: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb7a88820  ! 2177: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab0820  ! 2184: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb37c2401  ! 2185: MOVR_I	movre	%r16, 0x1, %r25
	setx	0x10033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a0b1  ! 2190: WRPR_TICK_I	wrpr	%r22, 0x00b1, %tick
	setx	data_start_0, %g1, %r22
	setx	0x2020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2197: RDPR_PIL	<illegal instruction>
	.word 0xb5a94820  ! 2202: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbba94820  ! 2203: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x8994a08b  ! 2205: WRPR_TICK_I	wrpr	%r18, 0x008b, %tick
	.word 0xb751c000  ! 2210: RDPR_TL	<illegal instruction>
	.word 0xbba81420  ! 2213: FMOVRNZ	dis not found

	.word 0xb3508000  ! 2217: RDPR_TSTATE	<illegal instruction>
	.word 0x899461c3  ! 2219: WRPR_TICK_I	wrpr	%r17, 0x01c3, %tick
	.word 0xb5a00560  ! 2220: FSQRTq	fsqrt	
	.word 0xbda50840  ! 2222: FADDd	faddd	%f20, %f0, %f30
	.word 0xbda5c8c0  ! 2223: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xbfaa4820  ! 2228: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80820  ! 2230: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 2236: FSQRTd	fsqrt	
	setx	0x1033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 2239: RDPR_GL	<illegal instruction>
	.word 0xbf518000  ! 2240: RDPR_PSTATE	<illegal instruction>
	.word 0xbe8d211e  ! 2243: ANDcc_I	andcc 	%r20, 0x011e, %r31
	.word 0xb1a98820  ! 2246: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb3518000  ! 2248: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a50820  ! 2250: FADDs	fadds	%f20, %f0, %f27
	.word 0xb951c000  ! 2257: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2263: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a40860  ! 2265: FADDq	dis not found

	.word 0xbf51c000  ! 2267: RDPR_TL	<illegal instruction>
	.word 0xb3a9c820  ! 2270: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7510000  ! 2271: RDPR_TICK	<illegal instruction>
	.word 0xb3a5c960  ! 2273: FMULq	dis not found

	.word 0xb3a80420  ! 2276: FMOVRZ	dis not found

	.word 0xbba4c820  ! 2278: FADDs	fadds	%f19, %f0, %f29
	.word 0xbda90820  ! 2282: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	0x30315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2295: RDPR_TNPC	<illegal instruction>
	.word 0xbba40840  ! 2297: FADDd	faddd	%f16, %f0, %f60
	.word 0xbda81c20  ! 2299: FMOVRGEZ	dis not found

	setx	0x30001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a40920  ! 2305: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb3a448c0  ! 2306: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xb7a00520  ! 2313: FSQRTs	fsqrt	
	.word 0xbda48840  ! 2314: FADDd	faddd	%f18, %f0, %f30
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a549e0  ! 2318: FDIVq	dis not found

	.word 0xb33d2001  ! 2320: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb734e001  ! 2327: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xb9ab4820  ! 2333: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x8394617a  ! 2334: WRPR_TNPC_I	wrpr	%r17, 0x017a, %tnpc
	mov	1, %r14
	.word 0xa193a000  ! 2335: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 2338: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xb1500000  ! 2340: RDPR_TPC	<illegal instruction>
	.word 0x8394e100  ! 2341: WRPR_TNPC_I	wrpr	%r19, 0x0100, %tnpc
	mov	0, %r14
	.word 0xa193a000  ! 2343: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbfa50920  ! 2344: FMULs	fmuls	%f20, %f0, %f31
	.word 0x8794e163  ! 2346: WRPR_TT_I	wrpr	%r19, 0x0163, %tt
	setx	0x10308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952152  ! 2351: WRPR_TPC_I	wrpr	%r20, 0x0152, %tpc
	.word 0xb3508000  ! 2353: RDPR_TSTATE	<illegal instruction>
	.word 0xb1518000  ! 2355: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a88820  ! 2358: FMOVLE	fmovs	%fcc1, %f0, %f24
	setx	data_start_7, %g1, %r22
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 2364: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	0x30003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 2368: FMOVLEU	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982843  ! 2369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0843, %hpstate
	.word 0xb5540000  ! 2370: RDPR_GL	<illegal instruction>
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48860  ! 2372: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a548c0  ! 2375: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb3508000  ! 2376: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a80c20  ! 2379: FMOVRLZ	dis not found

	.word 0xbd504000  ! 2382: RDPR_TNPC	<illegal instruction>
	.word 0xb3a48840  ! 2383: FADDd	faddd	%f18, %f0, %f56
	.word 0xbfa80c20  ! 2387: FMOVRLZ	dis not found

	.word 0xbfa00520  ! 2391: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982c53  ! 2392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c53, %hpstate
	.word 0xbba589a0  ! 2394: FDIVs	fdivs	%f22, %f0, %f29
	.word 0x8394e19d  ! 2397: WRPR_TNPC_I	wrpr	%r19, 0x019d, %tnpc
	mov	2, %r12
	.word 0x8f932000  ! 2400: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a489c0  ! 2402: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb7ab4820  ! 2405: FMOVCC	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982a49  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a49, %hpstate
	.word 0xbf480000  ! 2413: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a84820  ! 2415: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc3421a1  ! 2418: ORN_I	orn 	%r16, 0x01a1, %r30
	.word 0xb3a98820  ! 2419: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbb508000  ! 2426: RDPR_TSTATE	<illegal instruction>
	.word 0xb7abc820  ! 2427: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbba80c20  ! 2428: FMOVRLZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 2429: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda84820  ! 2434: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81420  ! 2436: FMOVRNZ	dis not found

	.word 0xb5a88820  ! 2437: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 2438: FMOVRNZ	dis not found

	.word 0xbd3d6001  ! 2439: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xbb520000  ! 2450: RDPR_PIL	<illegal instruction>
	.word 0xbba48960  ! 2451: FMULq	dis not found

	.word 0xb750c000  ! 2454: RDPR_TT	<illegal instruction>
	.word 0xbda00520  ! 2455: FSQRTs	fsqrt	
	.word 0xb7510000  ! 2456: RDPR_TICK	<illegal instruction>
	.word 0xb1a548c0  ! 2457: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb7a50820  ! 2463: FADDs	fadds	%f20, %f0, %f27
	.word 0xb7a58940  ! 2464: FMULd	fmuld	%f22, %f0, %f58
	.word 0xb0250000  ! 2465: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb7a80420  ! 2468: FMOVRZ	dis not found

	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 2472: RDPR_PSTATE	<illegal instruction>
	.word 0xb8054000  ! 2474: ADD_R	add 	%r21, %r0, %r28
	.word 0x8594e1c6  ! 2477: WRPR_TSTATE_I	wrpr	%r19, 0x01c6, %tstate
	.word 0xb5480000  ! 2478: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983f19  ! 2484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f19, %hpstate
	.word 0xb1a408a0  ! 2486: FSUBs	fsubs	%f16, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x8198380b  ! 2490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180b, %hpstate
	.word 0xb9a4c8a0  ! 2491: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb1a80420  ! 2492: FMOVRZ	dis not found

	.word 0xbba408c0  ! 2495: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xba0ca09c  ! 2497: AND_I	and 	%r18, 0x009c, %r29
	.word 0xb5a84820  ! 2503: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a488e0  ! 2506: FSUBq	dis not found

	.word 0xbfa00520  ! 2511: FSQRTs	fsqrt	
	.word 0xb7480000  ! 2515: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba448e0  ! 2516: FSUBq	dis not found

	.word 0xbba84820  ! 2517: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	data_start_6, %g1, %r22
	.word 0xb7a80c20  ! 2520: FMOVRLZ	dis not found

	.word 0xb9aac820  ! 2522: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0x9194e00b  ! 2523: WRPR_PIL_I	wrpr	%r19, 0x000b, %pil
	.word 0xbda40920  ! 2525: FMULs	fmuls	%f16, %f0, %f30
	setx	0x20212, %g1, %o0
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
	.word 0x8595619d  ! 2531: WRPR_TSTATE_I	wrpr	%r21, 0x019d, %tstate
	.word 0x8395a10b  ! 2532: WRPR_TNPC_I	wrpr	%r22, 0x010b, %tnpc
	.word 0xbbaa4820  ! 2538: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c8a0  ! 2539: FSUBs	fsubs	%f19, %f0, %f24
	setx	data_start_5, %g1, %r22
	.word 0x8794e17b  ! 2541: WRPR_TT_I	wrpr	%r19, 0x017b, %tt
	.word 0xbda5c9c0  ! 2547: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb7a409c0  ! 2548: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb3508000  ! 2553: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a81c20  ! 2554: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a58960  ! 2561: FMULq	dis not found

	.word 0xbdabc820  ! 2562: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda50920  ! 2563: FMULs	fmuls	%f20, %f0, %f30
	.word 0xbbab0820  ! 2568: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a88820  ! 2570: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a58940  ! 2573: FMULd	fmuld	%f22, %f0, %f28
	setx	0x2002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 2580: FSQRTd	fsqrt	
	.word 0xb7a88820  ! 2584: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0x8795e09c  ! 2586: WRPR_TT_I	wrpr	%r23, 0x009c, %tt
	.word 0xb1a9c820  ! 2587: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00540  ! 2588: FSQRTd	fsqrt	
	.word 0xbfa80420  ! 2589: FMOVRZ	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 2597: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5aac820  ! 2598: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x8d94619c  ! 2603: WRPR_PSTATE_I	wrpr	%r17, 0x019c, %pstate
	.word 0x8194e16a  ! 2607: WRPR_TPC_I	wrpr	%r19, 0x016a, %tpc
	.word 0xb9520000  ! 2608: RDPR_PIL	rdpr	%pil, %r28
	.word 0xb9504000  ! 2610: RDPR_TNPC	<illegal instruction>
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2614: RDPR_PSTATE	<illegal instruction>
	.word 0xbda58820  ! 2616: FADDs	fadds	%f22, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a81420  ! 2620: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983801  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1801, %hpstate
	.word 0xb1510000  ! 2622: RDPR_TICK	<illegal instruction>
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd349000  ! 2624: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xb7aa0820  ! 2625: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda9c820  ! 2626: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a549c0  ! 2631: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb9a50940  ! 2635: FMULd	fmuld	%f20, %f0, %f28
	.word 0xbda5c9e0  ! 2639: FDIVq	dis not found

	.word 0xbbaac820  ! 2643: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a44820  ! 2645: FADDs	fadds	%f17, %f0, %f26
	.word 0xba348000  ! 2646: ORN_R	orn 	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r14
	.word 0xa193a000  ! 2652: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbdaa8820  ! 2655: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a9c820  ! 2656: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a50920  ! 2660: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb1a80420  ! 2662: FMOVRZ	dis not found

	.word 0xb1aa0820  ! 2664: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa4820  ! 2669: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa4c8c0  ! 2677: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb1a449e0  ! 2684: FDIVq	dis not found

	.word 0xbb510000  ! 2685: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbda81420  ! 2686: FMOVRNZ	dis not found

	setx	0x3e, %g1, %o0
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
	.word 0xbda50920  ! 2690: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb7a9c820  ! 2693: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 2695: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x30220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	.word 0xb3ab4820  ! 2701: FMOVCC	fmovs	%fcc1, %f0, %f25
	setx	data_start_7, %g1, %r17
	.word 0xbdaac820  ! 2705: FMOVGE	fmovs	%fcc1, %f0, %f30
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9a0  ! 2708: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb1a588c0  ! 2709: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb1a40940  ! 2712: FMULd	fmuld	%f16, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a8c820  ! 2721: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1510000  ! 2722: RDPR_TICK	<illegal instruction>
	.word 0xbfa00520  ! 2723: FSQRTs	fsqrt	
	.word 0xb7ab4820  ! 2727: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a589c0  ! 2728: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xbdaa8820  ! 2731: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x1a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 2739: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7540000  ! 2741: RDPR_GL	<illegal instruction>
	.word 0xb3a81c20  ! 2747: FMOVRGEZ	dis not found

	.word 0xb1518000  ! 2748: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a80820  ! 2751: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x819839d1  ! 2755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d1, %hpstate
	setx	data_start_5, %g1, %r22
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c960  ! 2762: FMULq	dis not found

	.word 0xb5540000  ! 2764: RDPR_GL	<illegal instruction>
	.word 0xb9a5c8c0  ! 2766: FSUBd	fsubd	%f54, %f0, %f28
	.word 0xbfa54820  ! 2771: FADDs	fadds	%f21, %f0, %f31
	.word 0xb9a88820  ! 2775: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb350c000  ! 2776: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 2777: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r17
	.word 0xb3a00560  ! 2782: FSQRTq	fsqrt	
	.word 0xbd504000  ! 2783: RDPR_TNPC	<illegal instruction>
	.word 0xb1a489c0  ! 2785: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb5a408e0  ! 2786: FSUBq	dis not found

	.word 0xb5508000  ! 2787: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00040  ! 2790: FMOVd	fmovd	%f0, %f62
	.word 0xb151c000  ! 2791: RDPR_TL	<illegal instruction>
	.word 0x8794a1f9  ! 2792: WRPR_TT_I	wrpr	%r18, 0x01f9, %tt
	.word 0xb9ab0820  ! 2797: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbc2520fa  ! 2802: SUB_I	sub 	%r20, 0x00fa, %r30
	.word 0xb3a81820  ! 2806: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba409e0  ! 2808: FDIVq	dis not found

	.word 0xbfa588e0  ! 2810: FSUBq	dis not found

	.word 0xb5a81420  ! 2811: FMOVRNZ	dis not found

	.word 0xbf51c000  ! 2812: RDPR_TL	<illegal instruction>
	.word 0x9194e08f  ! 2815: WRPR_PIL_I	wrpr	%r19, 0x008f, %pil
	.word 0x89946144  ! 2816: WRPR_TICK_I	wrpr	%r17, 0x0144, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983fd3  ! 2820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd3, %hpstate
	.word 0xb5ab8820  ! 2822: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbb508000  ! 2826: RDPR_TSTATE	<illegal instruction>
	setx	0x1030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 2831: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbf504000  ! 2835: RDPR_TNPC	<illegal instruction>
	.word 0xbba00520  ! 2838: FSQRTs	fsqrt	
	setx	0x10102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 2851: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0x8d94619c  ! 2852: WRPR_PSTATE_I	wrpr	%r17, 0x019c, %pstate
	.word 0x8995a192  ! 2853: WRPR_TICK_I	wrpr	%r22, 0x0192, %tick
	.word 0xbba448c0  ! 2855: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb9a00540  ! 2862: FSQRTd	fsqrt	
	.word 0xb550c000  ! 2867: RDPR_TT	<illegal instruction>
	.word 0xb1a409e0  ! 2868: FDIVq	dis not found

	.word 0xb9a81c20  ! 2872: FMOVRGEZ	dis not found

	.word 0xb9a449c0  ! 2873: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xbfabc820  ! 2874: FMOVVC	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0x8f932000  ! 2875: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa8c820  ! 2876: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbd3cd000  ! 2881: SRAX_R	srax	%r19, %r0, %r30
	.word 0xb37dc400  ! 2882: MOVR_R	movre	%r23, %r0, %r25
	.word 0xb805215f  ! 2885: ADD_I	add 	%r20, 0x015f, %r28
	.word 0xb3a549a0  ! 2889: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xbd346001  ! 2890: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb9508000  ! 2895: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a84820  ! 2901: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbbaac820  ! 2902: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb3ab4820  ! 2904: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8994a0e4  ! 2905: WRPR_TICK_I	wrpr	%r18, 0x00e4, %tick
	.word 0x91956015  ! 2908: WRPR_PIL_I	wrpr	%r21, 0x0015, %pil
	.word 0xb3500000  ! 2910: RDPR_TPC	<illegal instruction>
	setx	0x3023e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba448a0  ! 2913: FSUBs	fsubs	%f17, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c920  ! 2920: FMULs	fmuls	%f19, %f0, %f27
	setx	0x1032e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	.word 0xb5aa8820  ! 2926: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 2928: FSQRTd	fsqrt	
	.word 0xb1a4c8e0  ! 2934: FSUBq	dis not found

	.word 0xba3cc000  ! 2937: XNOR_R	xnor 	%r19, %r0, %r29
	setx	data_start_5, %g1, %r17
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	.word 0xb13ca001  ! 2941: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xb5a00020  ! 2942: FMOVs	fmovs	%f0, %f26
	.word 0xb5ab8820  ! 2944: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x839421cb  ! 2947: WRPR_TNPC_I	wrpr	%r16, 0x01cb, %tnpc
	.word 0xbd3d8000  ! 2948: SRA_R	sra 	%r22, %r0, %r30
	mov	0, %r14
	.word 0xa193a000  ! 2953: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 2959: RDPR_GL	<illegal instruction>
	.word 0xb7510000  ! 2960: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 2962: RDPR_TICK	<illegal instruction>
	.word 0xb550c000  ! 2964: RDPR_TT	<illegal instruction>
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa58860  ! 2967: FADDq	dis not found

	.word 0xb2c4a176  ! 2971: ADDCcc_I	addccc 	%r18, 0x0176, %r25
	.word 0xb1ab8820  ! 2974: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80420  ! 2976: FMOVRZ	dis not found

	.word 0xb1500000  ! 2977: RDPR_TPC	<illegal instruction>
	.word 0xb5ab8820  ! 2980: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xba1da074  ! 2984: XOR_I	xor 	%r22, 0x0074, %r29
	.word 0xbfa00540  ! 2988: FSQRTd	fsqrt	
	.word 0xb57c8400  ! 2992: MOVR_R	movre	%r18, %r0, %r26
	.word 0xb9a40840  ! 2996: FADDd	faddd	%f16, %f0, %f28
	.word 0xb5a58820  ! 3001: FADDs	fadds	%f22, %f0, %f26
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8c4e195  ! 3007: ADDCcc_I	addccc 	%r19, 0x0195, %r28
	setx	0x30304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 3009: RDPR_TICK	<illegal instruction>
	.word 0xbda5c860  ! 3011: FADDq	dis not found

	.word 0xb3a80c20  ! 3012: FMOVRLZ	dis not found

	.word 0xbba58940  ! 3017: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb82d2016  ! 3019: ANDN_I	andn 	%r20, 0x0016, %r28
	.word 0xbfa80820  ! 3020: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0x859420e7  ! 3022: WRPR_TSTATE_I	wrpr	%r16, 0x00e7, %tstate
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 3031: FMOVGE	fmovs	%fcc1, %f0, %f31
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3035: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab8820  ! 3040: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba40960  ! 3041: FMULq	dis not found

	.word 0xb9a8c820  ! 3042: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfa84820  ! 3043: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda00560  ! 3045: FSQRTq	fsqrt	
	.word 0xb3a44920  ! 3048: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb3a409c0  ! 3049: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xb7a5c940  ! 3050: FMULd	fmuld	%f54, %f0, %f58
	.word 0xb5480000  ! 3051: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7a00040  ! 3052: FMOVd	fmovd	%f0, %f58
	.word 0xbfab8820  ! 3054: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x9195a0df  ! 3055: WRPR_PIL_I	wrpr	%r22, 0x00df, %pil
	.word 0x8d956183  ! 3058: WRPR_PSTATE_I	wrpr	%r21, 0x0183, %pstate
	.word 0xb624e035  ! 3062: SUB_I	sub 	%r19, 0x0035, %r27
	.word 0xb1a50820  ! 3063: FADDs	fadds	%f20, %f0, %f24
	setx	0x20018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 3066: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbda58920  ! 3067: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb9a589c0  ! 3075: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb5520000  ! 3085: RDPR_PIL	<illegal instruction>
	.word 0x8195a17e  ! 3089: WRPR_TPC_I	wrpr	%r22, 0x017e, %tpc
	.word 0xb3a00560  ! 3092: FSQRTq	fsqrt	
	.word 0xb5a548c0  ! 3096: FSUBd	fsubd	%f52, %f0, %f26
	.word 0x9194204a  ! 3098: WRPR_PIL_I	wrpr	%r16, 0x004a, %pil
	.word 0xbfa98820  ! 3099: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a81820  ! 3102: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa98820  ! 3104: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa84820  ! 3106: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00520  ! 3113: FSQRTs	fsqrt	
	.word 0xbdaa0820  ! 3117: FMOVA	fmovs	%fcc1, %f0, %f30
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 3122: FMOVRNZ	dis not found

	.word 0xbda88820  ! 3126: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a44860  ! 3128: FADDq	dis not found

	setx	data_start_7, %g1, %r20
	.word 0xb9518000  ! 3130: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982e43  ! 3132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0xbf540000  ! 3135: RDPR_GL	<illegal instruction>
	.word 0xb7a5c9a0  ! 3136: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb7ab8820  ! 3143: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba80820  ! 3145: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa0820  ! 3146: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3a509c0  ! 3150: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb1a4c9e0  ! 3152: FDIVq	dis not found

	.word 0xb751c000  ! 3156: RDPR_TL	<illegal instruction>
	.word 0xbf480000  ! 3157: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a9c820  ! 3159: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00540  ! 3162: FSQRTd	fsqrt	
	.word 0xb5a90820  ! 3165: FMOVLEU	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 3168: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8d94a024  ! 3170: WRPR_PSTATE_I	wrpr	%r18, 0x0024, %pstate
	.word 0xb835e186  ! 3177: SUBC_I	orn 	%r23, 0x0186, %r28
	.word 0xbd504000  ! 3179: RDPR_TNPC	<illegal instruction>
	.word 0xb5a4c860  ! 3180: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 3181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xb5504000  ! 3183: RDPR_TNPC	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 3185: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 3189: FMOVRLZ	dis not found

	.word 0xb5a81820  ! 3194: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	data_start_1, %g1, %r17
	.word 0xb3504000  ! 3198: RDPR_TNPC	<illegal instruction>
	.word 0xb3a40920  ! 3199: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb5a54920  ! 3201: FMULs	fmuls	%f21, %f0, %f26
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53c4000  ! 3205: SRA_R	sra 	%r17, %r0, %r26
	setx	0x31e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a40820  ! 3212: FADDs	fadds	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81983d5b  ! 3213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5b, %hpstate
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c860  ! 3220: FADDq	dis not found

	.word 0xb0b44000  ! 3221: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xbfa80820  ! 3225: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb0ac4000  ! 3226: ANDNcc_R	andncc 	%r17, %r0, %r24
	setx	0x2002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a40940  ! 3230: FMULd	fmuld	%f16, %f0, %f56
	.word 0xb1a80820  ! 3231: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00020  ! 3232: FMOVs	fmovs	%f0, %f31
	.word 0xb5a80420  ! 3233: FMOVRZ	dis not found

	setx	data_start_5, %g1, %r19
	.word 0xb1a90820  ! 3237: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbfab0820  ! 3239: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5510000  ! 3242: RDPR_TICK	<illegal instruction>
	.word 0xbb347001  ! 3243: SRLX_I	srlx	%r17, 0x0001, %r29
	.word 0xb5480000  ! 3247: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb1a00560  ! 3255: FSQRTq	fsqrt	
	.word 0xbba58860  ! 3257: FADDq	dis not found

	.word 0xb3a94820  ! 3259: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00560  ! 3260: FSQRTq	fsqrt	
	mov	0, %r14
	.word 0xa193a000  ! 3262: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf510000  ! 3270: RDPR_TICK	<illegal instruction>
	.word 0xb4ad0000  ! 3272: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xbfabc820  ! 3273: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a94820  ! 3277: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb7aa0820  ! 3286: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00020  ! 3287: FMOVs	fmovs	%f0, %f24
	.word 0xbba408a0  ! 3290: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xbb508000  ! 3292: RDPR_TSTATE	<illegal instruction>
	.word 0xba1c61fe  ! 3297: XOR_I	xor 	%r17, 0x01fe, %r29
	.word 0xbfa9c820  ! 3312: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa508a0  ! 3313: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbda5c820  ! 3318: FADDs	fadds	%f23, %f0, %f30
	.word 0xb7a81420  ! 3322: FMOVRNZ	dis not found

	.word 0xb0c5e165  ! 3323: ADDCcc_I	addccc 	%r23, 0x0165, %r24
	.word 0xb08c2047  ! 3326: ANDcc_I	andcc 	%r16, 0x0047, %r24
	setx	data_start_0, %g1, %r23
	.word 0xba05c000  ! 3328: ADD_R	add 	%r23, %r0, %r29
	.word 0xb3ab0820  ! 3330: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb2bd61ed  ! 3335: XNORcc_I	xnorcc 	%r21, 0x01ed, %r25
	.word 0xbfa54960  ! 3337: FMULq	dis not found

	.word 0xb350c000  ! 3344: RDPR_TT	<illegal instruction>
	.word 0xbfa4c960  ! 3349: FMULq	dis not found

	.word 0xbe15c000  ! 3352: OR_R	or 	%r23, %r0, %r31
	.word 0xb5aa0820  ! 3353: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbda44940  ! 3358: FMULd	fmuld	%f48, %f0, %f30
	setx	0x30231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a408e0  ! 3364: FSUBq	dis not found

	.word 0xb5a588c0  ! 3365: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb7a8c820  ! 3366: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00020  ! 3367: FMOVs	fmovs	%f0, %f27
	.word 0xb7a5c840  ! 3368: FADDd	faddd	%f54, %f0, %f58
	.word 0x87952052  ! 3372: WRPR_TT_I	wrpr	%r20, 0x0052, %tt
	.word 0xb1520000  ! 3384: RDPR_PIL	<illegal instruction>
	.word 0xb7508000  ! 3385: RDPR_TSTATE	<illegal instruction>
	.word 0xb551c000  ! 3388: RDPR_TL	<illegal instruction>
	.word 0xba34a05c  ! 3389: SUBC_I	orn 	%r18, 0x005c, %r29
	.word 0xbda489e0  ! 3394: FDIVq	dis not found

	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 3396: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0x8394a180  ! 3402: WRPR_TNPC_I	wrpr	%r18, 0x0180, %tnpc
	.word 0xbdaa8820  ! 3403: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb4b5e1aa  ! 3406: ORNcc_I	orncc 	%r23, 0x01aa, %r26
	.word 0xb9a548a0  ! 3407: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbda58860  ! 3409: FADDq	dis not found

	.word 0xb5a00560  ! 3412: FSQRTq	fsqrt	
	setx	data_start_3, %g1, %r23
	.word 0xb1a48960  ! 3420: FMULq	dis not found

	.word 0xb334a001  ! 3421: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xb151c000  ! 3424: RDPR_TL	<illegal instruction>
	.word 0xbdaac820  ! 3425: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a508c0  ! 3428: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1a589e0  ! 3430: FDIVq	dis not found

	.word 0xb7a50940  ! 3431: FMULd	fmuld	%f20, %f0, %f58
	.word 0xbda81c20  ! 3433: FMOVRGEZ	dis not found

	.word 0xb5aa8820  ! 3436: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbfaac820  ! 3439: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3aa4820  ! 3440: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa94820  ! 3442: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a4c860  ! 3445: FADDq	dis not found

	.word 0xbda548e0  ! 3446: FSUBq	dis not found

	.word 0xb7641800  ! 3448: MOVcc_R	<illegal instruction>
	.word 0xbba48920  ! 3449: FMULs	fmuls	%f18, %f0, %f29
	setx	data_start_5, %g1, %r22
	.word 0xbda80820  ! 3451: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00560  ! 3454: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983f13  ! 3456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f13, %hpstate
	.word 0xb5a449a0  ! 3458: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xbba00040  ! 3459: FMOVd	fmovd	%f0, %f60
	.word 0xb3a4c9a0  ! 3462: FDIVs	fdivs	%f19, %f0, %f25
	.word 0x8394e199  ! 3465: WRPR_TNPC_I	wrpr	%r19, 0x0199, %tnpc
	.word 0xb9a4c840  ! 3467: FADDd	faddd	%f50, %f0, %f28
	.word 0xb5504000  ! 3469: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00520  ! 3471: FSQRTs	fsqrt	
	.word 0xb1a449e0  ! 3472: FDIVq	dis not found

	.word 0xb3a90820  ! 3476: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa54960  ! 3484: FMULq	dis not found

	.word 0xb7510000  ! 3485: RDPR_TICK	<illegal instruction>
	.word 0xbfa00020  ! 3487: FMOVs	fmovs	%f0, %f31
	.word 0xb9a80420  ! 3489: FMOVRZ	dis not found

	.word 0xbb508000  ! 3490: RDPR_TSTATE	<illegal instruction>
	.word 0x8195e106  ! 3491: WRPR_TPC_I	wrpr	%r23, 0x0106, %tpc
	.word 0xbda409c0  ! 3495: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb3a9c820  ! 3498: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c9a0  ! 3501: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb9a98820  ! 3504: FMOVNEG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982a51  ! 3505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a51, %hpstate
	.word 0xb8bd60a4  ! 3506: XNORcc_I	xnorcc 	%r21, 0x00a4, %r28
	.word 0xb7a44940  ! 3507: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb1a449a0  ! 3511: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb5504000  ! 3512: RDPR_TNPC	<illegal instruction>
	.word 0xb5a00040  ! 3516: FMOVd	fmovd	%f0, %f26
	.word 0xb9508000  ! 3517: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a588e0  ! 3518: FSUBq	dis not found

	.word 0xb7aa0820  ! 3519: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb2bd8000  ! 3520: XNORcc_R	xnorcc 	%r22, %r0, %r25
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8a0  ! 3524: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xbda548a0  ! 3525: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb7a5c840  ! 3527: FADDd	faddd	%f54, %f0, %f58
	.word 0xb9abc820  ! 3530: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80820  ! 3531: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb9a94820  ! 3532: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbd518000  ! 3538: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e5b  ! 3539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5b, %hpstate
	.word 0xbda00020  ! 3540: FMOVs	fmovs	%f0, %f30
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 3543: FMOVN	fmovs	%fcc1, %f0, %f24
	mov	1, %r12
	.word 0x8f932000  ! 3544: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9518000  ! 3547: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a90820  ! 3554: FMOVLEU	fmovs	%fcc1, %f0, %f28
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00540  ! 3559: FSQRTd	fsqrt	
	.word 0xbda00020  ! 3561: FMOVs	fmovs	%f0, %f30
	.word 0xbfa4c940  ! 3566: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb3a98820  ! 3568: FMOVNEG	fmovs	%fcc1, %f0, %f25
	mov	0, %r14
	.word 0xa193a000  ! 3569: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbab0820  ! 3571: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80420  ! 3573: FMOVRZ	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 3578: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba549a0  ! 3581: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb6b4606c  ! 3583: SUBCcc_I	orncc 	%r17, 0x006c, %r27
	.word 0x8d942029  ! 3584: WRPR_PSTATE_I	wrpr	%r16, 0x0029, %pstate
	.word 0xbfa81c20  ! 3586: FMOVRGEZ	dis not found

	.word 0xbaa42073  ! 3587: SUBcc_I	subcc 	%r16, 0x0073, %r29
	.word 0xbba88820  ! 3589: FMOVLE	fmovs	%fcc1, %f0, %f29
	setx	0x10109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 3591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0xbb3d2001  ! 3595: SRA_I	sra 	%r20, 0x0001, %r29
	.word 0xb8848000  ! 3596: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xb5518000  ! 3598: RDPR_PSTATE	<illegal instruction>
	.word 0xb1500000  ! 3600: RDPR_TPC	<illegal instruction>
	.word 0xb1abc820  ! 3601: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a44920  ! 3603: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb3a81820  ! 3605: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a00040  ! 3608: FMOVd	fmovd	%f0, %f24
	.word 0xb3a44940  ! 3609: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb1510000  ! 3615: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 3616: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda9c820  ! 3619: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 3622: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00520  ! 3624: FSQRTs	fsqrt	
	.word 0x859520d5  ! 3627: WRPR_TSTATE_I	wrpr	%r20, 0x00d5, %tstate
	setx	0x1033e, %g1, %o0
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
	.word 0xb77ce401  ! 3638: MOVR_I	movre	%r19, 0x1, %r27
	.word 0xb2bca067  ! 3640: XNORcc_I	xnorcc 	%r18, 0x0067, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 3648: RDPR_TL	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 3655: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3a00520  ! 3657: FSQRTs	fsqrt	
	.word 0xb8942013  ! 3658: ORcc_I	orcc 	%r16, 0x0013, %r28
	.word 0xb7a489c0  ! 3660: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbba81420  ! 3661: FMOVRNZ	dis not found

	.word 0xbda548a0  ! 3663: FSUBs	fsubs	%f21, %f0, %f30
	.word 0x9195613d  ! 3664: WRPR_PIL_I	wrpr	%r21, 0x013d, %pil
	.word 0xb3a508e0  ! 3666: FSUBq	dis not found

	.word 0xb9a00040  ! 3667: FMOVd	fmovd	%f0, %f28
	.word 0xb5aa8820  ! 3670: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0x8d95a06f  ! 3671: WRPR_PSTATE_I	wrpr	%r22, 0x006f, %pstate
	mov	0, %r12
	.word 0x8f932000  ! 3673: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a489e0  ! 3674: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb518000  ! 3680: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa449a0  ! 3690: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xbf50c000  ! 3692: RDPR_TT	<illegal instruction>
	.word 0xba14213f  ! 3693: OR_I	or 	%r16, 0x013f, %r29
	.word 0xbda00540  ! 3694: FSQRTd	fsqrt	
	.word 0xb1a80820  ! 3695: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb1abc820  ! 3696: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a4c940  ! 3706: FMULd	fmuld	%f50, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 3707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	.word 0xbba48940  ! 3709: FMULd	fmuld	%f18, %f0, %f60
	.word 0xbba4c920  ! 3712: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb0b54000  ! 3713: SUBCcc_R	orncc 	%r21, %r0, %r24
	setx	0x2c, %g1, %o0
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
	.word 0xbba588e0  ! 3716: FSUBq	dis not found

	.word 0xb7510000  ! 3719: RDPR_TICK	<illegal instruction>
	.word 0xb5a40840  ! 3721: FADDd	faddd	%f16, %f0, %f26
	setx	0x11c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 3725: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3a9c820  ! 3729: FMOVVS	fmovs	%fcc1, %f0, %f25
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859561af  ! 3735: WRPR_TSTATE_I	wrpr	%r21, 0x01af, %tstate
	.word 0xbba40860  ! 3736: FADDq	dis not found

	.word 0xb3540000  ! 3739: RDPR_GL	<illegal instruction>
	.word 0xb9a81820  ! 3740: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb684605f  ! 3741: ADDcc_I	addcc 	%r17, 0x005f, %r27
	.word 0xb3ab4820  ! 3744: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb08c4000  ! 3745: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xb5a44860  ! 3747: FADDq	dis not found

	.word 0x8994e18a  ! 3752: WRPR_TICK_I	wrpr	%r19, 0x018a, %tick
	.word 0xbd508000  ! 3754: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a44920  ! 3756: FMULs	fmuls	%f17, %f0, %f25
	setx	0x20324, %g1, %o0
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
	.word 0xbb520000  ! 3766: RDPR_PIL	<illegal instruction>
	.word 0xb550c000  ! 3767: RDPR_TT	<illegal instruction>
	setx	0x20026, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 3772: FMOVs	fmovs	%f0, %f28
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3778: FSQRTq	fsqrt	
	.word 0xb1aac820  ! 3779: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	data_start_5, %g1, %r19
	.word 0xbd518000  ! 3782: RDPR_PSTATE	<illegal instruction>
	.word 0xb8a50000  ! 3792: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xbbab0820  ! 3794: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbdab4820  ! 3797: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5aa8820  ! 3802: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c920  ! 3803: FMULs	fmuls	%f23, %f0, %f29
	.word 0xbfa81c20  ! 3805: FMOVRGEZ	dis not found

	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 3809: FMOVs	fmovs	%f0, %f31
	.word 0xb7a54960  ! 3811: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xb5480000  ! 3823: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_3, %g1, %r20
	.word 0x8d95e135  ! 3830: WRPR_PSTATE_I	wrpr	%r23, 0x0135, %pstate
	.word 0xb3abc820  ! 3832: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1480000  ! 3833: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbd540000  ! 3835: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e53  ! 3838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e53, %hpstate
	.word 0xb9a5c8a0  ! 3840: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xbfa81c20  ! 3842: FMOVRGEZ	dis not found

	.word 0x8395601d  ! 3843: WRPR_TNPC_I	wrpr	%r21, 0x001d, %tnpc
	.word 0x8794a0b0  ! 3844: WRPR_TT_I	wrpr	%r18, 0x00b0, %tt
	.word 0xb7aa8820  ! 3846: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00540  ! 3850: FSQRTd	fsqrt	
	.word 0xbd50c000  ! 3851: RDPR_TT	<illegal instruction>
	.word 0xb9ab4820  ! 3853: FMOVCC	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x8198289b  ! 3857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089b, %hpstate
	.word 0xb3a54940  ! 3859: FMULd	fmuld	%f52, %f0, %f56
	.word 0xbebc8000  ! 3861: XNORcc_R	xnorcc 	%r18, %r0, %r31
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 3867: RDPR_TT	<illegal instruction>
	.word 0xbda80820  ! 3868: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c940  ! 3869: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb3a489a0  ! 3870: FDIVs	fdivs	%f18, %f0, %f25
	mov	1, %r14
	.word 0xa193a000  ! 3873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85942091  ! 3874: WRPR_TSTATE_I	wrpr	%r16, 0x0091, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983a51  ! 3878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a51, %hpstate
	.word 0xbba81c20  ! 3887: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	.word 0xb73c4000  ! 3895: SRA_R	sra 	%r17, %r0, %r27
	setx	0x3031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3900: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbba5c840  ! 3902: FADDd	faddd	%f54, %f0, %f60
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 3908: RDPR_TNPC	<illegal instruction>
	.word 0xb5a508e0  ! 3910: FSUBq	dis not found

	.word 0xb9a00040  ! 3911: FMOVd	fmovd	%f0, %f28
	setx	0x20128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 3915: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0x8994e0c3  ! 3916: WRPR_TICK_I	wrpr	%r19, 0x00c3, %tick
	.word 0xb7a98820  ! 3918: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a4c8c0  ! 3922: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xbfa8c820  ! 3923: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab8820  ! 3925: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbda5c920  ! 3927: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb1a508c0  ! 3935: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb20561c3  ! 3936: ADD_I	add 	%r21, 0x01c3, %r25
	.word 0xb7a8c820  ! 3937: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa8820  ! 3938: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00540  ! 3942: FSQRTd	fsqrt	
	.word 0xbba548e0  ! 3947: FSUBq	dis not found

	.word 0xb7a58840  ! 3949: FADDd	faddd	%f22, %f0, %f58
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 3956: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba00540  ! 3958: FSQRTd	fsqrt	
	.word 0xba15a08d  ! 3960: OR_I	or 	%r22, 0x008d, %r29
	setx	0x333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 3966: RDPR_TNPC	<illegal instruction>
	.word 0xb9a588a0  ! 3970: FSUBs	fsubs	%f22, %f0, %f28
	.word 0x8194e02a  ! 3971: WRPR_TPC_I	wrpr	%r19, 0x002a, %tpc
	ta	T_CHANGE_HPRIV
	.word 0x8198295b  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	.word 0x8195205e  ! 3979: WRPR_TPC_I	wrpr	%r20, 0x005e, %tpc
	.word 0xb60d6118  ! 3981: AND_I	and 	%r21, 0x0118, %r27
	.word 0xbdaa8820  ! 3982: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbab561e5  ! 3985: SUBCcc_I	orncc 	%r21, 0x01e5, %r29
	.word 0xbfa80c20  ! 3986: FMOVRLZ	dis not found

	.word 0x9195600f  ! 3987: WRPR_PIL_I	wrpr	%r21, 0x000f, %pil
	.word 0x85946078  ! 3988: WRPR_TSTATE_I	wrpr	%r17, 0x0078, %tstate
	.word 0xb5a88820  ! 3989: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00560  ! 3991: FSQRTq	fsqrt	
	.word 0xb1a00020  ! 3993: FMOVs	fmovs	%f0, %f24
	.word 0xbb50c000  ! 3994: RDPR_TT	<illegal instruction>
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 3997: FMOVs	fmovs	%f0, %f27
	.word 0xb9a00540  ! 3999: FSQRTd	fsqrt	
	.word 0xb9643801  ! 4000: MOVcc_I	<illegal instruction>
	setx	data_start_6, %g1, %r19
	.word 0xb9a00040  ! 4002: FMOVd	fmovd	%f0, %f28
	.word 0xbda58860  ! 4003: FADDq	dis not found

	.word 0xbabc4000  ! 4004: XNORcc_R	xnorcc 	%r17, %r0, %r29
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194a0d0  ! 4013: WRPR_TPC_I	wrpr	%r18, 0x00d0, %tpc
	.word 0xb1aac820  ! 4018: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x83942081  ! 4019: WRPR_TNPC_I	wrpr	%r16, 0x0081, %tnpc
	.word 0xb3500000  ! 4020: RDPR_TPC	<illegal instruction>
	.word 0xbda48960  ! 4021: FMULq	dis not found

	.word 0xb3508000  ! 4023: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xb32d6001  ! 4031: SLL_I	sll 	%r21, 0x0001, %r25
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 4035: FMOVs	fmovs	%f0, %f25
	.word 0x8394e1a9  ! 4036: WRPR_TNPC_I	wrpr	%r19, 0x01a9, %tnpc
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 4038: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 4045: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbab8820  ! 4047: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a94820  ! 4051: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb734f001  ! 4054: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xb750c000  ! 4055: RDPR_TT	<illegal instruction>
	.word 0xb20461e4  ! 4056: ADD_I	add 	%r17, 0x01e4, %r25
	.word 0xb5510000  ! 4057: RDPR_TICK	<illegal instruction>
	.word 0xb635e027  ! 4058: ORN_I	orn 	%r23, 0x0027, %r27
	.word 0xbba81420  ! 4059: FMOVRNZ	dis not found

	.word 0xb1ab0820  ! 4063: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb2942172  ! 4065: ORcc_I	orcc 	%r16, 0x0172, %r25
	.word 0xbfa50820  ! 4068: FADDs	fadds	%f20, %f0, %f31
	.word 0xba35e0b4  ! 4069: SUBC_I	orn 	%r23, 0x00b4, %r29
	setx	data_start_6, %g1, %r16
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a40920  ! 4074: FMULs	fmuls	%f16, %f0, %f28
	setx	data_start_3, %g1, %r16
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 4088: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x85946082  ! 4089: WRPR_TSTATE_I	wrpr	%r17, 0x0082, %tstate
	.word 0xbf50c000  ! 4091: RDPR_TT	<illegal instruction>
	.word 0xb7a489a0  ! 4092: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb7a589e0  ! 4095: FDIVq	dis not found

	.word 0xb7a48960  ! 4097: FMULq	dis not found

	.word 0xb3a508e0  ! 4101: FSUBq	dis not found

	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd3d9000  ! 4106: SRAX_R	srax	%r22, %r0, %r30
	.word 0xbba90820  ! 4107: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0x85952148  ! 4108: WRPR_TSTATE_I	wrpr	%r20, 0x0148, %tstate
	.word 0x8395e09d  ! 4109: WRPR_TNPC_I	wrpr	%r23, 0x009d, %tnpc
	.word 0xb9500000  ! 4112: RDPR_TPC	<illegal instruction>
	.word 0xbda5c9a0  ! 4116: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb150c000  ! 4124: RDPR_TT	<illegal instruction>
	.word 0xb1a548a0  ! 4125: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb3518000  ! 4127: RDPR_PSTATE	<illegal instruction>
	.word 0x839520e6  ! 4128: WRPR_TNPC_I	wrpr	%r20, 0x00e6, %tnpc
	.word 0xb0c42036  ! 4130: ADDCcc_I	addccc 	%r16, 0x0036, %r24
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4135: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a8c820  ! 4136: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda448a0  ! 4139: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbfa81c20  ! 4140: FMOVRGEZ	dis not found

	.word 0xb7a80820  ! 4141: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80420  ! 4143: FMOVRZ	dis not found

	.word 0xb9500000  ! 4144: RDPR_TPC	<illegal instruction>
	setx	0x26, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda5c8e0  ! 4147: FSUBq	dis not found

	.word 0x8995a123  ! 4149: WRPR_TICK_I	wrpr	%r22, 0x0123, %tick
	.word 0xb3a90820  ! 4151: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbd480000  ! 4152: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9a00560  ! 4154: FSQRTq	fsqrt	
	setx	data_start_0, %g1, %r16
	.word 0xb9a00040  ! 4158: FMOVd	fmovd	%f0, %f28
	.word 0xbba98820  ! 4159: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a5c860  ! 4160: FADDq	dis not found

	.word 0xb434c000  ! 4161: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xbba00560  ! 4162: FSQRTq	fsqrt	
	.word 0xb7a54960  ! 4165: FMULq	dis not found

	.word 0xba8cc000  ! 4166: ANDcc_R	andcc 	%r19, %r0, %r29
	.word 0xb1a00020  ! 4168: FMOVs	fmovs	%f0, %f24
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9e0  ! 4172: FDIVq	dis not found

	.word 0xb9510000  ! 4174: RDPR_TICK	<illegal instruction>
	setx	0x20315, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4177: FMOVd	fmovd	%f0, %f24
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40dc000  ! 4186: AND_R	and 	%r23, %r0, %r26
	.word 0x8d95a1ff  ! 4190: WRPR_PSTATE_I	wrpr	%r22, 0x01ff, %pstate
	.word 0xb1ab4820  ! 4197: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1508000  ! 4198: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a449a0  ! 4202: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb1a00560  ! 4205: FSQRTq	fsqrt	
	.word 0xb9a50820  ! 4207: FADDs	fadds	%f20, %f0, %f28
	.word 0xb9a5c9a0  ! 4210: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb29ce0a9  ! 4215: XORcc_I	xorcc 	%r19, 0x00a9, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983b41  ! 4216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b41, %hpstate
	.word 0xbba00020  ! 4220: FMOVs	fmovs	%f0, %f29
	.word 0xb5500000  ! 4222: RDPR_TPC	<illegal instruction>
	.word 0xbfaa0820  ! 4224: FMOVA	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982f1b  ! 4225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1b, %hpstate
	.word 0xb3a88820  ! 4226: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	data_start_2, %g1, %r16
	.word 0xbda488c0  ! 4235: FSUBd	fsubd	%f18, %f0, %f30
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	.word 0xb9a4c840  ! 4240: FADDd	faddd	%f50, %f0, %f28
	.word 0xb7a9c820  ! 4242: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba84820  ! 4246: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00020  ! 4250: FMOVs	fmovs	%f0, %f24
	.word 0xb89c4000  ! 4252: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb7643801  ! 4253: MOVcc_I	<illegal instruction>
	.word 0x8994a16c  ! 4255: WRPR_TICK_I	wrpr	%r18, 0x016c, %tick
	.word 0xbda84820  ! 4257: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbb510000  ! 4258: RDPR_TICK	<illegal instruction>
	.word 0xb0144000  ! 4261: OR_R	or 	%r17, %r0, %r24
	setx	data_start_6, %g1, %r20
	.word 0xb5ab0820  ! 4264: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbda40820  ! 4271: FADDs	fadds	%f16, %f0, %f30
	.word 0xbda84820  ! 4276: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0x8594201e  ! 4277: WRPR_TSTATE_I	wrpr	%r16, 0x001e, %tstate
	.word 0xb9a81420  ! 4278: FMOVRNZ	dis not found

	.word 0xb3aac820  ! 4279: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00040  ! 4280: FMOVd	fmovd	%f0, %f60
	.word 0x8794a13c  ! 4281: WRPR_TT_I	wrpr	%r18, 0x013c, %tt
	.word 0xb151c000  ! 4282: RDPR_TL	<illegal instruction>
	.word 0xbda508a0  ! 4284: FSUBs	fsubs	%f20, %f0, %f30
	mov	2, %r12
	.word 0x8f932000  ! 4285: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3a88820  ! 4286: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb57c2401  ! 4288: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xbd7d6401  ! 4295: MOVR_I	movre	%r21, 0x1, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983fd9  ! 4296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd9, %hpstate
	.word 0xb1a80820  ! 4300: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbb35f001  ! 4301: SRLX_I	srlx	%r23, 0x0001, %r29
	mov	2, %r14
	.word 0xa193a000  ! 4302: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x32a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4305: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	0x1020c, %g1, %o0
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
	.word 0xb7a00560  ! 4316: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81983843  ! 4321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1843, %hpstate
	.word 0xb9510000  ! 4322: RDPR_TICK	<illegal instruction>
	.word 0xb9a80c20  ! 4323: FMOVRLZ	dis not found

	.word 0xb9a5c820  ! 4327: FADDs	fadds	%f23, %f0, %f28
	.word 0xbda90820  ! 4328: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbd510000  ! 4329: RDPR_TICK	<illegal instruction>
	.word 0xb5a509a0  ! 4331: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xbba449c0  ! 4332: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb951c000  ! 4337: RDPR_TL	<illegal instruction>
	.word 0xbba00520  ! 4340: FSQRTs	fsqrt	
	.word 0xb5a4c940  ! 4342: FMULd	fmuld	%f50, %f0, %f26
	.word 0xb5aa4820  ! 4344: FMOVNE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983ec3  ! 4346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec3, %hpstate
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995614f  ! 4352: WRPR_TICK_I	wrpr	%r21, 0x014f, %tick
	.word 0xbfa5c840  ! 4353: FADDd	faddd	%f54, %f0, %f62
	.word 0xb3510000  ! 4358: RDPR_TICK	<illegal instruction>
	.word 0xb8bd21ab  ! 4359: XNORcc_I	xnorcc 	%r20, 0x01ab, %r28
	.word 0xb9a54860  ! 4360: FADDq	dis not found

	.word 0xb1a54840  ! 4362: FADDd	faddd	%f52, %f0, %f24
	.word 0xb3a81420  ! 4364: FMOVRNZ	dis not found

	.word 0xba8460db  ! 4365: ADDcc_I	addcc 	%r17, 0x00db, %r29
	.word 0xb69d6039  ! 4367: XORcc_I	xorcc 	%r21, 0x0039, %r27
	.word 0x87946160  ! 4368: WRPR_TT_I	wrpr	%r17, 0x0160, %tt
	.word 0xbd520000  ! 4371: RDPR_PIL	<illegal instruction>
	.word 0x8d95a0b6  ! 4372: WRPR_PSTATE_I	wrpr	%r22, 0x00b6, %pstate
	.word 0xb7a84820  ! 4373: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a508c0  ! 4375: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb9ab4820  ! 4376: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb5510000  ! 4377: RDPR_TICK	<illegal instruction>
	.word 0xbfa5c960  ! 4381: FMULq	dis not found

	.word 0xb3a8c820  ! 4383: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 4385: FMOVN	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f932000  ! 4391: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfab8820  ! 4397: FMOVPOS	fmovs	%fcc1, %f0, %f31
	setx	data_start_1, %g1, %r23
	setx	0x10118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195e017  ! 4400: WRPR_PIL_I	wrpr	%r23, 0x0017, %pil
	.word 0x919460d6  ! 4402: WRPR_PIL_I	wrpr	%r17, 0x00d6, %pil
	.word 0xb3aa4820  ! 4403: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbb345000  ! 4405: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb1a80820  ! 4407: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbba94820  ! 4408: FMOVCS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982883  ! 4409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81983883  ! 4413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1883, %hpstate
	.word 0xbba00040  ! 4416: FMOVd	fmovd	%f0, %f60
	.word 0xb951c000  ! 4418: RDPR_TL	<illegal instruction>
	.word 0x839520d7  ! 4419: WRPR_TNPC_I	wrpr	%r20, 0x00d7, %tnpc
	.word 0xbf540000  ! 4421: RDPR_GL	<illegal instruction>
	.word 0xb28421a7  ! 4424: ADDcc_I	addcc 	%r16, 0x01a7, %r25
	.word 0xbba5c9c0  ! 4425: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb5ab0820  ! 4428: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0x87946121  ! 4435: WRPR_TT_I	wrpr	%r17, 0x0121, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983fc1  ! 4439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc1, %hpstate
	.word 0xb9540000  ! 4441: RDPR_GL	<illegal instruction>
	.word 0xb751c000  ! 4446: RDPR_TL	<illegal instruction>
	.word 0x8d94a1b5  ! 4449: WRPR_PSTATE_I	wrpr	%r18, 0x01b5, %pstate
	.word 0xb9a94820  ! 4450: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a5c8e0  ! 4451: FSUBq	dis not found

	setx	data_start_1, %g1, %r16
	.word 0xb7355000  ! 4453: SRLX_R	srlx	%r21, %r0, %r27
	mov	2, %r12
	.word 0x8f932000  ! 4454: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba48920  ! 4455: FMULs	fmuls	%f18, %f0, %f29
	setx	data_start_0, %g1, %r23
	.word 0xb1a00520  ! 4457: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	.word 0x81982fd9  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xbda8c820  ! 4460: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb150c000  ! 4469: RDPR_TT	<illegal instruction>
	.word 0x89942040  ! 4471: WRPR_TICK_I	wrpr	%r16, 0x0040, %tick
	.word 0xb5a81c20  ! 4475: FMOVRGEZ	dis not found

	.word 0xb550c000  ! 4476: RDPR_TT	<illegal instruction>
	.word 0xb5abc820  ! 4478: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x8594209c  ! 4479: WRPR_TSTATE_I	wrpr	%r16, 0x009c, %tstate
	.word 0xbfa80820  ! 4488: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa0820  ! 4491: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb3a589a0  ! 4495: FDIVs	fdivs	%f22, %f0, %f25
	mov	0, %r14
	.word 0xa193a000  ! 4501: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda81c20  ! 4502: FMOVRGEZ	dis not found

	setx	data_start_5, %g1, %r16
	.word 0xb1508000  ! 4507: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r23
	.word 0xbf508000  ! 4520: RDPR_TSTATE	<illegal instruction>
	.word 0xbd540000  ! 4521: RDPR_GL	<illegal instruction>
	.word 0xbf50c000  ! 4522: RDPR_TT	<illegal instruction>
	.word 0xb9aa8820  ! 4523: FMOVG	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r19
	.word 0xbba548a0  ! 4526: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb885e10a  ! 4527: ADDcc_I	addcc 	%r23, 0x010a, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x839461d1  ! 4534: WRPR_TNPC_I	wrpr	%r17, 0x01d1, %tnpc
	.word 0xb1480000  ! 4536: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbfa00540  ! 4538: FSQRTd	fsqrt	
	.word 0xbfa448a0  ! 4543: FSUBs	fsubs	%f17, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81982d4b  ! 4545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4b, %hpstate
	.word 0xbb50c000  ! 4546: RDPR_TT	<illegal instruction>
	.word 0xb1abc820  ! 4548: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a94820  ! 4551: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbdab0820  ! 4553: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80c20  ! 4555: FMOVRLZ	dis not found

	.word 0x8795a188  ! 4558: WRPR_TT_I	wrpr	%r22, 0x0188, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982b43  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 4568: FMOVRZ	dis not found

	.word 0xba158000  ! 4569: OR_R	or 	%r22, %r0, %r29
	.word 0xbda50960  ! 4570: FMULq	dis not found

	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe450000  ! 4572: ADDC_R	addc 	%r20, %r0, %r31
	setx	data_start_4, %g1, %r18
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	.word 0x81982c59  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	.word 0xbda4c9a0  ! 4579: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbfa00520  ! 4583: FSQRTs	fsqrt	
	.word 0xb9540000  ! 4584: RDPR_GL	<illegal instruction>
	.word 0xbba00520  ! 4585: FSQRTs	fsqrt	
	.word 0xb9500000  ! 4590: RDPR_TPC	<illegal instruction>
	.word 0xb3a84820  ! 4591: FMOVE	fmovs	%fcc1, %f0, %f25
	setx	0x30324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a589e0  ! 4593: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda5c920  ! 4600: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb88d2040  ! 4601: ANDcc_I	andcc 	%r20, 0x0040, %r28
	.word 0xb3a00540  ! 4605: FSQRTd	fsqrt	
	.word 0xb1a80420  ! 4607: FMOVRZ	dis not found

	.word 0xb5a90820  ! 4610: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbd50c000  ! 4618: RDPR_TT	<illegal instruction>
	.word 0xbda00020  ! 4619: FMOVs	fmovs	%f0, %f30
	.word 0xbba00540  ! 4620: FSQRTd	fsqrt	
	.word 0xb7500000  ! 4625: RDPR_TPC	<illegal instruction>
	.word 0xbfaa8820  ! 4626: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbda80820  ! 4629: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbda549a0  ! 4630: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb7a509e0  ! 4633: FDIVq	dis not found

	.word 0xb1a589a0  ! 4635: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xb7a5c820  ! 4639: FADDs	fadds	%f23, %f0, %f27
	.word 0xb9480000  ! 4640: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	data_start_4, %g1, %r22
	.word 0xb1a548a0  ! 4644: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbda408c0  ! 4648: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb7a588a0  ! 4652: FSUBs	fsubs	%f22, %f0, %f27
	.word 0x9195e0e8  ! 4653: WRPR_PIL_I	wrpr	%r23, 0x00e8, %pil
	.word 0xb43520e8  ! 4662: ORN_I	orn 	%r20, 0x00e8, %r26
	.word 0xbcb4a01c  ! 4669: ORNcc_I	orncc 	%r18, 0x001c, %r30
	.word 0xb32d4000  ! 4671: SLL_R	sll 	%r21, %r0, %r25
	.word 0xb7a00540  ! 4673: FSQRTd	fsqrt	
	.word 0xbf508000  ! 4674: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 4676: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983c99  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c99, %hpstate
	.word 0xb7a589e0  ! 4679: FDIVq	dis not found

	.word 0xb551c000  ! 4684: RDPR_TL	<illegal instruction>
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 4688: FMOVRNZ	dis not found

	mov	1, %r12
	.word 0x8f932000  ! 4690: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa80c20  ! 4691: FMOVRLZ	dis not found

	setx	data_start_4, %g1, %r21
	mov	2, %r12
	.word 0x8f932000  ! 4694: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb480000  ! 4698: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a096  ! 4705: WRPR_TNPC_I	wrpr	%r18, 0x0096, %tnpc
	.word 0xb7ab0820  ! 4706: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb93d9000  ! 4708: SRAX_R	srax	%r22, %r0, %r28
	.word 0xb1a48940  ! 4709: FMULd	fmuld	%f18, %f0, %f24
	.word 0xb9aa0820  ! 4714: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80c20  ! 4719: FMOVRLZ	dis not found

	.word 0xb9a8c820  ! 4723: FMOVL	fmovs	%fcc1, %f0, %f28
	mov	0, %r14
	.word 0xa193a000  ! 4724: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	mov	0, %r12
	.word 0x8f932000  ! 4726: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994e00b  ! 4730: WRPR_TICK_I	wrpr	%r19, 0x000b, %tick
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa48840  ! 4736: FADDd	faddd	%f18, %f0, %f62
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4738: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb93d7001  ! 4739: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xb5a00040  ! 4740: FMOVd	fmovd	%f0, %f26
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a548c0  ! 4745: FSUBd	fsubd	%f52, %f0, %f28
	.word 0x839561ba  ! 4746: WRPR_TNPC_I	wrpr	%r21, 0x01ba, %tnpc
	.word 0x83956161  ! 4749: WRPR_TNPC_I	wrpr	%r21, 0x0161, %tnpc
	.word 0xb7a80c20  ! 4756: FMOVRLZ	dis not found

	setx	0x1032a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb404a034  ! 4763: ADD_I	add 	%r18, 0x0034, %r26
	.word 0xbba84820  ! 4767: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0x819520d2  ! 4768: WRPR_TPC_I	wrpr	%r20, 0x00d2, %tpc
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb035a0fd  ! 4772: ORN_I	orn 	%r22, 0x00fd, %r24
	.word 0xb1a81820  ! 4776: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb1a409c0  ! 4780: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xbba488c0  ! 4790: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbda4c9e0  ! 4794: FDIVq	dis not found

	.word 0xb7508000  ! 4795: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 4803: FMOVRZ	dis not found

	.word 0xb5a509e0  ! 4808: FDIVq	dis not found

	.word 0xb9508000  ! 4811: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00040  ! 4812: FMOVd	fmovd	%f0, %f30
	.word 0xbe2521dc  ! 4816: SUB_I	sub 	%r20, 0x01dc, %r31
	.word 0xb5a5c8a0  ! 4817: FSUBs	fsubs	%f23, %f0, %f26
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 4821: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919561b8  ! 4827: WRPR_PIL_I	wrpr	%r21, 0x01b8, %pil
	.word 0xb5518000  ! 4831: RDPR_PSTATE	<illegal instruction>
	.word 0xb5ab0820  ! 4832: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a4c8e0  ! 4833: FSUBq	dis not found

	.word 0xb5643801  ! 4835: MOVcc_I	<illegal instruction>
	.word 0x859421c6  ! 4836: WRPR_TSTATE_I	wrpr	%r16, 0x01c6, %tstate
	.word 0xbfab4820  ! 4837: FMOVCC	fmovs	%fcc1, %f0, %f31
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 4840: FSQRTq	fsqrt	
	setx	data_start_1, %g1, %r21
	.word 0xb1aa4820  ! 4843: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9510000  ! 4844: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xbfab0820  ! 4850: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9aac820  ! 4851: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9aa8820  ! 4852: FMOVG	fmovs	%fcc1, %f0, %f28
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a139  ! 4854: WRPR_TNPC_I	wrpr	%r22, 0x0139, %tnpc
	.word 0x8395e052  ! 4857: WRPR_TNPC_I	wrpr	%r23, 0x0052, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795a1be  ! 4860: WRPR_TT_I	wrpr	%r22, 0x01be, %tt
	.word 0xb1a98820  ! 4861: FMOVNEG	fmovs	%fcc1, %f0, %f24
	setx	0x1030a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48920  ! 4865: FMULs	fmuls	%f18, %f0, %f28
	mov	1, %r12
	.word 0x8f932000  ! 4866: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 4868: FDIVq	dis not found

	.word 0xb1aa4820  ! 4873: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	data_start_6, %g1, %r20
	.word 0xb3a84820  ! 4882: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbb480000  ! 4884: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	.word 0x8198391b  ! 4885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191b, %hpstate
	.word 0xb9a4c9c0  ! 4890: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x819560e7  ! 4891: WRPR_TPC_I	wrpr	%r21, 0x00e7, %tpc
	.word 0xbc0c0000  ! 4893: AND_R	and 	%r16, %r0, %r30
	.word 0xb93d5000  ! 4896: SRAX_R	srax	%r21, %r0, %r28
	.word 0xb405e1e5  ! 4897: ADD_I	add 	%r23, 0x01e5, %r26
	.word 0x8d94e01d  ! 4899: WRPR_PSTATE_I	wrpr	%r19, 0x001d, %pstate
	.word 0xb9a448e0  ! 4900: FSUBq	dis not found

	.word 0xb1a50860  ! 4906: FADDq	dis not found

	.word 0xb7a84820  ! 4911: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb950c000  ! 4912: RDPR_TT	<illegal instruction>
	.word 0xb3a90820  ! 4914: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0x20308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 4916: FMOVGU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 4917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0xbfa509a0  ! 4918: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb7a4c8c0  ! 4921: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb1aac820  ! 4924: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0x8994e128  ! 4925: WRPR_TICK_I	wrpr	%r19, 0x0128, %tick
	.word 0xbba8c820  ! 4929: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1500000  ! 4930: RDPR_TPC	<illegal instruction>
	.word 0xb3aa4820  ! 4931: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa588e0  ! 4936: FSUBq	dis not found

	.word 0xbfa80820  ! 4942: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0x8995a102  ! 4944: WRPR_TICK_I	wrpr	%r22, 0x0102, %tick
	.word 0xbba98820  ! 4945: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb97d2401  ! 4956: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb1a4c840  ! 4957: FADDd	faddd	%f50, %f0, %f24
	.word 0xb3a90820  ! 4958: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a40820  ! 4961: FADDs	fadds	%f16, %f0, %f25
	.word 0xbf510000  ! 4962: RDPR_TICK	<illegal instruction>
	setx	0x10001, %g1, %o0
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
	.word 0x839560af  ! 4966: WRPR_TNPC_I	wrpr	%r21, 0x00af, %tnpc
	.word 0xb9a00540  ! 4969: FSQRTd	fsqrt	
	.word 0xb351c000  ! 4970: RDPR_TL	<illegal instruction>
	.word 0xb7a00520  ! 4973: FSQRTs	fsqrt	
	.word 0xb1518000  ! 4977: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a8c820  ! 4978: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00560  ! 4981: FSQRTq	fsqrt	
	.word 0xbba81420  ! 4986: FMOVRNZ	dis not found

	.word 0xbbaa8820  ! 4988: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x83942126  ! 4991: WRPR_TNPC_I	wrpr	%r16, 0x0126, %tnpc
	.word 0xb9504000  ! 4993: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00020  ! 4995: FMOVs	fmovs	%f0, %f31
	.word 0xb3a94820  ! 4997: FMOVCS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV

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

	.xword	0x5d793f9ec9cbc546
	.xword	0xda0e6b15d15b65f5
	.xword	0xb4773a5581e880ac
	.xword	0x1c1c5f5383ef8397
	.xword	0xe7a6834d55e5ab13
	.xword	0x07c9c4e2c2926c37
	.xword	0xb0ae519dc995a5a0
	.xword	0x87b993668715c7b1
	.xword	0xdc76533911b6a1c4
	.xword	0x300cc943c3ea87b3
	.xword	0x61f0569cd661c22f
	.xword	0x0b22d658f1306fb3
	.xword	0x0b47cdeb27910ffd
	.xword	0xb9335f9aef7bed3f
	.xword	0x0bee8a246f1dc16b
	.xword	0x11464c30394a31ea
	.xword	0xfc77200fbc649a76
	.xword	0x3b1abda02bb3d2ca
	.xword	0x3967bf129871cb41
	.xword	0x720897f80f35ac58
	.xword	0xf42c033d016a7f3c
	.xword	0x197818d1d4be580e
	.xword	0x10ae96cc1506ea84
	.xword	0x0f491b57e50e96e7
	.xword	0x814c722c3ab14446
	.xword	0x8629dbc89906ca98
	.xword	0x9aeae93d5a89de79
	.xword	0xb6722927d94a53fe
	.xword	0xf0f83cd3d8622c53
	.xword	0xc42c3f90f6debe65
	.xword	0x3ecf25b554957933
	.xword	0xde398d5e7a7179f1
	.xword	0x0724338b96d48cab
	.xword	0xcecf50b1a3c80db7
	.xword	0xd76d36f4479a7658
	.xword	0xc09952169db9d5c5
	.xword	0x2db416cb88512c60
	.xword	0x2729dac453df17c7
	.xword	0x723c6485ea141d0f
	.xword	0x5d7bea2e304013a0
	.xword	0x407c9eb85b7bab13
	.xword	0xc44abbf9caa2bba6
	.xword	0xf971e14abb6d5961
	.xword	0x960403eb65fe4e2b
	.xword	0x7311d0fa0b702802
	.xword	0x9234b691188bb1b5
	.xword	0xc97ebb12ecb0085f
	.xword	0xa075eadea5ea6d81
	.xword	0x15b66e74c777a35e
	.xword	0x43268dd458b45887
	.xword	0x17f8485ec19427b2
	.xword	0xb0172700cc50db2b
	.xword	0x84b988fd83c552bb
	.xword	0xf5b4f034adf4ff26
	.xword	0x726f55852d4e320b
	.xword	0xb3959c4d6d7c414f
	.xword	0xb6db1a51d136c60f
	.xword	0x1e3f5a5afb1f060f
	.xword	0x31e871a10eb616ef
	.xword	0x53759ac2e1991657
	.xword	0xcca9ecd26659fbbe
	.xword	0x7fd77e1f93dd6fbb
	.xword	0xc3a40786fb83e136
	.xword	0x5a4347ca64d2a4b0
	.xword	0x96ff5023197ac7e7
	.xword	0x3cbaaa1643842daa
	.xword	0x85e83238d6b5af6b
	.xword	0x419d29e64c7ea9d0
	.xword	0x70f31435a7eadafd
	.xword	0x818c4d7ed2b47fcc
	.xword	0x098db6d815a69ada
	.xword	0xe3267664d3a3411b
	.xword	0x06220bc0cef001fd
	.xword	0xa6d266f7cc7a6539
	.xword	0xc4294890db57ed55
	.xword	0x8d77dca6aa0edadf
	.xword	0x86229a6bab84f60f
	.xword	0x58d5879ff1200ec6
	.xword	0xc589739260ab9ea0
	.xword	0x640955c0882d4b07
	.xword	0xb7630fe45073c1ff
	.xword	0xe28af236a6d7ad19
	.xword	0xfb0978467027f4f6
	.xword	0x7597a9750e0aad0b
	.xword	0xc1d438e35302bd20
	.xword	0x71c717f2666265e3
	.xword	0x8aaba7cb9cf3b537
	.xword	0x4881440c3fc8fad1
	.xword	0x21659cb797bca964
	.xword	0xe360d177b1c915af
	.xword	0x2459de3e42190b9b
	.xword	0x1296cfe0a08e1c48
	.xword	0x0564bcecc89588ce
	.xword	0x227b00f69285a669
	.xword	0x98ac9464a6253ca8
	.xword	0x4170053ee03c63f1
	.xword	0x2319b7a8514c783a
	.xword	0xea93563911268a84
	.xword	0x05b23878bb200eb5
	.xword	0x02d07b3830ec6119
	.xword	0xf20529b4a81127f1
	.xword	0x0865c34500fde2c9
	.xword	0xdadb387968aad2ed
	.xword	0x1c0c913f6a4020de
	.xword	0xd6bba050701af75e
	.xword	0x3cfb3ec7522f71e7
	.xword	0xf800861d35bd637a
	.xword	0xc68aed0cbfe8c94f
	.xword	0x3b83c83ce4de2835
	.xword	0x12826c2e6cd7efbe
	.xword	0xc02e4d47255d7755
	.xword	0x0b0986cc04d1550f
	.xword	0x358953cf3e1a1976
	.xword	0x6c7c4d2caa96dfc0
	.xword	0x978c527fb47f85a2
	.xword	0x1be10fad0c2c88ed
	.xword	0x5625716322a25e8c
	.xword	0x6fa8670176d4cfe1
	.xword	0xb55f82b369f2c121
	.xword	0xaec2b69d7eac56df
	.xword	0xe06579a448cdf68b
	.xword	0xe59c98c002ae96f8
	.xword	0x8383e34eb7af32ed
	.xword	0xea0430fb1919394a
	.xword	0x394b1b8e271298e6
	.xword	0xdd0dd38702ef31ba
	.xword	0x1c317f1d048c45b4
	.xword	0x3974861072543cb7
	.xword	0xd6a3b3cb62a7b51d
	.xword	0x684625de5c0b6a2d
	.xword	0x346bd326e5a47a0e
	.xword	0x3f75daa66e7e3979
	.xword	0x72174d8f334339fc
	.xword	0x86f11fe694228557
	.xword	0x35bca54220a048e4
	.xword	0xf912ed6bfbb123f1
	.xword	0xd512098d619c20e6
	.xword	0x824cd811e1338295
	.xword	0x72ef2b099f2296da
	.xword	0xa7cb5a9f62611a63
	.xword	0xb287e8dabb1a31bc
	.xword	0xbcc26e78f5a8b512
	.xword	0xb34de134a2681331
	.xword	0x3af3e31b2213aa41
	.xword	0x2897860c6dce0493
	.xword	0xc68b22b406a3e451
	.xword	0x6cf35e840b8623fa
	.xword	0x63f2a0607804bc7d
	.xword	0x854155ef612691c7
	.xword	0x0da66f3ab8d0f2aa
	.xword	0xb467e459db6f83bc
	.xword	0x5ae8e95900b5ca86
	.xword	0x1440663e891ab0b9
	.xword	0xe822ce790bae768d
	.xword	0xdae647715f69b4c2
	.xword	0x47ffe211bcc56809
	.xword	0x45c5040a6ed9d5c9
	.xword	0x80c3cf1e0876a01c
	.xword	0x565b7364f99567f1
	.xword	0xd1c4cf032076e0c2
	.xword	0x03649709d09e2681
	.xword	0x44900c41cc70aae7
	.xword	0x789ea425edc7315d
	.xword	0x4438e82019f4afa2
	.xword	0x988f02c609ae1e54
	.xword	0x9abef0a6678d412f
	.xword	0x81bdb0f6a2ecd112
	.xword	0xa150a2312bf979de
	.xword	0x0adbce11782bf55a
	.xword	0xcb7a7ab65b9cf7f1
	.xword	0xd3eaa5bb9904682f
	.xword	0x309227b6816393db
	.xword	0x5149c7d14fb12662
	.xword	0x42628c6962018b70
	.xword	0xc6bb210026535128
	.xword	0x97c6398d3c695dde
	.xword	0x3e261012227a6b4e
	.xword	0x5a77061a463d02d2
	.xword	0xdd33191615d3a4f4
	.xword	0x0597c61f02343804
	.xword	0xb8564a97ee5e2ce9
	.xword	0xc4299298a151c5a4
	.xword	0x8a7de54fd3bd1c86
	.xword	0xe3d9f46c2a66e2b0
	.xword	0x6a1e05b20e124c5a
	.xword	0x9b744be839162195
	.xword	0xd5cf41aea153bf69
	.xword	0x2cc28c2700b35894
	.xword	0xef014215a78dfd38
	.xword	0x118fa1930de693ce
	.xword	0xa732ec465a99749b
	.xword	0xc5021929e6d342b2
	.xword	0xa43813c4c756d74f
	.xword	0xc57466dbc0be2dbb
	.xword	0x5dc7bd36afe919d7
	.xword	0xf6a737e64bc7b27d
	.xword	0x9f9e42fbad0bd2bd
	.xword	0x77845fbf7c239967
	.xword	0x49ebc43ef5cbad8a
	.xword	0xb09f14f11b391ca0
	.xword	0x5aa9df76c785f9eb
	.xword	0xc462b791fa12808c
	.xword	0x946e893deea95050
	.xword	0xf09a18e36756b1a3
	.xword	0x0c7e44c950ed0bee
	.xword	0x838e14bc92e75ecf
	.xword	0xcec80fe69cd71bd3
	.xword	0x45fd26ef2547d59f
	.xword	0x2896f69c0b449d96
	.xword	0xce72003d0945930e
	.xword	0x64ef5e9f4d5f56de
	.xword	0x4c87f899f2b040be
	.xword	0x147e5dd6bf1d51d9
	.xword	0x1d2729e92378e34d
	.xword	0x50182e50fd2c5db8
	.xword	0x2d544e2104b6d31e
	.xword	0xf8b7e37d978a4175
	.xword	0xd8076308c3fecd79
	.xword	0xc088c34b24d09ea8
	.xword	0x91241806f05fae72
	.xword	0x77ea13fb60fb6acf
	.xword	0xd20520e0f6199890
	.xword	0x6a34d18d1988e5ec
	.xword	0x45150510d59c5502
	.xword	0x550087df264a22af
	.xword	0xf4e6c4bafbe8d79c
	.xword	0xfe92bafc3f19f1e7
	.xword	0x08ba8b486fc7a8a0
	.xword	0x3ea18be6dd19334f
	.xword	0x06110c79e5b6204f
	.xword	0xc796f6d50eff64cd
	.xword	0x137023bc03ab19fa
	.xword	0x63a21e43466ea2ef
	.xword	0xe10781b541abe20e
	.xword	0xf2a2f1489c1db98e
	.xword	0xb669ab70dda21f7c
	.xword	0x9a0659193175b9d3
	.xword	0x04af09a2de53da79
	.xword	0x25f3fd2836dc6f26
	.xword	0x212d1005f0ee5103
	.xword	0x45272ec37bff51af
	.xword	0x2fc91291f9068a81
	.xword	0x510d04d76ede198a
	.xword	0x0f9dae85bca90ee4
	.xword	0x2f21354b0551ce24
	.xword	0x1ead6ebc1850cd6c
	.xword	0xea84d79ea4c76ac9
	.xword	0xc0f187c380914899
	.xword	0x1361fb02965b7d69
	.xword	0x869c5bee67ffc973
	.xword	0x0ff9830b5e2b546c
	.xword	0xbac4db759a694319
	.xword	0xdf642dd69e4ed237
	.xword	0x8a4dacfd14785232
	.xword	0x7bab9ed131a830b3
	.xword	0xc358b432004ba348
	.align 0x2000
	.data
data_start_1:

	.xword	0x48ae69a93c1d1e2f
	.xword	0x988958302f56ef55
	.xword	0x1876f2cafd22c64b
	.xword	0x164965ca36c58dcd
	.xword	0xa2ed3025df68ee8d
	.xword	0xa6bbbce14c4d9fac
	.xword	0x7dfd32993473fd95
	.xword	0x4de6255d6ced9831
	.xword	0x6d0a3d35f9dbf137
	.xword	0x26f2b7018fc0627b
	.xword	0x9d0d8e90fa450a78
	.xword	0xc018b6d2cb632215
	.xword	0x33688c4cdaf35cfb
	.xword	0x1a50c3706480f18e
	.xword	0x5266c76803d3314b
	.xword	0xca0f32a81f0ef3d9
	.xword	0xbec3ebff74b200c2
	.xword	0x5c032b682a1525dd
	.xword	0x0b0e5ec4f2bca0ba
	.xword	0xce53208d569b9021
	.xword	0x8a989ec2622009f8
	.xword	0xf95d02f45ca698bb
	.xword	0x093ea5cf9d8c409c
	.xword	0x25119f453f017cf4
	.xword	0x0b027eecfa4a1094
	.xword	0xa9df711255cacbba
	.xword	0x1de05d52fdb20cd8
	.xword	0x8a9e40645e9e3e29
	.xword	0x779a92c0617e498e
	.xword	0xc1362534f81a6ee9
	.xword	0x6cb2cde3764e8ce4
	.xword	0xa0d6bdd77c4cf96b
	.xword	0x454f2dfc9ed3aa41
	.xword	0xd3fa072e1ddbddd3
	.xword	0x59430601b8c66d54
	.xword	0x57db9420ea2029ae
	.xword	0xd1ba2cb1f1c204d0
	.xword	0x5098b77bc02e7715
	.xword	0xb5778dabe6aa3ea0
	.xword	0x780e97943a84b548
	.xword	0x35abd50884279b3a
	.xword	0xbbcaea9cdef478c1
	.xword	0x5bfd27855d16c9da
	.xword	0xd5ec166d54a522a7
	.xword	0xef1a78cf98c1887e
	.xword	0x42bbf74f04f4c5bb
	.xword	0x4d96cec3e642d291
	.xword	0xf58363dc9e9c7c5d
	.xword	0x4c3881a728812528
	.xword	0xaf863e592cd16e6f
	.xword	0xa6bd1bb31cbe0c52
	.xword	0xab79b60c3d0e59b5
	.xword	0x29f6490f77b40f82
	.xword	0xa4de38e2604f42d9
	.xword	0x5be50c93267d1aa7
	.xword	0xeb8541bfb9b576d5
	.xword	0x2610831e06332b88
	.xword	0xb37e97fcf6e5d5c4
	.xword	0x1a766ea60948f0e0
	.xword	0xd4fdce5775dba06a
	.xword	0x683e988dda8c022e
	.xword	0x90158ea79e43570f
	.xword	0x8a121320f01a20e7
	.xword	0xf14720132d5853ba
	.xword	0x256a13b42b2dd556
	.xword	0xf87d8ec8411c8dba
	.xword	0x5dedab880a460dbe
	.xword	0xc9e6db935f21dbd3
	.xword	0xd144b8f96fb22b39
	.xword	0x0e091b32b6e322fb
	.xword	0x1b43fc791382739f
	.xword	0x0d73ecc943f6278e
	.xword	0x0414b9d1f2f81cb4
	.xword	0x5d37e0a0b07e7919
	.xword	0x3dace9203409600c
	.xword	0x23a8048aa416b037
	.xword	0xa0ed576c4d8ab671
	.xword	0x62716c33721a6ce5
	.xword	0x7e84cbadd3856bca
	.xword	0xf994b4b6f2060bb1
	.xword	0x2b4917c8ecc5d3d4
	.xword	0x4b699b904e724242
	.xword	0x5616db6bc8bc2bb9
	.xword	0x6a50351c615902bb
	.xword	0x69bb4e62b3130943
	.xword	0x5efbe7f1ad02650c
	.xword	0x3e116f6522335f6e
	.xword	0xbb323eb4aa362116
	.xword	0x78d64a97e476eefe
	.xword	0x7becdfba4f66cb75
	.xword	0xd61b8b37b7a5c2e0
	.xword	0xb7854e6abba1e432
	.xword	0x1c669339efedd5f3
	.xword	0x8a11d2537de5a17d
	.xword	0xc15653af2a872061
	.xword	0x40be97d4edc3d571
	.xword	0xa3f752c6676a5503
	.xword	0xe54755bd36cfe1ad
	.xword	0xb3908682fc536d7f
	.xword	0x415fe8cdd040dc08
	.xword	0x0050c2573c4e305c
	.xword	0x069c9f08b1633cba
	.xword	0xb1444c298c28a01d
	.xword	0x61713881135516ec
	.xword	0x033f55d667aecf00
	.xword	0xb1726115dc8c3231
	.xword	0x5f177627afc1d1a5
	.xword	0xcb3728080737c58d
	.xword	0xe27775e936c7b647
	.xword	0xa61155fc73122c8f
	.xword	0x81ef26bb2fb5815b
	.xword	0xff25ebd43c754eb7
	.xword	0xdcbf1753725d5ffa
	.xword	0x6c36a7525ea8fcf4
	.xword	0x3f948f354c6c5b35
	.xword	0x06e62fd615110b9f
	.xword	0x2b70453e3992a409
	.xword	0x0b840be135567925
	.xword	0xf67142ca8e16e660
	.xword	0xb8b3ff476b81709c
	.xword	0xc00dc37deab33d39
	.xword	0x53e123dd0ab4428d
	.xword	0x79c9d559d726de3b
	.xword	0x9c7f431c58792240
	.xword	0x2b2e03544f303fde
	.xword	0x6676229e28857e73
	.xword	0x1f809879e611329f
	.xword	0x90a9c1f90a534157
	.xword	0x10519d590f400b41
	.xword	0x9e2d382d4a670178
	.xword	0xa54500d90f7dd25e
	.xword	0x21b331566f2138e7
	.xword	0x7b118bf00cd8ede2
	.xword	0xa3fd44e604c303f0
	.xword	0xa368b088d542d4c7
	.xword	0x73093f0e2876af44
	.xword	0x2dbb2bf9c5b34388
	.xword	0x3e96ab39ae39187e
	.xword	0xdc7732f6b4481a1f
	.xword	0x2aa3e32848120bd8
	.xword	0x4936baaeb8a5f641
	.xword	0x818408c323a35052
	.xword	0x02d140d22f9c3007
	.xword	0x26b8ec4a10c03561
	.xword	0x0d2facc62e43686a
	.xword	0x1bf56e5f0148227b
	.xword	0x3fef5ddebd0d558c
	.xword	0x96abdf7d42f176e0
	.xword	0xb26bc26d01321a2a
	.xword	0xc8a2bef0a491b920
	.xword	0x7d6a625e618d479b
	.xword	0x0ba22a08f549bddc
	.xword	0xe932e74dfd2fedda
	.xword	0x9ff1906f18227167
	.xword	0xb125ce537f630637
	.xword	0x7b157cbb6c4a3f2b
	.xword	0xa5572718a15bb06d
	.xword	0x526794c633fd337c
	.xword	0x1a673ab48423b000
	.xword	0xd1d90dffb503946f
	.xword	0x9a88d5212ca4bec2
	.xword	0x2a864da9edb87ddd
	.xword	0x6477616458288876
	.xword	0x2a6d3d40ed769de6
	.xword	0xa180c4d09c9bfaee
	.xword	0x2a271e297547647c
	.xword	0x932306f090573bfa
	.xword	0x059297d8d82d2901
	.xword	0x6c7745fdd4304a94
	.xword	0x118023bca1719f93
	.xword	0x2d0e50b1f6c887b0
	.xword	0x244b12d4df4fd360
	.xword	0x5f0a811164b02d7c
	.xword	0xa21839a37685257e
	.xword	0x798c8f0bd970fa02
	.xword	0x5e6ec717ccce88ff
	.xword	0xd97dc28b6a3a5efd
	.xword	0x97dcd07f0eb9c1be
	.xword	0x237091007242c892
	.xword	0xb09060d7b1957146
	.xword	0xa5c6dc36b9d8c43c
	.xword	0x5c0e0dd31e4c83c2
	.xword	0xd51b82893e04781d
	.xword	0x449edc8ac0a97551
	.xword	0xa8c4c9a3c67dc3d2
	.xword	0x8d0383fab3b2f914
	.xword	0x9d095b2b950edfc7
	.xword	0x63c1df3c9bc2726b
	.xword	0x7b9fb5f7348b5fd7
	.xword	0xfd01bdb44f037fc8
	.xword	0xba9e40fe9f18c7cb
	.xword	0xfe4ab58abd4754c1
	.xword	0xc7ac901230d89f84
	.xword	0xa5bbb23fe409f22a
	.xword	0x689ec04209c3ab46
	.xword	0xa1b5852967e55ef2
	.xword	0x29861f625046e6ef
	.xword	0xa3023a09209444ae
	.xword	0x692d5f3790e61794
	.xword	0x07e22a78daadfdb5
	.xword	0x8469ac3d33602e05
	.xword	0xb5895c5a0ad7c771
	.xword	0x044806898c4e9a8c
	.xword	0x382f0dee22b647f4
	.xword	0x6e1c277dddc9dcf9
	.xword	0xd7e0fad9caed2c3e
	.xword	0x5d1daa45ef7a5439
	.xword	0x17b2700497a1f5c7
	.xword	0x2c840f39be4bf390
	.xword	0x6f351962e6e1f81c
	.xword	0x5b1a8cd21984b1b9
	.xword	0xd38b7a6cf5a7789b
	.xword	0xba9037c1ba733223
	.xword	0xc03be8e8a5268492
	.xword	0xc4073f2bcc55c691
	.xword	0x0149a5dcae953f2e
	.xword	0x4ef8e413881055d7
	.xword	0x352d2731158158a9
	.xword	0x0f332b1f9c25d9c9
	.xword	0x5e02accc0feffb9e
	.xword	0xad4a65b9e400ee50
	.xword	0xcfac20b7f7ffef32
	.xword	0x45cb290450e1b0bc
	.xword	0x8c6f591abad0f09f
	.xword	0x0841de855cc33fa6
	.xword	0xf171378a3811ca73
	.xword	0xdac370455208fe5a
	.xword	0x93d57be576904372
	.xword	0x33265bb37c55ef62
	.xword	0xe9c09417cfe49ee2
	.xword	0x9448d7fbcf7dd2d3
	.xword	0xd3b7f40bcb1f6462
	.xword	0xa898654bc36a0aa9
	.xword	0xd9605b2fcf48dc4a
	.xword	0x84442b66a4779031
	.xword	0x79bd3bc6bcdec7ef
	.xword	0xe694a3a810e2c460
	.xword	0x082ac00da3eb6a99
	.xword	0x7ef5b094372d138e
	.xword	0x987acc09ce031011
	.xword	0x92f93ef5b6265b21
	.xword	0x1542d0b11cef9e74
	.xword	0x5bcef7bb3a7add79
	.xword	0x7c96470f63475c83
	.xword	0xf4d9baf2865d33d6
	.xword	0x5e67386f31f5cb65
	.xword	0xa840fb7548f95494
	.xword	0x3cff33939125c8cc
	.xword	0x17cafd4330a21f84
	.xword	0x3d757838499148a7
	.xword	0x3e023a70670fb70d
	.xword	0x3ab011764c0bd254
	.xword	0xde4e1fdbd441a84a
	.xword	0xa837a1e638a5e066
	.xword	0x61b36f7483863b5f
	.xword	0x12e3e3aa8029ef83
	.align 0x4000
	.data
data_start_2:

	.xword	0x51bc1458a5b15a6c
	.xword	0xc92d2b55e6b94fd3
	.xword	0xef452a104fc627da
	.xword	0x8ffc1450442ea27a
	.xword	0xf581d3c977ed09df
	.xword	0x101262f9387bfc75
	.xword	0x3b5b34db05d1ff40
	.xword	0xf056e7cbc4338c6e
	.xword	0x8e4618d41edd8bac
	.xword	0x3e749ba3d06be44e
	.xword	0xf4a634c159113453
	.xword	0x6840e50bb610b12e
	.xword	0xe7cc70f0868f278e
	.xword	0xb87b0161c592b17c
	.xword	0x1850698db5eb87d2
	.xword	0x049516c02e245332
	.xword	0x9f8d0822e7e81132
	.xword	0xf280d51e62d47405
	.xword	0xfc8dfbe28b596ee5
	.xword	0xc9c82a017bef93da
	.xword	0x421351829be5f72a
	.xword	0x3aa274b135c774c3
	.xword	0xb8db8d498704bf90
	.xword	0x67c126b945e9f4ca
	.xword	0xa13c06ec8dc4a21c
	.xword	0xf4f9cd70127fece3
	.xword	0x4c57c27b3b519824
	.xword	0x03449311c38161b5
	.xword	0xc29d62def9b1540f
	.xword	0x586fc19e764335e9
	.xword	0x86be81dacde23bcf
	.xword	0x690af8c75b4bbc11
	.xword	0x8c964b696a2395e3
	.xword	0x8ed233d799cef465
	.xword	0x0e2a9729c37a6139
	.xword	0x876bb626919753c9
	.xword	0x3a0c3166df56ba39
	.xword	0xeed5c96d5f8dfa74
	.xword	0xb1856d6076f2a452
	.xword	0x613debaec680aeae
	.xword	0x56c2969929056587
	.xword	0xcf3f4c9d5917e73b
	.xword	0x1f777c0db61df027
	.xword	0x02274846187dbc4f
	.xword	0xa7b170c145767cc4
	.xword	0xa0c0114c7089769e
	.xword	0xcb57e1c17352d0d1
	.xword	0xbfbf99717ffd4357
	.xword	0xa25edc31eacc349c
	.xword	0xe63d2e0d44ad371c
	.xword	0x9ec12e6f46f34d13
	.xword	0x93d7b223db0a35e4
	.xword	0x12bd239a5064fa7f
	.xword	0x6307d2bae13838a1
	.xword	0xf19f23ac3a27b68a
	.xword	0x7085a3332a88605e
	.xword	0x70951b03709e0677
	.xword	0x880d60ba0e80f6cc
	.xword	0xf171ebf6a48857b5
	.xword	0x5838b79436fa00ed
	.xword	0x6421bc24014a5666
	.xword	0x480e25fd4d88730d
	.xword	0x963a4046951bb46a
	.xword	0x75220c12efe9c77d
	.xword	0xd359b0219bd00dc5
	.xword	0x8b073d418522701c
	.xword	0xde2c3a0f15a33b65
	.xword	0x590e36721dd9cb9b
	.xword	0x3a46e3ab1be06094
	.xword	0xcdba3b2cec33ccd8
	.xword	0x51317ee1906c7b81
	.xword	0x31a991ad62d25cd3
	.xword	0xe54937356fa8c8b2
	.xword	0xd9250cbd653bb56d
	.xword	0x5629efe5ab81b959
	.xword	0x718a2248e227c3d6
	.xword	0x241987251dd7cb01
	.xword	0xe30f01f7e5442ee6
	.xword	0x4cf5217078f3d5b1
	.xword	0x23598467697e0bb4
	.xword	0x130d1a98501feea7
	.xword	0xedc7837b7257c4f3
	.xword	0x088f844f4defdf86
	.xword	0x12df9b4b4bdcee6d
	.xword	0x31ea5921a7caae3a
	.xword	0x66bfccea5d49fc3f
	.xword	0x886efda755c17234
	.xword	0x1ef9ef5cc1203105
	.xword	0x82eb01feff81adf1
	.xword	0x7c57c84da591062f
	.xword	0x734a8c37cb09ef5e
	.xword	0xf8a70cdd0df96a70
	.xword	0x64ba6f4ad52e5ca6
	.xword	0x4cce4c6b2cfca013
	.xword	0x77446e81beb24a05
	.xword	0xf6ec896bddfa7b9c
	.xword	0x90b6f21b88b7fe46
	.xword	0x3371ab1657efc62a
	.xword	0x0bd3a6641e9b0c5e
	.xword	0x5df91132b5cb0fa6
	.xword	0x76a0b97b940910e1
	.xword	0x9700eeec5135bdcd
	.xword	0x65f9d9053a0a5145
	.xword	0xee850c24063073d2
	.xword	0x54b8237685ca6517
	.xword	0xd795a0edefd256a9
	.xword	0x6869d0f6b75b0ff4
	.xword	0xb66260c8c95c94b6
	.xword	0x81dc8d2315650f4d
	.xword	0xc8aab7615e3cced9
	.xword	0x0d7ef43bb48c1751
	.xword	0xa7f3ab9dc966211e
	.xword	0x4b6e637b50285103
	.xword	0x51598eb1f5d9d04f
	.xword	0x77866b01a7c8e22b
	.xword	0x34bfe5118504c454
	.xword	0x50c4a5c4f88f945c
	.xword	0xa82cd6b1dde5808b
	.xword	0xfd1e0bdcdfb117cf
	.xword	0x3c8c9245b4fb9933
	.xword	0x3b18c9690634b3c4
	.xword	0xb494f7dabd2757b5
	.xword	0x7fd8ddf7e6490a90
	.xword	0x1511d4c6e01f96aa
	.xword	0x0cb9afe6afda1be5
	.xword	0x421880877f2e0c87
	.xword	0x3b7238d9d80c47e3
	.xword	0xae547c2b3ea88329
	.xword	0x9ca68c10200f1195
	.xword	0x022e602a57deb129
	.xword	0xfddd06856c9de1be
	.xword	0xe310c847467314d1
	.xword	0xca744957d712c764
	.xword	0xb3ef998931b1334a
	.xword	0xcf4f30fb4cac5838
	.xword	0x1df42e6b638a8c38
	.xword	0x0bfe767c91ca09af
	.xword	0x98aa37750155b6c9
	.xword	0xd57f8c7df88bdec5
	.xword	0xc533745d76086600
	.xword	0x3e0a3b4ae102ae99
	.xword	0x62ef98e965d99e56
	.xword	0x12f159df6438fe35
	.xword	0x4f6f4aaf1651a847
	.xword	0x218dd3120ba097da
	.xword	0x26652294ad0e180c
	.xword	0x72f81ae92c441bc9
	.xword	0xb41c23d930efc092
	.xword	0xed413ff0b7fb36c1
	.xword	0x61c0d302fea08619
	.xword	0xf1726fe924bd2eb6
	.xword	0x1b8a4c7ba0f0b04b
	.xword	0x23f29c50b11b89dc
	.xword	0x3d289345c50bdc2c
	.xword	0x7109660dbce93927
	.xword	0xb6fd475927a39a2c
	.xword	0x990662cb4dbedb88
	.xword	0xcb7deceaa1625da4
	.xword	0x6a426653c0a48e36
	.xword	0x7020ae30d5918dc8
	.xword	0xbacb0d88db2acf6e
	.xword	0x6d363caae47b6f04
	.xword	0xf25b053d6392b73e
	.xword	0xd3364fff9164b812
	.xword	0xc12750dced943d06
	.xword	0x2b5ca3eb4a6c629d
	.xword	0x1f0ed0141e76e426
	.xword	0xc07d75f97d5c4f42
	.xword	0xb17e037581e40968
	.xword	0x8274ea95be8e8860
	.xword	0xcc1fa6d171d19e71
	.xword	0x090c95a3b3af1abe
	.xword	0x040ce6794ac4d8e8
	.xword	0x77401fe6a3443241
	.xword	0x936c69c24f432070
	.xword	0xa30fcee8ce92ac7f
	.xword	0x7e958aec83a7798f
	.xword	0xa4fcb8c6f806854f
	.xword	0x0ec679c33982606c
	.xword	0x2560dcd7ab9a9732
	.xword	0x2e68ed399787afa8
	.xword	0x867a581da47d3910
	.xword	0x2efcf90f8b2c5f89
	.xword	0x6b2eebb165ed8668
	.xword	0x85252df9ae8a69bc
	.xword	0x6a6f7de03b3b6f21
	.xword	0xc3849eb3b496c6cd
	.xword	0xf99776946461aff0
	.xword	0x86d4aa4b2a0269c9
	.xword	0x22a0f8243a9473f6
	.xword	0x9d71991b9e9fb6b1
	.xword	0xc983afded7a18d32
	.xword	0x9479509f206b1ce8
	.xword	0xa44fb53a0dc4334a
	.xword	0x35972cb0fec682d1
	.xword	0x1ded315ef6619139
	.xword	0xe528b153a30d0476
	.xword	0x77c3b1e41f3782f1
	.xword	0x35da8a7d71ed69c6
	.xword	0x0c6d9f79575e9c20
	.xword	0xe66fc537cb577ceb
	.xword	0x5227d50fa1e4b5b9
	.xword	0x1d05c1b7d023ecbe
	.xword	0x4253fc47abbe2aeb
	.xword	0xc7701e6f2dd1545c
	.xword	0xbf1cd3107732d769
	.xword	0x4b46237eeb16fa49
	.xword	0x857b04d3106e4cdc
	.xword	0x7d6dfdf1d993c259
	.xword	0x98e333e8a134574d
	.xword	0x5d6b6e576152a655
	.xword	0x6fedcaf00eea57c4
	.xword	0xc6188ef28c34efb5
	.xword	0x27d19b2abf30a676
	.xword	0x5be6a5a2e3ec30fb
	.xword	0x4efac92650c1c1df
	.xword	0x7fff5e018b4ad737
	.xword	0x9e1eeb8e585eb54f
	.xword	0xdaa0a78dec42b73f
	.xword	0x8164b8d53adc46d1
	.xword	0x283508552307c05b
	.xword	0xc94fa7c87608604e
	.xword	0xdbcd0c70742ba5e7
	.xword	0x16a721efdb5bc2f8
	.xword	0x4595c63b38a44c8d
	.xword	0xfd7140c775f1232a
	.xword	0x2b20dd4e66919965
	.xword	0xb330b3775ee68eba
	.xword	0xd17ad6c1d1d763f3
	.xword	0xabfe649bd1d2edd6
	.xword	0xd63f3f31fe6809d3
	.xword	0xed9c6e226c317b55
	.xword	0x3542ee8fb7c9459d
	.xword	0xb83d661a6fd6c8b5
	.xword	0x9a104f2756950a04
	.xword	0x8eb6582f1d1756ae
	.xword	0xc477c1bad90d9cf2
	.xword	0x6aebaa90ade08a95
	.xword	0xaba9e847434a2dad
	.xword	0xdaa84b9c62585e97
	.xword	0x043e8b87f65be4be
	.xword	0x55bc2e8ed5752e8e
	.xword	0xab42e2c83f911abd
	.xword	0xa1825a5e84e69afa
	.xword	0xc3deea40b659be12
	.xword	0x6a1a1079dc6150ca
	.xword	0x0adc3bccd48cddbf
	.xword	0x0c140688ea0ef2fc
	.xword	0xa2c650fc7e0dff4c
	.xword	0x82397ae28ad03a49
	.xword	0x5ee59e9bf34e920c
	.xword	0x1503492653dc59d0
	.xword	0xfa204d931eb5b4eb
	.xword	0xa93522c819fe3278
	.xword	0x72fbbb71dcc48c0a
	.xword	0x79334b02dd5db7f3
	.align 0x8000
	.data
data_start_3:

	.xword	0x78f2e115cdda997f
	.xword	0x79dccafff55cd923
	.xword	0x129f819542214aa7
	.xword	0xa6b9b60f22ed8437
	.xword	0xe9dfe5448723cc7d
	.xword	0xaa44278b473dba91
	.xword	0x4d49e6806f5a0f1a
	.xword	0xe524ef0b6a9b72ee
	.xword	0xccfaee30c1d06f15
	.xword	0xedabd2dbbd18b9b4
	.xword	0x127847a5b06d6418
	.xword	0xcc93d433703d02cb
	.xword	0x7330cc059cffe6b7
	.xword	0xf3fa1acdec8b3b45
	.xword	0x7041caae56522cda
	.xword	0x4fcde3fe66828a00
	.xword	0x71f7b8d05f0bba97
	.xword	0xd7e3627216d5f582
	.xword	0x06c9c710d180075c
	.xword	0xe52119525ff8e070
	.xword	0x4ecaa5dc7e74ac36
	.xword	0x89c9e828d73206c3
	.xword	0x6c959c073849b642
	.xword	0x726e4e69c56ce24a
	.xword	0x9b3aa3460234e533
	.xword	0x71b1efae6f232abe
	.xword	0x5f8093308ef0dea6
	.xword	0x9b66c99c835e9b77
	.xword	0x510096cf5ccb79cd
	.xword	0xe3ec8c6195d79a9f
	.xword	0x1345dff51eb7837b
	.xword	0x151a2a5671c2e584
	.xword	0x1ee690a17340238b
	.xword	0x55e1dc9a9ce0d615
	.xword	0x4ccb65340de2d4f9
	.xword	0x4ca89833ee860e1d
	.xword	0x88858381e671e60b
	.xword	0x41f25989ce2cd3fd
	.xword	0x88d1671091710ad9
	.xword	0xecf2f899bbcf27b8
	.xword	0xbd9d8fb6ebce6066
	.xword	0x36257e6fdc893787
	.xword	0x18ac0d28b2d6e647
	.xword	0x248b4f92d8559b85
	.xword	0xe8c1e5ec60c3b260
	.xword	0x4ad249493ea28a0b
	.xword	0x36c1506a95ffae97
	.xword	0x2e279bd02e142438
	.xword	0x351a98a02cd8bcec
	.xword	0x31a7e55ede09aa03
	.xword	0xc7a4ea5be37bcd7d
	.xword	0xc0458d5f75d19fe4
	.xword	0xfa83ad51e226d137
	.xword	0x4e8d94d44a677ca1
	.xword	0x1155c8e497bcd0c0
	.xword	0xfc2dea5d55a99d2d
	.xword	0x1b83bc635905031c
	.xword	0x04017ff155e31af8
	.xword	0xe46ad3a41604fe13
	.xword	0x7d085778a4f81828
	.xword	0xd70a89cb9b30a5a3
	.xword	0xee5ef48083124315
	.xword	0xc0dcc24e77d0e9a3
	.xword	0x288d5c3cc250bf59
	.xword	0x5cf41f763cca3738
	.xword	0x4b715a27149a64d7
	.xword	0xf060e9a0199f7cfc
	.xword	0x889f7f81a6f7f744
	.xword	0xc1f682a9a06298d2
	.xword	0x67320aa297284887
	.xword	0x65b858f4b8d943d3
	.xword	0x05af621b7f1ffc8c
	.xword	0xc8ac83473d83e77e
	.xword	0x720d004c63e4e817
	.xword	0xd460d866f38f14a1
	.xword	0x6314607d460060a8
	.xword	0xb3d36c708089e43c
	.xword	0x689be5323d963e1c
	.xword	0x2c7a11fdba9d6982
	.xword	0x44a12c2535aa6769
	.xword	0x10da9027547c8e2b
	.xword	0xba77dc99e1001f53
	.xword	0x9da9a7d93d9f14fd
	.xword	0x9f4ea5c0784d7590
	.xword	0xda5f2a9eccd91dc2
	.xword	0x3df8e6e725684483
	.xword	0x25ce311445b024f3
	.xword	0x2270dd9490f087cf
	.xword	0x6cca296b3c7ca30b
	.xword	0x71dc712146c09071
	.xword	0xbc11825f080adf50
	.xword	0x6a82c57eb98a1e10
	.xword	0x5985cf7afbe58a4d
	.xword	0xee17f73fe25d60fe
	.xword	0xa93d3bbe33fada41
	.xword	0x5b6f36c44222ea9a
	.xword	0x8869e8903ac0a433
	.xword	0xa0acd9ba1462f653
	.xword	0x1055f7ac8cf9ca17
	.xword	0x556376a3f413d23f
	.xword	0x50ea04961b4fc1ce
	.xword	0x8271e2d5f52d2112
	.xword	0xb9a850e132843ca2
	.xword	0xae648594ff3d886d
	.xword	0x02de4f36a950100b
	.xword	0xb653d09c990d6da9
	.xword	0x3b6c05547e1d8254
	.xword	0x354c5be3e7198f49
	.xword	0x40297cb5062903a3
	.xword	0xd03915a844089e31
	.xword	0x85592f3459f83651
	.xword	0x09280764c532aece
	.xword	0x1d4c388b77b42671
	.xword	0xf1fafecc2dea8d13
	.xword	0x6c87eef8d4ed0677
	.xword	0x46a276a75fb37aca
	.xword	0xcad977aebfc683a3
	.xword	0x1463596c70482c0f
	.xword	0x26fa0be59a1678cd
	.xword	0x8a0acc929d19219d
	.xword	0xbd7d358492839250
	.xword	0xef9d523347da2e86
	.xword	0xec0299ad181a4b2e
	.xword	0x3190d64867dbac47
	.xword	0xb6db50e64192adc3
	.xword	0xe1f0513fe92cf0e0
	.xword	0x37c97cd07e756c83
	.xword	0x7a7999dc23476fd9
	.xword	0x0eff9c6723bd1c5b
	.xword	0xbddf8a8f2c19a7c7
	.xword	0x5a82f5f0ae631f9d
	.xword	0xd77377eac02ab0f8
	.xword	0x39ba8145104c2a90
	.xword	0xf817f8063a867d56
	.xword	0x3a895b49f1c3de74
	.xword	0xc728c2808bb6391d
	.xword	0xd85db537b1a65036
	.xword	0xf2f7563df2b86819
	.xword	0xed8a27ace957ef84
	.xword	0x23fa6ce4c9423531
	.xword	0xffc48d412698a941
	.xword	0x3c817e00e8ac1a3b
	.xword	0xce68a29896796d71
	.xword	0x6f74a84cff7f8eef
	.xword	0x5fff025ba3b875df
	.xword	0xa09eb5f58cd3c47b
	.xword	0x025f7b2fb7f55c3a
	.xword	0xd4f25636f917b7cf
	.xword	0x3b9457ccbce4bec8
	.xword	0xb051eb15901cc618
	.xword	0x42fa72eaa3efa19e
	.xword	0xded5fb04e7113ae5
	.xword	0xe8743374b8a04aa1
	.xword	0x0abc74b95ef67ab3
	.xword	0xf9b3e1df887ac4bc
	.xword	0xc30813e20370a7fd
	.xword	0x679274525bdc3f6e
	.xword	0x142aedc62070ef69
	.xword	0xdee515eb969d1054
	.xword	0xf410ec90ef1fee76
	.xword	0xffa26c4e2d8a30d2
	.xword	0x4be7a079e5afd996
	.xword	0x82f0c6ef3995fc00
	.xword	0x15f202a9cc2fbd9e
	.xword	0xb4be3e0fdae759b7
	.xword	0x6419ffb5ee7f4ae1
	.xword	0x4724c59277e91aa0
	.xword	0x75a94f1a23fcf895
	.xword	0xa080d7acdfd86a69
	.xword	0x1418e29599707174
	.xword	0x40934b88a3cebbe5
	.xword	0x39f2aa722036e183
	.xword	0x3e6dada29408d2c8
	.xword	0x33cddd2a07a5fe76
	.xword	0x9af163926f05ba26
	.xword	0x68fdd4ad715c8788
	.xword	0xccd266420585a371
	.xword	0x150eedf4ccc71e09
	.xword	0xd6a682b6d845a56c
	.xword	0xd47cf52b7715cdb5
	.xword	0xf1ea02d616656d87
	.xword	0x6ae9a3018e23c737
	.xword	0x4e26c3bba6f3e2b0
	.xword	0x8d6b858926fe4486
	.xword	0x24017de3c1014720
	.xword	0x9e86dff396f3e2b7
	.xword	0xd0f7f6b8e4de40a2
	.xword	0x5d40d4d173d76400
	.xword	0x185ec478e9622671
	.xword	0xce531559be350d3c
	.xword	0x2757bbf6e4410d3b
	.xword	0xdc0c1ad0e0adad4d
	.xword	0x91c8124a13e89083
	.xword	0x8f7999b0434a0237
	.xword	0xce2c412a6f3078d4
	.xword	0x4cf152573dc3c479
	.xword	0x958de1954f6607bd
	.xword	0xad1068ed08ce3298
	.xword	0x1d5fc35185f5c252
	.xword	0x08f53a5cf21e57cb
	.xword	0x1174ff9db5844715
	.xword	0x9a573d55b1e62c5f
	.xword	0xde31bedc2389795b
	.xword	0x87895a0e5a75b567
	.xword	0x1b00b90afeb49d72
	.xword	0x29099f5abbf8c2ab
	.xword	0x3f5e0ee15c8f71b4
	.xword	0x070b4c8079102aa7
	.xword	0x434caeac6e5d1349
	.xword	0x7d87e053a7a866c9
	.xword	0x860bf930acc8b545
	.xword	0xde4773b8a9167b00
	.xword	0xd182a07c4a43e743
	.xword	0x597f6e525bdb981a
	.xword	0x955f55861a332229
	.xword	0x833e0cc840d33806
	.xword	0x9a6ff7757cfa951c
	.xword	0xe76694d114abb5c4
	.xword	0xbba1ed74b71ec811
	.xword	0xd45fd9a2f559de35
	.xword	0x911431de5aa86329
	.xword	0xc5708becc60d795c
	.xword	0x1b6cf9588d492d6e
	.xword	0x49a632f1105eb415
	.xword	0x9a95c7740e3354cb
	.xword	0xd6d33398e2684f31
	.xword	0x9df254f03cc49b4f
	.xword	0xc7225b04028a6f91
	.xword	0xe37420cb07372b61
	.xword	0xcd36de8dea4ba323
	.xword	0xd8322c92dbbdec3d
	.xword	0xd22315693c8593ba
	.xword	0x4ff0cdb87b90241c
	.xword	0x7c2f9290be445c33
	.xword	0x037cf06a0789a514
	.xword	0xca77afa7701a6ea4
	.xword	0x6c176c6aa85a1c40
	.xword	0xf1eb268bdfe87e79
	.xword	0xf59029d6fdb19586
	.xword	0xcd5030731aad2fcb
	.xword	0x273e89bfbdbbb0d1
	.xword	0x3e220b9600ae9089
	.xword	0xc976fb91a849df13
	.xword	0xb78b43d5cf23bca7
	.xword	0x3cf8adde251c38f7
	.xword	0xbcc550178c59a483
	.xword	0xa39514c0e47072a9
	.xword	0xa733c87b30ff54dc
	.xword	0x720d042bafeab26f
	.xword	0x40928d14fe56a40f
	.xword	0x72ff3c358a1d535f
	.xword	0x71b8a679a2a78f2b
	.xword	0xd8ce2347878fe57c
	.xword	0x9169c9ad45d07d69
	.xword	0xba6b1adb7b1a6463
	.xword	0x95ca09627fb92ff6
	.align 0x10000
	.data
data_start_4:

	.xword	0x350fdaccdf377550
	.xword	0x46e776bb8b02271a
	.xword	0x346a9897ae2ee927
	.xword	0x0710652f53d4417a
	.xword	0xac93d6f3d91ce9fd
	.xword	0x48b2af1c9353627e
	.xword	0x309b2fa4000f9e33
	.xword	0x512cb4490e860b22
	.xword	0x7d0cb027d1887ec4
	.xword	0x061b6eaaed405cf9
	.xword	0xba603010ad64eaa0
	.xword	0xf51b46d3641a4def
	.xword	0x8f36c28a2af2ab4e
	.xword	0x568ee49bf50855d5
	.xword	0x93f4de056d56a163
	.xword	0xb19c670c0adaf195
	.xword	0xf2d06fe76ce53601
	.xword	0x8aaf5db279c90d79
	.xword	0x73aa76036ee4e7f3
	.xword	0x65670112a0c48e33
	.xword	0x81b8906cacfeee9c
	.xword	0xe9828e028f04d157
	.xword	0xaac18e649829d46c
	.xword	0x085a133f930809b1
	.xword	0x9dc071c9fa353df5
	.xword	0xea2468c345db0dc7
	.xword	0xb2a7ded053e39fc6
	.xword	0xcdb0aeab131cba6e
	.xword	0x61e9e209cafbd2ad
	.xword	0x23d7016c0a218d51
	.xword	0xe4339179f77a2290
	.xword	0xcdd8ffa3069febaf
	.xword	0x26fbdaab579774fb
	.xword	0x4cc5e4653440b3d5
	.xword	0xc26a2df8b8b6f72d
	.xword	0xef9685fc55363239
	.xword	0x0b45b78cdb1ff239
	.xword	0xf640ca7f6ac6c4f3
	.xword	0xc8a0d6abb8731e31
	.xword	0x18c4a23c3d0f971b
	.xword	0x7844e0b3577c003e
	.xword	0x8bd1fcd626d4cbae
	.xword	0x88d8f58052f4e9d1
	.xword	0xb3f17e20c6172286
	.xword	0x85c368e27f73ca1c
	.xword	0xc7b387f614ad45ba
	.xword	0xbde8650878a3c6ca
	.xword	0x31834329ebe35e8c
	.xword	0x17d69b64062b674d
	.xword	0xa87c17406f2e4fc5
	.xword	0x568b6b2a77221f10
	.xword	0xb50dd2489768039d
	.xword	0x6c17863dc0952e4f
	.xword	0x056555a00a7689f8
	.xword	0x182e7e50c2b34237
	.xword	0xaf8a84971111f7bb
	.xword	0xb581fb1467f3c8a6
	.xword	0xbdd54cf042424d90
	.xword	0xc0d25d03c28a4e0f
	.xword	0xb3908d799ea00528
	.xword	0xf3afbaaf7e30fb46
	.xword	0x92c01857b51f498e
	.xword	0x2e68f8942a7a6770
	.xword	0x39d6b67a10626032
	.xword	0x7d716e5c63409c61
	.xword	0x78eee4df4040f913
	.xword	0x0b7225ec1d3253f1
	.xword	0x476a64d366a8f236
	.xword	0xf5b1db749730ba9d
	.xword	0xd9ec1978509f59d7
	.xword	0x0f52972048b1502b
	.xword	0x3e581becfb13466d
	.xword	0x656e4829464374c5
	.xword	0x9af9995009f75024
	.xword	0xd0afb1936529ae4b
	.xword	0xc16dc1348e5e1079
	.xword	0x9bb4ba38396dca8e
	.xword	0x4d130a94121fa84a
	.xword	0xb65fd928578e5144
	.xword	0x86be80deafa3b1ea
	.xword	0x5ddc2684df3d0bbb
	.xword	0x3a60391ad962480f
	.xword	0x21054713bb61bc33
	.xword	0x9a2954aa486495d2
	.xword	0x49223f7275958db0
	.xword	0x22367c06a70f31bb
	.xword	0x7a93bbe016e53831
	.xword	0x43be6c7c09997d2d
	.xword	0x135149ea5fe60788
	.xword	0xe4938ac350210a52
	.xword	0xe14829e84778d661
	.xword	0xce5f0b86e1690348
	.xword	0x8429ebad7bcdbcd0
	.xword	0x3040e0c921026d60
	.xword	0xeb0bb80f1104e46b
	.xword	0x9989abf0fb5b51a7
	.xword	0x04de5f11ea2570ec
	.xword	0x4e709f14367ec25d
	.xword	0x82f03127e942d103
	.xword	0x9c25a0848cdf5d4f
	.xword	0xfb2325e6a895822e
	.xword	0xf61c85b6f27f2102
	.xword	0x53ebe232f412d0e8
	.xword	0xa3c83bab22d7f389
	.xword	0x7637b416ba38e3f4
	.xword	0x1b43be0f37292a70
	.xword	0x4cc8e2323b801501
	.xword	0x6b52c58bbfba4e3a
	.xword	0x1182c53732f9d846
	.xword	0x77aa469f3fb1c77d
	.xword	0x7762055d8a2f143e
	.xword	0x3e3ed6b60f020d45
	.xword	0x733a817b99445eeb
	.xword	0x4fa655bb589fb76d
	.xword	0x545e0e511d0addad
	.xword	0x82f5c3b87842157d
	.xword	0x9b03f5256e854f99
	.xword	0xf4f6e2aadca60cbc
	.xword	0xbeb790cc82847b97
	.xword	0xab0241ccae7ce368
	.xword	0x6cf1ad873803ce3b
	.xword	0x611e5cfe60d35cbc
	.xword	0xbf67f685c60d282e
	.xword	0xca726da0dde3e362
	.xword	0x31989138e40519e5
	.xword	0xdbcd6904d74c565d
	.xword	0x5a616401a3d99d30
	.xword	0x313f943df83bfb87
	.xword	0xca8f221d4ff71ab0
	.xword	0xce9b5cf2e0a93435
	.xword	0x98f5f42c843d56f3
	.xword	0x953952f6c5b9c4ff
	.xword	0xed3684d686bb0ea0
	.xword	0x367f8e23fd90d40a
	.xword	0x9a7d8907a7a50b6e
	.xword	0xe95f791d38575d50
	.xword	0xba400f9ade6897d8
	.xword	0x1594c24717931749
	.xword	0x9e9a986cc306577b
	.xword	0xd6b5c7ae766a3cdb
	.xword	0xda903ee1a61b79da
	.xword	0x05e7250e9eac1d7f
	.xword	0x16802649d0f9ba4f
	.xword	0x5f94123e05cc9bb3
	.xword	0xd95d5953f0c49cd8
	.xword	0x43417fd30b32415b
	.xword	0x8b318fa6565aa808
	.xword	0xd05a9eb2d3c87eea
	.xword	0x30d50d728f20d33d
	.xword	0x983e213fc29abbe7
	.xword	0x31eac50a995290bb
	.xword	0x855bc95ac61096c2
	.xword	0x835f00a80f12153d
	.xword	0x80cfee770ce6d3d4
	.xword	0xbf02b7ff80c793be
	.xword	0xf1623297c563094b
	.xword	0xfb180c6aba909abb
	.xword	0xd749ac5f9a7a3ab1
	.xword	0x76cda7258071978f
	.xword	0x339a4751a77ae799
	.xword	0xdab267c25b77d19d
	.xword	0xcebb2c4d092a0071
	.xword	0xd45a67c5534c36dd
	.xword	0xa37be24d01a8cefd
	.xword	0x464a5479a4bae71c
	.xword	0xffe2dbb068111dd1
	.xword	0x6d55779f7baa986c
	.xword	0x079d8b64bbf49fb8
	.xword	0x485e6a7b0491f260
	.xword	0x5ee16bed812cbf62
	.xword	0x78e10785cd0d2805
	.xword	0xe3abdfefd707e851
	.xword	0x4e7902e6b6f93711
	.xword	0xaa720e9fc36341a0
	.xword	0xcceedb79acb4298f
	.xword	0x9bbd02c6942a93fd
	.xword	0x4bf2ff39e76eda35
	.xword	0xd78522a9284e7e94
	.xword	0xcd07cf345593f1f6
	.xword	0xb7bec5f893fc18b3
	.xword	0x240c4d65293e57a6
	.xword	0x2c1f302c692294c9
	.xword	0xbb0dcab4911519d9
	.xword	0x50830d2fd59ab3cb
	.xword	0x2385ab643cc684a5
	.xword	0xa533075930c5b855
	.xword	0x4d19570f68ef6d2d
	.xword	0x004c0c578bafdf2c
	.xword	0x176b32b3b696b77c
	.xword	0x2639e641eb89f0d1
	.xword	0x794797c8390af8d3
	.xword	0x307f3593f9255ecb
	.xword	0xf13acbe1864ad136
	.xword	0xfa633fe0774124e4
	.xword	0xed91a607d9e74a32
	.xword	0x46d50ed8cd16a03b
	.xword	0xa63705942276865a
	.xword	0xf8cc309e86332150
	.xword	0x930ee1a98a15e041
	.xword	0xcc7c29773ba913e3
	.xword	0xe1de04ccd8829bfb
	.xword	0xffbc30ebbadbac6b
	.xword	0xe84d7a9037f78990
	.xword	0x783a6338fe8e27b1
	.xword	0x8ef35d83955ddc03
	.xword	0x4657d909f2e3b7b6
	.xword	0x3ef2f6f6a841767e
	.xword	0x2e2958e715487a57
	.xword	0x37cb8321ae3729df
	.xword	0x4ed1d27960503b95
	.xword	0x08ae39341f5962b2
	.xword	0x3ac01f1b0e24d568
	.xword	0xec5c96448a0d54e5
	.xword	0x8ae9cfe28953b81b
	.xword	0xa589b5b820dc5b4f
	.xword	0xfa4f564a79fbad9b
	.xword	0x9b7ba63cbf03865f
	.xword	0x41827beb8b241e06
	.xword	0xa1090164ecacc825
	.xword	0xc6363e1ae3991273
	.xword	0xf6394df2a5f344c6
	.xword	0x6dc4e1cfe9ee16ef
	.xword	0x4efff30dbbd8aa8a
	.xword	0x013c8ea8aff2dd62
	.xword	0x396554e5d3439eb7
	.xword	0x5c569282e624ea48
	.xword	0x98daff06015d9cfb
	.xword	0x953a39604d0a338e
	.xword	0xc977fecffd4e57d0
	.xword	0x006ba372e73c312e
	.xword	0x9ea53cc311d8758c
	.xword	0x5800b56ff48f2db5
	.xword	0x881492d11e3236a8
	.xword	0x4d6891249f05c2f7
	.xword	0xbd32ca4e5ad1d0ef
	.xword	0x5d90301929bd377f
	.xword	0x5a259f3f07038dd9
	.xword	0x78d2a955b21ce537
	.xword	0x1e883310ffd79cd9
	.xword	0x9de55711b6ab2420
	.xword	0x697c4c9e32e33c8f
	.xword	0xd87809d6c1a5d718
	.xword	0x632310e03e2c11f8
	.xword	0x0c83315fd2f1d67c
	.xword	0xf81fbc553c8037ed
	.xword	0x20a90623aafb3c8f
	.xword	0xd3d32ddedfd124d7
	.xword	0x1d53faa6bb1f352d
	.xword	0xce65231ee71b1082
	.xword	0x23f7cfd8c3691c29
	.xword	0xeb4dad8f6af19f71
	.xword	0xd5ce371af1dfcc68
	.xword	0x61a17e7886d70cf6
	.xword	0xd3d99fb576379e52
	.xword	0xc1ed43d5f41e9e84
	.xword	0xb6f137c466e41f79
	.align 0x20000
	.data
data_start_5:

	.xword	0xaba0656ff7bba4a6
	.xword	0xcc5b78bf96730265
	.xword	0xbba029b21a9d16e7
	.xword	0xf3b7adf4ea009ce5
	.xword	0x946aef65dd0e88e6
	.xword	0x9dfafdc7fd7b5bad
	.xword	0x89b29b784dd54b59
	.xword	0x48fc1d0c62ded90d
	.xword	0x4e3d0bed8618c4fa
	.xword	0x65a480d904ef34bd
	.xword	0x1442cae58451476f
	.xword	0xd8a9f1d94703c53e
	.xword	0x6c14789328afcf19
	.xword	0xad2c0e2186e89923
	.xword	0x9a545ebce7cb1b07
	.xword	0xffe43b49f1b41717
	.xword	0xb0b3b9d08a791fb1
	.xword	0x66305b39a7a5b8da
	.xword	0x6713d19f4ea4dba5
	.xword	0xc8e3b5e431d692bc
	.xword	0x9a8a17575c1fb312
	.xword	0x5b8c241e924079ec
	.xword	0xef427affef5761c7
	.xword	0x43142572eff50be6
	.xword	0x09b65c1b40c97178
	.xword	0xc5f0eaadc06cfa74
	.xword	0xa84c54c24b87ec7a
	.xword	0x69c408e64bf24527
	.xword	0xf520a7539a530972
	.xword	0x27a443ba029fd3a4
	.xword	0xde0af3dcc85e95bb
	.xword	0x71ed83d829deb964
	.xword	0x31b5b4cf334b45aa
	.xword	0xbf2706fb55628f15
	.xword	0x6072644ed30c4f3c
	.xword	0xeff2b81667da9b6c
	.xword	0x8d21d6321a603bfa
	.xword	0xc420065ec77f8fec
	.xword	0xf322088f21566371
	.xword	0x17278a9f01f31015
	.xword	0x9778de82bca60d05
	.xword	0xfdabda7134763b1b
	.xword	0xe200b8cce97d2eaf
	.xword	0xa0fd2e3ed658c2e9
	.xword	0x2c6401c6a0be4476
	.xword	0xa50ecc82dc511d5d
	.xword	0xe48696bb0cf6d76f
	.xword	0xab28bc7d857eb78e
	.xword	0xd9e7657be563799e
	.xword	0x8941b646e3a18355
	.xword	0xaeef866b39e64566
	.xword	0xbc029385de90b0c7
	.xword	0xf93ef4bb2c2976ac
	.xword	0xc683d8889eaaa7bc
	.xword	0x443583b858c0f33f
	.xword	0x67ef3a23bdfd1582
	.xword	0x59ad38b026c131f1
	.xword	0xccea897b70c574c7
	.xword	0xc6607235e25c721f
	.xword	0x23b9fe2d22365622
	.xword	0xfd58d91cbb76ceff
	.xword	0xe26ec5bac746630c
	.xword	0xf6fdc6a99a79e081
	.xword	0x4eb647eef6c927af
	.xword	0x0e0b0943087014ba
	.xword	0xc4c39bb0d08a7fcd
	.xword	0x3117621a68df3fd6
	.xword	0x90d6d507a701a1aa
	.xword	0xf26044f452f6d49e
	.xword	0x72ffe98cb84b84f9
	.xword	0xafba5dd124e57106
	.xword	0xc5a85f0897f33685
	.xword	0xdaf56c19d91fd6df
	.xword	0x3b9752a5b3462322
	.xword	0x56dd62d1e0d60562
	.xword	0x5e0c37ec72ac038f
	.xword	0xcb84a71cc71d94c4
	.xword	0x803f6b8f6c033c46
	.xword	0x6cd7f82f5a644115
	.xword	0xbbeecde39487dc3b
	.xword	0x4b98084e83c7367b
	.xword	0x7eb2a3e382969121
	.xword	0x39c27ca1ede67b98
	.xword	0x884be4531c2e0bd4
	.xword	0xcf3adc8ab880efbd
	.xword	0xd326d4509cea3228
	.xword	0xb3910455a3c1ba72
	.xword	0x6ceaee5ed4f978ba
	.xword	0xda93bff2df70526d
	.xword	0x6faad366e073c866
	.xword	0x64c33827ff74958b
	.xword	0x9b89a08fdd11c77e
	.xword	0xf1fd30d9876b2795
	.xword	0x9b2720afd5311330
	.xword	0xec0a356c2af894cb
	.xword	0xbead67d425beec1b
	.xword	0x6ea9f93301529996
	.xword	0x6434eda2c6987bd1
	.xword	0x368558585b0f3dda
	.xword	0x82cd3ea1142e3047
	.xword	0xfbfe6aaf7f433f38
	.xword	0x697dfd38bc1717ef
	.xword	0x882fc2a3445bab53
	.xword	0x3fbce159dee06307
	.xword	0x9070e52ae3c73a0f
	.xword	0x00f07f0dabdb79fd
	.xword	0xf06ec179fb6358b1
	.xword	0x35326176cb1f495e
	.xword	0xb5616577308f4394
	.xword	0xe26f9fab3ea92fa7
	.xword	0xb1edfe8f67a2deb3
	.xword	0x72cf8eb212bd4e3d
	.xword	0x2af600729a7fe40f
	.xword	0x5d83efd544403606
	.xword	0xed990de711d259a9
	.xword	0x59a1ee2babfd16d7
	.xword	0x319598b3f1e5b616
	.xword	0x34de01743e9c92b7
	.xword	0x349191b1eb0567f8
	.xword	0xf10045bbb77f2127
	.xword	0x2767def68f25e045
	.xword	0x79a64c2f596cbdde
	.xword	0xcca25779b4d65073
	.xword	0x4a5a4e955b3a0d92
	.xword	0x31e3fcc882fc1131
	.xword	0x5dc775ff6b86f56e
	.xword	0xe44efa6de8d3cb18
	.xword	0x1d24a5424e0547ba
	.xword	0x0e5d0206a3daa308
	.xword	0xc6ade7769194b263
	.xword	0x9bb57a09e687fdf8
	.xword	0x2ac6a8e12a85b70c
	.xword	0x57bc209183f603f4
	.xword	0x047044abb80b7c4c
	.xword	0x652f18ecd878a99f
	.xword	0x1ee513e35b2ae4b9
	.xword	0x9dd53ab6a8138d98
	.xword	0x492dac06629cf98c
	.xword	0xc7e973b0eaafa0e5
	.xword	0xe0e9d42e42d2d1da
	.xword	0xb9167b49af976cdc
	.xword	0x5abd3ffcbeadc328
	.xword	0x675ff39534910f5a
	.xword	0x29fac6504cd2e6be
	.xword	0xeeb2635a7257e9d3
	.xword	0x12022eacab5d46d7
	.xword	0xd28248f2d22504db
	.xword	0xb58b230ab283f863
	.xword	0xc67074a3ef4ed626
	.xword	0x8037aa34d756fdd0
	.xword	0x85718dea7d464abb
	.xword	0xc23e6ac775e11032
	.xword	0x7b0e495714e97763
	.xword	0x8f99b876d81e453e
	.xword	0xb5452808432db1df
	.xword	0xdb232eb91ead8890
	.xword	0x7428203d06d6a830
	.xword	0x1d9eb8ff41bddd90
	.xword	0x6530fb9c5d470307
	.xword	0x3ffcf68404e1d148
	.xword	0xb259d45ce5469a76
	.xword	0xd494916b2d8893d8
	.xword	0xb8b27a76a05c0fbf
	.xword	0xfb4ef55131d447b8
	.xword	0x6397ec0fd5c47fd8
	.xword	0x2bcbb23934880c6c
	.xword	0x2264507b0359d920
	.xword	0xb46a087c24e77a51
	.xword	0x3992947cf4f51293
	.xword	0xecb04ca07ec9046a
	.xword	0xfed40c162ddfe577
	.xword	0xec90dfb135b6fef6
	.xword	0xa080afd3610cdffd
	.xword	0xd749f048f1084e4b
	.xword	0x3c7fab17a540f94b
	.xword	0xca12592c68bb0512
	.xword	0xcd1890d447a2706d
	.xword	0x95d45dd16f6cdcf6
	.xword	0xb66c4bea0ac50cce
	.xword	0x62ac6838dc36558a
	.xword	0xef714afdf4e4676d
	.xword	0x8414205a1119efec
	.xword	0x9ee1ddbc1cfb74b3
	.xword	0xee4716e78247526d
	.xword	0xbc9bceb261f84afc
	.xword	0xaa71e48daedefb82
	.xword	0x32ffffb7b6e76970
	.xword	0xf64e21911ffff7c8
	.xword	0x387c0340f7aeabe8
	.xword	0xf99e40862b56eca4
	.xword	0x06048f24e347a22e
	.xword	0xd4f3470d443ef99f
	.xword	0x10a42c71bc8dfcd7
	.xword	0xb8771714bc633297
	.xword	0xa4d1ad2691dd6a9b
	.xword	0x026e083d1a5ef408
	.xword	0x064723f46905f12f
	.xword	0x968c25f1eb3cdaf4
	.xword	0x9bb7a2ad6fd95fd2
	.xword	0x83a7a4e517be9170
	.xword	0x00586353d6eb8c6d
	.xword	0x4ce9f0b3938aa228
	.xword	0x5ca47c8b170562ed
	.xword	0xdd64afd29015dc29
	.xword	0x9cee4a42848ae677
	.xword	0xd00a10c72987934d
	.xword	0x769cb0b099a7aecb
	.xword	0xedb6a7dbb56f7f16
	.xword	0x151c3a9ad49a7592
	.xword	0x23097f612c7e4749
	.xword	0x519e70645e9ff4ba
	.xword	0xdf319d4c5643ee18
	.xword	0xc2156187bc6a165b
	.xword	0xf7ef1003f7be272a
	.xword	0xb3f82eb9847404e8
	.xword	0xe57092131b5eae44
	.xword	0xd1e5188c161ac5ef
	.xword	0x466280c9d39fba36
	.xword	0x2b89d0c5d27e9333
	.xword	0xf3a76ce874b36102
	.xword	0x70bebeca8778f4e7
	.xword	0xc7ac7390a96f83f1
	.xword	0x2b222554e658092c
	.xword	0xf3a7f999aa95398d
	.xword	0x3e813176a30540b6
	.xword	0x058f916b1f6981e2
	.xword	0xbd7e1a217ee1ea68
	.xword	0x7cdf82ce681bc25d
	.xword	0x6b7aaef5061f2dd8
	.xword	0x13e84c576d518d01
	.xword	0x9f0b228901b9467d
	.xword	0x442400b2368525c0
	.xword	0x213279c8518d5435
	.xword	0x796bab358135dd4b
	.xword	0xb4bbcc3fa272874b
	.xword	0x652557c2b39e1c2d
	.xword	0x18b2c326b0ba5dd0
	.xword	0xa797ecee21d75c07
	.xword	0x486c67af1e374ef6
	.xword	0xbf2820f2e25116c8
	.xword	0x9db322146390c306
	.xword	0x23b01bc700e57106
	.xword	0x5b672ce3c811cdf7
	.xword	0x093ec926dc3661d0
	.xword	0x9839b3c09b23eb2a
	.xword	0x7fbd9323f93d2307
	.xword	0x1f6d92664ef417db
	.xword	0xa1a1fe77d06992df
	.xword	0x3b327eb7d97884a8
	.xword	0xa3d546fdff7ecbd8
	.xword	0x13cba7479a9ab5e9
	.xword	0xd3898d3cae4a6f57
	.xword	0x2d773ce5c4736d4d
	.xword	0x1ee57a3985001c73
	.xword	0xd1d9c5c9bd5d3b29
	.xword	0xec35716714429554
	.align 0x40000
	.data
data_start_6:

	.xword	0xb6c872ed2240587a
	.xword	0x69d0009c967cd116
	.xword	0xbe71dc67dc57bbac
	.xword	0xb4b00400e8c22526
	.xword	0x953b589f5b88d404
	.xword	0x835d89d003ddd8a4
	.xword	0x84f8ca8fee8dcc34
	.xword	0xfef795fc7d09c3fe
	.xword	0xe57aa893291c348e
	.xword	0xcbd2c5c2aa1e4840
	.xword	0x5e6861d5470fa278
	.xword	0x647b3e3a7fd2eb12
	.xword	0x3e9430cb67e2b793
	.xword	0x98d9e8ab4bc74a7f
	.xword	0xad3c5eb473c6b9dd
	.xword	0x6a88aeabdb2ea141
	.xword	0xec8d1132fa4b2d39
	.xword	0xe4931de3353b91f9
	.xword	0x190bb027c41c3879
	.xword	0xa8e95b0d256b3941
	.xword	0x6471c661488d461e
	.xword	0xe721ed17e2920ccc
	.xword	0xf726c83464de15ff
	.xword	0x2525f256360b809b
	.xword	0xa7b270f3a3d08168
	.xword	0x2091a0c906bd93af
	.xword	0x9703fa770f381e2b
	.xword	0xfe9e4e5c27f4c1d5
	.xword	0x2baf45aa54b99d98
	.xword	0x093968e57ffc408c
	.xword	0x2db0dbf4feca5902
	.xword	0x0847093f52bc7c74
	.xword	0xfd57b27910f446c5
	.xword	0x6a720ba1053f0acc
	.xword	0x96ed036dc2a5889b
	.xword	0xf22b2f07f5a598c1
	.xword	0x8a421cc1c4e64ee6
	.xword	0x9d0797482c72ca27
	.xword	0x89c035927bdd38c5
	.xword	0x6d66b1f0fccb26ed
	.xword	0x3787afc54215ace9
	.xword	0xb780c1c6b2439a7f
	.xword	0xa710185eae435453
	.xword	0xd865097e8d7809bf
	.xword	0x750459daed651dac
	.xword	0x0790d038ffba91cf
	.xword	0x05b29ba535153e9e
	.xword	0xd464ad5a435f1c71
	.xword	0x5b91d05ec9a13dc9
	.xword	0x53c93d94a7fc2330
	.xword	0xe3f7f93a007bc1c6
	.xword	0x6dbeb308d1a9d454
	.xword	0x69197daa75b76961
	.xword	0x6e01ee8829b88136
	.xword	0x582d46957c1fb5aa
	.xword	0xeb471a6e2778893e
	.xword	0x5ae4f6bee359aea1
	.xword	0x3b482c1f37a0b2ae
	.xword	0xeb1a31bd8ec4abbe
	.xword	0xef9c605625a87aea
	.xword	0x02bf6dd887bb3f34
	.xword	0x240fcc4bb8c38e63
	.xword	0x14d3595f4aa69162
	.xword	0xd0d5c165e597d8eb
	.xword	0x378bfe06e56f0093
	.xword	0xfc2d5c93e4c27aec
	.xword	0xb60495086806b35a
	.xword	0xcaa354499c60f87c
	.xword	0x4c12272dce5a72eb
	.xword	0x8375d66dde56ee43
	.xword	0xfcb6ef39aee5fcb9
	.xword	0xd65ccf993a3288de
	.xword	0x9b9f85f710e9b387
	.xword	0x78de181973c501b0
	.xword	0x684e622917c959ce
	.xword	0x170ec1fff53eb077
	.xword	0x8a54988fc86d56dc
	.xword	0x7996080113d00cf9
	.xword	0x906a042126f02283
	.xword	0x5e6703edcd874fe8
	.xword	0xdf2c30dc341148c4
	.xword	0xae752c2a0ff41e2c
	.xword	0xd159ac05ed7db50b
	.xword	0xcb91678e4a167ea4
	.xword	0x542777b08104a6f9
	.xword	0x0080d149e49b4a92
	.xword	0x2e25a999fc19bd7b
	.xword	0x82572aa5f1e813b1
	.xword	0x53be71db689066a9
	.xword	0x568d92a16ad6ec03
	.xword	0xbf456c396c071c2d
	.xword	0x1a6dbb9ab66b5dc6
	.xword	0xe04ca2cb8b973aab
	.xword	0x8fd5b30266f4b450
	.xword	0xedfcb53b49d72435
	.xword	0x535cd290cdddf5d4
	.xword	0xd778ecca5e2f18f0
	.xword	0xd6ef92576f8c3844
	.xword	0x3d1cd7820adb0949
	.xword	0x12aa73457733888b
	.xword	0xb8f89f8bf0cd6f1d
	.xword	0x927b0e64d1d9ad68
	.xword	0xae070244a944a553
	.xword	0x141deaa1021a65a6
	.xword	0x315cf82457181ebd
	.xword	0x1851e5f6e506e72b
	.xword	0xe5629d0104dec8df
	.xword	0x662815d1405c1656
	.xword	0x816fa080c3feecfd
	.xword	0xe96308e32f7e1c71
	.xword	0x0b26811d97b733eb
	.xword	0x73f66681d93cce52
	.xword	0xe92a9637c220616b
	.xword	0x4e58bb9652005929
	.xword	0x036ac518d8dc3a51
	.xword	0x1f2c34129a314b42
	.xword	0xc5bebd59f5dc30e1
	.xword	0xc050e76957f1fe84
	.xword	0x43ba45964d10b371
	.xword	0xfb11601b06f1e641
	.xword	0x92aba8e3720265d3
	.xword	0x8ee32fd6ea4ffbd6
	.xword	0x7871787155efc771
	.xword	0x9e7ee458676e3ce5
	.xword	0x23bb15819d92ba6f
	.xword	0xa1c7302d6fb88c07
	.xword	0x012c19752c0ed715
	.xword	0x10c643044aa348dd
	.xword	0x5aa4081eac97151d
	.xword	0x306f41e930569de0
	.xword	0x3c834deb0e3851db
	.xword	0x25a4b74c5129860c
	.xword	0x1ffc6a5d6cc76643
	.xword	0xfd0ce48c3478e8ff
	.xword	0x143da72317813867
	.xword	0xe3441047b4a9ee12
	.xword	0xc67ae9ebed3d48f1
	.xword	0xd356491e5e670723
	.xword	0x6890066727786453
	.xword	0x65d2da691292d3c0
	.xword	0x8e04995faa6b70d2
	.xword	0xcab92148e92c8d60
	.xword	0xef976cf1962a2379
	.xword	0x13e35e78506b2042
	.xword	0xaa623370af69492e
	.xword	0xc61a632440b44dba
	.xword	0x1dba7bc95c93e89d
	.xword	0xf61fc1376d7c3ae7
	.xword	0xdcad90702ff8e839
	.xword	0x19a1b0a0fc21c428
	.xword	0xf85e9ecf22c3abb2
	.xword	0x999e96fff4843c45
	.xword	0xd9a69797d8b7fa45
	.xword	0xbb55ecb2e3ab50a7
	.xword	0x742bfeaffce4996a
	.xword	0x72744f76c4767e42
	.xword	0xb5f74ca073c60203
	.xword	0xc4f49e72d5e70c36
	.xword	0x18c45b8983237ac1
	.xword	0xf65e7cd9a4cfa720
	.xword	0x1dd118df4358233c
	.xword	0xec22416f2dc99268
	.xword	0xa5b3ebd3ada04932
	.xword	0xf05f7f85976fdcd2
	.xword	0xbb9f302e0f2de92a
	.xword	0xb683e8b64076ebf8
	.xword	0x943aa91ddd2d56ee
	.xword	0x886aa4b8332068a2
	.xword	0xf58bea1b0ca88562
	.xword	0xc51ab28c2d98b926
	.xword	0xa213e7c568b2805b
	.xword	0xc6499508995e3fd1
	.xword	0xcc0f696d50182680
	.xword	0x195fc7f5a2b306aa
	.xword	0x4950adc7a3293d53
	.xword	0x75b5ba3ebcaaff4f
	.xword	0xddbc0870e7038514
	.xword	0x7f976f90155283fa
	.xword	0xf56fb64bd97c5c98
	.xword	0x3c29db54d0265c59
	.xword	0xf0c639de1618e7e8
	.xword	0x9a7abe59d72ac8c0
	.xword	0xea8cbf10a2977ffa
	.xword	0x1cbab605adf60628
	.xword	0xeea782311e15dbc1
	.xword	0x1d3984311ce0358a
	.xword	0xf2542821ec05c745
	.xword	0xc80328b0e4505c04
	.xword	0x7010a961ac9f10df
	.xword	0xda81fa5a79163403
	.xword	0x6d58ffd968bfb82b
	.xword	0x78f0d9444be830d6
	.xword	0x5bd87316c37f3b44
	.xword	0xe78cb6067a2fcc2b
	.xword	0xffcf73ec3f6f3785
	.xword	0x325f10f7b80487b6
	.xword	0x5737210e000cf48d
	.xword	0x1c4132312fb9ccd8
	.xword	0xa396e41a2ac42429
	.xword	0x6ad54af622c461a7
	.xword	0xa7ba0fc13f08519e
	.xword	0xdae17598e40dbf1b
	.xword	0x92985b604f1e5ce5
	.xword	0x36d779c8019cf6df
	.xword	0xcc72f87c251a8505
	.xword	0x8a6bead16ffa063e
	.xword	0x15534be2abfc4b01
	.xword	0x3ec6742bb509867e
	.xword	0xa56aa2482fbc0431
	.xword	0xf26ed2f40f082881
	.xword	0xa968ff78c968f53f
	.xword	0x2b7c64f6d4e71116
	.xword	0x0042b1ffaf1a4180
	.xword	0xe9dea4e70ea3d6b2
	.xword	0x42fd3ff71d56ebda
	.xword	0xb902b0f97fa23cb5
	.xword	0xf28fe7afce006532
	.xword	0x40e7346093f72a4a
	.xword	0xdaadb39db6ce6317
	.xword	0x5ba5db77e8e62c82
	.xword	0xb85b3c602cc96b1d
	.xword	0x971c827f8a494e02
	.xword	0xbdd20b5ab24eb9fd
	.xword	0x747deea122b5a719
	.xword	0x1767d89307db8b45
	.xword	0x56181d0844228494
	.xword	0x625cd1b23011aa8c
	.xword	0x239384d580be50cd
	.xword	0xe3b4622acb22708b
	.xword	0xb9088f766f10f2ab
	.xword	0xb349c00c7d380bc4
	.xword	0xe8c2d5b2738a4287
	.xword	0xe051e4fb898c6d77
	.xword	0xfbbed4a7bef88e3c
	.xword	0x1aff8b8aefed97e6
	.xword	0x9f8e5bf695740e86
	.xword	0xca49fca87d49adeb
	.xword	0xdd0bc5a1bb9e51b0
	.xword	0xd0b4c08a769f49a9
	.xword	0xdce72f47fcb7a758
	.xword	0xc652989f7f375fd3
	.xword	0x1d5061050f9123de
	.xword	0xd7ae652bbd69e4d3
	.xword	0xaaf76fc2d87f837d
	.xword	0xbf4aac594097d20e
	.xword	0xd88d3ed13512d25b
	.xword	0xe0223e7b560fa97b
	.xword	0x16de36bc0dd5f535
	.xword	0x550ccb9dfef9555c
	.xword	0x56dd604ba8168923
	.xword	0x09a3a7ea7ac6e83c
	.xword	0x9da96fe4e21d8584
	.xword	0x143c97c7bdc0dd6c
	.xword	0xff3de778556c9d27
	.xword	0xe5648a99339dd6b5
	.xword	0x8182b06c8571aaf0
	.align 0x80000
	.data
data_start_7:

	.xword	0x25d3c6a61a3ef570
	.xword	0x085f9154e8874d7a
	.xword	0x9af5df59c5e93d1e
	.xword	0x84f03122369314af
	.xword	0xcedf69a2262eb678
	.xword	0x8ab20bdde72c619a
	.xword	0x8deb6fec89715fe9
	.xword	0x64252e1d15710e90
	.xword	0xa832d17d23a96131
	.xword	0xd9c32533107a5cf0
	.xword	0x47ed957a772f16a3
	.xword	0xca05e2aa9e98e255
	.xword	0x5778befc74620e85
	.xword	0x7b1d14d8d0e29b31
	.xword	0x4385c94b5dbfa743
	.xword	0x22278dd3d4e9a2ca
	.xword	0x2f6c1030d62a2ac7
	.xword	0x324089b69f0bd30b
	.xword	0x06f4d1e5263a4200
	.xword	0x39ec43577f64f63e
	.xword	0x388c5a3293bdf95f
	.xword	0x81c29917482f399d
	.xword	0xd1fe7af998cfb4b9
	.xword	0x7f00c26b27013ee1
	.xword	0xbf48f810cb50d42f
	.xword	0xe5fc1250c92bd873
	.xword	0x3164eb3015a231b7
	.xword	0x7c4b655bf4758f8d
	.xword	0xad69ff9612aa8174
	.xword	0x99f09e52130bf065
	.xword	0x8a79a540975ed954
	.xword	0xc8f970902109cba8
	.xword	0x7670126f0b60ecd9
	.xword	0x435ecbeb78b84726
	.xword	0x8243c4b1902ba274
	.xword	0x29bddda9876877e0
	.xword	0x8cad2100c9e3a3aa
	.xword	0x72df07e4316617ca
	.xword	0x0ae85d97e3bff754
	.xword	0xe7bf3beaaeb6d745
	.xword	0x0b9697d909a96c0b
	.xword	0xc58fb39f542d2d98
	.xword	0x93dfeaa783fc6636
	.xword	0xfd8d8cfe2135a6a8
	.xword	0x8694e096276b00f7
	.xword	0x7ef04c44a7ce479d
	.xword	0xb8162c50478d8c38
	.xword	0x21988360b087c21a
	.xword	0x1405c228dd032662
	.xword	0xffd79d1056affce8
	.xword	0x53af5a7d1c83f93f
	.xword	0x6259ad3c78729eb4
	.xword	0x900c6ebc3409e1f3
	.xword	0x84412c80091dc21a
	.xword	0xf34bb15b5bdcf22a
	.xword	0x51444f6afe4e1e5d
	.xword	0x19f1b95b8ae91da3
	.xword	0x0dc6d13fc8f7a90b
	.xword	0x5e31219ad0795d19
	.xword	0x15b8ac4390958530
	.xword	0x3f866c2f7cc0ca03
	.xword	0xd87aa8859ff95654
	.xword	0x157063df6a8badc7
	.xword	0x145e63e19fe2a762
	.xword	0x9de9cf77d54ff6cf
	.xword	0x0b9ef51367181b77
	.xword	0xfdc8b2bca122bca8
	.xword	0x2c03a088d08c3c92
	.xword	0xe54463dbe18072fb
	.xword	0x1ee19b6914dfd9d9
	.xword	0x5121f62f74351215
	.xword	0x8fbe1069467bdfaf
	.xword	0x61a9cb8e5066c0bd
	.xword	0x85bccf2b5a63c3c0
	.xword	0x6b31c95784639080
	.xword	0xa95e99e057105ccc
	.xword	0x3c0b7b7d35595e45
	.xword	0xe076e56a802bf764
	.xword	0x0e316f3d99b7cce5
	.xword	0x91d54e1231793a76
	.xword	0x56647d47af7f8513
	.xword	0x8844635d768d88b6
	.xword	0x4e26c0542b7055d2
	.xword	0x1de68e9f8572d02a
	.xword	0x63efb9a507b40112
	.xword	0x2a781a41871ee4a3
	.xword	0xd748f7bc15a6eb5d
	.xword	0x4450cd377a9ef417
	.xword	0x1963ca5aa6413fb7
	.xword	0x4ea92ccf8d863ec2
	.xword	0xd8977b8c8088377b
	.xword	0x0b278291af080c3f
	.xword	0x878d8ad43355617a
	.xword	0x4539f7ab7cba4c89
	.xword	0x98859f4f813aac07
	.xword	0x5efb1bdd9ecae803
	.xword	0x1664e357ab867204
	.xword	0x019fc0182319102c
	.xword	0x0cd29b6ccac3bd88
	.xword	0x50117e832363fd09
	.xword	0xe3c19db7ec92b318
	.xword	0xa65326a7705cdd73
	.xword	0x8fc78c288628c432
	.xword	0x7ded81195aee7d37
	.xword	0x2944ed62de4f573c
	.xword	0x5954ca1e424a4fd0
	.xword	0xcc0cab83750f96c9
	.xword	0x60a07fdfc749cb7d
	.xword	0xe07155b9fc201a6c
	.xword	0xe0dfc9fac7aace46
	.xword	0x3c317f9545ee7e60
	.xword	0x771cf64e8efbd8ed
	.xword	0xae0bd7a648b34770
	.xword	0xf5eacb421dcc0c2c
	.xword	0x2ce9400e192a53e6
	.xword	0xbf20ef2c505964b8
	.xword	0xd5b08aa079fac9c7
	.xword	0x32a8fc2f5a5326e6
	.xword	0x7222eec1b06a2a01
	.xword	0x2e20f2c52284f4af
	.xword	0x11e5f88cb6353878
	.xword	0xc913d12ba96b4ee1
	.xword	0xd9bdc5112f5a27dd
	.xword	0xe002dee6aee0b22b
	.xword	0x292e459a51d575b6
	.xword	0xfa71738adfd09a04
	.xword	0xfe6c6928675e7609
	.xword	0xbebb3c5ddec75d58
	.xword	0x0a433bb68fde9fd6
	.xword	0x12aa7d8a16cab934
	.xword	0x916a02c73217123a
	.xword	0x18fa156b6c511ea0
	.xword	0x81b08575a9715507
	.xword	0xfcbf9dfcc83e3206
	.xword	0x4b0e967c756cae94
	.xword	0x143dca19ca443f0b
	.xword	0xfc6549e3a72c8f4a
	.xword	0x50c7b406028f0ab3
	.xword	0xc30a0cc1e03b9c75
	.xword	0xe025e2c75672f559
	.xword	0xce74a32ec6e2a921
	.xword	0x3e1ae89f281f4463
	.xword	0x69cb7132123b532e
	.xword	0x06d5485ec63d8ff6
	.xword	0xa2c87a953866ce4b
	.xword	0x46a0c51020608f76
	.xword	0xacbb903dc7a118e5
	.xword	0xbbadbbde25fa6d63
	.xword	0xcdd6114908b93b43
	.xword	0xa88fb232dfdaa559
	.xword	0x1ea8c2516ef98d3b
	.xword	0x5ccdf5c4340742dd
	.xword	0x7fe7961b7f605514
	.xword	0xbd751f421d129285
	.xword	0xf7cce1304556199f
	.xword	0x777cd15dd1d5430b
	.xword	0x8da7309586ebaf86
	.xword	0x5b063f7a4d84212f
	.xword	0xbae85cb3cd891819
	.xword	0xfb0b82e0c520c490
	.xword	0x80b191b470fe1c25
	.xword	0xb8fd7621e8f492b1
	.xword	0xc04ba9e31057a7f0
	.xword	0x14570b413b45430b
	.xword	0xee2ad7deabc19164
	.xword	0x36cabe082bfb563e
	.xword	0xbd196337f912125e
	.xword	0x59b9cc9b54f76302
	.xword	0xb8d6eed81c1a48af
	.xword	0x7d607f1327865091
	.xword	0x821f14ead41253d5
	.xword	0x5e03a5ece1f0d65c
	.xword	0x3e53d8a5483319f6
	.xword	0x4703766e314f1269
	.xword	0x519ac97e699091f1
	.xword	0xce5de0f1feebd09e
	.xword	0x89b6a10f5f552f56
	.xword	0x39fc13233c335e10
	.xword	0x083b59917c8333d4
	.xword	0x9646218072d83c9d
	.xword	0xedfa0a8ddf411062
	.xword	0x7babb6790d00667e
	.xword	0x585326b5d395e0df
	.xword	0x1981296b46999e11
	.xword	0x9c1216a69e1841aa
	.xword	0xdf72280ee3949871
	.xword	0x77db1fe2a90c2a85
	.xword	0x8ecf57f46020e1a2
	.xword	0x816ebd3424d52808
	.xword	0x46044fa3cfcf4923
	.xword	0xc0b4bc126717ac2e
	.xword	0xaa0e64d7b24b03e6
	.xword	0x971ec6ee7a9d036b
	.xword	0x3fbef9fd370542ba
	.xword	0xea30a3e4ad215549
	.xword	0x41727bc287908f14
	.xword	0xd03f926e956cbaef
	.xword	0xef7664d21d888d30
	.xword	0xb95cea9a9b2cf6cf
	.xword	0x1cbf1aaa4f8259e0
	.xword	0x0ea7f924ca59fd61
	.xword	0x0d021f21230e4123
	.xword	0x34cbf7178949ba12
	.xword	0xe2338cb57744ddae
	.xword	0x5027c2db7e583d07
	.xword	0xa35051225d49ba85
	.xword	0xd06afc33273fb204
	.xword	0x55feaa4a642863db
	.xword	0x6471455e29764788
	.xword	0x4e584fad734c7031
	.xword	0x3a8a8bb9709490d1
	.xword	0xb4f9ea63bef8d028
	.xword	0x4f90b2ee8d3b0389
	.xword	0xff5f51f52be23285
	.xword	0x09f03ff51c0f73fc
	.xword	0x66341fe6c8d05677
	.xword	0x55e4c593c0e225bf
	.xword	0x72669830c9f6a3d1
	.xword	0xb03e2d0ec394b407
	.xword	0x86ac555f4ba9d4a1
	.xword	0xc1d42744fd9fb059
	.xword	0x253f68e4bf755db9
	.xword	0xc9164a0e03aa065a
	.xword	0x5eb24e25cfd26191
	.xword	0x83b3ee919217935d
	.xword	0x77cca623de976601
	.xword	0x375f7c2bd91991ad
	.xword	0x55f16e1086e09755
	.xword	0x2f7fa67d5b6a243e
	.xword	0xc767c01b2a76cadb
	.xword	0x2428ec5c37b35052
	.xword	0x3707cf324495b5a7
	.xword	0xc58c286134ec1197
	.xword	0x42ea9908a9d6e92a
	.xword	0x48a246a3daa5abbb
	.xword	0x876c595357ea1046
	.xword	0x718083fff59ff7f8
	.xword	0xbf5f377fd5c0576f
	.xword	0x5ac47c5cd3b95098
	.xword	0x0a2bbb60abdb4b77
	.xword	0xb709a39b4040d4bd
	.xword	0xfa380fabf8fa96cc
	.xword	0x81b4578e1d43767e
	.xword	0x74ce95fa4e0e7745
	.xword	0xb84a74d5f747a446
	.xword	0x2c3530b1c19bc38a
	.xword	0xf8e3c0a26bea8a9a
	.xword	0x2f78e8c30aeeb9d7
	.xword	0x5965b79e4ee3620b
	.xword	0xbe397eb8a751b747
	.xword	0x1cea35247c6db3a5
	.xword	0x90d55a414412f9fc
	.xword	0xc98f7955b8248633
	.xword	0xb05e69e80710c8ed
	.xword	0x350be6c5bdeb0b2e
	.xword	0x4aca73f55e52e7cf



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
