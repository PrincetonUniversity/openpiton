// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_53.s
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
   random seed:	928863525
   Jal tlu_multi_mix_2_hwint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x9c8b2b7ac8426b5a, %g1, %g0
	setx 0xc553b6f0bac0d2c0, %g1, %g1
	setx 0x14f84b85923c3010, %g1, %g2
	setx 0xdb2b92c805b74f88, %g1, %g3
	setx 0xb7be44d42198416c, %g1, %g4
	setx 0x435e43a963b81130, %g1, %g5
	setx 0x5bceca8013006023, %g1, %g6
	setx 0x70a7b8f5f42a2792, %g1, %g7
	setx 0x3ef8deba8c7913b0, %g1, %r16
	setx 0xfed6b5e5b95666fc, %g1, %r17
	setx 0xbaa6b750cceb1a27, %g1, %r18
	setx 0xdfc5123941803db8, %g1, %r19
	setx 0x458d57e9a60e13bc, %g1, %r20
	setx 0x43fd17d2f6685aeb, %g1, %r21
	setx 0x55f1f2e4bfaa6ad2, %g1, %r22
	setx 0xf062c7f7e58da1ce, %g1, %r23
	setx 0xda7d36fe0f1ec3b1, %g1, %r24
	setx 0x09263f6691fc27f6, %g1, %r25
	setx 0x95929ee9622b3af5, %g1, %r26
	setx 0x23e4cb4162c86709, %g1, %r27
	setx 0x144ffa7f960bfe44, %g1, %r28
	setx 0x98687935d32e2859, %g1, %r29
	setx 0xfd072df87f9aaf09, %g1, %r30
	setx 0xe54b708e07e4fb0c, %g1, %r31
	save
	setx 0x0495c7c1436ee939, %g1, %r16
	setx 0x47a9ce110d58c143, %g1, %r17
	setx 0xf28e40585afa80c0, %g1, %r18
	setx 0x89ed7ecdf8b7fb3e, %g1, %r19
	setx 0x1c69bfc9398b831f, %g1, %r20
	setx 0x2d48be7e6e556f06, %g1, %r21
	setx 0xf1cbefd2161a3784, %g1, %r22
	setx 0x800884202c4ed8e1, %g1, %r23
	setx 0x6983fc9c81f6df7a, %g1, %r24
	setx 0x68188e9c78c9dc96, %g1, %r25
	setx 0xf6cadbfd61451879, %g1, %r26
	setx 0x0c6615a11833f123, %g1, %r27
	setx 0x818c467d4811a583, %g1, %r28
	setx 0xa8f572902a4441bb, %g1, %r29
	setx 0xbc43c8dcecdfcf37, %g1, %r30
	setx 0x977b536199fd60b5, %g1, %r31
	save
	setx 0xd4bbefb75ce905c5, %g1, %r16
	setx 0x5c079c0a4b204812, %g1, %r17
	setx 0x739a755623d9dfcb, %g1, %r18
	setx 0x97c5ead647cc26c0, %g1, %r19
	setx 0xa04aed1ce91be0c5, %g1, %r20
	setx 0xb8ad47859b6dd550, %g1, %r21
	setx 0xd81525a675545833, %g1, %r22
	setx 0xbb6ab4d05e376c31, %g1, %r23
	setx 0x7e41c06302ab8bf1, %g1, %r24
	setx 0xcb3ef8772114e292, %g1, %r25
	setx 0x3227f37703797cef, %g1, %r26
	setx 0xcacfdb332c3d9165, %g1, %r27
	setx 0xb9a799d05ff236b7, %g1, %r28
	setx 0xa788e8842277d0b9, %g1, %r29
	setx 0x24013e16c6606737, %g1, %r30
	setx 0xcdbbf8954bcd40da, %g1, %r31
	save
	setx 0x5a9642b2358e38cd, %g1, %r16
	setx 0x3e6909222f9ba726, %g1, %r17
	setx 0x7f588c0fc8a0c92a, %g1, %r18
	setx 0xc23708032bf767ae, %g1, %r19
	setx 0x072eb640b2caa299, %g1, %r20
	setx 0x887e2403f98194ad, %g1, %r21
	setx 0x38be155995a10c12, %g1, %r22
	setx 0x0eaacdbf1131104e, %g1, %r23
	setx 0xd15216e2b1578301, %g1, %r24
	setx 0xe730a17102bc9b70, %g1, %r25
	setx 0xb2bd6dd5bb257821, %g1, %r26
	setx 0x75e8e8bae278bc54, %g1, %r27
	setx 0x5dabd97a2d41b4cb, %g1, %r28
	setx 0xf44cbcbd69d02375, %g1, %r29
	setx 0xea88d3f46a2f88f8, %g1, %r30
	setx 0x382dea343f182883, %g1, %r31
	save
	setx 0x7e8a48e0262d361a, %g1, %r16
	setx 0x943d12ed1dbb2cfa, %g1, %r17
	setx 0x20a8bb7f27a07e2f, %g1, %r18
	setx 0xe7bcef533e44d0f9, %g1, %r19
	setx 0xa186a1c76d815930, %g1, %r20
	setx 0x3ce011d45681acab, %g1, %r21
	setx 0x5415110acdff88c2, %g1, %r22
	setx 0xe6f46c4867aaac61, %g1, %r23
	setx 0x06630772eec0222d, %g1, %r24
	setx 0x1e2d6c5e6f4c0ccb, %g1, %r25
	setx 0x45bb84b074186fa9, %g1, %r26
	setx 0x6139663d25014ead, %g1, %r27
	setx 0x0b11fa4ba4b2a59e, %g1, %r28
	setx 0xc00efed22765850d, %g1, %r29
	setx 0x4de1e22a6720763d, %g1, %r30
	setx 0xa49170f7cfa59dbf, %g1, %r31
	save
	setx 0x37cfabb49e4c1b4d, %g1, %r16
	setx 0xe160c87f2aa5ed76, %g1, %r17
	setx 0x59f92dd269762c77, %g1, %r18
	setx 0x6b1f770055d40c62, %g1, %r19
	setx 0xc1d1cf22eba92379, %g1, %r20
	setx 0xa310d3fa325d4be4, %g1, %r21
	setx 0xeee298dc9422d6b9, %g1, %r22
	setx 0x7df0a1d0f966cf95, %g1, %r23
	setx 0x06110ea5aa94e60e, %g1, %r24
	setx 0x68be36fc341da612, %g1, %r25
	setx 0x96cf9d4ded9ac762, %g1, %r26
	setx 0x42a34233e55176b8, %g1, %r27
	setx 0x70b9382a37b77f5c, %g1, %r28
	setx 0x22b024cc7ee24161, %g1, %r29
	setx 0x3c467d2099664e04, %g1, %r30
	setx 0xf57e56b23c8ab195, %g1, %r31
	save
	setx 0x589bb11a44bff1ba, %g1, %r16
	setx 0xb3d451dcc5dd34b1, %g1, %r17
	setx 0xa9ad7de734ea499c, %g1, %r18
	setx 0x5e06d329401b4467, %g1, %r19
	setx 0x89904c253a2275f6, %g1, %r20
	setx 0x5d6c96c34e063efa, %g1, %r21
	setx 0xdf27acdc4a84d4e3, %g1, %r22
	setx 0xea61d11a5336bc52, %g1, %r23
	setx 0x363a9bcad0197a03, %g1, %r24
	setx 0x6c02fe513c2e94cb, %g1, %r25
	setx 0xf386c906bc249469, %g1, %r26
	setx 0x22e641f3530d73e2, %g1, %r27
	setx 0x4133d76b4df61fef, %g1, %r28
	setx 0x5ace6af71d27b7cd, %g1, %r29
	setx 0x65a782c893c30124, %g1, %r30
	setx 0x2a3f42512c4013c7, %g1, %r31
	save
	setx 0x26d5a183c9d51d16, %g1, %r16
	setx 0x3a5ad0bb140060b6, %g1, %r17
	setx 0xe1cc7e2c12bb5167, %g1, %r18
	setx 0xfc7a886fce3e6ec5, %g1, %r19
	setx 0xef5cbfffe9bdf9ea, %g1, %r20
	setx 0x7d2d79e735fced3a, %g1, %r21
	setx 0x3696d927d39c7105, %g1, %r22
	setx 0x53b622f8a73e673c, %g1, %r23
	setx 0x3603b9c591d37469, %g1, %r24
	setx 0x7dd462b739114c17, %g1, %r25
	setx 0xb3460e7adee60ac0, %g1, %r26
	setx 0x7fa0dfb64f9871a2, %g1, %r27
	setx 0xf7acd0a092caf700, %g1, %r28
	setx 0x5b0bfd5ba55ef1bb, %g1, %r29
	setx 0x0bffc4cbd578ef6a, %g1, %r30
	setx 0xbe6bc695afe8550d, %g1, %r31
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
	.word 0xb1e4e0bc  ! 1: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 1d)
	mov	2, %r12
	.word 0xa1930000  ! 3: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xa2b2800400009f9b, %g1, %r10
	.word 0x819a8000  ! 5: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb2d9000  ! 7: SLLX_R	sllx	%r22, %r0, %r29
	.word 0x8995e085  ! 8: WRPR_TICK_I	wrpr	%r23, 0x0085, %tick
	.word 0xbde521a0  ! 10: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, c)
	mov	1, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595e01f  ! 14: WRPR_TSTATE_I	wrpr	%r23, 0x001f, %tstate
	.word 0xb83560f2  ! 15: ORN_I	orn 	%r21, 0x00f2, %r28
	.word 0xbbe4a0e6  ! 16: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e5e13a  ! 18: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe520a2  ! 19: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0xb9e5a165  ! 21: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4a1cd  ! 22: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5e10e  ! 23: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde5e18f  ! 25: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf34d000  ! 27: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xb9540000  ! 30: RDPR_GL	<illegal instruction>
	.word 0xbc2c4000  ! 31: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xbbe46018  ! 32: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8195e02c  ! 35: WRPR_TPC_I	wrpr	%r23, 0x002c, %tpc
	.word 0xb4b58000  ! 36: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xbde4e109  ! 37: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e421df  ! 38: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e421db  ! 39: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8994a19b  ! 43: WRPR_TICK_I	wrpr	%r18, 0x019b, %tick
	.word 0xb9510000  ! 45: RDPR_TICK	<illegal instruction>
	.word 0x9194612b  ! 46: WRPR_PIL_I	wrpr	%r17, 0x012b, %pil
	.word 0xbfe5e085  ! 48: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb09d4000  ! 49: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0x8794e1f4  ! 50: WRPR_TT_I	wrpr	%r19, 0x01f4, %tt
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e42000  ! 54: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe561f5  ! 55: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb13c1000  ! 64: SRAX_R	srax	%r16, %r0, %r24
	.word 0xb23c4000  ! 68: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0xb1e460b2  ! 69: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb4154000  ! 73: OR_R	or 	%r21, %r0, %r26
	.word 0xb2254000  ! 75: SUB_R	sub 	%r21, %r0, %r25
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 1b)
	.word 0x8795e1cc  ! 80: WRPR_TT_I	wrpr	%r23, 0x01cc, %tt
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb57d4400  ! 82: MOVR_R	movre	%r21, %r0, %r26
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe5e02d  ! 87: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb8140000  ! 88: OR_R	or 	%r16, %r0, %r28
	.word 0xbde4e138  ! 90: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x6326b9730000b8dc, %g1, %r10
	.word 0x839a8000  ! 92: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x4499f1a00003888, %g1, %r10
	.word 0x839a8000  ! 94: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe5e0d4  ! 95: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4213c  ! 96: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5219e  ! 101: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8994a10d  ! 102: WRPR_TICK_I	wrpr	%r18, 0x010d, %tick
	.word 0xbde52002  ! 103: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5202e  ! 105: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8795e09e  ! 108: WRPR_TT_I	wrpr	%r23, 0x009e, %tt
	.word 0xb41d4000  ! 110: XOR_R	xor 	%r21, %r0, %r26
	.word 0xb7e5216d  ! 111: SAVE_I	save	%r20, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 114: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x6e1f5dfe0000ca85, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9194a049  ! 118: WRPR_PIL_I	wrpr	%r18, 0x0049, %pil
	.word 0xb1e4a10f  ! 120: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7e46084  ! 123: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb8440000  ! 124: ADDC_R	addc 	%r16, %r0, %r28
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 16)
	setx	data_start_2, %g1, %r20
	.word 0xb5e4a1ca  ! 128: SAVE_I	save	%r18, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 129: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e42067  ! 134: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe421a7  ! 135: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x5ec8c8a900001f93, %g1, %r10
	.word 0x819a8000  ! 136: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 32)
	.word 0xb8acc000  ! 144: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xbde5a077  ! 150: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb08c8000  ! 152: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xb1e46011  ! 153: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4a031  ! 155: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0xb9e520d9  ! 159: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e56060  ! 160: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8395e034  ! 161: WRPR_TNPC_I	wrpr	%r23, 0x0034, %tnpc
	.word 0xbfe4612b  ! 163: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8594e01a  ! 168: WRPR_TSTATE_I	wrpr	%r19, 0x001a, %tstate
	.word 0xbfe521c3  ! 172: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9341000  ! 173: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xbd641800  ! 175: MOVcc_R	<illegal instruction>
	.word 0xbfe5e137  ! 182: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e560d5  ! 186: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 23)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e4a109  ! 195: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5a008  ! 196: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbb508000  ! 199: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a016  ! 200: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, a)
	.word 0xb3e5200e  ! 202: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x3258799100002fdd, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e421a8  ! 209: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a05f  ! 212: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4a096  ! 213: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e52171  ! 214: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb684a1e9  ! 216: ADDcc_I	addcc 	%r18, 0x01e9, %r27
	.word 0x8595e1b2  ! 217: WRPR_TSTATE_I	wrpr	%r23, 0x01b2, %tstate
	.word 0xbde42101  ! 218: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e461c0  ! 230: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e46038  ! 231: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7540000  ! 234: RDPR_GL	<illegal instruction>
	.word 0xb9e46012  ! 235: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0c56022  ! 237: ADDCcc_I	addccc 	%r21, 0x0022, %r24
	.word 0xbfe560e7  ! 238: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_4, %g1, %r21
	.word 0xbd540000  ! 241: RDPR_GL	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 19)
	.word 0xbbe4a031  ! 245: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 35)
	.word 0x9195619f  ! 250: WRPR_PIL_I	wrpr	%r21, 0x019f, %pil
	.word 0x81952058  ! 253: WRPR_TPC_I	wrpr	%r20, 0x0058, %tpc
	.word 0xb1e5a0e3  ! 255: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb82521e0  ! 256: SUB_I	sub 	%r20, 0x01e0, %r28
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e4e1f5  ! 259: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x87942141  ! 262: WRPR_TT_I	wrpr	%r16, 0x0141, %tt
	.word 0xb3e5a15e  ! 264: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5e10d  ! 270: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4e0b5  ! 271: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e561d6  ! 273: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e460c2  ! 274: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9e4a192  ! 278: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4e01c  ! 279: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5e037  ! 280: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 31)
	.word 0xb81de097  ! 285: XOR_I	xor 	%r23, 0x0097, %r28
	.word 0xbbe4a0a6  ! 290: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8394e006  ! 291: WRPR_TNPC_I	wrpr	%r19, 0x0006, %tnpc
	setx	data_start_6, %g1, %r22
	.word 0xbbe4e1aa  ! 293: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4e14e  ! 294: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e461da  ! 298: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4a163  ! 300: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_0, %g1, %r17
	mov	1, %r12
	.word 0xa1930000  ! 310: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1c)
	.word 0x8995a149  ! 312: WRPR_TICK_I	wrpr	%r22, 0x0149, %tick
	setx	0x171774f30000dc9e, %g1, %r10
	.word 0x839a8000  ! 316: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_7, %g1, %r21
	.word 0x8d95e0d3  ! 319: WRPR_PSTATE_I	wrpr	%r23, 0x00d3, %pstate
	.word 0xb9e46099  ! 320: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe460e1  ! 323: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5510000  ! 327: RDPR_TICK	<illegal instruction>
	.word 0x87946065  ! 331: WRPR_TT_I	wrpr	%r17, 0x0065, %tt
	.word 0xbc140000  ! 332: OR_R	or 	%r16, %r0, %r30
	.word 0xb3e5a1b3  ! 333: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 18)
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 1b)
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 11)
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 0)
	.word 0xb351c000  ! 341: RDPR_TL	<illegal instruction>
	.word 0xbde4a035  ! 343: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e42114  ! 345: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5e02e  ! 347: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe560dd  ! 350: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e420d6  ! 351: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb951c000  ! 352: RDPR_TL	<illegal instruction>
	.word 0x9194e096  ! 362: WRPR_PIL_I	wrpr	%r19, 0x0096, %pil
	.word 0xb1508000  ! 363: RDPR_TSTATE	<illegal instruction>
	.word 0x8d9561ee  ! 366: WRPR_PSTATE_I	wrpr	%r21, 0x01ee, %pstate
	.word 0xb57c8400  ! 367: MOVR_R	movre	%r18, %r0, %r26
	mov	2, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde5a06a  ! 371: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e56013  ! 375: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e52051  ! 382: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb520000  ! 384: RDPR_PIL	<illegal instruction>
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e4a04a  ! 387: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_2, %g1, %r17
	.word 0xb9e521ca  ! 391: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb53cf001  ! 396: SRAX_I	srax	%r19, 0x0001, %r26
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e52056  ! 401: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x4711def0000bd14, %g1, %r10
	.word 0x819a8000  ! 402: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4e004  ! 405: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5a036  ! 406: SAVE_I	save	%r22, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 408: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe46088  ! 412: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e5a19a  ! 414: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_1, %g1, %r16
	.word 0xb5e5202b  ! 418: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 12)
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 22)
	.word 0xb23c4000  ! 423: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0x8794e063  ! 424: WRPR_TT_I	wrpr	%r19, 0x0063, %tt
	.word 0xb9e4608a  ! 425: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x87946023  ! 426: WRPR_TT_I	wrpr	%r17, 0x0023, %tt
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, d)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, b)
	.word 0xb32dd000  ! 430: SLLX_R	sllx	%r23, %r0, %r25
	.word 0x8d94a054  ! 433: WRPR_PSTATE_I	wrpr	%r18, 0x0054, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e098  ! 437: WRPR_PIL_I	wrpr	%r19, 0x0098, %pil
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe461c6  ! 440: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4e0fa  ! 441: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8994e09f  ! 449: WRPR_TICK_I	wrpr	%r19, 0x009f, %tick
	.word 0xb7e4e104  ! 450: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x91952142  ! 452: WRPR_PIL_I	wrpr	%r20, 0x0142, %pil
	.word 0xbe84a147  ! 453: ADDcc_I	addcc 	%r18, 0x0147, %r31
	.word 0xb7e56057  ! 455: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e56009  ! 457: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5600f  ! 459: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e5e149  ! 462: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xba3ce146  ! 464: XNOR_I	xnor 	%r19, 0x0146, %r29
	.word 0x8d95219d  ! 465: WRPR_PSTATE_I	wrpr	%r20, 0x019d, %pstate
	.word 0x839521b7  ! 466: WRPR_TNPC_I	wrpr	%r20, 0x01b7, %tnpc
	.word 0xb5e4a15a  ! 468: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x5a92b581000039c8, %g1, %r10
	.word 0x839a8000  ! 470: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e5210a  ! 472: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4e061  ! 473: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x879420b5  ! 474: WRPR_TT_I	wrpr	%r16, 0x00b5, %tt
	.word 0xb5520000  ! 475: RDPR_PIL	<illegal instruction>
	.word 0xbde5a017  ! 476: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4a0a1  ! 477: SAVE_I	save	%r18, 0x0001, %r28
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e4a149  ! 486: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e156  ! 493: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4614f  ! 495: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde4200a  ! 496: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb51c000  ! 497: RDPR_TL	<illegal instruction>
	.word 0xbfe521bc  ! 499: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d9561e8  ! 503: WRPR_PSTATE_I	wrpr	%r21, 0x01e8, %pstate
	.word 0xb9e5a057  ! 505: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe560be  ! 506: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_7, %g1, %r21
	.word 0xb1540000  ! 511: RDPR_GL	<illegal instruction>
	.word 0xb9e5e143  ! 513: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5e17c  ! 514: SAVE_I	save	%r23, 0x0001, %r27
	setx	0xb9dae7710000ff4c, %g1, %r10
	.word 0x819a8000  ! 515: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb751c000  ! 522: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 524: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 531: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e5e15c  ! 533: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe52180  ! 539: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e051  ! 545: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 13)
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 2a)
	.word 0xba9cc000  ! 554: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0x8d956094  ! 560: WRPR_PSTATE_I	wrpr	%r21, 0x0094, %pstate
	.word 0xbf480000  ! 563: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7e4a185  ! 564: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4610e  ! 566: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4a198  ! 567: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x9194601e  ! 572: WRPR_PIL_I	wrpr	%r17, 0x001e, %pil
	.word 0xb5508000  ! 578: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e561ba  ! 579: SAVE_I	save	%r21, 0x0001, %r24
	mov	0, %r12
	.word 0x8f930000  ! 580: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8994206c  ! 582: WRPR_TICK_I	wrpr	%r16, 0x006c, %tick
	.word 0xb6340000  ! 584: SUBC_R	orn 	%r16, %r0, %r27
	.word 0xbde5209b  ! 586: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 3f)
	.word 0x8194a176  ! 589: WRPR_TPC_I	wrpr	%r18, 0x0176, %tpc
	.word 0xbf500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0xb3e4604a  ! 594: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4e1c6  ! 596: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x9194e11e  ! 597: WRPR_PIL_I	wrpr	%r19, 0x011e, %pil
	.word 0xbd520000  ! 599: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 600: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e56125  ! 602: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a06a  ! 603: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf500000  ! 605: RDPR_TPC	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xbf540000  ! 609: RDPR_GL	<illegal instruction>
	.word 0xbbe4a0e7  ! 611: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5210d  ! 613: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe52182  ! 616: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x879561ae  ! 617: WRPR_TT_I	wrpr	%r21, 0x01ae, %tt
	.word 0xb7e4e019  ! 618: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbfe5a0f5  ! 620: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e46143  ! 621: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5a044  ! 625: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf520000  ! 626: RDPR_PIL	<illegal instruction>
	.word 0xb7e52119  ! 628: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5203a  ! 632: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbf480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x879421cf  ! 635: WRPR_TT_I	wrpr	%r16, 0x01cf, %tt
	.word 0xbbe460c1  ! 638: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 30)
	mov	1, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb695c000  ! 647: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xb3348000  ! 649: SRL_R	srl 	%r18, %r0, %r25
	.word 0x8395e0a8  ! 650: WRPR_TNPC_I	wrpr	%r23, 0x00a8, %tnpc
	setx	data_start_2, %g1, %r23
	.word 0xb6046021  ! 665: ADD_I	add 	%r17, 0x0021, %r27
	.word 0xb3e46170  ! 668: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbca48000  ! 670: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xb1e5a06c  ! 672: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbf641800  ! 673: MOVcc_R	<illegal instruction>
	.word 0xbc856142  ! 675: ADDcc_I	addcc 	%r21, 0x0142, %r30
	.word 0xb9e5e1ce  ! 677: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5e0cf  ! 678: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d9561f3  ! 679: WRPR_PSTATE_I	wrpr	%r21, 0x01f3, %pstate
	.word 0xb334e001  ! 681: SRL_I	srl 	%r19, 0x0001, %r25
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb89c60b1  ! 686: XORcc_I	xorcc 	%r17, 0x00b1, %r28
	mov	2, %r12
	.word 0xa1930000  ! 688: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e421c1  ! 690: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde46088  ! 692: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 39)
	.word 0xbf480000  ! 694: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb9e4a1ee  ! 695: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3518000  ! 696: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e461e8  ! 697: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 7)
	setx	0xfad69e9b0000ef19, %g1, %r10
	.word 0x819a8000  ! 707: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995205a  ! 710: WRPR_TICK_I	wrpr	%r20, 0x005a, %tick
	.word 0x8d94a0c8  ! 711: WRPR_PSTATE_I	wrpr	%r18, 0x00c8, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc24a116  ! 717: SUB_I	sub 	%r18, 0x0116, %r30
	.word 0x83952090  ! 718: WRPR_TNPC_I	wrpr	%r20, 0x0090, %tnpc
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 9)
	.word 0xb21dc000  ! 720: XOR_R	xor 	%r23, %r0, %r25
	.word 0xb5e5e07f  ! 723: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb01ce083  ! 727: XOR_I	xor 	%r19, 0x0083, %r24
	.word 0xb9520000  ! 732: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r17
	.word 0xbb500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 751: RDPR_GL	<illegal instruction>
	.word 0xbde42036  ! 752: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8395e17f  ! 753: WRPR_TNPC_I	wrpr	%r23, 0x017f, %tnpc
	.word 0xb1e46059  ! 755: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9510000  ! 761: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 764: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe521ca  ! 765: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbca4214f  ! 768: SUBcc_I	subcc 	%r16, 0x014f, %r30
	.word 0x89942083  ! 773: WRPR_TICK_I	wrpr	%r16, 0x0083, %tick
	.word 0xba244000  ! 774: SUB_R	sub 	%r17, %r0, %r29
	.word 0x819421a0  ! 786: WRPR_TPC_I	wrpr	%r16, 0x01a0, %tpc
	.word 0x8795216a  ! 787: WRPR_TT_I	wrpr	%r20, 0x016a, %tt
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e5e103  ! 790: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 20)
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 37)
	.word 0xbabde009  ! 800: XNORcc_I	xnorcc 	%r23, 0x0009, %r29
	.word 0xb1e4610f  ! 807: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e5a174  ! 810: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd520000  ! 811: RDPR_PIL	<illegal instruction>
	.word 0xb7e5e1e9  ! 812: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e5e01b  ! 813: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8d9461a1  ! 814: WRPR_PSTATE_I	wrpr	%r17, 0x01a1, %pstate
	.word 0xb3e5216a  ! 816: SAVE_I	save	%r20, 0x0001, %r25
	setx	0xe4b7e0f0000058cd, %g1, %r10
	.word 0x819a8000  ! 820: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e5a15c  ! 824: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e42064  ! 825: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4a021  ! 828: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbab4e02b  ! 829: ORNcc_I	orncc 	%r19, 0x002b, %r29
	.word 0xb88c4000  ! 830: ANDcc_R	andcc 	%r17, %r0, %r28
	.word 0xbde4a05b  ! 831: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e4613d  ! 833: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e4a080  ! 835: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe5a132  ! 836: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e56053  ! 838: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbabc604c  ! 840: XNORcc_I	xnorcc 	%r17, 0x004c, %r29
	.word 0xbbe4a0c7  ! 842: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x87942156  ! 843: WRPR_TT_I	wrpr	%r16, 0x0156, %tt
	setx	data_start_3, %g1, %r17
	.word 0xbe150000  ! 850: OR_R	or 	%r20, %r0, %r31
	.word 0xbde4618d  ! 851: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_2, %g1, %r18
	.word 0x8d95a0e5  ! 854: WRPR_PSTATE_I	wrpr	%r22, 0x00e5, %pstate
	.word 0xb3e4a1e4  ! 855: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_7, %g1, %r20
	.word 0xbde5a109  ! 858: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4a0c0  ! 860: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde56128  ! 862: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e5a179  ! 864: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e421ba  ! 869: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 2)
	mov	1, %r12
	.word 0x8f930000  ! 872: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e4e1b4  ! 875: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbb34d000  ! 877: SRLX_R	srlx	%r19, %r0, %r29
	mov	2, %r12
	.word 0xa1930000  ! 878: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb2d1000  ! 879: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xb9e4a1d5  ! 880: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9518000  ! 881: RDPR_PSTATE	<illegal instruction>
	.word 0xb7510000  ! 889: RDPR_TICK	<illegal instruction>
	.word 0xb5480000  ! 894: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_3, %g1, %r21
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbf504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4211f  ! 908: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4a18c  ! 909: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x839460f6  ! 912: WRPR_TNPC_I	wrpr	%r17, 0x00f6, %tnpc
	.word 0xb7e5e0c7  ! 913: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x819460fe  ! 916: WRPR_TPC_I	wrpr	%r17, 0x00fe, %tpc
	.word 0xbfe52014  ! 918: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0xbf480000  ! 924: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3e5a1d5  ! 926: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4a0fb  ! 929: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8395e1fa  ! 930: WRPR_TNPC_I	wrpr	%r23, 0x01fa, %tnpc
	.word 0xb7e5a0c5  ! 931: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb520000  ! 933: RDPR_PIL	<illegal instruction>
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e4a1b9  ! 943: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5219e  ! 947: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8995216c  ! 949: WRPR_TICK_I	wrpr	%r20, 0x016c, %tick
	.word 0xb3e560cc  ! 950: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e420a9  ! 955: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe4a1b7  ! 958: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbb50c000  ! 963: RDPR_TT	<illegal instruction>
	.word 0xb5e4e0da  ! 964: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 8)
	.word 0xb52cf001  ! 971: SLLX_I	sllx	%r19, 0x0001, %r26
	.word 0xbd508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e1c3  ! 974: WRPR_PSTATE_I	wrpr	%r23, 0x01c3, %pstate
