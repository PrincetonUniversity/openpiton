// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_50.s
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
   random seed:	536706262
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

	setx 0x4fa7192066060dfa, %g1, %g0
	setx 0x0303734165885fbe, %g1, %g1
	setx 0x5016804fda04be3c, %g1, %g2
	setx 0x57051ca74350e9e0, %g1, %g3
	setx 0xe68065789222f59d, %g1, %g4
	setx 0xeb03e430c18a9bd3, %g1, %g5
	setx 0xc70950fe6266da68, %g1, %g6
	setx 0x17aed92410c66e43, %g1, %g7
	setx 0x602067ae8866ec9b, %g1, %r16
	setx 0x9238a7ed52a9ebae, %g1, %r17
	setx 0x5724ad490c5e8d4b, %g1, %r18
	setx 0x9de79ce85c40d5b4, %g1, %r19
	setx 0x707041b463b01774, %g1, %r20
	setx 0x0a0fb28519cb9895, %g1, %r21
	setx 0x62b1706c12415c4b, %g1, %r22
	setx 0xeba327b1970823f2, %g1, %r23
	setx 0xddcae873df3aec06, %g1, %r24
	setx 0x984976ccc7d4bc03, %g1, %r25
	setx 0xc88b16d1c5963ff3, %g1, %r26
	setx 0x21448fdb4a98b37a, %g1, %r27
	setx 0x235ef7055c3319ec, %g1, %r28
	setx 0x135637dca57556d7, %g1, %r29
	setx 0x12159fccd6fb9820, %g1, %r30
	setx 0xfe82635bc7966011, %g1, %r31
	save
	setx 0xa28dc9c60d7083a4, %g1, %r16
	setx 0x21cd3a27b894cc3a, %g1, %r17
	setx 0xd23c09f0574045ac, %g1, %r18
	setx 0xa937580a4fcb890c, %g1, %r19
	setx 0x2911f490e52e3819, %g1, %r20
	setx 0x58b1854e91c7357f, %g1, %r21
	setx 0x7793aa69b7a51c42, %g1, %r22
	setx 0xc7864a4eb446f474, %g1, %r23
	setx 0x21d14ab157598b93, %g1, %r24
	setx 0x10abdd7083a36568, %g1, %r25
	setx 0xece725705329662d, %g1, %r26
	setx 0x560eb56eb3314130, %g1, %r27
	setx 0x1dd8daee87b4d4e0, %g1, %r28
	setx 0x2409c19046a7602b, %g1, %r29
	setx 0x26fa68cb08b950f6, %g1, %r30
	setx 0x0e044a0b364cc6d2, %g1, %r31
	save
	setx 0xa0f444ebd48db2fa, %g1, %r16
	setx 0x5219b91b165d19b2, %g1, %r17
	setx 0x202dce557b7d726e, %g1, %r18
	setx 0xe9088469e4c1d176, %g1, %r19
	setx 0x14c1bc1425a11d72, %g1, %r20
	setx 0xf8ae2ff77323f76c, %g1, %r21
	setx 0x766ebc99b61844a6, %g1, %r22
	setx 0xdc742554879e5874, %g1, %r23
	setx 0x6b27923518be2b16, %g1, %r24
	setx 0xa17a94eff0d59b46, %g1, %r25
	setx 0x8be478118d69366f, %g1, %r26
	setx 0x763e2f18e152fb25, %g1, %r27
	setx 0xa7b1cab30fcccdc4, %g1, %r28
	setx 0x6567d8cfe55efa82, %g1, %r29
	setx 0x4a8fa10d1af6fe6b, %g1, %r30
	setx 0x7d32d5b1aa0dc8ac, %g1, %r31
	save
	setx 0x46c35f8cb8931ef1, %g1, %r16
	setx 0xc0b78a4c68d94cdc, %g1, %r17
	setx 0x86c908a02f82f4a5, %g1, %r18
	setx 0x7ebb02277031680a, %g1, %r19
	setx 0x4c649a4bf15f01c2, %g1, %r20
	setx 0x1056544948966940, %g1, %r21
	setx 0x88bcd497ec5d96b5, %g1, %r22
	setx 0x730a66c2066ee2ab, %g1, %r23
	setx 0x252f36a09084cd18, %g1, %r24
	setx 0x24db4af7a838ef1b, %g1, %r25
	setx 0xd27cf84fe8219d9b, %g1, %r26
	setx 0xc70ed6f9a25d4849, %g1, %r27
	setx 0x1b56f828e53d31f5, %g1, %r28
	setx 0xc2d683b6f54810cd, %g1, %r29
	setx 0x7799296fd3166dee, %g1, %r30
	setx 0x3d3e65ff17f9b901, %g1, %r31
	save
	setx 0x7f1111ff472cfc3a, %g1, %r16
	setx 0x9549091768b0f484, %g1, %r17
	setx 0x46ae78a9ecd21191, %g1, %r18
	setx 0xdf2b01a7e7d58dea, %g1, %r19
	setx 0x1fe7626915e0c69d, %g1, %r20
	setx 0x48b227758912f92a, %g1, %r21
	setx 0x96ca253dfc6c2956, %g1, %r22
	setx 0xf0f96b647dc4d8e7, %g1, %r23
	setx 0x978ab420714bc6cc, %g1, %r24
	setx 0x9ee42d4ea71cd204, %g1, %r25
	setx 0xa92f0d12542425f1, %g1, %r26
	setx 0x35c17d58cf8ed044, %g1, %r27
	setx 0x57cb02f2d15661e0, %g1, %r28
	setx 0xc4502613007393aa, %g1, %r29
	setx 0xecaa9cf8f98076b2, %g1, %r30
	setx 0x43ea7868a301143e, %g1, %r31
	save
	setx 0x8b2997b98089111a, %g1, %r16
	setx 0x2e690e43cb8f804a, %g1, %r17
	setx 0xd8a29bc4e2754d1b, %g1, %r18
	setx 0x5fa52e18091b1a6e, %g1, %r19
	setx 0xcadbd050cb7cfe49, %g1, %r20
	setx 0x39a8e4139c08dc97, %g1, %r21
	setx 0xee0341fddf5d9fdd, %g1, %r22
	setx 0x7cfcc97335c3a2bc, %g1, %r23
	setx 0x3c3166247403f315, %g1, %r24
	setx 0xf7bd9065b058c1e7, %g1, %r25
	setx 0x02ef905aa5d529cd, %g1, %r26
	setx 0x13c0fee3b1656bea, %g1, %r27
	setx 0xbbcf92a47870e944, %g1, %r28
	setx 0xb8f9bf549064040a, %g1, %r29
	setx 0xacedfdebaeef9abd, %g1, %r30
	setx 0xdc65779826ca37df, %g1, %r31
	save
	setx 0x68575b3770573fee, %g1, %r16
	setx 0x465d4bb6d75ea94d, %g1, %r17
	setx 0xfbb1d99dc0fae3c0, %g1, %r18
	setx 0x5af46f23a59ec494, %g1, %r19
	setx 0x27b9f41c5dd581d4, %g1, %r20
	setx 0x559e433c7d8241d7, %g1, %r21
	setx 0x6f24e73efbdfaa63, %g1, %r22
	setx 0xbbd0913fc06040d7, %g1, %r23
	setx 0x236b36ff4586eb1f, %g1, %r24
	setx 0x4431cc4a0575542f, %g1, %r25
	setx 0x4bb286e3c5bdffa8, %g1, %r26
	setx 0xf3ee62a577f65b90, %g1, %r27
	setx 0xeff01fa3a728cf00, %g1, %r28
	setx 0xf80fb4f80ce0b510, %g1, %r29
	setx 0xece12a7a6d4e3de0, %g1, %r30
	setx 0x1ba750790c21cbd0, %g1, %r31
	save
	setx 0x3b224dc2b01e08ae, %g1, %r16
	setx 0xeca408cbdd5cc21f, %g1, %r17
	setx 0x368d0ddb66e008c0, %g1, %r18
	setx 0x76a23a0df9136181, %g1, %r19
	setx 0xcaf771872ab339ee, %g1, %r20
	setx 0x3cd02a8709be6cd7, %g1, %r21
	setx 0xa0dab44c008ae248, %g1, %r22
	setx 0xd5e81ee4016517f9, %g1, %r23
	setx 0x4e2b44cf7d03935a, %g1, %r24
	setx 0x766cdea77fdd86e0, %g1, %r25
	setx 0x5c5d7f163a4ed7a3, %g1, %r26
	setx 0x1f9128840604bb98, %g1, %r27
	setx 0xbbdfd3f263d6ddfb, %g1, %r28
	setx 0x6f3ce7d0c3ce96bd, %g1, %r29
	setx 0x1b5b94c437e3a7c0, %g1, %r30
	setx 0xdd5216cd3f56f990, %g1, %r31
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
	setx	0x34e2c7c300003e14, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d9520c1  ! 4: WRPR_PSTATE_I	wrpr	%r20, 0x00c1, %pstate
	.word 0xbfe5a107  ! 5: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e0e4  ! 8: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0xb5e560ca  ! 13: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4a006  ! 16: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4217d  ! 20: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe56036  ! 22: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3357001  ! 25: SRLX_I	srlx	%r21, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 26: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46182  ! 29: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5a105  ! 31: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe56129  ! 35: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 42: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194201c  ! 44: WRPR_PIL_I	wrpr	%r16, 0x001c, %pil
	.word 0xbaa5a047  ! 50: SUBcc_I	subcc 	%r22, 0x0047, %r29
	.word 0xbfe460be  ! 53: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5217e  ! 54: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e56163  ! 56: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1540000  ! 57: RDPR_GL	<illegal instruction>
	setx	0xe60dd84f00009b03, %g1, %r10
	.word 0x839a8000  ! 59: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x859460db  ! 67: WRPR_TSTATE_I	wrpr	%r17, 0x00db, %tstate
	.word 0xb5e5201b  ! 68: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 73: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e14f  ! 77: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb6b54000  ! 82: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xb7e4e183  ! 86: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe420a6  ! 88: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e4a045  ! 95: SAVE_I	save	%r18, 0x0001, %r25
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e121  ! 104: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8194e09b  ! 107: WRPR_TPC_I	wrpr	%r19, 0x009b, %tpc
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1d9  ! 119: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e4615d  ! 120: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8d9420c7  ! 121: WRPR_PSTATE_I	wrpr	%r16, 0x00c7, %pstate
	.word 0xbd508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e520ca  ! 127: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5a123  ! 134: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4a039  ! 135: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4e1b3  ! 137: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x85942150  ! 140: WRPR_TSTATE_I	wrpr	%r16, 0x0150, %tstate
	.word 0xb80c8000  ! 143: AND_R	and 	%r18, %r0, %r28
	.word 0xb9518000  ! 151: RDPR_PSTATE	<illegal instruction>
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 154: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1ee  ! 157: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e4214a  ! 159: SAVE_I	save	%r16, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb51c000  ! 161: RDPR_TL	<illegal instruction>
	.word 0xb1e4e020  ! 162: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460d9  ! 169: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e460e3  ! 170: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_4, %g1, %r17
	.word 0x9195e10e  ! 175: WRPR_PIL_I	wrpr	%r23, 0x010e, %pil
	.word 0xb3e4a12c  ! 176: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e560ff  ! 177: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e42009  ! 178: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4a0bb  ! 179: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4a0f7  ! 184: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4e0f2  ! 186: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4a154  ! 187: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e461dd  ! 188: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4e110  ! 190: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xbfe4a0bc  ! 193: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e46045  ! 194: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421ec  ! 196: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9480000  ! 202: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbbe4a0a5  ! 203: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xb7e5e17b  ! 206: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb53cb001  ! 210: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xbde42100  ! 211: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde561d0  ! 212: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe4e135  ! 217: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5480000  ! 218: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8795a1d7  ! 219: WRPR_TT_I	wrpr	%r22, 0x01d7, %tt
	setx	data_start_1, %g1, %r17
	.word 0xb1e560df  ! 223: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8794e1b6  ! 224: WRPR_TT_I	wrpr	%r19, 0x01b6, %tt
	.word 0xb7e46043  ! 226: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1e1  ! 232: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1540000  ! 237: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 240: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e421bc  ! 241: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e52137  ! 244: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8995e1d7  ! 245: WRPR_TICK_I	wrpr	%r23, 0x01d7, %tick
	.word 0xbfe4a184  ! 248: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4e157  ! 254: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 263: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r21
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5c000  ! 274: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xbfe42162  ! 275: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5e084  ! 276: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5e00b  ! 277: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe420df  ! 278: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x91942033  ! 279: WRPR_PIL_I	wrpr	%r16, 0x0033, %pil
	.word 0xbfe561c6  ! 283: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4a189  ! 284: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e4a00a  ! 286: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb950c000  ! 292: RDPR_TT	<illegal instruction>
	.word 0xbde5e1b7  ! 293: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8795a10c  ! 297: WRPR_TT_I	wrpr	%r22, 0x010c, %tt
	.word 0xbbe4a1a7  ! 302: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 307: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1510000  ! 308: RDPR_TICK	<illegal instruction>
	.word 0xb9518000  ! 310: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e52118  ! 312: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d94e069  ! 314: WRPR_PSTATE_I	wrpr	%r19, 0x0069, %pstate
	.word 0xb7e520bc  ! 319: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5e032  ! 323: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe5e01e  ! 324: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e4612c  ! 325: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4a114  ! 327: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4601c  ! 330: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x9195a036  ! 336: WRPR_PIL_I	wrpr	%r22, 0x0036, %pil
	.word 0xbd520000  ! 340: RDPR_PIL	<illegal instruction>
	.word 0xbfe5e18c  ! 342: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e461b9  ! 346: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4e17a  ! 350: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x5f6578b90000dd8b, %g1, %r10
	.word 0x839a8000  ! 353: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf2cc000  ! 359: SLL_R	sll 	%r19, %r0, %r31
	.word 0xb7e5e131  ! 360: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4a024  ! 361: SAVE_I	save	%r18, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 362: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb33df001  ! 365: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb1e42084  ! 366: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb21da182  ! 368: XOR_I	xor 	%r22, 0x0182, %r25
	.word 0xb7e52134  ! 370: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5a119  ! 373: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb37d2401  ! 374: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xbb345000  ! 376: SRLX_R	srlx	%r17, %r0, %r29
	setx	0x392bcff40000ae9e, %g1, %r10
	.word 0x819a8000  ! 377: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7520000  ! 379: RDPR_PIL	<illegal instruction>
	.word 0xb1e56079  ! 380: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbd504000  ! 381: RDPR_TNPC	<illegal instruction>
	.word 0xbc8d0000  ! 386: ANDcc_R	andcc 	%r20, %r0, %r30
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a122  ! 392: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e153  ! 393: SAVE_I	save	%r19, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 396: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e5e1a7  ! 397: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e56144  ! 402: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5e1bd  ! 403: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a50000  ! 408: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xbde5e18a  ! 409: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4e1c1  ! 410: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd2c5000  ! 411: SLLX_R	sllx	%r17, %r0, %r30
	.word 0xb1e4219b  ! 416: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb508000  ! 418: RDPR_TSTATE	<illegal instruction>
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521ce  ! 421: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd540000  ! 422: RDPR_GL	<illegal instruction>
	.word 0xbbe5a0b4  ! 424: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4214d  ! 425: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8195a0ed  ! 427: WRPR_TPC_I	wrpr	%r22, 0x00ed, %tpc
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46058  ! 431: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e46079  ! 433: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbb51c000  ! 435: RDPR_TL	<illegal instruction>
	.word 0xbbe4610a  ! 437: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e420be  ! 438: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_0, %g1, %r16
	.word 0x87956016  ! 442: WRPR_TT_I	wrpr	%r21, 0x0016, %tt
	.word 0xb9e4e123  ! 443: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe42066  ! 446: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a124  ! 450: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e420f6  ! 451: SAVE_I	save	%r16, 0x0001, %r24
	setx	0xa2e325e700001943, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95606c  ! 456: WRPR_PSTATE_I	wrpr	%r21, 0x006c, %pstate
	setx	data_start_0, %g1, %r23
	.word 0xbb643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0xb1e520cc  ! 461: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbf508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xbf518000  ! 463: RDPR_PSTATE	<illegal instruction>
	.word 0x8594a0fa  ! 467: WRPR_TSTATE_I	wrpr	%r18, 0x00fa, %tstate
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420dc  ! 471: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0xb9e4608e  ! 477: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xb81d8000  ! 482: XOR_R	xor 	%r22, %r0, %r28
	.word 0xb151c000  ! 484: RDPR_TL	<illegal instruction>
	.word 0xbbe42183  ! 485: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5e105  ! 488: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e52046  ! 491: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8994206f  ! 492: WRPR_TICK_I	wrpr	%r16, 0x006f, %tick
	.word 0xb5e5e10c  ! 496: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5e04c  ! 497: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb4354000  ! 498: ORN_R	orn 	%r21, %r0, %r26
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1f1  ! 503: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe52116  ! 505: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb2aca019  ! 507: ANDNcc_I	andncc 	%r18, 0x0019, %r25
	setx	0xa6510ac40000bcd3, %g1, %r10
	.word 0x819a8000  ! 510: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xb5e5614c  ! 525: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e52015  ! 530: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e4e01c  ! 531: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8995e13d  ! 533: WRPR_TICK_I	wrpr	%r23, 0x013d, %tick
	setx	0xfa58bd740000299d, %g1, %r10
	.word 0x819a8000  ! 538: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe4e061  ! 540: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919561b5  ! 543: WRPR_PIL_I	wrpr	%r21, 0x01b5, %pil
	.word 0xb7e5204a  ! 545: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e42061  ! 548: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4a170  ! 549: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9500000  ! 550: RDPR_TPC	<illegal instruction>
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521d8  ! 553: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb21c6139  ! 555: XOR_I	xor 	%r17, 0x0139, %r25
	.word 0xbd643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xb9e421ac  ! 561: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde421d0  ! 565: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e4e1ef  ! 568: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb508000  ! 575: RDPR_TSTATE	<illegal instruction>
	.word 0xbb641800  ! 576: MOVcc_R	<illegal instruction>
	.word 0xbbe52189  ! 579: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0d9  ! 584: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e461ed  ! 587: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3500000  ! 589: RDPR_TPC	<illegal instruction>
	.word 0xb7e560c7  ! 590: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe421ab  ! 591: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a164  ! 595: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a022  ! 600: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4a06b  ! 601: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4a090  ! 603: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e461da  ! 606: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e4e1dd  ! 610: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb68d616a  ! 612: ANDcc_I	andcc 	%r21, 0x016a, %r27
	mov	1, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9518000  ! 620: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e5a033  ! 621: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbeb5c000  ! 622: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xb1e560bf  ! 624: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e56176  ! 625: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8d94212b  ! 626: WRPR_PSTATE_I	wrpr	%r16, 0x012b, %pstate
	.word 0xb1504000  ! 632: RDPR_TNPC	<illegal instruction>
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4a074  ! 634: ADDCcc_I	addccc 	%r18, 0x0074, %r29
	.word 0xbbe4e0b3  ! 635: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xb93dd000  ! 638: SRAX_R	srax	%r23, %r0, %r28
	setx	data_start_7, %g1, %r16
	.word 0xb6858000  ! 640: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xb1e461f0  ! 642: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e5e156  ! 644: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde420f6  ! 647: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8395a076  ! 648: WRPR_TNPC_I	wrpr	%r22, 0x0076, %tnpc
	.word 0xbde4a1e0  ! 649: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5e0d8  ! 654: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8795e1f9  ! 657: WRPR_TT_I	wrpr	%r23, 0x01f9, %tt
	.word 0x8d94e1bd  ! 661: WRPR_PSTATE_I	wrpr	%r19, 0x01bd, %pstate
	setx	0xb203108c0000e99c, %g1, %r10
	.word 0x819a8000  ! 663: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4e168  ! 665: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x85942182  ! 668: WRPR_TSTATE_I	wrpr	%r16, 0x0182, %tstate
	.word 0xb9518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e42151  ! 672: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4a0f2  ! 673: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8195a04e  ! 675: WRPR_TPC_I	wrpr	%r22, 0x004e, %tpc
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46139  ! 678: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4e1c1  ! 681: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb22da001  ! 684: ANDN_I	andn 	%r22, 0x0001, %r25
	.word 0xbbe5a0b1  ! 687: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8995613d  ! 688: WRPR_TICK_I	wrpr	%r21, 0x013d, %tick
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5200e  ! 691: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e520fb  ! 694: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4e1a9  ! 695: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e52014  ! 696: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb5e4a13e  ! 702: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd500000  ! 703: RDPR_TPC	<illegal instruction>
	.word 0xb37c0400  ! 704: MOVR_R	movre	%r16, %r0, %r25
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5602d  ! 709: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_4, %g1, %r21
	.word 0xb6248000  ! 712: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbde4e18a  ! 717: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb508000  ! 718: RDPR_TSTATE	<illegal instruction>
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56163  ! 720: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb150c000  ! 722: RDPR_TT	<illegal instruction>
	.word 0xbde561e8  ! 723: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4e03b  ! 724: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4e08d  ! 725: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735c000  ! 727: SRL_R	srl 	%r23, %r0, %r27
	.word 0xb9e520e8  ! 730: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4a04a  ! 736: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe56008  ! 738: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde42061  ! 741: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4202b  ! 743: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbb50c000  ! 745: RDPR_TT	<illegal instruction>
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1a4  ! 753: SAVE_I	save	%r22, 0x0001, %r27
	setx	0xcdedb6a30000ac09, %g1, %r10
	.word 0x819a8000  ! 754: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb950c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 756: RDPR_TPC	<illegal instruction>
	.word 0xbde5e194  ! 757: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5e05c  ! 760: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4a174  ! 762: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e1f0  ! 766: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5641800  ! 769: MOVcc_R	<illegal instruction>
	.word 0xbde4a132  ! 771: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 780: RDPR_TT	<illegal instruction>
	.word 0xb1e460b5  ! 781: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbb480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_5, %g1, %r18
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56144  ! 800: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb32c5000  ! 801: SLLX_R	sllx	%r17, %r0, %r25
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00dc000  ! 815: AND_R	and 	%r23, %r0, %r24
	.word 0xbbe4a0eb  ! 819: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e4a0f8  ! 821: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5e13b  ! 822: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5e1c1  ! 825: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8794a179  ! 826: WRPR_TT_I	wrpr	%r18, 0x0179, %tt
	.word 0xbde4200a  ! 830: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e5a168  ! 833: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2ac4000  ! 834: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0xb1e5a0d7  ! 837: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 849: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 856: MOVcc_R	<illegal instruction>
	.word 0xb3e5e1a7  ! 861: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5e0c6  ! 862: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde560ed  ! 863: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e521e3  ! 865: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a13f  ! 872: WRPR_PSTATE_I	wrpr	%r18, 0x013f, %pstate
	.word 0xbfe4e097  ! 877: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4e15a  ! 879: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba256116  ! 881: SUB_I	sub 	%r21, 0x0116, %r29
	.word 0xb7e5e0be  ! 887: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b54000  ! 891: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xbc140000  ! 892: OR_R	or 	%r16, %r0, %r30
	.word 0xb350c000  ! 893: RDPR_TT	<illegal instruction>
	.word 0xbde4a00a  ! 896: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e52062  ! 898: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e561ef  ! 899: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e420f9  ! 902: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e46075  ! 903: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4e0b2  ! 904: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbeb54000  ! 905: ORNcc_R	orncc 	%r21, %r0, %r31
	.word 0xbde4a176  ! 911: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8195a0c4  ! 913: WRPR_TPC_I	wrpr	%r22, 0x00c4, %tpc
	.word 0xbde5a034  ! 914: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde46070  ! 915: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e421d5  ! 917: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5610b  ! 918: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e520b1  ! 921: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe460f9  ! 925: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb351c000  ! 927: RDPR_TL	<illegal instruction>
	.word 0xb3e5a043  ! 928: SAVE_I	save	%r22, 0x0001, %r25
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52074  ! 931: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e5e1c6  ! 932: SAVE_I	save	%r23, 0x0001, %r27
	setx	0x9ad7a27800007b01, %g1, %r10
	.word 0x819a8000  ! 937: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e520ef  ! 938: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbea44000  ! 939: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xb1e5a05b  ! 941: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0xb7e5a18f  ! 944: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5a0ce  ! 945: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0xb7e42044  ! 951: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e5e134  ! 952: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e09a  ! 955: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_6, %g1, %r16
	.word 0xbfe4a013  ! 961: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5608f  ! 962: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e520f3  ! 966: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d94a02c  ! 967: WRPR_PSTATE_I	wrpr	%r18, 0x002c, %pstate
	.word 0xb5e4a14c  ! 970: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5a020  ! 973: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e5e0c7  ! 975: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e56116  ! 977: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5e096  ! 981: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2846094  ! 987: ADDcc_I	addcc 	%r17, 0x0094, %r25
	.word 0xbd510000  ! 989: RDPR_TICK	<illegal instruction>
	setx	0x6279e9e00004e02, %g1, %r10
	.word 0x819a8000  ! 992: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95e0d2  ! 996: WRPR_PSTATE_I	wrpr	%r23, 0x00d2, %pstate
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
	setx	0x149cbcf300001901, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95611f  ! 4: WRPR_PSTATE_I	wrpr	%r21, 0x011f, %pstate
	.word 0xf835e1c4  ! 6: STH_I	sth	%r28, [%r23 + 0x01c4]
	.word 0xbd510000  ! 10: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf13d8000  ! 11: STDF_R	std	%f24, [%r0, %r22]
	.word 0xfe3d2045  ! 12: STD_I	std	%r31, [%r20 + 0x0045]
	.word 0xf2758000  ! 15: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf034600d  ! 17: STH_I	sth	%r24, [%r17 + 0x000d]
	.word 0xf434e19a  ! 21: STH_I	sth	%r26, [%r19 + 0x019a]
	.word 0xbb353001  ! 25: SRLX_I	srlx	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 26: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc3c8000  ! 27: STD_R	std	%r30, [%r18 + %r0]
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22de1d3  ! 32: STB_I	stb	%r25, [%r23 + 0x01d3]
	.word 0xfc75c000  ! 33: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfa758000  ! 34: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfb3c0000  ! 36: STDF_R	std	%f29, [%r0, %r16]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 42: RDPR_TPC	rdpr	%tpc, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9195a08c  ! 44: WRPR_PIL_I	wrpr	%r22, 0x008c, %pil
	.word 0xf42c2054  ! 46: STB_I	stb	%r26, [%r16 + 0x0054]
	.word 0xfe24a1f7  ! 47: STW_I	stw	%r31, [%r18 + 0x01f7]
	.word 0xb0a4a0a8  ! 50: SUBcc_I	subcc 	%r18, 0x00a8, %r24
	.word 0xf0248000  ! 55: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xb5540000  ! 57: RDPR_GL	rdpr	%-, %r26
	setx	0x27ef44e700006c08, %g1, %r10
	.word 0x839a8000  ! 59: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x85946199  ! 67: WRPR_TSTATE_I	wrpr	%r17, 0x0199, %tstate
	.word 0xf425c000  ! 69: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf4752194  ! 70: STX_I	stx	%r26, [%r20 + 0x0194]
	.word 0xfa740000  ! 71: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfd3d6003  ! 72: STDF_I	std	%f30, [0x0003, %r21]
	mov	1, %r12
	.word 0x8f930000  ! 73: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab58000  ! 82: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xf424e06d  ! 84: STW_I	stw	%r26, [%r19 + 0x006d]
	.word 0xfd3da055  ! 89: STDF_I	std	%f30, [0x0055, %r22]
	.word 0xf83dc000  ! 90: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfe2c4000  ! 96: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf8248000  ! 101: STW_R	stw	%r28, [%r18 + %r0]
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x819421db  ! 107: WRPR_TPC_I	wrpr	%r16, 0x01db, %tpc
	.word 0xf2346037  ! 108: STH_I	sth	%r25, [%r17 + 0x0037]
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	.word 0xfa2d4000  ! 114: STB_R	stb	%r29, [%r21 + %r0]
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 118: STX_R	stx	%r24, [%r17 + %r0]
	.word 0x8d95a138  ! 121: WRPR_PSTATE_I	wrpr	%r22, 0x0138, %pstate
	.word 0xbd508000  ! 122: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfa2d6112  ! 124: STB_I	stb	%r29, [%r21 + 0x0112]
	.word 0xfa3da017  ! 126: STD_I	std	%r29, [%r22 + 0x0017]
	.word 0xf4340000  ! 132: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf02420d2  ! 133: STW_I	stw	%r24, [%r16 + 0x00d2]
	.word 0xff3dc000  ! 138: STDF_R	std	%f31, [%r0, %r23]
	.word 0xf225209c  ! 139: STW_I	stw	%r25, [%r20 + 0x009c]
	.word 0x8595e0e4  ! 140: WRPR_TSTATE_I	wrpr	%r23, 0x00e4, %tstate
	.word 0xff3de178  ! 142: STDF_I	std	%f31, [0x0178, %r23]
	.word 0xb40d4000  ! 143: AND_R	and 	%r21, %r0, %r26
	.word 0xfc242016  ! 147: STW_I	stw	%r30, [%r16 + 0x0016]
	.word 0xbb518000  ! 151: RDPR_PSTATE	rdpr	%pstate, %r29
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 154: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb551c000  ! 161: RDPR_TL	rdpr	%tl, %r26
	.word 0xf93d619c  ! 163: STDF_I	std	%f28, [0x019c, %r21]
	.word 0xf6340000  ! 164: STH_R	sth	%r27, [%r16 + %r0]
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75c000  ! 166: STX_R	stx	%r29, [%r23 + %r0]
	setx	data_start_5, %g1, %r22
	.word 0x9195615a  ! 175: WRPR_PIL_I	wrpr	%r21, 0x015a, %pil
	.word 0xfc3de16a  ! 180: STD_I	std	%r30, [%r23 + 0x016a]
	.word 0xf074c000  ! 181: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf475e104  ! 183: STX_I	stx	%r26, [%r23 + 0x0104]
	.word 0xf73d0000  ! 185: STDF_R	std	%f27, [%r0, %r20]
	.word 0xbf500000  ! 192: RDPR_TPC	rdpr	%tpc, %r31
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24e1fd  ! 201: STW_I	stw	%r31, [%r19 + 0x01fd]
	.word 0xb3480000  ! 202: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xf22c0000  ! 209: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb13cb001  ! 210: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xfa25c000  ! 215: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xb5480000  ! 218: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8795607c  ! 219: WRPR_TT_I	wrpr	%r21, 0x007c, %tt
	setx	data_start_4, %g1, %r16
	.word 0xf02de12d  ! 221: STB_I	stb	%r24, [%r23 + 0x012d]
	.word 0x879521a6  ! 224: WRPR_TT_I	wrpr	%r20, 0x01a6, %tt
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2246131  ! 228: STW_I	stw	%r25, [%r17 + 0x0131]
	.word 0xfa3d616e  ! 229: STD_I	std	%r29, [%r21 + 0x016e]
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ca152  ! 236: STB_I	stb	%r28, [%r18 + 0x0152]
	.word 0xb3540000  ! 237: RDPR_GL	rdpr	%-, %r25
	mov	1, %r12
	.word 0xa1930000  ! 240: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x899421e1  ! 245: WRPR_TICK_I	wrpr	%r16, 0x01e1, %tick
	.word 0xf634e177  ! 246: STH_I	sth	%r27, [%r19 + 0x0177]
	.word 0xfc258000  ! 252: STW_R	stw	%r30, [%r22 + %r0]
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6756102  ! 257: STX_I	stx	%r27, [%r21 + 0x0102]
	.word 0xf4258000  ! 258: STW_R	stw	%r26, [%r22 + %r0]
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 263: RDPR_GL	rdpr	%-, %r26
	.word 0xf8350000  ! 264: STH_R	sth	%r28, [%r20 + %r0]
	setx	data_start_7, %g1, %r18
	.word 0xf434e1ef  ! 268: STH_I	sth	%r26, [%r19 + 0x01ef]
	.word 0xf62da1d2  ! 269: STB_I	stb	%r27, [%r22 + 0x01d2]
	.word 0xff3d203e  ! 270: STDF_I	std	%f31, [0x003e, %r20]
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c58000  ! 274: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0x919520c7  ! 279: WRPR_PIL_I	wrpr	%r20, 0x00c7, %pil
	.word 0xf6254000  ! 285: STW_R	stw	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb50c000  ! 292: RDPR_TT	rdpr	%tt, %r29
	.word 0xf73ca051  ! 294: STDF_I	std	%f27, [0x0051, %r18]
	.word 0x879460e4  ! 297: WRPR_TT_I	wrpr	%r17, 0x00e4, %tt
	.word 0xf625a141  ! 298: STW_I	stw	%r27, [%r22 + 0x0141]
	.word 0xf024c000  ! 303: STW_R	stw	%r24, [%r19 + %r0]
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 307: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf510000  ! 308: RDPR_TICK	rdpr	%tick, %r31
	.word 0xb5518000  ! 310: RDPR_PSTATE	<illegal instruction>
	.word 0xf93ce03b  ! 313: STDF_I	std	%f28, [0x003b, %r19]
	.word 0x8d946091  ! 314: WRPR_PSTATE_I	wrpr	%r17, 0x0091, %pstate
	.word 0xf73d0000  ! 315: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf02da1dd  ! 317: STB_I	stb	%r24, [%r22 + 0x01dd]
	.word 0xfc254000  ! 322: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf674e06e  ! 328: STX_I	stx	%r27, [%r19 + 0x006e]
	.word 0xfe2c21f8  ! 332: STB_I	stb	%r31, [%r16 + 0x01f8]
	.word 0xf53ce1cc  ! 333: STDF_I	std	%f26, [0x01cc, %r19]
	.word 0xfe758000  ! 335: STX_R	stx	%r31, [%r22 + %r0]
	.word 0x919520be  ! 336: WRPR_PIL_I	wrpr	%r20, 0x00be, %pil
	.word 0xb9520000  ! 340: RDPR_PIL	rdpr	%pil, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc242068  ! 351: STW_I	stw	%r30, [%r16 + 0x0068]
	setx	0x9f64adb60000b901, %g1, %r10
	.word 0x839a8000  ! 353: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc240000  ! 354: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfc3c0000  ! 355: STD_R	std	%r30, [%r16 + %r0]
	.word 0xf235c000  ! 356: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf0248000  ! 358: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xb72c0000  ! 359: SLL_R	sll 	%r16, %r0, %r27
	mov	2, %r12
	.word 0x8f930000  ! 362: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf2754000  ! 363: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xbf3d3001  ! 365: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0xf82cc000  ! 367: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xbc1d2117  ! 368: XOR_I	xor 	%r20, 0x0117, %r30
	.word 0xf2244000  ! 369: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xbb7da401  ! 374: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xfc2521e2  ! 375: STW_I	stw	%r30, [%r20 + 0x01e2]
	.word 0xbd355000  ! 376: SRLX_R	srlx	%r21, %r0, %r30
	setx	0x6a7ca7ea0000d941, %g1, %r10
	.word 0x819a8000  ! 377: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf87420a2  ! 378: STX_I	stx	%r28, [%r16 + 0x00a2]
	.word 0xbf520000  ! 379: RDPR_PIL	rdpr	%pil, %r31
	.word 0xb5504000  ! 381: RDPR_TNPC	<illegal instruction>
	.word 0xfd3c4000  ! 382: STDF_R	std	%f30, [%r0, %r17]
	.word 0xb68c8000  ! 386: ANDcc_R	andcc 	%r18, %r0, %r27
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d4000  ! 389: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfe250000  ! 390: STW_R	stw	%r31, [%r20 + %r0]
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 396: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf2250000  ! 400: STW_R	stw	%r25, [%r20 + %r0]
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83dc000  ! 405: STD_R	std	%r28, [%r23 + %r0]
	.word 0xbca4c000  ! 408: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbf2dd000  ! 411: SLLX_R	sllx	%r23, %r0, %r31
	.word 0xfa2da1cb  ! 412: STB_I	stb	%r29, [%r22 + 0x01cb]
	.word 0xfc2420a1  ! 414: STW_I	stw	%r30, [%r16 + 0x00a1]
	.word 0xb5508000  ! 418: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf83da050  ! 419: STD_I	std	%r28, [%r22 + 0x0050]
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 422: RDPR_GL	<illegal instruction>
	.word 0x81952071  ! 427: WRPR_TPC_I	wrpr	%r20, 0x0071, %tpc
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 435: RDPR_TL	rdpr	%tl, %r28
	.word 0xfc3c61e0  ! 436: STD_I	std	%r30, [%r17 + 0x01e0]
	setx	data_start_0, %g1, %r17
	.word 0xfb3c605a  ! 441: STDF_I	std	%f29, [0x005a, %r17]
	.word 0x87942016  ! 442: WRPR_TT_I	wrpr	%r16, 0x0016, %tt
	.word 0xf224a1a3  ! 444: STW_I	stw	%r25, [%r18 + 0x01a3]
	setx	0x53e9b2790000c893, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95e0f5  ! 456: WRPR_PSTATE_I	wrpr	%r23, 0x00f5, %pstate
	setx	data_start_4, %g1, %r22
	.word 0xb5643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0xb7508000  ! 462: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb1518000  ! 463: RDPR_PSTATE	<illegal instruction>
	.word 0xf42cc000  ! 465: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf434a1aa  ! 466: STH_I	sth	%r26, [%r18 + 0x01aa]
	.word 0x8594e1a3  ! 467: WRPR_TSTATE_I	wrpr	%r19, 0x01a3, %tstate
	.word 0xf4348000  ! 468: STH_R	sth	%r26, [%r18 + %r0]
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 470: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb5504000  ! 472: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf23cc000  ! 478: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf8250000  ! 479: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfb3d8000  ! 480: STDF_R	std	%f29, [%r0, %r22]
	.word 0xb3518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xb61cc000  ! 482: XOR_R	xor 	%r19, %r0, %r27
	.word 0xfe3da147  ! 483: STD_I	std	%r31, [%r22 + 0x0147]
	.word 0xbb51c000  ! 484: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf33ca181  ! 489: STDF_I	std	%f25, [0x0181, %r18]
	.word 0x89946089  ! 492: WRPR_TICK_I	wrpr	%r17, 0x0089, %tick
	.word 0xbe350000  ! 498: ORN_R	orn 	%r20, %r0, %r31
	.word 0xfc358000  ! 499: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfa3521ff  ! 500: STH_I	sth	%r29, [%r20 + 0x01ff]
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3d609d  ! 504: STD_I	std	%r29, [%r21 + 0x009d]
	.word 0xb0aca1e1  ! 507: ANDNcc_I	andncc 	%r18, 0x01e1, %r24
	setx	0x74c4616d00002957, %g1, %r10
	.word 0x819a8000  ! 510: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf83ca1ed  ! 511: STD_I	std	%r28, [%r18 + 0x01ed]
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0xfe3c205b  ! 521: STD_I	std	%r31, [%r16 + 0x005b]
	.word 0xfa3ca13c  ! 528: STD_I	std	%r29, [%r18 + 0x013c]
	.word 0xf675c000  ! 529: STX_R	stx	%r27, [%r23 + %r0]
	.word 0x8995e084  ! 533: WRPR_TICK_I	wrpr	%r23, 0x0084, %tick
	.word 0xf875e027  ! 534: STX_I	stx	%r28, [%r23 + 0x0027]
	.word 0xf42c4000  ! 536: STB_R	stb	%r26, [%r17 + %r0]
	setx	0x824b617a00003dcc, %g1, %r10
	.word 0x819a8000  ! 538: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91956033  ! 543: WRPR_PIL_I	wrpr	%r21, 0x0033, %pil
	.word 0xb1500000  ! 550: RDPR_TPC	rdpr	%tpc, %r24
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81de0aa  ! 555: XOR_I	xor 	%r23, 0x00aa, %r28
	.word 0xb7643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xf425c000  ! 557: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf22cc000  ! 558: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf62420e8  ! 559: STW_I	stw	%r27, [%r16 + 0x00e8]
	.word 0xf93ce168  ! 560: STDF_I	std	%f28, [0x0168, %r19]
	.word 0xf0244000  ! 564: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf634e006  ! 569: STH_I	sth	%r27, [%r19 + 0x0006]
	.word 0xf73d8000  ! 571: STDF_R	std	%f27, [%r0, %r22]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7508000  ! 575: RDPR_TSTATE	<illegal instruction>
	.word 0xbb641800  ! 576: MOVcc_R	<illegal instruction>
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43da057  ! 582: STD_I	std	%r26, [%r22 + 0x0057]
	.word 0xf02ce09c  ! 585: STB_I	stb	%r24, [%r19 + 0x009c]
	.word 0xbd500000  ! 589: RDPR_TPC	<illegal instruction>
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 594: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfc750000  ! 599: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb1508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xf63cc000  ! 605: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfa3da15e  ! 608: STD_I	std	%r29, [%r22 + 0x015e]
	.word 0xf4256098  ! 609: STW_I	stw	%r26, [%r21 + 0x0098]
	.word 0xb28da1fa  ! 612: ANDcc_I	andcc 	%r22, 0x01fa, %r25
	.word 0xf23d4000  ! 613: STD_R	std	%r25, [%r21 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe344000  ! 619: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbf518000  ! 620: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb2b40000  ! 622: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0x8d94602f  ! 626: WRPR_PSTATE_I	wrpr	%r17, 0x002f, %pstate
	.word 0xff3d4000  ! 629: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb5504000  ! 632: RDPR_TNPC	rdpr	%tnpc, %r26
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc4a1e7  ! 634: ADDCcc_I	addccc 	%r18, 0x01e7, %r30
	.word 0xb7518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xfc3c8000  ! 637: STD_R	std	%r30, [%r18 + %r0]
	.word 0xbd3cd000  ! 638: SRAX_R	srax	%r19, %r0, %r30
	setx	data_start_5, %g1, %r22
	.word 0xbc840000  ! 640: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xf63d4000  ! 643: STD_R	std	%r27, [%r21 + %r0]
	.word 0x83946017  ! 648: WRPR_TNPC_I	wrpr	%r17, 0x0017, %tnpc
	.word 0xf33da188  ! 651: STDF_I	std	%f25, [0x0188, %r22]
	.word 0xf62461ec  ! 656: STW_I	stw	%r27, [%r17 + 0x01ec]
	.word 0x8795e098  ! 657: WRPR_TT_I	wrpr	%r23, 0x0098, %tt
	.word 0xf474209f  ! 658: STX_I	stx	%r26, [%r16 + 0x009f]
	.word 0xf03ce115  ! 659: STD_I	std	%r24, [%r19 + 0x0115]
	.word 0xf6244000  ! 660: STW_R	stw	%r27, [%r17 + %r0]
	.word 0x8d952071  ! 661: WRPR_PSTATE_I	wrpr	%r20, 0x0071, %pstate
	setx	0x5bff887f00006bda, %g1, %r10
	.word 0x819a8000  ! 663: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x859420b3  ! 668: WRPR_TSTATE_I	wrpr	%r16, 0x00b3, %tstate
	.word 0xbb518000  ! 670: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf674e1c3  ! 671: STX_I	stx	%r27, [%r19 + 0x01c3]
	.word 0xfa25e1c8  ! 674: STW_I	stw	%r29, [%r23 + 0x01c8]
	.word 0x8194a174  ! 675: WRPR_TPC_I	wrpr	%r18, 0x0174, %tpc
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 683: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbc2de147  ! 684: ANDN_I	andn 	%r23, 0x0147, %r30
	.word 0x8994e02b  ! 688: WRPR_TICK_I	wrpr	%r19, 0x002b, %tick
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 690: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf53c61b4  ! 693: STDF_I	std	%f26, [0x01b4, %r17]
	.word 0xf074a139  ! 698: STX_I	stx	%r24, [%r18 + 0x0139]
	.word 0xf03d20d1  ! 699: STD_I	std	%r24, [%r20 + 0x00d1]
	.word 0xb9480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3500000  ! 703: RDPR_TPC	<illegal instruction>
	.word 0xb77c8400  ! 704: MOVR_R	movre	%r18, %r0, %r27
	.word 0xf875a1a0  ! 707: STX_I	stx	%r28, [%r22 + 0x01a0]
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	.word 0xbe244000  ! 712: SUB_R	sub 	%r17, %r0, %r31
	.word 0xfe74c000  ! 715: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfa3ce0fb  ! 716: STD_I	std	%r29, [%r19 + 0x00fb]
	.word 0xb9508000  ! 718: RDPR_TSTATE	<illegal instruction>
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 722: RDPR_TT	<illegal instruction>
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3348000  ! 727: SRL_R	srl 	%r18, %r0, %r25
	.word 0xf2350000  ! 728: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfa25a0f2  ! 731: STW_I	stw	%r29, [%r22 + 0x00f2]
	.word 0xfe3d61a2  ! 735: STD_I	std	%r31, [%r21 + 0x01a2]
	.word 0xfa75a017  ! 737: STX_I	stx	%r29, [%r22 + 0x0017]
	.word 0xf42c8000  ! 739: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfc248000  ! 742: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb750c000  ! 745: RDPR_TT	<illegal instruction>
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf6c4ff0d000009d9, %g1, %r10
	.word 0x819a8000  ! 754: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb750c000  ! 755: RDPR_TT	rdpr	%tt, %r27
	.word 0xbf500000  ! 756: RDPR_TPC	<illegal instruction>
	.word 0xfc742099  ! 763: STX_I	stx	%r30, [%r16 + 0x0099]
	.word 0xfa2c8000  ! 767: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb1641800  ! 769: MOVcc_R	<illegal instruction>
	.word 0xfe3461c5  ! 770: STH_I	sth	%r31, [%r17 + 0x01c5]
	.word 0xf6756105  ! 773: STX_I	stx	%r27, [%r21 + 0x0105]
	.word 0xbb500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 780: RDPR_TT	<illegal instruction>
	.word 0xb7480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_4, %g1, %r16
	.word 0xf4256169  ! 787: STW_I	stw	%r26, [%r21 + 0x0169]
	.word 0xfd3ce101  ! 788: STDF_I	std	%f30, [0x0101, %r19]
	.word 0xfa24e045  ! 790: STW_I	stw	%r29, [%r19 + 0x0045]
	.word 0xf675a072  ! 791: STX_I	stx	%r27, [%r22 + 0x0072]
	.word 0xf42c6176  ! 793: STB_I	stb	%r26, [%r17 + 0x0176]
	.word 0xfa74611b  ! 795: STX_I	stx	%r29, [%r17 + 0x011b]
	.word 0xfc7561e1  ! 797: STX_I	stx	%r30, [%r21 + 0x01e1]
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c5000  ! 801: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xf675a184  ! 802: STX_I	stx	%r27, [%r22 + 0x0184]
	.word 0xf63ca149  ! 804: STD_I	std	%r27, [%r18 + 0x0149]
	.word 0xfa75a1f1  ! 806: STX_I	stx	%r29, [%r22 + 0x01f1]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 808: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfe3ca1df  ! 811: STD_I	std	%r31, [%r18 + 0x01df]
	.word 0xfc3cc000  ! 814: STD_R	std	%r30, [%r19 + %r0]
	.word 0xba0dc000  ! 815: AND_R	and 	%r23, %r0, %r29
	.word 0xf0756147  ! 817: STX_I	stx	%r24, [%r21 + 0x0147]
	.word 0xf074c000  ! 823: STX_R	stx	%r24, [%r19 + %r0]
	.word 0x8794e1f8  ! 826: WRPR_TT_I	wrpr	%r19, 0x01f8, %tt
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbaac4000  ! 834: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xfd3ce1b8  ! 838: STDF_I	std	%f30, [0x01b8, %r19]
	.word 0xfa350000  ! 839: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf87521b7  ! 841: STX_I	stx	%r28, [%r20 + 0x01b7]
	.word 0xfe3dc000  ! 842: STD_R	std	%r31, [%r23 + %r0]
	.word 0xfe2da160  ! 843: STB_I	stb	%r31, [%r22 + 0x0160]
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6242104  ! 848: STW_I	stw	%r27, [%r16 + 0x0104]
	mov	0, %r12
	.word 0x8f930000  ! 849: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf82c4000  ! 850: STB_R	stb	%r28, [%r17 + %r0]
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 856: MOVcc_R	<illegal instruction>
	.word 0xf82ca148  ! 859: STB_I	stb	%r28, [%r18 + 0x0148]
	.word 0xf4744000  ! 864: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfd3d0000  ! 866: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf434a03c  ! 867: STH_I	sth	%r26, [%r18 + 0x003c]
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 869: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf62561cc  ! 870: STW_I	stw	%r27, [%r21 + 0x01cc]
	.word 0x8d956039  ! 872: WRPR_PSTATE_I	wrpr	%r21, 0x0039, %pstate
	.word 0xf874c000  ! 876: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xfa2ce165  ! 878: STB_I	stb	%r29, [%r19 + 0x0165]
	.word 0xf424e0a1  ! 880: STW_I	stw	%r26, [%r19 + 0x00a1]
	.word 0xb42461e5  ! 881: SUB_I	sub 	%r17, 0x01e5, %r26
	.word 0xf8744000  ! 883: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xfe2d4000  ! 885: STB_R	stb	%r31, [%r21 + %r0]
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b54000  ! 891: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xb6140000  ! 892: OR_R	or 	%r16, %r0, %r27
	.word 0xb550c000  ! 893: RDPR_TT	rdpr	%tt, %r26
	.word 0xfe748000  ! 894: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfe248000  ! 897: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfa2c8000  ! 900: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xbab54000  ! 905: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0x81942155  ! 913: WRPR_TPC_I	wrpr	%r16, 0x0155, %tpc
	.word 0xfa2ca02e  ! 916: STB_I	stb	%r29, [%r18 + 0x002e]
	.word 0xfc2da001  ! 922: STB_I	stb	%r30, [%r22 + 0x0001]
	.word 0xf83561ad  ! 926: STH_I	sth	%r28, [%r21 + 0x01ad]
	.word 0xbb51c000  ! 927: RDPR_TL	rdpr	%tl, %r29
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 933: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf13ce1b6  ! 934: STDF_I	std	%f24, [0x01b6, %r19]
	setx	0x79c0a000004a4d, %g1, %r10
	.word 0x819a8000  ! 937: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbea4c000  ! 939: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xbd520000  ! 942: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfa2c218c  ! 947: STB_I	stb	%r29, [%r16 + 0x018c]
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 950: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xfc248000  ! 965: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x8d94213e  ! 967: WRPR_PSTATE_I	wrpr	%r16, 0x013e, %pstate
	.word 0xff3c0000  ! 969: STDF_R	std	%f31, [%r0, %r16]
	.word 0xfa25c000  ! 971: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf434e0a0  ! 972: STH_I	sth	%r26, [%r19 + 0x00a0]
	.word 0xf074a1b3  ! 976: STX_I	stx	%r24, [%r18 + 0x01b3]
	.word 0xf8756172  ! 979: STX_I	stx	%r28, [%r21 + 0x0172]
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6358000  ! 985: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xbe84608a  ! 987: ADDcc_I	addcc 	%r17, 0x008a, %r31
	.word 0xbd510000  ! 989: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf83da1ac  ! 990: STD_I	std	%r28, [%r22 + 0x01ac]
	.word 0xf93c8000  ! 991: STDF_R	std	%f28, [%r0, %r18]
	setx	0x5d951df90000ff8a, %g1, %r10
	.word 0x819a8000  ! 992: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf635c000  ! 993: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf4352033  ! 994: STH_I	sth	%r26, [%r20 + 0x0033]
	.word 0x8d956150  ! 996: WRPR_PSTATE_I	wrpr	%r21, 0x0150, %pstate
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
	.word 0xf2550000  ! 2: LDSH_R	ldsh	[%r20 + %r0], %r25
	setx	0xd2df792f0000ff1c, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95e177  ! 4: WRPR_PSTATE_I	wrpr	%r23, 0x0177, %pstate
	.word 0xfe1c4000  ! 7: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xbd510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0xf844c000  ! 19: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf51cc000  ! 24: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xb534f001  ! 25: SRLX_I	srlx	%r19, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 26: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe440000  ! 30: LDSW_R	ldsw	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 42: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9195a0c9  ! 44: WRPR_PIL_I	wrpr	%r22, 0x00c9, %pil
	.word 0xf844602a  ! 45: LDSW_I	ldsw	[%r17 + 0x002a], %r28
	.word 0xb6a5a0b3  ! 50: SUBcc_I	subcc 	%r22, 0x00b3, %r27
	.word 0xfd1d8000  ! 51: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf31dc000  ! 52: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xb7540000  ! 57: RDPR_GL	<illegal instruction>
	setx	0xd82cec0f0000098d, %g1, %r10
	.word 0x839a8000  ! 59: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf644e06f  ! 60: LDSW_I	ldsw	[%r19 + 0x006f], %r27
	.word 0xf31d2109  ! 61: LDDF_I	ldd	[%r20, 0x0109], %f25
	.word 0xf404a02d  ! 63: LDUW_I	lduw	[%r18 + 0x002d], %r26
	.word 0xf21de049  ! 64: LDD_I	ldd	[%r23 + 0x0049], %r25
	.word 0xf05d4000  ! 65: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xfe444000  ! 66: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0x859520d6  ! 67: WRPR_TSTATE_I	wrpr	%r20, 0x00d6, %tstate
	mov	1, %r12
	.word 0x8f930000  ! 73: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe452183  ! 78: LDSW_I	ldsw	[%r20 + 0x0183], %r31
	.word 0xf24d8000  ! 79: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf654c000  ! 80: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xb6b50000  ! 82: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xf40d60ad  ! 91: LDUB_I	ldub	[%r21 + 0x00ad], %r26
	.word 0xff1c203a  ! 92: LDDF_I	ldd	[%r16, 0x003a], %f31
	.word 0xf844e14d  ! 93: LDSW_I	ldsw	[%r19 + 0x014d], %r28
	.word 0xf2440000  ! 94: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf244a1f6  ! 97: LDSW_I	ldsw	[%r18 + 0x01f6], %r25
	.word 0xf215e0c1  ! 98: LDUH_I	lduh	[%r23 + 0x00c1], %r25
	.word 0xfc040000  ! 100: LDUW_R	lduw	[%r16 + %r0], %r30
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1c61ee  ! 105: LDDF_I	ldd	[%r17, 0x01ee], %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8195e051  ! 107: WRPR_TPC_I	wrpr	%r23, 0x0051, %tpc
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xf81de088  ! 115: LDD_I	ldd	[%r23 + 0x0088], %r28
	.word 0xf654a1f5  ! 116: LDSH_I	ldsh	[%r18 + 0x01f5], %r27
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0d4  ! 121: WRPR_PSTATE_I	wrpr	%r18, 0x00d4, %pstate
	.word 0xb7508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xf404a1b9  ! 123: LDUW_I	lduw	[%r18 + 0x01b9], %r26
	.word 0xf804e00f  ! 125: LDUW_I	lduw	[%r19 + 0x000f], %r28
	.word 0xf65d8000  ! 129: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf60ce1d9  ! 130: LDUB_I	ldub	[%r19 + 0x01d9], %r27
	.word 0x8595a043  ! 140: WRPR_TSTATE_I	wrpr	%r22, 0x0043, %tstate
	.word 0xfe4c0000  ! 141: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xb80d4000  ! 143: AND_R	and 	%r21, %r0, %r28
	.word 0xf64d21c0  ! 145: LDSB_I	ldsb	[%r20 + 0x01c0], %r27
	.word 0xf8542044  ! 148: LDSH_I	ldsh	[%r16 + 0x0044], %r28
	.word 0xf045c000  ! 150: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb9518000  ! 151: RDPR_PSTATE	<illegal instruction>
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 153: LDUW_R	lduw	[%r18 + %r0], %r31
	mov	2, %r12
	.word 0xa1930000  ! 154: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd51c000  ! 161: RDPR_TL	<illegal instruction>
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91d0000  ! 167: LDDF_R	ldd	[%r20, %r0], %f28
	setx	data_start_7, %g1, %r18
	.word 0xfc0c4000  ! 173: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0x9194a14a  ! 175: WRPR_PIL_I	wrpr	%r18, 0x014a, %pil
	.word 0xf01cc000  ! 182: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf11c8000  ! 191: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xb3500000  ! 192: RDPR_TPC	rdpr	%tpc, %r25
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c2140  ! 197: LDX_I	ldx	[%r16 + 0x0140], %r25
	.word 0xfe150000  ! 198: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf65d4000  ! 200: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xb7480000  ! 202: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfa44c000  ! 204: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xbb520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xbf3cb001  ! 210: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xb3480000  ! 218: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8794e065  ! 219: WRPR_TT_I	wrpr	%r19, 0x0065, %tt
	setx	data_start_4, %g1, %r21
	.word 0xf05560c6  ! 222: LDSH_I	ldsh	[%r21 + 0x00c6], %r24
	.word 0x8794e0f9  ! 224: WRPR_TT_I	wrpr	%r19, 0x00f9, %tt
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 231: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfe44e198  ! 233: LDSW_I	ldsw	[%r19 + 0x0198], %r31
	.word 0xb1540000  ! 237: RDPR_GL	<illegal instruction>
	.word 0xf444c000  ! 238: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfe452117  ! 239: LDSW_I	ldsw	[%r20 + 0x0117], %r31
	mov	1, %r12
	.word 0xa1930000  ! 240: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0444000  ! 242: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xfa058000  ! 243: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0x8995e06b  ! 245: WRPR_TICK_I	wrpr	%r23, 0x006b, %tick
	.word 0xf24d8000  ! 250: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf24de173  ! 251: LDSB_I	ldsb	[%r23 + 0x0173], %r25
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805e067  ! 259: LDUW_I	lduw	[%r23 + 0x0067], %r28
	.word 0xf65dc000  ! 260: LDX_R	ldx	[%r23 + %r0], %r27
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 263: RDPR_GL	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xfc050000  ! 267: LDUW_R	lduw	[%r20 + %r0], %r30
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11c0000  ! 273: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xbac40000  ! 274: ADDCcc_R	addccc 	%r16, %r0, %r29
	.word 0x9194a0cc  ! 279: WRPR_PIL_I	wrpr	%r18, 0x00cc, %pil
	.word 0xf41561dc  ! 280: LDUH_I	lduh	[%r21 + 0x01dc], %r26
	.word 0xfc0d8000  ! 281: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xf24ca1e7  ! 282: LDSB_I	ldsb	[%r18 + 0x01e7], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb750c000  ! 292: RDPR_TT	<illegal instruction>
	.word 0x8795e114  ! 297: WRPR_TT_I	wrpr	%r23, 0x0114, %tt
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04da17e  ! 306: LDSB_I	ldsb	[%r22 + 0x017e], %r24
	mov	1, %r12
	.word 0xa1930000  ! 307: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1510000  ! 308: RDPR_TICK	rdpr	%tick, %r24
	.word 0xbd518000  ! 310: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94e044  ! 314: WRPR_PSTATE_I	wrpr	%r19, 0x0044, %pstate
	.word 0xfe5d6042  ! 318: LDX_I	ldx	[%r21 + 0x0042], %r31
	.word 0xfe15e159  ! 320: LDUH_I	lduh	[%r23 + 0x0159], %r31
	.word 0xf85d4000  ! 321: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf0458000  ! 326: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xfc5d8000  ! 334: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0x919560e7  ! 336: WRPR_PIL_I	wrpr	%r21, 0x00e7, %pil
	.word 0xf04cc000  ! 338: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xf00de135  ! 339: LDUB_I	ldub	[%r23 + 0x0135], %r24
	.word 0xb5520000  ! 340: RDPR_PIL	<illegal instruction>
	.word 0xf45521e8  ! 341: LDSH_I	ldsh	[%r20 + 0x01e8], %r26
	.word 0xf2542025  ! 343: LDSH_I	ldsh	[%r16 + 0x0025], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc4d619b  ! 348: LDSB_I	ldsb	[%r21 + 0x019b], %r30
	setx	0x5622d08f00001953, %g1, %r10
	.word 0x839a8000  ! 353: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa4d60fb  ! 357: LDSB_I	ldsb	[%r21 + 0x00fb], %r29
	.word 0xb52d8000  ! 359: SLL_R	sll 	%r22, %r0, %r26
	mov	1, %r12
	.word 0x8f930000  ! 362: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa0ce169  ! 364: LDUB_I	ldub	[%r19 + 0x0169], %r29
	.word 0xbb3d3001  ! 365: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xb61de082  ! 368: XOR_I	xor 	%r23, 0x0082, %r27
	.word 0xbf7ce401  ! 374: MOVR_I	movre	%r19, 0x1, %r31
	.word 0xb334d000  ! 376: SRLX_R	srlx	%r19, %r0, %r25
	setx	0x9bd029cc00000bc1, %g1, %r10
	.word 0x819a8000  ! 377: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7520000  ! 379: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb5504000  ! 381: RDPR_TNPC	<illegal instruction>
	.word 0xf05461e4  ! 383: LDSH_I	ldsh	[%r17 + 0x01e4], %r24
	.word 0xff1d8000  ! 384: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xb28c0000  ! 386: ANDcc_R	andcc 	%r16, %r0, %r25
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21560ad  ! 394: LDUH_I	lduh	[%r21 + 0x00ad], %r25
	.word 0xf8544000  ! 395: LDSH_R	ldsh	[%r17 + %r0], %r28
	mov	0, %r12
	.word 0x8f930000  ! 396: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa4ce1ab  ! 398: LDSB_I	ldsb	[%r19 + 0x01ab], %r29
	.word 0xfb1d8000  ! 399: LDDF_R	ldd	[%r22, %r0], %f29
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a44000  ! 408: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xb32cd000  ! 411: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xfa158000  ! 413: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf655e041  ! 415: LDSH_I	ldsh	[%r23 + 0x0041], %r27
	.word 0xb3508000  ! 418: RDPR_TSTATE	<illegal instruction>
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 422: RDPR_GL	<illegal instruction>
	.word 0xfa0da132  ! 426: LDUB_I	ldub	[%r22 + 0x0132], %r29
	.word 0x8194211e  ! 427: WRPR_TPC_I	wrpr	%r16, 0x011e, %tpc
	.word 0xfc45603a  ! 429: LDSW_I	ldsw	[%r21 + 0x003a], %r30
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 435: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0x8794a0d1  ! 442: WRPR_TT_I	wrpr	%r18, 0x00d1, %tt
	.word 0xf80d4000  ! 445: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xfc5ce053  ! 447: LDX_I	ldx	[%r19 + 0x0053], %r30
	.word 0xf2144000  ! 448: LDUH_R	lduh	[%r17 + %r0], %r25
	setx	0xd9a9645000003c15, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf055209f  ! 453: LDSH_I	ldsh	[%r20 + 0x009f], %r24
	.word 0xf405c000  ! 454: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0x8d9460d0  ! 456: WRPR_PSTATE_I	wrpr	%r17, 0x00d0, %pstate
	.word 0xfb1ce14d  ! 457: LDDF_I	ldd	[%r19, 0x014d], %f29
	.word 0xfe4ca05e  ! 458: LDSB_I	ldsb	[%r18 + 0x005e], %r31
	setx	data_start_4, %g1, %r18
	.word 0xbb643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0xbd508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xb5518000  ! 463: RDPR_PSTATE	<illegal instruction>
	.word 0xf4158000  ! 464: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0x8595617b  ! 467: WRPR_TSTATE_I	wrpr	%r21, 0x017b, %tstate
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0xf8040000  ! 476: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb5518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xbc1dc000  ! 482: XOR_R	xor 	%r23, %r0, %r30
	.word 0xb351c000  ! 484: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc148000  ! 487: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0x899420b1  ! 492: WRPR_TICK_I	wrpr	%r16, 0x00b1, %tick
	.word 0xf45ca1a0  ! 493: LDX_I	ldx	[%r18 + 0x01a0], %r26
	.word 0xf015c000  ! 494: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xf455c000  ! 495: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xb634c000  ! 498: ORN_R	orn 	%r19, %r0, %r27
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ace0dd  ! 507: ANDNcc_I	andncc 	%r19, 0x00dd, %r24
	setx	0x7cac571500008f8b, %g1, %r10
	.word 0x819a8000  ! 510: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa0c8000  ! 512: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf045202a  ! 513: LDSW_I	ldsw	[%r20 + 0x002a], %r24
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81c2060  ! 515: LDD_I	ldd	[%r16 + 0x0060], %r28
	.word 0xfe5cc000  ! 516: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xf4140000  ! 517: LDUH_R	lduh	[%r16 + %r0], %r26
	setx	data_start_7, %g1, %r20
	.word 0xfc54a041  ! 520: LDSH_I	ldsh	[%r18 + 0x0041], %r30
	.word 0xf64420a6  ! 522: LDSW_I	ldsw	[%r16 + 0x00a6], %r27
	.word 0xfc1d60fb  ! 523: LDD_I	ldd	[%r21 + 0x00fb], %r30
	.word 0xf05ce105  ! 526: LDX_I	ldx	[%r19 + 0x0105], %r24
	.word 0x89946059  ! 533: WRPR_TICK_I	wrpr	%r17, 0x0059, %tick
	.word 0xfc456019  ! 535: LDSW_I	ldsw	[%r21 + 0x0019], %r30
	.word 0xf00c607f  ! 537: LDUB_I	ldub	[%r17 + 0x007f], %r24
	setx	0x4663f48d00007895, %g1, %r10
	.word 0x819a8000  ! 538: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe444000  ! 542: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0x919521f8  ! 543: WRPR_PIL_I	wrpr	%r20, 0x01f8, %pil
	.word 0xf205c000  ! 544: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf8440000  ! 546: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xbd500000  ! 550: RDPR_TPC	<illegal instruction>
	.word 0xf0140000  ! 551: LDUH_R	lduh	[%r16 + %r0], %r24
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01ce008  ! 554: LDD_I	ldd	[%r19 + 0x0008], %r24
	.word 0xbe1c21f6  ! 555: XOR_I	xor 	%r16, 0x01f6, %r31
	.word 0xb3643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xfb1c8000  ! 563: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf4054000  ! 567: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf0540000  ! 572: LDSH_R	ldsh	[%r16 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd508000  ! 575: RDPR_TSTATE	<illegal instruction>
	.word 0xb7641800  ! 576: MOVcc_R	<illegal instruction>
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6044000  ! 581: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xfc0dc000  ! 583: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf45d4000  ! 586: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xbb500000  ! 589: RDPR_TPC	<illegal instruction>
	.word 0xf044c000  ! 592: LDSW_R	ldsw	[%r19 + %r0], %r24
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6548000  ! 596: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xb3508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xf44de0aa  ! 604: LDSB_I	ldsb	[%r23 + 0x00aa], %r26
	.word 0xba8de1e6  ! 612: ANDcc_I	andcc 	%r23, 0x01e6, %r29
	mov	2, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5518000  ! 620: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xbcb48000  ! 622: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0x8d94a105  ! 626: WRPR_PSTATE_I	wrpr	%r18, 0x0105, %pstate
	.word 0xf2558000  ! 627: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf51cc000  ! 630: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf71d600a  ! 631: LDDF_I	ldd	[%r21, 0x000a], %f27
	.word 0xb7504000  ! 632: RDPR_TNPC	<illegal instruction>
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc4a1e8  ! 634: ADDCcc_I	addccc 	%r18, 0x01e8, %r30
	.word 0xb5518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3d5000  ! 638: SRAX_R	srax	%r21, %r0, %r31
	setx	data_start_4, %g1, %r22
	.word 0xb6858000  ! 640: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xfe5d60db  ! 641: LDX_I	ldx	[%r21 + 0x00db], %r31
	.word 0xf81c0000  ! 645: LDD_R	ldd	[%r16 + %r0], %r28
	.word 0x8394a11b  ! 648: WRPR_TNPC_I	wrpr	%r18, 0x011b, %tnpc
	.word 0xf51d8000  ! 650: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf04dc000  ! 655: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0x879560fb  ! 657: WRPR_TT_I	wrpr	%r21, 0x00fb, %tt
	.word 0x8d94a0d5  ! 661: WRPR_PSTATE_I	wrpr	%r18, 0x00d5, %pstate
	setx	0xc5de6acb0000bd1a, %g1, %r10
	.word 0x819a8000  ! 663: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0540000  ! 664: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xfe540000  ! 666: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf11d6136  ! 667: LDDF_I	ldd	[%r21, 0x0136], %f24
	.word 0x8595a0c0  ! 668: WRPR_TSTATE_I	wrpr	%r22, 0x00c0, %tstate
	.word 0xbb518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0x8195a14f  ! 675: WRPR_TPC_I	wrpr	%r22, 0x014f, %tpc
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1c8000  ! 679: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf05da116  ! 680: LDX_I	ldx	[%r22 + 0x0116], %r24
	.word 0xb42da00d  ! 684: ANDN_I	andn 	%r22, 0x000d, %r26
	.word 0x8994e05e  ! 688: WRPR_TICK_I	wrpr	%r19, 0x005e, %tick
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1c60b6  ! 692: LDDF_I	ldd	[%r17, 0x00b6], %f30
	.word 0xb9480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5500000  ! 703: RDPR_TPC	<illegal instruction>
	.word 0xb17d8400  ! 704: MOVR_R	movre	%r22, %r0, %r24
	.word 0xf804c000  ! 705: LDUW_R	lduw	[%r19 + %r0], %r28
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xbc244000  ! 712: SUB_R	sub 	%r17, %r0, %r30
	.word 0xb9508000  ! 718: RDPR_TSTATE	<illegal instruction>
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0040000  ! 721: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xb550c000  ! 722: RDPR_TT	<illegal instruction>
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3358000  ! 727: SRL_R	srl 	%r22, %r0, %r25
	.word 0xfb1ce1c2  ! 729: LDDF_I	ldd	[%r19, 0x01c2], %f29
	.word 0xf004c000  ! 734: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf4548000  ! 740: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfe058000  ! 744: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xb750c000  ! 745: RDPR_TT	<illegal instruction>
	.word 0xf41ce0a7  ! 746: LDD_I	ldd	[%r19 + 0x00a7], %r26
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 749: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf25da0c9  ! 750: LDX_I	ldx	[%r22 + 0x00c9], %r25
	.word 0xfa04c000  ! 752: LDUW_R	lduw	[%r19 + %r0], %r29
	setx	0x57e8449c0000bd18, %g1, %r10
	.word 0x819a8000  ! 754: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd50c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 756: RDPR_TPC	<illegal instruction>
	.word 0xf005c000  ! 758: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf84cc000  ! 761: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf244a07b  ! 764: LDSW_I	ldsw	[%r18 + 0x007b], %r25
	.word 0xfc544000  ! 768: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb7641800  ! 769: MOVcc_R	<illegal instruction>
	.word 0xfa044000  ! 772: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xfc1421d5  ! 774: LDUH_I	lduh	[%r16 + 0x01d5], %r30
	.word 0xf0154000  ! 775: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xfc440000  ! 776: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xb3500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 780: RDPR_TT	<illegal instruction>
	.word 0xb3480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	data_start_6, %g1, %r16
	.word 0xf8144000  ! 784: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfa5c8000  ! 785: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfe0c2080  ! 789: LDUB_I	ldub	[%r16 + 0x0080], %r31
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c1000  ! 801: SLLX_R	sllx	%r16, %r0, %r28
	.word 0xf20ce1ea  ! 803: LDUB_I	ldub	[%r19 + 0x01ea], %r25
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 810: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf00d605a  ! 813: LDUB_I	ldub	[%r21 + 0x005a], %r24
	.word 0xb20c4000  ! 815: AND_R	and 	%r17, %r0, %r25
	.word 0xfc5ce129  ! 824: LDX_I	ldx	[%r19 + 0x0129], %r30
	.word 0x8794a1a6  ! 826: WRPR_TT_I	wrpr	%r18, 0x01a6, %tt
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6adc000  ! 834: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xf31cc000  ! 835: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf24c2054  ! 836: LDSB_I	ldsb	[%r16 + 0x0054], %r25
	.word 0xf20de123  ! 840: LDUB_I	ldub	[%r23 + 0x0123], %r25
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d0000  ! 846: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf4042122  ! 847: LDUW_I	lduw	[%r16 + 0x0122], %r26
	mov	1, %r12
	.word 0x8f930000  ! 849: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa4dc000  ! 851: LDSB_R	ldsb	[%r23 + %r0], %r29
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71ca128  ! 854: LDDF_I	ldd	[%r18, 0x0128], %f27
	.word 0xf4458000  ! 855: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xb7641800  ! 856: MOVcc_R	<illegal instruction>
	.word 0xf4058000  ! 857: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xf6058000  ! 858: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf2152106  ! 860: LDUH_I	lduh	[%r20 + 0x0106], %r25
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d952038  ! 872: WRPR_PSTATE_I	wrpr	%r20, 0x0038, %pstate
	.word 0xf2554000  ! 873: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf015c000  ! 875: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xbc256073  ! 881: SUB_I	sub 	%r21, 0x0073, %r30
	.word 0xf814c000  ! 882: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xfd1d8000  ! 884: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfe04c000  ! 889: LDUW_R	lduw	[%r19 + %r0], %r31
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b44000  ! 891: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xbc14c000  ! 892: OR_R	or 	%r19, %r0, %r30
	.word 0xb950c000  ! 893: RDPR_TT	<illegal instruction>
	.word 0xf2548000  ! 895: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xb4b58000  ! 905: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xfa4d6158  ! 906: LDSB_I	ldsb	[%r21 + 0x0158], %r29
	.word 0xf655e0ba  ! 908: LDSH_I	ldsh	[%r23 + 0x00ba], %r27
	.word 0xf6058000  ! 909: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0x8194e029  ! 913: WRPR_TPC_I	wrpr	%r19, 0x0029, %tpc
	.word 0xfe04607c  ! 919: LDUW_I	lduw	[%r17 + 0x007c], %r31
	.word 0xf0042081  ! 920: LDUW_I	lduw	[%r16 + 0x0081], %r24
	.word 0xbb51c000  ! 927: RDPR_TL	<illegal instruction>
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45560c2  ! 930: LDSH_I	ldsh	[%r21 + 0x00c2], %r26
	.word 0xf31dc000  ! 935: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xf20da12a  ! 936: LDUB_I	ldub	[%r22 + 0x012a], %r25
	setx	0xad7c25e10000aa9f, %g1, %r10
	.word 0x819a8000  ! 937: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbca50000  ! 939: SUBcc_R	subcc 	%r20, %r0, %r30
	.word 0xbb520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0xf2552199  ! 943: LDSH_I	ldsh	[%r20 + 0x0199], %r25
	.word 0xfa1d4000  ! 946: LDD_R	ldd	[%r21 + %r0], %r29
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5460d9  ! 949: LDSH_I	ldsh	[%r17 + 0x00d9], %r31
	.word 0xbf500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0xf61ca08d  ! 954: LDD_I	ldd	[%r18 + 0x008d], %r27
	.word 0xfa1c4000  ! 957: LDD_R	ldd	[%r17 + %r0], %r29
	setx	data_start_0, %g1, %r17
	.word 0xf644a056  ! 960: LDSW_I	ldsw	[%r18 + 0x0056], %r27
	.word 0x8d9561d7  ! 967: WRPR_PSTATE_I	wrpr	%r21, 0x01d7, %pstate
	.word 0xf91d4000  ! 968: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xf91c0000  ! 974: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfc140000  ! 983: LDUH_R	lduh	[%r16 + %r0], %r30
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6856041  ! 987: ADDcc_I	addcc 	%r21, 0x0041, %r27
	.word 0xb7510000  ! 989: RDPR_TICK	<illegal instruction>
	setx	0xff0fcc5100005ddf, %g1, %r10
	.word 0x819a8000  ! 992: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95a030  ! 996: WRPR_PSTATE_I	wrpr	%r22, 0x0030, %pstate
	.word 0xf71ce0fb  ! 997: LDDF_I	ldd	[%r19, 0x00fb], %f27
	.word 0xff1de1fe  ! 998: LDDF_I	ldd	[%r23, 0x01fe], %f31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbba54920  ! 1: FMULs	fmuls	%f21, %f0, %f29
	setx	0x4a0c95fa00001f54, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d94e0bb  ! 4: WRPR_PSTATE_I	wrpr	%r19, 0x00bb, %pstate
	.word 0xb1a88820  ! 9: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0xbba81c20  ! 14: FMOVRGEZ	dis not found

	.word 0xbfa80420  ! 18: FMOVRZ	dis not found

	.word 0xbda81c20  ! 23: FMOVRGEZ	dis not found

	.word 0xbd343001  ! 25: SRLX_I	srlx	%r16, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 26: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 37: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba588a0  ! 38: FSUBs	fsubs	%f22, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a81c20  ! 40: FMOVRGEZ	dis not found

	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 42: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9195214a  ! 44: WRPR_PIL_I	wrpr	%r20, 0x014a, %pil
	.word 0xbfa50940  ! 48: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbfa5c940  ! 49: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb2a56132  ! 50: SUBcc_I	subcc 	%r21, 0x0132, %r25
	.word 0xbb540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xbba5c940  ! 58: FMULd	fmuld	%f54, %f0, %f60
	setx	0xbfa2108b00007f8b, %g1, %r10
	.word 0x839a8000  ! 59: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa98820  ! 62: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x859521d4  ! 67: WRPR_TSTATE_I	wrpr	%r20, 0x01d4, %tstate
	mov	2, %r12
	.word 0x8f930000  ! 73: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa00020  ! 74: FMOVs	fmovs	%f0, %f31
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 76: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa50840  ! 81: FADDd	faddd	%f20, %f0, %f62
	.word 0xb8b48000  ! 82: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xb5a81420  ! 83: FMOVRNZ	dis not found

	.word 0xb1a81820  ! 85: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a00560  ! 87: FSQRTq	fsqrt	
	.word 0xb1a58940  ! 99: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb3a00540  ! 102: FSQRTd	fsqrt	
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x819461a4  ! 107: WRPR_TPC_I	wrpr	%r17, 0x01a4, %tpc
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb1a549a0  ! 111: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbfa94820  ! 112: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba40960  ! 113: FMULq	dis not found

	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a157  ! 121: WRPR_PSTATE_I	wrpr	%r22, 0x0157, %pstate
	.word 0xb1508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xb7aac820  ! 128: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a54960  ! 131: FMULq	dis not found

	.word 0xb7a00520  ! 136: FSQRTs	fsqrt	
	.word 0x8594e18c  ! 140: WRPR_TSTATE_I	wrpr	%r19, 0x018c, %tstate
	.word 0xb80c0000  ! 143: AND_R	and 	%r16, %r0, %r28
	.word 0xbfa589c0  ! 144: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb5a40960  ! 146: FMULq	dis not found

	.word 0xb3a58860  ! 149: FADDq	dis not found

	.word 0xbf518000  ! 151: RDPR_PSTATE	<illegal instruction>
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 154: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a84820  ! 155: FMOVE	fmovs	%fcc1, %f0, %f27
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448c0  ! 158: FSUBd	fsubd	%f48, %f0, %f24
	mov	0, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb751c000  ! 161: RDPR_TL	<illegal instruction>
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 168: FSQRTq	fsqrt	
	setx	data_start_1, %g1, %r18
	.word 0xb1a548a0  ! 172: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb1a50820  ! 174: FADDs	fadds	%f20, %f0, %f24
	.word 0x9194a144  ! 175: WRPR_PIL_I	wrpr	%r18, 0x0144, %pil
	.word 0xbba409a0  ! 189: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb3500000  ! 192: RDPR_TPC	<illegal instruction>
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 199: FMULq	dis not found

	.word 0xb5480000  ! 202: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbb520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xbda84820  ! 207: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a508e0  ! 208: FSUBq	dis not found

	.word 0xbd3db001  ! 210: SRAX_I	srax	%r22, 0x0001, %r30
	.word 0xbfa508a0  ! 213: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb5a48920  ! 214: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb1a448c0  ! 216: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb9480000  ! 218: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8795e173  ! 219: WRPR_TT_I	wrpr	%r23, 0x0173, %tt
	setx	data_start_0, %g1, %r19
	.word 0x8795612a  ! 224: WRPR_TT_I	wrpr	%r21, 0x012a, %tt
	.word 0xbba449c0  ! 225: FDIVd	fdivd	%f48, %f0, %f60
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 234: FMOVd	fmovd	%f0, %f30
	.word 0xbdab4820  ! 235: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbd540000  ! 237: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 240: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x899561b4  ! 245: WRPR_TICK_I	wrpr	%r21, 0x01b4, %tick
	.word 0xbba00520  ! 247: FSQRTs	fsqrt	
	.word 0xb5a54960  ! 249: FMULq	dis not found

	.word 0xbfa94820  ! 253: FMOVCS	fmovs	%fcc1, %f0, %f31
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 261: FMOVs	fmovs	%f0, %f24
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 263: RDPR_GL	<illegal instruction>
	.word 0xb3a4c820  ! 265: FADDs	fadds	%f19, %f0, %f25
	setx	data_start_1, %g1, %r17
	.word 0xbba409a0  ! 271: FDIVs	fdivs	%f16, %f0, %f29
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c40000  ! 274: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0x919420f9  ! 279: WRPR_PIL_I	wrpr	%r16, 0x00f9, %pil
	.word 0xb7a40940  ! 287: FMULd	fmuld	%f16, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab8820  ! 289: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbdabc820  ! 290: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba00040  ! 291: FMOVd	fmovd	%f0, %f60
	.word 0xbb50c000  ! 292: RDPR_TT	<illegal instruction>
	.word 0xb5a94820  ! 295: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbba94820  ! 296: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0x8794216b  ! 297: WRPR_TT_I	wrpr	%r16, 0x016b, %tt
	.word 0xbfa81c20  ! 299: FMOVRGEZ	dis not found

	.word 0xb1a488c0  ! 300: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xbba00020  ! 301: FMOVs	fmovs	%f0, %f29
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 305: FMOVPOS	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0xa1930000  ! 307: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3510000  ! 308: RDPR_TICK	<illegal instruction>
	.word 0xb5a94820  ! 309: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb9518000  ! 310: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a489c0  ! 311: FDIVd	fdivd	%f18, %f0, %f58
	.word 0x8d942173  ! 314: WRPR_PSTATE_I	wrpr	%r16, 0x0173, %pstate
	.word 0xb3a408e0  ! 316: FSUBq	dis not found

	.word 0xbba00520  ! 329: FSQRTs	fsqrt	
	.word 0xbfa589a0  ! 331: FDIVs	fdivs	%f22, %f0, %f31
	.word 0x9194a0b6  ! 336: WRPR_PIL_I	wrpr	%r18, 0x00b6, %pil
	.word 0xb7a5c840  ! 337: FADDd	faddd	%f54, %f0, %f58
	.word 0xb3520000  ! 340: RDPR_PIL	<illegal instruction>
	.word 0xb3a81c20  ! 344: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda88820  ! 347: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a40920  ! 349: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb3a00040  ! 352: FMOVd	fmovd	%f0, %f56
	setx	0xa71c65e500000f4a, %g1, %r10
	.word 0x839a8000  ! 353: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb92c8000  ! 359: SLL_R	sll 	%r18, %r0, %r28
	mov	2, %r12
	.word 0x8f930000  ! 362: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb33c7001  ! 365: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xb41ce1f6  ! 368: XOR_I	xor 	%r19, 0x01f6, %r26
	.word 0xb1a81820  ! 371: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbda44920  ! 372: FMULs	fmuls	%f17, %f0, %f30
	.word 0xbf7d2401  ! 374: MOVR_I	movre	%r20, 0x1, %r31
	.word 0xbf351000  ! 376: SRLX_R	srlx	%r20, %r0, %r31
	setx	0x1d85165c0000bc17, %g1, %r10
	.word 0x819a8000  ! 377: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd520000  ! 379: RDPR_PIL	<illegal instruction>
	.word 0xb5504000  ! 381: RDPR_TNPC	<illegal instruction>
	.word 0xb7a80c20  ! 385: FMOVRLZ	dis not found

	.word 0xb88c4000  ! 386: ANDcc_R	andcc 	%r17, %r0, %r28
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 396: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3aa4820  ! 401: FMOVNE	fmovs	%fcc1, %f0, %f25
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 406: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa48940  ! 407: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb2a50000  ! 408: SUBcc_R	subcc 	%r20, %r0, %r25
	.word 0xb72c9000  ! 411: SLLX_R	sllx	%r18, %r0, %r27
	.word 0xbda448e0  ! 417: FSUBq	dis not found

	.word 0xb3508000  ! 418: RDPR_TSTATE	<illegal instruction>
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 422: RDPR_GL	<illegal instruction>
	.word 0xbbab8820  ! 423: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0x8194e03d  ! 427: WRPR_TPC_I	wrpr	%r19, 0x003d, %tpc
	.word 0xbda88820  ! 428: FMOVLE	fmovs	%fcc1, %f0, %f30
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 432: FSQRTq	fsqrt	
	.word 0xbfa00560  ! 434: FSQRTq	fsqrt	
	.word 0xbd51c000  ! 435: RDPR_TL	<illegal instruction>
	.word 0xb9a00020  ! 439: FMOVs	fmovs	%f0, %f28
	setx	data_start_0, %g1, %r17
	.word 0x87952161  ! 442: WRPR_TT_I	wrpr	%r20, 0x0161, %tt
	.word 0xbda80820  ! 449: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	setx	0x67dd21f50000f951, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a88820  ! 455: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0x8d9561e2  ! 456: WRPR_PSTATE_I	wrpr	%r21, 0x01e2, %pstate
	setx	data_start_0, %g1, %r22
	.word 0xb9643801  ! 460: MOVcc_I	<illegal instruction>
	.word 0xb7508000  ! 462: RDPR_TSTATE	<illegal instruction>
	.word 0xbf518000  ! 463: RDPR_PSTATE	<illegal instruction>
	.word 0x85952008  ! 467: WRPR_TSTATE_I	wrpr	%r20, 0x0008, %tstate
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0xbfa4c9c0  ! 473: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbfa50840  ! 474: FADDd	faddd	%f20, %f0, %f62
	.word 0xb3ab8820  ! 475: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xb61cc000  ! 482: XOR_R	xor 	%r19, %r0, %r27
	.word 0xb151c000  ! 484: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a5c960  ! 490: FMULq	dis not found

	.word 0x8995a05c  ! 492: WRPR_TICK_I	wrpr	%r22, 0x005c, %tick
	.word 0xbc344000  ! 498: ORN_R	orn 	%r17, %r0, %r30
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 502: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a48820  ! 506: FADDs	fadds	%f18, %f0, %f27
	.word 0xbeaca121  ! 507: ANDNcc_I	andncc 	%r18, 0x0121, %r31
	.word 0xbba4c960  ! 508: FMULq	dis not found

	.word 0xb9a80c20  ! 509: FMOVRLZ	dis not found

	setx	0x3a80313e00005d00, %g1, %r10
	.word 0x819a8000  ! 510: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	.word 0xb1a00040  ! 519: FMOVd	fmovd	%f0, %f24
	.word 0xb3a80420  ! 524: FMOVRZ	dis not found

	.word 0xb3a54860  ! 527: FADDq	dis not found

	.word 0xb9a9c820  ! 532: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0x899420c0  ! 533: WRPR_TICK_I	wrpr	%r16, 0x00c0, %tick
	setx	0x906062de00001dd1, %g1, %r10
	.word 0x819a8000  ! 538: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a00520  ! 539: FSQRTs	fsqrt	
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e08f  ! 543: WRPR_PIL_I	wrpr	%r19, 0x008f, %pil
	.word 0xb5a5c9c0  ! 547: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbf500000  ! 550: RDPR_TPC	<illegal instruction>
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01c618c  ! 555: XOR_I	xor 	%r17, 0x018c, %r24
	.word 0xb7643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xbfa00540  ! 562: FSQRTd	fsqrt	
	.word 0xb7a488c0  ! 566: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb7a408e0  ! 570: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a90820  ! 574: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb1508000  ! 575: RDPR_TSTATE	<illegal instruction>
	.word 0xbf641800  ! 576: MOVcc_R	<illegal instruction>
	.word 0xb9a508a0  ! 577: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xb1a88820  ! 578: FMOVLE	fmovs	%fcc1, %f0, %f24
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54860  ! 588: FADDq	dis not found

	.word 0xbf500000  ! 589: RDPR_TPC	<illegal instruction>
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 597: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00560  ! 598: FSQRTq	fsqrt	
	.word 0xbd508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a8c820  ! 607: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb5a88820  ! 611: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xba8c6015  ! 612: ANDcc_I	andcc 	%r17, 0x0015, %r29
	.word 0xbba48940  ! 614: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb9a94820  ! 615: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa4820  ! 616: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0xa1930000  ! 617: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5ab8820  ! 618: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbb518000  ! 620: RDPR_PSTATE	<illegal instruction>
	.word 0xb0b54000  ! 622: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xbfa00020  ! 623: FMOVs	fmovs	%f0, %f31
	.word 0x8d95e143  ! 626: WRPR_PSTATE_I	wrpr	%r23, 0x0143, %pstate
	.word 0xbda84820  ! 628: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9504000  ! 632: RDPR_TNPC	<illegal instruction>
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc52110  ! 634: ADDCcc_I	addccc 	%r20, 0x0110, %r30
	.word 0xb9518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xb53c9000  ! 638: SRAX_R	srax	%r18, %r0, %r26
	setx	data_start_4, %g1, %r19
	.word 0xb4850000  ! 640: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xb1a509a0  ! 646: FDIVs	fdivs	%f20, %f0, %f24
	.word 0x8394e1c8  ! 648: WRPR_TNPC_I	wrpr	%r19, 0x01c8, %tnpc
	.word 0xbfa40940  ! 652: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb1a8c820  ! 653: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0x8795a1b2  ! 657: WRPR_TT_I	wrpr	%r22, 0x01b2, %tt
	.word 0x8d95a1c5  ! 661: WRPR_PSTATE_I	wrpr	%r22, 0x01c5, %pstate
	.word 0xbba00520  ! 662: FSQRTs	fsqrt	
	setx	0x9f75007b00002848, %g1, %r10
	.word 0x819a8000  ! 663: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x859520b8  ! 668: WRPR_TSTATE_I	wrpr	%r20, 0x00b8, %tstate
	.word 0xb9a448e0  ! 669: FSUBq	dis not found

	.word 0xbf518000  ! 670: RDPR_PSTATE	<illegal instruction>
	.word 0x81952020  ! 675: WRPR_TPC_I	wrpr	%r20, 0x0020, %tpc
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 677: FMOVRLZ	dis not found

	.word 0xb7a80820  ! 682: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb82c6157  ! 684: ANDN_I	andn 	%r17, 0x0157, %r28
	.word 0xb7aa8820  ! 685: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab4820  ! 686: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0x8995202d  ! 688: WRPR_TICK_I	wrpr	%r20, 0x002d, %tick
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 697: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80820  ! 700: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1500000  ! 703: RDPR_TPC	<illegal instruction>
	.word 0xb37c4400  ! 704: MOVR_R	movre	%r17, %r0, %r25
	.word 0xb5a409a0  ! 706: FDIVs	fdivs	%f16, %f0, %f26
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xb5a81820  ! 711: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb4258000  ! 712: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb1aa4820  ! 713: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a5c860  ! 714: FADDq	dis not found

	.word 0xb9508000  ! 718: RDPR_TSTATE	<illegal instruction>
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 722: RDPR_TT	<illegal instruction>
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf348000  ! 727: SRL_R	srl 	%r18, %r0, %r31
	.word 0xbfa80420  ! 732: FMOVRZ	dis not found

	.word 0xb1a00040  ! 733: FMOVd	fmovd	%f0, %f24
	.word 0xbb50c000  ! 745: RDPR_TT	<illegal instruction>
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c860  ! 748: FADDq	dis not found

	.word 0xb1a00540  ! 751: FSQRTd	fsqrt	
	setx	0x88c4d1a90000eb91, %g1, %r10
	.word 0x819a8000  ! 754: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb950c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 756: RDPR_TPC	<illegal instruction>
	.word 0xb1a90820  ! 759: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbda00020  ! 765: FMOVs	fmovs	%f0, %f30
	.word 0xbf641800  ! 769: MOVcc_R	<illegal instruction>
	.word 0xb7aa8820  ! 777: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbba588e0  ! 778: FSUBq	dis not found

	.word 0xbb500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 780: RDPR_TT	<illegal instruction>
	.word 0xbf480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_7, %g1, %r18
	.word 0xbfa409e0  ! 786: FDIVq	dis not found

	.word 0xb3a00560  ! 792: FSQRTq	fsqrt	
	.word 0xbfa80420  ! 794: FMOVRZ	dis not found

	.word 0xb1a81820  ! 796: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d9000  ! 801: SLLX_R	sllx	%r22, %r0, %r28
	.word 0xb7a9c820  ! 805: FMOVVS	fmovs	%fcc1, %f0, %f27
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 809: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfab8820  ! 812: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xba0dc000  ! 815: AND_R	and 	%r23, %r0, %r29
	.word 0xb5a00040  ! 816: FMOVd	fmovd	%f0, %f26
	.word 0xb1a489e0  ! 818: FDIVq	dis not found

	.word 0xb7a8c820  ! 820: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0x879461f7  ! 826: WRPR_TT_I	wrpr	%r17, 0x01f7, %tt
	.word 0xb3aa0820  ! 827: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb5ab4820  ! 828: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00040  ! 829: FMOVd	fmovd	%f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba81820  ! 832: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbaac8000  ! 834: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xb5a5c9e0  ! 844: FDIVq	dis not found

	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 849: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 853: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5641800  ! 856: MOVcc_R	<illegal instruction>
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 871: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0x8d95e01f  ! 872: WRPR_PSTATE_I	wrpr	%r23, 0x001f, %pstate
	.word 0xbda54940  ! 874: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbc24614a  ! 881: SUB_I	sub 	%r17, 0x014a, %r30
	.word 0xb9a58960  ! 886: FMULq	dis not found

	.word 0xb9aa4820  ! 888: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb54000  ! 891: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xb2154000  ! 892: OR_R	or 	%r21, %r0, %r25
	.word 0xb150c000  ! 893: RDPR_TT	<illegal instruction>
	.word 0xb1a58840  ! 901: FADDd	faddd	%f22, %f0, %f24
	.word 0xb4b54000  ! 905: ORNcc_R	orncc 	%r21, %r0, %r26
	.word 0xb7aa4820  ! 907: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab4820  ! 910: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbfab0820  ! 912: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x8194a187  ! 913: WRPR_TPC_I	wrpr	%r18, 0x0187, %tpc
	.word 0xb9a4c860  ! 923: FADDq	dis not found

	.word 0xbba548e0  ! 924: FSUBq	dis not found

	.word 0xb551c000  ! 927: RDPR_TL	<illegal instruction>
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf7c5180e00005ec6, %g1, %r10
	.word 0x819a8000  ! 937: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb0a5c000  ! 939: SUBcc_R	subcc 	%r23, %r0, %r24
	.word 0xbba4c8a0  ! 940: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xb1520000  ! 942: RDPR_PIL	<illegal instruction>
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0xbba00560  ! 953: FSQRTq	fsqrt	
	.word 0xb7a448e0  ! 956: FSUBq	dis not found

	.word 0xb7aa0820  ! 958: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	data_start_7, %g1, %r23
	.word 0xb7a4c960  ! 963: FMULq	dis not found

	.word 0xb5a4c8e0  ! 964: FSUBq	dis not found

	.word 0x8d94606f  ! 967: WRPR_PSTATE_I	wrpr	%r17, 0x006f, %pstate
	.word 0xb7a54860  ! 978: FADDq	dis not found

	.word 0xbda4c9a0  ! 980: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb3a90820  ! 982: FMOVLEU	fmovs	%fcc1, %f0, %f25
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589a0  ! 986: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbc84e147  ! 987: ADDcc_I	addcc 	%r19, 0x0147, %r30
	.word 0xbfab0820  ! 988: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbf510000  ! 989: RDPR_TICK	<illegal instruction>
	setx	0x50020e480000f9cd, %g1, %r10
	.word 0x819a8000  ! 992: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa94820  ! 995: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8d942124  ! 996: WRPR_PSTATE_I	wrpr	%r16, 0x0124, %pstate

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

	.xword	0xd879f435d3d73948
	.xword	0x88c7b64a0b3eb340
	.xword	0xf14161cd589fb820
	.xword	0x7074e47cd8e2ace9
	.xword	0xd5e94dd1898b6d87
	.xword	0x0de7976b898b95d9
	.xword	0xa43a2ff778d92421
	.xword	0xb628b46037f16b1e
	.xword	0xc7c72b5293773579
	.xword	0x8eded2a88cf1878d
	.xword	0xd91213fbd861f0d6
	.xword	0xbeb1159962367b2e
	.xword	0x448e1029df0b3cd1
	.xword	0xc0bacbe5644d3295
	.xword	0x6d85eff1190cd927
	.xword	0xc569dcc8e18baff9
	.xword	0x147492ac1fa6b8e1
	.xword	0xcc1ae22cdfa6cd9f
	.xword	0x11843bfb4d581463
	.xword	0x82a89d369f013ca9
	.xword	0xce7f7c50ec277a21
	.xword	0x4a8b30c309c48636
	.xword	0x01e222e465f554d3
	.xword	0x07b25e939375aabd
	.xword	0xf0a51a9856781d89
	.xword	0xb39f1ac12b926eec
	.xword	0x7a7650399e498c51
	.xword	0xee1ec8d09130e976
	.xword	0x75b95d7124382ace
	.xword	0x61fe044aab7d507b
	.xword	0x6dbc2bfa3ff46a39
	.xword	0xd9d0e8463a4a3f1d
	.xword	0xbc1c3f75df3f8660
	.xword	0xd81a5328bae6eba1
	.xword	0x8f9c4fc8db38958c
	.xword	0xd559b5856d086913
	.xword	0x31e58f57a5c73978
	.xword	0x2271eb19ff7b6835
	.xword	0xca06f3b8f1664e5a
	.xword	0x681c2a641b58f5e9
	.xword	0xb725193f5bfb83e3
	.xword	0x7be9a81bdb61a72a
	.xword	0x157afb8927d6e1bc
	.xword	0xd6ed8a35f3135a63
	.xword	0xf677555d7681c857
	.xword	0x643e7c30a937f96e
	.xword	0xeed307f77201d53e
	.xword	0x0ac50bd943a944b7
	.xword	0x48716a626cb269d3
	.xword	0x4b20f51787ceda8e
	.xword	0xd7340faf0611db7c
	.xword	0x27aadcf8046d1538
	.xword	0x9d69200cf3db1b1e
	.xword	0x692b7e34d5925ee1
	.xword	0xcf75b2e56c1ebff6
	.xword	0x0a295981346452b5
	.xword	0xdd5cb5d91173f6f2
	.xword	0x6505ecb8e6946a61
	.xword	0x9e7a464b3765b998
	.xword	0xd325ede9be3551f3
	.xword	0x996c4605b920c1d1
	.xword	0x078aa332adddca91
	.xword	0x51fd5ea17161ec41
	.xword	0xa5f1145e6ee13087
	.xword	0x6166f91122486c95
	.xword	0x06bcc030ccdcf8b0
	.xword	0x4daf2017be15aa6f
	.xword	0xd48f5a2c332fed03
	.xword	0x4d5bd480da7e5518
	.xword	0xe1f1476be2ca3c7a
	.xword	0x0086bebac7bc587a
	.xword	0xa2f23e5d20f04595
	.xword	0xa4c53dead01bccdb
	.xword	0x619b750d197ac796
	.xword	0xd84206427740bd5e
	.xword	0xe2295b240a137352
	.xword	0xd4bf1df6cf125610
	.xword	0x9c9f8583b2b74412
	.xword	0xda2a0090c30a189b
	.xword	0xa5eb15d82059524e
	.xword	0x52686117abab9cf6
	.xword	0x1db050cf2e504539
	.xword	0xfe1c0053bfcbb0ac
	.xword	0xdc450fe5aad7a842
	.xword	0x25400f40a3c830f2
	.xword	0x2854e85c6f701fd1
	.xword	0x3ed427dc9d472b29
	.xword	0xea5489dbd247a5d2
	.xword	0x42acae38d4d34c3c
	.xword	0x52aac0130080a28c
	.xword	0x490fda1da64e5c68
	.xword	0xc86b4739c0dc644e
	.xword	0x75ac7f16a2126816
	.xword	0x9ec198a738e40b03
	.xword	0xcd1b99549bb37cd6
	.xword	0x2fcc79004678a142
	.xword	0xd4b5fd346205017b
	.xword	0x517540f2dfea0f47
	.xword	0x0ff46b0b4e2566f6
	.xword	0xb5f4797411b2ab17
	.xword	0x9e15cbe1e2784b93
	.xword	0x50abc7c4e1c90e42
	.xword	0x42b1fc7bf64d28c5
	.xword	0x186e35bddfac99e8
	.xword	0x0d0e5ff0926f137e
	.xword	0x6535241eedff653b
	.xword	0xa30a4d0ffb72251d
	.xword	0x8fd04a099942118a
	.xword	0x7dd803aa52f83c86
	.xword	0x41326c1b6c668260
	.xword	0x5ebedade78228e94
	.xword	0x4991de54d2e5d875
	.xword	0xfda701948c68be15
	.xword	0xcfdaeab96123f493
	.xword	0x4d902e81efae2a46
	.xword	0xcc00f66b9b990fc6
	.xword	0xb3fa2402dc806155
	.xword	0x0469fe3fa75a490e
	.xword	0x060c797acf3f8a19
	.xword	0x94a60ca20310991d
	.xword	0xa8ffc4e79037e70e
	.xword	0xb91becabd608e945
	.xword	0xb592b32d2abc110a
	.xword	0x748aa18b09fffd39
	.xword	0x106fddcac3997201
	.xword	0x25a95b96d89e9cf8
	.xword	0xc9ee367c3b434abe
	.xword	0x9422eb57f54bc374
	.xword	0x69a1461eebe7841c
	.xword	0xa35466dbaabe87ee
	.xword	0xfadc92eb6f1efc0a
	.xword	0xaa8322e650c56c15
	.xword	0xd6347e5533c86ae9
	.xword	0xc0acb31467ceeade
	.xword	0x6de84e7deb064162
	.xword	0x3edc86f30e8afcf6
	.xword	0x712a38b87c16ea76
	.xword	0x5f1cc9cd5a8af92c
	.xword	0x34ccaad599b9d929
	.xword	0xd480d777e9e2533e
	.xword	0xa46e871293407f82
	.xword	0x8b8b28819f796170
	.xword	0xf3c2866dd857fea2
	.xword	0xbca0948e92977da0
	.xword	0x49496f1dd23e4122
	.xword	0x8b960f8ece2cc3eb
	.xword	0x2a485a17e521c86b
	.xword	0xa01d99666ce4ff2a
	.xword	0x920b74976e10f6eb
	.xword	0x3937ab8a8463e490
	.xword	0xa58ca82a1a484d20
	.xword	0x6a5c650c1714ae44
	.xword	0x09367a032af4f675
	.xword	0x0a349cdd184bc5f6
	.xword	0xa176fe62bc6a8cc2
	.xword	0x14bf7c1181994b00
	.xword	0x4593000b8195a7e4
	.xword	0x75fa91f57d4631b4
	.xword	0xc3f86c89fa56e881
	.xword	0xd94a05c5bd834d9e
	.xword	0x31a2272163c0c30a
	.xword	0xda9aa7188593ad16
	.xword	0xf3a497159145a46f
	.xword	0xee519c706d0c7b54
	.xword	0x37faff6335ab7709
	.xword	0x439dbdd9ca2f1e18
	.xword	0xa741df96934b8966
	.xword	0xaaecfb5e6c0fc422
	.xword	0x1aeff4b947011d91
	.xword	0xfea892a2a30e05c0
	.xword	0xf860aeeca13a2094
	.xword	0xc5db75459e93b115
	.xword	0x048a7cf55d45d7cb
	.xword	0xcc8fdd5c4120d4b8
	.xword	0xd62b772b4ccc7eab
	.xword	0x9e3e722556f9f56e
	.xword	0x445e096a58b4e80a
	.xword	0x1552c7064608cf94
	.xword	0x64706b8ba58739f2
	.xword	0xe233fccca3544056
	.xword	0x534898b759c331a0
	.xword	0x6a881866511d5863
	.xword	0xd89fc8b0e3488928
	.xword	0x24bfa9acf87b481c
	.xword	0xdbb7873964f3b7a3
	.xword	0xd193606c25188fd1
	.xword	0x651f175392e83e31
	.xword	0x989c1412eef495c2
	.xword	0x6d350067501c1bb8
	.xword	0x0d5a157e733b8fbd
	.xword	0x05561ff81c7fda93
	.xword	0xd871affdd1290631
	.xword	0x39eaba5eadaafc08
	.xword	0xc72eae88db7cd8d5
	.xword	0xc49e337cef21e6a4
	.xword	0x1622858ecfa90069
	.xword	0xf6849b98935c19a6
	.xword	0xfe10cef64ee1e788
	.xword	0x67d4fcb64a794469
	.xword	0x60a860fb58119358
	.xword	0xabad562885ab3c20
	.xword	0x31b298b734beeb00
	.xword	0x89c235bcf8c15afa
	.xword	0x723a65a1d6508bdb
	.xword	0xeb718054c00c1571
	.xword	0xd5d09a8534347504
	.xword	0xe5b3e4b61b2a9adf
	.xword	0xf0456c8512fb7e0b
	.xword	0x961e72e72174261f
	.xword	0x15043a323356cf0d
	.xword	0xf2133bcf724a7fee
	.xword	0xf042c9d08e5ee753
	.xword	0x8572e46960968717
	.xword	0x2fa9202e8e001f70
	.xword	0x6cbdad7ea19e1ec3
	.xword	0x9b867835156011aa
	.xword	0x2f85d748058415b7
	.xword	0x6330bb3a8389d9ed
	.xword	0x81b0aa5460ec8510
	.xword	0x9971399c385fb1c2
	.xword	0xdacc093cbff08d9c
	.xword	0xc299c924ded8454b
	.xword	0x1213cd622eeb2674
	.xword	0x9b081cc344f6c67d
	.xword	0x59fceae434316730
	.xword	0x66a7bb0d4904a25d
	.xword	0x2ecb453d87f341fe
	.xword	0x276f399bc00a467a
	.xword	0x347ef2592447c077
	.xword	0x23b35eb62b2d8bce
	.xword	0x50889d12aab7c1cc
	.xword	0x380ee93015b0d0b7
	.xword	0xf15c28d6813eac7f
	.xword	0xc11bd5be26dd2e1c
	.xword	0xad31251b7ced15d9
	.xword	0xc447eae15c787344
	.xword	0xd5d309259a46a71c
	.xword	0x1d81730f6a72250d
	.xword	0xe24691ca32902192
	.xword	0xbc6612872d1eeb33
	.xword	0x7ff952a96afdc4c8
	.xword	0x6af77196c44b282e
	.xword	0x1a07bcb90409d028
	.xword	0x6370142af1853736
	.xword	0x78ed56f533d848fa
	.xword	0xb57ba2dd033b3f9d
	.xword	0xf75a49e18e3a78c2
	.xword	0xa97708cf0a9d3845
	.xword	0x294023b78819c29d
	.xword	0x5b2d9970b27dd443
	.xword	0x767b6f26c49e0a8c
	.xword	0x210886f15423785f
	.xword	0x8683ca9745876706
	.xword	0xc90f62a0bd4ffdc0
	.xword	0x1608f7a9997ffee3
	.xword	0x7e005888d6deb819
	.align 0x2000
	.data
data_start_1:

	.xword	0xb626b5df322c93ba
	.xword	0x2690d94495c54729
	.xword	0xb4ad303936845fec
	.xword	0x91ba955803db1662
	.xword	0xf0406e5ae0688014
	.xword	0xec513b0d00b86f76
	.xword	0x8f57f4d299fd0d06
	.xword	0xa38e987bfdc4c5d5
	.xword	0x614ff3cfa1708528
	.xword	0xf550e0c989fa3ee6
	.xword	0x159c8b72d51e6627
	.xword	0x41a423040b704178
	.xword	0xc0660a38f2dd504d
	.xword	0xb99c9ca8545769f5
	.xword	0x18d23bd33fd352a6
	.xword	0xf97aa2181a1c7316
	.xword	0xea447b7db061bd47
	.xword	0x74099e14dbedc10d
	.xword	0x2d3a02e769c8cf9e
	.xword	0xc5c27d7d7f6df0e9
	.xword	0x6fae21d2f07db89b
	.xword	0xe670f45e2b1a3c15
	.xword	0xaf0edc7a14b84bb0
	.xword	0xd10729b6ae6881f8
	.xword	0xa7e13e14ea81eb4b
	.xword	0x64f9a1fe8b8c361d
	.xword	0xb6a79a5737bbf4d3
	.xword	0xdb15434321de11c5
	.xword	0x2dc75b5cd8bc2385
	.xword	0xb131b60df7e8c1d2
	.xword	0x23789f5038edc174
	.xword	0xe0e9a0efef66eb1a
	.xword	0x2d70630c84414a73
	.xword	0x6f8e3dd26ef08fdb
	.xword	0x687f5facd4e3d346
	.xword	0x58f1cbb028ee99ce
	.xword	0xbd6ecf8503062800
	.xword	0x4411a458906d4c55
	.xword	0x3f24cb2f090a60c0
	.xword	0x67b67491ac3b97fd
	.xword	0x01cedb2adc5ed948
	.xword	0xe3ff27bc019b6dbe
	.xword	0x892d0455f64618f3
	.xword	0xc54e7d2e5446e479
	.xword	0x8544f00e8fa1917c
	.xword	0xc969175edb53a8fa
	.xword	0x7aad9d42cd706367
	.xword	0xd0054a64897971bf
	.xword	0x1783762c2010c407
	.xword	0x44c206ba34df2624
	.xword	0x384cbb59caa2d26a
	.xword	0x17937c89d165da67
	.xword	0x91714587b08b087d
	.xword	0x6a66bdda7829913a
	.xword	0xcd6b2f066d520842
	.xword	0x9970a564f1255e5d
	.xword	0x60e81bc1f7a20e05
	.xword	0xba1c7d8f6523ccb6
	.xword	0x738301c998a508d7
	.xword	0xbcf52c0ad5abadb9
	.xword	0x8f984105bde0ba9b
	.xword	0x11d00dea918f75d8
	.xword	0xc4f6aeb36498f8c6
	.xword	0x7d96450a3301a5c5
	.xword	0x3cf8b08417e68457
	.xword	0x66cdf7635bc3d5ea
	.xword	0xc0d99263dfb59d0f
	.xword	0x3e7da697a8f1e484
	.xword	0x3028d2160cd48ecb
	.xword	0x6f80d31e9d61114d
	.xword	0xccb22cec558dc997
	.xword	0x13efa582f92f78d4
	.xword	0x048d261bd25081bd
	.xword	0xb54df27b64f490e9
	.xword	0x9dfd8bb584c310b6
	.xword	0xbef795da92a8e086
	.xword	0x668e100996caf83a
	.xword	0x3f1a493cd662819f
	.xword	0xca1a62d01687877c
	.xword	0x46e9e99676a095e3
	.xword	0x16a4276a0bfc3dcf
	.xword	0xd0b603bff307dc55
	.xword	0x6bdd8f3a84b9730a
	.xword	0xbbba243360df1704
	.xword	0x32e17c6801f1964b
	.xword	0x54cfe7ee60ef1217
	.xword	0x7d43bfde4c002b99
	.xword	0xe0ce13bd195a874b
	.xword	0x1e6b5f60bb7953ee
	.xword	0xfcd45e59a4870b4a
	.xword	0xa5c9f39950b116f0
	.xword	0x965fcb7cea4b8580
	.xword	0x3b3242b94b8dd57b
	.xword	0x513b01d22195db65
	.xword	0xef3a0a29c2a59e8a
	.xword	0x382175bb107c6dcb
	.xword	0x9ad9fdb438b34982
	.xword	0xc524f404a39f711a
	.xword	0x665f8ddeab47758e
	.xword	0xbef7b46fce90df74
	.xword	0x6d35f82ea4483958
	.xword	0x18442399cf545d33
	.xword	0x4be397f4920723f0
	.xword	0xef58aca28838bf22
	.xword	0x05b2b95db86ac570
	.xword	0x1e99c293d68fcedb
	.xword	0xeb9e042a67f42ddc
	.xword	0xe3691cbb3c62940d
	.xword	0x228c5db3f6891570
	.xword	0x013af251fa40d1f8
	.xword	0x89ae107a75a50f21
	.xword	0x50ad4d6e521453c4
	.xword	0x2fc4b06d00702c1d
	.xword	0x5c07a75237cba88a
	.xword	0x325e21cf1ff1e057
	.xword	0xa32556f51d159d17
	.xword	0x05e0a4243e5faa9a
	.xword	0xabe885ef8b8e973f
	.xword	0x4769a3cf96fa5748
	.xword	0xa54d2d7bcce7e9c0
	.xword	0xc7f840909942e487
	.xword	0x9e3e2d62d2429df0
	.xword	0x082c74940f26ec9a
	.xword	0x470b7006e015dbb9
	.xword	0x38dcc762d6916d5f
	.xword	0x5c8a7351ff7ac399
	.xword	0x21d40a7c139ac878
	.xword	0x919a55740364530c
	.xword	0xf74188b7c0723028
	.xword	0x1aa3a8dcab940bd3
	.xword	0xbfce77d68d853b0e
	.xword	0xe73bfbde6360b5e9
	.xword	0xcdab31d14d356c16
	.xword	0x71d2abc8d4875685
	.xword	0xdd2d31c0f6bb489c
	.xword	0x4c5bbfacf04d5bcb
	.xword	0x063e4244698db867
	.xword	0x4f7e26339ec17a0e
	.xword	0xda1696c409df5afd
	.xword	0xc8660ed93dec7140
	.xword	0x9f436a40695f273d
	.xword	0xedb9e1deee2dc1ed
	.xword	0xd6d6c23e2dd4f96c
	.xword	0x4a27d3cf1e72fc5f
	.xword	0x7aa349d55908be0b
	.xword	0xef5b53e9d3e7728b
	.xword	0x3b0de56c89a074b0
	.xword	0x10d11d05f9eff378
	.xword	0x8d8025bb9d01b11b
	.xword	0x3a6fcfffc262285e
	.xword	0x100f4ea0ce812104
	.xword	0x4cb0f3671352c04e
	.xword	0xe577a9d9036014f0
	.xword	0x1d6680da4821ce69
	.xword	0x13783ecee2394be2
	.xword	0xdefdd15665797314
	.xword	0x4a9792854efba517
	.xword	0xc8061a1b6e52363e
	.xword	0xcddda6103bf4a2c9
	.xword	0x6acae2252f8d3c02
	.xword	0x54fb994574d04dbf
	.xword	0x2548ffc9a3efbcea
	.xword	0x8611e2c8ac292d94
	.xword	0x8474136dffc3cbf5
	.xword	0xf2d34f8dc4b43699
	.xword	0xd2330e38515fdd9a
	.xword	0xc18d2db97b1ffacb
	.xword	0x668c113e26a6c0c3
	.xword	0xfa14d292103a612f
	.xword	0xe208b177dd05dd34
	.xword	0xb03b459e617ffba1
	.xword	0x67176738438880a0
	.xword	0xf388bb3d24ad0640
	.xword	0xe25e8589240a4602
	.xword	0x5752a1671d797e5b
	.xword	0xb3013aeb84323109
	.xword	0x958b9ea9ca6ad238
	.xword	0x07a1c90e9d4b6cc8
	.xword	0x6b40da622642554d
	.xword	0x7900ec6d1e637769
	.xword	0x3d449386c2260d5a
	.xword	0x6b4c795b65fe6b94
	.xword	0xd1ea7f3dd4dac11a
	.xword	0xf73f6d3e212f9d67
	.xword	0xec0aad93e635d717
	.xword	0x806911363016fe00
	.xword	0x0687b6948c8cf759
	.xword	0x09997720d30b132d
	.xword	0x244cbfd621faa010
	.xword	0xb118682923378bcb
	.xword	0x084193ee8b2ac7ab
	.xword	0x197abf8f92698acb
	.xword	0xfb244344d520e75c
	.xword	0xe26974ffc5d6f913
	.xword	0xabef2c377584aca2
	.xword	0x092567db8e6579a2
	.xword	0xe7a7ca73dc758c7f
	.xword	0x9d7ed43c8733aee1
	.xword	0xf2c8d50987ff6b7e
	.xword	0xa69770fd9b13a9d8
	.xword	0xd043acaea56c273a
	.xword	0x9a74d128d1d2a2d8
	.xword	0x41cb89d7a91de389
	.xword	0x67dc95851fe71d51
	.xword	0x4d199e921583fd1f
	.xword	0x3fdbed5c2a87a306
	.xword	0x96896f88099db818
	.xword	0x04a1cea8947cd767
	.xword	0xd5adc69faf80493f
	.xword	0x44fa8b046c6a2d06
	.xword	0x0b95ae11dc8bb849
	.xword	0xad57d2fdaa53d9f4
	.xword	0x957a8e2f4951231d
	.xword	0x3c1074c5162d6c54
	.xword	0xd3eaaf606a6f8829
	.xword	0x1403510718ad0f30
	.xword	0xc5781f72f31b8679
	.xword	0xc5ca4af3989847f4
	.xword	0xde3ba307b7f013a9
	.xword	0x764100527685ca91
	.xword	0x5a676bc244126898
	.xword	0x397296f39c73f7fd
	.xword	0x06f6a0bf0935a1aa
	.xword	0xf5cc758a90825df8
	.xword	0x09f1646ec90bfb23
	.xword	0x5ed6998bfb3dd7b2
	.xword	0x6073a28f61a3e88b
	.xword	0x1b50e261046ca616
	.xword	0xf7cc0b7327c00fff
	.xword	0xa45148694aaf5919
	.xword	0x8cd182dc6f595cee
	.xword	0xc857d994abce8e20
	.xword	0xec54d0a63d53464d
	.xword	0x28c8e95489d32749
	.xword	0x94be5556a6371953
	.xword	0x251da059e0af5ef5
	.xword	0x42c90dcd8f43c0aa
	.xword	0x34bea864323c6819
	.xword	0x7a212ba70dd12085
	.xword	0xdf45d21f4f3684e5
	.xword	0x6c7e876948f39a54
	.xword	0xeffd8586d07137e3
	.xword	0xe07c55994553bbbb
	.xword	0xa6f43df9e9f1d548
	.xword	0x1f057d8f6f4bf0a5
	.xword	0x0968b31abe615060
	.xword	0xaba34d3026084b81
	.xword	0x98ef2f77872cd610
	.xword	0xaaebb8433011a69d
	.xword	0x2766e67f2e05d723
	.xword	0xb312c56b5a720056
	.xword	0x53a7a0fd09766be5
	.xword	0x8230895dcdf432a6
	.xword	0x64a3cf70ee72570f
	.xword	0x37297756f4d7a02d
	.xword	0x973c0569e1b209cc
	.align 0x4000
	.data
data_start_2:

	.xword	0x8cbebda9b0c06655
	.xword	0xde3047b03081aa8c
	.xword	0x16838a64bb433e44
	.xword	0x9115d181e94d2346
	.xword	0xea8da58e8da6474c
	.xword	0xe9e2efa3f055e400
	.xword	0x4c2bbdddb6363c9b
	.xword	0xb470f190b40a0d7d
	.xword	0xcd3d2e62b4b0b6c0
	.xword	0xe7db7e6cff9ed1d4
	.xword	0x72720057126252e8
	.xword	0xdd49f5261e3a74c4
	.xword	0x0633693525277290
	.xword	0xd4903b66c383fd88
	.xword	0x4a53f51bd5e343ec
	.xword	0xa7211531e482e7d6
	.xword	0x394e5118512a3290
	.xword	0x0e67240db7d6128a
	.xword	0xffe9c951f4662602
	.xword	0xb8b83554e6f8e819
	.xword	0xf289c777cbc74ea3
	.xword	0x3899e2dab3d3678b
	.xword	0x4673fb07c0bd7e81
	.xword	0x184cf37ee6ad0808
	.xword	0x9967bff03082fbbd
	.xword	0x68ea2a33a200265d
	.xword	0x9d864bab42efc939
	.xword	0x63566129085b0d33
	.xword	0x1b48130d829ab5b6
	.xword	0x10029eca0905ec50
	.xword	0x59f31b3c01da0875
	.xword	0xfb0da1b84ec9b097
	.xword	0x6c7f8690030a542e
	.xword	0xd5300c973fc34a0e
	.xword	0x7806149e29dde16d
	.xword	0x3af518fd97ce3831
	.xword	0xba3faf6c310816a2
	.xword	0x631780234479a414
	.xword	0x79e78e81476609e2
	.xword	0xe206d0cc013a1a52
	.xword	0x9edd867ffaa324b8
	.xword	0xa17f3c75aae604a4
	.xword	0x4fd3cb4ee71b1ceb
	.xword	0xdc16dfee6ca68fc0
	.xword	0x24713b1d62c31b97
	.xword	0x66a8f0cf4146ef86
	.xword	0x83edfa6227c53376
	.xword	0x6bc5d9f6d339206d
	.xword	0x85e51b2bdf3a156d
	.xword	0x90ca6ff0d2d99339
	.xword	0x1286f04f2237e473
	.xword	0x3f86f8ae5d36c3b2
	.xword	0x0fd7f3acc6e72e53
	.xword	0x32ebf95e6a77b384
	.xword	0xf43b06719f521763
	.xword	0x4dbb7160748895ae
	.xword	0x73290253ec68d92c
	.xword	0x0992c4317469a050
	.xword	0xb6172cc04adef38a
	.xword	0x4ac414c27bcc3907
	.xword	0x74ca8f3e35b40c94
	.xword	0x1bd338e8fa3113da
	.xword	0xbd5f99f7f215d9f2
	.xword	0x4da1e7276451d4e7
	.xword	0x072ef6729073afa4
	.xword	0xf6a82daf47fe5367
	.xword	0x145349dbac115f34
	.xword	0x920d9eb574c4a271
	.xword	0xd89443f50efc83a8
	.xword	0xe30f86aa63dd968b
	.xword	0xbcaa2e346de51918
	.xword	0xfa3e38c7a83d6b64
	.xword	0xfe31937e2db4c33a
	.xword	0xb4d62c34e51ca8ae
	.xword	0x1ffb386c803970af
	.xword	0xf98a0a82d53e6175
	.xword	0xa91cf4cc75ec322c
	.xword	0x0509729c83db9af0
	.xword	0x2bb11606e972a55d
	.xword	0xe5ddc9a37cc9b462
	.xword	0x53cd5fbd8ca39002
	.xword	0x05b1ea95721a5413
	.xword	0xca2482ed53b14ed0
	.xword	0xd1dac819d82b4d1e
	.xword	0x9997d9d0e8df8214
	.xword	0x9dcc5eca06682cb8
	.xword	0xe0dacb635ba0426e
	.xword	0x90a55ed13d9f6b4d
	.xword	0x34bb7506c8f1001b
	.xword	0xb9fa04276e3f1f1c
	.xword	0x5bc266993e6a7a92
	.xword	0x849d38df3b96053e
	.xword	0x832a507d42fed93f
	.xword	0x3bb43dec42856b40
	.xword	0x5bc04211ba7dea56
	.xword	0xe47294cd6ab6153d
	.xword	0x980227b5d614bbda
	.xword	0xef3a123bd213f1c9
	.xword	0xd1241b5d66ceff21
	.xword	0x6a6851505491e3ae
	.xword	0x96ca252335a584d2
	.xword	0x7c7eff4af1d94cb1
	.xword	0xc5e00296dd860368
	.xword	0x5f990872fa7e8ffe
	.xword	0x0cf86228426e9f3f
	.xword	0xdf90af1a15df68e8
	.xword	0x402e46df788c2aa3
	.xword	0x4a5c34dfda78aa74
	.xword	0xc05a56b428278561
	.xword	0x2aab7bc80928ae85
	.xword	0x5e678b2ca6afd059
	.xword	0xd19aaa907e0059ca
	.xword	0x97b316128c4d7784
	.xword	0x4fc02abb0ea964e5
	.xword	0x1b708ce8afb33927
	.xword	0x784ed7c3f48c61b9
	.xword	0x86d09f4a23de901e
	.xword	0x0a0b80a1a4a09df4
	.xword	0x474fa6a1bdb6095b
	.xword	0x70ae0b29f856c6d2
	.xword	0xad663a147310782b
	.xword	0x6c86f7c9b06e03b9
	.xword	0x158bc249fd76a790
	.xword	0xae09fb0ca2692d91
	.xword	0x23b5375263b2193e
	.xword	0xd29d590609cab872
	.xword	0x086d10dc91e287cd
	.xword	0x7e91d2c16064322c
	.xword	0xb847d69d3ff3aa88
	.xword	0xcb00ecc3d6d35f2e
	.xword	0xed102298159a9ec3
	.xword	0x22f9b1f470cb480f
	.xword	0x2e71ca755eca6fac
	.xword	0xc521327bea0dbe0b
	.xword	0x8f94a5825853af38
	.xword	0x8ef8f9be061998a7
	.xword	0x5d2c9d168e270a3b
	.xword	0x49ec6b664c4e5a67
	.xword	0xf6790088acb2fbe7
	.xword	0x28e191bc6a4277d5
	.xword	0x4fea8651f2c449e1
	.xword	0xf181a41bb0c76e0d
	.xword	0x0230171ea46fe257
	.xword	0x7b4406dea6f0fb24
	.xword	0xf10305dab9e30595
	.xword	0x778db1a6c296ce06
	.xword	0x8bd5fe7c3923fc3f
	.xword	0xc673c8814ece904e
	.xword	0x2e377fd0961958e1
	.xword	0x248235a731be1be0
	.xword	0xf1e72a23ed735ed6
	.xword	0xb39866a1f8c1c2a8
	.xword	0x9aa6914d9c5445f0
	.xword	0x9139cd0f5bbad950
	.xword	0xf3136412e11f36a4
	.xword	0x1a22e9b6cff0e076
	.xword	0x8a8bf22e3a92d278
	.xword	0x788a272c9049dbda
	.xword	0x4f6d2efd8742869d
	.xword	0x9fae7fd37e057ee0
	.xword	0x214e931af1b52ac6
	.xword	0x161a3ee2d4a9f033
	.xword	0xe7c16213dd884101
	.xword	0x9304dfa21d1d5262
	.xword	0xd9e6342a719f4b85
	.xword	0x527f74fc4a5b59e6
	.xword	0x7b72f396fbc7d6b4
	.xword	0x06eef28d6a37295b
	.xword	0x4c7bda89f4257c53
	.xword	0x986e270619f911e6
	.xword	0xed0f1f5eabbe0515
	.xword	0x35dcdeaa0c435a71
	.xword	0xb4d44a6883667308
	.xword	0xd0f5093d5c3e63d0
	.xword	0x1fea32ac5b04dc73
	.xword	0xb5f913fbefc18192
	.xword	0xc2a74eb31342a987
	.xword	0x2fb95060fd6e6843
	.xword	0x3b29fe8b17d367e3
	.xword	0x2d9cba27fec660bc
	.xword	0xa7d38d30183e78f0
	.xword	0x48a5e39457ecca14
	.xword	0x6fc521625b79a8b7
	.xword	0x8aec21f4aa2f6ea8
	.xword	0x0a91f82c8db51d23
	.xword	0xfd5358979ff15eab
	.xword	0x3d23df9c903afc13
	.xword	0x412595f13bca7b59
	.xword	0xb853a6fa487619fa
	.xword	0x21d772b3aba2daf4
	.xword	0xa14bdf001ed2881b
	.xword	0x552130f85872638b
	.xword	0x668029fa1cb2e7eb
	.xword	0xc34492506a97cbbc
	.xword	0x38d1b17eed30956c
	.xword	0x21d0406225a2837f
	.xword	0x96d53a66b582a273
	.xword	0x9eef76db3bd8dc04
	.xword	0xfba8dd98754064c4
	.xword	0x89d22de2c9da0307
	.xword	0xf8323620c01182ca
	.xword	0x3c5d9c5215a63b3b
	.xword	0xd3b94af8c0b2bec8
	.xword	0x3751e1fb5834b5c7
	.xword	0x4ebf829be3e32ddc
	.xword	0xebbf663b6e309a36
	.xword	0x0947e1cb38e4f132
	.xword	0xa2c39143859afbf2
	.xword	0xce5417538642e843
	.xword	0x9e6ae59d31245e76
	.xword	0x81a17aa160513397
	.xword	0x5cd22ef8503bb4a8
	.xword	0x69e7ccbe06197bfd
	.xword	0xee07ca48eb16bd7f
	.xword	0x682cd54f0a5c9586
	.xword	0xaeced9bdc4580289
	.xword	0x9356401b9118ebbd
	.xword	0xf0d3f8d317648c0d
	.xword	0x81bceb198a186d2b
	.xword	0x282e3e6d17911a1e
	.xword	0x5f290b7edcc1e4f1
	.xword	0xf5f50355ed2b9f7b
	.xword	0x505a9f256dd9db40
	.xword	0x4030be0661dc3dad
	.xword	0xfd239a8001705668
	.xword	0x24d8f43695a23fec
	.xword	0x1eb907ca52835962
	.xword	0x948760646e907b2e
	.xword	0x29851c260ea56ee7
	.xword	0xba555c56dfc652d6
	.xword	0x6131c95348369227
	.xword	0xe5bc02d9367f148a
	.xword	0xca15c9c90c2b9cdb
	.xword	0x461c4e55e463987e
	.xword	0xb70813c4944c040a
	.xword	0xba5a3722b5d38939
	.xword	0x582f2db7911cd8a7
	.xword	0x193dc849ea32f8ce
	.xword	0x3ab27a5691f8b3e8
	.xword	0xb8fcc0211eedb925
	.xword	0xb96ee7b3af5521ea
	.xword	0x0a3f667019c1aa0a
	.xword	0x7cc2e9f84a306403
	.xword	0x46b60677091cf079
	.xword	0xef80c392e0460f23
	.xword	0x1b919f6e2d128f98
	.xword	0x94ef2537fefd2808
	.xword	0xfac3725349418bfa
	.xword	0x0d729f52094e4104
	.xword	0xd49fd9cf1ba46a61
	.xword	0xe08981ff2daed25a
	.xword	0xebcb92c3dbaddbef
	.xword	0xdfa4c310e37bc68b
	.xword	0x67e5444e2b879535
	.xword	0x547c4aecf33a4a97
	.xword	0xccb1f931847d75a9
	.align 0x8000
	.data
data_start_3:

	.xword	0x431c16680269da93
	.xword	0x926ece90216f43eb
	.xword	0xdc519be088714c85
	.xword	0x1338880b885f89c7
	.xword	0xb071e11303f8187d
	.xword	0xf368d4e7f4ccd014
	.xword	0x9d7ba8682384f935
	.xword	0x4dd3eef2e746ec38
	.xword	0x71fe269eb91ca72a
	.xword	0xfa5353005a884fb6
	.xword	0xcdbc6df59a9ebe42
	.xword	0x539ec66539f00d24
	.xword	0xade03cf29ed1735d
	.xword	0x3064b455260d421e
	.xword	0x8ec37fd70b420551
	.xword	0x0c78aabdd5f831c8
	.xword	0x6a088e3ab5990d04
	.xword	0x8f61a926252fbc63
	.xword	0xfc73c82c3c6c07e1
	.xword	0xc30d3311022b1e78
	.xword	0x1c1e93dc90c3bdb1
	.xword	0xc8bbfb7696f330f7
	.xword	0x450e76356c4b71b9
	.xword	0x96afcbdb1fdb6ac6
	.xword	0xcc4ce9a099ab702e
	.xword	0x97c5f68383574ab4
	.xword	0xf5ac3d964458054f
	.xword	0x97cd62b4533ca156
	.xword	0xa6885072fc24ee09
	.xword	0x50d4cdffb797463f
	.xword	0x8b77747fae8bf219
	.xword	0x6fb0f9286c33803d
	.xword	0x68b60dce2c0b73e1
	.xword	0x286e158ecdc0f105
	.xword	0xb089692b3edbbb5d
	.xword	0x495945698fcd6e0a
	.xword	0xe1f467bb48e08e9c
	.xword	0x33c4b6c53cf57d53
	.xword	0x2e5955b5a940875d
	.xword	0xbb333ef37959bf69
	.xword	0xe99815aaf5ee935d
	.xword	0xf6b117a5a9d52f70
	.xword	0x26290606587813d8
	.xword	0x6c9a4b19a0a08996
	.xword	0x16ebcfc95fbc8b6d
	.xword	0xc4bf9fee0d07c06d
	.xword	0xdce62a3ee40ca806
	.xword	0xd758fc44aa1abc11
	.xword	0x2585dd0c658ee564
	.xword	0x9084c2b714830e44
	.xword	0x4b133e75510ee6a4
	.xword	0xcfc23a9f2aacfefd
	.xword	0x51d5af8f85a32073
	.xword	0x7977752091ce6fdd
	.xword	0x7fadcb069dfdfd36
	.xword	0xf8f25fb20c0a189b
	.xword	0x6d19048c455bb8b3
	.xword	0x1abb1f7e1fb25f0c
	.xword	0xa1b4f1bdd9234bed
	.xword	0x7c6008a0d3703e86
	.xword	0xa425a51fdc807e65
	.xword	0x7af7c1622e204d9e
	.xword	0x6fbeb104615d9e12
	.xword	0x7a583f779d143d85
	.xword	0xa4057fbbeb428217
	.xword	0xe33bbd0de84464f7
	.xword	0x59dae09454816e31
	.xword	0x6e45f9b3e745c297
	.xword	0xe6ab0b2a12ac6c2b
	.xword	0x1ee5f35a9539f5f3
	.xword	0x7050b61f1a16c9f7
	.xword	0xe337b2bc193717b1
	.xword	0x6392a662a9a8a1ae
	.xword	0xe206b7a46981b278
	.xword	0x7c709bf7ad1e1ece
	.xword	0xb81daab0080d0a31
	.xword	0xe6a37ceabaf132d9
	.xword	0x12825de1b5df566e
	.xword	0x1b1b88272d7af8cc
	.xword	0x36f5dffd9910ab7d
	.xword	0x84fb956df4b71d7c
	.xword	0xd3bddc72b6e05e33
	.xword	0x55d0f8bd9bd273f5
	.xword	0x339bb85b2c7c7a70
	.xword	0x22172d5f031cdf25
	.xword	0xea5daea1bb298766
	.xword	0x075296a79f1dc3ff
	.xword	0x0b7b3bf5638955fa
	.xword	0xb0a53763d01771df
	.xword	0x27d8893a1dec71b7
	.xword	0x0b0af84c90087e00
	.xword	0x72ae9808124883c5
	.xword	0x7e4cb84b589ab3f0
	.xword	0xa9fe1b46fe1e1b5c
	.xword	0x8902b382fd037171
	.xword	0xa59a6246cae0411f
	.xword	0x21e8df57363c6c11
	.xword	0xf2fec9a033ccd5d5
	.xword	0x11c77cb920ccd1f6
	.xword	0x475efdecb03df1fa
	.xword	0xa54dc2456ae9ae12
	.xword	0x1b88cb79e87d5634
	.xword	0x006288e322d087b7
	.xword	0x50567444804aefe7
	.xword	0x47f2512dd093523a
	.xword	0x5b302187a2bee197
	.xword	0x3abc08d1a9a05fad
	.xword	0xb59a079e630f7ee5
	.xword	0xb26dc98296432268
	.xword	0xd2ec5190447f9b3d
	.xword	0x86071350c3fab11e
	.xword	0x5149e76568aebcc6
	.xword	0x2991b3ec80fa7372
	.xword	0x9dbf8923de510ff6
	.xword	0x5194738016219292
	.xword	0x2d416560b0a75511
	.xword	0x09e40b2bc5195a7e
	.xword	0x9bd7c32cc6870176
	.xword	0x00b61460b8a70b7b
	.xword	0xc63fe1fcd503aab5
	.xword	0x5eeef764098c8194
	.xword	0xa0cb9c9dbd88b6c6
	.xword	0x13201f66523eda40
	.xword	0xc9f651149373e57b
	.xword	0x0bda35a89c231090
	.xword	0x0f8934a9678e1c7f
	.xword	0x583cb040e3ee30e6
	.xword	0x72c34e14b08c0e28
	.xword	0xe18a2cb9d13b0ce5
	.xword	0xe0629292e53ce85c
	.xword	0xee29a7832583d0d2
	.xword	0x1c48ffcf3d14d9f5
	.xword	0x8ded97468e59aa41
	.xword	0x9563156dc45baa10
	.xword	0xbb43455579e795ac
	.xword	0x1d917136e826e004
	.xword	0xb82609cdfc050e10
	.xword	0xad436f528d200cbd
	.xword	0xdcb291e26cc20c30
	.xword	0xb836dd255012fe57
	.xword	0xfc1ea875732a28aa
	.xword	0x462fc6abe5247755
	.xword	0xdd8dfb2fceb612c0
	.xword	0xe7ff0a26ac0fc93e
	.xword	0x395b7e413b77ef13
	.xword	0xf638ba9009635846
	.xword	0xf75c305af54ff2bf
	.xword	0x96cf076fa57e2d0c
	.xword	0x547a8cc0092c6bd5
	.xword	0x1a063bdc56fa9cca
	.xword	0xc0d0b778f8af244c
	.xword	0xe90fbc9b6030bcf0
	.xword	0xa98adafe9e9cb065
	.xword	0xb1ec6e03f1008418
	.xword	0x041c7c7e184fcc00
	.xword	0xdc9d0789d195160a
	.xword	0xc04dc577b17d2c94
	.xword	0x65a969025dabf5b6
	.xword	0x594bbc83c4ca0236
	.xword	0x3d98764738d80bde
	.xword	0x386e3cf530696798
	.xword	0x07fb9be2bf8715b4
	.xword	0xb00c74ab4ff457ce
	.xword	0x2ca4b237f6685d2f
	.xword	0x70b346e1b1bd2712
	.xword	0x5d2344d6442690bd
	.xword	0xd0113a381df74d55
	.xword	0xf5ca0b0646292fe6
	.xword	0x81a39cc173e5132b
	.xword	0x7069d08af668d6f1
	.xword	0xf7a82a8fc82407e5
	.xword	0x7244dcea99dea380
	.xword	0xa0821594e6e106c4
	.xword	0x253b2779c6f59c4f
	.xword	0x46bc0db7f57d06ed
	.xword	0xc7542f81f1b43013
	.xword	0xcf35f207ccfefb75
	.xword	0xba2792bccfe75e2e
	.xword	0x46758616c46bac99
	.xword	0x3821045b3461d870
	.xword	0x5d50622d24669cc8
	.xword	0x0f9839a04ad59d72
	.xword	0x9345597c2eb170bc
	.xword	0x832d2ae568992998
	.xword	0xfb5bbca6a7f219ae
	.xword	0x1e9b23caf20c864d
	.xword	0xfa46dd2ae730d741
	.xword	0x3dd49d1af92e7957
	.xword	0x92f5c5fb713a71b0
	.xword	0x1d1091a4b0d6a126
	.xword	0x9f3856086138e576
	.xword	0x3468c201689ce754
	.xword	0xf0984580885076ca
	.xword	0xb97efd97abb95557
	.xword	0xa13877ee2b796c4c
	.xword	0xacc1bbe43655545d
	.xword	0x6ae490b767fa46b9
	.xword	0x19c83a5df7a1dd23
	.xword	0xefb0dc355f48d79e
	.xword	0x30fe93ab37c920f1
	.xword	0xadf993e6a6f58c65
	.xword	0xb5fd1672b2c9453d
	.xword	0x52a553bca0d2e9da
	.xword	0x145d3d4a287e24ed
	.xword	0x4a1eb69ecc6bc955
	.xword	0x35754b8fb1065298
	.xword	0xbb8fd0f6cb16fd1a
	.xword	0x050f633f2d3e9687
	.xword	0xec6fb92ae04355d5
	.xword	0xaad7d3e939c4f32d
	.xword	0xe994efdaf5f7a575
	.xword	0x8572ead0d6fd94dd
	.xword	0x9b0b5eecc8f2bed9
	.xword	0x9f8625e6906c55c9
	.xword	0xcfa285604d2d17f2
	.xword	0x6561d25b5bb8235a
	.xword	0xcc890330dee43d91
	.xword	0x2d871922c67afd94
	.xword	0x9c82b9e7758b99e5
	.xword	0x26c3e71f7e24d8a7
	.xword	0x71bdf25832ff80f9
	.xword	0x48dc70a48b51845a
	.xword	0xfacb9038947f88eb
	.xword	0xdf76bc0d28eed754
	.xword	0x4f48ef0427470e7c
	.xword	0xc195b3b75e48abeb
	.xword	0x1df86889262a9366
	.xword	0xb0e91f68a19bd9a0
	.xword	0xa549d3f77b226b4a
	.xword	0x7a097b8c0edb208c
	.xword	0x558764efd65ff838
	.xword	0xcf52ea6a67b9a5d5
	.xword	0x8434286bc1e2d739
	.xword	0xd31f0b7ce6e2063d
	.xword	0xcc2f667b8ede1e08
	.xword	0x3be4887ed79036c6
	.xword	0xc5c5a3e3566546f4
	.xword	0xd726bf2b40adfbcb
	.xword	0xbd1a42a1a1c53868
	.xword	0x8507885fb0dca560
	.xword	0xa56d6003884fb346
	.xword	0x0fda7b29216029aa
	.xword	0x781d835aa83c8615
	.xword	0xc88486d3bfd94b4d
	.xword	0x1992bd89fe07bb0b
	.xword	0xe83618a60ea5d671
	.xword	0x83990c07b776d985
	.xword	0xc67f650b5b0890a7
	.xword	0x7f19031be967b14f
	.xword	0xd66492905c3e0a35
	.xword	0x506a8af3960d69fd
	.xword	0xe041a876d3648734
	.xword	0xf6f5a5bde55f422a
	.xword	0xf6332d97e67e4a58
	.xword	0x1d285d90599067eb
	.xword	0x2293cb9eb58ea151
	.align 0x10000
	.data
data_start_4:

	.xword	0xea96d7272983177d
	.xword	0xd4a9beb5dddceed0
	.xword	0x6e1c6a5ff3ead60a
	.xword	0xebeffd04befa9a22
	.xword	0x685b9492e0ccd354
	.xword	0xfa64fa2f4badbd29
	.xword	0xc956cdcda7590a69
	.xword	0xbeabd0ad949daaf6
	.xword	0xfa6f480698b20866
	.xword	0xd50235ba9985dc11
	.xword	0x55739a4adf7fd079
	.xword	0x947b0d8632331e74
	.xword	0xa144d1f3ab291ed3
	.xword	0x6ff5e52786e81715
	.xword	0xf397e2a2f6760a6c
	.xword	0x38c371bd3749270c
	.xword	0x53adf6da711869a2
	.xword	0xfb3a02b3723f4e5d
	.xword	0xc0549911225a955a
	.xword	0x6f314115b4feb038
	.xword	0x27e99eff567668fa
	.xword	0x6fe7b324c5c6b733
	.xword	0x3d36d9afbe8bbe93
	.xword	0x944dadb4ee92cfff
	.xword	0x1028b892402dcd7f
	.xword	0x438f80f73dcd5a38
	.xword	0xb43507bc1208e345
	.xword	0xd0b50e79b09dd8cf
	.xword	0xbfe29971c20ee4bb
	.xword	0xc013db56e2498b59
	.xword	0x1b0fa6d355aadb40
	.xword	0x9020046471b74fc1
	.xword	0x727cddda94c74621
	.xword	0xf873cfbea2d94cbd
	.xword	0x7bd55eb0b02914ec
	.xword	0x98c1d6079d3a198b
	.xword	0xa53d6a37a32037b0
	.xword	0x8cce52a2de476139
	.xword	0xa66a4449443e59c4
	.xword	0xdd686d29285fae99
	.xword	0xb68a9d16d224e073
	.xword	0x8746de49a10fd00a
	.xword	0x5405f4f10e8b6b85
	.xword	0x5a658300fffbc8bb
	.xword	0x1c101e0848ae72f1
	.xword	0x793635069a18c7a4
	.xword	0x7b1f0115386fee75
	.xword	0xa82cfde2aed67a00
	.xword	0xeee3edd8f316e5ff
	.xword	0x454ac9118849bf3d
	.xword	0xa9e73292dd687aa6
	.xword	0xcff05fa77a586874
	.xword	0x8b4feefdde4ba6ff
	.xword	0xc094fb61dc1696c2
	.xword	0x0244fca2c7ce4a77
	.xword	0x473b0e0e3860afae
	.xword	0x8ee743e59dc50113
	.xword	0x1aab511a4f447a3f
	.xword	0x4f32b42251b2e246
	.xword	0x5fd8b4a488d696ed
	.xword	0x9bf72dfc62fffcfe
	.xword	0xa7fa11a011c699c4
	.xword	0xf5e57ce3eeaf67e7
	.xword	0xad440889e0ddd8f4
	.xword	0x0179dd08c7cbc7c8
	.xword	0x7266d3cbe6f2815b
	.xword	0x72cae4c7378fa2ba
	.xword	0xb4f7e053229307aa
	.xword	0x3ce2ad9ff0f87f99
	.xword	0x92ec88384b6571e6
	.xword	0x288328bb4ce2a2fc
	.xword	0xf4caa8f6b7191fb4
	.xword	0x62a4d7dd9c929b86
	.xword	0x7a367927267c59ec
	.xword	0x03fe828662c0b892
	.xword	0x18d011808812df28
	.xword	0xa0fc2f8c96ce8764
	.xword	0x0b48218c3a678c72
	.xword	0x026a2077ed271506
	.xword	0x06c3b016755a2798
	.xword	0x11fe6450a7d8640f
	.xword	0x7c682b9bd6ede603
	.xword	0xb3d005317690791a
	.xword	0xb659256fd6a58414
	.xword	0xa222a4784cea6c2c
	.xword	0x401799af448d1813
	.xword	0xd9e34815d0c8613f
	.xword	0x55a92d19ec30eb65
	.xword	0x950ed21f67bdb513
	.xword	0x291b42c022f2c054
	.xword	0x7f35e064da98b01d
	.xword	0xa0444a42c21521f3
	.xword	0x426c9f56e6ebeec5
	.xword	0x7d7a5fb4978172ee
	.xword	0xfc9c90c93d969269
	.xword	0xc285c56e8c967b4f
	.xword	0x850445cda8cc11a7
	.xword	0xcefd0d5552c282a1
	.xword	0x0dc0f4b44585cd8b
	.xword	0x4eabab5ab9ac498d
	.xword	0x7ae115b0fc54063c
	.xword	0x68b6168fdf1eba5f
	.xword	0x5f0439deca4f38cd
	.xword	0xab60a81e0552d18c
	.xword	0x0060e0556ca9c699
	.xword	0x8f0b812dde285968
	.xword	0xea61459d422c0729
	.xword	0x8ef62d977ae15efe
	.xword	0xdbed739fc8f2e231
	.xword	0x14ee51f2c2e76718
	.xword	0x32c72dd5e4b3a060
	.xword	0x979d2d4029a40706
	.xword	0x24d67c5a5033aff7
	.xword	0x4f85459d88f011b4
	.xword	0x7b4892efb8dc3128
	.xword	0x66ba5a1c7e3dafc3
	.xword	0x84564008fc51a52a
	.xword	0x4fc9d8c58c32e3e0
	.xword	0x03f7bcd4bbb4fec5
	.xword	0xb98d84348f82bf22
	.xword	0x99758a230b37614d
	.xword	0x0d937c5e09df9efa
	.xword	0xcdda8f2228ea1993
	.xword	0x87190c0ddc7f7174
	.xword	0xf1031d8c4d9902ff
	.xword	0xc5e3544316bcfec4
	.xword	0x839c54d511d12406
	.xword	0x3d0925a92fe3bfe1
	.xword	0xa9942ba293d64880
	.xword	0x639a18e8feb10b48
	.xword	0xaedf586a704be5df
	.xword	0x76c08c8f348fd213
	.xword	0xbfff7d9e7917d2a8
	.xword	0x0f109cc789310340
	.xword	0x593e06aac664c7b6
	.xword	0xf40d06ed9fe61c98
	.xword	0x14142817b99f1b45
	.xword	0x5300957fa0a520b0
	.xword	0xfca99b16bf0b9db0
	.xword	0xbb87e6dbb7731206
	.xword	0x821a6e679cf56e0c
	.xword	0xa6a29eccb47f7dba
	.xword	0x77c0127f284aa910
	.xword	0x15bee92e073f729c
	.xword	0xd5e8bb95c2bce498
	.xword	0x12a088a77c296d90
	.xword	0xbcc7a72f2561c235
	.xword	0x2252b2a7a31e0656
	.xword	0x638dea6b32209d5c
	.xword	0xeaa0ec154141e7a0
	.xword	0x52074f036d413cca
	.xword	0xe54c81abd7571c76
	.xword	0xc7d6a12f34eeffa1
	.xword	0xb317f16b295310e8
	.xword	0x144d2ecf64d9d971
	.xword	0x619bc23a00ece7dd
	.xword	0x0e465e0f16d8a439
	.xword	0xab1199894339247e
	.xword	0xd2d81e08bef8f586
	.xword	0xfc3fd3021611928d
	.xword	0x696e486f982eca18
	.xword	0xbbc06830c3c69329
	.xword	0xdda7e8e1dea385b7
	.xword	0x648dffbcd9cd3219
	.xword	0x703191baf8055a74
	.xword	0x54498d29c784d438
	.xword	0x0c6705a449d6889e
	.xword	0xf3c551deb2302d67
	.xword	0xcc3cdd398f192587
	.xword	0x6c9ed1d92c223e83
	.xword	0xb0bd4f7e41f07677
	.xword	0x28b6a05a8da30583
	.xword	0xb2cae69624d84d02
	.xword	0xfd0db099198ea22d
	.xword	0x6e5363842ab5a8c6
	.xword	0x9ac50bfdc7aa0b32
	.xword	0x5abe50d964353cbd
	.xword	0x3d81a2b6a6dd6205
	.xword	0xa38ba2d199c48c41
	.xword	0xf8f2d8035a4e95f5
	.xword	0xd43d19d914bc972b
	.xword	0x0129732082a661c7
	.xword	0xc7f4873f083bab63
	.xword	0xe3e810b476532889
	.xword	0x3d8b433cd8c8aafe
	.xword	0xaafecfa209bfd203
	.xword	0x921bc6ea6638e646
	.xword	0xf06b7bbcf26b4170
	.xword	0xf1f2f159fdd99361
	.xword	0x5966349c865a9eb6
	.xword	0x643579b48783966a
	.xword	0xd908c4b7a1e960cd
	.xword	0x8fb1c4457004c1dc
	.xword	0xe9cb8eb5562a2888
	.xword	0x03c02bb901b83a6f
	.xword	0x550d4402730ea776
	.xword	0xb90ebb688e271be4
	.xword	0xaca81542fec0139b
	.xword	0xa041944e61ffe0a6
	.xword	0x1f07f09ce132de3e
	.xword	0xc450e4a4339ab85b
	.xword	0x255603da8b1ba994
	.xword	0x436209b8926ebdb4
	.xword	0x840f0b4fe6f30a1b
	.xword	0xe9a61219eada66de
	.xword	0x10bc9c4a87a81d5a
	.xword	0x2e2ec78187edb5da
	.xword	0xa4ee0ccf4b79db90
	.xword	0x262cd28831e07723
	.xword	0x0592e70bc5f5695e
	.xword	0x0aeeb25ca6c138e0
	.xword	0x402622f54167f525
	.xword	0xf731e33c1773cd5a
	.xword	0xb6a78fae9291cafc
	.xword	0xd8015aada6ecb892
	.xword	0x45d85dd88035ea9a
	.xword	0x9227d3762af72978
	.xword	0x48ea42c7fd9e7522
	.xword	0xe896d21e9566d46b
	.xword	0x33c446ed063c33ae
	.xword	0xabed4ea8ad5692dd
	.xword	0x64fb3912ec488a3b
	.xword	0x38fefdb1308cba3b
	.xword	0xa4fa2a7643640bae
	.xword	0xd5db4018aaf3e070
	.xword	0x65dbb766b42c399e
	.xword	0xbe65f49418e9c45c
	.xword	0xce6636358c8e1a1f
	.xword	0x1887bf9e6f33639b
	.xword	0x77b2af2de090d1e7
	.xword	0xd09020686cd24886
	.xword	0x502cf731886ae423
	.xword	0xe3da29c7e9b03bea
	.xword	0xd6a5e09ce854a3ef
	.xword	0x77f4754222c09fa4
	.xword	0xc98b9b0bd4ba8ac4
	.xword	0x239f1a4daf0242f5
	.xword	0xd298d8c72814482f
	.xword	0x30210c5326bcf6c0
	.xword	0x07f7f25186c9a065
	.xword	0x692bb73784f40fd9
	.xword	0xff9fce26fa776ed3
	.xword	0x0627a28afb6cdf70
	.xword	0xe4c30c5aca509fdf
	.xword	0x4a4d87e6a4949b2b
	.xword	0x1ca0256636e6e216
	.xword	0x5993b8dd2f89376d
	.xword	0x57175c76332d6799
	.xword	0x8a3b5448e658a1f3
	.xword	0x5af1d15b1b18d9c7
	.xword	0x07896e61f36f6bee
	.xword	0x6b34d72b7f8d7279
	.xword	0x5755b070c6d1378a
	.xword	0x461a9d8651d3d685
	.xword	0xe1a3c6362fa7ebe5
	.xword	0x481b45645188bc2a
	.align 0x20000
	.data
data_start_5:

	.xword	0x1c29fe02163d92b1
	.xword	0x4daa05b87bcbb35b
	.xword	0x4655c275d5c0b4c0
	.xword	0x41e6db4cd8c3e116
	.xword	0xa249eaf6d2da4214
	.xword	0x20dd857fe018c32d
	.xword	0x06816cd36e5b0ed2
	.xword	0xe38789079421d013
	.xword	0xef002ca5cf349173
	.xword	0x9d18f14f068e01e7
	.xword	0x95b1faeeafd402e5
	.xword	0xdb3acd63bf17d3d5
	.xword	0xae982b0d8e05fef7
	.xword	0x464019b85bbe264e
	.xword	0x564d56b604eef9ea
	.xword	0xcfaf0f229a0029ab
	.xword	0x786f0da9cf3ff38e
	.xword	0xcbd2bd4abcc383b8
	.xword	0x4e1cd9af1592e4ad
	.xword	0x2539135f91a6b48c
	.xword	0x43b693dd8c29e771
	.xword	0xb84d03dc6a4a20de
	.xword	0x689f11123c708e16
	.xword	0xa7e77bfa39b6cf03
	.xword	0x48be332cc39c4be4
	.xword	0x3623fdd065a66f07
	.xword	0xb1b3c0d7e5554f74
	.xword	0xba722ee07a233f21
	.xword	0x32d04f57e608b72c
	.xword	0x79c74fbad61417a0
	.xword	0x572519c3ddd745d3
	.xword	0x831c180b46d50f40
	.xword	0x42f4126428dabf40
	.xword	0xf7382c7522b5cc20
	.xword	0x5c6dbc492e7df2b4
	.xword	0x05be431d6a2ca375
	.xword	0xb734e87c9916134f
	.xword	0x0922e1fc440da67b
	.xword	0xea864f9835062dbb
	.xword	0x0ba403058cca9060
	.xword	0xddf5d40f84337960
	.xword	0xe359860bcc23b432
	.xword	0xee864928246f66e2
	.xword	0x9b25763270512fe7
	.xword	0xdfe9504e66d3b85f
	.xword	0xdb4b61cda4bfd650
	.xword	0x71a097ca1395078c
	.xword	0x9e53f114721273ea
	.xword	0x6bbec4482c0c4b48
	.xword	0x10b67aff4309c1f5
	.xword	0xcec8e098e7a92a8b
	.xword	0x39a491a04c079bf5
	.xword	0x3ce69769388192d8
	.xword	0x226a8b295fe2899b
	.xword	0xf1913ea57cc5bd4a
	.xword	0xf224676b7a2506d2
	.xword	0x956c90c1bfe32add
	.xword	0x931b5201bf4ecbbf
	.xword	0xa894b3e121d89ddc
	.xword	0x91b4df39fc667380
	.xword	0x58d4965b99d52208
	.xword	0x3096df1787fa98e9
	.xword	0x88a397a0263274ee
	.xword	0x957aea597ed8474d
	.xword	0x678786442e2ec93c
	.xword	0x3bf443d4e457ccf0
	.xword	0x17d71c64893d81e0
	.xword	0x3e9d39b58ee19baf
	.xword	0xfa9176ccf697e232
	.xword	0x0e5fcabb3391cc2a
	.xword	0x9e3ee387d4e5bd8d
	.xword	0x3462aa0f6572e16d
	.xword	0x90d4045e240d90bd
	.xword	0xca18e6c5fc10d728
	.xword	0x85f529529624e11b
	.xword	0xd5f91e1b121dfbee
	.xword	0xad0ecef2f48753c1
	.xword	0xb0c774543ea6428a
	.xword	0x6be46417610cc81a
	.xword	0x057b7bffbe3a0833
	.xword	0x3372cf14ac83430d
	.xword	0xf2bc2980aaa2807d
	.xword	0x3e9ea3557c92c7bb
	.xword	0x30fb78e436174267
	.xword	0xab2c3548613a5e9b
	.xword	0x094fdc40315762d5
	.xword	0x236e73ba03c16fcd
	.xword	0x75639185b08c3ef9
	.xword	0x74021f66a2b4aac4
	.xword	0x78d0ccaeb4e14554
	.xword	0xad63279d423a89fb
	.xword	0x703f80b3d072591c
	.xword	0x84bbfedace8e7065
	.xword	0x301f3bce32d84706
	.xword	0x85be657f44da2b20
	.xword	0x762667b8bc942d29
	.xword	0x09cbbc7846ccaf37
	.xword	0xef977bfb090756c4
	.xword	0x6075dba480b0d8ec
	.xword	0x76e888122fadec06
	.xword	0x04f20c18de430cdf
	.xword	0x9ec91d3c049834bd
	.xword	0x165fb61eaad08839
	.xword	0x3e0b332f36d50b64
	.xword	0x827054b6c17a0022
	.xword	0xaaa7c2e895ca412e
	.xword	0xd6ec9e1bc802ac82
	.xword	0x9b7ed63e0960cb52
	.xword	0x4ab25337051cae22
	.xword	0x5595fba7e63198f0
	.xword	0xefae48865df16e8e
	.xword	0xa7ffeee83b0a0de3
	.xword	0x465f812e42f327cb
	.xword	0xee39b2c0efbd4c15
	.xword	0x9c8513b3999e172d
	.xword	0x13acf04686d3f3ab
	.xword	0xaeb45e2ec791f63b
	.xword	0xbd226b42f73fc315
	.xword	0x5d776d55e91e1864
	.xword	0x8d4ed3d9395b79d9
	.xword	0xcec335bf1a3bf90f
	.xword	0xebb857501967aaeb
	.xword	0x32f33c74c2aa11e1
	.xword	0x97414ca3154adb08
	.xword	0x01d1a6d38c73b2f8
	.xword	0xb12c0e9deb389e97
	.xword	0xabbf318d6e443262
	.xword	0xa49de8076aef7262
	.xword	0x56ef40fd7780b664
	.xword	0x1e44c2c3a84ff14a
	.xword	0xc4debb600d970af8
	.xword	0x3626bb54c0bb034b
	.xword	0x565deef0d759427b
	.xword	0x7eb4dddb5ae262f6
	.xword	0xfbca562a811a6518
	.xword	0x40f9f3c62f80bb62
	.xword	0x33392727b0b4692e
	.xword	0x9d1ab44c36ed8cce
	.xword	0x7f002c8eb58d1ef3
	.xword	0xef6b38a22406f823
	.xword	0x5dc7aa2adeb0879d
	.xword	0x960477ceab7bbf59
	.xword	0x41ec95908a255e59
	.xword	0x8bd66ac1d0a7430a
	.xword	0xdfa128be86445550
	.xword	0xf901e9893b6077df
	.xword	0x83b0c07fae4db6a8
	.xword	0xef8e86993dcf0d7a
	.xword	0xb32688f6f4143be4
	.xword	0xe2f833319a2fd297
	.xword	0xc1b669471fabb96d
	.xword	0xe2f4adcebd6ce375
	.xword	0x73eed581263daa25
	.xword	0xc80e270b2bf2a0a3
	.xword	0xff2a296cb03af7f9
	.xword	0x70078df1a3b56e58
	.xword	0x4a0b1e18620f82fb
	.xword	0xe79641daf45c5967
	.xword	0xc7308afb31dea469
	.xword	0xb216978dcd211c84
	.xword	0x364592ea04fbed8c
	.xword	0xb18d2534d33b8657
	.xword	0x20a86e4bf531dcde
	.xword	0xde2957f8e050bf7a
	.xword	0x347be48ff63259cc
	.xword	0x7aa907c0b5196562
	.xword	0x2b62643fe6fe23fe
	.xword	0x957e6328222eda69
	.xword	0x2e08d30dd28419e8
	.xword	0xd50c7aa4df5579cb
	.xword	0xe43dd98ff79495a1
	.xword	0xd423d6d528befff9
	.xword	0x1b22901aa91fd38e
	.xword	0x296dd94edf629d9d
	.xword	0x7bdb4659e77066c5
	.xword	0x6b5f047dc528ea14
	.xword	0x70a46949e49f6d3c
	.xword	0x890f9bf83c71fa8a
	.xword	0xb2c0fe90bce51dcb
	.xword	0xa931d9a0039fa3ce
	.xword	0x61d98d52b6701d65
	.xword	0xfa5e6dae9eeef5e2
	.xword	0x0da184f2f1c40555
	.xword	0x0cb14f108f015126
	.xword	0x88e8ffa633532e1a
	.xword	0xba9a51d6ada9738c
	.xword	0x2bd36e94c2db5300
	.xword	0x41cf18344116b0f9
	.xword	0x258a2be843c026a7
	.xword	0xe3084501fdc28782
	.xword	0x23855e402e24f5ba
	.xword	0xa884016d51d96e1f
	.xword	0xb001472e17074f1a
	.xword	0x5daabd1f71e9dd6f
	.xword	0x401189db311523f1
	.xword	0x2a43e9339619a4d7
	.xword	0xbc190c734a24d4fd
	.xword	0xc6f50b567cad2a17
	.xword	0x1f05fbfc3f3dad61
	.xword	0x9d40bde8136112c1
	.xword	0x91e8784297db4b89
	.xword	0xbcf3f9d959f625e6
	.xword	0x825986a6c98c8f5a
	.xword	0xffbf10b6bd698469
	.xword	0x27d8f9c0c1aa81c0
	.xword	0x3b896ac6e57525e1
	.xword	0xdaf54cc8ff29cc26
	.xword	0xa31a55608ee17639
	.xword	0x46a52e4560b6116e
	.xword	0xdad1e0be9a16d2d0
	.xword	0x1b58216dd4eb902f
	.xword	0xc360cad00c2ff6fe
	.xword	0xed984073c19b4c09
	.xword	0x36d51191a1b0bd3e
	.xword	0x61d1ebe3d90d07c9
	.xword	0xcea70729889b381f
	.xword	0xa16b345b584af432
	.xword	0x6fd5ae292475980d
	.xword	0x3a51cd5308f03463
	.xword	0x9390fdf51f2a42eb
	.xword	0x596f100ff86748da
	.xword	0xa31ccc3b3fe5d044
	.xword	0xfc4a6575fd9b602e
	.xword	0x5fa5fbaf29aa5d24
	.xword	0x2007466bdac474cf
	.xword	0x39a587d3763ce83d
	.xword	0xbde16055b8962ae1
	.xword	0x9577f9b0b10d8feb
	.xword	0x6bcae23fa4596719
	.xword	0xa196d95c8bddc722
	.xword	0xc20994d5bd16c4fc
	.xword	0x5362eefb91c753fe
	.xword	0x1e30aeee5cae5b1b
	.xword	0xefc8f242116a01e1
	.xword	0x34bbb2b67fa85f57
	.xword	0xa61bb92fec3038cb
	.xword	0x14aa8cfc843705a3
	.xword	0xcb6acd151cda4e32
	.xword	0x98fb198f7049917e
	.xword	0x1235cc46c183ebcc
	.xword	0x14df69bd39061ec2
	.xword	0xce89539d2417dc6d
	.xword	0xf4140b7a16d8f5fa
	.xword	0x36acbdb678156cda
	.xword	0x8dfc13ac111a2f88
	.xword	0xb36689254dab2cfb
	.xword	0x63ac82d27c14a732
	.xword	0xf625d12b20089e8f
	.xword	0x11437056343e3e71
	.xword	0xdefaa63ee52193e9
	.xword	0x1199bbf0c448dc50
	.xword	0x45239865587272b3
	.xword	0x9b937b6eb425eeae
	.xword	0x88bb723622e9cce3
	.xword	0x22dad01208b59203
	.xword	0xc5ab11f109b8eaa5
	.align 0x40000
	.data
data_start_6:

	.xword	0xf90e539533090eff
	.xword	0x13f9cc7cb30ae0b5
	.xword	0xdd1f0ecfc7266727
	.xword	0xbbd631a717185b00
	.xword	0x5e649454b8948774
	.xword	0xb89bf0b33b477046
	.xword	0x948fccb7ae5340ca
	.xword	0x322c6d67f18df72e
	.xword	0x1220abe368fb7c5a
	.xword	0x8590c2159d8f526f
	.xword	0x47c1b8cc88287f1d
	.xword	0x75b96ad43fcc645d
	.xword	0x430a4db0b70814bc
	.xword	0x43edd711e21eb168
	.xword	0x00841327763da7d4
	.xword	0x446293296add3f8a
	.xword	0xfc875cd56d8361ef
	.xword	0xafa5926746cae87a
	.xword	0x63304fbaacea7eac
	.xword	0x1800a706e923bc3c
	.xword	0x62b891c8854bebc0
	.xword	0x426aa33b1221ac5c
	.xword	0x851bb75bd98b0e1a
	.xword	0xf6c5f286e3e74f35
	.xword	0x0826967ced70bd3e
	.xword	0x214fe2502d5c1183
	.xword	0x724b94acad84a125
	.xword	0x2dcab36311aba108
	.xword	0x2b1dfe64d6940f66
	.xword	0x40304e77295667c9
	.xword	0x37745649e7493c00
	.xword	0x925d92f69b8269ce
	.xword	0xed8d6baed3890fe6
	.xword	0x0774e37908df2daa
	.xword	0xb2be5a3b286bf575
	.xword	0x7fd83dd6328aaffc
	.xword	0x97aae0081622dba0
	.xword	0xf1ac034cc91e8f06
	.xword	0x0e0f3bbf6ad14e1e
	.xword	0x6b48a5430108da06
	.xword	0x819f68c0b6031859
	.xword	0x2b600a6c06d7d4f7
	.xword	0xb6701276964487c0
	.xword	0x003ded9cb3f16cef
	.xword	0x3da7f9f116b97181
	.xword	0x7c99d9a2f426836e
	.xword	0xd3cbea014ebb1756
	.xword	0x04a1bcaca341ece1
	.xword	0x69b68d3001427b5d
	.xword	0xb150fc1a8b5636de
	.xword	0xbef5d58804e558a2
	.xword	0x1acf06fc5c83671d
	.xword	0x7e813b303f2b3004
	.xword	0x4a01ab09b0c180e8
	.xword	0x063c3da289960dff
	.xword	0x15b037d8b11a385a
	.xword	0x9b29ca44164fa0a0
	.xword	0x15b13c5ff29cd453
	.xword	0xb89c02bb0cc06cfe
	.xword	0xdfcdef163fe3b213
	.xword	0xe8a8af5948783bc2
	.xword	0x2e372fd0fb9a34f1
	.xword	0xbff24cabbd7624f2
	.xword	0xade067771edd3a80
	.xword	0x17aa97f939720808
	.xword	0x6903916b9163d61b
	.xword	0xa2fa3c0a05db41e2
	.xword	0xb4444e05546dcb8f
	.xword	0x3e541e13b9d0ba4d
	.xword	0x976aa21f049b0625
	.xword	0x700f6b5c9a6214b8
	.xword	0x14dc51b4b27d9c2c
	.xword	0x1433e70f115c787c
	.xword	0xd6aa1ce7cf6c074c
	.xword	0x823a190af2afe5d8
	.xword	0xb4f398d9bfea97f2
	.xword	0x15f0326c11bba44d
	.xword	0xb7e71e5758a7f47e
	.xword	0x2cb4924cb5acb4a5
	.xword	0xda8eae0ef9f74937
	.xword	0x5d0f230eb7299e53
	.xword	0xc17ccbbb92e5e1bf
	.xword	0xbb049863e04b04ed
	.xword	0x63afa439727ef42e
	.xword	0x2542d355cbd7ff69
	.xword	0xfb71f8cceb2a8828
	.xword	0x5af1138e86c65010
	.xword	0xda837194659e68bf
	.xword	0xcaae7fa36a6ce9b8
	.xword	0x94e3dcffb256768c
	.xword	0xd6fe278d0499609c
	.xword	0xcd7f7aa32ecf3736
	.xword	0x118fad9f6b9aa6de
	.xword	0x6362138426b88764
	.xword	0xdf6d276fbea72275
	.xword	0x59d2f7f800830f62
	.xword	0xc015a130287412c7
	.xword	0x02073d9e16ad76d9
	.xword	0xc1ccb0b1cd253374
	.xword	0xee334667606e5794
	.xword	0x763ca882e830c942
	.xword	0xcc4d8a23511cab4a
	.xword	0x40308a7952da171b
	.xword	0x3fcec318aa89d8ad
	.xword	0xd78e2cb108eef89a
	.xword	0x6bb2de610404e1b6
	.xword	0x72eb198070ff2633
	.xword	0xd919ab3566deda4a
	.xword	0x66e9695b85ec28ba
	.xword	0x8e8f8185f1b8c6fc
	.xword	0x853a659326ff4761
	.xword	0x472e14f6c3329df5
	.xword	0x8d1503789b4bcfba
	.xword	0x70c6feb5949aebe5
	.xword	0xb2554dc72fac3b82
	.xword	0x61cb0b61d7675feb
	.xword	0xb8b34a4cb59a8b1d
	.xword	0x15863c5cfc2002d8
	.xword	0x0b9c82d172bd05d4
	.xword	0x311166114d8c1f11
	.xword	0xa37bfe110b143c36
	.xword	0x74cb49193fce9cb7
	.xword	0xdffa2bff445cdc98
	.xword	0xcbbbb76127f48ced
	.xword	0xa1ed80ae7b607f2e
	.xword	0x76262d597886713f
	.xword	0x81486bab4a4f7263
	.xword	0xb70ed0adea77f101
	.xword	0xcdc377ee8faf5e59
	.xword	0x5ede722eaead35c0
	.xword	0xef01822a2dff7b02
	.xword	0x1d80381dc6baa2c8
	.xword	0xdff1da05ce351556
	.xword	0xd2a380fb4c751a04
	.xword	0x1d37a278365d9a0c
	.xword	0xffa4fa39b2c8ee5a
	.xword	0xfdab3d9b184b9fac
	.xword	0x6c8095bb7712accb
	.xword	0xb3e56feeb0779221
	.xword	0x8c2e6bf35f93d22c
	.xword	0xbea2ac559e857ed7
	.xword	0x9fcd4c3ea62c835c
	.xword	0x05724ce7ee74f3f4
	.xword	0x50989391ce1ca9f9
	.xword	0x527c42a3b5f2d0b9
	.xword	0x0c6ab3a4dd35efdb
	.xword	0x5c07ea8fa05eb6a8
	.xword	0x501b16a2a8ef56e3
	.xword	0x9317bd106d8a5f0b
	.xword	0x23323c277678cde8
	.xword	0x1264e92e088c43dc
	.xword	0xa3109cce64629ce3
	.xword	0x1fbfa336804a32f4
	.xword	0x0ec5a0d286b3de74
	.xword	0x6d8cd64ef0f3031e
	.xword	0xa5905f067ff0595e
	.xword	0x2867abea841be3db
	.xword	0x51a7914538d229a1
	.xword	0x4686a3bd821ef516
	.xword	0xa0f2e24943d7d265
	.xword	0x07360f4b5ec8d5ba
	.xword	0x24a07f3e77936fa0
	.xword	0x1ad5aaa627ec5096
	.xword	0x98b239e39da5ee97
	.xword	0x9c3d90b380e16493
	.xword	0x89d29f78f89ce010
	.xword	0xb25de9c11e5be2b2
	.xword	0xf91e439a0441819e
	.xword	0x8fd94abfd1600d02
	.xword	0x7706f6c5c964137f
	.xword	0x49c20767c04d6bce
	.xword	0x9608b2eccb248f09
	.xword	0x92635f9bb631216d
	.xword	0x1008d1d386d9f0b9
	.xword	0xcf1122b1d62829fd
	.xword	0x1a464d39ade7c1fc
	.xword	0x6035c7544757ca2c
	.xword	0x0d0ec2ddfe167ecb
	.xword	0x2b0ebd1c804c3fb6
	.xword	0x63aa8a1e5419e482
	.xword	0x04dba5c4b3bb374c
	.xword	0x8642d424c2bc5389
	.xword	0xcb9037c64e194359
	.xword	0x3b18af338459b76d
	.xword	0xdb3ae21cb2814630
	.xword	0x8a9d028a1bad9b40
	.xword	0x5458223a4f6b44dc
	.xword	0x419a97ff821b3f64
	.xword	0x3f540e8a8e352bcb
	.xword	0x73504225fbd48867
	.xword	0x72c2cb4903be9f0c
	.xword	0x451051bd4903c21a
	.xword	0x39d76e3afbfe6792
	.xword	0x2f4109f11bec16f9
	.xword	0xc7e244e646d5bf03
	.xword	0x88b137cd5d595100
	.xword	0x714c64f21559765d
	.xword	0x2382c977a9d36b0b
	.xword	0xc9f95495d951fee3
	.xword	0x698d3d4e11f78408
	.xword	0x9316a50671bcde46
	.xword	0x39680b9792f2b54c
	.xword	0x9cad99a2386ba27c
	.xword	0x848630e091593aa5
	.xword	0x4829538f0508db1e
	.xword	0x5bde21d29c9d8316
	.xword	0xb3e253c4a7cfcfdf
	.xword	0x3fc519577f897ac9
	.xword	0xae4f14a3807c2033
	.xword	0x28e11e9f752e3dcd
	.xword	0x5ef71a71990b04bf
	.xword	0xeb41572a2cf3ae6b
	.xword	0x3e984552cf2cf00a
	.xword	0x6bd8317f4dcd6e86
	.xword	0xb1bbb5d3a2acbe28
	.xword	0x4b1dd20c01cd78ca
	.xword	0x075608d57268c925
	.xword	0x66e334227b4b8f8d
	.xword	0xdd05dc6cd0c256e6
	.xword	0x9ebf18618410c903
	.xword	0x0d5d19d1c653248c
	.xword	0x2126705259aa4ff0
	.xword	0x1aa802bd24b32483
	.xword	0x3bf8e3b2284ba001
	.xword	0x32d67f56b503c636
	.xword	0xb74e41105b545a3e
	.xword	0xfde2bd153e2f56cf
	.xword	0x692a8d76c79e8a59
	.xword	0x8ad17d7cd49483a9
	.xword	0x9174030f488e755b
	.xword	0xdd22b6f11fba0af2
	.xword	0x46c7a45bef4488c5
	.xword	0x344d045e81fde906
	.xword	0x96cfdcb328feecba
	.xword	0x89d61196f46255f7
	.xword	0x947e251747a3661e
	.xword	0x4c7a1125672457a3
	.xword	0x0b275ab2e8a6519f
	.xword	0xb359b9b846dc5110
	.xword	0x86ba6ed0e7c8be96
	.xword	0xdfa581d2b4d90da8
	.xword	0x6170e99e9e5e24b5
	.xword	0xb47f9450256251c3
	.xword	0xfeb6758af28990c2
	.xword	0xe825fc3e2205c536
	.xword	0x1e73ff73768a876a
	.xword	0xa999247c635532df
	.xword	0x59fadff798a6cea0
	.xword	0xf62d2cb3e9b4d7ec
	.xword	0x8c07e5ce78e7bdd6
	.xword	0xf7e8d559c42c87a2
	.xword	0xed6ba6ae48693031
	.xword	0x601af50c9afd6922
	.xword	0x41c1f8773a4f1b2e
	.xword	0x7ac27a95c45debc8
	.xword	0xa9e3b6de8bd7264d
	.align 0x80000
	.data
data_start_7:

	.xword	0x0bed180352dd712a
	.xword	0x6a7012f5842d30be
	.xword	0x1b85a04b097e39b0
	.xword	0xf92c9e2e7d3230be
	.xword	0x986381074778dcdd
	.xword	0x3d6e442ab7b3819a
	.xword	0xde3c2b04b96c4fad
	.xword	0x3c2e76288a0c2e4d
	.xword	0x31d2feb891ab35c2
	.xword	0xfc034798097bfe20
	.xword	0xeec0dde282260220
	.xword	0xcf0e7502566d1161
	.xword	0xa3f66a814ce6a332
	.xword	0x9644889c57837cf1
	.xword	0x959746210e10e9e1
	.xword	0x84ec06a0868c72eb
	.xword	0x4adc6b87bec844ac
	.xword	0x974a33cc16bf3d1e
	.xword	0x483787990367f450
	.xword	0xc21015493735462f
	.xword	0x70ee00645d7522f3
	.xword	0x961f8311dd2b4fc7
	.xword	0xdd3c5fa64265533d
	.xword	0x321bb8efd0bddc1d
	.xword	0x0b8c465a9fc0ca27
	.xword	0x06f7d8a153ee9775
	.xword	0x1fb76611acb8329d
	.xword	0xecd4e1b99943d618
	.xword	0x7f77a71d1446f1d6
	.xword	0x695b350c3bd7623c
	.xword	0x30b5a6a1b350c804
	.xword	0x13fd2084f1547270
	.xword	0x390ef597cd27bacd
	.xword	0x08430bca9dd34577
	.xword	0x23301b1c392a7698
	.xword	0x08cb33dec2ce77c9
	.xword	0x85e0abe49a6ff8a6
	.xword	0xe76b510f1fa71ccd
	.xword	0x5f67599fe8247449
	.xword	0x559d6da0e09327e3
	.xword	0x50ab7549df208730
	.xword	0x7b4676e9bd085e8f
	.xword	0x1947cc7c2602652e
	.xword	0x67dd90be2cef3acd
	.xword	0xba261b6ffa332b93
	.xword	0x1387dc73940efe34
	.xword	0xdd76e558fc49d23d
	.xword	0x41ea91c3fbefe062
	.xword	0xaec15a732147a81e
	.xword	0xe5d2c2ba62881175
	.xword	0xfe993e821540e348
	.xword	0x95ee18edd9196101
	.xword	0x942ebd833b0748cd
	.xword	0x4226c29da5d60c06
	.xword	0x1ab9c7c578ac04ca
	.xword	0x8a981ab572b24c44
	.xword	0xa445f026540b7d20
	.xword	0x2269c301d0238797
	.xword	0x6852a8793552b469
	.xword	0x1da987a9999eabea
	.xword	0xec55479176b68e72
	.xword	0xfe65e6f464fde726
	.xword	0x4c3631de953c7d91
	.xword	0x28b9368c83e428e7
	.xword	0x8c71a422f4699486
	.xword	0x61d4021109e5d904
	.xword	0x1823b679fdf9afc8
	.xword	0x9c3f4652e86169c2
	.xword	0x7be0155910169563
	.xword	0x54eda3c4a52a3c27
	.xword	0xd0a182cc6c383a4d
	.xword	0xa7d77bb308a3c964
	.xword	0x13fd6490f033a4a5
	.xword	0xf9a8a9e0e425632b
	.xword	0xecefee4cb398aa5d
	.xword	0x5d1821fd5ee1698b
	.xword	0xff9df4b1939b7c0b
	.xword	0x2074482ab0511c75
	.xword	0xba142769888f2921
	.xword	0x50f88858168b445a
	.xword	0x920a1738a5f6c1d8
	.xword	0x9da85dabdcd5d1f6
	.xword	0x6dc14ac6664401af
	.xword	0x8890ae6a2a252a9c
	.xword	0x3e4439800f7ce5ad
	.xword	0x5f90b3c53639370f
	.xword	0x66651d9364dab235
	.xword	0xb87327ac383000e1
	.xword	0xf167557a1125aa4f
	.xword	0x1f8fb4b59ad3d799
	.xword	0x1b1c391191f3ef6e
	.xword	0x9357e65bca4ebf8e
	.xword	0xfd94eb46894e2a2c
	.xword	0x9c5d7db334b0fb21
	.xword	0x787620eb42a817f9
	.xword	0xa68c2754f19605ec
	.xword	0xeefbb8d21be00232
	.xword	0x11bab282faf21ffa
	.xword	0xc23d05308b3c8271
	.xword	0xfcc60b3f0d2a0714
	.xword	0xe1776528da0a12f2
	.xword	0xe2b37e7aad07b2de
	.xword	0x1d147c84ebbf997c
	.xword	0x2f8e32375ea281f3
	.xword	0xc4e513b9884d933d
	.xword	0x5b5b00c8b6a5810f
	.xword	0xffe02815d1f6691c
	.xword	0x3d1c7e55ecdf5a1e
	.xword	0x110bf6301e6058a0
	.xword	0x089114becd9eab64
	.xword	0x006abf2099bf57d1
	.xword	0x72f10fccdb0c14a9
	.xword	0x9f87e38475227c67
	.xword	0xce00b7f29d4c97dd
	.xword	0x6722ed76b3f5e2e7
	.xword	0xcb1d89d9ef7d0c1e
	.xword	0xc32512a2b6e73238
	.xword	0xad925e41bbebe8e2
	.xword	0x71861f7e3bb2edc4
	.xword	0xf61003f916c1931c
	.xword	0x80ff8a6f5f652cca
	.xword	0x75bcd57617f19606
	.xword	0xdab6a21a5decf363
	.xword	0x38600fe8648b4a1e
	.xword	0x96b0c4cdcf1dba37
	.xword	0xabd17eacfe4b1bf4
	.xword	0x29f8fd99b064d3c0
	.xword	0x2223175105669e55
	.xword	0xfe75146cca18ddb9
	.xword	0xec1f32225a9075de
	.xword	0xebe5b43abc33080c
	.xword	0xa858755f795374ea
	.xword	0x638f48e9ef2d84f7
	.xword	0x1518b8860da18f0f
	.xword	0x6862ac96ef953ed6
	.xword	0x5a15987a657c7d19
	.xword	0xbd5ca9c6368b9970
	.xword	0xea29d6748067fdf0
	.xword	0x780e589381dc7e57
	.xword	0x56f5e50792e0da92
	.xword	0x6343749eb0735eeb
	.xword	0x3a991be072e0ccd9
	.xword	0x14ad4508b704893d
	.xword	0xd60817763265403c
	.xword	0xf7c99189c39ac017
	.xword	0xe65ca65e9f5ef67b
	.xword	0x19953ccca3626dbb
	.xword	0x3babf5d584200326
	.xword	0xd78319dcb8d853d2
	.xword	0xa1f993c7c31b895e
	.xword	0x5507bb723c43fc59
	.xword	0xccd585e51d1b5634
	.xword	0x443cda6f53aae249
	.xword	0x2e1b15e06c3e9e3e
	.xword	0x7ee7860e316df92e
	.xword	0xa479b42971486c5d
	.xword	0xe494d46145d58389
	.xword	0xcc5a22ffd12e3e23
	.xword	0xd347f88a3e4ff664
	.xword	0x5dd104d29b010b5a
	.xword	0x11bf834e86631248
	.xword	0xb52c2040e1fb80f8
	.xword	0x0a2f9d4e6b8c61be
	.xword	0x196b0aa7639de04e
	.xword	0x5177058672d70561
	.xword	0xb105432967a05d84
	.xword	0x6f287e76f40b5916
	.xword	0x5b9d315b0e9945e2
	.xword	0x14bf5e706cd3eb7a
	.xword	0xd2ad94c7c1caab5f
	.xword	0xee99ecde6cae6475
	.xword	0x33bdd2e6ba115590
	.xword	0x9471ae994ce184ee
	.xword	0xaebb03dd67fb7ae4
	.xword	0xaca660c3b9346a8e
	.xword	0xcc8dd7463735a7b9
	.xword	0x35f2c56d81a0de35
	.xword	0xaf96ccb6edbbeb41
	.xword	0x4040323beb8ce3fb
	.xword	0xc7e1fc0d8a82ec79
	.xword	0xe30c0fbaa080307c
	.xword	0x747762b75d96f428
	.xword	0x008a9c93c860ff3c
	.xword	0x5f3c5e2be5cdfbed
	.xword	0x149b5275de7821fd
	.xword	0xa745261b3734c17d
	.xword	0x3bbf7d26ff5dd887
	.xword	0x1f7d9c8c71fa8400
	.xword	0x77e3f92ee472d225
	.xword	0xe77000b634784712
	.xword	0x0e2566d6bb0268ed
	.xword	0x9e7ef0c70f28e172
	.xword	0x4f75bc77875f2a8b
	.xword	0xe6f65c15254754ab
	.xword	0x8d778e87c19817b8
	.xword	0x6a21d07c71613a24
	.xword	0x02d0fb358d161cf1
	.xword	0x363a7d4cb028a78d
	.xword	0x760b5efde23a4283
	.xword	0x6395371fa91fb6f3
	.xword	0x68067e80213675a9
	.xword	0xf253094ce488a1b4
	.xword	0x3a669786a53d22fb
	.xword	0x2a3b3cbc9156b1bd
	.xword	0xd1366bf7ccd4bc41
	.xword	0x16d475ced2ed3ccb
	.xword	0xf5fe760a0bc64899
	.xword	0x546bd2a38ba49899
	.xword	0xc300da088cb733b1
	.xword	0x57764771ba091075
	.xword	0xff5a3b926b5fb177
	.xword	0x2762688d4ba2f811
	.xword	0xbbb63be1569c1b88
	.xword	0xa54c1949ecbeda0a
	.xword	0x14904995b86fa97e
	.xword	0x29cad7d0e68cd70e
	.xword	0xa44e9ef611617124
	.xword	0xcc5f020893203f04
	.xword	0x152ef4148d939ddd
	.xword	0xadb36a8e1936e4bb
	.xword	0xbdb6afa4fb2ae7f3
	.xword	0x19d06eef21ff6215
	.xword	0x28e2e99f5d662f02
	.xword	0xea88ce6010f979df
	.xword	0xd65d9330e196d54f
	.xword	0x816468326e22a529
	.xword	0x72640f322aac5b2a
	.xword	0x926dcfca716fc038
	.xword	0xa043fe19cd5a0264
	.xword	0xb44c5f8549114e2e
	.xword	0x0ab73e90f23a54e6
	.xword	0x06519349841955c7
	.xword	0xd310ace05d4577df
	.xword	0x7627a42c65206a4d
	.xword	0x6b8ba25255d71676
	.xword	0x50250209c3d07739
	.xword	0x201d36a66fb9e2ba
	.xword	0x69d88b396d863178
	.xword	0xde59db1f2de7d513
	.xword	0x1fa0e41e90c8cb60
	.xword	0x3eb3506b5e0bc1bb
	.xword	0x5a7c9cc46b42cb24
	.xword	0x05395c6b22cb102e
	.xword	0x9acc5554a33e00a5
	.xword	0x2de8f676eec9862d
	.xword	0xc38a6b6c87434bd2
	.xword	0x22589ae3a4ea9084
	.xword	0xa5afef6887661b60
	.xword	0xd871130add1b1aa8
	.xword	0xa6bd6377aee253b7
	.xword	0xf1dac29780fe6ad9
	.xword	0xbb5a2d59b5e75b83
	.xword	0x9d6701d3a8a3980a
	.xword	0x95bd411839e552d6
	.xword	0xdc12a8f8571e60bb
	.xword	0x1b06697bf2f93e90



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
