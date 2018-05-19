// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_72.s
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
   random seed:	682337730
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

	setx 0x8258a59234186d7a, %g1, %g0
	setx 0x9af202e3cababe66, %g1, %g1
	setx 0x6c71d6134a73486c, %g1, %g2
	setx 0x8d94d2d9bebcdf1a, %g1, %g3
	setx 0x9a5cb8ea71566c8d, %g1, %g4
	setx 0xdb7ee53c44829317, %g1, %g5
	setx 0x5df78b1237fe5616, %g1, %g6
	setx 0x041f67ba1e033a99, %g1, %g7
	setx 0xd9af252a87ef3083, %g1, %r16
	setx 0xe6bb314703d5dff6, %g1, %r17
	setx 0xb7e7981387bef52d, %g1, %r18
	setx 0x0b363cb49c831138, %g1, %r19
	setx 0x56faf356c79bd44c, %g1, %r20
	setx 0xbfe2a3edb88426b7, %g1, %r21
	setx 0x5636a740a56f9e9b, %g1, %r22
	setx 0x204a46ebad328aa2, %g1, %r23
	setx 0xb20b467d4934c386, %g1, %r24
	setx 0x11ca3c463a1b46e5, %g1, %r25
	setx 0x74d611d713f70ab5, %g1, %r26
	setx 0xe9c351738811129e, %g1, %r27
	setx 0x0ae9925719b8c86a, %g1, %r28
	setx 0xcd1a6d7cb92ac801, %g1, %r29
	setx 0x8b778e4225e38338, %g1, %r30
	setx 0xa41a74e7d7b7cdd1, %g1, %r31
	save
	setx 0x3c0121da59a71168, %g1, %r16
	setx 0xac49796bf8894148, %g1, %r17
	setx 0x1aeb61708319fa40, %g1, %r18
	setx 0x1d23f784b98bdc06, %g1, %r19
	setx 0xb24f85daf8cbc45d, %g1, %r20
	setx 0x3ae2f510fe418f3b, %g1, %r21
	setx 0x98617fbbd084d010, %g1, %r22
	setx 0x8699945a56e65c8a, %g1, %r23
	setx 0x9904e11b25c7fba7, %g1, %r24
	setx 0x02760630f05c422c, %g1, %r25
	setx 0x487dd3281bd80e7d, %g1, %r26
	setx 0x677e324e9499eed4, %g1, %r27
	setx 0xe60c5aae8afe7cc0, %g1, %r28
	setx 0xecae4f605790aed5, %g1, %r29
	setx 0xb2665bf569610b92, %g1, %r30
	setx 0x00b75029e8ba38e0, %g1, %r31
	save
	setx 0xe32a46218a0a5fba, %g1, %r16
	setx 0xf8eae617cc391822, %g1, %r17
	setx 0x296575b92cd51a64, %g1, %r18
	setx 0x27c0ca1576e86a24, %g1, %r19
	setx 0x6a6d6600d4010ff8, %g1, %r20
	setx 0xf3fb7e4f1d4e0cea, %g1, %r21
	setx 0x014ca1b31f7d9438, %g1, %r22
	setx 0x60d1d97c85701136, %g1, %r23
	setx 0x87c40725af31b66a, %g1, %r24
	setx 0x2ed64a5bcab3f750, %g1, %r25
	setx 0xb81b49f5dbd902bf, %g1, %r26
	setx 0x59e352d27bc4d121, %g1, %r27
	setx 0x5c2495c15b1ee9c4, %g1, %r28
	setx 0xe978de459c6b7792, %g1, %r29
	setx 0x27a625a7052bd133, %g1, %r30
	setx 0xfe7ff7c72a89ca04, %g1, %r31
	save
	setx 0x23c170ba17e43f7b, %g1, %r16
	setx 0x6bfd6d021116606e, %g1, %r17
	setx 0xd865aa187dcbdc33, %g1, %r18
	setx 0xe9c6f3758ae4cecc, %g1, %r19
	setx 0xc4305185f51ce3ac, %g1, %r20
	setx 0x04b133dfb6dafab4, %g1, %r21
	setx 0x4dc1da91261135d3, %g1, %r22
	setx 0x83f4a9f63a4a6cd7, %g1, %r23
	setx 0x5b6a5ef41dad87f6, %g1, %r24
	setx 0x28b587912b59cae3, %g1, %r25
	setx 0x4d8d87e5ce3b4a1d, %g1, %r26
	setx 0xd473c785227463fd, %g1, %r27
	setx 0x45e120fcb39acef5, %g1, %r28
	setx 0x40eadeaead84faaf, %g1, %r29
	setx 0x4f617fcd7ceea8e6, %g1, %r30
	setx 0xeec462730e841463, %g1, %r31
	save
	setx 0x37a200553e043076, %g1, %r16
	setx 0xb58a0e5f7c5ecfc0, %g1, %r17
	setx 0x4034a23bba834019, %g1, %r18
	setx 0x0ce1fcabf52e0e38, %g1, %r19
	setx 0xc96221b7e2e51029, %g1, %r20
	setx 0xe9dbf517d880cdaa, %g1, %r21
	setx 0xeaeef06d4c38d41e, %g1, %r22
	setx 0x5be683383ea61543, %g1, %r23
	setx 0xebb41e1a2ac3c5fe, %g1, %r24
	setx 0xef4e3ff819cae5aa, %g1, %r25
	setx 0x6133f4280e0bace1, %g1, %r26
	setx 0x444d577882e72bf0, %g1, %r27
	setx 0x6fb34780a1509e52, %g1, %r28
	setx 0xe88823253c505700, %g1, %r29
	setx 0xe1f31bde0c7dc636, %g1, %r30
	setx 0x040e21b4fcbd7980, %g1, %r31
	save
	setx 0x2b63765f99d37fc8, %g1, %r16
	setx 0x9b86bb6b8b7e3fe0, %g1, %r17
	setx 0xec66288013fdf91f, %g1, %r18
	setx 0x3ae9f7f0ea20f954, %g1, %r19
	setx 0x191b545edc8952fd, %g1, %r20
	setx 0x784c5693f8dba55b, %g1, %r21
	setx 0xf4028403c66cbaef, %g1, %r22
	setx 0x676323ff8d00cd10, %g1, %r23
	setx 0x876508340b1d2bab, %g1, %r24
	setx 0x3a80499d865f06e9, %g1, %r25
	setx 0x716fe76208238225, %g1, %r26
	setx 0xefbe3d23e39f5d8a, %g1, %r27
	setx 0x4fb94bb06accabc4, %g1, %r28
	setx 0x3657d5c6cd373de2, %g1, %r29
	setx 0x0e0bb1f96ce3394b, %g1, %r30
	setx 0x92010ac2f0129a11, %g1, %r31
	save
	setx 0xafd613816a2c0146, %g1, %r16
	setx 0xc0c0b272b0c78d75, %g1, %r17
	setx 0x487e0359f54875b4, %g1, %r18
	setx 0x54683403232ba268, %g1, %r19
	setx 0x7a88c20aab6146c0, %g1, %r20
	setx 0x31e627cef39fa57b, %g1, %r21
	setx 0x8a19176260c46b0f, %g1, %r22
	setx 0x1689f2317cf5e829, %g1, %r23
	setx 0x45fb3b3d62822f87, %g1, %r24
	setx 0xb8167db82a5f3c85, %g1, %r25
	setx 0x3b021f85c8046804, %g1, %r26
	setx 0x56e1bd7d87ba894c, %g1, %r27
	setx 0xc6c3fdad9e0eff8c, %g1, %r28
	setx 0x50788cfac688bb70, %g1, %r29
	setx 0x4bd2b2fedef1235e, %g1, %r30
	setx 0x655e88473e138f8c, %g1, %r31
	save
	setx 0x7c0ddadafd9f7eb2, %g1, %r16
	setx 0x11d9232536295df9, %g1, %r17
	setx 0xd75ff6a79ce3564c, %g1, %r18
	setx 0x48928f41f43fc02f, %g1, %r19
	setx 0x224c2a6da590f122, %g1, %r20
	setx 0xf723f557203f69b7, %g1, %r21
	setx 0x490afd0690a5675e, %g1, %r22
	setx 0x12389ccc62aad069, %g1, %r23
	setx 0xed3141994417437e, %g1, %r24
	setx 0x082163bf832574fe, %g1, %r25
	setx 0x47261ed0761c1f35, %g1, %r26
	setx 0x14f36d74ce268098, %g1, %r27
	setx 0x9f8b030a07333c1b, %g1, %r28
	setx 0x7362d290a4c748d5, %g1, %r29
	setx 0xbfddd592bec6204e, %g1, %r30
	setx 0xe2b4b9d52176764e, %g1, %r31
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
	.word 0xbf480000  ! 1: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e4a18f  ! 3: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4a075  ! 4: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e521ae  ! 5: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e4207d  ! 6: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e52167  ! 8: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	setx	0x563afd200001e06, %g1, %r10
	.word 0x839a8000  ! 18: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba0dc000  ! 21: AND_R	and 	%r23, %r0, %r29
	.word 0xbd504000  ! 22: RDPR_TNPC	<illegal instruction>
	setx	data_start_6, %g1, %r19
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e189  ! 32: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x9195e0b2  ! 33: WRPR_PIL_I	wrpr	%r23, 0x00b2, %pil
	.word 0xb3e5e12f  ! 34: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb4442000  ! 35: ADDC_I	addc 	%r16, 0x0000, %r26
	.word 0xb5e4a0a4  ! 37: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4a1e2  ! 38: SAVE_I	save	%r18, 0x0001, %r25
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a19b  ! 45: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e420cc  ! 46: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe561dd  ! 48: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4a19f  ! 50: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394e0e9  ! 51: WRPR_TNPC_I	wrpr	%r19, 0x00e9, %tnpc
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1fa  ! 57: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9500000  ! 59: RDPR_TPC	<illegal instruction>
	.word 0xb5e561fc  ! 60: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x9085d5d800009f0a, %g1, %r10
	.word 0x839a8000  ! 72: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5540000  ! 73: RDPR_GL	<illegal instruction>
	.word 0x8d9561b9  ! 75: WRPR_PSTATE_I	wrpr	%r21, 0x01b9, %pstate
	setx	data_start_2, %g1, %r16
	.word 0x8995a04e  ! 80: WRPR_TICK_I	wrpr	%r22, 0x004e, %tick
	.word 0xb3e4a111  ! 81: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e521e8  ! 84: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbaad21b9  ! 87: ANDNcc_I	andncc 	%r20, 0x01b9, %r29
	.word 0xbbe4e03c  ! 88: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5e1ba  ! 89: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde521e8  ! 92: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4e006  ! 95: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e06d  ! 97: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe5613d  ! 98: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x919421b3  ! 99: WRPR_PIL_I	wrpr	%r16, 0x01b3, %pil
	.word 0xbbe5205e  ! 103: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbd500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0xb1e4e023  ! 106: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e461b8  ! 110: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb92d8000  ! 113: SLL_R	sll 	%r22, %r0, %r28
	.word 0xb9e4a046  ! 114: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe52045  ! 115: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4a063  ! 116: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x9194618c  ! 121: WRPR_PIL_I	wrpr	%r17, 0x018c, %pil
	.word 0x8d946055  ! 122: WRPR_PSTATE_I	wrpr	%r17, 0x0055, %pstate
	.word 0x91946160  ! 123: WRPR_PIL_I	wrpr	%r17, 0x0160, %pil
	.word 0xb7341000  ! 124: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xbfe56105  ! 127: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e421b3  ! 128: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5216f  ! 130: SAVE_I	save	%r20, 0x0001, %r26
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561bf  ! 136: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5a0da  ! 137: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe52005  ! 139: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe5e176  ! 142: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbf2d6001  ! 148: SLL_I	sll 	%r21, 0x0001, %r31
	setx	0x746f20cf0000fe92, %g1, %r10
	.word 0x839a8000  ! 152: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_4, %g1, %r20
	.word 0xb92d5000  ! 156: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xb7e5e111  ! 158: SAVE_I	save	%r23, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e5e196  ! 166: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a171  ! 171: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbcbc0000  ! 172: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xbde46066  ! 174: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe560d9  ! 175: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5e0d5  ! 181: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e4e1ce  ! 185: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 192: RDPR_GL	<illegal instruction>
	.word 0xbde4a0f3  ! 193: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e46155  ! 195: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4a13d  ! 202: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5a064  ! 203: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e52136  ! 204: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4e1e6  ! 207: ADDCcc_I	addccc 	%r19, 0x01e6, %r29
	.word 0xbb480000  ! 208: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbbe5a132  ! 210: SAVE_I	save	%r22, 0x0001, %r29
	setx	0xaa1cd504000029cc, %g1, %r10
	.word 0x839a8000  ! 211: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe421fc  ! 212: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde46114  ! 213: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x791e81cd00006a93, %g1, %r10
	.word 0x839a8000  ! 214: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e56164  ! 215: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb480000  ! 216: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e01e  ! 221: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e5e19f  ! 223: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e560ea  ! 224: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e42184  ! 226: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e5e1de  ! 227: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5203a  ! 228: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e520e4  ! 231: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4613b  ! 232: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e42009  ! 235: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4e079  ! 237: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb01d611b  ! 240: XOR_I	xor 	%r21, 0x011b, %r24
	.word 0xbd510000  ! 241: RDPR_TICK	<illegal instruction>
	.word 0xbc3560da  ! 242: SUBC_I	orn 	%r21, 0x00da, %r30
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a04f  ! 245: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb6b40000  ! 246: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xb3e4e1c0  ! 247: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5602b  ! 248: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4e106  ! 250: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5e0b2  ! 252: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e077  ! 256: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 261: RDPR_TL	<illegal instruction>
	.word 0x8595a161  ! 266: WRPR_TSTATE_I	wrpr	%r22, 0x0161, %tstate
	.word 0xb5e4e01a  ! 268: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x9195a102  ! 270: WRPR_PIL_I	wrpr	%r22, 0x0102, %pil
	.word 0xb72d4000  ! 272: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbde46153  ! 273: SAVE_I	save	%r17, 0x0001, %r30
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e15b  ! 283: SAVE_I	save	%r19, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 284: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb551c000  ! 287: RDPR_TL	<illegal instruction>
	.word 0xbde4e147  ! 289: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde421e5  ! 293: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x919420e8  ! 294: WRPR_PIL_I	wrpr	%r16, 0x00e8, %pil
	.word 0xb5e561a1  ! 295: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5e0bf  ! 296: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e52142  ! 298: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x899560b1  ! 300: WRPR_TICK_I	wrpr	%r21, 0x00b1, %tick
	.word 0xbb500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0xbbe4618f  ! 303: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e149  ! 307: SAVE_I	save	%r23, 0x0001, %r31
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ce001  ! 313: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xb0058000  ! 314: ADD_R	add 	%r22, %r0, %r24
	.word 0xbc34e135  ! 315: SUBC_I	orn 	%r19, 0x0135, %r30
	setx	data_start_0, %g1, %r23
	.word 0xb9e5610c  ! 320: SAVE_I	save	%r21, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 321: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e42197  ! 323: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe460f1  ! 326: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 331: RDPR_PSTATE	<illegal instruction>
	.word 0xbf504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xb3e5e165  ! 339: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5a1b4  ! 340: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5603d  ! 341: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbe05c000  ! 342: ADD_R	add 	%r23, %r0, %r31
	.word 0xbbe42175  ! 345: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3540000  ! 346: RDPR_GL	<illegal instruction>
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46183  ! 348: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde5a02b  ! 353: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4200c  ! 355: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb750c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0xb5e46154  ! 357: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3540000  ! 359: RDPR_GL	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xb3e4a072  ! 363: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb0b4603c  ! 367: ORNcc_I	orncc 	%r17, 0x003c, %r24
	.word 0xbd3cc000  ! 372: SRA_R	sra 	%r19, %r0, %r30
	.word 0xbfe52187  ! 374: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5a001  ! 378: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe56130  ! 380: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4e0ed  ! 384: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4a081  ! 385: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4a00c  ! 387: SAVE_I	save	%r18, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 388: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe46021  ! 393: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde46168  ! 397: SAVE_I	save	%r17, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 398: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4e01c  ! 400: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb72d3001  ! 404: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xbbe46142  ! 409: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde52046  ! 412: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4e12c  ! 414: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8994a14c  ! 415: WRPR_TICK_I	wrpr	%r18, 0x014c, %tick
	.word 0xb93de001  ! 420: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0x8995a0fb  ! 421: WRPR_TICK_I	wrpr	%r22, 0x00fb, %tick
	.word 0xbc040000  ! 423: ADD_R	add 	%r16, %r0, %r30
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d0000  ! 426: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xb5e5a0f1  ! 428: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbe1461e5  ! 433: OR_I	or 	%r17, 0x01e5, %r31
	.word 0xbf480000  ! 436: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb151c000  ! 440: RDPR_TL	<illegal instruction>
	.word 0xb5e4200f  ! 445: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e561df  ! 446: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4607f  ! 447: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4a180  ! 449: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e421c3  ! 451: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x919420bf  ! 452: WRPR_PIL_I	wrpr	%r16, 0x00bf, %pil
	.word 0xb3540000  ! 453: RDPR_GL	<illegal instruction>
	setx	data_start_1, %g1, %r21
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	setx	0x502d56be0000ca49, %g1, %r10
	.word 0x839a8000  ! 461: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba9ca022  ! 464: XORcc_I	xorcc 	%r18, 0x0022, %r29
	.word 0x8d94a197  ! 465: WRPR_PSTATE_I	wrpr	%r18, 0x0197, %pstate
	.word 0xb0bc8000  ! 466: XNORcc_R	xnorcc 	%r18, %r0, %r24
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c4000  ! 470: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb5e4206e  ! 471: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e4a06d  ! 472: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb2b54000  ! 473: ORNcc_R	orncc 	%r21, %r0, %r25
	setx	0x4c6a22d800004dde, %g1, %r10
	.word 0x819a8000  ! 474: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e5e11b  ! 483: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a19b  ! 485: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8394e073  ! 486: WRPR_TNPC_I	wrpr	%r19, 0x0073, %tnpc
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d4000  ! 488: SRA_R	sra 	%r21, %r0, %r28
	.word 0x91952165  ! 490: WRPR_PIL_I	wrpr	%r20, 0x0165, %pil
	.word 0xb1e52118  ! 491: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5508000  ! 495: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5e0a0  ! 496: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e56002  ! 499: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e56185  ! 500: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4a076  ! 504: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d942079  ! 510: WRPR_PSTATE_I	wrpr	%r16, 0x0079, %pstate
	.word 0xb9e460e3  ! 511: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde56177  ! 512: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e5a09a  ! 520: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5e108  ! 521: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe42065  ! 526: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe42119  ! 528: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1540000  ! 531: RDPR_GL	<illegal instruction>
	.word 0xb7e4e181  ! 532: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46165  ! 536: SAVE_I	save	%r17, 0x0001, %r30
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8356135  ! 542: ORN_I	orn 	%r21, 0x0135, %r28
	.word 0xbfe46147  ! 546: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 552: RDPR_TICK	<illegal instruction>
	.word 0x8195e1ba  ! 553: WRPR_TPC_I	wrpr	%r23, 0x01ba, %tpc
	.word 0xb5540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0xb7e561f0  ! 559: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x859420e7  ! 560: WRPR_TSTATE_I	wrpr	%r16, 0x00e7, %tstate
	.word 0xb9e56099  ! 566: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x4669ae0d0000da5d, %g1, %r10
	.word 0x839a8000  ! 567: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a183  ! 571: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde5200c  ! 572: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5e1b8  ! 574: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e5201a  ! 575: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb43420d7  ! 577: SUBC_I	orn 	%r16, 0x00d7, %r26
	mov	0, %r12
	.word 0x8f930000  ! 582: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e56011  ! 586: SAVE_I	save	%r21, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 590: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e42189  ! 591: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e420a9  ! 595: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e56083  ! 596: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4b4c000  ! 598: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb9e46118  ! 601: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5a189  ! 603: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e560c9  ! 604: SAVE_I	save	%r21, 0x0001, %r25
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	.word 0xb7510000  ! 613: RDPR_TICK	<illegal instruction>
	.word 0xbbe4a195  ! 614: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4a101  ! 615: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde5a079  ! 616: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5612b  ! 617: SAVE_I	save	%r21, 0x0001, %r25
	setx	0xa3e769cf0000fb16, %g1, %r10
	.word 0x839a8000  ! 620: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e561e7  ! 626: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe42018  ! 631: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbc95e191  ! 634: ORcc_I	orcc 	%r23, 0x0191, %r30
	.word 0xb9508000  ! 635: RDPR_TSTATE	<illegal instruction>
	.word 0xb1518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e52082  ! 641: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5e134  ! 643: SAVE_I	save	%r23, 0x0001, %r30
	setx	0xa19862db00002f05, %g1, %r10
	.word 0x819a8000  ! 644: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4a1aa  ! 653: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e42128  ! 655: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e46070  ! 660: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xba25c000  ! 661: SUB_R	sub 	%r23, %r0, %r29
	.word 0xbbe5203e  ! 662: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e56110  ! 664: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x89956059  ! 665: WRPR_TICK_I	wrpr	%r21, 0x0059, %tick
	.word 0xb9e5218c  ! 666: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5618e  ! 667: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_2, %g1, %r21
	.word 0xb3e42170  ! 671: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe461a3  ! 675: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb835e0c7  ! 677: ORN_I	orn 	%r23, 0x00c7, %r28
	.word 0xbde4a011  ! 678: SAVE_I	save	%r18, 0x0001, %r30
	mov	2, %r12
	.word 0xa1930000  ! 680: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb12c0000  ! 681: SLL_R	sll 	%r16, %r0, %r24
	.word 0xb151c000  ! 684: RDPR_TL	<illegal instruction>
	.word 0xb9e5e1e3  ! 685: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e561d5  ! 686: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e4e0bc  ! 688: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe560a7  ! 689: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x9194e136  ! 691: WRPR_PIL_I	wrpr	%r19, 0x0136, %pil
	.word 0x9194a1ba  ! 692: WRPR_PIL_I	wrpr	%r18, 0x01ba, %pil
	.word 0xb1e42013  ! 693: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e028  ! 705: WRPR_TT_I	wrpr	%r23, 0x0028, %tt
	.word 0xbfe46065  ! 709: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 712: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4201d  ! 713: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5641800  ! 714: MOVcc_R	<illegal instruction>
	.word 0xb3e5a0d6  ! 717: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4a065  ! 718: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8195a1d3  ! 719: WRPR_TPC_I	wrpr	%r22, 0x01d3, %tpc
	.word 0xbb500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xb7e4610d  ! 724: SAVE_I	save	%r17, 0x0001, %r27
	mov	1, %r12
	.word 0xa1930000  ! 726: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4e05f  ! 727: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e42116  ! 730: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x4b234d9d0000ab4d, %g1, %r10
	.word 0x839a8000  ! 732: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x89956180  ! 736: WRPR_TICK_I	wrpr	%r21, 0x0180, %tick
	.word 0xb1e5e03d  ! 741: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4219e  ! 745: SAVE_I	save	%r16, 0x0001, %r25
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89946040  ! 748: WRPR_TICK_I	wrpr	%r17, 0x0040, %tick
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a193  ! 756: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbf508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4a1dd  ! 765: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb510000  ! 767: RDPR_TICK	<illegal instruction>
	.word 0xb9510000  ! 771: RDPR_TICK	<illegal instruction>
	.word 0x8395a10b  ! 772: WRPR_TNPC_I	wrpr	%r22, 0x010b, %tnpc
	.word 0x9194a026  ! 774: WRPR_PIL_I	wrpr	%r18, 0x0026, %pil
	.word 0xb97c0400  ! 776: MOVR_R	movre	%r16, %r0, %r28
	mov	2, %r12
	.word 0x8f930000  ! 777: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xbde5e0fa  ! 781: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1510000  ! 783: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e4611e  ! 790: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4a154  ! 791: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e421bb  ! 792: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a19d  ! 793: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e18e  ! 797: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e560a0  ! 799: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe420ac  ! 800: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4a13a  ! 801: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4a0b5  ! 804: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbb510000  ! 805: RDPR_TICK	<illegal instruction>
	.word 0xbbe5219a  ! 806: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb151c000  ! 808: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 809: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 820: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xbbe4e196  ! 824: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e46107  ! 826: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5a0f1  ! 830: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb22d60ca  ! 832: ANDN_I	andn 	%r21, 0x00ca, %r25
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461f5  ! 838: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5355000  ! 840: SRLX_R	srlx	%r21, %r0, %r26
	mov	0, %r12
	.word 0xa1930000  ! 841: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e42011  ! 844: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb42da0aa  ! 845: ANDN_I	andn 	%r22, 0x00aa, %r26
	mov	1, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994e12a  ! 850: WRPR_TICK_I	wrpr	%r19, 0x012a, %tick
	.word 0xb1e5a108  ! 854: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb415c000  ! 856: OR_R	or 	%r23, %r0, %r26
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xb7e560e2  ! 866: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbec4a06a  ! 867: ADDCcc_I	addccc 	%r18, 0x006a, %r31
	.word 0xb7e5619c  ! 868: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb341000  ! 872: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xbbe5a02c  ! 874: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf50c000  ! 879: RDPR_TT	<illegal instruction>
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52135  ! 882: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4e155  ! 885: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e4a03d  ! 886: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5619e  ! 890: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 891: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e4e026  ! 894: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e56013  ! 897: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e52119  ! 898: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbec42166  ! 900: ADDCcc_I	addccc 	%r16, 0x0166, %r31
	mov	1, %r12
	.word 0x8f930000  ! 901: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe4e0ec  ! 902: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8994a0e7  ! 904: WRPR_TICK_I	wrpr	%r18, 0x00e7, %tick
	.word 0xbb50c000  ! 908: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4a14a  ! 913: SAVE_I	save	%r18, 0x0001, %r28
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e002  ! 917: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7510000  ! 919: RDPR_TICK	<illegal instruction>
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46195  ! 921: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe421ad  ! 923: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5601f  ! 926: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e4a1bc  ! 929: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e4a09f  ! 930: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5a0d1  ! 937: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a14b  ! 939: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4615b  ! 945: SAVE_I	save	%r17, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 949: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7500000  ! 952: RDPR_TPC	<illegal instruction>
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a138  ! 958: WRPR_TT_I	wrpr	%r22, 0x0138, %tt
	.word 0xb9e4a1ac  ! 963: SAVE_I	save	%r18, 0x0001, %r28
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56128  ! 965: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd504000  ! 966: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xb4444000  ! 969: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xbde561d2  ! 976: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1540000  ! 978: RDPR_GL	<illegal instruction>
	.word 0xb3e46073  ! 981: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xba34216d  ! 984: ORN_I	orn 	%r16, 0x016d, %r29
	.word 0xb3e420ac  ! 985: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5a1f1  ! 986: SAVE_I	save	%r22, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e5a0f3  ! 992: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8995e11d  ! 997: WRPR_TICK_I	wrpr	%r23, 0x011d, %tick
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
	.word 0xb3480000  ! 1: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf82c2048  ! 10: STB_I	stb	%r28, [%r16 + 0x0048]
	.word 0xf62c6184  ! 11: STB_I	stb	%r27, [%r17 + 0x0184]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d60c6  ! 15: STB_I	stb	%r28, [%r21 + 0x00c6]
	.word 0xf42c61df  ! 16: STB_I	stb	%r26, [%r17 + 0x01df]
	setx	0x4bc13ec100009b11, %g1, %r10
	.word 0x839a8000  ! 18: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc34a083  ! 19: STH_I	sth	%r30, [%r18 + 0x0083]
	.word 0xb00d4000  ! 21: AND_R	and 	%r21, %r0, %r24
	.word 0xb1504000  ! 22: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf625e1af  ! 26: STW_I	stw	%r27, [%r23 + 0x01af]
	.word 0xf2758000  ! 28: STX_R	stx	%r25, [%r22 + %r0]
	setx	data_start_1, %g1, %r19
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e11e  ! 33: WRPR_PIL_I	wrpr	%r19, 0x011e, %pil
	.word 0xba4460b0  ! 35: ADDC_I	addc 	%r17, 0x00b0, %r29
	.word 0xf22c202d  ! 39: STB_I	stb	%r25, [%r16 + 0x002d]
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83952168  ! 51: WRPR_TNPC_I	wrpr	%r20, 0x0168, %tnpc
	.word 0xfa3d8000  ! 52: STD_R	std	%r29, [%r22 + %r0]
	.word 0xf83c617a  ! 54: STD_I	std	%r28, [%r17 + 0x017a]
	.word 0xf22c4000  ! 55: STB_R	stb	%r25, [%r17 + %r0]
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 59: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf23c4000  ! 65: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf0758000  ! 67: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf93d0000  ! 68: STDF_R	std	%f28, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0742132  ! 71: STX_I	stx	%r24, [%r16 + 0x0132]
	setx	0x939ef4dc00007b5d, %g1, %r10
	.word 0x839a8000  ! 72: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd540000  ! 73: RDPR_GL	rdpr	%-, %r30
	.word 0x8d952148  ! 75: WRPR_PSTATE_I	wrpr	%r20, 0x0148, %pstate
	setx	data_start_5, %g1, %r21
	.word 0xf2340000  ! 79: STH_R	sth	%r25, [%r16 + %r0]
	.word 0x8995a12b  ! 80: WRPR_TICK_I	wrpr	%r22, 0x012b, %tick
	.word 0xf33c8000  ! 82: STDF_R	std	%f25, [%r0, %r18]
	.word 0xb0ade0ba  ! 87: ANDNcc_I	andncc 	%r23, 0x00ba, %r24
	.word 0xf024a1a5  ! 94: STW_I	stw	%r24, [%r18 + 0x01a5]
	.word 0x91942048  ! 99: WRPR_PIL_I	wrpr	%r16, 0x0048, %pil
	.word 0xf83c4000  ! 100: STD_R	std	%r28, [%r17 + %r0]
	.word 0xf62ce1da  ! 101: STB_I	stb	%r27, [%r19 + 0x01da]
	.word 0xb5500000  ! 104: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb92d4000  ! 113: SLL_R	sll 	%r21, %r0, %r28
	.word 0xfc2d21ca  ! 117: STB_I	stb	%r30, [%r20 + 0x01ca]
	.word 0x919461fe  ! 121: WRPR_PIL_I	wrpr	%r17, 0x01fe, %pil
	.word 0x8d95a061  ! 122: WRPR_PSTATE_I	wrpr	%r22, 0x0061, %pstate
	.word 0x9195e08d  ! 123: WRPR_PIL_I	wrpr	%r23, 0x008d, %pil
	.word 0xb735d000  ! 124: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xf42ce10a  ! 126: STB_I	stb	%r26, [%r19 + 0x010a]
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2248000  ! 133: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf8254000  ! 134: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf275a06c  ! 141: STX_I	stx	%r25, [%r22 + 0x006c]
	.word 0xf53d212c  ! 146: STDF_I	std	%f26, [0x012c, %r20]
	.word 0xb12da001  ! 148: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xfa3c4000  ! 149: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf27560e7  ! 150: STX_I	stx	%r25, [%r21 + 0x00e7]
	setx	0x98103fe800007ad6, %g1, %r10
	.word 0x839a8000  ! 152: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_5, %g1, %r20
	.word 0xb32c1000  ! 156: SLLX_R	sllx	%r16, %r0, %r25
	mov	2, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2356160  ! 160: STH_I	sth	%r25, [%r21 + 0x0160]
	.word 0xf875a1eb  ! 161: STX_I	stx	%r28, [%r22 + 0x01eb]
	.word 0xf83da19a  ! 169: STD_I	std	%r28, [%r22 + 0x019a]
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabdc000  ! 172: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0xfe2c21b0  ! 176: STB_I	stb	%r31, [%r16 + 0x01b0]
	.word 0xfd3d4000  ! 183: STDF_R	std	%f30, [%r0, %r21]
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 192: RDPR_GL	rdpr	%-, %r25
	.word 0xfa754000  ! 196: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf23ce186  ! 201: STD_I	std	%r25, [%r19 + 0x0186]
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4e028  ! 207: ADDCcc_I	addccc 	%r19, 0x0028, %r29
	.word 0xb1480000  ! 208: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x66264da600000b85, %g1, %r10
	.word 0x839a8000  ! 211: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xac21883d000058d0, %g1, %r10
	.word 0x839a8000  ! 214: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd480000  ! 216: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf0344000  ! 217: STH_R	sth	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3d606d  ! 225: STD_I	std	%r29, [%r21 + 0x006d]
	.word 0xf43421f0  ! 233: STH_I	sth	%r26, [%r16 + 0x01f0]
	.word 0xf035e09b  ! 236: STH_I	sth	%r24, [%r23 + 0x009b]
	.word 0xfe3d4000  ! 238: STD_R	std	%r31, [%r21 + %r0]
	.word 0xb81ce126  ! 240: XOR_I	xor 	%r19, 0x0126, %r28
	.word 0xb9510000  ! 241: RDPR_TICK	<illegal instruction>
	.word 0xbe3520e7  ! 242: SUBC_I	orn 	%r20, 0x00e7, %r31
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b44000  ! 246: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xf234e1b5  ! 253: STH_I	sth	%r25, [%r19 + 0x01b5]
	.word 0xf075e047  ! 254: STX_I	stx	%r24, [%r23 + 0x0047]
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 261: RDPR_TL	<illegal instruction>
	.word 0xf835c000  ! 263: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf63c8000  ! 264: STD_R	std	%r27, [%r18 + %r0]
	.word 0x8594e1f6  ! 266: WRPR_TSTATE_I	wrpr	%r19, 0x01f6, %tstate
	.word 0x91956078  ! 270: WRPR_PIL_I	wrpr	%r21, 0x0078, %pil
	.word 0xbb2d0000  ! 272: SLL_R	sll 	%r20, %r0, %r29
	.word 0xf33c6175  ! 274: STDF_I	std	%f25, [0x0175, %r17]
	.word 0xf8240000  ! 277: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf874c000  ! 278: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf474e1e6  ! 280: STX_I	stx	%r26, [%r19 + 0x01e6]
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 282: STH_R	sth	%r29, [%r22 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 284: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb951c000  ! 287: RDPR_TL	rdpr	%tl, %r28
	.word 0xf6358000  ! 288: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf47461a5  ! 291: STX_I	stx	%r26, [%r17 + 0x01a5]
	.word 0x9195e1d4  ! 294: WRPR_PIL_I	wrpr	%r23, 0x01d4, %pil
	.word 0xf83d4000  ! 299: STD_R	std	%r28, [%r21 + %r0]
	.word 0x8995a114  ! 300: WRPR_TICK_I	wrpr	%r22, 0x0114, %tick
	.word 0xb9500000  ! 301: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xf03d8000  ! 305: STD_R	std	%r24, [%r22 + %r0]
	.word 0xfe3d4000  ! 309: STD_R	std	%r31, [%r21 + %r0]
	mov	0x232, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3da001  ! 313: SRA_I	sra 	%r22, 0x0001, %r31
	.word 0xbe05c000  ! 314: ADD_R	add 	%r23, %r0, %r31
	.word 0xb235a12c  ! 315: SUBC_I	orn 	%r22, 0x012c, %r25
	.word 0xfe3d0000  ! 316: STD_R	std	%r31, [%r20 + %r0]
	setx	data_start_5, %g1, %r23
	mov	1, %r12
	.word 0x8f930000  ! 321: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa2cc000  ! 325: STB_R	stb	%r29, [%r19 + %r0]
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874e00e  ! 328: STX_I	stx	%r28, [%r19 + 0x000e]
	.word 0xfb3ca165  ! 329: STDF_I	std	%f29, [0x0165, %r18]
	.word 0xb9518000  ! 331: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb7504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xf0748000  ! 337: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xfe3c4000  ! 338: STD_R	std	%r31, [%r17 + %r0]
	.word 0xbe050000  ! 342: ADD_R	add 	%r20, %r0, %r31
	.word 0xf63c206c  ! 344: STD_I	std	%r27, [%r16 + 0x006c]
	.word 0xb1540000  ! 346: RDPR_GL	<illegal instruction>
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d0000  ! 349: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb550c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0xf2742194  ! 358: STX_I	stx	%r25, [%r16 + 0x0194]
	.word 0xb1540000  ! 359: RDPR_GL	<illegal instruction>
	setx	data_start_6, %g1, %r18
	.word 0xf0256019  ! 364: STW_I	stw	%r24, [%r21 + 0x0019]
	.word 0xfa244000  ! 365: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf674a07b  ! 366: STX_I	stx	%r27, [%r18 + 0x007b]
	.word 0xbcb5212c  ! 367: ORNcc_I	orncc 	%r20, 0x012c, %r30
	.word 0xf83ca0dd  ! 370: STD_I	std	%r28, [%r18 + 0x00dd]
	.word 0xbd3c8000  ! 372: SRA_R	sra 	%r18, %r0, %r30
	.word 0xf13d2172  ! 379: STDF_I	std	%f24, [0x0172, %r20]
	.word 0xfa354000  ! 381: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xfb3c0000  ! 383: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf0744000  ! 386: STX_R	stx	%r24, [%r17 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 388: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4748000  ! 389: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfa24c000  ! 390: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfe744000  ! 391: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xfa7521e4  ! 392: STX_I	stx	%r29, [%r20 + 0x01e4]
	mov	0, %r12
	.word 0xa1930000  ! 398: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb52d7001  ! 404: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xf22ca1cf  ! 405: STB_I	stb	%r25, [%r18 + 0x01cf]
	.word 0xfe3d8000  ! 406: STD_R	std	%r31, [%r22 + %r0]
	.word 0x899560c5  ! 415: WRPR_TICK_I	wrpr	%r21, 0x00c5, %tick
	.word 0xf82c60e3  ! 416: STB_I	stb	%r28, [%r17 + 0x00e3]
	.word 0xf82d21c8  ! 417: STB_I	stb	%r28, [%r20 + 0x01c8]
	.word 0xf0244000  ! 419: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb73d2001  ! 420: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0x899461ca  ! 421: WRPR_TICK_I	wrpr	%r17, 0x01ca, %tick
	.word 0xb4058000  ! 423: ADD_R	add 	%r22, %r0, %r26
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73cc000  ! 425: STDF_R	std	%f27, [%r0, %r19]
	.word 0xb49cc000  ! 426: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xf2340000  ! 431: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf02d2109  ! 432: STB_I	stb	%r24, [%r20 + 0x0109]
	.word 0xb415611e  ! 433: OR_I	or 	%r21, 0x011e, %r26
	.word 0xb9480000  ! 436: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf4242111  ! 439: STW_I	stw	%r26, [%r16 + 0x0111]
	.word 0xb351c000  ! 440: RDPR_TL	rdpr	%tl, %r25
	.word 0xfc750000  ! 444: STX_R	stx	%r30, [%r20 + %r0]
	.word 0x9194215e  ! 452: WRPR_PIL_I	wrpr	%r16, 0x015e, %pil
	.word 0xbb540000  ! 453: RDPR_GL	rdpr	%-, %r29
	setx	data_start_0, %g1, %r21
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6350000  ! 459: STH_R	sth	%r27, [%r20 + %r0]
	setx	0x1fef79c800002f44, %g1, %r10
	.word 0x839a8000  ! 461: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba9de03f  ! 464: XORcc_I	xorcc 	%r23, 0x003f, %r29
	.word 0x8d956051  ! 465: WRPR_PSTATE_I	wrpr	%r21, 0x0051, %pstate
	.word 0xb2bdc000  ! 466: XNORcc_R	xnorcc 	%r23, %r0, %r25
	mov	0x101, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c8000  ! 470: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xb8b44000  ! 473: ORNcc_R	orncc 	%r17, %r0, %r28
	setx	0x2abb77760000eb8f, %g1, %r10
	.word 0x819a8000  ! 474: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf43520a9  ! 475: STH_I	sth	%r26, [%r20 + 0x00a9]
	.word 0xf024e18a  ! 479: STW_I	stw	%r24, [%r19 + 0x018a]
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946120  ! 486: WRPR_TNPC_I	wrpr	%r17, 0x0120, %tnpc
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d8000  ! 488: SRA_R	sra 	%r22, %r0, %r29
	.word 0x9194a075  ! 490: WRPR_PIL_I	wrpr	%r18, 0x0075, %pil
	.word 0xf6754000  ! 492: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf23cc000  ! 494: STD_R	std	%r25, [%r19 + %r0]
	.word 0xb1508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf03561c6  ! 497: STH_I	sth	%r24, [%r21 + 0x01c6]
	.word 0xf2744000  ! 501: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf83420fc  ! 503: STH_I	sth	%r28, [%r16 + 0x00fc]
	.word 0xf2740000  ! 505: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xff3c0000  ! 506: STDF_R	std	%f31, [%r0, %r16]
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e1d9  ! 510: WRPR_PSTATE_I	wrpr	%r19, 0x01d9, %pstate
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf625c000  ! 523: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf83521eb  ! 524: STH_I	sth	%r28, [%r20 + 0x01eb]
	.word 0xfc3d4000  ! 525: STD_R	std	%r30, [%r21 + %r0]
	.word 0xbf540000  ! 531: RDPR_GL	rdpr	%-, %r31
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 537: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xf225a0fc  ! 539: STW_I	stw	%r25, [%r22 + 0x00fc]
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2356166  ! 542: ORN_I	orn 	%r21, 0x0166, %r25
	.word 0xf33c8000  ! 544: STDF_R	std	%f25, [%r0, %r18]
	.word 0xfa2c0000  ! 545: STB_R	stb	%r29, [%r16 + %r0]
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23c8000  ! 549: STD_R	std	%r25, [%r18 + %r0]
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 552: RDPR_TICK	<illegal instruction>
	.word 0x8194202f  ! 553: WRPR_TPC_I	wrpr	%r16, 0x002f, %tpc
	.word 0xf224c000  ! 554: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf2248000  ! 556: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb7540000  ! 557: RDPR_GL	rdpr	%-, %r27
	.word 0x85942109  ! 560: WRPR_TSTATE_I	wrpr	%r16, 0x0109, %tstate
	.word 0xf274e0cb  ! 562: STX_I	stx	%r25, [%r19 + 0x00cb]
	.word 0xfe34a182  ! 564: STH_I	sth	%r31, [%r18 + 0x0182]
	.word 0xf42521e5  ! 565: STW_I	stw	%r26, [%r20 + 0x01e5]
	setx	0x73e921af00002d1d, %g1, %r10
	.word 0x839a8000  ! 567: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x20c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3ca105  ! 576: STDF_I	std	%f29, [0x0105, %r18]
	.word 0xb434e063  ! 577: SUBC_I	orn 	%r19, 0x0063, %r26
	.word 0xf6358000  ! 579: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfa2d8000  ! 580: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfb3ce146  ! 581: STDF_I	std	%f29, [0x0146, %r19]
	mov	1, %r12
	.word 0x8f930000  ! 582: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf13da0f9  ! 585: STDF_I	std	%f24, [0x00f9, %r22]
	.word 0xf93c8000  ! 588: STDF_R	std	%f28, [%r0, %r18]
	mov	1, %r12
	.word 0xa1930000  ! 590: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03c207d  ! 592: STD_I	std	%r24, [%r16 + 0x007d]
	.word 0xb6b44000  ! 598: SUBCcc_R	orncc 	%r17, %r0, %r27
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	.word 0xb9510000  ! 613: RDPR_TICK	rdpr	%tick, %r28
	setx	0x35651cec00004e95, %g1, %r10
	.word 0x839a8000  ! 620: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa75c000  ! 632: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf674a080  ! 633: STX_I	stx	%r27, [%r18 + 0x0080]
	.word 0xb495e1ea  ! 634: ORcc_I	orcc 	%r23, 0x01ea, %r26
	.word 0xbb508000  ! 635: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbb518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xfa24205a  ! 638: STW_I	stw	%r29, [%r16 + 0x005a]
	setx	0xeab9c4600000cd8d, %g1, %r10
	.word 0x819a8000  ! 644: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf424a13a  ! 649: STW_I	stw	%r26, [%r18 + 0x013a]
	.word 0xfe352162  ! 652: STH_I	sth	%r31, [%r20 + 0x0162]
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23d4000  ! 657: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf67421e8  ! 658: STX_I	stx	%r27, [%r16 + 0x01e8]
	.word 0xb1508000  ! 659: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb4240000  ! 661: SUB_R	sub 	%r16, %r0, %r26
	.word 0x8994a05a  ! 665: WRPR_TICK_I	wrpr	%r18, 0x005a, %tick
	setx	data_start_6, %g1, %r20
	.word 0xf6358000  ! 673: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf225a012  ! 674: STW_I	stw	%r25, [%r22 + 0x0012]
	.word 0xfc2d0000  ! 676: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xba34a1f3  ! 677: ORN_I	orn 	%r18, 0x01f3, %r29
	mov	1, %r12
	.word 0xa1930000  ! 680: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd2c4000  ! 681: SLL_R	sll 	%r17, %r0, %r30
	.word 0xf02de05d  ! 682: STB_I	stb	%r24, [%r23 + 0x005d]
	.word 0xb951c000  ! 684: RDPR_TL	rdpr	%tl, %r28
	.word 0xf0746035  ! 687: STX_I	stx	%r24, [%r17 + 0x0035]
	.word 0x919461ce  ! 691: WRPR_PIL_I	wrpr	%r17, 0x01ce, %pil
	.word 0x9195e033  ! 692: WRPR_PIL_I	wrpr	%r23, 0x0033, %pil
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc758000  ! 698: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf67421b1  ! 700: STX_I	stx	%r27, [%r16 + 0x01b1]
	.word 0xf0250000  ! 701: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xfa24a056  ! 702: STW_I	stw	%r29, [%r18 + 0x0056]
	.word 0xf62ce040  ! 703: STB_I	stb	%r27, [%r19 + 0x0040]
	.word 0x8795a124  ! 705: WRPR_TT_I	wrpr	%r22, 0x0124, %tt
	.word 0xfa74a0a7  ! 706: STX_I	stx	%r29, [%r18 + 0x00a7]
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 712: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb7641800  ! 714: MOVcc_R	<illegal instruction>
	.word 0x81956133  ! 719: WRPR_TPC_I	wrpr	%r21, 0x0133, %tpc
	.word 0xf8748000  ! 722: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xbf500000  ! 723: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf475c000  ! 725: STX_R	stx	%r26, [%r23 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 726: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x7d7567f600003880, %g1, %r10
	.word 0x839a8000  ! 732: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf43c8000  ! 734: STD_R	std	%r26, [%r18 + %r0]
	.word 0x899420d4  ! 736: WRPR_TICK_I	wrpr	%r16, 0x00d4, %tick
	.word 0xfa2ca029  ! 743: STB_I	stb	%r29, [%r18 + 0x0029]
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899520ef  ! 748: WRPR_TICK_I	wrpr	%r20, 0x00ef, %tick
	.word 0xf274c000  ! 749: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xfa35a147  ! 751: STH_I	sth	%r29, [%r22 + 0x0147]
	mov	0x2, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73d0000  ! 754: STDF_R	std	%f27, [%r0, %r20]
	.word 0xb7508000  ! 758: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xfa3dc000  ! 759: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfc252045  ! 761: STW_I	stw	%r30, [%r20 + 0x0045]
	.word 0xf474c000  ! 763: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf8244000  ! 766: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb9510000  ! 767: RDPR_TICK	<illegal instruction>
	.word 0xf8344000  ! 769: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb3510000  ! 771: RDPR_TICK	<illegal instruction>
	.word 0x839520b7  ! 772: WRPR_TNPC_I	wrpr	%r20, 0x00b7, %tnpc
	.word 0xff3d8000  ! 773: STDF_R	std	%f31, [%r0, %r22]
	.word 0x91956006  ! 774: WRPR_PIL_I	wrpr	%r21, 0x0006, %pil
	.word 0xbb7d4400  ! 776: MOVR_R	movre	%r21, %r0, %r29
	mov	1, %r12
	.word 0x8f930000  ! 777: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3500000  ! 779: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf82c2134  ! 782: STB_I	stb	%r28, [%r16 + 0x0134]
	.word 0xb1510000  ! 783: RDPR_TICK	<illegal instruction>
	.word 0xf42c0000  ! 785: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xfe2d4000  ! 787: STB_R	stb	%r31, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 798: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xfc350000  ! 802: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xbf510000  ! 805: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf83d4000  ! 807: STD_R	std	%r28, [%r21 + %r0]
	.word 0xbd51c000  ! 808: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 809: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825c000  ! 811: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf62c21de  ! 812: STB_I	stb	%r27, [%r16 + 0x01de]
	.word 0xf47561f3  ! 813: STX_I	stx	%r26, [%r21 + 0x01f3]
	.word 0xfa24c000  ! 816: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xb32c1000  ! 820: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xf4354000  ! 829: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfe2ca061  ! 831: STB_I	stb	%r31, [%r18 + 0x0061]
	.word 0xbe2d21ed  ! 832: ANDN_I	andn 	%r20, 0x01ed, %r31
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3c8000  ! 835: STD_R	std	%r29, [%r18 + %r0]
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 840: SRLX_R	srlx	%r19, %r0, %r27
	mov	0, %r12
	.word 0xa1930000  ! 841: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf824e189  ! 843: STW_I	stw	%r28, [%r19 + 0x0189]
	.word 0xb22d210b  ! 845: ANDN_I	andn 	%r20, 0x010b, %r25
	.word 0xf83d6184  ! 846: STD_I	std	%r28, [%r21 + 0x0184]
	mov	0, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf675a063  ! 849: STX_I	stx	%r27, [%r22 + 0x0063]
	.word 0x8994a05b  ! 850: WRPR_TICK_I	wrpr	%r18, 0x005b, %tick
	.word 0xf225a074  ! 851: STW_I	stw	%r25, [%r22 + 0x0074]
	.word 0xf13c6100  ! 852: STDF_I	std	%f24, [0x0100, %r17]
	.word 0xb0144000  ! 856: OR_R	or 	%r17, %r0, %r24
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa246103  ! 858: STW_I	stw	%r29, [%r17 + 0x0103]
	.word 0xfe754000  ! 861: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf025e149  ! 863: STW_I	stw	%r24, [%r23 + 0x0149]
	.word 0xb750c000  ! 865: RDPR_TT	rdpr	%tt, %r27
	.word 0xbac520b5  ! 867: ADDCcc_I	addccc 	%r20, 0x00b5, %r29
	.word 0xf53d4000  ! 870: STDF_R	std	%f26, [%r0, %r21]
	.word 0xbf345000  ! 872: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xb550c000  ! 879: RDPR_TT	<illegal instruction>
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c8000  ! 881: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf73c4000  ! 884: STDF_R	std	%f27, [%r0, %r17]
	mov	1, %r12
	.word 0x8f930000  ! 891: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf33c4000  ! 893: STDF_R	std	%f25, [%r0, %r17]
	.word 0xfc25207b  ! 896: STW_I	stw	%r30, [%r20 + 0x007b]
	.word 0xbcc461ad  ! 900: ADDCcc_I	addccc 	%r17, 0x01ad, %r30
	mov	1, %r12
	.word 0x8f930000  ! 901: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995a11e  ! 904: WRPR_TICK_I	wrpr	%r22, 0x011e, %tick
	.word 0xb350c000  ! 908: RDPR_TT	rdpr	%tt, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc3460b9  ! 911: STH_I	sth	%r30, [%r17 + 0x00b9]
	.word 0xf63de12e  ! 912: STD_I	std	%r27, [%r23 + 0x012e]
	.word 0xfa35e1be  ! 914: STH_I	sth	%r29, [%r23 + 0x01be]
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 919: RDPR_TICK	<illegal instruction>
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93d0000  ! 922: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfa740000  ! 924: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xff3d8000  ! 925: STDF_R	std	%f31, [%r0, %r22]
	.word 0xfa750000  ! 931: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xff3ca07a  ! 933: STDF_I	std	%f31, [0x007a, %r18]
	.word 0xf62de0dc  ! 935: STB_I	stb	%r27, [%r23 + 0x00dc]
	.word 0xf07420d1  ! 936: STX_I	stx	%r24, [%r16 + 0x00d1]
	.word 0xf224a0c5  ! 938: STW_I	stw	%r25, [%r18 + 0x00c5]
	.word 0xfc3ce11c  ! 946: STD_I	std	%r30, [%r19 + 0x011c]
	mov	0, %r12
	.word 0xa1930000  ! 949: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3500000  ! 952: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xfc740000  ! 955: STX_R	stx	%r30, [%r16 + %r0]
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879461f4  ! 958: WRPR_TT_I	wrpr	%r17, 0x01f4, %tt
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 966: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbd504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xbc448000  ! 969: ADDC_R	addc 	%r18, %r0, %r30
	.word 0xf2754000  ! 972: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf93de0d1  ! 973: STDF_I	std	%f28, [0x00d1, %r23]
	.word 0xb3540000  ! 978: RDPR_GL	<illegal instruction>
	.word 0xfa74e199  ! 983: STX_I	stx	%r29, [%r19 + 0x0199]
	.word 0xb43460da  ! 984: ORN_I	orn 	%r17, 0x00da, %r26
	.word 0xf62c8000  ! 987: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf73d8000  ! 988: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf674207a  ! 989: STX_I	stx	%r27, [%r16 + 0x007a]
	mov	2, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe25a0df  ! 996: STW_I	stw	%r31, [%r22 + 0x00df]
	.word 0x8994611d  ! 997: WRPR_TICK_I	wrpr	%r17, 0x011d, %tick
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
	.word 0xb5480000  ! 1: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc5d0000  ! 7: LDX_R	ldx	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41d0000  ! 14: LDD_R	ldd	[%r20 + %r0], %r26
	setx	0x5ebde5260000ca06, %g1, %r10
	.word 0x839a8000  ! 18: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf805e1b6  ! 20: LDUW_I	lduw	[%r23 + 0x01b6], %r28
	.word 0xb60cc000  ! 21: AND_R	and 	%r19, %r0, %r27
	.word 0xb9504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xfe444000  ! 24: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xfa0dc000  ! 25: LDUB_R	ldub	[%r23 + %r0], %r29
	setx	data_start_6, %g1, %r20
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195601b  ! 33: WRPR_PIL_I	wrpr	%r21, 0x001b, %pil
	.word 0xbe44a1c0  ! 35: ADDC_I	addc 	%r18, 0x01c0, %r31
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839460d2  ! 51: WRPR_TNPC_I	wrpr	%r17, 0x00d2, %tnpc
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 59: RDPR_TPC	<illegal instruction>
	.word 0xf055a05d  ! 61: LDSH_I	ldsh	[%r22 + 0x005d], %r24
	.word 0xf4050000  ! 62: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf4554000  ! 63: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf615608d  ! 66: LDUH_I	lduh	[%r21 + 0x008d], %r27
	.word 0xf2456045  ! 69: LDSW_I	ldsw	[%r21 + 0x0045], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xb139602c0000c804, %g1, %r10
	.word 0x839a8000  ! 72: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb540000  ! 73: RDPR_GL	<illegal instruction>
	.word 0x8d9420da  ! 75: WRPR_PSTATE_I	wrpr	%r16, 0x00da, %pstate
	setx	data_start_4, %g1, %r17
	.word 0x8995a0a6  ! 80: WRPR_TICK_I	wrpr	%r22, 0x00a6, %tick
	.word 0xf24d6147  ! 85: LDSB_I	ldsb	[%r21 + 0x0147], %r25
	.word 0xf414c000  ! 86: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xbcac616f  ! 87: ANDNcc_I	andncc 	%r17, 0x016f, %r30
	.word 0xfc15a077  ! 90: LDUH_I	lduh	[%r22 + 0x0077], %r30
	.word 0xf0448000  ! 93: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xf4558000  ! 96: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0x9194e0ec  ! 99: WRPR_PIL_I	wrpr	%r19, 0x00ec, %pil
	.word 0xf404e1c7  ! 102: LDUW_I	lduw	[%r19 + 0x01c7], %r26
	.word 0xb9500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0xf644c000  ! 107: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf44d8000  ! 112: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xb92d4000  ! 113: SLL_R	sll 	%r21, %r0, %r28
	.word 0xfe55c000  ! 118: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf04dc000  ! 119: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf64520ef  ! 120: LDSW_I	ldsw	[%r20 + 0x00ef], %r27
	.word 0x9195215d  ! 121: WRPR_PIL_I	wrpr	%r20, 0x015d, %pil
	.word 0x8d956013  ! 122: WRPR_PSTATE_I	wrpr	%r21, 0x0013, %pstate
	.word 0x91942119  ! 123: WRPR_PIL_I	wrpr	%r16, 0x0119, %pil
	.word 0xb9341000  ! 124: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xf65d8000  ! 125: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf84d8000  ! 129: LDSB_R	ldsb	[%r22 + %r0], %r28
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d610a  ! 138: LDX_I	ldx	[%r21 + 0x010a], %r24
	.word 0xf205e096  ! 140: LDUW_I	lduw	[%r23 + 0x0096], %r25
	.word 0xf4058000  ! 145: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xb32de001  ! 148: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xfa5d60b8  ! 151: LDX_I	ldx	[%r21 + 0x00b8], %r29
	setx	0xf5ccfb7900000f13, %g1, %r10
	.word 0x839a8000  ! 152: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_4, %g1, %r16
	.word 0xbd2c1000  ! 156: SLLX_R	sllx	%r16, %r0, %r30
	mov	1, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa144000  ! 163: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf8058000  ! 164: LDUW_R	lduw	[%r22 + %r0], %r28
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbdc000  ! 172: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xfa540000  ! 173: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf41c2011  ! 178: LDD_I	ldd	[%r16 + 0x0011], %r26
	.word 0xff1d606b  ! 180: LDDF_I	ldd	[%r21, 0x006b], %f31
	.word 0xf21c21b1  ! 182: LDD_I	ldd	[%r16 + 0x01b1], %r25
	.word 0xf0048000  ! 186: LDUW_R	lduw	[%r18 + %r0], %r24
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21ca0cf  ! 189: LDD_I	ldd	[%r18 + 0x00cf], %r25
	.word 0xf25ce16d  ! 191: LDX_I	ldx	[%r19 + 0x016d], %r25
	.word 0xb1540000  ! 192: RDPR_GL	<illegal instruction>
	.word 0xf614e093  ! 194: LDUH_I	lduh	[%r19 + 0x0093], %r27
	.word 0xfe0d0000  ! 198: LDUB_R	ldub	[%r20 + %r0], %r31
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615e138  ! 206: LDUH_I	lduh	[%r23 + 0x0138], %r27
	.word 0xb4c4e126  ! 207: ADDCcc_I	addccc 	%r19, 0x0126, %r26
	.word 0xb5480000  ! 208: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf2456083  ! 209: LDSW_I	ldsw	[%r21 + 0x0083], %r25
	setx	0xe3b2427100006ec3, %g1, %r10
	.word 0x839a8000  ! 211: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x8564d0d00000cb8d, %g1, %r10
	.word 0x839a8000  ! 214: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb480000  ! 216: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1ca0bb  ! 219: LDD_I	ldd	[%r18 + 0x00bb], %r29
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814e1ce  ! 222: LDUH_I	lduh	[%r19 + 0x01ce], %r28
	.word 0xfe4dc000  ! 234: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xb21de151  ! 240: XOR_I	xor 	%r23, 0x0151, %r25
	.word 0xbf510000  ! 241: RDPR_TICK	<illegal instruction>
	.word 0xba3521f4  ! 242: SUBC_I	orn 	%r20, 0x01f4, %r29
	.word 0xf24dc000  ! 243: LDSB_R	ldsb	[%r23 + %r0], %r25
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b58000  ! 246: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xfb1d0000  ! 249: LDDF_R	ldd	[%r20, %r0], %f29
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604a07c  ! 257: LDUW_I	lduw	[%r18 + 0x007c], %r27
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 261: RDPR_TL	<illegal instruction>
	.word 0xf61c8000  ! 262: LDD_R	ldd	[%r18 + %r0], %r27
	.word 0x8594600a  ! 266: WRPR_TSTATE_I	wrpr	%r17, 0x000a, %tstate
	.word 0xf444617e  ! 267: LDSW_I	ldsw	[%r17 + 0x017e], %r26
	.word 0xf64c4000  ! 269: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0x919561dd  ! 270: WRPR_PIL_I	wrpr	%r21, 0x01dd, %pil
	.word 0xb12d0000  ! 272: SLL_R	sll 	%r20, %r0, %r24
	.word 0xf05d217c  ! 276: LDX_I	ldx	[%r20 + 0x017c], %r24
	.word 0xfe4d0000  ! 279: LDSB_R	ldsb	[%r20 + %r0], %r31
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0xa1930000  ! 284: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf40521d4  ! 285: LDUW_I	lduw	[%r20 + 0x01d4], %r26
	.word 0xfe4c4000  ! 286: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xbb51c000  ! 287: RDPR_TL	<illegal instruction>
	.word 0xf054c000  ! 292: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0x9195609b  ! 294: WRPR_PIL_I	wrpr	%r21, 0x009b, %pil
	.word 0xfa544000  ! 297: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0x8995613b  ! 300: WRPR_TICK_I	wrpr	%r21, 0x013b, %tick
	.word 0xb9500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0xf11ce08e  ! 304: LDDF_I	ldd	[%r19, 0x008e], %f24
	.word 0xfc1ce1df  ! 306: LDD_I	ldd	[%r19 + 0x01df], %r30
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91c6187  ! 311: LDDF_I	ldd	[%r17, 0x0187], %f28
	.word 0xf8048000  ! 312: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xbd3d6001  ! 313: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xb005c000  ! 314: ADD_R	add 	%r23, %r0, %r24
	.word 0xbc35a0f0  ! 315: SUBC_I	orn 	%r22, 0x00f0, %r30
	.word 0xfe04a194  ! 317: LDUW_I	lduw	[%r18 + 0x0194], %r31
	setx	data_start_5, %g1, %r17
	.word 0xf45da092  ! 319: LDX_I	ldx	[%r22 + 0x0092], %r26
	mov	0, %r12
	.word 0x8f930000  ! 321: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc4dc000  ! 324: LDSB_R	ldsb	[%r23 + %r0], %r30
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 331: RDPR_PSTATE	<illegal instruction>
	.word 0xb3504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xf64d8000  ! 333: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xf81dc000  ! 334: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xf00c0000  ! 335: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xb6058000  ! 342: ADD_R	add 	%r22, %r0, %r27
	.word 0xfa144000  ! 343: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb9540000  ! 346: RDPR_GL	<illegal instruction>
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1cc000  ! 354: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb550c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0xb5540000  ! 359: RDPR_GL	<illegal instruction>
	.word 0xf65420e8  ! 360: LDSH_I	ldsh	[%r16 + 0x00e8], %r27
	setx	data_start_3, %g1, %r23
	.word 0xfa45c000  ! 362: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xbab4e07a  ! 367: ORNcc_I	orncc 	%r19, 0x007a, %r29
	.word 0xfe456067  ! 368: LDSW_I	ldsw	[%r21 + 0x0067], %r31
	.word 0xb13c8000  ! 372: SRA_R	sra 	%r18, %r0, %r24
	.word 0xf80d4000  ! 373: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf21c606d  ! 375: LDD_I	ldd	[%r17 + 0x006d], %r25
	.word 0xfc5ca0af  ! 377: LDX_I	ldx	[%r18 + 0x00af], %r30
	mov	0, %r12
	.word 0x8f930000  ! 388: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0xa1930000  ! 398: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb12d3001  ! 404: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xfe4c4000  ! 407: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf51d6086  ! 408: LDDF_I	ldd	[%r21, 0x0086], %f26
	.word 0xf31c0000  ! 410: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0x89952175  ! 415: WRPR_TICK_I	wrpr	%r20, 0x0175, %tick
	.word 0xb33ca001  ! 420: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0x8994e15e  ! 421: WRPR_TICK_I	wrpr	%r19, 0x015e, %tick
	.word 0xb0044000  ! 423: ADD_R	add 	%r17, %r0, %r24
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89dc000  ! 426: XORcc_R	xorcc 	%r23, %r0, %r28
	.word 0xf0452091  ! 427: LDSW_I	ldsw	[%r20 + 0x0091], %r24
	.word 0xbc14a1cf  ! 433: OR_I	or 	%r18, 0x01cf, %r30
	.word 0xf004a003  ! 434: LDUW_I	lduw	[%r18 + 0x0003], %r24
	.word 0xb1480000  ! 436: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf814c000  ! 437: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xfa14a0cb  ! 438: LDUH_I	lduh	[%r18 + 0x00cb], %r29
	.word 0xb951c000  ! 440: RDPR_TL	<illegal instruction>
	.word 0xfa05e0a5  ! 441: LDUW_I	lduw	[%r23 + 0x00a5], %r29
	.word 0xf84c4000  ! 443: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0x9194206c  ! 452: WRPR_PIL_I	wrpr	%r16, 0x006c, %pil
	.word 0xbf540000  ! 453: RDPR_GL	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xfc54e15e  ! 456: LDSH_I	ldsh	[%r19 + 0x015e], %r30
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	setx	0x1af5c5a200009ac7, %g1, %r10
	.word 0x839a8000  ! 461: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf04ce1a3  ! 462: LDSB_I	ldsb	[%r19 + 0x01a3], %r24
	.word 0xbc9d205c  ! 464: XORcc_I	xorcc 	%r20, 0x005c, %r30
	.word 0x8d95e067  ! 465: WRPR_PSTATE_I	wrpr	%r23, 0x0067, %pstate
	.word 0xb2bdc000  ! 466: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xfc1d6136  ! 467: LDD_I	ldd	[%r21 + 0x0136], %r30
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c4000  ! 470: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xbeb58000  ! 473: ORNcc_R	orncc 	%r22, %r0, %r31
	setx	0x210da62400000c51, %g1, %r10
	.word 0x819a8000  ! 474: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf41dc000  ! 480: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xf11d0000  ! 482: LDDF_R	ldd	[%r20, %r0], %f24
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839421d8  ! 486: WRPR_TNPC_I	wrpr	%r16, 0x01d8, %tnpc
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3cc000  ! 488: SRA_R	sra 	%r19, %r0, %r30
	.word 0x9194a055  ! 490: WRPR_PIL_I	wrpr	%r18, 0x0055, %pil
	.word 0xfe0c20f1  ! 493: LDUB_I	ldub	[%r16 + 0x00f1], %r31
	.word 0xbd508000  ! 495: RDPR_TSTATE	<illegal instruction>
	.word 0xfa1c4000  ! 498: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xf71d0000  ! 502: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf45d4000  ! 508: LDX_R	ldx	[%r21 + %r0], %r26
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a0be  ! 510: WRPR_PSTATE_I	wrpr	%r22, 0x00be, %pstate
	.word 0xfe1ca177  ! 513: LDD_I	ldd	[%r18 + 0x0177], %r31
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84dc000  ! 517: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf20d20d0  ! 518: LDUB_I	ldub	[%r20 + 0x00d0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa04a07b  ! 527: LDUW_I	lduw	[%r18 + 0x007b], %r29
	.word 0xfa0ce018  ! 529: LDUB_I	ldub	[%r19 + 0x0018], %r29
	.word 0xbd540000  ! 531: RDPR_GL	rdpr	%-, %r30
	.word 0xfc458000  ! 533: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfb1d60a9  ! 534: LDDF_I	ldd	[%r21, 0x00a9], %f29
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254a098  ! 538: LDSH_I	ldsh	[%r18 + 0x0098], %r25
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83461a6  ! 542: ORN_I	orn 	%r17, 0x01a6, %r28
	.word 0xf015218a  ! 543: LDUH_I	lduh	[%r20 + 0x018a], %r24
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004614f  ! 548: LDUW_I	lduw	[%r17 + 0x014f], %r24
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 552: RDPR_TICK	<illegal instruction>
	.word 0x8195a1f7  ! 553: WRPR_TPC_I	wrpr	%r22, 0x01f7, %tpc
	.word 0xfa1c202b  ! 555: LDD_I	ldd	[%r16 + 0x002b], %r29
	.word 0xb9540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0xf21c0000  ! 558: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0x8594e067  ! 560: WRPR_TSTATE_I	wrpr	%r19, 0x0067, %tstate
	.word 0xfb1d61a3  ! 561: LDDF_I	ldd	[%r21, 0x01a3], %f29
	setx	0x215b41e500002882, %g1, %r10
	.word 0x839a8000  ! 567: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4d6187  ! 569: LDSB_I	ldsb	[%r21 + 0x0187], %r31
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c8000  ! 573: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb434a1b4  ! 577: SUBC_I	orn 	%r18, 0x01b4, %r26
	.word 0xfb1d2061  ! 578: LDDF_I	ldd	[%r20, 0x0061], %f29
	mov	1, %r12
	.word 0x8f930000  ! 582: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf31ca1e3  ! 584: LDDF_I	ldd	[%r18, 0x01e3], %f25
	.word 0xfa1dc000  ! 587: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf2054000  ! 589: LDUW_R	lduw	[%r21 + %r0], %r25
	mov	1, %r12
	.word 0xa1930000  ! 590: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6146077  ! 597: LDUH_I	lduh	[%r17 + 0x0077], %r27
	.word 0xb0b50000  ! 598: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xf31c8000  ! 599: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xf0544000  ! 600: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xf20dc000  ! 602: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xff1d6103  ! 605: LDDF_I	ldd	[%r21, 0x0103], %f31
	.word 0xf01cc000  ! 606: LDD_R	ldd	[%r19 + %r0], %r24
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05de1c1  ! 608: LDX_I	ldx	[%r23 + 0x01c1], %r24
	.word 0xf40de19d  ! 609: LDUB_I	ldub	[%r23 + 0x019d], %r26
	setx	data_start_3, %g1, %r23
	.word 0xf645a08c  ! 611: LDSW_I	ldsw	[%r22 + 0x008c], %r27
	.word 0xbf510000  ! 613: RDPR_TICK	<illegal instruction>
	setx	0xa23bfe400006b16, %g1, %r10
	.word 0x839a8000  ! 620: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf85da0c6  ! 621: LDX_I	ldx	[%r22 + 0x00c6], %r28
	.word 0xfa1460c0  ! 625: LDUH_I	lduh	[%r17 + 0x00c0], %r29
	.word 0xf44c8000  ! 627: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xf60ce07c  ! 628: LDUB_I	ldub	[%r19 + 0x007c], %r27
	.word 0xf00c60f0  ! 629: LDUB_I	ldub	[%r17 + 0x00f0], %r24
	.word 0xb2956024  ! 634: ORcc_I	orcc 	%r21, 0x0024, %r25
	.word 0xb7508000  ! 635: RDPR_TSTATE	<illegal instruction>
	.word 0xbf518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xfc5de0ec  ! 637: LDX_I	ldx	[%r23 + 0x00ec], %r30
	.word 0xf21c2046  ! 639: LDD_I	ldd	[%r16 + 0x0046], %r25
	setx	0x3277e0340000bed2, %g1, %r10
	.word 0x819a8000  ! 644: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa0c8000  ! 646: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf615c000  ! 647: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf205c000  ! 648: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf91c609c  ! 650: LDDF_I	ldd	[%r17, 0x009c], %f28
	.word 0xf215c000  ! 651: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf6450000  ! 654: LDSW_R	ldsw	[%r20 + %r0], %r27
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xb2250000  ! 661: SUB_R	sub 	%r20, %r0, %r25
	.word 0x8995a0f5  ! 665: WRPR_TICK_I	wrpr	%r22, 0x00f5, %tick
	.word 0xfc544000  ! 668: LDSH_R	ldsh	[%r17 + %r0], %r30
	setx	data_start_5, %g1, %r16
	.word 0xf45da130  ! 672: LDX_I	ldx	[%r22 + 0x0130], %r26
	.word 0xb83521c0  ! 677: ORN_I	orn 	%r20, 0x01c0, %r28
	.word 0xfa04c000  ! 679: LDUW_R	lduw	[%r19 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 680: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb2cc000  ! 681: SLL_R	sll 	%r19, %r0, %r29
	.word 0xbf51c000  ! 684: RDPR_TL	<illegal instruction>
	.word 0xf215e1fc  ! 690: LDUH_I	lduh	[%r23 + 0x01fc], %r25
	.word 0x919561d9  ! 691: WRPR_PIL_I	wrpr	%r21, 0x01d9, %pil
	.word 0x91956173  ! 692: WRPR_PIL_I	wrpr	%r21, 0x0173, %pil
	.word 0xf24ca12b  ! 694: LDSB_I	ldsb	[%r18 + 0x012b], %r25
	.word 0xfe048000  ! 695: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf24c607e  ! 696: LDSB_I	ldsb	[%r17 + 0x007e], %r25
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1de1a1  ! 699: LDDF_I	ldd	[%r23, 0x01a1], %f30
	.word 0x8794618f  ! 705: WRPR_TT_I	wrpr	%r17, 0x018f, %tt
	.word 0xf01d8000  ! 708: LDD_R	ldd	[%r22 + %r0], %r24
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 712: RDPR_TNPC	<illegal instruction>
	.word 0xb5641800  ! 714: MOVcc_R	<illegal instruction>
	.word 0x8195a140  ! 719: WRPR_TPC_I	wrpr	%r22, 0x0140, %tpc
	.word 0xfc4c60b1  ! 721: LDSB_I	ldsb	[%r17 + 0x00b1], %r30
	.word 0xb9500000  ! 723: RDPR_TPC	rdpr	%tpc, %r28
	mov	1, %r12
	.word 0xa1930000  ! 726: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc4ce015  ! 728: LDSB_I	ldsb	[%r19 + 0x0015], %r30
	.word 0xf855a080  ! 729: LDSH_I	ldsh	[%r22 + 0x0080], %r28
	.word 0xf25cc000  ! 731: LDX_R	ldx	[%r19 + %r0], %r25
	setx	0x516253610000ac0f, %g1, %r10
	.word 0x839a8000  ! 732: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x89952021  ! 736: WRPR_TICK_I	wrpr	%r20, 0x0021, %tick
	.word 0xfa4dc000  ! 739: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfc1c8000  ! 742: LDD_R	ldd	[%r18 + %r0], %r30
	.word 0xf805c000  ! 744: LDUW_R	lduw	[%r23 + %r0], %r28
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf31de1e6  ! 747: LDDF_I	ldd	[%r23, 0x01e6], %f25
	.word 0x8994a0a5  ! 748: WRPR_TICK_I	wrpr	%r18, 0x00a5, %tick
	.word 0xf00d6190  ! 750: LDUB_I	ldub	[%r21 + 0x0190], %r24
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404a0df  ! 753: LDUW_I	lduw	[%r18 + 0x00df], %r26
	.word 0xbf508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xfe1de1f4  ! 760: LDD_I	ldd	[%r23 + 0x01f4], %r31
	.word 0xb5510000  ! 767: RDPR_TICK	<illegal instruction>
	.word 0xbd510000  ! 771: RDPR_TICK	<illegal instruction>
	.word 0x8395a005  ! 772: WRPR_TNPC_I	wrpr	%r22, 0x0005, %tnpc
	.word 0x9194615e  ! 774: WRPR_PIL_I	wrpr	%r17, 0x015e, %pil
	.word 0xbd7c0400  ! 776: MOVR_R	movre	%r16, %r0, %r30
	mov	0, %r12
	.word 0x8f930000  ! 777: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa5420b5  ! 778: LDSH_I	ldsh	[%r16 + 0x00b5], %r29
	.word 0xb9500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xb9510000  ! 783: RDPR_TICK	<illegal instruction>
	.word 0xf81c8000  ! 784: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xfa1d4000  ! 788: LDD_R	ldd	[%r21 + %r0], %r29
	mov	1, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xff1c4000  ! 794: LDDF_R	ldd	[%r17, %r0], %f31
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01461f8  ! 796: LDUH_I	lduh	[%r17 + 0x01f8], %r24
	.word 0xb3510000  ! 805: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb151c000  ! 808: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 809: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c6010  ! 815: LDUB_I	ldub	[%r17 + 0x0010], %r27
	.word 0xf01cc000  ! 817: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf8442101  ! 819: LDSW_I	ldsw	[%r16 + 0x0101], %r28
	.word 0xb12d5000  ! 820: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xfe4dc000  ! 827: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf0048000  ! 828: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xb42c6198  ! 832: ANDN_I	andn 	%r17, 0x0198, %r26
	.word 0xf2050000  ! 833: LDUW_R	lduw	[%r20 + %r0], %r25
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff1de0aa  ! 837: LDDF_I	ldd	[%r23, 0x00aa], %f31
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335d000  ! 840: SRLX_R	srlx	%r23, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 841: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe1cc000  ! 842: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xb82c2140  ! 845: ANDN_I	andn 	%r16, 0x0140, %r28
	mov	1, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x89952085  ! 850: WRPR_TICK_I	wrpr	%r20, 0x0085, %tick
	.word 0xba144000  ! 856: OR_R	or 	%r17, %r0, %r29
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf91d208e  ! 859: LDDF_I	ldd	[%r20, 0x008e], %f28
	.word 0xb950c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xbcc4a082  ! 867: ADDCcc_I	addccc 	%r18, 0x0082, %r30
	.word 0xf25460b8  ! 869: LDSH_I	ldsh	[%r17 + 0x00b8], %r25
	.word 0xbb349000  ! 872: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xfa444000  ! 873: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf84cc000  ! 875: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xfa4ce087  ! 876: LDSB_I	ldsb	[%r19 + 0x0087], %r29
	.word 0xbb50c000  ! 879: RDPR_TT	<illegal instruction>
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d8000  ! 889: LDX_R	ldx	[%r22 + %r0], %r28
	mov	1, %r12
	.word 0x8f930000  ! 891: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe054000  ! 895: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf60cc000  ! 899: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xb6c42002  ! 900: ADDCcc_I	addccc 	%r16, 0x0002, %r27
	mov	0, %r12
	.word 0x8f930000  ! 901: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf045c000  ! 903: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0x899461ea  ! 904: WRPR_TICK_I	wrpr	%r17, 0x01ea, %tick
	.word 0xf24c6012  ! 906: LDSB_I	ldsb	[%r17 + 0x0012], %r25
	.word 0xbb50c000  ! 908: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf254201a  ! 915: LDSH_I	ldsh	[%r16 + 0x001a], %r25
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c2187  ! 918: LDSB_I	ldsb	[%r16 + 0x0187], %r30
	.word 0xb9510000  ! 919: RDPR_TICK	<illegal instruction>
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf51d4000  ! 932: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xf84ce175  ! 934: LDSB_I	ldsb	[%r19 + 0x0175], %r28
	.word 0xf644604c  ! 940: LDSW_I	ldsw	[%r17 + 0x004c], %r27
	.word 0xfa55c000  ! 941: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf8148000  ! 942: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfe4d6047  ! 947: LDSB_I	ldsb	[%r21 + 0x0047], %r31
	.word 0xf245a05f  ! 948: LDSW_I	ldsw	[%r22 + 0x005f], %r25
	mov	1, %r12
	.word 0xa1930000  ! 949: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc544000  ! 950: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xbf500000  ! 952: RDPR_TPC	<illegal instruction>
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a02b  ! 958: WRPR_TT_I	wrpr	%r18, 0x002b, %tt
	.word 0xf11ce11e  ! 959: LDDF_I	ldd	[%r19, 0x011e], %f24
	.word 0xf05ca091  ! 961: LDX_I	ldx	[%r18 + 0x0091], %r24
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 966: RDPR_TNPC	<illegal instruction>
	.word 0xfa1461f8  ! 967: LDUH_I	lduh	[%r17 + 0x01f8], %r29
	.word 0xb7504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xb2458000  ! 969: ADDC_R	addc 	%r22, %r0, %r25
	.word 0xb9540000  ! 978: RDPR_GL	<illegal instruction>
	.word 0xb034e0ae  ! 984: ORN_I	orn 	%r19, 0x00ae, %r24
	mov	0, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8994a19e  ! 997: WRPR_TICK_I	wrpr	%r18, 0x019e, %tick
	.word 0xff1d601c  ! 998: LDDF_I	ldd	[%r21, 0x001c], %f31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbd480000  ! 1: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb5aa0820  ! 2: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 17: FSQRTq	fsqrt	
	setx	0xc64849e10000ae05, %g1, %r10
	.word 0x839a8000  ! 18: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb40c8000  ! 21: AND_R	and 	%r18, %r0, %r26
	.word 0xbb504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xb1a408e0  ! 23: FSUBq	dis not found

	.word 0xb3a00020  ! 27: FMOVs	fmovs	%f0, %f25
	setx	data_start_4, %g1, %r22
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 31: FSQRTs	fsqrt	
	.word 0x9194a0e0  ! 33: WRPR_PIL_I	wrpr	%r18, 0x00e0, %pil
	.word 0xba45e1af  ! 35: ADDC_I	addc 	%r23, 0x01af, %r29
	.word 0xbfa54940  ! 36: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb9aa4820  ! 40: FMOVNE	fmovs	%fcc1, %f0, %f28
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50860  ! 42: FADDq	dis not found

	.word 0xb5a488e0  ! 43: FSUBq	dis not found

	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 47: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa548c0  ! 49: FSUBd	fsubd	%f52, %f0, %f62
	.word 0x839420d5  ! 51: WRPR_TNPC_I	wrpr	%r16, 0x00d5, %tnpc
	.word 0xbda8c820  ! 53: FMOVL	fmovs	%fcc1, %f0, %f30
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50960  ! 58: FMULq	dis not found

	.word 0xb5500000  ! 59: RDPR_TPC	<illegal instruction>
	.word 0xbda00560  ! 64: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x51d523a500001bd5, %g1, %r10
	.word 0x839a8000  ! 72: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1540000  ! 73: RDPR_GL	<illegal instruction>
	.word 0xb5a80c20  ! 74: FMOVRLZ	dis not found

	.word 0x8d95e109  ! 75: WRPR_PSTATE_I	wrpr	%r23, 0x0109, %pstate
	.word 0xbfaa4820  ! 76: FMOVNE	fmovs	%fcc1, %f0, %f31
	setx	data_start_4, %g1, %r20
	.word 0xb7a00520  ! 78: FSQRTs	fsqrt	
	.word 0x8995e1f9  ! 80: WRPR_TICK_I	wrpr	%r23, 0x01f9, %tick
	.word 0xbba408a0  ! 83: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xbcad2177  ! 87: ANDNcc_I	andncc 	%r20, 0x0177, %r30
	.word 0xb7a9c820  ! 91: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x919561f5  ! 99: WRPR_PIL_I	wrpr	%r21, 0x01f5, %pil
	.word 0xb3500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0xb7a5c820  ! 105: FADDs	fadds	%f23, %f0, %f27
	.word 0xb5a588e0  ! 108: FSUBq	dis not found

	.word 0xb3a509e0  ! 109: FDIVq	dis not found

	.word 0xbba509a0  ! 111: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb52c0000  ! 113: SLL_R	sll 	%r16, %r0, %r26
	.word 0x91946125  ! 121: WRPR_PIL_I	wrpr	%r17, 0x0125, %pil
	.word 0x8d95a137  ! 122: WRPR_PSTATE_I	wrpr	%r22, 0x0137, %pstate
	.word 0x91952006  ! 123: WRPR_PIL_I	wrpr	%r20, 0x0006, %pil
	.word 0xbd359000  ! 124: SRLX_R	srlx	%r22, %r0, %r30
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 132: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3a80420  ! 135: FMOVRZ	dis not found

	.word 0xb5abc820  ! 143: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1ab4820  ! 144: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c8c0  ! 147: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xbf2c2001  ! 148: SLL_I	sll 	%r16, 0x0001, %r31
	setx	0x798903560000fecb, %g1, %r10
	.word 0x839a8000  ! 152: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_7, %g1, %r16
	.word 0xb7a508c0  ! 154: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1ab8820  ! 155: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbf2d1000  ! 156: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xb9a40920  ! 157: FMULs	fmuls	%f16, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbaa0820  ! 162: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda50820  ! 165: FADDs	fadds	%f20, %f0, %f30
	.word 0xbfa589c0  ! 167: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbba80c20  ! 168: FMOVRLZ	dis not found

	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bdc000  ! 172: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xbda00040  ! 177: FMOVd	fmovd	%f0, %f30
	.word 0xbfa80420  ! 179: FMOVRZ	dis not found

	.word 0xbfab4820  ! 184: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 188: FMOVs	fmovs	%f0, %f31
	.word 0xbba508a0  ! 190: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb9540000  ! 192: RDPR_GL	<illegal instruction>
	.word 0xb9a408e0  ! 197: FSUBq	dis not found

	.word 0xbda4c940  ! 199: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb1a81c20  ! 200: FMOVRGEZ	dis not found

	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e156  ! 207: ADDCcc_I	addccc 	%r23, 0x0156, %r28
	.word 0xb3480000  ! 208: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x21edea9300004b1b, %g1, %r10
	.word 0x839a8000  ! 211: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x9d62f7f400005899, %g1, %r10
	.word 0x839a8000  ! 214: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9480000  ! 216: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 229: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a408c0  ! 230: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb1a80820  ! 239: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb01da046  ! 240: XOR_I	xor 	%r22, 0x0046, %r24
	.word 0xb9510000  ! 241: RDPR_TICK	<illegal instruction>
	.word 0xb435a1c6  ! 242: SUBC_I	orn 	%r22, 0x01c6, %r26
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab50000  ! 246: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xbda5c940  ! 251: FMULd	fmuld	%f54, %f0, %f30
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8a0  ! 258: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xbbab4820  ! 259: FMOVCC	fmovs	%fcc1, %f0, %f29
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 261: RDPR_TL	<illegal instruction>
	.word 0xb1a80c20  ! 265: FMOVRLZ	dis not found

	.word 0x8594208c  ! 266: WRPR_TSTATE_I	wrpr	%r16, 0x008c, %tstate
	.word 0x9194a0de  ! 270: WRPR_PIL_I	wrpr	%r18, 0x00de, %pil
	.word 0xb1a5c9a0  ! 271: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb12d0000  ! 272: SLL_R	sll 	%r20, %r0, %r24
	.word 0xbfa48860  ! 275: FADDq	dis not found

	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 284: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb551c000  ! 287: RDPR_TL	<illegal instruction>
	.word 0xbfa4c820  ! 290: FADDs	fadds	%f19, %f0, %f31
	.word 0x919560f4  ! 294: WRPR_PIL_I	wrpr	%r21, 0x00f4, %pil
	.word 0x8994e1d1  ! 300: WRPR_TICK_I	wrpr	%r19, 0x01d1, %tick
	.word 0xb1500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0xb9ab0820  ! 302: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a54940  ! 308: FMULd	fmuld	%f52, %f0, %f56
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ce001  ! 313: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xbc054000  ! 314: ADD_R	add 	%r21, %r0, %r30
	.word 0xb235a05b  ! 315: SUBC_I	orn 	%r22, 0x005b, %r25
	setx	data_start_2, %g1, %r22
	mov	0, %r12
	.word 0x8f930000  ! 321: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a90820  ! 322: FMOVLEU	fmovs	%fcc1, %f0, %f24
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c920  ! 330: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb7518000  ! 331: RDPR_PSTATE	<illegal instruction>
	.word 0xb3504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xb5a9c820  ! 336: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xba04c000  ! 342: ADD_R	add 	%r19, %r0, %r29
	.word 0xb5540000  ! 346: RDPR_GL	<illegal instruction>
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 350: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a8c820  ! 351: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbba408e0  ! 352: FSUBq	dis not found

	.word 0xbf50c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0xbd540000  ! 359: RDPR_GL	<illegal instruction>
	setx	data_start_6, %g1, %r19
	.word 0xbab4a032  ! 367: ORNcc_I	orncc 	%r18, 0x0032, %r29
	.word 0xbda00040  ! 369: FMOVd	fmovd	%f0, %f30
	.word 0xbfab8820  ! 371: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbf3c4000  ! 372: SRA_R	sra 	%r17, %r0, %r31
	.word 0xbda00020  ! 376: FMOVs	fmovs	%f0, %f30
	.word 0xb3a44960  ! 382: FMULq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 388: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a80820  ! 394: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa4820  ! 395: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a4c840  ! 396: FADDd	faddd	%f50, %f0, %f58
	mov	2, %r12
	.word 0xa1930000  ! 398: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a9c820  ! 399: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80420  ! 401: FMOVRZ	dis not found

	.word 0xb9a40820  ! 402: FADDs	fadds	%f16, %f0, %f28
	.word 0xb3a80820  ! 403: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbf2cf001  ! 404: SLLX_I	sllx	%r19, 0x0001, %r31
	.word 0xbba00040  ! 411: FMOVd	fmovd	%f0, %f60
	.word 0xbda589c0  ! 413: FDIVd	fdivd	%f22, %f0, %f30
	.word 0x8995e0c2  ! 415: WRPR_TICK_I	wrpr	%r23, 0x00c2, %tick
	.word 0xbba5c9a0  ! 418: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb33d6001  ! 420: SRA_I	sra 	%r21, 0x0001, %r25
	.word 0x8995605e  ! 421: WRPR_TICK_I	wrpr	%r21, 0x005e, %tick
	.word 0xb9a408c0  ! 422: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb6054000  ! 423: ADD_R	add 	%r21, %r0, %r27
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c0000  ! 426: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xb9a81c20  ! 429: FMOVRGEZ	dis not found

	.word 0xbba4c840  ! 430: FADDd	faddd	%f50, %f0, %f60
	.word 0xbe15619a  ! 433: OR_I	or 	%r21, 0x019a, %r31
	.word 0xb9a00520  ! 435: FSQRTs	fsqrt	
	.word 0xbf480000  ! 436: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd51c000  ! 440: RDPR_TL	<illegal instruction>
	.word 0xb9a549c0  ! 442: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb3a50860  ! 448: FADDq	dis not found

	.word 0xb5a50960  ! 450: FMULq	dis not found

	.word 0x9195202b  ! 452: WRPR_PIL_I	wrpr	%r20, 0x002b, %pil
	.word 0xb7540000  ! 453: RDPR_GL	<illegal instruction>
	.word 0xb1a9c820  ! 454: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r23
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 458: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbba84820  ! 460: FMOVE	fmovs	%fcc1, %f0, %f29
	setx	0xe5fe3f720000ef44, %g1, %r10
	.word 0x839a8000  ! 461: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba509a0  ! 463: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb09d6164  ! 464: XORcc_I	xorcc 	%r21, 0x0164, %r24
	.word 0x8d95a143  ! 465: WRPR_PSTATE_I	wrpr	%r22, 0x0143, %pstate
	.word 0xb0bdc000  ! 466: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xbba44840  ! 468: FADDd	faddd	%f48, %f0, %f60
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9dc000  ! 470: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xbab4c000  ! 473: ORNcc_R	orncc 	%r19, %r0, %r29
	setx	0x898250ca0000fcc0, %g1, %r10
	.word 0x819a8000  ! 474: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa80c20  ! 476: FMOVRLZ	dis not found

	.word 0xb5a9c820  ! 477: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9abc820  ! 478: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00540  ! 481: FSQRTd	fsqrt	
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839560bf  ! 486: WRPR_TNPC_I	wrpr	%r21, 0x00bf, %tnpc
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c4000  ! 488: SRA_R	sra 	%r17, %r0, %r24
	.word 0xbda80c20  ! 489: FMOVRLZ	dis not found

	.word 0x9194e147  ! 490: WRPR_PIL_I	wrpr	%r19, 0x0147, %pil
	.word 0xb5508000  ! 495: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00520  ! 507: FSQRTs	fsqrt	
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a0e8  ! 510: WRPR_PSTATE_I	wrpr	%r18, 0x00e8, %pstate
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a588e0  ! 515: FSUBq	dis not found

	.word 0xbda00560  ! 516: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1ab0820  ! 522: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa8c820  ! 530: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1540000  ! 531: RDPR_GL	<illegal instruction>
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48820  ! 540: FADDs	fadds	%f18, %f0, %f28
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35a11e  ! 542: ORN_I	orn 	%r22, 0x011e, %r30
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 550: FMOVGU	fmovs	%fcc1, %f0, %f31
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 552: RDPR_TICK	<illegal instruction>
	.word 0x8194a0c6  ! 553: WRPR_TPC_I	wrpr	%r18, 0x00c6, %tpc
	.word 0xb1540000  ! 557: RDPR_GL	<illegal instruction>
	.word 0x8595e0d2  ! 560: WRPR_TSTATE_I	wrpr	%r23, 0x00d2, %tstate
	.word 0xbba88820  ! 563: FMOVLE	fmovs	%fcc1, %f0, %f29
	setx	0x66bb44250000b888, %g1, %r10
	.word 0x839a8000  ! 567: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a80820  ! 568: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635208b  ! 577: SUBC_I	orn 	%r20, 0x008b, %r27
	mov	2, %r12
	.word 0x8f930000  ! 582: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a00040  ! 583: FMOVd	fmovd	%f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 590: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a98820  ! 593: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00520  ! 594: FSQRTs	fsqrt	
	.word 0xbab44000  ! 598: SUBCcc_R	orncc 	%r17, %r0, %r29
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xb1a98820  ! 612: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7510000  ! 613: RDPR_TICK	<illegal instruction>
	.word 0xb7a549a0  ! 618: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xb7a48860  ! 619: FADDq	dis not found

	setx	0x6adf742300009d0c, %g1, %r10
	.word 0x839a8000  ! 620: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a81820  ! 622: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbda84820  ! 623: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a84820  ! 624: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa8820  ! 630: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xba9560fd  ! 634: ORcc_I	orcc 	%r21, 0x00fd, %r29
	.word 0xb7508000  ! 635: RDPR_TSTATE	<illegal instruction>
	.word 0xbb518000  ! 636: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a509a0  ! 640: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb5a80820  ! 642: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	0x912c45830000cb01, %g1, %r10
	.word 0x819a8000  ! 644: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a54860  ! 645: FADDq	dis not found

	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xb8258000  ! 661: SUB_R	sub 	%r22, %r0, %r28
	.word 0xb3a98820  ! 663: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0x89946068  ! 665: WRPR_TICK_I	wrpr	%r17, 0x0068, %tick
	.word 0xbba44940  ! 669: FMULd	fmuld	%f48, %f0, %f60
	setx	data_start_4, %g1, %r19
	.word 0xb2356103  ! 677: ORN_I	orn 	%r21, 0x0103, %r25
	mov	1, %r12
	.word 0xa1930000  ! 680: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb32c0000  ! 681: SLL_R	sll 	%r16, %r0, %r25
	.word 0xb5a40920  ! 683: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb351c000  ! 684: RDPR_TL	<illegal instruction>
	.word 0x919420b1  ! 691: WRPR_PIL_I	wrpr	%r16, 0x00b1, %pil
	.word 0x9194e065  ! 692: WRPR_PIL_I	wrpr	%r19, 0x0065, %pil
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548a0  ! 704: FSUBs	fsubs	%f21, %f0, %f26
	.word 0x879420b5  ! 705: WRPR_TT_I	wrpr	%r16, 0x00b5, %tt
	.word 0xbbaac820  ! 707: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbbab0820  ! 710: FMOVGU	fmovs	%fcc1, %f0, %f29
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 712: RDPR_TNPC	<illegal instruction>
	.word 0xbb641800  ! 714: MOVcc_R	<illegal instruction>
	.word 0xb7aa0820  ! 715: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00520  ! 716: FSQRTs	fsqrt	
	.word 0x8195a171  ! 719: WRPR_TPC_I	wrpr	%r22, 0x0171, %tpc
	.word 0xbda00520  ! 720: FSQRTs	fsqrt	
	.word 0xbd500000  ! 723: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 726: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xec069af900001dc9, %g1, %r10
	.word 0x839a8000  ! 732: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a80c20  ! 733: FMOVRLZ	dis not found

	.word 0xbda54920  ! 735: FMULs	fmuls	%f21, %f0, %f30
	.word 0x899420ff  ! 736: WRPR_TICK_I	wrpr	%r16, 0x00ff, %tick
	.word 0xbba80c20  ! 737: FMOVRLZ	dis not found

	.word 0xb7ab4820  ! 738: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbda50920  ! 740: FMULs	fmuls	%f20, %f0, %f30
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899421ec  ! 748: WRPR_TICK_I	wrpr	%r16, 0x01ec, %tick
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 755: FMOVRLZ	dis not found

	.word 0xbbaa4820  ! 757: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb3508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xbdab4820  ! 762: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c8a0  ! 764: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb3510000  ! 767: RDPR_TICK	<illegal instruction>
	.word 0xbfa489c0  ! 768: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb7a58840  ! 770: FADDd	faddd	%f22, %f0, %f58
	.word 0xb9510000  ! 771: RDPR_TICK	<illegal instruction>
	.word 0x83942053  ! 772: WRPR_TNPC_I	wrpr	%r16, 0x0053, %tnpc
	.word 0x9194a17d  ! 774: WRPR_PIL_I	wrpr	%r18, 0x017d, %pil
	.word 0xb7a488e0  ! 775: FSUBq	dis not found

	.word 0xb77d4400  ! 776: MOVR_R	movre	%r21, %r0, %r27
	mov	2, %r12
	.word 0x8f930000  ! 777: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0xbfa80c20  ! 780: FMOVRLZ	dis not found

	.word 0xb3510000  ! 783: RDPR_TICK	<illegal instruction>
	.word 0xb5abc820  ! 786: FMOVVC	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 803: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbf510000  ! 805: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 808: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 809: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c860  ! 814: FADDq	dis not found

	.word 0xb5ab8820  ! 818: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb32c9000  ! 820: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xbda81820  ! 821: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa4c8e0  ! 822: FSUBq	dis not found

	.word 0xb3a81820  ! 823: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a449c0  ! 825: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xb82ca19b  ! 832: ANDN_I	andn 	%r18, 0x019b, %r28
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 836: FMOVRZ	dis not found

	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7345000  ! 840: SRLX_R	srlx	%r17, %r0, %r27
	mov	2, %r12
	.word 0xa1930000  ! 841: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb62de064  ! 845: ANDN_I	andn 	%r23, 0x0064, %r27
	mov	2, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda4c860  ! 848: FADDq	dis not found

	.word 0x89942129  ! 850: WRPR_TICK_I	wrpr	%r16, 0x0129, %tick
	.word 0xbfa80c20  ! 853: FMOVRLZ	dis not found

	.word 0xb9a81820  ! 855: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb0144000  ! 856: OR_R	or 	%r17, %r0, %r24
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9c0  ! 860: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb1a48940  ! 862: FMULd	fmuld	%f18, %f0, %f24
	.word 0xb5a40860  ! 864: FADDq	dis not found

	.word 0xb350c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xbec4a1d6  ! 867: ADDCcc_I	addccc 	%r18, 0x01d6, %r31
	.word 0xb3a81420  ! 871: FMOVRNZ	dis not found

	.word 0xbd351000  ! 872: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xbfa98820  ! 877: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda00560  ! 878: FSQRTq	fsqrt	
	.word 0xb350c000  ! 879: RDPR_TT	<illegal instruction>
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 883: FSQRTd	fsqrt	
	.word 0xbda54820  ! 887: FADDs	fadds	%f21, %f0, %f30
	.word 0xbfa00520  ! 888: FSQRTs	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 891: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfab8820  ! 892: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbec4e06e  ! 900: ADDCcc_I	addccc 	%r19, 0x006e, %r31
	mov	1, %r12
	.word 0x8f930000  ! 901: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995a1e1  ! 904: WRPR_TICK_I	wrpr	%r22, 0x01e1, %tick
	.word 0xbba80420  ! 905: FMOVRZ	dis not found

	.word 0xbfa00560  ! 907: FSQRTq	fsqrt	
	.word 0xb350c000  ! 908: RDPR_TT	<illegal instruction>
	.word 0xb9a54920  ! 909: FMULs	fmuls	%f21, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3510000  ! 919: RDPR_TICK	<illegal instruction>
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40840  ! 927: FADDd	faddd	%f16, %f0, %f62
	.word 0xb1aa4820  ! 928: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00560  ! 943: FSQRTq	fsqrt	
	.word 0xb1aa0820  ! 944: FMOVA	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 949: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a48860  ! 951: FADDq	dis not found

	.word 0xbd500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xbfab4820  ! 953: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00040  ! 954: FMOVd	fmovd	%f0, %f28
	.word 0xb5a48920  ! 956: FMULs	fmuls	%f18, %f0, %f26
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879560e2  ! 958: WRPR_TT_I	wrpr	%r21, 0x00e2, %tt
	.word 0xb1a588e0  ! 960: FSUBq	dis not found

	.word 0xb7a00540  ! 962: FSQRTd	fsqrt	
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 966: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xb0458000  ! 969: ADDC_R	addc 	%r22, %r0, %r24
	.word 0xb5a80c20  ! 970: FMOVRLZ	dis not found

	.word 0xb3a448a0  ! 971: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb7a81820  ! 974: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbda90820  ! 975: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a88820  ! 977: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbb540000  ! 978: RDPR_GL	<illegal instruction>
	.word 0xb5a508a0  ! 979: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbbab4820  ! 980: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81420  ! 982: FMOVRNZ	dis not found

	.word 0xb035a134  ! 984: ORN_I	orn 	%r22, 0x0134, %r24
	.word 0xb5a00540  ! 990: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 991: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a58860  ! 993: FADDq	dis not found

	.word 0xbdab8820  ! 994: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbba54820  ! 995: FADDs	fadds	%f21, %f0, %f29
	.word 0x8994e13b  ! 997: WRPR_TICK_I	wrpr	%r19, 0x013b, %tick

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

	.xword	0xb99dcef58db02994
	.xword	0x2b5a9b1e7a811551
	.xword	0x4081051feedf2b1b
	.xword	0x7766ea4b8f2bfea2
	.xword	0xe4d0e3fa11c119f7
	.xword	0x79d09460ef274843
	.xword	0xa873738cd82b01d0
	.xword	0xd7f2cfdaadcfd9d8
	.xword	0x9ca2eb2a2ee4c69b
	.xword	0x8d597d0b1fb17f82
	.xword	0x04d056419ec7e048
	.xword	0x8996beac8fb6efa6
	.xword	0xf9398e5a3294e4cd
	.xword	0x77ad6dbeae88209f
	.xword	0xa58cd5903bac9423
	.xword	0x8c597a7e573c0e36
	.xword	0x6c3051eedd68f23a
	.xword	0xda70bc4e3d83465e
	.xword	0x27c2bcf55e08b403
	.xword	0xa494edf98754a4c6
	.xword	0x40439ef91258f9d9
	.xword	0xcd92d459ee1e3f42
	.xword	0x625a25ba2fd0f32b
	.xword	0x734ac5a4d31eec21
	.xword	0x32f1dbdec74f18e8
	.xword	0x2c66b4eb94aac4b2
	.xword	0x73bbf2032bc86fd5
	.xword	0x7972f8483df30e3f
	.xword	0xdbaa414b4dbb5b14
	.xword	0xde1acf31faa726b0
	.xword	0x5fc94e3880ecfb37
	.xword	0xf786d936cf539abe
	.xword	0xb3f8877f4a34efae
	.xword	0x5bef0e453036ac9d
	.xword	0x745ac4ce0138d43c
	.xword	0x1c3429a5d94529bc
	.xword	0x6ba5b212b01d3882
	.xword	0x180bbd794ad309d0
	.xword	0xc37fef83c01945d8
	.xword	0x21903f0531695dd6
	.xword	0xbd64db98d72f2fc1
	.xword	0x10f4e91913e6bb6e
	.xword	0xa038aa513a23d389
	.xword	0x26dcaca100ffa094
	.xword	0xa0c7fe9842fd66c5
	.xword	0x50f613e553e57506
	.xword	0x62cc10db756a8f19
	.xword	0x1eaf879e7448eea8
	.xword	0x46da63844699da33
	.xword	0x10a6a0ee1dcf2fd7
	.xword	0xbafa65f654cfa05b
	.xword	0xd521c2e3ce5b30d8
	.xword	0xe68721b8057ca3a9
	.xword	0x7b2abb8d9a19f5e0
	.xword	0xd214b21bef6e4e33
	.xword	0x7b2571e7f02bf0ff
	.xword	0x0dcc92377d7552c9
	.xword	0x44eb30e7fcc9cb0f
	.xword	0x22941bfcc81437e6
	.xword	0xdc1ae5cab348d770
	.xword	0xb654b093633ac774
	.xword	0xa88258327ff7da8a
	.xword	0x78717309405ec5e3
	.xword	0x837c6df141308242
	.xword	0xffe82594b85eb25a
	.xword	0x7612c6cc96719fd8
	.xword	0xe18263bf48ff4798
	.xword	0x3d34f3bc57574e16
	.xword	0xa950ec74d19aae88
	.xword	0x3aad616854c55e8a
	.xword	0x08dbb9483e318d14
	.xword	0x5c2a7a0eb31d5099
	.xword	0xdce6150a57bedc80
	.xword	0xba8d1889610f0202
	.xword	0x45ca8376e3b8e29b
	.xword	0x7e5c3f0ec1a0b22e
	.xword	0x05b8b69fb37ac6df
	.xword	0x8062a8383f2878ff
	.xword	0x4d5235a14b97874f
	.xword	0xec858f38966eb0fa
	.xword	0xb74265797537b16b
	.xword	0x8f912b7f098b3254
	.xword	0x198686e072238b92
	.xword	0x03b5199c94d75633
	.xword	0x7f916824c5bd27c6
	.xword	0x406e769d60bd039e
	.xword	0x4a957d61456de137
	.xword	0x1336b48b7a92283a
	.xword	0xf6ea294b3fdd9327
	.xword	0x10335e974f4daf24
	.xword	0x8d1edef05f9cec18
	.xword	0x37e01a4903ae1776
	.xword	0xc75c8b6d130dfda1
	.xword	0x0a638287f9f5da06
	.xword	0x80edbd70dc84d832
	.xword	0x9e19b0bd2fa8e81f
	.xword	0x1b751715d9c20b3b
	.xword	0x39d3c477ee6b0c5d
	.xword	0xcc44636d21a448bf
	.xword	0x7ebddb95aafb0ccf
	.xword	0xf066298a0686d723
	.xword	0x8e80e2ede4b3b79d
	.xword	0xde84bc8fec55c491
	.xword	0x81321a8c044e50a8
	.xword	0xecb79207270d79d4
	.xword	0xf6d24c074efff386
	.xword	0x8370bf6efea68836
	.xword	0x0cd758045a5abf0a
	.xword	0xbaa9ff162157c113
	.xword	0xd384624d6b06f065
	.xword	0xd01438f0e408b497
	.xword	0x556731696e09e773
	.xword	0x34e6c3952ee9bd8c
	.xword	0x65f6df77557d6818
	.xword	0xccd0b62c83032f1f
	.xword	0xe96357b36b3fab92
	.xword	0x5be364e10f5b0b4f
	.xword	0x0cfbe50c955411b5
	.xword	0x88b7a4e465c6024f
	.xword	0x5288624d1558b8b9
	.xword	0x0516d2b1800ff2d3
	.xword	0x9f24d32dcdb8d802
	.xword	0xeb7b443c89c8e5d0
	.xword	0x7bcc5ef017a4cf6a
	.xword	0x9615ff5c6ec191cc
	.xword	0x75338bbbcbe02cf0
	.xword	0xa55df5a40fcabd8d
	.xword	0x5613d83698f5edff
	.xword	0x41e6709893a65d11
	.xword	0x2551deefaa86632d
	.xword	0x5a31d0d76cc7c270
	.xword	0x67b2aaf58b888b79
	.xword	0x999c215239449af3
	.xword	0x2613fbd7938cd8db
	.xword	0x093a5ca1b94bd42e
	.xword	0xa6d773ecc5efe6c3
	.xword	0x0594b2a3a96347e6
	.xword	0x81a9fe05d5258e71
	.xword	0x48b16b98714152f7
	.xword	0x18af4baa82e23958
	.xword	0xfaf85193e5caa7d5
	.xword	0xcc268291c25f963f
	.xword	0x58a04aef43f28be5
	.xword	0xdfde19d0118a39a9
	.xword	0x158aaa87383b7926
	.xword	0xa9338b4a9fc9e1ac
	.xword	0x23cf9567f17cd82a
	.xword	0xa87109bf6b877e89
	.xword	0x12d2a898f3b5f896
	.xword	0x64a5f5e8005e838c
	.xword	0x8b9ff781d1fefa4f
	.xword	0xe6bbf6efceb91453
	.xword	0xb8a140083d8f82b5
	.xword	0x528579cccc0398d9
	.xword	0x25efbe663fd45923
	.xword	0x50a38cde0477843f
	.xword	0x93859fc6abe6980c
	.xword	0x0c09713dc6bdc55e
	.xword	0x37e0641acbdcbd41
	.xword	0xc3889ec5688042c9
	.xword	0x31e4e91dfe7756f7
	.xword	0xbbb511a658f01fb1
	.xword	0x163d11386be22794
	.xword	0x82fe2331d9085f9e
	.xword	0x1a3daf6c4e84e87f
	.xword	0xff1037bc6b73db6b
	.xword	0xf67fbde91cc50b56
	.xword	0x5568e4613c616096
	.xword	0x833753f909569d74
	.xword	0x7920d63218e628d8
	.xword	0x06de712860139bc0
	.xword	0xc00d4e2032cd79d3
	.xword	0x4d71dbfe5e5a6439
	.xword	0x5828d54da16d1d24
	.xword	0x2031468589b413b3
	.xword	0x77348e32ae44ea35
	.xword	0x262acea9dc317874
	.xword	0x8674afde6d938b92
	.xword	0xcd55a83dd21e0607
	.xword	0xe57d727759e11ba6
	.xword	0x4cc7269159440563
	.xword	0x82fd671ecaf319ee
	.xword	0xf692d7fcd9f78175
	.xword	0xece058ff4ff142d0
	.xword	0x7fa4434c25117510
	.xword	0x327fa65b204f5352
	.xword	0xead8ff5e61a74494
	.xword	0xa3f782e0de715a45
	.xword	0x2b000a62126c082f
	.xword	0xff8830d80032a5c0
	.xword	0x08488091b88f6bf0
	.xword	0x4f86d4919f43577b
	.xword	0x75c65ebb443bff55
	.xword	0x5c751d3bb6b8dd98
	.xword	0x1f4d774e2d4bbdd6
	.xword	0x7c7edfc7b68a33b0
	.xword	0xf8f59906060df42f
	.xword	0x74658c8c73b9ece7
	.xword	0x49c5af40bc6a1acc
	.xword	0xb7164271e2639371
	.xword	0xc0028acdaf771641
	.xword	0xefa20675561bc409
	.xword	0x4f4ee738c814a3b9
	.xword	0x995555e1a7da76c0
	.xword	0x40798dc85cda1815
	.xword	0x627fa8295fd9ddbe
	.xword	0xe628ed8fe4fe7f44
	.xword	0x96971d3c5f41e610
	.xword	0xe3d582856c90e08a
	.xword	0x47c76340e8df7a26
	.xword	0x4061ead43871a830
	.xword	0x3fcfd2b9e32eac37
	.xword	0x3a6551b1530cf965
	.xword	0xc5a72b6e917d935d
	.xword	0xe45f0577528c05b9
	.xword	0x8324cc23f51d9fc9
	.xword	0x5237895c82000d36
	.xword	0xdfaf41cd852d869f
	.xword	0x6fa8d86481339316
	.xword	0x671e4319ff00941d
	.xword	0xaa7447e79bd16584
	.xword	0x89adc9c82a106c4f
	.xword	0x9dfc3a2aeb106dde
	.xword	0xb83d4ff26aef3b9e
	.xword	0x33b18cd233988c34
	.xword	0x3408d1f69901f970
	.xword	0x5415fc40796cac62
	.xword	0xbd590026c83021f6
	.xword	0x015e58ec14d1b451
	.xword	0xb143bd48ed5bf95c
	.xword	0x929abcb4b7d1500c
	.xword	0xa0b33f7f0c2fb3db
	.xword	0xf633a6df7d300848
	.xword	0x182846876ce5ba17
	.xword	0xd178d1ea9779e22c
	.xword	0xe2bf1e9e62235b49
	.xword	0xd8f8d0da243fbc91
	.xword	0xe7c8bf69b3bf558e
	.xword	0x1c19395872e48486
	.xword	0xb6e5ad90e22fcb67
	.xword	0x2be60394b495385d
	.xword	0xd04c34a388b131ef
	.xword	0xd8be28c243316a05
	.xword	0x45de58f5f8ac87dc
	.xword	0xe8ffd76ed6cb84b4
	.xword	0x0d88624e66cee160
	.xword	0xe0dd1a7111afc87a
	.xword	0x05e97fcb1f02e952
	.xword	0xc0173c65c85448ff
	.xword	0xa341f9fcea60bf14
	.xword	0x31db76e3c25dd5d7
	.xword	0x06a97f1c00b63f1d
	.xword	0xaeb2cf38c76b6cc3
	.xword	0xa1dac58f1a0f8f31
	.xword	0xb9377218b75a2eda
	.xword	0x1edb54c8b8e8c86b
	.align 0x2000
	.data
data_start_1:

	.xword	0x6a69441076083151
	.xword	0x998c371db068c867
	.xword	0x1367d978cde1d0ee
	.xword	0x778dc1b0cba8cdcb
	.xword	0xbaddb9ee0ae6de98
	.xword	0xd0918d66f3b2efae
	.xword	0x156ba63e636b9316
	.xword	0xf306db1d0db9b87b
	.xword	0xb5c877023b0b1505
	.xword	0x033a166d4ccf5a89
	.xword	0xcd638ddb09623485
	.xword	0x3064001776979899
	.xword	0x5cbb82b75b918174
	.xword	0x9a6ab3ae7caeeeab
	.xword	0x3ae9ccce4c31c9b6
	.xword	0x4a36d35fbe21b278
	.xword	0x906d6066a96a4dae
	.xword	0x8ddc7a32d414c39c
	.xword	0x87ae6cc55acf3841
	.xword	0x4eb9229321a2d052
	.xword	0x097a8bddd7697697
	.xword	0x8ca5d249116dadf0
	.xword	0x038947268b4d5fa2
	.xword	0xd3af4e7818b0f6be
	.xword	0x94befd54e09291af
	.xword	0xfd0ba355588a08cd
	.xword	0x7f490b64d1b900db
	.xword	0x8ab372fa890f1490
	.xword	0xa8588cdd76c094e9
	.xword	0x2943785bba6ad66c
	.xword	0xd7d3cbe015ab92f2
	.xword	0x317bc8b7973c2deb
	.xword	0xd13384d01e6403c3
	.xword	0x246d822a7834186f
	.xword	0x8e426cfc3884ea5b
	.xword	0x4a32eee126a9e95d
	.xword	0x10b8e51594c07623
	.xword	0xb294048ca4f8f620
	.xword	0x8f816fad80d4219c
	.xword	0xab0c6f087784aaa7
	.xword	0xa9bcfbd4ac615341
	.xword	0x7984a0a8ce10ec90
	.xword	0x26f7d07f3940b0cc
	.xword	0x90bcb527e3ef9f03
	.xword	0x28b6644f2e0d06f9
	.xword	0x88f7720281b2e4fd
	.xword	0x4a765c48c3bfafde
	.xword	0x3e2318e68cff0573
	.xword	0x763b99dd957746c1
	.xword	0x9bcd23c0c548952f
	.xword	0x1be561b48d6a3c80
	.xword	0x03be3dc409a4f161
	.xword	0xadf078cdae7fa77f
	.xword	0x2a9fda8b1975ef73
	.xword	0x827a29d1d9e70773
	.xword	0x85766cdebd9bc930
	.xword	0x008165d320e9b66f
	.xword	0x57d6be0ce81ace6d
	.xword	0x04470512aed4c114
	.xword	0x5b501ed9d9abc08a
	.xword	0xb18601b66eb5c6b7
	.xword	0xf688b802f03e1d9e
	.xword	0x0948723c1d52effb
	.xword	0x9ebe0f0c89cde2d0
	.xword	0xb172df47795acc0d
	.xword	0x291a988861e6404b
	.xword	0x04032ce7b04d0d78
	.xword	0xf805e6eb81c0996d
	.xword	0x573e5ad648d652e8
	.xword	0x7ed46d7556620ab9
	.xword	0xe241033ff4c204c4
	.xword	0x4ccd88034a4f4f34
	.xword	0x825bf2d8f8fa6014
	.xword	0x7f50189ea8f3a42f
	.xword	0x542d8d624891d3cf
	.xword	0xf09fbc8096899aa1
	.xword	0x9f555070daff2040
	.xword	0xabe3a033465629ae
	.xword	0xf77cf9ab9598beca
	.xword	0x99aae2e680184640
	.xword	0xe40763f92bc0b1de
	.xword	0xb1ef9c17ae1cb9c3
	.xword	0x31714c71a86ce78a
	.xword	0xad869fd8f62db942
	.xword	0x98685236aaae6e37
	.xword	0x54cc72c6330c90f7
	.xword	0x55cfe5ac612d4ef0
	.xword	0x7a512c2b74e4ecf5
	.xword	0x409c1e846d54a448
	.xword	0x33a92a729001eb72
	.xword	0x65c5cb49fc6bc038
	.xword	0x58086c54d7aa2dd3
	.xword	0xf1250dc64f084968
	.xword	0x7310f03d23f527d5
	.xword	0xfe5c6b8fb9f43787
	.xword	0x76caf20290e1a013
	.xword	0xf0b9e6340ab51e5b
	.xword	0x51eca2ecf3a5ff1b
	.xword	0x2d6c9d3ff22eebc6
	.xword	0x75bf2498650f4ad4
	.xword	0x534bb7f17a4509e0
	.xword	0x204c50bd12e8fcba
	.xword	0x475e8fb7a025a5ea
	.xword	0xd50c15d15d054125
	.xword	0x8c9d24ab4c35bf66
	.xword	0x29f0103c29ed6d1b
	.xword	0xaae4895f4d4b5c9a
	.xword	0x7e84d14126a8c118
	.xword	0xdfbb1434ebb3374b
	.xword	0x31210c4f216363de
	.xword	0x4d4fb86c4bf9153a
	.xword	0x418c9480c6cb213d
	.xword	0x1d8fee4dbff24af7
	.xword	0x462715581f1c289e
	.xword	0x7cbda56ca399350f
	.xword	0x4e65eede30846976
	.xword	0x3cb82ecde713cfb1
	.xword	0xac7209dad0efd091
	.xword	0x2ad686849a7b4fbc
	.xword	0xa6a3400441c7012c
	.xword	0xfd0a697081861e92
	.xword	0x6028aa828a566703
	.xword	0x494bf8b4ff93b9e5
	.xword	0x3e9f7a0360eb8477
	.xword	0xea109c2493cb9bc4
	.xword	0x271530daaf251923
	.xword	0x3f3ecdde56095a9e
	.xword	0x7d0dff5fe16bd4a7
	.xword	0x3079c156e8c67ba1
	.xword	0x007ceafc1e9fe298
	.xword	0xea7ad66539d3635a
	.xword	0xbec9e0d2e151531a
	.xword	0x2be8e2bf51ee5d78
	.xword	0x7340684935213eb9
	.xword	0xa9361c6d8c67dce0
	.xword	0xd6671607545eba38
	.xword	0x12e30b3b3e0869c1
	.xword	0xa2bb8bf5b3406b1a
	.xword	0x38e4f924ebebcbe0
	.xword	0x1dff9e574cfd1a72
	.xword	0xa40c27efadee6469
	.xword	0x377553fd20eae218
	.xword	0x076e65ccf575ee9b
	.xword	0x95a5d9800043f793
	.xword	0x6d6d7bf3a99bb987
	.xword	0x3155a6996d984e4b
	.xword	0xff67ef79e1e40c87
	.xword	0x52ee021c5b122e1f
	.xword	0x86adf7cb0b26c56a
	.xword	0xc502201d0e1aec0a
	.xword	0x1a7f9089059325b2
	.xword	0xd1739fa8e8c51b16
	.xword	0x0e5512a0723c15f2
	.xword	0xce6cedb9ac39d8d7
	.xword	0x688000ba8786da22
	.xword	0xbc90dbcbacfe3545
	.xword	0xf7ea76e22ed8776e
	.xword	0x6b6b455fccc20d52
	.xword	0xe2ecf625a80cc72d
	.xword	0x53115d5868c7efcd
	.xword	0x0676af495a2180cb
	.xword	0x32afa31b2036ba26
	.xword	0x0a78255bc11bc358
	.xword	0x6eb25bb745a21561
	.xword	0x0c63da93486ea7a5
	.xword	0xe9318b7ff60de157
	.xword	0x08a57fa76093d0d1
	.xword	0xcc76b87cd0e54f2e
	.xword	0x2c86b0f4f900e571
	.xword	0xd4689fdcb237cdfc
	.xword	0x78f0a96b7218a99c
	.xword	0xb80add85ab0605ec
	.xword	0x87b2120e387dc606
	.xword	0xd66fce7135ac6ced
	.xword	0x5cd27f2e30d43758
	.xword	0x074aabc2f43f2936
	.xword	0xff7ccb8e8315d520
	.xword	0x90f26a0edcce236a
	.xword	0x1c14159ae84c00ad
	.xword	0x19f8ecc1d9b2cd3e
	.xword	0xbfdc38f12235a92a
	.xword	0x4f040e1641f8bafb
	.xword	0x84a0f776c9f86aae
	.xword	0xa873e1a96ec0e899
	.xword	0x9af08c8e2baed21a
	.xword	0xfb6796b36ecef691
	.xword	0xaeb73c0d4a539636
	.xword	0x3d4d0936ffadb6ec
	.xword	0x1dcc700fb3ba7fc2
	.xword	0x86cedc93d5bc9c92
	.xword	0x0f94422298c9bbc7
	.xword	0x93df46a09c7697f1
	.xword	0x0f2c44b05d757566
	.xword	0xdbb3070e20ce4aeb
	.xword	0xef4b38b9ab6d2b05
	.xword	0xfa948c3f08f3675a
	.xword	0x5620531753107f09
	.xword	0x85abd7c227897e7c
	.xword	0x96304b6cace54c9c
	.xword	0x259672608d004de0
	.xword	0x1c6c3a945cee2055
	.xword	0xbb27d4d248d8bef4
	.xword	0xd7e9be64159d01ff
	.xword	0xdcb97b3534f29090
	.xword	0xe9eb42fed1210f09
	.xword	0x1a76f35045262de1
	.xword	0xba94127208566b0e
	.xword	0xda06c269a60b4876
	.xword	0xcb3d9ac1a0cde3cd
	.xword	0x77c30f4afe1c2051
	.xword	0xb3d64788a16a3655
	.xword	0xeea0833e375d15cf
	.xword	0x16ef022d3f23bd67
	.xword	0xc2b33d1601f09aa9
	.xword	0x9cab2f23e2f51474
	.xword	0x365062add9259bea
	.xword	0x6793c6933ac9d00d
	.xword	0xa53248cb4178dcfa
	.xword	0x3d61354810cfb9b3
	.xword	0xec1964314ce8d0ab
	.xword	0x0ce191ccb852f79b
	.xword	0x9f91e6287730cb16
	.xword	0x054958a589ee9d74
	.xword	0xb2c71bae3d3e0e3c
	.xword	0x5da9181b40e46755
	.xword	0xc7213bf5cd4bd726
	.xword	0xeb522a42a306ccdc
	.xword	0x7cd738a0e734ccc7
	.xword	0x58c14459253f115a
	.xword	0xbc8dd22c08be64c9
	.xword	0x04395b88ea18021f
	.xword	0x7b50c596cbe77785
	.xword	0x507d43e6d8fd1d16
	.xword	0xab21008a2212b46a
	.xword	0x3291f78de72d7769
	.xword	0xffcab56409052f84
	.xword	0x86177169eddf1417
	.xword	0xab1ef9895ffaa6bf
	.xword	0xdd15dd60093f499a
	.xword	0x7c5e5c3e2086a3e5
	.xword	0x60000feb42b41209
	.xword	0x7dc21924fd1b5768
	.xword	0x8d7c5a0f8d07e018
	.xword	0x36b780eef130cf14
	.xword	0x36ac17c2d9b8dbef
	.xword	0x0767253a323a16a7
	.xword	0x1b29bff182b44312
	.xword	0xadefa5be2080ee9d
	.xword	0x7680f45096b40860
	.xword	0x44548e989c7da9d8
	.xword	0xaf8937c9259c8d48
	.xword	0x6df781a12becdc37
	.xword	0x4174d6d64098cdd0
	.xword	0x690587da2a9575d4
	.xword	0x1ca967bffebc5e09
	.xword	0x6d8a0d2a05b21179
	.align 0x4000
	.data
data_start_2:

	.xword	0x518815c04237d70c
	.xword	0xa78cc704f9c6bb90
	.xword	0xc9b4d528ce71aa2f
	.xword	0xa388d0f9f958185f
	.xword	0x49c8178ed26345cf
	.xword	0x293f7792c7c8e0da
	.xword	0x9f5793b6e7efc334
	.xword	0x337a6d47ab9e4d65
	.xword	0x53bec8ba30b80f74
	.xword	0xcba0c85cf4a8239c
	.xword	0xea8f55e8f9f4d024
	.xword	0xdaed7e5f0af53930
	.xword	0x35f7be72d6c72a03
	.xword	0x1bb8ffdc9bc36140
	.xword	0x7a56133c20be08c9
	.xword	0xd65bf2399de850e4
	.xword	0x4f3c671d61338895
	.xword	0x9c249b33d3d60b92
	.xword	0x45e3da8421cb11cd
	.xword	0xe96c8699938c0db2
	.xword	0x1b3a0688a3eef443
	.xword	0xb952df1e4ef78022
	.xword	0xde9865949e9962e9
	.xword	0x577b8a11e9ab29bd
	.xword	0xe55fda58930e7a4d
	.xword	0x063bc911b09fc974
	.xword	0xa7373a5802ab03cb
	.xword	0xa38fe18f0dc0957d
	.xword	0xe2baf16ddb2e9405
	.xword	0x056e2401d3dcbf23
	.xword	0x9c3b1eaa0af99488
	.xword	0x3bc87e67189d073d
	.xword	0x031bb0edcc519f7b
	.xword	0x364e35127280fb2c
	.xword	0x6230694fd8d706d4
	.xword	0x2e319583a694099b
	.xword	0x781dbbe8d2b274b4
	.xword	0x3609b1f8aea14e49
	.xword	0x5effe8ae0816c09a
	.xword	0x828c5746db99be5f
	.xword	0x59f757a21db6ae6c
	.xword	0x975121625f356fb9
	.xword	0x324913569dc8daef
	.xword	0x827f780b5d38a399
	.xword	0x79960a291a108633
	.xword	0xcceca891ca234083
	.xword	0xf7e9eb9c2c737807
	.xword	0x01a4c6eb8e58a846
	.xword	0xd7afcb6dbbe0a583
	.xword	0x803d2efc061ef299
	.xword	0x1bbb4e0199d9c70f
	.xword	0xb445ca362963c825
	.xword	0x087e74c0c3dadf70
	.xword	0xd8e5ba24c20e707b
	.xword	0x91c6a2ba3481f0c5
	.xword	0xa88e5aef6e79c25b
	.xword	0xff2d8e3f31cf0b8a
	.xword	0xd095a6e3f2d4beab
	.xword	0x344643b37828d678
	.xword	0x51d4bc4a2def6cba
	.xword	0xce4e6fa7729b12a9
	.xword	0xf0a51aef3c63ed38
	.xword	0xcf3a1d76a4cbe979
	.xword	0x942bd6f4e6a96b7c
	.xword	0xfe60804f5836ba7e
	.xword	0x28dbaddb5e680a61
	.xword	0x1e25124bdd2f883e
	.xword	0xdac5b38c9833a3d5
	.xword	0x363bf4f50db0ff8b
	.xword	0x0c6f6e22260550bb
	.xword	0x2ea0715050c4815b
	.xword	0xab0269a1a5932949
	.xword	0xc7957edfcb90385f
	.xword	0xd62f00b38dae7324
	.xword	0x1826bb4460e9dd95
	.xword	0xc9e4fd6ee3940c46
	.xword	0x2bd94804340bafe7
	.xword	0x6abc165e0e35b366
	.xword	0x9f2b8c0d3562d060
	.xword	0x732904a6bc3dd3a6
	.xword	0xa27c2afc51d4176e
	.xword	0x3673fa33218162f9
	.xword	0x12a429fa8355bed2
	.xword	0x33dd06016699b2a6
	.xword	0xdf54b384af76e1cd
	.xword	0x8b1b10f51c41e435
	.xword	0x89e7f4771255f9a3
	.xword	0xc32455efe72acbf0
	.xword	0x641fe3fc621785e4
	.xword	0x7d8398732b4124e0
	.xword	0xea1d483a41756346
	.xword	0xc218ade97fd7e86f
	.xword	0x7e7046e7e33e9b29
	.xword	0xeeb22edb0b585630
	.xword	0xaa83f5e659f1072f
	.xword	0x2e24515bbf5e194c
	.xword	0x430ebc4ad09019bc
	.xword	0x0b9752e8fbfe9ea3
	.xword	0x71457e46383b6779
	.xword	0xdaf83d355b6749b4
	.xword	0x096e01b06e46169d
	.xword	0xc65c2b4d5985612a
	.xword	0x2760f3f2d7cf43e1
	.xword	0x226524166267a0fa
	.xword	0xd53b2774115b2e74
	.xword	0x981377cbf7f39d5c
	.xword	0xf97e2eb07526251e
	.xword	0x67897e948b093635
	.xword	0x3d2259f6fd00efa0
	.xword	0x8d4bed2406681d34
	.xword	0x3d84ae43c830a826
	.xword	0xe2fca71f5fef1e7e
	.xword	0xa71b5b9368778e2b
	.xword	0x41a43230ca186d1c
	.xword	0x4764db9fab4a50b5
	.xword	0xa9dda0b05994250d
	.xword	0xecbd35d26b39c543
	.xword	0xf12cfebc7f0bab51
	.xword	0x6ca08c770b707764
	.xword	0xac7ca66a06ce2f73
	.xword	0x929a7d7acfd5692a
	.xword	0xfa6983808fb5d232
	.xword	0x7471704c629ea6f8
	.xword	0x3e11ae6e95b64992
	.xword	0x99d84dcc351451bc
	.xword	0x1c9103d458464e9c
	.xword	0xa9061bfc2996543c
	.xword	0xc759e2633533ecfb
	.xword	0x311265d1b72a2d0c
	.xword	0xdf6f47536aab4495
	.xword	0x04c78fab6845af50
	.xword	0x25549aab80d59267
	.xword	0x56e6ee8d032a2ea2
	.xword	0x85e7f1910ebc68c4
	.xword	0xc2bb2f50355cbbf5
	.xword	0xd607bd6b7d570724
	.xword	0x11310b9f7d696170
	.xword	0xfc823344f071b579
	.xword	0xea83f44b93fd187d
	.xword	0xda84c9e7949204bc
	.xword	0x530a49afa0cf6757
	.xword	0x4ef8a7a82e97fbe7
	.xword	0x79baee938532343e
	.xword	0x116e8d2edb164556
	.xword	0x1bdea306a945565a
	.xword	0x65b58c3ececd4794
	.xword	0xfbd3d88fd29b863f
	.xword	0xad5f44d21d718fb9
	.xword	0xcd9ee07a57cb26f2
	.xword	0xf87626c1d5c34f8d
	.xword	0x4f90dac4399d6957
	.xword	0xe437a73263addbd1
	.xword	0x20001a1b32eae8b6
	.xword	0x9deaf1e5325498a5
	.xword	0xe9644bcb3c94be8f
	.xword	0x8b6a865a7465bee4
	.xword	0xfbfc75124a7d0321
	.xword	0xfec5ac7e911d8b2b
	.xword	0x09a0399318d950d2
	.xword	0xee27512f80dc6a17
	.xword	0x8df45cc91cbd92c8
	.xword	0x9c001f108b9e8070
	.xword	0xd5b802e67cd99b9a
	.xword	0x74a06e63e5ac033e
	.xword	0x2dd52dda900e74d0
	.xword	0x741df6d76e1360b7
	.xword	0x0091b052661f1d50
	.xword	0x62153fc2b32edee1
	.xword	0xe1629875df01e18f
	.xword	0x2ca48f3d5d6a32e0
	.xword	0xe410730b6cde01f9
	.xword	0x1ee2dfb529b994f6
	.xword	0xb3f37417043e8a6e
	.xword	0x612e6f7f5afe2332
	.xword	0x31587ade45f807de
	.xword	0x9ee2fbde112e567e
	.xword	0xb0ef9df7096d7c35
	.xword	0x028f36bcdd257e85
	.xword	0xd58261e9d8faadd4
	.xword	0xe23b81968e294a5d
	.xword	0xfbaf21b6646aa559
	.xword	0xef74406d23e2f4db
	.xword	0x1e84aff6dff74a95
	.xword	0xdbf4776d2851f586
	.xword	0xbd40033ca4362b90
	.xword	0x0ab75977b29023f4
	.xword	0x17dccce704617ddc
	.xword	0x93d8e5e86e158172
	.xword	0xc3d0043c5fa11643
	.xword	0x1182e86f4cab1759
	.xword	0x96fa93f207ceabd4
	.xword	0x1e94c3e3f8d6279b
	.xword	0x28879ea87cfbb9c9
	.xword	0x8d7b8b8127c5dcb0
	.xword	0x8aca6100bfadbd93
	.xword	0x63d74c25b20d237c
	.xword	0x1badc14aed4d9cf3
	.xword	0x9f4634eca13a9380
	.xword	0x8198815b72c079dc
	.xword	0xf68eb296b95614f8
	.xword	0x14c456fdc8bbcea5
	.xword	0xa7c4422dfadd5024
	.xword	0x290adb77c3c098ec
	.xword	0x93b9536080e6b052
	.xword	0xca7fb50f310e6572
	.xword	0x981cf1154433ac0a
	.xword	0x077ec4bddece7003
	.xword	0xe708a0656e4a2fac
	.xword	0x808e304086507e56
	.xword	0x07b849ecc33d0f47
	.xword	0x8a2d0501d4bc0320
	.xword	0x5e815fb5fc11f876
	.xword	0x29931079a7b56bf3
	.xword	0xe75a9461bd4f7a36
	.xword	0xcebee5d26c38d052
	.xword	0xb229c5d72b1314b2
	.xword	0x3c197393c3e9dc3b
	.xword	0x1267d4fb647cd729
	.xword	0xbca4c1dc6a604660
	.xword	0x28fd2dbff6ad9be7
	.xword	0x5a23d67053804e48
	.xword	0xe255fcb3f0b36c76
	.xword	0x62c25ff59aa29872
	.xword	0x3a730a9cf0e3b824
	.xword	0xc07ca8820f2dec28
	.xword	0xcd662ae1ea4b2729
	.xword	0x8ccbd68dc3523492
	.xword	0x3dc118231d6f4b5f
	.xword	0xb67de5d065733541
	.xword	0x15ebe39a82895a33
	.xword	0x975001279502c1c6
	.xword	0x9068de84fe7c6413
	.xword	0xd04da5911a84f1e5
	.xword	0x0f1ab782b6d75e46
	.xword	0xd3eec2f6eb5455ce
	.xword	0x3b07673d7b52038e
	.xword	0x668f493f0e0e618f
	.xword	0x34fefb7c8bae6797
	.xword	0xd5451b4130a72efd
	.xword	0x01f644c0b80b9348
	.xword	0x42eecd1cf6eaa438
	.xword	0xc016de4352034243
	.xword	0x1ffc057bb45d3ca1
	.xword	0x83c3766c5a2d5993
	.xword	0x4ef7a1a0ff37f8c5
	.xword	0x7b029a75f1639f8d
	.xword	0xf30aaa4270dca889
	.xword	0x2e470bbf41efad88
	.xword	0xc6e3dea92f3b65f7
	.xword	0xea09e83eb10a7f25
	.xword	0xd79f31f6c05b9a9c
	.xword	0x104e90ae02bfc219
	.xword	0x935741729c890d59
	.xword	0xf756f361a4f3b3e5
	.xword	0x708bafd64a3e67e2
	.xword	0x09358696116e5d96
	.align 0x8000
	.data
data_start_3:

	.xword	0x19c8ce7cff297b9d
	.xword	0x826a558177256c00
	.xword	0x7a874b13542cf88b
	.xword	0xece54ef4cb420296
	.xword	0x9a57c6081f0d1b9c
	.xword	0x65500d078ea0ef9c
	.xword	0x5f6e627b834d7f9e
	.xword	0x2ad1d79478b957f8
	.xword	0xd7b3bb78bd31e04c
	.xword	0x6d939b4481e11f43
	.xword	0x8a1632052a87c8f1
	.xword	0x05947b1ed0e509b7
	.xword	0x283440f6835b7c65
	.xword	0x8a6ba80e6c0a411b
	.xword	0xabfe02ded490ea1d
	.xword	0x6d88bf254aaf312b
	.xword	0x656ece2a3c39f473
	.xword	0x58efd0d5cf716200
	.xword	0x1eee9aa8ba4ed8f7
	.xword	0xfca55504a3243b79
	.xword	0x0cff3c19f0eecd25
	.xword	0x9f8c3906417fa6f9
	.xword	0xa86900f8f7442f1a
	.xword	0x95133ad825c8147d
	.xword	0x61a3250d2960dc10
	.xword	0x313108fb1391012b
	.xword	0xf91b8879201b8302
	.xword	0x46b4c609c6e0969a
	.xword	0x206ce18fd0d424c6
	.xword	0x8f2ae38452a533d6
	.xword	0x331ee9bf739c0e05
	.xword	0x3802f34c1799502d
	.xword	0x08d6a18171786836
	.xword	0x8db3a00895486e00
	.xword	0xcecdc8e21204536e
	.xword	0x485b2d31ef4b5ad2
	.xword	0xc539e3add66daa1b
	.xword	0xc2ee136853a8f66b
	.xword	0x88a055451e89e8da
	.xword	0x5cc2713de166e055
	.xword	0x49c734b7bad39dbc
	.xword	0x3eb3fb84379f2864
	.xword	0xc7b1a05ea7c184a6
	.xword	0x05f0b3c54abb8459
	.xword	0x5826b4a426e7bf42
	.xword	0xba5fd77208f6b87e
	.xword	0x6abcd7a9cd079955
	.xword	0x7f48a45afac498f6
	.xword	0x03c1757ca0d0ebd0
	.xword	0x39c0beb97cf7d646
	.xword	0x8977d623f65d7589
	.xword	0x81e16a5ca3af69aa
	.xword	0xb94841faa7bfd5bd
	.xword	0x0ce985b1b0747727
	.xword	0x8426ad25ab61dcd8
	.xword	0xb575b600959f7834
	.xword	0x1d682742b0efc7d9
	.xword	0xd43c02c976aa124f
	.xword	0x1548b1fd4a5576fc
	.xword	0xeb5479fa6e3b2348
	.xword	0x46a45967c9eb5178
	.xword	0x2bc3d26d034d2a89
	.xword	0x04075d5694a94473
	.xword	0x2d239ac4f8847f29
	.xword	0xc6621dee1c375397
	.xword	0x4c8895a55b09c234
	.xword	0x2891d4415f86ec27
	.xword	0x5a305cbbb31dc02e
	.xword	0x2106bb748dfc5367
	.xword	0xebb0110afc68c361
	.xword	0x5d82f13f3470c9f2
	.xword	0xab6504c8d518d89e
	.xword	0x6d25c455aa71076c
	.xword	0x9d2964df6c94c3ff
	.xword	0xf11a84ceb982bc45
	.xword	0x23146fcd6145279b
	.xword	0x5f77d1c155f0c054
	.xword	0x06b1dff2e452517f
	.xword	0xdd5137caaa931676
	.xword	0xe0b5e67cefd19e55
	.xword	0xda59981e32650a63
	.xword	0xc33f3dc16ea3850f
	.xword	0x4c8f58e2bd1672e6
	.xword	0x759e7141877189a7
	.xword	0xc0392a60ac01bce2
	.xword	0xab81b6faa1b23817
	.xword	0xb6d5a4f212ed3eaa
	.xword	0xb47759a9b5c3ccdf
	.xword	0x001331366326a08d
	.xword	0x350bae1adb5eb713
	.xword	0xde6a86f2cf6bf1a6
	.xword	0x3d3e9da2c068095c
	.xword	0x571a0a193994efa2
	.xword	0x0e3ddc0a1a9374ce
	.xword	0x86ea631ac730bf5a
	.xword	0xe760240312884e0b
	.xword	0x848c7359244c39f2
	.xword	0x52ade754b88a1f56
	.xword	0xa16c7c5e921ace57
	.xword	0xd5556978fae85532
	.xword	0xf28e4d50713be7e4
	.xword	0x4aae26806a559b5e
	.xword	0xdda079d22d29627e
	.xword	0xe02761a3ce49b742
	.xword	0x2a761c9a088ae6e9
	.xword	0x1fc5d38ef5043a18
	.xword	0x7a0503f27eb44536
	.xword	0x112ec6bb402ab64d
	.xword	0x05e54a9596547d66
	.xword	0x89a7adc88cfcadee
	.xword	0xe88b93a1709fe1f4
	.xword	0x410a99f4006aa541
	.xword	0x0a007422d9b02115
	.xword	0x50c4378aa66af93e
	.xword	0x22622c0efe7381da
	.xword	0x2420613ed2123bb8
	.xword	0x378930b58502710b
	.xword	0x5c7914681896872e
	.xword	0x23b943ad121459e4
	.xword	0x5e67f21362b82717
	.xword	0xb4cb9f47f7866377
	.xword	0xb766c658ff0c5712
	.xword	0x32767cc3c361ec28
	.xword	0xcce4231827c96fa9
	.xword	0xcbbaa0d64001e6c2
	.xword	0x496c82443e94e470
	.xword	0x51336bfe476b3876
	.xword	0xcc4c227c88efda55
	.xword	0x4fc3f7570dda1b53
	.xword	0x5be3b83f10305d18
	.xword	0xb8490af380b96a52
	.xword	0xa27391e365d70cbb
	.xword	0xc9159fbbf0d2b176
	.xword	0x9f7c52456c94f720
	.xword	0x3462a5e4b8396292
	.xword	0x1b8c8fcef342c04a
	.xword	0x4043d4033c41372b
	.xword	0x080f68a686ad2026
	.xword	0x60440c340cac409d
	.xword	0xad9579eab97d166b
	.xword	0x05c674f9f8fb79ad
	.xword	0xf51f37f7baeefb0b
	.xword	0x1b4259d6c37628bb
	.xword	0x1e81036a7df3ddbc
	.xword	0x4aab67c42c36a3b7
	.xword	0x33bef6a901a8ffee
	.xword	0xa3f27219485de518
	.xword	0x4015fed2b4eb3a19
	.xword	0x785112777921049f
	.xword	0xbaee75bafc90bf3b
	.xword	0x5310be060fd1f5d3
	.xword	0xe861973e813b3343
	.xword	0xf990dc3b9a6ffc16
	.xword	0xfc3a86af14b82072
	.xword	0x8f8219e772435a8c
	.xword	0x810dfbae8839e832
	.xword	0x0a20f4b1ef42d787
	.xword	0x04db9afdb7f10970
	.xword	0x9da0cc32ccb5476f
	.xword	0xb4a31f120cb11a96
	.xword	0x9d6b357927e33041
	.xword	0x9f01d13b57140dd9
	.xword	0x531bf86515992eb6
	.xword	0x56b16b226e8d2eb9
	.xword	0x8ba7cf27f6a76bd0
	.xword	0xfa706425cf82b4b3
	.xword	0xbda30ad49e02ee48
	.xword	0x418e50f7ff5dae64
	.xword	0x46b7a31691e0b906
	.xword	0x7a52b13871371728
	.xword	0xc00e29539cee9af3
	.xword	0xb0d8f4a4d4aa449b
	.xword	0x75d390343f1c68c8
	.xword	0xbaea655cb4f8f5b7
	.xword	0x74c5cf916f3e30d2
	.xword	0xb69a5eba9a9b3c83
	.xword	0xc53a347f61404d3c
	.xword	0xf5a6d6814123b18b
	.xword	0x73a7c15736a3f1b4
	.xword	0x3c4d73df26e09ef9
	.xword	0x757a8781e2d3251b
	.xword	0x495ce7a2fdfa6402
	.xword	0x9a74a0769a8a175d
	.xword	0x07a0f27f6e16b8f9
	.xword	0x3b3765feab7102f9
	.xword	0xd7bd6968da0264f6
	.xword	0xe5c2aab007436627
	.xword	0x0c70a3086a1c450c
	.xword	0x7996ac42a71d05ec
	.xword	0xb9d88d44d789184f
	.xword	0x9a960a21c6337ec7
	.xword	0x07f3bc2f94ea4eac
	.xword	0xf60010e81ee39cf8
	.xword	0xfe6e17d5cac4030d
	.xword	0x8650be4795436c56
	.xword	0xfb7348215293ef07
	.xword	0x65fc99407d0f0d97
	.xword	0xc1ada1dc987bb474
	.xword	0x2ed3503702286435
	.xword	0x99e9503e87744693
	.xword	0xde0b8d6f6b9edb23
	.xword	0xae127f4dd3d3b432
	.xword	0xc5a698de9ab1f0b5
	.xword	0x1d8fe7a53f749f3e
	.xword	0x15312c3cd50c3c45
	.xword	0xeea8ba6357f624d1
	.xword	0xe8ba10420198fb6f
	.xword	0x5e7daec44104a9e3
	.xword	0x294562a945906e52
	.xword	0xb719f096dac793de
	.xword	0xf915b08fda6f00f3
	.xword	0xdece10c8d8890101
	.xword	0x0e412b5a30f38c24
	.xword	0xf7682ca4ea3f64cf
	.xword	0x57852887af8fc680
	.xword	0x79574e6746130391
	.xword	0xaf1ff805b927c404
	.xword	0xf7c829033e633ce7
	.xword	0xeeca3ac6ce2de5eb
	.xword	0xc16a1b3fae724fe0
	.xword	0xdc62e567f2a4e742
	.xword	0x8d74830a166cffec
	.xword	0xdf6f161a7e96b419
	.xword	0xe1ef765e9503d0ef
	.xword	0xf89a160c14a4d21f
	.xword	0x6008cfc591953339
	.xword	0x6fa86cd2e53af423
	.xword	0x6d616e74cefbf614
	.xword	0x60aa9297d0ee023e
	.xword	0xb0e7e832878a5528
	.xword	0xc1fa638aa7979797
	.xword	0x81b367c6c8d57448
	.xword	0x9380b7340b22620d
	.xword	0x12b72fff7fb59f3d
	.xword	0x8480bf28babf584a
	.xword	0x2fdc503495e408e0
	.xword	0x8229af2e646f2e5e
	.xword	0x01bd0ee4fd7830d0
	.xword	0xc42b2dff23a9886a
	.xword	0x22547df16547970b
	.xword	0xa3a17286e1a3914c
	.xword	0xbabff7348495afa4
	.xword	0x905cecaf7296a87a
	.xword	0x305a80b1ac3f1296
	.xword	0x636fd305fc3829f4
	.xword	0x8f6efe9fc98c768f
	.xword	0xd7912cb92437aaf4
	.xword	0x839a6dc268d08498
	.xword	0xe90155655ea9a331
	.xword	0x26fbc93d79145773
	.xword	0xaa62c11860923ed3
	.xword	0xb7270e1b3ef4db4a
	.xword	0xbcea469c753642eb
	.xword	0x6ed6c69a46908d7c
	.xword	0x2457464568214b4b
	.xword	0x2805d4f0e2c0ccc0
	.align 0x10000
	.data
data_start_4:

	.xword	0xfa65424768b22885
	.xword	0x68afb75584891adf
	.xword	0x609a631355bbd189
	.xword	0x373ae4f14f41fb1e
	.xword	0xecb7ea62212008ab
	.xword	0x36a2218868e742fb
	.xword	0xa852627ed3499de1
	.xword	0x4947c6b7d1973c26
	.xword	0x7cfa9d5695dc7d21
	.xword	0x3b5a802d4c3764f1
	.xword	0x881b987d6dc2d45e
	.xword	0x312c74582453a06c
	.xword	0xb69809d02f245f82
	.xword	0x8eeb173717602f4b
	.xword	0xa39e80c18450fe11
	.xword	0x9a5e13ae5538b706
	.xword	0x52a62a9fc057b21e
	.xword	0xd7828f124c911566
	.xword	0x0efc9383a225cdac
	.xword	0xb2ecb1833e30a95e
	.xword	0xf7b0ec24a747fcaa
	.xword	0x4ac95b75aa9a522e
	.xword	0x37318942ec8634bd
	.xword	0xad5cd8a694e9a27f
	.xword	0xe141cfe03bac5359
	.xword	0xbd5b91046365d2e6
	.xword	0xde24d5e6575838d9
	.xword	0x85abbbe2afad20a6
	.xword	0xbf7dd981acdabf51
	.xword	0x2b21d1a456fde760
	.xword	0x332ca49d6ad17edf
	.xword	0xfed8ccbbce33731c
	.xword	0xd582d23c034da798
	.xword	0x3c7c544d9f87306c
	.xword	0x75ad1625c595fe2b
	.xword	0xa5dc16a3969469cb
	.xword	0xe400835d29ded852
	.xword	0xb5c7ef0b5cda849b
	.xword	0x5e8185dbb96cc9b6
	.xword	0xd777fb8b6d68d3f7
	.xword	0x8df8f2875153c443
	.xword	0x118fa265f0de0110
	.xword	0x2ea74b4e944c79ee
	.xword	0xfd8441a97d980a8a
	.xword	0x27a1af6cacf8c8c5
	.xword	0xe9dc8cc1d483f1a4
	.xword	0x7eee0101106bff57
	.xword	0x581a9a5a73b6cff5
	.xword	0x899d3b5d846f0290
	.xword	0x0e6718d4396c27a0
	.xword	0x335999edee8c630e
	.xword	0x8c16de89c5dc55dd
	.xword	0x337f1e02e434170f
	.xword	0xacd1f4454a7b92eb
	.xword	0xa6f62550ae9cb06c
	.xword	0x2185841d128640c1
	.xword	0x8863e33e707bd252
	.xword	0x68c2411a340f29e0
	.xword	0x718279524f6a3715
	.xword	0x6cbaa7eb011ee1bc
	.xword	0x8ea86046f0548868
	.xword	0x744736306610d620
	.xword	0x26e72a6ebd2e5425
	.xword	0x9c76117aecc95f60
	.xword	0x9a795e864673937b
	.xword	0xfda8363d5c7a7896
	.xword	0x605c46bda12687c4
	.xword	0x8ebeb9e770e77161
	.xword	0xd27f7044bb58c35e
	.xword	0x5fdbfc01ae610214
	.xword	0xcecb6067243e26eb
	.xword	0x3f060b4c25ba08d6
	.xword	0x83a67905036bd9a3
	.xword	0xdf7175fe586d4c44
	.xword	0x0380a6d021bd3c34
	.xword	0x704b01f0a979a59b
	.xword	0x1251ac0c227f85ea
	.xword	0xaba7738f00d660c8
	.xword	0x782865b9112d93b9
	.xword	0x6b637aee97e99de7
	.xword	0xf7abcdcb40ece5d9
	.xword	0x08860b1a96642e7a
	.xword	0x1c62b7a2d170870c
	.xword	0x3e8a2b9804fd3a70
	.xword	0x487e07094c223e0b
	.xword	0x7a54afb5e60e47ef
	.xword	0x883704e92b16aaf6
	.xword	0x0db444ec071f69cc
	.xword	0x4025c5f0b58f9350
	.xword	0x28530e5697f2e255
	.xword	0x9762f007273b8547
	.xword	0x51df414a81e8762c
	.xword	0x7f216cba754f0936
	.xword	0x6a0f73983c70733e
	.xword	0x824b78953548f0db
	.xword	0x5f63cf3bc52b70a7
	.xword	0x7f2c4fd76291f1ee
	.xword	0x985d70db96266131
	.xword	0x8a73d0cf5b942d71
	.xword	0xfa5da24ea83fa6c8
	.xword	0xc058a951ee107431
	.xword	0xa479052eb6b55748
	.xword	0xb166ce567e724954
	.xword	0x5d6ba4d8b830ea7f
	.xword	0x5546083aef82b12a
	.xword	0x96a9f1b49f3d16cb
	.xword	0x567abfbdf92b1134
	.xword	0xa23d3d1e7c3fad18
	.xword	0x15da5c086cf1db99
	.xword	0x322adf0af02a92e5
	.xword	0x647b3341914e94d4
	.xword	0x3cd939b819a9c263
	.xword	0x4c65078d8d9918b0
	.xword	0xa5d97ef68fbc3799
	.xword	0x79301440c7930697
	.xword	0x09c86819e593d699
	.xword	0x2199a5992dd20eda
	.xword	0x71d73884c99e7c11
	.xword	0x6990cdf57d6b6ae4
	.xword	0x4079638a27cb32c8
	.xword	0x3345eea71064f221
	.xword	0xef137333cb00059c
	.xword	0xbc99cdd43f538ba8
	.xword	0x64247ce4dcb9ecb2
	.xword	0xc920c7cac5db6ae3
	.xword	0xdac8731761d9dad7
	.xword	0xf04386e253988ca8
	.xword	0xacadbfca5fd8fe50
	.xword	0xc4b6cbdc1461541a
	.xword	0x75b63eda555da902
	.xword	0xad66925e2c3bae0d
	.xword	0x595ea781d6ee86f4
	.xword	0x8dad3a6b14e0572d
	.xword	0xf583444d7a27a7a9
	.xword	0xacd60b69005c5bd7
	.xword	0x60d3aba0fe6fdc5c
	.xword	0x3eba3bb5f276003a
	.xword	0xf624ba37dd768a04
	.xword	0xbdb50ae5009e6c19
	.xword	0xd31a646a35a8b793
	.xword	0x774895f7c4c90151
	.xword	0x8b6882bd5d823a5a
	.xword	0x36b362e1c3e56191
	.xword	0x893d591660590af6
	.xword	0x6bd2354153f12bb3
	.xword	0xdc4536d742274bb1
	.xword	0x1ff1a9dd3c6261e1
	.xword	0x21fbb4bff190a300
	.xword	0xab85dcb59a6d3484
	.xword	0x21aec37c19b71c46
	.xword	0x33f62dd103d3719b
	.xword	0x1e1fd6b1954dfe4a
	.xword	0x71d8126031c3fd07
	.xword	0x2c840fd75bfb8926
	.xword	0x71bd465c7d068dcb
	.xword	0xd869574061ee4c71
	.xword	0x64d33c884e99306e
	.xword	0x0049ecd3e245d226
	.xword	0x7478c04d3a3cb3b5
	.xword	0xd513feab45b5185d
	.xword	0x558d16c9c76e61c0
	.xword	0x4b67d6d31400155a
	.xword	0xe17a827cfc6c153c
	.xword	0x4191b18566a561d6
	.xword	0x79d9d62d45cccc2b
	.xword	0x7a7dd33081c4d674
	.xword	0x22ec1eedffcd3ded
	.xword	0x361a18833c8d5988
	.xword	0x0331adbd0efbe318
	.xword	0x30655cad8d62b7c7
	.xword	0xca490c18bbbd60f8
	.xword	0x6f76c6c1766988eb
	.xword	0x06ce4fe843f67fe0
	.xword	0x87af06c28f6a8a4b
	.xword	0xe71a8a0c5afaa1bf
	.xword	0xfe24c447b886b015
	.xword	0x71a9e517c63f086a
	.xword	0x3cdff7f2f9c668ce
	.xword	0x8a2ea7e58d828fc1
	.xword	0x76492c3f07119335
	.xword	0x959fccb81dfc6fa0
	.xword	0x9bcb49ef8f44b38e
	.xword	0xc2252614c60c11c2
	.xword	0xd249673427bf6571
	.xword	0xe87745ea26613542
	.xword	0x1681b72e749ebb4d
	.xword	0xf335463d360b49c6
	.xword	0xe2f10ae8927785ad
	.xword	0x572d0f247696894f
	.xword	0xf3ae2009bd60e4e6
	.xword	0x151fa09046116390
	.xword	0xb968a314a0556d6c
	.xword	0x031bf2b2826cb64e
	.xword	0x09a287a339c1f580
	.xword	0x1a144fcd18782b4c
	.xword	0x7c54b842a5175ed0
	.xword	0x4f7117401f5dcf8d
	.xword	0xf181a27f910647c7
	.xword	0xe25081db469a1664
	.xword	0xad64be443f10f2ba
	.xword	0x1591df80185481a1
	.xword	0x08165dc080669989
	.xword	0x3adf0403c7fee4bc
	.xword	0xa6551a9f704fde93
	.xword	0x2cc7424eecc001fe
	.xword	0xf322771dfb8f1efe
	.xword	0x262f05aa2b444054
	.xword	0x5f029af5007516c4
	.xword	0xf4c4b1e76be5e6fa
	.xword	0x6732a9fcbd1a4895
	.xword	0x85e1ac370f036675
	.xword	0x62e0e5b6e5efdd86
	.xword	0x8c4d017fdc6535e7
	.xword	0x1b28ee15597ec320
	.xword	0xc3bacd2c6ab3368d
	.xword	0x703227de25985595
	.xword	0xe6014da1d7bdb084
	.xword	0x7fbd55b4e9a04a2a
	.xword	0x7f0ff907f36d13f1
	.xword	0x625b5a3f3e509350
	.xword	0x0ef179b61dd406c9
	.xword	0xcce8872be45d030a
	.xword	0x5f242bec99595148
	.xword	0x67dd67d02397fc41
	.xword	0x557f66a442e90ad9
	.xword	0x69f6952debeba7c0
	.xword	0xf2e9380502640cfd
	.xword	0xa1195531dab16ede
	.xword	0xdfe2058bdc4f77e3
	.xword	0x11da3ceb1408697d
	.xword	0xd09562baf5c26124
	.xword	0xb8bcc728a57843d6
	.xword	0x279ca0c81b25552e
	.xword	0x79a0238c74aea03f
	.xword	0x9ae909f750010bc8
	.xword	0x25cc46725880d3ec
	.xword	0xa1c2ce2e1ad3670f
	.xword	0x60d1c798d489af67
	.xword	0xa1985e84638d5d2d
	.xword	0x91215146f98aad91
	.xword	0x82d5ea223a7ca4a3
	.xword	0x5c604929632bb5db
	.xword	0xb1ae2a8a7ce89aad
	.xword	0x50e2e6e67ecf8422
	.xword	0x6418ee646547c3d9
	.xword	0xe16b10dad13ab662
	.xword	0x3b92bff8f8c919f8
	.xword	0x299bcc936bde08dc
	.xword	0xc820dd835ac6a1e8
	.xword	0xe556da57b00bc3e7
	.xword	0x45fcf285c297765b
	.xword	0x07aff71d33c36396
	.xword	0xc52ee31388d1c015
	.xword	0x2387829f780abdb7
	.xword	0x6d4ba8cc755b92d9
	.xword	0xecd8b14c98aa73b6
	.align 0x20000
	.data
data_start_5:

	.xword	0x82e26934ab39aaa0
	.xword	0xef0b1843f312f8be
	.xword	0xa3ca063b690fc494
	.xword	0x040f9460f55eea1f
	.xword	0x217731540f392d78
	.xword	0x59be31c94732e4b1
	.xword	0x4cf4d4df2d1742d4
	.xword	0xc8b9ca45c5e93bf7
	.xword	0x41c3790f2b7c9155
	.xword	0x9206b3780cfeead3
	.xword	0x649dad3f8cb7ad03
	.xword	0x596904aaf2795830
	.xword	0x98a4bc7d02a3de6e
	.xword	0xde1cc5acf41b1a0c
	.xword	0xe2367b7785132064
	.xword	0x499af9546b1a6c1e
	.xword	0x798c415fa2f5f266
	.xword	0xad3a051176b5cafd
	.xword	0x6742d6acf6f2a50a
	.xword	0x7121581e740c053b
	.xword	0x037526cf7bcc91b4
	.xword	0x51f63ef8a8119d77
	.xword	0xdb1db25dc1217d4e
	.xword	0x69c7367e6a4d4247
	.xword	0xf8da19464fc9f2b8
	.xword	0xaf61ffd9d475e69a
	.xword	0xb4cfc28ed1c1e9ad
	.xword	0xfca58a31f3d8fd7f
	.xword	0x263fae837a09fc2c
	.xword	0xac19f5e7970ec4a4
	.xword	0x44e85a7eee1f6d2f
	.xword	0xd51e83b449d596dc
	.xword	0xa4e30b1e269bc5aa
	.xword	0xa7fb113d31e2d097
	.xword	0x9d3b7f1afab00909
	.xword	0xdd1ac009229cf29d
	.xword	0x4a80175a6e465914
	.xword	0x279c627cbc68e614
	.xword	0xf363ffb0c04f92e7
	.xword	0xc34c6c05f9bf17da
	.xword	0xa63e8dc467a6b160
	.xword	0x932e1cb4fac5f488
	.xword	0xc188a7041caffc14
	.xword	0xa3fd43650bfa28c7
	.xword	0x9df938e96f77a8b3
	.xword	0x93d47969bec15fcf
	.xword	0xacbd2a9bb6712ad0
	.xword	0x9b7f10e2565ff9c5
	.xword	0x76279e0eab697843
	.xword	0x104de2460809db47
	.xword	0x1d1b472ecb0087d1
	.xword	0xe0c552d0745d2637
	.xword	0xe5cc1c0593a7d206
	.xword	0xdf4ce8167aea0781
	.xword	0x5b43a05cc0ae2db2
	.xword	0xccadcd9ee459f1ab
	.xword	0xb93a08995a1619ea
	.xword	0x8dde461ca7e88fac
	.xword	0x1b0ce08c7b2fe6eb
	.xword	0x13bfcef3e4f74b59
	.xword	0xd2eb41186e9c2b9f
	.xword	0x106e2f41e1afde9f
	.xword	0x543bea260e2bbeb6
	.xword	0xa1a5fed8b7de3fec
	.xword	0xff428adb12350018
	.xword	0xf8c2b7f918e086b6
	.xword	0x87f0684fac37bb79
	.xword	0xe10ecf97879cac41
	.xword	0x29a2511caef6fb49
	.xword	0x2e9b233d43449c1c
	.xword	0xad859a35dbfd5d28
	.xword	0xd0051c76e9fe74f5
	.xword	0xb8e02ca624099da3
	.xword	0x6b46c7267fd7f305
	.xword	0xda385bf01092c201
	.xword	0x657c194ba5a18bfa
	.xword	0xab822a0941d0c92e
	.xword	0xdf3d3fbfb63518c6
	.xword	0x4f2952cae1fbcd5f
	.xword	0x5d7587956ed7e3a3
	.xword	0xfd393167455d5913
	.xword	0x306dd13e075b1344
	.xword	0xab1fb47ad138f05f
	.xword	0x6eee5dddbaa5eb35
	.xword	0x970edce72a99fc12
	.xword	0x8ba47ada00d890e4
	.xword	0x0b0ba98e355e62a0
	.xword	0xf928bb58a00549a1
	.xword	0xee3347b6750ef522
	.xword	0xa474ad67e6514ea1
	.xword	0xa80ded2fb6f83b28
	.xword	0xe34f05989af908f7
	.xword	0xa4e73151e767b596
	.xword	0x0138136f04454160
	.xword	0xa133719885794dc7
	.xword	0x66f3946ab13428c3
	.xword	0xe1bc11b31a40e923
	.xword	0x3ea11ab3bc1a074e
	.xword	0xe85c989ef213fdc6
	.xword	0xd9f89c36e75f8105
	.xword	0xf8f36b6d375b4d8d
	.xword	0x6a7c3255a8a89892
	.xword	0x95b2548d3b044573
	.xword	0x20899d8a2438f60a
	.xword	0xc41d9b3bc8d17c6d
	.xword	0xedc7dd79065401c5
	.xword	0x53a3b8daaf02ab70
	.xword	0xed32a2c6493e1ce6
	.xword	0xfb42ffb88aee0da1
	.xword	0xf1f77a8ad320d03f
	.xword	0x99e923c395c5195b
	.xword	0xd986f9faf373273d
	.xword	0x40463a64b66dfb23
	.xword	0xacfdc3e7aa7f7b79
	.xword	0x86ef113dc5b0f306
	.xword	0xe187f0035c118bb7
	.xword	0xabbd58808e8705c9
	.xword	0x6ad888be63cf7d05
	.xword	0x8f3715435135b972
	.xword	0xcf56867e96354c99
	.xword	0x00404abe9cc5251c
	.xword	0x6647a5e1885ae3e0
	.xword	0xf6d28a2e77955058
	.xword	0xe5e495f38a813cd1
	.xword	0x97e0ba3e63c6b320
	.xword	0x5734b1c8eedf7ce8
	.xword	0xb4528e7529183030
	.xword	0xec60fdaf45509be0
	.xword	0x364163a93976e7f6
	.xword	0x2a1c7945b6f2b955
	.xword	0x2d834977a6c58e98
	.xword	0xc6365f3b62a04015
	.xword	0x06b2f6dc6eb9ef97
	.xword	0x9ede5c4f91c405f1
	.xword	0xd527829c08647147
	.xword	0x1625afea36b1a761
	.xword	0x6868d5f1d5440f21
	.xword	0x318bc9ada418fe12
	.xword	0xc467e2cf37a1e4bb
	.xword	0x64c4329d3e897f39
	.xword	0x93e8a4ec21504e8e
	.xword	0x65f4ec9b79548fa4
	.xword	0x3602b7473602732a
	.xword	0xf02746cb080e68e5
	.xword	0x2676a7468edaa676
	.xword	0xbb20d87873c08f72
	.xword	0xe7976299067d902e
	.xword	0xebe4db1fc7e34876
	.xword	0xb505c859dcc6f783
	.xword	0x62d506dd2946fe0c
	.xword	0x070f28139c7603d6
	.xword	0x7f9831ae4134c311
	.xword	0x327bf2d8fb0148d9
	.xword	0xbf846a0397d61625
	.xword	0xa463d5971e79d330
	.xword	0x54b68a6e59d4f3a9
	.xword	0xa50246925a1533cf
	.xword	0xd3321105a0744efa
	.xword	0x6f1991694135879f
	.xword	0xae290ed68f9f2177
	.xword	0x6a2d4dbe82bb51c7
	.xword	0x09d4ff77f4a49185
	.xword	0xc5c896e4a9ded832
	.xword	0x720a5fcf9ef77986
	.xword	0x64d984db1ecba5c0
	.xword	0x063309e724a7fcc5
	.xword	0x02db648e82002a72
	.xword	0x22e6b31c667bb88e
	.xword	0xd2a88a19ed373766
	.xword	0xcecc9a380250ac8a
	.xword	0x34f8b2a4952f212e
	.xword	0x43a12d4d60bd4487
	.xword	0xca1b4ef5564d8448
	.xword	0x4deca7083605d8e9
	.xword	0x7d897a335714f4c1
	.xword	0x06e329229b3d7d90
	.xword	0x69f0ff801f4b1de2
	.xword	0xbee997ae22841ae7
	.xword	0x3484c2a0ccdebd9f
	.xword	0xc8bfaf61c6ab8cf8
	.xword	0x2c913fd06b6436fe
	.xword	0xd9db2072f4da686a
	.xword	0xb48782fb54dc0807
	.xword	0xf6347e2972a38cd8
	.xword	0xe9a45ab09cb11161
	.xword	0x3ecd21e95cfe17ec
	.xword	0x8886728d926e07fb
	.xword	0xeabab6766e86a039
	.xword	0xc5a41e41d720c832
	.xword	0x53e27174b6031560
	.xword	0x29916f9b58c6bc95
	.xword	0x73a8e70b1736b6bc
	.xword	0x86a385b278e3ca19
	.xword	0xd9484ad9d0bc65d2
	.xword	0x7876965cea431fa5
	.xword	0x1f85c6ef7d443fc1
	.xword	0xbbdd8c4b32521ec2
	.xword	0xf50647fcade623a8
	.xword	0x0ee80907ccf21c31
	.xword	0xc0281dd437149d74
	.xword	0x249a62709a79e0b2
	.xword	0x49c57384b35cdf66
	.xword	0xdd9dc3b0408cf7b4
	.xword	0xbf64e1ccf6ae1df5
	.xword	0xd3ef1496085bd193
	.xword	0x890499f0bdbeb796
	.xword	0xfee76eb9ce35718c
	.xword	0xf2d4b8ec9d68e148
	.xword	0xffafb399b3410994
	.xword	0x7dfff9cc6e0dd3ce
	.xword	0xc9592cf5abad8d1f
	.xword	0xa876a827fd0d0bc6
	.xword	0xeadaa22723e5710e
	.xword	0xabf634c2d2dfeb15
	.xword	0x4343392689f6191a
	.xword	0x7cc4845a502eebab
	.xword	0xa567ef42eaaba99b
	.xword	0xe40f963262a9b070
	.xword	0x8bbcaabc03faa1dd
	.xword	0xab6fd09d1bac70fb
	.xword	0x7d3524bb3df1ec39
	.xword	0x469640dd6e215b0a
	.xword	0x015e48e7459c428f
	.xword	0xaf77273a3c4b0d0d
	.xword	0x832a56ee2c0daba1
	.xword	0xa5dda2ca3e24f8ad
	.xword	0x30f2380277740dd9
	.xword	0x63097d66211ce2e9
	.xword	0x7c6a68bae15c99f8
	.xword	0xfcd5dde3c8bd7f73
	.xword	0x90b16a6ea24fcce6
	.xword	0x1b2230a6cd69f60e
	.xword	0x2a5a1690ba2cff1a
	.xword	0x57b8930df2e8d609
	.xword	0xf47c0d1483591290
	.xword	0xc8a0afc630622064
	.xword	0xe556b2302f1808db
	.xword	0x62f27eee4538bde3
	.xword	0x8931345502e038e7
	.xword	0x04eebe9c001f29a7
	.xword	0xb085095a82b80b83
	.xword	0x9d4bfbcd9179fceb
	.xword	0x139ad0bd41595a0b
	.xword	0x6e3af039f7b268ac
	.xword	0xb006151d2b1e9db9
	.xword	0xf886d53b1b8e3e01
	.xword	0x5b78f9ead881f358
	.xword	0x6a2293a02a28c449
	.xword	0x5ab1c1a06440fb61
	.xword	0xd09778c553c12407
	.xword	0x7a6b7d90fcf8979c
	.xword	0xade7ac6ed675e2b5
	.xword	0x4c6713276eb087bc
	.xword	0x7c57887b4206c17b
	.xword	0x52c0d5d2cae2d480
	.xword	0x6f20399e07682cf8
	.align 0x40000
	.data
data_start_6:

	.xword	0xf3471d4c67a8d831
	.xword	0x82ac7f234c5ce620
	.xword	0x67f3297685763c56
	.xword	0xcb8e633029ff7fdb
	.xword	0x449d25a8c1fe0183
	.xword	0xcb5e06583412eaac
	.xword	0xae9cb5ca879d52e6
	.xword	0x5f43f4253146b146
	.xword	0x4ceb4c2a84ca7fec
	.xword	0x27a91aed561a66a6
	.xword	0xf1f0c990c797d5ce
	.xword	0x6bf968ca28157039
	.xword	0x15fa09613cb6fbec
	.xword	0x2218fadff9f8af0a
	.xword	0x8f6c8e16c26afc32
	.xword	0xa2b768d9b9f6f1fb
	.xword	0xf4cc2a096c1ed71c
	.xword	0x808ba6c29072b7b1
	.xword	0x2d60c2a928d23cff
	.xword	0x7328c82d158eabd0
	.xword	0x82d3a24a03d5cd8e
	.xword	0xa8f0f45cf6487e20
	.xword	0xc87e3874494ad62e
	.xword	0xfab14b382e9e46da
	.xword	0xba9938a8dfdcb992
	.xword	0xaee56ae7e1d3e2f2
	.xword	0x14fcb9e0a95611b4
	.xword	0xb995f068bdadf726
	.xword	0x63e2caa33d6d8a50
	.xword	0xaaa126d1b2354b39
	.xword	0x768dcbb2f2fbbe18
	.xword	0xb7fd46e3781b5d58
	.xword	0xf962c4e398975eb8
	.xword	0x9d21b397b5afa65f
	.xword	0x505f8dae483d1e97
	.xword	0x8f95e19270cb63bf
	.xword	0x517c90745c938f2c
	.xword	0xd46328aa25e7b1d3
	.xword	0x5f48966ae76340a2
	.xword	0x08a246c8faf8cf73
	.xword	0xdc4e6d97d1957aaf
	.xword	0xf1c58c14a86b2cf9
	.xword	0x0d39ab5b21f754b7
	.xword	0xf6969b2f059f4c91
	.xword	0x8c3a5ec466d3e771
	.xword	0x60d5accfd0bfaba0
	.xword	0x01b0c618ebda541a
	.xword	0xa6297bc089c8774d
	.xword	0x964c95dfcb322869
	.xword	0x70a0ca435e4a939a
	.xword	0xbeda442cdc2b8b6a
	.xword	0x3589ec1f81105fa2
	.xword	0xbe8e843846fc7baa
	.xword	0x7deb11f3f4c17199
	.xword	0xf18da71a80aa2ad0
	.xword	0xb6fcb86bba4ae198
	.xword	0xc0a86fca5ab05104
	.xword	0x61aae4ed7a78927b
	.xword	0x4a45fc19d809abcf
	.xword	0xa589636644907a99
	.xword	0xaf2e65bb37c7046c
	.xword	0xcf71bb3ed9b14fd5
	.xword	0xd5b345a1202625b9
	.xword	0x091df16a98d4d2f5
	.xword	0xc8879fdc564e8967
	.xword	0x90544389a6832ef7
	.xword	0xb770bae734a4dbba
	.xword	0x118ef6cfeecaefee
	.xword	0xa5660cee91d91139
	.xword	0x3c909bd4e9df0379
	.xword	0x09da4ecccddb8e67
	.xword	0x74a0ff97088fbf87
	.xword	0x3b4ba55fd72e386b
	.xword	0xd3aed8a4b3f8d8c3
	.xword	0x593f8c7b36f13484
	.xword	0x7985ac1fe1c06d64
	.xword	0xe3fbac8f3efd0af1
	.xword	0x37db5e7f02b5e9ec
	.xword	0x9e3a7e2492fd8345
	.xword	0xa4f2905cbcc73da6
	.xword	0x1700d7e8256e471e
	.xword	0x4d5e7974da32b311
	.xword	0x4184475de7f4e14e
	.xword	0xbd84cbe3fefe54da
	.xword	0x64b6c4dddb180bf0
	.xword	0x3c8b3fd77abf734a
	.xword	0x204105c175d5d72f
	.xword	0x6d071e8b58bbe55f
	.xword	0xb7f046bc85573146
	.xword	0x268d68a57e1dfb6c
	.xword	0x48b3e74cfdffbc07
	.xword	0x6525b77c90bc1ef7
	.xword	0xa131842bdbc23663
	.xword	0x7b8db8f42cb7b232
	.xword	0xeeb7e435984d8e54
	.xword	0x10df8dbf76e9f6d2
	.xword	0x7d6efd432d983a93
	.xword	0x40352900dd195778
	.xword	0x701cc3fc6dbdfa68
	.xword	0xe2efd824bf0b8295
	.xword	0xdd5ac7302fa41660
	.xword	0x0617b7c466e92470
	.xword	0x73e83fff861d700f
	.xword	0x2bf8c1e92f5b3983
	.xword	0x114ebd2539552705
	.xword	0x524eef08c91a56af
	.xword	0x93cf5843074cc537
	.xword	0x34a6d405a3a75d27
	.xword	0x4ff2153b2ab01dda
	.xword	0x2bf118d869df058c
	.xword	0xd8b4a440d68ae453
	.xword	0x95bcc44288d3a3f2
	.xword	0x40e25f1033c8db14
	.xword	0xd6fbee12f811ce2d
	.xword	0x31a074d6870c9079
	.xword	0xa972dbaad080df48
	.xword	0xea290f8f57f07923
	.xword	0x5ace83fd5b7a9d5d
	.xword	0xb0f37cb5c318df32
	.xword	0x4f2da80bbf01f827
	.xword	0x6db48da89a8364af
	.xword	0xc2a409549974550a
	.xword	0xa78c0ecd2cdbb12b
	.xword	0xef173ec49826b0bd
	.xword	0x297aa0afe0e5bd00
	.xword	0x42c49449533f9aa8
	.xword	0x5c7de9243f269f66
	.xword	0x970e6151a3a79f53
	.xword	0x33094fd7cf91d834
	.xword	0x879944d084b2640a
	.xword	0x508489c74a3a23dc
	.xword	0x6f4e0ab7eebfb6db
	.xword	0x1ab66704b1f7457b
	.xword	0x04ee468950d8c4d2
	.xword	0x2d3954982accd559
	.xword	0x04949aa1fbd071c4
	.xword	0xcbbacea741b5db3d
	.xword	0xb3912ee71ea010fb
	.xword	0x0afd09afb487bb4a
	.xword	0x355ccf2f09214f3a
	.xword	0x2d2d7cf26df06f51
	.xword	0x19505e7d1c416e26
	.xword	0x1523f40e38822cb2
	.xword	0x4bfb2448e4630b7d
	.xword	0x2cb03d6d68950b85
	.xword	0xa09971f23aa8d46b
	.xword	0xcbc54c8bc1c3af95
	.xword	0xc71896f3542dd563
	.xword	0x29ffeec163eaf36d
	.xword	0x2b2c42fb98bfcc0a
	.xword	0x8a1372cf24d955a9
	.xword	0xd2655a80598e7355
	.xword	0x5b2060feecd2eec1
	.xword	0x4dc9b811306b4905
	.xword	0xe4ba43bb228173e3
	.xword	0xdb11fee5936fbf8f
	.xword	0x371c0ae8943aa240
	.xword	0x8c1d9acabb7dc7d2
	.xword	0xe3625bcb2b20b505
	.xword	0x4b279daee45e8050
	.xword	0x8efa6522cb61a396
	.xword	0x91e0d3c4c43105d1
	.xword	0x321d5e3332d77f25
	.xword	0xdef8162148ba9eba
	.xword	0x9468b5947c30d66a
	.xword	0x161436782b4a9695
	.xword	0x0eb83f123cbec7cb
	.xword	0xdabcfbf73e61c55e
	.xword	0x9a1ac833d428e48d
	.xword	0x41f0955a77f2d326
	.xword	0xe22d5012d3ba6625
	.xword	0xf689eed31679362e
	.xword	0x374eb4e5e116e1f6
	.xword	0x67849a13e620d4a0
	.xword	0xc267d41be629887d
	.xword	0xf33f20b6c0dbfe22
	.xword	0x1a8642d26220e30e
	.xword	0x3eb58369e12f1769
	.xword	0x73c1468aba2cac36
	.xword	0x17d2de068cee6c3b
	.xword	0x850b10c7b574b047
	.xword	0x9a0f04b8ed8cb106
	.xword	0xfbb09736305c4bda
	.xword	0x8071466d83f3d55d
	.xword	0x78776b2f7883da70
	.xword	0xa9503dcb47488167
	.xword	0xd9b1e8f800bb01bd
	.xword	0x8c6c573415aafd2f
	.xword	0xd2f330303262fd53
	.xword	0x42138907a8e24a7b
	.xword	0x3f46d340b520606a
	.xword	0xa2a993f9d7b1e0bb
	.xword	0xba48273f833c63d9
	.xword	0xe2a59c222d62e479
	.xword	0xd36d8d118b448aad
	.xword	0x8c2ca60cb4ab3090
	.xword	0xd8a3e504f5b862ab
	.xword	0x78289c0fe87c9c7f
	.xword	0xe41beebaaa440913
	.xword	0x22cbfb08de2735f9
	.xword	0x76f3d50776742b86
	.xword	0x2d8c3699c5bcae7c
	.xword	0x9d1defb852f4c7f6
	.xword	0xe67752d1d27a9200
	.xword	0x7291eee025d30538
	.xword	0xe19cad89fd5a77d8
	.xword	0xd13866f3cc4a7375
	.xword	0xd1e3c0d99f677685
	.xword	0x100e3b612fc2ec5e
	.xword	0x6f93ad5564b241a2
	.xword	0xc6cc14e8b3944540
	.xword	0xd0480b2dd28c2f4e
	.xword	0xb58f977f367c16f7
	.xword	0xa9abb5e9404225eb
	.xword	0x60ffd0141513e83a
	.xword	0xb578c3d4879af375
	.xword	0xd325bc6f6496f8da
	.xword	0x461483c46ee0588b
	.xword	0xe02733ecd38699b6
	.xword	0x9f3422015994a2ea
	.xword	0x80a7d09e94f1eae6
	.xword	0x0e1b1cd9ea36a028
	.xword	0xf5fdef72ccccbcba
	.xword	0x2ba34ee60abe48ee
	.xword	0x23507a0114bc6b4e
	.xword	0xc4a261f7d12eb284
	.xword	0x64a3584e61e39907
	.xword	0x3edc19570c7c4369
	.xword	0x8aa5023a80df2412
	.xword	0xd1a884d565f9c3c7
	.xword	0x7074d4da4f09c592
	.xword	0x57e4a7646329353d
	.xword	0x7a45f742bf26f51b
	.xword	0x3074f424bff400de
	.xword	0x239d3c3a28b369d1
	.xword	0xbb7774b7b607b573
	.xword	0x16d74b4cc8b06856
	.xword	0x6f42f884e7925ecb
	.xword	0xa8ff9e6a2cbdd865
	.xword	0x44e53a77612c9f4f
	.xword	0xb5cab267fd21fecf
	.xword	0xfd4453e0b92ae90c
	.xword	0xcdd513d423d4e807
	.xword	0x56aa283a12f702b1
	.xword	0x61ef93261137b5b7
	.xword	0x0d46252f7bae3a01
	.xword	0x47ff20429f44e2b1
	.xword	0x1aa4312f76686bf6
	.xword	0x05dbc431cb7801c9
	.xword	0xa2ba8f51ea95bb2e
	.xword	0xd312eac944930b53
	.xword	0xd06bcda5d82c6235
	.xword	0x53c07918c7921979
	.xword	0xffc47338077968f9
	.xword	0x2b85cff1fc2a3dc7
	.xword	0x76c107154201e337
	.align 0x80000
	.data
data_start_7:

	.xword	0x67b0ced5888eb366
	.xword	0x2100707fc4ecc564
	.xword	0x6cf46794a6ce8b0f
	.xword	0xce86cdb261e60992
	.xword	0xbf6dcc39734b8f20
	.xword	0xb40d107d94cba2e0
	.xword	0xe5b97ca2d1dd7bea
	.xword	0x93b51a48de711040
	.xword	0xe4b65697733f3f24
	.xword	0x7fb525764b29203e
	.xword	0x9bf4e86305ecd0d5
	.xword	0xbea6c6ec4eba9fe4
	.xword	0xfa3c84ef47871106
	.xword	0x084965592b999588
	.xword	0xa452924c0d9f6f78
	.xword	0x176aa612684055ff
	.xword	0xeb8ce04554c2993d
	.xword	0x5d9f582dbe63cbb2
	.xword	0x43bb6e4a4f871575
	.xword	0xd2e1976663a93e39
	.xword	0xa1b329dca8c4f353
	.xword	0x549cf3f0a942a653
	.xword	0x22905178d3ab192d
	.xword	0xa7070eba6eee275f
	.xword	0x9af0c95489bea972
	.xword	0xee861492a9115988
	.xword	0x15117c3a37a24184
	.xword	0xc596855655959295
	.xword	0x08c6d83582a820a4
	.xword	0xe593061fb98a6a19
	.xword	0x3cab759651608cbe
	.xword	0x2d23553374baaca5
	.xword	0xd5ce79367736a05e
	.xword	0xfc3bdbcb39736b40
	.xword	0x4d6d75bbc8e43920
	.xword	0xd0a9453a910f1f54
	.xword	0x539b01399609063f
	.xword	0x2de4b4f45a756d38
	.xword	0x44277634e6da2b13
	.xword	0x28224e5276f4a93b
	.xword	0x42575184cf6f507e
	.xword	0x334703b408e2e6e8
	.xword	0x2bf4ff74814abb8a
	.xword	0x8f6099ef837934d4
	.xword	0xe4a8623a60561146
	.xword	0x0ad53797beaf08a6
	.xword	0x95ee624e7478e349
	.xword	0xe1dbcec4e57b9aa7
	.xword	0xd05067f0c3248873
	.xword	0x83fadd9cde3329ae
	.xword	0xecfe834bfa8ab3f6
	.xword	0xfb13826c49470b67
	.xword	0xb0414b0ce1587198
	.xword	0xfe4a0dfe2b6fe197
	.xword	0x7c896841b8471074
	.xword	0x52dfc7b01d459f3d
	.xword	0xd0af5dcbd2a8b875
	.xword	0x3a56b3afb856508e
	.xword	0x2e525b889d9f9c28
	.xword	0xddf0495fe6c0a237
	.xword	0x8dbe07f00046c9e1
	.xword	0x1aca403f70c310f4
	.xword	0x6cf9f85488d1c52a
	.xword	0x006b76fdc3e62701
	.xword	0x544b0a5f80a625fb
	.xword	0xf052d28ca1da5fb5
	.xword	0x5a116bda6ffa2bf7
	.xword	0xb3d9c78f750589d8
	.xword	0x84a545cf0ee1e040
	.xword	0x72c787cf6e682c8d
	.xword	0x05512cf352f5e732
	.xword	0xc6b03d5140e2a681
	.xword	0x0843779116bddfbf
	.xword	0x3a5cd9893ed10763
	.xword	0x02eeaa089276b9ff
	.xword	0x13bbdcb5bb37bf63
	.xword	0x12ac9149c6dc7668
	.xword	0xc9e62f4036a95442
	.xword	0x55b48f6aa216b76c
	.xword	0xc186437f113ca6f7
	.xword	0xbfd0957298771599
	.xword	0x22b02f55176feeb1
	.xword	0x6a2cf2fb984580ad
	.xword	0x52f2ff9c6630cfd5
	.xword	0x72d018332cdfe8c0
	.xword	0xdeb6842a12e953e3
	.xword	0x9b0f0100c245b4a2
	.xword	0x99d1d3ff6190f8bf
	.xword	0x486140c1dd4e30c6
	.xword	0x20ad9b94bdc3d622
	.xword	0xe7331acbd8b82d6d
	.xword	0x917e28a49b70a0a9
	.xword	0x49a535ff7a5d2fd1
	.xword	0xfc648e74eac1528b
	.xword	0xfe2268af0e3179c6
	.xword	0x177df7603cdb8545
	.xword	0xac79f3ada04f24d5
	.xword	0x8d6ff3378c88d397
	.xword	0xfa110698a6d73bc2
	.xword	0xb8f3fcd2592c253e
	.xword	0xf7796d6220b39d04
	.xword	0xe0d2eb4d857ab4f6
	.xword	0x3ac7b4198384d979
	.xword	0xeaafe7c4303915fd
	.xword	0xe0c220dc884a9d7a
	.xword	0xc53e1cf6f4ab22fa
	.xword	0x5809cf459f6db9a2
	.xword	0x290c10044ae7104c
	.xword	0xe26dd4f64a9ce2e6
	.xword	0x69f4626fc9d57f33
	.xword	0x1029e3548be022c6
	.xword	0x30810616195e1b77
	.xword	0xd5bfd85c20314883
	.xword	0x9afa6605ee9a2dac
	.xword	0xec39741f43b97981
	.xword	0x55b352ad0e26d9dd
	.xword	0x80d3f2eb1e8f2bd8
	.xword	0x4818e63bd70d5a13
	.xword	0x23897f5b0b964ac3
	.xword	0x4537d488cde30eb1
	.xword	0x807bab8567233cd6
	.xword	0x1eddc0aa167ccbc5
	.xword	0xe8966695be712f97
	.xword	0x8a7f52b8da0560da
	.xword	0xfbab1386dbb5ca98
	.xword	0x90c708b943895cf6
	.xword	0xf61bcbca12833d55
	.xword	0x50f4a6d71fff540f
	.xword	0x7b46ddbc54f102fb
	.xword	0x91eefc07e754eeca
	.xword	0xe1bf36c0bf94d158
	.xword	0x4a20efd694203209
	.xword	0x4d106c98a4b29a2e
	.xword	0x05a01386c88d43b1
	.xword	0x979b1501b72bf11c
	.xword	0x24ca267a56ec3c35
	.xword	0xcba26c27578f9910
	.xword	0xf7af849132bfab7a
	.xword	0x9cd99c23e2ce49f3
	.xword	0x217555f0a1f12bdb
	.xword	0xfcb6dfc0a2a8a39a
	.xword	0x302b9b1a4fbe890d
	.xword	0x534c92546e87b555
	.xword	0x185099e6fc52bbb9
	.xword	0x9e98d4dd2cf3fdf9
	.xword	0xfe355dabdded9a9c
	.xword	0x8e734dfed00d8cb6
	.xword	0x75e945c8d6824289
	.xword	0x23aa2431e1f0b610
	.xword	0xb6bec61c3ce987d3
	.xword	0x7f2befb3f55c2f1e
	.xword	0x9518799c6dfcf14e
	.xword	0x3207a611a38ded81
	.xword	0xfe81756ed669bfea
	.xword	0x4bd31221d6372d7a
	.xword	0xa59228c5426423b4
	.xword	0x3ba1d0c5d0cd2523
	.xword	0xac5f02d8566d9631
	.xword	0xa37e44c487959a43
	.xword	0x944b2692f024e119
	.xword	0x037a9a06441087f9
	.xword	0x4b1126ffba4c5b17
	.xword	0xbf83e2a07cfc6417
	.xword	0x1b1202d39278532e
	.xword	0x6a7f89874121f472
	.xword	0x0963860841cfd725
	.xword	0xa941922c247ed86b
	.xword	0x617788d989343575
	.xword	0xe07ec0d40b0c937e
	.xword	0xf6a68f5a4556a88a
	.xword	0x248e2efdc170aaaa
	.xword	0x122aabb079bdc434
	.xword	0x6621fdd8b816fc72
	.xword	0x618b11d439f8d757
	.xword	0x89f29de5fc420b43
	.xword	0xbaf37a3f286f0fe0
	.xword	0x56198f68e99a2225
	.xword	0xcd70b0e7790dc825
	.xword	0x33fa4d15bc5e4016
	.xword	0x11096b870e6c9eca
	.xword	0x0dc46f38bbf319bd
	.xword	0x607e51ac6bedb872
	.xword	0x2090838ae0cacba8
	.xword	0xcb0fd0d33a8dc175
	.xword	0x2cc798a46a07a1e0
	.xword	0x297e3c63b3c20e30
	.xword	0x7e0bc367e37a385a
	.xword	0x8a28052318f168ac
	.xword	0x3442b100bb1af3e0
	.xword	0x9eae981d37c1e07a
	.xword	0xc62401b7b9f31548
	.xword	0x1893d5d88626afda
	.xword	0xca5115f2dc228bb6
	.xword	0x5d2ce262e7cac6de
	.xword	0xe79085db61f2b66f
	.xword	0x1bce539a91ac5693
	.xword	0x4d06cee5ddec4452
	.xword	0x5c1ba0b31af1c7af
	.xword	0x590b35d3ff142ab9
	.xword	0x2b23ce7e587ae20b
	.xword	0x229a464e3634a95e
	.xword	0x9a2952f83d985470
	.xword	0xe8567371d536c791
	.xword	0x9ef526c59f12a133
	.xword	0x3e8d6781b4d21406
	.xword	0x16a7497e42b67d8b
	.xword	0x0abcc3302abd0184
	.xword	0x45e1e84f92a936f7
	.xword	0x97826661819f5694
	.xword	0xa6c8f8bb64f93005
	.xword	0x87ab4cfd3a2c25cf
	.xword	0x3df9c535b7ce42f3
	.xword	0xd5a81af642df2735
	.xword	0x8a7cb7c94dcb9f60
	.xword	0xf853839a3680fdae
	.xword	0x69a5b9db1483b8b5
	.xword	0xc5f7174029b572c5
	.xword	0x67a0404eb31add05
	.xword	0xad85a8c4abe5c216
	.xword	0x97b65c633c82368e
	.xword	0x0c44a43c788b5f72
	.xword	0xbe7abd0f2a6a574b
	.xword	0x053e0b12cbe79b03
	.xword	0x7643fb64af523284
	.xword	0xe68d110f3e15d132
	.xword	0x7e21d446e830a677
	.xword	0x7b80070d0fac8a1d
	.xword	0x74870fd4fa0b1be7
	.xword	0x0742e18ed8fb568d
	.xword	0x8c4b54705ce12454
	.xword	0x781690c9b5a8a13e
	.xword	0xc51cd782f0ffd6a6
	.xword	0xbcb3d1aa0ee1e118
	.xword	0x5919e40aae71656e
	.xword	0x5fb05cceda8926ec
	.xword	0x4f9ce3762ca6882a
	.xword	0xc54f135fb231b0ad
	.xword	0x0f42225cb0971ae1
	.xword	0xc99dfb46219a93f5
	.xword	0x184c0cbb7f01254b
	.xword	0xa10481d790b7162f
	.xword	0xd95458bed75fd381
	.xword	0xe0194da0cebe849e
	.xword	0xba9b80a5ba9fc0c4
	.xword	0x24088ad23e1030b0
	.xword	0x9029ef8e73f830d5
	.xword	0xb523414c70395fb9
	.xword	0xe2e0cea0d9680824
	.xword	0x123fe52ba1648b9d
	.xword	0x8658d8830df3a401
	.xword	0x89158e53a19e23d6
	.xword	0x492554e8255eefd5
	.xword	0x465b92badf24f129
	.xword	0x5451a904d8ec80b7
	.xword	0xc39bc2caeb78e301
	.xword	0xf056084b45d1c547



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