hwintr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_52), 16, 16)) -> intp(0, 0, c)
hwintr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_53), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e4203f  ! 981: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_54), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe46180  ! 983: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_55), 16, 16)) -> intp(0, 0, f)
	mov	0, %r12
	.word 0x8f930000  ! 985: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194a090  ! 989: WRPR_PIL_I	wrpr	%r18, 0x0090, %pil
	.word 0x8595217e  ! 992: WRPR_TSTATE_I	wrpr	%r20, 0x017e, %tstate
hwintr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_56), 16, 16)) -> intp(0, 0, 33)
	.word 0x8995e133  ! 997: WRPR_TICK_I	wrpr	%r23, 0x0133, %tick
	.word 0xbfe4e01a  ! 998: SAVE_I	save	%r19, 0x0001, %r31
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
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 34)
	mov	2, %r12
	.word 0xa1930000  ! 3: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xff3c4000  ! 4: STDF_R	std	%f31, [%r0, %r17]
	setx	0xa39f7a5400008bc3, %g1, %r10
	.word 0x819a8000  ! 5: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb52c1000  ! 7: SLLX_R	sllx	%r16, %r0, %r26
	.word 0x8994605c  ! 8: WRPR_TICK_I	wrpr	%r17, 0x005c, %tick
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 2d)
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595a120  ! 14: WRPR_TSTATE_I	wrpr	%r22, 0x0120, %tstate
	.word 0xbe356089  ! 15: ORN_I	orn 	%r21, 0x0089, %r31
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb3510000  ! 20: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf274c000  ! 24: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xbb355000  ! 27: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xf035a179  ! 29: STH_I	sth	%r24, [%r22 + 0x0179]
	.word 0xb9540000  ! 30: RDPR_GL	<illegal instruction>
	.word 0xb02d4000  ! 31: ANDN_R	andn 	%r21, %r0, %r24
	.word 0x8194e12e  ! 35: WRPR_TPC_I	wrpr	%r19, 0x012e, %tpc
	.word 0xb6b48000  ! 36: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0x899520cc  ! 43: WRPR_TICK_I	wrpr	%r20, 0x00cc, %tick
	.word 0xbd510000  ! 45: RDPR_TICK	rdpr	%tick, %r30
	.word 0x919420c6  ! 46: WRPR_PIL_I	wrpr	%r16, 0x00c6, %pil
	.word 0xb29c8000  ! 49: XORcc_R	xorcc 	%r18, %r0, %r25
	.word 0x8795e1d7  ! 50: WRPR_TT_I	wrpr	%r23, 0x01d7, %tt
	.word 0xf03420f0  ! 52: STH_I	sth	%r24, [%r16 + 0x00f0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 19)
	.word 0xfa3c4000  ! 56: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf62d612a  ! 58: STB_I	stb	%r27, [%r21 + 0x012a]
	.word 0xf62d61d7  ! 59: STB_I	stb	%r27, [%r21 + 0x01d7]
	.word 0xbb3d5000  ! 64: SRAX_R	srax	%r21, %r0, %r29
	.word 0xf83d8000  ! 65: STD_R	std	%r28, [%r22 + %r0]
	.word 0xb83d4000  ! 68: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xb6144000  ! 73: OR_R	or 	%r17, %r0, %r27
	.word 0xbc24c000  ! 75: SUB_R	sub 	%r19, %r0, %r30
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 39)
	.word 0x87952017  ! 80: WRPR_TT_I	wrpr	%r20, 0x0017, %tt
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb77cc400  ! 82: MOVR_R	movre	%r19, %r0, %r27
	.word 0xfe7460a9  ! 85: STX_I	stx	%r31, [%r17 + 0x00a9]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb8148000  ! 88: OR_R	or 	%r18, %r0, %r28
	setx	0x10edbd4400009b0a, %g1, %r10
	.word 0x839a8000  ! 92: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa7460bf  ! 93: STX_I	stx	%r29, [%r17 + 0x00bf]
	setx	0xb5fd4a280000bd5a, %g1, %r10
	.word 0x839a8000  ! 94: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf274a11d  ! 98: STX_I	stx	%r25, [%r18 + 0x011d]
	.word 0x89952005  ! 102: WRPR_TICK_I	wrpr	%r20, 0x0005, %tick
	.word 0x8794204b  ! 108: WRPR_TT_I	wrpr	%r16, 0x004b, %tt
	.word 0xbe1d8000  ! 110: XOR_R	xor 	%r22, %r0, %r31
	.word 0xf024c000  ! 113: STW_R	stw	%r24, [%r19 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 114: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xe37c12ee0000ed43, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9195a0c4  ! 118: WRPR_PIL_I	wrpr	%r22, 0x00c4, %pil
	.word 0xf0244000  ! 121: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb1480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xba44c000  ! 124: ADDC_R	addc 	%r19, %r0, %r29
	.word 0xf23c61ab  ! 125: STD_I	std	%r25, [%r17 + 0x01ab]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 25)
	setx	data_start_1, %g1, %r21
	mov	1, %r12
	.word 0x8f930000  ! 129: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf23d0000  ! 130: STD_R	std	%r25, [%r20 + %r0]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 4)
	setx	0xec9cb20a0000ef9d, %g1, %r10
	.word 0x819a8000  ! 136: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc3da1eb  ! 142: STD_I	std	%r30, [%r22 + 0x01eb]
	.word 0xbcac0000  ! 144: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xf0758000  ! 146: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfe2d2028  ! 147: STB_I	stb	%r31, [%r20 + 0x0028]
	.word 0xf2744000  ! 149: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb48d4000  ! 152: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xfa34e051  ! 154: STH_I	sth	%r29, [%r19 + 0x0051]
	.word 0xf02da152  ! 157: STB_I	stb	%r24, [%r22 + 0x0152]
	.word 0xb5504000  ! 158: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x8395e1df  ! 161: WRPR_TNPC_I	wrpr	%r23, 0x01df, %tnpc
	.word 0xf02c0000  ! 166: STB_R	stb	%r24, [%r16 + %r0]
	.word 0x859521e4  ! 168: WRPR_TSTATE_I	wrpr	%r20, 0x01e4, %tstate
	.word 0xb9355000  ! 173: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xb5641800  ! 175: MOVcc_R	<illegal instruction>
	.word 0xfd3da0c5  ! 178: STDF_I	std	%f30, [0x00c5, %r22]
	.word 0xf63da0fd  ! 183: STD_I	std	%r27, [%r22 + 0x00fd]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfa342036  ! 188: STH_I	sth	%r29, [%r16 + 0x0036]
	.word 0xf4340000  ! 189: STH_R	sth	%r26, [%r16 + %r0]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 3)
	.word 0xf42c60a2  ! 192: STB_I	stb	%r26, [%r17 + 0x00a2]
	.word 0xf035a030  ! 193: STH_I	sth	%r24, [%r22 + 0x0030]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 9)
	.word 0xf02d0000  ! 197: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xbb508000  ! 199: RDPR_TSTATE	rdpr	%tstate, %r29
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 3c)
	setx	0x5bdf033f000078cc, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf13ce05a  ! 211: STDF_I	std	%f24, [0x005a, %r19]
	.word 0xb4842173  ! 216: ADDcc_I	addcc 	%r16, 0x0173, %r26
	.word 0x8594a082  ! 217: WRPR_TSTATE_I	wrpr	%r18, 0x0082, %tstate
	.word 0xf43dc000  ! 221: STD_R	std	%r26, [%r23 + %r0]
	.word 0xfc346092  ! 223: STH_I	sth	%r30, [%r17 + 0x0092]
	.word 0xf2248000  ! 227: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xb1540000  ! 234: RDPR_GL	rdpr	%-, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6c421ac  ! 237: ADDCcc_I	addccc 	%r16, 0x01ac, %r27
	setx	data_start_7, %g1, %r23
	.word 0xb1540000  ! 241: RDPR_GL	<illegal instruction>
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf22da12a  ! 244: STB_I	stb	%r25, [%r22 + 0x012a]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4350000  ! 248: STH_R	sth	%r26, [%r20 + %r0]
	.word 0x9194a174  ! 250: WRPR_PIL_I	wrpr	%r18, 0x0174, %pil
	.word 0xf83de18b  ! 251: STD_I	std	%r28, [%r23 + 0x018b]
	.word 0x8195e0dc  ! 253: WRPR_TPC_I	wrpr	%r23, 0x00dc, %tpc
	.word 0xb02561de  ! 256: SUB_I	sub 	%r21, 0x01de, %r24
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 3d)
	.word 0x87942086  ! 262: WRPR_TT_I	wrpr	%r16, 0x0086, %tt
	.word 0xfe3ca139  ! 263: STD_I	std	%r31, [%r18 + 0x0139]
	.word 0xfa7521d1  ! 266: STX_I	stx	%r29, [%r20 + 0x01d1]
	.word 0xf674c000  ! 275: STX_R	stx	%r27, [%r19 + %r0]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf0240000  ! 281: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfe2d2039  ! 283: STB_I	stb	%r31, [%r20 + 0x0039]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb81d609a  ! 285: XOR_I	xor 	%r21, 0x009a, %r28
	.word 0xf22d4000  ! 286: STB_R	stb	%r25, [%r21 + %r0]
	.word 0x83956194  ! 291: WRPR_TNPC_I	wrpr	%r21, 0x0194, %tnpc
	setx	data_start_7, %g1, %r21
	setx	data_start_2, %g1, %r21
	.word 0xfc2421d1  ! 307: STW_I	stw	%r30, [%r16 + 0x01d1]
	mov	2, %r12
	.word 0xa1930000  ! 310: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 22)
	.word 0x899560d3  ! 312: WRPR_TICK_I	wrpr	%r21, 0x00d3, %tick
	.word 0xf22521d8  ! 313: STW_I	stw	%r25, [%r20 + 0x01d8]
	.word 0xf22d4000  ! 314: STB_R	stb	%r25, [%r21 + %r0]
	setx	0x9fc54cb80000988a, %g1, %r10
	.word 0x839a8000  ! 316: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf53cc000  ! 317: STDF_R	std	%f26, [%r0, %r19]
	setx	data_start_5, %g1, %r19
	.word 0x8d95a1fd  ! 319: WRPR_PSTATE_I	wrpr	%r22, 0x01fd, %pstate
	.word 0xfc244000  ! 324: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xb3510000  ! 327: RDPR_TICK	rdpr	%tick, %r25
	.word 0x879560e0  ! 331: WRPR_TT_I	wrpr	%r21, 0x00e0, %tt
	.word 0xb6140000  ! 332: OR_R	or 	%r16, %r0, %r27
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 21)
	.word 0xf034c000  ! 336: STH_R	sth	%r24, [%r19 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 6)
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 9)
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, b)
	.word 0xb151c000  ! 341: RDPR_TL	rdpr	%tl, %r24
	.word 0xb751c000  ! 352: RDPR_TL	<illegal instruction>
	.word 0x919460b9  ! 362: WRPR_PIL_I	wrpr	%r17, 0x00b9, %pil
	.word 0xb9508000  ! 363: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf42d8000  ! 364: STB_R	stb	%r26, [%r22 + %r0]
	.word 0x8d95a11e  ! 366: WRPR_PSTATE_I	wrpr	%r22, 0x011e, %pstate
	.word 0xb17c0400  ! 367: MOVR_R	movre	%r16, %r0, %r24
	mov	1, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0244000  ! 383: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb3520000  ! 384: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf22d4000  ! 385: STB_R	stb	%r25, [%r21 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 0)
	.word 0xf33d61f1  ! 388: STDF_I	std	%f25, [0x01f1, %r21]
	setx	data_start_5, %g1, %r16
	.word 0xf274e153  ! 390: STX_I	stx	%r25, [%r19 + 0x0153]
	.word 0xf23561e9  ! 395: STH_I	sth	%r25, [%r21 + 0x01e9]
	.word 0xb33df001  ! 396: SRAX_I	srax	%r23, 0x0001, %r25
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x7318d2f80000685a, %g1, %r10
	.word 0x819a8000  ! 402: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0xa1930000  ! 408: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf024e119  ! 410: STW_I	stw	%r24, [%r19 + 0x0119]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 38)
	.word 0xf8744000  ! 415: STX_R	stx	%r28, [%r17 + %r0]
	setx	data_start_4, %g1, %r22
	.word 0xfe25e0f7  ! 417: STW_I	stw	%r31, [%r23 + 0x00f7]
	.word 0xf625a12a  ! 419: STW_I	stw	%r27, [%r22 + 0x012a]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, c)
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 37)
	.word 0xb43d8000  ! 423: XNOR_R	xnor 	%r22, %r0, %r26
	.word 0x879560c6  ! 424: WRPR_TT_I	wrpr	%r21, 0x00c6, %tt
	.word 0x879460f9  ! 426: WRPR_TT_I	wrpr	%r17, 0x00f9, %tt
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 34)
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, f)
	.word 0xb72cd000  ! 430: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xf874e177  ! 431: STX_I	stx	%r28, [%r19 + 0x0177]
	.word 0xf62d60e2  ! 432: STB_I	stb	%r27, [%r21 + 0x00e2]
	.word 0x8d9420b8  ! 433: WRPR_PSTATE_I	wrpr	%r16, 0x00b8, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf33d8000  ! 435: STDF_R	std	%f25, [%r0, %r22]
	.word 0x91946010  ! 437: WRPR_PIL_I	wrpr	%r17, 0x0010, %pil
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf63c4000  ! 442: STD_R	std	%r27, [%r17 + %r0]
	.word 0xff3ca140  ! 447: STDF_I	std	%f31, [0x0140, %r18]
	.word 0x8994e00a  ! 449: WRPR_TICK_I	wrpr	%r19, 0x000a, %tick
	.word 0xf13ca0ae  ! 451: STDF_I	std	%f24, [0x00ae, %r18]
	.word 0x9195e15d  ! 452: WRPR_PIL_I	wrpr	%r23, 0x015d, %pil
	.word 0xbe8561ed  ! 453: ADDcc_I	addcc 	%r21, 0x01ed, %r31
	.word 0xf63421e4  ! 458: STH_I	sth	%r27, [%r16 + 0x01e4]
	mov	2, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xba3c20b7  ! 464: XNOR_I	xnor 	%r16, 0x00b7, %r29
	.word 0x8d95a01a  ! 465: WRPR_PSTATE_I	wrpr	%r22, 0x001a, %pstate
	.word 0x8395e02a  ! 466: WRPR_TNPC_I	wrpr	%r23, 0x002a, %tnpc
	setx	0xb1e797fe0000cf8f, %g1, %r10
	.word 0x839a8000  ! 470: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795211b  ! 474: WRPR_TT_I	wrpr	%r20, 0x011b, %tt
	.word 0xbb520000  ! 475: RDPR_PIL	rdpr	%pil, %r29
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 14)
	.word 0xfc2520d6  ! 479: STW_I	stw	%r30, [%r20 + 0x00d6]
	.word 0xf42c8000  ! 481: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf93cc000  ! 483: STDF_R	std	%f28, [%r0, %r19]
	.word 0xf8358000  ! 484: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf835c000  ! 487: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf23dc000  ! 491: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf03c4000  ! 492: STD_R	std	%r24, [%r17 + %r0]
	.word 0xfc340000  ! 494: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xbd51c000  ! 497: RDPR_TL	<illegal instruction>
	.word 0xfb3ce1a9  ! 498: STDF_I	std	%f29, [0x01a9, %r19]
	setx	data_start_1, %g1, %r16
	.word 0xf8244000  ! 501: STW_R	stw	%r28, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d942080  ! 503: WRPR_PSTATE_I	wrpr	%r16, 0x0080, %pstate
	.word 0xf075e067  ! 504: STX_I	stx	%r24, [%r23 + 0x0067]
	setx	data_start_4, %g1, %r17
	.word 0xbd540000  ! 511: RDPR_GL	rdpr	%-, %r30
	setx	0xf22ff77700000e5c, %g1, %r10
	.word 0x819a8000  ! 515: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf474e1d2  ! 516: STX_I	stx	%r26, [%r19 + 0x01d2]
	.word 0xfa2d20a3  ! 518: STB_I	stb	%r29, [%r20 + 0x00a3]
	.word 0xfc34c000  ! 521: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xb551c000  ! 522: RDPR_TL	rdpr	%tl, %r26
	mov	2, %r12
	.word 0x8f930000  ! 524: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfd3c4000  ! 526: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfa348000  ! 527: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfb3c4000  ! 529: STDF_R	std	%f29, [%r0, %r17]
	mov	1, %r12
	.word 0xa1930000  ! 531: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, f)
	.word 0xff3da042  ! 536: STDF_I	std	%f31, [0x0042, %r22]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c4000  ! 542: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xfe2ca001  ! 546: STB_I	stb	%r31, [%r18 + 0x0001]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 10)
	.word 0xfe750000  ! 549: STX_R	stx	%r31, [%r20 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, c)
	.word 0xb89cc000  ! 554: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0x8d952054  ! 560: WRPR_PSTATE_I	wrpr	%r20, 0x0054, %pstate
	.word 0xb7480000  ! 563: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf4758000  ! 569: STX_R	stx	%r26, [%r22 + %r0]
	.word 0x9195a083  ! 572: WRPR_PIL_I	wrpr	%r22, 0x0083, %pil
	.word 0xb5508000  ! 578: RDPR_TSTATE	rdpr	%tstate, %r26
	mov	2, %r12
	.word 0x8f930000  ! 580: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995218d  ! 582: WRPR_TICK_I	wrpr	%r20, 0x018d, %tick
	.word 0xf82c8000  ! 583: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xbe340000  ! 584: SUBC_R	orn 	%r16, %r0, %r31
	.word 0xfe3d8000  ! 585: STD_R	std	%r31, [%r22 + %r0]
	.word 0xfe74215f  ! 587: STX_I	stx	%r31, [%r16 + 0x015f]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 25)
	.word 0x81956111  ! 589: WRPR_TPC_I	wrpr	%r21, 0x0111, %tpc
	.word 0xb3500000  ! 590: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf83d8000  ! 591: STD_R	std	%r28, [%r22 + %r0]
	.word 0x9194e13c  ! 597: WRPR_PIL_I	wrpr	%r19, 0x013c, %pil
	.word 0xb7520000  ! 599: RDPR_PIL	rdpr	%pil, %r27
	mov	1, %r12
	.word 0xa1930000  ! 600: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa344000  ! 601: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb1500000  ! 605: RDPR_TPC	rdpr	%tpc, %r24
	setx	data_start_0, %g1, %r22
	.word 0xb5540000  ! 609: RDPR_GL	<illegal instruction>
	.word 0xfc346030  ! 615: STH_I	sth	%r30, [%r17 + 0x0030]
	.word 0x8794a0dc  ! 617: WRPR_TT_I	wrpr	%r18, 0x00dc, %tt
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe3c2101  ! 622: STD_I	std	%r31, [%r16 + 0x0101]
	.word 0xfa2ca0df  ! 624: STB_I	stb	%r29, [%r18 + 0x00df]
	.word 0xbb520000  ! 626: RDPR_PIL	rdpr	%pil, %r29
	.word 0xfe3ca037  ! 629: STD_I	std	%r31, [%r18 + 0x0037]
	.word 0xf2346013  ! 630: STH_I	sth	%r25, [%r17 + 0x0013]
	.word 0xff3d4000  ! 631: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb5480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa2c2102  ! 634: STB_I	stb	%r29, [%r16 + 0x0102]
	.word 0x8794a198  ! 635: WRPR_TT_I	wrpr	%r18, 0x0198, %tt
	.word 0xfc254000  ! 637: STW_R	stw	%r30, [%r21 + %r0]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 18)
	.word 0xf33d2033  ! 640: STDF_I	std	%f25, [0x0033, %r20]
	mov	1, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf33de199  ! 646: STDF_I	std	%f25, [0x0199, %r23]
	.word 0xb895c000  ! 647: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xbd344000  ! 649: SRL_R	srl 	%r17, %r0, %r30
	.word 0x8395e047  ! 650: WRPR_TNPC_I	wrpr	%r23, 0x0047, %tnpc
	.word 0xf13ce0ba  ! 651: STDF_I	std	%f24, [0x00ba, %r19]
	.word 0xfc358000  ! 653: STH_R	sth	%r30, [%r22 + %r0]
	setx	data_start_2, %g1, %r22
	.word 0xba0560fd  ! 665: ADD_I	add 	%r21, 0x00fd, %r29
	.word 0xb6a44000  ! 670: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xf4354000  ! 671: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xbd641800  ! 673: MOVcc_R	<illegal instruction>
	.word 0xfa24a0ef  ! 674: STW_I	stw	%r29, [%r18 + 0x00ef]
	.word 0xb485e17d  ! 675: ADDcc_I	addcc 	%r23, 0x017d, %r26
	.word 0x8d95611d  ! 679: WRPR_PSTATE_I	wrpr	%r21, 0x011d, %pstate
	.word 0xb3352001  ! 681: SRL_I	srl 	%r20, 0x0001, %r25
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb69d612f  ! 686: XORcc_I	xorcc 	%r21, 0x012f, %r27
	mov	2, %r12
	.word 0xa1930000  ! 688: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf83d0000  ! 689: STD_R	std	%r28, [%r20 + %r0]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 32)
	.word 0xb7480000  ! 694: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1518000  ! 696: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf4754000  ! 701: STX_R	stx	%r26, [%r21 + %r0]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 34)
	.word 0xf234c000  ! 703: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfc744000  ! 706: STX_R	stx	%r30, [%r17 + %r0]
	setx	0x50060b1000005d07, %g1, %r10
	.word 0x819a8000  ! 707: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8994e1ae  ! 710: WRPR_TICK_I	wrpr	%r19, 0x01ae, %tick
	.word 0x8d946049  ! 711: WRPR_PSTATE_I	wrpr	%r17, 0x0049, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf43da1c0  ! 715: STD_I	std	%r26, [%r22 + 0x01c0]
	.word 0xba24e0d3  ! 717: SUB_I	sub 	%r19, 0x00d3, %r29
	.word 0x8395a133  ! 718: WRPR_TNPC_I	wrpr	%r22, 0x0133, %tnpc
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb01d8000  ! 720: XOR_R	xor 	%r22, %r0, %r24
	.word 0xfe746179  ! 721: STX_I	stx	%r31, [%r17 + 0x0179]
	.word 0xfe2460d6  ! 722: STW_I	stw	%r31, [%r17 + 0x00d6]
	.word 0xbc1c201a  ! 727: XOR_I	xor 	%r16, 0x001a, %r30
	.word 0xfa250000  ! 729: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfc348000  ! 730: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf274e047  ! 731: STX_I	stx	%r25, [%r19 + 0x0047]
	.word 0xb7520000  ! 732: RDPR_PIL	rdpr	%pil, %r27
	setx	data_start_7, %g1, %r18
	.word 0xbd500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xf22d8000  ! 736: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf62de0f8  ! 739: STB_I	stb	%r27, [%r23 + 0x00f8]
	.word 0xf13c0000  ! 742: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf82d8000  ! 744: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfc34c000  ! 747: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf4258000  ! 748: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf6244000  ! 749: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xb1540000  ! 751: RDPR_GL	<illegal instruction>
	.word 0x8395e0d6  ! 753: WRPR_TNPC_I	wrpr	%r23, 0x00d6, %tnpc
	.word 0xf43de162  ! 756: STD_I	std	%r26, [%r23 + 0x0162]
	.word 0xbf510000  ! 761: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf875e193  ! 763: STX_I	stx	%r28, [%r23 + 0x0193]
	mov	2, %r12
	.word 0x8f930000  ! 764: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf474214c  ! 766: STX_I	stx	%r26, [%r16 + 0x014c]
	.word 0xfc3d8000  ! 767: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb2a4e198  ! 768: SUBcc_I	subcc 	%r19, 0x0198, %r25
	.word 0xf02d207f  ! 769: STB_I	stb	%r24, [%r20 + 0x007f]
	.word 0xfa2c6000  ! 772: STB_I	stb	%r29, [%r17 + 0x0000]
	.word 0x89942061  ! 773: WRPR_TICK_I	wrpr	%r16, 0x0061, %tick
	.word 0xb0240000  ! 774: SUB_R	sub 	%r16, %r0, %r24
	.word 0xf425a010  ! 775: STW_I	stw	%r26, [%r22 + 0x0010]
	.word 0xf435c000  ! 780: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf23461a6  ! 782: STH_I	sth	%r25, [%r17 + 0x01a6]
	.word 0x8195e046  ! 786: WRPR_TPC_I	wrpr	%r23, 0x0046, %tpc
	.word 0x8795a0c6  ! 787: WRPR_TT_I	wrpr	%r22, 0x00c6, %tt
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 5)
	.word 0xfc2d8000  ! 792: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf4244000  ! 794: STW_R	stw	%r26, [%r17 + %r0]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 23)
	.word 0xfa2c6096  ! 796: STB_I	stb	%r29, [%r17 + 0x0096]
	.word 0xfc2ce14a  ! 798: STB_I	stb	%r30, [%r19 + 0x014a]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, c)
	.word 0xb8bc210a  ! 800: XNORcc_I	xnorcc 	%r16, 0x010a, %r28
	.word 0xfc2c6088  ! 803: STB_I	stb	%r30, [%r17 + 0x0088]
	.word 0xf13d6009  ! 805: STDF_I	std	%f24, [0x0009, %r21]
	.word 0xf43c2013  ! 806: STD_I	std	%r26, [%r16 + 0x0013]
	.word 0xf234a118  ! 809: STH_I	sth	%r25, [%r18 + 0x0118]
	.word 0xbb520000  ! 811: RDPR_PIL	rdpr	%pil, %r29
	.word 0x8d94601d  ! 814: WRPR_PSTATE_I	wrpr	%r17, 0x001d, %pstate
	.word 0xf62d605f  ! 818: STB_I	stb	%r27, [%r21 + 0x005f]
	setx	0xccb412d400000d94, %g1, %r10
	.word 0x819a8000  ! 820: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 18)
	.word 0xb8b5a19c  ! 829: ORNcc_I	orncc 	%r22, 0x019c, %r28
	.word 0xb88c4000  ! 830: ANDcc_R	andcc 	%r17, %r0, %r28
	.word 0xfc74c000  ! 832: STX_R	stx	%r30, [%r19 + %r0]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 4)
	.word 0xb4bde191  ! 840: XNORcc_I	xnorcc 	%r23, 0x0191, %r26
	.word 0xf62cc000  ! 841: STB_R	stb	%r27, [%r19 + %r0]
	.word 0x8794e085  ! 843: WRPR_TT_I	wrpr	%r19, 0x0085, %tt
	setx	data_start_7, %g1, %r16
	.word 0xb2150000  ! 850: OR_R	or 	%r20, %r0, %r25
	setx	data_start_2, %g1, %r19
	.word 0x8d94a0ee  ! 854: WRPR_PSTATE_I	wrpr	%r18, 0x00ee, %pstate
	setx	data_start_3, %g1, %r19
	.word 0xf23c20d4  ! 865: STD_I	std	%r25, [%r16 + 0x00d4]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 2a)
	mov	0, %r12
	.word 0x8f930000  ! 872: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe34c000  ! 873: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf835a1c4  ! 876: STH_I	sth	%r28, [%r22 + 0x01c4]
	.word 0xb7345000  ! 877: SRLX_R	srlx	%r17, %r0, %r27
	mov	1, %r12
	.word 0xa1930000  ! 878: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb72c5000  ! 879: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xb9518000  ! 881: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfe758000  ! 883: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf42d213a  ! 885: STB_I	stb	%r26, [%r20 + 0x013a]
	.word 0xfc2d4000  ! 886: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfc350000  ! 888: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xbf510000  ! 889: RDPR_TICK	<illegal instruction>
	.word 0xf83ce043  ! 890: STD_I	std	%r28, [%r19 + 0x0043]
	.word 0xb1480000  ! 894: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfc74a04a  ! 897: STX_I	stx	%r30, [%r18 + 0x004a]
	setx	data_start_5, %g1, %r21
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 18)
	.word 0xb9504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xfa740000  ! 910: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf2340000  ! 911: STH_R	sth	%r25, [%r16 + %r0]
	.word 0x839520b9  ! 912: WRPR_TNPC_I	wrpr	%r20, 0x00b9, %tnpc
	.word 0x819520f2  ! 916: WRPR_TPC_I	wrpr	%r20, 0x00f2, %tpc
	.word 0xb9504000  ! 921: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbb500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0xf624e063  ! 923: STW_I	stw	%r27, [%r19 + 0x0063]
	.word 0xbd480000  ! 924: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa3da11e  ! 927: STD_I	std	%r29, [%r22 + 0x011e]
	.word 0x83942082  ! 930: WRPR_TNPC_I	wrpr	%r16, 0x0082, %tnpc
	.word 0xbb520000  ! 933: RDPR_PIL	rdpr	%pil, %r29
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, d)
	.word 0xfe244000  ! 936: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf824e048  ! 937: STW_I	stw	%r28, [%r19 + 0x0048]
	.word 0xfc24c000  ! 938: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf4754000  ! 939: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfe3d4000  ! 941: STD_R	std	%r31, [%r21 + %r0]
	.word 0xfc248000  ! 946: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf83d8000  ! 948: STD_R	std	%r28, [%r22 + %r0]
	.word 0x899560fa  ! 949: WRPR_TICK_I	wrpr	%r21, 0x00fa, %tick
	.word 0xf035e080  ! 951: STH_I	sth	%r24, [%r23 + 0x0080]
	.word 0xfc25c000  ! 952: STW_R	stw	%r30, [%r23 + %r0]
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 36)
	.word 0xfe2d4000  ! 956: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xfd3d4000  ! 957: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf224e1e7  ! 959: STW_I	stw	%r25, [%r19 + 0x01e7]
	.word 0xf93de12f  ! 962: STDF_I	std	%f28, [0x012f, %r23]
	.word 0xbf50c000  ! 963: RDPR_TT	rdpr	%tt, %r31
	.word 0xf83c4000  ! 966: STD_R	std	%r28, [%r17 + %r0]
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbf2c3001  ! 971: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xb3508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a1d3  ! 974: WRPR_PSTATE_I	wrpr	%r22, 0x01d3, %pstate
hwintr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_52), 16, 16)) -> intp(3, 0, c)
hwintr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_53), 16, 16)) -> intp(3, 0, 37)
	.word 0xfa358000  ! 978: STH_R	sth	%r29, [%r22 + %r0]
