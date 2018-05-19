// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_61.s
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
   random seed:	666003571
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

	setx 0x6309037741f8639a, %g1, %g0
	setx 0x7ecaede5b1485ef4, %g1, %g1
	setx 0x296343de06617570, %g1, %g2
	setx 0xa7d8e07f148832e5, %g1, %g3
	setx 0xf3f498f73b842cc1, %g1, %g4
	setx 0xb457cec5dd92522a, %g1, %g5
	setx 0x090127597b5bf078, %g1, %g6
	setx 0xcd6c6992884506c1, %g1, %g7
	setx 0x5a9dc3474f8e23e9, %g1, %r16
	setx 0x2fc36c2a15d97c34, %g1, %r17
	setx 0x3c1a238258a5090e, %g1, %r18
	setx 0x22a8d12d0388dfd3, %g1, %r19
	setx 0x4e060c0f596b220e, %g1, %r20
	setx 0x7b67a71bedb997d9, %g1, %r21
	setx 0x43591e5f35c27cdf, %g1, %r22
	setx 0x69b5fffe0a9409a6, %g1, %r23
	setx 0x5534a6fc430e83e6, %g1, %r24
	setx 0x66c1b639dd9a0dbe, %g1, %r25
	setx 0x0fe086db104f9ca6, %g1, %r26
	setx 0xeb4d1a1ddd209b99, %g1, %r27
	setx 0xa50136b4e8c6baf0, %g1, %r28
	setx 0x0a2df67c926b8ce1, %g1, %r29
	setx 0xbe96841b004cb44a, %g1, %r30
	setx 0x1180a5601e1cb0e1, %g1, %r31
	save
	setx 0xa2db60e929a6153b, %g1, %r16
	setx 0xe72ac41e064569db, %g1, %r17
	setx 0xb8477fd0ba5da5df, %g1, %r18
	setx 0xd2ad6f97adb315da, %g1, %r19
	setx 0x6b82385259535ba8, %g1, %r20
	setx 0xe7eff18911341748, %g1, %r21
	setx 0x4f7364f906892d13, %g1, %r22
	setx 0xad09a623d8696b73, %g1, %r23
	setx 0xbe530b0218b2ea6e, %g1, %r24
	setx 0xc3094dd8ab5c74e7, %g1, %r25
	setx 0x1306bd6a8f95ddf9, %g1, %r26
	setx 0xd919b826d2852a37, %g1, %r27
	setx 0x5e40ea76825a5a20, %g1, %r28
	setx 0x3d7e3df420e2e965, %g1, %r29
	setx 0xf4a1a85d491f04e7, %g1, %r30
	setx 0x64d2e340f651cb3a, %g1, %r31
	save
	setx 0x7e757092f18eca2a, %g1, %r16
	setx 0x86400eec9eb9134e, %g1, %r17
	setx 0xa81f0adcdf1f217d, %g1, %r18
	setx 0x70d985beb162bdef, %g1, %r19
	setx 0x4d7e07f966d483d4, %g1, %r20
	setx 0xc82268f9301ac9c1, %g1, %r21
	setx 0x70a6ee57628993ed, %g1, %r22
	setx 0xb90e4792c140c988, %g1, %r23
	setx 0x2ea79d9906f87a79, %g1, %r24
	setx 0xd1343d2c88ead9f0, %g1, %r25
	setx 0x35f628b8bd64a97b, %g1, %r26
	setx 0x18b4b9fd67899246, %g1, %r27
	setx 0xb00d91fb5e23eb04, %g1, %r28
	setx 0xc5abb885850279ee, %g1, %r29
	setx 0xacb8e51316f8f389, %g1, %r30
	setx 0x46485f972e69290e, %g1, %r31
	save
	setx 0xec800d2d252ff65b, %g1, %r16
	setx 0x0345a1b3314afcdc, %g1, %r17
	setx 0x83155b224c1ccc06, %g1, %r18
	setx 0x37ae8d08a08041e5, %g1, %r19
	setx 0x83b138d076958aec, %g1, %r20
	setx 0x2ed5754f44b16b9b, %g1, %r21
	setx 0xf6540a65b78fb64a, %g1, %r22
	setx 0x3216e5bd41a3d510, %g1, %r23
	setx 0xf7913f1b6c4aa8dc, %g1, %r24
	setx 0x1ac6c86572fca9e9, %g1, %r25
	setx 0xa797fc0e10851bff, %g1, %r26
	setx 0x61a8b84e3e03debc, %g1, %r27
	setx 0xed67b91bc700fdbd, %g1, %r28
	setx 0x2b0944c8d6b21309, %g1, %r29
	setx 0x15b78b1406ab54a0, %g1, %r30
	setx 0x92c21c9262c53415, %g1, %r31
	save
	setx 0x1e37c32dbf9cef43, %g1, %r16
	setx 0xc45527fdb8e93ff5, %g1, %r17
	setx 0xe35da1116480e487, %g1, %r18
	setx 0xeb3cbc661c6b0aea, %g1, %r19
	setx 0x6c1094eada4f4572, %g1, %r20
	setx 0xc6bc454069f1c54a, %g1, %r21
	setx 0xc6a9cb09a6c2827c, %g1, %r22
	setx 0x68e50e070bb815f8, %g1, %r23
	setx 0xec50d1c5942ae1cb, %g1, %r24
	setx 0x630258bf2d4885ef, %g1, %r25
	setx 0xc2a437611124e595, %g1, %r26
	setx 0xc14ce8c84c417db9, %g1, %r27
	setx 0x9d698d9a252dad0f, %g1, %r28
	setx 0x94f3173316c87001, %g1, %r29
	setx 0x8fd55b824e139c61, %g1, %r30
	setx 0x927dfd7dc3d4ead9, %g1, %r31
	save
	setx 0xbfcc617bda517662, %g1, %r16
	setx 0x218a4249752380c9, %g1, %r17
	setx 0x9bebab0d292dae0a, %g1, %r18
	setx 0xe320b682506cbe61, %g1, %r19
	setx 0x4b01c880d26e796c, %g1, %r20
	setx 0xe21b87534b4628e6, %g1, %r21
	setx 0x490a55204723ca3d, %g1, %r22
	setx 0xa4f41be08c461597, %g1, %r23
	setx 0xaec4b4c887374a83, %g1, %r24
	setx 0x0b5c49ff8a199252, %g1, %r25
	setx 0x6931ac4874d6022f, %g1, %r26
	setx 0xf1be909389a15a9a, %g1, %r27
	setx 0xb7167259649ae34c, %g1, %r28
	setx 0x9d4b0fd4e63b339c, %g1, %r29
	setx 0x8badb6ece4b4aad5, %g1, %r30
	setx 0x9a50604194e65fd7, %g1, %r31
	save
	setx 0x379123c00d746a18, %g1, %r16
	setx 0x1ab770d7167e7e2b, %g1, %r17
	setx 0x16789d7e95a17b0b, %g1, %r18
	setx 0x4fc76d7b81e9dfe7, %g1, %r19
	setx 0x95d7d4956c079071, %g1, %r20
	setx 0x974a449ba56840b6, %g1, %r21
	setx 0x25a334ad66d7ed68, %g1, %r22
	setx 0x469b561f85408027, %g1, %r23
	setx 0x275ca074f4781065, %g1, %r24
	setx 0xb8b90b5b44b1d97d, %g1, %r25
	setx 0xcd1a9b1e11dd6af9, %g1, %r26
	setx 0xcb84e13f566d7881, %g1, %r27
	setx 0x919199bccc5887d5, %g1, %r28
	setx 0x892f0573c2deea78, %g1, %r29
	setx 0x5d042061d09554ac, %g1, %r30
	setx 0xb552289180d82939, %g1, %r31
	save
	setx 0x5c9466947c3987b5, %g1, %r16
	setx 0xcd671a716e5e19ad, %g1, %r17
	setx 0x6f64da404c729dcd, %g1, %r18
	setx 0x66d9e36047e5a5f2, %g1, %r19
	setx 0x7224724a084ddc69, %g1, %r20
	setx 0xf5c5460b95816fb7, %g1, %r21
	setx 0x4e44f0ea64410bcf, %g1, %r22
	setx 0xc74da042e1ae564d, %g1, %r23
	setx 0xa53b92f93255c551, %g1, %r24
	setx 0x2b76d5f1c42fbaf5, %g1, %r25
	setx 0x61f9e39c9dd6cca3, %g1, %r26
	setx 0x5bd36448dd120920, %g1, %r27
	setx 0x2c9f6904bd40d78b, %g1, %r28
	setx 0x222fb5f8636c6b87, %g1, %r29
	setx 0xf7d00e943c32da78, %g1, %r30
	setx 0xa46861934c137c95, %g1, %r31
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
	.word 0xbfe4a195  ! 2: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e460a9  ! 5: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421cf  ! 8: SAVE_I	save	%r16, 0x0001, %r25
	mov	2, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc1d4000  ! 14: XOR_R	xor 	%r21, %r0, %r30
	.word 0xb7e4201b  ! 15: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0x8394e053  ! 19: WRPR_TNPC_I	wrpr	%r19, 0x0053, %tnpc
	setx	data_start_4, %g1, %r17
	.word 0xb9e5a0e4  ! 21: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e42074  ! 23: SAVE_I	save	%r16, 0x0001, %r25
	setx	0xb00c4c600000ddc0, %g1, %r10
	.word 0x839a8000  ! 24: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde561d3  ! 26: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe56004  ! 28: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e560f1  ! 31: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4a040  ! 32: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbcc461eb  ! 34: ADDCcc_I	addccc 	%r17, 0x01eb, %r30
	mov	1, %r12
	.word 0x8f930000  ! 38: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e46199  ! 40: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8794e1f6  ! 41: WRPR_TT_I	wrpr	%r19, 0x01f6, %tt
	.word 0xbf508000  ! 46: RDPR_TSTATE	<illegal instruction>
	.word 0xbde561e9  ! 47: SAVE_I	save	%r21, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 48: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e4e090  ! 49: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8195a103  ! 50: WRPR_TPC_I	wrpr	%r22, 0x0103, %tpc
	.word 0xbfe46099  ! 51: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe420b8  ! 59: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5a1e6  ! 62: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e561f6  ! 63: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x89942086  ! 69: WRPR_TICK_I	wrpr	%r16, 0x0086, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 75: RDPR_TICK	<illegal instruction>
	.word 0xbc8d8000  ! 76: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xb1e5e0fe  ! 77: SAVE_I	save	%r23, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 79: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8395a056  ! 80: WRPR_TNPC_I	wrpr	%r22, 0x0056, %tnpc
	.word 0xb1e5a010  ! 81: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbead0000  ! 86: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xbbe4e003  ! 90: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x745047c300007917, %g1, %r10
	.word 0x819a8000  ! 91: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195e125  ! 94: WRPR_TPC_I	wrpr	%r23, 0x0125, %tpc
	setx	0x63b69a0e0000ea96, %g1, %r10
	.word 0x819a8000  ! 99: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e4a0e1  ! 103: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4e1bf  ! 108: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e52010  ! 111: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1500000  ! 112: RDPR_TPC	<illegal instruction>
	.word 0xbde560b1  ! 113: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8d94e1b8  ! 114: WRPR_PSTATE_I	wrpr	%r19, 0x01b8, %pstate
	.word 0xb1e560d0  ! 115: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5a119  ! 120: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4e15b  ! 121: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb68da188  ! 125: ANDcc_I	andcc 	%r22, 0x0188, %r27
	.word 0xb9e4e078  ! 130: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4209b  ! 131: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x6290f1a300006d52, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e461bb  ! 135: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e52144  ! 140: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe460c5  ! 141: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e4e1bd  ! 143: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e521aa  ! 144: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4604b  ! 147: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e420a1  ! 149: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x9195e16d  ! 152: WRPR_PIL_I	wrpr	%r23, 0x016d, %pil
	.word 0xbfe4a120  ! 153: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x9195e184  ! 155: WRPR_PIL_I	wrpr	%r23, 0x0184, %pil
	.word 0xb1e46186  ! 158: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a05b  ! 163: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4215b  ! 164: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4a099  ! 166: SAVE_I	save	%r18, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 168: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5e1c8  ! 171: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5a16b  ! 176: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	setx	0x146564740000a95d, %g1, %r10
	.word 0x819a8000  ! 182: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3520000  ! 183: RDPR_PIL	<illegal instruction>
	.word 0xb151c000  ! 186: RDPR_TL	<illegal instruction>
	.word 0xb3e56101  ! 189: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e420c6  ! 192: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e46124  ! 195: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e46131  ! 198: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4a03b  ! 200: SAVE_I	save	%r18, 0x0001, %r24
	setx	0xb3c29b9b0000bd4c, %g1, %r10
	.word 0x839a8000  ! 201: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xb1e521c6  ! 210: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e5a050  ! 216: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbb50c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8d95a187  ! 222: WRPR_PSTATE_I	wrpr	%r22, 0x0187, %pstate
	mov	2, %r12
	.word 0xa1930000  ! 224: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4e04c  ! 225: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde520a8  ! 227: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5343001  ! 229: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb5e5e1d1  ! 233: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e561f9  ! 245: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8d94e035  ! 247: WRPR_PSTATE_I	wrpr	%r19, 0x0035, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85956132  ! 255: WRPR_TSTATE_I	wrpr	%r21, 0x0132, %tstate
	.word 0xb9e4a0a2  ! 257: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd480000  ! 259: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52182  ! 263: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e4a12b  ! 270: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4e1c1  ! 271: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5619a  ! 272: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe56009  ! 279: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3540000  ! 280: RDPR_GL	<illegal instruction>
	.word 0xb5e4a1b0  ! 283: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e46105  ! 288: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5211a  ! 289: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56023  ! 291: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3508000  ! 294: RDPR_TSTATE	<illegal instruction>
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc61fb  ! 301: XNORcc_I	xnorcc 	%r17, 0x01fb, %r31
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	setx	0xfc55568c0000da9c, %g1, %r10
	.word 0x819a8000  ! 306: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e420d0  ! 307: SAVE_I	save	%r16, 0x0001, %r27
	setx	0xdb0438f500007aca, %g1, %r10
	.word 0x839a8000  ! 308: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc25e180  ! 311: SUB_I	sub 	%r23, 0x0180, %r30
	.word 0xb5e42006  ! 316: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a1f8  ! 317: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4e082  ! 318: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe460d5  ! 319: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5e011  ! 325: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb28ca0f5  ! 326: ANDcc_I	andcc 	%r18, 0x00f5, %r25
	mov	0, %r12
	.word 0x8f930000  ! 329: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xb6258000  ! 336: SUB_R	sub 	%r22, %r0, %r27
	.word 0xbde5604d  ! 337: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb4a50000  ! 339: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xbf508000  ! 346: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4a054  ! 347: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde461a1  ! 351: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe421c3  ! 353: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e188  ! 358: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5e012  ! 362: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4e1f6  ! 363: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe560b1  ! 364: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5a0e7  ! 366: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe461dc  ! 368: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5e07f  ! 372: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb09d21b1  ! 373: XORcc_I	xorcc 	%r20, 0x01b1, %r24
	.word 0xbde520a5  ! 378: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e4e0ed  ! 379: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde521d4  ! 380: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5a0c8  ! 383: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5206f  ! 385: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e46162  ! 386: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4214c  ! 388: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9510000  ! 389: RDPR_TICK	<illegal instruction>
	.word 0xbfe5e13f  ! 390: SAVE_I	save	%r23, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 392: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c2148  ! 395: XNOR_I	xnor 	%r16, 0x0148, %r26
	.word 0xb005e113  ! 396: ADD_I	add 	%r23, 0x0113, %r24
	.word 0xbde5a1e4  ! 397: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5e17b  ! 399: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb3da001  ! 401: SRA_I	sra 	%r22, 0x0001, %r29
	.word 0xbde42139  ! 405: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4a187  ! 412: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4a02c  ! 413: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a093  ! 416: WRPR_PSTATE_I	wrpr	%r22, 0x0093, %pstate
	.word 0xbd540000  ! 417: RDPR_GL	<illegal instruction>
	.word 0xb1e5e02b  ! 420: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb150c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0xbfe5e0bc  ! 424: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4211f  ! 429: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4a144  ! 432: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb04461a1  ! 433: ADDC_I	addc 	%r17, 0x01a1, %r24
	.word 0xb5508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 437: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a11a  ! 441: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e560d1  ! 443: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbe456077  ! 445: ADDC_I	addc 	%r21, 0x0077, %r31
	.word 0xbde4e0fe  ! 448: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5a193  ! 450: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4e19f  ! 461: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 466: RDPR_GL	<illegal instruction>
	.word 0xbfe52081  ! 467: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x91942057  ! 468: WRPR_PIL_I	wrpr	%r16, 0x0057, %pil
	mov	1, %r12
	.word 0xa1930000  ! 469: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xac2ec41c0000584d, %g1, %r10
	.word 0x839a8000  ! 473: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e5204e  ! 475: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e42170  ! 477: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e46042  ! 480: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a120  ! 485: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4610b  ! 486: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4205a  ! 487: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_2, %g1, %r18
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0cf  ! 499: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e52140  ! 500: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4a1c5  ! 504: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb695615d  ! 510: ORcc_I	orcc 	%r21, 0x015d, %r27
	.word 0xbde42046  ! 516: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e56088  ! 517: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8d95a1e0  ! 522: WRPR_PSTATE_I	wrpr	%r22, 0x01e0, %pstate
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0a9  ! 527: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb550c000  ! 528: RDPR_TT	<illegal instruction>
	setx	data_start_3, %g1, %r22
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735d000  ! 533: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xb3e521f0  ! 535: SAVE_I	save	%r20, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 537: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1510000  ! 541: RDPR_TICK	<illegal instruction>
	.word 0x8794e00d  ! 542: WRPR_TT_I	wrpr	%r19, 0x000d, %tt
	.word 0xb8ac4000  ! 543: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xb5e52087  ! 544: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe4e06f  ! 547: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb540000  ! 548: RDPR_GL	<illegal instruction>
	.word 0xb7e461cb  ! 549: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e102  ! 559: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb350c000  ! 562: RDPR_TT	<illegal instruction>
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a043  ! 566: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x89946121  ! 567: WRPR_TICK_I	wrpr	%r17, 0x0121, %tick
	.word 0xbfe4a1a6  ! 568: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5508000  ! 573: RDPR_TSTATE	<illegal instruction>
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e167  ! 577: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e109  ! 578: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e42162  ! 579: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5504000  ! 580: RDPR_TNPC	<illegal instruction>
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4204a  ! 590: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x81942032  ! 591: WRPR_TPC_I	wrpr	%r16, 0x0032, %tpc
	.word 0xb9e420d4  ! 593: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d94215c  ! 600: WRPR_PSTATE_I	wrpr	%r16, 0x015c, %pstate
	.word 0xb9e5e122  ! 601: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1540000  ! 602: RDPR_GL	<illegal instruction>
	.word 0xb1e5606a  ! 605: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4e05d  ! 606: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 610: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e460b9  ! 611: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e42072  ! 613: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe420e4  ! 614: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e09c  ! 616: WRPR_PIL_I	wrpr	%r23, 0x009c, %pil
	.word 0xb3e46177  ! 622: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_6, %g1, %r21
	.word 0xbbe52081  ! 627: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbbe4e1e7  ! 629: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5617e  ! 630: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb4b4c000  ! 636: ORNcc_R	orncc 	%r19, %r0, %r26
	.word 0xbb510000  ! 638: RDPR_TICK	<illegal instruction>
	.word 0xbde4a19e  ! 644: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e521ba  ! 645: SAVE_I	save	%r20, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 646: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb694a169  ! 648: ORcc_I	orcc 	%r18, 0x0169, %r27
	.word 0xb7e4e176  ! 649: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe4a007  ! 650: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9510000  ! 651: RDPR_TICK	<illegal instruction>
	.word 0xb9e460cc  ! 653: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e46059  ! 660: SAVE_I	save	%r17, 0x0001, %r26
	mov	2, %r12
	.word 0xa1930000  ! 665: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xd2da81730000ef81, %g1, %r10
	.word 0x839a8000  ! 669: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e46064  ! 673: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde52102  ! 675: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4a0a2  ! 676: SAVE_I	save	%r18, 0x0001, %r26
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 686: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e4a168  ! 689: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5540000  ! 690: RDPR_GL	<illegal instruction>
	setx	0x65554f4e00005a18, %g1, %r10
	.word 0x819a8000  ! 702: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e5e043  ! 705: SAVE_I	save	%r23, 0x0001, %r24
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e5a127  ! 709: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e461f6  ! 710: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x6ba1bb4c00002fc4, %g1, %r10
	.word 0x819a8000  ! 712: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe5e0cf  ! 715: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8394205d  ! 716: WRPR_TNPC_I	wrpr	%r16, 0x005d, %tnpc
	.word 0xb3e5e1ab  ! 717: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8794e062  ! 719: WRPR_TT_I	wrpr	%r19, 0x0062, %tt
	.word 0xb5e5a0ba  ! 720: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1355000  ! 724: SRLX_R	srlx	%r21, %r0, %r24
	setx	0x65c3b8900000ba14, %g1, %r10
	.word 0x839a8000  ! 725: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe520be  ! 727: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe561a9  ! 729: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5a0fb  ! 730: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbb2c2001  ! 735: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xbb510000  ! 736: RDPR_TICK	<illegal instruction>
	.word 0xbde5e138  ! 738: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x9194a0ef  ! 740: WRPR_PIL_I	wrpr	%r18, 0x00ef, %pil
	.word 0xbde5a076  ! 744: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4e05d  ! 745: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb48cc000  ! 746: ANDcc_R	andcc 	%r19, %r0, %r26
	.word 0x91946128  ! 752: WRPR_PIL_I	wrpr	%r17, 0x0128, %pil
	.word 0xb7e4a117  ! 753: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde560d3  ! 755: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbf500000  ! 756: RDPR_TPC	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xb7e4203d  ! 760: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8d94a0b9  ! 762: WRPR_PSTATE_I	wrpr	%r18, 0x00b9, %pstate
	.word 0xb1e521c4  ! 763: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e4a0e4  ! 764: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xba258000  ! 768: SUB_R	sub 	%r22, %r0, %r29
	.word 0xb3e561aa  ! 769: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8b48000  ! 774: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0x85956139  ! 778: WRPR_TSTATE_I	wrpr	%r21, 0x0139, %tstate
	.word 0xbfe5a056  ! 781: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4a1b4  ! 782: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb68c61bb  ! 784: ANDcc_I	andcc 	%r17, 0x01bb, %r27
	.word 0x919420cd  ! 785: WRPR_PIL_I	wrpr	%r16, 0x00cd, %pil
	.word 0xbfe5e1b5  ! 787: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb03461ed  ! 789: ORN_I	orn 	%r17, 0x01ed, %r24
	mov	2, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb835e1fa  ! 791: ORN_I	orn 	%r23, 0x01fa, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a0ca  ! 793: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf510000  ! 794: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 795: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4e1bb  ! 796: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4e0a0  ! 797: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e420f0  ! 799: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x9d9c14ad0000de5e, %g1, %r10
	.word 0x819a8000  ! 800: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf51c000  ! 803: RDPR_TL	<illegal instruction>
	setx	data_start_0, %g1, %r20
	.word 0xbde461b9  ! 807: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5605e  ! 809: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5206c  ! 813: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4448000  ! 815: ADDC_R	addc 	%r18, %r0, %r26
	.word 0xb1e5e045  ! 826: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbb518000  ! 831: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5a026  ! 832: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe5a103  ! 833: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe4206c  ! 836: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e46125  ! 837: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4e1ad  ! 838: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb151c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xbde5e1ed  ! 847: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5e0d6  ! 849: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9194e09e  ! 851: WRPR_PIL_I	wrpr	%r19, 0x009e, %pil
	.word 0xb5e5e0ad  ! 852: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb551c000  ! 855: RDPR_TL	<illegal instruction>
	.word 0xb8c4e113  ! 857: ADDCcc_I	addccc 	%r19, 0x0113, %r28
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421e0  ! 861: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e42172  ! 862: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5e1a4  ! 865: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb150c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0xb01de17a  ! 868: XOR_I	xor 	%r23, 0x017a, %r24
	.word 0x8794a09f  ! 869: WRPR_TT_I	wrpr	%r18, 0x009f, %tt
	.word 0xbf510000  ! 872: RDPR_TICK	<illegal instruction>
	setx	0x4d01b43400001c91, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42070  ! 882: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5e104  ! 885: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e151  ! 887: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb150c000  ! 888: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5e1e4  ! 892: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e56013  ! 894: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e4219a  ! 896: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46196  ! 899: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8395a017  ! 900: WRPR_TNPC_I	wrpr	%r22, 0x0017, %tnpc
	.word 0xb1e5a0bb  ! 901: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4609d  ! 902: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd518000  ! 904: RDPR_PSTATE	<illegal instruction>
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c2051  ! 912: ANDcc_I	andcc 	%r16, 0x0051, %r25
	.word 0xbde5e0b5  ! 919: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb23ce13a  ! 922: XNOR_I	xnor 	%r19, 0x013a, %r25
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0e4  ! 924: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8995e0bc  ! 929: WRPR_TICK_I	wrpr	%r23, 0x00bc, %tick
	.word 0xbfe5e0aa  ! 930: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e42179  ! 933: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e560ce  ! 935: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e560a0  ! 936: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb4a58000  ! 937: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xb3e4202f  ! 939: SAVE_I	save	%r16, 0x0001, %r25
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1b8  ! 947: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e4e107  ! 948: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe520a5  ! 949: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb33dc000  ! 957: SRA_R	sra 	%r23, %r0, %r25
	.word 0xb7e4a0df  ! 959: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde4a041  ! 963: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8194a1af  ! 966: WRPR_TPC_I	wrpr	%r18, 0x01af, %tpc
	.word 0x8994a17d  ! 970: WRPR_TICK_I	wrpr	%r18, 0x017d, %tick
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0b3  ! 973: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5e1d1  ! 974: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4619a  ! 978: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xbfe421c4  ! 980: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394208a  ! 982: WRPR_TNPC_I	wrpr	%r16, 0x008a, %tnpc
	.word 0xbe05e0f2  ! 985: ADD_I	add 	%r23, 0x00f2, %r31
	.word 0xbfe52139  ! 987: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb518000  ! 990: RDPR_PSTATE	<illegal instruction>
	.word 0xbd50c000  ! 991: RDPR_TT	<illegal instruction>
	.word 0x8395e051  ! 995: WRPR_TNPC_I	wrpr	%r23, 0x0051, %tnpc
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
	.word 0xfa2461c3  ! 1: STW_I	stw	%r29, [%r17 + 0x01c3]
	.word 0xf475c000  ! 4: STX_R	stx	%r26, [%r23 + %r0]
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33d4000  ! 7: STDF_R	std	%f25, [%r0, %r21]
	mov	2, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe1c0000  ! 14: XOR_R	xor 	%r16, %r0, %r31
	.word 0xfa344000  ! 17: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb3504000  ! 18: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8394a07f  ! 19: WRPR_TNPC_I	wrpr	%r18, 0x007f, %tnpc
	setx	data_start_0, %g1, %r18
	setx	0x5dbf996b00007a95, %g1, %r10
	.word 0x839a8000  ! 24: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc742170  ! 30: STX_I	stx	%r30, [%r16 + 0x0170]
	.word 0xf074c000  ! 33: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xb0c42163  ! 34: ADDCcc_I	addccc 	%r16, 0x0163, %r24
	mov	1, %r12
	.word 0x8f930000  ! 38: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf03d8000  ! 39: STD_R	std	%r24, [%r22 + %r0]
	.word 0x879560ac  ! 41: WRPR_TT_I	wrpr	%r21, 0x00ac, %tt
	.word 0xf13c0000  ! 42: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfe248000  ! 44: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xbf508000  ! 46: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	0, %r12
	.word 0x8f930000  ! 48: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194e078  ! 50: WRPR_TPC_I	wrpr	%r19, 0x0078, %tpc
	.word 0xff3d2144  ! 53: STDF_I	std	%f31, [0x0144, %r20]
	.word 0xf43ca0e0  ! 56: STD_I	std	%r26, [%r18 + 0x00e0]
	.word 0xf03c4000  ! 58: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf6744000  ! 61: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfc3d20e3  ! 65: STD_I	std	%r30, [%r20 + 0x00e3]
	.word 0x89942023  ! 69: WRPR_TICK_I	wrpr	%r16, 0x0023, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf23c4000  ! 71: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf0248000  ! 73: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xbb510000  ! 75: RDPR_TICK	rdpr	%tick, %r29
	.word 0xba8c8000  ! 76: ANDcc_R	andcc 	%r18, %r0, %r29
	mov	1, %r12
	.word 0xa1930000  ! 79: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394612f  ! 80: WRPR_TNPC_I	wrpr	%r17, 0x012f, %tnpc
	.word 0xf53c0000  ! 82: STDF_R	std	%f26, [%r0, %r16]
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2adc000  ! 86: ANDNcc_R	andncc 	%r23, %r0, %r25
	.word 0xfe7561ec  ! 87: STX_I	stx	%r31, [%r21 + 0x01ec]
	.word 0xf6754000  ! 88: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf8348000  ! 89: STH_R	sth	%r28, [%r18 + %r0]
	setx	0x4447080c00007c8b, %g1, %r10
	.word 0x819a8000  ! 91: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf22c4000  ! 93: STB_R	stb	%r25, [%r17 + %r0]
	.word 0x8195e064  ! 94: WRPR_TPC_I	wrpr	%r23, 0x0064, %tpc
	setx	0x234e941f0000eb9c, %g1, %r10
	.word 0x819a8000  ! 99: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc242069  ! 105: STW_I	stw	%r30, [%r16 + 0x0069]
	.word 0xb5500000  ! 112: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d94e0ff  ! 114: WRPR_PSTATE_I	wrpr	%r19, 0x00ff, %pstate
	.word 0xfe3dc000  ! 117: STD_R	std	%r31, [%r23 + %r0]
	.word 0xf62c8000  ! 118: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf23521e1  ! 119: STH_I	sth	%r25, [%r20 + 0x01e1]
	.word 0xb88da0d3  ! 125: ANDcc_I	andcc 	%r22, 0x00d3, %r28
	.word 0xfe2c2034  ! 128: STB_I	stb	%r31, [%r16 + 0x0034]
	setx	0xa0c8f2190000f84b, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4240000  ! 133: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfa2da11f  ! 138: STB_I	stb	%r29, [%r22 + 0x011f]
	.word 0xfc754000  ! 145: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfa2420eb  ! 148: STW_I	stw	%r29, [%r16 + 0x00eb]
	.word 0xf02d6065  ! 151: STB_I	stb	%r24, [%r21 + 0x0065]
	.word 0x9194a1e7  ! 152: WRPR_PIL_I	wrpr	%r18, 0x01e7, %pil
	.word 0x919421e1  ! 155: WRPR_PIL_I	wrpr	%r16, 0x01e1, %pil
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 160: STW_R	stw	%r26, [%r23 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 168: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf275c000  ! 169: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf22460b5  ! 170: STW_I	stw	%r25, [%r17 + 0x00b5]
	.word 0xfe250000  ! 173: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf4254000  ! 175: STW_R	stw	%r26, [%r21 + %r0]
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	setx	0x8f883acf00001b56, %g1, %r10
	.word 0x819a8000  ! 182: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7520000  ! 183: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb951c000  ! 186: RDPR_TL	<illegal instruction>
	.word 0xfa350000  ! 187: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf93d4000  ! 193: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf62c8000  ! 197: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf675a185  ! 199: STX_I	stx	%r27, [%r22 + 0x0185]
	setx	0xa38aad8e0000cc9a, %g1, %r10
	.word 0x839a8000  ! 201: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf624c000  ! 204: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xb5520000  ! 205: RDPR_PIL	rdpr	%pil, %r26
	.word 0xff3c21d2  ! 207: STDF_I	std	%f31, [0x01d2, %r16]
	.word 0xf62d604d  ! 209: STB_I	stb	%r27, [%r21 + 0x004d]
	.word 0xfa740000  ! 214: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfb3c60d7  ! 217: STDF_I	std	%f29, [0x00d7, %r17]
	.word 0xf82cc000  ! 219: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xb350c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8d946185  ! 222: WRPR_PSTATE_I	wrpr	%r17, 0x0185, %pstate
	.word 0xfc342155  ! 223: STH_I	sth	%r30, [%r16 + 0x0155]
	mov	2, %r12
	.word 0xa1930000  ! 224: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf343001  ! 229: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0xf2256116  ! 231: STW_I	stw	%r25, [%r21 + 0x0116]
	.word 0xf43dc000  ! 240: STD_R	std	%r26, [%r23 + %r0]
	.word 0xf63c4000  ! 243: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfe758000  ! 244: STX_R	stx	%r31, [%r22 + %r0]
	.word 0x8d9461c5  ! 247: WRPR_PSTATE_I	wrpr	%r17, 0x01c5, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf23c0000  ! 251: STD_R	std	%r25, [%r16 + %r0]
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a1ad  ! 255: WRPR_TSTATE_I	wrpr	%r18, 0x01ad, %tstate
	.word 0xb7480000  ! 259: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfd3d4000  ! 260: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf425e147  ! 261: STW_I	stw	%r26, [%r23 + 0x0147]
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 265: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf6748000  ! 267: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf824e0e8  ! 268: STW_I	stw	%r28, [%r19 + 0x00e8]
	.word 0xf23cc000  ! 273: STD_R	std	%r25, [%r19 + %r0]
	.word 0xff3c2010  ! 274: STDF_I	std	%f31, [0x0010, %r16]
	.word 0xf62c8000  ! 275: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf8344000  ! 276: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf024a103  ! 277: STW_I	stw	%r24, [%r18 + 0x0103]
	.word 0xf6352088  ! 278: STH_I	sth	%r27, [%r20 + 0x0088]
	.word 0xb5540000  ! 280: RDPR_GL	<illegal instruction>
	.word 0xfe3da144  ! 286: STD_I	std	%r31, [%r22 + 0x0144]
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93c4000  ! 292: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf33de0ba  ! 293: STDF_I	std	%f25, [0x00ba, %r23]
	.word 0xb3508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0xf13c0000  ! 296: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf275c000  ! 297: STX_R	stx	%r25, [%r23 + %r0]
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bde17c  ! 301: XNORcc_I	xnorcc 	%r23, 0x017c, %r27
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	setx	0x51c824200006d97, %g1, %r10
	.word 0x819a8000  ! 306: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x49efb2220000bbd5, %g1, %r10
	.word 0x839a8000  ! 308: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc25a084  ! 311: SUB_I	sub 	%r22, 0x0084, %r30
	.word 0xfb3c60a6  ! 315: STDF_I	std	%f29, [0x00a6, %r17]
	.word 0xf6750000  ! 321: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf33d4000  ! 322: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb68d20ef  ! 326: ANDcc_I	andcc 	%r20, 0x00ef, %r27
	mov	2, %r12
	.word 0x8f930000  ! 329: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3520000  ! 333: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf33c2097  ! 335: STDF_I	std	%f25, [0x0097, %r16]
	.word 0xb825c000  ! 336: SUB_R	sub 	%r23, %r0, %r28
	.word 0xf6342014  ! 338: STH_I	sth	%r27, [%r16 + 0x0014]
	.word 0xb2a4c000  ! 339: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xf62de14a  ! 340: STB_I	stb	%r27, [%r23 + 0x014a]
	.word 0xf73d8000  ! 341: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf53ce177  ! 342: STDF_I	std	%f26, [0x0177, %r19]
	.word 0xf02cc000  ! 343: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb3508000  ! 346: RDPR_TSTATE	<illegal instruction>
	.word 0xf62ca02c  ! 348: STB_I	stb	%r27, [%r18 + 0x002c]
	.word 0xf034a164  ! 349: STH_I	sth	%r24, [%r18 + 0x0164]
	.word 0xf42ca06b  ! 355: STB_I	stb	%r26, [%r18 + 0x006b]
	.word 0xf73de1d7  ! 359: STDF_I	std	%f27, [0x01d7, %r23]
	.word 0xf33c6145  ! 361: STDF_I	std	%f25, [0x0145, %r17]
	.word 0xf03da0c9  ! 367: STD_I	std	%r24, [%r22 + 0x00c9]
	.word 0xfa35c000  ! 371: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xb09ca02e  ! 373: XORcc_I	xorcc 	%r18, 0x002e, %r24
	.word 0xfa24a0d8  ! 375: STW_I	stw	%r29, [%r18 + 0x00d8]
	.word 0xbd510000  ! 389: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 392: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83da128  ! 395: XNOR_I	xnor 	%r22, 0x0128, %r28
	.word 0xb60460e5  ! 396: ADD_I	add 	%r17, 0x00e5, %r27
	.word 0xb13ca001  ! 401: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xfa34c000  ! 404: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf8752127  ! 406: STX_I	stx	%r28, [%r20 + 0x0127]
	.word 0xfc35a04c  ! 414: STH_I	sth	%r30, [%r22 + 0x004c]
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9521b2  ! 416: WRPR_PSTATE_I	wrpr	%r20, 0x01b2, %pstate
	.word 0xb9540000  ! 417: RDPR_GL	rdpr	%-, %r28
	.word 0xf33c60ab  ! 418: STDF_I	std	%f25, [0x00ab, %r17]
	.word 0xb550c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0xf83d60f3  ! 422: STD_I	std	%r28, [%r21 + 0x00f3]
	.word 0xfe25e087  ! 425: STW_I	stw	%r31, [%r23 + 0x0087]
	.word 0xf43d0000  ! 426: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf43ce11e  ! 427: STD_I	std	%r26, [%r19 + 0x011e]
	.word 0xf63c6175  ! 430: STD_I	std	%r27, [%r17 + 0x0175]
	.word 0xfa754000  ! 431: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb044a18c  ! 433: ADDC_I	addc 	%r18, 0x018c, %r24
	.word 0xb9508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xf23cc000  ! 436: STD_R	std	%r25, [%r19 + %r0]
	.word 0xbd500000  ! 437: RDPR_TPC	<illegal instruction>
	.word 0xfe34c000  ! 438: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf67521e0  ! 439: STX_I	stx	%r27, [%r20 + 0x01e0]
	.word 0xf035e15d  ! 440: STH_I	sth	%r24, [%r23 + 0x015d]
	.word 0xb6452002  ! 445: ADDC_I	addc 	%r20, 0x0002, %r27
	.word 0xf8350000  ! 452: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfe342189  ! 453: STH_I	sth	%r31, [%r16 + 0x0189]
	.word 0xfd3cc000  ! 455: STDF_R	std	%f30, [%r0, %r19]
	.word 0xfa2561dd  ! 458: STW_I	stw	%r29, [%r21 + 0x01dd]
	.word 0xf63d8000  ! 459: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf43ca0a4  ! 460: STD_I	std	%r26, [%r18 + 0x00a4]
	.word 0xf42c0000  ! 462: STB_R	stb	%r26, [%r16 + %r0]
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 466: RDPR_GL	<illegal instruction>
	.word 0x919520a5  ! 468: WRPR_PIL_I	wrpr	%r20, 0x00a5, %pil
	mov	1, %r12
	.word 0xa1930000  ! 469: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf63c8000  ! 470: STD_R	std	%r27, [%r18 + %r0]
	setx	0xde4adfe50000fddc, %g1, %r10
	.word 0x839a8000  ! 473: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8744000  ! 478: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf625a05c  ! 479: STW_I	stw	%r27, [%r22 + 0x005c]
	.word 0xfa3ce0f3  ! 484: STD_I	std	%r29, [%r19 + 0x00f3]
	setx	data_start_1, %g1, %r20
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034a1d4  ! 501: STH_I	sth	%r24, [%r18 + 0x01d4]
	.word 0xfe746198  ! 503: STX_I	stx	%r31, [%r17 + 0x0198]
	.word 0xfc744000  ! 508: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xba94a021  ! 510: ORcc_I	orcc 	%r18, 0x0021, %r29
	.word 0xf4250000  ! 512: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfe2dc000  ! 515: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf13c4000  ! 518: STDF_R	std	%f24, [%r0, %r17]
	.word 0xfe2d21fe  ! 520: STB_I	stb	%r31, [%r20 + 0x01fe]
	.word 0x8d94a04b  ! 522: WRPR_PSTATE_I	wrpr	%r18, 0x004b, %pstate
	.word 0xf82dc000  ! 523: STB_R	stb	%r28, [%r23 + %r0]
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 526: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb750c000  ! 528: RDPR_TT	rdpr	%tt, %r27
	setx	data_start_0, %g1, %r23
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934d000  ! 533: SRLX_R	srlx	%r19, %r0, %r28
	mov	0, %r12
	.word 0x8f930000  ! 537: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb510000  ! 541: RDPR_TICK	rdpr	%tick, %r29
	.word 0x87952109  ! 542: WRPR_TT_I	wrpr	%r20, 0x0109, %tt
	.word 0xb2ad8000  ! 543: ANDNcc_R	andncc 	%r22, %r0, %r25
	.word 0xff3da0b1  ! 545: STDF_I	std	%f31, [0x00b1, %r22]
	.word 0xbb540000  ! 548: RDPR_GL	rdpr	%-, %r29
	.word 0xfc34a0d5  ! 551: STH_I	sth	%r30, [%r18 + 0x00d5]
	.word 0xf73de081  ! 553: STDF_I	std	%f27, [0x0081, %r23]
	.word 0xf03d4000  ! 554: STD_R	std	%r24, [%r21 + %r0]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 558: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xfe354000  ! 561: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xbd50c000  ! 562: RDPR_TT	<illegal instruction>
	.word 0xf4254000  ! 563: STW_R	stw	%r26, [%r21 + %r0]
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89956033  ! 567: WRPR_TICK_I	wrpr	%r21, 0x0033, %tick
	.word 0xfc3de092  ! 569: STD_I	std	%r30, [%r23 + 0x0092]
	.word 0xfa24a02b  ! 571: STW_I	stw	%r29, [%r18 + 0x002b]
	.word 0xf434c000  ! 572: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xbf508000  ! 573: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 580: RDPR_TNPC	<illegal instruction>
	.word 0xfb3d213a  ! 581: STDF_I	std	%f29, [0x013a, %r20]
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3c0000  ! 589: STD_R	std	%r29, [%r16 + %r0]
	.word 0x8195610a  ! 591: WRPR_TPC_I	wrpr	%r21, 0x010a, %tpc
	.word 0xf43d20a1  ! 594: STD_I	std	%r26, [%r20 + 0x00a1]
	.word 0xf8354000  ! 597: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfc75200f  ! 598: STX_I	stx	%r30, [%r20 + 0x000f]
	.word 0x8d942121  ! 600: WRPR_PSTATE_I	wrpr	%r16, 0x0121, %pstate
	.word 0xbd540000  ! 602: RDPR_GL	rdpr	%-, %r30
	.word 0xfd3d20d2  ! 604: STDF_I	std	%f30, [0x00d2, %r20]
	.word 0xf02ce0fa  ! 607: STB_I	stb	%r24, [%r19 + 0x00fa]
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 610: RDPR_TSTATE	<illegal instruction>
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e1e5  ! 616: WRPR_PIL_I	wrpr	%r23, 0x01e5, %pil
	.word 0xf62d8000  ! 617: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf4240000  ! 619: STW_R	stw	%r26, [%r16 + %r0]
	setx	data_start_0, %g1, %r21
	.word 0xfc3420f1  ! 625: STH_I	sth	%r30, [%r16 + 0x00f1]
	.word 0xf13ce002  ! 626: STDF_I	std	%f24, [0x0002, %r19]
	.word 0xb3480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbcb44000  ! 636: ORNcc_R	orncc 	%r17, %r0, %r30
	.word 0xf33ce13d  ! 637: STDF_I	std	%f25, [0x013d, %r19]
	.word 0xb5510000  ! 638: RDPR_TICK	<illegal instruction>
	.word 0xf13d60dc  ! 642: STDF_I	std	%f24, [0x00dc, %r21]
	.word 0xfc744000  ! 643: STX_R	stx	%r30, [%r17 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 646: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe94e196  ! 648: ORcc_I	orcc 	%r19, 0x0196, %r31
	.word 0xb9510000  ! 651: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe3c0000  ! 655: STD_R	std	%r31, [%r16 + %r0]
	.word 0xfc2cc000  ! 657: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf53dc000  ! 658: STDF_R	std	%f26, [%r0, %r23]
	mov	2, %r12
	.word 0xa1930000  ! 665: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xd5d7dcd100003d50, %g1, %r10
	.word 0x839a8000  ! 669: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3de071  ! 682: STDF_I	std	%f29, [0x0071, %r23]
	.word 0xfc754000  ! 685: STX_R	stx	%r30, [%r21 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 686: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf824e0df  ! 687: STW_I	stw	%r28, [%r19 + 0x00df]
	.word 0xbf540000  ! 690: RDPR_GL	rdpr	%-, %r31
	.word 0xf4758000  ! 694: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xff3c8000  ! 695: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf03cc000  ! 697: STD_R	std	%r24, [%r19 + %r0]
	.word 0xfa3d2005  ! 698: STD_I	std	%r29, [%r20 + 0x0005]
	setx	0x4aeeee380000ea44, %g1, %r10
	.word 0x819a8000  ! 702: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe2c8000  ! 707: STB_R	stb	%r31, [%r18 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x1d443cf40000bb93, %g1, %r10
	.word 0x819a8000  ! 712: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf8750000  ! 713: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x8395e149  ! 716: WRPR_TNPC_I	wrpr	%r23, 0x0149, %tnpc
	.word 0x8795e0f8  ! 719: WRPR_TT_I	wrpr	%r23, 0x00f8, %tt
	.word 0xf53c6052  ! 722: STDF_I	std	%f26, [0x0052, %r17]
	.word 0xbd349000  ! 724: SRLX_R	srlx	%r18, %r0, %r30
	setx	0x44e9ef30000cb42, %g1, %r10
	.word 0x839a8000  ! 725: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d4000  ! 731: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfa2c0000  ! 732: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xbd2c6001  ! 735: SLL_I	sll 	%r17, 0x0001, %r30
	.word 0xb5510000  ! 736: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf73d0000  ! 739: STDF_R	std	%f27, [%r0, %r20]
	.word 0x9194a1a0  ! 740: WRPR_PIL_I	wrpr	%r18, 0x01a0, %pil
	.word 0xfd3cc000  ! 743: STDF_R	std	%f30, [%r0, %r19]
	.word 0xba8cc000  ! 746: ANDcc_R	andcc 	%r19, %r0, %r29
	.word 0xfe3c607a  ! 747: STD_I	std	%r31, [%r17 + 0x007a]
	.word 0xfa2da1e5  ! 749: STB_I	stb	%r29, [%r22 + 0x01e5]
	.word 0x919460fc  ! 752: WRPR_PIL_I	wrpr	%r17, 0x00fc, %pil
	.word 0xfc3d0000  ! 754: STD_R	std	%r30, [%r20 + %r0]
	.word 0xb5500000  ! 756: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf73d618e  ! 757: STDF_I	std	%f27, [0x018e, %r21]
	.word 0xfa25e082  ! 758: STW_I	stw	%r29, [%r23 + 0x0082]
	setx	data_start_0, %g1, %r23
	.word 0x8d94a0be  ! 762: WRPR_PSTATE_I	wrpr	%r18, 0x00be, %pstate
	.word 0xfe35c000  ! 767: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb0254000  ! 768: SUB_R	sub 	%r21, %r0, %r24
	.word 0xf2340000  ! 770: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb8b40000  ! 774: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0x8594e1ea  ! 778: WRPR_TSTATE_I	wrpr	%r19, 0x01ea, %tstate
	.word 0xf2358000  ! 779: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf73d4000  ! 783: STDF_R	std	%f27, [%r0, %r21]
	.word 0xbc8c61c5  ! 784: ANDcc_I	andcc 	%r17, 0x01c5, %r30
	.word 0x9194a0fb  ! 785: WRPR_PIL_I	wrpr	%r18, 0x00fb, %pil
	.word 0xbc34603a  ! 789: ORN_I	orn 	%r17, 0x003a, %r30
	mov	1, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb035203e  ! 791: ORN_I	orn 	%r20, 0x003e, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb510000  ! 794: RDPR_TICK	rdpr	%tick, %r29
	mov	1, %r12
	.word 0xa1930000  ! 795: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf43da15f  ! 798: STD_I	std	%r26, [%r22 + 0x015f]
	setx	0xa6c2cf8600000d85, %g1, %r10
	.word 0x819a8000  ! 800: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb751c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xf83cc000  ! 805: STD_R	std	%r28, [%r19 + %r0]
	setx	data_start_2, %g1, %r23
	.word 0xf93ce03d  ! 814: STDF_I	std	%f28, [0x003d, %r19]
	.word 0xb2458000  ! 815: ADDC_R	addc 	%r22, %r0, %r25
	.word 0xf234c000  ! 820: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf834c000  ! 821: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf93c61aa  ! 828: STDF_I	std	%f28, [0x01aa, %r17]
	.word 0xb5518000  ! 831: RDPR_PSTATE	<illegal instruction>
	.word 0xfa2da141  ! 835: STB_I	stb	%r29, [%r22 + 0x0141]
	.word 0xfc2c8000  ! 839: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xfc2c0000  ! 842: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf075a19a  ! 845: STX_I	stx	%r24, [%r22 + 0x019a]
	.word 0xb951c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0x9195a024  ! 851: WRPR_PIL_I	wrpr	%r22, 0x0024, %pil
	.word 0xb751c000  ! 855: RDPR_TL	rdpr	%tl, %r27
	.word 0xfd3d0000  ! 856: STDF_R	std	%f30, [%r0, %r20]
	.word 0xbac4a1a8  ! 857: ADDCcc_I	addccc 	%r18, 0x01a8, %r29
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3d0000  ! 863: STD_R	std	%r29, [%r20 + %r0]
	.word 0xff3da0a7  ! 864: STDF_I	std	%f31, [0x00a7, %r22]
	.word 0xb150c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0xb61d61a8  ! 868: XOR_I	xor 	%r21, 0x01a8, %r27
	.word 0x8795e1be  ! 869: WRPR_TT_I	wrpr	%r23, 0x01be, %tt
	.word 0xfe358000  ! 870: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xb3510000  ! 872: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf42d2063  ! 873: STB_I	stb	%r26, [%r20 + 0x0063]
	.word 0xf434a04c  ! 877: STH_I	sth	%r26, [%r18 + 0x004c]
	setx	0xbad6267000003b03, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf62c203a  ! 879: STB_I	stb	%r27, [%r16 + 0x003a]
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 888: RDPR_TT	rdpr	%tt, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa344000  ! 893: STH_R	sth	%r29, [%r17 + %r0]
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839560e3  ! 900: WRPR_TNPC_I	wrpr	%r21, 0x00e3, %tnpc
	.word 0xb9518000  ! 904: RDPR_PSTATE	rdpr	%pstate, %r28
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 911: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbe8c6165  ! 912: ANDcc_I	andcc 	%r17, 0x0165, %r31
	.word 0xf43c20cb  ! 913: STD_I	std	%r26, [%r16 + 0x00cb]
	.word 0xf635e02e  ! 914: STH_I	sth	%r27, [%r23 + 0x002e]
	.word 0xf83c4000  ! 916: STD_R	std	%r28, [%r17 + %r0]
	.word 0xf62c8000  ! 917: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf4244000  ! 918: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfe258000  ! 920: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xbc3da079  ! 922: XNOR_I	xnor 	%r22, 0x0079, %r30
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93ce0f7  ! 925: STDF_I	std	%f28, [0x00f7, %r19]
	.word 0xfc744000  ! 928: STX_R	stx	%r30, [%r17 + %r0]
	.word 0x89952028  ! 929: WRPR_TICK_I	wrpr	%r20, 0x0028, %tick
	.word 0xf83ca0a3  ! 931: STD_I	std	%r28, [%r18 + 0x00a3]
	.word 0xf2240000  ! 932: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xbea48000  ! 937: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xf4356030  ! 942: STH_I	sth	%r26, [%r21 + 0x0030]
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435a12e  ! 950: STH_I	sth	%r26, [%r22 + 0x012e]
	.word 0xf034a0ee  ! 953: STH_I	sth	%r24, [%r18 + 0x00ee]
	.word 0xb73c8000  ! 957: SRA_R	sra 	%r18, %r0, %r27
	.word 0xfd3c0000  ! 960: STDF_R	std	%f30, [%r0, %r16]
	.word 0x819520c6  ! 966: WRPR_TPC_I	wrpr	%r20, 0x00c6, %tpc
	.word 0xf42c4000  ! 967: STB_R	stb	%r26, [%r17 + %r0]
	.word 0x8995a099  ! 970: WRPR_TICK_I	wrpr	%r22, 0x0099, %tick
	.word 0xf02560f8  ! 971: STW_I	stw	%r24, [%r21 + 0x00f8]
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d4000  ! 977: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb950c000  ! 979: RDPR_TT	rdpr	%tt, %r28
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a189  ! 982: WRPR_TNPC_I	wrpr	%r22, 0x0189, %tnpc
	.word 0xf03d207a  ! 984: STD_I	std	%r24, [%r20 + 0x007a]
	.word 0xbc04e1c4  ! 985: ADD_I	add 	%r19, 0x01c4, %r30
	.word 0xbf518000  ! 990: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb350c000  ! 991: RDPR_TT	<illegal instruction>
	.word 0xfd3c2089  ! 994: STDF_I	std	%f30, [0x0089, %r16]
	.word 0x839560ad  ! 995: WRPR_TNPC_I	wrpr	%r21, 0x00ad, %tnpc
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
	.word 0xf245e19a  ! 3: LDSW_I	ldsw	[%r23 + 0x019a], %r25
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb61c0000  ! 14: XOR_R	xor 	%r16, %r0, %r27
	.word 0xb3504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0x839520eb  ! 19: WRPR_TNPC_I	wrpr	%r20, 0x00eb, %tnpc
	setx	data_start_3, %g1, %r19
	.word 0xfc144000  ! 22: LDUH_R	lduh	[%r17 + %r0], %r30
	setx	0xf7bb0f700000cc83, %g1, %r10
	.word 0x839a8000  ! 24: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf71de087  ! 25: LDDF_I	ldd	[%r23, 0x0087], %f27
	.word 0xfa550000  ! 27: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf2454000  ! 29: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xbcc4617a  ! 34: ADDCcc_I	addccc 	%r17, 0x017a, %r30
	.word 0xf24c4000  ! 35: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf0148000  ! 37: LDUH_R	lduh	[%r18 + %r0], %r24
	mov	2, %r12
	.word 0x8f930000  ! 38: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8795e087  ! 41: WRPR_TT_I	wrpr	%r23, 0x0087, %tt
	.word 0xbd508000  ! 46: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	2, %r12
	.word 0x8f930000  ! 48: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8195212b  ! 50: WRPR_TPC_I	wrpr	%r20, 0x012b, %tpc
	.word 0xfc54207d  ! 52: LDSH_I	ldsh	[%r16 + 0x007d], %r30
	.word 0xfb1ca174  ! 57: LDDF_I	ldd	[%r18, 0x0174], %f29
	.word 0xf80ca098  ! 64: LDUB_I	ldub	[%r18 + 0x0098], %r28
	.word 0xf65cc000  ! 66: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf454c000  ! 68: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0x8994a10a  ! 69: WRPR_TICK_I	wrpr	%r18, 0x010a, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf60d4000  ! 72: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xb9510000  ! 75: RDPR_TICK	<illegal instruction>
	.word 0xba8c4000  ! 76: ANDcc_R	andcc 	%r17, %r0, %r29
	mov	0, %r12
	.word 0xa1930000  ! 79: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83956036  ! 80: WRPR_TNPC_I	wrpr	%r21, 0x0036, %tnpc
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe040000  ! 84: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xbcad0000  ! 86: ANDNcc_R	andncc 	%r20, %r0, %r30
	setx	0xeadea66000000cde, %g1, %r10
	.word 0x819a8000  ! 91: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc5d4000  ! 92: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0x8194a120  ! 94: WRPR_TPC_I	wrpr	%r18, 0x0120, %tpc
	.word 0xf05d8000  ! 95: LDX_R	ldx	[%r22 + %r0], %r24
	setx	0xe5d662c700001bdf, %g1, %r10
	.word 0x819a8000  ! 99: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4140000  ! 100: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfc05c000  ! 101: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xfc5c8000  ! 102: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xfe458000  ! 104: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf71ca127  ! 106: LDDF_I	ldd	[%r18, 0x0127], %f27
	.word 0xfc0ca1a8  ! 107: LDUB_I	ldub	[%r18 + 0x01a8], %r30
	.word 0xb7500000  ! 112: RDPR_TPC	<illegal instruction>
	.word 0x8d94a165  ! 114: WRPR_PSTATE_I	wrpr	%r18, 0x0165, %pstate
	.word 0xfa148000  ! 123: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf05ce1f2  ! 124: LDX_I	ldx	[%r19 + 0x01f2], %r24
	.word 0xb88da1fa  ! 125: ANDcc_I	andcc 	%r22, 0x01fa, %r28
	.word 0xf84cc000  ! 129: LDSB_R	ldsb	[%r19 + %r0], %r28
	setx	0x7981294f00000d4e, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf2158000  ! 136: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xf2458000  ! 137: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xfe4c0000  ! 150: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0x9194602b  ! 152: WRPR_PIL_I	wrpr	%r17, 0x002b, %pil
	.word 0xf44ca0f7  ! 154: LDSB_I	ldsb	[%r18 + 0x00f7], %r26
	.word 0x9194a007  ! 155: WRPR_PIL_I	wrpr	%r18, 0x0007, %pil
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 168: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf31c0000  ! 174: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf64c8000  ! 177: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xfc4ce114  ! 178: LDSB_I	ldsb	[%r19 + 0x0114], %r30
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	0xb05a6a9d00009989, %g1, %r10
	.word 0x819a8000  ! 182: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7520000  ! 183: RDPR_PIL	<illegal instruction>
	.word 0xbf51c000  ! 186: RDPR_TL	<illegal instruction>
	.word 0xfc046014  ! 188: LDUW_I	lduw	[%r17 + 0x0014], %r30
	.word 0xff1c8000  ! 190: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf21c8000  ! 194: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf6458000  ! 196: LDSW_R	ldsw	[%r22 + %r0], %r27
	setx	0x133e55340000db03, %g1, %r10
	.word 0x839a8000  ! 201: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xfc1ca017  ! 206: LDD_I	ldd	[%r18 + 0x0017], %r30
	.word 0xf04dc000  ! 208: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf0152035  ! 211: LDUH_I	lduh	[%r20 + 0x0035], %r24
	.word 0xf214a163  ! 213: LDUH_I	lduh	[%r18 + 0x0163], %r25
	.word 0xf44461d4  ! 218: LDSW_I	ldsw	[%r17 + 0x01d4], %r26
	.word 0xb750c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8d95e12e  ! 222: WRPR_PSTATE_I	wrpr	%r23, 0x012e, %pstate
	mov	1, %r12
	.word 0xa1930000  ! 224: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61d0000  ! 226: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xb9353001  ! 229: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xf64ca063  ! 230: LDSB_I	ldsb	[%r18 + 0x0063], %r27
	.word 0xf11c4000  ! 232: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xf80c8000  ! 234: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf654c000  ! 236: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0x8d95a05a  ! 247: WRPR_PSTATE_I	wrpr	%r22, 0x005a, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb1de082  ! 249: LDDF_I	ldd	[%r23, 0x0082], %f29
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d20f0  ! 253: LDSB_I	ldsb	[%r20 + 0x00f0], %r31
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595210e  ! 255: WRPR_TSTATE_I	wrpr	%r20, 0x010e, %tstate
	.word 0xfa540000  ! 258: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xbf480000  ! 259: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1c0000  ! 264: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xf60c4000  ! 266: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xb5540000  ! 280: RDPR_GL	<illegal instruction>
	.word 0xf00de009  ! 282: LDUB_I	ldub	[%r23 + 0x0009], %r24
	.word 0xf0048000  ! 284: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf8148000  ! 285: LDUH_R	lduh	[%r18 + %r0], %r28
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 294: RDPR_TSTATE	<illegal instruction>
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bde005  ! 301: XNORcc_I	xnorcc 	%r23, 0x0005, %r24
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	.word 0xfe548000  ! 305: LDSH_R	ldsh	[%r18 + %r0], %r31
	setx	0x8067e8db0000da80, %g1, %r10
	.word 0x819a8000  ! 306: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x532edd700009b8e, %g1, %r10
	.word 0x839a8000  ! 308: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa54207f  ! 310: LDSH_I	ldsh	[%r16 + 0x007f], %r29
	.word 0xbc24a1b3  ! 311: SUB_I	sub 	%r18, 0x01b3, %r30
	.word 0xf8054000  ! 320: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xb48ce0c3  ! 326: ANDcc_I	andcc 	%r19, 0x00c3, %r26
	.word 0xf65dc000  ! 327: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf21da0db  ! 328: LDD_I	ldd	[%r22 + 0x00db], %r25
	mov	0, %r12
	.word 0x8f930000  ! 329: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf204612e  ! 330: LDUW_I	lduw	[%r17 + 0x012e], %r25
	.word 0xf854a17f  ! 331: LDSH_I	ldsh	[%r18 + 0x017f], %r28
	.word 0xfe1cc000  ! 332: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xbb520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xfa44e19c  ! 334: LDSW_I	ldsw	[%r19 + 0x019c], %r29
	.word 0xb0250000  ! 336: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb2a4c000  ! 339: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xf4544000  ! 344: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xbb508000  ! 346: RDPR_TSTATE	<illegal instruction>
	.word 0xf41de194  ! 350: LDD_I	ldd	[%r23 + 0x0194], %r26
	.word 0xf01da187  ! 352: LDD_I	ldd	[%r22 + 0x0187], %r24
	.word 0xfc4560cd  ! 357: LDSW_I	ldsw	[%r21 + 0x00cd], %r30
	.word 0xf64c2159  ! 369: LDSB_I	ldsb	[%r16 + 0x0159], %r27
	.word 0xb09c206b  ! 373: XORcc_I	xorcc 	%r16, 0x006b, %r24
	.word 0xfc4ce054  ! 374: LDSB_I	ldsb	[%r19 + 0x0054], %r30
	.word 0xfc4d21a0  ! 377: LDSB_I	ldsb	[%r20 + 0x01a0], %r30
	.word 0xfb1c8000  ! 382: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf51ce09c  ! 387: LDDF_I	ldd	[%r19, 0x009c], %f26
	.word 0xbd510000  ! 389: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 392: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23da096  ! 395: XNOR_I	xnor 	%r22, 0x0096, %r25
	.word 0xb604e1f7  ! 396: ADD_I	add 	%r19, 0x01f7, %r27
	.word 0xbf3ce001  ! 401: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xf60ce058  ! 410: LDUB_I	ldub	[%r19 + 0x0058], %r27
	.word 0xf45460e6  ! 411: LDSH_I	ldsh	[%r17 + 0x00e6], %r26
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d946099  ! 416: WRPR_PSTATE_I	wrpr	%r17, 0x0099, %pstate
	.word 0xb5540000  ! 417: RDPR_GL	<illegal instruction>
	.word 0xf24d20be  ! 419: LDSB_I	ldsb	[%r20 + 0x00be], %r25
	.word 0xbf50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0xf404a0e1  ! 423: LDUW_I	lduw	[%r18 + 0x00e1], %r26
	.word 0xbc4560ad  ! 433: ADDC_I	addc 	%r21, 0x00ad, %r30
	.word 0xb1508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xf005c000  ! 435: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xb9500000  ! 437: RDPR_TPC	<illegal instruction>
	.word 0xf4548000  ! 444: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xb644e138  ! 445: ADDC_I	addc 	%r19, 0x0138, %r27
	.word 0xf054c000  ! 449: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xfe14c000  ! 451: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xfe4d8000  ! 454: LDSB_R	ldsb	[%r22 + %r0], %r31
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64dc000  ! 464: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xfd1d211e  ! 465: LDDF_I	ldd	[%r20, 0x011e], %f30
	.word 0xbd540000  ! 466: RDPR_GL	<illegal instruction>
	.word 0x9195e174  ! 468: WRPR_PIL_I	wrpr	%r23, 0x0174, %pil
	mov	1, %r12
	.word 0xa1930000  ! 469: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf85d61f2  ! 471: LDX_I	ldx	[%r21 + 0x01f2], %r28
	.word 0xfe1ca114  ! 472: LDD_I	ldd	[%r18 + 0x0114], %r31
	setx	0x945ec83b0000ba1b, %g1, %r10
	.word 0x839a8000  ! 473: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_6, %g1, %r21
	.word 0xf255e017  ! 491: LDSH_I	ldsh	[%r23 + 0x0017], %r25
	.word 0xf85d4000  ! 494: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf65d8000  ! 495: LDX_R	ldx	[%r22 + %r0], %r27
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 505: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf45d6028  ! 506: LDX_I	ldx	[%r21 + 0x0028], %r26
	.word 0xfc140000  ! 507: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xba9460fd  ! 510: ORcc_I	orcc 	%r17, 0x00fd, %r29
	.word 0xf005a190  ! 513: LDUW_I	lduw	[%r22 + 0x0190], %r24
	.word 0xf65de153  ! 514: LDX_I	ldx	[%r23 + 0x0153], %r27
	.word 0x8d942091  ! 522: WRPR_PSTATE_I	wrpr	%r16, 0x0091, %pstate
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 528: RDPR_TT	<illegal instruction>
	.word 0xf65d60f5  ! 529: LDX_I	ldx	[%r21 + 0x00f5], %r27
	setx	data_start_5, %g1, %r19
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8054000  ! 532: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xb9359000  ! 533: SRLX_R	srlx	%r22, %r0, %r28
	mov	2, %r12
	.word 0x8f930000  ! 537: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf05ce13b  ! 538: LDX_I	ldx	[%r19 + 0x013b], %r24
	.word 0xfa4dc000  ! 540: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb1510000  ! 541: RDPR_TICK	<illegal instruction>
	.word 0x8795a192  ! 542: WRPR_TT_I	wrpr	%r22, 0x0192, %tt
	.word 0xb8acc000  ! 543: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xfc150000  ! 546: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xb5540000  ! 548: RDPR_GL	<illegal instruction>
	.word 0xf804a066  ! 552: LDUW_I	lduw	[%r18 + 0x0066], %r28
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1cc000  ! 560: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xb950c000  ! 562: RDPR_TT	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1c60e8  ! 565: LDDF_I	ldd	[%r17, 0x00e8], %f31
	.word 0x8994e1ed  ! 567: WRPR_TICK_I	wrpr	%r19, 0x01ed, %tick
	.word 0xb3508000  ! 573: RDPR_TSTATE	rdpr	%tstate, %r25
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d2078  ! 575: LDUB_I	ldub	[%r20 + 0x0078], %r26
	.word 0xb7504000  ! 580: RDPR_TNPC	<illegal instruction>
	.word 0xf80d20ec  ! 582: LDUB_I	ldub	[%r20 + 0x00ec], %r28
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5da058  ! 585: LDX_I	ldx	[%r22 + 0x0058], %r29
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c61a9  ! 588: LDX_I	ldx	[%r17 + 0x01a9], %r29
	.word 0x8194e012  ! 591: WRPR_TPC_I	wrpr	%r19, 0x0012, %tpc
	.word 0xf4146114  ! 596: LDUH_I	lduh	[%r17 + 0x0114], %r26
	.word 0xf0554000  ! 599: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0x8d94e0dc  ! 600: WRPR_PSTATE_I	wrpr	%r19, 0x00dc, %pstate
	.word 0xb5540000  ! 602: RDPR_GL	<illegal instruction>
	.word 0xf60d0000  ! 603: LDUB_R	ldub	[%r20 + %r0], %r27
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 610: RDPR_TSTATE	<illegal instruction>
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946151  ! 616: WRPR_PIL_I	wrpr	%r17, 0x0151, %pil
	.word 0xfe150000  ! 618: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf0550000  ! 620: LDSH_R	ldsh	[%r20 + %r0], %r24
	setx	data_start_4, %g1, %r19
	.word 0xb5480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa4c208a  ! 633: LDSB_I	ldsb	[%r16 + 0x008a], %r29
	.word 0xf85c21d0  ! 634: LDX_I	ldx	[%r16 + 0x01d0], %r28
	.word 0xf80d0000  ! 635: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xbeb50000  ! 636: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbd510000  ! 638: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 646: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb894614e  ! 648: ORcc_I	orcc 	%r17, 0x014e, %r28
	.word 0xb3510000  ! 651: RDPR_TICK	<illegal instruction>
	.word 0xfa1c4000  ! 652: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf31d0000  ! 654: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xf0558000  ! 656: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf214a1fa  ! 659: LDUH_I	lduh	[%r18 + 0x01fa], %r25
	.word 0xff1d21d6  ! 661: LDDF_I	ldd	[%r20, 0x01d6], %f31
	.word 0xf644e16b  ! 662: LDSW_I	ldsw	[%r19 + 0x016b], %r27
	.word 0xf61d8000  ! 664: LDD_R	ldd	[%r22 + %r0], %r27
	mov	0, %r12
	.word 0xa1930000  ! 665: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe5ca11b  ! 666: LDX_I	ldx	[%r18 + 0x011b], %r31
	.word 0xf24c2110  ! 667: LDSB_I	ldsb	[%r16 + 0x0110], %r25
	.word 0xfa4c0000  ! 668: LDSB_R	ldsb	[%r16 + %r0], %r29
	setx	0xc00274d00002d84, %g1, %r10
	.word 0x839a8000  ! 669: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf71c61a0  ! 670: LDDF_I	ldd	[%r17, 0x01a0], %f27
	.word 0xfa440000  ! 672: LDSW_R	ldsw	[%r16 + %r0], %r29
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf215a188  ! 678: LDUH_I	lduh	[%r22 + 0x0188], %r25
	mov	0, %r12
	.word 0xa1930000  ! 686: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf20ca0c0  ! 688: LDUB_I	ldub	[%r18 + 0x00c0], %r25
	.word 0xb3540000  ! 690: RDPR_GL	rdpr	%-, %r25
	.word 0xfe04a0b2  ! 691: LDUW_I	lduw	[%r18 + 0x00b2], %r31
	.word 0xf6052005  ! 699: LDUW_I	lduw	[%r20 + 0x0005], %r27
	.word 0xf8150000  ! 700: LDUH_R	lduh	[%r20 + %r0], %r28
	setx	0x139095cd00006f4a, %g1, %r10
	.word 0x819a8000  ! 702: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xc37e1a5800009842, %g1, %r10
	.word 0x819a8000  ! 712: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x839460df  ! 716: WRPR_TNPC_I	wrpr	%r17, 0x00df, %tnpc
	.word 0x8794e1f6  ! 719: WRPR_TT_I	wrpr	%r19, 0x01f6, %tt
	.word 0xf244e1b6  ! 721: LDSW_I	ldsw	[%r19 + 0x01b6], %r25
	.word 0xbd351000  ! 724: SRLX_R	srlx	%r20, %r0, %r30
	setx	0x3121f2f100005ed0, %g1, %r10
	.word 0x839a8000  ! 725: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf414610c  ! 733: LDUH_I	lduh	[%r17 + 0x010c], %r26
	.word 0xb72c6001  ! 735: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xb3510000  ! 736: RDPR_TICK	<illegal instruction>
	.word 0xfc4dc000  ! 737: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0x9194a0a0  ! 740: WRPR_PIL_I	wrpr	%r18, 0x00a0, %pil
	.word 0xbe8c8000  ! 746: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xf014607e  ! 748: LDUH_I	lduh	[%r17 + 0x007e], %r24
	.word 0xf0148000  ! 751: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0x9195e111  ! 752: WRPR_PIL_I	wrpr	%r23, 0x0111, %pil
	.word 0xbb500000  ! 756: RDPR_TPC	<illegal instruction>
	setx	data_start_2, %g1, %r18
	.word 0xfb1c4000  ! 761: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0x8d952125  ! 762: WRPR_PSTATE_I	wrpr	%r20, 0x0125, %pstate
	.word 0xbe244000  ! 768: SUB_R	sub 	%r17, %r0, %r31
	.word 0xf2458000  ! 771: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xbcb58000  ! 774: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xf60c0000  ! 775: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0x8594e1fd  ! 778: WRPR_TSTATE_I	wrpr	%r19, 0x01fd, %tstate
	.word 0xfc4c0000  ! 780: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xb28de1ba  ! 784: ANDcc_I	andcc 	%r23, 0x01ba, %r25
	.word 0x9194a1e8  ! 785: WRPR_PIL_I	wrpr	%r18, 0x01e8, %pil
	.word 0xf80c0000  ! 786: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf04ca125  ! 788: LDSB_I	ldsb	[%r18 + 0x0125], %r24
	.word 0xb034a07f  ! 789: ORN_I	orn 	%r18, 0x007f, %r24
	mov	1, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb6356166  ! 791: ORN_I	orn 	%r21, 0x0166, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd510000  ! 794: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 795: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x98771a0100008ecd, %g1, %r10
	.word 0x819a8000  ! 800: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfe4c4000  ! 802: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xb551c000  ! 803: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xf444e12f  ! 812: LDSW_I	ldsw	[%r19 + 0x012f], %r26
	.word 0xbe450000  ! 815: ADDC_R	addc 	%r20, %r0, %r31
	.word 0xf645a08d  ! 817: LDSW_I	ldsw	[%r22 + 0x008d], %r27
	.word 0xf4040000  ! 819: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xf6040000  ! 822: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf405c000  ! 825: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf444a155  ! 827: LDSW_I	ldsw	[%r18 + 0x0155], %r26
	.word 0xf84461c4  ! 829: LDSW_I	ldsw	[%r17 + 0x01c4], %r28
	.word 0xbd518000  ! 831: RDPR_PSTATE	<illegal instruction>
	.word 0xf044e06d  ! 834: LDSW_I	ldsw	[%r19 + 0x006d], %r24
	.word 0xf015e165  ! 840: LDUH_I	lduh	[%r23 + 0x0165], %r24
	.word 0xb351c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xf11d21c4  ! 848: LDDF_I	ldd	[%r20, 0x01c4], %f24
	.word 0x919561a8  ! 851: WRPR_PIL_I	wrpr	%r21, 0x01a8, %pil
	.word 0xf84ca1f4  ! 853: LDSB_I	ldsb	[%r18 + 0x01f4], %r28
	.word 0xfe0da04e  ! 854: LDUB_I	ldub	[%r22 + 0x004e], %r31
	.word 0xbf51c000  ! 855: RDPR_TL	<illegal instruction>
	.word 0xb2c4a109  ! 857: ADDCcc_I	addccc 	%r18, 0x0109, %r25
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0xba1d61a3  ! 868: XOR_I	xor 	%r21, 0x01a3, %r29
	.word 0x8794215f  ! 869: WRPR_TT_I	wrpr	%r16, 0x015f, %tt
	.word 0xb5510000  ! 872: RDPR_TICK	<illegal instruction>
	.word 0xfe14e0a6  ! 875: LDUH_I	lduh	[%r19 + 0x00a6], %r31
	.word 0xf24dc000  ! 876: LDSB_R	ldsb	[%r23 + %r0], %r25
	setx	0xec271fd70000aed2, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc454000  ! 881: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf31c8000  ! 883: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xf4152099  ! 884: LDUH_I	lduh	[%r20 + 0x0099], %r26
	.word 0xfa5ce02d  ! 886: LDX_I	ldx	[%r19 + 0x002d], %r29
	.word 0xb150c000  ! 888: RDPR_TT	<illegal instruction>
	.word 0xf71c4000  ! 890: LDDF_R	ldd	[%r17, %r0], %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf44d8000  ! 895: LDSB_R	ldsb	[%r22 + %r0], %r26
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a07a  ! 900: WRPR_TNPC_I	wrpr	%r18, 0x007a, %tnpc
	.word 0xfc550000  ! 903: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xbf518000  ! 904: RDPR_PSTATE	<illegal instruction>
	.word 0xf61ca18c  ! 905: LDD_I	ldd	[%r18 + 0x018c], %r27
	.word 0xf6444000  ! 906: LDSW_R	ldsw	[%r17 + %r0], %r27
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d6004  ! 909: LDX_I	ldx	[%r21 + 0x0004], %r30
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08c6087  ! 912: ANDcc_I	andcc 	%r17, 0x0087, %r24
	.word 0xfa5c0000  ! 915: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xbc3d6053  ! 922: XNOR_I	xnor 	%r21, 0x0053, %r30
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014201c  ! 926: LDUH_I	lduh	[%r16 + 0x001c], %r24
	.word 0x89946039  ! 929: WRPR_TICK_I	wrpr	%r17, 0x0039, %tick
	.word 0xbaa58000  ! 937: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xf85d6144  ! 938: LDX_I	ldx	[%r21 + 0x0144], %r28
	.word 0xfa15601c  ! 940: LDUH_I	lduh	[%r21 + 0x001c], %r29
	.word 0xfe150000  ! 943: LDUH_R	lduh	[%r20 + %r0], %r31
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4dc000  ! 946: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xff1de17e  ! 951: LDDF_I	ldd	[%r23, 0x017e], %f31
	.word 0xf20461d0  ! 952: LDUW_I	lduw	[%r17 + 0x01d0], %r25
	.word 0xf6150000  ! 955: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xb13d8000  ! 957: SRA_R	sra 	%r22, %r0, %r24
	.word 0xfe45e0a4  ! 958: LDSW_I	ldsw	[%r23 + 0x00a4], %r31
	.word 0xff1ce01d  ! 964: LDDF_I	ldd	[%r19, 0x001d], %f31
	.word 0xf71c4000  ! 965: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0x81946091  ! 966: WRPR_TPC_I	wrpr	%r17, 0x0091, %tpc
	.word 0xf4052136  ! 968: LDUW_I	lduw	[%r20 + 0x0136], %r26
	.word 0x8994206a  ! 970: WRPR_TICK_I	wrpr	%r16, 0x006a, %tick
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51c4000  ! 975: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfe1d6113  ! 976: LDD_I	ldd	[%r21 + 0x0113], %r31
	.word 0xbd50c000  ! 979: RDPR_TT	<illegal instruction>
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a1df  ! 982: WRPR_TNPC_I	wrpr	%r22, 0x01df, %tnpc
	.word 0xbe04a1cc  ! 985: ADD_I	add 	%r18, 0x01cc, %r31
	.word 0xf0158000  ! 986: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf615c000  ! 988: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xff1de11d  ! 989: LDDF_I	ldd	[%r23, 0x011d], %f31
	.word 0xbf518000  ! 990: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xbb50c000  ! 991: RDPR_TT	<illegal instruction>
	.word 0xfc0c6115  ! 993: LDUB_I	ldub	[%r17 + 0x0115], %r30
	.word 0x83952150  ! 995: WRPR_TNPC_I	wrpr	%r20, 0x0150, %tnpc
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfab0820  ! 10: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a549e0  ! 11: FDIVq	dis not found

	.word 0xb7a548a0  ! 12: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xbda88820  ! 13: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb01c4000  ! 14: XOR_R	xor 	%r17, %r0, %r24
	.word 0xb7a58940  ! 16: FMULd	fmuld	%f22, %f0, %f58
	.word 0xb7504000  ! 18: RDPR_TNPC	<illegal instruction>
	.word 0x839560fd  ! 19: WRPR_TNPC_I	wrpr	%r21, 0x00fd, %tnpc
	setx	data_start_3, %g1, %r18
	setx	0xfc2018290000ea53, %g1, %r10
	.word 0x839a8000  ! 24: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6c5a04c  ! 34: ADDCcc_I	addccc 	%r22, 0x004c, %r27
	.word 0xb7a00040  ! 36: FMOVd	fmovd	%f0, %f58
	mov	2, %r12
	.word 0x8f930000  ! 38: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x87952031  ! 41: WRPR_TT_I	wrpr	%r20, 0x0031, %tt
	.word 0xb1a00520  ! 43: FSQRTs	fsqrt	
	.word 0xb7a58960  ! 45: FMULq	dis not found

	.word 0xb7508000  ! 46: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 48: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x819461ba  ! 50: WRPR_TPC_I	wrpr	%r17, 0x01ba, %tpc
	.word 0xb9a588e0  ! 54: FSUBq	dis not found

	.word 0xb7ab0820  ! 55: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbda58940  ! 60: FMULd	fmuld	%f22, %f0, %f30
	.word 0xbfa408a0  ! 67: FSUBs	fsubs	%f16, %f0, %f31
	.word 0x8995a18d  ! 69: WRPR_TICK_I	wrpr	%r22, 0x018d, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00520  ! 74: FSQRTs	fsqrt	
	.word 0xbd510000  ! 75: RDPR_TICK	<illegal instruction>
	.word 0xba8d4000  ! 76: ANDcc_R	andcc 	%r21, %r0, %r29
	.word 0xbbab8820  ! 78: FMOVPOS	fmovs	%fcc1, %f0, %f29
	mov	2, %r12
	.word 0xa1930000  ! 79: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8394a1c6  ! 80: WRPR_TNPC_I	wrpr	%r18, 0x01c6, %tnpc
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 85: FMOVRLZ	dis not found

	.word 0xb4acc000  ! 86: ANDNcc_R	andncc 	%r19, %r0, %r26
	setx	0xac456dce00000d53, %g1, %r10
	.word 0x819a8000  ! 91: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195e121  ! 94: WRPR_TPC_I	wrpr	%r23, 0x0121, %tpc
	.word 0xb7a5c820  ! 96: FADDs	fadds	%f23, %f0, %f27
	.word 0xb3a489e0  ! 97: FDIVq	dis not found

	.word 0xb3a88820  ! 98: FMOVLE	fmovs	%fcc1, %f0, %f25
	setx	0x505fcb030000385d, %g1, %r10
	.word 0x819a8000  ! 99: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbaa4820  ! 109: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbda408c0  ! 110: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb1500000  ! 112: RDPR_TPC	<illegal instruction>
	.word 0x8d9460e1  ! 114: WRPR_PSTATE_I	wrpr	%r17, 0x00e1, %pstate
	.word 0xb3a448e0  ! 116: FSUBq	dis not found

	.word 0xb5a80c20  ! 122: FMOVRLZ	dis not found

	.word 0xb48d2160  ! 125: ANDcc_I	andcc 	%r20, 0x0160, %r26
	.word 0xbda88820  ! 126: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9aac820  ! 127: FMOVGE	fmovs	%fcc1, %f0, %f28
	setx	0x38fbd59900009b5f, %g1, %r10
	.word 0x819a8000  ! 132: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbaac820  ! 134: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbba489e0  ! 139: FDIVq	dis not found

	.word 0xb1ab0820  ! 142: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbda00520  ! 146: FSQRTs	fsqrt	
	.word 0x919561cd  ! 152: WRPR_PIL_I	wrpr	%r21, 0x01cd, %pil
	.word 0x919560d1  ! 155: WRPR_PIL_I	wrpr	%r21, 0x00d1, %pil
	.word 0xb7a00540  ! 156: FSQRTd	fsqrt	
	.word 0xb3a58920  ! 157: FMULs	fmuls	%f22, %f0, %f25
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 161: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00560  ! 162: FSQRTq	fsqrt	
	.word 0xbda98820  ! 165: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00020  ! 167: FMOVs	fmovs	%f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 168: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00560  ! 172: FSQRTq	fsqrt	
	.word 0xb5a508a0  ! 179: FSUBs	fsubs	%f20, %f0, %f26
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 181: FMOVCS	fmovs	%fcc1, %f0, %f30
	setx	0x859930eb00009848, %g1, %r10
	.word 0x819a8000  ! 182: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd520000  ! 183: RDPR_PIL	<illegal instruction>
	.word 0xbda48960  ! 184: FMULq	dis not found

	.word 0xb1a80820  ! 185: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb351c000  ! 186: RDPR_TL	<illegal instruction>
	.word 0xbda81c20  ! 191: FMOVRGEZ	dis not found

	setx	0xe86cf2b50000ecd5, %g1, %r10
	.word 0x839a8000  ! 201: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5abc820  ! 202: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81c20  ! 203: FMOVRGEZ	dis not found

	.word 0xbb520000  ! 205: RDPR_PIL	<illegal instruction>
	.word 0xbda00020  ! 212: FMOVs	fmovs	%f0, %f30
	.word 0xb9a90820  ! 215: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa4820  ! 220: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbd50c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8d9420a7  ! 222: WRPR_PSTATE_I	wrpr	%r16, 0x00a7, %pstate
	mov	1, %r12
	.word 0xa1930000  ! 224: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a80820  ! 228: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbd357001  ! 229: SRLX_I	srlx	%r21, 0x0001, %r30
	.word 0xb7a00520  ! 235: FSQRTs	fsqrt	
	.word 0xb9a9c820  ! 237: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbda409a0  ! 238: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbba80820  ! 239: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a588c0  ! 241: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb1a4c820  ! 242: FADDs	fadds	%f19, %f0, %f24
	.word 0xb3a94820  ! 246: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0x8d94a00a  ! 247: WRPR_PSTATE_I	wrpr	%r18, 0x000a, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda9c820  ! 250: FMOVVS	fmovs	%fcc1, %f0, %f30
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85952115  ! 255: WRPR_TSTATE_I	wrpr	%r20, 0x0115, %tstate
	.word 0xb7a88820  ! 256: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbf480000  ! 259: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 269: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 280: RDPR_GL	<illegal instruction>
	.word 0xb5a80c20  ! 281: FMOVRLZ	dis not found

	.word 0xbba84820  ! 287: FMOVE	fmovs	%fcc1, %f0, %f29
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a94820  ! 295: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a488a0  ! 298: FSUBs	fsubs	%f18, %f0, %f28
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40860  ! 300: FADDq	dis not found

	.word 0xbebca06b  ! 301: XNORcc_I	xnorcc 	%r18, 0x006b, %r31
	.word 0xbfa488a0  ! 302: FSUBs	fsubs	%f18, %f0, %f31
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	setx	0x86d6d0fd00004ccc, %g1, %r10
	.word 0x819a8000  ! 306: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x8d83aa0a00005911, %g1, %r10
	.word 0x839a8000  ! 308: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a00040  ! 309: FMOVd	fmovd	%f0, %f58
	.word 0xb4246030  ! 311: SUB_I	sub 	%r17, 0x0030, %r26
	.word 0xb7a90820  ! 312: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab4820  ! 313: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a408c0  ! 314: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xbdabc820  ! 323: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba50840  ! 324: FADDd	faddd	%f20, %f0, %f60
	.word 0xbe8de0e4  ! 326: ANDcc_I	andcc 	%r23, 0x00e4, %r31
	mov	1, %r12
	.word 0x8f930000  ! 329: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xb224c000  ! 336: SUB_R	sub 	%r19, %r0, %r25
	.word 0xb0a4c000  ! 339: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xbfa80420  ! 345: FMOVRZ	dis not found

	.word 0xb5508000  ! 346: RDPR_TSTATE	<illegal instruction>
	.word 0xbda409c0  ! 354: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xbba44960  ! 356: FMULq	dis not found

	.word 0xb7a58940  ! 360: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbda449a0  ! 365: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xbfa80c20  ! 370: FMOVRLZ	dis not found

	.word 0xb29d6001  ! 373: XORcc_I	xorcc 	%r21, 0x0001, %r25
	.word 0xb3aac820  ! 376: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda54860  ! 381: FADDq	dis not found

	.word 0xb9a8c820  ! 384: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9510000  ! 389: RDPR_TICK	<illegal instruction>
	.word 0xbba81820  ! 391: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 392: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a8c820  ! 393: FMOVL	fmovs	%fcc1, %f0, %f27
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d61eb  ! 395: XNOR_I	xnor 	%r21, 0x01eb, %r25
	.word 0xb40560e3  ! 396: ADD_I	add 	%r21, 0x00e3, %r26
	.word 0xb1a81820  ! 398: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a50920  ! 400: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb53de001  ! 401: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xb7aac820  ! 402: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aac820  ! 403: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80c20  ! 407: FMOVRLZ	dis not found

	.word 0xb3a81c20  ! 408: FMOVRGEZ	dis not found

	.word 0xb9aa0820  ! 409: FMOVA	fmovs	%fcc1, %f0, %f28
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e155  ! 416: WRPR_PSTATE_I	wrpr	%r19, 0x0155, %pstate
	.word 0xbf540000  ! 417: RDPR_GL	<illegal instruction>
	.word 0xbd50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0xb9a80820  ! 428: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbe45606c  ! 433: ADDC_I	addc 	%r21, 0x006c, %r31
	.word 0xbf508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 437: RDPR_TPC	<illegal instruction>
	.word 0xbbabc820  ! 442: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb84520d2  ! 445: ADDC_I	addc 	%r20, 0x00d2, %r28
	.word 0xb7a54820  ! 446: FADDs	fadds	%f21, %f0, %f27
	.word 0xb9a00560  ! 447: FSQRTq	fsqrt	
	.word 0xb3a488a0  ! 456: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xbba409e0  ! 457: FDIVq	dis not found

	mov	0x22f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 466: RDPR_GL	<illegal instruction>
	.word 0x9194612b  ! 468: WRPR_PIL_I	wrpr	%r17, 0x012b, %pil
	mov	1, %r12
	.word 0xa1930000  ! 469: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x6af5380800000884, %g1, %r10
	.word 0x839a8000  ! 473: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda449e0  ! 474: FDIVq	dis not found

	.word 0xb3a48940  ! 476: FMULd	fmuld	%f18, %f0, %f56
	.word 0xb3a5c820  ! 481: FADDs	fadds	%f23, %f0, %f25
	.word 0xbfa48820  ! 482: FADDs	fadds	%f18, %f0, %f31
	.word 0xbfa509e0  ! 483: FDIVq	dis not found

	setx	data_start_3, %g1, %r19
	.word 0xb7a81420  ! 489: FMOVRNZ	dis not found

	.word 0xbdab4820  ! 490: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a549e0  ! 492: FDIVq	dis not found

	.word 0xb9a00040  ! 493: FMOVd	fmovd	%f0, %f28
	.word 0xb7a80420  ! 496: FMOVRZ	dis not found

	.word 0xbda4c820  ! 497: FADDs	fadds	%f19, %f0, %f30
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 502: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a44940  ! 509: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb2942019  ! 510: ORcc_I	orcc 	%r16, 0x0019, %r25
	.word 0xbfa509e0  ! 511: FDIVq	dis not found

	.word 0xb1a44840  ! 519: FADDd	faddd	%f48, %f0, %f24
	.word 0xb1aa4820  ! 521: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x8d95e065  ! 522: WRPR_PSTATE_I	wrpr	%r23, 0x0065, %pstate
	.word 0xb3abc820  ! 524: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 528: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r21
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 533: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xb7a00020  ! 534: FMOVs	fmovs	%f0, %f27
	.word 0xb3a81420  ! 536: FMOVRNZ	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 537: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a50960  ! 539: FMULq	dis not found

	.word 0xb9510000  ! 541: RDPR_TICK	<illegal instruction>
	.word 0x8794a0fe  ! 542: WRPR_TT_I	wrpr	%r18, 0x00fe, %tt
	.word 0xb0ad0000  ! 543: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb5540000  ! 548: RDPR_GL	<illegal instruction>
	.word 0xb9a54960  ! 550: FMULq	dis not found

	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 556: FSQRTd	fsqrt	
	.word 0xb9a5c860  ! 557: FADDq	dis not found

	.word 0xbd50c000  ! 562: RDPR_TT	<illegal instruction>
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a054  ! 567: WRPR_TICK_I	wrpr	%r22, 0x0054, %tick
	.word 0xb7a81420  ! 570: FMOVRNZ	dis not found

	.word 0xbb508000  ! 573: RDPR_TSTATE	<illegal instruction>
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 576: FMOVRLZ	dis not found

	.word 0xb7504000  ! 580: RDPR_TNPC	<illegal instruction>
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58820  ! 584: FADDs	fadds	%f22, %f0, %f30
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40960  ! 587: FMULq	dis not found

	.word 0x8194a1c1  ! 591: WRPR_TPC_I	wrpr	%r18, 0x01c1, %tpc
	.word 0xb7ab4820  ! 592: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a9c820  ! 595: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0x8d94212a  ! 600: WRPR_PSTATE_I	wrpr	%r16, 0x012a, %pstate
	.word 0xb1540000  ! 602: RDPR_GL	<illegal instruction>
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 609: FMOVRNZ	dis not found

	.word 0xb1508000  ! 610: RDPR_TSTATE	<illegal instruction>
	.word 0xb3ab8820  ! 612: FMOVPOS	fmovs	%fcc1, %f0, %f25
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919560ab  ! 616: WRPR_PIL_I	wrpr	%r21, 0x00ab, %pil
	.word 0xbfa80820  ! 621: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9a549e0  ! 623: FDIVq	dis not found

	setx	data_start_0, %g1, %r18
	.word 0xbb480000  ! 628: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb5a509c0  ! 631: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xb3a9c820  ! 632: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb0b48000  ! 636: ORNcc_R	orncc 	%r18, %r0, %r24
	.word 0xb7510000  ! 638: RDPR_TICK	<illegal instruction>
	.word 0xbda489a0  ! 639: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xb7a80820  ! 640: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00520  ! 641: FSQRTs	fsqrt	
	mov	1, %r12
	.word 0x8f930000  ! 646: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba00040  ! 647: FMOVd	fmovd	%f0, %f60
	.word 0xb295e160  ! 648: ORcc_I	orcc 	%r23, 0x0160, %r25
	.word 0xb3510000  ! 651: RDPR_TICK	<illegal instruction>
	.word 0xb5aa4820  ! 663: FMOVNE	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0xa1930000  ! 665: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x7fa7ea8500005a95, %g1, %r10
	.word 0x839a8000  ! 669: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a84820  ! 671: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa8c820  ! 674: FMOVL	fmovs	%fcc1, %f0, %f31
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 679: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 680: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80820  ! 681: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c820  ! 683: FADDs	fadds	%f19, %f0, %f27
	.word 0xbdaa0820  ! 684: FMOVA	fmovs	%fcc1, %f0, %f30
	mov	0, %r12
	.word 0xa1930000  ! 686: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5540000  ! 690: RDPR_GL	<illegal instruction>
	.word 0xb3a88820  ! 692: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbdab4820  ! 693: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbda409a0  ! 696: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbfa50840  ! 701: FADDd	faddd	%f20, %f0, %f62
	setx	0x786fae6200001941, %g1, %r10
	.word 0x819a8000  ! 702: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa94820  ! 703: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00520  ! 704: FSQRTs	fsqrt	
	.word 0xb5a50940  ! 706: FMULd	fmuld	%f20, %f0, %f26
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a84820  ! 711: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x110989fe0000fdd7, %g1, %r10
	.word 0x819a8000  ! 712: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a5c9c0  ! 714: FDIVd	fdivd	%f54, %f0, %f24
	.word 0x8394e07a  ! 716: WRPR_TNPC_I	wrpr	%r19, 0x007a, %tnpc
	.word 0xb7ab8820  ! 718: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0x8795e1f6  ! 719: WRPR_TT_I	wrpr	%r23, 0x01f6, %tt
	.word 0xb9a00020  ! 723: FMOVs	fmovs	%f0, %f28
	.word 0xb3359000  ! 724: SRLX_R	srlx	%r22, %r0, %r25
	setx	0x77009c740000ce09, %g1, %r10
	.word 0x839a8000  ! 725: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a90820  ! 728: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbba5c920  ! 734: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb52ce001  ! 735: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb9510000  ! 736: RDPR_TICK	<illegal instruction>
	.word 0x91942096  ! 740: WRPR_PIL_I	wrpr	%r16, 0x0096, %pil
	.word 0xbbaa8820  ! 741: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81820  ! 742: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbe8c8000  ! 746: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xbda80c20  ! 750: FMOVRLZ	dis not found

	.word 0x9194a00a  ! 752: WRPR_PIL_I	wrpr	%r18, 0x000a, %pil
	.word 0xb1500000  ! 756: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0x8d95a0d3  ! 762: WRPR_PSTATE_I	wrpr	%r22, 0x00d3, %pstate
	.word 0xb5a00560  ! 765: FSQRTq	fsqrt	
	.word 0xb5a509e0  ! 766: FDIVq	dis not found

	.word 0xb824c000  ! 768: SUB_R	sub 	%r19, %r0, %r28
	.word 0xbda84820  ! 772: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 773: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbcb58000  ! 774: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xbfa4c960  ! 776: FMULq	dis not found

	.word 0xb1a80c20  ! 777: FMOVRLZ	dis not found

	.word 0x8594a19f  ! 778: WRPR_TSTATE_I	wrpr	%r18, 0x019f, %tstate
	.word 0xb28d61d6  ! 784: ANDcc_I	andcc 	%r21, 0x01d6, %r25
	.word 0x91942012  ! 785: WRPR_PIL_I	wrpr	%r16, 0x0012, %pil
	.word 0xbe35211d  ! 789: ORN_I	orn 	%r20, 0x011d, %r31
	mov	2, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xba35e167  ! 791: ORN_I	orn 	%r23, 0x0167, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7510000  ! 794: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 795: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x2136faa30000fc94, %g1, %r10
	.word 0x819a8000  ! 800: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb751c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xbda549c0  ! 804: FDIVd	fdivd	%f52, %f0, %f30
	setx	data_start_0, %g1, %r21
	.word 0xbda58860  ! 808: FADDq	dis not found

	.word 0xb1a90820  ! 810: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa54960  ! 811: FMULq	dis not found

	.word 0xbe448000  ! 815: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xb9aa0820  ! 816: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab0820  ! 818: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbfab0820  ! 823: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a90820  ! 824: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a589a0  ! 830: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbd518000  ! 831: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a81420  ! 841: FMOVRNZ	dis not found

	.word 0xb7a448c0  ! 843: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb7a88820  ! 844: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb151c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xb1a81420  ! 850: FMOVRNZ	dis not found

	.word 0x919520f7  ! 851: WRPR_PIL_I	wrpr	%r20, 0x00f7, %pil
	.word 0xb751c000  ! 855: RDPR_TL	<illegal instruction>
	.word 0xb2c46065  ! 857: ADDCcc_I	addccc 	%r17, 0x0065, %r25
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 859: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00540  ! 860: FSQRTd	fsqrt	
	.word 0xb1ab0820  ! 866: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbd50c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0xb81da10e  ! 868: XOR_I	xor 	%r22, 0x010e, %r28
	.word 0x87942110  ! 869: WRPR_TT_I	wrpr	%r16, 0x0110, %tt
	.word 0xbda4c8a0  ! 871: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb7510000  ! 872: RDPR_TICK	<illegal instruction>
	.word 0xb3a81820  ! 874: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	0x5d35ae6000008b18, %g1, %r10
	.word 0x819a8000  ! 878: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 888: RDPR_TT	<illegal instruction>
	.word 0xbbaa0820  ! 889: FMOVA	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a54860  ! 897: FADDq	dis not found

	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839461f2  ! 900: WRPR_TNPC_I	wrpr	%r17, 0x01f2, %tnpc
	.word 0xb1518000  ! 904: RDPR_PSTATE	<illegal instruction>
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c840  ! 908: FADDd	faddd	%f50, %f0, %f58
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c60df  ! 912: ANDcc_I	andcc 	%r17, 0x00df, %r29
	.word 0xb9a80820  ! 921: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb23da0f8  ! 922: XNOR_I	xnor 	%r22, 0x00f8, %r25
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 927: FSQRTq	fsqrt	
	.word 0x89946177  ! 929: WRPR_TICK_I	wrpr	%r17, 0x0177, %tick
	.word 0xbba94820  ! 934: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbca44000  ! 937: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xbba548a0  ! 941: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb3a81c20  ! 944: FMOVRGEZ	dis not found

	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58920  ! 954: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb7a50920  ! 956: FMULs	fmuls	%f20, %f0, %f27
	.word 0xb93cc000  ! 957: SRA_R	sra 	%r19, %r0, %r28
	.word 0xb3a80820  ! 961: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c9c0  ! 962: FDIVd	fdivd	%f54, %f0, %f60
	.word 0x819421e3  ! 966: WRPR_TPC_I	wrpr	%r16, 0x01e3, %tpc
	.word 0xb3a00560  ! 969: FSQRTq	fsqrt	
	.word 0x89952196  ! 970: WRPR_TICK_I	wrpr	%r20, 0x0196, %tick
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 979: RDPR_TT	<illegal instruction>
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e18c  ! 982: WRPR_TNPC_I	wrpr	%r19, 0x018c, %tnpc
	.word 0xb5a00040  ! 983: FMOVd	fmovd	%f0, %f26
	.word 0xbe05218f  ! 985: ADD_I	add 	%r20, 0x018f, %r31
	.word 0xb5518000  ! 990: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xbd50c000  ! 991: RDPR_TT	<illegal instruction>
	.word 0xb1a00520  ! 992: FSQRTs	fsqrt	
	.word 0x8395e0a1  ! 995: WRPR_TNPC_I	wrpr	%r23, 0x00a1, %tnpc
	.word 0xb7a00560  ! 996: FSQRTq	fsqrt	
	.word 0xbdaac820  ! 997: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48960  ! 998: FMULq	dis not found


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

	.xword	0xcb2185bddf25d615
	.xword	0x75657a63f06979cc
	.xword	0x0bd66e7ab1daf2cb
	.xword	0x60cc218abfbb0b01
	.xword	0xa55a113b17db6f0d
	.xword	0xba57324baa937ebf
	.xword	0xbf2ede7329eec915
	.xword	0x609ed22d2a7ec1c8
	.xword	0x3044a12fd1b07d7c
	.xword	0xc049836fe7494e0d
	.xword	0x47376dbf9b8a1560
	.xword	0x47f36c527a17aceb
	.xword	0x10c944ef4291c449
	.xword	0x2b27e8b59aa07777
	.xword	0x77c783f0689f9b6a
	.xword	0x992adcea9ab1aeae
	.xword	0x44ed2f968d395857
	.xword	0x28adee87321defbf
	.xword	0xfe333cd44d9f2eb6
	.xword	0xcf48c887ab52b71c
	.xword	0x7e4da55915d0725b
	.xword	0x3bda2ee00187ee17
	.xword	0xb98bb92c58d34c62
	.xword	0x78f040ae22cfb94f
	.xword	0x470fb2ae3dfdb9b5
	.xword	0xdef9b167003e3541
	.xword	0xa4c625fb3e3e6654
	.xword	0x108183d08c894fa8
	.xword	0xc02cdc4120bc125b
	.xword	0x3beb32920ccae391
	.xword	0x18a09a9d07a7ed7c
	.xword	0xa4e5e0a6f61ba9c0
	.xword	0x0ad44f9d7187468f
	.xword	0x86fcad65ab2e7fbf
	.xword	0x8ffe2b0220bfae05
	.xword	0x8870a4b63766d175
	.xword	0xb893ea71062f8e9c
	.xword	0x991e445a5d1434b3
	.xword	0x88f71429b006e7f0
	.xword	0xb977f7fccdf8dde2
	.xword	0xee43fd04bc147d82
	.xword	0x064849a509493245
	.xword	0xe146b4f157dcc1b0
	.xword	0xf2d2d6de28ee3f28
	.xword	0x5560a567ce7fdf77
	.xword	0xfd0947ecc3c6c9c8
	.xword	0x2bbb944f0862c006
	.xword	0x47338e5856e50241
	.xword	0x7c75f28abf80fd44
	.xword	0xa153dd103ab052de
	.xword	0x3fbeec2cfb47902d
	.xword	0xffddd7d3cc2f4848
	.xword	0x49b0fec7eb61e90d
	.xword	0x148e8e97a1b6273b
	.xword	0x335d51de1b33988d
	.xword	0x4c625a589b4a8d35
	.xword	0x3ba9aeae4d0a6216
	.xword	0xe28ae96177b8ca29
	.xword	0x5f113a2345d648bf
	.xword	0xb3a99baf33f0d833
	.xword	0x9abe87f0687ece25
	.xword	0x3f070b9b6e68e4ef
	.xword	0x65df337d35c5e4e5
	.xword	0x52c0bf856eb0876c
	.xword	0xd1344df5f5c0390e
	.xword	0x49a4ee9654e6a130
	.xword	0xc5aebddc929b9004
	.xword	0xf33da821fc1e8256
	.xword	0x2930ddc4f0495d28
	.xword	0xab3f4aa77cd812ca
	.xword	0x31abf6793b1a7b15
	.xword	0xc4b7d12c983b9435
	.xword	0x9a27a73dd5efad90
	.xword	0x8db1e58278d173a9
	.xword	0x8ab2fd6c0d4a2454
	.xword	0x53957b0553b91dab
	.xword	0x79c23f9ade22e88c
	.xword	0x3d4ff3db0ded81f1
	.xword	0xd174e0954f2c8999
	.xword	0x1cd44fca1ebcd960
	.xword	0x59260ef27008b6d3
	.xword	0xcf0bb15c474633dd
	.xword	0x95edc30ed090b161
	.xword	0x663cf1a26493c72d
	.xword	0x66ed856d2fe32e9c
	.xword	0x4aa0bb0265b73359
	.xword	0x20f69b3f43d511fa
	.xword	0xeb4acafcc3e3cd3e
	.xword	0x760080546727ab28
	.xword	0xf1ffd3111a0ccd9d
	.xword	0xcad5464d102394aa
	.xword	0xe6d5fa63519d64a2
	.xword	0x2d005af3366be476
	.xword	0xb977b2c2b4d6c4c9
	.xword	0xf8edb807ba04cc54
	.xword	0x7d70f99f06475e58
	.xword	0xc4b064a2354be6a7
	.xword	0xd7124a39633b836a
	.xword	0x1e9c2586da159079
	.xword	0x74b53258958f8cf2
	.xword	0x56a1d96ab9734645
	.xword	0xf1526b6b013218c5
	.xword	0x159256f545dde725
	.xword	0xb7d49a0eeab71a9e
	.xword	0x8bb623ddb3815645
	.xword	0xbb1a367dacfebf4b
	.xword	0xfe1e33451776e735
	.xword	0xf80c097e242a4b73
	.xword	0x4c9aa42c202d6470
	.xword	0x4b316149a080abda
	.xword	0x637363cedca2289f
	.xword	0x629ba0d8ea1ccb8e
	.xword	0xdfce184dce59ff42
	.xword	0x14e453070aaabe78
	.xword	0xfa8de691a7025959
	.xword	0x3b694b54126659e5
	.xword	0x9196c84d23b565f8
	.xword	0xf5cf0dc127684343
	.xword	0xb9095d423d4b547f
	.xword	0xa04d5c64663f48a7
	.xword	0x82697396588f5cf3
	.xword	0xfa45b9e04524f2a8
	.xword	0xa8cde5cea1e5843e
	.xword	0x28a29264657020da
	.xword	0x676ae51b7b3c72fe
	.xword	0xc8a1d298dec773f0
	.xword	0xc2256765edb52d7a
	.xword	0xd1e4cd1227b683da
	.xword	0xc9bae3a904f759e5
	.xword	0x328a99f76437715a
	.xword	0x96d0455bb6500d14
	.xword	0x3d6c2a4a15b9df1d
	.xword	0xcd74a936908ccd05
	.xword	0xcb5c6267e3697842
	.xword	0x6da24d799c2b7947
	.xword	0xded378471804b5f5
	.xword	0xd0c66acd267fe087
	.xword	0x7609f10c4be3b0db
	.xword	0x6dc2653b8ca0c4ee
	.xword	0xa6c5da0d79f4a968
	.xword	0x2fd2291639d6734f
	.xword	0x6da7a5cfcbbde5e2
	.xword	0x6ffa648ec6a03ff1
	.xword	0xc129ec696993f8ae
	.xword	0x89f287172b61c1d3
	.xword	0x4d7443c5ed0800a1
	.xword	0xe9e8b5b73981080b
	.xword	0xc3e7e6b03ef5fcc3
	.xword	0x084ddd7d70954a56
	.xword	0x0ce789c73915102c
	.xword	0x6371b23942794e1f
	.xword	0x5a48c49adc12d6be
	.xword	0x5ce85aa6277339d6
	.xword	0x3e43da21fbb22d08
	.xword	0x754d366af1fc83ea
	.xword	0x3bba66a1eca02186
	.xword	0xf837721fd87fd1c7
	.xword	0xfcd34100657072b3
	.xword	0x6330e009d445cfd1
	.xword	0xfede03272dc3e03a
	.xword	0xe0e54ca0eeb981ab
	.xword	0x4c53752975ca30d4
	.xword	0x9ec7511564b59a67
	.xword	0xb41fca7cfcf906e4
	.xword	0x3ee962575521298b
	.xword	0x25b009384b95999d
	.xword	0x6a48f33de2e4e800
	.xword	0x02f02a04719487df
	.xword	0xdf57c1b02872e0e4
	.xword	0xd10bc2bed338fccc
	.xword	0x58d1d2edc3567310
	.xword	0x699d52b1aa6fb5fb
	.xword	0x19040a89fa9b5325
	.xword	0x47068185eb168644
	.xword	0xcf816a962f90d4e1
	.xword	0xb3dcf831230cd402
	.xword	0x2c430f7a775473ef
	.xword	0x1de1665343a478c0
	.xword	0x4643166f244793bb
	.xword	0x3c406852fc805eac
	.xword	0xd56a8379bf76dc0e
	.xword	0x10d9300e12517db3
	.xword	0x07976c2af3b45b98
	.xword	0xa3fef2f88a1eae2c
	.xword	0x8373e82f3c51816f
	.xword	0xa3c7aa22fc05218e
	.xword	0xfc10c6806ad565cc
	.xword	0x9bdcf4bd7f0a38e2
	.xword	0x2285c7c4a9c5600b
	.xword	0x14a74984121e927b
	.xword	0x2856ed02999127ed
	.xword	0xe9c38760a9e703ff
	.xword	0x0d380f8a4b840914
	.xword	0xadf924fbc0810980
	.xword	0x5d707ae0a5e754b9
	.xword	0xa6f34eca2dafe93d
	.xword	0xbae9e60f07ec0614
	.xword	0x59e0feb386ccf791
	.xword	0x6f0f4c35e851c3ea
	.xword	0x8eddd8da120161ed
	.xword	0xe6ed994e9ec8bf0d
	.xword	0xdf2a21cb79ba11a0
	.xword	0x0a748bbc9fba6987
	.xword	0x53e9351927d91deb
	.xword	0xa9c2cfdd32058b36
	.xword	0xc18f1cbe1b2f6212
	.xword	0x95fec471ff1ee237
	.xword	0x5f43d2f9a5e41d8e
	.xword	0x75f6b8a4767d062c
	.xword	0x1edcc7a9d20cbfc6
	.xword	0x75c00c3ef17612d0
	.xword	0x2a6605cd39db4309
	.xword	0x0e5a3ea6bce352eb
	.xword	0x625bbe862b113c8e
	.xword	0x88bf1e2fcd9c513f
	.xword	0x7d3ebb491756bb4f
	.xword	0x6350f710361c5f65
	.xword	0xa36b44d55569e799
	.xword	0x448ef738ca58a7bb
	.xword	0x163d725f5bbc4a9b
	.xword	0x17b8fc8ffd27d822
	.xword	0x2ac92dd8c430a5b5
	.xword	0xa96a2d70154cd5f6
	.xword	0x541dc3c9e832a66c
	.xword	0xc8bbcd1b85c156ad
	.xword	0xfef1777658225c60
	.xword	0x612a298d36297b6e
	.xword	0x4ddafdde14682014
	.xword	0x5cc415daebb2c0ea
	.xword	0x0a8cb8fb71a0e835
	.xword	0xf9e24bc237dcba3e
	.xword	0xb3e350d1de5dd93c
	.xword	0x27700106a45247ee
	.xword	0x1b7388ad7d82417b
	.xword	0xed12bdefb6f5fe16
	.xword	0x4ee970c75d803730
	.xword	0x6ce2a51e72f4f180
	.xword	0xdefc4d98334d9671
	.xword	0x765ee57f506972f3
	.xword	0x27aade7d288b4ad9
	.xword	0xc5472653b2f20f5d
	.xword	0x20c4ea1dca9df07b
	.xword	0x43da2aa7226b0adf
	.xword	0x101c72b51ea6ff3b
	.xword	0xc324c999badeb594
	.xword	0xd1f45aecd063a78d
	.xword	0x92b654ed386b10a5
	.xword	0x26d2e13af7bade68
	.xword	0x312d5ddf7649e36f
	.xword	0xac859913d061ae37
	.xword	0xcd46061c5014af48
	.xword	0x1ba96ee326260e71
	.xword	0x9624faf245c6e7ba
	.xword	0xdb4f8a5625d434ef
	.xword	0xf8340092f29102c3
	.xword	0x8ae5e28f823e5000
	.align 0x2000
	.data
data_start_1:

	.xword	0x0b0c634569c38529
	.xword	0x05a6fa796aabe819
	.xword	0x157c0f3e6dfe5375
	.xword	0x56a0968b476aeff9
	.xword	0x052d45aafb9c6e1a
	.xword	0x5f66371969c498ac
	.xword	0xb262984f5f1c4c83
	.xword	0xbf866a28d849e549
	.xword	0x8f92d5230d11eec2
	.xword	0xadf1540f1e01537f
	.xword	0xeca396f328ee83a1
	.xword	0x6d7b7a35992fa4ff
	.xword	0xd2af86b4607dba6e
	.xword	0x5acc41d9f6a3eda2
	.xword	0xad52b41c30833328
	.xword	0xd2faaa4154943cc9
	.xword	0xa40f23460b629978
	.xword	0x38456455462cfa22
	.xword	0x6d672ced0dea9172
	.xword	0x6aa91057200ccedc
	.xword	0x418934b4022c3b5c
	.xword	0x8a732f6ec95d62c3
	.xword	0xe1569a3fdd659bb5
	.xword	0x048c366a2017b32e
	.xword	0x58f75653631dd765
	.xword	0x2ff61dbbf5d5e961
	.xword	0x67f864c45c2e8e2a
	.xword	0x248ef8d9a84f0a69
	.xword	0xba9460b323153f81
	.xword	0x4ad559a58fd8381c
	.xword	0x67691e3d09160223
	.xword	0xb9f9ab71fbacc6b6
	.xword	0xf467e8a37f4e5384
	.xword	0x3ad934dbefb29c1e
	.xword	0xbfe9a43f4a4aff2d
	.xword	0x3a628e727b5a974b
	.xword	0x07454b632f674478
	.xword	0x6085c55f724aea11
	.xword	0xafb781a710cd0525
	.xword	0xa4da0039aba82be5
	.xword	0x494b235e7f3634cd
	.xword	0x3e4aaf210becd671
	.xword	0x499baff9a58658c1
	.xword	0x796766ec91ccc46b
	.xword	0x004be30b3bdf9268
	.xword	0x79396a3c7df5115f
	.xword	0x4fd418f8812742e7
	.xword	0x5090a5d8ed8375b5
	.xword	0x44947c9a8b8987d2
	.xword	0x725b3817426def5a
	.xword	0xc2f8487ba23f19e8
	.xword	0x7c5dd5a4d74419a8
	.xword	0x032f7b39cda2b154
	.xword	0xaff912af4ece952a
	.xword	0xac2d621afc46ed7a
	.xword	0x0d7d8857366afb83
	.xword	0x18eb15e88e708863
	.xword	0xc400c9f265cd9085
	.xword	0x7fe66418d6b44edf
	.xword	0x492700e7fdf09b15
	.xword	0x35be1b6236db306e
	.xword	0xa687f3a474d2fe4b
	.xword	0xf0d22707ac66410c
	.xword	0xf77e0ae17676a0c3
	.xword	0x8554d48fe9c0c8d5
	.xword	0x5f4451218c665da4
	.xword	0x88d598da863cb9c2
	.xword	0xd2b4065d03d4a5db
	.xword	0xffcb3719a2f88d9e
	.xword	0xd3895153788bf936
	.xword	0xd7d0f3911dfcd4cb
	.xword	0xe1b601a4a77fffb0
	.xword	0x8d0a84ece02bf87e
	.xword	0xeab7e90092f2322e
	.xword	0xb99e7824419e03cf
	.xword	0x744c3f1351c804f9
	.xword	0x810813c24601013d
	.xword	0xd06061c71e96d555
	.xword	0xb65257db2f0b0c25
	.xword	0x28782b1099c5e2d9
	.xword	0x51ab0d7a6b5e4773
	.xword	0x91f2cc19563f5f7d
	.xword	0x5abc2152d2aa9975
	.xword	0x854572503666c898
	.xword	0xaebf0a24cc61e60c
	.xword	0x504f799b0114df9d
	.xword	0x5833530c6175cc40
	.xword	0x9c67202d63a24403
	.xword	0x80934e216e5e6043
	.xword	0xa778bf9a01dd1910
	.xword	0xa38162b9feecfaf6
	.xword	0x0c0affab4e3c3806
	.xword	0xaf7dd22ac73ac550
	.xword	0x1eb9c4ac9c7ccddc
	.xword	0xad763a1161ee06d8
	.xword	0xd36be9c0f507abce
	.xword	0x9e18f0172eae34c7
	.xword	0x16747270e3d059dc
	.xword	0x771742e7c1e51474
	.xword	0x5c3fe0cb0f72b5ec
	.xword	0xa9b6ec08c731e593
	.xword	0x8f74b7bbd77d0c8b
	.xword	0x87e26c35500021e0
	.xword	0x91554d68bd4a9578
	.xword	0x5873f038a3976e6d
	.xword	0x47fc2bb8358b9997
	.xword	0x0f84ec15f942fd04
	.xword	0xc7de9679ed1ecbd6
	.xword	0x1476a620389d8521
	.xword	0xfbbf66126d42b614
	.xword	0x05b80a61a89e7030
	.xword	0x21eca29a0490cead
	.xword	0x4ca9f4b4f36db73e
	.xword	0x5ba664222882491f
	.xword	0x974ed2b02a69158a
	.xword	0xc05afed26aef5bb1
	.xword	0x6531106c2235095d
	.xword	0x55699c4d2b5b3d29
	.xword	0xca2ccf86f2d95801
	.xword	0x3d841935a9b7683d
	.xword	0x6b6b7b290614630b
	.xword	0xd103c6ff54a4ad97
	.xword	0x1ed383e3a005ce7f
	.xword	0x5c7541d2abb138c1
	.xword	0xb00e85cae6d71fdb
	.xword	0xeecf5f2a39405b4f
	.xword	0x4de97b420fdf7966
	.xword	0x259e5d1aa9c317b9
	.xword	0xf813ffb0bd24c726
	.xword	0xcdad659f2a431818
	.xword	0xfc96f7366cc6ec1a
	.xword	0xeb50b2f9058a8a69
	.xword	0x1be0e280f6dd4633
	.xword	0xef1bc0d67fc3896e
	.xword	0x66eea4103540d66d
	.xword	0xe47a46c5a07bfcae
	.xword	0x3eb8a001d8d50908
	.xword	0x5be9f677111e07a0
	.xword	0x3d6969f2205eb7c4
	.xword	0xfcde41a820bb1879
	.xword	0xd650eb4e62a7f7c7
	.xword	0xf83e0d1760671def
	.xword	0xd7d44dbffe41780f
	.xword	0x2908f57a104fc829
	.xword	0xf5929dae8431b262
	.xword	0x198c2f25b31ca5c2
	.xword	0x70a4d663844edff9
	.xword	0xb2a8c6b9e07b462d
	.xword	0x86e549da868c600f
	.xword	0x69ce31216568209b
	.xword	0x68109ff248f323b9
	.xword	0xf4d9405a5976e485
	.xword	0x6f00702aa29d8026
	.xword	0x2ddaea544b2525af
	.xword	0x9a86fa04cd25254d
	.xword	0xcb75225b0b53caed
	.xword	0x369e4129ef530f0e
	.xword	0x1d080f555e64ef3f
	.xword	0x28eebc31cd632274
	.xword	0x9f00b548a822df0b
	.xword	0x9153db81ea688c0c
	.xword	0xee7f102b45877503
	.xword	0x35f0f24c34a16d04
	.xword	0x02dadc40cd8f0964
	.xword	0x2049a28ca4e5e9f3
	.xword	0xaaf1197ac4bda123
	.xword	0x0da082915ebaf761
	.xword	0x91f97d924b59442a
	.xword	0x20d3108928793890
	.xword	0xa64d9d061a67c8d3
	.xword	0xd1803e276ad0f3bb
	.xword	0xc878a5c8a5298c0c
	.xword	0x1422d08c58d8ea47
	.xword	0x4c9f5002779d3405
	.xword	0xf47d1b18f49810eb
	.xword	0xb3f407127da720d7
	.xword	0x3d87a52b014e803c
	.xword	0x15de969a7e62a68d
	.xword	0xbeb6c957b56cf727
	.xword	0xdb3f56275cf84fba
	.xword	0x3775df8629e99870
	.xword	0x4bac8c4f62fcf65a
	.xword	0x3303fa870d98e59a
	.xword	0x67d6ea89910d3894
	.xword	0xb3073216b11a8560
	.xword	0xc6170a2a7297b9ad
	.xword	0x9d35c72b0139e541
	.xword	0x5b34565118668118
	.xword	0x3e504ce98af6f645
	.xword	0xf38f59cb925a1baa
	.xword	0x3acb5f29a4b01530
	.xword	0xdca6c6ff0a92a456
	.xword	0xe01a3230da9ba889
	.xword	0x9010a0ab2ce8aa34
	.xword	0xc4192574e38a4030
	.xword	0x8d574d701d2a49fd
	.xword	0x71ecd3bca1bdf573
	.xword	0x889e8f4eedf6c10f
	.xword	0xb247f6413453882b
	.xword	0x330738054d3db5d7
	.xword	0x955b29178114d28e
	.xword	0xe3d641e80f0e5319
	.xword	0x1c6b0db4d36bf705
	.xword	0x3c105f85a2ddedde
	.xword	0xcde9e1646ef94417
	.xword	0x523abe016126af43
	.xword	0xe0c148bbe062510c
	.xword	0xa0bf109cb3a1e533
	.xword	0x43d3014d34cc80c7
	.xword	0x6da2525c8d586cdc
	.xword	0x5cf24240200dc888
	.xword	0x12848e9d8321235e
	.xword	0x100f38c9d7a65348
	.xword	0x194685c9e13aafc3
	.xword	0x3492fe67e368b508
	.xword	0x3efe23b9aaeeff48
	.xword	0x8ede05f14326d6f2
	.xword	0x29a3ef09ca26911c
	.xword	0x2d4e459cd1f381b2
	.xword	0x07fd7a0af51f1e89
	.xword	0x6db10b3229f94b84
	.xword	0x3c7786797d3403b3
	.xword	0xedfc8e2485f8a32a
	.xword	0xf65e24216e4e1f0d
	.xword	0x74434313b6c78ac0
	.xword	0xd6af79a33f2332da
	.xword	0xdbc35d6c64e3f4c2
	.xword	0x4d4203b984f2d795
	.xword	0x2b74495bc4e5061f
	.xword	0xb2a1d71cadfbdb1e
	.xword	0x5ad21d1df756876e
	.xword	0x4e548a2dcad80eed
	.xword	0x1574f64f2cca35c2
	.xword	0x40c31da18f703e7d
	.xword	0xab75f112b68460e3
	.xword	0x0b1bc88de4d4e4ab
	.xword	0xdd9f4e64b1182bb1
	.xword	0x6e3a226f510f428d
	.xword	0xcdf6a19826fe6e55
	.xword	0xb2a7c9eb7c2b48b8
	.xword	0x54df64fcf0f94f6e
	.xword	0x710e6657f394de7e
	.xword	0x7a85bb9bbfa3f479
	.xword	0x0e7623e43b52d61d
	.xword	0x5d995af29cb24345
	.xword	0x33cf1f2e8e6bfd1c
	.xword	0x9d319dcdcadf95aa
	.xword	0x3b5cceb8d9e08d4e
	.xword	0xe532f76ca660a1db
	.xword	0xd857eaea2e99aa06
	.xword	0x07fbf15a513fbe16
	.xword	0xa02986a0472d74aa
	.xword	0x408455a83e2e60a2
	.xword	0x16dab7074f1fea1b
	.xword	0xd54855fe3c46440d
	.xword	0x5ce8ab94a61d0944
	.align 0x4000
	.data
data_start_2:

	.xword	0xd08b67efbc6ad2e0
	.xword	0x03a1c5211bb0b578
	.xword	0xb46db879d8d567a7
	.xword	0xb1367cf05c17a352
	.xword	0xbbb54207db117c21
	.xword	0x8babb596a57cf7ba
	.xword	0x6790101618d23b51
	.xword	0xd8373fa04dfdf6a4
	.xword	0xfb799c7f46adaa43
	.xword	0x6786a7cdeed1a56c
	.xword	0x4bae13ac4177690d
	.xword	0x0401de9888fc5cf1
	.xword	0xac0009d0fc9bac37
	.xword	0x308dd34904199a3f
	.xword	0x72a736734c680299
	.xword	0x37cbb3bd080db156
	.xword	0x4e2a25c1b636870e
	.xword	0x243b41c138605389
	.xword	0xa7f2482b991d9d42
	.xword	0x4133287324b1a199
	.xword	0xeb8083e0daa62fe9
	.xword	0x32dacb96b2a099ba
	.xword	0x4049f50f904418e5
	.xword	0xf6b40e16fefed692
	.xword	0x018ced3fe3393b96
	.xword	0xae48fbd44cace1e9
	.xword	0x701714ea817281ff
	.xword	0x58e04ee4d49d3f5c
	.xword	0xa1721ed801583966
	.xword	0x52c19b6d2a8afd64
	.xword	0xfc5ae3bd6a980d7e
	.xword	0x022ca6bb730f22cc
	.xword	0xd7cc5a97af55fea7
	.xword	0xc017c6273ba4018a
	.xword	0x5f2a62f1d4f92ae3
	.xword	0x3fb73bd7715aea62
	.xword	0x7e6bcf67dfed57aa
	.xword	0x1c6fa62d77ccea39
	.xword	0xb08bc3e25d995976
	.xword	0xa96f205b86056c0d
	.xword	0xaa93803fbe0b04a8
	.xword	0xb254b47315f0d529
	.xword	0x86ef7e2490359431
	.xword	0xcd580e5192ad795f
	.xword	0x3730630a2dda9dc1
	.xword	0x71dfcb7384f02b27
	.xword	0xe7464476d879cd45
	.xword	0xea0e7af1f3204ddd
	.xword	0x9912e917c817e22d
	.xword	0xb1d7644e10ebea92
	.xword	0xc910b590dd7048be
	.xword	0x337eb459f5f448c1
	.xword	0xc4e5d999457f7376
	.xword	0xb62d369ae58b0bbb
	.xword	0x7adaf9a967148dc9
	.xword	0x9d9b9f1be8588dc3
	.xword	0xfb0d4fb8228460ff
	.xword	0x992b5edb8248f801
	.xword	0x2f376d9992e32b00
	.xword	0x36643eb9f3e04614
	.xword	0x6a8aa237ae73daf5
	.xword	0x093b6b28fa93287d
	.xword	0xc98ae6b7f7679905
	.xword	0x0abbabfdb064ee4c
	.xword	0x2ab90f50c5f85be4
	.xword	0x817a91a9af10a7d7
	.xword	0x8fa4108a7c0da871
	.xword	0x47f56475f0e1a344
	.xword	0x82c093beb615544e
	.xword	0x6a9f4fc744d4f945
	.xword	0x32c6d5138fa55e71
	.xword	0x3ef897aaf47698f1
	.xword	0x69c53cb93d6425b0
	.xword	0x0ea6b029a903a123
	.xword	0x9ee6928db86c58ef
	.xword	0xbf7904a95d4f0b6d
	.xword	0x57abf1df01dc5b9a
	.xword	0x7c0da60671dba027
	.xword	0x1f630a0a9f70331d
	.xword	0xea0032ef6e41f7ce
	.xword	0x5c691c3fb7a2ab20
	.xword	0x0c23e7a33f3696c6
	.xword	0xa80cf7340907af77
	.xword	0xd0ea2e4eb5c74c94
	.xword	0xcd564ffd26568168
	.xword	0x4f67d6c1584f9857
	.xword	0x657a5647ddfa99c3
	.xword	0xb19caf4f156e0e48
	.xword	0xc1ede7cfae6d2b6b
	.xword	0x901e07ace9962224
	.xword	0x0129164f992f5458
	.xword	0x05b70544ab4fa8f7
	.xword	0xcde10432e75aa328
	.xword	0x43332e561d3167f2
	.xword	0x0233fc2ae5e06110
	.xword	0x0643c92ddb359b73
	.xword	0xb8bd69d3a58fc2a1
	.xword	0xf62a7a4886812112
	.xword	0xd178cb7eeb1fface
	.xword	0xf323cc53674b343e
	.xword	0x169e65bc13b95203
	.xword	0x23a9bc3dcc48d898
	.xword	0xd2f771a14c3ea702
	.xword	0x142bbcfb6b7d43e8
	.xword	0xdd2ab442fce4f204
	.xword	0x6b1de1ea41727b65
	.xword	0xd87a0410610fb0c3
	.xword	0x93840cdc6b6c28c1
	.xword	0x0167ae68e9d196a5
	.xword	0xfa7f735af7b1410b
	.xword	0xdcfd3dcc7ebc44d6
	.xword	0xbb3300b4aeaf4bd8
	.xword	0x50a1a6f564434967
	.xword	0x99a9746a2bda4239
	.xword	0x616a1fb52c73f64c
	.xword	0xf54c5403e75e1dee
	.xword	0x6526079174abf905
	.xword	0xf6c9dff1e31b43f9
	.xword	0xdb6537f3c58969b0
	.xword	0xf2a011ae6f6c260b
	.xword	0x742dbcd3ca006948
	.xword	0xcd1ab3c39799abc8
	.xword	0x24d810d9b538c9cf
	.xword	0x77d6d4b3ac38d9b1
	.xword	0x306ac913302877d0
	.xword	0x470f60e2b3e8b879
	.xword	0x16eb0a58c3abafd9
	.xword	0x15d7af792381b0af
	.xword	0xf04b4253bc1e92cd
	.xword	0x5a5051da56762b65
	.xword	0x82a20866e7f59ef3
	.xword	0x7de044d0720d1eca
	.xword	0xa894f9b4d438a9ed
	.xword	0x51d82d1087126681
	.xword	0xada52437f552fa81
	.xword	0xabb84b07a215c6b4
	.xword	0x13e80c07d1e81025
	.xword	0x87e093c0e7541867
	.xword	0xe44f1aea3cf20795
	.xword	0xa27681532062d148
	.xword	0x8c301e6e0b55ca00
	.xword	0x1d0232ecf764e8ed
	.xword	0x8815cce3bda476d1
	.xword	0xf1dfd520d1319081
	.xword	0xf468a3afff85af75
	.xword	0x6654909996f34f70
	.xword	0xd33ecfd980fc351d
	.xword	0xeac105eb1c4cd163
	.xword	0x1ea85a5d4381085d
	.xword	0xdc21c4dec232859c
	.xword	0x43231dea99cf3c76
	.xword	0xbcbbef8dbc8a1b10
	.xword	0xb9c3ab62631f52ac
	.xword	0xcd5e55201ae166e2
	.xword	0x62c15e393379edf3
	.xword	0x7efdefd8969ce3bc
	.xword	0xe534f31bf25c0cec
	.xword	0x385ef1efc6b7418e
	.xword	0x069d09bb18c5e7f1
	.xword	0xa2e368c99f42f73f
	.xword	0xc669733fa349e3dc
	.xword	0x1ffbc1ebbe1fa727
	.xword	0xed7a55a7255db366
	.xword	0xfbb1ccfe99d99e24
	.xword	0xf0656639b47cb7f7
	.xword	0xd932f6e0ee0b5708
	.xword	0xdd45d6e8f802b0b8
	.xword	0x7c7e72bc6db4bae9
	.xword	0x674962d80570127c
	.xword	0x83012bedbedc65e0
	.xword	0xf0b7d378f6121044
	.xword	0x1be5aaecc54aec2a
	.xword	0x3b289755f7bbba82
	.xword	0x1f26fddbee6fa79c
	.xword	0x247106a2e36032cd
	.xword	0x2d58cf35087a5857
	.xword	0x2fb7656b1f8d2c14
	.xword	0x0a3082b0b3e072c4
	.xword	0x2ab82d428b122c4e
	.xword	0xcb53ca363cc041a5
	.xword	0xea893ddd8a06a63a
	.xword	0xfb860c872be80646
	.xword	0x34a965912f5b477d
	.xword	0xe9154c6a15e21391
	.xword	0xeeae32dba85bc193
	.xword	0x2fc80bbced98f6f2
	.xword	0x06d021e1f96d9e75
	.xword	0xbce3478e82f53baf
	.xword	0xae4f9e6d984dd281
	.xword	0x6c366518ffd9dae8
	.xword	0x1810a8fb759f262b
	.xword	0x00a273ebaee587ec
	.xword	0x1de2c8830e83be4c
	.xword	0xae48662286a5d014
	.xword	0xcf751814d1d8e682
	.xword	0x4588a040703c6b59
	.xword	0xb1f0535379866cfa
	.xword	0x622451da10f39d6a
	.xword	0xb7b8993a6d96810c
	.xword	0xae34df3b0fa21c00
	.xword	0x75600ac6dafaa0ce
	.xword	0x8c7d4e613c2be57f
	.xword	0x0bde760655a20ba0
	.xword	0x148d7da5932cd72d
	.xword	0x568b31734a62a287
	.xword	0x6936d2cc2305dcff
	.xword	0x75a8fa2cd7cdc670
	.xword	0x722cf1d9928049ac
	.xword	0xba0844bf76a6c81b
	.xword	0xa7c34a25d231093c
	.xword	0x9bdd366f1e6f72ba
	.xword	0x615398744943633e
	.xword	0x2ed262bda8155580
	.xword	0xf026f250993fb59f
	.xword	0xe43a07da9000dc68
	.xword	0x0525775ed1758c37
	.xword	0xd4e4a903be70b8b4
	.xword	0x742d280dff6d4a6c
	.xword	0x8e10f143fb3e22bf
	.xword	0x991946cd22d3f7a1
	.xword	0x825d4c0fb8e00f0f
	.xword	0x0657acd6015cd54c
	.xword	0x5a3fe52dba5769c2
	.xword	0xf92cbcc799fdac69
	.xword	0xae8d3f253223fd02
	.xword	0x521d55f759edb1cf
	.xword	0x3fa36d03e0240dcd
	.xword	0x3c5427f0ddf01bc0
	.xword	0x206ffd30cdb3c86f
	.xword	0x55a71e9a738db6a6
	.xword	0x87b237e589a0a795
	.xword	0xfe525641e173fce7
	.xword	0xcd33b98e74af54c1
	.xword	0x93ac24ecec994e22
	.xword	0xb63c04f06ebd49fe
	.xword	0x10a2a7e4f018ef64
	.xword	0xbd22b09dade764f2
	.xword	0x2b951c8a62d51f92
	.xword	0x3e531f11a6b2343a
	.xword	0xe82bb8c94105a3ef
	.xword	0x47cd1f755172e6db
	.xword	0xc17e217b19b0ac57
	.xword	0xe66f58df2ae3dc10
	.xword	0x2c24cab79ed9a470
	.xword	0xea536429fcbe6475
	.xword	0x93c94a3ad816ffba
	.xword	0xebdecefff9d6f473
	.xword	0xae14e09b2c6a7bcc
	.xword	0xbe475725209b23c6
	.xword	0x0bccef386f42adf2
	.xword	0x544da3cc9a3070cc
	.xword	0x8eb8d3170da4f9ca
	.xword	0x16e50915427d471c
	.xword	0x5abe2c9b6b5b0188
	.xword	0x7a975449d5985047
	.xword	0x9074091f72175809
	.align 0x8000
	.data
data_start_3:

	.xword	0x6bf8e11a795eb8a1
	.xword	0xb2c09678f6f2f080
	.xword	0x763cbe9b85e47f05
	.xword	0x726b610e18055053
	.xword	0xd29fe080a064c241
	.xword	0x1272ed48d55aa7bf
	.xword	0x3fa38e457bd4d8ae
	.xword	0x36436c268f9bf6b2
	.xword	0x84ef036ba7dfb5bd
	.xword	0x5d5f59226dc09b07
	.xword	0xa62e8768c422cd72
	.xword	0x9690801b68efea48
	.xword	0x602d7824528f280d
	.xword	0x933e8bd2561720d2
	.xword	0x0ec5a00a73e40a92
	.xword	0xdb0326a11a63b84e
	.xword	0x662e5b8cd7d931da
	.xword	0x9c6962a1eb2b664c
	.xword	0x75a3020f0d3ad3a6
	.xword	0x35b5e41baf53779c
	.xword	0x58659f01312e5a23
	.xword	0x4d9025215184543b
	.xword	0x373d2413ba926b55
	.xword	0x5ba4367a31b56df5
	.xword	0xb4d40ec1921c9d31
	.xword	0x38610098f97fe77c
	.xword	0x82a2019d085a4faa
	.xword	0xa33a0d26d880d50f
	.xword	0x37034f0fb784d081
	.xword	0xae22d1aaaeed6580
	.xword	0xbf263f6ab5195d68
	.xword	0xf73053249dc45071
	.xword	0xb2bcb8fba7b683f4
	.xword	0x4c18636af4acfad2
	.xword	0x0219780ec5c5982e
	.xword	0x058b957af2ccaebe
	.xword	0xd9d99106127ab88a
	.xword	0xdc598470f0a1cf69
	.xword	0x9b7e0242b9adc424
	.xword	0x52c468bdd71489c3
	.xword	0x1615447d078163de
	.xword	0x37075b311c1f1be7
	.xword	0x9c37af918b8d8e8d
	.xword	0xcf8866d13ee93d8c
	.xword	0x29f21acc704c5c8c
	.xword	0x24a6cd8be2225d22
	.xword	0x4c33dbd2e26f6eaf
	.xword	0xd56289cd7debf301
	.xword	0xd5225e8abd10eb60
	.xword	0x3cd5d10bebd4c0c8
	.xword	0xa33e4119acc9e601
	.xword	0x86c1354141081e70
	.xword	0x9c113b10fa2c7f58
	.xword	0xee39a7e940ff4897
	.xword	0x69d5fb5764938b91
	.xword	0x3f8e4a9dafa2bb81
	.xword	0x686874ff7655aa71
	.xword	0x2ebb5b0be6bfffe2
	.xword	0xa3bfe4d2d89b1ec0
	.xword	0xe62b85cf8ac9a3c1
	.xword	0x0a83e9ecc732a965
	.xword	0xdecdad4d6aa3eb5d
	.xword	0x7eb91ca9fb8e46b7
	.xword	0x043b7d70a26ca4c0
	.xword	0xc9dc9e13a75cf62c
	.xword	0x770aa10b175bf39a
	.xword	0x025012d137b17ce1
	.xword	0x70ba25887f886f71
	.xword	0x13357126a3e74354
	.xword	0xefaefcb9cf512e2b
	.xword	0xe957d2e98c0adf2f
	.xword	0xa8ad7e6121e69c16
	.xword	0x72fa3636c064ca5f
	.xword	0xc20ecc28c4c35108
	.xword	0xc7a1468cd9f87386
	.xword	0x2dd5d5df465f9aeb
	.xword	0xaa53a12345ac22dd
	.xword	0x475b94701d5b9114
	.xword	0x8afa39d4ffc2f0d8
	.xword	0xac0b2b7afc7e2659
	.xword	0xf7320c73c4ad83a7
	.xword	0x691163c1aa10b6f6
	.xword	0xd6a77ac3210969f2
	.xword	0x8331220a5cdd3aab
	.xword	0xd9aec8f71a72e241
	.xword	0x09df8004a9fd07e4
	.xword	0xd0b8b65975ec9297
	.xword	0x216bb671c3bd05b3
	.xword	0xca82e25e5602a543
	.xword	0x04acbc412e5f2b3a
	.xword	0x66c5390555f3152e
	.xword	0x6db38ddd4f1b0162
	.xword	0xa8e2a14a313d9778
	.xword	0x20b6b1ce0edfca99
	.xword	0x02bfce621b119970
	.xword	0x92ad340f49428813
	.xword	0xb5695394232cd209
	.xword	0xe831c5e319034fb8
	.xword	0x4c74a4c7ec89633d
	.xword	0x39480e7a8af236a3
	.xword	0xc15c6f03c687f855
	.xword	0xa5580f305034b23c
	.xword	0xbbbc84d283fdaaa5
	.xword	0x7662f1a7b6489af0
	.xword	0x54f946ec521a0b5e
	.xword	0x701b134183a844f6
	.xword	0xc3407e38d693333b
	.xword	0x7024f491816e73e6
	.xword	0xbdc519d2cdfd1e23
	.xword	0x2d7317291be7a353
	.xword	0x50607ab937fb2307
	.xword	0xf1da134661db2cac
	.xword	0x9a72e35920f7a8f7
	.xword	0xf55b8d00b1098b42
	.xword	0x25422e99d53a473a
	.xword	0xa7905f9993bd5c2f
	.xword	0x693f9bfa2a5136cc
	.xword	0x5e81c5dea3a2fc0c
	.xword	0x7f0a9d273b01830c
	.xword	0x5ef2ab52486e6aae
	.xword	0x01196968e23b1bd1
	.xword	0x76561481e0908882
	.xword	0x30d99b90c4142435
	.xword	0x9c5a847796b41dd0
	.xword	0xb7ba37050115f1ed
	.xword	0x15f94f267e281056
	.xword	0x9863013667fd7313
	.xword	0x8b4ef1ffca778394
	.xword	0xdcbaa1a60770a658
	.xword	0x0c51aec905770c59
	.xword	0x73a191eb4aaf3edc
	.xword	0x30974cc83b562027
	.xword	0x5038004048345a3d
	.xword	0x7571704f4108b655
	.xword	0xe44d8ce6d71d2e51
	.xword	0xc5ca6eae463abb7f
	.xword	0x5392b5cbcb317469
	.xword	0x5696c75c8d2e8498
	.xword	0xfc659107f6299065
	.xword	0x54d02d7cc7ee658f
	.xword	0xcc30bde21d094199
	.xword	0x7bf867830dcbf258
	.xword	0x851ce55672ca92b7
	.xword	0x29d656aa61004e7e
	.xword	0x54ea9ec5518bcee9
	.xword	0x18703a42a9756727
	.xword	0x97c26b2053f35262
	.xword	0x559f57a08f360778
	.xword	0x4847d6933e114d74
	.xword	0x73f96e9a916138eb
	.xword	0x5b4a6b0cf53e043d
	.xword	0xcf4fa7722f88cb18
	.xword	0xa02dc4abe8befcb8
	.xword	0x934537469092d546
	.xword	0x67e1cbfba65bf873
	.xword	0x3b474cfadcb87db0
	.xword	0xe6262d90a2cb8846
	.xword	0xd67e603db57c674d
	.xword	0x9dea1e7f15d9cc59
	.xword	0x1b260d989b3f08f6
	.xword	0x1b758ff479776372
	.xword	0x18a28a97326db2f3
	.xword	0xc4405dcf20309ccc
	.xword	0xa7c8b6be275b9d3d
	.xword	0x9efd85999445d093
	.xword	0x88fc8faea545c5dd
	.xword	0x9b279a392083853f
	.xword	0xce43ae1f7264e9a0
	.xword	0x522f4cf4e6187a58
	.xword	0xf958ca7cde19cfb5
	.xword	0x372f56131004f456
	.xword	0x650d647f0f231e9d
	.xword	0xbc70afd752b81e15
	.xword	0x6f661894620d4d53
	.xword	0x80eda6a7a06af616
	.xword	0xf0f5a137347061b1
	.xword	0x4685dca4b9e1bfa4
	.xword	0x368328928ba957d9
	.xword	0xc09b11dc19891ad7
	.xword	0x6cb5acd7dd7635d9
	.xword	0xf92eddd3ca7d8c89
	.xword	0x42050502386b5dec
	.xword	0x9d241a0dfba01f93
	.xword	0x57f176bc65cb3a94
	.xword	0xa2c4eebe19cd9f69
	.xword	0xcf362f50aff349c4
	.xword	0xf80b3f6570cf78e7
	.xword	0xcbcdc53da23258a3
	.xword	0xeae4a012fcdd051c
	.xword	0x4677b0b940001e39
	.xword	0xdd0791edae39413c
	.xword	0xb2289add9e15745d
	.xword	0x62be9d698b28d02c
	.xword	0x85006a156313a751
	.xword	0x89f92b91c69e6a2a
	.xword	0x6c34a3cb5b7ce9a1
	.xword	0x06f7bcf2e7a442d0
	.xword	0x5e1c7536f98004f4
	.xword	0x96e703dae0d33619
	.xword	0xf12bae3a772dcf05
	.xword	0xff61be2281a3d23b
	.xword	0x597560c16b50649f
	.xword	0x022ca5e4fe949033
	.xword	0x3a5c32dfae2b8e6d
	.xword	0x79d34edbe3ef29c2
	.xword	0x200cb72b5a17ff07
	.xword	0xc94bd86512f1db18
	.xword	0xe702e3e8a32dda11
	.xword	0x3e27db89b2af577e
	.xword	0x6e0eb286107bf369
	.xword	0xfbb077f8a3075349
	.xword	0x228fb7e640f34e32
	.xword	0x0f48ea7742de2942
	.xword	0xf185feb358a22be8
	.xword	0xa95112d03861ae6a
	.xword	0xbde0e1718cae8ba4
	.xword	0xf4532387193063eb
	.xword	0x752a17e1add07047
	.xword	0xfe42f359fd85a8ac
	.xword	0xe4ad2fa5bdd1c65d
	.xword	0xd3940381996363fd
	.xword	0x886945b2f55bae1a
	.xword	0xa71bb4da625e8d71
	.xword	0x6e80ac7fa1c98293
	.xword	0xf2e597ddbc4ca5cb
	.xword	0xbeaa9bacb2b9d1b6
	.xword	0x04beb453b83d118d
	.xword	0xa4ac0cd7f07605fe
	.xword	0x285a024976fa2040
	.xword	0xbc519bf39abde946
	.xword	0x5b2d192657a46451
	.xword	0x8e8b791a4b54b529
	.xword	0x7c434d9ca6991097
	.xword	0x65560844b816a9a1
	.xword	0xfa8b251df3a8c0ee
	.xword	0x3e10e6d68acf153c
	.xword	0x272a672b167c99fd
	.xword	0x5d506c1fda5f4183
	.xword	0xaa5b7a3b60c300eb
	.xword	0xe49bd335851aa057
	.xword	0x595f44023d8fce28
	.xword	0x8435eec1880fb7d1
	.xword	0x1cd459635a93879e
	.xword	0x971675b16d58a290
	.xword	0x9f4f2b751d8b522d
	.xword	0xe3013c81372c5f96
	.xword	0xc4728c22e8ab436f
	.xword	0xeac4cda54db8679d
	.xword	0x94184fe982625792
	.xword	0xc39bda1907d798bf
	.xword	0xe2ed6e85f9d28d5a
	.xword	0x75b3d790da8926a7
	.xword	0x018df65efe7bc405
	.xword	0x7b16598d0ed49c54
	.xword	0xadfa60bdaec3dc24
	.xword	0x6d99f73f8271f324
	.align 0x10000
	.data
data_start_4:

	.xword	0x098e1e4aa300bb9b
	.xword	0x14a46efdf28fde30
	.xword	0x737ba136e991cdcc
	.xword	0x624ac4bd3c82e69c
	.xword	0x556ad945e59a6387
	.xword	0x84c8ace770bb0aed
	.xword	0x0254643def5c1c40
	.xword	0xa2c2d288e85b6544
	.xword	0xb014026c5c7e0580
	.xword	0xd82f59703de36b31
	.xword	0xed99010a9a56c05f
	.xword	0x793fe1e0aca75426
	.xword	0xf0b65df41dce0737
	.xword	0xd4e381ed9458d4c1
	.xword	0xf87b10e6643f6e90
	.xword	0xbc21c13af22db4cd
	.xword	0xcf8bc28509f30ad5
	.xword	0x7f854cefdaa9d1ee
	.xword	0x0a25076c06d54534
	.xword	0x335a577b966bcd7a
	.xword	0xa014b2360613154a
	.xword	0xaf480ff668794515
	.xword	0xf054d0b042703856
	.xword	0xf3a2eb699660340a
	.xword	0xbceb96f5d8601c7c
	.xword	0xe02adb44d15672df
	.xword	0xb2ca7d6625f4cfd4
	.xword	0x1146b2dfb4dcda17
	.xword	0x05ed570759b2f272
	.xword	0xc11e9881a755023e
	.xword	0x56b076decfbae711
	.xword	0xe0387ec48d5566e7
	.xword	0x2b7e0f06f5f2bf59
	.xword	0x1636a3849a8c2d63
	.xword	0x70b196c08c5e2057
	.xword	0x8dba26bb0ec59ec2
	.xword	0x34353e05481981f4
	.xword	0x2a8ec5bc4f594195
	.xword	0xea268ba7caa5af67
	.xword	0x0ef7071c023cc363
	.xword	0x98a54f8e232f5179
	.xword	0xe65cf128a5d131fb
	.xword	0xe39daf696a748558
	.xword	0xb4a7371132c201bb
	.xword	0x659ae4b43088c1ef
	.xword	0xaa811feeb2934ddb
	.xword	0x8d2f8b9fe7ac309f
	.xword	0x06df255156f9136c
	.xword	0xf87a2ab1a5fdf247
	.xword	0xbcead312cfe016d9
	.xword	0x8d7520f8b60e823d
	.xword	0x054bdd4eca3db4d7
	.xword	0xb7fc870c46f4813c
	.xword	0x97c53a46ad23aa38
	.xword	0xb7366cf764bff739
	.xword	0x9d85ba0dbb007fbd
	.xword	0xcd8ad5b95221f0dd
	.xword	0xb79a806ef74b43e3
	.xword	0xf83d5423d02bc69f
	.xword	0x8480134a64963e38
	.xword	0x27d91d3f7b7024ed
	.xword	0xc26d23a20957e560
	.xword	0x9303645f4b2d81b8
	.xword	0x1b1237238f9d9773
	.xword	0x68e8bf0dc5561c48
	.xword	0xc9fba19b4ec81753
	.xword	0x5a05b5a141df98dc
	.xword	0x18e501c775f715ee
	.xword	0x7a7f80a238b97505
	.xword	0x2e7a3ea7feead8e1
	.xword	0xaa68672eeb13598e
	.xword	0x71b01f55a32a2f85
	.xword	0x7d901b674801e76c
	.xword	0xe357ac35b6b3771d
	.xword	0x65b299517fcca423
	.xword	0x02e40ac2b95b1a5b
	.xword	0x5139b509f4a5f632
	.xword	0xdf03ed4fda23bc55
	.xword	0xb8d0f2f6ff6d2fa0
	.xword	0x000f7155dda026ff
	.xword	0x78ee7381a9e6e704
	.xword	0x29f7d4d3166bfed0
	.xword	0xc0bf2d162dee738a
	.xword	0x6cfde0c44599587a
	.xword	0x62039650ff14d0d5
	.xword	0x7956b102f6c36788
	.xword	0xf3d1f77ed0b0ad38
	.xword	0x701bd6972e6209cc
	.xword	0xd693e0e1b96f325d
	.xword	0x4a46180ab15e1f10
	.xword	0xb93e9a6c7705c089
	.xword	0xc7cc3329d68c8332
	.xword	0x8adf025c428522b0
	.xword	0x1d1d80425d625ede
	.xword	0xc92b8d337805127b
	.xword	0x134097c7152ba97a
	.xword	0xd5a4fdbda076d137
	.xword	0xdf1ce0dd89affcf6
	.xword	0xdcc5a6fab4625680
	.xword	0xaeb3d54d4a16f5fb
	.xword	0x699ceef944d5796a
	.xword	0xac77adae69dee049
	.xword	0x71464bf8fb5d8d51
	.xword	0xa21b7a7986bb2209
	.xword	0xb011e5e9f01b3677
	.xword	0x0724ebe9ff5d4fc6
	.xword	0x37fcc02909eefa3c
	.xword	0x648f0951c72e46da
	.xword	0x4548764ef57fac39
	.xword	0xa0aa76ded04f8070
	.xword	0x8b029ff0ae1ba3be
	.xword	0xa503e63ab89e19ab
	.xword	0xd54de0eb24562e29
	.xword	0xaec2ccb30249a616
	.xword	0xb4691e5b56726258
	.xword	0x8609b6369301d075
	.xword	0xb743c0a98e0a7f9b
	.xword	0xe3f29ffa044e5c50
	.xword	0x7d532bff3efe48db
	.xword	0x52407520818f6cf2
	.xword	0xf4177202847b6074
	.xword	0xc5a1f25b2de8ac8e
	.xword	0x5c49dddbcbc76e2a
	.xword	0xa1f8b6caf1193ab1
	.xword	0x22e79ae47c0ba96f
	.xword	0x28bc99b27368c525
	.xword	0x5675cc7a97c7cbd3
	.xword	0xc30db1d6ad28fe0d
	.xword	0x6950e09d344f465a
	.xword	0x6569ab1212f85a72
	.xword	0x39d97e2940e8ef0f
	.xword	0x66e7bb2635368f98
	.xword	0x4b5339fce8b2f503
	.xword	0x317d46254266e75a
	.xword	0x444f5bcd5ae7e7b9
	.xword	0x42c06c1f77f2ae2d
	.xword	0x7bc1d10438c14009
	.xword	0x71fd6f0c081deaa6
	.xword	0x05b3b6919481ac48
	.xword	0x1ce1de72263f9dd8
	.xword	0x42a1f3dee4ea4396
	.xword	0x5c8569da8fd2e9d0
	.xword	0x0b4968e0bf6d6d1e
	.xword	0xeecb3de709317251
	.xword	0x2b8b9d6f71885e95
	.xword	0x7f8d50dab16edc57
	.xword	0xb5d5b40927924449
	.xword	0xa7d862bb61b730b6
	.xword	0xf109a43f6987d35f
	.xword	0x6f53d6ecc1487191
	.xword	0x76c9bcd0e07b143d
	.xword	0x90e1280588057c49
	.xword	0xd32c86c0f67e6e29
	.xword	0x9506ab90c158614d
	.xword	0xd4d370be11ad25a6
	.xword	0x043acd0008a63aa7
	.xword	0xfd56987367c65a8f
	.xword	0xca090dbda41ce2ff
	.xword	0x23eac1eef5f597ce
	.xword	0x58d7c63d296e27a9
	.xword	0xdac5dc745786c394
	.xword	0x18e1f58ac6db35a5
	.xword	0x955999932cc86ea9
	.xword	0xc0317532fd733e3c
	.xword	0xf749712ed97caabc
	.xword	0x5bde7a8dc1357bbb
	.xword	0x8906335c9f634137
	.xword	0xc69dfda00f8995fd
	.xword	0x40614b349f29b8eb
	.xword	0xbd79f10d9f81ef0a
	.xword	0x4ab39ef58afbec40
	.xword	0xef558a7946bba05e
	.xword	0x2df869c4c9dddd6c
	.xword	0x6b97444ef9c13f34
	.xword	0x878e29edff94572d
	.xword	0x6e19b05a96d3c4ff
	.xword	0x452b08c4f3fe26ef
	.xword	0x8134866e24f95b9d
	.xword	0x4849d849d3744272
	.xword	0x2c1e588602e11928
	.xword	0x91bdaa1b8cb55df4
	.xword	0x5364d8b4a0ff72a0
	.xword	0xe74a88fa5e82ee4a
	.xword	0x97ca41e5b874ad38
	.xword	0xbcd7ffdfef1ecd03
	.xword	0x265bb4db03614ca3
	.xword	0x93609a9454fe2c86
	.xword	0x9179dc1fa2a9d031
	.xword	0xa6674323640972e7
	.xword	0xc00541ea0a21e497
	.xword	0x1531756bba54860f
	.xword	0xee206e5113f0d50b
	.xword	0x7609ff74f5a9e88c
	.xword	0x4ac91a26b147307b
	.xword	0xc4c6f98936b0a23f
	.xword	0x810d50c69a10022c
	.xword	0xf32e20f8d77a96f7
	.xword	0xecf7840957c2016e
	.xword	0xc00339dea90bd02c
	.xword	0xb7ed7c400cd2621e
	.xword	0x28c8d2804730d682
	.xword	0x869dc6943981e4ef
	.xword	0x1e8eb776bf478660
	.xword	0x44311900b1140698
	.xword	0xbb1e46549d702d4b
	.xword	0x881295d5c8c8fb5e
	.xword	0x66fd864795f7fe09
	.xword	0xdc5db2bb36ecb53b
	.xword	0xaac3c1dd424cce31
	.xword	0x15f6c443b99ae649
	.xword	0x5e51ce3714699ea0
	.xword	0x991735fd78a59d44
	.xword	0x624cd9f3952325a8
	.xword	0x7d72d1ee73d4687b
	.xword	0xe9cd8ffc07ba3a4a
	.xword	0xadacc629315a9067
	.xword	0x05ea3a91a2dac96e
	.xword	0xdcfe1c80205ecba3
	.xword	0xb52e8f123f30484a
	.xword	0x999321f58d88219d
	.xword	0x6b541a3d75eed616
	.xword	0x49f355cbd375b3cf
	.xword	0xa69347944a3324c5
	.xword	0x78fbac80df4b051a
	.xword	0xe92192cce5f30db7
	.xword	0x3e64220f556164a3
	.xword	0xc52d51a21d46ef9e
	.xword	0xeb5af21a8040d235
	.xword	0x7b3346af90f02ea0
	.xword	0x41099ddc4f387bad
	.xword	0x4a63b8837a2b442b
	.xword	0x00e42067f792926c
	.xword	0x94632e16b494b08f
	.xword	0xf2751b0e531daa77
	.xword	0xe9f121fa1752e45f
	.xword	0x6a513d35ab6adc14
	.xword	0x50758e5e499db2c5
	.xword	0x2abcc97e708c9005
	.xword	0xafc90d21fd8bdffd
	.xword	0x61c9912ebe527903
	.xword	0x56be4bc04c33f22e
	.xword	0x6d1a1710626068d2
	.xword	0xb7b8a07623d1704e
	.xword	0x40d1b2955a6b9476
	.xword	0x01af64dcd7ee0f53
	.xword	0x15fbe70eff1dfdbf
	.xword	0xb752f9927af6ff40
	.xword	0x10c826393d06c452
	.xword	0xce86d04a904be98e
	.xword	0x03c3b3189ed2699a
	.xword	0x656694d28b112b6f
	.xword	0x0fbccf2a280d2a4d
	.xword	0x6eb7496c1f84898f
	.xword	0xb03e68fee2cd5cf4
	.xword	0x8fe74d41344f7e21
	.xword	0x87d03087057be3a7
	.align 0x20000
	.data
data_start_5:

	.xword	0x7866a22c4e865df8
	.xword	0xf211377532bf686e
	.xword	0xeadb77a35f291326
	.xword	0xa31f00b4e4c34a42
	.xword	0xd3cd094adfd08400
	.xword	0x27a037f86600e42e
	.xword	0x567ebb1f17149559
	.xword	0xe98b9b22ae6436cb
	.xword	0xcea9ce01bd087ef4
	.xword	0xb0c4a77c19d8f01b
	.xword	0x3e70a596ab663cf4
	.xword	0xb0323a527d9ac852
	.xword	0xd5797b2ea1737a40
	.xword	0x26ac16687b6483f4
	.xword	0x13740af0e490c440
	.xword	0xdbc27685764e74b1
	.xword	0x55fd4581fc0c21ad
	.xword	0x9a341403d3a50d15
	.xword	0xe83c94bb159e5874
	.xword	0xf401d12484207238
	.xword	0xa9c415e04e6ffb06
	.xword	0x4f12536911ed6e85
	.xword	0xe2a64fe67ccb581a
	.xword	0xbbb4cae0c2ca20d7
	.xword	0xb6c9ae3c8315cf04
	.xword	0xe16e54c899cbe33d
	.xword	0x868ce7ea935cabde
	.xword	0xf845d048752f1deb
	.xword	0x87473926172119cc
	.xword	0x5b5f1e436caac5ea
	.xword	0x38ef4e75ea960455
	.xword	0x84cf05d7d4cedd2d
	.xword	0x8f73270196da7343
	.xword	0x2e8d95cba7f5b6b7
	.xword	0x5e6770c1e514248f
	.xword	0xaecc979bd5f9bb73
	.xword	0x7a00aadc2ca04a65
	.xword	0x1eb5508fa8b66679
	.xword	0x40fd3f5f19fd8a50
	.xword	0xfa4b341bb4ae5c3b
	.xword	0xab246f770d59c7fc
	.xword	0xd05e73513fa2bb6d
	.xword	0xf38b070af9b20da1
	.xword	0xd3b008056078339a
	.xword	0xa33760a1051a744e
	.xword	0x57f58bedbb422cd5
	.xword	0xce99d48246e550f3
	.xword	0x36795005f743d2d1
	.xword	0x0fc2419e7466f9f1
	.xword	0xa447854c9e58cb07
	.xword	0x6aafa0ce57cc9583
	.xword	0x880b5ca99bdc0bbb
	.xword	0x7d531c27629df78b
	.xword	0xb8a608b366abbb51
	.xword	0x4d43e3939ce4d967
	.xword	0xb117006582523513
	.xword	0xaafa9a6fe5473080
	.xword	0xd5687fd1cd4f18e3
	.xword	0xf93bf6a1c363dda6
	.xword	0xee0e35a6dd76fd95
	.xword	0xf5eb17557a216102
	.xword	0xed8162f1fc8ea8dc
	.xword	0xaf44f5b927cd68a0
	.xword	0xe595e58114ab8a40
	.xword	0x6acc6778513740ff
	.xword	0xa04300f250a8f35d
	.xword	0x4af271782a28d2f1
	.xword	0xaddc54e7e674032b
	.xword	0x84e212bdd17aae32
	.xword	0x258b191b1fe22686
	.xword	0x1eb861e7cbe4de81
	.xword	0x1a8ffdbc500fd503
	.xword	0x664c8be24284dcf4
	.xword	0x67466f8c1aabb758
	.xword	0xe78c1ed8df14de35
	.xword	0xecd757ef9e55b867
	.xword	0xe6d831b98bcacd2e
	.xword	0xbd2a0b2c4b86ef7d
	.xword	0x8bf685267699454f
	.xword	0x880c07a1ea788ac4
	.xword	0x79ad663b5325e172
	.xword	0x6dd571a10898eaac
	.xword	0xd80289f2d84a41af
	.xword	0xc53c492f4944ab6c
	.xword	0x06292e4aca8f3ccc
	.xword	0xdf0f38273f6539cf
	.xword	0x43e34fcbb25a616b
	.xword	0xe0ccc1ecdf50e2b6
	.xword	0xe9a97a823edf1267
	.xword	0xce2c582fc539b99c
	.xword	0xf9ee65f21ec53549
	.xword	0xf25c493a0f4232a7
	.xword	0x017cdbc01c74760a
	.xword	0x54f6570abc8f520e
	.xword	0x59cd966a03c307ba
	.xword	0xc954e7eb273ff9a5
	.xword	0x2fa9b5a3cf8e0925
	.xword	0xf7ea731a5483c4ab
	.xword	0x9cea2459a2e83225
	.xword	0x57373d2e58e48630
	.xword	0xe03e8934c81c1ef4
	.xword	0xf54795d1f51b34ca
	.xword	0x4f9c24f0576b85b5
	.xword	0x42fee752d366acf7
	.xword	0x48fdbf3a17468f8f
	.xword	0x2f02e9c312277708
	.xword	0x52bce54aa76a96e7
	.xword	0x4c0128fb0ee767bb
	.xword	0xba7d15f9a0b40c6b
	.xword	0x3bca70c68cfc5bc1
	.xword	0x88ea64e314a7a3ac
	.xword	0x8906f681531b223f
	.xword	0xda2586cdad7ce85f
	.xword	0x1d2dd5bebd62fa67
	.xword	0x26dd64f07cc0e5ca
	.xword	0x585f7db6d5366b81
	.xword	0xc90c51ff3558ad55
	.xword	0xfb3aecf5d6644846
	.xword	0xb23162f66833631e
	.xword	0x49d22101dc826eb6
	.xword	0x577afa87894dd994
	.xword	0x6ba2d4a68284573d
	.xword	0xea98078b80beb187
	.xword	0x3cd6aa3fc347d46d
	.xword	0x06a9b8cce08de324
	.xword	0x041aae366be070d7
	.xword	0x3bc644ba9c790104
	.xword	0x2f49b18cfde65cc4
	.xword	0x42d52f16e50d11a8
	.xword	0x2f79bc641459da2f
	.xword	0x028084f38c6de736
	.xword	0xe3060cf0e20e233b
	.xword	0x5a48589601a5adfa
	.xword	0xaf834be54e881af7
	.xword	0x40eba7f1e19221bc
	.xword	0x0de22e07e7eef7b9
	.xword	0x5649048bbb03c11d
	.xword	0x35a5035b599c8de7
	.xword	0xdc8bc3066d55c66a
	.xword	0x2a36149963a89bef
	.xword	0x82ba6d759a89482c
	.xword	0x70b48f5cd5459e60
	.xword	0x9f2bd4ad0ebef0a3
	.xword	0x1d15e712eed38af5
	.xword	0x3fb94617e89aa038
	.xword	0xf741b2836e9dfdb5
	.xword	0xb6940956f605c23f
	.xword	0xcc386006a4b3107c
	.xword	0x443e2bbb3f00e5f7
	.xword	0x13091d57c6906dbd
	.xword	0x53ac1edb322413ed
	.xword	0x0426d9ecb370cc7c
	.xword	0x23127233e6d8e1d7
	.xword	0x71b27c96a1336e0b
	.xword	0x7e77dc23cbd630b2
	.xword	0x39a6536b97331061
	.xword	0xe39ae6f7949717bb
	.xword	0xb842e3f63cd817df
	.xword	0xf56c1d8e68d1ad47
	.xword	0xf187194d870c93a5
	.xword	0xd7bee277f348eb45
	.xword	0xf3b3b2f328a8211c
	.xword	0x439d11c019bfec5b
	.xword	0xa8b0a505f5ca3b83
	.xword	0xd0fb6b277c1ef430
	.xword	0x4d0fdfbbb60a4d2d
	.xword	0xf691b97bd7f7240e
	.xword	0xe158e321b9dbeea5
	.xword	0xf20a3bb8b81f6a3c
	.xword	0x8a93d3646192df53
	.xword	0xf4a6de2e87aff4cc
	.xword	0x26ae15254a14a5a1
	.xword	0xeb1995fac5747356
	.xword	0xe39b4c706a12b250
	.xword	0x501dc70eefd8499f
	.xword	0x58c0feb6c3f67969
	.xword	0x690b94706233eeca
	.xword	0x820e928423a705b6
	.xword	0x860dd934254208b6
	.xword	0x7577b6a9a1db7cda
	.xword	0xead429cf057d802b
	.xword	0xb16707c4d8c9fea5
	.xword	0x8323910dcd213ad5
	.xword	0x3d0a171e5be06bde
	.xword	0x64cfb142ec9b31af
	.xword	0x40dfce88719e97fa
	.xword	0x10521dfa16749ef1
	.xword	0xb82c6a188fda6bde
	.xword	0x65f755cf2fd5ca7a
	.xword	0x527542a406ef1e7c
	.xword	0x71d4badd4747ac17
	.xword	0xe1ef73d5f91f5ca5
	.xword	0x413e207b566518e1
	.xword	0x4f607e7c69d8a860
	.xword	0x35ae476ea97c2b07
	.xword	0xe9c42be54ace4da1
	.xword	0x6543ea397be53ec6
	.xword	0xb237da9b4e11845c
	.xword	0x49ff31558d1c2a24
	.xword	0x57d1fb803d3d456a
	.xword	0x2a207b17d54beec9
	.xword	0xc0ae84df38c02bba
	.xword	0xfbd08dbb1fabcdb8
	.xword	0x43966ee9d9537421
	.xword	0x6279d58299f781e3
	.xword	0x9cdfa5cfbf85223d
	.xword	0x27680fe049e688de
	.xword	0xc5b168be81f11bf0
	.xword	0xe070030d2487ae7b
	.xword	0xbcc951626216b3b6
	.xword	0x32e8f4a398bb7ff6
	.xword	0x88296e0aba521ecd
	.xword	0xbaefeb8bb5e175fc
	.xword	0x6b858b46433775bf
	.xword	0xfbb9faa2edfb68d8
	.xword	0x5c62df2ab902814d
	.xword	0x0d11ec4225989ed3
	.xword	0xff86fd2ffdd5574f
	.xword	0xc4794d4c0357d033
	.xword	0x0b05aab5262776f3
	.xword	0x0eecba31c6ff7183
	.xword	0x8f1f416e1ee754b4
	.xword	0x232c5c53f8b3fa1c
	.xword	0x20acd1b545447fcc
	.xword	0x3b1f9e2a80095458
	.xword	0x6a911ab6b523ec91
	.xword	0x92147838ac1f9fd7
	.xword	0x0b656b8fba25b1bf
	.xword	0x1d3316fc601c2e78
	.xword	0x94be00529c9913b9
	.xword	0xc810b0ba35c9240c
	.xword	0x913218deb82d88ca
	.xword	0x78e4c521a217160c
	.xword	0x66ed041f27ae56fc
	.xword	0x336687059e2dddeb
	.xword	0x53fd43b08c1ce745
	.xword	0x65e510d029688f21
	.xword	0xc906d1bccf2f036e
	.xword	0xb8e17c52e1d2e08c
	.xword	0xbb553876d5803f59
	.xword	0x1d34a2ee0f227947
	.xword	0x82358fba1c1f18c3
	.xword	0x48734fd4afdad86a
	.xword	0x0f133d220ba84ef3
	.xword	0x1665fa3104bb141f
	.xword	0x74f604e695d5f5cf
	.xword	0x00cc6f0ca8b2beb8
	.xword	0x31b466ed2ee50363
	.xword	0xd403c3ee9f74117e
	.xword	0x4d530d288f3fac1f
	.xword	0x7f15486e56cb9de7
	.xword	0xd16068515a1b25f0
	.xword	0x01ba7be18280cd9f
	.xword	0x58816e8c9b88a22c
	.xword	0xfd34f54e0d7bd6da
	.xword	0x57abd7d9810c6d64
	.align 0x40000
	.data
data_start_6:

	.xword	0x421fd76754badabb
	.xword	0x2a43272ce5f2b78a
	.xword	0x1f522a3890e06945
	.xword	0xb701bbffb56c0159
	.xword	0x0c74cc8d28d95922
	.xword	0xa8677a1228bf3da6
	.xword	0x00b9d711c80d9010
	.xword	0x48ec2464e7cc05c1
	.xword	0xc54d2c6ca2360282
	.xword	0x96dd964cafabf954
	.xword	0x5f9ac72a3eda1357
	.xword	0x58f8a85bc658b4dc
	.xword	0x3ad89026569ca30d
	.xword	0xaa2b84fa03ccc04f
	.xword	0xa09b670c7d16c7bf
	.xword	0x068c0adb27ee2121
	.xword	0xdea56e0ed458b2d1
	.xword	0x867b2892c5460bf0
	.xword	0xa17ef06771923ce2
	.xword	0x1e3030279d362508
	.xword	0x1bcfe53686ad3632
	.xword	0x2a7664a72a619d13
	.xword	0x1a291d8714b818cd
	.xword	0x2db786a297647297
	.xword	0xd54acdf4b59b23b1
	.xword	0xb63002cd21b2e843
	.xword	0xbb0edc8493267f33
	.xword	0xd95420c5a58b9a47
	.xword	0xd4780667c41276e5
	.xword	0x5271ebd49533a85f
	.xword	0x1b2b92925a8f5df4
	.xword	0xeab0f9c1cac66d34
	.xword	0x705a27a89e0f7186
	.xword	0x54b848fa77887010
	.xword	0xd4d7b2a66401137c
	.xword	0x15c1c994aef828b3
	.xword	0xa9d880385aa36ed9
	.xword	0xfcba6efe17af85f7
	.xword	0x1bf70256323fab16
	.xword	0x6fe750db1480801f
	.xword	0x8e2a489815b8abd9
	.xword	0xf5efec0f2cf79bb0
	.xword	0x7ecdcd6d0873b3e8
	.xword	0xebb440bf8fae6401
	.xword	0x373a29a6cea4ab2c
	.xword	0x7119a3e82545423c
	.xword	0x92e856c5c7122108
	.xword	0xab865ea5884c5d46
	.xword	0x244b548d238e1451
	.xword	0x42dcd1d2a0bfe35c
	.xword	0xa385b0d888a4e968
	.xword	0x02ef065a93fc6031
	.xword	0x939b545a7d60f587
	.xword	0x1a3762c975b2eb52
	.xword	0xc588d60c0b2970a0
	.xword	0xb0d756773300dea7
	.xword	0x7a00268de3380e20
	.xword	0x5e90025c60250a1e
	.xword	0x51af7cd837a0f12a
	.xword	0xecf9e0d0c94ea622
	.xword	0x97c0bc800e907330
	.xword	0x09a03b88b82d47c8
	.xword	0x0c9d846d70ff86ea
	.xword	0xc5381ed1ae524d20
	.xword	0x97fce67930f11c90
	.xword	0x19345a31951ecce4
	.xword	0x52019f81ad5ceacb
	.xword	0x60e7ed0e54d91618
	.xword	0x2f95dfa88f0318df
	.xword	0x8b7406e2c16d0863
	.xword	0x125bc1c114af6349
	.xword	0xc9d832ce27879717
	.xword	0xb86bc4e47e317c9b
	.xword	0xd3b92c641fbc9574
	.xword	0x9d67f4b4e6843261
	.xword	0xe617640e65d71ee0
	.xword	0xcae8a45bf1a5d437
	.xword	0x41bc24d58df2cb91
	.xword	0xc60dfb2f4a703411
	.xword	0x684bbfc9ab8a68ae
	.xword	0xc6b0d502393c27c3
	.xword	0x21b5f3ee75e71db1
	.xword	0xb34db5d2a3b42a13
	.xword	0x5fe213b07dc93277
	.xword	0x3ce3ba70106832c9
	.xword	0x7b6b010e3641680c
	.xword	0x438f782c59ff0558
	.xword	0x821c3c7d2c0d40f9
	.xword	0xde298c743aaaa7de
	.xword	0x22929c5af69114b2
	.xword	0x82024d9f69bf8a18
	.xword	0xbf77421073f0c794
	.xword	0x950ef8e6d729bcfa
	.xword	0x01e589e3d6005848
	.xword	0x1ac3517dc9802ea9
	.xword	0x5b040103dcadffe4
	.xword	0xa5b3f21a5ccdd17b
	.xword	0xf189131c220a5b95
	.xword	0x24b48b4f345c0ea1
	.xword	0x59ce444098d8f752
	.xword	0xd6ec69f0831556c3
	.xword	0x9a4637b614eb907d
	.xword	0x264bddb2e6b35d3e
	.xword	0x2d80a40040155449
	.xword	0x96524e760fe61707
	.xword	0xea16825b95034304
	.xword	0x0df614de08d04017
	.xword	0x16a043dee1e3589d
	.xword	0x0697d4960e0d898d
	.xword	0xba9a3e59fce0376b
	.xword	0x7644f3a4697327cb
	.xword	0xf8c0ede9a039150b
	.xword	0x33b55f6ccf27c876
	.xword	0xbf0ba01f65a45d82
	.xword	0x236a7ca8228b2f98
	.xword	0x3563d20690a9ba8f
	.xword	0x6b870f3ae245568d
	.xword	0xdb89e58520a7044e
	.xword	0x8cdefb8f1f62d75c
	.xword	0x5d2510247bf7e079
	.xword	0x77c778f366c2f933
	.xword	0xd686aef94b3ccfbb
	.xword	0x3cf54615a8addd68
	.xword	0xae44492dbeeab5b3
	.xword	0xd121eac8349665cd
	.xword	0xcef2feb65b5acf8b
	.xword	0xc89600341a37765c
	.xword	0xb48fd4fc9966c417
	.xword	0x2ae9b2232cf8010c
	.xword	0x51e8017bb92b7077
	.xword	0x275eda524ccb0d22
	.xword	0x061fc62ca67b11df
	.xword	0x52a7645831e24187
	.xword	0x55716faa13631b97
	.xword	0x8982de970d58bcdf
	.xword	0x4e27a56a1f79c6d8
	.xword	0xfb63ef98fdd5cd1e
	.xword	0x74c61c008ffa1185
	.xword	0xfaf33c0ff65ff224
	.xword	0x6f16368593a9f85e
	.xword	0xf8cc10a555b1bbc6
	.xword	0xa51ad28611277108
	.xword	0x94c2f0384956bc90
	.xword	0x1be2fb991a68305c
	.xword	0xaad5f1721f1b8d87
	.xword	0xfa537122cabae820
	.xword	0x58cb46213cf0bfb4
	.xword	0x07a76009d59d5f60
	.xword	0xc8403c1ba332e0da
	.xword	0x98c3db552cf505f5
	.xword	0xa494b07a92735144
	.xword	0x7d84ea780a892a88
	.xword	0xf5a84abfd9896b34
	.xword	0x3ee49685809a7a7d
	.xword	0xebe328d48f802d4e
	.xword	0x725e2004762a5254
	.xword	0x6afa6a24babbbb5f
	.xword	0x71be28278d7430c7
	.xword	0x17ce80e7ba636298
	.xword	0x7d4239b1e4c1f777
	.xword	0xb31aafc011f45a7e
	.xword	0xa7a42c763258583c
	.xword	0x6427660bdcb7c28d
	.xword	0xfb6e6095c0eadd42
	.xword	0xbffc5a132f153d21
	.xword	0x5542d410758c526c
	.xword	0xae263d4f8cf9a163
	.xword	0xeb13f691ab6a1d1f
	.xword	0x00eac37342cd76af
	.xword	0xc3aed235f9c03530
	.xword	0xf1976192dc03a7f4
	.xword	0xc0a164544ce72d18
	.xword	0x2967331550312557
	.xword	0x7964d4ef036d293e
	.xword	0xc95565f59976cb39
	.xword	0x24318b90900dacef
	.xword	0x1577a1c7cbbcffd1
	.xword	0xaa60816139e3d98c
	.xword	0x45e7b618513b4ac7
	.xword	0xe88ee8709a5ce565
	.xword	0x59a392fe3bbafc47
	.xword	0x403bce95a481e8ad
	.xword	0x01937aad1009a48c
	.xword	0x20ff745af3628ec8
	.xword	0xefb02d763e7548a5
	.xword	0x1cb967b85ff48b44
	.xword	0x01101a4f4a9b1052
	.xword	0xc3faee9fb5402316
	.xword	0xafd1b27619589e75
	.xword	0xf15a36425e5884d9
	.xword	0xf9ae71652d379e50
	.xword	0xf049d2f9b1b8fe75
	.xword	0x41d3ced027e2257a
	.xword	0xbc106528591524ec
	.xword	0x7b3af4ac6ca0e292
	.xword	0x87bee0d3c05caded
	.xword	0xb00ac804fedb1b80
	.xword	0xbab6ab7a5bb3262b
	.xword	0xc0f51c42199b2375
	.xword	0xc155912afcd19e24
	.xword	0xdcd986e0ff4c367b
	.xword	0xd2898a54bbb97714
	.xword	0x11bdc6da010ba30e
	.xword	0xd00c6e63883e361d
	.xword	0x7af950231541faba
	.xword	0x3cd1d95d8545e071
	.xword	0x9e9708f4a2d98c78
	.xword	0x9700a9e1d61b234f
	.xword	0x0c8adf38310b1a7c
	.xword	0x173e6fe3850808b2
	.xword	0xfdfdf8c9b1c3831c
	.xword	0xb9579345097455e6
	.xword	0xe8c68c5da3bb3907
	.xword	0x84d43da182e0e4b2
	.xword	0xd4d09b8f937d28d4
	.xword	0x3fc82091ac745b86
	.xword	0xe7fff93417c6138c
	.xword	0xf3047eb40a3fefc7
	.xword	0xce0551371de047aa
	.xword	0x29fbd5bb23565e23
	.xword	0xdb6e282d6dc4dd62
	.xword	0xec1ff23b55a54bf4
	.xword	0x8c34876157c3e745
	.xword	0x9adc0bdd9a5d137d
	.xword	0x55a4c62c5b71740f
	.xword	0x3e54030d659069c4
	.xword	0xa0642380ea6b3fea
	.xword	0x2e95998b58421bbd
	.xword	0x14d94791a661e6c2
	.xword	0xecba1116df31ba3c
	.xword	0x5a8193ff947027fc
	.xword	0x8553ef90c32b0cde
	.xword	0x3994a13c1305977c
	.xword	0x93e912fdb1d1aa4c
	.xword	0x00f4bd583aea9ec4
	.xword	0xa698a5a2ebab1f76
	.xword	0x4f232d1e85e1f204
	.xword	0x7fcfeb100a398c86
	.xword	0x3b7f73da9c847295
	.xword	0x2e380f48f4f5c3fa
	.xword	0x1c196ac3d3a03f1f
	.xword	0x1caf3f4e5efcb4eb
	.xword	0xe63538bac4eaa498
	.xword	0xe810633550f37fe0
	.xword	0x6ac262cf3ac7df1b
	.xword	0xa60212ff76e753aa
	.xword	0x1558196cb8b82766
	.xword	0x2408726af4378999
	.xword	0xf43919f850890930
	.xword	0xe0923741a6c6a3e8
	.xword	0xd57d778f54503115
	.xword	0xda89bc5b0438e568
	.xword	0x33467c8933feae98
	.xword	0x1e43d4394c9d1f57
	.xword	0x96f3f6ba5e64690f
	.xword	0xd4debbcfe870e6db
	.align 0x80000
	.data
data_start_7:

	.xword	0xe0e9971cd918bc80
	.xword	0x630d73efaca878d9
	.xword	0x82578b2c61eb185a
	.xword	0xaa2fc546b33a5f25
	.xword	0x6260b06b18ea6b1a
	.xword	0x3aebe6c6e025e3ac
	.xword	0x8895aafddea7e1c5
	.xword	0x700a55f5554565c4
	.xword	0x8af4fbfe8408c4cb
	.xword	0x901af7bb2e748dcf
	.xword	0x3616b84b1a1e0287
	.xword	0x99d9254bc562ee12
	.xword	0xd3b3c708975b8416
	.xword	0xf5d2c9672ea43523
	.xword	0xfcd159d181ec052d
	.xword	0x12b94a46649049f6
	.xword	0x98580aeb267bea5f
	.xword	0x18872bfc72a197e8
	.xword	0x45569704ae7c3093
	.xword	0x17420811ed212b90
	.xword	0xa62d9b1664ff28be
	.xword	0x4a568d48d6a754a0
	.xword	0x8a309de07b26aea5
	.xword	0x2c6e673f45b9d722
	.xword	0xda6327961f6646fe
	.xword	0xc4debe7886595162
	.xword	0x03f5e127a57db1c2
	.xword	0x48cd5ec6b5986b64
	.xword	0x13738873f73be18b
	.xword	0xbb7b0d151f878df6
	.xword	0xeab9526122975736
	.xword	0xcc0c0009d26ee3ad
	.xword	0xcfdeac6959045e3d
	.xword	0x57cd9f4b5876f61d
	.xword	0x972d75170feb3fe7
	.xword	0x3cf32bd8af3d22dd
	.xword	0x30bb40cbb2d5597f
	.xword	0xfae4826e777c1cfd
	.xword	0x5e524598bd60873a
	.xword	0x90a386b461a1e57a
	.xword	0x1034bbf24b08b47a
	.xword	0x8428872aa4f5334c
	.xword	0x97342564c877c6c7
	.xword	0xcf75bb9bcdd1e101
	.xword	0xa6aaed05e167190c
	.xword	0xbfa9fbd9116b8770
	.xword	0x4e2b9151b4c920a4
	.xword	0x7bdeeda2b79fdf23
	.xword	0x0d4a05a09612c83e
	.xword	0x67dc89e5d9231532
	.xword	0xba436fe4d0c5b3f4
	.xword	0xe67270316da68bd4
	.xword	0x46d92f69ce79c605
	.xword	0xa598c549851d148a
	.xword	0x1bd3e89d6260a28a
	.xword	0xc7025239ffb11017
	.xword	0xd099f15d1d42ed64
	.xword	0x3d74113350ba8bc1
	.xword	0x993aa183be1ba2d3
	.xword	0x99afe93c0b2220cd
	.xword	0x2d20c62aafb217f3
	.xword	0xaa8fa70e58d5b8e7
	.xword	0xea84e14c4e6b74af
	.xword	0x14bb3fdf625448b3
	.xword	0x173c25085e4c3d8d
	.xword	0x9849980b0ad541cc
	.xword	0x83bf0532e3618e9e
	.xword	0xdf56fac888257a03
	.xword	0x24950a046851dbf0
	.xword	0xc8874ab98544f2f6
	.xword	0x2fcdfb6e754526c1
	.xword	0x48f67bda4cc22357
	.xword	0xd055a23778e7520f
	.xword	0xefbea72aec4b2b4d
	.xword	0x779e75b7088eeff8
	.xword	0xd2c47614042c9580
	.xword	0xfc92fe32d43b3112
	.xword	0x658bc77f557481a1
	.xword	0x7870f424f04e510b
	.xword	0xa794afd937425ec4
	.xword	0x14867f40f187e701
	.xword	0x4c89ff917b99c76d
	.xword	0xc3153d80d725a54c
	.xword	0x1cfa11bda3bc1ad1
	.xword	0x4342a2bc9e79751e
	.xword	0xb28cb30b78951042
	.xword	0x69854d5f7748b409
	.xword	0xc091558efaa61bb5
	.xword	0x18f4f62ba31104b0
	.xword	0x763059f9947ca3dd
	.xword	0x539ac5155cbb9177
	.xword	0x196eb0a498c09ed4
	.xword	0x9c3505bc1e72bd68
	.xword	0x7921525ab5ed4dce
	.xword	0xf5f6b275c2fbf24f
	.xword	0x57415c14e1877637
	.xword	0x6f3406e868ec8ad5
	.xword	0xa7bb538af20eecda
	.xword	0x0cf6a197d9989eac
	.xword	0x6cf81476ca9b89ad
	.xword	0x05e89ad26de8b0da
	.xword	0xc7904b88fa4651ef
	.xword	0x34934766ee13d69f
	.xword	0xe17b9df5b4703658
	.xword	0x3de190a27722c0f5
	.xword	0xb9ca2391673bc8e0
	.xword	0xbc228eb7a3f19650
	.xword	0xce367c679a6b870b
	.xword	0x0df96db57a701d8f
	.xword	0xe5469049f8054f7b
	.xword	0x582ae39ea982ed29
	.xword	0xcc73c44b40291b37
	.xword	0x7f98dabb5dc8873e
	.xword	0xc973a1700e279240
	.xword	0x0047a449ff3b100f
	.xword	0x97bd5bf58e90fe21
	.xword	0xdea4475b26a53e44
	.xword	0xbe89fc11948237f3
	.xword	0xa87bc12c783cee1b
	.xword	0x37e8a633a600e3bb
	.xword	0xaccd8bc9f1cff17e
	.xword	0x8637dd42d06dccb9
	.xword	0xf08fd1bfc59d7731
	.xword	0x9a3bf1462b676682
	.xword	0x0c7c84b0cfc8569d
	.xword	0x8cb4463094b181df
	.xword	0xc0b6b9656f745260
	.xword	0x3c6fe336e99c6152
	.xword	0xdd6c4009d0d54f90
	.xword	0x84a76f5eadff9d46
	.xword	0x1aa525875fa71b1c
	.xword	0x770e78a9d32d3005
	.xword	0xa500cddae7c2f50d
	.xword	0xfe9ba2ef76c6931e
	.xword	0x864e42e89fed9369
	.xword	0x69f2caa3a81a1e7b
	.xword	0x5811f69f2f26cb70
	.xword	0x136b53f53e4f2e70
	.xword	0xac7a84cd0f370ffe
	.xword	0xa1e1de9ff74f034a
	.xword	0xb996e153c377a973
	.xword	0xc8d323999d2b4c09
	.xword	0xb6e6bcde824f7115
	.xword	0xccb3d79106cf9f02
	.xword	0x04a399d4043d1385
	.xword	0x4fe1c4fa3c4c7220
	.xword	0xd92d700f5b33f2dc
	.xword	0xeb579753f1b113e4
	.xword	0xee2b2e4533f6f8c4
	.xword	0xe2d2ac4f21e3df28
	.xword	0x7feea0a5bfbbd700
	.xword	0xdcb898143aedb520
	.xword	0xa72e7f2d8ebc00ea
	.xword	0x43ded04066e7f711
	.xword	0x7c304f5b80b576eb
	.xword	0xa035a135ad6ead70
	.xword	0x60de0cf1bf5f407a
	.xword	0x604b7d9f121604d8
	.xword	0x9d5e280ffc257972
	.xword	0x00fb8ded50a3aaa0
	.xword	0x9eca86e1beca8aed
	.xword	0xe864ba973afe1bfe
	.xword	0xcc25c159a1b6c3a0
	.xword	0x4637d4d4a85ecd94
	.xword	0xc66cc59fcec9755c
	.xword	0xc786730cfdc7449b
	.xword	0xe768c19cfdb925cb
	.xword	0xe399e5632cac238d
	.xword	0xbe6b0e7eef215b80
	.xword	0xa39e66f5cfd0d7b0
	.xword	0xf12f73cbc3e94d9f
	.xword	0xb99827a8f45845fc
	.xword	0x9488ee683477cdcc
	.xword	0x38b1c0648297bb1c
	.xword	0x321411958866a63b
	.xword	0xa854328c730d9636
	.xword	0xe7af381688267e0c
	.xword	0x8c1c16c145241596
	.xword	0x191153c7bb73a248
	.xword	0x7a92f0d731d290d2
	.xword	0xc1894eb6703f6791
	.xword	0x40bf710f7ee945a0
	.xword	0x45ec98bbc0ff6156
	.xword	0xd300d92144a9ea22
	.xword	0xcdd5d17b5e2c9d8f
	.xword	0x8bb5d652ca72951a
	.xword	0x898c02882a7181ef
	.xword	0x758e1ff7666a0c1f
	.xword	0x8835af5fbb2b7b04
	.xword	0x995ab557a3b4be5e
	.xword	0x34fb0655f347c37c
	.xword	0xcddb63f164d4e529
	.xword	0x65f3face71405bb7
	.xword	0x8d8b458c54297023
	.xword	0xb2abc0fdd1a5f0bd
	.xword	0xf6d12dceb4e67072
	.xword	0xdd42fa1ec7daf089
	.xword	0x39227e2150f65bf2
	.xword	0x8493a6fd2ff48f2c
	.xword	0xe5048f6ad1f4d131
	.xword	0xda6abf16f08cdac0
	.xword	0xc4a7aea214b9bf15
	.xword	0xbfff22fda293a8da
	.xword	0x049a26af17c8ffb5
	.xword	0x96dee1362484cf79
	.xword	0x1bcf4c057e7dbf52
	.xword	0x82915bd8d0b609ad
	.xword	0x4df7e6a6a8d7b445
	.xword	0x8a0789aaf9c1b5cd
	.xword	0xbb124f9f1bde759d
	.xword	0xb1f79a57d92dcf3d
	.xword	0x79caa27a8c691f27
	.xword	0xd7bcd1e77342c958
	.xword	0x292c447068a64194
	.xword	0x62b1dd558b90566c
	.xword	0xb7a0671cb23a72e0
	.xword	0xd03b8713ebcfe29d
	.xword	0x3ae56e4c2cf96096
	.xword	0x98d7c8429aecec10
	.xword	0x55e861db5aee57a1
	.xword	0x12b057c3be21ec9c
	.xword	0x5d42bfbe0abadc8b
	.xword	0xff0640ca0b7dcce9
	.xword	0x9d1e8a4ee6fae6a9
	.xword	0x958e435f7d4988aa
	.xword	0x9caf681b6bddc171
	.xword	0x11585c9ee392893d
	.xword	0x4fe45e3f64b5cc0e
	.xword	0x597fcb12377746c5
	.xword	0x0f3ad0e384988da8
	.xword	0xfb43acfc8cf0f1c9
	.xword	0x9fda2f1b718fa7a3
	.xword	0x83083c10ac01685c
	.xword	0x1de40d761003cf7d
	.xword	0x8aba350592144077
	.xword	0x1171547c639db3ad
	.xword	0xf9da508d3b1b857b
	.xword	0x9b74542b7ed4d558
	.xword	0x3ff81826b9124b9a
	.xword	0x557a1cce98d860b9
	.xword	0xc803a88a8a810171
	.xword	0x1018de24aa4d89ce
	.xword	0xa48ed321d4a497c7
	.xword	0x64d8cb7203e89632
	.xword	0xfde51d3421240181
	.xword	0x03fe9184556394ab
	.xword	0x6deda3bfb1061fc9
	.xword	0x32a5907898c0c281
	.xword	0xeffa6d407d67154a
	.xword	0xe95581a2e45056ce
	.xword	0x467464147b8a9b78
	.xword	0x6bf8093c7987e96f
	.xword	0xb77ee9cd98f693ac
	.xword	0x207e52a028ec3d50
	.xword	0x0edda10fc2cff522
	.xword	0xd08867bcae904eb6



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
