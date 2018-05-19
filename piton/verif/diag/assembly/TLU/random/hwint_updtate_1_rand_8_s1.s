// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_8_s1.s
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
   random seed:	437738530
   Jal hwint_updtate_1.j:	
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

	setx 0xe9e83023be5b19c3, %g1, %g0
	setx 0x4095a365050febbc, %g1, %g1
	setx 0x4795f9cea59b5493, %g1, %g2
	setx 0x543c9f9d60ad7805, %g1, %g3
	setx 0x0abc86acddd41a9f, %g1, %g4
	setx 0x87e64c9bc3f7182b, %g1, %g5
	setx 0x73edd84ebe0cbbcb, %g1, %g6
	setx 0x32a1b71c217505a7, %g1, %g7
	setx 0x582a1be145708c87, %g1, %r16
	setx 0x8f55d608d32901ed, %g1, %r17
	setx 0xf88285dbd42f7ad8, %g1, %r18
	setx 0x1c341d0188bfdcaa, %g1, %r19
	setx 0x4b99af7f08807188, %g1, %r20
	setx 0x350a0dc1bd27eb78, %g1, %r21
	setx 0xc5b2cbc5b9d2c878, %g1, %r22
	setx 0xbdeea84047e21a90, %g1, %r23
	setx 0xef1b899a856d2f15, %g1, %r24
	setx 0x493272961020272e, %g1, %r25
	setx 0xe40089007bd33a54, %g1, %r26
	setx 0xb1d3ec8b87d7f2ef, %g1, %r27
	setx 0xfc8df2aab92367ab, %g1, %r28
	setx 0x27f9594ddd4693a0, %g1, %r29
	setx 0x1ab39a36d81a1030, %g1, %r30
	setx 0xb77d1a3dd54dfe4e, %g1, %r31
	save
	setx 0x0dd98766c3a4ae93, %g1, %r16
	setx 0xb911a485e7995153, %g1, %r17
	setx 0xfb56dd2dbff4245f, %g1, %r18
	setx 0x085afd1e4527eab4, %g1, %r19
	setx 0xa02fe805a0b6605d, %g1, %r20
	setx 0xfae4c5e176cea222, %g1, %r21
	setx 0xa5caf4b0d7cd0323, %g1, %r22
	setx 0xb59311f8e1ceac50, %g1, %r23
	setx 0x70afdd35bd787d36, %g1, %r24
	setx 0x3648a3b32a3fc009, %g1, %r25
	setx 0x4b0e16cbe6568512, %g1, %r26
	setx 0x7cb480cbd17f9c51, %g1, %r27
	setx 0x91baa87290cdf792, %g1, %r28
	setx 0x72f2ce02a69f6279, %g1, %r29
	setx 0x9d9c274a7cff7b03, %g1, %r30
	setx 0x422389b6d599481a, %g1, %r31
	save
	setx 0xb98bbeef2fa320de, %g1, %r16
	setx 0x811cfa9bd2dca402, %g1, %r17
	setx 0xb8943f03f4df2621, %g1, %r18
	setx 0x99087548ef44064d, %g1, %r19
	setx 0xaa408e199577ab88, %g1, %r20
	setx 0x366250e08c518f15, %g1, %r21
	setx 0xfc732c22cb53a5bd, %g1, %r22
	setx 0x7153099b72605cdd, %g1, %r23
	setx 0x1468e2f200ea6f6a, %g1, %r24
	setx 0xfbd23195edc779de, %g1, %r25
	setx 0xcb5f64e789236a77, %g1, %r26
	setx 0x494e75ac65fa1c1a, %g1, %r27
	setx 0x104b1e95da4a2595, %g1, %r28
	setx 0x4ceae5786428e507, %g1, %r29
	setx 0x8605d6331ac3d7e1, %g1, %r30
	setx 0x4b0ebbc44ea63edd, %g1, %r31
	save
	setx 0xd7b45cb6ef46b2d7, %g1, %r16
	setx 0xda4e1696eede56d6, %g1, %r17
	setx 0x1a6d5c3e37d27d8c, %g1, %r18
	setx 0x55a807bcf872dfc9, %g1, %r19
	setx 0x888bfbdda9ee9d7f, %g1, %r20
	setx 0xe23956d47a1d0480, %g1, %r21
	setx 0x33758d2538aabdf4, %g1, %r22
	setx 0xbd1056cc84fa264a, %g1, %r23
	setx 0xcc9af7f06f52a490, %g1, %r24
	setx 0x3a3120d2c28d56a2, %g1, %r25
	setx 0xddb0c4f41cc18015, %g1, %r26
	setx 0x4f230bfc9d18f207, %g1, %r27
	setx 0xfd8d2774a08d52f5, %g1, %r28
	setx 0x2f7ce2911e9936e7, %g1, %r29
	setx 0x7420e9c173a85e00, %g1, %r30
	setx 0xd3718413ee9d17d0, %g1, %r31
	save
	setx 0x8f74839456c2c923, %g1, %r16
	setx 0x4022967a0eb49acf, %g1, %r17
	setx 0x0271087ffbf9bdc7, %g1, %r18
	setx 0x6e8d6fe344da3394, %g1, %r19
	setx 0x91637e615c92313c, %g1, %r20
	setx 0x085ce5916370dc0e, %g1, %r21
	setx 0x3acb440784d2beb2, %g1, %r22
	setx 0x9a63f199411b6c97, %g1, %r23
	setx 0x0f6f47e4996ab0a3, %g1, %r24
	setx 0x6949c5cf02ef9c6a, %g1, %r25
	setx 0x14e639b3747dfbda, %g1, %r26
	setx 0xff7d4467b006dc0e, %g1, %r27
	setx 0xd4124c15ab118259, %g1, %r28
	setx 0x746d6ee1083eb713, %g1, %r29
	setx 0xe39e93da0cfe5cca, %g1, %r30
	setx 0xb972fb9ca535c587, %g1, %r31
	save
	setx 0xd374c1ad6187e064, %g1, %r16
	setx 0xded1958f4a5d168d, %g1, %r17
	setx 0x5927cb6c561b81e3, %g1, %r18
	setx 0x74307926485edbd0, %g1, %r19
	setx 0xe0a91da06b8ab297, %g1, %r20
	setx 0xb7cbe0399fb2af5a, %g1, %r21
	setx 0xc70236e914b1f88b, %g1, %r22
	setx 0x4c356d0422759d6b, %g1, %r23
	setx 0xca98ec39c1054e91, %g1, %r24
	setx 0xac81eb435606a515, %g1, %r25
	setx 0xbe9ab7af0ed2beee, %g1, %r26
	setx 0xee3df50135ebf7f9, %g1, %r27
	setx 0x07e317571e80e9b0, %g1, %r28
	setx 0xa6bd929483363509, %g1, %r29
	setx 0x41f78abb75db0ae8, %g1, %r30
	setx 0xe41502bce0f1640e, %g1, %r31
	save
	setx 0x15912997071614f0, %g1, %r16
	setx 0xad6d1cbf6aedfb1b, %g1, %r17
	setx 0x1bf4935092be59e2, %g1, %r18
	setx 0x0169b75a9c7ba22a, %g1, %r19
	setx 0xf00fa25854ab14c9, %g1, %r20
	setx 0x81e5b94916a09a1d, %g1, %r21
	setx 0x5a4a7e4c40fb7212, %g1, %r22
	setx 0xb0055d6120922df7, %g1, %r23
	setx 0x4c9e52f86ad39cd6, %g1, %r24
	setx 0xb12ef24c79dbbb0d, %g1, %r25
	setx 0x9c89b5e804f656ec, %g1, %r26
	setx 0xd0256c897a907b62, %g1, %r27
	setx 0xd3bdd75ed2e4c285, %g1, %r28
	setx 0x8f5bc7862e4e9736, %g1, %r29
	setx 0x8bacd717562d38ee, %g1, %r30
	setx 0xe30019fdef327f34, %g1, %r31
	save
	setx 0x9b2848f9a76905a1, %g1, %r16
	setx 0xe378635e67ddfa4c, %g1, %r17
	setx 0x8edcd0f5f03bd608, %g1, %r18
	setx 0xb4882ee9c0555f3f, %g1, %r19
	setx 0xa363d1fc001b0b16, %g1, %r20
	setx 0xe0f8cb4c1fdd774b, %g1, %r21
	setx 0x3ac1299cb976f4fe, %g1, %r22
	setx 0xe90b01962040860f, %g1, %r23
	setx 0x4878504404b917c5, %g1, %r24
	setx 0xeae19b31cb87e1da, %g1, %r25
	setx 0x162c0aecef27ca18, %g1, %r26
	setx 0x403cf5a4321446b3, %g1, %r27
	setx 0xbd80b2b66b206e0a, %g1, %r28
	setx 0xd377879b8754e5e7, %g1, %r29
	setx 0x0f1b9f5a259cb0d8, %g1, %r30
	setx 0x86feb7389899a5e1, %g1, %r31
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
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
	setx	%hi(0x1ffe0000f), %g1, %g2
	stxa	%g2, [%g0] 0x45
	mov	0x38, %g3
	setx	data_start_0, %g1, %g2
	stxa	%g2, [%g3] 0x58
Init_scratchpad:
	wr	%g0, 0x4f, %asi
	stxa	%l0, [0x0] %asi
	stxa	%l1, [0x8] %asi
	stxa	%l2, [0x10] %asi
	stxa	%l3, [0x18] %asi
	stxa	%l4, [0x20] %asi
	stxa	%l5, [0x28] %asi
	stxa	%l6, [0x30] %asi
	stxa	%l7, [0x38] %asi
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
T0_asi_reg_wr_0:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 1: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb92d2001  ! 2: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xb7e50000  ! 3: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e40000  ! 16: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_1:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 17: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb6b58000  ! 19: ORNcc_R	orncc 	%r22, %r0, %r27
T0_asi_reg_rd_0:
	mov	0x0, %r14
	.word 0xfadb8e80  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbbe420cf  ! 21: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb895c000  ! 25: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xbde54000  ! 27: SAVE_R	save	%r21, %r0, %r30
	.word 0xb3e46115  ! 28: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_2:
	mov	0x1b, %r14
	.word 0xfef38400  ! 29: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_0:
	setx	0x1f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b56071  ! 31: SUBCcc_I	orncc 	%r21, 0x0071, %r25
	.word 0xb9e58000  ! 32: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e5603c  ! 33: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8b5c000  ! 36: SUBCcc_R	orncc 	%r23, %r0, %r28
cpu_intr_0_1:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_2:
	setx	0x1f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56116  ! 44: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_4:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_3:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 47: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e58000  ! 56: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe4c000  ! 58: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_4:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 62: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 63: SAVE_R	save	%r22, %r0, %r31
	.word 0xb1e5e1ca  ! 65: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e56167  ! 67: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_5:
	setx	0x1d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba25612d  ! 72: SUB_I	sub 	%r21, 0x012d, %r29
T0_asi_reg_wr_5:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 75: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_6:
	mov	0x14, %r14
	.word 0xfcf389e0  ! 80: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_6:
	setx	0x1c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5218d  ! 85: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4a170  ! 86: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe44000  ! 92: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e5a060  ! 93: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4c000  ! 94: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe5e0dc  ! 95: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e44000  ! 97: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe52008  ! 103: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_7:
	setx	0x1c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 107: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e40000  ! 110: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e58000  ! 112: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_1:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1641800  ! 115: MOVcc_R	<illegal instruction>
cpu_intr_0_8:
	setx	0x1d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_7:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 121: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_10:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_11:
	setx	0x1c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1b1  ! 125: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb81c205f  ! 126: XOR_I	xor 	%r16, 0x005f, %r28
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_12:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_8:
	mov	0x27, %r14
	.word 0xf2f389e0  ! 137: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbaa421d5  ! 138: SUBcc_I	subcc 	%r16, 0x01d5, %r29
cpu_intr_0_13:
	setx	0x1e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_16:
	setx	0x1d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 145: SAVE_R	save	%r23, %r0, %r28
	.word 0xb8354000  ! 146: SUBC_R	orn 	%r21, %r0, %r28
T0_asi_reg_rd_2:
	mov	0x29, %r14
	.word 0xf8db8e60  ! 152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe4e109  ! 154: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5c000  ! 156: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e520d7  ! 157: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_17:
	setx	0x1d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4615c  ! 162: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_3:
	mov	0x13, %r14
	.word 0xf2db89e0  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e48000  ! 169: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e44000  ! 172: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e56071  ! 176: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7641800  ! 179: MOVcc_R	<illegal instruction>
	.word 0xbbe48000  ! 180: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_9:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 181: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e40000  ! 183: SAVE_R	save	%r16, %r0, %r28
	.word 0xbde44000  ! 184: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_10:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 186: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_18:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_19:
	setx	0x1c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_20:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e5e144  ! 198: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 21)
	.word 0xbb504000  ! 209: RDPR_TNPC	<illegal instruction>
	.word 0xb3e5a01b  ! 212: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbd500000  ! 213: RDPR_TPC	<illegal instruction>
	.word 0xb5e4e114  ! 214: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3347001  ! 218: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xbde58000  ! 219: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e5e02e  ! 222: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_21:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 224: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_4:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb284e1f3  ! 229: ADDcc_I	addcc 	%r19, 0x01f3, %r25
	.word 0xb5e58000  ! 231: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e5a16b  ! 241: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_22:
	setx	0x1e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 246: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde4a13a  ! 248: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb2c9000  ! 250: SLLX_R	sllx	%r18, %r0, %r29
	.word 0xb21de10e  ! 254: XOR_I	xor 	%r23, 0x010e, %r25
	.word 0xb3e50000  ! 256: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde560e0  ! 257: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde46145  ! 259: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e521ef  ! 262: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5c000  ! 263: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_23:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_5:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbde4c000  ! 268: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_24:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e121  ! 273: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_11:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 277: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_25:
	setx	0x1e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32de001  ! 281: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xb5e40000  ! 285: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_6:
	mov	0x24, %r14
	.word 0xfadb89e0  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 33)
	.word 0xbcad211e  ! 292: ANDNcc_I	andncc 	%r20, 0x011e, %r30
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_7:
	mov	0x31, %r14
	.word 0xfadb89e0  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e46041  ! 303: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_26:
	setx	0x1c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 305: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde520c1  ! 307: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_27:
	setx	0x1f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 315: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_8:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0x899460f6  ! 317: WRPR_TICK_I	wrpr	%r17, 0x00f6, %tick
cpu_intr_0_28:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 322: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_29:
	setx	0x1f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_30:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_12:
	mov	0x31, %r14
	.word 0xf0f389e0  ! 326: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbbe54000  ! 327: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe520f5  ! 329: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb834a096  ! 331: ORN_I	orn 	%r18, 0x0096, %r28
T0_asi_reg_rd_9:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde40000  ! 339: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe4c000  ! 341: SAVE_R	save	%r19, %r0, %r29
	.word 0xb9e4a06e  ! 343: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe52028  ! 344: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 13)
	.word 0xbabce1c5  ! 350: XNORcc_I	xnorcc 	%r19, 0x01c5, %r29
	.word 0xb3e54000  ! 353: SAVE_R	save	%r21, %r0, %r25
	.word 0xb9e461f4  ! 354: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e50000  ! 355: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e4e0b0  ! 356: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbc35a1c6  ! 358: SUBC_I	orn 	%r22, 0x01c6, %r30
T0_asi_reg_rd_10:
	mov	0x20, %r14
	.word 0xfedb8e80  ! 360: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e5c000  ! 362: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde54000  ! 365: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e4c000  ! 367: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_31:
	setx	0x1e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_11:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 372: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbc85a17c  ! 373: ADDcc_I	addcc 	%r22, 0x017c, %r30
	.word 0xb3e58000  ! 374: SAVE_R	save	%r22, %r0, %r25
	.word 0xb0348000  ! 377: ORN_R	orn 	%r18, %r0, %r24
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3e50000  ! 381: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 5)
	.word 0xb2856178  ! 385: ADDcc_I	addcc 	%r21, 0x0178, %r25
	.word 0xb7e5e1c9  ! 386: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e40000  ! 390: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe4c000  ! 392: SAVE_R	save	%r19, %r0, %r29
	.word 0xbbe4209f  ! 394: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_13:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 395: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e50000  ! 396: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_32:
	setx	0x1d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42092  ! 401: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_33:
	setx	0x1d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e58000  ! 405: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e46130  ! 409: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb0bd61cd  ! 412: XNORcc_I	xnorcc 	%r21, 0x01cd, %r24
T0_asi_reg_rd_12:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbde50000  ! 419: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_14:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 420: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 423: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 429: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e460af  ! 435: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_13:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xa1902001  ! 437: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_0_34:
	setx	0x1d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52177  ! 441: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e4e0ac  ! 442: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4c000  ! 444: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_16:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 446: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e46062  ! 449: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e48000  ! 450: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe40000  ! 453: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_17:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 454: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 455: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe5e159  ! 459: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e40000  ! 460: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_14:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_18:
	mov	0x26, %r14
	.word 0xf4f38400  ! 464: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 467: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_15:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_rd_16:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde4a1a3  ! 475: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_35:
	setx	0x200320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52043  ! 477: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_19:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 478: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_36:
	setx	0x210225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 481: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e54000  ! 489: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_21:
	mov	0x24, %r14
	.word 0xfaf38400  ! 491: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbc146084  ! 492: OR_I	or 	%r17, 0x0084, %r30
	.word 0xb3e56018  ! 494: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xa1902000  ! 495: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_37:
	setx	0x21000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6944000  ! 500: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb53d5000  ! 501: SRAX_R	srax	%r21, %r0, %r26
cpu_intr_0_38:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_39:
	setx	0x23003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 507: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_17:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5e5c000  ! 511: SAVE_R	save	%r23, %r0, %r26
	.word 0xbc2d0000  ! 513: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xbe9cc000  ! 515: XORcc_R	xorcc 	%r19, %r0, %r31
	.word 0xb3e5c000  ! 527: SAVE_R	save	%r23, %r0, %r25
	.word 0xb3e560bd  ! 530: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5a1e3  ! 533: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e4c000  ! 534: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e5e13b  ! 535: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 537: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfe5e1fc  ! 538: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_18:
	mov	0x9, %r14
	.word 0xf4db8e80  ! 540: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1355000  ! 544: SRLX_R	srlx	%r21, %r0, %r24
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_40:
	setx	0x23010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 547: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9346001  ! 548: SRL_I	srl 	%r17, 0x0001, %r28
	.word 0xb57d8400  ! 549: MOVR_R	movre	%r22, %r0, %r26
T0_asi_reg_rd_19:
	mov	0x4, %r14
	.word 0xf0db8400  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_23:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 553: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e4c000  ! 556: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e50000  ! 558: SAVE_R	save	%r20, %r0, %r26
	.word 0xbfe5e06f  ! 563: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4213b  ! 564: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5a0a5  ! 566: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e48000  ! 568: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_20:
	mov	0xb, %r14
	.word 0xf8db84a0  ! 569: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7e4c000  ! 572: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_41:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 574: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e40000  ! 575: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe44000  ! 576: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_21:
	mov	0x29, %r14
	.word 0xf2db8400  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_42:
	setx	0x22030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 587: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e42136  ! 588: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e560c9  ! 589: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e460ec  ! 591: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_43:
	setx	0x22030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x230015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_45:
	setx	0x220231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 27)
	.word 0xbbe5c000  ! 606: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e521c3  ! 616: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_25:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 617: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_22:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e4e007  ! 622: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e44000  ! 624: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_46:
	setx	0x23012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_47:
	setx	0x200127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5e420e1  ! 638: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7643801  ! 639: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_26:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 640: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 643: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe5a1a1  ! 649: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_48:
	setx	0x230110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e40000  ! 654: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e521d3  ! 656: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xba8cc000  ! 657: ANDcc_R	andcc 	%r19, %r0, %r29
T0_asi_reg_rd_24:
	mov	0x22, %r14
	.word 0xf4db8400  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_49:
	setx	0x220103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 668: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e5218c  ! 669: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde46123  ! 670: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_50:
	setx	0x22032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 681: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_51:
	setx	0x210233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x230114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 689: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde58000  ! 692: SAVE_R	save	%r22, %r0, %r30
	.word 0xb43ca061  ! 693: XNOR_I	xnor 	%r18, 0x0061, %r26
	.word 0xb2ad21c1  ! 695: ANDNcc_I	andncc 	%r20, 0x01c1, %r25
T0_asi_reg_wr_28:
	mov	0x11, %r14
	.word 0xf2f38e80  ! 698: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe561d3  ! 702: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe48000  ! 704: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_29:
	mov	0xd, %r14
	.word 0xfcf389e0  ! 708: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 26)
	.word 0xb6348000  ! 712: SUBC_R	orn 	%r18, %r0, %r27
T0_asi_reg_wr_30:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 716: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e4611e  ! 718: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_53:
	setx	0x230235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56105  ! 723: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_25:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_31:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 731: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5e0e4  ! 732: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5a012  ! 737: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 738: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_26:
	mov	0x2a, %r14
	.word 0xfedb89e0  ! 739: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0x899560c5  ! 740: WRPR_TICK_I	wrpr	%r21, 0x00c5, %tick
T0_asi_reg_wr_33:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 741: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe5204b  ! 742: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e561a1  ! 749: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e50000  ! 753: SAVE_R	save	%r20, %r0, %r25
	.word 0xb0bc6145  ! 754: XNORcc_I	xnorcc 	%r17, 0x0145, %r24
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 27)
	.word 0xbc04204a  ! 767: ADD_I	add 	%r16, 0x004a, %r30
	.word 0xb8bde179  ! 768: XNORcc_I	xnorcc 	%r23, 0x0179, %r28
	.word 0xb7e5c000  ! 769: SAVE_R	save	%r23, %r0, %r27
	.word 0xb7e4c000  ! 771: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe561e3  ! 772: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_54:
	setx	0x200322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea54000  ! 774: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xbfe4205c  ! 775: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5e02d  ! 776: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_55:
	setx	0x210230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_56:
	setx	0x200237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbb34b001  ! 786: SRLX_I	srlx	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb23460f5  ! 794: SUBC_I	orn 	%r17, 0x00f5, %r25
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe48000  ! 799: SAVE_R	save	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_34:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 803: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e48000  ! 807: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_57:
	setx	0x22000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x9, %r14
	.word 0xf6f38400  ! 810: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9e52053  ! 811: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_58:
	setx	0x20022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_59:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e015  ! 817: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_36:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 823: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_27:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_60:
	setx	0x23000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 828: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde54000  ! 832: SAVE_R	save	%r21, %r0, %r30
	.word 0xb3e561b2  ! 833: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e48000  ! 834: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_28:
	mov	0x36, %r14
	.word 0xf6db8e60  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_29:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 842: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_37:
	mov	0x6, %r14
	.word 0xfef38e40  ! 845: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde52167  ! 847: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 11)
	.word 0xbde5e00c  ! 849: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_38:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 850: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_61:
	setx	0x210134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 852: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5e58000  ! 853: SAVE_R	save	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e50000  ! 859: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde5c000  ! 863: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, d)
	.word 0xb1e4a0bc  ! 865: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e421b3  ! 867: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe521d1  ! 871: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4a1c9  ! 873: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_40:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 874: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 35)
	.word 0xb37ca401  ! 885: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xb5e5e116  ! 887: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e5a064  ! 889: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde560e7  ! 891: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e58000  ! 894: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_41:
	mov	0x30, %r14
	.word 0xf2f384a0  ! 895: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe54000  ! 898: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde54000  ! 900: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_42:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 901: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe44000  ! 902: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e50000  ! 905: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_62:
	setx	0x230309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946096  ! 908: WRPR_TPC_I	wrpr	%r17, 0x0096, %tpc
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb53c9000  ! 913: SRAX_R	srax	%r18, %r0, %r26
T0_asi_reg_wr_43:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 914: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde4c000  ! 917: SAVE_R	save	%r19, %r0, %r30
	.word 0xb17d0400  ! 918: MOVR_R	movre	%r20, %r0, %r24
	.word 0x8994e0c5  ! 919: WRPR_TICK_I	wrpr	%r19, 0x00c5, %tick
cpu_intr_0_63:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_44:
	mov	0x30, %r14
	.word 0xf4f38e80  ! 926: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1e50000  ! 928: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e50000  ! 929: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_64:
	setx	0x270337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_30:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e50000  ! 933: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e5e151  ! 938: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e44000  ! 939: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e5207d  ! 943: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbc8d0000  ! 950: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xbde48000  ! 954: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_65:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_31:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfe44000  ! 964: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_32:
	mov	0x30, %r14
	.word 0xf0db8e60  ! 966: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_33:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e48000  ! 970: SAVE_R	save	%r18, %r0, %r25
	.word 0xb3e4c000  ! 972: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5207e  ! 974: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4e101  ! 976: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4c000  ! 977: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e4e003  ! 981: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_66:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 984: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4c000  ! 990: SAVE_R	save	%r19, %r0, %r24
	.word 0xba05c000  ! 991: ADD_R	add 	%r23, %r0, %r29
	.word 0xbcbd0000  ! 992: XNORcc_R	xnorcc 	%r20, %r0, %r30
cpu_intr_0_67:
	setx	0x24010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_68:
	setx	0x26002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561d6  ! 998: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_69:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_45:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 1008: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e5612a  ! 1013: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_70:
	setx	0x250239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46194  ! 1018: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_71:
	setx	0x240019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0ee  ! 1028: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_34:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde4e0cb  ! 1033: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_72:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 1036: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_73:
	setx	0x240300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9e5e0c9  ! 1047: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e44000  ! 1048: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e561b4  ! 1050: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_74:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0f5  ! 1058: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_75:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_76:
	setx	0x25012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x8, %r14
	.word 0xfaf384a0  ! 1069: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_35:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_48:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 1076: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5e52006  ! 1077: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde48000  ! 1081: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_36:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb4b54000  ! 1084: ORNcc_R	orncc 	%r21, %r0, %r26
	.word 0xbbe52096  ! 1086: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_49:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 1093: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde44000  ! 1094: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_77:
	setx	0x250119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x260113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_79:
	setx	0x240007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_38:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 1109: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde52002  ! 1110: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5e561fc  ! 1113: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e44000  ! 1116: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e4a178  ! 1119: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_40:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_50:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 1122: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_41:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 1125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e5e14f  ! 1126: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5e0e3  ! 1128: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e40000  ! 1129: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe4a173  ! 1133: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xba95a0b2  ! 1136: ORcc_I	orcc 	%r22, 0x00b2, %r29
	.word 0xb9e4a181  ! 1137: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb72db001  ! 1140: SLLX_I	sllx	%r22, 0x0001, %r27
T0_asi_reg_wr_51:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 1143: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3e5c000  ! 1145: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_80:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5219a  ! 1148: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbc35c000  ! 1149: SUBC_R	orn 	%r23, %r0, %r30
cpu_intr_0_81:
	setx	0x24032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_82:
	setx	0x240204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_83:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e48000  ! 1156: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_84:
	setx	0x250023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_85:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_52:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 1161: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_53:
	mov	0x10, %r14
	.word 0xf2f38400  ! 1169: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe4e08b  ! 1170: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde40000  ! 1171: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_42:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_86:
	setx	0x240229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x260125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e54000  ! 1189: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_88:
	setx	0x25021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 1194: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde461be  ! 1201: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe50000  ! 1205: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e4e050  ! 1206: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb33c6001  ! 1207: SRA_I	sra 	%r17, 0x0001, %r25
T0_asi_reg_wr_54:
	mov	0x13, %r14
	.word 0xfcf38400  ! 1208: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_43:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_55:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1216: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e50000  ! 1221: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde421dc  ! 1222: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5e0fa  ! 1223: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_89:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4211f  ! 1227: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe42177  ! 1228: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_90:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe40000  ! 1237: SAVE_R	save	%r16, %r0, %r31
	.word 0xb7e4e082  ! 1241: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4c000  ! 1247: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e521f6  ! 1248: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_91:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_92:
	setx	0x260006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_56:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1257: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_93:
	setx	0x25032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_94:
	setx	0x27033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_95:
	setx	0x270027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_96:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1269: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 19)
	.word 0xbbe44000  ! 1274: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_57:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 1276: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 1278: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_97:
	setx	0x270237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e00e  ! 1281: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_58:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 1284: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e5e1ca  ! 1289: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2b4a0a7  ! 1290: SUBCcc_I	orncc 	%r18, 0x00a7, %r25
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e44000  ! 1294: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe5a0f3  ! 1297: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_59:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 1301: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1e54000  ! 1302: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe521d0  ! 1304: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb8148000  ! 1308: OR_R	or 	%r18, %r0, %r28
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_60:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 1315: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_98:
	setx	0x250329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1323: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_99:
	setx	0x240317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 1325: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_61:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 1329: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_62:
	mov	0x15, %r14
	.word 0xf2f38400  ! 1331: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb28de000  ! 1332: ANDcc_I	andcc 	%r23, 0x0000, %r25
T0_asi_reg_wr_63:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 1333: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_100:
	setx	0x260009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_101:
	setx	0x26003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_102:
	setx	0x25022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 1339: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb00de1c7  ! 1340: AND_I	and 	%r23, 0x01c7, %r24
T0_asi_reg_rd_44:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e4a0a0  ! 1342: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_45:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 1344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_65:
	mov	0xe, %r14
	.word 0xf6f38400  ! 1345: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7e58000  ! 1347: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_103:
	setx	0x270115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e50000  ! 1359: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe460e4  ! 1361: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbc1d4000  ! 1363: XOR_R	xor 	%r21, %r0, %r30
	.word 0xbde5e067  ! 1366: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_104:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1370: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe521c8  ! 1376: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde54000  ! 1377: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e520a2  ! 1383: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e4e0a3  ! 1388: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_46:
	mov	0x15, %r14
	.word 0xf2db8400  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_105:
	setx	0x290024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7c0400  ! 1392: MOVR_R	movre	%r16, %r0, %r30
	.word 0xbde54000  ! 1396: SAVE_R	save	%r21, %r0, %r30
	.word 0xb6aca1aa  ! 1397: ANDNcc_I	andncc 	%r18, 0x01aa, %r27
T0_asi_reg_rd_47:
	mov	0x37, %r14
	.word 0xf0db8e60  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3e4c000  ! 1404: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_106:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420c4  ! 1406: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe561b5  ! 1407: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e50000  ! 1408: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e4a131  ! 1411: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_107:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_66:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 1416: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe4c000  ! 1417: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_109:
	setx	0x2a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1425: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_110:
	setx	0x280217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1434: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_111:
	setx	0x290123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_67:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 1436: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfe56174  ! 1438: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe421f8  ! 1441: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_68:
	mov	0x37, %r14
	.word 0xf2f38400  ! 1442: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe48000  ! 1445: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe40000  ! 1461: SAVE_R	save	%r16, %r0, %r31
	.word 0xbfe58000  ! 1463: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_112:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_113:
	setx	0x2b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35a08d  ! 1475: ORN_I	orn 	%r22, 0x008d, %r29
cpu_intr_0_114:
	setx	0x2b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_115:
	setx	0x2a0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0c6  ! 1483: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e58000  ! 1484: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_116:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 1489: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_117:
	setx	0x280139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 1491: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e5206b  ! 1492: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_48:
	mov	0x17, %r14
	.word 0xfadb8e60  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe52015  ! 1499: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_69:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 1506: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_118:
	setx	0x290007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561f0  ! 1508: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe48000  ! 1509: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_49:
	mov	0x3, %r14
	.word 0xf4db8e60  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9e560b4  ! 1512: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_119:
	setx	0x2b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 1515: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 1522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb0a56114  ! 1527: SUBcc_I	subcc 	%r21, 0x0114, %r24
	.word 0xb5e58000  ! 1528: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_120:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_121:
	setx	0x29013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_51:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 1534: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_122:
	setx	0x2a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_123:
	setx	0x290301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_124:
	setx	0x2b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_70:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 1548: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 1550: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_53:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 1551: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_125:
	setx	0x2a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_71:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 1554: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e5e1fc  ! 1555: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe56111  ! 1556: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7e44000  ! 1561: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_126:
	setx	0x2b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x29032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5214e  ! 1566: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_72:
	mov	0x34, %r14
	.word 0xf2f38e80  ! 1569: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, d)
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 39)
	.word 0xb69dc000  ! 1573: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xb3e58000  ! 1575: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e42070  ! 1577: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_128:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1580: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_129:
	setx	0x2b0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x290304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 1588: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_132:
	setx	0x2b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 16)
	.word 0xbf341000  ! 1594: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xb2b4c000  ! 1595: SUBCcc_R	orncc 	%r19, %r0, %r25
cpu_intr_0_133:
	setx	0x2a0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3db001  ! 1597: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xba0d4000  ! 1598: AND_R	and 	%r21, %r0, %r29
	.word 0xbf35a001  ! 1601: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb7e44000  ! 1605: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_134:
	setx	0x28013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1608: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_73:
	mov	0x27, %r14
	.word 0xfef38e40  ! 1611: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbb3c3001  ! 1612: SRAX_I	srax	%r16, 0x0001, %r29
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e40000  ! 1617: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e58000  ! 1619: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_135:
	setx	0x2b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e46043  ! 1629: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe5e02f  ! 1633: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e4e049  ! 1634: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e54000  ! 1640: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_54:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_136:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_137:
	setx	0x2a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_138:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1652: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_139:
	setx	0x20308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_140:
	setx	0x2a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_74:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 1660: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_56:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e48000  ! 1665: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e5c000  ! 1667: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe420d5  ! 1669: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1e4a120  ! 1671: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_141:
	setx	0x2b0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_75:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 1678: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_57:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 1686: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe4e031  ! 1693: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_58:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 1705: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_142:
	setx	0x2a0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 1710: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xbfe561fa  ! 1712: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e5c000  ! 1718: SAVE_R	save	%r23, %r0, %r25
	.word 0xbde4a1c1  ! 1722: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe460e8  ! 1723: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e54000  ! 1725: SAVE_R	save	%r21, %r0, %r28
	.word 0xbcbd4000  ! 1727: XNORcc_R	xnorcc 	%r21, %r0, %r30
cpu_intr_0_143:
	setx	0x29013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe348000  ! 1730: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb3e461d3  ! 1732: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_76:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 1734: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe5a0e9  ! 1735: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5e12b  ! 1739: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb72d8000  ! 1740: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb3e4a0c0  ! 1742: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4e15c  ! 1743: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_144:
	setx	0x2a033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46165  ! 1747: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e50000  ! 1748: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e521fc  ! 1752: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_77:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 1759: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_59:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_145:
	setx	0x290027, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 1764: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e5211d  ! 1767: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe4a121  ! 1770: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_79:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 1773: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_60:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_146:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1778: SAVE_R	save	%r22, %r0, %r30
	.word 0xbd3ca001  ! 1780: SRA_I	sra 	%r18, 0x0001, %r30
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e42022  ! 1784: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_147:
	setx	0x2b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0xd, %r14
	.word 0xfcf389e0  ! 1786: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_148:
	setx	0x2b0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1793: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e460ba  ! 1794: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_61:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7e5a0bd  ! 1796: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_149:
	setx	0x2b002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_150:
	setx	0x290304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46074  ! 1802: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e5e1f3  ! 1803: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_151:
	setx	0x2a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_152:
	setx	0x280123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 1807: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbc8d217f  ! 1808: ANDcc_I	andcc 	%r20, 0x017f, %r30
	.word 0xb9e58000  ! 1810: SAVE_R	save	%r22, %r0, %r28
	.word 0xbabdc000  ! 1811: XNORcc_R	xnorcc 	%r23, %r0, %r29
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_62:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 1813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbbe4604e  ! 1815: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e48000  ! 1816: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e50000  ! 1819: SAVE_R	save	%r20, %r0, %r25
	.word 0xb9e58000  ! 1822: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde4e05e  ! 1825: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_82:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 1826: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e46127  ! 1827: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4208f  ! 1829: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_63:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_83:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 1831: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb97d4400  ! 1837: MOVR_R	movre	%r21, %r0, %r28
	.word 0xbfe4e0f1  ! 1839: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_64:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 1845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe4e1ce  ! 1850: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5602c  ! 1854: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb60cc000  ! 1857: AND_R	and 	%r19, %r0, %r27
cpu_intr_0_153:
	setx	0x2f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e4a0f5  ! 1869: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_65:
	mov	0x11, %r14
	.word 0xf0db8400  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_154:
	setx	0x2e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe461ae  ! 1876: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_155:
	setx	0x2c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_84:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 1878: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5e40000  ! 1880: SAVE_R	save	%r16, %r0, %r26
	.word 0xb3e44000  ! 1881: SAVE_R	save	%r17, %r0, %r25
	.word 0xb21561b1  ! 1885: OR_I	or 	%r21, 0x01b1, %r25
	.word 0xb9e5c000  ! 1887: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e521de  ! 1894: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe5e1ae  ! 1896: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e40000  ! 1912: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_85:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 1913: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5e5a085  ! 1918: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_66:
	mov	0x32, %r14
	.word 0xfadb8400  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb08d8000  ! 1921: ANDcc_R	andcc 	%r22, %r0, %r24
cpu_intr_0_156:
	setx	0x2e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 20)
	.word 0xba446049  ! 1925: ADDC_I	addc 	%r17, 0x0049, %r29
	.word 0xbbe4c000  ! 1927: SAVE_R	save	%r19, %r0, %r29
	.word 0xbde52014  ! 1928: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_86:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 1932: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1e54000  ! 1933: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_67:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e5a0b3  ! 1937: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_157:
	setx	0x2d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_158:
	setx	0x2f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5e13b  ! 1942: ORNcc_I	orncc 	%r23, 0x013b, %r27
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_159:
	setx	0x2e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_68:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 1956: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0x8395a0f7  ! 1961: WRPR_TNPC_I	wrpr	%r22, 0x00f7, %tnpc
	.word 0xb3e50000  ! 1965: SAVE_R	save	%r20, %r0, %r25
	.word 0xb7e46094  ! 1966: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_87:
	mov	0x14, %r14
	.word 0xf6f389e0  ! 1973: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e50000  ! 1977: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_160:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 1979: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe54000  ! 1980: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e58000  ! 1981: SAVE_R	save	%r22, %r0, %r26
	.word 0xb4c58000  ! 1982: ADDCcc_R	addccc 	%r22, %r0, %r26
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_69:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_89:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 1985: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e40000  ! 1989: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_161:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68c4000  ! 1997: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xb9e54000  ! 1999: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_70:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_90:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 2002: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0x8795e03b  ! 2003: WRPR_TT_I	wrpr	%r23, 0x003b, %tt
T0_asi_reg_rd_71:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_162:
	setx	0x2c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a09f  ! 2010: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe54000  ! 2012: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_163:
	setx	0x2f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_91:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 2018: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_164:
	setx	0x2d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2030: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_72:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 2032: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3e4c000  ! 2035: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_165:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 32)
	.word 0xbbe58000  ! 2048: SAVE_R	save	%r22, %r0, %r29
	.word 0xb4b44000  ! 2049: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb3e56111  ! 2050: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e4a086  ! 2053: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_166:
	setx	0x2e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_92:
	mov	0x30, %r14
	.word 0xfcf38e80  ! 2055: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e58000  ! 2056: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_167:
	setx	0x2c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 2059: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_74:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_168:
	setx	0x2e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_93:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 2067: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_94:
	mov	0x13, %r14
	.word 0xfaf38e40  ! 2068: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_95:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 2071: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb3e50000  ! 2076: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, a)
	.word 0xbfe50000  ! 2086: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_169:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 2091: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_170:
	setx	0x2f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4613a  ! 2097: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e560d5  ! 2099: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe5c000  ! 2103: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_171:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde521d2  ! 2113: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_172:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e52032  ! 2122: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2127: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e5c000  ! 2134: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_173:
	setx	0x2e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560dc  ! 2138: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e40000  ! 2139: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e58000  ! 2141: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e40000  ! 2143: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 8)
	.word 0xb3358000  ! 2147: SRL_R	srl 	%r22, %r0, %r25
	.word 0xba340000  ! 2149: SUBC_R	orn 	%r16, %r0, %r29
	.word 0xb7e5202c  ! 2150: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4c000  ! 2151: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e5c000  ! 2152: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe40000  ! 2153: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_75:
	mov	0x1b, %r14
	.word 0xfedb8400  ! 2155: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbbe4a0b9  ! 2156: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5e0bd  ! 2157: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe5e093  ! 2158: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_76:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbbe460a9  ! 2162: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, f)
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_174:
	setx	0x2e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x35, %r14
	.word 0xfef38e80  ! 2168: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e4a1f3  ! 2169: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_176:
	setx	0x2d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 5)
	.word 0xbc9c8000  ! 2176: XORcc_R	xorcc 	%r18, %r0, %r30
	.word 0xb92d5000  ! 2177: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xb3e4e0ea  ! 2178: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e4605b  ! 2180: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_98:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 2183: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_99:
	mov	0x31, %r14
	.word 0xfef38400  ! 2188: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7e5e155  ! 2192: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e1f8  ! 2193: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e4e117  ! 2195: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_100:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 2198: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7e460f5  ! 2200: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_101:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 2201: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_wr_102:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 2202: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_77:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_177:
	setx	0x2c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x2c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52167  ! 2210: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e54000  ! 2211: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_179:
	setx	0x2e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 2216: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbde54000  ! 2219: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e48000  ! 2220: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe56026  ! 2221: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e44000  ! 2223: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_104:
	mov	0x30, %r14
	.word 0xf2f38400  ! 2229: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbde44000  ! 2230: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_180:
	setx	0x2f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b560fd  ! 2234: ORNcc_I	orncc 	%r21, 0x00fd, %r25
T0_asi_reg_wr_105:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 2235: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_106:
	mov	0x31, %r14
	.word 0xf0f384a0  ! 2237: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfe4e189  ! 2238: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5c000  ! 2239: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_78:
	mov	0x33, %r14
	.word 0xf0db8e80  ! 2240: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde52094  ! 2243: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde54000  ! 2249: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_181:
	setx	0x2f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_182:
	setx	0x2f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42047  ! 2256: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e58000  ! 2258: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe4c000  ! 2259: SAVE_R	save	%r19, %r0, %r29
	.word 0xb8c5e144  ! 2261: ADDCcc_I	addccc 	%r23, 0x0144, %r28
T0_asi_reg_rd_79:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 2262: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_107:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 2263: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 3d)
	.word 0x8595e157  ! 2268: WRPR_TSTATE_I	wrpr	%r23, 0x0157, %tstate
	.word 0xb13d1000  ! 2269: SRAX_R	srax	%r20, %r0, %r24
T0_asi_reg_wr_108:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2270: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e4a0e3  ! 2271: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e521a1  ! 2272: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_183:
	setx	0x2e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_184:
	setx	0x2d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x2f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_80:
	mov	0x20, %r14
	.word 0xfedb8e60  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5c000  ! 2288: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_81:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e5a0e4  ! 2302: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_186:
	setx	0x2d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x2d, %r14
	.word 0xf0db8e80  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e54000  ! 2309: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 2311: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1351000  ! 2312: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xbfe4a0d3  ! 2313: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde44000  ! 2315: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e42002  ! 2316: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e44000  ! 2322: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2326: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3480000  ! 2328: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe4c000  ! 2332: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_187:
	setx	0x33031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x320210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 2341: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_84:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e4c000  ! 2345: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_189:
	setx	0x30011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e025  ! 2349: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbc9cc000  ! 2352: XORcc_R	xorcc 	%r19, %r0, %r30
T0_asi_reg_rd_85:
	mov	0x8, %r14
	.word 0xf0db8e80  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e42170  ! 2359: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_86:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb4bd8000  ! 2369: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb1e5c000  ! 2372: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e4c000  ! 2377: SAVE_R	save	%r19, %r0, %r25
	.word 0xb045a0a8  ! 2378: ADDC_I	addc 	%r22, 0x00a8, %r24
	.word 0xb3641800  ! 2379: MOVcc_R	<illegal instruction>
	.word 0xb1e54000  ! 2380: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe52150  ! 2381: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4209a  ! 2389: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb015e131  ! 2390: OR_I	or 	%r23, 0x0131, %r24
cpu_intr_0_190:
	setx	0x310310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c6001  ! 2393: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xb3e4e1fc  ! 2394: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e123  ! 2395: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e46166  ! 2396: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb684c000  ! 2398: ADDcc_R	addcc 	%r19, %r0, %r27
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_87:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_191:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4217e  ! 2409: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5520000  ! 2410: RDPR_PIL	<illegal instruction>
	.word 0xbde50000  ! 2414: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_192:
	setx	0x310237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2417: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_193:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_194:
	setx	0x33002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_89:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_111:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 2433: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_90:
	mov	0x1a, %r14
	.word 0xfadb84a0  ! 2435: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e42037  ! 2437: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe52097  ! 2443: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e54000  ! 2445: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_195:
	setx	0x300326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_112:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 2447: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe42080  ! 2456: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, a)
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_196:
	setx	0x330307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe44000  ! 2463: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e44000  ! 2464: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_113:
	mov	0x35, %r14
	.word 0xf2f38e60  ! 2470: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_91:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 2473: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e521e2  ! 2475: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5c000  ! 2477: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_114:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 2485: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_197:
	setx	0x31033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_115:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 2493: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3e44000  ! 2498: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe5a19a  ! 2499: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e58000  ! 2500: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_198:
	setx	0x320208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2504: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_116:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 2505: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_199:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_200:
	setx	0x31022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e4e1da  ! 2510: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_92:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_201:
	setx	0x30003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2521: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_202:
	setx	0x32003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2524: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e5a18a  ! 2525: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe40000  ! 2530: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_203:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_93:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_204:
	setx	0x310228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_205:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_206:
	setx	0x330301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560f1  ! 2543: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e54000  ! 2546: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_117:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 2548: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_207:
	setx	0x30002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_95:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 2557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_96:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 2558: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_118:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 2560: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, d)
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe44000  ! 2564: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e50000  ! 2573: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_119:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 2574: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_208:
	setx	0x300030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, d)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 19)
	.word 0xb0bc4000  ! 2585: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xb9e4a1c3  ! 2586: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e58000  ! 2588: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_120:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 2589: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbbe4a038  ! 2594: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e460a7  ! 2597: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_121:
	mov	0x4, %r14
	.word 0xf6f389e0  ! 2598: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9e44000  ! 2603: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_97:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 2604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e4c000  ! 2605: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe521fe  ! 2606: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbeac4000  ! 2607: ANDNcc_R	andncc 	%r17, %r0, %r31
	.word 0xbcac4000  ! 2608: ANDNcc_R	andncc 	%r17, %r0, %r30
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_122:
	mov	0x2f, %r14
	.word 0xf8f38400  ! 2611: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe5c000  ! 2612: SAVE_R	save	%r23, %r0, %r29
	.word 0xb0348000  ! 2613: ORN_R	orn 	%r18, %r0, %r24
T0_asi_reg_wr_123:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 2616: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e56152  ! 2618: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_209:
	setx	0x310108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2620: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe4a18f  ! 2621: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e4e074  ! 2624: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4a066  ! 2625: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb4c421c3  ! 2626: ADDCcc_I	addccc 	%r16, 0x01c3, %r26
	.word 0xb5e4e0a6  ! 2629: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_210:
	setx	0x310115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5204a  ! 2633: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe520e8  ! 2634: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4e0f1  ! 2635: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb93c5000  ! 2636: SRAX_R	srax	%r17, %r0, %r28
	.word 0xbfe48000  ! 2640: SAVE_R	save	%r18, %r0, %r31
	.word 0xbfe461b1  ! 2643: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4a14d  ! 2645: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5218a  ! 2647: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e4c000  ! 2652: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e58000  ! 2655: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e5c000  ! 2656: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_99:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb62c0000  ! 2658: ANDN_R	andn 	%r16, %r0, %r27
T0_asi_reg_wr_124:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 2664: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_211:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e5a1ba  ! 2668: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_212:
	setx	0x330338, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e561f3  ! 2681: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_213:
	setx	0x30023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_125:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 2686: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e5e1a0  ! 2687: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_214:
	setx	0x30000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_215:
	setx	0x330110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521cc  ! 2699: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e54000  ! 2700: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_216:
	setx	0x330008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_101:
	mov	0x7, %r14
	.word 0xf8db8e60  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_126:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 2707: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_127:
	mov	0x15, %r14
	.word 0xf2f38400  ! 2710: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_128:
	mov	0x1, %r14
	.word 0xfef38e60  ! 2711: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0x8d9521ac  ! 2712: WRPR_PSTATE_I	wrpr	%r20, 0x01ac, %pstate
	.word 0xb5e50000  ! 2714: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_129:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2717: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbde5a18d  ! 2721: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_103:
	mov	0x3, %r14
	.word 0xf6db8e80  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_217:
	setx	0x31011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_218:
	setx	0x33023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_219:
	setx	0x300039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2736: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 11)
	.word 0xb23de0be  ! 2743: XNOR_I	xnor 	%r23, 0x00be, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e44000  ! 2754: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_220:
	setx	0x300215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e4e02f  ! 2764: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4a07e  ! 2770: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb895a1e2  ! 2774: ORcc_I	orcc 	%r22, 0x01e2, %r28
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 37)
	.word 0xba34a1c8  ! 2781: ORN_I	orn 	%r18, 0x01c8, %r29
	.word 0xb1e44000  ! 2783: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_130:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 2788: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb32d0000  ! 2789: SLL_R	sll 	%r20, %r0, %r25
cpu_intr_0_221:
	setx	0x370314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x360107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2795: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe4e0b7  ! 2799: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_223:
	setx	0x37020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 2801: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e54000  ! 2802: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_224:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x360007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e58000  ! 2814: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e48000  ! 2815: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e461d3  ! 2816: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb13cc000  ! 2817: SRA_R	sra 	%r19, %r0, %r24
	.word 0xbbe54000  ! 2824: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe5c000  ! 2827: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e58000  ! 2831: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_226:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_104:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc1c8000  ! 2843: XOR_R	xor 	%r18, %r0, %r30
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde461f6  ! 2847: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_227:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2849: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_228:
	setx	0x30304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x370123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1c5  ! 2855: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xba8da033  ! 2856: ANDcc_I	andcc 	%r22, 0x0033, %r29
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_105:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 2861: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbde5c000  ! 2865: SAVE_R	save	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4c000  ! 2870: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e5c000  ! 2871: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e5a1be  ! 2872: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde40000  ! 2873: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_106:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 2875: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 2)
	.word 0xbe8d8000  ! 2879: ANDcc_R	andcc 	%r22, %r0, %r31
T0_asi_reg_rd_107:
	mov	0x16, %r14
	.word 0xfadb8e60  ! 2882: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e50000  ! 2884: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e521ea  ! 2885: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_108:
	mov	0x29, %r14
	.word 0xf8db84a0  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe4611e  ! 2888: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe46175  ! 2891: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe48000  ! 2901: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e420b0  ! 2902: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 11)
	.word 0xb9e44000  ! 2905: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_230:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 2910: RDPR_GL	<illegal instruction>
T0_asi_reg_wr_131:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 2913: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_231:
	setx	0x34003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_232:
	setx	0x37023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561f2  ! 2921: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_109:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 2924: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5e42172  ! 2925: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb2b4e0c4  ! 2927: SUBCcc_I	orncc 	%r19, 0x00c4, %r25
	.word 0xb1e56117  ! 2928: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_233:
	setx	0x340206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1d5  ! 2930: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4a01a  ! 2933: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5c000  ! 2935: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_132:
	mov	0x14, %r14
	.word 0xf6f389e0  ! 2938: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3e521c6  ! 2939: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe44000  ! 2940: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde5e06e  ! 2941: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_234:
	setx	0x350009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 2946: SAVE_R	save	%r17, %r0, %r28
	.word 0xb7e5c000  ! 2952: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_110:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde4a166  ! 2962: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4a1fa  ! 2963: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_235:
	setx	0x34002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_236:
	setx	0x340223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_133:
	mov	0x2d, %r14
	.word 0xfcf38e80  ! 2970: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_237:
	setx	0x350114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2976: SAVE_R	save	%r16, %r0, %r28
	.word 0xbde4c000  ! 2977: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_238:
	setx	0x37003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e4c000  ! 2984: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_112:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e50000  ! 2987: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde4c000  ! 2991: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e50000  ! 2992: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e4616b  ! 2997: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5c000  ! 2998: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_113:
	mov	0xe, %r14
	.word 0xf0db84a0  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_239:
	setx	0x34020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42ce089  ! 3007: ANDN_I	andn 	%r19, 0x0089, %r26
T0_asi_reg_rd_114:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_240:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3013: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e58000  ! 3017: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe44000  ! 3018: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_134:
	mov	0x4, %r14
	.word 0xf2f38e40  ! 3019: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_135:
	mov	0x25, %r14
	.word 0xf6f38e60  ! 3022: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbbe5a153  ! 3023: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_241:
	setx	0x370314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x350101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 3034: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_243:
	setx	0x350117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7e50000  ! 3038: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde50000  ! 3039: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_244:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3044: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde5c000  ! 3045: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_136:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 3048: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e58000  ! 3049: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde44000  ! 3051: SAVE_R	save	%r17, %r0, %r30
	.word 0xb735a001  ! 3054: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xb7e5a16e  ! 3055: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb73c6001  ! 3056: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xb5e58000  ! 3059: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_245:
	setx	0x350139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_116:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 3072: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_137:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3073: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e5a1d7  ! 3082: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde461cf  ! 3084: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_138:
	mov	0x37, %r14
	.word 0xfef384a0  ! 3087: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5343001  ! 3089: SRLX_I	srlx	%r16, 0x0001, %r26
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 38)
	.word 0xb37d0400  ! 3096: MOVR_R	movre	%r20, %r0, %r25
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe40000  ! 3099: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 19)
	.word 0xb41ca13d  ! 3110: XOR_I	xor 	%r18, 0x013d, %r26
T0_asi_reg_wr_139:
	mov	0x23, %r14
	.word 0xfaf38400  ! 3111: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5e48000  ! 3112: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e52169  ! 3113: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb4156129  ! 3114: OR_I	or 	%r21, 0x0129, %r26
cpu_intr_0_246:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b54000  ! 3119: SUBCcc_R	orncc 	%r21, %r0, %r24
cpu_intr_0_247:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x37022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x350307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e5e13c  ! 3128: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_140:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 3129: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbde44000  ! 3131: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e44000  ! 3132: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_141:
	mov	0xe, %r14
	.word 0xf0f38e60  ! 3134: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_117:
	mov	0xb, %r14
	.word 0xfedb8400  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_250:
	setx	0x36031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_118:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbc2c8000  ! 3146: ANDN_R	andn 	%r18, %r0, %r30
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_142:
	mov	0xc, %r14
	.word 0xfef38e40  ! 3149: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e40000  ! 3150: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe58000  ! 3152: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e48000  ! 3156: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_251:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_252:
	setx	0x34033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1ad  ! 3167: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde42137  ! 3168: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_143:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3172: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e40000  ! 3175: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e421eb  ! 3178: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_253:
	setx	0x340324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d0000  ! 3184: XOR_R	xor 	%r20, %r0, %r24
	.word 0xbc050000  ! 3186: ADD_R	add 	%r20, %r0, %r30
	.word 0x8d952166  ! 3189: WRPR_PSTATE_I	wrpr	%r20, 0x0166, %pstate
	.word 0xbde50000  ! 3190: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e50000  ! 3192: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_254:
	setx	0x340225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_144:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 3196: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe46004  ! 3197: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8794a178  ! 3198: WRPR_TT_I	wrpr	%r18, 0x0178, %tt
T0_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3200: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e561ee  ! 3202: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e4c000  ! 3203: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e4e1ab  ! 3205: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba85205e  ! 3206: ADDcc_I	addcc 	%r20, 0x005e, %r29
T0_asi_reg_rd_119:
	mov	0x10, %r14
	.word 0xf4db8e60  ! 3219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_255:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 38)
	.word 0xb7e46096  ! 3227: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbeb4c000  ! 3229: SUBCcc_R	orncc 	%r19, %r0, %r31
cpu_intr_0_256:
	setx	0x370012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_257:
	setx	0x360232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46094  ! 3234: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_258:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb845a176  ! 3238: ADDC_I	addc 	%r22, 0x0176, %r28
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_260:
	setx	0x360133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3243: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_146:
	mov	0xb, %r14
	.word 0xf2f389e0  ! 3244: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_120:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 3246: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe560da  ! 3247: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e4e0ac  ! 3249: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_121:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe52002  ! 3255: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde44000  ! 3259: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_147:
	mov	0x27, %r14
	.word 0xfef38e40  ! 3265: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe5a0c2  ! 3269: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_261:
	setx	0x3b0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb445a078  ! 3271: ADDC_I	addc 	%r22, 0x0078, %r26
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 37)
	.word 0xbc3d8000  ! 3274: XNOR_R	xnor 	%r22, %r0, %r30
T0_asi_reg_wr_148:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 3275: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_149:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 3277: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_122:
	mov	0x0, %r14
	.word 0xf2db89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e4c000  ! 3285: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_262:
	setx	0x3a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x3a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_150:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 3289: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbde4a0f7  ! 3290: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4c000  ! 3291: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1352001  ! 3293: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xb5e4605c  ! 3294: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe45c000  ! 3298: ADDC_R	addc 	%r23, %r0, %r31
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5a13b  ! 3300: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e50000  ! 3307: SAVE_R	save	%r20, %r0, %r28
	.word 0xbde5c000  ! 3309: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_264:
	setx	0x390312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 20)
	.word 0xbbe54000  ! 3321: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbe04e0ea  ! 3323: ADD_I	add 	%r19, 0x00ea, %r31
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_rd_124:
	mov	0x2e, %r14
	.word 0xf2db8e80  ! 3325: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_wr_151:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3326: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 3330: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_265:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0d1  ! 3333: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5217e  ! 3339: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_266:
	setx	0x39002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 20)
	.word 0xb4a46192  ! 3342: SUBcc_I	subcc 	%r17, 0x0192, %r26
	.word 0xbde4e0c9  ! 3343: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe5208f  ! 3348: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e0a0  ! 3350: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe40000  ! 3352: SAVE_R	save	%r16, %r0, %r31
	.word 0xb7e5212b  ! 3353: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e44000  ! 3359: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e40000  ! 3361: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e5e128  ! 3362: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e46000  ! 3363: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_152:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 3365: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_267:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e52083  ! 3370: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4e01c  ! 3371: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_268:
	setx	0x38012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3373: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_269:
	setx	0x38011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4214a  ! 3379: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_125:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_270:
	setx	0x38000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_271:
	setx	0x3b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3384: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe4e19b  ! 3387: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e48000  ! 3388: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_272:
	setx	0x3b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e15c  ! 3391: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbc9dc000  ! 3394: XORcc_R	xorcc 	%r23, %r0, %r30
T0_asi_reg_wr_153:
	mov	0x20, %r14
	.word 0xf0f38e60  ! 3395: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_154:
	mov	0x2e, %r14
	.word 0xfcf389e0  ! 3398: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_273:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_126:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 3404: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 3405: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfe421ac  ! 3409: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb42cc000  ! 3410: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xb7e561f1  ! 3412: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb2ac60b8  ! 3413: ANDNcc_I	andncc 	%r17, 0x00b8, %r25
	.word 0xbd7c4400  ! 3414: MOVR_R	movre	%r17, %r0, %r30
	.word 0xb3e421be  ! 3415: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5c000  ! 3416: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_156:
	mov	0x19, %r14
	.word 0xfaf384a0  ! 3426: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 39)
	.word 0xb2ac2183  ! 3428: ANDNcc_I	andncc 	%r16, 0x0183, %r25
T0_asi_reg_rd_127:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_157:
	mov	0x21, %r14
	.word 0xfef38400  ! 3431: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_158:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 3432: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_159:
	mov	0x30, %r14
	.word 0xf4f38400  ! 3434: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1e50000  ! 3435: SAVE_R	save	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e0c5  ! 3439: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_160:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 3444: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe5e0cd  ! 3445: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_128:
	mov	0x16, %r14
	.word 0xf6db84a0  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e5e12c  ! 3451: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3452: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_162:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 3453: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_274:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e4c000  ! 3461: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e5c000  ! 3465: SAVE_R	save	%r23, %r0, %r25
	.word 0xb804c000  ! 3466: ADD_R	add 	%r19, %r0, %r28
T0_asi_reg_wr_163:
	mov	0x35, %r14
	.word 0xfaf38400  ! 3467: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, e)
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_275:
	setx	0x3a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e163  ! 3477: WRPR_PSTATE_I	wrpr	%r19, 0x0163, %pstate
	.word 0xb7e48000  ! 3478: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_129:
	mov	0x2c, %r14
	.word 0xf6db84a0  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_130:
	mov	0x4, %r14
	.word 0xf8db89e0  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_276:
	setx	0x3b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_164:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 3485: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_277:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3494: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_278:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561f9  ! 3496: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_279:
	setx	0x3a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x38033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 37)
	.word 0xbb3df001  ! 3510: SRAX_I	srax	%r23, 0x0001, %r29
T0_asi_reg_wr_166:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 3511: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_281:
	setx	0x390228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3514: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e54000  ! 3515: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_167:
	mov	0x11, %r14
	.word 0xf2f389e0  ! 3521: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_282:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 8)
	.word 0xbfe40000  ! 3527: SAVE_R	save	%r16, %r0, %r31
	.word 0xb3643801  ! 3529: MOVcc_I	<illegal instruction>
	.word 0xbbe5c000  ! 3531: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_168:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3533: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_283:
	setx	0x380212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46157  ! 3539: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_284:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe420e3  ! 3544: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_285:
	setx	0x3a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbde5e038  ! 3549: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde54000  ! 3552: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_286:
	setx	0x3b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3556: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_287:
	setx	0x390325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a180  ! 3560: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5c000  ! 3561: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e420ee  ! 3562: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_288:
	setx	0x3b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 3568: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e48000  ! 3569: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_289:
	setx	0x3b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_169:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 3573: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_290:
	setx	0x380333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_132:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_291:
	setx	0x390138, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_170:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 3577: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_292:
	setx	0x380320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e105  ! 3585: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_293:
	setx	0x3b0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 3593: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe46141  ! 3594: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_294:
	setx	0x390104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1d7  ! 3598: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e40000  ! 3601: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde5c000  ! 3602: SAVE_R	save	%r23, %r0, %r30
	.word 0xb2bd6178  ! 3605: XNORcc_I	xnorcc 	%r21, 0x0178, %r25
	.word 0x8d94e0db  ! 3606: WRPR_PSTATE_I	wrpr	%r19, 0x00db, %pstate
T0_asi_reg_rd_133:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 3607: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e5e1fb  ! 3608: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_295:
	setx	0x3b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_171:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 3614: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3e44000  ! 3615: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_134:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_296:
	setx	0x3a0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_172:
	mov	0x14, %r14
	.word 0xfcf389e0  ! 3623: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_297:
	setx	0x3b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_298:
	setx	0x3a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf354000  ! 3634: SRL_R	srl 	%r21, %r0, %r31
T0_asi_reg_wr_173:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 3637: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc1d219d  ! 3638: XOR_I	xor 	%r20, 0x019d, %r30
cpu_intr_0_299:
	setx	0x390200, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 3641: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde44000  ! 3643: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e58000  ! 3645: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_300:
	setx	0x390318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 3648: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_175:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3651: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb81421d8  ! 3652: OR_I	or 	%r16, 0x01d8, %r28
T0_asi_reg_wr_176:
	mov	0x32, %r14
	.word 0xfaf384a0  ! 3657: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e46009  ! 3658: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e420be  ! 3659: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_301:
	setx	0x3b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4616c  ! 3662: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_302:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 3667: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e58000  ! 3676: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe54000  ! 3681: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_135:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7e4a1b0  ! 3685: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e46054  ! 3686: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5e062  ! 3688: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb2c4c000  ! 3689: ADDCcc_R	addccc 	%r19, %r0, %r25
T0_asi_reg_rd_136:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 3690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_303:
	setx	0x380310, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_177:
	mov	0x9, %r14
	.word 0xf4f38e80  ! 3697: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_178:
	mov	0x2, %r14
	.word 0xf0f38400  ! 3702: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde46142  ! 3704: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_304:
	setx	0x3e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a196  ! 3715: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4e141  ! 3719: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe520d5  ! 3721: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_305:
	setx	0x3d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_306:
	setx	0x3d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a114  ! 3728: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_307:
	setx	0x3f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 3735: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_138:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 3737: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_139:
	mov	0x25, %r14
	.word 0xfadb84a0  ! 3738: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfe52102  ! 3739: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4c000  ! 3741: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe44000  ! 3742: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde4a05e  ! 3748: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e4c000  ! 3750: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e5c000  ! 3753: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde4c000  ! 3754: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e421f3  ! 3756: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_140:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_180:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 3763: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb4848000  ! 3764: ADDcc_R	addcc 	%r18, %r0, %r26
cpu_intr_0_308:
	setx	0x3c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_181:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 3767: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_309:
	setx	0x3c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 3776: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_310:
	setx	0x3f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a082  ! 3781: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e48000  ! 3782: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e48000  ! 3785: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_182:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 3790: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde4e1ac  ! 3791: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb89d8000  ! 3792: XORcc_R	xorcc 	%r22, %r0, %r28
cpu_intr_0_311:
	setx	0x3d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe4c000  ! 3798: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde4c000  ! 3799: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_312:
	setx	0x3c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_183:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 3802: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_141:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 3803: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e56035  ! 3805: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xba8d20b6  ! 3806: ANDcc_I	andcc 	%r20, 0x00b6, %r29
	.word 0xb7e54000  ! 3809: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_313:
	setx	0x3c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3817: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_184:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 3818: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_142:
	mov	0x34, %r14
	.word 0xf2db8400  ! 3819: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_316:
	setx	0x3d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3821: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e4a189  ! 3823: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_317:
	setx	0x3c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_185:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 3834: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xba95a116  ! 3835: ORcc_I	orcc 	%r22, 0x0116, %r29
	.word 0xba9d8000  ! 3837: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xb5e50000  ! 3838: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e50000  ! 3839: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_319:
	setx	0x3c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3844: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e4c000  ! 3845: SAVE_R	save	%r19, %r0, %r27
	.word 0xb72d9000  ! 3851: SLLX_R	sllx	%r22, %r0, %r27
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e5e12f  ! 3853: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, f)
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, d)
	.word 0xb69460c5  ! 3863: ORcc_I	orcc 	%r17, 0x00c5, %r27
T0_asi_reg_wr_186:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 3869: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_187:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 3871: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_188:
	mov	0x27, %r14
	.word 0xfcf389e0  ! 3872: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb72c8000  ! 3876: SLL_R	sll 	%r18, %r0, %r27
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb7e5a1e0  ! 3882: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2bc4000  ! 3883: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xb7e44000  ! 3885: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e4e10e  ! 3886: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_320:
	setx	0x3e022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_189:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3892: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0x8995202e  ! 3893: WRPR_TICK_I	wrpr	%r20, 0x002e, %tick
T0_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_321:
	setx	0x3d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 3896: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_322:
	setx	0x3c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e50000  ! 3906: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_190:
	mov	0x33, %r14
	.word 0xfef384a0  ! 3912: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3e5e050  ! 3916: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 32)
	.word 0xbbe40000  ! 3923: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe40000  ! 3924: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_144:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 3926: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7e5a1ba  ! 3927: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_323:
	setx	0x3c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3930: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_145:
	mov	0x13, %r14
	.word 0xfedb8400  ! 3932: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe521d0  ! 3933: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 3940: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 33)
	.word 0xb8ac2041  ! 3943: ANDNcc_I	andncc 	%r16, 0x0041, %r28
	.word 0xb6344000  ! 3944: SUBC_R	orn 	%r17, %r0, %r27
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 3950: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_324:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe54000  ! 3955: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_193:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 3956: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 36)
	.word 0xb93cc000  ! 3959: SRA_R	sra 	%r19, %r0, %r28
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe50000  ! 3962: SAVE_R	save	%r20, %r0, %r29
	.word 0xbf3d2001  ! 3963: SRA_I	sra 	%r20, 0x0001, %r31
cpu_intr_0_325:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0ba  ! 3966: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e561cf  ! 3968: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe4a0c1  ! 3969: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e561ff  ! 3970: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_326:
	setx	0x3f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x13, %r14
	.word 0xfcf384a0  ! 3974: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_327:
	setx	0x3c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_328:
	setx	0x3d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a0c7  ! 3981: WRPR_TICK_I	wrpr	%r18, 0x00c7, %tick
cpu_intr_0_329:
	setx	0x3c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 3988: MOVcc_R	<illegal instruction>
cpu_intr_0_330:
	setx	0x3e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3993: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbde44000  ! 3994: SAVE_R	save	%r17, %r0, %r30
	.word 0xbb3c0000  ! 3995: SRA_R	sra 	%r16, %r0, %r29
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4003: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5a113  ! 4005: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb52dd000  ! 4007: SLLX_R	sllx	%r23, %r0, %r26
	.word 0xb9e4c000  ! 4009: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_331:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 4014: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde5a00b  ! 4021: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_332:
	setx	0x3f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4208c  ! 4024: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_196:
	mov	0x24, %r14
	.word 0xfaf38e80  ! 4025: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_333:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4027: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_334:
	setx	0x3c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28dc000  ! 4035: ANDcc_R	andcc 	%r23, %r0, %r25
cpu_intr_0_335:
	setx	0x3e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 4039: SAVE_R	save	%r21, %r0, %r25
	.word 0xb1e5a16c  ! 4043: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_147:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_336:
	setx	0x3c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4c000  ! 4051: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e5e02a  ! 4052: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_337:
	setx	0x3f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 4064: SAVE_R	save	%r22, %r0, %r28
	.word 0x83946130  ! 4066: WRPR_TNPC_I	wrpr	%r17, 0x0130, %tnpc
T0_asi_reg_wr_197:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4067: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_198:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 4072: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_199:
	mov	0x9, %r14
	.word 0xf6f38400  ! 4075: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e40000  ! 4076: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_338:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_200:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 4082: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e52036  ! 4088: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_148:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_339:
	setx	0x3c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c2001  ! 4103: SRA_I	sra 	%r16, 0x0001, %r30
T0_asi_reg_wr_201:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 4109: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_149:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_340:
	setx	0x3f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_150:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_341:
	setx	0x3c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4120: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_152:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe4a133  ! 4130: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_342:
	setx	0x3c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x3c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_344:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 4137: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_153:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 4138: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_154:
	mov	0x19, %r14
	.word 0xf2db8e40  ! 4139: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbf34a001  ! 4141: SRL_I	srl 	%r18, 0x0001, %r31
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde42169  ! 4145: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb77c2401  ! 4146: MOVR_I	movre	%r16, 0x1, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56126  ! 4152: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e5a15d  ! 4153: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e40000  ! 4158: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_345:
	setx	0x420134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_202:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 4160: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e561ab  ! 4162: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_346:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_347:
	setx	0x400038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e48000  ! 4171: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_155:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 4176: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_348:
	setx	0x430204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4178: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e4e173  ! 4181: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_349:
	setx	0x400329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd4000  ! 4186: XNORcc_R	xnorcc 	%r21, %r0, %r29
cpu_intr_0_350:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e4c000  ! 4193: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e58000  ! 4197: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e40000  ! 4199: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_351:
	setx	0x400113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x42013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 4208: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e4c000  ! 4209: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_203:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 4214: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e46009  ! 4215: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_156:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_204:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 4221: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_353:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6240000  ! 4226: SUB_R	sub 	%r16, %r0, %r27
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e48000  ! 4232: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4c000  ! 4234: SAVE_R	save	%r19, %r0, %r28
	.word 0xbeacc000  ! 4239: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xb5e4202d  ! 4241: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_354:
	setx	0x400233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e092  ! 4246: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4a03f  ! 4250: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_157:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 4254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_205:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 4260: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe56027  ! 4264: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb33c7001  ! 4265: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xb7e44000  ! 4266: SAVE_R	save	%r17, %r0, %r27
	.word 0xb3e40000  ! 4267: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e5a04d  ! 4268: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e48000  ! 4271: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e58000  ! 4274: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_158:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbde58000  ! 4279: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_159:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_206:
	mov	0x0, %r14
	.word 0xfaf38e60  ! 4282: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb4b461f6  ! 4283: SUBCcc_I	orncc 	%r17, 0x01f6, %r26
	.word 0xb3e5609b  ! 4284: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xfadb84a0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb63521fc  ! 4288: SUBC_I	orn 	%r20, 0x01fc, %r27
T0_asi_reg_rd_161:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 4289: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_wr_207:
	mov	0x22, %r14
	.word 0xf2f38e60  ! 4290: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_208:
	mov	0x2e, %r14
	.word 0xf0f389e0  ! 4291: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5e1c6  ! 4296: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_355:
	setx	0x40003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb605c000  ! 4300: ADD_R	add 	%r23, %r0, %r27
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe52133  ! 4304: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e44000  ! 4307: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_356:
	setx	0x400229, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_209:
	mov	0x1, %r14
	.word 0xf2f38400  ! 4313: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5e4e108  ! 4314: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_357:
	setx	0x430201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_210:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 4318: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_358:
	setx	0x420228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb024c000  ! 4323: SUB_R	sub 	%r19, %r0, %r24
	.word 0xb3e42000  ! 4324: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e4605c  ! 4326: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_359:
	setx	0x430232, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_360:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1c9  ! 4337: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4c000  ! 4339: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e54000  ! 4341: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e5c000  ! 4346: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_361:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a521d0  ! 4351: SUBcc_I	subcc 	%r20, 0x01d0, %r26
T0_asi_reg_wr_211:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 4352: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 4355: SAVE_R	save	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb03ce18b  ! 4361: XNOR_I	xnor 	%r19, 0x018b, %r24
	.word 0x8194e1b0  ! 4363: WRPR_TPC_I	wrpr	%r19, 0x01b0, %tpc
T0_asi_reg_wr_212:
	mov	0x0, %r14
	.word 0xfef384a0  ! 4365: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7e5c000  ! 4366: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_362:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561e3  ! 4369: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_363:
	setx	0x410304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4372: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe421f9  ! 4375: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb6244000  ! 4377: SUB_R	sub 	%r17, %r0, %r27
	.word 0xb5e58000  ! 4380: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e56111  ! 4382: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4c000  ! 4383: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe5e1ca  ! 4389: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_213:
	mov	0x0, %r14
	.word 0xfaf389e0  ! 4392: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5e0a4  ! 4397: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_214:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 4398: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbbe521f7  ! 4400: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe521e1  ! 4402: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe54000  ! 4403: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e5a008  ! 4406: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe48000  ! 4408: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_163:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde4e166  ! 4427: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e460e9  ! 4430: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb8b4c000  ! 4432: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xb1e461cf  ! 4433: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_364:
	setx	0x41030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1349000  ! 4437: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xb0952123  ! 4439: ORcc_I	orcc 	%r20, 0x0123, %r24
	.word 0xb3e4e14a  ! 4441: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4e0ca  ! 4442: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde421ab  ! 4449: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e56144  ! 4452: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e42186  ! 4455: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe421cb  ! 4457: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e46107  ! 4461: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 4463: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_365:
	setx	0x410029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e4212e  ! 4468: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_366:
	setx	0x40022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad0000  ! 4471: ANDNcc_R	andncc 	%r20, %r0, %r28
cpu_intr_0_367:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e5c000  ! 4476: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e4c000  ! 4480: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e4616b  ! 4482: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe48000  ! 4483: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_216:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 4484: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb40d8000  ! 4488: AND_R	and 	%r22, %r0, %r26
	.word 0xb3e50000  ! 4490: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe40000  ! 4494: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_164:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe44000  ! 4502: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_217:
	mov	0x33, %r14
	.word 0xfaf38400  ! 4508: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_368:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2521ca  ! 4510: SUB_I	sub 	%r20, 0x01ca, %r30
	.word 0xb9e46166  ! 4512: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_369:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4517: RDPR_TSTATE	<illegal instruction>
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_370:
	setx	0x41021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_371:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494210a  ! 4527: ORcc_I	orcc 	%r16, 0x010a, %r26
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_165:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb004c000  ! 4533: ADD_R	add 	%r19, %r0, %r24
cpu_intr_0_372:
	setx	0x41030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_373:
	setx	0x41021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0c6  ! 4539: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_374:
	setx	0x40002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_375:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4547: SAVE_R	save	%r19, %r0, %r27
	.word 0xb2352082  ! 4551: ORN_I	orn 	%r20, 0x0082, %r25
T0_asi_reg_rd_166:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e521f3  ! 4554: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e58000  ! 4558: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_167:
	mov	0x37, %r14
	.word 0xf2db89e0  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e54000  ! 4561: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe42003  ! 4562: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, d)
	.word 0xb3e421ee  ! 4564: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e54000  ! 4565: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_218:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 4567: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfe4a036  ! 4569: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb08d4000  ! 4571: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xb9e48000  ! 4574: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_376:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_377:
	setx	0x410030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_378:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_379:
	setx	0x40000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e06f  ! 4583: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe44000  ! 4584: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_380:
	setx	0x40030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4587: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe521d4  ! 4590: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_381:
	setx	0x41012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_382:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_219:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 4601: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_220:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 4605: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe5e0f7  ! 4606: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb815c000  ! 4609: OR_R	or 	%r23, %r0, %r28
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_383:
	setx	0x45003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ade160  ! 4616: ANDNcc_I	andncc 	%r23, 0x0160, %r28
	.word 0xb7e4c000  ! 4622: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_384:
	setx	0x47013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_385:
	setx	0x470301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb0948000  ! 4626: ORcc_R	orcc 	%r18, %r0, %r24
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_221:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 4628: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_386:
	setx	0x46022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 32)
	.word 0xbbe56126  ! 4632: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a113  ! 4633: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 18)
	.word 0xb12db001  ! 4636: SLLX_I	sllx	%r22, 0x0001, %r24
cpu_intr_0_387:
	setx	0x460102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a133  ! 4640: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_168:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 4641: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1e5608f  ! 4642: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e44000  ! 4643: SAVE_R	save	%r17, %r0, %r26
	.word 0xbde58000  ! 4644: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4646: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_388:
	setx	0x46013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_389:
	setx	0x47030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_390:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_170:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4665: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb5e4e17d  ! 4669: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbe85603c  ! 4671: ADDcc_I	addcc 	%r21, 0x003c, %r31
	.word 0xb1e4c000  ! 4675: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_391:
	setx	0x440200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1b2  ! 4677: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_392:
	setx	0x440111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_171:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_393:
	setx	0x440013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_394:
	setx	0x460201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e5e18f  ! 4691: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe50000  ! 4694: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 4695: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5e48000  ! 4696: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_395:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_396:
	setx	0x45022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d7001  ! 4704: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xbfe5e18e  ! 4707: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe56001  ! 4709: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e56058  ! 4711: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4607f  ! 4717: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde48000  ! 4721: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe56048  ! 4725: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_224:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 4728: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_397:
	setx	0x470208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_172:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_225:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 4736: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e5e169  ! 4740: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe521e5  ! 4743: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_226:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 4744: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_227:
	mov	0x6, %r14
	.word 0xfef38e40  ! 4745: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 4746: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe44000  ! 4749: SAVE_R	save	%r17, %r0, %r31
	.word 0xb7e58000  ! 4751: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_398:
	setx	0x44021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_173:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 4759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_399:
	setx	0x45003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_228:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 4762: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_229:
	mov	0x3, %r14
	.word 0xfef384a0  ! 4767: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_400:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_230:
	mov	0x1b, %r14
	.word 0xfaf389e0  ! 4769: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde4a0cd  ! 4771: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_401:
	setx	0x44021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_402:
	setx	0x440012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e52163  ! 4786: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e17e  ! 4789: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde461c1  ! 4796: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e4a0ac  ! 4797: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde44000  ! 4798: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_403:
	setx	0x47033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_231:
	mov	0x28, %r14
	.word 0xfef38e80  ! 4803: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_404:
	setx	0x460319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_405:
	setx	0x440339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a027  ! 4811: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e40000  ! 4812: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e50000  ! 4815: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_406:
	setx	0x470025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4822: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_174:
	mov	0x27, %r14
	.word 0xf0db8e60  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e48000  ! 4827: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe4e087  ! 4831: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_175:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 4832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_232:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 4834: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde42129  ! 4840: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_407:
	setx	0x45003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4845: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e50000  ! 4846: SAVE_R	save	%r20, %r0, %r27
	.word 0xbbe50000  ! 4847: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe48000  ! 4849: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_176:
	mov	0x21, %r14
	.word 0xf2db89e0  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_408:
	setx	0x460022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e4e059  ! 4857: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde58000  ! 4861: SAVE_R	save	%r22, %r0, %r30
	.word 0xbd3c7001  ! 4862: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xb5e46155  ! 4863: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_177:
	mov	0x4, %r14
	.word 0xfadb8e60  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_178:
	mov	0x14, %r14
	.word 0xf6db8e60  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_233:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 4872: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbcace0f1  ! 4873: ANDNcc_I	andncc 	%r19, 0x00f1, %r30
	.word 0xbde5e186  ! 4874: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_409:
	setx	0x47032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460c5  ! 4878: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb41de1e9  ! 4882: XOR_I	xor 	%r23, 0x01e9, %r26
	.word 0xb3510000  ! 4883: RDPR_TICK	<illegal instruction>
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e461bd  ! 4887: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e46175  ! 4888: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_410:
	setx	0x450218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4890: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde4a1e3  ! 4892: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e5e0f5  ! 4896: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbe45213e  ! 4901: ADDC_I	addc 	%r20, 0x013e, %r31
T0_asi_reg_rd_179:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde4a03a  ! 4907: SAVE_I	save	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4210d  ! 4910: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb6b5e16e  ! 4914: SUBCcc_I	orncc 	%r23, 0x016e, %r27
	.word 0xb7e4a0e6  ! 4917: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_234:
	mov	0x27, %r14
	.word 0xf8f389e0  ! 4919: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd518000  ! 4922: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_rd_180:
	mov	0x2c, %r14
	.word 0xfadb8e60  ! 4924: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e50000  ! 4926: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_411:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e5e1d8  ! 4933: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_181:
	mov	0x2, %r14
	.word 0xf6db8e80  ! 4935: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_182:
	mov	0x5, %r14
	.word 0xf8db89e0  ! 4940: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5e58000  ! 4941: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e5c000  ! 4948: SAVE_R	save	%r23, %r0, %r25
	.word 0xbde4c000  ! 4949: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe5a1be  ! 4951: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5a1a3  ! 4955: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5c000  ! 4956: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe44000  ! 4961: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_235:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 4962: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe5e0a1  ! 4963: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_412:
	setx	0x44011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b54000  ! 4966: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xbde54000  ! 4972: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e560cb  ! 4980: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_413:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_236:
	mov	0x16, %r14
	.word 0xf0f38400  ! 4995: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_183:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
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
T3_asi_reg_wr_0:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb12de001  ! 2: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xfc754000  ! 5: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfe340000  ! 7: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf2758000  ! 9: STX_R	stx	%r25, [%r22 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 15)
	.word 0xf02ca124  ! 13: STB_I	stb	%r24, [%r18 + 0x0124]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_1:
	mov	0x1, %r14
	.word 0xf2f38400  ! 17: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb4b40000  ! 19: ORNcc_R	orncc 	%r16, %r0, %r26
T3_asi_reg_rd_0:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2340000  ! 22: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf4a5c020  ! 24: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xbe94c000  ! 25: ORcc_R	orcc 	%r19, %r0, %r31
T3_asi_reg_wr_2:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 29: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_0:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b560f5  ! 31: SUBCcc_I	orncc 	%r21, 0x00f5, %r24
	.word 0xf0ac4020  ! 34: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xbeb50000  ! 36: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xfa34e1e3  ! 37: STH_I	sth	%r29, [%r19 + 0x01e3]
	.word 0xf87521a6  ! 38: STX_I	stx	%r28, [%r20 + 0x01a6]
cpu_intr_3_1:
	setx	0x1d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_2:
	setx	0x1e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_3:
	setx	0x1d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_4:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_3:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 47: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe342017  ! 49: STH_I	sth	%r31, [%r16 + 0x0017]
	.word 0xfeb48020  ! 50: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	.word 0xfead0020  ! 51: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf8a5c020  ! 53: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_4:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 62: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_5:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfcb4a0ab  ! 71: STHA_I	stha	%r30, [%r18 + 0x00ab] %asi
	.word 0xb0242067  ! 72: SUB_I	sub 	%r16, 0x0067, %r24
T3_asi_reg_wr_5:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 75: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfcf420e2  ! 79: STXA_I	stxa	%r30, [%r16 + 0x00e2] %asi
T3_asi_reg_wr_6:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 80: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf42560ba  ! 81: STW_I	stw	%r26, [%r21 + 0x00ba]
cpu_intr_3_6:
	setx	0x2012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e16f  ! 84: STW_I	stw	%r29, [%r19 + 0x016f]
	ta	T_CHANGE_HPRIV
	.word 0xf8ada08c  ! 88: STBA_I	stba	%r28, [%r22 + 0x008c] %asi
	.word 0xf0352188  ! 89: STH_I	sth	%r24, [%r20 + 0x0188]
	.word 0xf274c000  ! 98: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_7:
	setx	0x1c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 36)
	.word 0xf4b4c020  ! 109: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198298a  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
T3_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xb1641800  ! 115: MOVcc_R	<illegal instruction>
cpu_intr_3_8:
	setx	0x1d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1d022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_7:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 121: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_10:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_11:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4254000  ! 124: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xb21d21be  ! 126: XOR_I	xor 	%r20, 0x01be, %r25
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_12:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf2248000  ! 132: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf8350000  ! 133: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf0a50020  ! 135: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 137: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb2a5a1a9  ! 138: SUBcc_I	subcc 	%r22, 0x01a9, %r25
cpu_intr_3_13:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_15:
	setx	0x1d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_16:
	setx	0x1e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb235c000  ! 146: SUBC_R	orn 	%r23, %r0, %r25
T3_asi_reg_rd_2:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f8a  ! 159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_17:
	setx	0x1d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad6114  ! 163: STBA_I	stba	%r30, [%r21 + 0x0114] %asi
T3_asi_reg_rd_3:
	mov	0x28, %r14
	.word 0xf8db89e0  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfc358000  ! 166: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfab4c020  ! 167: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc744000  ! 175: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb5641800  ! 179: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_9:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 181: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 186: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_18:
	setx	0x1d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_19:
	setx	0x1c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_20:
	setx	0x1d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e90  ! 196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e90, %hpstate
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 32)
	.word 0xf434a075  ! 200: STH_I	sth	%r26, [%r18 + 0x0075]
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b58  ! 202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b58, %hpstate
	.word 0xfcb5e1f4  ! 204: STHA_I	stha	%r30, [%r23 + 0x01f4] %asi
	.word 0xf6752023  ! 206: STX_I	stx	%r27, [%r20 + 0x0023]
	.word 0xf8ac8020  ! 207: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a4a  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xb3504000  ! 209: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf0b44020  ! 211: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	.word 0xbd500000  ! 213: RDPR_TPC	<illegal instruction>
	.word 0xbd353001  ! 218: SRLX_I	srlx	%r20, 0x0001, %r30
cpu_intr_3_21:
	setx	0x1f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_4:
	mov	0x35, %r14
	.word 0xf2db89e0  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf22561da  ! 226: STW_I	stw	%r25, [%r21 + 0x01da]
	ta	T_CHANGE_TO_TL0
	.word 0xb085e059  ! 229: ADDcc_I	addcc 	%r23, 0x0059, %r24
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 7)
	.word 0xfea4a149  ! 236: STWA_I	stwa	%r31, [%r18 + 0x0149] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0b40020  ! 242: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xfab5c020  ! 243: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_22:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	.word 0xbd2c9000  ! 250: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xfc340000  ! 251: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf8240000  ! 252: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf8f56081  ! 253: STXA_I	stxa	%r28, [%r21 + 0x0081] %asi
	.word 0xb41d60fd  ! 254: XOR_I	xor 	%r21, 0x00fd, %r26
cpu_intr_3_23:
	setx	0x1e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25a12d  ! 266: STW_I	stw	%r31, [%r22 + 0x012d]
T3_asi_reg_rd_5:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2ad4020  ! 269: STBA_R	stba	%r25, [%r21 + %r0] 0x01
cpu_intr_3_24:
	setx	0x1d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 277: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_25:
	setx	0x1d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa50020  ! 280: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xb32ca001  ! 281: SLL_I	sll 	%r18, 0x0001, %r25
T3_asi_reg_rd_6:
	mov	0x1e, %r14
	.word 0xfadb8e60  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb8ad6113  ! 292: ANDNcc_I	andncc 	%r21, 0x0113, %r28
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982952  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 38)
	.word 0xf034e184  ! 296: STH_I	sth	%r24, [%r19 + 0x0184]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_7:
	mov	0x22, %r14
	.word 0xf6db8e60  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_26:
	setx	0x1e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a460a3  ! 306: STWA_I	stwa	%r26, [%r17 + 0x00a3] %asi
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_27:
	setx	0x1e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_8:
	mov	0x11, %r14
	.word 0xf0db8e80  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0x899561c3  ! 317: WRPR_TICK_I	wrpr	%r21, 0x01c3, %tick
cpu_intr_3_28:
	setx	0x1e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c4000  ! 321: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfea46088  ! 323: STWA_I	stwa	%r31, [%r17 + 0x0088] %asi
cpu_intr_3_29:
	setx	0x1f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_30:
	setx	0x1e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_12:
	mov	0x2b, %r14
	.word 0xf8f389e0  ! 326: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfca56009  ! 330: STWA_I	stwa	%r30, [%r21 + 0x0009] %asi
	.word 0xba35e033  ! 331: ORN_I	orn 	%r23, 0x0033, %r29
T3_asi_reg_rd_9:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 333: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf6b4e188  ! 334: STHA_I	stha	%r27, [%r19 + 0x0188] %asi
	.word 0xf234a031  ! 335: STH_I	sth	%r25, [%r18 + 0x0031]
	.word 0xfe3461ac  ! 342: STH_I	sth	%r31, [%r17 + 0x01ac]
	.word 0xf0b5c020  ! 346: STHA_R	stha	%r24, [%r23 + %r0] 0x01
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 28)
	.word 0xbebda052  ! 350: XNORcc_I	xnorcc 	%r22, 0x0052, %r31
	.word 0xfe35a02e  ! 357: STH_I	sth	%r31, [%r22 + 0x002e]
	.word 0xb034610c  ! 358: SUBC_I	orn 	%r17, 0x010c, %r24
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c80  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c80, %hpstate
T3_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 360: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2254000  ! 368: STW_R	stw	%r25, [%r21 + %r0]
cpu_intr_3_31:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d20d9  ! 370: STB_I	stb	%r26, [%r20 + 0x00d9]
T3_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 372: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb284e10e  ! 373: ADDcc_I	addcc 	%r19, 0x010e, %r25
	.word 0xb634c000  ! 377: ORN_R	orn 	%r19, %r0, %r27
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 31)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f88  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f88, %hpstate
	.word 0xbe85a19a  ! 385: ADDcc_I	addcc 	%r22, 0x019a, %r31
	.word 0xf8742107  ! 387: STX_I	stx	%r28, [%r16 + 0x0107]
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_13:
	mov	0x24, %r14
	.word 0xf0f38e60  ! 395: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 19)
	.word 0xf435c000  ! 399: STH_R	sth	%r26, [%r23 + %r0]
cpu_intr_3_32:
	setx	0x1e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_33:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, b)
	.word 0xf42c4000  ! 410: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xb4bd216b  ! 412: XNORcc_I	xnorcc 	%r20, 0x016b, %r26
T3_asi_reg_rd_12:
	mov	0x12, %r14
	.word 0xf8db8400  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfcade0e4  ! 414: STBA_I	stba	%r30, [%r23 + 0x00e4] %asi
	.word 0xfeacc020  ! 415: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_14:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 420: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4a46022  ! 424: STWA_I	stwa	%r26, [%r17 + 0x0022] %asi
	.word 0xf8746158  ! 425: STX_I	stx	%r28, [%r17 + 0x0158]
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_15:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 429: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4b5e1ea  ! 431: STHA_I	stha	%r26, [%r23 + 0x01ea] %asi
	.word 0xf0244000  ! 432: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_rd_13:
	mov	0x27, %r14
	.word 0xf0db89e0  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xa1902001  ! 437: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf225e1b2  ! 438: STW_I	stw	%r25, [%r23 + 0x01b2]
cpu_intr_3_34:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_16:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 446: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_17:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 454: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf22c0000  ! 456: STB_R	stb	%r25, [%r16 + %r0]
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 7)
	.word 0xf02d0000  ! 458: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_14:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_18:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 464: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf82d0000  ! 466: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_15:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_16:
	mov	0x28, %r14
	.word 0xfedb8400  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_35:
	setx	0x23021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 478: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_36:
	setx	0x200319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 481: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf8a4a155  ! 484: STWA_I	stwa	%r28, [%r18 + 0x0155] %asi
	.word 0xf224c000  ! 486: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf2f4e1de  ! 487: STXA_I	stxa	%r25, [%r19 + 0x01de] %asi
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_21:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 491: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb815a167  ! 492: OR_I	or 	%r22, 0x0167, %r28
	.word 0xa1902002  ! 495: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_37:
	setx	0x220209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8940000  ! 500: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0xbb3c9000  ! 501: SRAX_R	srax	%r18, %r0, %r29
cpu_intr_3_38:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_39:
	setx	0x210026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b44020  ! 505: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xfc2d4000  ! 508: STB_R	stb	%r30, [%r21 + %r0]
T3_asi_reg_rd_17:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe2c8000  ! 513: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xb29cc000  ! 515: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xf6ac2195  ! 519: STBA_I	stba	%r27, [%r16 + 0x0195] %asi
	.word 0xfcac61cb  ! 522: STBA_I	stba	%r30, [%r17 + 0x01cb] %asi
	.word 0xfcac4020  ! 524: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xfe2c4000  ! 529: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa2cc000  ! 536: STB_R	stb	%r29, [%r19 + %r0]
T3_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 537: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf82c20a8  ! 539: STB_I	stb	%r28, [%r16 + 0x00a8]
T3_asi_reg_rd_18:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc2cc000  ! 541: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xbb355000  ! 544: SRLX_R	srlx	%r21, %r0, %r29
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_40:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535e001  ! 548: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xb97dc400  ! 549: MOVR_R	movre	%r23, %r0, %r28
T3_asi_reg_rd_19:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_23:
	mov	0x15, %r14
	.word 0xfcf38e80  ! 553: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf0ac8020  ! 554: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xfaf5a191  ! 557: STXA_I	stxa	%r29, [%r22 + 0x0191] %asi
	.word 0xf8758000  ! 565: STX_R	stx	%r28, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_20:
	mov	0x30, %r14
	.word 0xfedb8e60  ! 569: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6ac8020  ! 570: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xfeb4c020  ! 571: STHA_R	stha	%r31, [%r19 + %r0] 0x01
cpu_intr_3_41:
	setx	0x23032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_24:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 574: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_21:
	mov	0xb, %r14
	.word 0xf6db89e0  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf8746066  ! 582: STX_I	stx	%r28, [%r17 + 0x0066]
	.word 0xf2b54020  ! 583: STHA_R	stha	%r25, [%r21 + %r0] 0x01
cpu_intr_3_42:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac2068  ! 585: STBA_I	stba	%r27, [%r16 + 0x0068] %asi
	.word 0xf0ada04e  ! 586: STBA_I	stba	%r24, [%r22 + 0x004e] %asi
cpu_intr_3_43:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x210021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75a18e  ! 594: STX_I	stx	%r30, [%r22 + 0x018e]
	.word 0xf8f5a06a  ! 595: STXA_I	stxa	%r28, [%r22 + 0x006a] %asi
cpu_intr_3_45:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, f)
	.word 0xf4250000  ! 603: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf0b4609b  ! 608: STHA_I	stha	%r24, [%r17 + 0x009b] %asi
T3_asi_reg_wr_25:
	mov	0x9, %r14
	.word 0xfaf389e0  ! 617: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_22:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 17)
	.word 0xfca40020  ! 623: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
cpu_intr_3_46:
	setx	0x20023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b42012  ! 627: STHA_I	stha	%r26, [%r16 + 0x0012] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfab4e0f2  ! 630: STHA_I	stha	%r29, [%r19 + 0x00f2] %asi
cpu_intr_3_47:
	setx	0x220300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35601e  ! 633: STH_I	sth	%r30, [%r21 + 0x001e]
T3_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfc352143  ! 635: STH_I	sth	%r30, [%r20 + 0x0143]
	ta	T_CHANGE_HPRIV
	.word 0xb3643801  ! 639: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_26:
	mov	0x9, %r14
	.word 0xfef38e60  ! 640: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf234e1d2  ! 641: STH_I	sth	%r25, [%r19 + 0x01d2]
	.word 0xf42d8000  ! 642: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf22d6186  ! 644: STB_I	stb	%r25, [%r21 + 0x0186]
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 13)
	.word 0xfeada060  ! 648: STBA_I	stba	%r31, [%r22 + 0x0060] %asi
	.word 0xf4252048  ! 650: STW_I	stw	%r26, [%r20 + 0x0048]
cpu_intr_3_48:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_NONHPRIV
	.word 0xbc8d8000  ! 657: ANDcc_R	andcc 	%r22, %r0, %r30
T3_asi_reg_rd_24:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfaacc020  ! 659: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
cpu_intr_3_49:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 664: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xfa258000  ! 666: STW_R	stw	%r29, [%r22 + %r0]
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982882  ! 667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0882, %hpstate
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_50:
	setx	0x210120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_27:
	mov	0xb, %r14
	.word 0xf2f384a0  ! 681: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_51:
	setx	0x220039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x23013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 687: STW_R	stw	%r31, [%r22 + %r0]
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c18  ! 690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
	.word 0xf6242153  ! 691: STW_I	stw	%r27, [%r16 + 0x0153]
	.word 0xbc3c6070  ! 693: XNOR_I	xnor 	%r17, 0x0070, %r30
	.word 0xb6aca095  ! 695: ANDNcc_I	andncc 	%r18, 0x0095, %r27
T3_asi_reg_wr_28:
	mov	0x27, %r14
	.word 0xfef38e80  ! 698: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf42d60ad  ! 699: STB_I	stb	%r26, [%r21 + 0x00ad]
	.word 0xf2b5c020  ! 707: STHA_R	stha	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_29:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 708: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa356109  ! 710: STH_I	sth	%r29, [%r21 + 0x0109]
	.word 0xf8356085  ! 711: STH_I	sth	%r28, [%r21 + 0x0085]
	.word 0xba358000  ! 712: SUBC_R	orn 	%r22, %r0, %r29
T3_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 716: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
cpu_intr_3_53:
	setx	0x230212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 725: STX_R	stx	%r25, [%r23 + %r0]
T3_asi_reg_rd_25:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe344000  ! 727: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfab4a1d3  ! 729: STHA_I	stha	%r29, [%r18 + 0x01d3] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_31:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 731: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfaa44020  ! 734: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_32:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 738: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_26:
	mov	0x1e, %r14
	.word 0xf8db89e0  ! 739: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0x8995e1b6  ! 740: WRPR_TICK_I	wrpr	%r23, 0x01b6, %tick
T3_asi_reg_wr_33:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 741: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf634e048  ! 743: STH_I	sth	%r27, [%r19 + 0x0048]
	.word 0xf275a171  ! 744: STX_I	stx	%r25, [%r22 + 0x0171]
	.word 0xfa34209f  ! 745: STH_I	sth	%r29, [%r16 + 0x009f]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ec2  ! 746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec2, %hpstate
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 24)
	.word 0xf0b44020  ! 748: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	.word 0xfe2ce117  ! 752: STB_I	stb	%r31, [%r19 + 0x0117]
	.word 0xb8bd6145  ! 754: XNORcc_I	xnorcc 	%r21, 0x0145, %r28
	.word 0xf82d2083  ! 755: STB_I	stb	%r28, [%r20 + 0x0083]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 28)
	.word 0xf8354000  ! 762: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf4340000  ! 763: STH_R	sth	%r26, [%r16 + %r0]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 6)
	.word 0xb204e1e2  ! 767: ADD_I	add 	%r19, 0x01e2, %r25
	.word 0xbebd61bb  ! 768: XNORcc_I	xnorcc 	%r21, 0x01bb, %r31
cpu_intr_3_54:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca48000  ! 774: SUBcc_R	subcc 	%r18, %r0, %r30
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_55:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_56:
	setx	0x200029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 3)
	.word 0xbf353001  ! 786: SRLX_I	srlx	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeade03a  ! 793: STBA_I	stba	%r31, [%r23 + 0x003a] %asi
	.word 0xb234a13a  ! 794: SUBC_I	orn 	%r18, 0x013a, %r25
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 803: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_57:
	setx	0x20002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_35:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 810: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a80  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
cpu_intr_3_58:
	setx	0x230228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 815: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_59:
	setx	0x20000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f52  ! 818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
	.word 0xfa254000  ! 819: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf0f5604a  ! 821: STXA_I	stxa	%r24, [%r21 + 0x004a] %asi
T3_asi_reg_wr_36:
	mov	0x1d, %r14
	.word 0xf2f38400  ! 823: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_27:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_60:
	setx	0x220332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f56032  ! 830: STXA_I	stxa	%r25, [%r21 + 0x0032] %asi
	.word 0xfc2c60ba  ! 831: STB_I	stb	%r30, [%r17 + 0x00ba]
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, b)
	.word 0xfeb4e08b  ! 839: STHA_I	stha	%r31, [%r19 + 0x008b] %asi
T3_asi_reg_rd_28:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 842: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfcac21bb  ! 844: STBA_I	stba	%r30, [%r16 + 0x01bb] %asi
T3_asi_reg_wr_37:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 845: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4ad4020  ! 846: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_38:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 850: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_61:
	setx	0x20023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 852: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0acc020  ! 854: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xf22d8000  ! 856: STB_R	stb	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62d218c  ! 861: STB_I	stb	%r27, [%r20 + 0x018c]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 1)
	.word 0xf4a4611c  ! 870: STWA_I	stwa	%r26, [%r17 + 0x011c] %asi
T3_asi_reg_wr_40:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 874: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf6aca1e2  ! 881: STBA_I	stba	%r27, [%r18 + 0x01e2] %asi
	.word 0xb97ce401  ! 885: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xf8b5c020  ! 888: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xf224a088  ! 890: STW_I	stw	%r25, [%r18 + 0x0088]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_41:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 895: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2a48020  ! 896: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_42:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 901: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf8a58020  ! 904: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
cpu_intr_3_62:
	setx	0x22023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194205c  ! 908: WRPR_TPC_I	wrpr	%r16, 0x005c, %tpc
	.word 0xf0aca1b8  ! 909: STBA_I	stba	%r24, [%r18 + 0x01b8] %asi
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb53c1000  ! 913: SRAX_R	srax	%r16, %r0, %r26
T3_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 914: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe2c4000  ! 916: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xbd7d8400  ! 918: MOVR_R	movre	%r22, %r0, %r30
	.word 0x899421e4  ! 919: WRPR_TICK_I	wrpr	%r16, 0x01e4, %tick
cpu_intr_3_63:
	setx	0x270003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_44:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 926: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa75c000  ! 927: STX_R	stx	%r29, [%r23 + %r0]
cpu_intr_3_64:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d2160  ! 931: STB_I	stb	%r25, [%r20 + 0x0160]
T3_asi_reg_rd_30:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfe25c000  ! 936: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf42d60c4  ! 940: STB_I	stb	%r26, [%r21 + 0x00c4]
	.word 0xfa7461ef  ! 941: STX_I	stx	%r29, [%r17 + 0x01ef]
	.word 0xf074c000  ! 942: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfcac20a8  ! 944: STBA_I	stba	%r30, [%r16 + 0x00a8] %asi
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 3)
	.word 0xbc8d8000  ! 950: ANDcc_R	andcc 	%r22, %r0, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfa2d8000  ! 953: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf674e0b9  ! 956: STX_I	stx	%r27, [%r19 + 0x00b9]
cpu_intr_3_65:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5208b  ! 958: STHA_I	stha	%r31, [%r20 + 0x008b] %asi
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf4b48020  ! 960: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_31:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 966: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_33:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 969: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 15)
	.word 0xfc34a1ba  ! 975: STH_I	sth	%r30, [%r18 + 0x01ba]
	.word 0xf4aca02d  ! 979: STBA_I	stba	%r26, [%r18 + 0x002d] %asi
cpu_intr_3_66:
	setx	0x25022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004c000  ! 991: ADD_R	add 	%r19, %r0, %r24
	.word 0xb2bd8000  ! 992: XNORcc_R	xnorcc 	%r22, %r0, %r25
cpu_intr_3_67:
	setx	0x240116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_68:
	setx	0x270109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234a0dc  ! 999: STH_I	sth	%r25, [%r18 + 0x00dc]
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_69:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6754000  ! 1005: STX_R	stx	%r27, [%r21 + %r0]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 34)
	.word 0xf22d4000  ! 1007: STB_R	stb	%r25, [%r21 + %r0]
T3_asi_reg_wr_45:
	mov	0x2e, %r14
	.word 0xfef38400  ! 1008: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a12  ! 1009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a12, %hpstate
	.word 0xfcb52154  ! 1012: STHA_I	stha	%r30, [%r20 + 0x0154] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2520ff  ! 1016: STW_I	stw	%r29, [%r20 + 0x00ff]
cpu_intr_3_70:
	setx	0x240003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5a15b  ! 1019: STHA_I	stha	%r25, [%r22 + 0x015b] %asi
	.word 0xf22ce122  ! 1020: STB_I	stb	%r25, [%r19 + 0x0122]
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_71:
	setx	0x260334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ca04a  ! 1026: STB_I	stb	%r28, [%r18 + 0x004a]
T3_asi_reg_rd_34:
	mov	0x18, %r14
	.word 0xf4db89e0  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf0ad21a7  ! 1032: STBA_I	stba	%r24, [%r20 + 0x01a7] %asi
cpu_intr_3_72:
	setx	0x25012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x3, %r14
	.word 0xfef38e40  ! 1036: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_73:
	setx	0x25021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_74:
	setx	0x250026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5618b  ! 1056: STHA_I	stha	%r24, [%r21 + 0x018b] %asi
	.word 0xfa2dc000  ! 1057: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf4b5a106  ! 1059: STHA_I	stha	%r26, [%r22 + 0x0106] %asi
cpu_intr_3_75:
	setx	0x25033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x270315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac8020  ! 1067: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xfc75e190  ! 1068: STX_I	stx	%r30, [%r23 + 0x0190]
T3_asi_reg_wr_47:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 1069: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6ac6091  ! 1071: STBA_I	stba	%r27, [%r17 + 0x0091] %asi
T3_asi_reg_rd_35:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_48:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 1076: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2b58020  ! 1078: STHA_R	stha	%r25, [%r22 + %r0] 0x01
T3_asi_reg_rd_36:
	mov	0x35, %r14
	.word 0xf0db8e60  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb4b58000  ! 1084: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xfa2d4000  ! 1085: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf8f5611c  ! 1091: STXA_I	stxa	%r28, [%r21 + 0x011c] %asi
T3_asi_reg_wr_49:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1093: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6a44020  ! 1095: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_77:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 1097: STBA_R	stba	%r25, [%r20 + %r0] 0x01
cpu_intr_3_78:
	setx	0x27010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5c020  ! 1099: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_79:
	setx	0x24002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b0a  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0a, %hpstate
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_37:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf02de00e  ! 1108: STB_I	stb	%r24, [%r23 + 0x000e]
T3_asi_reg_rd_38:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 1109: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_39:
	mov	0x36, %r14
	.word 0xf6db89e0  ! 1112: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 8)
	.word 0xfcf4e1ea  ! 1115: STXA_I	stxa	%r30, [%r19 + 0x01ea] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfa354000  ! 1120: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_rd_40:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_50:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 1122: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_41:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 1125: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf83520d1  ! 1127: STH_I	sth	%r28, [%r20 + 0x00d1]
	.word 0xfc75200e  ! 1135: STX_I	stx	%r30, [%r20 + 0x000e]
	.word 0xb89421da  ! 1136: ORcc_I	orcc 	%r16, 0x01da, %r28
	.word 0xf425212f  ! 1139: STW_I	stw	%r26, [%r20 + 0x012f]
	.word 0xbb2db001  ! 1140: SLLX_I	sllx	%r22, 0x0001, %r29
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983842  ! 1141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
	.word 0xf2340000  ! 1142: STH_R	sth	%r25, [%r16 + %r0]
T3_asi_reg_wr_51:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 1143: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_80:
	setx	0x240032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234c000  ! 1149: SUBC_R	orn 	%r19, %r0, %r25
cpu_intr_3_81:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_82:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_83:
	setx	0x260133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_84:
	setx	0x240304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_85:
	setx	0x260300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 1159: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf07461c6  ! 1160: STX_I	stx	%r24, [%r17 + 0x01c6]
T3_asi_reg_wr_52:
	mov	0xe, %r14
	.word 0xf4f38e40  ! 1161: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0a42181  ! 1162: STWA_I	stwa	%r24, [%r16 + 0x0181] %asi
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_53:
	mov	0x19, %r14
	.word 0xfcf38e60  ! 1169: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_42:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6acc020  ! 1179: STBA_R	stba	%r27, [%r19 + %r0] 0x01
cpu_intr_3_86:
	setx	0x240133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e029  ! 1183: STH_I	sth	%r30, [%r19 + 0x0029]
	.word 0xf834c000  ! 1184: STH_R	sth	%r28, [%r19 + %r0]
cpu_intr_3_87:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_88:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ca029  ! 1191: STB_I	stb	%r29, [%r18 + 0x0029]
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983bc0  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc0, %hpstate
	.word 0xf2b50020  ! 1204: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xbd3ce001  ! 1207: SRA_I	sra 	%r19, 0x0001, %r30
T3_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 1208: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf234c000  ! 1212: STH_R	sth	%r25, [%r19 + %r0]
T3_asi_reg_rd_43:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf03460ca  ! 1214: STH_I	sth	%r24, [%r17 + 0x00ca]
T3_asi_reg_wr_55:
	mov	0x2d, %r14
	.word 0xfaf389e0  ! 1216: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_89:
	setx	0x27031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 1230: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xfef56173  ! 1232: STXA_I	stxa	%r31, [%r21 + 0x0173] %asi
cpu_intr_3_90:
	setx	0x26003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c20a9  ! 1234: STB_I	stb	%r30, [%r16 + 0x00a9]
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 11)
	.word 0xfc2d8000  ! 1239: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf22460ab  ! 1243: STW_I	stw	%r25, [%r17 + 0x00ab]
	ta	T_CHANGE_TO_TL1
	.word 0xfc35619f  ! 1245: STH_I	sth	%r30, [%r21 + 0x019f]
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_91:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x27010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f460fe  ! 1251: STXA_I	stxa	%r25, [%r17 + 0x00fe] %asi
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 1f)
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a58  ! 1253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
	.word 0xf6740000  ! 1254: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf0b44020  ! 1256: STHA_R	stha	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_56:
	mov	0x1a, %r14
	.word 0xf6f38e80  ! 1257: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfca5e175  ! 1258: STWA_I	stwa	%r30, [%r23 + 0x0175] %asi
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_93:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_94:
	setx	0x27003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 1262: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf42cc000  ! 1263: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfeb4c020  ! 1264: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_95:
	setx	0x25030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_96:
	setx	0x26001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac8020  ! 1270: STBA_R	stba	%r30, [%r18 + %r0] 0x01
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0a52139  ! 1273: STWA_I	stwa	%r24, [%r20 + 0x0139] %asi
T3_asi_reg_wr_57:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 1276: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_97:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_58:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 1284: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf6acc020  ! 1288: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xb0b561f1  ! 1290: SUBCcc_I	orncc 	%r21, 0x01f1, %r24
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_59:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 1301: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829c2  ! 1303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0xf434c000  ! 1305: STH_R	sth	%r26, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xbe144000  ! 1308: OR_R	or 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf0b5c020  ! 1311: STHA_R	stha	%r24, [%r23 + %r0] 0x01
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_60:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 1315: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf0a4a0df  ! 1316: STWA_I	stwa	%r24, [%r18 + 0x00df] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_98:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_99:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 1328: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_61:
	mov	0x6, %r14
	.word 0xfef38e40  ! 1329: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf875a159  ! 1330: STX_I	stx	%r28, [%r22 + 0x0159]
T3_asi_reg_wr_62:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 1331: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb68c615d  ! 1332: ANDcc_I	andcc 	%r17, 0x015d, %r27
T3_asi_reg_wr_63:
	mov	0x15, %r14
	.word 0xfaf38e40  ! 1333: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_100:
	setx	0x260024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_101:
	setx	0x26013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_102:
	setx	0x250132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_64:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 1339: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb60ce104  ! 1340: AND_I	and 	%r19, 0x0104, %r27
T3_asi_reg_rd_44:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc75616f  ! 1343: STX_I	stx	%r30, [%r21 + 0x016f]
T3_asi_reg_rd_45:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 1344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 1345: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf42d20dd  ! 1350: STB_I	stb	%r26, [%r20 + 0x00dd]
	.word 0xfea4e180  ! 1351: STWA_I	stwa	%r31, [%r19 + 0x0180] %asi
cpu_intr_3_103:
	setx	0x260011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfe7421f5  ! 1357: STX_I	stx	%r31, [%r16 + 0x01f5]
	.word 0xfcaca159  ! 1358: STBA_I	stba	%r30, [%r18 + 0x0159] %asi
	.word 0xfc2ca00b  ! 1360: STB_I	stb	%r30, [%r18 + 0x000b]
	.word 0xbc1dc000  ! 1363: XOR_R	xor 	%r23, %r0, %r30
	.word 0xf6250000  ! 1364: STW_R	stw	%r27, [%r20 + %r0]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_104:
	setx	0x25000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 1373: STX_R	stx	%r25, [%r22 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982980  ! 1380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0980, %hpstate
	.word 0xfa2ca09f  ! 1382: STB_I	stb	%r29, [%r18 + 0x009f]
	.word 0xf6758000  ! 1384: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfa2cc000  ! 1386: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf235e13c  ! 1389: STH_I	sth	%r25, [%r23 + 0x013c]
T3_asi_reg_rd_46:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_105:
	setx	0x29020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d4400  ! 1392: MOVR_R	movre	%r21, %r0, %r30
	.word 0xbead609d  ! 1397: ANDNcc_I	andncc 	%r21, 0x009d, %r31
T3_asi_reg_rd_47:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf22560c0  ! 1399: STW_I	stw	%r25, [%r21 + 0x00c0]
	.word 0xfcb4218d  ! 1400: STHA_I	stha	%r30, [%r16 + 0x018d] %asi
	.word 0xfaad0020  ! 1401: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_106:
	setx	0x290010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_107:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x280039, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_66:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 1416: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf8248000  ! 1419: STW_R	stw	%r28, [%r18 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_109:
	setx	0x290102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6b5a0e6  ! 1428: STHA_I	stha	%r27, [%r22 + 0x00e6] %asi
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_110:
	setx	0x2b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_111:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_67:
	mov	0xe, %r14
	.word 0xf2f38400  ! 1436: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfc24c000  ! 1437: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_68:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1442: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2b56179  ! 1444: STHA_I	stha	%r25, [%r21 + 0x0179] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf6b4a187  ! 1448: STHA_I	stha	%r27, [%r18 + 0x0187] %asi
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, d)
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 7)
	.word 0xf0248000  ! 1459: STW_R	stw	%r24, [%r18 + %r0]
cpu_intr_3_112:
	setx	0x290105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_113:
	setx	0x2a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 1468: STX_R	stx	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf8f520b2  ! 1472: STXA_I	stxa	%r28, [%r20 + 0x00b2] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb034e1d1  ! 1475: ORN_I	orn 	%r19, 0x01d1, %r24
cpu_intr_3_114:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_115:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_116:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_117:
	setx	0x2b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274e131  ! 1496: STX_I	stx	%r25, [%r19 + 0x0131]
T3_asi_reg_rd_48:
	mov	0x37, %r14
	.word 0xfcdb8e80  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4a560e4  ! 1498: STWA_I	stwa	%r26, [%r21 + 0x00e4] %asi
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_69:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1506: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_118:
	setx	0x280304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_49:
	mov	0x35, %r14
	.word 0xf2db8e60  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_119:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a159  ! 1516: STXA_I	stxa	%r25, [%r18 + 0x0159] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 1522: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf22c8000  ! 1523: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf434a044  ! 1524: STH_I	sth	%r26, [%r18 + 0x0044]
	.word 0xbca4e0fa  ! 1527: SUBcc_I	subcc 	%r19, 0x00fa, %r30
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_120:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829c2  ! 1532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
cpu_intr_3_121:
	setx	0x29002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 1534: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_122:
	setx	0x29001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a44020  ! 1537: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_123:
	setx	0x29011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_124:
	setx	0x280218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_52:
	mov	0x26, %r14
	.word 0xf0db8400  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0752191  ! 1543: STX_I	stx	%r24, [%r20 + 0x0191]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_70:
	mov	0x12, %r14
	.word 0xfcf38400  ! 1548: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8ad8020  ! 1549: STBA_R	stba	%r28, [%r22 + %r0] 0x01
T3_asi_reg_rd_53:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 1551: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_125:
	setx	0x2b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e03c  ! 1553: STH_I	sth	%r30, [%r19 + 0x003c]
T3_asi_reg_wr_71:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 1554: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2a4e1ac  ! 1557: STWA_I	stwa	%r25, [%r19 + 0x01ac] %asi
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_126:
	setx	0x28032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x290216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_72:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 1569: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, f)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 17)
	.word 0xf4358000  ! 1572: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xbc9c4000  ! 1573: XORcc_R	xorcc 	%r17, %r0, %r30
cpu_intr_3_128:
	setx	0x290024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_129:
	setx	0x290022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa75c000  ! 1583: STX_R	stx	%r29, [%r23 + %r0]
cpu_intr_3_130:
	setx	0x28011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5614b  ! 1587: STHA_I	stha	%r26, [%r21 + 0x014b] %asi
cpu_intr_3_132:
	setx	0x2a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982890  ! 1591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0890, %hpstate
	.word 0xfe2d2052  ! 1592: STB_I	stb	%r31, [%r20 + 0x0052]
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 29)
	.word 0xb935d000  ! 1594: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb8b4c000  ! 1595: SUBCcc_R	orncc 	%r19, %r0, %r28
cpu_intr_3_133:
	setx	0x29021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53cb001  ! 1597: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xbc0d8000  ! 1598: AND_R	and 	%r22, %r0, %r30
	.word 0xfeb5a1b7  ! 1600: STHA_I	stha	%r31, [%r22 + 0x01b7] %asi
	.word 0xb7346001  ! 1601: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0xf8f5e13c  ! 1603: STXA_I	stxa	%r28, [%r23 + 0x013c] %asi
	.word 0xf6aca081  ! 1604: STBA_I	stba	%r27, [%r18 + 0x0081] %asi
cpu_intr_3_134:
	setx	0x28031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_73:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbf3df001  ! 1612: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xfaada03b  ! 1614: STBA_I	stba	%r29, [%r22 + 0x003b] %asi
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf8a40020  ! 1616: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf0a5a133  ! 1618: STWA_I	stwa	%r24, [%r22 + 0x0133] %asi
	.word 0xfe25e14b  ! 1620: STW_I	stw	%r31, [%r23 + 0x014b]
	.word 0xf8ac6107  ! 1621: STBA_I	stba	%r28, [%r17 + 0x0107] %asi
cpu_intr_3_135:
	setx	0x2b0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a561a9  ! 1624: STWA_I	stwa	%r27, [%r21 + 0x01a9] %asi
	.word 0xf8740000  ! 1625: STX_R	stx	%r28, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198280a  ! 1628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080a, %hpstate
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 17)
	.word 0xfc748000  ! 1631: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf634e08a  ! 1635: STH_I	sth	%r27, [%r19 + 0x008a]
	.word 0xfe74c000  ! 1637: STX_R	stx	%r31, [%r19 + %r0]
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, f)
	.word 0xf8a4203e  ! 1639: STWA_I	stwa	%r28, [%r16 + 0x003e] %asi
T3_asi_reg_rd_54:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	.word 0xf6b52021  ! 1644: STHA_I	stha	%r27, [%r20 + 0x0021] %asi
cpu_intr_3_136:
	setx	0x290110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_137:
	setx	0x29030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_3_138:
	setx	0x2b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_139:
	setx	0x2a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_140:
	setx	0x280334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_74:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 1660: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa254000  ! 1662: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_rd_56:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 37)
	.word 0xf224e041  ! 1672: STW_I	stw	%r25, [%r19 + 0x0041]
cpu_intr_3_141:
	setx	0x2a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe740000  ! 1674: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_75:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 1678: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xf874203c  ! 1683: STX_I	stx	%r28, [%r16 + 0x003c]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982902  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0902, %hpstate
T3_asi_reg_rd_57:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1686: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfea5e0aa  ! 1688: STWA_I	stwa	%r31, [%r23 + 0x00aa] %asi
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2a4a13a  ! 1695: STWA_I	stwa	%r25, [%r18 + 0x013a] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf02421bd  ! 1701: STW_I	stw	%r24, [%r16 + 0x01bd]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1705: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf0b56018  ! 1706: STHA_I	stha	%r24, [%r21 + 0x0018] %asi
	.word 0xf6f4e1fd  ! 1707: STXA_I	stxa	%r27, [%r19 + 0x01fd] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_142:
	setx	0x2b0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bc4000  ! 1710: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xfaad8020  ! 1711: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc7420b4  ! 1716: STX_I	stx	%r30, [%r16 + 0x00b4]
	.word 0xf6756117  ! 1721: STX_I	stx	%r27, [%r21 + 0x0117]
	.word 0xb6bd8000  ! 1727: XNORcc_R	xnorcc 	%r22, %r0, %r27
cpu_intr_3_143:
	setx	0x280107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8350000  ! 1730: ORN_R	orn 	%r20, %r0, %r28
T3_asi_reg_wr_76:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 1734: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfaf5a125  ! 1736: STXA_I	stxa	%r29, [%r22 + 0x0125] %asi
	.word 0xb92c4000  ! 1740: SLL_R	sll 	%r17, %r0, %r28
	.word 0xf0242035  ! 1741: STW_I	stw	%r24, [%r16 + 0x0035]
cpu_intr_3_144:
	setx	0x29011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d4000  ! 1754: STB_R	stb	%r29, [%r21 + %r0]
T3_asi_reg_wr_77:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 1759: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_59:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_145:
	setx	0x2a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_78:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 1764: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfef5e106  ! 1765: STXA_I	stxa	%r31, [%r23 + 0x0106] %asi
	.word 0xf22de168  ! 1766: STB_I	stb	%r25, [%r23 + 0x0168]
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 17)
	.word 0xf4a4e124  ! 1772: STWA_I	stwa	%r26, [%r19 + 0x0124] %asi
T3_asi_reg_wr_79:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 1773: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_60:
	mov	0x28, %r14
	.word 0xf4db8e60  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_146:
	setx	0x290328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c2001  ! 1780: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xf8adc020  ! 1781: STBA_R	stba	%r28, [%r23 + %r0] 0x01
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_147:
	setx	0x29032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_80:
	mov	0x27, %r14
	.word 0xfcf384a0  ! 1786: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_148:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_61:
	mov	0x12, %r14
	.word 0xf2db8e80  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_149:
	setx	0x290121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x280103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 1801: STHA_R	stha	%r30, [%r18 + %r0] 0x01
cpu_intr_3_151:
	setx	0x280200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5609f  ! 1805: STWA_I	stwa	%r25, [%r21 + 0x009f] %asi
cpu_intr_3_152:
	setx	0x280125, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_81:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1807: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe8de013  ! 1808: ANDcc_I	andcc 	%r23, 0x0013, %r31
	.word 0xf875e1f8  ! 1809: STX_I	stx	%r28, [%r23 + 0x01f8]
	.word 0xbcbcc000  ! 1811: XNORcc_R	xnorcc 	%r19, %r0, %r30
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_62:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 1813: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf22560f7  ! 1817: STW_I	stw	%r25, [%r21 + 0x00f7]
	.word 0xf2b460ed  ! 1818: STHA_I	stha	%r25, [%r17 + 0x00ed] %asi
	.word 0xf4354000  ! 1820: STH_R	sth	%r26, [%r21 + %r0]
T3_asi_reg_wr_82:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1826: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6b58020  ! 1828: STHA_R	stha	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_63:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 1831: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf8254000  ! 1832: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf4a46015  ! 1833: STWA_I	stwa	%r26, [%r17 + 0x0015] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfaa54020  ! 1835: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xb97c8400  ! 1837: MOVR_R	movre	%r18, %r0, %r28
	.word 0xf624e1fa  ! 1840: STW_I	stw	%r27, [%r19 + 0x01fa]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4b5c020  ! 1843: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_64:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 1845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc250000  ! 1846: STW_R	stw	%r30, [%r20 + %r0]
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2a44020  ! 1852: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b5219c  ! 1856: STHA_I	stha	%r25, [%r20 + 0x019c] %asi
	.word 0xb20c8000  ! 1857: AND_R	and 	%r18, %r0, %r25
	.word 0xf6750000  ! 1858: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xfa754000  ! 1859: STX_R	stx	%r29, [%r21 + %r0]
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982888  ! 1860: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0888, %hpstate
cpu_intr_3_153:
	setx	0x2c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d4000  ! 1862: STB_R	stb	%r31, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfcb5c020  ! 1868: STHA_R	stha	%r30, [%r23 + %r0] 0x01
T3_asi_reg_rd_65:
	mov	0x36, %r14
	.word 0xf4db8e80  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_154:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_155:
	setx	0x2f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_84:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 1878: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfa354000  ! 1882: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb814a166  ! 1885: OR_I	or 	%r18, 0x0166, %r28
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982852  ! 1886: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0xfe24c000  ! 1888: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfc25606c  ! 1891: STW_I	stw	%r30, [%r21 + 0x006c]
	.word 0xf8f46134  ! 1892: STXA_I	stxa	%r28, [%r17 + 0x0134] %asi
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0ac2191  ! 1899: STBA_I	stba	%r24, [%r16 + 0x0191] %asi
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, a)
	.word 0xf824a181  ! 1901: STW_I	stw	%r28, [%r18 + 0x0181]
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2ad4020  ! 1910: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_85:
	mov	0x13, %r14
	.word 0xf4f38400  ! 1913: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	.word 0xfaf4218c  ! 1916: STXA_I	stxa	%r29, [%r16 + 0x018c] %asi
	.word 0xf2354000  ! 1917: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xfea460aa  ! 1919: STWA_I	stwa	%r31, [%r17 + 0x00aa] %asi
T3_asi_reg_rd_66:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb88dc000  ! 1921: ANDcc_R	andcc 	%r23, %r0, %r28
cpu_intr_3_156:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 33)
	.word 0xba45e142  ! 1925: ADDC_I	addc 	%r23, 0x0142, %r29
	.word 0xfa2c4000  ! 1926: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xfe246113  ! 1929: STW_I	stw	%r31, [%r17 + 0x0113]
T3_asi_reg_wr_86:
	mov	0x36, %r14
	.word 0xfef38e60  ! 1932: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf8b5c020  ! 1934: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_67:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_157:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_158:
	setx	0x2f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b56065  ! 1942: ORNcc_I	orncc 	%r21, 0x0065, %r26
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_159:
	setx	0x2d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac21a2  ! 1948: STBA_I	stba	%r28, [%r16 + 0x01a2] %asi
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 36)
	.word 0xf42cc000  ! 1953: STB_R	stb	%r26, [%r19 + %r0]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_68:
	mov	0x2c, %r14
	.word 0xf4db8400  ! 1956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf62c2155  ! 1958: STB_I	stb	%r27, [%r16 + 0x0155]
	.word 0xf4a58020  ! 1959: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0x83952180  ! 1961: WRPR_TNPC_I	wrpr	%r20, 0x0180, %tnpc
	.word 0xfa2d6023  ! 1967: STB_I	stb	%r29, [%r21 + 0x0023]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc2da07a  ! 1970: STB_I	stb	%r30, [%r22 + 0x007a]
	.word 0xfab4e0de  ! 1971: STHA_I	stha	%r29, [%r19 + 0x00de] %asi
T3_asi_reg_wr_87:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 1973: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_160:
	setx	0x2f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 1979: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbac44000  ! 1982: ADDCcc_R	addccc 	%r17, %r0, %r29
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_69:
	mov	0x1f, %r14
	.word 0xfedb8e60  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_89:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 1985: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 34)
	.word 0xf2ad6145  ! 1988: STBA_I	stba	%r25, [%r21 + 0x0145] %asi
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_161:
	setx	0x2f0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a58020  ! 1995: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xb68c0000  ! 1997: ANDcc_R	andcc 	%r16, %r0, %r27
T3_asi_reg_rd_70:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_90:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2002: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x8795e1ee  ! 2003: WRPR_TT_I	wrpr	%r23, 0x01ee, %tt
T3_asi_reg_rd_71:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf4ad21e4  ! 2008: STBA_I	stba	%r26, [%r20 + 0x01e4] %asi
cpu_intr_3_162:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 2011: STB_R	stb	%r29, [%r22 + %r0]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_163:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_91:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2018: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf2256014  ! 2023: STW_I	stw	%r25, [%r21 + 0x0014]
	.word 0xf4348000  ! 2024: STH_R	sth	%r26, [%r18 + %r0]
cpu_intr_3_164:
	setx	0x2f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f560c5  ! 2028: STXA_I	stxa	%r24, [%r21 + 0x00c5] %asi
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_72:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 2032: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf6a4603b  ! 2033: STWA_I	stwa	%r27, [%r17 + 0x003b] %asi
	.word 0xf42cc000  ! 2036: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfcb4e034  ! 2037: STHA_I	stha	%r30, [%r19 + 0x0034] %asi
cpu_intr_3_165:
	setx	0x2f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74a04f  ! 2041: STX_I	stx	%r31, [%r18 + 0x004f]
	.word 0xf6a4c020  ! 2042: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 3)
	.word 0xfcaca17b  ! 2046: STBA_I	stba	%r30, [%r18 + 0x017b] %asi
	ta	T_CHANGE_HPRIV
	.word 0xb4b54000  ! 2049: SUBCcc_R	orncc 	%r21, %r0, %r26
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_166:
	setx	0x2d020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_92:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 2055: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_167:
	setx	0x2f0235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0x35, %r14
	.word 0xf0db8e60  ! 2059: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_74:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4258000  ! 2061: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_168:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5e0dd  ! 2063: STWA_I	stwa	%r27, [%r23 + 0x00dd] %asi
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 8)
	.word 0xfc3520a7  ! 2065: STH_I	sth	%r30, [%r20 + 0x00a7]
T3_asi_reg_wr_93:
	mov	0x31, %r14
	.word 0xfef38e40  ! 2067: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_94:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 2068: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_95:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 2071: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2a54020  ! 2078: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf6a561c7  ! 2080: STWA_I	stwa	%r27, [%r21 + 0x01c7] %asi
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcf5e18e  ! 2083: STXA_I	stxa	%r30, [%r23 + 0x018e] %asi
	.word 0xfeaca0f8  ! 2084: STBA_I	stba	%r31, [%r18 + 0x00f8] %asi
	.word 0xfa2d60fe  ! 2088: STB_I	stb	%r29, [%r21 + 0x00fe]
cpu_intr_3_169:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_170:
	setx	0x2e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f88  ! 2101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f88, %hpstate
	.word 0xfaad611a  ! 2102: STBA_I	stba	%r29, [%r21 + 0x011a] %asi
	.word 0xfe34a074  ! 2104: STH_I	sth	%r31, [%r18 + 0x0074]
	.word 0xfc75613c  ! 2105: STX_I	stx	%r30, [%r21 + 0x013c]
	.word 0xfc2c20e2  ! 2107: STB_I	stb	%r30, [%r16 + 0x00e2]
	.word 0xf625a086  ! 2108: STW_I	stw	%r27, [%r22 + 0x0086]
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf675a0b6  ! 2110: STX_I	stx	%r27, [%r22 + 0x00b6]
cpu_intr_3_171:
	setx	0x2e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc346144  ! 2112: STH_I	sth	%r30, [%r17 + 0x0144]
	.word 0xf8758000  ! 2117: STX_R	stx	%r28, [%r22 + %r0]
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_172:
	setx	0x2f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_96:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 2127: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xf62c0000  ! 2129: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfca4a0dc  ! 2130: STWA_I	stwa	%r30, [%r18 + 0x00dc] %asi
	.word 0xf825c000  ! 2131: STW_R	stw	%r28, [%r23 + %r0]
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_173:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 26)
	.word 0xbb358000  ! 2147: SRL_R	srl 	%r22, %r0, %r29
	.word 0xfcaca05d  ! 2148: STBA_I	stba	%r30, [%r18 + 0x005d] %asi
	.word 0xb435c000  ! 2149: SUBC_R	orn 	%r23, %r0, %r26
T3_asi_reg_rd_75:
	mov	0x5, %r14
	.word 0xf4db8e80  ! 2155: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_76:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a42  ! 2161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_174:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 2168: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf02cc000  ! 2170: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfa75a0ab  ! 2171: STX_I	stx	%r29, [%r22 + 0x00ab]
	.word 0xf2a4a087  ! 2172: STWA_I	stwa	%r25, [%r18 + 0x0087] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_176:
	setx	0x2e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 31)
	.word 0xba9c8000  ! 2176: XORcc_R	xorcc 	%r18, %r0, %r29
	.word 0xb52dd000  ! 2177: SLLX_R	sllx	%r23, %r0, %r26
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_98:
	mov	0x2c, %r14
	.word 0xf8f38e80  ! 2183: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2750000  ! 2187: STX_R	stx	%r25, [%r20 + %r0]
T3_asi_reg_wr_99:
	mov	0x26, %r14
	.word 0xf6f38400  ! 2188: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6ade056  ! 2189: STBA_I	stba	%r27, [%r23 + 0x0056] %asi
T3_asi_reg_wr_100:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 2198: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf035c000  ! 2199: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_wr_101:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 2201: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_102:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2202: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_77:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_177:
	setx	0x2e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_178:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b40020  ! 2213: STHA_R	stha	%r25, [%r16 + %r0] 0x01
cpu_intr_3_179:
	setx	0x2c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5601a  ! 2215: STWA_I	stwa	%r25, [%r21 + 0x001a] %asi
T3_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 2216: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 20)
	.word 0xfa746045  ! 2226: STX_I	stx	%r29, [%r17 + 0x0045]
T3_asi_reg_wr_104:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 2229: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_180:
	setx	0x2c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b5e09f  ! 2234: ORNcc_I	orncc 	%r23, 0x009f, %r24
T3_asi_reg_wr_105:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2235: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6b50020  ! 2236: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_106:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2237: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_78:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 2240: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf62de001  ! 2244: STB_I	stb	%r27, [%r23 + 0x0001]
	.word 0xf8ace1ee  ! 2245: STBA_I	stba	%r28, [%r19 + 0x01ee] %asi
	.word 0xfc2d21a3  ! 2246: STB_I	stb	%r30, [%r20 + 0x01a3]
	.word 0xf034612f  ! 2248: STH_I	sth	%r24, [%r17 + 0x012f]
cpu_intr_3_181:
	setx	0x2c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c608c  ! 2251: STB_I	stb	%r31, [%r17 + 0x008c]
	.word 0xf034a1d4  ! 2253: STH_I	sth	%r24, [%r18 + 0x01d4]
cpu_intr_3_182:
	setx	0x2d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 2255: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 24)
	.word 0xfa75a0f5  ! 2260: STX_I	stx	%r29, [%r22 + 0x00f5]
	.word 0xb4c5e18d  ! 2261: ADDCcc_I	addccc 	%r23, 0x018d, %r26
T3_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 2262: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 2263: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 35)
	.word 0x8595a1fe  ! 2268: WRPR_TSTATE_I	wrpr	%r22, 0x01fe, %tstate
	.word 0xb13c1000  ! 2269: SRAX_R	srax	%r16, %r0, %r24
T3_asi_reg_wr_108:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 2270: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_183:
	setx	0x2d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_184:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_185:
	setx	0x2f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_80:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b08  ! 2284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
	.word 0xfab48020  ! 2285: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_81:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe35a010  ! 2292: STH_I	sth	%r31, [%r22 + 0x0010]
	ta	T_CHANGE_TO_TL1
	.word 0xf2ac202a  ! 2296: STBA_I	stba	%r25, [%r16 + 0x002a] %asi
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_NONHPRIV
	.word 0xfe75e13c  ! 2300: STX_I	stx	%r31, [%r23 + 0x013c]
	.word 0xf8a50020  ! 2301: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_186:
	setx	0x2f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_109:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 2311: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbd359000  ! 2312: SRLX_R	srlx	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0350000  ! 2319: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf4a5c020  ! 2320: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xfc25c000  ! 2321: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfe344000  ! 2325: STH_R	sth	%r31, [%r17 + %r0]
T3_asi_reg_rd_83:
	mov	0x20, %r14
	.word 0xf4db8400  ! 2326: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 14)
	.word 0xb3480000  ! 2328: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf624e1bd  ! 2329: STW_I	stw	%r27, [%r19 + 0x01bd]
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 12)
	.word 0xf82cc000  ! 2333: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_187:
	setx	0x30011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 2337: STHA_R	stha	%r29, [%r21 + %r0] 0x01
cpu_intr_3_188:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_110:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2341: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_84:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_189:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d4000  ! 2352: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xfe2d0000  ! 2353: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_rd_85:
	mov	0xd, %r14
	.word 0xfcdb89e0  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe252119  ! 2361: STW_I	stw	%r31, [%r20 + 0x0119]
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa25c000  ! 2363: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_86:
	mov	0x24, %r14
	.word 0xf2db89e0  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfcace166  ! 2365: STBA_I	stba	%r30, [%r19 + 0x0166] %asi
	.word 0xf424e0f5  ! 2368: STW_I	stw	%r26, [%r19 + 0x00f5]
	.word 0xbabd0000  ! 2369: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xf22d8000  ! 2374: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xba45e1a8  ! 2378: ADDC_I	addc 	%r23, 0x01a8, %r29
	.word 0xb9641800  ! 2379: MOVcc_R	<illegal instruction>
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, c)
	.word 0xf2748000  ! 2386: STX_R	stx	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe358000  ! 2388: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xbe142012  ! 2390: OR_I	or 	%r16, 0x0012, %r31
cpu_intr_3_190:
	setx	0x300306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ca001  ! 2393: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xf42da12f  ! 2397: STB_I	stb	%r26, [%r22 + 0x012f]
	.word 0xba84c000  ! 2398: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xf6746192  ! 2400: STX_I	stx	%r27, [%r17 + 0x0192]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 6)
	.word 0xf8344000  ! 2402: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf02de013  ! 2403: STB_I	stb	%r24, [%r23 + 0x0013]
	.word 0xf034a1a5  ! 2404: STH_I	sth	%r24, [%r18 + 0x01a5]
T3_asi_reg_rd_87:
	mov	0x35, %r14
	.word 0xfcdb8e60  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_191:
	setx	0x320111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2410: RDPR_PIL	<illegal instruction>
	.word 0xf024c000  ! 2413: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf42d2119  ! 2415: STB_I	stb	%r26, [%r20 + 0x0119]
cpu_intr_3_192:
	setx	0x31011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_88:
	mov	0x23, %r14
	.word 0xf8db84a0  ! 2421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf834a0a2  ! 2423: STH_I	sth	%r28, [%r18 + 0x00a2]
cpu_intr_3_193:
	setx	0x32031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x320211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_89:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_111:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 2433: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_90:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 2435: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfe24c000  ! 2436: STW_R	stw	%r31, [%r19 + %r0]
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfa75a0ad  ! 2440: STX_I	stx	%r29, [%r22 + 0x00ad]
cpu_intr_3_195:
	setx	0x310213, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2447: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8a40020  ! 2449: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf824e12d  ! 2450: STW_I	stw	%r28, [%r19 + 0x012d]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb50020  ! 2455: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4344000  ! 2458: STH_R	sth	%r26, [%r17 + %r0]
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_196:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfca4a036  ! 2468: STWA_I	stwa	%r30, [%r18 + 0x0036] %asi
	.word 0xf0aca1ef  ! 2469: STBA_I	stba	%r24, [%r18 + 0x01ef] %asi
T3_asi_reg_wr_113:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 2470: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf424a0ba  ! 2471: STW_I	stw	%r26, [%r18 + 0x00ba]
T3_asi_reg_rd_91:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 2473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_114:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 2485: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
cpu_intr_3_197:
	setx	0x32022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_115:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 2493: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xfaf5e07a  ! 2495: STXA_I	stxa	%r29, [%r23 + 0x007a] %asi
	.word 0xf27420a7  ! 2496: STX_I	stx	%r25, [%r16 + 0x00a7]
cpu_intr_3_198:
	setx	0x31030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca58020  ! 2503: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
T3_asi_reg_wr_116:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 2505: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_199:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_92:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_201:
	setx	0x33022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fd8  ! 2514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd8, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xfc2de17c  ! 2522: STB_I	stb	%r30, [%r23 + 0x017c]
cpu_intr_3_202:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 2526: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf82da066  ! 2531: STB_I	stb	%r28, [%r22 + 0x0066]
cpu_intr_3_203:
	setx	0x32031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_93:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf2a40020  ! 2534: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
cpu_intr_3_204:
	setx	0x31032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_205:
	setx	0x330317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x26, %r14
	.word 0xf6db8e80  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_206:
	setx	0x310109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe742128  ! 2540: STX_I	stx	%r31, [%r16 + 0x0128]
T3_asi_reg_wr_117:
	mov	0x4, %r14
	.word 0xfcf38400  ! 2548: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_207:
	setx	0x32033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc748000  ! 2552: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf42d616a  ! 2553: STB_I	stb	%r26, [%r21 + 0x016a]
T3_asi_reg_rd_95:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 2557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_96:
	mov	0x7, %r14
	.word 0xfedb8e80  ! 2558: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_118:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 2560: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf82c6175  ! 2562: STB_I	stb	%r28, [%r17 + 0x0175]
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_119:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 2574: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_208:
	setx	0x31012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 15)
	.word 0xb6bc0000  ! 2585: XNORcc_R	xnorcc 	%r16, %r0, %r27
T3_asi_reg_wr_120:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 2589: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfab4c020  ! 2590: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfa2520ea  ! 2591: STW_I	stw	%r29, [%r20 + 0x00ea]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 2598: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e02  ! 2599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e02, %hpstate
T3_asi_reg_rd_97:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 2604: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb4ac0000  ! 2607: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xb8ac8000  ! 2608: ANDNcc_R	andncc 	%r18, %r0, %r28
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2b5a03e  ! 2610: STHA_I	stha	%r25, [%r22 + 0x003e] %asi
T3_asi_reg_wr_122:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 2611: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4348000  ! 2613: ORN_R	orn 	%r18, %r0, %r26
	.word 0xfcad0020  ! 2614: STBA_R	stba	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_123:
	mov	0x24, %r14
	.word 0xfcf384a0  ! 2616: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_209:
	setx	0x33021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_98:
	mov	0x23, %r14
	.word 0xf6db8400  ! 2620: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbcc52076  ! 2626: ADDCcc_I	addccc 	%r20, 0x0076, %r30
	.word 0xf2b4c020  ! 2627: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xf6750000  ! 2628: STX_R	stx	%r27, [%r20 + %r0]
cpu_intr_3_210:
	setx	0x300338, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e4a  ! 2632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4a, %hpstate
	.word 0xb73c9000  ! 2636: SRAX_R	srax	%r18, %r0, %r27
	.word 0xfa246174  ! 2638: STW_I	stw	%r29, [%r17 + 0x0174]
	.word 0xf4254000  ! 2639: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf62c8000  ! 2648: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_99:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb42d0000  ! 2658: ANDN_R	andn 	%r20, %r0, %r26
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xfea40020  ! 2661: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xfef42141  ! 2663: STXA_I	stxa	%r31, [%r16 + 0x0141] %asi
T3_asi_reg_wr_124:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 2664: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_211:
	setx	0x310021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 1)
	.word 0xfab520f1  ! 2669: STHA_I	stha	%r29, [%r20 + 0x00f1] %asi
	.word 0xf074a079  ! 2672: STX_I	stx	%r24, [%r18 + 0x0079]
cpu_intr_3_212:
	setx	0x330123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_100:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfe2d0000  ! 2678: STB_R	stb	%r31, [%r20 + %r0]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0750000  ! 2682: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfe25a18e  ! 2684: STW_I	stw	%r31, [%r22 + 0x018e]
cpu_intr_3_213:
	setx	0x300127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_125:
	mov	0x1e, %r14
	.word 0xf8f38400  ! 2686: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_214:
	setx	0x320024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc348000  ! 2693: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_215:
	setx	0x300010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_216:
	setx	0x21, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_101:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4746036  ! 2704: STX_I	stx	%r26, [%r17 + 0x0036]
T3_asi_reg_wr_126:
	mov	0xa, %r14
	.word 0xfaf38e80  ! 2707: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfe350000  ! 2709: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_wr_127:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 2710: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_128:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 2711: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0x8d94a0fc  ! 2712: WRPR_PSTATE_I	wrpr	%r18, 0x00fc, %pstate
T3_asi_reg_rd_102:
	mov	0x27, %r14
	.word 0xf6db84a0  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_129:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 2717: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfab48020  ! 2719: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf024e1fe  ! 2723: STW_I	stw	%r24, [%r19 + 0x01fe]
T3_asi_reg_rd_103:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf2a560f6  ! 2725: STWA_I	stwa	%r25, [%r21 + 0x00f6] %asi
cpu_intr_3_217:
	setx	0x330303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 26)
	.word 0xf6b44020  ! 2728: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf62da0bf  ! 2731: STB_I	stb	%r27, [%r22 + 0x00bf]
cpu_intr_3_218:
	setx	0x31000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5a001  ! 2733: STHA_I	stha	%r30, [%r22 + 0x0001] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_219:
	setx	0x300236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, d)
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 22)
	.word 0xbc3de117  ! 2743: XNOR_I	xnor 	%r23, 0x0117, %r30
	.word 0xfcb40020  ! 2744: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfab48020  ! 2749: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf4ac617c  ! 2751: STBA_I	stba	%r26, [%r17 + 0x017c] %asi
	.word 0xfab48020  ! 2753: STHA_R	stha	%r29, [%r18 + %r0] 0x01
cpu_intr_3_220:
	setx	0x330027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa2d6088  ! 2763: STB_I	stb	%r29, [%r21 + 0x0088]
	.word 0xb695e0ed  ! 2774: ORcc_I	orcc 	%r23, 0x00ed, %r27
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xb8346116  ! 2781: ORN_I	orn 	%r17, 0x0116, %r28
	.word 0xfe35203a  ! 2782: STH_I	sth	%r31, [%r20 + 0x003a]
	.word 0xf8246111  ! 2786: STW_I	stw	%r28, [%r17 + 0x0111]
T3_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 2788: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbd2cc000  ! 2789: SLL_R	sll 	%r19, %r0, %r30
cpu_intr_3_221:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_222:
	setx	0x340018, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983902  ! 2792: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1902, %hpstate
	.word 0xf0a5617e  ! 2796: STWA_I	stwa	%r24, [%r21 + 0x017e] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_223:
	setx	0x360016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_224:
	setx	0x360335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b58020  ! 2804: STHA_R	stha	%r27, [%r22 + %r0] 0x01
cpu_intr_3_225:
	setx	0x370114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 2807: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf22c0000  ! 2809: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfe346133  ! 2810: STH_I	sth	%r31, [%r17 + 0x0133]
	.word 0xf234c000  ! 2811: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf82d8000  ! 2812: STB_R	stb	%r28, [%r22 + %r0]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 27)
	.word 0xbf3d0000  ! 2817: SRA_R	sra 	%r20, %r0, %r31
	.word 0xf8b52124  ! 2820: STHA_I	stha	%r28, [%r20 + 0x0124] %asi
	.word 0xfa2cc000  ! 2822: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf425e1e6  ! 2823: STW_I	stw	%r26, [%r23 + 0x01e6]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_226:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e041  ! 2834: STHA_I	stha	%r28, [%r23 + 0x0041] %asi
	.word 0xf8354000  ! 2835: STH_R	sth	%r28, [%r21 + %r0]
T3_asi_reg_rd_104:
	mov	0x26, %r14
	.word 0xf2db8400  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4240000  ! 2840: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf4b48020  ! 2841: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb41c0000  ! 2843: XOR_R	xor 	%r16, %r0, %r26
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_227:
	setx	0x36001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5e091  ! 2850: STWA_I	stwa	%r27, [%r23 + 0x0091] %asi
cpu_intr_3_228:
	setx	0x370339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_229:
	setx	0x370117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe254000  ! 2853: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf225e146  ! 2854: STW_I	stw	%r25, [%r23 + 0x0146]
	.word 0xbe8da1b7  ! 2856: ANDcc_I	andcc 	%r22, 0x01b7, %r31
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_105:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 2861: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02c8000  ! 2874: STB_R	stb	%r24, [%r18 + %r0]
T3_asi_reg_rd_106:
	mov	0x4, %r14
	.word 0xfadb8e60  ! 2875: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 18)
	.word 0xb08d8000  ! 2879: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xf22ca19c  ! 2880: STB_I	stb	%r25, [%r18 + 0x019c]
T3_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 2882: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf63461f0  ! 2887: STH_I	sth	%r27, [%r17 + 0x01f0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfaad61c8  ! 2894: STBA_I	stba	%r29, [%r21 + 0x01c8] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 28)
	.word 0xf42d211e  ! 2899: STB_I	stb	%r26, [%r20 + 0x011e]
	.word 0xf234a08d  ! 2903: STH_I	sth	%r25, [%r18 + 0x008d]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_230:
	setx	0x370237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075a0c4  ! 2909: STX_I	stx	%r24, [%r22 + 0x00c4]
	.word 0xb3540000  ! 2910: RDPR_GL	rdpr	%-, %r25
	.word 0xfe25a091  ! 2911: STW_I	stw	%r31, [%r22 + 0x0091]
	.word 0xf824a1b0  ! 2912: STW_I	stw	%r28, [%r18 + 0x01b0]
T3_asi_reg_wr_131:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 2913: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_231:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a42  ! 2917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
cpu_intr_3_232:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_109:
	mov	0x34, %r14
	.word 0xfcdb84a0  ! 2924: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983980  ! 2926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1980, %hpstate
	.word 0xbab5a1dc  ! 2927: SUBCcc_I	orncc 	%r22, 0x01dc, %r29
cpu_intr_3_233:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5601b  ! 2934: STWA_I	stwa	%r31, [%r21 + 0x001b] %asi
	.word 0xfe75c000  ! 2936: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_132:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 2938: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfead0020  ! 2944: STBA_R	stba	%r31, [%r20 + %r0] 0x01
cpu_intr_3_234:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2461eb  ! 2947: STW_I	stw	%r31, [%r17 + 0x01eb]
	.word 0xfaf4215b  ! 2948: STXA_I	stxa	%r29, [%r16 + 0x015b] %asi
	.word 0xfeb50020  ! 2949: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983910  ! 2950: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1910, %hpstate
	.word 0xf4350000  ! 2954: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf0252164  ! 2956: STW_I	stw	%r24, [%r20 + 0x0164]
	.word 0xfaa5a0f3  ! 2958: STWA_I	stwa	%r29, [%r22 + 0x00f3] %asi
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_235:
	setx	0x370325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_236:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5603c  ! 2967: STHA_I	stha	%r30, [%r21 + 0x003c] %asi
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_133:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 2970: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982900  ! 2972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
cpu_intr_3_237:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x370013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e071  ! 2979: STH_I	sth	%r28, [%r19 + 0x0071]
T3_asi_reg_rd_111:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfead2098  ! 2983: STBA_I	stba	%r31, [%r20 + 0x0098] %asi
T3_asi_reg_rd_112:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_113:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_239:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ca10d  ! 3004: STB_I	stb	%r25, [%r18 + 0x010d]
	.word 0xbe2de09e  ! 3007: ANDN_I	andn 	%r23, 0x009e, %r31
T3_asi_reg_rd_114:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_240:
	setx	0x370012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 3016: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_wr_134:
	mov	0x0, %r14
	.word 0xfef38e80  ! 3019: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8ace1e9  ! 3020: STBA_I	stba	%r28, [%r19 + 0x01e9] %asi
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_135:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 3022: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_241:
	setx	0x370010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c607e  ! 3026: STB_I	stb	%r31, [%r17 + 0x007e]
	.word 0xf0b4a10e  ! 3027: STHA_I	stha	%r24, [%r18 + 0x010e] %asi
	.word 0xf034c000  ! 3028: STH_R	sth	%r24, [%r19 + %r0]
cpu_intr_3_242:
	setx	0x340214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_243:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf0ade03a  ! 3040: STBA_I	stba	%r24, [%r23 + 0x003a] %asi
cpu_intr_3_244:
	setx	0x35011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe350000  ! 3047: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 3048: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbf35a001  ! 3054: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb33c6001  ! 3056: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xf6f4a0a7  ! 3058: STXA_I	stxa	%r27, [%r18 + 0x00a7] %asi
	.word 0xfcb58020  ! 3060: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_245:
	setx	0x370217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a44020  ! 3064: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8b4e013  ! 3068: STHA_I	stha	%r28, [%r19 + 0x0013] %asi
	.word 0xfab5c020  ! 3069: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xfa25c000  ! 3070: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_116:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 3072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 3073: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_138:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 3087: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7347001  ! 3089: SRLX_I	srlx	%r17, 0x0001, %r27
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 31)
	.word 0xf6b58020  ! 3091: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xfe350000  ! 3094: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xbd7d8400  ! 3096: MOVR_R	movre	%r22, %r0, %r30
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 39)
	.word 0xf22d2062  ! 3102: STB_I	stb	%r25, [%r20 + 0x0062]
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 12)
	.word 0xf02d61ec  ! 3104: STB_I	stb	%r24, [%r21 + 0x01ec]
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, f)
	.word 0xfe3421b0  ! 3106: STH_I	sth	%r31, [%r16 + 0x01b0]
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 1c)
	.word 0xba1d21af  ! 3110: XOR_I	xor 	%r20, 0x01af, %r29
T3_asi_reg_wr_139:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 3111: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc152003  ! 3114: OR_I	or 	%r20, 0x0003, %r30
	.word 0xf434603c  ! 3115: STH_I	sth	%r26, [%r17 + 0x003c]
cpu_intr_3_246:
	setx	0x37033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4740000  ! 3117: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf2ad4020  ! 3118: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xbeb44000  ! 3119: SUBCcc_R	orncc 	%r17, %r0, %r31
cpu_intr_3_247:
	setx	0x370202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_248:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 39)
	.word 0xf0a50020  ! 3126: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xf42d8000  ! 3127: STB_R	stb	%r26, [%r22 + %r0]
T3_asi_reg_wr_140:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3129: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfca56082  ! 3130: STWA_I	stwa	%r30, [%r21 + 0x0082] %asi
T3_asi_reg_wr_141:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 3134: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_117:
	mov	0x1e, %r14
	.word 0xf4db84a0  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_250:
	setx	0x36023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982858  ! 3139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0xf4f52181  ! 3142: STXA_I	stxa	%r26, [%r20 + 0x0181] %asi
T3_asi_reg_rd_118:
	mov	0x12, %r14
	.word 0xf6db8e60  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8b50020  ! 3145: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xb62d0000  ! 3146: ANDN_R	andn 	%r20, %r0, %r27
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_142:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 3149: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6b44020  ! 3155: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_251:
	setx	0x350314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 37)
	.word 0xf4b46184  ! 3165: STHA_I	stha	%r26, [%r17 + 0x0184] %asi
cpu_intr_3_252:
	setx	0x370020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_143:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 3172: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcaca030  ! 3174: STBA_I	stba	%r30, [%r18 + 0x0030] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfea5e111  ! 3177: STWA_I	stwa	%r31, [%r23 + 0x0111] %asi
	.word 0xf234c000  ! 3182: STH_R	sth	%r25, [%r19 + %r0]
cpu_intr_3_253:
	setx	0x34001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c0000  ! 3184: XOR_R	xor 	%r16, %r0, %r26
	.word 0xf82dc000  ! 3185: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xba040000  ! 3186: ADD_R	add 	%r16, %r0, %r29
	.word 0xfe2d8000  ! 3188: STB_R	stb	%r31, [%r22 + %r0]
	.word 0x8d95209d  ! 3189: WRPR_PSTATE_I	wrpr	%r20, 0x009d, %pstate
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_254:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_144:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 3196: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x8794e1da  ! 3198: WRPR_TT_I	wrpr	%r19, 0x01da, %tt
T3_asi_reg_wr_145:
	mov	0x12, %r14
	.word 0xf6f38400  ! 3200: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0a4a0e0  ! 3201: STWA_I	stwa	%r24, [%r18 + 0x00e0] %asi
	.word 0xbe8420b3  ! 3206: ADDcc_I	addcc 	%r16, 0x00b3, %r31
	.word 0xfe35a14c  ! 3215: STH_I	sth	%r31, [%r22 + 0x014c]
	.word 0xf67560dc  ! 3216: STX_I	stx	%r27, [%r21 + 0x00dc]
T3_asi_reg_rd_119:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 3219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_255:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a02e  ! 3224: STHA_I	stha	%r25, [%r18 + 0x002e] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 7)
	.word 0xbeb48000  ! 3229: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xfc25e12c  ! 3230: STW_I	stw	%r30, [%r23 + 0x012c]
cpu_intr_3_256:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_257:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa244000  ! 3235: STW_R	stw	%r29, [%r17 + %r0]
cpu_intr_3_258:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x360218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba44a149  ! 3238: ADDC_I	addc 	%r18, 0x0149, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_260:
	setx	0x350031, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_146:
	mov	0x1, %r14
	.word 0xfaf38400  ! 3244: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_120:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 3246: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_rd_121:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfcb5c020  ! 3253: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xfa2d0000  ! 3254: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfe25a036  ! 3257: STW_I	stw	%r31, [%r22 + 0x0036]
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 3265: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf4a4e1ee  ! 3266: STWA_I	stwa	%r26, [%r19 + 0x01ee] %asi
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_261:
	setx	0x390000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8446140  ! 3271: ADDC_I	addc 	%r17, 0x0140, %r28
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, e)
	.word 0xb63dc000  ! 3274: XNOR_R	xnor 	%r23, %r0, %r27
T3_asi_reg_wr_148:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 3275: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_149:
	mov	0x20, %r14
	.word 0xfcf38400  ! 3277: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_122:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_262:
	setx	0x380216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_150:
	mov	0x23, %r14
	.word 0xf6f38e60  ! 3289: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9346001  ! 3293: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_123:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb6450000  ! 3298: ADDC_R	addc 	%r20, %r0, %r27
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaad4020  ! 3304: STBA_R	stba	%r29, [%r21 + %r0] 0x01
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc250000  ! 3310: STW_R	stw	%r30, [%r20 + %r0]
cpu_intr_3_264:
	setx	0x390103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaacc020  ! 3313: STBA_R	stba	%r29, [%r19 + %r0] 0x01
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 1)
	.word 0xf6a48020  ! 3319: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf2f5a036  ! 3320: STXA_I	stxa	%r25, [%r22 + 0x0036] %asi
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 39)
	.word 0xba0561fe  ! 3323: ADD_I	add 	%r21, 0x01fe, %r29
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_124:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 3325: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_151:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 3326: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_265:
	setx	0x3b031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_266:
	setx	0x390309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, c)
	.word 0xb6a5e104  ! 3342: SUBcc_I	subcc 	%r23, 0x0104, %r27
	.word 0xf0358000  ! 3347: STH_R	sth	%r24, [%r22 + %r0]
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e90  ! 3354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e90, %hpstate
	.word 0xfeaca1b5  ! 3355: STBA_I	stba	%r31, [%r18 + 0x01b5] %asi
	.word 0xf8744000  ! 3356: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf4356039  ! 3357: STH_I	sth	%r26, [%r21 + 0x0039]
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198381a  ! 3358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
T3_asi_reg_wr_152:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3365: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8f420d8  ! 3366: STXA_I	stxa	%r28, [%r16 + 0x00d8] %asi
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_267:
	setx	0x390016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_268:
	setx	0x39000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x3b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_125:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_270:
	setx	0x38032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0acc020  ! 3382: STBA_R	stba	%r24, [%r19 + %r0] 0x01
cpu_intr_3_271:
	setx	0x3a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe2421e3  ! 3386: STW_I	stw	%r31, [%r16 + 0x01e3]
cpu_intr_3_272:
	setx	0x380110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9dc000  ! 3394: XORcc_R	xorcc 	%r23, %r0, %r30
T3_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xfef38e40  ! 3395: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf42d0000  ! 3396: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf67560c6  ! 3397: STX_I	stx	%r27, [%r21 + 0x00c6]
T3_asi_reg_wr_154:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 3398: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_273:
	setx	0x39021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_126:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 3404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_155:
	mov	0x11, %r14
	.word 0xf4f384a0  ! 3405: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf025e111  ! 3406: STW_I	stw	%r24, [%r23 + 0x0111]
	.word 0xfab5c020  ! 3408: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xb62dc000  ! 3410: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xb0aca116  ! 3413: ANDNcc_I	andncc 	%r18, 0x0116, %r24
	.word 0xbd7c0400  ! 3414: MOVR_R	movre	%r16, %r0, %r30
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 17)
	.word 0xfe2de13d  ! 3422: STB_I	stb	%r31, [%r23 + 0x013d]
T3_asi_reg_wr_156:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3426: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 35)
	.word 0xbcace1a5  ! 3428: ANDNcc_I	andncc 	%r19, 0x01a5, %r30
	.word 0xfab5e06f  ! 3429: STHA_I	stha	%r29, [%r23 + 0x006f] %asi
T3_asi_reg_rd_127:
	mov	0x1c, %r14
	.word 0xf0db89e0  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_157:
	mov	0x38, %r14
	.word 0xfef38e40  ! 3431: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_158:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 3432: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_159:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 3434: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf22d8000  ! 3442: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_wr_160:
	mov	0x38, %r14
	.word 0xf6f389e0  ! 3444: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_128:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dda  ! 3448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 27)
	.word 0xf2b58020  ! 3450: STHA_R	stha	%r25, [%r22 + %r0] 0x01
T3_asi_reg_wr_161:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 3452: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_162:
	mov	0x9, %r14
	.word 0xf4f38e80  ! 3453: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_274:
	setx	0x3b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 23)
	.word 0xfe24e175  ! 3457: STW_I	stw	%r31, [%r19 + 0x0175]
	.word 0xf6b48020  ! 3458: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xf02de012  ! 3462: STB_I	stb	%r24, [%r23 + 0x0012]
	ta	T_CHANGE_NONHPRIV
	.word 0xba04c000  ! 3466: ADD_R	add 	%r19, %r0, %r29
T3_asi_reg_wr_163:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 3467: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6acc020  ! 3470: STBA_R	stba	%r27, [%r19 + %r0] 0x01
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_275:
	setx	0x39020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c08  ! 3475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c08, %hpstate
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982882  ! 3476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0882, %hpstate
	.word 0x8d9561db  ! 3477: WRPR_PSTATE_I	wrpr	%r21, 0x01db, %pstate
T3_asi_reg_rd_129:
	mov	0x7, %r14
	.word 0xfadb8400  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_130:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_276:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3485: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_277:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 20)
	.word 0xf6258000  ! 3492: STW_R	stw	%r27, [%r22 + %r0]
T3_asi_reg_wr_165:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 3494: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_278:
	setx	0x3b0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a421ed  ! 3497: STWA_I	stwa	%r27, [%r16 + 0x01ed] %asi
cpu_intr_3_279:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a0b2  ! 3502: STXA_I	stxa	%r25, [%r18 + 0x00b2] %asi
cpu_intr_3_280:
	setx	0x390325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 13)
	.word 0xb93c3001  ! 3510: SRAX_I	srax	%r16, 0x0001, %r28
T3_asi_reg_wr_166:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 3511: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_281:
	setx	0x3a0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ce063  ! 3513: STB_I	stb	%r29, [%r19 + 0x0063]
	.word 0xfa248000  ! 3516: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xfaa4e120  ! 3517: STWA_I	stwa	%r29, [%r19 + 0x0120] %asi
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 18)
	.word 0xf835a033  ! 3519: STH_I	sth	%r28, [%r22 + 0x0033]
T3_asi_reg_wr_167:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 3521: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4b44020  ! 3522: STHA_R	stha	%r26, [%r17 + %r0] 0x01
cpu_intr_3_282:
	setx	0x390108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 35)
	.word 0xb7643801  ! 3529: MOVcc_I	<illegal instruction>
	.word 0xf474c000  ! 3530: STX_R	stx	%r26, [%r19 + %r0]
T3_asi_reg_wr_168:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 3533: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf4a520bd  ! 3534: STWA_I	stwa	%r26, [%r20 + 0x00bd] %asi
cpu_intr_3_283:
	setx	0x390235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f421a7  ! 3538: STXA_I	stxa	%r25, [%r16 + 0x01a7] %asi
cpu_intr_3_284:
	setx	0x3b0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 15)
	.word 0xfa246095  ! 3543: STW_I	stw	%r29, [%r17 + 0x0095]
cpu_intr_3_285:
	setx	0x380037, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_131:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfa350000  ! 3551: STH_R	sth	%r29, [%r20 + %r0]
cpu_intr_3_286:
	setx	0x380316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_287:
	setx	0x390305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5e12b  ! 3564: STHA_I	stha	%r30, [%r23 + 0x012b] %asi
cpu_intr_3_288:
	setx	0x3b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_289:
	setx	0x3a0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_169:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 3573: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_290:
	setx	0x39013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_132:
	mov	0x1e, %r14
	.word 0xf0db8e80  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_291:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_170:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 3577: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf8a44020  ! 3578: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xfea40020  ! 3582: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
cpu_intr_3_292:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x3a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5c020  ! 3590: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xfe24a060  ! 3592: STW_I	stw	%r31, [%r18 + 0x0060]
	.word 0xfe240000  ! 3595: STW_R	stw	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_294:
	setx	0x3a0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf4344000  ! 3603: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf025e1c5  ! 3604: STW_I	stw	%r24, [%r23 + 0x01c5]
	.word 0xb8bc610d  ! 3605: XNORcc_I	xnorcc 	%r17, 0x010d, %r28
	.word 0x8d95a0df  ! 3606: WRPR_PSTATE_I	wrpr	%r22, 0x00df, %pstate
T3_asi_reg_rd_133:
	mov	0x16, %r14
	.word 0xf8db89e0  ! 3607: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_295:
	setx	0x380234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635c000  ! 3612: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_171:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 3614: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc2461b8  ! 3617: STW_I	stw	%r30, [%r17 + 0x01b8]
T3_asi_reg_rd_134:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_296:
	setx	0x3b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_172:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 3623: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_297:
	setx	0x38023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02520eb  ! 3628: STW_I	stw	%r24, [%r20 + 0x00eb]
	.word 0xf6758000  ! 3629: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_298:
	setx	0x380110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeacc020  ! 3633: STBA_R	stba	%r31, [%r19 + %r0] 0x01
	.word 0xb7348000  ! 3634: SRL_R	srl 	%r18, %r0, %r27
	.word 0xf2754000  ! 3635: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_wr_173:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3637: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb41de051  ! 3638: XOR_I	xor 	%r23, 0x0051, %r26
	.word 0xf4a4219e  ! 3639: STWA_I	stwa	%r26, [%r16 + 0x019e] %asi
cpu_intr_3_299:
	setx	0x3b0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 3641: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0f5e1b0  ! 3642: STXA_I	stxa	%r24, [%r23 + 0x01b0] %asi
cpu_intr_3_300:
	setx	0x3a0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 1d)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982fc0  ! 3650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc0, %hpstate
T3_asi_reg_wr_175:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 3651: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe1561c4  ! 3652: OR_I	or 	%r21, 0x01c4, %r31
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819839d8  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d8, %hpstate
	.word 0xf6ac8020  ! 3654: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf23461ad  ! 3656: STH_I	sth	%r25, [%r17 + 0x01ad]
T3_asi_reg_wr_176:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 3657: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_301:
	setx	0x38003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 17)
	.word 0xf02c8000  ! 3664: STB_R	stb	%r24, [%r18 + %r0]
cpu_intr_3_302:
	setx	0x390007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_TO_TL0
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0256197  ! 3674: STW_I	stw	%r24, [%r21 + 0x0197]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf0b4a15c  ! 3682: STHA_I	stha	%r24, [%r18 + 0x015c] %asi
T3_asi_reg_rd_135:
	mov	0x4, %r14
	.word 0xf2db8400  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe75e00a  ! 3684: STX_I	stx	%r31, [%r23 + 0x000a]
	.word 0xbac54000  ! 3689: ADDCcc_R	addccc 	%r21, %r0, %r29
T3_asi_reg_rd_136:
	mov	0x31, %r14
	.word 0xf0db8400  ! 3690: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_303:
	setx	0x390319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 3697: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa35c000  ! 3698: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_178:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 3702: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa340000  ! 3703: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf824a139  ! 3705: STW_I	stw	%r28, [%r18 + 0x0139]
	.word 0xf22de080  ! 3706: STB_I	stb	%r25, [%r23 + 0x0080]
	.word 0xf635c000  ! 3707: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8b5a1b2  ! 3710: STHA_I	stha	%r28, [%r22 + 0x01b2] %asi
	.word 0xf2f4e03a  ! 3712: STXA_I	stxa	%r25, [%r19 + 0x003a] %asi
cpu_intr_3_304:
	setx	0x3e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca44020  ! 3716: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
cpu_intr_3_305:
	setx	0x3d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 3726: STW_R	stw	%r27, [%r16 + %r0]
cpu_intr_3_306:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_307:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 3735: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_138:
	mov	0x14, %r14
	.word 0xfadb84a0  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 3737: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3738: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a88  ! 3740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
	.word 0xfcad61fd  ! 3745: STBA_I	stba	%r30, [%r21 + 0x01fd] %asi
	.word 0xf22dc000  ! 3747: STB_R	stb	%r25, [%r23 + %r0]
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4b40020  ! 3751: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xfe258000  ! 3752: STW_R	stw	%r31, [%r22 + %r0]
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_140:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_180:
	mov	0x2c, %r14
	.word 0xf6f38e60  ! 3763: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb8840000  ! 3764: ADDcc_R	addcc 	%r16, %r0, %r28
cpu_intr_3_308:
	setx	0x3c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_181:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 3767: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf22d4000  ! 3769: STB_R	stb	%r25, [%r21 + %r0]
cpu_intr_3_309:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 3771: STW_R	stw	%r27, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf2b4c020  ! 3777: STHA_R	stha	%r25, [%r19 + %r0] 0x01
cpu_intr_3_310:
	setx	0x3d003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_182:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 3790: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba9d4000  ! 3792: XORcc_R	xorcc 	%r21, %r0, %r29
cpu_intr_3_311:
	setx	0x3e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 3794: STW_R	stw	%r25, [%r21 + %r0]
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_312:
	setx	0x3c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c0000  ! 3801: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_wr_183:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 3802: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_141:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 3803: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb68d616b  ! 3806: ANDcc_I	andcc 	%r21, 0x016b, %r27
	.word 0xf4a461ce  ! 3807: STWA_I	stwa	%r26, [%r17 + 0x01ce] %asi
	.word 0xf6f4615f  ! 3808: STXA_I	stxa	%r27, [%r17 + 0x015f] %asi
	.word 0xfc2c2021  ! 3810: STB_I	stb	%r30, [%r16 + 0x0021]
cpu_intr_3_313:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf52010  ! 3813: STXA_I	stxa	%r30, [%r20 + 0x0010] %asi
cpu_intr_3_314:
	setx	0x3f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74e048  ! 3815: STX_I	stx	%r29, [%r19 + 0x0048]
cpu_intr_3_315:
	setx	0x3d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 3818: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_142:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 3819: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_316:
	setx	0x3e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_317:
	setx	0x3f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c12  ! 3830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
cpu_intr_3_318:
	setx	0x3d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_185:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 3834: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb694e10c  ! 3835: ORcc_I	orcc 	%r19, 0x010c, %r27
	.word 0xbc9d4000  ! 3837: XORcc_R	xorcc 	%r21, %r0, %r30
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_319:
	setx	0x3e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf034e0df  ! 3849: STH_I	sth	%r24, [%r19 + 0x00df]
	ta	T_CHANGE_TO_TL1
	.word 0xb92cd000  ! 3851: SLLX_R	sllx	%r19, %r0, %r28
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 11)
	.word 0xfa748000  ! 3862: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbe94a18c  ! 3863: ORcc_I	orcc 	%r18, 0x018c, %r31
	.word 0xf4b42028  ! 3865: STHA_I	stha	%r26, [%r16 + 0x0028] %asi
	.word 0xfaf5a09f  ! 3868: STXA_I	stxa	%r29, [%r22 + 0x009f] %asi
T3_asi_reg_wr_186:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 3869: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_187:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 3871: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_188:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 3872: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf02dc000  ! 3873: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf2b50020  ! 3874: STHA_R	stha	%r25, [%r20 + %r0] 0x01
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb52d8000  ! 3876: SLL_R	sll 	%r22, %r0, %r26
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc34e141  ! 3879: STH_I	sth	%r30, [%r19 + 0x0141]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 4)
	.word 0xb6bcc000  ! 3883: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xfab4e021  ! 3884: STHA_I	stha	%r29, [%r19 + 0x0021] %asi
	.word 0xf02560e1  ! 3887: STW_I	stw	%r24, [%r21 + 0x00e1]
	.word 0xf02c615b  ! 3888: STB_I	stb	%r24, [%r17 + 0x015b]
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, c)
	.word 0xf234a154  ! 3890: STH_I	sth	%r25, [%r18 + 0x0154]
cpu_intr_3_320:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_189:
	mov	0x28, %r14
	.word 0xfaf38400  ! 3892: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0x8995e0aa  ! 3893: WRPR_TICK_I	wrpr	%r23, 0x00aa, %tick
T3_asi_reg_rd_143:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_321:
	setx	0x3c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25a1c9  ! 3898: STW_I	stw	%r31, [%r22 + 0x01c9]
	.word 0xf2b4e19b  ! 3900: STHA_I	stha	%r25, [%r19 + 0x019b] %asi
cpu_intr_3_322:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 11)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198280a  ! 3907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080a, %hpstate
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_190:
	mov	0x29, %r14
	.word 0xf6f38400  ! 3912: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 22)
	.word 0xf075a0d3  ! 3921: STX_I	stx	%r24, [%r22 + 0x00d3]
T3_asi_reg_rd_144:
	mov	0xf, %r14
	.word 0xf4db8400  ! 3926: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_323:
	setx	0x3f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca521d5  ! 3929: STWA_I	stwa	%r30, [%r20 + 0x01d5] %asi
T3_asi_reg_rd_145:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 3932: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf4adc020  ! 3935: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 2)
	.word 0xf6f4e179  ! 3939: STXA_I	stxa	%r27, [%r19 + 0x0179] %asi
T3_asi_reg_wr_191:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 3940: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb4ada18e  ! 3943: ANDNcc_I	andncc 	%r22, 0x018e, %r26
	.word 0xba344000  ! 3944: SUBC_R	orn 	%r17, %r0, %r29
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198391a  ! 3945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191a, %hpstate
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 3)
	.word 0xf4a40020  ! 3948: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf4340000  ! 3949: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_wr_192:
	mov	0x24, %r14
	.word 0xf0f389e0  ! 3950: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_324:
	setx	0x3c030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 3952: STB_R	stb	%r24, [%r21 + %r0]
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e4a  ! 3953: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4a, %hpstate
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 3956: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 15)
	.word 0xb53d0000  ! 3959: SRA_R	sra 	%r20, %r0, %r26
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 28)
	.word 0xbd3c6001  ! 3963: SRA_I	sra 	%r17, 0x0001, %r30
cpu_intr_3_325:
	setx	0x3e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_326:
	setx	0x3e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_194:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 3974: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_327:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa258000  ! 3976: STW_R	stw	%r29, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_328:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899420ab  ! 3981: WRPR_TICK_I	wrpr	%r16, 0x00ab, %tick
	.word 0xfaa521db  ! 3982: STWA_I	stwa	%r29, [%r20 + 0x01db] %asi
cpu_intr_3_329:
	setx	0x3e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4e1f0  ! 3984: STHA_I	stha	%r24, [%r19 + 0x01f0] %asi
	.word 0xfe2c0000  ! 3986: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb3641800  ! 3988: MOVcc_R	<illegal instruction>
	.word 0xf22da0b8  ! 3990: STB_I	stb	%r25, [%r22 + 0x00b8]
cpu_intr_3_330:
	setx	0x3f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_195:
	mov	0x1b, %r14
	.word 0xf2f38e60  ! 3993: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb73d8000  ! 3995: SRA_R	sra 	%r22, %r0, %r27
	.word 0xfaa40020  ! 3996: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xfef5a0ee  ! 3997: STXA_I	stxa	%r31, [%r22 + 0x00ee] %asi
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_146:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 4003: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc356119  ! 4006: STH_I	sth	%r30, [%r21 + 0x0119]
	.word 0xb92dd000  ! 4007: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xfaf5e010  ! 4011: STXA_I	stxa	%r29, [%r23 + 0x0010] %asi
cpu_intr_3_331:
	setx	0x3e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 4015: STBA_R	stba	%r26, [%r18 + %r0] 0x01
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 26)
	.word 0xf475e0b1  ! 4019: STX_I	stx	%r26, [%r23 + 0x00b1]
	.word 0xf2b44020  ! 4020: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	.word 0xf8242129  ! 4022: STW_I	stw	%r28, [%r16 + 0x0129]
cpu_intr_3_332:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_196:
	mov	0x2, %r14
	.word 0xfcf389e0  ! 4025: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_333:
	setx	0x3c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 38)
	.word 0xf0354000  ! 4029: STH_R	sth	%r24, [%r21 + %r0]
cpu_intr_3_334:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e1cc  ! 4031: STX_I	stx	%r29, [%r23 + 0x01cc]
	.word 0xfc35c000  ! 4032: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf4250000  ! 4033: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfeac2014  ! 4034: STBA_I	stba	%r31, [%r16 + 0x0014] %asi
	.word 0xb88dc000  ! 4035: ANDcc_R	andcc 	%r23, %r0, %r28
cpu_intr_3_335:
	setx	0x3f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f5a147  ! 4042: STXA_I	stxa	%r27, [%r22 + 0x0147] %asi
T3_asi_reg_rd_147:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_336:
	setx	0x3d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_337:
	setx	0x3d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcacc020  ! 4060: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xfaad4020  ! 4061: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xf0ac0020  ! 4062: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xf4ace1fe  ! 4065: STBA_I	stba	%r26, [%r19 + 0x01fe] %asi
	.word 0x839461e8  ! 4066: WRPR_TNPC_I	wrpr	%r17, 0x01e8, %tnpc
T3_asi_reg_wr_197:
	mov	0x1d, %r14
	.word 0xf6f38e60  ! 4067: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_198:
	mov	0xc, %r14
	.word 0xf4f38400  ! 4072: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf0a40020  ! 4073: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xf475201a  ! 4074: STX_I	stx	%r26, [%r20 + 0x001a]
T3_asi_reg_wr_199:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 4075: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4f5a00e  ! 4078: STXA_I	stxa	%r26, [%r22 + 0x000e] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_338:
	setx	0x3d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_200:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 4082: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfcb50020  ! 4085: STHA_R	stha	%r30, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_148:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, f)
	.word 0xf6ade159  ! 4094: STBA_I	stba	%r27, [%r23 + 0x0159] %asi
	.word 0xf6b50020  ! 4095: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b50020  ! 4100: STHA_R	stha	%r27, [%r20 + %r0] 0x01
cpu_intr_3_339:
	setx	0x3f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13de001  ! 4103: SRA_I	sra 	%r23, 0x0001, %r24
	.word 0xf2244000  ! 4104: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf4ac8020  ! 4105: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xfe2da1d1  ! 4106: STB_I	stb	%r31, [%r22 + 0x01d1]
T3_asi_reg_wr_201:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 4109: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_149:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_340:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_150:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_341:
	setx	0x3f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2460a8  ! 4118: STW_I	stw	%r29, [%r17 + 0x00a8]
T3_asi_reg_rd_151:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 4120: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfa7420e3  ! 4125: STX_I	stx	%r29, [%r16 + 0x00e3]
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 2b)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_342:
	setx	0x3e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x3e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_344:
	setx	0x3c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_153:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_154:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 4139: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf0246193  ! 4140: STW_I	stw	%r24, [%r17 + 0x0193]
	.word 0xb9346001  ! 4141: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 13)
	.word 0xf634e1b9  ! 4143: STH_I	sth	%r27, [%r19 + 0x01b9]
	.word 0xfc2d61d1  ! 4144: STB_I	stb	%r30, [%r21 + 0x01d1]
	.word 0xbf7de401  ! 4146: MOVR_I	movre	%r23, 0x1, %r31
	.word 0xfe24a0fc  ! 4147: STW_I	stw	%r31, [%r18 + 0x00fc]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b4c020  ! 4154: STHA_R	stha	%r27, [%r19 + %r0] 0x01
cpu_intr_3_345:
	setx	0x420316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_202:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 4160: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_346:
	setx	0x43032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_347:
	setx	0x420304, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf02d4000  ! 4175: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_rd_155:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 4176: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_348:
	setx	0x420312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_349:
	setx	0x400121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5c020  ! 4185: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xb4bd0000  ! 4186: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xf2b5c020  ! 4187: STHA_R	stha	%r25, [%r23 + %r0] 0x01
cpu_intr_3_350:
	setx	0x430112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf42194  ! 4189: STXA_I	stxa	%r30, [%r16 + 0x0194] %asi
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8aca057  ! 4201: STBA_I	stba	%r28, [%r18 + 0x0057] %asi
cpu_intr_3_351:
	setx	0x420322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34a1be  ! 4207: STH_I	sth	%r29, [%r18 + 0x01be]
	.word 0xf2758000  ! 4210: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfea58020  ! 4213: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
T3_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 4214: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_156:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6b50020  ! 4218: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xfa2521b3  ! 4219: STW_I	stw	%r29, [%r20 + 0x01b3]
T3_asi_reg_wr_204:
	mov	0x13, %r14
	.word 0xf4f38e60  ! 4221: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_353:
	setx	0x41021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8254000  ! 4226: SUB_R	sub 	%r21, %r0, %r28
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 26)
	.word 0xf82c60d7  ! 4229: STB_I	stb	%r28, [%r17 + 0x00d7]
	.word 0xf8a4c020  ! 4230: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL1
	.word 0xb6ac0000  ! 4239: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xf2252167  ! 4240: STW_I	stw	%r25, [%r20 + 0x0167]
cpu_intr_3_354:
	setx	0x40010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b50020  ! 4245: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xf024e01f  ! 4248: STW_I	stw	%r24, [%r19 + 0x001f]
	.word 0xf224e065  ! 4251: STW_I	stw	%r25, [%r19 + 0x0065]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_157:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 4254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 36)
	.word 0xf8a58020  ! 4256: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 26)
	.word 0xfa254000  ! 4259: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_wr_205:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 4260: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb93df001  ! 4265: SRAX_I	srax	%r23, 0x0001, %r28
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 7)
	.word 0xf6b50020  ! 4276: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_158:
	mov	0x36, %r14
	.word 0xf8db8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_159:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_206:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 4282: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbeb46056  ! 4283: SUBCcc_I	orncc 	%r17, 0x0056, %r31
T3_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb634a1df  ! 4288: SUBC_I	orn 	%r18, 0x01df, %r27
T3_asi_reg_rd_161:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4289: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_207:
	mov	0x11, %r14
	.word 0xf0f389e0  ! 4290: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 4291: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_355:
	setx	0x400008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8aca0aa  ! 4298: STBA_I	stba	%r28, [%r18 + 0x00aa] %asi
	.word 0xb2058000  ! 4300: ADD_R	add 	%r22, %r0, %r25
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_356:
	setx	0x430331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 4312: STX_R	stx	%r26, [%r20 + %r0]
T3_asi_reg_wr_209:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 4313: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_357:
	setx	0x41003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x31, %r14
	.word 0xfaf38400  ! 4318: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_358:
	setx	0x40030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead21a1  ! 4320: STBA_I	stba	%r31, [%r20 + 0x01a1] %asi
	.word 0xba240000  ! 4323: SUB_R	sub 	%r16, %r0, %r29
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4f46122  ! 4329: STXA_I	stxa	%r26, [%r17 + 0x0122] %asi
cpu_intr_3_359:
	setx	0x420034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_162:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2ac0020  ! 4332: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xfc2d60c4  ! 4333: STB_I	stb	%r30, [%r21 + 0x00c4]
	.word 0xf02c0000  ! 4335: STB_R	stb	%r24, [%r16 + %r0]
cpu_intr_3_360:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa7560c2  ! 4344: STX_I	stx	%r29, [%r21 + 0x00c2]
cpu_intr_3_361:
	setx	0x430324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 4349: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xb8a52020  ! 4351: SUBcc_I	subcc 	%r20, 0x0020, %r28
T3_asi_reg_wr_211:
	mov	0x36, %r14
	.word 0xfef38e40  ! 4352: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfeb4a106  ! 4354: STHA_I	stha	%r31, [%r18 + 0x0106] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf521ed  ! 4357: STXA_I	stxa	%r30, [%r20 + 0x01ed] %asi
	.word 0xf424203f  ! 4358: STW_I	stw	%r26, [%r16 + 0x003f]
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 16)
	.word 0xbc3ca04d  ! 4361: XNOR_I	xnor 	%r18, 0x004d, %r30
	.word 0xf225e0bd  ! 4362: STW_I	stw	%r25, [%r23 + 0x00bd]
	.word 0x8195e07c  ! 4363: WRPR_TPC_I	wrpr	%r23, 0x007c, %tpc
	.word 0xf0b44020  ! 4364: STHA_R	stha	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_212:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 4365: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_362:
	setx	0x410239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_363:
	setx	0x410012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 8)
	.word 0xf275e0c1  ! 4376: STX_I	stx	%r25, [%r23 + 0x00c1]
	.word 0xb6248000  ! 4377: SUB_R	sub 	%r18, %r0, %r27
	.word 0xf0a5e1a1  ! 4379: STWA_I	stwa	%r24, [%r23 + 0x01a1] %asi
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_213:
	mov	0x12, %r14
	.word 0xf6f38400  ! 4392: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6ad8020  ! 4393: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa35a14b  ! 4395: STH_I	sth	%r29, [%r22 + 0x014b]
	.word 0xf82d8000  ! 4396: STB_R	stb	%r28, [%r22 + %r0]
T3_asi_reg_wr_214:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 4398: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfca56147  ! 4401: STWA_I	stwa	%r30, [%r21 + 0x0147] %asi
	.word 0xfab4c020  ! 4405: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfc35e0d6  ! 4409: STH_I	sth	%r30, [%r23 + 0x00d6]
	.word 0xfea421b7  ! 4410: STWA_I	stwa	%r31, [%r16 + 0x01b7] %asi
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_163:
	mov	0x38, %r14
	.word 0xf8db8400  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfe346153  ! 4415: STH_I	sth	%r31, [%r17 + 0x0153]
	.word 0xf2f5205b  ! 4416: STXA_I	stxa	%r25, [%r20 + 0x005b] %asi
	.word 0xfeb5201b  ! 4418: STHA_I	stha	%r31, [%r20 + 0x001b] %asi
	.word 0xfc748000  ! 4424: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf6a5e026  ! 4426: STWA_I	stwa	%r27, [%r23 + 0x0026] %asi
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb8b5c000  ! 4432: ORNcc_R	orncc 	%r23, %r0, %r28
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_364:
	setx	0x40030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f560d5  ! 4436: STXA_I	stxa	%r25, [%r21 + 0x00d5] %asi
	.word 0xb1349000  ! 4437: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xbe94614f  ! 4439: ORcc_I	orcc 	%r17, 0x014f, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa5e092  ! 4443: STWA_I	stwa	%r29, [%r23 + 0x0092] %asi
	.word 0xf82c205a  ! 4446: STB_I	stb	%r28, [%r16 + 0x005a]
	.word 0xfa2561f0  ! 4448: STW_I	stw	%r29, [%r21 + 0x01f0]
	ta	T_CHANGE_TO_TL1
	.word 0xfe348000  ! 4454: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xfe2c2039  ! 4456: STB_I	stb	%r31, [%r16 + 0x0039]
	ta	T_CHANGE_HPRIV
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_215:
	mov	0x1, %r14
	.word 0xf2f38400  ! 4463: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_365:
	setx	0x400215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 4465: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, b)
	.word 0xf2ad21c3  ! 4467: STBA_I	stba	%r25, [%r20 + 0x01c3] %asi
cpu_intr_3_366:
	setx	0x410134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad4000  ! 4471: ANDNcc_R	andncc 	%r21, %r0, %r24
cpu_intr_3_367:
	setx	0x410322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 3)
	.word 0xf82d0000  ! 4477: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_216:
	mov	0x7, %r14
	.word 0xf8f38400  ! 4484: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfaa50020  ! 4485: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xf874601b  ! 4486: STX_I	stx	%r28, [%r17 + 0x001b]
	.word 0xb80d0000  ! 4488: AND_R	and 	%r20, %r0, %r28
	.word 0xfa354000  ! 4497: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_rd_164:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6358000  ! 4501: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfe25c000  ! 4503: STW_R	stw	%r31, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf874a156  ! 4505: STX_I	stx	%r28, [%r18 + 0x0156]
	.word 0xf03521e6  ! 4506: STH_I	sth	%r24, [%r20 + 0x01e6]
T3_asi_reg_wr_217:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 4508: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_368:
	setx	0x420013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc24e042  ! 4510: SUB_I	sub 	%r19, 0x0042, %r30
	.word 0xfcad0020  ! 4511: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f4a  ! 4513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xfcacc020  ! 4514: STBA_R	stba	%r30, [%r19 + %r0] 0x01
cpu_intr_3_369:
	setx	0x400321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 4517: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xfc250000  ! 4518: STW_R	stw	%r30, [%r20 + %r0]
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_370:
	setx	0x430333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_371:
	setx	0x42020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6244000  ! 4526: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xb094e00b  ! 4527: ORcc_I	orcc 	%r19, 0x000b, %r24
	.word 0xfa35a054  ! 4529: STH_I	sth	%r29, [%r22 + 0x0054]
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_165:
	mov	0x19, %r14
	.word 0xf0db8e80  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xbe050000  ! 4533: ADD_R	add 	%r20, %r0, %r31
cpu_intr_3_372:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198291a  ! 4535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091a, %hpstate
cpu_intr_3_373:
	setx	0x41012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad2022  ! 4540: STBA_I	stba	%r26, [%r20 + 0x0022] %asi
	.word 0xf2b5e017  ! 4543: STHA_I	stha	%r25, [%r23 + 0x0017] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_374:
	setx	0x400226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_375:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234616c  ! 4551: ORN_I	orn 	%r17, 0x016c, %r25
T3_asi_reg_rd_166:
	mov	0x1a, %r14
	.word 0xf0db84a0  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf0a520b5  ! 4555: STWA_I	stwa	%r24, [%r20 + 0x00b5] %asi
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 35)
	.word 0xf2250000  ! 4559: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_rd_167:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_218:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 4567: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0750000  ! 4570: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xbc8dc000  ! 4571: ANDcc_R	andcc 	%r23, %r0, %r30
cpu_intr_3_376:
	setx	0x430124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_377:
	setx	0x430336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_378:
	setx	0x42012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 4578: STH_R	sth	%r24, [%r17 + %r0]
cpu_intr_3_379:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25a0b9  ! 4582: STW_I	stw	%r30, [%r22 + 0x00b9]
cpu_intr_3_380:
	setx	0x410110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5219d  ! 4588: STHA_I	stha	%r28, [%r20 + 0x019d] %asi
cpu_intr_3_381:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829ca  ! 4597: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xfeb50020  ! 4598: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_382:
	setx	0x43033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_219:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 4601: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_220:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 4605: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b00  ! 4608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b00, %hpstate
	.word 0xb8150000  ! 4609: OR_R	or 	%r20, %r0, %r28
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8a4c020  ! 4614: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
cpu_intr_3_383:
	setx	0x450220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaade116  ! 4616: ANDNcc_I	andncc 	%r23, 0x0116, %r29
	.word 0xf02c0000  ! 4618: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xfaa4e1ae  ! 4619: STWA_I	stwa	%r29, [%r19 + 0x01ae] %asi
	.word 0xf8344000  ! 4620: STH_R	sth	%r28, [%r17 + %r0]
cpu_intr_3_384:
	setx	0x45023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_385:
	setx	0x45002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, e)
	.word 0xb2948000  ! 4626: ORcc_R	orcc 	%r18, %r0, %r25
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_221:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 4628: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_386:
	setx	0x460215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 9)
	.word 0xbd2cf001  ! 4636: SLLX_I	sllx	%r19, 0x0001, %r30
cpu_intr_3_387:
	setx	0x470228, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 4641: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 4646: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8744000  ! 4647: STX_R	stx	%r28, [%r17 + %r0]
cpu_intr_3_388:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 4649: STX_R	stx	%r30, [%r20 + %r0]
T3_asi_reg_rd_169:
	mov	0xa, %r14
	.word 0xf2db8e60  ! 4650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4a44020  ! 4651: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
cpu_intr_3_389:
	setx	0x450226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f520b7  ! 4653: STXA_I	stxa	%r28, [%r20 + 0x00b7] %asi
	.word 0xf8ad61d3  ! 4655: STBA_I	stba	%r28, [%r21 + 0x01d3] %asi
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf235a13f  ! 4657: STH_I	sth	%r25, [%r22 + 0x013f]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, b)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_390:
	setx	0x45011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 25)
	.word 0xfaa5e1b6  ! 4662: STWA_I	stwa	%r29, [%r23 + 0x01b6] %asi
	.word 0xf2ad21b8  ! 4663: STBA_I	stba	%r25, [%r20 + 0x01b8] %asi
T3_asi_reg_rd_170:
	mov	0x32, %r14
	.word 0xfcdb8e80  ! 4665: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc240000  ! 4666: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xb68520e3  ! 4671: ADDcc_I	addcc 	%r20, 0x00e3, %r27
	.word 0xf6754000  ! 4672: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfaade1c6  ! 4673: STBA_I	stba	%r29, [%r23 + 0x01c6] %asi
cpu_intr_3_391:
	setx	0x450339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_392:
	setx	0x47032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_393:
	setx	0x460013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_394:
	setx	0x450324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_223:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 4695: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_3_395:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_396:
	setx	0x460229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4e029  ! 4703: STXA_I	stxa	%r25, [%r19 + 0x0029] %asi
	.word 0xbd3d3001  ! 4704: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xfea5a180  ! 4706: STWA_I	stwa	%r31, [%r22 + 0x0180] %asi
	.word 0xf6ace16b  ! 4710: STBA_I	stba	%r27, [%r19 + 0x016b] %asi
	.word 0xf6ac0020  ! 4712: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xf624c000  ! 4722: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf0a420a1  ! 4726: STWA_I	stwa	%r24, [%r16 + 0x00a1] %asi
	.word 0xfcac6178  ! 4727: STBA_I	stba	%r30, [%r17 + 0x0178] %asi
T3_asi_reg_wr_224:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 4728: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_397:
	setx	0x460320, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_172:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf2a44020  ! 4731: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_225:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 4736: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfaa5c020  ! 4737: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
T3_asi_reg_wr_226:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 4744: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_227:
	mov	0xb, %r14
	.word 0xfef38e40  ! 4745: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcf4a061  ! 4747: STXA_I	stxa	%r30, [%r18 + 0x0061] %asi
	.word 0xfc2da077  ! 4750: STB_I	stb	%r30, [%r22 + 0x0077]
	.word 0xfaf4210a  ! 4755: STXA_I	stxa	%r29, [%r16 + 0x010a] %asi
cpu_intr_3_398:
	setx	0x45022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_173:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 4759: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_399:
	setx	0x470307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_228:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 4762: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_229:
	mov	0x20, %r14
	.word 0xf4f38400  ! 4767: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_400:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_230:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 4769: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a00  ! 4770: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a00, %hpstate
	.word 0xfeade1e0  ! 4774: STBA_I	stba	%r31, [%r23 + 0x01e0] %asi
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_401:
	setx	0x460229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_402:
	setx	0x440102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 39)
	.word 0xf82d4000  ! 4783: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf0a4a0e5  ! 4784: STWA_I	stwa	%r24, [%r18 + 0x00e5] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c00  ! 4790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c00, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xfa252187  ! 4795: STW_I	stw	%r29, [%r20 + 0x0187]
cpu_intr_3_403:
	setx	0x470130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b54020  ! 4800: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_231:
	mov	0x10, %r14
	.word 0xfcf389e0  ! 4803: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfca40020  ! 4805: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xfeb5c020  ! 4807: STHA_R	stha	%r31, [%r23 + %r0] 0x01
cpu_intr_3_404:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_405:
	setx	0x470013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ce053  ! 4814: STB_I	stb	%r31, [%r19 + 0x0053]
	.word 0xf82c60f0  ! 4817: STB_I	stb	%r28, [%r17 + 0x00f0]
cpu_intr_3_406:
	setx	0x44002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_174:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa756057  ! 4829: STX_I	stx	%r29, [%r21 + 0x0057]
T3_asi_reg_rd_175:
	mov	0x12, %r14
	.word 0xf8db84a0  ! 4832: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_232:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 4834: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf425616e  ! 4838: STW_I	stw	%r26, [%r21 + 0x016e]
cpu_intr_3_407:
	setx	0x470321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_408:
	setx	0x440312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc2dc000  ! 4855: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf0a40020  ! 4860: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xbb3c7001  ! 4862: SRAX_I	srax	%r17, 0x0001, %r29
	.word 0xf22c616c  ! 4866: STB_I	stb	%r25, [%r17 + 0x016c]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_177:
	mov	0x38, %r14
	.word 0xfedb8e80  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfc34c000  ! 4870: STH_R	sth	%r30, [%r19 + %r0]
T3_asi_reg_rd_178:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_233:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4872: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbaac20c1  ! 4873: ANDNcc_I	andncc 	%r16, 0x00c1, %r29
cpu_intr_3_409:
	setx	0x44011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21ce044  ! 4882: XOR_I	xor 	%r19, 0x0044, %r25
	.word 0xb7510000  ! 4883: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf2350000  ! 4884: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_410:
	setx	0x470201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, e)
	.word 0xf0a4a11a  ! 4898: STWA_I	stwa	%r24, [%r18 + 0x011a] %asi
	.word 0xf62ca11c  ! 4899: STB_I	stb	%r27, [%r18 + 0x011c]
	.word 0xfaa58020  ! 4900: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xb4452176  ! 4901: ADDC_I	addc 	%r20, 0x0176, %r26
	.word 0xfc2dc000  ! 4902: STB_R	stb	%r30, [%r23 + %r0]
T3_asi_reg_rd_179:
	mov	0x4, %r14
	.word 0xfcdb8400  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfaa421fd  ! 4905: STWA_I	stwa	%r29, [%r16 + 0x01fd] %asi
	.word 0xf4b421b8  ! 4906: STHA_I	stha	%r26, [%r16 + 0x01b8] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f521a1  ! 4911: STXA_I	stxa	%r27, [%r20 + 0x01a1] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 8)
	.word 0xbcb5213b  ! 4914: SUBCcc_I	orncc 	%r20, 0x013b, %r30
	.word 0xf8ac0020  ! 4916: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf0f5e12f  ! 4918: STXA_I	stxa	%r24, [%r23 + 0x012f] %asi
T3_asi_reg_wr_234:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 4919: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2b48020  ! 4920: STHA_R	stha	%r25, [%r18 + %r0] 0x01
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 37)
	.word 0xb3518000  ! 4922: RDPR_PSTATE	rdpr	%pstate, %r25
T3_asi_reg_rd_180:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 4924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, e)
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_411:
	setx	0x47002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6a5210c  ! 4934: STWA_I	stwa	%r27, [%r20 + 0x010c] %asi
T3_asi_reg_rd_181:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 4935: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf824a090  ! 4938: STW_I	stw	%r28, [%r18 + 0x0090]
T3_asi_reg_rd_182:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 4940: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf435e1a3  ! 4943: STH_I	sth	%r26, [%r23 + 0x01a3]
	ta	T_CHANGE_TO_TL0
	.word 0xfaa5c020  ! 4958: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xf635e05e  ! 4959: STH_I	sth	%r27, [%r23 + 0x005e]
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_235:
	mov	0x27, %r14
	.word 0xf0f38e60  ! 4962: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_412:
	setx	0x47020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b40000  ! 4966: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xfeb58020  ! 4968: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xfa34e00e  ! 4970: STH_I	sth	%r29, [%r19 + 0x000e]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, a)
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe2c4000  ! 4981: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa746072  ! 4982: STX_I	stx	%r29, [%r17 + 0x0072]
	.word 0xfe350000  ! 4986: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xfe2c2046  ! 4987: STB_I	stb	%r31, [%r16 + 0x0046]
	.word 0xfe740000  ! 4988: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf4254000  ! 4989: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf82c2117  ! 4992: STB_I	stb	%r28, [%r16 + 0x0117]
cpu_intr_3_413:
	setx	0x450008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da01e  ! 4994: STB_I	stb	%r30, [%r22 + 0x001e]
T3_asi_reg_wr_236:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 4995: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf8342143  ! 4996: STH_I	sth	%r28, [%r16 + 0x0143]
T3_asi_reg_rd_183:
	mov	0x1b, %r14
	.word 0xfcdb8e80  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
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
T2_asi_reg_wr_0:
	mov	0x26, %r14
	.word 0xf0f38e80  ! 1: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb92ca001  ! 2: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xf8c40020  ! 4: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xf40de1d5  ! 6: LDUB_I	ldub	[%r23 + 0x01d5], %r26
	.word 0xf6144000  ! 8: LDUH_R	lduh	[%r17 + %r0], %r27
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfadc216d  ! 12: LDXA_I	ldxa	[%r16, + 0x016d] %asi, %r29
	.word 0xf8846178  ! 14: LDUWA_I	lduwa	[%r17, + 0x0178] %asi, %r28
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 17: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4cde18a  ! 18: LDSBA_I	ldsba	[%r23, + 0x018a] %asi, %r26
	.word 0xb8b54000  ! 19: ORNcc_R	orncc 	%r21, %r0, %r28
T2_asi_reg_rd_0:
	mov	0x1d, %r14
	.word 0xfadb8400  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xba94c000  ! 25: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xfa5d0000  ! 26: LDX_R	ldx	[%r20 + %r0], %r29
T2_asi_reg_wr_2:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 29: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_0:
	setx	0x1c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb521b6  ! 31: SUBCcc_I	orncc 	%r20, 0x01b6, %r30
	.word 0xf28dc020  ! 35: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
	.word 0xb4b5c000  ! 36: SUBCcc_R	orncc 	%r23, %r0, %r26
cpu_intr_2_1:
	setx	0x1e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_2:
	setx	0x1f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf64c8000  ! 42: LDSB_R	ldsb	[%r18 + %r0], %r27
cpu_intr_2_3:
	setx	0x1d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_4:
	setx	0x1e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_3:
	mov	0x27, %r14
	.word 0xfef38e60  ! 47: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfccca1bc  ! 52: LDSBA_I	ldsba	[%r18, + 0x01bc] %asi, %r30
	.word 0xfc54c000  ! 54: LDSH_R	ldsh	[%r19 + %r0], %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfec40020  ! 57: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 11)
	.word 0xf2dd6189  ! 60: LDXA_I	ldxa	[%r21, + 0x0189] %asi, %r25
	.word 0xf4ccc020  ! 61: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
T2_asi_reg_wr_4:
	mov	0x21, %r14
	.word 0xf6f38e80  ! 62: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf68d213c  ! 66: LDUBA_I	lduba	[%r20, + 0x013c] %asi, %r27
cpu_intr_2_5:
	setx	0x1e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb02560c7  ! 72: SUB_I	sub 	%r21, 0x00c7, %r24
T2_asi_reg_wr_5:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 75: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe44a09b  ! 77: LDSW_I	ldsw	[%r18 + 0x009b], %r31
T2_asi_reg_wr_6:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 80: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_6:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa440000  ! 83: LDSW_R	ldsw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0xfe040000  ! 99: LDUW_R	lduw	[%r16 + %r0], %r31
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe5cc000  ! 101: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xf8454000  ! 102: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf284218b  ! 104: LDUWA_I	lduwa	[%r16, + 0x018b] %asi, %r25
cpu_intr_2_7:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dd618d  ! 106: LDXA_I	ldxa	[%r21, + 0x018d] %asi, %r25
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 4)
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f1a  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
T2_asi_reg_rd_1:
	mov	0x23, %r14
	.word 0xfedb8400  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb3641800  ! 115: MOVcc_R	<illegal instruction>
	.word 0xf45d212d  ! 116: LDX_I	ldx	[%r20 + 0x012d], %r26
	.word 0xf0840020  ! 117: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
cpu_intr_2_8:
	setx	0x1e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 120: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_7:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 121: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_10:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_11:
	setx	0x1d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d21b1  ! 126: XOR_I	xor 	%r20, 0x01b1, %r31
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_12:
	setx	0x1d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 3)
	.word 0xfcd56033  ! 134: LDSHA_I	ldsha	[%r21, + 0x0033] %asi, %r30
	.word 0xf084a142  ! 136: LDUWA_I	lduwa	[%r18, + 0x0142] %asi, %r24
T2_asi_reg_wr_8:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 137: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb0a5a137  ! 138: SUBcc_I	subcc 	%r22, 0x0137, %r24
cpu_intr_2_13:
	setx	0x1e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_16:
	setx	0x1d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe344000  ! 146: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xfc4c8000  ! 147: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf25c0000  ! 149: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf85ce167  ! 150: LDX_I	ldx	[%r19 + 0x0167], %r28
T2_asi_reg_rd_2:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe5d4000  ! 153: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xfccdc020  ! 158: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829c0  ! 159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_17:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2c4c020  ! 173: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xfc54c000  ! 174: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xfe15e01e  ! 177: LDUH_I	lduh	[%r23 + 0x001e], %r31
	.word 0xb5641800  ! 179: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_9:
	mov	0x28, %r14
	.word 0xf6f389e0  ! 181: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf6cc0020  ! 182: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 186: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfe5cc000  ! 188: LDX_R	ldx	[%r19 + %r0], %r31
cpu_intr_2_18:
	setx	0x1d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_19:
	setx	0x1c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_20:
	setx	0x1e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829d2  ! 196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 9)
	.word 0xf0148000  ! 199: LDUH_R	lduh	[%r18 + %r0], %r24
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 1e)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f1a  ! 202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1a, %hpstate
	.word 0xf8c42011  ! 203: LDSWA_I	ldswa	[%r16, + 0x0011] %asi, %r28
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983cda  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cda, %hpstate
	.word 0xb9504000  ! 209: RDPR_TNPC	<illegal instruction>
	.word 0xf8140000  ! 210: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb1500000  ! 213: RDPR_TPC	<illegal instruction>
	.word 0xb9353001  ! 218: SRLX_I	srlx	%r20, 0x0001, %r28
cpu_intr_2_21:
	setx	0x1e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xb484e139  ! 229: ADDcc_I	addcc 	%r19, 0x0139, %r26
	.word 0xf8048000  ! 230: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf2cd0020  ! 232: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf254218b  ! 237: LDSH_I	ldsh	[%r16 + 0x018b], %r25
	.word 0xfa5dc000  ! 238: LDX_R	ldx	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_22:
	setx	0x1d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	.word 0xb32cd000  ! 250: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xb21ce062  ! 254: XOR_I	xor 	%r19, 0x0062, %r25
	.word 0xf44dc000  ! 255: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xf88c8020  ! 258: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xf8c54020  ! 260: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
cpu_intr_2_23:
	setx	0x1f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_5:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_24:
	setx	0x1c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacda168  ! 274: LDSBA_I	ldsba	[%r22, + 0x0168] %asi, %r29
T2_asi_reg_wr_11:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 277: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfad56031  ! 278: LDSHA_I	ldsha	[%r21, + 0x0031] %asi, %r29
cpu_intr_2_25:
	setx	0x1c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d2001  ! 281: SLL_I	sll 	%r20, 0x0001, %r25
	.word 0xf2d4e0af  ! 282: LDSHA_I	ldsha	[%r19, + 0x00af] %asi, %r25
	.word 0xf4850020  ! 283: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xf054a0ac  ! 284: LDSH_I	ldsh	[%r18 + 0x00ac], %r24
T2_asi_reg_rd_6:
	mov	0x4, %r14
	.word 0xf0db8e60  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc0d6180  ! 288: LDUB_I	ldub	[%r21 + 0x0180], %r30
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 6)
	.word 0xf80d0000  ! 290: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf2c5e135  ! 291: LDSWA_I	ldswa	[%r23, + 0x0135] %asi, %r25
	.word 0xb4ac20e1  ! 292: ANDNcc_I	andncc 	%r16, 0x00e1, %r26
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982898  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 22)
	.word 0xfa844020  ! 295: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_7:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_26:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 6)
	.word 0xf6054000  ! 309: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf00c61dd  ! 310: LDUB_I	ldub	[%r17 + 0x01dd], %r24
	.word 0xfa144000  ! 311: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf4d5a0cf  ! 312: LDSHA_I	ldsha	[%r22, + 0x00cf] %asi, %r26
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_27:
	setx	0x1f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_8:
	mov	0x13, %r14
	.word 0xfadb8e60  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0x8994a14c  ! 317: WRPR_TICK_I	wrpr	%r18, 0x014c, %tick
cpu_intr_2_28:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_30:
	setx	0x1e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 326: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb834614c  ! 331: ORN_I	orn 	%r17, 0x014c, %r28
T2_asi_reg_rd_9:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf694c020  ! 340: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xf654a1c0  ! 345: LDSH_I	ldsh	[%r18 + 0x01c0], %r27
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc0da0c4  ! 348: LDUB_I	ldub	[%r22 + 0x00c4], %r30
	.word 0xfe84c020  ! 349: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xbcbca0a8  ! 350: XNORcc_I	xnorcc 	%r18, 0x00a8, %r30
	.word 0xf08d4020  ! 351: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xb834206e  ! 358: SUBC_I	orn 	%r16, 0x006e, %r28
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198380a  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
T2_asi_reg_rd_10:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 360: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf645c000  ! 363: LDSW_R	ldsw	[%r23 + %r0], %r27
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_31:
	setx	0x1e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6854020  ! 371: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
T2_asi_reg_rd_11:
	mov	0x1d, %r14
	.word 0xfcdb89e0  ! 372: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbe85e0cc  ! 373: ADDcc_I	addcc 	%r23, 0x00cc, %r31
	.word 0xb6348000  ! 377: ORN_R	orn 	%r18, %r0, %r27
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 4)
	.word 0xf88d6176  ! 382: LDUBA_I	lduba	[%r21, + 0x0176] %asi, %r28
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 28)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f42  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
	.word 0xb68460b3  ! 385: ADDcc_I	addcc 	%r17, 0x00b3, %r27
	.word 0xfcc50020  ! 388: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, c)
	.word 0xf4158000  ! 393: LDUH_R	lduh	[%r22 + %r0], %r26
T2_asi_reg_wr_13:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 395: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_32:
	setx	0x1f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_33:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 39)
	.word 0xfe44e0c1  ! 407: LDSW_I	ldsw	[%r19 + 0x00c1], %r31
	.word 0xb6bce15a  ! 412: XNORcc_I	xnorcc 	%r19, 0x015a, %r27
T2_asi_reg_rd_12:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8c561c9  ! 417: LDSWA_I	ldswa	[%r21, + 0x01c9] %asi, %r28
T2_asi_reg_wr_14:
	mov	0x21, %r14
	.word 0xfaf389e0  ! 420: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf08c4020  ! 422: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf494a19a  ! 428: LDUHA_I	lduha	[%r18, + 0x019a] %asi, %r26
T2_asi_reg_wr_15:
	mov	0x2d, %r14
	.word 0xfef38400  ! 429: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8cce1f4  ! 430: LDSBA_I	ldsba	[%r19, + 0x01f4] %asi, %r28
	.word 0xf20da025  ! 434: LDUB_I	ldub	[%r22 + 0x0025], %r25
T2_asi_reg_rd_13:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xa1902001  ! 437: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_2_34:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_16:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 446: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfad44020  ! 448: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xfa840020  ! 452: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_17:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 454: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 16)
	.word 0xf6d4e17e  ! 461: LDSHA_I	ldsha	[%r19, + 0x017e] %asi, %r27
	.word 0xf4942024  ! 462: LDUHA_I	lduha	[%r16, + 0x0024] %asi, %r26
T2_asi_reg_rd_14:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_18:
	mov	0x7, %r14
	.word 0xf2f38e80  ! 464: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfad58020  ! 465: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
	.word 0xf05d216a  ! 468: LDX_I	ldx	[%r20 + 0x016a], %r24
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_15:
	mov	0x21, %r14
	.word 0xf6db8400  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_16:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf25c200a  ! 473: LDX_I	ldx	[%r16 + 0x000a], %r25
cpu_intr_2_35:
	setx	0x230130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_19:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 478: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_36:
	setx	0x230006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 481: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf6dda040  ! 483: LDXA_I	ldxa	[%r22, + 0x0040] %asi, %r27
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 29)
	.word 0xf2c42138  ! 490: LDSWA_I	ldswa	[%r16, + 0x0138] %asi, %r25
T2_asi_reg_wr_21:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 491: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xba142146  ! 492: OR_I	or 	%r16, 0x0146, %r29
	.word 0xa1902001  ! 495: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, a)
	.word 0xfc95c020  ! 498: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
cpu_intr_2_37:
	setx	0x20002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6950000  ! 500: ORcc_R	orcc 	%r20, %r0, %r27
	.word 0xb53cd000  ! 501: SRAX_R	srax	%r19, %r0, %r26
	.word 0xf65da031  ! 502: LDX_I	ldx	[%r22 + 0x0031], %r27
cpu_intr_2_38:
	setx	0x200205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_39:
	setx	0x23010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbe2dc000  ! 513: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xf2848020  ! 514: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xb29d4000  ! 515: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xf25d0000  ! 517: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf0442111  ! 520: LDSW_I	ldsw	[%r16 + 0x0111], %r24
	.word 0xfec560dc  ! 521: LDSWA_I	ldswa	[%r21, + 0x00dc] %asi, %r31
	.word 0xfac58020  ! 525: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xf684c020  ! 528: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
T2_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 537: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2d4e1fe  ! 543: LDSHA_I	ldsha	[%r19, + 0x01fe] %asi, %r25
	.word 0xb3345000  ! 544: SRLX_R	srlx	%r17, %r0, %r25
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_40:
	setx	0x200016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd34e001  ! 548: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xb17d0400  ! 549: MOVR_R	movre	%r20, %r0, %r24
	.word 0xfc8560a0  ! 550: LDUWA_I	lduwa	[%r21, + 0x00a0] %asi, %r30
	.word 0xfac50020  ! 551: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_19:
	mov	0x4, %r14
	.word 0xf2db8e80  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_23:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 553: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf0d5c020  ! 555: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xf884602e  ! 559: LDUWA_I	lduwa	[%r17, + 0x002e] %asi, %r28
	.word 0xfa844020  ! 562: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_20:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 569: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_41:
	setx	0x20002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 574: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_21:
	mov	0x18, %r14
	.word 0xfadb89e0  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_42:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d58020  ! 590: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
cpu_intr_2_43:
	setx	0x210003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x200129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_45:
	setx	0x21030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc5c0000  ! 598: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xfe4c0000  ! 599: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfe150000  ! 602: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf685211d  ! 604: LDUWA_I	lduwa	[%r20, + 0x011d] %asi, %r27
	.word 0xfcc5e088  ! 607: LDSWA_I	ldswa	[%r23, + 0x0088] %asi, %r30
	.word 0xf25560bd  ! 609: LDSH_I	ldsh	[%r21 + 0x00bd], %r25
	.word 0xf494e14f  ! 612: LDUHA_I	lduha	[%r19, + 0x014f] %asi, %r26
	.word 0xf404a155  ! 615: LDUW_I	lduw	[%r18 + 0x0155], %r26
T2_asi_reg_wr_25:
	mov	0x33, %r14
	.word 0xf0f38400  ! 617: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfc042186  ! 618: LDUW_I	lduw	[%r16 + 0x0186], %r30
T2_asi_reg_rd_22:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 619: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe05611e  ! 620: LDUW_I	lduw	[%r21 + 0x011e], %r31
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_46:
	setx	0x21020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4c020  ! 626: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf045e085  ! 631: LDSW_I	ldsw	[%r23 + 0x0085], %r24
cpu_intr_2_47:
	setx	0x22002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_23:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	.word 0xb7643801  ! 639: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_26:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 640: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_48:
	setx	0x22002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_NONHPRIV
	.word 0xb88d0000  ! 657: ANDcc_R	andcc 	%r20, %r0, %r28
T2_asi_reg_rd_24:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4cdc020  ! 660: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_49:
	setx	0x200317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc446098  ! 663: LDSW_I	ldsw	[%r17 + 0x0098], %r30
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f48  ! 667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 25)
	.word 0xfedde119  ! 676: LDXA_I	ldxa	[%r23, + 0x0119] %asi, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_50:
	setx	0x210116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_27:
	mov	0x36, %r14
	.word 0xfcf38400  ! 681: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcc461a4  ! 682: LDSWA_I	ldswa	[%r17, + 0x01a4] %asi, %r30
cpu_intr_2_51:
	setx	0x210001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc458000  ! 684: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xf684e1de  ! 685: LDUWA_I	lduwa	[%r19, + 0x01de] %asi, %r27
cpu_intr_2_52:
	setx	0x21000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe040000  ! 688: LDUW_R	lduw	[%r16 + %r0], %r31
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e00  ! 690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e00, %hpstate
	.word 0xb23d21d8  ! 693: XNOR_I	xnor 	%r20, 0x01d8, %r25
	.word 0xf20c0000  ! 694: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xbaad613f  ! 695: ANDNcc_I	andncc 	%r21, 0x013f, %r29
	.word 0xf6dca029  ! 696: LDXA_I	ldxa	[%r18, + 0x0029] %asi, %r27
T2_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 698: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf65d8000  ! 701: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf6c5210f  ! 703: LDSWA_I	ldswa	[%r20, + 0x010f] %asi, %r27
	.word 0xf04c8000  ! 705: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf8040000  ! 706: LDUW_R	lduw	[%r16 + %r0], %r28
T2_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 708: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb4344000  ! 712: SUBC_R	orn 	%r17, %r0, %r26
	.word 0xf4d44020  ! 713: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	.word 0xfe8d8020  ! 715: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_30:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 716: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4c52118  ! 719: LDSWA_I	ldswa	[%r20, + 0x0118] %asi, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_53:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_25:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_31:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 731: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6d521dc  ! 733: LDSHA_I	ldsha	[%r20, + 0x01dc] %asi, %r27
	.word 0xf2150000  ! 736: LDUH_R	lduh	[%r20 + %r0], %r25
T2_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 738: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_26:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0x8995a117  ! 740: WRPR_TICK_I	wrpr	%r22, 0x0117, %tick
T2_asi_reg_wr_33:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 741: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f80  ! 746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3e)
	.word 0xbebde012  ! 754: XNORcc_I	xnorcc 	%r23, 0x0012, %r31
	.word 0xfacd6081  ! 758: LDSBA_I	ldsba	[%r21, + 0x0081] %asi, %r29
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, b)
	.word 0xf8958020  ! 764: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 37)
	.word 0xbe052102  ! 767: ADD_I	add 	%r20, 0x0102, %r31
	.word 0xbcbde0e5  ! 768: XNORcc_I	xnorcc 	%r23, 0x00e5, %r30
	.word 0xf045e132  ! 770: LDSW_I	ldsw	[%r23 + 0x0132], %r24
cpu_intr_2_54:
	setx	0x220333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a58000  ! 774: SUBcc_R	subcc 	%r22, %r0, %r28
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_55:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_56:
	setx	0x230106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 4)
	.word 0xbf347001  ! 786: SRLX_I	srlx	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6454000  ! 788: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xfcc54020  ! 789: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	.word 0xfc14a190  ! 791: LDUH_I	lduh	[%r18 + 0x0190], %r30
	.word 0xfc95a060  ! 792: LDUHA_I	lduha	[%r22, + 0x0060] %asi, %r30
	.word 0xb8346130  ! 794: SUBC_I	orn 	%r17, 0x0130, %r28
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 36)
	.word 0xf24ca087  ! 798: LDSB_I	ldsb	[%r18 + 0x0087], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_34:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 803: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfacce0d6  ! 804: LDSBA_I	ldsba	[%r19, + 0x00d6] %asi, %r29
	.word 0xf04de07e  ! 805: LDSB_I	ldsb	[%r23 + 0x007e], %r24
	.word 0xf25d20b4  ! 808: LDX_I	ldx	[%r20 + 0x00b4], %r25
cpu_intr_2_57:
	setx	0x220109, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_35:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 810: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf44cc000  ! 812: LDSB_R	ldsb	[%r19 + %r0], %r26
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f48  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f48, %hpstate
cpu_intr_2_58:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b40  ! 818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
	.word 0xf28c4020  ! 822: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_36:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 823: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_27:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_60:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8858020  ! 829: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xf84c0000  ! 835: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xf25dc000  ! 837: LDX_R	ldx	[%r23 + %r0], %r25
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_28:
	mov	0x2, %r14
	.word 0xf6db8400  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_29:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 842: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_37:
	mov	0xa, %r14
	.word 0xf4f38e80  ! 845: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_38:
	mov	0x12, %r14
	.word 0xf8f384a0  ! 850: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_61:
	setx	0x22022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_39:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 852: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc154000  ! 855: LDUH_R	lduh	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf20de16e  ! 858: LDUB_I	ldub	[%r23 + 0x016e], %r25
	.word 0xf6d4c020  ! 862: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 9)
	.word 0xf084c020  ! 868: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xfa84c020  ! 869: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
	.word 0xfad50020  ! 872: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 874: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf89521c4  ! 875: LDUHA_I	lduha	[%r20, + 0x01c4] %asi, %r28
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf40d6185  ! 879: LDUB_I	ldub	[%r21 + 0x0185], %r26
	.word 0xfa8d6118  ! 882: LDUBA_I	lduba	[%r21, + 0x0118] %asi, %r29
	.word 0xb77d2401  ! 885: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xfac4e046  ! 886: LDSWA_I	ldswa	[%r19, + 0x0046] %asi, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 895: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_42:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 901: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_62:
	setx	0x210310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a187  ! 908: WRPR_TPC_I	wrpr	%r22, 0x0187, %tpc
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 3)
	.word 0xbf3d5000  ! 913: SRAX_R	srax	%r21, %r0, %r31
T2_asi_reg_wr_43:
	mov	0x29, %r14
	.word 0xf8f38400  ! 914: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf61420d2  ! 915: LDUH_I	lduh	[%r16 + 0x00d2], %r27
	.word 0xb57c0400  ! 918: MOVR_R	movre	%r16, %r0, %r26
	.word 0x89956188  ! 919: WRPR_TICK_I	wrpr	%r21, 0x0188, %tick
	.word 0xfaccc020  ! 920: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xf24460ab  ! 922: LDSW_I	ldsw	[%r17 + 0x00ab], %r25
	.word 0xfccce165  ! 923: LDSBA_I	ldsba	[%r19, + 0x0165] %asi, %r30
cpu_intr_2_63:
	setx	0x250308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdda1e5  ! 925: LDXA_I	ldxa	[%r22, + 0x01e5] %asi, %r30
T2_asi_reg_wr_44:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 926: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_64:
	setx	0x24030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_30:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfacc4020  ! 934: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
	.word 0xf894a023  ! 935: LDUHA_I	lduha	[%r18, + 0x0023] %asi, %r28
	.word 0xf4dc61e9  ! 945: LDXA_I	ldxa	[%r17, + 0x01e9] %asi, %r26
	.word 0xf0c50020  ! 947: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfc44a0ed  ! 949: LDSW_I	ldsw	[%r18 + 0x00ed], %r30
	.word 0xb88d0000  ! 950: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xfe15215e  ! 951: LDUH_I	lduh	[%r20 + 0x015e], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_65:
	setx	0x26002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 14)
	.word 0xfc156046  ! 962: LDUH_I	lduh	[%r21 + 0x0046], %r30
T2_asi_reg_rd_31:
	mov	0x2d, %r14
	.word 0xfcdb89e0  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_32:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 966: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_33:
	mov	0x2f, %r14
	.word 0xf6db84a0  ! 969: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf205219b  ! 971: LDUW_I	lduw	[%r20 + 0x019b], %r25
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_66:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dd20af  ! 983: LDXA_I	ldxa	[%r20, + 0x00af] %asi, %r28
	.word 0xfa8521dc  ! 987: LDUWA_I	lduwa	[%r20, + 0x01dc] %asi, %r29
	.word 0xf40de0e8  ! 989: LDUB_I	ldub	[%r23 + 0x00e8], %r26
	.word 0xb0058000  ! 991: ADD_R	add 	%r22, %r0, %r24
	.word 0xb8bc0000  ! 992: XNORcc_R	xnorcc 	%r16, %r0, %r28
cpu_intr_2_67:
	setx	0x250103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d8020  ! 995: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
	.word 0xf24ca169  ! 996: LDSB_I	ldsb	[%r18 + 0x0169], %r25
cpu_intr_2_68:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_69:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf4c5219e  ! 1004: LDSWA_I	ldswa	[%r20, + 0x019e] %asi, %r26
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_45:
	mov	0x2, %r14
	.word 0xfef38e60  ! 1008: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f12  ! 1009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	.word 0xf8158000  ! 1010: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xfa4c8000  ! 1011: LDSB_R	ldsb	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_70:
	setx	0x250206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe14c000  ! 1022: LDUH_R	lduh	[%r19 + %r0], %r31
cpu_intr_2_71:
	setx	0x270027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2540000  ! 1027: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xfcc5c020  ! 1029: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_34:
	mov	0x1, %r14
	.word 0xf2db8400  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf80561b1  ! 1034: LDUW_I	lduw	[%r21 + 0x01b1], %r28
cpu_intr_2_72:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1036: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf44ce180  ! 1037: LDSB_I	ldsb	[%r19 + 0x0180], %r26
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_73:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_TO_TL1
	.word 0xf61520a2  ! 1052: LDUH_I	lduh	[%r20 + 0x00a2], %r27
	.word 0xf25561d8  ! 1053: LDSH_I	ldsh	[%r21 + 0x01d8], %r25
cpu_intr_2_74:
	setx	0x25002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8042059  ! 1061: LDUW_I	lduw	[%r16 + 0x0059], %r28
	.word 0xfe144000  ! 1062: LDUH_R	lduh	[%r17 + %r0], %r31
cpu_intr_2_75:
	setx	0x270101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0154000  ! 1065: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xfc840020  ! 1066: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_47:
	mov	0xe, %r14
	.word 0xfef38e60  ! 1069: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_35:
	mov	0x2a, %r14
	.word 0xf0db8e60  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_48:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 1076: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfc4ce0e7  ! 1079: LDSB_I	ldsb	[%r19 + 0x00e7], %r30
	.word 0xf0058000  ! 1080: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf414e16a  ! 1082: LDUH_I	lduh	[%r19 + 0x016a], %r26
T2_asi_reg_rd_36:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb8b50000  ! 1084: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xf005e158  ! 1092: LDUW_I	lduw	[%r23 + 0x0158], %r24
T2_asi_reg_wr_49:
	mov	0x26, %r14
	.word 0xfef38e60  ! 1093: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_77:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x240336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_79:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a8a  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xf80dc000  ! 1103: LDUB_R	ldub	[%r23 + %r0], %r28
T2_asi_reg_rd_37:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4c44020  ! 1105: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_38:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 1109: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_39:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 1112: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_40:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 1122: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4948020  ! 1123: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
	.word 0xfa5d6066  ! 1124: LDX_I	ldx	[%r21 + 0x0066], %r29
T2_asi_reg_rd_41:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 1125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf214c000  ! 1130: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf6450000  ! 1131: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe140000  ! 1132: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xb69421c2  ! 1136: ORcc_I	orcc 	%r16, 0x01c2, %r27
	.word 0xb12c3001  ! 1140: SLLX_I	sllx	%r16, 0x0001, %r24
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cc2  ! 1141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
T2_asi_reg_wr_51:
	mov	0x1d, %r14
	.word 0xfef384a0  ! 1143: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_80:
	setx	0x240117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba344000  ! 1149: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xfc95e147  ! 1151: LDUHA_I	lduha	[%r23, + 0x0147] %asi, %r30
cpu_intr_2_81:
	setx	0x250102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_82:
	setx	0x260008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_83:
	setx	0x26033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_84:
	setx	0x27020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_85:
	setx	0x24013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1161: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf45c0000  ! 1163: LDX_R	ldx	[%r16 + %r0], %r26
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, c)
	.word 0xf80de181  ! 1166: LDUB_I	ldub	[%r23 + 0x0181], %r28
	.word 0xf65cc000  ! 1167: LDX_R	ldx	[%r19 + %r0], %r27
T2_asi_reg_wr_53:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 1169: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf88c604d  ! 1172: LDUBA_I	lduba	[%r17, + 0x004d] %asi, %r28
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_42:
	mov	0x9, %r14
	.word 0xf2db8400  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_86:
	setx	0x24020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 6)
	.word 0xf28ca0a9  ! 1188: LDUBA_I	lduba	[%r18, + 0x00a9] %asi, %r25
cpu_intr_2_88:
	setx	0x25030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fca  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
	.word 0xf205c000  ! 1197: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfc0c6165  ! 1198: LDUB_I	ldub	[%r17 + 0x0165], %r30
	.word 0xfacca1a3  ! 1200: LDSBA_I	ldsba	[%r18, + 0x01a3] %asi, %r29
	.word 0xb53de001  ! 1207: SRA_I	sra 	%r23, 0x0001, %r26
T2_asi_reg_wr_54:
	mov	0x2b, %r14
	.word 0xf0f384a0  ! 1208: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_43:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_55:
	mov	0x1d, %r14
	.word 0xf6f38400  ! 1216: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf8cd8020  ! 1217: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, c)
	.word 0xfc440000  ! 1219: LDSW_R	ldsw	[%r16 + %r0], %r30
cpu_intr_2_89:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c212e  ! 1225: LDUB_I	ldub	[%r16 + 0x012e], %r25
	.word 0xfc54604c  ! 1231: LDSH_I	ldsh	[%r17 + 0x004c], %r30
cpu_intr_2_90:
	setx	0x25023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, a)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 22)
	.word 0xfadc20b3  ! 1238: LDXA_I	ldxa	[%r16, + 0x00b3] %asi, %r29
	ta	T_CHANGE_TO_TL1
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_91:
	setx	0x240312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x260037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f02  ! 1253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
T2_asi_reg_wr_56:
	mov	0x30, %r14
	.word 0xfcf38e80  ! 1257: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_93:
	setx	0x260001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_94:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_95:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_96:
	setx	0x24011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c4000  ! 1271: LDSB_R	ldsb	[%r17 + %r0], %r29
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_57:
	mov	0xa, %r14
	.word 0xfaf38e60  ! 1276: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfacc616c  ! 1279: LDSBA_I	ldsba	[%r17, + 0x016c] %asi, %r29
cpu_intr_2_97:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_58:
	mov	0x16, %r14
	.word 0xf4f38400  ! 1284: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xbab56085  ! 1290: SUBCcc_I	orncc 	%r21, 0x0085, %r29
	.word 0xf80ca042  ! 1291: LDUB_I	ldub	[%r18 + 0x0042], %r28
	.word 0xf044c000  ! 1292: LDSW_R	ldsw	[%r19 + %r0], %r24
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 21)
	.word 0xfed5c020  ! 1300: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
T2_asi_reg_wr_59:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 1301: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983dd0  ! 1303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd0, %hpstate
	.word 0xf6940020  ! 1306: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xb2154000  ! 1308: OR_R	or 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_60:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 1315: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 16)
	.word 0xfcdce146  ! 1319: LDXA_I	ldxa	[%r19, + 0x0146] %asi, %r30
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_98:
	setx	0x270007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4442045  ! 1322: LDSW_I	ldsw	[%r16 + 0x0045], %r26
cpu_intr_2_99:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5a07d  ! 1327: LDSWA_I	ldswa	[%r22, + 0x007d] %asi, %r31
T2_asi_reg_wr_61:
	mov	0x2, %r14
	.word 0xf0f38400  ! 1329: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_62:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1331: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb68c615c  ! 1332: ANDcc_I	andcc 	%r17, 0x015c, %r27
T2_asi_reg_wr_63:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 1333: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_100:
	setx	0x240118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40521af  ! 1335: LDUW_I	lduw	[%r20 + 0x01af], %r26
	.word 0xfa948020  ! 1336: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
cpu_intr_2_101:
	setx	0x25032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_102:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_64:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 1339: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb00c615b  ! 1340: AND_I	and 	%r17, 0x015b, %r24
T2_asi_reg_rd_44:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_45:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 1344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 1345: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xf605a00a  ! 1349: LDUW_I	lduw	[%r22 + 0x000a], %r27
cpu_intr_2_103:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 9)
	.word 0xfac58020  ! 1354: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xf6150000  ! 1355: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xfedd6044  ! 1356: LDXA_I	ldxa	[%r21, + 0x0044] %asi, %r31
	.word 0xf8050000  ! 1362: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xba1d4000  ! 1363: XOR_R	xor 	%r21, %r0, %r29
	.word 0xf295a06d  ! 1365: LDUHA_I	lduha	[%r22, + 0x006d] %asi, %r25
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf68c4020  ! 1368: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
cpu_intr_2_104:
	setx	0x250305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d4000  ! 1371: LDX_R	ldx	[%r21 + %r0], %r28
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0cd4020  ! 1379: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f80  ! 1380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
	.word 0xf4cdc020  ! 1387: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_46:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_105:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 1392: MOVR_R	movre	%r23, %r0, %r29
	.word 0xfc952114  ! 1395: LDUHA_I	lduha	[%r20, + 0x0114] %asi, %r30
	.word 0xb2ada023  ! 1397: ANDNcc_I	andncc 	%r22, 0x0023, %r25
T2_asi_reg_rd_47:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_106:
	setx	0x2b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6044000  ! 1409: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xfc0da042  ! 1410: LDUB_I	ldub	[%r22 + 0x0042], %r30
cpu_intr_2_107:
	setx	0x280305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x2a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_66:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 1416: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2d5a015  ! 1418: LDSHA_I	ldsha	[%r22, + 0x0015] %asi, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf85cc000  ! 1423: LDX_R	ldx	[%r19 + %r0], %r28
cpu_intr_2_109:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45e010  ! 1426: LDSW_I	ldsw	[%r23 + 0x0010], %r30
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_110:
	setx	0x290128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6952070  ! 1432: LDUHA_I	lduha	[%r20, + 0x0070] %asi, %r27
	.word 0xf0454000  ! 1433: LDSW_R	ldsw	[%r21 + %r0], %r24
cpu_intr_2_111:
	setx	0x2b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_67:
	mov	0x13, %r14
	.word 0xfaf389e0  ! 1436: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xf2058000  ! 1440: LDUW_R	lduw	[%r22 + %r0], %r25
T2_asi_reg_wr_68:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 1442: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL1
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf25da161  ! 1455: LDX_I	ldx	[%r22 + 0x0161], %r25
	.word 0xf08c212b  ! 1456: LDUBA_I	lduba	[%r16, + 0x012b] %asi, %r24
	.word 0xfc958020  ! 1457: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xfa4da0aa  ! 1458: LDSB_I	ldsb	[%r22 + 0x00aa], %r29
cpu_intr_2_112:
	setx	0x280010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95c020  ! 1465: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
cpu_intr_2_113:
	setx	0x2b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d8020  ! 1470: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf044c000  ! 1474: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xb63520b4  ! 1475: ORN_I	orn 	%r20, 0x00b4, %r27
	.word 0xfe45e122  ! 1478: LDSW_I	ldsw	[%r23 + 0x0122], %r31
cpu_intr_2_114:
	setx	0x2a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_115:
	setx	0x290103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 37)
	.word 0xfe0560a0  ! 1486: LDUW_I	lduw	[%r21 + 0x00a0], %r31
cpu_intr_2_116:
	setx	0x280236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_117:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8946169  ! 1493: LDUHA_I	lduha	[%r17, + 0x0169] %asi, %r28
T2_asi_reg_rd_48:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa5d4000  ! 1501: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfe1461c4  ! 1503: LDUH_I	lduh	[%r17 + 0x01c4], %r31
	.word 0xfc944020  ! 1504: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xfed58020  ! 1505: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_69:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 1506: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_118:
	setx	0x2b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484207b  ! 1510: LDUWA_I	lduwa	[%r16, + 0x007b] %asi, %r26
T2_asi_reg_rd_49:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_119:
	setx	0x280104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24cc000  ! 1514: LDSB_R	ldsb	[%r19 + %r0], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe8d8020  ! 1518: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
	.word 0xf80d6025  ! 1520: LDUB_I	ldub	[%r21 + 0x0025], %r28
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_50:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 1522: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf00de187  ! 1525: LDUB_I	ldub	[%r23 + 0x0187], %r24
	.word 0xf8d40020  ! 1526: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
	.word 0xb2a5e164  ! 1527: SUBcc_I	subcc 	%r23, 0x0164, %r25
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_120:
	setx	0x2a0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983880  ! 1532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1880, %hpstate
cpu_intr_2_121:
	setx	0x2a032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_51:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 1534: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_122:
	setx	0x2a0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_123:
	setx	0x2a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_124:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_52:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf25d8000  ! 1546: LDX_R	ldx	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_70:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 1548: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_53:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 1551: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_125:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_71:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 1554: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4d48020  ! 1559: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc840020  ! 1562: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
cpu_intr_2_126:
	setx	0x290014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x2b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_72:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 1569: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 31)
	.word 0xb89d8000  ! 1573: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xf08ce1d1  ! 1574: LDUBA_I	lduba	[%r19, + 0x01d1] %asi, %r24
cpu_intr_2_128:
	setx	0x290223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x28031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_130:
	setx	0x2b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2544000  ! 1586: LDSH_R	ldsh	[%r17 + %r0], %r25
cpu_intr_2_132:
	setx	0x280222, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819839d2  ! 1591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d2, %hpstate
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, f)
	.word 0xb134d000  ! 1594: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xb0b44000  ! 1595: SUBCcc_R	orncc 	%r17, %r0, %r24
cpu_intr_2_133:
	setx	0x29010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d7001  ! 1597: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xbc0c0000  ! 1598: AND_R	and 	%r16, %r0, %r30
	.word 0xbb35a001  ! 1601: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xf28c4020  ! 1602: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
cpu_intr_2_134:
	setx	0x280127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_73:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb73c3001  ! 1612: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xfcdca1de  ! 1613: LDXA_I	ldxa	[%r18, + 0x01de] %asi, %r30
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 20)
	.word 0xf8458000  ! 1622: LDSW_R	ldsw	[%r22 + %r0], %r28
cpu_intr_2_135:
	setx	0x280103, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982848  ! 1628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 36)
	.word 0xf64d8000  ! 1636: LDSB_R	ldsb	[%r22 + %r0], %r27
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_54:
	mov	0xf, %r14
	.word 0xf4db8400  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_136:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_137:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
cpu_intr_2_138:
	setx	0x290331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_139:
	setx	0x2b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84205a  ! 1656: LDUWA_I	lduwa	[%r16, + 0x005a] %asi, %r31
cpu_intr_2_140:
	setx	0x29002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 1660: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf40c0000  ! 1661: LDUB_R	ldub	[%r16 + %r0], %r26
T2_asi_reg_rd_56:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_141:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_75:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1678: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe14c000  ! 1680: LDUH_R	lduh	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0xfa956022  ! 1684: LDUHA_I	lduha	[%r21, + 0x0022] %asi, %r29
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a10  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
T2_asi_reg_rd_57:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 1686: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc144000  ! 1687: LDUH_R	lduh	[%r17 + %r0], %r30
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 4)
	.word 0xfa854020  ! 1691: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xf414c000  ! 1692: LDUH_R	lduh	[%r19 + %r0], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf0850020  ! 1700: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfad4e0b2  ! 1704: LDSHA_I	ldsha	[%r19, + 0x00b2] %asi, %r29
T2_asi_reg_rd_58:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1705: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_142:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebd0000  ! 1710: XNORcc_R	xnorcc 	%r20, %r0, %r31
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 19)
	.word 0xfecd0020  ! 1714: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf0c5612c  ! 1715: LDSWA_I	ldswa	[%r21, + 0x012c] %asi, %r24
	.word 0xf2d5a0e5  ! 1720: LDSHA_I	ldsha	[%r22, + 0x00e5] %asi, %r25
	.word 0xfac40020  ! 1724: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
	.word 0xf015e004  ! 1726: LDUH_I	lduh	[%r23 + 0x0004], %r24
	.word 0xbcbd0000  ! 1727: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xf4450000  ! 1728: LDSW_R	ldsw	[%r20 + %r0], %r26
cpu_intr_2_143:
	setx	0x280321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8358000  ! 1730: ORN_R	orn 	%r22, %r0, %r28
T2_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 1734: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfed4e16d  ! 1737: LDSHA_I	ldsha	[%r19, + 0x016d] %asi, %r31
	.word 0xb52cc000  ! 1740: SLL_R	sll 	%r19, %r0, %r26
cpu_intr_2_144:
	setx	0x2b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd4020  ! 1746: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	.word 0xf60ce089  ! 1749: LDUB_I	ldub	[%r19 + 0x0089], %r27
	.word 0xf45d8000  ! 1750: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xf6c54020  ! 1753: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r27
	.word 0xfe84c020  ! 1755: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xfc0d0000  ! 1756: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xfa54e145  ! 1758: LDSH_I	ldsh	[%r19 + 0x0145], %r29
T2_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 1759: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_59:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf08da185  ! 1761: LDUBA_I	lduba	[%r22, + 0x0185] %asi, %r24
cpu_intr_2_145:
	setx	0x290129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_78:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 1764: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe946180  ! 1768: LDUHA_I	lduha	[%r17, + 0x0180] %asi, %r31
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_79:
	mov	0x28, %r14
	.word 0xf8f38e60  ! 1773: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe55605e  ! 1774: LDSH_I	ldsh	[%r21 + 0x005e], %r31
T2_asi_reg_rd_60:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_146:
	setx	0x2a021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c2001  ! 1780: SRA_I	sra 	%r16, 0x0001, %r31
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_147:
	setx	0x2a0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 1786: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfacd6117  ! 1788: LDSBA_I	ldsba	[%r21, + 0x0117] %asi, %r29
	.word 0xf6dda131  ! 1789: LDXA_I	ldxa	[%r22, + 0x0131] %asi, %r27
cpu_intr_2_148:
	setx	0x29033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5e15e  ! 1792: LDSHA_I	ldsha	[%r23, + 0x015e] %asi, %r26
T2_asi_reg_rd_61:
	mov	0x28, %r14
	.word 0xfedb8e80  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_149:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_150:
	setx	0x29021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80dc000  ! 1799: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_151:
	setx	0x28011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_152:
	setx	0x2a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_81:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 1807: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb68c6177  ! 1808: ANDcc_I	andcc 	%r17, 0x0177, %r27
	.word 0xbabd8000  ! 1811: XNORcc_R	xnorcc 	%r22, %r0, %r29
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_62:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 1813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf40d8000  ! 1823: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfa554000  ! 1824: LDSH_R	ldsh	[%r21 + %r0], %r29
T2_asi_reg_wr_82:
	mov	0x2e, %r14
	.word 0xf2f38400  ! 1826: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_63:
	mov	0x2c, %r14
	.word 0xfcdb84a0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 1831: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xfec4c020  ! 1836: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xbb7d4400  ! 1837: MOVR_R	movre	%r21, %r0, %r29
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa950020  ! 1842: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_64:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf48d4020  ! 1848: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfec4e0aa  ! 1851: LDSWA_I	ldswa	[%r19, + 0x00aa] %asi, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb60dc000  ! 1857: AND_R	and 	%r23, %r0, %r27
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198398a  ! 1860: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
cpu_intr_2_153:
	setx	0x2f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_65:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_154:
	setx	0x2c020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_155:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_84:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 1878: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbe15a160  ! 1885: OR_I	or 	%r22, 0x0160, %r31
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983880  ! 1886: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1880, %hpstate
	.word 0xf60420a4  ! 1889: LDUW_I	lduw	[%r16 + 0x00a4], %r27
	.word 0xf04d6150  ! 1890: LDSB_I	ldsb	[%r21 + 0x0150], %r24
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 4)
	.word 0xf0456108  ! 1897: LDSW_I	ldsw	[%r21 + 0x0108], %r24
	.word 0xf08ca028  ! 1898: LDUBA_I	lduba	[%r18, + 0x0028] %asi, %r24
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 14)
	.word 0xf88d603f  ! 1902: LDUBA_I	lduba	[%r21, + 0x003f] %asi, %r28
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_NONHPRIV
	.word 0xf695e0f3  ! 1907: LDUHA_I	lduha	[%r23, + 0x00f3] %asi, %r27
	.word 0xfc8c8020  ! 1908: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xf80ce1c6  ! 1909: LDUB_I	ldub	[%r19 + 0x01c6], %r28
	.word 0xf4cde18e  ! 1911: LDSBA_I	ldsba	[%r23, + 0x018e] %asi, %r26
T2_asi_reg_wr_85:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 1913: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf40cc000  ! 1914: LDUB_R	ldub	[%r19 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_66:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb08d8000  ! 1921: ANDcc_R	andcc 	%r22, %r0, %r24
cpu_intr_2_156:
	setx	0x2d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbc446153  ! 1925: ADDC_I	addc 	%r17, 0x0153, %r30
	.word 0xf65d6140  ! 1930: LDX_I	ldx	[%r21 + 0x0140], %r27
	.word 0xfe5cc000  ! 1931: LDX_R	ldx	[%r19 + %r0], %r31
T2_asi_reg_wr_86:
	mov	0x1f, %r14
	.word 0xf0f38e80  ! 1932: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_67:
	mov	0x24, %r14
	.word 0xf6db89e0  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfc8461c1  ! 1936: LDUWA_I	lduwa	[%r17, + 0x01c1] %asi, %r30
cpu_intr_2_157:
	setx	0x2d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe448000  ! 1939: LDSW_R	ldsw	[%r18 + %r0], %r31
cpu_intr_2_158:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e1b1  ! 1942: ORNcc_I	orncc 	%r23, 0x01b1, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_159:
	setx	0x2f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa0c6184  ! 1952: LDUB_I	ldub	[%r17 + 0x0184], %r29
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_68:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 1956: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8d54020  ! 1957: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
	.word 0x8395208c  ! 1961: WRPR_TNPC_I	wrpr	%r20, 0x008c, %tnpc
	.word 0xfecda0ec  ! 1963: LDSBA_I	ldsba	[%r22, + 0x00ec] %asi, %r31
	.word 0xfecd60cb  ! 1964: LDSBA_I	ldsba	[%r21, + 0x00cb] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_87:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 1973: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf6d4c020  ! 1974: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
	.word 0xfcccc020  ! 1975: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
cpu_intr_2_160:
	setx	0x2d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 1979: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb8c5c000  ! 1982: ADDCcc_R	addccc 	%r23, %r0, %r28
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_69:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_89:
	mov	0x7, %r14
	.word 0xfef38e80  ! 1985: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 36)
	.word 0xfcd560ba  ! 1991: LDSHA_I	ldsha	[%r21, + 0x00ba] %asi, %r30
	.word 0xf2d521d7  ! 1992: LDSHA_I	ldsha	[%r20, + 0x01d7] %asi, %r25
cpu_intr_2_161:
	setx	0x2f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c0000  ! 1994: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xb68c4000  ! 1997: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xf45d4000  ! 1998: LDX_R	ldx	[%r21 + %r0], %r26
T2_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_90:
	mov	0x28, %r14
	.word 0xf8f38400  ! 2002: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0x8795a147  ! 2003: WRPR_TT_I	wrpr	%r22, 0x0147, %tt
T2_asi_reg_rd_71:
	mov	0x33, %r14
	.word 0xf0db8e60  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfe154000  ! 2007: LDUH_R	lduh	[%r21 + %r0], %r31
cpu_intr_2_162:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_163:
	setx	0x2c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d54020  ! 2015: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, a)
	.word 0xf04d8000  ! 2017: LDSB_R	ldsb	[%r22 + %r0], %r24
T2_asi_reg_wr_91:
	mov	0x13, %r14
	.word 0xfef38e40  ! 2018: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf4848020  ! 2021: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
	.word 0xf6550000  ! 2022: LDSH_R	ldsh	[%r20 + %r0], %r27
cpu_intr_2_164:
	setx	0x2d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2452038  ! 2029: LDSW_I	ldsw	[%r20 + 0x0038], %r25
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2032: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_165:
	setx	0x2d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
	.word 0xb2b48000  ! 2049: SUBCcc_R	orncc 	%r18, %r0, %r25
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_166:
	setx	0x2e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_92:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2055: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_167:
	setx	0x2f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4944020  ! 2058: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_73:
	mov	0xf, %r14
	.word 0xf8db8400  ! 2059: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_74:
	mov	0x6, %r14
	.word 0xf0db8400  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_168:
	setx	0x2c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_93:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 2067: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_94:
	mov	0x14, %r14
	.word 0xf4f389e0  ! 2068: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_95:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 2071: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf0c54020  ! 2072: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xfe448000  ! 2074: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfed58020  ! 2075: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xfac460a8  ! 2081: LDSWA_I	ldswa	[%r17, + 0x00a8] %asi, %r29
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 22)
	.word 0xf04de116  ! 2085: LDSB_I	ldsb	[%r23 + 0x0116], %r24
cpu_intr_2_169:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd6077  ! 2090: LDSBA_I	ldsba	[%r21, + 0x0077] %asi, %r24
	.word 0xf615e00b  ! 2092: LDUH_I	lduh	[%r23 + 0x000b], %r27
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_170:
	setx	0x2d032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d48020  ! 2096: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 14)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f00  ! 2101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f00, %hpstate
	.word 0xfe1461ed  ! 2106: LDUH_I	lduh	[%r17 + 0x01ed], %r31
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_171:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_172:
	setx	0x2d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 15)
	.word 0xf0144000  ! 2121: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf85c8000  ! 2123: LDX_R	ldx	[%r18 + %r0], %r28
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_96:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 2127: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 23)
	.word 0xf2cde0ab  ! 2133: LDSBA_I	ldsba	[%r23, + 0x00ab] %asi, %r25
cpu_intr_2_173:
	setx	0x2f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d44020  ! 2136: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	.word 0xf84da197  ! 2137: LDSB_I	ldsb	[%r22 + 0x0197], %r28
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 33)
	.word 0xb1344000  ! 2147: SRL_R	srl 	%r17, %r0, %r24
	.word 0xb2358000  ! 2149: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xfa5421c5  ! 2154: LDSH_I	ldsh	[%r16 + 0x01c5], %r29
T2_asi_reg_rd_75:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 2155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6144000  ! 2159: LDUH_R	lduh	[%r17 + %r0], %r27
T2_asi_reg_rd_76:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fca  ! 2161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_174:
	setx	0x2e0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x2f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_97:
	mov	0x7, %r14
	.word 0xf8f384a0  ! 2168: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
cpu_intr_2_176:
	setx	0x2e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 13)
	.word 0xb09d8000  ! 2176: XORcc_R	xorcc 	%r22, %r0, %r24
	.word 0xb52c9000  ! 2177: SLLX_R	sllx	%r18, %r0, %r26
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfcc4c020  ! 2182: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
T2_asi_reg_wr_98:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 2183: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_99:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2188: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfed48020  ! 2191: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_100:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 2198: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_101:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 2201: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_102:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2202: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_77:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_177:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_178:
	setx	0x2c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4058000  ! 2209: LDUW_R	lduw	[%r22 + %r0], %r26
cpu_intr_2_179:
	setx	0x2f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_103:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 2216: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf214e063  ! 2218: LDUH_I	lduh	[%r19 + 0x0063], %r25
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 8)
	.word 0xf495c020  ! 2225: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_104:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 2229: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_180:
	setx	0x2c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc61dd  ! 2232: LDSBA_I	ldsba	[%r17, + 0x01dd] %asi, %r26
	.word 0xfed5c020  ! 2233: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xbeb4e1bf  ! 2234: ORNcc_I	orncc 	%r19, 0x01bf, %r31
T2_asi_reg_wr_105:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 2235: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_106:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2237: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_78:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 2240: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_181:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c20d8  ! 2252: LDUBA_I	lduba	[%r16, + 0x00d8] %asi, %r30
cpu_intr_2_182:
	setx	0x2d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb8c420cc  ! 2261: ADDCcc_I	addccc 	%r16, 0x00cc, %r28
T2_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2262: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_107:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 2263: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 3)
	.word 0xf88ca19a  ! 2266: LDUBA_I	lduba	[%r18, + 0x019a] %asi, %r28
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 25)
	.word 0x8595e14e  ! 2268: WRPR_TSTATE_I	wrpr	%r23, 0x014e, %tstate
	.word 0xbf3d5000  ! 2269: SRAX_R	srax	%r21, %r0, %r31
T2_asi_reg_wr_108:
	mov	0x2b, %r14
	.word 0xf0f38400  ! 2270: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_183:
	setx	0x2c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05c000  ! 2278: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf20c0000  ! 2279: LDUB_R	ldub	[%r16 + %r0], %r25
cpu_intr_2_185:
	setx	0x2c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0052145  ! 2281: LDUW_I	lduw	[%r20 + 0x0145], %r24
T2_asi_reg_rd_80:
	mov	0x8, %r14
	.word 0xf8db8400  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ac8  ! 2284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
	.word 0xf6d46033  ! 2286: LDSHA_I	ldsha	[%r17, + 0x0033] %asi, %r27
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf48d4020  ! 2289: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_81:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf68c6128  ! 2293: LDUBA_I	lduba	[%r17, + 0x0128] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf05ca158  ! 2295: LDX_I	ldx	[%r18 + 0x0158], %r24
	.word 0xf80de144  ! 2297: LDUB_I	ldub	[%r23 + 0x0144], %r28
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_NONHPRIV
	.word 0xf44c6047  ! 2303: LDSB_I	ldsb	[%r17 + 0x0047], %r26
cpu_intr_2_186:
	setx	0x2f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5a140  ! 2306: LDSHA_I	ldsha	[%r22, + 0x0140] %asi, %r27
T2_asi_reg_rd_82:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc94a15a  ! 2310: LDUHA_I	lduha	[%r18, + 0x015a] %asi, %r30
T2_asi_reg_wr_109:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 2311: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9355000  ! 2312: SRLX_R	srlx	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d5c020  ! 2323: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
T2_asi_reg_rd_83:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 2326: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb1480000  ! 2328: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfc95a0d2  ! 2330: LDUHA_I	lduha	[%r22, + 0x00d2] %asi, %r30
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_187:
	setx	0x330000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x30031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_110:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 2341: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa850020  ! 2343: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
	.word 0xf8d56055  ! 2344: LDSHA_I	ldsha	[%r21, + 0x0055] %asi, %r28
cpu_intr_2_189:
	setx	0x30001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d8000  ! 2352: XORcc_R	xorcc 	%r22, %r0, %r29
T2_asi_reg_rd_85:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfc0cc000  ! 2355: LDUB_R	ldub	[%r19 + %r0], %r30
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_86:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf405e19a  ! 2366: LDUW_I	lduw	[%r23 + 0x019a], %r26
	.word 0xf4d4a037  ! 2367: LDSHA_I	ldsha	[%r18, + 0x0037] %asi, %r26
	.word 0xbebd4000  ! 2369: XNORcc_R	xnorcc 	%r21, %r0, %r31
	.word 0xf0d5e0f6  ! 2371: LDSHA_I	ldsha	[%r23, + 0x00f6] %asi, %r24
	.word 0xfe4cc000  ! 2373: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xb244e1a5  ! 2378: ADDC_I	addc 	%r19, 0x01a5, %r25
	.word 0xbd641800  ! 2379: MOVcc_R	<illegal instruction>
	.word 0xf44d60d9  ! 2382: LDSB_I	ldsb	[%r21 + 0x00d9], %r26
	.word 0xfa5c614f  ! 2383: LDX_I	ldx	[%r17 + 0x014f], %r29
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 26)
	.word 0xfed50020  ! 2385: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba15a010  ! 2390: OR_I	or 	%r22, 0x0010, %r29
cpu_intr_2_190:
	setx	0x330135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d2001  ! 2393: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xb0858000  ! 2398: ADDcc_R	addcc 	%r22, %r0, %r24
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_87:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_191:
	setx	0x31021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 2410: RDPR_PIL	<illegal instruction>
cpu_intr_2_192:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, c)
	.word 0xfa848020  ! 2419: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	.word 0xfa5c0000  ! 2420: LDX_R	ldx	[%r16 + %r0], %r29
T2_asi_reg_rd_88:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 2421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4c4205c  ! 2422: LDSWA_I	ldswa	[%r16, + 0x005c] %asi, %r26
cpu_intr_2_193:
	setx	0x310218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_194:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40dc000  ! 2427: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf4952175  ! 2428: LDUHA_I	lduha	[%r20, + 0x0175] %asi, %r26
T2_asi_reg_rd_89:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf44dc000  ! 2431: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xfc4c6188  ! 2432: LDSB_I	ldsb	[%r17 + 0x0188], %r30
T2_asi_reg_wr_111:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 2433: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_90:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 2435: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0044000  ! 2441: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xf2dc601a  ! 2442: LDXA_I	ldxa	[%r17, + 0x001a] %asi, %r25
	.word 0xf25c202d  ! 2444: LDX_I	ldx	[%r16 + 0x002d], %r25
cpu_intr_2_195:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 2447: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf4454000  ! 2452: LDSW_R	ldsw	[%r21 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 19)
	.word 0xf0154000  ! 2460: LDUH_R	lduh	[%r21 + %r0], %r24
cpu_intr_2_196:
	setx	0x32020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa85c020  ! 2466: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xfc156009  ! 2467: LDUH_I	lduh	[%r21 + 0x0009], %r30
T2_asi_reg_wr_113:
	mov	0x28, %r14
	.word 0xfcf384a0  ! 2470: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe5ce199  ! 2472: LDX_I	ldx	[%r19 + 0x0199], %r31
T2_asi_reg_rd_91:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 2473: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf2950020  ! 2476: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 10)
	.word 0xf05c4000  ! 2480: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf4944020  ! 2482: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
	.word 0xfa144000  ! 2483: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf4954020  ! 2484: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
T2_asi_reg_wr_114:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 2485: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
cpu_intr_2_197:
	setx	0x310031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc04a151  ! 2491: LDUW_I	lduw	[%r18 + 0x0151], %r30
	.word 0xf24d8000  ! 2492: LDSB_R	ldsb	[%r22 + %r0], %r25
T2_asi_reg_wr_115:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 2493: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4460b7  ! 2497: LDSW_I	ldsw	[%r17 + 0x00b7], %r29
cpu_intr_2_198:
	setx	0x300035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_116:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 2505: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_199:
	setx	0x330131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25ca148  ! 2507: LDX_I	ldx	[%r18 + 0x0148], %r25
cpu_intr_2_200:
	setx	0x300007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_92:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_201:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414c000  ! 2513: LDUH_R	lduh	[%r19 + %r0], %r26
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fda  ! 2514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
	.word 0xf654206c  ! 2515: LDSH_I	ldsh	[%r16 + 0x006c], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf4c5a134  ! 2520: LDSWA_I	ldswa	[%r22, + 0x0134] %asi, %r26
cpu_intr_2_202:
	setx	0x310325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 2527: LDSW_R	ldsw	[%r23 + %r0], %r29
cpu_intr_2_203:
	setx	0x300323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_204:
	setx	0x310010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_205:
	setx	0x31010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_94:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_206:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf895c020  ! 2544: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_117:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 2548: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_207:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_95:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 2557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_96:
	mov	0x2d, %r14
	.word 0xfadb84a0  ! 2558: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_118:
	mov	0x23, %r14
	.word 0xf8f38400  ! 2560: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 29)
	.word 0xf0948020  ! 2565: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xfe0520c7  ! 2566: LDUW_I	lduw	[%r20 + 0x00c7], %r31
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 24)
	.word 0xf0c46099  ! 2569: LDSWA_I	ldswa	[%r17, + 0x0099] %asi, %r24
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf085c020  ! 2572: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_119:
	mov	0x20, %r14
	.word 0xf6f38400  ! 2574: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf60c4000  ! 2577: LDUB_R	ldub	[%r17 + %r0], %r27
cpu_intr_2_208:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd4020  ! 2579: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 5)
	.word 0xfa948020  ! 2582: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, b)
	.word 0xb6bd4000  ! 2585: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xf61461be  ! 2587: LDUH_I	lduh	[%r17 + 0x01be], %r27
T2_asi_reg_wr_120:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 2589: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf454a15f  ! 2593: LDSH_I	ldsh	[%r18 + 0x015f], %r26
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_121:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 2598: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b10  ! 2599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b10, %hpstate
	.word 0xf6d48020  ! 2600: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_97:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 2604: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbaad0000  ! 2607: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xbeadc000  ! 2608: ANDNcc_R	andncc 	%r23, %r0, %r31
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_122:
	mov	0x21, %r14
	.word 0xfef38e40  ! 2611: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbc340000  ! 2613: ORN_R	orn 	%r16, %r0, %r30
	.word 0xfedc6003  ! 2615: LDXA_I	ldxa	[%r17, + 0x0003] %asi, %r31
T2_asi_reg_wr_123:
	mov	0x30, %r14
	.word 0xfcf38e60  ! 2616: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_209:
	setx	0x300209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_98:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 2620: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf84c61d3  ! 2622: LDSB_I	ldsb	[%r17 + 0x01d3], %r28
	.word 0xbec5614f  ! 2626: ADDCcc_I	addccc 	%r21, 0x014f, %r31
cpu_intr_2_210:
	setx	0x31011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982bd0  ! 2632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
	.word 0xb93c9000  ! 2636: SRAX_R	srax	%r18, %r0, %r28
	.word 0xf2156028  ! 2637: LDUH_I	lduh	[%r21 + 0x0028], %r25
	.word 0xfc95e097  ! 2642: LDUHA_I	lduha	[%r23, + 0x0097] %asi, %r30
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_99:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb62cc000  ! 2658: ANDN_R	andn 	%r19, %r0, %r27
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xfe8ca023  ! 2662: LDUBA_I	lduba	[%r18, + 0x0023] %asi, %r31
T2_asi_reg_wr_124:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 2664: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_211:
	setx	0x33010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_212:
	setx	0x32002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf045a0be  ! 2676: LDSW_I	ldsw	[%r22 + 0x00be], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfe5c0000  ! 2679: LDX_R	ldx	[%r16 + %r0], %r31
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_213:
	setx	0x320214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_125:
	mov	0x15, %r14
	.word 0xf2f38400  ! 2686: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_214:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d0000  ! 2690: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf8550000  ! 2692: LDSH_R	ldsh	[%r20 + %r0], %r28
cpu_intr_2_215:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 2695: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xf4150000  ! 2697: LDUH_R	lduh	[%r20 + %r0], %r26
cpu_intr_2_216:
	setx	0x310122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40ca1fa  ! 2702: LDUB_I	ldub	[%r18 + 0x01fa], %r26
T2_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf854a153  ! 2705: LDSH_I	ldsh	[%r18 + 0x0153], %r28
	.word 0xfa554000  ! 2706: LDSH_R	ldsh	[%r21 + %r0], %r29
T2_asi_reg_wr_126:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 2707: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8c42154  ! 2708: LDSWA_I	ldswa	[%r16, + 0x0154] %asi, %r28
T2_asi_reg_wr_127:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2710: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_128:
	mov	0x2a, %r14
	.word 0xf4f38e60  ! 2711: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0x8d956167  ! 2712: WRPR_PSTATE_I	wrpr	%r21, 0x0167, %pstate
	.word 0xf2c5c020  ! 2713: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_102:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_129:
	mov	0x29, %r14
	.word 0xfef38400  ! 2717: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc458000  ! 2722: LDSW_R	ldsw	[%r22 + %r0], %r30
T2_asi_reg_rd_103:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_217:
	setx	0x300201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 9)
	.word 0xf0056166  ! 2729: LDUW_I	lduw	[%r21 + 0x0166], %r24
	.word 0xfcc4a147  ! 2730: LDSWA_I	ldswa	[%r18, + 0x0147] %asi, %r30
cpu_intr_2_218:
	setx	0x31030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_219:
	setx	0x330109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, f)
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 28)
	.word 0xba3ce09c  ! 2743: XNOR_I	xnor 	%r19, 0x009c, %r29
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc4d0000  ! 2750: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf0550000  ! 2755: LDSH_R	ldsh	[%r20 + %r0], %r24
cpu_intr_2_220:
	setx	0x30010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2840020  ! 2757: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xfa950020  ! 2758: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xfc5d8000  ! 2759: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf2150000  ! 2760: LDUH_R	lduh	[%r20 + %r0], %r25
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 29)
	.word 0xfa0460b1  ! 2766: LDUW_I	lduw	[%r17 + 0x00b1], %r29
	.word 0xf6c48020  ! 2773: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	.word 0xb49521eb  ! 2774: ORcc_I	orcc 	%r20, 0x01eb, %r26
	.word 0xf2846014  ! 2775: LDUWA_I	lduwa	[%r17, + 0x0014] %asi, %r25
	.word 0xf28c21b5  ! 2776: LDUBA_I	lduba	[%r16, + 0x01b5] %asi, %r25
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 14)
	.word 0xfc5421d8  ! 2779: LDSH_I	ldsh	[%r16 + 0x01d8], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xb63560cb  ! 2781: ORN_I	orn 	%r21, 0x00cb, %r27
	.word 0xf4d52097  ! 2785: LDSHA_I	ldsha	[%r20, + 0x0097] %asi, %r26
T2_asi_reg_wr_130:
	mov	0x17, %r14
	.word 0xfaf38400  ! 2788: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb72d8000  ! 2789: SLL_R	sll 	%r22, %r0, %r27
cpu_intr_2_221:
	setx	0x35023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_222:
	setx	0x350233, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b4a  ! 2792: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	.word 0xf0844020  ! 2793: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_223:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_224:
	setx	0x37021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x340031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494600d  ! 2806: LDUHA_I	lduha	[%r17, + 0x000d] %asi, %r26
	.word 0xf08d61e2  ! 2808: LDUBA_I	lduba	[%r21, + 0x01e2] %asi, %r24
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb33d8000  ! 2817: SRA_R	sra 	%r22, %r0, %r25
	.word 0xf6c44020  ! 2819: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xfe94c020  ! 2825: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	.word 0xfccc8020  ! 2826: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xfc058000  ! 2828: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfe4c0000  ! 2829: LDSB_R	ldsb	[%r16 + %r0], %r31
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_226:
	setx	0x35032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_104:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb01d8000  ! 2843: XOR_R	xor 	%r22, %r0, %r24
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 25)
	.word 0xf614206f  ! 2845: LDUH_I	lduh	[%r16 + 0x006f], %r27
	.word 0xfc450000  ! 2846: LDSW_R	ldsw	[%r20 + %r0], %r30
cpu_intr_2_227:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_228:
	setx	0x350100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x370232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c2060  ! 2856: ANDcc_I	andcc 	%r16, 0x0060, %r29
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf05d0000  ! 2858: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf4954020  ! 2859: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
T2_asi_reg_rd_105:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 2861: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfa044000  ! 2862: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xfc94611a  ! 2863: LDUHA_I	lduha	[%r17, + 0x011a] %asi, %r30
	.word 0xf4450000  ! 2867: LDSW_R	ldsw	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88421a0  ! 2869: LDUWA_I	lduwa	[%r16, + 0x01a0] %asi, %r28
T2_asi_reg_rd_106:
	mov	0x5, %r14
	.word 0xfcdb8e60  ! 2875: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf6cdc020  ! 2878: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xba8d0000  ! 2879: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xfac5e06b  ! 2881: LDSWA_I	ldswa	[%r23, + 0x006b] %asi, %r29
T2_asi_reg_rd_107:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 2882: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf255a109  ! 2883: LDSH_I	ldsh	[%r22 + 0x0109], %r25
T2_asi_reg_rd_108:
	mov	0x25, %r14
	.word 0xfedb8400  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf254e10a  ! 2889: LDSH_I	ldsh	[%r19 + 0x010a], %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf644c000  ! 2892: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf2048000  ! 2893: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf8850020  ! 2896: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_230:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2910: RDPR_GL	<illegal instruction>
T2_asi_reg_wr_131:
	mov	0x13, %r14
	.word 0xf6f389e0  ! 2913: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_231:
	setx	0x370101, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b52  ! 2917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0xfe558000  ! 2918: LDSH_R	ldsh	[%r22 + %r0], %r31
cpu_intr_2_232:
	setx	0x370334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44c000  ! 2920: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf494a059  ! 2922: LDUHA_I	lduha	[%r18, + 0x0059] %asi, %r26
T2_asi_reg_rd_109:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 2924: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819829d0  ! 2926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
	.word 0xbeb46101  ! 2927: SUBCcc_I	orncc 	%r17, 0x0101, %r31
cpu_intr_2_233:
	setx	0x36033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c6116  ! 2932: LDX_I	ldx	[%r17 + 0x0116], %r25
	.word 0xf485209e  ! 2937: LDUWA_I	lduwa	[%r20, + 0x009e] %asi, %r26
T2_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2938: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa0ca17a  ! 2942: LDUB_I	ldub	[%r18 + 0x017a], %r29
cpu_intr_2_234:
	setx	0x360111, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d10  ! 2950: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
	.word 0xfad5a0f3  ! 2953: LDSHA_I	ldsha	[%r22, + 0x00f3] %asi, %r29
	.word 0xfe54217e  ! 2955: LDSH_I	ldsh	[%r16 + 0x017e], %r31
	.word 0xfa550000  ! 2957: LDSH_R	ldsh	[%r20 + %r0], %r29
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 10)
	.word 0xf05cc000  ! 2960: LDX_R	ldx	[%r19 + %r0], %r24
T2_asi_reg_rd_110:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_235:
	setx	0x350327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf89421ab  ! 2965: LDUHA_I	lduha	[%r16, + 0x01ab] %asi, %r28
cpu_intr_2_236:
	setx	0x340012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_133:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 2970: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf24d4000  ! 2971: LDSB_R	ldsb	[%r21 + %r0], %r25
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e48  ! 2972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e48, %hpstate
cpu_intr_2_237:
	setx	0x350334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d60e7  ! 2975: LDUB_I	ldub	[%r21 + 0x00e7], %r26
cpu_intr_2_238:
	setx	0x360311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_111:
	mov	0x1, %r14
	.word 0xf6db8e80  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf68de1d3  ! 2981: LDUBA_I	lduba	[%r23, + 0x01d3] %asi, %r27
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe5520a2  ! 2989: LDSH_I	ldsh	[%r20 + 0x00a2], %r31
	.word 0xf8840020  ! 2990: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfa8d21a3  ! 3002: LDUBA_I	lduba	[%r20, + 0x01a3] %asi, %r29
cpu_intr_2_239:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf684c020  ! 3006: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
	.word 0xb82ca0a0  ! 3007: ANDN_I	andn 	%r18, 0x00a0, %r28
T2_asi_reg_rd_114:
	mov	0x4, %r14
	.word 0xf4db89e0  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_240:
	setx	0x36031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c2197  ! 3012: LDX_I	ldx	[%r16 + 0x0197], %r27
	.word 0xf65c60e2  ! 3014: LDX_I	ldx	[%r17 + 0x00e2], %r27
T2_asi_reg_wr_134:
	mov	0x2d, %r14
	.word 0xfcf389e0  ! 3019: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 3022: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf4d58020  ! 3024: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
cpu_intr_2_241:
	setx	0x340203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_242:
	setx	0x360123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf08c8020  ! 3032: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
cpu_intr_2_243:
	setx	0x360110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814214e  ! 3036: LDUH_I	lduh	[%r16 + 0x014e], %r28
T2_asi_reg_rd_115:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc5d2122  ! 3042: LDX_I	ldx	[%r20 + 0x0122], %r30
cpu_intr_2_244:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4850020  ! 3046: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_136:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 3048: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf415c000  ! 3052: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfc456087  ! 3053: LDSW_I	ldsw	[%r21 + 0x0087], %r30
	.word 0xbd356001  ! 3054: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xb13c6001  ! 3056: SRA_I	sra 	%r17, 0x0001, %r24
	.word 0xf0cc0020  ! 3057: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xf8c4a121  ! 3061: LDSWA_I	ldswa	[%r18, + 0x0121] %asi, %r28
	.word 0xf805219b  ! 3062: LDUW_I	lduw	[%r20 + 0x019b], %r28
cpu_intr_2_245:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf8cd20c4  ! 3067: LDSBA_I	ldsba	[%r20, + 0x00c4] %asi, %r28
T2_asi_reg_rd_116:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 3072: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_137:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 3073: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, c)
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_138:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 3087: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb734b001  ! 3089: SRLX_I	srlx	%r18, 0x0001, %r27
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf24c6137  ! 3092: LDSB_I	ldsb	[%r17 + 0x0137], %r25
	.word 0xbf7c4400  ! 3096: MOVR_R	movre	%r17, %r0, %r31
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe0d0000  ! 3100: LDUB_R	ldub	[%r20 + %r0], %r31
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, c)
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, b)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe158000  ! 3109: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xba1c60f3  ! 3110: XOR_I	xor 	%r17, 0x00f3, %r29
T2_asi_reg_wr_139:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 3111: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb01560dc  ! 3114: OR_I	or 	%r21, 0x00dc, %r24
cpu_intr_2_246:
	setx	0x35003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b58000  ! 3119: SUBCcc_R	orncc 	%r22, %r0, %r28
cpu_intr_2_247:
	setx	0x34013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_248:
	setx	0x340135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x360121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf8954020  ! 3124: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	.word 0xfcd42173  ! 3125: LDSHA_I	ldsha	[%r16, + 0x0173] %asi, %r30
T2_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 3129: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa844020  ! 3133: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_141:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3134: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_117:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf0544000  ! 3137: LDSH_R	ldsh	[%r17 + %r0], %r24
cpu_intr_2_250:
	setx	0x350009, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e12  ! 3139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
T2_asi_reg_rd_118:
	mov	0x34, %r14
	.word 0xfcdb89e0  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb42dc000  ! 3146: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xf25da0ed  ! 3147: LDX_I	ldx	[%r22 + 0x00ed], %r25
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_142:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 3149: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf4cda0d2  ! 3153: LDSBA_I	ldsba	[%r22, + 0x00d2] %asi, %r26
cpu_intr_2_251:
	setx	0x370326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 30)
	.word 0xf2452087  ! 3164: LDSW_I	ldsw	[%r20 + 0x0087], %r25
cpu_intr_2_252:
	setx	0x350105, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_143:
	mov	0xf, %r14
	.word 0xfcf384a0  ! 3172: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf4d5e13f  ! 3173: LDSHA_I	ldsha	[%r23, + 0x013f] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2940020  ! 3179: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xf6c5606d  ! 3180: LDSWA_I	ldswa	[%r21, + 0x006d] %asi, %r27
	.word 0xf815216c  ! 3181: LDUH_I	lduh	[%r20 + 0x016c], %r28
cpu_intr_2_253:
	setx	0x350013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c0000  ! 3184: XOR_R	xor 	%r16, %r0, %r30
	.word 0xb2048000  ! 3186: ADD_R	add 	%r18, %r0, %r25
	.word 0x8d94e023  ! 3189: WRPR_PSTATE_I	wrpr	%r19, 0x0023, %pstate
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_254:
	setx	0x360220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_144:
	mov	0x29, %r14
	.word 0xf6f38400  ! 3196: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0x8795a1a3  ! 3198: WRPR_TT_I	wrpr	%r22, 0x01a3, %tt
	.word 0xfa058000  ! 3199: LDUW_R	lduw	[%r22 + %r0], %r29
T2_asi_reg_wr_145:
	mov	0x2b, %r14
	.word 0xf8f38e60  ! 3200: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf81421bb  ! 3204: LDUH_I	lduh	[%r16 + 0x01bb], %r28
	.word 0xb484609a  ! 3206: ADDcc_I	addcc 	%r17, 0x009a, %r26
	.word 0xfed4e038  ! 3209: LDSHA_I	ldsha	[%r19, + 0x0038] %asi, %r31
	.word 0xfadc216c  ! 3210: LDXA_I	ldxa	[%r16, + 0x016c] %asi, %r29
	.word 0xf2958020  ! 3212: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xf8958020  ! 3213: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xf24561bc  ! 3218: LDSW_I	ldsw	[%r21 + 0x01bc], %r25
T2_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 3219: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_255:
	setx	0x340308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc8020  ! 3223: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc8c0020  ! 3226: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xb0b4c000  ! 3229: SUBCcc_R	orncc 	%r19, %r0, %r24
cpu_intr_2_256:
	setx	0x34003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_257:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_258:
	setx	0x360227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x340005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb644619c  ! 3238: ADDC_I	addc 	%r17, 0x019c, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_260:
	setx	0x340200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_146:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 3244: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa558000  ! 3245: LDSH_R	ldsh	[%r22 + %r0], %r29
T2_asi_reg_rd_120:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 3246: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_121:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 11)
	.word 0xf85c60ed  ! 3260: LDX_I	ldx	[%r17 + 0x00ed], %r28
	.word 0xf484c020  ! 3262: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	.word 0xfc44a00a  ! 3263: LDSW_I	ldsw	[%r18 + 0x000a], %r30
T2_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 3265: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_261:
	setx	0x390014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb244a173  ! 3271: ADDC_I	addc 	%r18, 0x0173, %r25
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 22)
	.word 0xb23c0000  ! 3274: XNOR_R	xnor 	%r16, %r0, %r25
T2_asi_reg_wr_148:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 3275: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa550000  ! 3276: LDSH_R	ldsh	[%r20 + %r0], %r29
T2_asi_reg_wr_149:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 3277: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_122:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_262:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_150:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 3289: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbf34e001  ! 3293: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xfedce186  ! 3295: LDXA_I	ldxa	[%r19, + 0x0186] %asi, %r31
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_123:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb645c000  ! 3298: ADDC_R	addc 	%r23, %r0, %r27
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4dd20e0  ! 3306: LDXA_I	ldxa	[%r20, + 0x00e0] %asi, %r26
	.word 0xfe052022  ! 3308: LDUW_I	lduw	[%r20 + 0x0022], %r31
cpu_intr_2_264:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd203f  ! 3312: LDSBA_I	ldsba	[%r20, + 0x003f] %asi, %r27
	.word 0xf4540000  ! 3314: LDSH_R	ldsh	[%r16 + %r0], %r26
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 13)
	.word 0xb805e1d4  ! 3323: ADD_I	add 	%r23, 0x01d4, %r28
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_124:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 3325: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_151:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3326: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6c5e1ed  ! 3328: LDSWA_I	ldswa	[%r23, + 0x01ed] %asi, %r27
	.word 0xf685614d  ! 3329: LDUWA_I	lduwa	[%r21, + 0x014d] %asi, %r27
cpu_intr_2_265:
	setx	0x3b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdc61cb  ! 3335: LDXA_I	ldxa	[%r17, + 0x01cb] %asi, %r30
	.word 0xf25560c7  ! 3336: LDSH_I	ldsh	[%r21 + 0x00c7], %r25
	.word 0xf0dde1e8  ! 3337: LDXA_I	ldxa	[%r23, + 0x01e8] %asi, %r24
cpu_intr_2_266:
	setx	0x390228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb2a561f4  ! 3342: SUBcc_I	subcc 	%r21, 0x01f4, %r25
	.word 0xfc044000  ! 3344: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf6d48020  ! 3345: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf2550000  ! 3349: LDSH_R	ldsh	[%r20 + %r0], %r25
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a02  ! 3354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a02, %hpstate
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b9a  ! 3358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
T2_asi_reg_wr_152:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 3365: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_267:
	setx	0x380137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_268:
	setx	0x390127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_269:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a18d  ! 3377: LDSW_I	ldsw	[%r18 + 0x018d], %r28
T2_asi_reg_rd_125:
	mov	0x4, %r14
	.word 0xf2db8e60  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_270:
	setx	0x390227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_271:
	setx	0x38033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc0c4000  ! 3389: LDUB_R	ldub	[%r17 + %r0], %r30
cpu_intr_2_272:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdde065  ! 3392: LDXA_I	ldxa	[%r23, + 0x0065] %asi, %r30
	.word 0xb09c8000  ! 3394: XORcc_R	xorcc 	%r18, %r0, %r24
T2_asi_reg_wr_153:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 3395: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_154:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 3398: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_273:
	setx	0x390325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf8c520d9  ! 3401: LDSWA_I	ldswa	[%r20, + 0x00d9] %asi, %r28
T2_asi_reg_rd_126:
	mov	0x22, %r14
	.word 0xf0db8400  ! 3404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_155:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 3405: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfec58020  ! 3407: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xb02c4000  ! 3410: ANDN_R	andn 	%r17, %r0, %r24
	.word 0xb6ad20b3  ! 3413: ANDNcc_I	andncc 	%r20, 0x00b3, %r27
	.word 0xbd7d4400  ! 3414: MOVR_R	movre	%r21, %r0, %r30
	.word 0xf05dc000  ! 3417: LDX_R	ldx	[%r23 + %r0], %r24
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, d)
	.word 0xf80d8000  ! 3423: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf68da1f6  ! 3424: LDUBA_I	lduba	[%r22, + 0x01f6] %asi, %r27
T2_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3426: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 14)
	.word 0xb6ace11f  ! 3428: ANDNcc_I	andncc 	%r19, 0x011f, %r27
T2_asi_reg_rd_127:
	mov	0x2f, %r14
	.word 0xf0db8400  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_157:
	mov	0x17, %r14
	.word 0xfef389e0  ! 3431: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_158:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 3432: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf65c21b8  ! 3433: LDX_I	ldx	[%r16 + 0x01b8], %r27
T2_asi_reg_wr_159:
	mov	0x20, %r14
	.word 0xfef38400  ! 3434: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4154000  ! 3437: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xf40de070  ! 3438: LDUB_I	ldub	[%r23 + 0x0070], %r26
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa8dc020  ! 3443: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_160:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 3444: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_128:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d90  ! 3448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_161:
	mov	0x32, %r14
	.word 0xfaf38400  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_162:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 3453: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_274:
	setx	0x3b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc4460dd  ! 3460: LDSW_I	ldsw	[%r17 + 0x00dd], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf654219e  ! 3464: LDSH_I	ldsh	[%r16 + 0x019e], %r27
	.word 0xbe054000  ! 3466: ADD_R	add 	%r21, %r0, %r31
T2_asi_reg_wr_163:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 3467: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_275:
	setx	0x38013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacca1e1  ! 3474: LDSBA_I	ldsba	[%r18, + 0x01e1] %asi, %r29
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cd8  ! 3475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e0a  ! 3476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
	.word 0x8d956078  ! 3477: WRPR_PSTATE_I	wrpr	%r21, 0x0078, %pstate
T2_asi_reg_rd_129:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_130:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_276:
	setx	0x3a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0x33, %r14
	.word 0xfef38400  ! 3485: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_277:
	setx	0x380106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf684c020  ! 3487: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
	.word 0xf2d4a0b6  ! 3488: LDSHA_I	ldsha	[%r18, + 0x00b6] %asi, %r25
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc8dc020  ! 3491: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_165:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 3494: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_278:
	setx	0x3b0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x3b0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214607b  ! 3499: LDUH_I	lduh	[%r17 + 0x007b], %r25
	.word 0xf2550000  ! 3500: LDSH_R	ldsh	[%r20 + %r0], %r25
cpu_intr_2_280:
	setx	0x390122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 3505: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf68ca051  ! 3506: LDUBA_I	lduba	[%r18, + 0x0051] %asi, %r27
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 20)
	.word 0xbb3d3001  ! 3510: SRAX_I	srax	%r20, 0x0001, %r29
T2_asi_reg_wr_166:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3511: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_281:
	setx	0x3b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 3)
	.word 0xf04ca11a  ! 3520: LDSB_I	ldsb	[%r18 + 0x011a], %r24
T2_asi_reg_wr_167:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 3521: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_282:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb3643801  ! 3529: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_168:
	mov	0x13, %r14
	.word 0xf2f38400  ! 3533: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf244e040  ! 3535: LDSW_I	ldsw	[%r19 + 0x0040], %r25
cpu_intr_2_283:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_284:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_285:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_286:
	setx	0x390100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6950020  ! 3557: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
cpu_intr_2_287:
	setx	0x39002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_288:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08de1bb  ! 3566: LDUBA_I	lduba	[%r23, + 0x01bb] %asi, %r24
	.word 0xf2d58020  ! 3567: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
cpu_intr_2_289:
	setx	0x3a0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_169:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3573: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_290:
	setx	0x380204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_132:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_291:
	setx	0x3b000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_170:
	mov	0xd, %r14
	.word 0xf0f38400  ! 3577: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf84dc000  ! 3581: LDSB_R	ldsb	[%r23 + %r0], %r28
cpu_intr_2_292:
	setx	0x3032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_293:
	setx	0x3b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d521cb  ! 3588: LDSHA_I	ldsha	[%r20, + 0x01cb] %asi, %r26
	.word 0xfe940020  ! 3589: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	.word 0xf2450000  ! 3591: LDSW_R	ldsw	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_294:
	setx	0x3b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dca06e  ! 3599: LDXA_I	ldxa	[%r18, + 0x006e] %asi, %r24
	ta	T_CHANGE_HPRIV
	.word 0xb6bde0ef  ! 3605: XNORcc_I	xnorcc 	%r23, 0x00ef, %r27
	.word 0x8d95e10f  ! 3606: WRPR_PSTATE_I	wrpr	%r23, 0x010f, %pstate
T2_asi_reg_rd_133:
	mov	0x6, %r14
	.word 0xf4db8400  ! 3607: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_295:
	setx	0x390007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac40020  ! 3611: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_171:
	mov	0x37, %r14
	.word 0xfaf38e60  ! 3614: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_134:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2dd60d7  ! 3619: LDXA_I	ldxa	[%r21, + 0x00d7] %asi, %r25
cpu_intr_2_296:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf48dc020  ! 3622: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_172:
	mov	0x22, %r14
	.word 0xf0f384a0  ! 3623: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfe5521da  ! 3624: LDSH_I	ldsh	[%r20 + 0x01da], %r31
cpu_intr_2_297:
	setx	0x38030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c8000  ! 3627: LDUB_R	ldub	[%r18 + %r0], %r31
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2dd60f9  ! 3631: LDXA_I	ldxa	[%r21, + 0x00f9] %asi, %r25
cpu_intr_2_298:
	setx	0x3b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf358000  ! 3634: SRL_R	srl 	%r22, %r0, %r31
T2_asi_reg_wr_173:
	mov	0x18, %r14
	.word 0xf0f384a0  ! 3637: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb01c219e  ! 3638: XOR_I	xor 	%r16, 0x019e, %r24
cpu_intr_2_299:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0xa, %r14
	.word 0xfef38e80  ! 3641: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe0c619b  ! 3644: LDUB_I	ldub	[%r17 + 0x019b], %r31
cpu_intr_2_300:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 2c)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c50  ! 3650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c50, %hpstate
T2_asi_reg_wr_175:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3651: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba14a0b1  ! 3652: OR_I	or 	%r18, 0x00b1, %r29
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c40  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c40, %hpstate
	.word 0xfc8c4020  ! 3655: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
T2_asi_reg_wr_176:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 3657: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_301:
	setx	0x380235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5a030  ! 3661: LDSWA_I	ldswa	[%r22, + 0x0030] %asi, %r25
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_302:
	setx	0x390103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL0
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 24)
	.word 0xf84da0b4  ! 3673: LDSB_I	ldsb	[%r22 + 0x00b4], %r28
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_135:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb2c5c000  ! 3689: ADDCcc_R	addccc 	%r23, %r0, %r25
T2_asi_reg_rd_136:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 3690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf20cc000  ! 3691: LDUB_R	ldub	[%r19 + %r0], %r25
cpu_intr_2_303:
	setx	0x3a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaccc020  ! 3693: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xfa95e090  ! 3696: LDUHA_I	lduha	[%r23, + 0x0090] %asi, %r29
T2_asi_reg_wr_177:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 3697: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 3702: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 3)
	.word 0xfccd604a  ! 3711: LDSBA_I	ldsba	[%r21, + 0x004a] %asi, %r30
cpu_intr_2_304:
	setx	0x3f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc058000  ! 3714: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfadd20b9  ! 3722: LDXA_I	ldxa	[%r20, + 0x00b9] %asi, %r29
cpu_intr_2_305:
	setx	0x3e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf405e108  ! 3724: LDUW_I	lduw	[%r23 + 0x0108], %r26
cpu_intr_2_306:
	setx	0x3d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_307:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80c0000  ! 3734: LDUB_R	ldub	[%r16 + %r0], %r28
T2_asi_reg_rd_137:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 3735: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_138:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 3737: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_139:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 3738: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982880  ! 3740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_140:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_180:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 3763: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb8850000  ! 3764: ADDcc_R	addcc 	%r20, %r0, %r28
cpu_intr_2_308:
	setx	0x3c0335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_181:
	mov	0x27, %r14
	.word 0xf2f389e0  ! 3767: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_309:
	setx	0x3f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4216d  ! 3774: LDSWA_I	ldswa	[%r16, + 0x016d] %asi, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_310:
	setx	0x3c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf48560f8  ! 3784: LDUWA_I	lduwa	[%r21, + 0x00f8] %asi, %r26
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, e)
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_182:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 3790: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbe9d8000  ! 3792: XORcc_R	xorcc 	%r22, %r0, %r31
cpu_intr_2_311:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 33)
	.word 0xfe0d2107  ! 3796: LDUB_I	ldub	[%r20 + 0x0107], %r31
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_312:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 3802: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_141:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 3803: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xba8de046  ! 3806: ANDcc_I	andcc 	%r23, 0x0046, %r29
cpu_intr_2_313:
	setx	0x3c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_315:
	setx	0x3d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 3818: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_142:
	mov	0x38, %r14
	.word 0xfedb8e40  ! 3819: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_316:
	setx	0x3f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf4d50020  ! 3825: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
cpu_intr_2_317:
	setx	0x3f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c2007  ! 3829: LDSB_I	ldsb	[%r16 + 0x0007], %r29
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c0a  ! 3830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0a, %hpstate
cpu_intr_2_318:
	setx	0x3d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf884e092  ! 3833: LDUWA_I	lduwa	[%r19, + 0x0092] %asi, %r28
T2_asi_reg_wr_185:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 3834: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb29520fc  ! 3835: ORcc_I	orcc 	%r20, 0x00fc, %r25
	.word 0xb89c8000  ! 3837: XORcc_R	xorcc 	%r18, %r0, %r28
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_319:
	setx	0x3f0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xbb2dd000  ! 3851: SLLX_R	sllx	%r23, %r0, %r29
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf855c000  ! 3856: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xf65ca044  ! 3857: LDX_I	ldx	[%r18 + 0x0044], %r27
	.word 0xfcc4a12d  ! 3858: LDSWA_I	ldswa	[%r18, + 0x012d] %asi, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfed54020  ! 3860: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 33)
	.word 0xb895a196  ! 3863: ORcc_I	orcc 	%r22, 0x0196, %r28
T2_asi_reg_wr_186:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 3869: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_187:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 3871: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_188:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 3872: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 34)
	.word 0xbb2c0000  ! 3876: SLL_R	sll 	%r16, %r0, %r29
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf4d50020  ! 3881: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	.word 0xb8bdc000  ! 3883: XNORcc_R	xnorcc 	%r23, %r0, %r28
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_320:
	setx	0x3e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_189:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 3892: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0x899420c3  ! 3893: WRPR_TICK_I	wrpr	%r16, 0x00c3, %tick
T2_asi_reg_rd_143:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_321:
	setx	0x3e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_322:
	setx	0x3f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc8020  ! 3902: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xfed4a0e7  ! 3903: LDSHA_I	ldsha	[%r18, + 0x00e7] %asi, %r31
	.word 0xf2d4a076  ! 3904: LDSHA_I	ldsha	[%r18, + 0x0076] %asi, %r25
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 25)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b12  ! 3907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b12, %hpstate
	.word 0xf804c000  ! 3909: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xfe0da112  ! 3910: LDUB_I	ldub	[%r22 + 0x0112], %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_190:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 3912: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf00dc000  ! 3914: LDUB_R	ldub	[%r23 + %r0], %r24
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 9)
	.word 0xf8858020  ! 3919: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xfe4c21eb  ! 3925: LDSB_I	ldsb	[%r16 + 0x01eb], %r31
T2_asi_reg_rd_144:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 3926: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_323:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d212b  ! 3931: LDX_I	ldx	[%r20 + 0x012b], %r29
T2_asi_reg_rd_145:
	mov	0x35, %r14
	.word 0xf2db8e60  ! 3932: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfcc50020  ! 3934: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_191:
	mov	0x34, %r14
	.word 0xfcf389e0  ! 3940: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfe550000  ! 3941: LDSH_R	ldsh	[%r20 + %r0], %r31
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, a)
	.word 0xb6ad610d  ! 3943: ANDNcc_I	andncc 	%r21, 0x010d, %r27
	.word 0xb0350000  ! 3944: SUBC_R	orn 	%r20, %r0, %r24
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c9a  ! 3945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9a, %hpstate
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_192:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 3950: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_324:
	setx	0x3f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a8a  ! 3953: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 3956: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfcc52058  ! 3958: LDSWA_I	ldswa	[%r20, + 0x0058] %asi, %r30
	.word 0xb93dc000  ! 3959: SRA_R	sra 	%r23, %r0, %r28
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb13de001  ! 3963: SRA_I	sra 	%r23, 0x0001, %r24
cpu_intr_2_325:
	setx	0x3e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0856157  ! 3967: LDUWA_I	lduwa	[%r21, + 0x0157] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_326:
	setx	0x3e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 3974: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_327:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_328:
	setx	0x3d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48d0020  ! 3980: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	.word 0x89952174  ! 3981: WRPR_TICK_I	wrpr	%r20, 0x0174, %tick
cpu_intr_2_329:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8cc020  ! 3985: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xbd641800  ! 3988: MOVcc_R	<illegal instruction>
cpu_intr_2_330:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe852198  ! 3992: LDUWA_I	lduwa	[%r20, + 0x0198] %asi, %r31
T2_asi_reg_wr_195:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 3993: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb33dc000  ! 3995: SRA_R	sra 	%r23, %r0, %r25
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_146:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 4003: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd2c1000  ! 4007: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xfe5d0000  ! 4008: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf80de1d7  ! 4010: LDUB_I	ldub	[%r23 + 0x01d7], %r28
cpu_intr_2_331:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15e1af  ! 4013: LDUH_I	lduh	[%r23 + 0x01af], %r31
	.word 0xf8154000  ! 4016: LDUH_R	lduh	[%r21 + %r0], %r28
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_332:
	setx	0x3c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_196:
	mov	0x1a, %r14
	.word 0xfaf38e80  ! 4025: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_333:
	setx	0x3e002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_334:
	setx	0x3e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68dc000  ! 4035: ANDcc_R	andcc 	%r23, %r0, %r27
	.word 0xf6c420cf  ! 4037: LDSWA_I	ldswa	[%r16, + 0x00cf] %asi, %r27
cpu_intr_2_335:
	setx	0x3e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_147:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf65d6070  ! 4045: LDX_I	ldx	[%r21 + 0x0070], %r27
cpu_intr_2_336:
	setx	0x3d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c4020  ! 4047: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, e)
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe54e1d1  ! 4054: LDSH_I	ldsh	[%r19 + 0x01d1], %r31
cpu_intr_2_337:
	setx	0x3f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5561de  ! 4059: LDSH_I	ldsh	[%r21 + 0x01de], %r31
	.word 0xf8844020  ! 4063: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0x8394e031  ! 4066: WRPR_TNPC_I	wrpr	%r19, 0x0031, %tnpc
T2_asi_reg_wr_197:
	mov	0x21, %r14
	.word 0xfaf38e60  ! 4067: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf245a1d8  ! 4068: LDSW_I	ldsw	[%r22 + 0x01d8], %r25
	.word 0xfed5c020  ! 4069: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xf894a1d6  ! 4070: LDUHA_I	lduha	[%r18, + 0x01d6] %asi, %r28
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_198:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 4072: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_199:
	mov	0x4, %r14
	.word 0xf2f38400  ! 4075: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfa856114  ! 4077: LDUWA_I	lduwa	[%r21, + 0x0114] %asi, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_338:
	setx	0x3f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_200:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 4082: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_148:
	mov	0xd, %r14
	.word 0xfedb84a0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, a)
	.word 0xf2dd619f  ! 4091: LDXA_I	ldxa	[%r21, + 0x019f] %asi, %r25
	.word 0xfe8dc020  ! 4093: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
	.word 0xf0150000  ! 4096: LDUH_R	lduh	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf25d6138  ! 4098: LDX_I	ldx	[%r21 + 0x0138], %r25
	.word 0xf25ca1a5  ! 4101: LDX_I	ldx	[%r18 + 0x01a5], %r25
cpu_intr_2_339:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c2001  ! 4103: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xf4044000  ! 4108: LDUW_R	lduw	[%r17 + %r0], %r26
T2_asi_reg_wr_201:
	mov	0x2c, %r14
	.word 0xfef38400  ! 4109: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe84602e  ! 4110: LDUWA_I	lduwa	[%r17, + 0x002e] %asi, %r31
T2_asi_reg_rd_149:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_340:
	setx	0x10323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, a)
	.word 0xf68c8020  ! 4116: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
cpu_intr_2_341:
	setx	0x3f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6440000  ! 4119: LDSW_R	ldsw	[%r16 + %r0], %r27
T2_asi_reg_rd_151:
	mov	0x33, %r14
	.word 0xf0db8400  ! 4120: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfc05e016  ! 4121: LDUW_I	lduw	[%r23 + 0x0016], %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_152:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_342:
	setx	0x3e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d58020  ! 4132: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
cpu_intr_2_343:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_344:
	setx	0x3e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_153:
	mov	0x1d, %r14
	.word 0xfcdb8e80  ! 4138: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 4139: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb34a001  ! 4141: SRL_I	srl 	%r18, 0x0001, %r29
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, d)
	.word 0xb17c2401  ! 4146: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xfe5de0ea  ! 4148: LDX_I	ldx	[%r23 + 0x00ea], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4150000  ! 4151: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xfecd4020  ! 4156: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
cpu_intr_2_345:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_202:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 4160: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfec44020  ! 4161: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
cpu_intr_2_346:
	setx	0x43001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d42081  ! 4165: LDSHA_I	ldsha	[%r16, + 0x0081] %asi, %r25
	.word 0xf44d2191  ! 4166: LDSB_I	ldsb	[%r20 + 0x0191], %r26
cpu_intr_2_347:
	setx	0x41003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 1)
	.word 0xf094a0b4  ! 4174: LDUHA_I	lduha	[%r18, + 0x00b4] %asi, %r24
T2_asi_reg_rd_155:
	mov	0x15, %r14
	.word 0xf2db89e0  ! 4176: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_348:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d521a9  ! 4180: LDSHA_I	ldsha	[%r20, + 0x01a9] %asi, %r25
	.word 0xfac4c020  ! 4183: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
cpu_intr_2_349:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebd8000  ! 4186: XNORcc_R	xnorcc 	%r22, %r0, %r31
cpu_intr_2_350:
	setx	0x430032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 18)
	.word 0xf605e047  ! 4191: LDUW_I	lduw	[%r23 + 0x0047], %r27
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 23)
	.word 0xf0952133  ! 4195: LDUHA_I	lduha	[%r20, + 0x0133] %asi, %r24
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf4458000  ! 4198: LDSW_R	ldsw	[%r22 + %r0], %r26
cpu_intr_2_351:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe042147  ! 4203: LDUW_I	lduw	[%r16 + 0x0147], %r31
cpu_intr_2_352:
	setx	0x420114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 4211: LDUH_R	lduh	[%r16 + %r0], %r25
T2_asi_reg_wr_203:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 4214: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_156:
	mov	0x1f, %r14
	.word 0xf8db8400  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_204:
	mov	0x5, %r14
	.word 0xf6f38400  ! 4221: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 3)
	.word 0xf2158000  ! 4223: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_353:
	setx	0x42030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8254000  ! 4226: SUB_R	sub 	%r21, %r0, %r28
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_TO_TL1
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL1
	.word 0xb8ac4000  ! 4239: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xfe5d20a2  ! 4242: LDX_I	ldx	[%r20 + 0x00a2], %r31
cpu_intr_2_354:
	setx	0x400336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe45e04c  ! 4244: LDSW_I	ldsw	[%r23 + 0x004c], %r31
	.word 0xfc0d4000  ! 4247: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf6958020  ! 4249: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf08c4020  ! 4253: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_157:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 4254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 6)
	.word 0xfcc58020  ! 4257: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_205:
	mov	0x20, %r14
	.word 0xfcf38e80  ! 4260: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 33)
	.word 0xbd3db001  ! 4265: SRAX_I	srax	%r22, 0x0001, %r30
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4cc216e  ! 4273: LDSBA_I	ldsba	[%r16, + 0x016e] %asi, %r26
	.word 0xf4d5a0a8  ! 4275: LDSHA_I	ldsha	[%r22, + 0x00a8] %asi, %r26
T2_asi_reg_rd_158:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_159:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_206:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4282: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbab4a182  ! 4283: SUBCcc_I	orncc 	%r18, 0x0182, %r29
T2_asi_reg_rd_160:
	mov	0x26, %r14
	.word 0xf6db8e60  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb834a0a1  ! 4288: SUBC_I	orn 	%r18, 0x00a1, %r28
T2_asi_reg_rd_161:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 4289: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_207:
	mov	0x21, %r14
	.word 0xf8f38e60  ! 4290: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_208:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 4291: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_355:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d0000  ! 4299: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xba04c000  ! 4300: ADD_R	add 	%r19, %r0, %r29
	.word 0xfc454000  ! 4301: LDSW_R	ldsw	[%r21 + %r0], %r30
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, c)
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_356:
	setx	0x420332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc944020  ! 4310: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
T2_asi_reg_wr_209:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 4313: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_357:
	setx	0x430308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01461d0  ! 4316: LDUH_I	lduh	[%r17 + 0x01d0], %r24
T2_asi_reg_wr_210:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 4318: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_358:
	setx	0x410232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c20c3  ! 4321: LDUB_I	ldub	[%r16 + 0x00c3], %r25
	.word 0xf4c5e1aa  ! 4322: LDSWA_I	ldswa	[%r23, + 0x01aa] %asi, %r26
	.word 0xb6244000  ! 4323: SUB_R	sub 	%r17, %r0, %r27
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa15a161  ! 4328: LDUH_I	lduh	[%r22 + 0x0161], %r29
cpu_intr_2_359:
	setx	0x41021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_162:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf24460d8  ! 4334: LDSW_I	ldsw	[%r17 + 0x00d8], %r25
cpu_intr_2_360:
	setx	0x41031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf40421a6  ! 4342: LDUW_I	lduw	[%r16 + 0x01a6], %r26
	.word 0xf85461af  ! 4343: LDSH_I	ldsh	[%r17 + 0x01af], %r28
cpu_intr_2_361:
	setx	0x430201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a56031  ! 4351: SUBcc_I	subcc 	%r21, 0x0031, %r27
T2_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 4352: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 28)
	.word 0xb43ca0d6  ! 4361: XNOR_I	xnor 	%r18, 0x00d6, %r26
	.word 0x8194e1a2  ! 4363: WRPR_TPC_I	wrpr	%r19, 0x01a2, %tpc
T2_asi_reg_wr_212:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4365: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_362:
	setx	0x420217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2158000  ! 4370: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_363:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, b)
	.word 0xba250000  ! 4377: SUB_R	sub 	%r20, %r0, %r29
	.word 0xfcdce11a  ! 4381: LDXA_I	ldxa	[%r19, + 0x011a] %asi, %r30
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 1)
	.word 0xf44de04d  ! 4388: LDSB_I	ldsb	[%r23 + 0x004d], %r26
T2_asi_reg_wr_213:
	mov	0x1c, %r14
	.word 0xf0f38e60  ! 4392: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_214:
	mov	0x13, %r14
	.word 0xfef38400  ! 4398: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf2c52028  ! 4399: LDSWA_I	ldswa	[%r20, + 0x0028] %asi, %r25
	.word 0xf8dd20a9  ! 4407: LDXA_I	ldxa	[%r20, + 0x00a9] %asi, %r28
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8c5a0f3  ! 4412: LDSWA_I	ldswa	[%r22, + 0x00f3] %asi, %r28
T2_asi_reg_rd_163:
	mov	0x14, %r14
	.word 0xf0db8400  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa950020  ! 4419: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xf80421fc  ! 4420: LDUW_I	lduw	[%r16 + 0x01fc], %r28
	.word 0xfc958020  ! 4421: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xfccd20f1  ! 4422: LDSBA_I	ldsba	[%r20, + 0x00f1] %asi, %r30
	.word 0xfc54c000  ! 4423: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf8540000  ! 4428: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xf28ce18b  ! 4429: LDUBA_I	lduba	[%r19, + 0x018b] %asi, %r25
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbeb44000  ! 4432: ORNcc_R	orncc 	%r17, %r0, %r31
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_364:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb355000  ! 4437: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xb894203c  ! 4439: ORcc_I	orcc 	%r16, 0x003c, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf0c4e184  ! 4444: LDSWA_I	ldswa	[%r19, + 0x0184] %asi, %r24
	.word 0xfcd4613e  ! 4447: LDSHA_I	ldsha	[%r17, + 0x013e] %asi, %r30
	.word 0xfcc4c020  ! 4450: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 22)
	.word 0xfcd4c020  ! 4460: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
T2_asi_reg_wr_215:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4463: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_365:
	setx	0x410309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_366:
	setx	0x420117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec58020  ! 4470: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xb2ad8000  ! 4471: ANDNcc_R	andncc 	%r22, %r0, %r25
	.word 0xfa8ca116  ! 4472: LDUBA_I	lduba	[%r18, + 0x0116] %asi, %r29
cpu_intr_2_367:
	setx	0x43020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d50020  ! 4474: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, e)
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_216:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 4484: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba0d8000  ! 4488: AND_R	and 	%r22, %r0, %r29
	.word 0xf6d5207d  ! 4491: LDSHA_I	ldsha	[%r20, + 0x007d] %asi, %r27
	.word 0xf25560d7  ! 4492: LDSH_I	ldsh	[%r21 + 0x00d7], %r25
	.word 0xfe45a00d  ! 4495: LDSW_I	ldsw	[%r22 + 0x000d], %r31
	.word 0xf8cd8020  ! 4496: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xf4d5e18a  ! 4498: LDSHA_I	ldsha	[%r23, + 0x018a] %asi, %r26
T2_asi_reg_rd_164:
	mov	0x32, %r14
	.word 0xf8db8400  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4150000  ! 4500: LDUH_R	lduh	[%r20 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf845c000  ! 4507: LDSW_R	ldsw	[%r23 + %r0], %r28
T2_asi_reg_wr_217:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 4508: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_368:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24e1e4  ! 4510: SUB_I	sub 	%r19, 0x01e4, %r29
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cd0  ! 4513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
	.word 0xf25c4000  ! 4515: LDX_R	ldx	[%r17 + %r0], %r25
cpu_intr_2_369:
	setx	0x42010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 4517: RDPR_TSTATE	<illegal instruction>
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_370:
	setx	0x410329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_371:
	setx	0x41012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81561fd  ! 4525: LDUH_I	lduh	[%r21 + 0x01fd], %r28
	.word 0xba95204d  ! 4527: ORcc_I	orcc 	%r20, 0x004d, %r29
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_165:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xb205c000  ! 4533: ADD_R	add 	%r23, %r0, %r25
cpu_intr_2_372:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b98  ! 4535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b98, %hpstate
	.word 0xf65461c4  ! 4536: LDSH_I	ldsh	[%r17 + 0x01c4], %r27
cpu_intr_2_373:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08ce106  ! 4541: LDUBA_I	lduba	[%r19, + 0x0106] %asi, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_374:
	setx	0x410127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_375:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034e174  ! 4551: ORN_I	orn 	%r19, 0x0174, %r24
T2_asi_reg_rd_166:
	mov	0x27, %r14
	.word 0xf8db8e60  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf60d8000  ! 4553: LDUB_R	ldub	[%r22 + %r0], %r27
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_167:
	mov	0xa, %r14
	.word 0xf8db8400  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe4c612e  ! 4566: LDSB_I	ldsb	[%r17 + 0x012e], %r31
T2_asi_reg_wr_218:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 4567: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf685c020  ! 4568: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xb48cc000  ! 4571: ANDcc_R	andcc 	%r19, %r0, %r26
	.word 0xfa4ca1db  ! 4572: LDSB_I	ldsb	[%r18 + 0x01db], %r29
	.word 0xf055a1c9  ! 4573: LDSH_I	ldsh	[%r22 + 0x01c9], %r24
cpu_intr_2_376:
	setx	0x410106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_377:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_378:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 4579: LDUB_R	ldub	[%r17 + %r0], %r27
cpu_intr_2_379:
	setx	0x400212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0da086  ! 4585: LDUB_I	ldub	[%r22 + 0x0086], %r30
cpu_intr_2_380:
	setx	0x400104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc21e4  ! 4589: LDXA_I	ldxa	[%r16, + 0x01e4] %asi, %r24
cpu_intr_2_381:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455a1e5  ! 4594: LDSH_I	ldsh	[%r22 + 0x01e5], %r26
	.word 0xf2450000  ! 4595: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfa8d61b5  ! 4596: LDUBA_I	lduba	[%r21, + 0x01b5] %asi, %r29
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e88  ! 4597: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e88, %hpstate
cpu_intr_2_382:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_219:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 4601: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf25c0000  ! 4603: LDX_R	ldx	[%r16 + %r0], %r25
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_220:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 4605: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b12  ! 4608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b12, %hpstate
	.word 0xbe150000  ! 4609: OR_R	or 	%r20, %r0, %r31
	.word 0xfc5da019  ! 4610: LDX_I	ldx	[%r22 + 0x0019], %r30
	.word 0xf0d44020  ! 4611: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf2458000  ! 4613: LDSW_R	ldsw	[%r22 + %r0], %r25
cpu_intr_2_383:
	setx	0x44012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8aca00b  ! 4616: ANDNcc_I	andncc 	%r18, 0x000b, %r28
	.word 0xfc4ce0ee  ! 4621: LDSB_I	ldsb	[%r19 + 0x00ee], %r30
cpu_intr_2_384:
	setx	0x47003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_385:
	setx	0x450230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 3b)
	.word 0xbe950000  ! 4626: ORcc_R	orcc 	%r20, %r0, %r31
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_221:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 4628: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_386:
	setx	0x440002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf6942064  ! 4634: LDUHA_I	lduha	[%r16, + 0x0064] %asi, %r27
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 6)
	.word 0xbf2c7001  ! 4636: SLLX_I	sllx	%r17, 0x0001, %r31
cpu_intr_2_387:
	setx	0x440239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4641: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa5de1ca  ! 4645: LDX_I	ldx	[%r23 + 0x01ca], %r29
T2_asi_reg_wr_222:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 4646: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_388:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_169:
	mov	0x0, %r14
	.word 0xf2db8e60  ! 4650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_389:
	setx	0x46000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_390:
	setx	0x450222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, c)
	.word 0xfa948020  ! 4664: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_170:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa4d0000  ! 4667: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfecd6076  ! 4668: LDSBA_I	ldsba	[%r21, + 0x0076] %asi, %r31
	.word 0xbc84e1cf  ! 4671: ADDcc_I	addcc 	%r19, 0x01cf, %r30
cpu_intr_2_391:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_392:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_171:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_393:
	setx	0x44002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445c000  ! 4685: LDSW_R	ldsw	[%r23 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_394:
	setx	0x440226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, d)
	.word 0xf8c4c020  ! 4690: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_223:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 4695: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_395:
	setx	0x440110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_396:
	setx	0x470236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d4000  ! 4702: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xbd3c7001  ! 4704: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xf8948020  ! 4713: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xf2554000  ! 4715: LDSH_R	ldsh	[%r21 + %r0], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfa148000  ! 4718: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf655e061  ! 4723: LDSH_I	ldsh	[%r23 + 0x0061], %r27
T2_asi_reg_wr_224:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 4728: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_397:
	setx	0x440039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_172:
	mov	0x30, %r14
	.word 0xf8db8400  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_225:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 4736: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfacc61c8  ! 4739: LDSBA_I	ldsba	[%r17, + 0x01c8] %asi, %r29
	.word 0xfccc0020  ! 4741: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xfe8c4020  ! 4742: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_226:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 4744: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_227:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 4745: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf64d4000  ! 4748: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfa8d20b7  ! 4752: LDUBA_I	lduba	[%r20, + 0x00b7] %asi, %r29
	.word 0xfc5c210a  ! 4753: LDX_I	ldx	[%r16 + 0x010a], %r30
cpu_intr_2_398:
	setx	0x440320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14e0f2  ! 4758: LDUH_I	lduh	[%r19 + 0x00f2], %r31
T2_asi_reg_rd_173:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4759: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_399:
	setx	0x440118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_228:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 4762: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa84a134  ! 4764: LDUWA_I	lduwa	[%r18, + 0x0134] %asi, %r29
T2_asi_reg_wr_229:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 4767: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_400:
	setx	0x450126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_230:
	mov	0x4, %r14
	.word 0xf0f384a0  ! 4769: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983852  ! 4770: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
	.word 0xf204615e  ! 4772: LDUW_I	lduw	[%r17 + 0x015e], %r25
	.word 0xf415e056  ! 4773: LDUH_I	lduh	[%r23 + 0x0056], %r26
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 14)
	.word 0xfe0c8000  ! 4777: LDUB_R	ldub	[%r18 + %r0], %r31
cpu_intr_2_401:
	setx	0x450328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_402:
	setx	0x47011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a48  ! 4790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a48, %hpstate
	.word 0xf68da115  ! 4792: LDUBA_I	lduba	[%r22, + 0x0115] %asi, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_403:
	setx	0x45012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_231:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 4803: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa5d0000  ! 4804: LDX_R	ldx	[%r20 + %r0], %r29
cpu_intr_2_404:
	setx	0x45032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_405:
	setx	0x450231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415606f  ! 4810: LDUH_I	lduh	[%r21 + 0x006f], %r26
	.word 0xf0cd0020  ! 4818: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
cpu_intr_2_406:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeccc020  ! 4820: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xf45560a2  ! 4821: LDSH_I	ldsh	[%r21 + 0x00a2], %r26
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf24da087  ! 4826: LDSB_I	ldsb	[%r22 + 0x0087], %r25
	.word 0xf655c000  ! 4830: LDSH_R	ldsh	[%r23 + %r0], %r27
T2_asi_reg_rd_175:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 4832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfcc50020  ! 4833: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_232:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 4834: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf80ce191  ! 4835: LDUB_I	ldub	[%r19 + 0x0191], %r28
	.word 0xfe8c4020  ! 4837: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf45c4000  ! 4839: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xf4ccc020  ! 4843: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
cpu_intr_2_407:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf614c000  ! 4851: LDUH_R	lduh	[%r19 + %r0], %r27
cpu_intr_2_408:
	setx	0x440226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb53cb001  ! 4862: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xfe152176  ! 4864: LDUH_I	lduh	[%r20 + 0x0176], %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_177:
	mov	0x17, %r14
	.word 0xfadb8400  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_178:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_233:
	mov	0xd, %r14
	.word 0xf2f38400  ! 4872: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb6ad609e  ! 4873: ANDNcc_I	andncc 	%r21, 0x009e, %r27
	.word 0xfad5e175  ! 4876: LDSHA_I	ldsha	[%r23, + 0x0175] %asi, %r29
cpu_intr_2_409:
	setx	0x47002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644c000  ! 4879: LDSW_R	ldsw	[%r19 + %r0], %r27
	.word 0xf2c4a024  ! 4880: LDSWA_I	ldswa	[%r18, + 0x0024] %asi, %r25
	.word 0xf284c020  ! 4881: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	.word 0xb01c6121  ! 4882: XOR_I	xor 	%r17, 0x0121, %r24
	.word 0xb9510000  ! 4883: RDPR_TICK	<illegal instruction>
	.word 0xfe940020  ! 4885: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_410:
	setx	0x460339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf444c000  ! 4891: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf80de060  ! 4893: LDUB_I	ldub	[%r23 + 0x0060], %r28
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 11)
	.word 0xfc844020  ! 4897: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
	.word 0xbc45a020  ! 4901: ADDC_I	addc 	%r22, 0x0020, %r30
T2_asi_reg_rd_179:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf08c6015  ! 4908: LDUBA_I	lduba	[%r17, + 0x0015] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbcb4a0bb  ! 4914: SUBCcc_I	orncc 	%r18, 0x00bb, %r30
	.word 0xf005e104  ! 4915: LDUW_I	lduw	[%r23 + 0x0104], %r24
T2_asi_reg_wr_234:
	mov	0x38, %r14
	.word 0xfef38400  ! 4919: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb1518000  ! 4922: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_rd_180:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 4924: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_411:
	setx	0x450117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, d)
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 4935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfc45c000  ! 4937: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf00ce14a  ! 4939: LDUB_I	ldub	[%r19 + 0x014a], %r24
T2_asi_reg_rd_182:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 4940: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, a)
	.word 0xf6dca15a  ! 4944: LDXA_I	ldxa	[%r18, + 0x015a] %asi, %r27
	.word 0xfc4c4000  ! 4945: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xf25c21f1  ! 4950: LDX_I	ldx	[%r16 + 0x01f1], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe8ca1ee  ! 4957: LDUBA_I	lduba	[%r18, + 0x01ee] %asi, %r31
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_235:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 4962: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfedd2064  ! 4964: LDXA_I	ldxa	[%r20, + 0x0064] %asi, %r31
cpu_intr_2_412:
	setx	0x460030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b44000  ! 4966: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xf45d4000  ! 4969: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xfe854020  ! 4971: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xf6446021  ! 4973: LDSW_I	ldsw	[%r17 + 0x0021], %r27
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 20)
	.word 0xf6dca082  ! 4983: LDXA_I	ldxa	[%r18, + 0x0082] %asi, %r27
	.word 0xf25c8000  ! 4985: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf055215c  ! 4991: LDSH_I	ldsh	[%r20 + 0x015c], %r24
cpu_intr_2_413:
	setx	0x44001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_236:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 4995: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_183:
	mov	0x2a, %r14
	.word 0xf8db89e0  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
T1_asi_reg_wr_0:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 1: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb12ce001  ! 2: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xb1a80420  ! 10: FMOVRZ	dis not found

iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_1:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 17: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb6b5c000  ! 19: ORNcc_R	orncc 	%r23, %r0, %r27
T1_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1ab4820  ! 23: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbe944000  ! 25: ORcc_R	orcc 	%r17, %r0, %r31
T1_asi_reg_wr_2:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 29: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_0:
	setx	0x1c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e0c4  ! 31: SUBCcc_I	orncc 	%r23, 0x00c4, %r29
	.word 0xb4b54000  ! 36: SUBCcc_R	orncc 	%r21, %r0, %r26
cpu_intr_1_1:
	setx	0x1e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_2:
	setx	0x1d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 45: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_4:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_3:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 47: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a408c0  ! 48: FSUBd	fsubd	%f16, %f0, %f56
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_4:
	mov	0x1c, %r14
	.word 0xf2f389e0  ! 62: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1a549e0  ! 64: FDIVq	dis not found

	.word 0xb1a448c0  ! 68: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_5:
	setx	0x301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb825e0df  ! 72: SUB_I	sub 	%r23, 0x00df, %r28
	.word 0xbda5c8c0  ! 73: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb3a81820  ! 74: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_wr_5:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 75: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a98820  ! 76: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb9ab0820  ! 78: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_6:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 80: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_6:
	setx	0x1f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588c0  ! 90: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xb9a80c20  ! 91: FMOVRLZ	dis not found

	.word 0xb5a50960  ! 96: FMULq	dis not found

iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_7:
	setx	0x1f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5641800  ! 115: MOVcc_R	<illegal instruction>
cpu_intr_1_8:
	setx	0x1d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_7:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 121: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_10:
	setx	0x1d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_11:
	setx	0x1d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c20bc  ! 126: XOR_I	xor 	%r16, 0x00bc, %r30
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 3f)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_12:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba80420  ! 131: FMOVRZ	dis not found

T1_asi_reg_wr_8:
	mov	0x7, %r14
	.word 0xf4f384a0  ! 137: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbaa5e0fe  ! 138: SUBcc_I	subcc 	%r23, 0x00fe, %r29
cpu_intr_1_13:
	setx	0x1f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 142: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_16:
	setx	0x1c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4358000  ! 146: SUBC_R	orn 	%r22, %r0, %r26
	.word 0xb9a00540  ! 148: FSQRTd	fsqrt	
	.word 0xb7ab4820  ! 151: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_2:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa88820  ! 155: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_17:
	setx	0x1e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 164: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1ab0820  ! 165: FMOVGU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba80820  ! 170: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a449a0  ! 171: FDIVs	fdivs	%f17, %f0, %f27
	.word 0xbda548e0  ! 178: FSUBq	dis not found

	.word 0xbb641800  ! 179: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_9:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 181: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_10:
	mov	0x26, %r14
	.word 0xfcf384a0  ! 186: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfa00520  ! 187: FSQRTs	fsqrt	
cpu_intr_1_18:
	setx	0x1e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba00560  ! 191: FSQRTq	fsqrt	
cpu_intr_1_19:
	setx	0x1e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54860  ! 193: FADDq	dis not found

	.word 0xbba00520  ! 194: FSQRTs	fsqrt	
cpu_intr_1_20:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5ab0820  ! 205: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb9504000  ! 209: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 213: RDPR_TPC	<illegal instruction>
	.word 0xb9a00560  ! 215: FSQRTq	fsqrt	
	.word 0xbda00520  ! 216: FSQRTs	fsqrt	
	.word 0xbda8c820  ! 217: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb3353001  ! 218: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb9a81820  ! 220: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5a58840  ! 221: FADDd	faddd	%f22, %f0, %f26
cpu_intr_1_21:
	setx	0x1d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_4:
	mov	0xe, %r14
	.word 0xfadb8e60  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a80c20  ! 227: FMOVRLZ	dis not found

	.word 0xb884a028  ! 229: ADDcc_I	addcc 	%r18, 0x0028, %r28
	.word 0xb5a588c0  ! 233: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb5a588e0  ! 234: FSUBq	dis not found

iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda80420  ! 240: FMOVRZ	dis not found

	.word 0xb7aa0820  ! 244: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_22:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb72d9000  ! 250: SLLX_R	sllx	%r22, %r0, %r27
	.word 0xba1da026  ! 254: XOR_I	xor 	%r22, 0x0026, %r29
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb5a81420  ! 264: FMOVRNZ	dis not found

cpu_intr_1_23:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_5:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a80820  ! 270: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c820  ! 271: FADDs	fadds	%f23, %f0, %f28
cpu_intr_1_24:
	setx	0x1f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 275: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80420  ! 276: FMOVRZ	dis not found

T1_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 277: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_25:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32de001  ! 281: SLL_I	sll 	%r23, 0x0001, %r25
T1_asi_reg_rd_6:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a5c9c0  ! 287: FDIVd	fdivd	%f54, %f0, %f26
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbaade07f  ! 292: ANDNcc_I	andncc 	%r23, 0x007f, %r29
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, c)
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_7:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbba48820  ! 300: FADDs	fadds	%f18, %f0, %f29
	.word 0xbbaa8820  ! 301: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_26:
	setx	0x1d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_27:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_8:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x8994e03f  ! 317: WRPR_TICK_I	wrpr	%r19, 0x003f, %tick
	.word 0xbbaa4820  ! 318: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_28:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 320: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_29:
	setx	0x1d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_12:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 326: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7a5c860  ! 328: FADDq	dis not found

	.word 0xba35e19b  ! 331: ORN_I	orn 	%r23, 0x019b, %r29
	.word 0xb1aa0820  ! 332: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_9:
	mov	0x14, %r14
	.word 0xf8db89e0  ! 333: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbda5c8e0  ! 336: FSUBq	dis not found

	.word 0xbfa94820  ! 337: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba80820  ! 338: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 23)
	.word 0xb2bca133  ! 350: XNORcc_I	xnorcc 	%r18, 0x0133, %r25
	.word 0xbfa4c840  ! 352: FADDd	faddd	%f50, %f0, %f62
	.word 0xb834a0d2  ! 358: SUBC_I	orn 	%r18, 0x00d2, %r28
T1_asi_reg_rd_10:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 360: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3a54840  ! 361: FADDd	faddd	%f52, %f0, %f56
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a44860  ! 366: FADDq	dis not found

cpu_intr_1_31:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_11:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 372: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb88560a7  ! 373: ADDcc_I	addcc 	%r21, 0x00a7, %r28
	.word 0xb7ab8820  ! 375: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00040  ! 376: FMOVd	fmovd	%f0, %f26
	.word 0xb4358000  ! 377: ORN_R	orn 	%r22, %r0, %r26
	.word 0xbfa84820  ! 378: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a84820  ! 380: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb484617c  ! 385: ADDcc_I	addcc 	%r17, 0x017c, %r26
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a88820  ! 391: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 395: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_32:
	setx	0x1c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_33:
	setx	0x1c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a40960  ! 406: FMULq	dis not found

	.word 0xb7a489a0  ! 408: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb5a00560  ! 411: FSQRTq	fsqrt	
	.word 0xbabde1ad  ! 412: XNORcc_I	xnorcc 	%r23, 0x01ad, %r29
T1_asi_reg_rd_12:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a90820  ! 416: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbba408e0  ! 418: FSUBq	dis not found

T1_asi_reg_wr_14:
	mov	0x15, %r14
	.word 0xfaf389e0  ! 420: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7aa0820  ! 421: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c9e0  ! 426: FDIVq	dis not found

iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_15:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 429: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_rd_13:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xa1902000  ! 437: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_1_34:
	setx	0x1c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 440: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a54960  ! 445: FMULq	dis not found

T1_asi_reg_wr_16:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 446: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a58960  ! 447: FMULq	dis not found

	.word 0xb7a8c820  ! 451: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_17:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 454: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_14:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 463: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_18:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 464: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_15:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_16:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbba50920  ! 472: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb1a00540  ! 474: FSQRTd	fsqrt	
cpu_intr_1_35:
	setx	0x230122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_19:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 478: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_36:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 480: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_20:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 481: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a00520  ! 485: FSQRTs	fsqrt	
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_21:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 491: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba15e039  ! 492: OR_I	or 	%r23, 0x0039, %r29
	.word 0xb5a48960  ! 493: FMULq	dis not found

	.word 0xa1902002  ! 495: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb3a48860  ! 496: FADDq	dis not found

iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_37:
	setx	0x230231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb894c000  ! 500: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0xbf3d1000  ! 501: SRAX_R	srax	%r20, %r0, %r31
cpu_intr_1_38:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_39:
	setx	0x230329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 506: FMOVRLZ	dis not found

	.word 0xb5a94820  ! 509: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_17:
	mov	0x37, %r14
	.word 0xf4db8400  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a00560  ! 512: FSQRTq	fsqrt	
	.word 0xbc2d8000  ! 513: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xb89c0000  ! 515: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xb3aa4820  ! 516: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa50940  ! 518: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb9a58920  ! 523: FMULs	fmuls	%f22, %f0, %f28
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbda4c940  ! 531: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb7a5c940  ! 532: FMULd	fmuld	%f54, %f0, %f58
T1_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 537: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_18:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a54940  ! 542: FMULd	fmuld	%f52, %f0, %f24
	.word 0xb1345000  ! 544: SRLX_R	srlx	%r17, %r0, %r24
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_40:
	setx	0x23002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734e001  ! 548: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xb57c4400  ! 549: MOVR_R	movre	%r17, %r0, %r26
T1_asi_reg_rd_19:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_23:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 553: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7a88820  ! 560: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfab0820  ! 561: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_20:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 569: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_41:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x36, %r14
	.word 0xf2f384a0  ! 574: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfa00040  ! 577: FMOVd	fmovd	%f0, %f62
	.word 0xbda508c0  ! 578: FSUBd	fsubd	%f20, %f0, %f30
T1_asi_reg_rd_21:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbba80820  ! 580: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a449c0  ! 581: FDIVd	fdivd	%f48, %f0, %f24
cpu_intr_1_42:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x210226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_45:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba4c840  ! 600: FADDd	faddd	%f50, %f0, %f60
	.word 0xbda80820  ! 601: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 605: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80820  ! 610: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab8820  ! 611: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab4820  ! 613: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda588c0  ! 614: FSUBd	fsubd	%f22, %f0, %f30
T1_asi_reg_wr_25:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 617: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_22:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 619: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_46:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588a0  ! 628: FSUBs	fsubs	%f22, %f0, %f27
cpu_intr_1_47:
	setx	0x22023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_23:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba40860  ! 636: FADDq	dis not found

	.word 0xbd643801  ! 639: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_26:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 640: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7a58820  ! 645: FADDs	fadds	%f22, %f0, %f27
	.word 0xb7a90820  ! 646: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_48:
	setx	0x220009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a80820  ! 653: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbe8cc000  ! 657: ANDcc_R	andcc 	%r19, %r0, %r31
T1_asi_reg_rd_24:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_49:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb1a5c9c0  ! 671: FDIVd	fdivd	%f54, %f0, %f24
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 36)
	.word 0xbfa44960  ! 673: FMULq	dis not found

iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfa4c960  ! 675: FMULq	dis not found

cpu_intr_1_50:
	setx	0x200125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44920  ! 679: FMULs	fmuls	%f17, %f0, %f25
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_27:
	mov	0xe, %r14
	.word 0xfcf38e60  ! 681: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_51:
	setx	0x200121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x22020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3d21d6  ! 693: XNOR_I	xnor 	%r20, 0x01d6, %r30
	.word 0xb4ac20f3  ! 695: ANDNcc_I	andncc 	%r16, 0x00f3, %r26
	.word 0xb3a408a0  ! 697: FSUBs	fsubs	%f16, %f0, %f25
T1_asi_reg_wr_28:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 698: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbbaa8820  ! 700: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_29:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 708: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, e)
	.word 0xb8354000  ! 712: SUBC_R	orn 	%r21, %r0, %r28
	.word 0xb5a5c9c0  ! 714: FDIVd	fdivd	%f54, %f0, %f26
T1_asi_reg_wr_30:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 716: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a548e0  ! 721: FSUBq	dis not found

cpu_intr_1_53:
	setx	0x20003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 724: FSQRTs	fsqrt	
T1_asi_reg_rd_25:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a5c920  ! 728: FMULs	fmuls	%f23, %f0, %f24
T1_asi_reg_wr_31:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 731: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a00540  ! 735: FSQRTd	fsqrt	
T1_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 738: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_26:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x89956043  ! 740: WRPR_TICK_I	wrpr	%r21, 0x0043, %tick
T1_asi_reg_wr_33:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 741: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa40940  ! 750: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb7a589a0  ! 751: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb6bde173  ! 754: XNORcc_I	xnorcc 	%r23, 0x0173, %r27
	.word 0xb1a48860  ! 756: FADDq	dis not found

	.word 0xb9a44960  ! 757: FMULq	dis not found

	.word 0xbda9c820  ! 759: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a00020  ! 761: FMOVs	fmovs	%f0, %f25
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbbaa0820  ! 766: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb405e12f  ! 767: ADD_I	add 	%r23, 0x012f, %r26
	.word 0xbcbde0e3  ! 768: XNORcc_I	xnorcc 	%r23, 0x00e3, %r30
cpu_intr_1_54:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4c000  ! 774: SUBcc_R	subcc 	%r19, %r0, %r29
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a88820  ! 778: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3aac820  ! 780: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a508a0  ! 781: FSUBs	fsubs	%f20, %f0, %f28
cpu_intr_1_55:
	setx	0x220307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40820  ! 784: FADDs	fadds	%f16, %f0, %f27
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 39)
	.word 0xb535f001  ! 786: SRLX_I	srlx	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00020  ! 790: FMOVs	fmovs	%f0, %f26
	.word 0xb4342160  ! 794: SUBC_I	orn 	%r16, 0x0160, %r26
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfaa4820  ! 797: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab4820  ! 800: FMOVCC	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a508a0  ! 802: FSUBs	fsubs	%f20, %f0, %f25
T1_asi_reg_wr_34:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 803: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3a8c820  ! 806: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_57:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_35:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 810: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_58:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x220310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 820: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_36:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 823: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_27:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_60:
	setx	0x220111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a509e0  ! 836: FDIVq	dis not found

iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_28:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_29:
	mov	0x4, %r14
	.word 0xf4db8e80  ! 842: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda589a0  ! 843: FDIVs	fdivs	%f22, %f0, %f30
T1_asi_reg_wr_37:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 845: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_38:
	mov	0x5, %r14
	.word 0xf4f38e60  ! 850: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_61:
	setx	0x230203, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_39:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 852: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfaa8820  ! 860: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9ab4820  ! 866: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 874: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a4c860  ! 877: FADDq	dis not found

	.word 0xb7a4c820  ! 878: FADDs	fadds	%f19, %f0, %f27
	.word 0xb3a00540  ! 880: FSQRTd	fsqrt	
	.word 0xb9a5c840  ! 883: FADDd	faddd	%f54, %f0, %f28
	.word 0xb7a00560  ! 884: FSQRTq	fsqrt	
	.word 0xbb7c2401  ! 885: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xb9abc820  ! 893: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_41:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 895: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_42:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 901: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a5c8e0  ! 903: FSUBq	dis not found

cpu_intr_1_62:
	setx	0x210212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 907: FSQRTs	fsqrt	
	.word 0x8194a1f7  ! 908: WRPR_TPC_I	wrpr	%r18, 0x01f7, %tpc
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa00560  ! 911: FSQRTq	fsqrt	
	.word 0xbfa94820  ! 912: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb93d5000  ! 913: SRAX_R	srax	%r21, %r0, %r28
T1_asi_reg_wr_43:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 914: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb17c4400  ! 918: MOVR_R	movre	%r17, %r0, %r24
	.word 0x8994a10e  ! 919: WRPR_TICK_I	wrpr	%r18, 0x010e, %tick
	.word 0xb1a90820  ! 921: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_63:
	setx	0x260122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_44:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 926: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_64:
	setx	0x24032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a84820  ! 937: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa8820  ! 946: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 1)
	.word 0xbe8c8000  ! 950: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb3a8c820  ! 955: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_65:
	setx	0x250106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a00020  ! 961: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_31:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_32:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 966: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfa80c20  ! 968: FMOVRLZ	dis not found

T1_asi_reg_rd_33:
	mov	0x2d, %r14
	.word 0xfcdb8400  ! 969: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a88820  ! 978: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a44940  ! 980: FMULd	fmuld	%f48, %f0, %f26
cpu_intr_1_66:
	setx	0x25003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 985: FMOVs	fmovs	%f0, %f26
	.word 0xbda489c0  ! 986: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb3a448e0  ! 988: FSUBq	dis not found

	.word 0xbc040000  ! 991: ADD_R	add 	%r16, %r0, %r30
	.word 0xb0bdc000  ! 992: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb3a4c860  ! 993: FADDq	dis not found

cpu_intr_1_67:
	setx	0x25021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_68:
	setx	0x270236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_69:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 1002: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_45:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 1008: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a588e0  ! 1015: FSUBq	dis not found

cpu_intr_1_70:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a589a0  ! 1023: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xbfa408a0  ! 1024: FSUBs	fsubs	%f16, %f0, %f31
cpu_intr_1_71:
	setx	0x26020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9a88820  ! 1031: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_72:
	setx	0x260331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1036: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda44840  ! 1038: FADDd	faddd	%f48, %f0, %f30
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 31)
	.word 0xbfa00560  ! 1041: FSQRTq	fsqrt	
cpu_intr_1_73:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 1043: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbdab8820  ! 1044: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a408e0  ! 1045: FSUBq	dis not found

iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a54920  ! 1054: FMULs	fmuls	%f21, %f0, %f26
cpu_intr_1_74:
	setx	0x25032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44840  ! 1060: FADDd	faddd	%f48, %f0, %f58
cpu_intr_1_75:
	setx	0x25001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 1069: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbda81c20  ! 1070: FMOVRGEZ	dis not found

T1_asi_reg_rd_35:
	mov	0x37, %r14
	.word 0xf6db89e0  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5a00540  ! 1073: FSQRTd	fsqrt	
	.word 0xb9a00560  ! 1074: FSQRTq	fsqrt	
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_48:
	mov	0x10, %r14
	.word 0xfef384a0  ! 1076: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_36:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb4b40000  ! 1084: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xbba81820  ! 1087: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a00020  ! 1088: FMOVs	fmovs	%f0, %f28
	.word 0xb3a90820  ! 1089: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbfaac820  ! 1090: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_49:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1093: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_77:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x25023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a84820  ! 1107: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_38:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1109: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_39:
	mov	0x2b, %r14
	.word 0xfadb8400  ! 1112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa5c9e0  ! 1117: FDIVq	dis not found

T1_asi_reg_rd_40:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_50:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 1122: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_41:
	mov	0x2c, %r14
	.word 0xf6db8e40  ! 1125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda5c9e0  ! 1134: FDIVq	dis not found

	.word 0xb495613f  ! 1136: ORcc_I	orcc 	%r21, 0x013f, %r26
	.word 0xb7a88820  ! 1138: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb52df001  ! 1140: SLLX_I	sllx	%r23, 0x0001, %r26
T1_asi_reg_wr_51:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 1143: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a4c8e0  ! 1144: FSUBq	dis not found

cpu_intr_1_80:
	setx	0x260214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 1147: FMOVRNZ	dis not found

	.word 0xb2348000  ! 1149: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xb9aac820  ! 1150: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_81:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_82:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_83:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_84:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_85:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_52:
	mov	0x30, %r14
	.word 0xf2f389e0  ! 1161: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9a80820  ! 1164: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbdab8820  ! 1168: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_53:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 1169: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5aa8820  ! 1173: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, c)
	.word 0xb5a50840  ! 1175: FADDd	faddd	%f20, %f0, %f26
	.word 0xbba00520  ! 1176: FSQRTs	fsqrt	
T1_asi_reg_rd_42:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda408e0  ! 1180: FSUBq	dis not found

cpu_intr_1_86:
	setx	0x24013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 1182: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbda48960  ! 1185: FMULq	dis not found

cpu_intr_1_87:
	setx	0x260221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_88:
	setx	0x270236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40940  ! 1192: FMULd	fmuld	%f16, %f0, %f28
	.word 0xbda5c920  ! 1193: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbda80c20  ! 1196: FMOVRLZ	dis not found

	.word 0xbda5c8a0  ! 1199: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbda84820  ! 1202: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00560  ! 1203: FSQRTq	fsqrt	
	.word 0xb33de001  ! 1207: SRA_I	sra 	%r23, 0x0001, %r25
T1_asi_reg_wr_54:
	mov	0x35, %r14
	.word 0xfcf389e0  ! 1208: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbdab8820  ! 1209: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a40920  ! 1210: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbfa84820  ! 1211: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba44840  ! 1215: FADDd	faddd	%f48, %f0, %f60
T1_asi_reg_wr_55:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 1216: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 8)
	.word 0xbba81820  ! 1220: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_89:
	setx	0x250309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 1226: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb9aa8820  ! 1229: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_90:
	setx	0x260325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a5c820  ! 1240: FADDs	fadds	%f23, %f0, %f24
	.word 0xb7a80420  ! 1242: FMOVRZ	dis not found

iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_91:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x240014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a00560  ! 1255: FSQRTq	fsqrt	
T1_asi_reg_wr_56:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 1257: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_93:
	setx	0x24023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_94:
	setx	0x240027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a488c0  ! 1265: FSUBd	fsubd	%f18, %f0, %f58
cpu_intr_1_95:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_96:
	setx	0x26033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 23)
	.word 0xb7a44820  ! 1275: FADDs	fadds	%f17, %f0, %f27
T1_asi_reg_wr_57:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 1276: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a00520  ! 1277: FSQRTs	fsqrt	
cpu_intr_1_97:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa58920  ! 1283: FMULs	fmuls	%f22, %f0, %f31
T1_asi_reg_wr_58:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1284: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a00040  ! 1285: FMOVd	fmovd	%f0, %f26
	.word 0xbcb4a1d2  ! 1290: SUBCcc_I	orncc 	%r18, 0x01d2, %r30
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, e)
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5a80c20  ! 1296: FMOVRLZ	dis not found

iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a81820  ! 1299: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_59:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 1301: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb2154000  ! 1308: OR_R	or 	%r21, %r0, %r25
	.word 0xb1a8c820  ! 1310: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab0820  ! 1312: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c9c0  ! 1313: FDIVd	fdivd	%f54, %f0, %f60
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_60:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 1315: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, b)
	.word 0xb7a409e0  ! 1318: FDIVq	dis not found

iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_98:
	setx	0x250213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448a0  ! 1326: FSUBs	fsubs	%f17, %f0, %f25
T1_asi_reg_wr_61:
	mov	0xe, %r14
	.word 0xf4f38e80  ! 1329: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_62:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 1331: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xba8d6085  ! 1332: ANDcc_I	andcc 	%r21, 0x0085, %r29
T1_asi_reg_wr_63:
	mov	0x2a, %r14
	.word 0xfcf38e40  ! 1333: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_100:
	setx	0x25001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x260011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_102:
	setx	0x26011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 1339: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb20d613e  ! 1340: AND_I	and 	%r21, 0x013e, %r25
T1_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_45:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 1344: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_65:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 1345: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfaa4820  ! 1346: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_103:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbe1d0000  ! 1363: XOR_R	xor 	%r20, %r0, %r31
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_104:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 1372: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a409c0  ! 1375: FDIVd	fdivd	%f16, %f0, %f24
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a409c0  ! 1381: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb3a80420  ! 1385: FMOVRZ	dis not found

T1_asi_reg_rd_46:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_105:
	setx	0x29022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57c0400  ! 1392: MOVR_R	movre	%r16, %r0, %r26
	.word 0xb7abc820  ! 1393: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80420  ! 1394: FMOVRZ	dis not found

	.word 0xb4ad614b  ! 1397: ANDNcc_I	andncc 	%r21, 0x014b, %r26
T1_asi_reg_rd_47:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda00560  ! 1403: FSQRTq	fsqrt	
cpu_intr_1_106:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_107:
	setx	0x2b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1413: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a54820  ! 1414: FADDs	fadds	%f21, %f0, %f27
cpu_intr_1_108:
	setx	0x290319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_66:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 1416: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a548a0  ! 1420: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbba449a0  ! 1422: FDIVs	fdivs	%f17, %f0, %f29
cpu_intr_1_109:
	setx	0x2a0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_110:
	setx	0x2b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 1431: FMOVLEU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_111:
	setx	0x2b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_67:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 1436: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_wr_68:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 1442: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda5c960  ! 1447: FMULq	dis not found

	.word 0xb5a00520  ! 1449: FSQRTs	fsqrt	
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa88820  ! 1453: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00020  ! 1454: FMOVs	fmovs	%f0, %f24
	.word 0xb3ab8820  ! 1460: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 1462: FSQRTd	fsqrt	
cpu_intr_1_112:
	setx	0x2b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x29032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 1467: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48960  ! 1469: FMULq	dis not found

	.word 0xb0352051  ! 1475: ORN_I	orn 	%r20, 0x0051, %r24
	.word 0xbda488c0  ! 1476: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xbba449c0  ! 1477: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb3aa8820  ! 1479: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_114:
	setx	0x2b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_115:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba5c9e0  ! 1487: FDIVq	dis not found

cpu_intr_1_116:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x2b0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409a0  ! 1494: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb7ab8820  ! 1495: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_48:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa40940  ! 1502: FMULd	fmuld	%f16, %f0, %f62
T1_asi_reg_wr_69:
	mov	0x3, %r14
	.word 0xfef389e0  ! 1506: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_118:
	setx	0x2a003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_49:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_119:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_50:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 1522: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbea5a10c  ! 1527: SUBcc_I	subcc 	%r22, 0x010c, %r31
	.word 0xb9a9c820  ! 1529: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_120:
	setx	0x2b0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_121:
	setx	0x2a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 1534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a4c8c0  ! 1535: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_122:
	setx	0x290201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1538: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_123:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 1540: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_124:
	setx	0x280234, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9a80c20  ! 1544: FMOVRLZ	dis not found

iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_70:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 1548: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_53:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 1551: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_125:
	setx	0x2b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_71:
	mov	0xc, %r14
	.word 0xfcf38e60  ! 1554: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7a94820  ! 1558: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_126:
	setx	0x280316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58840  ! 1565: FADDd	faddd	%f22, %f0, %f62
	.word 0xbba94820  ! 1567: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_72:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 1569: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, b)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 37)
	.word 0xba9d4000  ! 1573: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xbfaa0820  ! 1576: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_128:
	setx	0x290017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 1579: FMOVs	fmovs	%f0, %f24
cpu_intr_1_129:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 1589: FADDs	fadds	%f18, %f0, %f26
cpu_intr_1_132:
	setx	0x2b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbf359000  ! 1594: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xbeb50000  ! 1595: SUBCcc_R	orncc 	%r20, %r0, %r31
cpu_intr_1_133:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3df001  ! 1597: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xb40c4000  ! 1598: AND_R	and 	%r17, %r0, %r26
	.word 0xb1a58820  ! 1599: FADDs	fadds	%f22, %f0, %f24
	.word 0xb1356001  ! 1601: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xb3a8c820  ! 1606: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_134:
	setx	0x290002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1609: FMOVRGEZ	dis not found

	.word 0xbda00020  ! 1610: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_73:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 1611: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb33c3001  ! 1612: SRAX_I	srax	%r16, 0x0001, %r25
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_135:
	setx	0x2b0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a50920  ! 1627: FMULs	fmuls	%f20, %f0, %f24
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba54820  ! 1632: FADDs	fadds	%f21, %f0, %f29
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfaa0820  ! 1641: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_54:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_136:
	setx	0x290213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 1646: FMOVs	fmovs	%f0, %f29
cpu_intr_1_137:
	setx	0x2a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9a80820  ! 1650: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_138:
	setx	0x2b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9ab4820  ! 1654: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_139:
	setx	0x29020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_140:
	setx	0x2b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_74:
	mov	0x29, %r14
	.word 0xfef38e80  ! 1660: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_56:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9a00040  ! 1668: FMOVd	fmovd	%f0, %f28
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_141:
	setx	0x290322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c860  ! 1675: FADDq	dis not found

iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfa4c8c0  ! 1677: FSUBd	fsubd	%f50, %f0, %f62
T1_asi_reg_wr_75:
	mov	0xd, %r14
	.word 0xf0f38e60  ! 1678: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1a5c860  ! 1679: FADDq	dis not found

	.word 0xb5a448e0  ! 1682: FSUBq	dis not found

T1_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 1686: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a48940  ! 1689: FMULd	fmuld	%f18, %f0, %f26
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, e)
	.word 0xb9a00560  ! 1694: FSQRTq	fsqrt	
	.word 0xb5a44920  ! 1696: FMULs	fmuls	%f17, %f0, %f26
	.word 0xbda5c8e0  ! 1697: FSUBq	dis not found

	.word 0xb7a4c940  ! 1698: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb7a549c0  ! 1703: FDIVd	fdivd	%f52, %f0, %f58
T1_asi_reg_rd_58:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 1705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_142:
	setx	0x280222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bcc000  ! 1710: XNORcc_R	xnorcc 	%r19, %r0, %r25
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9aa4820  ! 1717: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a5c920  ! 1719: FMULs	fmuls	%f23, %f0, %f28
	.word 0xbebcc000  ! 1727: XNORcc_R	xnorcc 	%r19, %r0, %r31
cpu_intr_1_143:
	setx	0x280322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0354000  ! 1730: ORN_R	orn 	%r21, %r0, %r24
	.word 0xbfa80820  ! 1731: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb3a449c0  ! 1733: FDIVd	fdivd	%f48, %f0, %f56
T1_asi_reg_wr_76:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 1734: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9a00560  ! 1738: FSQRTq	fsqrt	
	.word 0xbb2c8000  ! 1740: SLL_R	sll 	%r18, %r0, %r29
	.word 0xb9a88820  ! 1744: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_144:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58960  ! 1751: FMULq	dis not found

	.word 0xb5a58920  ! 1757: FMULs	fmuls	%f22, %f0, %f26
T1_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 1759: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_59:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_145:
	setx	0x2b0139, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 1764: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 35)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_79:
	mov	0x4, %r14
	.word 0xfef38e40  ! 1773: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_60:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfa40960  ! 1776: FMULq	dis not found

cpu_intr_1_146:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 1779: FADDs	fadds	%f21, %f0, %f28
	.word 0xbf3da001  ! 1780: SRA_I	sra 	%r22, 0x0001, %r31
	.word 0xb7aa8820  ! 1782: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_147:
	setx	0x290306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_80:
	mov	0x11, %r14
	.word 0xf0f384a0  ! 1786: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_148:
	setx	0x290223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 1791: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_61:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_149:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_150:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8e0  ! 1800: FSUBq	dis not found

cpu_intr_1_151:
	setx	0x280035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_152:
	setx	0x2a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_81:
	mov	0x2c, %r14
	.word 0xf2f38e60  ! 1807: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb28de1fc  ! 1808: ANDcc_I	andcc 	%r23, 0x01fc, %r25
	.word 0xbebcc000  ! 1811: XNORcc_R	xnorcc 	%r19, %r0, %r31
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_62:
	mov	0x23, %r14
	.word 0xf8db8400  ! 1813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbbaac820  ! 1814: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c960  ! 1821: FMULq	dis not found

T1_asi_reg_wr_82:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 1826: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_63:
	mov	0x22, %r14
	.word 0xf8db8e80  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_83:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 1831: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb17c8400  ! 1837: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbfab0820  ! 1838: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda44940  ! 1844: FMULd	fmuld	%f48, %f0, %f30
T1_asi_reg_rd_64:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 1845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a80820  ! 1847: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5a508e0  ! 1855: FSUBq	dis not found

	.word 0xb00dc000  ! 1857: AND_R	and 	%r23, %r0, %r24
cpu_intr_1_153:
	setx	0x2d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfaac820  ! 1865: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab8820  ! 1866: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_65:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a00560  ! 1871: FSQRTq	fsqrt	
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_154:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_155:
	setx	0x2e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_84:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 1878: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a90820  ! 1879: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a80420  ! 1883: FMOVRZ	dis not found

	.word 0xb3a48820  ! 1884: FADDs	fadds	%f18, %f0, %f25
	.word 0xb61520cf  ! 1885: OR_I	or 	%r20, 0x00cf, %r27
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a58960  ! 1904: FMULq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_85:
	mov	0x7, %r14
	.word 0xf8f384a0  ! 1913: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb28dc000  ! 1921: ANDcc_R	andcc 	%r23, %r0, %r25
cpu_intr_1_156:
	setx	0x2f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a81820  ! 1924: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xba4421a0  ! 1925: ADDC_I	addc 	%r16, 0x01a0, %r29
T1_asi_reg_wr_86:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 1932: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_67:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_157:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_158:
	setx	0x2c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c820  ! 1941: FADDs	fadds	%f23, %f0, %f28
	.word 0xbcb4e186  ! 1942: ORNcc_I	orncc 	%r19, 0x0186, %r30
	.word 0xb5a448a0  ! 1943: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xb1a84820  ! 1944: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 2e)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_159:
	setx	0x2f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbbaac820  ! 1950: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 23)
	.word 0xbbabc820  ! 1955: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_68:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 1956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a588a0  ! 1960: FSUBs	fsubs	%f22, %f0, %f27
	.word 0x83942107  ! 1961: WRPR_TNPC_I	wrpr	%r16, 0x0107, %tnpc
	.word 0xb1a40920  ! 1962: FMULs	fmuls	%f16, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbdaa0820  ! 1969: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a44920  ! 1972: FMULs	fmuls	%f17, %f0, %f27
T1_asi_reg_wr_87:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 1973: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a00040  ! 1976: FMOVd	fmovd	%f0, %f58
cpu_intr_1_160:
	setx	0x2d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x2, %r14
	.word 0xfcf38400  ! 1979: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbac58000  ! 1982: ADDCcc_R	addccc 	%r22, %r0, %r29
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_69:
	mov	0xc, %r14
	.word 0xf0db8400  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_89:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1985: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa00560  ! 1987: FSQRTq	fsqrt	
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_161:
	setx	0x2d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 1996: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbe8dc000  ! 1997: ANDcc_R	andcc 	%r23, %r0, %r31
T1_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9a80820  ! 2001: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_90:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 2002: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x879561a7  ! 2003: WRPR_TT_I	wrpr	%r21, 0x01a7, %tt
T1_asi_reg_rd_71:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a8c820  ! 2006: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_162:
	setx	0x2d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_163:
	setx	0x2e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_91:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2018: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 39)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb1a00560  ! 2025: FSQRTq	fsqrt	
cpu_intr_1_164:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548a0  ! 2027: FSUBs	fsubs	%f21, %f0, %f25
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_72:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 2032: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a588c0  ! 2034: FSUBd	fsubd	%f22, %f0, %f56
cpu_intr_1_165:
	setx	0x2c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 2039: FADDs	fadds	%f18, %f0, %f26
	.word 0xbba00540  ! 2040: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a589e0  ! 2045: FDIVq	dis not found

	.word 0xbeb54000  ! 2049: SUBCcc_R	orncc 	%r21, %r0, %r31
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba549a0  ! 2052: FDIVs	fdivs	%f21, %f0, %f29
cpu_intr_1_166:
	setx	0x2c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_92:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2055: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_167:
	setx	0x2e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 2059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_74:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_168:
	setx	0x2f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5a488e0  ! 2066: FSUBq	dis not found

T1_asi_reg_wr_93:
	mov	0xb, %r14
	.word 0xfef38e60  ! 2067: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_94:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 2068: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa4c8e0  ! 2069: FSUBq	dis not found

iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_95:
	mov	0xc, %r14
	.word 0xf8f38400  ! 2071: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbba44860  ! 2073: FADDq	dis not found

	.word 0xb1a44920  ! 2077: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb7a94820  ! 2079: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a00560  ! 2087: FSQRTq	fsqrt	
cpu_intr_1_169:
	setx	0x2c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a448a0  ! 2093: FSUBs	fsubs	%f17, %f0, %f28
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_170:
	setx	0x2e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 2098: FSQRTd	fsqrt	
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_171:
	setx	0x2d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2114: FMOVRZ	dis not found

	.word 0xbfaa4820  ! 2115: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda81820  ! 2116: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_172:
	setx	0x2e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a448c0  ! 2124: FSUBd	fsubd	%f48, %f0, %f26
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a80820  ! 2126: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_96:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 2127: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_173:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 2140: FSUBq	dis not found

iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa90820  ! 2144: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7aac820  ! 2146: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9348000  ! 2147: SRL_R	srl 	%r18, %r0, %r28
	.word 0xb635c000  ! 2149: SUBC_R	orn 	%r23, %r0, %r27
T1_asi_reg_rd_75:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 2155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_76:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_174:
	setx	0x2d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x2f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 2167: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_97:
	mov	0xe, %r14
	.word 0xf6f38400  ! 2168: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_176:
	setx	0x2c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 22)
	.word 0xb09d4000  ! 2176: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xbd2d9000  ! 2177: SLLX_R	sllx	%r22, %r0, %r30
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, e)
	.word 0xb3aa0820  ! 2181: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_98:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 2183: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a508c0  ! 2185: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1a80c20  ! 2186: FMOVRLZ	dis not found

T1_asi_reg_wr_99:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2188: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda00520  ! 2190: FSQRTs	fsqrt	
	.word 0xbfa48920  ! 2194: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb1a9c820  ! 2196: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80420  ! 2197: FMOVRZ	dis not found

T1_asi_reg_wr_100:
	mov	0x1c, %r14
	.word 0xf2f38e60  ! 2198: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_101:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 2201: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_102:
	mov	0xe, %r14
	.word 0xf6f389e0  ! 2202: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_77:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9a5c8c0  ! 2204: FSUBd	fsubd	%f54, %f0, %f28
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_177:
	setx	0x2d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 2212: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_179:
	setx	0x2f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 2216: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a00540  ! 2217: FSQRTd	fsqrt	
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a589c0  ! 2224: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xbfa54820  ! 2227: FADDs	fadds	%f21, %f0, %f31
	.word 0xb5a488c0  ! 2228: FSUBd	fsubd	%f18, %f0, %f26
T1_asi_reg_wr_104:
	mov	0x1c, %r14
	.word 0xf6f384a0  ! 2229: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_180:
	setx	0x2d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5e0d1  ! 2234: ORNcc_I	orncc 	%r23, 0x00d1, %r30
T1_asi_reg_wr_105:
	mov	0x34, %r14
	.word 0xfaf38400  ! 2235: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_106:
	mov	0x1, %r14
	.word 0xf8f38400  ! 2237: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 2240: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a489c0  ! 2241: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbba00020  ! 2242: FMOVs	fmovs	%f0, %f29
	.word 0xb3a80820  ! 2247: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_181:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_182:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, f)
	.word 0xb6c5a1e4  ! 2261: ADDCcc_I	addccc 	%r22, 0x01e4, %r27
T1_asi_reg_rd_79:
	mov	0x14, %r14
	.word 0xf8db8e80  ! 2262: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_107:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 2263: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda589a0  ! 2264: FDIVs	fdivs	%f22, %f0, %f30
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 0)
	.word 0x8594e1b1  ! 2268: WRPR_TSTATE_I	wrpr	%r19, 0x01b1, %tstate
	.word 0xbb3d1000  ! 2269: SRAX_R	srax	%r20, %r0, %r29
T1_asi_reg_wr_108:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 2270: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_183:
	setx	0x2f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 2274: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a9c820  ! 2275: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 2276: FMOVRNZ	dis not found

cpu_intr_1_184:
	setx	0x2d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_185:
	setx	0x2f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488a0  ! 2282: FSUBs	fsubs	%f18, %f0, %f28
T1_asi_reg_rd_80:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_81:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa489a0  ! 2304: FDIVs	fdivs	%f18, %f0, %f31
cpu_intr_1_186:
	setx	0x2e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 2307: FMOVRGEZ	dis not found

T1_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_109:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 2311: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1349000  ! 2312: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xb5a509e0  ! 2314: FDIVq	dis not found

	.word 0xb9a5c8c0  ! 2317: FSUBd	fsubd	%f54, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a84820  ! 2324: FMOVE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_83:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 2326: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, a)
	.word 0xb5480000  ! 2328: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_187:
	setx	0x330108, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb3a00520  ! 2336: FSQRTs	fsqrt	
cpu_intr_1_188:
	setx	0x33033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 2339: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_110:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 2341: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_84:
	mov	0x30, %r14
	.word 0xfcdb8e80  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbba80820  ! 2346: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_189:
	setx	0x33031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a588c0  ! 2348: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb5a90820  ! 2350: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbda80820  ! 2351: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb49cc000  ! 2352: XORcc_R	xorcc 	%r19, %r0, %r26
T1_asi_reg_rd_85:
	mov	0x33, %r14
	.word 0xfedb89e0  ! 2354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1a44820  ! 2356: FADDs	fadds	%f17, %f0, %f24
	.word 0xb3a80820  ! 2357: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_86:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb0bd0000  ! 2369: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xbba549c0  ! 2370: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb1a81820  ! 2375: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbba00540  ! 2376: FSQRTd	fsqrt	
	.word 0xb845a0e9  ! 2378: ADDC_I	addc 	%r22, 0x00e9, %r28
	.word 0xb5641800  ! 2379: MOVcc_R	<illegal instruction>
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe15a0be  ! 2390: OR_I	or 	%r22, 0x00be, %r31
	.word 0xb3a9c820  ! 2391: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_190:
	setx	0x300203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3de001  ! 2393: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xb0840000  ! 2398: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xb5a9c820  ! 2399: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb1a81c20  ! 2406: FMOVRGEZ	dis not found

T1_asi_reg_rd_87:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_191:
	setx	0x30022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2410: RDPR_PIL	<illegal instruction>
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbda00020  ! 2412: FMOVs	fmovs	%f0, %f30
cpu_intr_1_192:
	setx	0x300216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_88:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 2421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a80820  ! 2424: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_193:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_194:
	setx	0x330338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_89:
	mov	0x26, %r14
	.word 0xf4db8400  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_111:
	mov	0xa, %r14
	.word 0xfef38e60  ! 2433: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_90:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 2435: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a00560  ! 2438: FSQRTq	fsqrt	
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_195:
	setx	0x310003, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_112:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 2447: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1a588c0  ! 2448: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa50920  ! 2454: FMULs	fmuls	%f20, %f0, %f31
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_196:
	setx	0x310010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a8c820  ! 2465: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_113:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2470: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_91:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 2473: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1a81c20  ! 2474: FMOVRGEZ	dis not found

iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1ab4820  ! 2479: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a50920  ! 2481: FMULs	fmuls	%f20, %f0, %f27
T1_asi_reg_wr_114:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 2485: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3aac820  ! 2486: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_197:
	setx	0x320209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409a0  ! 2489: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_115:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 2493: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9a4c940  ! 2501: FMULd	fmuld	%f50, %f0, %f28
cpu_intr_1_198:
	setx	0x310319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_116:
	mov	0x24, %r14
	.word 0xfef38e80  ! 2505: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_199:
	setx	0x31003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_200:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_92:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_201:
	setx	0x320213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c940  ! 2516: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb1abc820  ! 2517: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a94820  ! 2519: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_202:
	setx	0x300037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c940  ! 2528: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbda509e0  ! 2529: FDIVq	dis not found

cpu_intr_1_203:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_93:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_204:
	setx	0x310222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 2536: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_205:
	setx	0x31022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_206:
	setx	0x300232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c940  ! 2541: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb9a58820  ! 2542: FADDs	fadds	%f22, %f0, %f28
	.word 0xb3abc820  ! 2545: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80420  ! 2547: FMOVRZ	dis not found

T1_asi_reg_wr_117:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 2548: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1aa0820  ! 2549: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c860  ! 2550: FADDq	dis not found

cpu_intr_1_207:
	setx	0x30000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 2554: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a8c820  ! 2555: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 2556: FMOVRNZ	dis not found

T1_asi_reg_rd_95:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 2557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_96:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 2558: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_118:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 2560: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, a)
	.word 0xb1abc820  ! 2567: FMOVVC	fmovs	%fcc1, %f0, %f24
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_119:
	mov	0x28, %r14
	.word 0xf0f38400  ! 2574: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfa4c920  ! 2575: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbfabc820  ! 2576: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_208:
	setx	0x320238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 2580: FMULd	fmuld	%f20, %f0, %f30
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a40940  ! 2584: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb0bd4000  ! 2585: XNORcc_R	xnorcc 	%r21, %r0, %r24
T1_asi_reg_wr_120:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2589: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3a88820  ! 2592: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a94820  ! 2595: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_121:
	mov	0x32, %r14
	.word 0xf2f389e0  ! 2598: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3ab8820  ! 2601: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a8c820  ! 2602: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_97:
	mov	0x14, %r14
	.word 0xfedb8400  ! 2604: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbaac8000  ! 2607: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xb8ac0000  ! 2608: ANDNcc_R	andncc 	%r16, %r0, %r28
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_122:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2611: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc344000  ! 2613: ORN_R	orn 	%r17, %r0, %r30
T1_asi_reg_wr_123:
	mov	0x29, %r14
	.word 0xfaf38400  ! 2616: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_209:
	setx	0x310113, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_98:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 2620: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a4c820  ! 2623: FADDs	fadds	%f19, %f0, %f27
	.word 0xbcc46099  ! 2626: ADDCcc_I	addccc 	%r17, 0x0099, %r30
cpu_intr_1_210:
	setx	0x32010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 2631: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb93d5000  ! 2636: SRAX_R	srax	%r21, %r0, %r28
	.word 0xb9a84820  ! 2641: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00520  ! 2644: FSQRTs	fsqrt	
	.word 0xb7a81420  ! 2646: FMOVRNZ	dis not found

	.word 0xb3a00560  ! 2649: FSQRTq	fsqrt	
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3aa0820  ! 2651: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbda81820  ! 2653: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_99:
	mov	0x8, %r14
	.word 0xf2db8400  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbc2d8000  ! 2658: ANDN_R	andn 	%r22, %r0, %r30
T1_asi_reg_wr_124:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 2664: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbba80c20  ! 2665: FMOVRLZ	dis not found

cpu_intr_1_211:
	setx	0x31012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a8c820  ! 2670: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5abc820  ! 2671: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_212:
	setx	0x310327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda81820  ! 2675: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba5c820  ! 2683: FADDs	fadds	%f23, %f0, %f29
cpu_intr_1_213:
	setx	0x310013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_125:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 2686: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_214:
	setx	0x330213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 2689: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbda408a0  ! 2691: FSUBs	fsubs	%f16, %f0, %f30
cpu_intr_1_215:
	setx	0x310137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549e0  ! 2696: FDIVq	dis not found

	.word 0xb7a80c20  ! 2698: FMOVRLZ	dis not found

cpu_intr_1_216:
	setx	0x330101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_101:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_126:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 2707: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_127:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 2710: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_128:
	mov	0x25, %r14
	.word 0xf4f38e60  ! 2711: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0x8d94e104  ! 2712: WRPR_PSTATE_I	wrpr	%r19, 0x0104, %pstate
	.word 0xb3a94820  ! 2715: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_102:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 2716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_129:
	mov	0xf, %r14
	.word 0xf6f38400  ! 2717: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5a8c820  ! 2718: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda48920  ! 2720: FMULs	fmuls	%f18, %f0, %f30
T1_asi_reg_rd_103:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_217:
	setx	0x31033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_218:
	setx	0x300322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_219:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 2b)
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 6)
	.word 0xbe3da0b5  ! 2743: XNOR_I	xnor 	%r22, 0x00b5, %r31
	.word 0xb1a80420  ! 2746: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a4c9c0  ! 2748: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xbda5c9a0  ! 2752: FDIVs	fdivs	%f23, %f0, %f30
cpu_intr_1_220:
	setx	0x330035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a588e0  ! 2762: FSUBq	dis not found

	.word 0xb1a448a0  ! 2765: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbfa00020  ! 2767: FMOVs	fmovs	%f0, %f31
	.word 0xb3a4c840  ! 2768: FADDd	faddd	%f50, %f0, %f56
	.word 0xb5a84820  ! 2769: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5ab4820  ! 2771: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a589e0  ! 2772: FDIVq	dis not found

	.word 0xba94a1f1  ! 2774: ORcc_I	orcc 	%r18, 0x01f1, %r29
	.word 0xbda80820  ! 2777: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 1)
	.word 0xb434e075  ! 2781: ORN_I	orn 	%r19, 0x0075, %r26
	.word 0xbfa00540  ! 2784: FSQRTd	fsqrt	
	.word 0xb3a88820  ! 2787: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 2788: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb92c0000  ! 2789: SLL_R	sll 	%r16, %r0, %r28
cpu_intr_1_221:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_222:
	setx	0x360239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 2794: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7a94820  ! 2798: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_223:
	setx	0x360219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_224:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x360025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 29)
	.word 0xb13c8000  ! 2817: SRA_R	sra 	%r18, %r0, %r24
	.word 0xbfa44920  ! 2818: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbba98820  ! 2821: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbfa4c840  ! 2830: FADDd	faddd	%f50, %f0, %f62
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_226:
	setx	0x360016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 2836: FMOVE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_104:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 2)
	.word 0xbda5c960  ! 2839: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb61c8000  ! 2843: XOR_R	xor 	%r18, %r0, %r27
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_227:
	setx	0x370329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_228:
	setx	0x370113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x360009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88ca110  ! 2856: ANDcc_I	andcc 	%r18, 0x0110, %r28
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 29)
	.word 0xb9a00560  ! 2860: FSQRTq	fsqrt	
T1_asi_reg_rd_105:
	mov	0x23, %r14
	.word 0xf8db8e80  ! 2861: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbba50840  ! 2864: FADDd	faddd	%f20, %f0, %f60
	.word 0xb7a90820  ! 2866: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_106:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2875: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda80820  ! 2877: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb88c8000  ! 2879: ANDcc_R	andcc 	%r18, %r0, %r28
T1_asi_reg_rd_107:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 2882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3a94820  ! 2895: FMOVCS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a00520  ! 2900: FSQRTs	fsqrt	
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a00020  ! 2906: FMOVs	fmovs	%f0, %f27
	.word 0xb3a00560  ! 2907: FSQRTq	fsqrt	
cpu_intr_1_230:
	setx	0x370318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2910: RDPR_GL	<illegal instruction>
T1_asi_reg_wr_131:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2913: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda00520  ! 2914: FSQRTs	fsqrt	
	.word 0xb9a50860  ! 2915: FADDq	dis not found

cpu_intr_1_231:
	setx	0x34011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x350232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50920  ! 2923: FMULs	fmuls	%f20, %f0, %f25
T1_asi_reg_rd_109:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb0b46087  ! 2927: SUBCcc_I	orncc 	%r17, 0x0087, %r24
cpu_intr_1_233:
	setx	0x360212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 2931: FSQRTq	fsqrt	
T1_asi_reg_wr_132:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 2938: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7ab0820  ! 2943: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_234:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 2951: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_110:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_235:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_236:
	setx	0x37013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c840  ! 2968: FADDd	faddd	%f54, %f0, %f58
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_133:
	mov	0x35, %r14
	.word 0xfef38e80  ! 2970: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a48840  ! 2973: FADDd	faddd	%f18, %f0, %f24
cpu_intr_1_237:
	setx	0x34000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x340035, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbda4c8a0  ! 2985: FSUBs	fsubs	%f19, %f0, %f30
T1_asi_reg_rd_112:
	mov	0x28, %r14
	.word 0xf4db8400  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba00040  ! 2994: FMOVd	fmovd	%f0, %f60
	.word 0xbfaac820  ! 2995: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a90820  ! 2999: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_113:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5aa0820  ! 3001: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_239:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3005: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb82d610d  ! 3007: ANDN_I	andn 	%r21, 0x010d, %r28
	.word 0xb9aa0820  ! 3008: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_114:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_240:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 3011: FMOVRGEZ	dis not found

	.word 0xb3a9c820  ! 3015: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 3019: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_135:
	mov	0x34, %r14
	.word 0xfef38400  ! 3022: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_241:
	setx	0x34001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_242:
	setx	0x360224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 3030: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 3033: FMOVRLZ	dis not found

cpu_intr_1_243:
	setx	0x370308, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7a588c0  ! 3041: FSUBd	fsubd	%f22, %f0, %f58
cpu_intr_1_244:
	setx	0x32a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_136:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 3048: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbba409e0  ! 3050: FDIVq	dis not found

	.word 0xb135a001  ! 3054: SRL_I	srl 	%r22, 0x0001, %r24
	.word 0xb33c6001  ! 3056: SRA_I	sra 	%r17, 0x0001, %r25
cpu_intr_1_245:
	setx	0x360020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 3065: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa81c20  ! 3071: FMOVRGEZ	dis not found

T1_asi_reg_rd_116:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 3072: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_137:
	mov	0x30, %r14
	.word 0xfef38400  ! 3073: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5a54940  ! 3074: FMULd	fmuld	%f52, %f0, %f26
	.word 0xbba80420  ! 3075: FMOVRZ	dis not found

	.word 0xb3a80820  ! 3076: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba588a0  ! 3077: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb3a90820  ! 3078: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a50920  ! 3080: FMULs	fmuls	%f20, %f0, %f25
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 1e)
	lda	[%r17 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a409e0  ! 3086: FDIVq	dis not found

T1_asi_reg_wr_138:
	mov	0x1b, %r14
	.word 0xf0f38400  ! 3087: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7347001  ! 3089: SRLX_I	srlx	%r17, 0x0001, %r27
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda94820  ! 3093: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a4c9c0  ! 3095: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xbd7c0400  ! 3096: MOVR_R	movre	%r16, %r0, %r30
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa84820  ! 3098: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a40960  ! 3101: FMULq	dis not found

iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, f)
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a98820  ! 3108: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb61c21a3  ! 3110: XOR_I	xor 	%r16, 0x01a3, %r27
T1_asi_reg_wr_139:
	mov	0x1f, %r14
	.word 0xf8f389e0  ! 3111: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xba1461dd  ! 3114: OR_I	or 	%r17, 0x01dd, %r29
cpu_intr_1_246:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b48000  ! 3119: SUBCcc_R	orncc 	%r18, %r0, %r24
cpu_intr_1_247:
	setx	0x36032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_248:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_249:
	setx	0x370014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_140:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 3129: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 3134: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1aac820  ! 3136: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_250:
	setx	0x360117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3140: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb7a48940  ! 3141: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb5a50820  ! 3143: FADDs	fadds	%f20, %f0, %f26
T1_asi_reg_rd_118:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb02dc000  ! 3146: ANDN_R	andn 	%r23, %r0, %r24
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_142:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 3149: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba488c0  ! 3151: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb9a98820  ! 3154: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_251:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3158: FMOVRZ	dis not found

	.word 0xb3a409c0  ! 3159: FDIVd	fdivd	%f16, %f0, %f56
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 39)
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, e)
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_252:
	setx	0x35023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54960  ! 3169: FMULq	dis not found

	.word 0xbfa80820  ! 3171: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_143:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 3172: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_253:
	setx	0x350011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1dc000  ! 3184: XOR_R	xor 	%r23, %r0, %r31
	.word 0xbc048000  ! 3186: ADD_R	add 	%r18, %r0, %r30
	.word 0xb7a00560  ! 3187: FSQRTq	fsqrt	
	.word 0x8d946074  ! 3189: WRPR_PSTATE_I	wrpr	%r17, 0x0074, %pstate
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_254:
	setx	0x370236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_144:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 3196: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0x8794a1c6  ! 3198: WRPR_TT_I	wrpr	%r18, 0x01c6, %tt
T1_asi_reg_wr_145:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3200: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xba84600b  ! 3206: ADDcc_I	addcc 	%r17, 0x000b, %r29
	.word 0xb3a00520  ! 3207: FSQRTs	fsqrt	
	.word 0xb5a80420  ! 3208: FMOVRZ	dis not found

	.word 0xb1a4c8a0  ! 3211: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb3abc820  ! 3214: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c9a0  ! 3217: FDIVs	fdivs	%f19, %f0, %f27
T1_asi_reg_rd_119:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 3219: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfa00540  ! 3220: FSQRTd	fsqrt	
cpu_intr_1_255:
	setx	0x35020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 3222: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba00540  ! 3228: FSQRTd	fsqrt	
	.word 0xb0b4c000  ! 3229: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xbda40920  ! 3231: FMULs	fmuls	%f16, %f0, %f30
cpu_intr_1_256:
	setx	0x340302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_257:
	setx	0x360136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_258:
	setx	0x350213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_259:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444e1ea  ! 3238: ADDC_I	addc 	%r19, 0x01ea, %r26
	.word 0xb9a489c0  ! 3239: FDIVd	fdivd	%f18, %f0, %f28
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_260:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 3244: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_120:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa80c20  ! 3248: FMOVRLZ	dis not found

T1_asi_reg_rd_121:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a84820  ! 3251: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00020  ! 3252: FMOVs	fmovs	%f0, %f24
	.word 0xb1ab4820  ! 3256: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbfa549e0  ! 3261: FDIVq	dis not found

	.word 0xbdaa4820  ! 3264: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_147:
	mov	0xa, %r14
	.word 0xf2f38e40  ! 3265: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a00560  ! 3267: FSQRTq	fsqrt	
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_261:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444a048  ! 3271: ADDC_I	addc 	%r18, 0x0048, %r26
	.word 0xb9a90820  ! 3272: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbc3d4000  ! 3274: XNOR_R	xnor 	%r21, %r0, %r30
T1_asi_reg_wr_148:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 3275: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_149:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 3277: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a81820  ! 3279: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbda81420  ! 3280: FMOVRNZ	dis not found

iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a44960  ! 3282: FMULq	dis not found

T1_asi_reg_rd_122:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_262:
	setx	0x390331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54940  ! 3287: FMULd	fmuld	%f52, %f0, %f30
cpu_intr_1_263:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 3289: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9a80820  ! 3292: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbd34a001  ! 3293: SRL_I	srl 	%r18, 0x0001, %r30
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_123:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb0454000  ! 3298: ADDC_R	addc 	%r21, %r0, %r24
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 5)
	.word 0xbda509e0  ! 3301: FDIVq	dis not found

	.word 0xb7a5c8a0  ! 3302: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xbba8c820  ! 3303: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_264:
	setx	0x3a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 3315: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00540  ! 3316: FSQRTd	fsqrt	
	.word 0xbba5c8e0  ! 3317: FSUBq	dis not found

iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, a)
	.word 0xb804a095  ! 3323: ADD_I	add 	%r18, 0x0095, %r28
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_124:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_151:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3326: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a548a0  ! 3327: FSUBs	fsubs	%f21, %f0, %f26
cpu_intr_1_265:
	setx	0x3b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 3332: FSQRTs	fsqrt	
	.word 0xbba94820  ! 3334: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80c20  ! 3338: FMOVRLZ	dis not found

cpu_intr_1_266:
	setx	0x3a0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 13)
	.word 0xbea420d3  ! 3342: SUBcc_I	subcc 	%r16, 0x00d3, %r31
	.word 0xb3a98820  ! 3346: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a94820  ! 3351: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a448e0  ! 3360: FSUBq	dis not found

	.word 0xb9a94820  ! 3364: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 3365: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_267:
	setx	0x3b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_268:
	setx	0x3a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 3374: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_269:
	setx	0x3b0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48920  ! 3376: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb3a5c860  ! 3378: FADDq	dis not found

T1_asi_reg_rd_125:
	mov	0x38, %r14
	.word 0xfedb8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_270:
	setx	0x3b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_271:
	setx	0x10327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_272:
	setx	0x390107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 3393: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbc9d4000  ! 3394: XORcc_R	xorcc 	%r21, %r0, %r30
T1_asi_reg_wr_153:
	mov	0x29, %r14
	.word 0xf0f38400  ! 3395: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_154:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 3398: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_273:
	setx	0x3b0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 3)
	.word 0xb3a80820  ! 3402: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbda48820  ! 3403: FADDs	fadds	%f18, %f0, %f30
T1_asi_reg_rd_126:
	mov	0x13, %r14
	.word 0xfadb8400  ! 3404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_wr_155:
	mov	0x0, %r14
	.word 0xfaf38e60  ! 3405: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb42c4000  ! 3410: ANDN_R	andn 	%r17, %r0, %r26
	.word 0xb1a81c20  ! 3411: FMOVRGEZ	dis not found

	.word 0xb8ac2136  ! 3413: ANDNcc_I	andncc 	%r16, 0x0136, %r28
	.word 0xb77c8400  ! 3414: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb5a00020  ! 3418: FMOVs	fmovs	%f0, %f26
	.word 0xb7a80820  ! 3419: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a94820  ! 3421: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00040  ! 3425: FMOVd	fmovd	%f0, %f62
T1_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3426: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 36)
	.word 0xbcad6148  ! 3428: ANDNcc_I	andncc 	%r21, 0x0148, %r30
T1_asi_reg_rd_127:
	mov	0xc, %r14
	.word 0xf2db8400  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_157:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3431: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_158:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 3432: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_159:
	mov	0x16, %r14
	.word 0xf6f38e80  ! 3434: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa00560  ! 3441: FSQRTq	fsqrt	
T1_asi_reg_wr_160:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 3444: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_128:
	mov	0x24, %r14
	.word 0xf6db8e40  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_161:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 3452: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_162:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 3453: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_274:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a50940  ! 3456: FMULd	fmuld	%f20, %f0, %f58
	.word 0xb5a00520  ! 3459: FSQRTs	fsqrt	
	.word 0xb8048000  ! 3466: ADD_R	add 	%r18, %r0, %r28
T1_asi_reg_wr_163:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 3467: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, b)
	.word 0xb3a549c0  ! 3469: FDIVd	fdivd	%f52, %f0, %f56
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_275:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9420ac  ! 3477: WRPR_PSTATE_I	wrpr	%r16, 0x00ac, %pstate
T1_asi_reg_rd_129:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_130:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 3480: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5a409e0  ! 3481: FDIVq	dis not found

	.word 0xbfa8c820  ! 3482: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_276:
	setx	0x38010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_164:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 3485: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_277:
	setx	0x3b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, a)
	.word 0xb3aa0820  ! 3490: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3a90820  ! 3493: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_165:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 3494: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_278:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_279:
	setx	0x3b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 3501: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a94820  ! 3503: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_280:
	setx	0x390126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589a0  ! 3507: FDIVs	fdivs	%f22, %f0, %f24
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1ab0820  ! 3509: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb93d3001  ! 3510: SRAX_I	srax	%r20, 0x0001, %r28
T1_asi_reg_wr_166:
	mov	0x1f, %r14
	.word 0xfef38400  ! 3511: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_281:
	setx	0x3a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_167:
	mov	0x37, %r14
	.word 0xf2f38400  ! 3521: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_282:
	setx	0x3a013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 3524: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbbaa8820  ! 3528: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbb643801  ! 3529: MOVcc_I	<illegal instruction>
	.word 0xb5a4c820  ! 3532: FADDs	fadds	%f19, %f0, %f26
T1_asi_reg_wr_168:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 3533: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbda00560  ! 3536: FSQRTq	fsqrt	
cpu_intr_1_283:
	setx	0x3a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_284:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_285:
	setx	0x390123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbab0820  ! 3547: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a408e0  ! 3548: FSUBq	dis not found

	.word 0xbda548c0  ! 3550: FSUBd	fsubd	%f52, %f0, %f30
cpu_intr_1_286:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3554: FSQRTs	fsqrt	
	.word 0xbba548a0  ! 3555: FSUBs	fsubs	%f21, %f0, %f29
cpu_intr_1_287:
	setx	0x3a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 3559: FMOVRGEZ	dis not found

	.word 0xbfa81820  ! 3563: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_288:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_289:
	setx	0x380212, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_169:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 3573: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_290:
	setx	0x390314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_132:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_291:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_170:
	mov	0x19, %r14
	.word 0xf0f38e80  ! 3577: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3a80420  ! 3579: FMOVRZ	dis not found

	.word 0xbfa94820  ! 3583: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_292:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_293:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 3587: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_294:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebde06b  ! 3605: XNORcc_I	xnorcc 	%r23, 0x006b, %r31
	.word 0x8d94610c  ! 3606: WRPR_PSTATE_I	wrpr	%r17, 0x010c, %pstate
T1_asi_reg_rd_133:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 3607: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_295:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c940  ! 3610: FMULd	fmuld	%f54, %f0, %f28
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_171:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 3614: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7a80820  ! 3616: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_134:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 3618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_296:
	setx	0x38033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_172:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 3623: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7a81c20  ! 3625: FMOVRGEZ	dis not found

cpu_intr_1_297:
	setx	0x380319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_298:
	setx	0x3b0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5348000  ! 3634: SRL_R	srl 	%r18, %r0, %r26
	.word 0xb9a40840  ! 3636: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_wr_173:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 3637: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb41da094  ! 3638: XOR_I	xor 	%r22, 0x0094, %r26
cpu_intr_1_299:
	setx	0x3b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 3641: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbdab8820  ! 3646: FMOVPOS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_300:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_175:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 3651: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbe14a06e  ! 3652: OR_I	or 	%r18, 0x006e, %r31
T1_asi_reg_wr_176:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 3657: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_301:
	setx	0x380224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_302:
	setx	0x3a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 3666: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80c20  ! 3668: FMOVRLZ	dis not found

iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a4c940  ! 3675: FMULd	fmuld	%f50, %f0, %f58
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, d)
	.word 0xb3aa4820  ! 3678: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 0)
	.word 0xb1a509c0  ! 3680: FDIVd	fdivd	%f20, %f0, %f24
T1_asi_reg_rd_135:
	mov	0x3, %r14
	.word 0xf2db84a0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda50960  ! 3687: FMULq	dis not found

	.word 0xb2c50000  ! 3689: ADDCcc_R	addccc 	%r20, %r0, %r25
T1_asi_reg_rd_136:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 3690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_303:
	setx	0x380207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9a0  ! 3694: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb9a9c820  ! 3695: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xf4f38e80  ! 3697: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb9a44820  ! 3699: FADDs	fadds	%f17, %f0, %f28
	.word 0xb5a5c920  ! 3700: FMULs	fmuls	%f23, %f0, %f26
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_178:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3702: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba409a0  ! 3709: FDIVs	fdivs	%f16, %f0, %f29
cpu_intr_1_304:
	setx	0x3e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 3717: FMOVd	fmovd	%f0, %f24
	.word 0xbfa9c820  ! 3718: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbfab0820  ! 3720: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_305:
	setx	0x3d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40940  ! 3725: FMULd	fmuld	%f16, %f0, %f60
cpu_intr_1_306:
	setx	0x3d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda44920  ! 3729: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb5a00540  ! 3730: FSQRTd	fsqrt	
	.word 0xb5a80820  ! 3731: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_307:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 3733: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_137:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 3735: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_rd_138:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_179:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 3737: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3738: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa44920  ! 3743: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbfa94820  ! 3744: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80420  ! 3746: FMOVRZ	dis not found

iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a84820  ! 3757: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a98820  ! 3759: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00020  ! 3760: FMOVs	fmovs	%f0, %f24
T1_asi_reg_rd_140:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbbaa8820  ! 3762: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_180:
	mov	0x1d, %r14
	.word 0xf6f38400  ! 3763: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb0848000  ! 3764: ADDcc_R	addcc 	%r18, %r0, %r24
cpu_intr_1_308:
	setx	0x3d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_181:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3767: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5a448e0  ! 3768: FSUBq	dis not found

cpu_intr_1_309:
	setx	0x3e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3772: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda00040  ! 3773: FMOVd	fmovd	%f0, %f30
	.word 0xb7a448e0  ! 3778: FSUBq	dis not found

cpu_intr_1_310:
	setx	0x3c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1abc820  ! 3789: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 3790: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb49c8000  ! 3792: XORcc_R	xorcc 	%r18, %r0, %r26
cpu_intr_1_311:
	setx	0x3c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_312:
	setx	0x3f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_183:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 3802: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_141:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 3803: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7a81420  ! 3804: FMOVRNZ	dis not found

	.word 0xbc8ce1f5  ! 3806: ANDcc_I	andcc 	%r19, 0x01f5, %r30
	.word 0xb1a509c0  ! 3811: FDIVd	fdivd	%f20, %f0, %f24
cpu_intr_1_313:
	setx	0x3d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x3e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x1c, %r14
	.word 0xf6f38e80  ! 3818: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_142:
	mov	0x17, %r14
	.word 0xfcdb89e0  ! 3819: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_316:
	setx	0x3d003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 3822: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a4c860  ! 3826: FADDq	dis not found

	.word 0xb9a00520  ! 3827: FSQRTs	fsqrt	
cpu_intr_1_317:
	setx	0x3e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_318:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40940  ! 3832: FMULd	fmuld	%f16, %f0, %f28
T1_asi_reg_wr_185:
	mov	0xf, %r14
	.word 0xfcf389e0  ! 3834: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbc956058  ! 3835: ORcc_I	orcc 	%r21, 0x0058, %r30
	.word 0xb5a58860  ! 3836: FADDq	dis not found

	.word 0xb49d4000  ! 3837: XORcc_R	xorcc 	%r21, %r0, %r26
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_319:
	setx	0x3c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588c0  ! 3846: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xbba58820  ! 3847: FADDs	fadds	%f22, %f0, %f29
	.word 0xb32cd000  ! 3851: SLLX_R	sllx	%r19, %r0, %r25
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a48920  ! 3855: FMULs	fmuls	%f18, %f0, %f24
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 10)
	.word 0xbe94e1b2  ! 3863: ORcc_I	orcc 	%r19, 0x01b2, %r31
	.word 0xbfa94820  ! 3864: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a50860  ! 3866: FADDq	dis not found

	.word 0xb1a81420  ! 3867: FMOVRNZ	dis not found

T1_asi_reg_wr_186:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 3869: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_187:
	mov	0xd, %r14
	.word 0xfef389e0  ! 3871: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_188:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 3872: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 25)
	.word 0xb32c4000  ! 3876: SLL_R	sll 	%r17, %r0, %r25
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 19)
	.word 0xbebd4000  ! 3883: XNORcc_R	xnorcc 	%r21, %r0, %r31
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_320:
	setx	0x3f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 3892: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0x8994a16c  ! 3893: WRPR_TICK_I	wrpr	%r18, 0x016c, %tick
T1_asi_reg_rd_143:
	mov	0x2e, %r14
	.word 0xf2db8e60  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_321:
	setx	0x3c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50820  ! 3897: FADDs	fadds	%f20, %f0, %f30
	.word 0xb9a44960  ! 3899: FMULq	dis not found

cpu_intr_1_322:
	setx	0x3f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba80820  ! 3908: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_190:
	mov	0x34, %r14
	.word 0xf4f38400  ! 3912: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbba84820  ! 3913: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a9c820  ! 3915: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a5c8c0  ! 3917: FSUBd	fsubd	%f54, %f0, %f24
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfa80c20  ! 3920: FMOVRLZ	dis not found

	.word 0xb5a588e0  ! 3922: FSUBq	dis not found

T1_asi_reg_rd_144:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 3926: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_323:
	setx	0x3f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 3932: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a44960  ! 3938: FMULq	dis not found

T1_asi_reg_wr_191:
	mov	0xb, %r14
	.word 0xf4f38400  ! 3940: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 1)
	.word 0xbcade057  ! 3943: ANDNcc_I	andncc 	%r23, 0x0057, %r30
	.word 0xb0348000  ! 3944: SUBC_R	orn 	%r18, %r0, %r24
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfaac820  ! 3947: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 3950: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_324:
	setx	0x3d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_193:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3956: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 15)
	.word 0xb73dc000  ! 3959: SRA_R	sra 	%r23, %r0, %r27
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 22)
	.word 0xbb3d6001  ! 3963: SRA_I	sra 	%r21, 0x0001, %r29
cpu_intr_1_325:
	setx	0x3e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54840  ! 3965: FADDd	faddd	%f52, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80820  ! 3972: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_326:
	setx	0x3c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_194:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 3974: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_327:
	setx	0x3f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 3978: FMOVs	fmovs	%f0, %f27
cpu_intr_1_328:
	setx	0x3e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994219b  ! 3981: WRPR_TICK_I	wrpr	%r16, 0x019b, %tick
cpu_intr_1_329:
	setx	0x3e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58820  ! 3987: FADDs	fadds	%f22, %f0, %f31
	.word 0xb5641800  ! 3988: MOVcc_R	<illegal instruction>
	.word 0xbfa50840  ! 3989: FADDd	faddd	%f20, %f0, %f62
cpu_intr_1_330:
	setx	0x3e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_195:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 3993: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb73c8000  ! 3995: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb9a50840  ! 3998: FADDd	faddd	%f20, %f0, %f28
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a81420  ! 4000: FMOVRNZ	dis not found

	.word 0xb7a588e0  ! 4002: FSUBq	dis not found

T1_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 4003: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb12cd000  ! 4007: SLLX_R	sllx	%r19, %r0, %r24
cpu_intr_1_331:
	setx	0x3c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_332:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4025: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_333:
	setx	0x3c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_334:
	setx	0x3c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d0000  ! 4035: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xbba00520  ! 4036: FSQRTs	fsqrt	
cpu_intr_1_335:
	setx	0x3e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508a0  ! 4040: FSUBs	fsubs	%f20, %f0, %f27
T1_asi_reg_rd_147:
	mov	0x11, %r14
	.word 0xf8db8400  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_336:
	setx	0x3e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 4048: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a448c0  ! 4055: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb5a5c960  ! 4056: FMULq	dis not found

cpu_intr_1_337:
	setx	0x3c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409e0  ! 4058: FDIVq	dis not found

	.word 0x83946117  ! 4066: WRPR_TNPC_I	wrpr	%r17, 0x0117, %tnpc
T1_asi_reg_wr_197:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 4067: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 4072: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 4075: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbaac820  ! 4080: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_338:
	setx	0x3e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_200:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 4082: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda548a0  ! 4083: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbba88820  ! 4084: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_148:
	mov	0x11, %r14
	.word 0xf0db8e60  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a549e0  ! 4092: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81820  ! 4099: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_339:
	setx	0x3c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53ce001  ! 4103: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xb9a90820  ! 4107: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 4109: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_149:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 4111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfa408e0  ! 4112: FSUBq	dis not found

cpu_intr_1_340:
	setx	0x3e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_150:
	mov	0x1f, %r14
	.word 0xf0db84a0  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_341:
	setx	0x3d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_151:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 4120: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a409e0  ! 4122: FDIVq	dis not found

T1_asi_reg_rd_152:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5abc820  ! 4126: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa90820  ! 4127: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_342:
	setx	0x3d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x3c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_344:
	setx	0x3d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 4136: FSQRTs	fsqrt	
T1_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_154:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 4139: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbb35e001  ! 4141: SRL_I	srl 	%r23, 0x0001, %r29
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 26)
	.word 0xbf7ce401  ! 4146: MOVR_I	movre	%r19, 0x1, %r31
	.word 0xbfa50840  ! 4149: FADDd	faddd	%f20, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a5c860  ! 4155: FADDq	dis not found

	.word 0xb7a00560  ! 4157: FSQRTq	fsqrt	
cpu_intr_1_345:
	setx	0x40032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_202:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4160: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7a84820  ! 4163: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_346:
	setx	0x43032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_347:
	setx	0x400215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_155:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 4176: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_348:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a58920  ! 4179: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbba50860  ! 4182: FADDq	dis not found

cpu_intr_1_349:
	setx	0x420101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bdc000  ! 4186: XNORcc_R	xnorcc 	%r23, %r0, %r27
cpu_intr_1_350:
	setx	0x400110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a00540  ! 4194: FSQRTd	fsqrt	
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a448e0  ! 4200: FSUBq	dis not found

cpu_intr_1_351:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589c0  ! 4204: FDIVd	fdivd	%f22, %f0, %f56
cpu_intr_1_352:
	setx	0x400137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4206: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80820  ! 4212: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_203:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 4214: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb9a81c20  ! 4216: FMOVRGEZ	dis not found

T1_asi_reg_rd_156:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbba00020  ! 4220: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_204:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 4221: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_353:
	setx	0x410213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc250000  ! 4226: SUB_R	sub 	%r20, %r0, %r30
	.word 0xb5a00540  ! 4227: FSQRTd	fsqrt	
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa81c20  ! 4235: FMOVRGEZ	dis not found

	.word 0xb5a94820  ! 4237: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3aa8820  ! 4238: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbcad8000  ! 4239: ANDNcc_R	andncc 	%r22, %r0, %r30
cpu_intr_1_354:
	setx	0x430036, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_157:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_205:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 4260: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa00040  ! 4261: FMOVd	fmovd	%f0, %f62
	.word 0xb7a4c9e0  ! 4262: FDIVq	dis not found

iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 16)
	.word 0xbd3c7001  ! 4265: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xb7a508a0  ! 4269: FSUBs	fsubs	%f20, %f0, %f27
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a5c820  ! 4272: FADDs	fadds	%f23, %f0, %f26
	.word 0xb1a98820  ! 4277: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_158:
	mov	0x36, %r14
	.word 0xfadb8400  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_159:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_206:
	mov	0x19, %r14
	.word 0xf0f38e80  ! 4282: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb8b4e12c  ! 4283: SUBCcc_I	orncc 	%r19, 0x012c, %r28
	.word 0xb5a4c840  ! 4285: FADDd	faddd	%f50, %f0, %f26
	.word 0xb9a80c20  ! 4286: FMOVRLZ	dis not found

T1_asi_reg_rd_160:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbe34208d  ! 4288: SUBC_I	orn 	%r16, 0x008d, %r31
T1_asi_reg_rd_161:
	mov	0x17, %r14
	.word 0xf4db8e80  ! 4289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_207:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 4290: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_208:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 4291: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7a94820  ! 4292: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a9c820  ! 4294: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a5c8c0  ! 4295: FSUBd	fsubd	%f54, %f0, %f26
cpu_intr_1_355:
	setx	0x43011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8050000  ! 4300: ADD_R	add 	%r20, %r0, %r28
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 17)
	.word 0xbdab8820  ! 4303: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_356:
	setx	0x420130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4309: FMOVCC	fmovs	%fcc1, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_209:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 4313: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_357:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54960  ! 4317: FMULq	dis not found

T1_asi_reg_wr_210:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 4318: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_358:
	setx	0x400315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2240000  ! 4323: SUB_R	sub 	%r16, %r0, %r25
	.word 0xbda88820  ! 4325: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_359:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_162:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_360:
	setx	0x420213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 4338: FMOVA	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00540  ! 4345: FSQRTd	fsqrt	
cpu_intr_1_361:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba548c0  ! 4348: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xb1a00560  ! 4350: FSQRTq	fsqrt	
	.word 0xbaa56004  ! 4351: SUBcc_I	subcc 	%r21, 0x0004, %r29
T1_asi_reg_wr_211:
	mov	0x4, %r14
	.word 0xfef38e40  ! 4352: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9aa8820  ! 4353: FMOVG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a00540  ! 4360: FSQRTd	fsqrt	
	.word 0xba3de130  ! 4361: XNOR_I	xnor 	%r23, 0x0130, %r29
	.word 0x81946144  ! 4363: WRPR_TPC_I	wrpr	%r17, 0x0144, %tpc
T1_asi_reg_wr_212:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 4365: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9ab8820  ! 4367: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_362:
	setx	0x30138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_363:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488e0  ! 4373: FSUBq	dis not found

iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 26)
	.word 0xbc24c000  ! 4377: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb1ab4820  ! 4378: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbba98820  ! 4384: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbda58940  ! 4385: FMULd	fmuld	%f22, %f0, %f30
	.word 0xbda48920  ! 4386: FMULs	fmuls	%f18, %f0, %f30
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7a00520  ! 4390: FSQRTs	fsqrt	
	.word 0xb7ab8820  ! 4391: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_213:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4392: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_214:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 4398: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a80420  ! 4404: FMOVRZ	dis not found

iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_163:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa508e0  ! 4417: FSUBq	dis not found

	.word 0xb1a58840  ! 4425: FADDd	faddd	%f22, %f0, %f24
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 16)
	.word 0xb2b48000  ! 4432: ORNcc_R	orncc 	%r18, %r0, %r25
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_364:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7351000  ! 4437: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xb9aac820  ! 4438: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbe95a0af  ! 4439: ORcc_I	orcc 	%r22, 0x00af, %r31
	.word 0xb7a80820  ! 4445: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbda549e0  ! 4451: FDIVq	dis not found

iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a48940  ! 4462: FMULd	fmuld	%f18, %f0, %f26
T1_asi_reg_wr_215:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 4463: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_365:
	setx	0x41001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_366:
	setx	0x430323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ac0000  ! 4471: ANDNcc_R	andncc 	%r16, %r0, %r24
cpu_intr_1_367:
	setx	0x42003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5a84820  ! 4478: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda4c8e0  ! 4481: FSUBq	dis not found

T1_asi_reg_wr_216:
	mov	0x8, %r14
	.word 0xf4f38e80  ! 4484: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a54960  ! 4487: FMULq	dis not found

	.word 0xb40c4000  ! 4488: AND_R	and 	%r17, %r0, %r26
	.word 0xb7a44840  ! 4489: FADDd	faddd	%f48, %f0, %f58
	.word 0xbba448e0  ! 4493: FSUBq	dis not found

T1_asi_reg_rd_164:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_217:
	mov	0xc, %r14
	.word 0xf4f38400  ! 4508: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_368:
	setx	0x410222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225601b  ! 4510: SUB_I	sub 	%r21, 0x001b, %r25
cpu_intr_1_369:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 4517: RDPR_TSTATE	<illegal instruction>
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_370:
	setx	0x420130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4522: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 4523: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_371:
	setx	0x430003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9521ca  ! 4527: ORcc_I	orcc 	%r20, 0x01ca, %r30
	.word 0xbfa489c0  ! 4528: FDIVd	fdivd	%f18, %f0, %f62
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_165:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 4531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbc04c000  ! 4533: ADD_R	add 	%r19, %r0, %r30
cpu_intr_1_372:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_373:
	setx	0x410019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a508c0  ! 4538: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb9a80820  ! 4542: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_374:
	setx	0x430106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_375:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 4548: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a5c8c0  ! 4549: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xbda00520  ! 4550: FSQRTs	fsqrt	
	.word 0xb435e1ca  ! 4551: ORN_I	orn 	%r23, 0x01ca, %r26
T1_asi_reg_rd_166:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda449a0  ! 4557: FDIVs	fdivs	%f17, %f0, %f30
T1_asi_reg_rd_167:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_218:
	mov	0x13, %r14
	.word 0xf2f38400  ! 4567: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xba8c8000  ! 4571: ANDcc_R	andcc 	%r18, %r0, %r29
cpu_intr_1_376:
	setx	0x430306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_377:
	setx	0x420336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_378:
	setx	0x420109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508a0  ! 4580: FSUBs	fsubs	%f20, %f0, %f31
cpu_intr_1_379:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_380:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_381:
	setx	0x400018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c9e0  ! 4592: FDIVq	dis not found

	.word 0xb1a80820  ! 4593: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_382:
	setx	0x410029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_219:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 4601: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7a40860  ! 4602: FADDq	dis not found

iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_220:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 4605: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9ab0820  ! 4607: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb2144000  ! 4609: OR_R	or 	%r17, %r0, %r25
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_383:
	setx	0x45002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ace073  ! 4616: ANDNcc_I	andncc 	%r19, 0x0073, %r27
	.word 0xb1a00040  ! 4617: FMOVd	fmovd	%f0, %f24
cpu_intr_1_384:
	setx	0x45013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_385:
	setx	0x440022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb6950000  ! 4626: ORcc_R	orcc 	%r20, %r0, %r27
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_221:
	mov	0x13, %r14
	.word 0xfaf38e60  ! 4628: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_386:
	setx	0x470135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 1)
	.word 0xb92cf001  ! 4636: SLLX_I	sllx	%r19, 0x0001, %r28
cpu_intr_1_387:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 4638: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa4820  ! 4639: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_168:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 4641: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_222:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 4646: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_388:
	setx	0x44022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_169:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 4650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_389:
	setx	0x460003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a509c0  ! 4654: FDIVd	fdivd	%f20, %f0, %f58
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_390:
	setx	0x10005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_170:
	mov	0x0, %r14
	.word 0xf8db8400  ! 4665: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a98820  ! 4670: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb284e125  ! 4671: ADDcc_I	addcc 	%r19, 0x0125, %r25
	.word 0xbba48940  ! 4674: FMULd	fmuld	%f18, %f0, %f60
cpu_intr_1_391:
	setx	0x46011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_392:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4679: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab4820  ! 4680: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00540  ! 4681: FSQRTd	fsqrt	
T1_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_393:
	setx	0x470109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_394:
	setx	0x460005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a548a0  ! 4692: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb7a94820  ! 4693: FMOVCS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_223:
	mov	0x19, %r14
	.word 0xf6f38400  ! 4695: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a81c20  ! 4697: FMOVRGEZ	dis not found

	.word 0xbfa44920  ! 4699: FMULs	fmuls	%f17, %f0, %f31
cpu_intr_1_395:
	setx	0x470217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_396:
	setx	0x470115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d7001  ! 4704: SRAX_I	srax	%r21, 0x0001, %r26
	.word 0xb5a94820  ! 4705: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a4c8e0  ! 4708: FSUBq	dis not found

	.word 0xb1a81420  ! 4714: FMOVRNZ	dis not found

	.word 0xb3a449a0  ! 4719: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb1a98820  ! 4720: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a50860  ! 4724: FADDq	dis not found

T1_asi_reg_wr_224:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 4728: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_397:
	setx	0x470232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_172:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00520  ! 4732: FSQRTs	fsqrt	
	.word 0xbfaa4820  ! 4733: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00520  ! 4734: FSQRTs	fsqrt	
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_225:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 4736: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbda94820  ! 4738: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_226:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 4744: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_227:
	mov	0x33, %r14
	.word 0xfef38e80  ! 4745: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5a589c0  ! 4754: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xbfa80420  ! 4756: FMOVRZ	dis not found

cpu_intr_1_398:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_173:
	mov	0x29, %r14
	.word 0xf0db8400  ! 4759: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_399:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_228:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4762: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a408c0  ! 4765: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb3a4c840  ! 4766: FADDd	faddd	%f50, %f0, %f56
T1_asi_reg_wr_229:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 4767: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_400:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_230:
	mov	0x25, %r14
	.word 0xfef38e40  ! 4769: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a48960  ! 4776: FMULq	dis not found

cpu_intr_1_401:
	setx	0x460208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4779: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_402:
	setx	0x46021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a5c820  ! 4785: FADDs	fadds	%f23, %f0, %f26
	.word 0xb5aac820  ! 4787: FMOVGE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a90820  ! 4791: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a54840  ! 4794: FADDd	faddd	%f52, %f0, %f58
cpu_intr_1_403:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4802: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_231:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 4803: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1a00540  ! 4806: FSQRTd	fsqrt	
cpu_intr_1_404:
	setx	0x46023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_405:
	setx	0x450002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4813: FSQRTs	fsqrt	
	.word 0xbfa00560  ! 4816: FSQRTq	fsqrt	
cpu_intr_1_406:
	setx	0x460329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_174:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5a00040  ! 4825: FMOVd	fmovd	%f0, %f26
	.word 0xbba81420  ! 4828: FMOVRNZ	dis not found

T1_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_232:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 4834: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a80420  ! 4836: FMOVRZ	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a00560  ! 4842: FSQRTq	fsqrt	
cpu_intr_1_407:
	setx	0x440236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 4848: FADDd	faddd	%f50, %f0, %f62
T1_asi_reg_rd_176:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_408:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 31)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbfa44820  ! 4856: FADDs	fadds	%f17, %f0, %f31
	.word 0xbda50820  ! 4858: FADDs	fadds	%f20, %f0, %f30
	.word 0xbfa44920  ! 4859: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbf3d7001  ! 4862: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xbba448c0  ! 4865: FSUBd	fsubd	%f48, %f0, %f60
T1_asi_reg_rd_177:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5a00020  ! 4869: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_178:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_wr_233:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 4872: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb6ace115  ! 4873: ANDNcc_I	andncc 	%r19, 0x0115, %r27
	.word 0xbfa40960  ! 4875: FMULq	dis not found

cpu_intr_1_409:
	setx	0x45003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1da03f  ! 4882: XOR_I	xor 	%r22, 0x003f, %r30
	.word 0xb3510000  ! 4883: RDPR_TICK	<illegal instruction>
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_410:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a80c20  ! 4895: FMOVRLZ	dis not found

	.word 0xb84421e5  ! 4901: ADDC_I	addc 	%r16, 0x01e5, %r28
T1_asi_reg_rd_179:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3a80820  ! 4904: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2b521aa  ! 4914: SUBCcc_I	orncc 	%r20, 0x01aa, %r25
T1_asi_reg_wr_234:
	mov	0x23, %r14
	.word 0xfaf384a0  ! 4919: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 24)
	.word 0xbd518000  ! 4922: RDPR_PSTATE	<illegal instruction>
	.word 0xbbab8820  ! 4923: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_180:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 4924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_411:
	setx	0x460216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 4929: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda58860  ! 4931: FADDq	dis not found

iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_181:
	mov	0x20, %r14
	.word 0xf6db89e0  ! 4935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb1a00560  ! 4936: FSQRTq	fsqrt	
T1_asi_reg_rd_182:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 4940: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfaa4820  ! 4946: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a509a0  ! 4947: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xb1a88820  ! 4953: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba549c0  ! 4954: FDIVd	fdivd	%f52, %f0, %f60
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_235:
	mov	0x4, %r14
	.word 0xfaf38400  ! 4962: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_412:
	setx	0x47021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b50000  ! 4966: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xbda80820  ! 4967: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a58860  ! 4975: FADDq	dis not found

	.word 0xb1a509e0  ! 4976: FDIVq	dis not found

	.word 0xb3a80820  ! 4977: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba8c820  ! 4979: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a589c0  ! 4984: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xbfa489c0  ! 4990: FDIVd	fdivd	%f18, %f0, %f62
cpu_intr_1_413:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_236:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 4995: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa84820  ! 4997: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_183:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30

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

	.xword	0xbccfff0f62d2057f
	.xword	0x78328ef513412995
	.xword	0xeea4742b1aa34247
	.xword	0xc8d6dc3d09fe6a84
	.xword	0x679c8c58814bf76c
	.xword	0xb029d3659f9cf33d
	.xword	0x7fa48821769f4215
	.xword	0x8b025c2ea7f4cdfe
	.xword	0x595befda07f0a02f
	.xword	0xd5116a085ff81557
	.xword	0xa45af2a78e81f1d1
	.xword	0x2e335c7a5da83009
	.xword	0xa6d3a638d136f063
	.xword	0xfa579e9f8a1bbcd8
	.xword	0x7c342fabaa3fc0e1
	.xword	0xb863dec07506dd71
	.xword	0xaf2092d5112a80fc
	.xword	0x67795d876da8e7e3
	.xword	0x4ca87081685db89d
	.xword	0x6b376c89842ca488
	.xword	0xe774a171af256e9a
	.xword	0xf9781338db178476
	.xword	0x591392fdce49b422
	.xword	0xeecca35398a69fb1
	.xword	0xcd506fc7f4bbd748
	.xword	0xa13cd58e64af51a0
	.xword	0xa8cf76a4e2846492
	.xword	0x74001efb834a4cbd
	.xword	0x8685e0c8ef91a254
	.xword	0xc8149c60fc905a38
	.xword	0xae8c83b41783799c
	.xword	0x1494b37c4453aa10
	.xword	0xab0d560b19a54b32
	.xword	0x418312914acfaf54
	.xword	0x3c8f4a8f777c7221
	.xword	0xfc7b7f68f817c024
	.xword	0xe023b87f8e8a2d1a
	.xword	0xae2cdaf95ef48b34
	.xword	0x95c9f525af16c3bc
	.xword	0xa43f3ca8c3935350
	.xword	0xdc2b7c2d4afade09
	.xword	0x4748083f26209c0d
	.xword	0x9743148c37732115
	.xword	0x20842a1585683e6a
	.xword	0xa5342f7fe7a663ca
	.xword	0x5184867a56a5a020
	.xword	0xda1b1851eeecb957
	.xword	0x8a414c7acbe08fa4
	.xword	0xd3136907dbf54127
	.xword	0xff0f93455df59e59
	.xword	0xdf039648265aa194
	.xword	0xd99d9324ed877c0f
	.xword	0xfc8002dc278f66da
	.xword	0x557270d46da2f017
	.xword	0xe2871380a577390c
	.xword	0x44dfaf726a1f1109
	.xword	0x105049e80d47b878
	.xword	0x1e37a29e3509774f
	.xword	0x365092c7afb05589
	.xword	0xf5b326310da71823
	.xword	0x4cab7be2974a9949
	.xword	0x5c1cc45bfb3ed9ae
	.xword	0xf5c463d28c0f4dda
	.xword	0xfb9a06c200c0015a
	.xword	0xcac4d59e0b9f1736
	.xword	0xd470d72348f3fb39
	.xword	0x4b15a7e6058e9ad2
	.xword	0x9c0909f246deb731
	.xword	0x177832e563ca11b7
	.xword	0x8f0e64a798df9834
	.xword	0x07adb0fcc869a51f
	.xword	0x94d67d80d5206cee
	.xword	0xd30e52a5b63a5e62
	.xword	0x939ae6ae3c0c6bbd
	.xword	0xc40aadcbdba4c18f
	.xword	0xe3356f50a8daa115
	.xword	0x09883ee870ad1cd0
	.xword	0x6d09e53e09cb06cc
	.xword	0x9fe82810cf735d1a
	.xword	0x2be997c42f67acc2
	.xword	0xefda6b7c1ae70639
	.xword	0x36edfb414d8c2428
	.xword	0x908928461c169da1
	.xword	0xc1f346c35ae0df49
	.xword	0xa5149c010023b468
	.xword	0xf7ced593e1e52222
	.xword	0xad8f9ea4588c1b85
	.xword	0x79ba52b6136923dc
	.xword	0xee321cd5533e1e94
	.xword	0xd09646ea784429ec
	.xword	0x0f7cbb37c2563c5b
	.xword	0xa4de6ea9b14a590a
	.xword	0x357d3adf235b6602
	.xword	0x6136a6a45991a9e8
	.xword	0x896bf427b41ea97f
	.xword	0xa1d611a07dd85cf1
	.xword	0xec8b5ac5d904cb83
	.xword	0xfccc547a25c40b88
	.xword	0xc25392a8ebe4d279
	.xword	0xf3b51ca4758024c7
	.xword	0xa0f4b2f25cb3d58a
	.xword	0x3e7431e44cdcdce0
	.xword	0x9bb324b9e3ccc1ba
	.xword	0x02f0fe28975c4bf1
	.xword	0xd51e67ec859cd115
	.xword	0xaa491ac87ecbce36
	.xword	0xb4a19b6ac39d8345
	.xword	0x10c2ea601abaf4b2
	.xword	0x90b827160bb962fb
	.xword	0x65fbe36630ad3b51
	.xword	0x92ae4b094c7ad745
	.xword	0x528dd20a37eaa9e7
	.xword	0xe8f9f39ed01100b4
	.xword	0x346e65a372241ff7
	.xword	0x1a688f53005123b0
	.xword	0x895e2037cc5a2a63
	.xword	0xa4cb2318341eb7fd
	.xword	0xa137750831ebc3b6
	.xword	0xf38ca05e5df09e7a
	.xword	0x53cb51a4b3430588
	.xword	0xdec9bc7ae5f0546d
	.xword	0x912047812f024425
	.xword	0x3774e25f00667504
	.xword	0xc0ef761a3391fbb5
	.xword	0x809fb77a072c454c
	.xword	0x3730a099d570b047
	.xword	0x3555dacb39510479
	.xword	0xcc4c77452fc63c29
	.xword	0x2469f74c51c59348
	.xword	0x55b2a78981eb71d6
	.xword	0xb16a879b9550cb4c
	.xword	0xd3ec005685d86ec9
	.xword	0x08b539cc36d1f9c2
	.xword	0xd3f24e0698384551
	.xword	0xf102b0c4ed60420d
	.xword	0xb39ce0976a94fee4
	.xword	0xcd07c8ed840befad
	.xword	0x900dee7c8c2b1ca6
	.xword	0x15bd52b3d7b02c55
	.xword	0xfb58280621cda90d
	.xword	0x339be06f61420813
	.xword	0x2d0761a63600524e
	.xword	0x4b229fea43e5a509
	.xword	0xf0344f502dd2ee60
	.xword	0xcdd3868295f68c01
	.xword	0xe5e757412fd26363
	.xword	0xbf167c8acc469c4f
	.xword	0x9f46a20d4b84fa10
	.xword	0x3e3246584ec61b6d
	.xword	0x0ee7bbe7cfcf948b
	.xword	0x9dfb0b96d0c6d365
	.xword	0x9a89bfb4527cc29d
	.xword	0xc50fb5bcfa186a2c
	.xword	0x50ef2c311430f779
	.xword	0x78015227a6979733
	.xword	0x42fb1a3335b6a6ee
	.xword	0xf23faeb6a4b8417e
	.xword	0xc855c7f370cf2456
	.xword	0xb1441f9a6f2ade80
	.xword	0x678ccd6003e740fa
	.xword	0x0e844ddba8cd3a41
	.xword	0xd48d17d36bbfb3e6
	.xword	0x23f6f0edc5126eb2
	.xword	0x4673fb5a81a76d14
	.xword	0x9e3f7abb4d110f1d
	.xword	0x1430615027e36ba5
	.xword	0x3f894a53006dace7
	.xword	0x63263448250da9ea
	.xword	0x2302c84c4af86709
	.xword	0x15ad14c6a10102f8
	.xword	0x0eee97aa9f7e2d68
	.xword	0xad9ea4aa1cce9479
	.xword	0xbb5302095114473d
	.xword	0x9483262166b077de
	.xword	0x1730ad432337b799
	.xword	0xc478cb975d9b2d0a
	.xword	0x5cb754ff4b1d3231
	.xword	0xa872500db21e3468
	.xword	0x300f7fd40eba5ff8
	.xword	0xd91e4e301fc87e8c
	.xword	0x1a8d0233a4c1afa6
	.xword	0xee8ea9b994277325
	.xword	0xe3766a4b8ad6035b
	.xword	0x2ad33eee19fbebb4
	.xword	0x24375d8d62419f77
	.xword	0xd336945d27727a5c
	.xword	0xd9d0227c7ad7e9f6
	.xword	0x4444d9e4aed94a3d
	.xword	0xa69ef1b70d877e4c
	.xword	0xc18b1bc822b61285
	.xword	0x3c357f0d81d7e6d4
	.xword	0x702dc1724539f699
	.xword	0x26d73423104c0c57
	.xword	0xa473828c3403c547
	.xword	0x37dd4d993f50677e
	.xword	0x34cfaa51be628351
	.xword	0x201918471a5fa0d4
	.xword	0xfad31e2a139d8fba
	.xword	0x84bcc80a59ff408b
	.xword	0xae73059e0b9baa44
	.xword	0x1b17fec6bba67520
	.xword	0xfb489375ff633f4e
	.xword	0x566ca606d6cee412
	.xword	0x8412f457e83529b8
	.xword	0x13b4c57f94640804
	.xword	0x884579bf67eca446
	.xword	0xe1ef000e6fb203ea
	.xword	0x2e920a52a7fe0110
	.xword	0x281201044c58e5ee
	.xword	0x10eaba47f6393cea
	.xword	0x9f74c35877673d34
	.xword	0x5cdb2f8404de88da
	.xword	0x2bf3aa9e45d0769f
	.xword	0x4b04448035e78c52
	.xword	0x81b70bbc80ee8782
	.xword	0x2d1c08eaf58e7688
	.xword	0xf83d495b0f94d8eb
	.xword	0xd44f90b71b3922d6
	.xword	0x36ff33a3217fa4e3
	.xword	0x3fa6f9f15642b0e5
	.xword	0xa580d5b1351a595d
	.xword	0x540ea5bbf19864a0
	.xword	0xd0ca3bd6fee6f5e3
	.xword	0xbfb4ed0fa7cdb2e1
	.xword	0xfbc025a2e4da10ca
	.xword	0x6c1660ccaf732a15
	.xword	0x4538b0df6c0a89e3
	.xword	0x94279c7a7d931fcf
	.xword	0x0d6cb1371708c3f4
	.xword	0x3795f5803c26f5b9
	.xword	0xb782079eb8256737
	.xword	0x61f9e7aa59cdbc03
	.xword	0xd1fc1d722ac9886e
	.xword	0x548949122e95d597
	.xword	0xdc2c7b84a0ad2dc6
	.xword	0x387e08546b9e4602
	.xword	0x7ee481cb4c76506e
	.xword	0x2784745c7c2a6652
	.xword	0x520733b6562637b1
	.xword	0xf44c1693c785a779
	.xword	0x842fc7f779ac9135
	.xword	0x4ad7fa6b2b8d0d40
	.xword	0xf71b61a54e522071
	.xword	0x2e6fac9e02bcecfb
	.xword	0xc1aa9b6414ae2237
	.xword	0x1800d3a570c1b1e6
	.xword	0xc1169be05d61bc7b
	.xword	0x83b72f57510965a4
	.xword	0x826ac1965a001a27
	.xword	0x3d3b4b0113a26d9f
	.xword	0x6b108bf52fed6a16
	.xword	0x1df1ffa63452dc23
	.xword	0x364bd4fbb633d5b3
	.xword	0xdab313fae518db45
	.xword	0x6046e7b21961f148
	.xword	0x27aa8e1945b221c1
	.align 0x2000
	.data
data_start_1:

	.xword	0x24bc026e25c277c4
	.xword	0xd5fd87917251dc4e
	.xword	0x153b21b1cbf40ee9
	.xword	0x80c680e3ce6e2bbf
	.xword	0x58e2e1ddf8aae54f
	.xword	0xa7aa0cd9aef60411
	.xword	0xf055226a65d961f8
	.xword	0x29686ba139820e43
	.xword	0xec31bd36f392138d
	.xword	0xa1a43f524c3e90d6
	.xword	0xf1ee2bbed38e2744
	.xword	0xdc5a9df71617d6d3
	.xword	0x78e3a1b873b188bf
	.xword	0x2b108d3b1ba95a6c
	.xword	0xbf5803a51d510fe0
	.xword	0xe39f3ff9d9f9b6d8
	.xword	0xc79a1b08b175d08e
	.xword	0x28899e6cd59e5e91
	.xword	0x93aef6ef8b540671
	.xword	0xe4bcd60a37492944
	.xword	0x9bfcdf2bf0c82529
	.xword	0x3151fa71e1369442
	.xword	0x297017b62addefba
	.xword	0xffa7c06e610a0cad
	.xword	0x80b27912b26b4cc0
	.xword	0x157e8e8e55ea8497
	.xword	0x83064e6226ec4bb9
	.xword	0x862cb18f57d10386
	.xword	0xfcaa322f341fe534
	.xword	0x5d5190d8bfda8511
	.xword	0x68fbe7675f65598a
	.xword	0xdb08856a4e579727
	.xword	0x52725e649f5006fa
	.xword	0x1a253580305109c3
	.xword	0x56d625e183f3dc6c
	.xword	0xe57854a35a2a64e2
	.xword	0x4d6302e6954dc1ba
	.xword	0xf33b4ad2de4be1cd
	.xword	0xad042ce4e7eab430
	.xword	0x3d0ea056fe885af2
	.xword	0xdadc7082e496e893
	.xword	0x5e786981354252d1
	.xword	0x43ea27b748c53d63
	.xword	0xec5caacbc411f79f
	.xword	0xd5f95fe003d5b2c5
	.xword	0x2222ffc967ef2ac5
	.xword	0x9471233997a1589b
	.xword	0xffbf5b125d155b44
	.xword	0xa8a807dfb42cf4dd
	.xword	0xe9b4bfa8f8619a60
	.xword	0xc9bd3b71c98ff39f
	.xword	0x5f20bdccbf2c1a2b
	.xword	0x6400b7b671a59d06
	.xword	0xe8ffc440ef715f8e
	.xword	0x46cfc23a38b1f428
	.xword	0xb0f0b2a16a280e12
	.xword	0xcfaacffd08e46687
	.xword	0x382dac1d5aa0d8ce
	.xword	0xf19b036016e56e52
	.xword	0x192b6db9a58623bd
	.xword	0xa81555aaefd3906c
	.xword	0x6d9ba404ccd990c5
	.xword	0x4cadf07dcea0b1af
	.xword	0xc1ed2ccce7bc4873
	.xword	0x49461d22ab49b3fe
	.xword	0xa353ffa3a43427fa
	.xword	0x3addf2f97b5960b6
	.xword	0x94c04ba5332cb1af
	.xword	0x24fb2af5cdec19ad
	.xword	0xaa6adf6df7606d33
	.xword	0x15bebebf91b17e50
	.xword	0xa23b1ada0e84f4c6
	.xword	0xab8b3e35f0094e75
	.xword	0x7b5e328251c3f7e5
	.xword	0x13aeecabb741cab0
	.xword	0xa879f91a21603d6e
	.xword	0x6a2f1f2c5963ff27
	.xword	0xa54e19f9c90450cb
	.xword	0xc6de98bea4644654
	.xword	0x0c37958de2fee681
	.xword	0xc23a7a34e38d5291
	.xword	0xbb568a38cb0daf9c
	.xword	0x101c648656416199
	.xword	0x5b25d6b6f557f085
	.xword	0xbd6f1626ac5c2e3d
	.xword	0xa191ff4984418d27
	.xword	0x2becd6834236dbbd
	.xword	0x79aa90207831d18c
	.xword	0x3c06541088d351ff
	.xword	0xb960c67a8b1ef624
	.xword	0x3a996d1c25306ba7
	.xword	0x36be83d7286b1ffc
	.xword	0xaddbed0c941ed77e
	.xword	0xf26136b778b4ef0f
	.xword	0xca083d5983258023
	.xword	0xb93aaea1abe04f25
	.xword	0x3d7c2696e608f667
	.xword	0xd13e09cc96f64f8e
	.xword	0x2aa6f9de26f18f79
	.xword	0x6282b4d3618421cb
	.xword	0xdb1ef00e684a03b3
	.xword	0xa3370a1f60566af5
	.xword	0x8956d66945c6b4a5
	.xword	0x8de8daabbe69a3c9
	.xword	0x9d6d3a3a33b8d629
	.xword	0x6c026b6eda576a2e
	.xword	0xff6522b22ad4945e
	.xword	0xe3710726b80c8665
	.xword	0x40365def46f2f72c
	.xword	0x895572dc3bcead90
	.xword	0x0ac9c710d1d8bc52
	.xword	0x10596c5ab9735367
	.xword	0x16e3806b6e218ed4
	.xword	0xb4d168a379d722b4
	.xword	0x68d0cf4460c23bc2
	.xword	0x8c6bf34615f05d13
	.xword	0x18a5d5dd60a89938
	.xword	0xbd8c6f15377529f5
	.xword	0xf5803e983da392ae
	.xword	0x054c322a48a7c572
	.xword	0x994fbff753eca1bf
	.xword	0x15c4a7c8ed9ff9b4
	.xword	0xd7d797bcf4b2cfee
	.xword	0xaf535e1b356b99a9
	.xword	0x29481da3b41d8fca
	.xword	0x43aa6556673b3b9d
	.xword	0xc6ac7d7185d5d603
	.xword	0x179993a97bc454c5
	.xword	0x0c7641423d974e47
	.xword	0x03bd77c3712c75a3
	.xword	0x902d179f6aa5dca8
	.xword	0xc99284de7b1ccd03
	.xword	0xd827bb8bac5a67e3
	.xword	0x36d8db4a6d9b186c
	.xword	0xe2a0dc110eca3c95
	.xword	0xb5d2a9763324de72
	.xword	0xd806de292322da51
	.xword	0xd9f6071a895fbb45
	.xword	0x223984a8afe152c3
	.xword	0x8e2fec3c618e199d
	.xword	0x823fc90ac71ec996
	.xword	0x982feeeee6ad5dd6
	.xword	0x206fa345be7fb503
	.xword	0x27566d65c25b4758
	.xword	0x5ca91a3f03879e9b
	.xword	0x0e8f832f733f2420
	.xword	0x3dd0963c735a73b2
	.xword	0xa54965b95171eb60
	.xword	0x3d8e365d0e1dc31b
	.xword	0x7c5699f64570c833
	.xword	0x5141778c097bcf04
	.xword	0x70f51bf1db55b308
	.xword	0x9f00ca4f91d6ac7e
	.xword	0x251fd5d0d9447db3
	.xword	0x4de43bf4002ae43e
	.xword	0x709262e6961a4160
	.xword	0x540e74521c5940f9
	.xword	0x37bd68432e06584c
	.xword	0x486c296fc75c0771
	.xword	0xf090b034bf240824
	.xword	0x028e847ac45fc9cf
	.xword	0x2c645d89c58a7620
	.xword	0x036d6d18eaeeb027
	.xword	0x1b20e605c20a468b
	.xword	0x05ce564d7439dadc
	.xword	0x284994f53d1518b6
	.xword	0xc9dcc3fb4218affd
	.xword	0xca5a27672020020e
	.xword	0x23ab5dff992b8a83
	.xword	0x2369445c6b47d840
	.xword	0x75279ac6cb6fb3e0
	.xword	0xafbe963501d06f3b
	.xword	0xd669adbe8db7475c
	.xword	0x5549c2bd1dd8f1a5
	.xword	0x2a1a0537e1d9f4fd
	.xword	0xbf6688b288655ecb
	.xword	0x57ffb07419e7fd04
	.xword	0x1599e08600b3b756
	.xword	0xc1bc60c98fa36c4d
	.xword	0x0cb304f908de0335
	.xword	0x0e804d78786117e2
	.xword	0xa3e08b9d76c5d0f3
	.xword	0x8b1c2e4ba49fe08b
	.xword	0xf911fd134b9efbc6
	.xword	0xcc5813539ad825c5
	.xword	0x103a2ed9c574c13e
	.xword	0x07142a8b7f1c6b03
	.xword	0x011c81c65bed3510
	.xword	0x0ea7c01bf2cbfda4
	.xword	0xc807bd83a2136218
	.xword	0xee52a6e9614507fb
	.xword	0x2600ad36d63b464b
	.xword	0x7eef1bbfc529eb86
	.xword	0x709fb17d67799e62
	.xword	0x8bfc6dabe54c3e67
	.xword	0x4947acf15779a08a
	.xword	0x8b04bcd9a9f7ea6a
	.xword	0xb308ef8f2bd95478
	.xword	0x10c3af18a3ad039c
	.xword	0x435e6d5d0d50a6e1
	.xword	0xec3ad7a85d35b756
	.xword	0x970b39efd99916a9
	.xword	0x733de68fccfe4453
	.xword	0xff8047a4b86489eb
	.xword	0x3948fdcd1d2728de
	.xword	0x70632f5e6cc8a254
	.xword	0xf806edd8c96c7860
	.xword	0x22d4c598e1847b0d
	.xword	0xd1a02f4cf1075cad
	.xword	0x3b69a9dee5bc9898
	.xword	0x1a5acc5451778ba1
	.xword	0x20782c0634ae8289
	.xword	0xc75b445d37d15922
	.xword	0x526133d412ff6f50
	.xword	0xcc0e29bec337b740
	.xword	0x16ee862ef10c964a
	.xword	0xbf7a042d1be28d43
	.xword	0xf08dfdf4834e0ebf
	.xword	0xc8c0d1f67e8b2bb6
	.xword	0xf96f2b27ef4eb1b5
	.xword	0x0d1dfad6cb3c1d9e
	.xword	0x3c4a05eb581dc705
	.xword	0x0eba5afb34ae0f9c
	.xword	0x36bf6387804e884c
	.xword	0xa4ad6743ab1069d2
	.xword	0x18c784184c497720
	.xword	0x0d6ffe1d68177cfb
	.xword	0x4ee0777c15d6df54
	.xword	0x7a9caca2f06f1456
	.xword	0x1f71089efc3d6062
	.xword	0xd8b43c5a7a0587bb
	.xword	0xbd548a32b735a129
	.xword	0x50be7c120296234a
	.xword	0x88d8da416e919e33
	.xword	0x1e067180390b55e1
	.xword	0x33f1a976ebd7661b
	.xword	0xf02761e62b166cc7
	.xword	0xf88ff83b22522ea0
	.xword	0x1ffa17d9b22569d8
	.xword	0x2fb543fd5496609f
	.xword	0x50e74348dd895d9f
	.xword	0x5d3c0b9524186792
	.xword	0x33fb7cbacddfc264
	.xword	0xc52e07458ce297a7
	.xword	0x314d05b2447e43ad
	.xword	0xd4050f5b426dab4e
	.xword	0x01f040eaccc4f5ae
	.xword	0xeb0d7cbfbf773fed
	.xword	0x89e72250c1f01b6b
	.xword	0x2d08c8b1440474e8
	.xword	0xc624d721cbdc3536
	.xword	0x6bb222baebebf8f7
	.xword	0xb8c459e8b680f1d1
	.xword	0xb28cbf845ecaf17e
	.xword	0xfcd0ed72c5e9dc2d
	.xword	0x79279175bb687c9b
	.align 0x4000
	.data
data_start_2:

	.xword	0xf30d0ebf918026a4
	.xword	0x38a6808e088e3330
	.xword	0x83bb60a5b4145451
	.xword	0xce0eeaa9f5027992
	.xword	0x51c3f8bd64c79463
	.xword	0xc5783e73c071424d
	.xword	0xc27fabc27a9e7949
	.xword	0x91b511ea8db2c68c
	.xword	0x51aed46c9db50864
	.xword	0x5e226dd1139cf40a
	.xword	0x72c0c9386cec575b
	.xword	0x40080e7578335a09
	.xword	0x68f1c2c741b3e4ca
	.xword	0x061738522d058902
	.xword	0x22b902bba875619e
	.xword	0xf44efe8086a966cc
	.xword	0x87ce9c8f70af804f
	.xword	0x6f33e6e7a80de053
	.xword	0x83d1538bb916fa44
	.xword	0x21507c8fb4feed02
	.xword	0x01403321a1c66ca3
	.xword	0x6f580ada80e3116f
	.xword	0x884046eefd35fcb5
	.xword	0x6b3a5dbeab5b31ed
	.xword	0x18e9495d7af9fac0
	.xword	0xf2c869be1aa1b55b
	.xword	0xe181b730f20fa25d
	.xword	0x1c0081cddd199275
	.xword	0x21fecdc31395c9d2
	.xword	0xaf757991dd033457
	.xword	0xdefdc2875bac2ee7
	.xword	0x0f071e7e7f37269d
	.xword	0xb3257d61426598f0
	.xword	0x63f05d6c6bb2c102
	.xword	0x012f7c4ba21eeaf5
	.xword	0x6ca3cc11bcadff93
	.xword	0x0d899cd5c0d192e2
	.xword	0xf955390a229cdaed
	.xword	0xf5f9e0d50ad5851e
	.xword	0x2c97f8049887c5d3
	.xword	0x5e2ccfb7fdc48dd3
	.xword	0xe81fd015746199fc
	.xword	0x067cd8f1c3d1298c
	.xword	0xac5fcfd2614ff925
	.xword	0x30655fc8b47218d3
	.xword	0xf1b999dabeda3192
	.xword	0xdbb584d6e8de0ee7
	.xword	0x52b8573e115d7fb0
	.xword	0x4b94d5ae75bf054f
	.xword	0xba3dc83a2d6c0af5
	.xword	0x34a4353fc1308f19
	.xword	0xc4f103dbfde53c3f
	.xword	0x3f3a1678ad3f18fb
	.xword	0x40cbf84ecef27ce6
	.xword	0x57e7ae0ea49e35cb
	.xword	0xdff021b85dd49f28
	.xword	0xff98357b559e5471
	.xword	0xeeddcbc64e8eb494
	.xword	0x558fbfc92b064ee9
	.xword	0x4f5d4d13bc987cfd
	.xword	0x4498e78b6d324404
	.xword	0x8b4211c5b673d427
	.xword	0x3128235a5ea49b61
	.xword	0x5eaf261e63a669d5
	.xword	0x9da4d20d463fe1c1
	.xword	0x2da9e1ab329f997c
	.xword	0xfa6f2a07a54087bd
	.xword	0xd06de1d6feb749c4
	.xword	0x27f6b20b56cb1cdd
	.xword	0xcd4f859491d43310
	.xword	0xc2469b69cce1293f
	.xword	0x95f73e8d5a2066a6
	.xword	0x0d561188e518689a
	.xword	0xccc764786939e694
	.xword	0xf9398802408e3b27
	.xword	0x9758c665c9b297b6
	.xword	0x65a97724dfa8d045
	.xword	0x8b79fd0d1da3521d
	.xword	0xf26418f87bd4f786
	.xword	0xb7c2cb4c57c8750f
	.xword	0xdb10392d92e00eb2
	.xword	0x3f5f3d36aa375876
	.xword	0xab2204423c253904
	.xword	0x227b901cc695a04a
	.xword	0xe5f36692c61772a4
	.xword	0x00ecc776ac2fc3da
	.xword	0x6987bb3fbafc30d3
	.xword	0x7951a5f7d4737162
	.xword	0xdd31e6bf9f1a2898
	.xword	0xf84a26a0ffd593ec
	.xword	0x680b73492bb9cf93
	.xword	0xbbeb8948f5041a55
	.xword	0x98f395c7b8628ab9
	.xword	0x75e5bffbf2c9d66b
	.xword	0x1750205ffbbd0c1f
	.xword	0x6f8c060c8e1765e1
	.xword	0xa5129158ae89442a
	.xword	0x9b7ba5bc9f723ff4
	.xword	0x0c8e0ef9fca4829b
	.xword	0x417e92084ef74974
	.xword	0xbccc9c04bef1b18f
	.xword	0xe5d330c38989b6a5
	.xword	0xc24e61c9e0aa1491
	.xword	0x07ea214521a431f4
	.xword	0x830e0d574426d397
	.xword	0xfc1132f022b8050d
	.xword	0xc946a31ec0ee6dc6
	.xword	0x6ff8e38af1df7f10
	.xword	0xc1e83f612348c1e9
	.xword	0x2cab79ac853d63bb
	.xword	0x88538d18d1214d89
	.xword	0xbf9bb26a10c37f19
	.xword	0x5923b3265ad0c5b1
	.xword	0x123c90878cbdf021
	.xword	0xe07025375514045e
	.xword	0x010e84db47ed8439
	.xword	0x17589f13c3a298f3
	.xword	0xc2303ffe5a88f2cc
	.xword	0x3ba187beae3eb618
	.xword	0x3c758a2496cfadcf
	.xword	0xb8aba5c551fe08f2
	.xword	0xbf80398edc5bcbf1
	.xword	0x20bc3d2c123c32f4
	.xword	0x12c781621dd67862
	.xword	0x045be1c887c23c22
	.xword	0x1cad6dcb2bc8211a
	.xword	0xcaed3a72ab8ae878
	.xword	0x213c55b359236112
	.xword	0xe80dc2269f07e088
	.xword	0xf0e566af4d35c450
	.xword	0xf8675962d841b805
	.xword	0x8c28b6a39c7933ad
	.xword	0x034234e2ebd9dfa3
	.xword	0x73ba1383a3f17179
	.xword	0xfaf6429d4271e29e
	.xword	0x1a4f5bad02c0d925
	.xword	0x2048bfcc54335924
	.xword	0x5d5d9b7b117a5f5f
	.xword	0xbfbfad5c1b1f6c61
	.xword	0x01b48dc6c1c97f4c
	.xword	0xbf7e94781c0cd26b
	.xword	0x66435b51e31e7597
	.xword	0xd8c70a7d91b7d282
	.xword	0x12e47bd9622fccbc
	.xword	0x0d5a2e494f2e3f1c
	.xword	0xb624159037be35b0
	.xword	0x22f9ca02f8222322
	.xword	0x8caf45fded68b040
	.xword	0xe2b67095e8c56b93
	.xword	0x2213d04e9a953345
	.xword	0xdfadd3225907e8ef
	.xword	0x20f1c24d53e14e3d
	.xword	0x1745709397665bb3
	.xword	0x60f84a2e55176657
	.xword	0x585405f3ccf78b72
	.xword	0x19ee2177d1764352
	.xword	0x719c55f3482e7d0b
	.xword	0x3dc17072d7680237
	.xword	0x7b331e05adab2ed5
	.xword	0xc5fe211474f8e049
	.xword	0x66cdf5b92633a272
	.xword	0xf9c89259c383edee
	.xword	0x01660dd7c00ec009
	.xword	0x5d5d8bca0d981b4b
	.xword	0xf2a79cc01d493004
	.xword	0x9709dfb5acd39679
	.xword	0xf1848eb14bd76554
	.xword	0x6db8522190ff1e36
	.xword	0x22486f9d8fb7182a
	.xword	0x7406987e58fba000
	.xword	0xb2bcbdfd482b3fb3
	.xword	0xbe0fb1e3e64c8090
	.xword	0xf9bfec040a1e5927
	.xword	0x4300fa70c124dddd
	.xword	0x4c4721853c3b1f0d
	.xword	0xf1bcaaa3b9f43ee4
	.xword	0x6f950f6b00bc0651
	.xword	0xc3838bbc2adf727e
	.xword	0xf37ebc00e93516cd
	.xword	0x0f84a36a29aeb889
	.xword	0x5e39ab8dbd833175
	.xword	0x119d212cd5bc4a70
	.xword	0xe6e4445532e17eb2
	.xword	0x0ae9ad4373bc6180
	.xword	0x36ccaf15ca0e4998
	.xword	0x24dba5cefdbcbba5
	.xword	0x31d518158bdb97cc
	.xword	0xec03e45cd28083e1
	.xword	0xae08fb37179a1e6a
	.xword	0x2e42ebc9d0cde348
	.xword	0xc5d9b347a09df94e
	.xword	0x309ac488367fe351
	.xword	0x23323bbdb32bf293
	.xword	0xc8c05e5c75c9e6a5
	.xword	0xbc1e5fcaab830fe2
	.xword	0x9f152e77cc32c34f
	.xword	0xd1bdb44f88ca5d77
	.xword	0xa8e8c258555d140a
	.xword	0x3fbedf1d358aa41d
	.xword	0x7f4bbd6c3974c7b0
	.xword	0x09a72f98e1f07bb6
	.xword	0xc14d2f60ab3a80e4
	.xword	0x7a330b61fdd3fb91
	.xword	0x2e84f293750f43b5
	.xword	0x61203bbb5177a8de
	.xword	0xf6ee080411f7491e
	.xword	0xe45037bca0a6a630
	.xword	0x0e5f09bcf081a80a
	.xword	0x4531d0223c724d40
	.xword	0x6cc383344dbe7d25
	.xword	0xe8849a557c6dea5e
	.xword	0xe68cc3c3c02dbd4e
	.xword	0x96a4bae5f6a3184d
	.xword	0xee9f785e32db6599
	.xword	0xf8e9d873b8ecc5d5
	.xword	0xb590b6ae647625a9
	.xword	0x644dae6ae706c492
	.xword	0xa8b6ff4d74b97935
	.xword	0x212e3a2c6cdb34a1
	.xword	0xd0079966a64266d5
	.xword	0x4241cae1d6b79407
	.xword	0x0b5e42937c08c028
	.xword	0x826aa5d38e30627b
	.xword	0x6e7fad428eac0571
	.xword	0x909c97245c51c596
	.xword	0x6ddf10055a7c885d
	.xword	0x4503c372cf119564
	.xword	0x6b2919793ce34d62
	.xword	0xb66b6b3b05c0377e
	.xword	0x10d9ce97c64360a7
	.xword	0x95a81ee988de0f5f
	.xword	0xea8c59624902b942
	.xword	0xad26039c52e6af66
	.xword	0xfa7933999d3bac4f
	.xword	0xcbaf347fffb597d6
	.xword	0x5704030837b75339
	.xword	0x405392af50f1105b
	.xword	0xd2732335b329f28d
	.xword	0x8231f24d73af027e
	.xword	0x7b625d1d27e252ab
	.xword	0x9c3cd4b853d528f5
	.xword	0x1674e70ac6bd0208
	.xword	0x577492fd4c6114e7
	.xword	0x9556eaf291726a08
	.xword	0xef762b618aa34d10
	.xword	0xa310a1819b36d0cb
	.xword	0xe60e1844832e990f
	.xword	0x20d2613587d8637b
	.xword	0xdd311a2fac8ebea0
	.xword	0xe4607cdcf4afc38b
	.xword	0xdf14a87d2984c802
	.xword	0x9feba2965c9e4440
	.xword	0x4b45ea286e20b8f0
	.xword	0xaa060e52bd4f2294
	.xword	0xbfba4a0114f4e9fe
	.xword	0x68e924e728a95aa4
	.align 0x8000
	.data
data_start_3:

	.xword	0x17c71ef5c1e373ac
	.xword	0x6b1a5faf31752a65
	.xword	0xa61f41905dfd208d
	.xword	0x0496912df0d2c3ff
	.xword	0xaeec92ab27f2bf32
	.xword	0x469651cd5a4ab99c
	.xword	0x0e1d97cfb5157b0f
	.xword	0x446160a6cd7ec692
	.xword	0xf74cb6e31d0d8bcd
	.xword	0x62b495dcc9aebe6a
	.xword	0xdf0be6f347f7b447
	.xword	0x2680ab6826689573
	.xword	0xe09b1a7ff04e005c
	.xword	0xd6824a30b33a614b
	.xword	0x9175748644a2d368
	.xword	0xda32cc66b8c2224e
	.xword	0x3230b93b951b9d43
	.xword	0xe0364a7583c76219
	.xword	0xf6c587f68de6d75f
	.xword	0x5a68147d7a816e1b
	.xword	0xdd7c42fae260a804
	.xword	0xf18aaae9943f0256
	.xword	0x2fdee8284c1dc91f
	.xword	0x8c68a95b9f389789
	.xword	0x25bbe0924e190aa4
	.xword	0x27daa8bb9af92dad
	.xword	0x7a497748d0979452
	.xword	0xb3298c7a547c26f3
	.xword	0xe8ea3eae7690f0a4
	.xword	0x8ff9f7737878784b
	.xword	0x6c6ce2a54075de77
	.xword	0x0a99361c15c32917
	.xword	0x3ce0da9605a04163
	.xword	0x66d52f5a514dc225
	.xword	0x3d5e30772e63c02a
	.xword	0x6b955f871bab6136
	.xword	0x090239302298de83
	.xword	0x7000bee1dee380ef
	.xword	0x77d8bde31cbea726
	.xword	0x233dc8afafd755fd
	.xword	0x4d9f7b83c5e1966e
	.xword	0xc3e45b2a51590a55
	.xword	0xa5c459814e892afd
	.xword	0x66bfc1a39cfcadd9
	.xword	0xa1b48b9980798c05
	.xword	0x7c50769af64181b5
	.xword	0xb0e09c536051fa58
	.xword	0xccc87da78dbfb4ae
	.xword	0xcaca8a0a7b84bc22
	.xword	0x182671efa282a1da
	.xword	0x4ddec0c5d8ab5f67
	.xword	0x5dd049e1d659ba14
	.xword	0x147e854cc8781766
	.xword	0xc1e946880000253c
	.xword	0x13e2344a30c3a0e3
	.xword	0xe45a0403dda735cb
	.xword	0x411c62b33ef4e690
	.xword	0xaafd1a333b2359b2
	.xword	0xef570309ea868b4d
	.xword	0x24e3d61863ae57d8
	.xword	0xf0daf295c44d8110
	.xword	0x23527bd48b36cc43
	.xword	0x2796f78b427671d6
	.xword	0x357e03e0aaea89f1
	.xword	0xfb067519d5906b95
	.xword	0x8db5ff5b604bcfb0
	.xword	0x824a323c92bf2a96
	.xword	0xfbbc186e464f55e0
	.xword	0xda7ba1fb5a94532a
	.xword	0x77ec43a3625aa6a1
	.xword	0x2cba9a12190fbeec
	.xword	0x1438a793404f0cf3
	.xword	0xa5f4e04ba24ad373
	.xword	0x7d464a745d216259
	.xword	0x1f5752c0c626fa66
	.xword	0x74f6060dc43ad39b
	.xword	0xd1df6287c328ef00
	.xword	0x71cb9cf8feec5f8e
	.xword	0x1b2c8051fe3ea2fd
	.xword	0x2de0032570ca07b6
	.xword	0xe24e0ddea349d206
	.xword	0xecda7a69ff5fce9f
	.xword	0x10cb69994f73256a
	.xword	0x04e41fa739bb091c
	.xword	0x70530cbd100619d0
	.xword	0x52ac1ba07e3e7796
	.xword	0xbe6beaa7c1fc3f64
	.xword	0x961da82e0031c267
	.xword	0x0e38d3e1d50de849
	.xword	0x9692eccb2613fc27
	.xword	0xa57b4070db9ff2bf
	.xword	0xab8ac3281bd6bd54
	.xword	0x34871dbee4fe2a8e
	.xword	0x537efeee660c9419
	.xword	0x3ee9c45d21332012
	.xword	0x3c67a5b8c05b450e
	.xword	0xd8c1dadc053d3d9d
	.xword	0xb920ecfda0be98ae
	.xword	0x57f7ae63af4c60cf
	.xword	0x5ebd4a5b7be469d9
	.xword	0x09bf9f6597b28fd6
	.xword	0x8d7ffe9d1fc85089
	.xword	0xb16c2f51263097dc
	.xword	0xcc1e18dd73daad87
	.xword	0xb2eb269b62feba4c
	.xword	0x3e551b538a7123ce
	.xword	0x1c6a197e651266f3
	.xword	0x441441730910dc03
	.xword	0x8db317a106c36f8b
	.xword	0x29ecab7b9c8f25ba
	.xword	0xe2d79830a5807706
	.xword	0x51384169433972eb
	.xword	0xc7ab1bc9ce070dc4
	.xword	0x965ceec28aed8669
	.xword	0x6040c39a9502faff
	.xword	0x3b88803a9a5a86ec
	.xword	0x34997f2a3377a5be
	.xword	0x5f5cb83dc69030d0
	.xword	0x2533dce25d411754
	.xword	0x2613cc6b2133d807
	.xword	0xb86559bec24e12a4
	.xword	0x194421b8b6b8b988
	.xword	0x3bf5312c71987038
	.xword	0x8d1c04152e75bd3d
	.xword	0x3fe89342d271e85b
	.xword	0x94ca14f6b79eb287
	.xword	0x6638e2d5d113e91a
	.xword	0xd92bddd1bb051110
	.xword	0x0880f4e253955f4b
	.xword	0x032a97ef65445ecb
	.xword	0xa2f55ef6646dd0f9
	.xword	0x9f524d21e76ab784
	.xword	0xf3641c41278ad090
	.xword	0xeab70dceaff5a795
	.xword	0xb76db93fac5d60f6
	.xword	0xc726226581b081c2
	.xword	0x5474bcf17500a69f
	.xword	0x7acae941637c355d
	.xword	0x1d7650217a63e530
	.xword	0x8949fa4b46b6e375
	.xword	0x7f684f8318e9d4b3
	.xword	0x7f46b773dc304513
	.xword	0xc95fa4ef297694fc
	.xword	0xc40a8062abea5398
	.xword	0x1a6052bea0843a85
	.xword	0xee63cfedfa28dbda
	.xword	0x34965d5b98023d02
	.xword	0x43c29966358bccb6
	.xword	0xbbddbdd5e00fc74e
	.xword	0x7ef7a3e5d9aaa7f0
	.xword	0x1d9002c8fe7decd4
	.xword	0x428fbcb8aead9d38
	.xword	0x2e6c483f0255b952
	.xword	0x1a523f8f068787d7
	.xword	0x6f630737d4ee7b41
	.xword	0x7a1b232026e6b40d
	.xword	0x9a993ce85b07ef83
	.xword	0x77a23fee40661a88
	.xword	0x17fcd3447809de9c
	.xword	0x3a3b7aa9021a18e5
	.xword	0x5e81cda4713d86b0
	.xword	0xa3c785340378fa40
	.xword	0x23fd4eb9dca31e1e
	.xword	0xbf84c5d150637b36
	.xword	0x69e1ab03525e8170
	.xword	0x912ce44694011ce1
	.xword	0x5badaccac3468af3
	.xword	0x5f5affe353ce7a3c
	.xword	0x16a0939c50424838
	.xword	0x8660e4d178a5ad8b
	.xword	0xb5da3fdb09f42811
	.xword	0x5364749aacfe2b12
	.xword	0xff0671f67a7ad07e
	.xword	0xd8794402a7462248
	.xword	0xfec19ee7280754a0
	.xword	0xf8169046d46b3202
	.xword	0xe45c0c472209c5d1
	.xword	0x1c91666441f0d024
	.xword	0xd512cb4647b76b09
	.xword	0x8627fcf97287e6b0
	.xword	0x50868dc8ec52d9a7
	.xword	0x1b77f416b8950d9c
	.xword	0xa38f48c952df295d
	.xword	0xe3391b47476e797a
	.xword	0x4c91fefc16a2f2e6
	.xword	0x20bed6c29910a694
	.xword	0x83c9135e71fa002f
	.xword	0x560b01dc67572218
	.xword	0x54d73045810dc491
	.xword	0xa65dabb4cbdd0116
	.xword	0x26e6e454ba8c55d1
	.xword	0xe7d8b48f34c43d8f
	.xword	0xd6d28e40584b94ac
	.xword	0x0e00c749a7f3c1e6
	.xword	0xb12b1db94c125fd5
	.xword	0x8edcb5d886a7882b
	.xword	0x3005226edd6f6895
	.xword	0x8e9fb40e2605945f
	.xword	0xbc34156106bee71e
	.xword	0x9c3c245f5e7a8a15
	.xword	0x434a111304191398
	.xword	0xad3c2ab0248225bf
	.xword	0x182823a9b3cbde72
	.xword	0xd297eebc06f2d3ee
	.xword	0xd46588a2ccea1533
	.xword	0x4a07c5e3446cfa79
	.xword	0xe9b2b4c74df04998
	.xword	0x8366fa5770a1d6a0
	.xword	0xaa034584476eb5ed
	.xword	0xb6c619ef1d2f8fe9
	.xword	0x8cf3f81c476b619f
	.xword	0x00975f06d9d30555
	.xword	0xf5475fecad09aeaf
	.xword	0xc8dec11ac70c6cc1
	.xword	0xe5fea1da76dc3476
	.xword	0x35216b16aaf2d89e
	.xword	0x6819cd3f8eca7ce9
	.xword	0xe31ea8794818085f
	.xword	0x5d76248b1791dd62
	.xword	0xe8701c16f68c6c2f
	.xword	0x583e1485d5924eeb
	.xword	0x0bce90a36244c384
	.xword	0xc2888ae596f1935d
	.xword	0x1cbd70f2d16b0304
	.xword	0xe8f3cade640367cd
	.xword	0x864016a58b0877ce
	.xword	0xfd93657599f155fe
	.xword	0x1f5d673c5d6dc9cf
	.xword	0x9f237e0cf5654fb6
	.xword	0x8204480c2a1e80e6
	.xword	0x890a6e5cbb52545b
	.xword	0x1aa66eead03e2fd0
	.xword	0x853aab1ae04e6246
	.xword	0xbddc457efc93237b
	.xword	0xde3562c7a035962c
	.xword	0xfda0c27442ef994c
	.xword	0x75300c340b49f2fa
	.xword	0x947a2bdc6b92323c
	.xword	0x5f65801a83849858
	.xword	0x03cb504a54277ece
	.xword	0x129269570c69e690
	.xword	0xbb1eee5cc543c38e
	.xword	0xbb1e438b8a4afb31
	.xword	0x30827e638d966741
	.xword	0xa5d5a0a146b74c2f
	.xword	0xecb93521f3a9ad96
	.xword	0xacbd69cb059b0df5
	.xword	0x7c7e160347151a8c
	.xword	0x37d8ed974f29261f
	.xword	0x9eeb65ace45a90b1
	.xword	0x5ee9dae4cab71c51
	.xword	0x16edb72ef9acce8c
	.xword	0x972c581d05a75ded
	.xword	0x2b6e174bdb8efbbb
	.xword	0x6fb9549ef4f32c07
	.xword	0x6f0ec9950e51d9c5
	.align 0x10000
	.data
data_start_4:

	.xword	0xa2b330061e469a91
	.xword	0x7d395382ffb4f75d
	.xword	0xf483fef13bcf357e
	.xword	0x741db0bd133377e3
	.xword	0x629de432e88a2c00
	.xword	0x800f87c4c323e605
	.xword	0x54a6c7132377bbfc
	.xword	0xd48f4eb38f32ab3f
	.xword	0xa9df95848c30ee10
	.xword	0xf640ca16564a89f3
	.xword	0xe69feae319474bfd
	.xword	0xa461ea8aee3cd136
	.xword	0x22832b26a3aaad31
	.xword	0x8871521e97adab64
	.xword	0x40edc90540753430
	.xword	0xdd6224bda97878a1
	.xword	0x9e378dd3e1d07da4
	.xword	0xa29338fd2312990e
	.xword	0xec29f76ae5b79282
	.xword	0xd2961e203d84da9e
	.xword	0xb9517ad76dad8102
	.xword	0x61af1d29c4e9b135
	.xword	0x9491401466b591d5
	.xword	0x3e734b68af313be5
	.xword	0x92353c7f839de324
	.xword	0x02a7903d0a93fb25
	.xword	0x15c6d2de5514edac
	.xword	0xec3ef2753fbf2957
	.xword	0x2ad0d859a844e115
	.xword	0x89ea4949f8f7391a
	.xword	0x36461ac44f3ad2a7
	.xword	0x4b1d5f9868f1b384
	.xword	0x0d2a247708d374d8
	.xword	0x6d1e6bb7d8e3673f
	.xword	0x2edd433c013cd192
	.xword	0xfc1d287b2a6a686e
	.xword	0x60dead8395372304
	.xword	0x8a55c0abb05ff2d3
	.xword	0x1edec2a312df89c5
	.xword	0x363695eb29ea49a6
	.xword	0xad2b99e7c3dd08cf
	.xword	0x10c9d2c8a2d9b548
	.xword	0x07c8847685637499
	.xword	0xf3094992a60b5d87
	.xword	0xa47253396672d8b1
	.xword	0xe4bc1318da07dcce
	.xword	0xb3ea32f770059b8d
	.xword	0x20803e2404090b98
	.xword	0x02136b3aa7aa25b8
	.xword	0x33ffa0bfa849e8ea
	.xword	0x9edfa37a673e5379
	.xword	0x90d8002ccd3a1d35
	.xword	0xf7f35d26988b2d99
	.xword	0x77746d457ea7beba
	.xword	0xe3b2c0083e0d2f75
	.xword	0xc8b060e8c1105981
	.xword	0xe4519925f0986d4c
	.xword	0xa669ed4e2a300cd3
	.xword	0x525eb8b01aae8e34
	.xword	0x59751c6ec66ae6d3
	.xword	0x71fa6a0b9184974c
	.xword	0xb2cc78afe5bd4bae
	.xword	0xcee70471aabe9295
	.xword	0x0676ce92f1422955
	.xword	0x04f7123351d0480d
	.xword	0xf46dfd6018c2ae7a
	.xword	0x69432eb4c639a2d9
	.xword	0x495b2650d466ebff
	.xword	0x3bd0c731895466f3
	.xword	0xfac44613d7fba97b
	.xword	0x94f5a160dc89f495
	.xword	0xc83e5412b4415971
	.xword	0x7403ac21e121b284
	.xword	0x511b4fc1383672e3
	.xword	0x01bc274427d3da05
	.xword	0x8a3cc54b579b3056
	.xword	0xf0964fdc2f205da6
	.xword	0x1c753d1076372ccf
	.xword	0x5941a7ffcdd29e95
	.xword	0xdead9255cfacc08c
	.xword	0xce7e39574ebd1508
	.xword	0xc0b03b3a5c8d5b5b
	.xword	0x7b81800346aa0628
	.xword	0x15a1a9a4ed80e9a9
	.xword	0x3f9197183a649cf8
	.xword	0x4dcc6fdf9b3a7b17
	.xword	0x39221c08ee732acf
	.xword	0x91c2a0d5f7f8303f
	.xword	0x9ce60efe703abe6a
	.xword	0x2092c31d6fd6bb5e
	.xword	0xd89a4e50d0234772
	.xword	0xca7e032ddafbed45
	.xword	0x5f883ac3c162fb27
	.xword	0x7bd393cf540af356
	.xword	0x3b3c4ad34ae22263
	.xword	0x0336e4ad57649340
	.xword	0xbbc8f0c62bc6f9d4
	.xword	0x955c75205bd14fed
	.xword	0x085f7614e8261866
	.xword	0x63b1706473ac0c99
	.xword	0x79ebfc2a958a0365
	.xword	0xff8a8f50077b0fef
	.xword	0x7aea030a6618dd41
	.xword	0x3319264bc65eb40b
	.xword	0xd1f71872ea09ee3a
	.xword	0x1de93bf27eb36f8b
	.xword	0xf781dc84089e4ac1
	.xword	0x281becd2ae93be34
	.xword	0x13f6559a3d4cd91a
	.xword	0xd07274decff867bf
	.xword	0xdee89c641ceb0ea1
	.xword	0x2af6b2eb635685e3
	.xword	0x50d97afe959e5318
	.xword	0x1b50eacf8383a2c3
	.xword	0x8f25db3d4df14cff
	.xword	0x9a13d5d00ca3b556
	.xword	0xc0904f6b61b3bfe4
	.xword	0xaf4c076f4fa10ea0
	.xword	0xfe7b8de06f262070
	.xword	0xfcd82bc3fca71115
	.xword	0x9a7efbec14b0f71d
	.xword	0x0c8b840e3ba61c15
	.xword	0x811e6643ca68aa9f
	.xword	0xa769a17697d2c04b
	.xword	0x7d59679afeef16b8
	.xword	0x577e8e4ea5cf9fdb
	.xword	0x63826d38c0f5316d
	.xword	0xbcdfd2d890ad0e56
	.xword	0x3fa0000d3d22a9fd
	.xword	0x939e0f042d5bfb0e
	.xword	0xf04f355e01560f74
	.xword	0x19ce49f020f8dc49
	.xword	0xb09d0b2f103817a5
	.xword	0x9d9e05c7b764c221
	.xword	0x193b1d70391cf28d
	.xword	0x3d3bdca2842d4530
	.xword	0xd4476ede80e741e2
	.xword	0x14ffd1150763e170
	.xword	0xab259b1af7a61742
	.xword	0x03d4caa6db170a96
	.xword	0xbe4cc502df774935
	.xword	0xd160817052aab238
	.xword	0x3593fab80555ec55
	.xword	0x2940ca1a2d30c5f4
	.xword	0x5e93bb760b5b1a02
	.xword	0x948bf70b9647303f
	.xword	0x605c706736e8c1da
	.xword	0x0a64c3466cb99468
	.xword	0xa14a2265699b835c
	.xword	0x9505482d202101d8
	.xword	0x858b6d3f5fd67772
	.xword	0x38b50284534bcbf6
	.xword	0x47a650c5e2cd9eb8
	.xword	0xfa25e692b29e57bc
	.xword	0x475785bd4b545c5b
	.xword	0xf9a15589537cc134
	.xword	0xeab60e30cd517140
	.xword	0x087ec9b191a21677
	.xword	0x676a3206c9f8c3d0
	.xword	0xf329fd6bf4d7c30e
	.xword	0x12e87100b59e8cb7
	.xword	0x916c769241a27213
	.xword	0x1f43a2034c4981d5
	.xword	0x13d96b333e611be9
	.xword	0xd11cee03906c3d8b
	.xword	0x0168839c9233bffe
	.xword	0x60c90b87ea0639a3
	.xword	0x8d19bf8b7d07ce35
	.xword	0xa570f74634b20a10
	.xword	0x0698690baf032c21
	.xword	0x553509f68ecba679
	.xword	0x6c7cedce599f199c
	.xword	0x4990a0b5b644aee9
	.xword	0xb9af353b6cc09cc0
	.xword	0x22cbc0ffe2238903
	.xword	0x1eb0c776fab09ffa
	.xword	0x888a2201f8f27b6c
	.xword	0xd4f98d769735f754
	.xword	0xaca6bd727b8638c0
	.xword	0x5249ead276df2b5d
	.xword	0x6bf0a04eed4aa0ba
	.xword	0xfa2dcd37791fccd5
	.xword	0x0a3138b613476496
	.xword	0x353dcf71178cdc9e
	.xword	0x5bf1663ae2e04037
	.xword	0xea9e0db0df503ed6
	.xword	0x54d18bdb1190cc6b
	.xword	0x28e9bfab426cfeb1
	.xword	0x691d231e5bc5f8bd
	.xword	0xf52665c8da3068b1
	.xword	0x84196834d3970e90
	.xword	0x901aa143e024c485
	.xword	0x5cfe095a7b5c741e
	.xword	0x7ef33322acd168e3
	.xword	0x6564f076cb40b8d8
	.xword	0x898f6e09b0af59f7
	.xword	0xcb27338169343127
	.xword	0xb362da3c6a81484d
	.xword	0xb3ae374a2be4c9d0
	.xword	0x5ad3f1f679294283
	.xword	0x5d81e77e0062a2c3
	.xword	0x5c2c7def1816d6df
	.xword	0x8679ccdce7f0cad5
	.xword	0xa7bdadd1996e7cce
	.xword	0x002cd6f6fd75d7be
	.xword	0x5df4f59b20244abd
	.xword	0x29197f7febd44b7a
	.xword	0xc21aae2cfa7701d0
	.xword	0x7babf38a6bfa12e3
	.xword	0x246ac72c64348292
	.xword	0xfd10009c6e12cde3
	.xword	0xb58034dc95c971dd
	.xword	0x2e0a5fcdd4c207e0
	.xword	0xef7ade92c1a7cf23
	.xword	0xd9dc9ab4b398668f
	.xword	0x2681ba1bf435ec72
	.xword	0x511ec3574f7e43ed
	.xword	0xf6bbe6ac3fc3d030
	.xword	0xe7a1be7de22e1e7c
	.xword	0x4dc55726bc8c2d12
	.xword	0x363dbc39c44d14b6
	.xword	0x3e1f334b2e2e8c14
	.xword	0x66842bf07b0ad0e7
	.xword	0xcb92d1e993d58b34
	.xword	0x744e17cfee52cdd1
	.xword	0x1d2e9f378d7b171c
	.xword	0x3e73226c4036d356
	.xword	0xc873ac4f1a76bd7c
	.xword	0xed30c362e9f32214
	.xword	0x9b0b74c7a296d1c2
	.xword	0x83555082a51acb1b
	.xword	0xeb79de6cdcd8dc8e
	.xword	0x09a047d6bf4467cc
	.xword	0xde855163d9c44116
	.xword	0xe2ccf970ec6c9344
	.xword	0x1a9bf954784aa34a
	.xword	0xed6cefae86df2e5d
	.xword	0x5f95ac111ce280bb
	.xword	0x3b5550c20a7a5e76
	.xword	0x7fed922505eed908
	.xword	0x0f7c0825feee4b14
	.xword	0xad3181e410613c4c
	.xword	0xf91559d6017cc72c
	.xword	0x3053db48ae2316a9
	.xword	0x5b16008bf7d1d3ea
	.xword	0x0b035ff177d48113
	.xword	0x2aa0bc2f47119cfc
	.xword	0x01c3b58cbd62a8fc
	.xword	0x50b34ff1334b8f0a
	.xword	0xe5b1e1bda14359f0
	.xword	0x47a2cc9c072502b3
	.xword	0x954ad5d19d05048d
	.xword	0x232aaf01eefd2725
	.xword	0x562aee306ce34a5e
	.xword	0x8fa710f5d180b258
	.xword	0xf71b31246d7d33c5
	.align 0x20000
	.data
data_start_5:

	.xword	0xf59d95fd06fe7e2d
	.xword	0xb30ac161c44d38f9
	.xword	0x9f19766cda8ed223
	.xword	0x65dbece0b0dc9542
	.xword	0x9fdd70d67feda60a
	.xword	0x2eb9f85c5566d7bf
	.xword	0x0271223f89927891
	.xword	0xd20f8aad9024ee82
	.xword	0x1f1ff9dd1a55e72e
	.xword	0x85223ae0b6bc3170
	.xword	0x62f1976e5a92c712
	.xword	0x56063f341205ba5a
	.xword	0x72d4e1bfae0f62fd
	.xword	0xd6b5cd2701664712
	.xword	0xcd4d324227931add
	.xword	0x21a1e49d580aee91
	.xword	0xf007c3c52d34ea34
	.xword	0x449448c4533f7903
	.xword	0x9add83a2c7547f80
	.xword	0x457a23817948edfa
	.xword	0xaefff6a8f8a99246
	.xword	0x342233dc4887a21e
	.xword	0x788a22ad0f542637
	.xword	0x0158b99bb531dd49
	.xword	0x9ee298b05a803fdf
	.xword	0x5be5e9534fef2b0a
	.xword	0x0e4ec839c25eb116
	.xword	0xa54aa5ab41f35fea
	.xword	0x34fa6acededaf038
	.xword	0x24cf5f926e04eaf2
	.xword	0x559f9ea8e0f10914
	.xword	0xa8bbfae14a8ebc8c
	.xword	0x05991f753df2dc1d
	.xword	0x5994d7a77a4d6fb8
	.xword	0xdbd3ea7c3d9386a5
	.xword	0x9ef40296b7f6288c
	.xword	0xd22462c5ad64b4e2
	.xword	0xb3de4820608d0add
	.xword	0x2f8fe1fa18b11796
	.xword	0x2480c8f1bdb7871e
	.xword	0x47134d9d939a0616
	.xword	0x8ce5e3a4d775140d
	.xword	0x1fc4bf691068f4b9
	.xword	0x0c0c7c2148ed3e52
	.xword	0x7c05d10006801a2d
	.xword	0xc96bbcc4af0d76d7
	.xword	0xe60ccaa3e5c81081
	.xword	0x6d4f8e1934a573e3
	.xword	0x5c6c274cd67599ea
	.xword	0x9d3a9b48effee002
	.xword	0x73370054aa15da26
	.xword	0x1ab816c4b33b96fe
	.xword	0x8861884f13583930
	.xword	0x336c482cf2995119
	.xword	0xfae47664b4f80141
	.xword	0x48a23974dc6b11aa
	.xword	0x2d5940424bfe1031
	.xword	0xdce8df1b70c050a5
	.xword	0xd7ba0b37551e29d3
	.xword	0x24d238cd1b503003
	.xword	0x71bf16210f892689
	.xword	0xa0a72168a6404bae
	.xword	0xdbb6eedf125f4921
	.xword	0x5bc4253a6f6cdc35
	.xword	0x0460fbedc0f6e387
	.xword	0xcde570fd961db85f
	.xword	0x52b26f786480bfa4
	.xword	0x3baa2fd6cdee7f97
	.xword	0xfcc09d3ddc01aeb2
	.xword	0x61956e8f64a03ea1
	.xword	0xe3a5a7af39a2a70a
	.xword	0x5b7fdf2fff69f885
	.xword	0xc8cf6f5be4f364ca
	.xword	0xbb1afd93c26ac911
	.xword	0x019fb398f14f782d
	.xword	0x0f70123681b6ce15
	.xword	0xfa8168f461f30472
	.xword	0xd744961a14a3a49a
	.xword	0xc8d8b0cc59feaa07
	.xword	0x56d77116111246a6
	.xword	0x66a67816d959c1af
	.xword	0x646ac88b3321e3e3
	.xword	0x581f0c48ffa2ac57
	.xword	0x18a6b8e4527ce7cd
	.xword	0x1ba9e8aac2f73d48
	.xword	0xf1662fd37f16f083
	.xword	0xb180f2dcd399e7f9
	.xword	0x49b8294e07857a02
	.xword	0x210cb8362c856a0a
	.xword	0xba24b701c224cf50
	.xword	0x5e7360b40fb3d2ca
	.xword	0x67b6b4c3ec510dcc
	.xword	0xdc4c850d8ad1e93b
	.xword	0x641ce5a8bf72ea9c
	.xword	0xb5491bcceb6ff402
	.xword	0x58d310a73ada6388
	.xword	0x1fbbea27b4594a22
	.xword	0x3d827154a202ddd4
	.xword	0x4ca2688933d59206
	.xword	0x2b9bd35f08816476
	.xword	0x6f8dcc0d45e3db3e
	.xword	0xffb61ddcea43994b
	.xword	0xc8c4c05aa8b7df71
	.xword	0xf36b3121730e974d
	.xword	0x497b92a513828b61
	.xword	0x3971d40341e14db1
	.xword	0x3fb97f8c478837c3
	.xword	0x855e0efe30ed4158
	.xword	0x8943800b7035ae49
	.xword	0x6164b78af9d910bc
	.xword	0x16b3711a6d3c8d4e
	.xword	0x83dbb3b2d4b6d433
	.xword	0xf5720f48a64cb29a
	.xword	0xa7c0ef3cefbd42c9
	.xword	0xdedf1b90dd28f83d
	.xword	0xd10bd03b2a0101bf
	.xword	0xc6d3a8eb05413802
	.xword	0xf3e3cec0fbe57e3d
	.xword	0x62133aab2484b223
	.xword	0x3aa50cdc2385dcf0
	.xword	0x5241b8f6eaf32c9a
	.xword	0x539313e74b7a2a27
	.xword	0xfcdfeda28d6ba3d9
	.xword	0x063d624258f36100
	.xword	0xab72b441f97f0f90
	.xword	0x039dd5e2238a99a4
	.xword	0x0ab3a66d67591070
	.xword	0x0df268a8daff8845
	.xword	0x51147810d24e1009
	.xword	0xb4aba68838f460bd
	.xword	0x82e39a3d60030406
	.xword	0x4265b8eda51831a6
	.xword	0x752d9f913270e073
	.xword	0xe1be0408d08a4fa3
	.xword	0x8d61f3b7f81243e1
	.xword	0xab3db1e22c6b9976
	.xword	0x60f3bfab87615cd5
	.xword	0x0a635eb5b1c97eb3
	.xword	0x69638a4b6f07ae7c
	.xword	0xd7d3fb58d059952e
	.xword	0x956616a426d850a7
	.xword	0x1b23a4ea8d5a672d
	.xword	0x91c5b64fa445c6cd
	.xword	0xb194ec8a2600e153
	.xword	0x2b21a0d72837828d
	.xword	0x71e165eab11b9b69
	.xword	0x17bc7ced8ec448f3
	.xword	0x5de713b678005860
	.xword	0xe7ce6aa799694b51
	.xword	0x28f49c607f9e1c83
	.xword	0xe6c1ebf7df724335
	.xword	0x6d7eba414196557a
	.xword	0x343e20cb33a06f78
	.xword	0xe0084ffe4ca86ee4
	.xword	0xd79fbecdf6b9840d
	.xword	0x43ea8c73959414f2
	.xword	0xe9fbda2c3f2a6941
	.xword	0xded41498e96deb87
	.xword	0x392bef51a2535643
	.xword	0xd5260022dce9d19c
	.xword	0x5ced0fb1aa47f977
	.xword	0x297b8b769b8bdacc
	.xword	0x894000306c8d4475
	.xword	0x6ca8a9410fd99c7f
	.xword	0x01f152dc57401193
	.xword	0x5bcfa9a69d3e03cb
	.xword	0x91da3cbf74b7a864
	.xword	0xba4ae0071105dd6e
	.xword	0x0e020b57eeacb121
	.xword	0x31518e29e61db3d1
	.xword	0x9b1ca122afcd5b42
	.xword	0x9918202661132783
	.xword	0x04da705fe4cfce09
	.xword	0x70a925b461bd68f2
	.xword	0xc442e1956e15cbb1
	.xword	0x5e9ead171d28e752
	.xword	0x361a7281fc9d5b33
	.xword	0x0a415caa41962a31
	.xword	0x2e052459f6de2226
	.xword	0xded0bf2e88a42be9
	.xword	0xdad9c126d0d99750
	.xword	0x9d76166330690f0a
	.xword	0xbf8a676c1e54b90e
	.xword	0x9a32b385133a1392
	.xword	0xe35652471558c6ba
	.xword	0xc2a383c5635b3a7d
	.xword	0xdded25df260c395c
	.xword	0x6ffa589ec73b4681
	.xword	0xe3eb898257eeb6b1
	.xword	0xfe921ed8f71a83ee
	.xword	0x71a2810a8e5b8dff
	.xword	0x166e27334590fcf9
	.xword	0x4332c6614328cdff
	.xword	0x73704cb7bd2465e1
	.xword	0x62be6cc0fe8e1329
	.xword	0x3803fc33627cde7f
	.xword	0x1b7898d5c1c335e4
	.xword	0xe5f906d5f8b430fa
	.xword	0x5cff2cb9eb0cf5ca
	.xword	0x78bc85241ac46ddd
	.xword	0xe6bd8fc7e153bb67
	.xword	0xae17c220d0c3c1ef
	.xword	0xbe80ba7d6a0c261b
	.xword	0xee9ad9c042c31345
	.xword	0xd33e68da31ef98c7
	.xword	0x8deaaa84e2417f5a
	.xword	0x9ab391552bf6a30a
	.xword	0xed5a22e8e30ad963
	.xword	0x6cd4ecb9ddb0ee43
	.xword	0x80b14ddc871a0596
	.xword	0xa70539e2e6d92000
	.xword	0x6eea5294f7c3e7bd
	.xword	0x77115acba7bcf880
	.xword	0x1eba902d54e7e5b0
	.xword	0x052ac8b265d0fd3f
	.xword	0xcf929a61fb3e683a
	.xword	0xa80bdee0bcaa6e55
	.xword	0x86e0e7de2643e0c5
	.xword	0xd818f697906d34cf
	.xword	0xfae55a391dea1a0c
	.xword	0x6ed2eb5b2870fb2e
	.xword	0x06b93eb2ab632f10
	.xword	0x3564bfc8362abe0e
	.xword	0x4df05ffb0533ae71
	.xword	0x7f34ddaac4564034
	.xword	0x48fd4b32ccf05ddc
	.xword	0x0cfe684eb40c0408
	.xword	0xb0d40c810b761f50
	.xword	0x86da5be9edcc081b
	.xword	0xa6a55b147e877ad4
	.xword	0xf0a2131f31a5be03
	.xword	0x6699a04d75634f49
	.xword	0x0a070793c662f4a7
	.xword	0x8aac3a951e06ca74
	.xword	0xd6a64c6b9363dbac
	.xword	0x4dc40f461c34e2ef
	.xword	0x63ec869f0dcac324
	.xword	0x55abe3fda6d0a1d7
	.xword	0xba372e3cbef55cd3
	.xword	0xf24e98eb09d9f2e1
	.xword	0x02dd5a3c14a27a13
	.xword	0xf8d5fad615fdf878
	.xword	0x6a1e72883a25273a
	.xword	0x46610950c241c4fa
	.xword	0x555d8e54ff920aba
	.xword	0x9cb8cfd0cdf4a8da
	.xword	0x70a8c2dab1fa6c72
	.xword	0xdb98ebe3eabcef47
	.xword	0x52a565f5367805bf
	.xword	0x341ab23dcc19fa5f
	.xword	0x7503e4ff6b31ce08
	.xword	0x93305940372c6e6a
	.xword	0xba42cce9a54de6af
	.xword	0xa25c80aec5d3aabb
	.xword	0xf39ce1ce6329b705
	.xword	0x34073233f084bf3f
	.align 0x40000
	.data
data_start_6:

	.xword	0xe3e8bdf149384b1c
	.xword	0x40c1dbf4b7fd132c
	.xword	0x7299ddb816d7048f
	.xword	0xa0a9bd89cc0a5ad5
	.xword	0xf1907d186b97e6b6
	.xword	0xe5090c606cb5827a
	.xword	0x09122e2f5b4bfb5d
	.xword	0x9c59eefed5c3b2fa
	.xword	0x51c2549945d9811e
	.xword	0x160b7fb5705eda9f
	.xword	0xc72f65acaf66ef0d
	.xword	0xec27026d1a9d6f17
	.xword	0xb1e4570f459d1933
	.xword	0x51d1088777143887
	.xword	0xe57c9d72c91cab2b
	.xword	0xc33ad04f724a76d7
	.xword	0x16633f9424b36b0c
	.xword	0xe6f67214c5e3ffd4
	.xword	0xce7dab274077487f
	.xword	0x8f5c93dc5b759fd6
	.xword	0x8020cfa862c8f6a7
	.xword	0xf2feea2a7e0d5f1d
	.xword	0x292e40e003a053a5
	.xword	0xd82b6261ab6b82f7
	.xword	0xe8005da00cdfcf8c
	.xword	0x45a41220c1269a45
	.xword	0x31629893630c8999
	.xword	0x76190d4ad4ddd19b
	.xword	0x74e3568aa3fe9606
	.xword	0xe2027d7978e54433
	.xword	0x52edbdb68465f6e2
	.xword	0x604a1ed07af78892
	.xword	0x95ced06110752999
	.xword	0x95dab3c125b69aab
	.xword	0xef323c5faa76eaff
	.xword	0x512e55599f90baa2
	.xword	0x183a955934b93768
	.xword	0x5324b26ad657be0d
	.xword	0x9706b30d656d70e6
	.xword	0x7dca3895aff9e195
	.xword	0xe54073bda825fbee
	.xword	0xdd7cfce387d25916
	.xword	0xe5e424a9c1a95d02
	.xword	0x40c1a7a3ac40dd8b
	.xword	0x2854c8fb882d3804
	.xword	0x4529e2eee62278ca
	.xword	0x4a298b37f61d0cec
	.xword	0xe60547088862ba09
	.xword	0x511ce8e150d7b874
	.xword	0xbace035467823d81
	.xword	0xca19e2ea30332809
	.xword	0x63d52753999e3c53
	.xword	0x9823813590f1fff0
	.xword	0x390f0e8e93be38f6
	.xword	0x61f769f2d420646f
	.xword	0x8f5fc3f9312a47f2
	.xword	0xf07a9d2f383727e4
	.xword	0x3c745d47b8dd108f
	.xword	0x9c8219398b6f0e0a
	.xword	0x77996a6597c946b2
	.xword	0x6ba9ac0e59c3b979
	.xword	0xc9608727809208b7
	.xword	0x4e137c796cc4802d
	.xword	0x9c548275cf9d4a12
	.xword	0xc3eaabb45119e18b
	.xword	0x0bc47bcf7a2ca546
	.xword	0x5a5748f68469b2ef
	.xword	0x6c87c48e5f812d15
	.xword	0x93799b748d389b7a
	.xword	0xd97f43a5aa076e2c
	.xword	0x0dcca7dc0d2a6c4a
	.xword	0xae410f45984728bd
	.xword	0xefd76113758278b8
	.xword	0x2790a6bb470ec662
	.xword	0xb37a8a46f8d79ca4
	.xword	0xc74213fea6f4f1e6
	.xword	0x5673072065dd8dde
	.xword	0xaefc36bcccdd6a06
	.xword	0x40cfa3cf2fc6e317
	.xword	0xe6d8849b8f2ed760
	.xword	0x48ac4c96ff11796c
	.xword	0xf8f33b9b55f1ef5e
	.xword	0x34d3bda44536b084
	.xword	0xac05f177882a53c9
	.xword	0xb3102d786edba89b
	.xword	0xfbb8e950195f3605
	.xword	0xf896cb7f99f2b4ad
	.xword	0x331514bd0757da0c
	.xword	0x010d0652cc69f480
	.xword	0x870a637368b20e92
	.xword	0xa4f10a50931a7526
	.xword	0x09abc117ba579205
	.xword	0x5a673a9bfdf317e6
	.xword	0xed89f69ef7ec6258
	.xword	0xc87d99bad7cd0a86
	.xword	0x22735146269b1ade
	.xword	0x96b813fce254032e
	.xword	0x4fc217b5fa356815
	.xword	0x56759e7f9e1aed0d
	.xword	0x008438b377932001
	.xword	0x3d6328643f5da725
	.xword	0xdc556040fac37beb
	.xword	0x111c3d297b4c6c4c
	.xword	0x9faceafe7292e9f8
	.xword	0xde160ed152ef6b79
	.xword	0x21bb2c7d3b479363
	.xword	0xf9bcb2c6cdacdea8
	.xword	0x4d8917c785bf6952
	.xword	0x93f62e1ff08e7b08
	.xword	0x86e8d0fac74400b0
	.xword	0xbf82249e81204ee4
	.xword	0x2d0066894bcd3d81
	.xword	0x2001e14cf225c5b4
	.xword	0x0b8b2d44edbe06bd
	.xword	0xb2af5d4fe4671abc
	.xword	0xd68a47d87fad3f2d
	.xword	0x24c6632fe52c6425
	.xword	0x35418f8e9ed7856f
	.xword	0x6c868cacf8f00907
	.xword	0xffc60be555d3c8a6
	.xword	0xa57f92ef55a6d356
	.xword	0x703bfd8a4517cb60
	.xword	0x8a5adefe72143312
	.xword	0x664ae3203e04dc74
	.xword	0x5d817e0978348902
	.xword	0xa7866bae8938c5f6
	.xword	0x196e58632470886a
	.xword	0xd9afaf96d15689eb
	.xword	0xc4198a09e49a5ceb
	.xword	0x624808f17a83fbee
	.xword	0xcd94f843e931eea7
	.xword	0xd5024d7123ad9041
	.xword	0x6351f1e7dc19f282
	.xword	0x0795ecdfb2a5db0b
	.xword	0x74dcd0bcae054c0d
	.xword	0xca8139b52c08efb6
	.xword	0x156fb5dbcb4a0469
	.xword	0x82c4f0ee0c98037b
	.xword	0xc6cf88affc67626d
	.xword	0x0f1fb61ad49d16b5
	.xword	0xa57cee62a04b0377
	.xword	0xcccf58ced9df5280
	.xword	0x0891e5c631e7b248
	.xword	0xfee398f150d5a09a
	.xword	0x76c410c7d0ec251b
	.xword	0xdeed4352f927e941
	.xword	0x26a54fdcd1e8626f
	.xword	0x098b83e5b431193e
	.xword	0xc8b8b4a61067fc4c
	.xword	0x05f888e50d073719
	.xword	0x9846377b3617da02
	.xword	0xbbd0307fad531e5e
	.xword	0x42a92965679914ed
	.xword	0x26c0dc9a788517d7
	.xword	0x159951c4775bbd77
	.xword	0xc8feaed9b0d9fd4a
	.xword	0xec06282d840ff35e
	.xword	0x4c6e682dde6e2a8d
	.xword	0x7e4db0a535bd5302
	.xword	0xfa780050cec5f6e3
	.xword	0x32d7b17ea90d93c4
	.xword	0xa6875e6e9e695b39
	.xword	0xb88f2510637c323f
	.xword	0xe9909c822d38a69c
	.xword	0x9aaddfd46a7c3d54
	.xword	0xa8f226edccf9d643
	.xword	0xcdf9ad6191195e51
	.xword	0xeee2e82cbb82cd80
	.xword	0x846c4aecfdcd2d67
	.xword	0x11dfb62627b7375c
	.xword	0x6314382193c20ced
	.xword	0x906b56a05706082d
	.xword	0x1b0f5bd425546475
	.xword	0xaacb580dbd785e4d
	.xword	0xf05a13755b67b5f4
	.xword	0x5f91ef2f05135d4d
	.xword	0x8eb2e712ae13fe28
	.xword	0x81b810500c5348d8
	.xword	0x780dfe8e5aa40177
	.xword	0x865ffb51f9ec6e48
	.xword	0x65401990dacd5ff4
	.xword	0xc34ebb0f1b16584a
	.xword	0xdf0a85c1388e83b9
	.xword	0x4879342be06dbe81
	.xword	0x13da5a860e1e34c4
	.xword	0x311c80e46c41c1fe
	.xword	0xeaa0fd2fb19634b2
	.xword	0xd1c67229cc76e899
	.xword	0x5eaa685aa8ce17aa
	.xword	0x79f2e25ba1d95730
	.xword	0x967ddd695b0ba824
	.xword	0x8180c416236399e1
	.xword	0x435de1eed2c3a88e
	.xword	0x28321f59d11ab4ca
	.xword	0x098749e06457eaab
	.xword	0x64f78e1b42187204
	.xword	0x69f8e30b27c86fc0
	.xword	0x9e8d8f1b98c41bf8
	.xword	0x3ab13a90a3714499
	.xword	0x967d9e5954db6646
	.xword	0x031e582b38d18b27
	.xword	0xa69f17baa9b4a9a5
	.xword	0x5648185a86933db8
	.xword	0x90267d56effb3a51
	.xword	0xb14239893a2cf08a
	.xword	0xc6dbbae2963aee1f
	.xword	0x524bc79d68335889
	.xword	0xd8f61ec2fdad0632
	.xword	0x65b8ee3333f0069a
	.xword	0x65244ce1f191e5d0
	.xword	0xb49d4192c2bdbb34
	.xword	0xebd458588facda0c
	.xword	0x5658746915b13750
	.xword	0x191193d2c310fbd9
	.xword	0x57069bc52d5fd44f
	.xword	0x438df3911c5cc02f
	.xword	0x88db61b0761d4c21
	.xword	0xf59409c6a4ecb307
	.xword	0xfc8c45efe3c7c6d9
	.xword	0x9d6bded0917a8fb8
	.xword	0xfb95465521cd27c1
	.xword	0xb2ff1e5583d809b8
	.xword	0x303613b979fdc102
	.xword	0x9baee1c8eab3e61e
	.xword	0x06182601fb8ae70a
	.xword	0xd98724e564434af7
	.xword	0x4cae2c1f8f4a5d30
	.xword	0x2550a3f1d0ee724a
	.xword	0x3f56bfdb42f0b056
	.xword	0xdd8acbabe4535ea2
	.xword	0x3ce29cce029409e1
	.xword	0xcb901a80f5f75b82
	.xword	0xb241ba7388706070
	.xword	0xd24293a6468b2351
	.xword	0x8d8c237807c220be
	.xword	0x7ccd596139b33b95
	.xword	0xccc87bb14b6ae38e
	.xword	0x5ede8150e49da5d7
	.xword	0x9f4a3f05bdeb5823
	.xword	0x3157bc150fd5d588
	.xword	0xff2abd1b3ea22593
	.xword	0xbbeec2baad435077
	.xword	0x0df933c29266bae0
	.xword	0xcb7fa84158eaec60
	.xword	0xf747cf8c29ac5a17
	.xword	0x7e33cb334ef13f2e
	.xword	0xe049ca54a2d27edc
	.xword	0x350cc23d8d7fd795
	.xword	0x7ca232ba3ada1714
	.xword	0xf69684dad4181e19
	.xword	0x791d719bbd00c245
	.xword	0x95eb1ede974f9ef7
	.xword	0xcd6e56d3666f8cf8
	.xword	0xa509ce9ad322cd5f
	.xword	0x30335efa70e5bd1b
	.xword	0x350e13ecbb2762bf
	.align 0x80000
	.data
data_start_7:

	.xword	0x9f510f12d0528e49
	.xword	0xea367820f2b7eaea
	.xword	0xa20c959b1f90c6ce
	.xword	0x80f48639019536db
	.xword	0xaa5ab72025856970
	.xword	0x049946ba46aa6432
	.xword	0x53af671786433bca
	.xword	0xb8907670859b34ef
	.xword	0x02ee4d4615f6aac4
	.xword	0x7dc45e61d8dc1af6
	.xword	0x06f4a90cb6c869d9
	.xword	0x0677bb43ae0e1b54
	.xword	0x93d8b1562154782b
	.xword	0x92f2bdcadb0aa6cd
	.xword	0x4847bee666908b21
	.xword	0x24896712947fd7ae
	.xword	0x375ea132b9e1f0a3
	.xword	0x75aa7770495d5772
	.xword	0xe4e403a3a57113e5
	.xword	0x0a88872752594b91
	.xword	0x2723487356e646cd
	.xword	0x44627086afe38286
	.xword	0xc9267bbbfff90634
	.xword	0xcfc12b5f9a79b57d
	.xword	0x29e9839f2c817305
	.xword	0x05f2fd6a6b1dbe6e
	.xword	0xb63ed7582b937e13
	.xword	0xde1b48f895751e49
	.xword	0x542ec4efab6a120a
	.xword	0x6d0f28d351180868
	.xword	0x08bc14197f7cad31
	.xword	0xd93452ef92bfd985
	.xword	0x135fb6a8fd2b416c
	.xword	0x75986c798e2b43aa
	.xword	0x78f134a104ddde60
	.xword	0x62016664f9643bb1
	.xword	0xcf78108d50d0b4f5
	.xword	0x16c2398dc2dcc395
	.xword	0x0729f386699c9475
	.xword	0xc97ad79e3bd1f501
	.xword	0xd56b8b11cba14fdd
	.xword	0x4034b15a8603c810
	.xword	0x03e14e51f658933f
	.xword	0x48d34dfce344b104
	.xword	0x61901a63e826c0eb
	.xword	0xb9495c0f0bdec50c
	.xword	0x585cea434a969a79
	.xword	0x7542959e6049c9d7
	.xword	0x0f135b63fe9bb5ec
	.xword	0x979b37be13504946
	.xword	0x19ef25930408f6bb
	.xword	0xdf050a0362a0a1e3
	.xword	0xd1e6edae612364d6
	.xword	0x0d82d03bb87dbac6
	.xword	0x1742d169aa59a818
	.xword	0x5cd2b717c1e21fc5
	.xword	0xeda1e9050db7f51c
	.xword	0xa173e22cd395e14a
	.xword	0xe03121f2a89f4c76
	.xword	0x26883a262f1e3a11
	.xword	0xdc49d4e564e74610
	.xword	0xe46a77690be99c33
	.xword	0xe205318110743e40
	.xword	0xea3a9d523e240b91
	.xword	0x1523d306c8711eb5
	.xword	0x5dc2f8a7bb44f2ca
	.xword	0x1e14e6d8a5700c21
	.xword	0x68ac292e763f0219
	.xword	0x7d3fcd122c3d35c4
	.xword	0xd876e96965ef65a9
	.xword	0x2bab1e23b7aecdd5
	.xword	0x459b0f30c4e855d3
	.xword	0x5af3ab58635f0605
	.xword	0x611b045e6e843312
	.xword	0x40247ad7d9ee9259
	.xword	0x05c57c2d4c4d00cc
	.xword	0xcf362dbb292f458d
	.xword	0x23bdc1e2938cea4b
	.xword	0xd219ae5a092cb448
	.xword	0x36f60f079d8a79c7
	.xword	0x401aea9f7922a840
	.xword	0xdfe25a9b96140476
	.xword	0xfa46cd7ddaaf1286
	.xword	0xcdece8fa7a22e7ee
	.xword	0x6bd83e2537d5a4b2
	.xword	0x47d66e163b75dc0c
	.xword	0x6f4fca39ac2915c4
	.xword	0xc64b2839c227c596
	.xword	0x45791282ec1837c6
	.xword	0xcbc2307e89d40780
	.xword	0x00e81b2964059860
	.xword	0x3af843b7d1aecbf0
	.xword	0x02c6f82fba89850b
	.xword	0x689c2ed7c8caf1cf
	.xword	0xa76727849999d407
	.xword	0xdb75f59d82d7e945
	.xword	0xf8d6dacfd41d6a3f
	.xword	0x30df30d79a77066c
	.xword	0x3c13a7ea40f89a03
	.xword	0x564c0bb13452bc7d
	.xword	0x80314b2ce0c8beff
	.xword	0xcdfbf60eb35bec8c
	.xword	0xca8918efe9469276
	.xword	0x354239b1265fae33
	.xword	0x78e9c4d643432696
	.xword	0x8c95de0e2f4143b3
	.xword	0xf2b757276233fb16
	.xword	0x7dfebdad37501b20
	.xword	0xb4e5f59da1b978bf
	.xword	0x235bee5b1f1269bc
	.xword	0x7b16ae0750e22aa8
	.xword	0xb2741a6748b9f3a0
	.xword	0x60b899bdd97d9662
	.xword	0x74bc9a2193e2068b
	.xword	0xfa24eb65a23f0615
	.xword	0xd4035b6db816d7cc
	.xword	0x2a96c2eab39e25b4
	.xword	0x046e666520a00d07
	.xword	0x5c8d53fddb51f93b
	.xword	0x4f46b71dd2d738d8
	.xword	0x5a4c92fdbdb7deb9
	.xword	0xdcb2868668759a9c
	.xword	0x1bfb6819fd71508e
	.xword	0xf57c4fd2dfe54b0b
	.xword	0x869519b1b7dbdab0
	.xword	0xb17c5c062638053a
	.xword	0x834a01eebed9c518
	.xword	0xcbdfc6a162c714cb
	.xword	0x26b327d4c0d5425f
	.xword	0x19edf1b20750bf40
	.xword	0x01f60321bfcf3481
	.xword	0xd6564107496f6a18
	.xword	0xe890acae3486d2c2
	.xword	0x648a3ea80f844607
	.xword	0xe4c0904070299bfc
	.xword	0x5a50aa3a42b2387b
	.xword	0x1db51c6dd547bccf
	.xword	0x6bc111fde1f6ec67
	.xword	0x1b9fc2abe9ec5003
	.xword	0xa815a473059510f4
	.xword	0xf9b18e50b249737e
	.xword	0xfe4a14e12310b8e8
	.xword	0xfacba26326f06d26
	.xword	0x7e470b7588356a0e
	.xword	0x5cab47a2df0d62ce
	.xword	0x9b84c1b8c2342e39
	.xword	0xd1b2486ee8f0a413
	.xword	0x85fb27fe077fd162
	.xword	0xc9cd87d3cb567fc8
	.xword	0xa15ce1d718275a61
	.xword	0x39836a8c7a7cc16d
	.xword	0xdc92957d92227eb2
	.xword	0x7bafc305f22281ec
	.xword	0xa74a40d637ce0af2
	.xword	0x5a400c3179e6f96f
	.xword	0x516bd162f84e6275
	.xword	0x9bddb657a8a5e62e
	.xword	0x81851c06a1f0420f
	.xword	0x725b4817a7159e5a
	.xword	0x8ae59b7027257df3
	.xword	0xc80404ae9f43194a
	.xword	0x38b21c17c8c5e7b5
	.xword	0x8728ff950df209d5
	.xword	0xe64dfb787dfdb09f
	.xword	0x3f8b8c46a6311d4d
	.xword	0x72004dd12b6cf166
	.xword	0xe24f6e9c0a473c58
	.xword	0x238e392de4263b09
	.xword	0x2b9a65b9f31a061d
	.xword	0x84c731ee8e24d03b
	.xword	0xe768d9c431f7b0b7
	.xword	0x92b5ee3d2ebd0b71
	.xword	0x555bc1fb815ce733
	.xword	0xccbd3de4fcfbdf5c
	.xword	0x71b70216bb13235a
	.xword	0xfccca0330c496112
	.xword	0x6099250bc8ce2cce
	.xword	0x8c03d6b4be1f4cb8
	.xword	0x1c858b5b8920466e
	.xword	0x5c7f92b071f3b2cc
	.xword	0xf57d2970ddf92093
	.xword	0xf454b79cbc4241ff
	.xword	0x52431dffd749d6af
	.xword	0xb16742363f550748
	.xword	0x2481a37ad7a46f6f
	.xword	0x26263844573640d1
	.xword	0xa71993392342d436
	.xword	0x1dd2d09bd5fa0966
	.xword	0x8c70b2bcb53cfbd4
	.xword	0x9c46e9e4e0100e1c
	.xword	0x4a961032efd33b59
	.xword	0x9e8e4c918589bec6
	.xword	0xf95e7653f7a15933
	.xword	0x198034d1b9a301f7
	.xword	0x9958757d29c9f5f4
	.xword	0x64920863618d09dd
	.xword	0x7eb933d6dcbdc002
	.xword	0x69f755695a33a3fd
	.xword	0x5e2849ce7756f694
	.xword	0xe8c8102621cc9d73
	.xword	0x2b254d69c3736dd0
	.xword	0xd5f2d2da8187bd36
	.xword	0x66a8598639fa0ef0
	.xword	0x9436a25d0316e251
	.xword	0x0755f8e37036ad6a
	.xword	0xf3e9e65f777fe1d5
	.xword	0xc83928eb7538dec3
	.xword	0x2b06348b4a19faa8
	.xword	0x239be7db5b01c2ee
	.xword	0x5e59e7b319c0da73
	.xword	0x5694fb23769008bc
	.xword	0x1b5fce6aa6d5d9c7
	.xword	0x4dd7d27f11efa84a
	.xword	0x4cd5f883cfc1f537
	.xword	0xed7e88c7f8a45987
	.xword	0x90845265f71315e6
	.xword	0x84dbe0e66f478ee0
	.xword	0x3d241b74b1083123
	.xword	0x9dd22e00e0d56f72
	.xword	0x94afb13531094247
	.xword	0x5103e3e32949083c
	.xword	0x3f510e8fe46042ff
	.xword	0x64f14aac86d87676
	.xword	0x8bde47e5f11cfc4f
	.xword	0xe9e81d139b360de5
	.xword	0x405fcacbac6b93bb
	.xword	0xac1ada9959fc070f
	.xword	0x801435044f9c958a
	.xword	0x7b50f5030d2871c7
	.xword	0xca39bd792ddcc8f8
	.xword	0x818a97dbc0771d29
	.xword	0xaf180870ac457ccf
	.xword	0xb49e39d320b54602
	.xword	0x05cc3c5efb27a006
	.xword	0x4f9c805a343e1de4
	.xword	0xa5313c69238f57d6
	.xword	0x3ad67126052a7d4d
	.xword	0xf5141f609e29c8e2
	.xword	0xb3e5f42cdaf59c34
	.xword	0x6a2e9c2e9dcf17a7
	.xword	0x95b48db9ed7025ca
	.xword	0x4926253d8d450387
	.xword	0x723c6d71ac67ead7
	.xword	0xef63021d3cb40353
	.xword	0xcf00b8a2cc034ea1
	.xword	0xbfb5b264fa677b96
	.xword	0x49780f3f7f3b21ce
	.xword	0x86f0fee31e3e6dea
	.xword	0xad82b1f888074007
	.xword	0x068591984b915713
	.xword	0xb9cc6a802b76570a
	.xword	0xd232a7adcaac4db9
	.xword	0x5ea43d281409ec6c
	.xword	0xd7eeb47c7ef826c4
	.xword	0x16c005598d82483d
	.xword	0xc9ffe7ae73723f0e



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
!!#   int iob_intr_cnt = 0;
!!#   int cpu_intr_cnt = 0;
!!#   int asi_reg_rdcnt = 0;
!!#   int asi_reg_wrcnt = 0;
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
!!#   IJ_bind_thread_group("diag.j", 36, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 37, th_wn,    0x1);
!!#   IJ_bind_thread_group("diag.j", 38, th_fp,    0x2);
!!#   IJ_bind_thread_group("diag.j", 39, th_ld,    0x4);
!!#   IJ_bind_thread_group("diag.j", 40, th_st,    0x8);
!!#   IJ_bind_thread_group("diag.j", 41, th_ldst,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 43,"{16}" );
!!#   IJ_set_rvar ("diag.j", 44, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 45, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // ASR read/write parametes
!!#   IJ_set_rvar ("diag.j", 53, Rv_asi_va, "{ 0x0..0x38, 0x3c0..0x3c8 }");
!!#   IJ_set_ropr_fld ("diag.j", 54, Rop_asi_reg, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Rop_asi_reg, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Rop_asi_reg, Ft_Rd,  "{24..31}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Rop_asi_reg, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 58, Rop_asi_reg, Ft_Imm_Asi, "{0x72, 0x73, 0x74, 0x25, 0x20, 0x4f}");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 61, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 63, Rv_intr_disp_reg, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'b000rr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!# 
!!#   IJ_set_rvar ("diag.j", 72, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 75, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 78, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 79, Rv_ldst_var, "{16..23}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 85, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r0");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 88, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 89, Rop_tl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 90, Rop_tl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_tl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 92, Rop_tl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_set_rvar ("diag.j", 94, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 95, Rop_gl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 96, Rop_gl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_gl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 98, Rop_gl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 100, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 103, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 104, th_all, "\twrpr\t%%g0, 0, %%pil\n");
!!# 
!!#   IJ_printf ("diag.j", 106, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 107, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 109, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 111, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 112, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 113, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 114, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 115, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 116, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 117, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   // VA watchpoint enable
!!#   IJ_printf ("diag.j", 120, th_all, "\tsetx\t%%hi(0x1ffe0000f), %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 121, th_all, "\tstxa\t%%g2, [%%g0] 0x45\n");
!!#   IJ_printf ("diag.j", 122, th_all, "\tmov\t0x38, %%g3\n");
!!#   IJ_printf ("diag.j", 123, th_ldst, "\tsetx\tdata_start_0, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 124, th_all, "\tstxa\t%%g2, [%%g3] 0x58\n");
!!# 
!!#   // Initialize the scratch pad registers
!!#   IJ_printf ("diag.j", 127, th_all, "Init_scratchpad:\n");
!!#   IJ_printf ("diag.j", 128, th_all, "\twr\t%%g0, 0x4f, %%asi\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 130, th_all, "\tstxa\t%%l%0d, [0x%0x] %%asi\n", i, (i*8));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 133, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 136,0x2, 0x4, 0x8, -1);;
!!# 
!!#   // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 140, th_ldst, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 147,0xf);
!!#   IJ_th_start ("diag.j", 148,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 150, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 151, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 153, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 154, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 156, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	spec_inst
!!# 	| comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 196, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 	  IJ_generate ("diag.j", 200, th_wn, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 	  IJ_generate ("diag.j", 204, th_fp, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 	  IJ_generate ("diag.j", 208, th_ld, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 	  IJ_generate ("diag.j", 212, th_st, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 216, th_ldst, $1);
!!# 	}
!!# ;
!!# 
!!# spec_inst:
!!# 	iob_intr
!!# 	| cpu_intr
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap	 %rvar  Rv_low_wt
!!# ;
!!# 
!!# comm_inst:
!!# 	alu
!!# 	| read_priv_reg	 %rvar  Rv_low_wt
!!# 	| write_priv_reg %rvar  Rv_low_wt
!!# 	| read_asi_reg
!!# 	| write_asi_reg
!!# 	| change_priv	%rvar  Rv_mid_wt
!!# ;
!!# 
!!# change_priv:
!!# 	mHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 239, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!# 	}
!!# 	| mNONHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 243, th_ldst, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	}
!!# 	| mTL1
!!# 	{
!!#           IJ_printf ("diag.j", 247, th_ldst, "\tta\tT_CHANGE_TO_TL1\n");
!!# 	}
!!# 	| mTL0
!!# 	{
!!#           IJ_printf ("diag.j", 251, th_ldst, "\tta\tT_CHANGE_TO_TL0\n");
!!# 	}
!!# ;
!!# 
!!# set_va: tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 257, th_ldst, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#           IJ_printf ("diag.j", 258, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 259, th_ldst, "\tmov\t0x38, %%g1\n");
!!#           IJ_printf ("diag.j", 260, th_ldst, "\tstxa\t%%r%d, [%%g1] 0x58\n", IJ_get_rvar_val32 ("diag.j", 260, Rv_ldst_var));
!!#         } 
!!# ;
!!# 
!!# write_priv_reg:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_reg: 
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
!!# read_asi_reg:
!!# 	tLDXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "T%y_asi_reg_rd_%d:\n", asi_reg_rdcnt);
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_rdcnt++;
!!# 	}
!!# ;
!!# 
!!# write_asi_reg:
!!# 	tSTXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 301, th_all, "T%y_asi_reg_wr_%d:\n", asi_reg_wrcnt);
!!#           IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_wrcnt++;
!!# 	}
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I
!!# 	| tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!# 	| tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I | tLDXA_I
!!# 	| mBLK_LD
!!# 	{
!!#           IJ_printf ("diag.j", 314, th_fp, "\tlda\t[%%r%d + %%g0] 0xf0, %%f2\n", IJ_get_rvar_val32 ("diag.j", 314, Rv_ldst_var));
!!# 	}
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# 	| tSTBA_R | tSTHA_R | tSTWA_R
!!# 	| tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
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
!!# 	tSAVE_I | tSAVE_R
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 348, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 349, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 350, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 351, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 352, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 357, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 358, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 359, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 360, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 361, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 362, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 376, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 377, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 378, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 379, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 380, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# 
!!# cpu_intr:
!!# 	mCPU_INTR
!!# 	{
!!#           IJ_printf ("diag.j", 387, th_all, "cpu_intr_%y_%d:\n", cpu_intr_cnt);
!!# 	  IJ_printf ("diag.j", 388, th_all, "\tsetx\t0x%llrx, %%g1, %%o0\n", Rv_intr_disp_reg);
!!#           IJ_printf ("diag.j", 389, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	  cpu_intr_cnt++;
!!# 	}
!!# ;
!!# 
!!# iob_intr:
!!# 	mIOB_INT
!!#         {
!!#           IJ_printf ("diag.j", 397, th_all, "iob_intr_%y_%d:\n", iob_intr_cnt);
!!#           IJ_printf ("diag.j", 398, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.iob_intr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", iob_intr_cnt, Rv_intr_vect);
!!#           iob_intr_cnt++;
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