hwintr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_54), 16, 16)) -> intp(3, 0, 25)
hwintr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_55), 16, 16)) -> intp(3, 0, 3a)
	mov	1, %r12
	.word 0x8f930000  ! 985: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9194a0d1  ! 989: WRPR_PIL_I	wrpr	%r18, 0x00d1, %pil
	.word 0x85942035  ! 992: WRPR_TSTATE_I	wrpr	%r16, 0x0035, %tstate
	.word 0xfe74a03e  ! 994: STX_I	stx	%r31, [%r18 + 0x003e]
hwintr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_56), 16, 16)) -> intp(3, 0, 2b)
	.word 0x8994a012  ! 997: WRPR_TICK_I	wrpr	%r18, 0x0012, %tick
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
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 17)
	mov	1, %r12
	.word 0xa1930000  ! 3: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x9135a0970000a9c4, %g1, %r10
	.word 0x819a8000  ! 5: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb12d5000  ! 7: SLLX_R	sllx	%r21, %r0, %r24
	.word 0x8995600b  ! 8: WRPR_TICK_I	wrpr	%r21, 0x000b, %tick
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, a)
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf445607c  ! 13: LDSW_I	ldsw	[%r21 + 0x007c], %r26
	.word 0x85942037  ! 14: WRPR_TSTATE_I	wrpr	%r16, 0x0037, %tstate
	.word 0xb634e0f4  ! 15: ORN_I	orn 	%r19, 0x00f4, %r27
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 19)
	.word 0xb5510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0xf64dc000  ! 26: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xb935d000  ! 27: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xfa1d0000  ! 28: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb5540000  ! 30: RDPR_GL	<illegal instruction>
	.word 0xb22c0000  ! 31: ANDN_R	andn 	%r16, %r0, %r25
	.word 0xf01ca16f  ! 33: LDD_I	ldd	[%r18 + 0x016f], %r24
	.word 0x8194a050  ! 35: WRPR_TPC_I	wrpr	%r18, 0x0050, %tpc
	.word 0xb4b44000  ! 36: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0xf80c0000  ! 41: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0x899461bf  ! 43: WRPR_TICK_I	wrpr	%r17, 0x01bf, %tick
	.word 0xf65c8000  ! 44: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xb7510000  ! 45: RDPR_TICK	<illegal instruction>
	.word 0x9194215d  ! 46: WRPR_PIL_I	wrpr	%r16, 0x015d, %pil
	.word 0xf20ce135  ! 47: LDUB_I	ldub	[%r19 + 0x0135], %r25
	.word 0xba9c0000  ! 49: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0x8795a031  ! 50: WRPR_TT_I	wrpr	%r22, 0x0031, %tt
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 30)
	.word 0xfe4ca1d2  ! 61: LDSB_I	ldsb	[%r18 + 0x01d2], %r31
	.word 0xfa0c8000  ! 62: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf6046142  ! 63: LDUW_I	lduw	[%r17 + 0x0142], %r27
	.word 0xb73d9000  ! 64: SRAX_R	srax	%r22, %r0, %r27
	.word 0xb83d4000  ! 68: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xfc44a0e7  ! 70: LDSW_I	ldsw	[%r18 + 0x00e7], %r30
	.word 0xf41cc000  ! 71: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xf51d8000  ! 72: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xb8150000  ! 73: OR_R	or 	%r20, %r0, %r28
	.word 0xf2040000  ! 74: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xbc25c000  ! 75: SUB_R	sub 	%r23, %r0, %r30
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, a)
	.word 0xfc14a1a0  ! 77: LDUH_I	lduh	[%r18 + 0x01a0], %r30
	.word 0xf805614a  ! 78: LDUW_I	lduw	[%r21 + 0x014a], %r28
	.word 0xfa148000  ! 79: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0x8795a196  ! 80: WRPR_TT_I	wrpr	%r22, 0x0196, %tt
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb37d4400  ! 82: MOVR_R	movre	%r21, %r0, %r25
	.word 0xf45c61fb  ! 83: LDX_I	ldx	[%r17 + 0x01fb], %r26
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb215c000  ! 88: OR_R	or 	%r23, %r0, %r25
	setx	0x4d1bde5700006acb, %g1, %r10
	.word 0x839a8000  ! 92: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xc2db4df000009801, %g1, %r10
	.word 0x839a8000  ! 94: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa5c60c6  ! 97: LDX_I	ldx	[%r17 + 0x00c6], %r29
	.word 0xf85dc000  ! 99: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0x8994619a  ! 102: WRPR_TICK_I	wrpr	%r17, 0x019a, %tick
	.word 0xfe5c8000  ! 106: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0x8795603e  ! 108: WRPR_TT_I	wrpr	%r21, 0x003e, %tt
	.word 0xba1dc000  ! 110: XOR_R	xor 	%r23, %r0, %r29
	mov	1, %r12
	.word 0xa1930000  ! 114: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xacd4c7a00005bc9, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x91946139  ! 118: WRPR_PIL_I	wrpr	%r17, 0x0139, %pil
	.word 0xbf480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb2458000  ! 124: ADDC_R	addc 	%r22, %r0, %r25
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 10)
	setx	data_start_0, %g1, %r16
	mov	0, %r12
	.word 0x8f930000  ! 129: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 23)
	setx	0xfee66af500000c96, %g1, %r10
	.word 0x819a8000  ! 136: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0554000  ! 139: LDSH_R	ldsh	[%r21 + %r0], %r24
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, e)
	.word 0xb2ad0000  ! 144: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xfc556003  ! 151: LDSH_I	ldsh	[%r21 + 0x0003], %r30
	.word 0xba8c0000  ! 152: ANDcc_R	andcc 	%r16, %r0, %r29
	.word 0xb7504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x8394a0ea  ! 161: WRPR_TNPC_I	wrpr	%r18, 0x00ea, %tnpc
	.word 0xf44de0ee  ! 162: LDSB_I	ldsb	[%r23 + 0x00ee], %r26
	.word 0xf24d0000  ! 164: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0x85942014  ! 168: WRPR_TSTATE_I	wrpr	%r16, 0x0014, %tstate
	.word 0xf04ca1be  ! 169: LDSB_I	ldsb	[%r18 + 0x01be], %r24
	.word 0xf04c8000  ! 170: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xbd351000  ! 173: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xf85c217b  ! 174: LDX_I	ldx	[%r16 + 0x017b], %r28
	.word 0xb7641800  ! 175: MOVcc_R	<illegal instruction>
	.word 0xf4558000  ! 179: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xf65dc000  ! 181: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf8152156  ! 184: LDUH_I	lduh	[%r20 + 0x0156], %r28
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, b)
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 22)
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 21)
	.word 0xf91dc000  ! 198: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xbf508000  ! 199: RDPR_TSTATE	<illegal instruction>
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 2c)
	setx	0x87e47e4b00005c85, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa1c2042  ! 208: LDD_I	ldd	[%r16 + 0x0042], %r29
	.word 0xfe5d6128  ! 210: LDX_I	ldx	[%r21 + 0x0128], %r31
	.word 0xf20cc000  ! 215: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xb484e1cf  ! 216: ADDcc_I	addcc 	%r19, 0x01cf, %r26
	.word 0x85952083  ! 217: WRPR_TSTATE_I	wrpr	%r20, 0x0083, %tstate
	.word 0xfa548000  ! 219: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf20d8000  ! 222: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf6148000  ! 224: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xfc05a197  ! 226: LDUW_I	lduw	[%r22 + 0x0197], %r30
	.word 0xf0148000  ! 229: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfc55e109  ! 233: LDSH_I	ldsh	[%r23 + 0x0109], %r30
	.word 0xbd540000  ! 234: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbec5a10c  ! 237: ADDCcc_I	addccc 	%r22, 0x010c, %r31
	setx	data_start_0, %g1, %r18
	.word 0xbf540000  ! 241: RDPR_GL	<illegal instruction>
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, d)
	.word 0xf25dc000  ! 243: LDX_R	ldx	[%r23 + %r0], %r25
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 24)
	.word 0x919560d9  ! 250: WRPR_PIL_I	wrpr	%r21, 0x00d9, %pil
	.word 0xfc45c000  ! 252: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0x8195a12e  ! 253: WRPR_TPC_I	wrpr	%r22, 0x012e, %tpc
	.word 0xba24200e  ! 256: SUB_I	sub 	%r16, 0x000e, %r29
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, e)
	.word 0x87942008  ! 262: WRPR_TT_I	wrpr	%r16, 0x0008, %tt
	.word 0xf64ce1c4  ! 267: LDSB_I	ldsb	[%r19 + 0x01c4], %r27
	.word 0xf00de075  ! 268: LDUB_I	ldub	[%r23 + 0x0075], %r24
	.word 0xfe142060  ! 269: LDUH_I	lduh	[%r16 + 0x0060], %r31
	.word 0xfe1d6169  ! 276: LDD_I	ldd	[%r21 + 0x0169], %r31
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 10)
	.word 0xfc45a137  ! 282: LDSW_I	ldsw	[%r22 + 0x0137], %r30
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 17)
	.word 0xbc1c61cf  ! 285: XOR_I	xor 	%r17, 0x01cf, %r30
	.word 0xf20cc000  ! 288: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0x8395e0a2  ! 291: WRPR_TNPC_I	wrpr	%r23, 0x00a2, %tnpc
	setx	data_start_0, %g1, %r17
	.word 0xfe5ce03e  ! 295: LDX_I	ldx	[%r19 + 0x003e], %r31
	.word 0xf81c4000  ! 299: LDD_R	ldd	[%r17 + %r0], %r28
	.word 0xf61d8000  ! 302: LDD_R	ldd	[%r22 + %r0], %r27
	setx	data_start_5, %g1, %r21
	mov	2, %r12
	.word 0xa1930000  ! 310: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 30)
	.word 0x8994e1b0  ! 312: WRPR_TICK_I	wrpr	%r19, 0x01b0, %tick
	setx	0x6ffef13f00005a59, %g1, %r10
	.word 0x839a8000  ! 316: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_7, %g1, %r19
	.word 0x8d956092  ! 319: WRPR_PSTATE_I	wrpr	%r21, 0x0092, %pstate
	.word 0xf644a188  ! 322: LDSW_I	ldsw	[%r18 + 0x0188], %r27
	.word 0xfa44c000  ! 325: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xbd510000  ! 327: RDPR_TICK	<illegal instruction>
	.word 0x8794a1eb  ! 331: WRPR_TT_I	wrpr	%r18, 0x01eb, %tt
	.word 0xbe148000  ! 332: OR_R	or 	%r18, %r0, %r31
	.word 0xf004e18c  ! 334: LDUW_I	lduw	[%r19 + 0x018c], %r24
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, c)
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 2b)
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 26)
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 35)
	.word 0xb151c000  ! 341: RDPR_TL	<illegal instruction>
	.word 0xfe5c4000  ! 342: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xfc4d2123  ! 348: LDSB_I	ldsb	[%r20 + 0x0123], %r30
	.word 0xb351c000  ! 352: RDPR_TL	<illegal instruction>
	.word 0xf81c8000  ! 353: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xf85da19b  ! 354: LDX_I	ldx	[%r22 + 0x019b], %r28
	.word 0xf20dc000  ! 356: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfa5c610a  ! 360: LDX_I	ldx	[%r17 + 0x010a], %r29
	.word 0xfc0ce1bf  ! 361: LDUB_I	ldub	[%r19 + 0x01bf], %r30
	.word 0x919521de  ! 362: WRPR_PIL_I	wrpr	%r20, 0x01de, %pil
	.word 0xb9508000  ! 363: RDPR_TSTATE	<illegal instruction>
	.word 0xf2154000  ! 365: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0x8d9420ad  ! 366: WRPR_PSTATE_I	wrpr	%r16, 0x00ad, %pstate
	.word 0xb37d0400  ! 367: MOVR_R	movre	%r20, %r0, %r25
	mov	2, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa150000  ! 370: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf854a0a0  ! 372: LDSH_I	ldsh	[%r18 + 0x00a0], %r28
	.word 0xf51cc000  ! 373: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf45ce0fe  ! 374: LDX_I	ldx	[%r19 + 0x00fe], %r26
	.word 0xf0442050  ! 376: LDSW_I	ldsw	[%r16 + 0x0050], %r24
	.word 0xfe042082  ! 379: LDUW_I	lduw	[%r16 + 0x0082], %r31
	.word 0xfc5c0000  ! 380: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xfc0ce16a  ! 381: LDUB_I	ldub	[%r19 + 0x016a], %r30
	.word 0xb3520000  ! 384: RDPR_PIL	<illegal instruction>
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_7, %g1, %r16
	.word 0xbb3cb001  ! 396: SRAX_I	srax	%r18, 0x0001, %r29
	.word 0xfe04e018  ! 397: LDUW_I	lduw	[%r19 + 0x0018], %r31
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0xd03b4e9a00001c58, %g1, %r10
	.word 0x819a8000  ! 402: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa1520c7  ! 407: LDUH_I	lduh	[%r20 + 0x00c7], %r29
	mov	2, %r12
	.word 0xa1930000  ! 408: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 12)
	setx	data_start_3, %g1, %r19
	.word 0xfc4ca13c  ! 420: LDSB_I	ldsb	[%r18 + 0x013c], %r30
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 26)
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, d)
	.word 0xb03d4000  ! 423: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0x8794a0d8  ! 424: WRPR_TT_I	wrpr	%r18, 0x00d8, %tt
	.word 0x8795618e  ! 426: WRPR_TT_I	wrpr	%r21, 0x018e, %tt
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 0)
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 33)
	.word 0xf20d2109  ! 429: LDUB_I	ldub	[%r20 + 0x0109], %r25
	.word 0xb32dd000  ! 430: SLLX_R	sllx	%r23, %r0, %r25
	.word 0x8d94a10e  ! 433: WRPR_PSTATE_I	wrpr	%r18, 0x010e, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e165  ! 437: WRPR_PIL_I	wrpr	%r19, 0x0165, %pil
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 4)
	.word 0xf81ce0c1  ! 439: LDD_I	ldd	[%r19 + 0x00c1], %r28
	.word 0xf804616f  ! 445: LDUW_I	lduw	[%r17 + 0x016f], %r28
	.word 0xfb1ce034  ! 448: LDDF_I	ldd	[%r19, 0x0034], %f29
	.word 0x8995201f  ! 449: WRPR_TICK_I	wrpr	%r20, 0x001f, %tick
	.word 0x919560cf  ! 452: WRPR_PIL_I	wrpr	%r21, 0x00cf, %pil
	.word 0xba85e1e9  ! 453: ADDcc_I	addcc 	%r23, 0x01e9, %r29
	.word 0xf80520cc  ! 454: LDUW_I	lduw	[%r20 + 0x00cc], %r28
	.word 0xfe5dc000  ! 456: LDX_R	ldx	[%r23 + %r0], %r31
	mov	1, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8448000  ! 461: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf2448000  ! 463: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xb63d219b  ! 464: XNOR_I	xnor 	%r20, 0x019b, %r27
	.word 0x8d95e1eb  ! 465: WRPR_PSTATE_I	wrpr	%r23, 0x01eb, %pstate
	.word 0x839420d5  ! 466: WRPR_TNPC_I	wrpr	%r16, 0x00d5, %tnpc
	.word 0xf60d4000  ! 467: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf71d0000  ! 469: LDDF_R	ldd	[%r20, %r0], %f27
	setx	0x2ea52f3b00007c06, %g1, %r10
	.word 0x839a8000  ! 470: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879420ec  ! 474: WRPR_TT_I	wrpr	%r16, 0x00ec, %tt
	.word 0xb1520000  ! 475: RDPR_PIL	<illegal instruction>
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf2446068  ! 488: LDSW_I	ldsw	[%r17 + 0x0068], %r25
	.word 0xf01c6110  ! 489: LDD_I	ldd	[%r17 + 0x0110], %r24
	.word 0xb151c000  ! 497: RDPR_TL	<illegal instruction>
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94a18c  ! 503: WRPR_PSTATE_I	wrpr	%r18, 0x018c, %pstate
	setx	data_start_4, %g1, %r18
	.word 0xb1540000  ! 511: RDPR_GL	<illegal instruction>
	setx	0xf511e79e0000bf4b, %g1, %r10
	.word 0x819a8000  ! 515: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf24d60a4  ! 517: LDSB_I	ldsb	[%r21 + 0x00a4], %r25
	.word 0xf40cc000  ! 519: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xf05c0000  ! 520: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xbd51c000  ! 522: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 524: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4058000  ! 525: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfa1c4000  ! 530: LDD_R	ldd	[%r17 + %r0], %r29
	mov	1, %r12
	.word 0xa1930000  ! 531: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe440000  ! 532: LDSW_R	ldsw	[%r16 + %r0], %r31
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 29)
	.word 0xf01ce199  ! 537: LDD_I	ldd	[%r19 + 0x0199], %r24
	.word 0xf854e0e1  ! 538: LDSH_I	ldsh	[%r19 + 0x00e1], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4552190  ! 541: LDSH_I	ldsh	[%r20 + 0x0190], %r26
	.word 0xfe1c214a  ! 544: LDD_I	ldd	[%r16 + 0x014a], %r31
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc5d2139  ! 548: LDX_I	ldx	[%r20 + 0x0139], %r30
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 36)
	.word 0xb89d0000  ! 554: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xf04da1b8  ! 557: LDSB_I	ldsb	[%r22 + 0x01b8], %r24
	.word 0x8d94a0ec  ! 560: WRPR_PSTATE_I	wrpr	%r18, 0x00ec, %pstate
	.word 0xbd480000  ! 563: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf31da0b9  ! 568: LDDF_I	ldd	[%r22, 0x00b9], %f25
	.word 0x9195e01f  ! 572: WRPR_PIL_I	wrpr	%r23, 0x001f, %pil
	.word 0xfc0da175  ! 575: LDUB_I	ldub	[%r22 + 0x0175], %r30
	.word 0xb7508000  ! 578: RDPR_TSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 580: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995a1f5  ! 582: WRPR_TICK_I	wrpr	%r22, 0x01f5, %tick
	.word 0xb8354000  ! 584: SUBC_R	orn 	%r21, %r0, %r28
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 20)
	.word 0x81946147  ! 589: WRPR_TPC_I	wrpr	%r17, 0x0147, %tpc
	.word 0xbb500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0xf20de1e4  ! 592: LDUB_I	ldub	[%r23 + 0x01e4], %r25
	.word 0xfc5c4000  ! 593: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xfe1da1e4  ! 595: LDD_I	ldd	[%r22 + 0x01e4], %r31
	.word 0x9195e12c  ! 597: WRPR_PIL_I	wrpr	%r23, 0x012c, %pil
	.word 0xfa4d21a0  ! 598: LDSB_I	ldsb	[%r20 + 0x01a0], %r29
	.word 0xbf520000  ! 599: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 600: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa558000  ! 604: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb1500000  ! 605: RDPR_TPC	<illegal instruction>
	setx	data_start_5, %g1, %r23
	.word 0xb7540000  ! 609: RDPR_GL	<illegal instruction>
	.word 0x8795e0c5  ! 617: WRPR_TT_I	wrpr	%r23, 0x00c5, %tt
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 33)
	.word 0xb3520000  ! 626: RDPR_PIL	<illegal instruction>
	.word 0xb7480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8795611a  ! 635: WRPR_TT_I	wrpr	%r21, 0x011a, %tt
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 3f)
	mov	0, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc15a117  ! 644: LDUH_I	lduh	[%r22 + 0x0117], %r30
	.word 0xf6148000  ! 645: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xb8954000  ! 647: ORcc_R	orcc 	%r21, %r0, %r28
	.word 0xb734c000  ! 649: SRL_R	srl 	%r19, %r0, %r27
	.word 0x839520e2  ! 650: WRPR_TNPC_I	wrpr	%r20, 0x00e2, %tnpc
	.word 0xf8052150  ! 652: LDUW_I	lduw	[%r20 + 0x0150], %r28
	.word 0xf844e1e8  ! 654: LDSW_I	ldsw	[%r19 + 0x01e8], %r28
	setx	data_start_3, %g1, %r23
	.word 0xf214c000  ! 660: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfc0c2002  ! 661: LDUB_I	ldub	[%r16 + 0x0002], %r30
	.word 0xfc4561b6  ! 662: LDSW_I	ldsw	[%r21 + 0x01b6], %r30
	.word 0xb4046068  ! 665: ADD_I	add 	%r17, 0x0068, %r26
	.word 0xfd1c0000  ! 666: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xf91de114  ! 667: LDDF_I	ldd	[%r23, 0x0114], %f28
	.word 0xbea4c000  ! 670: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xb3641800  ! 673: MOVcc_R	<illegal instruction>
	.word 0xb6856197  ! 675: ADDcc_I	addcc 	%r21, 0x0197, %r27
	.word 0xf71de19f  ! 676: LDDF_I	ldd	[%r23, 0x019f], %f27
	.word 0x8d95e163  ! 679: WRPR_PSTATE_I	wrpr	%r23, 0x0163, %pstate
	.word 0xb335a001  ! 681: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xf01ca07f  ! 682: LDD_I	ldd	[%r18 + 0x007f], %r24
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, f)
	.word 0xf054a0bb  ! 685: LDSH_I	ldsh	[%r18 + 0x00bb], %r24
	.word 0xbe9ca0d4  ! 686: XORcc_I	xorcc 	%r18, 0x00d4, %r31
	mov	0, %r12
	.word 0xa1930000  ! 688: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb3480000  ! 694: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9518000  ! 696: RDPR_PSTATE	<illegal instruction>
	.word 0xfa14e14e  ! 698: LDUH_I	lduh	[%r19 + 0x014e], %r29
	.word 0xfa1ca07a  ! 699: LDD_I	ldd	[%r18 + 0x007a], %r29
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 22)
	setx	0x84e79a7d00005e1d, %g1, %r10
	.word 0x819a8000  ! 707: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa4c8000  ! 708: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0x8995e0bb  ! 710: WRPR_TICK_I	wrpr	%r23, 0x00bb, %tick
	.word 0x8d942089  ! 711: WRPR_PSTATE_I	wrpr	%r16, 0x0089, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf015a0c2  ! 713: LDUH_I	lduh	[%r22 + 0x00c2], %r24
	.word 0xf80c2133  ! 714: LDUB_I	ldub	[%r16 + 0x0133], %r28
	.word 0xb424a1fd  ! 717: SUB_I	sub 	%r18, 0x01fd, %r26
	.word 0x8394e141  ! 718: WRPR_TNPC_I	wrpr	%r19, 0x0141, %tnpc
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb41c8000  ! 720: XOR_R	xor 	%r18, %r0, %r26
	.word 0xfa45c000  ! 724: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf004c000  ! 726: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xb61d6098  ! 727: XOR_I	xor 	%r21, 0x0098, %r27
	.word 0xbf520000  ! 732: RDPR_PIL	<illegal instruction>
	setx	data_start_1, %g1, %r18
	.word 0xbf500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xfc4c61d7  ! 735: LDSB_I	ldsb	[%r17 + 0x01d7], %r30
	.word 0xf44460f5  ! 738: LDSW_I	ldsw	[%r17 + 0x00f5], %r26
	.word 0xf615c000  ! 740: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xfc44602b  ! 743: LDSW_I	ldsw	[%r17 + 0x002b], %r30
	.word 0xfe54a0de  ! 750: LDSH_I	ldsh	[%r18 + 0x00de], %r31
	.word 0xbd540000  ! 751: RDPR_GL	<illegal instruction>
	.word 0x8395e123  ! 753: WRPR_TNPC_I	wrpr	%r23, 0x0123, %tnpc
	.word 0xfa45618b  ! 754: LDSW_I	ldsw	[%r21 + 0x018b], %r29
	.word 0xf91d4000  ! 757: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xb3510000  ! 761: RDPR_TICK	rdpr	%tick, %r25
	mov	0, %r12
	.word 0x8f930000  ! 764: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb2a42112  ! 768: SUBcc_I	subcc 	%r16, 0x0112, %r25
	.word 0xfe1c4000  ! 771: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0x8994a122  ! 773: WRPR_TICK_I	wrpr	%r18, 0x0122, %tick
	.word 0xb624c000  ! 774: SUB_R	sub 	%r19, %r0, %r27
	.word 0xf61c6016  ! 776: LDD_I	ldd	[%r17 + 0x0016], %r27
	.word 0xfc548000  ! 777: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf454a190  ! 778: LDSH_I	ldsh	[%r18 + 0x0190], %r26
	.word 0xf25d0000  ! 779: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xfc14e064  ! 785: LDUH_I	lduh	[%r19 + 0x0064], %r30
	.word 0x8194e04f  ! 786: WRPR_TPC_I	wrpr	%r19, 0x004f, %tpc
	.word 0x8794e022  ! 787: WRPR_TT_I	wrpr	%r19, 0x0022, %tt
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 33)
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, a)
	.word 0xf4154000  ! 797: LDUH_R	lduh	[%r21 + %r0], %r26
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 34)
	.word 0xb8bd603c  ! 800: XNORcc_I	xnorcc 	%r21, 0x003c, %r28
	.word 0xf60d21b7  ! 801: LDUB_I	ldub	[%r20 + 0x01b7], %r27
	.word 0xf31cc000  ! 802: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xbb520000  ! 811: RDPR_PIL	<illegal instruction>
	.word 0x8d952063  ! 814: WRPR_PSTATE_I	wrpr	%r20, 0x0063, %pstate
	.word 0xf24d0000  ! 817: LDSB_R	ldsb	[%r20 + %r0], %r25
	setx	0x436777080000bdc7, %g1, %r10
	.word 0x819a8000  ! 820: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, f)
	.word 0xf24de1d0  ! 826: LDSB_I	ldsb	[%r23 + 0x01d0], %r25
	.word 0xb6b520bb  ! 829: ORNcc_I	orncc 	%r20, 0x00bb, %r27
	.word 0xbe8d4000  ! 830: ANDcc_R	andcc 	%r21, %r0, %r31
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa5ca0be  ! 837: LDX_I	ldx	[%r18 + 0x00be], %r29
	.word 0xf405a0ae  ! 839: LDUW_I	lduw	[%r22 + 0x00ae], %r26
	.word 0xbcbca1f1  ! 840: XNORcc_I	xnorcc 	%r18, 0x01f1, %r30
	.word 0x8795a02b  ! 843: WRPR_TT_I	wrpr	%r22, 0x002b, %tt
	.word 0xf81520aa  ! 844: LDUH_I	lduh	[%r20 + 0x00aa], %r28
	.word 0xf71da085  ! 848: LDDF_I	ldd	[%r22, 0x0085], %f27
	setx	data_start_1, %g1, %r23
	.word 0xb4150000  ! 850: OR_R	or 	%r20, %r0, %r26
	setx	data_start_7, %g1, %r18
	.word 0x8d94a14a  ! 854: WRPR_PSTATE_I	wrpr	%r18, 0x014a, %pstate
	setx	data_start_1, %g1, %r22
	.word 0xf65da160  ! 859: LDX_I	ldx	[%r22 + 0x0160], %r27
	.word 0xf2054000  ! 861: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xfd1d0000  ! 863: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xf2440000  ! 866: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf44c20d0  ! 868: LDSB_I	ldsb	[%r16 + 0x00d0], %r26
	.word 0xff1d4000  ! 870: LDDF_R	ldd	[%r21, %r0], %f31
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 31)
	mov	1, %r12
	.word 0x8f930000  ! 872: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa55a053  ! 874: LDSH_I	ldsh	[%r22 + 0x0053], %r29
	.word 0xbb35d000  ! 877: SRLX_R	srlx	%r23, %r0, %r29
	mov	2, %r12
	.word 0xa1930000  ! 878: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb32c1000  ! 879: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xb5518000  ! 881: RDPR_PSTATE	<illegal instruction>
	.word 0xb5510000  ! 889: RDPR_TICK	<illegal instruction>
	.word 0xf24d8000  ! 892: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xbb480000  ! 894: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xff1c0000  ! 895: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf4048000  ! 896: LDUW_R	lduw	[%r18 + %r0], %r26
	setx	data_start_3, %g1, %r16
	.word 0xfe042012  ! 899: LDUW_I	lduw	[%r16 + 0x0012], %r31
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 30)
	.word 0xf41da118  ! 904: LDD_I	ldd	[%r22 + 0x0118], %r26
	.word 0xbf504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0x839520da  ! 912: WRPR_TNPC_I	wrpr	%r20, 0x00da, %tnpc
	.word 0xf805e1ee  ! 915: LDUW_I	lduw	[%r23 + 0x01ee], %r28
	.word 0x8194e00e  ! 916: WRPR_TPC_I	wrpr	%r19, 0x000e, %tpc
	.word 0xf61d60d3  ! 917: LDD_I	ldd	[%r21 + 0x00d3], %r27
	.word 0xb3504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0xbb480000  ! 924: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf0546044  ! 925: LDSH_I	ldsh	[%r17 + 0x0044], %r24
	.word 0x83952014  ! 930: WRPR_TNPC_I	wrpr	%r20, 0x0014, %tnpc
	.word 0xf20c4000  ! 932: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xbd520000  ! 933: RDPR_PIL	<illegal instruction>
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 6)
	.word 0xf65c8000  ! 940: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0x8995208f  ! 949: WRPR_TICK_I	wrpr	%r20, 0x008f, %tick
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 33)
	.word 0xf84520e9  ! 960: LDSW_I	ldsw	[%r20 + 0x00e9], %r28
	.word 0xb950c000  ! 963: RDPR_TT	rdpr	%tt, %r28
	.word 0xf61c60b6  ! 965: LDD_I	ldd	[%r17 + 0x00b6], %r27
	.word 0xf8544000  ! 967: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfc548000  ! 968: LDSH_R	ldsh	[%r18 + %r0], %r30
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 6)
	.word 0xf8558000  ! 970: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xb32cf001  ! 971: SLLX_I	sllx	%r19, 0x0001, %r25
	.word 0xf40560d3  ! 972: LDUW_I	lduw	[%r21 + 0x00d3], %r26
	.word 0xb5508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x8d9420d0  ! 974: WRPR_PSTATE_I	wrpr	%r16, 0x00d0, %pstate
