// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_5.s
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
   random seed:	679984334
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

	setx 0xbbbe3334c2d1d6fa, %g1, %g0
	setx 0x519a8375d8c4dd6e, %g1, %g1
	setx 0x2fff3e37dc6cdc9c, %g1, %g2
	setx 0x6949e09b028864c4, %g1, %g3
	setx 0xfbe75caca9323a3d, %g1, %g4
	setx 0xad515ce85f60713b, %g1, %g5
	setx 0x29bef9865bbc1774, %g1, %g6
	setx 0x70e0e520baced2df, %g1, %g7
	setx 0x3cc52f0614931e2b, %g1, %r16
	setx 0x6a10d691863dfa9e, %g1, %r17
	setx 0xe4bf364d27b9c1df, %g1, %r18
	setx 0x717acf60aa47029c, %g1, %r19
	setx 0xe762bc28d6515c64, %g1, %r20
	setx 0x23f2a235c3bc8c29, %g1, %r21
	setx 0x20139df417a5cfab, %g1, %r22
	setx 0x3895d2d5d1d8c512, %g1, %r23
	setx 0x46197177d6b88106, %g1, %r24
	setx 0xc031baf077dcb8b7, %g1, %r25
	setx 0x5cac156d99d83247, %g1, %r26
	setx 0x23be034b93fe7d22, %g1, %r27
	setx 0xd7f414d95c581a18, %g1, %r28
	setx 0x2c3d2b1c2b1ed31b, %g1, %r29
	setx 0x793217c8cbd460d0, %g1, %r30
	setx 0xd2c2ae9325847291, %g1, %r31
	save
	setx 0x3ba34fceffbce18c, %g1, %r16
	setx 0xce97614f653a29a6, %g1, %r17
	setx 0xe7d3daf09ab98714, %g1, %r18
	setx 0x529affae39083390, %g1, %r19
	setx 0x59fdf314312b6e01, %g1, %r20
	setx 0xa17439c21c749b17, %g1, %r21
	setx 0x5c643f3dd02584ee, %g1, %r22
	setx 0x556ce9c64a1ec9b0, %g1, %r23
	setx 0xe0844a75ac28d39b, %g1, %r24
	setx 0xb74d7cf00b106170, %g1, %r25
	setx 0x64b305808856438d, %g1, %r26
	setx 0xf8c8aeae7a96fe58, %g1, %r27
	setx 0xa404de6efc684120, %g1, %r28
	setx 0x729fabf014d7676f, %g1, %r29
	setx 0x2c9cb48fd0752ece, %g1, %r30
	setx 0xd25dcb378ccf3bfe, %g1, %r31
	save
	setx 0x07da3e6753144e7a, %g1, %r16
	setx 0xeb7895f3df112592, %g1, %r17
	setx 0xac715c7df3e8056a, %g1, %r18
	setx 0x615d4ae12b2e6622, %g1, %r19
	setx 0xf3ef1e0c5c452dce, %g1, %r20
	setx 0x69d96f67105bd9b8, %g1, %r21
	setx 0x0fdf60fdcefca55a, %g1, %r22
	setx 0x4ce2064426422028, %g1, %r23
	setx 0x736448157ad9955e, %g1, %r24
	setx 0xec901de7d1708bca, %g1, %r25
	setx 0x7df4c7b9ba81530f, %g1, %r26
	setx 0x86fda17c97f6451d, %g1, %r27
	setx 0x662e985fc44309c4, %g1, %r28
	setx 0xde18484b61c44b22, %g1, %r29
	setx 0x05bf4a51d13aaebb, %g1, %r30
	setx 0xd6ef03edeafb8bbc, %g1, %r31
	save
	setx 0x3f1424f8955674f5, %g1, %r16
	setx 0x11e4f74822e5fb30, %g1, %r17
	setx 0xf7358a1086de9bd1, %g1, %r18
	setx 0x6eb09e9329c9efde, %g1, %r19
	setx 0xf5cbb6af6f81e006, %g1, %r20
	setx 0x9c45e6c54d21cf08, %g1, %r21
	setx 0x4d30b77be6201aa1, %g1, %r22
	setx 0x7df8aaca8902d0a3, %g1, %r23
	setx 0x869497e8ab33ffa4, %g1, %r24
	setx 0x76a20c9bf049b62b, %g1, %r25
	setx 0xdc17cd8bfc9b1e4f, %g1, %r26
	setx 0x289b47b116415011, %g1, %r27
	setx 0x7bf0a2d047f2bff5, %g1, %r28
	setx 0xcae1e6862fe1fd41, %g1, %r29
	setx 0x3c811afb93723f1e, %g1, %r30
	setx 0xc0d91d27a9d4a395, %g1, %r31
	save
	setx 0xae6cff3b21a9ea12, %g1, %r16
	setx 0x683c0aa7fea8419c, %g1, %r17
	setx 0xe719b21d7f4ab761, %g1, %r18
	setx 0x2f4e33cfed56f816, %g1, %r19
	setx 0x9681ee55c3792c55, %g1, %r20
	setx 0xc27cbe894eb02a2a, %g1, %r21
	setx 0x5f5a4e9de4486206, %g1, %r22
	setx 0x4959dc2c16324cbf, %g1, %r23
	setx 0x774686c424f148a0, %g1, %r24
	setx 0x525af212dad20ee0, %g1, %r25
	setx 0xdff7ce2e8417a551, %g1, %r26
	setx 0x05389b18e7b2e3bc, %g1, %r27
	setx 0xd48f151ef48d4774, %g1, %r28
	setx 0x59892e87c2022266, %g1, %r29
	setx 0x01a6bed46b71d49a, %g1, %r30
	setx 0x873863e0bc6da772, %g1, %r31
	save
	setx 0x36f68795a3714026, %g1, %r16
	setx 0x52aba053554d5686, %g1, %r17
	setx 0xd3b7723cc98a6ce3, %g1, %r18
	setx 0x24b1d6883843a5ca, %g1, %r19
	setx 0x217a697c5ce09271, %g1, %r20
	setx 0x09366b1349973fbf, %g1, %r21
	setx 0x9756d8d9f211dbb1, %g1, %r22
	setx 0xe6aabb4b7966dfa4, %g1, %r23
	setx 0xda91e74483e10b11, %g1, %r24
	setx 0x665b89d570c453bb, %g1, %r25
	setx 0x2353034a4ec07d5d, %g1, %r26
	setx 0x25249363c9d99c2a, %g1, %r27
	setx 0x3bf3083c76c1d7c4, %g1, %r28
	setx 0xf6ea5408756a397a, %g1, %r29
	setx 0x0b7b3837222c7b29, %g1, %r30
	setx 0x87483a5cc4272ff3, %g1, %r31
	save
	setx 0x7227b2bb7f0cf87e, %g1, %r16
	setx 0xe3290f4e6d13835d, %g1, %r17
	setx 0x410ffcb587ae8008, %g1, %r18
	setx 0x172bd7e3f25c535c, %g1, %r19
	setx 0x11b6fea8aaf435cc, %g1, %r20
	setx 0x0d4d551071ecef7f, %g1, %r21
	setx 0x651de6c679d335fb, %g1, %r22
	setx 0xc93d3c132c5232cb, %g1, %r23
	setx 0x6ae9902b53ef2f4f, %g1, %r24
	setx 0x65e7b4d6b8ce536b, %g1, %r25
	setx 0xf6c971575ee63dc0, %g1, %r26
	setx 0x08f2ca756f7075e8, %g1, %r27
	setx 0x83f2c92716e98138, %g1, %r28
	setx 0xafa7b8ccdf65e9d0, %g1, %r29
	setx 0x52dc25e2317262ac, %g1, %r30
	setx 0xffad70e5942085e8, %g1, %r31
	save
	setx 0xe666bb323acfb676, %g1, %r16
	setx 0x34cc02af1690a3c3, %g1, %r17
	setx 0xbee1f393e6b15b78, %g1, %r18
	setx 0xab66ddb5b952d52d, %g1, %r19
	setx 0x666171a3bf02fc96, %g1, %r20
	setx 0xfc5609a72ec6c897, %g1, %r21
	setx 0xc15413f077452384, %g1, %r22
	setx 0x9d082c14e95f1559, %g1, %r23
	setx 0x8aece8b30c4a6f82, %g1, %r24
	setx 0x703d1df7c93c1cac, %g1, %r25
	setx 0xee646afaddba72f7, %g1, %r26
	setx 0x419454e4c304a798, %g1, %r27
	setx 0xca44bfe2b6482b3b, %g1, %r28
	setx 0xb1b08cd0ec666f0d, %g1, %r29
	setx 0xf8730e902207f16c, %g1, %r30
	setx 0x9765921de9d05ddc, %g1, %r31
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
	.word 0xbde521bf  ! 1: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe46034  ! 2: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb4042020  ! 5: ADD_I	add 	%r16, 0x0020, %r26
	.word 0xb5e5204c  ! 7: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e42080  ! 10: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde56079  ! 11: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x5ea57ddb00002988, %g1, %r10
	.word 0x819a8000  ! 14: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe521c3  ! 16: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe46198  ! 18: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb83c61c8  ! 20: XNOR_I	xnor 	%r17, 0x01c8, %r28
	.word 0xbde420dd  ! 21: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe4a145  ! 23: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xbe3460d6  ! 27: ORN_I	orn 	%r17, 0x00d6, %r31
	.word 0xbde5e07a  ! 28: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf540000  ! 35: RDPR_GL	<illegal instruction>
	.word 0x8995219a  ! 36: WRPR_TICK_I	wrpr	%r20, 0x019a, %tick
	.word 0x8795219e  ! 38: WRPR_TT_I	wrpr	%r20, 0x019e, %tt
	.word 0xb40c0000  ! 40: AND_R	and 	%r16, %r0, %r26
	.word 0xb1e5e022  ! 48: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbea50000  ! 51: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xb2c40000  ! 53: ADDCcc_R	addccc 	%r16, %r0, %r25
	.word 0xbbe4a12b  ! 54: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8195a06b  ! 55: WRPR_TPC_I	wrpr	%r22, 0x006b, %tpc
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1e5  ! 62: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9508000  ! 65: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56054  ! 70: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56045  ! 75: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e5e18f  ! 77: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e059  ! 85: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb500000  ! 87: RDPR_TPC	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xb5504000  ! 90: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4a1d9  ! 92: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d95a0bd  ! 95: WRPR_PSTATE_I	wrpr	%r22, 0x00bd, %pstate
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e460da  ! 99: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x77ff8529000069d7, %g1, %r10
	.word 0x819a8000  ! 101: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1520000  ! 103: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0058000  ! 105: ADD_R	add 	%r22, %r0, %r24
	.word 0xb5e52163  ! 106: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7641800  ! 109: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd510000  ! 112: RDPR_TICK	<illegal instruction>
	.word 0xb9e4e10c  ! 113: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb151c000  ! 114: RDPR_TL	<illegal instruction>
	.word 0xbbe5a0bc  ! 115: SAVE_I	save	%r22, 0x0001, %r29
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 132: RDPR_GL	<illegal instruction>
	.word 0xb9510000  ! 137: RDPR_TICK	<illegal instruction>
	.word 0xbde5a1c0  ! 140: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e014  ! 143: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe4e05c  ! 147: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0xbde5a02d  ! 159: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x958e4e1400009b10, %g1, %r10
	.word 0x819a8000  ! 163: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0e1  ! 166: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1a5  ! 171: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf508000  ! 172: RDPR_TSTATE	<illegal instruction>
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461a7  ! 175: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5a1d4  ! 177: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe421e1  ! 183: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e561f4  ! 186: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e4203a  ! 188: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb8c50000  ! 193: ADDCcc_R	addccc 	%r20, %r0, %r28
	.word 0xbbe561c6  ! 194: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e002  ! 202: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e560e9  ! 203: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5a0b5  ! 205: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde561df  ! 206: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb4ad0000  ! 210: ANDNcc_R	andncc 	%r20, %r0, %r26
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4615d  ! 212: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4609c  ! 216: SAVE_I	save	%r17, 0x0001, %r28
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 222: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9e42015  ! 223: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5602f  ! 224: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb884a11e  ! 230: ADDcc_I	addcc 	%r18, 0x011e, %r28
	.word 0x8394a1d6  ! 231: WRPR_TNPC_I	wrpr	%r18, 0x01d6, %tnpc
	.word 0xbfe5e1ef  ! 238: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5508000  ! 253: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e42059  ! 255: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5217b  ! 258: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbe354000  ! 259: ORN_R	orn 	%r21, %r0, %r31
	.word 0xb5508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0x879420a3  ! 268: WRPR_TT_I	wrpr	%r16, 0x00a3, %tt
	.word 0xb550c000  ! 270: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0x83942189  ! 277: WRPR_TNPC_I	wrpr	%r16, 0x0189, %tnpc
	.word 0xbbe420dd  ! 281: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde56179  ! 283: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e461d3  ! 284: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r22
	.word 0x8194a074  ! 298: WRPR_TPC_I	wrpr	%r18, 0x0074, %tpc
	.word 0xbbe420dc  ! 299: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4a155  ! 300: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe42063  ! 301: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe420a9  ! 302: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb0c44000  ! 305: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xb9e42183  ! 306: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5a0dc  ! 307: SAVE_I	save	%r22, 0x0001, %r28
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520a3  ! 309: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e46030  ! 310: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e42069  ! 314: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb835216d  ! 318: SUBC_I	orn 	%r20, 0x016d, %r28
	.word 0xbfe42111  ! 319: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5e050  ! 320: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42007  ! 325: SAVE_I	save	%r16, 0x0001, %r27
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5618b  ! 332: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbd50c000  ! 334: RDPR_TT	<illegal instruction>
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4207d  ! 339: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0x8594612f  ! 356: WRPR_TSTATE_I	wrpr	%r17, 0x012f, %tstate
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a007  ! 359: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xb9e52193  ! 362: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb884a08e  ! 366: ADDcc_I	addcc 	%r18, 0x008e, %r28
	.word 0xbd2c0000  ! 368: SLL_R	sll 	%r16, %r0, %r30
	.word 0xbb480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb6aca041  ! 376: ANDNcc_I	andncc 	%r18, 0x0041, %r27
	.word 0xbcc50000  ! 377: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xbbe5601c  ! 381: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x705d60cc00008989, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e5615e  ! 383: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e52006  ! 384: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7518000  ! 386: RDPR_PSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r17
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56143  ! 392: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 405: RDPR_TL	<illegal instruction>
	.word 0xba356070  ! 409: ORN_I	orn 	%r21, 0x0070, %r29
	.word 0xb3e46098  ! 410: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5a0ee  ! 413: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560b1  ! 419: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42008  ! 425: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde461c5  ! 427: SAVE_I	save	%r17, 0x0001, %r30
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95610a  ! 433: WRPR_PSTATE_I	wrpr	%r21, 0x010a, %pstate
	.word 0xb7504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xb5e56099  ! 436: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5a106  ! 438: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e560d3  ! 441: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5a19c  ! 442: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0xb7e52102  ! 449: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb351c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xb1e52099  ! 453: SAVE_I	save	%r20, 0x0001, %r24
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1f8  ! 459: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb60dc000  ! 464: AND_R	and 	%r23, %r0, %r27
	.word 0xbb510000  ! 467: RDPR_TICK	<illegal instruction>
	.word 0xbde5a0bc  ! 469: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5a1d7  ! 472: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684c000  ! 477: ADDcc_R	addcc 	%r19, %r0, %r27
	.word 0x8995a19f  ! 478: WRPR_TICK_I	wrpr	%r22, 0x019f, %tick
	.word 0xb3e42071  ! 489: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4e1da  ! 490: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x819421da  ! 491: WRPR_TPC_I	wrpr	%r16, 0x01da, %tpc
	.word 0xb7e5e191  ! 495: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb52ce001  ! 498: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb3e521b3  ! 502: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5e171  ! 503: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde560c2  ! 507: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe4a16c  ! 509: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a0b7  ! 514: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e46044  ! 515: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3540000  ! 517: RDPR_GL	<illegal instruction>
	setx	0xe5683e6100003f0f, %g1, %r10
	.word 0x819a8000  ! 519: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe56027  ! 522: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbf51c000  ! 525: RDPR_TL	<illegal instruction>
	.word 0xb9e4e10b  ! 526: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe461ef  ! 529: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe5a06d  ! 531: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4606a  ! 533: SAVE_I	save	%r17, 0x0001, %r31
	mov	1, %r12
	.word 0x8f930000  ! 539: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e4a192  ! 540: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba25a1d6  ! 541: SUB_I	sub 	%r22, 0x01d6, %r29
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e0ab  ! 544: WRPR_TPC_I	wrpr	%r23, 0x00ab, %tpc
	.word 0xbfe5a021  ! 545: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561b6  ! 549: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_0, %g1, %r16
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a087  ! 555: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e07c  ! 558: SAVE_I	save	%r23, 0x0001, %r25
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 566: RDPR_TT	<illegal instruction>
	.word 0xb6ad0000  ! 567: ANDNcc_R	andncc 	%r20, %r0, %r27
	.word 0xbd518000  ! 569: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r22
	.word 0x8d94e01b  ! 573: WRPR_PSTATE_I	wrpr	%r19, 0x001b, %pstate
	.word 0xb3e5e1d1  ! 577: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_7, %g1, %r16
	.word 0xbb641800  ! 580: MOVcc_R	<illegal instruction>
	.word 0xb7e4a1b7  ! 583: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5204e  ! 586: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb2b40000  ! 591: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xbac5c000  ! 594: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0x8595e0a4  ! 597: WRPR_TSTATE_I	wrpr	%r23, 0x00a4, %tstate
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e420dd  ! 601: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb50c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xb0340000  ! 603: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xbc0d20e5  ! 605: AND_I	and 	%r20, 0x00e5, %r30
	.word 0xb5e52058  ! 606: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbf500000  ! 607: RDPR_TPC	<illegal instruction>
	.word 0xb5e4a152  ! 608: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe561a4  ! 609: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba44e111  ! 616: ADDC_I	addc 	%r19, 0x0111, %r29
	.word 0xb9e4a0c1  ! 620: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5a05a  ! 621: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e560ce  ! 622: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_1, %g1, %r17
	.word 0xba950000  ! 628: ORcc_R	orcc 	%r20, %r0, %r29
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9561b5  ! 632: WRPR_PSTATE_I	wrpr	%r21, 0x01b5, %pstate
	.word 0xbd500000  ! 634: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 636: RDPR_TT	<illegal instruction>
	.word 0xbb540000  ! 639: RDPR_GL	<illegal instruction>
	.word 0xb7e5e0eb  ! 641: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8d9560bd  ! 645: WRPR_PSTATE_I	wrpr	%r21, 0x00bd, %pstate
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	.word 0x859520fe  ! 653: WRPR_TSTATE_I	wrpr	%r20, 0x00fe, %tstate
	.word 0xbde4e197  ! 654: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde56165  ! 655: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461c1  ! 658: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf50c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0x8195e144  ! 664: WRPR_TPC_I	wrpr	%r23, 0x0144, %tpc
	.word 0xb9e5e16c  ! 667: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb550c000  ! 669: RDPR_TT	<illegal instruction>
	.word 0xb5e42025  ! 672: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 674: RDPR_TPC	<illegal instruction>
	.word 0xb7520000  ! 677: RDPR_PIL	<illegal instruction>
	.word 0xb5e5e175  ! 680: SAVE_I	save	%r23, 0x0001, %r26
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e163  ! 688: WRPR_TT_I	wrpr	%r23, 0x0163, %tt
	.word 0xb4c4a13a  ! 691: ADDCcc_I	addccc 	%r18, 0x013a, %r26
	setx	data_start_2, %g1, %r17
	.word 0xbde4a15a  ! 696: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x83952018  ! 698: WRPR_TNPC_I	wrpr	%r20, 0x0018, %tnpc
	.word 0xb9e42047  ! 701: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a17d  ! 705: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_3, %g1, %r21
	.word 0xba9ca0c1  ! 710: XORcc_I	xorcc 	%r18, 0x00c1, %r29
	.word 0xbd520000  ! 711: RDPR_PIL	<illegal instruction>
	.word 0xb3e4600b  ! 719: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2248000  ! 721: SUB_R	sub 	%r18, %r0, %r25
	.word 0xb7504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xb645c000  ! 731: ADDC_R	addc 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e52084  ! 738: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb6ada182  ! 739: ANDNcc_I	andncc 	%r22, 0x0182, %r27
	.word 0xb7641800  ! 744: MOVcc_R	<illegal instruction>
	.word 0xb1e5e02f  ! 750: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520d0  ! 753: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4e075  ! 755: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_1, %g1, %r23
	.word 0x8195a038  ! 758: WRPR_TPC_I	wrpr	%r22, 0x0038, %tpc
	.word 0xbd50c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xb094219f  ! 761: ORcc_I	orcc 	%r16, 0x019f, %r24
	setx	0x96567df500000cc5, %g1, %r10
	.word 0x839a8000  ! 762: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e46048  ! 766: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe460a1  ! 767: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb8b48000  ! 769: SUBCcc_R	orncc 	%r18, %r0, %r28
	mov	0, %r12
	.word 0x8f930000  ! 770: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_4, %g1, %r17
	.word 0xbde420d2  ! 772: SAVE_I	save	%r16, 0x0001, %r30
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4614e  ! 777: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb2156017  ! 778: OR_I	or 	%r21, 0x0017, %r25
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0d6  ! 784: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e42100  ! 787: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e42167  ! 790: SAVE_I	save	%r16, 0x0001, %r26
	mov	2, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x5a474dff00009cd3, %g1, %r10
	.word 0x839a8000  ! 797: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1c3  ! 807: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24e0a8  ! 810: SUB_I	sub 	%r19, 0x00a8, %r31
	.word 0xb5e561ac  ! 814: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e5a08e  ! 815: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	setx	0x562d5c0900002e84, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe4a18a  ! 825: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e520cf  ! 826: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb77c4400  ! 827: MOVR_R	movre	%r17, %r0, %r27
	.word 0xbd500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0xbbe56010  ! 830: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e420a1  ! 831: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb204e18b  ! 836: ADD_I	add 	%r19, 0x018b, %r25
	.word 0xbde4e017  ! 837: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb014a186  ! 838: OR_I	or 	%r18, 0x0186, %r24
	.word 0xb5e561d5  ! 841: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8995a0bc  ! 842: WRPR_TICK_I	wrpr	%r22, 0x00bc, %tick
	setx	0x344841000000adf, %g1, %r10
	.word 0x839a8000  ! 845: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e421db  ! 847: SAVE_I	save	%r16, 0x0001, %r28
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 853: RDPR_TL	<illegal instruction>
	.word 0xb3e4219f  ! 854: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9500000  ! 859: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r21
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0xb3e4a02a  ! 873: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e42040  ! 880: SAVE_I	save	%r16, 0x0001, %r26
	setx	0xd72e8cfb00006b1d, %g1, %r10
	.word 0x819a8000  ! 881: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81946172  ! 890: WRPR_TPC_I	wrpr	%r17, 0x0172, %tpc
	.word 0xb5e4207b  ! 891: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe46098  ! 895: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e5e0d9  ! 896: SAVE_I	save	%r23, 0x0001, %r26
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5214f  ! 898: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3518000  ! 903: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xbfe4a1a7  ! 905: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a461f2  ! 914: SUBcc_I	subcc 	%r17, 0x01f2, %r25
	.word 0xb77da401  ! 915: MOVR_I	movre	%r22, 0x1, %r27
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e06a  ! 918: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4201b  ! 920: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e14d  ! 924: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3540000  ! 927: RDPR_GL	<illegal instruction>
	.word 0xbd480000  ! 928: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfe4614b  ! 930: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e420a5  ! 931: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7520000  ! 933: RDPR_PIL	<illegal instruction>
	.word 0xb1e4e17f  ! 935: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e42005  ! 937: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e561ba  ! 942: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde421f5  ! 944: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e561dc  ! 945: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbc3c8000  ! 946: XNOR_R	xnor 	%r18, %r0, %r30
	setx	data_start_5, %g1, %r22
	.word 0xb3508000  ! 954: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e42005  ! 957: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e039  ! 963: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8194e1da  ! 965: WRPR_TPC_I	wrpr	%r19, 0x01da, %tpc
	.word 0xb7e5a1dd  ! 972: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe52043  ! 974: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e4e17c  ! 977: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8194a163  ! 978: WRPR_TPC_I	wrpr	%r18, 0x0163, %tpc
	.word 0xbb510000  ! 980: RDPR_TICK	<illegal instruction>
	.word 0xb5504000  ! 981: RDPR_TNPC	<illegal instruction>
	.word 0xb9e56072  ! 990: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8994a0df  ! 993: WRPR_TICK_I	wrpr	%r18, 0x00df, %tick
	.word 0xb1e4e155  ! 994: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xb3540000  ! 3: RDPR_GL	rdpr	%-, %r25
	.word 0xb205a1bc  ! 5: ADD_I	add 	%r22, 0x01bc, %r25
	.word 0xfe254000  ! 12: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfa2da076  ! 13: STB_I	stb	%r29, [%r22 + 0x0076]
	setx	0xf70b031f00001d01, %g1, %r10
	.word 0x819a8000  ! 14: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf02dc000  ! 15: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xbc3da03d  ! 20: XNOR_I	xnor 	%r22, 0x003d, %r30
	.word 0xfe2c0000  ! 22: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xbf500000  ! 24: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xfc34e03e  ! 26: STH_I	sth	%r30, [%r19 + 0x003e]
	.word 0xb834a160  ! 27: ORN_I	orn 	%r18, 0x0160, %r28
	.word 0xf22c2156  ! 30: STB_I	stb	%r25, [%r16 + 0x0156]
	.word 0xf73d0000  ! 32: STDF_R	std	%f27, [%r0, %r20]
	.word 0xbd540000  ! 35: RDPR_GL	<illegal instruction>
	.word 0x8994e102  ! 36: WRPR_TICK_I	wrpr	%r19, 0x0102, %tick
	.word 0x8795e0ae  ! 38: WRPR_TT_I	wrpr	%r23, 0x00ae, %tt
	.word 0xb20c4000  ! 40: AND_R	and 	%r17, %r0, %r25
	.word 0xfe348000  ! 44: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf8744000  ! 47: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xfd3d4000  ! 50: STDF_R	std	%f30, [%r0, %r21]
	.word 0xb8a50000  ! 51: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xf0358000  ! 52: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xb6c44000  ! 53: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0x8195a1cc  ! 55: WRPR_TPC_I	wrpr	%r22, 0x01cc, %tpc
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6358000  ! 61: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf53c8000  ! 64: STDF_R	std	%f26, [%r0, %r18]
	.word 0xb1508000  ! 65: RDPR_TSTATE	rdpr	%tstate, %r24
	mov	2, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 87: RDPR_TPC	rdpr	%tpc, %r31
	setx	data_start_3, %g1, %r17
	.word 0xfa3d4000  ! 89: STD_R	std	%r29, [%r21 + %r0]
	.word 0xb1504000  ! 90: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e061  ! 95: WRPR_PSTATE_I	wrpr	%r23, 0x0061, %pstate
	.word 0xff3cc000  ! 96: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf4340000  ! 97: STH_R	sth	%r26, [%r16 + %r0]
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	setx	0xcab67be00009f44, %g1, %r10
	.word 0x819a8000  ! 101: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 103: RDPR_PIL	rdpr	%pil, %r28
	mov	1, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb4048000  ! 105: ADD_R	add 	%r18, %r0, %r26
	.word 0xf235606e  ! 107: STH_I	sth	%r25, [%r21 + 0x006e]
	.word 0xf025a08c  ! 108: STW_I	stw	%r24, [%r22 + 0x008c]
	.word 0xbb641800  ! 109: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf93cc000  ! 111: STDF_R	std	%f28, [%r0, %r19]
	.word 0xb9510000  ! 112: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb151c000  ! 114: RDPR_TL	<illegal instruction>
	.word 0xf825e069  ! 117: STW_I	stw	%r28, [%r23 + 0x0069]
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8340000  ! 123: STH_R	sth	%r28, [%r16 + %r0]
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 132: RDPR_GL	<illegal instruction>
	.word 0xf62ca1d0  ! 133: STB_I	stb	%r27, [%r18 + 0x01d0]
	.word 0xf2258000  ! 136: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xbf510000  ! 137: RDPR_TICK	<illegal instruction>
	.word 0xf234e01b  ! 141: STH_I	sth	%r25, [%r19 + 0x001b]
	.word 0xf2348000  ! 148: STH_R	sth	%r25, [%r18 + %r0]
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 158: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x5c0fec4f00009fd6, %g1, %r10
	.word 0x819a8000  ! 163: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 172: RDPR_TSTATE	rdpr	%tstate, %r25
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63c60bc  ! 181: STD_I	std	%r27, [%r17 + 0x00bc]
	.word 0xf235213c  ! 185: STH_I	sth	%r25, [%r20 + 0x013c]
	.word 0xfe3460f4  ! 190: STH_I	sth	%r31, [%r17 + 0x00f4]
	.word 0xfa2da097  ! 192: STB_I	stb	%r29, [%r22 + 0x0097]
	.word 0xbcc44000  ! 193: ADDCcc_R	addccc 	%r17, %r0, %r30
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 197: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfc3da1dc  ! 200: STD_I	std	%r30, [%r22 + 0x01dc]
	.word 0xf4248000  ! 201: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfe25c000  ! 204: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf13d8000  ! 209: STDF_R	std	%f24, [%r0, %r22]
	.word 0xbaac8000  ! 210: ANDNcc_R	andncc 	%r18, %r0, %r29
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24c000  ! 214: STW_R	stw	%r30, [%r19 + %r0]
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234e1f1  ! 220: STH_I	sth	%r25, [%r19 + 0x01f1]
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 222: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc7421e3  ! 226: STX_I	stx	%r30, [%r16 + 0x01e3]
	.word 0xb284a0ec  ! 230: ADDcc_I	addcc 	%r18, 0x00ec, %r25
	.word 0x8395e002  ! 231: WRPR_TNPC_I	wrpr	%r23, 0x0002, %tnpc
	.word 0xfa2d61eb  ! 235: STB_I	stb	%r29, [%r21 + 0x01eb]
	.word 0xff3c8000  ! 236: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf834216e  ! 237: STH_I	sth	%r28, [%r16 + 0x016e]
	.word 0xf435a1cd  ! 240: STH_I	sth	%r26, [%r22 + 0x01cd]
	.word 0xfe2561cf  ! 250: STW_I	stw	%r31, [%r21 + 0x01cf]
	.word 0xb7508000  ! 253: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf43c2036  ! 254: STD_I	std	%r26, [%r16 + 0x0036]
	.word 0xb8344000  ! 259: ORN_R	orn 	%r17, %r0, %r28
	.word 0xb5508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0xfe2d612e  ! 265: STB_I	stb	%r31, [%r21 + 0x012e]
	.word 0xf435a124  ! 267: STH_I	sth	%r26, [%r22 + 0x0124]
	.word 0x879521a2  ! 268: WRPR_TT_I	wrpr	%r20, 0x01a2, %tt
	.word 0xb750c000  ! 270: RDPR_TT	rdpr	%tt, %r27
	.word 0xb750c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xf82c4000  ! 273: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb5504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0x8394e196  ! 277: WRPR_TNPC_I	wrpr	%r19, 0x0196, %tnpc
	.word 0xf2348000  ! 279: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf224c000  ! 280: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfe34c000  ! 285: STH_R	sth	%r31, [%r19 + %r0]
	setx	data_start_5, %g1, %r21
	.word 0xf93cc000  ! 292: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfa2d4000  ! 293: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf675c000  ! 294: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfc3d8000  ! 295: STD_R	std	%r30, [%r22 + %r0]
	.word 0x8194214c  ! 298: WRPR_TPC_I	wrpr	%r16, 0x014c, %tpc
	.word 0xbac54000  ! 305: ADDCcc_R	addccc 	%r21, %r0, %r29
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3cc000  ! 313: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf42c60e2  ! 316: STB_I	stb	%r26, [%r17 + 0x00e2]
	.word 0xf53d21ee  ! 317: STDF_I	std	%f26, [0x01ee, %r20]
	.word 0xb834e19e  ! 318: SUBC_I	orn 	%r19, 0x019e, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c204a  ! 323: STB_I	stb	%r27, [%r16 + 0x004a]
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874e1eb  ! 326: STX_I	stx	%r28, [%r19 + 0x01eb]
	.word 0xf13ce0f1  ! 328: STDF_I	std	%f24, [0x00f1, %r19]
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63c21e6  ! 333: STD_I	std	%r27, [%r16 + 0x01e6]
	.word 0xb550c000  ! 334: RDPR_TT	rdpr	%tt, %r26
	.word 0xf43c20cb  ! 335: STD_I	std	%r26, [%r16 + 0x00cb]
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82de0d5  ! 340: STB_I	stb	%r28, [%r23 + 0x00d5]
	.word 0xf0240000  ! 341: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf024a006  ! 349: STW_I	stw	%r24, [%r18 + 0x0006]
	.word 0xf0748000  ! 350: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xfa7421de  ! 351: STX_I	stx	%r29, [%r16 + 0x01de]
	.word 0xb7518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0xfe24e175  ! 354: STW_I	stw	%r31, [%r19 + 0x0175]
	.word 0x85942023  ! 356: WRPR_TSTATE_I	wrpr	%r16, 0x0023, %tstate
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 360: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf03d8000  ! 363: STD_R	std	%r24, [%r22 + %r0]
	.word 0xb685607c  ! 366: ADDcc_I	addcc 	%r21, 0x007c, %r27
	.word 0xf73de03d  ! 367: STDF_I	std	%f27, [0x003d, %r23]
	.word 0xbd2dc000  ! 368: SLL_R	sll 	%r23, %r0, %r30
	.word 0xfe34c000  ! 370: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xb5480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbcade0ef  ! 376: ANDNcc_I	andncc 	%r23, 0x00ef, %r30
	.word 0xb8c40000  ! 377: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xf83d4000  ! 380: STD_R	std	%r28, [%r21 + %r0]
	setx	0x598bc5f200004d97, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9518000  ! 386: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf93c0000  ! 387: STDF_R	std	%f28, [%r0, %r16]
	setx	data_start_3, %g1, %r20
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 405: RDPR_TL	<illegal instruction>
	.word 0xbe35a06d  ! 409: ORN_I	orn 	%r22, 0x006d, %r31
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 416: STB_R	stb	%r24, [%r20 + %r0]
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3c4000  ! 423: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf22c0000  ! 424: STB_R	stb	%r25, [%r16 + %r0]
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 430: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf234e0e8  ! 432: STH_I	sth	%r25, [%r19 + 0x00e8]
	.word 0x8d9561e1  ! 433: WRPR_PSTATE_I	wrpr	%r21, 0x01e1, %pstate
	.word 0xb9504000  ! 435: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf82ca053  ! 437: STB_I	stb	%r28, [%r18 + 0x0053]
	.word 0xf2350000  ! 439: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfe350000  ! 440: STH_R	sth	%r31, [%r20 + %r0]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xf43421d1  ! 448: STH_I	sth	%r26, [%r16 + 0x01d1]
	.word 0xb951c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xfc2de137  ! 452: STB_I	stb	%r30, [%r23 + 0x0137]
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 456: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf0358000  ! 458: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xfa24e0ac  ! 461: STW_I	stw	%r29, [%r19 + 0x00ac]
	.word 0xfe242026  ! 463: STW_I	stw	%r31, [%r16 + 0x0026]
	.word 0xba0d4000  ! 464: AND_R	and 	%r21, %r0, %r29
	.word 0xfa7520eb  ! 465: STX_I	stx	%r29, [%r20 + 0x00eb]
	.word 0xfc2cc000  ! 466: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb3510000  ! 467: RDPR_TICK	<illegal instruction>
	.word 0xfa3461cf  ! 474: STH_I	sth	%r29, [%r17 + 0x01cf]
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484c000  ! 477: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0x8995e0a0  ! 478: WRPR_TICK_I	wrpr	%r23, 0x00a0, %tick
	.word 0xfc3c2117  ! 487: STD_I	std	%r30, [%r16 + 0x0117]
	.word 0x819460a9  ! 491: WRPR_TPC_I	wrpr	%r17, 0x00a9, %tpc
	.word 0xf53c0000  ! 492: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf4240000  ! 493: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf035a055  ! 496: STH_I	sth	%r24, [%r22 + 0x0055]
	.word 0xfd3c60b9  ! 497: STDF_I	std	%f30, [0x00b9, %r17]
	.word 0xb32de001  ! 498: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xf83c8000  ! 504: STD_R	std	%r28, [%r18 + %r0]
	.word 0xf024a1c0  ! 511: STW_I	stw	%r24, [%r18 + 0x01c0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3d60b6  ! 516: STD_I	std	%r30, [%r21 + 0x00b6]
	.word 0xb1540000  ! 517: RDPR_GL	rdpr	%-, %r24
	.word 0xfc248000  ! 518: STW_R	stw	%r30, [%r18 + %r0]
	setx	0xd051d88800001e0d, %g1, %r10
	.word 0x819a8000  ! 519: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4754000  ! 523: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xf074c000  ! 524: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xb151c000  ! 525: RDPR_TL	rdpr	%tl, %r24
	.word 0xf6748000  ! 530: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf73de021  ! 532: STDF_I	std	%f27, [0x0021, %r23]
	.word 0xf674a175  ! 534: STX_I	stx	%r27, [%r18 + 0x0175]
	.word 0xfe2d203a  ! 536: STB_I	stb	%r31, [%r20 + 0x003a]
	.word 0xf6256046  ! 537: STW_I	stw	%r27, [%r21 + 0x0046]
	mov	2, %r12
	.word 0x8f930000  ! 539: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc24a083  ! 541: SUB_I	sub 	%r18, 0x0083, %r30
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819521bf  ! 544: WRPR_TPC_I	wrpr	%r20, 0x01bf, %tpc
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 554: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf02420c1  ! 559: STW_I	stw	%r24, [%r16 + 0x00c1]
	.word 0xfd3c20ae  ! 560: STDF_I	std	%f30, [0x00ae, %r16]
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 566: RDPR_TT	rdpr	%tt, %r26
	.word 0xbcac4000  ! 567: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xf03d4000  ! 568: STD_R	std	%r24, [%r21 + %r0]
	.word 0xb1518000  ! 569: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r16
	.word 0xf53d4000  ! 572: STDF_R	std	%f26, [%r0, %r21]
	.word 0x8d95a198  ! 573: WRPR_PSTATE_I	wrpr	%r22, 0x0198, %pstate
	.word 0xfc75612a  ! 575: STX_I	stx	%r30, [%r21 + 0x012a]
	setx	data_start_6, %g1, %r19
	.word 0xb3641800  ! 580: MOVcc_R	<illegal instruction>
	.word 0xf42d8000  ! 581: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfd3ce0da  ! 582: STDF_I	std	%f30, [0x00da, %r19]
	.word 0xfe352099  ! 584: STH_I	sth	%r31, [%r20 + 0x0099]
	.word 0xf22ce16f  ! 585: STB_I	stb	%r25, [%r19 + 0x016f]
	.word 0xfc24e12e  ! 589: STW_I	stw	%r30, [%r19 + 0x012e]
	.word 0xff3c8000  ! 590: STDF_R	std	%f31, [%r0, %r18]
	.word 0xb6b48000  ! 591: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0xb0c58000  ! 594: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0x8594616e  ! 597: WRPR_TSTATE_I	wrpr	%r17, 0x016e, %tstate
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33da0e7  ! 599: STDF_I	std	%f25, [0x00e7, %r22]
	.word 0xf8250000  ! 600: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb750c000  ! 602: RDPR_TT	rdpr	%tt, %r27
	.word 0xb4348000  ! 603: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xb40c60c7  ! 605: AND_I	and 	%r17, 0x00c7, %r26
	.word 0xb5500000  ! 607: RDPR_TPC	<illegal instruction>
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24606b  ! 614: STW_I	stw	%r31, [%r17 + 0x006b]
	.word 0xb444e1e9  ! 616: ADDC_I	addc 	%r19, 0x01e9, %r26
	.word 0xfc25a009  ! 618: STW_I	stw	%r30, [%r22 + 0x0009]
	.word 0xf434e1ba  ! 619: STH_I	sth	%r26, [%r19 + 0x01ba]
	.word 0xf23d4000  ! 625: STD_R	std	%r25, [%r21 + %r0]
	setx	data_start_7, %g1, %r21
	.word 0xb8944000  ! 628: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xfc34205e  ! 630: STH_I	sth	%r30, [%r16 + 0x005e]
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94612b  ! 632: WRPR_PSTATE_I	wrpr	%r17, 0x012b, %pstate
	.word 0xfa75a089  ! 633: STX_I	stx	%r29, [%r22 + 0x0089]
	.word 0xbd500000  ! 634: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb350c000  ! 636: RDPR_TT	<illegal instruction>
	.word 0xf4240000  ! 638: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbf540000  ! 639: RDPR_GL	<illegal instruction>
	.word 0xf824a0c4  ! 640: STW_I	stw	%r28, [%r18 + 0x00c4]
	.word 0xf6250000  ! 643: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf23de105  ! 644: STD_I	std	%r25, [%r23 + 0x0105]
	.word 0x8d94608a  ! 645: WRPR_PSTATE_I	wrpr	%r17, 0x008a, %pstate
	.word 0xfa25e0cb  ! 646: STW_I	stw	%r29, [%r23 + 0x00cb]
	.word 0xfa344000  ! 647: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf83460eb  ! 648: STH_I	sth	%r28, [%r17 + 0x00eb]
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xf82d8000  ! 652: STB_R	stb	%r28, [%r22 + %r0]
	.word 0x859560cf  ! 653: WRPR_TSTATE_I	wrpr	%r21, 0x00cf, %tstate
	.word 0xf4240000  ! 656: STW_R	stw	%r26, [%r16 + %r0]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 660: RDPR_TT	rdpr	%tt, %r31
	.word 0x8194e049  ! 664: WRPR_TPC_I	wrpr	%r19, 0x0049, %tpc
	.word 0xf43d0000  ! 665: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf93dc000  ! 666: STDF_R	std	%f28, [%r0, %r23]
	.word 0xbf50c000  ! 669: RDPR_TT	rdpr	%tt, %r31
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 674: RDPR_TPC	<illegal instruction>
	.word 0xf024612c  ! 676: STW_I	stw	%r24, [%r17 + 0x012c]
	.word 0xbd520000  ! 677: RDPR_PIL	<illegal instruction>
	.word 0xfa258000  ! 679: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfe25a076  ! 681: STW_I	stw	%r31, [%r22 + 0x0076]
	.word 0xfe3d216a  ! 682: STD_I	std	%r31, [%r20 + 0x016a]
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3ce088  ! 685: STD_I	std	%r31, [%r19 + 0x0088]
	.word 0xfd3ce0f0  ! 686: STDF_I	std	%f30, [0x00f0, %r19]
	.word 0x879560be  ! 688: WRPR_TT_I	wrpr	%r21, 0x00be, %tt
	.word 0xb4c4e19f  ! 691: ADDCcc_I	addccc 	%r19, 0x019f, %r26
	setx	data_start_2, %g1, %r16
	.word 0x8394619f  ! 698: WRPR_TNPC_I	wrpr	%r17, 0x019f, %tnpc
	.word 0xfa25c000  ! 699: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf024c000  ! 700: STW_R	stw	%r24, [%r19 + %r0]
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3c4000  ! 707: STD_R	std	%r29, [%r17 + %r0]
	setx	data_start_1, %g1, %r18
	.word 0xf0740000  ! 709: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xbe9ca161  ! 710: XORcc_I	xorcc 	%r18, 0x0161, %r31
	.word 0xb7520000  ! 711: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb6254000  ! 721: SUB_R	sub 	%r21, %r0, %r27
	.word 0xf22c0000  ! 723: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf424208e  ! 726: STW_I	stw	%r26, [%r16 + 0x008e]
	.word 0xb3504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xfa3c605a  ! 728: STD_I	std	%r29, [%r17 + 0x005a]
	.word 0xfc348000  ! 729: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xba45c000  ! 731: ADDC_R	addc 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2ca0c0  ! 733: STB_I	stb	%r31, [%r18 + 0x00c0]
	.word 0xf83d0000  ! 735: STD_R	std	%r28, [%r20 + %r0]
	.word 0xb2ada012  ! 739: ANDNcc_I	andncc 	%r22, 0x0012, %r25
	.word 0xf43d6011  ! 740: STD_I	std	%r26, [%r21 + 0x0011]
	.word 0xbd641800  ! 744: MOVcc_R	<illegal instruction>
	.word 0xfc750000  ! 745: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf434e1ee  ! 748: STH_I	sth	%r26, [%r19 + 0x01ee]
	.word 0xfd3c21f5  ! 749: STDF_I	std	%f30, [0x01f5, %r16]
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0x8194e044  ! 758: WRPR_TPC_I	wrpr	%r19, 0x0044, %tpc
	.word 0xb950c000  ! 760: RDPR_TT	rdpr	%tt, %r28
	.word 0xb895e06b  ! 761: ORcc_I	orcc 	%r23, 0x006b, %r28
	setx	0x5ffc19a800002c8b, %g1, %r10
	.word 0x839a8000  ! 762: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcb44000  ! 769: SUBCcc_R	orncc 	%r17, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 770: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_0, %g1, %r21
	.word 0xf6252040  ! 773: STW_I	stw	%r27, [%r20 + 0x0040]
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1560ff  ! 778: OR_I	or 	%r21, 0x00ff, %r31
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c6190  ! 788: STB_I	stb	%r24, [%r17 + 0x0190]
	mov	0, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xd20fb2670000788a, %g1, %r10
	.word 0x839a8000  ! 797: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33da131  ! 806: STDF_I	std	%f25, [0x0131, %r22]
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb824a0d8  ! 810: SUB_I	sub 	%r18, 0x00d8, %r28
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ce1f0  ! 818: STB_I	stb	%r24, [%r19 + 0x01f0]
	setx	0xfe334123000028cb, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb57d8400  ! 827: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb3500000  ! 829: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf874e13c  ! 835: STX_I	stx	%r28, [%r19 + 0x013c]
	.word 0xb605e061  ! 836: ADD_I	add 	%r23, 0x0061, %r27
	.word 0xb6142019  ! 838: OR_I	or 	%r16, 0x0019, %r27
	.word 0xfc24c000  ! 840: STW_R	stw	%r30, [%r19 + %r0]
	.word 0x8995e1aa  ! 842: WRPR_TICK_I	wrpr	%r23, 0x01aa, %tick
	setx	0xbce8548b00004ec0, %g1, %r10
	.word 0x839a8000  ! 845: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22da134  ! 851: STB_I	stb	%r25, [%r22 + 0x0134]
	.word 0xbd51c000  ! 853: RDPR_TL	rdpr	%tl, %r30
	.word 0xfc240000  ! 857: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xf83ce107  ! 858: STD_I	std	%r28, [%r19 + 0x0107]
	.word 0xb3500000  ! 859: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r23
	.word 0xf6248000  ! 865: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf434e022  ! 867: STH_I	sth	%r26, [%r19 + 0x0022]
	.word 0xf0348000  ! 868: STH_R	sth	%r24, [%r18 + %r0]
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0xfa25e01f  ! 876: STW_I	stw	%r29, [%r23 + 0x001f]
	.word 0xf025e045  ! 877: STW_I	stw	%r24, [%r23 + 0x0045]
	.word 0xfe35c000  ! 879: STH_R	sth	%r31, [%r23 + %r0]
	setx	0x7ead404d00009c47, %g1, %r10
	.word 0x819a8000  ! 881: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf2246103  ! 888: STW_I	stw	%r25, [%r17 + 0x0103]
	.word 0x81946053  ! 890: WRPR_TPC_I	wrpr	%r17, 0x0053, %tpc
	.word 0xfe252066  ! 892: STW_I	stw	%r31, [%r20 + 0x0066]
	.word 0xf0756160  ! 893: STX_I	stx	%r24, [%r21 + 0x0160]
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 899: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfc74c000  ! 900: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfa748000  ! 902: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbd518000  ! 903: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf425219b  ! 906: STW_I	stw	%r26, [%r20 + 0x019b]
	.word 0xf03ca085  ! 909: STD_I	std	%r24, [%r18 + 0x0085]
	.word 0xfa2d61c8  ! 911: STB_I	stb	%r29, [%r21 + 0x01c8]
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4210d  ! 914: SUBcc_I	subcc 	%r16, 0x010d, %r29
	.word 0xbf7d2401  ! 915: MOVR_I	movre	%r20, 0x1, %r31
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035e0e2  ! 917: STH_I	sth	%r24, [%r23 + 0x00e2]
	.word 0xf475a1b6  ! 922: STX_I	stx	%r26, [%r22 + 0x01b6]
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 926: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xbd540000  ! 927: RDPR_GL	<illegal instruction>
	.word 0xb7480000  ! 928: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9520000  ! 933: RDPR_PIL	<illegal instruction>
	.word 0xfe342012  ! 934: STH_I	sth	%r31, [%r16 + 0x0012]
	.word 0xf42c6085  ! 939: STB_I	stb	%r26, [%r17 + 0x0085]
	.word 0xf2342059  ! 941: STH_I	sth	%r25, [%r16 + 0x0059]
	.word 0xb63d0000  ! 946: XNOR_R	xnor 	%r20, %r0, %r27
	setx	data_start_0, %g1, %r18
	.word 0xfe25c000  ! 952: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xbd508000  ! 954: RDPR_TSTATE	<illegal instruction>
	.word 0xf33c8000  ! 956: STDF_R	std	%f25, [%r0, %r18]
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a05b  ! 965: WRPR_TPC_I	wrpr	%r22, 0x005b, %tpc
	.word 0xfc2420bb  ! 966: STW_I	stw	%r30, [%r16 + 0x00bb]
	.word 0xfa24a0e3  ! 976: STW_I	stw	%r29, [%r18 + 0x00e3]
	.word 0x81942134  ! 978: WRPR_TPC_I	wrpr	%r16, 0x0134, %tpc
	.word 0xbb510000  ! 980: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb7504000  ! 981: RDPR_TNPC	<illegal instruction>
	.word 0xf424e1a9  ! 986: STW_I	stw	%r26, [%r19 + 0x01a9]
	.word 0xf03ca0ed  ! 989: STD_I	std	%r24, [%r18 + 0x00ed]
	.word 0x8994a1e3  ! 993: WRPR_TICK_I	wrpr	%r18, 0x01e3, %tick
	.word 0xf874a038  ! 995: STX_I	stx	%r28, [%r18 + 0x0038]
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75c000  ! 998: STX_R	stx	%r29, [%r23 + %r0]
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
	.word 0xbf540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb204e0c1  ! 5: ADD_I	add 	%r19, 0x00c1, %r25
	.word 0xf0050000  ! 6: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf2144000  ! 8: LDUH_R	lduh	[%r17 + %r0], %r25
	setx	0xde0c83b1000008d4, %g1, %r10
	.word 0x819a8000  ! 14: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb43c613f  ! 20: XNOR_I	xnor 	%r17, 0x013f, %r26
	.word 0xb7500000  ! 24: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb234e105  ! 27: ORN_I	orn 	%r19, 0x0105, %r25
	.word 0xf014a032  ! 31: LDUH_I	lduh	[%r18 + 0x0032], %r24
	.word 0xf31da021  ! 34: LDDF_I	ldd	[%r22, 0x0021], %f25
	.word 0xb1540000  ! 35: RDPR_GL	<illegal instruction>
	.word 0x8995e13f  ! 36: WRPR_TICK_I	wrpr	%r23, 0x013f, %tick
	.word 0x879521bd  ! 38: WRPR_TT_I	wrpr	%r20, 0x01bd, %tt
	.word 0xf445a090  ! 39: LDSW_I	ldsw	[%r22 + 0x0090], %r26
	.word 0xbc0c4000  ! 40: AND_R	and 	%r17, %r0, %r30
	.word 0xf81d8000  ! 43: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xfc4d60ca  ! 46: LDSB_I	ldsb	[%r21 + 0x00ca], %r30
	.word 0xbca48000  ! 51: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xbac44000  ! 53: ADDCcc_R	addccc 	%r17, %r0, %r29
	.word 0x8194a1ef  ! 55: WRPR_TPC_I	wrpr	%r18, 0x01ef, %tpc
	.word 0xf51d619f  ! 57: LDDF_I	ldd	[%r21, 0x019f], %f26
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 65: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 68: LDUW_R	lduw	[%r17 + %r0], %r30
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41c8000  ! 71: LDD_R	ldd	[%r18 + %r0], %r26
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa548000  ! 73: LDSH_R	ldsh	[%r18 + %r0], %r29
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15e052  ! 76: LDUH_I	lduh	[%r23 + 0x0052], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01c0000  ! 80: LDD_R	ldd	[%r16 + %r0], %r24
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c6066  ! 83: LDSB_I	ldsb	[%r17 + 0x0066], %r30
	.word 0xf044c000  ! 84: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xb3500000  ! 87: RDPR_TPC	rdpr	%tpc, %r25
	setx	data_start_6, %g1, %r19
	.word 0xbd504000  ! 90: RDPR_TNPC	<illegal instruction>
	.word 0xf2548000  ! 93: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0x8d94616b  ! 95: WRPR_PSTATE_I	wrpr	%r17, 0x016b, %pstate
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	setx	0x698d9a100009fc4, %g1, %r10
	.word 0x819a8000  ! 101: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf20ce17a  ! 102: LDUB_I	ldub	[%r19 + 0x017a], %r25
	.word 0xb3520000  ! 103: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb2054000  ! 105: ADD_R	add 	%r21, %r0, %r25
	.word 0xb7641800  ! 109: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd510000  ! 112: RDPR_TICK	<illegal instruction>
	.word 0xbf51c000  ! 114: RDPR_TL	<illegal instruction>
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654a063  ! 120: LDSH_I	ldsh	[%r18 + 0x0063], %r27
	.word 0xf2144000  ! 121: LDUH_R	lduh	[%r17 + %r0], %r25
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455a068  ! 125: LDSH_I	ldsh	[%r22 + 0x0068], %r26
	.word 0xf4152078  ! 126: LDUH_I	lduh	[%r20 + 0x0078], %r26
	.word 0xf60d8000  ! 129: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xfe1c4000  ! 131: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xb5540000  ! 132: RDPR_GL	<illegal instruction>
	.word 0xf81ce17d  ! 134: LDD_I	ldd	[%r19 + 0x017d], %r28
	.word 0xf71c21a0  ! 135: LDDF_I	ldd	[%r16, 0x01a0], %f27
	.word 0xb3510000  ! 137: RDPR_TICK	<illegal instruction>
	.word 0xfc4c8000  ! 139: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf31d4000  ! 150: LDDF_R	ldd	[%r21, %r0], %f25
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 156: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf31c8000  ! 157: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xb1504000  ! 158: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf80d2106  ! 162: LDUB_I	ldub	[%r20 + 0x0106], %r28
	setx	0xd3f4f9a00000884c, %g1, %r10
	.word 0x819a8000  ! 163: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1da04d  ! 167: LDDF_I	ldd	[%r22, 0x004d], %f31
	.word 0xfc1c4000  ! 169: LDD_R	ldd	[%r17 + %r0], %r30
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xfa0d8000  ! 173: LDUB_R	ldub	[%r22 + %r0], %r29
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8444000  ! 176: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xfa148000  ! 179: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xfa0c6015  ! 180: LDUB_I	ldub	[%r17 + 0x0015], %r29
	.word 0xfc5521f5  ! 187: LDSH_I	ldsh	[%r20 + 0x01f5], %r30
	.word 0xf44ce14f  ! 189: LDSB_I	ldsb	[%r19 + 0x014f], %r26
	.word 0xb0c44000  ! 193: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xf204a0ea  ! 195: LDUW_I	lduw	[%r18 + 0x00ea], %r25
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44e1ea  ! 198: LDSW_I	ldsw	[%r19 + 0x01ea], %r31
	.word 0xfe05e09a  ! 199: LDUW_I	lduw	[%r23 + 0x009a], %r31
	.word 0xf40461e4  ! 207: LDUW_I	lduw	[%r17 + 0x01e4], %r26
	.word 0xbeac8000  ! 210: ANDNcc_R	andncc 	%r18, %r0, %r31
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54a1b1  ! 213: LDSH_I	ldsh	[%r18 + 0x01b1], %r29
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 217: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf61d4000  ! 218: LDD_R	ldd	[%r21 + %r0], %r27
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 222: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf00421e8  ! 225: LDUW_I	lduw	[%r16 + 0x01e8], %r24
	.word 0xbe85a037  ! 230: ADDcc_I	addcc 	%r22, 0x0037, %r31
	.word 0x839560fa  ! 231: WRPR_TNPC_I	wrpr	%r21, 0x00fa, %tnpc
	.word 0xfe1d0000  ! 232: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xf80ce00b  ! 234: LDUB_I	ldub	[%r19 + 0x000b], %r28
	.word 0xf01d8000  ! 241: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf81c219d  ! 242: LDD_I	ldd	[%r16 + 0x019d], %r28
	.word 0xfa1ce041  ! 243: LDD_I	ldd	[%r19 + 0x0041], %r29
	.word 0xf40de1df  ! 248: LDUB_I	ldub	[%r23 + 0x01df], %r26
	.word 0xf44521d0  ! 249: LDSW_I	ldsw	[%r20 + 0x01d0], %r26
	.word 0xfe4d4000  ! 252: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb9508000  ! 253: RDPR_TSTATE	<illegal instruction>
	.word 0xb2348000  ! 259: ORN_R	orn 	%r18, %r0, %r25
	.word 0xb5508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0xfa0d2016  ! 262: LDUB_I	ldub	[%r20 + 0x0016], %r29
	.word 0x879460e3  ! 268: WRPR_TT_I	wrpr	%r17, 0x00e3, %tt
	.word 0xfa040000  ! 269: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xbb50c000  ! 270: RDPR_TT	<illegal instruction>
	.word 0xfa0d2106  ! 271: LDUB_I	ldub	[%r20 + 0x0106], %r29
	.word 0xb750c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0x839461b7  ! 277: WRPR_TNPC_I	wrpr	%r17, 0x01b7, %tnpc
	setx	data_start_4, %g1, %r22
	.word 0xf605c000  ! 297: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0x8195608a  ! 298: WRPR_TPC_I	wrpr	%r21, 0x008a, %tpc
	.word 0xb0c54000  ! 305: ADDCcc_R	addccc 	%r21, %r0, %r24
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb835210c  ! 318: SUBC_I	orn 	%r20, 0x010c, %r28
	.word 0xfc558000  ! 321: LDSH_R	ldsh	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245c000  ! 327: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xfc540000  ! 330: LDSH_R	ldsh	[%r16 + %r0], %r30
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 334: RDPR_TT	<illegal instruction>
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254a007  ! 338: LDSH_I	ldsh	[%r18 + 0x0007], %r25
	.word 0xf21c6025  ! 343: LDD_I	ldd	[%r17 + 0x0025], %r25
	.word 0xf41d61d1  ! 345: LDD_I	ldd	[%r21 + 0x01d1], %r26
	.word 0xf40da192  ! 348: LDUB_I	ldub	[%r22 + 0x0192], %r26
	.word 0xf404c000  ! 352: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb1518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0xf25da032  ! 355: LDX_I	ldx	[%r22 + 0x0032], %r25
	.word 0x85946022  ! 356: WRPR_TSTATE_I	wrpr	%r17, 0x0022, %tstate
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254e000  ! 358: LDSH_I	ldsh	[%r19 + 0x0000], %r25
	.word 0xbd500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xb685e134  ! 366: ADDcc_I	addcc 	%r23, 0x0134, %r27
	.word 0xbf2c8000  ! 368: SLL_R	sll 	%r18, %r0, %r31
	.word 0xf24de089  ! 369: LDSB_I	ldsb	[%r23 + 0x0089], %r25
	.word 0xbf480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf454613a  ! 374: LDSH_I	ldsh	[%r17 + 0x013a], %r26
	.word 0xb4aca0d8  ! 376: ANDNcc_I	andncc 	%r18, 0x00d8, %r26
	.word 0xb8c4c000  ! 377: ADDCcc_R	addccc 	%r19, %r0, %r28
	setx	0x7a76008e0000ec1f, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf815a1c0  ! 385: LDUH_I	lduh	[%r22 + 0x01c0], %r28
	.word 0xbb518000  ! 386: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xf65c0000  ! 390: LDX_R	ldx	[%r16 + %r0], %r27
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf25d213f  ! 395: LDX_I	ldx	[%r20 + 0x013f], %r25
	.word 0xfa55a022  ! 396: LDSH_I	ldsh	[%r22 + 0x0022], %r29
	.word 0xf11dc000  ! 397: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf4040000  ! 398: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xf255219d  ! 399: LDSH_I	ldsh	[%r20 + 0x019d], %r25
	.word 0xf0458000  ! 400: LDSW_R	ldsw	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	mov	0x117, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 405: RDPR_TL	<illegal instruction>
	.word 0xfe0d21b7  ! 406: LDUB_I	ldub	[%r20 + 0x01b7], %r31
	.word 0xfe05c000  ! 407: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xb03421dc  ! 409: ORN_I	orn 	%r16, 0x01dc, %r24
	.word 0xfc156041  ! 411: LDUH_I	lduh	[%r21 + 0x0041], %r30
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4dc000  ! 422: LDSB_R	ldsb	[%r23 + %r0], %r29
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91d60ca  ! 431: LDDF_I	ldd	[%r21, 0x00ca], %f28
	.word 0x8d94e019  ! 433: WRPR_PSTATE_I	wrpr	%r19, 0x0019, %pstate
	.word 0xf41c60b0  ! 434: LDD_I	ldd	[%r17 + 0x00b0], %r26
	.word 0xb5504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xf85cc000  ! 443: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf11d8000  ! 444: LDDF_R	ldd	[%r22, %r0], %f24
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xb151c000  ! 450: RDPR_TL	<illegal instruction>
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1dc000  ! 457: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xfe050000  ! 462: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xbc0d0000  ! 464: AND_R	and 	%r20, %r0, %r30
	.word 0xb3510000  ! 467: RDPR_TICK	<illegal instruction>
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe850000  ! 477: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0x89952019  ! 478: WRPR_TICK_I	wrpr	%r20, 0x0019, %tick
	.word 0xfa0c4000  ! 480: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf51c8000  ! 481: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf60cc000  ! 482: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfc5d8000  ! 483: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xfe0460e5  ! 484: LDUW_I	lduw	[%r17 + 0x00e5], %r31
	.word 0xff1d6021  ! 485: LDDF_I	ldd	[%r21, 0x0021], %f31
	.word 0xf65c6023  ! 488: LDX_I	ldx	[%r17 + 0x0023], %r27
	.word 0x8194207f  ! 491: WRPR_TPC_I	wrpr	%r16, 0x007f, %tpc
	.word 0xb72de001  ! 498: SLL_I	sll 	%r23, 0x0001, %r27
	.word 0xfc44c000  ! 499: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf61ce0f4  ! 500: LDD_I	ldd	[%r19 + 0x00f4], %r27
	.word 0xfe55a01a  ! 505: LDSH_I	ldsh	[%r22 + 0x001a], %r31
	.word 0xfe1c4000  ! 510: LDD_R	ldd	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3540000  ! 517: RDPR_GL	<illegal instruction>
	setx	0x446ff4200004993, %g1, %r10
	.word 0x819a8000  ! 519: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb951c000  ! 525: RDPR_TL	<illegal instruction>
	.word 0xf845e1f9  ! 528: LDSW_I	ldsw	[%r23 + 0x01f9], %r28
	mov	0, %r12
	.word 0x8f930000  ! 539: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe25a18e  ! 541: SUB_I	sub 	%r22, 0x018e, %r31
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195203a  ! 544: WRPR_TPC_I	wrpr	%r20, 0x003a, %tpc
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15e01d  ! 548: LDUH_I	lduh	[%r23 + 0x001d], %r29
	setx	data_start_0, %g1, %r17
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d60ce  ! 556: LDSB_I	ldsb	[%r21 + 0x00ce], %r28
	.word 0xf84d2063  ! 562: LDSB_I	ldsb	[%r20 + 0x0063], %r28
	.word 0xf014c000  ! 564: LDUH_R	lduh	[%r19 + %r0], %r24
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 566: RDPR_TT	<illegal instruction>
	.word 0xbead4000  ! 567: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xbb518000  ! 569: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0x8d95a043  ! 573: WRPR_PSTATE_I	wrpr	%r22, 0x0043, %pstate
	.word 0xfa540000  ! 578: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	data_start_2, %g1, %r19
	.word 0xb5641800  ! 580: MOVcc_R	<illegal instruction>
	.word 0xf61d8000  ! 587: LDD_R	ldd	[%r22 + %r0], %r27
	.word 0xb4b48000  ! 591: ORNcc_R	orncc 	%r18, %r0, %r26
	.word 0xf0140000  ! 592: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb2c5c000  ! 594: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0x859560b6  ! 597: WRPR_TSTATE_I	wrpr	%r21, 0x00b6, %tstate
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xba340000  ! 603: SUBC_R	orn 	%r16, %r0, %r29
	.word 0xf814e150  ! 604: LDUH_I	lduh	[%r19 + 0x0150], %r28
	.word 0xb40d6180  ! 605: AND_I	and 	%r21, 0x0180, %r26
	.word 0xb5500000  ! 607: RDPR_TPC	<illegal instruction>
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6454000  ! 612: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf65d4000  ! 613: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf80d2135  ! 615: LDUB_I	ldub	[%r20 + 0x0135], %r28
	.word 0xbe4520cb  ! 616: ADDC_I	addc 	%r20, 0x00cb, %r31
	.word 0xf44ca023  ! 623: LDSB_I	ldsb	[%r18 + 0x0023], %r26
	setx	data_start_7, %g1, %r16
	.word 0xb4950000  ! 628: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xfc55c000  ! 629: LDSH_R	ldsh	[%r23 + %r0], %r30
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94607d  ! 632: WRPR_PSTATE_I	wrpr	%r17, 0x007d, %pstate
	.word 0xb7500000  ! 634: RDPR_TPC	<illegal instruction>
	.word 0xf85dc000  ! 635: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb950c000  ! 636: RDPR_TT	<illegal instruction>
	.word 0xb7540000  ! 639: RDPR_GL	<illegal instruction>
	.word 0x8d956009  ! 645: WRPR_PSTATE_I	wrpr	%r21, 0x0009, %pstate
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51d610d  ! 650: LDDF_I	ldd	[%r21, 0x010d], %f26
	setx	data_start_4, %g1, %r21
	.word 0x8594a1da  ! 653: WRPR_TSTATE_I	wrpr	%r18, 0x01da, %tstate
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf31d61d2  ! 659: LDDF_I	ldd	[%r21, 0x01d2], %f25
	.word 0xbf50c000  ! 660: RDPR_TT	rdpr	%tt, %r31
	.word 0xf45421b5  ! 661: LDSH_I	ldsh	[%r16 + 0x01b5], %r26
	.word 0xf015c000  ! 662: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0x8194214f  ! 664: WRPR_TPC_I	wrpr	%r16, 0x014f, %tpc
	.word 0xb950c000  ! 669: RDPR_TT	rdpr	%tt, %r28
	.word 0xfd1dc000  ! 670: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf455c000  ! 671: LDSH_R	ldsh	[%r23 + %r0], %r26
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 674: RDPR_TPC	<illegal instruction>
	.word 0xb5520000  ! 677: RDPR_PIL	<illegal instruction>
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c213e  ! 684: LDX_I	ldx	[%r16 + 0x013e], %r30
	.word 0xf0140000  ! 687: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0x87956179  ! 688: WRPR_TT_I	wrpr	%r21, 0x0179, %tt
	.word 0xb2c5e110  ! 691: ADDCcc_I	addccc 	%r23, 0x0110, %r25
	.word 0xf64d4000  ! 692: LDSB_R	ldsb	[%r21 + %r0], %r27
	setx	data_start_5, %g1, %r23
	.word 0xf65de055  ! 695: LDX_I	ldx	[%r23 + 0x0055], %r27
	.word 0xfe1d6102  ! 697: LDD_I	ldd	[%r21 + 0x0102], %r31
	.word 0x83942151  ! 698: WRPR_TNPC_I	wrpr	%r16, 0x0151, %tnpc
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d6100  ! 703: LDSB_I	ldsb	[%r21 + 0x0100], %r31
	.word 0xf61c8000  ! 704: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0xf854a096  ! 706: LDSH_I	ldsh	[%r18 + 0x0096], %r28
	setx	data_start_4, %g1, %r19
	.word 0xba9de006  ! 710: XORcc_I	xorcc 	%r23, 0x0006, %r29
	.word 0xb5520000  ! 711: RDPR_PIL	<illegal instruction>
	.word 0xf64d0000  ! 712: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xf2048000  ! 713: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf44d0000  ! 718: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xbc240000  ! 721: SUB_R	sub 	%r16, %r0, %r30
	.word 0xf81d0000  ! 722: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xbf504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xfc05e110  ! 730: LDUW_I	lduw	[%r23 + 0x0110], %r30
	.word 0xb4450000  ! 731: ADDC_R	addc 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4444000  ! 736: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xfc1de13d  ! 737: LDD_I	ldd	[%r23 + 0x013d], %r30
	.word 0xbaac6163  ! 739: ANDNcc_I	andncc 	%r17, 0x0163, %r29
	.word 0xfc0de06d  ! 742: LDUB_I	ldub	[%r23 + 0x006d], %r30
	.word 0xbf641800  ! 744: MOVcc_R	<illegal instruction>
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c216d  ! 754: LDUB_I	ldub	[%r16 + 0x016d], %r25
	setx	data_start_4, %g1, %r20
	.word 0xfe05215b  ! 757: LDUW_I	lduw	[%r20 + 0x015b], %r31
	.word 0x8194a169  ! 758: WRPR_TPC_I	wrpr	%r18, 0x0169, %tpc
	.word 0xfd1cc000  ! 759: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xb950c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xb094a014  ! 761: ORcc_I	orcc 	%r18, 0x0014, %r24
	setx	0xf465599f00001c94, %g1, %r10
	.word 0x839a8000  ! 762: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4148000  ! 765: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfc554000  ! 768: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xb2b58000  ! 769: SUBCcc_R	orncc 	%r22, %r0, %r25
	mov	2, %r12
	.word 0x8f930000  ! 770: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_1, %g1, %r16
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6142141  ! 778: OR_I	or 	%r16, 0x0141, %r27
	.word 0xfe54c000  ! 779: LDSH_R	ldsh	[%r19 + %r0], %r31
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf31da1fa  ! 781: LDDF_I	ldd	[%r22, 0x01fa], %f25
	.word 0xf8140000  ! 782: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf04ce0a5  ! 783: LDSB_I	ldsb	[%r19 + 0x00a5], %r24
	.word 0xf71c0000  ! 785: LDDF_R	ldd	[%r16, %r0], %f27
	mov	2, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc440000  ! 792: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf01d2150  ! 794: LDD_I	ldd	[%r20 + 0x0150], %r24
	setx	0xe2050b8000005dc2, %g1, %r10
	.word 0x839a8000  ! 797: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04611b  ! 800: LDUW_I	lduw	[%r17 + 0x011b], %r30
	.word 0xf45ce173  ! 802: LDX_I	ldx	[%r19 + 0x0173], %r26
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 804: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfc044000  ! 805: LDUW_R	lduw	[%r17 + %r0], %r30
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2461fb  ! 810: SUB_I	sub 	%r17, 0x01fb, %r30
	.word 0xf20c4000  ! 812: LDUB_R	ldub	[%r17 + %r0], %r25
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	setx	0x349b428000000c8f, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb17c0400  ! 827: MOVR_R	movre	%r16, %r0, %r24
	.word 0xb5500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0xf60c20c6  ! 833: LDUB_I	ldub	[%r16 + 0x00c6], %r27
	.word 0xb404601a  ! 836: ADD_I	add 	%r17, 0x001a, %r26
	.word 0xbe15e040  ! 838: OR_I	or 	%r23, 0x0040, %r31
	.word 0x8994216a  ! 842: WRPR_TICK_I	wrpr	%r16, 0x016a, %tick
	.word 0xf454c000  ! 843: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xf0158000  ! 844: LDUH_R	lduh	[%r22 + %r0], %r24
	setx	0x4183d6f000008c9, %g1, %r10
	.word 0x839a8000  ! 845: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1d4000  ! 850: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xff1c2044  ! 852: LDDF_I	ldd	[%r16, 0x0044], %f31
	.word 0xb751c000  ! 853: RDPR_TL	<illegal instruction>
	.word 0xb1500000  ! 859: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r23
	.word 0xfe14210c  ! 866: LDUH_I	lduh	[%r16 + 0x010c], %r31
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0xf05d206d  ! 874: LDX_I	ldx	[%r20 + 0x006d], %r24
	setx	0xfdfb79f300003f45, %g1, %r10
	.word 0x819a8000  ! 881: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf014e0b1  ! 883: LDUH_I	lduh	[%r19 + 0x00b1], %r24
	.word 0xf61ca0ad  ! 885: LDD_I	ldd	[%r18 + 0x00ad], %r27
	.word 0xf20c6026  ! 886: LDUB_I	ldub	[%r17 + 0x0026], %r25
	.word 0xfc15a15d  ! 889: LDUH_I	lduh	[%r22 + 0x015d], %r30
	.word 0x8194614b  ! 890: WRPR_TPC_I	wrpr	%r17, 0x014b, %tpc
	.word 0xfe058000  ! 894: LDUW_R	lduw	[%r22 + %r0], %r31
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 903: RDPR_PSTATE	<illegal instruction>
	.word 0xfa556167  ! 910: LDSH_I	ldsh	[%r21 + 0x0167], %r29
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5e026  ! 914: SUBcc_I	subcc 	%r23, 0x0026, %r30
	.word 0xbf7ca401  ! 915: MOVR_I	movre	%r18, 0x1, %r31
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1d61bc  ! 919: LDDF_I	ldd	[%r21, 0x01bc], %f29
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 927: RDPR_GL	<illegal instruction>
	.word 0xbd480000  ! 928: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf4044000  ! 929: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xb9520000  ! 933: RDPR_PIL	<illegal instruction>
	.word 0xb83c0000  ! 946: XNOR_R	xnor 	%r16, %r0, %r28
	setx	data_start_1, %g1, %r20
	.word 0xfe0c0000  ! 951: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xfb1c0000  ! 953: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xb3508000  ! 954: RDPR_TSTATE	<illegal instruction>
	.word 0xf8058000  ! 955: LDUW_R	lduw	[%r22 + %r0], %r28
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61d20ee  ! 960: LDD_I	ldd	[%r20 + 0x00ee], %r27
	.word 0xf11c0000  ! 961: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xf6042113  ! 962: LDUW_I	lduw	[%r16 + 0x0113], %r27
	.word 0x8194a1dd  ! 965: WRPR_TPC_I	wrpr	%r18, 0x01dd, %tpc
	.word 0xfe0de1e0  ! 967: LDUB_I	ldub	[%r23 + 0x01e0], %r31
	.word 0xf61d0000  ! 968: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xf64c8000  ! 970: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf2144000  ! 975: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0x819460cf  ! 978: WRPR_TPC_I	wrpr	%r17, 0x00cf, %tpc
	.word 0xfb1d0000  ! 979: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xb9510000  ! 980: RDPR_TICK	<illegal instruction>
	.word 0xb5504000  ! 981: RDPR_TNPC	<illegal instruction>
	.word 0xf64da048  ! 982: LDSB_I	ldsb	[%r22 + 0x0048], %r27
	.word 0xf614a10a  ! 987: LDUH_I	lduh	[%r18 + 0x010a], %r27
	.word 0xf414214f  ! 988: LDUH_I	lduh	[%r16 + 0x014f], %r26
	.word 0xf61561e9  ! 992: LDUH_I	lduh	[%r21 + 0x01e9], %r27
	.word 0x899421a0  ! 993: WRPR_TICK_I	wrpr	%r16, 0x01a0, %tick
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ca02f  ! 997: LDX_I	ldx	[%r18 + 0x002f], %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbd540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb3a00520  ! 4: FSQRTs	fsqrt	
	.word 0xbe05a162  ! 5: ADD_I	add 	%r22, 0x0162, %r31
	.word 0xb9a81c20  ! 9: FMOVRGEZ	dis not found

	setx	0x5d58743d0000dc19, %g1, %r10
	.word 0x819a8000  ! 14: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a81c20  ! 17: FMOVRGEZ	dis not found

	.word 0xbfa00020  ! 19: FMOVs	fmovs	%f0, %f31
	.word 0xb23de08c  ! 20: XNOR_I	xnor 	%r23, 0x008c, %r25
	.word 0xbd500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xb9a00560  ! 25: FSQRTq	fsqrt	
	.word 0xbe35a0a3  ! 27: ORN_I	orn 	%r22, 0x00a3, %r31
	.word 0xb5a81420  ! 29: FMOVRNZ	dis not found

	.word 0xbfa40820  ! 33: FADDs	fadds	%f16, %f0, %f31
	.word 0xb3540000  ! 35: RDPR_GL	<illegal instruction>
	.word 0x8994a072  ! 36: WRPR_TICK_I	wrpr	%r18, 0x0072, %tick
	.word 0xb5aa4820  ! 37: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x879461cd  ! 38: WRPR_TT_I	wrpr	%r17, 0x01cd, %tt
	.word 0xb60c8000  ! 40: AND_R	and 	%r18, %r0, %r27
	.word 0xb7abc820  ! 41: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 42: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a9c820  ! 45: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a50960  ! 49: FMULq	dis not found

	.word 0xb0a48000  ! 51: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xbac58000  ! 53: ADDCcc_R	addccc 	%r22, %r0, %r29
	.word 0x81942040  ! 55: WRPR_TPC_I	wrpr	%r16, 0x0040, %tpc
	.word 0xb9a00540  ! 56: FSQRTd	fsqrt	
	.word 0xbfa488c0  ! 58: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb5ab0820  ! 59: FMOVGU	fmovs	%fcc1, %f0, %f26
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 63: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1508000  ! 65: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 66: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 82: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a8c820  ! 86: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbd500000  ! 87: RDPR_TPC	<illegal instruction>
	setx	data_start_6, %g1, %r20
	.word 0xbb504000  ! 90: RDPR_TNPC	<illegal instruction>
	.word 0xbba4c820  ! 91: FADDs	fadds	%f19, %f0, %f29
	.word 0xbba489a0  ! 94: FDIVs	fdivs	%f18, %f0, %f29
	.word 0x8d94e151  ! 95: WRPR_PSTATE_I	wrpr	%r19, 0x0151, %pstate
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 100: FMOVGU	fmovs	%fcc1, %f0, %f25
	setx	0x3a8326e100008e06, %g1, %r10
	.word 0x819a8000  ! 101: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1520000  ! 103: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc04c000  ! 105: ADD_R	add 	%r19, %r0, %r30
	.word 0xbb641800  ! 109: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3510000  ! 112: RDPR_TICK	<illegal instruction>
	.word 0xbb51c000  ! 114: RDPR_TL	<illegal instruction>
	.word 0xb5aac820  ! 116: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba00020  ! 118: FMOVs	fmovs	%f0, %f29
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 122: FMOVNE	fmovs	%fcc1, %f0, %f31
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54820  ! 127: FADDs	fadds	%f21, %f0, %f26
	.word 0xbba449a0  ! 128: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb5aac820  ! 130: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9540000  ! 132: RDPR_GL	<illegal instruction>
	.word 0xbd510000  ! 137: RDPR_TICK	<illegal instruction>
	.word 0xbdab4820  ! 138: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81c20  ! 142: FMOVRGEZ	dis not found

	.word 0xb7a44860  ! 144: FADDq	dis not found

	.word 0xbfa4c840  ! 145: FADDd	faddd	%f50, %f0, %f62
	.word 0xbba40940  ! 146: FMULd	fmuld	%f16, %f0, %f60
	.word 0xb1aa4820  ! 149: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a80820  ! 151: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 153: FSQRTd	fsqrt	
	setx	data_start_0, %g1, %r17
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0xb9a94820  ! 160: FMOVCS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0xcd40129300008e04, %g1, %r10
	.word 0x819a8000  ! 163: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8e0  ! 168: FSUBq	dis not found

	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 172: RDPR_TSTATE	<illegal instruction>
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 178: FMOVRGEZ	dis not found

	.word 0xbda00520  ! 182: FSQRTs	fsqrt	
	.word 0xb7a81420  ! 184: FMOVRNZ	dis not found

	.word 0xb5a548e0  ! 191: FSUBq	dis not found

	.word 0xb0c5c000  ! 193: ADDCcc_R	addccc 	%r23, %r0, %r24
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 208: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb2ac4000  ! 210: ANDNcc_R	andncc 	%r17, %r0, %r25
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 222: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9a00540  ! 227: FSQRTd	fsqrt	
	.word 0xb1a58940  ! 228: FMULd	fmuld	%f22, %f0, %f24
	.word 0xbda00020  ! 229: FMOVs	fmovs	%f0, %f30
	.word 0xb085a09e  ! 230: ADDcc_I	addcc 	%r22, 0x009e, %r24
	.word 0x839421dc  ! 231: WRPR_TNPC_I	wrpr	%r16, 0x01dc, %tnpc
	.word 0xb7a44940  ! 233: FMULd	fmuld	%f48, %f0, %f58
	.word 0xbfa00020  ! 239: FMOVs	fmovs	%f0, %f31
	.word 0xb7aa0820  ! 244: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda5c9a0  ! 245: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb9a81420  ! 246: FMOVRNZ	dis not found

	.word 0xbda00040  ! 247: FMOVd	fmovd	%f0, %f30
	.word 0xbba508a0  ! 251: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb7508000  ! 253: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00520  ! 256: FSQRTs	fsqrt	
	.word 0xb9a80c20  ! 257: FMOVRLZ	dis not found

	.word 0xb8358000  ! 259: ORN_R	orn 	%r22, %r0, %r28
	.word 0xb1508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a489e0  ! 261: FDIVq	dis not found

	.word 0xb5a5c9e0  ! 263: FDIVq	dis not found

	.word 0xbfa4c9c0  ! 264: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb9aa8820  ! 266: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0x8794607c  ! 268: WRPR_TT_I	wrpr	%r17, 0x007c, %tt
	.word 0xbf50c000  ! 270: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xb9a80820  ! 274: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbb504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0xbba00560  ! 276: FSQRTq	fsqrt	
	.word 0x839461f6  ! 277: WRPR_TNPC_I	wrpr	%r17, 0x01f6, %tnpc
	.word 0xb9a4c9a0  ! 278: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xbfa00040  ! 282: FMOVd	fmovd	%f0, %f62
	.word 0xb7aa8820  ! 286: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00560  ! 287: FSQRTq	fsqrt	
	.word 0xbba40920  ! 288: FMULs	fmuls	%f16, %f0, %f29
	setx	data_start_2, %g1, %r19
	.word 0xb3a90820  ! 290: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a448e0  ! 291: FSUBq	dis not found

	.word 0xb3ab4820  ! 296: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8195602b  ! 298: WRPR_TPC_I	wrpr	%r21, 0x002b, %tpc
	.word 0xb1a90820  ! 303: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbda81820  ! 304: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbec48000  ! 305: ADDCcc_R	addccc 	%r18, %r0, %r31
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 311: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00540  ! 312: FSQRTd	fsqrt	
	.word 0xb1a80c20  ! 315: FMOVRLZ	dis not found

	.word 0xb4352038  ! 318: SUBC_I	orn 	%r20, 0x0038, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 329: FMOVGU	fmovs	%fcc1, %f0, %f29
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 334: RDPR_TT	<illegal instruction>
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48820  ! 337: FADDs	fadds	%f18, %f0, %f31
	.word 0xbfab8820  ! 342: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81820  ! 344: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbda00560  ! 346: FSQRTq	fsqrt	
	.word 0xbba80820  ! 347: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbb518000  ! 353: RDPR_PSTATE	<illegal instruction>
	.word 0x8594a003  ! 356: WRPR_TSTATE_I	wrpr	%r18, 0x0003, %tstate
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0xbba50920  ! 361: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb7aac820  ! 364: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00040  ! 365: FMOVd	fmovd	%f0, %f56
	.word 0xb68561e0  ! 366: ADDcc_I	addcc 	%r21, 0x01e0, %r27
	.word 0xbd2c8000  ! 368: SLL_R	sll 	%r18, %r0, %r30
	.word 0xb5a81420  ! 371: FMOVRNZ	dis not found

	.word 0xbf480000  ! 372: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbba5c840  ! 373: FADDd	faddd	%f54, %f0, %f60
	.word 0xb7a00540  ! 375: FSQRTd	fsqrt	
	.word 0xb6ad2097  ! 376: ANDNcc_I	andncc 	%r20, 0x0097, %r27
	.word 0xb2c54000  ! 377: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xb1a84820  ! 378: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80820  ! 379: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	0xd651c7c200003f4a, %g1, %r10
	.word 0x819a8000  ! 382: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1518000  ! 386: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a548a0  ! 388: FSUBs	fsubs	%f21, %f0, %f27
	setx	data_start_6, %g1, %r23
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 393: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a409a0  ! 402: FDIVs	fdivs	%f16, %f0, %f24
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 405: RDPR_TL	<illegal instruction>
	.word 0xbbab8820  ! 408: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbc34a0cf  ! 409: ORN_I	orn 	%r18, 0x00cf, %r30
	.word 0xb1a00540  ! 412: FSQRTd	fsqrt	
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa409a0  ! 415: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb7a58820  ! 417: FADDs	fadds	%f22, %f0, %f27
	.word 0xb7a58820  ! 418: FADDs	fadds	%f22, %f0, %f27
	.word 0xb9a448c0  ! 420: FSUBd	fsubd	%f48, %f0, %f28
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 426: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba54820  ! 428: FADDs	fadds	%f21, %f0, %f29
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9420dc  ! 433: WRPR_PSTATE_I	wrpr	%r16, 0x00dc, %pstate
	.word 0xb5504000  ! 435: RDPR_TNPC	<illegal instruction>
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58820  ! 446: FADDs	fadds	%f22, %f0, %f29
	setx	data_start_2, %g1, %r19
	.word 0xb151c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xb5a81420  ! 451: FMOVRNZ	dis not found

	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40920  ! 455: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb1a489e0  ! 460: FDIVq	dis not found

	.word 0xbe0d0000  ! 464: AND_R	and 	%r20, %r0, %r31
	.word 0xbd510000  ! 467: RDPR_TICK	<illegal instruction>
	.word 0xb3a9c820  ! 468: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00040  ! 470: FMOVd	fmovd	%f0, %f24
	.word 0xbfaa8820  ! 471: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbba488e0  ! 473: FSUBq	dis not found

	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 476: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xba85c000  ! 477: ADDcc_R	addcc 	%r23, %r0, %r29
	.word 0x8995a092  ! 478: WRPR_TICK_I	wrpr	%r22, 0x0092, %tick
	.word 0xbfa48860  ! 479: FADDq	dis not found

	.word 0xbfa81420  ! 486: FMOVRNZ	dis not found

	.word 0x8195a026  ! 491: WRPR_TPC_I	wrpr	%r22, 0x0026, %tpc
	.word 0xbda589e0  ! 494: FDIVq	dis not found

	.word 0xbb2ca001  ! 498: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xbbabc820  ! 501: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb3a509a0  ! 506: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xbfa80820  ! 508: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba489e0  ! 512: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3540000  ! 517: RDPR_GL	<illegal instruction>
	setx	0xbd8a4fcc0000ee9a, %g1, %r10
	.word 0x819a8000  ! 519: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a4c8c0  ! 520: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xbfa80820  ! 521: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbf51c000  ! 525: RDPR_TL	<illegal instruction>
	.word 0xbfa409c0  ! 527: FDIVd	fdivd	%f16, %f0, %f62
	.word 0xb9a94820  ! 535: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa44840  ! 538: FADDd	faddd	%f48, %f0, %f62
	mov	2, %r12
	.word 0x8f930000  ! 539: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb82461e4  ! 541: SUB_I	sub 	%r17, 0x01e4, %r28
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9a0  ! 543: FDIVs	fdivs	%f23, %f0, %f25
	.word 0x8194616e  ! 544: WRPR_TPC_I	wrpr	%r17, 0x016e, %tpc
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8a0  ! 547: FSUBs	fsubs	%f23, %f0, %f24
	setx	data_start_7, %g1, %r19
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 552: FDIVq	dis not found

	.word 0xb3a50920  ! 553: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb7a84820  ! 557: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a488e0  ! 561: FSUBq	dis not found

	.word 0xbfa80820  ! 563: FMOVN	fmovs	%fcc1, %f0, %f31
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 566: RDPR_TT	<illegal instruction>
	.word 0xb6acc000  ! 567: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xb5518000  ! 569: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a4c860  ! 570: FADDq	dis not found

	setx	data_start_2, %g1, %r19
	.word 0x8d95a146  ! 573: WRPR_PSTATE_I	wrpr	%r22, 0x0146, %pstate
	.word 0xb9a508e0  ! 574: FSUBq	dis not found

	.word 0xb5a40820  ! 576: FADDs	fadds	%f16, %f0, %f26
	setx	data_start_0, %g1, %r21
	.word 0xb1641800  ! 580: MOVcc_R	<illegal instruction>
	.word 0xbbabc820  ! 588: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb8b40000  ! 591: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xb5a98820  ! 593: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb6c48000  ! 594: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb9a80420  ! 595: FMOVRZ	dis not found

	.word 0xb5a81820  ! 596: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x85952106  ! 597: WRPR_TSTATE_I	wrpr	%r20, 0x0106, %tstate
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xb434c000  ! 603: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xbe0c601b  ! 605: AND_I	and 	%r17, 0x001b, %r31
	.word 0xbd500000  ! 607: RDPR_TPC	<illegal instruction>
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844e044  ! 616: ADDC_I	addc 	%r19, 0x0044, %r28
	.word 0xbfa5c9c0  ! 617: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb5a94820  ! 624: FMOVCS	fmovs	%fcc1, %f0, %f26
	setx	data_start_6, %g1, %r18
	.word 0xbda9c820  ! 627: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb695c000  ! 628: ORcc_R	orcc 	%r23, %r0, %r27
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a08e  ! 632: WRPR_PSTATE_I	wrpr	%r22, 0x008e, %pstate
	.word 0xb5500000  ! 634: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 636: RDPR_TT	<illegal instruction>
	.word 0xb7a00560  ! 637: FSQRTq	fsqrt	
	.word 0xbb540000  ! 639: RDPR_GL	<illegal instruction>
	.word 0xbfa94820  ! 642: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8d95a0f9  ! 645: WRPR_PSTATE_I	wrpr	%r22, 0x00f9, %pstate
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0x8594e08e  ! 653: WRPR_TSTATE_I	wrpr	%r19, 0x008e, %tstate
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 660: RDPR_TT	rdpr	%tt, %r29
	.word 0xb1a00560  ! 663: FSQRTq	fsqrt	
	.word 0x81956158  ! 664: WRPR_TPC_I	wrpr	%r21, 0x0158, %tpc
	.word 0xbfa589a0  ! 668: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xbd50c000  ! 669: RDPR_TT	<illegal instruction>
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 674: RDPR_TPC	<illegal instruction>
	.word 0xb3a489c0  ! 675: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xb3520000  ! 677: RDPR_PIL	<illegal instruction>
	.word 0xb7a81c20  ! 678: FMOVRGEZ	dis not found

	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420a5  ! 688: WRPR_TT_I	wrpr	%r16, 0x00a5, %tt
	.word 0xbbaa8820  ! 689: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5abc820  ! 690: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb0c4a00d  ! 691: ADDCcc_I	addccc 	%r18, 0x000d, %r24
	.word 0xb7a5c8a0  ! 693: FSUBs	fsubs	%f23, %f0, %f27
	setx	data_start_2, %g1, %r19
	.word 0x8394a144  ! 698: WRPR_TNPC_I	wrpr	%r18, 0x0144, %tnpc
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0xbe9da052  ! 710: XORcc_I	xorcc 	%r22, 0x0052, %r31
	.word 0xb1520000  ! 711: RDPR_PIL	<illegal instruction>
	.word 0xb7a80c20  ! 714: FMOVRLZ	dis not found

	.word 0xb7a408c0  ! 715: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb7a448a0  ! 716: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbba84820  ! 717: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab8820  ! 720: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xba250000  ! 721: SUB_R	sub 	%r20, %r0, %r29
	.word 0xbda40920  ! 724: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb5a80420  ! 725: FMOVRZ	dis not found

	.word 0xb3504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xbe450000  ! 731: ADDC_R	addc 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a84820  ! 734: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb0ada13e  ! 739: ANDNcc_I	andncc 	%r22, 0x013e, %r24
	.word 0xb3a8c820  ! 741: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3a80820  ! 743: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbb641800  ! 744: MOVcc_R	<illegal instruction>
	.word 0xb9aac820  ! 746: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80820  ! 747: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c820  ! 752: FADDs	fadds	%f19, %f0, %f25
	setx	data_start_0, %g1, %r16
	.word 0x8194e00d  ! 758: WRPR_TPC_I	wrpr	%r19, 0x000d, %tpc
	.word 0xb150c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xb695619a  ! 761: ORcc_I	orcc 	%r21, 0x019a, %r27
	setx	0xa5cf37490000ea8e, %g1, %r10
	.word 0x839a8000  ! 762: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda5c820  ! 764: FADDs	fadds	%f23, %f0, %f30
	.word 0xb0b40000  ! 769: SUBCcc_R	orncc 	%r16, %r0, %r24
	mov	0, %r12
	.word 0x8f930000  ! 770: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_7, %g1, %r19
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 775: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a48960  ! 776: FMULq	dis not found

	.word 0xba14e18d  ! 778: OR_I	or 	%r19, 0x018d, %r29
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548e0  ! 786: FSUBq	dis not found

	.word 0xb9a449e0  ! 789: FDIVq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfab0820  ! 793: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbda58960  ! 795: FMULq	dis not found

	.word 0xb1a449c0  ! 796: FDIVd	fdivd	%f48, %f0, %f24
	setx	0xa7cd155600002fdf, %g1, %r10
	.word 0x839a8000  ! 797: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a549e0  ! 799: FDIVq	dis not found

	.word 0xb5a94820  ! 801: FMOVCS	fmovs	%fcc1, %f0, %f26
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 808: FMOVLEU	fmovs	%fcc1, %f0, %f29
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb824e123  ! 810: SUB_I	sub 	%r19, 0x0123, %r28
	.word 0xb5a88820  ! 811: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba94820  ! 813: FMOVCS	fmovs	%fcc1, %f0, %f29
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 817: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba80420  ! 819: FMOVRZ	dis not found

	.word 0xb9a5c9c0  ! 820: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbba84820  ! 821: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	0xc2249f9600009d07, %g1, %r10
	.word 0x819a8000  ! 822: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda449c0  ! 823: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb7a58920  ! 824: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbb7c0400  ! 827: MOVR_R	movre	%r16, %r0, %r29
	.word 0xbfa81c20  ! 828: FMOVRGEZ	dis not found

	.word 0xbd500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0xb3a9c820  ! 832: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a58860  ! 834: FADDq	dis not found

	.word 0xbc0561f8  ! 836: ADD_I	add 	%r21, 0x01f8, %r30
	.word 0xb615e1cd  ! 838: OR_I	or 	%r23, 0x01cd, %r27
	.word 0xb7a48840  ! 839: FADDd	faddd	%f18, %f0, %f58
	.word 0x899521b9  ! 842: WRPR_TICK_I	wrpr	%r20, 0x01b9, %tick
	setx	0xc7002b4000003b1b, %g1, %r10
	.word 0x839a8000  ! 845: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbaa0820  ! 846: FMOVA	fmovs	%fcc1, %f0, %f29
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50940  ! 849: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb751c000  ! 853: RDPR_TL	<illegal instruction>
	.word 0xb5a5c860  ! 855: FADDq	dis not found

	.word 0xbda40820  ! 856: FADDs	fadds	%f16, %f0, %f30
	.word 0xbf500000  ! 859: RDPR_TPC	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xb1a44860  ! 861: FADDq	dis not found

	.word 0xb7a81c20  ! 862: FMOVRGEZ	dis not found

	.word 0xbfa54820  ! 863: FADDs	fadds	%f21, %f0, %f31
	.word 0xb7a81820  ! 864: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 870: FSQRTd	fsqrt	
	.word 0xbba80c20  ! 871: FMOVRLZ	dis not found

	.word 0xbd50c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0xbda54840  ! 875: FADDd	faddd	%f52, %f0, %f30
	.word 0xb1a588e0  ! 878: FSUBq	dis not found

	setx	0x55a133dc0000191e, %g1, %r10
	.word 0x819a8000  ! 881: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a5c8c0  ! 882: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb9a81420  ! 884: FMOVRNZ	dis not found

	.word 0xbdab8820  ! 887: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0x8195210d  ! 890: WRPR_TPC_I	wrpr	%r20, 0x010d, %tpc
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 901: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbb518000  ! 903: RDPR_PSTATE	<illegal instruction>
	.word 0xbba81c20  ! 904: FMOVRGEZ	dis not found

	.word 0xbba81820  ! 907: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbba84820  ! 908: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbbab0820  ! 912: FMOVGU	fmovs	%fcc1, %f0, %f29
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4a0d7  ! 914: SUBcc_I	subcc 	%r18, 0x00d7, %r29
	.word 0xb77d2401  ! 915: MOVR_I	movre	%r20, 0x1, %r27
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 921: FSQRTq	fsqrt	
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448a0  ! 925: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbf540000  ! 927: RDPR_GL	<illegal instruction>
	.word 0xbb480000  ! 928: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbfabc820  ! 932: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbd520000  ! 933: RDPR_PIL	<illegal instruction>
	.word 0xbba54940  ! 936: FMULd	fmuld	%f52, %f0, %f60
	.word 0xb5a54860  ! 938: FADDq	dis not found

	.word 0xb3a80420  ! 940: FMOVRZ	dis not found

	.word 0xb5a54940  ! 943: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb23cc000  ! 946: XNOR_R	xnor 	%r19, %r0, %r25
	.word 0xbbaa8820  ! 947: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbba80c20  ! 948: FMOVRLZ	dis not found

	setx	data_start_3, %g1, %r21
	.word 0xb1ab0820  ! 950: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbf508000  ! 954: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa5c920  ! 958: FMULs	fmuls	%f23, %f0, %f31
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 964: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x8195610f  ! 965: WRPR_TPC_I	wrpr	%r21, 0x010f, %tpc
	.word 0xb7aa0820  ! 969: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81420  ! 971: FMOVRNZ	dis not found

	.word 0xb7aa8820  ! 973: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x8195a0a7  ! 978: WRPR_TPC_I	wrpr	%r22, 0x00a7, %tpc
	.word 0xb1510000  ! 980: RDPR_TICK	<illegal instruction>
	.word 0xbf504000  ! 981: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00540  ! 983: FSQRTd	fsqrt	
	.word 0xbfa50840  ! 984: FADDd	faddd	%f20, %f0, %f62
	.word 0xb5ab8820  ! 985: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa98820  ! 991: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x8994a1d6  ! 993: WRPR_TICK_I	wrpr	%r18, 0x01d6, %tick
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR

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

	.xword	0x952f4d3511911300
	.xword	0x9d75cb6bfd0f72d4
	.xword	0x60db21435e1f9aa9
	.xword	0xe973a9fba4e6569e
	.xword	0xf69bfcd25023f461
	.xword	0x7ce4b360ae23e49c
	.xword	0x955842bb32262933
	.xword	0x15f2da1eae59ce7a
	.xword	0x53d8531f8fe91d9b
	.xword	0x7ab93872d252cef1
	.xword	0x2d93430408c83512
	.xword	0x3a072751ee81a83b
	.xword	0xfec78c3dd7695b1d
	.xword	0xf64512ac18ac6e81
	.xword	0x9fc336766bba1607
	.xword	0x308930afcddd42e4
	.xword	0x465e399a67ce94c8
	.xword	0x9a4209886e0ca345
	.xword	0x1e143c26758f6cf0
	.xword	0x7d81b89387b56a46
	.xword	0xfb30a19972f3f03a
	.xword	0x8a406b1624eaf315
	.xword	0x0bc22bc5295f2d96
	.xword	0x798e551623d96371
	.xword	0x89a0e539dc76186c
	.xword	0xc5f2840ee682dfca
	.xword	0x9a51542f8b7fe325
	.xword	0xa60680cbd6ab1bcd
	.xword	0x238dffdf5ec895bd
	.xword	0xbef8885df15ba208
	.xword	0x6ee566adbe3a1105
	.xword	0xaf654d4a3f75488c
	.xword	0xc487933cead945ca
	.xword	0x2c331e6b6dcd5c6b
	.xword	0xbf018fea4dbfe679
	.xword	0x9aaf4aacaf62993f
	.xword	0x49f5e39e95399462
	.xword	0x9ca97e7377b93957
	.xword	0xfeb474650f74005a
	.xword	0xdc3fdd35c938698b
	.xword	0x09c77f7c0bc4cc59
	.xword	0x829ec835741babc0
	.xword	0xc80732173ed937ac
	.xword	0x11084f80a3339424
	.xword	0x388d8dae27ed0ea3
	.xword	0x6a8e8824f74aacec
	.xword	0x902788fde89c0ef1
	.xword	0x9c18d2cd8911322d
	.xword	0xfecda30c6dc4908c
	.xword	0xa7bc4fdf63e33266
	.xword	0x5dfed2eb2a2714af
	.xword	0x20277ca796b2e233
	.xword	0x31fbc2b6b8628f13
	.xword	0x2084816ec9cc7739
	.xword	0x6299ba39f470b2e1
	.xword	0xdc86549ccc76620e
	.xword	0xad50192a4626c9d8
	.xword	0xd90b6bdc8cec3f79
	.xword	0x7d0bf5169243ff37
	.xword	0xb1472f563cf4f472
	.xword	0x9ea21f5d97e5fd5c
	.xword	0xc0ca9990051340f7
	.xword	0x613a194253f092e0
	.xword	0x62f851edaffc4fa7
	.xword	0x891918f22d25cebb
	.xword	0x92940dfebc1ef154
	.xword	0x7b15d2108947a40a
	.xword	0x3ebc154846de8c21
	.xword	0xa85c620decbe974a
	.xword	0xe40716c83ba9f9c1
	.xword	0x5860a3e60b7f17cb
	.xword	0xef5f1bcdab3c6d0a
	.xword	0xf0e965579134c73d
	.xword	0x8bfadc6af114a0c6
	.xword	0xe86d10f7d334ba3a
	.xword	0x90e411c033a3c8b8
	.xword	0xded3c1e69f71b0cb
	.xword	0x6ff396d349e377d5
	.xword	0x57a58133e2fe4225
	.xword	0x9f14d2897ed474e2
	.xword	0xb2b973ddce5d11b6
	.xword	0x12f64df7108e6312
	.xword	0x17d0181efdde8461
	.xword	0x22de3439f8b9a482
	.xword	0x7abaa0566557f0be
	.xword	0x7fe71b6a8be3d783
	.xword	0x998c11d69ad3a976
	.xword	0xe4b93dcf2ac55ad4
	.xword	0xfd27f105b78febcb
	.xword	0xa82d5f1c4c184e32
	.xword	0xcfd1fabb8c719635
	.xword	0xaae78eb03beb5a27
	.xword	0xf8b4d0724b27aa22
	.xword	0x4aa56cd4f051746a
	.xword	0xd99197e157074a3f
	.xword	0x984ba0184bb19565
	.xword	0xd6471298699d4c2d
	.xword	0xfd61c5f4785a6bec
	.xword	0x5ec38978e17cd883
	.xword	0x34d9bf8478c3430a
	.xword	0x87720df9f115cd1d
	.xword	0xbf9c0bc5e0666b2b
	.xword	0x9e7d975f4b308948
	.xword	0x9d35d748cadb0418
	.xword	0x6e2d57bc7f07a42e
	.xword	0xc7f97824e9ae1934
	.xword	0xd3d4669d2f7cdb86
	.xword	0x6f2585397e1cf623
	.xword	0xdebbccb7b064f7c9
	.xword	0xed23759a1914b840
	.xword	0xfe3b602d96b96d1e
	.xword	0x52db32135bdeb4a8
	.xword	0x93cfe5d4ea62dafa
	.xword	0xf998eb09140f855a
	.xword	0xdaa81b14e8531536
	.xword	0x80dfa1271919fb3e
	.xword	0xd5fc133e61ef21fb
	.xword	0xc340466fa1b2faef
	.xword	0x8a9ce97f0efd27b5
	.xword	0xafb3d6b419d5f6eb
	.xword	0x971f61e306c3ad28
	.xword	0x58599e081a567148
	.xword	0x9d3a0f3bee20d7a2
	.xword	0xa5cc2e914998a3c7
	.xword	0x73052979c8288edd
	.xword	0x3657758f5ce1922a
	.xword	0xa14b234d96d71077
	.xword	0x9be80e4868b829dd
	.xword	0x21b95a3273a14ba6
	.xword	0x5b3b5f41ff8f92b6
	.xword	0x4714b487b0c3b035
	.xword	0x3377785258aff363
	.xword	0x359adebcd0b80bea
	.xword	0xecabaaeb68361bf3
	.xword	0xcce74e556ec97872
	.xword	0x1bbe8f80145c77d1
	.xword	0x9f4e8e4d4c1e9dcb
	.xword	0xf4768af1e6ea4a05
	.xword	0x495c60ba29014f50
	.xword	0x68983bbc4ea7ff81
	.xword	0xe1898fb9323347c9
	.xword	0xd937a73ae9081b4d
	.xword	0x48ee67316195c4f2
	.xword	0x2943dfe03d0cf251
	.xword	0x8b9b564027d7e2a5
	.xword	0xdb1e403387c1a5d6
	.xword	0xa97ab9ef4dfe91ee
	.xword	0x5a8add0df5e11cf4
	.xword	0x70f21d3bff7d6bbc
	.xword	0xcb90d63599d53075
	.xword	0x4dcc306836da5010
	.xword	0xa6d2c92127e38243
	.xword	0xe0d5be5819a7970b
	.xword	0x3a98cf57092fd6c1
	.xword	0xcede9a0d93d01577
	.xword	0x882ee580be613823
	.xword	0x5be085fdbea5c7ec
	.xword	0x8f116e9e2f91a7ca
	.xword	0x61932147098f1dff
	.xword	0x116a294cbacab2d0
	.xword	0x3623749ff6e665d3
	.xword	0xcc710d0b4e60055b
	.xword	0xcb2c7bc4e9eba7bc
	.xword	0x48f1e845a8afe584
	.xword	0xf72e55b99858d917
	.xword	0x2c485fbf5b6139dc
	.xword	0x0892bac0a61e6610
	.xword	0x8aa3a9845893eab0
	.xword	0x55914e6d9a7a8f18
	.xword	0x448a50a1a2195bf6
	.xword	0x71b57639f62643f6
	.xword	0x63ecf8bed70dd7c5
	.xword	0xe373c7d719945ff2
	.xword	0x5bf93148840fc874
	.xword	0x825225a9111bdb4d
	.xword	0xcf34fa8626fbbc62
	.xword	0x427d60f4b12d99ab
	.xword	0x5fc7aea2453ca5a0
	.xword	0x474dedad2a2e7787
	.xword	0xbe28de25cb2a2f41
	.xword	0x658c65b31786bbb6
	.xword	0xeda9447ce3a2e42e
	.xword	0xb1f0ccb23440af98
	.xword	0x2e778f471c100af1
	.xword	0x5b664b5b0c668f9d
	.xword	0x51ca890b015645c7
	.xword	0xf173b434b8232113
	.xword	0x2973c37a631b17c7
	.xword	0x21309a5314484d04
	.xword	0x85e00b97a5955c45
	.xword	0x2670342b8deddb33
	.xword	0x099ae7859104dcdb
	.xword	0x52abe0d4a7ab9110
	.xword	0x395fe89301a09353
	.xword	0x2c4949daa6c6ae47
	.xword	0x507b30dbc0a86dab
	.xword	0x87cb8670dfc6e671
	.xword	0x06c05ea82caac30b
	.xword	0x31a5833e64cc24b8
	.xword	0x1acabb91a21756a9
	.xword	0xf6ea92a4c7c55f47
	.xword	0x9e7f075b785f857a
	.xword	0x2aa8884642c2fde9
	.xword	0xbce746c269242d27
	.xword	0xfe27738f4f7e1294
	.xword	0x4c5a0e0b29047b56
	.xword	0xf5eda9308da42ae0
	.xword	0xc07d57ea9ecbb7e9
	.xword	0xb4e4c36107176f68
	.xword	0x4707bbf1e0587a79
	.xword	0xa4b67d1553e9c2f3
	.xword	0xb8a0720665e4ef6b
	.xword	0xc5074ed6cbe03850
	.xword	0xc40804996f4ac5a1
	.xword	0xd5e7da69cf472127
	.xword	0xd163a596c6ac06b8
	.xword	0x1512daab4b7f13a8
	.xword	0xfae4fcd91739d2a7
	.xword	0x001860f84aaf2917
	.xword	0x6ddfed7604701e8d
	.xword	0xced4c2d72f1c7344
	.xword	0x01156cf71bb38fec
	.xword	0xfd0120d17772a78c
	.xword	0x787c5d67bc4dfd1b
	.xword	0x41d0c198870b998e
	.xword	0x44aa825b8deb0ca6
	.xword	0x3db5cdfce94c5692
	.xword	0x58acae09da3f09ef
	.xword	0x609efced7a8f4f2f
	.xword	0x4447d2a99fe5df61
	.xword	0xa91002862321514a
	.xword	0xf80f77131b70161f
	.xword	0x1f81097935260bbb
	.xword	0x8f961a8bba02d320
	.xword	0x2fa5c3406d8d8db1
	.xword	0x822dcd7cca73c43f
	.xword	0x45ad14f007271d72
	.xword	0xfcd9bba4adebff5a
	.xword	0x8ea9c8c91fa2f8a3
	.xword	0x13b4336d71209ec3
	.xword	0xd0683a4126e2d9f1
	.xword	0x0376dcbababdb6a2
	.xword	0x11212f2ef0cf7f99
	.xword	0x8621aab0a99a5c04
	.xword	0xb7cc9ba9ff3b55cf
	.xword	0x232cb7536f1fc5f9
	.xword	0x87fa659d763b5fdc
	.xword	0xf1a12551a793ee52
	.xword	0x799e1b6485972f73
	.xword	0x5f5279d3790b1edd
	.xword	0x9f0fc28955e880c2
	.xword	0x358321d512d62b02
	.xword	0x8a8e10e74b44ce74
	.xword	0x6a5593b8855e9884
	.xword	0x6ec4fe5dcdb6dae4
	.xword	0x53340a91bfea7649
	.align 0x2000
	.data
data_start_1:

	.xword	0x3095da90696cf0ea
	.xword	0x55a6fab7d1eac8f9
	.xword	0x4d5b34d887bfd765
	.xword	0x680768bc2c49af6a
	.xword	0xb3fdc69566f544f0
	.xword	0xbb13bc8237d45e59
	.xword	0xa4c811cd56e3d5f4
	.xword	0xf68f8bb3b439a952
	.xword	0x903f169e726f6bcf
	.xword	0x6a3175692462761f
	.xword	0x3eb94a1bce021769
	.xword	0x5214d507b96e0840
	.xword	0x3ba2b7aa7d41a590
	.xword	0x6c3893afe2aa1ece
	.xword	0xa7fa62e4b2d309f0
	.xword	0x465487902053bcc7
	.xword	0xc8d7fb92de2c8f35
	.xword	0x95e7c5b65ab17d90
	.xword	0xc8c4021f57975cff
	.xword	0x37140c72ad0c60c6
	.xword	0x149db19d37a18e63
	.xword	0x6dee8963fa63b44b
	.xword	0x49257d097879670d
	.xword	0x67fa1372bd558f62
	.xword	0x0c678a5f2ed65066
	.xword	0x73cbc9bc734ea1c7
	.xword	0x6e676c83a3e02d1c
	.xword	0x2a9cd39d0fd1e7bf
	.xword	0x90873252ffd20a14
	.xword	0x6898637e64e168e8
	.xword	0x0cca38dcd4b1d650
	.xword	0xacfa4174240d2190
	.xword	0x37172fab331157ff
	.xword	0x26a4db040a11447d
	.xword	0x60187756fe5417f1
	.xword	0x9813c45374b74adb
	.xword	0xf6d67752c8570174
	.xword	0xad4fec9d870778fb
	.xword	0x8a68b7d9b5954bf6
	.xword	0xdff5f9467e4824fc
	.xword	0x00d4bb9f86285176
	.xword	0x8b95ad69ecb0bea7
	.xword	0x791c2247490d36db
	.xword	0x03a3b0498eb868d3
	.xword	0x4ab67b4aaa63c218
	.xword	0xf7738d79534a2983
	.xword	0x8686f9fb54e9ad0a
	.xword	0x89849856c1f00185
	.xword	0xbf45981ee62f5121
	.xword	0x42651d05d87fad5a
	.xword	0x04d726f9e55a83c9
	.xword	0x5e56dc7a45234176
	.xword	0x033acd9db57449e0
	.xword	0xd47387317df5d6ff
	.xword	0x32d6e94ce21df5e1
	.xword	0x3b528e99712011a2
	.xword	0xa43c80fda16334f5
	.xword	0x9e4bbe6360ddec71
	.xword	0x27074ac72677f7a4
	.xword	0x715b00219b6a43ff
	.xword	0xee76817f772ca474
	.xword	0xca4da197ea14b7d5
	.xword	0xf1a2e4e4f0b64025
	.xword	0x994c91c1a9c28a58
	.xword	0xb6060b55a131518c
	.xword	0xfc3061a1f971d614
	.xword	0x7384a4cdf019c6b6
	.xword	0x01c2a4d8e1db7fb0
	.xword	0x9a88c57382e8b5ec
	.xword	0xd8395a7749bf914c
	.xword	0x49d41318d9d2ccf0
	.xword	0x4a555b63eaca311c
	.xword	0x2998c6b37a9ef9bc
	.xword	0xb872cf2ebdb8915d
	.xword	0x6e6ab13d1643e15f
	.xword	0xd6fd3e60c01f2811
	.xword	0x3aabaa1a49db6f4c
	.xword	0x1655bcb0c5824ef0
	.xword	0x01e6a1e1f98c0c3c
	.xword	0x5b65586be1919ca9
	.xword	0x358e63e253d3a58e
	.xword	0xee4dc353b1003188
	.xword	0x93dd88b95b3d276c
	.xword	0x92071b4ee1cc2e69
	.xword	0x1d6136d9cbd88666
	.xword	0xa4198dfabcc77113
	.xword	0x97998b1a9767761a
	.xword	0x40ea027bb47e0f1a
	.xword	0xf65dac7bbd5b7e95
	.xword	0xe9d46dfeb415b7cb
	.xword	0x7645bb20cefe8a93
	.xword	0x1306e75d77881e76
	.xword	0x756c7df9e2dfffe3
	.xword	0x556f8302ebfeccca
	.xword	0x8d6d2e633b3c715c
	.xword	0xb6b654e500e8fb17
	.xword	0xbba989bc512c35d8
	.xword	0x460a001b880f7054
	.xword	0xcb20efe6cb0736d6
	.xword	0x01172948ac354d6b
	.xword	0x82b4236930596206
	.xword	0x929308b2f298b256
	.xword	0xc6bf506cf915bf1c
	.xword	0xe0b8435022ea6cd4
	.xword	0x214aa1570cc09212
	.xword	0x38474a0b2bf75845
	.xword	0x10ce1699fcfb080a
	.xword	0x3323602c1531a2fb
	.xword	0x0d2a7e27517c6f9b
	.xword	0x7772362e23b3436b
	.xword	0xce6c550207cfa435
	.xword	0x9bfb18697be9149a
	.xword	0xd4e37d89ae14c794
	.xword	0x027aa815c54015ab
	.xword	0xc4e30e7770b17c06
	.xword	0x10859b45dfa039b8
	.xword	0xfa9e6981c7aa72f1
	.xword	0x8d6226858e3e5751
	.xword	0xafa513c9018d71e5
	.xword	0x9348e0c26dbfd827
	.xword	0xe693607903d9333a
	.xword	0xcc5593a1a2b8b0c8
	.xword	0x9755d6960c224300
	.xword	0xdf7b513e513c5181
	.xword	0x72d628f3c42e631e
	.xword	0x9ba42c5bc2f3be0c
	.xword	0x103ed5c2e933ae35
	.xword	0x06ce2d11727600cb
	.xword	0x18aa3110bc4097a2
	.xword	0xdf5255d6e984047f
	.xword	0x26cc6d6f992d8658
	.xword	0x7ada6f63269b8cbe
	.xword	0x8f24f0f699b098e2
	.xword	0x59cf72d390b583b9
	.xword	0x385a28bd77fe4e19
	.xword	0x6b2d166cae4a910e
	.xword	0x2f22d186153ab8fb
	.xword	0x4867ec22cc677060
	.xword	0xc9ada1e327b2a7aa
	.xword	0xec81d2148203b810
	.xword	0x8a5608f4c9704455
	.xword	0x4b3265ee37fe2005
	.xword	0xf74864ff318ae1ef
	.xword	0x41ac697c69016d74
	.xword	0x9cfac130735ecaf4
	.xword	0x03a68bcbc78b6728
	.xword	0x057de6bc744ee277
	.xword	0xe3dc3ca864c11128
	.xword	0x2ac5b4bfed24f40a
	.xword	0x5ed2bf597f5b9b8c
	.xword	0xc183e65e19608911
	.xword	0x76803d2bc2e7663d
	.xword	0xf25d71c06ab33aab
	.xword	0x8e85856099cc8412
	.xword	0x4b6f0c63c110d2f3
	.xword	0x3b30d01c2b622320
	.xword	0x26d6c0d53ef4e0e8
	.xword	0xb4fd97ff70c76fb7
	.xword	0xd83ef6349590362e
	.xword	0xa1c29dc9b86bfe94
	.xword	0xbd9779e01c3fac9c
	.xword	0xee00cd0ef3c7639a
	.xword	0x2879db9a9b3bdb37
	.xword	0x8709fb8463e002d8
	.xword	0x9296453fbe124441
	.xword	0x408e51fcc9e4aeb9
	.xword	0xab28be3d17682bac
	.xword	0x47c5399833d51fa9
	.xword	0x826b40d7eee5645f
	.xword	0x834ca282912c0b5f
	.xword	0x6e59372302d748d0
	.xword	0x338bb86d110873c0
	.xword	0xca567414ccca26e6
	.xword	0xf5fab00f55db65de
	.xword	0x933a87e1707be5de
	.xword	0x345cb0671366aa6f
	.xword	0x4fc7aa90e79836d9
	.xword	0x0206a14f14bb6978
	.xword	0xe819ff9638c923e5
	.xword	0xbd09d072c5831ee9
	.xword	0x2437cef192efaaf9
	.xword	0x6d81bdb53281fb52
	.xword	0xddd87ab472be2cd0
	.xword	0xd9eec4882fdfcb2c
	.xword	0x71c6df2c17046c26
	.xword	0x9e2c157d5484d949
	.xword	0x3a418e2e412ca792
	.xword	0x46312c48a2fb586e
	.xword	0x7df6620e64c77a0b
	.xword	0xbbf927cc0bf22288
	.xword	0xdd82bc6ea211119a
	.xword	0x66d009d581673663
	.xword	0x727302d0c2e5ed13
	.xword	0xc0603bc7d873dea8
	.xword	0x25e79e3398631ebc
	.xword	0x141ce7ccaa779654
	.xword	0x0bee4e8b131a5527
	.xword	0x97482d5ff81c6002
	.xword	0x0c2291b38a32bc03
	.xword	0xeda07b277bc9f7f5
	.xword	0x696b04759018b6d7
	.xword	0x637f569811aea09b
	.xword	0xfc3083ff9b4c74d3
	.xword	0xb8975f3d811fdebe
	.xword	0x0980094791fd7059
	.xword	0x5e22ddc31380f85b
	.xword	0xce8c14a9686e5d72
	.xword	0xbd46a0d394ef2c6f
	.xword	0x4769db1bf3cac022
	.xword	0x194c1af4378692b8
	.xword	0xb1d3e3815939f601
	.xword	0xbc87743570b1796a
	.xword	0xfe90546078177438
	.xword	0xed4aaac6c4d84ec6
	.xword	0xa7e79fd25bdc04f9
	.xword	0xf496a424e5360860
	.xword	0x616ec237ddcd7fa8
	.xword	0xd6789142da6d9174
	.xword	0x04b95cccdb6ee09a
	.xword	0x82ed9d5fc5e243d2
	.xword	0xdab4528be92cdf6a
	.xword	0x6a8a0e33b4ae1183
	.xword	0xc8979bc70343d440
	.xword	0x0ffe28bd75d656e4
	.xword	0x8add1613e7c15952
	.xword	0x89d8c57a12ebdffd
	.xword	0x78121e016ed1976e
	.xword	0xb3b293958b1bd95a
	.xword	0x7df83255d7cf4b6b
	.xword	0xd42a8beb8dd24c5c
	.xword	0x4e1b96abe78d5bf9
	.xword	0xe8a3601a27f17e1b
	.xword	0x3e808ed3a6c2490d
	.xword	0x49b18632465418fb
	.xword	0xc86081b2334a3047
	.xword	0x1e80e70c41665ccb
	.xword	0xf29c14f5e0b0ed94
	.xword	0x2a8215518debf6bb
	.xword	0x3f22b87478dcf8e9
	.xword	0xc3b37b08331b0dd9
	.xword	0x6fedc7eb204ffefa
	.xword	0x64520f256d7bafc0
	.xword	0x6651c7f6113522e3
	.xword	0x212029720f2a2bc7
	.xword	0x6c779c17485c99db
	.xword	0x0e8482a5a43774bc
	.xword	0x3da01b8821455da9
	.xword	0x2faff2195744d9fd
	.xword	0x96a10b6175d218e3
	.xword	0xbc715540275945b6
	.xword	0x56ad872948e672fc
	.xword	0x229421d6a83a280f
	.xword	0x3210b6b13f719542
	.xword	0x174cff74301a3311
	.xword	0x5334ee798adcb6a0
	.xword	0x9dadd51b142db8df
	.align 0x4000
	.data
data_start_2:

	.xword	0x0e02040acb45fffb
	.xword	0x03a5bc9f4eae09cc
	.xword	0xf07089617e5761e1
	.xword	0x67553caf539a2597
	.xword	0xfbdc48857c43f20d
	.xword	0xc0e8c24d9cea91cf
	.xword	0x44d65c1f8933d387
	.xword	0x92e4a5794a257761
	.xword	0x5c094a865f1062b9
	.xword	0x4b06239b9b4cfa74
	.xword	0x4ce3215ce08a93c2
	.xword	0x0304f4c6f6166b9c
	.xword	0xeb45e49f8ea269d9
	.xword	0xb68ae5b9f4b5e5ab
	.xword	0x425a9d3cab46d6f2
	.xword	0x020a016745d507a3
	.xword	0xe9953ec2566969a2
	.xword	0x3d1cdd60df9a72a0
	.xword	0xbebebe3ce10177c4
	.xword	0xfb2391cc58dd4344
	.xword	0x03d5cdc3d9db853c
	.xword	0x21d73c81b1c5ae4d
	.xword	0x59cea3b89473a3ed
	.xword	0x32770b2f36f54096
	.xword	0xb9b61a520dbac98c
	.xword	0x9adaa0f8c90d44b7
	.xword	0x0943d8352538fff0
	.xword	0x2683bd684a5b5829
	.xword	0x0fb43d0aad26a4d1
	.xword	0xe3096c1b2221b6e0
	.xword	0x5f97611544dddb1b
	.xword	0x2bb86fc815946227
	.xword	0x239c52dd9b709454
	.xword	0xc794be6d63ffd57a
	.xword	0x89b7b3a03cb6aab8
	.xword	0x5068fd9cc3f5a26c
	.xword	0xed173b3852378da5
	.xword	0x10043dd14a0cf491
	.xword	0xdf5f5cc592339de9
	.xword	0xd09e74977385de18
	.xword	0x7f1992dd6fc65da6
	.xword	0x95434467f87824ac
	.xword	0x77ad04cc5b9d83e8
	.xword	0xe9a980668cb9f53a
	.xword	0x3c34f6db9ede99f6
	.xword	0x2630302f68b673cf
	.xword	0x479cf693194a4fec
	.xword	0x0e47ee9438964462
	.xword	0xa0bc42ffa806356a
	.xword	0x584ecf2a9c89d87f
	.xword	0x291ca19c2c4a9687
	.xword	0xf66f198627285378
	.xword	0x13472581963dea66
	.xword	0x292ec73eb2bb25b4
	.xword	0x24c6973235657973
	.xword	0x6160d93555709c02
	.xword	0xff423dd1f7340001
	.xword	0x4955b9e2c7329107
	.xword	0x49fb96bae89b7b99
	.xword	0xa760fa9490902ec9
	.xword	0xa6548f7a5c1d5db0
	.xword	0x29c362654b7aeb01
	.xword	0x9f5567706e84239e
	.xword	0x46fb4a1738fb27f0
	.xword	0x660f59fddfc56225
	.xword	0x2b69114d4f5fff84
	.xword	0x5666705355f0f7d3
	.xword	0x33805db3f01ca3e7
	.xword	0x70803b1152866f88
	.xword	0x13be246bc77b4926
	.xword	0x554cf583ce4a5d51
	.xword	0xe26be31a810aedf6
	.xword	0x4a4a0fc9ef7dc47c
	.xword	0xf2cc396a02b789b8
	.xword	0x3b6583788d9c617a
	.xword	0x7a0e951c13511e46
	.xword	0xa28e135f003b456d
	.xword	0xd9741f97509975a2
	.xword	0xec03fdc2a92ba77d
	.xword	0xfaee34ad15f3aa17
	.xword	0xe26b3bf181d69132
	.xword	0xea4f17d76778f8a8
	.xword	0x7dc3e272f93f97cb
	.xword	0x820bc4bbb349b892
	.xword	0xf8eb364c46304ce1
	.xword	0x37b8bd2f07d5c650
	.xword	0x33430f92daf73b08
	.xword	0xaedfc8285231edc2
	.xword	0x4b3f5b5dae8ab7bf
	.xword	0xaafe784ded884370
	.xword	0x0437652022f8f05e
	.xword	0xfd8a692da67748f2
	.xword	0x8988375ffb38d827
	.xword	0x2e333e312ab45ae1
	.xword	0xa07bb47909e64452
	.xword	0x4bd8c377b0cdf3c8
	.xword	0x7381dc7ab2752e93
	.xword	0x3ae7c2bf23c8d910
	.xword	0xfdf93355210d39ea
	.xword	0x0324b461804cd91e
	.xword	0x8bdb104127f3118c
	.xword	0x3f95419e7a291529
	.xword	0xc069c83f8d337e7e
	.xword	0x6c11cc650fb75ca6
	.xword	0x686cfe8e02fda498
	.xword	0xb764213983e128dd
	.xword	0x794a02b182ac51fe
	.xword	0x664de717ec7035a0
	.xword	0xcb5e87d841a2d264
	.xword	0x060a1989e89eeefb
	.xword	0x60841621fc0db08c
	.xword	0xebc47fae27bece30
	.xword	0x15fad054ab4f1d84
	.xword	0xc3cf568449e1c2fb
	.xword	0x5fb1c3e8a373b615
	.xword	0x02db9c8ee4a3efff
	.xword	0x296d36f2d3385570
	.xword	0x97ae66cd075fbe7f
	.xword	0x06037affa6399dca
	.xword	0x2d91bdd393918784
	.xword	0x0a1363056aac916c
	.xword	0x2c583c8c54c54cdf
	.xword	0x1a3e39d0d70981de
	.xword	0x6fb00d30265b650f
	.xword	0xe34efd4d6bfa04fe
	.xword	0xbea568897529d4e9
	.xword	0x2f7c01032f21bae9
	.xword	0x8f8a947042567f0d
	.xword	0x6d1054d324f0ba92
	.xword	0xf8fd81044ca5f0dd
	.xword	0x1378389f73481391
	.xword	0x51b9ba587210a9a0
	.xword	0x3c7f9745f028d113
	.xword	0xcf9d348b2ffada15
	.xword	0x2880e074048ff10c
	.xword	0x5e25f0ce27a00d9c
	.xword	0x9c6f752aa8f55552
	.xword	0x340d448bddd63252
	.xword	0x0473a1823041b582
	.xword	0xcda957ca63242b3e
	.xword	0xab570e5de72580b2
	.xword	0x0bf0e87f232a52cd
	.xword	0x5d49fbf4d7f1f207
	.xword	0x72b1af27731eca89
	.xword	0xdc13e650aa9d77d6
	.xword	0x0cb4a0f6ec80219b
	.xword	0xdecd8fdc809e55b7
	.xword	0x7b9f1df00b147ccc
	.xword	0xae9c979239f19f9d
	.xword	0x579fc13194fde9fa
	.xword	0xc402d8719f21418a
	.xword	0xe712093823ded76a
	.xword	0xd032d45b5e57b280
	.xword	0xe47b02a341a6df2f
	.xword	0xe092efe6aefd7469
	.xword	0xc986f684a698feb5
	.xword	0x34fb0df9a5d8f425
	.xword	0x9d2b49cf32c38eb4
	.xword	0x2d4e5d8c57409105
	.xword	0xadf3cd27c9758e91
	.xword	0xb1478ae4f75ccc4e
	.xword	0x79dbe7e956c2c72c
	.xword	0x0beacdd3cd07955b
	.xword	0x1337a3f28b39e2e7
	.xword	0xec91e6434adf51bd
	.xword	0x1c103e4424184e3e
	.xword	0x8afe166c87a974a9
	.xword	0x41891257d84049d6
	.xword	0x904f7ba263edecbe
	.xword	0xb202cf4946cd3e2f
	.xword	0xad5d78410c80e1cb
	.xword	0x10b6234e7c3521b7
	.xword	0x89c6ea60aeba688c
	.xword	0x7bc48a2a6152c144
	.xword	0x763f342b9ce00c72
	.xword	0x99a1af85473b9d10
	.xword	0x08d22064b6c49cf3
	.xword	0x6af3e6030ea5177a
	.xword	0xf388d7b601da6d60
	.xword	0x667559450f583cc5
	.xword	0xe6eded8719872bc0
	.xword	0x449f5e3b40cd3c5b
	.xword	0x1facc4aac78109f4
	.xword	0x592c82b1e35284e3
	.xword	0x1b984befecb8fbe7
	.xword	0x8188ad06067808bf
	.xword	0x4e0d92b595d39600
	.xword	0x5b1edc0fb5653dc1
	.xword	0xef5643e28143994a
	.xword	0xe88311146d3c3445
	.xword	0xbb71a4c42d31045b
	.xword	0x7fa3c188eebfad53
	.xword	0xe09f3f2087c181ae
	.xword	0xef5e7ecb14da628f
	.xword	0x81cf371b861cc052
	.xword	0x5920d85ed0146852
	.xword	0xb653b6fbaab539da
	.xword	0xb31411d133202037
	.xword	0xed9167ee5cc4ec8c
	.xword	0xfcfe6c7fbd9be391
	.xword	0x060fb3297717e4f6
	.xword	0x1dda52c070947b7e
	.xword	0x8867d10b7360f080
	.xword	0xe06392633163931f
	.xword	0x72b2a06bdcba3e02
	.xword	0x8e4410cfa7436a30
	.xword	0xd1940b0384a2d02a
	.xword	0x311e3b6874b14d1c
	.xword	0xa918b8d298178ebf
	.xword	0xd0357a9dbca7c90b
	.xword	0x9b72d4e9d0a4b565
	.xword	0x97ecfe88291f5cd0
	.xword	0xa4031c55a0b481bb
	.xword	0xc1eea4a8079d91ba
	.xword	0xcfa69d9c03018cd6
	.xword	0xb59f633bb87fafc6
	.xword	0x2ae0e96389cb9e03
	.xword	0x8d77ce0b7f93a6f0
	.xword	0x0e1d7fa8d02e91d8
	.xword	0x4f9ae2d5c90a01f4
	.xword	0xe3b4c68143fbefe4
	.xword	0x65dd972297e25238
	.xword	0x482602036a1a3bfe
	.xword	0x88ac22fe52a32e64
	.xword	0x07c7be4f857fd26c
	.xword	0x418f6af3bf8fa7dd
	.xword	0xbf91b67a16a81d0d
	.xword	0xf0b67432c86ee3c1
	.xword	0xb26fd46deadc9145
	.xword	0x556ac3f3e24a4f9b
	.xword	0xf432d8fffa60a14d
	.xword	0xa44158b76afb0403
	.xword	0x6ecc73869b06e83a
	.xword	0x6446e88ec9c15abb
	.xword	0x2ea63218675fa9f7
	.xword	0x484f56bf7087e82c
	.xword	0xf765a593a14e53bf
	.xword	0x1bcb775b7ce002e3
	.xword	0x0783dac964bee987
	.xword	0x20fd569e7da0a770
	.xword	0x255135bdd83e604b
	.xword	0x36308292ed4d16a4
	.xword	0xa65e221af0b637a4
	.xword	0x059eafdb49d96a96
	.xword	0x284a728555ae2875
	.xword	0xbdd1eb2345b121f2
	.xword	0x5ccf56e2a97743ea
	.xword	0xc3bf0580b1d84f0f
	.xword	0xfeb3d4eb0bbc89c4
	.xword	0x5f61c2bbce184f0a
	.xword	0x48794ee4f3fb4395
	.xword	0x0da814c2156ce483
	.xword	0x157a809cabe64381
	.xword	0x7388f110b4f59b3e
	.xword	0x09506a1d2fbf8212
	.xword	0xe9c14829636327f8
	.align 0x8000
	.data
data_start_3:

	.xword	0x61371b913e79e7ff
	.xword	0xa20e5eb980e30675
	.xword	0x984230048eb75f9f
	.xword	0x31d770d981940df2
	.xword	0x5069757fe59163b4
	.xword	0x4f2392e3820d4b89
	.xword	0x51e8869d63d8d1f6
	.xword	0xf97ec6673af690c5
	.xword	0xf89a73a29df35b7a
	.xword	0x2e7b50fe06366154
	.xword	0x2089f1e8731a5235
	.xword	0x1f85329bcfb44b6b
	.xword	0xeacfa4bed5e7ce03
	.xword	0x854147843da40c4f
	.xword	0xaeecb7b989fc453b
	.xword	0xef358b794a01a909
	.xword	0x910350b28683293c
	.xword	0x5891be5a63b36158
	.xword	0xabef772a68c9993d
	.xword	0xd68e81f7d9e871dc
	.xword	0x55fbf033e6f033e9
	.xword	0x1cca24203e0a4a2c
	.xword	0xd7419762f181e31a
	.xword	0x35b5ff4c5924b0e3
	.xword	0xf9b71707fa76f146
	.xword	0x3e848c32f5407ab5
	.xword	0x4ab8a570588ec8bc
	.xword	0xbe9af2907fbea0d9
	.xword	0x16e9d95f1db569a5
	.xword	0xf3a69622d21666c8
	.xword	0xadd92d7181bf948a
	.xword	0xdef8c095454a5ea7
	.xword	0xb1766b974fca70de
	.xword	0x7e3f0c8a51fb543b
	.xword	0xe99ffdeab64d15de
	.xword	0x3f7052eaaf46e181
	.xword	0x793f256cf981cebc
	.xword	0xd28b43859caba3ef
	.xword	0xc4c3d17a3e6fdf06
	.xword	0x8153a49ecd3862d2
	.xword	0x942d6e327e66e9e1
	.xword	0x25fb0b5a3526ce62
	.xword	0xcd3036c33e534293
	.xword	0xf9e6865dcbaace55
	.xword	0x0e5397d60db3926b
	.xword	0xec0a18614f5b689a
	.xword	0xf02b8291e527e587
	.xword	0x17c38fdbb515566d
	.xword	0x8ffe57de90ee29c9
	.xword	0xec1ef40f8f144567
	.xword	0x53da9cc7b0d6f50e
	.xword	0xc2cd030c2ba3f768
	.xword	0xf8e1102b4d15cc4b
	.xword	0xbd76325fa87536c5
	.xword	0xe3407d8a1797a979
	.xword	0x8b5ea0bbc478b307
	.xword	0xd9c2020f72941ecc
	.xword	0x4364fc470509dfc7
	.xword	0x81a091dc2b25b0b9
	.xword	0xaadb3f05e996da51
	.xword	0xee27c5d65c0e8104
	.xword	0xc9c8cca6a8d0824d
	.xword	0xb90bf7173153c314
	.xword	0xec4ef1673e81fd69
	.xword	0x5e3c5baea046db09
	.xword	0x5e5733cf8ed0c474
	.xword	0x56e512bd8bd80d5c
	.xword	0x8e4c2ecd09b6593b
	.xword	0x841776d12b3db5e3
	.xword	0x3e540be6e2f7e6e1
	.xword	0xff84fd484a177b88
	.xword	0x3fb870d5759a1a48
	.xword	0xe68086793b38089b
	.xword	0x265a75554998c218
	.xword	0xbda3b540a121382b
	.xword	0x6667d73ba000500c
	.xword	0x476732187f5e50f0
	.xword	0x6844aefeec823923
	.xword	0xe8dc6a9f77eb5c39
	.xword	0xcecfd8e286fe6e4a
	.xword	0x191cefba47960329
	.xword	0x6e7af5e6e4fa752e
	.xword	0xeead5411d86e5a04
	.xword	0xba7a636213513f13
	.xword	0x885f4b2b0b236f29
	.xword	0xdc0ec9cb23048a4e
	.xword	0x1e7199bd284cf53e
	.xword	0x972563af5e15a455
	.xword	0x2ae9968df6ae50ee
	.xword	0xa6828a265bd3ba27
	.xword	0x2f5afc1e6625cdb7
	.xword	0x31c2f1aec0643474
	.xword	0xb2ef00a76143f134
	.xword	0x2b365ab6c753e750
	.xword	0x22d109aeb9a95592
	.xword	0xacf36da72d7d7dd5
	.xword	0x99747e304d0d9698
	.xword	0x7b5b55b039f80dde
	.xword	0x0ccdfe95eee8c1a8
	.xword	0x578ed6712cb00915
	.xword	0x9347cde232f5ec05
	.xword	0x59584a8836a7609a
	.xword	0xcf0d6ccc1548139e
	.xword	0x98e3462fdea6b679
	.xword	0x735339828c079c51
	.xword	0xd7dd9ae5e5b90ab8
	.xword	0xf896f993de953502
	.xword	0xc5038f46bc2b2306
	.xword	0x833e58f5e10da037
	.xword	0x79f0c364d3cf719a
	.xword	0x94885206fea1ae48
	.xword	0xfc8b1b9b28049fe2
	.xword	0xe02136da79ed0c82
	.xword	0xa07f09d59448ede3
	.xword	0xd38a67fd9ea6ea14
	.xword	0x1afbb0afa24f15bb
	.xword	0x9ea30c48fd7d6c90
	.xword	0x56b13beee48b333a
	.xword	0x8e72e36c21192239
	.xword	0x52a0a5d2dad00e90
	.xword	0x182c7d83370fa23c
	.xword	0xe46fc0e3632f0158
	.xword	0xf67bce5ea6c05885
	.xword	0x901d41d710189f65
	.xword	0x7996de53b7efb881
	.xword	0xc2431416280397c7
	.xword	0x0e3cf3e78628b553
	.xword	0x5fc0ce7886008a1c
	.xword	0x3a441910d06771a1
	.xword	0x6f996b0ab6f75236
	.xword	0x741884ffee013a9d
	.xword	0x97ce89e7d5572d4a
	.xword	0xc04113dbfbb4dfc0
	.xword	0x64e9e2805442c68b
	.xword	0x6d565cac3b848f01
	.xword	0x30ce576a245e7826
	.xword	0x3ca849c92d03154d
	.xword	0xa4b5331918f7b881
	.xword	0xd2119ceb66f3749b
	.xword	0xb53ed3bbc951636a
	.xword	0x01593b1c7c773dc8
	.xword	0x235441c0a431cbcb
	.xword	0x27414698efc59e46
	.xword	0x4ff96890c94e360c
	.xword	0xf2982af0a988d151
	.xword	0xaff8df84d5ea2e30
	.xword	0xb2684e3ab93eaec2
	.xword	0xcae1e588fec332dd
	.xword	0xb2e856d02e5d1f01
	.xword	0x7c42d216783c2f48
	.xword	0x5049f033e84f6efe
	.xword	0x1f049760134dca37
	.xword	0x6d4e12fd5944a7c3
	.xword	0xd6da7b04ba2dce6c
	.xword	0xfd90c6d44136a29c
	.xword	0x0b10b4a9b20ebdc5
	.xword	0x015f131a33a549d5
	.xword	0x1b45acda75a89cc4
	.xword	0xe5f427d69a6c5309
	.xword	0x2d2d291e3885654f
	.xword	0xd77b4f811b7adf6e
	.xword	0xc1d20ae6e011d298
	.xword	0x0145e54cbb096ff6
	.xword	0xe86977d64c30df1b
	.xword	0x241924c90870a3b5
	.xword	0xa50515f6a766f9d5
	.xword	0xafba6a07edae66aa
	.xword	0x33862d80ab534ec6
	.xword	0x2b9b7bcc33d2450f
	.xword	0x97021eee4d788be2
	.xword	0xd86420e3f185aa49
	.xword	0x6c3b826b74271a23
	.xword	0x5b3f61289a302606
	.xword	0xc7f8b0278972478b
	.xword	0x7d2758f067f03d71
	.xword	0xdf50d03778eb9f78
	.xword	0x83df5ab3127741d4
	.xword	0x7ba87a14b7e77586
	.xword	0x59c324387ac58220
	.xword	0x5c8dc35d5c826725
	.xword	0x7bd56e8f6b1a8f22
	.xword	0x1f16deaae8284abf
	.xword	0x61480663eb3c0afc
	.xword	0x467b17c698c5e786
	.xword	0x8afede62be84b304
	.xword	0xb6fdf5ba9df7d30d
	.xword	0xd79f8667f17727c0
	.xword	0x5e2e19d0660581d6
	.xword	0x2d2377a9a0b1a4ae
	.xword	0xa2ce99c488d06032
	.xword	0x35d4dedd3cc6cdef
	.xword	0xeb214dbf7f90d9d4
	.xword	0xfc5ec9004eefa462
	.xword	0xcfb8d4bd2bcdd2eb
	.xword	0xab506db69832f959
	.xword	0x847407a108f7f4f4
	.xword	0x0ae7d1dd6f88a5e8
	.xword	0x038657ca895947e0
	.xword	0x3ae7c670560a45aa
	.xword	0xb708d464d1096ef0
	.xword	0x4c4b63efc27276ba
	.xword	0x4f88c437aad583f5
	.xword	0x6dfd9964a10443d0
	.xword	0xe4bf2cadf9481ad6
	.xword	0x156ffca252429498
	.xword	0x55cc1821866f3313
	.xword	0x2d0ce14bfa58ffbd
	.xword	0x0eaba15b5dc1b950
	.xword	0xff28f12703280ce7
	.xword	0xa6554aead3f16298
	.xword	0x1e2fb250c8d98978
	.xword	0x50a2708cce498966
	.xword	0x8d69027b4623dc7e
	.xword	0x3cbc5697c4457630
	.xword	0x5b84253d670e61ef
	.xword	0x614ec27656e47f96
	.xword	0x0eb73e2182267f8f
	.xword	0x36ca4e5ff5c9584f
	.xword	0xac92bcc682cd7f67
	.xword	0xc7438154490c26be
	.xword	0xe230de55cc560ef5
	.xword	0x16e96e80737d782e
	.xword	0x754fe179a1657d92
	.xword	0x8e11364769ce8890
	.xword	0x83acb13cb9865680
	.xword	0xe0cc357c24aff67e
	.xword	0x710f615c137d7caf
	.xword	0x745000264dc26021
	.xword	0xf5a41a2eb6ebf293
	.xword	0x07f95907ec3a649b
	.xword	0x193faa932eb9c0b5
	.xword	0x07d3436f1dd41c9b
	.xword	0x235c2187ed3bc30a
	.xword	0x3b1a0bcfb147967a
	.xword	0xa024c5d7bfbf81eb
	.xword	0xd0210358c16f5fca
	.xword	0xcfc1a90d8ea83164
	.xword	0xff5b07ffe64efc06
	.xword	0x6466e990c07d89bd
	.xword	0x7c1c86c747e9b365
	.xword	0x2cd34d07c0f93bb8
	.xword	0xde9132c3b8806b90
	.xword	0x8c73e2893c1915ce
	.xword	0x346128c19d1326e3
	.xword	0xb723ba64e8eca085
	.xword	0xa20655d6f62fa99c
	.xword	0x2575d7a3de79b845
	.xword	0x84d7ae2f3d23dd2c
	.xword	0xe54f68c687aad328
	.xword	0x0983111a2e1e3250
	.xword	0x5305536bb821650b
	.xword	0xaf34fdd288b93ec5
	.xword	0xd92185a092c54889
	.xword	0xbebedaa6ab7d6786
	.xword	0x42980fdff0401f05
	.xword	0x488d0bf117b75f71
	.align 0x10000
	.data
data_start_4:

	.xword	0xc6c41cc375f40314
	.xword	0x6a2969a46359b250
	.xword	0x82456a84f40cbe6b
	.xword	0x3a1937beffcd5949
	.xword	0xfe342bd3ecb5cacb
	.xword	0x8349e4a67a8a9eea
	.xword	0x9607ee1521e06199
	.xword	0x1d4328b92a06ceb7
	.xword	0xc6be8af2bf90d218
	.xword	0x806dd9d0e84a1917
	.xword	0xc04e55348566da84
	.xword	0x62da62a01c06e83a
	.xword	0x8cd227566a360563
	.xword	0x79b70eeecde626d4
	.xword	0xda8d1736650d32cc
	.xword	0xb7937ce93cab5e46
	.xword	0x78f114f24a36bf71
	.xword	0x07c5aed9894da896
	.xword	0xac871c0121bbb5bf
	.xword	0xee19dcfdc00ef111
	.xword	0xd4e5f9809daa2b4d
	.xword	0xcdfe31377242f9bb
	.xword	0xf6bd300f3a800411
	.xword	0x8c6669df4c80fb06
	.xword	0x9ac2639eee4fc81c
	.xword	0xa891a5fc9fc00aed
	.xword	0xa66916d6ed1bcb64
	.xword	0x82247375c8579e00
	.xword	0x79d643f357d74530
	.xword	0x13a9f6e0a7b1473a
	.xword	0x6fe0416d00a58c34
	.xword	0xab6c9b0108f54df2
	.xword	0x796dfe9453782539
	.xword	0x14e4bb04f723d279
	.xword	0x1dfcb71a87f9e0d2
	.xword	0x4b26b80b078cccf3
	.xword	0x9f1c35a7cb806af9
	.xword	0xa243e04fd0ddd44d
	.xword	0x4d2b7ccae131a1b6
	.xword	0xc38382a10bd96ee8
	.xword	0x0f95eaf8ec641071
	.xword	0x61a7e6960a9e2c4c
	.xword	0x0956e2274cbe0c39
	.xword	0x6d718adcaa5436a7
	.xword	0xc9571bc276a5d53c
	.xword	0x88602758b098265f
	.xword	0xf5313817d9c72dc4
	.xword	0xd81d76e4092e6f23
	.xword	0x7bea680406afd68c
	.xword	0x1c2cb5e8298b89f6
	.xword	0xe3da357454c68161
	.xword	0x5f5caeb2102d2f30
	.xword	0xb9bdd9bb1e61340b
	.xword	0x26f5a2187b0d49a2
	.xword	0x4df99945c8b7190e
	.xword	0xf4fa9b1b1a733608
	.xword	0x00f28acbfade23d3
	.xword	0x4fe1ca4d23809081
	.xword	0xf66568612ab8cea3
	.xword	0x4b6f9ab3401557eb
	.xword	0xa1974ac9db536338
	.xword	0xf98ff7e4a54566c5
	.xword	0x7d12baefe67184bd
	.xword	0xd7f2fd3802b83354
	.xword	0x9e250fa7db7e5de2
	.xword	0x9e98d8a1811a9e58
	.xword	0xaa7b7b4fe85c3f5e
	.xword	0x8b038030feb2db53
	.xword	0x3f6405698b4a33c8
	.xword	0x0bc9215f9f84bce8
	.xword	0x62ffcb81ae3a1357
	.xword	0xd5e29896b7031786
	.xword	0x5a3d0f4e96220678
	.xword	0x0d6371e722145c12
	.xword	0xcdf1210f380334e4
	.xword	0xcd6dcc6b4562d243
	.xword	0xa640745ffdc60826
	.xword	0x9b3c5a8d1aed8642
	.xword	0xe7fc008e48598972
	.xword	0x3392bb39ee59c116
	.xword	0x20203cd084160fed
	.xword	0x61de9620ddc970ad
	.xword	0x54c5a4bb67a0a49c
	.xword	0xc7101efb443a45a4
	.xword	0x5c708542d9431bb3
	.xword	0xaa7c8da13232fd3b
	.xword	0xa00013586d549bf3
	.xword	0x638c322bc995ae33
	.xword	0xf4c9b29b16280d8b
	.xword	0xb8a0919407a0ef2c
	.xword	0x2d41ebf298d88341
	.xword	0x3fd3db1d45660a0f
	.xword	0x0ceeff9c344518c6
	.xword	0x7cced7909771fb31
	.xword	0xc93ae0c2894ec584
	.xword	0xb519a95ccd1ff8ba
	.xword	0x66d07ec6cae64875
	.xword	0x56ab926226523c7e
	.xword	0xaae059a679b779eb
	.xword	0x87a46a0917f6e1e9
	.xword	0x444b60cb8679c57d
	.xword	0xd4417e69a691877b
	.xword	0xea7c73aa8d63d1d2
	.xword	0xdf8dab0f662c3e26
	.xword	0x1c07262a75036572
	.xword	0x3d2426dd2bc45559
	.xword	0xe906e6183c9c22be
	.xword	0x638cf03b93644275
	.xword	0xe844244a278c76a5
	.xword	0xa6787e3cc1f613c4
	.xword	0x08fa29a68f92e712
	.xword	0xbee29aa8901dcfdf
	.xword	0x16a0374e54cbdb9b
	.xword	0xd705d92d0ed401b0
	.xword	0x48b6e32b554cdd23
	.xword	0x3f2f8a6d668a1cf6
	.xword	0xf692f4cb54b1d4d3
	.xword	0xa757e0fafe98be49
	.xword	0xdf8bfaf3afd32ad2
	.xword	0x499d5c404b833be3
	.xword	0x32269a5192caf1c6
	.xword	0x79fb90b059b7c0c6
	.xword	0xec52cf734e1dc9c8
	.xword	0x8da29a0d9682f24e
	.xword	0xcbbfb42402e32a02
	.xword	0x11667189ccf72420
	.xword	0xea1e7a6915891775
	.xword	0x0ad1b5070e3884e6
	.xword	0x1500decc37b9e73f
	.xword	0x2c7b92ec782d9e33
	.xword	0xb2029c0149b3aa10
	.xword	0x942ef8ce0d1450cd
	.xword	0x658f868c2a0f1033
	.xword	0x909051bba23db0d5
	.xword	0x2e2ec764e541c4e7
	.xword	0x02dbbc899b186a65
	.xword	0x21fc170fc2eb9b13
	.xword	0x95ecb683d69cbbff
	.xword	0x2c48a4a4dd8b336d
	.xword	0xb5b92455f93979e7
	.xword	0x08b6d0b5de98423e
	.xword	0x0a6b192a18dd3b67
	.xword	0x14e8d1c207079974
	.xword	0x245c54f9fbe28c1d
	.xword	0xcd5e54d288135b6d
	.xword	0xfae0ce7cbdc6f22a
	.xword	0xcf1fb955bb4052b1
	.xword	0x973f25f499d07204
	.xword	0x10c3ab1b052731ab
	.xword	0xdcde2e6c4dc9a69d
	.xword	0x5d0171d8bda83082
	.xword	0xe9b83b40cf30419b
	.xword	0x4a8aedf342bda0aa
	.xword	0xc4f923f590790df9
	.xword	0x20d7a1d3e15dc330
	.xword	0xf2263615236e0dea
	.xword	0x543759f15047c9aa
	.xword	0xf78e3325e762b9bd
	.xword	0x7204db4d05b3f892
	.xword	0x2070fb91bbfb1eb0
	.xword	0xdacd20513a5a79d4
	.xword	0xc61897fb867ceb04
	.xword	0x44fa5317c4f97c6a
	.xword	0x8d8513e6d7ba8887
	.xword	0x9c13553328f01e1f
	.xword	0x0bab70817fc6f051
	.xword	0xa9e64f61f2d36808
	.xword	0xeae135f3cce603cd
	.xword	0x0b8969bbd42a4785
	.xword	0xeb93f5d499663088
	.xword	0xfd7e2ae13cd0b371
	.xword	0xac5a263ea58156e0
	.xword	0x26bf37c6f3100dbc
	.xword	0xa576eb3f71867bde
	.xword	0x9b94b84a3e9e6f1c
	.xword	0xb0b3a77ee1377965
	.xword	0xdf871c23f145684d
	.xword	0xbc766e957625de34
	.xword	0xcab0de2be2be9553
	.xword	0x2a412ba5a82c9656
	.xword	0x173876011bbbaff8
	.xword	0xe432b1b7a5e2bb8e
	.xword	0xeab81df33a3daa47
	.xword	0x06d8137d4e60e0cd
	.xword	0xce15a293bbf9ea15
	.xword	0x8f290688b495bcbc
	.xword	0xe99307244c5b5dc4
	.xword	0x89b266b2c58f71ea
	.xword	0x05dfcf7b72d25735
	.xword	0x32a5c954fc17d5e4
	.xword	0x63b5b7fb7e1a0e2e
	.xword	0xe08b9aae179ad7de
	.xword	0x0a46d94656a03893
	.xword	0xc732d90385856967
	.xword	0xe46fedba1563288d
	.xword	0x3fda1de7e102b9b1
	.xword	0x25b539ffe89cf241
	.xword	0x333188e51e874b4c
	.xword	0xa002d4ee6fb25bf7
	.xword	0x75b0baefd58e4082
	.xword	0x8d93eb0877931112
	.xword	0x72e93701cccbf63a
	.xword	0xeeedb750662c82fa
	.xword	0x9c80c081b21cc756
	.xword	0x042213ea456db32f
	.xword	0x1a5668a9fd98a8d6
	.xword	0x5831ef0acc56889e
	.xword	0x5508269baf5df156
	.xword	0xfe43a2a529936a61
	.xword	0xf7c91e61c5c1a3b6
	.xword	0x7a331838e58d6f4b
	.xword	0xfb54dc498e2ef61c
	.xword	0x6fa72bd77f7b6ae4
	.xword	0x8b32561183561467
	.xword	0x528a88a7b0b5a7d5
	.xword	0x1f9328b3600510a2
	.xword	0x2290afca03d5aa09
	.xword	0x9e555d36bccd4ce0
	.xword	0xf0a259bf56201103
	.xword	0x1430580752a1dd53
	.xword	0x5e83fa342d659b60
	.xword	0x6d20493e4f01fe0c
	.xword	0x6cd6e0b71263bdb8
	.xword	0x192911ce3c9bec47
	.xword	0xce85db8b6c0834d4
	.xword	0x8fcfca1c851de2c8
	.xword	0xad83bb8ec8d68bf6
	.xword	0xb71c7a19aa75c952
	.xword	0x233ca331d69296d8
	.xword	0xa1d157ba0a6dc723
	.xword	0x1b994dc330dc33b3
	.xword	0x8aee62666eabd861
	.xword	0xe753ced678baef05
	.xword	0xde3b8f0d47d7d02c
	.xword	0x4f1e243867b3124f
	.xword	0xd3e8eadc9211d3a7
	.xword	0xe2eede4ad7ee0473
	.xword	0xeaacf1ab466622fc
	.xword	0xb382682368b15ee3
	.xword	0xebfdd6c7c4ffb135
	.xword	0x80e3267b29863521
	.xword	0x9529c629c4c7be50
	.xword	0xe94800f8bbe5c3e5
	.xword	0x7970a5236eb7d7fd
	.xword	0x87e25b6554669377
	.xword	0x027b2913371bcafb
	.xword	0xa74ec9ea8f5d8913
	.xword	0xf239adf2bd233b38
	.xword	0xfaa92c0105390c2d
	.xword	0x3be1cb35c35af5ab
	.xword	0x13710960c9fe532a
	.xword	0x2821873ed8b9d7a3
	.xword	0x02d7d3e2b1a82d18
	.xword	0x7af6ee6bec3fca50
	.xword	0x1b092d100f5aba2c
	.xword	0x37d90eb1d7e23f85
	.align 0x20000
	.data
data_start_5:

	.xword	0x182c336debd84c55
	.xword	0x7f2527e2b510b467
	.xword	0x8703e5be6537e43b
	.xword	0x67c9675292dc1383
	.xword	0xb1b4ca9eb0e8b7fc
	.xword	0x0f6742c3c5b3758b
	.xword	0x427c6f6eb81a062f
	.xword	0x1d1fd3c6673b95c4
	.xword	0x520849c5b47ef575
	.xword	0x5172dd588179afaf
	.xword	0x9a54b41949077f7d
	.xword	0x504a5819bfeedb1b
	.xword	0xcde91b9df7732ea0
	.xword	0x0d19d7ae251c9413
	.xword	0xa72946fc5a5a3884
	.xword	0xb686fbcb9034289c
	.xword	0xf7795ea3afd71386
	.xword	0x7600f325fa351bbf
	.xword	0x620f0a8e21c74095
	.xword	0xc7c19d2e1751851c
	.xword	0x1a6a87008fdd1a5d
	.xword	0x02c56b0ec0a7d749
	.xword	0xfc259904935d7d8c
	.xword	0x8b8aa2c2182c507d
	.xword	0x2831544c4d4e2bfe
	.xword	0xcc1bd8202be3131e
	.xword	0x711b98d44370c55c
	.xword	0x78182dc1983a0d00
	.xword	0x10bd37a29ff89463
	.xword	0xbd0a47e7d5c756b6
	.xword	0xc03f7196237b2bec
	.xword	0x4539cd597f99ae79
	.xword	0x5403b489c6f80862
	.xword	0x76fded2b6e226978
	.xword	0x67daa84558ee764c
	.xword	0xcef597447d7cbe8f
	.xword	0x2acc889c781fd691
	.xword	0xe5d2e991a3126f72
	.xword	0x927298a0a792e730
	.xword	0x6f509ad4ffc1f5c7
	.xword	0x80571b36d6979437
	.xword	0xec030afb66ec44c0
	.xword	0x04e10975a262a576
	.xword	0x37a3e1af03ce0962
	.xword	0x21a98b88d4a9575d
	.xword	0xd0d2f70bc41bd379
	.xword	0x395946691cf2e8d6
	.xword	0x199fb3f8838f1b2b
	.xword	0xfc9e7544a5029fda
	.xword	0xca85a924a4978e1d
	.xword	0x9056a41ba14e0aeb
	.xword	0xc85a9aadf283dbf4
	.xword	0x721198ab5e371b75
	.xword	0xedfb133ab01b1b68
	.xword	0xc9e8898ebc83fa01
	.xword	0xf3a5626d881f637d
	.xword	0xedf46bb3e8202212
	.xword	0x610c6fc2a6bfaaec
	.xword	0x49c5d7ff7e830f2f
	.xword	0xd6e5f031716026d8
	.xword	0xcc85ba0c8b540285
	.xword	0xc9fa64cc60fbe033
	.xword	0xfa1858da7d6addb0
	.xword	0xb32524e2bac1f811
	.xword	0xa0d9f37af6a13104
	.xword	0x9e7f141ccd48302a
	.xword	0xb91664a7aa5dbf24
	.xword	0xc6361e9ef1ca4d13
	.xword	0x2a79ff931603dae5
	.xword	0x8fe0e778a3331397
	.xword	0x8c44226c3303fefb
	.xword	0x44c729d426496199
	.xword	0x52d4212b618adf4a
	.xword	0x12d038cb070430d4
	.xword	0x7656f85571d20b9c
	.xword	0xe08751c752725202
	.xword	0x7e4b65d6624fcdff
	.xword	0x3d25b68c78b0f6f8
	.xword	0x88199f54115a1c30
	.xword	0xd80facd3c77cc85c
	.xword	0x03dfc470ca8c2cf4
	.xword	0x3362b537488cb75c
	.xword	0x8e5e34bb058ed764
	.xword	0x2f72dc4e81684dff
	.xword	0xa4a69948fb3c6afa
	.xword	0x4fd3fbae84c0631c
	.xword	0xdc027a588f3ae840
	.xword	0x93fae2ef1a373af6
	.xword	0xf03b9f2f73d18af8
	.xword	0x386bb160aa765051
	.xword	0x51a11afa29fad70d
	.xword	0x878ffff1e220efc5
	.xword	0x3c70d447761f605f
	.xword	0xe597e5fb35606b39
	.xword	0x0098b14fff2b79a5
	.xword	0x0fc28e573b9d75af
	.xword	0x169f071a04d66344
	.xword	0x03570f4c7ca2109a
	.xword	0x7c3685809372bb84
	.xword	0x74d9ef3419a32549
	.xword	0x3ef80fac18983efd
	.xword	0x525f385845d4ce38
	.xword	0xc2543c0d623502de
	.xword	0xd70cb49f03f14bf1
	.xword	0xe59116734fc1a315
	.xword	0x8cede7db40f94881
	.xword	0xb09f1d2b52940ab7
	.xword	0x4898adc3d4819762
	.xword	0xec9edfbc191b6dbf
	.xword	0x059719cac0ff2bd2
	.xword	0x71ba9fcfe594a8e7
	.xword	0xf127452730842fc6
	.xword	0xb039ace4fbea77b5
	.xword	0x09d5f67f16626590
	.xword	0xe8716b4c574214e5
	.xword	0x9b04fa6d43d4e4c1
	.xword	0xeb83d2ced3435154
	.xword	0x4a0b87b4a9a699dc
	.xword	0x0f73aa9ddf120d69
	.xword	0x9d8da3fe87d5b7b8
	.xword	0x2d208de8bbc8e71f
	.xword	0x2b3f287eb2a77d7c
	.xword	0xdd2b0fc98f998ff0
	.xword	0x05c2cf8a4acaf2a5
	.xword	0x55d26b1e322f58c2
	.xword	0x217aec6a567391b5
	.xword	0xb824e8c3b5f65b3b
	.xword	0x64b77d5b6d39719f
	.xword	0x86cbc407c19616b8
	.xword	0x73d9989a542b07c6
	.xword	0x6da0e931aa729f40
	.xword	0xf8de080f07c7c735
	.xword	0xf75b272ec281fdb6
	.xword	0x4f4f9082c20e0485
	.xword	0x38d0ab62899e38b2
	.xword	0x04f9e02f0278f996
	.xword	0xd8596793565eecba
	.xword	0x3e962c21d11c31cd
	.xword	0x0ec1fd5ffadf8d7a
	.xword	0xbe977b595f76eee4
	.xword	0x65269722e8c1dcd2
	.xword	0x9f8eecb7db0abdbf
	.xword	0xcce114d7aadaeaef
	.xword	0xddc9c5e4685ce799
	.xword	0x0c705fc11801043b
	.xword	0x8923b927191cda3e
	.xword	0x8eda2d231f691092
	.xword	0x00b0c702dcbc3dfa
	.xword	0x5022e03c7bb00650
	.xword	0x3513f0f6bfd5abf8
	.xword	0x247a1dcebd9280f3
	.xword	0x4ed803fa43be6a58
	.xword	0x4d95ae5aec52de8e
	.xword	0xe65499d16a6b7fea
	.xword	0x8d46e7ba0d6e7369
	.xword	0x9cb1075740b6a35a
	.xword	0x802dbf444ec1979a
	.xword	0x6852d523fe216063
	.xword	0x24131b6ce6648c0c
	.xword	0xeeb104afdce3f521
	.xword	0x7cbc16d6c34aa2cc
	.xword	0xc92f4561068bfc68
	.xword	0xf4e969b22a4ae001
	.xword	0x3655a757d04ea0fd
	.xword	0xb3e720a0f1f4c4a9
	.xword	0xc25baa694aa7402b
	.xword	0x8636c043c328a54c
	.xword	0x558e6dfaf3f5dbdd
	.xword	0xe676e35264355491
	.xword	0x393dc3567d206b5c
	.xword	0xeb7088de324f8d4c
	.xword	0x7c3ac2ac8c21e2c4
	.xword	0x8eb2518bed0b94a8
	.xword	0x90a466f1cf10d921
	.xword	0xd79b064113c11809
	.xword	0x7cd4028ee711459d
	.xword	0x2961eef2990e077a
	.xword	0x63fdc3049f0f5afb
	.xword	0xa9a9417500e3d13f
	.xword	0x3573d1239b9940ca
	.xword	0xfdc0cf130f9600c8
	.xword	0x483385cbeb78a955
	.xword	0x9f45de2b83d0631b
	.xword	0xa8a3cc325949780e
	.xword	0xc10b731284d4a69a
	.xword	0x25beb7ceba30b7e0
	.xword	0x44068c20dd76a22c
	.xword	0x63f00fa071560f6b
	.xword	0x7f7da5efecdfbdfd
	.xword	0x38337149ab2ba814
	.xword	0xf06e3e29e0d7bb6b
	.xword	0xf18d4baf49cfccb1
	.xword	0x37830ee5087183d8
	.xword	0xd7a5995a76a6d808
	.xword	0xac3d7e3e1e711d2f
	.xword	0xd7bf97d136d2f9df
	.xword	0x97a596962113360c
	.xword	0x52c5bf778d44cb54
	.xword	0x3f105b278dc345b1
	.xword	0x0f593d0a52d3bdb1
	.xword	0x4796c689cbaa5129
	.xword	0xef0454ce3ef7b27c
	.xword	0xfafbd4734fe1318b
	.xword	0x6e6342e34b050fcb
	.xword	0x000cf23ae851ffe4
	.xword	0x990f64cc34acfcc2
	.xword	0xb678a9c1d85a6232
	.xword	0xa03ce837014ad43e
	.xword	0x950e3990d8854437
	.xword	0x6948548c00847c00
	.xword	0x986b1dcaff4b89de
	.xword	0xb11339148c3c2985
	.xword	0x253ff24cc3da3513
	.xword	0x3c4247228d7cfea9
	.xword	0xf4b17a20553d6f96
	.xword	0xe6ac80e44e74cbe0
	.xword	0x170de05519c2a5d5
	.xword	0x819be9bc660835fe
	.xword	0x116ce5bc35421592
	.xword	0x8c994b80547dc1c9
	.xword	0x350c2733de8172c6
	.xword	0x62e4a81d73843c6d
	.xword	0x79555d504ad27b42
	.xword	0xd12c62beefda5f8a
	.xword	0xefac2ab08a74a5c7
	.xword	0xad8e5ebbe01de16b
	.xword	0xd91ed2493147d7bd
	.xword	0xffd0a600964964b5
	.xword	0x2596e57710f77005
	.xword	0x27ce1c39e303d83d
	.xword	0xf3d4f1483ef9ab74
	.xword	0x5608ebd6011c5273
	.xword	0xa64c12062ecdc1a4
	.xword	0xbbb88b020ab1f662
	.xword	0xb8d0dcd1d840c60f
	.xword	0x19652056d001a249
	.xword	0xb7ea0bd062b047dd
	.xword	0x48800d06b54d9997
	.xword	0x0226213f95538c6c
	.xword	0x0a8280e1b85e2323
	.xword	0x58ebfda7a4c433cf
	.xword	0xed5c6b3f6f5d0651
	.xword	0x348dc47e5d0e9c96
	.xword	0x1d4464831418995c
	.xword	0x4319ddeac69e6c55
	.xword	0x5922d81a1e1775f5
	.xword	0x1c041f7ef0ee7361
	.xword	0xea922f101cb40f69
	.xword	0xf748414e0cc7e20d
	.xword	0xd2940c22ba982914
	.xword	0xdb22a04a43a3f274
	.xword	0x826c768288930a3b
	.xword	0x54e33c65c3146b77
	.xword	0x66a14d0a2bd234fe
	.xword	0x859004d8d53ebc10
	.xword	0x29167204cd5ed151
	.align 0x40000
	.data
data_start_6:

	.xword	0x626a9118e4253cbf
	.xword	0xd8c665256e18bfda
	.xword	0x632079ad35fe3770
	.xword	0x37d070856240055d
	.xword	0x71915f69173fb8b6
	.xword	0xa7546a53115325b9
	.xword	0xaba667a79d549da9
	.xword	0xf2b7d8773f7fa785
	.xword	0x5585c84d06d742d4
	.xword	0x151605561be7f478
	.xword	0x6087d8fbe64c4b49
	.xword	0xa665c23a737a4410
	.xword	0x5d5a6d5dcb217082
	.xword	0xa3f0c10c9a248b4f
	.xword	0x2598526ccee78d35
	.xword	0x5f7227e18e666e2c
	.xword	0x8dbaebb45eeeae43
	.xword	0x448d6fe7cc05d5fa
	.xword	0xe670c6479a0c0a34
	.xword	0x7d91fe5cca7c3396
	.xword	0x5b2f91c0d2df47e2
	.xword	0x81e7f4899081a1cb
	.xword	0x76d6e33845481fc4
	.xword	0xcf9b9bd3e81d9adc
	.xword	0x92f9871ab7015d2d
	.xword	0x1ed7a9d6cf045925
	.xword	0xaf4e52aa57be6b68
	.xword	0x1d5291bec5c6a09f
	.xword	0x57f456f4fb9807d7
	.xword	0x2a643bd7ad60cf50
	.xword	0x3fe7290d574bb3d7
	.xword	0x65f6e85f6b333600
	.xword	0x6093db7f021728c3
	.xword	0x3b0e39ee9fd751f7
	.xword	0x5f778ddb2dbeba78
	.xword	0x7b710968be61d8d9
	.xword	0x1291729f830c32bc
	.xword	0xd1b815edf42840a3
	.xword	0x92dd957c1b47b391
	.xword	0xdc5e203ede15b6bc
	.xword	0xd0f821db2f1766a5
	.xword	0xdcf19cabe4f97570
	.xword	0xca6290404f58102a
	.xword	0x4a5a7c7301bad2ee
	.xword	0x73e6cd98c51a2e66
	.xword	0xe23f357e6afa287a
	.xword	0x1bdf39268367ea04
	.xword	0x29872b3cec05078a
	.xword	0xba3d52b319fc0d6b
	.xword	0x17f2d7f663261bae
	.xword	0x8348f591f3894a47
	.xword	0x91a244bb3554c370
	.xword	0x8b025e78dc26cf03
	.xword	0xdd83b86f1d69eb5f
	.xword	0x16ba9808332c559f
	.xword	0x0f24058c836b650e
	.xword	0xcd5aeca10ab5524a
	.xword	0xa4d22c7a8c8dd416
	.xword	0x0ff0a15d53af26c0
	.xword	0x9c3bdbff54e141f6
	.xword	0x880bbdfd86128bfc
	.xword	0xb6564c0d9d942065
	.xword	0x98c2aed1257bfc53
	.xword	0x52b659915be1c7ad
	.xword	0x1f6570c955fab5c3
	.xword	0xd3de3cbf59c7edcc
	.xword	0xd7a8bb1edf348e18
	.xword	0x856ab58c6306b122
	.xword	0x075b2c8f8274360e
	.xword	0xfbf5cee0b95293fe
	.xword	0x286e33fe5b2c78b6
	.xword	0x50a2110cdbe50611
	.xword	0x778f0ba50c7b2648
	.xword	0xc5d769b87444d1b0
	.xword	0x22f11f5d8137f1e4
	.xword	0x7f78e13ec58f072f
	.xword	0xfb8fd73ab0dc7ede
	.xword	0x2399d3c027d87990
	.xword	0x54939c2d6658a66c
	.xword	0x23fe0c5b10646a70
	.xword	0xadbb997acaacbd7b
	.xword	0x28b12d68537fb896
	.xword	0x216dc768d2a256bc
	.xword	0x26787ef7420403dd
	.xword	0xac83c219c638aaf1
	.xword	0x9277b0e9f8e379c7
	.xword	0x47bf35b7fe44633f
	.xword	0xca1d200b66053c3b
	.xword	0xaec109181239e1e6
	.xword	0x079440a60c7b4c24
	.xword	0x4845278585678bc8
	.xword	0x68e2c822725c4fa1
	.xword	0xc9bcf93660cd1b78
	.xword	0xb1543b8b12949b62
	.xword	0x3e6381b1b89e0973
	.xword	0x0073ac6f1f75202b
	.xword	0xa2e960985a41190c
	.xword	0xd718fc5176f4c15a
	.xword	0xb27a5b0bc6ebcd9a
	.xword	0x511afe638ea471a3
	.xword	0x532523d2638488b8
	.xword	0x4da5bede581d69bc
	.xword	0x48a5abe071e44e9c
	.xword	0xa7f17a0086bcd910
	.xword	0x0dda425d50a8c3b4
	.xword	0x5eab20dcaa0e1c53
	.xword	0xbae105862eb8a068
	.xword	0x4fa8b55caf4a9ee9
	.xword	0x8c92f8588c72c44a
	.xword	0xa402d1dbdd431566
	.xword	0xcaaa44dc47b6a495
	.xword	0x08592e911f99b29f
	.xword	0x380d6bb275979bac
	.xword	0x9a73b8df9902efed
	.xword	0xece05aa8499abf9f
	.xword	0xe4f1b36200d5506e
	.xword	0x958920ea3d2bb599
	.xword	0x60e49b0f712cccfd
	.xword	0x19e6fb871905a6e6
	.xword	0x9df3de1c0c31abe4
	.xword	0xc490f2e459a6dc98
	.xword	0xea57ce8a731e6478
	.xword	0x943573c1a3335190
	.xword	0x1c66eef466622f2f
	.xword	0xf61fb46a40a037a8
	.xword	0x469943c6f5287318
	.xword	0x590a2a55ee086fe3
	.xword	0x731d1c6132667acb
	.xword	0xeca26e4a107eda10
	.xword	0x3bfac27adc0a9041
	.xword	0x1c823d6135fe2d89
	.xword	0x767982a207c0ec23
	.xword	0x6e5006adbddf28a2
	.xword	0x1f1d22735961b0c4
	.xword	0x1e884a5d6e34f87a
	.xword	0x112f1191e08528ec
	.xword	0xdd7fca8b61a6b046
	.xword	0xfb3bf6e9993220a2
	.xword	0xf70946e406c611ff
	.xword	0x20e21bd3612a7614
	.xword	0xb7d971d62f7159d9
	.xword	0xd7c4f991adbc0155
	.xword	0x38262bf2a55f055c
	.xword	0xff1a75c0066ba775
	.xword	0x54c2380c0cb959a4
	.xword	0x7773b55e39f175d0
	.xword	0x43384446d7b1ffdd
	.xword	0x3665c32d11bfc13d
	.xword	0x424b9b4840da45b0
	.xword	0x1e0590ebfc7872eb
	.xword	0x9cbfbc9918e3c99a
	.xword	0xa10ccadae92e6f15
	.xword	0xaee52121c1b1c092
	.xword	0x8689c11b02317c2b
	.xword	0xe94586b85df0f8b0
	.xword	0x8b327f2c43a4fdef
	.xword	0x442ba9f656533e51
	.xword	0x7d900d4ee514c20e
	.xword	0x36204f56f39a3e63
	.xword	0x2b416b028ca8b088
	.xword	0x6440a9e394af7dc1
	.xword	0x099bdd78ed781db2
	.xword	0x70bb4e2394ce931e
	.xword	0x13fb34ed7b660dc3
	.xword	0xba0cc6c933ffd9b5
	.xword	0xed84eda988041583
	.xword	0x503571bf5a22c1a0
	.xword	0x2173577858799fa8
	.xword	0x8656c4e9ebc96794
	.xword	0x32f708ad788ae5bd
	.xword	0x2c330d50ab4f83f1
	.xword	0x232daf916b9d7906
	.xword	0xd911066e0699d7eb
	.xword	0x42aa3089f34d8933
	.xword	0xc737d176af06aac3
	.xword	0x2270c9e9218a92c7
	.xword	0x947037a9707c8e38
	.xword	0x2f9ebfd7cc047f02
	.xword	0xe15bbc43bbfc977c
	.xword	0x9bdc2bcdd6c1b196
	.xword	0xbde10930bb5e11c1
	.xword	0x2c7d25efb2fb69f3
	.xword	0x33ba9710b674b3f9
	.xword	0x2e38bac58846fb33
	.xword	0x27a846747622d7a9
	.xword	0xf65b6615ee0cece5
	.xword	0x597bf630e1d0fe08
	.xword	0x8090bd12a3cbcc2b
	.xword	0xf0e287e548b8a800
	.xword	0x641f4a14d98f45b2
	.xword	0xcbd9a5289175e541
	.xword	0xb4d1fa28e04760e0
	.xword	0xc9f3d0567f044a3d
	.xword	0xc41f3875a8e13457
	.xword	0x43ab98e8babfc43d
	.xword	0x4d22f5bb8c409d10
	.xword	0x93753ed6d802cba6
	.xword	0xd643e8d47b0f3506
	.xword	0x1a379ae18aac7e24
	.xword	0x6008bb5860eddcec
	.xword	0xabc7d1a9ba3d4b2b
	.xword	0x20b24d5db8dafc47
	.xword	0x8eb3e2f1e2ac1501
	.xword	0x132468f140a9d31a
	.xword	0x6510f51b61e5f6fb
	.xword	0xb7fbb037183fd5f3
	.xword	0x505ab7481009ee07
	.xword	0x20026689a9b4db12
	.xword	0x3a4331d559c86946
	.xword	0x8bc40c2e5e62c4a6
	.xword	0x39f6ca7aae4e9512
	.xword	0x8db0e66045caa26a
	.xword	0xa4fb007a8d4c1a68
	.xword	0xffd5127033f00b16
	.xword	0x121baf785fe8b28d
	.xword	0x16b3495ed5e01a65
	.xword	0xd0618d30fec99031
	.xword	0x3d3d5e421df1129d
	.xword	0x94ff3669f3b09c7c
	.xword	0x873f7303b430100e
	.xword	0x7edba7beb35a7a1b
	.xword	0x8d6c5462eabf118e
	.xword	0xed81ef558e090a4d
	.xword	0x75836a04b858ac4f
	.xword	0xc8a0416745fed4d6
	.xword	0xa7600b150a5eb751
	.xword	0x3de34815b6e8738b
	.xword	0x978ea35423530f3c
	.xword	0xaae4d0c74cae610d
	.xword	0x99520e14bd38aa99
	.xword	0xf7650df80e6927d8
	.xword	0x0cd1c5c0cf2ffb1d
	.xword	0x3fe3e706a7693bb0
	.xword	0x818636dad82885e1
	.xword	0x9f8d0ba8c302b881
	.xword	0x587d9344dcf2f489
	.xword	0xbd4efc2ec6796bfd
	.xword	0x877cd08823de20d1
	.xword	0x0465dffe8cb74432
	.xword	0x8c5feebd6555e6eb
	.xword	0x372dd8b9ff558f56
	.xword	0xd36717db48f2aa5c
	.xword	0x58d7ccee07b7976f
	.xword	0x4fb2aa4e36d4a986
	.xword	0xdc4cfc0d3dc06fdd
	.xword	0xaba6879d72a05805
	.xword	0xa8aca2f4b505ca99
	.xword	0x34027ec25faf85db
	.xword	0x9e86983f15f4d6c3
	.xword	0xe2277a0ae78d0558
	.xword	0x741fe80f244cee00
	.xword	0x4b25d3552290ba71
	.xword	0xf6f4091c7e84b06f
	.xword	0x510a4a0743e06569
	.xword	0x54daf1615601dcc2
	.xword	0x8937ae21a65debc6
	.align 0x80000
	.data
data_start_7:

	.xword	0xe9e66b1c301b85c1
	.xword	0xc389ad0eb3f768f2
	.xword	0xfe9a353a20869bc8
	.xword	0x2683578b24eca302
	.xword	0xe4b401d2b523fad5
	.xword	0x749c4852a89c3417
	.xword	0xa91dae6b9e5ba836
	.xword	0x803aedfc0efedea6
	.xword	0xd441ffbc3b88c064
	.xword	0x1e09e63244064d77
	.xword	0x55214674194983a9
	.xword	0xdeeb5cbcc9ec6500
	.xword	0xc78a6706f82735bc
	.xword	0x61c3812112856bd5
	.xword	0xa4388bb2c456a7e5
	.xword	0xa567250bd8541b5b
	.xword	0xcc455d81553dda25
	.xword	0x538e1173b4209a22
	.xword	0xbf49b2ea69f4e2e0
	.xword	0xccc1cddb6f097d0b
	.xword	0xe7ed844832b440cc
	.xword	0xd5f2e13608d512d4
	.xword	0xd8dd0420b7ae9b85
	.xword	0xf43e1e45c06ad6f6
	.xword	0x67c53012c711df44
	.xword	0xac9c83af8c56f861
	.xword	0x75733c2de96a4723
	.xword	0x64c440ab27be2d5d
	.xword	0xde684cfe387089f2
	.xword	0x509de7193b00d3fa
	.xword	0x19a98cfb2855c386
	.xword	0xc6cf8da643361bd7
	.xword	0x55a630a8ed71f8a4
	.xword	0x8d294a2f70af470d
	.xword	0xcd2604aaf261d3a9
	.xword	0x137d5c70f58debb2
	.xword	0xb6afd5a9e46cbc9d
	.xword	0xbe8b9d06e84ac644
	.xword	0x59c272609aa926f6
	.xword	0xfaa70fd7683dcc0b
	.xword	0x3f1f25f7964aaa80
	.xword	0x6f6fc27347a8af02
	.xword	0xb4ac9cb45f7ea205
	.xword	0x3a83aaae25b21849
	.xword	0x671cc8107fb1022a
	.xword	0x195b30f30ede9b8d
	.xword	0x75ad3b1af6944a66
	.xword	0x2e1eb9d3d27179cf
	.xword	0x19dce570013d1ab3
	.xword	0x2a3b9316a9026f7b
	.xword	0xa75ebadd9d40f953
	.xword	0xde8a24afbcb65ffb
	.xword	0x3f4930fdbde6137c
	.xword	0x1860da8d562cd28f
	.xword	0x9318eac4a01caaa9
	.xword	0x4ba3d7b291b9558f
	.xword	0xcff229e3482e793a
	.xword	0xaa703da8f939359a
	.xword	0x7e97e78a67fb9f4f
	.xword	0xdffb46f5084bbd8e
	.xword	0xdcbc0051a3155682
	.xword	0xc18089902a71c9e7
	.xword	0x8c68628af3d25444
	.xword	0x801076028bc664c3
	.xword	0x8d2f2d3dd4b624e4
	.xword	0x6f2874ec6db23dda
	.xword	0xca604bcb9aec84d1
	.xword	0x3c93b2fae185a7f1
	.xword	0x4d24a4bc6ffc82fc
	.xword	0x0dd4e97a092506a9
	.xword	0xa422203cbcd0b99c
	.xword	0xf3a1aee200632891
	.xword	0x82ceaf0956684844
	.xword	0xf29c19fc55371fbe
	.xword	0x5a7d555817296b0a
	.xword	0x20c47b0433340366
	.xword	0x08f4f706a6405cb6
	.xword	0x573a395d77ad8843
	.xword	0xdc34b1caf2d02434
	.xword	0xaa26e73e43cd8ebc
	.xword	0x5fefdcc387f32fe8
	.xword	0x7f4b5549e30270df
	.xword	0x18ece99f14ae64eb
	.xword	0xe469f7a848615c42
	.xword	0x0e9ce600cf8e97c0
	.xword	0xd7eb0e0094246f8e
	.xword	0xbf5c362bee755f36
	.xword	0xa415c59bef893d81
	.xword	0x4c27179607aeb656
	.xword	0x08cc8cc6554484b5
	.xword	0x125436db1ac676c7
	.xword	0x5cefb0f01e664207
	.xword	0xe361e9b471f438e1
	.xword	0xaf4e0d1ce1775d87
	.xword	0x631fc531e054c91e
	.xword	0x9653549b056e7fee
	.xword	0x1cd519640bf1a5fb
	.xword	0x7df893481f9cc0d3
	.xword	0x0b842f019a392229
	.xword	0xb32aa34bf51ff02d
	.xword	0xd46c0cdfa13b4b1e
	.xword	0xf8fe6c5ddba7506c
	.xword	0x228f8c8a5c2368bb
	.xword	0xc498b1f938bf5af5
	.xword	0x9cbe430255d09174
	.xword	0xec22e69f1ad75b0c
	.xword	0x435772121da8d717
	.xword	0x4565e2f7691ba008
	.xword	0x88f3ea94cdb0bc65
	.xword	0x58ba3cc6676640e0
	.xword	0xb07d991c749a9c77
	.xword	0x876ab7d064c406c5
	.xword	0xc56c77fba671de1c
	.xword	0x62c61329c7dc5b32
	.xword	0x587f0c1c9e414817
	.xword	0x8394a9b9bbc17d3b
	.xword	0x19d9d9b0b78ec2ca
	.xword	0x580df4f917ea5f2e
	.xword	0x5182b0483b65ac74
	.xword	0x3ebf2b3d9297ee88
	.xword	0x4ac2622eb7c53622
	.xword	0x98f8c72272f59dba
	.xword	0x5f82b935b4390cec
	.xword	0xf10ef21a1363e1a8
	.xword	0x1d0844091fedd566
	.xword	0x7d071e30acde6fd2
	.xword	0xd751b9c1d4a1c109
	.xword	0xc24cc8ca596ffeb5
	.xword	0xfd6ba7e4a3f694ee
	.xword	0xf77d2bcedacd1261
	.xword	0xc93f368dbdca3b48
	.xword	0x8119df9d78139c71
	.xword	0xcf4d89b0ecc8cd7b
	.xword	0x93eb25bc39472ecc
	.xword	0xd7dd4f0be116ee0d
	.xword	0x57ddfec2da366e0c
	.xword	0x74f5902d21374682
	.xword	0xfe467d3b179ed23c
	.xword	0x806d1de5a7d2ac92
	.xword	0x9e5d7dd991f58dc4
	.xword	0x6c1e134bf7ff5e4c
	.xword	0xdaf544bd44459f1d
	.xword	0x476ddcaae7fb09c8
	.xword	0xfc4c53ec0f84c0ab
	.xword	0xf6cd879a4aa7874a
	.xword	0xd4e38d00abc78900
	.xword	0x5350fbb3f2cadcda
	.xword	0x29888e2bbf08550a
	.xword	0x4f19c11f5bb17e07
	.xword	0x50d7cf5fea89d8e4
	.xword	0x12a570b645ccd6a2
	.xword	0x09c55095df975db6
	.xword	0x10be24733ee31a63
	.xword	0x2113dce308fa4c54
	.xword	0x44688943c5c25087
	.xword	0xcb635f0d82881ec1
	.xword	0x2b8f00f46c3460fa
	.xword	0x277d19027911b033
	.xword	0x9f866cdb41c8284e
	.xword	0x29f887cfc9746afb
	.xword	0xbe3940d2df4fbb80
	.xword	0x12ad4ec85303f55d
	.xword	0xe8a78b633c92e471
	.xword	0xf293a92023190296
	.xword	0xc9fd0c4ce8403718
	.xword	0x725e1a4a56746659
	.xword	0x7aa1889ff4eb3089
	.xword	0x6f8caa12de297807
	.xword	0xf2f210bd5a9ed59d
	.xword	0xcc3455f16f6d6aeb
	.xword	0x2647d483136634f9
	.xword	0x4e74cc33cc9a3419
	.xword	0x3bc125a46da31438
	.xword	0x48ee98378d2bed27
	.xword	0x2817e7d1d3ffd04f
	.xword	0x67559f1df506b6ac
	.xword	0x2bc1055bb96980ea
	.xword	0x805ae96322616c43
	.xword	0x3fba3a736b5dc704
	.xword	0xe8fbb7ef80ba9ebb
	.xword	0xfa179f8e322c4e9b
	.xword	0x2d6c29ae65ed9f0a
	.xword	0x64dcaea6985f2eeb
	.xword	0x6b4aeaa605b762ce
	.xword	0xcf2791d93eba3602
	.xword	0x9fff1666f132d8fd
	.xword	0xed2bf842423d274f
	.xword	0xad4a959eb72a3888
	.xword	0x64176a1a12166a8f
	.xword	0x9f92ef38a0d9bc0c
	.xword	0xc363d34b18569363
	.xword	0xe5dc61a9439d2a4c
	.xword	0xf5db85aa974035eb
	.xword	0xeb9cc84dac9dcd3a
	.xword	0x382e8f9bb55ebc9d
	.xword	0xb63d927091fea6fb
	.xword	0xe6ab381bfbd7ce84
	.xword	0x25ec3a91d093ca68
	.xword	0x0ae47e8456914f08
	.xword	0x3102f7f55342483b
	.xword	0x5dcbeaeb6c32e2d5
	.xword	0x0e97e1d55e848bb4
	.xword	0x123c5b2136d69186
	.xword	0xf7ef1d1c5e6c1d84
	.xword	0x0fc98deab17febb3
	.xword	0xbc5c1ebf83122e6c
	.xword	0x5e22af6cbdda31c6
	.xword	0x6f9f5d386fb1582d
	.xword	0x5643ccf5ec3737a2
	.xword	0x875c59f7d9f8fa5c
	.xword	0x0a859e192396ef9c
	.xword	0xd8ac16c10a027019
	.xword	0x56e86b51c3eea33f
	.xword	0x330e678ce293f9c5
	.xword	0x0dd07a846f1dca3b
	.xword	0x67ee440762a6cec5
	.xword	0x4faa022bb1e529c3
	.xword	0x673ed4c71e7799f8
	.xword	0xa61e718ad36ce5f7
	.xword	0xd8de441bcba37ae4
	.xword	0xea317d87475590d5
	.xword	0x19a9777a335569cc
	.xword	0x3045ca07a7c0d3c4
	.xword	0x111c07648b91df87
	.xword	0xc6fb8cfd0095e098
	.xword	0x112827619c0dfd25
	.xword	0xf7e89aa78eb7ceda
	.xword	0x2b01592461fe6529
	.xword	0x1af5ef80917e85b8
	.xword	0x2f1641cc0488a80c
	.xword	0xf42704ff76ab0af2
	.xword	0xfb351706f06078a2
	.xword	0x7d2c402629a24ab1
	.xword	0x07b831d3777be70a
	.xword	0x978f89284c91267d
	.xword	0xbd185bc838056a01
	.xword	0x227401d72fa40e9d
	.xword	0x366edf5feee7d12c
	.xword	0x2f2feedc98c9a230
	.xword	0x7ed12dab757305ae
	.xword	0x9a2d35dfb6d86e72
	.xword	0x674b7464ea2fb744
	.xword	0x191f41cb45b37475
	.xword	0x2fa5fb4dece8a0bf
	.xword	0x2301910e2d31735c
	.xword	0xfd10b36d27e33f62
	.xword	0xeb9b31e703f9f56b
	.xword	0xa727545d798b8d3e
	.xword	0x03abdf5b368a094d
	.xword	0x64f8bbfc2c144f50
	.xword	0x283cc2a48670f07f
	.xword	0xede23fca38039122
	.xword	0x89b671133bacddb7
	.xword	0x3800b610b6dd3713
	.xword	0xf134063e2b730ba7
	.xword	0xdff0086746d52bb0



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
