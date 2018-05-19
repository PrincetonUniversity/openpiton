// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_70.s
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
   random seed:	750319441
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

	setx 0x4e71ea6ced41b0da, %g1, %g0
	setx 0x107ef1b2f6c80948, %g1, %g1
	setx 0x55753598d8e88bb8, %g1, %g2
	setx 0x83f8b4c44f6f382e, %g1, %g3
	setx 0xb6078b7ccf3f12b9, %g1, %g4
	setx 0xf69f0633f7eec704, %g1, %g5
	setx 0x8659689bfeb89a83, %g1, %g6
	setx 0xefacafe146841ed0, %g1, %g7
	setx 0x6bb4afcdcfb6b90d, %g1, %r16
	setx 0xe8eaa583f1409e38, %g1, %r17
	setx 0xbe1a5ab322820fbb, %g1, %r18
	setx 0x39bacb8b714a332d, %g1, %r19
	setx 0x8b18e71c6a3c260a, %g1, %r20
	setx 0xc3f4c3ffbfbbbaa6, %g1, %r21
	setx 0xe4d74ee1c3a338e7, %g1, %r22
	setx 0xb05570a7f147c00e, %g1, %r23
	setx 0xab5c2bcd0006fb66, %g1, %r24
	setx 0x4a58eb4296168deb, %g1, %r25
	setx 0x64e779b28f4d80e3, %g1, %r26
	setx 0xb1374cf9fe92e083, %g1, %r27
	setx 0x405e1dd943d569d3, %g1, %r28
	setx 0x9880c26c6905c102, %g1, %r29
	setx 0x4ccb938acb583a66, %g1, %r30
	setx 0x4339112e87efa501, %g1, %r31
	save
	setx 0x70b4f24bd82b0a95, %g1, %r16
	setx 0x935cfb38a61a0806, %g1, %r17
	setx 0x049322d040b452e1, %g1, %r18
	setx 0xa7596e4075166f23, %g1, %r19
	setx 0x7b127263619f4bc2, %g1, %r20
	setx 0xbf2174b6039fb9ae, %g1, %r21
	setx 0x0a97d9defc6ec3ee, %g1, %r22
	setx 0x22829d811e6be652, %g1, %r23
	setx 0x87015b43251cd3b0, %g1, %r24
	setx 0x1860f938b34b7b61, %g1, %r25
	setx 0x05f5f966e6e37ff1, %g1, %r26
	setx 0x762aa596d22f5401, %g1, %r27
	setx 0xea2b96d60b36fc70, %g1, %r28
	setx 0x3903c1ece28b3326, %g1, %r29
	setx 0x9467fe7ef9b5d41d, %g1, %r30
	setx 0x0f6f74f3a7c7d2a5, %g1, %r31
	save
	setx 0xd5c9fd41ef7109ca, %g1, %r16
	setx 0x08153c7259d2b986, %g1, %r17
	setx 0x5b2225a69aa1bf4c, %g1, %r18
	setx 0x4532aa3c2b4849ea, %g1, %r19
	setx 0x5ef2fb3765a0bceb, %g1, %r20
	setx 0x31bddf15e4029a44, %g1, %r21
	setx 0x83c351f0d9418ae2, %g1, %r22
	setx 0x7a8cbad636f6ef45, %g1, %r23
	setx 0x4a26e4a17ae9df8b, %g1, %r24
	setx 0x5cdcd44ae332df41, %g1, %r25
	setx 0x25d18e422d7981e3, %g1, %r26
	setx 0xf989bd46cb2f272c, %g1, %r27
	setx 0x7726b7066fed2e84, %g1, %r28
	setx 0x409dcfd4ed1c0706, %g1, %r29
	setx 0x712a714c14f4035d, %g1, %r30
	setx 0x94a8e656f245ee8a, %g1, %r31
	save
	setx 0x1af669a8c5536ecc, %g1, %r16
	setx 0x2b2f6bc27c4d0c01, %g1, %r17
	setx 0x1010378e9bf7f911, %g1, %r18
	setx 0x3ca53813ef653422, %g1, %r19
	setx 0x0e692a994629670d, %g1, %r20
	setx 0xf6681bfe5ab6f06d, %g1, %r21
	setx 0xae3669cedc94c8fd, %g1, %r22
	setx 0x3604f99f305f470e, %g1, %r23
	setx 0x715e22ed641e116f, %g1, %r24
	setx 0x61f2627ee024145d, %g1, %r25
	setx 0x180f6f6d288657dc, %g1, %r26
	setx 0x603b2afcd742ccee, %g1, %r27
	setx 0x41b0358d5aecac3d, %g1, %r28
	setx 0xdc997f04b52547f6, %g1, %r29
	setx 0x11262827a4e9acac, %g1, %r30
	setx 0x37a8bfe4db0beea2, %g1, %r31
	save
	setx 0xc889f76cd8072e69, %g1, %r16
	setx 0xd2303131114884bb, %g1, %r17
	setx 0x84f8fa2694e9935b, %g1, %r18
	setx 0x5bf713808b1b76f5, %g1, %r19
	setx 0x5dc05ff572980780, %g1, %r20
	setx 0xb172f08d18a5d98a, %g1, %r21
	setx 0x89aee4a14c679f30, %g1, %r22
	setx 0xa3d81a79dabe262e, %g1, %r23
	setx 0xa71851ce73ead650, %g1, %r24
	setx 0xff4c04809d56a576, %g1, %r25
	setx 0x84a63b303143d02d, %g1, %r26
	setx 0x67f8a5d8be898177, %g1, %r27
	setx 0x00002a15febed124, %g1, %r28
	setx 0x5a76b20884daf220, %g1, %r29
	setx 0x79471609b33d5dbb, %g1, %r30
	setx 0xc432123bd7ca5716, %g1, %r31
	save
	setx 0x97312d42ff0d404d, %g1, %r16
	setx 0x10c1e00d92ba3ae8, %g1, %r17
	setx 0xb988cad3f8b50f44, %g1, %r18
	setx 0xeba47ade98bb8728, %g1, %r19
	setx 0xee625dcb2ea23f4e, %g1, %r20
	setx 0x14865093699dc340, %g1, %r21
	setx 0xa81f98079e4aefc2, %g1, %r22
	setx 0xe4e8142e85695019, %g1, %r23
	setx 0x6da4d5b0b9bde992, %g1, %r24
	setx 0x6744ec4bd76eac2f, %g1, %r25
	setx 0xe772d9ecd089df2b, %g1, %r26
	setx 0x66116b330c2db88a, %g1, %r27
	setx 0xe0123f3760d0f4cc, %g1, %r28
	setx 0x90882459f91fefd8, %g1, %r29
	setx 0xb876202767fe0400, %g1, %r30
	setx 0x1896bea2fee2488c, %g1, %r31
	save
	setx 0xdf1dbcb14a661434, %g1, %r16
	setx 0x5b87533dee18104f, %g1, %r17
	setx 0xba130ac4400525fd, %g1, %r18
	setx 0xb72590abd17ec299, %g1, %r19
	setx 0x6e6956e074a6e82f, %g1, %r20
	setx 0x590773a0ee79d140, %g1, %r21
	setx 0x6bd02ce7df0a87c6, %g1, %r22
	setx 0x247820948314699c, %g1, %r23
	setx 0xa64ebf37c32e9fd9, %g1, %r24
	setx 0xa69ed0861ba78e5c, %g1, %r25
	setx 0x7fd1e6ebb087e5cf, %g1, %r26
	setx 0x1fe668ab97e782a7, %g1, %r27
	setx 0x5fc60e2d04e679a3, %g1, %r28
	setx 0x30c46bd04f544168, %g1, %r29
	setx 0x1892e45be99847af, %g1, %r30
	setx 0xdac3795cec55f19f, %g1, %r31
	save
	setx 0x26b7fbd04b16139f, %g1, %r16
	setx 0x1c24c8ea4f73a426, %g1, %r17
	setx 0xde7654cec978e97b, %g1, %r18
	setx 0xf0714f325a76824d, %g1, %r19
	setx 0xdd73e3717d4d50db, %g1, %r20
	setx 0x38c505935fdcd1c7, %g1, %r21
	setx 0xbb067cf3ffc3628e, %g1, %r22
	setx 0x76aabc665a914715, %g1, %r23
	setx 0x6c9302da71ccbe9b, %g1, %r24
	setx 0xb38ebffd822c1098, %g1, %r25
	setx 0x2198e6a5366e8328, %g1, %r26
	setx 0x4ecef5606cafd660, %g1, %r27
	setx 0x7ac02a601a7d2fbb, %g1, %r28
	setx 0xbec496384f8265a3, %g1, %r29
	setx 0xb003dd0f0206ef43, %g1, %r30
	setx 0xaa5ddba7c4c4ab78, %g1, %r31
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
	.word 0xb7e520ab  ! 2: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_4, %g1, %r22
	.word 0xb93c7001  ! 15: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xb5e4a108  ! 16: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4a13e  ! 17: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e56114  ! 19: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0x8d94e0e6  ! 21: WRPR_PSTATE_I	wrpr	%r19, 0x00e6, %pstate
	.word 0x8395e096  ! 22: WRPR_TNPC_I	wrpr	%r23, 0x0096, %tnpc
	.word 0xbde5a1c0  ! 25: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x919460ef  ! 26: WRPR_PIL_I	wrpr	%r17, 0x00ef, %pil
	.word 0xbde4a115  ! 27: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8594e134  ! 28: WRPR_TSTATE_I	wrpr	%r19, 0x0134, %tstate
	.word 0xbf3c0000  ! 29: SRA_R	sra 	%r16, %r0, %r31
	.word 0xbde461b5  ! 30: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7518000  ! 34: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e421f0  ! 35: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb5480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4607f  ! 55: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb0bd0000  ! 56: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0x83946078  ! 57: WRPR_TNPC_I	wrpr	%r17, 0x0078, %tnpc
	.word 0xb3e561de  ! 61: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5211b  ! 63: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb0244000  ! 65: SUB_R	sub 	%r17, %r0, %r24
	.word 0xb7e420ea  ! 66: SAVE_I	save	%r16, 0x0001, %r27
	setx	0xc145b65900008c55, %g1, %r10
	.word 0x839a8000  ! 71: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4a124  ! 72: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4e00d  ! 75: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3510000  ! 76: RDPR_TICK	<illegal instruction>
	.word 0xb9518000  ! 84: RDPR_PSTATE	<illegal instruction>
	.word 0xb1540000  ! 85: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xb57de401  ! 89: MOVR_I	movre	%r23, 0x1, %r26
	.word 0xbbe5615a  ! 91: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7480000  ! 93: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0xe3f7caf800005bdb, %g1, %r10
	.word 0x819a8000  ! 98: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xbde5a0da  ! 102: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb751c000  ! 103: RDPR_TL	<illegal instruction>
	.word 0x89952023  ! 105: WRPR_TICK_I	wrpr	%r20, 0x0023, %tick
	.word 0xbfe4a089  ! 107: SAVE_I	save	%r18, 0x0001, %r31
	mov	1, %r12
	.word 0x8f930000  ! 109: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4a00d  ! 110: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5a077  ! 113: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 120: RDPR_GL	<illegal instruction>
	.word 0xbde46010  ! 121: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a16d  ! 124: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb62dc000  ! 126: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbf359000  ! 127: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xbbe4a1a4  ! 128: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e5208d  ! 129: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8195e143  ! 130: WRPR_TPC_I	wrpr	%r23, 0x0143, %tpc
	.word 0xbde5e194  ! 131: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1510000  ! 132: RDPR_TICK	<illegal instruction>
	.word 0xb3e42143  ! 133: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb43c20a8  ! 135: XNOR_I	xnor 	%r16, 0x00a8, %r26
	.word 0xbb504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0xb20c8000  ! 141: AND_R	and 	%r18, %r0, %r25
	setx	data_start_5, %g1, %r18
	mov	1, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e561fa  ! 157: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4219a  ! 158: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x919460a0  ! 160: WRPR_PIL_I	wrpr	%r17, 0x00a0, %pil
	.word 0xb5e4a19e  ! 164: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4a111  ! 166: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb342001  ! 168: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xb61c0000  ! 169: XOR_R	xor 	%r16, %r0, %r27
	.word 0xb5e4205c  ! 173: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xbcb52121  ! 177: SUBCcc_I	orncc 	%r20, 0x0121, %r30
	.word 0xb32dc000  ! 180: SLL_R	sll 	%r23, %r0, %r25
	.word 0xb9e5609b  ! 181: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e46147  ! 183: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6156159  ! 184: OR_I	or 	%r21, 0x0159, %r27
	.word 0x8594a116  ! 188: WRPR_TSTATE_I	wrpr	%r18, 0x0116, %tstate
	.word 0xb5e561a7  ! 190: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5a180  ! 192: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5e08e  ! 195: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4e1aa  ! 198: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb835a08c  ! 199: ORN_I	orn 	%r22, 0x008c, %r28
	.word 0xb3e5e009  ! 203: SAVE_I	save	%r23, 0x0001, %r25
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 206: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e5e1db  ! 208: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbea42046  ! 209: SUBcc_I	subcc 	%r16, 0x0046, %r31
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460d0  ! 213: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4e104  ! 214: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe4e161  ! 216: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4e173  ! 217: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e520a3  ! 218: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5e197  ! 219: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4e1b8  ! 222: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8995219a  ! 223: WRPR_TICK_I	wrpr	%r20, 0x019a, %tick
	.word 0xb1508000  ! 224: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e46010  ! 225: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9540000  ! 226: RDPR_GL	<illegal instruction>
	.word 0xb9e5a0c1  ! 229: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x83952100  ! 230: WRPR_TNPC_I	wrpr	%r20, 0x0100, %tnpc
	.word 0xbd540000  ! 231: RDPR_GL	<illegal instruction>
	.word 0xbfe4a133  ! 232: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd504000  ! 236: RDPR_TNPC	<illegal instruction>
	.word 0xb9540000  ! 239: RDPR_GL	<illegal instruction>
	.word 0x8795206d  ! 240: WRPR_TT_I	wrpr	%r20, 0x006d, %tt
	.word 0xb43561ed  ! 242: SUBC_I	orn 	%r21, 0x01ed, %r26
	.word 0xbde52189  ! 244: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8795e069  ! 245: WRPR_TT_I	wrpr	%r23, 0x0069, %tt
	.word 0xb1510000  ! 247: RDPR_TICK	<illegal instruction>
	.word 0xbfe521a4  ! 248: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4e1c9  ! 249: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e521ca  ! 251: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_4, %g1, %r21
	.word 0xbfe4e1bc  ! 257: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5e185  ! 262: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbc9dc000  ! 263: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xb950c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xbbe461ba  ! 267: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e420a5  ! 271: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e4a1d2  ! 274: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4e09a  ! 275: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e460ff  ! 277: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x819521ea  ! 283: WRPR_TPC_I	wrpr	%r20, 0x01ea, %tpc
	.word 0x8194e17b  ! 285: WRPR_TPC_I	wrpr	%r19, 0x017b, %tpc
	.word 0xb4254000  ! 286: SUB_R	sub 	%r21, %r0, %r26
	.word 0xbbe42166  ! 287: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4e144  ! 288: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x7d33a6b10000ca1f, %g1, %r10
	.word 0x839a8000  ! 291: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb01ce1ec  ! 292: XOR_I	xor 	%r19, 0x01ec, %r24
	.word 0xb151c000  ! 293: RDPR_TL	<illegal instruction>
	.word 0xb5e4e185  ! 299: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1a9  ! 301: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5206c  ! 304: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x919460a7  ! 308: WRPR_PIL_I	wrpr	%r17, 0x00a7, %pil
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 312: RDPR_TL	<illegal instruction>
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e421cc  ! 318: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e521cb  ! 319: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb0850000  ! 323: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xbde4e0b7  ! 324: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e520e6  ! 325: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5e0cf  ! 326: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5a08e  ! 328: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf520000  ! 330: RDPR_PIL	<illegal instruction>
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52114  ! 336: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1641800  ! 339: MOVcc_R	<illegal instruction>
	.word 0xbde5e090  ! 342: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e56100  ! 344: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x8092f1250000dcdb, %g1, %r10
	.word 0x839a8000  ! 346: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e15d  ! 350: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8d94a141  ! 351: WRPR_PSTATE_I	wrpr	%r18, 0x0141, %pstate
	.word 0x8195e1c2  ! 353: WRPR_TPC_I	wrpr	%r23, 0x01c2, %tpc
	.word 0xbde5e036  ! 361: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4606f  ! 367: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe460ae  ! 368: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb035a1da  ! 376: SUBC_I	orn 	%r22, 0x01da, %r24
	.word 0xb3e56093  ! 382: SAVE_I	save	%r21, 0x0001, %r25
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0xb5354000  ! 385: SRL_R	srl 	%r21, %r0, %r26
	.word 0xbfe52044  ! 386: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4a009  ! 388: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe420af  ! 389: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5618f  ! 391: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 399: RDPR_TL	<illegal instruction>
	.word 0xbde4e020  ! 400: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3518000  ! 401: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe56190  ! 403: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4e180  ! 406: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb60de123  ! 407: AND_I	and 	%r23, 0x0123, %r27
	.word 0xbde4a131  ! 416: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde42060  ! 419: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8794a184  ! 423: WRPR_TT_I	wrpr	%r18, 0x0184, %tt
	.word 0xb49521ee  ! 424: ORcc_I	orcc 	%r20, 0x01ee, %r26
	.word 0xb1e5a10f  ! 425: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde520de  ! 429: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5200e  ! 430: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe52084  ! 434: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e42039  ! 437: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe460fc  ! 439: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x819420ab  ! 441: WRPR_TPC_I	wrpr	%r16, 0x00ab, %tpc
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46164  ! 453: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb150c000  ! 455: RDPR_TT	<illegal instruction>
	.word 0xbde4a159  ! 456: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb2c52055  ! 458: ADDCcc_I	addccc 	%r20, 0x0055, %r25
	.word 0xb951c000  ! 459: RDPR_TL	<illegal instruction>
	.word 0xbbe4616b  ! 460: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5e042  ! 461: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe420c4  ! 462: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde520c7  ! 467: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8995a143  ! 469: WRPR_TICK_I	wrpr	%r22, 0x0143, %tick
	.word 0xbbe5a0f5  ! 470: SAVE_I	save	%r22, 0x0001, %r29
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a04e  ! 477: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1fa  ! 483: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7480000  ! 488: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e56180  ! 492: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e461a9  ! 493: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde42019  ! 495: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe46184  ! 497: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e56131  ! 499: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e4e05d  ! 500: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4209a  ! 502: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7480000  ! 503: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb8a520a3  ! 509: SUBcc_I	subcc 	%r20, 0x00a3, %r28
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xb5520000  ! 519: RDPR_PIL	<illegal instruction>
	.word 0xb3480000  ! 521: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0, %r12
	.word 0xa1930000  ! 522: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x859420ab  ! 523: WRPR_TSTATE_I	wrpr	%r16, 0x00ab, %tstate
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 527: RDPR_PIL	<illegal instruction>
	.word 0xb81ca104  ! 528: XOR_I	xor 	%r18, 0x0104, %r28
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4618d  ! 533: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e560a5  ! 537: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x899461da  ! 540: WRPR_TICK_I	wrpr	%r17, 0x01da, %tick
	.word 0xb9e5614c  ! 541: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4604b  ! 543: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe560c2  ! 545: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf508000  ! 550: RDPR_TSTATE	<illegal instruction>
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4204b  ! 553: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e46123  ! 559: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7504000  ! 560: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a18a  ! 563: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4614e  ! 564: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a0d4  ! 566: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe4a127  ! 567: SAVE_I	save	%r18, 0x0001, %r29
	setx	0x30f9aebb00003d89, %g1, %r10
	.word 0x819a8000  ! 569: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbab420a2  ! 579: SUBCcc_I	orncc 	%r16, 0x00a2, %r29
	.word 0xb7e5a009  ! 585: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x5e1232c600002b4a, %g1, %r10
	.word 0x819a8000  ! 587: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x3463661200006844, %g1, %r10
	.word 0x819a8000  ! 589: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaac0000  ! 596: ANDNcc_R	andncc 	%r16, %r0, %r29
	.word 0xbbe5a118  ! 597: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5e14c  ! 598: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x839520f8  ! 600: WRPR_TNPC_I	wrpr	%r20, 0x00f8, %tnpc
	.word 0x8d956161  ! 606: WRPR_PSTATE_I	wrpr	%r21, 0x0161, %pstate
	mov	0, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5a07e  ! 609: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe56065  ! 611: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e0b4  ! 612: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x85952122  ! 614: WRPR_TSTATE_I	wrpr	%r20, 0x0122, %tstate
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a085  ! 621: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb4846081  ! 622: ADDcc_I	addcc 	%r17, 0x0081, %r26
	.word 0xbbe520ce  ! 626: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf520000  ! 627: RDPR_PIL	<illegal instruction>
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46078  ! 636: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735a001  ! 642: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xb1e5613b  ! 643: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe42119  ! 646: SAVE_I	save	%r16, 0x0001, %r29
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a05a  ! 648: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42041  ! 650: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e460bc  ! 652: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5e146  ! 658: SAVE_I	save	%r23, 0x0001, %r29
	setx	data_start_1, %g1, %r23
	.word 0xb5e5e1b2  ! 665: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde560e3  ! 666: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4a1e9  ! 670: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a121  ! 671: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4e167  ! 672: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5611d  ! 674: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e037  ! 676: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e521df  ! 678: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc946179  ! 679: ORcc_I	orcc 	%r17, 0x0179, %r30
	.word 0xb6b4e0aa  ! 682: ORNcc_I	orncc 	%r19, 0x00aa, %r27
	setx	data_start_1, %g1, %r17
	.word 0xb3e4a055  ! 685: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe521fd  ! 686: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e56192  ! 687: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4a07a  ! 689: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd510000  ! 690: RDPR_TICK	<illegal instruction>
	.word 0xb1510000  ! 694: RDPR_TICK	<illegal instruction>
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5607e  ! 697: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e561fd  ! 700: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e4216a  ! 701: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe56058  ! 704: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe420f8  ! 705: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x819521ca  ! 707: WRPR_TPC_I	wrpr	%r20, 0x01ca, %tpc
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a1e7  ! 718: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb044e098  ! 719: ADDC_I	addc 	%r19, 0x0098, %r24
	.word 0xbd7d8400  ! 721: MOVR_R	movre	%r22, %r0, %r30
	.word 0xb5e560bb  ! 723: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5e145  ! 726: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e56062  ! 727: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5e1ba  ! 728: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a1c3  ! 729: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3520000  ! 730: RDPR_PIL	<illegal instruction>
	.word 0xb9e4e112  ! 733: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4e1f1  ! 735: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e5a14f  ! 737: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a13b  ! 742: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e128  ! 747: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5201d  ! 748: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e46076  ! 749: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4a1d5  ! 750: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e52049  ! 752: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd352001  ! 755: SRL_I	srl 	%r20, 0x0001, %r30
	.word 0x9194a15e  ! 757: WRPR_PIL_I	wrpr	%r18, 0x015e, %pil
	.word 0x8d952034  ! 758: WRPR_PSTATE_I	wrpr	%r20, 0x0034, %pstate
	.word 0xbbe4e1fc  ! 759: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_1, %g1, %r22
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 765: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb351c000  ! 766: RDPR_TL	<illegal instruction>
	.word 0xb3e4a089  ! 767: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e520ce  ! 768: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_7, %g1, %r17
	.word 0xbde4a112  ! 773: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a182  ! 778: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe56062  ! 781: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4612c  ! 782: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1af  ! 789: SAVE_I	save	%r22, 0x0001, %r24
	setx	0x788074e000006c8a, %g1, %r10
	.word 0x839a8000  ! 790: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe5614d  ! 796: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_1, %g1, %r16
	.word 0xbc844000  ! 798: ADDcc_R	addcc 	%r17, %r0, %r30
	.word 0xbbe5e0c1  ! 800: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5e08a  ! 802: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4a016  ! 803: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbd3c7001  ! 807: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xb5e5603a  ! 811: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf510000  ! 813: RDPR_TICK	<illegal instruction>
	.word 0xbbe561dc  ! 814: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 818: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbde5218d  ! 821: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb550c000  ! 823: RDPR_TT	<illegal instruction>
	.word 0x8794e05e  ! 825: WRPR_TT_I	wrpr	%r19, 0x005e, %tt
	.word 0xb3e4e133  ! 826: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbc1c0000  ! 836: XOR_R	xor 	%r16, %r0, %r30
	.word 0xb9e4a1ec  ! 837: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe421c4  ! 839: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb40d607d  ! 842: AND_I	and 	%r21, 0x007d, %r26
	.word 0xbfe5e15c  ! 843: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe560d8  ! 845: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561e6  ! 853: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe421f5  ! 854: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e46092  ! 857: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8595a110  ! 861: WRPR_TSTATE_I	wrpr	%r22, 0x0110, %tstate
	.word 0xb1e5e194  ! 862: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe46030  ! 865: SAVE_I	save	%r17, 0x0001, %r31
	setx	0xb0e75b9a0000791b, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e420ae  ! 867: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e5a0fd  ! 868: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8995202d  ! 872: WRPR_TICK_I	wrpr	%r20, 0x002d, %tick
	.word 0xb9e4615d  ! 876: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4e196  ! 879: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e5a0ed  ! 880: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e5e190  ! 882: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e4a08e  ! 887: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe46086  ! 889: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e461c5  ! 891: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb80d2064  ! 894: AND_I	and 	%r20, 0x0064, %r28
	.word 0xbde4a1d5  ! 897: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e46122  ! 898: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e520b3  ! 900: SAVE_I	save	%r20, 0x0001, %r24
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 903: RDPR_TT	<illegal instruction>
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 907: RDPR_PIL	<illegal instruction>
	.word 0xb9e521f1  ! 908: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3510000  ! 912: RDPR_TICK	<illegal instruction>
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42105  ! 916: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe520ff  ! 917: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e52061  ! 920: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e007  ! 926: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0x8395a09f  ! 944: WRPR_TNPC_I	wrpr	%r22, 0x009f, %tnpc
	.word 0xbde520d1  ! 946: SAVE_I	save	%r20, 0x0001, %r30
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a161  ! 951: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe56059  ! 953: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe52071  ! 957: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e460a7  ! 958: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7520000  ! 959: RDPR_PIL	<illegal instruction>
	.word 0xbde52124  ! 961: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbf353001  ! 962: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xb3e42069  ! 964: SAVE_I	save	%r16, 0x0001, %r25
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	.word 0xba85c000  ! 969: ADDcc_R	addcc 	%r23, %r0, %r29
	.word 0xbfe4a1ae  ! 976: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5603b  ! 977: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5e007  ! 978: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8795e190  ! 979: WRPR_TT_I	wrpr	%r23, 0x0190, %tt
	mov	1, %r12
	.word 0xa1930000  ! 986: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e5a0c2  ! 987: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a10c  ! 988: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4e14c  ! 989: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf51c000  ! 990: RDPR_TL	<illegal instruction>
	.word 0xb3e42089  ! 994: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9643801  ! 995: MOVcc_I	<illegal instruction>
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
	.word 0xf874e1c1  ! 9: STX_I	stx	%r28, [%r19 + 0x01c1]
	.word 0xf22c8000  ! 11: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf875a0ed  ! 12: STX_I	stx	%r28, [%r22 + 0x00ed]
	.word 0xfb3d21fd  ! 13: STDF_I	std	%f29, [0x01fd, %r20]
	setx	data_start_0, %g1, %r20
	.word 0xb53df001  ! 15: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xfa754000  ! 18: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb9510000  ! 20: RDPR_TICK	rdpr	%tick, %r28
	.word 0x8d94213f  ! 21: WRPR_PSTATE_I	wrpr	%r16, 0x013f, %pstate
	.word 0x83946138  ! 22: WRPR_TNPC_I	wrpr	%r17, 0x0138, %tnpc
	.word 0x91956183  ! 26: WRPR_PIL_I	wrpr	%r21, 0x0183, %pil
	.word 0x85942114  ! 28: WRPR_TSTATE_I	wrpr	%r16, 0x0114, %tstate
	.word 0xbb3d8000  ! 29: SRA_R	sra 	%r22, %r0, %r29
	.word 0xfd3c0000  ! 31: STDF_R	std	%f30, [%r0, %r16]
	.word 0xbf518000  ! 34: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf22c8000  ! 36: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf0248000  ! 37: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf73d21b9  ! 39: STDF_I	std	%f27, [0x01b9, %r20]
	.word 0xb7480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf074a01c  ! 41: STX_I	stx	%r24, [%r18 + 0x001c]
	.word 0xf8758000  ! 43: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xb9480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf8252141  ! 49: STW_I	stw	%r28, [%r20 + 0x0141]
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24605c  ! 51: STW_I	stw	%r30, [%r17 + 0x005c]
	.word 0xfa25e010  ! 53: STW_I	stw	%r29, [%r23 + 0x0010]
	.word 0xb4bc8000  ! 56: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0x8395e179  ! 57: WRPR_TNPC_I	wrpr	%r23, 0x0179, %tnpc
	.word 0xfb3cc000  ! 60: STDF_R	std	%f29, [%r0, %r19]
	.word 0xb6254000  ! 65: SUB_R	sub 	%r21, %r0, %r27
	.word 0xff3d209f  ! 67: STDF_I	std	%f31, [0x009f, %r20]
	.word 0xf22c0000  ! 70: STB_R	stb	%r25, [%r16 + %r0]
	setx	0x8ce7ecd60000bb9d, %g1, %r10
	.word 0x839a8000  ! 71: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf63c20dd  ! 73: STD_I	std	%r27, [%r16 + 0x00dd]
	.word 0xbb510000  ! 76: RDPR_TICK	rdpr	%tick, %r29
	.word 0xf035a0d1  ! 77: STH_I	sth	%r24, [%r22 + 0x00d1]
	.word 0xfe3c0000  ! 79: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfc2c0000  ! 80: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf13d8000  ! 81: STDF_R	std	%f24, [%r0, %r22]
	.word 0xfe3da006  ! 82: STD_I	std	%r31, [%r22 + 0x0006]
	.word 0xfe2c0000  ! 83: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb1518000  ! 84: RDPR_PSTATE	<illegal instruction>
	.word 0xb3540000  ! 85: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r16
	.word 0xb37c2401  ! 89: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xf03ca0a6  ! 90: STD_I	std	%r24, [%r18 + 0x00a6]
	.word 0xb9480000  ! 93: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf43cc000  ! 96: STD_R	std	%r26, [%r19 + %r0]
	setx	0x526d92f00000eb9c, %g1, %r10
	.word 0x819a8000  ! 98: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xfc24a17b  ! 101: STW_I	stw	%r30, [%r18 + 0x017b]
	.word 0xb551c000  ! 103: RDPR_TL	rdpr	%tl, %r26
	.word 0x8994200b  ! 105: WRPR_TICK_I	wrpr	%r16, 0x000b, %tick
	.word 0xf02c4000  ! 106: STB_R	stb	%r24, [%r17 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 109: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8754000  ! 114: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf03c21b5  ! 115: STD_I	std	%r24, [%r16 + 0x01b5]
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 120: RDPR_GL	rdpr	%-, %r30
	.word 0xf13c6119  ! 123: STDF_I	std	%f24, [0x0119, %r17]
	.word 0xbc2dc000  ! 126: ANDN_R	andn 	%r23, %r0, %r30
	.word 0xb1349000  ! 127: SRLX_R	srlx	%r18, %r0, %r24
	.word 0x8195e10f  ! 130: WRPR_TPC_I	wrpr	%r23, 0x010f, %tpc
	.word 0xb7510000  ! 132: RDPR_TICK	rdpr	%tick, %r27
	.word 0xb43da113  ! 135: XNOR_I	xnor 	%r22, 0x0113, %r26
	.word 0xbb504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0xf13c4000  ! 139: STDF_R	std	%f24, [%r0, %r17]
	.word 0xb00d4000  ! 141: AND_R	and 	%r21, %r0, %r24
	.word 0xfe7521a2  ! 145: STX_I	stx	%r31, [%r20 + 0x01a2]
	.word 0xfc2d4000  ! 146: STB_R	stb	%r30, [%r21 + %r0]
	setx	data_start_6, %g1, %r23
	.word 0xf2252085  ! 151: STW_I	stw	%r25, [%r20 + 0x0085]
	.word 0xf62ca15e  ! 152: STB_I	stb	%r27, [%r18 + 0x015e]
	.word 0xf4340000  ! 153: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf624c000  ! 154: STW_R	stw	%r27, [%r19 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf024c000  ! 159: STW_R	stw	%r24, [%r19 + %r0]
	.word 0x919561c5  ! 160: WRPR_PIL_I	wrpr	%r21, 0x01c5, %pil
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7352001  ! 168: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xba1c8000  ! 169: XOR_R	xor 	%r18, %r0, %r29
	.word 0xf03ca122  ! 174: STD_I	std	%r24, [%r18 + 0x0122]
	.word 0xb9504000  ! 175: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb0b46169  ! 177: SUBCcc_I	orncc 	%r17, 0x0169, %r24
	.word 0xf82ca010  ! 179: STB_I	stb	%r28, [%r18 + 0x0010]
	.word 0xb92c4000  ! 180: SLL_R	sll 	%r17, %r0, %r28
	.word 0xb6142135  ! 184: OR_I	or 	%r16, 0x0135, %r27
	.word 0xfe3c0000  ! 185: STD_R	std	%r31, [%r16 + %r0]
	.word 0x859461b5  ! 188: WRPR_TSTATE_I	wrpr	%r17, 0x01b5, %tstate
	.word 0xf03ce160  ! 189: STD_I	std	%r24, [%r19 + 0x0160]
	.word 0xfc2da1c9  ! 194: STB_I	stb	%r30, [%r22 + 0x01c9]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb435600b  ! 199: ORN_I	orn 	%r21, 0x000b, %r26
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13d6086  ! 205: STDF_I	std	%f24, [0x0086, %r21]
	mov	0, %r12
	.word 0xa1930000  ! 206: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc3dc000  ! 207: STD_R	std	%r30, [%r23 + %r0]
	.word 0xb0a520d8  ! 209: SUBcc_I	subcc 	%r20, 0x00d8, %r24
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e1b1  ! 223: WRPR_TICK_I	wrpr	%r19, 0x01b1, %tick
	.word 0xbd508000  ! 224: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb1540000  ! 226: RDPR_GL	<illegal instruction>
	.word 0x8394a18c  ! 230: WRPR_TNPC_I	wrpr	%r18, 0x018c, %tnpc
	.word 0xb9540000  ! 231: RDPR_GL	rdpr	%-, %r28
	.word 0xbb504000  ! 236: RDPR_TNPC	<illegal instruction>
	.word 0xbb540000  ! 239: RDPR_GL	<illegal instruction>
	.word 0x8794a1e7  ! 240: WRPR_TT_I	wrpr	%r18, 0x01e7, %tt
	.word 0xb434a1fb  ! 242: SUBC_I	orn 	%r18, 0x01fb, %r26
	.word 0xf33c4000  ! 243: STDF_R	std	%f25, [%r0, %r17]
	.word 0x8794e177  ! 245: WRPR_TT_I	wrpr	%r19, 0x0177, %tt
	.word 0xf03d0000  ! 246: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb5510000  ! 247: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfc24201c  ! 252: STW_I	stw	%r30, [%r16 + 0x001c]
	.word 0xf475a0c6  ! 253: STX_I	stx	%r26, [%r22 + 0x00c6]
	setx	data_start_0, %g1, %r20
	.word 0xfd3d6092  ! 258: STDF_I	std	%f30, [0x0092, %r21]
	.word 0xbe9c8000  ! 263: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xbd50c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xf425616c  ! 268: STW_I	stw	%r26, [%r21 + 0x016c]
	.word 0xfe3ce024  ! 270: STD_I	std	%r31, [%r19 + 0x0024]
	.word 0xfe3c4000  ! 272: STD_R	std	%r31, [%r17 + %r0]
	.word 0xfd3da1e1  ! 276: STDF_I	std	%f30, [0x01e1, %r22]
	.word 0xfc3c6041  ! 279: STD_I	std	%r30, [%r17 + 0x0041]
	.word 0xf0750000  ! 280: STX_R	stx	%r24, [%r20 + %r0]
	.word 0x8195a16b  ! 283: WRPR_TPC_I	wrpr	%r22, 0x016b, %tpc
	.word 0x8194609e  ! 285: WRPR_TPC_I	wrpr	%r17, 0x009e, %tpc
	.word 0xbc24c000  ! 286: SUB_R	sub 	%r19, %r0, %r30
	.word 0xfa244000  ! 289: STW_R	stw	%r29, [%r17 + %r0]
	setx	0xe07a17c900002e9c, %g1, %r10
	.word 0x839a8000  ! 291: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb21d60b9  ! 292: XOR_I	xor 	%r21, 0x00b9, %r25
	.word 0xb551c000  ! 293: RDPR_TL	rdpr	%tl, %r26
	.word 0xf53ca091  ! 296: STDF_I	std	%f26, [0x0091, %r18]
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75e1c6  ! 305: STX_I	stx	%r31, [%r23 + 0x01c6]
	.word 0xf4254000  ! 307: STW_R	stw	%r26, [%r21 + %r0]
	.word 0x91946193  ! 308: WRPR_PIL_I	wrpr	%r17, 0x0193, %pil
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93d0000  ! 310: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfe2d8000  ! 311: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb951c000  ! 312: RDPR_TL	rdpr	%tl, %r28
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42d2075  ! 316: STB_I	stb	%r26, [%r20 + 0x0075]
	.word 0xfa356162  ! 317: STH_I	sth	%r29, [%r21 + 0x0162]
	.word 0xf8244000  ! 321: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xbc854000  ! 323: ADDcc_R	addcc 	%r21, %r0, %r30
	.word 0xbd520000  ! 330: RDPR_PIL	<illegal instruction>
	.word 0xf62c60c6  ! 334: STB_I	stb	%r27, [%r17 + 0x00c6]
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3c2136  ! 338: STD_I	std	%r31, [%r16 + 0x0136]
	.word 0xbb641800  ! 339: MOVcc_R	<illegal instruction>
	.word 0xf63d8000  ! 341: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf13ca11d  ! 343: STDF_I	std	%f24, [0x011d, %r18]
	setx	0x6a1813ea0000299c, %g1, %r10
	.word 0x839a8000  ! 346: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc3d2148  ! 348: STD_I	std	%r30, [%r20 + 0x0148]
	.word 0x8d95205d  ! 351: WRPR_PSTATE_I	wrpr	%r20, 0x005d, %pstate
	.word 0xfa3d60a0  ! 352: STD_I	std	%r29, [%r21 + 0x00a0]
	.word 0x8195e1b7  ! 353: WRPR_TPC_I	wrpr	%r23, 0x01b7, %tpc
	.word 0xf33d0000  ! 357: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf53d0000  ! 358: STDF_R	std	%f26, [%r0, %r20]
	.word 0xfa2c2019  ! 360: STB_I	stb	%r29, [%r16 + 0x0019]
	.word 0xfc2d8000  ! 363: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf82dc000  ! 364: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfc358000  ! 371: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf13c2159  ! 372: STDF_I	std	%f24, [0x0159, %r16]
	.word 0xb435a1e8  ! 376: SUBC_I	orn 	%r22, 0x01e8, %r26
	.word 0xfa2d20bd  ! 378: STB_I	stb	%r29, [%r20 + 0x00bd]
	.word 0xfa2de13c  ! 380: STB_I	stb	%r29, [%r23 + 0x013c]
	.word 0xf22da142  ! 381: STB_I	stb	%r25, [%r22 + 0x0142]
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	.word 0xb5348000  ! 385: SRL_R	srl 	%r18, %r0, %r26
	.word 0xf024e1cc  ! 387: STW_I	stw	%r24, [%r19 + 0x01cc]
	.word 0xfc242189  ! 395: STW_I	stw	%r30, [%r16 + 0x0189]
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 399: RDPR_TL	rdpr	%tl, %r26
	.word 0xb9518000  ! 401: RDPR_PSTATE	<illegal instruction>
	.word 0xfa75219e  ! 404: STX_I	stx	%r29, [%r20 + 0x019e]
	.word 0xb20da0e4  ! 407: AND_I	and 	%r22, 0x00e4, %r25
	.word 0xf875206e  ! 409: STX_I	stx	%r28, [%r20 + 0x006e]
	.word 0xf6750000  ! 410: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf0342053  ! 411: STH_I	sth	%r24, [%r16 + 0x0053]
	.word 0xfe2c4000  ! 412: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf675c000  ! 415: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfc75210c  ! 420: STX_I	stx	%r30, [%r20 + 0x010c]
	.word 0xf8254000  ! 422: STW_R	stw	%r28, [%r21 + %r0]
	.word 0x8794e1d6  ! 423: WRPR_TT_I	wrpr	%r19, 0x01d6, %tt
	.word 0xba94e044  ! 424: ORcc_I	orcc 	%r19, 0x0044, %r29
	.word 0xf475e1ac  ! 426: STX_I	stx	%r26, [%r23 + 0x01ac]
	.word 0xf424a11a  ! 428: STW_I	stw	%r26, [%r18 + 0x011a]
	.word 0xfa352098  ! 433: STH_I	sth	%r29, [%r20 + 0x0098]
	.word 0xf2240000  ! 435: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf82c8000  ! 440: STB_R	stb	%r28, [%r18 + %r0]
	.word 0x8194a05d  ! 441: WRPR_TPC_I	wrpr	%r18, 0x005d, %tpc
	.word 0xf634c000  ! 442: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfc3c2080  ! 444: STD_I	std	%r30, [%r16 + 0x0080]
	.word 0xfc25215f  ! 445: STW_I	stw	%r30, [%r20 + 0x015f]
	.word 0xf63dc000  ! 446: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf02c0000  ! 448: STB_R	stb	%r24, [%r16 + %r0]
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d217e  ! 452: STB_I	stb	%r30, [%r20 + 0x017e]
	.word 0xf2354000  ! 454: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xb550c000  ! 455: RDPR_TT	rdpr	%tt, %r26
	.word 0xf4250000  ! 457: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xbcc521ac  ! 458: ADDCcc_I	addccc 	%r20, 0x01ac, %r30
	.word 0xbb51c000  ! 459: RDPR_TL	<illegal instruction>
	.word 0xf035a05f  ! 465: STH_I	sth	%r24, [%r22 + 0x005f]
	.word 0x89952105  ! 469: WRPR_TICK_I	wrpr	%r20, 0x0105, %tick
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82dc000  ! 473: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf0240000  ! 476: STW_R	stw	%r24, [%r16 + %r0]
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e181  ! 480: STH_I	sth	%r30, [%r19 + 0x0181]
	.word 0xf83521b6  ! 482: STH_I	sth	%r28, [%r20 + 0x01b6]
	.word 0xfe2c6198  ! 485: STB_I	stb	%r31, [%r17 + 0x0198]
	.word 0xf93c8000  ! 487: STDF_R	std	%f28, [%r0, %r18]
	.word 0xb7480000  ! 488: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xff3c8000  ! 496: STDF_R	std	%f31, [%r0, %r18]
	.word 0xbd480000  ! 503: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbca561a8  ! 509: SUBcc_I	subcc 	%r21, 0x01a8, %r30
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xb9520000  ! 519: RDPR_PIL	<illegal instruction>
	.word 0xfa244000  ! 520: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xbb480000  ! 521: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	2, %r12
	.word 0xa1930000  ! 522: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8594e156  ! 523: WRPR_TSTATE_I	wrpr	%r19, 0x0156, %tstate
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 527: RDPR_PIL	rdpr	%pil, %r29
	.word 0xbe1de041  ! 528: XOR_I	xor 	%r23, 0x0041, %r31
	.word 0xf33ca1cb  ! 530: STDF_I	std	%f25, [0x01cb, %r18]
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ce0b5  ! 538: STB_I	stb	%r25, [%r19 + 0x00b5]
	.word 0xfa2d8000  ! 539: STB_R	stb	%r29, [%r22 + %r0]
	.word 0x8994a08d  ! 540: WRPR_TICK_I	wrpr	%r18, 0x008d, %tick
	.word 0xfe74608e  ! 542: STX_I	stx	%r31, [%r17 + 0x008e]
	.word 0xf53d8000  ! 546: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf23da1b6  ! 549: STD_I	std	%r25, [%r22 + 0x01b6]
	.word 0xbf508000  ! 550: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xf0746031  ! 551: STX_I	stx	%r24, [%r17 + 0x0031]
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63d0000  ! 557: STD_R	std	%r27, [%r20 + %r0]
	.word 0xbf504000  ! 560: RDPR_TNPC	<illegal instruction>
	.word 0xfa74a116  ! 568: STX_I	stx	%r29, [%r18 + 0x0116]
	setx	0xfae290510000ab15, %g1, %r10
	.word 0x819a8000  ! 569: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf13d603d  ! 570: STDF_I	std	%f24, [0x003d, %r21]
	.word 0xfe248000  ! 572: STW_R	stw	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa35a0d1  ! 575: STH_I	sth	%r29, [%r22 + 0x00d1]
	.word 0xbeb56045  ! 579: SUBCcc_I	orncc 	%r21, 0x0045, %r31
	.word 0xfa250000  ! 581: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfe3d0000  ! 584: STD_R	std	%r31, [%r20 + %r0]
	setx	0x96a7d13800004a95, %g1, %r10
	.word 0x819a8000  ! 587: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xbbde6a8e0000ea8e, %g1, %r10
	.word 0x819a8000  ! 589: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf93d208f  ! 591: STDF_I	std	%f28, [0x008f, %r20]
	.word 0xf4256039  ! 592: STW_I	stw	%r26, [%r21 + 0x0039]
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad8000  ! 596: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0x83952027  ! 600: WRPR_TNPC_I	wrpr	%r20, 0x0027, %tnpc
	.word 0x8d9461c4  ! 606: WRPR_PSTATE_I	wrpr	%r17, 0x01c4, %pstate
	mov	1, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc24e0d9  ! 608: STW_I	stw	%r30, [%r19 + 0x00d9]
	.word 0xf83dc000  ! 610: STD_R	std	%r28, [%r23 + %r0]
	.word 0x8595e13c  ! 614: WRPR_TSTATE_I	wrpr	%r23, 0x013c, %tstate
	.word 0xf13c0000  ! 617: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf83d8000  ! 618: STD_R	std	%r28, [%r22 + %r0]
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a173  ! 620: STW_I	stw	%r30, [%r18 + 0x0173]
	.word 0xb685e0c1  ! 622: ADDcc_I	addcc 	%r23, 0x00c1, %r27
	.word 0xbd520000  ! 627: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf63c20c1  ! 628: STD_I	std	%r27, [%r16 + 0x00c1]
	.word 0xfa34a1b9  ! 631: STH_I	sth	%r29, [%r18 + 0x01b9]
	.word 0xfc254000  ! 633: STW_R	stw	%r30, [%r21 + %r0]
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734e001  ! 642: SRL_I	srl 	%r19, 0x0001, %r27
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xf0748000  ! 661: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf07461dd  ! 662: STX_I	stx	%r24, [%r17 + 0x01dd]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24e135  ! 677: STW_I	stw	%r31, [%r19 + 0x0135]
	.word 0xb4952041  ! 679: ORcc_I	orcc 	%r20, 0x0041, %r26
	.word 0xb6b5e046  ! 682: ORNcc_I	orncc 	%r23, 0x0046, %r27
	setx	data_start_6, %g1, %r18
	.word 0xbb510000  ! 690: RDPR_TICK	<illegal instruction>
	.word 0xf6248000  ! 692: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf63c4000  ! 693: STD_R	std	%r27, [%r17 + %r0]
	.word 0xb9510000  ! 694: RDPR_TICK	<illegal instruction>
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81956114  ! 707: WRPR_TPC_I	wrpr	%r21, 0x0114, %tpc
	.word 0xf824a012  ! 709: STW_I	stw	%r28, [%r18 + 0x0012]
	.word 0xf824c000  ! 710: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfd3de018  ! 711: STDF_I	std	%f30, [0x0018, %r23]
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2746148  ! 714: STX_I	stx	%r25, [%r17 + 0x0148]
	.word 0xfe2cc000  ! 715: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfe3c2026  ! 716: STD_I	std	%r31, [%r16 + 0x0026]
	.word 0xb445600a  ! 719: ADDC_I	addc 	%r21, 0x000a, %r26
	.word 0xfa2da1d1  ! 720: STB_I	stb	%r29, [%r22 + 0x01d1]
	.word 0xb97dc400  ! 721: MOVR_R	movre	%r23, %r0, %r28
	.word 0xf6358000  ! 725: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xbb520000  ! 730: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf8750000  ! 731: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xff3da1bf  ! 732: STDF_I	std	%f31, [0x01bf, %r22]
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3c8000  ! 743: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf034e03c  ! 744: STH_I	sth	%r24, [%r19 + 0x003c]
	.word 0xf13c21c8  ! 751: STDF_I	std	%f24, [0x01c8, %r16]
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3d8000  ! 754: STDF_R	std	%f29, [%r0, %r22]
	.word 0xb5352001  ! 755: SRL_I	srl 	%r20, 0x0001, %r26
	.word 0x91952174  ! 757: WRPR_PIL_I	wrpr	%r20, 0x0174, %pil
	.word 0x8d95e044  ! 758: WRPR_PSTATE_I	wrpr	%r23, 0x0044, %pstate
	setx	data_start_7, %g1, %r21
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe246122  ! 764: STW_I	stw	%r31, [%r17 + 0x0122]
	.word 0xbb480000  ! 765: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb551c000  ! 766: RDPR_TL	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xf4352178  ! 774: STH_I	sth	%r26, [%r20 + 0x0178]
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2354000  ! 776: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf33d4000  ! 785: STDF_R	std	%f25, [%r0, %r21]
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3520bb  ! 787: STH_I	sth	%r29, [%r20 + 0x00bb]
	.word 0xf33ce153  ! 788: STDF_I	std	%f25, [0x0153, %r19]
	setx	0x400a430f00009f03, %g1, %r10
	.word 0x839a8000  ! 790: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf435212e  ! 795: STH_I	sth	%r26, [%r20 + 0x012e]
	setx	data_start_2, %g1, %r17
	.word 0xb2858000  ! 798: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xf73d2091  ! 806: STDF_I	std	%f27, [0x0091, %r20]
	.word 0xb93c3001  ! 807: SRAX_I	srax	%r16, 0x0001, %r28
	.word 0xb5510000  ! 813: RDPR_TICK	rdpr	%tick, %r26
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e0ff  ! 816: STH_I	sth	%r31, [%r19 + 0x00ff]
	.word 0xff3ce0c2  ! 817: STDF_I	std	%f31, [0x00c2, %r19]
	.word 0xb9480000  ! 818: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb350c000  ! 823: RDPR_TT	<illegal instruction>
	.word 0xfc2d61cf  ! 824: STB_I	stb	%r30, [%r21 + 0x01cf]
	.word 0x8795a0bd  ! 825: WRPR_TT_I	wrpr	%r22, 0x00bd, %tt
	.word 0xfd3dc000  ! 832: STDF_R	std	%f30, [%r0, %r23]
	.word 0xba1d4000  ! 836: XOR_R	xor 	%r21, %r0, %r29
	.word 0xf82d2045  ! 838: STB_I	stb	%r28, [%r20 + 0x0045]
	.word 0xf625a0c4  ! 840: STW_I	stw	%r27, [%r22 + 0x00c4]
	.word 0xf02c203a  ! 841: STB_I	stb	%r24, [%r16 + 0x003a]
	.word 0xb00d200f  ! 842: AND_I	and 	%r20, 0x000f, %r24
	.word 0xfa754000  ! 844: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfa3d4000  ! 851: STD_R	std	%r29, [%r21 + %r0]
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf075c000  ! 858: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x85946054  ! 861: WRPR_TSTATE_I	wrpr	%r17, 0x0054, %tstate
	setx	0x89c1b37700000e14, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf675c000  ! 870: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf42c0000  ! 871: STB_R	stb	%r26, [%r16 + %r0]
	.word 0x8995a177  ! 872: WRPR_TICK_I	wrpr	%r22, 0x0177, %tick
	.word 0xfa3c0000  ! 873: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfe74a1df  ! 874: STX_I	stx	%r31, [%r18 + 0x01df]
	.word 0xf13dc000  ! 881: STDF_R	std	%f24, [%r0, %r23]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf834a181  ! 888: STH_I	sth	%r28, [%r18 + 0x0181]
	.word 0xf2254000  ! 890: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb40da18d  ! 894: AND_I	and 	%r22, 0x018d, %r26
	.word 0xf634a092  ! 899: STH_I	sth	%r27, [%r18 + 0x0092]
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 903: RDPR_TT	rdpr	%tt, %r31
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 907: RDPR_PIL	<illegal instruction>
	.word 0xfc746188  ! 910: STX_I	stx	%r30, [%r17 + 0x0188]
	.word 0xfc3d4000  ! 911: STD_R	std	%r30, [%r21 + %r0]
	.word 0xbf510000  ! 912: RDPR_TICK	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa740000  ! 915: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfc2ca1e7  ! 918: STB_I	stb	%r30, [%r18 + 0x01e7]
	.word 0xf43de122  ! 919: STD_I	std	%r26, [%r23 + 0x0122]
	.word 0xfe2de029  ! 922: STB_I	stb	%r31, [%r23 + 0x0029]
	.word 0xff3d8000  ! 923: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf0346138  ! 929: STH_I	sth	%r24, [%r17 + 0x0138]
	.word 0xbf504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xfe3c60e5  ! 933: STD_I	std	%r31, [%r17 + 0x00e5]
	.word 0xf6746193  ! 935: STX_I	stx	%r27, [%r17 + 0x0193]
	.word 0xf425e084  ! 936: STW_I	stw	%r26, [%r23 + 0x0084]
	.word 0xff3c4000  ! 938: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf33cc000  ! 942: STDF_R	std	%f25, [%r0, %r19]
	.word 0xf42cc000  ! 943: STB_R	stb	%r26, [%r19 + %r0]
	.word 0x83942018  ! 944: WRPR_TNPC_I	wrpr	%r16, 0x0018, %tnpc
	.word 0xf02c2009  ! 945: STB_I	stb	%r24, [%r16 + 0x0009]
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93c0000  ! 949: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf03c60ba  ! 950: STD_I	std	%r24, [%r17 + 0x00ba]
	.word 0xfd3d4000  ! 952: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf624a108  ! 954: STW_I	stw	%r27, [%r18 + 0x0108]
	.word 0xfe3c6152  ! 956: STD_I	std	%r31, [%r17 + 0x0152]
	.word 0xbf520000  ! 959: RDPR_PIL	rdpr	%pil, %r31
	.word 0xfc35609e  ! 960: STH_I	sth	%r30, [%r21 + 0x009e]
	.word 0xb9343001  ! 962: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xf8354000  ! 963: STH_R	sth	%r28, [%r21 + %r0]
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03de08f  ! 967: STD_I	std	%r24, [%r23 + 0x008f]
	setx	data_start_6, %g1, %r19
	.word 0xb6858000  ! 969: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0x8795602a  ! 979: WRPR_TT_I	wrpr	%r21, 0x002a, %tt
	.word 0xf6350000  ! 980: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xfe350000  ! 981: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xfe35e0db  ! 982: STH_I	sth	%r31, [%r23 + 0x00db]
	.word 0xf275205d  ! 985: STX_I	stx	%r25, [%r20 + 0x005d]
	mov	1, %r12
	.word 0xa1930000  ! 986: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb351c000  ! 990: RDPR_TL	rdpr	%tl, %r25
	.word 0xf8242012  ! 992: STW_I	stw	%r28, [%r16 + 0x0012]
	.word 0xbd643801  ! 995: MOVcc_I	<illegal instruction>
	.word 0xf0750000  ! 996: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf42d0000  ! 997: STB_R	stb	%r26, [%r20 + %r0]
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
	.word 0xf21d0000  ! 3: LDD_R	ldd	[%r20 + %r0], %r25
	.word 0xfe04a12a  ! 5: LDUW_I	lduw	[%r18 + 0x012a], %r31
	.word 0xf31c204b  ! 6: LDDF_I	ldd	[%r16, 0x004b], %f25
	.word 0xf604a04f  ! 7: LDUW_I	lduw	[%r18 + 0x004f], %r27
	.word 0xf245e181  ! 10: LDSW_I	ldsw	[%r23 + 0x0181], %r25
	setx	data_start_7, %g1, %r16
	.word 0xbb3d3001  ! 15: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xbf510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0x8d9460b9  ! 21: WRPR_PSTATE_I	wrpr	%r17, 0x00b9, %pstate
	.word 0x8394a004  ! 22: WRPR_TNPC_I	wrpr	%r18, 0x0004, %tnpc
	.word 0xf255a1fa  ! 23: LDSH_I	ldsh	[%r22 + 0x01fa], %r25
	.word 0x9194a039  ! 26: WRPR_PIL_I	wrpr	%r18, 0x0039, %pil
	.word 0x8595e1d2  ! 28: WRPR_TSTATE_I	wrpr	%r23, 0x01d2, %tstate
	.word 0xb73c8000  ! 29: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb7518000  ! 34: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb9480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf4450000  ! 46: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xfe45c000  ! 47: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xbd480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605e1e4  ! 52: LDUW_I	lduw	[%r23 + 0x01e4], %r27
	.word 0xb8bdc000  ! 56: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0x8394e13c  ! 57: WRPR_TNPC_I	wrpr	%r19, 0x013c, %tnpc
	.word 0xf04d4000  ! 58: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf71ca0c4  ! 64: LDDF_I	ldd	[%r18, 0x00c4], %f27
	.word 0xbc254000  ! 65: SUB_R	sub 	%r21, %r0, %r30
	.word 0xfc14e029  ! 68: LDUH_I	lduh	[%r19 + 0x0029], %r30
	setx	0xbf2d5e1000009e88, %g1, %r10
	.word 0x839a8000  ! 71: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf45d604b  ! 74: LDX_I	ldx	[%r21 + 0x004b], %r26
	.word 0xb7510000  ! 76: RDPR_TICK	<illegal instruction>
	.word 0xbf518000  ! 84: RDPR_PSTATE	<illegal instruction>
	.word 0xbb540000  ! 85: RDPR_GL	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xbd7ce401  ! 89: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xbf480000  ! 93: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf614a087  ! 95: LDUH_I	lduh	[%r18 + 0x0087], %r27
	setx	0xd736a52600006a58, %g1, %r10
	.word 0x819a8000  ! 98: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xb551c000  ! 103: RDPR_TL	<illegal instruction>
	.word 0x8995e179  ! 105: WRPR_TICK_I	wrpr	%r23, 0x0179, %tick
	.word 0xfe054000  ! 108: LDUW_R	lduw	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0x8f930000  ! 109: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf20d6198  ! 111: LDUB_I	ldub	[%r21 + 0x0198], %r25
	.word 0xf44ca055  ! 112: LDSB_I	ldsb	[%r18 + 0x0055], %r26
	.word 0xf21ca09a  ! 116: LDD_I	ldd	[%r18 + 0x009a], %r25
	.word 0xf8054000  ! 117: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf8048000  ! 118: LDUW_R	lduw	[%r18 + %r0], %r28
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 120: RDPR_GL	<illegal instruction>
	.word 0xf404608a  ! 122: LDUW_I	lduw	[%r17 + 0x008a], %r26
	.word 0xba2c4000  ! 126: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xb5341000  ! 127: SRLX_R	srlx	%r16, %r0, %r26
	.word 0x8194a1aa  ! 130: WRPR_TPC_I	wrpr	%r18, 0x01aa, %tpc
	.word 0xb1510000  ! 132: RDPR_TICK	<illegal instruction>
	.word 0xb23d21ac  ! 135: XNOR_I	xnor 	%r20, 0x01ac, %r25
	.word 0xb1504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0xb00c0000  ! 141: AND_R	and 	%r16, %r0, %r24
	.word 0xf51ca095  ! 142: LDDF_I	ldd	[%r18, 0x0095], %f26
	.word 0xfe55e060  ! 147: LDSH_I	ldsh	[%r23 + 0x0060], %r31
	.word 0xfa448000  ! 148: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf24ca1ae  ! 149: LDSB_I	ldsb	[%r18 + 0x01ae], %r25
	setx	data_start_7, %g1, %r20
	mov	1, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9194a197  ! 160: WRPR_PIL_I	wrpr	%r18, 0x0197, %pil
	.word 0xf24da035  ! 161: LDSB_I	ldsb	[%r22 + 0x0035], %r25
	.word 0xfe5c4000  ! 162: LDX_R	ldx	[%r17 + %r0], %r31
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf352001  ! 168: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xb61cc000  ! 169: XOR_R	xor 	%r19, %r0, %r27
	.word 0xfa1c4000  ! 171: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf20d61ba  ! 172: LDUB_I	ldub	[%r21 + 0x01ba], %r25
	.word 0xb3504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xfc1c20c4  ! 176: LDD_I	ldd	[%r16 + 0x00c4], %r30
	.word 0xb6b561a2  ! 177: SUBCcc_I	orncc 	%r21, 0x01a2, %r27
	.word 0xb92dc000  ! 180: SLL_R	sll 	%r23, %r0, %r28
	.word 0xbe15e149  ! 184: OR_I	or 	%r23, 0x0149, %r31
	.word 0x8595a05d  ! 188: WRPR_TSTATE_I	wrpr	%r22, 0x005d, %tstate
	.word 0xfe44604d  ! 191: LDSW_I	ldsw	[%r17 + 0x004d], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc140000  ! 197: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xb834a0df  ! 199: ORN_I	orn 	%r18, 0x00df, %r28
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 206: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb8a4e06b  ! 209: SUBcc_I	subcc 	%r19, 0x006b, %r28
	.word 0xf6040000  ! 211: LDUW_R	lduw	[%r16 + %r0], %r27
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc446089  ! 220: LDSW_I	ldsw	[%r17 + 0x0089], %r30
	.word 0xf61da15c  ! 221: LDD_I	ldd	[%r22 + 0x015c], %r27
	.word 0x8994a151  ! 223: WRPR_TICK_I	wrpr	%r18, 0x0151, %tick
	.word 0xb5508000  ! 224: RDPR_TSTATE	<illegal instruction>
	.word 0xbf540000  ! 226: RDPR_GL	<illegal instruction>
	.word 0x8394e154  ! 230: WRPR_TNPC_I	wrpr	%r19, 0x0154, %tnpc
	.word 0xb9540000  ! 231: RDPR_GL	<illegal instruction>
	.word 0xfe5da16b  ! 234: LDX_I	ldx	[%r22 + 0x016b], %r31
	.word 0xb7504000  ! 236: RDPR_TNPC	<illegal instruction>
	.word 0xf00461f4  ! 237: LDUW_I	lduw	[%r17 + 0x01f4], %r24
	.word 0xfe5d8000  ! 238: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb9540000  ! 239: RDPR_GL	<illegal instruction>
	.word 0x8795e15c  ! 240: WRPR_TT_I	wrpr	%r23, 0x015c, %tt
	.word 0xfc1de073  ! 241: LDD_I	ldd	[%r23 + 0x0073], %r30
	.word 0xb8346118  ! 242: SUBC_I	orn 	%r17, 0x0118, %r28
	.word 0x8794e078  ! 245: WRPR_TT_I	wrpr	%r19, 0x0078, %tt
	.word 0xbd510000  ! 247: RDPR_TICK	<illegal instruction>
	.word 0xf24d21ac  ! 250: LDSB_I	ldsb	[%r20 + 0x01ac], %r25
	.word 0xfa5d600e  ! 254: LDX_I	ldx	[%r21 + 0x000e], %r29
	.word 0xf615a184  ! 255: LDUH_I	lduh	[%r22 + 0x0184], %r27
	setx	data_start_0, %g1, %r22
	.word 0xfa4d213c  ! 260: LDSB_I	ldsb	[%r20 + 0x013c], %r29
	.word 0xf255c000  ! 261: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xb29cc000  ! 263: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xf4542108  ! 264: LDSH_I	ldsh	[%r16 + 0x0108], %r26
	.word 0xfc05e06a  ! 265: LDUW_I	lduw	[%r23 + 0x006a], %r30
	.word 0xb350c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xfc1ca155  ! 273: LDD_I	ldd	[%r18 + 0x0155], %r30
	.word 0xf804c000  ! 278: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xf91c4000  ! 282: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0x8194a0ce  ! 283: WRPR_TPC_I	wrpr	%r18, 0x00ce, %tpc
	.word 0x8194e1fd  ! 285: WRPR_TPC_I	wrpr	%r19, 0x01fd, %tpc
	.word 0xb8240000  ! 286: SUB_R	sub 	%r16, %r0, %r28
	.word 0xf71c6118  ! 290: LDDF_I	ldd	[%r17, 0x0118], %f27
	setx	0xf30edee00000abc1, %g1, %r10
	.word 0x839a8000  ! 291: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb41d602e  ! 292: XOR_I	xor 	%r21, 0x002e, %r26
	.word 0xbf51c000  ! 293: RDPR_TL	<illegal instruction>
	.word 0xf6042149  ! 295: LDUW_I	lduw	[%r16 + 0x0149], %r27
	.word 0xf614c000  ! 297: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xfc15209f  ! 298: LDUH_I	lduh	[%r20 + 0x009f], %r30
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0461fd  ! 303: LDUW_I	lduw	[%r17 + 0x01fd], %r29
	.word 0xfe14a0cc  ! 306: LDUH_I	lduh	[%r18 + 0x00cc], %r31
	.word 0x919561bc  ! 308: WRPR_PIL_I	wrpr	%r21, 0x01bc, %pil
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 312: RDPR_TL	<illegal instruction>
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4440000  ! 320: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfa55c000  ! 322: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xba840000  ! 323: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xf44c4000  ! 327: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xbf520000  ! 330: RDPR_PIL	<illegal instruction>
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00dc000  ! 337: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xb9641800  ! 339: MOVcc_R	<illegal instruction>
	.word 0xfa44a08a  ! 340: LDSW_I	ldsw	[%r18 + 0x008a], %r29
	setx	0x5c47317d00000e1d, %g1, %r10
	.word 0x839a8000  ! 346: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95a078  ! 351: WRPR_PSTATE_I	wrpr	%r22, 0x0078, %pstate
	.word 0x8195614a  ! 353: WRPR_TPC_I	wrpr	%r21, 0x014a, %tpc
	.word 0xf804a15a  ! 356: LDUW_I	lduw	[%r18 + 0x015a], %r28
	.word 0xfe5c60b8  ! 359: LDX_I	ldx	[%r17 + 0x00b8], %r31
	.word 0xf615c000  ! 366: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xfc1d610d  ! 369: LDD_I	ldd	[%r21 + 0x010d], %r30
	.word 0xf6558000  ! 374: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xba356194  ! 376: SUBC_I	orn 	%r21, 0x0194, %r29
	.word 0xfe0c8000  ! 377: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf71d6061  ! 379: LDDF_I	ldd	[%r21, 0x0061], %f27
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0xb7348000  ! 385: SRL_R	srl 	%r18, %r0, %r27
	.word 0xfd1dc000  ! 390: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xfe4ca010  ! 393: LDSB_I	ldsb	[%r18 + 0x0010], %r31
	.word 0xfc446058  ! 394: LDSW_I	ldsw	[%r17 + 0x0058], %r30
	.word 0xfa444000  ! 397: LDSW_R	ldsw	[%r17 + %r0], %r29
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 399: RDPR_TL	<illegal instruction>
	.word 0xbf518000  ! 401: RDPR_PSTATE	<illegal instruction>
	.word 0xfa14a189  ! 405: LDUH_I	lduh	[%r18 + 0x0189], %r29
	.word 0xba0ce1ac  ! 407: AND_I	and 	%r19, 0x01ac, %r29
	.word 0xfe058000  ! 408: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf2054000  ! 413: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x879420f9  ! 423: WRPR_TT_I	wrpr	%r16, 0x00f9, %tt
	.word 0xba95600d  ! 424: ORcc_I	orcc 	%r21, 0x000d, %r29
	.word 0xfc0da155  ! 427: LDUB_I	ldub	[%r22 + 0x0155], %r30
	.word 0x8195a0fb  ! 441: WRPR_TPC_I	wrpr	%r22, 0x00fb, %tpc
	.word 0xf4144000  ! 447: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf44560bf  ! 449: LDSW_I	ldsw	[%r21 + 0x00bf], %r26
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 455: RDPR_TT	<illegal instruction>
	.word 0xb2c4e172  ! 458: ADDCcc_I	addccc 	%r19, 0x0172, %r25
	.word 0xb151c000  ! 459: RDPR_TL	<illegal instruction>
	.word 0xf41d60c3  ! 466: LDD_I	ldd	[%r21 + 0x00c3], %r26
	.word 0xf244e0fc  ! 468: LDSW_I	ldsw	[%r19 + 0x00fc], %r25
	.word 0x89956031  ! 469: WRPR_TICK_I	wrpr	%r21, 0x0031, %tick
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0560af  ! 475: LDUW_I	lduw	[%r21 + 0x00af], %r29
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80c0000  ! 484: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xfe5c8000  ! 486: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xb9480000  ! 488: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf00ca06b  ! 490: LDUB_I	ldub	[%r18 + 0x006b], %r24
	.word 0xf414c000  ! 491: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xfc45e009  ! 494: LDSW_I	ldsw	[%r23 + 0x0009], %r30
	.word 0xfa0d21d9  ! 501: LDUB_I	ldub	[%r20 + 0x01d9], %r29
	.word 0xb1480000  ! 503: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf654e0e3  ! 505: LDSH_I	ldsh	[%r19 + 0x00e3], %r27
	.word 0xbca52079  ! 509: SUBcc_I	subcc 	%r20, 0x0079, %r30
	.word 0xfe1d4000  ! 514: LDD_R	ldd	[%r21 + %r0], %r31
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xf045c000  ! 518: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb5520000  ! 519: RDPR_PIL	<illegal instruction>
	.word 0xbb480000  ! 521: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	1, %r12
	.word 0xa1930000  ! 522: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8595e0af  ! 523: WRPR_TSTATE_I	wrpr	%r23, 0x00af, %tstate
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 527: RDPR_PIL	<illegal instruction>
	.word 0xb01d60bd  ! 528: XOR_I	xor 	%r21, 0x00bd, %r24
	.word 0xf4050000  ! 531: LDUW_R	lduw	[%r20 + %r0], %r26
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54203d  ! 534: LDSH_I	ldsh	[%r16 + 0x003d], %r29
	.word 0x8995a014  ! 540: WRPR_TICK_I	wrpr	%r22, 0x0014, %tick
	.word 0xfe140000  ! 548: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xbd508000  ! 550: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2544000  ! 558: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xb1504000  ! 560: RDPR_TNPC	<illegal instruction>
	.word 0xfe5c2118  ! 565: LDX_I	ldx	[%r16 + 0x0118], %r31
	setx	0x9c29542d0000dfcd, %g1, %r10
	.word 0x819a8000  ! 569: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa448000  ! 573: LDSW_R	ldsw	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4c6190  ! 576: LDSB_I	ldsb	[%r17 + 0x0190], %r29
	.word 0xb0b46099  ! 579: SUBCcc_I	orncc 	%r17, 0x0099, %r24
	.word 0xf45da06a  ! 582: LDX_I	ldx	[%r22 + 0x006a], %r26
	.word 0xf80de0a9  ! 583: LDUB_I	ldub	[%r23 + 0x00a9], %r28
	setx	0xb6c8fb5f0000fb4e, %g1, %r10
	.word 0x819a8000  ! 587: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x9b2616400000bc5, %g1, %r10
	.word 0x819a8000  ! 589: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa05c000  ! 595: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xb8adc000  ! 596: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0x83942126  ! 600: WRPR_TNPC_I	wrpr	%r16, 0x0126, %tnpc
	.word 0xf44c6007  ! 604: LDSB_I	ldsb	[%r17 + 0x0007], %r26
	.word 0x8d94219b  ! 606: WRPR_PSTATE_I	wrpr	%r16, 0x019b, %pstate
	mov	1, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594a047  ! 614: WRPR_TSTATE_I	wrpr	%r18, 0x0047, %tstate
	.word 0xf84d2063  ! 615: LDSB_I	ldsb	[%r20 + 0x0063], %r28
	.word 0xf8450000  ! 616: LDSW_R	ldsw	[%r20 + %r0], %r28
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe84603e  ! 622: ADDcc_I	addcc 	%r17, 0x003e, %r31
	.word 0xf8054000  ! 623: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xb5520000  ! 627: RDPR_PIL	<illegal instruction>
	.word 0xfa1c4000  ! 630: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf055610e  ! 632: LDSH_I	ldsh	[%r21 + 0x010e], %r24
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc542048  ! 637: LDSH_I	ldsh	[%r16 + 0x0048], %r30
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535a001  ! 642: SRL_I	srl 	%r22, 0x0001, %r26
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1c60b1  ! 654: LDD_I	ldd	[%r17 + 0x00b1], %r30
	.word 0xf25de117  ! 656: LDX_I	ldx	[%r23 + 0x0117], %r25
	setx	data_start_3, %g1, %r18
	.word 0xf05560ae  ! 664: LDSH_I	ldsh	[%r21 + 0x00ae], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8048000  ! 669: LDUW_R	lduw	[%r18 + %r0], %r28
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64ce1bb  ! 675: LDSB_I	ldsb	[%r19 + 0x01bb], %r27
	.word 0xb894a11e  ! 679: ORcc_I	orcc 	%r18, 0x011e, %r28
	.word 0xfc452153  ! 680: LDSW_I	ldsw	[%r20 + 0x0153], %r30
	.word 0xf244a062  ! 681: LDSW_I	ldsw	[%r18 + 0x0062], %r25
	.word 0xb4b421be  ! 682: ORNcc_I	orncc 	%r16, 0x01be, %r26
	setx	data_start_5, %g1, %r17
	.word 0xf6550000  ! 684: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfa4c4000  ! 688: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xb1510000  ! 690: RDPR_TICK	<illegal instruction>
	.word 0xf65d4000  ! 691: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xbb510000  ! 694: RDPR_TICK	<illegal instruction>
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1ce0d4  ! 699: LDD_I	ldd	[%r19 + 0x00d4], %r30
	.word 0xfa4521bd  ! 702: LDSW_I	ldsw	[%r20 + 0x01bd], %r29
	.word 0xfe140000  ! 703: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0x8194613d  ! 707: WRPR_TPC_I	wrpr	%r17, 0x013d, %tpc
	.word 0xf71c617b  ! 708: LDDF_I	ldd	[%r17, 0x017b], %f27
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25de1c7  ! 717: LDX_I	ldx	[%r23 + 0x01c7], %r25
	.word 0xb0446094  ! 719: ADDC_I	addc 	%r17, 0x0094, %r24
	.word 0xb77cc400  ! 721: MOVR_R	movre	%r19, %r0, %r27
	.word 0xfe4d4000  ! 722: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xbd520000  ! 730: RDPR_PIL	<illegal instruction>
	.word 0xf854e1b4  ! 736: LDSH_I	ldsh	[%r19 + 0x01b4], %r28
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1356001  ! 755: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xf445202d  ! 756: LDSW_I	ldsw	[%r20 + 0x002d], %r26
	.word 0x9194609b  ! 757: WRPR_PIL_I	wrpr	%r17, 0x009b, %pil
	.word 0x8d95611a  ! 758: WRPR_PSTATE_I	wrpr	%r21, 0x011a, %pstate
	setx	data_start_1, %g1, %r19
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 765: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb351c000  ! 766: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xfc1cc000  ! 772: LDD_R	ldd	[%r19 + %r0], %r30
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c6196  ! 777: LDSB_I	ldsb	[%r17 + 0x0196], %r30
	.word 0xf2140000  ! 780: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf41c6093  ! 783: LDD_I	ldd	[%r17 + 0x0093], %r26
	.word 0xf814e1b9  ! 784: LDUH_I	lduh	[%r19 + 0x01b9], %r28
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	setx	0xdcc9d22e0000cd1a, %g1, %r10
	.word 0x839a8000  ! 790: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfd1d4000  ! 792: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xfe046112  ! 794: LDUW_I	lduw	[%r17 + 0x0112], %r31
	setx	data_start_4, %g1, %r17
	.word 0xbe844000  ! 798: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xfa4d20cc  ! 799: LDSB_I	ldsb	[%r20 + 0x00cc], %r29
	.word 0xfc4dc000  ! 805: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xb33c3001  ! 807: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xf0556138  ! 809: LDSH_I	ldsh	[%r21 + 0x0138], %r24
	.word 0xf60d4000  ! 810: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xbf510000  ! 813: RDPR_TICK	<illegal instruction>
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 818: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf41c0000  ! 820: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xfa0d0000  ! 822: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xb350c000  ! 823: RDPR_TT	<illegal instruction>
	.word 0x8794e03c  ! 825: WRPR_TT_I	wrpr	%r19, 0x003c, %tt
	.word 0xf2146186  ! 827: LDUH_I	lduh	[%r17 + 0x0186], %r25
	.word 0xfc14e02e  ! 828: LDUH_I	lduh	[%r19 + 0x002e], %r30
	.word 0xf84d6163  ! 829: LDSB_I	ldsb	[%r21 + 0x0163], %r28
	.word 0xf45dc000  ! 831: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf0142019  ! 835: LDUH_I	lduh	[%r16 + 0x0019], %r24
	.word 0xbe1c4000  ! 836: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb80d6145  ! 842: AND_I	and 	%r21, 0x0145, %r28
	.word 0xf6158000  ! 849: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xfa1c0000  ! 850: LDD_R	ldd	[%r16 + %r0], %r29
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2054000  ! 860: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x8595e1ea  ! 861: WRPR_TSTATE_I	wrpr	%r23, 0x01ea, %tstate
	.word 0xf31d8000  ! 863: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xfc0dc000  ! 864: LDUB_R	ldub	[%r23 + %r0], %r30
	setx	0xf894cd7700003e95, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995e0b9  ! 872: WRPR_TICK_I	wrpr	%r23, 0x00b9, %tick
	.word 0xf0440000  ! 875: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xfe44c000  ! 877: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf44d4000  ! 883: LDSB_R	ldsb	[%r21 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf01d4000  ! 885: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xf845a197  ! 886: LDSW_I	ldsw	[%r22 + 0x0197], %r28
	.word 0xfc14a0e0  ! 892: LDUH_I	lduh	[%r18 + 0x00e0], %r30
	.word 0xba0de190  ! 894: AND_I	and 	%r23, 0x0190, %r29
	.word 0xf0444000  ! 896: LDSW_R	ldsw	[%r17 + %r0], %r24
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 903: RDPR_TT	rdpr	%tt, %r28
	.word 0xf21c8000  ! 904: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf85c2074  ! 905: LDX_I	ldx	[%r16 + 0x0074], %r28
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 907: RDPR_PIL	<illegal instruction>
	.word 0xf84d0000  ! 909: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb1510000  ! 912: RDPR_TICK	<illegal instruction>
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45e073  ! 914: LDSW_I	ldsw	[%r23 + 0x0073], %r30
	.word 0xf91dc000  ! 924: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf2454000  ! 927: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xb5504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xfa4c616e  ! 932: LDSB_I	ldsb	[%r17 + 0x016e], %r29
	.word 0xf6548000  ! 934: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0x8394e021  ! 944: WRPR_TNPC_I	wrpr	%r19, 0x0021, %tnpc
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d2155  ! 955: LDUB_I	ldub	[%r20 + 0x0155], %r31
	.word 0xb3520000  ! 959: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb134b001  ! 962: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xfe0ca19e  ! 965: LDUB_I	ldub	[%r18 + 0x019e], %r31
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0xbe858000  ! 969: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0xfa0dc000  ! 971: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xf054a1b6  ! 974: LDSH_I	ldsh	[%r18 + 0x01b6], %r24
	.word 0x8794a058  ! 979: WRPR_TT_I	wrpr	%r18, 0x0058, %tt
	.word 0xf8040000  ! 983: LDUW_R	lduw	[%r16 + %r0], %r28
	mov	0, %r12
	.word 0xa1930000  ! 986: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb751c000  ! 990: RDPR_TL	<illegal instruction>
	.word 0xf11d20fe  ! 991: LDDF_I	ldd	[%r20, 0x00fe], %f24
	.word 0xf6156144  ! 993: LDUH_I	lduh	[%r21 + 0x0144], %r27
	.word 0xb9643801  ! 995: MOVcc_I	<illegal instruction>
	.word 0xf00561b3  ! 998: LDUW_I	lduw	[%r21 + 0x01b3], %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5aa4820  ! 1: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbba88820  ! 4: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a449a0  ! 8: FDIVs	fdivs	%f17, %f0, %f25
	setx	data_start_1, %g1, %r18
	.word 0xbd3c7001  ! 15: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xb1510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0x8d95a0f2  ! 21: WRPR_PSTATE_I	wrpr	%r22, 0x00f2, %pstate
	.word 0x8395e139  ! 22: WRPR_TNPC_I	wrpr	%r23, 0x0139, %tnpc
	.word 0xbda44860  ! 24: FADDq	dis not found

	.word 0x9195a1f6  ! 26: WRPR_PIL_I	wrpr	%r22, 0x01f6, %pil
	.word 0x8595a1b9  ! 28: WRPR_TSTATE_I	wrpr	%r22, 0x01b9, %tstate
	.word 0xb53c8000  ! 29: SRA_R	sra 	%r18, %r0, %r26
	.word 0xbfaa4820  ! 32: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab4820  ! 33: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3518000  ! 34: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a94820  ! 38: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7aa0820  ! 42: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda58920  ! 44: FMULs	fmuls	%f22, %f0, %f30
	.word 0xbfa80c20  ! 45: FMOVRLZ	dis not found

	.word 0xb1480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 54: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb4bc0000  ! 56: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0x8395e0ff  ! 57: WRPR_TNPC_I	wrpr	%r23, 0x00ff, %tnpc
	.word 0xb9a44920  ! 59: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb9abc820  ! 62: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb0254000  ! 65: SUB_R	sub 	%r21, %r0, %r24
	.word 0xb7a81820  ! 69: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	setx	0xdc5c28ff00004e49, %g1, %r10
	.word 0x839a8000  ! 71: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd510000  ! 76: RDPR_TICK	<illegal instruction>
	.word 0xb3a94820  ! 78: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbb518000  ! 84: RDPR_PSTATE	<illegal instruction>
	.word 0xb1540000  ! 85: RDPR_GL	<illegal instruction>
	setx	data_start_5, %g1, %r16
	.word 0xbba98820  ! 87: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbdaa8820  ! 88: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb97de401  ! 89: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xb1a81820  ! 92: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3480000  ! 93: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1a00520  ! 94: FSQRTs	fsqrt	
	.word 0xbbaa0820  ! 97: FMOVA	fmovs	%fcc1, %f0, %f29
	setx	0x3e4606e700007bc6, %g1, %r10
	.word 0x819a8000  ! 98: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xbfa448a0  ! 100: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xbd51c000  ! 103: RDPR_TL	<illegal instruction>
	.word 0xb9ab4820  ! 104: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x89946125  ! 105: WRPR_TICK_I	wrpr	%r17, 0x0125, %tick
	mov	0, %r12
	.word 0x8f930000  ! 109: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 120: RDPR_GL	<illegal instruction>
	.word 0xbfa90820  ! 125: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb22d0000  ! 126: ANDN_R	andn 	%r20, %r0, %r25
	.word 0xb735d000  ! 127: SRLX_R	srlx	%r23, %r0, %r27
	.word 0x8194e080  ! 130: WRPR_TPC_I	wrpr	%r19, 0x0080, %tpc
	.word 0xb9510000  ! 132: RDPR_TICK	<illegal instruction>
	.word 0xb3aa0820  ! 134: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb43da079  ! 135: XNOR_I	xnor 	%r22, 0x0079, %r26
	.word 0xb1504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0xb3ab4820  ! 137: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa0820  ! 138: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00540  ! 140: FSQRTd	fsqrt	
	.word 0xb60cc000  ! 141: AND_R	and 	%r19, %r0, %r27
	.word 0xb9a50820  ! 143: FADDs	fadds	%f20, %f0, %f28
	.word 0xb9aac820  ! 144: FMOVGE	fmovs	%fcc1, %f0, %f28
	setx	data_start_1, %g1, %r21
	mov	1, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda98820  ! 156: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0x919560e8  ! 160: WRPR_PIL_I	wrpr	%r21, 0x00e8, %pil
	.word 0xb7a81820  ! 163: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba80820  ! 165: FMOVN	fmovs	%fcc1, %f0, %f29
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb352001  ! 168: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xbc1d0000  ! 169: XOR_R	xor 	%r20, %r0, %r30
	.word 0xbfaa4820  ! 170: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb7504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xb8b5617e  ! 177: SUBCcc_I	orncc 	%r21, 0x017e, %r28
	.word 0xb1aa4820  ! 178: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb12dc000  ! 180: SLL_R	sll 	%r23, %r0, %r24
	.word 0xb3a409a0  ! 182: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xb815a042  ! 184: OR_I	or 	%r22, 0x0042, %r28
	.word 0xb7a98820  ! 186: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a5c960  ! 187: FMULq	dis not found

	.word 0x8595218b  ! 188: WRPR_TSTATE_I	wrpr	%r20, 0x018b, %tstate
	.word 0xbba00020  ! 193: FMOVs	fmovs	%f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4346192  ! 199: ORN_I	orn 	%r17, 0x0192, %r26
	.word 0xbfa94820  ! 200: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba00520  ! 201: FSQRTs	fsqrt	
	.word 0xb9a94820  ! 202: FMOVCS	fmovs	%fcc1, %f0, %f28
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 206: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb6a4a1db  ! 209: SUBcc_I	subcc 	%r18, 0x01db, %r27
	.word 0xb1a5c840  ! 210: FADDd	faddd	%f54, %f0, %f24
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58920  ! 215: FMULs	fmuls	%f22, %f0, %f29
	.word 0x8994617b  ! 223: WRPR_TICK_I	wrpr	%r17, 0x017b, %tick
	.word 0xb5508000  ! 224: RDPR_TSTATE	<illegal instruction>
	.word 0xb7540000  ! 226: RDPR_GL	<illegal instruction>
	.word 0xb3aa8820  ! 227: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbfa5c960  ! 228: FMULq	dis not found

	.word 0x8394601b  ! 230: WRPR_TNPC_I	wrpr	%r17, 0x001b, %tnpc
	.word 0xb1540000  ! 231: RDPR_GL	<illegal instruction>
	.word 0xb7a81420  ! 233: FMOVRNZ	dis not found

	.word 0xb3a9c820  ! 235: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1504000  ! 236: RDPR_TNPC	<illegal instruction>
	.word 0xb7540000  ! 239: RDPR_GL	<illegal instruction>
	.word 0x8794a1df  ! 240: WRPR_TT_I	wrpr	%r18, 0x01df, %tt
	.word 0xb034e0c5  ! 242: SUBC_I	orn 	%r19, 0x00c5, %r24
	.word 0x879421b5  ! 245: WRPR_TT_I	wrpr	%r16, 0x01b5, %tt
	.word 0xbf510000  ! 247: RDPR_TICK	<illegal instruction>
	setx	data_start_5, %g1, %r21
	.word 0xb1a44840  ! 259: FADDd	faddd	%f48, %f0, %f24
	.word 0xb89d4000  ! 263: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xb350c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xb5a80820  ! 269: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1a9c820  ! 281: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8195a003  ! 283: WRPR_TPC_I	wrpr	%r22, 0x0003, %tpc
	.word 0xb1aa0820  ! 284: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8194a126  ! 285: WRPR_TPC_I	wrpr	%r18, 0x0126, %tpc
	.word 0xb424c000  ! 286: SUB_R	sub 	%r19, %r0, %r26
	setx	0xda008ab600007902, %g1, %r10
	.word 0x839a8000  ! 291: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb61ca070  ! 292: XOR_I	xor 	%r18, 0x0070, %r27
	.word 0xb951c000  ! 293: RDPR_TL	<illegal instruction>
	.word 0xb5a5c9c0  ! 294: FDIVd	fdivd	%f54, %f0, %f26
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a0f5  ! 308: WRPR_PIL_I	wrpr	%r18, 0x00f5, %pil
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 312: RDPR_TL	<illegal instruction>
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c840  ! 315: FADDd	faddd	%f50, %f0, %f58
	.word 0xb4844000  ! 323: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xbfa448c0  ! 329: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb5520000  ! 330: RDPR_PIL	<illegal instruction>
	.word 0xbfaa4820  ! 331: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda48920  ! 332: FMULs	fmuls	%f18, %f0, %f30
	.word 0xb5a8c820  ! 333: FMOVL	fmovs	%fcc1, %f0, %f26
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 339: MOVcc_R	<illegal instruction>
	.word 0xbbab0820  ! 345: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x90d2528c0000fad7, %g1, %r10
	.word 0x839a8000  ! 346: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a448e0  ! 347: FSUBq	dis not found

	.word 0xbda48820  ! 349: FADDs	fadds	%f18, %f0, %f30
	.word 0x8d95e185  ! 351: WRPR_PSTATE_I	wrpr	%r23, 0x0185, %pstate
	.word 0x819520f7  ! 353: WRPR_TPC_I	wrpr	%r20, 0x00f7, %tpc
	.word 0xb7a5c9c0  ! 354: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb5a5c8c0  ! 355: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb3a80820  ! 362: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a58840  ! 365: FADDd	faddd	%f22, %f0, %f26
	.word 0xbfa80420  ! 370: FMOVRZ	dis not found

	.word 0xbba90820  ! 373: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3abc820  ! 375: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb634a0b5  ! 376: SUBC_I	orn 	%r18, 0x00b5, %r27
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	.word 0xbf340000  ! 385: SRL_R	srl 	%r16, %r0, %r31
	.word 0xb1aa8820  ! 392: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3abc820  ! 396: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 399: RDPR_TL	<illegal instruction>
	.word 0xbd518000  ! 401: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa4c920  ! 402: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb80c606b  ! 407: AND_I	and 	%r17, 0x006b, %r28
	.word 0xb7a50920  ! 414: FMULs	fmuls	%f20, %f0, %f27
	.word 0xbfa40940  ! 417: FMULd	fmuld	%f16, %f0, %f62
	.word 0xbfa9c820  ! 418: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbdab0820  ! 421: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0x8795e173  ! 423: WRPR_TT_I	wrpr	%r23, 0x0173, %tt
	.word 0xba9461c3  ! 424: ORcc_I	orcc 	%r17, 0x01c3, %r29
	.word 0xb3a548e0  ! 431: FSUBq	dis not found

	.word 0xb9a00560  ! 432: FSQRTq	fsqrt	
	.word 0xbfa449a0  ! 436: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xb9a00560  ! 438: FSQRTq	fsqrt	
	.word 0x819421fd  ! 441: WRPR_TPC_I	wrpr	%r16, 0x01fd, %tpc
	.word 0xb5a549e0  ! 443: FDIVq	dis not found

	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 451: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbb50c000  ! 455: RDPR_TT	<illegal instruction>
	.word 0xb6c4e0d2  ! 458: ADDCcc_I	addccc 	%r19, 0x00d2, %r27
	.word 0xb151c000  ! 459: RDPR_TL	<illegal instruction>
	.word 0xbda84820  ! 463: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba40820  ! 464: FADDs	fadds	%f16, %f0, %f29
	.word 0x8995602d  ! 469: WRPR_TICK_I	wrpr	%r21, 0x002d, %tick
	.word 0xb7a80420  ! 471: FMOVRZ	dis not found

	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 474: FMOVA	fmovs	%fcc1, %f0, %f26
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54840  ! 481: FADDd	faddd	%f52, %f0, %f56
	.word 0xb9480000  ! 488: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda81420  ! 489: FMOVRNZ	dis not found

	.word 0xbda00560  ! 498: FSQRTq	fsqrt	
	.word 0xb1480000  ! 503: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbba00560  ! 504: FSQRTq	fsqrt	
	.word 0xbfa98820  ! 506: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 507: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a44820  ! 508: FADDs	fadds	%f17, %f0, %f27
	.word 0xb0a5e1e5  ! 509: SUBcc_I	subcc 	%r23, 0x01e5, %r24
	.word 0xb1a84820  ! 510: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a549c0  ! 511: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xbfa5c840  ! 512: FADDd	faddd	%f54, %f0, %f62
	.word 0xbba80c20  ! 513: FMOVRLZ	dis not found

	.word 0xbfab0820  ! 515: FMOVGU	fmovs	%fcc1, %f0, %f31
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xb1520000  ! 519: RDPR_PIL	<illegal instruction>
	.word 0xb5480000  ! 521: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	1, %r12
	.word 0xa1930000  ! 522: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8595a1af  ! 523: WRPR_TSTATE_I	wrpr	%r22, 0x01af, %tstate
	.word 0xbfa5c8c0  ! 524: FSUBd	fsubd	%f54, %f0, %f62
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 526: FSQRTd	fsqrt	
	.word 0xbb520000  ! 527: RDPR_PIL	<illegal instruction>
	.word 0xb81da0dc  ! 528: XOR_I	xor 	%r22, 0x00dc, %r28
	.word 0xbda8c820  ! 529: FMOVL	fmovs	%fcc1, %f0, %f30
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 535: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb1a80420  ! 536: FMOVRZ	dis not found

	.word 0x8994e196  ! 540: WRPR_TICK_I	wrpr	%r19, 0x0196, %tick
	.word 0xb3a80420  ! 544: FMOVRZ	dis not found

	.word 0xbbab0820  ! 547: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb9508000  ! 550: RDPR_TSTATE	<illegal instruction>
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 554: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba58920  ! 555: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb7a449c0  ! 556: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xb7504000  ! 560: RDPR_TNPC	<illegal instruction>
	.word 0xbda00560  ! 561: FSQRTq	fsqrt	
	.word 0xbdab8820  ! 562: FMOVPOS	fmovs	%fcc1, %f0, %f30
	setx	0x62d98e6f00000e5b, %g1, %r10
	.word 0x819a8000  ! 569: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa589c0  ! 571: FDIVd	fdivd	%f22, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba81420  ! 577: FMOVRNZ	dis not found

	.word 0xb9aa8820  ! 578: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbeb520d2  ! 579: SUBCcc_I	orncc 	%r20, 0x00d2, %r31
	.word 0xb3ab8820  ! 580: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7aac820  ! 586: FMOVGE	fmovs	%fcc1, %f0, %f27
	setx	0x68cfcd5700008d9b, %g1, %r10
	.word 0x819a8000  ! 587: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda80820  ! 588: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	setx	0xb5be0e030000fd95, %g1, %r10
	.word 0x819a8000  ! 589: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa58860  ! 590: FADDq	dis not found

	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408c0  ! 594: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb6ac0000  ! 596: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xb9a5c940  ! 599: FMULd	fmuld	%f54, %f0, %f28
	.word 0x8394a0e3  ! 600: WRPR_TNPC_I	wrpr	%r18, 0x00e3, %tnpc
	.word 0xb9aa8820  ! 601: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbba80c20  ! 602: FMOVRLZ	dis not found

	.word 0xbfa50860  ! 603: FADDq	dis not found

	.word 0xbba50920  ! 605: FMULs	fmuls	%f20, %f0, %f29
	.word 0x8d95a06c  ! 606: WRPR_PSTATE_I	wrpr	%r22, 0x006c, %pstate
	mov	0, %r12
	.word 0x8f930000  ! 607: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a9c820  ! 613: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x8594200d  ! 614: WRPR_TSTATE_I	wrpr	%r16, 0x000d, %tstate
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084216c  ! 622: ADDcc_I	addcc 	%r16, 0x016c, %r24
	.word 0xbdab0820  ! 624: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80c20  ! 625: FMOVRLZ	dis not found

	.word 0xbb520000  ! 627: RDPR_PIL	<illegal instruction>
	.word 0xbfa8c820  ! 629: FMOVL	fmovs	%fcc1, %f0, %f31
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 635: FSQRTs	fsqrt	
	.word 0xbba4c9a0  ! 638: FDIVs	fdivs	%f19, %f0, %f29
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 640: FSUBs	fsubs	%f23, %f0, %f26
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf35e001  ! 642: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xb3a4c8e0  ! 644: FSUBq	dis not found

	.word 0xbda5c9c0  ! 645: FDIVd	fdivd	%f54, %f0, %f30
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58960  ! 651: FMULq	dis not found

	.word 0xb5a00560  ! 653: FSQRTq	fsqrt	
	.word 0xb9a94820  ! 655: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa4c920  ! 657: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbfa00020  ! 659: FMOVs	fmovs	%f0, %f31
	setx	data_start_4, %g1, %r17
	.word 0xb9a4c960  ! 663: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40960  ! 668: FMULq	dis not found

	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc95210b  ! 679: ORcc_I	orcc 	%r20, 0x010b, %r30
	.word 0xb6b4a0ec  ! 682: ORNcc_I	orncc 	%r18, 0x00ec, %r27
	setx	data_start_1, %g1, %r18
	.word 0xb3510000  ! 690: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 694: RDPR_TICK	<illegal instruction>
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 696: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb7a80c20  ! 698: FMOVRLZ	dis not found

	.word 0xbba80420  ! 706: FMOVRZ	dis not found

	.word 0x819421d5  ! 707: WRPR_TPC_I	wrpr	%r16, 0x01d5, %tpc
	.word 0xbda54960  ! 712: FMULq	dis not found

	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc44208e  ! 719: ADDC_I	addc 	%r16, 0x008e, %r30
	.word 0xbb7d0400  ! 721: MOVR_R	movre	%r20, %r0, %r29
	.word 0xb5a44820  ! 724: FADDs	fadds	%f17, %f0, %f26
	.word 0xb3520000  ! 730: RDPR_PIL	<illegal instruction>
	.word 0xb5a5c820  ! 734: FADDs	fadds	%f23, %f0, %f26
	.word 0xbfa8c820  ! 738: FMOVL	fmovs	%fcc1, %f0, %f31
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c840  ! 741: FADDd	faddd	%f54, %f0, %f60
	.word 0xb1a00560  ! 745: FSQRTq	fsqrt	
	.word 0xb7ab0820  ! 746: FMOVGU	fmovs	%fcc1, %f0, %f27
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9342001  ! 755: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x9195e075  ! 757: WRPR_PIL_I	wrpr	%r23, 0x0075, %pil
	.word 0x8d95e100  ! 758: WRPR_PSTATE_I	wrpr	%r23, 0x0100, %pstate
	setx	data_start_0, %g1, %r17
	.word 0xb3a00560  ! 761: FSQRTq	fsqrt	
	.word 0xbfa84820  ! 762: FMOVE	fmovs	%fcc1, %f0, %f31
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 765: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb551c000  ! 766: RDPR_TL	<illegal instruction>
	.word 0xbfaa0820  ! 769: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb3a448a0  ! 770: FSUBs	fsubs	%f17, %f0, %f25
	setx	data_start_2, %g1, %r16
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8a0  ! 779: FSUBs	fsubs	%f19, %f0, %f24
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	setx	0x80b55a9200006dc6, %g1, %r10
	.word 0x839a8000  ! 790: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa54920  ! 791: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb3a4c960  ! 793: FMULq	dis not found

	setx	data_start_4, %g1, %r16
	.word 0xb8858000  ! 798: ADDcc_R	addcc 	%r22, %r0, %r28
	.word 0xbba54840  ! 801: FADDd	faddd	%f52, %f0, %f60
	.word 0xb9a4c920  ! 804: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbd3cb001  ! 807: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xb3a508a0  ! 808: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb3a94820  ! 812: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbf510000  ! 813: RDPR_TICK	<illegal instruction>
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 818: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5aa0820  ! 819: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbf50c000  ! 823: RDPR_TT	<illegal instruction>
	.word 0x87956065  ! 825: WRPR_TT_I	wrpr	%r21, 0x0065, %tt
	.word 0xb5a50960  ! 830: FMULq	dis not found

	.word 0xb5a5c860  ! 833: FADDq	dis not found

	.word 0xb9a80c20  ! 834: FMOVRLZ	dis not found

	.word 0xb81cc000  ! 836: XOR_R	xor 	%r19, %r0, %r28
	.word 0xb40d20ec  ! 842: AND_I	and 	%r20, 0x00ec, %r26
	.word 0xb3a81820  ! 846: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb5a81420  ! 847: FMOVRNZ	dis not found

	.word 0xbfa4c8c0  ! 848: FSUBd	fsubd	%f50, %f0, %f62
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 855: FMOVNE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a80420  ! 859: FMOVRZ	dis not found

	.word 0x859520fd  ! 861: WRPR_TSTATE_I	wrpr	%r20, 0x00fd, %tstate
	setx	0x117ccb300003ec1, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a81420  ! 869: FMOVRNZ	dis not found

	.word 0x89952027  ! 872: WRPR_TICK_I	wrpr	%r20, 0x0027, %tick
	.word 0xb9aac820  ! 878: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda80c20  ! 893: FMOVRLZ	dis not found

	.word 0xbe0ca0ea  ! 894: AND_I	and 	%r18, 0x00ea, %r31
	.word 0xb9a00520  ! 895: FSQRTs	fsqrt	
	.word 0xb5ab0820  ! 901: FMOVGU	fmovs	%fcc1, %f0, %f26
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 903: RDPR_TT	<illegal instruction>
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 907: RDPR_PIL	<illegal instruction>
	.word 0xb9510000  ! 912: RDPR_TICK	<illegal instruction>
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c820  ! 921: FADDs	fadds	%f19, %f0, %f30
	.word 0xbfa00020  ! 925: FMOVs	fmovs	%f0, %f31
	.word 0xbba408e0  ! 928: FSUBq	dis not found

	.word 0xb5504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xb9a8c820  ! 931: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda5c820  ! 937: FADDs	fadds	%f23, %f0, %f30
	.word 0xb3a5c840  ! 939: FADDd	faddd	%f54, %f0, %f56
	.word 0xb1a508e0  ! 940: FSUBq	dis not found

	.word 0xb7a408a0  ! 941: FSUBs	fsubs	%f16, %f0, %f27
	.word 0x839421ad  ! 944: WRPR_TNPC_I	wrpr	%r16, 0x01ad, %tnpc
	.word 0xbdaac820  ! 947: FMOVGE	fmovs	%fcc1, %f0, %f30
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 959: RDPR_PIL	<illegal instruction>
	.word 0xb934f001  ! 962: SRLX_I	srlx	%r19, 0x0001, %r28
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	.word 0xba840000  ! 969: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xbdabc820  ! 970: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a94820  ! 972: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a98820  ! 973: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa94820  ! 975: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8794e17d  ! 979: WRPR_TT_I	wrpr	%r19, 0x017d, %tt
	.word 0xb1aa4820  ! 984: FMOVNE	fmovs	%fcc1, %f0, %f24
	mov	1, %r12
	.word 0xa1930000  ! 986: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb351c000  ! 990: RDPR_TL	<illegal instruction>
	.word 0xb3643801  ! 995: MOVcc_I	<illegal instruction>

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

	.xword	0xb5f5d05d261c3f63
	.xword	0xd58eb73829cc5b14
	.xword	0x00659be10d095909
	.xword	0xbf572c65b133bf37
	.xword	0xb6cf289dde1f8835
	.xword	0xe6544dd6215d4def
	.xword	0x168f848f04f41147
	.xword	0xd6b2c06418e5ccbc
	.xword	0xc46f1fea85821657
	.xword	0x5eee12365c9157ae
	.xword	0xded2f4567d18a651
	.xword	0x7bdf6748636aaf69
	.xword	0xb21c164e7127fc64
	.xword	0xde043ba55fadf10b
	.xword	0x432c9eebd0a3743b
	.xword	0x8dac7a2f8e759cfb
	.xword	0x4a2f4bb1d273632e
	.xword	0x86edd7309744bfeb
	.xword	0x7ace89090dc26ac1
	.xword	0x180bd949a2ea0569
	.xword	0x6b0afd54924555e3
	.xword	0xadf93205b5a3bdc6
	.xword	0xdf2da97ea6106e1d
	.xword	0x95941bf2fed2bc3c
	.xword	0x10d1ed2d3541d125
	.xword	0x06d11d0967a05e2c
	.xword	0x066cc884aacab554
	.xword	0x8902150d35d24524
	.xword	0x92bac86c3de734e6
	.xword	0x408332bccd2fca24
	.xword	0xe004fb421ed768e7
	.xword	0xbd07df86baa839b2
	.xword	0x2cf3cf967409ed47
	.xword	0xd5b643abde56906e
	.xword	0x3f0cf7227845ff3a
	.xword	0xaee743c3686ccb98
	.xword	0xcde3560d39e8031c
	.xword	0x203b9565e5e6e866
	.xword	0x07c038bf7bc92e6d
	.xword	0xcd96bf1bce7c801d
	.xword	0xa12dec4390592dbe
	.xword	0xc79d9fab16d46855
	.xword	0x879c5bdaeef9411e
	.xword	0x0d9273835fe9ec0d
	.xword	0x2159d97f9d40e37c
	.xword	0x7d089d69f2902d0f
	.xword	0x317cbb7665c7f137
	.xword	0xbe2c0702fea51201
	.xword	0xc860a9401e997f09
	.xword	0xa687dfc9b9b26cf6
	.xword	0xbf5ab1ba777f97de
	.xword	0x22c06b5e1ed28a9c
	.xword	0xf8295fef188c6e9e
	.xword	0xa75e79c660519d2d
	.xword	0x705fe059e478d0b1
	.xword	0x624ada689b0ac6e6
	.xword	0x8ee62196f61c7e69
	.xword	0xeca82022180237be
	.xword	0x7aa40a5c0e1ad736
	.xword	0xaf7d2539c1c10ae3
	.xword	0x8574d689aa6fb7ee
	.xword	0x5da88ee4c64e7145
	.xword	0xcba01e58afa23ff5
	.xword	0x2897d92839b4f53c
	.xword	0x2c43ae37f8a1aad0
	.xword	0xfa653e2e2e85cd55
	.xword	0x3bf9086f916946d6
	.xword	0xcc0efcc2021b4fc6
	.xword	0xe6775ca5f056c2a5
	.xword	0x51ffd7fc1bf47f8f
	.xword	0x0bbbfc33146e5840
	.xword	0x7b26ee126fbe44ae
	.xword	0x971503aef92523d3
	.xword	0xda92f9aba622f6d4
	.xword	0xfbd603cef69d76a1
	.xword	0xa864f2b89c348a99
	.xword	0xc0932ede073dade8
	.xword	0x9258e5b279623c02
	.xword	0xb564c38dff79e953
	.xword	0xa74ccaf1c3a794d9
	.xword	0xabb0c2c1ff9b21a7
	.xword	0xc76179bb48f70c5a
	.xword	0xeccd5978eacaf620
	.xword	0x4b3ea8e29e4d8198
	.xword	0xd8ab97953948c18b
	.xword	0xda5718ad006b97f1
	.xword	0xa5a76b1b1dbc451f
	.xword	0x2c9d262c1b14c0c8
	.xword	0x8a499d0b39f6f15c
	.xword	0x51488006fcbbf3b2
	.xword	0x989ca533d3fcb671
	.xword	0x4e32c87d74ff99a0
	.xword	0x1e43872067e21b79
	.xword	0xc20d5bdcea1578d2
	.xword	0xf7914ede29905d0d
	.xword	0x08e6b4a2f2e824f8
	.xword	0x70257d8f8a600f54
	.xword	0xd8ac84b98d88ef93
	.xword	0x45a3d6477d2ccb75
	.xword	0xba0938ae39cfecaf
	.xword	0x58ff6280125e9c95
	.xword	0xc5039eb9ea22f246
	.xword	0x4a308bfac2eee5be
	.xword	0xface0ed4b169e533
	.xword	0x3083ca5029735b62
	.xword	0x28da9c18b9af06d5
	.xword	0x0648c4446881c611
	.xword	0xa4a99c0cd592d436
	.xword	0xfe89f9fd78cdf9d0
	.xword	0x194c4d2bd65413a1
	.xword	0xb0534e68b9ff2fc7
	.xword	0x56c8c8517a318ca7
	.xword	0x330e76b255f03f55
	.xword	0x5db8eae812857f2d
	.xword	0xa168bc537218a1fe
	.xword	0x1aeb8f792f8fbd46
	.xword	0x852dee935c62fd85
	.xword	0xb4e79ac48fd7ac3b
	.xword	0x2906114810c66faf
	.xword	0x6290706bb6e95e3b
	.xword	0x0492901f60049858
	.xword	0xa6697378c5fa0e79
	.xword	0x82045e50fc9ae232
	.xword	0x4d6a849934cf5c76
	.xword	0x33e971f88bff2a58
	.xword	0x651648a966ba2d9f
	.xword	0x3ca474c94a7fc484
	.xword	0xdcd7343ec800ff46
	.xword	0xcda04600aaf5bd86
	.xword	0xed86bb0d51b4e664
	.xword	0xc6054dd5fc42e12e
	.xword	0xf6d11ae4b4fdb049
	.xword	0xd3c3bdab42ea7299
	.xword	0x051b0ff34be69d09
	.xword	0xe6e61dc944389d4b
	.xword	0xfcc0e7de278bf685
	.xword	0xb76fad3c0ead04d3
	.xword	0xf900e4a7fbf3224c
	.xword	0x313040dd62834686
	.xword	0x2021ab54255a1cab
	.xword	0x27e023fa3a36035d
	.xword	0xf9786c4fee9fe411
	.xword	0xf3b2ce3a2b7ab1f7
	.xword	0xb84580b85b9ddc6e
	.xword	0xb5f5ae50f0ef18f5
	.xword	0xd2b1663457162cbe
	.xword	0xbd9eeef6676fef7a
	.xword	0x07f3281e621e4404
	.xword	0x0985171eb4916db3
	.xword	0x28bd0d3a720e1a5f
	.xword	0xc104ee7a269f1487
	.xword	0xf44f8476ea6a3838
	.xword	0xbfeac8dc179d0467
	.xword	0xab6a701d89ff8766
	.xword	0x4b678a9f2713cc09
	.xword	0xabab36ac8bd5efd6
	.xword	0xc5d5f4b4ad7ddc42
	.xword	0x87b3de8ff834ce02
	.xword	0xae937548cb0f310b
	.xword	0x3afef8e6b23300c6
	.xword	0x32daab74cf765e57
	.xword	0x5c405af49fed0f39
	.xword	0xc0bfc9390b35397f
	.xword	0x3d10bb03b135a81e
	.xword	0xe65d09498c013bd9
	.xword	0x580ca7b1a93702db
	.xword	0x0355f8bd2e628604
	.xword	0x11c34fe57a65b169
	.xword	0x240d5e05bdf07112
	.xword	0xa11c1900dcb1bde6
	.xword	0x14cef1aeab3c5202
	.xword	0x6fce37201af1673d
	.xword	0xd2483024f5b8aae1
	.xword	0xbb307d1761c6cc48
	.xword	0xe0eccf424fd70888
	.xword	0x3a279aaa24b77b32
	.xword	0xb2cc6f3a98bd1dcd
	.xword	0x146c496b23bcdc28
	.xword	0xfdd367584aa83249
	.xword	0xf56e1c24da99fed7
	.xword	0x811847a852000349
	.xword	0xfe48f3fc981a948d
	.xword	0x827cc8d99764c74e
	.xword	0xf20060a79eedb435
	.xword	0x51470700ab01a717
	.xword	0xffc637115a1b9a75
	.xword	0xbfa2c89de0af7b70
	.xword	0x7baa4145eac9a981
	.xword	0xe0591d715219edbe
	.xword	0x8f03c5db3348eb38
	.xword	0x1d833da3e97f1ba7
	.xword	0x93b5779e7dd26a50
	.xword	0xa8da3e42fc64a3d0
	.xword	0x8d8e2fcfe1d97b73
	.xword	0xa6aae8bf170bf2a0
	.xword	0x3557eba3d13ddece
	.xword	0x5e844a887da741fe
	.xword	0xb6118483af3f3994
	.xword	0xac506049d891c9b9
	.xword	0x3415957ec252e207
	.xword	0xab26c97573a3fa4a
	.xword	0xf1bdd3022c956f3f
	.xword	0xd9caf0277427f991
	.xword	0xb7745a61112055fb
	.xword	0xec720aed9ba97961
	.xword	0xeca64023cdeb20d9
	.xword	0x7a15e72b8439b8d2
	.xword	0xe241e5291291ef07
	.xword	0x1dc01b90b40984ff
	.xword	0x77d1a41a2eb70d5a
	.xword	0x8807319765c07f25
	.xword	0x7ebbb312c9cd815d
	.xword	0x7498f760df5b7620
	.xword	0xad368e3db7ba7fa3
	.xword	0xb80afac29091ca79
	.xword	0x1baabac984d39768
	.xword	0x1401e2ee2cc61d61
	.xword	0xbd9e00f78ee83df2
	.xword	0xae81eb69fac9fa21
	.xword	0xd2c8cdbb71b78ca2
	.xword	0x1644330b2619d31c
	.xword	0xad5972db99f5a941
	.xword	0x8b8e7ae22d1a5502
	.xword	0x8c64828e5736f0be
	.xword	0xea608094dd851af5
	.xword	0x651167c281ea3dc0
	.xword	0x583150dcd2acb561
	.xword	0x1717f2475f15890f
	.xword	0xd1bac99a065392be
	.xword	0x100e34212e170e8a
	.xword	0x3fa341a4e0fe6765
	.xword	0xfd909316397c8750
	.xword	0x231646049ec1a272
	.xword	0xcdee199e9997b2b0
	.xword	0x0c41d7cb9ccf101f
	.xword	0x99f4720f56c67f21
	.xword	0x86c719897334bac1
	.xword	0x2ae9e27123281f3f
	.xword	0x545f20e605daeb80
	.xword	0xdcb985f3da721760
	.xword	0xb5017e99d86e8542
	.xword	0x8b8a57064067341a
	.xword	0xcda8738bfd89d65b
	.xword	0xefeaaaed5b2befb5
	.xword	0x193260f5ab4078a1
	.xword	0xe7654f2426ac88b1
	.xword	0x3f198a516d279fd2
	.xword	0x853b11cca0864222
	.xword	0x8d692070823329d1
	.xword	0x0622d482c3c7bef5
	.xword	0xca47a5bd38bae57c
	.xword	0xcf3288bbb28a08c8
	.xword	0x6d59b1df68338723
	.xword	0x4b3355d770b1416c
	.xword	0x5ee28c7ad5901112
	.xword	0xc0d1a1eb9ec51efb
	.align 0x2000
	.data
data_start_1:

	.xword	0x41d6b29e897941e7
	.xword	0x254c1e269d254ff7
	.xword	0x6aee507ba7741731
	.xword	0xceb3d65d3f483dc7
	.xword	0x0b9bc794f6e3ef24
	.xword	0x42165cd803cca535
	.xword	0xc85556e007d3597b
	.xword	0x4b40c89b9c86b45a
	.xword	0xbbee643f1690bc6b
	.xword	0x31021226c97d9ef0
	.xword	0x616f0e227cb6a93f
	.xword	0xd171761914ebd1ef
	.xword	0xa5933c1b16d8bbb6
	.xword	0x3857d6db3a57ff85
	.xword	0xcfa964a6be203a64
	.xword	0x7b33c81f86051b01
	.xword	0x5d6325ca3e71b435
	.xword	0x64e0f2f6d1766fa5
	.xword	0x32d8d8030972a6d8
	.xword	0xbbb4577b99774800
	.xword	0x70bd5476f88d7496
	.xword	0x085f98426b1e0ce8
	.xword	0x477eb32f31dbe3c8
	.xword	0xea73b493c6fe6c09
	.xword	0x3b252f647a107067
	.xword	0xc689dbf69b8d29e7
	.xword	0x1c5a0ec010649ebc
	.xword	0xa2a46d0b6987b604
	.xword	0x74dde756c1075d40
	.xword	0x2667bf34088da63b
	.xword	0x3c0eaf7adf7c3186
	.xword	0x69bfbf0e89fbc207
	.xword	0x554590dfdd9cef58
	.xword	0x57d394c4be392903
	.xword	0x4d5d5eacd4b0659c
	.xword	0xcd975f9498677d6a
	.xword	0x81427040fa90af88
	.xword	0xd10276878d7c2512
	.xword	0x05ed6543d8531b83
	.xword	0x3e430fb346d16f1c
	.xword	0x6bc858e0c6995699
	.xword	0xc39524bbdd42d302
	.xword	0xf899ba1ab3fe5cac
	.xword	0x173cf5cce55e0940
	.xword	0x13afc60433533acc
	.xword	0xb3c6739e23915787
	.xword	0x8c1a9e3e56a04b4b
	.xword	0xb6325b89285574d4
	.xword	0x9ae9f80af1931ac5
	.xword	0x555a891bc41fe3d8
	.xword	0x5fe628170145f39f
	.xword	0x031b0cf72dbe6195
	.xword	0xc803d1a629ff8bb7
	.xword	0xaef8c96d21221278
	.xword	0x4c3cbfef029bd737
	.xword	0x5265934ba10ef9ca
	.xword	0x825cb1508bd127e9
	.xword	0xaa69fa6e7b071a91
	.xword	0x883301075f6360f7
	.xword	0xa43de24c0dddda37
	.xword	0x778a9a46d7073c48
	.xword	0x250dc11b0e4850f3
	.xword	0x5622212c00c15e8f
	.xword	0x938a6d8ce0f0bff2
	.xword	0xd6d1b88d9f6ea9f5
	.xword	0xfdd902b0907f37f1
	.xword	0xf893309a5cc0206f
	.xword	0x32451c2316fbc4f7
	.xword	0x89ebb4b4c4d6c53f
	.xword	0x7a300f9a8731c758
	.xword	0x404a24bc6c4409dc
	.xword	0x3d15c4de002bd842
	.xword	0x1de86d5285404e78
	.xword	0xe070ed280bc0d861
	.xword	0x57f563a5536f700b
	.xword	0xa12781e5f941d3ca
	.xword	0xd4c36b83e5bc09b3
	.xword	0x63cc368d36d1ef33
	.xword	0xe5c9610b203cf63e
	.xword	0x9d565e2d2c927063
	.xword	0x3a5959531d8bfa6d
	.xword	0xf778f5204c5fdf9d
	.xword	0xb5975ae5155f71aa
	.xword	0xf77594400bb0f784
	.xword	0x916fc62a19d7ae5a
	.xword	0xb76b9118d469dbe5
	.xword	0x5f7eab3359d63e4b
	.xword	0x03c455ebf929f31e
	.xword	0x3725fe19a4f67884
	.xword	0xb717e9092f94668c
	.xword	0xd59294d80d6eca95
	.xword	0xb8d226841683fb4e
	.xword	0xf33bd0a6eab65d04
	.xword	0xcd80d210e5f70201
	.xword	0x7e32d4ad4319acf5
	.xword	0xe953494052bcb948
	.xword	0x9c8ca8b8caae4930
	.xword	0xaab880f5abffb828
	.xword	0x7a03c68b33c78ca0
	.xword	0x071f909a18e41c94
	.xword	0xe0687a5b236c7cf2
	.xword	0x86caa2cecb4a5637
	.xword	0x6d833325b834f155
	.xword	0x7e753f9d87c60a32
	.xword	0xa76d25ca098e9254
	.xword	0xec28b05ea6dc74c8
	.xword	0xe076e74226af5a50
	.xword	0x56bbfb84519113a2
	.xword	0x9a2d4cdd397dbaa6
	.xword	0x3de9e6c3df6a3b6a
	.xword	0xbc78bbb6fc9df6e3
	.xword	0x3a9781864d187f9c
	.xword	0x03bc38147b0485a8
	.xword	0xaf2017c5d7dedc71
	.xword	0xe8386b564f81bc1b
	.xword	0x282a4ab91b6d9bfc
	.xword	0xe07991ad4ea5ff9e
	.xword	0xc04e688117285ab9
	.xword	0xab854a0fa56ac9c9
	.xword	0xcb007529eaa35768
	.xword	0xc0c16c8121c43070
	.xword	0x4d067e4a9caa09d0
	.xword	0xf65cadb19269c8c6
	.xword	0x37c611eec7bcc183
	.xword	0x0aa237065cd4cc13
	.xword	0x31c468a7598c1523
	.xword	0xfdfdd41c68096be3
	.xword	0x042afbbd57958164
	.xword	0x033b06e692cc16e7
	.xword	0xf44a565a0819dc52
	.xword	0x5622d453d3103ef1
	.xword	0x177cf08422bacb97
	.xword	0xde19c2cb5b92bf68
	.xword	0xb85c38beaf12b76f
	.xword	0x2c323046e5e5c40a
	.xword	0x6a64ca01d389e76f
	.xword	0x491c54a911ba8108
	.xword	0xa0f8c5ff2eb8fcd3
	.xword	0x76374575dd300f1b
	.xword	0xd51a54fee5c77867
	.xword	0x9a863c1177e7e88a
	.xword	0xd0a7422e26af4853
	.xword	0x21ea9b656cfa7aba
	.xword	0x2e6b80a4e7bdc4f9
	.xword	0x66840f13ef8819b7
	.xword	0x851ac9513ebd0d9e
	.xword	0x5e99f6119e320f34
	.xword	0xa96cb3de33ab1d75
	.xword	0xb731e6d3d6b0096a
	.xword	0xa48d264aa5eab6db
	.xword	0x65a3fe0c4e2a298b
	.xword	0xcf4228fe1a8c538b
	.xword	0xa223e548e6556d9a
	.xword	0xfe49287af0bad543
	.xword	0xa3df741fabca9d44
	.xword	0x8f9551bdf16f806e
	.xword	0x032446bcdba6f3d3
	.xword	0x1e012b0f07ded8f0
	.xword	0x1681d46d0b786fb0
	.xword	0x3d5916738fa5e317
	.xword	0xa3d84ac77e56eb59
	.xword	0xbeee7dde005f486a
	.xword	0x498fbbd5413a29a7
	.xword	0x6a18d73c991516b0
	.xword	0x4d92c62257749a0a
	.xword	0x09628f347b5a3db6
	.xword	0x7027fc60c6f385fb
	.xword	0x62d4965f6c0c0729
	.xword	0x1eb6903cb5c3b916
	.xword	0x68dfa96a9cf97e45
	.xword	0x1d93a8468247c0cc
	.xword	0x1497896075bff5b6
	.xword	0xbbe34b46fc14d0f7
	.xword	0x39b19a215ee43414
	.xword	0x47d19e4362dd02a7
	.xword	0xd8b71eadaf1a5e66
	.xword	0x6f422c43f33d4205
	.xword	0xc2d1d18d6a407689
	.xword	0xcf5d17f43a9285a5
	.xword	0xb407f93cee9678e0
	.xword	0xf31ca7f800700c34
	.xword	0x7b7c6f34fe784d79
	.xword	0x7527a299bfd6d39c
	.xword	0x15cb88fcca613cf6
	.xword	0xcb881cbe3238b482
	.xword	0xcf5975f5472bccbe
	.xword	0x3a7b4d29efcaedbd
	.xword	0xc9911992af2b71e1
	.xword	0x30ede5266249639f
	.xword	0x37abd5873288074d
	.xword	0xed44c6eaa921f019
	.xword	0x7a861aecb03f5fde
	.xword	0x3cca643a0b61d073
	.xword	0xf6c69dc11f8e5b64
	.xword	0xa0f61d00d5ec79b2
	.xword	0xd7e4f47d98760f70
	.xword	0x02675d1790693301
	.xword	0x5d0bd079e3fd5f22
	.xword	0xf5128a630ea9c6a8
	.xword	0x0414676b67a26454
	.xword	0xf38f853c0e68f513
	.xword	0x672f5539d7c22beb
	.xword	0x593474c305cace3d
	.xword	0x349564307db31933
	.xword	0x5794e91a46f49cfb
	.xword	0xec65d58d38e82f5d
	.xword	0x56e93051b3caa330
	.xword	0x75d4665bc941cc8e
	.xword	0x5f61295030886e33
	.xword	0x45b3d2028833a836
	.xword	0x4037e0042e70b2db
	.xword	0xb507ccec9ed8511e
	.xword	0x7c3f83b76ef6ed32
	.xword	0x94983d35a66e5676
	.xword	0x7eac22a7f67dd645
	.xword	0xfb952e58d50b7888
	.xword	0xb609372b2e54919a
	.xword	0x4e5c8ba7eb73d023
	.xword	0xe70b02f60ca7b719
	.xword	0xa484d2f5cc0243ea
	.xword	0xcab415caf455d98d
	.xword	0x5703ba633b3d9783
	.xword	0x204feb5e4044e9f6
	.xword	0x2d2d1c8fc850a930
	.xword	0xba6f781146e91c28
	.xword	0xf6412a0574411c6a
	.xword	0x2618a664e3eae445
	.xword	0x5afa2f196ad63654
	.xword	0x50a3b150b72c6af6
	.xword	0x3ef4c1d90b67e66d
	.xword	0x52d97e365edfc5ba
	.xword	0x483c86b28a5d4dd9
	.xword	0x0ab8e9e8cfe6b1a4
	.xword	0xc4f1b7efd3b0c501
	.xword	0x02a5fcbc4594ab70
	.xword	0x363c5ac8235bf3cd
	.xword	0xf9944d3aa3855e57
	.xword	0x6f7cc91a16f90a0d
	.xword	0x1c67ea62372171dc
	.xword	0x43038c6bbaa7b336
	.xword	0x311baa908b4a89f4
	.xword	0x58287e168e03362b
	.xword	0xe6bbcf2b87f78f1d
	.xword	0x35ec3b95402aa990
	.xword	0xb7d89b2e6efd52d8
	.xword	0x06b12c565f609aa7
	.xword	0xb6a50fa1caccc18c
	.xword	0xc50f36a4515bee5b
	.xword	0x7a04f2b086d1fd15
	.xword	0x0ed83336c06195e2
	.xword	0xd3458502775cf371
	.xword	0xd69f18c50a0b1761
	.xword	0x664377b0453883ae
	.xword	0x59844a3354157e0d
	.xword	0x2855424f58ccfb73
	.xword	0x3db601dbfb3fed57
	.align 0x4000
	.data
data_start_2:

	.xword	0x8241174386ccf387
	.xword	0xe7ce60ff6ad33cd5
	.xword	0x63a657483d508c4c
	.xword	0xaffab467a56c77da
	.xword	0xee5f69d4a397d46e
	.xword	0x9f75753a7523436c
	.xword	0xd074e93db9437022
	.xword	0x59f2baf387c2c812
	.xword	0x8a00313750129255
	.xword	0x28b9406d401051d5
	.xword	0x74ef08668ccc5a8f
	.xword	0x717aea11a7ec8b45
	.xword	0xaf656d637100ce7c
	.xword	0x7bebee81bce1b2ad
	.xword	0xbb79ac56e806eb1e
	.xword	0xa8a94a24654e2e65
	.xword	0x2f90748dcdf28065
	.xword	0xb8f2090f45bf0efa
	.xword	0x20e48f8cad2d9cc7
	.xword	0xc8b6093c8c86c66b
	.xword	0x1e884ae0a3e566c9
	.xword	0xb83af37cd0a74dc2
	.xword	0xd66e8a88090fabf6
	.xword	0xf33acc6061e5ac89
	.xword	0x361b484bb183c391
	.xword	0xa26d17b65769377a
	.xword	0x8f9e21b535430f8b
	.xword	0x08f0f9aa0c38344d
	.xword	0x7851c48f762b3990
	.xword	0x927a9373ed3942fd
	.xword	0xc63092c885df5e8d
	.xword	0x9f24d2176dce5555
	.xword	0xfb74c7a6cbfc2f15
	.xword	0x17d16c74dc128dd5
	.xword	0x4c5d430c0a05a450
	.xword	0x4b1a69573905d729
	.xword	0xb146a37891eaf9bc
	.xword	0x76d71e1671a5d33d
	.xword	0x0a05147034700477
	.xword	0xa6d28a225f2b9ca4
	.xword	0x97fc5c5c34907485
	.xword	0x245f666d3b599ddc
	.xword	0x9ac342b0c25919f5
	.xword	0x06086450db6dcfbf
	.xword	0x9025d86b44188e31
	.xword	0x4b1da4374915a27c
	.xword	0xe02e74d22f063dd0
	.xword	0xb0a2af1488935cdc
	.xword	0xef0636214f461425
	.xword	0xa64ece0ae3786ffd
	.xword	0xddc95c9fc0bd66a8
	.xword	0xffd82115c465fcd6
	.xword	0x14daa7f8f0552be3
	.xword	0x461d89c479189e0c
	.xword	0xb889287a442a0cbe
	.xword	0xd7b685739b65fc01
	.xword	0x60ee42640e40abe7
	.xword	0x135babc6370a3f33
	.xword	0xc14081822ae80567
	.xword	0x2c2353d654afa029
	.xword	0x21613589cc41931c
	.xword	0x08c1c49517428619
	.xword	0xe29ff4af2644ab0d
	.xword	0x24189bffdd4d34b5
	.xword	0xa706e039d06bcde0
	.xword	0xe22860bd8065a8f7
	.xword	0xe4841481829c8c7c
	.xword	0x75fa5929a254998f
	.xword	0x6e7505a57c0bdc9f
	.xword	0x039b0d712a7ed7e5
	.xword	0xf284240384e327d4
	.xword	0x263abff2f28c1915
	.xword	0x9abdf2c8f8d7c1f3
	.xword	0x0297d92603794085
	.xword	0xff610f25f244c28d
	.xword	0xb087938aa1850e40
	.xword	0xda9f773052f309f6
	.xword	0x9235ac99162467ab
	.xword	0x43ccfc621816ad0d
	.xword	0xc7917524f478c78b
	.xword	0x36c06dc13e75f000
	.xword	0xd915720cb2d19860
	.xword	0xe27b9a0ec5f8dcf7
	.xword	0x02a3a43bb69a238c
	.xword	0x3f42888bebfb4779
	.xword	0xd8fb3ddab1048609
	.xword	0x7e446792c1721a5f
	.xword	0x2d440f8a5be2eaf9
	.xword	0x101b04101519da28
	.xword	0x763dba9d646365ec
	.xword	0x478ddc73c94caa07
	.xword	0xa9392611b3878792
	.xword	0xd89d3320a229eb2b
	.xword	0x957c4298ca5c5400
	.xword	0xebc6dbb8cb96399b
	.xword	0x67330d351364de1a
	.xword	0xfcb6b97b1cb0a52b
	.xword	0x076f46a4f548de90
	.xword	0xb207f517b1906d72
	.xword	0xbea497875cd8fd6a
	.xword	0x24a31cc00edac65f
	.xword	0x00d3285cf8189421
	.xword	0x2a6c1410c95e9bb5
	.xword	0xeee52ed99f159603
	.xword	0xcceb6ef2ed2b3284
	.xword	0xe4dc7e3fea72b89b
	.xword	0x4a14bc56ae9c521c
	.xword	0x1f700c2203ae25e7
	.xword	0xc83c353fcf4f1eec
	.xword	0xf3fd4322c7cb4420
	.xword	0x68ebc3d3ede6ccd1
	.xword	0xcfb5a975aa76eba4
	.xword	0xc8a0fc713644bc92
	.xword	0x959d89c69c59dcc9
	.xword	0xba707f750a35a2f2
	.xword	0xa4026905f4454255
	.xword	0x21234e6468043f6b
	.xword	0x679d7dbc0ad72a17
	.xword	0x6f2fe320fab9bf62
	.xword	0x9a01ba2698798533
	.xword	0x23983aec3cd951a5
	.xword	0x55f42297febd179c
	.xword	0xf8ceaaabdaebcbbc
	.xword	0x4c0e3bb05d863cf3
	.xword	0x0e59048c3162a59a
	.xword	0x4c3d9fe318e28906
	.xword	0x552bd4bf0b8f04f9
	.xword	0xcc39883fa044d16d
	.xword	0xbccf9099a97b7c4a
	.xword	0xa7706909a2bee8e0
	.xword	0x9ebd7db14d8a0de8
	.xword	0x023a45ac984cc916
	.xword	0x296af7caf930389b
	.xword	0x2f9eeb8be2f09990
	.xword	0x0ce486ff61a72536
	.xword	0x4d01cbfd3ff35cdc
	.xword	0x48baa4783bae41b5
	.xword	0x234519798df96eb4
	.xword	0x6c65907286b19f53
	.xword	0x066bb457cab00acd
	.xword	0x276e39c56b4d3c88
	.xword	0x4a89edcb43198f0e
	.xword	0x5888807e016c12e7
	.xword	0x80a72759eb299074
	.xword	0xccefca9714deb495
	.xword	0x5ad1a536af272ac0
	.xword	0x83d99773b7926e3a
	.xword	0x3f6d102f8dff7de4
	.xword	0x0d321f6e65c615c2
	.xword	0x15de0b67577c787d
	.xword	0xba5e68403c4fe72f
	.xword	0xbf6220814b126e97
	.xword	0xee2c523eb18d273a
	.xword	0xb8a9befcc75cda88
	.xword	0xfb7a01ca7879821e
	.xword	0x03d3904361f800ec
	.xword	0xf31b1958a044a4c0
	.xword	0x63072058185e17bc
	.xword	0xd806eaff51967462
	.xword	0x7f034b766cc16264
	.xword	0x0c725907599f0146
	.xword	0x7fbde3177fafc69c
	.xword	0xf29e1e96d378fca9
	.xword	0xa47ee602331884b7
	.xword	0x2aafcb7c58bd8c28
	.xword	0x07e619edf4e8c376
	.xword	0xd2e345349a8000f4
	.xword	0xf88653b4ba5c9791
	.xword	0x2dc4169fbc3418da
	.xword	0x730a1a21ad4657e6
	.xword	0x27c8b7b79075671a
	.xword	0xa258363f341f6b83
	.xword	0x93bac4eaaf5c0f09
	.xword	0x2a224d599a3e327e
	.xword	0xe8cf1850b6d36fbb
	.xword	0x5e0f2afc531916a4
	.xword	0xd22fbb09360f3df6
	.xword	0x7981c817284f5e22
	.xword	0xa9835a8b07c2ebcd
	.xword	0xe6f03ea0a840a725
	.xword	0x6ce1e2bc7d2d8958
	.xword	0x5d58f68b03b54d4f
	.xword	0x1ee7b1c46e042637
	.xword	0xf11fccc7fccce37b
	.xword	0x62b4aa8474b2948f
	.xword	0x8cb4a47c9c20b2be
	.xword	0x587cc0213f890cc0
	.xword	0xf58e6476ab1b787b
	.xword	0x0a092702cc72a98c
	.xword	0xad8b06821dd6eddb
	.xword	0x969113827df36a6d
	.xword	0x8b3029638c93a0d9
	.xword	0x8b24628d94ab6218
	.xword	0x788cc0677115c211
	.xword	0x2f029c767158f4fe
	.xword	0x0bfaf6af5b5fccce
	.xword	0x404b0e8ab592bd36
	.xword	0x5bb2e3aaa8e3e465
	.xword	0x39848994454af137
	.xword	0xeed891fb0a47f9b7
	.xword	0x9e4e0fb9628bc29f
	.xword	0xc40eb3093fc10dde
	.xword	0x732cb0fbdda6f3f6
	.xword	0x0b9a7cde115d9984
	.xword	0x9959ff44804af545
	.xword	0x01ae5ecde62fd630
	.xword	0x0812dc4986a5b23e
	.xword	0x6d7e752b668617b8
	.xword	0xec2e44836310eec5
	.xword	0xa63fdc009245db5c
	.xword	0x9ea0bfb9e1309309
	.xword	0x9aaefb0316a8c8a8
	.xword	0x234b6a58caf43fbb
	.xword	0xb7c0e9cd209dd2a8
	.xword	0x9f5502a6eb08e982
	.xword	0xcc67c3d117c97d84
	.xword	0x3ec0810704a72e37
	.xword	0x3860fca3dd0d604e
	.xword	0x5413ede008aa7207
	.xword	0x327b1a1bf1551542
	.xword	0xafb50baaf8a37ad2
	.xword	0xa23614b7b01ddb60
	.xword	0xd3d2724b228bbacc
	.xword	0x747d280bb48dfe3e
	.xword	0x56e468d785e0f45b
	.xword	0xb3fd711fb1a06be5
	.xword	0x845001e8a7fa632e
	.xword	0x8bd2d6529f9a8b7f
	.xword	0x893eb4fdd27daf00
	.xword	0x86bced3dbfdbaadd
	.xword	0xe9c33a2f84481a9b
	.xword	0xb61b4fb3682de638
	.xword	0x908be48feabc6d14
	.xword	0xe2c9a59ecae2e3fc
	.xword	0x443057b78922995c
	.xword	0x20654274bbcd2d86
	.xword	0x2ffd5b66417adc6a
	.xword	0x4d69b536535efce9
	.xword	0x13eff075ff7c4805
	.xword	0xb5e202b24124bbf2
	.xword	0x285a8010bbf6d44c
	.xword	0x0867e63334d76cf2
	.xword	0x317ad4ad87635d10
	.xword	0x542330789b1aba89
	.xword	0x57dbb7233ead0f56
	.xword	0x1462587d7bb8dc28
	.xword	0xe1eea86ec5e835e5
	.xword	0x81eecd6280971f1b
	.xword	0x0c180ff0e1497412
	.xword	0x415bef0dcf11b4b4
	.xword	0xc1c83800ec6c85e6
	.xword	0xecb8919d85703da9
	.xword	0x75ceee17f513b556
	.xword	0xf849185e56ab96d7
	.xword	0xa5884cfb1c91d1be
	.xword	0xd1cc5c4d2f1967f0
	.align 0x8000
	.data
data_start_3:

	.xword	0xfe22c6290a54cff0
	.xword	0x64c8039b78987cb2
	.xword	0xb6eda0ccb802126c
	.xword	0xff229da5e2544687
	.xword	0x09153d95d73d2a56
	.xword	0x96e63cfef02eb815
	.xword	0x257691463233e42e
	.xword	0x883a7d589aca48f1
	.xword	0x169499d8936cd7b1
	.xword	0xfdeac99d862f9b49
	.xword	0x9f7075cbcccd718d
	.xword	0x0871e4f70e16e2d9
	.xword	0xf676192d95ed829f
	.xword	0x1e416d7a714e66e0
	.xword	0x84948ff2c19e4ad3
	.xword	0x71f08d798cb8c754
	.xword	0xd25e887411ada018
	.xword	0xbd279b139cbe167c
	.xword	0x1b16858f3620400b
	.xword	0x76dde39670a6966e
	.xword	0x1812171e1011e481
	.xword	0xae50e3f54550d2b9
	.xword	0xf1873213e34ac5a0
	.xword	0x58ccc03829ca63fc
	.xword	0xb1375af1e342381c
	.xword	0xeb151d519e3e07de
	.xword	0xd0fbaaf5712c6cba
	.xword	0x0ed50de499ef4437
	.xword	0x01810c0d4a61450b
	.xword	0xcb029625eea001f5
	.xword	0x92bdc43a974348e6
	.xword	0xbf50fd62d8ce10df
	.xword	0x19cb1df3407d61ad
	.xword	0x540c7014de7d36c6
	.xword	0x2d1b18ccc5dc41ef
	.xword	0xa282d0c8154048ab
	.xword	0x002445c629f8e0e3
	.xword	0x2afdcc0ad90f3091
	.xword	0x8f45263cfd73ae2b
	.xword	0x18967a0c43dec69b
	.xword	0xde292da0c4d216b0
	.xword	0x5e0d0ca0b60a5c02
	.xword	0x0575f4430cc6d2c4
	.xword	0x90d293bc34807622
	.xword	0x6eaa5c0f0213930f
	.xword	0x13f02abb510d2a54
	.xword	0x6e98d4e3bf5848a3
	.xword	0xb184108f8081bbbd
	.xword	0x7be2c74c4a71688c
	.xword	0x22e121892e36fba8
	.xword	0xb74fb90e89d10bba
	.xword	0xe26e19944587d403
	.xword	0x9198aef349f686a5
	.xword	0x93424537e137979f
	.xword	0xeb2938774a64ad42
	.xword	0x675ac5b8821b8597
	.xword	0x92c2a16980370b51
	.xword	0xf4ce90de56fdafdb
	.xword	0x86a3dadf0623ec37
	.xword	0x2de5118731a025e6
	.xword	0xaca34b61a26abc4e
	.xword	0x48ed118ac016a4be
	.xword	0x89634692e6f3be64
	.xword	0x13926320eb3420b5
	.xword	0x71c17ac2d326e47a
	.xword	0x63ee7ca4e5a9c5fd
	.xword	0xa6208e16e19a4bc7
	.xword	0x7fc6dd339f454c41
	.xword	0xb1fdea80c91eed5f
	.xword	0x6746205990381952
	.xword	0x8bf93473edd81641
	.xword	0xfe93d3be4ebc48eb
	.xword	0x703ee4f3981e2efb
	.xword	0x6b0a5e3c211fa6d8
	.xword	0x24c74671f6308589
	.xword	0xdcd9cdfc604c0f52
	.xword	0xfb806abec8e0d599
	.xword	0x78c9fafb77ab2081
	.xword	0x95f9cf086c9bff5d
	.xword	0x737a1c38494a120d
	.xword	0x372c17a4d6ac8471
	.xword	0xe82a39e9e223d8a8
	.xword	0xe1eb22f588a6f36c
	.xword	0x82218bbeee9db1e7
	.xword	0x8a9f0d332c0e28f8
	.xword	0xd040c477acb1b79c
	.xword	0x7d738486ca82a6b4
	.xword	0x6b85a3166f18dd79
	.xword	0x534e47e63fd482ae
	.xword	0xc9933ab54610ead4
	.xword	0x170ef53a6b427c48
	.xword	0x715d97c0f4b0b9c7
	.xword	0x6a082d8d0e88a129
	.xword	0x4096c196e7ab68ec
	.xword	0x3a54571116f19366
	.xword	0xfec7b0b1c5b9b49d
	.xword	0x7d6ef305788ff592
	.xword	0x97d027226be011b0
	.xword	0x78d86eeec8c09d8f
	.xword	0x4b510f2a9b0d7774
	.xword	0x4cf10a9fc7917903
	.xword	0x85f6d031d941ef39
	.xword	0x288a4472b300e5f5
	.xword	0x581f859631b67722
	.xword	0x536bf0ccffde919e
	.xword	0x646ff0ef48134d76
	.xword	0xcfbd0ac042c8b887
	.xword	0x38587561429ffb28
	.xword	0xf9c52330b662a950
	.xword	0xe38e6ad21cc99975
	.xword	0xc280a893557679b4
	.xword	0xf9a6067ed409dbdc
	.xword	0x2757636c61e5ab30
	.xword	0xacf67daa229e34b1
	.xword	0x132c614f3c4a438f
	.xword	0x6cf27b098dd8d9fa
	.xword	0xb88fa40d85a7e878
	.xword	0x36186cb7b942573a
	.xword	0x20559e5d2bbd3c2b
	.xword	0x5ec62d702a92cc63
	.xword	0x01e57b0da8395c53
	.xword	0xf25b18a19bcbe0d7
	.xword	0xaac5723a0d9e35c1
	.xword	0xda55f0ae5d887a5b
	.xword	0x3e70a68759460642
	.xword	0x83618695d011683c
	.xword	0xf6eeb66f8e6a4a17
	.xword	0xaba8876435273a79
	.xword	0x42da501e0ca54fbe
	.xword	0x8cc5dfb02b038eac
	.xword	0x633995e58f344d86
	.xword	0x86e358648f7374cd
	.xword	0x5f0c96008e54c242
	.xword	0x17694b6e288b8b07
	.xword	0xa264190195eb19d6
	.xword	0x84ab1c5ff6c791b7
	.xword	0x4c228a26d7bd0a2d
	.xword	0xfab3daa65adf32c3
	.xword	0xd8086e6d85527798
	.xword	0x71118cd865eccbee
	.xword	0xb448f0f21a7d1a11
	.xword	0x3246f3cba27fdb60
	.xword	0x0842a4d68dcd438b
	.xword	0xed75463836d51af6
	.xword	0x59796d9b32f19958
	.xword	0xfc3dfa8ff3842795
	.xword	0x46bf130e8cb00122
	.xword	0x8b2e507d1ee843d3
	.xword	0x7c2ce9dacabdb648
	.xword	0xd9663e287cb1668c
	.xword	0xe8a66c070fa5f026
	.xword	0xf4d38f655223a6af
	.xword	0xadedcfd7895e73ec
	.xword	0x1b50252a2d75f7db
	.xword	0xa7a95a78f3a7e770
	.xword	0x14ccb2f475ac8873
	.xword	0xb757f5ff9b1a5963
	.xword	0xa9d3cd41d8dd3f0d
	.xword	0xbd55c36c7d84df90
	.xword	0x930c95900b76b5f7
	.xword	0xb0508752ba5a98ee
	.xword	0x4f84f8792769ca6b
	.xword	0x4399be8ee6205724
	.xword	0x61a3775dc473ad14
	.xword	0xa0394a1d052159da
	.xword	0xf6650cd3f310dfd4
	.xword	0x472810dc34b811b5
	.xword	0xbf1d94abc9d61c03
	.xword	0x6c2d9a5ec45c1968
	.xword	0x393ad7cd133b64fa
	.xword	0x57a9dc24a4d0460e
	.xword	0x712cc2bd700f6687
	.xword	0xe29cb5d606fb3d21
	.xword	0xed3ed218474d565e
	.xword	0x81bcf7ba3a097a51
	.xword	0x1b27c140094c4d1c
	.xword	0x26692915d1c33a99
	.xword	0x75d64062909935dd
	.xword	0x289a1d9c5ba021e9
	.xword	0x3dae4a0c885be257
	.xword	0x83bde2e356540575
	.xword	0xdf9f741440a626f7
	.xword	0x7b36e573961a6941
	.xword	0xcd1dc9740681c70b
	.xword	0x4d2cfabf1f498ffb
	.xword	0xf832b75aad74f8ff
	.xword	0xccf3384ff1d55da8
	.xword	0xd6f8ee37fb80a9b2
	.xword	0x2b376c22af9a84d0
	.xword	0x22f3691c56a4d7cb
	.xword	0x9b74753473821630
	.xword	0x00e35f34ac2cae5b
	.xword	0x2a914728c3deb79b
	.xword	0x4af0f445fc95adc3
	.xword	0x58d893d58a1ede4c
	.xword	0xe1bc826428c66e3b
	.xword	0xcc9bfdaf724f0d05
	.xword	0x5761fb849f263ca2
	.xword	0x30bac2ec3f92404b
	.xword	0xcfc1e928032be7de
	.xword	0x302c282a7b7008ef
	.xword	0x284646e6528e70ef
	.xword	0x198605bb67472996
	.xword	0x716bc06bca9da1df
	.xword	0xdd80e50d70d8625e
	.xword	0x8874325767788a16
	.xword	0x4da1b22b16b096ba
	.xword	0x4406bb71a77a7e67
	.xword	0x078f5c17a390abb5
	.xword	0xadbbc12b1a519537
	.xword	0xb962d5b24098bb13
	.xword	0x45025e217ff0ee9d
	.xword	0x5cd01152ec27895f
	.xword	0xadd58771f90b99e5
	.xword	0x522ebe98e93aec20
	.xword	0x3e44513f6e76b1a5
	.xword	0xf11212100ce8adeb
	.xword	0x8cdaae157a08ec43
	.xword	0x0e2dc2a9c441e3e4
	.xword	0x5e1b62ea04d8d655
	.xword	0x063fd1b9a5592439
	.xword	0xc9b2d9513330ce32
	.xword	0xbeb1ab7b34cd0db6
	.xword	0x9a64aa1e548a6361
	.xword	0x9f2a2d219f0117e2
	.xword	0xc145c72dc65ca09b
	.xword	0xcbc8151be9ae4679
	.xword	0x04f7ec991439a396
	.xword	0x9609158a276c56ad
	.xword	0x6f45dec92cd26bd4
	.xword	0xd0000b6262ec3025
	.xword	0xc754a41f6757c3be
	.xword	0x49a10af5abd1a1cd
	.xword	0x6e47180128eb4613
	.xword	0x8b6928413652f26d
	.xword	0xb56b93b658c49c94
	.xword	0x359b3fa4d91fb90f
	.xword	0xcd1c088367ef0819
	.xword	0xf41b75e947eb5036
	.xword	0x9b64fa2cd725dc3d
	.xword	0xf668ebac37e772a6
	.xword	0xc0faecbd99cd344d
	.xword	0xb0cd445c8f20f2b9
	.xword	0x20558288d648cc64
	.xword	0x0843072339bde9ee
	.xword	0x1fd407613268156b
	.xword	0xe2e98c11ee06fa68
	.xword	0xdc9851f7401c9fb1
	.xword	0xbe2cc207b5a73027
	.xword	0x5026e6ac6989400c
	.xword	0x416974eb6141e0fc
	.xword	0xf3c84926ed96ee16
	.xword	0xc05b6bf19344dab3
	.xword	0x17f092f1722fd8b0
	.xword	0x446a7715e8d68bc7
	.xword	0x8735e978b16428c3
	.align 0x10000
	.data
data_start_4:

	.xword	0x0882b717002d79a0
	.xword	0xc033f684507d5e63
	.xword	0x2e0d49ed1a2bf325
	.xword	0xffcf7c87bd33b751
	.xword	0xd90dc76362759169
	.xword	0x011d25ef20a51eaf
	.xword	0x477df9e64c5e3218
	.xword	0x5fc8530a4f2cd387
	.xword	0x503ed445d90b24bf
	.xword	0xd1ce0ffe12188347
	.xword	0x7728cc1824eb8a38
	.xword	0x1e8d459279363460
	.xword	0xb3286f51803d2059
	.xword	0x9e17caaaf54ee292
	.xword	0xdf16aab97bef6b62
	.xword	0x0d853d34786d0f70
	.xword	0x8205a366f465a0d2
	.xword	0x7a34e9551f2f0e37
	.xword	0x6a4542d1aebd959d
	.xword	0xbc0343332278be64
	.xword	0x41b2b1cfbc4edd32
	.xword	0x31ac09b51e08ebf9
	.xword	0x7ca5fe9ebb1c8e5a
	.xword	0x58d2cacdb6f99878
	.xword	0x00bcf38412c8e56c
	.xword	0x6915d65f291acace
	.xword	0x7a602ec608d90f25
	.xword	0x14826c480c1f8825
	.xword	0x058bd5961b23a9da
	.xword	0x4dd18ef4663b321a
	.xword	0x2d08a0a326c9b5e7
	.xword	0xd8808138d1387186
	.xword	0x042e08e7c9c67736
	.xword	0x755193bccdab779f
	.xword	0x0f97344f1694704e
	.xword	0x9b8f2c7af3c4ee21
	.xword	0x77e7c3bdab49029d
	.xword	0x9a760a4a69874287
	.xword	0x993dc71dc0497de4
	.xword	0x148453a8f220e5d9
	.xword	0xe110791e0283c095
	.xword	0x7322c20c1039a96f
	.xword	0xd9967968fd08bd03
	.xword	0x1a5aaa81e9010984
	.xword	0x7774e25b5e7eee90
	.xword	0x7d48a28254cacb18
	.xword	0x3bf5e8c68e3239ec
	.xword	0x3638e943069cd32e
	.xword	0xefb2f91c6edbdbca
	.xword	0x40fe536b7e6c4294
	.xword	0x84fcfeea1f6b2481
	.xword	0x4addb2c68812948a
	.xword	0x5e649c2a443ea7eb
	.xword	0x9e0858fe107d7d93
	.xword	0x4c39ff6414c65994
	.xword	0x1c29836b5940ef5c
	.xword	0xe2b705ac3772026c
	.xword	0xfbd4a3f5e7ed5043
	.xword	0xdae76a567b7d4016
	.xword	0xe4622180f68396a1
	.xword	0x3cd4f3fc26a41dc7
	.xword	0x78ef7101488f56f2
	.xword	0xc3f590538d10ad51
	.xword	0x01c9d74d2120bec9
	.xword	0x03a93029b0874b66
	.xword	0x6753c8e150b4bdd3
	.xword	0xd4714a11fe4bd871
	.xword	0xbe1478d05f968fee
	.xword	0xef48bd1f9ae99137
	.xword	0x36f806a66d125aba
	.xword	0x8c495ce40e00e344
	.xword	0xe924ecf3603dd2cb
	.xword	0x03c2bdb271dc3ce2
	.xword	0xc4a6221083af2d96
	.xword	0xd66222cf7b8ed716
	.xword	0xf528022bfa3945e4
	.xword	0x3c008e6f937d6554
	.xword	0xba10a1a06716c22d
	.xword	0xe7a62187d0c950e7
	.xword	0x75f068e735e91698
	.xword	0x38779f6933e782fd
	.xword	0xa40d86d178859737
	.xword	0x3ac4a2be5364f86f
	.xword	0x472445ffb0a96cca
	.xword	0x1e293a0b8afca5b2
	.xword	0xf4056f6bf26ed58a
	.xword	0x6aa7f9d19add337c
	.xword	0xd568d5825571b8a4
	.xword	0x6f3a2d95c98a59c8
	.xword	0x71d30c46940885c5
	.xword	0x241c5fa14321758c
	.xword	0x0c5f2e66f4b13d89
	.xword	0xf49f492bedd98111
	.xword	0x900318e26744719e
	.xword	0x8c1387454142e882
	.xword	0xe28ca936d5858b12
	.xword	0x182eccfd8a782ff0
	.xword	0x3c3c12d5f90d1581
	.xword	0xb9751a46cc28491c
	.xword	0xffabf796dd9832e1
	.xword	0xd44d54ad5329e11e
	.xword	0x8bc58df8ed9f24b8
	.xword	0xcf50e6599460eafb
	.xword	0x665841cea462774b
	.xword	0xa77edc0e9f36b919
	.xword	0x0c5f0306a41e9817
	.xword	0xe18d8fc4e9f6fa80
	.xword	0x3be64f20070b8d99
	.xword	0x402ce8fd3d470b89
	.xword	0xb0beec08e0f09f9d
	.xword	0xc0b49e3e75712fb6
	.xword	0x67dae9bbe1763f54
	.xword	0xa4a422ad44bc9da5
	.xword	0x64e712ccd18a0292
	.xword	0x50cd0b6516ac63f1
	.xword	0x7c31169688f30f82
	.xword	0x5f4d97053baa2875
	.xword	0x078824d19e599e46
	.xword	0xaee668a3160b616b
	.xword	0x27b23848ea1e8be9
	.xword	0x83e229e98626e700
	.xword	0xad1094059d9b5d1d
	.xword	0x25e93be8b471dc58
	.xword	0xf59a94480fb0c788
	.xword	0x132a0adacbdbfbe3
	.xword	0xad2bbf6074b7514e
	.xword	0x766e0cba372f355e
	.xword	0xc43e8734babd6a47
	.xword	0xd7ebece79c78a6a2
	.xword	0x96e5360b6d3165c4
	.xword	0x6b7c190d9c6a3c1b
	.xword	0x1bf93be72d126667
	.xword	0x48593a4f3593e108
	.xword	0x23b7faa21d725ea6
	.xword	0x41bf7d233d9eaa1f
	.xword	0x14842fcab2b583e9
	.xword	0x4aac1d94ad3b5b1f
	.xword	0x4bb5125726741fe5
	.xword	0x3133e1f22e0ff720
	.xword	0xf7e48466d303a01f
	.xword	0x72ce354a8b79a714
	.xword	0xfe93458262e2a014
	.xword	0x214dff8964429e24
	.xword	0x424b3dad8fe7ff72
	.xword	0xae1ebdf03c68343e
	.xword	0x5caa21dabfa4cd58
	.xword	0x4bc632260eeb2c1b
	.xword	0xa30b6b8fab426090
	.xword	0xdb87dc9dae8ea04c
	.xword	0xdd133c2db5ba9fa1
	.xword	0xcace75520606ead3
	.xword	0x685385b99291ff17
	.xword	0x2cfc6dc65b25280a
	.xword	0xfa7c8a4390d091b0
	.xword	0x058e6f735028cbb0
	.xword	0x920da4fad782e478
	.xword	0xeb14f4a274f589ed
	.xword	0x1af12f051c5ab28c
	.xword	0xb1069706ec3e969d
	.xword	0xd4a6a08f0dcae736
	.xword	0xa2f5f9b7cd303a77
	.xword	0x498345577b6238a8
	.xword	0xfd041ce18b32ca01
	.xword	0x1a7147bb315aa3c2
	.xword	0xb39109b3b9262848
	.xword	0xe02a71c728080634
	.xword	0x8ed8a2ca800906e7
	.xword	0xc25e52ebaed0ac24
	.xword	0xf64ad6edcb8ca40c
	.xword	0x959de7b25068a596
	.xword	0xa577533b1762b495
	.xword	0x3b456c74bf991311
	.xword	0x76861e6e479232bd
	.xword	0x88ca21185f84c0ef
	.xword	0x77b5092e55ee4fff
	.xword	0xdb9cad676e26ee4d
	.xword	0x100dbd554d5cc95a
	.xword	0x925f26f57bea7660
	.xword	0x635c763ce92884c9
	.xword	0xe9f71679b60bf610
	.xword	0xc81fd68392b88939
	.xword	0xdce5105fce561561
	.xword	0x7691a900ce839011
	.xword	0x3e408df7fd846dbc
	.xword	0x78e0e28cd96ac927
	.xword	0x782acbab374239e1
	.xword	0x078c6b68ba149972
	.xword	0xb8b623f4642bcb5b
	.xword	0xd7927921f33c436b
	.xword	0x2e793d60c56f2d57
	.xword	0xeb7030d78a27e723
	.xword	0xabeac3d84ba79c32
	.xword	0xbb6c647705308f22
	.xword	0x6a81206fea238e4d
	.xword	0x787bc1aea72db39d
	.xword	0x45d75f59c52cb61f
	.xword	0x8700cc9f09efaaee
	.xword	0x5d6eac5bee8cfb1f
	.xword	0x0e2edb1a07d06271
	.xword	0xcbb895d6137dfa9f
	.xword	0xde8721dcb5ea6602
	.xword	0x2320eb15ca0d24a8
	.xword	0xbe782f803f3222b3
	.xword	0xcc048b87e08b3698
	.xword	0x711108b029a722ae
	.xword	0xddce96dce6aae2e9
	.xword	0x944c35ff27826ed5
	.xword	0x304e5741d4d23b90
	.xword	0xc5135002a5e061bc
	.xword	0x67b4c5564099c7a6
	.xword	0xf4e956cc141d19e9
	.xword	0x2668f97c2c952d83
	.xword	0x427febd7bca9b4bc
	.xword	0x71f4db30de0977bb
	.xword	0x447bc102ff051581
	.xword	0x83c71e7144ac1b41
	.xword	0x4e9e6b3ea10f1f39
	.xword	0x42c99369cf7a10c2
	.xword	0xf149c5150a16a277
	.xword	0xe52f6daeb1a81adb
	.xword	0x2cf854922c3e869b
	.xword	0xb48bd2b08d6537ad
	.xword	0x589e4ae7208c83a7
	.xword	0xfc7d1984d253d436
	.xword	0x8e237c0a39d1954f
	.xword	0x97a506d2e9eed64c
	.xword	0x05af2cbb538a132d
	.xword	0x10a3ca47c2422758
	.xword	0x7619ba2650bf51fb
	.xword	0x75b0bdbe3d4a0dd1
	.xword	0x5a8b42b3123925c5
	.xword	0x5474abcce1384661
	.xword	0x2ce6b70729555c99
	.xword	0x138737469292f29f
	.xword	0x29eb03700210851b
	.xword	0x0fb4b4e324763aad
	.xword	0xbfc09aa3b6155526
	.xword	0xd4f97417d88a0262
	.xword	0x3981b09adc1cafea
	.xword	0xf3773bf9943ecc50
	.xword	0xa1d4a17ff64c4723
	.xword	0xc56ff8c88dc46d53
	.xword	0x0a3d4787e5d99dbb
	.xword	0xa027c1658d21163f
	.xword	0x979449a5ef07733e
	.xword	0xdd870fed92a5f4b3
	.xword	0xb0665c1d0ed75c01
	.xword	0x1d0123240c0baac3
	.xword	0xbf6379310ad49ea7
	.xword	0xe25e0ebff272dc93
	.xword	0x4ba2f20cab575be0
	.xword	0xb735bba0305416cf
	.xword	0x9464b328f10c418a
	.xword	0x8addc0cbb75ae4a4
	.xword	0x0334451b74f396d7
	.xword	0x472ff5a00bc12199
	.align 0x20000
	.data
data_start_5:

	.xword	0xf86dd8dca6422866
	.xword	0x047938ace1410a78
	.xword	0x1dae57c216f107ae
	.xword	0x0352f3d1cefea8d8
	.xword	0xf623605265364ea8
	.xword	0x15bfa914a2aae956
	.xword	0x34f1d3c0be202fff
	.xword	0xdd778782bd54d0e1
	.xword	0x6925ba2406cf92ae
	.xword	0x1a266f96ca13cd62
	.xword	0x0158c176ff0a8b03
	.xword	0xb44625421c3f3112
	.xword	0x1ca6e654e6d4752b
	.xword	0x83567b1745911e76
	.xword	0xbf242dbd4a822326
	.xword	0xd7a3314b14485165
	.xword	0xe202c613cc12265e
	.xword	0x77a8809a383d23a9
	.xword	0x1bccfb3eee760c2e
	.xword	0xb83c6fc105c14666
	.xword	0xf62a5783f280bfb9
	.xword	0xdfaba4517988edfd
	.xword	0x7b2a28caeccbc15a
	.xword	0x6647a8bda8b447dc
	.xword	0x0ed2673abf0b947c
	.xword	0xcbb0407dfd859652
	.xword	0xc9d04479b56e2124
	.xword	0x4f6b021fec79a18e
	.xword	0x4b9b8b4919a6dfcc
	.xword	0xf9414b129e03a7b1
	.xword	0x035a10983f37ac19
	.xword	0x40bf67b475b2f8d5
	.xword	0xf38e27bd6ca6aacc
	.xword	0x44812e6993c2cd11
	.xword	0xf5997353cc5769c3
	.xword	0xe1c2a89f2fb03b6e
	.xword	0x265604c70bfcd70d
	.xword	0x0d313bc8ccd058e0
	.xword	0x2f43a135bdae590f
	.xword	0x112429c48f70db64
	.xword	0x63093a42dd1377e0
	.xword	0x20dfec79f6841f1d
	.xword	0x26154b0d6f51182e
	.xword	0xf5fcb2e1d772e7eb
	.xword	0x8d6ef681f064ce5e
	.xword	0x723e968bc82268fc
	.xword	0xc4ebff1f8535d651
	.xword	0x435ee24cd8e269ce
	.xword	0xc8f184f38cef9704
	.xword	0xc500e49241029211
	.xword	0x78481fae106806b5
	.xword	0x0cca2d5d1e0fb474
	.xword	0x5891d99a3ce48855
	.xword	0x33f8131fdd13714f
	.xword	0xd7fd9d5bc266149c
	.xword	0x7a8aed6fc21cbd2f
	.xword	0x6c815cbd85473513
	.xword	0xbdf19da899847cec
	.xword	0x4ebc0bf022045b6c
	.xword	0x4543e89df14fbe6f
	.xword	0x4020030affadbcc6
	.xword	0xfad552a38b6035cd
	.xword	0x63bd63ef3edc4c99
	.xword	0x6ac943a6b3cd7acf
	.xword	0x4229a84ffb7a0b06
	.xword	0x799c7862d690f8b1
	.xword	0xcaac9b7bf8835b44
	.xword	0xb94e106f0eabf520
	.xword	0x1d1a537d0bef3c61
	.xword	0x311ca4daf757d50e
	.xword	0x2e92bc7c74659125
	.xword	0x0ffb37997a1da23c
	.xword	0x8539715b6c790182
	.xword	0x5fe0c49d6d09c395
	.xword	0x80aa752066ce7db3
	.xword	0x74210ca3f4ef729f
	.xword	0xec248548d04b31e8
	.xword	0x4a4b4224921275ac
	.xword	0x5215030778515c9e
	.xword	0xa9c0b2b90c205121
	.xword	0xc65cfa152b8aebca
	.xword	0x4b85d3c3ba18ad33
	.xword	0x7c989d3722f3a3bd
	.xword	0xb416677a8232ba17
	.xword	0xcb5e19fade4034ab
	.xword	0xe15ce82b7726845f
	.xword	0xc3b1062751409d82
	.xword	0x165e648d74f4f55b
	.xword	0x851dffcd438b2c4d
	.xword	0xfe91e48df87bfa99
	.xword	0xcff22f34b4ee1fad
	.xword	0x24243b50aafe8705
	.xword	0x66a02f1e7fdb7b9f
	.xword	0x650ad69b391cead1
	.xword	0x80a9b4df870e4807
	.xword	0x20d2cf207cdf717a
	.xword	0xa2fe25656fd8f139
	.xword	0x8ea737190014f701
	.xword	0xc65cab7b533c1cf8
	.xword	0x03be0893a9d3dad2
	.xword	0xbb67e0be94cb373f
	.xword	0x90b8377f8de40327
	.xword	0xf8d60eaf43ce0d42
	.xword	0xa03945271bbcf3da
	.xword	0x7edcec6d48196dbd
	.xword	0xa94f862f285bf62f
	.xword	0xb1531d32e56850b4
	.xword	0x8d2428e79ebcb8cc
	.xword	0x3ab8a2194a47d238
	.xword	0xb70652df70d6da9a
	.xword	0x409ab1125e65c712
	.xword	0x632f3a4958173548
	.xword	0xe155b7c85864304d
	.xword	0x1560d909631682eb
	.xword	0x5d6793683230216c
	.xword	0x492cd7198763e209
	.xword	0x782a96913a968234
	.xword	0x441ae19c4cc3943b
	.xword	0x9f6a195203a43a14
	.xword	0x5c46e40bed90f4ae
	.xword	0x6d09dca2a2390f92
	.xword	0x3029d8f013954816
	.xword	0x4a16f76043e52c56
	.xword	0x046920aeaf3deaa0
	.xword	0x536cd32c07a5774d
	.xword	0xd8d9e549997c6c62
	.xword	0x97407f9440bf8828
	.xword	0x9547d8bc6fb74d8d
	.xword	0xf7f54e1186aac1f3
	.xword	0x4d97e0436c9b5383
	.xword	0x44b1913cdbe3f6de
	.xword	0xd679016251a22dd2
	.xword	0x8c765cbf414c4f0f
	.xword	0x962c9e5bb7814003
	.xword	0x983fc334f2a35e17
	.xword	0x53436190a27bdab7
	.xword	0x1c5d6d5e8b1b97dc
	.xword	0x84ef22f99997b806
	.xword	0x84bf6efaf775b913
	.xword	0x7010d60450f944a7
	.xword	0xa5b4d3fe618bcdec
	.xword	0x0b145ffde478af9b
	.xword	0x3d4f6814fb535251
	.xword	0xeee47f6f092aac89
	.xword	0x0e814b467ea0e06e
	.xword	0xa70aa1c86eba9d57
	.xword	0xd47b47dff3708c2b
	.xword	0x43a9887107329158
	.xword	0x8b74fe2b4fe3703a
	.xword	0x4531804e367ef3a5
	.xword	0xcc391276bf6da8ec
	.xword	0xd41ab87fd9a5dc19
	.xword	0xb77c08e097aa48b9
	.xword	0x31a8b37df3c06a81
	.xword	0x1af60ca4cab745f3
	.xword	0xeb1b4f83389ae74d
	.xword	0xd20bf403d7f6f6d8
	.xword	0xd915b7c35955ab79
	.xword	0xdc9d6f52b2b2b61c
	.xword	0x6f56a9c29c85d091
	.xword	0x45abefb9716269f2
	.xword	0x56ca6a926b9d2815
	.xword	0x77cf1ada09eb010d
	.xword	0x87047a7870815665
	.xword	0x84b4a27c04cf124d
	.xword	0xb2b7163394c12cb0
	.xword	0x8ee04092f121696a
	.xword	0xcb5b2010e1b27343
	.xword	0xdaf0f108fd93c54b
	.xword	0x88fbdbb5b229141d
	.xword	0x1138855fe1bd1df4
	.xword	0xe3ad56732f5ff7c3
	.xword	0xd75a5d6aec8439d4
	.xword	0x25625f041352a04e
	.xword	0x352aeee3819e6436
	.xword	0xb9e15cadf03e3c68
	.xword	0x21704bc464e4760b
	.xword	0x9cac6e56187a39de
	.xword	0xfd093227a22f9fd4
	.xword	0xa1b8bf3a8c75c094
	.xword	0x91f4f3e6f9bb253c
	.xword	0x330ec12fea5c1bf5
	.xword	0x1ebcb2a681211285
	.xword	0xc7d1e2a1f41d031e
	.xword	0x0b8d64b0bf6cf7ed
	.xword	0x41b7f1251da0aa5d
	.xword	0x6e86198917bc6a62
	.xword	0xc9d6549fae92b311
	.xword	0x5ef3ac3d064429d4
	.xword	0x247bb5a00b176a94
	.xword	0x97eeb6842565a3e8
	.xword	0xa55ae0b7fb617b3e
	.xword	0x34f15310774d6d2d
	.xword	0x2ad170587defa0be
	.xword	0x0f0da203db41f07c
	.xword	0x200e405bbdc74618
	.xword	0x3f2a805ea18e5248
	.xword	0xf654855788d6e99e
	.xword	0x9e1dc8193a20163b
	.xword	0xff5fcf6475bd6cec
	.xword	0xec10e2704447302d
	.xword	0xacf7fb6c63c3c77d
	.xword	0xb320739f6a13bfc8
	.xword	0xcc538a544ff368df
	.xword	0xd649234caaff0dca
	.xword	0x29002af3620b0834
	.xword	0x3c5997a196ec01ce
	.xword	0x5866930291443fd6
	.xword	0xa1264f1a843ef067
	.xword	0xa3b03dd43dd50b46
	.xword	0xec865210431dceda
	.xword	0xc9f8ab8fa8cf719b
	.xword	0xdc67c1cbeec88e4f
	.xword	0xc6c19593d5cd2354
	.xword	0xf38ec86f2d34ff99
	.xword	0x2fb8265d4698e93e
	.xword	0x886b3f2c2b4f4ca7
	.xword	0x34a8ee3cd1f7fe72
	.xword	0xb99cf6d379c0353e
	.xword	0xb01fc368ab5a2baa
	.xword	0x22884c3b214aed18
	.xword	0xf8ce9d6b4625d06f
	.xword	0x437f5a8e93d4543a
	.xword	0xd64499548cdae5b8
	.xword	0x055f44f5354960ae
	.xword	0xc494cfd170df2dbd
	.xword	0xd120064d99e3bf84
	.xword	0x9fb290d38cd551d1
	.xword	0x0622b71dbf96dad7
	.xword	0x33cf8ac06a091917
	.xword	0x5ceb04f6ec6fda4c
	.xword	0x2dd879fd9460b199
	.xword	0xc6124fe6f6a4f384
	.xword	0xf62eab822091cc25
	.xword	0x48f898e48477ce55
	.xword	0x82fb06ef31deedfc
	.xword	0xe1408d18ee7c80d3
	.xword	0xa9b2bff8ca3cd6c2
	.xword	0xa52b57af7afb1aac
	.xword	0xd261254f4850346e
	.xword	0x56da40e576fc2384
	.xword	0x4f42f30330a3c073
	.xword	0x093f1a1887d988b9
	.xword	0x6231709b1161a466
	.xword	0x7d196ee5a618308b
	.xword	0x4eb4d501aec0e529
	.xword	0xaac006d2bdb5ae14
	.xword	0x000ab3c1966f9f62
	.xword	0xc095645925785e91
	.xword	0xfd9de247d727b2d8
	.xword	0xf67e2d2d0d71cbfc
	.xword	0x8ba82daa832f138b
	.xword	0x29ccf3d51d992be2
	.xword	0x4e154e8144f52f12
	.xword	0x6f657be08ca141e2
	.xword	0x60ab33a11b244cae
	.align 0x40000
	.data
data_start_6:

	.xword	0x390054107384c867
	.xword	0x568640a6ab2441ce
	.xword	0xb7c1d84dc3edf504
	.xword	0x0c8a2267aaf46acb
	.xword	0x7551f8c8d1a2c20c
	.xword	0x98096ec86a4ad172
	.xword	0x3743c1f116ed9be4
	.xword	0x9a08bab36b7994ad
	.xword	0x7eb8f0dc58de131d
	.xword	0xb2c2e0cd10ea3ba1
	.xword	0xc7650c632b5fbe71
	.xword	0xbc27b11d5cf31d6f
	.xword	0x4af1780abd5357b2
	.xword	0x7da502bcf1198879
	.xword	0xee2391b89c820672
	.xword	0xdb34c0cb1400fc28
	.xword	0xccee3bca9da41df5
	.xword	0x8304085372c7c344
	.xword	0x05e032b00ab9ac14
	.xword	0xdcdc142b102d652d
	.xword	0x4b1e383617bb7408
	.xword	0x5851cc641f63b8fd
	.xword	0x92b972bc1804469e
	.xword	0x3e5056fe3a1592c3
	.xword	0x63eac684e8bb2d60
	.xword	0xbe46ddb22097f3b4
	.xword	0xed11a74ef7e39458
	.xword	0x51538bb51dc4d4ab
	.xword	0xa1a3f28e331ca99c
	.xword	0x82d0ff57f057f99b
	.xword	0xbf88603ce7bc1d75
	.xword	0x68e02a52f2797c65
	.xword	0x460d86d39de4d437
	.xword	0x43d4d282abc92095
	.xword	0xd99e5eddd682728a
	.xword	0x6ff6cd8ef2e25fba
	.xword	0xb39a8257a98da94f
	.xword	0xa8b03d0d2320ccd0
	.xword	0x46725654dfa0bbac
	.xword	0xe1904d2634463101
	.xword	0xff6557fa20c90c49
	.xword	0xb8915a89b7c881b0
	.xword	0x134464cea5c07d01
	.xword	0xbc4a302ec80183d5
	.xword	0xf0937465a2bb5da6
	.xword	0xeab34d162ac0b616
	.xword	0x718400c325aa5583
	.xword	0xf902699b279e5ce0
	.xword	0xf5dcd5a7363750e8
	.xword	0xfda0b27b2099c9fc
	.xword	0x249d4c48fbf91253
	.xword	0x3de9ea47cfde1786
	.xword	0x35caf356927f3bb2
	.xword	0xb21ae950f37b0139
	.xword	0x3290b21709ad5207
	.xword	0xa36daede73f3b7ad
	.xword	0xb829bf124b85b58c
	.xword	0x8bc9eded65a1e901
	.xword	0x7ca0d38ef590e453
	.xword	0xbd2202869adff93f
	.xword	0x56fd19e5ed0bf042
	.xword	0x4dba1ff55d5e9d61
	.xword	0xd901b2bad9550194
	.xword	0x57144de3320b8e09
	.xword	0xeee31ad2e633b7e5
	.xword	0xcb0a86360852a83e
	.xword	0x806280963155e57b
	.xword	0xc92fabc8d803f9e7
	.xword	0xcd06d3dbea23935d
	.xword	0xedc922a144c034e8
	.xword	0x662551c9b913d5a9
	.xword	0xd2164ce24839f3fa
	.xword	0xb7c900300cad35ad
	.xword	0xd3869b526d781a26
	.xword	0xf9ec90a72c7a94b2
	.xword	0xbb2f9966ed81518a
	.xword	0x7b9872ffc3ec3021
	.xword	0x8683b83f124c6626
	.xword	0x24c6d3cdafccff47
	.xword	0x3a652f47732dee9f
	.xword	0x32f18f1ccabfba3e
	.xword	0xb953fbc17580e157
	.xword	0x720f8b3132f0180d
	.xword	0x938d1e30f3cdc863
	.xword	0x4f6978338e95f3f1
	.xword	0xff25b99de088af2e
	.xword	0x33dae3352bd36cf0
	.xword	0xb66bd5fea520e462
	.xword	0x42b28d5aeebe614c
	.xword	0xa1cafba3d183c162
	.xword	0xffdd5681eb88242d
	.xword	0x0d2da15fcc321c32
	.xword	0x5ee34c18d9d9475d
	.xword	0x5d1d84a3f30e16da
	.xword	0x7e607d937594f37a
	.xword	0xec4e9f1e91d74fdf
	.xword	0xc78ceb72cfcd404d
	.xword	0xaf60e643ed344bc6
	.xword	0xe8589894c59d499d
	.xword	0xc98d69877cb1bb8b
	.xword	0x2f430ffffb99a449
	.xword	0xdac80429c95cab06
	.xword	0x271053f16effe518
	.xword	0x3ac5b3b3c60e3bad
	.xword	0x2cd7221bb3ce65b7
	.xword	0x1536b548030c879c
	.xword	0x67da4ad19db835aa
	.xword	0x12622132a4879ef6
	.xword	0xb5f1805ba319f0bd
	.xword	0x75c05f318456a77c
	.xword	0x11e90842545d4fd3
	.xword	0x42b2e029cbc2af3e
	.xword	0x19f804016a9abdf1
	.xword	0xc1d17067968c28e7
	.xword	0xac74742d6906809c
	.xword	0xc20efe692cf96ca1
	.xword	0xfb848da0640ae2a1
	.xword	0x5e1c270ea13b4cc2
	.xword	0x95619e3a2bc94435
	.xword	0xc58b97e5afc7d776
	.xword	0x7b6ea5ecb719e57b
	.xword	0x33ad5f95d2452d89
	.xword	0x8b3586a7a0036bc7
	.xword	0x170485f7c61ae78f
	.xword	0x39defb22f6af9cc4
	.xword	0x3d8c5bd8ea91ad94
	.xword	0x382eef484cb80b06
	.xword	0xa05df5d1f82f9466
	.xword	0x7fcf0270d0ac912e
	.xword	0xd19437ea2632704a
	.xword	0xc67c0236422a1c4a
	.xword	0xb18cd447ad634c65
	.xword	0x50cd3a9cea22db4a
	.xword	0x75fb078fe04d8d2f
	.xword	0x7d363d1f7b7e8236
	.xword	0xd06d1cfdbbadace8
	.xword	0x22b861c46777c621
	.xword	0xb09c455e36b737e6
	.xword	0xea260b2227e3145d
	.xword	0xf4e9c6e4e88c06dc
	.xword	0xe6b51b5e4da84d28
	.xword	0x87ebbc674f6c1f65
	.xword	0x8e9aa09b158d21c0
	.xword	0x6177ae5266384abd
	.xword	0xd2e457e775859b44
	.xword	0x325473721182299c
	.xword	0x67846b05892c5d54
	.xword	0x60c7c346d56a7274
	.xword	0xce8fef9ef5a00ed6
	.xword	0xf040ff3c12a483a3
	.xword	0xd0780f727bf5aff7
	.xword	0xc1bd0e2c4ff9bf5d
	.xword	0x21947ea5252ccc45
	.xword	0xfd57c6251208e50d
	.xword	0xd80c36bff907f48d
	.xword	0xb1900fc14bed0ebc
	.xword	0x962139af3c678306
	.xword	0xe5d72539f3aa249f
	.xword	0xfa1c512e6c9961ab
	.xword	0x072a58357d61e257
	.xword	0x94581435ec193eb2
	.xword	0x91ed6020a2990277
	.xword	0x10c06d4dfe5be27f
	.xword	0xdc4db06b8995bdd4
	.xword	0xedea915a54df8566
	.xword	0x5363427e4dfcdedd
	.xword	0x1928c5a7b3d26d56
	.xword	0xf24a3e674511bc51
	.xword	0xdca87f351ee80ec0
	.xword	0xf854c2206565effa
	.xword	0x6bd66a1089060b33
	.xword	0x292502271d84d214
	.xword	0x6d01eb5cea00b81e
	.xword	0x25efe45f7cb3b4cc
	.xword	0x339e284a7209319d
	.xword	0x42f7ca01fa3421eb
	.xword	0x464ef6bf163aee10
	.xword	0x93a83606f25d5b01
	.xword	0x792141bcd97247fd
	.xword	0x808df05f975e5da2
	.xword	0x6355a6a263259734
	.xword	0xc131ad60a79f0f88
	.xword	0x73b6875d6700689c
	.xword	0x3ec0e23b99cffbf6
	.xword	0x9edeb0bf6e22dd78
	.xword	0x7d0f011412430fa0
	.xword	0x1c9bdbab6d7c51c1
	.xword	0x2706ba0f402eb58e
	.xword	0x63659db5ed508476
	.xword	0xbd47c08dab4351e9
	.xword	0x5c701659be9b9fd9
	.xword	0x1b0e01ab45174de7
	.xword	0x13a28fd0892e91f2
	.xword	0x968a8fba1413b562
	.xword	0x5f274348e1f3531c
	.xword	0x3f25c20a0ace867e
	.xword	0x42b64dab7edc7320
	.xword	0x4a829e48b9893583
	.xword	0x436e0e06caf56432
	.xword	0x15a5090872720939
	.xword	0x11c83e4fa5a4d642
	.xword	0x392ec697552cddc3
	.xword	0x3aa6ce81897aba17
	.xword	0xef2c844de57e50a4
	.xword	0x98231ac76e351ad4
	.xword	0xdc245381c23bc97b
	.xword	0xd06cb760d1b0ac6d
	.xword	0x29ae3dd8c7b9be36
	.xword	0x9708f3e862130a52
	.xword	0xd1fd883cf730959d
	.xword	0xaa5dffdc71f6fe98
	.xword	0x8e405bc6dc5507b5
	.xword	0x0d2c7822c7271ff8
	.xword	0xe9b261211e6a1502
	.xword	0x188b5097a5fcd1af
	.xword	0x5faa803fdff79596
	.xword	0x06d1ae8b3e428415
	.xword	0x60a97d0f575255c5
	.xword	0x91be8dbe0b7c0685
	.xword	0x1bf1508e607950f4
	.xword	0x40520390bd267bfd
	.xword	0x287b3b733d279c87
	.xword	0xd47b611ae30f3c32
	.xword	0x863ab2c8d7f8cec2
	.xword	0xebb762dc4a167941
	.xword	0xd58cb77a3be6bcde
	.xword	0xef8a325ee0fd2ce4
	.xword	0x4930f92263179915
	.xword	0xd2cb092655237982
	.xword	0xdb843f2ee38f694f
	.xword	0xb88c7a9f2ee03e96
	.xword	0x09a395600c0614ec
	.xword	0xcd62d3f9acb53b72
	.xword	0xb11f2bcbd652cc48
	.xword	0xe7dbfb67eed29fcd
	.xword	0xc0b3efc86abebf09
	.xword	0xfef4bfeef23ff6fc
	.xword	0x545e5d6d59a0e69c
	.xword	0xfb45c421be87228d
	.xword	0x3366f59617dd3bb2
	.xword	0x299d2da2df4bf4e2
	.xword	0x80a80e167fba8fec
	.xword	0x76cd25d692bdee08
	.xword	0x3757a91dd6c00896
	.xword	0x1b9b6ba3104138e1
	.xword	0x64f97f412833a2f8
	.xword	0xd0ffa84a981cf682
	.xword	0x45b63c9c3a568c2c
	.xword	0xd0b4631e19ecf773
	.xword	0x181182a513ebd874
	.xword	0x47e1696f58deb7e6
	.xword	0xc2ba842db8b7c057
	.xword	0xb2ee0aa88c07fcda
	.xword	0xf63372a3a35ea717
	.xword	0x325451a6b210920a
	.xword	0x6775b2e71c93cbdd
	.align 0x80000
	.data
data_start_7:

	.xword	0xe77b69d97bd0b6b2
	.xword	0x690428a6ef235a0b
	.xword	0x151da45355312588
	.xword	0xc3ec8a311db55e52
	.xword	0x6d41888e1d6e77b0
	.xword	0x21f9e7c6bc5c4769
	.xword	0xdcf54a79855aa397
	.xword	0xc5b369cf42fbfa68
	.xword	0xb4151632b298242f
	.xword	0x84ec8136db02efb9
	.xword	0x80fb314c58704c91
	.xword	0xf326cc42a61f3839
	.xword	0xbf81b9e0e2393ecb
	.xword	0x1a73bc49067fc636
	.xword	0x816b1e30d4fa9d89
	.xword	0xda9774b2503db497
	.xword	0xa66169dd7d2d2c35
	.xword	0xb30254cfa5136777
	.xword	0x845b39922e4f3459
	.xword	0x08bd51292a0b1f2c
	.xword	0xa787484f704c263d
	.xword	0xcb31f6bf92883867
	.xword	0xc73f85fb31846466
	.xword	0x6f0dbe11cd735d2f
	.xword	0xc977236242f20141
	.xword	0xaa3cbf940f1d6ecb
	.xword	0x8c42052aed623beb
	.xword	0x311bea204611def5
	.xword	0xdeddc1dcfc2730b4
	.xword	0x08f240ab78ddd89f
	.xword	0xb694b5691d8dc346
	.xword	0x0cf1d391c6754828
	.xword	0x3df4418dbfcb678e
	.xword	0x28270cd749d4d5d7
	.xword	0x62157989970f64e8
	.xword	0xd14c7fdc648ae01b
	.xword	0x6166e5a23da59281
	.xword	0xa6ba9f0fabe55c24
	.xword	0xf7e5f76883fa33df
	.xword	0xcb2de26d132853a7
	.xword	0x3921c1155d98640c
	.xword	0x23a3a519ce7d5425
	.xword	0xb10fbfd596941a36
	.xword	0x71b4dc3cc7424961
	.xword	0x2ee9cc6197807043
	.xword	0xb152a3dd67053a9b
	.xword	0x25a93a720037c686
	.xword	0x2b719176cf08f056
	.xword	0xd07ef2ec943da5da
	.xword	0x61a73cdb3fc47392
	.xword	0xa4c24eef3e479627
	.xword	0xcb46e561fb55dc8b
	.xword	0x338fc6866069fca3
	.xword	0x48cdb2b9d252c1df
	.xword	0xc9bafffb3f73166f
	.xword	0xb561e4ff192b759d
	.xword	0x0e124b0236100d7d
	.xword	0xd8da7a939a64dfd4
	.xword	0x6e7d6fd117be0b18
	.xword	0x0407edefb8f0078e
	.xword	0x666626e57c55f07a
	.xword	0xeb004a1e7c83fd5a
	.xword	0xc24f8cb10a8033e1
	.xword	0xfe67f825fcca7e90
	.xword	0x391f33eb5d76a0da
	.xword	0xae325d757cd485f8
	.xword	0x22c2c7513d8a9784
	.xword	0x9c8873962c3ab301
	.xword	0x7dc635ac15b48b4f
	.xword	0x1d3a51bd664fff2f
	.xword	0x703cddc91bd30180
	.xword	0x3a5009170ba885d9
	.xword	0x06880f1c81c25d69
	.xword	0xd633dcd41a2aa9cb
	.xword	0x394f0bfcb31dd578
	.xword	0x74d04c7011c387e7
	.xword	0xf956aeee51ef65ec
	.xword	0x58ea03c8c41f9af0
	.xword	0x351acd19ca094736
	.xword	0xd0757fd0e6509790
	.xword	0x14373aa50ac30410
	.xword	0xec6539ce24880294
	.xword	0xc6b1ecde204fcae1
	.xword	0xe5933343695ddf38
	.xword	0x6d62029eea092c28
	.xword	0xd25692d2c2d5415c
	.xword	0x84f71ec1b415489f
	.xword	0xe0303119480073a7
	.xword	0xec476f45ac8843d6
	.xword	0xc77380382cc17867
	.xword	0xf05ceba2a43e5380
	.xword	0x26419895e24a3146
	.xword	0xf8be514318de69ef
	.xword	0x040c4d1cb3b22e55
	.xword	0x85396f31d57cbaa0
	.xword	0xe82af951c3882e49
	.xword	0x59adde254faf55cb
	.xword	0x717b3e102aab8402
	.xword	0x319f65b8ae9e9e3c
	.xword	0x47bb7259d6e72afe
	.xword	0xff619dad18ab40ab
	.xword	0x6647d6981d0a54ad
	.xword	0x735e2c5e97851f1f
	.xword	0x6060fa24c94aa6d6
	.xword	0x0a418db165fcf8ef
	.xword	0xff4fe0eb3fc2e73b
	.xword	0x5b7271f044beaa12
	.xword	0xeaca17c3c0db1fe6
	.xword	0x2eabeba7f2f468a1
	.xword	0x091eab574790831b
	.xword	0xa8823c925d9c6b9e
	.xword	0xe50963fa87cf27a3
	.xword	0x80db2550d337b6f7
	.xword	0x7781101d8dabf17e
	.xword	0xfce25c581f24cfab
	.xword	0x9cc059a9f460bd24
	.xword	0x65259ff43cd93f56
	.xword	0xdc9351c6011a2b77
	.xword	0x3493d53e3316ea07
	.xword	0x272b6498d709c81f
	.xword	0xd43ec06e15dd666c
	.xword	0xef4930177afdf582
	.xword	0x9da16e32ba57550a
	.xword	0x1b2cc1b5952144dc
	.xword	0xc7e9d21b507b3871
	.xword	0xec37cbbf9a522650
	.xword	0xead34aee2b6ddb6b
	.xword	0x160cecbff136348f
	.xword	0x50a6dd16ab5f5c52
	.xword	0x79dadf7c480ce3e3
	.xword	0xb1490d4a40109f81
	.xword	0xba12cb356d7b7cf9
	.xword	0x938df5b271185f07
	.xword	0x1793312b34f2817f
	.xword	0xc2f8f9538142701f
	.xword	0x0baf4529e482706f
	.xword	0x15fa42cc96666f33
	.xword	0xcf2136b4897661a5
	.xword	0xb563b28402d15f7f
	.xword	0xd1bd70c419c298f0
	.xword	0xf5bef6dcc3bcc543
	.xword	0xfd3a549ed2057669
	.xword	0x7c7667f6056e6dd9
	.xword	0x63d5bd2b58e38a39
	.xword	0x91b6ae2c8387d771
	.xword	0xba1319298b2cb9b4
	.xword	0xc32337ff8cf9cd81
	.xword	0x583523c9ab2b0109
	.xword	0x9dca3755e01f9451
	.xword	0xd82f763aeb09c578
	.xword	0x0c936ff937c92da7
	.xword	0x936a2702dc22e647
	.xword	0xa9083086ac01ad6e
	.xword	0xc060615b1aa38730
	.xword	0x8b4548e7937b573f
	.xword	0xaafffc38f3d91a0d
	.xword	0x2b0065afe0ff395c
	.xword	0xf7195816c375fcd5
	.xword	0x9d5f7b5e69275130
	.xword	0xa45f035f815fc1c8
	.xword	0xf6eae41934e929ab
	.xword	0x9aad8873845979e4
	.xword	0x1cc26e83e567e2eb
	.xword	0x16233360e034c2a2
	.xword	0xeb4fa3e8288efc54
	.xword	0x3a630216342a0103
	.xword	0x575f105ff508c1aa
	.xword	0x881a1f7085b70e03
	.xword	0x70070fb41cc29b79
	.xword	0x778c924d5b104148
	.xword	0xc70b6ab1d3e7eb1e
	.xword	0x9cefddcb6b9ae6ee
	.xword	0x7fea2d69e44fcf13
	.xword	0xbdb7b7638200b16e
	.xword	0x6c4660a51a0e4133
	.xword	0xc8c203a4f1e2d359
	.xword	0xe7daaccffaf245e7
	.xword	0xab8e714ccbd0f32b
	.xword	0x4dd6ddf07316c859
	.xword	0xf1701d1b6987d3b4
	.xword	0x5dadd54a31d10c21
	.xword	0xbcb2220c1bf28954
	.xword	0x466ddedc3b5e6586
	.xword	0xa27a394faaeb490c
	.xword	0xd45b9128918f8252
	.xword	0x1f3a75d71e2f6bac
	.xword	0x86818585160bb811
	.xword	0x2fa2d7faf34f3fac
	.xword	0x10ecba177d38be45
	.xword	0x8ebd8cb01d53cce6
	.xword	0x0043ff37e2abcc39
	.xword	0xfa87856a29e1fe89
	.xword	0x1d6699b47b1f1257
	.xword	0x294750e1a6ad215e
	.xword	0x980fba4e7689c46c
	.xword	0x7a649c66d53c93d2
	.xword	0xcbf906c280effd55
	.xword	0xdc6032cdf1abeb8b
	.xword	0x71601e47008f83e3
	.xword	0xe83fff5647ff7a69
	.xword	0xa657a8e6dcdc337a
	.xword	0x6ecc30318219edc3
	.xword	0x7c0da672c3e12ac2
	.xword	0x6e457ee914795d17
	.xword	0x39cdd7da1f94fda7
	.xword	0xfdbb7a89360f9784
	.xword	0x3b2ec2447e5af3a8
	.xword	0xba19ecc99b1db1a4
	.xword	0xf2c03ef06453d98d
	.xword	0x63fcc8f86f329cc0
	.xword	0xbe84eed2a1468f14
	.xword	0x4cc909cb1022a2cf
	.xword	0xeca75e5bb0f3dd5a
	.xword	0x3833dba4fb57299b
	.xword	0x2d24cc2d4b6ffd87
	.xword	0x105685d4d9779c4c
	.xword	0xab6fa6c1ad5daf04
	.xword	0x42f2e0bbf49e4d4a
	.xword	0x1df7a99b840ab910
	.xword	0xb22b23822ca184ed
	.xword	0x0cadd12e03384a33
	.xword	0x54a7f7c03eb35322
	.xword	0x2b719b409366157e
	.xword	0x80f612804f4e5c47
	.xword	0xcf6789030efdaf44
	.xword	0x24529208551ff6fc
	.xword	0x2a4f1d012b036219
	.xword	0x9c495cd749571e23
	.xword	0xf862a60e1d4c5cee
	.xword	0x4143e8bda9be7375
	.xword	0xb430bb90d71af4ef
	.xword	0x46476a3f4f99e97e
	.xword	0xc7fd4e4902ae2607
	.xword	0x2b0166c78b558db5
	.xword	0x97eef05e663963b7
	.xword	0xf95195dea851a378
	.xword	0x8e9e3bdcabc246aa
	.xword	0xcfa62c1d28eaee6d
	.xword	0xc9f85caa55179b21
	.xword	0x1a31c06380daaabc
	.xword	0x177d9fd649670b1a
	.xword	0x1004274f510f5a21
	.xword	0xf90ee9d2c3e623c4
	.xword	0x11fef8c7b9122be0
	.xword	0xb1b784f8a5ca2a1f
	.xword	0x103f76108fc5b691
	.xword	0x2327ff8039e9cedb
	.xword	0xe5f501971995c8c3
	.xword	0xf263511aed3bdb9a
	.xword	0x5f361773d92c569c
	.xword	0xe7174efbe479cd9f
	.xword	0x7c5c7604384f2264
	.xword	0xb2906328d528d6ad
	.xword	0xfe1c22ec197d9a1e
	.xword	0x92406f781ed703d1
	.xword	0xfffe4cd7731c8ec6



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