hwintr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_52), 16, 16)) -> intp(2, 0, 15)
hwintr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_53), 16, 16)) -> intp(2, 0, 34)
	.word 0xf91d4000  ! 977: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xfd1d0000  ! 980: LDDF_R	ldd	[%r20, %r0], %f30
hwintr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_54), 16, 16)) -> intp(2, 0, 12)
hwintr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_55), 16, 16)) -> intp(2, 0, 38)
	mov	1, %r12
	.word 0x8f930000  ! 985: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4454000  ! 988: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0x9194202b  ! 989: WRPR_PIL_I	wrpr	%r16, 0x002b, %pil
	.word 0xff1c61cc  ! 990: LDDF_I	ldd	[%r17, 0x01cc], %f31
	.word 0x859520ee  ! 992: WRPR_TSTATE_I	wrpr	%r20, 0x00ee, %tstate
	.word 0xfa048000  ! 995: LDUW_R	lduw	[%r18 + %r0], %r29
hwintr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_56), 16, 16)) -> intp(2, 0, 33)
	.word 0x899420af  ! 997: WRPR_TICK_I	wrpr	%r16, 0x00af, %tick
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, b)
	mov	1, %r12
	.word 0xa1930000  ! 3: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x41297e100000ca49, %g1, %r10
	.word 0x819a8000  ! 5: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba81420  ! 6: FMOVRNZ	dis not found

	.word 0xb92d1000  ! 7: SLLX_R	sllx	%r20, %r0, %r28
	.word 0x89942151  ! 8: WRPR_TICK_I	wrpr	%r16, 0x0151, %tick
	.word 0xb1ab4820  ! 9: FMOVCC	fmovs	%fcc1, %f0, %f24
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 3c)
	mov	1, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x859421f4  ! 14: WRPR_TSTATE_I	wrpr	%r16, 0x01f4, %tstate
	.word 0xbc342166  ! 15: ORN_I	orn 	%r16, 0x0166, %r30
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbd510000  ! 20: RDPR_TICK	<illegal instruction>
	.word 0xb3349000  ! 27: SRLX_R	srlx	%r18, %r0, %r25
	.word 0xbb540000  ! 30: RDPR_GL	<illegal instruction>
	.word 0xbc2cc000  ! 31: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xb9a40860  ! 34: FADDq	dis not found

	.word 0x8194607c  ! 35: WRPR_TPC_I	wrpr	%r17, 0x007c, %tpc
	.word 0xb2b40000  ! 36: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xbda94820  ! 40: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00040  ! 42: FMOVd	fmovd	%f0, %f24
	.word 0x89946041  ! 43: WRPR_TICK_I	wrpr	%r17, 0x0041, %tick
	.word 0xb3510000  ! 45: RDPR_TICK	<illegal instruction>
	.word 0x91952064  ! 46: WRPR_PIL_I	wrpr	%r20, 0x0064, %pil
	.word 0xb49d4000  ! 49: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0x8794a0bc  ! 50: WRPR_TT_I	wrpr	%r18, 0x00bc, %tt
	.word 0xbfab0820  ! 51: FMOVGU	fmovs	%fcc1, %f0, %f31
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a5c8e0  ! 57: FSUBq	dis not found

	.word 0xb1a488a0  ! 60: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xbf3c1000  ! 64: SRAX_R	srax	%r16, %r0, %r31
	.word 0xb9aa4820  ! 66: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbba489e0  ! 67: FDIVq	dis not found

	.word 0xb23c0000  ! 68: XNOR_R	xnor 	%r16, %r0, %r25
	.word 0xba14c000  ! 73: OR_R	or 	%r19, %r0, %r29
	.word 0xba244000  ! 75: SUB_R	sub 	%r17, %r0, %r29
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 1a)
	.word 0x87946124  ! 80: WRPR_TT_I	wrpr	%r17, 0x0124, %tt
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 39)
	.word 0xb97d4400  ! 82: MOVR_R	movre	%r21, %r0, %r28
	.word 0xb5a5c920  ! 84: FMULs	fmuls	%f23, %f0, %f26
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 26)
	.word 0xba148000  ! 88: OR_R	or 	%r18, %r0, %r29
	.word 0xb3a84820  ! 89: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a50840  ! 91: FADDd	faddd	%f20, %f0, %f58
	setx	0x5db74e940000d9d2, %g1, %r10
	.word 0x839a8000  ! 92: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x775629da00002a9e, %g1, %r10
	.word 0x839a8000  ! 94: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a98820  ! 100: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0x8995e1eb  ! 102: WRPR_TICK_I	wrpr	%r23, 0x01eb, %tick
	.word 0xb3a44820  ! 104: FADDs	fadds	%f17, %f0, %f25
	.word 0xbda488e0  ! 107: FSUBq	dis not found

	.word 0x8795602b  ! 108: WRPR_TT_I	wrpr	%r21, 0x002b, %tt
	.word 0xb5a50920  ! 109: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb61cc000  ! 110: XOR_R	xor 	%r19, %r0, %r27
	.word 0xb5a489a0  ! 112: FDIVs	fdivs	%f18, %f0, %f26
	mov	2, %r12
	.word 0xa1930000  ! 114: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xdbfa89030000b95b, %g1, %r10
	.word 0x839a8000  ! 115: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a58840  ! 116: FADDd	faddd	%f22, %f0, %f58
	.word 0xbfa80820  ! 117: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0x9194a1df  ! 118: WRPR_PIL_I	wrpr	%r18, 0x01df, %pil
	.word 0xb1a88820  ! 119: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbf480000  ! 122: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xba454000  ! 124: ADDC_R	addc 	%r21, %r0, %r29
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 3e)
	setx	data_start_0, %g1, %r17
	mov	2, %r12
	.word 0x8f930000  ! 129: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a5c940  ! 131: FMULd	fmuld	%f54, %f0, %f26
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a00540  ! 133: FSQRTd	fsqrt	
	setx	0x62898fc70000794d, %g1, %r10
	.word 0x819a8000  ! 136: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba4c9e0  ! 137: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a00560  ! 141: FSQRTq	fsqrt	
	.word 0xbfaa0820  ! 143: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb6ac8000  ! 144: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xb5a4c820  ! 145: FADDs	fadds	%f19, %f0, %f26
	.word 0xb1a81420  ! 148: FMOVRNZ	dis not found

	.word 0xb48d4000  ! 152: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xbda50860  ! 156: FADDq	dis not found

	.word 0xb7504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x8395203c  ! 161: WRPR_TNPC_I	wrpr	%r20, 0x003c, %tnpc
	.word 0xb7aa4820  ! 165: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbda48820  ! 167: FADDs	fadds	%f18, %f0, %f30
	.word 0x8595a176  ! 168: WRPR_TSTATE_I	wrpr	%r22, 0x0176, %tstate
	.word 0xb5a00560  ! 171: FSQRTq	fsqrt	
	.word 0xb9349000  ! 173: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xb7641800  ! 175: MOVcc_R	<illegal instruction>
	.word 0xbfa84820  ! 176: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda48820  ! 177: FADDs	fadds	%f18, %f0, %f30
	.word 0xb9a588e0  ! 180: FSUBq	dis not found

hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba488a0  ! 187: FSUBs	fsubs	%f18, %f0, %f29
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 4)
	.word 0xb7abc820  ! 191: FMOVVC	fmovs	%fcc1, %f0, %f27
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 7)
	.word 0xbf508000  ! 199: RDPR_TSTATE	<illegal instruction>
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 31)
	.word 0xbfaa4820  ! 203: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a448c0  ! 204: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xbda80820  ! 205: FMOVN	fmovs	%fcc1, %f0, %f30
	setx	0xe9f050db000088d8, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7aa4820  ! 207: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb284e02e  ! 216: ADDcc_I	addcc 	%r19, 0x002e, %r25
	.word 0x8594a1c1  ! 217: WRPR_TSTATE_I	wrpr	%r18, 0x01c1, %tstate
	.word 0xb3a48960  ! 220: FMULq	dis not found

	.word 0xb5ab8820  ! 225: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbda448e0  ! 228: FSUBq	dis not found

	.word 0xbda40840  ! 232: FADDd	faddd	%f16, %f0, %f30
	.word 0xb7540000  ! 234: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc4e1a7  ! 237: ADDCcc_I	addccc 	%r19, 0x01a7, %r30
	.word 0xb7ab8820  ! 239: FMOVPOS	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r19
	.word 0xbb540000  ! 241: RDPR_GL	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbda81c20  ! 246: FMOVRGEZ	dis not found

hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9aa4820  ! 249: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0x9195a058  ! 250: WRPR_PIL_I	wrpr	%r22, 0x0058, %pil
	.word 0x8195a0fd  ! 253: WRPR_TPC_I	wrpr	%r22, 0x00fd, %tpc
	.word 0xbda00560  ! 254: FSQRTq	fsqrt	
	.word 0xbe2560c9  ! 256: SUB_I	sub 	%r21, 0x00c9, %r31
	.word 0xb9a5c820  ! 257: FADDs	fadds	%f23, %f0, %f28
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba80420  ! 260: FMOVRZ	dis not found

	.word 0xb3a8c820  ! 261: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x8795a173  ! 262: WRPR_TT_I	wrpr	%r22, 0x0173, %tt
	.word 0xbda8c820  ! 265: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa8c820  ! 272: FMOVL	fmovs	%fcc1, %f0, %f31
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 2e)
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 2c)
	.word 0xba1da16f  ! 285: XOR_I	xor 	%r22, 0x016f, %r29
	.word 0xbda4c9a0  ! 287: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb9a50940  ! 289: FMULd	fmuld	%f20, %f0, %f28
	.word 0x839420ed  ! 291: WRPR_TNPC_I	wrpr	%r16, 0x00ed, %tnpc
	setx	data_start_5, %g1, %r23
	.word 0xbda00020  ! 296: FMOVs	fmovs	%f0, %f30
	.word 0xb5a00520  ! 297: FSQRTs	fsqrt	
	.word 0xb7a4c840  ! 301: FADDd	faddd	%f50, %f0, %f58
	.word 0xb5abc820  ! 303: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c8a0  ! 304: FSUBs	fsubs	%f19, %f0, %f29
	setx	data_start_3, %g1, %r20
	.word 0xb7a8c820  ! 306: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00560  ! 308: FSQRTq	fsqrt	
	.word 0xb7a58860  ! 309: FADDq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 310: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 12)
	.word 0x8995e0cc  ! 312: WRPR_TICK_I	wrpr	%r23, 0x00cc, %tick
	.word 0xbbab0820  ! 315: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x5e5b7fc200006b47, %g1, %r10
	.word 0x839a8000  ! 316: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_6, %g1, %r19
	.word 0x8d9420ef  ! 319: WRPR_PSTATE_I	wrpr	%r16, 0x00ef, %pstate
	.word 0xb7a4c820  ! 321: FADDs	fadds	%f19, %f0, %f27
	.word 0xb1a54920  ! 326: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb9510000  ! 327: RDPR_TICK	<illegal instruction>
	.word 0xb5a4c8a0  ! 328: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb3a5c860  ! 329: FADDq	dis not found

	.word 0xbfa00020  ! 330: FMOVs	fmovs	%f0, %f31
	.word 0x87942062  ! 331: WRPR_TT_I	wrpr	%r16, 0x0062, %tt
	.word 0xb2148000  ! 332: OR_R	or 	%r18, %r0, %r25
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 17)
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba5c820  ! 338: FADDs	fadds	%f23, %f0, %f29
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 3c)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 0)
	.word 0xb351c000  ! 341: RDPR_TL	<illegal instruction>
	.word 0xb5a5c8c0  ! 344: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb7a48920  ! 346: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb3a00560  ! 349: FSQRTq	fsqrt	
	.word 0xb751c000  ! 352: RDPR_TL	<illegal instruction>
	.word 0xbba58840  ! 355: FADDd	faddd	%f22, %f0, %f60
	.word 0xb9a00540  ! 357: FSQRTd	fsqrt	
	.word 0xbba54920  ! 358: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb3a40860  ! 359: FADDq	dis not found

	.word 0x9195a1d5  ! 362: WRPR_PIL_I	wrpr	%r22, 0x01d5, %pil
	.word 0xbf508000  ! 363: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956090  ! 366: WRPR_PSTATE_I	wrpr	%r21, 0x0090, %pstate
	.word 0xb57d4400  ! 367: MOVR_R	movre	%r21, %r0, %r26
	.word 0xb1a40840  ! 368: FADDd	faddd	%f16, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 369: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda588c0  ! 377: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb9a488e0  ! 378: FSUBq	dis not found

	.word 0xb9520000  ! 384: RDPR_PIL	<illegal instruction>
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 19)
	setx	data_start_5, %g1, %r19
	.word 0xb7a4c960  ! 392: FMULq	dis not found

	.word 0xb3a5c920  ! 393: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb3a94820  ! 394: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb53d3001  ! 396: SRAX_I	srax	%r20, 0x0001, %r26
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aa4820  ! 400: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	0x6801f4ff00000e5f, %g1, %r10
	.word 0x819a8000  ! 402: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda00020  ! 403: FMOVs	fmovs	%f0, %f30
	.word 0xb7a4c8e0  ! 404: FSUBq	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 408: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a489a0  ! 409: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb7a94820  ! 411: FMOVCS	fmovs	%fcc1, %f0, %f27
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 35)
	setx	data_start_6, %g1, %r22
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 7)
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb63d8000  ! 423: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0x8794612e  ! 424: WRPR_TT_I	wrpr	%r17, 0x012e, %tt
	.word 0x87952155  ! 426: WRPR_TT_I	wrpr	%r20, 0x0155, %tt
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 3f)
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 3)
	.word 0xb12dd000  ! 430: SLLX_R	sllx	%r23, %r0, %r24
	.word 0x8d95a1d4  ! 433: WRPR_PSTATE_I	wrpr	%r22, 0x01d4, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a448a0  ! 436: FSUBs	fsubs	%f17, %f0, %f28
	.word 0x9195e03b  ! 437: WRPR_PIL_I	wrpr	%r23, 0x003b, %pil
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7a80820  ! 443: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb3a9c820  ! 444: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a84820  ! 446: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0x89952121  ! 449: WRPR_TICK_I	wrpr	%r20, 0x0121, %tick
	.word 0x9194a050  ! 452: WRPR_PIL_I	wrpr	%r18, 0x0050, %pil
	.word 0xbc84203e  ! 453: ADDcc_I	addcc 	%r16, 0x003e, %r30
	mov	0, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb23c21c1  ! 464: XNOR_I	xnor 	%r16, 0x01c1, %r25
	.word 0x8d9521ff  ! 465: WRPR_PSTATE_I	wrpr	%r20, 0x01ff, %pstate
	.word 0x8394a08d  ! 466: WRPR_TNPC_I	wrpr	%r18, 0x008d, %tnpc
	setx	0x88e1986f00003f0b, %g1, %r10
	.word 0x839a8000  ! 470: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a90820  ! 471: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x87956021  ! 474: WRPR_TT_I	wrpr	%r21, 0x0021, %tt
	.word 0xb1520000  ! 475: RDPR_PIL	<illegal instruction>
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a84820  ! 480: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a44960  ! 482: FMULq	dis not found

	.word 0xb7a4c840  ! 485: FADDd	faddd	%f50, %f0, %f58
	.word 0xb3a81820  ! 490: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb751c000  ! 497: RDPR_TL	<illegal instruction>
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94e16b  ! 503: WRPR_PSTATE_I	wrpr	%r19, 0x016b, %pstate
	setx	data_start_6, %g1, %r21
	.word 0xb5a00040  ! 508: FMOVd	fmovd	%f0, %f26
	.word 0xbfabc820  ! 509: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbda90820  ! 510: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3540000  ! 511: RDPR_GL	<illegal instruction>
	.word 0xb3a90820  ! 512: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0xf43808400005e86, %g1, %r10
	.word 0x819a8000  ! 515: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb551c000  ! 522: RDPR_TL	<illegal instruction>
	.word 0xb7a9c820  ! 523: FMOVVS	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0x8f930000  ! 524: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda448a0  ! 528: FSUBs	fsubs	%f17, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 531: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda80c20  ! 534: FMOVRLZ	dis not found

hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a5c9c0  ! 543: FDIVd	fdivd	%f54, %f0, %f28
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a81820  ! 550: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a488e0  ! 552: FSUBq	dis not found

	.word 0xb5a58820  ! 553: FADDs	fadds	%f22, %f0, %f26
	.word 0xb29c4000  ! 554: XORcc_R	xorcc 	%r17, %r0, %r25
	.word 0xbfa90820  ! 555: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a5c820  ! 556: FADDs	fadds	%f23, %f0, %f27
	.word 0xb3a5c8e0  ! 558: FSUBq	dis not found

	.word 0xb1a8c820  ! 559: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0x8d94210d  ! 560: WRPR_PSTATE_I	wrpr	%r16, 0x010d, %pstate
	.word 0xb7a00040  ! 561: FMOVd	fmovd	%f0, %f58
	.word 0xbda449c0  ! 562: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xbb480000  ! 563: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbda50940  ! 565: FMULd	fmuld	%f20, %f0, %f30
	.word 0xbfa58820  ! 570: FADDs	fadds	%f22, %f0, %f31
	.word 0xbba50840  ! 571: FADDd	faddd	%f20, %f0, %f60
	.word 0x919561ad  ! 572: WRPR_PIL_I	wrpr	%r21, 0x01ad, %pil
	.word 0xb1a408c0  ! 573: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbda98820  ! 574: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80420  ! 576: FMOVRZ	dis not found

	.word 0xb7a94820  ! 577: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9508000  ! 578: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 580: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbdab4820  ! 581: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0x899560c5  ! 582: WRPR_TICK_I	wrpr	%r21, 0x00c5, %tick
	.word 0xb4350000  ! 584: SUBC_R	orn 	%r20, %r0, %r26
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, f)
	.word 0x819421a5  ! 589: WRPR_TPC_I	wrpr	%r16, 0x01a5, %tpc
	.word 0xbd500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0x9195215f  ! 597: WRPR_PIL_I	wrpr	%r20, 0x015f, %pil
	.word 0xb7520000  ! 599: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 600: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0xb9a9c820  ! 606: FMOVVS	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r23
	.word 0xb7a5c960  ! 608: FMULq	dis not found

	.word 0xb1540000  ! 609: RDPR_GL	<illegal instruction>
	.word 0xb7aa8820  ! 610: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa8820  ! 612: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbda408e0  ! 614: FSUBq	dis not found

	.word 0x87946077  ! 617: WRPR_TT_I	wrpr	%r17, 0x0077, %tt
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a00520  ! 623: FSQRTs	fsqrt	
	.word 0xbf520000  ! 626: RDPR_PIL	<illegal instruction>
	.word 0xbdaa4820  ! 627: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8794a1ed  ! 635: WRPR_TT_I	wrpr	%r18, 0x01ed, %tt
	.word 0xbba58940  ! 636: FMULd	fmuld	%f22, %f0, %f60
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3a80c20  ! 641: FMOVRLZ	dis not found

	.word 0xb1a50860  ! 642: FADDq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 643: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xba954000  ! 647: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xbba88820  ! 648: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb1348000  ! 649: SRL_R	srl 	%r18, %r0, %r24
	.word 0x83942184  ! 650: WRPR_TNPC_I	wrpr	%r16, 0x0184, %tnpc
	setx	data_start_0, %g1, %r17
	.word 0xb5abc820  ! 656: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba48920  ! 657: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb1ab0820  ! 658: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab4820  ! 659: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a5c8c0  ! 663: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb5a98820  ! 664: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb004e0ae  ! 665: ADD_I	add 	%r19, 0x00ae, %r24
	.word 0xb1a409a0  ! 669: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb6a44000  ! 670: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb5641800  ! 673: MOVcc_R	<illegal instruction>
	.word 0xb884a16b  ! 675: ADDcc_I	addcc 	%r18, 0x016b, %r28
	.word 0x8d95e197  ! 679: WRPR_PSTATE_I	wrpr	%r23, 0x0197, %pstate
	.word 0xb1a98820  ! 680: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1356001  ! 681: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xbfa5c860  ! 683: FADDq	dis not found

hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 7)
	.word 0xb49c60ca  ! 686: XORcc_I	xorcc 	%r17, 0x00ca, %r26
	.word 0xb9a00020  ! 687: FMOVs	fmovs	%f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 688: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba00560  ! 691: FSQRTq	fsqrt	
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3480000  ! 694: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb518000  ! 696: RDPR_PSTATE	<illegal instruction>
	.word 0xb3aa4820  ! 700: FMOVNE	fmovs	%fcc1, %f0, %f25
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 18)
	.word 0xbda80420  ! 704: FMOVRZ	dis not found

	.word 0xb9a4c960  ! 705: FMULq	dis not found

	setx	0x3d9807280000edc2, %g1, %r10
	.word 0x819a8000  ! 707: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a489a0  ! 709: FDIVs	fdivs	%f18, %f0, %f28
	.word 0x8994e1e9  ! 710: WRPR_TICK_I	wrpr	%r19, 0x01e9, %tick
	.word 0x8d946025  ! 711: WRPR_PSTATE_I	wrpr	%r17, 0x0025, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a00540  ! 716: FSQRTd	fsqrt	
	.word 0xb224e073  ! 717: SUB_I	sub 	%r19, 0x0073, %r25
	.word 0x8394e13f  ! 718: WRPR_TNPC_I	wrpr	%r19, 0x013f, %tnpc
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 7)
	.word 0xb41cc000  ! 720: XOR_R	xor 	%r19, %r0, %r26
	.word 0xb3a00520  ! 725: FSQRTs	fsqrt	
	.word 0xb01ca065  ! 727: XOR_I	xor 	%r18, 0x0065, %r24
	.word 0xbfab4820  ! 728: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1520000  ! 732: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r19
	.word 0xb7500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xbba00020  ! 737: FMOVs	fmovs	%f0, %f29
	.word 0xbba409e0  ! 741: FDIVq	dis not found

	.word 0xb5a00520  ! 745: FSQRTs	fsqrt	
	.word 0xbda5c9e0  ! 746: FDIVq	dis not found

	.word 0xb5540000  ! 751: RDPR_GL	<illegal instruction>
	.word 0x8394211f  ! 753: WRPR_TNPC_I	wrpr	%r16, 0x011f, %tnpc
	.word 0xb7a9c820  ! 758: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbda00040  ! 759: FMOVd	fmovd	%f0, %f30
	.word 0xb7a88820  ! 760: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbb510000  ! 761: RDPR_TICK	<illegal instruction>
	.word 0xbfaac820  ! 762: FMOVGE	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0x8f930000  ! 764: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb4a520ce  ! 768: SUBcc_I	subcc 	%r20, 0x00ce, %r26
	.word 0xb7a48940  ! 770: FMULd	fmuld	%f18, %f0, %f58
	.word 0x89946106  ! 773: WRPR_TICK_I	wrpr	%r17, 0x0106, %tick
	.word 0xba258000  ! 774: SUB_R	sub 	%r22, %r0, %r29
	.word 0xb3aa4820  ! 781: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00560  ! 783: FSQRTq	fsqrt	
	.word 0xbba90820  ! 784: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0x81946051  ! 786: WRPR_TPC_I	wrpr	%r17, 0x0051, %tpc
	.word 0x8794e1e4  ! 787: WRPR_TT_I	wrpr	%r19, 0x01e4, %tt
	.word 0xbba80820  ! 788: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3a00560  ! 791: FSQRTq	fsqrt	
	.word 0xb1a8c820  ! 793: FMOVL	fmovs	%fcc1, %f0, %f24
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 9)
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 36)
	.word 0xb8bd60ba  ! 800: XNORcc_I	xnorcc 	%r21, 0x00ba, %r28
	.word 0xbba90820  ! 804: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a449e0  ! 808: FDIVq	dis not found

	.word 0xbf520000  ! 811: RDPR_PIL	<illegal instruction>
	.word 0x8d952046  ! 814: WRPR_PSTATE_I	wrpr	%r20, 0x0046, %pstate
	.word 0xb7aac820  ! 815: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbba81c20  ! 819: FMOVRGEZ	dis not found

	setx	0xe3adfa7c0000ea12, %g1, %r10
	.word 0x819a8000  ! 820: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7abc820  ! 822: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda9c820  ! 823: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfaac820  ! 827: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb4b560cd  ! 829: ORNcc_I	orncc 	%r21, 0x00cd, %r26
	.word 0xbc8d4000  ! 830: ANDcc_R	andcc 	%r21, %r0, %r30
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb8bca004  ! 840: XNORcc_I	xnorcc 	%r18, 0x0004, %r28
	.word 0x87942017  ! 843: WRPR_TT_I	wrpr	%r16, 0x0017, %tt
	.word 0xb1a5c9a0  ! 845: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xbba8c820  ! 846: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbda8c820  ! 847: FMOVL	fmovs	%fcc1, %f0, %f30
	setx	data_start_4, %g1, %r17
	.word 0xb2144000  ! 850: OR_R	or 	%r17, %r0, %r25
	.word 0xb9ab0820  ! 852: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r18
	.word 0x8d9520eb  ! 854: WRPR_PSTATE_I	wrpr	%r20, 0x00eb, %pstate
	setx	data_start_6, %g1, %r16
	.word 0xb7a548e0  ! 857: FSUBq	dis not found

	.word 0xbda50940  ! 867: FMULd	fmuld	%f20, %f0, %f30
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, b)
	mov	0, %r12
	.word 0x8f930000  ! 872: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9351000  ! 877: SRLX_R	srlx	%r20, %r0, %r28
	mov	1, %r12
	.word 0xa1930000  ! 878: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb92d1000  ! 879: SLLX_R	sllx	%r20, %r0, %r28
	.word 0xb1518000  ! 881: RDPR_PSTATE	<illegal instruction>
	.word 0xb5aac820  ! 882: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80820  ! 884: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbba4c8c0  ! 887: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbd510000  ! 889: RDPR_TICK	<illegal instruction>
	.word 0xbda44860  ! 891: FADDq	dis not found

	.word 0xbba00040  ! 893: FMOVd	fmovd	%f0, %f60
	.word 0xb1480000  ! 894: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	data_start_2, %g1, %r19
	.word 0xb5aa4820  ! 900: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54820  ! 901: FADDs	fadds	%f21, %f0, %f24
	.word 0xb5a44940  ! 902: FMULd	fmuld	%f48, %f0, %f26
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xb1abc820  ! 906: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbba00040  ! 907: FMOVd	fmovd	%f0, %f60
	.word 0x8394e1ea  ! 912: WRPR_TNPC_I	wrpr	%r19, 0x01ea, %tnpc
	.word 0xbfaac820  ! 914: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x81942196  ! 916: WRPR_TPC_I	wrpr	%r16, 0x0196, %tpc
	.word 0xb3a80420  ! 919: FMOVRZ	dis not found

	.word 0xb5a00520  ! 920: FSQRTs	fsqrt	
	.word 0xb1504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0xb1480000  ! 924: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbba80c20  ! 928: FMOVRLZ	dis not found

	.word 0x8395e1fd  ! 930: WRPR_TNPC_I	wrpr	%r23, 0x01fd, %tnpc
	.word 0xb5520000  ! 933: RDPR_PIL	<illegal instruction>
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba00520  ! 935: FSQRTs	fsqrt	
	.word 0xbda44820  ! 942: FADDs	fadds	%f17, %f0, %f30
	.word 0xb3a54960  ! 944: FMULq	dis not found

	.word 0xb9a00560  ! 945: FSQRTq	fsqrt	
	.word 0x89956078  ! 949: WRPR_TICK_I	wrpr	%r21, 0x0078, %tick
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba5c8a0  ! 954: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xbda81420  ! 961: FMOVRNZ	dis not found

	.word 0xbd50c000  ! 963: RDPR_TT	<illegal instruction>
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 10)
	.word 0xbd2df001  ! 971: SLLX_I	sllx	%r23, 0x0001, %r30
	.word 0xbf508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94611e  ! 974: WRPR_PSTATE_I	wrpr	%r17, 0x011e, %pstate
hwintr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_52), 16, 16)) -> intp(1, 0, 12)
hwintr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_53), 16, 16)) -> intp(1, 0, 27)
	.word 0xbfa8c820  ! 979: FMOVL	fmovs	%fcc1, %f0, %f31
hwintr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_54), 16, 16)) -> intp(1, 0, 2d)
hwintr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_55), 16, 16)) -> intp(1, 0, 7)
	mov	2, %r12
	.word 0x8f930000  ! 985: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a8c820  ! 986: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 987: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0x9194a0c8  ! 989: WRPR_PIL_I	wrpr	%r18, 0x00c8, %pil
	.word 0xbfa9c820  ! 991: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x8594a0b2  ! 992: WRPR_TSTATE_I	wrpr	%r18, 0x00b2, %tstate
	.word 0xb7a80420  ! 993: FMOVRZ	dis not found

hwintr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_56), 16, 16)) -> intp(1, 0, 1f)
	.word 0x8994a05d  ! 997: WRPR_TICK_I	wrpr	%r18, 0x005d, %tick

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

	.xword	0x5e881428b1449cc3
	.xword	0x3d11735625548bc3
	.xword	0xf4ac4d028fce8c3f
	.xword	0x9f50b9c3615d832c
	.xword	0x6ba767f04d3e923e
	.xword	0xe4a0ae01b038c413
	.xword	0xda9fb66a1244dad6
	.xword	0x1c06eb895bd953f8
	.xword	0x84c01b0e4ea79e09
	.xword	0x9ea4835a1201b288
	.xword	0x71a47a7f91fc4c41
	.xword	0x5f038ec00cf58ae3
	.xword	0xb5123bff18fba58e
	.xword	0x1807dcbb2a79ae3c
	.xword	0xd88440bcaedf1f5c
	.xword	0x5e2498205b0b598c
	.xword	0x4921f4b0db9c9766
	.xword	0xe86a2a93d1e0c5ae
	.xword	0x5c010915a0e6e4fd
	.xword	0xf699fbada55e5d88
	.xword	0x256b5dcd0be83090
	.xword	0x73765806f9fd510c
	.xword	0xef6982090093cdd7
	.xword	0xb679b50e72d91c1b
	.xword	0xcb41dbe8e9442cc0
	.xword	0x73f4b3fd409fb6da
	.xword	0x52a9b4e30ddf3f58
	.xword	0xae39188a5395ff80
	.xword	0x2a30716c68a27813
	.xword	0xf446b958b179afaa
	.xword	0x27ca33ce0165c3de
	.xword	0x770225a9e5a3b1da
	.xword	0xf99288041e7bf66e
	.xword	0x9adcf5336dabe5e8
	.xword	0x478bde6e8acac94e
	.xword	0x87596bcde749b59d
	.xword	0x70c57efde4c2d417
	.xword	0xf2501d07cc5836bf
	.xword	0x40a006590e603870
	.xword	0x9e6564584c29e215
	.xword	0xbe38a40e469a17a1
	.xword	0x5ec1655bc5c2d6c5
	.xword	0xa80e10a1a42767ea
	.xword	0xf4ce2be29fefa22e
	.xword	0x2969c4f9301ee17f
	.xword	0x02dabf8a71dc4a2c
	.xword	0xa06109495e21b55b
	.xword	0x38fa9bfd88429530
	.xword	0x07ddb302307f2ea0
	.xword	0x7940e05940e16b86
	.xword	0xe43e7a1720032840
	.xword	0x19ebca8897a3d139
	.xword	0x93a3faaed178dc36
	.xword	0x31e2f179147aeb28
	.xword	0x09d4cba177746a4b
	.xword	0x48c6e9c371a0e4fd
	.xword	0x22ea7e32fb819959
	.xword	0xad34a2e2c7359689
	.xword	0x7b29d65e4a4cbbb7
	.xword	0xca7fffb46f9d7913
	.xword	0x6beadb9737a27b51
	.xword	0x440596e356318b95
	.xword	0x7b3574bfc5f26628
	.xword	0x943b05bf550358bf
	.xword	0xf395b58f39827414
	.xword	0xda7681c9dfa0facb
	.xword	0xe9e00839c62a29ed
	.xword	0x1d1ece9f11a3bd7a
	.xword	0xa1de706690894fda
	.xword	0x41fbf9eead92d3ca
	.xword	0x5606b9481d4b82d7
	.xword	0xc9695ed65a92ae38
	.xword	0xe73587a6ae77f045
	.xword	0x35f784db19734fb0
	.xword	0x55aa46a541c01f97
	.xword	0x97a49725153102bc
	.xword	0x9880f7ca06e2519a
	.xword	0xdfcfbe424f38433e
	.xword	0x2a1a060bde95ee66
	.xword	0x9fa6d32f9ad7316f
	.xword	0x2b1c98232e34b023
	.xword	0xfd324f5634df099e
	.xword	0xe26318fd3367930c
	.xword	0xfc7f9902f13c48ec
	.xword	0x1273d534007b4389
	.xword	0x5054372875e0c210
	.xword	0x338a2421f5244c6e
	.xword	0x8433a3a9e0396add
	.xword	0xab04e0a34cba58c8
	.xword	0x29a3356080fe5774
	.xword	0xe99cf27bb7acc391
	.xword	0x26423ca563661cc7
	.xword	0x0a0565b75dcc0f12
	.xword	0xd361d16128d3f272
	.xword	0xcad0baf8258e3039
	.xword	0xcfb8abddc078a2c2
	.xword	0xb0d5b3bfd1fca4cb
	.xword	0x85ea148533fdeecc
	.xword	0x1e615ed9d93ffca4
	.xword	0x121921985b64d0bf
	.xword	0xea52121bf9439e87
	.xword	0xebb26584dc950385
	.xword	0x8950e69f6538f825
	.xword	0x23657c4a2837fc58
	.xword	0x89c45248960f35f7
	.xword	0x9ef510b40a705f54
	.xword	0xe5a22287bf3b6cec
	.xword	0xbf93de9d96818406
	.xword	0x9ee9b3c1747d6140
	.xword	0xcf5a6a949bf8ee83
	.xword	0xcf5e2b9a91e4f53c
	.xword	0xcd8d8e0790ddb672
	.xword	0x2898272ad632756b
	.xword	0x04846b5f61c9c737
	.xword	0x0a4427cceeb75b72
	.xword	0x932fa219caf72207
	.xword	0x3c6ddb4329b6d7cf
	.xword	0x9bac5e0c75b28ab4
	.xword	0x3d2101d30bca94cd
	.xword	0x83e1282ba63abbad
	.xword	0x3629400749adf404
	.xword	0xab75bb2f83467e0a
	.xword	0xe0fb71690da32429
	.xword	0x5613cb3d8ea256e2
	.xword	0x3143ad6d8fd1abd5
	.xword	0x6653452ef10904ac
	.xword	0x587115665c86b54c
	.xword	0x5641f5e5afda7435
	.xword	0x1ba0e25d16b0042d
	.xword	0x2b56c4553a660bd8
	.xword	0xa6a55c6e44f6f28f
	.xword	0xa801aa46445ad87b
	.xword	0x30eb8c15cccd3b1d
	.xword	0xc565a02a97a24b00
	.xword	0x2b9349bc6d0ce354
	.xword	0xba7c8f3c0b941e49
	.xword	0x23614a522a1b4268
	.xword	0xb571615d3832e1a4
	.xword	0xaa109f2258ffd9c0
	.xword	0xfe1c94b68c5fbeb0
	.xword	0xc628af093356aef8
	.xword	0xb3e9d249c1e119bb
	.xword	0xba7baa1d9f30102f
	.xword	0x1356650cfc112e48
	.xword	0x20e8b50211d126b8
	.xword	0x86a2ef878c812c69
	.xword	0x3024e1974e9ffc01
	.xword	0x66d9dd75954c05a3
	.xword	0xa744b67acab0fe98
	.xword	0x6d4fe0353713fb7a
	.xword	0x5188336f06919730
	.xword	0xb075a835a4e68eee
	.xword	0x4162a71b73030805
	.xword	0x4ed7f25bdfede987
	.xword	0xebed3a8adb1fbb63
	.xword	0xb7febdfd3e6d4b6d
	.xword	0x86be76680ec30fe6
	.xword	0xd43aff19411d3f80
	.xword	0x231629367c0552a2
	.xword	0x7cbe1db153ac9ec9
	.xword	0x96d964194baa2bbe
	.xword	0x66a9c63d37e5deeb
	.xword	0xf8698e7c6901c986
	.xword	0x9a36fcc9445304b4
	.xword	0xc4b381a6adfb6d61
	.xword	0xdd09ebf38ba3c58f
	.xword	0x6c7e7723d84e47ae
	.xword	0x4463bf196242c23a
	.xword	0xf0a0e8bfff6cdfa1
	.xword	0x9cc0905146eef6cb
	.xword	0x65f4649b7090bdc8
	.xword	0x02d809de72decb58
	.xword	0x799830cc63055ac8
	.xword	0xffeafa6a88531a48
	.xword	0x43e79f49db51841d
	.xword	0x2488674106dac449
	.xword	0x4d349a92034f045f
	.xword	0x08792ad45bc6ef1e
	.xword	0x58568cc1a94fc3c5
	.xword	0x90206b51b8ddfc33
	.xword	0xc8db13c1cc3539c2
	.xword	0xda5148adb6a7beb0
	.xword	0x056a00769f896621
	.xword	0xa4e7e72755bbb027
	.xword	0x5dd55f484e764067
	.xword	0xf3d9b5a99980dd89
	.xword	0x3e3598adf6781c01
	.xword	0x471b2c37d843e684
	.xword	0x69b0dfe8094536f7
	.xword	0xe65ebe8b40426a80
	.xword	0x79b5358a496adc69
	.xword	0xfcdb6798e04e1b15
	.xword	0xf57669e14dd0ed7c
	.xword	0x06f13ef3558a9f79
	.xword	0x169f0c0613f92fee
	.xword	0x8b3ebc3a992d1fbd
	.xword	0xf15c9ecb4c770b68
	.xword	0x7bfd418e65428232
	.xword	0x42a1a029354505dd
	.xword	0xfe11d1b17810a80c
	.xword	0x81c172592b629d56
	.xword	0x46244c93340e75aa
	.xword	0xf8252b8db5f90a09
	.xword	0xb921be0b2c76898a
	.xword	0x6f159078b371067a
	.xword	0xddb35780b888aee6
	.xword	0x7c7404da2a63ffad
	.xword	0x763ca2ed814d93df
	.xword	0xb9f38f17cbabbf7c
	.xword	0xe5ea4fa0ce7f0da8
	.xword	0x79574c1518faacae
	.xword	0x5487b01f40e92130
	.xword	0xb3c59b849cc2680a
	.xword	0x98f541b5ed5e1d0c
	.xword	0x0c2d927b57078282
	.xword	0x1f5d1119ed28e8fa
	.xword	0xfee0af65fa5fdf99
	.xword	0xcf52f954698b54fa
	.xword	0xe6e5e6c4af74a41d
	.xword	0xb688ed4c9d6cffa9
	.xword	0x8b502c1ddf024a7e
	.xword	0xfa3f4693f4ed1c0d
	.xword	0x40f4f4c8d37afcd8
	.xword	0x01f68a9260258fb3
	.xword	0x8441feaa38d777b1
	.xword	0xed0a9ec4c49c2429
	.xword	0x96f8b458098932e1
	.xword	0x69aa3785e167fe0d
	.xword	0x0b1508c0e9c4a86e
	.xword	0x0de56b887e089b83
	.xword	0xd8642989cee3bb7f
	.xword	0xc412d65d369666f9
	.xword	0x0ba6221bfc8febe9
	.xword	0x4c9a6424a0670627
	.xword	0xaabf65e5ecfcb98f
	.xword	0x161037ead1bb9b2b
	.xword	0x5d2ed29c6168f317
	.xword	0x8bf7b7a358bd004b
	.xword	0xd607fa246556497f
	.xword	0x522aad1201c25dd3
	.xword	0xdeebc93df2b1eb2b
	.xword	0xd3863606e9e069ef
	.xword	0x8a9abeb47911599a
	.xword	0x55db56dc8065d785
	.xword	0x4010dd9107c0ba2e
	.xword	0x7413158f60a07846
	.xword	0x3fee43d8f4833ec8
	.xword	0xd1e95b57dbe89964
	.xword	0xb3818c3ed58d7700
	.xword	0x22bff402706ff059
	.xword	0x76eb8ed576f3b2d4
	.xword	0x05702cbd42206363
	.xword	0x87597a0b30f5f2c7
	.xword	0x9c6ba0d0bcb018e9
	.xword	0xbe2fe66c3d230acf
	.xword	0x667f923eb815127e
	.align 0x2000
	.data
