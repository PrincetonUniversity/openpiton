// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_14.s
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
   random seed:	454248062
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

	setx 0x351b7afc4e4630fa, %g1, %g0
	setx 0xb27241fdf549dc8e, %g1, %g1
	setx 0xee85d0c7ba65d5dc, %g1, %g2
	setx 0x8f698cc334440d2c, %g1, %g3
	setx 0x1f009254c84c0efd, %g1, %g4
	setx 0xbc677ad8d47f31cb, %g1, %g5
	setx 0xbb8318d6872e8a8c, %g1, %g6
	setx 0xae7615d8d68a94f7, %g1, %g7
	setx 0xfd9947364bf786cb, %g1, %r16
	setx 0xd840ed797eddbdfe, %g1, %r17
	setx 0x634059b5d8228947, %g1, %r18
	setx 0x87a5b1300a75228c, %g1, %r19
	setx 0x66dcccb0e161dbc4, %g1, %r20
	setx 0x1adac6d5c9938a91, %g1, %r21
	setx 0xa93ab344a43aae6b, %g1, %r22
	setx 0xc6448afdaf6ee352, %g1, %r23
	setx 0xdd54ee9f9df5f506, %g1, %r24
	setx 0xa8aa6518bd23493f, %g1, %r25
	setx 0xe81cd00543fd5e4f, %g1, %r26
	setx 0x1a55162b27e9b9b2, %g1, %r27
	setx 0x4b2d3e61055c5210, %g1, %r28
	setx 0x62ccc69c7daab6c3, %g1, %r29
	setx 0xbe426ce0d91feb70, %g1, %r30
	setx 0x015aca4380bdc191, %g1, %r31
	save
	setx 0xdc7ac59eea392a9c, %g1, %r16
	setx 0x251dee3f54b68bde, %g1, %r17
	setx 0x0460e2f0626fffc4, %g1, %r18
	setx 0xd7550f56933ba578, %g1, %r19
	setx 0xf5f1a17cbaa02f11, %g1, %r20
	setx 0x9692084a49637267, %g1, %r21
	setx 0x6710d1c50f3ee426, %g1, %r22
	setx 0x24377696deb24808, %g1, %r23
	setx 0x9d1acd1daf94562b, %g1, %r24
	setx 0xea4c0ff096887f60, %g1, %r25
	setx 0xd9da8f2053befd4d, %g1, %r26
	setx 0x4ac5f12ea0eb46c8, %g1, %r27
	setx 0x5508fc6e642d70a0, %g1, %r28
	setx 0xd3a633b0f1a535d7, %g1, %r29
	setx 0x6efb6337a2eb38be, %g1, %r30
	setx 0x281e458fa38ff1b6, %g1, %r31
	save
	setx 0x52a8675f8e5d7d7a, %g1, %r16
	setx 0x5e3a4c833ad20852, %g1, %r17
	setx 0x44b8c58db1000882, %g1, %r18
	setx 0x8933dc51a5ff2a9a, %g1, %r19
	setx 0xa8083cbc6a919826, %g1, %r20
	setx 0x36ea9dc7c61dd6b0, %g1, %r21
	setx 0x2a148c65fdccaa02, %g1, %r22
	setx 0x7cee5de4f1bb1c30, %g1, %r23
	setx 0xf4364d55305f248e, %g1, %r24
	setx 0xbef8e597c48f6a32, %g1, %r25
	setx 0x3121fa291802a9cf, %g1, %r26
	setx 0x18621764578b462d, %g1, %r27
	setx 0x074d2697871565c4, %g1, %r28
	setx 0x063f0b632e23cde2, %g1, %r29
	setx 0x677635b9122c2d9b, %g1, %r30
	setx 0x624d3f45177bd71c, %g1, %r31
	save
	setx 0xa96619b0fb918ddd, %g1, %r16
	setx 0x3a5583205df060f8, %g1, %r17
	setx 0x2941af304f37ca89, %g1, %r18
	setx 0x40e6134bab3f02c6, %g1, %r19
	setx 0x060502b76cbe44ee, %g1, %r20
	setx 0x2669aebdd0df1e58, %g1, %r21
	setx 0xa3baf843f891ed39, %g1, %r22
	setx 0x4f7f12badbfdbb13, %g1, %r23
	setx 0x1c2b489879a21c1c, %g1, %r24
	setx 0x046ad3e3d137320b, %g1, %r25
	setx 0x6d851ee359763f57, %g1, %r26
	setx 0xbb7fc06115bb6c61, %g1, %r27
	setx 0xdfd45b80728a43f5, %g1, %r28
	setx 0x453f56e620c33fc9, %g1, %r29
	setx 0x7375c3739fa9c4fe, %g1, %r30
	setx 0xf08c4057ffb2961d, %g1, %r31
	save
	setx 0xc64dc4d3762bfb22, %g1, %r16
	setx 0xbf67ec87d36f3b8c, %g1, %r17
	setx 0xdc68e8c53f943481, %g1, %r18
	setx 0x9cf199df55ef7ece, %g1, %r19
	setx 0x4fc0bf8d64882c05, %g1, %r20
	setx 0x02ab53f16b7bac2a, %g1, %r21
	setx 0x4fea305dc7e51726, %g1, %r22
	setx 0xbfc9925c69c3e92f, %g1, %r23
	setx 0xb1fdb0ec40fcd5e8, %g1, %r24
	setx 0x47e0e0ba89360d78, %g1, %r25
	setx 0x009d1dc6d2f65911, %g1, %r26
	setx 0x8c34a2984bd1d76c, %g1, %r27
	setx 0xc7365fd633f195bc, %g1, %r28
	setx 0x7fa598cfb2b31dbe, %g1, %r29
	setx 0x2d4fbf4ce29680aa, %g1, %r30
	setx 0x60ac24b0d62e747a, %g1, %r31
	save
	setx 0xbe49b30d501bc67e, %g1, %r16
	setx 0x7ee448f3fe8c55de, %g1, %r17
	setx 0xc6f433cc3f390d93, %g1, %r18
	setx 0x4caf5928fa554f62, %g1, %r19
	setx 0xe34cba342002e421, %g1, %r20
	setx 0x5fd33f133ac0a5af, %g1, %r21
	setx 0x26c34771486b3ef9, %g1, %r22
	setx 0x4239d81bd7b03ed4, %g1, %r23
	setx 0x1ad6e88476a2e049, %g1, %r24
	setx 0x330a1ef5d9e988a3, %g1, %r25
	setx 0x07e266eaf397fbfd, %g1, %r26
	setx 0x3c50fe63c52a8baa, %g1, %r27
	setx 0xfd20f0cc024988c4, %g1, %r28
	setx 0xee8fc9b06a0e53da, %g1, %r29
	setx 0x0e45108fce09f3e1, %g1, %r30
	setx 0x0bb7ca8444ec463b, %g1, %r31
	save
	setx 0x332bbb631a14419e, %g1, %r16
	setx 0xcf6bfb3e8bd420fd, %g1, %r17
	setx 0xe23c86a5a805bc58, %g1, %r18
	setx 0x6d412f639ebdc28c, %g1, %r19
	setx 0x011f8560986c737c, %g1, %r20
	setx 0xb023b2d8baf0000f, %g1, %r21
	setx 0xde1189b6754e2a4b, %g1, %r22
	setx 0x6064e25b1d143cf3, %g1, %r23
	setx 0xda52c523ba73d96f, %g1, %r24
	setx 0xd3726dae7e98dc83, %g1, %r25
	setx 0xc9ec2bdfbffc8470, %g1, %r26
	setx 0x15773655e761e798, %g1, %r27
	setx 0x04fa92cff303bf68, %g1, %r28
	setx 0xd0cf2e34982c2250, %g1, %r29
	setx 0x307f0df2595918a4, %g1, %r30
	setx 0x743fddddef2b56d8, %g1, %r31
	save
	setx 0x28be1992a2a674e6, %g1, %r16
	setx 0x99a9f13735a9e76b, %g1, %r17
	setx 0xc2a02ec3d0c15ca8, %g1, %r18
	setx 0x35ef5be573252165, %g1, %r19
	setx 0x244c653bfe3b85c6, %g1, %r20
	setx 0xde53406713884817, %g1, %r21
	setx 0x5fda1e9846230adc, %g1, %r22
	setx 0x9ab217b43f124a99, %g1, %r23
	setx 0x724c96dbc5be8d12, %g1, %r24
	setx 0x2402b5d7735775a4, %g1, %r25
	setx 0xafe90cc2a2714dbf, %g1, %r26
	setx 0xf189aea437f4fa98, %g1, %r27
	setx 0xada3ca42bc9b97bb, %g1, %r28
	setx 0xdfec58d03a1f736d, %g1, %r29
	setx 0xc8115868069a57a4, %g1, %r30
	setx 0x58f3d03d0801ced4, %g1, %r31
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
	.word 0xbde460ff  ! 4: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4e11a  ! 6: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e520e7  ! 10: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8794e044  ! 11: WRPR_TT_I	wrpr	%r19, 0x0044, %tt
	.word 0xbb480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbbe5e061  ! 16: SAVE_I	save	%r23, 0x0001, %r29
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46172  ! 19: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9520000  ! 25: RDPR_PIL	<illegal instruction>
	.word 0xb9e4e0d5  ! 27: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde42140  ! 29: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe4e07b  ! 30: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4212e  ! 35: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb285a06a  ! 39: ADDcc_I	addcc 	%r22, 0x006a, %r25
	.word 0xb1508000  ! 40: RDPR_TSTATE	<illegal instruction>
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87956013  ! 43: WRPR_TT_I	wrpr	%r21, 0x0013, %tt
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46190  ! 47: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8794a150  ! 54: WRPR_TT_I	wrpr	%r18, 0x0150, %tt
	.word 0xb8b48000  ! 55: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xb1e420b8  ! 57: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4e197  ! 58: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5e09e  ! 62: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e1d2  ! 66: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb4b44000  ! 67: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0xbbe4e047  ! 68: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8d9460ac  ! 69: WRPR_PSTATE_I	wrpr	%r17, 0x00ac, %pstate
	mov	0, %r12
	.word 0x8f930000  ! 71: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e4e003  ! 73: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc440000  ! 85: ADDC_R	addc 	%r16, %r0, %r30
	mov	2, %r12
	.word 0x8f930000  ! 86: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5e016  ! 87: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe520c2  ! 88: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e521b3  ! 91: SAVE_I	save	%r20, 0x0001, %r24
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb353001  ! 94: SRLX_I	srlx	%r20, 0x0001, %r29
	.word 0xbbe56072  ! 103: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5212d  ! 108: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e421f4  ! 109: SAVE_I	save	%r16, 0x0001, %r27
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e16d  ! 114: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb2b4e00e  ! 116: SUBCcc_I	orncc 	%r19, 0x000e, %r25
	.word 0xbd518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a053  ! 122: WRPR_TT_I	wrpr	%r22, 0x0053, %tt
	.word 0xb7e5e190  ! 123: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e5e0fb  ! 125: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbe2ce13e  ! 131: ANDN_I	andn 	%r19, 0x013e, %r31
	.word 0xb9e5a1ab  ! 134: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a005  ! 137: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe521b6  ! 139: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e460fd  ! 143: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe5a12d  ! 144: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe561c3  ! 145: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x859420af  ! 149: WRPR_TSTATE_I	wrpr	%r16, 0x00af, %tstate
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 151: RDPR_TICK	<illegal instruction>
	.word 0xb3e5a192  ! 153: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e46186  ! 163: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e42140  ! 170: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb951c000  ! 173: RDPR_TL	<illegal instruction>
	.word 0xb7e4a062  ! 176: SAVE_I	save	%r18, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 177: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_2, %g1, %r23
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec46008  ! 184: ADDCcc_I	addccc 	%r17, 0x0008, %r31
	.word 0x8595e130  ! 187: WRPR_TSTATE_I	wrpr	%r23, 0x0130, %tstate
	.word 0xbbe4a043  ! 191: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8195a03e  ! 192: WRPR_TPC_I	wrpr	%r22, 0x003e, %tpc
	.word 0xb9480000  ! 198: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520c3  ! 200: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb885209e  ! 201: ADDcc_I	addcc 	%r20, 0x009e, %r28
	.word 0xb3e4a1a6  ! 203: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4a15d  ! 209: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb551c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xbbe5a0bf  ! 216: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb2350000  ! 218: SUBC_R	orn 	%r20, %r0, %r25
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e049  ! 224: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_2, %g1, %r19
	.word 0xbc950000  ! 233: ORcc_R	orcc 	%r20, %r0, %r30
	mov	2, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1fa  ! 243: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd540000  ! 245: RDPR_GL	<illegal instruction>
	.word 0xb7e5614d  ! 246: SAVE_I	save	%r21, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 250: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e421e8  ! 252: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde5a1f9  ! 256: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb094e1cf  ! 258: ORcc_I	orcc 	%r19, 0x01cf, %r24
	.word 0x919421cd  ! 260: WRPR_PIL_I	wrpr	%r16, 0x01cd, %pil
	.word 0xb72d5000  ! 263: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xb5e4201d  ! 266: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9508000  ! 268: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5e1d7  ! 269: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56049  ! 270: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe56008  ! 272: SAVE_I	save	%r21, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 273: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde46000  ! 274: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5e0f0  ! 276: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e52168  ! 278: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde4a0ad  ! 280: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e56177  ! 281: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5e092  ! 284: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e106  ! 287: WRPR_TNPC_I	wrpr	%r19, 0x0106, %tnpc
	.word 0xb7e5e07f  ! 289: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 296: MOVcc_I	<illegal instruction>
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0f4  ! 307: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e13c  ! 311: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4200b  ! 313: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb950c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0xb9e561fb  ! 317: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5216d  ! 320: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e420b8  ! 324: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 327: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x2d40dfb300006c50, %g1, %r10
	.word 0x839a8000  ! 329: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8395e0fe  ! 330: WRPR_TNPC_I	wrpr	%r23, 0x00fe, %tnpc
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520f3  ! 333: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5e0ef  ! 334: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8595e077  ! 337: WRPR_TSTATE_I	wrpr	%r23, 0x0077, %tstate
	.word 0xb5e521e4  ! 338: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5e0bd  ! 339: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4a13e  ! 340: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde56057  ! 341: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e5a0be  ! 342: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a158  ! 343: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb8956027  ! 344: ORcc_I	orcc 	%r21, 0x0027, %r28
	.word 0x8594205b  ! 345: WRPR_TSTATE_I	wrpr	%r16, 0x005b, %tstate
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	setx	0xfd5630cc0000bb52, %g1, %r10
	.word 0x819a8000  ! 352: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e5e0a4  ! 355: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4a09b  ! 357: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4e070  ! 360: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4a0fc  ! 366: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbe1da092  ! 370: XOR_I	xor 	%r22, 0x0092, %r31
	.word 0xb7e4a1b2  ! 374: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1dd  ! 375: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4605c  ! 376: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb57c0400  ! 378: MOVR_R	movre	%r16, %r0, %r26
	.word 0xb1540000  ! 380: RDPR_GL	<illegal instruction>
	.word 0xbfe42146  ! 381: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe46098  ! 383: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb351c000  ! 386: RDPR_TL	<illegal instruction>
	.word 0xb7e4e009  ! 389: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5e09e  ! 395: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_5, %g1, %r18
	.word 0xb1e5e1c7  ! 399: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4e087  ! 400: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4205b  ! 401: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9510000  ! 403: RDPR_TICK	<illegal instruction>
	.word 0x8195201d  ! 404: WRPR_TPC_I	wrpr	%r20, 0x001d, %tpc
	.word 0xb1e5a17d  ! 406: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e4a050  ! 407: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e5e00d  ! 409: SAVE_I	save	%r23, 0x0001, %r26
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a133  ! 422: WRPR_TT_I	wrpr	%r18, 0x0133, %tt
	.word 0xbbe461a4  ! 424: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb41c0000  ! 428: XOR_R	xor 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb41d2091  ! 435: XOR_I	xor 	%r20, 0x0091, %r26
	.word 0x8d942005  ! 436: WRPR_PSTATE_I	wrpr	%r16, 0x0005, %pstate
	.word 0xbde420c3  ! 437: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5e06e  ! 438: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5e078  ! 440: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e42126  ! 444: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe46129  ! 448: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e5a107  ! 453: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e52186  ! 462: SAVE_I	save	%r20, 0x0001, %r24
	setx	0xd349484a000088d9, %g1, %r10
	.word 0x839a8000  ! 463: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x819520da  ! 464: WRPR_TPC_I	wrpr	%r20, 0x00da, %tpc
	.word 0x8995a174  ! 478: WRPR_TICK_I	wrpr	%r22, 0x0174, %tick
	.word 0xb1e52021  ! 479: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8195e0ad  ! 485: WRPR_TPC_I	wrpr	%r23, 0x00ad, %tpc
	.word 0xbf480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbac48000  ! 493: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xbfe4e0b4  ! 494: SAVE_I	save	%r19, 0x0001, %r31
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xb6ac4000  ! 501: ANDNcc_R	andncc 	%r17, %r0, %r27
	.word 0xbde421c8  ! 503: SAVE_I	save	%r16, 0x0001, %r30
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89952120  ! 509: WRPR_TICK_I	wrpr	%r20, 0x0120, %tick
	.word 0x8594e17c  ! 510: WRPR_TSTATE_I	wrpr	%r19, 0x017c, %tstate
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e0e4  ! 513: WRPR_PIL_I	wrpr	%r19, 0x00e4, %pil
	.word 0xb750c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0xbf350000  ! 518: SRL_R	srl 	%r20, %r0, %r31
	.word 0xbe85e136  ! 521: ADDcc_I	addcc 	%r23, 0x0136, %r31
	.word 0xb00c0000  ! 523: AND_R	and 	%r16, %r0, %r24
	.word 0xb1e5e19f  ! 526: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42157  ! 529: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4a1e9  ! 530: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e5e0ac  ! 531: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3504000  ! 533: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0c5e1c4  ! 536: ADDCcc_I	addccc 	%r23, 0x01c4, %r24
	.word 0x8794a0e2  ! 538: WRPR_TT_I	wrpr	%r18, 0x00e2, %tt
	.word 0xbfe56070  ! 540: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb03ce0f3  ! 543: XNOR_I	xnor 	%r19, 0x00f3, %r24
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4611c  ! 545: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e46030  ! 546: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e561ac  ! 548: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbec54000  ! 549: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xb7e461ce  ! 553: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbe0c60f9  ! 555: AND_I	and 	%r17, 0x00f9, %r31
	.word 0xb5e5a195  ! 556: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8794a1ee  ! 557: WRPR_TT_I	wrpr	%r18, 0x01ee, %tt
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43ca044  ! 560: XNOR_I	xnor 	%r18, 0x0044, %r26
	setx	0x5f51e14e0000f85b, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0252034  ! 565: SUB_I	sub 	%r20, 0x0034, %r24
	.word 0xbf518000  ! 568: RDPR_PSTATE	<illegal instruction>
	.word 0x8394611d  ! 569: WRPR_TNPC_I	wrpr	%r17, 0x011d, %tnpc
	.word 0xbbe42093  ! 575: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e420cb  ! 576: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4e196  ! 577: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbca5c000  ! 585: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xbbe5a05b  ! 586: SAVE_I	save	%r22, 0x0001, %r29
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520d8  ! 592: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4211e  ! 593: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde5e153  ! 596: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8595e001  ! 597: WRPR_TSTATE_I	wrpr	%r23, 0x0001, %tstate
	.word 0xb7500000  ! 598: RDPR_TPC	<illegal instruction>
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a128  ! 602: WRPR_TNPC_I	wrpr	%r18, 0x0128, %tnpc
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a19b  ! 610: SAVE_I	save	%r22, 0x0001, %r30
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5207c  ! 613: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe56135  ! 614: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4616c  ! 615: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4e0a8  ! 616: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e5e172  ! 618: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4a038  ! 619: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_7, %g1, %r22
	.word 0xbbe4e004  ! 626: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e4e033  ! 627: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde421a3  ! 631: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4e165  ! 635: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x91946016  ! 640: WRPR_PIL_I	wrpr	%r17, 0x0016, %pil
	.word 0xbd510000  ! 643: RDPR_TICK	<illegal instruction>
	.word 0xbbe52032  ! 645: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9520000  ! 647: RDPR_PIL	<illegal instruction>
	.word 0x8d942146  ! 649: WRPR_PSTATE_I	wrpr	%r16, 0x0146, %pstate
	.word 0xbf480000  ! 653: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc254000  ! 658: SUB_R	sub 	%r21, %r0, %r30
	.word 0xb53c7001  ! 663: SRAX_I	srax	%r17, 0x0001, %r26
	.word 0xb1351000  ! 664: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xb750c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0xb3e52170  ! 666: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbf508000  ! 668: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb1e4e12a  ! 676: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4e18f  ! 678: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56148  ! 680: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_7, %g1, %r23
	.word 0xbde4604b  ! 687: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb97cc400  ! 690: MOVR_R	movre	%r19, %r0, %r28
	.word 0xb1e460b9  ! 691: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8394a0c5  ! 692: WRPR_TNPC_I	wrpr	%r18, 0x00c5, %tnpc
	.word 0xb3e5e126  ! 693: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e421bb  ! 695: SAVE_I	save	%r16, 0x0001, %r24
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5c000  ! 706: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xbfe5e03b  ! 709: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5e1e7  ! 711: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x839420b1  ! 715: WRPR_TNPC_I	wrpr	%r16, 0x00b1, %tnpc
	.word 0xb1e5e0cd  ! 722: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9480000  ! 723: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbfe52193  ! 724: SAVE_I	save	%r20, 0x0001, %r31
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52098  ! 729: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb33cb001  ! 735: SRAX_I	srax	%r18, 0x0001, %r25
	.word 0xb1e42100  ! 736: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe560c0  ! 737: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5e0a3  ! 738: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb68d8000  ! 740: ANDcc_R	andcc 	%r22, %r0, %r27
	setx	0xe478ee0e00008b06, %g1, %r10
	.word 0x819a8000  ! 742: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4a1fe  ! 744: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbead61f5  ! 747: ANDNcc_I	andncc 	%r21, 0x01f5, %r31
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421bc  ! 749: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9518000  ! 750: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r23
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 753: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e5e145  ! 754: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe521a7  ! 755: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe461d9  ! 757: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb3db001  ! 760: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xbfe42115  ! 762: SAVE_I	save	%r16, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde42196  ! 766: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5e07b  ! 772: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc84a1e8  ! 773: ADDcc_I	addcc 	%r18, 0x01e8, %r30
	.word 0xb151c000  ! 774: RDPR_TL	<illegal instruction>
	.word 0xb1e4a07e  ! 775: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd349000  ! 778: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xbfe46027  ! 780: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5a18b  ! 781: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4e0c2  ! 787: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8794e07e  ! 789: WRPR_TT_I	wrpr	%r19, 0x007e, %tt
	.word 0xbfe460c7  ! 796: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4a11e  ! 798: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb73d4000  ! 799: SRA_R	sra 	%r21, %r0, %r27
	.word 0xb5e5e000  ! 803: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8795e1e6  ! 804: WRPR_TT_I	wrpr	%r23, 0x01e6, %tt
	.word 0xbfe4e10a  ! 805: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a058  ! 808: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e521d5  ! 810: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	.word 0xbf35d000  ! 815: SRLX_R	srlx	%r23, %r0, %r31
	.word 0xb5e5a1b3  ! 816: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbe44a1a1  ! 817: ADDC_I	addc 	%r18, 0x01a1, %r31
	.word 0xbde5e06c  ! 818: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb00c0000  ! 819: AND_R	and 	%r16, %r0, %r24
	.word 0x8995a1f3  ! 823: WRPR_TICK_I	wrpr	%r22, 0x01f3, %tick
	setx	data_start_7, %g1, %r17
	.word 0xb151c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xbf540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xb9e5a077  ! 831: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a04e  ! 832: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe4e015  ! 838: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe56005  ! 840: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4e1c5  ! 842: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4e1f6  ! 846: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde5e134  ! 847: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x879520d3  ! 848: WRPR_TT_I	wrpr	%r20, 0x00d3, %tt
	.word 0xb40ce1f5  ! 851: AND_I	and 	%r19, 0x01f5, %r26
	.word 0x8195614f  ! 854: WRPR_TPC_I	wrpr	%r21, 0x014f, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb13d9000  ! 858: SRAX_R	srax	%r22, %r0, %r24
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46188  ! 863: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8994e0f4  ! 865: WRPR_TICK_I	wrpr	%r19, 0x00f4, %tick
	.word 0xb5e461d7  ! 866: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5a14d  ! 870: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e42117  ! 871: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4a086  ! 872: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a05d  ! 878: WRPR_PIL_I	wrpr	%r22, 0x005d, %pil
	.word 0xb3504000  ! 879: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4207f  ! 881: SAVE_I	save	%r16, 0x0001, %r31
	mov	0, %r12
	.word 0xa1930000  ! 882: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4612b  ! 889: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb6bd20a8  ! 890: XNORcc_I	xnorcc 	%r20, 0x00a8, %r27
	.word 0xb5e5e0ec  ! 891: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde421a3  ! 901: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4a16b  ! 902: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xba0c201f  ! 905: AND_I	and 	%r16, 0x001f, %r29
	.word 0xb1508000  ! 908: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5a16c  ! 913: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4a1a0  ! 915: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb88d8000  ! 918: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xb9e4a1e5  ! 919: SAVE_I	save	%r18, 0x0001, %r28
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a00f  ! 922: SAVE_I	save	%r22, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 924: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4204c  ! 927: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5200f  ! 929: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_7, %g1, %r19
	.word 0xb01da112  ! 939: XOR_I	xor 	%r22, 0x0112, %r24
	setx	0x8c4906c400008b5c, %g1, %r10
	.word 0x819a8000  ! 940: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r18
	.word 0xbebdc000  ! 943: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0x8194a15e  ! 945: WRPR_TPC_I	wrpr	%r18, 0x015e, %tpc
	.word 0xb62dc000  ! 946: ANDN_R	andn 	%r23, %r0, %r27
	mov	1, %r12
	.word 0xa1930000  ! 951: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbab5a0b5  ! 955: SUBCcc_I	orncc 	%r22, 0x00b5, %r29
	.word 0xb7e56075  ! 956: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7508000  ! 962: RDPR_TSTATE	<illegal instruction>
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 969: RDPR_TL	<illegal instruction>
	.word 0xba1dc000  ! 970: XOR_R	xor 	%r23, %r0, %r29
	.word 0xb7e5a064  ! 971: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5a00c  ! 974: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e5e00c  ! 975: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8195a167  ! 978: WRPR_TPC_I	wrpr	%r22, 0x0167, %tpc
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859561a2  ! 982: WRPR_TSTATE_I	wrpr	%r21, 0x01a2, %tstate
	.word 0xb7e560dc  ! 986: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x9194e1ab  ! 991: WRPR_PIL_I	wrpr	%r19, 0x01ab, %pil
	.word 0xb9e4e06b  ! 992: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd35b001  ! 994: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xbe34c000  ! 995: ORN_R	orn 	%r19, %r0, %r31
	.word 0xb5e420c3  ! 996: SAVE_I	save	%r16, 0x0001, %r26
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
	.word 0xf424c000  ! 3: STW_R	stw	%r26, [%r19 + %r0]
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879520d2  ! 11: WRPR_TT_I	wrpr	%r20, 0x00d2, %tt
	.word 0xbd480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf02c20d3  ! 15: STB_I	stb	%r24, [%r16 + 0x00d3]
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf07561c5  ! 21: STX_I	stx	%r24, [%r21 + 0x01c5]
	.word 0xf82ce140  ! 23: STB_I	stb	%r28, [%r19 + 0x0140]
	.word 0xf03c21f7  ! 24: STD_I	std	%r24, [%r16 + 0x01f7]
	.word 0xbb520000  ! 25: RDPR_PIL	<illegal instruction>
	.word 0xf73c8000  ! 26: STDF_R	std	%f27, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf83460d6  ! 33: STH_I	sth	%r28, [%r17 + 0x00d6]
	.word 0xf43d4000  ! 38: STD_R	std	%r26, [%r21 + %r0]
	.word 0xb48460a2  ! 39: ADDcc_I	addcc 	%r17, 0x00a2, %r26
	.word 0xb7508000  ! 40: RDPR_TSTATE	<illegal instruction>
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a00a  ! 43: WRPR_TT_I	wrpr	%r18, 0x000a, %tt
	.word 0xf63da1c7  ! 45: STD_I	std	%r27, [%r22 + 0x01c7]
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3c4000  ! 50: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfb3d6035  ! 51: STDF_I	std	%f29, [0x0035, %r21]
	.word 0xf63d6091  ! 53: STD_I	std	%r27, [%r21 + 0x0091]
	.word 0x8794a1be  ! 54: WRPR_TT_I	wrpr	%r18, 0x01be, %tt
	.word 0xb4b40000  ! 55: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xfc3ce118  ! 61: STD_I	std	%r30, [%r19 + 0x0118]
	.word 0xf62de161  ! 64: STB_I	stb	%r27, [%r23 + 0x0161]
	.word 0xb2b5c000  ! 67: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0x8d94e0e9  ! 69: WRPR_PSTATE_I	wrpr	%r19, 0x00e9, %pstate
	mov	0, %r12
	.word 0x8f930000  ! 71: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf424e04e  ! 74: STW_I	stw	%r26, [%r19 + 0x004e]
	.word 0xf23cc000  ! 75: STD_R	std	%r25, [%r19 + %r0]
	.word 0xfa348000  ! 77: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa3d0000  ! 80: STD_R	std	%r29, [%r20 + %r0]
	.word 0xfe248000  ! 84: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xbc450000  ! 85: ADDC_R	addc 	%r20, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 86: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf625a038  ! 89: STW_I	stw	%r27, [%r22 + 0x0038]
	.word 0xf835e086  ! 90: STH_I	sth	%r28, [%r23 + 0x0086]
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb357001  ! 94: SRLX_I	srlx	%r21, 0x0001, %r29
	.word 0xf23d8000  ! 95: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf634a1e8  ! 97: STH_I	sth	%r27, [%r18 + 0x01e8]
	.word 0xf4756160  ! 100: STX_I	stx	%r26, [%r21 + 0x0160]
	.word 0xf2254000  ! 102: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfe2c4000  ! 106: STB_R	stb	%r31, [%r17 + %r0]
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 111: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xb2b4a017  ! 116: SUBCcc_I	orncc 	%r18, 0x0017, %r25
	.word 0xf434613a  ! 117: STH_I	sth	%r26, [%r17 + 0x013a]
	.word 0xb5518000  ! 119: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0x8794a025  ! 122: WRPR_TT_I	wrpr	%r18, 0x0025, %tt
	.word 0xf4350000  ! 126: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfa75e13e  ! 127: STX_I	stx	%r29, [%r23 + 0x013e]
	.word 0xf63da0cb  ! 129: STD_I	std	%r27, [%r22 + 0x00cb]
	.word 0xf8246057  ! 130: STW_I	stw	%r28, [%r17 + 0x0057]
	.word 0xb82da18c  ! 131: ANDN_I	andn 	%r22, 0x018c, %r28
	.word 0xf62c6143  ! 132: STB_I	stb	%r27, [%r17 + 0x0143]
	.word 0xf03c8000  ! 133: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfe758000  ! 140: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf22de132  ! 141: STB_I	stb	%r25, [%r23 + 0x0132]
	.word 0xf43c4000  ! 146: STD_R	std	%r26, [%r17 + %r0]
	.word 0xbd500000  ! 147: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x85942128  ! 149: WRPR_TSTATE_I	wrpr	%r16, 0x0128, %tstate
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 151: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf8350000  ! 154: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf43d0000  ! 157: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf13d8000  ! 160: STDF_R	std	%f24, [%r0, %r22]
	.word 0xfe2de059  ! 161: STB_I	stb	%r31, [%r23 + 0x0059]
	.word 0xfe254000  ! 168: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xbd51c000  ! 173: RDPR_TL	<illegal instruction>
	.word 0xf034a143  ! 175: STH_I	sth	%r24, [%r18 + 0x0143]
	mov	1, %r12
	.word 0x8f930000  ! 177: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa354000  ! 178: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf435e029  ! 179: STH_I	sth	%r26, [%r23 + 0x0029]
	setx	data_start_5, %g1, %r17
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c4205e  ! 184: ADDCcc_I	addccc 	%r16, 0x005e, %r26
	.word 0xf23ce1e7  ! 185: STD_I	std	%r25, [%r19 + 0x01e7]
	.word 0x8595a063  ! 187: WRPR_TSTATE_I	wrpr	%r22, 0x0063, %tstate
	.word 0xfe25e00c  ! 188: STW_I	stw	%r31, [%r23 + 0x000c]
	.word 0xf824614d  ! 190: STW_I	stw	%r28, [%r17 + 0x014d]
	.word 0x8194a103  ! 192: WRPR_TPC_I	wrpr	%r18, 0x0103, %tpc
	.word 0xfb3c0000  ! 193: STDF_R	std	%f29, [%r0, %r16]
	.word 0xfc352128  ! 194: STH_I	sth	%r30, [%r20 + 0x0128]
	.word 0xbd480000  ! 198: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb485e1f1  ! 201: ADDcc_I	addcc 	%r23, 0x01f1, %r26
	.word 0xfc2d4000  ! 205: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfa2d8000  ! 208: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xbf51c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xf83d6066  ! 211: STD_I	std	%r28, [%r21 + 0x0066]
	.word 0xbe340000  ! 218: SUBC_R	orn 	%r16, %r0, %r31
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa246059  ! 220: STW_I	stw	%r29, [%r17 + 0x0059]
	.word 0xfc354000  ! 228: STH_R	sth	%r30, [%r21 + %r0]
	setx	data_start_4, %g1, %r23
	.word 0xb4948000  ! 233: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xf43d8000  ! 235: STD_R	std	%r26, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 238: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf234c000  ! 240: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xb9540000  ! 245: RDPR_GL	rdpr	%-, %r28
	.word 0xf73dc000  ! 247: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf234a157  ! 249: STH_I	sth	%r25, [%r18 + 0x0157]
	mov	0, %r12
	.word 0x8f930000  ! 250: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc952112  ! 258: ORcc_I	orcc 	%r20, 0x0112, %r30
	.word 0x9195a191  ! 260: WRPR_PIL_I	wrpr	%r22, 0x0191, %pil
	.word 0xfe34e09a  ! 262: STH_I	sth	%r31, [%r19 + 0x009a]
	.word 0xbb2d1000  ! 263: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xf93c21ce  ! 264: STDF_I	std	%f28, [0x01ce, %r16]
	.word 0xb7508000  ! 268: RDPR_TSTATE	rdpr	%tstate, %r27
	mov	1, %r12
	.word 0xa1930000  ! 273: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8244000  ! 277: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xff3c4000  ! 279: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf025e1f6  ! 283: STW_I	stw	%r24, [%r23 + 0x01f6]
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e095  ! 286: STH_I	sth	%r29, [%r19 + 0x0095]
	.word 0x8395e1d4  ! 287: WRPR_TNPC_I	wrpr	%r23, 0x01d4, %tnpc
	.word 0xf825e106  ! 291: STW_I	stw	%r28, [%r23 + 0x0106]
	.word 0xf53c0000  ! 292: STDF_R	std	%f26, [%r0, %r16]
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 296: MOVcc_I	<illegal instruction>
	.word 0xf474e1f7  ! 297: STX_I	stx	%r26, [%r19 + 0x01f7]
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 305: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf034e1c3  ! 306: STH_I	sth	%r24, [%r19 + 0x01c3]
	.word 0xbd50c000  ! 314: RDPR_TT	rdpr	%tt, %r30
	.word 0xf93c2052  ! 315: STDF_I	std	%f28, [0x0052, %r16]
	.word 0xf8340000  ! 316: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf22d4000  ! 321: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf53de173  ! 322: STDF_I	std	%f26, [0x0173, %r23]
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2420fb  ! 326: STW_I	stw	%r30, [%r16 + 0x00fb]
	mov	2, %r12
	.word 0x8f930000  ! 327: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x9bd1a5700001d01, %g1, %r10
	.word 0x839a8000  ! 329: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8395a156  ! 330: WRPR_TNPC_I	wrpr	%r22, 0x0156, %tnpc
	.word 0xf73d4000  ! 331: STDF_R	std	%f27, [%r0, %r21]
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e131  ! 337: WRPR_TSTATE_I	wrpr	%r23, 0x0131, %tstate
	.word 0xbc94a1f3  ! 344: ORcc_I	orcc 	%r18, 0x01f3, %r30
	.word 0x8594e040  ! 345: WRPR_TSTATE_I	wrpr	%r19, 0x0040, %tstate
	.word 0xfc354000  ! 347: STH_R	sth	%r30, [%r21 + %r0]
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 350: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xfe7560af  ! 351: STX_I	stx	%r31, [%r21 + 0x00af]
	setx	0xfeab44da00005946, %g1, %r10
	.word 0x819a8000  ! 352: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa3c60ee  ! 354: STD_I	std	%r29, [%r17 + 0x00ee]
	.word 0xf625216f  ! 356: STW_I	stw	%r27, [%r20 + 0x016f]
	.word 0xf22420ba  ! 361: STW_I	stw	%r25, [%r16 + 0x00ba]
	.word 0xf63461a7  ! 365: STH_I	sth	%r27, [%r17 + 0x01a7]
	.word 0xfa3c60a0  ! 369: STD_I	std	%r29, [%r17 + 0x00a0]
	.word 0xb41c6154  ! 370: XOR_I	xor 	%r17, 0x0154, %r26
	.word 0xfa3460ee  ! 371: STH_I	sth	%r29, [%r17 + 0x00ee]
	.word 0xf43d8000  ! 372: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf23c8000  ! 377: STD_R	std	%r25, [%r18 + %r0]
	.word 0xb17d4400  ! 378: MOVR_R	movre	%r21, %r0, %r24
	.word 0xbb540000  ! 380: RDPR_GL	rdpr	%-, %r29
	.word 0xb3480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb51c000  ! 386: RDPR_TL	<illegal instruction>
	.word 0xf4340000  ! 393: STH_R	sth	%r26, [%r16 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xbd510000  ! 403: RDPR_TICK	<illegal instruction>
	.word 0x8194e1a3  ! 404: WRPR_TPC_I	wrpr	%r19, 0x01a3, %tpc
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	.word 0xfc2c21e9  ! 415: STB_I	stb	%r30, [%r16 + 0x01e9]
	.word 0xf82de05d  ! 416: STB_I	stb	%r28, [%r23 + 0x005d]
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 418: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf13d612d  ! 419: STDF_I	std	%f24, [0x012d, %r21]
	.word 0xf02d20a5  ! 421: STB_I	stb	%r24, [%r20 + 0x00a5]
	.word 0x8795e094  ! 422: WRPR_TT_I	wrpr	%r23, 0x0094, %tt
	.word 0xfa2de07d  ! 423: STB_I	stb	%r29, [%r23 + 0x007d]
	.word 0xfa75a1d2  ! 427: STX_I	stx	%r29, [%r22 + 0x01d2]
	.word 0xb81c4000  ! 428: XOR_R	xor 	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb21c2027  ! 435: XOR_I	xor 	%r16, 0x0027, %r25
	.word 0x8d94a062  ! 436: WRPR_PSTATE_I	wrpr	%r18, 0x0062, %pstate
	.word 0xf0240000  ! 439: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf4740000  ! 445: STX_R	stx	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf73c8000  ! 456: STDF_R	std	%f27, [%r0, %r18]
	.word 0xf224a1e1  ! 459: STW_I	stw	%r25, [%r18 + 0x01e1]
	setx	0x1482b1ff0000fe08, %g1, %r10
	.word 0x839a8000  ! 463: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195213e  ! 464: WRPR_TPC_I	wrpr	%r20, 0x013e, %tpc
	.word 0xfe750000  ! 467: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfb3dc000  ! 472: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf225a179  ! 474: STW_I	stw	%r25, [%r22 + 0x0179]
	.word 0x899560d3  ! 478: WRPR_TICK_I	wrpr	%r21, 0x00d3, %tick
	.word 0xfc34a05c  ! 480: STH_I	sth	%r30, [%r18 + 0x005c]
	.word 0x8195a10f  ! 485: WRPR_TPC_I	wrpr	%r22, 0x010f, %tpc
	.word 0xbd480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa7461de  ! 489: STX_I	stx	%r29, [%r17 + 0x01de]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc5c000  ! 493: ADDCcc_R	addccc 	%r23, %r0, %r30
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 500: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbeacc000  ! 501: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xf874c000  ! 502: STX_R	stx	%r28, [%r19 + %r0]
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 506: STB_R	stb	%r24, [%r20 + %r0]
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899421a5  ! 509: WRPR_TICK_I	wrpr	%r16, 0x01a5, %tick
	.word 0x8594e108  ! 510: WRPR_TSTATE_I	wrpr	%r19, 0x0108, %tstate
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e1c4  ! 513: WRPR_PIL_I	wrpr	%r23, 0x01c4, %pil
	.word 0xbf50c000  ! 515: RDPR_TT	rdpr	%tt, %r31
	.word 0xf03d216f  ! 517: STD_I	std	%r24, [%r20 + 0x016f]
	.word 0xbb340000  ! 518: SRL_R	srl 	%r16, %r0, %r29
	.word 0xb284e151  ! 521: ADDcc_I	addcc 	%r19, 0x0151, %r25
	.word 0xf13d2154  ! 522: STDF_I	std	%f24, [0x0154, %r20]
	.word 0xba0c8000  ! 523: AND_R	and 	%r18, %r0, %r29
	.word 0xf4754000  ! 525: STX_R	stx	%r26, [%r21 + %r0]
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 533: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8c5e091  ! 536: ADDCcc_I	addccc 	%r23, 0x0091, %r28
	.word 0x8795a094  ! 538: WRPR_TT_I	wrpr	%r22, 0x0094, %tt
	.word 0xff3d8000  ! 539: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf275e17f  ! 542: STX_I	stx	%r25, [%r23 + 0x017f]
	.word 0xb83da1d1  ! 543: XNOR_I	xnor 	%r22, 0x01d1, %r28
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec54000  ! 549: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xf83de14d  ! 550: STD_I	std	%r28, [%r23 + 0x014d]
	.word 0xf63d0000  ! 551: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfe3421ed  ! 552: STH_I	sth	%r31, [%r16 + 0x01ed]
	.word 0xb40d61c0  ! 555: AND_I	and 	%r21, 0x01c0, %r26
	.word 0x8795a1ab  ! 557: WRPR_TT_I	wrpr	%r22, 0x01ab, %tt
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74a064  ! 559: STX_I	stx	%r31, [%r18 + 0x0064]
	.word 0xb03da05b  ! 560: XNOR_I	xnor 	%r22, 0x005b, %r24
	setx	0x56b35e5c0000a9c8, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe3d4000  ! 564: STD_R	std	%r31, [%r21 + %r0]
	.word 0xb024e1ea  ! 565: SUB_I	sub 	%r19, 0x01ea, %r24
	.word 0xbf518000  ! 568: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0x83942057  ! 569: WRPR_TNPC_I	wrpr	%r16, 0x0057, %tnpc
	.word 0xf62dc000  ! 571: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf22de0bd  ! 572: STB_I	stb	%r25, [%r23 + 0x00bd]
	.word 0xfc2d617b  ! 581: STB_I	stb	%r30, [%r21 + 0x017b]
	.word 0xf03c8000  ! 582: STD_R	std	%r24, [%r18 + %r0]
	.word 0xbaa40000  ! 585: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xf22c0000  ! 588: STB_R	stb	%r25, [%r16 + %r0]
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c4000  ! 595: STB_R	stb	%r30, [%r17 + %r0]
	.word 0x8594a0cf  ! 597: WRPR_TSTATE_I	wrpr	%r18, 0x00cf, %tstate
	.word 0xbf500000  ! 598: RDPR_TPC	rdpr	%tpc, %r31
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73c8000  ! 600: STDF_R	std	%f27, [%r0, %r18]
	.word 0xfa746129  ! 601: STX_I	stx	%r29, [%r17 + 0x0129]
	.word 0x8394616b  ! 602: WRPR_TNPC_I	wrpr	%r17, 0x016b, %tnpc
	.word 0xf43c4000  ! 603: STD_R	std	%r26, [%r17 + %r0]
	.word 0xfe752088  ! 605: STX_I	stx	%r31, [%r20 + 0x0088]
	.word 0xf03c8000  ! 606: STD_R	std	%r24, [%r18 + %r0]
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	.word 0xf835c000  ! 624: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf82d619b  ! 628: STB_I	stb	%r28, [%r21 + 0x019b]
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73c2021  ! 632: STDF_I	std	%f27, [0x0021, %r16]
	.word 0xff3c8000  ! 636: STDF_R	std	%f31, [%r0, %r18]
	.word 0xf13d4000  ! 638: STDF_R	std	%f24, [%r0, %r21]
	.word 0xf22c60c9  ! 639: STB_I	stb	%r25, [%r17 + 0x00c9]
	.word 0x9195a1a8  ! 640: WRPR_PIL_I	wrpr	%r22, 0x01a8, %pil
	.word 0xfe3d4000  ! 642: STD_R	std	%r31, [%r21 + %r0]
	.word 0xbd510000  ! 643: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfa2d610e  ! 644: STB_I	stb	%r29, [%r21 + 0x010e]
	.word 0xb7520000  ! 647: RDPR_PIL	<illegal instruction>
	.word 0xf825a0db  ! 648: STW_I	stw	%r28, [%r22 + 0x00db]
	.word 0x8d946129  ! 649: WRPR_PSTATE_I	wrpr	%r17, 0x0129, %pstate
	.word 0xb1480000  ! 653: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23d4000  ! 655: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf8250000  ! 657: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xbc250000  ! 658: SUB_R	sub 	%r20, %r0, %r30
	.word 0xf4256076  ! 660: STW_I	stw	%r26, [%r21 + 0x0076]
	.word 0xfe24e032  ! 661: STW_I	stw	%r31, [%r19 + 0x0032]
	.word 0xbd3d7001  ! 663: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xb5359000  ! 664: SRLX_R	srlx	%r22, %r0, %r26
	.word 0xbd50c000  ! 665: RDPR_TT	rdpr	%tt, %r30
	.word 0xbf508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0xf42461f6  ! 674: STW_I	stw	%r26, [%r17 + 0x01f6]
	.word 0xfc75c000  ! 677: STX_R	stx	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2c21b3  ! 681: STB_I	stb	%r31, [%r16 + 0x01b3]
	setx	data_start_1, %g1, %r22
	.word 0xf6244000  ! 684: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf035c000  ! 689: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xbf7d4400  ! 690: MOVR_R	movre	%r21, %r0, %r31
	.word 0x8395a0ab  ! 692: WRPR_TNPC_I	wrpr	%r22, 0x00ab, %tnpc
	.word 0xfa254000  ! 698: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf82ca199  ! 700: STB_I	stb	%r28, [%r18 + 0x0199]
	.word 0xf93da09d  ! 702: STDF_I	std	%f28, [0x009d, %r22]
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa7561c9  ! 704: STX_I	stx	%r29, [%r21 + 0x01c9]
	.word 0xf93d0000  ! 705: STDF_R	std	%f28, [%r0, %r20]
	.word 0xb2c58000  ! 706: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xfe35c000  ! 710: STH_R	sth	%r31, [%r23 + %r0]
	.word 0x8395202f  ! 715: WRPR_TNPC_I	wrpr	%r20, 0x002f, %tnpc
	.word 0xf2754000  ! 717: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb3480000  ! 723: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ce057  ! 730: STB_I	stb	%r25, [%r19 + 0x0057]
	.word 0xf23da0ff  ! 734: STD_I	std	%r25, [%r22 + 0x00ff]
	.word 0xb53db001  ! 735: SRAX_I	srax	%r22, 0x0001, %r26
	.word 0xba8d8000  ! 740: ANDcc_R	andcc 	%r22, %r0, %r29
	setx	0x4c70c50700000d40, %g1, %r10
	.word 0x819a8000  ! 742: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb2ad208d  ! 747: ANDNcc_I	andncc 	%r20, 0x008d, %r25
	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 750: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	data_start_1, %g1, %r18
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 753: RDPR_PSTATE	<illegal instruction>
	.word 0xbd3cb001  ! 760: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xfe35c000  ! 763: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xfe2d0000  ! 764: STB_R	stb	%r31, [%r20 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe75c000  ! 767: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfe75c000  ! 768: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfe2d4000  ! 771: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xbc84e1ff  ! 773: ADDcc_I	addcc 	%r19, 0x01ff, %r30
	.word 0xb151c000  ! 774: RDPR_TL	rdpr	%tl, %r24
	.word 0xfa3da09a  ! 777: STD_I	std	%r29, [%r22 + 0x009a]
	.word 0xb1341000  ! 778: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xfc3da06d  ! 779: STD_I	std	%r30, [%r22 + 0x006d]
	.word 0xf834c000  ! 782: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf93dc000  ! 784: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf02d6075  ! 785: STB_I	stb	%r24, [%r21 + 0x0075]
	.word 0xf825611e  ! 788: STW_I	stw	%r28, [%r21 + 0x011e]
	.word 0x8795204d  ! 789: WRPR_TT_I	wrpr	%r20, 0x004d, %tt
	.word 0xf33d8000  ! 791: STDF_R	std	%f25, [%r0, %r22]
	.word 0xfe35c000  ! 792: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf83d4000  ! 795: STD_R	std	%r28, [%r21 + %r0]
	.word 0xbd3c0000  ! 799: SRA_R	sra 	%r16, %r0, %r30
	.word 0xf2240000  ! 800: STW_R	stw	%r25, [%r16 + %r0]
	.word 0x879560b6  ! 804: WRPR_TT_I	wrpr	%r21, 0x00b6, %tt
	.word 0xfd3d0000  ! 807: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf625c000  ! 809: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf8250000  ! 811: STW_R	stw	%r28, [%r20 + %r0]
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3d8000  ! 813: STDF_R	std	%f31, [%r0, %r22]
	setx	data_start_0, %g1, %r17
	.word 0xbb34d000  ! 815: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xba44a05e  ! 817: ADDC_I	addc 	%r18, 0x005e, %r29
	.word 0xb00dc000  ! 819: AND_R	and 	%r23, %r0, %r24
	.word 0xf875a19e  ! 820: STX_I	stx	%r28, [%r22 + 0x019e]
	.word 0xfc24e18d  ! 822: STW_I	stw	%r30, [%r19 + 0x018d]
	.word 0x8995e0cb  ! 823: WRPR_TICK_I	wrpr	%r23, 0x00cb, %tick
	setx	data_start_5, %g1, %r20
	.word 0xb351c000  ! 826: RDPR_TL	rdpr	%tl, %r25
	.word 0xbb540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xf675a12d  ! 833: STX_I	stx	%r27, [%r22 + 0x012d]
	.word 0xf635c000  ! 834: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfe25e18d  ! 839: STW_I	stw	%r31, [%r23 + 0x018d]
	.word 0xf6740000  ! 843: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf824c000  ! 844: STW_R	stw	%r28, [%r19 + %r0]
	.word 0x879461aa  ! 848: WRPR_TT_I	wrpr	%r17, 0x01aa, %tt
	.word 0xba0da028  ! 851: AND_I	and 	%r22, 0x0028, %r29
	.word 0xf62461f8  ! 852: STW_I	stw	%r27, [%r17 + 0x01f8]
	.word 0x81956026  ! 854: WRPR_TPC_I	wrpr	%r21, 0x0026, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf3d5000  ! 858: SRAX_R	srax	%r21, %r0, %r31
	.word 0xfc340000  ! 859: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf0252143  ! 860: STW_I	stw	%r24, [%r20 + 0x0143]
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3c8000  ! 864: STDF_R	std	%f31, [%r0, %r18]
	.word 0x89942128  ! 865: WRPR_TICK_I	wrpr	%r16, 0x0128, %tick
	.word 0xfe2c4000  ! 867: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfc340000  ! 868: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf53ca017  ! 873: STDF_I	std	%f26, [0x0017, %r18]
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c4000  ! 876: STB_R	stb	%r25, [%r17 + %r0]
	.word 0x9194a005  ! 878: WRPR_PIL_I	wrpr	%r18, 0x0005, %pil
	.word 0xbf504000  ! 879: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xfe2ca0d3  ! 880: STB_I	stb	%r31, [%r18 + 0x00d3]
	mov	2, %r12
	.word 0xa1930000  ! 882: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6740000  ! 884: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfe3c4000  ! 885: STD_R	std	%r31, [%r17 + %r0]
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc6062  ! 890: XNORcc_I	xnorcc 	%r17, 0x0062, %r27
	.word 0xf6244000  ! 892: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfc2d209f  ! 894: STB_I	stb	%r30, [%r20 + 0x009f]
	.word 0xfe3dc000  ! 904: STD_R	std	%r31, [%r23 + %r0]
	.word 0xb80d207c  ! 905: AND_I	and 	%r20, 0x007c, %r28
	.word 0xb5508000  ! 908: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf4740000  ! 912: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf2254000  ! 917: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb28c8000  ! 918: ANDcc_R	andcc 	%r18, %r0, %r25
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63de0d4  ! 923: STD_I	std	%r27, [%r23 + 0x00d4]
	mov	2, %r12
	.word 0xa1930000  ! 924: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2252185  ! 928: STW_I	stw	%r25, [%r20 + 0x0185]
	setx	data_start_1, %g1, %r19
	.word 0xbe1d204b  ! 939: XOR_I	xor 	%r20, 0x004b, %r31
	setx	0x86b561660000180c, %g1, %r10
	.word 0x819a8000  ! 940: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xb6bc4000  ! 943: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0x819520e3  ! 945: WRPR_TPC_I	wrpr	%r20, 0x00e3, %tpc
	.word 0xb22d4000  ! 946: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xf2748000  ! 947: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf024e005  ! 948: STW_I	stw	%r24, [%r19 + 0x0005]
	.word 0xf03ca0f0  ! 950: STD_I	std	%r24, [%r18 + 0x00f0]
	mov	2, %r12
	.word 0xa1930000  ! 951: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf23d21eb  ! 953: STD_I	std	%r25, [%r20 + 0x01eb]
	.word 0xb4b5a19a  ! 955: SUBCcc_I	orncc 	%r22, 0x019a, %r26
	.word 0xf6348000  ! 959: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbb508000  ! 962: RDPR_TSTATE	rdpr	%tstate, %r29
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa748000  ! 966: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbf51c000  ! 969: RDPR_TL	<illegal instruction>
	.word 0xb21c0000  ! 970: XOR_R	xor 	%r16, %r0, %r25
	.word 0xf53de0ab  ! 972: STDF_I	std	%f26, [0x00ab, %r23]
	.word 0xf02d4000  ! 976: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf274e152  ! 977: STX_I	stx	%r25, [%r19 + 0x0152]
	.word 0x8195e1a4  ! 978: WRPR_TPC_I	wrpr	%r23, 0x01a4, %tpc
	mov	0x11c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a1ce  ! 982: WRPR_TSTATE_I	wrpr	%r22, 0x01ce, %tstate
	.word 0x9195a127  ! 991: WRPR_PIL_I	wrpr	%r22, 0x0127, %pil
	.word 0xb5357001  ! 994: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xb2348000  ! 995: ORN_R	orn 	%r18, %r0, %r25
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
	.word 0xf6158000  ! 7: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf80520c6  ! 8: LDUW_I	lduw	[%r20 + 0x00c6], %r28
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e098  ! 11: WRPR_TT_I	wrpr	%r23, 0x0098, %tt
	.word 0xbd480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf20ce095  ! 14: LDUB_I	ldub	[%r19 + 0x0095], %r25
	.word 0xf40dc000  ! 17: LDUB_R	ldub	[%r23 + %r0], %r26
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81dc000  ! 20: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xfc0ca02e  ! 22: LDUB_I	ldub	[%r18 + 0x002e], %r30
	.word 0xb5520000  ! 25: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa55e1e8  ! 32: LDSH_I	ldsh	[%r23 + 0x01e8], %r29
	.word 0xfe0ce154  ! 34: LDUB_I	ldub	[%r19 + 0x0154], %r31
	.word 0xf85561e0  ! 37: LDSH_I	ldsh	[%r21 + 0x01e0], %r28
	.word 0xb884a082  ! 39: ADDcc_I	addcc 	%r18, 0x0082, %r28
	.word 0xb5508000  ! 40: RDPR_TSTATE	<illegal instruction>
	.word 0xf04c2066  ! 41: LDSB_I	ldsb	[%r16 + 0x0066], %r24
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e10e  ! 43: WRPR_TT_I	wrpr	%r23, 0x010e, %tt
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d8000  ! 49: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf20d4000  ! 52: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0x8795e12f  ! 54: WRPR_TT_I	wrpr	%r23, 0x012f, %tt
	.word 0xb4b50000  ! 55: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xfe5dc000  ! 59: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf6148000  ! 63: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xf21dc000  ! 65: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xb4b40000  ! 67: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0x8d94e1f6  ! 69: WRPR_PSTATE_I	wrpr	%r19, 0x01f6, %pstate
	mov	0, %r12
	.word 0x8f930000  ! 71: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6556193  ! 76: LDSH_I	ldsh	[%r21 + 0x0193], %r27
	.word 0xf21c606d  ! 78: LDD_I	ldd	[%r17 + 0x006d], %r25
	.word 0xf51ce115  ! 82: LDDF_I	ldd	[%r19, 0x0115], %f26
	.word 0xb6450000  ! 85: ADDC_R	addc 	%r20, %r0, %r27
	mov	1, %r12
	.word 0x8f930000  ! 86: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x11b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41d0000  ! 93: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xb135b001  ! 94: SRLX_I	srlx	%r22, 0x0001, %r24
	.word 0xf85de136  ! 96: LDX_I	ldx	[%r23 + 0x0136], %r28
	.word 0xf455a159  ! 98: LDSH_I	ldsh	[%r22 + 0x0159], %r26
	.word 0xfe4ce095  ! 99: LDSB_I	ldsb	[%r19 + 0x0095], %r31
	.word 0xfe1d204e  ! 101: LDD_I	ldd	[%r20 + 0x004e], %r31
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 112: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xb0b5a152  ! 116: SUBCcc_I	orncc 	%r22, 0x0152, %r24
	.word 0xbb518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0xf844e1ab  ! 120: LDSW_I	ldsw	[%r19 + 0x01ab], %r28
	.word 0x8794a098  ! 122: WRPR_TT_I	wrpr	%r18, 0x0098, %tt
	.word 0xbc2d20b1  ! 131: ANDN_I	andn 	%r20, 0x00b1, %r30
	.word 0xf054e167  ! 138: LDSH_I	ldsh	[%r19 + 0x0167], %r24
	.word 0xf6144000  ! 142: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xb1500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0xf85d0000  ! 148: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0x8594a010  ! 149: WRPR_TSTATE_I	wrpr	%r18, 0x0010, %tstate
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 151: RDPR_TICK	<illegal instruction>
	.word 0xfa4cc000  ! 152: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xfa54a0ed  ! 155: LDSH_I	ldsh	[%r18 + 0x00ed], %r29
	.word 0xf204c000  ! 158: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xfa044000  ! 159: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf91d0000  ! 162: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf8540000  ! 164: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xf21d21aa  ! 167: LDD_I	ldd	[%r20 + 0x01aa], %r25
	.word 0xf8540000  ! 169: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xfd1c606d  ! 171: LDDF_I	ldd	[%r17, 0x006d], %f30
	.word 0xfc45e1d8  ! 172: LDSW_I	ldsw	[%r23 + 0x01d8], %r30
	.word 0xbd51c000  ! 173: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 177: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_4, %g1, %r18
	.word 0xf05d6048  ! 181: LDX_I	ldx	[%r21 + 0x0048], %r24
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c4a08a  ! 184: ADDCcc_I	addccc 	%r18, 0x008a, %r25
	.word 0xfa048000  ! 186: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0x8595e1ac  ! 187: WRPR_TSTATE_I	wrpr	%r23, 0x01ac, %tstate
	.word 0xfc5420e1  ! 189: LDSH_I	ldsh	[%r16 + 0x00e1], %r30
	.word 0x8194e1f6  ! 192: WRPR_TPC_I	wrpr	%r19, 0x01f6, %tpc
	.word 0xfa5c602d  ! 196: LDX_I	ldx	[%r17 + 0x002d], %r29
	.word 0xb7480000  ! 198: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08420db  ! 201: ADDcc_I	addcc 	%r16, 0x00db, %r24
	.word 0xf0552170  ! 206: LDSH_I	ldsh	[%r20 + 0x0170], %r24
	.word 0xb351c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xf01d0000  ! 215: LDD_R	ldd	[%r20 + %r0], %r24
	.word 0xf0150000  ! 217: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb2340000  ! 218: SUBC_R	orn 	%r16, %r0, %r25
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1c8000  ! 223: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf40dc000  ! 225: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf60c0000  ! 226: LDUB_R	ldub	[%r16 + %r0], %r27
	setx	data_start_1, %g1, %r22
	.word 0xf04d4000  ! 231: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xb6940000  ! 233: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xfa54e0c6  ! 234: LDSH_I	ldsh	[%r19 + 0x00c6], %r29
	mov	2, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6542172  ! 239: LDSH_I	ldsh	[%r16 + 0x0172], %r27
	.word 0xf6452147  ! 241: LDSW_I	ldsw	[%r20 + 0x0147], %r27
	.word 0xf41d20a0  ! 244: LDD_I	ldd	[%r20 + 0x00a0], %r26
	.word 0xbd540000  ! 245: RDPR_GL	<illegal instruction>
	.word 0xfe4ce1c6  ! 248: LDSB_I	ldsb	[%r19 + 0x01c6], %r31
	mov	1, %r12
	.word 0x8f930000  ! 250: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc55c000  ! 255: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xbe95e1fc  ! 258: ORcc_I	orcc 	%r23, 0x01fc, %r31
	.word 0xf8450000  ! 259: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0x919460e3  ! 260: WRPR_PIL_I	wrpr	%r17, 0x00e3, %pil
	.word 0xbd2d9000  ! 263: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xf0044000  ! 265: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xbd508000  ! 268: RDPR_TSTATE	<illegal instruction>
	.word 0xfe14205f  ! 271: LDUH_I	lduh	[%r16 + 0x005f], %r31
	mov	1, %r12
	.word 0xa1930000  ! 273: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e111  ! 287: WRPR_TNPC_I	wrpr	%r19, 0x0111, %tnpc
	.word 0xf81da12e  ! 288: LDD_I	ldd	[%r22 + 0x012e], %r28
	.word 0xf055a1ba  ! 290: LDSH_I	ldsh	[%r22 + 0x01ba], %r24
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 296: MOVcc_I	<illegal instruction>
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44a0a0  ! 301: LDSW_I	ldsw	[%r18 + 0x00a0], %r31
	.word 0xfc440000  ! 302: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf25d8000  ! 303: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xfe556193  ! 304: LDSH_I	ldsh	[%r21 + 0x0193], %r31
	.word 0xf805c000  ! 308: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf804c000  ! 310: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xf4440000  ! 312: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xb350c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0xfc15e0a5  ! 319: LDUH_I	lduh	[%r23 + 0x00a5], %r30
	.word 0xfe446165  ! 323: LDSW_I	ldsw	[%r17 + 0x0165], %r31
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 327: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x19665bc100003dc4, %g1, %r10
	.word 0x839a8000  ! 329: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8395a002  ! 330: WRPR_TNPC_I	wrpr	%r22, 0x0002, %tnpc
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44ca13f  ! 335: LDSB_I	ldsb	[%r18 + 0x013f], %r26
	.word 0xfc5dc000  ! 336: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0x859521a2  ! 337: WRPR_TSTATE_I	wrpr	%r20, 0x01a2, %tstate
	.word 0xb8942060  ! 344: ORcc_I	orcc 	%r16, 0x0060, %r28
	.word 0x8595e07d  ! 345: WRPR_TSTATE_I	wrpr	%r23, 0x007d, %tstate
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	setx	0xd19f52b90000080a, %g1, %r10
	.word 0x819a8000  ! 352: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa058000  ! 358: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf455c000  ! 359: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xf51dc000  ! 364: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf84d8000  ! 367: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb01d20bf  ! 370: XOR_I	xor 	%r20, 0x00bf, %r24
	.word 0xf8054000  ! 373: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xbf7d8400  ! 378: MOVR_R	movre	%r22, %r0, %r31
	.word 0xb7540000  ! 380: RDPR_GL	<illegal instruction>
	.word 0xff1d0000  ! 382: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xfe0dc000  ! 384: LDUB_R	ldub	[%r23 + %r0], %r31
	.word 0xb7480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb751c000  ! 386: RDPR_TL	<illegal instruction>
	.word 0xfa4c60c3  ! 388: LDSB_I	ldsb	[%r17 + 0x00c3], %r29
	.word 0xfa0cc000  ! 390: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf91cc000  ! 391: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xfa046028  ! 396: LDUW_I	lduw	[%r17 + 0x0028], %r29
	setx	data_start_1, %g1, %r23
	.word 0xf20c8000  ! 402: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xb9510000  ! 403: RDPR_TICK	<illegal instruction>
	.word 0x819421e5  ! 404: WRPR_TPC_I	wrpr	%r16, 0x01e5, %tpc
	.word 0xf25d20a2  ! 405: LDX_I	ldx	[%r20 + 0x00a2], %r25
	.word 0xf255c000  ! 408: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf4550000  ! 410: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf0140000  ! 411: LDUH_R	lduh	[%r16 + %r0], %r24
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e07a  ! 422: WRPR_TT_I	wrpr	%r19, 0x007a, %tt
	.word 0xf81c61a9  ! 426: LDD_I	ldd	[%r17 + 0x01a9], %r28
	.word 0xbc1c8000  ! 428: XOR_R	xor 	%r18, %r0, %r30
	.word 0xfc5da0d3  ! 430: LDX_I	ldx	[%r22 + 0x00d3], %r30
	.word 0xf60da05c  ! 431: LDUB_I	ldub	[%r22 + 0x005c], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5de076  ! 433: LDX_I	ldx	[%r23 + 0x0076], %r29
	.word 0xba1da179  ! 435: XOR_I	xor 	%r22, 0x0179, %r29
	.word 0x8d946025  ! 436: WRPR_PSTATE_I	wrpr	%r17, 0x0025, %pstate
	.word 0xf04ce01b  ! 441: LDSB_I	ldsb	[%r19 + 0x001b], %r24
	.word 0xfc4dc000  ! 443: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xfe0c2110  ! 446: LDUB_I	ldub	[%r16 + 0x0110], %r31
	.word 0xf11c6159  ! 447: LDDF_I	ldd	[%r17, 0x0159], %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf815613a  ! 460: LDUH_I	lduh	[%r21 + 0x013a], %r28
	.word 0xf85521c0  ! 461: LDSH_I	ldsh	[%r20 + 0x01c0], %r28
	setx	0x2d7bebfa0000f9c5, %g1, %r10
	.word 0x839a8000  ! 463: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81942062  ! 464: WRPR_TPC_I	wrpr	%r16, 0x0062, %tpc
	.word 0xf01c4000  ! 465: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xfc058000  ! 468: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf6554000  ! 470: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf61ce1de  ! 471: LDD_I	ldd	[%r19 + 0x01de], %r27
	.word 0xff1d4000  ! 473: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xf64d0000  ! 475: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfe55a013  ! 476: LDSH_I	ldsh	[%r22 + 0x0013], %r31
	.word 0x899421ee  ! 478: WRPR_TICK_I	wrpr	%r16, 0x01ee, %tick
	.word 0xfa14a02c  ! 481: LDUH_I	lduh	[%r18 + 0x002c], %r29
	.word 0xf51de1cf  ! 482: LDDF_I	ldd	[%r23, 0x01cf], %f26
	.word 0xf11c60d1  ! 483: LDDF_I	ldd	[%r17, 0x00d1], %f24
	.word 0x81942194  ! 485: WRPR_TPC_I	wrpr	%r16, 0x0194, %tpc
	.word 0xbb480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf11c6108  ! 487: LDDF_I	ldd	[%r17, 0x0108], %f24
	.word 0xf85c8000  ! 490: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xfd1c0000  ! 491: LDDF_R	ldd	[%r16, %r0], %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8c4c000  ! 493: ADDCcc_R	addccc 	%r19, %r0, %r28
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c204f  ! 496: LDX_I	ldx	[%r16 + 0x004f], %r24
	.word 0xb3504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xbcad4000  ! 501: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xf01521b3  ! 504: LDUH_I	lduh	[%r20 + 0x01b3], %r24
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89952014  ! 509: WRPR_TICK_I	wrpr	%r20, 0x0014, %tick
	.word 0x8595e082  ! 510: WRPR_TSTATE_I	wrpr	%r23, 0x0082, %tstate
	.word 0xfe4d4000  ! 511: LDSB_R	ldsb	[%r21 + %r0], %r31
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919521a4  ! 513: WRPR_PIL_I	wrpr	%r20, 0x01a4, %pil
	.word 0xfe440000  ! 514: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xbf50c000  ! 515: RDPR_TT	rdpr	%tt, %r31
	.word 0xf64dc000  ! 516: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xb3358000  ! 518: SRL_R	srl 	%r22, %r0, %r25
	.word 0xf8458000  ! 520: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xbe85e1b1  ! 521: ADDcc_I	addcc 	%r23, 0x01b1, %r31
	.word 0xb00c8000  ! 523: AND_R	and 	%r18, %r0, %r24
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 528: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xbd504000  ! 533: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa1c4000  ! 535: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xb4c460b4  ! 536: ADDCcc_I	addccc 	%r17, 0x00b4, %r26
	.word 0xf65cc000  ! 537: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0x8794a19f  ! 538: WRPR_TT_I	wrpr	%r18, 0x019f, %tt
	.word 0xf91d0000  ! 541: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xbe3d61a7  ! 543: XNOR_I	xnor 	%r21, 0x01a7, %r31
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c54000  ! 549: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xb00ca185  ! 555: AND_I	and 	%r18, 0x0185, %r24
	.word 0x879461c3  ! 557: WRPR_TT_I	wrpr	%r17, 0x01c3, %tt
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63ca1f0  ! 560: XNOR_I	xnor 	%r18, 0x01f0, %r27
	setx	0x9c416d100000f9c7, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0252072  ! 565: SUB_I	sub 	%r20, 0x0072, %r24
	.word 0xb1518000  ! 568: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0x839521a9  ! 569: WRPR_TNPC_I	wrpr	%r20, 0x01a9, %tnpc
	.word 0xf20d0000  ! 573: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfe14e08d  ! 578: LDUH_I	lduh	[%r19 + 0x008d], %r31
	.word 0xf04d60d5  ! 579: LDSB_I	ldsb	[%r21 + 0x00d5], %r24
	.word 0xf8058000  ! 580: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xfc1d0000  ! 584: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xb4a50000  ! 585: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xf21de0b2  ! 587: LDD_I	ldd	[%r23 + 0x00b2], %r25
	.word 0xfa548000  ! 589: LDSH_R	ldsh	[%r18 + %r0], %r29
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1ca1f4  ! 591: LDDF_I	ldd	[%r18, 0x01f4], %f30
	.word 0xfa05c000  ! 594: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0x8595a0d3  ! 597: WRPR_TSTATE_I	wrpr	%r22, 0x00d3, %tstate
	.word 0xb3500000  ! 598: RDPR_TPC	rdpr	%tpc, %r25
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83942117  ! 602: WRPR_TNPC_I	wrpr	%r16, 0x0117, %tnpc
	.word 0xf2044000  ! 604: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xfd1da0f2  ! 608: LDDF_I	ldd	[%r22, 0x00f2], %f30
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d60ce  ! 612: LDSB_I	ldsb	[%r21 + 0x00ce], %r26
	.word 0xf0158000  ! 617: LDUH_R	lduh	[%r22 + %r0], %r24
	setx	data_start_6, %g1, %r21
	.word 0xfc44a0da  ! 621: LDSW_I	ldsw	[%r18 + 0x00da], %r30
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60cc000  ! 633: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xf41dc000  ! 634: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0x91956152  ! 640: WRPR_PIL_I	wrpr	%r21, 0x0152, %pil
	.word 0xf11d2087  ! 641: LDDF_I	ldd	[%r20, 0x0087], %f24
	.word 0xb9510000  ! 643: RDPR_TICK	<illegal instruction>
	.word 0xf204e095  ! 646: LDUW_I	lduw	[%r19 + 0x0095], %r25
	.word 0xbb520000  ! 647: RDPR_PIL	<illegal instruction>
	.word 0x8d9421e7  ! 649: WRPR_PSTATE_I	wrpr	%r16, 0x01e7, %pstate
	.word 0xf01d214b  ! 651: LDD_I	ldd	[%r20 + 0x014b], %r24
	.word 0xf64d0000  ! 652: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xbb480000  ! 653: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc146104  ! 656: LDUH_I	lduh	[%r17 + 0x0104], %r30
	.word 0xba240000  ! 658: SUB_R	sub 	%r16, %r0, %r29
	.word 0xf2054000  ! 662: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xbb3cf001  ! 663: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xb5359000  ! 664: SRLX_R	srlx	%r22, %r0, %r26
	.word 0xb750c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0xf81c6052  ! 670: LDD_I	ldd	[%r17 + 0x0052], %r28
	.word 0xfa5d20fc  ! 672: LDX_I	ldx	[%r20 + 0x00fc], %r29
	.word 0xfc1c0000  ! 675: LDD_R	ldd	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r23
	.word 0xf405205d  ! 683: LDUW_I	lduw	[%r20 + 0x005d], %r26
	.word 0xf8148000  ! 685: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf51d21cb  ! 688: LDDF_I	ldd	[%r20, 0x01cb], %f26
	.word 0xbd7c0400  ! 690: MOVR_R	movre	%r16, %r0, %r30
	.word 0x8394210e  ! 692: WRPR_TNPC_I	wrpr	%r16, 0x010e, %tnpc
	.word 0xfe4520ea  ! 697: LDSW_I	ldsw	[%r20 + 0x00ea], %r31
	.word 0xf91c0000  ! 699: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xfe44605e  ! 701: LDSW_I	ldsw	[%r17 + 0x005e], %r31
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5c000  ! 706: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xf25ce197  ! 707: LDX_I	ldx	[%r19 + 0x0197], %r25
	.word 0xf2052147  ! 708: LDUW_I	lduw	[%r20 + 0x0147], %r25
	.word 0xf45c214e  ! 714: LDX_I	ldx	[%r16 + 0x014e], %r26
	.word 0x83952128  ! 715: WRPR_TNPC_I	wrpr	%r20, 0x0128, %tnpc
	.word 0xf31cc000  ! 718: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf00c21a8  ! 721: LDUB_I	ldub	[%r16 + 0x01a8], %r24
	.word 0xb3480000  ! 723: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa55a0c8  ! 725: LDSH_I	ldsh	[%r22 + 0x00c8], %r29
	.word 0xf2458000  ! 726: LDSW_R	ldsw	[%r22 + %r0], %r25
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61c20eb  ! 728: LDD_I	ldd	[%r16 + 0x00eb], %r27
	.word 0xfe44c000  ! 731: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf415a068  ! 733: LDUH_I	lduh	[%r22 + 0x0068], %r26
	.word 0xb13df001  ! 735: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xb48dc000  ! 740: ANDcc_R	andcc 	%r23, %r0, %r26
	.word 0xf204616c  ! 741: LDUW_I	lduw	[%r17 + 0x016c], %r25
	setx	0x7f52a81200008d1f, %g1, %r10
	.word 0x819a8000  ! 742: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf254a123  ! 745: LDSH_I	ldsh	[%r18 + 0x0123], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8ada016  ! 747: ANDNcc_I	andncc 	%r22, 0x0016, %r28
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 750: RDPR_PSTATE	rdpr	%pstate, %r27
	setx	data_start_2, %g1, %r22
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 753: RDPR_PSTATE	<illegal instruction>
	.word 0xfc15e15f  ! 756: LDUH_I	lduh	[%r23 + 0x015f], %r30
	.word 0xb93df001  ! 760: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xf31ce0b0  ! 761: LDDF_I	ldd	[%r19, 0x00b0], %f25
	mov	0, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf415e1eb  ! 769: LDUH_I	lduh	[%r23 + 0x01eb], %r26
	.word 0xb285202d  ! 773: ADDcc_I	addcc 	%r20, 0x002d, %r25
	.word 0xb151c000  ! 774: RDPR_TL	<illegal instruction>
	.word 0xb935d000  ! 778: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xfa1c2060  ! 786: LDD_I	ldd	[%r16 + 0x0060], %r29
	.word 0x8795218f  ! 789: WRPR_TT_I	wrpr	%r20, 0x018f, %tt
	.word 0xf6550000  ! 790: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf00c0000  ! 797: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xb53cc000  ! 799: SRA_R	sra 	%r19, %r0, %r26
	.word 0x8795e0d3  ! 804: WRPR_TT_I	wrpr	%r23, 0x00d3, %tt
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0xbb349000  ! 815: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xb8456170  ! 817: ADDC_I	addc 	%r21, 0x0170, %r28
	.word 0xba0d0000  ! 819: AND_R	and 	%r20, %r0, %r29
	.word 0xf2440000  ! 821: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0x89946150  ! 823: WRPR_TICK_I	wrpr	%r17, 0x0150, %tick
	setx	data_start_2, %g1, %r17
	.word 0xbf51c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xb5540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xf80d200e  ! 835: LDUB_I	ldub	[%r20 + 0x000e], %r28
	.word 0xf25d8000  ! 836: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xf045e0e1  ! 837: LDSW_I	ldsw	[%r23 + 0x00e1], %r24
	.word 0xf85d4000  ! 841: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf61420f5  ! 845: LDUH_I	lduh	[%r16 + 0x00f5], %r27
	.word 0x879461d1  ! 848: WRPR_TT_I	wrpr	%r17, 0x01d1, %tt
	.word 0xf2050000  ! 850: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xb00da1df  ! 851: AND_I	and 	%r22, 0x01df, %r24
	.word 0xf20d0000  ! 853: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0x8194a1e4  ! 854: WRPR_TPC_I	wrpr	%r18, 0x01e4, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb93d5000  ! 858: SRAX_R	srax	%r21, %r0, %r28
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89956025  ! 865: WRPR_TICK_I	wrpr	%r21, 0x0025, %tick
	.word 0xf00d21ec  ! 869: LDUB_I	ldub	[%r20 + 0x01ec], %r24
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71d211b  ! 877: LDDF_I	ldd	[%r20, 0x011b], %f27
	.word 0x9195e05e  ! 878: WRPR_PIL_I	wrpr	%r23, 0x005e, %pil
	.word 0xbf504000  ! 879: RDPR_TNPC	rdpr	%tnpc, %r31
	mov	1, %r12
	.word 0xa1930000  ! 882: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf91c4000  ! 883: LDDF_R	ldd	[%r17, %r0], %f28
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bda06c  ! 890: XNORcc_I	xnorcc 	%r22, 0x006c, %r25
	.word 0xf615e006  ! 895: LDUH_I	lduh	[%r23 + 0x0006], %r27
	.word 0xf6154000  ! 899: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xfc0c0000  ! 903: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xb80d60db  ! 905: AND_I	and 	%r21, 0x00db, %r28
	.word 0xf91d6034  ! 907: LDDF_I	ldd	[%r21, 0x0034], %f28
	.word 0xb7508000  ! 908: RDPR_TSTATE	<illegal instruction>
	.word 0xfc144000  ! 914: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xfc0cc000  ! 916: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xbc8c4000  ! 918: ANDcc_R	andcc 	%r17, %r0, %r30
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 924: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf04dc000  ! 925: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf25561ab  ! 930: LDSH_I	ldsh	[%r21 + 0x01ab], %r25
	.word 0xf51d8000  ! 931: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf414e120  ! 935: LDUH_I	lduh	[%r19 + 0x0120], %r26
	setx	data_start_7, %g1, %r19
	.word 0xb01c21d5  ! 939: XOR_I	xor 	%r16, 0x01d5, %r24
	setx	0x85b362c100009ec7, %g1, %r10
	.word 0x819a8000  ! 940: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_3, %g1, %r19
	.word 0xb8bc4000  ! 943: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xfe546195  ! 944: LDSH_I	ldsh	[%r17 + 0x0195], %r31
	.word 0x819520a4  ! 945: WRPR_TPC_I	wrpr	%r20, 0x00a4, %tpc
	.word 0xba2dc000  ! 946: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xf61420af  ! 949: LDUH_I	lduh	[%r16 + 0x00af], %r27
	mov	0, %r12
	.word 0xa1930000  ! 951: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf45c8000  ! 952: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb2b4e0d2  ! 955: SUBCcc_I	orncc 	%r19, 0x00d2, %r25
	.word 0xfc1dc000  ! 958: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf04c8000  ! 960: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xbb508000  ! 962: RDPR_TSTATE	<illegal instruction>
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d21ef  ! 965: LDX_I	ldx	[%r20 + 0x01ef], %r27
	.word 0xb151c000  ! 969: RDPR_TL	<illegal instruction>
	.word 0xb01d4000  ! 970: XOR_R	xor 	%r21, %r0, %r24
	.word 0x81956165  ! 978: WRPR_TPC_I	wrpr	%r21, 0x0165, %tpc
	.word 0xf84de0d1  ! 979: LDSB_I	ldsb	[%r23 + 0x00d1], %r28
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c8000  ! 981: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0x8595e18f  ! 982: WRPR_TSTATE_I	wrpr	%r23, 0x018f, %tstate
	.word 0xfa0d6182  ! 983: LDUB_I	ldub	[%r21 + 0x0182], %r29
	.word 0xfc444000  ! 988: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfa54a13e  ! 990: LDSH_I	ldsh	[%r18 + 0x013e], %r29
	.word 0x9194600a  ! 991: WRPR_PIL_I	wrpr	%r17, 0x000a, %pil
	.word 0xfc5d600c  ! 993: LDX_I	ldx	[%r21 + 0x000c], %r30
	.word 0xbd35f001  ! 994: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xb6348000  ! 995: ORN_R	orn 	%r18, %r0, %r27
	.word 0xf8454000  ! 998: LDSW_R	ldsw	[%r21 + %r0], %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbba98820  ! 1: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbba448a0  ! 2: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xb1a4c9e0  ! 5: FDIVq	dis not found

	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420ac  ! 11: WRPR_TT_I	wrpr	%r16, 0x00ac, %tt
	.word 0xbfa44840  ! 12: FADDd	faddd	%f48, %f0, %f62
	.word 0xb7480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 25: RDPR_PIL	<illegal instruction>
	.word 0xbfa4c840  ! 28: FADDd	faddd	%f50, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a44820  ! 36: FADDs	fadds	%f17, %f0, %f28
	.word 0xb284e040  ! 39: ADDcc_I	addcc 	%r19, 0x0040, %r25
	.word 0xbf508000  ! 40: RDPR_TSTATE	<illegal instruction>
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946106  ! 43: WRPR_TT_I	wrpr	%r17, 0x0106, %tt
	.word 0xb3ab8820  ! 44: FMOVPOS	fmovs	%fcc1, %f0, %f25
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 48: FMOVRZ	dis not found

	.word 0x8795a1fa  ! 54: WRPR_TT_I	wrpr	%r22, 0x01fa, %tt
	.word 0xb4b48000  ! 55: ORNcc_R	orncc 	%r18, %r0, %r26
	.word 0xb3a80820  ! 56: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba54820  ! 60: FADDs	fadds	%f21, %f0, %f29
	.word 0xb4b58000  ! 67: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0x8d95a0cc  ! 69: WRPR_PSTATE_I	wrpr	%r22, 0x00cc, %pstate
	.word 0xb3a489a0  ! 70: FDIVs	fdivs	%f18, %f0, %f25
	mov	0, %r12
	.word 0x8f930000  ! 71: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba448e0  ! 72: FSUBq	dis not found

	.word 0xbfa44820  ! 79: FADDs	fadds	%f17, %f0, %f31
	.word 0xbfa00560  ! 81: FSQRTq	fsqrt	
	.word 0xb5a9c820  ! 83: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb445c000  ! 85: ADDC_R	addc 	%r23, %r0, %r26
	mov	1, %r12
	.word 0x8f930000  ! 86: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3343001  ! 94: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xbba80820  ! 104: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa8820  ! 105: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81420  ! 107: FMOVRNZ	dis not found

	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54960  ! 113: FMULq	dis not found

	.word 0xb7abc820  ! 115: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb0b4e103  ! 116: SUBCcc_I	orncc 	%r19, 0x0103, %r24
	.word 0xbda88820  ! 118: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb7518000  ! 119: RDPR_PSTATE	<illegal instruction>
	.word 0xbbaa8820  ! 121: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0x8795210b  ! 122: WRPR_TT_I	wrpr	%r20, 0x010b, %tt
	.word 0xb5a00040  ! 124: FMOVd	fmovd	%f0, %f26
	.word 0xbda48940  ! 128: FMULd	fmuld	%f18, %f0, %f30
	.word 0xbe2ce0fa  ! 131: ANDN_I	andn 	%r19, 0x00fa, %r31
	.word 0xb7a00040  ! 135: FMOVd	fmovd	%f0, %f58
	.word 0xb1a98820  ! 136: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb5500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x85952144  ! 149: WRPR_TSTATE_I	wrpr	%r20, 0x0144, %tstate
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 151: RDPR_TICK	<illegal instruction>
	.word 0xb5aa8820  ! 156: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00560  ! 165: FSQRTq	fsqrt	
	.word 0xbda589e0  ! 166: FDIVq	dis not found

	.word 0xbb51c000  ! 173: RDPR_TL	<illegal instruction>
	.word 0xb7a4c860  ! 174: FADDq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 177: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_4, %g1, %r16
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 183: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb8c4603b  ! 184: ADDCcc_I	addccc 	%r17, 0x003b, %r28
	.word 0x85956196  ! 187: WRPR_TSTATE_I	wrpr	%r21, 0x0196, %tstate
	.word 0x8195a1ef  ! 192: WRPR_TPC_I	wrpr	%r22, 0x01ef, %tpc
	.word 0xb9a508a0  ! 195: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xb5a81820  ! 197: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb480000  ! 198: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb085e173  ! 201: ADDcc_I	addcc 	%r23, 0x0173, %r24
	.word 0xbba5c840  ! 202: FADDd	faddd	%f54, %f0, %f60
	.word 0xb1a80c20  ! 204: FMOVRLZ	dis not found

	.word 0xbfa4c8c0  ! 207: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbf51c000  ! 210: RDPR_TL	<illegal instruction>
	.word 0xbda44960  ! 212: FMULq	dis not found

	.word 0xbfa8c820  ! 213: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbfa9c820  ! 214: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xba350000  ! 218: SUBC_R	orn 	%r20, %r0, %r29
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c960  ! 221: FMULq	dis not found

	.word 0xbda40860  ! 222: FADDq	dis not found

	.word 0xb3a58960  ! 227: FMULq	dis not found

	setx	data_start_6, %g1, %r16
	.word 0xbda84820  ! 230: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a588c0  ! 232: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb695c000  ! 233: ORcc_R	orcc 	%r23, %r0, %r27
	mov	2, %r12
	.word 0xa1930000  ! 236: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8c0  ! 242: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb7540000  ! 245: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 250: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1aac820  ! 251: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5abc820  ! 253: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a44860  ! 254: FADDq	dis not found

	.word 0xbda9c820  ! 257: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb8956135  ! 258: ORcc_I	orcc 	%r21, 0x0135, %r28
	.word 0x9194606e  ! 260: WRPR_PIL_I	wrpr	%r17, 0x006e, %pil
	.word 0xbba5c9c0  ! 261: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb12d1000  ! 263: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xb5a80820  ! 267: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3508000  ! 268: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 273: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a50960  ! 275: FMULq	dis not found

	.word 0xbfaa8820  ! 282: FMOVG	fmovs	%fcc1, %f0, %f31
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395a1ce  ! 287: WRPR_TNPC_I	wrpr	%r22, 0x01ce, %tnpc
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 294: FSQRTd	fsqrt	
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 296: MOVcc_I	<illegal instruction>
	.word 0xb3a589a0  ! 298: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xbba54940  ! 299: FMULd	fmuld	%f52, %f0, %f60
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 309: FSQRTd	fsqrt	
	.word 0xb750c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0xb1a589a0  ! 318: FDIVs	fdivs	%f22, %f0, %f24
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 327: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7480000  ! 328: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0xe99ce53900000c94, %g1, %r10
	.word 0x839a8000  ! 329: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x839461f9  ! 330: WRPR_TNPC_I	wrpr	%r17, 0x01f9, %tnpc
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859560bb  ! 337: WRPR_TSTATE_I	wrpr	%r21, 0x00bb, %tstate
	.word 0xb694a1eb  ! 344: ORcc_I	orcc 	%r18, 0x01eb, %r27
	.word 0x8595a190  ! 345: WRPR_TSTATE_I	wrpr	%r22, 0x0190, %tstate
	.word 0xb5a50920  ! 346: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbda548a0  ! 348: FSUBs	fsubs	%f21, %f0, %f30
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	setx	0x6c75d7400002e96, %g1, %r10
	.word 0x819a8000  ! 352: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba4c8c0  ! 353: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbba4c840  ! 362: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a548a0  ! 363: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xb1a00520  ! 368: FSQRTs	fsqrt	
	.word 0xb41c60f3  ! 370: XOR_I	xor 	%r17, 0x00f3, %r26
	.word 0xbb7c8400  ! 378: MOVR_R	movre	%r18, %r0, %r29
	.word 0xb7a80c20  ! 379: FMOVRLZ	dis not found

	.word 0xbd540000  ! 380: RDPR_GL	<illegal instruction>
	.word 0xbf480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb551c000  ! 386: RDPR_TL	<illegal instruction>
	.word 0xbba44920  ! 387: FMULs	fmuls	%f17, %f0, %f29
	.word 0xb1a5c9a0  ! 392: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xbfa90820  ! 394: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	data_start_3, %g1, %r17
	.word 0xbda54840  ! 398: FADDd	faddd	%f52, %f0, %f30
	.word 0xb9510000  ! 403: RDPR_TICK	<illegal instruction>
	.word 0x8195a07c  ! 404: WRPR_TPC_I	wrpr	%r22, 0x007c, %tpc
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 413: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r21
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 420: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x87946099  ! 422: WRPR_TT_I	wrpr	%r17, 0x0099, %tt
	.word 0xbba81420  ! 425: FMOVRNZ	dis not found

	.word 0xb41d4000  ! 428: XOR_R	xor 	%r21, %r0, %r26
	.word 0xb3a508c0  ! 429: FSUBd	fsubd	%f20, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba4c8e0  ! 434: FSUBq	dis not found

	.word 0xba1d6102  ! 435: XOR_I	xor 	%r21, 0x0102, %r29
	.word 0x8d9521db  ! 436: WRPR_PSTATE_I	wrpr	%r20, 0x01db, %pstate
	.word 0xb5a548c0  ! 442: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xbfa00020  ! 449: FMOVs	fmovs	%f0, %f31
	.word 0xbdaa8820  ! 450: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00020  ! 451: FMOVs	fmovs	%f0, %f24
	.word 0xbfa00020  ! 452: FMOVs	fmovs	%f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a50940  ! 455: FMULd	fmuld	%f20, %f0, %f24
	.word 0xb7a94820  ! 457: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a80420  ! 458: FMOVRZ	dis not found

	setx	0x83aad2190000b905, %g1, %r10
	.word 0x839a8000  ! 463: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x819421d2  ! 464: WRPR_TPC_I	wrpr	%r16, 0x01d2, %tpc
	.word 0xb1a54860  ! 466: FADDq	dis not found

	.word 0xb9a4c8a0  ! 469: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xbfa488a0  ! 477: FSUBs	fsubs	%f18, %f0, %f31
	.word 0x899460fc  ! 478: WRPR_TICK_I	wrpr	%r17, 0x00fc, %tick
	.word 0xb3a81820  ! 484: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0x8194619e  ! 485: WRPR_TPC_I	wrpr	%r17, 0x019e, %tpc
	.word 0xb1480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbba40820  ! 488: FADDs	fadds	%f16, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbec40000  ! 493: ADDCcc_R	addccc 	%r16, %r0, %r31
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 497: FMOVRNZ	dis not found

	.word 0xb1a5c8e0  ! 498: FSUBq	dis not found

	.word 0xb7a549e0  ! 499: FDIVq	dis not found

	.word 0xbd504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xb2ac0000  ! 501: ANDNcc_R	andncc 	%r16, %r0, %r25
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40940  ! 508: FMULd	fmuld	%f16, %f0, %f26
	.word 0x899521a3  ! 509: WRPR_TICK_I	wrpr	%r20, 0x01a3, %tick
	.word 0x8595e130  ! 510: WRPR_TSTATE_I	wrpr	%r23, 0x0130, %tstate
	mov	0x31c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a058  ! 513: WRPR_PIL_I	wrpr	%r18, 0x0058, %pil
	.word 0xb550c000  ! 515: RDPR_TT	rdpr	%tt, %r26
	.word 0xb9350000  ! 518: SRL_R	srl 	%r20, %r0, %r28
	.word 0xb5a5c840  ! 519: FADDd	faddd	%f54, %f0, %f26
	.word 0xb884e1cf  ! 521: ADDcc_I	addcc 	%r19, 0x01cf, %r28
	.word 0xb00c0000  ! 523: AND_R	and 	%r16, %r0, %r24
	.word 0xb9a00520  ! 524: FSQRTs	fsqrt	
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508c0  ! 532: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xbf504000  ! 533: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8c5e1e4  ! 536: ADDCcc_I	addccc 	%r23, 0x01e4, %r28
	.word 0x8794e19a  ! 538: WRPR_TT_I	wrpr	%r19, 0x019a, %tt
	.word 0xbc3c20d2  ! 543: XNOR_I	xnor 	%r16, 0x00d2, %r30
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40820  ! 547: FADDs	fadds	%f16, %f0, %f31
	.word 0xb2c54000  ! 549: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xbfa5c8e0  ! 554: FSUBq	dis not found

	.word 0xbe0d607e  ! 555: AND_I	and 	%r21, 0x007e, %r31
	.word 0x879460a9  ! 557: WRPR_TT_I	wrpr	%r17, 0x00a9, %tt
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c6058  ! 560: XNOR_I	xnor 	%r17, 0x0058, %r30
	.word 0xb7a80420  ! 561: FMOVRZ	dis not found

	setx	0xfead67a20000f946, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a00540  ! 563: FSQRTd	fsqrt	
	.word 0xb024e1e8  ! 565: SUB_I	sub 	%r19, 0x01e8, %r24
	.word 0xbda4c940  ! 566: FMULd	fmuld	%f50, %f0, %f30
	.word 0xbda50920  ! 567: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb9518000  ! 568: RDPR_PSTATE	<illegal instruction>
	.word 0x83942092  ! 569: WRPR_TNPC_I	wrpr	%r16, 0x0092, %tnpc
	.word 0xbbab4820  ! 570: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba80c20  ! 574: FMOVRLZ	dis not found

	.word 0xbdaac820  ! 583: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbaa58000  ! 585: SUBcc_R	subcc 	%r22, %r0, %r29
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a0b7  ! 597: WRPR_TSTATE_I	wrpr	%r18, 0x00b7, %tstate
	.word 0xbb500000  ! 598: RDPR_TPC	<illegal instruction>
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a04f  ! 602: WRPR_TNPC_I	wrpr	%r18, 0x004f, %tnpc
	.word 0xb3a00560  ! 607: FSQRTq	fsqrt	
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	.word 0xb3a4c8a0  ! 622: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbda5c940  ! 623: FMULd	fmuld	%f54, %f0, %f30
	.word 0xbbaa0820  ! 625: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7a84820  ! 629: FMOVE	fmovs	%fcc1, %f0, %f27
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 637: FSUBd	fsubd	%f18, %f0, %f60
	.word 0x919520c0  ! 640: WRPR_PIL_I	wrpr	%r20, 0x00c0, %pil
	.word 0xb7510000  ! 643: RDPR_TICK	<illegal instruction>
	.word 0xb9520000  ! 647: RDPR_PIL	<illegal instruction>
	.word 0x8d95603a  ! 649: WRPR_PSTATE_I	wrpr	%r21, 0x003a, %pstate
	.word 0xb9a81420  ! 650: FMOVRNZ	dis not found

	.word 0xbd480000  ! 653: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe248000  ! 658: SUB_R	sub 	%r18, %r0, %r31
	.word 0xb3a88820  ! 659: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb33c7001  ! 663: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xb3355000  ! 664: SRLX_R	srlx	%r21, %r0, %r25
	.word 0xb350c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0xb9a40940  ! 667: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb1508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a40840  ! 669: FADDd	faddd	%f16, %f0, %f58
	.word 0xb1a80820  ! 671: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 673: FMOVNE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r20
	.word 0xbda44840  ! 686: FADDd	faddd	%f48, %f0, %f30
	.word 0xb57dc400  ! 690: MOVR_R	movre	%r23, %r0, %r26
	.word 0x8395206d  ! 692: WRPR_TNPC_I	wrpr	%r20, 0x006d, %tnpc
	.word 0xb9a00020  ! 694: FMOVs	fmovs	%f0, %f28
	.word 0xb3a81c20  ! 696: FMOVRGEZ	dis not found

	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 706: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xb3a00520  ! 712: FSQRTs	fsqrt	
	.word 0xb1a90820  ! 713: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0x83952133  ! 715: WRPR_TNPC_I	wrpr	%r20, 0x0133, %tnpc
	.word 0xb7a54860  ! 716: FADDq	dis not found

	.word 0xb9a00560  ! 719: FSQRTq	fsqrt	
	.word 0xb1a548a0  ! 720: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb1480000  ! 723: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa549c0  ! 732: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xbd3d3001  ! 735: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xb5a80c20  ! 739: FMOVRLZ	dis not found

	.word 0xbe8d8000  ! 740: ANDcc_R	andcc 	%r22, %r0, %r31
	setx	0x1bc9eaa400005a1a, %g1, %r10
	.word 0x819a8000  ! 742: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a98820  ! 743: FMOVNEG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8aca070  ! 747: ANDNcc_I	andncc 	%r18, 0x0070, %r28
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 750: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r16
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 753: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a588a0  ! 758: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb1aa8820  ! 759: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbf3d7001  ! 760: SRAX_I	srax	%r21, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a448e0  ! 770: FSUBq	dis not found

	.word 0xbc85e161  ! 773: ADDcc_I	addcc 	%r23, 0x0161, %r30
	.word 0xbb51c000  ! 774: RDPR_TL	<illegal instruction>
	.word 0xb9a588c0  ! 776: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xbb359000  ! 778: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xbdaa0820  ! 783: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x87956199  ! 789: WRPR_TT_I	wrpr	%r21, 0x0199, %tt
	.word 0xb3a81820  ! 793: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a58860  ! 794: FADDq	dis not found

	.word 0xbb3dc000  ! 799: SRA_R	sra 	%r23, %r0, %r29
	.word 0xbda408c0  ! 801: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbba00020  ! 802: FMOVs	fmovs	%f0, %f29
	.word 0x8795e097  ! 804: WRPR_TT_I	wrpr	%r23, 0x0097, %tt
	.word 0xbfa00540  ! 806: FSQRTd	fsqrt	
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	.word 0xbb349000  ! 815: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xba44e125  ! 817: ADDC_I	addc 	%r19, 0x0125, %r29
	.word 0xbc0d8000  ! 819: AND_R	and 	%r22, %r0, %r30
	.word 0x8995a1e2  ! 823: WRPR_TICK_I	wrpr	%r22, 0x01e2, %tick
	.word 0xb9abc820  ! 824: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r19
	.word 0xb351c000  ! 826: RDPR_TL	<illegal instruction>
	.word 0xb9a80420  ! 827: FMOVRZ	dis not found

	.word 0xb5540000  ! 828: RDPR_GL	<illegal instruction>
	.word 0xb5a98820  ! 829: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a58860  ! 830: FADDq	dis not found

	.word 0x8794a1c1  ! 848: WRPR_TT_I	wrpr	%r18, 0x01c1, %tt
	.word 0xb9a58920  ! 849: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb60d605a  ! 851: AND_I	and 	%r21, 0x005a, %r27
	.word 0x81956037  ! 854: WRPR_TPC_I	wrpr	%r21, 0x0037, %tpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7aa8820  ! 856: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 857: FSQRTs	fsqrt	
	.word 0xbb3d5000  ! 858: SRAX_R	srax	%r21, %r0, %r29
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 862: FSQRTq	fsqrt	
	.word 0x899420b1  ! 865: WRPR_TICK_I	wrpr	%r16, 0x00b1, %tick
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a061  ! 878: WRPR_PIL_I	wrpr	%r22, 0x0061, %pil
	.word 0xb5504000  ! 879: RDPR_TNPC	rdpr	%tnpc, %r26
	mov	2, %r12
	.word 0xa1930000  ! 882: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a8c820  ! 886: FMOVL	fmovs	%fcc1, %f0, %f24
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48920  ! 888: FMULs	fmuls	%f18, %f0, %f30
	.word 0xb6bc61ab  ! 890: XNORcc_I	xnorcc 	%r17, 0x01ab, %r27
	.word 0xb3a5c9a0  ! 893: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb1a509c0  ! 896: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbdab4820  ! 897: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 898: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7ab4820  ! 900: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb40ca1bf  ! 905: AND_I	and 	%r18, 0x01bf, %r26
	.word 0xb3a5c920  ! 906: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb7508000  ! 908: RDPR_TSTATE	<illegal instruction>
	.word 0xbda98820  ! 909: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a409c0  ! 910: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb5a549e0  ! 911: FDIVq	dis not found

	.word 0xbe8d0000  ! 918: ANDcc_R	andcc 	%r20, %r0, %r31
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44860  ! 921: FADDq	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 924: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a549e0  ! 926: FDIVq	dis not found

	.word 0xb5a88820  ! 932: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c9e0  ! 933: FDIVq	dis not found

	.word 0xb7a548c0  ! 934: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb3a5c860  ! 936: FADDq	dis not found

	.word 0xb7a589c0  ! 937: FDIVd	fdivd	%f22, %f0, %f58
	setx	data_start_0, %g1, %r17
	.word 0xb61da041  ! 939: XOR_I	xor 	%r22, 0x0041, %r27
	setx	0xa9fc8f5600007cc8, %g1, %r10
	.word 0x819a8000  ! 940: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_7, %g1, %r20
	.word 0xb7ab8820  ! 942: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbebc4000  ! 943: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0x8194e187  ! 945: WRPR_TPC_I	wrpr	%r19, 0x0187, %tpc
	.word 0xb62cc000  ! 946: ANDN_R	andn 	%r19, %r0, %r27
	mov	0, %r12
	.word 0xa1930000  ! 951: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a588a0  ! 954: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb8b5e04c  ! 955: SUBCcc_I	orncc 	%r23, 0x004c, %r28
	.word 0xb3ab8820  ! 957: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 961: FSQRTd	fsqrt	
	.word 0xbb508000  ! 962: RDPR_TSTATE	<illegal instruction>
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 967: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a90820  ! 968: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbf51c000  ! 969: RDPR_TL	<illegal instruction>
	.word 0xb41c8000  ! 970: XOR_R	xor 	%r18, %r0, %r26
	.word 0xb9a54820  ! 973: FADDs	fadds	%f21, %f0, %f28
	.word 0x8194209b  ! 978: WRPR_TPC_I	wrpr	%r16, 0x009b, %tpc
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85952008  ! 982: WRPR_TSTATE_I	wrpr	%r20, 0x0008, %tstate
	.word 0xbdabc820  ! 984: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00540  ! 985: FSQRTd	fsqrt	
	.word 0xbda5c820  ! 987: FADDs	fadds	%f23, %f0, %f30
	.word 0xbba5c920  ! 989: FMULs	fmuls	%f23, %f0, %f29
	.word 0x9195616a  ! 991: WRPR_PIL_I	wrpr	%r21, 0x016a, %pil
	.word 0xb5357001  ! 994: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xba358000  ! 995: ORN_R	orn 	%r22, %r0, %r29
	.word 0xbba5c8c0  ! 997: FSUBd	fsubd	%f54, %f0, %f60

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

	.xword	0x2ccfc135b0a0c030
	.xword	0x15a8267cfe53b398
	.xword	0x3e763bb922011d1d
	.xword	0xbe0bf6a0d92b129c
	.xword	0x8651253a49300948
	.xword	0xa5f159e2075ae602
	.xword	0xc006b1c1d1aadd53
	.xword	0xf03cb944c687e1b9
	.xword	0xa62810f052bcaa8a
	.xword	0xc369806d95bb343a
	.xword	0x40d85f13d6533ade
	.xword	0x41ddac78092691d4
	.xword	0xdd75d39b3039348b
	.xword	0x6ac9bdf2e93fd44b
	.xword	0x4efd14a6c32d55c8
	.xword	0x9defbe3c2c7506a4
	.xword	0x6cbe0116b92e4f6d
	.xword	0x8b3de67e6624b7e0
	.xword	0x674993fcac9dc78b
	.xword	0xafee244b1869ab0d
	.xword	0xa9052c78c3c5d3ed
	.xword	0x0c684e5ca5fd9114
	.xword	0xba94be2fde42b847
	.xword	0xb3850e8dffcf5c70
	.xword	0x57316a9de057c39b
	.xword	0x3b7d3a36cfb8fde8
	.xword	0x212ad0f8acb98ebf
	.xword	0x66c53dad4f0e69f0
	.xword	0x8dfdaf77f80745fd
	.xword	0xd0e833410604fa7f
	.xword	0x708ec1787ceebf5d
	.xword	0xbd73fb1187ea0bc8
	.xword	0x3a9c43a8a4066843
	.xword	0xee80a619dd87ca69
	.xword	0x28822c4616105d4a
	.xword	0x2e74a6d8f573d774
	.xword	0x723105993fec0aa4
	.xword	0x7175604882e9a692
	.xword	0x242dc6dc200cc9ad
	.xword	0x8f195e703e88f30f
	.xword	0x37ecf83e6fcabdd3
	.xword	0xbe13eb6b71e673e1
	.xword	0xf0ad98ed98fe9c78
	.xword	0xc6968cfc6d046312
	.xword	0x7c35d3ffa93af248
	.xword	0x56a725e31d102c08
	.xword	0x181322a7d0336e13
	.xword	0xb8d12d4910e78be5
	.xword	0x6cccf6bad1e857b3
	.xword	0x58ec396f8dbc0168
	.xword	0x32dedeeb5f30f472
	.xword	0x488a31142a78c3db
	.xword	0x80e8c7efbd219bfd
	.xword	0xc66a4962e5113907
	.xword	0xd1d83103af8e830f
	.xword	0x925009b9a3a79875
	.xword	0x27d74cb4669e3a12
	.xword	0x6362a05efac815c0
	.xword	0x8e31e248262bbab4
	.xword	0x5bf02ceb1511a4bc
	.xword	0x9713376c16d266bc
	.xword	0xa734b4319f0f40a1
	.xword	0xb2353960ef490269
	.xword	0xa19d41650fb1aa7b
	.xword	0xa166414ab0a1f53e
	.xword	0xf23f7b364c86a905
	.xword	0xf65ccc0fc5228ce0
	.xword	0x095b80be4aa2f5de
	.xword	0xcceed4f085f537f9
	.xword	0x9dc9298f5b9913f7
	.xword	0x369f80137e5fa292
	.xword	0x5dbf1ed866525b7d
	.xword	0xd737322939c8f131
	.xword	0xc6456fa01505fe5a
	.xword	0x3e66343427d4e7a6
	.xword	0x7de94b293354b970
	.xword	0x0b2d0fe2109ec084
	.xword	0xe5670e77c83a4e79
	.xword	0x78f22f841357b5bb
	.xword	0xb86c450237e60626
	.xword	0x9f033b48d073b66f
	.xword	0xab1b898a76c812f3
	.xword	0x24d9f076198b203c
	.xword	0x1552cb9193d58dce
	.xword	0x1367d68eaab80b97
	.xword	0x3460436d00c05193
	.xword	0xf77ba3395a128ed3
	.xword	0x94d8cedf2cb1035c
	.xword	0xab74f2e8f74a6c14
	.xword	0xa41899ef0ab244a0
	.xword	0x755859c65cd725c6
	.xword	0x2791cc9c4b914eee
	.xword	0xe3a48473ca2621c6
	.xword	0x92db477dbaf55904
	.xword	0xa6e47e4a2f9d505c
	.xword	0xe2917839cef13cb7
	.xword	0x0f46c3941bfeca60
	.xword	0x4bb1102a29c820bb
	.xword	0xd97706e489616f04
	.xword	0x67b32aca6689b9b2
	.xword	0x94152b82e0162a62
	.xword	0x85558259e96406c8
	.xword	0x2c1fabc8401d638b
	.xword	0xb6965b462776651d
	.xword	0x0a302d679aa906ab
	.xword	0x69adeb48b84ec6c1
	.xword	0x6fb97b5977707cf5
	.xword	0x250e03a1af60a9bd
	.xword	0x314f00b2c6a23353
	.xword	0xd8327c16cd3e50cb
	.xword	0x6c022f0b3fcfa9ed
	.xword	0x5fd97a05e67b6b00
	.xword	0x21e9f8befc10adc8
	.xword	0x15dd1fe1cbd9a4b4
	.xword	0xfb97b7bfef7e8474
	.xword	0xa154785da6e98717
	.xword	0x81ed0fac6db447b0
	.xword	0x04579de4a0159f88
	.xword	0x450c2e479f8e302c
	.xword	0xc4fcaa65c234fc27
	.xword	0xbbef94338697f5c7
	.xword	0x44b02069197eb401
	.xword	0x0ae10b5d126df973
	.xword	0x62b9cfbe2d11f63d
	.xword	0x84947d78d3e50061
	.xword	0x945acaa29aa91115
	.xword	0xe51bdab3feb98c27
	.xword	0x4846a187b6b42674
	.xword	0x1d4fcf6a78552895
	.xword	0x02f777d62a6bde2b
	.xword	0x45efca9464704a5c
	.xword	0xa07afb115ed41dad
	.xword	0x62695bfcdb215087
	.xword	0x06a7ac31bbd26c66
	.xword	0x372e864c58183eb0
	.xword	0x2b7bac52609e8f34
	.xword	0x97fdf797ea9c98c0
	.xword	0x8d3ef1b1ce3fff5e
	.xword	0x03fb375054e5b052
	.xword	0xf382783657779d84
	.xword	0xbc57dd87d0e4e2b0
	.xword	0x15818ffbb917ef83
	.xword	0x0fbe969fd956b274
	.xword	0xd8eb8200dfb77e22
	.xword	0xeb5c631a2320a12b
	.xword	0x515817f714adba62
	.xword	0x7759d829916d1092
	.xword	0x00c79d8a28001674
	.xword	0xe272564a2d0b5278
	.xword	0x38e40f1dc3106671
	.xword	0x7ea965c57d1d3b93
	.xword	0x66256c1e50ac513e
	.xword	0x4bc536f3fe47dc9a
	.xword	0x5b8424a5ecd4ce3f
	.xword	0x69c2b9e78e4e40a2
	.xword	0xd6cab9689f338773
	.xword	0x7869947e1ef2f4e3
	.xword	0x70080af1ed07d2ff
	.xword	0x4147caf73d6b931e
	.xword	0x39c339dab9014e4d
	.xword	0x91faadeb3909d21f
	.xword	0xa1460f9c6a0a1ed4
	.xword	0xdcb27313c387456c
	.xword	0x46b93d0dc0df492a
	.xword	0xd94118fb0daca4b0
	.xword	0x859d94bc35ea7fb7
	.xword	0x4af2da9d044ad1fb
	.xword	0x868e71c9ff694498
	.xword	0x2e61a28ec7e88584
	.xword	0x2653a9a26ab12e2e
	.xword	0x6d961bc2a889bfe5
	.xword	0x9ef85b130a11261f
	.xword	0xead61688ddb013f9
	.xword	0xdcdc8243d99a8329
	.xword	0x1104da93d98e1668
	.xword	0x54c9ea7d70dd2fef
	.xword	0xb31a062ed8173b85
	.xword	0x1172a670d470f776
	.xword	0xa10bdd7bcd90015a
	.xword	0xdefd8b1f46b025e0
	.xword	0xeea92045565c1cf0
	.xword	0xa80dd71fc7d5a6c7
	.xword	0x79e52286185049e6
	.xword	0xdb74397e91c92171
	.xword	0x1ecd42946439b3e0
	.xword	0xb60bacecbe43d401
	.xword	0x3e97165f121c4351
	.xword	0xc94809f1d91766aa
	.xword	0xb68b28ca62057181
	.xword	0xf6f22bc3f5fd2b3b
	.xword	0x705e3dde0417d109
	.xword	0xa86352dab345fc94
	.xword	0x29c3583225bbafee
	.xword	0x1afc15f4409c1e47
	.xword	0xec72f884ef4c8f92
	.xword	0x94b1f8af489e86b6
	.xword	0x0969e360a1d9fbae
	.xword	0x5508785a8105b7e4
	.xword	0x7000b1fc8ccfb895
	.xword	0x4d1eebc7a7d8655d
	.xword	0xb5b749b04f69595e
	.xword	0x751acf8986116b49
	.xword	0x030f40182caba958
	.xword	0xf1a7d30c6cbb2076
	.xword	0xb20099d9aba6a008
	.xword	0xbdaaefcccc560c3d
	.xword	0x52274561c2f48253
	.xword	0x44f6e432ca312d6b
	.xword	0x2526ac6f13ac14aa
	.xword	0x520ca9c3c935a165
	.xword	0xc69d7b0ef7e02aea
	.xword	0x857505fb9755a3c6
	.xword	0x63040678c2727d13
	.xword	0x77bb37b8cff6f06e
	.xword	0xfea52ae7bd29b0f1
	.xword	0xf47a41fc6557ee76
	.xword	0x6c6b73321438869e
	.xword	0xb29d0a310714e00f
	.xword	0xa449fa3fe9a7af75
	.xword	0x683cd17160766ca8
	.xword	0x40f6fbe8ed3f2594
	.xword	0x159efb10a6dbe930
	.xword	0xe35908847893c91e
	.xword	0xadfdc607886c8953
	.xword	0x1627e33ae06cb21c
	.xword	0x7c88b8f17a8b6371
	.xword	0x8529e64a84b1d304
	.xword	0x02b222158101348b
	.xword	0x908e146845b45a7b
	.xword	0x3b14e5cf1cde7fd9
	.xword	0x6bb800fb93ad6dc6
	.xword	0x1eb4ed263c3c4b69
	.xword	0x3199ba11612504fe
	.xword	0x6c3b14901748af16
	.xword	0xdfe6936d7dcd1168
	.xword	0x3855da89ccbe54ca
	.xword	0x464efdd820e946c3
	.xword	0x181b14fb3771e271
	.xword	0x09bdb4cf1e709a23
	.xword	0x98f66397870d0572
	.xword	0xf8e09b201f462021
	.xword	0x5e60fdc4fc78e00d
	.xword	0x72d6dfdf9f4cacc5
	.xword	0xd9b8378e1c673e58
	.xword	0xa877979474d9d64f
	.xword	0x4b38050209e19399
	.xword	0xc905329827054294
	.xword	0x22b8cbc578533135
	.xword	0xcaf1a952f26ab1c2
	.xword	0xf73379e0eb9c0c42
	.xword	0x6b2d341ffe892c78
	.xword	0x8ceb343a2e9f66f7
	.xword	0xc01e079529e7357b
	.xword	0x305a8856ce0844fd
	.xword	0x951751175558d176
	.xword	0x1b1222dec96f3da2
	.align 0x2000
	.data
data_start_1:

	.xword	0x7cb4fd7c4e2bc6f1
	.xword	0x5ef2ae056fc512f8
	.xword	0x8e716d255361fbac
	.xword	0x9b62594a13bc2ac7
	.xword	0x2320de4b36aa0100
	.xword	0xb6906c0b15dd4442
	.xword	0xf53af48755b240c2
	.xword	0x442da230e3cad162
	.xword	0x84fcdc1d9f1b7213
	.xword	0x02eb9670445bfd5c
	.xword	0x102e785c5acb9dfd
	.xword	0x7b90d7c6734e3b16
	.xword	0x3059b85f1b7ac3b9
	.xword	0x49ca7f99a18eeb80
	.xword	0x12aa53644f57535c
	.xword	0x4ce2e8b8605b9f2a
	.xword	0x82cfda4d7e0914f4
	.xword	0xf5a23e194dc66fa3
	.xword	0xe5a0a012b43cfa87
	.xword	0x94c8f87477e6c1d3
	.xword	0xc32a40b6404ea43c
	.xword	0x9f69be6b33382437
	.xword	0x9985986bdea22bf8
	.xword	0x254d6bf4f51ef4a6
	.xword	0xd6308a498d46301a
	.xword	0x531af09575a1467c
	.xword	0x47235a30c53c026e
	.xword	0xab9e5b9fac55428d
	.xword	0x0a05dcc31b156abc
	.xword	0x7cd08b9702f48828
	.xword	0xd74b1f48a16eb05f
	.xword	0xdba3644b46f6cf68
	.xword	0x83be43e22e20bfc6
	.xword	0x1163edd2d4390e6f
	.xword	0xd5cff207463acffe
	.xword	0x01accdd9fe4d5984
	.xword	0x514194ce9533b673
	.xword	0xb582c830a75ef9d2
	.xword	0x4be33e06a27edfb3
	.xword	0xd9b4a74099dbbbf1
	.xword	0x9bc435ed92ecc3b3
	.xword	0xb85c71fdb42043a1
	.xword	0xb6f612f3f1beae9e
	.xword	0x8a8ed95e6dd7194d
	.xword	0xb7ad19984a49c905
	.xword	0x3bf4a4372a41eeed
	.xword	0x195b53b70c08de6d
	.xword	0xaf3cdc261ce1d869
	.xword	0x0db5c2312b67f568
	.xword	0xf48ca87c3086f7b9
	.xword	0xb028438d52f50657
	.xword	0x2f6e8e7059be0f12
	.xword	0xde1f17298e0fff7e
	.xword	0x3d771d701bfc3508
	.xword	0xbb58d7c11a9dd6bb
	.xword	0x4337832486f02a90
	.xword	0x46e0701148867fc9
	.xword	0x8de2e071e6d4c4e0
	.xword	0x4615be948f195c47
	.xword	0x31fc138901a37598
	.xword	0xea85a9b6791f55c4
	.xword	0x3cb0ea2015d45d04
	.xword	0x39af582bbb8be779
	.xword	0xc52770aeff87628f
	.xword	0x81bb476f876fe977
	.xword	0xb240bd1eb3e314d9
	.xword	0xbc50ba2f7c62fbf6
	.xword	0x10e9ae8dde9da8eb
	.xword	0xdbd3e592f071a286
	.xword	0x906cbc0c52f5faf7
	.xword	0x56b74c514aa54a70
	.xword	0xa84f4ce9975a921f
	.xword	0xdfd4a34fc442658d
	.xword	0xa79582b16fbaa9bd
	.xword	0x35de48caafc363d5
	.xword	0x0121ba61ed8a3df8
	.xword	0x4e0f7509b6cab6cf
	.xword	0xd61fbb7913b46468
	.xword	0x7b1b92ec7a6904fe
	.xword	0x651fa7f32b9224c5
	.xword	0xdf7a172fdc3f193f
	.xword	0xe18fe614a05ec977
	.xword	0x4e2499494e18cec5
	.xword	0x52b572d4e9273998
	.xword	0x9d9e539d24ef7037
	.xword	0x5b2e41a489c31b64
	.xword	0x1747779940b8952f
	.xword	0x80373347c60c4d9e
	.xword	0xe4f4ff2a0d1992b0
	.xword	0x7ef515ed25a35c74
	.xword	0x52330aaa9d80d02a
	.xword	0x18331c330d2588f5
	.xword	0x4f7b87450afba765
	.xword	0x28dc85540e4ddcb7
	.xword	0xa325501dd3a5f3ef
	.xword	0x6c4f9958f26bde9d
	.xword	0x57c5905861c369ee
	.xword	0x69903b464b40bdd1
	.xword	0xbc1950e09c68615d
	.xword	0x5b562fd4c5189136
	.xword	0x897e7d7744ec8670
	.xword	0x77fcd5bd6a053ef3
	.xword	0xc6677d1087eced13
	.xword	0xc9a19c4c8e5da6c3
	.xword	0xae32e0bc7a7537fe
	.xword	0x04ca1800c7a8ad61
	.xword	0x8b0f3bb0f4e5fefa
	.xword	0xf3bf842c8c73bc8d
	.xword	0x7b5740c081fb098d
	.xword	0x7592aabeca8dc150
	.xword	0xeb8b3100139b5104
	.xword	0x7cc99942fc457494
	.xword	0x6d379c3eb611f798
	.xword	0x39e346c18a53777b
	.xword	0x2cbed80b345a5c8a
	.xword	0xf6079963be49afca
	.xword	0x00a76d1d20e1c73d
	.xword	0x2163f2d009e3e3d3
	.xword	0xf7915bfda2500473
	.xword	0x225036a5b503e268
	.xword	0x0c71e3c9c454b304
	.xword	0x234a1d9fa4eb35b4
	.xword	0xf274666e39ac584f
	.xword	0x192deb54423a1180
	.xword	0x76ac776d6362fb9b
	.xword	0x298215ebe7aeaf1c
	.xword	0x6cb14c825102103c
	.xword	0x82ed9daa5658a15f
	.xword	0x4ff5c851e0c2e861
	.xword	0xa8e8df398931be66
	.xword	0x51bd9cfe9c7b5017
	.xword	0x57889d50c4513637
	.xword	0xf98921e22474cb6c
	.xword	0xbaf27bb2e803ef55
	.xword	0x67ffc3fc8005744d
	.xword	0xdde246d4084ff86a
	.xword	0xc22b7c5bcaaf0c03
	.xword	0xe0c678ec59f55827
	.xword	0xbecb2a273b5d4859
	.xword	0xa520a31e515af419
	.xword	0xa2c5be7a1734e0b9
	.xword	0x388eb2997153ef9d
	.xword	0xd5f2b2b5e17197cc
	.xword	0x3cbcee7ddf140b32
	.xword	0x68c6680b1e8c182d
	.xword	0x423255f6d5d31fcf
	.xword	0xfd88a46bf8fc28b7
	.xword	0x601f96f4decafa3a
	.xword	0x7dac7c8fe0abc812
	.xword	0x4eb7765afa91b638
	.xword	0x58b6d33c404b52be
	.xword	0xae2dbee067eac2bf
	.xword	0xe42983628120c11a
	.xword	0xf5d849af1648cbf1
	.xword	0x66859710935b6d9d
	.xword	0xf66c8e56e016cf92
	.xword	0xb5a3c4b6807f5377
	.xword	0x080b1fff76d190ac
	.xword	0xa40e7020fc585f07
	.xword	0xf05a33a330ac6f9e
	.xword	0xbea2400c505d0dfb
	.xword	0x31aafae59723efaa
	.xword	0xdf20a84c14ed0d9b
	.xword	0x1386d08333166317
	.xword	0xbb41bbd0d26c9526
	.xword	0xa20532ac30ee912b
	.xword	0xe762e68aad9eba34
	.xword	0xdef49c4ebf54e1cd
	.xword	0x49a476034010772a
	.xword	0xb5019b914964687d
	.xword	0x5a644c74f4e5d99f
	.xword	0x23ebb58c08001b71
	.xword	0x7cd5b8f103c1b5fd
	.xword	0x2b8ea872a9cb6779
	.xword	0xd8b7aa2eb810d87d
	.xword	0xf8f18233a9b875d9
	.xword	0x346d8b881e57095b
	.xword	0xd59de652203156df
	.xword	0xb04495f84a547d98
	.xword	0xc0350b44217e376b
	.xword	0x1b2279666aae0272
	.xword	0xc58ce805c00a9038
	.xword	0xb1c949a79c86dcfb
	.xword	0x43b39dc8e3e4efde
	.xword	0x18e56eca37feaf09
	.xword	0x0ee88b7ad1f3482b
	.xword	0xa0826efbd9878c6d
	.xword	0x2d181154d7483e2b
	.xword	0x4072ec62da6717b1
	.xword	0xcfb531051ce16508
	.xword	0x223c208686bca69c
	.xword	0x8d303011e8d6653d
	.xword	0xc111ca61262065ac
	.xword	0x3cf9abae26da00d6
	.xword	0x5f06079235594393
	.xword	0xa8e7c0b9395251df
	.xword	0x481704308d52ae48
	.xword	0x58f0a4ee20c3dc86
	.xword	0x8d0c1bb7f1fe5138
	.xword	0x9db4033cfa2a91d3
	.xword	0xe983052b13f46416
	.xword	0x442446087e4e1963
	.xword	0xb8dd73f5e45e3c41
	.xword	0x700140913a91b387
	.xword	0x492d78b5b469d3ef
	.xword	0xdd7ab502991d32c7
	.xword	0x260907fc7d21d275
	.xword	0x8143a12136a2c05b
	.xword	0xe7367c2f690bb3ba
	.xword	0xd3aa91799ef74ea7
	.xword	0x3514dc0ea08ece8a
	.xword	0x88c6d59434a73087
	.xword	0x95eaf1c301cd6d22
	.xword	0xf791b856b868f83c
	.xword	0x400bb27b6eb61e00
	.xword	0x32efcb4513e4c16f
	.xword	0x699ee3bc1ac7305d
	.xword	0x51632b8580e022fa
	.xword	0xcae9cd56bb439d9c
	.xword	0xb909b62615a56de5
	.xword	0xb3b3fa3df876d5d6
	.xword	0xbbcd510ceacc8b75
	.xword	0x895cbab40d9fab81
	.xword	0x927e301ab5942634
	.xword	0xf35e908b993722fc
	.xword	0x9da8f89f4bdcf1d9
	.xword	0x827a6dd8e0af6629
	.xword	0x2b82ea6fd08be3b1
	.xword	0x84a7a6105fef4bf6
	.xword	0x7443fdef06255c8c
	.xword	0x7d61d58b2d89fc62
	.xword	0xda214a47ebce47b9
	.xword	0xf950ab53f88f4d53
	.xword	0x067bbc2d3e1af279
	.xword	0x14b8f749500c9761
	.xword	0x7fb966cdb5aed474
	.xword	0x2d579897505db539
	.xword	0x6831046435188d01
	.xword	0x545ed419e71c699a
	.xword	0xbdd1961a0e4a4cbb
	.xword	0xa665f497ea4faf4c
	.xword	0x479e085eeefa6759
	.xword	0x95ae4ae506362d41
	.xword	0xe8d6164cddb0a5e2
	.xword	0x43a6a31a114e663f
	.xword	0xeadd2dc4811f661c
	.xword	0xd7077400aa1d2c8d
	.xword	0x66167b9c6df18d79
	.xword	0x812384d01ada55c1
	.xword	0x813c41e6a8c58e32
	.xword	0x931457e4e5f4455c
	.xword	0x0a02ccba2235af25
	.xword	0x517633295f0359e0
	.xword	0x4f41e4fc05770be9
	.xword	0x30c3201acbc75f68
	.xword	0x714e39cfc0541ab1
	.align 0x4000
	.data
data_start_2:

	.xword	0xa84addbd4084d041
	.xword	0xac511bf23dbd5b50
	.xword	0xe78a6ab95e025ee6
	.xword	0x6d1766b60dc6d779
	.xword	0x10008d70192acd41
	.xword	0x1f4371f3a2216a7b
	.xword	0xe6b72d0f964880e8
	.xword	0xdbb234c29983a021
	.xword	0x445602a5c48aad5b
	.xword	0x8a4caa094e8e9757
	.xword	0xe59b86a4ff3281a7
	.xword	0xeb2ad1a4b7318e3d
	.xword	0x847eb17bf181dad3
	.xword	0xe0e9408eb9daf57d
	.xword	0xd901777b8d6d3cc9
	.xword	0xb08098db2d011f0e
	.xword	0xe53cf97b37e945bf
	.xword	0x6587f5ec05414a92
	.xword	0x2b6182d4148023ee
	.xword	0x8fdd869490698627
	.xword	0xce9364bf57161d43
	.xword	0x625d2a9ca7f7c705
	.xword	0x5aee044b1abc688f
	.xword	0xf1961cdbe7a76a7e
	.xword	0x4161748788a2c22a
	.xword	0x12747e8963a3d982
	.xword	0x4f3f4396dd46dfb6
	.xword	0xb8136e48be511392
	.xword	0xf3374527cd15c12c
	.xword	0xd61b731b538ebf20
	.xword	0x9308f55779df6502
	.xword	0x5321d270d338e15c
	.xword	0x886d2d846509a5d5
	.xword	0x449425db28686240
	.xword	0x454b57fb98c68b21
	.xword	0x050274244cb3f7cf
	.xword	0xc1fddff0065fff17
	.xword	0x628c3737d2e2b854
	.xword	0xab512cca79ff5f6f
	.xword	0x0a3c111789d19c76
	.xword	0x495e68bcf149d9dc
	.xword	0xb0bf1eb3bcfe22dc
	.xword	0xcc8aa89cd0b175fc
	.xword	0x415b551edfa05987
	.xword	0xabf83c4294211a66
	.xword	0x335fd9162d27511b
	.xword	0x0d059247c39c2fd2
	.xword	0x36a4672e515f0e18
	.xword	0x437fed7feaf39ed8
	.xword	0xba7ce7f83d9a0a4e
	.xword	0xc51af9151d724d19
	.xword	0x613f9a7791e7663b
	.xword	0x7dc4f612d30f2fb1
	.xword	0x5bdf243d2c955591
	.xword	0xc31716ddf080a6fb
	.xword	0xfd3406d90b9f13de
	.xword	0x507e9e4302ea70c6
	.xword	0x2cce28ee5d484d8b
	.xword	0x8c91d4d1fee6d145
	.xword	0x7b1e643ffac0bdb4
	.xword	0xa9778e3c07582d40
	.xword	0xb4baceb952c6b0a9
	.xword	0x2c69fab0dd492b3d
	.xword	0xe8cd5d4c0ac7e097
	.xword	0x79504952f2b279b6
	.xword	0xf062187ec9ee62b2
	.xword	0x589e9a97900fb4e2
	.xword	0xec6d2e321fab9340
	.xword	0x599b05e39b7edd4e
	.xword	0x3a9d446af8525311
	.xword	0xd2046ec7394f5e75
	.xword	0x2c873dba6e28eff3
	.xword	0x8a6ccece1004fe99
	.xword	0x3925dd6d9471ef73
	.xword	0xb96d09bb436571af
	.xword	0x6feacfda12b8d508
	.xword	0x45c990b89eb8f722
	.xword	0xdcab34a9bcaa0e25
	.xword	0x7aa2d3f22625110c
	.xword	0x0443081e72f53784
	.xword	0x9814275b09054a8e
	.xword	0x2745b1852eda299d
	.xword	0x523d85cb3d7a041f
	.xword	0x1869bb38114933ba
	.xword	0xa545d51056fabea6
	.xword	0x70e9bcb2eb39b521
	.xword	0xe273222812f0e4bf
	.xword	0x8ad7b145992fbf86
	.xword	0x9842ca92cc46aa0d
	.xword	0x3fbb5d6fb511f7a2
	.xword	0xba2b82ab53375d9c
	.xword	0x7583cdd9f5e744bd
	.xword	0xc503a7e70273b9ff
	.xword	0x56864d6ded7ceca5
	.xword	0x539bf26b6bea2fbc
	.xword	0xd272b1efa3ccc73e
	.xword	0xcac897550eeb844b
	.xword	0x91862b0b1a961f21
	.xword	0x717f21419d1eb316
	.xword	0x350284b086406195
	.xword	0xf85bed51a4099e18
	.xword	0x2128bdc8fc02d92b
	.xword	0x539fa90635213e00
	.xword	0xb74070fae9a3faa3
	.xword	0x6cfc4bd65569b7c6
	.xword	0x685b5214e8cd288e
	.xword	0x2ab5b1017386d780
	.xword	0xab807856165732b7
	.xword	0xc941d4290e1a9d32
	.xword	0x53f8e96c332121ec
	.xword	0x7dc80d2cbb754080
	.xword	0xbc3537870a9af5dc
	.xword	0x791637ed713ae7ec
	.xword	0x1306d8b8b3fb0c2c
	.xword	0x6b531e315fefdbcc
	.xword	0x1b16607bc8e71a4c
	.xword	0x31b1f55d2c37803b
	.xword	0xf1db30a214e657ba
	.xword	0xb7c28606103cf177
	.xword	0x57618494a31be6e3
	.xword	0x8ee35e83cd390fab
	.xword	0x7c24589207327a6c
	.xword	0xa5efacbd6512a7af
	.xword	0xe306384323f37ca1
	.xword	0x3e763d297890c841
	.xword	0xd5f0c7358f8ad399
	.xword	0xcced8099797c780f
	.xword	0x41bc7b0da08b3c96
	.xword	0xe5183b5987af1642
	.xword	0x1ce06f3a7e6817ad
	.xword	0x5da8025c6d2af310
	.xword	0x6b4eea33dc371f48
	.xword	0xde1a94bd34c4953a
	.xword	0xca65a55550cfed5b
	.xword	0x636ff28d131f70cf
	.xword	0x074716a0c47d4f2a
	.xword	0xcd069c4cab9fc007
	.xword	0x8ce773065f186586
	.xword	0x2d7ddd39f192f7f6
	.xword	0x95948d0d0dfa3e6e
	.xword	0x0a10545e9b0e89d4
	.xword	0xaab4f17d52236ca4
	.xword	0x99b86e84df90faeb
	.xword	0x63e987841c68bd1b
	.xword	0xf1007b683fbb2cfd
	.xword	0xc7cba821297b6b22
	.xword	0xe2f27557983903a6
	.xword	0x2eabe7a53bdcb365
	.xword	0x9666d542716ebff4
	.xword	0xdbb19f6bac2c5da5
	.xword	0xbd24a89f9c410eda
	.xword	0x990df06020d6cafd
	.xword	0x6efa4f89792f9af9
	.xword	0x948d8ca642997223
	.xword	0x63c4aa11ed9b3cbf
	.xword	0x58292e4658a2a0d0
	.xword	0x53d9da2e17bff073
	.xword	0xa295165d0256343c
	.xword	0x905ab693afd55f2e
	.xword	0x4d118f5b3fb0c0d8
	.xword	0x293427a9dc671c9c
	.xword	0xf01a7f2fb6e45c75
	.xword	0xc695356f807f9855
	.xword	0x6c62a5672d6f4723
	.xword	0xf4c075a381f2ad1e
	.xword	0xb5e7a565b828309c
	.xword	0x5c796632d79c62b2
	.xword	0x81c457d81958703b
	.xword	0xd692ba56980fbae3
	.xword	0x85ffb5f188ff0275
	.xword	0x3ad0328940d4799f
	.xword	0x018636066c07d5c3
	.xword	0x74d6e528ac49e8cb
	.xword	0xdf71ff212f2bdae0
	.xword	0x671c69843fed9a6b
	.xword	0x5975426f1f860815
	.xword	0x09761f71a1d5388a
	.xword	0xa695fbfcf3627219
	.xword	0x8d9c60c1b07ff722
	.xword	0x5713b2fe4decc635
	.xword	0xc9c477dfcea13c33
	.xword	0x136186cada9049dc
	.xword	0x0ba0fb7bce8a0143
	.xword	0x6e3d559f2339d0ba
	.xword	0xcdf74cc4532967d1
	.xword	0xafe2251122386f5f
	.xword	0xc1dead18da64d28b
	.xword	0x8baceb80baaf4c0d
	.xword	0x927e30a111b5739a
	.xword	0xf47a6d57966eb329
	.xword	0x2c3bb7a9493979b8
	.xword	0x78db7555c924e3d8
	.xword	0xd81b703e7165f7a8
	.xword	0x68ad69ce7127454b
	.xword	0x3d38f22a4f748543
	.xword	0x93bbe1dc62615de3
	.xword	0x9823513fedf0e215
	.xword	0xcf330523944bd658
	.xword	0x3436cce663ceaf02
	.xword	0x07f55e9fb28ec34b
	.xword	0xd75e8b25fe1ed8c8
	.xword	0x2ded95e160344934
	.xword	0x732206dc2bfe89a3
	.xword	0xfeea8de1b282ecc4
	.xword	0xb79321365467fd5d
	.xword	0x378348ce970d68d5
	.xword	0x7efd10229be7ee01
	.xword	0xc82008d2f24629a0
	.xword	0x877bd0ba18b8a87f
	.xword	0x54bdf3490c88ae86
	.xword	0x5dcacd1ad15bf2c7
	.xword	0x8180910abe65f6a0
	.xword	0xa4bed64b94ba2062
	.xword	0x16460c991ef83f2b
	.xword	0x69bfa6ac89497d31
	.xword	0x5ebabdde6761414f
	.xword	0x7df547f00caf798a
	.xword	0x065be27bf16302d5
	.xword	0x9642582ca2a99788
	.xword	0x53fdc1f3664ec2cb
	.xword	0xd55fc5be4f29215f
	.xword	0x594520c88cf614b5
	.xword	0xed027921960f28fa
	.xword	0xa718971814057bbb
	.xword	0xaf8713ae43fd2362
	.xword	0x5e2f1da9a64d4378
	.xword	0xf1f69f452be10e39
	.xword	0x6dfd4fd40ab86526
	.xword	0xae3cf9e4234c1fd8
	.xword	0x00cb7e480dfb24e9
	.xword	0x4ca81a98be06c6f6
	.xword	0x7c893e79be6b0364
	.xword	0xed4f32dcd8ed3fd0
	.xword	0xf8cc8c23a6bb6262
	.xword	0xb97cd1128311426d
	.xword	0x04da8fdd39bc8821
	.xword	0x691b346c435ea703
	.xword	0x35992e329159d804
	.xword	0x2c8454b73bb35cca
	.xword	0xf709e30ae4e66efc
	.xword	0x50eb9aeb0850bd52
	.xword	0x94f8ae547f90230a
	.xword	0xf66389e199b1adcb
	.xword	0x739e5e92051ed471
	.xword	0xb9274a64e48f03f3
	.xword	0x8fda9ecc649a372d
	.xword	0x7b008e699ddd38c8
	.xword	0xe1f3af3021b53b32
	.xword	0x30f62f5818b5b659
	.xword	0x1ab9458a75907134
	.xword	0xaf280b00044b1de5
	.xword	0x8be5d0cae41fa4cf
	.xword	0xdb5959c604e7bace
	.xword	0x6b71edeac31047ed
	.xword	0xf14667dc7a975d9c
	.xword	0x1984098868c024ef
	.align 0x8000
	.data
data_start_3:

	.xword	0x9808d0ae515e3465
	.xword	0x8fac20c3eb817aeb
	.xword	0x421bd7fe5a39e913
	.xword	0x23084e2577c504e0
	.xword	0x0f386f81232d3804
	.xword	0xdc9d91be266051ed
	.xword	0x11c66c23e6ce400a
	.xword	0xdfb190c10e6154a7
	.xword	0xd50e9771525c54f1
	.xword	0xf7bf8624326b1111
	.xword	0x30db7d2c7c31b6e4
	.xword	0x8722a923fe2f2e72
	.xword	0x196e7791820eceb4
	.xword	0x4fd5577796fb4a40
	.xword	0x644394fd984c8426
	.xword	0x94296a4a3cb02f8d
	.xword	0x169f728943c6c8cb
	.xword	0x175d96f84506f6fb
	.xword	0xf5bd198493221b76
	.xword	0x089276fe426e91e9
	.xword	0x6856f708c4f301ad
	.xword	0x89a6cce0b79a1765
	.xword	0x3af1b1660e2f3d0d
	.xword	0x243308f10988f4bf
	.xword	0x73dbf5159c2c2535
	.xword	0x502f23fbdfdc27ff
	.xword	0xb1b00230a21ee10b
	.xword	0x1f2d980694390c3f
	.xword	0x38428e869ec59af8
	.xword	0xf260ff28aab32f0c
	.xword	0x9bdbed022ff48ef0
	.xword	0xedc9c0ebdbc30717
	.xword	0x3b542ca0488c7aae
	.xword	0xb4de47315bbdaa5f
	.xword	0xce5b430d9a1b6126
	.xword	0xf3172e633b7387c9
	.xword	0xdfde55cef2434799
	.xword	0x83142775ff95884b
	.xword	0xd57ba4d1238597a1
	.xword	0x3ebfc6f938b17120
	.xword	0x0fde251235516504
	.xword	0xa95b8955057397da
	.xword	0x914f80bdd169e2f8
	.xword	0xa0cbc2b4a239f987
	.xword	0x7a127d42b3d3ff78
	.xword	0xee9bc293f5a744db
	.xword	0xe590fc9146a20fa5
	.xword	0xdd0cb13d3d9c14e0
	.xword	0xb991d50586d36298
	.xword	0x63d6e2958c10916e
	.xword	0x72c8dfcde9d98f4f
	.xword	0x47b7736138847820
	.xword	0x649bf85e63822d2f
	.xword	0xa11aba5a552c5160
	.xword	0x7de72a99b465d332
	.xword	0xa9936bcc59a0c1bd
	.xword	0xc24b8061400e1cdc
	.xword	0x952cbe5bc375d4b1
	.xword	0xeae7b0f9bbd45925
	.xword	0xf9ddd0025a2be4fb
	.xword	0xdd37d2337d587b4d
	.xword	0xcac963a4e318846d
	.xword	0x1919a990e8f1a70a
	.xword	0x6f0bf5cb3c975bac
	.xword	0xf14ecbcedca9c976
	.xword	0x2996a85083c36243
	.xword	0x47623aaa11462dc7
	.xword	0xb6de824cc3c74d0b
	.xword	0x3cff52c427b4700a
	.xword	0x6a4707bd49f2f247
	.xword	0x5d7b92b9f55c93f2
	.xword	0xe4c75ee9c456a006
	.xword	0xdb904e34e56e1d7f
	.xword	0x7702769e0246df68
	.xword	0xd7da32c8ac53049c
	.xword	0x3761ac83a4c32be2
	.xword	0xd1990518669dd6ed
	.xword	0xb543c7a8408c0680
	.xword	0x9fd8f72ebbde40e0
	.xword	0xc89e8a32b6f63913
	.xword	0x2b65e605a5ab8b93
	.xword	0x434db0115ab40f2f
	.xword	0x4206166702f0bc5a
	.xword	0x8f78ad95c7597bc6
	.xword	0x9b5535a98c7231ca
	.xword	0x840de153d817afb9
	.xword	0xa9684c33ddda37e0
	.xword	0x1dbafea5def8ce14
	.xword	0xb1b1d281c368617e
	.xword	0x57a0159cdbf1b557
	.xword	0x77a057f6b49e84d3
	.xword	0x0c38af0869e91ab4
	.xword	0x8fbc677f6c39a2fb
	.xword	0x1f51992deeac213f
	.xword	0xbd1df7e51f09576d
	.xword	0xea9acf50bf3a3613
	.xword	0x122f4d2ec592aa7c
	.xword	0x7d8dea2ef9f27652
	.xword	0x23ee3dbc01327dd0
	.xword	0xeb29045d6faaa64b
	.xword	0x5f16cf4128f5fff4
	.xword	0x43cb08baf32e7c8a
	.xword	0xeb7325ba42378c9a
	.xword	0xf687912d6ae52dbc
	.xword	0x8ac075c543ee1368
	.xword	0xb2255f04ec13c613
	.xword	0x52a977ab20cc2b23
	.xword	0xee84fc41f940ee56
	.xword	0x350f07d8ebebb857
	.xword	0xecdcc27ce6f43a09
	.xword	0x2a1131ca211b024e
	.xword	0x0b5ec171e01ef516
	.xword	0xb91e908a891eccef
	.xword	0x14e56c6025af9539
	.xword	0x7089d5c2a87c7921
	.xword	0xbc812b8fda2ca633
	.xword	0x00d04edbdb7b4845
	.xword	0x3da44af7e56e80a0
	.xword	0x78806fdb0ef1ae8c
	.xword	0xfa300c60f6de2126
	.xword	0x03f6512901ee8880
	.xword	0xb7d6c6e3cf68cfbf
	.xword	0xcb222553b46f0f32
	.xword	0x609428d5040697d0
	.xword	0x8a8fd81cf6180990
	.xword	0xc1e677993e0a7ea8
	.xword	0x63999d41cece6405
	.xword	0x4d81dd7dc3eaf927
	.xword	0x0d145b589d4eb197
	.xword	0xb5ec3d07df57cbad
	.xword	0x8f4d6a9458407340
	.xword	0xc701048d367e8668
	.xword	0x569748fc1abb5247
	.xword	0xa8275d3de2a5a405
	.xword	0xd3a47c1f711433b9
	.xword	0x74c78dee040d0ec8
	.xword	0x946f976990908137
	.xword	0x5ab1bcbf2dfc80b6
	.xword	0x167a7cf91b148569
	.xword	0x61e438d80ba9a7fe
	.xword	0x7b8c466d619275cd
	.xword	0xcb0c52e43601b6b5
	.xword	0x934790db1c61ad7a
	.xword	0x6d22786db3a9ec50
	.xword	0x7395d836748af3bb
	.xword	0x98e204b8f622f70d
	.xword	0x59ce0bd71ba11303
	.xword	0xe1b9ee3625c87583
	.xword	0xb8b63b1f7211caa7
	.xword	0x8663066661b254db
	.xword	0xd844ce2ff65e1066
	.xword	0xc8bbdba740a0b48e
	.xword	0x684a44f68cdc7e8c
	.xword	0x9b9dcad970ca3086
	.xword	0xd034b94ed3ddb441
	.xword	0xeb68d22456419673
	.xword	0xace81b533d58cb2e
	.xword	0xa40c3d70711cffb0
	.xword	0xeffad528525e3d49
	.xword	0x74647c371ad280f7
	.xword	0x10f29fa6914a02cf
	.xword	0x619daa36f2794cc6
	.xword	0xd79a508182797b4f
	.xword	0x9d07de06f8aac239
	.xword	0x8fd1ddecb15b2fce
	.xword	0xb615403839786dc9
	.xword	0x4cc1889ea1599112
	.xword	0x7ba5d8649f0c6131
	.xword	0xb841bc4a111ae4e2
	.xword	0x424db97044bde42f
	.xword	0x6ab11b9857f4e9d9
	.xword	0x854720c6257c5da1
	.xword	0x223a53dab12b9f59
	.xword	0x78de9a688c3c881b
	.xword	0x2e2a89df65f6f260
	.xword	0xe395bf4f5f685af1
	.xword	0x664ce1026f1c9af7
	.xword	0x0a080a30fc28faf9
	.xword	0x33ecc2301c5be390
	.xword	0xf04937ab54e5d409
	.xword	0x857750af47685028
	.xword	0x321e6f05bbfab608
	.xword	0x21ae785b85381b99
	.xword	0xfab91bec757b13d3
	.xword	0xebcafab9f2392409
	.xword	0x3fe68137e306560c
	.xword	0x1be5b3dd2fa8d401
	.xword	0x50038af25d184790
	.xword	0x8dce940dd6cf3b21
	.xword	0x87e039afa8a9fd44
	.xword	0xb35c42dbbf1110c8
	.xword	0x2c0e82d5326e2331
	.xword	0x51f6169f9e21df16
	.xword	0x86f60ee16fbd0afc
	.xword	0x2a80cca0fe426791
	.xword	0xa955f88b442f990c
	.xword	0x04e8b4addce2ff5b
	.xword	0x74357ba42e4ead66
	.xword	0x4dfd33f5159e25b8
	.xword	0x0b06450c5488c267
	.xword	0x069af9590bf130c1
	.xword	0x3e8210a2dc4bfeeb
	.xword	0xd654e65d23ed0c67
	.xword	0x6ed7663cc667b503
	.xword	0x5cb4613cef4a4045
	.xword	0xda36ad921935c4ab
	.xword	0x5dcf4def875b4def
	.xword	0x0da1817c730755d1
	.xword	0xe4c558609c70b093
	.xword	0x93b8968f34b76b2a
	.xword	0x11cca986bb3fcbf3
	.xword	0x74f86f284beff991
	.xword	0x5aca1b8debb076ba
	.xword	0xf37ab7f66b1c0a84
	.xword	0x8c590d89cece2b11
	.xword	0x8c133926cea308b3
	.xword	0xbe3269a30cd8a0bd
	.xword	0x6f43af8ca3801a4a
	.xword	0xcecf4f778bbc61ea
	.xword	0x61f0bee833ba1d5f
	.xword	0xc9b1f4b261a19b01
	.xword	0x4489f145425c9ba5
	.xword	0x2f4684c83528b91c
	.xword	0x031b08145b4ca793
	.xword	0x0f7dfc039728a4ec
	.xword	0xe1ede2bf3e60424c
	.xword	0x25be2258c0971f5b
	.xword	0x2325b9b8bfdcc053
	.xword	0x835dcdf20724986a
	.xword	0x11ac2cd8d5465b37
	.xword	0x7d29129df51234f0
	.xword	0x57784264382ed8ea
	.xword	0x330d8e802e038469
	.xword	0xe7a705eed4cc5329
	.xword	0xf94b79cccb9068cf
	.xword	0x53c630d66dd02ebc
	.xword	0x4827aba882ee35f4
	.xword	0x5d7e0bb892c592b8
	.xword	0x89842680a3def111
	.xword	0xa70b079c8e633e50
	.xword	0x2cc44239cd9e248d
	.xword	0x7bc26c52ca69a820
	.xword	0x905d65901ca89f45
	.xword	0x957db1447d9165ce
	.xword	0x8b708ce25ef5d262
	.xword	0x0048603abc7a999f
	.xword	0xe604542579f29436
	.xword	0x1ed435984024cc15
	.xword	0xaf4b4c59f414227f
	.xword	0x7cf2a531d3c986eb
	.xword	0xbe33cd41ae476873
	.xword	0x785668f625738543
	.xword	0x6cb72996a4308151
	.xword	0x43846cddef82ecb5
	.xword	0x8dc238e4e219531b
	.xword	0xe7137249fdd10994
	.align 0x10000
	.data
data_start_4:

	.xword	0x1a7caedf3df7131c
	.xword	0x2da828fdc2c9d3dc
	.xword	0x82ccdcd05f5b13aa
	.xword	0x59546d6409fd7a02
	.xword	0x2e9238ea34bff773
	.xword	0xd08bac639576412b
	.xword	0x6502adf776ef97db
	.xword	0x6a7fd0c3183eb935
	.xword	0x7765b2db020046eb
	.xword	0xd0268de74a6cd0ad
	.xword	0xc00c9896bc1b65f1
	.xword	0xfb6aadb92ce6de09
	.xword	0xd6a4125e8c67e79c
	.xword	0x9c915972a87b006d
	.xword	0xb97517357fd7b6cb
	.xword	0xa87016e11d28cd72
	.xword	0xce2942b93dd483e4
	.xword	0xe77d89fd4f583618
	.xword	0x9adaa12b6bfecd75
	.xword	0x2046699f59c60ffe
	.xword	0x9c4f8c973511c418
	.xword	0x8820e7a1e76286d4
	.xword	0x1f44c3aad5114d51
	.xword	0x09e1bdbb683ff885
	.xword	0xea6ab2ee44fd51eb
	.xword	0x01082c94f7dc1f8c
	.xword	0xae4af8c50d87eded
	.xword	0x0dbcecde1bf9c4ca
	.xword	0x0cf48d72bdda8732
	.xword	0x175b2c2dbc504275
	.xword	0xc74b703c08cc3be5
	.xword	0x5515f950ef26ced1
	.xword	0xb0a3eeb3ba5c3144
	.xword	0x9c106e26cf3fe930
	.xword	0xbfd72d2c055e7ec5
	.xword	0xe084234378074404
	.xword	0xc4a5e51af4a1d7d5
	.xword	0x2a86b9b20ab3ee9d
	.xword	0x079c57dba3444164
	.xword	0x6f721bb8b5e06ee9
	.xword	0xc6d172187221378a
	.xword	0x701901f70aae7087
	.xword	0x0702ae16fb36a262
	.xword	0x268c4982037ca441
	.xword	0x453f9ca69a919fb2
	.xword	0x237f121c4740a145
	.xword	0x648ace0726d171f6
	.xword	0xbef8137a6a636b8b
	.xword	0x575e5a844ce72a8a
	.xword	0x0b60a349084d9035
	.xword	0xd055f2def5d37f9c
	.xword	0xbab1e6b42282371c
	.xword	0xd385f8f2d7b5a3d1
	.xword	0xbec798825d2efb84
	.xword	0xa2e07d08d0ff3ade
	.xword	0xd32a891add0fd7fa
	.xword	0x9461202ff62c6416
	.xword	0x1c7745d667374b93
	.xword	0xfbd508d1cabe1d48
	.xword	0x907e5c2b04faa825
	.xword	0x5c49270f178d99b3
	.xword	0x655ca76ec287827b
	.xword	0x22bec97ca0128e1f
	.xword	0xad78e50ae2522f91
	.xword	0xf6e08d7ce2ecf157
	.xword	0xc07f15cf52b601fb
	.xword	0x4b7eb17f9aae1f16
	.xword	0xfebb04afc644aa3d
	.xword	0xbdf92486e163bffa
	.xword	0x33d24d5f73fa632e
	.xword	0xbf85b13aee353721
	.xword	0x55f7bf9fe6e38d64
	.xword	0x838abf844765c0da
	.xword	0xc22935f4066e9224
	.xword	0x4b41fbe53910a01b
	.xword	0x493b9f83f3f3f4a1
	.xword	0xf9002d607ccd8d19
	.xword	0xca497c655ab71e84
	.xword	0xaaeaeef1675d4711
	.xword	0x57a83ebf14745be2
	.xword	0x2e9674c81ac1e5cb
	.xword	0xb938953f80572c59
	.xword	0xe552abbfe8eada28
	.xword	0xb59c5022a547c692
	.xword	0x0f9ecead43a1b7d3
	.xword	0x7000c42181a5d664
	.xword	0xb26a9fc7d4b0f721
	.xword	0xc271d3ef43ffc78b
	.xword	0xb3bdbefa8d752ce9
	.xword	0xa6919eed8b9e0592
	.xword	0xa2b7043a04e05456
	.xword	0x56dc11713b3b5db5
	.xword	0x1d189cf51eb439b2
	.xword	0x5a74b872a18a35d7
	.xword	0x6b954c017f5d3d42
	.xword	0xe2d8e13b0191d77d
	.xword	0x1c30549025e030e9
	.xword	0x4158d84a7675702c
	.xword	0x9b60aca0c2429da6
	.xword	0x3f793e3571fd3ca0
	.xword	0x2009c8eea055b802
	.xword	0x4cff5ddb54f2e61d
	.xword	0x99ce9bd714755e73
	.xword	0xbdd4254fc5d44f61
	.xword	0x4b109d81e5d56588
	.xword	0x0759cdb57b8de861
	.xword	0x778f1e074522c6d8
	.xword	0x38d707c2a409b114
	.xword	0x9363116eea70d253
	.xword	0x9e98b473ba79dd55
	.xword	0x8c689dca805cde19
	.xword	0x0e4cbe906a9d4bde
	.xword	0x84cf89e929fc25cd
	.xword	0xb4c446606a194a78
	.xword	0x1224556d3f2acd9e
	.xword	0x5702ebda3dc79dbd
	.xword	0x6e7ce4aa9725cc5a
	.xword	0xfaec11c3bc53cd2a
	.xword	0xb72fc6548aaa5617
	.xword	0xbd1cd86f2d841024
	.xword	0xf54a60e8c0167167
	.xword	0x0415ba5d156e654b
	.xword	0xa20f5ff8b3f4cf88
	.xword	0x2ac9d12c9386f8f8
	.xword	0x6edbd03744ddd16d
	.xword	0xd88a927c346d2c6d
	.xword	0xb80073ecabe53468
	.xword	0xece0e28c6c979461
	.xword	0xd161009c5908bba2
	.xword	0xcdc2e411e8e730af
	.xword	0x1fd38def6e83ba8d
	.xword	0xe0bbb62b997c655c
	.xword	0x31270c7f61bd52af
	.xword	0x01b94708a7c3b1ee
	.xword	0x7cd9fe44fcd40687
	.xword	0x1cb6ee16e37dd77d
	.xword	0x6a83d7921a1a7272
	.xword	0xd0f3412f292659a0
	.xword	0x438bb51f4e73b3df
	.xword	0x90a0fdac402dfef7
	.xword	0x13f3ab0094b677dd
	.xword	0xdd84dcbef3da7e78
	.xword	0xfa774c5cdbf2c674
	.xword	0x928ce1854799bc89
	.xword	0x9557e9ef2f4f9310
	.xword	0x82df371916dbf74b
	.xword	0x38785fdc4fbf1ec6
	.xword	0xa609c893bd23a6ee
	.xword	0x37260fc2f5cb62c4
	.xword	0xec04159e974ef0d0
	.xword	0x9e448fc1ab274b51
	.xword	0xe81d26f30fadef3b
	.xword	0xc1aae77c77b92531
	.xword	0xe0a58f44408cd610
	.xword	0x54a38bc4de515e8f
	.xword	0x2da2407d343b4fb3
	.xword	0x17622366c9bf5559
	.xword	0x79b567418d62f2b7
	.xword	0xee368b10be71878c
	.xword	0xd5d41eb816cf99d8
	.xword	0x50a48284749d4d50
	.xword	0xaaa20fd730804d64
	.xword	0x0dbad896fa84765b
	.xword	0x6b3cde3e02d0eaa7
	.xword	0x7adcc20d22d7ec9b
	.xword	0xca3d0c11d2e2249a
	.xword	0xb17af4310587482a
	.xword	0x8df2df68ab684ff3
	.xword	0xe23b7893e2bda521
	.xword	0x0ab252221c745188
	.xword	0x908596c1aaaeb98b
	.xword	0xaad70e4aa3bdb8d7
	.xword	0x55fbc73aa9d154f1
	.xword	0x8c24a08f39a28c9b
	.xword	0x68fa3e51db12d9d7
	.xword	0xa2700631c1c3787c
	.xword	0xa6be1493b18e9a05
	.xword	0x417536f3ec0fff94
	.xword	0xbd62cd8b999ca1e5
	.xword	0x2a26c991b7d74070
	.xword	0x233c0bf1be94694a
	.xword	0xbe95a05dcd7b5336
	.xword	0xd10c6af423d4f6a1
	.xword	0xba6ca04450f16550
	.xword	0xb48eae13423099b1
	.xword	0x1c83ee08cbc8fdf8
	.xword	0xbb2ce9eda74b8dbd
	.xword	0xea1e53aa8afe56ed
	.xword	0xeb26cbd43e6e8806
	.xword	0xd48e7dbdbb84ad39
	.xword	0x5708b5b34bfda031
	.xword	0x7d353ad4a411aac2
	.xword	0x3e0da67ce6acd56b
	.xword	0xe1c405de503e7f1d
	.xword	0xaced5c7382ab7e6a
	.xword	0x3d9dc3a9870b087a
	.xword	0xcc98f92dd4a6d026
	.xword	0xf8f6a28451db5c41
	.xword	0xd19f459affdd0d63
	.xword	0x2d28ee02f1902100
	.xword	0xfbe502bade222bbc
	.xword	0x9c9835ae5fdbf005
	.xword	0x1cbe436a2f227511
	.xword	0x1fadcbb403104e8b
	.xword	0x1b10ce1a919cc2ee
	.xword	0x8b123c07f74c5346
	.xword	0x90b9303bc1f84f58
	.xword	0xbb94d555dcf4a8da
	.xword	0x2893ed2df4edb78c
	.xword	0x222f461ba0eff9aa
	.xword	0x7a3dbc6fcf3ced6c
	.xword	0x37b91635f4795b0f
	.xword	0x0a3dabcc4cd1e022
	.xword	0x8ecbebbdf755624c
	.xword	0x2a7d3943f44bea92
	.xword	0x29704f03e07b218f
	.xword	0x53cdefb525b7c676
	.xword	0xe590995065b0552e
	.xword	0xbe578278dec99d07
	.xword	0x9ec53defeb234b59
	.xword	0xc5c3cf9609e7b489
	.xword	0x268b0ea20c0d0dc8
	.xword	0x3e81a0181ebf0a23
	.xword	0xe6c0814a1f4c1026
	.xword	0xbc7d16545559bbeb
	.xword	0x5060dee7764a3580
	.xword	0x79c68efff066e24c
	.xword	0x7a1cd76671987ce6
	.xword	0x83afb148f19091ad
	.xword	0x263030466b8987d4
	.xword	0xc4c0fc8e2ff8b193
	.xword	0xf799a4a2ececb1c7
	.xword	0xa0240b97350a67a6
	.xword	0x540db1531c2a6324
	.xword	0x83bf46a951650234
	.xword	0x1322618d7a94408b
	.xword	0x2eadb9ed70be477a
	.xword	0xa80e746e758a9c8c
	.xword	0x45e4052ccf5973b2
	.xword	0x19ef4783ac763724
	.xword	0xa297cd3c9070eff0
	.xword	0x81df453af176d7ea
	.xword	0x4706c63c56ffc56c
	.xword	0xbf1a310338ac3433
	.xword	0x1b72c0adbe8affe6
	.xword	0xcdd00e55998c36e9
	.xword	0x3cf8bdb12921d2a9
	.xword	0x4ae5f2f3e313ac6d
	.xword	0xc4f5492da33170a4
	.xword	0x9dd83458d397dbee
	.xword	0x15515fefdb0197d7
	.xword	0xa04958bb504d8f64
	.xword	0xc8f65269cb8fd2af
	.xword	0x8f14baf02c5b54ca
	.xword	0xba28cfd4cae65202
	.xword	0x030ff297ee0dd0c0
	.align 0x20000
	.data
data_start_5:

	.xword	0x2cbfdbce2f11425e
	.xword	0x5d7fa31e870839e7
	.xword	0x873be988da3f376e
	.xword	0x070ab262266627aa
	.xword	0xe03fc82ad53a96a9
	.xword	0x129c5349893251c3
	.xword	0x4e99fba03afc46ec
	.xword	0x94f2937bf5fcf8cb
	.xword	0x219337f154134a18
	.xword	0x0fc8f78528d65ef6
	.xword	0x43f88f3e8969b396
	.xword	0xc8afab4da45e6727
	.xword	0x24f1413dcfefaab8
	.xword	0x525d086010ecab18
	.xword	0x2b6a98748aa9978c
	.xword	0x4a7a6a0a6865fd89
	.xword	0x0f00de6fb51cd20d
	.xword	0xc103d76257d4e58a
	.xword	0xcc402471a0b76c85
	.xword	0x8078bc060f3cfe9c
	.xword	0x8b376479a06cd5a3
	.xword	0xec3b9676ecdfefd9
	.xword	0xbb7a36e2f5377b2f
	.xword	0xae9312fcc220edb3
	.xword	0x5181cb28b8b8581c
	.xword	0xc63b3c45d757dc8a
	.xword	0x642ff86fc54c3402
	.xword	0x5ae44cde1c38d1a8
	.xword	0xb63b9f3efb284685
	.xword	0xa83bf43ffd96319b
	.xword	0x4b3801f24bc40325
	.xword	0x32751d5bab370843
	.xword	0xd70e7929db9187f0
	.xword	0xcf814fafc051a814
	.xword	0xa6ab195932f3b6ff
	.xword	0x2768c2375031c4f0
	.xword	0x53a97cc5f41f6b35
	.xword	0x3246d1498623deeb
	.xword	0x1fd468353da61498
	.xword	0x7d62959644a5d246
	.xword	0x9b6ae14aad617d6c
	.xword	0x0734659d803670f8
	.xword	0x9584ef94e3db81a2
	.xword	0x507e9081a5ed83f6
	.xword	0x113db67a974dc64a
	.xword	0x7cfc9be92b85ed77
	.xword	0x16ae9ef23176c4d9
	.xword	0xbb1300fc9995f3ab
	.xword	0xf9b6a61352476f4d
	.xword	0x813285f66bda086d
	.xword	0x0f9772ad5ef7c478
	.xword	0x3c9c97c2267d8671
	.xword	0x0020c02944bc0311
	.xword	0x3bde6677826f1434
	.xword	0x3e4e0a26850170b7
	.xword	0x6c3778c10dd1012e
	.xword	0x29971d67c7c81f2c
	.xword	0xc9ae49cf147b99ae
	.xword	0xef82068a6cb49d6c
	.xword	0xa1c7ea987ef8f118
	.xword	0xc0bd851697e1a799
	.xword	0xdc4839f006dc0462
	.xword	0x0656f853cd27d14d
	.xword	0x51ab32b5044de0c3
	.xword	0x3cfd28f1f7e0b630
	.xword	0x1237680b0cf332db
	.xword	0x7dcaafe9c1b33161
	.xword	0x716f9386dd07e230
	.xword	0x03632e08751b65c9
	.xword	0x2015eb6284e7e573
	.xword	0x499445bf3c4acdaa
	.xword	0x5012387d6e78c521
	.xword	0xa994c4d79f3c48d4
	.xword	0x34262d8f440fb343
	.xword	0x0d60e09362c2662b
	.xword	0xa1ac4922c81832f3
	.xword	0x0824394a08a9d468
	.xword	0x011bae2c1b2fdd12
	.xword	0xfc1e40ca0486b771
	.xword	0x3b028a4d71cd3de4
	.xword	0xc79af5ca7c96f58d
	.xword	0x6081cf16a36a34f8
	.xword	0xcad89850b0dab045
	.xword	0x2c5b0f879b003847
	.xword	0x2bce5842e7214aac
	.xword	0xcecabec7809b6a63
	.xword	0x8a860fe923420432
	.xword	0xcfd5f60d70a2520e
	.xword	0x0f96dc880756a894
	.xword	0xda2c862f4c96bbdd
	.xword	0x3abbe37a1e78485e
	.xword	0xe4cee6b33e82e7f9
	.xword	0xa766981f47777d26
	.xword	0x8c77c771f5daee0e
	.xword	0xaf1242472b18a3c3
	.xword	0xb79130853a3a89fe
	.xword	0x22c5b3cb03346605
	.xword	0x09b4077c1454b8d6
	.xword	0x964ea5d8f0a22df0
	.xword	0x655d4986f465c122
	.xword	0x0cbc7c163bd41a04
	.xword	0x3861db4a7cf4e52e
	.xword	0x3c53fd261f5097f4
	.xword	0x166b8b7311b6e1e5
	.xword	0x703e2a1d26d1988b
	.xword	0xbac7a965d05652a6
	.xword	0x5bca2e48c0bf7e87
	.xword	0x4500b17820677879
	.xword	0x21d932b058356984
	.xword	0xe82f5c22f9a55f6b
	.xword	0x8f06eedb7d9f5e53
	.xword	0x41588472981784f5
	.xword	0xfce0019c534aa185
	.xword	0x34811568b2400936
	.xword	0xe1b43a88f3ec4fde
	.xword	0xe61cdcf88d7e23a6
	.xword	0xe94210e21d0e902d
	.xword	0x73f652f91d30d3d2
	.xword	0x1f731352033d0487
	.xword	0xb3bc2583b46f08d9
	.xword	0xcd1cc13113081de2
	.xword	0x658144dcae87647a
	.xword	0xbf1d2a4619a158d3
	.xword	0x1d813f0d3daeb89b
	.xword	0xa55f8c142d88381c
	.xword	0xe8e7a22e717bada5
	.xword	0x1f13a696501f803e
	.xword	0x76e5c09a232a4530
	.xword	0x6f5b97e1c0f5ce79
	.xword	0x25847b8ce1f673d7
	.xword	0x36d173e461f0157d
	.xword	0xc150d272ca0572af
	.xword	0xb411dfeaf123f917
	.xword	0x3a15307ee89c0663
	.xword	0x2ec6166d0504776c
	.xword	0x51f0d8dfce5f4393
	.xword	0xf2861de4df83a642
	.xword	0xcc76a7b355fcfb23
	.xword	0x3dc008a10cea1f5a
	.xword	0x21b7aafaf75d82b7
	.xword	0x27308856632d9be4
	.xword	0x2e25b9113bbcb12b
	.xword	0xa444bb31ce415d6f
	.xword	0x6567b11a3515a930
	.xword	0x2f98e5fe00ed36da
	.xword	0x03cbb19176c2061b
	.xword	0x87f2129c79d0ab69
	.xword	0xc56c8228ba425335
	.xword	0x3f1440cfa530fb9b
	.xword	0x81fb5d9e7a2a6535
	.xword	0xc1ca91e4ec1af22c
	.xword	0x9be868879bf3383e
	.xword	0x170a57ee3204d30a
	.xword	0xf8f6ba6b37430799
	.xword	0x3d3f9b5a2cf2e309
	.xword	0x527902bda3eccee3
	.xword	0x86547cfee6a470a5
	.xword	0xbc3b9c68d2da75dc
	.xword	0x1e128050df3cd219
	.xword	0xf3f2b2833fc139a2
	.xword	0x8069b47a1690776e
	.xword	0x67c8c39b3a593be4
	.xword	0xb38f049551e1ac61
	.xword	0x28fb810d9c01506f
	.xword	0xacf7679ca8edbe40
	.xword	0xeddd8594e4e9fe6a
	.xword	0x870d14387e88a7d2
	.xword	0x0d85ea702f00fbc9
	.xword	0x1ff2c60442ac776f
	.xword	0x117a41b6d23ce7cc
	.xword	0xb9db31259aaf40bf
	.xword	0xae85a59e5dcf16a1
	.xword	0x9b7ac2b10d24dad4
	.xword	0xb36ccb8ffccca2ae
	.xword	0x5a7ad233f483aade
	.xword	0x327a491f7035c4cb
	.xword	0xde32c219cca6d28a
	.xword	0x5fb920e28478822b
	.xword	0x585b09891410db74
	.xword	0x7c0b16489d8e664f
	.xword	0x06d607b0e2277ab2
	.xword	0x75425edb816a5e96
	.xword	0xc453d838f862d96a
	.xword	0x17481df8bf507984
	.xword	0x16d4d06484d01acf
	.xword	0x1778a8f253c066ab
	.xword	0x0d77e58a39e241bc
	.xword	0x533b6078d7e7b8bc
	.xword	0x9f2ae259acf74a14
	.xword	0x10c62b4e2f40f94e
	.xword	0x7981aeab08d04e0d
	.xword	0x6dda2e7d9f2ca75f
	.xword	0x7aa7b3d46782ab3f
	.xword	0xfc00bb84795f6bb5
	.xword	0x1d91d6667f21f692
	.xword	0xa134a22a1399d1fc
	.xword	0xf02fabc7729cc4bb
	.xword	0x474395397120ad5d
	.xword	0x70fb8036a2847785
	.xword	0x8fb713468672a460
	.xword	0x78089ba7c80ada42
	.xword	0x52a302e20d2d6c99
	.xword	0x7adca41669db1de6
	.xword	0x9d87edf8b2fa3bcc
	.xword	0x830568b19cdc235d
	.xword	0x9785939d0d2b1a07
	.xword	0x606c306eac179520
	.xword	0x4b8ab7a594951b98
	.xword	0xb1de220af10b3000
	.xword	0x0ef3f9f756f2da7d
	.xword	0x3e515ba1b3cd77e8
	.xword	0x457ffd500cc964c4
	.xword	0xec42642003bd17a4
	.xword	0xc93efe3133a4748c
	.xword	0xbd6c4c967eed4e88
	.xword	0x504564035e594435
	.xword	0xcd248410336f418b
	.xword	0x2c8a99d5eaeb6e33
	.xword	0xbc784d16b18c5290
	.xword	0x4aa772fb86b8c52a
	.xword	0x4f21cccbc8ff3c87
	.xword	0x13bb27610a262036
	.xword	0x2e1a90c95e5d0d59
	.xword	0x74339b80dbd6482e
	.xword	0x765d52527a87430f
	.xword	0xcfa81fc4174aa9a0
	.xword	0x47a7476a8143513c
	.xword	0x7f9197c0d05e4e76
	.xword	0x642d9c4481bfcab0
	.xword	0x75ed7256b8e9b7a0
	.xword	0x6baaeda48ea7c7ed
	.xword	0x2e00c893f3e5d829
	.xword	0x46c7fd4d72d06038
	.xword	0xb910c50c0cd0d7e8
	.xword	0x12ce0677f4b84e7c
	.xword	0xd09cf030a1a8d050
	.xword	0xbeef52607fc60789
	.xword	0x3e9a6a652639513d
	.xword	0x86025bed8a803d37
	.xword	0xf4a64487d1281a20
	.xword	0x2f2bacc80dce9d11
	.xword	0x63473c9f65e6f7f3
	.xword	0x2735aab36bc774a3
	.xword	0x89efc1c8c90bf776
	.xword	0x097528a8dafa2606
	.xword	0xec84c5c7f5a1013e
	.xword	0xe85668f086ba2302
	.xword	0x43e243a06f4e3650
	.xword	0x396f5ad221a5a6eb
	.xword	0xa317efb21ebd2cf8
	.xword	0x58d60723d459048c
	.xword	0x6b623811efd64977
	.xword	0xadcd99b28626f0e7
	.xword	0x67d1f7a18446c983
	.xword	0x632c7e5a7a5bfeef
	.xword	0x7f1571a84d80ad9b
	.align 0x40000
	.data
data_start_6:

	.xword	0x39507c9e5d33022f
	.xword	0x613382b317cc47fa
	.xword	0xa40c16bbf0a1b33e
	.xword	0xba0081a4fb5ebb86
	.xword	0x56d447b60d320e16
	.xword	0x6584fe5e7a84ef7c
	.xword	0x162f05a2a4672f5c
	.xword	0x8864006f8cb04ee3
	.xword	0xc925760ef011a83f
	.xword	0x9bdd5c7951e31692
	.xword	0x1c9ad459c6effc66
	.xword	0xe1202b29f9a896f7
	.xword	0x5c28be4d1aae521d
	.xword	0xb5b858dc057e8ae0
	.xword	0x3fa9bdd0c4079c96
	.xword	0x58fe9bf708bdd474
	.xword	0xd136380abaa720cd
	.xword	0xb3383a5e3bef733f
	.xword	0xecfca0f8456e9168
	.xword	0x1d2f81c170df3511
	.xword	0x16f601bd0f3839bd
	.xword	0x0b3775612c808d36
	.xword	0x7be43124375ad9a0
	.xword	0xc398841885f22415
	.xword	0x4111f6d07feae07d
	.xword	0xbce06cd44a1615d1
	.xword	0x9ca338cfc1169793
	.xword	0xa9ab058b4d023ba1
	.xword	0x4eee57185ccec5fd
	.xword	0x95e0f3b626f62b63
	.xword	0x08415a66b10a60a7
	.xword	0x58540f05e66728bc
	.xword	0x7f3f6f33c4c5dd72
	.xword	0x23998d582f96b10c
	.xword	0x752ec1f5a96c6b6e
	.xword	0x099f746781361dd8
	.xword	0x6fa9266fa7da41c9
	.xword	0xba62309067b84b41
	.xword	0xbc3a3d06c6c07fb3
	.xword	0xfea72e9858fe3a7d
	.xword	0x46325b2037921a5a
	.xword	0x12d6ae61680bba82
	.xword	0x0db1a4da8e028632
	.xword	0x583ee3ea1e1f0656
	.xword	0x32905e935b660242
	.xword	0x124e39c9fa893a3e
	.xword	0xac8c3047df7df1ed
	.xword	0xa4eeb261be428bc4
	.xword	0xe2b75e53cd3d2e57
	.xword	0xe99832bb3a0f5600
	.xword	0x52c603aa71a5535f
	.xword	0x8d2a7f26e4cb178f
	.xword	0x7cffe00ce18ea1cf
	.xword	0xb147aa7248a8df6d
	.xword	0xf0dfeb39400155a4
	.xword	0xc99f64113e81068b
	.xword	0x5d00f67e34e4a6a9
	.xword	0xdf6922c7b1a1c711
	.xword	0xdd3ecb7831d8ed56
	.xword	0x7bf9b2dc4b060dac
	.xword	0x353176c34015aac2
	.xword	0x9a98e6a54d36f858
	.xword	0x7f15bbf2b82eecf7
	.xword	0x4bb73db61dfaa6c4
	.xword	0x9b40947f7f95be52
	.xword	0x08b3d15dace6360d
	.xword	0x9948567940fc8627
	.xword	0x1f51b45b645873c3
	.xword	0x4559c0e6b53e482c
	.xword	0xa6c45b69af8b7cc3
	.xword	0x6bdb99aa0da9ebba
	.xword	0xb5ea8d3267c30917
	.xword	0x856a8eab47768d08
	.xword	0x55768a7abef4cf29
	.xword	0x947f9af718fb2c47
	.xword	0x347a82cfeb10d04a
	.xword	0xe7b2f6d86be48d62
	.xword	0x067d2fde0d34d412
	.xword	0x98810a5cbb3d41e8
	.xword	0xc3b1de1d0c4fb3a3
	.xword	0x9a09a5274d9dbc0a
	.xword	0x89aa8302d0f1b4ec
	.xword	0xd1db42bab18c95d1
	.xword	0xc515b2be8819d658
	.xword	0xb5bcac6faddbc85c
	.xword	0xaf04d06c970e24ed
	.xword	0x5f9ecd385f25d239
	.xword	0xa88d1b7620e518bd
	.xword	0x899b7cb692f27e98
	.xword	0x2d472ef5384c0736
	.xword	0x7bb98fae2bfc30c3
	.xword	0x014216a20811e2dc
	.xword	0x3dff8af8c05039cb
	.xword	0xc05f4149ea05e48b
	.xword	0xb52492826736aa27
	.xword	0xdbb8326a3015d274
	.xword	0x522fedb4b94572b4
	.xword	0x293d733684b7517c
	.xword	0x9404b39df31ec1fe
	.xword	0x9f5f342af791b009
	.xword	0x0e8939e17ec02acb
	.xword	0x3361de6540c37924
	.xword	0x91a6cd3616962ab0
	.xword	0x4cdc95942c902398
	.xword	0x69209d2c46bc1f2e
	.xword	0x73c32651c31d0361
	.xword	0xa4a45a32848bd9ed
	.xword	0x942392e539ae97e3
	.xword	0x02dd04bd80b66bb1
	.xword	0xfd0109bfcbfb5f18
	.xword	0xbf80aa38e68ff4be
	.xword	0xdc4dec5e3b689f36
	.xword	0xbc42c6b01bbaeb4c
	.xword	0x250258b752e50ea3
	.xword	0xf2a0414f0aa048f0
	.xword	0x7e69e3b3afe01c77
	.xword	0x9fb68b7979156e1a
	.xword	0xd642382de18003c2
	.xword	0x413067f7b4a27aca
	.xword	0x9b64ca65e16d5899
	.xword	0x4586f78121b382eb
	.xword	0xd929bb4817f82755
	.xword	0x56dd8d5e4f584013
	.xword	0x3a0a7d3089434cbf
	.xword	0x413e7924750270c2
	.xword	0xde29d6e4a8cda067
	.xword	0x1a92e559a82c9d8b
	.xword	0xcc76555bd00464d3
	.xword	0xc609a5ccd73b9682
	.xword	0x7a9ce37523e69df1
	.xword	0x3b7df61ab9ad1d54
	.xword	0x1135274d9734fee2
	.xword	0x84ef8a51e191c76c
	.xword	0xd368121b461bc615
	.xword	0xdb7865f435b98ef6
	.xword	0x31104567f908c69a
	.xword	0x1e585d2a6493bffa
	.xword	0x7615f96516982d8b
	.xword	0x56edf263004b57e1
	.xword	0x9111931ce8d26010
	.xword	0x57a69939baefdd8c
	.xword	0x80ea0e520695fd91
	.xword	0x38b675d226871456
	.xword	0xfeb0152da665738f
	.xword	0x9da8964c5cc18561
	.xword	0x00b39025c0ae7b1a
	.xword	0xe2ba08a119abcacb
	.xword	0x173cd8be7c75e017
	.xword	0xa99b46da4d4f692f
	.xword	0x75b96870a7de2037
	.xword	0x4fdb41a4715b017c
	.xword	0x16e607cb2594c774
	.xword	0x2ba9bb4da9b20a89
	.xword	0x261d762e0230ad68
	.xword	0xa14b5c4a7b05f06f
	.xword	0x15fd41762a8e49d0
	.xword	0x575cdca930f2edfc
	.xword	0xfb9b6e3b28b539fd
	.xword	0x39ace7664e45e062
	.xword	0xe6ddc14c036e2695
	.xword	0x68aa7c0860ebea31
	.xword	0xea42fcbedc5ec4b9
	.xword	0x6981e89fa8495417
	.xword	0x7bcf24e7d3f6843a
	.xword	0x7c4d71fd9636df3f
	.xword	0x619a763c59545ed8
	.xword	0xa2b53da574944cb5
	.xword	0xf5d1c78fdc96c9f2
	.xword	0xadb52ef9c38c0e08
	.xword	0xd48d51e3706375ad
	.xword	0x8267f023713c1b6c
	.xword	0x000d8e9d30d65692
	.xword	0xba9e34896b0cb90a
	.xword	0x7baae14e2e718ad2
	.xword	0x09992a64ba88c402
	.xword	0x0b641a1ac0026a20
	.xword	0xb93bb43f884b174a
	.xword	0xc257c548408a7305
	.xword	0x7e49ea3dcce67e46
	.xword	0x6b1c5b33cf66ba6a
	.xword	0xb69ed6c94ef47f4c
	.xword	0xb4707ab5363a9c05
	.xword	0xf3e00417ef74ab3c
	.xword	0x5f4eb8652fe485c2
	.xword	0xe5a424826e94caf9
	.xword	0x199c6deed4b5f1e2
	.xword	0xbd73c30c6788cc12
	.xword	0xc498b5cd7cebf27f
	.xword	0xa1077c71f511c396
	.xword	0xb02b4c38b28c258c
	.xword	0xad0c61f2832cba1c
	.xword	0xb2c1af1e0931320e
	.xword	0xd4d7f76dba67701b
	.xword	0x6d7a3800310d209f
	.xword	0x2631697ee9062b71
	.xword	0x932599e26f27f5ec
	.xword	0x41d70c08ce19c575
	.xword	0x995d6317c4be69ca
	.xword	0x579e3d05077b2492
	.xword	0x3c79915b7dc1470b
	.xword	0xbfff05d4d72264e1
	.xword	0x106f982ab00b232f
	.xword	0x6b15dd50a50f0edc
	.xword	0xf5452a18d2dd4fef
	.xword	0xfba97165a388294e
	.xword	0x33eeb45db27a44c2
	.xword	0xdaebb2d73aab08fd
	.xword	0xfd989f4d20c51c84
	.xword	0x12e2bdf7064480ff
	.xword	0x8f2ec1be2b469ba3
	.xword	0x15ce011c64abf1f0
	.xword	0x9517da02ef293a5c
	.xword	0xd6b92d7cb714c2b1
	.xword	0x708459e0cc8ca5a6
	.xword	0xf92c8e92222d85ed
	.xword	0x1eec125625421a76
	.xword	0x3928f0e7de974cdf
	.xword	0x7f79bb5ab98cc9c9
	.xword	0xe6247473a5c3d03b
	.xword	0x21c275483d1bec20
	.xword	0x051c38d0621836a9
	.xword	0xfe55284579bf1240
	.xword	0x35a6b539e9212a14
	.xword	0x037bdd5a8d8abdb7
	.xword	0x228fa53c47dd124b
	.xword	0xa99a7b3239c7a6b3
	.xword	0x6ecdcd3799e16b45
	.xword	0x4baa61bbefd2b2e0
	.xword	0x1c59b7d680b8e67f
	.xword	0x51acc9a55adb8a8b
	.xword	0x340539e4d1a263f9
	.xword	0xff61d57061f21698
	.xword	0xe1746dcb62a421be
	.xword	0xeec414a2518d712d
	.xword	0xb2425e93b821166d
	.xword	0xae28233975f1b573
	.xword	0x479f43b16278ae5c
	.xword	0x3b6d8ed0d3145de6
	.xword	0xb079b167306eb942
	.xword	0x64c2089bcf6c2de5
	.xword	0x1d1ff4978abc3082
	.xword	0x6602d51e3b63d2d3
	.xword	0xb618cfd63cd48e7b
	.xword	0xe978987e318ada88
	.xword	0x57fd704199843460
	.xword	0x44fdc240fde11382
	.xword	0xef4b46751c4f86c6
	.xword	0x9e1a619286717e2f
	.xword	0xc5f494c6eb8bfb3d
	.xword	0xb87620f92182adb5
	.xword	0xe39007cd82006fff
	.xword	0x0c1b5a93f25581c4
	.xword	0x0492184c239b5482
	.xword	0xc4097b260724c46d
	.xword	0x26a0fca8b525b488
	.xword	0xf7edfb0cdbda7472
	.align 0x80000
	.data
data_start_7:

	.xword	0x01b2b9f675f30f27
	.xword	0x6dbb0e824e9870b5
	.xword	0x2ff5631da66fe0a7
	.xword	0x88c50bbc9be121c5
	.xword	0x10995d3a79c2bc4c
	.xword	0x4dbe1c4ebbb27dc3
	.xword	0x724353aa253b169d
	.xword	0x1206f4d38bcb5651
	.xword	0xea0da4357528397b
	.xword	0x4e95df24666378c4
	.xword	0xe692e9ae47688fc9
	.xword	0xe5676264e79efa1b
	.xword	0x53ef26e636afc076
	.xword	0x98026949f5433cae
	.xword	0x41c41e15b6d56775
	.xword	0xffd2c19d773b503e
	.xword	0x31086a2fd2a851fa
	.xword	0xdb0a1aed2a5d7e55
	.xword	0x9af96588ae7cd40e
	.xword	0xb9930ff43ef55be5
	.xword	0x4db806c4d802a221
	.xword	0x0b0f8009aceb7923
	.xword	0x6783c5f15ac0def4
	.xword	0x0de620fdd7f97d72
	.xword	0x80994dcb21639577
	.xword	0x2b60ce7cee25dcc2
	.xword	0xe8d802257cce7588
	.xword	0xaabe24eadff39630
	.xword	0x9870f3ed1ae77717
	.xword	0xaa9228ba333b7988
	.xword	0x7109496f1b937d44
	.xword	0x870fd9df54957811
	.xword	0x2cc555d48dce5cef
	.xword	0xfee8a2fcefcd8dda
	.xword	0xe64d82a1dc69e954
	.xword	0xd1188275edcf76f6
	.xword	0x5776f9d7ff4b2af6
	.xword	0x54e5fd0f898ed537
	.xword	0x6e3e9f2dae1af1bc
	.xword	0x341d5668aca0d589
	.xword	0x37796fd3c7e34f91
	.xword	0x414418ddd1ad9b0a
	.xword	0x1534f3c5fe8cd515
	.xword	0xe4a45d574617960a
	.xword	0xdb1661718259da64
	.xword	0x3949a871191bb696
	.xword	0x1a1619010b869ba6
	.xword	0xde70eea9462090ad
	.xword	0x2a0115dfbb96685e
	.xword	0x0f33eb5165118d22
	.xword	0x9b9afec06ab8bc6c
	.xword	0x66cb5df2da192e5a
	.xword	0x36f654b2810843c2
	.xword	0xaadde1ee68c8391e
	.xword	0x0396d7a085cedd3a
	.xword	0x9f14667060777f7e
	.xword	0x2837a98170879a29
	.xword	0x222ab78f03544b65
	.xword	0x290725bfd9e32445
	.xword	0x0fa5b691fbecbb4a
	.xword	0x83b36fb65351075c
	.xword	0xfa063257f504194e
	.xword	0x68cd167bd3878725
	.xword	0x6638aacd4799e8cd
	.xword	0x029d24fa5f7a6e8c
	.xword	0x93651ba8af12f083
	.xword	0x9b782e60cd610e64
	.xword	0xbc0eb5563a81110c
	.xword	0xbe49493e657bb147
	.xword	0x2602243f1caa561d
	.xword	0xc0adc90391fa7171
	.xword	0x52a0da414885e87b
	.xword	0x1b65dc0e9af40449
	.xword	0x9cb7b72d9d2a89f0
	.xword	0xaf6b23be7acc8dc4
	.xword	0x5992a978192151d5
	.xword	0xc4ede203f6220e76
	.xword	0x3ba9c0fcff7338ca
	.xword	0xdb97516bbdf441da
	.xword	0x812abce84d34a92d
	.xword	0xcd46916ec2178b8c
	.xword	0x0481b92114fd309c
	.xword	0xe8ccd4b5714c5027
	.xword	0xf4944eb2d0486292
	.xword	0x05dd4a28e339f912
	.xword	0x724554307bf64490
	.xword	0xf96ef400d35e1c0b
	.xword	0xe61c1e97172ec654
	.xword	0xce55af2d8fdc9a90
	.xword	0xd569682b3fb79c36
	.xword	0x5eb3e32259e3157d
	.xword	0x08e990d63244216b
	.xword	0xbc690a33c27d71cf
	.xword	0xd06c9744007e97a8
	.xword	0xcf135f5348eb0ab3
	.xword	0x95c235356ee75c61
	.xword	0x016e3e66645e8df9
	.xword	0x781d6fbb120628b2
	.xword	0x87e0b4cd59bd830d
	.xword	0x612ee42e8675de01
	.xword	0xe266b1e35b2635ac
	.xword	0xe48b23a28cc3ecc3
	.xword	0x8bdc19ced7950307
	.xword	0xf78acf71a2ec4592
	.xword	0xb2c54948a6d0379f
	.xword	0xdb66d93012f6f628
	.xword	0x24b99281a2b18ec1
	.xword	0xdba364e86871d9dd
	.xword	0x45c2bc8275992d97
	.xword	0x351cadcb1246b087
	.xword	0x7eac726bef8f581b
	.xword	0x305b2ed5927bac50
	.xword	0x7484df4729db93ad
	.xword	0x0557f63966bc17c9
	.xword	0x73f0cc1028963dfb
	.xword	0x90ce48574228341a
	.xword	0x257e49efb95c6c54
	.xword	0x98b8f73e2cea4121
	.xword	0x592ada26fca0a1f8
	.xword	0x68c7b265bc784f96
	.xword	0x8a2b238b3035526f
	.xword	0xbf1bef8c370f7080
	.xword	0xc16b6317aa46e1fa
	.xword	0x5a3f091417f7b35e
	.xword	0x558c0f868c77cb5c
	.xword	0xdce7f0d974c0bfc1
	.xword	0xcb021ace72d901f1
	.xword	0x5bd4a5d0ba039c2d
	.xword	0x66cd24f236a152e4
	.xword	0xee6cef5549715be4
	.xword	0xce99076de28fc915
	.xword	0x89e860589b051cdb
	.xword	0xafe3f732653f3895
	.xword	0x830a253c7f1382cb
	.xword	0xbbe4144a96283767
	.xword	0x62fd5d5dda9b7f9b
	.xword	0x2ce117547a8b9b7a
	.xword	0x59cac58433c0ae45
	.xword	0x8ec264c72de6ae28
	.xword	0x2f16d8981bc99d52
	.xword	0x2ba8c024d380e261
	.xword	0x43cc23cb0e3d4e63
	.xword	0x53dbed4c7ce6a783
	.xword	0x51a52260cafa6edf
	.xword	0xeeabaa1bf0eec453
	.xword	0x400411e1b2f7281a
	.xword	0x454928f16c827c68
	.xword	0xf11cd156c930f9ad
	.xword	0x99fa167c94610cff
	.xword	0x9aea81e8c25c7425
	.xword	0xe958bfc461dce377
	.xword	0x7e588b8df3e572d7
	.xword	0xcd1f125686d5a199
	.xword	0x19d898c5787ee12b
	.xword	0xda22ddf2122ed029
	.xword	0xa52b6e348938d1b1
	.xword	0x4aef71def7a16551
	.xword	0x6ab7fd572d46d2b0
	.xword	0x93e9581270fbff73
	.xword	0xd7f177eadbae0061
	.xword	0x4511b2b8550b7992
	.xword	0xfc4fb949312cfb01
	.xword	0xa51970b09a45832f
	.xword	0x93523a33014865ff
	.xword	0x0cb11504d352d9cf
	.xword	0x6fa5425518634c47
	.xword	0x315e964aabb60d89
	.xword	0xb0471dc1a8cc248b
	.xword	0x657dd9bdc3c990d9
	.xword	0x97eb041208292d8e
	.xword	0xde831d0271a6f21c
	.xword	0x87b4bd42da247ebd
	.xword	0x06de559ae698673d
	.xword	0xcf0700ae7db1f111
	.xword	0xf0b8ac3e3c76c309
	.xword	0xcbf6e4057d03af36
	.xword	0xf0edc71987296130
	.xword	0xcd4c7a842947a60c
	.xword	0xca40d3af54e06dc7
	.xword	0x7efdc20b2b24e379
	.xword	0x9709c312ec1ab9e3
	.xword	0x5b7d83ff13bd9544
	.xword	0x4151e0050844b7e9
	.xword	0x6907b8e5f73d1a72
	.xword	0x714b2164a3449e76
	.xword	0x283e405bf47b7485
	.xword	0xb3f1fe70b0fa7bc4
	.xword	0x043b5537cd96555d
	.xword	0xc3dfe5b754bda59c
	.xword	0x86a8017e7a335545
	.xword	0x7e5b5057a8fa0a04
	.xword	0x0d4c884476fece45
	.xword	0x1f2a138e63c8b689
	.xword	0x7e692b407e41e49d
	.xword	0x375e6cbf2fdb3734
	.xword	0x23a8dd308912d987
	.xword	0x346e99392633bc42
	.xword	0x8b9b2f12b75251ce
	.xword	0x2fef1a7c31640419
	.xword	0x202c1b20de83352b
	.xword	0xccef0635ae98e9ca
	.xword	0xb9b387897f7551dc
	.xword	0x56f4cdb7fbe40af0
	.xword	0x669ae4d5049c5d9b
	.xword	0xed6f8739e282311e
	.xword	0x22bc1663f06cdcaa
	.xword	0xb4ad894ec66cdb97
	.xword	0x0a51fbe97427f74c
	.xword	0x470170a70272f0e7
	.xword	0x75d7d607d4bac5d2
	.xword	0xcd31c422c90ca5db
	.xword	0x2ef506a96e0c583b
	.xword	0x2f251761477cc792
	.xword	0xdd1a36317ab08710
	.xword	0xb80bcffd6efd8e4b
	.xword	0x235abf249f09a80b
	.xword	0x4d751ffff440afc9
	.xword	0x51df10dd862618e3
	.xword	0xb6b71996607ec023
	.xword	0xda9e463fd58ae396
	.xword	0xad40abdc602768e0
	.xword	0x461f206a804d823f
	.xword	0x79c8492dcb0789bc
	.xword	0x61ca454821c4e246
	.xword	0x550b239cf8336c0f
	.xword	0x64c0eae4137a14ab
	.xword	0x9bd0456f8aafd21a
	.xword	0x2a56be648ccb373a
	.xword	0xd8b66b30f7ae7ddd
	.xword	0xe8c1fc4ad840fc63
	.xword	0x7657c195f67790e9
	.xword	0x8329ab4b655c7d04
	.xword	0xf5739ec814498a8e
	.xword	0xf19dc404bb12cf2e
	.xword	0x12711a32ca00ac58
	.xword	0xc53a3465674873f8
	.xword	0xbd460a17fb213134
	.xword	0xc105dbcf3352c732
	.xword	0x40557f78836991f5
	.xword	0xd89d6724f81a24af
	.xword	0x14210d32e3e44f2d
	.xword	0xb76dcca9e9df40fb
	.xword	0x00a386b7d60e0577
	.xword	0x49b95065be938cb5
	.xword	0x36184b3f51ccef9c
	.xword	0x46c73c025f67c9d4
	.xword	0x1e1704771dd6ce84
	.xword	0xac570d975d5a5763
	.xword	0xddd0ad4ad7755dd4
	.xword	0xc8c3698f6221c0be
	.xword	0x56b9b59805a6eae8
	.xword	0x382a4d55f672acf2
	.xword	0x093c15967aa90567
	.xword	0xa9341311d33c5f8b
	.xword	0x8751e85df7212d77
	.xword	0x5f07bb8ea3d69b81



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
