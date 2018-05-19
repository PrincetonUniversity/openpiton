// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_52.s
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
   random seed:	864244552
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

	setx 0xab6f5dc33fb6703a, %g1, %g0
	setx 0x08599ccc0a96944a, %g1, %g1
	setx 0x3e815665e0f7fab4, %g1, %g2
	setx 0xf9085c1a18cab22f, %g1, %g3
	setx 0xaf7b498b1189e145, %g1, %g4
	setx 0x95551512e89d3e69, %g1, %g5
	setx 0xe0edd4ccdee61a65, %g1, %g6
	setx 0x6a15ee7dfb8436fc, %g1, %g7
	setx 0xde292738778bd577, %g1, %r16
	setx 0xe3d55d2cd548c54a, %g1, %r17
	setx 0xc8d75a502bceccb6, %g1, %r18
	setx 0xa5e1045a12bfe0aa, %g1, %r19
	setx 0x909c847f9071f818, %g1, %r20
	setx 0xfc314741ea83c2c0, %g1, %r21
	setx 0xfdf9771a4eecef83, %g1, %r22
	setx 0x904e5fe01f6dcdaa, %g1, %r23
	setx 0xf40f7efa5e54a0c6, %g1, %r24
	setx 0x6571c85ba072bace, %g1, %r25
	setx 0x46c3e4a27230b9ce, %g1, %r26
	setx 0xa171dcdf23131f20, %g1, %r27
	setx 0x48f07cd83293ae31, %g1, %r28
	setx 0x05a3cf0c0cfcd48e, %g1, %r29
	setx 0x261098058c3ab464, %g1, %r30
	setx 0x2810c1dd557c89b1, %g1, %r31
	save
	setx 0x9a4894d4bec3517a, %g1, %r16
	setx 0xb033c31da03a1957, %g1, %r17
	setx 0x80f6d6b0ce0682ba, %g1, %r18
	setx 0x4ce475194021b93b, %g1, %r19
	setx 0x721c09b7d9300d6f, %g1, %r20
	setx 0xe4baf4b955a2eb09, %g1, %r21
	setx 0x9dc6a0bc640a85ef, %g1, %r22
	setx 0x139d99c0ac5d8b3d, %g1, %r23
	setx 0x2e078ca857bd21a1, %g1, %r24
	setx 0xf6b98550fd9e169e, %g1, %r25
	setx 0x7478e0d4b5a17695, %g1, %r26
	setx 0x4df271be3f178db6, %g1, %r27
	setx 0x03451c6e0b5ab750, %g1, %r28
	setx 0x2c55853847b9e202, %g1, %r29
	setx 0x4fec0962847516b0, %g1, %r30
	setx 0x5c99b8e0ec6c546f, %g1, %r31
	save
	setx 0x4cade124438c24da, %g1, %r16
	setx 0x54a814456323eada, %g1, %r17
	setx 0xfac1f25bd7e799e7, %g1, %r18
	setx 0xfcc4e23b88e08703, %g1, %r19
	setx 0x96e95806c3d587e3, %g1, %r20
	setx 0x96851bfbfbd3e851, %g1, %r21
	setx 0x5897889870e6ad69, %g1, %r22
	setx 0x0a51cf702f33ed6f, %g1, %r23
	setx 0x646cff8d4a53a794, %g1, %r24
	setx 0xb090c4a17e05790d, %g1, %r25
	setx 0xabe458d7f590f3a7, %g1, %r26
	setx 0x886fe0a7b91f600f, %g1, %r27
	setx 0xa9ce4c500dfcdbc4, %g1, %r28
	setx 0x247f204832c7ddaa, %g1, %r29
	setx 0xa2c183cc8dba11f7, %g1, %r30
	setx 0xb724b51a95412750, %g1, %r31
	save
	setx 0xf0648f194a2bf038, %g1, %r16
	setx 0x299c1225b94dff4f, %g1, %r17
	setx 0x9db26a1440361342, %g1, %r18
	setx 0xbd881ea4a4ebbb45, %g1, %r19
	setx 0x1538077a95a8e079, %g1, %r20
	setx 0xff58988287f5833e, %g1, %r21
	setx 0x53b73126324cf26a, %g1, %r22
	setx 0x08912f709e00ffbd, %g1, %r23
	setx 0x8eb6e27e76b03ecd, %g1, %r24
	setx 0x8ef90e96c8402e07, %g1, %r25
	setx 0xf4c60398799e9536, %g1, %r26
	setx 0x563c0d9bfff53ba7, %g1, %r27
	setx 0x8c78528658caa675, %g1, %r28
	setx 0x532140fa1e979318, %g1, %r29
	setx 0x2e75dd64d3749502, %g1, %r30
	setx 0x6aa595dd30a21f4c, %g1, %r31
	save
	setx 0x8e3264e8e53c3304, %g1, %r16
	setx 0x032396634f98f4ee, %g1, %r17
	setx 0x5f866d2c9842335d, %g1, %r18
	setx 0xcd1dc09de7289627, %g1, %r19
	setx 0x3fa85f26e95df83f, %g1, %r20
	setx 0x19406e406ebfdb6a, %g1, %r21
	setx 0x78934f65ca25f302, %g1, %r22
	setx 0xd6d94882be0b12a1, %g1, %r23
	setx 0x150d152f28abbd9f, %g1, %r24
	setx 0x71f239a54700cc65, %g1, %r25
	setx 0x61a57a2bc3a96b99, %g1, %r26
	setx 0x19a40de8986489d6, %g1, %r27
	setx 0xf54f027f4184b683, %g1, %r28
	setx 0xfb36b7b6d2ffa573, %g1, %r29
	setx 0xdb87b6799d212f48, %g1, %r30
	setx 0x94c4621a6732c5f9, %g1, %r31
	save
	setx 0x8e498cbac1871d37, %g1, %r16
	setx 0x2838ba5f6e06e933, %g1, %r17
	setx 0x556874ee9c9a1f31, %g1, %r18
	setx 0xbfa3205cde08d44f, %g1, %r19
	setx 0x1e476ccdf12f3db7, %g1, %r20
	setx 0x07b150d35e31cf0d, %g1, %r21
	setx 0xb71cc53e9e000550, %g1, %r22
	setx 0xda4e8595935e38aa, %g1, %r23
	setx 0x4cda577cb9fd4aee, %g1, %r24
	setx 0x2c8a6599d79b1022, %g1, %r25
	setx 0x51c85276dde9e7b1, %g1, %r26
	setx 0x5e3805034950895a, %g1, %r27
	setx 0x261d9eb69fb3d1c4, %g1, %r28
	setx 0x475a7b27b2e53d0e, %g1, %r29
	setx 0xab18b998e9ad05fa, %g1, %r30
	setx 0x01d4b38f18877d22, %g1, %r31
	save
	setx 0x247e7f7e62a95092, %g1, %r16
	setx 0xae4897807211e809, %g1, %r17
	setx 0x5bf78307f58c3fde, %g1, %r18
	setx 0xa8f03d73b7c6daf2, %g1, %r19
	setx 0xc3e1a8d97c9e7586, %g1, %r20
	setx 0x0cf9abaf165d6afd, %g1, %r21
	setx 0x2ba47c14348b1055, %g1, %r22
	setx 0x7e5ca802c3f7507a, %g1, %r23
	setx 0x429cd6846f8d53ab, %g1, %r24
	setx 0xcc5d68a7226a8538, %g1, %r25
	setx 0xb7bb1daec1b6e3e2, %g1, %r26
	setx 0xe64c78f9c184815a, %g1, %r27
	setx 0x9a9cbaca5efac422, %g1, %r28
	setx 0xd7f76313ea1f5720, %g1, %r29
	setx 0x9b014c7090dd41e5, %g1, %r30
	setx 0x09e10b36b926e4fa, %g1, %r31
	save
	setx 0x8bffb4c6fbade4d4, %g1, %r16
	setx 0x2a369ecaabcdf9fe, %g1, %r17
	setx 0x20710b9d2f8a4ee2, %g1, %r18
	setx 0x881066cbf61d646e, %g1, %r19
	setx 0xe2b63a88cf9bc42c, %g1, %r20
	setx 0x317f635fa555c867, %g1, %r21
	setx 0x86def5bbf4b54cf1, %g1, %r22
	setx 0x5c0a3420dcc1ba91, %g1, %r23
	setx 0x403a5d860918e220, %g1, %r24
	setx 0x433f18dbd62265e5, %g1, %r25
	setx 0xa4cf5f85c08746d6, %g1, %r26
	setx 0x45622dacc5749f78, %g1, %r27
	setx 0xcbef39969a33358b, %g1, %r28
	setx 0xca5e0710952fbee1, %g1, %r29
	setx 0x2f0286115b975e7d, %g1, %r30
	setx 0x8cb7381937264935, %g1, %r31
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
	.word 0xbfe46017  ! 3: SAVE_I	save	%r17, 0x0001, %r31
	mov	1, %r12
	.word 0xa1930000  ! 4: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a18e  ! 8: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e42041  ! 9: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e46053  ! 14: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde4e00d  ! 16: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbc1d60ff  ! 18: XOR_I	xor 	%r21, 0x00ff, %r30
	.word 0x8594e13b  ! 19: WRPR_TSTATE_I	wrpr	%r19, 0x013b, %tstate
	.word 0xbde461a8  ! 20: SAVE_I	save	%r17, 0x0001, %r30
	setx	0xef746bed0000a94e, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb0150000  ! 22: OR_R	or 	%r20, %r0, %r24
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4040000  ! 24: ADD_R	add 	%r16, %r0, %r26
	.word 0xb23c21f0  ! 28: XNOR_I	xnor 	%r16, 0x01f0, %r25
	.word 0x8795609e  ! 33: WRPR_TT_I	wrpr	%r21, 0x009e, %tt
	.word 0x8794e049  ! 36: WRPR_TT_I	wrpr	%r19, 0x0049, %tt
	.word 0xb57d2401  ! 38: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xb92c5000  ! 40: SLLX_R	sllx	%r17, %r0, %r28
	.word 0xb3e4a0cb  ! 42: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbf518000  ! 45: RDPR_PSTATE	<illegal instruction>
	.word 0xb3500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a03c  ! 49: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe561d3  ! 50: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x83871ca400004cd3, %g1, %r10
	.word 0x839a8000  ! 51: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde561f7  ! 54: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5a051  ! 58: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1508000  ! 61: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e521d9  ! 64: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4154000  ! 69: OR_R	or 	%r21, %r0, %r26
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e127  ! 73: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9480000  ! 74: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbc35c000  ! 75: ORN_R	orn 	%r23, %r0, %r30
	.word 0xbde561bb  ! 76: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb4bd0000  ! 78: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0x819460a8  ! 80: WRPR_TPC_I	wrpr	%r17, 0x00a8, %tpc
	.word 0xb1e461a7  ! 84: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde42199  ! 89: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5510000  ! 90: RDPR_TICK	<illegal instruction>
	.word 0xbfe42132  ! 93: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8395a088  ! 94: WRPR_TNPC_I	wrpr	%r22, 0x0088, %tnpc
	.word 0xbf518000  ! 99: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e5a07d  ! 104: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42000  ! 110: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x321ae9300004c1f, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe420a4  ! 121: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4a1b9  ! 123: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde56056  ! 124: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe460cb  ! 126: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5e18f  ! 129: SAVE_I	save	%r23, 0x0001, %r25
	setx	0xdac786600009a9d, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x899460d2  ! 133: WRPR_TICK_I	wrpr	%r17, 0x00d2, %tick
	.word 0xb9e5e1c4  ! 137: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe561f4  ! 139: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3508000  ! 142: RDPR_TSTATE	<illegal instruction>
	.word 0x839421b6  ! 143: WRPR_TNPC_I	wrpr	%r16, 0x01b6, %tnpc
	.word 0xbbe5a102  ! 145: SAVE_I	save	%r22, 0x0001, %r29
	setx	0xd226b0e700002fd2, %g1, %r10
	.word 0x819a8000  ! 147: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d9420c1  ! 154: WRPR_PSTATE_I	wrpr	%r16, 0x00c1, %pstate
	.word 0xb7e4e14a  ! 161: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x89952142  ! 163: WRPR_TICK_I	wrpr	%r20, 0x0142, %tick
	.word 0xb1e4e1c7  ! 166: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8995a09c  ! 167: WRPR_TICK_I	wrpr	%r22, 0x009c, %tick
	.word 0xb9e561ca  ! 169: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe520f1  ! 170: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8594212b  ! 172: WRPR_TSTATE_I	wrpr	%r16, 0x012b, %tstate
	.word 0x8594e12d  ! 177: WRPR_TSTATE_I	wrpr	%r19, 0x012d, %tstate
	.word 0x9195209f  ! 178: WRPR_PIL_I	wrpr	%r20, 0x009f, %pil
	mov	0, %r12
	.word 0x8f930000  ! 180: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x879561f2  ! 181: WRPR_TT_I	wrpr	%r21, 0x01f2, %tt
	.word 0xbfe4e098  ! 182: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8595a00b  ! 185: WRPR_TSTATE_I	wrpr	%r22, 0x000b, %tstate
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d942140  ! 189: WRPR_PSTATE_I	wrpr	%r16, 0x0140, %pstate
	.word 0xb3e5a07d  ! 192: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9194608c  ! 193: WRPR_PIL_I	wrpr	%r17, 0x008c, %pil
	.word 0xb3e520be  ! 195: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe42065  ! 199: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e5e02a  ! 200: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x3735cd8a00006914, %g1, %r10
	.word 0x819a8000  ! 205: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde461ca  ! 207: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3510000  ! 211: RDPR_TICK	<illegal instruction>
	.word 0xb151c000  ! 212: RDPR_TL	<illegal instruction>
	.word 0xbb51c000  ! 217: RDPR_TL	<illegal instruction>
	.word 0xb3e46194  ! 221: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xbfe421d5  ! 231: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8394215b  ! 233: WRPR_TNPC_I	wrpr	%r16, 0x015b, %tnpc
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56105  ! 236: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5e19f  ! 242: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8995e18a  ! 243: WRPR_TICK_I	wrpr	%r23, 0x018a, %tick
	setx	data_start_7, %g1, %r19
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5617d  ! 250: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5213a  ! 251: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4a02b  ! 255: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5217d  ! 259: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb551c000  ! 273: RDPR_TL	<illegal instruction>
	.word 0xb5518000  ! 274: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5a076  ! 275: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4e18c  ! 276: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e5a118  ! 277: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e56188  ! 278: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4e105  ! 281: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	setx	0xe4a5404c00009c5f, %g1, %r10
	.word 0x819a8000  ! 284: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795e173  ! 286: WRPR_TT_I	wrpr	%r23, 0x0173, %tt
	.word 0x8994e136  ! 287: WRPR_TICK_I	wrpr	%r19, 0x0136, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0xa1930000  ! 296: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e420fe  ! 300: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7520000  ! 305: RDPR_PIL	<illegal instruction>
	.word 0xbde5a02b  ! 307: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e4e0c7  ! 308: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbc84c000  ! 309: ADDcc_R	addcc 	%r19, %r0, %r30
	setx	data_start_5, %g1, %r17
	.word 0xbbe42195  ! 317: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_6, %g1, %r18
	.word 0x87952031  ! 319: WRPR_TT_I	wrpr	%r20, 0x0031, %tt
	.word 0xb5e5205a  ! 320: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a045  ! 322: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb2c4e0cd  ! 327: ADDCcc_I	addccc 	%r19, 0x00cd, %r25
	.word 0xb9508000  ! 328: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a1c0  ! 330: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe5e102  ! 333: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4211b  ! 335: SAVE_I	save	%r16, 0x0001, %r31
	setx	0xeccb9f8c0000fc1e, %g1, %r10
	.word 0x839a8000  ! 336: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34c000  ! 343: SRL_R	srl 	%r19, %r0, %r29
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 352: RDPR_PIL	<illegal instruction>
	.word 0xb63c8000  ! 355: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xb1e4a0b0  ! 359: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e14b  ! 371: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8595e16e  ! 372: WRPR_TSTATE_I	wrpr	%r23, 0x016e, %tstate
	.word 0xb5e5a0df  ! 374: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e52157  ! 379: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3540000  ! 381: RDPR_GL	<illegal instruction>
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x879561b3  ! 390: WRPR_TT_I	wrpr	%r21, 0x01b3, %tt
	.word 0xb615a1e9  ! 392: OR_I	or 	%r22, 0x01e9, %r27
	.word 0x8595a15a  ! 394: WRPR_TSTATE_I	wrpr	%r22, 0x015a, %tstate
	.word 0xb3e4a0c0  ! 396: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4a0f0  ! 399: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e131  ! 401: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e560a5  ! 403: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4e0c9  ! 405: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r18
	.word 0xb48d8000  ! 409: ANDcc_R	andcc 	%r22, %r0, %r26
	.word 0xb5e421c1  ! 412: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xb5e521c8  ! 419: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7345000  ! 421: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xb7e4a0ea  ! 422: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4a079  ! 424: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5510000  ! 426: RDPR_TICK	<illegal instruction>
	.word 0x8394e1a9  ! 427: WRPR_TNPC_I	wrpr	%r19, 0x01a9, %tnpc
	.word 0xb5e5a0ab  ! 430: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb634a019  ! 436: SUBC_I	orn 	%r18, 0x0019, %r27
	.word 0x9194a18e  ! 442: WRPR_PIL_I	wrpr	%r18, 0x018e, %pil
	.word 0xbbe4610c  ! 444: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe5615e  ! 450: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x9195e005  ! 451: WRPR_PIL_I	wrpr	%r23, 0x0005, %pil
	.word 0xb5e56075  ! 452: SAVE_I	save	%r21, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 454: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xdf4bc79700001a97, %g1, %r10
	.word 0x819a8000  ! 455: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe5a03a  ! 462: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4a01a  ! 464: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e56022  ! 466: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde42010  ! 473: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd34a001  ! 476: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xb3e4e0f4  ! 481: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbcb58000  ! 485: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xb5e520d2  ! 486: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e420b6  ! 487: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4e189  ! 489: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5e1ca  ! 490: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e0e4  ! 491: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8395e006  ! 496: WRPR_TNPC_I	wrpr	%r23, 0x0006, %tnpc
	.word 0xb9e5203b  ! 500: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8d94a1b4  ! 501: WRPR_PSTATE_I	wrpr	%r18, 0x01b4, %pstate
	.word 0xb1e5e102  ! 502: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e134  ! 505: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5e0a8  ! 506: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5a1ea  ! 510: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb22d21a2  ! 511: ANDN_I	andn 	%r20, 0x01a2, %r25
	.word 0xb9e560ad  ! 512: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 524: RDPR_GL	<illegal instruction>
	.word 0x8194a070  ! 525: WRPR_TPC_I	wrpr	%r18, 0x0070, %tpc
	.word 0xbbe4e017  ! 530: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e561ed  ! 532: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbd643801  ! 534: MOVcc_I	<illegal instruction>
	.word 0x9194a15b  ! 535: WRPR_PIL_I	wrpr	%r18, 0x015b, %pil
	.word 0xbe240000  ! 536: SUB_R	sub 	%r16, %r0, %r31
	.word 0xbb51c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xb3e5e199  ! 541: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_3, %g1, %r23
	.word 0xbbe4a102  ! 547: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4e03c  ! 549: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd540000  ! 550: RDPR_GL	<illegal instruction>
	.word 0xb5e4a1e0  ! 553: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4a014  ! 554: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbebc61bc  ! 555: XNORcc_I	xnorcc 	%r17, 0x01bc, %r31
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46053  ! 558: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5607a  ! 562: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb2b50000  ! 565: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xb1e52173  ! 566: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb084a131  ! 567: ADDcc_I	addcc 	%r18, 0x0131, %r24
	mov	0, %r12
	.word 0x8f930000  ! 570: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	mov	1, %r12
	.word 0x8f930000  ! 576: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e560fe  ! 577: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a17b  ! 580: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb244e008  ! 585: ADDC_I	addc 	%r19, 0x0008, %r25
	.word 0xb9500000  ! 588: RDPR_TPC	<illegal instruction>
	.word 0xb3e4a1ea  ! 594: SAVE_I	save	%r18, 0x0001, %r25
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225e020  ! 598: SUB_I	sub 	%r23, 0x0020, %r25
	.word 0xb3e42153  ! 599: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbb508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xb0a5e007  ! 608: SUBcc_I	subcc 	%r23, 0x0007, %r24
	.word 0xb5518000  ! 611: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e096  ! 616: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb37ca401  ! 617: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xbe1c2193  ! 618: XOR_I	xor 	%r16, 0x0193, %r31
	.word 0xb5e4204e  ! 619: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe420f4  ! 621: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4a0b9  ! 632: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4e091  ! 633: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5a1ea  ! 636: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbeb4a026  ! 637: ORNcc_I	orncc 	%r18, 0x0026, %r31
	.word 0xb3e461d6  ! 642: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e46006  ! 644: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e4e087  ! 649: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x839561b9  ! 650: WRPR_TNPC_I	wrpr	%r21, 0x01b9, %tnpc
	.word 0xb3e4602b  ! 654: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb73c4000  ! 656: SRA_R	sra 	%r17, %r0, %r27
	.word 0xb5e5219d  ! 657: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5a162  ! 662: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e122  ! 665: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e560be  ! 667: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb504000  ! 668: RDPR_TNPC	<illegal instruction>
	.word 0xb1e420cc  ! 672: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb540000  ! 674: RDPR_GL	<illegal instruction>
	.word 0xb0b461b3  ! 676: ORNcc_I	orncc 	%r17, 0x01b3, %r24
	.word 0xbde421bf  ! 677: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4a141  ! 678: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a0f1  ! 681: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e46109  ! 683: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf508000  ! 685: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e421af  ! 687: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbbe4a0a4  ! 693: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x9194a1c7  ! 697: WRPR_PIL_I	wrpr	%r18, 0x01c7, %pil
	.word 0xb7e4e021  ! 698: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e52124  ! 700: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe520cb  ! 702: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4e130  ! 704: SAVE_I	save	%r19, 0x0001, %r28
	setx	0x41c4d510000ec89, %g1, %r10
	.word 0x819a8000  ! 706: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb520000  ! 711: RDPR_PIL	<illegal instruction>
	.word 0xb3e5a024  ! 715: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5e176  ! 719: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9500000  ! 726: RDPR_TPC	<illegal instruction>
	.word 0x8595e1e8  ! 727: WRPR_TSTATE_I	wrpr	%r23, 0x01e8, %tstate
	.word 0xb3e42009  ! 728: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5e0ba  ! 729: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_3, %g1, %r16
	.word 0xbfe461a2  ! 735: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e56181  ! 736: SAVE_I	save	%r21, 0x0001, %r26
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e10a  ! 744: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5e0a7  ! 749: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a009  ! 750: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4e00a  ! 754: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb5641800  ! 760: MOVcc_R	<illegal instruction>
	.word 0xbde420ab  ! 762: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e46046  ! 766: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5540000  ! 767: RDPR_GL	<illegal instruction>
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a11f  ! 775: WRPR_TSTATE_I	wrpr	%r22, 0x011f, %tstate
	.word 0xbfe5a1a8  ! 776: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb750c000  ! 778: RDPR_TT	<illegal instruction>
	.word 0xb5e4a112  ! 783: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4e127  ! 790: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe46023  ! 793: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e012  ! 799: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e520fb  ! 800: SAVE_I	save	%r20, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 801: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe5e072  ! 803: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x87952068  ! 804: WRPR_TT_I	wrpr	%r20, 0x0068, %tt
	.word 0xb5e4a0a2  ! 807: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_6, %g1, %r20
	.word 0xbfe5603f  ! 812: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 815: RDPR_TPC	<illegal instruction>
	.word 0xb5540000  ! 816: RDPR_GL	<illegal instruction>
	.word 0xbbe52155  ! 820: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf508000  ! 821: RDPR_TSTATE	<illegal instruction>
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561fa  ! 827: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xb1e4e1be  ! 829: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb518000  ! 832: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5e0aa  ! 833: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe5609a  ! 837: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3480000  ! 839: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbab40000  ! 840: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xb9e4e016  ! 841: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde42145  ! 844: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4a1c0  ! 845: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e52030  ! 848: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4a5618f  ! 850: SUBcc_I	subcc 	%r21, 0x018f, %r26
	.word 0xb3e421f2  ! 852: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e4a1c2  ! 862: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d95604d  ! 863: WRPR_PSTATE_I	wrpr	%r21, 0x004d, %pstate
	.word 0x9194219f  ! 866: WRPR_PIL_I	wrpr	%r16, 0x019f, %pil
	.word 0xbf540000  ! 869: RDPR_GL	<illegal instruction>
	.word 0x8d94e0ff  ! 871: WRPR_PSTATE_I	wrpr	%r19, 0x00ff, %pstate
	.word 0xbc8d0000  ! 872: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xbfe5a1d3  ! 873: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb551c000  ! 874: RDPR_TL	<illegal instruction>
	.word 0xbfe52087  ! 879: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e56000  ! 880: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x819420b0  ! 882: WRPR_TPC_I	wrpr	%r16, 0x00b0, %tpc
	.word 0xbbe5e026  ! 885: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb23dc000  ! 886: XNOR_R	xnor 	%r23, %r0, %r25
	setx	data_start_2, %g1, %r17
	mov	1, %r12
	.word 0x8f930000  ! 895: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe52137  ! 897: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e5a19d  ! 900: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde46079  ! 904: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5a030  ! 905: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e52197  ! 907: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e4a05b  ! 908: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e46157  ! 911: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461ca  ! 920: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe560ba  ! 927: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e420b4  ! 928: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x87dfbdb0000790d, %g1, %r10
	.word 0x839a8000  ! 931: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4a5601c  ! 932: SUBcc_I	subcc 	%r21, 0x001c, %r26
	.word 0xb5e4e144  ! 934: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e46157  ! 938: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5a0ae  ! 944: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e5e078  ! 945: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9540000  ! 948: RDPR_GL	<illegal instruction>
	.word 0xbd500000  ! 949: RDPR_TPC	<illegal instruction>
	.word 0xbd480000  ! 952: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb3e4e160  ! 953: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5615a  ! 954: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7480000  ! 955: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbe461ea  ! 958: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb51c000  ! 959: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 964: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e4218b  ! 966: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e421c3  ! 967: SAVE_I	save	%r16, 0x0001, %r25
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995e12b  ! 974: WRPR_TICK_I	wrpr	%r23, 0x012b, %tick
	.word 0x9194a1e6  ! 978: WRPR_PIL_I	wrpr	%r18, 0x01e6, %pil
	.word 0xb7500000  ! 979: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e14b  ! 984: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e52102  ! 990: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42156  ! 993: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde56061  ! 995: SAVE_I	save	%r21, 0x0001, %r30
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
	mov	1, %r12
	.word 0xa1930000  ! 4: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfb3d0000  ! 6: STDF_R	std	%f29, [%r0, %r20]
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c4000  ! 11: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xb81de089  ! 18: XOR_I	xor 	%r23, 0x0089, %r28
	.word 0x8595217a  ! 19: WRPR_TSTATE_I	wrpr	%r20, 0x017a, %tstate
	setx	0xac0623b00000d819, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb0144000  ! 22: OR_R	or 	%r17, %r0, %r24
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0058000  ! 24: ADD_R	add 	%r22, %r0, %r24
	.word 0xf225e146  ! 26: STW_I	stw	%r25, [%r23 + 0x0146]
	.word 0xb83c61f1  ! 28: XNOR_I	xnor 	%r17, 0x01f1, %r28
	.word 0x87942067  ! 33: WRPR_TT_I	wrpr	%r16, 0x0067, %tt
	.word 0x879560b6  ! 36: WRPR_TT_I	wrpr	%r21, 0x00b6, %tt
	.word 0xf2758000  ! 37: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xb17da401  ! 38: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xb32c1000  ! 40: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xb9518000  ! 45: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb1500000  ! 47: RDPR_TPC	<illegal instruction>
	setx	0xde81722f0000ea46, %g1, %r10
	.word 0x839a8000  ! 51: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf02ce0ce  ! 53: STB_I	stb	%r24, [%r19 + 0x00ce]
	.word 0xfc3461c0  ! 56: STH_I	sth	%r30, [%r17 + 0x01c0]
	.word 0xb3508000  ! 61: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xfa34616f  ! 62: STH_I	sth	%r29, [%r17 + 0x016f]
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6148000  ! 69: OR_R	or 	%r18, %r0, %r27
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 71: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb1480000  ! 74: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb0350000  ! 75: ORN_R	orn 	%r20, %r0, %r24
	.word 0xf8350000  ! 77: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xbabc8000  ! 78: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xfe34c000  ! 79: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x8195e0f6  ! 80: WRPR_TPC_I	wrpr	%r23, 0x00f6, %tpc
	.word 0xf62ce173  ! 82: STB_I	stb	%r27, [%r19 + 0x0173]
	.word 0xb1510000  ! 90: RDPR_TICK	rdpr	%tick, %r24
	.word 0xf225617a  ! 91: STW_I	stw	%r25, [%r21 + 0x017a]
	.word 0x8395a0d8  ! 94: WRPR_TNPC_I	wrpr	%r22, 0x00d8, %tnpc
	.word 0xfe252106  ! 97: STW_I	stw	%r31, [%r20 + 0x0106]
	.word 0xb1518000  ! 99: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf93c8000  ! 101: STDF_R	std	%f28, [%r0, %r18]
	.word 0xfa34e1e3  ! 103: STH_I	sth	%r29, [%r19 + 0x01e3]
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 109: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xfe24201e  ! 111: STW_I	stw	%r31, [%r16 + 0x001e]
	.word 0xfc2c2171  ! 112: STB_I	stb	%r30, [%r16 + 0x0171]
	setx	0xccadaa9900006ccc, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf435614f  ! 116: STH_I	sth	%r26, [%r21 + 0x014f]
	.word 0xf8756092  ! 117: STX_I	stx	%r28, [%r21 + 0x0092]
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63cc000  ! 128: STD_R	std	%r27, [%r19 + %r0]
	.word 0xf225e0a0  ! 130: STW_I	stw	%r25, [%r23 + 0x00a0]
	setx	0x2b8643ac00000eda, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995204e  ! 133: WRPR_TICK_I	wrpr	%r20, 0x004e, %tick
	.word 0xfe3ca0a8  ! 135: STD_I	std	%r31, [%r18 + 0x00a8]
	.word 0xfc24c000  ! 136: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xff3c0000  ! 138: STDF_R	std	%f31, [%r0, %r16]
	.word 0xfa354000  ! 140: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xbf508000  ! 142: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x839461d2  ! 143: WRPR_TNPC_I	wrpr	%r17, 0x01d2, %tnpc
	setx	0xa96fffd00009fd0, %g1, %r10
	.word 0x819a8000  ! 147: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe746127  ! 149: STX_I	stx	%r31, [%r17 + 0x0127]
	.word 0x8d94603c  ! 154: WRPR_PSTATE_I	wrpr	%r17, 0x003c, %pstate
	.word 0xf43d0000  ! 158: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf93c0000  ! 159: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf23ce095  ! 160: STD_I	std	%r25, [%r19 + 0x0095]
	.word 0x899560f7  ! 163: WRPR_TICK_I	wrpr	%r21, 0x00f7, %tick
	.word 0xf02da1d7  ! 164: STB_I	stb	%r24, [%r22 + 0x01d7]
	.word 0x8995218f  ! 167: WRPR_TICK_I	wrpr	%r20, 0x018f, %tick
	.word 0x8595a1bb  ! 172: WRPR_TSTATE_I	wrpr	%r22, 0x01bb, %tstate
	.word 0xf53c61fb  ! 176: STDF_I	std	%f26, [0x01fb, %r17]
	.word 0x8594a158  ! 177: WRPR_TSTATE_I	wrpr	%r18, 0x0158, %tstate
	.word 0x9194a154  ! 178: WRPR_PIL_I	wrpr	%r18, 0x0154, %pil
	.word 0xf835e07c  ! 179: STH_I	sth	%r28, [%r23 + 0x007c]
	mov	2, %r12
	.word 0x8f930000  ! 180: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x879561d5  ! 181: WRPR_TT_I	wrpr	%r21, 0x01d5, %tt
	.word 0x8595a115  ! 185: WRPR_TSTATE_I	wrpr	%r22, 0x0115, %tstate
	.word 0xf02d4000  ! 187: STB_R	stb	%r24, [%r21 + %r0]
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9521d7  ! 189: WRPR_PSTATE_I	wrpr	%r20, 0x01d7, %pstate
	.word 0xf13d8000  ! 190: STDF_R	std	%f24, [%r0, %r22]
	.word 0xfe3d0000  ! 191: STD_R	std	%r31, [%r20 + %r0]
	.word 0x919420ad  ! 193: WRPR_PIL_I	wrpr	%r16, 0x00ad, %pil
	.word 0xfe740000  ! 201: STX_R	stx	%r31, [%r16 + %r0]
	setx	0x86c12d0000007d48, %g1, %r10
	.word 0x819a8000  ! 205: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb3d2134  ! 209: STDF_I	std	%f29, [0x0134, %r20]
	.word 0xb5510000  ! 211: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb551c000  ! 212: RDPR_TL	<illegal instruction>
	.word 0xfc248000  ! 214: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb351c000  ! 217: RDPR_TL	<illegal instruction>
	.word 0xf33d2108  ! 219: STDF_I	std	%f25, [0x0108, %r20]
	.word 0xf6754000  ! 224: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf02c0000  ! 225: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf874205b  ! 227: STX_I	stx	%r28, [%r16 + 0x005b]
	.word 0xbf510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xfb3da0a6  ! 230: STDF_I	std	%f29, [0x00a6, %r22]
	.word 0x8395200a  ! 233: WRPR_TNPC_I	wrpr	%r20, 0x000a, %tnpc
	.word 0xfb3d20bc  ! 234: STDF_I	std	%f29, [0x00bc, %r20]
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ce0be  ! 237: STB_I	stb	%r28, [%r19 + 0x00be]
	.word 0x8995e1d4  ! 243: WRPR_TICK_I	wrpr	%r23, 0x01d4, %tick
	.word 0xf2252198  ! 244: STW_I	stw	%r25, [%r20 + 0x0198]
	setx	data_start_3, %g1, %r17
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43560ed  ! 249: STH_I	sth	%r26, [%r21 + 0x00ed]
	.word 0xfc3c60b7  ! 252: STD_I	std	%r30, [%r17 + 0x00b7]
	.word 0xfa3c8000  ! 253: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf83c4000  ! 254: STD_R	std	%r28, [%r17 + %r0]
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63da16c  ! 261: STD_I	std	%r27, [%r22 + 0x016c]
	.word 0xfb3d2076  ! 266: STDF_I	std	%f29, [0x0076, %r20]
	.word 0xf13c0000  ! 267: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfe344000  ! 272: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbf51c000  ! 273: RDPR_TL	rdpr	%tl, %r31
	.word 0xb1518000  ! 274: RDPR_PSTATE	<illegal instruction>
	.word 0xfe35a0d5  ! 282: STH_I	sth	%r31, [%r22 + 0x00d5]
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	setx	0x975e98ca0000085a, %g1, %r10
	.word 0x819a8000  ! 284: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879420fe  ! 286: WRPR_TT_I	wrpr	%r16, 0x00fe, %tt
	.word 0x8995a1a3  ! 287: WRPR_TICK_I	wrpr	%r22, 0x01a3, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc354000  ! 289: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfc2de01a  ! 291: STB_I	stb	%r30, [%r23 + 0x001a]
	.word 0xf4348000  ! 295: STH_R	sth	%r26, [%r18 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 296: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa2d4000  ! 301: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xb7520000  ! 305: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb0854000  ! 309: ADDcc_R	addcc 	%r21, %r0, %r24
	setx	data_start_5, %g1, %r18
	.word 0xf8744000  ! 313: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xfe3de118  ! 314: STD_I	std	%r31, [%r23 + 0x0118]
	.word 0xf83ce0cd  ! 315: STD_I	std	%r28, [%r19 + 0x00cd]
	setx	data_start_0, %g1, %r21
	.word 0x8794a14c  ! 319: WRPR_TT_I	wrpr	%r18, 0x014c, %tt
	.word 0xf625c000  ! 324: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xb8c5e1ee  ! 327: ADDCcc_I	addccc 	%r23, 0x01ee, %r28
	.word 0xb5508000  ! 328: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf4342084  ! 331: STH_I	sth	%r26, [%r16 + 0x0084]
	.word 0xf424e1f6  ! 334: STW_I	stw	%r26, [%r19 + 0x01f6]
	setx	0xff4864f900002ada, %g1, %r10
	.word 0x839a8000  ! 336: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf825c000  ! 338: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf23c8000  ! 340: STD_R	std	%r25, [%r18 + %r0]
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3348000  ! 343: SRL_R	srl 	%r18, %r0, %r25
	.word 0xf02ca0ed  ! 345: STB_I	stb	%r24, [%r18 + 0x00ed]
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3c8000  ! 351: STDF_R	std	%f30, [%r0, %r18]
	.word 0xbf520000  ! 352: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf6254000  ! 353: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xbc3c8000  ! 355: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xfe34c000  ! 358: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe74a151  ! 361: STX_I	stx	%r31, [%r18 + 0x0151]
	.word 0xfa248000  ! 364: STW_R	stw	%r29, [%r18 + %r0]
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225a1d0  ! 369: STW_I	stw	%r25, [%r22 + 0x01d0]
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85942031  ! 372: WRPR_TSTATE_I	wrpr	%r16, 0x0031, %tstate
	.word 0xfc258000  ! 373: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xfd3d0000  ! 377: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf825c000  ! 378: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xbb540000  ! 381: RDPR_GL	rdpr	%-, %r29
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74a02b  ! 384: STX_I	stx	%r29, [%r18 + 0x002b]
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x8794a05b  ! 390: WRPR_TT_I	wrpr	%r18, 0x005b, %tt
	.word 0xf0750000  ! 391: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xb2152170  ! 392: OR_I	or 	%r20, 0x0170, %r25
	.word 0xf8752162  ! 393: STX_I	stx	%r28, [%r20 + 0x0162]
	.word 0x8594e17b  ! 394: WRPR_TSTATE_I	wrpr	%r19, 0x017b, %tstate
	.word 0xf13d609f  ! 395: STDF_I	std	%f24, [0x009f, %r21]
	.word 0xf22c4000  ! 398: STB_R	stb	%r25, [%r17 + %r0]
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	.word 0xb88d4000  ! 409: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xbd500000  ! 416: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xbf345000  ! 421: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xb5510000  ! 426: RDPR_TICK	<illegal instruction>
	.word 0x839420ea  ! 427: WRPR_TNPC_I	wrpr	%r16, 0x00ea, %tnpc
	.word 0xf834a1f2  ! 434: STH_I	sth	%r28, [%r18 + 0x01f2]
	.word 0xf42d0000  ! 435: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xbe35602e  ! 436: SUBC_I	orn 	%r21, 0x002e, %r31
	.word 0xf93dc000  ! 437: STDF_R	std	%f28, [%r0, %r23]
	.word 0x9195e13b  ! 442: WRPR_PIL_I	wrpr	%r23, 0x013b, %pil
	.word 0xfa24c000  ! 443: STW_R	stw	%r29, [%r19 + %r0]
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2354000  ! 446: STH_R	sth	%r25, [%r21 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919421db  ! 451: WRPR_PIL_I	wrpr	%r16, 0x01db, %pil
	mov	1, %r12
	.word 0x8f930000  ! 454: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xd392ff6000004844, %g1, %r10
	.word 0x819a8000  ! 455: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53dc000  ! 456: STDF_R	std	%f26, [%r0, %r23]
	.word 0xf33c4000  ! 458: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf8752160  ! 461: STX_I	stx	%r28, [%r20 + 0x0160]
	.word 0xfe7461ac  ! 463: STX_I	stx	%r31, [%r17 + 0x01ac]
	.word 0xfe2520b4  ! 465: STW_I	stw	%r31, [%r20 + 0x00b4]
	.word 0xf82de19d  ! 468: STB_I	stb	%r28, [%r23 + 0x019d]
	.word 0xf0358000  ! 470: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xff3d4000  ! 474: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb3352001  ! 476: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xfc24e1b7  ! 477: STW_I	stw	%r30, [%r19 + 0x01b7]
	.word 0xfa2c2115  ! 482: STB_I	stb	%r29, [%r16 + 0x0115]
	.word 0xf434c000  ! 484: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb8b48000  ! 485: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xf074a19d  ! 494: STX_I	stx	%r24, [%r18 + 0x019d]
	.word 0xfa25210c  ! 495: STW_I	stw	%r29, [%r20 + 0x010c]
	.word 0x83946004  ! 496: WRPR_TNPC_I	wrpr	%r17, 0x0004, %tnpc
	.word 0xf02de139  ! 498: STB_I	stb	%r24, [%r23 + 0x0139]
	.word 0x8d95e18e  ! 501: WRPR_PSTATE_I	wrpr	%r23, 0x018e, %pstate
	.word 0xfa2d4000  ! 503: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf274a05a  ! 509: STX_I	stx	%r25, [%r18 + 0x005a]
	.word 0xb82ce0df  ! 511: ANDN_I	andn 	%r19, 0x00df, %r28
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf53da1fb  ! 521: STDF_I	std	%f26, [0x01fb, %r22]
	.word 0xf6240000  ! 523: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xbf540000  ! 524: RDPR_GL	rdpr	%-, %r31
	.word 0x8195e167  ! 525: WRPR_TPC_I	wrpr	%r23, 0x0167, %tpc
	.word 0xfe74208d  ! 528: STX_I	stx	%r31, [%r16 + 0x008d]
	.word 0xff3d2071  ! 529: STDF_I	std	%f31, [0x0071, %r20]
	.word 0xbd643801  ! 534: MOVcc_I	<illegal instruction>
	.word 0x9194a014  ! 535: WRPR_PIL_I	wrpr	%r18, 0x0014, %pil
	.word 0xbe250000  ! 536: SUB_R	sub 	%r20, %r0, %r31
	.word 0xb551c000  ! 537: RDPR_TL	rdpr	%tl, %r26
	.word 0xfc2ce03e  ! 540: STB_I	stb	%r30, [%r19 + 0x003e]
	setx	data_start_6, %g1, %r20
	.word 0xbd540000  ! 550: RDPR_GL	<illegal instruction>
	.word 0xf075a02e  ! 551: STX_I	stx	%r24, [%r22 + 0x002e]
	.word 0xf074616f  ! 552: STX_I	stx	%r24, [%r17 + 0x016f]
	.word 0xb0bc6033  ! 555: XNORcc_I	xnorcc 	%r17, 0x0033, %r24
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73c0000  ! 559: STDF_R	std	%f27, [%r0, %r16]
	.word 0xbeb48000  ! 565: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xbe8460b0  ! 567: ADDcc_I	addcc 	%r17, 0x00b0, %r31
	mov	2, %r12
	.word 0x8f930000  ! 570: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	mov	2, %r12
	.word 0x8f930000  ! 576: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf2748000  ! 578: STX_R	stx	%r25, [%r18 + %r0]
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 581: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf6354000  ! 582: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xb644611e  ! 585: ADDC_I	addc 	%r17, 0x011e, %r27
	.word 0xf634e0dd  ! 586: STH_I	sth	%r27, [%r19 + 0x00dd]
	.word 0xfc3da04a  ! 587: STD_I	std	%r30, [%r22 + 0x004a]
	.word 0xb1500000  ! 588: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfa3de13a  ! 590: STD_I	std	%r29, [%r23 + 0x013a]
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62560c4  ! 598: SUB_I	sub 	%r21, 0x00c4, %r27
	.word 0xb5508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xf474e006  ! 604: STX_I	stx	%r26, [%r19 + 0x0006]
	.word 0xfc3420bc  ! 606: STH_I	sth	%r30, [%r16 + 0x00bc]
	.word 0xbaa4a095  ! 608: SUBcc_I	subcc 	%r18, 0x0095, %r29
	.word 0xb9518000  ! 611: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd7ce401  ! 617: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xba1c2164  ! 618: XOR_I	xor 	%r16, 0x0164, %r29
	.word 0xf2256179  ! 622: STW_I	stw	%r25, [%r21 + 0x0179]
	.word 0xfe74e020  ! 623: STX_I	stx	%r31, [%r19 + 0x0020]
	.word 0xf2348000  ! 626: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xfa2da1e9  ! 627: STB_I	stb	%r29, [%r22 + 0x01e9]
	.word 0xfa75a0f3  ! 629: STX_I	stx	%r29, [%r22 + 0x00f3]
	.word 0xfa34c000  ! 630: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf2752002  ! 631: STX_I	stx	%r25, [%r20 + 0x0002]
	.word 0xfc2560af  ! 635: STW_I	stw	%r30, [%r21 + 0x00af]
	.word 0xb2b4215e  ! 637: ORNcc_I	orncc 	%r16, 0x015e, %r25
	.word 0xf4752020  ! 638: STX_I	stx	%r26, [%r20 + 0x0020]
	.word 0xf27561c0  ! 641: STX_I	stx	%r25, [%r21 + 0x01c0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf13ce0e4  ! 647: STDF_I	std	%f24, [0x00e4, %r19]
	.word 0x8394e1e5  ! 650: WRPR_TNPC_I	wrpr	%r19, 0x01e5, %tnpc
	.word 0xfc34e110  ! 652: STH_I	sth	%r30, [%r19 + 0x0110]
	.word 0xb13dc000  ! 656: SRA_R	sra 	%r23, %r0, %r24
	.word 0xf82c0000  ! 661: STB_R	stb	%r28, [%r16 + %r0]
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 668: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xfa740000  ! 669: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfc3da1ec  ! 670: STD_I	std	%r30, [%r22 + 0x01ec]
	.word 0xfc75a090  ! 671: STX_I	stx	%r30, [%r22 + 0x0090]
	.word 0xb3540000  ! 674: RDPR_GL	<illegal instruction>
	.word 0xfa74a0d2  ! 675: STX_I	stx	%r29, [%r18 + 0x00d2]
	.word 0xbcb4a070  ! 676: ORNcc_I	orncc 	%r18, 0x0070, %r30
	.word 0xbd508000  ! 685: RDPR_TSTATE	<illegal instruction>
	.word 0xfa2ce056  ! 689: STB_I	stb	%r29, [%r19 + 0x0056]
	.word 0xfa2d0000  ! 690: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb3480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x919461ca  ! 697: WRPR_PIL_I	wrpr	%r17, 0x01ca, %pil
	setx	0xa94930a80000ad88, %g1, %r10
	.word 0x819a8000  ! 706: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe24a1ef  ! 709: STW_I	stw	%r31, [%r18 + 0x01ef]
	.word 0xfa3d8000  ! 710: STD_R	std	%r29, [%r22 + %r0]
	.word 0xbf520000  ! 711: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf4748000  ! 712: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfc34a025  ! 714: STH_I	sth	%r30, [%r18 + 0x0025]
	.word 0xf82c4000  ! 718: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfd3dc000  ! 722: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf22dc000  ! 723: STB_R	stb	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb500000  ! 726: RDPR_TPC	<illegal instruction>
	.word 0x8594a083  ! 727: WRPR_TSTATE_I	wrpr	%r18, 0x0083, %tstate
	.word 0xf63c2004  ! 730: STD_I	std	%r27, [%r16 + 0x0004]
	.word 0xf22c4000  ! 733: STB_R	stb	%r25, [%r17 + %r0]
	setx	data_start_3, %g1, %r17
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfd3c8000  ! 745: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf0250000  ! 746: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf424c000  ! 747: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf6346011  ! 751: STH_I	sth	%r27, [%r17 + 0x0011]
	.word 0xfc258000  ! 753: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xb9480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf2344000  ! 757: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xfb3c0000  ! 758: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf6740000  ! 759: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xbd641800  ! 760: MOVcc_R	<illegal instruction>
	.word 0xb9540000  ! 767: RDPR_GL	<illegal instruction>
	.word 0xf4258000  ! 771: STW_R	stw	%r26, [%r22 + %r0]
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6342147  ! 774: STH_I	sth	%r27, [%r16 + 0x0147]
	.word 0x8594e17c  ! 775: WRPR_TSTATE_I	wrpr	%r19, 0x017c, %tstate
	.word 0xf03c0000  ! 777: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbf50c000  ! 778: RDPR_TT	rdpr	%tt, %r31
	.word 0xf8754000  ! 780: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf6244000  ! 787: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf93de072  ! 791: STDF_I	std	%f28, [0x0072, %r23]
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 801: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x879461e5  ! 804: WRPR_TT_I	wrpr	%r17, 0x01e5, %tt
	.word 0xf73d8000  ! 808: STDF_R	std	%f27, [%r0, %r22]
	setx	data_start_7, %g1, %r18
	.word 0xf02cc000  ! 813: STB_R	stb	%r24, [%r19 + %r0]
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 815: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xb7540000  ! 816: RDPR_GL	<illegal instruction>
	.word 0xf02561a1  ! 817: STW_I	stw	%r24, [%r21 + 0x01a1]
	.word 0xb3508000  ! 821: RDPR_TSTATE	<illegal instruction>
	.word 0xf82c60c5  ! 823: STB_I	stb	%r28, [%r17 + 0x00c5]
	.word 0xfc2c0000  ! 824: STB_R	stb	%r30, [%r16 + %r0]
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xb1518000  ! 832: RDPR_PSTATE	<illegal instruction>
	.word 0xf22c8000  ! 834: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf8358000  ! 836: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb9480000  ! 839: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbab54000  ! 840: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xf13ce149  ! 842: STDF_I	std	%f24, [0x0149, %r19]
	.word 0xf274608d  ! 847: STX_I	stx	%r25, [%r17 + 0x008d]
	.word 0xfa7520dc  ! 849: STX_I	stx	%r29, [%r20 + 0x00dc]
	.word 0xb2a56170  ! 850: SUBcc_I	subcc 	%r21, 0x0170, %r25
	.word 0xfa34c000  ! 854: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf23561b5  ! 855: STH_I	sth	%r25, [%r21 + 0x01b5]
	.word 0xfd3d6113  ! 856: STDF_I	std	%f30, [0x0113, %r21]
	.word 0x8d952055  ! 863: WRPR_PSTATE_I	wrpr	%r20, 0x0055, %pstate
	.word 0xf22dc000  ! 864: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xfa3421e7  ! 865: STH_I	sth	%r29, [%r16 + 0x01e7]
	.word 0x9195e0eb  ! 866: WRPR_PIL_I	wrpr	%r23, 0x00eb, %pil
	.word 0xb5540000  ! 869: RDPR_GL	rdpr	%-, %r26
	.word 0x8d95e137  ! 871: WRPR_PSTATE_I	wrpr	%r23, 0x0137, %pstate
	.word 0xb28dc000  ! 872: ANDcc_R	andcc 	%r23, %r0, %r25
	.word 0xbf51c000  ! 874: RDPR_TL	rdpr	%tl, %r31
	.word 0xf67460f9  ! 878: STX_I	stx	%r27, [%r17 + 0x00f9]
	.word 0x8194a0e6  ! 882: WRPR_TPC_I	wrpr	%r18, 0x00e6, %tpc
	.word 0xf02c0000  ! 883: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb63dc000  ! 886: XNOR_R	xnor 	%r23, %r0, %r27
	.word 0xf675c000  ! 891: STX_R	stx	%r27, [%r23 + %r0]
	setx	data_start_4, %g1, %r22
	mov	0, %r12
	.word 0x8f930000  ! 895: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa34a093  ! 909: STH_I	sth	%r29, [%r18 + 0x0093]
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 918: STB_R	stb	%r24, [%r21 + %r0]
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c8000  ! 921: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfa746040  ! 922: STX_I	stx	%r29, [%r17 + 0x0040]
	.word 0xfa3c8000  ! 923: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf33d61bc  ! 925: STDF_I	std	%f25, [0x01bc, %r21]
	.word 0xfe2c4000  ! 930: STB_R	stb	%r31, [%r17 + %r0]
	setx	0xfd44b05c0000b80a, %g1, %r10
	.word 0x839a8000  ! 931: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbaa52031  ! 932: SUBcc_I	subcc 	%r20, 0x0031, %r29
	.word 0xf62d2174  ! 936: STB_I	stb	%r27, [%r20 + 0x0174]
	.word 0xf2744000  ! 940: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf02de12b  ! 941: STB_I	stb	%r24, [%r23 + 0x012b]
	.word 0xf0340000  ! 942: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xff3da19e  ! 943: STDF_I	std	%f31, [0x019e, %r22]
	.word 0xb3540000  ! 948: RDPR_GL	rdpr	%-, %r25
	.word 0xb1500000  ! 949: RDPR_TPC	<illegal instruction>
	.word 0xf475e0e3  ! 951: STX_I	stx	%r26, [%r23 + 0x00e3]
	.word 0xbb480000  ! 952: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7480000  ! 955: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfb3c61e2  ! 956: STDF_I	std	%f29, [0x01e2, %r17]
	.word 0xfa740000  ! 957: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xb551c000  ! 959: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 964: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4256181  ! 965: STW_I	stw	%r26, [%r21 + 0x0181]
	.word 0xfa35c000  ! 968: STH_R	sth	%r29, [%r23 + %r0]
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 972: STB_R	stb	%r24, [%r18 + %r0]
	.word 0x8995a03d  ! 974: WRPR_TICK_I	wrpr	%r22, 0x003d, %tick
	.word 0xfa2ca131  ! 975: STB_I	stb	%r29, [%r18 + 0x0131]
	.word 0xff3c20e2  ! 977: STDF_I	std	%f31, [0x00e2, %r16]
	.word 0x9194a090  ! 978: WRPR_PIL_I	wrpr	%r18, 0x0090, %pil
	.word 0xb5500000  ! 979: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfc250000  ! 981: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfa34e05c  ! 983: STH_I	sth	%r29, [%r19 + 0x005c]
	.word 0xf8744000  ! 988: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf42c8000  ! 989: STB_R	stb	%r26, [%r18 + %r0]
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875e110  ! 998: STX_I	stx	%r28, [%r23 + 0x0110]
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
	.word 0xf6158000  ! 1: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf8540000  ! 2: LDSH_R	ldsh	[%r16 + %r0], %r28
	mov	2, %r12
	.word 0xa1930000  ! 4: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1c604b  ! 15: LDDF_I	ldd	[%r17, 0x004b], %f31
	.word 0xf0058000  ! 17: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xba1d219d  ! 18: XOR_I	xor 	%r20, 0x019d, %r29
	.word 0x85952189  ! 19: WRPR_TSTATE_I	wrpr	%r20, 0x0189, %tstate
	setx	0x87dc26aa00003d53, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xba150000  ! 22: OR_R	or 	%r20, %r0, %r29
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0054000  ! 24: ADD_R	add 	%r21, %r0, %r24
	.word 0xfa44a1f4  ! 25: LDSW_I	ldsw	[%r18 + 0x01f4], %r29
	.word 0xb03d61a6  ! 28: XNOR_I	xnor 	%r21, 0x01a6, %r24
	.word 0xf415e134  ! 30: LDUH_I	lduh	[%r23 + 0x0134], %r26
	.word 0xf655a03a  ! 32: LDSH_I	ldsh	[%r22 + 0x003a], %r27
	.word 0x87952132  ! 33: WRPR_TT_I	wrpr	%r20, 0x0132, %tt
	.word 0xff1c2129  ! 34: LDDF_I	ldd	[%r16, 0x0129], %f31
	.word 0xf8550000  ! 35: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0x8794602d  ! 36: WRPR_TT_I	wrpr	%r17, 0x002d, %tt
	.word 0xbd7de401  ! 38: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xbd2cd000  ! 40: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xf4552085  ! 41: LDSH_I	ldsh	[%r20 + 0x0085], %r26
	.word 0xf415a128  ! 43: LDUH_I	lduh	[%r22 + 0x0128], %r26
	.word 0xf055c000  ! 44: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xb7518000  ! 45: RDPR_PSTATE	<illegal instruction>
	.word 0xb3500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0xf215c000  ! 48: LDUH_R	lduh	[%r23 + %r0], %r25
	setx	0x63d5d90000004dc4, %g1, %r10
	.word 0x839a8000  ! 51: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfd1c4000  ! 60: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xb5508000  ! 61: RDPR_TSTATE	<illegal instruction>
	.word 0xf6450000  ! 63: LDSW_R	ldsw	[%r20 + %r0], %r27
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04a122  ! 68: LDUW_I	lduw	[%r18 + 0x0122], %r30
	.word 0xb4150000  ! 69: OR_R	or 	%r20, %r0, %r26
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d0000  ! 72: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xbf480000  ! 74: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbc350000  ! 75: ORN_R	orn 	%r20, %r0, %r30
	.word 0xb2bcc000  ! 78: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0x81952117  ! 80: WRPR_TPC_I	wrpr	%r20, 0x0117, %tpc
	.word 0xf71ce151  ! 81: LDDF_I	ldd	[%r19, 0x0151], %f27
	.word 0xf2150000  ! 85: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xf0540000  ! 86: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xbb510000  ! 90: RDPR_TICK	<illegal instruction>
	.word 0x8395e0a3  ! 94: WRPR_TNPC_I	wrpr	%r23, 0x00a3, %tnpc
	.word 0xf0146113  ! 95: LDUH_I	lduh	[%r17 + 0x0113], %r24
	.word 0xf60dc000  ! 96: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xbb518000  ! 99: RDPR_PSTATE	<illegal instruction>
	.word 0xfa454000  ! 100: LDSW_R	ldsw	[%r21 + %r0], %r29
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71d0000  ! 107: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xff1c8000  ! 113: LDDF_R	ldd	[%r18, %r0], %f31
	setx	0x7c78b1c60000af53, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4142091  ! 119: LDUH_I	lduh	[%r16 + 0x0091], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf64c4000  ! 122: LDSB_R	ldsb	[%r17 + %r0], %r27
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	setx	0x3462feb10000ed43, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x89956149  ! 133: WRPR_TICK_I	wrpr	%r21, 0x0149, %tick
	.word 0xbf508000  ! 142: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x8395a003  ! 143: WRPR_TNPC_I	wrpr	%r22, 0x0003, %tnpc
	.word 0xfa056182  ! 144: LDUW_I	lduw	[%r21 + 0x0182], %r29
	.word 0xf854e177  ! 146: LDSH_I	ldsh	[%r19 + 0x0177], %r28
	setx	0x47d5e07a0000ba1c, %g1, %r10
	.word 0x819a8000  ! 147: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf84d4000  ! 148: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfb1ce067  ! 151: LDDF_I	ldd	[%r19, 0x0067], %f29
	.word 0x8d94616d  ! 154: WRPR_PSTATE_I	wrpr	%r17, 0x016d, %pstate
	.word 0xfa4c61af  ! 157: LDSB_I	ldsb	[%r17 + 0x01af], %r29
	.word 0xf01c4000  ! 162: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0x8994a178  ! 163: WRPR_TICK_I	wrpr	%r18, 0x0178, %tick
	.word 0xf244c000  ! 165: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0x89956122  ! 167: WRPR_TICK_I	wrpr	%r21, 0x0122, %tick
	.word 0x8595a1a7  ! 172: WRPR_TSTATE_I	wrpr	%r22, 0x01a7, %tstate
	.word 0xf40ca06d  ! 175: LDUB_I	ldub	[%r18 + 0x006d], %r26
	.word 0x85952028  ! 177: WRPR_TSTATE_I	wrpr	%r20, 0x0028, %tstate
	.word 0x919420d7  ! 178: WRPR_PIL_I	wrpr	%r16, 0x00d7, %pil
	mov	0, %r12
	.word 0x8f930000  ! 180: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8794a0e0  ! 181: WRPR_TT_I	wrpr	%r18, 0x00e0, %tt
	.word 0xf65460b6  ! 183: LDSH_I	ldsh	[%r17 + 0x00b6], %r27
	.word 0xf84da1f2  ! 184: LDSB_I	ldsb	[%r22 + 0x01f2], %r28
	.word 0x859520fa  ! 185: WRPR_TSTATE_I	wrpr	%r20, 0x00fa, %tstate
	.word 0xf31d4000  ! 186: LDDF_R	ldd	[%r21, %r0], %f25
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9421af  ! 189: WRPR_PSTATE_I	wrpr	%r16, 0x01af, %pstate
	.word 0x9194219b  ! 193: WRPR_PIL_I	wrpr	%r16, 0x019b, %pil
	.word 0xf51ce15e  ! 197: LDDF_I	ldd	[%r19, 0x015e], %f26
	.word 0xf51c211e  ! 198: LDDF_I	ldd	[%r16, 0x011e], %f26
	.word 0xf00d0000  ! 202: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf8554000  ! 203: LDSH_R	ldsh	[%r21 + %r0], %r28
	setx	0x9d10b4c700003c16, %g1, %r10
	.word 0x819a8000  ! 205: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7510000  ! 211: RDPR_TICK	<illegal instruction>
	.word 0xbb51c000  ! 212: RDPR_TL	<illegal instruction>
	.word 0xf4148000  ! 213: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfe0d8000  ! 216: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xb551c000  ! 217: RDPR_TL	<illegal instruction>
	.word 0xf51c61f6  ! 220: LDDF_I	ldd	[%r17, 0x01f6], %f26
	.word 0xf31c6163  ! 222: LDDF_I	ldd	[%r17, 0x0163], %f25
	.word 0xfa554000  ! 223: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfe4c0000  ! 226: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfc0d60bd  ! 228: LDUB_I	ldub	[%r21 + 0x00bd], %r30
	.word 0xb7510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xf41de077  ! 232: LDD_I	ldd	[%r23 + 0x0077], %r26
	.word 0x8394e08e  ! 233: WRPR_TNPC_I	wrpr	%r19, 0x008e, %tnpc
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 238: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf445c000  ! 240: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf61cc000  ! 241: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0x8994e135  ! 243: WRPR_TICK_I	wrpr	%r19, 0x0135, %tick
	.word 0xf015e185  ! 245: LDUH_I	lduh	[%r23 + 0x0185], %r24
	setx	data_start_2, %g1, %r23
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404206f  ! 256: LDUW_I	lduw	[%r16 + 0x006f], %r26
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c60f0  ! 260: LDX_I	ldx	[%r17 + 0x00f0], %r31
	.word 0xfc1c20c3  ! 262: LDD_I	ldd	[%r16 + 0x00c3], %r30
	.word 0xf0542112  ! 265: LDSH_I	ldsh	[%r16 + 0x0112], %r24
	.word 0xf0154000  ! 268: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xfa1dc000  ! 269: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf71dc000  ! 270: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xf25c617a  ! 271: LDX_I	ldx	[%r17 + 0x017a], %r25
	.word 0xb351c000  ! 273: RDPR_TL	rdpr	%tl, %r25
	.word 0xb3518000  ! 274: RDPR_PSTATE	<illegal instruction>
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	setx	0x1c384d7a00006e5a, %g1, %r10
	.word 0x819a8000  ! 284: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf40d2149  ! 285: LDUB_I	ldub	[%r20 + 0x0149], %r26
	.word 0x8794208f  ! 286: WRPR_TT_I	wrpr	%r16, 0x008f, %tt
	.word 0x899520b8  ! 287: WRPR_TICK_I	wrpr	%r20, 0x00b8, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf05ca0ed  ! 290: LDX_I	ldx	[%r18 + 0x00ed], %r24
	.word 0xf25c0000  ! 292: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf91c4000  ! 293: LDDF_R	ldd	[%r17, %r0], %f28
	mov	0, %r12
	.word 0xa1930000  ! 296: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xff1c21f2  ! 299: LDDF_I	ldd	[%r16, 0x01f2], %f31
	.word 0xf65c8000  ! 302: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xbd520000  ! 305: RDPR_PIL	<illegal instruction>
	.word 0xb484c000  ! 309: ADDcc_R	addcc 	%r19, %r0, %r26
	setx	data_start_2, %g1, %r21
	setx	data_start_7, %g1, %r22
	.word 0x8794603c  ! 319: WRPR_TT_I	wrpr	%r17, 0x003c, %tt
	.word 0xb8c46071  ! 327: ADDCcc_I	addccc 	%r17, 0x0071, %r28
	.word 0xbf508000  ! 328: RDPR_TSTATE	<illegal instruction>
	.word 0xf4140000  ! 332: LDUH_R	lduh	[%r16 + %r0], %r26
	setx	0xc42f32e900009f57, %g1, %r10
	.word 0x839a8000  ! 336: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe15e0ee  ! 339: LDUH_I	lduh	[%r23 + 0x00ee], %r31
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24420b8  ! 342: LDSW_I	ldsw	[%r16 + 0x00b8], %r25
	.word 0xb3354000  ! 343: SRL_R	srl 	%r21, %r0, %r25
	.word 0xfd1ce1a3  ! 347: LDDF_I	ldd	[%r19, 0x01a3], %f30
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 352: RDPR_PIL	rdpr	%pil, %r31
	.word 0xfe4c8000  ! 354: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xbc3d4000  ! 355: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0xf64421b9  ! 360: LDSW_I	ldsw	[%r16 + 0x01b9], %r27
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645e094  ! 366: LDSW_I	ldsw	[%r23 + 0x0094], %r27
	.word 0xf05d0000  ! 367: LDX_R	ldx	[%r20 + %r0], %r24
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859420de  ! 372: WRPR_TSTATE_I	wrpr	%r16, 0x00de, %tstate
	.word 0xfa1d0000  ! 380: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb7540000  ! 381: RDPR_GL	<illegal instruction>
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x8794a0cd  ! 390: WRPR_TT_I	wrpr	%r18, 0x00cd, %tt
	.word 0xb215e14f  ! 392: OR_I	or 	%r23, 0x014f, %r25
	.word 0x8594e0d7  ! 394: WRPR_TSTATE_I	wrpr	%r19, 0x00d7, %tstate
	.word 0xf81c6110  ! 397: LDD_I	ldd	[%r17 + 0x0110], %r28
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c8000  ! 404: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfa442149  ! 406: LDSW_I	ldsw	[%r16 + 0x0149], %r29
	.word 0xf40cc000  ! 407: LDUB_R	ldub	[%r19 + %r0], %r26
	setx	data_start_1, %g1, %r20
	.word 0xbe8c0000  ! 409: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xfc448000  ! 410: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf2150000  ! 411: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xf205c000  ! 413: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf61521c3  ! 415: LDUH_I	lduh	[%r20 + 0x01c3], %r27
	.word 0xb5500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xf65d4000  ! 420: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xbd34d000  ! 421: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xbb510000  ! 426: RDPR_TICK	<illegal instruction>
	.word 0x83952197  ! 427: WRPR_TNPC_I	wrpr	%r20, 0x0197, %tnpc
	.word 0xf65d6108  ! 428: LDX_I	ldx	[%r21 + 0x0108], %r27
	.word 0xf6144000  ! 431: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xff1cc000  ! 432: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb035e117  ! 436: SUBC_I	orn 	%r23, 0x0117, %r24
	.word 0xf4140000  ! 441: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0x91942176  ! 442: WRPR_PIL_I	wrpr	%r16, 0x0176, %pil
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d8000  ! 448: LDUB_R	ldub	[%r22 + %r0], %r30
	mov	2, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919520f9  ! 451: WRPR_PIL_I	wrpr	%r20, 0x00f9, %pil
	mov	1, %r12
	.word 0x8f930000  ! 454: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x67c3124200006b53, %g1, %r10
	.word 0x819a8000  ! 455: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf91ca08e  ! 457: LDDF_I	ldd	[%r18, 0x008e], %f28
	.word 0xfe4d0000  ! 459: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf2454000  ! 469: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xbd34e001  ! 476: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xf80dc000  ! 478: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xfa1dc000  ! 480: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf44da180  ! 483: LDSB_I	ldsb	[%r22 + 0x0180], %r26
	.word 0xbeb54000  ! 485: ORNcc_R	orncc 	%r21, %r0, %r31
	.word 0xfa4c4000  ! 493: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0x8395608e  ! 496: WRPR_TNPC_I	wrpr	%r21, 0x008e, %tnpc
	.word 0xf00c60b3  ! 497: LDUB_I	ldub	[%r17 + 0x00b3], %r24
	.word 0x8d95a150  ! 501: WRPR_PSTATE_I	wrpr	%r22, 0x0150, %pstate
	.word 0xf41ca143  ! 507: LDD_I	ldd	[%r18 + 0x0143], %r26
	.word 0xb42de191  ! 511: ANDN_I	andn 	%r23, 0x0191, %r26
	.word 0xf01c4000  ! 513: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xfa0da03f  ! 514: LDUB_I	ldub	[%r22 + 0x003f], %r29
	.word 0xfc45209e  ! 515: LDSW_I	ldsw	[%r20 + 0x009e], %r30
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654a135  ! 522: LDSH_I	ldsh	[%r18 + 0x0135], %r27
	.word 0xbf540000  ! 524: RDPR_GL	rdpr	%-, %r31
	.word 0x8195e168  ! 525: WRPR_TPC_I	wrpr	%r23, 0x0168, %tpc
	.word 0xfc4521e2  ! 527: LDSW_I	ldsw	[%r20 + 0x01e2], %r30
	.word 0xf654a013  ! 531: LDSH_I	ldsh	[%r18 + 0x0013], %r27
	.word 0xfe554000  ! 533: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb3643801  ! 534: MOVcc_I	<illegal instruction>
	.word 0x9194e10c  ! 535: WRPR_PIL_I	wrpr	%r19, 0x010c, %pil
	.word 0xba25c000  ! 536: SUB_R	sub 	%r23, %r0, %r29
	.word 0xbd51c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xf445e11f  ! 539: LDSW_I	ldsw	[%r23 + 0x011f], %r26
	.word 0xf20cc000  ! 542: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xf204c000  ! 543: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf64cc000  ! 544: LDSB_R	ldsb	[%r19 + %r0], %r27
	setx	data_start_5, %g1, %r21
	.word 0xb3540000  ! 550: RDPR_GL	<illegal instruction>
	.word 0xb2bc2047  ! 555: XNORcc_I	xnorcc 	%r16, 0x0047, %r25
	.word 0xf205608b  ! 556: LDUW_I	lduw	[%r21 + 0x008b], %r25
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c2121  ! 560: LDSB_I	ldsb	[%r16 + 0x0121], %r30
	.word 0xfd1c218a  ! 563: LDDF_I	ldd	[%r16, 0x018a], %f30
	.word 0xb4b40000  ! 565: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xb685610a  ! 567: ADDcc_I	addcc 	%r21, 0x010a, %r27
	.word 0xfc5c4000  ! 569: LDX_R	ldx	[%r17 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 570: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xf8050000  ! 575: LDUW_R	lduw	[%r20 + %r0], %r28
	mov	0, %r12
	.word 0x8f930000  ! 576: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6556048  ! 583: LDSH_I	ldsh	[%r21 + 0x0048], %r27
	.word 0xf605a1f5  ! 584: LDUW_I	lduw	[%r22 + 0x01f5], %r27
	.word 0xb645200a  ! 585: ADDC_I	addc 	%r20, 0x000a, %r27
	.word 0xb5500000  ! 588: RDPR_TPC	<illegal instruction>
	.word 0xf80d60a2  ! 589: LDUB_I	ldub	[%r21 + 0x00a2], %r28
	.word 0xf2156055  ! 591: LDUH_I	lduh	[%r21 + 0x0055], %r25
	.word 0xf64dc000  ! 592: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf015a129  ! 595: LDUH_I	lduh	[%r22 + 0x0129], %r24
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24204c  ! 598: SUB_I	sub 	%r16, 0x004c, %r31
	.word 0xf60421ac  ! 600: LDUW_I	lduw	[%r16 + 0x01ac], %r27
	.word 0xfa044000  ! 601: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xb9508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xfa4c8000  ! 605: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf60d8000  ! 607: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xbea5616e  ! 608: SUBcc_I	subcc 	%r21, 0x016e, %r31
	.word 0xf605e1ad  ! 609: LDUW_I	lduw	[%r23 + 0x01ad], %r27
	.word 0xfe0da18f  ! 610: LDUB_I	ldub	[%r22 + 0x018f], %r31
	.word 0xb5518000  ! 611: RDPR_PSTATE	<illegal instruction>
	.word 0xfc1c8000  ! 613: LDD_R	ldd	[%r18 + %r0], %r30
	.word 0xf84c0000  ! 614: LDSB_R	ldsb	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb97d2401  ! 617: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb81c20a5  ! 618: XOR_I	xor 	%r16, 0x00a5, %r28
	.word 0xfe448000  ! 620: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf445a18f  ! 628: LDSW_I	ldsw	[%r22 + 0x018f], %r26
	.word 0xbeb4210f  ! 637: ORNcc_I	orncc 	%r16, 0x010f, %r31
	.word 0xf45dc000  ! 640: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf605a06e  ! 643: LDUW_I	lduw	[%r22 + 0x006e], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf81c617f  ! 648: LDD_I	ldd	[%r17 + 0x017f], %r28
	.word 0x83942144  ! 650: WRPR_TNPC_I	wrpr	%r16, 0x0144, %tnpc
	.word 0xfe4d6036  ! 653: LDSB_I	ldsb	[%r21 + 0x0036], %r31
	.word 0xfc45e07c  ! 655: LDSW_I	ldsw	[%r23 + 0x007c], %r30
	.word 0xbf3c0000  ! 656: SRA_R	sra 	%r16, %r0, %r31
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55202c  ! 666: LDSH_I	ldsh	[%r20 + 0x002c], %r30
	.word 0xb1504000  ! 668: RDPR_TNPC	<illegal instruction>
	.word 0xb7540000  ! 674: RDPR_GL	<illegal instruction>
	.word 0xbab5e0b0  ! 676: ORNcc_I	orncc 	%r23, 0x00b0, %r29
	.word 0xf4040000  ! 682: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xbb508000  ! 685: RDPR_TSTATE	<illegal instruction>
	.word 0xfd1c0000  ! 686: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xbf480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf20d604a  ! 692: LDUB_I	ldub	[%r21 + 0x004a], %r25
	.word 0xf40d0000  ! 694: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf6054000  ! 695: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0x9195e13d  ! 697: WRPR_PIL_I	wrpr	%r23, 0x013d, %pil
	.word 0xfb1de0e4  ! 703: LDDF_I	ldd	[%r23, 0x00e4], %f29
	setx	0xe5b8f35b00007a4c, %g1, %r10
	.word 0x819a8000  ! 706: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9520000  ! 711: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf65ce034  ! 716: LDX_I	ldx	[%r19 + 0x0034], %r27
	.word 0xf2152173  ! 717: LDUH_I	lduh	[%r20 + 0x0173], %r25
	.word 0xf614e095  ! 720: LDUH_I	lduh	[%r19 + 0x0095], %r27
	.word 0xf11dc000  ! 721: LDDF_R	ldd	[%r23, %r0], %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf500000  ! 726: RDPR_TPC	<illegal instruction>
	.word 0x85952039  ! 727: WRPR_TSTATE_I	wrpr	%r20, 0x0039, %tstate
	.word 0xfc1d0000  ! 732: LDD_R	ldd	[%r20 + %r0], %r30
	setx	data_start_4, %g1, %r17
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81c61da  ! 740: LDD_I	ldd	[%r17 + 0x01da], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe54c000  ! 743: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf45c6088  ! 748: LDX_I	ldx	[%r17 + 0x0088], %r26
	.word 0xf01d8000  ! 752: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xb7480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbb641800  ! 760: MOVcc_R	<illegal instruction>
	.word 0xf6544000  ! 761: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf405e09b  ! 763: LDUW_I	lduw	[%r23 + 0x009b], %r26
	.word 0xfe544000  ! 765: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xb3540000  ! 767: RDPR_GL	<illegal instruction>
	.word 0xfe4da12e  ! 770: LDSB_I	ldsb	[%r22 + 0x012e], %r31
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04a15b  ! 773: LDUW_I	lduw	[%r18 + 0x015b], %r31
	.word 0x85946019  ! 775: WRPR_TSTATE_I	wrpr	%r17, 0x0019, %tstate
	.word 0xb950c000  ! 778: RDPR_TT	rdpr	%tt, %r28
	.word 0xfc044000  ! 779: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf65d0000  ! 785: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf11c211f  ! 788: LDDF_I	ldd	[%r16, 0x011f], %f24
	.word 0xfc058000  ! 792: LDUW_R	lduw	[%r22 + %r0], %r30
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 801: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8794e1ad  ! 804: WRPR_TT_I	wrpr	%r19, 0x01ad, %tt
	.word 0xf85d219e  ! 806: LDX_I	ldx	[%r20 + 0x019e], %r28
	.word 0xf205a187  ! 810: LDUW_I	lduw	[%r22 + 0x0187], %r25
	setx	data_start_5, %g1, %r23
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 815: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb1540000  ! 816: RDPR_GL	<illegal instruction>
	.word 0xf80d20f9  ! 818: LDUB_I	ldub	[%r20 + 0x00f9], %r28
	.word 0xfb1c6006  ! 819: LDDF_I	ldd	[%r17, 0x0006], %f29
	.word 0xb7508000  ! 821: RDPR_TSTATE	<illegal instruction>
	.word 0xfc1cc000  ! 822: LDD_R	ldd	[%r19 + %r0], %r30
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xfa558000  ! 831: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb7518000  ! 832: RDPR_PSTATE	<illegal instruction>
	.word 0xbb480000  ! 839: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbab5c000  ! 840: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xb6a4a0ee  ! 850: SUBcc_I	subcc 	%r18, 0x00ee, %r27
	.word 0xf45d21ca  ! 851: LDX_I	ldx	[%r20 + 0x01ca], %r26
	.word 0xf85da1ae  ! 861: LDX_I	ldx	[%r22 + 0x01ae], %r28
	.word 0x8d95e0ad  ! 863: WRPR_PSTATE_I	wrpr	%r23, 0x00ad, %pstate
	.word 0x919561a2  ! 866: WRPR_PIL_I	wrpr	%r21, 0x01a2, %pil
	.word 0xf4046002  ! 868: LDUW_I	lduw	[%r17 + 0x0002], %r26
	.word 0xb1540000  ! 869: RDPR_GL	<illegal instruction>
	.word 0xfe1de144  ! 870: LDD_I	ldd	[%r23 + 0x0144], %r31
	.word 0x8d94a1b6  ! 871: WRPR_PSTATE_I	wrpr	%r18, 0x01b6, %pstate
	.word 0xbc8cc000  ! 872: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0xb751c000  ! 874: RDPR_TL	rdpr	%tl, %r27
	.word 0xf04de090  ! 876: LDSB_I	ldsb	[%r23 + 0x0090], %r24
	.word 0xf04d0000  ! 877: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0x8195a012  ! 882: WRPR_TPC_I	wrpr	%r22, 0x0012, %tpc
	.word 0xb43d4000  ! 886: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xfe0d6191  ! 888: LDUB_I	ldub	[%r21 + 0x0191], %r31
	setx	data_start_1, %g1, %r17
	.word 0xfa4c6002  ! 894: LDSB_I	ldsb	[%r17 + 0x0002], %r29
	mov	2, %r12
	.word 0x8f930000  ! 895: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xff1c4000  ! 896: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf4444000  ! 898: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfc4da10a  ! 901: LDSB_I	ldsb	[%r22 + 0x010a], %r30
	.word 0xf405e000  ! 902: LDUW_I	lduw	[%r23 + 0x0000], %r26
	.word 0xff1d0000  ! 910: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf0044000  ! 914: LDUW_R	lduw	[%r17 + %r0], %r24
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ca0d0  ! 916: LDSB_I	ldsb	[%r18 + 0x00d0], %r25
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21de032  ! 924: LDD_I	ldd	[%r23 + 0x0032], %r25
	.word 0xf05c8000  ! 929: LDX_R	ldx	[%r18 + %r0], %r24
	setx	0x6ddfe7dd0000f9cc, %g1, %r10
	.word 0x839a8000  ! 931: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbaa4607f  ! 932: SUBcc_I	subcc 	%r17, 0x007f, %r29
	.word 0xf4454000  ! 935: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xb9540000  ! 948: RDPR_GL	<illegal instruction>
	.word 0xb5500000  ! 949: RDPR_TPC	<illegal instruction>
	.word 0xb5480000  ! 952: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbd480000  ! 955: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb551c000  ! 959: RDPR_TL	<illegal instruction>
	.word 0xf21c4000  ! 962: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xf11d616e  ! 963: LDDF_I	ldd	[%r21, 0x016e], %f24
	mov	0, %r12
	.word 0x8f930000  ! 964: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899460e8  ! 974: WRPR_TICK_I	wrpr	%r17, 0x00e8, %tick
	.word 0x91952137  ! 978: WRPR_PIL_I	wrpr	%r20, 0x0137, %pil
	.word 0xb5500000  ! 979: RDPR_TPC	<illegal instruction>
	.word 0xf05420aa  ! 980: LDSH_I	ldsh	[%r16 + 0x00aa], %r24
	.word 0xf71d4000  ! 982: LDDF_R	ldd	[%r21, %r0], %f27
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05e069  ! 994: LDUW_I	lduw	[%r23 + 0x0069], %r31
	.word 0xfc1c61a9  ! 996: LDD_I	ldd	[%r17 + 0x01a9], %r30
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	1, %r12
	.word 0xa1930000  ! 4: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a54940  ! 5: FMULd	fmuld	%f52, %f0, %f28
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 10: FSQRTq	fsqrt	
	.word 0xbba44940  ! 12: FMULd	fmuld	%f48, %f0, %f60
	.word 0xbfa80420  ! 13: FMOVRZ	dis not found

	.word 0xbe1d618c  ! 18: XOR_I	xor 	%r21, 0x018c, %r31
	.word 0x8594a01c  ! 19: WRPR_TSTATE_I	wrpr	%r18, 0x001c, %tstate
	setx	0x93fe252f00008a4c, %g1, %r10
	.word 0x819a8000  ! 21: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb8150000  ! 22: OR_R	or 	%r20, %r0, %r28
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba054000  ! 24: ADD_R	add 	%r21, %r0, %r29
	.word 0xb1a9c820  ! 27: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb23c2105  ! 28: XNOR_I	xnor 	%r16, 0x0105, %r25
	.word 0xb5a48940  ! 29: FMULd	fmuld	%f18, %f0, %f26
	.word 0xbda4c9c0  ! 31: FDIVd	fdivd	%f50, %f0, %f30
	.word 0x8794a16d  ! 33: WRPR_TT_I	wrpr	%r18, 0x016d, %tt
	.word 0x879561ec  ! 36: WRPR_TT_I	wrpr	%r21, 0x01ec, %tt
	.word 0xb17c2401  ! 38: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xb3a4c960  ! 39: FMULq	dis not found

	.word 0xbb2d9000  ! 40: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xbf518000  ! 45: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a94820  ! 46: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3500000  ! 47: RDPR_TPC	<illegal instruction>
	setx	0x3564507400005c57, %g1, %r10
	.word 0x839a8000  ! 51: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a00020  ! 52: FMOVs	fmovs	%f0, %f27
	.word 0xb5a5c920  ! 55: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb3a8c820  ! 57: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfa88820  ! 59: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbb508000  ! 61: RDPR_TSTATE	<illegal instruction>
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 66: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a4c8a0  ! 67: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbe140000  ! 69: OR_R	or 	%r16, %r0, %r31
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 74: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb6350000  ! 75: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb2bd0000  ! 78: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0x8195a1ef  ! 80: WRPR_TPC_I	wrpr	%r22, 0x01ef, %tpc
	.word 0xbfab4820  ! 83: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00020  ! 87: FMOVs	fmovs	%f0, %f28
	.word 0xbda44920  ! 88: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb1510000  ! 90: RDPR_TICK	<illegal instruction>
	.word 0xb3a8c820  ! 92: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x83956183  ! 94: WRPR_TNPC_I	wrpr	%r21, 0x0183, %tnpc
	.word 0xbba589a0  ! 98: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb7518000  ! 99: RDPR_PSTATE	<illegal instruction>
	.word 0xbba81820  ! 102: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8e0  ! 108: FSUBq	dis not found

	.word 0xbdaa8820  ! 114: FMOVG	fmovs	%fcc1, %f0, %f30
	setx	0x2d261b0200000e53, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 127: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00540  ! 131: FSQRTd	fsqrt	
	setx	0x66a270d20000fdc2, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x899461fe  ! 133: WRPR_TICK_I	wrpr	%r17, 0x01fe, %tick
	.word 0xbfa80c20  ! 134: FMOVRLZ	dis not found

	.word 0xb1a00020  ! 141: FMOVs	fmovs	%f0, %f24
	.word 0xb5508000  ! 142: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x839521a1  ! 143: WRPR_TNPC_I	wrpr	%r20, 0x01a1, %tnpc
	setx	0x1743bebc0000c896, %g1, %r10
	.word 0x819a8000  ! 147: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba40860  ! 150: FADDq	dis not found

	.word 0xbba40940  ! 152: FMULd	fmuld	%f16, %f0, %f60
	.word 0xbba4c9e0  ! 153: FDIVq	dis not found

	.word 0x8d95a1fa  ! 154: WRPR_PSTATE_I	wrpr	%r22, 0x01fa, %pstate
	.word 0xb7a9c820  ! 155: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbda00040  ! 156: FMOVd	fmovd	%f0, %f30
	.word 0x899461e0  ! 163: WRPR_TICK_I	wrpr	%r17, 0x01e0, %tick
	.word 0x8994a0e2  ! 167: WRPR_TICK_I	wrpr	%r18, 0x00e2, %tick
	.word 0xbba448c0  ! 168: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbbaa8820  ! 171: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x8594217a  ! 172: WRPR_TSTATE_I	wrpr	%r16, 0x017a, %tstate
	.word 0xbfa4c8c0  ! 173: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbfa00540  ! 174: FSQRTd	fsqrt	
	.word 0x8595a1df  ! 177: WRPR_TSTATE_I	wrpr	%r22, 0x01df, %tstate
	.word 0x9194205d  ! 178: WRPR_PIL_I	wrpr	%r16, 0x005d, %pil
	mov	0, %r12
	.word 0x8f930000  ! 180: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x87952127  ! 181: WRPR_TT_I	wrpr	%r20, 0x0127, %tt
	.word 0x8595608c  ! 185: WRPR_TSTATE_I	wrpr	%r21, 0x008c, %tstate
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9521ea  ! 189: WRPR_PSTATE_I	wrpr	%r20, 0x01ea, %pstate
	.word 0x9194216f  ! 193: WRPR_PIL_I	wrpr	%r16, 0x016f, %pil
	.word 0xb7a00540  ! 194: FSQRTd	fsqrt	
	.word 0xbda80820  ! 196: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb9a81820  ! 204: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	setx	0xd0979a4200008f13, %g1, %r10
	.word 0x819a8000  ! 205: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a58840  ! 206: FADDd	faddd	%f22, %f0, %f56
	.word 0xbda84820  ! 208: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a408a0  ! 210: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb9510000  ! 211: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 212: RDPR_TL	<illegal instruction>
	.word 0xbbabc820  ! 215: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb151c000  ! 217: RDPR_TL	<illegal instruction>
	.word 0xb7a81420  ! 218: FMOVRNZ	dis not found

	.word 0xb9510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0x8394a147  ! 233: WRPR_TNPC_I	wrpr	%r18, 0x0147, %tnpc
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488e0  ! 239: FSUBq	dis not found

	.word 0x89942160  ! 243: WRPR_TICK_I	wrpr	%r16, 0x0160, %tick
	setx	data_start_4, %g1, %r16
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c840  ! 248: FADDd	faddd	%f54, %f0, %f56
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9c0  ! 258: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb5aa8820  ! 263: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a44820  ! 264: FADDs	fadds	%f17, %f0, %f27
	.word 0xb351c000  ! 273: RDPR_TL	<illegal instruction>
	.word 0xbf518000  ! 274: RDPR_PSTATE	<illegal instruction>
	.word 0xbba00520  ! 279: FSQRTs	fsqrt	
	.word 0xbdab0820  ! 280: FMOVGU	fmovs	%fcc1, %f0, %f30
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	setx	0x4b4c65d00009bda, %g1, %r10
	.word 0x819a8000  ! 284: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x87942108  ! 286: WRPR_TT_I	wrpr	%r16, 0x0108, %tt
	.word 0x899461b2  ! 287: WRPR_TICK_I	wrpr	%r17, 0x01b2, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfabc820  ! 294: FMOVVC	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0xa1930000  ! 296: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a54860  ! 297: FADDq	dis not found

	.word 0xbba5c860  ! 298: FADDq	dis not found

	.word 0xb3a488e0  ! 303: FSUBq	dis not found

	.word 0xbfa81c20  ! 304: FMOVRGEZ	dis not found

	.word 0xb9520000  ! 305: RDPR_PIL	<illegal instruction>
	.word 0xbfaa8820  ! 306: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb2850000  ! 309: ADDcc_R	addcc 	%r20, %r0, %r25
	.word 0xb5a80820  ! 310: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	setx	data_start_3, %g1, %r20
	.word 0xb9a00540  ! 312: FSQRTd	fsqrt	
	.word 0xb9a44960  ! 316: FMULq	dis not found

	setx	data_start_2, %g1, %r21
	.word 0x8794a178  ! 319: WRPR_TT_I	wrpr	%r18, 0x0178, %tt
	.word 0xb5a81820  ! 321: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbda408e0  ! 323: FSUBq	dis not found

	.word 0xbfa48960  ! 325: FMULq	dis not found

	.word 0xb5a81820  ! 326: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbec4603a  ! 327: ADDCcc_I	addccc 	%r17, 0x003a, %r31
	.word 0xb5508000  ! 328: RDPR_TSTATE	<illegal instruction>
	.word 0xbfab8820  ! 329: FMOVPOS	fmovs	%fcc1, %f0, %f31
	setx	0x8c32d8c40000bc55, %g1, %r10
	.word 0x839a8000  ! 336: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a508c0  ! 337: FSUBd	fsubd	%f20, %f0, %f24
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35c000  ! 343: SRL_R	srl 	%r23, %r0, %r29
	.word 0xb3ab8820  ! 344: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a9c820  ! 346: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48960  ! 348: FMULq	dis not found

	.word 0xb3a588e0  ! 349: FSUBq	dis not found

	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 352: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb03d8000  ! 355: XNOR_R	xnor 	%r22, %r0, %r24
	.word 0xb1a508a0  ! 356: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb7a588e0  ! 357: FSUBq	dis not found

	.word 0xb1a589e0  ! 362: FDIVq	dis not found

	.word 0xb3a88820  ! 363: FMOVLE	fmovs	%fcc1, %f0, %f25
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 368: FMOVNE	fmovs	%fcc1, %f0, %f30
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e1b6  ! 372: WRPR_TSTATE_I	wrpr	%r19, 0x01b6, %tstate
	.word 0xbba81c20  ! 375: FMOVRGEZ	dis not found

	.word 0xb3a00040  ! 376: FMOVd	fmovd	%f0, %f56
	.word 0xbb540000  ! 381: RDPR_GL	<illegal instruction>
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 383: FADDd	faddd	%f18, %f0, %f28
	.word 0xb3a5c9c0  ! 385: FDIVd	fdivd	%f54, %f0, %f56
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 387: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb550c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xb9a00020  ! 389: FMOVs	fmovs	%f0, %f28
	.word 0x8795e052  ! 390: WRPR_TT_I	wrpr	%r23, 0x0052, %tt
	.word 0xb814a198  ! 392: OR_I	or 	%r18, 0x0198, %r28
	.word 0x8595a132  ! 394: WRPR_TSTATE_I	wrpr	%r22, 0x0132, %tstate
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 402: FSQRTq	fsqrt	
	setx	data_start_2, %g1, %r17
	.word 0xbc8d4000  ! 409: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xb9a81c20  ! 414: FMOVRGEZ	dis not found

	.word 0xbd500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xb9a88820  ! 417: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa4820  ! 418: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbf359000  ! 421: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xbfa408e0  ! 423: FSUBq	dis not found

	.word 0xb5a84820  ! 425: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9510000  ! 426: RDPR_TICK	<illegal instruction>
	.word 0x8394e16a  ! 427: WRPR_TNPC_I	wrpr	%r19, 0x016a, %tnpc
	.word 0xb7a4c840  ! 429: FADDd	faddd	%f50, %f0, %f58
	.word 0xb7abc820  ! 433: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb435e04b  ! 436: SUBC_I	orn 	%r23, 0x004b, %r26
	.word 0xb7a81420  ! 438: FMOVRNZ	dis not found

	.word 0xb7a58820  ! 439: FADDs	fadds	%f22, %f0, %f27
	.word 0xb1a40960  ! 440: FMULq	dis not found

	.word 0x919461e1  ! 442: WRPR_PIL_I	wrpr	%r17, 0x01e1, %pil
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 447: FMOVN	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9195e0a7  ! 451: WRPR_PIL_I	wrpr	%r23, 0x00a7, %pil
	.word 0xbba00560  ! 453: FSQRTq	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 454: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xbea2a73d00003b43, %g1, %r10
	.word 0x819a8000  ! 455: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a9c820  ! 460: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81420  ! 467: FMOVRNZ	dis not found

	.word 0xb1ab0820  ! 471: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab8820  ! 472: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00040  ! 475: FMOVd	fmovd	%f0, %f26
	.word 0xb535a001  ! 476: SRL_I	srl 	%r22, 0x0001, %r26
	.word 0xb7a58920  ! 479: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbab50000  ! 485: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xb3aa0820  ! 488: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb1abc820  ! 492: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0x839521da  ! 496: WRPR_TNPC_I	wrpr	%r20, 0x01da, %tnpc
	.word 0xb7aa4820  ! 499: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8d956066  ! 501: WRPR_PSTATE_I	wrpr	%r21, 0x0066, %pstate
	.word 0xb1a81c20  ! 504: FMOVRGEZ	dis not found

	.word 0xb3a88820  ! 508: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbc2ca146  ! 511: ANDN_I	andn 	%r18, 0x0146, %r30
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 517: FMOVRGEZ	dis not found

	.word 0xbbab4820  ! 518: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba90820  ! 519: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbbab8820  ! 520: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7540000  ! 524: RDPR_GL	rdpr	%-, %r27
	.word 0x8194207d  ! 525: WRPR_TPC_I	wrpr	%r16, 0x007d, %tpc
	.word 0xb1abc820  ! 526: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb7643801  ! 534: MOVcc_I	<illegal instruction>
	.word 0x919560cc  ! 535: WRPR_PIL_I	wrpr	%r21, 0x00cc, %pil
	.word 0xb424c000  ! 536: SUB_R	sub 	%r19, %r0, %r26
	.word 0xbf51c000  ! 537: RDPR_TL	<illegal instruction>
	.word 0xb1a50840  ! 538: FADDd	faddd	%f20, %f0, %f24
	.word 0xb9a98820  ! 545: FMOVNEG	fmovs	%fcc1, %f0, %f28
	setx	data_start_0, %g1, %r19
	.word 0xb9a40920  ! 548: FMULs	fmuls	%f16, %f0, %f28
	.word 0xbf540000  ! 550: RDPR_GL	<illegal instruction>
	.word 0xb6bc61ae  ! 555: XNORcc_I	xnorcc 	%r17, 0x01ae, %r27
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 561: FMOVRGEZ	dis not found

	.word 0xb9a588e0  ! 564: FSUBq	dis not found

	.word 0xb4b58000  ! 565: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xba85e15e  ! 567: ADDcc_I	addcc 	%r23, 0x015e, %r29
	.word 0xb5a81820  ! 568: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	mov	1, %r12
	.word 0x8f930000  ! 570: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 572: FMOVG	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r21
	.word 0xbba84820  ! 574: FMOVE	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 576: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb445216d  ! 585: ADDC_I	addc 	%r20, 0x016d, %r26
	.word 0xb1500000  ! 588: RDPR_TPC	<illegal instruction>
	.word 0xb3a81420  ! 593: FMOVRNZ	dis not found

	.word 0xb9aa4820  ! 596: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424e0f7  ! 598: SUB_I	sub 	%r19, 0x00f7, %r26
	.word 0xb1508000  ! 602: RDPR_TSTATE	<illegal instruction>
	.word 0xbba48840  ! 603: FADDd	faddd	%f18, %f0, %f60
	.word 0xbea5a08e  ! 608: SUBcc_I	subcc 	%r22, 0x008e, %r31
	.word 0xb3518000  ! 611: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a549e0  ! 612: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb97d6401  ! 617: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xba1ce0ff  ! 618: XOR_I	xor 	%r19, 0x00ff, %r29
	.word 0xbfa4c9c0  ! 624: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbfa40920  ! 625: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb5a4c8e0  ! 634: FSUBq	dis not found

	.word 0xbcb4e1bc  ! 637: ORNcc_I	orncc 	%r19, 0x01bc, %r30
	.word 0xbda80820  ! 639: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb1a588e0  ! 645: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8394a13c  ! 650: WRPR_TNPC_I	wrpr	%r18, 0x013c, %tnpc
	.word 0xb9a48960  ! 651: FMULq	dis not found

	.word 0xb93d4000  ! 656: SRA_R	sra 	%r21, %r0, %r28
	.word 0xb1a4c8a0  ! 658: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbda488a0  ! 659: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb1a00020  ! 660: FMOVs	fmovs	%f0, %f24
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 664: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbd504000  ! 668: RDPR_TNPC	<illegal instruction>
	.word 0xb5aa0820  ! 673: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbb540000  ! 674: RDPR_GL	<illegal instruction>
	.word 0xb2b5208d  ! 676: ORNcc_I	orncc 	%r20, 0x008d, %r25
	.word 0xb7ab0820  ! 679: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a54940  ! 680: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb5aa8820  ! 684: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3508000  ! 685: RDPR_TSTATE	<illegal instruction>
	.word 0xbda508e0  ! 688: FSUBq	dis not found

	.word 0xb3480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbda549a0  ! 696: FDIVs	fdivs	%f21, %f0, %f30
	.word 0x9194e09d  ! 697: WRPR_PIL_I	wrpr	%r19, 0x009d, %pil
	.word 0xb3a00560  ! 699: FSQRTq	fsqrt	
	.word 0xb9ab0820  ! 701: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81c20  ! 705: FMOVRGEZ	dis not found

	setx	0x5f76ad8d00000ece, %g1, %r10
	.word 0x819a8000  ! 706: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba589c0  ! 707: FDIVd	fdivd	%f22, %f0, %f60
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb520000  ! 711: RDPR_PIL	<illegal instruction>
	.word 0xb1a94820  ! 713: FMOVCS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c9a0  ! 725: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb9500000  ! 726: RDPR_TPC	<illegal instruction>
	.word 0x859460ae  ! 727: WRPR_TSTATE_I	wrpr	%r17, 0x00ae, %tstate
	.word 0xb7ab0820  ! 731: FMOVGU	fmovs	%fcc1, %f0, %f27
	setx	data_start_2, %g1, %r16
	.word 0xb9ab8820  ! 737: FMOVPOS	fmovs	%fcc1, %f0, %f28
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 739: FMOVGE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c840  ! 742: FADDd	faddd	%f50, %f0, %f58
	.word 0xb7480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7a48920  ! 756: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb9641800  ! 760: MOVcc_R	<illegal instruction>
	.word 0xbfa81c20  ! 764: FMOVRGEZ	dis not found

	.word 0xb1540000  ! 767: RDPR_GL	<illegal instruction>
	.word 0xb5a54860  ! 768: FADDq	dis not found

	.word 0xbda449e0  ! 769: FDIVq	dis not found

	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859460e5  ! 775: WRPR_TSTATE_I	wrpr	%r17, 0x00e5, %tstate
	.word 0xb950c000  ! 778: RDPR_TT	<illegal instruction>
	.word 0xb1a4c820  ! 781: FADDs	fadds	%f19, %f0, %f24
	.word 0xb5a40840  ! 782: FADDd	faddd	%f16, %f0, %f26
	.word 0xb5a408e0  ! 784: FSUBq	dis not found

	.word 0xb9a84820  ! 786: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a4c920  ! 789: FMULs	fmuls	%f19, %f0, %f25
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448c0  ! 796: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbba81c20  ! 797: FMOVRGEZ	dis not found

	.word 0xb5a81420  ! 798: FMOVRNZ	dis not found

	mov	2, %r12
	.word 0x8f930000  ! 801: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda44860  ! 802: FADDq	dis not found

	.word 0x87952184  ! 804: WRPR_TT_I	wrpr	%r20, 0x0184, %tt
	.word 0xbfab8820  ! 805: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbda00520  ! 809: FSQRTs	fsqrt	
	setx	data_start_0, %g1, %r21
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 815: RDPR_TPC	<illegal instruction>
	.word 0xb5540000  ! 816: RDPR_GL	<illegal instruction>
	.word 0xb7508000  ! 821: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a81420  ! 825: FMOVRNZ	dis not found

	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xb9a549c0  ! 830: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb3518000  ! 832: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a81420  ! 835: FMOVRNZ	dis not found

	.word 0xb3a00560  ! 838: FSQRTq	fsqrt	
	.word 0xb7480000  ! 839: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbab4c000  ! 840: ORNcc_R	orncc 	%r19, %r0, %r29
	.word 0xbfa548a0  ! 843: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb5a81c20  ! 846: FMOVRGEZ	dis not found

	.word 0xbaa4e13e  ! 850: SUBcc_I	subcc 	%r19, 0x013e, %r29
	.word 0xbbabc820  ! 853: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a48940  ! 857: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb1a00040  ! 858: FMOVd	fmovd	%f0, %f24
	.word 0xb3a589a0  ! 859: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xb7a00540  ! 860: FSQRTd	fsqrt	
	.word 0x8d94e0fa  ! 863: WRPR_PSTATE_I	wrpr	%r19, 0x00fa, %pstate
	.word 0x9195615c  ! 866: WRPR_PIL_I	wrpr	%r21, 0x015c, %pil
	.word 0xb9aa4820  ! 867: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1540000  ! 869: RDPR_GL	<illegal instruction>
	.word 0x8d95a1e5  ! 871: WRPR_PSTATE_I	wrpr	%r22, 0x01e5, %pstate
	.word 0xb88c8000  ! 872: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xb151c000  ! 874: RDPR_TL	<illegal instruction>
	.word 0xbda509a0  ! 875: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb7a81420  ! 881: FMOVRNZ	dis not found

	.word 0x8194e0f1  ! 882: WRPR_TPC_I	wrpr	%r19, 0x00f1, %tpc
	.word 0xbda88820  ! 884: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbc3d0000  ! 886: XNOR_R	xnor 	%r20, %r0, %r30
	.word 0xb7ab0820  ! 887: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbba50960  ! 889: FMULq	dis not found

	.word 0xbfa00520  ! 890: FSQRTs	fsqrt	
	.word 0xbfa00540  ! 892: FSQRTd	fsqrt	
	setx	data_start_6, %g1, %r18
	mov	2, %r12
	.word 0x8f930000  ! 895: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbaa0820  ! 899: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a5c840  ! 903: FADDd	faddd	%f54, %f0, %f56
	.word 0xbba80820  ! 906: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80c20  ! 912: FMOVRLZ	dis not found

	.word 0xbbabc820  ! 913: FMOVVC	fmovs	%fcc1, %f0, %f29
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a489a0  ! 917: FDIVs	fdivs	%f18, %f0, %f26
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 926: FMOVRZ	dis not found

	setx	0xdc7c7fc400009f85, %g1, %r10
	.word 0x839a8000  ! 931: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0a5210e  ! 932: SUBcc_I	subcc 	%r20, 0x010e, %r24
	.word 0xb9a81420  ! 933: FMOVRNZ	dis not found

	.word 0xb1a98820  ! 937: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a48840  ! 939: FADDd	faddd	%f18, %f0, %f26
	.word 0xb3a4c9a0  ! 946: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb1a00540  ! 947: FSQRTd	fsqrt	
	.word 0xbd540000  ! 948: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 949: RDPR_TPC	<illegal instruction>
	.word 0xbba9c820  ! 950: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbf480000  ! 952: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbf480000  ! 955: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd51c000  ! 959: RDPR_TL	<illegal instruction>
	.word 0xb7a00540  ! 960: FSQRTd	fsqrt	
	.word 0xbfa88820  ! 961: FMOVLE	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0x8f930000  ! 964: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a80820  ! 969: FMOVN	fmovs	%fcc1, %f0, %f24
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a589e0  ! 971: FDIVq	dis not found

	.word 0xbba80820  ! 973: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0x8994a176  ! 974: WRPR_TICK_I	wrpr	%r18, 0x0176, %tick
	.word 0xb9a98820  ! 976: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0x9195e169  ! 978: WRPR_PIL_I	wrpr	%r23, 0x0169, %pil
	.word 0xb9500000  ! 979: RDPR_TPC	<illegal instruction>
	.word 0xbbab0820  ! 985: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7ab4820  ! 986: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00040  ! 987: FMOVd	fmovd	%f0, %f28
	.word 0xb7ab8820  ! 991: FMOVPOS	fmovs	%fcc1, %f0, %f27
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58860  ! 997: FADDq	dis not found


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

	.xword	0xb4ba80d53497bcca
	.xword	0xb4e2c32e4a66be63
	.xword	0xb0d976019177caf5
	.xword	0xe13bc1b728807aea
	.xword	0xe0ae3e40d49a5af5
	.xword	0xe0663fff2e4b3006
	.xword	0x4751e02387234d50
	.xword	0xa59573251531b79a
	.xword	0x97c70f5260b058d6
	.xword	0x0a22527855cf828a
	.xword	0x561da75553a40d9b
	.xword	0x93abb3712d3b5ed0
	.xword	0x32f1705db4fbe1b6
	.xword	0x0693700532be38d9
	.xword	0xe1158f7c6a54e74b
	.xword	0x8bced32905bd8360
	.xword	0x0eacbfe3beaf0756
	.xword	0x9c25142625792991
	.xword	0xea331900305856f8
	.xword	0xeb969a5b84a9c655
	.xword	0x3adda10517b27aab
	.xword	0xcfda3987f0e08e8f
	.xword	0x953419ce9e1ca764
	.xword	0xd4b7243be164edea
	.xword	0x404a6c264cd52169
	.xword	0x742045f0cb49389d
	.xword	0xaf9652394c501d97
	.xword	0x8911420ce1661ef2
	.xword	0x553af24d3b77977d
	.xword	0x6450c64a59e47d06
	.xword	0x3112d94a23d3395f
	.xword	0x7669016030b01480
	.xword	0xfb77a4e1fca4f6a3
	.xword	0x6a80270b323a11fe
	.xword	0x7c1d1914822a84c1
	.xword	0x5d9a6ec31c578940
	.xword	0x0ac6444e9c4965c1
	.xword	0xa46ecc9110732d98
	.xword	0x14935c570ba8afc9
	.xword	0x5120ce119dab0900
	.xword	0x9034c9d34c125be3
	.xword	0x68d909b0181f0400
	.xword	0xd640af80f52da2de
	.xword	0x57f30d6b60670020
	.xword	0x567ef3ec63db1424
	.xword	0x4cae52f9b2e75695
	.xword	0x281404beb60e666b
	.xword	0x32e20bd58683ca0d
	.xword	0xc93cb14d9281580f
	.xword	0xd8fbfbddc91a5f13
	.xword	0x5596f134037236a1
	.xword	0x7ea1338213883679
	.xword	0x2f424d69614af185
	.xword	0x13faa8985e9f22ce
	.xword	0x10697ef87cb6e3ba
	.xword	0x8cb6bf84a4fb7004
	.xword	0x35e02d63014d033e
	.xword	0x2239e594914ed29b
	.xword	0x5def8e75898689c1
	.xword	0x5c122219a5266ccc
	.xword	0x23b4a35e8849055d
	.xword	0x02ae5a1c15590b87
	.xword	0x32639a3ce4fcf258
	.xword	0x18de7dcfc1ba5ff7
	.xword	0xa0e333d8b1a24a85
	.xword	0x23edafe7dfdbf2f6
	.xword	0x8a0fe305d4a022bc
	.xword	0xcca429483422b063
	.xword	0x3cb0de4c0e2fc865
	.xword	0x9737d7bd576432ec
	.xword	0x2fc4789dccbb7e12
	.xword	0x4db905bb337186b6
	.xword	0x85041eb54638ad78
	.xword	0x2e0e93f9dabcdd64
	.xword	0x193d312a9c5f8257
	.xword	0xc5fa7c07595fa812
	.xword	0xb02b4d50d6836d71
	.xword	0xdacd6bb8ac992716
	.xword	0x5981a786fd6e7fd0
	.xword	0x8399292cde6fd359
	.xword	0x98af2434cb149490
	.xword	0x35fd30fd05a89079
	.xword	0x1d9bdc15506daa91
	.xword	0x74f3e810a74e8d27
	.xword	0xab473ade12186b7f
	.xword	0xebe5907d1b403576
	.xword	0x6aa5e61dd279979a
	.xword	0x490b7c20d06f5ed4
	.xword	0xc220c1615f8ae77c
	.xword	0xf0854d066888b9cc
	.xword	0x02cd2f8ca3155362
	.xword	0x6b828ac321d29105
	.xword	0xb6c6b5b8a85d64a7
	.xword	0x9165e4593ddbe485
	.xword	0x581b52ec1e982914
	.xword	0x58ab885ef0fe84cd
	.xword	0xc9bf1c169b031dcd
	.xword	0x1297e2ff4a6e2797
	.xword	0xf631300cb2c6da05
	.xword	0x5418ebb7e9af042b
	.xword	0xa6e806c55f05a3e0
	.xword	0x4089c901caa660da
	.xword	0xc699edd1068601f9
	.xword	0x55eae5e5701102f1
	.xword	0x11a523cf68e40fd9
	.xword	0xad0f01a26193ea3c
	.xword	0xb93be03e01bccb64
	.xword	0xbd11d97d37760528
	.xword	0x1a26de4f9e2edd83
	.xword	0x9a4c8d8ff03e4e94
	.xword	0xf30276034a109f97
	.xword	0xd8b7db3c5b5ba645
	.xword	0xd77e7fe7c862c5e4
	.xword	0x3712c0de421b64ca
	.xword	0x4a4a58b900cfdc49
	.xword	0x8d65c0b84a6b3e21
	.xword	0x7199f35554fd273e
	.xword	0xde0712ef2d18d8a6
	.xword	0x4c7df29024b78ce8
	.xword	0xb7836b6cc75602a8
	.xword	0xe90c73d1d858fe4b
	.xword	0x0077e50b6d4c14cc
	.xword	0xe8a020a4880db562
	.xword	0x12a6c283868f78cc
	.xword	0x1e3fbdb42a7d2d60
	.xword	0x24704a0d12e93b92
	.xword	0x239e999ded4a8360
	.xword	0x0b07cf9ec96ff7a7
	.xword	0xb8705df0267c3b34
	.xword	0x2c86d8e6e77686a1
	.xword	0x6542da1bddd44066
	.xword	0xa0af80ac28f5035d
	.xword	0x30079678b5c55c86
	.xword	0x473e8a94424dcefc
	.xword	0xba9a974501976de0
	.xword	0x51e038914f5b2d60
	.xword	0x92f09e2c78c75d2b
	.xword	0x3583a5a9558b9ba5
	.xword	0xa905f3664972b14e
	.xword	0xd0ef122ef4b493e7
	.xword	0xe6fe3801ab2982cf
	.xword	0x74faafe852130e69
	.xword	0x4bd6596c9960582f
	.xword	0x567bf003ac53a41f
	.xword	0xfc768679460394aa
	.xword	0x7ea1453ec1c70ac7
	.xword	0xa19b5bab09301800
	.xword	0xded9aa740cf8b6e1
	.xword	0x5359fb30d9c35b60
	.xword	0x805af21ae140ae68
	.xword	0x20819ce5fe5ae6ee
	.xword	0x84cb4133bf851e51
	.xword	0xe1fc6318a80df46f
	.xword	0x95f20b078e9c32c0
	.xword	0x256e6c8c1d8c05b1
	.xword	0x84f7a9ffbb17900b
	.xword	0x80d97801e965b9eb
	.xword	0x40227bb413799cd3
	.xword	0x59b96e92ae023b98
	.xword	0x41f775f7ae9261b7
	.xword	0x0ea87f1785d4bad1
	.xword	0x789f25783f05ed5d
	.xword	0xcab980e82064f27b
	.xword	0xe2fd08d1b94946bb
	.xword	0x2ce18c339317ca3c
	.xword	0xea1170c44bfdb771
	.xword	0x1ebae17bfe5bd424
	.xword	0x9cb982f0c08931f1
	.xword	0x1dab10e2c527533e
	.xword	0x8359b863e37fdbfa
	.xword	0xfc5b876683f434a4
	.xword	0x8a1bbed13e9005c2
	.xword	0xb5b5dbd63e176c46
	.xword	0x8a57492e2ea39a9a
	.xword	0x9c5ec134684cc744
	.xword	0xc20a0ab23dbcaa7d
	.xword	0xb2d29e2d6c3f5fb0
	.xword	0x9ac3d19fcaa24c7e
	.xword	0x13a7d05cc898b3a4
	.xword	0xc9c17e9c95bac76b
	.xword	0x4773015fa5cd6499
	.xword	0x314c9c7d78808a6e
	.xword	0x692ecb84728d8295
	.xword	0x1c19c832c9d7c78f
	.xword	0x58707f8d01490063
	.xword	0xae853298bb44f68b
	.xword	0x63329baccf6a240e
	.xword	0x216740919918257b
	.xword	0x4f19db61605ca48e
	.xword	0x7d1d90efa57e61c6
	.xword	0x704f9fb9dda6e30a
	.xword	0xf9533f2b8d83b002
	.xword	0x2f1643dfb58685e5
	.xword	0xf213e0b10e049982
	.xword	0x3cda294ba352e52b
	.xword	0x8a2a9e613eea29da
	.xword	0x3ea6280be58a4c40
	.xword	0x1c33047e7212d269
	.xword	0x762153eed1f86d80
	.xword	0x6ded73e0003a25a7
	.xword	0x39f1fa39dd65a51b
	.xword	0x8565dcca4e3f0a9c
	.xword	0x616891fffb1c905a
	.xword	0x1ffd742d7f349edd
	.xword	0xf0848e4a5a1a0e3a
	.xword	0xa23f5117872418e6
	.xword	0x83bb98d9c096d125
	.xword	0xa87722a1b56d0fe7
	.xword	0x8041017f26f4f4cd
	.xword	0x372643c3d65fc131
	.xword	0xf8d23b3d90b14a75
	.xword	0x9e3465ebb442e6b3
	.xword	0x30a9aeaf97f4f632
	.xword	0xb94ccd1a172864cf
	.xword	0x208d504fe8ead931
	.xword	0xd6da4d9755be3848
	.xword	0x20b6349335f16a54
	.xword	0x34627ad2d6d0d045
	.xword	0x4e657b76d448c420
	.xword	0x13fc3bf0c08a0a27
	.xword	0x791f5b2a16ca87fc
	.xword	0xfc1f279c64e540f0
	.xword	0xee2c5c84ad7eba31
	.xword	0x61e3f76c5579be49
	.xword	0xbb29310694a53fcc
	.xword	0x4182e6f171fea317
	.xword	0x9534b645f25c9df7
	.xword	0x7e33ea6f5646610a
	.xword	0x6b4c71e04386aa3d
	.xword	0x923d80d4cf570341
	.xword	0x92534e2e2a748cd4
	.xword	0xf1400ed388e53e72
	.xword	0x95cb82f297d84e50
	.xword	0x2be0c40cef290311
	.xword	0x5b9fce38b63edccf
	.xword	0x55cc93bf870bee20
	.xword	0xbdfe7068fd2f3821
	.xword	0xa1e324798187b063
	.xword	0x4647d8d46515b974
	.xword	0xb786db0a93baa40d
	.xword	0x61e9e3e03f8d8299
	.xword	0xf85fc1b60da547e4
	.xword	0xa2c43bab4f39a7e9
	.xword	0xc8cbaa62f2c81c14
	.xword	0x730ff675299ac8a8
	.xword	0xf52ea06e20d90a87
	.xword	0xa66084d5ba564b96
	.xword	0x44bd943e69f383cb
	.xword	0xb950f870c2c20b71
	.xword	0x1284251ec8311e71
	.xword	0x9d3e44d6fd9798fe
	.xword	0x389758b0082e20f4
	.xword	0xc935576a47ca0a6b
	.xword	0xff112dd2ed41032c
	.xword	0xdaa70510b597f114
	.xword	0x2d38ddc01d8aeaa4
	.align 0x2000
	.data
data_start_1:

	.xword	0x5415cfcdde6000e8
	.xword	0xd3ac2413d52d4332
	.xword	0xe27a73c0db1af829
	.xword	0xfb51221a76c46e57
	.xword	0x5fd4b98b6e0ca778
	.xword	0x96822104677cab0b
	.xword	0x6ee394c22ee5a967
	.xword	0x7ebe097a18a8196b
	.xword	0x95bd75f4830f6e8a
	.xword	0xee42a450cec72edc
	.xword	0xbeebfd0153333729
	.xword	0xcc3a8c5139e4fce8
	.xword	0x94d370d8d70fd736
	.xword	0x831b2a1e849499ea
	.xword	0x2b3560f45457ece0
	.xword	0xf5094f3c6917ede6
	.xword	0x20609dfc9b5895ec
	.xword	0x64ff21fb29176f97
	.xword	0x28213dd4e0209e86
	.xword	0xea73ea0ef6ba00c0
	.xword	0x1c92d3d0c2e8d8db
	.xword	0x7dae80aec2451083
	.xword	0x3faf2b8fbb22e324
	.xword	0x3ee4c462e4b325d3
	.xword	0x15d9d82366760e96
	.xword	0xde227e30efd81fb9
	.xword	0xccca04c32aa28bfe
	.xword	0x05cd9cce41442dd2
	.xword	0x8df6956740f16978
	.xword	0x7d85d1b5e69399ee
	.xword	0xf66bbe3c30744c3f
	.xword	0xe577969be1ef41cc
	.xword	0x1daed973312a4fbb
	.xword	0x8a15b2e0349d8107
	.xword	0x21b9f90df230cd2b
	.xword	0x25ba9fd3f9c6ccc9
	.xword	0xae16c5816516bad3
	.xword	0xd4be9a5115d69fbc
	.xword	0x04459f24a49e3500
	.xword	0x4880640bc672aa06
	.xword	0xb7c47f20d6f6d934
	.xword	0x49fad9ce67ad08a4
	.xword	0x375253aa16439174
	.xword	0x648f4a89f3f76664
	.xword	0x6d5e4dd2c7dfb683
	.xword	0x2b2cf048261b1b8b
	.xword	0xe056ab2aa70d325c
	.xword	0xe4c581f1ceeb3d39
	.xword	0xe4ba7ff137302363
	.xword	0x83c1ef9abbba41d3
	.xword	0xa531e3eccd09600a
	.xword	0xebedccb3313e6733
	.xword	0x5c74f51a4a4c3e78
	.xword	0x9a98c548869e145e
	.xword	0x46a4c409eb7dc833
	.xword	0x023d177c6df76744
	.xword	0x2e29b666ce20337f
	.xword	0xda4341814e754d23
	.xword	0x6740ae6910e26985
	.xword	0x783c875fa6d7904d
	.xword	0x754807a9985a8a08
	.xword	0x2cdc7f9af9d543a1
	.xword	0x5fc80d6a27d69f86
	.xword	0xef6e10098de26d24
	.xword	0xad4f2162be566efb
	.xword	0x89583985dd5c4751
	.xword	0xfb124a4129942e36
	.xword	0x0f929761a04bb074
	.xword	0xa9523d794b538db1
	.xword	0xc57125f148939ca5
	.xword	0x489be3dc5952d636
	.xword	0xd6a5c0f524894835
	.xword	0x6d8a44e86e780feb
	.xword	0x2f684613e78e7952
	.xword	0xd64d1e8845cd0011
	.xword	0xd22d32e7de674238
	.xword	0xf34ab26d4baa3760
	.xword	0x367841b52d04d530
	.xword	0xaee3d2539a538d5a
	.xword	0x0cf955f5a6dfa86b
	.xword	0x73a038e9fad85631
	.xword	0x8943dc9e7e33bad3
	.xword	0xd7336f16df686d09
	.xword	0x30b86de6d7dd43c3
	.xword	0xf35cb0332f9c02a1
	.xword	0xd8afe63f09afb65b
	.xword	0xddd94c00368193d4
	.xword	0x64191745158fd944
	.xword	0x3d22f4eb712d07ff
	.xword	0xe052733c8e1f065d
	.xword	0x448ce32011da8797
	.xword	0xf9536a7d64a7aa4d
	.xword	0xbf56940a6806b9a4
	.xword	0x3c724b4fe00358f4
	.xword	0xa5844c42643a98ff
	.xword	0xa0a69f6d5efae84c
	.xword	0xc66133d81825af0a
	.xword	0xecd0ef2b5b041fb6
	.xword	0x309895d9d74f359f
	.xword	0xbfc3950d095deb9b
	.xword	0x5d1d338a7aefbaae
	.xword	0x8d5cf5814280c2a7
	.xword	0x43e1d6e9c057e54a
	.xword	0x1efcf0fcb12ded34
	.xword	0x93b130ba09b17e4f
	.xword	0xcba6eb5a9b6a7aa8
	.xword	0x2135b90de4eb19af
	.xword	0x3c1a50305b8d3144
	.xword	0xb22bec110caa737e
	.xword	0xe910cf863d2f89d8
	.xword	0xf7e4dfd27e08e663
	.xword	0xf7f7b13228907796
	.xword	0x14ddb87d00e6bbdd
	.xword	0x0a62412ebe1ce048
	.xword	0x54889f0a85d2b332
	.xword	0xab44e043dc3c4acb
	.xword	0x639a1242fdfbbfcc
	.xword	0x40b4ab85dd797253
	.xword	0x8df75f6fe8c5e65f
	.xword	0x2d1a5427a8e787e0
	.xword	0xee9f5df349a47ad4
	.xword	0x5c1501a350be0192
	.xword	0xc8dd83a665be9d91
	.xword	0x88fd5c32893dc4cf
	.xword	0x3d1782ce6241668f
	.xword	0x8ec4622744f4d8e1
	.xword	0xa13b60c624cc5ed4
	.xword	0xa26ad2244c1da06f
	.xword	0xc777df0e491b5924
	.xword	0x4f512c3f32d4e66f
	.xword	0x54aeec6dced1e4c7
	.xword	0xf50c1177cc346ec1
	.xword	0xe7cfe922345d3272
	.xword	0xebabb17cb976ce3f
	.xword	0x9c1be597ae69518f
	.xword	0x34d320d79ef802f0
	.xword	0x30e5ffa99f499bb5
	.xword	0xa3989990c58622b5
	.xword	0xb59c60ab1f34ae03
	.xword	0x0a026593b3bc9539
	.xword	0xa039778744441429
	.xword	0x1444ffff09de6c5a
	.xword	0xe704a620b58e047b
	.xword	0x1d2bd04b094032f0
	.xword	0x7c66a07cfe17edea
	.xword	0x13d230e91f95a7ee
	.xword	0x7ef16c0079b249e0
	.xword	0x94813b5c89aec050
	.xword	0x2e23062fdf290841
	.xword	0xd13528c85b46d575
	.xword	0x6b91ad4327e5fcb8
	.xword	0x25cadccc9f384840
	.xword	0x05895bddc1379c33
	.xword	0xe35a7ac0f3fc4acd
	.xword	0xc71df2da4d1f666a
	.xword	0xf2a420b28d982359
	.xword	0x4d7385df0f43d347
	.xword	0xc3aa2d810aeabd36
	.xword	0xd7db444e6499addf
	.xword	0x10351b693db340bd
	.xword	0x0ae2f7f193d283fc
	.xword	0x7c1c9c4237dac29e
	.xword	0x478ddaca03183e53
	.xword	0x765d0ba3fd6edcff
	.xword	0x674ce41cc1cd5d27
	.xword	0xd664792d7aceb50c
	.xword	0xceb3be608db51427
	.xword	0x113bee206c8da061
	.xword	0x3f76b884d77ee9a2
	.xword	0xea4cc1b1f1e2f392
	.xword	0xc8408f297e9627c3
	.xword	0xfaddcb176c9140cd
	.xword	0x319bc6caed5322b6
	.xword	0x44190195e892704c
	.xword	0xbc28e90e1f440425
	.xword	0x0addaf1378feda2a
	.xword	0x339e82a5fda8bb1f
	.xword	0x97a7c8a7f0876fc3
	.xword	0xffb9eeb4cca8fa32
	.xword	0xaab54e03b30cebdf
	.xword	0xd2e46bb96e2fe038
	.xword	0x02fc4a0fe63a84ae
	.xword	0xefe778a0aaa072c2
	.xword	0x5b8aaaeb3ea1e2ab
	.xword	0x233e0e9e0ab7dee8
	.xword	0xfbfffdb4490d35b7
	.xword	0x1f85362c4cd90e5c
	.xword	0xf75dd09550806622
	.xword	0x2580bd6bd34a179d
	.xword	0xdf38ae71bfe167f1
	.xword	0x01d05000be62d191
	.xword	0xad6c5337c4ddd840
	.xword	0x349811cebfd45fdc
	.xword	0xb1323cb6d8b88649
	.xword	0xb2dd3c6924a4576c
	.xword	0x7c9a8cd095291eeb
	.xword	0x9fdffbb21d717003
	.xword	0xae5280e063bff6e0
	.xword	0xc946f4a922c58e6b
	.xword	0x52b56467d9a65d60
	.xword	0x8b769725779f2d2a
	.xword	0xc20c5cc236f8cb6c
	.xword	0xf1e1b51504bf79da
	.xword	0xc0da95ce99dc9c4d
	.xword	0x0e8210ef8137dcd6
	.xword	0x422271048f601fff
	.xword	0xcbb8e96677459c0e
	.xword	0x8c6e8327053bab24
	.xword	0x7a21cf91773c4a0e
	.xword	0x685d2edb15c7ecbe
	.xword	0x5b6e07ad1c4ecce1
	.xword	0x64025ae293265a3f
	.xword	0xf0c10a39fd47fa50
	.xword	0xe11d309ae13997b2
	.xword	0x8e79450a6aabc095
	.xword	0xdc485eb5fd7148d9
	.xword	0x35ff73be949542e4
	.xword	0xc60b6f1a8f839e03
	.xword	0xe34482c4df9f1e0d
	.xword	0xadb1898ac2c91100
	.xword	0xd6392ed4ac3e0780
	.xword	0x97062979e126b378
	.xword	0x5f9002be54afb44b
	.xword	0xf5ec45b9da0ea93c
	.xword	0xa8cb79b7f6512a22
	.xword	0x67923e2909494298
	.xword	0x50765625f8371a30
	.xword	0xd0ddd9e3aa53470a
	.xword	0xe3bf390e882696c8
	.xword	0xff58c5ec51e21831
	.xword	0x32ae8499cf76a629
	.xword	0xf9f12b4f701e0da9
	.xword	0xcd58be00a77968cb
	.xword	0xb158c8d9464e5907
	.xword	0x06c47ef9d6d9f14f
	.xword	0x3b9f68a5d2af2976
	.xword	0xa6c56e633f84ac51
	.xword	0xa34f3617c001cb60
	.xword	0x7e686fee0364b34f
	.xword	0x2c0a3d1da9a8644e
	.xword	0xbfecbffad9b2322f
	.xword	0x72e04b49cbc5706b
	.xword	0x4743a3c1fcbeb795
	.xword	0x108cf93b7b6867ad
	.xword	0x909191bb916a485b
	.xword	0x688610631a72571d
	.xword	0xd9b04847da919bf4
	.xword	0x5500d112a9973f7d
	.xword	0xcea1609c9bb4f17f
	.xword	0x18f78db11fbd7748
	.xword	0xfee0985653345f30
	.xword	0x7e00ad42eba002ad
	.xword	0xfb4583bb71cbb529
	.xword	0x7fd1b7af5daed9e6
	.xword	0x1377c91c9722ec0e
	.xword	0x89ac6c04168cd406
	.align 0x4000
	.data
data_start_2:

	.xword	0x5bee2d2727f6dbad
	.xword	0x617d0846d8eeecb2
	.xword	0x4cf6ebb238e2af75
	.xword	0xab7bf94e6fe2d549
	.xword	0xe53ef3adf1ae868e
	.xword	0xeea441224c8e8ce4
	.xword	0x8db9baadb65c6f24
	.xword	0x1a7372ee8f0a1f11
	.xword	0xb0683f1a1d293a57
	.xword	0x25eb512ba035cb79
	.xword	0x2cb382d28aa82b80
	.xword	0x67e06ddce007499c
	.xword	0x26df08fcdd8ae692
	.xword	0xb7798e931bd5f9da
	.xword	0x5bfc4558c989f036
	.xword	0x8e36a0ca5dcb568a
	.xword	0x0ec5626578232c1c
	.xword	0x37dc5d70fda74999
	.xword	0xdd6d3261417015e5
	.xword	0xfcc540acc6a84b0c
	.xword	0xe678efb2ab536cc5
	.xword	0x8e0d48f1161c1499
	.xword	0x99e765a17afb3697
	.xword	0x483661dc219610fe
	.xword	0xa92d06ec25437025
	.xword	0x1573c040c3c67a23
	.xword	0x37a25f3fa0d39fd5
	.xword	0x870d39d2732b0441
	.xword	0x70fe7dcac3859e42
	.xword	0x8ae6128dfade7e87
	.xword	0xa2d1570a2a93f620
	.xword	0x9ad34d76005f3128
	.xword	0xa25bcd1f79aa9ebd
	.xword	0x7f52b59203e49aa3
	.xword	0xff282e03d0e29af3
	.xword	0xe76cf4ed888962c0
	.xword	0x9c3112e9c84eeee9
	.xword	0x655a92d3b86655c3
	.xword	0x5fd82522f82c83fb
	.xword	0x29409fba2329accb
	.xword	0x265ac6f6050ef218
	.xword	0xe764e414a52f6e4f
	.xword	0x1e15b55b5ab71665
	.xword	0x09f266b199c935ae
	.xword	0x93cff969b0f75ed8
	.xword	0xbd4cb77196afd017
	.xword	0x5a2200d9bb597d17
	.xword	0x1356ac237eca01c5
	.xword	0x8a7deb39a00f9dd8
	.xword	0x67e0318932e23461
	.xword	0x9ee234fa5139f754
	.xword	0x41b485e3305ed301
	.xword	0xdc7a5c474258b509
	.xword	0xd1012d294d46b4fd
	.xword	0xffcacef980012af5
	.xword	0x338f47d15f7b6f01
	.xword	0xfc782d7ecff8983a
	.xword	0x57f3acb783691ee1
	.xword	0x7888fd9bc4cd5a36
	.xword	0x4b48261472b5e69c
	.xword	0x2770f6fd4977ab27
	.xword	0xbee369b7e441a6c2
	.xword	0x6ae9cd85d024555c
	.xword	0x1f99d43ebd7d60ae
	.xword	0x7afcb772b5e1dc46
	.xword	0xc1559d3ba390cc2d
	.xword	0x1bea4f46bc14441f
	.xword	0x44fd25a3dcad4566
	.xword	0x567ddaf80efd90d0
	.xword	0x6c33ab1c40528d1a
	.xword	0x4d132ac48e02a099
	.xword	0xff9fff30bdfabb59
	.xword	0xc399e3affb31c2aa
	.xword	0x66dc64d3b7ec6d6c
	.xword	0x161ca9bf7a9284a9
	.xword	0x6521481c9c08d341
	.xword	0xb879e622e9910a40
	.xword	0xdf4f21934a154438
	.xword	0x236dc1013438153b
	.xword	0x37985537e5d48c70
	.xword	0x708b187832d1f62b
	.xword	0x14697727ec65279c
	.xword	0xfcebef712ac6e98b
	.xword	0xf6acc840c7ad5a87
	.xword	0x6d83c0634203658e
	.xword	0x8911402e6e3ed622
	.xword	0x9427cba50873ce7f
	.xword	0xe15c319d6505ca49
	.xword	0xa6bbde7753739d31
	.xword	0xdf4d72d2143311bc
	.xword	0x44dd6393b9a522fa
	.xword	0x4b3bcacdcdbd63ca
	.xword	0xd2d5610fea0a4050
	.xword	0xd07cae7488f1938c
	.xword	0x1a9cc08844dde4f2
	.xword	0x0b50b46c5b99aee0
	.xword	0xb801955c126e71e4
	.xword	0xf0660d4bf799722c
	.xword	0x78f306625844bf18
	.xword	0xdf07692cf9a2f39d
	.xword	0x32890919c010dc99
	.xword	0x854affa8cec63833
	.xword	0xde33729637f2f862
	.xword	0xe7b8aaf848d1b9f4
	.xword	0x847963aa20151e5f
	.xword	0xa9f313e96f6116d8
	.xword	0xcdd5b72a55348065
	.xword	0xbdb1c0885e1af5a7
	.xword	0x5f7d9ffb8a8268ed
	.xword	0x26d8ab1dcd9add6f
	.xword	0x0a24a94136f8aa14
	.xword	0xd0255a6ad07b3fdc
	.xword	0x4dcdee300745cbfc
	.xword	0x4f5db9311d486cef
	.xword	0xc95a234f4d0653d6
	.xword	0xb8ee86ab1349fd20
	.xword	0x63f9d953e35fc362
	.xword	0xdb80a5912ca8db10
	.xword	0x3a18b0e7224bfb75
	.xword	0x7a6e10bbfed97b41
	.xword	0x7e58cf5169b10c84
	.xword	0x88aaa2863c218fe5
	.xword	0x7e301836d2a8a6cf
	.xword	0x8b953cd4c0029bbc
	.xword	0x69f6eb26c64eb7e7
	.xword	0x2dee932a658a1448
	.xword	0x5ef2d22de74fdf45
	.xword	0x864defecf404fe35
	.xword	0xccdbf339c01b3468
	.xword	0x5a840cafd529f819
	.xword	0xcf3e0c08c485a14b
	.xword	0xdf4b8e6d8f83f757
	.xword	0x78470b5e653fd140
	.xword	0x9377dbdeb70cbbd0
	.xword	0x7f5d4f51940e14ce
	.xword	0x3fe482b584c8980c
	.xword	0x23cbe8bf3e57effd
	.xword	0xbd824b2f1f23e27e
	.xword	0x4e60bf3ed9f3be3c
	.xword	0xd7579aebf4a618cc
	.xword	0x5fd3ff61d7a46d0f
	.xword	0xb593222bc53f2f17
	.xword	0x043b9cf883b183ce
	.xword	0xfcbdecfe9057be2a
	.xword	0xc9f84b9ff58a29d2
	.xword	0x6ab2fe34b1e36db7
	.xword	0x3b1344d8e8de7351
	.xword	0xa61ea11a8c50f1b7
	.xword	0x52308caedd99f3ca
	.xword	0xc2fe28dd77a7cba5
	.xword	0xc89be3fac735d21e
	.xword	0x053ba1d731d95c5d
	.xword	0x6dcbd2ed53e8cd10
	.xword	0x99f59a4def618a76
	.xword	0xd82ef1823e7b256e
	.xword	0xff3729e1c143a5ff
	.xword	0x71dd66f03bf32574
	.xword	0x169a03f143f059aa
	.xword	0xfb2408254669d8da
	.xword	0x5629d31ec75b7015
	.xword	0x1c1ff930a97890b9
	.xword	0xab9cb87e0d1af842
	.xword	0x3c7ca8fc48af2de0
	.xword	0x079bfe995ff81410
	.xword	0x6b2c3e3c9fa616d1
	.xword	0xf9c99604c119de05
	.xword	0xe919c83f7d572d8c
	.xword	0x12b3848ba2e19d00
	.xword	0x892d14f53afade8d
	.xword	0xc09f6db56d776675
	.xword	0x651089d0bac4d914
	.xword	0x8aef4c96f140a981
	.xword	0x84b4a4f8f940115d
	.xword	0x70a060a4dc50e13d
	.xword	0xcc6a707cd9a2a509
	.xword	0x378defce0eed029a
	.xword	0x3fc69d3df72c2d18
	.xword	0x8aa49ef755207303
	.xword	0x849faf8d7cffddd5
	.xword	0x82986bdf2b075e1c
	.xword	0xd99d673928175a44
	.xword	0x1a93df95a776f640
	.xword	0x4e9be56e598f272f
	.xword	0x6feb8582d0a89d3a
	.xword	0x769f49056dcc35f8
	.xword	0x2eacbd4108984e73
	.xword	0xef91c585c0b2a02d
	.xword	0x360c6ea8e7671f4a
	.xword	0x7f4d72fafc4fa645
	.xword	0x410fe4d7185509a3
	.xword	0x9ab302ad36b732eb
	.xword	0x68f5257ae8463fb8
	.xword	0x29ce20b7b5468b05
	.xword	0xc5035f3a596b9a65
	.xword	0x9d8504aca5aa0d1b
	.xword	0xbc78e8727b54e3dc
	.xword	0x0e062af4573e8faf
	.xword	0xa6165494f121c929
	.xword	0x6afa13ae00ce9d55
	.xword	0xaaa5ceb0a5fb154a
	.xword	0x64020f275649b122
	.xword	0x0664dc562c33fe62
	.xword	0xa84323055cb64832
	.xword	0x11b8c1797a01c6a8
	.xword	0xe1b1ef337e97eb04
	.xword	0x3a86809d5da62f1e
	.xword	0x48abfd94b3abbc38
	.xword	0x18094e1c39b33674
	.xword	0x7c483c1f6512aee6
	.xword	0x654448c71f3c1bec
	.xword	0xf8ffdc44fd534892
	.xword	0xd4348d0444ef3d3b
	.xword	0xa9fa379859a07689
	.xword	0x6424dd7291aba492
	.xword	0x5cc32161569a1524
	.xword	0x7af2276a328e6e21
	.xword	0x9486f078a44e655d
	.xword	0x9b6f6094ebaf9e96
	.xword	0x26aeb15faaa24de8
	.xword	0xae46b4a35e1f19ce
	.xword	0x256790ccdf68a0c6
	.xword	0xe2fe32db4b3dcfdb
	.xword	0x52fcb53caac17315
	.xword	0x3c2f0eca5533d8d4
	.xword	0xc0061a31b7582987
	.xword	0x574d17b78716e7f2
	.xword	0x30fc5a1411d163a9
	.xword	0xbf7b9c6b7b313764
	.xword	0xb52dd1cc0ed43d4d
	.xword	0xcdbb6a058baecddb
	.xword	0x539f18847088011a
	.xword	0xab8d1e405e23150c
	.xword	0xbc353516d2c01709
	.xword	0x6a05dfa3aa2f4aa1
	.xword	0xf371411209d544c8
	.xword	0x646ff92a75cbf0a8
	.xword	0xb125e6ea1ccae60e
	.xword	0x1896bca33261ce91
	.xword	0xbbd732c4fff287fc
	.xword	0xa3292ee161c3d228
	.xword	0x0d4eee2eb5f7b986
	.xword	0x2657c4ef129ace78
	.xword	0x01982b1f5cfa07c3
	.xword	0x3ec6a3501a04096b
	.xword	0x6832efc42945a468
	.xword	0xfa1c4f01f128a15f
	.xword	0x7f985c26dd53a6b3
	.xword	0x65ed966901b71401
	.xword	0xf75ea06179b7df6e
	.xword	0x7abae55d34bc924a
	.xword	0x76c81584d3769668
	.xword	0x12d86587dd622c9f
	.xword	0xf89d17b21be5c2de
	.xword	0x8ea092c9622c442c
	.xword	0x0454e962840dd2e8
	.xword	0x2faf49ae8c13d671
	.align 0x8000
	.data
data_start_3:

	.xword	0x1f4f89ea0995d9f1
	.xword	0xa0cda35079b48ebd
	.xword	0x8f997933e92fb3cb
	.xword	0x33d81da0f7dd3271
	.xword	0x2b5c0c8540609d73
	.xword	0xb94f435541e2f8e6
	.xword	0xd33d4bc81bbbbba7
	.xword	0x9ae78ad97542352a
	.xword	0x380f7214677fc2a6
	.xword	0x65a81f1efd46b27d
	.xword	0x323c4fa3e0f92bf9
	.xword	0x6e385d3f3f55cb94
	.xword	0x3c1d373279d0768f
	.xword	0xe01342eb76f592ff
	.xword	0xa8acecace5695186
	.xword	0x24e6c0ffe1d98426
	.xword	0x25415efffd28f5a0
	.xword	0x112d0f7340c8b4a6
	.xword	0xbb5467620f7d76c2
	.xword	0x403defb95cf6e72e
	.xword	0x48ca7adb8baafb8f
	.xword	0x50e7a439c5c0dc88
	.xword	0x8e4a02d735384a5f
	.xword	0x2cf1c06fc11087de
	.xword	0xe1430b5b92d77e78
	.xword	0x753dd3aeb5aa1ea2
	.xword	0x714393c1dd9f9cac
	.xword	0x5008a5fcd21ecd11
	.xword	0x6cb3b57445aba6a1
	.xword	0x03319847d3039ede
	.xword	0x245227e5a86f716e
	.xword	0x5074a67fd4f43f47
	.xword	0xce903de0ce0e38f3
	.xword	0xdaa176513805c3f0
	.xword	0x77f322e5406944bc
	.xword	0xb18756ecde06c453
	.xword	0x931fca51db1b3bd5
	.xword	0x88db7baafcae01d7
	.xword	0x719ed43f54ceb580
	.xword	0x73312ce0b99b00eb
	.xword	0xf3c4139e3706de42
	.xword	0x2a3d9dd585648afd
	.xword	0x2d26d74a9808ae7f
	.xword	0x291faf6a690748c5
	.xword	0xc0c862359954b558
	.xword	0x1c78488c2d354733
	.xword	0x78e0ac8f17990520
	.xword	0x40aa87825f0bff59
	.xword	0x2478f19bc7258555
	.xword	0x389d8374474767af
	.xword	0xcf6aad5c74028bc2
	.xword	0x32f26c80d6690a4b
	.xword	0xb0f9e89789916697
	.xword	0xcf0c6ec891bd5c3a
	.xword	0x263b7dbf50bc8f92
	.xword	0x42b4e008f166005b
	.xword	0x67d122d747347b7c
	.xword	0xe98e11a7d2681ae7
	.xword	0x02590b8a6b717353
	.xword	0xe02275981c6b1d90
	.xword	0x347a03ba9e8cfc66
	.xword	0x05cef6a97265ffa6
	.xword	0xe6398c36ac7e0fcd
	.xword	0x93d38c3d732938e5
	.xword	0x1e94e8c87bd4ca1e
	.xword	0x880cb31dd3c8a97c
	.xword	0xc09fe049dc69183f
	.xword	0xa6f24e5557a1a4d8
	.xword	0x3894cff8996c39b0
	.xword	0x540fffd061d10de4
	.xword	0xbaf867188fa3b70f
	.xword	0x78938d5e74bb9f68
	.xword	0x8ec2dbd5ddef96ec
	.xword	0xc440c874bc87ff3f
	.xword	0xe0e3d9d3a3a35d09
	.xword	0x28ebb83c9667114b
	.xword	0x7d5ba29a261a9d1a
	.xword	0x4c5e51aab07e0fb8
	.xword	0x97f618c6f65b1b49
	.xword	0x115be315e3d73e80
	.xword	0xd9b54dfa10290c2d
	.xword	0x4ade41035878a2a8
	.xword	0xe9f2231433223531
	.xword	0xfd76b2e80cddf630
	.xword	0x1dd8ece6a9cb96a0
	.xword	0x26fe0f518a975b81
	.xword	0xc36419f1b54cfd9f
	.xword	0xd7f4bb23197274a9
	.xword	0xa791e0ab9dcbd571
	.xword	0x5c64298a4476f9ae
	.xword	0xba807675e8b0c757
	.xword	0xeda101999870f3c7
	.xword	0xd92849e7d1a50809
	.xword	0x5bf03a6a0b53f54f
	.xword	0x3c128a88a9136a89
	.xword	0x9e8ddff48c4c3417
	.xword	0xa3a060c0f9a09693
	.xword	0x36f5369dab84c008
	.xword	0x640f7b1e0876dc95
	.xword	0xdde1a2e7cbefddcf
	.xword	0xd0bed27ff14c4ecd
	.xword	0xbcc65d633233ec25
	.xword	0x018df04a990fb3df
	.xword	0x80aac643167666cb
	.xword	0x1015c24e731caf92
	.xword	0x960a49b257018f52
	.xword	0xe0f835dc5a1ebc7c
	.xword	0x4529e5c8fc223074
	.xword	0x92971cef5d9305f4
	.xword	0x2214015567d54416
	.xword	0x5f5f9e87e0e3c06f
	.xword	0xac70b7388d912287
	.xword	0xdec0e5b67ca24be9
	.xword	0x78f98c9741c7684f
	.xword	0xd6c07c166a6ac1d8
	.xword	0xa23f856f15d3d09e
	.xword	0xa1cf3e20a7e94872
	.xword	0x4ba7f11a2e8e7dde
	.xword	0xf7407816e7a54502
	.xword	0xf0a6b2c9fa56a5d0
	.xword	0x5c5756ac8543c9fb
	.xword	0x209dd33dc9a0e968
	.xword	0xa2982883a827764f
	.xword	0xe83cfcc28d958168
	.xword	0xfed22f922f904207
	.xword	0x63752a3ddec3c375
	.xword	0x7e69fb6d621c1b0f
	.xword	0x3abbafc6eb389731
	.xword	0x2f90f48d07744daa
	.xword	0xedca60bbb1e63eec
	.xword	0x5d7865e90b588949
	.xword	0x6e8f3660b845ef35
	.xword	0x48f1e3d2ddb3918f
	.xword	0xd35282357ef81401
	.xword	0xca4349c69ab0221f
	.xword	0xc1596807174df213
	.xword	0x9d5aaf5834ec8482
	.xword	0xde6f81ceba079830
	.xword	0x2838343cd063f03e
	.xword	0xa6931a84409d39a0
	.xword	0xb02795ae2d12397b
	.xword	0x9cf35116d86e82fb
	.xword	0x3464205ec761152b
	.xword	0x11265edf83576498
	.xword	0x435722febc96f0a0
	.xword	0xe478fd2f1fa386ea
	.xword	0xf606dc3de6b6fae4
	.xword	0xd11df55a5439119f
	.xword	0x057ff3dc251495fe
	.xword	0xba15380edf0ff397
	.xword	0x3269ab9913182459
	.xword	0xd60266ce1086e424
	.xword	0x22dc415dc077b2d3
	.xword	0xa200e4cc70f1853c
	.xword	0xc55087031d46a05d
	.xword	0x47e87263e9af2a38
	.xword	0xfabd8f48692e89a6
	.xword	0xecb837a274a00c1c
	.xword	0xbbf1a67661bfc855
	.xword	0xfe9069a8088f1b22
	.xword	0x08746418b11a7b65
	.xword	0xa9e17f49e17e5467
	.xword	0xbaeac9bb486aee89
	.xword	0x475b534afc34218c
	.xword	0xec3e6d4bc88ea764
	.xword	0x79ec944508434426
	.xword	0x884204a2b01f36ad
	.xword	0xa664511242f5ecf8
	.xword	0xa2cc43100e2b8036
	.xword	0xa6ae8d5ba1cbfcb7
	.xword	0xc8721aa49886d952
	.xword	0xae6013e0c3c34f8f
	.xword	0x6a215a7e5368d89e
	.xword	0xc9e0264a34a912e1
	.xword	0x6617b16b45f2bff7
	.xword	0x9c9618ba0c2c96eb
	.xword	0x372e52886ef6581c
	.xword	0x458087c8e95bce93
	.xword	0x5b8c9309b693e814
	.xword	0xf85512682749852a
	.xword	0xad99ea9e18f6035f
	.xword	0x89dfe0dca05876fd
	.xword	0x4b8da0262aa51513
	.xword	0xe67882eede8fa330
	.xword	0x129b47142bd8f4e3
	.xword	0x832c06c067d7ae8f
	.xword	0xdfb50fa515abf938
	.xword	0x44d53923625e1e20
	.xword	0xdf0697d30d91ec37
	.xword	0x83f868170201e944
	.xword	0x9d5f20ae1224ea37
	.xword	0xdcf63eb51e18b078
	.xword	0xe8019f4d589a95ec
	.xword	0x94c31185885a50d8
	.xword	0x56f04ffea75bc11b
	.xword	0xef70d0a97dc1214e
	.xword	0x0254d0324bb66407
	.xword	0x0fe54cc2aaf89e2d
	.xword	0x38ee95c97dc67189
	.xword	0xdbe8c5082d57afe6
	.xword	0x90202b507ce548bf
	.xword	0x0ef9e96e9291bfb7
	.xword	0x414b7d563397027e
	.xword	0xed40b9a512eecc33
	.xword	0x403967623d207097
	.xword	0x945c236c584ce187
	.xword	0x6a786fa308f4e5b3
	.xword	0x58dd25efacd5bd3a
	.xword	0xb2427743da99cc98
	.xword	0xd9690d24ea2c8d9a
	.xword	0x49913a4eae4d585b
	.xword	0x3628fcf1e92e33b7
	.xword	0x1bf04f7a89d79163
	.xword	0xf8c977b20de10ed1
	.xword	0xf6b6858fb747f7f2
	.xword	0x4a8f099c2af7fa62
	.xword	0xed7fbf094e2bc818
	.xword	0x53e91d133b162986
	.xword	0x727e484e65ee8db0
	.xword	0xa35745c98aa0d83e
	.xword	0xd488e880020c7996
	.xword	0x1a8a80de60f71587
	.xword	0xe97a929514254ccd
	.xword	0x429f1a050d213b79
	.xword	0x0dac9c8269ca81eb
	.xword	0xfbcb33ccbe90e1ac
	.xword	0x1884c1099121f3d0
	.xword	0x9243e67d1d402971
	.xword	0xc4ca227cf0776001
	.xword	0xd2d41150e85cdfe8
	.xword	0xdf24a5e1c617105f
	.xword	0xb6722c78ceb5a5c9
	.xword	0x13acd3e098becb42
	.xword	0xa44285f325ae26ad
	.xword	0xd7a1b6c4d71069c9
	.xword	0xccf74bf88c864354
	.xword	0xbdf9e06c36e12f69
	.xword	0x0ebcbb58936c60a6
	.xword	0xc367ae5827439901
	.xword	0xdc9b6ab83d19eef4
	.xword	0x5586c442d41ef570
	.xword	0x550ef5e1bb618f31
	.xword	0x5f8130f4463d41fb
	.xword	0x505df3b7ade6ecbb
	.xword	0x447681f45bc6cd8d
	.xword	0x00c4cd926a135c14
	.xword	0xae729d269cf8e2ed
	.xword	0x9f58517d526ee764
	.xword	0x3e3241ea22fa9940
	.xword	0x2436354feb46d437
	.xword	0xdba8fd19d8c89d2b
	.xword	0x6eead61f40e05472
	.xword	0xaf1d00d932a0a1d4
	.xword	0x15d6be13ab701765
	.xword	0x217954a246079a84
	.xword	0xe81b0739cb33fa3a
	.align 0x10000
	.data
data_start_4:

	.xword	0x61fb3103b5aa932d
	.xword	0x572f28361258e152
	.xword	0x8c60684bdedc08e0
	.xword	0x0341b6031ddf6063
	.xword	0xb3add586ce7c29e7
	.xword	0xcaa816b9527fe56d
	.xword	0xcaa9a21f3c7aad65
	.xword	0xad581846a19f05c3
	.xword	0xdab9ae9939bbbdcd
	.xword	0x0e416fdcb6987675
	.xword	0xbf74603ee9ffa234
	.xword	0x5f76aa18d4e7b3b6
	.xword	0x720e5259172ded5d
	.xword	0x7f71e62b8333de14
	.xword	0x380846ed88f9a274
	.xword	0xe292d89ee68edab7
	.xword	0x1b06e0c5df74af7f
	.xword	0x956c36e0312582e2
	.xword	0xd6228da444937482
	.xword	0xcd6edd2129cf42ff
	.xword	0xda4df3970afb97ae
	.xword	0xb42f0d6150fb3afb
	.xword	0x8471cc1e29400fe5
	.xword	0x48c9fe5e3597c90c
	.xword	0x44b3d0a2742d987d
	.xword	0xbed97eb265d848ce
	.xword	0x7649c8f9494ff017
	.xword	0xa6d7763f27e1406c
	.xword	0x437405ff3b22baa1
	.xword	0xdc17da228602542c
	.xword	0x8ec246b7a10d6f1c
	.xword	0xeaeac7de4acfd301
	.xword	0x98b04257bab0ef87
	.xword	0x2de0e7389aadccdb
	.xword	0x1ee48fefb35036d0
	.xword	0x094dfe15c444d5ed
	.xword	0x9cc67a2f463ea9e6
	.xword	0x964af795fd49609f
	.xword	0x8095768758a08001
	.xword	0xcc65fa2f15ceb0bc
	.xword	0xcfa512a5e9046c21
	.xword	0xed3bf0b7bfaebcf6
	.xword	0x10dfb4d83e4cb70c
	.xword	0x342ae42050827849
	.xword	0x7dcd1ac6be345812
	.xword	0xe4969de6b7945777
	.xword	0x4d2f014ddbab0113
	.xword	0xf31577c167376eb6
	.xword	0x09f6a21bba4c2e6f
	.xword	0xd302cc630a669da6
	.xword	0x8c3f2267ecf32d80
	.xword	0x968607ab0f8937aa
	.xword	0x975c9dc90eb9950d
	.xword	0xd6544b4ef8509137
	.xword	0x423d0f1093499239
	.xword	0xc0e9126f0042542f
	.xword	0xc82a90b8009e7a28
	.xword	0x850ed66a95d7afb6
	.xword	0x43714821eb95fd5a
	.xword	0xf14523edc64929b7
	.xword	0xa0d9b64770c3df78
	.xword	0x0e238dfb9bb28ba8
	.xword	0xa56583d28115a8ca
	.xword	0x3d65c4d243d3e761
	.xword	0x5865730ccf9d69d1
	.xword	0xc27e7cc87a5ed45e
	.xword	0x4c2bcc3b664851d1
	.xword	0xedd6c008f6dc2f6b
	.xword	0xe3d670a00c5439be
	.xword	0x442b767232f407ff
	.xword	0x8c75616c0e0e9cd1
	.xword	0xf418344e189b19c4
	.xword	0xab86e9c0f762ee6b
	.xword	0x0f0295b7e251d1a6
	.xword	0x8f04ac4d45ad5fab
	.xword	0x5fb97c19fe56fcac
	.xword	0xee834ec768a69984
	.xword	0x6b6aea2aa131e436
	.xword	0x443f2334d37466f4
	.xword	0xeca9777568a208a9
	.xword	0xd85cd860208fd394
	.xword	0xf9e86dd76e995381
	.xword	0xfb74eb2c075c1e9b
	.xword	0x071f3e2f198b80a5
	.xword	0xc9de7581cab39d6e
	.xword	0x314b8622db2a12f7
	.xword	0xbdc8222236d62206
	.xword	0xe44d29599fb333cd
	.xword	0x7290954144f3ae3c
	.xword	0x0eaa714925e84eac
	.xword	0x762b2ece04c87d92
	.xword	0x24e283797725a898
	.xword	0x37291a63680ae4b7
	.xword	0x05364cfb29526185
	.xword	0x6a2c6911f93061da
	.xword	0x78e8c37c2732ad46
	.xword	0xc70ebfbfbced1a96
	.xword	0xd7d7fbe144c2dfe8
	.xword	0x1ae8989eaa4e2300
	.xword	0xd7139ffa6728d25f
	.xword	0xcdd14d4b9254d537
	.xword	0x99617f0f1cff97d2
	.xword	0x943db357eda19c67
	.xword	0x8cdc26330cd3d55c
	.xword	0x7b343d3618f66a8c
	.xword	0x6133d49a858c2983
	.xword	0x74f090e1f4e64d42
	.xword	0x404b34964d7d8090
	.xword	0xd9ac4dba98bb85dd
	.xword	0xbd51762a33c9a10b
	.xword	0xf865ff59948632f7
	.xword	0xa564e40f7e1d0122
	.xword	0x0832101a104f7bfe
	.xword	0xd5e57ff9f348f114
	.xword	0x0c079b262ba53edc
	.xword	0x1814807c2802b0f0
	.xword	0x60624589f1cb0611
	.xword	0x66c6b88056436a7f
	.xword	0xc5e04e864af70158
	.xword	0x3af3252f777b51c2
	.xword	0x9fd2e3f479046cce
	.xword	0x514947acac29c38c
	.xword	0x11378a0a437e3a26
	.xword	0xe8922f986eeecea7
	.xword	0xe8f5dd8889d188b6
	.xword	0x90af6d2ef39b5aea
	.xword	0xde7752a28a7c44eb
	.xword	0x0d176e327b203b4f
	.xword	0x54431dfa3a962e66
	.xword	0x7971bea6a4647187
	.xword	0x671958d63b0bb594
	.xword	0x5755fd2e6b30b41a
	.xword	0x406202ef497ed7e3
	.xword	0x115d4fe5000eb301
	.xword	0xeafe870a90c4f7cf
	.xword	0xc1b1536d53bb2e98
	.xword	0x39eb1a9242874cad
	.xword	0x1c876c1eab40ce03
	.xword	0x61c75dbfaf489da8
	.xword	0x4d5fbab4aa89ee31
	.xword	0xd3b2fd4862a97b5f
	.xword	0x8953ba4abb958cc4
	.xword	0xa13484d6be39af9a
	.xword	0xd5be90da68e65020
	.xword	0xb67235d3ede3318e
	.xword	0x44fdeb615734ea17
	.xword	0x21252fc3f4e6e934
	.xword	0x3ed816e7efd67cbb
	.xword	0x86f4ed13344be2f4
	.xword	0xfdf7e80ed2256e01
	.xword	0x7115ffb0630a5a12
	.xword	0x46de57c4d8629666
	.xword	0x3a8459e02ee47588
	.xword	0xd7822b9c7b6173cd
	.xword	0xd84960283f3aab24
	.xword	0x9b21f78853d71438
	.xword	0x2a7b5922c732fd94
	.xword	0x4ea0d2555d974209
	.xword	0x4728f17b6f6ba71a
	.xword	0x1d5c8348d1a4c1a5
	.xword	0xf762b1998f293636
	.xword	0x723a8f16c84f8ada
	.xword	0xb4d9ec05d8a7a143
	.xword	0x365dc50634ffed30
	.xword	0xa60ce7f292a2fb91
	.xword	0x0828759d471b5637
	.xword	0x1d6e7032452bbe6c
	.xword	0xefa81c9b0c30f369
	.xword	0xa1509ba2cd86fe92
	.xword	0x1dcbf1ceb9a96900
	.xword	0x4736b73054dc7417
	.xword	0xc6e993c1a6bf9ef3
	.xword	0x55afdd06a7769b0f
	.xword	0x50f048e7d58e6855
	.xword	0x33f39edea606b655
	.xword	0xda39172590c998e3
	.xword	0xd600ae974413912a
	.xword	0xb79a756009e15b38
	.xword	0xbdab4a072837c7f1
	.xword	0xfb61dd4095628d9f
	.xword	0xed555dc211f894eb
	.xword	0xb0f031d3e739b449
	.xword	0xe270ed51bb186289
	.xword	0x32e55715316b23d6
	.xword	0x73548170672c233b
	.xword	0xa9472fe48957dad2
	.xword	0x6022d4e9f3e0ab8f
	.xword	0x1ee838f9750e38f7
	.xword	0x7a79959f144dcb17
	.xword	0x7326453eb54d4346
	.xword	0xe68fb16690b18f22
	.xword	0xc284569dd8f9744f
	.xword	0xdb97194f8d7b9c8c
	.xword	0x1fe97492df8c6023
	.xword	0x24a47bd93cfaf37d
	.xword	0xf156681264d4c239
	.xword	0x5daba36b92d24a81
	.xword	0x2c227240dbf19af3
	.xword	0xea273f2a93c44213
	.xword	0xde773e7d139fc56a
	.xword	0x651bd3039e3349aa
	.xword	0xab37ab74ea9a031d
	.xword	0x680443339a5e46a4
	.xword	0x70a05de245089e5a
	.xword	0xc8fae22409b3662f
	.xword	0x0d749f6ee452576e
	.xword	0xaf886926d4f309e5
	.xword	0x1440028dc31075ad
	.xword	0x638c2938367e015a
	.xword	0x2d003f4a90cb1d48
	.xword	0x0576f01ea693e3ba
	.xword	0xde48c619c9205a6c
	.xword	0x910ef46750c17601
	.xword	0x4b6cd053d3ee33c9
	.xword	0x5fe2c98109547642
	.xword	0x23162681ce55142b
	.xword	0x766673456a5ebebc
	.xword	0xeff8d816ec2fa688
	.xword	0xd2fb320c2421ad0e
	.xword	0xf6c0b109b5c88c4a
	.xword	0xb0b4872ad94c7731
	.xword	0x22e67f86dcd24a79
	.xword	0x5dfe030ed92b68dd
	.xword	0x12635f3ee26454c4
	.xword	0x0e1c25a4ea2f08ac
	.xword	0x9dc42ae5af24082a
	.xword	0x4e92f10e252beeb6
	.xword	0xd77197bf7158609f
	.xword	0xb82026630e2a8bc9
	.xword	0x3174186751a86983
	.xword	0x49c7ad76cb5fb9b6
	.xword	0xc6ccf51e7a4667c7
	.xword	0x6ebd3943cbd90931
	.xword	0x85371f78ff23e544
	.xword	0x790d0113c573d702
	.xword	0x51315ba5ef103046
	.xword	0xd3ae3a4fe6251209
	.xword	0xa4441bd3a444c009
	.xword	0x4882a0101c864323
	.xword	0xad308edd0e64ef37
	.xword	0x60334b08b1a1c810
	.xword	0xd971f3e773dc04cf
	.xword	0xf3cd6ec2e5e29d28
	.xword	0x23fc2799ff5fd571
	.xword	0xa7d3669e8809b169
	.xword	0x7bd0b165be30ff46
	.xword	0xfa0b5217ba83830f
	.xword	0x3157083881461919
	.xword	0xa11b17c1cca1a83f
	.xword	0x87543a5622ff916a
	.xword	0xafd502857ff49ff8
	.xword	0xd90290ce2b6fc0c3
	.xword	0x3affbb0084cce0c9
	.xword	0x8170f2dd6b4a2cc2
	.xword	0x5f45b4ea0a3423cb
	.xword	0xe58c9019ebf0bcd1
	.align 0x20000
	.data
data_start_5:

	.xword	0xae6254dc1629a8e0
	.xword	0xd052135c78583bec
	.xword	0xddb00ee682038112
	.xword	0xd2f4b3086b78a374
	.xword	0x4aacb64eeb5034d2
	.xword	0x6b3e59fdd1d75dc9
	.xword	0x8342a708d52e8e49
	.xword	0x72a59352dee02ef8
	.xword	0x82b2edbc53462e56
	.xword	0x3a4fa4022b3e23df
	.xword	0xe2de8c430a3e1db0
	.xword	0xae3b97ce174d8189
	.xword	0x677b6f622016a8af
	.xword	0x0f754a3df1b00e65
	.xword	0x8ef2cd023fdc4248
	.xword	0x0be92f64d6e7f446
	.xword	0xbb493e63c6615a46
	.xword	0x85432e95f3967979
	.xword	0x2a9511b391c2bd33
	.xword	0x0f2d5198ea61399e
	.xword	0xe67634309433e098
	.xword	0x1d8a9fb120884b1d
	.xword	0x23a0b38e27a29b44
	.xword	0x8c17d6c7ab302630
	.xword	0xd79b372361bbd115
	.xword	0x2948b92b0cc6fc64
	.xword	0x1cdcd1a64e7f0a53
	.xword	0xb97a5bd301b37642
	.xword	0x6b1942cb1d2c2c72
	.xword	0x9365c75d390f5a8e
	.xword	0xfb7da3dcbc874c12
	.xword	0x228fe31249125dc7
	.xword	0x0fe882756733fdfb
	.xword	0x1a7c417068adcf35
	.xword	0x7365a28684db183f
	.xword	0x1f6dc5dcad0e781a
	.xword	0x511197a29bfae0fc
	.xword	0x79cc249b5165d601
	.xword	0x077a4c53690c0ec3
	.xword	0xb8ce19b1dce7d8c4
	.xword	0x75290767b5a52ba2
	.xword	0x50a007a17022e961
	.xword	0xbc1bbcfafb3c7752
	.xword	0x7adec5b8fd09de88
	.xword	0x6c0583d014b6d578
	.xword	0xd4a1b87999a33772
	.xword	0x0511400cca64c5c8
	.xword	0x0f1b8264616d64be
	.xword	0x34055f3cb43e1a12
	.xword	0xa18cc722c797a22b
	.xword	0x4179bf02d79881dc
	.xword	0x5a505ac07abae297
	.xword	0x7ede28f6cf28f608
	.xword	0xb9543bbb2080c5f3
	.xword	0xe88702a34391af6c
	.xword	0xecb3bede68f02486
	.xword	0xd29f83c32f3599dc
	.xword	0x76062d2c8ff75f2c
	.xword	0x2b5242ff655827b9
	.xword	0x48447f8aad1fb6fd
	.xword	0xb49b055cad12a2da
	.xword	0x967cb1e6e7dc77e3
	.xword	0x3c99f7a5fe7b52a3
	.xword	0xb531ad4e97f9ec6d
	.xword	0x08aa40e2a67d403f
	.xword	0x8438617bcd7e7bbe
	.xword	0x98782404d3dd2d02
	.xword	0xfed8064785b23bb9
	.xword	0x11dfb8f4262ba616
	.xword	0xfb23da8e42329032
	.xword	0x8d0d207cf78484a2
	.xword	0x1cc5d62192605ff9
	.xword	0xb0d1f49a2d6e3c00
	.xword	0xc80052d466a064dd
	.xword	0x1241136a836eb99c
	.xword	0x6ce45bf872944258
	.xword	0xabf85c3491a817be
	.xword	0x70eb0947cb1d7ffd
	.xword	0xa937a23f9bfd2d9b
	.xword	0x88bb95e8a600cb4f
	.xword	0x0d86f6c0bb0e88e8
	.xword	0x7414e39190c218b3
	.xword	0x2c117399f768a14f
	.xword	0xfb8c2f304d0377d3
	.xword	0x201d819a3c4a911b
	.xword	0x767957c7746bb4dd
	.xword	0x537dbf9c4d0a5adf
	.xword	0x675faaeb2651d479
	.xword	0xeed468f21dd4e368
	.xword	0x7b93490f83c4f8c7
	.xword	0xf52ebdf296b2b926
	.xword	0xbf16abbbf2c99f49
	.xword	0x5a61361b919e09b5
	.xword	0xae1fc44d2648b7e9
	.xword	0xafb1a0b8537c0b3f
	.xword	0x90725bcedec19d0c
	.xword	0x15509afb49d207db
	.xword	0x59dcdd1f50981e02
	.xword	0x2a331e0b4271b9ec
	.xword	0x79e7679bfa88f931
	.xword	0x305a8b3de2dd1f6b
	.xword	0xcd0cf8ce8a812950
	.xword	0x2ebeb7ebfd294b70
	.xword	0xb624c2cb415dd350
	.xword	0x685b4a763e4c31bf
	.xword	0xb06a1994281b3b64
	.xword	0xb5edc7b7082c3dbc
	.xword	0x02b0368963138e37
	.xword	0x604a393b2fcebea5
	.xword	0x3dd111beb79e88e4
	.xword	0x6a2cf859f8424351
	.xword	0x99ac94a0e73c699b
	.xword	0xe06112364379e983
	.xword	0x9b7db8d5120b5f3b
	.xword	0x2b5d61122c997482
	.xword	0x0bed88426f357171
	.xword	0x0b6584d2fcca07f9
	.xword	0xe6a8586f4d5ba740
	.xword	0x82867595e9dd13ee
	.xword	0x28f0899ce03cd67b
	.xword	0xef4a0aaf6fc1f37c
	.xword	0xa016fcc2334abdd1
	.xword	0xa3c673e4ce071224
	.xword	0xf6d70ab5cf68e22d
	.xword	0x011e7c09b86e13c3
	.xword	0x5e7e1bb4f4d55749
	.xword	0x88af97b7c726eeb9
	.xword	0x9560eb4128e4fa75
	.xword	0x755db7e3c57e741c
	.xword	0xe5b82537ab889016
	.xword	0xffff657f082c9709
	.xword	0x0d0645288e16ac0e
	.xword	0x7a1d30c1b1d92022
	.xword	0x5061b1b586ba8248
	.xword	0xcf3e5cac452567d3
	.xword	0x00d3d6a20133dac4
	.xword	0xbb29881e6dd029c1
	.xword	0x9fd864a3f704ed99
	.xword	0xaf8988187df22cd1
	.xword	0xe9276f61318c0d24
	.xword	0x974d2c3dc7403684
	.xword	0xfcba2610c94d41cc
	.xword	0x47e0270ffb193ab1
	.xword	0x9c2ef734e1fa8109
	.xword	0x4302a66cfd337a86
	.xword	0x1046da0df5a353d6
	.xword	0xbc045bc5ecd8046e
	.xword	0xe0b50c889c219050
	.xword	0x0445dafc54671ab8
	.xword	0x837f78775d6ff159
	.xword	0xd6ddd0da35430871
	.xword	0xf296f71c0529c749
	.xword	0x002e02d96abc83c5
	.xword	0x8d1f21e2c0f72265
	.xword	0x859ce0a34faf191f
	.xword	0xd289208b369840c3
	.xword	0x35c13a81e9bb7c7b
	.xword	0x80ba600abec0f9f3
	.xword	0x22c888333117eeb3
	.xword	0xc41946353236f3a2
	.xword	0x7c502c68ec8e054f
	.xword	0x0653fef02fc9b7c4
	.xword	0xebe3997fb14923b5
	.xword	0x1ca2515068073fb4
	.xword	0xe7b3e03233f4b1dd
	.xword	0x99ed219835bca02d
	.xword	0x9ad4df6245c0c911
	.xword	0x93ec57bfa251e7f6
	.xword	0xf70ddf7122b40508
	.xword	0x07cc5a5ddc235bf6
	.xword	0x1304901a40745f3b
	.xword	0xee54702f6973130f
	.xword	0xa0506cd71c6e183c
	.xword	0xb23dcea2d03c2cbe
	.xword	0x80db625fb4dcb908
	.xword	0x6ce09b6211e9b315
	.xword	0x3e4139d2ada9bffa
	.xword	0xc2a97d272d94b400
	.xword	0x5387540880113060
	.xword	0xa7132870dea6d429
	.xword	0xd1e31b03ce9b2e9e
	.xword	0xedb059de5533d3cd
	.xword	0x7802305eccd327f3
	.xword	0x816824febfbcc3ad
	.xword	0xe1589b74d92f37de
	.xword	0xd50887b3b06b06bc
	.xword	0xcaeb15d0f23df9a8
	.xword	0x686c766b8c295101
	.xword	0x6cecd2e5441e02b0
	.xword	0x143d6070f7c63f46
	.xword	0xd0ef14e334b8b160
	.xword	0x02300cc15590d5db
	.xword	0xec1f86abfa3e9776
	.xword	0x72c71fe02b8e447a
	.xword	0x565680043fa40c2c
	.xword	0x256df07bab1399cf
	.xword	0xda503ba20066c98b
	.xword	0x148b95775046d1ce
	.xword	0x4ed2e49e3c45a2fe
	.xword	0x60630739470e226a
	.xword	0x599d27e9acce4f77
	.xword	0x72ce96c56086adca
	.xword	0x26a05687828bc06d
	.xword	0x2ed10f99523edd33
	.xword	0x852715a32f271c00
	.xword	0x42f879643f96f4c1
	.xword	0x11c00c840486aa46
	.xword	0x6cdabc04e0a563ff
	.xword	0x60792821d88644e7
	.xword	0xba19ae5c4d6a2936
	.xword	0x8368f2c0030cd6d1
	.xword	0x55f04cdb6effcf7b
	.xword	0x263b465028f67094
	.xword	0x2e97622b93c42a78
	.xword	0xca43367c0cf4f657
	.xword	0xdc226099ebcf1b6a
	.xword	0x83caf4deb9df52cd
	.xword	0x96529e4d84cdd1b4
	.xword	0x2132dc2bead1c762
	.xword	0x3ee7b41170220336
	.xword	0x77f217e77c84f2e1
	.xword	0xa3fd30e2eecaf94a
	.xword	0xccb25e1679336861
	.xword	0x58c1dadc4cfcfb04
	.xword	0x8efae484c8226413
	.xword	0x3c89631fc985460e
	.xword	0x340233a0d963e955
	.xword	0x0b755d80ffc712ba
	.xword	0xabd9679e579a9c5b
	.xword	0xffe3ad30d63a9a5e
	.xword	0xfab85d9f2b57c67a
	.xword	0x1460d7888b39e992
	.xword	0xea6edeb6428aa761
	.xword	0x050b494eada7a1d6
	.xword	0x452eaa06d7c099fa
	.xword	0x19220b1d9ea54e47
	.xword	0x6e8521e52a9cca14
	.xword	0xab11c97d158c3aa7
	.xword	0x1457c6842760b7dc
	.xword	0x964bb200145fb914
	.xword	0xdbb37573e8c34162
	.xword	0xe447fc70bdbed4e3
	.xword	0x66cef2b28bc51e8c
	.xword	0x299fa19cbec6dcda
	.xword	0x212c6580cd5f6d6f
	.xword	0x6b17e5182a485af1
	.xword	0x2e0575c94c11fa15
	.xword	0xedca7de2613101f9
	.xword	0x81d200a33061446c
	.xword	0x0831358779e767e9
	.xword	0x89cbf670f58876de
	.xword	0x8f512c2229b0049c
	.xword	0x179af84727671c56
	.xword	0xbeb5a85247fd4d22
	.xword	0x0a688ca1c70db81d
	.xword	0x896452b4ca0cebb9
	.align 0x40000
	.data
data_start_6:

	.xword	0xae62add0e4c5088b
	.xword	0xdf200d6c5919d783
	.xword	0x4a903838636e4acd
	.xword	0x260799e2268c812d
	.xword	0x0471f80667610202
	.xword	0x19b44fa590cf758d
	.xword	0x0725e71fdd2131a0
	.xword	0x68a76c59078b764e
	.xword	0x1a3074c8f68108bc
	.xword	0x7fd63f851ee48c83
	.xword	0x490b12eecbbf31c3
	.xword	0xfa1624d75b5b9aa8
	.xword	0x23ce9f9df3585558
	.xword	0x62e9672f6dfcc3f8
	.xword	0x078ab4e975282701
	.xword	0x3229c427945c4c14
	.xword	0x8935a2f1eac8131c
	.xword	0x99a823267439cce1
	.xword	0x732e430dc3b5fc87
	.xword	0x752416d765547e05
	.xword	0x4b5019a8c50d3795
	.xword	0xd1a02a74104a9ff3
	.xword	0x30b82d32cbf15343
	.xword	0xf8dd0bfc74f67d96
	.xword	0x2eb4822e5c697b08
	.xword	0xe9747a79e10212b2
	.xword	0xd4316850f1b587f8
	.xword	0xf2e9a9103d595d0a
	.xword	0x8aeb1c79fc6e0f5b
	.xword	0xe5e249b16a13d97b
	.xword	0x6e2e6a437c7af1ba
	.xword	0x931c1e39cdceb41e
	.xword	0x34190fc87d8cffd9
	.xword	0x5e6e312f8ffdcffb
	.xword	0x90f8432b04e52e5e
	.xword	0x8706e32543950eaf
	.xword	0xc30b98a262337dc8
	.xword	0x98dba12a1970b199
	.xword	0x419917e09c65776b
	.xword	0xb9c7c83985cdb7d5
	.xword	0x83912c29afbdf1d7
	.xword	0x43dfbd458b124f70
	.xword	0xdd436166fc65a32e
	.xword	0xfc8a75acc799ebbb
	.xword	0xe893017fac91a9e8
	.xword	0x3380261181d22322
	.xword	0x03385b30d4672134
	.xword	0xd1386d2b9ea71193
	.xword	0x8299aabe08a0c8c4
	.xword	0x9a5542c53b1c1688
	.xword	0xab40f92815769d2d
	.xword	0x963ace25292e1c23
	.xword	0xbd17c568d8aca4bf
	.xword	0x6daf0fc63282b3fc
	.xword	0x9c681a7431b432f3
	.xword	0x0889dfca06b8a743
	.xword	0x2d471a3ec8bc1bd7
	.xword	0x79aded50cef61c76
	.xword	0x7dc4f4efd88ec672
	.xword	0x13be113b9e67fbd4
	.xword	0x867421b80a7957cf
	.xword	0x79dd1841232f173c
	.xword	0xb69a3d12efcb9709
	.xword	0x2a92a686d27f38eb
	.xword	0xb28e3d289df78fad
	.xword	0x47de4fe371d2c838
	.xword	0x41d89ef6f4c1808b
	.xword	0x5e08385161f8dc1f
	.xword	0xe432691a8260aa61
	.xword	0x673a9c6775b0d263
	.xword	0xd1b73eeae5a57c74
	.xword	0xb232c884f6c5bf58
	.xword	0xa59b08c4e3215131
	.xword	0x96e9822cce804a45
	.xword	0xa816d751a86ac818
	.xword	0xdde2e7441c41aea0
	.xword	0x6586673ed3618386
	.xword	0x76ac5f89374eed98
	.xword	0x12ad3e33eed7302c
	.xword	0xd923c0431b6dd50b
	.xword	0x2a168d4edb5d30c4
	.xword	0xbfd1001ee17d2a80
	.xword	0x326764a21b5d9083
	.xword	0xcd5fd568f0ec470e
	.xword	0x647d5a754d865f61
	.xword	0x1724449c63e0b212
	.xword	0xe6ab6530606db576
	.xword	0x57864950e7f0736d
	.xword	0x945500fe662e90a8
	.xword	0x2cbd265c3b53e43b
	.xword	0x97bb91a462c6e4f7
	.xword	0x6dfcf45b52fb628b
	.xword	0x23364d6e85a1cd18
	.xword	0xcc7cd5155bc71615
	.xword	0xcbabf03dc729ea2b
	.xword	0x6d7d06ebe98e2114
	.xword	0xb0d351fdf79d6c1a
	.xword	0x4afceb492368ba02
	.xword	0x1eb12adb15970d30
	.xword	0x99bf976653c6f852
	.xword	0x0e68e3d3cf55232e
	.xword	0xca54eeeea68f1f08
	.xword	0x215e8f2774f3d1de
	.xword	0x703b6eb30a5b62d0
	.xword	0x183d60666d8da57e
	.xword	0x8fdb6d565504bc85
	.xword	0x9a973fea7d099ea9
	.xword	0x35f492ee740d3ba4
	.xword	0x0c656a7a58549cb6
	.xword	0x6889077be5957a2b
	.xword	0xa614bd5e72beb45d
	.xword	0x66877a7dd0e01f0e
	.xword	0x0fa3bc893af50b75
	.xword	0x52b9660516bdb29a
	.xword	0x01a104006b58e70f
	.xword	0x1aa70f8f59b0ea33
	.xword	0x7c22e79b8a5f45d1
	.xword	0xd27c56e01422ee5e
	.xword	0xfae8bf14777ddedd
	.xword	0xe59e57b7d0bd4da6
	.xword	0xcf9423c52294391e
	.xword	0xc4e729d58d7a9469
	.xword	0xb3616b9feb775f47
	.xword	0xfe7e05ad6f3d8e1e
	.xword	0xe8218e7e44aac770
	.xword	0x73b4feb8ac57fbea
	.xword	0x975f264381acc1c8
	.xword	0xb0a8c1f7e9bac6d5
	.xword	0xb4f38d5e83e08ba3
	.xword	0xad4ef4f397f08389
	.xword	0x87aab7fa148f2da9
	.xword	0xe683b4f031197e33
	.xword	0x528c5d36b234382e
	.xword	0x93d99e0efea86caf
	.xword	0xf8c1c504848e2db2
	.xword	0xf0ae6b54fc2f8e45
	.xword	0xf285c8004af8950f
	.xword	0xab878fbce64a42eb
	.xword	0x3bb0c9dae7f4d04b
	.xword	0xab5424232f7d1a45
	.xword	0x81db5705728f72d5
	.xword	0xb7dd570a8757b8b8
	.xword	0x2ac53433b420c9d2
	.xword	0xda58084a32b54ea8
	.xword	0xa5f6bd1c310cc1a6
	.xword	0x8f71683a483d8157
	.xword	0x8da86e864f778d76
	.xword	0xe38e6631ab0ceffa
	.xword	0x9f2da80158aac7f9
	.xword	0xcaa73c2e15ba70cb
	.xword	0x1d513459ea2a4da0
	.xword	0xc23f4816b3c1a308
	.xword	0x8d8eaac70304dc91
	.xword	0xec8c1fb548c51e95
	.xword	0xffb9cc37feeca2ba
	.xword	0x1166b905ad12ad78
	.xword	0xb4df569c69ffa855
	.xword	0x10d0fa58c582b1b8
	.xword	0xe4855e3805070613
	.xword	0x0046626eeb547301
	.xword	0x7d3115bc424afbbf
	.xword	0x023717201f72d24c
	.xword	0x3086e5e48cd84581
	.xword	0x5afaf062dfdfaed5
	.xword	0x1a8403e07a7c16c3
	.xword	0xc2c27cedf0983a14
	.xword	0xae2eb36e99ad5f11
	.xword	0x40d43b1e9a56607e
	.xword	0x9e54ea600327641f
	.xword	0xb094bcee93ada1a0
	.xword	0x67831782d275d28e
	.xword	0xe1df4cd3ee34d3c1
	.xword	0xf77257b0683f98f3
	.xword	0x901214d82c07cad4
	.xword	0x619860b8c8a73622
	.xword	0xddbe3081562fc5b1
	.xword	0xe7d4f3c73bec6294
	.xword	0x31a9c9a8f61976a9
	.xword	0x42a676ed1021de5e
	.xword	0x4933b45cf59d894c
	.xword	0x92994a1a7c05907d
	.xword	0x8dd3c4df16b76a51
	.xword	0x512d8663cf0a57e1
	.xword	0x9b55d1c05fea7386
	.xword	0x3713896cf4c526aa
	.xword	0x30073e2380f58508
	.xword	0x0d7ca8a79a82a99e
	.xword	0x3eeab10a990acf53
	.xword	0x1169e48bab8ca624
	.xword	0x07eef685302489a1
	.xword	0xa79c7b47ea3ca434
	.xword	0xd37ba3f8dbc2e898
	.xword	0x22a4de130d888f86
	.xword	0xc03587cc944fe760
	.xword	0x8e747c44cf250c12
	.xword	0x0bb12ef3bfda1f34
	.xword	0x0cc1da4e8762fd72
	.xword	0x08fbe2d4681ba542
	.xword	0x5aa682365747f96e
	.xword	0x8a36601a902c0bcc
	.xword	0x9ffe0786dd2f9e64
	.xword	0x3b36503aeee8f3fc
	.xword	0x1dcc1d9983f4f1ed
	.xword	0xa7d0ee8d886e3f6b
	.xword	0x9fbb8f96efc5dc09
	.xword	0x293cefee0dac4e5c
	.xword	0xffa7018f258a187f
	.xword	0x29eb1f7f55b5e9c1
	.xword	0x1dce8acacd914ed5
	.xword	0x2f08a70dc3a80807
	.xword	0x55ddcdb797cfb8f5
	.xword	0x73e5afe247a93d88
	.xword	0xa3cc83779d43a3c6
	.xword	0x276a4180e1978080
	.xword	0x43e4b5ee85759fb5
	.xword	0x65ba0d492ebd9263
	.xword	0x1cb7443f9e2e3b04
	.xword	0x80b0e0224495442c
	.xword	0xe73cadb417b7ac25
	.xword	0x0458274534824c9f
	.xword	0xdfe65197685bdffb
	.xword	0x57b2883670957937
	.xword	0x9bc09fb40a44ab2e
	.xword	0xf9c92fecd0234eed
	.xword	0x6c6fdca664ba7b67
	.xword	0x3df7df97b9f05174
	.xword	0x1120a18a2331a605
	.xword	0xc18e39d89162ecf7
	.xword	0xb7a55a9377c19e00
	.xword	0x7c4e9fa4760031fc
	.xword	0x7b897a7c57df6689
	.xword	0x1d7e20c52917d13a
	.xword	0xfb048888232b5ceb
	.xword	0x366d63e952a6f4dd
	.xword	0x307557c44b449a66
	.xword	0x582d4297f4fcc5d7
	.xword	0x644cdb47de7a6c6d
	.xword	0x8818702a2c9f49e7
	.xword	0xb1d7a50385865e09
	.xword	0x4b02995fbad6e044
	.xword	0xa388ae79ba8e7f75
	.xword	0x7eb7fa9e68a06297
	.xword	0xd787472a1aeed05b
	.xword	0xe9394538ba43812f
	.xword	0x79fc782ecfe6fab2
	.xword	0x69a9a1d8e1bd0c63
	.xword	0x1392a351bace5664
	.xword	0x0a1ca61d4e3a8cca
	.xword	0x627b7ae8266fc557
	.xword	0xb0655e1eec10a228
	.xword	0xb697ab7f247302dd
	.xword	0xb7e5699a625a220d
	.xword	0x2d15414152ac6d0d
	.xword	0xe24a4773b6e8c705
	.xword	0x440a3fa31c32c286
	.xword	0x02603cc9de167591
	.align 0x80000
	.data
data_start_7:

	.xword	0x046303f46f6b2641
	.xword	0xd80406c9a0172a2f
	.xword	0x309e60dc515ea343
	.xword	0xdcd9ea17aba984ec
	.xword	0xfb968265c1114993
	.xword	0x32a4901fa725660a
	.xword	0x2c86296321e6d9da
	.xword	0xc4a84dd7334c87c8
	.xword	0x0232b4f3e113ab32
	.xword	0xe1cf9defc689507e
	.xword	0x4a97e36c1947c094
	.xword	0xd27eec9fab18f6bc
	.xword	0xa82803d1731c5587
	.xword	0xc693e5ddd8cc1d17
	.xword	0xd1f3ea5ae376bfff
	.xword	0x93bb742f50fc9be9
	.xword	0x54175db71c4c3977
	.xword	0xcd0c8e9f43055f54
	.xword	0x9989f3e93f8703b1
	.xword	0x36bb9cfa04fbc1ce
	.xword	0xf08697863bbb54bb
	.xword	0xcbdceb85834e9860
	.xword	0x57669216c1c5ad29
	.xword	0x8831a134e43391f4
	.xword	0x2228498e95d84e05
	.xword	0xcf96342459c84440
	.xword	0x73246f75bfcd69ab
	.xword	0x9df5f6297cbd5d93
	.xword	0x2bd937ab2f564f3f
	.xword	0x552c4caf8eb392c1
	.xword	0x1a280e57bf027466
	.xword	0xb801ec4ac50896a5
	.xword	0x89f382bcf25c9a78
	.xword	0x6ec3fa345671585d
	.xword	0x5c8832af2cfa5fe0
	.xword	0x69693521234eaaf0
	.xword	0x8b53438388caa289
	.xword	0x11c8251386743eab
	.xword	0x0d23485c17f681c9
	.xword	0x114c4609537b70d1
	.xword	0x68df289849f2b38a
	.xword	0x0af2fdeab1c15444
	.xword	0x3f607ed97cf2983e
	.xword	0x53583a29509eaf58
	.xword	0x518bae6ff9cb171c
	.xword	0x127f0c5b03adbcc2
	.xword	0x9457c5f772cdfdfc
	.xword	0x597fdc46a919d96c
	.xword	0x27c5bfd6660e84f5
	.xword	0xce7162b1b6e712b6
	.xword	0x187598c40788301b
	.xword	0x1bf3537cba815f53
	.xword	0x570852e202a04df6
	.xword	0x4e2422d9523de5d4
	.xword	0x22c282d7a1665b8f
	.xword	0x61819eea12c75316
	.xword	0x04625367bb997ed9
	.xword	0xed61e0d3ea266d0f
	.xword	0x4c57a76277d78b7a
	.xword	0xe5c76ed999bf83b9
	.xword	0x9591d095fbe2cfdb
	.xword	0x0427feff34d1cdea
	.xword	0x80db42d1f7883ed7
	.xword	0x903304197c5db2bf
	.xword	0x29eb2c6cb1f16de4
	.xword	0x6dc6576e7dae8706
	.xword	0xe12e9aad3e8ffc83
	.xword	0xe39cc4cf934866cf
	.xword	0x1c44f86d3d69ec14
	.xword	0x1ecd2fd2beae9982
	.xword	0xba387c076427b1fe
	.xword	0x3c15284f7ee6dca4
	.xword	0xeb2b1812e66f164a
	.xword	0x3480bf0a0b2a2fea
	.xword	0xf8845b3564362348
	.xword	0x5bc426dcc3d8ee6c
	.xword	0xa8feacbca11e0aad
	.xword	0x591280dee6c075ba
	.xword	0x7383bbaee16cc990
	.xword	0x580472cba722ee9d
	.xword	0x6cd045d6bb7913d0
	.xword	0x336f63f0e8879d54
	.xword	0x7b7a4de219c4327f
	.xword	0x975fab741765a2aa
	.xword	0xd1b2e3da2f3b3c92
	.xword	0x9d3f0da345e0149a
	.xword	0x5f56d5a7e730972f
	.xword	0x465792e456f5f33e
	.xword	0x1d84e8da0b6c73db
	.xword	0x1d0b4ca1fb49bdd3
	.xword	0x69423393c54ba4e3
	.xword	0x3d73ae1c5db54c80
	.xword	0x2cd8b19a35a0832b
	.xword	0x5f7f107faedba727
	.xword	0x5d2b05d4807dfd7b
	.xword	0x3e2d9d177acb942c
	.xword	0xf2f4cb149df0b340
	.xword	0xedb27e78897b01b6
	.xword	0x7d53b0c355682391
	.xword	0xdb62c41f0b1f18b1
	.xword	0xf6b850e474d7c6cc
	.xword	0xc20145d31904baa2
	.xword	0x6ef2747d25a5a365
	.xword	0x3000907ae5f55c43
	.xword	0x835b62bc4146cb69
	.xword	0x32c65bd2dc464b08
	.xword	0xbc093f40cd894bf7
	.xword	0x8e6f25b1c880fbda
	.xword	0x9d1a28ba6fb26452
	.xword	0xb3185a39b93a2e22
	.xword	0xf523b73f9811ada9
	.xword	0x94593cc577479258
	.xword	0x219dd57096d0df71
	.xword	0x2b7badbf588b9289
	.xword	0x1f9ec50ca95a639f
	.xword	0x478a30615f93ab1d
	.xword	0xc75a93e96800f25a
	.xword	0xfe72a4283039b74d
	.xword	0x83212b19e310cde8
	.xword	0x08cae711995eb111
	.xword	0x1d79902ef7f23a59
	.xword	0x503669e777681074
	.xword	0x8765de7de148a56c
	.xword	0x6510bae068167b2b
	.xword	0x7aa1d850fa7afa48
	.xword	0x979bc97fa38118be
	.xword	0x6a6d0ab455ae6885
	.xword	0xca7ef880da511651
	.xword	0xe728fe79bc8e8500
	.xword	0x1bf25b1f780e2abe
	.xword	0xb81c628a7785d08c
	.xword	0x8aae517dbefacd56
	.xword	0x543b93f987352fca
	.xword	0xcc9577ce6596a1c1
	.xword	0xf1a2c98dfcfcf24b
	.xword	0x022599e9e1d9b868
	.xword	0x006e4d3a435ee6eb
	.xword	0xd6d5da9a5f69f873
	.xword	0xd227560a2d327d0f
	.xword	0xf4b811b1ec185d1c
	.xword	0x1ffd4c7e4a99e181
	.xword	0xfa368f2e87ab007e
	.xword	0x399888f042cbdc88
	.xword	0x9fa81721da84af0e
	.xword	0x259942560a09e2ed
	.xword	0x93ae92dc3f935ab8
	.xword	0x054fbfbe4cf8dab1
	.xword	0x8a866a5b7034f260
	.xword	0x4d58885fb0b907ad
	.xword	0xd6d3fb1df5f2b5dd
	.xword	0xea582b4134996635
	.xword	0x463730193531c359
	.xword	0x0dcc584df7931e0e
	.xword	0x05908570fa4fb23d
	.xword	0x9d09ecf2f9c23f15
	.xword	0x82228bb1da900ab4
	.xword	0xda07b996e8f14ff7
	.xword	0x002c207b0c7f998c
	.xword	0x1061da9f40432e71
	.xword	0x49208a32b02a7e7d
	.xword	0x15892bee95b2550c
	.xword	0xb6614fd02a8a3578
	.xword	0xe93122639fb00e8e
	.xword	0x709bf4fe2485360e
	.xword	0xd5933c207b4b4aab
	.xword	0x95a0e8a194685d39
	.xword	0xac239fba056d663c
	.xword	0xb41455df829e0d1f
	.xword	0x202716bc0e668e8f
	.xword	0x10f45f169720b359
	.xword	0x8c1a701c8f033213
	.xword	0x5601b485c68d1310
	.xword	0xd4ee6f29f1e94e4f
	.xword	0xa6191267bbfcd980
	.xword	0x80734c11de7c2fce
	.xword	0xe2c0434a83aecc07
	.xword	0xdb934fa70839c9d5
	.xword	0xbcbbb13518a3c962
	.xword	0x97d9e785b0c434e5
	.xword	0x04917bf400503d60
	.xword	0x3f24e90c5c23af31
	.xword	0x58a492d41ae0e73e
	.xword	0x1ff58e66bde61c4b
	.xword	0xcf3e2c7f2cbf0798
	.xword	0xb4166cc43af0934c
	.xword	0x6c9bca062aae0a71
	.xword	0x404a9b7c50450a05
	.xword	0xdaace8225c7b1594
	.xword	0xf8d0e7d360ec9049
	.xword	0x8fce7c9d47436782
	.xword	0x0e1c4c5b039f4802
	.xword	0x5d6acffc41c6d359
	.xword	0x32a89e732d6ff820
	.xword	0x1e60dfc3e423645e
	.xword	0xb2c44c387d3eb248
	.xword	0xbceb41b6d2e856c4
	.xword	0x4b0321b432a2aae3
	.xword	0x2e335f4f1cd401d5
	.xword	0xe6a95ef6de6c2089
	.xword	0x30798a2d1b829b25
	.xword	0xe3b2e8b00917e98d
	.xword	0xe62286ba82479995
	.xword	0x4c9c1e0805ffd89e
	.xword	0xf144d91b859e4cad
	.xword	0xe7d95ec51259e1d0
	.xword	0x8bbd733e2ebde0f6
	.xword	0x537f0f1fa494f208
	.xword	0xb9ce9edd931ee408
	.xword	0x2bb8ca68145c4f6c
	.xword	0x87b4b2df4d0328fc
	.xword	0x8dd9b19f1ff86fb6
	.xword	0x731b98bb36bcdfa4
	.xword	0x590ddc1d7c8f65a1
	.xword	0x2a508eec0e771c9d
	.xword	0x077969defc595153
	.xword	0xc757e6c357056d82
	.xword	0x40e893f1a1ec3836
	.xword	0xa9f6e7f40d2ff2f2
	.xword	0xc7103c37d3e0021b
	.xword	0x48d9c552d109a385
	.xword	0xbe3c46b97b2dc19e
	.xword	0xc1127148085c7a5d
	.xword	0x2cc11274920fc78d
	.xword	0xd1b42d30e1bd0032
	.xword	0x42f5bc4c9ba20502
	.xword	0x815c0e7b79c3c358
	.xword	0x4c7127e1c93a88f7
	.xword	0x0eb98fe6e1164db7
	.xword	0x46c73eede4e639ce
	.xword	0xb2b51c72571daeb8
	.xword	0xe432d6afd59e0c19
	.xword	0xdccfa7b7583a2d73
	.xword	0x559b9ed3915d6e16
	.xword	0xb269a51a4c35232a
	.xword	0x295d0c1a9d466751
	.xword	0x355e42968aa74cc2
	.xword	0x7d39dafa01575684
	.xword	0x43ac9f691892accb
	.xword	0x0b78e667e540d86c
	.xword	0x8fdc1cc9933464ba
	.xword	0x4bcd4d96f16cfa91
	.xword	0x2ecdac7b7692a56f
	.xword	0xbbd90e435d522b93
	.xword	0x27e518b3bea01109
	.xword	0xf4cc1841aaa3cb95
	.xword	0x87b19a41f0571596
	.xword	0x500fc0f88d24fe19
	.xword	0xa3800a0f39810ddb
	.xword	0x653eab9c775d150c
	.xword	0x84dba8a8717ee331
	.xword	0x42a7158719765269
	.xword	0x1e187fe0b6fa84b3
	.xword	0x9a3fc127d82bd0ca
	.xword	0x20861bba174b2244
	.xword	0xfb18e7b9bf9c7373
	.xword	0x5ecd5dd555c5dccb



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