data_start_1:

	.xword	0x9f9a573cd254f6f9
	.xword	0x88cb9f1bc90d2f53
	.xword	0x8a8e6f157f4e4284
	.xword	0x2006205a9ea5702e
	.xword	0x4e6db091f6004580
	.xword	0xa4a39c5f8144069e
	.xword	0x3d61ce63df801730
	.xword	0x628900f256c5e12c
	.xword	0x2c2796b72f555a85
	.xword	0x73eb2d71cc7aca76
	.xword	0xa885f462be45e777
	.xword	0x44a98dc23cfa464e
	.xword	0x6fd91a30b319837a
	.xword	0x7078268605c27632
	.xword	0xbf5f0e425179f2bb
	.xword	0x0af5e4910f68a844
	.xword	0x9721f8bdeadd7561
	.xword	0x94141fc4edb93fa0
	.xword	0x12e75bd72e50dcf6
	.xword	0xddea8820c93eadce
	.xword	0x5ad7f39b76a997ff
	.xword	0x97e74831d83f5825
	.xword	0x7f98579ab384a0d1
	.xword	0xeadb99c9ef8c2e6b
	.xword	0xf0c159019fc68597
	.xword	0x8380574dd936fe47
	.xword	0xcff943ed479a2f45
	.xword	0x02d909ed6c4016ca
	.xword	0x099230017ec44969
	.xword	0xcded731c52bbff73
	.xword	0x374d9e6af6d183be
	.xword	0x003f43f03881e664
	.xword	0xd7cc7d0b0f1af87a
	.xword	0x55daac3316969b87
	.xword	0x4a8f4c5a61d76bce
	.xword	0x55bd262074a2cdb2
	.xword	0xcf6830f74be73a88
	.xword	0xd86e139d9d67269c
	.xword	0x0a653ce34a2c494a
	.xword	0xb3e46ccdea10a46f
	.xword	0x63421bc54bab5e01
	.xword	0xa5a3b81f36c03a8f
	.xword	0xd44a8e03252e7fb4
	.xword	0x330cf30b81753803
	.xword	0xf06309ac48b4fe78
	.xword	0x096c17f60dbf10b4
	.xword	0xd5bac98fd1a0bfd4
	.xword	0xa62b8b3b3a3d988e
	.xword	0x47648bd1c9538746
	.xword	0xcf087685088f6733
	.xword	0x6ae539fbb224e8d9
	.xword	0xa7a9a9b88bbf7df4
	.xword	0x5cf98b36f52098c1
	.xword	0x6f39715daf1430ec
	.xword	0xd9ab30a16f450499
	.xword	0x3d970917ce67d3be
	.xword	0x7c4597984caf3726
	.xword	0x61fc998662fb8175
	.xword	0x7319be80ec4173ef
	.xword	0x24a8bbe0f8db4489
	.xword	0xb4a30212dbf62f9f
	.xword	0x5e7d16aa4c4bb7f7
	.xword	0xb52a564010242aa5
	.xword	0xb377e6dfe9374d70
	.xword	0xeeec3a88549457bf
	.xword	0x01c873c8af792ccf
	.xword	0x56438a9e99ca3290
	.xword	0xc17669c83b3504da
	.xword	0x2c67876ad91ff948
	.xword	0x789df4e293afe11f
	.xword	0xf22de8bddf257c4b
	.xword	0x80ce8660775c13a3
	.xword	0x24ee71ebc7d896c8
	.xword	0xeebcc3c76450deb7
	.xword	0x438b523bb8498a5a
	.xword	0x1c524b060ae33fa3
	.xword	0xfe8a7b3b281e0ae1
	.xword	0x1b17356c6be25ce2
	.xword	0xec63a8ec5e6b31e1
	.xword	0x5f2f39d7608cfb94
	.xword	0x3611c1041a30940a
	.xword	0xe2881c6241ebd9b7
	.xword	0x6f410381e6ee3b40
	.xword	0x95d51ac8b1789296
	.xword	0xa0fd7be3f8e4ee7d
	.xword	0x5aad7c3719014ee9
	.xword	0x2bf3c50372200428
	.xword	0xfeca0f891161a10b
	.xword	0xb1ee71118112d6ce
	.xword	0xb5d9253c83a8d68b
	.xword	0x938ba8aaf91d0707
	.xword	0xacae68c79fe8a5fa
	.xword	0xac432b2c88cf7418
	.xword	0x3c4c1ae648c740d7
	.xword	0x80693486c135e164
	.xword	0x368b8938e1784c8a
	.xword	0x0ad0c1afb4fbf81e
	.xword	0xb8f3e001e11a0253
	.xword	0x27cdab068b640185
	.xword	0x66524faaf3520986
	.xword	0xd2e6b982ebe9c341
	.xword	0x5d919edee8889657
	.xword	0xa17408602ce400e0
	.xword	0x25fe2c0f7182adea
	.xword	0xd5ff8cfc24669aab
	.xword	0x25372660a52e81fc
	.xword	0x99024dfa6b32d3d3
	.xword	0x0c835527e6b87cad
	.xword	0x31ec9de914ae8582
	.xword	0x5d95de8b5089b652
	.xword	0x4bf02c7742251f0b
	.xword	0xd0cf510cf442000c
	.xword	0x1f8f00b7d1363966
	.xword	0x64a124201db48ea6
	.xword	0x37873a87f61ea0ca
	.xword	0x83a9f6c74359edfe
	.xword	0x3ab4cf263f0cff32
	.xword	0x7c88caa4b88bce1a
	.xword	0x39f0c4f8fc00f960
	.xword	0x2fc684e02678f3a1
	.xword	0x5b8f518eb0143593
	.xword	0x15a1caa8945c1c4f
	.xword	0x5e9495c4efdb409d
	.xword	0xe2f72d7f2e2b25eb
	.xword	0x8d49ce82c62cf5d5
	.xword	0xcd37feba3f80cb81
	.xword	0x6d086081cebd0aef
	.xword	0x2e056f6c5430449d
	.xword	0x988a748dbd2d67db
	.xword	0xcdb21aad72a850e0
	.xword	0xb15e0892ad0e3fb8
	.xword	0xf8b7d429f908c741
	.xword	0xe0c694943f95da7b
	.xword	0x8f2b0889beae06e5
	.xword	0x7527e462faba748e
	.xword	0xf8a08c5fe6d6197a
	.xword	0x1bdd16a800f7326f
	.xword	0xd65cf2a65a758913
	.xword	0xa44e0a396d419243
	.xword	0x7549192febdb5c1f
	.xword	0x2d5b590c9dbbaac0
	.xword	0x6bd8acbaf979f874
	.xword	0x7ac7ee64b31a5d85
	.xword	0x0bbac6ccc45c1bd5
	.xword	0xc5549f8ade9b8d99
	.xword	0x35492530bd2620e2
	.xword	0xfc5223deb7032f71
	.xword	0xc76817e43263ad63
	.xword	0xac9e00d2ff514e97
	.xword	0xcb1a34dd9ee643f0
	.xword	0x5a943ab4f85f427e
	.xword	0x6d12e053b1f638bf
	.xword	0x8ca72e1416289133
	.xword	0x822f16b0b28d4d66
	.xword	0x6d7a129b2a2a8efe
	.xword	0xccfaf1e4d91c03e6
	.xword	0xae434b9c64e6c04d
	.xword	0x2e50504a98811eaa
	.xword	0x1509b1ecc14e2761
	.xword	0x9b9149ef52b96415
	.xword	0xad7f23b7ed5b1b26
	.xword	0xf7f3f7905274c80b
	.xword	0x205b29662f42f341
	.xword	0x684b58465c885e9d
	.xword	0x1a90998c8621c5d3
	.xword	0xc43f433ea9c9ee71
	.xword	0xb5fa226b3ee98054
	.xword	0x500949ca10afcf74
	.xword	0x9498ab1354488d96
	.xword	0x411000ba4d838aa7
	.xword	0x83bdf7262f2613ca
	.xword	0xdd970cc3a03f47df
	.xword	0x4cac8d2ee31efe84
	.xword	0xd284b80265a38c08
	.xword	0x19d15cc8d6819bee
	.xword	0x5ad533cdb8e90402
	.xword	0x5ad6006bc0c3ce78
	.xword	0x79d3d711447d9172
	.xword	0x65ca8f79064a3d11
	.xword	0xd499691677704aad
	.xword	0x3c47272d9ec3ddb6
	.xword	0xaa04390f1294c2d7
	.xword	0xb1bf7d7f39197218
	.xword	0xb61229e9cd50f501
	.xword	0x0242a5f425b7ef06
	.xword	0x58de1701fc508201
	.xword	0xd326639c5289d6b3
	.xword	0xa54d1e24248aeda6
	.xword	0x151efb7013121aae
	.xword	0xfc733d9879f74dc8
	.xword	0x22eea754f2a9aaa0
	.xword	0x4780111aa5d7d943
	.xword	0x314bedc92918c703
	.xword	0x0ea303d5f33e0aa0
	.xword	0x41b82fdbae202c0f
	.xword	0x1dbf48c18bf732a8
	.xword	0xc8124343e267f7fe
	.xword	0x35a167b1e9c8bd8b
	.xword	0x55de66e23a8bfa75
	.xword	0x94b2d4cf83326349
	.xword	0x643ec1f20a93b459
	.xword	0x0d5293c08c1bc173
	.xword	0x7ec017888c8dbcbd
	.xword	0xd6fc39fb696099b4
	.xword	0xab47e163811866a1
	.xword	0x222e0aecc5709841
	.xword	0x511f734ec61cfc37
	.xword	0x61dd85ad3ce7426d
	.xword	0xdd88f85867dad7d1
	.xword	0xfe106509b57f18eb
	.xword	0x96cec732e8d882f4
	.xword	0x0fad40de5931fdc6
	.xword	0xd46d251eb07c393d
	.xword	0x4bebf7a21b93eb5e
	.xword	0x45b9b102b9da6be0
	.xword	0x5b91f5546449602b
	.xword	0xa89d70c6227170ba
	.xword	0xc52d25aa8a353927
	.xword	0xcbb846d77e10257d
	.xword	0x27c08cb32d3ff43c
	.xword	0x05310a220e05f00a
	.xword	0x6db0f679edb3e8e0
	.xword	0x64daf26d4d78f1ed
	.xword	0x8a453532036bf3f2
	.xword	0x724ffa27d8860f55
	.xword	0xa2b453fd8cbe1829
	.xword	0x0a4f13a61e343e88
	.xword	0x1949339e17ec3f00
	.xword	0x1c0a39995a673047
	.xword	0xee8e65f6df6c0143
	.xword	0x8740edf801332b1a
	.xword	0x61a8926f8c4dd148
	.xword	0x23be00160f837872
	.xword	0x24c6e1de051a3023
	.xword	0x04647840243b761b
	.xword	0xcc1923a102a42a2d
	.xword	0x564f41e0c8ea9801
	.xword	0xcd096078948966a6
	.xword	0x042de1c42acfad79
	.xword	0xa10de8d48eda46f3
	.xword	0xdf70165d1a7bceb4
	.xword	0xd7aa949f463fbc0f
	.xword	0x1aa17c764457672d
	.xword	0xcb4c4edf4db3237b
	.xword	0xe5dcb1d3e5af19a1
	.xword	0x1f08abde15819ee0
	.xword	0xb130bcf415029f88
	.xword	0x2894d9261a91831a
	.xword	0x8d8e2300dc23038d
	.xword	0x3672fe6995b0ff49
	.xword	0xb530437363542476
	.xword	0xcb98d2b8e6190b55
	.xword	0x314d1ad502cad7ec
	.xword	0xe3a258b86335da12
	.xword	0x11cc67bfdb26ed3b
	.xword	0xc0fd57e2ac58e575
	.align 0x4000
	.data
data_start_2:

	.xword	0xb3bbd466563bc746
	.xword	0x56658f3928ec24da
	.xword	0x0009021d58d5ca6b
	.xword	0x6d1c8154545d692e
	.xword	0xdc55ca39297164a3
	.xword	0x224e5ea1ff5f638c
	.xword	0xc5ede1053df21232
	.xword	0xefc5564952d77ec4
	.xword	0x8a84e32dbd80eaf9
	.xword	0xb21f72ea5b73bb12
	.xword	0x510dc759e42a86a3
	.xword	0xa0221593a1a6a62b
	.xword	0x5ef022cc6fcbd625
	.xword	0xc9b6da77c23bbf21
	.xword	0x2c2ef776f481242a
	.xword	0x8f0ff80082f2e439
	.xword	0x5a9389ae21e4b3af
	.xword	0x559ac98b6d5ff1a2
	.xword	0xec08a4c937dca2d5
	.xword	0xbb6e8423767a1f05
	.xword	0x9844c45616dfba63
	.xword	0xd3d2f4626c686cea
	.xword	0x0e39a72d6e043d5c
	.xword	0x1464dcac361cff02
	.xword	0x59f5d409ce052db8
	.xword	0xcb65cd6ee00ec2d6
	.xword	0xcf9655cf6a59ad5a
	.xword	0x89d40f56e878e11b
	.xword	0xb4bf594eeb599632
	.xword	0x7e55436b6021172a
	.xword	0xdb427f02aec50fb8
	.xword	0x4975e8b9f8765cce
	.xword	0xf6faa501cddde7c6
	.xword	0x44f048d71a341118
	.xword	0x632661dd62c18252
	.xword	0xc3bd91f60ca0ea51
	.xword	0x01287a009c8339b0
	.xword	0x26c7579947e13658
	.xword	0x43b9d4d172ca85e9
	.xword	0x6e408129c2aad144
	.xword	0x02c3d27f7acce2c3
	.xword	0xa75f85c26df73090
	.xword	0x4e3e8c0b132c0aff
	.xword	0x123b400df18d1361
	.xword	0xdd564c4ffa46339a
	.xword	0x365d86b536092186
	.xword	0xb640acd6f603eaf4
	.xword	0x3785b31d5e2869b7
	.xword	0x12e623c195f72d75
	.xword	0x0601858a7180ba20
	.xword	0x09fbaba9afe9636b
	.xword	0x5747bcc48837bbf8
	.xword	0x7013ae59d6b6e057
	.xword	0x098fe63e4a5c8086
	.xword	0x282fcaeaa6bfa20d
	.xword	0xef200a10b1d9e43f
	.xword	0xc44b57bb4e7a89ae
	.xword	0x6e25d475de0125dc
	.xword	0xe8be44ad6c9dd571
	.xword	0xd792f7461217c968
	.xword	0x1b1d6b0f995ac51a
	.xword	0x7a07532a1d3b6087
	.xword	0xa1c6c7be913ecfa1
	.xword	0x90c88728c3b52264
	.xword	0x766b5192f43a3fc7
	.xword	0x03c7d1b7ed48d008
	.xword	0xdd2894b925e3f20a
	.xword	0xe773e140cf082de5
	.xword	0x91f28fe5f1d3800c
	.xword	0x5c70d0e2348f3b80
	.xword	0x067c8438648bf1e1
	.xword	0x527da9fc7d19f889
	.xword	0x1c949843c278c17a
	.xword	0x36d265b258719466
	.xword	0xe59daab244d08f21
	.xword	0xd9ad51b3d9757f1b
	.xword	0x8f14388581c59889
	.xword	0xce5ebff975b6ce31
	.xword	0x7bb12b47fa7df444
	.xword	0xa35a26700788f381
	.xword	0xf0cb43ec8f8d8d4a
	.xword	0x90c88ef5ce4f7149
	.xword	0xdce234c3efb40c85
	.xword	0x21a38654cb89deb7
	.xword	0xc367779a1b40a0bc
	.xword	0x7d756b44b382ad2a
	.xword	0x8897ce3bd4f5e639
	.xword	0xbbca09a223adae33
	.xword	0xd5551fec7e6abfe3
	.xword	0x166e328cd590fa36
	.xword	0x6727d3cb8dcf7389
	.xword	0x8802fafd1643610d
	.xword	0x8d3b2680dd4d3c25
	.xword	0xba71b7844d2dfc3e
	.xword	0xd36dca0c68f447e6
	.xword	0xf947483b4f817032
	.xword	0x3296a4864657906c
	.xword	0x4239fa8b23bc658c
	.xword	0xe02b200845da6318
	.xword	0xc5d759535acdccc4
	.xword	0xeac9af630a259919
	.xword	0x6d2b9f203d8556e1
	.xword	0x3b690b60a8afe823
	.xword	0xd7c5d669d2ac1332
	.xword	0x3f7393d970e7fa80
	.xword	0x518f63c6de5ad5fa
	.xword	0xac0e583e5af5c2ef
	.xword	0x6b54c56912dd47ec
	.xword	0x5c23894d8839b190
	.xword	0xbb06837b4acdae8c
	.xword	0x23de0a230792c253
	.xword	0xbd56dd3f42c8a689
	.xword	0x64d13bded8434d28
	.xword	0xdf766b44d290bcf9
	.xword	0xde80fe71e8cc9e4f
	.xword	0x7a5e18b3de75c731
	.xword	0xbe541f2c7545bc16
	.xword	0x8d71122e66ccc3a0
	.xword	0xd11bbb6ad1030c89
	.xword	0xecefdc32f3b5ad9c
	.xword	0x3129ce7f1a8f8a25
	.xword	0x8ca96f14d3e9f2ec
	.xword	0x27fb28615e9a23bc
	.xword	0x85df0d87b234dd64
	.xword	0x2a8b951da9821aaa
	.xword	0x33124a20d2aa536f
	.xword	0xecca026716d43f72
	.xword	0xcbca6bf9c89a927a
	.xword	0xafca78b477b240b6
	.xword	0x90561e16ffd22804
	.xword	0xc07de7939a45b7e8
	.xword	0x642ed3557e972ba0
	.xword	0xf935389e296c00f2
	.xword	0xc50ac80b53a929ce
	.xword	0x606ea2cd4f17927f
	.xword	0x790aee710648ff82
	.xword	0xada92c1b14238528
	.xword	0x198120b4bd3ff788
	.xword	0x1e01dfd21b2c4241
	.xword	0xa6f67d6004ab7b54
	.xword	0x4098c178d3ecd8e3
	.xword	0xfa8d271ce9662730
	.xword	0x293c0d68f84291b1
	.xword	0x9541ca32c0169fac
	.xword	0xd6cc6c0be230f2b4
	.xword	0x69d62ef1ef2dc27e
	.xword	0x5f8f95db23047ee7
	.xword	0xbb4d910d1fd193e7
	.xword	0x6f7bc4a7b3623d5a
	.xword	0xc64f9dd5b081cec0
	.xword	0x293ee7f2e8e66d30
	.xword	0x4b773e4dfb266109
	.xword	0xf8159ea20cb3089f
	.xword	0xc22eec9165ce715f
	.xword	0x31cd9cf8f8f8fac4
	.xword	0x39afdffc77681b45
	.xword	0x157f2b63b344f8ab
	.xword	0x2ecbf2cc2e8440b3
	.xword	0x08bc4f491ae6bf7c
	.xword	0x062463ad601a177b
	.xword	0xac77dd452a754d04
	.xword	0x20cd6a15494e7ebc
	.xword	0x5fc00dc902dc652c
	.xword	0x1fa137885c2250c2
	.xword	0x3184fc6525725327
	.xword	0xdb0620effd3cd8b1
	.xword	0x6e39369cf3f74764
	.xword	0xe403e6eb952ddd2e
	.xword	0x3fac61e661162c73
	.xword	0x95733278099e3daf
	.xword	0x623fc2d50a98aef1
	.xword	0x3bd85f6010d1a1a2
	.xword	0xcfa037305df25062
	.xword	0x9fbdc99b39eeac7b
	.xword	0x27a279923d5bcfaa
	.xword	0x390859af3519935f
	.xword	0xc89d758fdb893c46
	.xword	0x370e39760c7fb215
	.xword	0xf7611813a41813b5
	.xword	0xa4bccf3ed6269f54
	.xword	0xb0b013be95168d6f
	.xword	0x04ddf74a7af2385f
	.xword	0x0039f0d8863a2879
	.xword	0x881045a8ea7e8dfe
	.xword	0x645ee6062f4bab3e
	.xword	0x150465f998920fc2
	.xword	0x5d11592f96f22ab4
	.xword	0xa63fff2ab97c993d
	.xword	0x71f3cf5a0f666dc1
	.xword	0xb1ede1bda301be02
	.xword	0xde047e33f1bc8300
	.xword	0x76f334d1c037b2b1
	.xword	0xf8f0dd127c5a45a4
	.xword	0x7ec381965962ee82
	.xword	0xee743992f20de7c9
	.xword	0x3570d6f7c38a9ff3
	.xword	0xc99774340d6e1d77
	.xword	0x4d51a9bc5a77e1b1
	.xword	0xd80fdaf078544ce8
	.xword	0xc1ef36465084beb6
	.xword	0x5fb2cfa920ccf17b
	.xword	0xd1383dc2add3258f
	.xword	0x25a8fa70122590e0
	.xword	0x2848b5a2e084f69a
	.xword	0x6cdf744397d616fc
	.xword	0xa83681395aca82a1
	.xword	0x06bfec002ad923b2
	.xword	0xe3fb5206968f958f
	.xword	0x44deaea12993378a
	.xword	0xea2a26bdc4a245f2
	.xword	0x1eafa814e41defd9
	.xword	0x3ce21506a005b695
	.xword	0xc4ef4813b7737858
	.xword	0xd529dfe6d594e561
	.xword	0x0d627084478467b4
	.xword	0x590eeb487ce153b8
	.xword	0x8753893fc4ace90e
	.xword	0x95254c6b2045a359
	.xword	0xaffa9b5e8d129238
	.xword	0x52ce7e60bf44403c
	.xword	0xcc0647d77c97c1c6
	.xword	0x7df3064229522f96
	.xword	0x03008249b6c7c930
	.xword	0x3f75aa227b1f4207
	.xword	0x755a1c35d650f09c
	.xword	0x6571400901a6a31b
	.xword	0xbddc293a1892e733
	.xword	0xdf5499b97c76b9ae
	.xword	0x882b50c2f4d43198
	.xword	0x047014d1866fe681
	.xword	0xb10bd8141a48120b
	.xword	0x4b840eef813eab6d
	.xword	0x268cea3d40ffecec
	.xword	0x9595875f05b2dc3a
	.xword	0xc055d8f4c466b6c4
	.xword	0x2a461f0fbde6e330
	.xword	0xe6efc2855fa0a43d
	.xword	0x43fb7bd330a10c7d
	.xword	0x844b0a7ab282e88c
	.xword	0xf8e98649d190ab11
	.xword	0xa9fec2839e7c72d6
	.xword	0x35cc0cfcb378d8bd
	.xword	0x975fa9ba70729944
	.xword	0x0b826d9b66906e0d
	.xword	0x4d00eca66c11c188
	.xword	0xcd1069a937529030
	.xword	0x655c81690b442f83
	.xword	0x567e84c8c38326b4
	.xword	0x265fab1d4537bea4
	.xword	0xee934b1b897e9191
	.xword	0x4afe7bb7739c2e36
	.xword	0xb31e37df71c6ba21
	.xword	0x2e9c8974c0bb5475
	.xword	0xd766a52f5f52c16d
	.xword	0x4a6311a9ccb49af8
	.xword	0xcb1a3875df753202
	.align 0x8000
	.data
data_start_3:

	.xword	0xe20de0f116a751af
	.xword	0x368e75a8e94acf3a
	.xword	0x1794b2a95a6014b5
	.xword	0xb1c2e1eeb32f88fd
	.xword	0x1fd51fb6cf88346d
	.xword	0xa9ee6b9d6c5bf274
	.xword	0x2a8a144c112be872
	.xword	0xe9a9a638612bd565
	.xword	0x5bea5550177b2307
	.xword	0x23f64a276794e95f
	.xword	0x317b7d1ece887dd5
	.xword	0x1678d6d455e0129b
	.xword	0xf4e052529cf92a9d
	.xword	0x5cab89c9cc48b243
	.xword	0x2fc83e89164ec739
	.xword	0x31ca89d9ba0c84e5
	.xword	0x34dd7b9b16b8d2c3
	.xword	0xc074cbcdd0b2e4e3
	.xword	0x0d316883e739aa85
	.xword	0x1170a919f0c16b6a
	.xword	0xf94ba6dcaa584f9d
	.xword	0xa04dd78f9ad0e067
	.xword	0x9f3308c16dfdb535
	.xword	0x338b51c8271f564d
	.xword	0x53e8870209840898
	.xword	0x2b1b900298a2dee5
	.xword	0xc1bcf17860b95bd5
	.xword	0x5d6c921c902634ba
	.xword	0x2d59d526f8c8b324
	.xword	0x2c1f0a4963299709
	.xword	0x82bae3d3354117c9
	.xword	0x04081040b4935e97
	.xword	0x3ccc4a8f9329440c
	.xword	0xee67b6aebb3e5fb3
	.xword	0x5c4b043df56e3c92
	.xword	0xc505a7611c5ac60f
	.xword	0xb094543244467a15
	.xword	0x39205e73510c76fe
	.xword	0x3e90ddd20cb9653d
	.xword	0x71c1e677661191c1
	.xword	0x78e14ee912486743
	.xword	0xdf4052f6e8964aaa
	.xword	0x3fb2af765df636ac
	.xword	0xa1a74b38bf723eed
	.xword	0xf37ab9b0b15d81b0
	.xword	0x132cb1db59533cfd
	.xword	0x601ddc950e08ab72
	.xword	0xbf41b252fe42a100
	.xword	0xd4c7d84c18eeebb1
	.xword	0x4f69b8eaf62aac69
	.xword	0x1b9f9aa16d29dea4
	.xword	0x4ee74afdb2724bce
	.xword	0x28764cfee3e987ba
	.xword	0x282341aebed061df
	.xword	0x8f804659647dd1e8
	.xword	0x94ad39a48232fed0
	.xword	0x689d1bd6317168b5
	.xword	0x0f87c11d668ee9ff
	.xword	0x329fb888b945ac85
	.xword	0xc03f35fb4c03b364
	.xword	0xa18526323563b5e3
	.xword	0x5b919e227da8903d
	.xword	0x8566847038ae2771
	.xword	0x8b296c248fb047be
	.xword	0xbfb83159842d2c41
	.xword	0x61779ad1bd395745
	.xword	0x8dcbed27c352fbf3
	.xword	0x754037dc836e76dc
	.xword	0x59049ff6c4d48129
	.xword	0x96d3a60706135b8b
	.xword	0xbafc104909b157a1
	.xword	0x9f11eb1f758ffebf
	.xword	0x0a25af8bd0febd4d
	.xword	0x207a8a7de4f3902e
	.xword	0x6f93f0eb408e468f
	.xword	0x92ced23b0d7539b8
	.xword	0x6a3606eb1c8c9a63
	.xword	0x3bc402907a9e2f3a
	.xword	0x32b80c81da084c8f
	.xword	0xbe7244e10e7e9d99
	.xword	0x0e96291bb80eaf53
	.xword	0xc0cd946d1fb73d71
	.xword	0xc8a226e15d527e9d
	.xword	0x5223860ddec2acf0
	.xword	0x5d74346e74256a99
	.xword	0x152f39116005c127
	.xword	0x25ca5330037391d4
	.xword	0xdc00df8b915858d3
	.xword	0xeb8120411a5ee8be
	.xword	0xbdb93e804f60dc99
	.xword	0xee0235948f3c1961
	.xword	0xf15d65cb03de4b4a
	.xword	0xa9595843e828b6f2
	.xword	0xfcc4f3f676d55f6f
	.xword	0x1e038daf30ca6dc2
	.xword	0xe7ae4eaf545b0d44
	.xword	0x9e298dc0b6576c71
	.xword	0xb7ec92cf5446e98c
	.xword	0x5568b58b1fe19d96
	.xword	0xbc5c77ad8a746343
	.xword	0x247820aaf3a48907
	.xword	0x96d40a10a25b1f30
	.xword	0x297224d24c7cdce6
	.xword	0x3ce9fbc0fc7f2c11
	.xword	0xf4b796b3ffd0f3b9
	.xword	0x65a61a3a9219b2b0
	.xword	0x2769b218700f4f98
	.xword	0x22f218730ff43b33
	.xword	0x936604b255864ffd
	.xword	0x099734823ab43325
	.xword	0x0a511f48f6447843
	.xword	0x04015a5cfd2e84a7
	.xword	0x9e49eaea69575932
	.xword	0x24ea4890e0825f9d
	.xword	0x2d950f0079e06118
	.xword	0x444b0adce87a0ae0
	.xword	0xcdc7a6cc6477627e
	.xword	0x6c664a37a31b0b9a
	.xword	0x04c29528c6c0b3ef
	.xword	0x26cad2d61e19b7c0
	.xword	0x2460697695b9ed62
	.xword	0xf25dfa714a2e499b
	.xword	0xe5be771a171540c3
	.xword	0x2482dd08feb079c3
	.xword	0xbb25bdd60cf2b73e
	.xword	0xd3c2d293c4ff012f
	.xword	0xa7c9ead6498aea46
	.xword	0x6651d1cbc946e577
	.xword	0x1f5947199659baf9
	.xword	0xe256d78569524d06
	.xword	0xefe381bbcba0b34d
	.xword	0xc75836cf69c244e7
	.xword	0xfb02d540d8adbccb
	.xword	0x1e205ad3b7332fed
	.xword	0x9d5898d921a8fbdc
	.xword	0xc02feaed2fa8bba0
	.xword	0x162cb7acbc3da298
	.xword	0xce35f7bfb3267e63
	.xword	0x793f7b4abe42d96f
	.xword	0x1a75e6895785b453
	.xword	0xa72dcd9110c27efe
	.xword	0x2109456a43f536e8
	.xword	0xd8f5244a72caf40b
	.xword	0x2a56683ada31043f
	.xword	0xff3341a85d8978f8
	.xword	0x1be22127aa36f8f5
	.xword	0xf281150096e0c0c1
	.xword	0xe96870420ac20f3e
	.xword	0x0bf05130587a771a
	.xword	0xb90b5c165ce0d2f8
	.xword	0x0e32c716d80c658a
	.xword	0x8dd545a9eb5e644c
	.xword	0x67e89ce35e9fab27
	.xword	0xa99e1cd1a15685c2
	.xword	0x1ea6fc27a26c3533
	.xword	0xea42a678e8582e2b
	.xword	0xcde99350baa46ca4
	.xword	0x9d6488e96c502301
	.xword	0x9f14ee7064da0f1b
	.xword	0x3b63c4b19798895a
	.xword	0xe1ac9308d62229c4
	.xword	0xd7b66f1acca321d5
	.xword	0x6b5438a9c648c00a
	.xword	0xdc0f3900eaf4dd57
	.xword	0x85c0d50b0560acf2
	.xword	0x4eb4bd59a96b28ac
	.xword	0x3d946d4ddcf080b4
	.xword	0x7f419ca9dedba71e
	.xword	0x4ded95e3897cf552
	.xword	0xa0db5c73075ebb8f
	.xword	0x589c9dc120e5e8ce
	.xword	0xdee32acd9a2ecf95
	.xword	0x49d563f67229774e
	.xword	0x5ec21c5ce2d5d7c6
	.xword	0x4f05d35ecac37b40
	.xword	0xe7a4f0e0cc18eb29
	.xword	0x56fd4eca48a49505
	.xword	0x2033960dc4a2c8dd
	.xword	0xd392ca96533c62f7
	.xword	0x6e8ce20978f1524b
	.xword	0xef46ccb1f2cd50ce
	.xword	0x288fa113b346a27a
	.xword	0x7bd8bc4d0612253d
	.xword	0x4fad3992368b522a
	.xword	0xe91fb22954ec422f
	.xword	0xfb0009d087af0f9d
	.xword	0xd7bb78ab6b5cac71
	.xword	0x9a178b2ff46a43be
	.xword	0x11cf3e6289181f26
	.xword	0xaeed4d5a974af165
	.xword	0x3893904751f7b4c3
	.xword	0xbfdbf0ee2d6d6d2b
	.xword	0xafc9b719b6dfb5d5
	.xword	0x79895ba69674e9e3
	.xword	0xb14e66b57f1e624f
	.xword	0xab17a8263fa66bec
	.xword	0xf8d34c1ea27be980
	.xword	0xdf9c03544aac9c2b
	.xword	0xb4fcfc847e2205c1
	.xword	0xefecf46c802ddfcd
	.xword	0x494f3a688355fb8f
	.xword	0x1f7c2e3dda3c392f
	.xword	0x37188f2c0a58db77
	.xword	0x4b3ea1ac40c8895c
	.xword	0xcbef27c7fd5b4a24
	.xword	0x4ef6d17f964af7fc
	.xword	0x0d2ee57680d441eb
	.xword	0x9a74e05d9abb1070
	.xword	0x28eb0813d00a5f80
	.xword	0x872899f651b6b4b0
	.xword	0x6e9874e8cc81ffcb
	.xword	0x0b1b9669d8821f94
	.xword	0xb3cda57f5ad51cf1
	.xword	0xca3a124d2a3f53a5
	.xword	0xdd8f5d58b27dcc19
	.xword	0xf57eaaba61b3d00d
	.xword	0x5993b49ee20ef985
	.xword	0x589a856f56d64c3c
	.xword	0x39cb1d7dfcdb42bc
	.xword	0x6c71807e5907d0e6
	.xword	0x3406cb92a4140b53
	.xword	0xd1ed154ee5a616ea
	.xword	0x37a8e0255c788b82
	.xword	0xa014edeb10073be5
	.xword	0xd9d37c36eaaeee7b
	.xword	0xc03f6e666bb0b1d5
	.xword	0x838a471c5abab644
	.xword	0x43aa496d963b1ec5
	.xword	0xac3c709c563eb912
	.xword	0x01cdcaed9b6eafaf
	.xword	0x42f87b7b0572fc5a
	.xword	0xbfffd49e1732e776
	.xword	0x4b97ee6f0a1b6cdb
	.xword	0x9aa6af11fe84ef13
	.xword	0xfbb2fecd01f35fac
	.xword	0x1a1bfdd7459d933c
	.xword	0x39b60a3b84afb3b1
	.xword	0x94c99108d058286c
	.xword	0xbe8789b5a1b30d0e
	.xword	0x1c6ff7b54f79e50d
	.xword	0x55a1282bdb885f85
	.xword	0xf2e52f30ff6efb0a
	.xword	0x4bc8db926212a7d1
	.xword	0xf8bf55b69afeee53
	.xword	0xb4d68eacacbbf91a
	.xword	0xb1784774aec73c4d
	.xword	0x166c8e9ae90dd428
	.xword	0xf2acbcca21aa19da
	.xword	0x3436f86de0a38b43
	.xword	0x75f3d6a8bba38bf7
	.xword	0x6c3f284a7e6aa66e
	.xword	0xbb4a89cd7941a61f
	.xword	0xfc8626629b24e618
	.xword	0xaf5544e8424adba7
	.xword	0xbd4205be7f3ec1d3
	.xword	0xcfb96ad2f0177092
	.align 0x10000
	.data
data_start_4:

	.xword	0x54c2526676aff6c3
	.xword	0xb6f63cc08e58f5c3
	.xword	0x9d85af9ddfdaa862
	.xword	0x5ead91146acb4289
	.xword	0x714508582acf74c7
	.xword	0x5d492ea75acfc1cd
	.xword	0xf1bf10f93871b29c
	.xword	0x3245d530a0af2ccf
	.xword	0xcaadf064d3a3f90f
	.xword	0x46b7d3104a515319
	.xword	0x18dddb3bef91d61b
	.xword	0xcea118b5078572c1
	.xword	0xa89b236b4bf0a5f5
	.xword	0x2408b32adf6cbcb3
	.xword	0xa1f8baeca9a9971c
	.xword	0x5486dca46b7815a8
	.xword	0x35990b0d4c2389fb
	.xword	0x213ccb9be4423aef
	.xword	0xc7f9cae2c15a8dbc
	.xword	0x6105ef4096b30f37
	.xword	0x62fdbfb36b2efbcd
	.xword	0x5d56058138413235
	.xword	0xc0bbdb3a35144f20
	.xword	0xb3cc2dbd9da67964
	.xword	0x1505dc4cf0b153a0
	.xword	0xf46acaf8d6f4fd56
	.xword	0x1193f8139495e68c
	.xword	0x7432b415e8476478
	.xword	0x01aa8f32560ee4c1
	.xword	0x38b5b5daf76266a7
	.xword	0x1250372bcbf4a559
	.xword	0xddb581fc50b9f016
	.xword	0x7dda5c2574740e37
	.xword	0x9fc58cc2814dcca2
	.xword	0x6c8cfca7f514f8eb
	.xword	0x0b5a7af589f3183f
	.xword	0x7bf69b25fbbb5999
	.xword	0xb707b37ce8b860fc
	.xword	0x136583c95c72dc83
	.xword	0x37468ab55b3fbf93
	.xword	0xef540e72d6773eff
	.xword	0x2a92cb8470f76c85
	.xword	0x17053dd59ee7ea2d
	.xword	0x4c392568e8116839
	.xword	0xefcb5601d8f33d26
	.xword	0xdf7c0ce0e566683c
	.xword	0x00c9db335db1ffb8
	.xword	0x8be148f62e3aaeeb
	.xword	0xa1415a5e275e369c
	.xword	0xb10695841c8f6593
	.xword	0xc96a6db836f56692
	.xword	0x2cf9baacdef0850a
	.xword	0xfe777f377e13d655
	.xword	0x0b69229a094a9a70
	.xword	0x32c17fc31c9c34da
	.xword	0xce83e41fb64f742e
	.xword	0xc31e35dd9bb9d353
	.xword	0x45f4584cdcdcc451
	.xword	0x0c10be98286548cd
	.xword	0x36d07a6c143a217b
	.xword	0xfe32d3ea589b7349
	.xword	0x2c05720f6e1ae585
	.xword	0x21235079de58cf4d
	.xword	0x9b09857b5ae6ac4c
	.xword	0xdf0cb2ea15929094
	.xword	0x0240fd434e22300a
	.xword	0x5c561676a738f5c1
	.xword	0x3485a7c1b336bc30
	.xword	0xfb024c855da99997
	.xword	0x1edccf38dda38693
	.xword	0x81981a538a4ffdb2
	.xword	0xaffa153d79de790d
	.xword	0xa7f64f486a966d05
	.xword	0xce3d16f1361803a8
	.xword	0xb401a3676de0f420
	.xword	0x8b79f188e11f1eaf
	.xword	0x1b97997a1df57070
	.xword	0xf652e604257ad92f
	.xword	0x79673493ba25bfa1
	.xword	0xbc934b3b5e479543
	.xword	0xfa2f8a22ee342048
	.xword	0xb05777769089007a
	.xword	0x0036007e1b14e23e
	.xword	0xd7acbd134789c9bd
	.xword	0xff7561a2e7ef6675
	.xword	0x60d3e9c966868ba2
	.xword	0x7c3af0bda18b3887
	.xword	0xad8720ff8548e059
	.xword	0x07c0b7fa68f9b3a5
	.xword	0x2bbb575d62154086
	.xword	0xfe0a4a22be5381fb
	.xword	0xa0201b34b476d7db
	.xword	0x199c8891939007cf
	.xword	0xac8a0da073805470
	.xword	0xac0e4f55ff3489c1
	.xword	0x8d327b524dbf8af8
	.xword	0x2a562bcd15cc2e6a
	.xword	0xe0b2d7876ce5d7f8
	.xword	0xca8c0fc499d89fca
	.xword	0xfec9985cf7b87ba3
	.xword	0xdb76d60d1a6a4461
	.xword	0x1b9f3408f01993cf
	.xword	0xe5c1591c377181ab
	.xword	0xd04b46183ef8918d
	.xword	0xe5a48f4be5f5afee
	.xword	0xe993a220ff052c2c
	.xword	0x5b420837a14d1856
	.xword	0xfe1e268b19dc2076
	.xword	0x695e18521bb4431d
	.xword	0xc13052d22e904fcd
	.xword	0x3904cbe40535dd10
	.xword	0xee0f09d3563a6273
	.xword	0x2b68889b0ab626f2
	.xword	0xf3633c3184e3cefe
	.xword	0x644d478d023aa715
	.xword	0x11c5fa42e542f815
	.xword	0x4438938fa92b820e
	.xword	0xe57a279fa4c35236
	.xword	0x355c3dad3597afc7
	.xword	0x01672b30e748855a
	.xword	0x2b0036da69277fc3
	.xword	0x57301db5bcfcb4e4
	.xword	0x85366bdf5c1007b5
	.xword	0x19c416db2d003476
	.xword	0x98a85759f5c6c241
	.xword	0x21ba50100785bdaf
	.xword	0x0597f9ed01c39c13
	.xword	0x7f5967c8c165636b
	.xword	0x6975744392215f54
	.xword	0x099eab9f169012f2
	.xword	0x1593b9384009f364
	.xword	0x34e42561681fede3
	.xword	0x3831f6a358d78ebc
	.xword	0x8428df88a6598aab
	.xword	0xe1625867a5a90a83
	.xword	0x4e0a4d4743f17c1b
	.xword	0x34aece1437ab0346
	.xword	0x3e2e43b7fca850e8
	.xword	0xab2152820dce4210
	.xword	0xb36650388968832d
	.xword	0x5412e45a24cbbc62
	.xword	0x48c0223f9226035f
	.xword	0xf7d8d158d18eb208
	.xword	0xa7cf1fdaa4c7ed9b
	.xword	0xc8191b890c565605
	.xword	0x01715e12ade5629f
	.xword	0xeb602864f33fc92a
	.xword	0x969f49e56e1980ee
	.xword	0x30b4e5abd96daae2
	.xword	0xb84f4b8c6dee622b
	.xword	0xd325be2079ade9dc
	.xword	0x355ccc7b54e460c0
	.xword	0x04cd0bd6ff568765
	.xword	0x866d7424b00018ed
	.xword	0xe5458c2a4b554dfd
	.xword	0x2c7e67e44be75fa6
	.xword	0xdaeb463050eb609d
	.xword	0x3923c8479896ee93
	.xword	0x7ac31981eede9195
	.xword	0x57f54a5ea51963cc
	.xword	0xdd8bc94df0b40c82
	.xword	0xab30be9313e225e4
	.xword	0xf27adacf12b58f93
	.xword	0x881372f9df90e3d6
	.xword	0x99fa3618168192b6
	.xword	0x2bfdadd322790650
	.xword	0x80666f1c07e77470
	.xword	0x186249a9a1b1d138
	.xword	0xe8ccef3ed23977c3
	.xword	0xc25758c6780fa4aa
	.xword	0x3067260ec9f19184
	.xword	0xdeb2f05e46588615
	.xword	0x2f0f320e87aa184b
	.xword	0x471f65e46ec66bee
	.xword	0xd005b7afeda559ef
	.xword	0x965ace32823d59f4
	.xword	0x32aacd69edf73155
	.xword	0x35159f0777c27b7c
	.xword	0x1abb0ef3372f5933
	.xword	0x12bdb38c0462d508
	.xword	0x492466a33173568c
	.xword	0xde4ee0af8c5a2558
	.xword	0x493469b931afd61d
	.xword	0x2eacf9f659f44d52
	.xword	0x09ee2db383a20bdc
	.xword	0x2e23880fb054bf5a
	.xword	0x1fd0dc1fd1c435cf
	.xword	0x80846933e441aa81
	.xword	0xded83cf63a1132a5
	.xword	0x426906d0c3462eec
	.xword	0xc97ec2967d82756b
	.xword	0xa0718c00eba0e69c
	.xword	0x20a1b1fb79ea4fae
	.xword	0x316627861747e57a
	.xword	0x11bc9d6e905f46f1
	.xword	0x1b38530c8ca86564
	.xword	0x877248c34816e23d
	.xword	0x4953c0506fabfa3a
	.xword	0x00f3ae0f71f8f331
	.xword	0x470f4375470de45f
	.xword	0xe0656b797ae7548b
	.xword	0x79120aceb75f272d
	.xword	0xf020f24e6faeb6d8
	.xword	0xa59e9f0ade3f9ae0
	.xword	0xb0d63513d5b219d3
	.xword	0x6051158448768265
	.xword	0x1824ef43ced5b077
	.xword	0xd3c91e85e681b08b
	.xword	0xcf7576f7f0bb973a
	.xword	0x21474b29a87c828f
	.xword	0x135376ea54e0eadf
	.xword	0x44bcad4442c4ee73
	.xword	0xd107bce49ffef69b
	.xword	0x61c2e8fac19af2bb
	.xword	0xb88349e617f6b3a1
	.xword	0x6c9e106885c51d83
	.xword	0x5d3ff9712ce9221d
	.xword	0x3d196c8c24251410
	.xword	0x9dde8bedec46025c
	.xword	0x9f99435502bb5eb7
	.xword	0xd22f504ed9d279ee
	.xword	0xab31f1503ca0c565
	.xword	0xeb6cc1496ecaf47b
	.xword	0xa4dd38bd01c34af0
	.xword	0x49460a86545f7b3e
	.xword	0x6e9c1e5bb9c76ff6
	.xword	0x5418b9c9d82df6b7
	.xword	0x42a88b94b616f7de
	.xword	0x320ef4d09b1bc3ff
	.xword	0xde87f7c419d3bdc4
	.xword	0x0deb6211aeadc7fb
	.xword	0x2961bb8d4d8ed5a4
	.xword	0x5bfc163115dcf4e3
	.xword	0x9b44297731cfc1cc
	.xword	0x6c6f1855bcbc31db
	.xword	0x12e177da0f2647a7
	.xword	0xb97fe91da9cb5cba
	.xword	0xdb31a6402dcaf046
	.xword	0xb04e9d540a7709b5
	.xword	0x24782e71f6d9eb78
	.xword	0x35b166f096e71755
	.xword	0xe247adfcba849080
	.xword	0xdb2391750e4b43f2
	.xword	0x25060fda52f526ab
	.xword	0x857c849cf9a2e68f
	.xword	0x199d40bbf1debcc6
	.xword	0x5d46ca7dc5629150
	.xword	0x6e164af508f1510b
	.xword	0xd70b01e2fab708f1
	.xword	0x47661180a6cca72e
	.xword	0x241379c59bce05b6
	.xword	0xaf47cfc8a4dd769a
	.xword	0x521c8c5e42819eef
	.xword	0x4e0dd5cdf832fa2b
	.xword	0x81d226deefac690c
	.xword	0x18f5c0b72a6da9f0
	.align 0x20000
	.data
data_start_5:

	.xword	0x6bd3afa7c5a3cbbe
	.xword	0x45374793d2d8a4c8
	.xword	0x3c10db8a449b7f4a
	.xword	0xf5f2e9e37ab1faaa
	.xword	0xf41a2810c1b5f5ff
	.xword	0x23eb77601f52f259
	.xword	0x52e38987e6ee75db
	.xword	0x42c80a7f1b6a341d
	.xword	0xfffbbbfbb6b58c28
	.xword	0xb1da63e859c96e13
	.xword	0xe1d0ec1060a707b6
	.xword	0xec0b155cf802c517
	.xword	0x5b16d3e57a04b8aa
	.xword	0xd92e432d24b5b396
	.xword	0x07a5d7e80296b1c4
	.xword	0x2c52c3edba5d05e3
	.xword	0x92db81714f642866
	.xword	0xfefe765ba382f98e
	.xword	0x142cc8bdc745fee5
	.xword	0xd67af909ff2b853b
	.xword	0x7e30f841ae88496a
	.xword	0x72a8fdf55769f077
	.xword	0xb9276b4545ac6fc4
	.xword	0x2b9deb40ffb403f8
	.xword	0x2bdac2694dea9f1d
	.xword	0xa56c8cafe4024da1
	.xword	0xcb4917cd7ea2fb8b
	.xword	0x045afc18c353eff1
	.xword	0xb1da0b0470883adc
	.xword	0xf2be790a7231d734
	.xword	0xa8241910695813a1
	.xword	0x5de82b3fa02352fc
	.xword	0x2522c4ba7e1d6a08
	.xword	0xd91715844dcbe151
	.xword	0xa1ec76b5fb4e220d
	.xword	0xe9530e5c8d2d5d3a
	.xword	0x1afea8c2c3aef218
	.xword	0x6ebdb2ee09759c64
	.xword	0xb970301a09862035
	.xword	0x6518501e7e101f1d
	.xword	0xcac1b2271080e0bf
	.xword	0xb918f6b4df63b104
	.xword	0x65f4e35f8ae4d267
	.xword	0x4e5c6f57e4fd6e80
	.xword	0x6c901df0b502fdf5
	.xword	0x20fa541b6982975e
	.xword	0x8cc1a17d653efcd0
	.xword	0x2155d362a153e84f
	.xword	0x4041a753f95f27d3
	.xword	0x9c3b43fc2adb4896
	.xword	0xd828eb9d35f34bb4
	.xword	0xc11b3b7a96090d40
	.xword	0x1c8fccfc43ec0acb
	.xword	0xe13fd5dfe065d3b4
	.xword	0xf56ddbd07c8ea92d
	.xword	0x993bc0bf48a23fde
	.xword	0x006f2a73720c084d
	.xword	0x0f9dde220ef1c7c1
	.xword	0xf6942ea9130b7a2d
	.xword	0xd29159955b6f8bff
	.xword	0xf8034563b92289ed
	.xword	0x4fbc53d8d17fbe1c
	.xword	0x20757f0b6aef4e07
	.xword	0xc036c8e21f576ec4
	.xword	0x10da474788ad4906
	.xword	0xea69816da0b81854
	.xword	0x8d3b865ac400d9bb
	.xword	0x0f3c162ad7a1c5f0
	.xword	0x83d468f71a49c1aa
	.xword	0xce5166b1ccba576d
	.xword	0x92043365b96dde9e
	.xword	0xc06955c715bd9fbc
	.xword	0x706b839ffa4ddae8
	.xword	0x56069721efd0f35b
	.xword	0x2be4743cef3de405
	.xword	0x3c34b135b32ea880
	.xword	0x935728b4a9554038
	.xword	0xa098228d4856f472
	.xword	0x0af39ca66d3b8d1f
	.xword	0x035714c7a2e4a73b
	.xword	0x8681b9b80639879c
	.xword	0x11e25dd723e64f3b
	.xword	0xa5bf58687991f6a6
	.xword	0x7caffd48a7f85bb1
	.xword	0x7c709075857b1840
	.xword	0x50a6c8f276c412e5
	.xword	0x3560c97fef30ab3a
	.xword	0x98dcbee3274d2d52
	.xword	0x6fb7651cf2c9d3b9
	.xword	0xeb105508ccd2c8b1
	.xword	0x7fc4a72898cfa2c1
	.xword	0x12a9946bf7174283
	.xword	0x3109590d92a954c4
	.xword	0xbf647a22a6b0c22d
	.xword	0x02a3e84d58e71133
	.xword	0xffc24bab341643f1
	.xword	0x4a00df6b1a181dbd
	.xword	0x0b0ede85854b3160
	.xword	0x1e157bb6ffb0e037
	.xword	0xe10a231927b7b02d
	.xword	0x87bd4add98c9bf94
	.xword	0xe9d9cf6deff7dd4a
	.xword	0xe669995fc0c9bc84
	.xword	0x94d391958ce30cdd
	.xword	0xc494ff3224fe4f9d
	.xword	0x32d1dccc6c3d4641
	.xword	0x38c5b68a8c8f9b24
	.xword	0xa6ddfc950a4fdcb4
	.xword	0x36f2dc810911d0a3
	.xword	0x7a01492d5a8b9559
	.xword	0xf945f8653d52d18d
	.xword	0xc7d0b0fc60a161f8
	.xword	0xe8193a72de611394
	.xword	0x99389446fc5ea266
	.xword	0x2b54f624aad2c728
	.xword	0x61435f82c75b7278
	.xword	0xa8ebe7e4c97d03d0
	.xword	0x055dddb2a1cf6c21
	.xword	0x8edf4f79abf14c5c
	.xword	0x3e805055d0d16463
	.xword	0x854948c839de1c22
	.xword	0xd06f0508cabb919f
	.xword	0x6f311a266a731a3b
	.xword	0x42687fd6d7917c2b
	.xword	0xc9d7cdfb65bbc76a
	.xword	0xa7a9dc863033b76b
	.xword	0x30c4c2ab0bc8e522
	.xword	0xb8df1ae63cf6afa7
	.xword	0xaa0a63313d73c597
	.xword	0xd9ff213d8a913c54
	.xword	0x7820b6e9f0ca57cc
	.xword	0xca49e3894cec4f06
	.xword	0x83fdd4d6d207779e
	.xword	0x2321ce489ec87801
	.xword	0x1c9505a2859b09ca
	.xword	0x037bccbbade78163
	.xword	0x5bdf2bdcd94aef7e
	.xword	0x8652df111bb8997e
	.xword	0xe2d990433c160367
	.xword	0x864ae3849e316997
	.xword	0x4d87eea2b28f824f
	.xword	0x2097a7f0cd906ea2
	.xword	0x4c90220934c1210a
	.xword	0xc74582c9d10c1cee
	.xword	0x04cdb9e901b27e4b
	.xword	0x0dd057bf27d13054
	.xword	0x9d1453025454bda2
	.xword	0x971e367f6fa33841
	.xword	0xd68aa3613fbb8533
	.xword	0x8a39d2e3062b7195
	.xword	0xf881dab921e39b0d
	.xword	0x90cf4463dc68e162
	.xword	0xe619f6d76ce4eb8f
	.xword	0xa44820594ff9b34d
	.xword	0xef78b1b6cedfb2ff
	.xword	0x020d6e9bc42ab66a
	.xword	0xdbb528484e071b82
	.xword	0x477f1bbe951dd093
	.xword	0x78ad316f23fc7768
	.xword	0x23ae57465a930450
	.xword	0x251fe3fbe27f08e1
	.xword	0xbfceb66337e20cd9
	.xword	0xf940e0f10df47406
	.xword	0x6da8a5ba279a0894
	.xword	0x402b83acb6b9d589
	.xword	0x4dd4eaf0faf64de6
	.xword	0x0c0e7f8d5d053908
	.xword	0xe6146bb261f60336
	.xword	0x2a0d0a9045e83b9c
	.xword	0x6802fac0214e7990
	.xword	0xd47d11dbf01fc643
	.xword	0x1ed21935e2367790
	.xword	0x8e6948e5ee60737f
	.xword	0x8ec0c4bd0e241d83
	.xword	0xe4695e0c71c335d1
	.xword	0x0afc4c70c3484556
	.xword	0x2502f28bafee0dab
	.xword	0xbe38f26bd1b08aeb
	.xword	0xb606ca1ee096d32d
	.xword	0xd0c82d35d9a0b2c9
	.xword	0x98a041a283795502
	.xword	0x51285aeaafb4644e
	.xword	0x83cd269f0c345ee0
	.xword	0xe2e77eaee0adb58b
	.xword	0x30fab2b742c86731
	.xword	0x8fc58ec1f0140d5c
	.xword	0xd31f70095b41b35b
	.xword	0x5509c15c552e2d08
	.xword	0xe5efafd31c7ea292
	.xword	0x20cee4f683322a51
	.xword	0x400e1d2edc48e884
	.xword	0xe81ebad0bcc88e93
	.xword	0x4f850677ac7b0d75
	.xword	0x52e9956dfebdbcb8
	.xword	0x6d3f5526548baaf7
	.xword	0x07d23b2982d489af
	.xword	0x28a1ee5b138cd798
	.xword	0x13d36babf5577458
	.xword	0x12387d877bda6f20
	.xword	0xcaa74d23fd741230
	.xword	0x04fec94575592083
	.xword	0x6739592b74e963a9
	.xword	0x6e81761584590baf
	.xword	0xf53b59084876ea98
	.xword	0x646f564d87f57aa5
	.xword	0xf1091700ac322e00
	.xword	0x284803b1a7746a19
	.xword	0x4da44ecbf93017a6
	.xword	0x4d1f1ff78d860106
	.xword	0x77473613e802e42f
	.xword	0xfefb3696d69a46e6
	.xword	0xd80ff5b52db52475
	.xword	0xf56c3a616b9f77bc
	.xword	0xc21bcb024963ba2b
	.xword	0x16328919791db9a0
	.xword	0x2cddfed16290af3e
	.xword	0xedf14180fffb6653
	.xword	0x075c3feb3918df69
	.xword	0x5523fe87a0b7b1a5
	.xword	0xeeba19311da1974a
	.xword	0x4ef0f0215c7e8758
	.xword	0xec37bc101a36fb2d
	.xword	0xe6c47ca4ba9984a5
	.xword	0x87a070fa433b9b4f
	.xword	0x2235177e047174d4
	.xword	0xc614cb6739cea1d4
	.xword	0x7d527328de47eb64
	.xword	0xbc891da692b0390b
	.xword	0x554b874d0254b663
	.xword	0x32c485e2a4d2d2b7
	.xword	0x33faacf3c43b6910
	.xword	0x5885401c6e5d11e9
	.xword	0xa40e7eea5f2ca50d
	.xword	0x494de9994ce87a7c
	.xword	0x7f3e5530694d03b2
	.xword	0xd41bf8e22919102e
	.xword	0xb94e64d752aa33a8
	.xword	0x48aa27414c5e1b7c
	.xword	0x190151464d09914b
	.xword	0x4ad69ae37cd3e5a5
	.xword	0x752408b3882ff4d2
	.xword	0xab4573612a15256d
	.xword	0x59853d303664bf0f
	.xword	0x9f0219299d49a7f0
	.xword	0xf6fc205ccad7c8c3
	.xword	0x05b92fabe7a7b7f7
	.xword	0x239fefbebd1d584a
	.xword	0xefaab1f47ac7bd05
	.xword	0x1dbc3c9f0c412ae5
	.xword	0xca299741fe410064
	.xword	0x249bcc00e0006de6
	.xword	0x0110a25d2677405f
	.xword	0x2718dee7d0019cad
	.xword	0xd53bff075256bd0d
	.xword	0xf710703f3c77be2d
	.xword	0xb840666f84e53cc6
	.align 0x40000
	.data
data_start_6:

	.xword	0x32ac0d38b0648b83
	.xword	0x2cd615ee797f00f9
	.xword	0xfc1d2a9b48db3f4c
	.xword	0x3ab74f68d85babbf
	.xword	0x0d36e712edf5e36e
	.xword	0x34c21566314bddaa
	.xword	0xdf46e5bdbfefeeac
	.xword	0xeef4ff7a3703dcd6
	.xword	0x22d394cb3bfe8f8e
	.xword	0x233bc439ef79c56b
	.xword	0xd21672bc81c945cd
	.xword	0xa40fc6de4450d285
	.xword	0x6cfbe9385908a64c
	.xword	0x1bf2da58af1cac8a
	.xword	0x8a8023eb95a2c8be
	.xword	0xea1a2f5fcf64c3fe
	.xword	0x0dfdae063c6e99e4
	.xword	0xed6d5a56adb8ed30
	.xword	0xf28575191ffa0d8d
	.xword	0x817213e6281f65b3
	.xword	0x2c4be2c83576ad6d
	.xword	0xc1fc1d1883faf12f
	.xword	0x07705dca7c1abbbd
	.xword	0x9a9cc2a457b29228
	.xword	0xa5c0783e79309383
	.xword	0x920f298308d96da7
	.xword	0x4f924a3fa2fce398
	.xword	0x4a2f4729a66edd8b
	.xword	0x977129f5cdd3c803
	.xword	0x0dedd8c5a3adf271
	.xword	0x56dcec0f41f90448
	.xword	0x3541a52bbd495b4c
	.xword	0xa78c115be0aff2fc
	.xword	0x9c4f8e09d95f5fa2
	.xword	0xcb5824c34f3f09ae
	.xword	0xda6d25c5f79db84e
	.xword	0x0dbc02f425ffe9a3
	.xword	0x32a56d3f1d0afe0e
	.xword	0xd07f68d0c34fe057
	.xword	0x7b87f103706fd225
	.xword	0x400f200ed60a76ca
	.xword	0x01d4475dbd4cf8c7
	.xword	0x1329bbc4fb4f3af2
	.xword	0x716502d3c65389de
	.xword	0xe9b25f15c693ccee
	.xword	0x377e55134b35e49f
	.xword	0x475f32e1bb7c6036
	.xword	0xc9423f17a844eb20
	.xword	0x4cbbb3a484971201
	.xword	0xe52e150f1aaabf1a
	.xword	0x461c3c81bae60218
	.xword	0x4b0d4ff9d56c64cb
	.xword	0x82b90c24dca2ed20
	.xword	0x4d90742d9e8be693
	.xword	0x6c4d8b3ac30b8f23
	.xword	0x2efda0cf1b9b35b1
	.xword	0x66b1908aa76ae1e0
	.xword	0x2937fc09b70877c7
	.xword	0x7eb9abcac711f16c
	.xword	0x72874e9e29899a79
	.xword	0xf607afa1118f2a10
	.xword	0xe4445ed37428b132
	.xword	0x4e5927dce441fdb2
	.xword	0xdf4b3f4362b9449c
	.xword	0x702b22bac4c2afd9
	.xword	0x886374f70a2134a8
	.xword	0x746bf79489493d30
	.xword	0x9f7c984f73156d06
	.xword	0xe38c3fa2e596ffb2
	.xword	0x46541af56efa4111
	.xword	0xa20f212086313ff1
	.xword	0xbb8e515fa5086b7d
	.xword	0xabaf406e560876b0
	.xword	0xb83af3fbd34e06ec
	.xword	0x9c06117701b9eb74
	.xword	0x60fec6e10bbedd16
	.xword	0xd8fd68904c58c922
	.xword	0xd32bff2d5ded029e
	.xword	0xbccf7ec21716951e
	.xword	0xbb343241a5b57084
	.xword	0xf0a3a51fa2efbb7c
	.xword	0x3acd298f2b6d0355
	.xword	0x6d3ac0229e9de43a
	.xword	0x406d23eddcfd7f20
	.xword	0xd01d9c5a407734f2
	.xword	0x0d5a18c764d057de
	.xword	0x2ef218fd92449930
	.xword	0x1521046201ca9c2a
	.xword	0x04daaa54ef9a076f
	.xword	0xfd3b93891eb46f46
	.xword	0x17fcdea4f6543539
	.xword	0xbf2d686acc70fb67
	.xword	0x721c9fe1f3a06b19
	.xword	0x517610d6e403f59a
	.xword	0x4361ddc83f4b9ed9
	.xword	0xc4b6d2cead64fb29
	.xword	0x837147b05fdf4695
	.xword	0xc7b6b0ae3b2350d4
	.xword	0xffb87602bb0384a3
	.xword	0xf2f1bc10ab70cdd8
	.xword	0xa983f8b7ef390f72
	.xword	0xfb386aa98e9ef9ff
	.xword	0x8ae1a97183724dac
	.xword	0x807e3058d5c6e906
	.xword	0xeded7b24b74d81eb
	.xword	0x1e7cad5fac55ead2
	.xword	0xdeaf26d5ed61e0a6
	.xword	0x3c2ea4f942466f86
	.xword	0xf0a79be330f6a574
	.xword	0xa3d568fe4026f61d
	.xword	0x976e6cfa02f400c1
	.xword	0xe5e6b669a7891147
	.xword	0xf5b05d87444c9594
	.xword	0xb88eb5da9aa88b16
	.xword	0xa9415607cc871cfb
	.xword	0xf472a4af338a6f4e
	.xword	0x8ee85f89a7681758
	.xword	0xf1c4918539df3468
	.xword	0x69c6ee12076d2ace
	.xword	0xf44ee8a78f1d30f8
	.xword	0xa9736847831de48f
	.xword	0x971660fe7fba0bf2
	.xword	0x160f4aa1dad03834
	.xword	0x83a139b3b7021692
	.xword	0xe973924d1b7201ae
	.xword	0x872c8a844ce21689
	.xword	0x950a0ad09c1614ae
	.xword	0x959d3a3b25c90e62
	.xword	0x42f5d08e2814f4c2
	.xword	0x18c18c753195412c
	.xword	0xfffff910380a5c79
	.xword	0x7dd07ed04c531b67
	.xword	0x4f64680325a4eb41
	.xword	0x62da80aff1e98222
	.xword	0xc78ffa34a89ce7b5
	.xword	0x8877461700ed3614
	.xword	0x235e6702037513f1
	.xword	0x727a1dbd7c6c75df
	.xword	0x2365e7462c1accb5
	.xword	0xbca51e757d73e8ff
	.xword	0xcb9ac92db66d19f7
	.xword	0x5f89029c434f78d1
	.xword	0xf5a558375eb2e28b
	.xword	0xd2b5d3f952c61323
	.xword	0xb29d2b964b40b0a0
	.xword	0x5462cbf141f7ffcb
	.xword	0x4cc109c5ad3a3a41
	.xword	0x3343917bc18fd3ec
	.xword	0x11dc360dc6f81027
	.xword	0x82fe45e04361ff80
	.xword	0xdf3f27b2752c3820
	.xword	0x64d8e85213cb31bc
	.xword	0xb6f0daac8ebd1335
	.xword	0x81a38b76df05c68d
	.xword	0x49c3801751579bb1
	.xword	0x670e3238d7094807
	.xword	0xc404d4787ecd0da4
	.xword	0x5b25aca96af3b13e
	.xword	0xcaf4ed0b61ae581c
	.xword	0x866009b4be23a8f9
	.xword	0x5672cb214b38cf8a
	.xword	0xd242db43a6cda62a
	.xword	0xe2c1987a7e3a6a11
	.xword	0xa918fc678779a9ab
	.xword	0x963ab10e764df60e
	.xword	0xc9e6819055415ace
	.xword	0x9471d6c355054b41
	.xword	0x0b3eaf8e87a2e78e
	.xword	0xf952fe2a6309d7ef
	.xword	0x70a0c34e43289340
	.xword	0x4d234a760e8cc6f2
	.xword	0x2c4717500bcff478
	.xword	0xda2a627c738f453a
	.xword	0x242f248cdc11de7e
	.xword	0xf037e7b0649916be
	.xword	0x2492fa520afafe2e
	.xword	0x4819fa00395c2c96
	.xword	0x2b233ad516926dfc
	.xword	0xb8691bef6e69bb8a
	.xword	0x237eff0cf4aa64eb
	.xword	0x850936d1f0cf481b
	.xword	0xb1a423ffcdf37fab
	.xword	0x0bd80ef0841176fc
	.xword	0x5acacccbe595f82b
	.xword	0x2c8251e03f59ac3c
	.xword	0xd5a392a4ae585fc2
	.xword	0xdd7e77123ed7a934
	.xword	0x3e302b03f7e8e15d
	.xword	0x6050879c24a1ed48
	.xword	0xf1bac99b25bdf77b
	.xword	0x33abf92efd783491
	.xword	0x4070e44317e90db5
	.xword	0xb7c13c95df4106a6
	.xword	0xf6653c1d7d0bd82c
	.xword	0x094586d933063a67
	.xword	0x911def5206caefcf
	.xword	0x790a01662c05261b
	.xword	0x071704e96d8f61d7
	.xword	0x17eaf54b0cfa13f1
	.xword	0xde1d0d38c4616ec1
	.xword	0x76d8b459d6465a69
	.xword	0xba598f9da1b308c3
	.xword	0x4e0b85796ff9bb76
	.xword	0x07b512bef2f0c420
	.xword	0x31c1db8b6d4082ae
	.xword	0xf8a23a9a7f382240
	.xword	0x969bc2b7f150a480
	.xword	0x589f1a25455c1499
	.xword	0xaa159f3f7cb0b4b5
	.xword	0x944068c24149a302
	.xword	0x18fb65ae4ca197d2
	.xword	0x16245b73e1636cba
	.xword	0x3a37331c343c6abb
	.xword	0x2f1e02de3a35cd95
	.xword	0x5e365c6b36cd6307
	.xword	0xcc01cb3b5b1c2456
	.xword	0x3e093d6c05c51f3c
	.xword	0xc87ae205a02fabe5
	.xword	0x30afda2ab9c2b6e9
	.xword	0x0d8aaccf92a5f98e
	.xword	0x37aeb3e0135ae096
	.xword	0x7303e9db376bbf5c
	.xword	0xa034198689c7514a
	.xword	0xe1d29403d8affc3d
	.xword	0x725940977f991750
	.xword	0xbaefb838e113fde4
	.xword	0xf71391b61d5df159
	.xword	0xb39da7681de37d9f
	.xword	0x52dacc47fa096346
	.xword	0xbf0796dd57806264
	.xword	0x4156b0a116dbbf3f
	.xword	0x2a6ae5b6ffa95c72
	.xword	0xe866da2902a7e686
	.xword	0x879ae2cdf1e3afed
	.xword	0x026954c942405f07
	.xword	0xec42a297ec36ce9b
	.xword	0x8b50d662d14e137b
	.xword	0x387d40151126e1ce
	.xword	0x4c769d5394cd96b5
	.xword	0xe676bddf19544388
	.xword	0xd218a73b83704bd4
	.xword	0x705b8c37e9d6d912
	.xword	0xaaa8674bf9e5280e
	.xword	0x78917bf099ed0240
	.xword	0x63a6c41e7fccebe0
	.xword	0xf493660caf79f41c
	.xword	0x50df6be8eb61cb0f
	.xword	0xd588e766f54c01c1
	.xword	0xd572311c61cf7b32
	.xword	0xabdd402921145e87
	.xword	0x13e7ed3c639640b2
	.xword	0x223c5e24d5d0037c
	.xword	0x768816b9dee0934e
	.xword	0xbfdc52d2188be18f
	.xword	0x00cb8842fab8bc3c
	.xword	0xb8e058c1acf99611
	.align 0x80000
	.data
data_start_7:

	.xword	0x569b9af78a4acadd
	.xword	0x8e4d879b63555b8c
	.xword	0xcab859f8ff42b575
	.xword	0xabf3ad0e66bfa9be
	.xword	0x2838b3522c0d72ef
	.xword	0x59fbcc2fcb56f911
	.xword	0x8291da257d341bd7
	.xword	0x1ea95f24844d983c
	.xword	0xd543f85fddb2fc2e
	.xword	0xcf18c06ed1f04396
	.xword	0x7d54dba4c811933d
	.xword	0x38f42ed4f6bfaeb0
	.xword	0x9705f48492bb1529
	.xword	0x82d2f5e427330f27
	.xword	0x4ae7f653d6097ba9
	.xword	0xc4409dc77b7647c5
	.xword	0xe1c6dfb6df507b0e
	.xword	0x49e77b8ec261f803
	.xword	0x7baf5a4859d0824e
	.xword	0x501a41461b81efa1
	.xword	0x7081fbb0532f7fd3
	.xword	0xbc3ed82c0dbbf8d8
	.xword	0x4d867be1faefb81c
	.xword	0x4a32eb1d461870c8
	.xword	0x22aafb6bcb1da4af
	.xword	0x3f5eb50d0c0fc915
	.xword	0x65b61ffcdc7f62d2
	.xword	0x04c577741af35adf
	.xword	0x3af491a85c26cf43
	.xword	0xbf1abe1a59b02324
	.xword	0x8a292148134efccc
	.xword	0xb66dc25e34d8c5cc
	.xword	0xd133c879704115ae
	.xword	0x46a441063714db36
	.xword	0xd9b5653107cd3fdc
	.xword	0x4a81e5960098faa6
	.xword	0xa6d14af1607c55fb
	.xword	0x2c5b24a1a523b26b
	.xword	0x42a486abb5b14118
	.xword	0x5ccca37cd34d073a
	.xword	0x534bcf5339b8a182
	.xword	0x5399308cfd58da2c
	.xword	0x73d71e106109b2be
	.xword	0x8732e019529b4961
	.xword	0x22012e15b6e891ad
	.xword	0xe44e80b9131155fe
	.xword	0x8b63adb4598868dc
	.xword	0x85b987d186306236
	.xword	0x71cfe5b41a45037c
	.xword	0x9fc3b98b4e99374c
	.xword	0x735feb43ee891d9d
	.xword	0x888ee19670253ba1
	.xword	0x3afc4002bdac95c1
	.xword	0x19d9f4050770bdc1
	.xword	0x5df6088fb5eb99d2
	.xword	0x312f2f3efc287ee2
	.xword	0xee84c28d21eebdf7
	.xword	0x7a8964b8dfdae855
	.xword	0x07bd2cbd57c1c2e7
	.xword	0xaf9f34ede7db7f32
	.xword	0x34067fa5ecda965f
	.xword	0xbe9c48726d52d6d8
	.xword	0x4733d80fa1bf8b6d
	.xword	0xfe72a94884b6d76c
	.xword	0x08c7d9de74aa4063
	.xword	0x405b9c7f6145b62e
	.xword	0x1d91c92f873d163e
	.xword	0x8c9df9b8596e5c01
	.xword	0xf92deae8ef00231b
	.xword	0xd146972da8ded3de
	.xword	0x73da3009912c0c03
	.xword	0xf5da9f77ddda6abf
	.xword	0x4111dff127afc8ef
	.xword	0x8644180119e3dfce
	.xword	0xff5ac9435f248ce1
	.xword	0x4400105755f4cc73
	.xword	0xab457153dd3527a0
	.xword	0xc70f80c2d9702d62
	.xword	0xf4ab7f2578f85152
	.xword	0x1bc0d39c629eaed1
	.xword	0x82f3c2c86a9b85c6
	.xword	0xab958ed5eb7b447d
	.xword	0x5df21d52d69fd3e7
	.xword	0xf15c1a835fde2357
	.xword	0x8bcfe650cacf8276
	.xword	0x105cdd18d913f0f1
	.xword	0x43812d7c18fc4beb
	.xword	0xe4449acb774409c0
	.xword	0x0166efe0b2edcb50
	.xword	0x14b8d6453b455a68
	.xword	0x274b014cf0c31802
	.xword	0x6da5d77baee2d2e0
	.xword	0x2b39aff3a27796d2
	.xword	0x1fdda448d4b4a7a3
	.xword	0x4a1844d67e25e7e1
	.xword	0x6e8e275080f66639
	.xword	0xf3c35ba042115812
	.xword	0x636ebc49cc638536
	.xword	0x63af807cd94bf4ca
	.xword	0x9ac2924953828433
	.xword	0x5f377283e0c91357
	.xword	0x8e52f6e3b9dcec5e
	.xword	0xfde69e2d6791ff40
	.xword	0xdcbb390bf36949c3
	.xword	0xda2d9c99c315fd77
	.xword	0x8fe0769ce926ca6f
	.xword	0x0c30b3f0c1be7c2b
	.xword	0x1c74445323768083
	.xword	0x58bc8f810b3c8906
	.xword	0x5b44fb56fba8598c
	.xword	0x16cf81280a13b9e2
	.xword	0x7b0a3a6cbbbb0437
	.xword	0x3f63164bf42fd948
	.xword	0xcd2a52dd320aa458
	.xword	0x2a0be3416ab8ffa9
	.xword	0xcf6824a30d4ea489
	.xword	0x53b776b1fc1e521b
	.xword	0x00f163618a09219c
	.xword	0x27684ea38fc112a9
	.xword	0x28b69d78dbbc5e07
	.xword	0x82c733043739a0ce
	.xword	0x52b629ef39eb444a
	.xword	0x9bf9a33cbb20caed
	.xword	0x405fbd73aaf715f5
	.xword	0x81ff28f9b65ff104
	.xword	0x4f322b2fa0356db3
	.xword	0x3eccebf36c1e42c2
	.xword	0x2b5a3233bba6edb3
	.xword	0xbb2489b3a8a3f35a
	.xword	0xb56fbba5385460a5
	.xword	0x511dfd23cdb8ca4e
	.xword	0xe76cd9a8ba4f49a4
	.xword	0xa5faeb44950a9d59
	.xword	0x55e8898cd06250fe
	.xword	0x299b5773030ca959
	.xword	0x8fbee5380b05e6fd
	.xword	0xfe569cd193441efe
	.xword	0x117757be849d7942
	.xword	0x486f397a9b852bcd
	.xword	0xd1006aa0637c2f71
	.xword	0x5e8077444d53b520
	.xword	0x877532ad68490999
	.xword	0xc569aefa1b685643
	.xword	0x4ed449f2283c688e
	.xword	0xa279b96c6b420276
	.xword	0x9ffca9ec284e9f5a
	.xword	0x48c3b245cde1e106
	.xword	0x9be3be62b69118ed
	.xword	0x9a2ae080d281ad5c
	.xword	0xa81893a6a819cb38
	.xword	0x9d9305e8534c14fb
	.xword	0xa533c3c3f7142672
	.xword	0x7c2e041ce286eaca
	.xword	0x61fcc1d88c035297
	.xword	0xb15f0f379e8de782
	.xword	0xf1c8bea77adb695f
	.xword	0x5e0a3ea22edde856
	.xword	0x73a10596757264c0
	.xword	0x5dd6a4df60367ab7
	.xword	0x1a1bfbb6862428e1
	.xword	0x5645208bcc15b2a2
	.xword	0xdd0440e3a68bee55
	.xword	0xe54015fc5330fbca
	.xword	0xd37f47d1743ca1e6
	.xword	0x362107616ea9b79b
	.xword	0xba4ca568ec40a0a0
	.xword	0x7a975b7d9634ae73
	.xword	0x8415e214c77f0479
	.xword	0x8c02749ba0e13c15
	.xword	0xcd65c3e66d708ba4
	.xword	0x988d9ed3d0d97e15
	.xword	0xa2decab42905b89c
	.xword	0xebe0a2b3c8944956
	.xword	0x7b226cd4308c00e8
	.xword	0xcd39e3022d9286de
	.xword	0x21ee17cd87b84752
	.xword	0x31d84322aa52a810
	.xword	0x1beb8791c89ebe94
	.xword	0xcc776c2e1fe74276
	.xword	0xd6fc75893e05eb1b
	.xword	0x43c44733b16429cd
	.xword	0x06e53e68af04fe3d
	.xword	0x093aec1801037be3
	.xword	0xa5e1db145258cb39
	.xword	0x034a441197a09197
	.xword	0x85f7879faf883233
	.xword	0xb0b5bba715b501a4
	.xword	0x8d02294a8ffe4e34
	.xword	0xf8004ee9958ab7c2
	.xword	0xb48968118da65a07
	.xword	0x518e823f6d36f037
	.xword	0xbcc8c845df93942e
	.xword	0xd861a3ac5f08e275
	.xword	0x8105abec58216f12
	.xword	0x4013ac5fc1699caa
	.xword	0x22f087bbd3b0764b
	.xword	0xca8dcb727a16c7aa
	.xword	0xf5c32eb690cbd702
	.xword	0xa7cb9b0d40ac73ca
	.xword	0x6552266dcfdc3641
	.xword	0xdb5e991a50fc6fbc
	.xword	0x8384b4340ecdbb60
	.xword	0x9377f527cd684e77
	.xword	0xc3d8099361ea7f09
	.xword	0x7fad2dba39c8a1c4
	.xword	0xcf802e6a462c9d15
	.xword	0x7858cf827d14e87a
	.xword	0x96c92c8f5adc1969
	.xword	0x0578c3a9a41a41f3
	.xword	0xa03cc891610e36b7
	.xword	0xcd85dab44305d540
	.xword	0x5015998805fdfe81
	.xword	0xeedd9e59be3e2299
	.xword	0x4be6ab8a5c3651ae
	.xword	0x62242eac0827290a
	.xword	0xed8cdc8bec8fe822
	.xword	0x41d30f4a19bd6f23
	.xword	0xe740f86e82a328a9
	.xword	0xa40c7eb29b7927b6
	.xword	0x68fdd7b0af227071
	.xword	0x1f8c4b7b3391f58b
	.xword	0xdef3191783e46685
	.xword	0xe1b955f8efb0dd36
	.xword	0xea133d5d5d134e00
	.xword	0x57efa147f95f236c
	.xword	0xe16a9fcde20d2747
	.xword	0xed84fe25a5beb30e
	.xword	0xb40ce56b47961b66
	.xword	0xe85b5620b2f6ee9d
	.xword	0x2a95c820a892c047
	.xword	0xb5f2887854882002
	.xword	0x8985abadf9fbb3ea
	.xword	0x43890cd7265295f5
	.xword	0xbe470406cde7a01b
	.xword	0xbe1dfaf603973cdd
	.xword	0x16da6e65b256c4a7
	.xword	0x170a3d8157ce9b75
	.xword	0x76a5adff65bba697
	.xword	0xe8983cbed2012517
	.xword	0x9403f6490dc41fe8
	.xword	0x70ad5a2aa3df30cc
	.xword	0xc3452db52b03f464
	.xword	0xac57caba86310617
	.xword	0x859a1c2041feb892
	.xword	0x33f31017aa6ef913
	.xword	0xf79176bd77dbe4fb
	.xword	0x5cb4894340be3177
	.xword	0xee3c49518eaf7f8b
	.xword	0x25d48c8996d6a405
	.xword	0x0dee31b32889b6f9
	.xword	0x4435f533972a8fce
	.xword	0x7e36e07e64595036
	.xword	0x634eabb0d5c38862
	.xword	0x9612d73d073cb7eb
	.xword	0xc3b0c565ce76188b
	.xword	0x79b5a9f49537f75f



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "6'brr rrrr");
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
!!# 	  IJ_generate ("diag.j", 152, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 156, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 160, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 164, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 168, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 172, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 176, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 191, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 197, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 201, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
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
!!# 	  IJ_printf ("diag.j", 214, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 218, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
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
!!#           IJ_printf ("diag.j", 272, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 273, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 274, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 275, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 276, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 281, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 282, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 283, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 300, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 301, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 303, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 304, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINT
!!#         {
!!#           IJ_printf ("diag.j", 310, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf ("diag.j", 311, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
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
